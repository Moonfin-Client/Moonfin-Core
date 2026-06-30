// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get appTitle => 'Месечината';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'Пријавете се';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Брзо поврзување';

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
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Кој гледа?';

  @override
  String get addUser => 'Додај корисник';

  @override
  String get selectServer => 'Изберете Сервер';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
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
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Moonfin is the classic layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Moonfin';

  @override
  String get detailScreenStyleModern => 'Modern';

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
  String get settingsAppearanceThemeSubtitle =>
      'Префрлете се помеѓу Moonfin и Neon Pulse без да ја рестартирате апликацијата';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Месечината';

  @override
  String get themeMoonfinSubtitle =>
      'Моменталниот изглед на Moonfin што сите сте го засакале';

  @override
  String get themeNeonPulse => 'Неонски пулс';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave стајлинг со магента сјај, цијан текст и посилен хромиран контраст';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Излезете од Moonfin?';

  @override
  String get exitAppConfirmation => 'Дали сте сигурни дека сакате да излезете?';

  @override
  String get exit => 'Излезете';

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
  String get home => 'Дома';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Оваа папка е празна';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
    return '$name — Genres';
  }

  @override
  String get views => 'Прегледи';

  @override
  String get albums => 'Албуми';

  @override
  String get albumArtists => 'Изведувачи на албуми';

  @override
  String get artists => 'Уметници';

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
  String get discoverySubjects => 'Предмети за откривање';

  @override
  String get pickDiscoverySubjects =>
      'Изберете која тема ќе се прикаже во Discover.';

  @override
  String get apply => 'Пријавете се';

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
    return '$count titles';
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
  String get readyWhenYouAre => 'Подготвени кога сте';

  @override
  String get details => 'Детали';

  @override
  String get listeningRoom => 'Соба за слушање';

  @override
  String get bookmarksAndProgress => 'Обележувачи и напредок';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
    return 'No $label found';
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
  String get unwatched => 'Невидено';

  @override
  String get seriesStatus => 'Статус на серијата';

  @override
  String get allLibraries => 'Сите библиотеки';

  @override
  String get books => 'Книги';

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
  String get rssFeed => 'RSS Feed';

  @override
  String get downloadZip => 'Преземете Zip';

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
      'Сè уште нема достапен преглед од Open Library за овој наслов.';

  @override
  String get subjects => 'Предмети';

  @override
  String get all => 'Сите';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Не може да се вчита оваа тема во моментов.';

  @override
  String get audiobookDetails => 'Детали за аудио книга';

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
  String get trackList => 'Листа на песни';

  @override
  String get itemListPlaceholder => 'Списокот со ставки ќе се појави овде';

  @override
  String get favoriteTracksPlaceholder => 'Омилените песни ќе се појават овде';

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
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Непознат датум на објавување';

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
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
  }

  @override
  String get view => 'Прикажи';

  @override
  String get resumeReading => 'Продолжи со читање';

  @override
  String get read => 'Прочитајте';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Играј';

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
  String get cast => 'Улоги';

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
  String get renamePlaylist => 'Преименувајте ја плејлистата';

  @override
  String get playlistName => 'Име на плејлистата';

  @override
  String get deleteDownloadedAlbum => 'Избришете го преземениот албум';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Ставката е избришана';

  @override
  String get noPlayableTrailerFound =>
      'Не е пронајдена трејлер за репродукција.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Аудио песна';

  @override
  String get subtitleTrack => 'Песна со титл';

  @override
  String get none => 'Никој';

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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Преводот е преземен. Можеби ќе треба еден момент да се појави додека Jellyfin ја освежува ставката.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Изберете верзија';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Избришете ги преземените датотеки';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get directors => '';

  @override
  String get writer => '';

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
  String get showLess => 'Прикажи помалку';

  @override
  String get readMore => 'Прочитај повеќе';

  @override
  String get shuffle => 'Мешај';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
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
  String get deviceVolume => 'Јачина на звук на уредот';

  @override
  String get unavailable => 'Недостапно';

  @override
  String get pause => 'Пауза';

  @override
  String get syncPosition => 'Синхронизирај позиција';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Редот е празен';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
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
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
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
  String get player => 'Играч';

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
  String get track => 'Песна';

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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Предавањето EPUB во апликација сè уште не е достапно на оваа платформа.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Претставувањето на вградените документи е недостапно на оваа платформа.';

  @override
  String get couldNotOpenExternalViewer =>
      'Не може да се отвори надворешниот прегледувач.';

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
      'Сè уште нема обележувачи.\nДопрете ја иконата за обележувачи додека читате за да ја зачувате вашата позиција.';

  @override
  String get noTableOfContentsAvailable => 'Нема достапна табела со содржини';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Позиција';

  @override
  String get bookReader => 'Читач на книги';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Не се пронајдени канали';

  @override
  String get liveBadge => 'ВО ЖИВО';

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
  String get watch => 'Гледајте';

  @override
  String get close => 'Затвори';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'бр';

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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Вид на сметка на Seer';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Албум';

  @override
  String get playAlbum => 'Пушти го албумот';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'Серијата не е пронајдена';

  @override
  String get errorLoadingSeries => 'Грешка при вчитување на серијата';

  @override
  String get downloadedEpisodes => 'Преземени епизоди';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Специјални';

  @override
  String get deleteSeason => 'Избриши сезона';

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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Музика и аудио книги';

  @override
  String get images => 'Слики';

  @override
  String get database => 'База на податоци';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Тематска музика на почетните редови';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Репродуцирајте при прелистување на почетниот екран';

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
    return '${value}s';
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
    return 'After $episodes episodes / ${hours}h';
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
  String get subtitlePreviewText =>
      'Брзата кафена лисица го прескокнува мрзливото куче';

  @override
  String get verticalOffset => 'Вертикално поместување';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

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
  String get showSeerrButton => '';

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
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

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
    return '$count selected';
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
  String get mediaBarModeMoonfin => 'Месечината';

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
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'Тип на слика по ред';

  @override
  String get perRowSettings => 'Поставки по ред';

  @override
  String get autoLogin => 'Автоматско најавување';

  @override
  String get lastUser => 'Последен корисник';

  @override
  String get currentUser => '';

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
    return '$minutes min';
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
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

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
  String get trakt => 'Тракт';

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
  String get showMdbListAndTmdbRatings => 'Прикажи рејтинзи на MDBL и TMDB';

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
  String get pluginLabel => 'Приклучок';

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
    return '$status\nVersion: $version';
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
  String get seerrDiscoveryRows => '';

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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Откријте редови';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Повлечете за повторно да нарачате. Овозможете или оневозможете редови. Овозможеното нарачка на редови се синхронизира со приклучокот Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Повлечете за повторно да нарачате. Овозможете или оневозможете редови.';

  @override
  String get enabled => 'Овозможено';

  @override
  String get hidden => 'Скриени';

  @override
  String get aboutTitle => 'За';

  @override
  String versionValue(String version) {
    return 'Version $version';
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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Ажурирајте ги известувањата';

  @override
  String get showWhenUpdatesAvailable => 'Прикажи кога ажурирањата се достапни';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get mdbListTmdbRatingSources => 'MDBLlist, TMDB и извори на оценување';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Јасно';

  @override
  String get browse => 'Прелистајте';

  @override
  String get noResults => 'Нема резултати';

  @override
  String get seerrAvailableStatus => 'Достапно';

  @override
  String get seerrRequestedStatus => 'Побарана';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Поставки на Seer';

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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
  String get appearances => 'Изгледи';

  @override
  String get crewSection => 'Екипаж';

  @override
  String ageValue(int age) {
    return 'age $age';
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
  String get add => 'Додадете';

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
  String get remote => 'Далечински';

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
  String get trickplay => 'Трик игра';

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
  String get adminDrawerTranscoding => 'Транскодирање';

  @override
  String get adminDrawerResume => 'Продолжи';

  @override
  String get adminDrawerStreaming => 'Стриминг';

  @override
  String get adminDrawerTrickplay => 'Трик игра';

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
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4К';

  @override
  String get nowPlaying => 'Сега се игра';

  @override
  String get volume => 'Волумен';

  @override
  String get actions => 'Акции';

  @override
  String get videoCodec => 'Видео кодек';

  @override
  String get audioCodec => 'Аудио кодек';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Завршување';

  @override
  String get direct => 'Директно';

  @override
  String get adminDisconnect => 'Исклучете се';

  @override
  String get adminClearDates => 'Јасни датуми';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Избриши Уред';

  @override
  String get adminDeviceDeleted => 'Уредот е избришан';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Преименувај библиотека';

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
  String get adminDeleteLibrary => 'Избришете ја библиотеката';

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
  String get adminRemovePath => 'Отстранете ја патеката';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Опциите на библиотеката се зачувани';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'Потребно е името на библиотеката';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'Не успеа да се вчитаат корисници';

  @override
  String get adminSearchUsers => 'Пребарувајте корисници';

  @override
  String get adminEditUser => 'Уреди корисник';

  @override
  String get adminAddUser => 'Додај корисник';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Дозволите се зачувани';

  @override
  String get adminPasswordsMismatch => 'Лозинките не се совпаѓаат';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get adminResetPasswordWarning =>
      'Ова ќе ја отстрани лозинката. Корисникот ќе може да се најави без лозинка.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Недостасува клучен токен од одговорот на серверот';

  @override
  String get adminRevokeApiKey => 'Отповикајте го клучот на API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Клучот API е отповикан';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Се создава резервна копија...';

  @override
  String get adminBackupCreated => 'Бекапот е направен успешно';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Недостасува резервна патека во одговорот на серверот';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Потврдете го обновувањето';

  @override
  String get adminRestoringBackup => 'Се враќа резервната копија...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Пребарајте во дневникот';

  @override
  String get adminNoMatchingLines => 'Нема соодветни линии';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Не се пронајдени закажани задачи';

  @override
  String get adminNoTasksMatchFilter =>
      'Ниту една задача не одговара на тековниот филтер';

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
  String get adminRunNow => 'Стартувај сега';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Ден во неделата';

  @override
  String get adminSearchPlugins => 'Пребарајте приклучоци...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Деинсталирајте го приклучокот';

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
      'Нема додатоци кои одговараат на вашето пребарување';

  @override
  String get adminNoPluginsInstalled => 'Нема инсталирани додатоци';

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
      'Не може да се отворат поставките: недостасува токен за авторизација.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Приклучокот не е пронајден';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'на пр. Jellyfin Стабилна';

  @override
  String get adminRepositoryUrl => 'URL на складиштето';

  @override
  String get adminAddEntry => 'Додадете запис';

  @override
  String get adminInvalidUrl => 'Неважечка URL-адреса';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminBaseUrlHint => 'на пр. /желефин';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Пребарајте далечинска личност';

  @override
  String get adminNoRemoteMatches => 'Не се пронајдени далечински совпаѓања';

  @override
  String get adminRemoteResults => 'Далечински резултати';

  @override
  String get adminRemoteMetadataApplied => 'Применети далечински метаподатоци';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Ажурирајте го типот на содржина';

  @override
  String get adminContentType => 'Тип на содржина';

  @override
  String get adminContentTypeUpdated => 'Типот на содржина е ажуриран';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Неподдржан формат на слика';

  @override
  String get adminImageReadFailed => 'Не успеа да се прочита избраната слика';

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
  String get adminAllProviders => 'Сите провајдери';

  @override
  String get adminNoRemoteImages => 'Не се пронајдени далечински слики';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Додадете тјунер';

  @override
  String get adminTunerType => 'Тип на тјунер';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Друго';

  @override
  String get adminUrlPath => 'URL / патека';

  @override
  String get adminNameOptional => 'Име (изборно)';

  @override
  String get adminTunerAdded => 'Додаде тјунер';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Додадете провајдер на водич';

  @override
  String get adminProviderType => 'Тип на провајдер';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect или XMLTV';

  @override
  String get adminUsernameOptional => 'Корисничко име (изборно)';

  @override
  String get adminRefreshInterval => 'Интервал на освежување (часови)';

  @override
  String get adminProviderAdded => 'Додаден е провајдер';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Побарано е ресетирање на приемникот';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved => 'Поставките за снимање се зачувани';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Додадете провајдер';

  @override
  String get adminNoListingProviders =>
      'Не се конфигурирани даватели на огласи';

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
    return 'Restore backup $name now?';
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
  String get adminApply => 'Пријавете се';

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
  String get adminLogViewerNoMatches => 'Нема соодветни линии';

  @override
  String get adminMetadataEditorTitle => 'Уредувач на метаподатоци';

  @override
  String get adminMetadataRemote => 'Далечински';

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
      'Не успеа да се прочита избраната слика';

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
      'Ова ја отстранува моменталната слика од ставката.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ниту еден пакет не одговара на вашето пребарување';

  @override
  String get adminPluginsCatalogEmpty => 'Нема достапни пакети';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Отстранете го складиштето';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Отстрани';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminPlaybackHwAccel => 'Хардверско забрзување';

  @override
  String get adminPlaybackHwAccelLabel => 'Хардверско забрзување';

  @override
  String get adminPlaybackEnableHwEncoding => 'Овозможи хардверско кодирање';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Овозможете хардверско декодирање за:';

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
      other: '$count hours',
      one: '1 hour',
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
      'Конфигурирајте генерирање слики за trickplay за сликички за преглед на пребарување.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Јавна HTTPS порта';

  @override
  String get adminNetworkingBaseUrl => 'Основен URL';

  @override
  String get adminNetworkingBaseUrlHint => 'на пр. /желефин';

  @override
  String get adminNetworkingHttps => 'HTTPS';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Бавен праг на одговор (ms)';

  @override
  String get adminGeneralCachePath => 'Патека на кешот';

  @override
  String get adminGeneralMetadataPath => 'Патека за метаподатоци';

  @override
  String get adminGeneralServerName => 'Име на серверот';

  @override
  String get adminSettingsLoadFailed => 'Не успеа да се вчитаат поставките';

  @override
  String get adminDiscover => 'Откријте';

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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Пристапот во SyncPlay е одбиен';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Немате пристап до една или повеќе ставки во оваа група SyncPlay. Побарајте од сопственикот на групата да ги потврди дозволите за библиотеката или да избере друга редица.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
      other: '# rows discovered',
      one: '# row discovered',
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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Далечинска репродукција';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Јачина на звук на уредот';

  @override
  String get castVolumeUnavailable => 'Недостапно';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Неточен ПИН';

  @override
  String get pinMismatch => 'PIN-кодовите не се совпаѓаат';

  @override
  String get pinForgot => 'Го заборавивте ПИН-кодот?';

  @override
  String get pinClear => 'Јасно';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Барањето за брзо поврзување е овластено.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Кодот за брзо поврзување е неважечки или истечен.';

  @override
  String get quickConnectNotSupported =>
      'Брзо поврзување не е поддржано на овој сервер.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Не успеа да се овласти кодот за брзо поврзување.';

  @override
  String get quickConnectDisabled =>
      'Брзо поврзување е оневозможено на овој сервер.';

  @override
  String get quickConnectForbidden =>
      'Вашата сметка не може да го овласти ова барање за брзо поврзување.';

  @override
  String get quickConnectNotFound =>
      'Кодот за брзо поврзување не е пронајден. Обидете се со нов код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Внесете код';

  @override
  String get quickConnectAuthorize => 'Овластете';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'ТВ во живо';

  @override
  String get continueWatchingAndNextUp => 'Продолжете да гледате и понатаму';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get playerTooltipPrevious => 'Претходна';

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
  String get settingsPrivacyAndSafetySection => 'ПРИВАТНОСТ И БЕЗБЕДНОСТ';

  @override
  String get settingsBlockedRatings => 'Блокирани рејтинзи';

  @override
  String get settingsGeneralStyle => 'Општ стил';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Акценти на теми, заднини, гледани индикатори и тематска музика';

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
  String get settingsShowSeerrButtonInNavigation => '';

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
      'Donate a coffee to the developer';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (наследство)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
    return '$value ms';
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
  String get externalLists => 'External Home Row Lists';

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
}
