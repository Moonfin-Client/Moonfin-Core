// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'НАЛАШТУВАННЯ ОБЛІКОВОГО ЗАПИСУ';

  @override
  String get interfaceLanguage => 'Мова інтерфейсу';

  @override
  String get systemLanguageDefault => 'Як у системі';

  @override
  String get signIn => 'Увійти';

  @override
  String get empty => 'Порожньо';

  @override
  String connectingToServer(String serverName) {
    return 'Підключення до $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Пароль';

  @override
  String get username => 'Ім\'я користувача';

  @override
  String get email => 'Електронна пошта';

  @override
  String get quickConnectInstruction =>
      'Введіть цей код на веб-панелі вашого сервера:';

  @override
  String get waitingForAuthorization => 'Очікування авторизації...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Сервер недоступний';

  @override
  String get loginFailed => 'Помилка входу';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect недоступний: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect недоступний ($status): $detail';
  }

  @override
  String get whosWatching => 'Хто дивиться?';

  @override
  String get addUser => 'Додати користувача';

  @override
  String get selectServer => 'Виберіть Сервер';

  @override
  String appVersionFooter(String version) {
    return 'Версія Moonfin $version';
  }

  @override
  String get savedServers => 'Збережені сервери';

  @override
  String get discoveredServers => 'Виявлені сервери';

  @override
  String get noneFound => 'Не знайдено';

  @override
  String get unableToConnectToServer => 'Не вдалося підключитися до сервера';

  @override
  String get addServer => 'Додати сервер';

  @override
  String get embyConnect => 'Emby Підключитися';

  @override
  String get removeServer => 'Видалити сервер';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Видалити «$serverName» зі списку ваших серверів?';
  }

  @override
  String get cancel => 'Скасувати';

  @override
  String get remove => 'Прибрати';

  @override
  String get connectToServer => 'Підключитися до сервера';

  @override
  String get serverAddress => 'Адреса сервера';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Підключитися';

  @override
  String get secureStorageUnavailable => 'Захищене сховище недоступне';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin не може отримати доступ до вашого системного брелока. Вхід можна продовжити, але безпечне зберігання токенів може бути недоступним, доки брелок не буде розблоковано.';

  @override
  String get ok => 'добре';

  @override
  String get settingsAppearanceTheme => 'Тема програми';

  @override
  String get detailScreenStyle => 'Стиль екрана деталей';

  @override
  String get detailScreenStyleSubtitle =>
      '«Класичний» — це початковий центрований макет moonfin. «Сучасний» — адаптивний кінематографічний макет.';

  @override
  String get detailScreenStyleMoonfin => 'Класичний';

  @override
  String get detailScreenStyleModern => 'Сучасний';

  @override
  String get expandedTabs => 'Розгорнуті вкладки';

  @override
  String get expandedTabsSubtitle =>
      'Автоматично показувати вміст вкладки під час її перегляду. Вимкніть, щоб відкривати й закривати кожну вкладку вручну.';

  @override
  String get showTechnicalDetails => 'Показувати технічні деталі?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Показувати кодек, роздільну здатність і відомості про потік у зведенні банера';

  @override
  String get recommendationSystem => 'Система рекомендацій';

  @override
  String get recommendationSystemSubtitle =>
      'Використовуйте локальний алгоритм «Moonfin рекомендує» або онлайн-метрики схожості TMDb. Примітка: онлайн-рекомендації потребують інтеграції з Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin рекомендує';

  @override
  String get recommendationSystemTmdb => 'Схожість TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Обмежувати за віковим рейтингом?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Обмежувати пропозиції «Moonfin рекомендує» за віковим рейтингом цільового медіа';

  @override
  String get interfaceStyle => 'Стиль інтерфейсу';

  @override
  String get interfaceStyleSubtitle =>
      '«Автоматично» відповідає вашому пристрою. Виберіть Apple або Material, щоб задати вигляд примусово.';

  @override
  String get interfaceStyleAutomatic => 'Автоматично';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Якість скла';

  @override
  String get glassQualitySubtitle =>
      '«Авто» добирає найкращий ефект скла для цього пристрою. «Повна» вмикає справжнє розмиття; «Знижена» використовує полегшене скло, що заощаджує ресурс GPU.';

  @override
  String get glassQualityAuto => 'Авто';

  @override
  String get glassQualityFull => 'Повна';

  @override
  String get glassQualityReduced => 'Знижена';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Перемикайтеся між Moonfin і Neon Pulse без перезапуску програми';

  @override
  String get customThemeTitle => 'Власна тема';

  @override
  String get customThemeSubtitle =>
      'Власні теми змінюють візуальні елементи в усьому Moonfin. Виберіть один із варіантів на свій смак.';

  @override
  String get keyboardPreferSystemIme =>
      'Віддавати перевагу системній клавіатурі';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Типово використовувати метод введення вашого пристрою для введення тексту';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Поточний Moonfin вигляд, який вам усім сподобався';

  @override
  String get themeNeonPulse => 'Неоновий пульс';

  @override
  String get themeNeonPulseSubtitle =>
      'Стиль Synthwave із пурпуровим сяйвом, блакитним текстом і сильнішим хромованим контрастом';

  @override
  String get themeGlass => 'Скло';

  @override
  String get themeGlassSubtitle =>
      'Стиль рідкого скла з плинним градієнтним тлом, матовими поверхнями та синім акцентом Apple';

  @override
  String get theme8BitHero => '8-бітний герой';

  @override
  String get theme8BitHeroSubtitle =>
      'Ретростиль піксель-арту з насиченою палітрою, масивними рамками, різкими тінями та піксельним шрифтом';

  @override
  String get embyConnectSignInSubtitle =>
      'Увійдіть за допомогою облікового запису Emby Connect';

  @override
  String get emailOrUsername => 'Електронна пошта або ім\'я користувача';

  @override
  String get selectAServer => 'Виберіть сервер';

  @override
  String get tryAgain => 'Спробуйте знову';

  @override
  String get noLinkedServers =>
      'Немає серверів, пов’язаних із цим обліковим записом Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Недійсні облікові дані Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Недійсне ім’я користувача або пароль Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сервер не підтримує обмін Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Помилка мережі під час підключення до Emby Connect або вибраного сервера';

  @override
  String get loadingLinkedServers => 'Завантаження зв\'язаних серверів...';

  @override
  String get connectingToServerEllipsis => 'Підключення до сервера...';

  @override
  String get noReachableAddress => 'Не вказано доступну адресу';

  @override
  String get invalidServerExchangeResponse =>
      'Недійсна відповідь від кінцевої точки обміну сервером';

  @override
  String unableToConnectTo(String target) {
    return 'Не вдалося підключитися до $target';
  }

  @override
  String get exitApp => 'Вийти з Moonfin?';

  @override
  String get exitAppConfirmation => 'Ви впевнені, що бажаєте вийти?';

  @override
  String get exit => 'Вихід';

  @override
  String get gameMenu => 'Меню';

  @override
  String get gamePaused => 'Призупинено';

  @override
  String get gameSaveState => 'Зберегти стан';

  @override
  String get games => 'Ігри';

  @override
  String get gameLoadState => 'Завантажити стан';

  @override
  String get gameFastForward => 'Перемотування вперед';

  @override
  String get gameEmulatorSettings => 'Налаштування емулятора';

  @override
  String get gameNoCoreOptions => 'Це ядро не має налаштовуваних параметрів.';

  @override
  String get gameHoldToOpenMenu => 'Утримуйте, щоб відкрити меню';

  @override
  String get gamePlaybackUnsupported =>
      'Запуск ігор поки що не підтримується на цьому пристрої.';

  @override
  String get noHomeRowsLoaded => 'Не вдалося завантажити домашні рядки';

  @override
  String get noHomeRowsHint =>
      'Спробуйте оновити або зменшити кількість активних розділів домашньої сторінки.';

  @override
  String get retryHomeRows => 'Повторити домашні рядки';

  @override
  String get guide => 'Гід';

  @override
  String get recordings => 'Записи';

  @override
  String get schedule => 'розклад';

  @override
  String get series => 'Серіали';

  @override
  String get noItemsFound => 'Елементів не знайдено';

  @override
  String get home => 'Головна';

  @override
  String get browseAll => 'Переглянути все';

  @override
  String get genres => 'Жанри';

  @override
  String get collectionPlaceholder => 'Тут з’являться елементи колекції';

  @override
  String get browseByLetter => 'Перегляд за літерою';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Тут з’явиться перегляд в алфавітному порядку';

  @override
  String get suggestions => 'Пропозиції';

  @override
  String get suggestionsPlaceholder => 'Тут з’являться запропоновані елементи';

  @override
  String get failedToLoadLibraries => 'Не вдалося завантажити бібліотеки';

  @override
  String get noLibrariesFound => 'Бібліотеки не знайдено';

  @override
  String get library => 'Медіатека';

  @override
  String get displaySettings => 'Налаштування дисплея';

  @override
  String get allGenres => 'Всі жанри';

  @override
  String get noGenresFound => 'Жанри не знайдено';

  @override
  String failedToLoadFolderError(String error) {
    return 'Не вдалося завантажити теку: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ця папка порожня';

  @override
  String itemCountLabel(int count) {
    return '$count елементів';
  }

  @override
  String get failedToLoadFavorites => 'Не вдалося завантажити вибране';

  @override
  String get retry => 'Повторіть спробу';

  @override
  String get noFavoritesYet => 'Вибраних ще немає';

  @override
  String get favorites => 'Вибране';

  @override
  String totalCountItems(int count) {
    return '$count елементів';
  }

  @override
  String get continuing => 'Продовження';

  @override
  String get ended => 'Закінчився';

  @override
  String get sortAndFilter => 'Сортування та фільтр';

  @override
  String get type => 'Тип';

  @override
  String get sortBy => 'Сортувати за';

  @override
  String get display => 'Дисплей';

  @override
  String get imageType => 'Тип зображення';

  @override
  String get posterSize => 'Розмір плаката';

  @override
  String get small => 'Маленький';

  @override
  String get medium => 'Середній';

  @override
  String get large => 'великий';

  @override
  String get extraLarge => 'Дуже великий';

  @override
  String libraryGenresTitle(String name) {
    return '$name — жанри';
  }

  @override
  String get views => 'Перегляди';

  @override
  String get albums => 'Альбоми';

  @override
  String get albumArtists => 'Виконавці альбому';

  @override
  String get artists => 'Виконавці';

  @override
  String get bookmarks => 'Закладки';

  @override
  String get noSavedBookmarks =>
      'Для цього заголовка ще немає збережених закладок.';

  @override
  String get openBook => 'Відкрита книга';

  @override
  String get chapter => 'Розділ';

  @override
  String get page => 'Сторінка';

  @override
  String get bookmark => 'Закладка';

  @override
  String get justNow => 'Просто зараз';

  @override
  String minutesAgo(int count) {
    return '$count хв тому';
  }

  @override
  String hoursAgo(int count) {
    return '$count год тому';
  }

  @override
  String daysAgo(int count) {
    return '$count дн тому';
  }

  @override
  String get discoverySubjects => 'Предмети відкриття';

  @override
  String get pickDiscoverySubjects =>
      'Виберіть тематичні канали для показу в Discover.';

  @override
  String get apply => 'Застосувати';

  @override
  String get openLink => 'Відкрити посилання';

  @override
  String get scanWithYourPhone => 'Скануйте за допомогою телефону';

  @override
  String get audiobookGenres => 'Жанри аудіокниг';

  @override
  String get pickAudiobookGenres =>
      'Виберіть, які жанри показувати в Discover аудіокниг.';

  @override
  String get discoverAudiobooks => 'Відкрийте для себе аудіокниги';

  @override
  String get librivoxDescription =>
      'Популярні назви публічного домену від LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count назв';
  }

  @override
  String get scrollLeft => 'Прокрутіть вліво';

  @override
  String get scrollRight => 'Прокрутіть праворуч';

  @override
  String get couldNotLoadGenre => 'Зараз не вдалося завантажити цей жанр.';

  @override
  String get continueReading => 'Продовжити читання';

  @override
  String get savedHighlights => 'Збережені основні моменти';

  @override
  String get continueListening => 'Продовжуйте слухати';

  @override
  String get listen => 'Слухай';

  @override
  String get resume => 'Продовжити';

  @override
  String get failedToLoadLibrary => 'Не вдалося завантажити бібліотеку';

  @override
  String get popularNow => 'Популярні зараз';

  @override
  String get savedForLater => 'Збережено на потім';

  @override
  String get topListens => 'Найкращі прослуховування';

  @override
  String get unreadDiscoveries => 'Непрочитані відкриття';

  @override
  String get pickUpAgain => 'Підніміть ще раз';

  @override
  String get bookHighlightsDescription =>
      'Ваші книги з найкращими моментами, вибраними або прогресом читання.';

  @override
  String get handPickedFromLibrary => 'Вибране вручну з вашої бібліотеки.';

  @override
  String get handPickedFromListeningQueue =>
      'Вибране вручну з вашої черги прослуховування.';

  @override
  String get booksWithHighlights =>
      'Книги з найкращими моментами, вибраними або прогресом читання.';

  @override
  String get jumpBackNarration =>
      'Поверніться до розповіді, не шукаючи свого місця.';

  @override
  String get unreadBooksReady =>
      'Непрочитані книги готові до наступної тихої години.';

  @override
  String get quickAccessFavorites =>
      'Швидкий доступ до книг, до яких ви постійно повертаєтеся.';

  @override
  String get searchAudiobooks => 'Пошук аудіокниг';

  @override
  String get searchYourLibrary => 'Пошук у вашій бібліотеці';

  @override
  String get pickUpStory => 'Продовжуйте історію з того місця, де зупинилися';

  @override
  String get savedPlacesChapters =>
      'Ваші збережені місця та незакінчені розділи';

  @override
  String authorsCount(int count) {
    return '$count авторів';
  }

  @override
  String genresCount(int count) {
    return '$count жанрів';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% завершено';
  }

  @override
  String get readyWhenYouAre => 'Готові, коли будете';

  @override
  String get details => 'Подробиці';

  @override
  String get listeningRoom => 'Кімната для прослуховування';

  @override
  String get bookmarksAndProgress => 'Закладки та прогрес';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count назв, упорядкованих для перегляду з фокусом на читанні.';
  }

  @override
  String get titles => 'Назви';

  @override
  String get allTitles => 'Усі назви';

  @override
  String get authors => 'Автори';

  @override
  String get browseByAuthor => 'Пошук за автором';

  @override
  String get browseByGenre => 'Перегляд за жанром';

  @override
  String get discover => 'Відкрийте для себе';

  @override
  String get trendingTitlesOpenLibrary =>
      'Популярні назви за темами з Open Library.';

  @override
  String get noBookmarkedItems => 'Ще немає закладок';

  @override
  String get nothingMatchesSection =>
      'Ще нічого не відповідає цьому розділу. Спробуйте іншу вкладку або поверніться після завершення синхронізації бібліотеки.';

  @override
  String get audiobooks => 'Аудіокниги';

  @override
  String noLabelFound(String label) {
    return '$label не знайдено';
  }

  @override
  String get folder => 'Папка';

  @override
  String get filters => 'Фільтри';

  @override
  String get readingStatus => 'Статус читання';

  @override
  String get playedStatus => 'Статус зіграно';

  @override
  String get readStatus => 'Прочитайте';

  @override
  String get watched => 'Переглянуто';

  @override
  String get unread => 'Непрочитаний';

  @override
  String get unwatched => 'Не переглянуто';

  @override
  String get seriesStatus => 'Статус серії';

  @override
  String get allLibraries => 'Усі бібліотеки';

  @override
  String get books => 'Книги';

  @override
  String get latestBooks => 'Найновіші книги';

  @override
  String get latestAudiobooks => 'Найновіші аудіокниги';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count книги',
      many: '$count книг',
      few: '$count книги',
      one: '$count книга',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Книга';

  @override
  String get bookFormatAudiobook => 'Аудіокнига';

  @override
  String bookPercentRead(int percent) {
    return '$percent% прочитано';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Залишилось $time';
  }

  @override
  String get bookHeroRead => 'Читати';

  @override
  String get bookHeroListen => 'Слухати';

  @override
  String get author => 'Автор';

  @override
  String get unknownAuthor => 'Невідомий автор';

  @override
  String get uncategorized => 'Без категорії';

  @override
  String get overview => 'Огляд';

  @override
  String get noLibrivoxDescription => 'LibriVox ще не надав опису цієї назви.';

  @override
  String get readers => 'Читачі';

  @override
  String get openLinks => 'Відкрийте посилання';

  @override
  String get librivoxPage => 'Сторінка LibriVox';

  @override
  String get internetArchive => 'Інтернет-архів';

  @override
  String get rssFeed => 'RSS-канал';

  @override
  String get downloadZip => 'Завантажити Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count розділів';
  }

  @override
  String firstPublished(int year) {
    return 'Перше видання: $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'У Open Library ще немає огляду для цієї назви.';

  @override
  String get subjects => 'Предмети';

  @override
  String get all => 'всі';

  @override
  String booksCount(int count) {
    return '$count книг';
  }

  @override
  String get couldNotLoadSubject => 'Зараз не вдалося завантажити цю тему.';

  @override
  String get audiobookDetails => 'Деталі аудіокниги';

  @override
  String authorsCountTitle(int count) {
    return '$count авторів';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудіокниги',
      many: '$count аудіокниг',
      few: '$count аудіокниги',
      one: '$count аудіокнига',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Список треків';

  @override
  String get itemListPlaceholder => 'Тут з’явиться список елементів';

  @override
  String get failedToLoad => 'Не вдалося завантажити';

  @override
  String get delete => 'Видалити';

  @override
  String get save => 'Зберегти';

  @override
  String get moreLikeThis => 'Більше подібного';

  @override
  String get castAndCrew => 'Актори та знімальна група';

  @override
  String get collection => 'Колекція';

  @override
  String get episodes => 'Епізоди';

  @override
  String get nextUp => 'Далі';

  @override
  String get seasons => 'Сезони';

  @override
  String get chapters => 'Розділи';

  @override
  String get features => 'особливості';

  @override
  String get movies => 'фільми';

  @override
  String get musicVideos => 'Музичні відео';

  @override
  String get other => 'інше';

  @override
  String get discography => 'Дискографія';

  @override
  String get similarArtists => 'Схожі виконавці';

  @override
  String get tableOfContents => 'Зміст';

  @override
  String get tracklist => 'Список треків';

  @override
  String discNumber(int number) {
    return 'Диск $number';
  }

  @override
  String get biography => 'біографія';

  @override
  String get authorDetails => 'Відомості про автора';

  @override
  String get noOverviewAvailable => 'Для цієї назви ще немає огляду.';

  @override
  String get noBiographyAvailable => 'Немає доступної біографії цього автора.';

  @override
  String get noBooksFound => 'Книг цього автора не знайдено.';

  @override
  String get unableToLoadAuthorDetails =>
      'Зараз неможливо завантажити відомості про автора.';

  @override
  String published(int year) {
    return 'Видано $year';
  }

  @override
  String get publicationDateUnknown => 'Дата публікації невідома';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сезону',
      many: '$count сезонів',
      few: '$count сезони',
      one: '$count сезон',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Закінчиться о $time';
  }

  @override
  String get items => 'Елементи';

  @override
  String get extras => 'Додаткові матеріали';

  @override
  String get behindTheScenes => 'За лаштунками';

  @override
  String get deletedScenes => 'Вилучені сцени';

  @override
  String get featurettes => 'Мініфільми';

  @override
  String get interviews => 'Інтерв\'ю';

  @override
  String get scenes => 'Сцени';

  @override
  String get shorts => 'Короткометражки';

  @override
  String get trailers => 'Трейлери';

  @override
  String timeRemaining(String time) {
    return 'Залишилось $time';
  }

  @override
  String endsIn(String time) {
    return 'Завершиться через $time';
  }

  @override
  String get view => 'Переглянути';

  @override
  String get resumeReading => 'Відновити читання';

  @override
  String get read => 'Прочитайте';

  @override
  String resumeFrom(String position) {
    return 'Продовжити з $position';
  }

  @override
  String get play => 'Відтворити';

  @override
  String get startOver => 'Почніть спочатку';

  @override
  String get restart => 'Перезапустіть';

  @override
  String get readOffline => 'Читайте офлайн';

  @override
  String get playOffline => 'Грати офлайн';

  @override
  String get audio => 'Аудіо';

  @override
  String get subtitles => 'Субтитри';

  @override
  String get version => 'Версія';

  @override
  String get cast => 'Транслювати';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Трейлер';

  @override
  String get finished => 'Готово';

  @override
  String get favorited => 'Вибране';

  @override
  String get favorite => 'улюблений';

  @override
  String get playlist => 'Список відтворення';

  @override
  String get downloaded => 'Завантажено';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get downloadAll => 'Завантажити все';

  @override
  String get download => 'Завантажити';

  @override
  String get deleteDownloaded => 'Видалити завантажене';

  @override
  String get goToSeries => 'Перейдіть до серії';

  @override
  String get editMetadata => 'Редагувати метадані';

  @override
  String get less => 'менше';

  @override
  String get more => 'більше';

  @override
  String get deleteItem => 'Видалити елемент';

  @override
  String get deletePlaylist => 'Видалити список відтворення';

  @override
  String get deletePlaylistMessage =>
      'Видалити цей список відтворення з сервера?';

  @override
  String get deleteItemMessage => 'Видалити цей елемент із сервера?';

  @override
  String get failedToDeletePlaylist => 'Не вдалося видалити список відтворення';

  @override
  String get failedToDeleteItem => 'Не вдалося видалити елемент';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Перейменувати список відтворення';

  @override
  String get playlistName => 'Назва списку відтворення';

  @override
  String get deleteDownloadedAlbum => 'Видалити завантажений альбом';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Видалити завантажені треки для «$title»?';
  }

  @override
  String get downloadedTracksDeleted => 'Завантажені треки видалено';

  @override
  String get downloadedTracksDeleteFailed =>
      'Деякі завантажені композиції не вдалося видалити';

  @override
  String get noTracksLoaded => 'Треків не завантажено';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel не завантажено';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Завантаження $title ($count елементів)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Ви впевнені, що хочете видалити «$name» із сервера? Цю дію неможливо скасувати.';
  }

  @override
  String get itemDeleted => 'Пункт видалено';

  @override
  String get noPlayableTrailerFound =>
      'Не знайдено трейлера, який можна відтворити.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Непідтримуваний формат книги: .$extension';
  }

  @override
  String get audioTrack => 'Аудіодоріжка';

  @override
  String get subtitleTrack => 'Доріжка субтитрів';

  @override
  String get none => 'Немає';

  @override
  String get downloadSubtitlesLabel => 'Завантажити субтитри...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Шукайте за допомогою плагіна OpenSubtitles';

  @override
  String get downloadSubtitles => 'Завантажити субтитри';

  @override
  String get selectedSubtitleInvalid => 'Вибрані субтитри недійсні.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Субтитри завантажено та вибрано: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтитри завантажено. Може знадобитися деякий час, поки Jellyfin оновить елемент.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Віддалених субтитрів для мови $language не знайдено.';
  }

  @override
  String get selectVersion => 'Виберіть Версія';

  @override
  String versionNumber(int number) {
    return 'Версія $number';
  }

  @override
  String get downloadAllQuality => 'Завантажити все — якість';

  @override
  String get downloadQuality => 'Якість завантаження';

  @override
  String get originalFileNoReencoding => 'Оригінальний файл, без перекодування';

  @override
  String get originalFilesNoReencoding =>
      'Оригінальні файли, без перекодування';

  @override
  String get noEpisodesLoaded => 'Немає завантажених епізодів';

  @override
  String downloadingItem(String name, String quality) {
    return 'Завантаження $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Видалити завантажені файли';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Видалити локальні файли для $typeLabel?\n\nЦе звільнить місце у сховищі. Ви зможете завантажити їх знову пізніше.';
  }

  @override
  String get downloadedFilesDeleted => 'Завантажені файли видалено';

  @override
  String get failedToDeleteFiles => 'Не вдалося видалити файли';

  @override
  String get deleteFiles => 'Видалити файли';

  @override
  String get director => 'ДИРЕКТОР';

  @override
  String get directors => 'РЕЖИСЕРИ';

  @override
  String get writer => 'СЦЕНАРИСТ';

  @override
  String get writers => 'СЦЕНАРИСТИ';

  @override
  String get studio => 'СТУДІЯ';

  @override
  String studioMoreCount(int count) {
    return '+ще $count';
  }

  @override
  String totalEpisodes(int count) {
    return '$count епізодів';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Епізод $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Розділ $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count треку',
      many: '$count треків',
      few: '$count треки',
      one: '$count трек',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count розділу',
      many: '$count розділів',
      few: '$count розділи',
      one: '$count розділ',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Народження: $date';
  }

  @override
  String died(String date) {
    return 'Смерть: $date';
  }

  @override
  String age(int age) {
    return 'Вік: $age';
  }

  @override
  String get showLess => 'Показати менше';

  @override
  String get readMore => 'Детальніше';

  @override
  String get shuffle => 'Перемішати';

  @override
  String get shuffleAllMusic => 'Перемішати всю музику';

  @override
  String get carSignInPrompt => 'Увійдіть у Moonfin на телефоні';

  @override
  String get carServerUnreachable => 'Не вдається зв\'язатися з вашим сервером';

  @override
  String downloadsCount(int count) {
    return '$count завантажень';
  }

  @override
  String get perfectMatch => 'Ідеальний матч';

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
    return 'Для дії «$action» з віддаленими субтитрами цьому користувачеві потрібен дозвіл Jellyfin на керування субтитрами.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Не вдалося знайти цей елемент на сервері для дії «$action» з віддаленими субтитрами.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Не вдалося виконати дію «$action» з віддаленими субтитрами: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Не вдалося виконати дію «$action» з віддаленими субтитрами (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Не вдалося виконати дію «$action» з віддаленими субтитрами.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'усі завантажені епізоди для «$name»';
  }

  @override
  String get deleteSeasonFiles => 'усі завантажені серії цього сезону';

  @override
  String get stillWatching => 'Все ще дивитесь?';

  @override
  String get unableToLoadTrailerStream =>
      'Не вдалося завантажити потік трейлера.';

  @override
  String get trailerTimedOut =>
      'Під час завантаження трейлера минув час очікування.';

  @override
  String get playbackFailedForTrailer => 'Не вдалося відтворити цей трейлер.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Трансляція недоступна під час відтворення в автономному режимі.';

  @override
  String castActionFailed(String label, String error) {
    return 'Не вдалося виконати дію $label: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Не вдалося встановити гучність трансляції: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Керування $label';
  }

  @override
  String get deviceVolume => 'Гучність пристрою';

  @override
  String get unavailable => 'Недоступний';

  @override
  String get pause => 'Пауза';

  @override
  String get syncPosition => 'Позиція синхронізації';

  @override
  String stopCast(String label) {
    return 'Зупинити $label';
  }

  @override
  String get queueIsEmpty => 'Черга порожня';

  @override
  String trackNumber(int number) {
    return 'Трек $number';
  }

  @override
  String get remotePlayback => 'Віддалене відтворення';

  @override
  String get castingToGoogleCast => 'Трансляція в Google Cast';

  @override
  String get castingViaAirPlay => 'Трансляція через AirPlay';

  @override
  String get castingViaDlna => 'Трансляція через DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds секунд';
  }

  @override
  String get longPressToUnlock => 'Натисніть і утримуйте, щоб розблокувати';

  @override
  String get off => 'Вимкнено';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Авто';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Мбіт/с';
  }

  @override
  String get bitrateOverride => 'Перевизначення бітрейту';

  @override
  String get audioDelay => 'Затримка звуку';

  @override
  String delayMinusMs(int value) {
    return '-$value мс';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value мс';
  }

  @override
  String get subtitleDelay => 'Затримка субтитрів';

  @override
  String get reset => 'Скинути';

  @override
  String get unknown => 'Невідомий';

  @override
  String get playbackInformation => 'Інформація про відтворення';

  @override
  String get playback => 'Відтворення';

  @override
  String get playMethod => 'Метод гри';

  @override
  String get directPlay => 'Пряма гра';

  @override
  String get directStream => 'Прямий потік';

  @override
  String get transcoding => 'Перекодування';

  @override
  String get transcodeReasons => 'Причини перекодування';

  @override
  String get player => 'Програвач';

  @override
  String get container => 'Контейнер';

  @override
  String get bitrate => 'Бітрейт';

  @override
  String get video => 'відео';

  @override
  String get resolution => 'роздільна здатність';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Кодек';

  @override
  String get videoBitrate => 'Бітрейт відео';

  @override
  String get track => 'Доріжка';

  @override
  String get channels => 'Канали';

  @override
  String get audioBitrate => 'Бітрейт аудіо';

  @override
  String get sampleRate => 'Частота вибірки';

  @override
  String get format => 'Формат';

  @override
  String get external => 'зовнішній';

  @override
  String get embedded => 'Вбудований';

  @override
  String castSessionError(String protocol) {
    return 'Помилка сеансу $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Не вдалося завантажити відомості про книгу: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Відтворення EPUB у додатку ще не доступне на цій платформі.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Цей формат (.$extension) поки що не можна відобразити у програмі.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Вбудоване відтворення документів недоступне на цій платформі.';

  @override
  String get couldNotOpenExternalViewer =>
      'Не вдалося відкрити зовнішній засіб перегляду.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Не вдалося відкрити вбудовану читалку: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Закладку вже збережено на $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Закладку додано: $label';
  }

  @override
  String get noBookmarksYet =>
      'Закладок ще немає.\nТоркніться значка закладки під час читання, щоб зберегти свою позицію.';

  @override
  String get noTableOfContentsAvailable => 'Немає змісту';

  @override
  String pageLabel(int number) {
    return 'Сторінка $number';
  }

  @override
  String get position => 'Позиція';

  @override
  String get bookReader => 'Читачка книг';

  @override
  String formatExtension(String extension) {
    return 'Формат: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% прочитано';
  }

  @override
  String get updating => 'Оновлення...';

  @override
  String get markUnread => 'Позначити як непрочитане';

  @override
  String get markAsRead => 'Позначити як прочитане';

  @override
  String get reloadReader => 'Перезавантажити Reader';

  @override
  String get noPagesFound => 'Сторінок не знайдено.';

  @override
  String get failedToDecodePageImage =>
      'Не вдалося декодувати зображення сторінки.';

  @override
  String resetZoom(String zoom) {
    return 'Скинути масштаб (${zoom}x)';
  }

  @override
  String get singlePage => 'Одна сторінка';

  @override
  String get twoPageSpread => 'Двосторінковий розворот';

  @override
  String get addBookmark => 'Додати закладку';

  @override
  String get bookmarksEllipsis => 'Закладки...';

  @override
  String get markedAsRead => 'Позначено як прочитане';

  @override
  String get markedAsUnread => 'Позначено як непрочитане';

  @override
  String failedToUpdateReadState(String error) {
    return 'Не вдалося оновити стан прочитання: $error';
  }

  @override
  String get themeSystem => 'Тема: Система';

  @override
  String get themeLight => 'Тема: Світло';

  @override
  String get themeDark => 'Тема: Темний';

  @override
  String get themeSepia => 'Тема: сепія';

  @override
  String get invertColorsFixedLayout =>
      'Інвертувати кольори (фіксований макет)';

  @override
  String get invertColorsPdf => 'Інвертувати кольори (PDF)';

  @override
  String get preparingInAppReader =>
      'Підготовка програми для читання в програмі...';

  @override
  String get pdfDataNotAvailable => 'PDF-дані недоступні.';

  @override
  String get readerFallbackModeActive => 'Резервний режим Reader активний';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ця платформа не підтримує вбудований рушій документів для файлів $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Використовуйте Reload Reader після переходу на підтримувану цільову платформу (Android, iOS, macOS).';

  @override
  String get openExternally => 'Відкрити ззовні';

  @override
  String get noEpubChaptersFound => 'Розділи EPUB не знайдено.';

  @override
  String get readerNotReady => 'Читач не готовий.';

  @override
  String get seriesRecordings => 'Записи серіалів';

  @override
  String get now => 'Зараз';

  @override
  String get sports => 'спорт';

  @override
  String get news => 'Новини';

  @override
  String get kids => 'діти';

  @override
  String get premiere => 'Прем\'єра';

  @override
  String get guideTimeline => 'Хронологія керівництва';

  @override
  String failedToLoadGuide(String error) {
    return 'Не вдалося завантажити телепрограму: $error';
  }

  @override
  String get noChannelsFound => 'Канали не знайдено';

  @override
  String get liveBadge => 'НАЖИВО';

  @override
  String guideNextProgram(String time, String title) {
    return 'Далі: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Залишилось $minutes хв';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Залишилось $hours год';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Залишилось $hours год $minutes хв';
  }

  @override
  String get movie => 'фільм';

  @override
  String get removedFromFavoriteChannels => 'Видалено з улюблених каналів';

  @override
  String get addedToFavoriteChannels => 'Додано до улюблених каналів';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Не вдалося оновити улюблений канал';

  @override
  String get unfavoriteChannel => 'Невибраний канал';

  @override
  String get favoriteChannel => 'Улюблений канал';

  @override
  String get record => 'Записати';

  @override
  String get cancelRecordingAction => 'Скасувати запис';

  @override
  String get programSetToRecord => 'Програму поставлено на запис';

  @override
  String get recordingCancelled => 'Запис скасовано';

  @override
  String get unableToCreateRecording => 'Не вдалося створити запис';

  @override
  String get watch => 'Дивитися';

  @override
  String get close => 'Закрити';

  @override
  String failedToPlayChannel(String name) {
    return 'Не вдалося відтворити $name';
  }

  @override
  String get failedToLoadRecordings => 'Не вдалося завантажити записи';

  @override
  String get scheduledInNext24Hours =>
      'Заплановано протягом наступних 24 годин';

  @override
  String get recentRecordings => 'Останні записи';

  @override
  String get tvSeries => 'серіал';

  @override
  String get failedToLoadSchedule => 'Не вдалося завантажити розклад';

  @override
  String get noScheduledRecordings => 'Немає запланованих записів';

  @override
  String get cancelRecording => 'Скасувати запис?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Скасувати запланований запис «$name»?';
  }

  @override
  String get no => 'Ні';

  @override
  String get yesCancel => 'Так, скасувати';

  @override
  String get failedToCancelRecording => 'Не вдалося скасувати запис';

  @override
  String get failedToLoadSeriesRecordings =>
      'Не вдалося завантажити записи серії';

  @override
  String get noSeriesRecordings => 'Записів серіалів немає';

  @override
  String get cancelSeriesRecording => 'Скасувати запис серії';

  @override
  String get cancelSeriesRecordingQuestion => 'Скасувати запис серії?';

  @override
  String stopRecordingName(String name) {
    return 'Зупинити запис «$name»?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Не вдалося скасувати запис серії';

  @override
  String get searchThisLibrary => 'Пошук у цій бібліотеці...';

  @override
  String get searchEllipsis => 'пошук...';

  @override
  String noResultsForQuery(String query) {
    return 'Немає результатів за запитом «$query»';
  }

  @override
  String searchFailedError(String error) {
    return 'Помилка пошуку: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Тип облікового запису Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Місцевий';

  @override
  String get savedMedia => 'Збережені медіа';

  @override
  String get tvShows => 'Телешоу';

  @override
  String get music => 'музика';

  @override
  String get musicAlbums => 'Музичні альбоми';

  @override
  String get noMediaInFilter => 'У цьому фільтрі немає медіа';

  @override
  String get noDownloadedMediaYet => 'Ще немає завантажених медіафайлів';

  @override
  String get browseLibrary => 'Огляд бібліотеки';

  @override
  String get deleteDownload => 'Видалити завантаження';

  @override
  String removeItemAndFiles(String name) {
    return 'Видалити «$name» та його файли?';
  }

  @override
  String tracksCount(int count) {
    return '$count треків';
  }

  @override
  String get album => 'Альбом';

  @override
  String get playAlbum => 'Відтворити альбом';

  @override
  String failedToLoadAlbum(String error) {
    return 'Не вдалося завантажити альбом: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Для $name не знайдено завантажених треків.';
  }

  @override
  String get season => 'Сезон';

  @override
  String get errorLoadingEpisodes => 'Помилка завантаження серій';

  @override
  String get noDownloadedEpisodes => 'Немає завантажених серій';

  @override
  String get deleteEpisode => 'Видалити епізод';

  @override
  String removeName(String name) {
    return 'Видалити «$name»?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes хв';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'С$season Е$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Епізод $number';
  }

  @override
  String get seriesNotFound => 'Серія не знайдена';

  @override
  String get errorLoadingSeries => 'Помилка завантаження серії';

  @override
  String get downloadedEpisodes => 'Завантажені епізоди';

  @override
  String seasonNumber(int number) {
    return 'Сезон $number';
  }

  @override
  String seasonChip(int number) {
    return 'С$number';
  }

  @override
  String get specials => 'Спец';

  @override
  String get deleteSeason => 'Видалити сезон';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Видалити всі завантажені епізоди в $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count епізоду',
      many: '$count епізодів',
      few: '$count епізоди',
      one: '$count епізод',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Управління зберіганням';

  @override
  String get storageBreakdown => 'Поломка зберігання';

  @override
  String get downloadedItems => 'Завантажені елементи';

  @override
  String get storageLimit => 'Ліміт зберігання';

  @override
  String get noLimit => 'Без обмежень';

  @override
  String get deleteAllDownloads => 'Видалити всі завантаження';

  @override
  String get deleteAllDownloadsWarning =>
      'Це призведе до видалення всіх завантажених мультимедійних файлів, і цю дію неможливо скасувати.';

  @override
  String get deleteAll => 'Видалити все';

  @override
  String get deleteSelected => 'Видалити вибране';

  @override
  String deleteSelectedCount(int count) {
    return 'Видалити $count завантажених елементів?';
  }

  @override
  String get musicAndAudiobooks => 'Музика та аудіокниги';

  @override
  String get images => 'Зображення';

  @override
  String get database => 'База даних';

  @override
  String ofStorageLimit(String limit) {
    return 'з ліміту $limit';
  }

  @override
  String get settings => 'Налаштування';

  @override
  String get authentication => 'Автентифікація';

  @override
  String get autoLoginServerManagement =>
      'Автоматичний вхід, керування сервером';

  @override
  String get pinCode => 'ПІН-код';

  @override
  String get setUpPinCodeProtection => 'Налаштувати захист PIN-кодом';

  @override
  String get parentalControls => 'Батьківський контроль';

  @override
  String get contentRatingRestrictions => 'Обмеження рейтингу вмісту';

  @override
  String get bitRateResolutionBehavior =>
      'Бітрейт, роздільна здатність, поведінка';

  @override
  String get languageSizeAppearance => 'Мова, розмір, зовнішній вигляд';

  @override
  String get qualityStorage => 'Якість, зберігання';

  @override
  String get serverSyncAndPluginStatus =>
      'Синхронізація сервера та статус плагіна';

  @override
  String get mediaRequestIntegration => 'Інтеграція медіа-запитів';

  @override
  String get switchServer => 'Змінити сервер';

  @override
  String get signOut => 'Вийти';

  @override
  String get versionLicenses => 'Версія, ліцензії';

  @override
  String get account => 'Обліковий запис';

  @override
  String get signInAndSecurity => 'Вхід і безпека';

  @override
  String get administration => 'Адміністрація';

  @override
  String get serverSettingsUsersLibraries =>
      'Налаштування сервера, користувачі, бібліотеки';

  @override
  String get customization => 'Налаштування';

  @override
  String get themeAndLayout => 'Тема і макет';

  @override
  String get videoAndSubtitles => 'Відео та субтитри';

  @override
  String get integrations => 'Інтеграції';

  @override
  String get pluginAndRequests => 'Плагін і запити';

  @override
  String get customizeAccountPlaybackInterface =>
      'Налаштуйте поведінку облікового запису, відтворення та інтерфейсу';

  @override
  String optionsCount(int count) {
    return '$count параметрів';
  }

  @override
  String get themeAndAppearance => 'Тема та зовнішній вигляд';

  @override
  String get focusBorderColor => 'Колір межі фокуса';

  @override
  String get watchedIndicators => 'Переглянуті індикатори';

  @override
  String get always => 'Завжди';

  @override
  String get hideUnwatched => 'Приховати непереглянуті';

  @override
  String get episodesOnly => 'Тільки епізоди';

  @override
  String get never => 'Ніколи';

  @override
  String get focusExpansionAnimation => 'Анімація розширення фокусу';

  @override
  String get desktopUiScale => 'Шкала робочого інтерфейсу';

  @override
  String get scaleFocusedCards =>
      'Масштабування сфокусованих або наведених карток і плиток';

  @override
  String get backgroundBackdrops => 'Фонові фони';

  @override
  String get showBackdropImages => 'Показувати зображення фону за вмістом';

  @override
  String get seriesThumbnails => 'Мініатюри серії';

  @override
  String get seriesThumbnailsDescription =>
      'Лише епізоди: використовуйте зображення серії, яке відповідає кожному типу зображення рядка';

  @override
  String get homeRowInfoOverlay => 'Накладення інформації про домашній рядок';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Показувати заголовок і метадані під час перегляду домашніх рядків';

  @override
  String get clockDisplay => 'Дисплей годинника';

  @override
  String get inMenus => 'У меню';

  @override
  String get inVideo => 'У відео';

  @override
  String get seasonalEffects => 'Сезонні ефекти';

  @override
  String get seasonalEffectsDescription =>
      'Візуальні ефекти та сезонні прикраси';

  @override
  String get snow => 'сніг';

  @override
  String get fireworks => 'Феєрверк';

  @override
  String get confetti => 'Конфетті';

  @override
  String get fallingLeaves => 'Падаюче листя';

  @override
  String get themeMusic => 'Тематична музика';

  @override
  String get playThemeMusicOnDetailPages =>
      'Увімкніть тематичну музику на сторінках інформації';

  @override
  String get themeMusicVolume => 'Гучність тематичної музики';

  @override
  String get themeMusicSettingsSubtitle =>
      'Сторінки деталей, рядки на головній та гучність';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Тематична музика на Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Грайте під час перегляду головного екрана';

  @override
  String get loopThemeMusic => 'Зациклити музичну тему';

  @override
  String get loopThemeMusicSubtitle =>
      'Повторювати трек, а не відтворювати його лише раз';

  @override
  String get detailsBackgroundBlur => 'Розмиття фону деталей';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value пкс';
  }

  @override
  String get browsingBackgroundBlur => 'Перегляд розмиття фону';

  @override
  String get maxStreamingBitrate => 'Макс. потоковий бітрейт';

  @override
  String get maxResolution => 'Максимальна роздільна здатність';

  @override
  String get playerZoomMode => 'Режим масштабування гравця';

  @override
  String get settingsScrollWheelAction => 'Коліщатко миші';

  @override
  String get settingsScrollWheelActionDescription =>
      'Виберіть, що робитиме прокручування коліщатком миші над відео під час відтворення.';

  @override
  String get scrollWheelActionOff => 'Вимкнено';

  @override
  String get scrollWheelActionSeek => 'Перемотування (вперед / назад)';

  @override
  String get scrollWheelActionVolume => 'Гучність';

  @override
  String get playerTooltipVolume => 'Гучність';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Автоматичне обрізання';

  @override
  String get stretch => 'Розтягнути';

  @override
  String get refreshRateSwitching => 'Перемикання частоти оновлення';

  @override
  String get disabled => 'Вимкнено';

  @override
  String get scaleOnTv => 'Шкала на ТБ';

  @override
  String get scaleOnDevice => 'Масштаб на пристрої';

  @override
  String get trickPlay => 'Трик Гра';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Показувати мініатюри попереднього перегляду під час пошуку';

  @override
  String get showDescriptionOnPause => 'Показати опис на паузі';

  @override
  String get dimVideoShowOverview =>
      'Зменшити відео та показати оглядовий текст під час паузи';

  @override
  String get osdLockButton => 'Кнопка блокування OSD';

  @override
  String get osdLockButtonDescription =>
      'Показати кнопку блокування, яка блокує сенсорне введення, поки не буде натиснуто довго';

  @override
  String get audioBehavior => 'Аудіо поведінка';

  @override
  String get downmixToStereo => 'Зведення до стерео';

  @override
  String get defaultAudioLanguage => 'Мова аудіо за замовчуванням';

  @override
  String get fallbackAudioLanguage => 'Резервна мова аудіо';

  @override
  String get preferDefaultAudioTrack =>
      'Віддавати перевагу типовій аудіодоріжці';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Віддавати перевагу оригінальній аудіодоріжці замість локалізованого дубляжу.';

  @override
  String get preferAudioDescription => 'Віддавати перевагу доріжкам аудіоопису';

  @override
  String get preferAudioDescriptionDescription =>
      'Віддавати перевагу доріжкам аудіоопису замість звичайних доріжок.';

  @override
  String get transcodingAudio => 'Транскодування (аудіо)';

  @override
  String get directStreamRemux => 'Прямий потік (ремуксування)';

  @override
  String get transcodingBitrateOrResolution =>
      'Транскодування (бітрейт або роздільна здатність)';

  @override
  String get transcodingVideoAndAudio => 'Транскодування (відео та аудіо)';

  @override
  String get transcodingVideo => 'Транскодування (відео)';

  @override
  String get autoServerDefault => 'Автоматично (за умовчанням для сервера)';

  @override
  String get english => 'англійська';

  @override
  String get spanish => 'Іспанська';

  @override
  String get french => 'французька';

  @override
  String get german => 'Німецький';

  @override
  String get italian => 'італійська';

  @override
  String get portuguese => 'португальська';

  @override
  String get japanese => 'Японський';

  @override
  String get korean => 'корейська';

  @override
  String get chinese => 'китайський';

  @override
  String get russian => 'російська';

  @override
  String get arabic => 'арабська';

  @override
  String get hindi => 'Хінді';

  @override
  String get dutch => 'голландська';

  @override
  String get swedish => 'шведська';

  @override
  String get norwegian => 'норвезька';

  @override
  String get danish => 'датська';

  @override
  String get finnish => 'фінська';

  @override
  String get polish => 'польський';

  @override
  String get ac3Passthrough => 'Прохід AC3';

  @override
  String get dtsPassthrough => 'Передача DTS';

  @override
  String get trueHdSupport => 'Підтримка TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS audio тільки до AVR; вимагає підтримки приймача та вихідної доріжки DTS';

  @override
  String get enableTrueHdAudio =>
      'Увімкнути аудіо TrueHD (може працювати не на всіх платформах)';

  @override
  String get settingsAudioOutputMode => 'Режим виведення звуку';

  @override
  String get settingsAudioOutputModeDescription =>
      'Виберіть, як декодується звук. «Пряма передача на AVR» надсилає необроблені потоки Dolby/DTS на ваш ресивер; «Авто» чи «Мікшування» декодують локально.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Пряма передача на AVR';

  @override
  String get settingsAudioFallbackCodec => 'Резервний аудіокодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Виберіть цільовий формат для транскодування багатоканального звуку, коли вихідний потік не можна відтворити напряму або передати без обробки.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Автовизначення\n(рекомендовано)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(типово)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(без втрат)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(лише стерео)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(ефективний)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(без втрат)';

  @override
  String get settingsMaxAudioChannels => 'Максимум аудіоканалів';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Налаштуйте максимальну кількість каналів вашої аудіосистеми. Багатоканальні потоки, що перевищують цей ліміт, буде змікшовано або транскодовано.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Автовизначення\n(типово для обладнання)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 моно';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 стерео';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 об\'ємний';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 квадрофонія';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 об\'ємний';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 об\'ємний';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 об\'ємний';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 об\'ємний';

  @override
  String get settingsAudioPassthroughAdvanced => 'Пряма передача (додатково)';

  @override
  String get settingsAudioCodecPassthrough => 'Пряма передача кодеків';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Вмикайте лише формати, які підтримує ваш AVR або HDMI-приймач.';

  @override
  String get settingsAudioEac3Passthrough => 'Пряма передача EAC3';

  @override
  String get settingsAudioEac3JocPassthrough =>
      'Пряма передача EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough => 'Пряма передача DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'Пряма передача DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'Пряма передача TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough =>
      'Пряма передача TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Передавати бітпотік Dolby Digital Plus (EAC3) на зовнішній декодер.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Передавати бітпотік Dolby Atmos через EAC3 (JOC) на зовнішній декодер.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Передавати бітпотік DTS-HD MA (разом із ядром DTS) на зовнішній декодер.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Передавати бітпотік Dolby TrueHD з метаданими Atmos на зовнішній декодер.';

  @override
  String get settingsDetectedAudioCapabilities => 'Виявлені аудіоможливості';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Знімок можливостей середовища ще недоступний.';

  @override
  String get settingsAudioRouteLabel => 'Маршрут';

  @override
  String get settingsAudioDecodeLabel => 'Декодування';

  @override
  String get settingsAudioPassthroughLabel => 'Пряма передача';

  @override
  String get settingsAudioHdRoute => 'Маршрут HD-аудіо';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Динамік';

  @override
  String get settingsAudioRouteHeadphones => 'Навушники';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count кан. PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Діагностика';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Рівень відео';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Діапазон відео';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Кодек субтитрів';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Дозволені аудіокодеки';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Аудіокодеки HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Аудіокодеки HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'пряма передача audio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Активний аудіомаршрут';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Підтримка HD-аудіо маршрутом';

  @override
  String get nightMode => 'Нічний режим';

  @override
  String get compressDynamicRange => 'Стиснути динамічний діапазон';

  @override
  String get advancedMpv => 'Розширений mpv';

  @override
  String get enableCustomMpvConf => 'Увімкнути Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Застосуйте вказаний користувачем mpv.conf перед початком відтворення';

  @override
  String get unsafeAdvancedMpvOptions => 'Небезпечні додаткові параметри mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Дозволити ширший набір параметрів mpv. Може порушити поведінку відтворення.';

  @override
  String get hardwareDecoding => 'Апаратне декодування';

  @override
  String get hardwareDecodingSubtitle =>
      'Може покращити продуктивність, але може викликати проблеми з відтворенням на деяких пристроях.';

  @override
  String get nextUpAndQueuing => 'Далі та в черзі';

  @override
  String get nextUpDisplay => 'Наступний дисплей';

  @override
  String get extended => 'Розширений';

  @override
  String get minimal => 'Мінімальний';

  @override
  String get nextUpTimeout => 'Час очікування наступного';

  @override
  String secondsValue(int value) {
    return '$value с';
  }

  @override
  String get mediaQueuing => 'Черга носіїв';

  @override
  String get autoQueueNextEpisodes =>
      'Автоматичне чергування наступних епізодів';

  @override
  String get stillWatchingPrompt => 'Все ще дивлюся підказку';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Після $episodes епізодів / $hours год';
  }

  @override
  String get resumeAndSkip => 'Відновити та пропустити';

  @override
  String get resumeRewind => 'Відновити перемотування';

  @override
  String get unpauseRewind => 'Відновити перемотування назад';

  @override
  String get fiveSeconds => '5 секунд';

  @override
  String get tenSeconds => '10 секунд';

  @override
  String get fifteenSeconds => '15 секунд';

  @override
  String get thirtySeconds => '30 секунд';

  @override
  String get skipBackLength => 'Пропустити довжину назад';

  @override
  String get skipForwardLength => 'Пропустити довжину вперед';

  @override
  String get customMpvConfPath => 'Користувацький шлях mpv.conf';

  @override
  String get notSetMpvConf =>
      'Не встановлено. Moonfin спробує стандартний mpv.conf у папках app/data.';

  @override
  String get selectMpvConf => 'Виберіть mpv.conf';

  @override
  String get pathToMpvConf => '/шлях/до/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Параметри стилю (розмір, колір, зсув) застосовуються до текстових субтитрів (SRT, VTT, TTML). Субтитри ASS/SSA використовують власний вбудований стиль, якщо не вимкнено «ASS/SSA Direct Play». Растрові субтитри (PGS, DVB, VobSub) не можна змінювати.';

  @override
  String get defaultSubtitleLanguage => 'Мова субтитрів за замовчуванням';

  @override
  String get defaultToNoSubtitles => 'За замовчуванням субтитрів немає';

  @override
  String get turnOffSubtitlesByDefault => 'Вимкніть субтитри за замовчуванням';

  @override
  String get subtitleSize => 'Розмір субтитрів';

  @override
  String get textFillColor => 'Колір заливки тексту';

  @override
  String get backgroundColor => 'Колір фону';

  @override
  String get textStrokeColor => 'Колір обведення тексту';

  @override
  String get subtitleCustomization => 'Налаштування субтитрів';

  @override
  String get subtitleCustomizationDescription => 'Налаштувати вигляд субтитрів';

  @override
  String get subtitleMode => 'Режим субтитрів';

  @override
  String get subtitleModeFlagged => 'Позначені';

  @override
  String get subtitleModeAlways => 'Завжди';

  @override
  String get subtitleModeForeign => 'Іншомовні';

  @override
  String get subtitleModeForced => 'Примусові';

  @override
  String get subtitleModeFlaggedDescription =>
      'Відтворює доріжки, позначені в метаданих медіафайлу як «default» або «forced».';

  @override
  String get subtitleModeAlwaysDescription =>
      'Автоматично завантажує й показує субтитри щоразу під час запуску відео.';

  @override
  String get subtitleModeForeignDescription =>
      'Автоматично вмикає субтитри, якщо типова аудіодоріжка іншою мовою.';

  @override
  String get subtitleModeForcedDescription =>
      'Завантажує лише субтитри з явною позначкою «forced» у метаданих.';

  @override
  String get subtitleModeNoneDescription =>
      'Повністю вимикає автоматичне завантаження субтитрів.';

  @override
  String get fallbackSubtitleLanguage => 'Резервна мова субтитрів';

  @override
  String get subtitleStream => 'Потік субтитрів';

  @override
  String get subtitlePreviewText =>
      'Швидка бура лисиця перестрибує ледачого пса';

  @override
  String get verticalOffset => 'Вертикальне зміщення';

  @override
  String get pgsDirectPlay => 'Пряме відтворення PGS';

  @override
  String get directPlayPgsSubtitles => 'Пряме відтворення субтитрів PGS';

  @override
  String get assSsaDirectPlay => 'Пряма гра ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles => 'Пряме відтворення субтитрів ASS/SSA';

  @override
  String get white => 'Білий';

  @override
  String get black => 'чорний';

  @override
  String get yellow => 'Жовтий';

  @override
  String get green => 'Зелений';

  @override
  String get cyan => 'Блакитний';

  @override
  String get red => 'Червоний';

  @override
  String get transparent => 'Прозорий';

  @override
  String get semiTransparentBlack => 'Напівпрозорий чорний';

  @override
  String get global => 'Глобальний';

  @override
  String get desktop => 'Робочий стіл';

  @override
  String get mobile => 'Мобільний';

  @override
  String get tv => 'телевізор';

  @override
  String loadedProfileSettings(String profile) {
    return 'Завантажено налаштування профілю $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Не вдалося завантажити налаштування профілю $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Локальні налаштування синхронізовано з профілем $profile.';
  }

  @override
  String get customizationProfile => 'Профіль налаштування';

  @override
  String get customizationProfileDescription =>
      'Виберіть профіль для завантаження, редагування та синхронізації. Глобальне застосовується скрізь, якщо профіль пристрою не замінює його. Зелена крапка позначає ваш поточний профіль пристрою.';

  @override
  String get loadProfile => 'Завантажити профіль';

  @override
  String get syncing => 'Синхронізація...';

  @override
  String get syncToProfile => 'Синхронізувати з профілем';

  @override
  String get profileSyncHidden => 'Синхронізація профілю прихована';

  @override
  String get enablePluginSyncDescription =>
      'Увімкніть синхронізацію плагіна сервера в налаштуваннях плагіна, щоб тут відобразити елементи керування профілем.';

  @override
  String get quality => 'якість';

  @override
  String get defaultDownloadQuality => 'Якість завантаження за умовчанням';

  @override
  String get network => 'Мережа';

  @override
  String get wifiOnlyDownloads => 'Завантаження лише через Wi-Fi';

  @override
  String get reportDownloadsActivity => 'Показувати завантаження на сервері';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Дозволити адміністратору сервера бачити ваші транскодовані завантаження на панелі керування';

  @override
  String get onlyDownloadOnWifi =>
      'Завантажуйте лише під час підключення до Wi-Fi';

  @override
  String get storage => 'Зберігання';

  @override
  String get storageUsed => 'Пам\'ять використано';

  @override
  String get manage => 'Керувати';

  @override
  String get calculating => 'Розрахунок...';

  @override
  String get downloadLocation => 'Місце завантаження';

  @override
  String get defaultLabel => 'За замовчуванням';

  @override
  String get saveToDownloadsFolder => 'Зберегти в папку \"Завантаження\".';

  @override
  String get downloadsVisibleToOtherApps =>
      'Завантаження/Moonfin — видимі для інших програм';

  @override
  String get dangerZone => 'НЕБЕЗПЕЧНА ЗОНА';

  @override
  String get clearAllDownloads => 'Очистити всі завантаження';

  @override
  String get original => 'Оригінал';

  @override
  String get changeDownloadLocation => 'Змінити місце завантаження';

  @override
  String get changeDownloadLocationDescription =>
      'Нові завантаження будуть збережені у вибраній папці. Існуючі завантаження залишатимуться в поточному місці, і ними можна керувати в налаштуваннях пам’яті.';

  @override
  String get confirm => 'Підтвердити';

  @override
  String get cannotWriteToFolder =>
      'Неможливо записати у вибрану папку. Виберіть інше розташування або надайте дозвіл на зберігання.';

  @override
  String get saveToDownloadsFolderQuestion => 'Зберегти в папку завантажень?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Завантажені мультимедійні файли будуть збережені в розділі Downloads/Moonfin на вашому пристрої. Ці файли будуть видимі для інших програм, наприклад для вашої галереї чи музичного плеєра.\n\nІснуючі завантаження залишаться в поточному місці.';

  @override
  String get enable => 'Увімкнути';

  @override
  String get clearAllDownloadsWarning =>
      'Це призведе до видалення всіх завантажених медіафайлів, і цю дію неможливо скасувати.';

  @override
  String get clearAll => 'Очистити все';

  @override
  String get navigationStyle => 'Стиль навігації';

  @override
  String get topBar => 'Верхня панель';

  @override
  String get leftSidebar => 'Ліва бічна панель';

  @override
  String get showShuffleButton => 'Показати кнопку перемішування';

  @override
  String get showGenresButton => 'Показати кнопку жанрів';

  @override
  String get showFavoritesButton => 'Показати кнопку «Вибране».';

  @override
  String get showLibrariesInToolbar =>
      'Показати бібліотеки на панелі інструментів';

  @override
  String get navbarAlwaysExpanded => 'Завжди показувати підписи в навігації';

  @override
  String get showSeerrButton => 'Показувати кнопку Seerr';

  @override
  String get navbarOpacity => 'Непрозорість навігаційної панелі';

  @override
  String get navbarColor => 'Колір панелі навігації';

  @override
  String get gray => 'Сірий';

  @override
  String get darkBlue => 'Темно-синій';

  @override
  String get purple => 'Фіолетовий';

  @override
  String get teal => 'Чирок';

  @override
  String get navy => 'флот';

  @override
  String get charcoal => 'Деревне вугілля';

  @override
  String get brown => 'Коричневий';

  @override
  String get darkRed => 'Темно-червоний';

  @override
  String get darkGreen => 'Темно-зелений';

  @override
  String get slate => 'Шифер';

  @override
  String get indigo => 'Індиго';

  @override
  String get libraryDisplay => 'Дисплей бібліотеки';

  @override
  String get posterLabel => 'Плакат';

  @override
  String get thumbnailLabel => 'Мініатюра';

  @override
  String get bannerLabel => 'банер';

  @override
  String get overridePerLibrarySettings =>
      'Перевизначити налаштування окремої бібліотеки';

  @override
  String get applyImageTypeToAllLibraries =>
      'Застосувати тип зображення до всіх бібліотек';

  @override
  String get multiServerLibraries => 'Багатосерверні бібліотеки';

  @override
  String get showLibrariesFromAllServers =>
      'Показати бібліотеки з усіх підключених серверів';

  @override
  String get enableFolderView => 'Увімкнути перегляд папок';

  @override
  String get showFolderBrowsingOption => 'Показати опцію перегляду папок';

  @override
  String get groupItemsIntoCollections => 'Групувати елементи в колекції';

  @override
  String get hideCollectionAssociatedItems =>
      'Приховувати елементи бібліотеки, що входять до колекцій, під час перегляду бібліотек';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Примітка щодо групування бібліотеки';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Щоб скористатися цим налаштуванням, переконайтеся, що параметри «Group movies into collections» та/або «Group shows into collections» увімкнено в налаштуваннях відображення вашої бібліотеки на сервері Jellyfin або Emby.';

  @override
  String get libraryVisibility => 'Видимість бібліотеки';

  @override
  String get libraryVisibilityDescription =>
      'Перемикання видимості домашньої сторінки для кожної бібліотеки. Перезапустіть Moonfin, щоб зміни набули чинності.';

  @override
  String get showInNavigation => 'Показати в навігації';

  @override
  String get showInLatestMedia => 'Показати в останніх ЗМІ';

  @override
  String get sourceLibraries => 'Бібліотеки вихідних кодів';

  @override
  String get sourceCollections => 'Колекції джерел';

  @override
  String get excludedGenres => 'Виключені жанри';

  @override
  String get externalMedia => 'External Media';

  @override
  String get selectAll => 'Виберіть усі';

  @override
  String itemsSelected(int count) {
    return 'Вибрано: $count';
  }

  @override
  String get mediaBar => 'Панель медіа';

  @override
  String get mediaSources => 'Джерела ЗМІ';

  @override
  String get behavior => 'Поведінка';

  @override
  String get seconds => 'секунд';

  @override
  String get localPreviews => 'Місцеві попередні перегляди';

  @override
  String get localPreviewsDescription =>
      'Налаштуйте попередній перегляд трейлерів, медіа та аудіо.';

  @override
  String get mediaBarMode => 'Стиль панелі медіа';

  @override
  String get mediaBarModeDescription =>
      'Виберіть Moonfin, MakD або вимкніть медіа-панель';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Вимкнено';

  @override
  String get enableMediaBar => 'Увімкнути мультимедійну панель';

  @override
  String get showFeaturedContentSlideshow =>
      'Показати слайд-шоу рекомендованого вмісту на головній сторінці';

  @override
  String get contentType => 'Тип вмісту';

  @override
  String get moviesAndTvShows => 'Фільми та телешоу';

  @override
  String get moviesOnly => 'Тільки фільми';

  @override
  String get tvShowsOnly => 'Тільки телешоу';

  @override
  String get itemCount => 'Кількість предметів';

  @override
  String get noneSelected => 'Не вибрано';

  @override
  String get noneExcluded => 'Нічого не виключено';

  @override
  String get autoAdvance => 'Автоматичний аванс';

  @override
  String get autoAdvanceSlides => 'Автоматичний перехід до наступного слайда';

  @override
  String get autoAdvanceInterval => 'Інтервал автоматичного просування';

  @override
  String get trailerPreview => 'Попередній перегляд трейлера';

  @override
  String get autoPlayTrailers =>
      'Автоматичне відтворення трейлерів на медіа-панелі через 3 секунди';

  @override
  String get trailerAudio => 'Звук трейлера';

  @override
  String get enableTrailerAudio => 'Увімкнути звук для трейлерів у медіапанелі';

  @override
  String get episodePreview => 'Попередній перегляд епізоду';

  @override
  String get mediaPreview => 'Попередній перегляд медіа';

  @override
  String get episodePreviewDescription =>
      'Відтворюйте 30-секундний вбудований попередній перегляд карток у фокусі, наведених курсором або натиснутих упродовж тривалого часу';

  @override
  String get mediaPreviewDescription =>
      'Відтворюйте 30-секундний вбудований попередній перегляд карток у фокусі, наведених курсором або натиснутих упродовж тривалого часу';

  @override
  String get previewAudio => 'Попередній перегляд аудіо';

  @override
  String get enablePreviewAudio =>
      'Увімкніть аудіо для попереднього перегляду трейлерів і епізодів';

  @override
  String get latestMedia => 'Останні ЗМІ';

  @override
  String get recentlyReleased => 'Нещодавно випущений';

  @override
  String get myMedia => 'Мої медіа';

  @override
  String get myMediaSmall => 'Мої медіа (малі)';

  @override
  String get continueWatching => 'Продовжити перегляд';

  @override
  String get resumeAudio => 'Відновити аудіо';

  @override
  String get resumeBooks => 'Резюме Книги';

  @override
  String get activeRecordings => 'Активні записи';

  @override
  String get playlists => 'Списки відтворення';

  @override
  String get liveTV => 'Пряме телебачення';

  @override
  String get homeSections => 'Домашні розділи';

  @override
  String get resetToDefaults => 'Відновити налаштування за замовчуванням';

  @override
  String get homeRowPosterSize => 'Розмір плаката домашнього ряду';

  @override
  String get perRowImageTypeSelection => 'Вибір типу зображення на рядок';

  @override
  String get configureImageTypeForEachRow =>
      'Налаштуйте тип зображення для кожного ввімкненого домашнього рядка';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Об’єднати «Продовжити перегляд» і «Далі».';

  @override
  String get combineBothRows => 'Об’єднайте обидва ряди в одну домашню секцію';

  @override
  String get fullScreenRows => 'Розгорнуті рядки головної';

  @override
  String get fullScreenRowsDescription =>
      'Обмежити головну до 1 рядка на екран';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Тип зображення на рядок';

  @override
  String get perRowSettings => 'Параметри для кожного рядка';

  @override
  String get autoLogin => 'Автоматичний вхід';

  @override
  String get lastUser => 'Останній користувач';

  @override
  String get currentUser => 'Поточний користувач';

  @override
  String get alwaysAuthenticate => 'Завжди автентифікувати';

  @override
  String get requirePasswordWithToken =>
      'Вимагати пароль навіть із збереженим маркером';

  @override
  String get confirmExit => 'Підтвердити вихід';

  @override
  String get showConfirmationBeforeExiting =>
      'Показати підтвердження перед виходом';

  @override
  String get blockContentWithRatings => 'Блокувати вміст із такими рейтингами:';

  @override
  String get noContentRatingsFound =>
      'Рейтинг вмісту на цьому сервері ще не знайдено.';

  @override
  String get couldNotLoadServerRatings =>
      'Не вдалося завантажити рейтинги сервера. Показано лише збережені оцінки.';

  @override
  String get couldNotRefreshRatings =>
      'Не вдалося оновити оцінки з сервера. Показ збережених оцінок.';

  @override
  String get enablePinCode => 'Увімкнути PIN-код';

  @override
  String get requirePinToAccess =>
      'Вимагати PIN-код для доступу до облікового запису';

  @override
  String get changePin => 'Змінити PIN-код';

  @override
  String get setNewPinCode => 'Встановіть новий PIN-код';

  @override
  String get removePin => 'Видалити PIN-код';

  @override
  String get removePinProtection => 'Зняти захист PIN-кодом';

  @override
  String get screensaver => 'Заставка';

  @override
  String get inAppScreensaver => 'Внутрішня заставка';

  @override
  String get enableBuiltInScreensaver => 'Увімкніть вбудовану заставку';

  @override
  String get mode => 'Режим';

  @override
  String get libraryArt => 'Бібліотечне мистецтво';

  @override
  String get logo => 'логотип';

  @override
  String get clock => 'Годинник';

  @override
  String get timeout => 'Час очікування';

  @override
  String minutesShort(int minutes) {
    return '$minutes хв';
  }

  @override
  String get dimmingLevel => 'Рівень затемнення';

  @override
  String get maxAgeRating => 'Максимальний віковий рейтинг';

  @override
  String get any => 'Будь-який';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Потрібен віковий рейтинг';

  @override
  String get onlyShowRatedContent => 'Показувати лише оцінений вміст';

  @override
  String get showClock => 'Показати годинник';

  @override
  String get displayClockDuringScreensaver =>
      'Відображення годинника під час заставки';

  @override
  String get clockModeStatic => 'Статичний';

  @override
  String get clockModeBouncing => 'Рухомий';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Критики)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Аудиторія)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Метакритика';

  @override
  String get metacriticUser => 'Metacritic (користувач)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Рейтинг спільноти';

  @override
  String get ratings => 'Рейтинги';

  @override
  String get additionalRatings => 'Додаткові рейтинги';

  @override
  String get showMdbListAndTmdbRatings => 'Показати рейтинги MDBList і TMDB';

  @override
  String get ratingLabels => 'Рейтингові мітки';

  @override
  String get showLabelsNextToIcons =>
      'Показувати мітки поруч із значками оцінок';

  @override
  String get ratingBadges => 'Рейтингові значки';

  @override
  String get showDecorativeBadges =>
      'Показувати декоративні значки за оцінками';

  @override
  String get episodeRatings => 'Рейтинги епізодів';

  @override
  String get showRatingsOnEpisodes => 'Показати оцінки окремих епізодів';

  @override
  String get ratingSources => 'Джерела рейтингу';

  @override
  String get ratingSourcesDescription =>
      'Увімкніть і змініть порядок джерел рейтингів, які відображаються в додатку';

  @override
  String get pluginLabel => 'Плагін Moonbase';

  @override
  String get pluginDetected => 'Плагін виявлено';

  @override
  String get pluginNotDetected => 'Плагін не виявлено';

  @override
  String get pluginDetectedDescription =>
      'Виявлено плагін сервера. Синхронізація вмикається автоматично, коли плагін знайдено вперше.';

  @override
  String get pluginNotDetectedDescription =>
      'Плагін сервера наразі не виявлено. Локальні налаштування все ще використовують свої збережені значення або вбудовані параметри за замовчуванням.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nВерсія: $version';
  }

  @override
  String get availableServices => 'Доступні послуги';

  @override
  String get serverPluginSync => 'Синхронізація плагіна сервера';

  @override
  String get syncSettingsWithPlugin =>
      'Синхронізація налаштувань із плагіном сервера';

  @override
  String get whatSyncControls => 'Які елементи керування синхронізацією';

  @override
  String get syncControlsDescription =>
      'Синхронізація лише контролює, чи надсилаються налаштування, що підтримуються плагінами, на сервер і завантажуються з нього. Вибір профілю та дії синхронізації профілю знаходяться в налаштуваннях налаштування, коли синхронізацію плагіна ввімкнено.';

  @override
  String get recentRequests => 'Останні запити';

  @override
  String get recentlyAdded => 'Нещодавно додані';

  @override
  String get trending => 'В тренді';

  @override
  String get popularMovies => 'Популярні фільми';

  @override
  String get movieGenres => 'Жанри кіно';

  @override
  String get upcomingMovies => 'Майбутні фільми';

  @override
  String get studios => 'Студії';

  @override
  String get popularSeries => 'Популярні серіали';

  @override
  String get seriesGenres => 'Жанри серіалу';

  @override
  String get upcomingSeries => 'Майбутня серія';

  @override
  String get networks => 'мережі';

  @override
  String get seerrDiscoveryRows => 'Рядки відкриттів Seerr';

  @override
  String get resetRowsToDefaults => 'Скинути рядки до значень за замовчуванням';

  @override
  String get enableSeerr => 'Увімкнути Seerr';

  @override
  String get showSeerrInNavigation =>
      'Показати Seerr у навігації (потрібен серверний плагін)';

  @override
  String get seerrUnavailable =>
      'Недоступно, оскільки підтримку плагіна сервера Seerr вимкнено.';

  @override
  String get nsfwFilter => 'Фільтр NSFW';

  @override
  String get hideAdultContent => 'Приховати вміст для дорослих у результатах';

  @override
  String get seerrNotificationsSection => 'Сповіщення';

  @override
  String get seerrNotifyNewRequestsTitle => 'Сповіщення про нові запити';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Повідомляти мене, коли хтось надсилає запит';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Оновлення запитів';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Схвалено, відхилено та додано до вашої бібліотеки';

  @override
  String get seerrNotifyIssuesTitle => 'Оновлення проблем';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Нові проблеми, відповіді та розв\'язання';

  @override
  String loggedInAs(String username) {
    return 'Вхід виконано як: $username';
  }

  @override
  String get discoverRows => 'Сторінка огляду Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Увімкніть рядки, які будуть показані на головній сторінці Seerr. Перетягніть, щоб змінити порядок. Власний порядок синхронізується з Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Увімкніть рядки, які будуть показані на головній сторінці Seerr. Перетягніть, щоб змінити порядок. Власний порядок синхронізується з Moonbase.';

  @override
  String get enabled => 'Увімкнено';

  @override
  String get hidden => 'Прихований';

  @override
  String get aboutTitle => 'про';

  @override
  String versionValue(String version) {
    return 'Версія $version';
  }

  @override
  String get openSourceLicenses => 'Ліцензії з відкритим кодом';

  @override
  String get sourceCode => 'Вихідний код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Перевірте наявність оновлень зараз';

  @override
  String get checksLatestDesktopRelease =>
      'Перевіряє останню версію настільного ПК для цієї платформи';

  @override
  String get youAreUpToDate => 'Ви в курсі подій.';

  @override
  String get couldNotCheckForUpdates =>
      'Зараз не вдалося перевірити наявність оновлень.';

  @override
  String get noCompatibleUpdate =>
      'Для цієї платформи не знайдено сумісного пакета оновлень.';

  @override
  String get updateChecksNotSupported =>
      'Перевірки оновлень не підтримуються на цій платформі.';

  @override
  String get updateNotificationsDisabled =>
      'Сповіщення про оновлення вимкнено.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Зачекайте перед повторною перевіркою.';

  @override
  String get latestUpdateAlreadyShown => 'Останнє оновлення вже показано.';

  @override
  String get updateAvailable => 'Доступне оновлення.';

  @override
  String updateAvailableVersion(String version) {
    return 'Доступне оновлення: v$version';
  }

  @override
  String get updateNotifications => 'Сповіщення про оновлення';

  @override
  String get showWhenUpdatesAvailable => 'Показувати, коли доступні оновлення';

  @override
  String updateAvailableTitle(String version) {
    return 'Доступна v$version';
  }

  @override
  String get readReleaseNotes => 'Прочитайте примітки до випуску';

  @override
  String get downloadingUpdate => 'Завантаження оновлення...';

  @override
  String get updateDownloadFailed =>
      'Не вдалося завантажити оновлення. Спробуйте ще раз.';

  @override
  String get openReleasesPage => 'Відкрийте сторінку випусків';

  @override
  String get navigation => 'Навігація';

  @override
  String get watchedIndicatorsBackdrops => 'Дивилися індикатори, задники';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Колір фокусування, контрольовані індикатори, фони';

  @override
  String get navbarStyleToolbarAppearance =>
      'Стиль навігаційної панелі, кнопки панелі інструментів, зовнішній вигляд';

  @override
  String get reorderToggleHomeRows =>
      'Зміна порядку та перемикання головних рядків';

  @override
  String get featuredContentAppearance =>
      'Рекомендований вміст, зовнішній вигляд';

  @override
  String get posterSizeImageTypeFolderView =>
      'Розмір плаката, тип зображення, вид папки';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB і джерела оцінок';

  @override
  String gbValue(String value) {
    return '$value ГБ';
  }

  @override
  String mbValue(int value) {
    return '$value МБ';
  }

  @override
  String get imageCacheLimit => 'Ліміт кешу зображень';

  @override
  String get clearImageCache => 'Очистити кеш зображень';

  @override
  String get imageCacheCleared => 'Кеш зображень очищено';

  @override
  String get clear => 'Очистити';

  @override
  String get browse => 'переглядати';

  @override
  String get noResults => 'Результатів немає';

  @override
  String get seerrAvailableStatus => 'в наявності';

  @override
  String get seerrRequestedStatus => 'Просив';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Завантаження · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Імпортування';

  @override
  String itemsCount(int count) {
    return '$count елементів';
  }

  @override
  String get seerrSettings => 'Налаштування Seerr';

  @override
  String get requestMore => 'Запит більше';

  @override
  String get request => 'запит';

  @override
  String get cancelRequest => 'Скасувати запит';

  @override
  String get playInMoonfin => 'Грайте в Moonfin';

  @override
  String requestedByName(String name) {
    return 'Запит від $name';
  }

  @override
  String get approve => 'Затвердити';

  @override
  String get declineAction => 'відхилити';

  @override
  String get similar => 'Схожі';

  @override
  String get recommendations => 'Рекомендації';

  @override
  String cancelRequestForTitle(String title) {
    return 'Скасувати запит на «$title»?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Скасувати $count запитів на «$title»?';
  }

  @override
  String get keep => 'Тримайте';

  @override
  String get itemNotFoundInLibrary =>
      'Предмет не знайдено у вашій бібліотеці Moonfin';

  @override
  String get errorSearchingLibrary => 'Помилка пошуку в бібліотеці';

  @override
  String budgetAmount(String amount) {
    return 'Бюджет: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Збори: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Запитати $type';
  }

  @override
  String get submitRequest => 'Надіслати запит';

  @override
  String get allSeasons => 'Всі сезони';

  @override
  String get advancedOptions => 'Додаткові параметри';

  @override
  String get noServiceServersConfigured =>
      'Немає налаштованих сервісних серверів';

  @override
  String get server => 'Сервер';

  @override
  String get qualityProfile => 'Профіль якості';

  @override
  String get rootFolder => 'Коренева папка';

  @override
  String get showMore => 'Показати більше';

  @override
  String get appearances => 'Фільмографія';

  @override
  String get crewSection => 'Екіпаж';

  @override
  String ageValue(int age) {
    return 'вік $age';
  }

  @override
  String get noRequests => 'Жодних запитів';

  @override
  String get pendingStatus => 'В очікуванні';

  @override
  String get declinedStatus => 'Відхилено';

  @override
  String get partiallyAvailable => 'Частково в наявності';

  @override
  String get downloadingStatus => 'Завантаження';

  @override
  String get approvedStatus => 'Затверджено';

  @override
  String get notRequestedStatus => 'Не запитувано';

  @override
  String get blocklistedStatus => 'Заблокований';

  @override
  String get deletedStatus => 'Видалено';

  @override
  String get failedStatus => 'Не вдалося';

  @override
  String get processingStatus => 'Обробляється';

  @override
  String modifiedByName(String name) {
    return 'Змінив $name';
  }

  @override
  String get completedStatus => 'Завершено';

  @override
  String get requestErrorDuplicate => 'Цю назву вже запитано';

  @override
  String get requestErrorQuota => 'Досягнуто ліміту запитів';

  @override
  String get requestErrorBlocklisted => 'Цю назву заблоковано';

  @override
  String get requestErrorNoSeasons => 'Не залишилось сезонів для запиту';

  @override
  String get requestErrorPermission =>
      'У вас немає дозволу надсилати цей запит';

  @override
  String get seerrRequestsTitle => 'Запити';

  @override
  String get seerrIssuesTitle => 'Проблеми';

  @override
  String get sortNewest => 'Найновіші';

  @override
  String get sortLastModified => 'Останні зміни';

  @override
  String get noIssues => 'Немає проблем';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Залишилось $remaining із $limit запитів на фільми';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Залишилось $remaining із $limit запитів на сезони';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Частина $name';
  }

  @override
  String get viewCollection => 'Переглянути колекцію';

  @override
  String get requestCollection => 'Запитати колекцію';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total фільмів · $available доступно';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Запитати $count фільмів';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Надсилання запиту $current з $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Запитано $count фільмів';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Запитано $ok із $total фільмів';
  }

  @override
  String get collectionAllRequested => 'Усі фільми вже доступні або запитані';

  @override
  String get reportIssue => 'Повідомити про проблему';

  @override
  String get issueTypeVideo => 'Відео';

  @override
  String get issueTypeAudio => 'Аудіо';

  @override
  String get whatsWrong => 'Що не так?';

  @override
  String get allEpisodes => 'Усі епізоди';

  @override
  String get episode => 'Епізод';

  @override
  String get openStatus => 'Відкрито';

  @override
  String get resolvedStatus => 'Розв\'язано';

  @override
  String get resolveAction => 'Розв\'язати';

  @override
  String get reopenAction => 'Відкрити знову';

  @override
  String reportedByName(String name) {
    return 'Повідомив $name';
  }

  @override
  String commentsCount(int count) {
    return '$count коментарів';
  }

  @override
  String get addComment => 'Додати коментар';

  @override
  String get deleteIssueConfirm => 'Видалити цю проблему?';

  @override
  String get submitReport => 'Надіслати звіт';

  @override
  String get tmdbScore => 'Оцінка TMDB';

  @override
  String get releaseDateLabel => 'Дата випуску';

  @override
  String get firstAirDateLabel => 'Дата першого ефіру';

  @override
  String get revenueLabel => 'Дохід';

  @override
  String get runtimeLabel => 'Час виконання';

  @override
  String get budgetLabel => 'Бюджет';

  @override
  String get originalLanguageLabel => 'Мова оригіналу';

  @override
  String get seasonsLabel => 'Сезони';

  @override
  String get episodesLabel => 'Епізоди';

  @override
  String get access => 'Доступ';

  @override
  String get add => 'Додати';

  @override
  String get address => 'Адреса';

  @override
  String get analytics => 'Аналітика';

  @override
  String get catalog => 'Каталог';

  @override
  String get content => 'Зміст';

  @override
  String get copy => 'Копія';

  @override
  String get create => 'Створити';

  @override
  String get disable => 'Вимкнути';

  @override
  String get done => 'Готово';

  @override
  String get edit => 'Редагувати';

  @override
  String get encoding => 'Кодування';

  @override
  String get error => 'Помилка';

  @override
  String get forward => 'Вперед';

  @override
  String get general => 'Загальні';

  @override
  String get go => 'Іди';

  @override
  String get install => 'встановити';

  @override
  String get installed => 'встановлено';

  @override
  String get interval => 'Інтервал';

  @override
  String get name => 'Ім\'я';

  @override
  String get networking => 'Мережа';

  @override
  String get next => 'Далі';

  @override
  String get path => 'шлях';

  @override
  String get paused => 'Призупинено';

  @override
  String get permissions => 'Дозволи';

  @override
  String get processing => 'Обробка';

  @override
  String get profile => 'Профіль';

  @override
  String get provider => 'Провайдер';

  @override
  String get refresh => 'Оновити';

  @override
  String get remote => 'Пульт';

  @override
  String get rename => 'Перейменувати';

  @override
  String get revoke => 'Відкликати';

  @override
  String get role => 'Роль';

  @override
  String get root => 'Корінь';

  @override
  String get run => 'бігти';

  @override
  String get search => 'Пошук';

  @override
  String get select => 'Виберіть';

  @override
  String get send => 'Надіслати';

  @override
  String get sessions => 'Сесії';

  @override
  String get set => 'встановити';

  @override
  String get status => 'Статус';

  @override
  String get stop => 'Зупинити';

  @override
  String get streaming => 'Потокове передавання';

  @override
  String get time => 'час';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Видалити';

  @override
  String get up => 'вгору';

  @override
  String get update => 'оновлення';

  @override
  String get upload => 'Завантажити';

  @override
  String get unmute => 'Увімкнути звук';

  @override
  String get mute => 'Вимкнути звук';

  @override
  String get branding => 'брендинг';

  @override
  String get adminDrawerDashboard => 'Приладова панель';

  @override
  String get adminDrawerAnalytics => 'Аналітика';

  @override
  String get adminDrawerSettings => 'Налаштування';

  @override
  String get adminDrawerBranding => 'брендинг';

  @override
  String get adminDrawerUsers => 'Користувачі';

  @override
  String get adminDrawerLibraries => 'Медіатеки';

  @override
  String get adminDrawerDisplay => 'Відображення';

  @override
  String get adminDrawerMetadata => 'Метадані';

  @override
  String get adminDrawerNfo => 'Налаштування NFO';

  @override
  String get adminDrawerTranscoding => 'Перекодування';

  @override
  String get adminDrawerResume => 'Відновлення';

  @override
  String get adminDrawerStreaming => 'Потокове передавання';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Пристрої';

  @override
  String get adminDrawerActivity => 'діяльність';

  @override
  String get adminDrawerNetworking => 'Мережа';

  @override
  String get adminDrawerApiKeys => 'Ключі API';

  @override
  String get adminDrawerBackups => 'Резервні копії';

  @override
  String get adminDrawerLogs => 'Журнали';

  @override
  String get adminDrawerScheduledTasks => 'Заплановані завдання';

  @override
  String get adminDrawerPlugins => 'Плагіни';

  @override
  String get adminDrawerRepositories => 'Репозиторії';

  @override
  String get adminDrawerLiveTv => 'Пряме телебачення';

  @override
  String get adminExitTooltip => 'Вийти з адміністратора';

  @override
  String get adminDashboardLoadFailed =>
      'Не вдалося завантажити інформаційну панель';

  @override
  String get adminMediaOverview => 'Огляд ЗМІ';

  @override
  String get adminMediaTotalsError =>
      'Не вдалося завантажити загальні дані сервера.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Короткий огляд того, скільки вмісту розміщено на цьому сервері.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Доступні оновлення плагінів: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Плагіни, що потребують перезапуску: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Невдалі заплановані завдання: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Нещодавні попередження/помилки: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Розповсюдження ЗМІ';

  @override
  String get analyticsVideoCodecs => 'Відеокодеки';

  @override
  String get analyticsAudioCodecs => 'Аудіокодеки';

  @override
  String get analyticsContainers => 'Контейнери';

  @override
  String get analyticsTopGenres => 'Найкращі жанри';

  @override
  String get analyticsReleaseYears => 'Роки випуску';

  @override
  String get analyticsContentRatings => 'Рейтинги вмісту';

  @override
  String get analyticsRuntimeBuckets => 'Відра часу виконання';

  @override
  String get analyticsFileFormats => 'Формати файлів';

  @override
  String get analyticsNoData => 'Немає даних.';

  @override
  String get adminServerInfo => 'Інформація про сервер';

  @override
  String get adminRestartPending => 'Очікується перезапуск';

  @override
  String get adminServerPaths => 'Шляхи до сервера';

  @override
  String get adminServerActions => 'Дії сервера';

  @override
  String get adminRestartServer => 'Перезапустіть сервер';

  @override
  String get adminShutdownServer => 'Вимкнути сервер';

  @override
  String get adminScanLibraries => 'Бібліотеки сканування';

  @override
  String get adminLibraryScanStarted => 'Розпочато сканування бібліотеки';

  @override
  String errorGeneric(String error) {
    return 'Помилка: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Триває перезавантаження сервера';

  @override
  String get adminServerRebootMessage =>
      'Триває перезавантаження сервера, перезапустіть Moonfin';

  @override
  String get adminActiveSessions => 'Активні сесії';

  @override
  String get adminSessionsLoadFailed => 'Не вдалося завантажити сеанси';

  @override
  String get adminNoActiveSessions => 'Немає активних сеансів';

  @override
  String get adminRecentActivity => 'Останні дії';

  @override
  String get adminNoRecentActivity => 'Немає останніх дій';

  @override
  String adminCommandFailed(String error) {
    return 'Не вдалося виконати команду: $error';
  }

  @override
  String get adminSendMessage => 'Надіслати повідомлення';

  @override
  String get adminMessageTextHint => 'Текст повідомлення';

  @override
  String get adminSetVolume => 'Встановити гучність';

  @override
  String get sessionPrev => 'попередня';

  @override
  String get sessionRewind => 'Перемотати назад';

  @override
  String get sessionForward => 'Вперед';

  @override
  String get sessionNext => 'Далі';

  @override
  String get sessionVolumeDown => 'том –';

  @override
  String get sessionVolumeUp => 'Гучність +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Зараз грає';

  @override
  String get volume => 'Гучність';

  @override
  String get actions => 'Дії';

  @override
  String get videoCodec => 'Відеокодек';

  @override
  String get audioCodec => 'Аудіокодек';

  @override
  String get hwAccel => 'Апаратне прискорення';

  @override
  String get completion => 'Завершення';

  @override
  String get direct => 'Прямий';

  @override
  String get adminDisconnect => 'Відключити';

  @override
  String get adminClearDates => 'Чіткі дати';

  @override
  String get adminActivitySeverityAll => 'Усі рівні';

  @override
  String get adminActivityDateRange => 'Діапазон дат';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Не вдалося завантажити журнал активності: $error';
  }

  @override
  String get adminNoActivityEntries => 'Немає записів про діяльність';

  @override
  String get adminEditDeviceName => 'Змінити назву пристрою';

  @override
  String get adminCustomName => 'Спеціальна назва';

  @override
  String get adminDeviceNameUpdated => 'Назву пристрою оновлено';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Не вдалося оновити пристрій: $error';
  }

  @override
  String get adminDeleteDevice => 'Видалити пристрій';

  @override
  String get adminDeviceDeleted => 'Пристрій видалено';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Не вдалося видалити пристрій: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Видалити пристрій «$name»? Користувачеві доведеться знову увійти на цьому пристрої.';
  }

  @override
  String get adminDeleteAllDevices => 'Видалити всі пристрої';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Видалити $count пристроїв? Відповідним користувачам доведеться увійти знову. Вашого поточного пристрою це не стосується.';
  }

  @override
  String get adminDevicesDeletedAll => 'Пристрої видалено';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Деякі пристрої видалено; $count видалити не вдалося.';
  }

  @override
  String get adminDevicesLoadFailed => 'Не вдалося завантажити пристрої';

  @override
  String get adminSearchDevices => 'Пошук пристроїв';

  @override
  String get adminThisDevice => 'Цей пристрій';

  @override
  String get adminEditName => 'Редагувати назву';

  @override
  String get adminLibrariesLoadFailed => 'Не вдалося завантажити бібліотеки';

  @override
  String get adminNoLibraries => 'Бібліотеки не налаштовано';

  @override
  String get adminScanAllLibraries => 'Сканувати всі бібліотеки';

  @override
  String get adminAddLibrary => 'Додати бібліотеку';

  @override
  String adminScanFailed(String error) {
    return 'Не вдалося почати сканування: $error';
  }

  @override
  String get adminRenameLibrary => 'Перейменувати бібліотеку';

  @override
  String get adminNewName => 'Нова назва';

  @override
  String adminLibraryRenamed(String name) {
    return 'Бібліотеку перейменовано на «$name»';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Не вдалося перейменувати: $error';
  }

  @override
  String get adminDeleteLibrary => 'Видалити бібліотеку';

  @override
  String adminLibraryDeleted(String name) {
    return 'Бібліотеку «$name» видалено';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Не вдалося видалити бібліотеку: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Не вдалося додати шлях: $error';
  }

  @override
  String get adminRemovePath => 'Видалити шлях';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Видалити «$path» з цієї бібліотеки?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Не вдалося видалити шлях: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Параметри бібліотеки збережено';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Не вдалося зберегти параметри: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Не вдалося завантажити бібліотеку';

  @override
  String get adminNoMediaPaths => 'Шляхи носіїв не налаштовано';

  @override
  String get adminAddPath => 'Додати шлях';

  @override
  String get adminBrowseFilesystem => 'Огляд файлової системи сервера:';

  @override
  String get adminSaveOptions => 'Параметри збереження';

  @override
  String get adminPreferredMetadataLanguage => 'Бажана мова метаданих';

  @override
  String get adminMetadataLanguageHint => 'напр. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Код країни метаданих';

  @override
  String get adminMetadataCountryHint => 'напр. США, Німеччина, Франція';

  @override
  String get adminLibraryTabPaths => 'Шляхи';

  @override
  String get adminLibraryTabOptions => 'Параметри';

  @override
  String get adminLibraryTabDownloaders => 'Завантажувачі';

  @override
  String get adminLibMetadataSavers => 'Збереження метаданих';

  @override
  String get adminLibSubtitleDownloaders => 'Завантажувачі субтитрів';

  @override
  String get adminLibLyricDownloaders => 'Завантажувачі текстів пісень';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Завантажувачі метаданих: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Джерела зображень: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Цей сервер не надає завантажувачів для цього типу бібліотеки.';

  @override
  String get adminLibrarySectionGeneral => 'Загальні';

  @override
  String get adminLibrarySectionMetadata => 'Метадані';

  @override
  String get adminLibrarySectionEmbedded => 'Вбудована інформація';

  @override
  String get adminLibrarySectionSubtitles => 'Субтитри';

  @override
  String get adminLibrarySectionImages => 'Зображення';

  @override
  String get adminLibrarySectionSeries => 'Серіали';

  @override
  String get adminLibrarySectionMusic => 'Музика';

  @override
  String get adminLibrarySectionMovies => 'Фільми';

  @override
  String get adminLibRealtimeMonitor => 'Увімкнути моніторинг у реальному часі';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Виявляти зміни файлів і обробляти їх автоматично.';

  @override
  String get adminLibArchiveMediaFiles => 'Вважати архіви медіафайлами';

  @override
  String get adminLibEnablePhotos => 'Показувати фотографії';

  @override
  String get adminLibSaveLocalMetadata => 'Зберігати обкладинки в теках медіа';

  @override
  String get adminLibRefreshInterval => 'Автоматичне оновлення метаданих';

  @override
  String get adminLibRefreshNever => 'Ніколи';

  @override
  String get adminLibDefault => 'Типово';

  @override
  String get adminLibDisplayTitle => 'Відображення';

  @override
  String get adminLibDisplaySection => 'Відображення бібліотеки';

  @override
  String get adminLibFolderView =>
      'Показувати вигляд тек для звичайних медіатек';

  @override
  String get adminLibSpecialsInSeasons =>
      'Показувати спецвипуски в сезонах, у яких вони виходили';

  @override
  String get adminLibGroupMovies => 'Групувати фільми в колекції';

  @override
  String get adminLibGroupShows => 'Групувати серіали в колекції';

  @override
  String get adminLibExternalSuggestions =>
      'Показувати зовнішній вміст у пропозиціях';

  @override
  String get adminLibDateAddedSection => 'Поведінка дати додавання';

  @override
  String get adminLibDateAddedLabel => 'Використовувати дату додавання з';

  @override
  String get adminLibDateAddedImport => 'Дата сканування до бібліотеки';

  @override
  String get adminLibDateAddedFile => 'Дата створення файлу';

  @override
  String get adminLibMetadataTitle => 'Метадані та зображення';

  @override
  String get adminLibMetadataLangSection => 'Бажана мова метаданих';

  @override
  String get adminLibChaptersSection => 'Розділи';

  @override
  String get adminLibDummyChapterDuration =>
      'Тривалість фіктивних розділів (секунди)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Довжина розділів, що генеруються для медіа без них. Установіть 0, щоб вимкнути.';

  @override
  String get adminLibChapterImageResolution =>
      'Роздільна здатність зображень розділів';

  @override
  String get adminLibNfoTitle => 'Налаштування NFO';

  @override
  String get adminLibNfoHelp =>
      'Метадані NFO сумісні з Kodi та подібними клієнтами. Налаштування застосовуються до всіх бібліотек, які зберігають метадані NFO.';

  @override
  String get adminLibKodiUser =>
      'Користувач, для якого зберігати дані перегляду у файлах NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Зберігати шляхи до зображень у файлах NFO';

  @override
  String get adminLibPathSubstitution =>
      'Увімкнути заміну шляхів для шляхів зображень NFO';

  @override
  String get adminLibExtraThumbs =>
      'Копіювати зображення extrafanart до теки extrathumbs';

  @override
  String get adminLibNone => 'Немає';

  @override
  String adminLibRefreshDays(int days) {
    return '$days днів';
  }

  @override
  String get adminLibEmbeddedTitles => 'Використовувати вбудовані назви';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Використовувати вбудовані назви для додаткових матеріалів';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Використовувати вбудовану інформацію про епізоди';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Дозволити вбудовані субтитри';

  @override
  String get adminLibEmbeddedAllowAll => 'Дозволити всі';

  @override
  String get adminLibEmbeddedAllowText => 'Лише текстові';

  @override
  String get adminLibEmbeddedAllowImage => 'Лише графічні';

  @override
  String get adminLibEmbeddedAllowNone => 'Немає';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Пропускати завантаження, якщо є вбудовані субтитри';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Пропускати завантаження, якщо аудіодоріжка збігається з мовою завантаження';

  @override
  String get adminLibRequirePerfectMatch => 'Вимагати точний збіг субтитрів';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Зберігати субтитри в теках медіа';

  @override
  String get adminLibChapterImageExtraction => 'Витягувати зображення розділів';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Витягувати зображення розділів під час сканування бібліотеки';

  @override
  String get adminLibTrickplayExtraction =>
      'Увімкнути витягування зображень trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Витягувати зображення trickplay під час сканування бібліотеки';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Зберігати зображення trickplay у теках медіа';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Автоматично об\'єднувати серіали, розподілені між кількома теками';

  @override
  String get adminLibSeasonZeroName => 'Назва нульового сезону';

  @override
  String get adminLibLufsScan =>
      'Увімкнути сканування LUFS для нормалізації гучності';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Віддавати перевагу нестандартному тегу виконавців';

  @override
  String get adminLibAutoAddToCollection =>
      'Автоматично додавати фільми до колекцій';

  @override
  String get adminLibraryNameRequired => 'Потрібно вказати назву бібліотеки';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Не вдалося створити бібліотеку: $error';
  }

  @override
  String get adminLibraryName => 'Назва бібліотеки';

  @override
  String get adminSelectedPaths => 'Вибрані шляхи:';

  @override
  String get adminNoPathsAdded => 'Шляхи не додано (можна додати пізніше)';

  @override
  String get adminCreateLibrary => 'Створити бібліотеку';

  @override
  String get paths => 'Шляхи:';

  @override
  String get adminDisableUser => 'Вимкнути користувача';

  @override
  String get adminEnableUser => 'Увімкнути користувача';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Вимкнути $name? Користувач не зможе увійти.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Увімкнути $name? Користувач знову зможе увійти.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Користувача «$name» вимкнено';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Користувача «$name» увімкнено';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Не вдалося оновити політику користувача: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Не вдалося завантажити користувачів';

  @override
  String get adminSearchUsers => 'Пошук користувачів';

  @override
  String get adminEditUser => 'Редагувати користувача';

  @override
  String get adminAddUser => 'Додати користувача';

  @override
  String adminUserCreateFailed(String error) {
    return 'Не вдалося створити користувача: $error';
  }

  @override
  String get adminCreateUser => 'Створити користувача';

  @override
  String get adminPasswordOptional => 'Пароль (необов\'язково)';

  @override
  String get adminUsernameRequired => 'Ім\'я користувача не може бути пустим';

  @override
  String get adminNoProfileChanges => 'Немає змін профілю для збереження';

  @override
  String get adminProfileSaved => 'Профіль збережено';

  @override
  String adminSaveFailed(String error) {
    return 'Не вдалося зберегти: $error';
  }

  @override
  String get adminPermissionsSaved => 'Дозволи збережено';

  @override
  String get adminPasswordsMismatch => 'Паролі не збігаються';

  @override
  String adminFailed(String error) {
    return 'Помилка: $error';
  }

  @override
  String get adminUserLoadFailed => 'Не вдалося завантажити користувача';

  @override
  String get adminBackToUsers => 'Назад до користувачів';

  @override
  String get adminSaveProfile => 'Зберегти профіль';

  @override
  String get adminDeleteUser => 'Видалити користувача';

  @override
  String get admin => 'адмін';

  @override
  String get adminFullAccessWarning =>
      'Адміністратори мають повний доступ до сервера. Даруйте з обережністю.';

  @override
  String get administrator => 'Адміністратор';

  @override
  String get adminHiddenUser => 'Прихований користувач';

  @override
  String get adminAllowMediaPlayback => 'Дозволити відтворення медіа';

  @override
  String get adminAllowAudioTranscoding => 'Дозволити перекодування аудіо';

  @override
  String get adminAllowVideoTranscoding => 'Дозволити перекодування відео';

  @override
  String get adminAllowRemuxing => 'Дозволити повторне мультиплексування';

  @override
  String get adminForceRemoteTranscoding =>
      'Примусове перекодування віддаленого джерела';

  @override
  String get adminAllowContentDeletion => 'Дозволити видалення вмісту';

  @override
  String get adminAllowContentDownloading => 'Дозволити завантаження вмісту';

  @override
  String get adminAllowPublicSharing => 'Дозволити публічний доступ';

  @override
  String get adminAllowRemoteControl =>
      'Дозволити дистанційне керування іншими користувачами';

  @override
  String get adminAllowSharedDeviceControl =>
      'Дозволити спільне керування пристроєм';

  @override
  String get adminAllowRemoteAccess => 'Дозволити віддалений доступ';

  @override
  String get adminRemoteBitrateLimit =>
      'Ліміт бітрейту віддаленого клієнта (біт/с)';

  @override
  String get adminLeaveEmptyNoLimit => 'Залиште порожнім, щоб не було обмежень';

  @override
  String get adminMaxActiveSessions => 'Максимальна кількість активних сесій';

  @override
  String get adminAllowLiveTvAccess =>
      'Дозволити доступ до прямого телебачення';

  @override
  String get adminAllowLiveTvManagement =>
      'Дозволити керування ТБ у прямому ефірі';

  @override
  String get adminAllowCollectionManagement => 'Дозволити керування колекцією';

  @override
  String get adminAllowSubtitleManagement => 'Дозволити керування субтитрами';

  @override
  String get adminAllowLyricManagement => 'Дозволити керування текстами';

  @override
  String get adminSavePermissions => 'Зберегти дозволи';

  @override
  String get adminEnableAllLibraryAccess =>
      'Увімкнути доступ до всіх бібліотек';

  @override
  String get adminSaveAccess => 'Зберегти доступ';

  @override
  String get adminChangePassword => 'Змінити пароль';

  @override
  String get adminNewPassword => 'Новий пароль';

  @override
  String get adminConfirmPassword => 'Підтвердьте пароль';

  @override
  String get adminSetPassword => 'Встановити пароль';

  @override
  String get adminResetPassword => 'Скинути пароль';

  @override
  String get adminPasswordReset => 'Скидання пароля';

  @override
  String get adminPasswordUpdated => 'Пароль оновлено';

  @override
  String get adminUserSettings => 'Налаштування користувача';

  @override
  String get adminLibraryAccess => 'Доступ до бібліотеки';

  @override
  String get adminDeviceAndChannelAccess => 'Доступ до пристрою та каналу';

  @override
  String get adminEnableAllDevices => 'Увімкніть доступ до всіх пристроїв';

  @override
  String get adminEnableAllChannels => 'Увімкнути доступ до всіх каналів';

  @override
  String get adminParentalControl => 'Батьківський контроль';

  @override
  String get adminMaxParentalRating =>
      'Максимальний дозволений віковий рейтинг';

  @override
  String get adminMaxParentalRatingHint =>
      'Вміст із вищим рейтингом буде приховано від цього користувача.';

  @override
  String get adminParentalRatingNone => 'Немає';

  @override
  String get adminBlockUnratedItems =>
      'Блокувати елементи без рейтингу або з нерозпізнаним рейтингом';

  @override
  String get adminUnratedBook => 'Книги';

  @override
  String get adminUnratedChannelContent => 'Канали';

  @override
  String get adminUnratedLiveTvChannel => 'Пряме телебачення';

  @override
  String get adminUnratedMovie => 'Фільми';

  @override
  String get adminUnratedMusic => 'Музика';

  @override
  String get adminUnratedTrailer => 'Трейлери';

  @override
  String get adminUnratedSeries => 'Серіали';

  @override
  String get adminAccessSchedules => 'Розклади доступу';

  @override
  String get adminAccessSchedulesHint =>
      'Дозволяти доступ лише в зазначені нижче години. Якщо розклад не задано, доступ дозволено цілодобово.';

  @override
  String get adminAddSchedule => 'Додати розклад';

  @override
  String get adminScheduleDay => 'День';

  @override
  String get adminScheduleStart => 'Початок';

  @override
  String get adminScheduleEnd => 'Кінець';

  @override
  String get adminDayEveryday => 'Щодня';

  @override
  String get adminDayWeekday => 'Будній день';

  @override
  String get adminDayWeekend => 'Вихідні';

  @override
  String get adminDaySunday => 'Неділя';

  @override
  String get adminDayMonday => 'Понеділок';

  @override
  String get adminDayTuesday => 'Вівторок';

  @override
  String get adminDayWednesday => 'Середа';

  @override
  String get adminDayThursday => 'Четвер';

  @override
  String get adminDayFriday => 'П\'ятниця';

  @override
  String get adminDaySaturday => 'Субота';

  @override
  String get adminAllowedTags => 'Дозволені теги';

  @override
  String get adminAllowedTagsHint =>
      'Показується лише вміст із цими тегами. Залиште порожнім, щоб дозволити все.';

  @override
  String get adminBlockedTags => 'Заблоковані теги';

  @override
  String get adminBlockedTagsHint =>
      'Вміст із цими тегами приховано від цього користувача.';

  @override
  String get adminAddTag => 'Додати тег';

  @override
  String get adminEnabledDevices => 'Увімкнені пристрої';

  @override
  String get adminEnabledChannels => 'Увімкнені канали';

  @override
  String get adminAuthProvider => 'Постачальник автентифікації';

  @override
  String get adminPasswordResetProvider => 'Постачальник скидання пароля';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Максимум невдалих спроб входу до блокування';

  @override
  String get adminLoginAttemptsHint =>
      'Установіть 0 для типового значення або -1, щоб вимкнути блокування.';

  @override
  String get adminSyncPlayAccess => 'Доступ до SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Дозволити створювати групи та приєднуватися до них';

  @override
  String get adminSyncPlayJoin => 'Дозволити приєднуватися до груп';

  @override
  String get adminSyncPlayNone => 'Без доступу';

  @override
  String get adminContentDeletionFolders => 'Дозволити видалення вмісту з';

  @override
  String get adminResetPasswordWarning =>
      'Це видалить пароль. Користувач зможе увійти без пароля.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Сервер повернув HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Ви впевнені, що хочете видалити $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Користувача «$name» видалено';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Не вдалося видалити користувача: $error';
  }

  @override
  String get adminCreateApiKey => 'Створити ключ API';

  @override
  String get adminAppName => 'Назва програми';

  @override
  String get adminApiKeyCreated => 'Ключ API створено';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Ключ успішно створено. Сервер не повернув маркер. Перевірте ключі API сервера.';

  @override
  String get adminKeyCopied => 'Ключ скопійовано в буфер обміну';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Не вдалося створити ключ: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'У відповіді сервера відсутній маркер ключа';

  @override
  String get adminRevokeApiKey => 'Відкликати ключ API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Відкликати ключ для $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Ключ API відкликано';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Не вдалося відкликати ключ: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Не вдалося завантажити ключі API';

  @override
  String get adminApiKeysTitle => 'Ключі API';

  @override
  String get adminCreateKey => 'Створити ключ';

  @override
  String get adminNoApiKeys => 'Ключі API не знайдено';

  @override
  String get adminUnknownApp => 'Невідомий додаток';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Токен: $token\\nСтворено: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Створити резервну копію';

  @override
  String get adminBackupInclude => 'Виберіть, що включити до резервної копії.';

  @override
  String get adminBackupDatabase => 'База даних';

  @override
  String get adminBackupDatabaseAlways => 'Завжди включено';

  @override
  String get adminBackupMetadata => 'Метадані';

  @override
  String get adminBackupSubtitles => 'Субтитри';

  @override
  String get adminBackupTrickplay => 'Зображення trickplay';

  @override
  String get adminCreatingBackup => 'Створення резервної копії...';

  @override
  String get adminBackupCreated => 'Резервну копію створено успішно';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Не вдалося створити резервну копію: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Резервний шлях відсутній у відповіді сервера';

  @override
  String adminBackupManifest(String name) {
    return 'Маніфест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Не вдалося завантажити маніфест: $error';
  }

  @override
  String get adminConfirmRestore => 'Підтвердити відновлення';

  @override
  String get adminRestoringBackup => 'Відновлення резервної копії...';

  @override
  String adminRestoreFailed(String error) {
    return 'Не вдалося відновити з резервної копії: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Не вдалося завантажити резервні копії';

  @override
  String get adminCreateBackup => 'Створити резервну копію';

  @override
  String get adminNoBackups => 'Резервні копії не знайдено';

  @override
  String get adminViewDetails => 'Переглянути деталі';

  @override
  String get restore => 'Відновити';

  @override
  String get adminLogsLoadFailed => 'Не вдалося завантажити журнали сервера';

  @override
  String get adminNoLogFiles => 'Файли журналів не знайдено';

  @override
  String get adminLogCopied => 'Журнал скопійовано в буфер обміну';

  @override
  String get adminSaveLogFile => 'Зберегти файл журналу';

  @override
  String adminSavedTo(String path) {
    return 'Збережено до $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Не вдалося зберегти файл: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Не вдалося завантажити $fileName';
  }

  @override
  String get adminSearchInLog => 'Пошук в журналі';

  @override
  String get adminNoMatchingLines => 'Немає відповідних рядків';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Не вдалося завантажити завдання: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Запланованих завдань не знайдено';

  @override
  String get adminNoTasksMatchFilter =>
      'Жодне завдання не відповідає поточному фільтру';

  @override
  String adminTaskStartFailed(String error) {
    return 'Не вдалося запустити завдання: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Не вдалося зупинити завдання: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Не вдалося завантажити завдання: $error';
  }

  @override
  String get adminRunNow => 'Біжи зараз';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Не вдалося видалити тригер: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Не вдалося додати тригер: $error';
  }

  @override
  String get adminLastExecution => 'Остання страта';

  @override
  String get adminTriggers => 'Тригери';

  @override
  String get adminAddTrigger => 'Додати тригер';

  @override
  String get adminNoTriggers => 'Тригери не налаштовано';

  @override
  String get adminTriggerType => 'Тип тригера';

  @override
  String get adminTimeLimit => 'Обмеження часу (необов\'язково)';

  @override
  String get adminNoLimit => 'Без обмежень';

  @override
  String adminHours(String hours) {
    return '$hours год';
  }

  @override
  String get adminDayOfWeek => 'День тижня';

  @override
  String get adminSearchPlugins => 'Пошук плагінів...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Не вдалося перемкнути плагін: $error';
  }

  @override
  String get adminUninstallPlugin => 'Видалити плагін';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Ви впевнені, що хочете видалити «$name»?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Не вдалося видалити плагін: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Не вдалося встановити пакет: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Не вдалося встановити оновлення: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Не вдалося завантажити плагіни: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Жоден плагін не відповідає вашому пошуку';

  @override
  String get adminNoPluginsInstalled => 'Плагіни не встановлено';

  @override
  String adminInstallUpdate(String version) {
    return 'Встановити оновлення (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Не вдалося завантажити каталог: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Немає пакетів, що відповідають вашому запиту';

  @override
  String get adminNoPackagesAvailable => 'Немає доступних пакетів';

  @override
  String get adminExperimentalIntegration => 'Експериментальна інтеграція';

  @override
  String get adminExperimentalWarning =>
      'Інтеграція налаштувань плагіна все ще експериментальна. Деякі сторінки налаштувань можуть не відображатися належним чином.';

  @override
  String get continueAction => 'Продовжити';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '«$name» буде видалено після перезапуску сервера';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Не вдалося видалити: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Оновлення «$name» до v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Не вдалося відкрити налаштування: відсутній маркер авторизації.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Не вдалося завантажити плагін: $error';
  }

  @override
  String get adminPluginNotFound => 'Плагін не знайдено';

  @override
  String adminPluginVersion(String version) {
    return 'Версія $version';
  }

  @override
  String get adminEnablePlugin => 'Увімкнути плагін';

  @override
  String get adminPluginSettingsPage => 'Сторінка налаштувань плагіна';

  @override
  String get adminRevisionHistory => 'Історія версій';

  @override
  String get adminNoChangelog => 'Немає журналу змін.';

  @override
  String get adminRemoveRepository => 'Видалити репозиторій';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Ви впевнені, що хочете видалити «$name»?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Не вдалося зберегти репозиторії: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Не вдалося завантажити репозиторії: $error';
  }

  @override
  String get adminRepositoryNameHint => 'напр. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL-адреса сховища';

  @override
  String get adminAddEntry => 'Додати запис';

  @override
  String get adminInvalidUrl => 'Недійсний URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Не вдалося завантажити налаштування плагіна: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Не вдалося відкрити $uri';
  }

  @override
  String get adminOpenInBrowser => 'Відкрити в браузері';

  @override
  String get adminOpenExternally => 'Відкритий зовні';

  @override
  String get adminGeneralSettings => 'Загальні налаштування';

  @override
  String get adminServerName => 'Ім\'я сервера';

  @override
  String get adminPreferredMetadataCountry => 'Бажана країна метаданих';

  @override
  String get adminCachePath => 'Шлях до кешу';

  @override
  String get adminMetadataPath => 'Шлях метаданих';

  @override
  String get adminLibraryScanConcurrency =>
      'Паралельність сканування бібліотеки';

  @override
  String get adminParallelImageEncodingLimit =>
      'Ліміт паралельного кодування зображень';

  @override
  String get adminSlowResponseThreshold => 'Поріг повільної реакції (мс)';

  @override
  String get adminBrandingSaved => 'Налаштування брендингу збережено';

  @override
  String get adminBrandingLoadFailed =>
      'Не вдалося завантажити налаштування брендингу';

  @override
  String get adminLoginDisclaimer => 'Відмова від входу';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML, що відображається під формою входу';

  @override
  String get adminCustomCss => 'Спеціальний CSS';

  @override
  String get adminCustomCssHint =>
      'Спеціальний CSS, застосований до веб-інтерфейсу';

  @override
  String get adminEnableSplashScreen => 'Увімкнути заставку';

  @override
  String get adminStreamingSaved =>
      'Налаштування потокового передавання збережено';

  @override
  String get adminStreamingLoadFailed =>
      'Не вдалося завантажити налаштування потокового передавання';

  @override
  String get adminStreamingDescription =>
      'Встановіть глобальні обмеження потокової швидкості для віддалених з’єднань.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ліміт бітрейту віддаленого клієнта (Мбіт/с)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Залиште порожнім або 0 для необмеженого';

  @override
  String get adminPlaybackSaved => 'Налаштування відтворення збережено';

  @override
  String get adminPlaybackLoadFailed =>
      'Не вдалося завантажити налаштування відтворення';

  @override
  String get adminPlaybackTranscoding => 'Відтворення / Перекодування';

  @override
  String get adminHardwareAcceleration => 'Апаратне прискорення';

  @override
  String get adminVaapiDevice => 'Пристрій VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Увімкнути апаратне кодування';

  @override
  String get adminEnableHardwareDecoding =>
      'Увімкнути апаратне декодування для:';

  @override
  String get adminEncodingThreads => 'Кодування потоків';

  @override
  String get adminAutomatic => '0 = автоматичний';

  @override
  String get adminTranscodingTempPath => 'Тимчасовий шлях перекодування';

  @override
  String get adminEnableFallbackFont => 'Увімкнути резервний шрифт';

  @override
  String get adminFallbackFontPath => 'Резервний шлях шрифту';

  @override
  String get adminAllowSegmentDeletion => 'Дозволити видалення сегмента';

  @override
  String get adminSegmentKeepSeconds => 'Тримання сегмента (секунди)';

  @override
  String get adminThrottleBuffering => 'Буферізація дросельної заслінки';

  @override
  String get adminTrickplaySaved => 'Налаштування Trickplay збережено';

  @override
  String get adminTrickplayLoadFailed =>
      'Не вдалося завантажити налаштування Trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Увімкніть апаратне прискорення';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Увімкнути вилучення лише ключових кадрів';

  @override
  String get adminKeyFrameSubtitle => 'Швидше, але нижча точність';

  @override
  String get adminScanBehavior => 'Поведінка сканування';

  @override
  String get adminProcessPriority => 'Пріоритет процесу';

  @override
  String get adminImageSettings => 'Налаштування зображення';

  @override
  String get adminIntervalMs => 'Інтервал (мс)';

  @override
  String get adminCaptureFrameSubtitle => 'Як часто знімати кадри';

  @override
  String get adminWidthResolutions => 'Роздільна здатність по ширині';

  @override
  String get adminTileWidth => 'Ширина плитки';

  @override
  String get adminTileHeight => 'Висота плитки';

  @override
  String get adminQualitySubtitle =>
      'Менші значення = краща якість, більші файли';

  @override
  String get adminProcessThreads => 'Обробляти потоки';

  @override
  String get adminResumeSaved => 'Налаштування відновлення збережено';

  @override
  String get adminResumeLoadFailed =>
      'Не вдалося завантажити налаштування відновлення';

  @override
  String get adminResumeDescription =>
      'Налаштуйте, коли вміст слід позначати як частково або повністю відтворений.';

  @override
  String get adminMinResumePercentage => 'Мінімальний відсоток резюме';

  @override
  String get adminMinResumeSubtitle =>
      'Вміст має бути відтворено понад цей відсоток, щоб зберегти прогрес';

  @override
  String get adminMaxResumePercentage => 'Максимальний відсоток резюме';

  @override
  String get adminMaxResumeSubtitle =>
      'Вміст вважається повністю відтвореним після цього відсотка';

  @override
  String get adminMinResumeDuration =>
      'Мінімальна тривалість відновлення (секунди)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Елементи, коротші за цей, не можна відновити';

  @override
  String get adminMinAudiobookResume =>
      'Мінімальний відсоток резюме аудіокниги';

  @override
  String get adminMaxAudiobookResume =>
      'Максимальний відсоток відновлення аудіокниги';

  @override
  String get adminNetworkingSaved =>
      'Налаштування мережі збережено. Може знадобитися перезапуск сервера.';

  @override
  String get adminNetworkingLoadFailed =>
      'Не вдалося завантажити налаштування мережі';

  @override
  String get adminNetworkingWarning =>
      'Зміни мережевих налаштувань можуть потребувати перезапуску сервера.';

  @override
  String get adminEnableRemoteAccess => 'Увімкнути віддалений доступ';

  @override
  String get ports => 'Порти';

  @override
  String get adminHttpPort => 'порт HTTP';

  @override
  String get adminHttpsPort => 'Порт HTTPS';

  @override
  String get adminPublicHttpsPort => 'Загальнодоступний порт HTTPS';

  @override
  String get adminBaseUrl => 'Базовий URL';

  @override
  String get adminBaseUrlHint => 'напр. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Увімкніть HTTPS';

  @override
  String get adminLocalNetwork => 'Локальна мережа';

  @override
  String get adminLocalNetworkAddresses => 'Адреси локальної мережі';

  @override
  String get adminKnownProxies => 'Відомі проксі';

  @override
  String get adminRemoteIpFilter => 'Віддалений IP-фільтр';

  @override
  String get adminRemoteIpFilterEntries => 'Віддалений IP-фільтр';

  @override
  String get adminCertificatePath => 'Шлях сертифіката';

  @override
  String get whitelist => 'Білий список';

  @override
  String get blacklist => 'Чорний список';

  @override
  String get notSet => 'Не встановлено';

  @override
  String get adminMetadataSaved => 'Метадані збережено';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Не вдалося завантажити метадані: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Не вдалося зберегти метадані: $error';
  }

  @override
  String get adminRefreshMetadata => 'Оновити метадані';

  @override
  String get recursive => 'рекурсивний';

  @override
  String get adminReplaceAllMetadata => 'Замінити всі метадані';

  @override
  String get adminReplaceAllImages => 'Замінити всі зображення';

  @override
  String get adminMetadataRefreshRequested =>
      'Надіслано запит на оновлення метаданих';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Не вдалося оновити метадані: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Віддалених збігів не знайдено';

  @override
  String get adminRemoteResults => 'Віддалені результати';

  @override
  String get adminRemoteMetadataApplied => 'Застосовано віддалені метадані';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Помилка віддаленого пошуку: $error';
  }

  @override
  String get adminUpdateContentType => 'Оновити тип вмісту';

  @override
  String get adminContentType => 'Тип вмісту';

  @override
  String get adminContentTypeUpdated => 'Оновлено тип вмісту';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Не вдалося оновити тип вмісту: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Не вдалося завантажити редактор метаданих';

  @override
  String get adminNoPeopleEntries => 'Немає записів людей';

  @override
  String get adminNoExternalIds => 'Немає зовнішніх ідентифікаторів';

  @override
  String adminImageUpdated(String imageType) {
    return 'Зображення $imageType оновлено';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Не вдалося завантажити зображення: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Непідтримуваний формат зображення';

  @override
  String get adminImageReadFailed => 'Не вдалося прочитати вибране зображення';

  @override
  String adminImageUploaded(String imageType) {
    return 'Зображення $imageType вивантажено';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Не вдалося вивантажити зображення: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Видалити зображення $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Зображення $imageType видалено';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Не вдалося видалити зображення: $error';
  }

  @override
  String get adminAllProviders => 'Всі провайдери';

  @override
  String get adminNoRemoteImages => 'Віддалених зображень не знайдено';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Не вдалося виявити тюнери: $error';
  }

  @override
  String get adminAddTuner => 'Додати тюнер';

  @override
  String get adminEditTuner => 'Редагувати тюнер';

  @override
  String get adminTunerTypeM3u => 'Тюнер M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Файл або URL';

  @override
  String get adminTunerIpAddress => 'IP-адреса тюнера';

  @override
  String get adminTunerFriendlyName => 'Зрозуміла назва';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Ліміт одночасних підключень';

  @override
  String get adminTunerCountHelp =>
      'Максимальна кількість потоків, які тюнер дозволяє одночасно. Установіть 0 для необмеженої кількості.';

  @override
  String get adminTunerFallbackBitrate =>
      'Резервний максимальний бітрейт потоку';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Імпортувати лише улюблені канали';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Дозволити апаратне транскодування';

  @override
  String get adminTunerAllowFmp4 => 'Дозволити контейнер транскодування fMP4';

  @override
  String get adminTunerAllowStreamSharing =>
      'Дозволити спільне використання потоку';

  @override
  String get adminTunerEnableStreamLooping => 'Увімкнути зациклення потоку';

  @override
  String get adminTunerIgnoreDts => 'Ігнорувати DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Читати вхідний потік із власною частотою кадрів';

  @override
  String get adminEditProvider => 'Редагувати постачальника';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Файл або URL';

  @override
  String get adminXmltvMoviePrefix => 'Префікс фільмів';

  @override
  String get adminXmltvMovieCategories => 'Категорії фільмів';

  @override
  String get adminXmltvCategoriesHelp =>
      'Розділяйте кілька категорій вертикальною рискою.';

  @override
  String get adminXmltvKidsCategories => 'Дитячі категорії';

  @override
  String get adminXmltvNewsCategories => 'Категорії новин';

  @override
  String get adminXmltvSportsCategories => 'Спортивні категорії';

  @override
  String get adminSdUsername => 'Ім\'я користувача';

  @override
  String get adminSdPassword => 'Пароль';

  @override
  String get adminSdCountry => 'Країна';

  @override
  String get adminSdCountrySelect => 'Виберіть країну';

  @override
  String get adminSdPostalCode => 'Поштовий індекс';

  @override
  String get adminSdGetListings => 'Отримати списки';

  @override
  String get adminSdListings => 'Списки';

  @override
  String get adminEnableAllTuners => 'Увімкнути всі тюнери';

  @override
  String get adminTunerType => 'Тип тюнера';

  @override
  String get adminTunerAdded => 'Додано тюнер';

  @override
  String adminTunerAddFailed(String error) {
    return 'Не вдалося додати тюнер: $error';
  }

  @override
  String get adminAddGuideProvider => 'Додати постачальника посібника';

  @override
  String get adminProviderType => 'Тип постачальника';

  @override
  String get adminProviderAdded => 'Провайдер доданий';

  @override
  String adminProviderAddFailed(String error) {
    return 'Не вдалося додати постачальника: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Не вдалося видалити тюнер: $error';
  }

  @override
  String get adminTunerResetRequested => 'Запит на скидання тюнера';

  @override
  String adminTunerResetFailed(String error) {
    return 'Не вдалося скинути тюнер: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Цей тип тюнера не підтримує скидання.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Не вдалося видалити постачальника: $error';
  }

  @override
  String get adminRecordingSettings => 'Налаштування запису';

  @override
  String get adminPrePadding => 'Попереднє доповнення (хвилини)';

  @override
  String get adminPostPadding => 'Доповнення (хвилини)';

  @override
  String get adminRecordingPath => 'Шлях запису';

  @override
  String get adminSeriesRecordingPath => 'Шлях запису серії';

  @override
  String get adminMovieRecordingPath => 'Шлях для запису фільмів';

  @override
  String get adminGuideDays => 'Кількість днів телепрограми';

  @override
  String get adminGuideDaysAuto => 'Автоматично';

  @override
  String adminGuideDaysValue(int days) {
    return '$days днів';
  }

  @override
  String get adminRecordingPostProcessor => 'Шлях до програми постобробки';

  @override
  String get adminRecordingPostProcessorArgs => 'Аргументи постобробника';

  @override
  String get adminSaveRecordingNfo => 'Зберігати метадані NFO для записів';

  @override
  String get adminSaveRecordingImages => 'Зберігати зображення записів';

  @override
  String get adminLiveTvSectionTiming => 'Час';

  @override
  String get adminLiveTvSectionPaths => 'Шляхи для записів';

  @override
  String get adminLiveTvSectionPostProcessing => 'Постобробка';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Дані телепрограми: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Налаштування запису збережено';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Не вдалося зберегти налаштування: $error';
  }

  @override
  String get adminSetChannelMappings => 'Установити зіставлення каналів';

  @override
  String get adminMappingJson => 'Відображення JSON';

  @override
  String get adminMappingJsonHint =>
      'Приклад: відображення корисного навантаження JSON';

  @override
  String get adminChannelMappingsUpdated => 'Зіставлення каналів оновлено';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Не вдалося оновити зіставлення: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Не вдалося завантажити адміністрування Live TV';

  @override
  String get adminTunerDevices => 'Пристрої тюнера';

  @override
  String get adminNoTunerHosts => 'Немає налаштованих хостів тюнера';

  @override
  String get adminGuideProviders => 'Постачальники посібників';

  @override
  String get adminRefreshGuideData => 'Оновити дані телепрограми';

  @override
  String get adminGuideRefreshStarted =>
      'Оновлення даних телепрограми розпочато';

  @override
  String get adminGuideRefreshUnavailable =>
      'Завдання оновлення телепрограми недоступне на цьому сервері.';

  @override
  String get adminAddProvider => 'Додати постачальника';

  @override
  String get adminNoListingProviders =>
      'Немає налаштованих постачальників лістингу';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Шлях для записів: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Шлях для серіалів: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Запас на початку: $minutes хв';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Запас у кінці: $minutes хв';
  }

  @override
  String get adminTunerDiscovery => 'Відкриття тюнера';

  @override
  String get adminChannelMappings => 'Відображення каналів';

  @override
  String get adminNoDiscoveredTuners => 'Ще немає знайдених тюнерів';

  @override
  String get adminSettingsSaved => 'Налаштування збережено';

  @override
  String get adminBackupsNotAvailable =>
      'Резервне копіювання недоступне на цій версії сервера.';

  @override
  String get adminRestoreWarning1 =>
      'Під час відновлення ВСІ поточні дані сервера буде замінено даними резервної копії.';

  @override
  String get adminRestoreWarning2 =>
      'Поточні налаштування сервера, дані користувачів і бібліотеки буде перезаписано.';

  @override
  String get adminRestoreWarning3 =>
      'Після відновлення сервер перезавантажиться.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Відновити резервну копію $name зараз?';
  }

  @override
  String get adminRestoreRequested =>
      'Запит на відновлення. Перезапуск сервера може розірвати цей сеанс.';

  @override
  String get adminBackupsTitle => 'Резервні копії';

  @override
  String get adminUnknownDate => 'Невідома дата';

  @override
  String get adminUnnamedBackup => 'Безіменна резервна копія';

  @override
  String get adminLiveTvNotAvailable =>
      'Адміністрування прямого телебачення недоступне на цій версії сервера.';

  @override
  String get adminLiveTvTitle => 'Адміністрація прямого телебачення';

  @override
  String get adminApply => 'Застосувати';

  @override
  String get adminNotSet => 'Не встановлено';

  @override
  String get adminReset => 'Скинути';

  @override
  String get adminLogsTitle => 'Журнали сервера';

  @override
  String get adminLogsNewestFirst => 'Спочатку найновіші';

  @override
  String get adminLogsOldestFirst => 'Спочатку найстаріший';

  @override
  String get adminLogsJustNow => 'Просто зараз';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes хв тому';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours год тому';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days дн тому';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Не вдалося завантажити $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count збігів';
  }

  @override
  String get adminLogViewerNoMatches => 'Немає відповідних рядків';

  @override
  String get adminMetadataEditorTitle => 'Редактор метаданих';

  @override
  String get adminMetadataIdentify => 'Ідентифікувати';

  @override
  String get adminMetadataType => 'Тип';

  @override
  String get adminMetadataDetails => 'Подробиці';

  @override
  String get adminMetadataExternalIds => 'Зовнішні ідентифікатори';

  @override
  String get adminMetadataImages => 'Зображення';

  @override
  String get adminMetadataFieldTitle => 'Назва';

  @override
  String get adminMetadataFieldSortTitle => 'Назва сортування';

  @override
  String get adminMetadataFieldOriginalTitle => 'Оригінальна назва';

  @override
  String get adminMetadataFieldPremiereDate => 'Дата прем\'єри (РРРР-ММ-ДД)';

  @override
  String get adminMetadataFieldEndDate => 'Дата завершення (РРРР-ММ-ДД)';

  @override
  String get adminMetadataFieldProductionYear => 'Рік випуску';

  @override
  String get adminMetadataFieldOfficialRating => 'Офіційний рейтинг';

  @override
  String get adminMetadataFieldCommunityRating => 'Рейтинг спільноти';

  @override
  String get adminMetadataFieldCriticRating => 'Рейтинг критиків';

  @override
  String get adminMetadataFieldTagline => 'Слоган';

  @override
  String get adminMetadataFieldOverview => 'Огляд';

  @override
  String get adminMetadataGenres => 'Жанри';

  @override
  String get adminMetadataTags => 'Теги';

  @override
  String get adminMetadataStudios => 'Студії';

  @override
  String get adminMetadataPeople => 'люди';

  @override
  String get adminMetadataAddGenre => 'Додати жанр';

  @override
  String get adminMetadataAddTag => 'Додати тег';

  @override
  String get adminMetadataAddStudio => 'Додати студію';

  @override
  String get adminMetadataAddPerson => 'Додати особу';

  @override
  String get adminMetadataEditPerson => 'Редагувати особу';

  @override
  String get adminMetadataRole => 'Роль';

  @override
  String get adminMetadataImagePrimary => 'Первинний';

  @override
  String get adminMetadataImageBackdrop => 'Задник';

  @override
  String get adminMetadataImageLogo => 'логотип';

  @override
  String get adminMetadataImageBanner => 'банер';

  @override
  String get adminMetadataImageThumb => 'Великий палець';

  @override
  String get adminMetadataRecursive => 'рекурсивний';

  @override
  String get adminMetadataProvider => 'Провайдер';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Зображення $imageType оновлено';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Зображення $imageType вивантажено';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Зображення $imageType видалено';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Не вдалося завантажити зображення: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Не вдалося прочитати вибране зображення';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Не вдалося вивантажити зображення: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Видалити зображення $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Це видаляє поточне зображення з елемента.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Не вдалося видалити зображення: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Виберіть зображення $imageType';
  }

  @override
  String get adminMetadataUpload => 'Завантажити';

  @override
  String get adminMetadataUpdate => 'оновлення';

  @override
  String get adminMetadataRemoteImage => 'Віддалене зображення';

  @override
  String get adminPluginsInstalled => 'встановлено';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Активний';

  @override
  String get adminPluginsRestart => 'Перезапустіть';

  @override
  String get adminPluginsNoSearchResults =>
      'Жоден плагін не відповідає вашому пошуку';

  @override
  String get adminPluginsNoneInstalled => 'Плагіни не встановлено';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Доступне оновлення: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Доступне оновлення';

  @override
  String get adminPluginsPendingRemoval =>
      'Очікує на видалення після перезапуску';

  @override
  String get adminPluginsChangesPending => 'Зміни очікують на перезапуск';

  @override
  String get adminPluginsEnable => 'Увімкнути';

  @override
  String get adminPluginsDisable => 'Вимкнути';

  @override
  String get adminPluginsInstallUpdate => 'Встановити оновлення';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Встановити оновлення (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Немає пакетів, що відповідають вашому запиту';

  @override
  String get adminPluginsCatalogEmpty => 'Немає доступних пакетів';

  @override
  String adminPluginsInstalling(String name) {
    return '«$name» встановлюється...';
  }

  @override
  String get adminPluginDetailExperimental => 'Експериментальна інтеграція';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Інтеграція налаштувань плагіна все ще експериментальна. Деякі поля чи макети можуть ще не відображатися належним чином.';

  @override
  String get adminPluginDetailToggle404 =>
      'Не вдалося перемкнути плагін. Сервер не може знайти цю версію плагіна. Спробуйте оновити плагіни, а потім повторіть спробу.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Не вдалося перемкнути плагін. Подробиці перевірте в журналах сервера.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Налаштування $name';
  }

  @override
  String get adminPluginDetailDetails => 'Подробиці';

  @override
  String get adminPluginDetailDeveloper => 'Розробник';

  @override
  String get adminPluginDetailRepository => 'Репозиторій';

  @override
  String get adminPluginDetailBundled => 'В комплекті';

  @override
  String get adminPluginDetailEnablePlugin => 'Увімкнути плагін';

  @override
  String get adminPluginDetailRestartRequired =>
      'Щоб зміни набули чинності, потрібно перезапустити сервер.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Цей плагін буде видалено після перезапуску сервера.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Цей плагін несправний і може не працювати належним чином.';

  @override
  String get adminPluginDetailNotSupported =>
      'Цей плагін не підтримується поточною версією сервера.';

  @override
  String get adminPluginDetailSuperseded =>
      'Цей плагін було замінено новішою версією.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Не вдалося завантажити репозиторії: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Видалити репозиторій';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Ви впевнені, що хочете видалити «$name»?';
  }

  @override
  String get adminReposRemove => 'Прибрати';

  @override
  String adminReposSaveFailed(String error) {
    return 'Не вдалося зберегти репозиторії: $error';
  }

  @override
  String get adminReposEmpty => 'Немає налаштованих репозиторіїв';

  @override
  String get adminReposEmptySubtitle =>
      'Додайте репозиторій для перегляду доступних плагінів';

  @override
  String get adminReposUnnamed => '(без імені)';

  @override
  String get adminReposEditTitle => 'Редагувати сховище';

  @override
  String get adminReposAddTitle => 'Додати репозиторій';

  @override
  String get adminReposUrl => 'URL-адреса сховища';

  @override
  String get adminReposNameHint => 'напр. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Недійсний URL';

  @override
  String get adminGeneralSettingsTitle => 'Загальні налаштування';

  @override
  String get adminGeneralMetadataLanguage => 'Бажана мова метаданих';

  @override
  String get adminGeneralMetadataLanguageHint => 'напр. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Бажана країна метаданих';

  @override
  String get adminGeneralMetadataCountryHint => 'напр. США, Німеччина, Франція';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Паралельність сканування бібліотеки';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Ліміт паралельного кодування зображень';

  @override
  String get adminUnknownError => 'Невідома помилка';

  @override
  String get adminBrowse => 'переглядати';

  @override
  String get adminCloseBrowser => 'Закрити браузер';

  @override
  String get adminNetworkingTitle => 'Мережа';

  @override
  String get adminNetworkingRestartWarning =>
      'Зміни мережевих налаштувань можуть потребувати перезапуску сервера.';

  @override
  String get adminNetworkingRemoteAccess => 'Увімкнути віддалений доступ';

  @override
  String get adminNetworkingPorts => 'Порти';

  @override
  String get adminNetworkingHttpPort => 'порт HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Порт HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Увімкніть HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Локальна мережа';

  @override
  String get adminNetworkingLocalAddresses => 'Адреси локальної мережі';

  @override
  String get adminNetworkingAddressHint => 'напр. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Відомі проксі';

  @override
  String get adminNetworkingProxyHint => 'напр. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Білий список';

  @override
  String get adminNetworkingBlacklist => 'Чорний список';

  @override
  String get adminNetworkingAddEntry => 'Додати запис';

  @override
  String get adminBrandingTitle => 'брендинг';

  @override
  String get adminBrandingLoginDisclaimer => 'Відмова від входу';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML, що відображається під формою входу';

  @override
  String get adminBrandingCustomCss => 'Спеціальний CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Спеціальний CSS, застосований до веб-інтерфейсу';

  @override
  String get adminBrandingEnableSplash => 'Увімкнути заставку';

  @override
  String get adminBrandingSplashUpload => 'Вивантажити зображення';

  @override
  String get adminBrandingSplashUploaded => 'Заставку оновлено';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Не вдалося вивантажити заставку';

  @override
  String get adminBrandingSplashDeleted => 'Заставку видалено';

  @override
  String get adminBrandingNoSplash => 'Немає власної заставки';

  @override
  String get adminPlaybackHwAccel => 'Апаратне прискорення';

  @override
  String get adminPlaybackHwAccelLabel => 'Апаратне прискорення';

  @override
  String get adminPlaybackEnableHwEncoding => 'Увімкнути апаратне кодування';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Увімкнути апаратне декодування для:';

  @override
  String get adminPlaybackQsvDevice => 'Пристрій QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Увімкнути покращений декодер NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Віддавати перевагу системному апаратному декодеру';

  @override
  String get adminPlaybackColorDepth =>
      'Глибина кольору апаратного декодування';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-бітне декодування HEVC';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-бітне декодування VP9';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      '8/10-бітне декодування HEVC RExt';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      '12-бітне декодування HEVC RExt';

  @override
  String get adminPlaybackHwEncodingSection => 'Апаратне кодування';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Дозволити кодування HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Дозволити кодування AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Увімкнути енергоощадний кодер Intel H.264';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Увімкнути енергоощадний кодер Intel HEVC';

  @override
  String get adminPlaybackToneMapping => 'Тональне відображення';

  @override
  String get adminPlaybackEnableTonemapping =>
      'Увімкнути тональне відображення';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Увімкнути тональне відображення VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Увімкнути тональне відображення VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Алгоритм тонального відображення';

  @override
  String get adminPlaybackTonemappingMode => 'Режим тонального відображення';

  @override
  String get adminPlaybackTonemappingRange =>
      'Діапазон тонального відображення';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Знебарвлення тонального відображення';

  @override
  String get adminPlaybackTonemappingPeak => 'Пік тонального відображення';

  @override
  String get adminPlaybackTonemappingParam =>
      'Параметр тонального відображення';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Яскравість тонального відображення VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Контрастність тонального відображення VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Пресети та якість';

  @override
  String get adminPlaybackEncoderPreset => 'Пресет кодера';

  @override
  String get adminPlaybackH264Crf => 'CRF кодування H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF кодування H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Метод деінтерлейсингу';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Подвоювати частоту кадрів під час деінтерлейсингу';

  @override
  String get adminPlaybackAudioSection => 'Аудіо';

  @override
  String get adminPlaybackEnableAudioVbr =>
      'Увімкнути кодування аудіо зі змінним бітрейтом (VBR)';

  @override
  String get adminPlaybackDownmixBoost => 'Підсилення при мікшуванні аудіо';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Алгоритм мікшування в стерео';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Максимальний розмір черги мультиплексування';

  @override
  String get adminPlaybackAutoOption => 'Авто';

  @override
  String get adminPlaybackEncoding => 'Кодування';

  @override
  String get adminPlaybackEncodingThreads => 'Кодування потоків';

  @override
  String get adminPlaybackFallbackFont => 'Увімкнути резервний шрифт';

  @override
  String get adminPlaybackFallbackFontPath => 'Резервний шлях шрифту';

  @override
  String get adminPlaybackStreaming => 'Потокове передавання';

  @override
  String get adminResumeVideo => 'відео';

  @override
  String get adminResumeAudiobooks => 'Аудіокниги';

  @override
  String get adminResumeMinAudiobookPct =>
      'Мінімальний відсоток резюме аудіокниги';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Максимальний відсоток відновлення аудіокниги';

  @override
  String get adminStreamingBitrateLimit =>
      'Ліміт бітрейту віддаленого клієнта (Мбіт/с)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Залиште порожнім або 0 для необмеженого';

  @override
  String get adminTrickplayHwAccel => 'Увімкніть апаратне прискорення';

  @override
  String get adminTrickplayHwEncoding => 'Увімкнути апаратне кодування';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Увімкнути вилучення лише ключових кадрів';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'Швидше, але нижча точність';

  @override
  String get adminTrickplayNonBlocking => 'Неблокування';

  @override
  String get adminTrickplayBlocking => 'Блокування';

  @override
  String get adminTrickplayPriorityHigh => 'Високий';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Вище норми';

  @override
  String get adminTrickplayPriorityNormal => 'нормальний';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Нижче норми';

  @override
  String get adminTrickplayPriorityIdle => 'Бездіяльність';

  @override
  String get adminTrickplayImageSettings => 'Налаштування зображення';

  @override
  String get adminTrickplayInterval => 'Інтервал (мс)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Як часто знімати кадри';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Ширина пікселів, розділених комами (наприклад, 320)';

  @override
  String get adminTrickplayQuality => 'якість';

  @override
  String get adminTrickplayQScale => 'Шкала якості';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Менші значення = краща якість, більші файли';

  @override
  String get adminTrickplayJpegQuality => 'Якість JPEG';

  @override
  String get adminTrickplayProcessing => 'Обробка';

  @override
  String get adminTasksEmpty => 'Запланованих завдань не знайдено';

  @override
  String get adminTasksNoFilterMatch =>
      'Жодне завдання не відповідає поточному фільтру';

  @override
  String get adminTaskCancelling => 'Скасування...';

  @override
  String get adminTaskRunning => 'Біг...';

  @override
  String get adminTaskNeverRun => 'Ніколи не бігайте';

  @override
  String get adminTaskStop => 'Зупинити';

  @override
  String get adminRunningTasks => 'Активні завдання';

  @override
  String get adminTaskRun => 'бігти';

  @override
  String get adminTaskDetailLastExecution => 'Остання страта';

  @override
  String get adminTaskDetailStarted => 'розпочато';

  @override
  String get adminTaskDetailEnded => 'Завершено';

  @override
  String get adminTaskDetailDuration => 'Тривалість';

  @override
  String get adminTaskDetailErrorLabel => 'Помилка:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Щодня в $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Кожен $day о $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Кожен $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'При запуску програми';

  @override
  String get adminTaskTriggerTypeDaily => 'Щодня';

  @override
  String get adminTaskTriggerTypeWeekly => 'Щотижня';

  @override
  String get adminTaskTriggerTypeInterval => 'На інтервалі';

  @override
  String get adminTaskTriggerIntervalLabel => 'Інтервал';

  @override
  String get adminTaskTriggerEveryHour => 'Щогодини';

  @override
  String get adminTaskTriggerEvery6Hours => 'Кожні 6 годин';

  @override
  String get adminTaskTriggerEvery12Hours => 'Кожні 12 годин';

  @override
  String get adminTaskTriggerEvery24Hours => 'Кожні 24 години';

  @override
  String get adminTaskTriggerEvery2Days => 'Кожні 2 дні';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count години',
      many: '$count годин',
      few: '$count години',
      one: '$count година',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'час';

  @override
  String get adminTaskTriggerNoLimit => 'Без обмежень';

  @override
  String get adminActivityJustNow => 'Просто зараз';

  @override
  String get adminActivityLastHour => 'Остання година';

  @override
  String get adminActivityToday => 'Сьогодні';

  @override
  String get adminActivityYesterday => 'вчора';

  @override
  String get adminActivityOlder => 'Старший';

  @override
  String adminActivityDaysAgo(int days) {
    return '$daysдн. тому';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hoursгод тому';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutesхв тому';
  }

  @override
  String get adminActivityNow => 'тепер';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes хв';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours год';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days дн';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Налаштуйте створення зображень Trickplay для ескізів попереднього перегляду під час перемотування.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Загальнодоступний порт HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Базовий URL';

  @override
  String get adminNetworkingBaseUrlHint => 'напр. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Публічний порт HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Вимагати HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Перенаправляти всі віддалені запити на HTTPS. Не діє, якщо сервер не має дійсного сертифіката.';

  @override
  String get adminNetworkingCertPassword => 'Пароль сертифіката';

  @override
  String get adminNetworkingIpSettings => 'Налаштування IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Увімкнути IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Увімкнути IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Увімкнути автоматичне зіставлення портів';

  @override
  String get adminNetworkingLocalSubnets => 'Мережі LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Список IP-адрес або підмереж CIDR, розділених комами чи новими рядками, які вважаються локальною мережею.';

  @override
  String get adminNetworkingPublishedUris => 'Опубліковані URI сервера';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Зіставте підмережу або адресу з опублікованою URL-адресою, напр. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Шлях сертифіката';

  @override
  String get adminNetworkingRemoteIpFilter => 'Віддалений IP-фільтр';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Віддалений IP-фільтр';

  @override
  String get adminPlaybackVaapiDevice => 'Пристрій VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = автоматичний';

  @override
  String get adminPlaybackTranscodeTempPath => 'Тимчасовий шлях перекодування';

  @override
  String get adminPlaybackSegmentDeletion => 'Дозволити видалення сегмента';

  @override
  String get adminPlaybackSegmentKeep => 'Тримання сегмента (секунди)';

  @override
  String get adminPlaybackThrottleBuffering =>
      'Буферізація дросельної заслінки';

  @override
  String get adminPlaybackThrottleDelay => 'Затримка тротлінгу (секунди)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Дозволити витягування субтитрів на льоту';

  @override
  String get adminResumeMinPct => 'Мінімальний відсоток резюме';

  @override
  String get adminResumeMinPctSubtitle =>
      'Вміст має бути відтворено понад цей відсоток, щоб зберегти прогрес';

  @override
  String get adminResumeMaxPct => 'Максимальний відсоток резюме';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Вміст вважається повністю відтвореним після цього відсотка';

  @override
  String get adminResumeMinDuration =>
      'Мінімальна тривалість відновлення (секунди)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Елементи, коротші за цей, не можна відновити';

  @override
  String get adminTrickplayScanBehavior => 'Поведінка сканування';

  @override
  String get adminTrickplayProcessPriority => 'Пріоритет процесу';

  @override
  String get adminTrickplayTileWidth => 'Ширина плитки';

  @override
  String get adminTrickplayTileHeight => 'Висота плитки';

  @override
  String get adminTrickplayProcessThreads => 'Обробляти потоки';

  @override
  String get adminTrickplayWidthResolutions => 'Роздільна здатність по ширині';

  @override
  String get adminMetadataDefault => 'За замовчуванням';

  @override
  String get adminMetadataContentTypeUpdated => 'Оновлено тип вмісту';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Не вдалося оновити тип вмісту: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Поріг повільної реакції (мс)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Увімкнути попередження про повільну відповідь';

  @override
  String get adminGeneralQuickConnect => 'Увімкнути Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Сервер';

  @override
  String get adminGeneralSectionMetadata => 'Метадані';

  @override
  String get adminGeneralSectionPaths => 'Шляхи';

  @override
  String get adminGeneralSectionPerformance => 'Продуктивність';

  @override
  String get adminGeneralCachePath => 'Шлях до кешу';

  @override
  String get adminGeneralMetadataPath => 'Шлях метаданих';

  @override
  String get adminGeneralServerName => 'Ім\'я сервера';

  @override
  String get adminGeneralDisplayLanguage => 'Бажана мова відображення';

  @override
  String get adminSettingsLoadFailed => 'Не вдалося завантажити налаштування';

  @override
  String get adminDiscover => 'Відкрийте для себе';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Не вдалося оновити зіставлення: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Ліміт часу: $duration';
  }

  @override
  String get folders => 'Папки';

  @override
  String get libraries => 'Медіатеки';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay вимкнено';

  @override
  String get syncPlayDisabledMessage =>
      'Увімкніть SyncPlay у налаштуваннях, щоб використовувати синхронізоване відтворення.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сервер не підтримується';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'Для SyncPlay потрібен сервер Jellyfin. Поточний сервер не підтримує це.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Група';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay група';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# учасника',
      many: '# учасників',
      few: '# учасники',
      one: '# учасник',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ігнорувати очікування';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Не затримуйте групу, поки цей пристрій буферизується';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Продовжуйте локально, не чекаючи повільних учасників';

  @override
  String get syncPlayRepeat => 'Повторіть';

  @override
  String get syncPlayRepeatOne => 'Один';

  @override
  String get syncPlayShuffleModeShuffled => 'Перетасували';

  @override
  String get syncPlayShuffleModeSorted => 'Відсортовано';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Синхронізувати поточну чергу відтворення';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Замініть групову чергу тим, що відтворюється локально';

  @override
  String get syncPlayLeaveGroup => 'Вийти з групи';

  @override
  String get syncPlayGroupQueue => 'Групова черга';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Товар $index';
  }

  @override
  String get syncPlayPlayNow => 'Грайте зараз';

  @override
  String get syncPlayCreateNewGroup => 'Створіть нову групу';

  @override
  String get syncPlayGroupName => 'Назва групи';

  @override
  String get syncPlayDefaultGroupName => 'Моя SyncPlay група';

  @override
  String get syncPlayCreateGroup => 'Створити групу';

  @override
  String get syncPlayAvailableGroups => 'Доступні групи';

  @override
  String get syncPlayNoGroupsAvailable => 'Немає доступних груп';

  @override
  String get syncPlayJoinGroupQuestion => 'Приєднатися до групи SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Приєднання до групи SyncPlay може замінити вашу поточну чергу відтворення. Продовжити?';

  @override
  String get syncPlayJoin => 'Приєднуйтесь';

  @override
  String get syncPlayStateIdle => 'Бездіяльність';

  @override
  String get syncPlayStateWaiting => 'Очікування';

  @override
  String get syncPlayStatePaused => 'Призупинено';

  @override
  String get syncPlayStatePlaying => 'Граючи';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName приєднався до групи SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName залишив групу SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay доступ заборонено';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Ви не маєте доступу до одного або кількох елементів у цій SyncPlay групі. Попросіть власника групи перевірити дозволи бібліотеки або вибрати іншу чергу.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Синхронізація відтворення з $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Голосовий пошук недоступний.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Помилка прямого відтворення';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Не вдалося розпочати пряме відтворення для цього потоку Dolby Vision. Повторити спробу за допомогою перекодування сервера?';

  @override
  String get retryWithTranscode => 'Повторіть спробу з перекодуванням';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Не підтримується';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Цей пристрій не може безпосередньо декодувати вміст Dolby Vision. Використовуйте HDR10 резервний варіант або надсилайте запит на перекодування сервера.';

  @override
  String get rememberMyChoice => 'Запам\'ятай мій вибір';

  @override
  String get playHdr10Fallback => 'Відтворити HDR10 запасний варіант';

  @override
  String get requestTranscode => 'Запит на перекодування';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'виявлено # рядка',
      many: 'виявлено # рядків',
      few: 'виявлено # рядки',
      one: 'виявлено # рядок',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Переглянути всі';

  @override
  String get noItems => 'Немає елементів';

  @override
  String get switchUser => 'Змінити користувача';

  @override
  String get remoteControl => 'Пульт дистанційного керування';

  @override
  String get mediaBarLoading => 'Завантаження мультимедійної панелі...';

  @override
  String get mediaBarError => 'Не вдалося завантажити мультимедійну панель';

  @override
  String get offlineServerUnavailable =>
      'Підключено до Інтернету, але поточний сервер недоступний.';

  @override
  String get offlineNoInternet =>
      'Ви офлайн. Доступний лише завантажений вміст.';

  @override
  String get offlineFileNotAvailable => 'Файл недоступний';

  @override
  String get offlineSwitchServer => 'Змінити сервер';

  @override
  String get offlineSavedMedia => 'Збережені медіа';

  @override
  String get offlineBannerTitle => 'Ви офлайн';

  @override
  String get offlineBannerSubtitle => 'Показуємо ваші завантаження';

  @override
  String get offlineBannerAction => 'Завантаження';

  @override
  String get serverUnreachableBannerTitle =>
      'Не вдається зв\'язатися з вашим сервером';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Відтворюємо із завантажень, доки він не повернеться';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Віддалене відтворення';

  @override
  String castControlFailed(String error) {
    return 'Помилка керування трансляцією: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Елементи керування';
  }

  @override
  String get castDeviceVolume => 'Гучність пристрою';

  @override
  String get castVolumeUnavailable => 'Недоступний';

  @override
  String castStopKind(String kind) {
    return 'Зупинити $kind';
  }

  @override
  String get audioLabel => 'Аудіо';

  @override
  String get subtitlesLabel => 'Субтитри';

  @override
  String get pinConfirmTitle => 'Підтвердьте PIN-код';

  @override
  String get pinSetTitle => 'Встановити PIN-код';

  @override
  String get pinEnterTitle => 'Введіть PIN-код';

  @override
  String get pinReenterToConfirm =>
      'Повторно введіть PIN-код для підтвердження';

  @override
  String pinEnterNDigit(int length) {
    return 'Введіть $length-значний PIN-код';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Введіть свій $length-значний PIN-код';
  }

  @override
  String get pinIncorrect => 'Неправильний PIN-код';

  @override
  String get pinMismatch => 'PIN-коди не збігаються';

  @override
  String get pinForgot => 'Забули PIN-код?';

  @override
  String get pinClear => 'Очистити';

  @override
  String get pinBackspace => 'Стерти';

  @override
  String get quickConnectAuthorized => 'Запит Quick Connect авторизовано.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Код Quick Connect недійсний або термін його дії минув.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect не підтримується на цьому сервері.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Не вдалося авторизувати код Quick Connect.';

  @override
  String get quickConnectDisabled => 'Quick Connect вимкнено на цьому сервері.';

  @override
  String get quickConnectForbidden =>
      'Ваш обліковий запис не може авторизувати цей запит Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Код Quick Connect не знайдено. Спробуйте новий код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Помилка Quick Connect: $message';
  }

  @override
  String get quickConnectEnterCode => 'Введіть код';

  @override
  String get quickConnectAuthorize => 'Авторизувати';

  @override
  String remoteCommandFailed(String error) {
    return 'Помилка команди: $error';
  }

  @override
  String get remoteControlTitle => 'Пульт дистанційного керування';

  @override
  String get remoteFailedToLoadSessions => 'Не вдалося завантажити сеанси';

  @override
  String get remoteNoSessions => 'Немає контрольованих сеансів';

  @override
  String get remoteStartPlayback => 'Почніть відтворення на іншому пристрої';

  @override
  String get unknownUser => 'Невідомий';

  @override
  String get unknownItem => 'Невідомий';

  @override
  String get remoteNothingPlaying => 'У цьому сеансі нічого не відтворюється';

  @override
  String get castingStarted => 'Трансляцію розпочато на вибраному пристрої';

  @override
  String castingFailed(String error) {
    return 'Не вдалося почати трансляцію: $error';
  }

  @override
  String get noRemoteDevices =>
      'Немає доступних віддалених пристроїв для відтворення.';

  @override
  String get noRemoteDevicesIos =>
      'Немає доступних віддалених пристроїв для відтворення.\n\nВ iOS цілі AirPlay можуть бути недоступні в симуляторі.';

  @override
  String get trackActionPlayNext => 'Грати далі';

  @override
  String get trackActionAddToQueue => 'Додати в чергу';

  @override
  String get trackActionAddToPlaylist => 'Додати до списку відтворення';

  @override
  String get trackActionCancelDownload => 'Скасувати завантаження';

  @override
  String get trackActionDeleteFromPlaylist => 'Видалити зі списку відтворення';

  @override
  String get trackActionMoveUp => 'Рух вгору';

  @override
  String get trackActionMoveDown => 'Рух вниз';

  @override
  String get trackActionRemoveFromFavorites => 'Видалити з вибраного';

  @override
  String get trackActionAddToFavorites => 'Додати в обране';

  @override
  String get trackActionGoToAlbum => 'Перейдіть до альбому';

  @override
  String get trackActionGoToArtist => 'Перейдіть до Виконавця';

  @override
  String trackActionDownloading(String name) {
    return 'Завантаження $name...';
  }

  @override
  String get trackActionDeletedFile => 'Завантажений файл видалено';

  @override
  String get trackActionDeleteFileFailed =>
      'Не вдалося видалити завантажений файл';

  @override
  String get shuffleBy => 'Перемішати за';

  @override
  String get shuffleSelectLibrary => 'Виберіть Бібліотека';

  @override
  String get shuffleSelectGenre => 'Виберіть Жанр';

  @override
  String get shuffleLibrary => 'Медіатека';

  @override
  String get shuffleGenre => 'Жанр';

  @override
  String get shuffleNoLibraries => 'Немає доступних сумісних бібліотек.';

  @override
  String get shuffleNoGenres =>
      'Не знайдено жанрів для цього режиму перемішування.';

  @override
  String get posterDisplayTitle => 'Дисплей';

  @override
  String get posterImageType => 'Тип зображення';

  @override
  String get imageTypePoster => 'Плакат';

  @override
  String get imageTypeThumbnail => 'Мініатюра';

  @override
  String get imageTypeBanner => 'банер';

  @override
  String get playlistAddFailed => 'Не вдалося додати до списку відтворення';

  @override
  String get playlistCreateFailed => 'Не вдалося створити список відтворення';

  @override
  String get playlistNew => 'Новий список відтворення';

  @override
  String get playlistCreate => 'Створити';

  @override
  String get playlistCreateNew => 'Створити новий список відтворення';

  @override
  String get playlistNoneFound => 'Списків відтворення не знайдено';

  @override
  String get addToPlaylist => 'Додати до списку відтворення';

  @override
  String get lyricsNotAvailable => 'Тексти пісень відсутні';

  @override
  String get upNext => 'Далі';

  @override
  String get playNext => 'Грати далі';

  @override
  String get stillWatchingContent =>
      'Відтворення призупинено. Ви все ще дивитесь?';

  @override
  String get stillWatchingStop => 'Зупинити';

  @override
  String get stillWatchingContinue => 'Продовжити';

  @override
  String skipSegment(String segment) {
    return 'Пропустити $segment';
  }

  @override
  String get liveTv => 'Пряме телебачення';

  @override
  String get continueWatchingAndNextUp => 'Продовжити перегляд і далі';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Завантаження $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Завантаження $fileName';
  }

  @override
  String get nextEpisode => 'Наступний епізод';

  @override
  String get moreFromThisSeason => 'Більше з цього сезону';

  @override
  String get playerTooltipPlaybackSpeed => 'Швидкість відтворення';

  @override
  String get playerTooltipCastControls => 'Елементи керування трансляцією';

  @override
  String get playerTooltipPlaybackQuality => 'Бітрейт';

  @override
  String get playerTooltipEnterFullscreen => 'Перейти в повноекранний режим';

  @override
  String get playerTooltipExitFullscreen => 'Вийти з повноекранного режиму';

  @override
  String get playerTooltipFloatOnTop => 'Поплавок зверху';

  @override
  String get playerTooltipExitFloatOnTop => 'Вимкнути плаваючу поверхню';

  @override
  String get playerTooltipLockLandscape => 'Замок пейзаж';

  @override
  String get playerTooltipUnlockOrientation => 'Дозволити обертання';

  @override
  String get playerTooltipPrevious => 'Попередній';

  @override
  String get playerTooltipSeekBack => 'Шукати назад';

  @override
  String get playerTooltipSeekForward => 'Шукати вперед';

  @override
  String get contextMenuMarkWatched => 'Позначити як переглянуте';

  @override
  String get contextMenuMarkUnwatched => 'Позначити як непереглянуте';

  @override
  String get contextMenuAddToFavorites => 'Додати в обране';

  @override
  String get contextMenuRemoveFromFavorites => 'Видалити з вибраного';

  @override
  String get contextMenuGoToSeries => 'Перейдіть до серії';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Приховати з «Продовжити перегляд»';

  @override
  String get contextMenuHideFromNextUp => 'Приховати з «Далі»';

  @override
  String get contextMenuAddToCollection => 'Додати до колекції';

  @override
  String get settingsAdministrationSubtitle =>
      'Доступ до панелі адміністрування сервера';

  @override
  String get settingsAccountSecurity => 'Обліковий запис і безпека';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Автентифікація, PIN-код і батьківський контроль';

  @override
  String get settingsPersonalization => 'Персоналізація';

  @override
  String get settingsPersonalizationSubtitle =>
      'Видимість теми, навігації, домашніх рядків і бібліотеки';

  @override
  String get settingsDynamicContent => 'Динамічний вміст';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медіапанель і візуальні накладки';

  @override
  String get settingsPlaybackSyncplay => 'Відтворення та SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Налаштування аудіо/відео, субтитри, завантаження та елементи керування SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Синхронізація плагінів, Seerr, рейтинги тощо';

  @override
  String get settingsAboutSubtitle =>
      'Версія програми, юридична інформація та кредити';

  @override
  String get settingsAuthenticationSection => 'АВТЕНТИФІКАЦІЯ';

  @override
  String get settingsSortServersBy => 'Сортувати сервери за';

  @override
  String get settingsLastUsed => 'Останнє використання';

  @override
  String get settingsAlphabetical => 'Алфавітний';

  @override
  String get settingsConnectionSection => 'ПІДКЛЮЧЕННЯ';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Дозволити самопідписані сертифікати';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Довіряти серверам із самопідписаними сертифікатами TLS або сертифікатами приватного ЦС. Вмикайте лише для серверів, які ви контролюєте. Це вимикає перевірку сертифікатів для всіх підключень.';

  @override
  String get settingsPrivacyAndSafetySection => 'КОНФІДЕНЦІЙНІСТЬ ТА БЕЗПЕКА';

  @override
  String get settingsBlockedRatings => 'Заблоковані рейтинги';

  @override
  String get settingsGeneralStyle => 'Загальний стиль';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Тематичні акценти, фони, індикатори спостереження та тематична музика';

  @override
  String get settingsDetailsScreen => 'Екран деталей';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Стиль, розмиття тла та поведінка вкладок';

  @override
  String get settingsHomePage => 'Домашня сторінка';

  @override
  String get settingsHomePageSubtitle =>
      'Розділи, типи зображень, накладання та попередній перегляд медіа';

  @override
  String get settingsLibrariesSubtitle =>
      'Видимість бібліотеки, перегляд папок і багатосерверна поведінка';

  @override
  String get settingsTwentyFourHourClock => '24-годинний формат';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Використовуйте 24-годинний формат часу всюди, де відображається годинник';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Показати кнопку перемішування на панелі навігації';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Показати кнопку жанрів на панелі навігації';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Показати кнопку вибраного на панелі навігації';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Показати кнопку бібліотек на панелі навігації';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Показувати кнопку Seerr на панелі навігації';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Завжди показувати текстові підписи у верхній панелі навігації';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Перемикання видимості домашньої сторінки для кожної бібліотеки. Перезапустіть Moonfin, щоб зміни набули чинності.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Медіапанель і локальні попередній перегляд';

  @override
  String get settingsVisualOverlays => 'Візуальні накладення';

  @override
  String get settingsSeasonalSurprise => 'Сезонний сюрприз';

  @override
  String get settingsMetadataAndRatings => 'Метадані та рейтинги';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase забезпечує інтеграцію на стороні сервера, включаючи додаткові джерела оцінок, запити Seerr і синхронізовані налаштування.';

  @override
  String get settingsOfflineDownloads => 'Офлайн-завантаження';

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
  String get settingsHigh => 'Високий';

  @override
  String get settingsLow => 'Низький';

  @override
  String get settingsCustomPath => 'Спеціальний шлях';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Введіть шлях до папки для завантаження';

  @override
  String get settingsConcurrentDownloads => 'Паралельні завантаження';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Максимальна кількість елементів для одночасного завантаження.';

  @override
  String get settingsAppInfo => 'ІНФОРМАЦІЯ ПРО ДОДАТОК';

  @override
  String get settingsReportAnIssue => 'Повідомити про проблему';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Відкрийте програму відстеження проблем на GitHub';

  @override
  String get settingsJoinDiscord => 'Приєднуйтесь до Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Спілкуйтеся зі спільнотою';

  @override
  String get settingsJoinTheDiscord => 'Приєднуйтесь до Discord';

  @override
  String get settingsSupportMoonfin => 'Підтримка Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Пригостіть розробника кавою';

  @override
  String get settingsLegal => 'ЮРИДИЧНИЙ';

  @override
  String get settingsLicenses => 'Ліцензії';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Повідомлення про ліцензію на відкрите програмне забезпечення';

  @override
  String get settingsPrivacyPolicy => 'Політика конфіденційності';

  @override
  String get settingsPrivacyPolicySubtitle => 'Як Moonfin обробляє ваші дані';

  @override
  String get settingsCheckForUpdates => 'Перевірте наявність оновлень';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Перевірте останню версію Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Технологія Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ліцензійного повідомлення',
      many: '# ліцензійних повідомлень',
      few: '# ліцензійні повідомлення',
      one: '# ліцензійне повідомлення',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Обидва';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Перемішати фільтр типу вмісту';

  @override
  String get settingsVideoPlaybackPreferences => 'Параметри відтворення відео';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Основний механізм обробки відео та налаштування якості потокового передавання';

  @override
  String get settingsAudioPreferences => 'Параметри звуку';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Параметри звукових доріжок, обробки та пропуску';

  @override
  String get settingsAutomationAndQueue => 'Автоматизація та черга';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматичне відтворення та секвенування';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Якість завантаження, обмеження пам’яті та розмір черги';

  @override
  String get settingsSyncplaySubtitle =>
      'Логіка синхронізації для групових сеансів';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Спеціалізовані функції гравця. Використовуйте з обережністю, оскільки деякі параметри можуть спричинити проблеми з відтворенням';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Пропустити введення та завершення?';

  @override
  String get settingsMediaSegmentCountdown => 'Відлік медіасегментів';

  @override
  String get settingsProgressBar => 'Смуга прогресу';

  @override
  String get settingsTimer => 'Таймер';

  @override
  String get settingsNone => 'Немає';

  @override
  String get settingsPromptUser => 'Підказка користувача';

  @override
  String get settingsSkip => 'Пропустити';

  @override
  String get settingsDoNothing => 'Нічого не робити';

  @override
  String get settingsMaxBitrateDescription =>
      'Обмежте бітрейт потокової передачі. Вміст, що перевищує цей поріг, буде перекодовано відповідно до розміру.';

  @override
  String get settingsMaxResolutionDescription =>
      'Обмежте максимальну роздільну здатність, яку запитує гравець. Вміст із вищою роздільною здатністю буде перекодовано вниз.';

  @override
  String get settingsPlayerZoomDescription =>
      'Як масштабувати відео, щоб воно відповідало розміру екрана.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Система відтворення (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Виберіть механізм відтворення за умовчанням на пристроях Android TV. Зміни застосовуються до наступного сеансу відтворення.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (рекомендовано)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (застаріле)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (застаріле)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (рекомендовано)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Запасний варіант';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Поведінка заголовків Dolby Vision на пристроях без декодування Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Запитуйте кожного разу';

  @override
  String get settingsPreferHdr10Fallback =>
      'Віддайте перевагу резервному варіанту HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Віддати перевагу перекодування сервера';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Профіль 7 Пряма гра';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Контролює, чи повинні потоки рівня покращення Dolby Vision направляти відтворення.';

  @override
  String get settingsAutoAftkrtEnabled => 'Автоматично (увімкнено AFTKRT)';

  @override
  String get settingsEnabledOnThisDevice => 'Увімкнено на цьому пристрої';

  @override
  String get settingsDisabledPreferTranscode =>
      'Вимкнено (бажано перекодувати)';

  @override
  String get settingsResumeRewindDescription =>
      'На скільки секунд слід перемотати назад під час відновлення відтворення (зі сторінки «Продовжити перегляд» або сторінки медіафайлу)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'На скільки секунд потрібно перемотати назад при відновленні відтворення після натискання кнопки паузи?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Через скільки секунд повернутися назад після натискання кнопки перемотування.';

  @override
  String get settingsOneSecond => '1 секунда';

  @override
  String get settingsThreeSeconds => '3 секунди';

  @override
  String get settingsFortyFiveSeconds => '45 секунд';

  @override
  String get settingsSixtySeconds => '60 секунд';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Скільки секунд потрібно перейти вперед після натискання кнопки швидкого переходу вперед.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 на зовнішній декодер';

  @override
  String get settingsCinemaMode => 'Режим кіно';

  @override
  String get settingsCinemaModeSubtitle =>
      'Відтворюйте трейлери/попередні ролики перед головною функцією';

  @override
  String get settingsNextUpDisplayDescription =>
      'Розширено показує повну картку з обкладинкою епізоду та описом. Мінімальний показує компактне накладання зворотного відліку. Вимкнено повністю приховує підказку.';

  @override
  String get settingsShort => 'Короткий';

  @override
  String get settingsLong => 'довгий';

  @override
  String get settingsVeryLong => 'Дуже довго';

  @override
  String get settingsVideoStartDelay => 'Затримка запуску відео';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value мс';
  }

  @override
  String get settingsLiveTvDirect => 'Пряме ТБ';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Увімкніть пряме відтворення для прямого телебачення';

  @override
  String get settingsOpenGroups => 'Відкрийте групи';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Створюйте SyncPlay групи, приєднуйтеся до них або керуйте ними';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Увімкнено';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Увімкнути функції групового перегляду';

  @override
  String get settingsSyncplayButton => 'SyncPlay Кнопка';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Показати кнопку SyncPlay на панелі навігації';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Розширене виправлення';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Увімкнути детальну логіку синхронізації';

  @override
  String get settingsSyncplaySyncCorrection => 'Корекція синхронізації';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Автоматично налаштовуйте відтворення, щоб підтримувати синхронізацію';

  @override
  String get settingsSyncplaySpeedToSync => 'Швидкість синхронізації';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Використовуйте регулювання швидкості відтворення для синхронізації';

  @override
  String get settingsSyncplaySkipToSync => 'Перейти до синхронізації';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Використовуйте пошук для синхронізації';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Мінімальна затримка швидкості';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Затримка максимальної швидкості';

  @override
  String get settingsSyncplaySpeedDuration => 'Швидкість Тривалість';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Мінімальна затримка пропуску';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Додаткове зміщення';

  @override
  String get onNow => 'Зараз';

  @override
  String get collections => 'Колекції';

  @override
  String get lastPlayed => 'Остання гра';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Останні $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Нещодавно вийшло: $libraryName';
  }

  @override
  String get autoplayNextEpisode =>
      'Автоматичне відтворення наступного епізоду';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Автоматично відтворювати наступний епізод, коли він доступний.';

  @override
  String get skipSilenceTitle => 'Пропустити тишу';

  @override
  String get skipSilenceSubtitle =>
      'Автоматично пропускати тихі сегменти аудіо, якщо це підтримується потоком.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Дозволити зовнішні звукові ефекти';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Дозволити програмам еквалайзера та ефектів (наприклад, Wavelet) приєднуватися до Media3 сеансів відтворення.';

  @override
  String get disableTunnelingTitle => 'Вимкнути тунелювання';

  @override
  String get disableTunnelingSubtitle =>
      'Примусове нетунельоване відтворення. Корисно на пристроях з розривами аудіо/відео тунелювання.';

  @override
  String get enableTunnelingTitle => 'Увімкнути тунелювання';

  @override
  String get enableTunnelingSubtitle =>
      'Для досвідчених. Спрямовує аудіо та відео через спарений апаратний шлях. Типово вимкнено, бо на деяких пристроях спричиняє випадання аудіо/відео.';

  @override
  String get mapDolbyVisionP7Title => 'Зіставте Dolby Vision профіль 7 із HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Відтворюйте Dolby Vision потоки профілю 7 як HDR10-сумісний HEVC на пристроях, які не підтримують DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Використовуйте вбудовані стилі субтитрів';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Застосуйте кольори, шрифти та позиціонування, вбудовані в доріжку субтитрів. Вимкніть, щоб замість цього використовувати ваші налаштування стилю підписів.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Використовуйте розміри вбудованих субтитрів';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Застосуйте підказки щодо розміру шрифту, вбудовані в доріжку субтитрів. Вимкніть використання розміру субтитрів у ваших налаштуваннях стилю.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Показувати деталі медіа';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Показувати деталі вибраного елемента вгорі сторінок бібліотеки.';

  @override
  String get hideBackdropsInLibraries => 'Приховувати тла під час перегляду?';

  @override
  String get useDetailedSubHeadings => 'Використовуйте детальні підзаголовки';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Показати детальний або мінімальний підрядок на сторінках бібліотеки.';

  @override
  String get savedThemesDeleteDialogTitle => 'Видалити збережену тему?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Видалити \"$themeName\" з кешу цього пристрою?';
  }

  @override
  String get themeStore => 'Магазин тем';

  @override
  String get themeStoreSubtitle => 'Переглядайте та зберігайте теми спільноти';

  @override
  String get themeStoreDescription =>
      'Збережіть тему, щоб користуватися нею, як іншими збереженими темами.';

  @override
  String get themeStoreEmpty => 'Наразі немає доступних тем.';

  @override
  String get themeStoreLoadFailed =>
      'Не вдалося завантажити Магазин тем. Перевірте підключення та спробуйте ще раз.';

  @override
  String get themeStoreSave => 'Зберегти';

  @override
  String get themeStoreSaveAndApply => 'Зберегти й застосувати';

  @override
  String get themeStoreSaved => 'Збережено';

  @override
  String get themeStoreInvalidMessage => 'Не вдалося завантажити цю тему.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Збережено «$themeName».';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Видалено \"$themeName\" з цього пристрою.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Не вдалося видалити \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Збережені теми';

  @override
  String get savedThemesDescription =>
      'Це теми, завантажені з плагіна Moonfin для поточного сервера. Видалення видаляє лише цю локальну копію.';

  @override
  String get savedThemesEmpty =>
      'Для цього сервера не знайдено збережених тем.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Наразі активний';
  }

  @override
  String get savedThemesDeleteTooltip => 'Видалити збережену тему';

  @override
  String get savedThemesManageSubtitle =>
      'Керуйте завантаженими темами плагінів на цьому пристрої';

  @override
  String get themeEditor => 'Редактор тем';

  @override
  String get themeEditorSubtitle =>
      'Відкрийте редактор тем Moonfin у своєму браузері';

  @override
  String get homeScreen => 'Головний екран';

  @override
  String get bottomBar => 'Нижня панель';

  @override
  String get homeRowsStyleClassic => 'класичний';

  @override
  String get homeRowsStyleModern => 'Сучасний';

  @override
  String get homeRowsSection => 'Домашні ряди';

  @override
  String get homeRowDisplay => 'Відображення рядків головної';

  @override
  String get homeRowSections => 'Розділи рядків головної';

  @override
  String get homeRowToggles => 'Перемикачі рядків головної';

  @override
  String get homeRowTogglesSubtitle =>
      'Увімкніть або вимкніть категорії рядків головної на основі бібліотек';

  @override
  String get homeRowTogglesDescription =>
      'Увімкніть наведені нижче перемикачі, щоб показувати рядки в розділах головної.';

  @override
  String get rowsType => 'Тип рядків';

  @override
  String get rowsTypeDescription =>
      'Classic зберігає тип зображення та накладення інформації для кожного рядка. У Modern використовуються рядки з портретом на фон.';

  @override
  String get displayFavoritesRows => 'Відображення рядків уподобань';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Показати улюблені фільми, серіали та інші улюблені рядки в головних розділах.';

  @override
  String get favoritesRowSorting => 'Сортування рядків вибраного';

  @override
  String get favoritesRowSortingDescription =>
      'Сортуйте рядки вибраного за датою додавання, датою випуску, за алфавітом тощо.';

  @override
  String get displayCollectionsRows => 'Відображення рядків колекцій';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Показувати рядки колекцій у розділах «Домашня сторінка».';

  @override
  String get collectionsRowSorting => 'Сортування рядків колекцій';

  @override
  String get collectionsRowSortingDescription =>
      'Сортуйте рядки колекцій за датою додавання, датою випуску, за алфавітом тощо.';

  @override
  String get displayGenresRows => 'Відображення рядків жанрів';

  @override
  String get displayGenresRowsSubtitle =>
      'Показати рядки жанрів у головних розділах.';

  @override
  String get genresRowSorting => 'Сортування рядків жанрів';

  @override
  String get genresRowSortingDescription =>
      'Сортуйте рядки жанрів за датою додавання, датою випуску, за алфавітом тощо.';

  @override
  String get genresRowItems => 'Елементи рядка жанрів';

  @override
  String get genresRowItemsDescription =>
      'Показувати фільми, серіали або обидва в рядках жанрів.';

  @override
  String get displayPlaylistsRows => 'Показувати рядки списків відтворення';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Показувати рядки списків відтворення в розділах головної.';

  @override
  String get playlistsRowSorting => 'Сортування рядків списків відтворення';

  @override
  String get playlistsRowSortingDescription =>
      'Сортуйте рядки списків відтворення за датою додавання, датою випуску, за алфавітом тощо.';

  @override
  String get displayAudioRows => 'Показувати аудіорядки';

  @override
  String get displayAudioRowsSubtitle =>
      'Показувати аудіорядки в розділах головної.';

  @override
  String get audioRowsSorting => 'Сортування аудіорядків';

  @override
  String get audioRowsSortingDescription =>
      'Сортуйте аудіорядки за датою додавання, датою випуску, за алфавітом тощо.';

  @override
  String get audioPlaylists => 'Аудіосписки відтворення';

  @override
  String get appearance => 'Зовнішній вигляд';

  @override
  String get layout => 'Макет';

  @override
  String get theme => 'Тема';

  @override
  String get keyboard => 'Клавіатура';

  @override
  String get navButtons => 'Кнопки';

  @override
  String get rendering => 'Рендеринг';

  @override
  String get mpvConfiguration => 'Конфігурація MPV';

  @override
  String get cardSize => 'Розмір картки';

  @override
  String get externalPlayerApp => 'Додаток зовнішнього плеєра';

  @override
  String get externalPlayerAppDescription =>
      'Установіть зовнішній програвач, щоб увімкнути відтворення довгим натисканням';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Показувати засіб вибору програм, коли починається відтворення.';

  @override
  String get loadingInstalledPlayers => 'Завантаження встановлених плеєрів...';

  @override
  String get connection => 'Підключення';

  @override
  String get audioTranscodeTarget => 'Мета транскодування аудіо';

  @override
  String get passthrough => 'Прохідний';

  @override
  String get supportedOnThisDevice => 'Підтримується на цьому пристрої';

  @override
  String get notSupportedOnThisDevice => 'Не підтримується на цьому пристрої';

  @override
  String get settingsAudioDtsXPassthrough => 'Передача DTS:X (DTS UHD).';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Бітовий потік DTS:X (DTS UHD) на зовнішній декодер.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD із Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Поведінка медіаплеєра';

  @override
  String get playbackEnhancements => 'Покращення відтворення';

  @override
  String get alwaysOn => 'Завжди ввімкнено.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Замініть Skip Outro на Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Показати накладення Next Up замість кнопки Skip Outro.';

  @override
  String get playerRouting => 'Маршрутизація гравців';

  @override
  String get preferSoftwareDecoders =>
      'Віддавайте перевагу програмним декодерам';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Використовуйте FFmpeg (аудіо) і libgav1 (AV1) перед апаратними декодерами. Вимкніть, якщо порушується передача аудіо HDMI.';

  @override
  String get useExternalPlayer => 'Використовуйте зовнішній плеєр';

  @override
  String get useExternalPlayerSubtitle =>
      'Відкрийте відтворення відео у вибраній зовнішній програмі на Android TV.';

  @override
  String get automaticQueuing => 'Автоматична черга';

  @override
  String get preferSdhSubtitles => 'Віддавайте перевагу субтитрам SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Пріоритезуйте доріжки субтитрів SDH/CC під час автоматичного вибору.';

  @override
  String get webDiagnostics => 'Веб-діагностика';

  @override
  String get webDiagnosticsTitle => 'Moonfin Веб-діагностика';

  @override
  String get webDiagnosticsIntro =>
      'Використовуйте цю сторінку, щоб діагностувати проблеми з підключенням браузера (CORS, змішаний вміст і налаштування виявлення).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Виявлена ​​помилка зі змішаним вмістом';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Виявлено збій CORS/Preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin виявив сторінку HTTPS, яка намагається викликати URL-адресу сервера HTTP. Браузери блокують цей запит до того, як він досягне вашого сервера.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin виявлено помилку запиту на рівні браузера, яка зазвичай спричинена відсутністю CORS або заголовків попередньої перевірки на медіа-сервері.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Цільова URL-адреса: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Деталі: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Поточний контекст виконання';

  @override
  String get webDiagnosticsOrigin => 'Походження';

  @override
  String get webDiagnosticsScheme => 'схема';

  @override
  String get webDiagnosticsPluginMode => 'Режим плагіна';

  @override
  String get webDiagnosticsWebRtcScan => 'Сканування WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'Примусова URL-адреса сервера';

  @override
  String get webDiagnosticsDefaultServerUrl =>
      'URL-адреса сервера за замовчуванням';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'URL-адреса проксі-сервера виявлення';

  @override
  String get notConfigured => 'не налаштовано';

  @override
  String get webDiagnosticsMixedContent => 'Змішаний вміст';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ця сторінка завантажується через HTTPS, але одна або кілька налаштованих URL-адрес є HTTP. Браузери блокують HTTPS-сторінки від викликів HTTP API.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Виправлення: обслуговуйте свій медіа-сервер або кінцеву точку проксі через HTTPS або завантажуйте Moonfin через HTTP лише в надійних локальних мережах.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'З поточних налаштувань середовища виконання не виявлено явної конфігурації змішаного вмісту.';

  @override
  String get webDiagnosticsCorsChecklist => 'Контрольний список CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Дозволити джерело браузера в Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Додайте авторизацію, X-Emby-авторизацію та X-Emby-токен у Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Відкрийте Content-Range і Accept-Ranges для потокової передачі та поведінки пошуку.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Повернути 204 до OPTIONS запитів перед друком.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Приклад фрагмента заголовка (стиль nginx)';

  @override
  String get note => 'Примітка';

  @override
  String get webDiagnosticsNonWebNote =>
      'Цей маршрут діагностики призначений для веб-складання. Якщо ви бачите це на іншій платформі, ці перевірки можуть не застосовуватися.';

  @override
  String get backToServerSelect => 'Назад до сервера Виберіть';

  @override
  String get signOutAllUsers => 'Вийти з усіх користувачів';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Дозвіл на мікрофон назавжди заборонено. Увімкніть його в налаштуваннях системи.';

  @override
  String get voiceSearchPermissionRequired =>
      'Для голосового пошуку потрібен доступ до мікрофона.';

  @override
  String get voiceSearchNoMatch => 'Не зрозумів. Спробуйте знову.';

  @override
  String get voiceSearchNoSpeechDetected => 'Мовлення не виявлено.';

  @override
  String get voiceSearchMicrophoneError => 'Помилка мікрофона.';

  @override
  String get voiceSearchNeedsInternet =>
      'Для голосового пошуку потрібен Інтернет.';

  @override
  String get voiceSearchServiceBusy =>
      'Голосовий сервіс зайнятий. Спробуйте знову.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Дозвіл на мікрофон назавжди заборонено.';

  @override
  String get microphonePermissionDenied => 'У дозволі на мікрофон відмовлено.';

  @override
  String get speechRecognitionUnavailable =>
      'Розпізнавання мовлення недоступне на цьому пристрої.';

  @override
  String get openIosRoutePicker => 'Відкрийте засіб вибору маршруту iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay засіб вибору маршруту недоступний на цьому пристрої.';

  @override
  String get videos => 'Відео';

  @override
  String get programs => 'Програми';

  @override
  String get songs => 'Пісні';

  @override
  String get photoAlbums => 'Фотоальбоми';

  @override
  String get photos => 'Фотографії';

  @override
  String get people => 'люди';

  @override
  String get recentlyReleasedEpisodes => 'Нещодавно випущені епізоди';

  @override
  String get watchAgain => 'Дивіться ще раз';

  @override
  String get guestAppearances => 'Виступ гостей';

  @override
  String get appearancesSeerr => 'Поява (Seerr)';

  @override
  String get crewContributionsSeerr => 'Внесок знімальної групи (Seerr)';

  @override
  String get watchWithGroup => 'Дивіться з групою';

  @override
  String get errors => 'Помилки';

  @override
  String get warnings => 'Попередження';

  @override
  String get disk => 'диск';

  @override
  String get openInBrowser => 'Відкрити в браузері';

  @override
  String get embeddedBrowserNotAvailable =>
      'Вбудований браузер недоступний на цій платформі.';

  @override
  String get adminRestartServerConfirmation =>
      'Ви впевнені, що бажаєте перезапустити сервер?';

  @override
  String get adminShutdownServerConfirmation =>
      'Ви впевнені, що хочете вимкнути сервер? Вам потрібно буде перезапустити його вручну.';

  @override
  String get internal => 'внутрішній';

  @override
  String get idle => 'Бездіяльність';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Користувачів не знайдено';

  @override
  String get adminNoUsersMatchSearch =>
      'Жоден користувач не відповідає вашому запиту';

  @override
  String get adminNoDevicesFound => 'Пристроїв не знайдено';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Жоден пристрій не відповідає поточним фільтрам';

  @override
  String get passwordSet => 'Встановлено пароль';

  @override
  String get noPasswordConfigured => 'Пароль не налаштовано';

  @override
  String get remoteAccess => 'Віддалений доступ';

  @override
  String get localOnly => 'Тільки місцеві';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Не вдалося завантажити медіааналітику';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Об’єднана аналітика для всіх медіабібліотек.';

  @override
  String get analyticsTopArtists => 'Найкращі виконавці';

  @override
  String get analyticsTopAuthors => 'Найкращі автори';

  @override
  String get analyticsTopContributors => 'Найкращі учасники';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count бібліотеки',
      many: '$count бібліотек',
      few: '$count бібліотеки',
      one: '$count бібліотека',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Для цього вибору ще немає доступних проіндексованих медіа-сум.';

  @override
  String get analyticsLibraryDetails => 'Відомості про бібліотеку';

  @override
  String get analyticsLibraryBreakdown => 'Розбивка бібліотеки';

  @override
  String get analyticsNoLibrariesAvailable => 'Немає доступних бібліотек.';

  @override
  String get adminServerAdministrationTitle => 'Адміністрування сервера';

  @override
  String get adminServerPathData => 'дані';

  @override
  String get adminServerPathImageCache => 'Кеш зображень';

  @override
  String get adminServerPathCache => 'Кеш';

  @override
  String get adminServerPathLogs => 'Журнали';

  @override
  String get adminServerPathMetadata => 'Метадані';

  @override
  String get adminServerPathTranscode => 'Перекодувати';

  @override
  String get adminServerPathWeb => 'Інтернет';

  @override
  String get adminNoServerPathsReturned =>
      'Цей сервер не повертає шляхи до сервера.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% використано';
  }

  @override
  String get userActivity => 'Активність користувача';

  @override
  String get systemEvents => 'Системні події';

  @override
  String get needsAttention => 'Потребує уваги';

  @override
  String get adminDrawerSectionServer => 'Сервер';

  @override
  String get adminDrawerSectionPlayback => 'Відтворення';

  @override
  String get adminDrawerSectionDevices => 'Пристрої';

  @override
  String get adminDrawerSectionAdvanced => 'Просунутий';

  @override
  String get adminDrawerSectionPlugins => 'Плагіни';

  @override
  String get adminDrawerSectionLiveTv => 'Пряме телебачення';

  @override
  String get homeVideos => 'Домашнє відео';

  @override
  String get mixedContent => 'Змішаний вміст';

  @override
  String get homeVideosAndPhotos => 'Домашнє відео та фото';

  @override
  String get mixedMoviesAndShows => 'Змішані фільми та шоу';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Записів не знайдено';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'В архіві .$extension не знайдено сторінок із зображеннями.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Помилка вбудованого рендерера ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Помилка візуалізації EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Відсутній локальний файл для читача: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status під час відкриття даних книги з $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Немає доступної кінцевої точки читаної книги';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Непідтримуваний формат архіву коміксів: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Плагін вилучення CBR недоступний на цій платформі.';

  @override
  String get failedToExtractCbrArchive => 'Не вдалося розпакувати архів .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Видобуток CB7 недоступний на цій платформі.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Плагін вилучення CB7 недоступний на цій платформі.';

  @override
  String get closeGenrePanel => 'Закрити панель жанрів';

  @override
  String get loadingShuffle => 'Завантаження перемішування...';

  @override
  String get libraryShuffleLabel => 'ПЕРЕМІШУВАННЯ БІБЛІОТЕКИ';

  @override
  String get randomShuffleLabel => 'ВИПАДКОВЕ ПЕРЕМІШУВАННЯ';

  @override
  String get genresShuffleLabel => 'ПЕРЕМІШУВАННЯ ЖАНРІВ';

  @override
  String get autoHdrSwitching => 'Автоматичне перемикання HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Автоматично вмикайте HDR для відтворення відео HDR і відновлюйте режим відображення після виходу.';

  @override
  String get whenFullscreen => 'У повноекранному режимі';

  @override
  String get changeArtwork => 'Змінити обкладинку';

  @override
  String get missing => 'Відсутнє';

  @override
  String get transcodingLimits => 'Обмеження перекодування';

  @override
  String get clearAllArtworkButton => 'Очистити всі обкладинки?';

  @override
  String get clearAllArtworkWarning =>
      'Ви впевнені, що хочете очистити всі завантажені обкладинки?';

  @override
  String get confirmClear => 'Підтвердити очищення';

  @override
  String confirmClearMessage(String itemType) {
    return 'Ви впевнені, що хочете очистити це зображення ($itemType)?';
  }

  @override
  String get uploadButton => 'Вивантажити?';

  @override
  String get resolutionLabel => 'Роздільна здатність: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Показувати лише обкладинки мовою інтерфейсу';

  @override
  String get confirmClearAll => 'Підтвердити очищення всього';

  @override
  String get imageUploadSuccess => 'Зображення успішно вивантажено!';

  @override
  String imageUploadFailed(String error) {
    return 'Не вдалося вивантажити зображення: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Не вдалося встановити зображення: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Не вдалося видалити зображення: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Не вдалося очистити всі обкладинки: $error';
  }

  @override
  String get yes => 'Так';

  @override
  String get posterCategory => 'Постер';

  @override
  String get backdropsCategory => 'Тла';

  @override
  String get bannerCategory => 'Банер';

  @override
  String get logoCategory => 'Логотип';

  @override
  String get thumbnailCategory => 'Мініатюра';

  @override
  String get artCategory => 'Ілюстрація';

  @override
  String get discArtCategory => 'Зображення диска';

  @override
  String get screenshotCategory => 'Знімок екрана';

  @override
  String get boxCoverCategory => 'Обкладинка коробки';

  @override
  String get boxRearCoverCategory => 'Задня обкладинка коробки';

  @override
  String get menuArtCategory => 'Ілюстрація меню';

  @override
  String get confirmItemPoster => 'постер';

  @override
  String get confirmItemBackdrop => 'тло';

  @override
  String get confirmItemBanner => 'банер';

  @override
  String get confirmItemLogo => 'логотип';

  @override
  String get confirmItemThumbnail => 'мініатюра';

  @override
  String get confirmItemArt => 'ілюстрація';

  @override
  String get confirmItemDiscArt => 'зображення диска';

  @override
  String get confirmItemScreenshot => 'знімок екрана';

  @override
  String get confirmItemBoxCover => 'обкладинка коробки';

  @override
  String get confirmItemBoxRearCover => 'задня обкладинка коробки';

  @override
  String get confirmItemMenuArt => 'ілюстрація меню';

  @override
  String get resolutionAll => 'Усі';

  @override
  String get resolutionHigh => 'Висока (1080p+)';

  @override
  String get resolutionMedium => 'Середня (720p)';

  @override
  String get resolutionLow => 'Низька (<720p)';

  @override
  String get sources => 'Джерела';

  @override
  String get audiobookChapters => 'Розділи';

  @override
  String get audiobookBookmarks => 'Закладки';

  @override
  String get audiobookNotes => 'Нотатки';

  @override
  String get audiobookQueue => 'Черга';

  @override
  String get audiobookTimeline => 'Хронологія';

  @override
  String get audiobookTimelineEmpty => 'Хронологія порожня';

  @override
  String get audiobookWholeBook => 'Уся книга';

  @override
  String get audiobookFocusedTimeline => 'Сфокусована хронологія';

  @override
  String get audiobookExportBookmarks => 'Експортувати закладки';

  @override
  String get audiobookExportNotes => 'Експортувати нотатки';

  @override
  String get audiobookExportAll => 'Експортувати все';

  @override
  String audiobookExportSuccess(String path) {
    return 'Експортовано до $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Помилка експорту: $error';
  }

  @override
  String get audiobookLyrics => 'Текст';

  @override
  String get audiobookAddBookmark => 'Додати закладку';

  @override
  String get audiobookAddNote => 'Додати нотатку';

  @override
  String get audiobookEditNote => 'Редагувати нотатку';

  @override
  String get audiobookNoteHint => 'Напишіть нотатку для цього моменту';

  @override
  String get audiobookSleepTimer => 'Таймер сну';

  @override
  String get audiobookSleepOff => 'Вимкнено';

  @override
  String get audiobookSleepEndOfChapter => 'Кінець розділу';

  @override
  String get audiobookSleepCustom => 'Власний';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Залишилось $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хв',
      one: '1 хв',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Швидкість відтворення';

  @override
  String get audiobookRemainingTime => 'Залишилось';

  @override
  String get audiobookElapsedTime => 'Минуло';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Назад $seconds с';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Вперед $seconds с';
  }

  @override
  String get audiobookPreviousChapter => 'Попередній розділ';

  @override
  String get audiobookNextChapter => 'Наступний розділ';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Розділ $current з $total';
  }

  @override
  String get audiobookNoChapters => 'Немає розділів';

  @override
  String get audiobookNoBookmarks => 'Поки що немає закладок';

  @override
  String get audiobookNoNotes => 'Поки що немає нотаток';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Закладку додано на $position';
  }

  @override
  String get audiobookSpeedReset => 'Скинути до 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Зберегти';

  @override
  String get audiobookCancel => 'Скасувати';

  @override
  String get audiobookDelete => 'Видалити';

  @override
  String get subtitlePreferences => 'Параметри субтитрів';

  @override
  String get subtitlePreferencesDescription =>
      'Змініть режими субтитрів, типові мови, вигляд і параметри рендерингу.';

  @override
  String get subtitleRendering => 'Рендеринг субтитрів';

  @override
  String get displayOptions => 'Параметри відображення';

  @override
  String get releaseDateAscending => 'Дата виходу (за зростанням)';

  @override
  String get releaseDateDescending => 'Дата виходу (за спаданням)';

  @override
  String get groupContributions => 'Групувати внески';

  @override
  String get groupMultipleRoles => 'Групувати кілька ролей';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Попередження про доступ на запис до бібліотеки';

  @override
  String get libraryWriteAccessHowToFix => 'Як це виправити:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Надайте службовому користувачу Jellyfin (напр., jellyfin або PUID/PGID у Docker) права на запис до тек вашої медіабібліотеки на сервері.\n\n2. Або відкрийте Jellyfin Dashboard -> Libraries, відредагуйте цю бібліотеку та вимкніть параметр «Save artwork into media folders», щоб зберігати обкладинки у внутрішній базі даних Jellyfin.';

  @override
  String get dismiss => 'Закрити';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Вашу бібліотеку «$libraryName» налаштовано зберігати обкладинки безпосередньо в теках медіа (параметр «Save artwork into media folders» увімкнено). Проте Jellyfin перевірив доступ на запис і не має дозволу записувати файли до цього каталогу:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Схоже, Jellyfin не вдалося оновити обкладинку. Вашу бібліотеку налаштовано зберігати обкладинки безпосередньо в теках медіа (параметр «Save artwork into media folders» увімкнено). Ця помилка зазвичай виникає, коли процес сервера Jellyfin не має дозволу записувати файли до ваших каталогів медіа.';

  @override
  String get externalLists => 'Зовнішні списки';

  @override
  String get replay => 'Відтворити знову';

  @override
  String get fileInformation => 'Інформація про файл';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Розмір: $size  •  Формат: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Показати всі аудіодоріжки ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Показати всі доріжки субтитрів ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Перевірка можливості прямого відтворення...';

  @override
  String get directPlayCapabilityLabel => 'Можливість прямого відтворення: ';

  @override
  String get forced => 'Примусові';

  @override
  String get transcodeContainerNotSupported =>
      'Формат контейнера не підтримується програвачем.';

  @override
  String get transcodeVideoCodecNotSupported => 'Відеокодек не підтримується.';

  @override
  String get transcodeAudioCodecNotSupported => 'Аудіокодек не підтримується.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Формат субтитрів не підтримується (потребує вшивання).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Аудіопрофіль не підтримується.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Відеопрофіль не підтримується.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Рівень відео не підтримується.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Роздільна здатність відео не підтримується цим пристроєм.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Глибина кольору відео не підтримується.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Частота кадрів відео не підтримується.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Бітрейт файлу перевищує ліміт потоку програвача.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Бітрейт відео перевищує ліміт потоку.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Бітрейт аудіо перевищує ліміт потоку.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Кількість аудіоканалів не підтримується.';

  @override
  String get sortAlphabetical => 'За алфавітом';

  @override
  String get sortReleaseAscending => 'Порядок виходу (за зростанням)';

  @override
  String get sortReleaseDescending => 'Порядок виходу (за спаданням)';

  @override
  String get sortCustomDragDrop => 'Власний (перетягуванням)';

  @override
  String get playlistSortOptions => 'Параметри сортування списку відтворення';

  @override
  String get resetSort => 'Скинути сортування';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Переглянути знову С$season:Е$episode';
  }

  @override
  String get rewatchPlaylist => 'Переглянути список відтворення знову';

  @override
  String get noSubtitlesFound => 'Субтитрів не знайдено.';

  @override
  String get adminControls => 'Керування адміністратора';

  @override
  String get impellerRendering => 'Рушій рендерингу (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller — це сучасний GPU-рендерер Flutter для плавніших анімацій і меншого підгальмовування. На деяких ТВ-боксах і старих GPU він може спричиняти артефакти або чорне відео; вимкніть його, якщо це помітите. «Автоматично» добирає найкраще значення для вашого пристрою. Перезапустіть Moonfin, щоб застосувати.';

  @override
  String get impellerAuto => 'Автоматично';

  @override
  String get impellerOn => 'Увімкнено';

  @override
  String get impellerOff => 'Вимкнено';

  @override
  String get impellerRestartTitle => 'Потрібен перезапуск';

  @override
  String get impellerRestartMessage =>
      'Moonfin потрібно перезапустити, щоб змінити рушій рендерингу. Закрийте програму зараз, а потім відкрийте її знову, щоб застосувати зміни.';

  @override
  String get impellerCloseNow => 'Закрити програму зараз';

  @override
  String get adminRefreshLibrary => 'Оновити бібліотеку';

  @override
  String get adminRefreshAllLibraries => 'Оновити всі бібліотеки';

  @override
  String get adminRepoSortDateOldest => 'Дата додавання (спочатку старі)';

  @override
  String get adminRepoSortDateNewest => 'Дата додавання (спочатку нові)';

  @override
  String get adminRepoSortNameAsc => 'За алфавітом (А–Я)';

  @override
  String get adminRepoSortNameDesc => 'За алфавітом (Я–А)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Завантаження аналітики сервера... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Як у джерелі';

  @override
  String get imdbTop250Movies => 'IMDb Топ-250 фільмів';

  @override
  String get imdbTop250TvShows => 'IMDb Топ-250 серіалів';

  @override
  String get imdbMostPopularMovies => 'IMDb Найпопулярніші фільми';

  @override
  String get imdbMostPopularTvShows => 'IMDb Найпопулярніші серіали';

  @override
  String get imdbLowestRatedMovies => 'IMDb Фільми з найнижчим рейтингом';

  @override
  String get imdbTopEnglishMovies => 'IMDb Найкращі англомовні фільми';
}
