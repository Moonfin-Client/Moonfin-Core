// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AppLocalizationsBe extends AppLocalizations {
  AppLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get appTitle => 'Месяцовы плаўнік';

  @override
  String get signIn => 'Увайдзіце';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Хуткае падключэнне';

  @override
  String get password => 'Пароль';

  @override
  String get username => 'Імя карыстальніка';

  @override
  String get email => 'Электронная пошта';

  @override
  String get quickConnectInstruction =>
      'Увядзіце гэты код на вэб-панэлі вашага сервера:';

  @override
  String get waitingForAuthorization => 'Чаканне аўтарызацыі...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Сервер недаступны';

  @override
  String get loginFailed => 'Не атрымалася ўвайсці';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Хто глядзіць?';

  @override
  String get addUser => 'Дадаць карыстальніка';

  @override
  String get selectServer => 'Выберыце Сервер';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Захаваныя серверы';

  @override
  String get discoveredServers => 'Выяўленыя серверы';

  @override
  String get noneFound => 'Нічога не знойдзена';

  @override
  String get unableToConnectToServer => 'Немагчыма падключыцца да сервера';

  @override
  String get addServer => 'Дадаць сервер';

  @override
  String get embyConnect => 'Emby Падключыць';

  @override
  String get removeServer => 'Выдаліць сервер';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Адмяніць';

  @override
  String get remove => 'Зняць';

  @override
  String get connectToServer => 'Падлучыцца да сервера';

  @override
  String get serverAddress => 'Адрас сервера';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Падключыць';

  @override
  String get secureStorageUnavailable => 'Бяспечнае сховішча недаступна';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin не можа атрымаць доступ да вашай сістэмы ключоў. Уваход можна працягваць, але бяспечнае сховішча токенаў можа быць недаступным, пакуль бірулька не будзе разблакіравана.';

  @override
  String get ok => 'добра';

  @override
  String get settingsAppearanceTheme => 'Тэма прыкладання';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Пераключайцеся паміж Moonfin і Neon Pulse без перазапуску праграмы';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Месяцовы плаўнік';

  @override
  String get themeMoonfinSubtitle =>
      'Цяперашні вобраз Moonfin, які вам усім спадабаўся';

  @override
  String get themeNeonPulse => 'Неонавы імпульс';

  @override
  String get themeNeonPulseSubtitle =>
      'Стыль Synthwave з пурпурным ззяннем, блакітным тэкстам і больш моцным храмаваным кантрастам';

  @override
  String get embyConnectSignInSubtitle =>
      'Увайдзіце ў свой уліковы запіс Emby Connect';

  @override
  String get emailOrUsername => 'Электронная пошта або імя карыстальніка';

  @override
  String get selectAServer => 'Выберыце сервер';

  @override
  String get tryAgain => 'Паспрабуйце яшчэ раз';

  @override
  String get noLinkedServers =>
      'Няма сервераў, звязаных з гэтым уліковым запісам Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Няправільныя ўліковыя даныя Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Няправільнае імя карыстальніка або пароль Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сервер не падтрымлівае абмен Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Памылка сеткі пры звароце да Emby Connect або абранага сервера';

  @override
  String get loadingLinkedServers => 'Загрузка звязаных сервераў...';

  @override
  String get connectingToServerEllipsis => 'Падключэнне да сервера...';

  @override
  String get noReachableAddress => 'Не пазначаны даступны адрас';

  @override
  String get invalidServerExchangeResponse =>
      'Няправільны адказ ад канчатковай кропкі абмену серверам';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Выйсці з Moonfin?';

  @override
  String get exitAppConfirmation => 'Вы ўпэўнены, што хочаце выйсці?';

  @override
  String get exit => 'Выхад';

  @override
  String get noHomeRowsLoaded => 'Не ўдалося загрузіць хатнія радкі';

  @override
  String get noHomeRowsHint =>
      'Паспрабуйце абнавіць або паменшыць актыўныя хатнія раздзелы.';

  @override
  String get retryHomeRows => 'Паўтарыце хатнія радкі';

  @override
  String get guide => 'Кіраўніцтва';

  @override
  String get recordings => 'Запісы';

  @override
  String get schedule => 'Расклад';

  @override
  String get series => 'серыял';

  @override
  String get noItemsFound => 'Элементы не знойдзены';

  @override
  String get home => 'дадому';

  @override
  String get browseAll => 'Праглядзець усе';

  @override
  String get genres => 'Жанры';

  @override
  String get collectionPlaceholder => 'Элементы калекцыі з\'явяцца тут';

  @override
  String get browseByLetter => 'Прагляд па літарах';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Тут з\'явіцца прагляд у алфавітным парадку';

  @override
  String get suggestions => 'Прапановы';

  @override
  String get suggestionsPlaceholder => 'Тут з\'явяцца прапанаваныя элементы';

  @override
  String get failedToLoadLibraries => 'Не ўдалося загрузіць бібліятэкі';

  @override
  String get noLibrariesFound => 'Бібліятэкі не знойдзены';

  @override
  String get library => 'Бібліятэка';

  @override
  String get displaySettings => 'Налады дысплея';

  @override
  String get allGenres => 'Усе жанры';

  @override
  String get noGenresFound => 'Жанры не знойдзены';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Гэтая папка пустая';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Не ўдалося загрузіць абранае';

  @override
  String get retry => 'Паўтарыць';

  @override
  String get noFavoritesYet => 'Пакуль няма абраных';

  @override
  String get favorites => 'Выбранае';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Працягваецца';

  @override
  String get ended => 'Скончылася';

  @override
  String get sortAndFilter => 'Сартаваць і фільтраваць';

  @override
  String get type => 'Тып';

  @override
  String get sortBy => 'Сартаваць па';

  @override
  String get display => 'Дысплей';

  @override
  String get imageType => 'Тып выявы';

  @override
  String get posterSize => 'Памер плаката';

  @override
  String get small => 'Маленькі';

  @override
  String get medium => 'Сярэдні';

  @override
  String get large => 'Вялікі';

  @override
  String get extraLarge => 'Вельмі вялікі';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Прагляды';

  @override
  String get albums => 'Альбомы';

  @override
  String get albumArtists => 'Выканаўцы альбома';

  @override
  String get artists => 'Мастакі';

  @override
  String get bookmarks => 'Закладкі';

  @override
  String get noSavedBookmarks =>
      'Пакуль няма захаваных закладак для гэтай назвы.';

  @override
  String get openBook => 'Адкрытая кніга';

  @override
  String get chapter => 'Кіраўнік';

  @override
  String get page => 'старонка';

  @override
  String get bookmark => 'Закладка';

  @override
  String get justNow => 'Толькі што';

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
  String get discoverySubjects => 'Тэмы адкрыццяў';

  @override
  String get pickDiscoverySubjects =>
      'Выберыце, якія тэматычныя стужкі паказваць у Discover.';

  @override
  String get apply => 'Ужыць';

  @override
  String get openLink => 'Адкрыць спасылку';

  @override
  String get scanWithYourPhone => 'Сканаванне з дапамогай тэлефона';

  @override
  String get audiobookGenres => 'Жанры аўдыёкніжкі';

  @override
  String get pickAudiobookGenres =>
      'Выберыце, якія жанры паказаць у Discover аўдыякніг.';

  @override
  String get discoverAudiobooks => 'Адкрыйце для сябе аўдыякнігі';

  @override
  String get librivoxDescription =>
      'Папулярныя назвы грамадскага здабытку ад LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Пракрутка ўлева';

  @override
  String get scrollRight => 'Пракрутка ўправа';

  @override
  String get couldNotLoadGenre => 'Не атрымалася загрузіць гэты жанр.';

  @override
  String get continueReading => 'Працягнуць чытанне';

  @override
  String get savedHighlights => 'Захаваныя моманты';

  @override
  String get continueListening => 'Працягвайце слухаць';

  @override
  String get listen => 'Слухай';

  @override
  String get resume => 'Рэзюмэ';

  @override
  String get failedToLoadLibrary => 'Не ўдалося загрузіць бібліятэку';

  @override
  String get popularNow => 'Папулярныя зараз';

  @override
  String get savedForLater => 'Захавана на потым';

  @override
  String get topListens => 'Лепшыя праслухоўванні';

  @override
  String get unreadDiscoveries => 'Непрачытаныя адкрыцці';

  @override
  String get pickUpAgain => 'Падбярыце зноў';

  @override
  String get bookHighlightsDescription =>
      'Вашы кнігі з адметнымі момантамі, абранымі або прагрэсам чытання.';

  @override
  String get handPickedFromLibrary => 'Падабранае ўручную з вашай бібліятэкі.';

  @override
  String get handPickedFromListeningQueue =>
      'Падабранае ўручную з вашай чаргі для праслухоўвання.';

  @override
  String get booksWithHighlights =>
      'Кнігі з адметнымі момантамі, абранымі або прагрэсам чытання.';

  @override
  String get jumpBackNarration => 'Вярніцеся да апавядання, не шукаючы месца.';

  @override
  String get unreadBooksReady =>
      'Непрачытаныя кнігі гатовыя да наступнай ціхай гадзіны.';

  @override
  String get quickAccessFavorites =>
      'Хуткі доступ да кніг, да якіх вы ўвесь час вяртаецеся.';

  @override
  String get searchAudiobooks => 'Пошук аўдыёкніг';

  @override
  String get searchYourLibrary => 'Пошук у вашай бібліятэцы';

  @override
  String get pickUpStory => 'Працягвайце гісторыю там, дзе вы спыніліся';

  @override
  String get savedPlacesChapters =>
      'Вашы захаваныя месцы і незавершаныя раздзелы';

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
  String get readyWhenYouAre => 'Гатовы, калі будзеце';

  @override
  String get details => 'Дэталі';

  @override
  String get listeningRoom => 'Пакой для праслухоўвання';

  @override
  String get bookmarksAndProgress => 'Закладкі і прагрэс';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Назвы';

  @override
  String get allTitles => 'Усе назвы';

  @override
  String get authors => 'Аўтары';

  @override
  String get browseByAuthor => 'Прагляд па аўтару';

  @override
  String get browseByGenre => 'Прагляд па жанры';

  @override
  String get discover => 'Адкрыйце для сябе';

  @override
  String get trendingTitlesOpenLibrary =>
      'Папулярныя назвы па тэмах з Open Library.';

  @override
  String get noBookmarkedItems => 'Пакуль няма закладак';

  @override
  String get nothingMatchesSection =>
      'Пакуль нічога не адпавядае гэтаму раздзелу. Паспрабуйце іншую ўкладку або вярніцеся пасля завяршэння сінхранізацыі бібліятэкі.';

  @override
  String get audiobooks => 'Аўдыёкніжкі';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Папка';

  @override
  String get filters => 'Фільтры';

  @override
  String get readingStatus => 'Статус чытання';

  @override
  String get playedStatus => 'Згуляны статус';

  @override
  String get readStatus => 'Прачытайце';

  @override
  String get watched => 'Глядзеў';

  @override
  String get unread => 'Непрачытанае';

  @override
  String get unwatched => 'Непрагледжаны';

  @override
  String get seriesStatus => 'Статус серыі';

  @override
  String get allLibraries => 'Усе бібліятэкі';

  @override
  String get books => 'Кнігі';

  @override
  String get author => 'Аўтар';

  @override
  String get unknownAuthor => 'Невядомы аўтар';

  @override
  String get uncategorized => 'Без катэгорыі';

  @override
  String get overview => 'Агляд';

  @override
  String get noLibrivoxDescription =>
      'LibriVox пакуль не даў апісання гэтай назвы.';

  @override
  String get readers => 'Чытачы';

  @override
  String get openLinks => 'Адкрыйце спасылкі';

  @override
  String get librivoxPage => 'Старонка LibriVox';

  @override
  String get internetArchive => 'Інтэрнэт-архіў';

  @override
  String get rssFeed => 'RSS-канал';

  @override
  String get downloadZip => 'Спампаваць Zip';

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
      'У Open Library пакуль няма агляду гэтай назвы.';

  @override
  String get subjects => 'Суб\'екты';

  @override
  String get all => 'Усе';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Немагчыма загрузіць гэтую тэму зараз.';

  @override
  String get audiobookDetails => 'Падрабязнасці аўдыёкнігі';

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
  String get trackList => 'Спіс трэкаў';

  @override
  String get itemListPlaceholder => 'Тут з\'явіцца спіс прадметаў';

  @override
  String get favoriteTracksPlaceholder => 'Тут з\'явяцца любімыя трэкі';

  @override
  String get failedToLoad => 'Не ўдалося загрузіць';

  @override
  String get delete => 'Выдаліць';

  @override
  String get save => 'Захаваць';

  @override
  String get moreLikeThis => 'Яшчэ падобнае';

  @override
  String get castAndCrew => 'Акцёры і здымачная група';

  @override
  String get collection => 'Калекцыя';

  @override
  String get episodes => 'Эпізоды';

  @override
  String get nextUp => 'Далей';

  @override
  String get seasons => 'Поры года';

  @override
  String get chapters => 'раздзелы';

  @override
  String get features => 'Асаблівасці';

  @override
  String get movies => 'Фільмы';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Іншае';

  @override
  String get discography => 'Дыскаграфія';

  @override
  String get similarArtists => 'Падобныя выканаўцы';

  @override
  String get tableOfContents => 'Змест';

  @override
  String get tracklist => 'Трэк-ліст';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Біяграфія';

  @override
  String get authorDetails => 'Даныя аб аўтары';

  @override
  String get noOverviewAvailable =>
      'Для гэтай назвы яшчэ няма даступнага агляду.';

  @override
  String get noBiographyAvailable => 'Біяграфія гэтага аўтара адсутнічае.';

  @override
  String get noBooksFound => 'Кнігі гэтага аўтара не знойдзены.';

  @override
  String get unableToLoadAuthorDetails =>
      'Зараз немагчыма загрузіць звесткі пра аўтара.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Дата публікацыі невядомая';

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
  String get view => 'Выгляд';

  @override
  String get resumeReading => 'Аднавіць чытанне';

  @override
  String get read => 'Прачытайце';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'гуляць';

  @override
  String get startOver => 'Пачаць спачатку';

  @override
  String get restart => 'Перазапуск';

  @override
  String get readOffline => 'Чытаць у аўтаномным рэжыме';

  @override
  String get playOffline => 'Гуляць у аўтаномным рэжыме';

  @override
  String get audio => 'Аўдыё';

  @override
  String get subtitles => 'субтытры';

  @override
  String get version => 'Версія';

  @override
  String get cast => 'У ролях';

  @override
  String get trailer => 'Трэйлер';

  @override
  String get finished => 'Скончана';

  @override
  String get favorited => 'Выбраны';

  @override
  String get favorite => 'Любімая';

  @override
  String get playlist => 'Плэйліст';

  @override
  String get downloaded => 'Спампавана';

  @override
  String get downloadAll => 'Спампаваць усе';

  @override
  String get download => 'Спампаваць';

  @override
  String get deleteDownloaded => 'Выдаліць спампаванае';

  @override
  String get goToSeries => 'Перайсці да серыі';

  @override
  String get editMetadata => 'Рэдагаваць метаданыя';

  @override
  String get less => 'менш';

  @override
  String get more => 'больш';

  @override
  String get deleteItem => 'Выдаліць элемент';

  @override
  String get deletePlaylist => 'Выдаліць спіс прайгравання';

  @override
  String get deletePlaylistMessage => 'Выдаліць гэты плэйліст з сервера?';

  @override
  String get deleteItemMessage => 'Выдаліць гэты элемент з сервера?';

  @override
  String get failedToDeletePlaylist => 'Не ўдалося выдаліць спіс прайгравання';

  @override
  String get failedToDeleteItem => 'Не ўдалося выдаліць элемент';

  @override
  String get renamePlaylist => 'Перайменаваць спіс прайгравання';

  @override
  String get playlistName => 'Назва плэйліста';

  @override
  String get deleteDownloadedAlbum => 'Выдаліць спампаваны альбом';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Спампаваныя трэкі выдалены';

  @override
  String get downloadedTracksDeleteFailed =>
      'Не ўдалося выдаліць некаторыя спампаваныя трэкі';

  @override
  String get noTracksLoaded => 'Няма загружаных трэкаў';

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
  String get itemDeleted => 'Элемент выдалены';

  @override
  String get noPlayableTrailerFound => 'Трэйлер для прайгравання не знойдзены.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Гукавая дарожка';

  @override
  String get subtitleTrack => 'Трэк субтытраў';

  @override
  String get none => 'Няма';

  @override
  String get downloadSubtitlesLabel => 'Спампаваць субтытры...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Шукайце з дапамогай плагіна OpenSubtitles';

  @override
  String get downloadSubtitles => 'Спампаваць субтытры';

  @override
  String get selectedSubtitleInvalid => 'Выбраны несапраўдны субтытр.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтытры спампаваны. З\'яўленне можа заняць некаторы час, пакуль Jellyfin абнавіць элемент.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Выберыце Версія';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Спампаваць усё — якасць';

  @override
  String get downloadQuality => 'Спампаваць якасць';

  @override
  String get originalFileNoReencoding => 'Арыгінальны файл, без перакадзіроўкі';

  @override
  String get originalFilesNoReencoding =>
      'Арыгінальныя файлы, без перакадзіроўкі';

  @override
  String get noEpisodesLoaded => 'Няма загружаных серый';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Выдаліць спампаваныя файлы';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Спампаваныя файлы выдалены';

  @override
  String get failedToDeleteFiles => 'Не ўдалося выдаліць файлы';

  @override
  String get deleteFiles => 'Выдаліць файлы';

  @override
  String get director => 'ДЫРЭКТАР';

  @override
  String get writers => 'ПІСЬМЕННІКІ';

  @override
  String get studio => 'СТУДЫЯ';

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
  String get showLess => 'Паказаць менш';

  @override
  String get readMore => 'Больш падрабязна';

  @override
  String get shuffle => 'Ператасаваць';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Ідэальны матч';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Мона';

  @override
  String get stereo => 'Стэрэа';

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
  String get deleteSeasonFiles => 'усе спампаваныя серыі ў гэтым сезоне';

  @override
  String get stillWatching => 'Усё яшчэ глядзіце?';

  @override
  String get unableToLoadTrailerStream => 'Немагчыма загрузіць паток трэйлера.';

  @override
  String get trailerTimedOut => 'Час загрузкі трэйлера скончыўся.';

  @override
  String get playbackFailedForTrailer =>
      'Не атрымалася прайграць гэты трэйлер.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Трансляцыя недаступная падчас пазасеткавага прайгравання.';

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
  String get deviceVolume => 'Гучнасць прылады';

  @override
  String get unavailable => 'Недаступны';

  @override
  String get pause => 'Паўза';

  @override
  String get syncPosition => 'Сінхранізацыя пазіцыі';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Чарга пустая';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Аддаленае прайграванне';

  @override
  String get castingToGoogleCast => 'Трансляцыя ў Google Cast';

  @override
  String get castingViaAirPlay => 'Трансляцыя праз AirPlay';

  @override
  String get castingViaDlna => 'Трансляцыя праз DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Доўгі націск, каб разблакіраваць';

  @override
  String get off => 'Выкл';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Аўто';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Перавызначэнне бітрэйту';

  @override
  String get audioDelay => 'Затрымка гуку';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Затрымка субтытраў';

  @override
  String get reset => 'Скінуць';

  @override
  String get unknown => 'Невядомы';

  @override
  String get playbackInformation => 'Інфармацыя аб прайграванні';

  @override
  String get playback => 'Прайграванне';

  @override
  String get playMethod => 'Метад гульні';

  @override
  String get directPlay => 'Прамая гульня';

  @override
  String get directStream => 'Прамы паток';

  @override
  String get transcoding => 'Перакадзіроўка';

  @override
  String get transcodeReasons => 'Прычыны перакадзіравання';

  @override
  String get player => 'Гулец';

  @override
  String get container => 'Кантэйнер';

  @override
  String get bitrate => 'Бітрэйт';

  @override
  String get video => 'Відэа';

  @override
  String get resolution => 'дазвол';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Кодэк';

  @override
  String get videoBitrate => 'Бітрэйт відэа';

  @override
  String get track => 'Трэк';

  @override
  String get channels => 'Каналы';

  @override
  String get audioBitrate => 'Бітрэйт аўдыя';

  @override
  String get sampleRate => 'Частата выбаркі';

  @override
  String get format => 'фармат';

  @override
  String get external => 'Знешні';

  @override
  String get embedded => 'Убудаваны';

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
      'Візуалізацыя EPUB у праграме пакуль недаступная на гэтай платформе.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Убудаваная візуалізацыя дакументаў недаступная на гэтай платформе.';

  @override
  String get couldNotOpenExternalViewer =>
      'Немагчыма адкрыць знешнюю праграму прагляду.';

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
      'Пакуль няма закладак.\nНацісніце на значок закладкі падчас чытання, каб захаваць сваю пазіцыю.';

  @override
  String get noTableOfContentsAvailable => 'Няма даступнага зместу';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Пазіцыя';

  @override
  String get bookReader => 'Чытанка кніг';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Ідзе абнаўленне...';

  @override
  String get markUnread => 'Пазначыць як непрачытанае';

  @override
  String get markAsRead => 'Пазначыць як прачытанае';

  @override
  String get reloadReader => 'Перазагрузіць Reader';

  @override
  String get noPagesFound => 'Старонак не знойдзена.';

  @override
  String get failedToDecodePageImage =>
      'Не ўдалося дэкадаваць відарыс старонкі.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Адна старонка';

  @override
  String get twoPageSpread => 'Двухстаронкавы разварот';

  @override
  String get addBookmark => 'Дадаць закладку';

  @override
  String get bookmarksEllipsis => 'Закладкі...';

  @override
  String get markedAsRead => 'Пазначана як прачытанае';

  @override
  String get markedAsUnread => 'Пазначана як непрачытанае';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Тэма: Сістэма';

  @override
  String get themeLight => 'Тэма: Святло';

  @override
  String get themeDark => 'Тэма: Цёмны';

  @override
  String get themeSepia => 'Тэма: Сэпія';

  @override
  String get invertColorsFixedLayout => 'Інвертаваць колеры (фіксаваны макет)';

  @override
  String get invertColorsPdf => 'Інвертаваць колеры (PDF)';

  @override
  String get preparingInAppReader =>
      'Падрыхтоўка ўбудаванай праграмы для чытання...';

  @override
  String get pdfDataNotAvailable => 'PDF-даныя недаступныя.';

  @override
  String get readerFallbackModeActive => 'Уключаны рэзервовы рэжым чытання';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Выкарыстоўвайце Reload Reader пасля пераключэння на мэтавую платформу, якая падтрымліваецца (Android, iOS, macOS).';

  @override
  String get openExternally => 'Адкрыты звонку';

  @override
  String get noEpubChaptersFound => 'Раздзелы EPUB не знойдзены.';

  @override
  String get readerNotReady => 'Чытач не гатовы.';

  @override
  String get seriesRecordings => 'Запісы серыялаў';

  @override
  String get now => 'зараз';

  @override
  String get sports => 'Спорт';

  @override
  String get news => 'Навіны';

  @override
  String get kids => 'Дзеці';

  @override
  String get premiere => 'Прэм\'ера';

  @override
  String get guideTimeline => 'Храналогія кіраўніцтва';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Каналы не знойдзены';

  @override
  String get liveBadge => 'ЖЫВАЯ';

  @override
  String get movie => 'Фільм';

  @override
  String get removedFromFavoriteChannels => 'Выдалены з любімых каналаў';

  @override
  String get addedToFavoriteChannels => 'Дададзены ў любімыя каналы';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Не ўдалося абнавіць любімы канал';

  @override
  String get unfavoriteChannel => 'Неабраны канал';

  @override
  String get favoriteChannel => 'Любімы канал';

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
  String get watch => 'Глядзець';

  @override
  String get close => 'Блізка';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Не ўдалося загрузіць запісы';

  @override
  String get scheduledInNext24Hours => 'Запланавана на наступныя 24 гадзіны';

  @override
  String get recentRecordings => 'Апошнія запісы';

  @override
  String get tvSeries => 'серыял';

  @override
  String get failedToLoadSchedule => 'Не ўдалося загрузіць расклад';

  @override
  String get noScheduledRecordings => 'Няма запланаваных запісаў';

  @override
  String get cancelRecording => 'Адмяніць запіс?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'няма';

  @override
  String get yesCancel => 'Так, адмяніць';

  @override
  String get failedToCancelRecording => 'Не ўдалося адмяніць запіс';

  @override
  String get failedToLoadSeriesRecordings =>
      'Не ўдалося загрузіць запісы серыі';

  @override
  String get noSeriesRecordings => 'Няма запісаў серыялаў';

  @override
  String get cancelSeriesRecording => 'Адмяніць запіс серыі';

  @override
  String get cancelSeriesRecordingQuestion => 'Адмяніць запіс серыі?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'Не ўдалося адмяніць запіс серыі';

  @override
  String get searchThisLibrary => 'Пошук у гэтай бібліятэцы...';

  @override
  String get searchEllipsis => 'Пошук...';

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
  String get seerrAccountType => 'Тып уліковага запісу Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Мясцовы';

  @override
  String get savedMedia => 'Захаваныя носьбіты';

  @override
  String get tvShows => 'Тэлеперадачы';

  @override
  String get music => 'Музыка';

  @override
  String get musicAlbums => 'Музычныя альбомы';

  @override
  String get noMediaInFilter => 'У гэтым фільтры няма мультымедыя';

  @override
  String get noDownloadedMediaYet => 'Пакуль няма спампаваных мультымедыя';

  @override
  String get browseLibrary => 'Праглядзіце бібліятэку';

  @override
  String get deleteDownload => 'Выдаліць загрузку';

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
  String get playAlbum => 'Прайграць альбом';

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
  String get errorLoadingEpisodes => 'Памылка загрузкі серый';

  @override
  String get noDownloadedEpisodes => 'Няма спампаваных серый';

  @override
  String get deleteEpisode => 'Выдаліць эпізод';

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
  String get seriesNotFound => 'Серыял не знойдзены';

  @override
  String get errorLoadingSeries => 'Памылка загрузкі серыі';

  @override
  String get downloadedEpisodes => 'Спампаваныя серыі';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Спец';

  @override
  String get deleteSeason => 'Выдаліць сезон';

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
  String get storageManagement => 'Кіраванне сховішчам';

  @override
  String get storageBreakdown => 'Паломка сховішча';

  @override
  String get downloadedItems => 'Спампаваныя элементы';

  @override
  String get storageLimit => 'Ліміт захоўвання';

  @override
  String get noLimit => 'Няма абмежаванняў';

  @override
  String get deleteAllDownloads => 'Выдаліць усе спампоўкі';

  @override
  String get deleteAllDownloadsWarning =>
      'Гэта прывядзе да выдалення ўсіх спампаваных медыяфайлаў і не можа быць адменена.';

  @override
  String get deleteAll => 'Выдаліць усе';

  @override
  String get deleteSelected => 'Выдаліць выбранае';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Музыка і аўдыякнігі';

  @override
  String get images => 'Малюнкі';

  @override
  String get database => 'База дадзеных';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Налады';

  @override
  String get authentication => 'Аўтэнтыфікацыя';

  @override
  String get autoLoginServerManagement =>
      'Аўтаматычны ўваход, кіраванне серверам';

  @override
  String get pinCode => 'ПІН-код';

  @override
  String get setUpPinCodeProtection => 'Наладзьце абарону PIN-кодам';

  @override
  String get parentalControls => 'Бацькоўскі кантроль';

  @override
  String get contentRatingRestrictions => 'Абмежаванні па рэйтынгу кантэнту';

  @override
  String get bitRateResolutionBehavior => 'Бітрэйт, дазвол, паводзіны';

  @override
  String get languageSizeAppearance => 'Мова, памер, знешні выгляд';

  @override
  String get qualityStorage => 'Якасць, захоўванне';

  @override
  String get serverSyncAndPluginStatus =>
      'Сінхранізацыя сервера і стан плагіна';

  @override
  String get mediaRequestIntegration => 'Інтэграцыя медыя-запытаў';

  @override
  String get switchServer => 'Пераключыць сервер';

  @override
  String get signOut => 'Выйсці';

  @override
  String get versionLicenses => 'Версія, ліцэнзіі';

  @override
  String get account => 'Рахунак';

  @override
  String get signInAndSecurity => 'Уваход і бяспека';

  @override
  String get administration => 'Адміністрацыя';

  @override
  String get serverSettingsUsersLibraries =>
      'Налады сервера, карыстальнікі, бібліятэкі';

  @override
  String get customization => 'Налада';

  @override
  String get themeAndLayout => 'Тэма і макет';

  @override
  String get videoAndSubtitles => 'Відэа і субтытры';

  @override
  String get integrations => 'Інтэграцыі';

  @override
  String get pluginAndRequests => 'Убудова і запыты';

  @override
  String get customizeAccountPlaybackInterface =>
      'Наладзьце ўліковы запіс, прайграванне і паводзіны інтэрфейсу';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Тэма і знешні выгляд';

  @override
  String get focusBorderColor => 'Колер рамкі факусіроўкі';

  @override
  String get watchedIndicators => 'Глядзелі індыкатары';

  @override
  String get always => 'Заўсёды';

  @override
  String get hideUnwatched => 'Схаваць неназіраныя';

  @override
  String get episodesOnly => 'Толькі эпізоды';

  @override
  String get never => 'ніколі';

  @override
  String get focusExpansionAnimation => 'Анімацыя пашырэння фокусу';

  @override
  String get desktopUiScale => 'Шкала працоўнага інтэрфейсу';

  @override
  String get scaleFocusedCards =>
      'Маштабуйце сфакусаваныя або наведзеныя карты і пліткі';

  @override
  String get backgroundBackdrops => 'Фонавыя застаўкі';

  @override
  String get showBackdropImages => 'Паказваць выявы фону за змесцівам';

  @override
  String get seriesThumbnails => 'Эскізы серыі';

  @override
  String get seriesThumbnailsDescription =>
      'Толькі эпізоды: выкарыстоўвайце ілюстрацыі серыі, якія адпавядаюць кожнаму тыпу відарыса радка';

  @override
  String get homeRowInfoOverlay => 'Накладанне інфармацыі на хатні радок';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Паказваць загаловак і метаданыя пры праглядзе хатніх радкоў';

  @override
  String get clockDisplay => 'Дысплей гадзін';

  @override
  String get inMenus => 'У меню';

  @override
  String get inVideo => 'У відэа';

  @override
  String get seasonalEffects => 'Сезонныя эфекты';

  @override
  String get seasonalEffectsDescription =>
      'Візуальныя эфекты і сезонныя ўпрыгажэнні';

  @override
  String get snow => 'Снег';

  @override
  String get fireworks => 'Феерверк';

  @override
  String get confetti => 'Канфеці';

  @override
  String get fallingLeaves => 'Ападае лісце';

  @override
  String get themeMusic => 'Тэматычная музыка';

  @override
  String get playThemeMusicOnDetailPages =>
      'Прайграйце тэматычную музыку на старонках падрабязных звестак';

  @override
  String get themeMusicVolume => 'Гучнасць тэматычнай музыкі';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Музычная тэма на Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Прайграванне падчас прагляду галоўнага экрана';

  @override
  String get detailsBackgroundBlur => 'Размыццё фону дэталяў';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Размыццё фону прагляду';

  @override
  String get maxStreamingBitrate => 'Максімальны бітрэйт струменевай перадачы';

  @override
  String get maxResolution => 'Максімальнае дазвол';

  @override
  String get playerZoomMode => 'Рэжым маштабавання прайгравальніка';

  @override
  String get fit => 'Прыстасаваны';

  @override
  String get autoCrop => 'Аўтаматычнае абрэзка';

  @override
  String get stretch => 'Расцяжка';

  @override
  String get refreshRateSwitching => 'Пераключэнне частоты абнаўлення';

  @override
  String get disabled => 'Інваліды';

  @override
  String get scaleOnTv => 'Шкала на ТБ';

  @override
  String get scaleOnDevice => 'Маштаб на прыладзе';

  @override
  String get trickPlay => 'Гульня на трукі';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Паказваць мініяцюры папярэдняга прагляду пры пошуку';

  @override
  String get showDescriptionOnPause => 'Паказаць апісанне на паўзе';

  @override
  String get dimVideoShowOverview =>
      'Прыглушыць відэа і паказаць аглядны тэкст падчас паўзы';

  @override
  String get osdLockButton => 'Кнопка блакіроўкі экраннага меню';

  @override
  String get osdLockButtonDescription =>
      'Паказаць кнопку блакіроўкі, якая блакуе сэнсарны ўвод, пакуль не будзе націснута доўга';

  @override
  String get audioBehavior => 'Аўдыё паводзіны';

  @override
  String get downmixToStereo => 'Звесці ў стэрэа';

  @override
  String get defaultAudioLanguage => 'Мова гуку па змаўчанні';

  @override
  String get autoServerDefault => 'Аўта (па змаўчанні сервера)';

  @override
  String get english => 'англійская';

  @override
  String get spanish => 'іспанскі';

  @override
  String get french => 'французскі';

  @override
  String get german => 'нямецкі';

  @override
  String get italian => 'італьянскі';

  @override
  String get portuguese => 'партугальская';

  @override
  String get japanese => 'Японскі';

  @override
  String get korean => 'карэйская';

  @override
  String get chinese => 'кітайскі';

  @override
  String get russian => 'рускі';

  @override
  String get arabic => 'арабская';

  @override
  String get hindi => 'хіндзі';

  @override
  String get dutch => 'галандскі';

  @override
  String get swedish => 'шведскі';

  @override
  String get norwegian => 'нарвежская';

  @override
  String get danish => 'дацкая';

  @override
  String get finnish => 'фінская';

  @override
  String get polish => 'польская';

  @override
  String get ac3Passthrough => 'AC3 скразны';

  @override
  String get dtsPassthrough => 'Праходжанне DTS';

  @override
  String get trueHdSupport => 'Падтрымка TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS audio to only to AVR; патрабуецца падтрымка прымача і зыходны трэк DTS';

  @override
  String get enableTrueHdAudio =>
      'Уключыць гук TrueHD (можа працаваць не на ўсіх платформах)';

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
  String get nightMode => 'Начны рэжым';

  @override
  String get compressDynamicRange => 'Сціснуць дынамічны дыяпазон';

  @override
  String get advancedMpv => 'Прасунуты mpv';

  @override
  String get enableCustomMpvConf => 'Уключыць Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Ужыце mpv.conf, вызначаны карыстальнікам, перад пачаткам прайгравання';

  @override
  String get unsafeAdvancedMpvOptions => 'Небяспечныя дадатковыя параметры mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Дазволіць больш шырокі набор опцый mpv. Можа парушыць паводзіны прайгравання.';

  @override
  String get hardwareDecoding => 'Апаратнае дэкадаванне';

  @override
  String get hardwareDecodingSubtitle =>
      'Можа палепшыць прадукцыйнасць, але можа выклікаць праблемы з прайграваннем на некаторых прыладах.';

  @override
  String get nextUpAndQueuing => 'Далей і ў чарзе';

  @override
  String get nextUpDisplay => 'Наступны дысплей';

  @override
  String get extended => 'Пашыраны';

  @override
  String get minimal => 'Мінімальны';

  @override
  String get nextUpTimeout => 'Наступны час чакання';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Медыя чарга';

  @override
  String get autoQueueNextEpisodes => 'Аўтаматычная чарга наступных серый';

  @override
  String get stillWatchingPrompt => 'Усё яшчэ гляджу падказку';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Узнавіць і прапусціць';

  @override
  String get resumeRewind => 'Перамотка рэзюмэ';

  @override
  String get unpauseRewind => 'Перамотка назад';

  @override
  String get fiveSeconds => '5 секунд';

  @override
  String get tenSeconds => '10 секунд';

  @override
  String get fifteenSeconds => '15 секунд';

  @override
  String get thirtySeconds => '30 секунд';

  @override
  String get skipBackLength => 'Прапусціць даўжыню спіны';

  @override
  String get skipForwardLength => 'Прапусціць даўжыню наперад';

  @override
  String get customMpvConfPath => 'Карыстальніцкі шлях mpv.conf';

  @override
  String get notSetMpvConf =>
      'Не ўстаноўлена. Moonfin паспрабуе mpv.conf па змаўчанні ў папках app/data.';

  @override
  String get selectMpvConf => 'Выберыце mpv.conf';

  @override
  String get pathToMpvConf => '/шлях/да/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Налады стылю (памер, колер, зрушэнне) прымяняюцца да тэкставых субтытраў (SRT, VTT, TTML). Субтытры ASS/SSA выкарыстоўваюць уласны ўбудаваны стыль, калі не выключана \"Прамое прайграванне ASS/SSA\". Растравыя субтытры (PGS, DVB, VobSub) не могуць быць перароблены.';

  @override
  String get defaultSubtitleLanguage => 'Мова субтытраў па змаўчанні';

  @override
  String get defaultToNoSubtitles => 'Па змаўчанні няма субтытраў';

  @override
  String get turnOffSubtitlesByDefault => 'Выключыць субтытры па змаўчанні';

  @override
  String get subtitleSize => 'Памер субтытраў';

  @override
  String get textFillColor => 'Колер запаўнення тэкстам';

  @override
  String get backgroundColor => 'Колер фону';

  @override
  String get textStrokeColor => 'Колер абводкі тэксту';

  @override
  String get subtitleCustomization => 'Налада субтытраў';

  @override
  String get subtitleCustomizationDescription => 'Наладзьце выгляд субтытраў';

  @override
  String get subtitlePreviewText =>
      'Хуткая бурая лісіца пераскоквае лянівага сабаку';

  @override
  String get verticalOffset => 'Вертыкальнае зрушэнне';

  @override
  String get pgsDirectPlay => 'Прамая гульня PGS';

  @override
  String get directPlayPgsSubtitles => 'Прамое прайграванне субтытраў PGS';

  @override
  String get assSsaDirectPlay => 'Прамая гульня ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Прамое прайграванне субтытраў ASS/SSA';

  @override
  String get white => 'Белы';

  @override
  String get black => 'Чорны';

  @override
  String get yellow => 'Жоўты';

  @override
  String get green => 'Зялёны';

  @override
  String get cyan => 'Блакітны';

  @override
  String get red => 'Чырвоны';

  @override
  String get transparent => 'Празрысты';

  @override
  String get semiTransparentBlack => 'Напаўпразрысты чорны';

  @override
  String get global => 'Глабальны';

  @override
  String get desktop => 'Працоўны стол';

  @override
  String get mobile => 'Мабільны';

  @override
  String get tv => 'тэлевізар';

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
  String get customizationProfile => 'Профіль налады';

  @override
  String get customizationProfileDescription =>
      'Выберыце профіль для загрузкі, рэдагавання і сінхранізацыі. Global прымяняецца ўсюды, калі толькі профіль прылады не адмяняе яго. Зялёная кропка пазначае ваш бягучы профіль прылады.';

  @override
  String get loadProfile => 'Загрузіць профіль';

  @override
  String get syncing => 'Сінхранізацыя...';

  @override
  String get syncToProfile => 'Сінхранізацыя з профілем';

  @override
  String get profileSyncHidden => 'Сінхранізацыя профілю схавана';

  @override
  String get enablePluginSyncDescription =>
      'Уключыце сінхранізацыю плагіна сервера ў наладах плагіна, каб паказаць тут элементы кіравання профілем.';

  @override
  String get quality => 'Якасць';

  @override
  String get defaultDownloadQuality => 'Якасць загрузкі па змаўчанні';

  @override
  String get network => 'Сетка';

  @override
  String get wifiOnlyDownloads => 'Спампоўкі толькі па Wi-Fi';

  @override
  String get onlyDownloadOnWifi =>
      'Спампоўвайце толькі пры падключэнні да Wi-Fi';

  @override
  String get storage => 'Захоўванне';

  @override
  String get storageUsed => 'Сховішча выкарыстоўваецца';

  @override
  String get manage => 'Кіраваць';

  @override
  String get calculating => 'Разлік...';

  @override
  String get downloadLocation => 'Месцазнаходжанне спампоўкі';

  @override
  String get defaultLabel => 'Па змаўчанні';

  @override
  String get saveToDownloadsFolder => 'Захаваць у папку \"Спампоўкі\".';

  @override
  String get downloadsVisibleToOtherApps =>
      'Спампоўкі/Moonfin — бачны для іншых праграм';

  @override
  String get dangerZone => 'Небяспечная зона';

  @override
  String get clearAllDownloads => 'Ачысціць усе спампоўкі';

  @override
  String get original => 'Арыгінал';

  @override
  String get changeDownloadLocation => 'Змяніць месца загрузкі';

  @override
  String get changeDownloadLocationDescription =>
      'Новыя спампоўкі будуць захаваны ў выбраную папку. Існуючыя спампоўкі застануцца ў іх бягучым месцы, і імі можна кіраваць у наладах сховішча.';

  @override
  String get confirm => 'Пацвердзіць';

  @override
  String get cannotWriteToFolder =>
      'Немагчыма запісаць у выбраную папку. Выберыце іншае месца або дайце дазвол на захоўванне.';

  @override
  String get saveToDownloadsFolderQuestion => 'Захаваць у папку \"Спампоўкі\"?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Спампаваныя мультымедыя будуць захаваны ў папцы \"Спампоўкі/Moonfin\" на вашай прыладзе. Гэтыя файлы будуць бачныя для іншых праграм, такіх як галерэя або музычны прайгравальнік.\n\nІснуючыя спампоўкі застануцца ў іх бягучым месцы.';

  @override
  String get enable => 'Уключыць';

  @override
  String get clearAllDownloadsWarning =>
      'Гэта прывядзе да выдалення ўсіх спампаваных мультымедыя, і дзеянне нельга адмяніць.';

  @override
  String get clearAll => 'Ачысціць усе';

  @override
  String get navigationStyle => 'Стыль навігацыі';

  @override
  String get topBar => 'Верхняя панэль';

  @override
  String get leftSidebar => 'Левая бакавая панэль';

  @override
  String get showShuffleButton => 'Паказаць кнопку перамешвання';

  @override
  String get showGenresButton => 'Паказаць кнопку жанраў';

  @override
  String get showFavoritesButton => 'Паказаць кнопку \"Выбранае\".';

  @override
  String get showLibrariesInToolbar =>
      'Паказаць бібліятэкі на панэлі інструментаў';

  @override
  String get navbarOpacity => 'Непразрыстасць панэлі навігацыі';

  @override
  String get navbarColor => 'Колер панэлі навігацыі';

  @override
  String get gray => 'Шэры';

  @override
  String get darkBlue => 'Цёмна-сіні';

  @override
  String get purple => 'Фіялетавы';

  @override
  String get teal => 'Чыркаваты';

  @override
  String get navy => 'ваенна-марскі флот';

  @override
  String get charcoal => 'драўняны вугаль';

  @override
  String get brown => 'Карычневы';

  @override
  String get darkRed => 'Цёмна-чырвоны';

  @override
  String get darkGreen => 'Цёмна-зялёны';

  @override
  String get slate => 'Шыфер';

  @override
  String get indigo => 'Індыга';

  @override
  String get libraryDisplay => 'Дысплей бібліятэкі';

  @override
  String get posterLabel => 'Плакат';

  @override
  String get thumbnailLabel => 'Мініяцюра';

  @override
  String get bannerLabel => 'Расцяжка';

  @override
  String get overridePerLibrarySettings =>
      'Перавызначэнне налад для кожнай бібліятэкі';

  @override
  String get applyImageTypeToAllLibraries =>
      'Прымяніць тып выявы да ўсіх бібліятэк';

  @override
  String get multiServerLibraries => 'Мультысерверныя бібліятэкі';

  @override
  String get showLibrariesFromAllServers =>
      'Паказаць бібліятэкі з усіх падлучаных сервераў';

  @override
  String get enableFolderView => 'Уключыць прагляд тэчак';

  @override
  String get showFolderBrowsingOption => 'Паказаць параметр прагляду тэчак';

  @override
  String get libraryVisibility => 'Бачнасць бібліятэкі';

  @override
  String get libraryVisibilityDescription =>
      'Пераключыць бачнасць хатняй старонкі для кожнай бібліятэкі. Перазапусціце Moonfin, каб змены ўступілі ў сілу.';

  @override
  String get showInNavigation => 'Паказаць у навігацыі';

  @override
  String get showInLatestMedia => 'Паказаць у апошніх СМІ';

  @override
  String get sourceLibraries => 'Бібліятэкі зыходных кодаў';

  @override
  String get sourceCollections => 'Калекцыі крыніц';

  @override
  String get excludedGenres => 'Выключаныя жанры';

  @override
  String get selectAll => 'Выбраць усе';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Панэль медыя';

  @override
  String get mediaSources => 'Крыніцы СМІ';

  @override
  String get behavior => 'Паводзіны';

  @override
  String get seconds => 'секунд';

  @override
  String get localPreviews => 'Мясцовыя папярэднія прагляды';

  @override
  String get localPreviewsDescription =>
      'Наладзьце папярэдні прагляд трэйлераў, мультымедыя і аўдыя.';

  @override
  String get mediaBarMode => 'Стыль медыябара';

  @override
  String get mediaBarModeDescription =>
      'Выбірайце паміж Moonfin, MakD або выключыце медыяпанэль';

  @override
  String get mediaBarModeMoonfin => 'Месяцовы плаўнік';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Выкл';

  @override
  String get enableMediaBar => 'Уключыць медыяпанэль';

  @override
  String get showFeaturedContentSlideshow =>
      'Паказваць слайд-шоу абранага змесціва на галоўнай старонцы';

  @override
  String get contentType => 'Тып кантэнту';

  @override
  String get moviesAndTvShows => 'Фільмы і тэлеперадачы';

  @override
  String get moviesOnly => 'Толькі фільмы';

  @override
  String get tvShowsOnly => 'Толькі тэлеперадачы';

  @override
  String get itemCount => 'Колькасць прадметаў';

  @override
  String get noneSelected => 'Нічога не выбрана';

  @override
  String get noneExcluded => 'Нічога не выключана';

  @override
  String get autoAdvance => 'Аўтаматычнае прасоўванне';

  @override
  String get autoAdvanceSlides => 'Аўтаматычны пераход да наступнага слайда';

  @override
  String get autoAdvanceInterval => 'Інтэрвал аўтаматычнага прасоўвання';

  @override
  String get trailerPreview => 'Папярэдні прагляд трэйлера';

  @override
  String get autoPlayTrailers =>
      'Аўтаматычнае прайграванне трэйлераў на панэлі мультымедыя праз 3 секунды';

  @override
  String get episodePreview => 'Папярэдні прагляд эпізоду';

  @override
  String get mediaPreview => 'Папярэдні прагляд мультымедыя';

  @override
  String get episodePreviewDescription =>
      'Прайграванне 30-секунднага ўбудаванага папярэдняга прагляду на картах у фокусе, пры навядзенні курсора або пры доўгім націску';

  @override
  String get mediaPreviewDescription =>
      'Прайграванне 30-секунднага ўбудаванага папярэдняга прагляду на картах у фокусе, пры навядзенні курсора або пры доўгім націску';

  @override
  String get previewAudio => 'Папярэдні прагляд аўдыя';

  @override
  String get enablePreviewAudio =>
      'Уключыце гук для папярэдняга прагляду трэйлераў і серый';

  @override
  String get latestMedia => 'Апошнія медыя';

  @override
  String get recentlyReleased => 'Нядаўна выпушчаны';

  @override
  String get myMedia => 'Мае СМІ';

  @override
  String get myMediaSmall => 'Мае мультымедыя (маленькія)';

  @override
  String get continueWatching => 'Працягнуць прагляд';

  @override
  String get resumeAudio => 'Узнавіць гук';

  @override
  String get resumeBooks => 'Рэзюмэ Кнігі';

  @override
  String get activeRecordings => 'Актыўныя запісы';

  @override
  String get playlists => 'Плэйлісты';

  @override
  String get liveTV => 'Жывое тэлебачанне';

  @override
  String get homeSections => 'Хатнія раздзелы';

  @override
  String get resetToDefaults => 'Скінуць налады па змаўчанні';

  @override
  String get homeRowPosterSize => 'Памер плаката Home Row';

  @override
  String get perRowImageTypeSelection => 'Выбар тыпу выявы ў радку';

  @override
  String get configureImageTypeForEachRow =>
      'Наладзьце тып выявы для кожнага ўключанага хатняга радка';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Аб\'яднаць Працягнуць прагляд і Далей';

  @override
  String get combineBothRows =>
      'Аб\'яднайце абодва шэрагу ў адну хатнюю секцыю';

  @override
  String get perRowImageType => 'Тып выявы ў радку';

  @override
  String get perRowSettings => 'Налады для кожнага радка';

  @override
  String get autoLogin => 'Аўтаматычны ўваход';

  @override
  String get lastUser => 'Апошні карыстальнік';

  @override
  String get specificUser => 'Канкрэтны карыстальнік';

  @override
  String get alwaysAuthenticate => 'Заўсёды правяраць сапраўднасць';

  @override
  String get requirePasswordWithToken =>
      'Патрабаваць пароль нават з захаваным маркерам';

  @override
  String get confirmExit => 'Пацвердзіце выхад';

  @override
  String get showConfirmationBeforeExiting =>
      'Паказаць пацвярджэнне перад выхадам';

  @override
  String get blockContentWithRatings =>
      'Блакіраваць кантэнт з наступнымі рэйтынгамі:';

  @override
  String get noContentRatingsFound =>
      'На гэтым серверы пакуль не знойдзены рэйтынгі кантэнту.';

  @override
  String get couldNotLoadServerRatings =>
      'Не атрымалася загрузіць рэйтынгі сервера. Паказваюцца толькі захаваныя ацэнкі.';

  @override
  String get couldNotRefreshRatings =>
      'Не ўдалося абнавіць рэйтынгі з сервера. Паказ захаваных рэйтынгаў.';

  @override
  String get enablePinCode => 'Уключыць PIN-код';

  @override
  String get requirePinToAccess =>
      'Патрабуйце PIN-код для доступу да ўліковага запісу';

  @override
  String get changePin => 'Змяніць PIN-код';

  @override
  String get setNewPinCode => 'Усталюйце новы PIN-код';

  @override
  String get removePin => 'Выдаліць PIN-код';

  @override
  String get removePinProtection => 'Зняць абарону PIN-кодам';

  @override
  String get screensaver => 'Застаўка';

  @override
  String get inAppScreensaver => 'Застаўка ў праграме';

  @override
  String get enableBuiltInScreensaver => 'Уключыць убудаваную застаўку';

  @override
  String get mode => 'Рэжым';

  @override
  String get libraryArt => 'Бібліятэчнае мастацтва';

  @override
  String get logo => 'Лагатып';

  @override
  String get clock => 'Гадзіннік';

  @override
  String get timeout => 'Тайм-аўт';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Узровень зацямнення';

  @override
  String get maxAgeRating => 'Максімальны ўзроставы рэйтынг';

  @override
  String get any => 'Любая';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Патрабаваць узроставы рэйтынг';

  @override
  String get onlyShowRatedContent => 'Паказваць толькі ацэнены кантэнт';

  @override
  String get showClock => 'Паказаць гадзіннік';

  @override
  String get displayClockDuringScreensaver =>
      'Паказаць гадзіннік падчас застаўкі';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (крытыкі)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (аўдыторыя)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Метакрытыка';

  @override
  String get metacriticUser => 'Metacritic (Карыстальнік)';

  @override
  String get trakt => 'Тракт';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Рэйтынг супольнасці';

  @override
  String get ratings => 'Ацэнкі';

  @override
  String get additionalRatings => 'Дадатковыя рэйтынгі';

  @override
  String get showMdbListAndTmdbRatings => 'Паказаць рэйтынгі MDBList і TMDB';

  @override
  String get ratingLabels => 'Рэйтынгавыя этыкеткі';

  @override
  String get showLabelsNextToIcons =>
      'Паказваць меткі побач са значкамі адзнак';

  @override
  String get ratingBadges => 'Рэйтынгавыя значкі';

  @override
  String get showDecorativeBadges =>
      'Паказваць дэкаратыўныя значкі за адзнакамі';

  @override
  String get episodeRatings => 'Рэйтынгі эпізодаў';

  @override
  String get showRatingsOnEpisodes => 'Паказваць рэйтынгі па асобных серыях';

  @override
  String get ratingSources => 'Крыніцы рэйтынгу';

  @override
  String get ratingSourcesDescription =>
      'Уключыце і змяніце парадак крыніц рэйтынгаў, паказаных ва ўсім дадатку';

  @override
  String get pluginLabel => 'Убудова';

  @override
  String get pluginDetected => 'Убудова выяўлены';

  @override
  String get pluginNotDetected => 'Плагін не выяўлены';

  @override
  String get pluginDetectedDescription =>
      'Выяўлены серверны плагін. Сінхранізацыя ўключаецца аўтаматычна пры першым знойдзеным плагіне.';

  @override
  String get pluginNotDetectedDescription =>
      'Серверны плагін зараз не выяўлены. Лакальныя налады па-ранейшаму выкарыстоўваюць свае захаваныя значэнні або ўбудаваныя значэнні па змаўчанні.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Даступныя паслугі';

  @override
  String get serverPluginSync => 'Сінхранізацыя плагіна сервера';

  @override
  String get syncSettingsWithPlugin => 'Сінхранізацыя налад з убудовай сервера';

  @override
  String get whatSyncControls => 'Якія элементы кіравання сінхранізацыяй';

  @override
  String get syncControlsDescription =>
      'Сінхранізацыя кантралюе толькі тое, ці будуць налады, якія падтрымліваюцца ўбудовамі, адпраўляцца на сервер і атрымліваць з яго. Выбар профілю і дзеянні сінхранізацыі профілю знаходзяцца ў наладах налады, калі ўключана сінхранізацыя плагіна.';

  @override
  String get recentRequests => 'Апошнія запыты';

  @override
  String get recentlyAdded => 'Нядаўна дададзены';

  @override
  String get trending => 'У трэндзе';

  @override
  String get popularMovies => 'Папулярныя фільмы';

  @override
  String get movieGenres => 'Жанры фільмаў';

  @override
  String get upcomingMovies => 'Будучыя фільмы';

  @override
  String get studios => 'Студыі';

  @override
  String get popularSeries => 'Папулярныя серыялы';

  @override
  String get seriesGenres => 'Жанры серыялаў';

  @override
  String get upcomingSeries => 'Будучыя серыі';

  @override
  String get networks => 'Сеткі';

  @override
  String get resetRowsToDefaults => 'Скінуць радкі да значэнняў па змаўчанні';

  @override
  String get enableSeerr => 'Уключыць Seerr';

  @override
  String get showSeerrInNavigation =>
      'Паказаць Seerr у навігацыі (патрабуецца плагін сервера)';

  @override
  String get seerrUnavailable =>
      'Недаступна, таму што падтрымка плагіна сервера Seerr адключана.';

  @override
  String get nsfwFilter => 'Фільтр NSFW';

  @override
  String get hideAdultContent => 'Схаваць змесціва для дарослых у выніках';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Адкрыйце для сябе радкі';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Перацягнуць, каб змяніць парадак. Уключыць або выключыць радкі. Уключаны парадак радкоў сінхранізуецца з убудовай Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Перацягнуць, каб змяніць парадак. Уключыць або выключыць радкі.';

  @override
  String get enabled => 'Уключана';

  @override
  String get hidden => 'Схаваны';

  @override
  String get aboutTitle => 'Аб';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Ліцэнзіі з адкрытым зыходным кодам';

  @override
  String get sourceCode => 'Зыходны код';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Праверце абнаўленні';

  @override
  String get checksLatestDesktopRelease =>
      'Правярае апошнюю версію настольнай версіі для гэтай платформы';

  @override
  String get youAreUpToDate => 'Вы ў курсе.';

  @override
  String get couldNotCheckForUpdates =>
      'Зараз немагчыма праверыць наяўнасць абнаўленняў.';

  @override
  String get noCompatibleUpdate =>
      'Для гэтай платформы не знойдзены сумяшчальны пакет абнаўленняў.';

  @override
  String get updateChecksNotSupported =>
      'Праверкі абнаўленняў не падтрымліваюцца на гэтай платформе.';

  @override
  String get updateNotificationsDisabled =>
      'Апавяшчэнні аб абнаўленнях адключаны.';

  @override
  String get pleaseWaitBeforeChecking => 'Пачакайце перад паўторнай праверкай.';

  @override
  String get latestUpdateAlreadyShown =>
      'Апошняе абнаўленне ўжо было паказана.';

  @override
  String get updateAvailable => 'Абнаўленне даступна.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Апавяшчэнні аб абнаўленні';

  @override
  String get showWhenUpdatesAvailable => 'Паказаць, калі абнаўленні даступныя';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Прачытайце заўвагі да выпуску';

  @override
  String get downloadingUpdate => 'Спампоўка абнаўлення...';

  @override
  String get updateDownloadFailed =>
      'Памылка спампоўкі абнаўлення. Калі ласка, паспрабуйце яшчэ раз.';

  @override
  String get openReleasesPage => 'Адкрыць старонку выпускаў';

  @override
  String get navigation => 'Навігацыя';

  @override
  String get watchedIndicatorsBackdrops => 'Глядзелі індыкатары, заднікі';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Колер фокусу, назіраныя індыкатары, фоны';

  @override
  String get navbarStyleToolbarAppearance =>
      'Стыль панэлі навігацыі, кнопкі панэлі інструментаў, знешні выгляд';

  @override
  String get reorderToggleHomeRows =>
      'Змяніць парадак і пераключыць хатнія радкі';

  @override
  String get featuredContentAppearance => 'Рэкамендаваны змест, знешні выгляд';

  @override
  String get posterSizeImageTypeFolderView =>
      'Памер плаката, тып выявы, выгляд папкі';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB і крыніцы рэйтынгаў';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Ясна';

  @override
  String get browse => 'Праглядзіце';

  @override
  String get noResults => 'Няма вынікаў';

  @override
  String get seerrAvailableStatus => 'Даступны';

  @override
  String get seerrRequestedStatus => 'Запытаны';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Налады Seerr';

  @override
  String get requestMore => 'Запытаць больш';

  @override
  String get request => 'Запыт';

  @override
  String get cancelRequest => 'Адмяніць запыт';

  @override
  String get playInMoonfin => 'Гуляць у Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Ухваліць';

  @override
  String get declineAction => 'адмовіцца';

  @override
  String get similar => 'Падобныя';

  @override
  String get recommendations => 'Рэкамендацыі';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Трымайце';

  @override
  String get itemNotFoundInLibrary =>
      'Прадмет не знойдзены ў вашай бібліятэцы Moonfin';

  @override
  String get errorSearchingLibrary => 'Памылка пошуку ў бібліятэцы';

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
  String get submitRequest => 'Адправіць запыт';

  @override
  String get allSeasons => 'Усе сезоны';

  @override
  String get advancedOptions => 'Дадатковыя параметры';

  @override
  String get noServiceServersConfigured => 'Серверы службы не настроены';

  @override
  String get server => 'Сервер';

  @override
  String get qualityProfile => 'Профіль якасці';

  @override
  String get rootFolder => 'Каранёвая тэчка';

  @override
  String get showMore => 'Паказаць больш';

  @override
  String get appearances => 'З\'яўленне';

  @override
  String get crewSection => 'Экіпаж';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Запытаў няма';

  @override
  String get pendingStatus => 'У чаканні';

  @override
  String get declinedStatus => 'Адхілена';

  @override
  String get partiallyAvailable => 'Часткова даступны';

  @override
  String get downloadingStatus => 'Ідзе загрузка';

  @override
  String get approvedStatus => 'Зацверджаны';

  @override
  String get notRequestedStatus => 'Не запытаны';

  @override
  String get blocklistedStatus => 'Заблакіраваны';

  @override
  String get deletedStatus => 'Выдалены';

  @override
  String get tmdbScore => 'Ацэнка TMDB';

  @override
  String get releaseDateLabel => 'Дата выпуску';

  @override
  String get firstAirDateLabel => 'Дата першага эфіру';

  @override
  String get revenueLabel => 'даход';

  @override
  String get runtimeLabel => 'Час выканання';

  @override
  String get budgetLabel => 'Бюджэт';

  @override
  String get originalLanguageLabel => 'Мова арыгінала';

  @override
  String get seasonsLabel => 'Поры года';

  @override
  String get episodesLabel => 'Эпізоды';

  @override
  String get access => 'Доступ';

  @override
  String get add => 'Дадаць';

  @override
  String get address => 'Адрас';

  @override
  String get analytics => 'Аналітыка';

  @override
  String get catalog => 'Каталог';

  @override
  String get content => 'Змест';

  @override
  String get copy => 'Копія';

  @override
  String get create => 'Ствараць';

  @override
  String get disable => 'Адключыць';

  @override
  String get done => 'Гатова';

  @override
  String get edit => 'Рэдагаваць';

  @override
  String get encoding => 'Кадзіроўка';

  @override
  String get error => 'Памылка';

  @override
  String get forward => 'Наперад';

  @override
  String get general => 'Генерал';

  @override
  String get go => 'Ідзі';

  @override
  String get install => 'Усталяваць';

  @override
  String get installed => 'Усталяваны';

  @override
  String get interval => 'Інтэрвал';

  @override
  String get name => 'Імя';

  @override
  String get networking => 'Сеткавыя сувязі';

  @override
  String get next => 'Далей';

  @override
  String get path => 'шлях';

  @override
  String get paused => 'Прыпынена';

  @override
  String get permissions => 'Дазволы';

  @override
  String get processing => 'Апрацоўка';

  @override
  String get profile => 'Профіль';

  @override
  String get provider => 'Правайдэр';

  @override
  String get refresh => 'Абнавіць';

  @override
  String get remote => 'Дыстанцыйнае';

  @override
  String get rename => 'Перайменаваць';

  @override
  String get revoke => 'Адклікаць';

  @override
  String get role => 'Роля';

  @override
  String get root => 'Корань';

  @override
  String get run => 'Бегчы';

  @override
  String get search => 'Пошук';

  @override
  String get select => 'Выберыце';

  @override
  String get send => 'Адправіць';

  @override
  String get sessions => 'Сесіі';

  @override
  String get set => 'Набор';

  @override
  String get status => 'Статус';

  @override
  String get stop => 'Стоп';

  @override
  String get streaming => 'Паток';

  @override
  String get time => 'Час';

  @override
  String get trickplay => 'Выкрут';

  @override
  String get uninstall => 'Выдаліць';

  @override
  String get up => 'Уверх';

  @override
  String get update => 'Абнаўленне';

  @override
  String get upload => 'Загрузіць';

  @override
  String get unmute => 'Уключыць гук';

  @override
  String get mute => 'Адключыць гук';

  @override
  String get branding => 'Брэндынг';

  @override
  String get adminDrawerDashboard => 'Прыборная панэль';

  @override
  String get adminDrawerAnalytics => 'Аналітыка';

  @override
  String get adminDrawerSettings => 'Налады';

  @override
  String get adminDrawerBranding => 'Брэндынг';

  @override
  String get adminDrawerUsers => 'Карыстальнікі';

  @override
  String get adminDrawerLibraries => 'Бібліятэкі';

  @override
  String get adminDrawerTranscoding => 'Перакадзіроўка';

  @override
  String get adminDrawerResume => 'Рэзюмэ';

  @override
  String get adminDrawerStreaming => 'Паток';

  @override
  String get adminDrawerTrickplay => 'Выкрут';

  @override
  String get adminDrawerDevices => 'прылады';

  @override
  String get adminDrawerActivity => 'актыўнасць';

  @override
  String get adminDrawerNetworking => 'Сеткавыя сувязі';

  @override
  String get adminDrawerApiKeys => 'Ключы API';

  @override
  String get adminDrawerBackups => 'Рэзервовыя копіі';

  @override
  String get adminDrawerLogs => 'Лагі';

  @override
  String get adminDrawerScheduledTasks => 'Запланаваныя заданні';

  @override
  String get adminDrawerPlugins => 'Убудовы';

  @override
  String get adminDrawerRepositories => 'Сховішчы';

  @override
  String get adminDrawerLiveTv => 'Жывое тэлебачанне';

  @override
  String get adminExitTooltip => 'Выйсці з адміністратара';

  @override
  String get adminDashboardLoadFailed =>
      'Не ўдалося загрузіць прыборную панэль';

  @override
  String get adminMediaOverview => 'Агляд СМІ';

  @override
  String get adminMediaTotalsError =>
      'Немагчыма загрузіць агульныя вынікі мультымедыя сервера.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Кароткае чытанне таго, колькі кантэнту знаходзіцца на гэтым серверы.';

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
  String get analyticsMediaDistribution => 'Распаўсюджванне СМІ';

  @override
  String get analyticsVideoCodecs => 'Відэа кодэкі';

  @override
  String get analyticsAudioCodecs => 'Аўдыё кодэкі';

  @override
  String get analyticsContainers => 'Кантэйнеры';

  @override
  String get analyticsTopGenres => 'Лепшыя жанры';

  @override
  String get analyticsReleaseYears => 'Гады выпуску';

  @override
  String get analyticsContentRatings => 'Рэйтынгі кантэнту';

  @override
  String get analyticsRuntimeBuckets => 'Кашыны часу выканання';

  @override
  String get analyticsFileFormats => 'Фарматы файлаў';

  @override
  String get analyticsNoData => 'Няма даступных даных.';

  @override
  String get adminServerInfo => 'Інфармацыя аб серверы';

  @override
  String get adminRestartPending => 'Чакаецца перазапуск';

  @override
  String get adminServerPaths => 'Шляхі да сервера';

  @override
  String get adminServerActions => 'Дзеянні сервера';

  @override
  String get adminRestartServer => 'Перазапусціце сервер';

  @override
  String get adminShutdownServer => 'Выключэнне сервера';

  @override
  String get adminScanLibraries => 'Бібліятэкі сканавання';

  @override
  String get adminLibraryScanStarted => 'Пачата сканаванне бібліятэкі';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Ідзе перазагрузка сервера';

  @override
  String get adminServerRebootMessage =>
      'Ідзе перазагрузка сервера, перазапусціце Moonfin';

  @override
  String get adminActiveSessions => 'Актыўныя сеансы';

  @override
  String get adminSessionsLoadFailed => 'Не ўдалося загрузіць сеансы';

  @override
  String get adminNoActiveSessions => 'Няма актыўных сеансаў';

  @override
  String get adminRecentActivity => 'Апошнія дзеянні';

  @override
  String get adminNoRecentActivity => 'Няма апошніх дзеянняў';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Адправіць паведамленне';

  @override
  String get adminMessageTextHint => 'Тэкст паведамлення';

  @override
  String get adminSetVolume => 'Усталюйце гучнасць';

  @override
  String get sessionPrev => 'Папярэд';

  @override
  String get sessionRewind => 'Перамотка назад';

  @override
  String get sessionForward => 'Наперад';

  @override
  String get sessionNext => 'Далей';

  @override
  String get sessionVolumeDown => 'Том -';

  @override
  String get sessionVolumeUp => 'Аб\'ём +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Зараз іграе';

  @override
  String get volume => 'Аб\'ём';

  @override
  String get actions => 'Дзеянні';

  @override
  String get videoCodec => 'Відэа кодэк';

  @override
  String get audioCodec => 'Аўдыё кодэк';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Завяршэнне';

  @override
  String get direct => 'Прамая';

  @override
  String get adminDisconnect => 'Адключыцца';

  @override
  String get adminClearDates => 'Выразныя даты';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Няма запісаў аб дзейнасці';

  @override
  String get adminEditDeviceName => 'Рэдагаваць назву прылады';

  @override
  String get adminCustomName => 'Карыстальніцкае імя';

  @override
  String get adminDeviceNameUpdated => 'Назва прылады абноўлена';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Выдаліць прыладу';

  @override
  String get adminDeviceDeleted => 'Прылада выдалена';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Не ўдалося загрузіць прылады';

  @override
  String get adminSearchDevices => 'Пошук прылад';

  @override
  String get adminThisDevice => 'Гэта прылада';

  @override
  String get adminEditName => 'Рэдагаваць імя';

  @override
  String get adminLibrariesLoadFailed => 'Не ўдалося загрузіць бібліятэкі';

  @override
  String get adminNoLibraries => 'Бібліятэкі не настроены';

  @override
  String get adminScanAllLibraries => 'Сканаваць усе бібліятэкі';

  @override
  String get adminAddLibrary => 'Дадаць бібліятэку';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Перайменаваць бібліятэку';

  @override
  String get adminNewName => 'Новая назва';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Выдаліць бібліятэку';

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
  String get adminRemovePath => 'Выдаліць шлях';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Параметры бібліятэкі захаваны';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Не ўдалося загрузіць бібліятэку';

  @override
  String get adminNoMediaPaths => 'Шляхі носьбітаў не настроены';

  @override
  String get adminAddPath => 'Дадаць шлях';

  @override
  String get adminBrowseFilesystem => 'Агляд файлавай сістэмы сервера:';

  @override
  String get adminSaveOptions => 'Параметры захавання';

  @override
  String get adminPreferredMetadataLanguage => 'Пераважная мова метададзеных';

  @override
  String get adminMetadataLanguageHint => 'напр. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Метададзеныя код краіны';

  @override
  String get adminMetadataCountryHint => 'напр. ЗША, Германія, Францыя';

  @override
  String get adminLibraryNameRequired => 'Увядзіце назву бібліятэкі';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Назва бібліятэкі';

  @override
  String get adminSelectedPaths => 'Выбраныя шляхі:';

  @override
  String get adminNoPathsAdded => 'Шляхі не дададзены (можна дадаць пазней)';

  @override
  String get adminCreateLibrary => 'Стварыць бібліятэку';

  @override
  String get paths => 'Шляхі:';

  @override
  String get adminDisableUser => 'Адключыць карыстальніка';

  @override
  String get adminEnableUser => 'Уключыць карыстальніка';

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
  String get adminUsersLoadFailed => 'Не ўдалося загрузіць карыстальнікаў';

  @override
  String get adminSearchUsers => 'Пошук карыстальнікаў';

  @override
  String get adminEditUser => 'Рэдагаваць карыстальніка';

  @override
  String get adminAddUser => 'Дадаць карыстальніка';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Стварыць карыстальніка';

  @override
  String get adminPasswordOptional => 'Пароль (неабавязкова)';

  @override
  String get adminUsernameRequired => 'Імя карыстальніка не можа быць пустым';

  @override
  String get adminNoProfileChanges => 'Няма змяненняў профілю для захавання';

  @override
  String get adminProfileSaved => 'Профіль захаваны';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Дазволы захаваны';

  @override
  String get adminPasswordsMismatch => 'Паролі не супадаюць';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Не ўдалося загрузіць карыстальніка';

  @override
  String get adminBackToUsers => 'Вярнуцца да карыстальнікаў';

  @override
  String get adminSaveProfile => 'Захаваць профіль';

  @override
  String get adminDeleteUser => 'Выдаліць карыстальніка';

  @override
  String get admin => 'Адмін';

  @override
  String get adminFullAccessWarning =>
      'Адміністратары маюць поўны доступ да сервера. Грант з асцярожнасцю.';

  @override
  String get administrator => 'Адміністратар';

  @override
  String get adminHiddenUser => 'Схаваны карыстальнік';

  @override
  String get adminAllowMediaPlayback => 'Дазволіць прайграванне мультымедыя';

  @override
  String get adminAllowAudioTranscoding => 'Дазволіць перакадзіраванне аўдыя';

  @override
  String get adminAllowVideoTranscoding => 'Дазволіць перакадзіраванне відэа';

  @override
  String get adminAllowRemuxing => 'Дазволіць рэмуксінг';

  @override
  String get adminForceRemoteTranscoding =>
      'Прымусовае перакадзіраванне аддаленай крыніцы';

  @override
  String get adminAllowContentDeletion => 'Дазволіць выдаленне кантэнту';

  @override
  String get adminAllowContentDownloading => 'Дазволіць спампоўку кантэнту';

  @override
  String get adminAllowPublicSharing => 'Дазволіць публічны доступ';

  @override
  String get adminAllowRemoteControl =>
      'Дазволіць дыстанцыйнае кіраванне іншымі карыстальнікамі';

  @override
  String get adminAllowSharedDeviceControl =>
      'Дазволіць агульнае кіраванне прыладай';

  @override
  String get adminAllowRemoteAccess => 'Дазволіць аддалены доступ';

  @override
  String get adminRemoteBitrateLimit =>
      'Ліміт бітрэйту аддаленага кліента (біт/с)';

  @override
  String get adminLeaveEmptyNoLimit =>
      'Пакіньце пустым, каб не было абмежаванняў';

  @override
  String get adminMaxActiveSessions => 'Максімальная колькасць актыўных сесій';

  @override
  String get adminAllowLiveTvAccess => 'Дазволіць доступ да ТБ у прамым эфіры';

  @override
  String get adminAllowLiveTvManagement =>
      'Дазволіць кіраванне ТБ у прамым эфіры';

  @override
  String get adminAllowCollectionManagement => 'Дазволіць кіраванне калекцыяй';

  @override
  String get adminAllowSubtitleManagement => 'Дазволіць кіраванне субтытрамі';

  @override
  String get adminAllowLyricManagement => 'Дазволіць кіраванне тэкстамі';

  @override
  String get adminSavePermissions => 'Захаваць дазволы';

  @override
  String get adminEnableAllLibraryAccess =>
      'Дазволіць доступ да ўсіх бібліятэк';

  @override
  String get adminSaveAccess => 'Захаваць доступ';

  @override
  String get adminChangePassword => 'Змяніць пароль';

  @override
  String get adminNewPassword => 'Новы пароль';

  @override
  String get adminConfirmPassword => 'Пацвердзіце пароль';

  @override
  String get adminSetPassword => 'Усталюйце пароль';

  @override
  String get adminResetPassword => 'Скінуць пароль';

  @override
  String get adminPasswordReset => 'Скід пароля';

  @override
  String get adminPasswordUpdated => 'Пароль абноўлены';

  @override
  String get adminUserSettings => 'Налады карыстальніка';

  @override
  String get adminLibraryAccess => 'Доступ да бібліятэкі';

  @override
  String get adminDeviceAndChannelAccess => 'Доступ да прылады і канала';

  @override
  String get adminEnableAllDevices => 'Уключыць доступ да ўсіх прылад';

  @override
  String get adminEnableAllChannels => 'Уключыць доступ да ўсіх каналаў';

  @override
  String get adminResetPasswordWarning =>
      'Гэта выдаліць пароль. Карыстальнік зможа ўвайсці без пароля.';

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
  String get adminCreateApiKey => 'Стварыць ключ API';

  @override
  String get adminAppName => 'Назва праграмы';

  @override
  String get adminApiKeyCreated => 'Ключ API створаны';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Ключ створаны паспяхова. Сервер не вярнуў токен. Праверце ключы API сервера.';

  @override
  String get adminKeyCopied => 'Ключ скапіраваны ў буфер абмену';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'У адказе сервера адсутнічае токен ключа';

  @override
  String get adminRevokeApiKey => 'Адклікаць ключ API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Ключ API ануляваны';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Не ўдалося загрузіць ключы API';

  @override
  String get adminApiKeysTitle => 'Ключы API';

  @override
  String get adminCreateKey => 'Стварыць ключ';

  @override
  String get adminNoApiKeys => 'Ключы API не знойдзены';

  @override
  String get adminUnknownApp => 'Невядомая праграма';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Стварэнне рэзервовай копіі...';

  @override
  String get adminBackupCreated => 'Рэзервовае капіраванне паспяхова створана';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Рэзервовы шлях адсутнічае ў адказе сервера';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Пацвердзіце аднаўленне';

  @override
  String get adminRestoringBackup => 'Аднаўленне рэзервовай копіі...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Не ўдалося загрузіць рэзервовыя копіі';

  @override
  String get adminCreateBackup => 'Стварыць рэзервовую копію';

  @override
  String get adminNoBackups => 'Рэзервовыя копіі не знойдзены';

  @override
  String get adminViewDetails => 'Глядзець падрабязнасці';

  @override
  String get restore => 'Аднавіць';

  @override
  String get adminLogsLoadFailed => 'Не ўдалося загрузіць журналы сервера';

  @override
  String get adminNoLogFiles => 'Файлы часопісаў не знойдзены';

  @override
  String get adminLogCopied => 'Журнал скапіраваны ў буфер абмену';

  @override
  String get adminSaveLogFile => 'Захаваць файл журнала';

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
  String get adminSearchInLog => 'Пошук у журнале';

  @override
  String get adminNoMatchingLines => 'Няма адпаведных радкоў';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Запланаваных заданняў не знойдзена';

  @override
  String get adminNoTasksMatchFilter =>
      'Няма задач, якія адпавядаюць бягучаму фільтру';

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
  String get adminRunNow => 'Бяжы зараз';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Апошняе пакаранне';

  @override
  String get adminTriggers => 'Трыгеры';

  @override
  String get adminAddTrigger => 'Дадаць трыгер';

  @override
  String get adminNoTriggers => 'Трыгеры не настроены';

  @override
  String get adminTriggerType => 'Тып трыгера';

  @override
  String get adminTimeLimit => 'Абмежаванне па часе (неабавязкова)';

  @override
  String get adminNoLimit => 'Няма абмежаванняў';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Дзень тыдня';

  @override
  String get adminSearchPlugins => 'Пошук плагінаў...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Выдаліць плагін';

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
      'Няма плагінаў, якія адпавядаюць вашаму пошуку';

  @override
  String get adminNoPluginsInstalled => 'Убудоў не ўстаноўлена';

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
      'Няма пакетаў, якія адпавядаюць вашаму пошуку';

  @override
  String get adminNoPackagesAvailable => 'Няма даступных пакетаў';

  @override
  String get adminExperimentalIntegration => 'Эксперыментальная інтэграцыя';

  @override
  String get adminExperimentalWarning =>
      'Інтэграцыя налад плагіна ўсё яшчэ эксперыментальная. Некаторыя старонкі налад могуць адлюстроўвацца няправільна.';

  @override
  String get continueAction => 'Працягнуць';

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
      'Немагчыма адкрыць налады: адсутнічае маркер аўтарызацыі.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Плагін не знойдзены';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Уключыць убудову';

  @override
  String get adminPluginSettingsPage => 'Старонка налад плагіна';

  @override
  String get adminRevisionHistory => 'Гісторыя версій';

  @override
  String get adminNoChangelog => 'Журнал змяненняў адсутнічае.';

  @override
  String get adminRemoveRepository => 'Выдаліць рэпазітар';

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
  String get adminRepositoryUrl => 'URL рэпазітара';

  @override
  String get adminAddEntry => 'Дадаць запіс';

  @override
  String get adminInvalidUrl => 'Няправільны URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Адкрыць у браўзеры';

  @override
  String get adminOpenExternally => 'Адкрыты звонку';

  @override
  String get adminGeneralSettings => 'Агульныя налады';

  @override
  String get adminServerName => 'Імя сервера';

  @override
  String get adminPreferredMetadataCountry => 'Пераважная краіна метаданых';

  @override
  String get adminCachePath => 'Шлях кэша';

  @override
  String get adminMetadataPath => 'Шлях метаданых';

  @override
  String get adminLibraryScanConcurrency => 'Паралельнае сканаванне бібліятэкі';

  @override
  String get adminParallelImageEncodingLimit =>
      'Ліміт паралельнага кадавання выявы';

  @override
  String get adminSlowResponseThreshold => 'Парог павольнай рэакцыі (мс)';

  @override
  String get adminBrandingSaved => 'Налады брэндынгу захаваны';

  @override
  String get adminBrandingLoadFailed => 'Не ўдалося загрузіць налады брэндынгу';

  @override
  String get adminLoginDisclaimer => 'Адмова ад ўваходу';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML, які адлюстроўваецца пад формай уваходу';

  @override
  String get adminCustomCss => 'Карыстальніцкі CSS';

  @override
  String get adminCustomCssHint =>
      'Карыстальніцкі CSS, ужыты да вэб-інтэрфейсу';

  @override
  String get adminEnableSplashScreen => 'Уключыць застаўку';

  @override
  String get adminStreamingSaved => 'Налады патоку захаваны';

  @override
  String get adminStreamingLoadFailed =>
      'Не атрымалася загрузіць налады струменевай перадачы';

  @override
  String get adminStreamingDescription =>
      'Усталюйце глабальныя ліміты бітрэйту струменевай перадачы для аддаленых злучэнняў.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ліміт бітрэйту аддаленага кліента (Мбіт/с)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Пакіньце пустым або 0 для неабмежаванага';

  @override
  String get adminPlaybackSaved => 'Налады прайгравання захаваны';

  @override
  String get adminPlaybackLoadFailed =>
      'Не ўдалося загрузіць налады прайгравання';

  @override
  String get adminPlaybackTranscoding => 'Прайграванне / перакадзіраванне';

  @override
  String get adminHardwareAcceleration => 'Апаратнае паскарэнне';

  @override
  String get adminVaapiDevice => 'Прылада VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Уключыць апаратнае кадзіраванне';

  @override
  String get adminEnableHardwareDecoding =>
      'Уключыць апаратнае дэкадаванне для:';

  @override
  String get adminEncodingThreads => 'Кадзіроўка нітак';

  @override
  String get adminAutomatic => '0 = аўтаматычны';

  @override
  String get adminTranscodingTempPath => 'Часовы шлях перакадзіравання';

  @override
  String get adminEnableFallbackFont => 'Уключыць рэзервовы шрыфт';

  @override
  String get adminFallbackFontPath => 'Шлях рэзервовага шрыфта';

  @override
  String get adminAllowSegmentDeletion => 'Дазволіць выдаленне сегмента';

  @override
  String get adminSegmentKeepSeconds => 'Працягласць сегмента (секунды)';

  @override
  String get adminThrottleBuffering => 'Буферызацыя дросельнай засланкі';

  @override
  String get adminTrickplaySaved => 'Налады Trickplay захаваны';

  @override
  String get adminTrickplayLoadFailed =>
      'Не ўдалося загрузіць налады trickplay';

  @override
  String get adminEnableHardwareAcceleration => 'Уключыць апаратнае паскарэнне';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Уключыць выманне толькі ключавых кадраў';

  @override
  String get adminKeyFrameSubtitle => 'Хутчэй, але з меншай дакладнасцю';

  @override
  String get adminScanBehavior => 'Паводзіны сканавання';

  @override
  String get adminProcessPriority => 'Прыярытэт працэсу';

  @override
  String get adminImageSettings => 'Налады выявы';

  @override
  String get adminIntervalMs => 'Інтэрвал (мс)';

  @override
  String get adminCaptureFrameSubtitle => 'Як часта здымаць кадры';

  @override
  String get adminWidthResolutions => 'Раздзяленні па шырыні';

  @override
  String get adminTileWidth => 'Шырыня пліткі';

  @override
  String get adminTileHeight => 'Вышыня пліткі';

  @override
  String get adminQualitySubtitle =>
      'Больш нізкія значэнні = лепшая якасць, большыя файлы';

  @override
  String get adminProcessThreads => 'Апрацаваць ніткі';

  @override
  String get adminResumeSaved => 'Налады рэзюмэ захаваны';

  @override
  String get adminResumeLoadFailed => 'Не ўдалося загрузіць налады рэзюмэ';

  @override
  String get adminResumeDescription =>
      'Наладзьце, калі змесціва павінна быць пазначана як прайгранае часткова або прайгранае цалкам.';

  @override
  String get adminMinResumePercentage => 'Мінімальны працэнт рэзюмэ';

  @override
  String get adminMinResumeSubtitle =>
      'Змесціва павінна быць прайграна пасля гэтага адсотка, каб захаваць прагрэс';

  @override
  String get adminMaxResumePercentage => 'Максімальны працэнт рэзюмэ';

  @override
  String get adminMaxResumeSubtitle =>
      'Кантэнт лічыцца цалкам прайграным пасля гэтага працэнта';

  @override
  String get adminMinResumeDuration =>
      'Мінімальная працягласць аднаўлення (секунды)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Элементы, карацейшыя за гэты, нельга аднавіць';

  @override
  String get adminMinAudiobookResume => 'Мінімальны працэнт рэзюмэ аўдыякніг';

  @override
  String get adminMaxAudiobookResume => 'Максімальны працэнт рэзюмэ аўдыякніг';

  @override
  String get adminNetworkingSaved =>
      'Налады сеткі захаваны. Можа спатрэбіцца перазапуск сервера.';

  @override
  String get adminNetworkingLoadFailed => 'Не ўдалося загрузіць налады сеткі';

  @override
  String get adminNetworkingWarning =>
      'Змены налад сеткі могуць запатрабаваць перазагрузкі сервера.';

  @override
  String get adminEnableRemoteAccess => 'Уключыць аддалены доступ';

  @override
  String get ports => 'Парты';

  @override
  String get adminHttpPort => 'Порт HTTP';

  @override
  String get adminHttpsPort => 'Порт HTTPS';

  @override
  String get adminPublicHttpsPort => 'Публічны порт HTTPS';

  @override
  String get adminBaseUrl => 'Базавы URL';

  @override
  String get adminBaseUrlHint => 'напр. /жэле';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Уключыць HTTPS';

  @override
  String get adminLocalNetwork => 'Лакальная сетка';

  @override
  String get adminLocalNetworkAddresses => 'Адрасы лакальнай сеткі';

  @override
  String get adminKnownProxies => 'Вядомыя проксі';

  @override
  String get adminRemoteIpFilter => 'Аддалены IP-фільтр';

  @override
  String get adminRemoteIpFilterEntries => 'Аддалены IP-фільтр';

  @override
  String get adminCertificatePath => 'Шлях сертыфіката';

  @override
  String get whitelist => 'Белы спіс';

  @override
  String get blacklist => 'Чорны спіс';

  @override
  String get notSet => 'Не ўстаноўлена';

  @override
  String get adminMetadataSaved => 'Метададзеныя захаваны';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Абнавіць метаданыя';

  @override
  String get recursive => 'Рэкурсіўны';

  @override
  String get adminReplaceAllMetadata => 'Замяніць усе метаданыя';

  @override
  String get adminReplaceAllImages => 'Замяніць усе выявы';

  @override
  String get adminMetadataRefreshRequested => 'Запытана абнаўленне метаданых';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Пошук аддаленага чалавека';

  @override
  String get adminNoRemoteMatches => 'Аддаленых супадзенняў не знойдзена';

  @override
  String get adminRemoteResults => 'Аддаленыя вынікі';

  @override
  String get adminRemoteMetadataApplied => 'Ужытыя аддаленыя метаданыя';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Абнавіць тып кантэнту';

  @override
  String get adminContentType => 'Тып кантэнту';

  @override
  String get adminContentTypeUpdated => 'Тып кантэнту абноўлены';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Не ўдалося загрузіць рэдактар ​​метададзеных';

  @override
  String get adminNoPeopleEntries => 'Няма запісаў людзей';

  @override
  String get adminNoExternalIds => 'Няма даступных знешніх ідэнтыфікатараў';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Фармат выявы не падтрымліваецца';

  @override
  String get adminImageReadFailed => 'Не ўдалося прачытаць выбраную выяву';

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
  String get adminAllProviders => 'Усе правайдэры';

  @override
  String get adminNoRemoteImages => 'Аддаленыя выявы не знойдзены';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Дадаць цюнэр';

  @override
  String get adminTunerType => 'Тып цюнэра';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, іншае';

  @override
  String get adminUrlPath => 'URL / Шлях';

  @override
  String get adminNameOptional => 'Імя (неабавязкова)';

  @override
  String get adminTunerAdded => 'Цюнэр дададзены';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Дадаць пастаўшчыка гіда';

  @override
  String get adminProviderType => 'Тып пастаўшчыка';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect або XMLTV';

  @override
  String get adminUsernameOptional => 'Імя карыстальніка (неабавязкова)';

  @override
  String get adminRefreshInterval => 'Інтэрвал абнаўлення (гадзіны)';

  @override
  String get adminProviderAdded => 'Пастаўшчык дададзены';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Запытаны скід цюнера';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Налады запісу';

  @override
  String get adminPrePadding => 'Папярэдняя абіўка (хвілін)';

  @override
  String get adminPostPadding => 'Запаўненне (хвіліны)';

  @override
  String get adminRecordingPath => 'Шлях запісу';

  @override
  String get adminSeriesRecordingPath => 'Шлях запісу серыі';

  @override
  String get adminRecordingSettingsSaved => 'Налады запісу захаваны';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Наладзіць супастаўленне каналаў';

  @override
  String get adminMappingJson => 'Адлюстраванне JSON';

  @override
  String get adminMappingJsonHint =>
      'Прыклад: адлюстраванне карыснай нагрузкі JSON';

  @override
  String get adminChannelMappingsUpdated => 'Адлюстраванні каналаў абноўлены';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Не ўдалося загрузіць адміністраванне Live TV';

  @override
  String get adminTunerDevices => 'Цюнэры прылад';

  @override
  String get adminNoTunerHosts => 'Хасты цюнэра не настроены';

  @override
  String get adminGuideProviders => 'Пастаўшчыкі гідаў';

  @override
  String get adminAddProvider => 'Дадаць пастаўшчыка';

  @override
  String get adminNoListingProviders => 'Пастаўшчыкі спісаў не настроены';

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
  String get adminTunerDiscovery => 'Адкрыццё цюнэра';

  @override
  String get adminChannelMappings => 'Адлюстраванне каналаў';

  @override
  String get adminNoDiscoveredTuners => 'Пакуль няма выяўленых цюнэраў';

  @override
  String get adminSettingsSaved => 'Налады захаваны';

  @override
  String get adminBackupsNotAvailable =>
      'Рэзервовыя копіі недаступныя на гэтай зборцы сервера.';

  @override
  String get adminRestoreWarning1 =>
      'Пры аднаўленні УСЕ бягучыя даныя сервера будуць заменены дадзенымі рэзервовай копіі.';

  @override
  String get adminRestoreWarning2 =>
      'Бягучыя налады сервера, карыстальнікі і дадзеныя бібліятэкі будуць перазапісаны.';

  @override
  String get adminRestoreWarning3 => 'Пасля аднаўлення сервер перазапусціцца.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Запыт на аднаўленне. Перазапуск сервера можа адключыць гэты сеанс.';

  @override
  String get adminBackupsTitle => 'Рэзервовыя копіі';

  @override
  String get adminUnknownDate => 'Невядомая дата';

  @override
  String get adminUnnamedBackup => 'Рэзервовае капіраванне без назвы';

  @override
  String get adminLiveTvNotAvailable =>
      'Адміністраванне Live TV недаступна на гэтай зборцы сервера.';

  @override
  String get adminLiveTvTitle => 'Адміністрацыя Live TV';

  @override
  String get adminApply => 'Ужыць';

  @override
  String get adminNotSet => 'Не ўстаноўлена';

  @override
  String get adminReset => 'Скінуць';

  @override
  String get adminLogsTitle => 'Журналы сервера';

  @override
  String get adminLogsNewestFirst => 'Спачатку найноўшыя';

  @override
  String get adminLogsOldestFirst => 'Спачатку самыя старыя';

  @override
  String get adminLogsJustNow => 'Толькі што';

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
  String get adminLogViewerNoMatches => 'Няма адпаведных радкоў';

  @override
  String get adminMetadataEditorTitle => 'Рэдактар ​​метададзеных';

  @override
  String get adminMetadataRemote => 'Дыстанцыйнае';

  @override
  String get adminMetadataType => 'Тып';

  @override
  String get adminMetadataDetails => 'Дэталі';

  @override
  String get adminMetadataExternalIds => 'Знешнія ідэнтыфікатары';

  @override
  String get adminMetadataImages => 'Малюнкі';

  @override
  String get adminMetadataFieldTitle => 'Назва';

  @override
  String get adminMetadataFieldSortTitle => 'Назва сартавання';

  @override
  String get adminMetadataFieldOriginalTitle => 'Арыгінальная назва';

  @override
  String get adminMetadataFieldPremiereDate => 'Дата прэм\'еры (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldEndDate => 'Дата заканчэння (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldProductionYear => 'Год вытворчасці';

  @override
  String get adminMetadataFieldOfficialRating => 'Афіцыйны рэйтынг';

  @override
  String get adminMetadataFieldCommunityRating => 'Рэйтынг супольнасці';

  @override
  String get adminMetadataFieldCriticRating => 'Рэйтынг крытыкаў';

  @override
  String get adminMetadataFieldTagline => 'Слоган';

  @override
  String get adminMetadataFieldOverview => 'Агляд';

  @override
  String get adminMetadataGenres => 'Жанры';

  @override
  String get adminMetadataTags => 'Тэгі';

  @override
  String get adminMetadataStudios => 'Студыі';

  @override
  String get adminMetadataPeople => 'Людзі';

  @override
  String get adminMetadataAddGenre => 'Дадаць жанр';

  @override
  String get adminMetadataAddTag => 'Дадаць тэг';

  @override
  String get adminMetadataAddStudio => 'Дадаць студыю';

  @override
  String get adminMetadataAddPerson => 'Дадаць чалавека';

  @override
  String get adminMetadataEditPerson => 'Рэдагаваць асобу';

  @override
  String get adminMetadataRole => 'Роля';

  @override
  String get adminMetadataImagePrimary => 'Першасны';

  @override
  String get adminMetadataImageBackdrop => 'Фон';

  @override
  String get adminMetadataImageLogo => 'Лагатып';

  @override
  String get adminMetadataImageBanner => 'Расцяжка';

  @override
  String get adminMetadataImageThumb => 'Вялікі палец';

  @override
  String get adminMetadataRecursive => 'Рэкурсіўны';

  @override
  String get adminMetadataProvider => 'Правайдэр';

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
      'Не ўдалося прачытаць выбраную выяву';

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
      'Гэта выдаляе бягучую выяву з элемента.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Загрузіць';

  @override
  String get adminMetadataUpdate => 'Абнаўленне';

  @override
  String get adminMetadataRemoteImage => 'Выдалены малюнак';

  @override
  String get adminPluginsInstalled => 'Усталяваны';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Актыўны';

  @override
  String get adminPluginsRestart => 'Перазапуск';

  @override
  String get adminPluginsNoSearchResults =>
      'Няма плагінаў, якія адпавядаюць вашаму пошуку';

  @override
  String get adminPluginsNoneInstalled => 'Убудоў не ўстаноўлена';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Абнаўленне даступна';

  @override
  String get adminPluginsPendingRemoval => 'Чакае выдалення пасля перазапуску';

  @override
  String get adminPluginsChangesPending => 'Змены чакаюць перазапуску';

  @override
  String get adminPluginsEnable => 'Уключыць';

  @override
  String get adminPluginsDisable => 'Адключыць';

  @override
  String get adminPluginsInstallUpdate => 'Усталяваць абнаўленне';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Няма пакетаў, якія адпавядаюць вашаму пошуку';

  @override
  String get adminPluginsCatalogEmpty => 'Няма даступных пакетаў';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Эксперыментальная інтэграцыя';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Інтэграцыя налад плагіна ўсё яшчэ эксперыментальная. Некаторыя палі або макеты пакуль могуць адлюстроўвацца няправільна.';

  @override
  String get adminPluginDetailToggle404 =>
      'Не ўдалося пераключыць плагін. Сервер не можа знайсці гэту версію плагіна. Паспрабуйце абнавіць плагіны, а потым паўтарыце спробу.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Не ўдалося пераключыць плагін. Падрабязнасці праверце ў журналах сервера.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Дэталі';

  @override
  String get adminPluginDetailDeveloper => 'Распрацоўшчык';

  @override
  String get adminPluginDetailRepository => 'Сховішча';

  @override
  String get adminPluginDetailBundled => 'У камплекце';

  @override
  String get adminPluginDetailEnablePlugin => 'Уключыць убудову';

  @override
  String get adminPluginDetailRestartRequired =>
      'Каб змены ўступілі ў сілу, патрабуецца перазапуск сервера.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Гэты плагін будзе выдалены пасля перазапуску сервера.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Гэты плагін працаваў няправільна і можа працаваць некарэктна.';

  @override
  String get adminPluginDetailNotSupported =>
      'Гэты плагін не падтрымліваецца бягучай версіяй сервера.';

  @override
  String get adminPluginDetailSuperseded =>
      'Гэты плагін быў заменены больш новай версіяй.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Выдаліць рэпазітар';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Зняць';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Рэпазітары не настроены';

  @override
  String get adminReposEmptySubtitle =>
      'Дадайце рэпазітар для прагляду даступных плагінаў';

  @override
  String get adminReposUnnamed => '(без назвы)';

  @override
  String get adminReposEditTitle => 'Рэдагаваць рэпазітар';

  @override
  String get adminReposAddTitle => 'Дадаць рэпазітар';

  @override
  String get adminReposUrl => 'URL рэпазітара';

  @override
  String get adminReposNameHint => 'напр. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Няправільны URL';

  @override
  String get adminGeneralSettingsTitle => 'Агульныя налады';

  @override
  String get adminGeneralMetadataLanguage => 'Пераважная мова метададзеных';

  @override
  String get adminGeneralMetadataLanguageHint => 'напр. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Пераважная краіна метаданых';

  @override
  String get adminGeneralMetadataCountryHint => 'напр. ЗША, Германія, Францыя';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Паралельнае сканаванне бібліятэкі';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Ліміт паралельнага кадавання выявы';

  @override
  String get adminUnknownError => 'Невядомая памылка';

  @override
  String get adminBrowse => 'Праглядзіце';

  @override
  String get adminCloseBrowser => 'Зачыніце браўзер';

  @override
  String get adminNetworkingTitle => 'Сеткавыя сувязі';

  @override
  String get adminNetworkingRestartWarning =>
      'Змены налад сеткі могуць запатрабаваць перазагрузкі сервера.';

  @override
  String get adminNetworkingRemoteAccess => 'Уключыць аддалены доступ';

  @override
  String get adminNetworkingPorts => 'Парты';

  @override
  String get adminNetworkingHttpPort => 'Порт HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Порт HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Уключыць HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Лакальная сетка';

  @override
  String get adminNetworkingLocalAddresses => 'Адрасы лакальнай сеткі';

  @override
  String get adminNetworkingAddressHint => 'напр. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Вядомыя проксі';

  @override
  String get adminNetworkingProxyHint => 'напр. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Белы спіс';

  @override
  String get adminNetworkingBlacklist => 'Чорны спіс';

  @override
  String get adminNetworkingAddEntry => 'Дадаць запіс';

  @override
  String get adminBrandingTitle => 'Брэндынг';

  @override
  String get adminBrandingLoginDisclaimer => 'Адмова ад ўваходу';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML, які адлюстроўваецца пад формай уваходу';

  @override
  String get adminBrandingCustomCss => 'Карыстальніцкі CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Карыстальніцкі CSS, ужыты да вэб-інтэрфейсу';

  @override
  String get adminBrandingEnableSplash => 'Уключыць застаўку';

  @override
  String get adminPlaybackHwAccel => 'Апаратнае паскарэнне';

  @override
  String get adminPlaybackHwAccelLabel => 'Апаратнае паскарэнне';

  @override
  String get adminPlaybackEnableHwEncoding => 'Уключыць апаратнае кадзіраванне';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Уключыць апаратнае дэкадаванне для:';

  @override
  String get adminPlaybackEncoding => 'Кадзіроўка';

  @override
  String get adminPlaybackEncodingThreads => 'Кадзіроўка нітак';

  @override
  String get adminPlaybackFallbackFont => 'Уключыць рэзервовы шрыфт';

  @override
  String get adminPlaybackFallbackFontPath => 'Шлях рэзервовага шрыфта';

  @override
  String get adminPlaybackStreaming => 'Паток';

  @override
  String get adminResumeVideo => 'Відэа';

  @override
  String get adminResumeAudiobooks => 'Аўдыёкніжкі';

  @override
  String get adminResumeMinAudiobookPct =>
      'Мінімальны працэнт рэзюмэ аўдыякніг';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Максімальны працэнт рэзюмэ аўдыякніг';

  @override
  String get adminStreamingBitrateLimit =>
      'Ліміт бітрэйту аддаленага кліента (Мбіт/с)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Пакіньце пустым або 0 для неабмежаванага';

  @override
  String get adminTrickplayHwAccel => 'Уключыць апаратнае паскарэнне';

  @override
  String get adminTrickplayHwEncoding => 'Уключыць апаратнае кадзіраванне';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Уключыць выманне толькі ключавых кадраў';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Хутчэй, але з меншай дакладнасцю';

  @override
  String get adminTrickplayNonBlocking => 'Неблакіравальны';

  @override
  String get adminTrickplayBlocking => 'Блакаванне';

  @override
  String get adminTrickplayPriorityHigh => 'Высокі';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Вышэй за норму';

  @override
  String get adminTrickplayPriorityNormal => 'Нармальны';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Ніжэй нармальнага';

  @override
  String get adminTrickplayPriorityIdle => 'Бяздзейны';

  @override
  String get adminTrickplayImageSettings => 'Налады выявы';

  @override
  String get adminTrickplayInterval => 'Інтэрвал (мс)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Як часта здымаць кадры';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Шырыня пікселяў, падзеленыя коскамі (напрыклад, 320)';

  @override
  String get adminTrickplayQuality => 'Якасць';

  @override
  String get adminTrickplayQScale => 'Шкала якасці';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Больш нізкія значэнні = лепшая якасць, большыя файлы';

  @override
  String get adminTrickplayJpegQuality => 'Якасць JPEG';

  @override
  String get adminTrickplayProcessing => 'Апрацоўка';

  @override
  String get adminTasksEmpty => 'Запланаваных заданняў не знойдзена';

  @override
  String get adminTasksNoFilterMatch =>
      'Няма задач, якія адпавядаюць бягучаму фільтру';

  @override
  String get adminTaskCancelling => 'Адмена...';

  @override
  String get adminTaskRunning => 'Запуск...';

  @override
  String get adminTaskNeverRun => 'Ніколі не бегайце';

  @override
  String get adminTaskStop => 'Стоп';

  @override
  String get adminTaskRun => 'Бегчы';

  @override
  String get adminTaskDetailLastExecution => 'Апошняе пакаранне';

  @override
  String get adminTaskDetailStarted => 'Пачалі';

  @override
  String get adminTaskDetailEnded => 'Скончылася';

  @override
  String get adminTaskDetailDuration => 'Працягласць';

  @override
  String get adminTaskDetailErrorLabel => 'Памылка:';

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
  String get adminTaskTriggerStartup => 'Пры запуску прыкладання';

  @override
  String get adminTaskTriggerTypeDaily => 'Штодня';

  @override
  String get adminTaskTriggerTypeWeekly => 'Штотыдзень';

  @override
  String get adminTaskTriggerTypeInterval => 'На інтэрвале';

  @override
  String get adminTaskTriggerIntervalLabel => 'Інтэрвал';

  @override
  String get adminTaskTriggerEveryHour => 'Кожную гадзіну';

  @override
  String get adminTaskTriggerEvery6Hours => 'Кожныя 6 гадзін';

  @override
  String get adminTaskTriggerEvery12Hours => 'Кожныя 12 гадзін';

  @override
  String get adminTaskTriggerEvery24Hours => 'Кожныя 24 гадзіны';

  @override
  String get adminTaskTriggerEvery2Days => 'Кожныя 2 дні';

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
  String get adminTaskTriggerTime => 'Час';

  @override
  String get adminTaskTriggerNoLimit => 'Няма абмежаванняў';

  @override
  String get adminActivityJustNow => 'Толькі што';

  @override
  String get adminActivityLastHour => 'Апошняя гадзіна';

  @override
  String get adminActivityToday => 'сёння';

  @override
  String get adminActivityYesterday => 'Учора';

  @override
  String get adminActivityOlder => 'Старэйшы';

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
  String get adminActivityNow => 'зараз';

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
      'Наладзьце генерацыю відарысаў падману для эскізаў папярэдняга прагляду.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Публічны порт HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Базавы URL';

  @override
  String get adminNetworkingBaseUrlHint => 'напр. /жэле';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Шлях сертыфіката';

  @override
  String get adminNetworkingRemoteIpFilter => 'Аддалены IP-фільтр';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Аддалены IP-фільтр';

  @override
  String get adminPlaybackVaapiDevice => 'Прылада VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = аўтаматычны';

  @override
  String get adminPlaybackTranscodeTempPath => 'Часовы шлях перакадзіравання';

  @override
  String get adminPlaybackSegmentDeletion => 'Дазволіць выдаленне сегмента';

  @override
  String get adminPlaybackSegmentKeep => 'Працягласць сегмента (секунды)';

  @override
  String get adminPlaybackThrottleBuffering =>
      'Буферызацыя дросельнай засланкі';

  @override
  String get adminResumeMinPct => 'Мінімальны працэнт рэзюмэ';

  @override
  String get adminResumeMinPctSubtitle =>
      'Змесціва павінна быць прайграна пасля гэтага адсотка, каб захаваць прагрэс';

  @override
  String get adminResumeMaxPct => 'Максімальны працэнт рэзюмэ';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Кантэнт лічыцца цалкам прайграным пасля гэтага працэнта';

  @override
  String get adminResumeMinDuration =>
      'Мінімальная працягласць аднаўлення (секунды)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Элементы, карацейшыя за гэты, нельга аднавіць';

  @override
  String get adminTrickplayScanBehavior => 'Паводзіны сканавання';

  @override
  String get adminTrickplayProcessPriority => 'Прыярытэт працэсу';

  @override
  String get adminTrickplayTileWidth => 'Шырыня пліткі';

  @override
  String get adminTrickplayTileHeight => 'Вышыня пліткі';

  @override
  String get adminTrickplayProcessThreads => 'Апрацаваць ніткі';

  @override
  String get adminTrickplayWidthResolutions => 'Раздзяленні па шырыні';

  @override
  String get adminMetadataDefault => 'Па змаўчанні';

  @override
  String get adminMetadataContentTypeUpdated => 'Тып кантэнту абноўлены';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Парог павольнай рэакцыі (мс)';

  @override
  String get adminGeneralCachePath => 'Шлях кэша';

  @override
  String get adminGeneralMetadataPath => 'Шлях метаданых';

  @override
  String get adminGeneralServerName => 'Імя сервера';

  @override
  String get adminSettingsLoadFailed => 'Не ўдалося загрузіць налады';

  @override
  String get adminDiscover => 'Адкрыйце для сябе';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Папкі';

  @override
  String get libraries => 'Бібліятэкі';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay адключаны';

  @override
  String get syncPlayDisabledMessage =>
      'Каб выкарыстоўваць сінхранізаванае прайграванне, уключыце SyncPlay у наладах.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сервер не падтрымліваецца';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay патрабуе сервера Jellyfin. Бягучы сервер не падтрымлівае гэта.';

  @override
  String get syncPlayGroupFallbackName => 'Група SyncPlay';

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
  String get syncPlayIgnoreWait => 'Ігнараваць чаканне';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Не затрымлівайце групу падчас буферызацыі гэтай прылады';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Працягвайце лакальна, не чакаючы павольных удзельнікаў';

  @override
  String get syncPlayRepeat => 'Паўтарыць';

  @override
  String get syncPlayRepeatOne => 'адзін';

  @override
  String get syncPlayShuffleModeShuffled => 'Ператасавалі';

  @override
  String get syncPlayShuffleModeSorted => 'Адсартавана';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Сінхранізаваць бягучую чаргу прайгравання';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Заменіце чаргу групы тым, што прайграваецца лакальна';

  @override
  String get syncPlayLeaveGroup => 'Пакінуць групу';

  @override
  String get syncPlayGroupQueue => 'Групавая чарга';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Гуляць зараз';

  @override
  String get syncPlayCreateNewGroup => 'Стварыце новую групу';

  @override
  String get syncPlayGroupName => 'Назва групы';

  @override
  String get syncPlayDefaultGroupName => 'Мая група SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Стварыць групу';

  @override
  String get syncPlayAvailableGroups => 'Даступныя групы';

  @override
  String get syncPlayNoGroupsAvailable => 'Няма даступных груп';

  @override
  String get syncPlayJoinGroupQuestion => 'Далучыцца да групы SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Далучэнне да групы SyncPlay можа замяніць бягучую чаргу прайгравання. Працягнуць?';

  @override
  String get syncPlayJoin => 'Далучайцеся';

  @override
  String get syncPlayStateIdle => 'Бяздзейны';

  @override
  String get syncPlayStateWaiting => 'Чаканне';

  @override
  String get syncPlayStatePaused => 'Прыпынена';

  @override
  String get syncPlayStatePlaying => 'Гуляючы';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Доступ да SyncPlay забаронены';

  @override
  String get syncPlayAccessDeniedMessage =>
      'You do not have access to one or more items in this SyncPlay group. Папрасіце ўладальніка групы праверыць дазволы бібліятэкі або выбраць іншую чаргу.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Галасавы пошук недаступны.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Збой Dolby Vision Direct Play';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Не ўдалося пачаць прамое прайграванне для гэтага патоку Dolby Vision. Паўтарыць з дапамогай перакадзіравання сервера?';

  @override
  String get retryWithTranscode => 'Паўтарыце спробу з перакадзіраваннем';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision не падтрымліваецца';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Гэта прылада не можа дэкадаваць кантэнт Dolby Vision непасрэдна. Выкарыстоўвайце рэзервовы рэжым HDR10 або запытайце перакадзіраванне сервера.';

  @override
  String get rememberMyChoice => 'Запомні мой выбар';

  @override
  String get playHdr10Fallback => 'Гуляць у запасны HDR10';

  @override
  String get requestTranscode => 'Запытаць перакадзіраванне';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Выяўляйце радкі, адкрытыя плагінам IAmParadox27 \"Раздзелы галоўнага экрана\". Rows can be enabled and reordered below.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Серверы Jellyfin пакуль не паведамляюць аб плагіне.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Выяўляць радкі, настроеныя з дапамогай плагіна \"KefinTweaks\" ranaldsgift. Карыстальніцкія раздзелы, нядаўна выпушчаныя, яшчэ раз, сезонныя і нядаўна дададзеныя ў бібліятэку адлюстроўваюцца з канфігурацыі KefinTweaks на кожным серверы Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Пакуль няма сервераў Jellyfin, якія паведамляюць пра KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Адкрыйце хатнія раздзелы';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Уключыць, адключыць і змяніць парадак радкоў';

  @override
  String get integrationInstalledButDisabled => 'Усталяваны, але адключаны';

  @override
  String get integrationNotInstalled => 'Не ўстаноўлены';

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
  String get seeAll => 'Глядзець усе';

  @override
  String get noItems => 'Няма элементаў';

  @override
  String get switchUser => 'Змяніць карыстальніка';

  @override
  String get remoteControl => 'Пульт дыстанцыйнага кіравання';

  @override
  String get mediaBarLoading => 'Загрузка медыяпанэлі...';

  @override
  String get mediaBarError => 'Не атрымалася загрузіць медыяпанэль';

  @override
  String get offlineServerUnavailable =>
      'Падключаны да Інтэрнэту, але бягучы сервер недаступны.';

  @override
  String get offlineNoInternet =>
      'Вы па-за сеткай. Даступны толькі спампаваны кантэнт.';

  @override
  String get offlineFileNotAvailable => 'Файл недаступны';

  @override
  String get offlineSwitchServer => 'Пераключыць сервер';

  @override
  String get offlineSavedMedia => 'Захаваныя носьбіты';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Аддаленае прайграванне';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Гучнасць прылады';

  @override
  String get castVolumeUnavailable => 'Недаступны';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Аўдыё';

  @override
  String get subtitlesLabel => 'субтытры';

  @override
  String get pinConfirmTitle => 'Пацвердзіце PIN-код';

  @override
  String get pinSetTitle => 'Усталяваць PIN-код';

  @override
  String get pinEnterTitle => 'Увядзіце PIN-код';

  @override
  String get pinReenterToConfirm =>
      'Паўторна ўвядзіце PIN-код для пацверджання';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Няправільны PIN-код';

  @override
  String get pinMismatch => 'PIN-коды не супадаюць';

  @override
  String get pinForgot => 'Забыўся PIN-код?';

  @override
  String get pinClear => 'Ясна';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Запыт Quick Connect дазволены.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Код Quick Connect несапраўдны або пратэрмінаваны.';

  @override
  String get quickConnectNotSupported =>
      'Хуткае злучэнне не падтрымліваецца на гэтым серверы.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Не ўдалося аўтарызаваць код хуткага злучэння.';

  @override
  String get quickConnectDisabled =>
      'Хуткае падключэнне адключана на гэтым серверы.';

  @override
  String get quickConnectForbidden =>
      'Ваш уліковы запіс не можа аўтарызаваць гэты запыт Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Код хуткага злучэння не знойдзены. Паспрабуйце новы код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Увядзіце код';

  @override
  String get quickConnectAuthorize => 'Аўтарызаваць';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Пульт дыстанцыйнага кіравання';

  @override
  String get remoteFailedToLoadSessions => 'Не ўдалося загрузіць сеансы';

  @override
  String get remoteNoSessions => 'Няма кантраляваных сеансаў';

  @override
  String get remoteStartPlayback => 'Пачаць прайграванне на іншай прыладзе';

  @override
  String get unknownUser => 'Невядомы';

  @override
  String get unknownItem => 'Невядомы';

  @override
  String get remoteNothingPlaying => 'У гэтым сеансе нічога не прайграваецца';

  @override
  String get castingStarted => 'Трансляцыя пачалася на выбранай прыладзе';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Няма даступных прылад аддаленага прайгравання.';

  @override
  String get noRemoteDevicesIos =>
      'Няма даступных прылад аддаленага прайгравання.\n\nНа iOS мэты AirPlay могуць быць недаступныя ў сімулятары.';

  @override
  String get trackActionPlayNext => 'Гуляць далей';

  @override
  String get trackActionAddToQueue => 'Дадаць у чаргу';

  @override
  String get trackActionAddToPlaylist => 'Дадаць у плэйліст';

  @override
  String get trackActionCancelDownload => 'Адмяніць загрузку';

  @override
  String get trackActionDeleteFromPlaylist => 'Выдаліць са спісу прайгравання';

  @override
  String get trackActionMoveUp => 'Рухацца ўверх';

  @override
  String get trackActionMoveDown => 'Рухацца ўніз';

  @override
  String get trackActionRemoveFromFavorites => 'Выдаліць з абранага';

  @override
  String get trackActionAddToFavorites => 'Дадаць у абранае';

  @override
  String get trackActionGoToAlbum => 'Перайдзіце ў альбом';

  @override
  String get trackActionGoToArtist => 'Перайсці да Выканаўца';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Спампаваны файл выдалены';

  @override
  String get trackActionDeleteFileFailed =>
      'Не атрымалася выдаліць спампаваны файл';

  @override
  String get shuffleBy => 'Ператасаваць па';

  @override
  String get shuffleSelectLibrary => 'Выберыце Бібліятэка';

  @override
  String get shuffleSelectGenre => 'Выберыце Жанр';

  @override
  String get shuffleLibrary => 'Бібліятэка';

  @override
  String get shuffleGenre => 'Жанр';

  @override
  String get shuffleNoLibraries => 'Няма даступных сумяшчальных бібліятэк.';

  @override
  String get shuffleNoGenres =>
      'Жанры для гэтага рэжыму ператасоўкі не знойдзены.';

  @override
  String get posterDisplayTitle => 'Дысплей';

  @override
  String get posterImageType => 'Тып выявы';

  @override
  String get imageTypePoster => 'Плакат';

  @override
  String get imageTypeThumbnail => 'Мініяцюра';

  @override
  String get imageTypeBanner => 'Расцяжка';

  @override
  String get playlistAddFailed => 'Не атрымалася дадаць у плэйліст';

  @override
  String get playlistCreateFailed => 'Не ўдалося стварыць спіс прайгравання';

  @override
  String get playlistNew => 'Новы спіс прайгравання';

  @override
  String get playlistCreate => 'Ствараць';

  @override
  String get playlistCreateNew => 'Стварыць новы спіс прайгравання';

  @override
  String get playlistNoneFound => 'Плэйлісты не знойдзены';

  @override
  String get addToPlaylist => 'Дадаць у плэйліст';

  @override
  String get lyricsNotAvailable => 'Тэксты песень адсутнічаюць';

  @override
  String get upNext => 'Далей';

  @override
  String get playNext => 'Гуляць далей';

  @override
  String get stillWatchingContent =>
      'Прайграванне прыпынена. Вы ўсё яшчэ глядзіце?';

  @override
  String get stillWatchingStop => 'Стоп';

  @override
  String get stillWatchingContinue => 'Працягнуць';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Жывое тэлебачанне';

  @override
  String get continueWatchingAndNextUp => 'Працягнуць прагляд і далей';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Наступны эпізод';

  @override
  String get moreFromThisSeason => 'Больш з гэтага сезона';

  @override
  String get playerTooltipPlaybackSpeed => 'Хуткасць прайгравання';

  @override
  String get playerTooltipCastControls => 'Элементы кіравання ролямі';

  @override
  String get playerTooltipPlaybackQuality => 'Бітрэйт';

  @override
  String get playerTooltipEnterFullscreen => 'Перайсці ў поўнаэкранны рэжым';

  @override
  String get playerTooltipExitFullscreen => 'Выйсці з поўнаэкраннага рэжыму';

  @override
  String get playerTooltipFloatOnTop => 'Паплавок зверху';

  @override
  String get playerTooltipExitFloatOnTop => 'Адключыць паплавок зверху';

  @override
  String get playerTooltipLockLandscape => 'Пейзаж замка';

  @override
  String get playerTooltipUnlockOrientation => 'Дазволіць кручэнне';

  @override
  String get playerTooltipPrevious => 'Папярэдні';

  @override
  String get playerTooltipSeekBack => 'Шукаць назад';

  @override
  String get playerTooltipSeekForward => 'Шукаць наперад';

  @override
  String get contextMenuMarkWatched => 'Пазначыць як прагледжанае';

  @override
  String get contextMenuMarkUnwatched => 'Пазначыць як непрагледжанае';

  @override
  String get contextMenuAddToFavorites => 'Дадаць у абранае';

  @override
  String get contextMenuRemoveFromFavorites => 'Выдаліць з абранага';

  @override
  String get contextMenuGoToSeries => 'Перайсці да серыі';

  @override
  String get settingsAdministrationSubtitle =>
      'Доступ да панэлі адміністравання сервера';

  @override
  String get settingsAccountSecurity => 'Уліковы запіс і бяспека';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Аўтэнтыфікацыя, PIN-код і бацькоўскі кантроль';

  @override
  String get settingsPersonalization => 'Персаналізацыя';

  @override
  String get settingsPersonalizationSubtitle =>
      'Тэма, навігацыя, хатнія радкі і бачнасць бібліятэкі';

  @override
  String get settingsDynamicContent => 'Дынамічны кантэнт';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медыяпанэль і візуальныя накладкі';

  @override
  String get settingsPlaybackSyncplay => 'Прайграванне і SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Налады аўдыё/відэа, субтытры, спампоўкі і элементы кіравання SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Сінхранізацыя плагінаў, Seerr, рэйтынгі і многае іншае';

  @override
  String get settingsAboutSubtitle =>
      'Версія праграмы, юрыдычная інфармацыя і крэдыты';

  @override
  String get settingsAuthenticationSection => 'аўтэнтыфікацыя';

  @override
  String get settingsSortServersBy => 'Сартаваць серверы па';

  @override
  String get settingsLastUsed => 'Апошняе выкарыстанне';

  @override
  String get settingsAlphabetical => 'Алфавітны';

  @override
  String get settingsPrivacyAndSafetySection => 'КАНФІДЭНЦЫЯЛЬНАСЦЬ І БЯСПЕКА';

  @override
  String get settingsBlockedRatings => 'Заблакіраваныя рэйтынгі';

  @override
  String get settingsGeneralStyle => 'Агульны стыль';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Тэматычныя акцэнты, фоны, назіраныя індыкатары і тэматычная музыка';

  @override
  String get settingsHomePage => 'Галоўная старонка';

  @override
  String get settingsHomePageSubtitle =>
      'Раздзелы, тыпы малюнкаў, накладкі і папярэдні прагляд мультымедыя';

  @override
  String get settingsLibrariesSubtitle =>
      'Бачнасць бібліятэкі, прагляд тэчак і паводзіны на некалькіх серверах';

  @override
  String get settingsTwentyFourHourClock => '24-гадзінны фармат';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Выкарыстоўвайце 24-гадзіннае фарматаванне часу ўсюды, дзе паказаны гадзіннік';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Паказаць кнопку ператасавання на панэлі навігацыі';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Паказаць кнопку жанраў на панэлі навігацыі';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Паказаць кнопку абранага на панэлі навігацыі';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Паказаць кнопку бібліятэк на панэлі навігацыі';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Пераключыць бачнасць хатняй старонкі для кожнай бібліятэкі. Перазапусціце Moonfin, каб змены ўступілі ў сілу.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Медыяпанэль і лакальны папярэдні прагляд';

  @override
  String get settingsVisualOverlays => 'Візуальныя накладкі';

  @override
  String get settingsSeasonalSurprise => 'Сезонны сюрпрыз';

  @override
  String get settingsMetadataAndRatings => 'Метададзеныя і рэйтынгі';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase забяспечвае інтэграцыю на баку сервера, уключаючы дадатковыя крыніцы рэйтынгаў, запыты Seerr і сінхранізаваныя перавагі.';

  @override
  String get settingsOfflineDownloads => 'Пазасеткавыя спампоўкі';

  @override
  String get settingsHigh => 'Высокі';

  @override
  String get settingsLow => 'Нізкі';

  @override
  String get settingsCustomPath => 'Карыстальніцкі шлях';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Увядзіце шлях да папкі загрузкі';

  @override
  String get settingsConcurrentDownloads => 'Адначасовыя спампоўкі';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Максімальная колькасць элементаў для адначасовай загрузкі.';

  @override
  String get settingsAppInfo => 'ІНФАРМАЦЫЯ ПРАГРАМЫ';

  @override
  String get settingsReportAnIssue => 'Паведаміць аб праблеме';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Адкрыйце трэкер праблем на GitHub';

  @override
  String get settingsJoinDiscord => 'Далучайцеся да Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Чат з супольнасцю';

  @override
  String get settingsJoinTheDiscord => 'Далучайцеся да Discord';

  @override
  String get settingsSupportMoonfin => 'Падтрымка Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Пазначце праект зоркай на GitHub або ўнясіце свой уклад';

  @override
  String get settingsLegal => 'ЗАКОННЫ';

  @override
  String get settingsLicenses => 'Ліцэнзіі';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Паведамленні аб ліцэнзіі з адкрытым зыходным кодам';

  @override
  String get settingsPrivacyPolicy => 'Палітыка прыватнасці';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Як Moonfin апрацоўвае вашы дадзеныя';

  @override
  String get settingsCheckForUpdates => 'Праверце наяўнасць абнаўленняў';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Праверце апошнюю версію Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Працуе на Flutter';

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
  String get settingsBoth => 'Абодва';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Ператасаваць фільтр тыпу змесціва';

  @override
  String get settingsVideoPlaybackPreferences => 'Параметры прайгравання відэа';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Асноўны рухавік відэа і налады якасці струменевай перадачы';

  @override
  String get settingsAudioPreferences => 'Параметры гуку';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аўдыядарожкі, параметры апрацоўкі і перадачы';

  @override
  String get settingsAutomationAndQueue => 'Аўтаматызацыя і чарга';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Аўтаматызаванае прайграванне і паслядоўнасць';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Якасць спампоўкі, ліміты захоўвання і памер чаргі';

  @override
  String get settingsSyncplaySubtitle =>
      'Логіка сінхранізацыі для групавых сеансаў';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Спецыялізаваныя функцыі прайгравальніка. Выкарыстоўвайце з асцярожнасцю, бо некаторыя параметры могуць выклікаць праблемы з прайграваннем';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Прапусціць уводныя і канчатковыя часткі?';

  @override
  String get settingsPromptUser => 'Запрасіць карыстальніка';

  @override
  String get settingsSkip => 'Прапусціць';

  @override
  String get settingsDoNothing => 'Нічога не рабіць';

  @override
  String get settingsMaxBitrateDescription =>
      'Абмежаваць бітрэйт струменевай перадачы. Змесціва, якое перавышае гэты парог, будзе перакадзіравана ў адпаведнасці.';

  @override
  String get settingsMaxResolutionDescription =>
      'Абмяжуйце максімальную раздзяляльнасць, якую будзе запытваць гулец. Кантэнт больш высокай разрознасці будзе перакадзіраваны ўніз.';

  @override
  String get settingsPlayerZoomDescription =>
      'Як відэа павінна быць маштабавана, каб адпавядаць экрану.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Механізм прайгравання (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Выберыце механізм прайгравання па змаўчанні на прыладах Android TV. Змены прымяняюцца да наступнага сеансу прайгравання.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (рэкамендуецца)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (спадчына)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Рэзервны варыянт';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Паводзіны загалоўкаў Dolby Vision на прыладах без дэкадавання Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Пытайцеся кожны раз';

  @override
  String get settingsPreferHdr10Fallback =>
      'Аддайце перавагу рэзервоваму рэжыму HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Аддаць перавагу перакадаванню сервера';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Профіль 7 Прамая гульня';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Кантралюе, ці павінны патокі ўзроўню паляпшэння Dolby Vision profile 7 накіроўваць прайграванне.';

  @override
  String get settingsAutoAftkrtEnabled => 'Аўта (AFTKRT уключаны)';

  @override
  String get settingsEnabledOnThisDevice => 'Уключана на гэтай прыладзе';

  @override
  String get settingsDisabledPreferTranscode =>
      'Адключана (пераважна перакадаваць)';

  @override
  String get settingsResumeRewindDescription =>
      'Пры аднаўленні прайгравання (са старонкі \"Працягнуць прагляд\" ці старонкі мультымедыя), на колькі секунд трэба пераматаць назад?';

  @override
  String get settingsUnpauseRewindDescription =>
      'На колькі секунд трэба пераматаць назад пры аднаўленні прайгравання пасля націску кнопкі паўзы?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Колькі секунд трэба перайсці назад пасля націску кнопкі перамоткі.';

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
      'На колькі секунд трэба перайсці наперад пасля націску кнопкі перамоткі наперад.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 на знешні дэкодэр';

  @override
  String get settingsCinemaMode => 'Рэжым кіно';

  @override
  String get settingsCinemaModeSubtitle =>
      'Прайграйце трэйлеры/пракат перад асноўнай функцыяй';

  @override
  String get settingsNextUpDisplayDescription =>
      'Пашыраны паказвае поўную картку з вокладкай эпізоду і апісаннем. Minimal паказвае кампактнае накладанне зваротнага адліку. Адключана цалкам хавае падказку.';

  @override
  String get settingsShort => 'Кароткі';

  @override
  String get settingsLong => 'Доўгі';

  @override
  String get settingsVeryLong => 'Вельмі доўга';

  @override
  String get settingsVideoStartDelay => 'Затрымка запуску відэа';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'ТБ у прамым эфіры';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Уключыць прамое прайграванне для Live TV';

  @override
  String get settingsOpenGroups => 'Адкрыйце Групы';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Стварайце групы SyncPlay, далучайцеся да іх і кіруйце імі';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay уключаны';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Уключыць функцыі групавога прагляду';

  @override
  String get settingsSyncplayButton => 'Кнопка SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Паказаць кнопку SyncPlay на панэлі навігацыі';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Пашыраная карэкцыя';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Уключыць дэталёвую логіку сінхранізацыі';

  @override
  String get settingsSyncplaySyncCorrection => 'Выпраўленне сінхранізацыі';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Аўтаматычна наладжвайце прайграванне, каб заставацца сінхранізаваным';

  @override
  String get settingsSyncplaySpeedToSync => 'Хуткасць сінхранізацыі';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Для сінхранізацыі выкарыстоўвайце рэгуляванне хуткасці прайгравання';

  @override
  String get settingsSyncplaySkipToSync => 'Перайсці да сінхранізацыі';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Выкарыстоўвайце пошук для сінхранізацыі';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Затрымка мінімальнай хуткасці';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Затрымка максімальнай хуткасці';

  @override
  String get settingsSyncplaySpeedDuration => 'Хуткасць Працягласць';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Мінімальная затрымка пропуску';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Дадатковае зрушэнне';

  @override
  String get onNow => 'Зараз';

  @override
  String get collections => 'Зборнікі';

  @override
  String get lastPlayed => 'Апошняя гульня';

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
