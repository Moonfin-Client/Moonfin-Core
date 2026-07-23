// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'ПОДЕШАВАЊА НАЛОГА';

  @override
  String get interfaceLanguage => 'Језик интерфејса';

  @override
  String get systemLanguageDefault => 'Подразумевано за систем';

  @override
  String get signIn => 'Пријавите се';

  @override
  String get empty => 'Празно';

  @override
  String connectingToServer(String serverName) {
    return 'Повезивање са сервером $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Лозинка';

  @override
  String get username => 'Корисничко име';

  @override
  String get email => 'Емаил';

  @override
  String get quickConnectInstruction =>
      'Унесите овај код на веб контролној табли вашег сервера:';

  @override
  String get waitingForAuthorization => 'Чека се овлашћење...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Сервер је недоступан';

  @override
  String get loginFailed => 'Пријава није успела';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect није доступан: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect није доступан ($status): $detail';
  }

  @override
  String get whosWatching => 'ко гледа?';

  @override
  String get addUser => 'Додај корисника';

  @override
  String get selectServer => 'Изаберите Сервер';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin верзија $version';
  }

  @override
  String get savedServers => 'Сачувани сервери';

  @override
  String get discoveredServers => 'Откривени сервери';

  @override
  String get noneFound => 'Није пронађен ниједан';

  @override
  String get unableToConnectToServer => 'Није могуће повезати се са сервером';

  @override
  String get addServer => 'Додај сервер';

  @override
  String get embyConnect => 'Emby Connect';

  @override
  String get removeServer => 'Уклони сервер';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Уклонити „$serverName” са листе сервера?';
  }

  @override
  String get cancel => 'Откажи';

  @override
  String get remove => 'Уклони';

  @override
  String get connectToServer => 'Повежите се са сервером';

  @override
  String get serverAddress => 'Адреса сервера';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Повежите се';

  @override
  String get secureStorageUnavailable => 'Безбедно складиштење није доступно';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin није могао да приступи системском привеску за кључеве. Пријава може да се настави, али безбедно чување токена можда неће бити доступно док не откључате привезак.';

  @override
  String get ok => 'ОК';

  @override
  String get settingsAppearanceTheme => 'Апп Тхеме';

  @override
  String get detailScreenStyle => 'Стил екрана са детаљима';

  @override
  String get detailScreenStyleSubtitle =>
      'Класични је оригинални центрирани Moonfin распоред. Модерни је прилагодљив биоскопски распоред.';

  @override
  String get detailScreenStyleMoonfin => 'Класични';

  @override
  String get detailScreenStyleModern => 'Модерни';

  @override
  String get expandedTabs => 'Проширене картице';

  @override
  String get expandedTabsSubtitle =>
      'Аутоматски приказуј садржај картице док прегледате картице. Искључите за ручно отварање и затварање сваке картице.';

  @override
  String get showTechnicalDetails => 'Приказати техничке детаље?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Прикажи кодек, резолуцију и податке о стриму у сажетку на банеру';

  @override
  String get recommendationSystem => 'Систем препорука';

  @override
  String get recommendationSystemSubtitle =>
      'Користите алгоритам локалне библиотеке Moonfin Recommends или онлајн TMDb метрике сличности. Напомена: онлајн препоруке захтевају Seerr интеграцију.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb сличност';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Применити ограничење родитељске оцене?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Ограничи предлоге функције Moonfin Recommends према родитељској оцени изабраног садржаја';

  @override
  String get interfaceStyle => 'Стил интерфејса';

  @override
  String get interfaceStyleSubtitle =>
      'Аутоматски се прилагођава вашем уређају. Изаберите Apple или Material за жељени изглед.';

  @override
  String get interfaceStyleAutomatic => 'Аутоматски';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Квалитет стакла';

  @override
  String get glassQualitySubtitle =>
      'Аутоматски бира најбољи ефекат стакла за овај уређај. Пуни намеће право замућење, а Смањени користи лагано стакло које штеди GPU.';

  @override
  String get glassQualityAuto => 'Аутоматски';

  @override
  String get glassQualityFull => 'Пуни';

  @override
  String get glassQualityReduced => 'Смањени';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Примените потпуно прилагођену тему и бирајте између корисничког интерфејса инспирисаног Apple-ом или Material-ом.';

  @override
  String get customThemeTitle => 'Прилагођена тема';

  @override
  String get customThemeSubtitle =>
      'Прилагођене теме мењају визуелне елементе у целом Moonfin-у. Изаберите једну од ових опција која одговара вашем стилу.';

  @override
  String get keyboardPreferSystemIme => 'Преферирај системску тастатуру';

  @override
  String get keyboardPreferSystemImeDescription =>
      'За унос текста подразумевано користи метод уноса вашег уређаја';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => 'Оригинални, чист Moonfin изглед.';

  @override
  String get themeNeonPulse => 'Неон Пулсе';

  @override
  String get themeNeonPulseSubtitle =>
      'Синтхваве стил са магента сјајем, цијан текстом и јачим хромираним контрастом';

  @override
  String get themeGlass => 'Стакло';

  @override
  String get themeGlassSubtitle =>
      'Стил течног стакла са покретном градијентном позадином, матираним површинама и Apple-плавим акцентом';

  @override
  String get theme8BitHero => '8-битни херој';

  @override
  String get theme8BitHeroSubtitle =>
      'Ретро pixel-art стил са израженом палетом, блоковским ивицама, оштрим сенкама и пиксел фонтом';

  @override
  String get embyConnectSignInSubtitle =>
      'Пријавите се својим Emby Connect налогом';

  @override
  String get emailOrUsername => 'Е-маил или корисничко име';

  @override
  String get selectAServer => 'Изаберите сервер';

  @override
  String get tryAgain => 'Покушајте поново';

  @override
  String get noLinkedServers =>
      'Ниједан сервер није повезан са овим Emby Connect налогом';

  @override
  String get invalidEmbyConnectCredentials =>
      'Неисправни Emby Connect подаци за пријаву';

  @override
  String get invalidEmbyConnectLogin =>
      'Неисправно Emby Connect корисничко име или лозинка';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сервер не подржава Emby Connect размену';

  @override
  String get embyConnectNetworkError =>
      'Мрежна грешка при повезивању са Emby Connect-ом или изабраним сервером';

  @override
  String get loadingLinkedServers => 'Учитавање повезаних сервера...';

  @override
  String get connectingToServerEllipsis => 'Повезивање са сервером...';

  @override
  String get noReachableAddress => 'Није наведена адреса која је доступна';

  @override
  String get invalidServerExchangeResponse =>
      'Неважећи одговор са крајње тачке размене сервера';

  @override
  String unableToConnectTo(String target) {
    return 'Повезивање са $target није успело';
  }

  @override
  String get exitApp => 'Изаћи из Moonfin-а?';

  @override
  String get exitAppConfirmation => 'Да ли сте сигурни да желите да изађете?';

  @override
  String get exit => 'Изађи';

  @override
  String get gameMenu => 'Мени';

  @override
  String get gamePaused => 'Паузирано';

  @override
  String get gameSaveState => 'Сачувај стање';

  @override
  String get games => 'Игре';

  @override
  String get gameLoadState => 'Учитај стање';

  @override
  String get gameFastForward => 'Убрзано напред';

  @override
  String get gameEmulatorSettings => 'Подешавања емулатора';

  @override
  String get gameNoCoreOptions => 'Ово језгро нема подесивих опција.';

  @override
  String get gameHoldToOpenMenu => 'Држите за отварање менија';

  @override
  String get gamePlaybackUnsupported =>
      'Покретање игара још није подржано на овом уређају.';

  @override
  String get noHomeRowsLoaded => 'Ниједан почетни ред није могао да се учита';

  @override
  String get noHomeRowsHint =>
      'Покушајте да освежите или смањите активне кућне одељке.';

  @override
  String get retryHomeRows => 'Поново покушајте са почетним редовима';

  @override
  String get guide => 'Водич';

  @override
  String get recordings => 'Снимци';

  @override
  String get schedule => 'Распоред';

  @override
  String get series => 'Серије';

  @override
  String get noItemsFound => 'Нема пронађених ставки';

  @override
  String get home => 'Почетна';

  @override
  String get browseAll => 'Прегледај све';

  @override
  String get genres => 'Жанрови';

  @override
  String get collectionPlaceholder => 'Овде ће се појавити ставке колекције';

  @override
  String get browseByLetter => 'Прегледај по писму';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Овде ће се појавити листање по абецедном реду';

  @override
  String get suggestions => 'Предлози';

  @override
  String get suggestionsPlaceholder => 'Предложене ставке ће се појавити овде';

  @override
  String get failedToLoadLibraries => 'Учитавање библиотека није успело';

  @override
  String get noLibrariesFound => 'Није пронађена ниједна библиотека';

  @override
  String get library => 'Библиотека';

  @override
  String get displaySettings => 'Дисплаи Сеттингс';

  @override
  String get allGenres => 'Сви жанрови';

  @override
  String get noGenresFound => 'Није пронађен ниједан жанр';

  @override
  String failedToLoadFolderError(String error) {
    return 'Учитавање фасцикле није успело: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Овај фолдер је празан';

  @override
  String itemCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ставки',
      few: '$count ставке',
      one: '$count ставка',
    );
    return '$_temp0';
  }

  @override
  String get failedToLoadFavorites => 'Учитавање фаворита није успело';

  @override
  String get retry => 'Покушајте поново';

  @override
  String get noFavoritesYet => 'Још нема фаворита';

  @override
  String get favorites => 'Фаворитес';

  @override
  String totalCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ставки',
      few: '$count ставке',
      one: '$count ставка',
    );
    return '$_temp0';
  }

  @override
  String get continuing => 'Настављамо';

  @override
  String get ended => 'Завршено';

  @override
  String get sortAndFilter => 'Сортирај и филтрирај';

  @override
  String get type => 'Тип';

  @override
  String get sortBy => 'Сорт Би';

  @override
  String get display => 'Дисплаи';

  @override
  String get imageType => 'Тип слике';

  @override
  String get posterSize => 'Величина постера';

  @override
  String get small => 'Мала';

  @override
  String get medium => 'Средње';

  @override
  String get large => 'Велики';

  @override
  String get extraLarge => 'Ектра Ларге';

  @override
  String libraryGenresTitle(String name) {
    return '$name — жанрови';
  }

  @override
  String get views => 'Погледи';

  @override
  String get albums => 'Албумс';

  @override
  String get albumArtists => 'Албум Артистс';

  @override
  String get artists => 'Извођачи';

  @override
  String get bookmarks => 'Боокмаркс';

  @override
  String get noSavedBookmarks =>
      'Још увек нема сачуваних обележивача за овај наслов.';

  @override
  String get openBook => 'Отвори књигу';

  @override
  String get chapter => 'Поглавље';

  @override
  String get page => 'Страница';

  @override
  String get bookmark => 'Боокмарк';

  @override
  String get justNow => 'Управо сада';

  @override
  String minutesAgo(int count) {
    return 'пре $count мин';
  }

  @override
  String hoursAgo(int count) {
    return 'пре $count ч';
  }

  @override
  String daysAgo(int count) {
    return 'пре $count д';
  }

  @override
  String get discoverySubjects => 'Дисцовери Субјецтс';

  @override
  String get pickDiscoverySubjects =>
      'Изаберите које садржаје тема желите да прикажете у Дисцовер-у.';

  @override
  String get apply => 'Примени';

  @override
  String get openLink => 'Отворите везу';

  @override
  String get scanWithYourPhone => 'Скенирајте телефоном';

  @override
  String get audiobookGenres => 'Аудиобоок Генрес';

  @override
  String get pickAudiobookGenres =>
      'Изаберите које жанрове желите да прикажете у Аудиобоок Дисцовер.';

  @override
  String get discoverAudiobooks => 'Откријте аудио-књиге';

  @override
  String get librivoxDescription =>
      'Популарни наслови у јавном власништву са LibriVox-а.';

  @override
  String titlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count наслова',
      few: '$count наслова',
      one: '$count наслов',
    );
    return '$_temp0';
  }

  @override
  String get scrollLeft => 'Померите се лево';

  @override
  String get scrollRight => 'Помери десно';

  @override
  String get couldNotLoadGenre => 'Тренутно није могуће учитати овај жанр.';

  @override
  String get continueReading => 'Наставите са читањем';

  @override
  String get savedHighlights => 'Сачуване најважније ствари';

  @override
  String get continueListening => 'Наставите са слушањем';

  @override
  String get listen => 'Слушај';

  @override
  String get resume => 'Настави';

  @override
  String get failedToLoadLibrary => 'Учитавање библиотеке није успело';

  @override
  String get popularNow => 'Популарно сада';

  @override
  String get savedForLater => 'Сачувано за касније';

  @override
  String get topListens => 'Топ Листенс';

  @override
  String get unreadDiscoveries => 'Непрочитана открића';

  @override
  String get pickUpAgain => 'Покупите поново';

  @override
  String get bookHighlightsDescription =>
      'Ваше књиге са истакнутим деловима, омиљеним садржајима или напретком читања.';

  @override
  String get handPickedFromLibrary => 'Ручно изабрано из ваше библиотеке.';

  @override
  String get handPickedFromListeningQueue =>
      'Ручно изабрано из вашег реда за слушање.';

  @override
  String get booksWithHighlights =>
      'Књиге са истакнутим деловима, омиљеним или напретком читања.';

  @override
  String get jumpBackNarration =>
      'Вратите се у нарацију без тражења свог места.';

  @override
  String get unreadBooksReady =>
      'Непрочитане књиге спремне за следећи мирни сат.';

  @override
  String get quickAccessFavorites =>
      'Брз приступ књигама којима се стално враћате.';

  @override
  String get searchAudiobooks => 'Претражи аудио књиге';

  @override
  String get searchYourLibrary => 'Претражите своју библиотеку';

  @override
  String get pickUpStory => 'Наставите причу тамо где сте стали';

  @override
  String get savedPlacesChapters => 'Ваша сачувана места и недовршена поглавља';

  @override
  String authorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аутора',
      few: '$count аутора',
      one: '$count аутор',
    );
    return '$_temp0';
  }

  @override
  String genresCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count жанрова',
      few: '$count жанра',
      one: '$count жанр',
    );
    return '$_temp0';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% завршено';
  }

  @override
  String get readyWhenYouAre => 'Спремни кад сте';

  @override
  String get details => 'Детаљи';

  @override
  String get listeningRoom => 'Соба за слушање';

  @override
  String get bookmarksAndProgress => 'Боокмаркс & Прогресс';

  @override
  String titlesArrangedForBrowsing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count наслова распоређено за прегледање са нагласком на читању.',
      few: '$count наслова распоређена за прегледање са нагласком на читању.',
      one: '$count наслов распоређен за прегледање са нагласком на читању.',
    );
    return '$_temp0';
  }

  @override
  String get titles => 'Наслови';

  @override
  String get allTitles => 'Сви наслови';

  @override
  String get authors => 'Аутори';

  @override
  String get browseByAuthor => 'Прегледај по аутору';

  @override
  String get browseByGenre => 'Прегледај по жанру';

  @override
  String get discover => 'Откријте';

  @override
  String get trendingTitlesOpenLibrary =>
      'Популарни наслови по темама са сервиса Open Library.';

  @override
  String get noBookmarkedItems => 'Још нема обележених ставки';

  @override
  String get nothingMatchesSection =>
      'Још ништа не одговара овом одељку. Пробајте другу картицу или се вратите након што се синхронизација библиотеке заврши.';

  @override
  String get audiobooks => 'Аудио књиге';

  @override
  String noLabelFound(String label) {
    return 'Нема резултата за $label';
  }

  @override
  String get folder => 'Фолдер';

  @override
  String get filters => 'Филтери';

  @override
  String get readingStatus => 'Статус читања';

  @override
  String get playedStatus => 'Плаиед Статус';

  @override
  String get readStatus => 'Читај';

  @override
  String get watched => 'Одгледано';

  @override
  String get unread => 'Непрочитано';

  @override
  String get unwatched => 'Неодгледано';

  @override
  String get seriesStatus => 'Статус серије';

  @override
  String get allLibraries => 'Све библиотеке';

  @override
  String get books => 'Књиге';

  @override
  String get latestBooks => 'Најновије књиге';

  @override
  String get latestAudiobooks => 'Најновије аудио-књиге';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count књига',
      few: '$count књиге',
      one: '$count књига',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Књига';

  @override
  String get bookFormatAudiobook => 'Аудио-књига';

  @override
  String bookPercentRead(int percent) {
    return '$percent% прочитано';
  }

  @override
  String bookTimeLeft(String time) {
    return 'још $time';
  }

  @override
  String get bookHeroRead => 'Читај';

  @override
  String get bookHeroListen => 'Слушај';

  @override
  String get author => 'Аутор';

  @override
  String get unknownAuthor => 'Непознати аутор';

  @override
  String get uncategorized => 'Унцатегоризед';

  @override
  String get overview => 'Преглед';

  @override
  String get noLibrivoxDescription =>
      'LibriVox још увек нема опис за овај наслов.';

  @override
  String get readers => 'Реадерс';

  @override
  String get openLinks => 'Отворите везе';

  @override
  String get librivoxPage => 'LibriVox страница';

  @override
  String get internetArchive => 'Интернет Арцхиве';

  @override
  String get rssFeed => 'РСС Феед';

  @override
  String get downloadZip => 'Преузмите Зип';

  @override
  String sectionCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count одељака',
      few: '$count одељка',
      one: '$count одељак',
    );
    return '$_temp0';
  }

  @override
  String firstPublished(int year) {
    return 'Први пут објављено $year.';
  }

  @override
  String get noOpenLibraryOverview =>
      'Open Library још увек нема преглед за овај наслов.';

  @override
  String get subjects => 'Субјекти';

  @override
  String get all => 'Све';

  @override
  String booksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count књига',
      few: '$count књиге',
      one: '$count књига',
    );
    return '$_temp0';
  }

  @override
  String get couldNotLoadSubject => 'Тренутно није могуће учитати ову тему.';

  @override
  String get audiobookDetails => 'Детаљи аудио књиге';

  @override
  String authorsCountTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аутора',
      few: '$count аутора',
      one: '$count аутор',
    );
    return '$_temp0';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудио-књига',
      few: '$count аудио-књиге',
      one: '$count аудио-књига',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Листа нумера';

  @override
  String get itemListPlaceholder => 'Овде ће се појавити листа ставки';

  @override
  String get failedToLoad => 'Учитавање није успело';

  @override
  String get delete => 'Обриши';

  @override
  String get save => 'Сачувај';

  @override
  String get moreLikeThis => 'Више попут овога';

  @override
  String get castAndCrew => 'Глумци и екипа';

  @override
  String get collection => 'Цоллецтион';

  @override
  String get episodes => 'Епизоде';

  @override
  String get nextUp => 'Нект Уп';

  @override
  String get seasons => 'Сезоне';

  @override
  String get chapters => 'поглавља';

  @override
  String get features => 'Карактеристике';

  @override
  String get movies => 'Филмови';

  @override
  String get musicVideos => 'Музички спотови';

  @override
  String get other => 'Остало';

  @override
  String get discography => 'Дисцограпхи';

  @override
  String get similarArtists => 'Симилар Артистс';

  @override
  String get tableOfContents => 'Садржај';

  @override
  String get tracklist => 'Листа нумера';

  @override
  String discNumber(int number) {
    return 'Диск $number';
  }

  @override
  String get biography => 'Биографија';

  @override
  String get authorDetails => 'Детаљи о аутору';

  @override
  String get noOverviewAvailable =>
      'Још увек није доступан преглед за овај наслов.';

  @override
  String get noBiographyAvailable => 'За овог аутора није доступна биографија.';

  @override
  String get noBooksFound => 'Нису пронађене књиге за овог аутора.';

  @override
  String get unableToLoadAuthorDetails =>
      'Тренутно није могуће учитати детаље о аутору.';

  @override
  String published(int year) {
    return 'Објављено $year.';
  }

  @override
  String get publicationDateUnknown => 'Датум објављивања непознат';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сезона',
      few: '$count сезоне',
      one: '$count сезона',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Завршава се у $time';
  }

  @override
  String get items => 'Ставке';

  @override
  String get extras => 'Додаци';

  @override
  String get behindTheScenes => 'Иза сцене';

  @override
  String get deletedScenes => 'Избрисане сцене';

  @override
  String get featurettes => 'Кратки прилози';

  @override
  String get interviews => 'Интервјуи';

  @override
  String get scenes => 'Сцене';

  @override
  String get shorts => 'Кратки филмови';

  @override
  String get trailers => 'Најаве';

  @override
  String timeRemaining(String time) {
    return 'још $time';
  }

  @override
  String endsIn(String time) {
    return 'Завршава се за $time';
  }

  @override
  String get view => 'Виев';

  @override
  String get resumeReading => 'Настави читање';

  @override
  String get read => 'Читај';

  @override
  String resumeFrom(String position) {
    return 'Настави од $position';
  }

  @override
  String get play => 'Пусти';

  @override
  String get startOver => 'Почни испочетка';

  @override
  String get restart => 'Поново покрени';

  @override
  String get readOffline => 'Читај ван мреже';

  @override
  String get playOffline => 'Играјте ван мреже';

  @override
  String get audio => 'Аудио';

  @override
  String get subtitles => 'Субтитлес';

  @override
  String get version => 'Версион';

  @override
  String get cast => 'Пребаци';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Најава';

  @override
  String get finished => 'Завршено';

  @override
  String get favorited => 'Фаворитед';

  @override
  String get favorite => 'Фаворите';

  @override
  String get playlist => 'Плаилист';

  @override
  String get downloaded => 'Преузето';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get downloadAll => 'Преузми све';

  @override
  String get download => 'Преузми';

  @override
  String get deleteDownloaded => 'Обриши Преузето';

  @override
  String get goToSeries => 'Идите на серију';

  @override
  String get editMetadata => 'Уреди метаподатке';

  @override
  String get less => 'Мање';

  @override
  String get more => 'Више';

  @override
  String get deleteItem => 'Избриши ставку';

  @override
  String get deletePlaylist => 'Избриши плејлисту';

  @override
  String get deletePlaylistMessage =>
      'Желите ли да избришете ову плејлисту са сервера?';

  @override
  String get deleteItemMessage =>
      'Желите ли да избришете ову ставку са сервера?';

  @override
  String get failedToDeletePlaylist => 'Брисање плејлисте није успело';

  @override
  String get failedToDeleteItem => 'Брисање ставке није успело';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Преименуј плејлисту';

  @override
  String get playlistName => 'Име плејлисте';

  @override
  String get deleteDownloadedAlbum => 'Избриши преузети албум';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Обрисати преузете песме за „$title”?';
  }

  @override
  String get downloadedTracksDeleted => 'Преузете нумере су избрисане';

  @override
  String get downloadedTracksDeleteFailed =>
      'Неке преузете нумере нису могле да се избришу';

  @override
  String get noTracksLoaded => 'Нема учитаних нумера';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Нема учитаних ставки: $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Преузимање: $title ($count ставки)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Да ли сте сигурни да желите да обришете „$name” са сервера? Ова радња се не може опозвати.';
  }

  @override
  String get itemDeleted => 'Ставка је избрисана';

  @override
  String get noPlayableTrailerFound =>
      'Није пронађен ниједан трејлер за репродукцију.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Неподржани формат књиге: .$extension';
  }

  @override
  String get audioTrack => 'Аудио Трацк';

  @override
  String get subtitleTrack => 'Субтитле Трацк';

  @override
  String get none => 'Ниједан';

  @override
  String get downloadSubtitlesLabel => 'Преузми титлове...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Претражите помоћу OpenSubtitles додатка';

  @override
  String get downloadSubtitles => 'Довнлоад Субтитлес';

  @override
  String get selectedSubtitleInvalid => 'Изабрани титл је неважећи.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Титл преузет и изабран: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Титл је преузет. Може проћи тренутак док се не појави, док Jellyfin освежава ставку.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Нису пронађени мрежни титлови за $language.';
  }

  @override
  String get selectVersion => 'Изаберите Верзија';

  @override
  String versionNumber(int number) {
    return 'Верзија $number';
  }

  @override
  String get downloadAllQuality => 'Преузмите све — Квалитет';

  @override
  String get downloadQuality => 'Довнлоад Куалити';

  @override
  String get originalFileNoReencoding =>
      'Оригинална датотека, без поновног кодирања';

  @override
  String get originalFilesNoReencoding =>
      'Оригиналне датотеке, без поновног кодирања';

  @override
  String get noEpisodesLoaded => 'Нема учитаних епизода';

  @override
  String downloadingItem(String name, String quality) {
    return 'Преузимање: $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Избришите преузете датотеке';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Обрисати локалне датотеке за $typeLabel?\n\nТиме ћете ослободити простор за складиштење. Можете их поново преузети касније.';
  }

  @override
  String get downloadedFilesDeleted => 'Преузете датотеке су избрисане';

  @override
  String get failedToDeleteFiles => 'Брисање датотека није успело';

  @override
  String get deleteFiles => 'Избриши датотеке';

  @override
  String get director => 'ДИРЕКТОР';

  @override
  String get directors => 'РЕДИТЕЉИ';

  @override
  String get writer => 'СЦЕНАРИСТА';

  @override
  String get writers => 'СЦЕНАРИСТИ';

  @override
  String get studio => 'СТУДИО';

  @override
  String studioMoreCount(int count) {
    return '+$count више';
  }

  @override
  String totalEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count епизода',
      few: '$count епизоде',
      one: '$count епизода',
    );
    return '$_temp0';
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
    return 'Поглавље $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count песама',
      few: '$count песме',
      one: '$count песма',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count поглавља',
      few: '$count поглавља',
      one: '$count поглавље',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Рођење: $date';
  }

  @override
  String died(String date) {
    return 'Смрт: $date';
  }

  @override
  String age(int age) {
    return 'Старост: $age';
  }

  @override
  String get showLess => 'Покажи мање';

  @override
  String get readMore => 'Прочитајте више';

  @override
  String get shuffle => 'Насумично';

  @override
  String get shuffleAllMusic => 'Насумично пусти сву музику';

  @override
  String get carSignInPrompt => 'Пријавите се на Moonfin на телефону';

  @override
  String get carServerUnreachable => 'Сервер није доступан';

  @override
  String downloadsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count преузимања',
      few: '$count преузимања',
      one: '$count преузимање',
    );
    return '$_temp0';
  }

  @override
  String get perfectMatch => 'Савршено подударање';

  @override
  String channelsCount(int count) {
    return '$count кан.';
  }

  @override
  String get mono => 'Моно';

  @override
  String get stereo => 'Стерео';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Радња „$action” за мрежне титлове захтева Jellyfin дозволу за управљање титловима за овог корисника.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Ова ставка није пронађена на серверу за радњу „$action” са мрежним титловима.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Радња „$action” за мрежне титлове није успела: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Радња „$action” за мрежне титлове није успела (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Радња „$action” за мрежне титлове није успела.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'све преузете епизоде за „$name”';
  }

  @override
  String get deleteSeasonFiles => 'све преузете епизоде ​​у овој сезони';

  @override
  String get stillWatching => 'Још увек гледате?';

  @override
  String get unableToLoadTrailerStream => 'Није могуће учитати трејлер стрим.';

  @override
  String get trailerTimedOut => 'Приколица је истекла током учитавања.';

  @override
  String get playbackFailedForTrailer =>
      'Репродукција овог трејлера није успела.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Пребацивање није доступно током репродукције ван мреже.';

  @override
  String castActionFailed(String label, String error) {
    return 'Радња „$label” није успела: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Подешавање јачине звука за Cast није успело: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Контроле – $label';
  }

  @override
  String get deviceVolume => 'Јачина звука уређаја';

  @override
  String get unavailable => 'Недоступно';

  @override
  String get pause => 'Пауза';

  @override
  String get syncPosition => 'Синц Поситион';

  @override
  String stopCast(String label) {
    return 'Заустави $label';
  }

  @override
  String get queueIsEmpty => 'Ред је празан';

  @override
  String trackNumber(int number) {
    return 'Песма $number';
  }

  @override
  String get remotePlayback => 'Ремоте Плаибацк';

  @override
  String get castingToGoogleCast => 'Пребацивање на Google Cast';

  @override
  String get castingViaAirPlay => 'Пребацивање преко AirPlay-а';

  @override
  String get castingViaDlna => 'Пребацивање преко DLNA';

  @override
  String secondsCount(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds секунди',
      few: '$seconds секунде',
      one: '$seconds секунда',
    );
    return '$_temp0';
  }

  @override
  String get longPressToUnlock => 'Дуго притисните за откључавање';

  @override
  String get off => 'Искључено';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Ауто';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Битрате Оверриде';

  @override
  String get audioDelay => 'Аудио Делаи';

  @override
  String delayMinusMs(int value) {
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
  }

  @override
  String get subtitleDelay => 'Субтитле Делаи';

  @override
  String get reset => 'Ресетуј';

  @override
  String get unknown => 'Непознато';

  @override
  String get playbackInformation => 'Информације о репродукцији';

  @override
  String get playback => 'Репродукција';

  @override
  String get playMethod => 'Плаи Метход';

  @override
  String get directPlay => 'Дирецт Плаи';

  @override
  String get directStream => 'Дирецт Стреам';

  @override
  String get transcoding => 'Трансцодинг';

  @override
  String get transcodeReasons => 'Трансцоде Реасонс';

  @override
  String get player => 'Плејер';

  @override
  String get container => 'Контејнер';

  @override
  String get bitrate => 'Битрате';

  @override
  String get video => 'Видео';

  @override
  String get resolution => 'Резолуција';

  @override
  String get hdr => 'ХДР';

  @override
  String get codec => 'Цодец';

  @override
  String get videoBitrate => 'Видео Битрате';

  @override
  String get track => 'Нумера';

  @override
  String get channels => 'Канали';

  @override
  String get audioBitrate => 'Аудио Битрате';

  @override
  String get sampleRate => 'Сампле Рате';

  @override
  String get format => 'Формат';

  @override
  String get external => 'Екстерни';

  @override
  String get embedded => 'Ембеддед';

  @override
  String castSessionError(String protocol) {
    return 'Грешка $protocol сесије';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Учитавање података о књизи није успело: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'ЕПУБ приказивање у апликацији још увек није доступно на овој платформи.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Овај формат (.$extension) још не може да се прикаже у апликацији.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Уграђено приказивање докумената није доступно на овој платформи.';

  @override
  String get couldNotOpenExternalViewer =>
      'Није могуће отворити спољни прегледач.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Отварање читача у апликацији није успело: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Обележивач је већ сачуван на $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Обележивач додат: $label';
  }

  @override
  String get noBookmarksYet =>
      'Још нема обележивача.\nДодирните икону обележивача док читате да бисте сачували своју позицију.';

  @override
  String get noTableOfContentsAvailable => 'Није доступан садржај';

  @override
  String pageLabel(int number) {
    return 'Страница $number';
  }

  @override
  String get position => 'Положај';

  @override
  String get bookReader => 'Боок Реадер';

  @override
  String formatExtension(String extension) {
    return 'Формат: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% прочитано';
  }

  @override
  String get updating => 'Ажурирање...';

  @override
  String get markUnread => 'Означи као непрочитано';

  @override
  String get markAsRead => 'Означи као прочитано';

  @override
  String get reloadReader => 'Релоад Реадер';

  @override
  String get noPagesFound => 'Није пронађена ниједна страница.';

  @override
  String get failedToDecodePageImage =>
      'Декодирање слике странице није успело.';

  @override
  String resetZoom(String zoom) {
    return 'Ресетуј зумирање (${zoom}x)';
  }

  @override
  String get singlePage => 'Сингле Паге';

  @override
  String get twoPageSpread => 'Спреад на две странице';

  @override
  String get addBookmark => 'Додај обележивач';

  @override
  String get bookmarksEllipsis => 'Обележивачи...';

  @override
  String get markedAsRead => 'Означено као прочитано';

  @override
  String get markedAsUnread => 'Означено као непрочитано';

  @override
  String failedToUpdateReadState(String error) {
    return 'Ажурирање статуса читања није успело: $error';
  }

  @override
  String get themeSystem => 'Тема: Систем';

  @override
  String get themeLight => 'Тема: Светлост';

  @override
  String get themeDark => 'Тема: Тамно';

  @override
  String get themeSepia => 'Тема: сепија';

  @override
  String get invertColorsFixedLayout => 'Инверт Цолорс (фиксни распоред)';

  @override
  String get invertColorsPdf => 'Инверт Цолорс (ПДФ)';

  @override
  String get preparingInAppReader => 'Припрема читача у апликацији...';

  @override
  String get pdfDataNotAvailable => 'ПДФ подаци нису доступни.';

  @override
  String get readerFallbackModeActive => 'Активан је резервни режим читача';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ова платформа не може да покрене уграђени механизам за документе за $extension датотеке.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Користите Релоад Реадер након преласка на подржану циљну платформу (Андроид, иОС, мацОС).';

  @override
  String get openExternally => 'Отворите споља';

  @override
  String get noEpubChaptersFound => 'Није пронађено ниједно ЕПУБ поглавља.';

  @override
  String get readerNotReady => 'Читач није спреман.';

  @override
  String get seriesRecordings => 'Сериес Рецордингс';

  @override
  String get now => 'Сада';

  @override
  String get sports => 'Спортс';

  @override
  String get news => 'Вести';

  @override
  String get kids => 'Деца';

  @override
  String get premiere => 'Премијера';

  @override
  String get guideTimeline => 'Временска линија водича';

  @override
  String failedToLoadGuide(String error) {
    return 'Учитавање ТВ водича није успело: $error';
  }

  @override
  String get noChannelsFound => 'Није пронађен ниједан канал';

  @override
  String get liveBadge => 'ЛИВЕ';

  @override
  String guideNextProgram(String time, String title) {
    return 'Следеће: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'још $minutes мин';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'још $hours ч';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'још $hours ч $minutes мин';
  }

  @override
  String get movie => 'Филм';

  @override
  String get removedFromFavoriteChannels => 'Уклоњено са омиљених канала';

  @override
  String get addedToFavoriteChannels => 'Додато у омиљене канале';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Ажурирање омиљеног канала није успело';

  @override
  String get unfavoriteChannel => 'Унфаворите Цханнел';

  @override
  String get favoriteChannel => 'Омиљени канал';

  @override
  String get record => 'Сними';

  @override
  String get cancelRecordingAction => 'Откажи снимање';

  @override
  String get programSetToRecord => 'Емисија је заказана за снимање';

  @override
  String get recordingCancelled => 'Снимање је отказано';

  @override
  String get unableToCreateRecording => 'Није могуће направити снимак';

  @override
  String get watch => 'Гледај';

  @override
  String get close => 'Затвори';

  @override
  String failedToPlayChannel(String name) {
    return 'Репродукција канала $name није успела';
  }

  @override
  String get failedToLoadRecordings => 'Учитавање снимака није успело';

  @override
  String get scheduledInNext24Hours => 'Заказано за наредна 24 сата';

  @override
  String get recentRecordings => 'Недавни снимци';

  @override
  String get tvSeries => 'ТВ серије';

  @override
  String get failedToLoadSchedule => 'Учитавање распореда није успело';

  @override
  String get noScheduledRecordings => 'Нема заказаних снимања';

  @override
  String get cancelRecording => 'Отказати снимање?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Отказати заказано снимање емисије „$name”?';
  }

  @override
  String get no => 'Не';

  @override
  String get yesCancel => 'Да, откажи';

  @override
  String get failedToCancelRecording => 'Отказивање снимања није успело';

  @override
  String get failedToLoadSeriesRecordings =>
      'Учитавање снимака серије није успело';

  @override
  String get noSeriesRecordings => 'Нема снимања серијала';

  @override
  String get cancelSeriesRecording => 'Откажи снимање серије';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Желите ли да откажете снимање серије?';

  @override
  String stopRecordingName(String name) {
    return 'Зауставити снимање серије „$name”?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Отказивање снимања серије није успело';

  @override
  String get searchThisLibrary => 'Претражи ову библиотеку...';

  @override
  String get searchEllipsis => 'Тражи...';

  @override
  String noResultsForQuery(String query) {
    return 'Нема резултата за „$query”';
  }

  @override
  String searchFailedError(String error) {
    return 'Претраживање није успело: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Тип Seerr налога';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Локални';

  @override
  String get savedMedia => 'Сачувани медији';

  @override
  String get tvShows => 'ТВ емисије';

  @override
  String get music => 'Музика';

  @override
  String get musicAlbums => 'Мусиц Албумс';

  @override
  String get noMediaInFilter => 'Нема медија у овом филтеру';

  @override
  String get noDownloadedMediaYet => 'Још увек нема преузетих медија';

  @override
  String get browseLibrary => 'Прегледајте библиотеку';

  @override
  String get deleteDownload => 'Избриши преузимање';

  @override
  String removeItemAndFiles(String name) {
    return 'Уклонити „$name” и припадајуће датотеке?';
  }

  @override
  String tracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count песама',
      few: '$count песме',
      one: '$count песма',
    );
    return '$_temp0';
  }

  @override
  String get album => 'Албум';

  @override
  String get playAlbum => 'Пусти албум';

  @override
  String failedToLoadAlbum(String error) {
    return 'Учитавање албума није успело: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Нема преузетих песама за $name.';
  }

  @override
  String get season => 'Сезона';

  @override
  String get errorLoadingEpisodes => 'Грешка при учитавању епизода';

  @override
  String get noDownloadedEpisodes => 'Нема преузетих епизода';

  @override
  String get deleteEpisode => 'Избриши епизоду';

  @override
  String removeName(String name) {
    return 'Уклонити „$name”?';
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
  String get seriesNotFound => 'Серија није пронађена';

  @override
  String get errorLoadingSeries => 'Грешка при учитавању серије';

  @override
  String get downloadedEpisodes => 'Преузете епизоде';

  @override
  String seasonNumber(int number) {
    return 'Сезона $number';
  }

  @override
  String seasonChip(int number) {
    return 'С$number';
  }

  @override
  String get specials => 'Специалс';

  @override
  String get deleteSeason => 'Избриши сезону';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Обрисати све преузете епизоде у $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count епизода',
      few: '$count епизоде',
      one: '$count епизода',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Управљање складиштем';

  @override
  String get storageBreakdown => 'Стораге Бреакдовн';

  @override
  String get downloadedItems => 'Преузете ставке';

  @override
  String get storageLimit => 'Ограничење складиштења';

  @override
  String get noLimit => 'Нема ограничења';

  @override
  String get deleteAllDownloads => 'Избриши сва преузимања';

  @override
  String get deleteAllDownloadsWarning =>
      'Ово ће уклонити све преузете медијске датотеке и не може се опозвати.';

  @override
  String get deleteAll => 'Избриши све';

  @override
  String get deleteSelected => 'Избриши изабрано';

  @override
  String deleteSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Обрисати $count преузетих ставки?',
      few: 'Обрисати $count преузете ставке?',
      one: 'Обрисати $count преузету ставку?',
    );
    return '$_temp0';
  }

  @override
  String get musicAndAudiobooks => 'Музика и аудио књиге';

  @override
  String get images => 'Слике';

  @override
  String get database => 'База података';

  @override
  String ofStorageLimit(String limit) {
    return 'од ограничења $limit';
  }

  @override
  String get settings => 'Подешавања';

  @override
  String get authentication => 'Аутентификација';

  @override
  String get autoLoginServerManagement =>
      'Аутоматско пријављивање, управљање сервером';

  @override
  String get pinCode => 'ПИН код';

  @override
  String get setUpPinCodeProtection => 'Подесите заштиту ПИН кодом';

  @override
  String get parentalControls => 'Родитељски надзор';

  @override
  String get contentRatingRestrictions => 'Ограничења оцењивања садржаја';

  @override
  String get bitRateResolutionBehavior =>
      'Брзина преноса, резолуција, понашање';

  @override
  String get languageSizeAppearance => 'Језик, величина, изглед';

  @override
  String get qualityStorage => 'Квалитет, складиштење';

  @override
  String get serverSyncAndPluginStatus =>
      'Синхронизација сервера и статус додатка';

  @override
  String get mediaRequestIntegration => 'Интеграција захтева медија';

  @override
  String get switchServer => 'Пребаци сервер';

  @override
  String get signOut => 'Одјави се';

  @override
  String get versionLicenses => 'Верзија, лиценце';

  @override
  String get account => 'Рачун';

  @override
  String get signInAndSecurity => 'Пријава и безбедност';

  @override
  String get administration => 'Администрација';

  @override
  String get serverSettingsUsersLibraries =>
      'Подешавања сервера, корисници, библиотеке';

  @override
  String get customization => 'Прилагођавање';

  @override
  String get themeAndLayout => 'Тема и изглед';

  @override
  String get videoAndSubtitles => 'Видео и титлови';

  @override
  String get integrations => 'Интеграције';

  @override
  String get pluginAndRequests => 'Додатак и захтеви';

  @override
  String get customizeAccountPlaybackInterface =>
      'Прилагодите налог, репродукцију и понашање интерфејса';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count опција',
      few: '$count опције',
      one: '$count опција',
    );
    return '$_temp0';
  }

  @override
  String get themeAndAppearance => 'Тема и изглед';

  @override
  String get focusBorderColor => 'Боја оквира фокуса';

  @override
  String get watchedIndicators => 'Гледани индикатори';

  @override
  String get always => 'Увек';

  @override
  String get hideUnwatched => 'Сакриј Негледано';

  @override
  String get episodesOnly => 'Само епизоде';

  @override
  String get never => 'Никада';

  @override
  String get focusExpansionAnimation => 'Анимација проширења фокуса';

  @override
  String get desktopUiScale => 'Десктоп УИ Сцале';

  @override
  String get scaleFocusedCards =>
      'Скалирајте фокусиране или лебдеће картице и плочице';

  @override
  String get backgroundBackdrops => 'Позадине у позадини';

  @override
  String get showBackdropImages => 'Прикажите слике позадине иза садржаја';

  @override
  String get seriesThumbnails => 'Сличице серије';

  @override
  String get seriesThumbnailsDescription =>
      'Само епизоде: користите илустрацију серије која одговара сваком типу слике у реду';

  @override
  String get homeRowInfoOverlay => 'Преклапање информација о матичном реду';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Прикажи наслов и метаподатке при прегледању почетних редова';

  @override
  String get clockDisplay => 'Приказ сата';

  @override
  String get inMenus => 'У менијима';

  @override
  String get inVideo => 'Ин Видео';

  @override
  String get seasonalEffects => 'Сезонски ефекти';

  @override
  String get seasonalEffectsDescription => 'Визуелни ефекти и сезонски украси';

  @override
  String get snow => 'Снег';

  @override
  String get fireworks => 'Ватромет';

  @override
  String get confetti => 'Конфети';

  @override
  String get fallingLeaves => 'Фаллинг Леавес';

  @override
  String get themeMusic => 'Тхеме Мусиц';

  @override
  String get playThemeMusicOnDetailPages =>
      'Пустите музику теме на страницама са детаљима';

  @override
  String get themeMusicVolume => 'Тхеме Мусиц Волуме';

  @override
  String get themeMusicSettingsSubtitle =>
      'Странице са детаљима, редови на почетном екрану и јачина звука';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Тематска музика на кућним редовима';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Играјте када прегледате почетни екран';

  @override
  String get loopThemeMusic => 'Понављај тематску музику';

  @override
  String get loopThemeMusicSubtitle =>
      'Понављај песму уместо једнократне репродукције';

  @override
  String get detailsBackgroundBlur => 'Детаљи Замућење позадине';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value px';
  }

  @override
  String get browsingBackgroundBlur => 'Прегледање замућења позадине';

  @override
  String get maxStreamingBitrate => 'Максимална брзина преноса';

  @override
  String get maxResolution => 'Мак Ресолутион';

  @override
  String get playerZoomMode => 'Режим зумирања играча';

  @override
  String get settingsScrollWheelAction => 'Точкић миша';

  @override
  String get settingsScrollWheelActionDescription =>
      'Изаберите шта ради померање точкића миша преко видеа током репродукције.';

  @override
  String get scrollWheelActionOff => 'Искључено';

  @override
  String get scrollWheelActionSeek => 'Премотавање (напред / назад)';

  @override
  String get scrollWheelActionVolume => 'Јачина звука';

  @override
  String get playerTooltipVolume => 'Јачина звука';

  @override
  String get fit => 'Фит';

  @override
  String get autoCrop => 'Ауто Цроп';

  @override
  String get stretch => 'Стретцх';

  @override
  String get refreshRateSwitching => 'Промена брзине освежавања';

  @override
  String get disabled => 'Онемогућено';

  @override
  String get scaleOnTv => 'Скала на ТВ-у';

  @override
  String get scaleOnDevice => 'Скала на уређају';

  @override
  String get trickPlay => 'Трицк Плаи';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Прикажи сличице за преглед када тражите';

  @override
  String get showDescriptionOnPause => 'Прикажи опис на паузи';

  @override
  String get dimVideoShowOverview =>
      'Затамните видео и прикажите текст прегледа док је паузиран';

  @override
  String get osdLockButton => 'Дугме за закључавање менија на екрану';

  @override
  String get osdLockButtonDescription =>
      'Прикажи дугме за закључавање које блокира унос додиром док се не притисне дуго';

  @override
  String get audioBehavior => 'Аудио Бехавиор';

  @override
  String get downmixToStereo => 'Довнмик то Стерео';

  @override
  String get defaultAudioLanguage => 'Подразумевани аудио језик';

  @override
  String get fallbackAudioLanguage => 'Резервни језик звука';

  @override
  String get preferDefaultAudioTrack => 'Преферирај подразумевани аудио-запис';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Преферирај оригинални аудио-запис уместо локализоване синхронизације.';

  @override
  String get preferAudioDescription => 'Преферирај записе са аудио-описом';

  @override
  String get preferAudioDescriptionDescription =>
      'Преферирај записе са аудио-описом уместо уобичајених записа.';

  @override
  String get transcodingAudio => 'Транскодирање (звук)';

  @override
  String get directStreamRemux => 'Директни стрим (remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Транскодирање (проток или резолуција)';

  @override
  String get transcodingVideoAndAudio => 'Транскодирање (видео и звук)';

  @override
  String get transcodingVideo => 'Транскодирање (видео)';

  @override
  String get autoServerDefault => 'Аутоматски (подразумевано на серверу)';

  @override
  String get english => 'енглески';

  @override
  String get spanish => 'шпански';

  @override
  String get french => 'француски';

  @override
  String get german => 'немачки';

  @override
  String get italian => 'италијански';

  @override
  String get portuguese => 'португалски';

  @override
  String get japanese => 'јапански';

  @override
  String get korean => 'Кореан';

  @override
  String get chinese => 'кинески';

  @override
  String get russian => 'руски';

  @override
  String get arabic => 'арапски';

  @override
  String get hindi => 'Хинди';

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
  String get polish => 'пољски';

  @override
  String get ac3Passthrough => 'АЦ3 Пасстхроугх';

  @override
  String get dtsPassthrough => 'ДТС Пасстхроугх';

  @override
  String get trueHdSupport => 'TrueHD подршка';

  @override
  String get enableDtsPassthrough =>
      'Битстреам ДТС аудио само на АВР; захтева подршку пријемника и ДТС изворну стазу';

  @override
  String get enableTrueHdAudio =>
      'Омогући TrueHD аудио (можда неће радити на свим платформама)';

  @override
  String get settingsAudioOutputMode => 'Режим излаза звука';

  @override
  String get settingsAudioOutputModeDescription =>
      'Изаберите како се звук декодира. AVR Passthrough шаље необрађене Dolby/DTS стримове вашем пријемнику, док Auto или Downmix декодирају локално.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Резервни аудио-кодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Изаберите циљни формат за транскодирање вишеканалног звука када изворни стрим не може директно да се репродукује нити да се проследи.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Аутоматско откривање\n(препоручено)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(подразумевано)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(без губитака)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(само стерео)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(ефикасан)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(без губитака)';

  @override
  String get settingsMaxAudioChannels => 'Максималан број аудио-канала';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Подесите максималан број канала ваше аудио-конфигурације. Вишеканални стримови који премашују ово ограничење биће сведени на мањи број канала или транскодирани.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Аутоматско откривање\n(хардверски подразумевано)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 квадрофонија';

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
  String get settingsAudioCodecPassthrough => 'Passthrough кодека';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Омогућите само формате које подржава ваш AVR или HDMI уређај.';

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
      'Шаљи Dolby Digital Plus (EAC3) bitstream спољном декодеру.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Шаљи Dolby Atmos преко EAC3 (JOC) bitstream спољном декодеру.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Шаљи DTS-HD MA bitstream (укључује DTS core) спољном декодеру.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Шаљи Dolby TrueHD bitstream са Atmos метаподацима спољном декодеру.';

  @override
  String get settingsDetectedAudioCapabilities => 'Откривене аудио-могућности';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Снимак могућности током извршавања још није доступан.';

  @override
  String get settingsAudioRouteLabel => 'Рута';

  @override
  String get settingsAudioDecodeLabel => 'Декодирање';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD аудио-рута';

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
  String get settingsAudioRouteHeadphones => 'Слушалице';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count кан. PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Дијагностика';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Видео ниво';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Видео опсег';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Кодек титлова';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Дозвољени аудио-кодеци';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS аудио-кодеци';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 аудио-кодеци';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Активна аудио-рута';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Подршка руте за HD звук';

  @override
  String get nightMode => 'Ноћни режим';

  @override
  String get compressDynamicRange => 'Компримирајте динамички опсег';

  @override
  String get advancedMpv => 'Напредни mpv';

  @override
  String get enableCustomMpvConf => 'Омогући прилагођени mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Примени кориснички mpv.conf пре почетка репродукције';

  @override
  String get unsafeAdvancedMpvOptions => 'Небезбедне напредне mpv опције';

  @override
  String get unsafeMpvOptionsDescription =>
      'Дозволите шири скуп mpv опција. Може нарушити репродукцију.';

  @override
  String get hardwareDecoding => 'Хардверско декодирање';

  @override
  String get hardwareDecodingSubtitle =>
      'Може побољшати перформансе, али може изазвати проблеме са репродукцијом на неким уређајима.';

  @override
  String get nextUpAndQueuing => 'Следећи корак и чекање у реду';

  @override
  String get nextUpDisplay => 'Нект Уп Дисплаи';

  @override
  String get extended => 'Проширено';

  @override
  String get minimal => 'Минимално';

  @override
  String get nextUpTimeout => 'Време истека следећег рока';

  @override
  String secondsValue(int value) {
    return '$value с';
  }

  @override
  String get mediaQueuing => 'Редовање медија';

  @override
  String get autoQueueNextEpisodes =>
      'Аутоматско стављање у ред следећих епизода';

  @override
  String get stillWatchingPrompt => 'Још увек гледам упит';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'После $episodes епизода / $hours ч';
  }

  @override
  String get resumeAndSkip => 'Настави и прескочи';

  @override
  String get resumeRewind => 'Ресуме Ревинд';

  @override
  String get unpauseRewind => 'Поништи премотавање уназад';

  @override
  String get fiveSeconds => '5 секунди';

  @override
  String get tenSeconds => '10 секунди';

  @override
  String get fifteenSeconds => '15 секунди';

  @override
  String get thirtySeconds => '30 секунди';

  @override
  String get skipBackLength => 'Дужина прескакања уназад';

  @override
  String get skipForwardLength => 'Дужина прескакања унапред';

  @override
  String get customMpvConfPath => 'Путања до прилагођеног mpv.conf';

  @override
  String get notSetMpvConf =>
      'Није постављено. Moonfin ће покушати са подразумеваним mpv.conf у app/data фасциклама.';

  @override
  String get selectMpvConf => 'Изаберите mpv.conf';

  @override
  String get pathToMpvConf => '/путања/до/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Подешавања стила (величина, боја, офсет) примењују се на текстуалне титлове (СРТ, ВТТ, ТТМЛ). АСС/ССА титлови користе сопствени уграђени стил осим ако је „АСС/ССА Дирецт Плаи“ искључено. Битмап титлови (ПГС, ДВБ, ВобСуб) не могу да се мењају.';

  @override
  String get defaultSubtitleLanguage => 'Подразумевани језик титлова';

  @override
  String get defaultToNoSubtitles => 'Подразумевано без титлова';

  @override
  String get turnOffSubtitlesByDefault => 'Подразумевано искључите титлове';

  @override
  String get subtitleSize => 'Субтитле Сизе';

  @override
  String get textFillColor => 'Боја испуне текста';

  @override
  String get backgroundColor => 'Боја позадине';

  @override
  String get textStrokeColor => 'Боја потеза текста';

  @override
  String get subtitleCustomization => 'Прилагођавање титлова';

  @override
  String get subtitleCustomizationDescription => 'Прилагодите изглед титла';

  @override
  String get subtitleMode => 'Режим титлова';

  @override
  String get subtitleModeFlagged => 'Означени';

  @override
  String get subtitleModeAlways => 'Увек';

  @override
  String get subtitleModeForeign => 'Страни језик';

  @override
  String get subtitleModeForced => 'Принудни';

  @override
  String get subtitleModeFlaggedDescription =>
      'Репродукује записе који су у метаподацима медијске датотеке означени као „default” или „forced”.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Аутоматски учитава и приказује титлове сваки пут када видео почне.';

  @override
  String get subtitleModeForeignDescription =>
      'Аутоматски укључује титлове ако је подразумевани аудио-запис на страном језику.';

  @override
  String get subtitleModeForcedDescription =>
      'Учитава само титлове изричито означене ознаком „forced” у метаподацима.';

  @override
  String get subtitleModeNoneDescription =>
      'Потпуно онемогућава аутоматско учитавање титлова.';

  @override
  String get fallbackSubtitleLanguage => 'Резервни језик титлова';

  @override
  String get subtitleStream => 'Стрим титлова';

  @override
  String get subtitlePreviewText => 'Брза смеђа лисица прескаче лењог пса';

  @override
  String get verticalOffset => 'Вертицал Оффсет';

  @override
  String get pgsDirectPlay => 'ПГС Директна игра';

  @override
  String get directPlayPgsSubtitles => 'Директна репродукција ПГС титлова';

  @override
  String get assSsaDirectPlay => 'АСС/ССА Директна игра';

  @override
  String get directPlayAssSsaSubtitles =>
      'Директна репродукција АСС/ССА титлова';

  @override
  String get white => 'Бела';

  @override
  String get black => 'Црно';

  @override
  String get yellow => 'Жута';

  @override
  String get green => 'Зелена';

  @override
  String get cyan => 'Циан';

  @override
  String get red => 'Црвени';

  @override
  String get transparent => 'Транспарент';

  @override
  String get semiTransparentBlack => 'Полупровидна црна';

  @override
  String get global => 'Глобал';

  @override
  String get desktop => 'Десктоп';

  @override
  String get mobile => 'Мобилни';

  @override
  String get tv => 'ТВ';

  @override
  String loadedProfileSettings(String profile) {
    return 'Учитана су подешавања профила $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Учитавање подешавања профила $profile није успело.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Локална подешавања синхронизована су са профилом $profile.';
  }

  @override
  String get customizationProfile => 'Профил за прилагођавање';

  @override
  String get customizationProfileDescription =>
      'Изаберите профил за учитавање, измену и синхронизацију. Глобално се примењује свуда осим ако га профил уређаја не замењује. Зелена тачка означава ваш тренутни профил уређаја.';

  @override
  String get loadProfile => 'Учитај профил';

  @override
  String get syncing => 'Синхронизација...';

  @override
  String get syncToProfile => 'Синхронизација са профилом';

  @override
  String get profileSyncHidden => 'Синхронизација профила је скривена';

  @override
  String get enablePluginSyncDescription =>
      'Омогућите синхронизацију серверских додатака у подешавањима додатка да бисте овде приказали контроле профила.';

  @override
  String get quality => 'Квалитет';

  @override
  String get defaultDownloadQuality => 'Подразумевани квалитет преузимања';

  @override
  String get network => 'Мрежа';

  @override
  String get wifiOnlyDownloads => 'Преузимања само за ВиФи';

  @override
  String get reportDownloadsActivity => 'Прикажи преузимања на серверу';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Дозволите администратору сервера да на контролној табли види ваша транскодирана преузимања';

  @override
  String get onlyDownloadOnWifi => 'Преузмите само када сте повезани на ВиФи';

  @override
  String get storage => 'Складиштење';

  @override
  String get storageUsed => 'Користи се складиште';

  @override
  String get manage => 'Управљај';

  @override
  String get calculating => 'Израчунавање...';

  @override
  String get downloadLocation => 'Локација преузимања';

  @override
  String get defaultLabel => 'Подразумевано';

  @override
  String get saveToDownloadsFolder => 'Сачувај у фолдер Преузимања';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin — видљиво другим апликацијама';

  @override
  String get dangerZone => 'Зона опасности';

  @override
  String get clearAllDownloads => 'Обриши сва преузимања';

  @override
  String get original => 'Оригинал';

  @override
  String get changeDownloadLocation => 'Промените локацију преузимања';

  @override
  String get changeDownloadLocationDescription =>
      'Нова преузимања ће бити сачувана у изабраном фолдеру. Постојећа преузимања ће остати на својој тренутној локацији и њима се може управљати из подешавања складишта.';

  @override
  String get confirm => 'Потврди';

  @override
  String get cannotWriteToFolder =>
      'Није могуће писати у изабрани фолдер. Изаберите другу локацију или дајте дозволе за складиштење.';

  @override
  String get saveToDownloadsFolderQuestion => 'Сачувати у фолдеру Преузимања?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Преузети медији ће бити сачувани у Downloads/Moonfin на вашем уређају. Ове датотеке ће бити видљиве другим апликацијама, као што су галерија или музички плејер.\n\nПостојећа преузимања ће остати на тренутној локацији.';

  @override
  String get enable => 'Омогући';

  @override
  String get clearAllDownloadsWarning =>
      'Ово ће избрисати све преузете медије и не може се опозвати.';

  @override
  String get clearAll => 'Обриши све';

  @override
  String get navigationStyle => 'Стил навигације';

  @override
  String get topBar => 'Топ Бар';

  @override
  String get leftSidebar => 'Лева бочна трака';

  @override
  String get showShuffleButton => 'Прикажи дугме Насумично';

  @override
  String get showGenresButton => 'Дугме за приказ жанрова';

  @override
  String get showFavoritesButton => 'Прикажи дугме Фаворити';

  @override
  String get showLibrariesInToolbar =>
      'Прикажи библиотеке на траци са алаткама';

  @override
  String get navbarAlwaysExpanded => 'Увек прошири натписе навигационе траке';

  @override
  String get showSeerrButton => 'Прикажи Seerr дугме';

  @override
  String get navbarOpacity => 'Прозирност навигационе траке';

  @override
  String get navbarColor => 'Навбар Цолор';

  @override
  String get gray => 'Греи';

  @override
  String get darkBlue => 'Тамно плава';

  @override
  String get purple => 'Љубичаста';

  @override
  String get teal => 'Теал';

  @override
  String get navy => 'морнарица';

  @override
  String get charcoal => 'Дрвени угаљ';

  @override
  String get brown => 'Браон';

  @override
  String get darkRed => 'Тамноцрвена';

  @override
  String get darkGreen => 'Тамно зелена';

  @override
  String get slate => 'Слате';

  @override
  String get indigo => 'Индиго';

  @override
  String get libraryDisplay => 'Приказ библиотеке';

  @override
  String get posterLabel => 'Постер';

  @override
  String get thumbnailLabel => 'Тхумбнаил';

  @override
  String get bannerLabel => 'Банер';

  @override
  String get overridePerLibrarySettings => 'Замени подешавања по библиотеци';

  @override
  String get applyImageTypeToAllLibraries =>
      'Примените тип слике на све библиотеке';

  @override
  String get multiServerLibraries => 'Библиотеке са више сервера';

  @override
  String get showLibrariesFromAllServers =>
      'Прикажи библиотеке са свих повезаних сервера';

  @override
  String get enableFolderView => 'Омогући приказ фасцикле';

  @override
  String get showFolderBrowsingOption => 'Прикажи опцију прегледања фолдера';

  @override
  String get groupItemsIntoCollections => 'Групиши ставке у колекције';

  @override
  String get hideCollectionAssociatedItems =>
      'Сакриј ставке библиотеке повезане са колекцијом при прегледању библиотека';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Обавештење о груписању библиотеке';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Да бисте користили ово подешавање, проверите да ли су подешавања библиотеке „Групиши филмове у колекције” и/или „Групиши серије у колекције” омогућена у подешавањима приказа ваше библиотеке на Jellyfin или Emby серверу.';

  @override
  String get libraryVisibility => 'Видљивост библиотеке';

  @override
  String get libraryVisibilityDescription =>
      'Укључите или искључите видљивост на почетној страници по библиотеци. Поново покрените Moonfin да би промене ступиле на снагу.';

  @override
  String get showInNavigation => 'Прикажи у навигацији';

  @override
  String get showInLatestMedia => 'Прикажи у најновијим медијима';

  @override
  String get sourceLibraries => 'Изворне библиотеке';

  @override
  String get sourceCollections => 'Соурце Цоллецтионс';

  @override
  String get excludedGenres => 'Изузети жанрови';

  @override
  String get selectAll => 'Изаберите Све';

  @override
  String itemsSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изабрано',
      few: '$count изабране',
      one: '$count изабрана',
    );
    return '$_temp0';
  }

  @override
  String get mediaBar => 'Медиа Бар';

  @override
  String get mediaSources => 'Медијски извори';

  @override
  String get behavior => 'Понашање';

  @override
  String get seconds => 'секунди';

  @override
  String get localPreviews => 'Локални прегледи';

  @override
  String get localPreviewsDescription =>
      'Конфигуришите трејлер, медије и аудио прегледе.';

  @override
  String get mediaBarMode => 'Стил медијске траке';

  @override
  String get mediaBarModeDescription =>
      'Изаберите један од стилова медијске траке или је искључите';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Искључено';

  @override
  String get enableMediaBar => 'Омогући траку медија';

  @override
  String get showFeaturedContentSlideshow =>
      'Прикажите пројекцију слајдова истакнутог садржаја на почетној страници';

  @override
  String get contentType => 'Цонтент Типе';

  @override
  String get moviesAndTvShows => 'Филмови и ТВ емисије';

  @override
  String get moviesOnly => 'Само филмови';

  @override
  String get tvShowsOnly => 'Само ТВ емисије';

  @override
  String get itemCount => 'Број предмета';

  @override
  String get noneSelected => 'Није изабрано';

  @override
  String get noneExcluded => 'Ниједан није искључен';

  @override
  String get autoAdvance => 'Ауто Адванце';

  @override
  String get autoAdvanceSlides => 'Аутоматски пређите на следећи слајд';

  @override
  String get autoAdvanceInterval => 'Ауто Адванце Интервал';

  @override
  String get trailerPreview => 'Преглед трејлера';

  @override
  String get autoPlayTrailers =>
      'Аутоматска репродукција трејлера на траци са медијима након 3 секунде';

  @override
  String get trailerAudio => 'Звук најава';

  @override
  String get enableTrailerAudio => 'Омогући звук за најаве у медијској траци';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription =>
      'Show captions on YouTube trailers in the media bar';

  @override
  String get episodePreview => 'Преглед епизоде';

  @override
  String get mediaPreview => 'Преглед медија';

  @override
  String get episodePreviewDescription =>
      'Пустите 30-секундни инлине преглед на фокусираним картицама које лебде или дуго притиснуте';

  @override
  String get mediaPreviewDescription =>
      'Пустите 30-секундни инлине преглед на фокусираним картицама које лебде или дуго притиснуте';

  @override
  String get previewAudio => 'Превиев Аудио';

  @override
  String get enablePreviewAudio =>
      'Омогућите звук за прегледе трејлера и епизода';

  @override
  String get latestMedia => 'Латест Медиа';

  @override
  String get recentlyReleased => 'Недавно објављено';

  @override
  String get myMedia => 'Моји медији';

  @override
  String get myMediaSmall => 'Моји медији (мали)';

  @override
  String get continueWatching => 'Наставите са гледањем';

  @override
  String get resumeAudio => 'Ресуме Аудио';

  @override
  String get resumeBooks => 'Ресуме Боокс';

  @override
  String get activeRecordings => 'Ацтиве Рецордингс';

  @override
  String get playlists => 'Плејлисте';

  @override
  String get liveTV => 'ТВ уживо';

  @override
  String get homeSections => 'Хоме Сецтионс';

  @override
  String get resetToDefaults => 'Ресетујте на подразумеване вредности';

  @override
  String get homeRowPosterSize => 'Величина постера за почетни ред';

  @override
  String get perRowImageTypeSelection => 'Избор типа слике по реду';

  @override
  String get configureImageTypeForEachRow =>
      'Конфигуришите тип слике за сваки омогућени почетни ред';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Спајање Наставите са гледањем и даље';

  @override
  String get combineBothRows => 'Комбинујте оба реда у један кућни одељак';

  @override
  String get fullScreenRows => 'Проширени редови почетног екрана';

  @override
  String get fullScreenRowsDescription => 'Ограничи на 1 ред по екрану';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Тип слике по реду';

  @override
  String get perRowSettings => 'Подешавања по реду';

  @override
  String get autoLogin => 'Ауто Логин';

  @override
  String get lastUser => 'Последњи корисник';

  @override
  String get currentUser => 'Тренутни корисник';

  @override
  String get alwaysAuthenticate => 'Увек аутентификујте';

  @override
  String get requirePasswordWithToken =>
      'Захтевај лозинку чак и са сачуваним токеном';

  @override
  String get confirmExit => 'Потврдите излаз';

  @override
  String get showConfirmationBeforeExiting => 'Прикажи потврду пре изласка';

  @override
  String get blockContentWithRatings =>
      'Блокирајте садржај са следећим оценама:';

  @override
  String get noContentRatingsFound =>
      'Још увек нису пронађене оцене садржаја на овом серверу.';

  @override
  String get couldNotLoadServerRatings =>
      'Није могуће учитати оцене сервера. Приказују се само сачуване оцене.';

  @override
  String get couldNotRefreshRatings =>
      'Није могуће освежити оцене са сервера. Приказују се сачуване оцене.';

  @override
  String get enablePinCode => 'Омогућите ПИН код';

  @override
  String get requirePinToAccess => 'Захтевајте ПИН за приступ налогу';

  @override
  String get changePin => 'Промените ПИН';

  @override
  String get setNewPinCode => 'Подесите нови ПИН код';

  @override
  String get removePin => 'Уклоните ПИН';

  @override
  String get removePinProtection => 'Уклоните заштиту ПИН кодом';

  @override
  String get screensaver => 'Сцреенсавер';

  @override
  String get inAppScreensaver => 'Чувар екрана у апликацији';

  @override
  String get enableBuiltInScreensaver => 'Омогућите уграђени чувар екрана';

  @override
  String get mode => 'Режим';

  @override
  String get libraryArt => 'Либрари Арт';

  @override
  String get logo => 'Лого';

  @override
  String get clock => 'Сат';

  @override
  String get timeout => 'Тимеоут';

  @override
  String minutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String get dimmingLevel => 'Ниво затамњења';

  @override
  String get maxAgeRating => 'Максимална старосна оцена';

  @override
  String get any => 'Било који';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Захтевај старосну оцену';

  @override
  String get onlyShowRatedContent => 'Прикажи само оцењени садржај';

  @override
  String get showClock => 'Прикажи сат';

  @override
  String get displayClockDuringScreensaver =>
      'Прикажите сат током чувара екрана';

  @override
  String get clockModeStatic => 'Статични';

  @override
  String get clockModeBouncing => 'Одбијајући';

  @override
  String get rottenTomatoesCritics => 'Роттен Томатоес (критичари)';

  @override
  String get rottenTomatoesAudience => 'Роттен Томатоес (публика)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Метацритиц';

  @override
  String get metacriticUser => 'Метацритиц (корисник)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Леттербокд';

  @override
  String get myAnimeList => 'МиАнимеЛист';

  @override
  String get aniList => 'АниЛист';

  @override
  String get communityRating => 'Оцена заједнице';

  @override
  String get ratings => 'Оцене';

  @override
  String get additionalRatings => 'Додатне оцене';

  @override
  String get showMdbListAndTmdbRatings => 'Прикажи MDBList и TMDB оцене';

  @override
  String get ratingLabels => 'Ратинг Лабелс';

  @override
  String get showLabelsNextToIcons => 'Прикажи ознаке поред икона за оцењивање';

  @override
  String get ratingBadges => 'Ратинг Бадгес';

  @override
  String get showDecorativeBadges => 'Прикажите украсне значке иза оцена';

  @override
  String get episodeRatings => 'Оцене епизода';

  @override
  String get showRatingsOnEpisodes => 'Прикажи оцене појединачних епизода';

  @override
  String get ratingSources => 'Извори рејтинга';

  @override
  String get ratingSourcesDescription =>
      'Омогућите и промените редослед извора оцена приказаних у целој апликацији';

  @override
  String get pluginLabel => 'Moonbase додатак';

  @override
  String get pluginDetected => 'Додатак је откривен';

  @override
  String get pluginNotDetected => 'Додатак није откривен';

  @override
  String get pluginDetectedDescription =>
      'Откривен је серверски додатак. Синхронизација је аутоматски омогућена када се додатак први пут пронађе.';

  @override
  String get pluginNotDetectedDescription =>
      'Серверски додатак тренутно није откривен. Локална подешавања и даље користе своје сачуване вредности или уграђене подразумеване вредности.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nВерзија: $version';
  }

  @override
  String get availableServices => 'Доступне услуге';

  @override
  String get serverPluginSync => 'Синхронизација серверских додатака';

  @override
  String get syncSettingsWithPlugin =>
      'Синхронизујте подешавања са додатком сервера';

  @override
  String get whatSyncControls => 'Које контроле синхронизације';

  @override
  String get syncControlsDescription =>
      'Синхронизација контролише само да ли се подешавања подржана додацима прослеђују и повлаче са сервера. Избор профила и радње синхронизације профила су у подешавањима прилагођавања када је омогућена синхронизација додатака.';

  @override
  String get recentRequests => 'Недавни захтеви';

  @override
  String get recentlyAdded => 'Недавно додано';

  @override
  String get trending => 'У тренду';

  @override
  String get popularMovies => 'Популарни филмови';

  @override
  String get movieGenres => 'Филмски жанрови';

  @override
  String get upcomingMovies => 'Надолазећи филмови';

  @override
  String get studios => 'Студиос';

  @override
  String get popularSeries => 'Популар Сериес';

  @override
  String get seriesGenres => 'Сериес Генрес';

  @override
  String get upcomingSeries => 'Упцоминг Сериес';

  @override
  String get networks => 'Мреже';

  @override
  String get seerrDiscoveryRows => 'Seerr редови откривања';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults =>
      'Ресетујте редове на подразумеване вредности';

  @override
  String get enableSeerr => 'Омогући Seerr';

  @override
  String get showSeerrInNavigation =>
      'Прикажи Seerr у навигацији (захтева додатак за сервер)';

  @override
  String get seerrUnavailable =>
      'Није доступно јер је подршка за Seerr у серверском додатку онемогућена.';

  @override
  String get nsfwFilter => 'НСФВ филтер';

  @override
  String get hideAdultContent => 'Сакриј садржај за одрасле у резултатима';

  @override
  String get seerrNotificationsSection => 'Обавештења';

  @override
  String get seerrNotifyNewRequestsTitle => 'Обавештења о новим захтевима';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Обавести ме када неко пошаље захтев';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Ажурирања захтева';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Одобрено, одбијено и додато у вашу библиотеку';

  @override
  String get seerrNotifyIssuesTitle => 'Ажурирања проблема';

  @override
  String get seerrNotifyIssuesSubtitle => 'Нови проблеми, одговори и решења';

  @override
  String loggedInAs(String username) {
    return 'Пријављени сте као: $username';
  }

  @override
  String get discoverRows => 'Seerr страница за откривање';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Изаберите редове који се приказују на Seerr почетној страници. Превуците да промените редослед. Прилагођени редослед се синхронизује са Moonbase-ом.';

  @override
  String get discoverRowsDescription =>
      'Омогућите редове које желите да видите на Seerr почетној страници. Превуците да промените редослед. Прилагођени редослед се синхронизује са Moonbase-ом.';

  @override
  String get enabled => 'Омогућено';

  @override
  String get hidden => 'Скривено';

  @override
  String get aboutTitle => 'Абоут';

  @override
  String versionValue(String version) {
    return 'Верзија $version';
  }

  @override
  String get openSourceLicenses => 'Лиценце отвореног кода';

  @override
  String get sourceCode => 'Изворни код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Проверите да ли постоје ажурирања одмах';

  @override
  String get checksLatestDesktopRelease =>
      'Проверава најновије десктоп издање за ову платформу';

  @override
  String get youAreUpToDate => 'Ви сте у току.';

  @override
  String get couldNotCheckForUpdates =>
      'Тренутно није могуће проверити да ли постоје ажурирања.';

  @override
  String get noCompatibleUpdate =>
      'Није пронађен компатибилан пакет ажурирања за ову платформу.';

  @override
  String get updateChecksNotSupported =>
      'Провере ажурирања нису подржане на овој платформи.';

  @override
  String get updateNotificationsDisabled =>
      'Обавештења о ажурирању су онемогућена.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Сачекајте пре него што поново проверите.';

  @override
  String get latestUpdateAlreadyShown =>
      'Најновије ажурирање је већ приказано.';

  @override
  String get updateAvailable => 'Доступно је ажурирање.';

  @override
  String updateAvailableVersion(String version) {
    return 'Доступно ажурирање: v$version';
  }

  @override
  String get updateNotifications => 'Обавештења о ажурирању';

  @override
  String get showWhenUpdatesAvailable => 'Прикажи када су ажурирања доступна';

  @override
  String updateAvailableTitle(String version) {
    return 'Доступна верзија v$version';
  }

  @override
  String get readReleaseNotes => 'Прочитајте белешке о издању';

  @override
  String get downloadingUpdate => 'Преузимање ажурирања...';

  @override
  String get updateDownloadFailed =>
      'Преузимање ажурирања није успело. Покушајте поново.';

  @override
  String get openReleasesPage => 'Отворите страницу са издањима';

  @override
  String get navigation => 'Навигација';

  @override
  String get watchedIndicatorsBackdrops => 'Гледани индикатори, позадине';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Боја фокуса, посматрани индикатори, позадине';

  @override
  String get navbarStyleToolbarAppearance =>
      'Стил навигационе траке, дугмад на траци са алаткама, изглед';

  @override
  String get reorderToggleHomeRows =>
      'Промените редослед и укључите почетне редове';

  @override
  String get featuredContentAppearance => 'Истакнути садржај, изглед';

  @override
  String get posterSizeImageTypeFolderView =>
      'Величина постера, тип слике, приказ фасцикле';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB и извори оцена';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Ограничење кеша слика';

  @override
  String get clearImageCache => 'Очисти кеш слика';

  @override
  String get imageCacheCleared => 'Кеш слика је очишћен';

  @override
  String get clear => 'Очисти';

  @override
  String get browse => 'Прегледај';

  @override
  String get noResults => 'Нема резултата';

  @override
  String get seerrAvailableStatus => 'Доступан';

  @override
  String get seerrRequestedStatus => 'Захтевано';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Преузимање · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Увоз';

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ставки',
      few: '$count ставке',
      one: '$count ставка',
    );
    return '$_temp0';
  }

  @override
  String get seerrSettings => 'Seerr подешавања';

  @override
  String get requestMore => 'Захтевајте више';

  @override
  String get request => 'Захтев';

  @override
  String get cancelRequest => 'Откажи захтев';

  @override
  String get playInMoonfin => 'Пусти у Moonfin-у';

  @override
  String requestedByName(String name) {
    return 'Затражио/ла: $name';
  }

  @override
  String get approve => 'Одобре';

  @override
  String get declineAction => 'Одбиј';

  @override
  String get similar => 'Слично';

  @override
  String get recommendations => 'Препоруке';

  @override
  String cancelRequestForTitle(String title) {
    return 'Отказати захтев за „$title”?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Отказати $count захтева за „$title”?',
      few: 'Отказати $count захтева за „$title”?',
      one: 'Отказати $count захтев за „$title”?',
    );
    return '$_temp0';
  }

  @override
  String get keep => 'Задржи';

  @override
  String get itemNotFoundInLibrary =>
      'Ставка није пронађена у вашој Moonfin библиотеци';

  @override
  String get errorSearchingLibrary => 'Грешка при претраживању библиотеке';

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
    return 'Затражи $type';
  }

  @override
  String get submitRequest => 'Пошаљите захтев';

  @override
  String get allSeasons => 'Сва годишња доба';

  @override
  String get advancedOptions => 'Напредне опције';

  @override
  String get noServiceServersConfigured =>
      'Ниједан сервисни сервер није конфигурисан';

  @override
  String get server => 'Сервер';

  @override
  String get qualityProfile => 'Квалитетни профил';

  @override
  String get rootFolder => 'Роот Фолдер';

  @override
  String get showMore => 'Прикажи више';

  @override
  String get appearances => 'Појављивања';

  @override
  String get crewSection => 'Посада';

  @override
  String ageValue(int age) {
    return 'старост $age';
  }

  @override
  String get noRequests => 'Нема захтева';

  @override
  String get pendingStatus => 'На чекању';

  @override
  String get declinedStatus => 'Одбијено';

  @override
  String get partiallyAvailable => 'Делимично доступно';

  @override
  String get downloadingStatus => 'Преузимање';

  @override
  String get approvedStatus => 'Одобрено';

  @override
  String get notRequestedStatus => 'Није затражено';

  @override
  String get blocklistedStatus => 'Блоцклистед';

  @override
  String get deletedStatus => 'Избрисано';

  @override
  String get failedStatus => 'Неуспешно';

  @override
  String get processingStatus => 'У обради';

  @override
  String modifiedByName(String name) {
    return 'Изменио/ла: $name';
  }

  @override
  String get completedStatus => 'Завршено';

  @override
  String get requestErrorDuplicate => 'Овај наслов је већ затражен';

  @override
  String get requestErrorQuota => 'Достигнуто је ограничење захтева';

  @override
  String get requestErrorBlocklisted => 'Овај наслов је на листи блокираних';

  @override
  String get requestErrorNoSeasons => 'Нема више сезона које се могу затражити';

  @override
  String get requestErrorPermission => 'Немате дозволу за слање овог захтева';

  @override
  String get seerrRequestsTitle => 'Захтеви';

  @override
  String get seerrIssuesTitle => 'Проблеми';

  @override
  String get sortNewest => 'Најновије';

  @override
  String get sortLastModified => 'Последња измена';

  @override
  String get noIssues => 'Нема проблема';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Преостало $remaining од $limit захтева за филмове';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Преостало $remaining од $limit захтева за сезоне';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Део колекције $name';
  }

  @override
  String get viewCollection => 'Прикажи колекцију';

  @override
  String get requestCollection => 'Затражи колекцију';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total филмова · $available доступно';
  }

  @override
  String requestMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Затражи $count филмова',
      few: 'Затражи $count филма',
      one: 'Затражи $count филм',
    );
    return '$_temp0';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Слање захтева $current од $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Затражено $count филмова',
      few: 'Затражена $count филма',
      one: 'Затражен $count филм',
    );
    return '$_temp0';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Затражено $ok од $total филмова';
  }

  @override
  String get collectionAllRequested =>
      'Сви филмови су већ доступни или затражени';

  @override
  String get reportIssue => 'Пријави проблем';

  @override
  String get issueTypeVideo => 'Видео';

  @override
  String get issueTypeAudio => 'Звук';

  @override
  String get whatsWrong => 'Шта није у реду?';

  @override
  String get allEpisodes => 'Све епизоде';

  @override
  String get episode => 'Епизода';

  @override
  String get openStatus => 'Отворено';

  @override
  String get resolvedStatus => 'Решено';

  @override
  String get resolveAction => 'Реши';

  @override
  String get reopenAction => 'Поново отвори';

  @override
  String reportedByName(String name) {
    return 'Пријавио/ла: $name';
  }

  @override
  String commentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count коментара',
      few: '$count коментара',
      one: '$count коментар',
    );
    return '$_temp0';
  }

  @override
  String get addComment => 'Додајте коментар';

  @override
  String get deleteIssueConfirm => 'Обрисати овај проблем?';

  @override
  String get submitReport => 'Пошаљи пријаву';

  @override
  String get tmdbScore => 'TMDB оцена';

  @override
  String get releaseDateLabel => 'Датум изласка';

  @override
  String get firstAirDateLabel => 'Датум првог емитовања';

  @override
  String get revenueLabel => 'Приход';

  @override
  String get runtimeLabel => 'Рунтиме';

  @override
  String get budgetLabel => 'Буџет';

  @override
  String get originalLanguageLabel => 'Оригинал Лангуаге';

  @override
  String get seasonsLabel => 'Сезоне';

  @override
  String get episodesLabel => 'Епизоде';

  @override
  String get access => 'Приступ';

  @override
  String get add => 'Додај';

  @override
  String get address => 'Адреса';

  @override
  String get analytics => 'Аналитика';

  @override
  String get catalog => 'Каталог';

  @override
  String get content => 'Садржај';

  @override
  String get copy => 'Копирај';

  @override
  String get create => 'Креирај';

  @override
  String get disable => 'Онемогући';

  @override
  String get done => 'Готово';

  @override
  String get edit => 'Уреди';

  @override
  String get encoding => 'Енцодинг';

  @override
  String get error => 'Грешка';

  @override
  String get forward => 'Напред';

  @override
  String get general => 'Опште';

  @override
  String get go => 'Иди';

  @override
  String get install => 'Инсталирај';

  @override
  String get installed => 'Инсталиран';

  @override
  String get interval => 'Интервал';

  @override
  String get name => 'Име';

  @override
  String get networking => 'Умрежавање';

  @override
  String get next => 'Следеће';

  @override
  String get path => 'Пут';

  @override
  String get paused => 'Паузирано';

  @override
  String get permissions => 'Дозволе';

  @override
  String get processing => 'Обрада';

  @override
  String get profile => 'Профил';

  @override
  String get provider => 'Провајдер';

  @override
  String get refresh => 'Освежи';

  @override
  String get remote => 'Даљински управљач';

  @override
  String get rename => 'Преименуј';

  @override
  String get revoke => 'Опозови';

  @override
  String get role => 'Улога';

  @override
  String get root => 'Роот';

  @override
  String get run => 'Трчи';

  @override
  String get search => 'Претражи';

  @override
  String get select => 'Изаберите';

  @override
  String get send => 'Пошаљи';

  @override
  String get sessions => 'Сесије';

  @override
  String get set => 'Сет';

  @override
  String get status => 'Статус';

  @override
  String get stop => 'Заустави';

  @override
  String get streaming => 'Стреаминг';

  @override
  String get time => 'Време';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Деинсталирај';

  @override
  String get up => 'Горе';

  @override
  String get update => 'Ажурирај';

  @override
  String get upload => 'Уплоад';

  @override
  String get unmute => 'Укључи звук';

  @override
  String get mute => 'Искључи звук';

  @override
  String get branding => 'Брендирање';

  @override
  String get adminDrawerDashboard => 'Дасхбоард';

  @override
  String get adminDrawerAnalytics => 'Аналитика';

  @override
  String get adminDrawerSettings => 'Подешавања';

  @override
  String get adminDrawerBranding => 'Брендирање';

  @override
  String get adminDrawerUsers => 'Корисници';

  @override
  String get adminDrawerLibraries => 'Библиотеке';

  @override
  String get adminDrawerDisplay => 'Приказ';

  @override
  String get adminDrawerMetadata => 'Метаподаци';

  @override
  String get adminDrawerNfo => 'NFO подешавања';

  @override
  String get adminDrawerTranscoding => 'Трансцодинг';

  @override
  String get adminDrawerResume => 'Настави';

  @override
  String get adminDrawerStreaming => 'Стреаминг';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Уређаји';

  @override
  String get adminDrawerActivity => 'Активност';

  @override
  String get adminDrawerNetworking => 'Умрежавање';

  @override
  String get adminDrawerApiKeys => 'АПИ кључеви';

  @override
  String get adminDrawerBackups => 'Резервне копије';

  @override
  String get adminDrawerLogs => 'Дневници';

  @override
  String get adminDrawerScheduledTasks => 'Планирани задаци';

  @override
  String get adminDrawerPlugins => 'Плугинс';

  @override
  String get adminDrawerRepositories => 'Спремишта';

  @override
  String get adminDrawerLiveTv => 'ТВ уживо';

  @override
  String get adminExitTooltip => 'Изађи из администратора';

  @override
  String get adminDashboardLoadFailed =>
      'Учитавање контролне табле није успело';

  @override
  String get adminMediaOverview => 'Преглед медија';

  @override
  String get adminMediaTotalsError =>
      'Није могуће учитати укупне вредности медија на серверу.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Кратко читање о томе колико садржаја има на овом серверу.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Доступна ажурирања додатака: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Додаци који захтевају поновно покретање: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Неуспели заказани задаци: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Недавна упозорења/грешке: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Дистрибуција медија';

  @override
  String get analyticsVideoCodecs => 'Видео Цодецс';

  @override
  String get analyticsAudioCodecs => 'Аудио кодеци';

  @override
  String get analyticsContainers => 'Контејнери';

  @override
  String get analyticsTopGenres => 'Топ Генрес';

  @override
  String get analyticsReleaseYears => 'Године издања';

  @override
  String get analyticsContentRatings => 'Оцене садржаја';

  @override
  String get analyticsRuntimeBuckets => 'Рунтиме Буцкетс';

  @override
  String get analyticsFileFormats => 'Формати датотека';

  @override
  String get analyticsNoData => 'Нема доступних података.';

  @override
  String get adminServerInfo => 'Информације о серверу';

  @override
  String get adminRestartPending => 'Рестарт Пендинг';

  @override
  String get adminServerPaths => 'Путања сервера';

  @override
  String get adminServerActions => 'Акције сервера';

  @override
  String get adminRestartServer => 'Поново покрените сервер';

  @override
  String get adminShutdownServer => 'Схутдовн Сервер';

  @override
  String get adminScanLibraries => 'Сцан Либрариес';

  @override
  String get adminLibraryScanStarted => 'Скенирање библиотеке је почело';

  @override
  String errorGeneric(String error) {
    return 'Грешка: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Рестарт сервера је у току';

  @override
  String get adminServerRebootMessage =>
      'Поновно покретање сервера је у току, поново покрените Moonfin';

  @override
  String get adminActiveSessions => 'Активне сесије';

  @override
  String get adminSessionsLoadFailed => 'Учитавање сесија није успело';

  @override
  String get adminNoActiveSessions => 'Нема активних сесија';

  @override
  String get adminRecentActivity => 'Недавна активност';

  @override
  String get adminNoRecentActivity => 'Нема недавних активности';

  @override
  String adminCommandFailed(String error) {
    return 'Наредба није успела: $error';
  }

  @override
  String get adminSendMessage => 'Пошаљи поруку';

  @override
  String get adminMessageTextHint => 'Текст поруке';

  @override
  String get adminSetVolume => 'Подесите јачину звука';

  @override
  String get sessionPrev => 'Прев';

  @override
  String get sessionRewind => 'Премотавање уназад';

  @override
  String get sessionForward => 'Напред';

  @override
  String get sessionNext => 'Следеће';

  @override
  String get sessionVolumeDown => 'Вол –';

  @override
  String get sessionVolumeUp => 'Вол +';

  @override
  String get uhd4k => '4К';

  @override
  String get nowPlaying => 'Сада се игра';

  @override
  String get volume => 'Јачина звука';

  @override
  String get actions => 'Акције';

  @override
  String get videoCodec => 'Видео Цодец';

  @override
  String get audioCodec => 'Аудио Цодец';

  @override
  String get hwAccel => 'ХВ Аццел';

  @override
  String get completion => 'Завршетак';

  @override
  String get direct => 'Директно';

  @override
  String get adminDisconnect => 'Прекини везу';

  @override
  String get adminClearDates => 'Очистите датуме';

  @override
  String get adminActivitySeverityAll => 'Сви нивои озбиљности';

  @override
  String get adminActivityDateRange => 'Опсег датума';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Учитавање дневника активности није успело: $error';
  }

  @override
  String get adminNoActivityEntries => 'Нема уноса активности';

  @override
  String get adminEditDeviceName => 'Уредите назив уређаја';

  @override
  String get adminCustomName => 'Прилагођено име';

  @override
  String get adminDeviceNameUpdated => 'Назив уређаја је ажуриран';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Ажурирање уређаја није успело: $error';
  }

  @override
  String get adminDeleteDevice => 'Избриши уређај';

  @override
  String get adminDeviceDeleted => 'Уређај је избрисан';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Брисање уређаја није успело: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Уклонити уређај „$name”? Корисник ће морати поново да се пријави на овом уређају.';
  }

  @override
  String get adminDeleteAllDevices => 'Обриши све уређаје';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Уклонити $count уређаја? Обухваћени корисници мораће поново да се пријаве. Ваш тренутни уређај није обухваћен.',
      few:
          'Уклонити $count уређаја? Обухваћени корисници мораће поново да се пријаве. Ваш тренутни уређај није обухваћен.',
      one:
          'Уклонити $count уређај? Обухваћени корисници мораће поново да се пријаве. Ваш тренутни уређај није обухваћен.',
    );
    return '$_temp0';
  }

  @override
  String get adminDevicesDeletedAll => 'Уређаји су уклоњени';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Неки уређаји су уклоњени; $count није било могуће уклонити.';
  }

  @override
  String get adminDevicesLoadFailed => 'Учитавање уређаја није успело';

  @override
  String get adminSearchDevices => 'Претражите уређаје';

  @override
  String get adminThisDevice => 'Овај уређај';

  @override
  String get adminEditName => 'Уреди име';

  @override
  String get adminLibrariesLoadFailed => 'Учитавање библиотека није успело';

  @override
  String get adminNoLibraries => 'Ниједна библиотека није конфигурисана';

  @override
  String get adminScanAllLibraries => 'Скенирај све библиотеке';

  @override
  String get adminAddLibrary => 'Додај библиотеку';

  @override
  String adminScanFailed(String error) {
    return 'Покретање скенирања није успело: $error';
  }

  @override
  String get adminRenameLibrary => 'Преименуј библиотеку';

  @override
  String get adminNewName => 'Ново име';

  @override
  String adminLibraryRenamed(String name) {
    return 'Библиотека је преименована у „$name”';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Преименовање није успело: $error';
  }

  @override
  String get adminDeleteLibrary => 'Избриши библиотеку';

  @override
  String adminLibraryDeleted(String name) {
    return 'Библиотека „$name” је обрисана';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Брисање библиотеке није успело: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Додавање путање није успело: $error';
  }

  @override
  String get adminRemovePath => 'Уклони путању';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Уклонити „$path” из ове библиотеке?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Уклањање путање није успело: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Опције библиотеке су сачуване';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Чување опција није успело: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Учитавање библиотеке није успело';

  @override
  String get adminNoMediaPaths => 'Ниједна путања медија није конфигурисана';

  @override
  String get adminAddPath => 'Додај путању';

  @override
  String get adminBrowseFilesystem => 'Прегледајте систем датотека сервера:';

  @override
  String get adminSaveOptions => 'Саве Оптионс';

  @override
  String get adminPreferredMetadataLanguage => 'Жељени језик метаподатака';

  @override
  String get adminMetadataLanguageHint => 'нпр. ен, де, фр';

  @override
  String get adminMetadataCountryCode => 'Метаподаци код земље';

  @override
  String get adminMetadataCountryHint => 'нпр. САД, ДЕ, ФР';

  @override
  String get adminLibraryTabPaths => 'Путање';

  @override
  String get adminLibraryTabOptions => 'Опције';

  @override
  String get adminLibraryTabDownloaders => 'Преузимачи';

  @override
  String get adminLibMetadataSavers => 'Чување метаподатака';

  @override
  String get adminLibSubtitleDownloaders => 'Преузимачи титлова';

  @override
  String get adminLibLyricDownloaders => 'Преузимачи текстова песама';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Преузимачи метаподатака: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Преузимање слика: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Овај сервер не нуди преузимаче за ову врсту библиотеке.';

  @override
  String get adminLibrarySectionGeneral => 'Опште';

  @override
  String get adminLibrarySectionMetadata => 'Метаподаци';

  @override
  String get adminLibrarySectionEmbedded => 'Уграђени подаци';

  @override
  String get adminLibrarySectionSubtitles => 'Титлови';

  @override
  String get adminLibrarySectionImages => 'Слике';

  @override
  String get adminLibrarySectionSeries => 'Серије';

  @override
  String get adminLibrarySectionMusic => 'Музика';

  @override
  String get adminLibrarySectionMovies => 'Филмови';

  @override
  String get adminLibRealtimeMonitor => 'Омогући надзор у реалном времену';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Откриј промене датотека и аутоматски их обради.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Третирај архиве као медијске датотеке';

  @override
  String get adminLibEnablePhotos => 'Прикажи фотографије';

  @override
  String get adminLibSaveLocalMetadata => 'Сачувај графику у медијске фасцикле';

  @override
  String get adminLibRefreshInterval => 'Аутоматско освежавање метаподатака';

  @override
  String get adminLibRefreshNever => 'Никад';

  @override
  String get adminLibDefault => 'Подразумевано';

  @override
  String get adminLibDisplayTitle => 'Приказ';

  @override
  String get adminLibDisplaySection => 'Приказ библиотеке';

  @override
  String get adminLibFolderView =>
      'Прикажи приказ фасцикли за обичне медијске фасцикле';

  @override
  String get adminLibSpecialsInSeasons =>
      'Прикажи специјалне епизоде унутар сезона у којима су емитоване';

  @override
  String get adminLibGroupMovies => 'Групиши филмове у колекције';

  @override
  String get adminLibGroupShows => 'Групиши серије у колекције';

  @override
  String get adminLibExternalSuggestions =>
      'Прикажи спољни садржај у предлозима';

  @override
  String get adminLibDateAddedSection => 'Понашање датума додавања';

  @override
  String get adminLibDateAddedLabel => 'Користи датум додавања из';

  @override
  String get adminLibDateAddedImport => 'Датум скенирања у библиотеку';

  @override
  String get adminLibDateAddedFile => 'Датум креирања датотеке';

  @override
  String get adminLibMetadataTitle => 'Метаподаци и слике';

  @override
  String get adminLibMetadataLangSection => 'Жељени језик метаподатака';

  @override
  String get adminLibChaptersSection => 'Поглавља';

  @override
  String get adminLibDummyChapterDuration =>
      'Трајање заменског поглавља (секунде)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Дужина поглавља која се генеришу за медије без њих. Поставите на 0 за онемогућавање.';

  @override
  String get adminLibChapterImageResolution => 'Резолуција слике поглавља';

  @override
  String get adminLibNfoTitle => 'NFO подешавања';

  @override
  String get adminLibNfoHelp =>
      'NFO метаподаци су компатибилни са Kodi-јем и сличним клијентима. Подешавања се примењују на све библиотеке које чувају NFO метаподатке.';

  @override
  String get adminLibKodiUser =>
      'Корисник чији се подаци о гледању чувају у NFO датотекама';

  @override
  String get adminLibSaveImagePaths => 'Сачувај путање слика у NFO датотекама';

  @override
  String get adminLibPathSubstitution =>
      'Омогући замену путања за путање слика у NFO датотекама';

  @override
  String get adminLibExtraThumbs =>
      'Копирај extrafanart слике у фасциклу extrathumbs';

  @override
  String get adminLibNone => 'Ништа';

  @override
  String adminLibRefreshDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дана',
      few: '$days дана',
      one: '$days дан',
    );
    return '$_temp0';
  }

  @override
  String get adminLibEmbeddedTitles => 'Користи уграђене наслове';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Користи уграђене наслове за додатке';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Користи уграђене податке о епизодама';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Дозволи уграђене титлове';

  @override
  String get adminLibEmbeddedAllowAll => 'Дозволи све';

  @override
  String get adminLibEmbeddedAllowText => 'Само текст';

  @override
  String get adminLibEmbeddedAllowImage => 'Само слика';

  @override
  String get adminLibEmbeddedAllowNone => 'Ништа';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Прескочи преузимање ако постоје уграђени титлови';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Прескочи преузимање ако се аудио-запис подудара са језиком преузимања';

  @override
  String get adminLibRequirePerfectMatch =>
      'Захтевај савршено подударање титлова';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Сачувај титлове у медијске фасцикле';

  @override
  String get adminLibChapterImageExtraction => 'Издвоји слике поглавља';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Издвоји слике поглавља током скенирања библиотеке';

  @override
  String get adminLibTrickplayExtraction => 'Омогући издвајање trickplay слика';

  @override
  String get adminLibTrickplayDuringScan =>
      'Издвоји trickplay слике током скенирања библиотеке';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Сачувај trickplay слике у медијске фасцикле';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Аутоматски споји серије распоређене у више фасцикли';

  @override
  String get adminLibSeasonZeroName => 'Приказани назив сезоне нула';

  @override
  String get adminLibLufsScan =>
      'Омогући LUFS скенирање за нормализацију звука';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Преферирај нестандардну ознаку извођача';

  @override
  String get adminLibAutoAddToCollection =>
      'Аутоматски додај филмове у колекције';

  @override
  String get adminLibraryNameRequired => 'Назив библиотеке је обавезан';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Креирање библиотеке није успело: $error';
  }

  @override
  String get adminLibraryName => 'Назив библиотеке';

  @override
  String get adminSelectedPaths => 'Изабране путање:';

  @override
  String get adminNoPathsAdded =>
      'Нема додатих путања (могу се додати касније)';

  @override
  String get adminCreateLibrary => 'Креирајте библиотеку';

  @override
  String get paths => 'Путања:';

  @override
  String get adminDisableUser => 'Онемогући корисника';

  @override
  String get adminEnableUser => 'Омогући корисника';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Онемогућити корисника $name? Неће моћи да се пријави.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Омогућити корисника $name? Моћи ће поново да се пријави.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Корисник „$name” је онемогућен';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Корисник „$name” је омогућен';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Ажурирање правила корисника није успело: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Учитавање корисника није успело';

  @override
  String get adminSearchUsers => 'Претражите кориснике';

  @override
  String get adminEditUser => 'Уреди корисника';

  @override
  String get adminAddUser => 'Додај корисника';

  @override
  String adminUserCreateFailed(String error) {
    return 'Креирање корисника није успело: $error';
  }

  @override
  String get adminCreateUser => 'Креирај корисника';

  @override
  String get adminPasswordOptional => 'Лозинка (опционо)';

  @override
  String get adminUsernameRequired => 'Корисничко име не може бити празно';

  @override
  String get adminNoProfileChanges => 'Нема промена профила за чување';

  @override
  String get adminProfileSaved => 'Профил је сачуван';

  @override
  String adminSaveFailed(String error) {
    return 'Чување није успело: $error';
  }

  @override
  String get adminPermissionsSaved => 'Дозволе су сачуване';

  @override
  String get adminPasswordsMismatch => 'Лозинке се не поклапају';

  @override
  String adminFailed(String error) {
    return 'Неуспешно: $error';
  }

  @override
  String get adminUserLoadFailed => 'Учитавање корисника није успело';

  @override
  String get adminBackToUsers => 'Назад на кориснике';

  @override
  String get adminSaveProfile => 'Сачувај профил';

  @override
  String get adminDeleteUser => 'Избриши корисника';

  @override
  String get admin => 'Админ';

  @override
  String get adminFullAccessWarning =>
      'Администратори имају потпун приступ серверу. Грант са опрезом.';

  @override
  String get administrator => 'Администратор';

  @override
  String get adminHiddenUser => 'Скривени корисник';

  @override
  String get adminAllowMediaPlayback => 'Дозволи репродукцију медија';

  @override
  String get adminAllowAudioTranscoding => 'Дозволи аудио транскодирање';

  @override
  String get adminAllowVideoTranscoding => 'Дозволи видео транскодирање';

  @override
  String get adminAllowRemuxing => 'Дозволи ремуксовање';

  @override
  String get adminForceRemoteTranscoding =>
      'Принудно прекодирање удаљеног извора';

  @override
  String get adminAllowContentDeletion => 'Дозволи брисање садржаја';

  @override
  String get adminAllowContentDownloading => 'Дозволите преузимање садржаја';

  @override
  String get adminAllowPublicSharing => 'Дозволи јавно дељење';

  @override
  String get adminAllowRemoteControl =>
      'Дозволите даљинско управљање другим корисницима';

  @override
  String get adminAllowSharedDeviceControl =>
      'Дозволите контролу дељеног уређаја';

  @override
  String get adminAllowRemoteAccess => 'Дозволите даљински приступ';

  @override
  String get adminRemoteBitrateLimit =>
      'Ограничење брзине преноса удаљеног клијента (бпс)';

  @override
  String get adminLeaveEmptyNoLimit => 'Оставите празно без ограничења';

  @override
  String get adminMaxActiveSessions => 'Максималан број активних сесија';

  @override
  String get adminAllowLiveTvAccess => 'Дозволите приступ ТВ-у уживо';

  @override
  String get adminAllowLiveTvManagement => 'Дозволите управљање ТВ-ом уживо';

  @override
  String get adminAllowCollectionManagement =>
      'Дозволите управљање прикупљањем';

  @override
  String get adminAllowSubtitleManagement => 'Дозволи управљање титловима';

  @override
  String get adminAllowLyricManagement => 'Дозволи управљање текстовима';

  @override
  String get adminSavePermissions => 'Сачувај дозволе';

  @override
  String get adminEnableAllLibraryAccess =>
      'Омогућите приступ свим библиотекама';

  @override
  String get adminSaveAccess => 'Сачувај приступ';

  @override
  String get adminChangePassword => 'Промени лозинку';

  @override
  String get adminNewPassword => 'Нова лозинка';

  @override
  String get adminConfirmPassword => 'Потврдите лозинку';

  @override
  String get adminSetPassword => 'Подесите лозинку';

  @override
  String get adminResetPassword => 'Ресет Пассворд';

  @override
  String get adminPasswordReset => 'Ресетовање лозинке';

  @override
  String get adminPasswordUpdated => 'Лозинка је ажурирана';

  @override
  String get adminUserSettings => 'Корисничка подешавања';

  @override
  String get adminLibraryAccess => 'Приступ библиотеци';

  @override
  String get adminDeviceAndChannelAccess => 'Приступ уређају и каналу';

  @override
  String get adminEnableAllDevices => 'Омогућите приступ свим уређајима';

  @override
  String get adminEnableAllChannels => 'Омогућите приступ свим каналима';

  @override
  String get adminParentalControl => 'Родитељски надзор';

  @override
  String get adminMaxParentalRating => 'Највиша дозвољена родитељска оцена';

  @override
  String get adminMaxParentalRatingHint =>
      'Садржај са вишом оценом биће сакривен овом кориснику.';

  @override
  String get adminParentalRatingNone => 'Ништа';

  @override
  String get adminBlockUnratedItems =>
      'Блокирај ставке без оцене или са непрепознатом оценом';

  @override
  String get adminUnratedBook => 'Књиге';

  @override
  String get adminUnratedChannelContent => 'Канали';

  @override
  String get adminUnratedLiveTvChannel => 'ТВ уживо';

  @override
  String get adminUnratedMovie => 'Филмови';

  @override
  String get adminUnratedMusic => 'Музика';

  @override
  String get adminUnratedTrailer => 'Најаве';

  @override
  String get adminUnratedSeries => 'Серије';

  @override
  String get adminAccessSchedules => 'Распореди приступа';

  @override
  String get adminAccessSchedulesHint =>
      'Дозволи приступ само током доле наведених термина. Ако распоред није постављен, приступ је дозвољен цео дан.';

  @override
  String get adminAddSchedule => 'Додај распоред';

  @override
  String get adminScheduleDay => 'Дан';

  @override
  String get adminScheduleStart => 'Почетак';

  @override
  String get adminScheduleEnd => 'Крај';

  @override
  String get adminDayEveryday => 'Сваки дан';

  @override
  String get adminDayWeekday => 'Радни дан';

  @override
  String get adminDayWeekend => 'Викенд';

  @override
  String get adminDaySunday => 'Недеља';

  @override
  String get adminDayMonday => 'Понедељак';

  @override
  String get adminDayTuesday => 'Уторак';

  @override
  String get adminDayWednesday => 'Среда';

  @override
  String get adminDayThursday => 'Четвртак';

  @override
  String get adminDayFriday => 'Петак';

  @override
  String get adminDaySaturday => 'Субота';

  @override
  String get adminAllowedTags => 'Дозвољене ознаке';

  @override
  String get adminAllowedTagsHint =>
      'Приказује се само садржај са овим ознакама. Оставите празно да бисте дозволили све.';

  @override
  String get adminBlockedTags => 'Блокиране ознаке';

  @override
  String get adminBlockedTagsHint =>
      'Садржај са овим ознакама сакривен је овом кориснику.';

  @override
  String get adminAddTag => 'Додај ознаку';

  @override
  String get adminEnabledDevices => 'Омогућени уређаји';

  @override
  String get adminEnabledChannels => 'Омогућени канали';

  @override
  String get adminAuthProvider => 'Провајдер аутентификације';

  @override
  String get adminPasswordResetProvider => 'Провајдер ресетовања лозинке';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Максималан број неуспелих покушаја пријаве пре закључавања';

  @override
  String get adminLoginAttemptsHint =>
      'Поставите на 0 за подразумевано или -1 за онемогућавање закључавања.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay приступ';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Дозволи креирање група и придруживање групама';

  @override
  String get adminSyncPlayJoin => 'Дозволи придруживање групама';

  @override
  String get adminSyncPlayNone => 'Без приступа';

  @override
  String get adminContentDeletionFolders => 'Дозволи брисање садржаја из';

  @override
  String get adminResetPasswordWarning =>
      'Ово ће уклонити лозинку. Корисник ће моћи да се пријави без лозинке.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Сервер је вратио HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Да ли сте сигурни да желите да обришете корисника $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Корисник „$name” је обрисан';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Брисање корисника није успело: $error';
  }

  @override
  String get adminCreateApiKey => 'Креирајте АПИ кључ';

  @override
  String get adminAppName => 'Назив апликације';

  @override
  String get adminApiKeyCreated => 'АПИ кључ креиран';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Кључ је успешно креиран. Сервер није вратио токен. Проверите АПИ кључеве сервера.';

  @override
  String get adminKeyCopied => 'Кључ је копиран у међуспремник';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Креирање кључа није успело: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Токен кључа недостаје у одговору сервера';

  @override
  String get adminRevokeApiKey => 'Опозови АПИ кључ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Опозвати кључ за $name?';
  }

  @override
  String get adminApiKeyRevoked => 'АПИ кључ је опозван';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Опозивање кључа није успело: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Учитавање АПИ кључева није успело';

  @override
  String get adminApiKeysTitle => 'АПИ кључеви';

  @override
  String get adminCreateKey => 'Цреате Кеи';

  @override
  String get adminNoApiKeys => 'Нису пронађени АПИ кључеви';

  @override
  String get adminUnknownApp => 'Непозната апликација';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nКреирано: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Направи резервну копију';

  @override
  String get adminBackupInclude =>
      'Изаберите шта ће бити укључено у резервну копију.';

  @override
  String get adminBackupDatabase => 'База података';

  @override
  String get adminBackupDatabaseAlways => 'Увек укључено';

  @override
  String get adminBackupMetadata => 'Метаподаци';

  @override
  String get adminBackupSubtitles => 'Титлови';

  @override
  String get adminBackupTrickplay => 'Trickplay слике';

  @override
  String get adminCreatingBackup => 'Прављење резервне копије...';

  @override
  String get adminBackupCreated => 'Резервна копија је успешно направљена';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Прављење резервне копије није успело: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'У одговору сервера недостаје резервна путања';

  @override
  String adminBackupManifest(String name) {
    return 'Манифест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Учитавање манифеста није успело: $error';
  }

  @override
  String get adminConfirmRestore => 'Потврдите враћање';

  @override
  String get adminRestoringBackup => 'Враћање резервне копије...';

  @override
  String adminRestoreFailed(String error) {
    return 'Враћање резервне копије није успело: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Учитавање резервних копија није успело';

  @override
  String get adminCreateBackup => 'Направите резервну копију';

  @override
  String get adminNoBackups => 'Нису пронађене резервне копије';

  @override
  String get adminViewDetails => 'Прикажи детаље';

  @override
  String get restore => 'Ресторе';

  @override
  String get adminLogsLoadFailed => 'Учитавање евиденције сервера није успело';

  @override
  String get adminNoLogFiles => 'Нису пронађене датотеке евиденције';

  @override
  String get adminLogCopied => 'Дневник је копиран у међуспремник';

  @override
  String get adminSaveLogFile => 'Сачувај датотеку евиденције';

  @override
  String adminSavedTo(String path) {
    return 'Сачувано у $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Чување датотеке није успело: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Учитавање датотеке $fileName није успело';
  }

  @override
  String get adminSearchInLog => 'Тражи у дневнику';

  @override
  String get adminNoMatchingLines => 'Нема одговарајућих линија';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Учитавање задатака није успело: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Није пронађен ниједан заказани задатак';

  @override
  String get adminNoTasksMatchFilter =>
      'Ниједан задатак не одговара тренутном филтеру';

  @override
  String adminTaskStartFailed(String error) {
    return 'Покретање задатка није успело: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Заустављање задатка није успело: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Учитавање задатка није успело: $error';
  }

  @override
  String get adminRunNow => 'Рун Нов';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Уклањање окидача није успело: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Додавање окидача није успело: $error';
  }

  @override
  String get adminLastExecution => 'Ласт Екецутион';

  @override
  String get adminTriggers => 'Триггерс';

  @override
  String get adminAddTrigger => 'Додај окидач';

  @override
  String get adminNoTriggers => 'Ниједан окидач није конфигурисан';

  @override
  String get adminTriggerType => 'Тип окидача';

  @override
  String get adminTimeLimit => 'Временско ограничење (опционо)';

  @override
  String get adminNoLimit => 'Нема ограничења';

  @override
  String adminHours(String hours) {
    return '$hours ч';
  }

  @override
  String get adminDayOfWeek => 'Дан у недељи';

  @override
  String get adminSearchPlugins => 'Претражи додатке...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Промена стања додатка није успела: $error';
  }

  @override
  String get adminUninstallPlugin => 'Деинсталирајте додатак';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Да ли сте сигурни да желите да деинсталирате „$name”?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Деинсталација додатка није успела: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Инсталација пакета није успела: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Инсталација ажурирања није успела: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Учитавање додатака није успело: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Ниједан додатак не одговара вашој претрази';

  @override
  String get adminNoPluginsInstalled => 'Нема инсталираних додатака';

  @override
  String adminInstallUpdate(String version) {
    return 'Инсталирај ажурирање (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Учитавање каталога није успело: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Ниједан пакет не одговара вашој претрази';

  @override
  String get adminNoPackagesAvailable => 'Нема доступних пакета';

  @override
  String get adminExperimentalIntegration => 'Експериментална интеграција';

  @override
  String get adminExperimentalWarning =>
      'Интеграција поставки додатака је и даље експериментална. Неке странице са подешавањима можда неће бити исправно приказане.';

  @override
  String get continueAction => 'Настави';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '„$name” биће уклоњен након поновног покретања сервера';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Деинсталација није успела: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Ажурирање „$name” на v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Није могуће отворити подешавања: недостаје токен за потврду.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Учитавање додатка није успело: $error';
  }

  @override
  String get adminPluginNotFound => 'Додатак није пронађен';

  @override
  String adminPluginVersion(String version) {
    return 'Верзија $version';
  }

  @override
  String get adminEnablePlugin => 'Омогући додатак';

  @override
  String get adminPluginSettingsPage => 'Страница подешавања додатка';

  @override
  String get adminRevisionHistory => 'Историја ревизија';

  @override
  String get adminNoChangelog => 'Није доступан дневник промена.';

  @override
  String get adminRemoveRepository => 'Уклоните спремиште';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Да ли сте сигурни да желите да уклоните „$name”?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Чување репозиторијума није успело: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Учитавање репозиторијума није успело: $error';
  }

  @override
  String get adminRepositoryNameHint => 'нпр. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'УРЛ спремишта';

  @override
  String get adminAddEntry => 'Додајте унос';

  @override
  String get adminInvalidUrl => 'Неважећи УРЛ';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Није могуће учитати подешавања додатка: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Није могуће отворити $uri';
  }

  @override
  String get adminOpenInBrowser => 'Отворите у претраживачу';

  @override
  String get adminOpenExternally => 'Отворен споља';

  @override
  String get adminGeneralSettings => 'Општа подешавања';

  @override
  String get adminServerName => 'Име сервера';

  @override
  String get adminPreferredMetadataCountry => 'Жељена земља са метаподацима';

  @override
  String get adminCachePath => 'Путања кеша';

  @override
  String get adminMetadataPath => 'Путања метаподатака';

  @override
  String get adminLibraryScanConcurrency =>
      'Конкурентност скенирања библиотеке';

  @override
  String get adminParallelImageEncodingLimit =>
      'Ограничење кодирања паралелних слика';

  @override
  String get adminSlowResponseThreshold => 'Праг спорог одзива (мс)';

  @override
  String get adminBrandingSaved => 'Подешавања брендирања су сачувана';

  @override
  String get adminBrandingLoadFailed =>
      'Учитавање подешавања брендирања није успело';

  @override
  String get adminLoginDisclaimer => 'Одрицање од одговорности';

  @override
  String get adminLoginDisclaimerHint =>
      'ХТМЛ приказан испод обрасца за пријаву';

  @override
  String get adminCustomCss => 'Прилагођени ЦСС';

  @override
  String get adminCustomCssHint => 'Прилагођени ЦСС примењен на веб интерфејс';

  @override
  String get adminEnableSplashScreen => 'Омогућите почетни екран';

  @override
  String get adminStreamingSaved => 'Подешавања стримовања су сачувана';

  @override
  String get adminStreamingLoadFailed =>
      'Учитавање подешавања стримовања није успело';

  @override
  String get adminStreamingDescription =>
      'Поставите глобална ограничења протока у битовима за удаљене везе.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ограничење брзине преноса удаљеног клијента (Мбпс)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Оставите празно или 0 за неограничено';

  @override
  String get adminPlaybackSaved => 'Подешавања репродукције су сачувана';

  @override
  String get adminPlaybackLoadFailed =>
      'Учитавање подешавања репродукције није успело';

  @override
  String get adminPlaybackTranscoding => 'Репродукција / Транскодирање';

  @override
  String get adminHardwareAcceleration => 'Хардверско убрзање';

  @override
  String get adminVaapiDevice => 'ВА-АПИ уређај';

  @override
  String get adminEnableHardwareEncoding => 'Омогућите хардверско кодирање';

  @override
  String get adminEnableHardwareDecoding => 'Омогући хардверско декодирање за:';

  @override
  String get adminEncodingThreads => 'Енцодинг тхреадс';

  @override
  String get adminAutomatic => '0 = аутоматски';

  @override
  String get adminTranscodingTempPath => 'Транскодирање темп';

  @override
  String get adminEnableFallbackFont => 'Омогући резервни фонт';

  @override
  String get adminFallbackFontPath => 'Путања резервног фонта';

  @override
  String get adminAllowSegmentDeletion => 'Дозволи брисање сегмента';

  @override
  String get adminSegmentKeepSeconds => 'Задржавање сегмента (секунде)';

  @override
  String get adminThrottleBuffering => 'Пуферовање гаса';

  @override
  String get adminTrickplaySaved => 'Trickplay подешавања су сачувана';

  @override
  String get adminTrickplayLoadFailed =>
      'Учитавање Trickplay подешавања није успело';

  @override
  String get adminEnableHardwareAcceleration => 'Омогућите хардверско убрзање';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Омогући екстракцију само кључног оквира';

  @override
  String get adminKeyFrameSubtitle => 'Брже, али нижа прецизност';

  @override
  String get adminScanBehavior => 'Понашање скенирања';

  @override
  String get adminProcessPriority => 'Приоритет процеса';

  @override
  String get adminImageSettings => 'Подешавања слике';

  @override
  String get adminIntervalMs => 'Интервал (мс)';

  @override
  String get adminCaptureFrameSubtitle => 'Колико често снимати кадрове';

  @override
  String get adminWidthResolutions => 'Резолуције ширине';

  @override
  String get adminTileWidth => 'Ширина плочице';

  @override
  String get adminTileHeight => 'Висина плочица';

  @override
  String get adminQualitySubtitle =>
      'Ниже вредности = бољи квалитет, веће датотеке';

  @override
  String get adminProcessThreads => 'Процесне нити';

  @override
  String get adminResumeSaved => 'Подешавања настављања су сачувана';

  @override
  String get adminResumeLoadFailed =>
      'Учитавање подешавања за наставак није успело';

  @override
  String get adminResumeDescription =>
      'Конфигуришите када садржај треба да буде означен као делимично репродукован или потпуно репродукован.';

  @override
  String get adminMinResumePercentage => 'Минимални проценат биографије';

  @override
  String get adminMinResumeSubtitle =>
      'Садржај мора да се репродукује изнад овог процента да би се сачувао напредак';

  @override
  String get adminMaxResumePercentage => 'Максимални проценат резимеа';

  @override
  String get adminMaxResumeSubtitle =>
      'Сматра се да је садржај потпуно репродукован након овог процента';

  @override
  String get adminMinResumeDuration => 'Минимално трајање наставка (секунде)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Ставке краће од овога се не могу поново покренути';

  @override
  String get adminMinAudiobookResume =>
      'Минимални проценат резимеа аудио књиге';

  @override
  String get adminMaxAudiobookResume =>
      'Максимални проценат наставка аудио књиге';

  @override
  String get adminNetworkingSaved =>
      'Подешавања умрежавања су сачувана. Можда ће бити потребно поновно покретање сервера.';

  @override
  String get adminNetworkingLoadFailed =>
      'Учитавање мрежних подешавања није успело';

  @override
  String get adminNetworkingWarning =>
      'Промене мрежних подешавања могу захтевати поновно покретање сервера.';

  @override
  String get adminEnableRemoteAccess => 'Омогућите даљински приступ';

  @override
  String get ports => 'Портс';

  @override
  String get adminHttpPort => 'ХТТП порт';

  @override
  String get adminHttpsPort => 'ХТТПС порт';

  @override
  String get adminPublicHttpsPort => 'Јавни ХТТПС порт';

  @override
  String get adminBaseUrl => 'Основни УРЛ';

  @override
  String get adminBaseUrlHint => 'нпр. /jellyfin';

  @override
  String get https => 'ХТТПС';

  @override
  String get adminEnableHttps => 'Омогућите ХТТПС';

  @override
  String get adminLocalNetwork => 'Локална мрежа';

  @override
  String get adminLocalNetworkAddresses => 'Локалне мрежне адресе';

  @override
  String get adminKnownProxies => 'Познати пуномоћници';

  @override
  String get adminRemoteIpFilter => 'Удаљени ИП филтер';

  @override
  String get adminRemoteIpFilterEntries => 'Удаљени ИП филтер';

  @override
  String get adminCertificatePath => 'Путања сертификата';

  @override
  String get whitelist => 'Бела листа';

  @override
  String get blacklist => 'Црна листа';

  @override
  String get notSet => 'Није постављено';

  @override
  String get adminMetadataSaved => 'Метаподаци су сачувани';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Учитавање метаподатака није успело: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Чување метаподатака није успело: $error';
  }

  @override
  String get adminRefreshMetadata => 'Освежите метаподатке';

  @override
  String get recursive => 'Рекурзивно';

  @override
  String get adminReplaceAllMetadata => 'Замените све метаподатке';

  @override
  String get adminReplaceAllImages => 'Замените све слике';

  @override
  String get adminMetadataRefreshRequested =>
      'Захтевано је освежавање метаподатака';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Освежавање метаподатака није успело: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Нису пронађена удаљена подударања';

  @override
  String get adminRemoteResults => 'Ремоте Ресултс';

  @override
  String get adminRemoteMetadataApplied => 'Примењени су удаљени метаподаци';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Удаљена претрага није успела: $error';
  }

  @override
  String get adminUpdateContentType => 'Ажурирајте тип садржаја';

  @override
  String get adminContentType => 'Тип садржаја';

  @override
  String get adminContentTypeUpdated => 'Тип садржаја је ажуриран';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Ажурирање врсте садржаја није успело: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Учитавање уређивача метаподатака није успело';

  @override
  String get adminNoPeopleEntries => 'Нема уноса људи';

  @override
  String get adminNoExternalIds => 'Нема доступних спољних ИД-ова';

  @override
  String adminImageUpdated(String imageType) {
    return 'Слика $imageType је ажурирана';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Преузимање слике није успело: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Неподржан формат слике';

  @override
  String get adminImageReadFailed => 'Читање изабране слике није успело';

  @override
  String adminImageUploaded(String imageType) {
    return 'Слика $imageType је отпремљена';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Отпремање слике није успело: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Обриши слику $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Слика $imageType је обрисана';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Брисање слике није успело: $error';
  }

  @override
  String get adminAllProviders => 'Сви провајдери';

  @override
  String get adminNoRemoteImages => 'Нису пронађене удаљене слике';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Откривање тјунера није успело: $error';
  }

  @override
  String get adminAddTuner => 'Додај тјунер';

  @override
  String get adminEditTuner => 'Уреди тјунер';

  @override
  String get adminTunerTypeM3u => 'M3U тјунер';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Датотека или URL';

  @override
  String get adminTunerIpAddress => 'IP адреса тјунера';

  @override
  String get adminTunerFriendlyName => 'Приказани назив';

  @override
  String get adminTunerUserAgent => 'Кориснички агент';

  @override
  String get adminTunerCount => 'Ограничење истовремених веза';

  @override
  String get adminTunerCountHelp =>
      'Максималан број стримова које тјунер дозвољава истовремено. Поставите на 0 за неограничено.';

  @override
  String get adminTunerFallbackBitrate =>
      'Резервни максимални проток стриминга';

  @override
  String get adminTunerImportFavoritesOnly => 'Увези само омиљене канале';

  @override
  String get adminTunerAllowHwTranscoding => 'Дозволи хардверско транскодирање';

  @override
  String get adminTunerAllowFmp4 => 'Дозволи fMP4 контејнер за транскодирање';

  @override
  String get adminTunerAllowStreamSharing => 'Дозволи дељење стрима';

  @override
  String get adminTunerEnableStreamLooping => 'Омогући понављање стрима';

  @override
  String get adminTunerIgnoreDts => 'Занемари DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Читај улаз при изворној брзини кадрова';

  @override
  String get adminEditProvider => 'Уреди провајдера';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Датотека или URL';

  @override
  String get adminXmltvMoviePrefix => 'Префикс филма';

  @override
  String get adminXmltvMovieCategories => 'Категорије филмова';

  @override
  String get adminXmltvCategoriesHelp =>
      'Више категорија одвојите усправном цртом.';

  @override
  String get adminXmltvKidsCategories => 'Категорије за децу';

  @override
  String get adminXmltvNewsCategories => 'Категорије вести';

  @override
  String get adminXmltvSportsCategories => 'Категорије спорта';

  @override
  String get adminSdUsername => 'Корисничко име';

  @override
  String get adminSdPassword => 'Лозинка';

  @override
  String get adminSdCountry => 'Држава';

  @override
  String get adminSdCountrySelect => 'Изаберите државу';

  @override
  String get adminSdPostalCode => 'Поштански број';

  @override
  String get adminSdGetListings => 'Преузми програмски распоред';

  @override
  String get adminSdListings => 'Програмски распоред';

  @override
  String get adminEnableAllTuners => 'Омогући све тјунере';

  @override
  String get adminTunerType => 'Тип тјунера';

  @override
  String get adminTunerAdded => 'Тунер је додао';

  @override
  String adminTunerAddFailed(String error) {
    return 'Додавање тјунера није успело: $error';
  }

  @override
  String get adminAddGuideProvider => 'Додајте добављача водича';

  @override
  String get adminProviderType => 'Тип провајдера';

  @override
  String get adminProviderAdded => 'Провајдер је додат';

  @override
  String adminProviderAddFailed(String error) {
    return 'Додавање провајдера није успело: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Уклањање тјунера није успело: $error';
  }

  @override
  String get adminTunerResetRequested => 'Захтевано је ресетовање тјунера';

  @override
  String adminTunerResetFailed(String error) {
    return 'Ресетовање тјунера није успело: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Ова врста тјунера не подржава ресетовање.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Уклањање провајдера није успело: $error';
  }

  @override
  String get adminRecordingSettings => 'Подешавања снимања';

  @override
  String get adminPrePadding => 'Унапред допуна (минути)';

  @override
  String get adminPostPadding => 'Допуна (минути)';

  @override
  String get adminRecordingPath => 'Путања снимања';

  @override
  String get adminSeriesRecordingPath => 'Путања за снимање серије';

  @override
  String get adminMovieRecordingPath => 'Путања за снимање филмова';

  @override
  String get adminGuideDays => 'Број дана података ТВ водича';

  @override
  String get adminGuideDaysAuto => 'Аутоматски';

  @override
  String adminGuideDaysValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дана',
      few: '$days дана',
      one: '$days дан',
    );
    return '$_temp0';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Путања апликације за накнадну обраду';

  @override
  String get adminRecordingPostProcessorArgs => 'Аргументи за накнадну обраду';

  @override
  String get adminSaveRecordingNfo => 'Сачувај NFO метаподатке снимка';

  @override
  String get adminSaveRecordingImages => 'Сачувај слике снимка';

  @override
  String get adminLiveTvSectionTiming => 'Временска подешавања';

  @override
  String get adminLiveTvSectionPaths => 'Путање снимања';

  @override
  String get adminLiveTvSectionPostProcessing => 'Накнадна обрада';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Подаци ТВ водича: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Подешавања снимања су сачувана';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Чување подешавања није успело: $error';
  }

  @override
  String get adminSetChannelMappings => 'Подесите мапирања канала';

  @override
  String get adminMappingJson => 'Мапирање ЈСОН-а';

  @override
  String get adminMappingJsonHint =>
      'Пример: мапирања ЈСОН корисног оптерећења';

  @override
  String get adminChannelMappingsUpdated => 'Мапирања канала су ажурирана';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Ажурирање мапирања није успело: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Учитавање ТВ администрације уживо није успело';

  @override
  String get adminTunerDevices => 'Тјунерски уређаји';

  @override
  String get adminNoTunerHosts => 'Нема конфигурисаних хостова тјунера';

  @override
  String get adminGuideProviders => 'Водич Провајдери';

  @override
  String get adminRefreshGuideData => 'Освежи податке ТВ водича';

  @override
  String get adminGuideRefreshStarted =>
      'Освежавање података ТВ водича је покренуто';

  @override
  String get adminGuideRefreshUnavailable =>
      'Задатак освежавања ТВ водича није доступан на овом серверу.';

  @override
  String get adminAddProvider => 'Додај провајдера';

  @override
  String get adminNoListingProviders =>
      'Ниједан добављач листе није конфигурисан';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Путања снимања: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Путања серија: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Додатак пре: $minutes мин';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Додатак после: $minutes мин';
  }

  @override
  String get adminTunerDiscovery => 'Тунер Дисцовери';

  @override
  String get adminChannelMappings => 'Мапирања канала';

  @override
  String get adminNoDiscoveredTuners => 'Још нема откривених тјунера';

  @override
  String get adminSettingsSaved => 'Подешавања су сачувана';

  @override
  String get adminBackupsNotAvailable =>
      'Резервне копије нису доступне на овој верзији сервера.';

  @override
  String get adminRestoreWarning1 =>
      'Враћање ће заменити СВЕ тренутне серверске податке са резервним подацима.';

  @override
  String get adminRestoreWarning2 =>
      'Тренутна подешавања сервера, корисници и подаци библиотеке ће бити преписани.';

  @override
  String get adminRestoreWarning3 =>
      'Сервер ће се поново покренути након рестаурације.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Вратити резервну копију $name сада?';
  }

  @override
  String get adminRestoreRequested =>
      'Захтевано је враћање. Поновно покретање сервера може прекинути везу са овом сесијом.';

  @override
  String get adminBackupsTitle => 'Резервне копије';

  @override
  String get adminUnknownDate => 'Непознати датум';

  @override
  String get adminUnnamedBackup => 'Неименована резервна копија';

  @override
  String get adminLiveTvNotAvailable =>
      'ТВ администрација уживо није доступна на овој верзији сервера.';

  @override
  String get adminLiveTvTitle => 'ТВ администрација уживо';

  @override
  String get adminApply => 'Примени';

  @override
  String get adminNotSet => 'Није постављено';

  @override
  String get adminReset => 'Ресетуј';

  @override
  String get adminLogsTitle => 'Сервер Логс';

  @override
  String get adminLogsNewestFirst => 'Најновије прво';

  @override
  String get adminLogsOldestFirst => 'Прво најстарији';

  @override
  String get adminLogsJustNow => 'Управо сада';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'пре $minutes мин';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'пре $hours ч';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'пре $days д';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Учитавање датотеке $fileName није успело';
  }

  @override
  String adminLogViewerMatches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count подударања',
      few: '$count подударања',
      one: '$count подударање',
    );
    return '$_temp0';
  }

  @override
  String get adminLogViewerNoMatches => 'Нема одговарајућих линија';

  @override
  String get adminMetadataEditorTitle => 'Уређивач метаподатака';

  @override
  String get adminMetadataIdentify => 'Идентификуј';

  @override
  String get adminMetadataType => 'Тип';

  @override
  String get adminMetadataDetails => 'Детаљи';

  @override
  String get adminMetadataExternalIds => 'Екстерни ИД';

  @override
  String get adminMetadataImages => 'Слике';

  @override
  String get adminMetadataFieldTitle => 'Наслов';

  @override
  String get adminMetadataFieldSortTitle => 'Наслов сортирања';

  @override
  String get adminMetadataFieldOriginalTitle => 'Оригинални наслов';

  @override
  String get adminMetadataFieldPremiereDate => 'Датум премијере (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldEndDate => 'Датум завршетка (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldProductionYear => 'Година производње';

  @override
  String get adminMetadataFieldOfficialRating => 'Званични рејтинг';

  @override
  String get adminMetadataFieldCommunityRating => 'Оцена заједнице';

  @override
  String get adminMetadataFieldCriticRating => 'Оцена критичара';

  @override
  String get adminMetadataFieldTagline => 'Таглине';

  @override
  String get adminMetadataFieldOverview => 'Преглед';

  @override
  String get adminMetadataGenres => 'Жанрови';

  @override
  String get adminMetadataTags => 'Ознаке';

  @override
  String get adminMetadataStudios => 'Студиос';

  @override
  String get adminMetadataPeople => 'Људи';

  @override
  String get adminMetadataAddGenre => 'Додајте жанр';

  @override
  String get adminMetadataAddTag => 'Додај ознаку';

  @override
  String get adminMetadataAddStudio => 'Додајте студио';

  @override
  String get adminMetadataAddPerson => 'Додај особу';

  @override
  String get adminMetadataEditPerson => 'Уреди особу';

  @override
  String get adminMetadataRole => 'Улога';

  @override
  String get adminMetadataImagePrimary => 'Примари';

  @override
  String get adminMetadataImageBackdrop => 'Позадина';

  @override
  String get adminMetadataImageLogo => 'Лого';

  @override
  String get adminMetadataImageBanner => 'Банер';

  @override
  String get adminMetadataImageThumb => 'Тхумб';

  @override
  String get adminMetadataRecursive => 'Рекурзивно';

  @override
  String get adminMetadataProvider => 'Провајдер';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Слика $imageType је ажурирана';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Слика $imageType је отпремљена';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Слика $imageType је обрисана';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Преузимање слике није успело: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Читање изабране слике није успело';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Отпремање слике није успело: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Обриши слику $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Ово уклања тренутну слику из ставке.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Брисање слике није успело: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Изаберите слику $imageType';
  }

  @override
  String get adminMetadataUpload => 'Уплоад';

  @override
  String get adminMetadataUpdate => 'Ажурирај';

  @override
  String get adminMetadataRemoteImage => 'Ремоте имаге';

  @override
  String get adminPluginsInstalled => 'Инсталиран';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Ацтиве';

  @override
  String get adminPluginsRestart => 'Поново покрени';

  @override
  String get adminPluginsNoSearchResults =>
      'Ниједан додатак не одговара вашој претрази';

  @override
  String get adminPluginsNoneInstalled => 'Нема инсталираних додатака';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Доступно ажурирање: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Доступно је ажурирање';

  @override
  String get adminPluginsPendingRemoval =>
      'Чека се уклањање након поновног покретања';

  @override
  String get adminPluginsChangesPending => 'Промене чекају поновно покретање';

  @override
  String get adminPluginsEnable => 'Омогући';

  @override
  String get adminPluginsDisable => 'Онемогући';

  @override
  String get adminPluginsInstallUpdate => 'Инсталирајте ажурирање';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Инсталирај ажурирање (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ниједан пакет не одговара вашој претрази';

  @override
  String get adminPluginsCatalogEmpty => 'Нема доступних пакета';

  @override
  String adminPluginsInstalling(String name) {
    return '„$name” се инсталира...';
  }

  @override
  String get adminPluginDetailExperimental => 'Експериментална интеграција';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Интеграција поставки додатака је и даље експериментална. Нека поља или распореди можда још увек нису исправно приказани.';

  @override
  String get adminPluginDetailToggle404 =>
      'Укључивање додатка није успело. Сервер није могао да пронађе ову верзију додатка. Покушајте да освежите додатке, а затим покушајте поново.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Укључивање додатка није успело. Молимо проверите евиденцију сервера за детаље.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Подешавања – $name';
  }

  @override
  String get adminPluginDetailDetails => 'Детаљи';

  @override
  String get adminPluginDetailDeveloper => 'Девелопер';

  @override
  String get adminPluginDetailRepository => 'Репозиторијум';

  @override
  String get adminPluginDetailBundled => 'У пакету';

  @override
  String get adminPluginDetailEnablePlugin => 'Омогући додатак';

  @override
  String get adminPluginDetailRestartRequired =>
      'Потребно је поновно покретање сервера да би промене ступиле на снагу.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Овај додатак ће бити уклоњен након поновног покретања сервера.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Овај додатак је покварио функционисање и можда неће радити исправно.';

  @override
  String get adminPluginDetailNotSupported =>
      'Тренутна верзија сервера не подржава овај додатак.';

  @override
  String get adminPluginDetailSuperseded =>
      'Овај додатак је замењен новијом верзијом.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Учитавање репозиторијума није успело: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Уклоните спремиште';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Да ли сте сигурни да желите да уклоните „$name”?';
  }

  @override
  String get adminReposRemove => 'Уклони';

  @override
  String adminReposSaveFailed(String error) {
    return 'Чување репозиторијума није успело: $error';
  }

  @override
  String get adminReposEmpty => 'Нема конфигурисаних спремишта';

  @override
  String get adminReposEmptySubtitle =>
      'Додајте спремиште да бисте прегледали доступне додатке';

  @override
  String get adminReposUnnamed => '(неименовано)';

  @override
  String get adminReposEditTitle => 'Уреди спремиште';

  @override
  String get adminReposAddTitle => 'Додај спремиште';

  @override
  String get adminReposUrl => 'УРЛ спремишта';

  @override
  String get adminReposNameHint => 'нпр. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Неважећи УРЛ';

  @override
  String get adminGeneralSettingsTitle => 'Општа подешавања';

  @override
  String get adminGeneralMetadataLanguage => 'Жељени језик метаподатака';

  @override
  String get adminGeneralMetadataLanguageHint => 'нпр. ен, де, фр';

  @override
  String get adminGeneralMetadataCountry => 'Жељена земља са метаподацима';

  @override
  String get adminGeneralMetadataCountryHint => 'нпр. САД, ДЕ, ФР';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Конкурентност скенирања библиотеке';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Ограничење кодирања паралелних слика';

  @override
  String get adminUnknownError => 'Непозната грешка';

  @override
  String get adminBrowse => 'Прегледај';

  @override
  String get adminCloseBrowser => 'Затворите претраживач';

  @override
  String get adminNetworkingTitle => 'Умрежавање';

  @override
  String get adminNetworkingRestartWarning =>
      'Промене мрежних подешавања могу захтевати поновно покретање сервера.';

  @override
  String get adminNetworkingRemoteAccess => 'Омогућите даљински приступ';

  @override
  String get adminNetworkingPorts => 'Портс';

  @override
  String get adminNetworkingHttpPort => 'ХТТП порт';

  @override
  String get adminNetworkingHttpsPort => 'ХТТПС порт';

  @override
  String get adminNetworkingEnableHttps => 'Омогућите ХТТПС';

  @override
  String get adminNetworkingLocalNetwork => 'Локална мрежа';

  @override
  String get adminNetworkingLocalAddresses => 'Локалне мрежне адресе';

  @override
  String get adminNetworkingAddressHint => 'нпр. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Познати пуномоћници';

  @override
  String get adminNetworkingProxyHint => 'нпр. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Бела листа';

  @override
  String get adminNetworkingBlacklist => 'Црна листа';

  @override
  String get adminNetworkingAddEntry => 'Додајте унос';

  @override
  String get adminBrandingTitle => 'Брендирање';

  @override
  String get adminBrandingLoginDisclaimer => 'Одрицање од одговорности';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'ХТМЛ приказан испод обрасца за пријаву';

  @override
  String get adminBrandingCustomCss => 'Прилагођени ЦСС';

  @override
  String get adminBrandingCustomCssHint =>
      'Прилагођени ЦСС примењен на веб интерфејс';

  @override
  String get adminBrandingEnableSplash => 'Омогућите почетни екран';

  @override
  String get adminBrandingSplashUpload => 'Отпреми слику';

  @override
  String get adminBrandingSplashUploaded => 'Уводни екран је ажуриран';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Отпремање уводног екрана није успело';

  @override
  String get adminBrandingSplashDeleted => 'Уводни екран је уклоњен';

  @override
  String get adminBrandingNoSplash => 'Нема прилагођеног уводног екрана';

  @override
  String get adminPlaybackHwAccel => 'Хардверско убрзање';

  @override
  String get adminPlaybackHwAccelLabel => 'Хардверско убрзање';

  @override
  String get adminPlaybackEnableHwEncoding => 'Омогућите хардверско кодирање';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Омогући хардверско декодирање за:';

  @override
  String get adminPlaybackQsvDevice => 'QSV уређај';

  @override
  String get adminPlaybackEnhancedNvdec => 'Омогући побољшани NVDEC декодер';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Преферирај изворни хардверски декодер система';

  @override
  String get adminPlaybackColorDepth => 'Дубина боје хардверског декодирања';

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
      'Омогући Intel H.264 кодер ниске потрошње';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Омогући Intel HEVC кодер ниске потрошње';

  @override
  String get adminPlaybackToneMapping => 'Мапирање тонова';

  @override
  String get adminPlaybackEnableTonemapping => 'Омогући мапирање тонова';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Омогући VPP мапирање тонова';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Омогући VideoToolbox мапирање тонова';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Алгоритам мапирања тонова';

  @override
  String get adminPlaybackTonemappingMode => 'Режим мапирања тонова';

  @override
  String get adminPlaybackTonemappingRange => 'Опсег мапирања тонова';

  @override
  String get adminPlaybackTonemappingDesat => 'Десатурација мапирања тонова';

  @override
  String get adminPlaybackTonemappingPeak => 'Вршна вредност мапирања тонова';

  @override
  String get adminPlaybackTonemappingParam => 'Параметар мапирања тонова';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Осветљеност VPP мапирања тонова';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Контраст VPP мапирања тонова';

  @override
  String get adminPlaybackPresetsQuality =>
      'Предефинисана подешавања и квалитет';

  @override
  String get adminPlaybackEncoderPreset => 'Предефинисано подешавање кодера';

  @override
  String get adminPlaybackH264Crf => 'CRF за H.264 кодирање';

  @override
  String get adminPlaybackH265Crf => 'CRF за H.265 (HEVC) кодирање';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Метод уклањања испреплетаности';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Удвостручи брзину кадрова при уклањању испреплетаности';

  @override
  String get adminPlaybackAudioSection => 'Звук';

  @override
  String get adminPlaybackEnableAudioVbr => 'Омогући VBR кодирање звука';

  @override
  String get adminPlaybackDownmixBoost => 'Појачање downmix-а звука';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Алгоритам стерео downmix-а';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Максимална величина реда за муксовање';

  @override
  String get adminPlaybackAutoOption => 'Аутоматски';

  @override
  String get adminPlaybackEncoding => 'Енцодинг';

  @override
  String get adminPlaybackEncodingThreads => 'Енцодинг тхреадс';

  @override
  String get adminPlaybackFallbackFont => 'Омогући резервни фонт';

  @override
  String get adminPlaybackFallbackFontPath => 'Путања резервног фонта';

  @override
  String get adminPlaybackStreaming => 'Стреаминг';

  @override
  String get adminResumeVideo => 'Видео';

  @override
  String get adminResumeAudiobooks => 'Аудио књиге';

  @override
  String get adminResumeMinAudiobookPct =>
      'Минимални проценат резимеа аудио књиге';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Максимални проценат наставка аудио књиге';

  @override
  String get adminStreamingBitrateLimit =>
      'Ограничење брзине преноса удаљеног клијента (Мбпс)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Оставите празно или 0 за неограничено';

  @override
  String get adminTrickplayHwAccel => 'Омогућите хардверско убрзање';

  @override
  String get adminTrickplayHwEncoding => 'Омогућите хардверско кодирање';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Омогући екстракцију само кључног оквира';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'Брже, али нижа прецизност';

  @override
  String get adminTrickplayNonBlocking => 'Нон-Блоцкинг';

  @override
  String get adminTrickplayBlocking => 'Блокирање';

  @override
  String get adminTrickplayPriorityHigh => 'Високо';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Изнад нормалног';

  @override
  String get adminTrickplayPriorityNormal => 'Нормално';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Испод нормалног';

  @override
  String get adminTrickplayPriorityIdle => 'Идле';

  @override
  String get adminTrickplayImageSettings => 'Подешавања слике';

  @override
  String get adminTrickplayInterval => 'Интервал (мс)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Колико често снимати кадрове';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Ширина пиксела раздвојених зарезима (нпр. 320)';

  @override
  String get adminTrickplayQuality => 'Квалитет';

  @override
  String get adminTrickplayQScale => 'Скала квалитета';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Ниже вредности = бољи квалитет, веће датотеке';

  @override
  String get adminTrickplayJpegQuality => 'ЈПЕГ квалитет';

  @override
  String get adminTrickplayProcessing => 'Обрада';

  @override
  String get adminTasksEmpty => 'Није пронађен ниједан заказани задатак';

  @override
  String get adminTasksNoFilterMatch =>
      'Ниједан задатак не одговара тренутном филтеру';

  @override
  String get adminTaskCancelling => 'Отказивање...';

  @override
  String get adminTaskRunning => 'Трчање...';

  @override
  String get adminTaskNeverRun => 'Никад не трчи';

  @override
  String get adminTaskStop => 'Заустави';

  @override
  String get adminRunningTasks => 'Задаци у току';

  @override
  String get adminTaskRun => 'Трчи';

  @override
  String get adminTaskDetailLastExecution => 'Ласт Екецутион';

  @override
  String get adminTaskDetailStarted => 'Почело';

  @override
  String get adminTaskDetailEnded => 'Завршено';

  @override
  String get adminTaskDetailDuration => 'Трајање';

  @override
  String get adminTaskDetailErrorLabel => 'Грешка:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Сваког дана у $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Сваког $day у $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Сваких $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Приликом покретања апликације';

  @override
  String get adminTaskTriggerTypeDaily => 'Даили';

  @override
  String get adminTaskTriggerTypeWeekly => 'Недељно';

  @override
  String get adminTaskTriggerTypeInterval => 'У интервалу';

  @override
  String get adminTaskTriggerIntervalLabel => 'Интервал';

  @override
  String get adminTaskTriggerEveryHour => 'Сваки сат';

  @override
  String get adminTaskTriggerEvery6Hours => 'Сваких 6 сати';

  @override
  String get adminTaskTriggerEvery12Hours => 'Сваких 12 сати';

  @override
  String get adminTaskTriggerEvery24Hours => 'Свака 24 сата';

  @override
  String get adminTaskTriggerEvery2Days => 'Свака 2 дана';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сати',
      few: '$count сата',
      one: '$count сат',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Време';

  @override
  String get adminTaskTriggerNoLimit => 'Нема ограничења';

  @override
  String get adminActivityJustNow => 'Управо сада';

  @override
  String get adminActivityLastHour => 'Последњи сат';

  @override
  String get adminActivityToday => 'данас';

  @override
  String get adminActivityYesterday => 'Јучер';

  @override
  String get adminActivityOlder => 'Старији';

  @override
  String adminActivityDaysAgo(int days) {
    return 'пре $days д';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'пре $hours ч';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'пре $minutes мин';
  }

  @override
  String get adminActivityNow => 'сада';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours ч';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days д';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month.';
  }

  @override
  String get adminTrickplayDescription =>
      'Подесите генерисање Trickplay слика за сличице прегледа при премотавању.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Јавни ХТТПС порт';

  @override
  String get adminNetworkingBaseUrl => 'Основни УРЛ';

  @override
  String get adminNetworkingBaseUrlHint => 'нпр. /jellyfin';

  @override
  String get adminNetworkingHttps => 'ХТТПС';

  @override
  String get adminNetworkingPublicHttpPort => 'Јавни HTTP порт';

  @override
  String get adminNetworkingRequireHttps => 'Захтевај HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Преусмери све удаљене захтеве на HTTPS. Нема ефекта ако сервер нема важећи сертификат.';

  @override
  String get adminNetworkingCertPassword => 'Лозинка сертификата';

  @override
  String get adminNetworkingIpSettings => 'IP подешавања';

  @override
  String get adminNetworkingEnableIpv4 => 'Омогући IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Омогући IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Омогући аутоматско мапирање портова';

  @override
  String get adminNetworkingLocalSubnets => 'LAN мреже';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Листа IP адреса или CIDR подмрежа које се сматрају делом локалне мреже, одвојених зарезом или новим редом.';

  @override
  String get adminNetworkingPublishedUris => 'Објављени URI-ји сервера';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Мапирајте подмрежу или адресу на објављени URL, нпр. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Путања сертификата';

  @override
  String get adminNetworkingRemoteIpFilter => 'Удаљени ИП филтер';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Удаљени ИП филтер';

  @override
  String get adminPlaybackVaapiDevice => 'ВА-АПИ уређај';

  @override
  String get adminPlaybackAutomatic => '0 = аутоматски';

  @override
  String get adminPlaybackTranscodeTempPath => 'Транскодирање темп';

  @override
  String get adminPlaybackSegmentDeletion => 'Дозволи брисање сегмента';

  @override
  String get adminPlaybackSegmentKeep => 'Задржавање сегмента (секунде)';

  @override
  String get adminPlaybackThrottleBuffering => 'Пуферовање гаса';

  @override
  String get adminPlaybackThrottleDelay => 'Одлагање ограничавања (секунде)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Дозволи издвајање титлова у ходу';

  @override
  String get adminResumeMinPct => 'Минимални проценат биографије';

  @override
  String get adminResumeMinPctSubtitle =>
      'Садржај мора да се репродукује изнад овог процента да би се сачувао напредак';

  @override
  String get adminResumeMaxPct => 'Максимални проценат резимеа';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Сматра се да је садржај потпуно репродукован након овог процента';

  @override
  String get adminResumeMinDuration => 'Минимално трајање наставка (секунде)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Ставке краће од овога се не могу поново покренути';

  @override
  String get adminTrickplayScanBehavior => 'Понашање скенирања';

  @override
  String get adminTrickplayProcessPriority => 'Приоритет процеса';

  @override
  String get adminTrickplayTileWidth => 'Ширина плочице';

  @override
  String get adminTrickplayTileHeight => 'Висина плочица';

  @override
  String get adminTrickplayProcessThreads => 'Процесне нити';

  @override
  String get adminTrickplayWidthResolutions => 'Резолуције ширине';

  @override
  String get adminMetadataDefault => 'Подразумевано';

  @override
  String get adminMetadataContentTypeUpdated => 'Тип садржаја је ажуриран';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Ажурирање врсте садржаја није успело: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Праг спорог одзива (мс)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Омогући упозорења о спорим одговорима';

  @override
  String get adminGeneralQuickConnect => 'Омогући Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Сервер';

  @override
  String get adminGeneralSectionMetadata => 'Метаподаци';

  @override
  String get adminGeneralSectionPaths => 'Путање';

  @override
  String get adminGeneralSectionPerformance => 'Перформансе';

  @override
  String get adminGeneralCachePath => 'Путања кеша';

  @override
  String get adminGeneralMetadataPath => 'Путања метаподатака';

  @override
  String get adminGeneralServerName => 'Име сервера';

  @override
  String get adminGeneralDisplayLanguage => 'Жељени језик приказа';

  @override
  String get adminSettingsLoadFailed => 'Учитавање подешавања није успело';

  @override
  String get adminDiscover => 'Откријте';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Ажурирање мапирања није успело: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Временско ограничење: $duration';
  }

  @override
  String get folders => 'Фасцикле';

  @override
  String get libraries => 'Библиотеке';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay је онемогућен';

  @override
  String get syncPlayDisabledMessage =>
      'Омогућите SyncPlay у подешавањима да бисте користили синхронизовану репродукцију.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сервер није подржан';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay захтева Jellyfin сервер. Тренутни сервер га не подржава.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay група';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay група';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# учесника',
      few: '# учесника',
      one: '# учесник',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Игнорирај чекај';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Не држите групу док се овај уређај баферује';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Наставите локално без чекања на споре чланове';

  @override
  String get syncPlayRepeat => 'Понови';

  @override
  String get syncPlayRepeatOne => 'Један';

  @override
  String get syncPlayShuffleModeShuffled => 'Схуффлед';

  @override
  String get syncPlayShuffleModeSorted => 'Сортирано';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Синхронизујте тренутни ред за репродукцију';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Замените ред групе оним што се репродукује локално';

  @override
  String get syncPlayLeaveGroup => 'Напусти групу';

  @override
  String get syncPlayGroupQueue => 'Групни ред';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Ставка $index';
  }

  @override
  String get syncPlayPlayNow => 'Играј сада';

  @override
  String get syncPlayCreateNewGroup => 'Направите нову групу';

  @override
  String get syncPlayGroupName => 'Назив групе';

  @override
  String get syncPlayDefaultGroupName => 'Моја SyncPlay група';

  @override
  String get syncPlayCreateGroup => 'Креирајте групу';

  @override
  String get syncPlayAvailableGroups => 'Доступне групе';

  @override
  String get syncPlayNoGroupsAvailable => 'Нема доступних група';

  @override
  String get syncPlayJoinGroupQuestion => 'Придружити се SyncPlay групи?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Придруживање SyncPlay групи може заменити тренутни ред за репродукцију. Наставити?';

  @override
  String get syncPlayJoin => 'Придружите се';

  @override
  String get syncPlayStateIdle => 'Идле';

  @override
  String get syncPlayStateWaiting => 'Чекам';

  @override
  String get syncPlayStatePaused => 'Паузирано';

  @override
  String get syncPlayStatePlaying => 'Играње';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName се придружио/ла SyncPlay групи';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName је напустио/ла SyncPlay групу';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Приступ SyncPlay-у је одбијен';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Немате приступ једној или више ставки у овој SyncPlay групи. Замолите власника групе да провери дозволе библиотеке или да изабере други ред.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Синхронизација репродукције са групом $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Гласовна претрага није доступна.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Директна репродукција Dolby Vision садржаја није успела';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Директна репродукција овог Dolby Vision тока није могла да почне. Покушати поново уз транскодирање на серверу?';

  @override
  String get retryWithTranscode => 'Покушајте поново са транскодом';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision није подржан';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Овај уређај не може директно да декодира Dolby Vision садржај. Користите HDR10 као резервну опцију или затражите транскодирање на серверу.';

  @override
  String get rememberMyChoice => 'Запамти мој избор';

  @override
  String get playHdr10Fallback => 'Пусти HDR10 резервну верзију';

  @override
  String get requestTranscode => 'Захтевај транскодирање';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# редова откривено',
      few: '# реда откривена',
      one: '# ред откривен',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Види све';

  @override
  String get noItems => 'Нема ставки';

  @override
  String get switchUser => 'Промени корисника';

  @override
  String get remoteControl => 'Ремоте Цонтрол';

  @override
  String get mediaBarLoading => 'Учитавање траке медија...';

  @override
  String get mediaBarError => 'Учитавање траке медија није успело';

  @override
  String get offlineServerUnavailable =>
      'Повезано на интернет, али тренутни сервер је недоступан.';

  @override
  String get offlineNoInternet =>
      'Ви сте ван мреже. Доступан је само преузети садржај.';

  @override
  String get offlineFileNotAvailable => 'Фајл није доступан';

  @override
  String get offlineSwitchServer => 'Пребаци сервер';

  @override
  String get offlineSavedMedia => 'Сачувани медији';

  @override
  String get offlineBannerTitle => 'Ван мреже сте';

  @override
  String get offlineBannerSubtitle => 'Приказују се ваша преузимања';

  @override
  String get offlineBannerAction => 'Преузимања';

  @override
  String get serverUnreachableBannerTitle => 'Сервер није доступан';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Репродукција из преузимања док се не врати';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Ремоте Плаибацк';

  @override
  String castControlFailed(String error) {
    return 'Cast контрола није успела: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Контроле – $kind';
  }

  @override
  String get castDeviceVolume => 'Јачина звука уређаја';

  @override
  String get castVolumeUnavailable => 'Недоступно';

  @override
  String castStopKind(String kind) {
    return 'Заустави $kind';
  }

  @override
  String get audioLabel => 'Аудио';

  @override
  String get subtitlesLabel => 'Субтитлес';

  @override
  String get pinConfirmTitle => 'Потврдите ПИН';

  @override
  String get pinSetTitle => 'Подесите ПИН';

  @override
  String get pinEnterTitle => 'Унесите ПИН';

  @override
  String get pinReenterToConfirm =>
      'Поново унесите свој ПИН да бисте потврдили';

  @override
  String pinEnterNDigit(int length) {
    return 'Унесите $length-цифрени PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Унесите свој $length-цифрени PIN';
  }

  @override
  String get pinIncorrect => 'Нетачан ПИН';

  @override
  String get pinMismatch => 'ПИН-ови се не поклапају';

  @override
  String get pinForgot => 'Заборавили сте ПИН?';

  @override
  String get pinClear => 'Очисти';

  @override
  String get pinBackspace => 'Бацкспаце';

  @override
  String get quickConnectAuthorized => 'Quick Connect захтев је одобрен.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect код је неважећи или је истекао.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect није подржан на овом серверу.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Ауторизација Quick Connect кода није успела.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect је онемогућен на овом серверу.';

  @override
  String get quickConnectForbidden =>
      'Ваш налог не може да одобри овај Quick Connect захтев.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect код није пронађен. Пробајте нови код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect није успео: $message';
  }

  @override
  String get quickConnectEnterCode => 'Унесите код';

  @override
  String get quickConnectAuthorize => 'Овластити';

  @override
  String remoteCommandFailed(String error) {
    return 'Наредба није успела: $error';
  }

  @override
  String get remoteControlTitle => 'Ремоте Цонтрол';

  @override
  String get remoteFailedToLoadSessions => 'Учитавање сесија није успело';

  @override
  String get remoteNoSessions => 'Нема сесија које се могу контролисати';

  @override
  String get remoteStartPlayback => 'Започните репродукцију на другом уређају';

  @override
  String get unknownUser => 'Непознато';

  @override
  String get unknownItem => 'Непознато';

  @override
  String get remoteNothingPlaying => 'Ништа се не репродукује на овој сесији';

  @override
  String get castingStarted => 'Емитовање је почело на изабраном уређају';

  @override
  String castingFailed(String error) {
    return 'Покретање Cast-а није успело: $error';
  }

  @override
  String get noRemoteDevices =>
      'Нема доступних уређаја за даљинску репродукцију.';

  @override
  String get noRemoteDevicesIos =>
      'Нема доступних уређаја за даљинску репродукцију.\n\nНа iOS-у, AirPlay уређаји можда неће бити доступни у симулатору.';

  @override
  String get trackActionPlayNext => 'Плаи Нект';

  @override
  String get trackActionAddToQueue => 'Додај у ред';

  @override
  String get trackActionAddToPlaylist => 'Додај на листу за репродукцију';

  @override
  String get trackActionCancelDownload => 'Откажи преузимање';

  @override
  String get trackActionDeleteFromPlaylist =>
      'Избриши са листе за репродукцију';

  @override
  String get trackActionMoveUp => 'Мове Уп';

  @override
  String get trackActionMoveDown => 'Мове Довн';

  @override
  String get trackActionRemoveFromFavorites => 'Уклони из омиљених';

  @override
  String get trackActionAddToFavorites => 'Додај у фаворите';

  @override
  String get trackActionGoToAlbum => 'Иди на Албум';

  @override
  String get trackActionGoToArtist => 'Иди на Извођач';

  @override
  String trackActionDownloading(String name) {
    return 'Преузимање: $name...';
  }

  @override
  String get trackActionDeletedFile => 'Преузета датотека је избрисана';

  @override
  String get trackActionDeleteFileFailed =>
      'Није могуће избрисати преузету датотеку';

  @override
  String get shuffleBy => 'Схуффле Би';

  @override
  String get shuffleSelectLibrary => 'Изаберите Библиотека';

  @override
  String get shuffleSelectGenre => 'Изаберите жанр';

  @override
  String get shuffleLibrary => 'Библиотека';

  @override
  String get shuffleGenre => 'Жанр';

  @override
  String get shuffleNoLibraries => 'Нема доступних компатибилних библиотека.';

  @override
  String get shuffleNoGenres =>
      'Није пронађен ниједан жанр за овај режим насумице.';

  @override
  String get posterDisplayTitle => 'Дисплаи';

  @override
  String get posterImageType => 'Тип слике';

  @override
  String get imageTypePoster => 'Постер';

  @override
  String get imageTypeThumbnail => 'Тхумбнаил';

  @override
  String get imageTypeBanner => 'Банер';

  @override
  String get playlistAddFailed => 'Додавање на плејлисту није успело';

  @override
  String get playlistCreateFailed => 'Прављење плејлисте није успело';

  @override
  String get playlistNew => 'Нова листа за репродукцију';

  @override
  String get playlistCreate => 'Креирај';

  @override
  String get playlistCreateNew => 'Креирајте нову плејлисту';

  @override
  String get playlistNoneFound => 'Није пронађена ниједна плејлиста';

  @override
  String get addToPlaylist => 'Додај на листу за репродукцију';

  @override
  String get lyricsNotAvailable => 'Нема доступних песама';

  @override
  String get upNext => 'Уп Нект';

  @override
  String get playNext => 'Плаи Нект';

  @override
  String get stillWatchingContent =>
      'Репродукција је паузирана. Да ли још увек гледаш?';

  @override
  String get stillWatchingStop => 'Заустави';

  @override
  String get stillWatchingContinue => 'Настави';

  @override
  String skipSegment(String segment) {
    return 'Прескочи $segment';
  }

  @override
  String get liveTv => 'ТВ уживо';

  @override
  String get continueWatchingAndNextUp => 'Наставите са гледањем и даље';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Преузимање $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Преузимање: $fileName';
  }

  @override
  String get nextEpisode => 'Нект Еписоде';

  @override
  String get moreFromThisSeason => 'Више из ове сезоне';

  @override
  String get playerTooltipPlaybackSpeed => 'Брзина репродукције';

  @override
  String get playerTooltipCastControls => 'Контроле за пребацивање';

  @override
  String get playerTooltipPlaybackQuality => 'Битрате';

  @override
  String get playerTooltipEnterFullscreen => 'Унесите цео екран';

  @override
  String get playerTooltipExitFullscreen => 'Изађите преко целог екрана';

  @override
  String get playerTooltipFloatOnTop => 'Плутајте на врху';

  @override
  String get playerTooltipExitFloatOnTop => 'Онемогућите плутање на врху';

  @override
  String get playerTooltipLockLandscape => 'Лоцк ландсцапе';

  @override
  String get playerTooltipUnlockOrientation => 'Дозволи ротацију';

  @override
  String get playerTooltipPrevious => 'Претходно';

  @override
  String get playerTooltipSeekBack => 'Тражи назад';

  @override
  String get playerTooltipSeekForward => 'Тражи напред';

  @override
  String get contextMenuMarkWatched => 'Означи као Гледано';

  @override
  String get contextMenuMarkUnwatched => 'Означи као Негледано';

  @override
  String get contextMenuAddToFavorites => 'Додај у фаворите';

  @override
  String get contextMenuRemoveFromFavorites => 'Уклони из омиљених';

  @override
  String get contextMenuGoToSeries => 'Идите на серију';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Сакриј из одељка „Наставите са гледањем”';

  @override
  String get contextMenuHideFromNextUp => 'Сакриј из одељка „Следеће”';

  @override
  String get contextMenuAddToCollection => 'Додај у колекцију';

  @override
  String get settingsAdministrationSubtitle =>
      'Приступите административној табли сервера';

  @override
  String get settingsAccountSecurity => 'Рачун и безбедност';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Аутентификација, ПИН код и родитељски надзор';

  @override
  String get settingsPersonalization => 'Персонализација';

  @override
  String get settingsPersonalizationSubtitle =>
      'Тема, навигација, почетни редови и видљивост библиотеке';

  @override
  String get settingsDynamicContent => 'Динамиц Цонтент';

  @override
  String get settingsDynamicContentSubtitle => 'Медиа Бар и визуелни слојеви';

  @override
  String get settingsPlaybackSyncplay => 'Репродукција и SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Аудио/видео подешавања, титлови, преузимања и SyncPlay контроле';

  @override
  String get settingsIntegrationsSubtitle =>
      'Синхронизација додатака, Seerr, оцене и још много тога';

  @override
  String get settingsAboutSubtitle =>
      'Верзија апликације, правне информације и кредити';

  @override
  String get settingsAuthenticationSection => 'АУТХЕНТИЦАТИОН';

  @override
  String get settingsSortServersBy => 'Сортирај сервере по';

  @override
  String get settingsLastUsed => 'Ласт Усед';

  @override
  String get settingsAlphabetical => 'Абецедно';

  @override
  String get settingsConnectionSection => 'ВЕЗА';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Дозволи самопотписане сертификате';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Веруј серверима који користе самопотписане сертификате или сертификате приватног CA. Омогућите само за сервере које контролишете. Овим се онемогућава провера сертификата за све везе.';

  @override
  String get settingsPrivacyAndSafetySection => 'ПРИВАТНОСТ И БЕЗБЕДНОСТ';

  @override
  String get settingsBlockedRatings => 'Блоцкед Ратингс';

  @override
  String get settingsGeneralStyle => 'Генерал Стиле';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Акценти теме, позадине, индикатори гледања и тематска музика';

  @override
  String get settingsDetailsScreen => 'Екран са детаљима';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Стил, замућење позадине и понашање картица';

  @override
  String get settingsHomePage => 'Почетна страница';

  @override
  String get settingsHomePageSubtitle =>
      'Секције, типови слика, преклапања и прегледи медија';

  @override
  String get settingsLibrariesSubtitle =>
      'Видљивост библиотеке, приказ фасцикле и понашање на више сервера';

  @override
  String get settingsTwentyFourHourClock => '24-часовни сат';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Користите 24-часовно форматирање времена где год је приказан сат';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Прикажите дугме насумице на траци за навигацију';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Прикажи дугме за жанрове на траци за навигацију';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Прикажите дугме фаворита на траци за навигацију';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Прикажите дугме библиотеке на траци за навигацију';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Прикажи Seerr дугме у навигационој траци';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Увек приказуј текстуалне натписе у горњој навигационој траци';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Укључите или искључите видљивост на почетној страници по библиотеци. Поново покрените Moonfin да би промене ступиле на снагу.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Трака медија и локални прегледи';

  @override
  String get settingsVisualOverlays => 'Висуал Оверлаис';

  @override
  String get settingsSeasonalSurprise => 'Сезонско изненађење';

  @override
  String get settingsMetadataAndRatings => 'Метаподаци и оцене';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase омогућава интеграције на страни сервера, укључујући додатне изворе оцена, Seerr захтеве и синхронизована подешавања.';

  @override
  String get settingsOfflineDownloads => 'Оффлине Довнлоадс';

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
  String get settingsHigh => 'Високо';

  @override
  String get settingsLow => 'Ниско';

  @override
  String get settingsCustomPath => 'Прилагођена путања';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Унесите путању до фасцикле за преузимање';

  @override
  String get settingsConcurrentDownloads => 'Цонцуррент Довнлоадс';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Максималан број ставки за преузимање одједном.';

  @override
  String get settingsAppInfo => 'АПП ИНФО';

  @override
  String get settingsReportAnIssue => 'Пријавите проблем';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Отворите праћење проблема на GitHub-у';

  @override
  String get settingsJoinDiscord => 'Придружите се Discord-у';

  @override
  String get settingsJoinDiscordSubtitle => 'Разговарајте са заједницом';

  @override
  String get settingsJoinTheDiscord => 'Придружите се Discord серверу';

  @override
  String get settingsSupportMoonfin => 'Подржите Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Частите програмера кафом';

  @override
  String get settingsLegal => 'ЛЕГАЛ';

  @override
  String get settingsLicenses => 'Лиценце';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Обавештења о лиценци отвореног кода';

  @override
  String get settingsPrivacyPolicy => 'Политика приватности';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Како Moonfin рукује вашим подацима';

  @override
  String get settingsCheckForUpdates => 'Проверите ажурирања';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Проверите да ли постоји ново Moonfin издање';

  @override
  String get settingsPoweredByFlutter => 'Поверед би Флуттер';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# лиценцних обавештења',
      few: '# лиценцна обавештења',
      one: '# лиценцно обавештење',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'И једно и друго';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Насумични филтер типа садржаја';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Подешавања репродукције видеа';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Основни видео механизам и подешавања квалитета стримовања';

  @override
  String get settingsAudioPreferences => 'Аудио Преференцес';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Опције аудио записа, обраде и пролаза';

  @override
  String get settingsAutomationAndQueue => 'Аутоматизација и ред чекања';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Аутоматска репродукција и секвенцирање';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Квалитет преузимања, ограничења складишта и величина реда';

  @override
  String get settingsSyncplaySubtitle =>
      'Логика синхронизације за групне сесије';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Специјализоване карактеристике плејера. Користите опрезно, јер неке опције могу изазвати проблеме са репродукцијом';

  @override
  String get settingsSkipIntrosAndOutros => 'Прескочити уводе и резултате?';

  @override
  String get settingsMediaSegmentCountdown => 'Одбројавање медијског сегмента';

  @override
  String get settingsProgressBar => 'Трака напретка';

  @override
  String get settingsTimer => 'Одбројавање';

  @override
  String get settingsNone => 'Ништа';

  @override
  String get settingsPromptUser => 'Промпт Усер';

  @override
  String get settingsSkip => 'Скип';

  @override
  String get settingsDoNothing => 'Не ради ништа';

  @override
  String get settingsMaxBitrateDescription =>
      'Ограничите брзину протока у битовима. Садржај изнад овог прага ће бити транскодиран да би се уклопио.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ограничите максималну резолуцију коју ће играч захтевати. Садржај веће резолуције ће бити транскодиран.';

  @override
  String get settingsPlayerZoomDescription =>
      'Како видео треба скалирати тако да одговара екрану.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Плаибацк Енгине (Андроид ТВ)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Изаберите подразумевани механизам за репродукцију на Андроид ТВ уређајима. Промене се примењују на следећу сесију репродукције.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (препоручено)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (застарело)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (застарело)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (препоручено)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision резервна опција';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Понашање за Dolby Vision наслове на уређајима без Dolby Vision декодирања.';

  @override
  String get settingsAskEachTime => 'Питајте сваки пут';

  @override
  String get settingsPreferHdr10Fallback =>
      'Дај предност HDR10 резервној опцији';

  @override
  String get settingsPreferServerTranscode =>
      'Преферирајте транскодирање сервера';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Директна репродукција Dolby Vision профила 7';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Одређује да ли се токови слоја побољшања Dolby Vision профила 7 директно репродукују.';

  @override
  String get settingsAutoAftkrtEnabled => 'Аутоматски (АФТКРТ омогућен)';

  @override
  String get settingsEnabledOnThisDevice => 'Омогућено на овом уређају';

  @override
  String get settingsDisabledPreferTranscode =>
      'Онемогућено (радије транскодирање)';

  @override
  String get settingsResumeRewindDescription =>
      'Када настављате репродукцију (са Настави гледање или странице медијске ставке), колико секунди треба премотати?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Када настављате репродукцију након притиска на дугме за паузу, колико секунди треба премотати?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Колико секунди да скочите назад након притиска на дугме за премотавање уназад.';

  @override
  String get settingsOneSecond => '1 секунда';

  @override
  String get settingsThreeSeconds => '3 секунде';

  @override
  String get settingsFortyFiveSeconds => '45 секунди';

  @override
  String get settingsSixtySeconds => '60 секунди';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Колико секунди да скочите унапред након притиска на дугме за брзо премотавање унапред.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Битстреам АЦ3 ка екстерном декодеру';

  @override
  String get settingsCinemaMode => 'Цинема Моде';

  @override
  String get settingsCinemaModeSubtitle =>
      'Пустите трејлере/преролове пре главне функције';

  @override
  String get settingsNextUpDisplayDescription =>
      'Проширено приказује пуну картицу са илустрацијом и описом епизоде. Минимално приказује компактно преклапање одбројавања. Онемогућено у потпуности сакрива промпт.';

  @override
  String get settingsShort => 'Кратко';

  @override
  String get settingsLong => 'Дуго';

  @override
  String get settingsVeryLong => 'Веома дуго';

  @override
  String get settingsVideoStartDelay => 'Кашњење почетка видео записа';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Ливе ТВ Дирецт';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Омогућите директну репродукцију за ТВ уживо';

  @override
  String get settingsOpenGroups => 'Отворите групе';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Направите SyncPlay групе, придружите им се или управљајте њима';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay омогућен';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Омогућите функције групног гледања';

  @override
  String get settingsSyncplayButton => 'SyncPlay дугме';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Прикажи SyncPlay дугме у навигационој траци';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Адванцед Цоррецтион';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Омогућите фину логику синхронизације';

  @override
  String get settingsSyncplaySyncCorrection => 'Синц Цоррецтион';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Аутоматски прилагодите репродукцију да бисте остали синхронизовани';

  @override
  String get settingsSyncplaySpeedToSync => 'Брзина синхронизације';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Користите подешавање брзине репродукције за синхронизацију';

  @override
  String get settingsSyncplaySkipToSync => 'Прескочи на синхронизацију';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Користите тражење за синхронизацију';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Минимално кашњење брзине';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Максимално кашњење брзине';

  @override
  String get settingsSyncplaySpeedDuration => 'Спеед Дуратион';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Минимално кашњење прескакања';

  @override
  String get settingsSyncplayExtraOffset => 'Додатни SyncPlay помак';

  @override
  String get onNow => 'Он Нов';

  @override
  String get collections => 'Збирке';

  @override
  String get lastPlayed => 'Ласт Плаиед';

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
    return 'Недавно објављено – $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Аутоматски пусти следећу епизоду';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Аутоматски пусти следећу епизоду када је доступна.';

  @override
  String get skipSilenceTitle => 'Прескочи тишину';

  @override
  String get skipSilenceSubtitle =>
      'Аутоматски прескочи тихе делове звука када их стрим подржава.';

  @override
  String get allowExternalAudioEffectsTitle => 'Дозволи спољне звучне ефекте';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Дозволи апликацијама за еквилизацију и ефекте (нпр. Wavelet) да се повежу са Media3 сесијама репродукције.';

  @override
  String get disableTunnelingTitle => 'Онемогући тунеловање';

  @override
  String get disableTunnelingSubtitle =>
      'Принуди репродукцију без тунеловања. Корисно на уређајима са прекидима звука/видеа при тунеловању.';

  @override
  String get enableTunnelingTitle => 'Омогући тунеловање';

  @override
  String get enableTunnelingSubtitle =>
      'Напредно. Усмерава звук и видео кроз повезану хардверску путању. Подразумевано искључено јер на неким уређајима изазива испадање звука/видеа.';

  @override
  String get mapDolbyVisionP7Title => 'Мапирај Dolby Vision профил 7 у HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Репродукуј Dolby Vision профил 7 стримове као HDR10-компатибилни HEVC на уређајима без DV-а.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Користи уграђене стилове титлова';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Примени боје, фонтове и положај уграђене у запис титлова. Искључите да бисте уместо тога користили сопствена подешавања стила титлова.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Користи уграђене величине фонта титлова';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Примени препоруке величине фонта уграђене у запис титлова. Искључите да бисте користили величину титлова из сопствених подешавања стила.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Прикажи детаље медија';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Прикажи детаље изабране ставке на врху страница библиотеке.';

  @override
  String get hideBackdropsInLibraries =>
      'Сакрити позадинске слике при прегледању?';

  @override
  String get useDetailedSubHeadings => 'Користи детаљне поднаслове';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Прикажи детаљан или минималан подред на страницама библиотеке.';

  @override
  String get savedThemesDeleteDialogTitle => 'Обрисати сачувану тему?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Уклонити „$themeName” из кеша овог уређаја?';
  }

  @override
  String get themeStore => 'Продавница тема';

  @override
  String get themeStoreSubtitle => 'Прегледајте и сачувајте теме заједнице';

  @override
  String get themeStoreDescription =>
      'Сачувајте тему да бисте је користили као и остале сачуване теме.';

  @override
  String get themeStoreEmpty => 'Тренутно нема доступних тема.';

  @override
  String get themeStoreLoadFailed =>
      'Учитавање Продавнице тема није успело. Проверите везу и покушајте поново.';

  @override
  String get themeStoreSave => 'Сачувај';

  @override
  String get themeStoreSaveAndApply => 'Сачувај и примени';

  @override
  String get themeStoreSaved => 'Сачувано';

  @override
  String get themeStoreInvalidMessage => 'Ову тему није било могуће учитати.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Сачувано: „$themeName”.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '„$themeName” је обрисана са овог уређаја.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Није могуће обрисати „$themeName”.';
  }

  @override
  String get savedThemesTitle => 'Сачуване теме';

  @override
  String get savedThemesDescription =>
      'Ово су теме преузете из Moonfin додатка за тренутни сервер. Брисањем се уклања само ова локална копија.';

  @override
  String get savedThemesEmpty => 'За овај сервер нису пронађене сачуване теме.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Тренутно активна';
  }

  @override
  String get savedThemesDeleteTooltip => 'Обриши сачувану тему';

  @override
  String get savedThemesManageSubtitle =>
      'Управљајте преузетим темама додатка на овом уређају';

  @override
  String get themeEditor => 'Уређивач тема';

  @override
  String get themeEditorSubtitle =>
      'Отворите Moonfin Уређивач тема у прегледачу';

  @override
  String get homeScreen => 'Почетни екран';

  @override
  String get bottomBar => 'Доња трака';

  @override
  String get homeRowsStyleClassic => 'Класични';

  @override
  String get homeRowsStyleModern => 'Модерни';

  @override
  String get homeRowsSection => 'Редови почетног екрана';

  @override
  String get homeRowDisplay => 'Приказ редова почетног екрана';

  @override
  String get homeRowSections => 'Одељци редова почетног екрана';

  @override
  String get homeRowToggles => 'Прекидачи редова почетног екрана';

  @override
  String get homeRowTogglesSubtitle =>
      'Омогућите или онемогућите категорије редова почетног екрана засноване на библиотеци';

  @override
  String get homeRowTogglesDescription =>
      'Омогућите следеће прекидаче за приказ редова у одељцима почетног екрана.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Класични задржава врсту слике по реду и информациони слој. Модерни користи редове од портрета до позадинске слике.';

  @override
  String get displayFavoritesRows => 'Прикажи редове омиљених';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Прикажи омиљене филмове, серије и остале редове омиљених у одељцима почетног екрана.';

  @override
  String get favoritesRowSorting => 'Сортирање редова омиљених';

  @override
  String get favoritesRowSortingDescription =>
      'Сортирајте редове омиљених према датуму додавања, датуму изласка, абецедно и више.';

  @override
  String get displayCollectionsRows => 'Прикажи редове колекција';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Прикажи редове колекција у одељцима почетног екрана.';

  @override
  String get collectionsRowSorting => 'Сортирање редова колекција';

  @override
  String get collectionsRowSortingDescription =>
      'Сортирајте редове колекција према датуму додавања, датуму изласка, абецедно и више.';

  @override
  String get displayGenresRows => 'Прикажи редове жанрова';

  @override
  String get displayGenresRowsSubtitle =>
      'Прикажи редове жанрова у одељцима почетног екрана.';

  @override
  String get genresRowSorting => 'Сортирање редова жанрова';

  @override
  String get genresRowSortingDescription =>
      'Сортирајте редове жанрова према датуму додавања, датуму изласка, абецедно и више.';

  @override
  String get genresRowItems => 'Ставке редова жанрова';

  @override
  String get genresRowItemsDescription =>
      'Прикажи филмове, серије или обоје у редовима жанрова.';

  @override
  String get displayPlaylistsRows => 'Прикажи редове плејлиста';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Прикажи редове плејлиста у одељцима почетног екрана.';

  @override
  String get playlistsRowSorting => 'Сортирање редова плејлиста';

  @override
  String get playlistsRowSortingDescription =>
      'Сортирајте редове плејлиста према датуму додавања, датуму изласка, абецедно и више.';

  @override
  String get displayAudioRows => 'Прикажи аудио-редове';

  @override
  String get displayAudioRowsSubtitle =>
      'Прикажи аудио-редове у одељцима почетног екрана.';

  @override
  String get audioRowsSorting => 'Сортирање аудио-редова';

  @override
  String get audioRowsSortingDescription =>
      'Сортирајте аудио-редове према датуму додавања, датуму изласка, абецедно и више.';

  @override
  String get audioPlaylists => 'Аудио-плејлисте';

  @override
  String get appearance => 'Изглед';

  @override
  String get layout => 'Распоред';

  @override
  String get theme => 'Тема';

  @override
  String get keyboard => 'Тастатура';

  @override
  String get navButtons => 'Дугмад';

  @override
  String get rendering => 'Приказивање';

  @override
  String get mpvConfiguration => 'MPV конфигурација';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Спољна апликација за репродукцију';

  @override
  String get externalPlayerAppDescription =>
      'Поставите спољни плејер да бисте омогућили опцију репродукције дугим притиском';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Прикажи избор апликације при покретању репродукције.';

  @override
  String get loadingInstalledPlayers => 'Учитавање инсталираних плејера...';

  @override
  String get connection => 'Веза';

  @override
  String get audioTranscodeTarget => 'Циљни формат транскодирања звука';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Подржано на овом уређају';

  @override
  String get notSupportedOnThisDevice => 'Није подржано на овом уређају';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Шаљи DTS:X (DTS UHD) bitstream спољном декодеру.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD са Atmos-ом (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Понашање медијског плејера';

  @override
  String get playbackEnhancements => 'Побољшања репродукције';

  @override
  String get alwaysOn => 'Увек укључено.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Замени прескакање одјавне шпице приказом „Следеће”';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Прикажи слој „Следеће” уместо дугмета за прескакање одјавне шпице.';

  @override
  String get playerRouting => 'Усмеравање плејера';

  @override
  String get preferSoftwareDecoders => 'Преферирај софтверске декодере';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Користи FFmpeg (звук) и libgav1 (AV1) пре хардверских декодера. Искључите ако HDMI audio passthrough престане да ради.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Отвори репродукцију видеа у изабраној спољној апликацији на Android TV-у.';

  @override
  String get automaticQueuing => 'Аутоматско додавање у ред';

  @override
  String get preferSdhSubtitles => 'Преферирај SDH титлове';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Дај предност SDH/CC записима титлова при аутоматском избору.';

  @override
  String get webDiagnostics => 'Веб дијагностика';

  @override
  String get webDiagnosticsTitle => 'Moonfin веб дијагностика';

  @override
  String get webDiagnosticsIntro =>
      'Користите ову страницу за дијагностику проблема са повезивањем прегледача (CORS, мешовити садржај и подешавања откривања).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Откривен квар због мешовитог садржаја';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Откривен квар CORS-а/preflight захтева';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin је открио да HTTPS страница покушава да позове HTTP URL сервера. Прегледачи блокирају тај захтев пре него што стигне до вашег сервера.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin је открио квар захтева на нивоу прегледача који обично изазивају недостајућа CORS или preflight заглавља на медијском серверу.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Циљни URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Детаљи: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Тренутни контекст извршавања';

  @override
  String get webDiagnosticsOrigin => 'Извор';

  @override
  String get webDiagnosticsScheme => 'Шема';

  @override
  String get webDiagnosticsPluginMode => 'Режим додатка';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC скенирање';

  @override
  String get webDiagnosticsForcedServerUrl => 'Принудни URL сервера';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Подразумевани URL сервера';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'URL прокси сервера за откривање';

  @override
  String get notConfigured => 'није конфигурисано';

  @override
  String get webDiagnosticsMixedContent => 'Мешовити садржај';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ова страница се учитава преко HTTPS-а, али је један или више конфигурисаних URL-ова HTTP. Прегледачи блокирају HTTPS страницама позивање HTTP API-ја.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Решење: послужите свој медијски сервер или прокси крајњу тачку преко HTTPS-а или учитајте Moonfin преко HTTP-а само на поузданим локалним мрежама.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Из тренутних подешавања извршавања није откривена очигледна конфигурација мешовитог садржаја.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS контролна листа';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Дозволите извор прегледача у Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Укључите Authorization, X-Emby-Authorization и X-Emby-Token у Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Изложите Content-Range и Accept-Ranges за стриминг и премотавање.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Вратите 204 на OPTIONS preflight захтеве.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Пример исечка заглавља (nginx стил)';

  @override
  String get note => 'Напомена';

  @override
  String get webDiagnosticsNonWebNote =>
      'Ова дијагностичка рута намењена је веб верзијама. Ако ово видите на другој платформи, ове провере се можда не примењују.';

  @override
  String get backToServerSelect => 'Назад на избор сервера';

  @override
  String get signOutAllUsers => 'Одјави све кориснике';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Дозвола за микрофон је трајно одбијена. Омогућите је у подешавањима система.';

  @override
  String get voiceSearchPermissionRequired =>
      'За гласовну претрагу потребна је дозвола за микрофон.';

  @override
  String get voiceSearchNoMatch => 'Нисмо то ухватили. Покушајте поново.';

  @override
  String get voiceSearchNoSpeechDetected => 'Говор није откривен.';

  @override
  String get voiceSearchMicrophoneError => 'Грешка микрофона.';

  @override
  String get voiceSearchNeedsInternet => 'Гласовна претрага захтева интернет.';

  @override
  String get voiceSearchServiceBusy =>
      'Гласовна услуга је заузета. Покушајте поново.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Дозвола за микрофон је трајно одбијена.';

  @override
  String get microphonePermissionDenied => 'Дозвола за микрофон је одбијена.';

  @override
  String get speechRecognitionUnavailable =>
      'Препознавање говора није доступно на овом уређају.';

  @override
  String get openIosRoutePicker => 'Отвори iOS избор излаза';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay избор излаза није доступан на овом уређају.';

  @override
  String get videos => 'Видео-записи';

  @override
  String get programs => 'Емисије';

  @override
  String get songs => 'Песме';

  @override
  String get photoAlbums => 'Фото-албуми';

  @override
  String get photos => 'Фотографије';

  @override
  String get people => 'Особе';

  @override
  String get recentlyReleasedEpisodes => 'Недавно објављене епизоде';

  @override
  String get watchAgain => 'Погледајте поново';

  @override
  String get guestAppearances => 'Гостујуће улоге';

  @override
  String get appearancesSeerr => 'Појављивања (Seerr)';

  @override
  String get crewContributionsSeerr => 'Доприноси екипе (Seerr)';

  @override
  String get watchWithGroup => 'Гледај са групом';

  @override
  String get errors => 'Грешке';

  @override
  String get warnings => 'Упозорења';

  @override
  String get disk => 'Диск';

  @override
  String get openInBrowser => 'Отвори у прегледачу';

  @override
  String get embeddedBrowserNotAvailable =>
      'Уграђени прегледач није доступан на овој платформи.';

  @override
  String get adminRestartServerConfirmation =>
      'Да ли сте сигурни да желите поново да покренете сервер?';

  @override
  String get adminShutdownServerConfirmation =>
      'Да ли сте сигурни да желите да искључите сервер? Мораћете ручно да га покренете поново.';

  @override
  String get internal => 'Интерно';

  @override
  String get idle => 'Неактивно';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Нема пронађених корисника';

  @override
  String get adminNoUsersMatchSearch => 'Ниједан корисник не одговара претрази';

  @override
  String get adminNoDevicesFound => 'Нема пронађених уређаја';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Ниједан уређај не одговара тренутним филтерима';

  @override
  String get passwordSet => 'Лозинка је постављена';

  @override
  String get noPasswordConfigured => 'Лозинка није конфигурисана';

  @override
  String get remoteAccess => 'Удаљени приступ';

  @override
  String get localOnly => 'Само локално';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Учитавање медијске аналитике није успело';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Обједињена аналитика свих медијских библиотека.';

  @override
  String get analyticsTopArtists => 'Најбољи извођачи';

  @override
  String get analyticsTopAuthors => 'Најбољи аутори';

  @override
  String get analyticsTopContributors => 'Највећи доприносиоци';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count библиотека',
      few: '$count библиотеке',
      one: '$count библиотека',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'За овај избор још нису доступни укупни износи индексираних медија.';

  @override
  String get analyticsLibraryDetails => 'Детаљи библиотеке';

  @override
  String get analyticsLibraryBreakdown => 'Рашчламба библиотеке';

  @override
  String get analyticsNoLibrariesAvailable => 'Нема доступних библиотека.';

  @override
  String get adminServerAdministrationTitle => 'Администрација сервера';

  @override
  String get adminServerPathData => 'Подаци';

  @override
  String get adminServerPathImageCache => 'Кеш слика';

  @override
  String get adminServerPathCache => 'Кеш';

  @override
  String get adminServerPathLogs => 'Дневници';

  @override
  String get adminServerPathMetadata => 'Метаподаци';

  @override
  String get adminServerPathTranscode => 'Транскодирање';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Овај сервер није вратио ниједну путању.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% искоришћено';
  }

  @override
  String get userActivity => 'Активност корисника';

  @override
  String get systemEvents => 'Догађаји система';

  @override
  String get needsAttention => 'Захтева пажњу';

  @override
  String get adminDrawerSectionServer => 'Сервер';

  @override
  String get adminDrawerSectionPlayback => 'Репродукција';

  @override
  String get adminDrawerSectionDevices => 'Уређаји';

  @override
  String get adminDrawerSectionAdvanced => 'Напредно';

  @override
  String get adminDrawerSectionPlugins => 'Додаци';

  @override
  String get adminDrawerSectionLiveTv => 'ТВ уживо';

  @override
  String get homeVideos => 'Кућни видео-записи';

  @override
  String get mixedContent => 'Мешовити садржај';

  @override
  String get homeVideosAndPhotos => 'Кућни видео-записи и фотографије';

  @override
  String get mixedMoviesAndShows => 'Мешовити филмови и серије';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Нема пронађених снимака';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'У .$extension архиви нису пронађене странице са сликама.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Уграђени приказивач није успео ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB приказивач није успео ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Недостаје локална датотека за читач: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status при отварању података књиге са $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Нема доступне крајње тачке за читање књиге';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Неподржани формат архиве стрипа: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Додатак за издвајање CBR-а није доступан на овој платформи.';

  @override
  String get failedToExtractCbrArchive => 'Издвајање .cbr архиве није успело.';

  @override
  String get cb7ExtractionUnavailable =>
      'Издвајање CB7-а није доступно на овој платформи.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Додатак за издвајање CB7-а није доступан на овој платформи.';

  @override
  String get closeGenrePanel => 'Затвори панел жанрова';

  @override
  String get loadingShuffle => 'Учитавање насумичне репродукције...';

  @override
  String get libraryShuffleLabel => 'НАСУМИЧНО ИЗ БИБЛИОТЕКЕ';

  @override
  String get randomShuffleLabel => 'НАСУМИЧАН ИЗБОР';

  @override
  String get genresShuffleLabel => 'НАСУМИЧНО ПО ЖАНРОВИМА';

  @override
  String get autoHdrSwitching => 'Аутоматско пребацивање на HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Аутоматски омогући HDR за репродукцију HDR видеа и врати режим приказа при изласку.';

  @override
  String get whenFullscreen => 'У целом екрану';

  @override
  String get changeArtwork => 'Промени графику';

  @override
  String get missing => 'Недостаје';

  @override
  String get transcodingLimits => 'Ограничења транскодирања';

  @override
  String get clearAllArtworkButton => 'Обрисати сву графику?';

  @override
  String get clearAllArtworkWarning =>
      'Да ли сте сигурни да желите да обришете сву преузету графику?';

  @override
  String get confirmClear => 'Потврди брисање';

  @override
  String confirmClearMessage(String itemType) {
    return 'Да ли сте сигурни да желите да обришете ово: $itemType?';
  }

  @override
  String get uploadButton => 'Отпремити?';

  @override
  String get resolutionLabel => 'Резолуција: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Прикажи само графику на језику интерфејса';

  @override
  String get confirmClearAll => 'Потврди брисање свега';

  @override
  String get imageUploadSuccess => 'Слика је успешно отпремљена!';

  @override
  String imageUploadFailed(String error) {
    return 'Отпремање слике није успело: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Постављање слике није успело: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Брисање слике није успело: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Брисање све графике није успело: $error';
  }

  @override
  String get yes => 'Да';

  @override
  String get posterCategory => 'Постер';

  @override
  String get backdropsCategory => 'Позадинске слике';

  @override
  String get bannerCategory => 'Банер';

  @override
  String get logoCategory => 'Логотип';

  @override
  String get thumbnailCategory => 'Сличица';

  @override
  String get artCategory => 'Графика';

  @override
  String get discArtCategory => 'Графика диска';

  @override
  String get screenshotCategory => 'Снимак екрана';

  @override
  String get boxCoverCategory => 'Предња страна кутије';

  @override
  String get boxRearCoverCategory => 'Задња страна кутије';

  @override
  String get menuArtCategory => 'Графика менија';

  @override
  String get confirmItemPoster => 'постер';

  @override
  String get confirmItemBackdrop => 'позадинска слика';

  @override
  String get confirmItemBanner => 'банер';

  @override
  String get confirmItemLogo => 'логотип';

  @override
  String get confirmItemThumbnail => 'сличица';

  @override
  String get confirmItemArt => 'графика';

  @override
  String get confirmItemDiscArt => 'графика диска';

  @override
  String get confirmItemScreenshot => 'снимак екрана';

  @override
  String get confirmItemBoxCover => 'предња страна кутије';

  @override
  String get confirmItemBoxRearCover => 'задња страна кутије';

  @override
  String get confirmItemMenuArt => 'графика менија';

  @override
  String get resolutionAll => 'Све';

  @override
  String get resolutionHigh => 'Висока (1080p+)';

  @override
  String get resolutionMedium => 'Средња (720p)';

  @override
  String get resolutionLow => 'Ниска (<720p)';

  @override
  String get sources => 'Извори';

  @override
  String get audiobookChapters => 'Поглавља';

  @override
  String get audiobookBookmarks => 'Обележивачи';

  @override
  String get audiobookNotes => 'Белешке';

  @override
  String get audiobookQueue => 'Ред';

  @override
  String get audiobookTimeline => 'Временска линија';

  @override
  String get audiobookTimelineEmpty => 'Временска линија је празна';

  @override
  String get audiobookWholeBook => 'Цела књига';

  @override
  String get audiobookFocusedTimeline => 'Фокусирана временска линија';

  @override
  String get audiobookExportBookmarks => 'Извези обележиваче';

  @override
  String get audiobookExportNotes => 'Извези белешке';

  @override
  String get audiobookExportAll => 'Извези све';

  @override
  String audiobookExportSuccess(String path) {
    return 'Извезено у $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Извоз није успео: $error';
  }

  @override
  String get audiobookLyrics => 'Текст';

  @override
  String get audiobookAddBookmark => 'Додај обележивач';

  @override
  String get audiobookAddNote => 'Додај белешку';

  @override
  String get audiobookEditNote => 'Уреди белешку';

  @override
  String get audiobookNoteHint => 'Напишите белешку за овај тренутак';

  @override
  String get audiobookSleepTimer => 'Тајмер за спавање';

  @override
  String get audiobookSleepOff => 'Искључено';

  @override
  String get audiobookSleepEndOfChapter => 'Крај поглавља';

  @override
  String get audiobookSleepCustom => 'Прилагођено';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'још $remaining';
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
  String get audiobookPlaybackSpeed => 'Брзина репродукције';

  @override
  String get audiobookRemainingTime => 'Преостало';

  @override
  String get audiobookElapsedTime => 'Протекло';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Назад $seconds с';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Напред $seconds с';
  }

  @override
  String get audiobookPreviousChapter => 'Претходно поглавље';

  @override
  String get audiobookNextChapter => 'Следеће поглавље';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Поглавље $current од $total';
  }

  @override
  String get audiobookNoChapters => 'Нема поглавља';

  @override
  String get audiobookNoBookmarks => 'Још нема обележивача';

  @override
  String get audiobookNoNotes => 'Још нема бележака';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Обележивач додат на $position';
  }

  @override
  String get audiobookSpeedReset => 'Врати на 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Сачувај';

  @override
  String get audiobookCancel => 'Откажи';

  @override
  String get audiobookDelete => 'Обриши';

  @override
  String get subtitlePreferences => 'Подешавања титлова';

  @override
  String get subtitlePreferencesDescription =>
      'Промените режиме титлова, подразумеване језике, изглед и опције приказа.';

  @override
  String get subtitleRendering => 'Приказ титлова';

  @override
  String get displayOptions => 'Опције приказа';

  @override
  String get releaseDateAscending => 'Датум изласка (растуће)';

  @override
  String get releaseDateDescending => 'Датум изласка (опадајуће)';

  @override
  String get groupContributions => 'Груписање доприноса';

  @override
  String get groupMultipleRoles => 'Групиши више улога';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Упозорење о приступу за писање у библиотеку';

  @override
  String get libraryWriteAccessHowToFix => 'Како то решити:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Доделите дозволе за писање кориснику Jellyfin услуге (нпр. jellyfin или Docker PUID/PGID) за фасцикле ваше медијске библиотеке на серверу.\n\n2. Или идите на Jellyfin контролну таблу -> Библиотеке, уредите ову библиотеку и онемогућите „Сачувај графику у медијске фасцикле” како би се графика чувала у Jellyfin-овој интерној бази података.';

  @override
  String get dismiss => 'Одбаци';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Ваша библиотека „$libraryName” конфигурисана је да чува графику директно у медијским фасциклама (укључена је опција „Сачувај графику у медијске фасцикле”). Међутим, Jellyfin је тестирао приступ за писање и нема дозволу да уписује датотеке у овај директоријум:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Изгледа да Jellyfin није успео да ажурира графику. Ваша библиотека је конфигурисана да чува графику директно у медијским фасциклама (укључена је опција „Сачувај графику у медијске фасцикле”). Ова грешка се обично јавља када процес Jellyfin сервера нема дозволу да уписује датотеке у ваше медијске директоријуме.';

  @override
  String get externalLists => 'Спољне листе';

  @override
  String get replay => 'Понови';

  @override
  String get fileInformation => 'Подаци о датотеци';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Величина: $size  •  Формат: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Прикажи све аудио-записе ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Прикажи све титлове ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Провера могућности директне репродукције...';

  @override
  String get directPlayCapabilityLabel => 'Могућност директне репродукције: ';

  @override
  String get forced => 'Принудни';

  @override
  String get transcodeContainerNotSupported =>
      'Плејер не подржава формат контејнера.';

  @override
  String get transcodeVideoCodecNotSupported => 'Видео кодек није подржан.';

  @override
  String get transcodeAudioCodecNotSupported => 'Аудио-кодек није подржан.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Формат титлова није подржан (захтева утискивање).';

  @override
  String get transcodeAudioProfileNotSupported => 'Аудио-профил није подржан.';

  @override
  String get transcodeVideoProfileNotSupported => 'Видео профил није подржан.';

  @override
  String get transcodeVideoLevelNotSupported => 'Видео ниво није подржан.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Овај уређај не подржава резолуцију видеа.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Дубина боје видеа није подржана.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Брзина кадрова видеа није подржана.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Проток датотеке премашује ограничење стриминга плејера.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Проток видеа премашује ограничење стриминга.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Проток звука премашује ограничење стриминга.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Број аудио-канала није подржан.';

  @override
  String get sortAlphabetical => 'Азбучно';

  @override
  String get sortReleaseAscending => 'Редослед изласка (растуће)';

  @override
  String get sortReleaseDescending => 'Редослед изласка (опадајуће)';

  @override
  String get sortCustomDragDrop => 'Прилагођено (превуци и отпусти)';

  @override
  String get playlistSortOptions => 'Опције сортирања плејлисте';

  @override
  String get resetSort => 'Ресетуј сортирање';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Поново погледај С$season:Е$episode';
  }

  @override
  String get rewatchPlaylist => 'Поново погледај плејлисту';

  @override
  String get noSubtitlesFound => 'Нису пронађени титлови.';

  @override
  String get adminControls => 'Администраторске контроле';

  @override
  String get impellerRendering => 'Механизам приказа (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller је Flutter-ов модерни GPU приказивач за глаткије анимације и мање застајкивања. На неким ТВ уређајима и старијим GPU-овима може изазвати сметње или црни видео; искључите га ако то приметите. Аутоматски бира најбоље подешавање за ваш уређај. Поново покрените Moonfin да бисте применили промену.';

  @override
  String get impellerAuto => 'Аутоматски';

  @override
  String get impellerOn => 'Укључено';

  @override
  String get impellerOff => 'Искључено';

  @override
  String get impellerRestartTitle => 'Потребно је поновно покретање';

  @override
  String get impellerRestartMessage =>
      'Moonfin мора поново да се покрене да би се променио механизам приказа. Затворите апликацију сада, а затим је поново отворите да бисте применили промену.';

  @override
  String get impellerCloseNow => 'Затвори апликацију сада';

  @override
  String get adminRefreshLibrary => 'Освежи библиотеку';

  @override
  String get adminRefreshAllLibraries => 'Освежи све библиотеке';

  @override
  String get adminRepoSortDateOldest => 'Датум додавања (најстарије прво)';

  @override
  String get adminRepoSortDateNewest => 'Датум додавања (најновије прво)';

  @override
  String get adminRepoSortNameAsc => 'Азбучно (А–Ш)';

  @override
  String get adminRepoSortNameDesc => 'Азбучно (Ш–А)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Учитавање аналитике сервера... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Као извор';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 филмова';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 ТВ серија';

  @override
  String get imdbMostPopularMovies => 'IMDb најпопуларнији филмови';

  @override
  String get imdbMostPopularTvShows => 'IMDb најпопуларније ТВ серије';

  @override
  String get imdbLowestRatedMovies => 'IMDb најлошије оцењени филмови';

  @override
  String get imdbTopEnglishMovies => 'IMDb најбоље оцењени енглески филмови';

  @override
  String get addToWatchlist => 'Add to Watchlist';

  @override
  String get removeFromWatchlist => 'Remove from Watchlist';

  @override
  String get watchlistUpdateFailed => 'Couldn\'t update watchlist';
}
