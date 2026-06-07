// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Лунный плавник';

  @override
  String get accountPreferences => 'ACCOUNT PREFERENCES';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'Войти';

  @override
  String get empty => 'Empty';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Быстрое подключение';

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
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Кто смотрит?';

  @override
  String get addUser => 'Добавить пользователя';

  @override
  String get selectServer => 'Выберите сервер';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get remove => 'Удалять';

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
  String get settingsAppearanceThemeSubtitle =>
      'Переключайтесь между Moonfin и Neon Pulse, не перезапуская приложение.';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Лунный плавник';

  @override
  String get themeMoonfinSubtitle =>
      'Текущий образ Moonfin, который вам всем полюбился';

  @override
  String get themeNeonPulse => 'Неоновый Пульс';

  @override
  String get themeNeonPulseSubtitle =>
      'Стиль Synthwave с пурпурным свечением, голубым текстом и более сильным хромированным контрастом.';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Выход из Moonfin?';

  @override
  String get exitAppConfirmation => 'Вы уверены, что хотите выйти?';

  @override
  String get exit => 'Выход';

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
  String get series => 'Ряд';

  @override
  String get noItemsFound => 'Элементы не найдены';

  @override
  String get home => 'Дом';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Эта папка пуста';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
    return '$name — Genres';
  }

  @override
  String get views => 'Просмотры';

  @override
  String get albums => 'Альбомы';

  @override
  String get albumArtists => 'Исполнители альбомов';

  @override
  String get artists => 'Художники';

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
  String get discoverySubjects => 'Предметы открытия';

  @override
  String get pickDiscoverySubjects =>
      'Выберите, какие тематические каналы показывать в Discover.';

  @override
  String get apply => 'Применять';

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
    return '$count titles';
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
  String get resume => 'Резюме';

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
  String get readyWhenYouAre => 'Готов, когда вы будете';

  @override
  String get details => 'Подробности';

  @override
  String get listeningRoom => 'Комната для прослушивания';

  @override
  String get bookmarksAndProgress => 'Закладки и прогресс';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Титулы';

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
    return 'No $label found';
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
  String get watched => 'Смотрел';

  @override
  String get unread => 'Непрочитано';

  @override
  String get unwatched => 'Непросмотренный';

  @override
  String get seriesStatus => 'Статус серии';

  @override
  String get allLibraries => 'Все библиотеки';

  @override
  String get books => 'Книги';

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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Не удалось загрузить эту тему прямо сейчас.';

  @override
  String get audiobookDetails => 'Подробности об аудиокниге';

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
  String get trackList => 'Список треков';

  @override
  String get itemListPlaceholder => 'Список товаров появится здесь';

  @override
  String get favoriteTracksPlaceholder => 'Здесь появятся любимые треки';

  @override
  String get failedToLoad => 'Не удалось загрузить';

  @override
  String get delete => 'Удалить';

  @override
  String get save => 'Сохранять';

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
  String get seasons => 'Времена года';

  @override
  String get chapters => 'Главы';

  @override
  String get features => 'Функции';

  @override
  String get movies => 'Фильмы';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Дата публикации неизвестна';

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
  String get view => 'Вид';

  @override
  String get resumeReading => 'Возобновить чтение';

  @override
  String get read => 'Читать';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Играть';

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
  String get cast => 'Бросать';

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
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Объект удален.';

  @override
  String get noPlayableTrailerFound => 'Играбельного трейлера не найдено.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Аудио дорожка';

  @override
  String get subtitleTrack => 'Дорожка субтитров';

  @override
  String get none => 'Никто';

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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтитры скачаны. Появление может занять некоторое время, пока Jellyfin обновит элемент.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Выберите версию';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Удалить загруженные файлы';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'ПИСАТЕЛИ';

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
  String get showLess => 'Показать меньше';

  @override
  String get readMore => 'Читать далее';

  @override
  String get shuffle => 'Перетасовать';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Идеальное совпадение';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Мононуклеоз';

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
  String get deviceVolume => 'Громкость устройства';

  @override
  String get unavailable => 'Недоступно';

  @override
  String get pause => 'Пауза';

  @override
  String get syncPosition => 'Позиция синхронизации';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Очередь пуста';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Длительное нажатие, чтобы разблокировать';

  @override
  String get off => 'Выключенный';

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
  String get bitrateOverride => 'Переопределение битрейта';

  @override
  String get audioDelay => 'Задержка звука';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Задержка субтитров';

  @override
  String get reset => 'Перезагрузить';

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
  String get player => 'Игрок';

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
  String get track => 'Отслеживать';

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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Встроенное приложение для рендеринга EPUB пока недоступно на этой платформе.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'На этой платформе недоступен встроенный рендеринг документов.';

  @override
  String get couldNotOpenExternalViewer =>
      'Не удалось открыть внешнее средство просмотра.';

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
      'Закладок пока нет.\nКоснитесь значка закладки во время чтения, чтобы сохранить свою позицию.';

  @override
  String get noTableOfContentsAvailable => 'Оглавление недоступно';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Позиция';

  @override
  String get bookReader => 'Читалка книг';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Каналы не найдены';

  @override
  String get liveBadge => 'ЖИТЬ';

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
  String get watch => 'Смотреть';

  @override
  String get close => 'Закрывать';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Сирр';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Альбом';

  @override
  String get playAlbum => 'Воспроизвести альбом';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'Серия не найдена';

  @override
  String get errorLoadingSeries => 'Ошибка загрузки серии.';

  @override
  String get downloadedEpisodes => 'Скачанные эпизоды';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Специальные предложения';

  @override
  String get deleteSeason => 'Удалить сезон';

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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Музыка и аудиокниги';

  @override
  String get images => 'Изображения';

  @override
  String get database => 'База данных';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Музыкальная тема в домашних рядах';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Играть при просмотре главного экрана';

  @override
  String get detailsBackgroundBlur => 'Детали размытия фона';

  @override
  String pixelValue(int value) {
    return '${value}px';
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
  String get fit => 'Соответствовать';

  @override
  String get autoCrop => 'Автоматическая обрезка';

  @override
  String get stretch => 'Потягиваться';

  @override
  String get refreshRateSwitching => 'Переключение частоты обновления';

  @override
  String get disabled => 'Неполноценный';

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
    return '${value}s';
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
    return 'After $episodes episodes / ${hours}h';
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
  String get showSeerrButton => 'Show Seerr Button';

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
    return '$count selected';
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
  String get mediaBarModeMoonfin => 'Лунный плавник';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Выключенный';

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
  String get perRowImageType => 'Тип изображения по строкам';

  @override
  String get perRowSettings => 'Настройки для каждой строки';

  @override
  String get autoLogin => 'Автоматический вход';

  @override
  String get lastUser => 'Последний пользователь';

  @override
  String get currentUser => 'Current User';

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
    return '$minutes min';
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
  String get rottenTomatoesCritics => 'Тухлые помидоры (критики)';

  @override
  String get rottenTomatoesAudience => 'Тухлые помидоры (Аудитория)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'ТМДБ';

  @override
  String get metacritic => 'Метакритик';

  @override
  String get metacriticUser => 'Метакритик (Пользователь)';

  @override
  String get trakt => 'Тракт';

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
  String get pluginLabel => 'Плагин';

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
    return '$status\nVersion: $version';
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
  String get seerrDiscoveryRows => 'Seerr Discovery Rows';

  @override
  String get resetRowsToDefaults => 'Сбросить строки к значениям по умолчанию';

  @override
  String get enableSeerr => 'Включить Сирр';

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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Откройте для себя строки';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Перетащите, чтобы изменить порядок. Включите или отключите строки. Включена синхронизация порядка строк с плагином Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Перетащите, чтобы изменить порядок. Включите или отключите строки.';

  @override
  String get enabled => 'Включено';

  @override
  String get hidden => 'Скрытый';

  @override
  String get aboutTitle => 'О';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Лицензии с открытым исходным кодом';

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Уведомления об обновлениях';

  @override
  String get showWhenUpdatesAvailable =>
      'Показывать, когда доступны обновления';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
    return '$value GB';
  }

  @override
  String get clear => 'Прозрачный';

  @override
  String get browse => 'Просматривать';

  @override
  String get noResults => 'Нет результатов';

  @override
  String get seerrAvailableStatus => 'Доступный';

  @override
  String get seerrRequestedStatus => 'Запрошено';

  @override
  String itemsCount(int count) {
    return '$count Items';
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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
    return 'age $age';
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
  String get seasonsLabel => 'Времена года';

  @override
  String get episodesLabel => 'Эпизоды';

  @override
  String get access => 'Доступ';

  @override
  String get add => 'Добавлять';

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
  String get done => 'Сделанный';

  @override
  String get edit => 'Редактировать';

  @override
  String get encoding => 'Кодирование';

  @override
  String get error => 'Ошибка';

  @override
  String get forward => 'Вперед';

  @override
  String get general => 'Общий';

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
  String get next => 'Следующий';

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
  String get remote => 'Удаленный';

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
  String get stop => 'Останавливаться';

  @override
  String get streaming => 'Потоковое вещание';

  @override
  String get time => 'Время';

  @override
  String get trickplay => 'Трикплей';

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
  String get mute => 'Немой';

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
  String get adminDrawerTranscoding => 'Транскодирование';

  @override
  String get adminDrawerResume => 'Резюме';

  @override
  String get adminDrawerStreaming => 'Потоковое вещание';

  @override
  String get adminDrawerTrickplay => 'Трикплей';

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
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get sessionForward => 'Вперед';

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
  String get volume => 'Объем';

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
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Удалить устройство';

  @override
  String get adminDeviceDeleted => 'Устройство удалено';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Переименовать библиотеку';

  @override
  String get adminNewName => 'Новое имя';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Удалить библиотеку';

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
  String get adminRemovePath => 'Удалить путь';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Параметры библиотеки сохранены.';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'Укажите название библиотеки.';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'Не удалось загрузить пользователей.';

  @override
  String get adminSearchUsers => 'Поиск пользователей';

  @override
  String get adminEditUser => 'Изменить пользователя';

  @override
  String get adminAddUser => 'Добавить пользователя';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Разрешения сохранены.';

  @override
  String get adminPasswordsMismatch => 'Пароли не совпадают';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get adminResetPasswordWarning =>
      'Это приведет к удалению пароля. Пользователь сможет войти в систему без пароля.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Токен ключа отсутствует в ответе сервера';

  @override
  String get adminRevokeApiKey => 'Отозвать ключ API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Ключ API отозван';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Создание резервной копии...';

  @override
  String get adminBackupCreated => 'Резервная копия успешно создана';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Путь к резервной копии отсутствует в ответе сервера';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Подтвердить восстановление';

  @override
  String get adminRestoringBackup => 'Восстановление резервной копии...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Искать в журнале';

  @override
  String get adminNoMatchingLines => 'Нет совпадающих строк';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Запланированных задач не найдено';

  @override
  String get adminNoTasksMatchFilter =>
      'Нет задач, соответствующих текущему фильтру.';

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
  String get adminRunNow => 'Беги сейчас';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'День недели';

  @override
  String get adminSearchPlugins => 'Поиск плагинов...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Удалить плагин';

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
      'Нет плагинов, соответствующих вашему запросу';

  @override
  String get adminNoPluginsInstalled => 'Плагины не установлены';

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
      'Невозможно открыть настройки: отсутствует токен аутентификации.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Плагин не найден';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'например Jellyfin Стабильный';

  @override
  String get adminRepositoryUrl => 'URL-адрес репозитория';

  @override
  String get adminAddEntry => 'Добавить запись';

  @override
  String get adminInvalidUrl => 'Неверный URL-адрес';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminTrickplaySaved => 'Настройки трикплея сохранены.';

  @override
  String get adminTrickplayLoadFailed =>
      'Не удалось загрузить настройки трикплея.';

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
  String get adminBaseUrlHint => 'например /желефин';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Поиск удаленного человека';

  @override
  String get adminNoRemoteMatches => 'Удаленных совпадений не найдено';

  @override
  String get adminRemoteResults => 'Удаленные результаты';

  @override
  String get adminRemoteMetadataApplied => 'Применены удаленные метаданные';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Обновить тип контента';

  @override
  String get adminContentType => 'Тип контента';

  @override
  String get adminContentTypeUpdated => 'Тип контента обновлен.';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Неподдерживаемый формат изображения';

  @override
  String get adminImageReadFailed =>
      'Не удалось прочитать выбранное изображение.';

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
  String get adminAllProviders => 'Все провайдеры';

  @override
  String get adminNoRemoteImages => 'Удаленных изображений не найдено';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Добавить тюнер';

  @override
  String get adminTunerType => 'Тип тюнера';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Другое';

  @override
  String get adminUrlPath => 'URL/путь';

  @override
  String get adminNameOptional => 'Имя (необязательно)';

  @override
  String get adminTunerAdded => 'Тюнер добавлен';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Добавить поставщика руководств';

  @override
  String get adminProviderType => 'Тип поставщика';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect или XMLTV';

  @override
  String get adminUsernameOptional => 'Имя пользователя (необязательно)';

  @override
  String get adminRefreshInterval => 'Интервал обновления (часы)';

  @override
  String get adminProviderAdded => 'Провайдер добавлен';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Запрошен сброс настроек тюнера';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved => 'Настройки записи сохранены.';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Добавить поставщика';

  @override
  String get adminNoListingProviders => 'Поставщики листинга не настроены';

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
    return 'Restore backup $name now?';
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
  String get adminApply => 'Применять';

  @override
  String get adminNotSet => 'Не установлено';

  @override
  String get adminReset => 'Перезагрузить';

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
  String get adminLogViewerNoMatches => 'Нет совпадающих строк';

  @override
  String get adminMetadataEditorTitle => 'Редактор метаданных';

  @override
  String get adminMetadataRemote => 'Удаленный';

  @override
  String get adminMetadataType => 'Тип';

  @override
  String get adminMetadataDetails => 'Подробности';

  @override
  String get adminMetadataExternalIds => 'Внешние идентификаторы';

  @override
  String get adminMetadataImages => 'Изображения';

  @override
  String get adminMetadataFieldTitle => 'Заголовок';

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
      'Не удалось прочитать выбранное изображение.';

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
      'Это удалит текущее изображение из элемента.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Нет пакетов, соответствующих вашему запросу';

  @override
  String get adminPluginsCatalogEmpty => 'Нет доступных пакетов';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Удалить репозиторий';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Удалять';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminPlaybackHwAccel => 'Аппаратное ускорение';

  @override
  String get adminPlaybackHwAccelLabel => 'Аппаратное ускорение';

  @override
  String get adminPlaybackEnableHwEncoding => 'Включить аппаратное кодирование';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Включить аппаратное декодирование для:';

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
  String get adminTaskStop => 'Останавливаться';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminActivityNow => 'сейчас';

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
      'Настройте генерацию изображений для поиска миниатюр предварительного просмотра.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Публичный HTTPS-порт';

  @override
  String get adminNetworkingBaseUrl => 'Базовый URL';

  @override
  String get adminNetworkingBaseUrlHint => 'например /желефин';

  @override
  String get adminNetworkingHttps => 'HTTPS';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Порог медленного ответа (мс)';

  @override
  String get adminGeneralCachePath => 'Путь к кэшу';

  @override
  String get adminGeneralMetadataPath => 'Путь метаданных';

  @override
  String get adminGeneralServerName => 'Имя сервера';

  @override
  String get adminSettingsLoadFailed => 'Не удалось загрузить настройки';

  @override
  String get adminDiscover => 'Обнаружить';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Доступ к SyncPlay запрещен';

  @override
  String get syncPlayAccessDeniedMessage =>
      'У вас нет доступа к одному или нескольким элементам в этой группе SyncPlay. Попросите владельца группы проверить разрешения библиотеки или выбрать другую очередь.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
  String get homeScreenSectionsIntegrationDescription =>
      'Обнаружение строк, предоставляемых плагином IAmParadox27 «Разделы главного экрана». Строки можно включить и изменить порядок ниже.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Ни один сервер Jellyfin пока не сообщил о плагине.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Обнаружение строк, настроенных с помощью плагина KefinTweaks компании ranaldsgift. Пользовательские разделы, недавно выпущенные, просмотренные снова, сезонные и недавно добавленные в библиотеку зеркально отражаются из конфигурации KefinTweaks на каждом сервере Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Ни один сервер Jellyfin пока не сообщает о KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Открытые домашние разделы';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Включение, отключение и изменение порядка строк';

  @override
  String get integrationInstalledButDisabled => 'Установлено, но отключено';

  @override
  String get integrationNotInstalled => 'Не установлено';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Удаленное воспроизведение';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Громкость устройства';

  @override
  String get castVolumeUnavailable => 'Недоступно';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Неправильный PIN-код';

  @override
  String get pinMismatch => 'PIN-коды не совпадают';

  @override
  String get pinForgot => 'Забыли PIN-код?';

  @override
  String get pinClear => 'Прозрачный';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Запрос быстрого подключения разрешен.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Код быстрого подключения недействителен или срок его действия истек.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect не поддерживается на этом сервере.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Не удалось авторизовать код быстрого подключения.';

  @override
  String get quickConnectDisabled =>
      'Быстрое подключение отключено на этом сервере.';

  @override
  String get quickConnectForbidden =>
      'Ваша учетная запись не может авторизовать этот запрос на быстрое подключение.';

  @override
  String get quickConnectNotFound =>
      'Код быстрого подключения не найден. Попробуйте новый код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Введите код';

  @override
  String get quickConnectAuthorize => 'Авторизовать';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
  String get stillWatchingStop => 'Останавливаться';

  @override
  String get stillWatchingContinue => 'Продолжать';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Прямой эфир';

  @override
  String get continueWatchingAndNextUp => 'Продолжить просмотр и следующее';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
      'Show the Seerr button in the navigation bar';

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
      'Donate a coffee to the developer';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (старый вариант)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
    return '$value ms';
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
