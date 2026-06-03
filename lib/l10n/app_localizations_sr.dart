// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'Моонфин';

  @override
  String get signIn => 'Пријавите се';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Куицк Цоннецт';

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
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'ко гледа?';

  @override
  String get addUser => 'Додај корисника';

  @override
  String get selectServer => 'Изаберите Сервер';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
  String get embyConnect => '__АРБ_ТЕРМ_0__ Повежи се';

  @override
  String get removeServer => 'Уклони сервер';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
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
  String get serverAddressHint => 'хттпс://ваш-сервер.екампле.цом';

  @override
  String get connect => 'Повежите се';

  @override
  String get secureStorageUnavailable => 'Безбедно складиштење није доступно';

  @override
  String get secureStorageUnavailableMessage =>
      '__АРБ_ТЕРМ_0__ није могао да приступи вашем системском прстену за кључеве. Пријављивање може да се настави, али безбедно складиштење токена можда неће бити доступно док се привезак за кључеве не откључа.';

  @override
  String get ok => 'ОК';

  @override
  String get settingsAppearanceTheme => 'Апп Тхеме';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Пребацивање између __АРБ_ТЕРМ_1__ и __АРБ_ТЕРМ_0__ без поновног покретања апликације';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Моонфин';

  @override
  String get themeMoonfinSubtitle =>
      'Тренутни __АРБ_ТЕРМ_0__ изглед који сте сви заволели';

  @override
  String get themeNeonPulse => 'Неон Пулсе';

  @override
  String get themeNeonPulseSubtitle =>
      'Синтхваве стил са магента сјајем, цијан текстом и јачим хромираним контрастом';

  @override
  String get embyConnectSignInSubtitle =>
      'Пријавите се са својим __АРБ_ТЕРМ_0__ налогом за повезивање';

  @override
  String get emailOrUsername => 'Е-маил или корисничко име';

  @override
  String get selectAServer => 'Изаберите сервер';

  @override
  String get tryAgain => 'Покушајте поново';

  @override
  String get noLinkedServers =>
      'Ниједан сервер није повезан са овим __АРБ_ТЕРМ_0__ налогом за повезивање';

  @override
  String get invalidEmbyConnectCredentials =>
      'Неважећи __АРБ_ТЕРМ_0__ акредитиви за повезивање';

  @override
  String get invalidEmbyConnectLogin =>
      'Неважеће __АРБ_ТЕРМ_0__ корисничко име или лозинка за повезивање';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сервер не подржава __АРБ_ТЕРМ_0__ размену за повезивање';

  @override
  String get embyConnectNetworkError =>
      'Мрежна грешка при контактирању __АРБ_ТЕРМ_0__ Цоннецт или изабраног сервера';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Изаћи из __АРБ_ТЕРМ_0__?';

  @override
  String get exitAppConfirmation => 'Да ли сте сигурни да желите да изађете?';

  @override
  String get exit => 'Изађи';

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
  String get series => 'Сериес';

  @override
  String get noItemsFound => 'Нема пронађених ставки';

  @override
  String get home => 'Хоме';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Овај фолдер је празан';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
    return '$name — Genres';
  }

  @override
  String get views => 'Погледи';

  @override
  String get albums => 'Албумс';

  @override
  String get albumArtists => 'Албум Артистс';

  @override
  String get artists => 'Уметници';

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
  String get discoverySubjects => 'Дисцовери Субјецтс';

  @override
  String get pickDiscoverySubjects =>
      'Изаберите које садржаје тема желите да прикажете у Дисцовер-у.';

  @override
  String get apply => 'Пријавите се';

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
      'Популарни наслови јавног домена из __АРБ_ТЕРМ_0__.';

  @override
  String titlesCount(int count) {
    return '$count titles';
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
  String get readyWhenYouAre => 'Спремни кад сте';

  @override
  String get details => 'Детаљи';

  @override
  String get listeningRoom => 'Соба за слушање';

  @override
  String get bookmarksAndProgress => 'Боокмаркс & Прогресс';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
      'Наслови у тренду према теми из __АРБ_ТЕРМ_0__.';

  @override
  String get noBookmarkedItems => 'Још нема обележених ставки';

  @override
  String get nothingMatchesSection =>
      'Још ништа не одговара овом одељку. Пробајте другу картицу или се вратите након што се синхронизација библиотеке заврши.';

  @override
  String get audiobooks => 'Аудио књиге';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
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
  String get watched => 'Гледао';

  @override
  String get unread => 'Непрочитано';

  @override
  String get unwatched => 'Негледан';

  @override
  String get seriesStatus => 'Статус серије';

  @override
  String get allLibraries => 'Све библиотеке';

  @override
  String get books => 'Књиге';

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
      '__АРБ_ТЕРМ_0__ још увек није дао опис за овај наслов.';

  @override
  String get readers => 'Реадерс';

  @override
  String get openLinks => 'Отворите везе';

  @override
  String get librivoxPage => '__АРБ_ТЕРМ_0__ Страница';

  @override
  String get internetArchive => 'Интернет Арцхиве';

  @override
  String get rssFeed => 'РСС Феед';

  @override
  String get downloadZip => 'Преузмите Зип';

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
      'Још увек није доступан преглед од __АРБ_ТЕРМ_0__ за овај наслов.';

  @override
  String get subjects => 'Субјекти';

  @override
  String get all => 'Све';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Тренутно није могуће учитати ову тему.';

  @override
  String get audiobookDetails => 'Детаљи аудио књиге';

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
  String get trackList => 'Листа нумера';

  @override
  String get itemListPlaceholder => 'Овде ће се појавити листа ставки';

  @override
  String get favoriteTracksPlaceholder => 'Овде ће се појавити омиљене нумере';

  @override
  String get failedToLoad => 'Учитавање није успело';

  @override
  String get delete => 'Избриши';

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
  String get seasons => 'Годишња доба';

  @override
  String get chapters => 'поглавља';

  @override
  String get features => 'Карактеристике';

  @override
  String get movies => 'Филмови';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Датум објављивања непознат';

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
  String get view => 'Виев';

  @override
  String get resumeReading => 'Настави читање';

  @override
  String get read => 'Читај';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Играј';

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
  String get cast => 'Цаст';

  @override
  String get trailer => 'Траилер';

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
  String get renamePlaylist => 'Преименуј плејлисту';

  @override
  String get playlistName => 'Име плејлисте';

  @override
  String get deleteDownloadedAlbum => 'Избриши преузети албум';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Ставка је избрисана';

  @override
  String get noPlayableTrailerFound =>
      'Није пронађен ниједан трејлер за репродукцију.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
      'Претражујте помоћу додатка __АРБ_ТЕРМ_0__';

  @override
  String get downloadSubtitles => 'Довнлоад Субтитлес';

  @override
  String get selectedSubtitleInvalid => 'Изабрани титл је неважећи.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Поднаслов је преузет. Може потрајати тренутак да се појави док __АРБ_ТЕРМ_0__ освежи ставку.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Изаберите Верзија';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Избришите преузете датотеке';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'ВРИТЕРС';

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
  String get showLess => 'Покажи мање';

  @override
  String get readMore => 'Прочитајте више';

  @override
  String get shuffle => 'Схуффле';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Савршено подударање';

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
  String get deviceVolume => 'Јачина звука уређаја';

  @override
  String get unavailable => 'Недоступно';

  @override
  String get pause => 'Пауза';

  @override
  String get syncPosition => 'Синц Поситион';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Ред је празан';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Ремоте Плаибацк';

  @override
  String get castingToGoogleCast => 'Пребацивање на __АРБ_ТЕРМ_0__';

  @override
  String get castingViaAirPlay => 'Пребацивање преко __АРБ_ТЕРМ_0__';

  @override
  String get castingViaDlna => 'Пребацивање преко __АРБ_ТЕРМ_0__';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Дуго притисните за откључавање';

  @override
  String get off => 'Офф';

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
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
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
  String get player => 'Плаиер';

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
  String get track => 'Трацк';

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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'ЕПУБ приказивање у апликацији још увек није доступно на овој платформи.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Уграђено приказивање докумената није доступно на овој платформи.';

  @override
  String get couldNotOpenExternalViewer =>
      'Није могуће отворити спољни прегледач.';

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
      'Још нема обележивача.\nДодирните икону обележивача док читате да бисте сачували своју позицију.';

  @override
  String get noTableOfContentsAvailable => 'Није доступан садржај';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Положај';

  @override
  String get bookReader => 'Боок Реадер';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Није пронађен ниједан канал';

  @override
  String get liveBadge => 'ЛИВЕ';

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
  String get watch => 'Гледај';

  @override
  String get close => 'Затвори';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'бр';

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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Сеерр';

  @override
  String get seerrAccountType => 'Сеерр Тип налога';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Албум';

  @override
  String get playAlbum => 'Пусти албум';

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
  String get errorLoadingEpisodes => 'Грешка при учитавању епизода';

  @override
  String get noDownloadedEpisodes => 'Нема преузетих епизода';

  @override
  String get deleteEpisode => 'Избриши епизоду';

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
  String get seriesNotFound => 'Серија није пронађена';

  @override
  String get errorLoadingSeries => 'Грешка при учитавању серије';

  @override
  String get downloadedEpisodes => 'Преузете епизоде';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Специалс';

  @override
  String get deleteSeason => 'Избриши сезону';

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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Музика и аудио књиге';

  @override
  String get images => 'Слике';

  @override
  String get database => 'База података';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Тематска музика на кућним редовима';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Играјте када прегледате почетни екран';

  @override
  String get detailsBackgroundBlur => 'Детаљи Замућење позадине';

  @override
  String pixelValue(int value) {
    return '${value}px';
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
  String get trueHdSupport => 'ТруеХД подршка';

  @override
  String get enableDtsPassthrough =>
      'Битстреам ДТС аудио само на АВР; захтева подршку пријемника и ДТС изворну стазу';

  @override
  String get enableTrueHdAudio =>
      'Омогућите ТруеХД аудио (можда неће радити на свим платформама)';

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
  String get nightMode => 'Ноћни режим';

  @override
  String get compressDynamicRange => 'Компримирајте динамички опсег';

  @override
  String get advancedMpv => 'Напредно __АРБ_ТЕРМ_0__';

  @override
  String get enableCustomMpvConf => 'Омогући прилагођени __АРБ_ТЕРМ_0__.цонф';

  @override
  String get applyMpvConfBeforePlayback =>
      'Примените кориснички наведен __АРБ_ТЕРМ_0__.цонф пре него што репродукција почне';

  @override
  String get unsafeAdvancedMpvOptions =>
      'Небезбедне напредне __АРБ_ТЕРМ_0__ опције';

  @override
  String get unsafeMpvOptionsDescription =>
      'Дозволи шири скуп __АРБ_ТЕРМ_0__ опција. Може нарушити понашање при репродукцији.';

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
    return '${value}s';
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
    return 'After $episodes episodes / ${hours}h';
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
  String get customMpvConfPath => 'Прилагођена путања __АРБ_ТЕРМ_0__.цонф';

  @override
  String get notSetMpvConf =>
      'Није постављено. __АРБ_ТЕРМ_0__ ће покушати са подразумеваним __АРБ_ТЕРМ_1__.цонф у фолдерима апп/дата.';

  @override
  String get selectMpvConf => 'Изаберите __АРБ_ТЕРМ_0__.цонф';

  @override
  String get pathToMpvConf => '/путања/до/__АРБ_ТЕРМ_0__.цонф';

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
      'Преузимања/__АРБ_ТЕРМ_0__ — видљиво другим апликацијама';

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
      'Преузети медији ће бити сачувани у Преузимања/__АРБ_ТЕРМ_0__ на вашем уређају. Ове датотеке ће бити видљиве другим апликацијама као што су ваша галерија или музички плејер.\n\nПостојећа преузимања ће остати на тренутној локацији.';

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
  String get libraryVisibility => 'Видљивост библиотеке';

  @override
  String get libraryVisibilityDescription =>
      'Укључите/искључите видљивост почетне странице по библиотеци. Поново покрените __АРБ_ТЕРМ_0__ да би промене ступиле на снагу.';

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
    return '$count selected';
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
      'Изаберите између __АРБ_ТЕРМ_0__, МакД или искључите медијску траку';

  @override
  String get mediaBarModeMoonfin => 'Моонфин';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Офф';

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
  String get perRowImageType => 'Тип слике по реду';

  @override
  String get perRowSettings => 'Подешавања по реду';

  @override
  String get autoLogin => 'Ауто Логин';

  @override
  String get lastUser => 'Последњи корисник';

  @override
  String get specificUser => 'Одређени корисник';

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
    return '$minutes min';
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
  String get rottenTomatoesCritics => 'Роттен Томатоес (критичари)';

  @override
  String get rottenTomatoesAudience => 'Роттен Томатоес (публика)';

  @override
  String get imdb => 'ИМДб';

  @override
  String get tmdb => 'ТМДБ';

  @override
  String get metacritic => 'Метацритиц';

  @override
  String get metacriticUser => 'Метацритиц (корисник)';

  @override
  String get trakt => 'Тракт';

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
  String get showMdbListAndTmdbRatings => 'Прикажи МДБЛист и ТМДБ оцене';

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
  String get pluginLabel => 'Додатак';

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
    return '$status\nVersion: $version';
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
  String get resetRowsToDefaults =>
      'Ресетујте редове на подразумеване вредности';

  @override
  String get enableSeerr => 'Омогући Сеерр';

  @override
  String get showSeerrInNavigation =>
      'Прикажи Сеерр у навигацији (захтева додатак за сервер)';

  @override
  String get seerrUnavailable =>
      'Није доступно јер је подршка за серверски додатак Сеерр онемогућена.';

  @override
  String get nsfwFilter => 'НСФВ филтер';

  @override
  String get hideAdultContent => 'Сакриј садржај за одрасле у резултатима';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Откријте редове';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Превуците да бисте променили редослед. Омогућите или онемогућите редове. Омогућен редослед редова се синхронизује са додатком __АРБ_ТЕРМ_0__.';

  @override
  String get discoverRowsDescription =>
      'Превуците да бисте променили редослед. Омогућите или онемогућите редове.';

  @override
  String get enabled => 'Омогућено';

  @override
  String get hidden => 'Скривено';

  @override
  String get aboutTitle => 'Абоут';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Лиценце отвореног кода';

  @override
  String get sourceCode => 'Изворни код';

  @override
  String get sourceCodeUrl =>
      'хттпс://гитхуб.цом/Моонфин-Цлиент/Мобиле-Десктоп';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Обавештења о ажурирању';

  @override
  String get showWhenUpdatesAvailable => 'Прикажи када су ажурирања доступна';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get mdbListTmdbRatingSources => 'МДБЛист, ТМДБ и извори рејтинга';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Јасно';

  @override
  String get browse => 'Прегледај';

  @override
  String get noResults => 'Нема резултата';

  @override
  String get seerrAvailableStatus => 'Доступан';

  @override
  String get seerrRequestedStatus => 'Захтевано';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Сеерр Сеттингс';

  @override
  String get requestMore => 'Захтевајте више';

  @override
  String get request => 'Захтев';

  @override
  String get cancelRequest => 'Откажи захтев';

  @override
  String get playInMoonfin => 'Играј у __АРБ_ТЕРМ_0__';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
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
      'Ставка није пронађена у вашој библиотеци __АРБ_ТЕРМ_0__';

  @override
  String get errorSearchingLibrary => 'Грешка при претраживању библиотеке';

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
  String get appearances => 'Наступи';

  @override
  String get crewSection => 'Посада';

  @override
  String ageValue(int age) {
    return 'age $age';
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
  String get tmdbScore => 'ТМДБ Сцоре';

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
  String get seasonsLabel => 'Годишња доба';

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
  String get general => 'генерал';

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
  String get remote => 'Ремоте';

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
  String get search => 'Тражи';

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
  String get stop => 'Стани';

  @override
  String get streaming => 'Стреаминг';

  @override
  String get time => 'Време';

  @override
  String get trickplay => 'Трицкплаи';

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
  String get mute => 'Муте';

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
  String get adminDrawerTranscoding => 'Трансцодинг';

  @override
  String get adminDrawerResume => 'Настави';

  @override
  String get adminDrawerStreaming => 'Стреаминг';

  @override
  String get adminDrawerTrickplay => 'Трицкплаи';

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
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Рестарт сервера је у току';

  @override
  String get adminServerRebootMessage =>
      'Рестарт сервера је у току, поново покрените __АРБ_ТЕРМ_0__';

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
    return 'Command failed: $error';
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
  String get volume => 'Волуме';

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
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Избриши уређај';

  @override
  String get adminDeviceDeleted => 'Уређај је избрисан';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Преименуј библиотеку';

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
  String get adminDeleteLibrary => 'Избриши библиотеку';

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
  String get adminRemovePath => 'Уклони путању';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Опције библиотеке су сачуване';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'Назив библиотеке је обавезан';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'Учитавање корисника није успело';

  @override
  String get adminSearchUsers => 'Претражите кориснике';

  @override
  String get adminEditUser => 'Уреди корисника';

  @override
  String get adminAddUser => 'Додај корисника';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Дозволе су сачуване';

  @override
  String get adminPasswordsMismatch => 'Лозинке се не поклапају';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get adminResetPasswordWarning =>
      'Ово ће уклонити лозинку. Корисник ће моћи да се пријави без лозинке.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Токен кључа недостаје у одговору сервера';

  @override
  String get adminRevokeApiKey => 'Опозови АПИ кључ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'АПИ кључ је опозван';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Прављење резервне копије...';

  @override
  String get adminBackupCreated => 'Резервна копија је успешно направљена';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'У одговору сервера недостаје резервна путања';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Потврдите враћање';

  @override
  String get adminRestoringBackup => 'Враћање резервне копије...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Тражи у дневнику';

  @override
  String get adminNoMatchingLines => 'Нема одговарајућих линија';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Није пронађен ниједан заказани задатак';

  @override
  String get adminNoTasksMatchFilter =>
      'Ниједан задатак не одговара тренутном филтеру';

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
  String get adminRunNow => 'Рун Нов';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Дан у недељи';

  @override
  String get adminSearchPlugins => 'Претражи додатке...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Деинсталирајте додатак';

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
      'Ниједан додатак не одговара вашој претрази';

  @override
  String get adminNoPluginsInstalled => 'Нема инсталираних додатака';

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
      'Није могуће отворити подешавања: недостаје токен за потврду.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Додатак није пронађен';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'нпр. __АРБ_ТЕРМ_0__ Стабилно';

  @override
  String get adminRepositoryUrl => 'УРЛ спремишта';

  @override
  String get adminAddEntry => 'Додајте унос';

  @override
  String get adminInvalidUrl => 'Неважећи УРЛ';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminTrickplaySaved => 'Подешавања трицкплаиа су сачувана';

  @override
  String get adminTrickplayLoadFailed =>
      'Учитавање подешавања трицкплаиа није успело';

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
  String get adminBaseUrlHint => 'нпр. /јеллифин';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Претражите удаљену особу';

  @override
  String get adminNoRemoteMatches => 'Нису пронађена удаљена подударања';

  @override
  String get adminRemoteResults => 'Ремоте Ресултс';

  @override
  String get adminRemoteMetadataApplied => 'Примењени су удаљени метаподаци';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Ажурирајте тип садржаја';

  @override
  String get adminContentType => 'Тип садржаја';

  @override
  String get adminContentTypeUpdated => 'Тип садржаја је ажуриран';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Неподржан формат слике';

  @override
  String get adminImageReadFailed => 'Читање изабране слике није успело';

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
  String get adminAllProviders => 'Сви провајдери';

  @override
  String get adminNoRemoteImages => 'Нису пронађене удаљене слике';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Додај тјунер';

  @override
  String get adminTunerType => 'Тип тјунера';

  @override
  String get adminTunerTypeHint => 'ХДХомеРун, М3У, друго';

  @override
  String get adminUrlPath => 'УРЛ / Путања';

  @override
  String get adminNameOptional => 'Име (опционо)';

  @override
  String get adminTunerAdded => 'Тунер је додао';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Додајте добављача водича';

  @override
  String get adminProviderType => 'Тип провајдера';

  @override
  String get adminProviderTypeHint => 'СцхедулесДирецт или КСМЛТВ';

  @override
  String get adminUsernameOptional => 'Корисничко име (опционо)';

  @override
  String get adminRefreshInterval => 'Интервал освежавања (сати)';

  @override
  String get adminProviderAdded => 'Провајдер је додат';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Захтевано је ресетовање тјунера';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved => 'Подешавања снимања су сачувана';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Додај провајдера';

  @override
  String get adminNoListingProviders =>
      'Ниједан добављач листе није конфигурисан';

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
    return 'Restore backup $name now?';
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
  String get adminApply => 'Пријавите се';

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
  String get adminLogViewerNoMatches => 'Нема одговарајућих линија';

  @override
  String get adminMetadataEditorTitle => 'Уређивач метаподатака';

  @override
  String get adminMetadataRemote => 'Ремоте';

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
      'Читање изабране слике није успело';

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
      'Ово уклања тренутну слику из ставке.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ниједан пакет не одговара вашој претрази';

  @override
  String get adminPluginsCatalogEmpty => 'Нема доступних пакета';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Уклоните спремиште';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Уклони';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminReposNameHint => 'нпр. __АРБ_ТЕРМ_0__ Стабилно';

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
  String get adminPlaybackHwAccel => 'Хардверско убрзање';

  @override
  String get adminPlaybackHwAccelLabel => 'Хардверско убрзање';

  @override
  String get adminPlaybackEnableHwEncoding => 'Омогућите хардверско кодирање';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Омогући хардверско декодирање за:';

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
  String get adminTaskStop => 'Стани';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminActivityNow => 'сада';

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
      'Конфигуришите генерисање трицкплаи слика за тражење сличица за преглед.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Јавни ХТТПС порт';

  @override
  String get adminNetworkingBaseUrl => 'Основни УРЛ';

  @override
  String get adminNetworkingBaseUrlHint => 'нпр. /јеллифин';

  @override
  String get adminNetworkingHttps => 'ХТТПС';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Праг спорог одзива (мс)';

  @override
  String get adminGeneralCachePath => 'Путања кеша';

  @override
  String get adminGeneralMetadataPath => 'Путања метаподатака';

  @override
  String get adminGeneralServerName => 'Име сервера';

  @override
  String get adminSettingsLoadFailed => 'Учитавање подешавања није успело';

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
  String get folders => 'Фасцикле';

  @override
  String get libraries => 'Библиотеке';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => '__АРБ_ТЕРМ_0__ онемогућен';

  @override
  String get syncPlayDisabledMessage =>
      'Омогућите __АРБ_ТЕРМ_0__ у подешавањима да бисте користили синхронизовану репродукцију.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сервер није подржан';

  @override
  String get syncPlayServerUnsupportedMessage =>
      '__АРБ_ТЕРМ_0__ захтева __АРБ_ТЕРМ_1__ сервер. Тренутни сервер то не подржава.';

  @override
  String get syncPlayGroupFallbackName => '__АРБ_ТЕРМ_0__ Група';

  @override
  String get syncPlayGroupTooltip => '__АРБ_ТЕРМ_0__ група';

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
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Играј сада';

  @override
  String get syncPlayCreateNewGroup => 'Направите нову групу';

  @override
  String get syncPlayGroupName => 'Назив групе';

  @override
  String get syncPlayDefaultGroupName => 'Моја __АРБ_ТЕРМ_0__ група';

  @override
  String get syncPlayCreateGroup => 'Креирајте групу';

  @override
  String get syncPlayAvailableGroups => 'Доступне групе';

  @override
  String get syncPlayNoGroupsAvailable => 'Нема доступних група';

  @override
  String get syncPlayJoinGroupQuestion =>
      'Желите ли да се придружите групи __АРБ_ТЕРМ_0__?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Придруживање __АРБ_ТЕРМ_0__ групи може да замени ваш тренутни ред за репродукцију. Наставити?';

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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => '__АРБ_ТЕРМ_0__ приступ одбијен';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Немате приступ једној или више ставки у овој __АРБ_ТЕРМ_0__ групи. Замолите власника групе да провери дозволе библиотеке или одабере други ред.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Гласовна претрага није доступна.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      '__АРБ_ТЕРМ_0__ Директна репродукција није успела';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Директна репродукција није успела да почне за овај __АРБ_ТЕРМ_0__ стрим. Покушати поново да користите транскодирање сервера?';

  @override
  String get retryWithTranscode => 'Покушајте поново са транскодом';

  @override
  String get dolbyVisionNotSupportedTitle => '__АРБ_ТЕРМ_0__ Није подржано';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Овај уређај не може директно да декодира садржај __АРБ_ТЕРМ_0__. Користите __АРБ_ТЕРМ_1__ резервни или затражите транскодирање сервера.';

  @override
  String get rememberMyChoice => 'Запамти мој избор';

  @override
  String get playHdr10Fallback => 'Пусти __АРБ_ТЕРМ_0__ резервни део';

  @override
  String get requestTranscode => 'Захтевај транскодирање';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Откријте редове изложене ИАмПарадок27 додатку „Секције почетног екрана“. Редови се могу омогућити и преуредити у наставку.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Још нема __АРБ_ТЕРМ_0__ сервера који пријављују додатак.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Откријте редове конфигурисане преко раналдсгифтовог додатка „КефинТвеакс“. Прилагођени одељци, недавно објављени, поново гледајте, сезонски и недавно додати у библиотеку, пресликавају се из КефинТвеакс конфигурације на сваком __АРБ_ТЕРМ_0__ серверу.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Још нема __АРБ_ТЕРМ_0__ сервера који пријављују КефинТвеакс.';

  @override
  String get integrationOpenHomeSections => 'Отворите Хоме Сецтионс';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Омогућите, онемогућите и промените редослед редова';

  @override
  String get integrationInstalledButDisabled => 'Инсталиран али онемогућен';

  @override
  String get integrationNotInstalled => 'Није инсталирано';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => '__АРБ_ТЕРМ_0__';

  @override
  String get castRemotePlayback => 'Ремоте Плаибацк';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Јачина звука уређаја';

  @override
  String get castVolumeUnavailable => 'Недоступно';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Нетачан ПИН';

  @override
  String get pinMismatch => 'ПИН-ови се не поклапају';

  @override
  String get pinForgot => 'Заборавили сте ПИН?';

  @override
  String get pinClear => 'Јасно';

  @override
  String get pinBackspace => 'Бацкспаце';

  @override
  String get quickConnectAuthorized => 'Захтев за брзо повезивање је одобрен.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Код за брзо повезивање је неважећи или је истекао.';

  @override
  String get quickConnectNotSupported =>
      'Брзо повезивање није подржано на овом серверу.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Ауторизација кода за брзо повезивање није успела.';

  @override
  String get quickConnectDisabled =>
      'Брзо повезивање је онемогућено на овом серверу.';

  @override
  String get quickConnectForbidden =>
      'Ваш налог не може да одобри овај захтев за брзо повезивање.';

  @override
  String get quickConnectNotFound =>
      'Код за брзо повезивање није пронађен. Пробајте нови код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Унесите код';

  @override
  String get quickConnectAuthorize => 'Овластити';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Нема доступних уређаја за даљинску репродукцију.';

  @override
  String get noRemoteDevicesIos =>
      'Нема доступних уређаја за даљинску репродукцију.\n\nНа иОС-у, __АРБ_ТЕРМ_0__ циљеви можда неће бити доступни у симулатору.';

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
    return 'Downloading $name...';
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
  String get stillWatchingStop => 'Стани';

  @override
  String get stillWatchingContinue => 'Настави';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'ТВ уживо';

  @override
  String get continueWatchingAndNextUp => 'Наставите са гледањем и даље';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get settingsPlaybackSyncplay => 'Репродукција и __АРБ_ТЕРМ_0__';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Аудио/видео подешавања, титлови, преузимања и контроле __АРБ_ТЕРМ_0__';

  @override
  String get settingsIntegrationsSubtitle =>
      'Синхронизација додатака, Сеерр, оцене и још много тога';

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
  String get settingsPrivacyAndSafetySection => 'ПРИВАТНОСТ И БЕЗБЕДНОСТ';

  @override
  String get settingsBlockedRatings => 'Блоцкед Ратингс';

  @override
  String get settingsGeneralStyle => 'Генерал Стиле';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Акценти теме, позадине, индикатори гледања и тематска музика';

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
  String get settingsLibraryVisibilitySubtitle =>
      'Укључите/искључите видљивост почетне странице по библиотеци. Поново покрените __АРБ_ТЕРМ_0__ да би промене ступиле на снагу.';

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
      '__АРБ_ТЕРМ_0__ покреће интеграције на страни сервера укључујући додатне изворе оцењивања, Сеерр захтеве и синхронизоване поставке.';

  @override
  String get settingsOfflineDownloads => 'Оффлине Довнлоадс';

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
      'Отворите алатку за праћење проблема на __АРБ_ТЕРМ_0__';

  @override
  String get settingsJoinDiscord => 'Придружите се __АРБ_ТЕРМ_0__';

  @override
  String get settingsJoinDiscordSubtitle => 'Разговарајте са заједницом';

  @override
  String get settingsJoinTheDiscord => 'Придружите се __АРБ_ТЕРМ_0__';

  @override
  String get settingsSupportMoonfin => 'Подршка __АРБ_ТЕРМ_0__';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

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
      'Како __АРБ_ТЕРМ_0__ рукује вашим подацима';

  @override
  String get settingsCheckForUpdates => 'Проверите ажурирања';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Проверите најновије издање __АРБ_ТЕРМ_0__';

  @override
  String get settingsPoweredByFlutter => 'Поверед би Флуттер';

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
  String get settingsPlaybackEngineMedia3Recommended =>
      '__АРБ_ТЕРМ_0__ (препоручено)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => '__АРБ_ТЕРМ_0__ (наслеђе)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => '__АРБ_ТЕРМ_0__ Замена';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Понашање за __АРБ_ТЕРМ_0__ наслове на уређајима без __АРБ_ТЕРМ_0__ декодирања.';

  @override
  String get settingsAskEachTime => 'Питајте сваки пут';

  @override
  String get settingsPreferHdr10Fallback =>
      'Дајте предност __АРБ_ТЕРМ_0__ резервном';

  @override
  String get settingsPreferServerTranscode =>
      'Преферирајте транскодирање сервера';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      '__АРБ_ТЕРМ_0__ Профил 7 Директна игра';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Контролише да ли __АРБ_ТЕРМ_0__ токови слоја побољшања профила 7 треба да усмеравају репродукцију.';

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
      'Креирајте, придружите се групама __АРБ_ТЕРМ_0__ или управљајте њима';

  @override
  String get settingsSyncplayEnabled => '__АРБ_ТЕРМ_0__ Омогућено';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Омогућите функције групног гледања';

  @override
  String get settingsSyncplayButton => '__АРБ_ТЕРМ_0__ Дугме';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Прикажите дугме __АРБ_ТЕРМ_0__ на траци за навигацију';

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
  String get settingsSyncplayExtraOffset => '__АРБ_ТЕРМ_0__ Додатни помак';

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
