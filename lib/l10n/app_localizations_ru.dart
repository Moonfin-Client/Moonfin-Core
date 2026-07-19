// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'НАСТРОЙКИ АККАУНТА';

  @override
  String get interfaceLanguage => 'Язык интерфейса';

  @override
  String get systemLanguageDefault => 'Как в системе';

  @override
  String get signIn => 'Войти';

  @override
  String get empty => 'Пусто';

  @override
  String connectingToServer(String serverName) {
    return 'Подключение к $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Пароль';

  @override
  String get username => 'Имя пользователя';

  @override
  String get email => 'Электронная почта';

  @override
  String get quickConnectInstruction =>
      'Введите этот код на веб-панели вашего сервера:';

  @override
  String get waitingForAuthorization => 'Ожидание авторизации...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Сервер недоступен';

  @override
  String get loginFailed => 'Ошибка входа';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect недоступен: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect недоступен ($status): $detail';
  }

  @override
  String get whosWatching => 'Кто смотрит?';

  @override
  String get addUser => 'Добавить пользователя';

  @override
  String get selectServer => 'Выберите сервер';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin версии $version';
  }

  @override
  String get savedServers => 'Сохраненные серверы';

  @override
  String get discoveredServers => 'Обнаруженные серверы';

  @override
  String get noneFound => 'Ничего не найдено';

  @override
  String get unableToConnectToServer => 'Невозможно подключиться к серверу';

  @override
  String get addServer => 'Добавить сервер';

  @override
  String get embyConnect => 'Emby Подключиться';

  @override
  String get removeServer => 'Удалить сервер';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Удалить «$serverName» из списка серверов?';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get remove => 'Удалить';

  @override
  String get connectToServer => 'Подключиться к серверу';

  @override
  String get serverAddress => 'Адрес сервера';

  @override
  String get serverAddressHint => 'https://ваш-сервер.example.com';

  @override
  String get connect => 'Соединять';

  @override
  String get secureStorageUnavailable => 'Безопасное хранилище недоступно';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin не удалось получить доступ к вашему системному набору ключей. Вход в систему может быть продолжен, но безопасное хранилище токенов может быть недоступно, пока брелок не будет разблокирован.';

  @override
  String get ok => 'ХОРОШО';

  @override
  String get settingsAppearanceTheme => 'Тема приложения';

  @override
  String get detailScreenStyle => 'Стиль экрана сведений';

  @override
  String get detailScreenStyleSubtitle =>
      '«Классический» — исходная центрированная компоновка Moonfin. «Современный» — адаптивная кинематографичная компоновка.';

  @override
  String get detailScreenStyleMoonfin => 'Классический';

  @override
  String get detailScreenStyleModern => 'Современный';

  @override
  String get expandedTabs => 'Развёрнутые вкладки';

  @override
  String get expandedTabsSubtitle =>
      'Автоматически показывать содержимое вкладки при её выборе. Отключите, чтобы открывать и закрывать вкладки вручную.';

  @override
  String get showTechnicalDetails => 'Показывать технические сведения?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Показывать кодек, разрешение и сведения о потоке в сводке баннера';

  @override
  String get recommendationSystem => 'Система рекомендаций';

  @override
  String get recommendationSystemSubtitle =>
      'Использовать алгоритм локальной библиотеки «Moonfin рекомендует» или онлайн-метрики схожести TMDb. Примечание: для онлайн-рекомендаций нужна интеграция с Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin рекомендует';

  @override
  String get recommendationSystemTmdb => 'Схожесть TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Ограничивать по возрастному рейтингу?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Ограничивать подборку «Moonfin рекомендует» возрастным рейтингом выбранного медиа';

  @override
  String get interfaceStyle => 'Стиль интерфейса';

  @override
  String get interfaceStyleSubtitle =>
      '«Автоматически» подстраивается под ваше устройство. Выберите Apple или Material, чтобы задать вид принудительно.';

  @override
  String get interfaceStyleAutomatic => 'Автоматически';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Качество стекла';

  @override
  String get glassQualitySubtitle =>
      '«Авто» подбирает лучший эффект стекла для этого устройства. «Полное» включает настоящее размытие, «Упрощённое» — облегчённое стекло, экономящее ресурсы GPU.';

  @override
  String get glassQualityAuto => 'Авто';

  @override
  String get glassQualityFull => 'Полное';

  @override
  String get glassQualityReduced => 'Упрощённое';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Переключайтесь между Moonfin и Neon Pulse, не перезапуская приложение.';

  @override
  String get customThemeTitle => 'Своя тема';

  @override
  String get customThemeSubtitle =>
      'Пользовательские темы меняют оформление во всём Moonfin. Выберите вариант на свой вкус.';

  @override
  String get keyboardPreferSystemIme => 'Системная клавиатура';

  @override
  String get keyboardPreferSystemImeDescription =>
      'По умолчанию использовать способ ввода устройства для набора текста';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Текущий образ Moonfin, который вам всем полюбился';

  @override
  String get themeNeonPulse => 'Неоновый Пульс';

  @override
  String get themeNeonPulseSubtitle =>
      'Стиль Synthwave с пурпурным свечением, голубым текстом и более сильным хромированным контрастом.';

  @override
  String get themeGlass => 'Стекло';

  @override
  String get themeGlassSubtitle =>
      'Оформление в стиле жидкого стекла: плавающий градиентный фон, матовые поверхности и синий акцент Apple';

  @override
  String get theme8BitHero => '8-битный герой';

  @override
  String get theme8BitHeroSubtitle =>
      'Ретро-оформление в стиле пиксель-арта: контрастная палитра, блочные рамки, резкие тени и пиксельный шрифт';

  @override
  String get embyConnectSignInSubtitle =>
      'Войдите в свою учетную запись Emby Connect.';

  @override
  String get emailOrUsername => 'Электронная почта или имя пользователя';

  @override
  String get selectAServer => 'Выберите сервер';

  @override
  String get tryAgain => 'Попробуйте еще раз';

  @override
  String get noLinkedServers =>
      'Нет серверов, связанных с этой учетной записью Emby Connect.';

  @override
  String get invalidEmbyConnectCredentials =>
      'Неверные учетные данные Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Неверное имя пользователя или пароль Emby Connect.';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сервер не поддерживает обмен Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Ошибка сети при обращении к Emby Connect или выбранному серверу';

  @override
  String get loadingLinkedServers => 'Загрузка связанных серверов...';

  @override
  String get connectingToServerEllipsis => 'Подключение к серверу...';

  @override
  String get noReachableAddress => 'Не указан доступный адрес';

  @override
  String get invalidServerExchangeResponse =>
      'Неверный ответ от конечной точки обмена сервером';

  @override
  String unableToConnectTo(String target) {
    return 'Не удалось подключиться к $target';
  }

  @override
  String get exitApp => 'Выход из Moonfin?';

  @override
  String get exitAppConfirmation => 'Вы уверены, что хотите выйти?';

  @override
  String get exit => 'Выход';

  @override
  String get gameMenu => 'Меню';

  @override
  String get gamePaused => 'Пауза';

  @override
  String get gameSaveState => 'Сохранить состояние';

  @override
  String get games => 'Игры';

  @override
  String get gameLoadState => 'Загрузить состояние';

  @override
  String get gameFastForward => 'Ускорение';

  @override
  String get gameEmulatorSettings => 'Настройки эмулятора';

  @override
  String get gameNoCoreOptions => 'У этого ядра нет настраиваемых параметров.';

  @override
  String get gameHoldToOpenMenu => 'Удерживайте, чтобы открыть меню';

  @override
  String get gamePlaybackUnsupported =>
      'Запуск игр пока не поддерживается на этом устройстве.';

  @override
  String get noHomeRowsLoaded => 'Не удалось загрузить ни одну главную строку.';

  @override
  String get noHomeRowsHint =>
      'Попробуйте обновить или уменьшить количество активных разделов главной страницы.';

  @override
  String get retryHomeRows => 'Повторить исходные строки';

  @override
  String get guide => 'Гид';

  @override
  String get recordings => 'Записи';

  @override
  String get schedule => 'Расписание';

  @override
  String get series => 'Сериалы';

  @override
  String get noItemsFound => 'Элементы не найдены';

  @override
  String get home => 'Главная';

  @override
  String get browseAll => 'Просмотреть все';

  @override
  String get genres => 'Жанры';

  @override
  String get collectionPlaceholder => 'Здесь появятся предметы коллекции';

  @override
  String get browseByLetter => 'Просмотр по буквам';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Здесь появится алфавитный просмотр';

  @override
  String get suggestions => 'Предложения';

  @override
  String get suggestionsPlaceholder => 'Здесь появятся предлагаемые товары.';

  @override
  String get failedToLoadLibraries => 'Не удалось загрузить библиотеки';

  @override
  String get noLibrariesFound => 'Библиотеки не найдены';

  @override
  String get library => 'Библиотека';

  @override
  String get displaySettings => 'Настройки дисплея';

  @override
  String get allGenres => 'Все жанры';

  @override
  String get noGenresFound => 'Жанры не найдены';

  @override
  String failedToLoadFolderError(String error) {
    return 'Не удалось загрузить папку: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Эта папка пуста';

  @override
  String itemCountLabel(int count) {
    return 'Элементов: $count';
  }

  @override
  String get failedToLoadFavorites => 'Не удалось загрузить избранное';

  @override
  String get retry => 'Повторить попытку';

  @override
  String get noFavoritesYet => 'Пока нет избранных';

  @override
  String get favorites => 'Избранное';

  @override
  String totalCountItems(int count) {
    return 'Элементов: $count';
  }

  @override
  String get continuing => 'Продолжение';

  @override
  String get ended => 'Закончено';

  @override
  String get sortAndFilter => 'Сортировать и фильтровать';

  @override
  String get type => 'Тип';

  @override
  String get sortBy => 'Сортировать по';

  @override
  String get display => 'Отображать';

  @override
  String get imageType => 'Тип изображения';

  @override
  String get posterSize => 'Размер плаката';

  @override
  String get small => 'Маленький';

  @override
  String get medium => 'Середина';

  @override
  String get large => 'Большой';

  @override
  String get extraLarge => 'Очень большой';

  @override
  String libraryGenresTitle(String name) {
    return '$name — жанры';
  }

  @override
  String get views => 'Просмотры';

  @override
  String get albums => 'Альбомы';

  @override
  String get albumArtists => 'Исполнители альбомов';

  @override
  String get artists => 'Исполнители';

  @override
  String get bookmarks => 'Закладки';

  @override
  String get noSavedBookmarks =>
      'Для этого заголовка пока нет сохраненных закладок.';

  @override
  String get openBook => 'Открытая книга';

  @override
  String get chapter => 'Глава';

  @override
  String get page => 'Страница';

  @override
  String get bookmark => 'Закладка';

  @override
  String get justNow => 'Прямо сейчас';

  @override
  String minutesAgo(int count) {
    return '$count мин назад';
  }

  @override
  String hoursAgo(int count) {
    return '$count ч назад';
  }

  @override
  String daysAgo(int count) {
    return '$count дн назад';
  }

  @override
  String get discoverySubjects => 'Предметы открытия';

  @override
  String get pickDiscoverySubjects =>
      'Выберите, какие тематические каналы показывать в Discover.';

  @override
  String get apply => 'Применить';

  @override
  String get openLink => 'Открыть ссылку';

  @override
  String get scanWithYourPhone => 'Сканируйте с помощью телефона';

  @override
  String get audiobookGenres => 'Жанры аудиокниг';

  @override
  String get pickAudiobookGenres =>
      'Выберите, какие жанры показывать в Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Откройте для себя аудиокниги';

  @override
  String get librivoxDescription =>
      'Популярные общедоступные игры от LibriVox.';

  @override
  String titlesCount(int count) {
    return 'Наименований: $count';
  }

  @override
  String get scrollLeft => 'Прокрутить влево';

  @override
  String get scrollRight => 'Прокрутите вправо';

  @override
  String get couldNotLoadGenre =>
      'Не удалось загрузить этот жанр прямо сейчас.';

  @override
  String get continueReading => 'Продолжить чтение';

  @override
  String get savedHighlights => 'Сохраненные моменты';

  @override
  String get continueListening => 'Продолжить прослушивание';

  @override
  String get listen => 'Слушать';

  @override
  String get resume => 'Продолжить';

  @override
  String get failedToLoadLibrary => 'Не удалось загрузить библиотеку';

  @override
  String get popularNow => 'Популярно сейчас';

  @override
  String get savedForLater => 'Сохранено на потом';

  @override
  String get topListens => 'Топ прослушиваний';

  @override
  String get unreadDiscoveries => 'Непрочитанные открытия';

  @override
  String get pickUpAgain => 'Возьми трубку снова';

  @override
  String get bookHighlightsDescription =>
      'Ваши книги с основными моментами, избранными или прогрессом в чтении.';

  @override
  String get handPickedFromLibrary => 'Отобрано вручную из вашей библиотеки.';

  @override
  String get handPickedFromListeningQueue =>
      'Отобрано вручную из вашей очереди на прослушивание.';

  @override
  String get booksWithHighlights =>
      'Книги с основными моментами, избранным или прогрессом в чтении.';

  @override
  String get jumpBackNarration =>
      'Вернитесь к повествованию, не ища свое место.';

  @override
  String get unreadBooksReady =>
      'Непрочитанные книги готовы к следующему тихому часу.';

  @override
  String get quickAccessFavorites =>
      'Быстрый доступ к книгам, к которым вы постоянно возвращаетесь.';

  @override
  String get searchAudiobooks => 'Поиск аудиокниг';

  @override
  String get searchYourLibrary => 'Ищите в своей библиотеке';

  @override
  String get pickUpStory =>
      'Продолжайте историю с того места, где вы остановились';

  @override
  String get savedPlacesChapters =>
      'Ваши сохраненные места и незаконченные главы';

  @override
  String authorsCount(int count) {
    return 'Авторов: $count';
  }

  @override
  String genresCount(int count) {
    return 'Жанров: $count';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% завершено';
  }

  @override
  String get readyWhenYouAre => 'Готов, когда вы будете';

  @override
  String get details => 'Подробности';

  @override
  String get listeningRoom => 'Комната для прослушивания';

  @override
  String get bookmarksAndProgress => 'Закладки и прогресс';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Библиотека из $count наименований, собранная для чтения.';
  }

  @override
  String get titles => 'Названия';

  @override
  String get allTitles => 'Все названия';

  @override
  String get authors => 'Авторы';

  @override
  String get browseByAuthor => 'Просмотр по автору';

  @override
  String get browseByGenre => 'Просмотр по жанру';

  @override
  String get discover => 'Обнаружить';

  @override
  String get trendingTitlesOpenLibrary =>
      'Популярные заголовки по темам из Open Library.';

  @override
  String get noBookmarkedItems => 'В закладках пока нет товаров';

  @override
  String get nothingMatchesSection =>
      'Пока ничего не соответствует этому разделу. Попробуйте другую вкладку или вернитесь после завершения синхронизации библиотеки.';

  @override
  String get audiobooks => 'Аудиокниги';

  @override
  String noLabelFound(String label) {
    return '$label: ничего не найдено';
  }

  @override
  String get folder => 'Папка';

  @override
  String get filters => 'Фильтры';

  @override
  String get readingStatus => 'Статус чтения';

  @override
  String get playedStatus => 'Статус игры';

  @override
  String get readStatus => 'Читать';

  @override
  String get watched => 'Просмотрено';

  @override
  String get unread => 'Непрочитано';

  @override
  String get unwatched => 'Не просмотрено';

  @override
  String get seriesStatus => 'Статус серии';

  @override
  String get allLibraries => 'Все библиотеки';

  @override
  String get books => 'Книги';

  @override
  String get latestBooks => 'Новые книги';

  @override
  String get latestAudiobooks => 'Новые аудиокниги';

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
  String get bookFormatAudiobook => 'Аудиокнига';

  @override
  String bookPercentRead(int percent) {
    return 'Прочитано $percent%';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Осталось $time';
  }

  @override
  String get bookHeroRead => 'Читать';

  @override
  String get bookHeroListen => 'Слушать';

  @override
  String get author => 'Автор';

  @override
  String get unknownAuthor => 'Неизвестный автор';

  @override
  String get uncategorized => 'Без категории';

  @override
  String get overview => 'Обзор';

  @override
  String get noLibrivoxDescription =>
      'LibriVox пока не предоставил описания для этой игры.';

  @override
  String get readers => 'Читатели';

  @override
  String get openLinks => 'Открытые ссылки';

  @override
  String get librivoxPage => 'Страница LibriVox';

  @override
  String get internetArchive => 'Интернет-архив';

  @override
  String get rssFeed => 'RSS-канал';

  @override
  String get downloadZip => 'Скачать ZIP';

  @override
  String sectionCountLabel(int count) {
    return 'Разделов: $count';
  }

  @override
  String firstPublished(int year) {
    return 'Первое издание: $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Для этого названия пока нет обзора от Open Library.';

  @override
  String get subjects => 'Предметы';

  @override
  String get all => 'Все';

  @override
  String booksCount(int count) {
    return 'Книг: $count';
  }

  @override
  String get couldNotLoadSubject =>
      'Не удалось загрузить эту тему прямо сейчас.';

  @override
  String get audiobookDetails => 'Подробности об аудиокниге';

  @override
  String authorsCountTitle(int count) {
    return 'Авторов: $count';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудиокниги',
      many: '$count аудиокниг',
      few: '$count аудиокниги',
      one: '$count аудиокнига',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Список треков';

  @override
  String get itemListPlaceholder => 'Список товаров появится здесь';

  @override
  String get failedToLoad => 'Не удалось загрузить';

  @override
  String get delete => 'Удалить';

  @override
  String get save => 'Сохранить';

  @override
  String get moreLikeThis => 'Больше подобного';

  @override
  String get castAndCrew => 'Актеры и съемочная группа';

  @override
  String get collection => 'Коллекция';

  @override
  String get episodes => 'Эпизоды';

  @override
  String get nextUp => 'Далее';

  @override
  String get seasons => 'Сезоны';

  @override
  String get chapters => 'Главы';

  @override
  String get features => 'Функции';

  @override
  String get movies => 'Фильмы';

  @override
  String get musicVideos => 'Клипы';

  @override
  String get other => 'Другой';

  @override
  String get discography => 'Дискография';

  @override
  String get similarArtists => 'Похожие артисты';

  @override
  String get tableOfContents => 'Оглавление';

  @override
  String get tracklist => 'Треклист';

  @override
  String discNumber(int number) {
    return 'Диск $number';
  }

  @override
  String get biography => 'Биография';

  @override
  String get authorDetails => 'Сведения об авторе';

  @override
  String get noOverviewAvailable => 'Для этого названия пока нет обзора.';

  @override
  String get noBiographyAvailable => 'Биографии этого автора не существует.';

  @override
  String get noBooksFound => 'Книг этого автора не найдено.';

  @override
  String get unableToLoadAuthorDetails =>
      'Невозможно загрузить данные об авторе прямо сейчас.';

  @override
  String published(int year) {
    return 'Издано в $year';
  }

  @override
  String get publicationDateUnknown => 'Дата публикации неизвестна';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сезона',
      many: '$count сезонов',
      few: '$count сезона',
      one: '$count сезон',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Закончится в $time';
  }

  @override
  String get items => 'Элементы';

  @override
  String get extras => 'Дополнения';

  @override
  String get behindTheScenes => 'Со съёмок';

  @override
  String get deletedScenes => 'Удалённые сцены';

  @override
  String get featurettes => 'Дополнительные ролики';

  @override
  String get interviews => 'Интервью';

  @override
  String get scenes => 'Сцены';

  @override
  String get shorts => 'Короткометражки';

  @override
  String get trailers => 'Трейлеры';

  @override
  String timeRemaining(String time) {
    return 'Осталось $time';
  }

  @override
  String endsIn(String time) {
    return 'Завершится через $time';
  }

  @override
  String get view => 'Вид';

  @override
  String get resumeReading => 'Возобновить чтение';

  @override
  String get read => 'Читать';

  @override
  String resumeFrom(String position) {
    return 'Продолжить с $position';
  }

  @override
  String get play => 'Воспроизвести';

  @override
  String get startOver => 'Начать сначала';

  @override
  String get restart => 'Перезапуск';

  @override
  String get readOffline => 'Читать оффлайн';

  @override
  String get playOffline => 'Играть в автономном режиме';

  @override
  String get audio => 'Аудио';

  @override
  String get subtitles => 'Субтитры';

  @override
  String get version => 'Версия';

  @override
  String get cast => 'Транслировать';

  @override
  String get trailer => 'Трейлер';

  @override
  String get finished => 'Законченный';

  @override
  String get favorited => 'Избранное';

  @override
  String get favorite => 'Любимый';

  @override
  String get playlist => 'Плейлист';

  @override
  String get downloaded => 'Скачано';

  @override
  String get downloadAll => 'Скачать все';

  @override
  String get download => 'Скачать';

  @override
  String get deleteDownloaded => 'Удалить скачанное';

  @override
  String get goToSeries => 'Перейти к серии';

  @override
  String get editMetadata => 'Редактировать метаданные';

  @override
  String get less => 'Меньше';

  @override
  String get more => 'Более';

  @override
  String get deleteItem => 'Удалить элемент';

  @override
  String get deletePlaylist => 'Удалить плейлист';

  @override
  String get deletePlaylistMessage => 'Удалить этот плейлист с сервера?';

  @override
  String get deleteItemMessage => 'Удалить этот объект с сервера?';

  @override
  String get failedToDeletePlaylist => 'Не удалось удалить плейлист';

  @override
  String get failedToDeleteItem => 'Не удалось удалить элемент';

  @override
  String get renamePlaylist => 'Переименовать плейлист';

  @override
  String get playlistName => 'Название плейлиста';

  @override
  String get deleteDownloadedAlbum => 'Удалить загруженный альбом';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Удалить скачанные треки альбома «$title»?';
  }

  @override
  String get downloadedTracksDeleted => 'Скачанные треки удалены.';

  @override
  String get downloadedTracksDeleteFailed =>
      'Некоторые загруженные треки не удалось удалить.';

  @override
  String get noTracksLoaded => 'Нет загруженных треков';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel: ничего не загружено';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Скачивание «$title» (элементов: $count)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Удалить «$name» с сервера? Это действие нельзя отменить.';
  }

  @override
  String get itemDeleted => 'Объект удален.';

  @override
  String get noPlayableTrailerFound => 'Играбельного трейлера не найдено.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Формат книги не поддерживается: .$extension';
  }

  @override
  String get audioTrack => 'Аудио дорожка';

  @override
  String get subtitleTrack => 'Дорожка субтитров';

  @override
  String get none => 'Нет';

  @override
  String get downloadSubtitlesLabel => 'Скачать субтитры...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Поиск с помощью плагина OpenSubtitles';

  @override
  String get downloadSubtitles => 'Скачать субтитры';

  @override
  String get selectedSubtitleInvalid => 'Выбранный субтитр недействителен.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Субтитры скачаны и выбраны: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтитры скачаны. Появление может занять некоторое время, пока Jellyfin обновит элемент.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'В сети не найдено субтитров на языке $language.';
  }

  @override
  String get selectVersion => 'Выберите версию';

  @override
  String versionNumber(int number) {
    return 'Версия $number';
  }

  @override
  String get downloadAllQuality => 'Скачать все — Качество';

  @override
  String get downloadQuality => 'Качество загрузки';

  @override
  String get originalFileNoReencoding =>
      'Оригинальный файл, без перекодирования';

  @override
  String get originalFilesNoReencoding =>
      'Оригинальные файлы, без перекодирования';

  @override
  String get noEpisodesLoaded => 'Серии не загружены';

  @override
  String downloadingItem(String name, String quality) {
    return 'Скачивание $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Удалить загруженные файлы';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Удалить локальные файлы: $typeLabel?\n\nЭто освободит место в хранилище. Позже можно скачать заново.';
  }

  @override
  String get downloadedFilesDeleted => 'Загруженные файлы удалены';

  @override
  String get failedToDeleteFiles => 'Не удалось удалить файлы';

  @override
  String get deleteFiles => 'Удалить файлы';

  @override
  String get director => 'ДИРЕКТОР';

  @override
  String get directors => 'РЕЖИССЁРЫ';

  @override
  String get writer => 'СЦЕНАРИСТ';

  @override
  String get writers => 'СЦЕНАРИСТЫ';

  @override
  String get studio => 'СТУДИЯ';

  @override
  String studioMoreCount(int count) {
    return '+$count ещё';
  }

  @override
  String totalEpisodes(int count) {
    return 'Эпизодов: $count';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Эпизод $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Глава $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count трека',
      many: '$count треков',
      few: '$count трека',
      one: '$count трек',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count главы',
      many: '$count глав',
      few: '$count главы',
      one: '$count глава',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Дата рождения: $date';
  }

  @override
  String died(String date) {
    return 'Дата смерти: $date';
  }

  @override
  String age(int age) {
    return 'Возраст: $age';
  }

  @override
  String get showLess => 'Показать меньше';

  @override
  String get readMore => 'Читать далее';

  @override
  String get shuffle => 'Перемешать';

  @override
  String get shuffleAllMusic => 'Перемешать всю музыку';

  @override
  String get carSignInPrompt => 'Войдите в Moonfin на телефоне';

  @override
  String get carServerUnreachable => 'Сервер недоступен';

  @override
  String downloadsCount(int count) {
    return 'Скачиваний: $count';
  }

  @override
  String get perfectMatch => 'Идеальное совпадение';

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
    return 'Для действия «$action» с внешними субтитрами нужно разрешение Jellyfin на управление субтитрами для этого пользователя.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Элемент не найден на сервере для действия «$action» с внешними субтитрами.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Не удалось выполнить «$action» для внешних субтитров: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Не удалось выполнить «$action» для внешних субтитров (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Не удалось выполнить «$action» для внешних субтитров.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'все скачанные эпизоды «$name»';
  }

  @override
  String get deleteSeasonFiles => 'все скачанные серии этого сезона';

  @override
  String get stillWatching => 'Все еще смотрите?';

  @override
  String get unableToLoadTrailerStream =>
      'Не удалось загрузить трансляцию трейлера.';

  @override
  String get trailerTimedOut => 'Тайм-аут прицепа во время загрузки.';

  @override
  String get playbackFailedForTrailer =>
      'Не удалось воспроизвести этот трейлер.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Трансляция недоступна во время автономного воспроизведения.';

  @override
  String castActionFailed(String label, String error) {
    return 'Не удалось выполнить действие $label: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Не удалось изменить громкость трансляции: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Управление $label';
  }

  @override
  String get deviceVolume => 'Громкость устройства';

  @override
  String get unavailable => 'Недоступно';

  @override
  String get pause => 'Пауза';

  @override
  String get syncPosition => 'Позиция синхронизации';

  @override
  String stopCast(String label) {
    return 'Остановить $label';
  }

  @override
  String get queueIsEmpty => 'Очередь пуста';

  @override
  String trackNumber(int number) {
    return 'Трек $number';
  }

  @override
  String get remotePlayback => 'Удаленное воспроизведение';

  @override
  String get castingToGoogleCast => 'Трансляция в Google Cast';

  @override
  String get castingViaAirPlay => 'Кастинг через AirPlay';

  @override
  String get castingViaDlna => 'Трансляция через DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds сек';
  }

  @override
  String get longPressToUnlock => 'Длительное нажатие, чтобы разблокировать';

  @override
  String get off => 'Выкл.';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Авто';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Мбит/с';
  }

  @override
  String get bitrateOverride => 'Переопределение битрейта';

  @override
  String get audioDelay => 'Задержка звука';

  @override
  String delayMinusMs(int value) {
    return '-$value мс';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value мс';
  }

  @override
  String get subtitleDelay => 'Задержка субтитров';

  @override
  String get reset => 'Сбросить';

  @override
  String get unknown => 'Неизвестный';

  @override
  String get playbackInformation => 'Информация о воспроизведении';

  @override
  String get playback => 'Воспроизведение';

  @override
  String get playMethod => 'Метод игры';

  @override
  String get directPlay => 'Прямая игра';

  @override
  String get directStream => 'Прямая трансляция';

  @override
  String get transcoding => 'Транскодирование';

  @override
  String get transcodeReasons => 'Причины перекодирования';

  @override
  String get player => 'Плеер';

  @override
  String get container => 'Контейнер';

  @override
  String get bitrate => 'Битрейт';

  @override
  String get video => 'Видео';

  @override
  String get resolution => 'Разрешение';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Кодек';

  @override
  String get videoBitrate => 'Битрейт видео';

  @override
  String get track => 'Дорожка';

  @override
  String get channels => 'Каналы';

  @override
  String get audioBitrate => 'Битрейт аудио';

  @override
  String get sampleRate => 'Частота дискретизации';

  @override
  String get format => 'Формат';

  @override
  String get external => 'Внешний';

  @override
  String get embedded => 'Встроенный';

  @override
  String castSessionError(String protocol) {
    return 'Ошибка сеанса $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Не удалось загрузить сведения о книге: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Встроенное приложение для рендеринга EPUB пока недоступно на этой платформе.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Этот формат (.$extension) пока нельзя открыть в приложении.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'На этой платформе недоступен встроенный рендеринг документов.';

  @override
  String get couldNotOpenExternalViewer =>
      'Не удалось открыть внешнее средство просмотра.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Не удалось открыть встроенную читалку: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Закладка на «$label» уже сохранена.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Закладка добавлена: $label';
  }

  @override
  String get noBookmarksYet =>
      'Закладок пока нет.\nКоснитесь значка закладки во время чтения, чтобы сохранить свою позицию.';

  @override
  String get noTableOfContentsAvailable => 'Оглавление недоступно';

  @override
  String pageLabel(int number) {
    return 'Страница $number';
  }

  @override
  String get position => 'Позиция';

  @override
  String get bookReader => 'Читалка книг';

  @override
  String formatExtension(String extension) {
    return 'Формат: .$extension';
  }

  @override
  String percentRead(String percent) {
    return 'Прочитано $percent%';
  }

  @override
  String get updating => 'Обновление...';

  @override
  String get markUnread => 'Отметить как непрочитанное';

  @override
  String get markAsRead => 'Отметить как прочитанное';

  @override
  String get reloadReader => 'Перезагрузить читалку';

  @override
  String get noPagesFound => 'Страницы не найдены.';

  @override
  String get failedToDecodePageImage =>
      'Не удалось декодировать изображение страницы.';

  @override
  String resetZoom(String zoom) {
    return 'Сбросить масштаб (${zoom}x)';
  }

  @override
  String get singlePage => 'Одна страница';

  @override
  String get twoPageSpread => 'Двухстраничный разворот';

  @override
  String get addBookmark => 'Добавить закладку';

  @override
  String get bookmarksEllipsis => 'Закладки...';

  @override
  String get markedAsRead => 'Отмечено как прочитанное';

  @override
  String get markedAsUnread => 'Помечено как непрочитанное';

  @override
  String failedToUpdateReadState(String error) {
    return 'Не удалось изменить статус прочтения: $error';
  }

  @override
  String get themeSystem => 'Тема: Система';

  @override
  String get themeLight => 'Тема: Свет';

  @override
  String get themeDark => 'Тема: Темная';

  @override
  String get themeSepia => 'Тема: Сепия';

  @override
  String get invertColorsFixedLayout =>
      'Инвертировать цвета (фиксированный макет)';

  @override
  String get invertColorsPdf => 'Инвертировать цвета (PDF)';

  @override
  String get preparingInAppReader =>
      'Подготовка встроенной программы чтения...';

  @override
  String get pdfDataNotAvailable => 'Данные PDF недоступны.';

  @override
  String get readerFallbackModeActive => 'Резервный режим чтения активен';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Эта платформа не поддерживает встроенный движок документов для файлов $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Используйте Reload Reader после переключения на поддерживаемую целевую платформу (Android, iOS, macOS).';

  @override
  String get openExternally => 'Открыть внешне';

  @override
  String get noEpubChaptersFound => 'Главы EPUB не найдены.';

  @override
  String get readerNotReady => 'Читалка не готова.';

  @override
  String get seriesRecordings => 'Записи серий';

  @override
  String get now => 'Сейчас';

  @override
  String get sports => 'Спорт';

  @override
  String get news => 'Новости';

  @override
  String get kids => 'Дети';

  @override
  String get premiere => 'Премьера';

  @override
  String get guideTimeline => 'Руководство по временной шкале';

  @override
  String failedToLoadGuide(String error) {
    return 'Не удалось загрузить телепрограмму: $error';
  }

  @override
  String get noChannelsFound => 'Каналы не найдены';

  @override
  String get liveBadge => 'ЖИТЬ';

  @override
  String guideNextProgram(String time, String title) {
    return 'Далее: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Осталось $minutes мин';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Осталось $hours ч';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Осталось $hours ч $minutes мин';
  }

  @override
  String get movie => 'Фильм';

  @override
  String get removedFromFavoriteChannels => 'Удален из избранных каналов.';

  @override
  String get addedToFavoriteChannels => 'Добавлено в избранные каналы';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Не удалось обновить любимый канал.';

  @override
  String get unfavoriteChannel => 'Удалить любимый канал';

  @override
  String get favoriteChannel => 'Любимый канал';

  @override
  String get record => 'Записать';

  @override
  String get cancelRecordingAction => 'Отменить запись';

  @override
  String get programSetToRecord => 'Запись передачи запланирована';

  @override
  String get recordingCancelled => 'Запись отменена';

  @override
  String get unableToCreateRecording => 'Не удалось создать запись';

  @override
  String get watch => 'Смотреть';

  @override
  String get close => 'Закрыть';

  @override
  String failedToPlayChannel(String name) {
    return 'Не удалось воспроизвести $name';
  }

  @override
  String get failedToLoadRecordings => 'Не удалось загрузить записи.';

  @override
  String get scheduledInNext24Hours => 'Запланировано на ближайшие 24 часа';

  @override
  String get recentRecordings => 'Недавние записи';

  @override
  String get tvSeries => 'Сериал';

  @override
  String get failedToLoadSchedule => 'Не удалось загрузить расписание.';

  @override
  String get noScheduledRecordings => 'Нет запланированных записей';

  @override
  String get cancelRecording => 'Отменить запись?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Отменить запланированную запись «$name»?';
  }

  @override
  String get no => 'Нет';

  @override
  String get yesCancel => 'Да, отменить';

  @override
  String get failedToCancelRecording => 'Не удалось отменить запись.';

  @override
  String get failedToLoadSeriesRecordings =>
      'Не удалось загрузить записи серии.';

  @override
  String get noSeriesRecordings => 'Нет записей серий';

  @override
  String get cancelSeriesRecording => 'Отменить запись серии';

  @override
  String get cancelSeriesRecordingQuestion => 'Отменить запись серии?';

  @override
  String stopRecordingName(String name) {
    return 'Остановить запись «$name»?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Не удалось отменить запись серии.';

  @override
  String get searchThisLibrary => 'Искать в этой библиотеке...';

  @override
  String get searchEllipsis => 'Поиск...';

  @override
  String noResultsForQuery(String query) {
    return 'Нет результатов по запросу «$query»';
  }

  @override
  String searchFailedError(String error) {
    return 'Ошибка поиска: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Тип учетной записи Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Местный';

  @override
  String get savedMedia => 'Сохраненные медиа';

  @override
  String get tvShows => 'ТВ-шоу';

  @override
  String get music => 'Музыка';

  @override
  String get musicAlbums => 'Музыкальные альбомы';

  @override
  String get noMediaInFilter => 'В этом фильтре нет медиафайлов';

  @override
  String get noDownloadedMediaYet => 'Пока нет загруженных медиафайлов';

  @override
  String get browseLibrary => 'Просмотреть библиотеку';

  @override
  String get deleteDownload => 'Удалить загрузку';

  @override
  String removeItemAndFiles(String name) {
    return 'Удалить «$name» и его файлы?';
  }

  @override
  String tracksCount(int count) {
    return 'Треков: $count';
  }

  @override
  String get album => 'Альбом';

  @override
  String get playAlbum => 'Воспроизвести альбом';

  @override
  String failedToLoadAlbum(String error) {
    return 'Не удалось загрузить альбом: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Для «$name» нет скачанных треков.';
  }

  @override
  String get season => 'Сезон';

  @override
  String get errorLoadingEpisodes => 'Не удалось загрузить выпуски.';

  @override
  String get noDownloadedEpisodes => 'Нет загруженных серий';

  @override
  String get deleteEpisode => 'Удалить эпизод';

  @override
  String removeName(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'С$season Э$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Эпизод $number';
  }

  @override
  String get seriesNotFound => 'Серия не найдена';

  @override
  String get errorLoadingSeries => 'Ошибка загрузки серии.';

  @override
  String get downloadedEpisodes => 'Скачанные эпизоды';

  @override
  String seasonNumber(int number) {
    return 'Сезон $number';
  }

  @override
  String seasonChip(int number) {
    return 'С$number';
  }

  @override
  String get specials => 'Специальные предложения';

  @override
  String get deleteSeason => 'Удалить сезон';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Удалить все скачанные эпизоды сезона «$season»?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count эпизода',
      many: '$count эпизодов',
      few: '$count эпизода',
      one: '$count эпизод',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Управление хранилищем';

  @override
  String get storageBreakdown => 'Распределение хранилища';

  @override
  String get downloadedItems => 'Загруженные элементы';

  @override
  String get storageLimit => 'Лимит хранения';

  @override
  String get noLimit => 'Без ограничений';

  @override
  String get deleteAllDownloads => 'Удалить все загрузки';

  @override
  String get deleteAllDownloadsWarning =>
      'При этом будут удалены все загруженные медиафайлы, и это действие нельзя будет отменить.';

  @override
  String get deleteAll => 'Удалить все';

  @override
  String get deleteSelected => 'Удалить выбранное';

  @override
  String deleteSelectedCount(int count) {
    return 'Удалить скачанные элементы ($count)?';
  }

  @override
  String get musicAndAudiobooks => 'Музыка и аудиокниги';

  @override
  String get images => 'Изображения';

  @override
  String get database => 'База данных';

  @override
  String ofStorageLimit(String limit) {
    return 'из лимита $limit';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get authentication => 'Аутентификация';

  @override
  String get autoLoginServerManagement =>
      'Автоматический вход, управление сервером';

  @override
  String get pinCode => 'ПИН-код';

  @override
  String get setUpPinCodeProtection => 'Настройте защиту PIN-кодом';

  @override
  String get parentalControls => 'Родительский контроль';

  @override
  String get contentRatingRestrictions => 'Ограничения по рейтингу контента';

  @override
  String get bitRateResolutionBehavior => 'Битрейт, разрешение, поведение';

  @override
  String get languageSizeAppearance => 'Язык, размер, внешний вид';

  @override
  String get qualityStorage => 'Качество, хранение';

  @override
  String get serverSyncAndPluginStatus =>
      'Синхронизация сервера и статус плагина';

  @override
  String get mediaRequestIntegration => 'Интеграция медиа-запросов';

  @override
  String get switchServer => 'Переключить сервер';

  @override
  String get signOut => 'Выход';

  @override
  String get versionLicenses => 'Версия, лицензии';

  @override
  String get account => 'Счет';

  @override
  String get signInAndSecurity => 'Вход и безопасность';

  @override
  String get administration => 'Администрация';

  @override
  String get serverSettingsUsersLibraries =>
      'Настройки сервера, пользователи, библиотеки';

  @override
  String get customization => 'Кастомизация';

  @override
  String get themeAndLayout => 'Тема и макет';

  @override
  String get videoAndSubtitles => 'Видео и субтитры';

  @override
  String get integrations => 'Интеграции';

  @override
  String get pluginAndRequests => 'Плагин и запросы';

  @override
  String get customizeAccountPlaybackInterface =>
      'Настройте учетную запись, воспроизведение и поведение интерфейса.';

  @override
  String optionsCount(int count) {
    return 'Параметров: $count';
  }

  @override
  String get themeAndAppearance => 'Тема и внешний вид';

  @override
  String get focusBorderColor => 'Цвет границы фокуса';

  @override
  String get watchedIndicators => 'Наблюдаемые индикаторы';

  @override
  String get always => 'Всегда';

  @override
  String get hideUnwatched => 'Скрыть непросмотренные';

  @override
  String get episodesOnly => 'Только эпизоды';

  @override
  String get never => 'Никогда';

  @override
  String get focusExpansionAnimation => 'Анимация расширения фокуса';

  @override
  String get desktopUiScale =>
      'Масштаб пользовательского интерфейса рабочего стола';

  @override
  String get scaleFocusedCards =>
      'Масштабируйте сфокусированные или наведенные карты и плитки';

  @override
  String get backgroundBackdrops => 'Фоновые изображения';

  @override
  String get showBackdropImages =>
      'Показывать фоновые изображения позади контента';

  @override
  String get seriesThumbnails => 'Миниатюры серий';

  @override
  String get seriesThumbnailsDescription =>
      'Только эпизоды: используйте обложку серии, соответствующую каждому типу изображения строки.';

  @override
  String get homeRowInfoOverlay => 'Наложение информации о домашней строке';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Показывать заголовок и метаданные при просмотре главных строк';

  @override
  String get clockDisplay => 'Дисплей часов';

  @override
  String get inMenus => 'В меню';

  @override
  String get inVideo => 'В видео';

  @override
  String get seasonalEffects => 'Сезонные эффекты';

  @override
  String get seasonalEffectsDescription =>
      'Визуальные эффекты и сезонные украшения';

  @override
  String get snow => 'Снег';

  @override
  String get fireworks => 'Фейерверк';

  @override
  String get confetti => 'Конфетти';

  @override
  String get fallingLeaves => 'Падающие листья';

  @override
  String get themeMusic => 'Музыкальная тема';

  @override
  String get playThemeMusicOnDetailPages =>
      'Воспроизведение музыкальной темы на страницах сведений.';

  @override
  String get themeMusicVolume => 'Громкость музыкальной темы';

  @override
  String get themeMusicSettingsSubtitle =>
      'Страницы сведений, ряды на главной и громкость';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Музыкальная тема в домашних рядах';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Играть при просмотре главного экрана';

  @override
  String get loopThemeMusic => 'Зациклить заглавную музыку';

  @override
  String get loopThemeMusicSubtitle =>
      'Повторять трек, а не проигрывать его один раз';

  @override
  String get detailsBackgroundBlur => 'Детали размытия фона';

  @override
  String pixelValue(int value) {
    return '$value пикс.';
  }

  @override
  String get browsingBackgroundBlur => 'Просмотр размытия фона';

  @override
  String get maxStreamingBitrate => 'Максимальный битрейт потоковой передачи';

  @override
  String get maxResolution => 'Максимальное разрешение';

  @override
  String get playerZoomMode => 'Режим масштабирования игрока';

  @override
  String get settingsScrollWheelAction => 'Колёсико мыши';

  @override
  String get settingsScrollWheelActionDescription =>
      'Выберите, что делает прокрутка колёсиком мыши поверх видео во время воспроизведения.';

  @override
  String get scrollWheelActionOff => 'Выкл.';

  @override
  String get scrollWheelActionSeek => 'Перемотка (вперёд / назад)';

  @override
  String get scrollWheelActionVolume => 'Громкость';

  @override
  String get playerTooltipVolume => 'Громкость';

  @override
  String get fit => 'Соответствовать';

  @override
  String get autoCrop => 'Автоматическая обрезка';

  @override
  String get stretch => 'Потягиваться';

  @override
  String get refreshRateSwitching => 'Переключение частоты обновления';

  @override
  String get disabled => 'Отключено';

  @override
  String get scaleOnTv => 'Масштабирование на ТВ';

  @override
  String get scaleOnDevice => 'Масштабирование на устройстве';

  @override
  String get trickPlay => 'Трюк-игра';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Показывать миниатюры предварительного просмотра при поиске';

  @override
  String get showDescriptionOnPause => 'Показать описание на паузе';

  @override
  String get dimVideoShowOverview =>
      'Затемнять видео и показывать обзорный текст во время паузы';

  @override
  String get osdLockButton => 'Кнопка блокировки экранного меню';

  @override
  String get osdLockButtonDescription =>
      'Показать кнопку блокировки, которая блокирует сенсорный ввод до длительного нажатия';

  @override
  String get audioBehavior => 'Звуковое поведение';

  @override
  String get downmixToStereo => 'Сведение в стерео';

  @override
  String get defaultAudioLanguage => 'Язык аудио по умолчанию';

  @override
  String get fallbackAudioLanguage => 'Запасной язык звука';

  @override
  String get preferDefaultAudioTrack => 'Предпочитать дорожку по умолчанию';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Предпочитать оригинальную звуковую дорожку локализованному дубляжу.';

  @override
  String get preferAudioDescription => 'Предпочитать тифлокомментарии';

  @override
  String get preferAudioDescriptionDescription =>
      'Предпочитать дорожки с тифлокомментариями обычным.';

  @override
  String get transcodingAudio => 'Транскодирование (звук)';

  @override
  String get directStreamRemux => 'Прямой поток (ремукс)';

  @override
  String get transcodingBitrateOrResolution =>
      'Транскодирование (битрейт или разрешение)';

  @override
  String get transcodingVideoAndAudio => 'Транскодирование (видео и звук)';

  @override
  String get transcodingVideo => 'Транскодирование (видео)';

  @override
  String get autoServerDefault => 'Авто (по умолчанию для сервера)';

  @override
  String get english => 'Английский';

  @override
  String get spanish => 'испанский';

  @override
  String get french => 'Французский';

  @override
  String get german => 'немецкий';

  @override
  String get italian => 'итальянский';

  @override
  String get portuguese => 'португальский';

  @override
  String get japanese => 'японский';

  @override
  String get korean => 'корейский';

  @override
  String get chinese => 'китайский';

  @override
  String get russian => 'Русский';

  @override
  String get arabic => 'арабский';

  @override
  String get hindi => 'хинди';

  @override
  String get dutch => 'Голландский';

  @override
  String get swedish => 'Шведский';

  @override
  String get norwegian => 'норвежский';

  @override
  String get danish => 'датский';

  @override
  String get finnish => 'финский';

  @override
  String get polish => 'Польский';

  @override
  String get ac3Passthrough => 'Передача AC3';

  @override
  String get dtsPassthrough => 'Передача DTS';

  @override
  String get trueHdSupport => 'Поддержка TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Битовый поток звука DTS только для AVR; требуется поддержка ресивера и исходная дорожка DTS';

  @override
  String get enableTrueHdAudio =>
      'Включить звук TrueHD (может работать не на всех платформах)';

  @override
  String get settingsAudioOutputMode => 'Режим вывода звука';

  @override
  String get settingsAudioOutputModeDescription =>
      'Выберите способ декодирования звука. AVR Passthrough передаёт исходные потоки Dolby/DTS на ресивер, «Авто» и «Сведение» декодируют локально.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Запасной аудиокодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Выберите формат для транскодирования многоканального звука, когда исходный поток нельзя воспроизвести напрямую или передать без обработки.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Автоопределение\n(рекомендуется)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(по умолчанию)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(без потерь)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(только стерео)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(экономичный)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(без потерь)';

  @override
  String get settingsMaxAudioChannels => 'Максимум аудиоканалов';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Укажите максимальное число каналов вашей аудиосистемы. Потоки сверх этого лимита будут сведены или транскодированы.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Автоопределение\n(по оборудованию)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 моно';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 стерео';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 объёмный';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 квадрофония';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 объёмный';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 объёмный';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 объёмный';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 объёмный';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (дополнительно)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough кодеков';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Включайте только форматы, которые поддерживает ваш ресивер или приёмник HDMI.';

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
      'Передавать битовый поток Dolby Digital Plus (EAC3) на внешний декодер.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Передавать битовый поток Dolby Atmos через EAC3 (JOC) на внешний декодер.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Передавать битовый поток DTS-HD MA (включая ядро DTS) на внешний декодер.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Передавать битовый поток Dolby TrueHD с метаданными Atmos на внешний декодер.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Обнаруженные возможности звука';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Данные о текущих возможностях устройства пока недоступны.';

  @override
  String get settingsAudioRouteLabel => 'Маршрут';

  @override
  String get settingsAudioDecodeLabel => 'Декодирование';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Маршрут HD-звука';

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
  String get settingsAudioRouteHeadphones => 'Наушники';

  @override
  String settingsAudioPcmChannels(int count) {
    return 'PCM, $count кан.';
  }

  @override
  String get settingsAudioDiagnostics => 'Диагностика';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Уровень видео';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Диапазон видео';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Кодек субтитров';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Разрешённые аудиокодеки';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Аудиокодеки HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Аудиокодеки HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Активный аудиомаршрут';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Поддержка HD-звука маршрутом';

  @override
  String get nightMode => 'Ночной режим';

  @override
  String get compressDynamicRange => 'Сжать динамический диапазон';

  @override
  String get advancedMpv => 'Расширенный mpv';

  @override
  String get enableCustomMpvConf => 'Включить пользовательский mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Примените указанный пользователем файл mpv.conf перед началом воспроизведения.';

  @override
  String get unsafeAdvancedMpvOptions =>
      'Небезопасные дополнительные параметры mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Разрешить более широкий набор параметров mpv. Может нарушить поведение воспроизведения.';

  @override
  String get hardwareDecoding => 'Аппаратное декодирование';

  @override
  String get hardwareDecodingSubtitle =>
      'Может улучшить производительность, но может вызвать проблемы с воспроизведением на некоторых устройствах.';

  @override
  String get nextUpAndQueuing => 'Далее и очередь';

  @override
  String get nextUpDisplay => 'Следующий дисплей';

  @override
  String get extended => 'Расширенный';

  @override
  String get minimal => 'Минимальный';

  @override
  String get nextUpTimeout => 'Следующий тайм-аут';

  @override
  String secondsValue(int value) {
    return '$value с';
  }

  @override
  String get mediaQueuing => 'Медиа-очередь';

  @override
  String get autoQueueNextEpisodes =>
      'Автоматическая постановка в очередь следующих выпусков';

  @override
  String get stillWatchingPrompt => 'Все еще смотрю Подсказка';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'После $episodes эпизодов / $hours ч';
  }

  @override
  String get resumeAndSkip => 'Возобновить и пропустить';

  @override
  String get resumeRewind => 'Возобновить перемотку назад';

  @override
  String get unpauseRewind => 'Возобновить перемотку назад';

  @override
  String get fiveSeconds => '5 секунд';

  @override
  String get tenSeconds => '10 секунд';

  @override
  String get fifteenSeconds => '15 секунд';

  @override
  String get thirtySeconds => '30 секунд';

  @override
  String get skipBackLength => 'Пропустить длину спины';

  @override
  String get skipForwardLength => 'Пропустить длину вперед';

  @override
  String get customMpvConfPath => 'Пользовательский путь к mpv.conf';

  @override
  String get notSetMpvConf =>
      'Не установлено. Moonfin попробует использовать mpv.conf по умолчанию в папках app/data.';

  @override
  String get selectMpvConf => 'Выберите mpv.conf';

  @override
  String get pathToMpvConf => '/путь/к/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Настройки стиля (размер, цвет, смещение) применяются к текстовым субтитрам (SRT, VTT, TTML). Субтитры ASS/SSA используют собственный встроенный стиль, если не отключена функция «ASS/SSA Direct Play». Растровые субтитры (PGS, DVB, VobSub) нельзя изменить.';

  @override
  String get defaultSubtitleLanguage => 'Язык субтитров по умолчанию';

  @override
  String get defaultToNoSubtitles => 'По умолчанию нет субтитров';

  @override
  String get turnOffSubtitlesByDefault => 'Отключить субтитры по умолчанию';

  @override
  String get subtitleSize => 'Размер субтитров';

  @override
  String get textFillColor => 'Цвет заливки текста';

  @override
  String get backgroundColor => 'Цвет фона';

  @override
  String get textStrokeColor => 'Цвет обводки текста';

  @override
  String get subtitleCustomization => 'Настройка субтитров';

  @override
  String get subtitleCustomizationDescription =>
      'Настройте внешний вид субтитров';

  @override
  String get subtitleMode => 'Режим субтитров';

  @override
  String get subtitleModeFlagged => 'По флагу';

  @override
  String get subtitleModeAlways => 'Всегда';

  @override
  String get subtitleModeForeign => 'Иностранные';

  @override
  String get subtitleModeForced => 'Форсированные';

  @override
  String get subtitleModeFlaggedDescription =>
      'Воспроизводит дорожки, помеченные в метаданных файла как «default» или «forced».';

  @override
  String get subtitleModeAlwaysDescription =>
      'Автоматически загружает и показывает субтитры при каждом запуске видео.';

  @override
  String get subtitleModeForeignDescription =>
      'Автоматически включает субтитры, если звуковая дорожка по умолчанию на иностранном языке.';

  @override
  String get subtitleModeForcedDescription =>
      'Загружает только субтитры с явным флагом «forced».';

  @override
  String get subtitleModeNoneDescription =>
      'Полностью отключает автоматическую загрузку субтитров.';

  @override
  String get fallbackSubtitleLanguage => 'Запасной язык субтитров';

  @override
  String get subtitleStream => 'Поток субтитров';

  @override
  String get subtitlePreviewText =>
      'Быстрая коричневая лиса перепрыгивает через ленивую собаку';

  @override
  String get verticalOffset => 'Вертикальное смещение';

  @override
  String get pgsDirectPlay => 'Прямая игра PGS';

  @override
  String get directPlayPgsSubtitles => 'Прямое воспроизведение субтитров PGS';

  @override
  String get assSsaDirectPlay => 'Прямое воспроизведение ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Субтитры прямого воспроизведения ASS/SSA';

  @override
  String get white => 'Белый';

  @override
  String get black => 'Черный';

  @override
  String get yellow => 'Желтый';

  @override
  String get green => 'Зеленый';

  @override
  String get cyan => 'Голубой';

  @override
  String get red => 'Красный';

  @override
  String get transparent => 'Прозрачный';

  @override
  String get semiTransparentBlack => 'Полупрозрачный черный';

  @override
  String get global => 'Глобальный';

  @override
  String get desktop => 'Рабочий стол';

  @override
  String get mobile => 'Мобильный';

  @override
  String get tv => 'ТВ';

  @override
  String loadedProfileSettings(String profile) {
    return 'Настройки профиля «$profile» загружены.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Не удалось загрузить настройки профиля «$profile».';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Локальные настройки синхронизированы с профилем «$profile».';
  }

  @override
  String get customizationProfile => 'Профиль настройки';

  @override
  String get customizationProfileDescription =>
      'Выберите профиль для загрузки, редактирования и синхронизации. Global применяется везде, если только профиль устройства не переопределяет его. Зеленая точка обозначает текущий профиль устройства.';

  @override
  String get loadProfile => 'Загрузить профиль';

  @override
  String get syncing => 'Синхронизация...';

  @override
  String get syncToProfile => 'Синхронизировать с профилем';

  @override
  String get profileSyncHidden => 'Синхронизация профиля скрыта';

  @override
  String get enablePluginSyncDescription =>
      'Включите синхронизацию серверных плагинов в настройках плагина, чтобы отобразить здесь элементы управления профилем.';

  @override
  String get quality => 'Качество';

  @override
  String get defaultDownloadQuality => 'Качество загрузки по умолчанию';

  @override
  String get network => 'Сеть';

  @override
  String get wifiOnlyDownloads => 'Загрузки только для Wi-Fi';

  @override
  String get reportDownloadsActivity => 'Показывать загрузки на сервере';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Разрешить администратору сервера видеть ваши транскодированные загрузки на панели управления';

  @override
  String get onlyDownloadOnWifi => 'Загрузка только при подключении к Wi-Fi';

  @override
  String get storage => 'Хранилище';

  @override
  String get storageUsed => 'Используемое хранилище';

  @override
  String get manage => 'Управлять';

  @override
  String get calculating => 'Расчет...';

  @override
  String get downloadLocation => 'Местоположение загрузки';

  @override
  String get defaultLabel => 'По умолчанию';

  @override
  String get saveToDownloadsFolder => 'Сохранить в папку «Загрузки»';

  @override
  String get downloadsVisibleToOtherApps =>
      'Загрузки/Moonfin — видны другим приложениям';

  @override
  String get dangerZone => 'Опасная зона';

  @override
  String get clearAllDownloads => 'Очистить все загрузки';

  @override
  String get original => 'Оригинал';

  @override
  String get changeDownloadLocation => 'Изменить место загрузки';

  @override
  String get changeDownloadLocationDescription =>
      'Новые загрузки будут сохраняться в выбранную папку. Существующие загрузки останутся в своем текущем местоположении, и ими можно будет управлять в настройках хранилища.';

  @override
  String get confirm => 'Подтверждать';

  @override
  String get cannotWriteToFolder =>
      'Невозможно выполнить запись в выбранную папку. Пожалуйста, выберите другое место или предоставьте разрешения на хранение.';

  @override
  String get saveToDownloadsFolderQuestion => 'Сохранить в папку «Загрузки»?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Загруженные медиафайлы будут сохранены в папке «Загрузки/Moonfin» на вашем устройстве. Эти файлы будут видны другим приложениям, таким как ваша галерея или музыкальный проигрыватель.\n\nСуществующие загрузки останутся в своем текущем местоположении.';

  @override
  String get enable => 'Давать возможность';

  @override
  String get clearAllDownloadsWarning =>
      'Это приведет к удалению всех загруженных медиафайлов, и это действие нельзя будет отменить.';

  @override
  String get clearAll => 'Очистить все';

  @override
  String get navigationStyle => 'Стиль навигации';

  @override
  String get topBar => 'Топ-бар';

  @override
  String get leftSidebar => 'Левая боковая панель';

  @override
  String get showShuffleButton => 'Показать кнопку «Перемешать»';

  @override
  String get showGenresButton => 'Кнопка «Показать жанры»';

  @override
  String get showFavoritesButton => 'Показать кнопку «Избранное»';

  @override
  String get showLibrariesInToolbar =>
      'Показать библиотеки на панели инструментов';

  @override
  String get navbarAlwaysExpanded =>
      'Всегда показывать подписи в панели навигации';

  @override
  String get showSeerrButton => 'Показывать кнопку Seerr';

  @override
  String get navbarOpacity => 'Непрозрачность панели навигации';

  @override
  String get navbarColor => 'Цвет панели навигации';

  @override
  String get gray => 'Серый';

  @override
  String get darkBlue => 'Темно-синий';

  @override
  String get purple => 'Фиолетовый';

  @override
  String get teal => 'Бирюзовый';

  @override
  String get navy => 'Военно-морской';

  @override
  String get charcoal => 'Древесный уголь';

  @override
  String get brown => 'Коричневый';

  @override
  String get darkRed => 'Темно-красный';

  @override
  String get darkGreen => 'Темно-зеленый';

  @override
  String get slate => 'Шифер';

  @override
  String get indigo => 'Индиго';

  @override
  String get libraryDisplay => 'Дисплей библиотеки';

  @override
  String get posterLabel => 'Плакат';

  @override
  String get thumbnailLabel => 'Миниатюра';

  @override
  String get bannerLabel => 'Баннер';

  @override
  String get overridePerLibrarySettings =>
      'Переопределить настройки для каждой библиотеки';

  @override
  String get applyImageTypeToAllLibraries =>
      'Применить тип изображения ко всем библиотекам';

  @override
  String get multiServerLibraries => 'Многосерверные библиотеки';

  @override
  String get showLibrariesFromAllServers =>
      'Показать библиотеки со всех подключенных серверов';

  @override
  String get enableFolderView => 'Включить просмотр папок';

  @override
  String get showFolderBrowsingOption => 'Показать опцию просмотра папок';

  @override
  String get groupItemsIntoCollections => 'Группировать элементы в коллекции';

  @override
  String get hideCollectionAssociatedItems =>
      'Скрывать элементы, входящие в коллекции, при просмотре библиотек';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'О группировке библиотек';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Чтобы использовать эту настройку, убедитесь, что параметры «Группировать фильмы в коллекции» и (или) «Группировать сериалы в коллекции» включены в настройках отображения вашей библиотеки на сервере Jellyfin или Emby.';

  @override
  String get libraryVisibility => 'Видимость библиотеки';

  @override
  String get libraryVisibilityDescription =>
      'Переключить видимость домашней страницы для каждой библиотеки. Перезапустите Moonfin, чтобы изменения вступили в силу.';

  @override
  String get showInNavigation => 'Показать в навигации';

  @override
  String get showInLatestMedia => 'Показать в последних СМИ';

  @override
  String get sourceLibraries => 'Исходные библиотеки';

  @override
  String get sourceCollections => 'Исходные коллекции';

  @override
  String get excludedGenres => 'Исключенные жанры';

  @override
  String get selectAll => 'Выбрать все';

  @override
  String itemsSelected(int count) {
    return 'Выбрано: $count';
  }

  @override
  String get mediaBar => 'Медиа-бар';

  @override
  String get mediaSources => 'Источники СМИ';

  @override
  String get behavior => 'Поведение';

  @override
  String get seconds => 'секунды';

  @override
  String get localPreviews => 'Локальные превью';

  @override
  String get localPreviewsDescription =>
      'Настройте предварительный просмотр трейлера, мультимедиа и аудио.';

  @override
  String get mediaBarMode => 'Стиль медиа-бара';

  @override
  String get mediaBarModeDescription =>
      'Выберите один из вариантов оформления панели управления медиафайлами или отключите её';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Выкл.';

  @override
  String get enableMediaBar => 'Включить медиа-панель';

  @override
  String get showFeaturedContentSlideshow =>
      'Показывать слайд-шоу избранного контента на главной странице';

  @override
  String get contentType => 'Тип контента';

  @override
  String get moviesAndTvShows => 'Фильмы и телешоу';

  @override
  String get moviesOnly => 'Только фильмы';

  @override
  String get tvShowsOnly => 'Только телешоу';

  @override
  String get itemCount => 'Количество предметов';

  @override
  String get noneSelected => 'Ничего не выбрано';

  @override
  String get noneExcluded => 'Никто не исключен';

  @override
  String get autoAdvance => 'Авто Продвижение';

  @override
  String get autoAdvanceSlides => 'Автоматический переход к следующему слайду';

  @override
  String get autoAdvanceInterval => 'Интервал автоматического продвижения';

  @override
  String get trailerPreview => 'Предварительный просмотр трейлера';

  @override
  String get autoPlayTrailers =>
      'Автовоспроизведение трейлеров на медиабаре через 3 секунды.';

  @override
  String get trailerAudio => 'Звук трейлеров';

  @override
  String get enableTrailerAudio => 'Включить звук трейлеров в медиапанели';

  @override
  String get episodePreview => 'Предварительный просмотр эпизода';

  @override
  String get mediaPreview => 'Предварительный просмотр мультимедиа';

  @override
  String get episodePreviewDescription =>
      'Воспроизведите 30-секундный предварительный просмотр карточек с фокусом, наведением или длительным нажатием.';

  @override
  String get mediaPreviewDescription =>
      'Воспроизведите 30-секундный предварительный просмотр карточек с фокусом, наведением или длительным нажатием.';

  @override
  String get previewAudio => 'Предварительный просмотр аудио';

  @override
  String get enablePreviewAudio =>
      'Включить звук для превью трейлеров и эпизодов';

  @override
  String get latestMedia => 'Последние СМИ';

  @override
  String get recentlyReleased => 'Недавно выпущенный';

  @override
  String get myMedia => 'Мои медиа';

  @override
  String get myMediaSmall => 'Мои медиа (маленькие)';

  @override
  String get continueWatching => 'Продолжить просмотр';

  @override
  String get resumeAudio => 'Возобновить аудио';

  @override
  String get resumeBooks => 'Возобновить книги';

  @override
  String get activeRecordings => 'Активные записи';

  @override
  String get playlists => 'Плейлисты';

  @override
  String get liveTV => 'Прямой эфир';

  @override
  String get homeSections => 'Главная Разделы';

  @override
  String get resetToDefaults => 'Сбросить настройки по умолчанию';

  @override
  String get homeRowPosterSize => 'Размер плаката домашнего ряда';

  @override
  String get perRowImageTypeSelection =>
      'Выбор типа изображения для каждой строки';

  @override
  String get configureImageTypeForEachRow =>
      'Настройте тип изображения для каждой включенной главной строки';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Объединить Продолжить просмотр и следующее';

  @override
  String get combineBothRows => 'Объедините оба ряда в один домашний раздел.';

  @override
  String get fullScreenRows => 'Развёрнутые ряды на главной';

  @override
  String get fullScreenRowsDescription =>
      'Показывать не больше одного ряда на экране';

  @override
  String get modernHomeRowsPadding => 'Home Row Padding';

  @override
  String get modernHomeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Тип изображения по строкам';

  @override
  String get perRowSettings => 'Настройки для каждой строки';

  @override
  String get autoLogin => 'Автоматический вход';

  @override
  String get lastUser => 'Последний пользователь';

  @override
  String get currentUser => 'Текущий пользователь';

  @override
  String get alwaysAuthenticate => 'Всегда аутентифицироваться';

  @override
  String get requirePasswordWithToken =>
      'Требовать пароль даже с сохраненным токеном';

  @override
  String get confirmExit => 'Подтвердить выход';

  @override
  String get showConfirmationBeforeExiting =>
      'Показывать подтверждение перед выходом';

  @override
  String get blockContentWithRatings =>
      'Блокируйте контент со следующими рейтингами:';

  @override
  String get noContentRatingsFound =>
      'На этом сервере пока не найдено ни одного рейтинга контента.';

  @override
  String get couldNotLoadServerRatings =>
      'Не удалось загрузить рейтинги серверов. Показаны только сохраненные оценки.';

  @override
  String get couldNotRefreshRatings =>
      'Не удалось обновить рейтинги с сервера. Показаны сохраненные оценки.';

  @override
  String get enablePinCode => 'Включить PIN-код';

  @override
  String get requirePinToAccess =>
      'Требовать PIN-код для доступа к вашей учетной записи';

  @override
  String get changePin => 'Изменить ПИН-код';

  @override
  String get setNewPinCode => 'Установите новый PIN-код';

  @override
  String get removePin => 'Удалить PIN-код';

  @override
  String get removePinProtection => 'Удалить защиту PIN-кодом';

  @override
  String get screensaver => 'Заставка';

  @override
  String get inAppScreensaver => 'Заставка в приложении';

  @override
  String get enableBuiltInScreensaver => 'Включите встроенную заставку';

  @override
  String get mode => 'Режим';

  @override
  String get libraryArt => 'Библиотечное искусство';

  @override
  String get logo => 'Логотип';

  @override
  String get clock => 'Часы';

  @override
  String get timeout => 'Тайм-аут';

  @override
  String minutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String get dimmingLevel => 'Уровень затемнения';

  @override
  String get maxAgeRating => 'Максимальный возрастной рейтинг';

  @override
  String get any => 'Любой';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Требовать возрастной рейтинг';

  @override
  String get onlyShowRatedContent => 'Показывать только рейтинговый контент';

  @override
  String get showClock => 'Показать часы';

  @override
  String get displayClockDuringScreensaver =>
      'Отображать часы во время заставки';

  @override
  String get clockModeStatic => 'Статичные';

  @override
  String get clockModeBouncing => 'Прыгающие';

  @override
  String get rottenTomatoesCritics => 'Тухлые помидоры (критики)';

  @override
  String get rottenTomatoesAudience => 'Тухлые помидоры (Аудитория)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Метакритик';

  @override
  String get metacriticUser => 'Метакритик (Пользователь)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'почтовый ящик';

  @override
  String get myAnimeList => 'МойАнимеСписок';

  @override
  String get aniList => 'АниЛист';

  @override
  String get communityRating => 'Рейтинг сообщества';

  @override
  String get ratings => 'Рейтинги';

  @override
  String get additionalRatings => 'Дополнительные рейтинги';

  @override
  String get showMdbListAndTmdbRatings => 'Показать рейтинги MDBList и TMDB';

  @override
  String get ratingLabels => 'Рейтинговые этикетки';

  @override
  String get showLabelsNextToIcons =>
      'Показывать метки рядом со значками рейтинга';

  @override
  String get ratingBadges => 'Рейтинговые значки';

  @override
  String get showDecorativeBadges =>
      'Показывать декоративные значки позади оценок';

  @override
  String get episodeRatings => 'Рейтинги эпизодов';

  @override
  String get showRatingsOnEpisodes => 'Показывать рейтинги отдельных серий';

  @override
  String get ratingSources => 'Источники рейтинга';

  @override
  String get ratingSourcesDescription =>
      'Включите и измените порядок источников рейтингов, отображаемых в приложении.';

  @override
  String get pluginLabel => 'Плагин Moonbase';

  @override
  String get pluginDetected => 'Плагин обнаружен';

  @override
  String get pluginNotDetected => 'Плагин не обнаружен';

  @override
  String get pluginDetectedDescription =>
      'Обнаружен плагин сервера. Синхронизация включается автоматически при первом обнаружении плагина.';

  @override
  String get pluginNotDetectedDescription =>
      'Плагин сервера в настоящее время не обнаружен. Локальные настройки по-прежнему используют сохраненные значения или встроенные значения по умолчанию.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nВерсия: $version';
  }

  @override
  String get availableServices => 'Доступные услуги';

  @override
  String get serverPluginSync => 'Синхронизация серверных плагинов';

  @override
  String get syncSettingsWithPlugin =>
      'Синхронизация настроек с плагином сервера';

  @override
  String get whatSyncControls => 'Какие элементы управления синхронизацией';

  @override
  String get syncControlsDescription =>
      'Синхронизация только контролирует, будут ли настройки, поддерживаемые плагином, передаваться на сервер и извлекаться с него. Действия по выбору профиля и синхронизации профиля находятся в настройках настройки, если синхронизация плагинов включена.';

  @override
  String get recentRequests => 'Недавние запросы';

  @override
  String get recentlyAdded => 'Недавно добавлено';

  @override
  String get trending => 'Тенденции';

  @override
  String get popularMovies => 'Популярные фильмы';

  @override
  String get movieGenres => 'Жанры фильмов';

  @override
  String get upcomingMovies => 'Предстоящие фильмы';

  @override
  String get studios => 'Студии';

  @override
  String get popularSeries => 'Популярные сериалы';

  @override
  String get seriesGenres => 'Жанры сериалов';

  @override
  String get upcomingSeries => 'Предстоящая серия';

  @override
  String get networks => 'Сети';

  @override
  String get seerrDiscoveryRows => 'Ряды подборок Seerr';

  @override
  String get resetRowsToDefaults => 'Сбросить строки к значениям по умолчанию';

  @override
  String get enableSeerr => 'Включить Seerr';

  @override
  String get showSeerrInNavigation =>
      'Показать Seerr в навигации (требуется плагин сервера)';

  @override
  String get seerrUnavailable =>
      'Недоступно, поскольку поддержка серверного плагина Seerr отключена.';

  @override
  String get nsfwFilter => 'NSFW-фильтр';

  @override
  String get hideAdultContent => 'Скрыть контент для взрослых в результатах';

  @override
  String get seerrNotificationsSection => 'Уведомления';

  @override
  String get seerrNotifyNewRequestsTitle => 'Уведомления о новых запросах';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Оповещать, когда кто-то отправляет запрос';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Обновления запросов';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Одобрено, отклонено и добавлено в библиотеку';

  @override
  String get seerrNotifyIssuesTitle => 'Обновления проблем';

  @override
  String get seerrNotifyIssuesSubtitle => 'Новые проблемы, ответы и решения';

  @override
  String loggedInAs(String username) {
    return 'Вход выполнен: $username';
  }

  @override
  String get discoverRows => 'Страница обзора Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Включите строки, которые будут отображаться на главной странице Seerr. Перетащите, чтобы изменить порядок. Пользовательский порядок синхронизируется с Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Включите строки, которые будут отображаться на главной странице Seerr. Перетащите, чтобы изменить порядок. Пользовательский порядок синхронизируется с Moonbase.';

  @override
  String get enabled => 'Включено';

  @override
  String get hidden => 'Скрытый';

  @override
  String get aboutTitle => 'О';

  @override
  String versionValue(String version) {
    return 'Версия $version';
  }

  @override
  String get openSourceLicenses => 'Лицензии с открытым исходным кодом';

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Проверьте наличие обновлений сейчас';

  @override
  String get checksLatestDesktopRelease =>
      'Проверяет последнюю версию настольного компьютера для этой платформы.';

  @override
  String get youAreUpToDate => 'Вы в курсе событий.';

  @override
  String get couldNotCheckForUpdates =>
      'Не удалось проверить наличие обновлений прямо сейчас.';

  @override
  String get noCompatibleUpdate =>
      'Для этой платформы не найден совместимый пакет обновлений.';

  @override
  String get updateChecksNotSupported =>
      'Проверки обновлений не поддерживаются на этой платформе.';

  @override
  String get updateNotificationsDisabled =>
      'Уведомления об обновлениях отключены.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Пожалуйста, подождите, прежде чем проверять снова.';

  @override
  String get latestUpdateAlreadyShown =>
      'Последнее обновление уже было показано.';

  @override
  String get updateAvailable => 'Доступно обновление.';

  @override
  String updateAvailableVersion(String version) {
    return 'Доступно обновление: v$version';
  }

  @override
  String get updateNotifications => 'Уведомления об обновлениях';

  @override
  String get showWhenUpdatesAvailable =>
      'Показывать, когда доступны обновления';

  @override
  String updateAvailableTitle(String version) {
    return 'Доступна версия v$version';
  }

  @override
  String get readReleaseNotes => 'Прочтите примечания к выпуску';

  @override
  String get downloadingUpdate => 'Загрузка обновления...';

  @override
  String get updateDownloadFailed =>
      'Загрузка обновления не удалась. Пожалуйста, попробуйте еще раз.';

  @override
  String get openReleasesPage => 'Страница открытых релизов';

  @override
  String get navigation => 'Навигация';

  @override
  String get watchedIndicatorsBackdrops => 'Наблюдаемые индикаторы, фоны';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Цвет фокуса, наблюдаемые индикаторы, фоны';

  @override
  String get navbarStyleToolbarAppearance =>
      'Стиль навигационной панели, кнопки панели инструментов, внешний вид';

  @override
  String get reorderToggleHomeRows =>
      'Изменение порядка и переключение главных строк';

  @override
  String get featuredContentAppearance => 'Рекомендуемый контент, внешний вид';

  @override
  String get posterSizeImageTypeFolderView =>
      'Размер плаката, тип изображения, вид папки';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB и источники рейтингов';

  @override
  String gbValue(String value) {
    return '$value ГБ';
  }

  @override
  String mbValue(int value) {
    return '$value МБ';
  }

  @override
  String get imageCacheLimit => 'Лимит кэша изображений';

  @override
  String get clearImageCache => 'Очистить кэш изображений';

  @override
  String get imageCacheCleared => 'Кэш изображений очищен';

  @override
  String get clear => 'Очистить';

  @override
  String get browse => 'Просматривать';

  @override
  String get noResults => 'Нет результатов';

  @override
  String get seerrAvailableStatus => 'Доступный';

  @override
  String get seerrRequestedStatus => 'Запрошено';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Скачивание · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Импорт';

  @override
  String itemsCount(int count) {
    return 'Элементов: $count';
  }

  @override
  String get seerrSettings => 'Настройки Seerr';

  @override
  String get requestMore => 'Запросить больше';

  @override
  String get request => 'Запрос';

  @override
  String get cancelRequest => 'Отменить запрос';

  @override
  String get playInMoonfin => 'Играйте в Moonfin';

  @override
  String requestedByName(String name) {
    return 'Запрос от $name';
  }

  @override
  String get approve => 'Утвердить';

  @override
  String get declineAction => 'Отклонить';

  @override
  String get similar => 'Похожий';

  @override
  String get recommendations => 'Рекомендации';

  @override
  String cancelRequestForTitle(String title) {
    return 'Отменить запрос на «$title»?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Отменить запросы ($count) на «$title»?';
  }

  @override
  String get keep => 'Держать';

  @override
  String get itemNotFoundInLibrary =>
      'Предмет не найден в вашей библиотеке Moonfin.';

  @override
  String get errorSearchingLibrary => 'Ошибка поиска библиотеки';

  @override
  String budgetAmount(String amount) {
    return 'Бюджет: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Сборы: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Запросить: $type';
  }

  @override
  String get submitRequest => 'Отправить запрос';

  @override
  String get allSeasons => 'Все сезоны';

  @override
  String get advancedOptions => 'Дополнительные параметры';

  @override
  String get noServiceServersConfigured => 'Сервисные серверы не настроены';

  @override
  String get server => 'Сервер';

  @override
  String get qualityProfile => 'Профиль качества';

  @override
  String get rootFolder => 'Корневая папка';

  @override
  String get showMore => 'Показать больше';

  @override
  String get appearances => 'Появления';

  @override
  String get crewSection => 'Экипаж';

  @override
  String ageValue(int age) {
    return 'возраст $age';
  }

  @override
  String get noRequests => 'Нет запросов';

  @override
  String get pendingStatus => 'В ожидании';

  @override
  String get declinedStatus => 'Отклоненный';

  @override
  String get partiallyAvailable => 'Частично доступно';

  @override
  String get downloadingStatus => 'Загрузка';

  @override
  String get approvedStatus => 'Одобренный';

  @override
  String get notRequestedStatus => 'Не требуется';

  @override
  String get blocklistedStatus => 'В черном списке';

  @override
  String get deletedStatus => 'Удалено';

  @override
  String get failedStatus => 'Ошибка';

  @override
  String get processingStatus => 'В обработке';

  @override
  String modifiedByName(String name) {
    return 'Изменено: $name';
  }

  @override
  String get completedStatus => 'Завершено';

  @override
  String get requestErrorDuplicate => 'Этот запрос уже был отправлен';

  @override
  String get requestErrorQuota => 'Достигнут лимит запросов';

  @override
  String get requestErrorBlocklisted => 'Этот материал в чёрном списке';

  @override
  String get requestErrorNoSeasons => 'Нет сезонов, доступных для запроса';

  @override
  String get requestErrorPermission => 'У вас нет прав на такой запрос';

  @override
  String get seerrRequestsTitle => 'Запросы';

  @override
  String get seerrIssuesTitle => 'Проблемы';

  @override
  String get sortNewest => 'Сначала новые';

  @override
  String get sortLastModified => 'По дате изменения';

  @override
  String get noIssues => 'Проблем нет';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Осталось запросов фильмов: $remaining из $limit';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Осталось запросов сезонов: $remaining из $limit';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Входит в «$name»';
  }

  @override
  String get viewCollection => 'Открыть коллекцию';

  @override
  String get requestCollection => 'Запросить коллекцию';

  @override
  String collectionMoviesSummary(int total, int available) {
    return 'Фильмов: $total · доступно: $available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Запросить фильмы ($count)';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Запрос $current из $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Запрошено фильмов: $count';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Запрошено $ok из $total фильмов';
  }

  @override
  String get collectionAllRequested => 'Все фильмы уже доступны или запрошены';

  @override
  String get reportIssue => 'Сообщить о проблеме';

  @override
  String get issueTypeVideo => 'Видео';

  @override
  String get issueTypeAudio => 'Звук';

  @override
  String get whatsWrong => 'Что не так?';

  @override
  String get allEpisodes => 'Все эпизоды';

  @override
  String get episode => 'Эпизод';

  @override
  String get openStatus => 'Открыта';

  @override
  String get resolvedStatus => 'Решена';

  @override
  String get resolveAction => 'Решить';

  @override
  String get reopenAction => 'Открыть заново';

  @override
  String reportedByName(String name) {
    return 'Сообщение от $name';
  }

  @override
  String commentsCount(int count) {
    return 'Комментариев: $count';
  }

  @override
  String get addComment => 'Добавить комментарий';

  @override
  String get deleteIssueConfirm => 'Удалить эту проблему?';

  @override
  String get submitReport => 'Отправить сообщение';

  @override
  String get tmdbScore => 'Оценка TMDB';

  @override
  String get releaseDateLabel => 'Дата выпуска';

  @override
  String get firstAirDateLabel => 'Дата первого эфира';

  @override
  String get revenueLabel => 'Доход';

  @override
  String get runtimeLabel => 'Время выполнения';

  @override
  String get budgetLabel => 'Бюджет';

  @override
  String get originalLanguageLabel => 'Исходный язык';

  @override
  String get seasonsLabel => 'Сезоны';

  @override
  String get episodesLabel => 'Эпизоды';

  @override
  String get access => 'Доступ';

  @override
  String get add => 'Добавить';

  @override
  String get address => 'Адрес';

  @override
  String get analytics => 'Аналитика';

  @override
  String get catalog => 'Каталог';

  @override
  String get content => 'Содержание';

  @override
  String get copy => 'Копировать';

  @override
  String get create => 'Создавать';

  @override
  String get disable => 'Запрещать';

  @override
  String get done => 'Готово';

  @override
  String get edit => 'Изменить';

  @override
  String get encoding => 'Кодирование';

  @override
  String get error => 'Ошибка';

  @override
  String get forward => 'Вперёд';

  @override
  String get general => 'Общие';

  @override
  String get go => 'Идти';

  @override
  String get install => 'Установить';

  @override
  String get installed => 'Установлено';

  @override
  String get interval => 'Интервал';

  @override
  String get name => 'Имя';

  @override
  String get networking => 'сеть';

  @override
  String get next => 'Далее';

  @override
  String get path => 'Путь';

  @override
  String get paused => 'Приостановлено';

  @override
  String get permissions => 'Разрешения';

  @override
  String get processing => 'Обработка';

  @override
  String get profile => 'Профиль';

  @override
  String get provider => 'Поставщик';

  @override
  String get refresh => 'Обновить';

  @override
  String get remote => 'Пульт';

  @override
  String get rename => 'Переименовать';

  @override
  String get revoke => 'Отозвать';

  @override
  String get role => 'Роль';

  @override
  String get root => 'Корень';

  @override
  String get run => 'Бегать';

  @override
  String get search => 'Поиск';

  @override
  String get select => 'Выбирать';

  @override
  String get send => 'Отправлять';

  @override
  String get sessions => 'Сессии';

  @override
  String get set => 'Набор';

  @override
  String get status => 'Статус';

  @override
  String get stop => 'Остановить';

  @override
  String get streaming => 'Потоковое вещание';

  @override
  String get time => 'Время';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Удалить';

  @override
  String get up => 'Вверх';

  @override
  String get update => 'Обновлять';

  @override
  String get upload => 'Загрузить';

  @override
  String get unmute => 'Включить звук';

  @override
  String get mute => 'Без звука';

  @override
  String get branding => 'Брендинг';

  @override
  String get adminDrawerDashboard => 'Панель управления';

  @override
  String get adminDrawerAnalytics => 'Аналитика';

  @override
  String get adminDrawerSettings => 'Настройки';

  @override
  String get adminDrawerBranding => 'Брендинг';

  @override
  String get adminDrawerUsers => 'Пользователи';

  @override
  String get adminDrawerLibraries => 'Библиотеки';

  @override
  String get adminDrawerDisplay => 'Отображение';

  @override
  String get adminDrawerMetadata => 'Метаданные';

  @override
  String get adminDrawerNfo => 'Настройки NFO';

  @override
  String get adminDrawerTranscoding => 'Транскодирование';

  @override
  String get adminDrawerResume => 'Продолжить';

  @override
  String get adminDrawerStreaming => 'Потоковое вещание';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Устройства';

  @override
  String get adminDrawerActivity => 'Активность';

  @override
  String get adminDrawerNetworking => 'сеть';

  @override
  String get adminDrawerApiKeys => 'API-ключи';

  @override
  String get adminDrawerBackups => 'Резервные копии';

  @override
  String get adminDrawerLogs => 'Журналы';

  @override
  String get adminDrawerScheduledTasks => 'Запланированные задачи';

  @override
  String get adminDrawerPlugins => 'Плагины';

  @override
  String get adminDrawerRepositories => 'Репозитории';

  @override
  String get adminDrawerLiveTv => 'Прямой эфир';

  @override
  String get adminExitTooltip => 'Выйти из администратора';

  @override
  String get adminDashboardLoadFailed =>
      'Не удалось загрузить панель мониторинга.';

  @override
  String get adminMediaOverview => 'Обзор СМИ';

  @override
  String get adminMediaTotalsError =>
      'Не удалось загрузить общие сведения о носителях сервера.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Краткое описание того, сколько контента находится на этом сервере.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Доступно обновлений плагинов: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Плагинов, требующих перезапуска: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Невыполненных запланированных задач: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Недавних предупреждений и ошибок: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Распространение СМИ';

  @override
  String get analyticsVideoCodecs => 'Видеокодеки';

  @override
  String get analyticsAudioCodecs => 'Аудиокодеки';

  @override
  String get analyticsContainers => 'Контейнеры';

  @override
  String get analyticsTopGenres => 'Лучшие жанры';

  @override
  String get analyticsReleaseYears => 'Годы выпуска';

  @override
  String get analyticsContentRatings => 'Рейтинги контента';

  @override
  String get analyticsRuntimeBuckets => 'Ведра времени выполнения';

  @override
  String get analyticsFileFormats => 'Форматы файлов';

  @override
  String get analyticsNoData => 'Нет доступных данных.';

  @override
  String get adminServerInfo => 'Информация о сервере';

  @override
  String get adminRestartPending => 'Ожидается перезапуск';

  @override
  String get adminServerPaths => 'Пути к серверу';

  @override
  String get adminServerActions => 'Действия сервера';

  @override
  String get adminRestartServer => 'Перезапустить сервер';

  @override
  String get adminShutdownServer => 'Выключение сервера';

  @override
  String get adminScanLibraries => 'Сканировать библиотеки';

  @override
  String get adminLibraryScanStarted => 'Сканирование библиотеки началось.';

  @override
  String errorGeneric(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Идет перезагрузка сервера';

  @override
  String get adminServerRebootMessage =>
      'Выполняется перезагрузка сервера, перезапустите Moonfin';

  @override
  String get adminActiveSessions => 'Активные сессии';

  @override
  String get adminSessionsLoadFailed => 'Не удалось загрузить сеансы';

  @override
  String get adminNoActiveSessions => 'Нет активных сессий';

  @override
  String get adminRecentActivity => 'Недавняя активность';

  @override
  String get adminNoRecentActivity => 'Нет недавней активности';

  @override
  String adminCommandFailed(String error) {
    return 'Не удалось выполнить команду: $error';
  }

  @override
  String get adminSendMessage => 'Отправить сообщение';

  @override
  String get adminMessageTextHint => 'Текст сообщения';

  @override
  String get adminSetVolume => 'Установить громкость';

  @override
  String get sessionPrev => 'Предыдущий';

  @override
  String get sessionRewind => 'Перемотка назад';

  @override
  String get sessionForward => 'Вперёд';

  @override
  String get sessionNext => 'Следующий';

  @override
  String get sessionVolumeDown => 'Том –';

  @override
  String get sessionVolumeUp => 'Том +';

  @override
  String get uhd4k => '4К';

  @override
  String get nowPlaying => 'Сейчас играет';

  @override
  String get volume => 'Громкость';

  @override
  String get actions => 'Действия';

  @override
  String get videoCodec => 'Видеокодек';

  @override
  String get audioCodec => 'Аудиокодек';

  @override
  String get hwAccel => 'Аппаратное ускорение';

  @override
  String get completion => 'Завершение';

  @override
  String get direct => 'Прямой';

  @override
  String get adminDisconnect => 'Отключить';

  @override
  String get adminClearDates => 'Очистить даты';

  @override
  String get adminActivitySeverityAll => 'Любая важность';

  @override
  String get adminActivityDateRange => 'Диапазон дат';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Не удалось загрузить журнал активности: $error';
  }

  @override
  String get adminNoActivityEntries => 'Нет записей о деятельности';

  @override
  String get adminEditDeviceName => 'Изменить имя устройства';

  @override
  String get adminCustomName => 'Пользовательское имя';

  @override
  String get adminDeviceNameUpdated => 'Имя устройства обновлено.';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Не удалось обновить устройство: $error';
  }

  @override
  String get adminDeleteDevice => 'Удалить устройство';

  @override
  String get adminDeviceDeleted => 'Устройство удалено';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Не удалось удалить устройство: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Удалить устройство «$name»? Пользователю придётся войти на нём заново.';
  }

  @override
  String get adminDeleteAllDevices => 'Удалить все устройства';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Удалить устройства ($count)? Затронутым пользователям придётся войти заново. Текущее устройство не будет удалено.';
  }

  @override
  String get adminDevicesDeletedAll => 'Устройства удалены';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Часть устройств удалена; не удалось удалить: $count.';
  }

  @override
  String get adminDevicesLoadFailed => 'Не удалось загрузить устройства.';

  @override
  String get adminSearchDevices => 'Поиск устройств';

  @override
  String get adminThisDevice => 'Это устройство';

  @override
  String get adminEditName => 'Изменить имя';

  @override
  String get adminLibrariesLoadFailed => 'Не удалось загрузить библиотеки';

  @override
  String get adminNoLibraries => 'Библиотеки не настроены';

  @override
  String get adminScanAllLibraries => 'Сканировать все библиотеки';

  @override
  String get adminAddLibrary => 'Добавить библиотеку';

  @override
  String adminScanFailed(String error) {
    return 'Не удалось запустить сканирование: $error';
  }

  @override
  String get adminRenameLibrary => 'Переименовать библиотеку';

  @override
  String get adminNewName => 'Новое имя';

  @override
  String adminLibraryRenamed(String name) {
    return 'Библиотека переименована в «$name»';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Не удалось переименовать: $error';
  }

  @override
  String get adminDeleteLibrary => 'Удалить библиотеку';

  @override
  String adminLibraryDeleted(String name) {
    return 'Библиотека «$name» удалена';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Не удалось удалить библиотеку: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Не удалось добавить путь: $error';
  }

  @override
  String get adminRemovePath => 'Удалить путь';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Удалить «$path» из этой библиотеки?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Не удалось удалить путь: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Параметры библиотеки сохранены.';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Не удалось сохранить параметры: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Не удалось загрузить библиотеку';

  @override
  String get adminNoMediaPaths => 'Не настроены пути к носителям';

  @override
  String get adminAddPath => 'Добавить путь';

  @override
  String get adminBrowseFilesystem => 'Просмотрите файловую систему сервера:';

  @override
  String get adminSaveOptions => 'Сохранить параметры';

  @override
  String get adminPreferredMetadataLanguage => 'Предпочитаемый язык метаданных';

  @override
  String get adminMetadataLanguageHint => 'например эн, де, фр.';

  @override
  String get adminMetadataCountryCode => 'Код страны метаданных';

  @override
  String get adminMetadataCountryHint => 'например США, Германия, Франция';

  @override
  String get adminLibraryTabPaths => 'Пути';

  @override
  String get adminLibraryTabOptions => 'Параметры';

  @override
  String get adminLibraryTabDownloaders => 'Загрузчики';

  @override
  String get adminLibMetadataSavers => 'Сохранение метаданных';

  @override
  String get adminLibSubtitleDownloaders => 'Загрузчики субтитров';

  @override
  String get adminLibLyricDownloaders => 'Загрузчики текстов песен';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Загрузчики метаданных: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Источники изображений: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Сервер не предоставляет загрузчиков для этого типа библиотеки.';

  @override
  String get adminLibrarySectionGeneral => 'Общие';

  @override
  String get adminLibrarySectionMetadata => 'Метаданные';

  @override
  String get adminLibrarySectionEmbedded => 'Встроенные данные';

  @override
  String get adminLibrarySectionSubtitles => 'Субтитры';

  @override
  String get adminLibrarySectionImages => 'Изображения';

  @override
  String get adminLibrarySectionSeries => 'Сериалы';

  @override
  String get adminLibrarySectionMusic => 'Музыка';

  @override
  String get adminLibrarySectionMovies => 'Фильмы';

  @override
  String get adminLibRealtimeMonitor => 'Отслеживание в реальном времени';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Обнаруживать изменения файлов и обрабатывать их автоматически.';

  @override
  String get adminLibArchiveMediaFiles => 'Считать архивы медиафайлами';

  @override
  String get adminLibEnablePhotos => 'Показывать фотографии';

  @override
  String get adminLibSaveLocalMetadata => 'Сохранять обложки в папки с медиа';

  @override
  String get adminLibRefreshInterval => 'Автоматическое обновление метаданных';

  @override
  String get adminLibRefreshNever => 'Никогда';

  @override
  String get adminLibDefault => 'По умолчанию';

  @override
  String get adminLibDisplayTitle => 'Отображение';

  @override
  String get adminLibDisplaySection => 'Отображение библиотеки';

  @override
  String get adminLibFolderView =>
      'Показывать обычные папки с медиа в виде каталога';

  @override
  String get adminLibSpecialsInSeasons =>
      'Показывать спецвыпуски в сезонах, в которых они вышли';

  @override
  String get adminLibGroupMovies => 'Группировать фильмы в коллекции';

  @override
  String get adminLibGroupShows => 'Группировать сериалы в коллекции';

  @override
  String get adminLibExternalSuggestions =>
      'Показывать внешний контент в рекомендациях';

  @override
  String get adminLibDateAddedSection => 'Определение даты добавления';

  @override
  String get adminLibDateAddedLabel => 'Брать дату добавления из';

  @override
  String get adminLibDateAddedImport => 'Дата сканирования в библиотеку';

  @override
  String get adminLibDateAddedFile => 'Дата создания файла';

  @override
  String get adminLibMetadataTitle => 'Метаданные и изображения';

  @override
  String get adminLibMetadataLangSection => 'Предпочитаемый язык метаданных';

  @override
  String get adminLibChaptersSection => 'Главы';

  @override
  String get adminLibDummyChapterDuration =>
      'Длительность фиктивной главы (сек)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Длительность глав, создаваемых для медиа без глав. 0 — отключить.';

  @override
  String get adminLibChapterImageResolution => 'Разрешение изображений глав';

  @override
  String get adminLibNfoTitle => 'Настройки NFO';

  @override
  String get adminLibNfoHelp =>
      'Метаданные NFO совместимы с Kodi и похожими клиентами. Настройки применяются ко всем библиотекам, которые сохраняют метаданные NFO.';

  @override
  String get adminLibKodiUser =>
      'Пользователь, чьи данные о просмотре сохраняются в файлы NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Сохранять пути к изображениям в файлах NFO';

  @override
  String get adminLibPathSubstitution =>
      'Включить подстановку путей для изображений в NFO';

  @override
  String get adminLibExtraThumbs =>
      'Копировать изображения extrafanart в папку extrathumbs';

  @override
  String get adminLibNone => 'Нет';

  @override
  String adminLibRefreshDays(int days) {
    return '$days дн.';
  }

  @override
  String get adminLibEmbeddedTitles => 'Использовать встроенные названия';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Использовать встроенные названия для дополнений';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Использовать встроенные сведения об эпизодах';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Разрешить встроенные субтитры';

  @override
  String get adminLibEmbeddedAllowAll => 'Разрешить все';

  @override
  String get adminLibEmbeddedAllowText => 'Только текстовые';

  @override
  String get adminLibEmbeddedAllowImage => 'Только графические';

  @override
  String get adminLibEmbeddedAllowNone => 'Нет';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Не скачивать, если есть встроенные субтитры';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Не скачивать, если язык звуковой дорожки совпадает с языком скачивания';

  @override
  String get adminLibRequirePerfectMatch =>
      'Требовать точного совпадения субтитров';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Сохранять субтитры в папки с медиа';

  @override
  String get adminLibChapterImageExtraction => 'Извлекать изображения глав';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Извлекать изображения глав во время сканирования библиотеки';

  @override
  String get adminLibTrickplayExtraction => 'Извлекать изображения trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Извлекать изображения trickplay во время сканирования библиотеки';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Сохранять изображения trickplay в папки с медиа';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Автоматически объединять сериалы, разбросанные по нескольким папкам';

  @override
  String get adminLibSeasonZeroName => 'Название нулевого сезона';

  @override
  String get adminLibLufsScan => 'Включить LUFS-анализ для нормализации звука';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Предпочитать нестандартный тег исполнителей';

  @override
  String get adminLibAutoAddToCollection =>
      'Автоматически добавлять фильмы в коллекции';

  @override
  String get adminLibraryNameRequired => 'Укажите название библиотеки.';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Не удалось создать библиотеку: $error';
  }

  @override
  String get adminLibraryName => 'Название библиотеки';

  @override
  String get adminSelectedPaths => 'Выбранные пути:';

  @override
  String get adminNoPathsAdded => 'Пути не добавлены (можно добавить позже)';

  @override
  String get adminCreateLibrary => 'Создать библиотеку';

  @override
  String get paths => 'Пути:';

  @override
  String get adminDisableUser => 'Отключить пользователя';

  @override
  String get adminEnableUser => 'Включить пользователя';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Отключить пользователя $name? Он не сможет войти.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Включить пользователя $name? Он снова сможет входить.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Пользователь «$name» отключён';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Пользователь «$name» включён';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Не удалось обновить политику пользователя: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Не удалось загрузить пользователей.';

  @override
  String get adminSearchUsers => 'Поиск пользователей';

  @override
  String get adminEditUser => 'Изменить пользователя';

  @override
  String get adminAddUser => 'Добавить пользователя';

  @override
  String adminUserCreateFailed(String error) {
    return 'Не удалось создать пользователя: $error';
  }

  @override
  String get adminCreateUser => 'Создать пользователя';

  @override
  String get adminPasswordOptional => 'Пароль (необязательно)';

  @override
  String get adminUsernameRequired => 'Имя пользователя не может быть пустым';

  @override
  String get adminNoProfileChanges =>
      'Нет изменений в профиле, которые можно было бы сохранить.';

  @override
  String get adminProfileSaved => 'Профиль сохранен.';

  @override
  String adminSaveFailed(String error) {
    return 'Не удалось сохранить: $error';
  }

  @override
  String get adminPermissionsSaved => 'Разрешения сохранены.';

  @override
  String get adminPasswordsMismatch => 'Пароли не совпадают';

  @override
  String adminFailed(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get adminUserLoadFailed => 'Не удалось загрузить пользователя';

  @override
  String get adminBackToUsers => 'Вернуться к пользователям';

  @override
  String get adminSaveProfile => 'Сохранить профиль';

  @override
  String get adminDeleteUser => 'Удалить пользователя';

  @override
  String get admin => 'Админ';

  @override
  String get adminFullAccessWarning =>
      'Администраторы имеют полный доступ к серверу. Предоставляйте с осторожностью.';

  @override
  String get administrator => 'Администратор';

  @override
  String get adminHiddenUser => 'Скрытый пользователь';

  @override
  String get adminAllowMediaPlayback => 'Разрешить воспроизведение мультимедиа';

  @override
  String get adminAllowAudioTranscoding => 'Разрешить перекодирование звука';

  @override
  String get adminAllowVideoTranscoding => 'Разрешить перекодирование видео';

  @override
  String get adminAllowRemuxing => 'Разрешить ремультиплексирование';

  @override
  String get adminForceRemoteTranscoding =>
      'Принудительное перекодирование удаленного источника';

  @override
  String get adminAllowContentDeletion => 'Разрешить удаление контента';

  @override
  String get adminAllowContentDownloading => 'Разрешить загрузку контента';

  @override
  String get adminAllowPublicSharing => 'Разрешить общий доступ';

  @override
  String get adminAllowRemoteControl =>
      'Разрешить удаленное управление другими пользователями';

  @override
  String get adminAllowSharedDeviceControl =>
      'Разрешить управление общим устройством';

  @override
  String get adminAllowRemoteAccess => 'Разрешить удаленный доступ';

  @override
  String get adminRemoteBitrateLimit =>
      'Ограничение скорости передачи данных удаленного клиента (бит/с)';

  @override
  String get adminLeaveEmptyNoLimit =>
      'Оставьте пустым, чтобы не было ограничений';

  @override
  String get adminMaxActiveSessions =>
      'Максимальное количество активных сессий';

  @override
  String get adminAllowLiveTvAccess => 'Разрешить доступ к прямому эфиру';

  @override
  String get adminAllowLiveTvManagement => 'Разрешить управление Live TV';

  @override
  String get adminAllowCollectionManagement =>
      'Разрешить управление коллекцией';

  @override
  String get adminAllowSubtitleManagement => 'Разрешить управление субтитрами';

  @override
  String get adminAllowLyricManagement => 'Разрешить управление текстами песен';

  @override
  String get adminSavePermissions => 'Сохранить разрешения';

  @override
  String get adminEnableAllLibraryAccess =>
      'Разрешить доступ ко всем библиотекам';

  @override
  String get adminSaveAccess => 'Сохранить доступ';

  @override
  String get adminChangePassword => 'Изменить пароль';

  @override
  String get adminNewPassword => 'Новый пароль';

  @override
  String get adminConfirmPassword => 'Подтвердите пароль';

  @override
  String get adminSetPassword => 'Установить пароль';

  @override
  String get adminResetPassword => 'Сбросить пароль';

  @override
  String get adminPasswordReset => 'Сброс пароля';

  @override
  String get adminPasswordUpdated => 'Пароль обновлен';

  @override
  String get adminUserSettings => 'Пользовательские настройки';

  @override
  String get adminLibraryAccess => 'Доступ к библиотеке';

  @override
  String get adminDeviceAndChannelAccess => 'Доступ к устройствам и каналам';

  @override
  String get adminEnableAllDevices => 'Разрешить доступ ко всем устройствам';

  @override
  String get adminEnableAllChannels => 'Включить доступ ко всем каналам';

  @override
  String get adminParentalControl => 'Родительский контроль';

  @override
  String get adminMaxParentalRating =>
      'Максимальный разрешённый возрастной рейтинг';

  @override
  String get adminMaxParentalRatingHint =>
      'Контент с более высоким рейтингом будет скрыт от этого пользователя.';

  @override
  String get adminParentalRatingNone => 'Нет';

  @override
  String get adminBlockUnratedItems =>
      'Блокировать материалы без рейтинга или с нераспознанным рейтингом';

  @override
  String get adminUnratedBook => 'Книги';

  @override
  String get adminUnratedChannelContent => 'Каналы';

  @override
  String get adminUnratedLiveTvChannel => 'Прямой эфир';

  @override
  String get adminUnratedMovie => 'Фильмы';

  @override
  String get adminUnratedMusic => 'Музыка';

  @override
  String get adminUnratedTrailer => 'Трейлеры';

  @override
  String get adminUnratedSeries => 'Сериалы';

  @override
  String get adminAccessSchedules => 'Расписание доступа';

  @override
  String get adminAccessSchedulesHint =>
      'Разрешать доступ только в указанное ниже время. Если расписание не задано, доступ открыт круглосуточно.';

  @override
  String get adminAddSchedule => 'Добавить расписание';

  @override
  String get adminScheduleDay => 'День';

  @override
  String get adminScheduleStart => 'Начало';

  @override
  String get adminScheduleEnd => 'Конец';

  @override
  String get adminDayEveryday => 'Ежедневно';

  @override
  String get adminDayWeekday => 'Будни';

  @override
  String get adminDayWeekend => 'Выходные';

  @override
  String get adminDaySunday => 'Воскресенье';

  @override
  String get adminDayMonday => 'Понедельник';

  @override
  String get adminDayTuesday => 'Вторник';

  @override
  String get adminDayWednesday => 'Среда';

  @override
  String get adminDayThursday => 'Четверг';

  @override
  String get adminDayFriday => 'Пятница';

  @override
  String get adminDaySaturday => 'Суббота';

  @override
  String get adminAllowedTags => 'Разрешённые теги';

  @override
  String get adminAllowedTagsHint =>
      'Показывается только контент с этими тегами. Оставьте пустым, чтобы разрешить всё.';

  @override
  String get adminBlockedTags => 'Заблокированные теги';

  @override
  String get adminBlockedTagsHint =>
      'Контент с этими тегами скрыт от этого пользователя.';

  @override
  String get adminAddTag => 'Добавить тег';

  @override
  String get adminEnabledDevices => 'Разрешённые устройства';

  @override
  String get adminEnabledChannels => 'Разрешённые каналы';

  @override
  String get adminAuthProvider => 'Провайдер аутентификации';

  @override
  String get adminPasswordResetProvider => 'Провайдер сброса пароля';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Максимум неудачных попыток входа до блокировки';

  @override
  String get adminLoginAttemptsHint =>
      '0 — значение по умолчанию, -1 — отключить блокировку.';

  @override
  String get adminSyncPlayAccess => 'Доступ к SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Разрешить создавать группы и присоединяться к ним';

  @override
  String get adminSyncPlayJoin => 'Разрешить присоединяться к группам';

  @override
  String get adminSyncPlayNone => 'Нет доступа';

  @override
  String get adminContentDeletionFolders => 'Разрешить удаление контента из';

  @override
  String get adminResetPasswordWarning =>
      'Это приведет к удалению пароля. Пользователь сможет войти в систему без пароля.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Сервер вернул HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Удалить пользователя $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Пользователь «$name» удалён';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Не удалось удалить пользователя: $error';
  }

  @override
  String get adminCreateApiKey => 'Создать ключ API';

  @override
  String get adminAppName => 'Название приложения';

  @override
  String get adminApiKeyCreated => 'Ключ API создан';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Ключ успешно создан. Сервер не вернул токен. Проверьте ключи API сервера.';

  @override
  String get adminKeyCopied => 'Ключ скопирован в буфер обмена';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Не удалось создать ключ: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Токен ключа отсутствует в ответе сервера';

  @override
  String get adminRevokeApiKey => 'Отозвать ключ API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Отозвать ключ для $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Ключ API отозван';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Не удалось отозвать ключ: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Не удалось загрузить ключи API.';

  @override
  String get adminApiKeysTitle => 'API-ключи';

  @override
  String get adminCreateKey => 'Создать ключ';

  @override
  String get adminNoApiKeys => 'Ключи API не найдены';

  @override
  String get adminUnknownApp => 'Неизвестное приложение';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Токен: $token\\nСоздан: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Создать резервную копию';

  @override
  String get adminBackupInclude => 'Выберите, что включить в резервную копию.';

  @override
  String get adminBackupDatabase => 'База данных';

  @override
  String get adminBackupDatabaseAlways => 'Включается всегда';

  @override
  String get adminBackupMetadata => 'Метаданные';

  @override
  String get adminBackupSubtitles => 'Субтитры';

  @override
  String get adminBackupTrickplay => 'Изображения trickplay';

  @override
  String get adminCreatingBackup => 'Создание резервной копии...';

  @override
  String get adminBackupCreated => 'Резервная копия успешно создана';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Не удалось создать резервную копию: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Путь к резервной копии отсутствует в ответе сервера';

  @override
  String adminBackupManifest(String name) {
    return 'Манифест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Не удалось загрузить манифест: $error';
  }

  @override
  String get adminConfirmRestore => 'Подтвердить восстановление';

  @override
  String get adminRestoringBackup => 'Восстановление резервной копии...';

  @override
  String adminRestoreFailed(String error) {
    return 'Не удалось восстановить резервную копию: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Не удалось загрузить резервные копии';

  @override
  String get adminCreateBackup => 'Создать резервную копию';

  @override
  String get adminNoBackups => 'Резервные копии не найдены';

  @override
  String get adminViewDetails => 'Посмотреть детали';

  @override
  String get restore => 'Восстановить';

  @override
  String get adminLogsLoadFailed => 'Не удалось загрузить журналы сервера.';

  @override
  String get adminNoLogFiles => 'Файлы журналов не найдены';

  @override
  String get adminLogCopied => 'Журнал скопирован в буфер обмена';

  @override
  String get adminSaveLogFile => 'Сохранить файл журнала';

  @override
  String adminSavedTo(String path) {
    return 'Сохранено в $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Не удалось сохранить файл: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Не удалось загрузить $fileName';
  }

  @override
  String get adminSearchInLog => 'Искать в журнале';

  @override
  String get adminNoMatchingLines => 'Нет совпадающих строк';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Не удалось загрузить задачи: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Запланированных задач не найдено';

  @override
  String get adminNoTasksMatchFilter =>
      'Нет задач, соответствующих текущему фильтру.';

  @override
  String adminTaskStartFailed(String error) {
    return 'Не удалось запустить задачу: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Не удалось остановить задачу: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Не удалось загрузить задачу: $error';
  }

  @override
  String get adminRunNow => 'Беги сейчас';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Не удалось удалить триггер: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Не удалось добавить триггер: $error';
  }

  @override
  String get adminLastExecution => 'Последняя казнь';

  @override
  String get adminTriggers => 'Триггеры';

  @override
  String get adminAddTrigger => 'Добавить триггер';

  @override
  String get adminNoTriggers => 'Триггеры не настроены';

  @override
  String get adminTriggerType => 'Тип триггера';

  @override
  String get adminTimeLimit => 'Ограничение по времени (необязательно)';

  @override
  String get adminNoLimit => 'Без ограничений';

  @override
  String adminHours(String hours) {
    return '$hours ч';
  }

  @override
  String get adminDayOfWeek => 'День недели';

  @override
  String get adminSearchPlugins => 'Поиск плагинов...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Не удалось переключить плагин: $error';
  }

  @override
  String get adminUninstallPlugin => 'Удалить плагин';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Удалить плагин «$name»?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Не удалось удалить плагин: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Не удалось установить пакет: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Не удалось установить обновление: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Не удалось загрузить плагины: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Нет плагинов, соответствующих вашему запросу';

  @override
  String get adminNoPluginsInstalled => 'Плагины не установлены';

  @override
  String adminInstallUpdate(String version) {
    return 'Установить обновление (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Не удалось загрузить каталог: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Нет пакетов, соответствующих вашему запросу';

  @override
  String get adminNoPackagesAvailable => 'Нет доступных пакетов';

  @override
  String get adminExperimentalIntegration => 'Экспериментальная интеграция';

  @override
  String get adminExperimentalWarning =>
      'Интеграция настроек плагина все еще находится на стадии эксперимента. Некоторые страницы настроек могут отображаться неправильно.';

  @override
  String get continueAction => 'Продолжать';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '«$name» будет удалён после перезапуска сервера';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Не удалось удалить: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Обновление «$name» до v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Невозможно открыть настройки: отсутствует токен аутентификации.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Не удалось загрузить плагин: $error';
  }

  @override
  String get adminPluginNotFound => 'Плагин не найден';

  @override
  String adminPluginVersion(String version) {
    return 'Версия $version';
  }

  @override
  String get adminEnablePlugin => 'Включить плагин';

  @override
  String get adminPluginSettingsPage => 'Страница настроек плагина';

  @override
  String get adminRevisionHistory => 'История изменений';

  @override
  String get adminNoChangelog => 'Журнал изменений не доступен.';

  @override
  String get adminRemoveRepository => 'Удалить репозиторий';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Не удалось сохранить репозитории: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Не удалось загрузить репозитории: $error';
  }

  @override
  String get adminRepositoryNameHint => 'например Jellyfin Стабильный';

  @override
  String get adminRepositoryUrl => 'URL-адрес репозитория';

  @override
  String get adminAddEntry => 'Добавить запись';

  @override
  String get adminInvalidUrl => 'Неверный URL-адрес';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Не удалось загрузить настройки плагина: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Не удалось открыть $uri';
  }

  @override
  String get adminOpenInBrowser => 'Открыть в браузере';

  @override
  String get adminOpenExternally => 'Открыть снаружи';

  @override
  String get adminGeneralSettings => 'Общие настройки';

  @override
  String get adminServerName => 'Имя сервера';

  @override
  String get adminPreferredMetadataCountry =>
      'Предпочтительная страна метаданных';

  @override
  String get adminCachePath => 'Путь к кэшу';

  @override
  String get adminMetadataPath => 'Путь метаданных';

  @override
  String get adminLibraryScanConcurrency =>
      'Параллельное сканирование библиотеки';

  @override
  String get adminParallelImageEncodingLimit =>
      'Ограничение параллельного кодирования изображений';

  @override
  String get adminSlowResponseThreshold => 'Порог медленного ответа (мс)';

  @override
  String get adminBrandingSaved => 'Настройки фирменного оформления сохранены.';

  @override
  String get adminBrandingLoadFailed =>
      'Не удалось загрузить настройки брендинга.';

  @override
  String get adminLoginDisclaimer => 'Отказ от ответственности за вход';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML-код, отображаемый под формой входа';

  @override
  String get adminCustomCss => 'Пользовательский CSS';

  @override
  String get adminCustomCssHint =>
      'Пользовательский CSS, примененный к веб-интерфейсу';

  @override
  String get adminEnableSplashScreen => 'Включить заставку';

  @override
  String get adminStreamingSaved => 'Настройки потоковой передачи сохранены.';

  @override
  String get adminStreamingLoadFailed =>
      'Не удалось загрузить настройки потоковой передачи.';

  @override
  String get adminStreamingDescription =>
      'Установите глобальные ограничения скорости потоковой передачи для удаленных подключений.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ограничение скорости передачи удаленного клиента (Мбит/с)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Оставьте пустым или 0 для неограниченного количества';

  @override
  String get adminPlaybackSaved => 'Настройки воспроизведения сохранены.';

  @override
  String get adminPlaybackLoadFailed =>
      'Не удалось загрузить настройки воспроизведения.';

  @override
  String get adminPlaybackTranscoding => 'Воспроизведение/транскодирование';

  @override
  String get adminHardwareAcceleration => 'Аппаратное ускорение';

  @override
  String get adminVaapiDevice => 'Устройство ВА-API';

  @override
  String get adminEnableHardwareEncoding => 'Включить аппаратное кодирование';

  @override
  String get adminEnableHardwareDecoding =>
      'Включить аппаратное декодирование для:';

  @override
  String get adminEncodingThreads => 'Кодирование потоков';

  @override
  String get adminAutomatic => '0 = автоматический';

  @override
  String get adminTranscodingTempPath => 'Временной путь перекодирования';

  @override
  String get adminEnableFallbackFont => 'Включить резервный шрифт';

  @override
  String get adminFallbackFontPath => 'Резервный путь к шрифту';

  @override
  String get adminAllowSegmentDeletion => 'Разрешить удаление сегмента';

  @override
  String get adminSegmentKeepSeconds => 'Удержание сегмента (секунды)';

  @override
  String get adminThrottleBuffering => 'Буферизация дроссельной заслонки';

  @override
  String get adminTrickplaySaved => 'Настройки Trickplay сохранены';

  @override
  String get adminTrickplayLoadFailed =>
      'Не удалось загрузить настройки Trickplay';

  @override
  String get adminEnableHardwareAcceleration => 'Включить аппаратное ускорение';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Включить извлечение только ключевого кадра';

  @override
  String get adminKeyFrameSubtitle => 'Быстрее, но меньшая точность';

  @override
  String get adminScanBehavior => 'Поведение сканирования';

  @override
  String get adminProcessPriority => 'Приоритет процесса';

  @override
  String get adminImageSettings => 'Настройки изображения';

  @override
  String get adminIntervalMs => 'Интервал (мс)';

  @override
  String get adminCaptureFrameSubtitle => 'Как часто снимать кадры';

  @override
  String get adminWidthResolutions => 'Разрешение по ширине';

  @override
  String get adminTileWidth => 'Ширина плитки';

  @override
  String get adminTileHeight => 'Высота плитки';

  @override
  String get adminQualitySubtitle =>
      'Меньшие значения = лучшее качество, файлы большего размера.';

  @override
  String get adminProcessThreads => 'Потоки процесса';

  @override
  String get adminResumeSaved => 'Настройки возобновления сохранены.';

  @override
  String get adminResumeLoadFailed =>
      'Не удалось загрузить настройки возобновления.';

  @override
  String get adminResumeDescription =>
      'Настройте, когда контент должен быть отмечен как частично воспроизведенный или полностью воспроизведенный.';

  @override
  String get adminMinResumePercentage => 'Минимальный процент резюме';

  @override
  String get adminMinResumeSubtitle =>
      'Контент должен быть воспроизведен после этого процента, чтобы сохранить прогресс.';

  @override
  String get adminMaxResumePercentage => 'Максимальный процент резюме';

  @override
  String get adminMaxResumeSubtitle =>
      'После этого процента контент считается полностью воспроизведенным.';

  @override
  String get adminMinResumeDuration =>
      'Минимальная продолжительность возобновления (секунды)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Элементы короче этого значения не возобновляются.';

  @override
  String get adminMinAudiobookResume =>
      'Минимальный процент возобновления аудиокниги';

  @override
  String get adminMaxAudiobookResume =>
      'Максимальный процент возобновления аудиокниги';

  @override
  String get adminNetworkingSaved =>
      'Настройки сети сохранены. Может потребоваться перезагрузка сервера.';

  @override
  String get adminNetworkingLoadFailed =>
      'Не удалось загрузить настройки сети.';

  @override
  String get adminNetworkingWarning =>
      'Изменения сетевых настроек могут потребовать перезагрузки сервера.';

  @override
  String get adminEnableRemoteAccess => 'Включить удаленный доступ';

  @override
  String get ports => 'Порты';

  @override
  String get adminHttpPort => 'HTTP-порт';

  @override
  String get adminHttpsPort => 'HTTPS-порт';

  @override
  String get adminPublicHttpsPort => 'Публичный HTTPS-порт';

  @override
  String get adminBaseUrl => 'Базовый URL';

  @override
  String get adminBaseUrlHint => 'например /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Включить HTTPS';

  @override
  String get adminLocalNetwork => 'Локальная сеть';

  @override
  String get adminLocalNetworkAddresses => 'Адреса локальной сети';

  @override
  String get adminKnownProxies => 'Известные прокси';

  @override
  String get adminRemoteIpFilter => 'Удаленный IP-фильтр';

  @override
  String get adminRemoteIpFilterEntries => 'Удаленный IP-фильтр';

  @override
  String get adminCertificatePath => 'Путь сертификата';

  @override
  String get whitelist => 'Белый список';

  @override
  String get blacklist => 'Черный список';

  @override
  String get notSet => 'Не установлено';

  @override
  String get adminMetadataSaved => 'Метаданные сохранены.';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Не удалось загрузить метаданные: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Не удалось сохранить метаданные: $error';
  }

  @override
  String get adminRefreshMetadata => 'Обновить метаданные';

  @override
  String get recursive => 'Рекурсивный';

  @override
  String get adminReplaceAllMetadata => 'Заменить все метаданные';

  @override
  String get adminReplaceAllImages => 'Заменить все изображения';

  @override
  String get adminMetadataRefreshRequested => 'Запрошено обновление метаданных';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Не удалось обновить метаданные: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Удаленных совпадений не найдено';

  @override
  String get adminRemoteResults => 'Удаленные результаты';

  @override
  String get adminRemoteMetadataApplied => 'Применены удаленные метаданные';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Ошибка поиска в сети: $error';
  }

  @override
  String get adminUpdateContentType => 'Обновить тип контента';

  @override
  String get adminContentType => 'Тип контента';

  @override
  String get adminContentTypeUpdated => 'Тип контента обновлен.';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Не удалось изменить тип контента: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Не удалось загрузить редактор метаданных.';

  @override
  String get adminNoPeopleEntries => 'Нет записей о людях';

  @override
  String get adminNoExternalIds => 'Нет доступных внешних идентификаторов';

  @override
  String adminImageUpdated(String imageType) {
    return 'Изображение «$imageType» обновлено';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Не удалось скачать изображение: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Неподдерживаемый формат изображения';

  @override
  String get adminImageReadFailed =>
      'Не удалось прочитать выбранное изображение.';

  @override
  String adminImageUploaded(String imageType) {
    return 'Изображение «$imageType» загружено';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Не удалось загрузить изображение: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Удалить изображение «$imageType»';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Изображение «$imageType» удалено';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Не удалось удалить изображение: $error';
  }

  @override
  String get adminAllProviders => 'Все провайдеры';

  @override
  String get adminNoRemoteImages => 'Удаленных изображений не найдено';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Не удалось найти тюнеры: $error';
  }

  @override
  String get adminAddTuner => 'Добавить тюнер';

  @override
  String get adminEditTuner => 'Изменить тюнер';

  @override
  String get adminTunerTypeM3u => 'M3U-тюнер';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Файл или URL';

  @override
  String get adminTunerIpAddress => 'IP-адрес тюнера';

  @override
  String get adminTunerFriendlyName => 'Понятное имя';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Лимит одновременных подключений';

  @override
  String get adminTunerCountHelp =>
      'Максимальное число потоков, которое тюнер допускает одновременно. 0 — без ограничений.';

  @override
  String get adminTunerFallbackBitrate =>
      'Запасной максимальный битрейт потока';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Импортировать только избранные каналы';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Разрешить аппаратное транскодирование';

  @override
  String get adminTunerAllowFmp4 => 'Разрешить контейнер транскодирования fMP4';

  @override
  String get adminTunerAllowStreamSharing =>
      'Разрешить совместное использование потока';

  @override
  String get adminTunerEnableStreamLooping => 'Включить зацикливание потока';

  @override
  String get adminTunerIgnoreDts => 'Игнорировать DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Читать входной поток с исходной частотой кадров';

  @override
  String get adminEditProvider => 'Изменить провайдера';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Файл или URL';

  @override
  String get adminXmltvMoviePrefix => 'Префикс фильмов';

  @override
  String get adminXmltvMovieCategories => 'Категории фильмов';

  @override
  String get adminXmltvCategoriesHelp =>
      'Разделяйте несколько категорий вертикальной чертой.';

  @override
  String get adminXmltvKidsCategories => 'Детские категории';

  @override
  String get adminXmltvNewsCategories => 'Категории новостей';

  @override
  String get adminXmltvSportsCategories => 'Спортивные категории';

  @override
  String get adminSdUsername => 'Имя пользователя';

  @override
  String get adminSdPassword => 'Пароль';

  @override
  String get adminSdCountry => 'Страна';

  @override
  String get adminSdCountrySelect => 'Выберите страну';

  @override
  String get adminSdPostalCode => 'Почтовый индекс';

  @override
  String get adminSdGetListings => 'Получить списки';

  @override
  String get adminSdListings => 'Списки';

  @override
  String get adminEnableAllTuners => 'Включить все тюнеры';

  @override
  String get adminTunerType => 'Тип тюнера';

  @override
  String get adminTunerAdded => 'Тюнер добавлен';

  @override
  String adminTunerAddFailed(String error) {
    return 'Не удалось добавить тюнер: $error';
  }

  @override
  String get adminAddGuideProvider => 'Добавить поставщика руководств';

  @override
  String get adminProviderType => 'Тип поставщика';

  @override
  String get adminProviderAdded => 'Провайдер добавлен';

  @override
  String adminProviderAddFailed(String error) {
    return 'Не удалось добавить провайдера: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Не удалось удалить тюнер: $error';
  }

  @override
  String get adminTunerResetRequested => 'Запрошен сброс настроек тюнера';

  @override
  String adminTunerResetFailed(String error) {
    return 'Не удалось сбросить тюнер: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Этот тип тюнера не поддерживает сброс.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Не удалось удалить провайдера: $error';
  }

  @override
  String get adminRecordingSettings => 'Настройки записи';

  @override
  String get adminPrePadding => 'Предварительное заполнение (минуты)';

  @override
  String get adminPostPadding => 'Пост-дополнение (минуты)';

  @override
  String get adminRecordingPath => 'Путь записи';

  @override
  String get adminSeriesRecordingPath => 'Путь записи серии';

  @override
  String get adminMovieRecordingPath => 'Путь для записи фильмов';

  @override
  String get adminGuideDays => 'Дней телепрограммы';

  @override
  String get adminGuideDaysAuto => 'Автоматически';

  @override
  String adminGuideDaysValue(int days) {
    return '$days дн.';
  }

  @override
  String get adminRecordingPostProcessor => 'Путь к приложению постобработки';

  @override
  String get adminRecordingPostProcessorArgs => 'Аргументы постобработчика';

  @override
  String get adminSaveRecordingNfo => 'Сохранять NFO-метаданные записей';

  @override
  String get adminSaveRecordingImages => 'Сохранять изображения записей';

  @override
  String get adminLiveTvSectionTiming => 'Время';

  @override
  String get adminLiveTvSectionPaths => 'Пути записи';

  @override
  String get adminLiveTvSectionPostProcessing => 'Постобработка';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Телепрограмма: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Настройки записи сохранены.';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Не удалось сохранить настройки: $error';
  }

  @override
  String get adminSetChannelMappings => 'Установить сопоставления каналов';

  @override
  String get adminMappingJson => 'Сопоставление JSON';

  @override
  String get adminMappingJsonHint =>
      'Пример: сопоставление полезных данных JSON';

  @override
  String get adminChannelMappingsUpdated => 'Сопоставления каналов обновлены.';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Не удалось обновить сопоставления: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Не удалось загрузить администрацию Live TV.';

  @override
  String get adminTunerDevices => 'Тюнерные устройства';

  @override
  String get adminNoTunerHosts => 'Хосты тюнера не настроены';

  @override
  String get adminGuideProviders => 'Поставщики руководств';

  @override
  String get adminRefreshGuideData => 'Обновить телепрограмму';

  @override
  String get adminGuideRefreshStarted => 'Обновление телепрограммы запущено';

  @override
  String get adminGuideRefreshUnavailable =>
      'Задача обновления телепрограммы недоступна на этом сервере.';

  @override
  String get adminAddProvider => 'Добавить поставщика';

  @override
  String get adminNoListingProviders => 'Поставщики листинга не настроены';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Путь записи: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Путь сериалов: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Запас до: $minutes мин';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Запас после: $minutes мин';
  }

  @override
  String get adminTunerDiscovery => 'Тюнер Дискавери';

  @override
  String get adminChannelMappings => 'Сопоставления каналов';

  @override
  String get adminNoDiscoveredTuners => 'Тюнеров пока нет';

  @override
  String get adminSettingsSaved => 'Настройки сохранены.';

  @override
  String get adminBackupsNotAvailable =>
      'Резервные копии недоступны в этой сборке сервера.';

  @override
  String get adminRestoreWarning1 =>
      'При восстановлении ВСЕ текущие данные сервера будут заменены данными резервной копии.';

  @override
  String get adminRestoreWarning2 =>
      'Текущие настройки сервера, пользователи и данные библиотеки будут перезаписаны.';

  @override
  String get adminRestoreWarning3 =>
      'Сервер перезагрузится после восстановления.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Восстановить резервную копию $name сейчас?';
  }

  @override
  String get adminRestoreRequested =>
      'Запрос на восстановление. Перезапуск сервера может отключить этот сеанс.';

  @override
  String get adminBackupsTitle => 'Резервные копии';

  @override
  String get adminUnknownDate => 'Неизвестная дата';

  @override
  String get adminUnnamedBackup => 'Безымянное резервное копирование';

  @override
  String get adminLiveTvNotAvailable =>
      'Администрирование Live TV недоступно в этой сборке сервера.';

  @override
  String get adminLiveTvTitle => 'Администрация прямого эфира';

  @override
  String get adminApply => 'Применить';

  @override
  String get adminNotSet => 'Не установлено';

  @override
  String get adminReset => 'Сбросить';

  @override
  String get adminLogsTitle => 'Журналы сервера';

  @override
  String get adminLogsNewestFirst => 'Новейшие сначала';

  @override
  String get adminLogsOldestFirst => 'Сначала самый старый';

  @override
  String get adminLogsJustNow => 'Прямо сейчас';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes мин назад';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours ч назад';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days дн назад';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Не удалось загрузить $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return 'Совпадений: $count';
  }

  @override
  String get adminLogViewerNoMatches => 'Нет совпадающих строк';

  @override
  String get adminMetadataEditorTitle => 'Редактор метаданных';

  @override
  String get adminMetadataIdentify => 'Определить';

  @override
  String get adminMetadataType => 'Тип';

  @override
  String get adminMetadataDetails => 'Подробности';

  @override
  String get adminMetadataExternalIds => 'Внешние идентификаторы';

  @override
  String get adminMetadataImages => 'Изображения';

  @override
  String get adminMetadataFieldTitle => 'Название';

  @override
  String get adminMetadataFieldSortTitle => 'Сортировать заголовок';

  @override
  String get adminMetadataFieldOriginalTitle => 'Оригинальное название';

  @override
  String get adminMetadataFieldPremiereDate => 'Дата премьеры (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldEndDate => 'Дата окончания (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldProductionYear => 'Год производства';

  @override
  String get adminMetadataFieldOfficialRating => 'Официальный рейтинг';

  @override
  String get adminMetadataFieldCommunityRating => 'Рейтинг сообщества';

  @override
  String get adminMetadataFieldCriticRating => 'Критический рейтинг';

  @override
  String get adminMetadataFieldTagline => 'Слоган';

  @override
  String get adminMetadataFieldOverview => 'Обзор';

  @override
  String get adminMetadataGenres => 'Жанры';

  @override
  String get adminMetadataTags => 'Теги';

  @override
  String get adminMetadataStudios => 'Студии';

  @override
  String get adminMetadataPeople => 'Люди';

  @override
  String get adminMetadataAddGenre => 'Добавить жанр';

  @override
  String get adminMetadataAddTag => 'Добавить тег';

  @override
  String get adminMetadataAddStudio => 'Добавить студию';

  @override
  String get adminMetadataAddPerson => 'Добавить человека';

  @override
  String get adminMetadataEditPerson => 'Редактировать человека';

  @override
  String get adminMetadataRole => 'Роль';

  @override
  String get adminMetadataImagePrimary => 'Начальный';

  @override
  String get adminMetadataImageBackdrop => 'Фон';

  @override
  String get adminMetadataImageLogo => 'Логотип';

  @override
  String get adminMetadataImageBanner => 'Баннер';

  @override
  String get adminMetadataImageThumb => 'Большой палец';

  @override
  String get adminMetadataRecursive => 'Рекурсивный';

  @override
  String get adminMetadataProvider => 'Поставщик';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Изображение «$imageType» обновлено';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Изображение «$imageType» загружено';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Изображение «$imageType» удалено';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Не удалось скачать изображение: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Не удалось прочитать выбранное изображение.';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Не удалось загрузить изображение: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Удалить изображение «$imageType»';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Это удалит текущее изображение из элемента.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Не удалось удалить изображение: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Выбрать изображение «$imageType»';
  }

  @override
  String get adminMetadataUpload => 'Загрузить';

  @override
  String get adminMetadataUpdate => 'Обновлять';

  @override
  String get adminMetadataRemoteImage => 'Удаленное изображение';

  @override
  String get adminPluginsInstalled => 'Установлено';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Активный';

  @override
  String get adminPluginsRestart => 'Перезапуск';

  @override
  String get adminPluginsNoSearchResults =>
      'Нет плагинов, соответствующих вашему запросу';

  @override
  String get adminPluginsNoneInstalled => 'Плагины не установлены';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Доступно обновление: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Доступно обновление';

  @override
  String get adminPluginsPendingRemoval =>
      'Ожидается удаление после перезапуска';

  @override
  String get adminPluginsChangesPending => 'Изменения ожидают перезапуска';

  @override
  String get adminPluginsEnable => 'Давать возможность';

  @override
  String get adminPluginsDisable => 'Запрещать';

  @override
  String get adminPluginsInstallUpdate => 'Установить обновление';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Установить обновление (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Нет пакетов, соответствующих вашему запросу';

  @override
  String get adminPluginsCatalogEmpty => 'Нет доступных пакетов';

  @override
  String adminPluginsInstalling(String name) {
    return 'Идёт установка «$name»...';
  }

  @override
  String get adminPluginDetailExperimental => 'Экспериментальная интеграция';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Интеграция настроек плагина все еще находится на стадии эксперимента. Некоторые поля или макеты могут отображаться неправильно.';

  @override
  String get adminPluginDetailToggle404 =>
      'Не удалось переключить плагин. Серверу не удалось найти эту версию плагина. Попробуйте обновить плагины, затем повторите попытку.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Не удалось переключить плагин. Пожалуйста, проверьте журналы сервера для получения подробной информации.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Настройки $name';
  }

  @override
  String get adminPluginDetailDetails => 'Подробности';

  @override
  String get adminPluginDetailDeveloper => 'Разработчик';

  @override
  String get adminPluginDetailRepository => 'Репозиторий';

  @override
  String get adminPluginDetailBundled => 'В комплекте';

  @override
  String get adminPluginDetailEnablePlugin => 'Включить плагин';

  @override
  String get adminPluginDetailRestartRequired =>
      'Чтобы изменения вступили в силу, требуется перезагрузка сервера.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Этот плагин будет удален после перезапуска сервера.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Этот плагин неисправен и может работать неправильно.';

  @override
  String get adminPluginDetailNotSupported =>
      'Этот плагин не поддерживается текущей версией сервера.';

  @override
  String get adminPluginDetailSuperseded =>
      'Этот плагин был заменен более новой версией.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Не удалось загрузить репозитории: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Удалить репозиторий';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get adminReposRemove => 'Удалить';

  @override
  String adminReposSaveFailed(String error) {
    return 'Не удалось сохранить репозитории: $error';
  }

  @override
  String get adminReposEmpty => 'Репозитории не настроены';

  @override
  String get adminReposEmptySubtitle =>
      'Добавьте репозиторий для просмотра доступных плагинов.';

  @override
  String get adminReposUnnamed => '(безымянный)';

  @override
  String get adminReposEditTitle => 'Редактировать репозиторий';

  @override
  String get adminReposAddTitle => 'Добавить репозиторий';

  @override
  String get adminReposUrl => 'URL-адрес репозитория';

  @override
  String get adminReposNameHint => 'например Jellyfin Стабильный';

  @override
  String get adminPluginSettingsInvalidUrl => 'Неверный URL-адрес';

  @override
  String get adminGeneralSettingsTitle => 'Общие настройки';

  @override
  String get adminGeneralMetadataLanguage => 'Предпочитаемый язык метаданных';

  @override
  String get adminGeneralMetadataLanguageHint => 'например эн, де, фр.';

  @override
  String get adminGeneralMetadataCountry =>
      'Предпочтительная страна метаданных';

  @override
  String get adminGeneralMetadataCountryHint =>
      'например США, Германия, Франция';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Параллельное сканирование библиотеки';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Ограничение параллельного кодирования изображений';

  @override
  String get adminUnknownError => 'Неизвестная ошибка';

  @override
  String get adminBrowse => 'Просматривать';

  @override
  String get adminCloseBrowser => 'Закрыть браузер';

  @override
  String get adminNetworkingTitle => 'сеть';

  @override
  String get adminNetworkingRestartWarning =>
      'Изменения сетевых настроек могут потребовать перезагрузки сервера.';

  @override
  String get adminNetworkingRemoteAccess => 'Включить удаленный доступ';

  @override
  String get adminNetworkingPorts => 'Порты';

  @override
  String get adminNetworkingHttpPort => 'HTTP-порт';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-порт';

  @override
  String get adminNetworkingEnableHttps => 'Включить HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Локальная сеть';

  @override
  String get adminNetworkingLocalAddresses => 'Адреса локальной сети';

  @override
  String get adminNetworkingAddressHint => 'например 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Известные прокси';

  @override
  String get adminNetworkingProxyHint => 'например 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Белый список';

  @override
  String get adminNetworkingBlacklist => 'Черный список';

  @override
  String get adminNetworkingAddEntry => 'Добавить запись';

  @override
  String get adminBrandingTitle => 'Брендинг';

  @override
  String get adminBrandingLoginDisclaimer => 'Отказ от ответственности за вход';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML-код, отображаемый под формой входа';

  @override
  String get adminBrandingCustomCss => 'Пользовательский CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Пользовательский CSS, примененный к веб-интерфейсу';

  @override
  String get adminBrandingEnableSplash => 'Включить заставку';

  @override
  String get adminBrandingSplashUpload => 'Загрузить изображение';

  @override
  String get adminBrandingSplashUploaded => 'Заставка обновлена';

  @override
  String get adminBrandingSplashUploadFailed => 'Не удалось загрузить заставку';

  @override
  String get adminBrandingSplashDeleted => 'Заставка удалена';

  @override
  String get adminBrandingNoSplash => 'Своя заставка не задана';

  @override
  String get adminPlaybackHwAccel => 'Аппаратное ускорение';

  @override
  String get adminPlaybackHwAccelLabel => 'Аппаратное ускорение';

  @override
  String get adminPlaybackEnableHwEncoding => 'Включить аппаратное кодирование';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Включить аппаратное декодирование для:';

  @override
  String get adminPlaybackQsvDevice => 'Устройство QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Включить расширенный декодер NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Предпочитать системный аппаратный декодер';

  @override
  String get adminPlaybackColorDepth =>
      'Глубина цвета при аппаратном декодировании';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-битное декодирование HEVC';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-битное декодирование VP9';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Декодирование HEVC RExt 8/10 бит';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Декодирование HEVC RExt 12 бит';

  @override
  String get adminPlaybackHwEncodingSection => 'Аппаратное кодирование';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Разрешить кодирование HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Разрешить кодирование AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Включить энергоэффективный кодировщик Intel H.264';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Включить энергоэффективный кодировщик Intel HEVC';

  @override
  String get adminPlaybackToneMapping => 'Тональное отображение';

  @override
  String get adminPlaybackEnableTonemapping => 'Включить тональное отображение';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Включить тональное отображение VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Включить тональное отображение VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Алгоритм тонального отображения';

  @override
  String get adminPlaybackTonemappingMode => 'Режим тонального отображения';

  @override
  String get adminPlaybackTonemappingRange => 'Диапазон тонального отображения';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Десатурация тонального отображения';

  @override
  String get adminPlaybackTonemappingPeak => 'Пик тонального отображения';

  @override
  String get adminPlaybackTonemappingParam => 'Параметр тонального отображения';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Яркость тонального отображения VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Контраст тонального отображения VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Пресеты и качество';

  @override
  String get adminPlaybackEncoderPreset => 'Пресет кодировщика';

  @override
  String get adminPlaybackH264Crf => 'CRF кодирования H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF кодирования H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Метод деинтерлейсинга';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Удваивать частоту кадров при деинтерлейсинге';

  @override
  String get adminPlaybackAudioSection => 'Звук';

  @override
  String get adminPlaybackEnableAudioVbr => 'Включить VBR-кодирование звука';

  @override
  String get adminPlaybackDownmixBoost => 'Усиление при сведении звука';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Алгоритм сведения в стерео';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Максимальный размер очереди мультиплексирования';

  @override
  String get adminPlaybackAutoOption => 'Авто';

  @override
  String get adminPlaybackEncoding => 'Кодирование';

  @override
  String get adminPlaybackEncodingThreads => 'Кодирование потоков';

  @override
  String get adminPlaybackFallbackFont => 'Включить резервный шрифт';

  @override
  String get adminPlaybackFallbackFontPath => 'Резервный путь к шрифту';

  @override
  String get adminPlaybackStreaming => 'Потоковое вещание';

  @override
  String get adminResumeVideo => 'Видео';

  @override
  String get adminResumeAudiobooks => 'Аудиокниги';

  @override
  String get adminResumeMinAudiobookPct =>
      'Минимальный процент возобновления аудиокниги';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Максимальный процент возобновления аудиокниги';

  @override
  String get adminStreamingBitrateLimit =>
      'Ограничение скорости передачи удаленного клиента (Мбит/с)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Оставьте пустым или 0 для неограниченного количества';

  @override
  String get adminTrickplayHwAccel => 'Включить аппаратное ускорение';

  @override
  String get adminTrickplayHwEncoding => 'Включить аппаратное кодирование';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Включить извлечение только ключевого кадра';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Быстрее, но меньшая точность';

  @override
  String get adminTrickplayNonBlocking => 'Неблокирующий';

  @override
  String get adminTrickplayBlocking => 'Блокировка';

  @override
  String get adminTrickplayPriorityHigh => 'Высокий';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Выше нормы';

  @override
  String get adminTrickplayPriorityNormal => 'Нормальный';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Ниже нормы';

  @override
  String get adminTrickplayPriorityIdle => 'Праздный';

  @override
  String get adminTrickplayImageSettings => 'Настройки изображения';

  @override
  String get adminTrickplayInterval => 'Интервал (мс)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Как часто снимать кадры';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Ширина пикселей, разделенная запятыми (например, 320).';

  @override
  String get adminTrickplayQuality => 'Качество';

  @override
  String get adminTrickplayQScale => 'Шкала качества';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Меньшие значения = лучшее качество, файлы большего размера.';

  @override
  String get adminTrickplayJpegQuality => 'JPEG-качество';

  @override
  String get adminTrickplayProcessing => 'Обработка';

  @override
  String get adminTasksEmpty => 'Запланированных задач не найдено';

  @override
  String get adminTasksNoFilterMatch =>
      'Нет задач, соответствующих текущему фильтру.';

  @override
  String get adminTaskCancelling => 'Отмена...';

  @override
  String get adminTaskRunning => 'Бег...';

  @override
  String get adminTaskNeverRun => 'Никогда не беги';

  @override
  String get adminTaskStop => 'Остановить';

  @override
  String get adminRunningTasks => 'Выполняемые задачи';

  @override
  String get adminTaskRun => 'Бегать';

  @override
  String get adminTaskDetailLastExecution => 'Последняя казнь';

  @override
  String get adminTaskDetailStarted => 'Началось';

  @override
  String get adminTaskDetailEnded => 'Закончено';

  @override
  String get adminTaskDetailDuration => 'Продолжительность';

  @override
  String get adminTaskDetailErrorLabel => 'Ошибка:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Ежедневно в $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Еженедельно: $day в $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Каждые $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'При запуске приложения';

  @override
  String get adminTaskTriggerTypeDaily => 'Ежедневно';

  @override
  String get adminTaskTriggerTypeWeekly => 'Еженедельно';

  @override
  String get adminTaskTriggerTypeInterval => 'На интервале';

  @override
  String get adminTaskTriggerIntervalLabel => 'Интервал';

  @override
  String get adminTaskTriggerEveryHour => 'Каждый час';

  @override
  String get adminTaskTriggerEvery6Hours => 'Каждые 6 часов';

  @override
  String get adminTaskTriggerEvery12Hours => 'Каждые 12 часов';

  @override
  String get adminTaskTriggerEvery24Hours => 'Каждые 24 часа';

  @override
  String get adminTaskTriggerEvery2Days => 'Каждые 2 дня';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count часа',
      many: '$count часов',
      few: '$count часа',
      one: '$count час',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Время';

  @override
  String get adminTaskTriggerNoLimit => 'Без ограничений';

  @override
  String get adminActivityJustNow => 'Прямо сейчас';

  @override
  String get adminActivityLastHour => 'Последний час';

  @override
  String get adminActivityToday => 'Сегодня';

  @override
  String get adminActivityYesterday => 'Вчера';

  @override
  String get adminActivityOlder => 'Старше';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days дн назад';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours ч назад';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes мин назад';
  }

  @override
  String get adminActivityNow => 'сейчас';

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
    return '$days дн';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Настройте создание изображений Trickplay для миниатюр предварительного просмотра при перемотке.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Публичный HTTPS-порт';

  @override
  String get adminNetworkingBaseUrl => 'Базовый URL';

  @override
  String get adminNetworkingBaseUrlHint => 'например /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Публичный порт HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Требовать HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Перенаправлять все удалённые запросы на HTTPS. Не действует, если у сервера нет действительного сертификата.';

  @override
  String get adminNetworkingCertPassword => 'Пароль сертификата';

  @override
  String get adminNetworkingIpSettings => 'Настройки IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Включить IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Включить IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Включить автоматический проброс портов';

  @override
  String get adminNetworkingLocalSubnets => 'Сети LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Список IP-адресов или подсетей CIDR через запятую или с новой строки, которые считаются локальной сетью.';

  @override
  String get adminNetworkingPublishedUris => 'Публикуемые URI сервера';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Сопоставьте подсеть или адрес с публикуемым URL, например all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Путь сертификата';

  @override
  String get adminNetworkingRemoteIpFilter => 'Удаленный IP-фильтр';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Удаленный IP-фильтр';

  @override
  String get adminPlaybackVaapiDevice => 'Устройство ВА-API';

  @override
  String get adminPlaybackAutomatic => '0 = автоматический';

  @override
  String get adminPlaybackTranscodeTempPath => 'Временной путь перекодирования';

  @override
  String get adminPlaybackSegmentDeletion => 'Разрешить удаление сегмента';

  @override
  String get adminPlaybackSegmentKeep => 'Удержание сегмента (секунды)';

  @override
  String get adminPlaybackThrottleBuffering =>
      'Буферизация дроссельной заслонки';

  @override
  String get adminPlaybackThrottleDelay => 'Задержка троттлинга (сек)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Разрешить извлечение субтитров на лету';

  @override
  String get adminResumeMinPct => 'Минимальный процент резюме';

  @override
  String get adminResumeMinPctSubtitle =>
      'Контент должен быть воспроизведен после этого процента, чтобы сохранить прогресс.';

  @override
  String get adminResumeMaxPct => 'Максимальный процент резюме';

  @override
  String get adminResumeMaxPctSubtitle =>
      'После этого процента контент считается полностью воспроизведенным.';

  @override
  String get adminResumeMinDuration =>
      'Минимальная продолжительность возобновления (секунды)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Элементы короче этого значения не возобновляются.';

  @override
  String get adminTrickplayScanBehavior => 'Поведение сканирования';

  @override
  String get adminTrickplayProcessPriority => 'Приоритет процесса';

  @override
  String get adminTrickplayTileWidth => 'Ширина плитки';

  @override
  String get adminTrickplayTileHeight => 'Высота плитки';

  @override
  String get adminTrickplayProcessThreads => 'Потоки процесса';

  @override
  String get adminTrickplayWidthResolutions => 'Разрешение по ширине';

  @override
  String get adminMetadataDefault => 'По умолчанию';

  @override
  String get adminMetadataContentTypeUpdated => 'Тип контента обновлен.';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Не удалось изменить тип контента: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Порог медленного ответа (мс)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Включить предупреждения о медленных ответах';

  @override
  String get adminGeneralQuickConnect => 'Включить Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Сервер';

  @override
  String get adminGeneralSectionMetadata => 'Метаданные';

  @override
  String get adminGeneralSectionPaths => 'Пути';

  @override
  String get adminGeneralSectionPerformance => 'Производительность';

  @override
  String get adminGeneralCachePath => 'Путь к кэшу';

  @override
  String get adminGeneralMetadataPath => 'Путь метаданных';

  @override
  String get adminGeneralServerName => 'Имя сервера';

  @override
  String get adminGeneralDisplayLanguage => 'Предпочитаемый язык интерфейса';

  @override
  String get adminSettingsLoadFailed => 'Не удалось загрузить настройки';

  @override
  String get adminDiscover => 'Обнаружить';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Не удалось обновить сопоставления: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Ограничение времени: $duration';
  }

  @override
  String get folders => 'Папки';

  @override
  String get libraries => 'Библиотеки';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay отключен';

  @override
  String get syncPlayDisabledMessage =>
      'Включите SyncPlay в настройках, чтобы использовать синхронизированное воспроизведение.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сервер не поддерживается';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'Для SyncPlay требуется сервер Jellyfin. Текущий сервер его не поддерживает.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Группа';

  @override
  String get syncPlayGroupTooltip => 'Группа SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# участника',
      many: '# участников',
      few: '# участника',
      one: '# участник',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Игнорировать, подожди';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Не задерживайте группу, пока это устройство буферизуется.';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Продолжайте локально, не дожидаясь медленных участников';

  @override
  String get syncPlayRepeat => 'Повторить';

  @override
  String get syncPlayRepeatOne => 'Один';

  @override
  String get syncPlayShuffleModeShuffled => 'Перетасованный';

  @override
  String get syncPlayShuffleModeSorted => 'Отсортировано';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Синхронизировать текущую очередь воспроизведения';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Замените групповую очередь тем, что воспроизводится локально.';

  @override
  String get syncPlayLeaveGroup => 'Покинуть группу';

  @override
  String get syncPlayGroupQueue => 'Групповая очередь';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Элемент $index';
  }

  @override
  String get syncPlayPlayNow => 'Играть сейчас';

  @override
  String get syncPlayCreateNewGroup => 'Создать новую группу';

  @override
  String get syncPlayGroupName => 'Название группы';

  @override
  String get syncPlayDefaultGroupName => 'Моя группа SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Создать группу';

  @override
  String get syncPlayAvailableGroups => 'Доступные группы';

  @override
  String get syncPlayNoGroupsAvailable => 'Нет доступных групп';

  @override
  String get syncPlayJoinGroupQuestion => 'Присоединиться к группе SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Присоединение к группе SyncPlay может заменить вашу текущую очередь воспроизведения. Продолжать?';

  @override
  String get syncPlayJoin => 'Присоединиться';

  @override
  String get syncPlayStateIdle => 'Праздный';

  @override
  String get syncPlayStateWaiting => 'Ожидающий';

  @override
  String get syncPlayStatePaused => 'Приостановлено';

  @override
  String get syncPlayStatePlaying => 'Играя';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName присоединился к группе SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName покинул группу SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Доступ к SyncPlay запрещен';

  @override
  String get syncPlayAccessDeniedMessage =>
      'У вас нет доступа к одному или нескольким элементам в этой группе SyncPlay. Попросите владельца группы проверить разрешения библиотеки или выбрать другую очередь.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Синхронизация воспроизведения с «$groupName»';
  }

  @override
  String get voiceSearchUnavailable => 'Голосовой поиск недоступен.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Ошибка прямого воспроизведения Dolby Vision';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Не удалось запустить прямое воспроизведение для этого потока Dolby Vision. Повторить попытку перекодирования сервера?';

  @override
  String get retryWithTranscode => 'Повторить попытку с перекодированием';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision не поддерживается';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Это устройство не может напрямую декодировать контент Dolby Vision. Используйте резервный вариант HDR10 или запросите перекодирование сервера.';

  @override
  String get rememberMyChoice => 'Помни мой выбор';

  @override
  String get playHdr10Fallback => 'Воспроизвести резервный вариант HDR10';

  @override
  String get requestTranscode => 'Запросить перекодирование';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'обнаружено # ряда',
      many: 'обнаружено # рядов',
      few: 'обнаружено # ряда',
      one: 'обнаружен # ряд',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Посмотреть все';

  @override
  String get noItems => 'Нет товаров';

  @override
  String get switchUser => 'Сменить пользователя';

  @override
  String get remoteControl => 'Пульт дистанционного управления';

  @override
  String get mediaBarLoading => 'Загрузка панели мультимедиа...';

  @override
  String get mediaBarError => 'Медиа-бар не удалось загрузить';

  @override
  String get offlineServerUnavailable =>
      'Подключено к Интернету, но текущий сервер недоступен.';

  @override
  String get offlineNoInternet =>
      'Вы не в сети. Доступен только загруженный контент.';

  @override
  String get offlineFileNotAvailable => 'Файл недоступен';

  @override
  String get offlineSwitchServer => 'Переключить сервер';

  @override
  String get offlineSavedMedia => 'Сохраненные медиа';

  @override
  String get offlineBannerTitle => 'Нет подключения';

  @override
  String get offlineBannerSubtitle => 'Показаны ваши загрузки';

  @override
  String get offlineBannerAction => 'Загрузки';

  @override
  String get serverUnreachableBannerTitle => 'Сервер недоступен';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Пока он не восстановится, воспроизводятся загрузки';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Удаленное воспроизведение';

  @override
  String castControlFailed(String error) {
    return 'Не удалось выполнить команду трансляции: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Управление $kind';
  }

  @override
  String get castDeviceVolume => 'Громкость устройства';

  @override
  String get castVolumeUnavailable => 'Недоступно';

  @override
  String castStopKind(String kind) {
    return 'Остановить $kind';
  }

  @override
  String get audioLabel => 'Аудио';

  @override
  String get subtitlesLabel => 'Субтитры';

  @override
  String get pinConfirmTitle => 'Подтвердить PIN-код';

  @override
  String get pinSetTitle => 'Установить PIN-код';

  @override
  String get pinEnterTitle => 'Введите PIN-код';

  @override
  String get pinReenterToConfirm =>
      'Повторно введите свой PIN-код для подтверждения.';

  @override
  String pinEnterNDigit(int length) {
    return 'Введите PIN из $length цифр';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Введите свой PIN из $length цифр';
  }

  @override
  String get pinIncorrect => 'Неправильный PIN-код';

  @override
  String get pinMismatch => 'PIN-коды не совпадают';

  @override
  String get pinForgot => 'Забыли PIN-код?';

  @override
  String get pinClear => 'Очистить';

  @override
  String get pinBackspace => 'Стереть';

  @override
  String get quickConnectAuthorized => 'Запрос Quick Connect одобрен.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Код Quick Connect недействителен или истек.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect не поддерживается на этом сервере.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Не удалось авторизовать код Quick Connect.';

  @override
  String get quickConnectDisabled => 'Quick Connect отключен на этом сервере.';

  @override
  String get quickConnectForbidden =>
      'Ваша учетная запись не может авторизовать этот запрос Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Код Quick Connect не найден. Попробуйте новый код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Ошибка Quick Connect: $message';
  }

  @override
  String get quickConnectEnterCode => 'Введите код';

  @override
  String get quickConnectAuthorize => 'Авторизовать';

  @override
  String remoteCommandFailed(String error) {
    return 'Не удалось выполнить команду: $error';
  }

  @override
  String get remoteControlTitle => 'Пульт дистанционного управления';

  @override
  String get remoteFailedToLoadSessions => 'Не удалось загрузить сеансы';

  @override
  String get remoteNoSessions => 'Никаких контролируемых сессий';

  @override
  String get remoteStartPlayback =>
      'Начать воспроизведение на другом устройстве';

  @override
  String get unknownUser => 'Неизвестный';

  @override
  String get unknownItem => 'Неизвестный';

  @override
  String get remoteNothingPlaying => 'В этом сеансе ничего не воспроизводится';

  @override
  String get castingStarted => 'Трансляция началась на выбранном устройстве';

  @override
  String castingFailed(String error) {
    return 'Не удалось начать трансляцию: $error';
  }

  @override
  String get noRemoteDevices =>
      'Устройства удаленного воспроизведения недоступны.';

  @override
  String get noRemoteDevicesIos =>
      'Устройства удаленного воспроизведения недоступны.\n\nВ iOS цели AirPlay могут быть недоступны в симуляторе.';

  @override
  String get trackActionPlayNext => 'Играть дальше';

  @override
  String get trackActionAddToQueue => 'Добавить в очередь';

  @override
  String get trackActionAddToPlaylist => 'Добавить в плейлист';

  @override
  String get trackActionCancelDownload => 'Отменить загрузку';

  @override
  String get trackActionDeleteFromPlaylist => 'Удалить из плейлиста';

  @override
  String get trackActionMoveUp => 'Двигаться вверх';

  @override
  String get trackActionMoveDown => 'Вниз';

  @override
  String get trackActionRemoveFromFavorites => 'Удалить из избранного';

  @override
  String get trackActionAddToFavorites => 'Добавить в избранное';

  @override
  String get trackActionGoToAlbum => 'Перейти в альбом';

  @override
  String get trackActionGoToArtist => 'Перейти к исполнителю';

  @override
  String trackActionDownloading(String name) {
    return 'Скачивание $name...';
  }

  @override
  String get trackActionDeletedFile => 'Удален скачанный файл';

  @override
  String get trackActionDeleteFileFailed =>
      'Не удалось удалить загруженный файл';

  @override
  String get shuffleBy => 'В случайном порядке';

  @override
  String get shuffleSelectLibrary => 'Выбрать библиотеку';

  @override
  String get shuffleSelectGenre => 'Выберите жанр';

  @override
  String get shuffleLibrary => 'Библиотека';

  @override
  String get shuffleGenre => 'Жанр';

  @override
  String get shuffleNoLibraries => 'Нет совместимых библиотек.';

  @override
  String get shuffleNoGenres =>
      'Для этого режима произвольного воспроизведения жанры не найдены.';

  @override
  String get posterDisplayTitle => 'Отображать';

  @override
  String get posterImageType => 'Тип изображения';

  @override
  String get imageTypePoster => 'Плакат';

  @override
  String get imageTypeThumbnail => 'Миниатюра';

  @override
  String get imageTypeBanner => 'Баннер';

  @override
  String get playlistAddFailed => 'Не удалось добавить в плейлист';

  @override
  String get playlistCreateFailed => 'Не удалось создать плейлист';

  @override
  String get playlistNew => 'Новый плейлист';

  @override
  String get playlistCreate => 'Создавать';

  @override
  String get playlistCreateNew => 'Создать новый плейлист';

  @override
  String get playlistNoneFound => 'Плейлисты не найдены';

  @override
  String get addToPlaylist => 'Добавить в плейлист';

  @override
  String get lyricsNotAvailable => 'Нет доступных текстов';

  @override
  String get upNext => 'Далее';

  @override
  String get playNext => 'Играть дальше';

  @override
  String get stillWatchingContent =>
      'Воспроизведение приостановлено. Вы все еще смотрите?';

  @override
  String get stillWatchingStop => 'Остановить';

  @override
  String get stillWatchingContinue => 'Продолжать';

  @override
  String skipSegment(String segment) {
    return 'Пропустить: $segment';
  }

  @override
  String get liveTv => 'Прямой эфир';

  @override
  String get continueWatchingAndNextUp => 'Продолжить просмотр и следующее';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Скачивание $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Скачивание $fileName';
  }

  @override
  String get nextEpisode => 'Следующий эпизод';

  @override
  String get moreFromThisSeason => 'Еще из этого сезона';

  @override
  String get playerTooltipPlaybackSpeed => 'Скорость воспроизведения';

  @override
  String get playerTooltipCastControls => 'Управление трансляцией';

  @override
  String get playerTooltipPlaybackQuality => 'Битрейт';

  @override
  String get playerTooltipEnterFullscreen => 'Войти в полноэкранный режим';

  @override
  String get playerTooltipExitFullscreen => 'Выйти из полноэкранного режима';

  @override
  String get playerTooltipFloatOnTop => 'Плавать сверху';

  @override
  String get playerTooltipExitFloatOnTop => 'Отключить плавание сверху';

  @override
  String get playerTooltipLockLandscape => 'Блокировка ландшафта';

  @override
  String get playerTooltipUnlockOrientation => 'Разрешить вращение';

  @override
  String get playerTooltipPrevious => 'Предыдущий';

  @override
  String get playerTooltipSeekBack => 'Ищите назад';

  @override
  String get playerTooltipSeekForward => 'Ищи вперед';

  @override
  String get contextMenuMarkWatched => 'Отметить как просмотренное';

  @override
  String get contextMenuMarkUnwatched => 'Отметить как непросмотренное';

  @override
  String get contextMenuAddToFavorites => 'Добавить в избранное';

  @override
  String get contextMenuRemoveFromFavorites => 'Удалить из избранного';

  @override
  String get contextMenuGoToSeries => 'Перейти к серии';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Скрыть из «Продолжить просмотр»';

  @override
  String get contextMenuHideFromNextUp => 'Скрыть из «Далее»';

  @override
  String get contextMenuAddToCollection => 'Добавить в коллекцию';

  @override
  String get settingsAdministrationSubtitle =>
      'Доступ к панели администрирования сервера';

  @override
  String get settingsAccountSecurity => 'Учетная запись и безопасность';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Аутентификация, PIN-код и родительский контроль';

  @override
  String get settingsPersonalization => 'Персонализация';

  @override
  String get settingsPersonalizationSubtitle =>
      'Тема, навигация, домашние строки и видимость библиотеки.';

  @override
  String get settingsDynamicContent => 'Динамический контент';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медиа-панель и визуальные наложения';

  @override
  String get settingsPlaybackSyncplay => 'Воспроизведение и SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Настройки аудио/видео, субтитры, загрузки и элементы управления SyncPlay.';

  @override
  String get settingsIntegrationsSubtitle =>
      'Синхронизация плагинов, Seerr, рейтинги и многое другое';

  @override
  String get settingsAboutSubtitle =>
      'Версия приложения, юридическая информация и кредиты';

  @override
  String get settingsAuthenticationSection => 'АУТЕНТИФИКАЦИЯ';

  @override
  String get settingsSortServersBy => 'Сортировать серверы по';

  @override
  String get settingsLastUsed => 'Последнее использование';

  @override
  String get settingsAlphabetical => 'Алфавитный';

  @override
  String get settingsConnectionSection => 'ПОДКЛЮЧЕНИЕ';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Разрешить самоподписанные сертификаты';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Доверять серверам с самоподписанными сертификатами TLS или сертификатами частного центра. Включайте только для своих серверов: проверка сертификатов отключится для всех подключений.';

  @override
  String get settingsPrivacyAndSafetySection =>
      'КОНФИДЕНЦИАЛЬНОСТЬ И БЕЗОПАСНОСТЬ';

  @override
  String get settingsBlockedRatings => 'Заблокированные рейтинги';

  @override
  String get settingsGeneralStyle => 'Общий стиль';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Тематические акценты, фоны, индикаторы просмотра и музыкальная тема.';

  @override
  String get settingsDetailsScreen => 'Экран сведений';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Стиль, размытие фона и поведение вкладок';

  @override
  String get settingsHomePage => 'Домашняя страница';

  @override
  String get settingsHomePageSubtitle =>
      'Разделы, типы изображений, наложения и предварительный просмотр мультимедиа';

  @override
  String get settingsLibrariesSubtitle =>
      'Видимость библиотеки, просмотр папок и поведение на нескольких серверах';

  @override
  String get settingsTwentyFourHourClock => '24-часовой формат';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Используйте 24-часовой формат времени везде, где отображаются часы.';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Показывать кнопку перемешивания на панели навигации';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Показывать кнопку жанров на панели навигации';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Показывать кнопку избранного на панели навигации';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Показать кнопку «Библиотеки» на панели навигации.';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Показывать кнопку Seerr в панели навигации';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Всегда показывать подписи в верхней панели навигации';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Переключить видимость домашней страницы для каждой библиотеки. Перезапустите Moonfin, чтобы изменения вступили в силу.';

  @override
  String get settingsMediaBarAndLocalPreviews => 'Медиа-бар и локальные превью';

  @override
  String get settingsVisualOverlays => 'Визуальные наложения';

  @override
  String get settingsSeasonalSurprise => 'Сезонный сюрприз';

  @override
  String get settingsMetadataAndRatings => 'Метаданные и рейтинги';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase обеспечивает интеграцию на стороне сервера, включая дополнительные источники рейтингов, запросы Seerr и синхронизированные настройки.';

  @override
  String get settingsOfflineDownloads => 'Офлайн-загрузки';

  @override
  String get settingsHigh => 'Высокий';

  @override
  String get settingsLow => 'Низкий';

  @override
  String get settingsCustomPath => 'Пользовательский путь';

  @override
  String get settingsEnterDownloadFolderPath => 'Введите путь к папке загрузки';

  @override
  String get settingsConcurrentDownloads => 'Одновременные загрузки';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Максимальное количество элементов для загрузки одновременно.';

  @override
  String get settingsAppInfo => 'ИНФОРМАЦИЯ О ПРИЛОЖЕНИИ';

  @override
  String get settingsReportAnIssue => 'Сообщить о проблеме';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Откройте систему отслеживания проблем на GitHub.';

  @override
  String get settingsJoinDiscord => 'Присоединяйтесь к Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Общайтесь с сообществом';

  @override
  String get settingsJoinTheDiscord => 'Присоединяйтесь к Discord';

  @override
  String get settingsSupportMoonfin => 'Поддержка Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Угостите разработчика чашкой кофе';

  @override
  String get settingsLegal => 'ЮРИДИЧЕСКИЙ';

  @override
  String get settingsLicenses => 'Лицензии';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Уведомления о лицензии с открытым исходным кодом';

  @override
  String get settingsPrivacyPolicy => 'политика конфиденциальности';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Как Moonfin обрабатывает ваши данные';

  @override
  String get settingsCheckForUpdates => 'Проверьте наличие обновлений';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Проверьте наличие последней версии Moonfin';

  @override
  String get settingsPoweredByFlutter => 'При поддержке Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# лицензионных уведомления',
      many: '# лицензионных уведомлений',
      few: '# лицензионных уведомления',
      one: '# лицензионное уведомление',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Оба';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Фильтр типов содержимого в случайном порядке';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Настройки воспроизведения видео';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Основной видеодвижок и настройки качества потоковой передачи';

  @override
  String get settingsAudioPreferences => 'Аудио настройки';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аудиодорожки, параметры обработки и передачи';

  @override
  String get settingsAutomationAndQueue => 'Автоматизация и очередь';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматизированное воспроизведение и секвенирование';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Качество загрузки, ограничения хранилища и размер очереди';

  @override
  String get settingsSyncplaySubtitle =>
      'Логика синхронизации для групповых сеансов';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Специализированные функции игрока. Используйте с осторожностью, так как некоторые параметры могут вызвать проблемы с воспроизведением.';

  @override
  String get settingsSkipIntrosAndOutros => 'Пропустить интро и аутро?';

  @override
  String get settingsMediaSegmentCountdown => 'Обратный отсчёт сегментов';

  @override
  String get settingsProgressBar => 'Полоса прогресса';

  @override
  String get settingsTimer => 'Таймер';

  @override
  String get settingsNone => 'Нет';

  @override
  String get settingsPromptUser => 'Подскажите пользователю';

  @override
  String get settingsSkip => 'Пропускать';

  @override
  String get settingsDoNothing => 'Ничего не делать';

  @override
  String get settingsMaxBitrateDescription =>
      'Ограничьте битрейт потоковой передачи. Содержимое, превышающее этот порог, будет перекодировано в соответствии с размером.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ограничьте максимальное разрешение, которое запрашивает игрок. Контент с более высоким разрешением будет перекодирован.';

  @override
  String get settingsPlayerZoomDescription =>
      'Как масштабировать видео по размеру экрана.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Механизм воспроизведения (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Выберите механизм воспроизведения по умолчанию на устройствах Android TV. Изменения применяются к следующему сеансу воспроизведения.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (рекомендуется)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (устаревший)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (старый вариант)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (рекомендуется)';

  @override
  String get settingsDolbyVisionFallback => 'Резервный режим Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Поведение заголовков Dolby Vision на устройствах без декодирования Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Спрашивайте каждый раз';

  @override
  String get settingsPreferHdr10Fallback =>
      'Предпочитаю резервный вариант HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Предпочитаю серверное перекодирование';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Профиль Dolby Vision 7 Прямое воспроизведение';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Определяет, должны ли потоки уровня улучшения Dolby Vision 7 напрямую воспроизводиться.';

  @override
  String get settingsAutoAftkrtEnabled => 'Авто (AFTKRT включен)';

  @override
  String get settingsEnabledOnThisDevice => 'Включено на этом устройстве';

  @override
  String get settingsDisabledPreferTranscode =>
      'Отключено (предпочитает перекодирование)';

  @override
  String get settingsResumeRewindDescription =>
      'При возобновлении воспроизведения (со страницы «Продолжить просмотр» или со страницы медиафайла) на сколько секунд следует перемотать назад?';

  @override
  String get settingsUnpauseRewindDescription =>
      'При возобновлении воспроизведения после нажатия кнопки паузы на сколько секунд должна перематываться?';

  @override
  String get settingsSkipBackLengthDescription =>
      'На сколько секунд вернуться назад после нажатия кнопки перемотки.';

  @override
  String get settingsOneSecond => '1 секунда';

  @override
  String get settingsThreeSeconds => '3 секунды';

  @override
  String get settingsFortyFiveSeconds => '45 секунд';

  @override
  String get settingsSixtySeconds => '60 секунд';

  @override
  String get settingsSkipForwardLengthDescription =>
      'На сколько секунд можно перейти вперед после нажатия кнопки быстрой перемотки вперед.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Битовый поток AC3 на внешний декодер';

  @override
  String get settingsCinemaMode => 'Режим кино';

  @override
  String get settingsCinemaModeSubtitle =>
      'Включайте трейлеры/прероллы перед основным фильмом';

  @override
  String get settingsNextUpDisplayDescription =>
      'В расширенном режиме отображается полная карточка с обложкой и описанием эпизода. Минимальный показывает компактное наложение обратного отсчета. Отключено полностью скрывает подсказку.';

  @override
  String get settingsShort => 'Короткий';

  @override
  String get settingsLong => 'Длинный';

  @override
  String get settingsVeryLong => 'Очень длинный';

  @override
  String get settingsVideoStartDelay => 'Задержка начала видео';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value мс';
  }

  @override
  String get settingsLiveTvDirect => 'Прямой эфир';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Включить прямое воспроизведение для Live TV';

  @override
  String get settingsOpenGroups => 'Открытые группы';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Создавайте группы SyncPlay, присоединяйтесь к ним или управляйте ими.';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Включено';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Включить функции группового просмотра';

  @override
  String get settingsSyncplayButton => 'Кнопка SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Показывать кнопку SyncPlay на панели навигации.';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Расширенная коррекция';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Включить детальную логику синхронизации';

  @override
  String get settingsSyncplaySyncCorrection => 'Коррекция синхронизации';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Автоматически настраивайте воспроизведение, чтобы оставаться синхронизированным';

  @override
  String get settingsSyncplaySpeedToSync => 'Скорость синхронизации';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Используйте регулировку скорости воспроизведения для синхронизации';

  @override
  String get settingsSyncplaySkipToSync => 'Перейти к синхронизации';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Используйте поиск для синхронизации';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Минимальная задержка скорости';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Задержка максимальной скорости';

  @override
  String get settingsSyncplaySpeedDuration => 'Скорость Продолжительность';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Минимальная задержка пропуска';

  @override
  String get settingsSyncplayExtraOffset => 'Дополнительное смещение SyncPlay';

  @override
  String get onNow => 'Включено сейчас';

  @override
  String get collections => 'Коллекции';

  @override
  String get lastPlayed => 'Последняя игра';

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
    return 'Недавно вышедшее: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Автовоспроизведение следующего эпизода';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Автоматически включать следующий эпизод, если он доступен.';

  @override
  String get skipSilenceTitle => 'Пропускать тишину';

  @override
  String get skipSilenceSubtitle =>
      'Автоматически пропускать участки тишины, если поток это поддерживает.';

  @override
  String get allowExternalAudioEffectsTitle => 'Разрешить внешние аудиоэффекты';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Разрешить приложениям эквалайзера и эффектов (например, Wavelet) подключаться к сеансам воспроизведения Media3.';

  @override
  String get disableTunnelingTitle => 'Отключить туннелирование';

  @override
  String get disableTunnelingSubtitle =>
      'Принудительно воспроизводить без туннелирования. Полезно на устройствах с разрывами звука и видео при туннелировании.';

  @override
  String get enableTunnelingTitle => 'Включить туннелирование';

  @override
  String get enableTunnelingSubtitle =>
      'Для опытных пользователей. Направляет звук и видео по связанному аппаратному тракту. Выключено по умолчанию, так как на некоторых устройствах вызывает выпадения звука и видео.';

  @override
  String get mapDolbyVisionP7Title =>
      'Преобразовывать Dolby Vision профиля 7 в HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Воспроизводить потоки Dolby Vision профиля 7 как HDR10-совместимый HEVC на устройствах без Dolby Vision.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Использовать встроенные стили субтитров';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Применять цвета, шрифты и позиционирование, встроенные в дорожку субтитров. Отключите, чтобы использовать ваши настройки стиля.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Использовать встроенные размеры шрифта субтитров';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Применять размеры шрифта, встроенные в дорожку субтитров. Отключите, чтобы использовать размер из ваших настроек стиля.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Показывать сведения о медиа';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Показывать сведения о выбранном элементе вверху страниц библиотеки.';

  @override
  String get hideBackdropsInLibraries => 'Скрывать фоны при просмотре?';

  @override
  String get useDetailedSubHeadings => 'Подробные подзаголовки';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Показывать подробный или минималистичный подзаголовок на страницах библиотеки.';

  @override
  String get savedThemesDeleteDialogTitle => 'Удалить сохранённую тему?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Удалить «$themeName» из кэша этого устройства?';
  }

  @override
  String get themeStore => 'Магазин тем';

  @override
  String get themeStoreSubtitle => 'Смотрите и сохраняйте темы сообщества';

  @override
  String get themeStoreDescription =>
      'Сохраните тему, чтобы пользоваться ей как остальными сохранёнными темами.';

  @override
  String get themeStoreEmpty => 'Сейчас нет доступных тем.';

  @override
  String get themeStoreLoadFailed =>
      'Не удалось загрузить магазин тем. Проверьте подключение и повторите попытку.';

  @override
  String get themeStoreSave => 'Сохранить';

  @override
  String get themeStoreSaveAndApply => 'Сохранить и применить';

  @override
  String get themeStoreSaved => 'Сохранено';

  @override
  String get themeStoreInvalidMessage => 'Не удалось загрузить эту тему.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Тема «$themeName» сохранена.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Тема «$themeName» удалена с этого устройства.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Не удалось удалить «$themeName».';
  }

  @override
  String get savedThemesTitle => 'Сохранённые темы';

  @override
  String get savedThemesDescription =>
      'Это темы, скачанные из плагина Moonfin для текущего сервера. Удаление затрагивает только локальную копию.';

  @override
  String get savedThemesEmpty =>
      'Для этого сервера сохранённых тем не найдено.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • сейчас активна';
  }

  @override
  String get savedThemesDeleteTooltip => 'Удалить сохранённую тему';

  @override
  String get savedThemesManageSubtitle =>
      'Управление скачанными темами плагина на этом устройстве';

  @override
  String get themeEditor => 'Редактор тем';

  @override
  String get themeEditorSubtitle => 'Открыть редактор тем Moonfin в браузере';

  @override
  String get homeScreen => 'Главный экран';

  @override
  String get bottomBar => 'Нижняя панель';

  @override
  String get homeRowsStyleClassic => 'Классический';

  @override
  String get homeRowsStyleModern => 'Современный';

  @override
  String get homeRowsSection => 'Ряды на главной';

  @override
  String get homeRowDisplay => 'Отображение рядов на главной';

  @override
  String get homeRowSections => 'Разделы рядов на главной';

  @override
  String get homeRowToggles => 'Переключатели рядов';

  @override
  String get homeRowTogglesSubtitle =>
      'Включайте и отключайте категории рядов на основе библиотек';

  @override
  String get homeRowTogglesDescription =>
      'Включите переключатели ниже, чтобы ряды появились в разделах главной.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      '«Классический» сохраняет тип изображения для каждого ряда и информационный оверлей. «Современный» использует ряды с переходом от постера к фону.';

  @override
  String get displayFavoritesRows => 'Показывать ряды избранного';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Показывать ряды с избранными фильмами, сериалами и другим в разделах главной.';

  @override
  String get favoritesRowSorting => 'Сортировка рядов избранного';

  @override
  String get favoritesRowSortingDescription =>
      'Сортируйте ряды избранного по дате добавления, дате выхода, алфавиту и не только.';

  @override
  String get displayCollectionsRows => 'Показывать ряды коллекций';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Показывать ряды коллекций в разделах главной.';

  @override
  String get collectionsRowSorting => 'Сортировка рядов коллекций';

  @override
  String get collectionsRowSortingDescription =>
      'Сортируйте ряды коллекций по дате добавления, дате выхода, алфавиту и не только.';

  @override
  String get displayGenresRows => 'Показывать ряды жанров';

  @override
  String get displayGenresRowsSubtitle =>
      'Показывать ряды жанров в разделах главной.';

  @override
  String get genresRowSorting => 'Сортировка рядов жанров';

  @override
  String get genresRowSortingDescription =>
      'Сортируйте ряды жанров по дате добавления, дате выхода, алфавиту и не только.';

  @override
  String get genresRowItems => 'Содержимое рядов жанров';

  @override
  String get genresRowItemsDescription =>
      'Показывать в рядах жанров фильмы, сериалы или и то, и другое.';

  @override
  String get displayPlaylistsRows => 'Показывать ряды плейлистов';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Показывать ряды плейлистов в разделах главной.';

  @override
  String get playlistsRowSorting => 'Сортировка рядов плейлистов';

  @override
  String get playlistsRowSortingDescription =>
      'Сортируйте ряды плейлистов по дате добавления, дате выхода, алфавиту и не только.';

  @override
  String get displayAudioRows => 'Показывать аудиоряды';

  @override
  String get displayAudioRowsSubtitle =>
      'Показывать аудиоряды в разделах главной.';

  @override
  String get audioRowsSorting => 'Сортировка аудиорядов';

  @override
  String get audioRowsSortingDescription =>
      'Сортируйте аудиоряды по дате добавления, дате выхода, алфавиту и не только.';

  @override
  String get audioPlaylists => 'Аудиоплейлисты';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get layout => 'Компоновка';

  @override
  String get theme => 'Тема';

  @override
  String get keyboard => 'Клавиатура';

  @override
  String get navButtons => 'Кнопки';

  @override
  String get rendering => 'Отрисовка';

  @override
  String get mpvConfiguration => 'Настройка MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Внешний плеер';

  @override
  String get externalPlayerAppDescription =>
      'Выберите внешний плеер, чтобы включить запуск долгим нажатием';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Показывать выбор приложения при запуске воспроизведения.';

  @override
  String get loadingInstalledPlayers => 'Загрузка установленных плееров...';

  @override
  String get connection => 'Подключение';

  @override
  String get audioTranscodeTarget => 'Целевой формат транскодирования звука';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Поддерживается на этом устройстве';

  @override
  String get notSupportedOnThisDevice => 'Не поддерживается на этом устройстве';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Передавать битовый поток DTS:X (DTS UHD) на внешний декодер.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD с Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Поведение плеера';

  @override
  String get playbackEnhancements => 'Улучшения воспроизведения';

  @override
  String get alwaysOn => 'Всегда включено.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Заменять «Пропустить титры» на «Далее»';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Показывать оверлей «Далее» вместо кнопки «Пропустить титры».';

  @override
  String get playerRouting => 'Маршрутизация плеера';

  @override
  String get preferSoftwareDecoders => 'Предпочитать программные декодеры';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Использовать FFmpeg (звук) и libgav1 (AV1) вместо аппаратных декодеров. Отключите, если ломается passthrough звука по HDMI.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Открывать видео в выбранном внешнем приложении на Android TV.';

  @override
  String get automaticQueuing => 'Автоматическая очередь';

  @override
  String get preferSdhSubtitles => 'Предпочитать субтитры SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Отдавать приоритет дорожкам SDH/CC при автовыборе.';

  @override
  String get webDiagnostics => 'Веб-диагностика';

  @override
  String get webDiagnosticsTitle => 'Веб-диагностика Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Эта страница помогает диагностировать проблемы подключения в браузере (CORS, смешанное содержимое и настройки обнаружения).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Обнаружен сбой из-за смешанного содержимого';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Обнаружен сбой CORS/preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin обнаружил, что HTTPS-страница обращается к серверу по HTTP. Браузеры блокируют такой запрос ещё до того, как он дойдёт до сервера.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin обнаружил сбой запроса на уровне браузера. Обычно он вызван отсутствием заголовков CORS или preflight на медиасервере.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Целевой URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Подробности: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Текущий контекст выполнения';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Схема';

  @override
  String get webDiagnosticsPluginMode => 'Режим плагина';

  @override
  String get webDiagnosticsWebRtcScan => 'Сканирование WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'Принудительный URL сервера';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL сервера по умолчанию';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL прокси обнаружения';

  @override
  String get notConfigured => 'не настроено';

  @override
  String get webDiagnosticsMixedContent => 'Смешанное содержимое';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Эта страница загружена по HTTPS, но один или несколько заданных URL используют HTTP. Браузеры блокируют обращения HTTPS-страниц к HTTP-API.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Решение: используйте HTTPS для медиасервера или прокси либо открывайте Moonfin по HTTP только в доверенных локальных сетях.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'В текущих настройках явных признаков смешанного содержимого не обнаружено.';

  @override
  String get webDiagnosticsCorsChecklist => 'Чек-лист CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Разрешите источник браузера в Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Добавьте Authorization, X-Emby-Authorization и X-Emby-Token в Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Откройте Content-Range и Accept-Ranges для потоковой передачи и перемотки.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Отвечайте 204 на preflight-запросы OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Пример фрагмента заголовков (в стиле nginx)';

  @override
  String get note => 'Примечание';

  @override
  String get webDiagnosticsNonWebNote =>
      'Этот раздел диагностики предназначен для веб-сборок. Если вы видите его на другой платформе, проверки могут быть неприменимы.';

  @override
  String get backToServerSelect => 'Назад к выбору сервера';

  @override
  String get signOutAllUsers => 'Выйти из всех аккаунтов';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Доступ к микрофону запрещён навсегда. Включите его в системных настройках.';

  @override
  String get voiceSearchPermissionRequired =>
      'Для голосового поиска нужен доступ к микрофону.';

  @override
  String get voiceSearchNoMatch => 'Не удалось разобрать. Попробуйте ещё раз.';

  @override
  String get voiceSearchNoSpeechDetected => 'Речь не обнаружена.';

  @override
  String get voiceSearchMicrophoneError => 'Ошибка микрофона.';

  @override
  String get voiceSearchNeedsInternet =>
      'Для голосового поиска нужен интернет.';

  @override
  String get voiceSearchServiceBusy =>
      'Голосовая служба занята. Попробуйте ещё раз.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Доступ к микрофону запрещён навсегда.';

  @override
  String get microphonePermissionDenied => 'Доступ к микрофону запрещён.';

  @override
  String get speechRecognitionUnavailable =>
      'Распознавание речи недоступно на этом устройстве.';

  @override
  String get openIosRoutePicker => 'Открыть выбор устройства вывода iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Выбор устройства AirPlay недоступен на этом устройстве.';

  @override
  String get videos => 'Видео';

  @override
  String get programs => 'Передачи';

  @override
  String get songs => 'Песни';

  @override
  String get photoAlbums => 'Фотоальбомы';

  @override
  String get photos => 'Фото';

  @override
  String get people => 'Люди';

  @override
  String get recentlyReleasedEpisodes => 'Недавно вышедшие эпизоды';

  @override
  String get watchAgain => 'Посмотреть снова';

  @override
  String get guestAppearances => 'Гостевые появления';

  @override
  String get appearancesSeerr => 'Появления (Seerr)';

  @override
  String get crewContributionsSeerr => 'Работа в съёмочной группе (Seerr)';

  @override
  String get watchWithGroup => 'Смотреть с группой';

  @override
  String get errors => 'Ошибки';

  @override
  String get warnings => 'Предупреждения';

  @override
  String get disk => 'Диск';

  @override
  String get openInBrowser => 'Открыть в браузере';

  @override
  String get embeddedBrowserNotAvailable =>
      'Встроенный браузер недоступен на этой платформе.';

  @override
  String get adminRestartServerConfirmation => 'Перезапустить сервер?';

  @override
  String get adminShutdownServerConfirmation =>
      'Выключить сервер? Запускать его придётся вручную.';

  @override
  String get internal => 'Внутренний';

  @override
  String get idle => 'Ожидание';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Пользователи не найдены';

  @override
  String get adminNoUsersMatchSearch => 'Нет пользователей по вашему запросу';

  @override
  String get adminNoDevicesFound => 'Устройства не найдены';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Нет устройств, подходящих под текущие фильтры';

  @override
  String get passwordSet => 'Пароль задан';

  @override
  String get noPasswordConfigured => 'Пароль не задан';

  @override
  String get remoteAccess => 'Удалённый доступ';

  @override
  String get localOnly => 'Только локально';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Не удалось загрузить аналитику медиа';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Сводная аналитика по всем медиабиблиотекам.';

  @override
  String get analyticsTopArtists => 'Топ исполнителей';

  @override
  String get analyticsTopAuthors => 'Топ авторов';

  @override
  String get analyticsTopContributors => 'Топ участников';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count библиотеки',
      many: '$count библиотек',
      few: '$count библиотеки',
      one: '$count библиотека',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Для этого выбора пока нет данных по проиндексированным медиа.';

  @override
  String get analyticsLibraryDetails => 'Сведения о библиотеке';

  @override
  String get analyticsLibraryBreakdown => 'Разбивка по библиотекам';

  @override
  String get analyticsNoLibrariesAvailable => 'Библиотеки недоступны.';

  @override
  String get adminServerAdministrationTitle => 'Администрирование сервера';

  @override
  String get adminServerPathData => 'Данные';

  @override
  String get adminServerPathImageCache => 'Кэш изображений';

  @override
  String get adminServerPathCache => 'Кэш';

  @override
  String get adminServerPathLogs => 'Журналы';

  @override
  String get adminServerPathMetadata => 'Метаданные';

  @override
  String get adminServerPathTranscode => 'Транскодирование';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned => 'Этот сервер не вернул пути.';

  @override
  String adminPercentUsed(int percent) {
    return 'Использовано $percent%';
  }

  @override
  String get userActivity => 'Активность пользователей';

  @override
  String get systemEvents => 'Системные события';

  @override
  String get needsAttention => 'Требует внимания';

  @override
  String get adminDrawerSectionServer => 'Сервер';

  @override
  String get adminDrawerSectionPlayback => 'Воспроизведение';

  @override
  String get adminDrawerSectionDevices => 'Устройства';

  @override
  String get adminDrawerSectionAdvanced => 'Дополнительно';

  @override
  String get adminDrawerSectionPlugins => 'Плагины';

  @override
  String get adminDrawerSectionLiveTv => 'Прямой эфир';

  @override
  String get homeVideos => 'Домашнее видео';

  @override
  String get mixedContent => 'Смешанный контент';

  @override
  String get homeVideosAndPhotos => 'Домашнее видео и фото';

  @override
  String get mixedMoviesAndShows => 'Фильмы и сериалы вместе';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Записи не найдены';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'В архиве .$extension не найдено страниц с изображениями.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Ошибка встроенного отображения ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Ошибка отображения EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Отсутствует локальный файл для читалки: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status при открытии данных книги из $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Нет доступной конечной точки для чтения книги';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Формат архива комикса не поддерживается: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Плагин распаковки CBR недоступен на этой платформе.';

  @override
  String get failedToExtractCbrArchive => 'Не удалось распаковать архив .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Распаковка CB7 недоступна на этой платформе.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Плагин распаковки CB7 недоступен на этой платформе.';

  @override
  String get closeGenrePanel => 'Закрыть панель жанров';

  @override
  String get loadingShuffle => 'Подготовка перемешивания...';

  @override
  String get libraryShuffleLabel => 'ПЕРЕМЕШАТЬ БИБЛИОТЕКУ';

  @override
  String get randomShuffleLabel => 'СЛУЧАЙНОЕ ПЕРЕМЕШИВАНИЕ';

  @override
  String get genresShuffleLabel => 'ПЕРЕМЕШАТЬ ПО ЖАНРАМ';

  @override
  String get autoHdrSwitching => 'Автопереключение HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Автоматически включать HDR при воспроизведении HDR-видео и восстанавливать режим экрана при выходе.';

  @override
  String get whenFullscreen => 'В полноэкранном режиме';

  @override
  String get changeArtwork => 'Изменить обложку';

  @override
  String get missing => 'Отсутствует';

  @override
  String get transcodingLimits => 'Ограничения транскодирования';

  @override
  String get clearAllArtworkButton => 'Очистить все обложки?';

  @override
  String get clearAllArtworkWarning => 'Очистить все скачанные обложки?';

  @override
  String get confirmClear => 'Подтвердите очистку';

  @override
  String confirmClearMessage(String itemType) {
    return 'Очистить: $itemType?';
  }

  @override
  String get uploadButton => 'Загрузить?';

  @override
  String get resolutionLabel => 'Разрешение: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Показывать обложки только на языке интерфейса';

  @override
  String get confirmClearAll => 'Подтвердите полную очистку';

  @override
  String get imageUploadSuccess => 'Изображение загружено!';

  @override
  String imageUploadFailed(String error) {
    return 'Не удалось загрузить изображение: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Не удалось установить изображение: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Не удалось удалить изображение: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Не удалось очистить все обложки: $error';
  }

  @override
  String get yes => 'Да';

  @override
  String get posterCategory => 'Постер';

  @override
  String get backdropsCategory => 'Фоны';

  @override
  String get bannerCategory => 'Баннер';

  @override
  String get logoCategory => 'Логотип';

  @override
  String get thumbnailCategory => 'Миниатюра';

  @override
  String get artCategory => 'Арт';

  @override
  String get discArtCategory => 'Арт диска';

  @override
  String get screenshotCategory => 'Скриншот';

  @override
  String get boxCoverCategory => 'Обложка коробки';

  @override
  String get boxRearCoverCategory => 'Задняя обложка коробки';

  @override
  String get menuArtCategory => 'Арт меню';

  @override
  String get confirmItemPoster => 'постер';

  @override
  String get confirmItemBackdrop => 'фон';

  @override
  String get confirmItemBanner => 'баннер';

  @override
  String get confirmItemLogo => 'логотип';

  @override
  String get confirmItemThumbnail => 'миниатюра';

  @override
  String get confirmItemArt => 'арт';

  @override
  String get confirmItemDiscArt => 'арт диска';

  @override
  String get confirmItemScreenshot => 'скриншот';

  @override
  String get confirmItemBoxCover => 'обложка коробки';

  @override
  String get confirmItemBoxRearCover => 'задняя обложка коробки';

  @override
  String get confirmItemMenuArt => 'арт меню';

  @override
  String get resolutionAll => 'Все';

  @override
  String get resolutionHigh => 'Высокое (1080p+)';

  @override
  String get resolutionMedium => 'Среднее (720p)';

  @override
  String get resolutionLow => 'Низкое (<720p)';

  @override
  String get sources => 'Источники';

  @override
  String get audiobookChapters => 'Главы';

  @override
  String get audiobookBookmarks => 'Закладки';

  @override
  String get audiobookNotes => 'Заметки';

  @override
  String get audiobookQueue => 'Очередь';

  @override
  String get audiobookTimeline => 'Хронология';

  @override
  String get audiobookTimelineEmpty => 'Хронология пуста';

  @override
  String get audiobookWholeBook => 'Вся книга';

  @override
  String get audiobookFocusedTimeline => 'Текущий фрагмент';

  @override
  String get audiobookExportBookmarks => 'Экспорт закладок';

  @override
  String get audiobookExportNotes => 'Экспорт заметок';

  @override
  String get audiobookExportAll => 'Экспорт всего';

  @override
  String audiobookExportSuccess(String path) {
    return 'Экспортировано в $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Ошибка экспорта: $error';
  }

  @override
  String get audiobookLyrics => 'Текст';

  @override
  String get audiobookAddBookmark => 'Добавить закладку';

  @override
  String get audiobookAddNote => 'Добавить заметку';

  @override
  String get audiobookEditNote => 'Изменить заметку';

  @override
  String get audiobookNoteHint => 'Напишите заметку к этому моменту';

  @override
  String get audiobookSleepTimer => 'Таймер сна';

  @override
  String get audiobookSleepOff => 'Выкл.';

  @override
  String get audiobookSleepEndOfChapter => 'Конец главы';

  @override
  String get audiobookSleepCustom => 'Свой';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Осталось $remaining';
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
  String get audiobookPlaybackSpeed => 'Скорость воспроизведения';

  @override
  String get audiobookRemainingTime => 'Осталось';

  @override
  String get audiobookElapsedTime => 'Прошло';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Назад $seconds с';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Вперёд $seconds с';
  }

  @override
  String get audiobookPreviousChapter => 'Предыдущая глава';

  @override
  String get audiobookNextChapter => 'Следующая глава';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Глава $current из $total';
  }

  @override
  String get audiobookNoChapters => 'Глав нет';

  @override
  String get audiobookNoBookmarks => 'Закладок пока нет';

  @override
  String get audiobookNoNotes => 'Заметок пока нет';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Закладка добавлена на $position';
  }

  @override
  String get audiobookSpeedReset => 'Сбросить до 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Сохранить';

  @override
  String get audiobookCancel => 'Отмена';

  @override
  String get audiobookDelete => 'Удалить';

  @override
  String get subtitlePreferences => 'Настройки субтитров';

  @override
  String get subtitlePreferencesDescription =>
      'Измените режимы субтитров, языки по умолчанию, оформление и параметры отрисовки.';

  @override
  String get subtitleRendering => 'Отрисовка субтитров';

  @override
  String get displayOptions => 'Параметры отображения';

  @override
  String get releaseDateAscending => 'Дата выхода (по возрастанию)';

  @override
  String get releaseDateDescending => 'Дата выхода (по убыванию)';

  @override
  String get groupContributions => 'Группировка работ';

  @override
  String get groupMultipleRoles => 'Объединять несколько ролей';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Предупреждение о доступе на запись';

  @override
  String get libraryWriteAccessHowToFix => 'Как это исправить:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Предоставьте пользователю службы Jellyfin (например, jellyfin или PUID/PGID в Docker) права на запись в папки вашей медиабиблиотеки на сервере.\n\n2. Либо откройте панель Jellyfin -> «Библиотеки», измените эту библиотеку и отключите параметр «Сохранять обложки в папки с медиа», чтобы обложки хранились во внутренней базе данных Jellyfin.';

  @override
  String get dismiss => 'Закрыть';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Библиотека «$libraryName» настроена на сохранение обложек прямо в папки с медиа (включён параметр «Сохранять обложки в папки с медиа»). Однако при проверке Jellyfin не смог записать файлы в этот каталог:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Похоже, Jellyfin не смог обновить обложку. Ваша библиотека настроена на сохранение обложек прямо в папки с медиа (включён параметр «Сохранять обложки в папки с медиа»). Обычно эта ошибка возникает, когда у процесса сервера Jellyfin нет прав на запись в ваши медиакаталоги.';

  @override
  String get externalLists => 'Внешние списки';

  @override
  String get replay => 'Смотреть заново';

  @override
  String get fileInformation => 'Сведения о файле';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Размер: $size  •  Формат: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Показать все аудиодорожки ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Показать все дорожки субтитров ($count)';
  }

  @override
  String get checkingDirectPlay => 'Проверка прямого воспроизведения...';

  @override
  String get directPlayCapabilityLabel => 'Прямое воспроизведение: ';

  @override
  String get forced => 'Форсированные';

  @override
  String get transcodeContainerNotSupported =>
      'Контейнер не поддерживается плеером.';

  @override
  String get transcodeVideoCodecNotSupported => 'Видеокодек не поддерживается.';

  @override
  String get transcodeAudioCodecNotSupported => 'Аудиокодек не поддерживается.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Формат субтитров не поддерживается (требуется вшивание).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Профиль звука не поддерживается.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Профиль видео не поддерживается.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Уровень видео не поддерживается.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Разрешение видео не поддерживается этим устройством.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Битовая глубина видео не поддерживается.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Частота кадров видео не поддерживается.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Битрейт файла превышает лимит потоковой передачи плеера.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Битрейт видео превышает лимит потоковой передачи.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Битрейт звука превышает лимит потоковой передачи.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Число аудиоканалов не поддерживается.';

  @override
  String get sortAlphabetical => 'По алфавиту';

  @override
  String get sortReleaseAscending => 'Порядок выхода (по возрастанию)';

  @override
  String get sortReleaseDescending => 'Порядок выхода (по убыванию)';

  @override
  String get sortCustomDragDrop => 'Свой (перетаскиванием)';

  @override
  String get playlistSortOptions => 'Сортировка плейлиста';

  @override
  String get resetSort => 'Сбросить сортировку';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Пересмотреть С$season:Э$episode';
  }

  @override
  String get rewatchPlaylist => 'Пересмотреть плейлист';

  @override
  String get noSubtitlesFound => 'Субтитры не найдены.';

  @override
  String get adminControls => 'Средства администратора';

  @override
  String get impellerRendering => 'Движок отрисовки (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller — современный GPU-рендерер Flutter: анимации плавнее, подтормаживаний меньше. На некоторых ТВ-приставках и старых GPU он может вызывать артефакты или чёрное видео — тогда выберите «Выкл». «Автоматически» подбирает лучший вариант для вашего устройства. Перезапустите Moonfin, чтобы применить.';

  @override
  String get impellerAuto => 'Автоматически';

  @override
  String get impellerOn => 'Вкл.';

  @override
  String get impellerOff => 'Выкл.';

  @override
  String get impellerRestartTitle => 'Требуется перезапуск';

  @override
  String get impellerRestartMessage =>
      'Чтобы сменить движок отрисовки, Moonfin нужно перезапустить. Закройте приложение и откройте его снова.';

  @override
  String get impellerCloseNow => 'Закрыть приложение';

  @override
  String get adminRefreshLibrary => 'Обновить библиотеку';

  @override
  String get adminRefreshAllLibraries => 'Обновить все библиотеки';

  @override
  String get adminRepoSortDateOldest => 'Дата добавления (сначала старые)';

  @override
  String get adminRepoSortDateNewest => 'Дата добавления (сначала новые)';

  @override
  String get adminRepoSortNameAsc => 'По алфавиту (А–Я)';

  @override
  String get adminRepoSortNameDesc => 'По алфавиту (Я–А)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Загрузка аналитики сервера... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Как в источнике';

  @override
  String get imdbTop250Movies => 'IMDb: топ-250 фильмов';

  @override
  String get imdbTop250TvShows => 'IMDb: топ-250 сериалов';

  @override
  String get imdbMostPopularMovies => 'IMDb: самые популярные фильмы';

  @override
  String get imdbMostPopularTvShows => 'IMDb: самые популярные сериалы';

  @override
  String get imdbLowestRatedMovies => 'IMDb: фильмы с худшим рейтингом';

  @override
  String get imdbTopEnglishMovies => 'IMDb: лучшие англоязычные фильмы';
}
