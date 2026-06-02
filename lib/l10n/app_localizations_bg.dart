// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'Лунна перка';

  @override
  String get signIn => 'Вход';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Бързо свързване';

  @override
  String get password => 'Парола';

  @override
  String get username => 'Потребителско име';

  @override
  String get email => 'Имейл';

  @override
  String get quickConnectInstruction =>
      'Въведете този код в уеб таблото за управление на вашия сървър:';

  @override
  String get waitingForAuthorization => 'Изчакване на разрешение...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Сървърът е недостъпен';

  @override
  String get loginFailed => 'Неуспешно влизане';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Кой гледа?';

  @override
  String get addUser => 'Добавяне на потребител';

  @override
  String get selectServer => 'Изберете Сървър';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Запазени сървъри';

  @override
  String get discoveredServers => 'Открити сървъри';

  @override
  String get noneFound => 'Няма намерени';

  @override
  String get unableToConnectToServer => 'Не може да се свърже със сървъра';

  @override
  String get addServer => 'Добавете сървър';

  @override
  String get embyConnect => 'Emby Свързване';

  @override
  String get removeServer => 'Премахване на сървъра';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Отказ';

  @override
  String get remove => 'Премахнете';

  @override
  String get connectToServer => 'Свържете се със сървъра';

  @override
  String get serverAddress => 'Адрес на сървъра';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Свържете се';

  @override
  String get secureStorageUnavailable => 'Сигурното хранилище не е налично';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin не можа да получи достъп до вашия системен ключодържател. Входът може да продължи, но защитеното съхранение на токени може да не е достъпно, докато ключодържателят не бъде отключен.';

  @override
  String get ok => 'добре';

  @override
  String get settingsAppearanceTheme => 'Тема на приложението';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Превключвайте между Moonfin и Neon Pulse, без да рестартирате приложението';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Лунна перка';

  @override
  String get themeMoonfinSubtitle =>
      'Сегашната визия Moonfin, която всички сте харесали';

  @override
  String get themeNeonPulse => 'Неонов импулс';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave стил с пурпурно сияние, циан текст и по-силен хромиран контраст';

  @override
  String get embyConnectSignInSubtitle =>
      'Влезте с вашия акаунт в Emby Connect';

  @override
  String get emailOrUsername => 'Имейл или потребителско име';

  @override
  String get selectAServer => 'Изберете сървър';

  @override
  String get tryAgain => 'Опитайте отново';

  @override
  String get noLinkedServers =>
      'Няма сървъри, свързани с този акаунт в Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Невалидни идентификационни данни за Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Невалидно потребителско име или парола за Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сървърът не поддържа обмен на Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Мрежова грешка при свързване с Emby Connect или избрания сървър';

  @override
  String get loadingLinkedServers => 'Свързаните сървъри се зареждат...';

  @override
  String get connectingToServerEllipsis => 'Свързване към сървър...';

  @override
  String get noReachableAddress => 'Не е предоставен достъпен адрес';

  @override
  String get invalidServerExchangeResponse =>
      'Невалиден отговор от крайната точка за обмен на сървъра';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Изход от Moonfin?';

  @override
  String get exitAppConfirmation => 'Сигурни ли сте, че искате да излезете?';

  @override
  String get exit => 'Изход';

  @override
  String get noHomeRowsLoaded => 'Не можаха да бъдат заредени начални редове';

  @override
  String get noHomeRowsHint =>
      'Опитайте да обновите или намалите активните начални секции.';

  @override
  String get retryHomeRows => 'Повторен опит за начални редове';

  @override
  String get guide => 'Ръководство';

  @override
  String get recordings => 'Записи';

  @override
  String get schedule => 'График';

  @override
  String get series => 'Серия';

  @override
  String get noItemsFound => 'Няма намерени елементи';

  @override
  String get home => 'Начало';

  @override
  String get browseAll => 'Преглед на всички';

  @override
  String get genres => 'Жанрове';

  @override
  String get collectionPlaceholder =>
      'Елементите от колекцията ще се покажат тук';

  @override
  String get browseByLetter => 'Преглед по буква';

  @override
  String get alphabeticalBrowsePlaceholder => 'Тук ще се появи азбучен преглед';

  @override
  String get suggestions => 'Предложения';

  @override
  String get suggestionsPlaceholder => 'Предложените елементи ще се появят тук';

  @override
  String get failedToLoadLibraries => 'Неуспешно зареждане на библиотеки';

  @override
  String get noLibrariesFound => 'Няма намерени библиотеки';

  @override
  String get library => 'Библиотека';

  @override
  String get displaySettings => 'Настройки на дисплея';

  @override
  String get allGenres => 'Всички жанрове';

  @override
  String get noGenresFound => 'Няма намерени жанрове';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Тази папка е празна';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Неуспешно зареждане на любими';

  @override
  String get retry => 'Опитайте отново';

  @override
  String get noFavoritesYet => 'Все още няма любими';

  @override
  String get favorites => 'Любими';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Продължава';

  @override
  String get ended => 'Приключи';

  @override
  String get sortAndFilter => 'Сортиране и филтриране';

  @override
  String get type => 'Тип';

  @override
  String get sortBy => 'Сортиране по';

  @override
  String get display => 'Дисплей';

  @override
  String get imageType => 'Тип изображение';

  @override
  String get posterSize => 'Размер на плаката';

  @override
  String get small => 'малък';

  @override
  String get medium => 'Среден';

  @override
  String get large => 'Голям';

  @override
  String get extraLarge => 'Изключително голям';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Изгледи';

  @override
  String get albums => 'Албуми';

  @override
  String get albumArtists => 'Изпълнители на албуми';

  @override
  String get artists => 'Художници';

  @override
  String get bookmarks => 'Отметки';

  @override
  String get noSavedBookmarks =>
      'Все още няма запазени отметки за това заглавие.';

  @override
  String get openBook => 'Отворете книгата';

  @override
  String get chapter => 'Глава';

  @override
  String get page => 'Страница';

  @override
  String get bookmark => 'Отметка';

  @override
  String get justNow => 'Току-що';

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
  String get discoverySubjects => 'Теми за откриване';

  @override
  String get pickDiscoverySubjects =>
      'Изберете емисиите по кои теми да се показват в Discover.';

  @override
  String get apply => 'Кандидатствайте';

  @override
  String get openLink => 'Отворете връзката';

  @override
  String get scanWithYourPhone => 'Сканирайте с телефона си';

  @override
  String get audiobookGenres => 'Жанрове аудиокниги';

  @override
  String get pickAudiobookGenres =>
      'Изберете кои жанрове да се показват в Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Открийте аудиокниги';

  @override
  String get librivoxDescription => 'Популярни публични заглавия от LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Превъртете наляво';

  @override
  String get scrollRight => 'Превъртете надясно';

  @override
  String get couldNotLoadGenre => 'Не може да се зареди този жанр в момента.';

  @override
  String get continueReading => 'Продължете да четете';

  @override
  String get savedHighlights => 'Запазени акценти';

  @override
  String get continueListening => 'Продължете да слушате';

  @override
  String get listen => 'слушай';

  @override
  String get resume => 'Резюме';

  @override
  String get failedToLoadLibrary => 'Неуспешно зареждане на библиотеката';

  @override
  String get popularNow => 'Популярни сега';

  @override
  String get savedForLater => 'Запазено за по-късно';

  @override
  String get topListens => 'Най-добри слушания';

  @override
  String get unreadDiscoveries => 'Непрочетени открития';

  @override
  String get pickUpAgain => 'Вдигни отново';

  @override
  String get bookHighlightsDescription =>
      'Вашите книги с акценти, любими или напредък в четенето.';

  @override
  String get handPickedFromLibrary => 'Ръчно подбрани от вашата библиотека.';

  @override
  String get handPickedFromListeningQueue =>
      'Ръчно подбрани от вашата опашка за слушане.';

  @override
  String get booksWithHighlights =>
      'Книги с акценти, любими или напредък в четенето.';

  @override
  String get jumpBackNarration =>
      'Върнете се в разказ, без да търсите мястото си.';

  @override
  String get unreadBooksReady =>
      'Непрочетени книги, готови за следващия тих час.';

  @override
  String get quickAccessFavorites =>
      'Бърз достъп до книгите, към които се връщате.';

  @override
  String get searchAudiobooks => 'Търсете аудиокниги';

  @override
  String get searchYourLibrary => 'Търсете в библиотеката си';

  @override
  String get pickUpStory => 'Продължете историята от там, където сте я спрели';

  @override
  String get savedPlacesChapters => 'Вашите запазени места и недовършени глави';

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
  String get readyWhenYouAre => 'Готови, когато сте';

  @override
  String get details => 'Подробности';

  @override
  String get listeningRoom => 'Стая за слушане';

  @override
  String get bookmarksAndProgress => 'Отметки и напредък';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Заглавия';

  @override
  String get allTitles => 'Всички заглавия';

  @override
  String get authors => 'автори';

  @override
  String get browseByAuthor => 'Преглед по автор';

  @override
  String get browseByGenre => 'Преглед по жанр';

  @override
  String get discover => 'Открийте';

  @override
  String get trendingTitlesOpenLibrary =>
      'Популярни заглавия по теми от Open Library.';

  @override
  String get noBookmarkedItems => 'Все още няма отбелязани елементи';

  @override
  String get nothingMatchesSection =>
      'Все още нищо не съответства на този раздел. Опитайте друг раздел или се върнете, след като синхронизирането на библиотеката приключи.';

  @override
  String get audiobooks => 'Аудиокниги';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Папка';

  @override
  String get filters => 'Филтри';

  @override
  String get readingStatus => 'Състояние на четене';

  @override
  String get playedStatus => 'Играно състояние';

  @override
  String get readStatus => 'Прочетете';

  @override
  String get watched => 'Гледах';

  @override
  String get unread => 'Непрочетено';

  @override
  String get unwatched => 'Ненаблюдавано';

  @override
  String get seriesStatus => 'Състояние на серията';

  @override
  String get allLibraries => 'Всички библиотеки';

  @override
  String get books => 'Книги';

  @override
  String get author => 'Автор';

  @override
  String get unknownAuthor => 'Неизвестен автор';

  @override
  String get uncategorized => 'Некатегоризиран';

  @override
  String get overview => 'Преглед';

  @override
  String get noLibrivoxDescription =>
      'Все още няма описание, предоставено от LibriVox за това заглавие.';

  @override
  String get readers => 'Читатели';

  @override
  String get openLinks => 'Отворете връзки';

  @override
  String get librivoxPage => 'Страница LibriVox';

  @override
  String get internetArchive => 'Интернет архив';

  @override
  String get rssFeed => 'RSS емисия';

  @override
  String get downloadZip => 'Изтеглете Zip';

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
      'Все още няма наличен преглед от Open Library за това заглавие.';

  @override
  String get subjects => 'Субекти';

  @override
  String get all => 'Всички';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Тази тема не можа да се зареди в момента.';

  @override
  String get audiobookDetails => 'Подробности за аудиокнигата';

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
  String get trackList => 'Списък с песни';

  @override
  String get itemListPlaceholder => 'Тук ще се появи списък с артикули';

  @override
  String get favoriteTracksPlaceholder => 'Любимите песни ще се появят тук';

  @override
  String get failedToLoad => 'Неуспешно зареждане';

  @override
  String get delete => 'Изтриване';

  @override
  String get save => 'Запазване';

  @override
  String get moreLikeThis => 'Повече като това';

  @override
  String get castAndCrew => 'Актьори и екип';

  @override
  String get collection => 'Колекция';

  @override
  String get episodes => 'епизоди';

  @override
  String get nextUp => 'Следващ';

  @override
  String get seasons => 'Сезони';

  @override
  String get chapters => 'Глави';

  @override
  String get features => 'Характеристики';

  @override
  String get movies => 'Филми';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'други';

  @override
  String get discography => 'Дискография';

  @override
  String get similarArtists => 'Подобни изпълнители';

  @override
  String get tableOfContents => 'Съдържание';

  @override
  String get tracklist => 'Списък с песни';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Биография';

  @override
  String get authorDetails => 'Подробности за автора';

  @override
  String get noOverviewAvailable =>
      'Все още няма наличен преглед за това заглавие.';

  @override
  String get noBiographyAvailable => 'Няма налична биография за този автор.';

  @override
  String get noBooksFound => 'Няма намерени книги за този автор.';

  @override
  String get unableToLoadAuthorDetails =>
      'В момента не могат да се заредят подробности за автора.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Дата на публикуване неизвестна';

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
  String get view => 'Преглед';

  @override
  String get resumeReading => 'Възобновете четенето';

  @override
  String get read => 'Прочетете';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Играйте';

  @override
  String get startOver => 'Започнете отначало';

  @override
  String get restart => 'Рестартирайте';

  @override
  String get readOffline => 'Четете офлайн';

  @override
  String get playOffline => 'Играйте офлайн';

  @override
  String get audio => 'аудио';

  @override
  String get subtitles => 'субтитри';

  @override
  String get version => 'Версия';

  @override
  String get cast => 'Актьорски състав';

  @override
  String get trailer => 'Трейлър';

  @override
  String get finished => 'Готово';

  @override
  String get favorited => 'Любими';

  @override
  String get favorite => 'Любима';

  @override
  String get playlist => 'Плейлист';

  @override
  String get downloaded => 'Изтеглено';

  @override
  String get downloadAll => 'Изтегли всички';

  @override
  String get download => 'Изтегляне';

  @override
  String get deleteDownloaded => 'Изтриване на изтеглените';

  @override
  String get goToSeries => 'Отидете на Серия';

  @override
  String get editMetadata => 'Редактиране на метаданни';

  @override
  String get less => 'По-малко';

  @override
  String get more => 'повече';

  @override
  String get deleteItem => 'Изтриване на елемент';

  @override
  String get deletePlaylist => 'Изтриване на плейлист';

  @override
  String get deletePlaylistMessage =>
      'Да се ​​изтрие ли този плейлист от сървъра?';

  @override
  String get deleteItemMessage => 'Да се ​​изтрие ли този елемент от сървъра?';

  @override
  String get failedToDeletePlaylist => 'Неуспешно изтриване на плейлиста';

  @override
  String get failedToDeleteItem => 'Неуспешно изтриване на елемент';

  @override
  String get renamePlaylist => 'Преименуване на плейлист';

  @override
  String get playlistName => 'Име на плейлиста';

  @override
  String get deleteDownloadedAlbum => 'Изтриване на изтегления албум';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Изтеглените песни са изтрити';

  @override
  String get downloadedTracksDeleteFailed =>
      'Някои изтеглени песни не можаха да бъдат изтрити';

  @override
  String get noTracksLoaded => 'Няма заредени песни';

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
  String get itemDeleted => 'Елементът е изтрит';

  @override
  String get noPlayableTrailerFound =>
      'Няма намерен трейлър за възпроизвеждане.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Аудио запис';

  @override
  String get subtitleTrack => 'Запис със субтитри';

  @override
  String get none => 'Няма';

  @override
  String get downloadSubtitlesLabel => 'Изтегляне на субтитри...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Търсете с помощта на приставката OpenSubtitles';

  @override
  String get downloadSubtitles => 'Изтегляне на субтитри';

  @override
  String get selectedSubtitleInvalid => 'Избраният субтитър е невалиден.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтитрите са изтеглени. Може да отнеме известно време, за да се появи, докато Jellyfin опреснява елемента.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Изберете Версия';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Изтеглете всички — качество';

  @override
  String get downloadQuality => 'Качество на изтегляне';

  @override
  String get originalFileNoReencoding =>
      'Оригинален файл, без повторно кодиране';

  @override
  String get originalFilesNoReencoding =>
      'Оригинални файлове, без повторно кодиране';

  @override
  String get noEpisodesLoaded => 'Няма заредени епизоди';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Изтриване на изтеглените файлове';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Изтеглените файлове са изтрити';

  @override
  String get failedToDeleteFiles => 'Неуспешно изтриване на файлове';

  @override
  String get deleteFiles => 'Изтриване на файлове';

  @override
  String get director => 'ДИРЕКТОР';

  @override
  String get writers => 'ПИСАТЕЛИ';

  @override
  String get studio => 'СТУДИО';

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
  String get showLess => 'Покажи по-малко';

  @override
  String get readMore => 'Прочетете повече';

  @override
  String get shuffle => 'Разбъркайте';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Перфектно съвпадение';

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
  String get deleteSeasonFiles => 'всички изтеглени епизоди през този сезон';

  @override
  String get stillWatching => 'Все още гледате?';

  @override
  String get unableToLoadTrailerStream =>
      'Не може да се зареди поток от трейлър.';

  @override
  String get trailerTimedOut =>
      'Времето за изчакване на трейлъра изтече при зареждане.';

  @override
  String get playbackFailedForTrailer =>
      'Неуспешно възпроизвеждане на този трейлър.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Предаването не е налично по време на офлайн възпроизвеждане.';

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
  String get deviceVolume => 'Сила на звука на устройството';

  @override
  String get unavailable => 'Недостъпен';

  @override
  String get pause => 'Пауза';

  @override
  String get syncPosition => 'Позиция за синхронизиране';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Опашката е празна';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Дистанционно възпроизвеждане';

  @override
  String get castingToGoogleCast => 'Предаване към Google Cast';

  @override
  String get castingViaAirPlay => 'Кастинг чрез AirPlay';

  @override
  String get castingViaDlna => 'Кастинг чрез DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Натиснете дълго за отключване';

  @override
  String get off => 'Изкл';

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
  String get bitrateOverride => 'Замяна на битрейт';

  @override
  String get audioDelay => 'Закъснение на звука';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Забавяне на субтитрите';

  @override
  String get reset => 'Нулиране';

  @override
  String get unknown => 'Неизвестен';

  @override
  String get playbackInformation => 'Информация за възпроизвеждане';

  @override
  String get playback => 'Възпроизвеждане';

  @override
  String get playMethod => 'Метод на игра';

  @override
  String get directPlay => 'Директна игра';

  @override
  String get directStream => 'Директен поток';

  @override
  String get transcoding => 'Транскодиране';

  @override
  String get transcodeReasons => 'Причини за прекодиране';

  @override
  String get player => 'Играч';

  @override
  String get container => 'Контейнер';

  @override
  String get bitrate => 'Скорост на предаване';

  @override
  String get video => 'видео';

  @override
  String get resolution => 'Резолюция';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Кодек';

  @override
  String get videoBitrate => 'Видео битрейт';

  @override
  String get track => 'Писта';

  @override
  String get channels => 'Канали';

  @override
  String get audioBitrate => 'Аудио битрейт';

  @override
  String get sampleRate => 'Честота на извадка';

  @override
  String get format => 'Форматиране';

  @override
  String get external => 'Външен';

  @override
  String get embedded => 'Вграден';

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
      'Рендирането на EPUB в приложението все още не е налично на тази платформа.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Вграденото изобразяване на документи не е налично на тази платформа.';

  @override
  String get couldNotOpenExternalViewer =>
      'Не може да се отвори външен визуализатор.';

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
      'Все още няма отметки.\nДокоснете иконата на отметка, докато четете, за да запазите позицията си.';

  @override
  String get noTableOfContentsAvailable => 'Няма налично съдържание';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Позиция';

  @override
  String get bookReader => 'Четец на книги';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Актуализиране...';

  @override
  String get markUnread => 'Отбележете като непрочетено';

  @override
  String get markAsRead => 'Маркирайте като прочетено';

  @override
  String get reloadReader => 'Презаредете Reader';

  @override
  String get noPagesFound => 'Няма намерени страници.';

  @override
  String get failedToDecodePageImage =>
      'Неуспешно декодиране на изображението на страницата.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Единична страница';

  @override
  String get twoPageSpread => 'Разширение от две страници';

  @override
  String get addBookmark => 'Добавяне на отметка';

  @override
  String get bookmarksEllipsis => 'Отметки...';

  @override
  String get markedAsRead => 'Означено като прочетено';

  @override
  String get markedAsUnread => 'Означено като непрочетено';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Тема: Система';

  @override
  String get themeLight => 'Тема: Светлина';

  @override
  String get themeDark => 'Тема: Тъмно';

  @override
  String get themeSepia => 'Тема: Сепия';

  @override
  String get invertColorsFixedLayout =>
      'Инвертиране на цветовете (фиксирано оформление)';

  @override
  String get invertColorsPdf => 'Инвертиране на цветовете (PDF)';

  @override
  String get preparingInAppReader => 'Подготвя се четец в приложението...';

  @override
  String get pdfDataNotAvailable => 'PDF данните не са налични.';

  @override
  String get readerFallbackModeActive => 'Резервният режим на четеца е активен';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Използвайте Reload Reader след превключване към поддържана целева платформа (Android, iOS, macOS).';

  @override
  String get openExternally => 'Отворете външно';

  @override
  String get noEpubChaptersFound => 'Няма намерени EPUB глави.';

  @override
  String get readerNotReady => 'Читателят не е готов.';

  @override
  String get seriesRecordings => 'Записи от сериали';

  @override
  String get now => 'Сега';

  @override
  String get sports => 'Спорт';

  @override
  String get news => 'Новини';

  @override
  String get kids => 'деца';

  @override
  String get premiere => 'Премиера';

  @override
  String get guideTimeline => 'Ръководство Хронология';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Няма намерени канали';

  @override
  String get liveBadge => 'НА ЖИВО';

  @override
  String get movie => 'Филм';

  @override
  String get removedFromFavoriteChannels => 'Премахнато от любимите канали';

  @override
  String get addedToFavoriteChannels => 'Добавен към любими канали';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Неуспешно актуализиране на любимия канал';

  @override
  String get unfavoriteChannel => 'Нелюбим канал';

  @override
  String get favoriteChannel => 'Любим канал';

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
  String get watch => 'Гледай';

  @override
  String get close => 'затвори';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Неуспешно зареждане на записи';

  @override
  String get scheduledInNext24Hours => 'Насрочено за следващите 24 часа';

  @override
  String get recentRecordings => 'Последни записи';

  @override
  String get tvSeries => 'Телевизионен сериал';

  @override
  String get failedToLoadSchedule => 'Неуспешно зареждане на графика';

  @override
  String get noScheduledRecordings => 'Няма планирани записи';

  @override
  String get cancelRecording => 'Отмяна на записа?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'не';

  @override
  String get yesCancel => 'Да, Отказ';

  @override
  String get failedToCancelRecording => 'Анулирането на записа не бе успешно';

  @override
  String get failedToLoadSeriesRecordings =>
      'Неуспешно зареждане на записи на серии';

  @override
  String get noSeriesRecordings => 'Няма записи на сериали';

  @override
  String get cancelSeriesRecording => 'Отменете записа на серия';

  @override
  String get cancelSeriesRecordingQuestion => 'Анулиране на записа на серия?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Неуспешно отменяне на записа на серия';

  @override
  String get searchThisLibrary => 'Търсене в тази библиотека...';

  @override
  String get searchEllipsis => 'Търсене...';

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
  String get seerrAccountType => 'Тип акаунт Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Местен';

  @override
  String get savedMedia => 'Запазени медии';

  @override
  String get tvShows => 'ТВ предавания';

  @override
  String get music => 'Музика';

  @override
  String get musicAlbums => 'Музикални албуми';

  @override
  String get noMediaInFilter => 'Няма медия в този филтър';

  @override
  String get noDownloadedMediaYet => 'Все още няма изтеглени медии';

  @override
  String get browseLibrary => 'Преглед на библиотеката';

  @override
  String get deleteDownload => 'Изтриване на изтеглянето';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Албум';

  @override
  String get playAlbum => 'Възпроизвеждане на албум';

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
  String get errorLoadingEpisodes => 'Грешка при зареждане на епизоди';

  @override
  String get noDownloadedEpisodes => 'Няма изтеглени епизоди';

  @override
  String get deleteEpisode => 'Изтриване на епизод';

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
  String get seriesNotFound => 'Серията не е намерена';

  @override
  String get errorLoadingSeries => 'Грешка при зареждането на серията';

  @override
  String get downloadedEpisodes => 'Изтеглени епизоди';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Специални';

  @override
  String get deleteSeason => 'Изтриване на сезон';

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
  String get storageManagement => 'Управление на съхранението';

  @override
  String get storageBreakdown => 'Разбивка на хранилището';

  @override
  String get downloadedItems => 'Изтеглени елементи';

  @override
  String get storageLimit => 'Лимит за съхранение';

  @override
  String get noLimit => 'Без ограничение';

  @override
  String get deleteAllDownloads => 'Изтриване на всички изтегляния';

  @override
  String get deleteAllDownloadsWarning =>
      'Това ще премахне всички изтеглени медийни файлове и не може да бъде отменено.';

  @override
  String get deleteAll => 'Изтриване на всички';

  @override
  String get deleteSelected => 'Изтриване на избраното';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Музика и аудиокниги';

  @override
  String get images => 'Изображения';

  @override
  String get database => 'База данни';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get authentication => 'Удостоверяване';

  @override
  String get autoLoginServerManagement =>
      'Автоматично влизане, управление на сървъра';

  @override
  String get pinCode => 'PIN код';

  @override
  String get setUpPinCodeProtection => 'Настройте защита с ПИН код';

  @override
  String get parentalControls => 'Родителски контрол';

  @override
  String get contentRatingRestrictions =>
      'Ограничения за оценка на съдържанието';

  @override
  String get bitRateResolutionBehavior => 'Битрейт, резолюция, поведение';

  @override
  String get languageSizeAppearance => 'Език, размер, външен вид';

  @override
  String get qualityStorage => 'Качество, съхранение';

  @override
  String get serverSyncAndPluginStatus =>
      'Синхронизиране на сървъра и състояние на плъгина';

  @override
  String get mediaRequestIntegration => 'Интегриране на медийни заявки';

  @override
  String get switchServer => 'Превключване на сървър';

  @override
  String get signOut => 'Излезте';

  @override
  String get versionLicenses => 'Версия, лицензи';

  @override
  String get account => 'акаунт';

  @override
  String get signInAndSecurity => 'Вход и сигурност';

  @override
  String get administration => 'Администрация';

  @override
  String get serverSettingsUsersLibraries =>
      'Настройки на сървъра, потребители, библиотеки';

  @override
  String get customization => 'Персонализиране';

  @override
  String get themeAndLayout => 'Тема и оформление';

  @override
  String get videoAndSubtitles => 'Видео и субтитри';

  @override
  String get integrations => 'Интеграции';

  @override
  String get pluginAndRequests => 'Плъгин и заявки';

  @override
  String get customizeAccountPlaybackInterface =>
      'Персонализирайте поведението на акаунта, възпроизвеждането и интерфейса';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Тема и външен вид';

  @override
  String get focusBorderColor => 'Цвят на рамката на фокуса';

  @override
  String get watchedIndicators => 'Наблюдавани индикатори';

  @override
  String get always => 'Винаги';

  @override
  String get hideUnwatched => 'Скриване на ненаблюдавани';

  @override
  String get episodesOnly => 'Само епизоди';

  @override
  String get never => 'Никога';

  @override
  String get focusExpansionAnimation => 'Анимация за разширяване на фокуса';

  @override
  String get desktopUiScale =>
      'Мащаб на потребителския интерфейс на работния плот';

  @override
  String get scaleFocusedCards =>
      'Мащабирайте фокусирани или задържани карти и плочки';

  @override
  String get backgroundBackdrops => 'Фонови фонове';

  @override
  String get showBackdropImages =>
      'Показване на фонови изображения зад съдържанието';

  @override
  String get seriesThumbnails => 'Сериални миниатюри';

  @override
  String get seriesThumbnailsDescription =>
      'Само епизоди: използвайте произведения на серията, които съответстват на всеки тип изображение на ред';

  @override
  String get homeRowInfoOverlay => 'Наслагване с информация за начален ред';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Показване на заглавие и метаданни, когато преглеждате началните редове';

  @override
  String get clockDisplay => 'Дисплей на часовника';

  @override
  String get inMenus => 'В менюта';

  @override
  String get inVideo => 'Във видео';

  @override
  String get seasonalEffects => 'Сезонни ефекти';

  @override
  String get seasonalEffectsDescription =>
      'Визуални ефекти и сезонни декорации';

  @override
  String get snow => 'сняг';

  @override
  String get fireworks => 'Фойерверки';

  @override
  String get confetti => 'Конфети';

  @override
  String get fallingLeaves => 'Падащи листа';

  @override
  String get themeMusic => 'Тематична музика';

  @override
  String get playThemeMusicOnDetailPages =>
      'Пуснете тематична музика на страниците с подробности';

  @override
  String get themeMusicVolume => 'Сила на музиката на темата';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Тематична музика на Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Играйте, докато сърфирате в началния екран';

  @override
  String get detailsBackgroundBlur => 'Замъгляване на фона на детайлите';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Замъгляване на фона при сърфиране';

  @override
  String get maxStreamingBitrate => 'Макс. поточен битрейт';

  @override
  String get maxResolution => 'Максимална разделителна способност';

  @override
  String get playerZoomMode => 'Режим на мащабиране на играча';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Автоматично изрязване';

  @override
  String get stretch => 'Разтягане';

  @override
  String get refreshRateSwitching => 'Превключване на скоростта на опресняване';

  @override
  String get disabled => 'Забранено';

  @override
  String get scaleOnTv => 'Мащаб по телевизията';

  @override
  String get scaleOnDevice => 'Мащаб на устройството';

  @override
  String get trickPlay => 'Игра на трикове';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Показване на миниатюри за визуализация при търсене';

  @override
  String get showDescriptionOnPause => 'Показване на описание на пауза';

  @override
  String get dimVideoShowOverview =>
      'Затъмняване на видеото и показване на общ текст, докато е на пауза';

  @override
  String get osdLockButton => 'Бутон за заключване на OSD';

  @override
  String get osdLockButtonDescription =>
      'Показване на бутон за заключване, който блокира въвеждането чрез докосване до дълго натискане';

  @override
  String get audioBehavior => 'Аудио поведение';

  @override
  String get downmixToStereo => 'Смесване към стерео';

  @override
  String get defaultAudioLanguage => 'Аудио език по подразбиране';

  @override
  String get autoServerDefault => 'Автоматично (по подразбиране на сървъра)';

  @override
  String get english => 'английски';

  @override
  String get spanish => 'испански';

  @override
  String get french => 'френски';

  @override
  String get german => 'немски';

  @override
  String get italian => 'италиански';

  @override
  String get portuguese => 'португалски';

  @override
  String get japanese => 'японски';

  @override
  String get korean => 'корейски';

  @override
  String get chinese => 'китайски';

  @override
  String get russian => 'руски';

  @override
  String get arabic => 'арабски';

  @override
  String get hindi => 'хинди';

  @override
  String get dutch => 'холандски';

  @override
  String get swedish => 'шведски';

  @override
  String get norwegian => 'норвежки';

  @override
  String get danish => 'датски';

  @override
  String get finnish => 'финландски';

  @override
  String get polish => 'полски';

  @override
  String get ac3Passthrough => 'AC3 преминаване';

  @override
  String get dtsPassthrough => 'DTS преминаване';

  @override
  String get trueHdSupport => 'Поддръжка на TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS аудио само към AVR; изисква поддръжка на приемник и DTS изходна песен';

  @override
  String get enableTrueHdAudio =>
      'Активирайте TrueHD аудио (може да не работи на всички платформи)';

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
  String get nightMode => 'Нощен режим';

  @override
  String get compressDynamicRange => 'Компресирайте динамичния диапазон';

  @override
  String get advancedMpv => 'Разширено mpv';

  @override
  String get enableCustomMpvConf => 'Активиране на Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Приложете определен от потребителя mpv.conf преди да започне възпроизвеждането';

  @override
  String get unsafeAdvancedMpvOptions => 'Небезопасни разширени опции за mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Разрешете по-широк набор от опции за mpv. Може да наруши поведението при възпроизвеждане.';

  @override
  String get hardwareDecoding => 'Хардуерно декодиране';

  @override
  String get hardwareDecodingSubtitle =>
      'Може да подобри производителността, но може да причини проблеми с възпроизвеждането на някои устройства.';

  @override
  String get nextUpAndQueuing => 'Следващ и на опашка';

  @override
  String get nextUpDisplay => 'Следващ дисплей';

  @override
  String get extended => 'Разширено';

  @override
  String get minimal => 'Минимална';

  @override
  String get nextUpTimeout => 'Време за изчакване на следващия';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Опашка за медии';

  @override
  String get autoQueueNextEpisodes =>
      'Автоматично нареждане на следващите епизоди';

  @override
  String get stillWatchingPrompt => 'Все още гледам подкана';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Възобновяване и пропускане';

  @override
  String get resumeRewind => 'Възобновяване Превъртане назад';

  @override
  String get unpauseRewind => 'Превъртане назад на пауза';

  @override
  String get fiveSeconds => '5 секунди';

  @override
  String get tenSeconds => '10 секунди';

  @override
  String get fifteenSeconds => '15 секунди';

  @override
  String get thirtySeconds => '30 секунди';

  @override
  String get skipBackLength => 'Пропускане на задната дължина';

  @override
  String get skipForwardLength => 'Прескачане на дължина напред';

  @override
  String get customMpvConfPath => 'Персонализиран път на mpv.conf';

  @override
  String get notSetMpvConf =>
      'Не е зададено. Moonfin ще опита mpv.conf по подразбиране в папки app/data.';

  @override
  String get selectMpvConf => 'Изберете mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Настройките за стил (размер, цвят, отместване) се прилагат за базирани на текст субтитри (SRT, VTT, TTML). ASS/SSA субтитрите използват свой собствен вграден стил, освен ако „ASS/SSA Direct Play“ не е изключено. Растерните субтитри (PGS, DVB, VobSub) не могат да бъдат рестартирани.';

  @override
  String get defaultSubtitleLanguage => 'Език на субтитрите по подразбиране';

  @override
  String get defaultToNoSubtitles => 'По подразбиране няма субтитри';

  @override
  String get turnOffSubtitlesByDefault =>
      'Изключете субтитрите по подразбиране';

  @override
  String get subtitleSize => 'Размер на субтитрите';

  @override
  String get textFillColor => 'Цвят на запълване на текст';

  @override
  String get backgroundColor => 'Цвят на фона';

  @override
  String get textStrokeColor => 'Цвят на текста';

  @override
  String get subtitleCustomization => 'Персонализиране на субтитрите';

  @override
  String get subtitleCustomizationDescription =>
      'Персонализирайте външния вид на субтитрите';

  @override
  String get subtitlePreviewText =>
      'Бързата кафява лисица прескача мързеливото куче';

  @override
  String get verticalOffset => 'Вертикално отместване';

  @override
  String get pgsDirectPlay => 'Директна игра на PGS';

  @override
  String get directPlayPgsSubtitles => 'Директно пускане на PGS субтитри';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Директна игра';

  @override
  String get directPlayAssSsaSubtitles =>
      'Директно възпроизвеждане на ASS/SSA субтитри';

  @override
  String get white => 'Бяло';

  @override
  String get black => 'черен';

  @override
  String get yellow => 'Жълто';

  @override
  String get green => 'зелено';

  @override
  String get cyan => 'циан';

  @override
  String get red => 'червено';

  @override
  String get transparent => 'Прозрачен';

  @override
  String get semiTransparentBlack => 'Полупрозрачно черно';

  @override
  String get global => 'Глобален';

  @override
  String get desktop => 'Работен плот';

  @override
  String get mobile => 'Мобилен';

  @override
  String get tv => 'телевизор';

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
  String get customizationProfile => 'Профил за персонализиране';

  @override
  String get customizationProfileDescription =>
      'Изберете профила за зареждане, редактиране и синхронизиране. Global се прилага навсякъде, освен ако профил на устройство не го замени. Зелената точка маркира текущия ви профил на устройството.';

  @override
  String get loadProfile => 'Заредете профил';

  @override
  String get syncing => 'Синхронизиране...';

  @override
  String get syncToProfile => 'Синхронизиране с профил';

  @override
  String get profileSyncHidden => 'Синхронизирането на профили е скрито';

  @override
  String get enablePluginSyncDescription =>
      'Активирайте синхронизирането на сървърни добавки в настройките на добавките, за да покажете контролите на профила тук.';

  @override
  String get quality => 'качество';

  @override
  String get defaultDownloadQuality => 'Качество на изтегляне по подразбиране';

  @override
  String get network => 'мрежа';

  @override
  String get wifiOnlyDownloads => 'Изтегляния само за WiFi';

  @override
  String get onlyDownloadOnWifi => 'Изтегляйте само когато сте свързани с WiFi';

  @override
  String get storage => 'Съхранение';

  @override
  String get storageUsed => 'Използвано място за съхранение';

  @override
  String get manage => 'Управлявайте';

  @override
  String get calculating => 'Изчислява се...';

  @override
  String get downloadLocation => 'Местоположение за изтегляне';

  @override
  String get defaultLabel => 'По подразбиране';

  @override
  String get saveToDownloadsFolder => 'Запазване в папка за изтегляния';

  @override
  String get downloadsVisibleToOtherApps =>
      'Изтегляния/Moonfin — видими за други приложения';

  @override
  String get dangerZone => 'Опасна зона';

  @override
  String get clearAllDownloads => 'Изчистване на всички изтегляния';

  @override
  String get original => 'Оригинален';

  @override
  String get changeDownloadLocation =>
      'Промяна на местоположението за изтегляне';

  @override
  String get changeDownloadLocationDescription =>
      'Новите изтегляния ще бъдат запазени в избраната папка. Съществуващите изтегляния ще останат в текущото си местоположение и могат да се управляват от настройките за съхранение.';

  @override
  String get confirm => 'Потвърдете';

  @override
  String get cannotWriteToFolder =>
      'Не може да се записва в избраната папка. Моля, изберете друго местоположение или дайте разрешения за съхранение.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Запазване в папка за изтегляния?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Изтеглените медии ще бъдат запазени в Downloads/Moonfin на вашето устройство. Тези файлове ще бъдат видими за други приложения, като вашата галерия или музикален плейър.\n\nСъществуващите изтегляния ще останат в текущото си местоположение.';

  @override
  String get enable => 'Активиране';

  @override
  String get clearAllDownloadsWarning =>
      'Това ще изтрие всички изтеглени медии и не може да бъде отменено.';

  @override
  String get clearAll => 'Изчистване на всички';

  @override
  String get navigationStyle => 'Стил на навигация';

  @override
  String get topBar => 'Горна лента';

  @override
  String get leftSidebar => 'Лява странична лента';

  @override
  String get showShuffleButton => 'Показване на бутона за разбъркване';

  @override
  String get showGenresButton => 'Показване на бутона за жанрове';

  @override
  String get showFavoritesButton => 'Показване на бутона за любими';

  @override
  String get showLibrariesInToolbar =>
      'Показване на библиотеки в лентата с инструменти';

  @override
  String get navbarOpacity => 'Непрозрачност на навигационната лента';

  @override
  String get navbarColor => 'Цвят на навигационната лента';

  @override
  String get gray => 'Сив';

  @override
  String get darkBlue => 'Тъмно синьо';

  @override
  String get purple => 'Лилаво';

  @override
  String get teal => 'Тил';

  @override
  String get navy => 'ВМС';

  @override
  String get charcoal => 'дървени въглища';

  @override
  String get brown => 'кафяво';

  @override
  String get darkRed => 'Тъмно червено';

  @override
  String get darkGreen => 'Тъмно зелено';

  @override
  String get slate => 'шисти';

  @override
  String get indigo => 'Индиго';

  @override
  String get libraryDisplay => 'Библиотечен дисплей';

  @override
  String get posterLabel => 'Плакат';

  @override
  String get thumbnailLabel => 'Миниатюра';

  @override
  String get bannerLabel => 'Банер';

  @override
  String get overridePerLibrarySettings =>
      'Замяна на настройките за всяка библиотека';

  @override
  String get applyImageTypeToAllLibraries =>
      'Прилагане на тип изображение към всички библиотеки';

  @override
  String get multiServerLibraries => 'Мулти-сървърни библиотеки';

  @override
  String get showLibrariesFromAllServers =>
      'Показване на библиотеки от всички свързани сървъри';

  @override
  String get enableFolderView => 'Активиране на изглед на папка';

  @override
  String get showFolderBrowsingOption =>
      'Показване на опцията за разглеждане на папки';

  @override
  String get libraryVisibility => 'Видимост на библиотеката';

  @override
  String get libraryVisibilityDescription =>
      'Превключване на видимостта на началната страница за библиотека. Рестартирайте Moonfin, за да влязат в сила промените.';

  @override
  String get showInNavigation => 'Показване в навигацията';

  @override
  String get showInLatestMedia => 'Показване в най-новите медии';

  @override
  String get sourceLibraries => 'Библиотеки с източници';

  @override
  String get sourceCollections => 'Изходни колекции';

  @override
  String get excludedGenres => 'Изключени жанрове';

  @override
  String get selectAll => 'Изберете Всички';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Медийна лента';

  @override
  String get mediaSources => 'Медийни източници';

  @override
  String get behavior => 'Поведение';

  @override
  String get seconds => 'секунди';

  @override
  String get localPreviews => 'Местни визуализации';

  @override
  String get localPreviewsDescription =>
      'Конфигурирайте визуализации на трейлъри, медии и аудио.';

  @override
  String get mediaBarMode => 'Стил на медийната лента';

  @override
  String get mediaBarModeDescription =>
      'Изберете между Moonfin, MakD или изключете медийната лента';

  @override
  String get mediaBarModeMoonfin => 'Лунна перка';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Изкл';

  @override
  String get enableMediaBar => 'Активиране на медийната лента';

  @override
  String get showFeaturedContentSlideshow =>
      'Показване на слайдшоу с представено съдържание на началната страница';

  @override
  String get contentType => 'Тип съдържание';

  @override
  String get moviesAndTvShows => 'Филми и телевизионни предавания';

  @override
  String get moviesOnly => 'Само филми';

  @override
  String get tvShowsOnly => 'Само телевизионни предавания';

  @override
  String get itemCount => 'Брой артикули';

  @override
  String get noneSelected => 'Няма избрани';

  @override
  String get noneExcluded => 'Никой не е изключен';

  @override
  String get autoAdvance => 'Автоматичен аванс';

  @override
  String get autoAdvanceSlides => 'Автоматично преминаване към следващия слайд';

  @override
  String get autoAdvanceInterval => 'Интервал за автоматично изпреварване';

  @override
  String get trailerPreview => 'Преглед на трейлър';

  @override
  String get autoPlayTrailers =>
      'Автоматично пускане на трейлъри в медийната лента след 3 секунди';

  @override
  String get episodePreview => 'Преглед на епизод';

  @override
  String get mediaPreview => 'Преглед на медиите';

  @override
  String get episodePreviewDescription =>
      'Възпроизвеждане на 30-секунден вграден преглед на фокусирани, задържани или дълго натиснати карти';

  @override
  String get mediaPreviewDescription =>
      'Възпроизвеждане на 30-секунден вграден преглед на фокусирани, задържани или дълго натиснати карти';

  @override
  String get previewAudio => 'Преглед на аудио';

  @override
  String get enablePreviewAudio =>
      'Активирайте аудио за визуализации на трейлъри и епизоди';

  @override
  String get latestMedia => 'Най-новите медии';

  @override
  String get recentlyReleased => 'Наскоро пуснат';

  @override
  String get myMedia => 'Моите медии';

  @override
  String get myMediaSmall => 'Моите медии (малки)';

  @override
  String get continueWatching => 'Продължете да гледате';

  @override
  String get resumeAudio => 'Възобновяване на звука';

  @override
  String get resumeBooks => 'Резюме Книги';

  @override
  String get activeRecordings => 'Активни записи';

  @override
  String get playlists => 'Плейлисти';

  @override
  String get liveTV => 'Телевизия на живо';

  @override
  String get homeSections => 'Начало Раздели';

  @override
  String get resetToDefaults => 'Възстановяване на настройките по подразбиране';

  @override
  String get homeRowPosterSize => 'Размер на постера на началния ред';

  @override
  String get perRowImageTypeSelection => 'Избор на тип изображение на ред';

  @override
  String get configureImageTypeForEachRow =>
      'Конфигурирайте типа на изображението за всеки активиран начален ред';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Обединете Продължете да гледате и Следващия';

  @override
  String get combineBothRows => 'Комбинирайте двата реда в една начална секция';

  @override
  String get perRowImageType => 'Тип изображение на ред';

  @override
  String get perRowSettings => 'Настройки за всеки ред';

  @override
  String get autoLogin => 'Автоматично влизане';

  @override
  String get lastUser => 'Последен потребител';

  @override
  String get specificUser => 'Конкретен потребител';

  @override
  String get alwaysAuthenticate => 'Винаги удостоверявай';

  @override
  String get requirePasswordWithToken =>
      'Изискване на парола дори със съхранен токен';

  @override
  String get confirmExit => 'Потвърдете Изход';

  @override
  String get showConfirmationBeforeExiting =>
      'Показване на потвърждение преди излизане';

  @override
  String get blockContentWithRatings =>
      'Блокирайте съдържание със следните оценки:';

  @override
  String get noContentRatingsFound =>
      'Все още няма намерени оценки на съдържанието на този сървър.';

  @override
  String get couldNotLoadServerRatings =>
      'Оценките на сървъра не можаха да се заредят. Показват се само запазените оценки.';

  @override
  String get couldNotRefreshRatings =>
      'Оценките не можаха да се обновят от сървъра. Показване на запазени оценки.';

  @override
  String get enablePinCode => 'Активирайте PIN кода';

  @override
  String get requirePinToAccess => 'Изискване на ПИН за достъп до вашия акаунт';

  @override
  String get changePin => 'Промяна на PIN';

  @override
  String get setNewPinCode => 'Задайте нов ПИН код';

  @override
  String get removePin => 'Премахване на PIN';

  @override
  String get removePinProtection => 'Премахнете защитата с ПИН код';

  @override
  String get screensaver => 'Скрийнсейвър';

  @override
  String get inAppScreensaver => 'Скрийнсейвър в приложението';

  @override
  String get enableBuiltInScreensaver => 'Активирайте вградения скрийнсейвър';

  @override
  String get mode => 'Режим';

  @override
  String get libraryArt => 'Библиотечен чл';

  @override
  String get logo => 'Лого';

  @override
  String get clock => 'Часовник';

  @override
  String get timeout => 'Време за изчакване';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Ниво на затъмняване';

  @override
  String get maxAgeRating => 'Максимална възрастова оценка';

  @override
  String get any => 'Всякакви';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Изискване на възрастова оценка';

  @override
  String get onlyShowRatedContent => 'Показвайте само оценено съдържание';

  @override
  String get showClock => 'Показване на часовник';

  @override
  String get displayClockDuringScreensaver =>
      'Показване на часовник по време на скрийнсейвър';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Критика)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Публика)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Метакритичен';

  @override
  String get metacriticUser => 'Metacritic (потребител)';

  @override
  String get trakt => 'Тракт';

  @override
  String get letterboxd => 'Пощенска кутияd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Рейтинг на общността';

  @override
  String get ratings => 'Оценки';

  @override
  String get additionalRatings => 'Допълнителни оценки';

  @override
  String get showMdbListAndTmdbRatings => 'Показване на MDBList и TMDB оценки';

  @override
  String get ratingLabels => 'Етикети за оценка';

  @override
  String get showLabelsNextToIcons =>
      'Показване на етикети до иконите за оценка';

  @override
  String get ratingBadges => 'Значки за оценка';

  @override
  String get showDecorativeBadges =>
      'Показване на декоративни значки зад оценките';

  @override
  String get episodeRatings => 'Оценки на епизодите';

  @override
  String get showRatingsOnEpisodes => 'Показване на оценки за отделни епизоди';

  @override
  String get ratingSources => 'Източници на рейтинг';

  @override
  String get ratingSourcesDescription =>
      'Активирайте и пренаредете източниците на оценка, показани в приложението';

  @override
  String get pluginLabel => 'Плъгин';

  @override
  String get pluginDetected => 'Добавката е открита';

  @override
  String get pluginNotDetected => 'Приставката не е открита';

  @override
  String get pluginDetectedDescription =>
      'Открит е сървърен плъгин. Синхронизирането се активира автоматично при първото намиране на приставката.';

  @override
  String get pluginNotDetectedDescription =>
      'Сървърният плъгин в момента не е открит. Локалните настройки все още използват своите запазени стойности или вградени настройки по подразбиране.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Налични услуги';

  @override
  String get serverPluginSync => 'Синхронизиране на сървърни добавки';

  @override
  String get syncSettingsWithPlugin =>
      'Синхронизирайте настройките със сървърния плъгин';

  @override
  String get whatSyncControls => 'Какви контроли за синхронизиране';

  @override
  String get syncControlsDescription =>
      'Синхронизирането контролира само дали поддържаните от плъгини настройки се изпращат и изтеглят от сървъра. Изборът на профил и действията за синхронизиране на профил са в настройките за персонализиране, когато синхронизирането на плъгини е активирано.';

  @override
  String get recentRequests => 'Последни заявки';

  @override
  String get recentlyAdded => 'Наскоро добавени';

  @override
  String get trending => 'Тенденции';

  @override
  String get popularMovies => 'Популярни филми';

  @override
  String get movieGenres => 'Филмови жанрове';

  @override
  String get upcomingMovies => 'Предстоящи филми';

  @override
  String get studios => 'Студия';

  @override
  String get popularSeries => 'Популярни сериали';

  @override
  String get seriesGenres => 'Жанрове сериали';

  @override
  String get upcomingSeries => 'Предстоящи серии';

  @override
  String get networks => 'мрежи';

  @override
  String get resetRowsToDefaults =>
      'Възстановяване на редовете по подразбиране';

  @override
  String get enableSeerr => 'Активирайте Seerr';

  @override
  String get showSeerrInNavigation =>
      'Показване на Seerr в навигацията (изисква сървърен плъгин)';

  @override
  String get seerrUnavailable =>
      'Недостъпно, тъй като поддръжката на Seerr за плъгин на сървъра е деактивирана.';

  @override
  String get nsfwFilter => 'NSFW филтър';

  @override
  String get hideAdultContent =>
      'Скриване на съдържание за възрастни в резултатите';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Открийте редове';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Плъзнете, за да пренаредите. Активиране или деактивиране на редове. Активираният ред на редовете се синхронизира с приставката Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Плъзнете, за да пренаредите. Активиране или деактивиране на редове.';

  @override
  String get enabled => 'Активирано';

  @override
  String get hidden => 'Скрити';

  @override
  String get aboutTitle => 'За';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Лицензи за отворен код';

  @override
  String get sourceCode => 'Изходен код';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Проверете за актуализации сега';

  @override
  String get checksLatestDesktopRelease =>
      'Проверява най-новата версия за настолен компютър за тази платформа';

  @override
  String get youAreUpToDate => 'Вие сте в крак с времето.';

  @override
  String get couldNotCheckForUpdates =>
      'Не можах да проверя за актуализации в момента.';

  @override
  String get noCompatibleUpdate =>
      'Не е намерен съвместим пакет за актуализация за тази платформа.';

  @override
  String get updateChecksNotSupported =>
      'Проверките за актуализации не се поддържат на тази платформа.';

  @override
  String get updateNotificationsDisabled =>
      'Известията за актуализиране са деактивирани.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Моля, изчакайте, преди да проверите отново.';

  @override
  String get latestUpdateAlreadyShown =>
      'Последната актуализация вече беше показана.';

  @override
  String get updateAvailable => 'Налична актуализация.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Известия за актуализиране';

  @override
  String get showWhenUpdatesAvailable => 'Покажи кога са налични актуализации';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Прочетете бележките по изданието';

  @override
  String get downloadingUpdate => 'Актуализацията се изтегля...';

  @override
  String get updateDownloadFailed =>
      'Изтеглянето на актуализацията не бе успешно. Моля, опитайте отново.';

  @override
  String get openReleasesPage => 'Отворете страницата за издания';

  @override
  String get navigation => 'Навигация';

  @override
  String get watchedIndicatorsBackdrops => 'Гледани индикатори, фонове';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Цвят на фокуса, наблюдавани индикатори, фонове';

  @override
  String get navbarStyleToolbarAppearance =>
      'Стил на навигационната лента, бутони на лентата с инструменти, външен вид';

  @override
  String get reorderToggleHomeRows =>
      'Пренаредете и превключете началните редове';

  @override
  String get featuredContentAppearance => 'Представено съдържание, външен вид';

  @override
  String get posterSizeImageTypeFolderView =>
      'Размер на плаката, тип изображение, изглед на папка';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB и източници на рейтинг';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'ясно';

  @override
  String get browse => 'Прегледайте';

  @override
  String get noResults => 'Няма резултати';

  @override
  String get seerrAvailableStatus => 'Наличен';

  @override
  String get seerrRequestedStatus => 'Поискано';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Настройки на Seerr';

  @override
  String get requestMore => 'Поискайте повече';

  @override
  String get request => 'Заявка';

  @override
  String get cancelRequest => 'Отказ от заявка';

  @override
  String get playInMoonfin => 'Играйте в Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Одобряване';

  @override
  String get declineAction => 'Откажи';

  @override
  String get similar => 'подобни';

  @override
  String get recommendations => 'Препоръки';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Запазете';

  @override
  String get itemNotFoundInLibrary =>
      'Артикулът не е намерен във вашата библиотека Moonfin';

  @override
  String get errorSearchingLibrary => 'Грешка при търсене на библиотека';

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
  String get submitRequest => 'Изпратете заявка';

  @override
  String get allSeasons => 'Всички сезони';

  @override
  String get advancedOptions => 'Разширени опции';

  @override
  String get noServiceServersConfigured =>
      'Няма конфигурирани сервизни сървъри';

  @override
  String get server => 'сървър';

  @override
  String get qualityProfile => 'Качествен профил';

  @override
  String get rootFolder => 'Основна папка';

  @override
  String get showMore => 'Покажи повече';

  @override
  String get appearances => 'Изяви';

  @override
  String get crewSection => 'Екипаж';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Няма заявки';

  @override
  String get pendingStatus => 'В очакване';

  @override
  String get declinedStatus => 'Отказано';

  @override
  String get partiallyAvailable => 'Частично наличен';

  @override
  String get downloadingStatus => 'Изтегля се';

  @override
  String get approvedStatus => 'Одобрено';

  @override
  String get notRequestedStatus => 'Не е поискано';

  @override
  String get blocklistedStatus => 'Блокиран';

  @override
  String get deletedStatus => 'Изтрито';

  @override
  String get tmdbScore => 'TMDB резултат';

  @override
  String get releaseDateLabel => 'Дата на издаване';

  @override
  String get firstAirDateLabel => 'Първа дата за ефир';

  @override
  String get revenueLabel => 'приходи';

  @override
  String get runtimeLabel => 'Време за изпълнение';

  @override
  String get budgetLabel => 'Бюджет';

  @override
  String get originalLanguageLabel => 'Оригинален език';

  @override
  String get seasonsLabel => 'Сезони';

  @override
  String get episodesLabel => 'епизоди';

  @override
  String get access => 'Достъп';

  @override
  String get add => 'Добавете';

  @override
  String get address => 'Адрес';

  @override
  String get analytics => 'Анализ';

  @override
  String get catalog => 'Каталог';

  @override
  String get content => 'Съдържание';

  @override
  String get copy => 'копие';

  @override
  String get create => 'Създавайте';

  @override
  String get disable => 'Деактивиране';

  @override
  String get done => 'Готово';

  @override
  String get edit => 'Редактиране';

  @override
  String get encoding => 'Кодиране';

  @override
  String get error => 'Грешка';

  @override
  String get forward => 'Напред';

  @override
  String get general => 'генерал';

  @override
  String get go => 'върви';

  @override
  String get install => 'Инсталирайте';

  @override
  String get installed => 'Инсталиран';

  @override
  String get interval => 'Интервал';

  @override
  String get name => 'Име';

  @override
  String get networking => 'Работа в мрежа';

  @override
  String get next => 'Следваща';

  @override
  String get path => 'Пътека';

  @override
  String get paused => 'На пауза';

  @override
  String get permissions => 'Разрешения';

  @override
  String get processing => 'Обработка';

  @override
  String get profile => 'Профил';

  @override
  String get provider => 'Доставчик';

  @override
  String get refresh => 'Опресняване';

  @override
  String get remote => 'Дистанционно';

  @override
  String get rename => 'Преименуване';

  @override
  String get revoke => 'Отмени';

  @override
  String get role => 'Роля';

  @override
  String get root => 'корен';

  @override
  String get run => 'Бягай';

  @override
  String get search => 'Търсене';

  @override
  String get select => 'Изберете';

  @override
  String get send => 'Изпратете';

  @override
  String get sessions => 'Сесии';

  @override
  String get set => 'Комплект';

  @override
  String get status => 'Статус';

  @override
  String get stop => 'Спрете';

  @override
  String get streaming => 'Поточно предаване';

  @override
  String get time => 'време';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Деинсталиране';

  @override
  String get up => 'нагоре';

  @override
  String get update => 'Актуализация';

  @override
  String get upload => 'Качване';

  @override
  String get unmute => 'Включване на звука';

  @override
  String get mute => 'Без звук';

  @override
  String get branding => 'Брандиране';

  @override
  String get adminDrawerDashboard => 'Табло за управление';

  @override
  String get adminDrawerAnalytics => 'Анализ';

  @override
  String get adminDrawerSettings => 'Настройки';

  @override
  String get adminDrawerBranding => 'Брандиране';

  @override
  String get adminDrawerUsers => 'Потребители';

  @override
  String get adminDrawerLibraries => 'библиотеки';

  @override
  String get adminDrawerTranscoding => 'Транскодиране';

  @override
  String get adminDrawerResume => 'Резюме';

  @override
  String get adminDrawerStreaming => 'Поточно предаване';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'устройства';

  @override
  String get adminDrawerActivity => 'активност';

  @override
  String get adminDrawerNetworking => 'Работа в мрежа';

  @override
  String get adminDrawerApiKeys => 'API ключове';

  @override
  String get adminDrawerBackups => 'Архивиране';

  @override
  String get adminDrawerLogs => 'трупи';

  @override
  String get adminDrawerScheduledTasks => 'Планирани задачи';

  @override
  String get adminDrawerPlugins => 'Плъгини';

  @override
  String get adminDrawerRepositories => 'Хранилища';

  @override
  String get adminDrawerLiveTv => 'Телевизия на живо';

  @override
  String get adminExitTooltip => 'Изход от администратора';

  @override
  String get adminDashboardLoadFailed =>
      'Неуспешно зареждане на таблото за управление';

  @override
  String get adminMediaOverview => 'Преглед на медиите';

  @override
  String get adminMediaTotalsError =>
      'Неуспешно зареждане на сървърни мултимедийни суми.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Бързо четене на това колко съдържание има на този сървър.';

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
  String get analyticsMediaDistribution => 'Медийно разпространение';

  @override
  String get analyticsVideoCodecs => 'Видео кодеци';

  @override
  String get analyticsAudioCodecs => 'Аудио кодеци';

  @override
  String get analyticsContainers => 'Контейнери';

  @override
  String get analyticsTopGenres => 'Топ жанрове';

  @override
  String get analyticsReleaseYears => 'Години на издаване';

  @override
  String get analyticsContentRatings => 'Оценки на съдържанието';

  @override
  String get analyticsRuntimeBuckets => 'Кофи за изпълнение';

  @override
  String get analyticsFileFormats => 'Файлови формати';

  @override
  String get analyticsNoData => 'Няма налични данни.';

  @override
  String get adminServerInfo => 'Информация за сървъра';

  @override
  String get adminRestartPending => 'Очаква се рестартиране';

  @override
  String get adminServerPaths => 'Пътища на сървъра';

  @override
  String get adminServerActions => 'Действия на сървъра';

  @override
  String get adminRestartServer => 'Рестартирайте сървъра';

  @override
  String get adminShutdownServer => 'Изключване на сървъра';

  @override
  String get adminScanLibraries => 'Сканиране на библиотеки';

  @override
  String get adminLibraryScanStarted => 'Сканирането на библиотеката започна';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Извършва се рестартиране на сървъра';

  @override
  String get adminServerRebootMessage =>
      'В ход е рестартиране на сървъра, моля, рестартирайте Moonfin';

  @override
  String get adminActiveSessions => 'Активни сесии';

  @override
  String get adminSessionsLoadFailed => 'Неуспешно зареждане на сесии';

  @override
  String get adminNoActiveSessions => 'Няма активни сесии';

  @override
  String get adminRecentActivity => 'Скорошна активност';

  @override
  String get adminNoRecentActivity => 'Няма скорошна активност';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Изпратете съобщение';

  @override
  String get adminMessageTextHint => 'Текст на съобщението';

  @override
  String get adminSetVolume => 'Задайте сила на звука';

  @override
  String get sessionPrev => 'предишна';

  @override
  String get sessionRewind => 'Превъртане назад';

  @override
  String get sessionForward => 'Напред';

  @override
  String get sessionNext => 'Следваща';

  @override
  String get sessionVolumeDown => 'том –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Сега се играе';

  @override
  String get volume => 'Обем';

  @override
  String get actions => 'Действия';

  @override
  String get videoCodec => 'Видео кодек';

  @override
  String get audioCodec => 'Аудио кодек';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Завършване';

  @override
  String get direct => 'Директен';

  @override
  String get adminDisconnect => 'Прекъснете връзката';

  @override
  String get adminClearDates => 'Ясни дати';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Няма записи за дейност';

  @override
  String get adminEditDeviceName => 'Редактиране на името на устройството';

  @override
  String get adminCustomName => 'Персонализирано име';

  @override
  String get adminDeviceNameUpdated => 'Името на устройството е актуализирано';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Изтриване на устройство';

  @override
  String get adminDeviceDeleted => 'Устройството е изтрито';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Неуспешно зареждане на устройства';

  @override
  String get adminSearchDevices => 'Търсене на устройства';

  @override
  String get adminThisDevice => 'Това устройство';

  @override
  String get adminEditName => 'Редактиране на името';

  @override
  String get adminLibrariesLoadFailed => 'Неуспешно зареждане на библиотеки';

  @override
  String get adminNoLibraries => 'Няма конфигурирани библиотеки';

  @override
  String get adminScanAllLibraries => 'Сканирайте всички библиотеки';

  @override
  String get adminAddLibrary => 'Добавяне на библиотека';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Преименуване на библиотека';

  @override
  String get adminNewName => 'Ново име';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Изтриване на библиотека';

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
  String get adminRemovePath => 'Премахване на пътя';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Опциите на библиотеката са запазени';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Неуспешно зареждане на библиотеката';

  @override
  String get adminNoMediaPaths => 'Няма конфигурирани пътища за медии';

  @override
  String get adminAddPath => 'Добавяне на път';

  @override
  String get adminBrowseFilesystem =>
      'Преглед на файловата система на сървъра:';

  @override
  String get adminSaveOptions => 'Опции за запазване';

  @override
  String get adminPreferredMetadataLanguage => 'Предпочитан език за метаданни';

  @override
  String get adminMetadataLanguageHint => 'напр. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Код на държавата с метаданни';

  @override
  String get adminMetadataCountryHint => 'напр. САЩ, Германия, Франция';

  @override
  String get adminLibraryNameRequired => 'Името на библиотеката е задължително';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Име на библиотеката';

  @override
  String get adminSelectedPaths => 'Избрани пътища:';

  @override
  String get adminNoPathsAdded =>
      'Няма добавени пътища (може да се добави по-късно)';

  @override
  String get adminCreateLibrary => 'Създаване на библиотека';

  @override
  String get paths => 'Пътища:';

  @override
  String get adminDisableUser => 'Деактивиране на потребителя';

  @override
  String get adminEnableUser => 'Активиране на потребителя';

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
  String get adminUsersLoadFailed => 'Неуспешно зареждане на потребители';

  @override
  String get adminSearchUsers => 'Търсете потребители';

  @override
  String get adminEditUser => 'Редактиране на потребител';

  @override
  String get adminAddUser => 'Добавяне на потребител';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Създаване на потребител';

  @override
  String get adminPasswordOptional => 'Парола (по избор)';

  @override
  String get adminUsernameRequired =>
      'Потребителското име не може да бъде празно';

  @override
  String get adminNoProfileChanges => 'Няма промени в профила за запазване';

  @override
  String get adminProfileSaved => 'Профилът е запазен';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Разрешенията са запазени';

  @override
  String get adminPasswordsMismatch => 'Паролите не съвпадат';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Неуспешно зареждане на потребителя';

  @override
  String get adminBackToUsers => 'Назад към Потребители';

  @override
  String get adminSaveProfile => 'Запазване на профил';

  @override
  String get adminDeleteUser => 'Изтриване на потребител';

  @override
  String get admin => 'Админ';

  @override
  String get adminFullAccessWarning =>
      'Администраторите имат пълен достъп до сървъра. Давайте с повишено внимание.';

  @override
  String get administrator => 'Администратор';

  @override
  String get adminHiddenUser => 'Скрит потребител';

  @override
  String get adminAllowMediaPlayback =>
      'Разрешете възпроизвеждане на мултимедия';

  @override
  String get adminAllowAudioTranscoding => 'Разрешаване на аудио транскодиране';

  @override
  String get adminAllowVideoTranscoding => 'Разрешете прекодиране на видео';

  @override
  String get adminAllowRemuxing => 'Разрешаване на повторното муксиране';

  @override
  String get adminForceRemoteTranscoding =>
      'Принудително транскодиране на отдалечен източник';

  @override
  String get adminAllowContentDeletion => 'Разрешете изтриване на съдържание';

  @override
  String get adminAllowContentDownloading =>
      'Разрешаване на изтегляне на съдържание';

  @override
  String get adminAllowPublicSharing => 'Разрешете публично споделяне';

  @override
  String get adminAllowRemoteControl =>
      'Разрешаване на дистанционно управление на други потребители';

  @override
  String get adminAllowSharedDeviceControl =>
      'Разрешаване на споделен контрол на устройството';

  @override
  String get adminAllowRemoteAccess => 'Разрешете отдалечен достъп';

  @override
  String get adminRemoteBitrateLimit =>
      'Ограничение за битрейт на отдалечен клиент (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Оставете празно за без ограничение';

  @override
  String get adminMaxActiveSessions => 'Макс. активни сесии';

  @override
  String get adminAllowLiveTvAccess => 'Разрешете достъп до телевизия на живо';

  @override
  String get adminAllowLiveTvManagement =>
      'Разрешете управление на телевизия на живо';

  @override
  String get adminAllowCollectionManagement =>
      'Разрешаване на управление на колекцията';

  @override
  String get adminAllowSubtitleManagement =>
      'Разрешаване на управление на субтитрите';

  @override
  String get adminAllowLyricManagement =>
      'Разрешаване на управление на текстове';

  @override
  String get adminSavePermissions => 'Запазване на разрешенията';

  @override
  String get adminEnableAllLibraryAccess =>
      'Разрешете достъп до всички библиотеки';

  @override
  String get adminSaveAccess => 'Запазване на достъпа';

  @override
  String get adminChangePassword => 'Промяна на паролата';

  @override
  String get adminNewPassword => 'Нова парола';

  @override
  String get adminConfirmPassword => 'Потвърдете паролата';

  @override
  String get adminSetPassword => 'Задайте парола';

  @override
  String get adminResetPassword => 'Нулиране на парола';

  @override
  String get adminPasswordReset => 'Нулиране на парола';

  @override
  String get adminPasswordUpdated => 'Паролата е актуализирана';

  @override
  String get adminUserSettings => 'Потребителски настройки';

  @override
  String get adminLibraryAccess => 'Достъп до библиотеката';

  @override
  String get adminDeviceAndChannelAccess => 'Достъп до устройство и канал';

  @override
  String get adminEnableAllDevices => 'Разрешете достъп до всички устройства';

  @override
  String get adminEnableAllChannels => 'Разрешете достъпа до всички канали';

  @override
  String get adminResetPasswordWarning =>
      'Това ще премахне паролата. Потребителят ще може да влезе без парола.';

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
  String get adminCreateApiKey => 'Създайте API ключ';

  @override
  String get adminAppName => 'Име на приложението';

  @override
  String get adminApiKeyCreated => 'Ключът за API е създаден';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Ключът е създаден успешно. Сървърът не върна токена. Проверете ключовете за API на сървъра.';

  @override
  String get adminKeyCopied => 'Ключът е копиран в клипборда';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Ключов токен липсва в отговора на сървъра';

  @override
  String get adminRevokeApiKey => 'Отмяна на API ключ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API ключът е отменен';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Неуспешно зареждане на API ключове';

  @override
  String get adminApiKeysTitle => 'API ключове';

  @override
  String get adminCreateKey => 'Създаване на ключ';

  @override
  String get adminNoApiKeys => 'Няма намерени API ключове';

  @override
  String get adminUnknownApp => 'Неизвестно приложение';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Създава се резервно копие...';

  @override
  String get adminBackupCreated => 'Архивирането е създадено успешно';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'В отговора на сървъра липсва резервен път';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Потвърдете Възстановяване';

  @override
  String get adminRestoringBackup => 'Възстановява се резервно копие...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Неуспешно зареждане на резервни копия';

  @override
  String get adminCreateBackup => 'Създайте резервно копие';

  @override
  String get adminNoBackups => 'Няма намерени резервни копия';

  @override
  String get adminViewDetails => 'Вижте подробности';

  @override
  String get restore => 'Възстановяване';

  @override
  String get adminLogsLoadFailed =>
      'Неуспешно зареждане на регистрационни файлове на сървъра';

  @override
  String get adminNoLogFiles => 'Няма намерени регистрационни файлове';

  @override
  String get adminLogCopied => 'Дневникът е копиран в клипборда';

  @override
  String get adminSaveLogFile => 'Запазете лог файла';

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
  String get adminSearchInLog => 'Търсене в дневник';

  @override
  String get adminNoMatchingLines => 'Няма съответстващи редове';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Няма намерени планирани задачи';

  @override
  String get adminNoTasksMatchFilter =>
      'Няма задачи, които отговарят на текущия филтър';

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
  String get adminRunNow => 'Бягай сега';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Последна екзекуция';

  @override
  String get adminTriggers => 'Тригери';

  @override
  String get adminAddTrigger => 'Добавете тригер';

  @override
  String get adminNoTriggers => 'Няма конфигурирани тригери';

  @override
  String get adminTriggerType => 'Тип тригер';

  @override
  String get adminTimeLimit => 'Времево ограничение (по избор)';

  @override
  String get adminNoLimit => 'Без ограничение';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Ден от седмицата';

  @override
  String get adminSearchPlugins => 'Търсене на добавки...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Деинсталирайте приставката';

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
      'Няма плъгини, отговарящи на вашето търсене';

  @override
  String get adminNoPluginsInstalled => 'Няма инсталирани добавки';

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
      'Няма пакети, отговарящи на вашето търсене';

  @override
  String get adminNoPackagesAvailable => 'Няма налични пакети';

  @override
  String get adminExperimentalIntegration => 'Експериментална интеграция';

  @override
  String get adminExperimentalWarning =>
      'Интегрирането на настройките на приставките все още е експериментално. Някои страници с настройки може да не се визуализират правилно.';

  @override
  String get continueAction => 'Продължи';

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
      'Настройките не могат да се отворят: липсва токен за удостоверяване.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Приставката не е намерена';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Активиране на приставката';

  @override
  String get adminPluginSettingsPage => 'Страница с настройки на плъгина';

  @override
  String get adminRevisionHistory => 'История на ревизиите';

  @override
  String get adminNoChangelog => 'Няма наличен регистър на промените.';

  @override
  String get adminRemoveRepository => 'Премахване на хранилище';

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
  String get adminRepositoryNameHint => 'напр. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL адрес на хранилището';

  @override
  String get adminAddEntry => 'Добавете запис';

  @override
  String get adminInvalidUrl => 'Невалиден URL адрес';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Отворете в браузъра';

  @override
  String get adminOpenExternally => 'Отворен външно';

  @override
  String get adminGeneralSettings => 'Общи настройки';

  @override
  String get adminServerName => 'Име на сървъра';

  @override
  String get adminPreferredMetadataCountry =>
      'Предпочитана държава за метаданни';

  @override
  String get adminCachePath => 'Път на кеша';

  @override
  String get adminMetadataPath => 'Път на метаданни';

  @override
  String get adminLibraryScanConcurrency =>
      'Едновременност на сканиране на библиотека';

  @override
  String get adminParallelImageEncodingLimit =>
      'Ограничение за паралелно кодиране на изображения';

  @override
  String get adminSlowResponseThreshold => 'Праг на бавна реакция (ms)';

  @override
  String get adminBrandingSaved => 'Настройките за брандиране са запазени';

  @override
  String get adminBrandingLoadFailed =>
      'Неуспешно зареждане на настройките за брандиране';

  @override
  String get adminLoginDisclaimer => 'Отказ от отговорност при влизане';

  @override
  String get adminLoginDisclaimerHint => 'HTML, показан под формата за влизане';

  @override
  String get adminCustomCss => 'Персонализиран CSS';

  @override
  String get adminCustomCssHint =>
      'Персонализиран CSS, приложен към уеб интерфейса';

  @override
  String get adminEnableSplashScreen => 'Активиране на началния екран';

  @override
  String get adminStreamingSaved =>
      'Настройките за поточно предаване са запазени';

  @override
  String get adminStreamingLoadFailed =>
      'Неуспешно зареждане на настройките за поточно предаване';

  @override
  String get adminStreamingDescription =>
      'Задайте глобални ограничения за поточно предаване на битрейт за отдалечени връзки.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ограничение за битрейт на отдалечен клиент (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Оставете празно или 0 за неограничено';

  @override
  String get adminPlaybackSaved => 'Настройките за възпроизвеждане са запазени';

  @override
  String get adminPlaybackLoadFailed =>
      'Неуспешно зареждане на настройките за възпроизвеждане';

  @override
  String get adminPlaybackTranscoding => 'Възпроизвеждане / Транскодиране';

  @override
  String get adminHardwareAcceleration => 'Хардуерно ускорение';

  @override
  String get adminVaapiDevice => 'VA-API устройство';

  @override
  String get adminEnableHardwareEncoding => 'Активирайте хардуерното кодиране';

  @override
  String get adminEnableHardwareDecoding =>
      'Активирайте хардуерното декодиране за:';

  @override
  String get adminEncodingThreads => 'Кодиране на нишки';

  @override
  String get adminAutomatic => '0 = автоматично';

  @override
  String get adminTranscodingTempPath => 'Временен път на транскодиране';

  @override
  String get adminEnableFallbackFont => 'Активиране на резервен шрифт';

  @override
  String get adminFallbackFontPath => 'Резервен път на шрифта';

  @override
  String get adminAllowSegmentDeletion => 'Разрешете изтриването на сегмент';

  @override
  String get adminSegmentKeepSeconds => 'Запазване на сегмент (секунди)';

  @override
  String get adminThrottleBuffering => 'Буфериране на газта';

  @override
  String get adminTrickplaySaved => 'Настройките за Trickplay са запазени';

  @override
  String get adminTrickplayLoadFailed =>
      'Неуспешно зареждане на настройките за трикплей';

  @override
  String get adminEnableHardwareAcceleration =>
      'Активирайте хардуерното ускорение';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Активирайте извличането само на ключови кадри';

  @override
  String get adminKeyFrameSubtitle => 'По-бързо, но с по-ниска точност';

  @override
  String get adminScanBehavior => 'Поведение при сканиране';

  @override
  String get adminProcessPriority => 'Приоритет на процеса';

  @override
  String get adminImageSettings => 'Настройки на изображението';

  @override
  String get adminIntervalMs => 'Интервал (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Колко често да се заснемат кадри';

  @override
  String get adminWidthResolutions => 'Резолюции по ширина';

  @override
  String get adminTileWidth => 'Ширина на плочката';

  @override
  String get adminTileHeight => 'Височина на плочката';

  @override
  String get adminQualitySubtitle =>
      'По-ниски стойности = по-добро качество, по-големи файлове';

  @override
  String get adminProcessThreads => 'Обработвайте нишки';

  @override
  String get adminResumeSaved => 'Настройките за възобновяване са запазени';

  @override
  String get adminResumeLoadFailed =>
      'Неуспешно зареждане на настройките за възобновяване';

  @override
  String get adminResumeDescription =>
      'Конфигурирайте кога съдържанието трябва да бъде маркирано като частично възпроизведено или напълно възпроизведено.';

  @override
  String get adminMinResumePercentage => 'Минимален процент на резюме';

  @override
  String get adminMinResumeSubtitle =>
      'Съдържанието трябва да бъде възпроизведено над този процент, за да се запази прогресът';

  @override
  String get adminMaxResumePercentage => 'Максимален процент на резюме';

  @override
  String get adminMaxResumeSubtitle =>
      'Съдържанието се счита за напълно възпроизведено след този процент';

  @override
  String get adminMinResumeDuration =>
      'Минимална продължителност на възобновяването (секунди)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Елементите, по-кратки от това, не могат да бъдат възобновени';

  @override
  String get adminMinAudiobookResume =>
      'Минимален процент възобновяване на аудиокнига';

  @override
  String get adminMaxAudiobookResume =>
      'Максимален процент възобновяване на аудиокнига';

  @override
  String get adminNetworkingSaved =>
      'Мрежовите настройки са запазени. Може да се наложи рестартиране на сървъра.';

  @override
  String get adminNetworkingLoadFailed =>
      'Неуспешно зареждане на мрежовите настройки';

  @override
  String get adminNetworkingWarning =>
      'Промените в мрежовите настройки може да изискват рестартиране на сървъра.';

  @override
  String get adminEnableRemoteAccess => 'Активиране на отдалечен достъп';

  @override
  String get ports => 'Портове';

  @override
  String get adminHttpPort => 'HTTP порт';

  @override
  String get adminHttpsPort => 'HTTPS порт';

  @override
  String get adminPublicHttpsPort => 'Обществен HTTPS порт';

  @override
  String get adminBaseUrl => 'Основен URL адрес';

  @override
  String get adminBaseUrlHint => 'напр. / желе';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Активирайте HTTPS';

  @override
  String get adminLocalNetwork => 'Локална мрежа';

  @override
  String get adminLocalNetworkAddresses => 'Адреси на локална мрежа';

  @override
  String get adminKnownProxies => 'Известни проксита';

  @override
  String get adminRemoteIpFilter => 'Отдалечен IP филтър';

  @override
  String get adminRemoteIpFilterEntries => 'Отдалечен IP филтър';

  @override
  String get adminCertificatePath => 'Път на сертификата';

  @override
  String get whitelist => 'Бял списък';

  @override
  String get blacklist => 'Черен списък';

  @override
  String get notSet => 'Не е зададено';

  @override
  String get adminMetadataSaved => 'Метаданните са запазени';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Обновяване на метаданните';

  @override
  String get recursive => 'Рекурсивен';

  @override
  String get adminReplaceAllMetadata => 'Замяна на всички метаданни';

  @override
  String get adminReplaceAllImages => 'Заменете всички изображения';

  @override
  String get adminMetadataRefreshRequested =>
      'Поискано е опресняване на метаданни';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Търсене на отдалечено лице';

  @override
  String get adminNoRemoteMatches => 'Няма открити отдалечени съвпадения';

  @override
  String get adminRemoteResults => 'Дистанционни резултати';

  @override
  String get adminRemoteMetadataApplied => 'Приложени са отдалечени метаданни';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Актуализиране на типа съдържание';

  @override
  String get adminContentType => 'Тип съдържание';

  @override
  String get adminContentTypeUpdated => 'Актуализиран тип съдържание';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Неуспешно зареждане на редактора на метаданни';

  @override
  String get adminNoPeopleEntries => 'Без запис на хора';

  @override
  String get adminNoExternalIds => 'Няма налични външни идентификатори';

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
      'Неподдържан формат на изображението';

  @override
  String get adminImageReadFailed =>
      'Неуспешно четене на избраното изображение';

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
  String get adminAllProviders => 'Всички доставчици';

  @override
  String get adminNoRemoteImages => 'Няма намерени отдалечени изображения';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Добавете тунер';

  @override
  String get adminTunerType => 'Тип тунер';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Други';

  @override
  String get adminUrlPath => 'URL/път';

  @override
  String get adminNameOptional => 'Име (по избор)';

  @override
  String get adminTunerAdded => 'Добавен тунер';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Добавете доставчик на ръководство';

  @override
  String get adminProviderType => 'Тип доставчик';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect или XMLTV';

  @override
  String get adminUsernameOptional => 'потребителско име (по избор)';

  @override
  String get adminRefreshInterval => 'Интервал на опресняване (часове)';

  @override
  String get adminProviderAdded => 'Доставчикът е добавен';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Иска се нулиране на тунера';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Настройки за запис';

  @override
  String get adminPrePadding => 'Предварително пълнеж (минути)';

  @override
  String get adminPostPadding => 'Допълване (минути)';

  @override
  String get adminRecordingPath => 'Път на запис';

  @override
  String get adminSeriesRecordingPath => 'Път за запис на серия';

  @override
  String get adminRecordingSettingsSaved => 'Настройките за запис са запазени';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Задаване на съпоставяне на канали';

  @override
  String get adminMappingJson => 'Картографиране на JSON';

  @override
  String get adminMappingJsonHint =>
      'Пример: съпоставяне на JSON полезен товар';

  @override
  String get adminChannelMappingsUpdated =>
      'Съпоставянията на каналите са актуализирани';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Неуспешно зареждане на администрацията на телевизия на живо';

  @override
  String get adminTunerDevices => 'Тунер устройства';

  @override
  String get adminNoTunerHosts => 'Няма конфигурирани хостове за тунер';

  @override
  String get adminGuideProviders => 'Доставчици на ръководства';

  @override
  String get adminAddProvider => 'Добавяне на доставчик';

  @override
  String get adminNoListingProviders =>
      'Няма конфигурирани доставчици на обяви';

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
  String get adminTunerDiscovery => 'Откриване на тунер';

  @override
  String get adminChannelMappings => 'Картографиране на канали';

  @override
  String get adminNoDiscoveredTuners => 'Все още няма открити тунери';

  @override
  String get adminSettingsSaved => 'Настройките са запазени';

  @override
  String get adminBackupsNotAvailable =>
      'Резервните копия не са налични на тази сървърна компилация.';

  @override
  String get adminRestoreWarning1 =>
      'Възстановяването ще замени ВСИЧКИ текущи данни на сървъра с резервните данни.';

  @override
  String get adminRestoreWarning2 =>
      'Текущите настройки на сървъра, потребителите и библиотечните данни ще бъдат презаписани.';

  @override
  String get adminRestoreWarning3 =>
      'Сървърът ще се рестартира след възстановяване.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Поискано е възстановяване. Рестартирането на сървъра може да прекъсне тази сесия.';

  @override
  String get adminBackupsTitle => 'Архивиране';

  @override
  String get adminUnknownDate => 'Неизвестна дата';

  @override
  String get adminUnnamedBackup => 'Резервно копие без име';

  @override
  String get adminLiveTvNotAvailable =>
      'Администрирането на телевизия на живо не е налично на тази сървърна компилация.';

  @override
  String get adminLiveTvTitle => 'Администрация на телевизия на живо';

  @override
  String get adminApply => 'Кандидатствайте';

  @override
  String get adminNotSet => 'Не е зададено';

  @override
  String get adminReset => 'Нулиране';

  @override
  String get adminLogsTitle => 'Сървърни регистрационни файлове';

  @override
  String get adminLogsNewestFirst => 'Първо най-новите';

  @override
  String get adminLogsOldestFirst => 'Първо най-старите';

  @override
  String get adminLogsJustNow => 'Току-що';

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
  String get adminLogViewerNoMatches => 'Няма съответстващи редове';

  @override
  String get adminMetadataEditorTitle => 'Редактор на метаданни';

  @override
  String get adminMetadataRemote => 'Дистанционно';

  @override
  String get adminMetadataType => 'Тип';

  @override
  String get adminMetadataDetails => 'Подробности';

  @override
  String get adminMetadataExternalIds => 'Външни идентификатори';

  @override
  String get adminMetadataImages => 'Изображения';

  @override
  String get adminMetadataFieldTitle => 'Заглавие';

  @override
  String get adminMetadataFieldSortTitle => 'Сортиране на заглавие';

  @override
  String get adminMetadataFieldOriginalTitle => 'Оригинално заглавие';

  @override
  String get adminMetadataFieldPremiereDate => 'Премиерна дата (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldEndDate => 'Крайна дата (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldProductionYear => 'Година на производство';

  @override
  String get adminMetadataFieldOfficialRating => 'Официален рейтинг';

  @override
  String get adminMetadataFieldCommunityRating => 'Рейтинг на общността';

  @override
  String get adminMetadataFieldCriticRating => 'Критичен рейтинг';

  @override
  String get adminMetadataFieldTagline => 'Слоган';

  @override
  String get adminMetadataFieldOverview => 'Преглед';

  @override
  String get adminMetadataGenres => 'Жанрове';

  @override
  String get adminMetadataTags => 'Етикети';

  @override
  String get adminMetadataStudios => 'Студия';

  @override
  String get adminMetadataPeople => 'хора';

  @override
  String get adminMetadataAddGenre => 'Добавяне на жанр';

  @override
  String get adminMetadataAddTag => 'Добавете етикет';

  @override
  String get adminMetadataAddStudio => 'Добавете студио';

  @override
  String get adminMetadataAddPerson => 'Добавяне на човек';

  @override
  String get adminMetadataEditPerson => 'Редактиране на човек';

  @override
  String get adminMetadataRole => 'Роля';

  @override
  String get adminMetadataImagePrimary => 'Първичен';

  @override
  String get adminMetadataImageBackdrop => 'фон';

  @override
  String get adminMetadataImageLogo => 'Лого';

  @override
  String get adminMetadataImageBanner => 'Банер';

  @override
  String get adminMetadataImageThumb => 'Палец';

  @override
  String get adminMetadataRecursive => 'Рекурсивен';

  @override
  String get adminMetadataProvider => 'Доставчик';

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
      'Неуспешно четене на избраното изображение';

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
      'Това премахва текущото изображение от елемента.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Качване';

  @override
  String get adminMetadataUpdate => 'Актуализация';

  @override
  String get adminMetadataRemoteImage => 'Дистанционно изображение';

  @override
  String get adminPluginsInstalled => 'Инсталиран';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Активен';

  @override
  String get adminPluginsRestart => 'Рестартирайте';

  @override
  String get adminPluginsNoSearchResults =>
      'Няма плъгини, отговарящи на вашето търсене';

  @override
  String get adminPluginsNoneInstalled => 'Няма инсталирани добавки';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Налична актуализация';

  @override
  String get adminPluginsPendingRemoval =>
      'Очаква премахване след рестартиране';

  @override
  String get adminPluginsChangesPending => 'Промени в очакване на рестартиране';

  @override
  String get adminPluginsEnable => 'Активиране';

  @override
  String get adminPluginsDisable => 'Деактивиране';

  @override
  String get adminPluginsInstallUpdate => 'Инсталирайте актуализация';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Няма пакети, отговарящи на вашето търсене';

  @override
  String get adminPluginsCatalogEmpty => 'Няма налични пакети';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Експериментална интеграция';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Интегрирането на настройките на приставките все още е експериментално. Някои полета или оформления може все още да не се визуализират правилно.';

  @override
  String get adminPluginDetailToggle404 =>
      'Неуспешно превключване на приставката. Сървърът не можа да намери тази версия на приставката. Опитайте да опресните приставките, след което опитайте отново.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Неуспешно превключване на приставката. Моля, проверете регистрационните файлове на сървъра за подробности.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Подробности';

  @override
  String get adminPluginDetailDeveloper => 'Разработчик';

  @override
  String get adminPluginDetailRepository => 'Хранилище';

  @override
  String get adminPluginDetailBundled => 'В пакет';

  @override
  String get adminPluginDetailEnablePlugin => 'Активиране на приставката';

  @override
  String get adminPluginDetailRestartRequired =>
      'Необходимо е рестартиране на сървъра, за да влязат в сила промените.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Този плъгин ще бъде премахнат след рестартиране на сървъра.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Този плъгин работи неправилно и може да не работи правилно.';

  @override
  String get adminPluginDetailNotSupported =>
      'Този плъгин не се поддържа от текущата версия на сървъра.';

  @override
  String get adminPluginDetailSuperseded =>
      'Този плъгин е заменен от по-нова версия.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Премахване на хранилище';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Премахнете';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Няма конфигурирани хранилища';

  @override
  String get adminReposEmptySubtitle =>
      'Добавете хранилище, за да разглеждате наличните добавки';

  @override
  String get adminReposUnnamed => '(неназован)';

  @override
  String get adminReposEditTitle => 'Редактиране на хранилище';

  @override
  String get adminReposAddTitle => 'Добавяне на хранилище';

  @override
  String get adminReposUrl => 'URL адрес на хранилището';

  @override
  String get adminReposNameHint => 'напр. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Невалиден URL адрес';

  @override
  String get adminGeneralSettingsTitle => 'Общи настройки';

  @override
  String get adminGeneralMetadataLanguage => 'Предпочитан език за метаданни';

  @override
  String get adminGeneralMetadataLanguageHint => 'напр. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Предпочитана държава за метаданни';

  @override
  String get adminGeneralMetadataCountryHint => 'напр. САЩ, Германия, Франция';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Едновременност на сканиране на библиотека';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Ограничение за паралелно кодиране на изображения';

  @override
  String get adminUnknownError => 'Неизвестна грешка';

  @override
  String get adminBrowse => 'Прегледайте';

  @override
  String get adminCloseBrowser => 'Затворете браузъра';

  @override
  String get adminNetworkingTitle => 'Работа в мрежа';

  @override
  String get adminNetworkingRestartWarning =>
      'Промените в мрежовите настройки може да изискват рестартиране на сървъра.';

  @override
  String get adminNetworkingRemoteAccess => 'Активиране на отдалечен достъп';

  @override
  String get adminNetworkingPorts => 'Портове';

  @override
  String get adminNetworkingHttpPort => 'HTTP порт';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS порт';

  @override
  String get adminNetworkingEnableHttps => 'Активирайте HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Локална мрежа';

  @override
  String get adminNetworkingLocalAddresses => 'Адреси на локална мрежа';

  @override
  String get adminNetworkingAddressHint => 'напр. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Известни проксита';

  @override
  String get adminNetworkingProxyHint => 'напр. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Бял списък';

  @override
  String get adminNetworkingBlacklist => 'Черен списък';

  @override
  String get adminNetworkingAddEntry => 'Добавете запис';

  @override
  String get adminBrandingTitle => 'Брандиране';

  @override
  String get adminBrandingLoginDisclaimer => 'Отказ от отговорност при влизане';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML, показан под формата за влизане';

  @override
  String get adminBrandingCustomCss => 'Персонализиран CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Персонализиран CSS, приложен към уеб интерфейса';

  @override
  String get adminBrandingEnableSplash => 'Активиране на началния екран';

  @override
  String get adminPlaybackHwAccel => 'Хардуерно ускорение';

  @override
  String get adminPlaybackHwAccelLabel => 'Хардуерно ускорение';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Активирайте хардуерното кодиране';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Активирайте хардуерното декодиране за:';

  @override
  String get adminPlaybackEncoding => 'Кодиране';

  @override
  String get adminPlaybackEncodingThreads => 'Кодиране на нишки';

  @override
  String get adminPlaybackFallbackFont => 'Активиране на резервен шрифт';

  @override
  String get adminPlaybackFallbackFontPath => 'Резервен път на шрифта';

  @override
  String get adminPlaybackStreaming => 'Поточно предаване';

  @override
  String get adminResumeVideo => 'видео';

  @override
  String get adminResumeAudiobooks => 'Аудиокниги';

  @override
  String get adminResumeMinAudiobookPct =>
      'Минимален процент възобновяване на аудиокнига';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Максимален процент възобновяване на аудиокнига';

  @override
  String get adminStreamingBitrateLimit =>
      'Ограничение за битрейт на отдалечен клиент (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Оставете празно или 0 за неограничено';

  @override
  String get adminTrickplayHwAccel => 'Активирайте хардуерното ускорение';

  @override
  String get adminTrickplayHwEncoding => 'Активирайте хардуерното кодиране';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Активирайте извличането само на ключови кадри';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'По-бързо, но с по-ниска точност';

  @override
  String get adminTrickplayNonBlocking => 'Неблокиращ';

  @override
  String get adminTrickplayBlocking => 'Блокиране';

  @override
  String get adminTrickplayPriorityHigh => 'високо';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Над нормалното';

  @override
  String get adminTrickplayPriorityNormal => 'нормално';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Под нормалното';

  @override
  String get adminTrickplayPriorityIdle => 'празен ход';

  @override
  String get adminTrickplayImageSettings => 'Настройки на изображението';

  @override
  String get adminTrickplayInterval => 'Интервал (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Колко често да се заснемат кадри';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Ширини на пиксели, разделени със запетаи (напр. 320)';

  @override
  String get adminTrickplayQuality => 'качество';

  @override
  String get adminTrickplayQScale => 'Качествена скала';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'По-ниски стойности = по-добро качество, по-големи файлове';

  @override
  String get adminTrickplayJpegQuality => 'JPEG качество';

  @override
  String get adminTrickplayProcessing => 'Обработка';

  @override
  String get adminTasksEmpty => 'Няма намерени планирани задачи';

  @override
  String get adminTasksNoFilterMatch =>
      'Няма задачи, които отговарят на текущия филтър';

  @override
  String get adminTaskCancelling => 'Отменя се...';

  @override
  String get adminTaskRunning => 'Работи...';

  @override
  String get adminTaskNeverRun => 'Никога не бягайте';

  @override
  String get adminTaskStop => 'Спрете';

  @override
  String get adminTaskRun => 'Бягай';

  @override
  String get adminTaskDetailLastExecution => 'Последна екзекуция';

  @override
  String get adminTaskDetailStarted => 'започна';

  @override
  String get adminTaskDetailEnded => 'Приключи';

  @override
  String get adminTaskDetailDuration => 'Продължителност';

  @override
  String get adminTaskDetailErrorLabel => 'грешка:';

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
  String get adminTaskTriggerStartup => 'При стартиране на приложението';

  @override
  String get adminTaskTriggerTypeDaily => 'Ежедневно';

  @override
  String get adminTaskTriggerTypeWeekly => 'Ежеседмично';

  @override
  String get adminTaskTriggerTypeInterval => 'На интервал';

  @override
  String get adminTaskTriggerIntervalLabel => 'Интервал';

  @override
  String get adminTaskTriggerEveryHour => 'Всеки час';

  @override
  String get adminTaskTriggerEvery6Hours => 'На всеки 6 часа';

  @override
  String get adminTaskTriggerEvery12Hours => 'На всеки 12 часа';

  @override
  String get adminTaskTriggerEvery24Hours => 'На всеки 24 часа';

  @override
  String get adminTaskTriggerEvery2Days => 'На всеки 2 дни';

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
  String get adminTaskTriggerTime => 'време';

  @override
  String get adminTaskTriggerNoLimit => 'Без ограничение';

  @override
  String get adminActivityJustNow => 'Току-що';

  @override
  String get adminActivityLastHour => 'Последен час';

  @override
  String get adminActivityToday => 'Днес';

  @override
  String get adminActivityYesterday => 'Вчера';

  @override
  String get adminActivityOlder => 'По-стари';

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
  String get adminActivityNow => 'сега';

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
      'Конфигурирайте генериране на трикплей изображения за миниатюри за преглед при търсене.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Обществен HTTPS порт';

  @override
  String get adminNetworkingBaseUrl => 'Основен URL адрес';

  @override
  String get adminNetworkingBaseUrlHint => 'напр. / желе';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Път на сертификата';

  @override
  String get adminNetworkingRemoteIpFilter => 'Отдалечен IP филтър';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Отдалечен IP филтър';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API устройство';

  @override
  String get adminPlaybackAutomatic => '0 = автоматично';

  @override
  String get adminPlaybackTranscodeTempPath => 'Временен път на транскодиране';

  @override
  String get adminPlaybackSegmentDeletion => 'Разрешете изтриването на сегмент';

  @override
  String get adminPlaybackSegmentKeep => 'Запазване на сегмент (секунди)';

  @override
  String get adminPlaybackThrottleBuffering => 'Буфериране на газта';

  @override
  String get adminResumeMinPct => 'Минимален процент на резюме';

  @override
  String get adminResumeMinPctSubtitle =>
      'Съдържанието трябва да бъде възпроизведено над този процент, за да се запази прогресът';

  @override
  String get adminResumeMaxPct => 'Максимален процент на резюме';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Съдържанието се счита за напълно възпроизведено след този процент';

  @override
  String get adminResumeMinDuration =>
      'Минимална продължителност на възобновяването (секунди)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Елементите, по-кратки от това, не могат да бъдат възобновени';

  @override
  String get adminTrickplayScanBehavior => 'Поведение при сканиране';

  @override
  String get adminTrickplayProcessPriority => 'Приоритет на процеса';

  @override
  String get adminTrickplayTileWidth => 'Ширина на плочката';

  @override
  String get adminTrickplayTileHeight => 'Височина на плочката';

  @override
  String get adminTrickplayProcessThreads => 'Обработвайте нишки';

  @override
  String get adminTrickplayWidthResolutions => 'Резолюции по ширина';

  @override
  String get adminMetadataDefault => 'По подразбиране';

  @override
  String get adminMetadataContentTypeUpdated => 'Актуализиран тип съдържание';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Праг на бавна реакция (ms)';

  @override
  String get adminGeneralCachePath => 'Път на кеша';

  @override
  String get adminGeneralMetadataPath => 'Път на метаданни';

  @override
  String get adminGeneralServerName => 'Име на сървъра';

  @override
  String get adminSettingsLoadFailed => 'Неуспешно зареждане на настройките';

  @override
  String get adminDiscover => 'Открийте';

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
  String get libraries => 'библиотеки';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay е деактивиран';

  @override
  String get syncPlayDisabledMessage =>
      'Активирайте SyncPlay в Настройки, за да използвате синхронизирано възпроизвеждане.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сървърът не се поддържа';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay изисква Jellyfin сървър. Текущият сървър не го поддържа.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay група';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay група';

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
  String get syncPlayIgnoreWait => 'Игнорирайте чакането';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Не задържайте групата, докато това устройство буферира';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Продължете локално, без да чакате бавни членове';

  @override
  String get syncPlayRepeat => 'Повторете';

  @override
  String get syncPlayRepeatOne => 'един';

  @override
  String get syncPlayShuffleModeShuffled => 'Разбъркано';

  @override
  String get syncPlayShuffleModeSorted => 'Сортирани';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Синхронизиране на текущата опашка за възпроизвеждане';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Заменете груповата опашка с това, което се възпроизвежда локално';

  @override
  String get syncPlayLeaveGroup => 'Напускане на групата';

  @override
  String get syncPlayGroupQueue => 'Групова опашка';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Играйте сега';

  @override
  String get syncPlayCreateNewGroup => 'Създайте нова група';

  @override
  String get syncPlayGroupName => 'Име на групата';

  @override
  String get syncPlayDefaultGroupName => 'Моята SyncPlay група';

  @override
  String get syncPlayCreateGroup => 'Създайте група';

  @override
  String get syncPlayAvailableGroups => 'Налични групи';

  @override
  String get syncPlayNoGroupsAvailable => 'Няма налични групи';

  @override
  String get syncPlayJoinGroupQuestion => 'Присъединяване към SyncPlay група?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Присъединяването към група SyncPlay може да замени текущата ви опашка за възпроизвеждане. Продължаване?';

  @override
  String get syncPlayJoin => 'Присъединете се';

  @override
  String get syncPlayStateIdle => 'празен ход';

  @override
  String get syncPlayStateWaiting => 'Чакане';

  @override
  String get syncPlayStatePaused => 'На пауза';

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
  String get syncPlayAccessDeniedTitle => 'Достъпът до SyncPlay е отказан';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Нямате достъп до един или повече елементи в тази група SyncPlay. Помолете собственика на групата да потвърди разрешенията на библиотеката или да изберете друга опашка.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Гласовото търсене не е налично.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Неуспешно възпроизвеждане на Dolby Vision Direct';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Директното възпроизвеждане не успя да започне за този поток Dolby Vision. Повторен опит с прекодиране на сървъра?';

  @override
  String get retryWithTranscode => 'Опитайте отново с прекодиране';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision не се поддържа';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Това устройство не може да декодира директно Dolby Vision съдържание. Използвайте резервен HDR10 или заявете прекодиране на сървъра.';

  @override
  String get rememberMyChoice => 'Запомни моя избор';

  @override
  String get playHdr10Fallback => 'Възпроизвеждане на резервен HDR10';

  @override
  String get requestTranscode => 'Заявка за прекодиране';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Откриване на редове, изложени от плъгина „Секции на началния екран“ на IAmParadox27. Редовете могат да бъдат активирани и пренаредени по-долу.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Все още няма сървъри на Jellyfin, които да докладват плъгина.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Откриване на редове, конфигурирани чрез плъгина „KefinTweaks“ на ranaldsgift. Персонализирани секции, наскоро пуснати, гледайте отново, сезонни и наскоро добавени в библиотеката се отразяват от конфигурацията на KefinTweaks на всеки сървър Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Все още няма сървъри на Jellyfin, съобщаващи за KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Отворете началните секции';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Активирайте, деактивирайте и пренаредете редовете';

  @override
  String get integrationInstalledButDisabled => 'Инсталиран, но деактивиран';

  @override
  String get integrationNotInstalled => 'Не е инсталиран';

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
  String get seeAll => 'Вижте всички';

  @override
  String get noItems => 'Няма елементи';

  @override
  String get switchUser => 'Превключване на потребител';

  @override
  String get remoteControl => 'Дистанционно управление';

  @override
  String get mediaBarLoading => 'Медийната лента се зарежда...';

  @override
  String get mediaBarError => 'Медийната лента не успя да се зареди';

  @override
  String get offlineServerUnavailable =>
      'Свързан с интернет, но текущият сървър е недостъпен.';

  @override
  String get offlineNoInternet =>
      'Вие сте офлайн. Налично е само изтеглено съдържание.';

  @override
  String get offlineFileNotAvailable => 'Файлът не е наличен';

  @override
  String get offlineSwitchServer => 'Превключване на сървър';

  @override
  String get offlineSavedMedia => 'Запазени медии';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Дистанционно възпроизвеждане';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Сила на звука на устройството';

  @override
  String get castVolumeUnavailable => 'Недостъпен';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'аудио';

  @override
  String get subtitlesLabel => 'субтитри';

  @override
  String get pinConfirmTitle => 'Потвърдете PIN';

  @override
  String get pinSetTitle => 'Задайте PIN';

  @override
  String get pinEnterTitle => 'Въведете PIN';

  @override
  String get pinReenterToConfirm => 'Въведете отново своя ПИН за потвърждение';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Неправилен ПИН';

  @override
  String get pinMismatch => 'ПИН кодовете не съвпадат';

  @override
  String get pinForgot => 'Забравен ПИН?';

  @override
  String get pinClear => 'ясно';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Заявката за бързо свързване е разрешена.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Кодът за бързо свързване е невалиден или изтекъл.';

  @override
  String get quickConnectNotSupported =>
      'Бързото свързване не се поддържа на този сървър.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Неуспешно оторизиране на кода за бързо свързване.';

  @override
  String get quickConnectDisabled =>
      'Бързото свързване е деактивирано на този сървър.';

  @override
  String get quickConnectForbidden =>
      'Вашият акаунт не може да разреши тази заявка за бързо свързване.';

  @override
  String get quickConnectNotFound =>
      'Кодът за бързо свързване не беше намерен. Опитайте нов код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Въведете код';

  @override
  String get quickConnectAuthorize => 'Упълномощаване';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Дистанционно управление';

  @override
  String get remoteFailedToLoadSessions => 'Неуспешно зареждане на сесии';

  @override
  String get remoteNoSessions => 'Няма контролируеми сесии';

  @override
  String get remoteStartPlayback =>
      'Стартирайте възпроизвеждането на друго устройство';

  @override
  String get unknownUser => 'Неизвестен';

  @override
  String get unknownItem => 'Неизвестен';

  @override
  String get remoteNothingPlaying => 'Нищо не се играе в тази сесия';

  @override
  String get castingStarted => 'Предаването започна на избраното устройство';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Няма налични устройства за отдалечено възпроизвеждане.';

  @override
  String get noRemoteDevicesIos =>
      'Няма налични устройства за отдалечено възпроизвеждане.\n\nВ iOS целите на AirPlay може да не са налични в симулатора.';

  @override
  String get trackActionPlayNext => 'Възпроизвеждане Следващ';

  @override
  String get trackActionAddToQueue => 'Добавяне към опашката';

  @override
  String get trackActionAddToPlaylist => 'Добавяне към плейлист';

  @override
  String get trackActionCancelDownload => 'Отказ от изтеглянето';

  @override
  String get trackActionDeleteFromPlaylist => 'Изтриване от плейлиста';

  @override
  String get trackActionMoveUp => 'Преместване нагоре';

  @override
  String get trackActionMoveDown => 'Преместване надолу';

  @override
  String get trackActionRemoveFromFavorites => 'Премахване от любими';

  @override
  String get trackActionAddToFavorites => 'Добавяне към любими';

  @override
  String get trackActionGoToAlbum => 'Отидете на Албум';

  @override
  String get trackActionGoToArtist => 'Отидете на Художник';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Изтегленият файл е изтрит';

  @override
  String get trackActionDeleteFileFailed =>
      'Неуспешно изтриване на изтегления файл';

  @override
  String get shuffleBy => 'Разбъркване по';

  @override
  String get shuffleSelectLibrary => 'Изберете Библиотека';

  @override
  String get shuffleSelectGenre => 'Изберете Жанр';

  @override
  String get shuffleLibrary => 'Библиотека';

  @override
  String get shuffleGenre => 'Жанр';

  @override
  String get shuffleNoLibraries => 'Няма налични съвместими библиотеки.';

  @override
  String get shuffleNoGenres =>
      'Няма намерени жанрове за този режим на разбъркване.';

  @override
  String get posterDisplayTitle => 'Дисплей';

  @override
  String get posterImageType => 'Тип изображение';

  @override
  String get imageTypePoster => 'Плакат';

  @override
  String get imageTypeThumbnail => 'Миниатюра';

  @override
  String get imageTypeBanner => 'Банер';

  @override
  String get playlistAddFailed => 'Неуспешно добавяне към плейлиста';

  @override
  String get playlistCreateFailed => 'Неуспешно създаване на плейлист';

  @override
  String get playlistNew => 'Нов плейлист';

  @override
  String get playlistCreate => 'Създавайте';

  @override
  String get playlistCreateNew => 'Създайте нов плейлист';

  @override
  String get playlistNoneFound => 'Няма намерени плейлисти';

  @override
  String get addToPlaylist => 'Добавяне към плейлист';

  @override
  String get lyricsNotAvailable => 'Няма налични текстове';

  @override
  String get upNext => 'Следва';

  @override
  String get playNext => 'Възпроизвеждане Следващ';

  @override
  String get stillWatchingContent =>
      'Възпроизвеждането е поставено на пауза. Гледате ли още?';

  @override
  String get stillWatchingStop => 'Спрете';

  @override
  String get stillWatchingContinue => 'Продължи';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Телевизия на живо';

  @override
  String get continueWatchingAndNextUp =>
      'Продължаване на гледането и следващо';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Следващ епизод';

  @override
  String get moreFromThisSeason => 'Още от този сезон';

  @override
  String get playerTooltipPlaybackSpeed => 'Скорост на възпроизвеждане';

  @override
  String get playerTooltipCastControls => 'Контроли за предаване';

  @override
  String get playerTooltipPlaybackQuality => 'Скорост на предаване';

  @override
  String get playerTooltipEnterFullscreen => 'Въведете цял екран';

  @override
  String get playerTooltipExitFullscreen => 'Изход от цял ​​екран';

  @override
  String get playerTooltipFloatOnTop => 'Поплавък отгоре';

  @override
  String get playerTooltipExitFloatOnTop => 'Деактивирайте плуването отгоре';

  @override
  String get playerTooltipLockLandscape => 'Заключи пейзаж';

  @override
  String get playerTooltipUnlockOrientation => 'Разрешете въртене';

  @override
  String get playerTooltipPrevious => 'Предишен';

  @override
  String get playerTooltipSeekBack => 'Търсене назад';

  @override
  String get playerTooltipSeekForward => 'Търсене напред';

  @override
  String get contextMenuMarkWatched => 'Маркирайте като гледани';

  @override
  String get contextMenuMarkUnwatched => 'Маркирайте като ненаблюдаван';

  @override
  String get contextMenuAddToFavorites => 'Добавяне към любими';

  @override
  String get contextMenuRemoveFromFavorites => 'Премахване от любими';

  @override
  String get contextMenuGoToSeries => 'Отидете на Серия';

  @override
  String get settingsAdministrationSubtitle =>
      'Влезте в административния панел на сървъра';

  @override
  String get settingsAccountSecurity => 'Акаунт и сигурност';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Удостоверяване, ПИН код и родителски контрол';

  @override
  String get settingsPersonalization => 'Персонализиране';

  @override
  String get settingsPersonalizationSubtitle =>
      'Тема, навигация, начални редове и видимост на библиотеката';

  @override
  String get settingsDynamicContent => 'Динамично съдържание';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медийна лента и визуални наслагвания';

  @override
  String get settingsPlaybackSyncplay => 'Възпроизвеждане и SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Аудио/видео настройки, субтитри, изтегляния и контроли на SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Синхронизиране на приставки, Seerr, оценки и др';

  @override
  String get settingsAboutSubtitle =>
      'Версия на приложението, правна информация и кредити';

  @override
  String get settingsAuthenticationSection => 'УДОСТОВЕРЯВАНЕ';

  @override
  String get settingsSortServersBy => 'Сортиране на сървъри по';

  @override
  String get settingsLastUsed => 'Последно използвано';

  @override
  String get settingsAlphabetical => 'Азбучен ред';

  @override
  String get settingsPrivacyAndSafetySection => 'ПОВЕРИТЕЛНОСТ И БЕЗОПАСНОСТ';

  @override
  String get settingsBlockedRatings => 'Блокирани оценки';

  @override
  String get settingsGeneralStyle => 'Общ стил';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Тематични акценти, фонове, наблюдавани индикатори и тематична музика';

  @override
  String get settingsHomePage => 'Начална страница';

  @override
  String get settingsHomePageSubtitle =>
      'Секции, типове изображения, наслагвания и визуализации на медии';

  @override
  String get settingsLibrariesSubtitle =>
      'Видимост на библиотеката, изглед на папка и поведение на няколко сървъра';

  @override
  String get settingsTwentyFourHourClock => '24-часов часовник';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Използвайте 24-часово форматиране на времето навсякъде, където се показва часовникът';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Показване на бутона за разбъркване в лентата за навигация';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Показване на бутона за жанрове в лентата за навигация';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Показване на бутона за любими в лентата за навигация';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Показване на бутона за библиотеки в лентата за навигация';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Превключване на видимостта на началната страница за библиотека. Рестартирайте Moonfin, за да влязат в сила промените.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Медийна лента и локални визуализации';

  @override
  String get settingsVisualOverlays => 'Визуални наслагвания';

  @override
  String get settingsSeasonalSurprise => 'Сезонна изненада';

  @override
  String get settingsMetadataAndRatings => 'Метаданни и оценки';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase поддържа интеграции от страна на сървъра, включително допълнителни източници на оценка, Seerr заявки и синхронизирани предпочитания.';

  @override
  String get settingsOfflineDownloads => 'Офлайн изтегляния';

  @override
  String get settingsHigh => 'високо';

  @override
  String get settingsLow => 'ниско';

  @override
  String get settingsCustomPath => 'Персонализиран път';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Въведете пътя на папката за изтегляне';

  @override
  String get settingsConcurrentDownloads => 'Едновременни изтегляния';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Максимален брой елементи за изтегляне наведнъж.';

  @override
  String get settingsAppInfo => 'ИНФОРМАЦИЯ ЗА ПРИЛОЖЕНИЕТО';

  @override
  String get settingsReportAnIssue => 'Докладвайте за проблем';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Отворете програмата за проследяване на проблеми в GitHub';

  @override
  String get settingsJoinDiscord => 'Присъединете се към Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Разговаряйте с общността';

  @override
  String get settingsJoinTheDiscord => 'Присъединете се към Discord';

  @override
  String get settingsSupportMoonfin => 'Подкрепете Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Означете проекта със звезда в GitHub или допринесете';

  @override
  String get settingsLegal => 'ЗАКОННО';

  @override
  String get settingsLicenses => 'Лицензи';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Бележки за лиценз с отворен код';

  @override
  String get settingsPrivacyPolicy => 'Политика за поверителност';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Как Moonfin обработва вашите данни';

  @override
  String get settingsCheckForUpdates => 'Проверете за актуализации';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Проверете за най-новата версия на Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Осъществено от Flutter';

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
  String get settingsBoth => 'И двете';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Филтър за тип съдържание за разбъркване';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Предпочитания за възпроизвеждане на видео';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Основен видео двигател и настройки за качество на поточно предаване';

  @override
  String get settingsAudioPreferences => 'Аудио предпочитания';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аудио записи, обработка и опции за преминаване';

  @override
  String get settingsAutomationAndQueue => 'Автоматизация и опашка';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматизирано възпроизвеждане и секвениране';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Качество на изтегляне, ограничения за съхранение и размер на опашката';

  @override
  String get settingsSyncplaySubtitle =>
      'Синхронизираща логика за групови сесии';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Специализирани функции на играча. Използвайте с повишено внимание, тъй като някои опции могат да причинят проблеми с възпроизвеждането';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Пропускане на въведения и изключения?';

  @override
  String get settingsPromptUser => 'Подкана на потребител';

  @override
  String get settingsSkip => 'Пропускане';

  @override
  String get settingsDoNothing => 'Не правете нищо';

  @override
  String get settingsMaxBitrateDescription =>
      'Ограничете битрейта на стрийминг. Съдържанието над този праг ще бъде прекодирано, за да се побере.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ограничете максималната разделителна способност, която играчът ще поиска. Съдържанието с по-висока разделителна способност ще бъде транскодирано надолу.';

  @override
  String get settingsPlayerZoomDescription =>
      'Как видеото трябва да бъде мащабирано, за да пасне на екрана.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Механизъм за възпроизвеждане (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Изберете машината за възпроизвеждане по подразбиране на устройства с Android TV. Промените се прилагат към следващата сесия на възпроизвеждане.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (препоръчително)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (наследство)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Резервен Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Поведение за Dolby Vision заглавия на устройства без Dolby Vision декодиране.';

  @override
  String get settingsAskEachTime => 'Питай всеки път';

  @override
  String get settingsPreferHdr10Fallback =>
      'Предпочитайте HDR10 резервен вариант';

  @override
  String get settingsPreferServerTranscode =>
      'Предпочитам прекодиране на сървъра';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Профил 7 Директна игра';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Контролира дали потоците от слой за подобрение на профил 7 на Dolby Vision трябва да насочват възпроизвеждането.';

  @override
  String get settingsAutoAftkrtEnabled => 'Автоматично (активиран AFTKRT)';

  @override
  String get settingsEnabledOnThisDevice => 'Активирано на това устройство';

  @override
  String get settingsDisabledPreferTranscode =>
      'Деактивиран (предпочитам прекодиране)';

  @override
  String get settingsResumeRewindDescription =>
      'При възобновяване на възпроизвеждането (от Продължаване на гледането или страница с медиен елемент), колко секунди трябва да се превъртят?';

  @override
  String get settingsUnpauseRewindDescription =>
      'При възобновяване на възпроизвеждането след натискане на бутона за пауза колко секунди трябва да се превъртят?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Колко секунди да се върнете назад след натискане на бутона за превъртане назад.';

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
      'Колко секунди да прескочите напред след натискане на бутона за бързо превъртане напред.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 към външен декодер';

  @override
  String get settingsCinemaMode => 'Режим Кино';

  @override
  String get settingsCinemaModeSubtitle =>
      'Пуснете трейлъри/предварителни видеоклипове преди основна функция';

  @override
  String get settingsNextUpDisplayDescription =>
      'Разширеното показва пълна карта с обложка и описание на епизода. Minimal показва компактно наслагване за обратно броене. Disabled скрива подканата изцяло.';

  @override
  String get settingsShort => 'Кратко';

  @override
  String get settingsLong => 'Дълги';

  @override
  String get settingsVeryLong => 'Много дълго';

  @override
  String get settingsVideoStartDelay => 'Забавяне на стартиране на видео';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Директна телевизия на живо';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Активирайте директно възпроизвеждане за телевизия на живо';

  @override
  String get settingsOpenGroups => 'Отворете Групи';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Създавайте, присъединявайте се или управлявайте SyncPlay групи';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay е активиран';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Активирайте функциите за групово гледане';

  @override
  String get settingsSyncplayButton => 'Бутон SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Показване на бутона SyncPlay на лентата за навигация';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Разширена корекция';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Активиране на фина синхронизираща логика';

  @override
  String get settingsSyncplaySyncCorrection => 'Синхронизирана корекция';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Автоматично регулирайте възпроизвеждането, за да останете в синхрон';

  @override
  String get settingsSyncplaySpeedToSync => 'Скорост на синхронизиране';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Използвайте настройка на скоростта на възпроизвеждане за синхронизиране';

  @override
  String get settingsSyncplaySkipToSync => 'Преминете към синхронизиране';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Използвайте търсене за синхронизиране';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Минимално забавяне на скоростта';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Максимално забавяне на скоростта';

  @override
  String get settingsSyncplaySpeedDuration => 'Продължителност на скоростта';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Минимално забавяне при пропускане';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay допълнително отместване';

  @override
  String get onNow => 'Включено сега';

  @override
  String get collections => 'Колекции';

  @override
  String get lastPlayed => 'Последно играно';

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
