// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AppLocalizationsBe extends AppLocalizations {
  AppLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'НАЛАДЫ ЎЛІКОВАГА ЗАПІСУ';

  @override
  String get interfaceLanguage => 'Мова інтэрфейсу';

  @override
  String get systemLanguageDefault => 'Як у сістэме';

  @override
  String get signIn => 'Увайдзіце';

  @override
  String get empty => 'Пуста';

  @override
  String connectingToServer(String serverName) {
    return 'Падключэнне да $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
    return 'QuickConnect недаступны: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect недаступны ($status): $detail';
  }

  @override
  String get whosWatching => 'Хто глядзіць?';

  @override
  String get addUser => 'Дадаць карыстальніка';

  @override
  String get selectServer => 'Выберыце Сервер';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin версія $version';
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
  String get embyConnect => 'Emby Падключыцца';

  @override
  String get removeServer => 'Выдаліць сервер';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Выдаліць \"$serverName\" з вашых сервераў?';
  }

  @override
  String get cancel => 'Адмяніць';

  @override
  String get remove => 'Прыбраць';

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
      'Moonfin не можа атрымаць доступ да вашага сістэмнага бірулькі. Уваход можна працягваць, але бяспечнае сховішча токенаў можа быць недаступным, пакуль бірулька не будзе разблакіравана.';

  @override
  String get ok => 'добра';

  @override
  String get settingsAppearanceTheme => 'Тэма прыкладання';

  @override
  String get detailScreenStyle => 'Стыль экрана звестак';

  @override
  String get detailScreenStyleSubtitle =>
      '«Класічны» — арыгінальная цэнтраваная кампаноўка Moonfin. «Сучасны» — адаптыўная кінематаграфічная кампаноўка.';

  @override
  String get detailScreenStyleMoonfin => 'Класічны';

  @override
  String get detailScreenStyleModern => 'Сучасны';

  @override
  String get expandedTabs => 'Разгорнутыя ўкладкі';

  @override
  String get expandedTabsSubtitle =>
      'Аўтаматычна паказваць змесціва ўкладак пры пераглядзе. Выключыце, каб адкрываць і закрываць кожную ўкладку ўручную.';

  @override
  String get showTechnicalDetails => 'Паказваць тэхнічныя звесткі?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Паказваць кодэк, раздзяляльнасць і звесткі пра паток у кароткім апісанні банера';

  @override
  String get recommendationSystem => 'Сістэма рэкамендацый';

  @override
  String get recommendationSystemSubtitle =>
      'Выкарыстоўвайце алгарытм лакальнай бібліятэкі «Moonfin рэкамендуе» або сеціўныя метрыкі падабенства TMDb. Заўвага: сеціўныя рэкамендацыі патрабуюць інтэграцыі з Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin рэкамендуе';

  @override
  String get recommendationSystemTmdb => 'Падабенства TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Ужываць абмежаванне па ўзроставым рэйтынгу?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Абмяжоўваць прапановы «Moonfin рэкамендуе» паводле ўзроставага рэйтынгу выбранага медыя';

  @override
  String get interfaceStyle => 'Стыль інтэрфейсу';

  @override
  String get interfaceStyleSubtitle =>
      '«Аўтаматычна» адпавядае вашай прыладзе. Выберыце Apple або Material, каб задаць выгляд прымусова.';

  @override
  String get interfaceStyleAutomatic => 'Аўтаматычна';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Якасць шкла';

  @override
  String get glassQualitySubtitle =>
      '«Аўта» выбірае найлепшы эфект шкла для гэтай прылады. «Поўная» уключае сапраўднае размыццё, «Зніжаная» выкарыстоўвае лёгкае шкло, якое эканоміць рэсурсы GPU.';

  @override
  String get glassQualityAuto => 'Аўта';

  @override
  String get glassQualityFull => 'Поўная';

  @override
  String get glassQualityReduced => 'Зніжаная';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Пераключайцеся паміж Moonfin і Neon Pulse без перазапуску праграмы';

  @override
  String get customThemeTitle => 'Уласная тэма';

  @override
  String get customThemeSubtitle =>
      'Уласныя тэмы змяняюць візуальныя элементы ва ўсім Moonfin. Выберыце адзін з варыянтаў пад свой густ.';

  @override
  String get keyboardPreferSystemIme => 'Аддаць перавагу сістэмнай клавіятуры';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Для ўводу тэксту па змаўчанні выкарыстоўвайце метад уводу сваёй прылады';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Цяперашні Moonfin выгляд, які вам усім спадабаўся';

  @override
  String get themeNeonPulse => 'Неонавы імпульс';

  @override
  String get themeNeonPulseSubtitle =>
      'Стыль Synthwave з пурпурным ззяннем, блакітным тэкстам і больш моцным храмаваным кантрастам';

  @override
  String get themeGlass => 'Шкло';

  @override
  String get themeGlassSubtitle =>
      'Аздабленне ў стылі вадкага шкла з плыўным градыентным фонам, матавымі паверхнямі і сінім акцэнтам Apple';

  @override
  String get theme8BitHero => '8-бітны герой';

  @override
  String get theme8BitHeroSubtitle =>
      'Рэтра-аздабленне ў стылі піксель-арт з грубай палітрай, блочнымі рамкамі, рэзкімі ценямі і піксельным шрыфтом';

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
      'Памылка сеткі пры звароце да Emby Connect або выбранага сервера';

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
    return 'Немагчыма падключыцца да $target';
  }

  @override
  String get exitApp => 'Выйсці з Moonfin?';

  @override
  String get exitAppConfirmation => 'Вы ўпэўнены, што хочаце выйсці?';

  @override
  String get exit => 'Выхад';

  @override
  String get gameMenu => 'Меню';

  @override
  String get gamePaused => 'Паўза';

  @override
  String get gameSaveState => 'Захаваць стан';

  @override
  String get games => 'Гульні';

  @override
  String get gameLoadState => 'Загрузіць стан';

  @override
  String get gameFastForward => 'Паскарэнне';

  @override
  String get gameEmulatorSettings => 'Налады эмулятара';

  @override
  String get gameNoCoreOptions => 'Гэтае ядро не мае наладжвальных параметраў.';

  @override
  String get gameHoldToOpenMenu => 'Утрымлівайце, каб адкрыць меню';

  @override
  String get gamePlaybackUnsupported =>
      'Гульні пакуль не падтрымліваюцца на гэтай прыладзе.';

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
  String get series => 'Серыялы';

  @override
  String get noItemsFound => 'Элементы не знойдзены';

  @override
  String get home => 'Галоўная';

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
    return 'Не ўдалося загрузіць папку: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Гэтая папка пустая';

  @override
  String itemCountLabel(int count) {
    return '$count элементы';
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
    return '$count Элементы';
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
    return '$name — Жанры';
  }

  @override
  String get views => 'Прагляды';

  @override
  String get albums => 'Альбомы';

  @override
  String get albumArtists => 'Выканаўцы альбома';

  @override
  String get artists => 'Выканаўцы';

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
    return '$countхв таму';
  }

  @override
  String hoursAgo(int count) {
    return '$countгадз таму';
  }

  @override
  String daysAgo(int count) {
    return '$countдзён таму';
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
    return '$count назвы';
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
  String get resume => 'Працягнуць';

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
    return '$count аўтары';
  }

  @override
  String genresCount(int count) {
    return '$count жанры';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% выканана';
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
    return '$count загалоўкі арганізаваны для прагляду спачатку для чытання.';
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
      'Папулярныя назвы па тэмах ад Open Library.';

  @override
  String get noBookmarkedItems => 'Пакуль няма закладак';

  @override
  String get nothingMatchesSection =>
      'Пакуль нічога не адпавядае гэтаму раздзелу. Паспрабуйце іншую ўкладку або вярніцеся пасля завяршэння сінхранізацыі бібліятэкі.';

  @override
  String get audiobooks => 'Аўдыёкніжкі';

  @override
  String noLabelFound(String label) {
    return '$label не знойдзены';
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
  String get watched => 'Прагледжана';

  @override
  String get unread => 'Непрачытанае';

  @override
  String get unwatched => 'Непрагледжана';

  @override
  String get seriesStatus => 'Статус серыі';

  @override
  String get allLibraries => 'Усе бібліятэкі';

  @override
  String get books => 'Кнігі';

  @override
  String get latestBooks => 'Апошнія кнігі';

  @override
  String get latestAudiobooks => 'Апошнія аўдыякнігі';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кнігі',
      many: '$count кніг',
      few: '$count кнігі',
      one: '$count кніга',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Кніга';

  @override
  String get bookFormatAudiobook => 'Аўдыякніга';

  @override
  String bookPercentRead(int percent) {
    return 'Прачытана $percent%';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Засталося $time';
  }

  @override
  String get bookHeroRead => 'Чытаць';

  @override
  String get bookHeroListen => 'Слухаць';

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
      'LibriVox яшчэ не даў апісання гэтай назвы.';

  @override
  String get readers => 'Чытачы';

  @override
  String get openLinks => 'Адкрыйце спасылкі';

  @override
  String get librivoxPage => 'LibriVox Старонка';

  @override
  String get internetArchive => 'Інтэрнэт-архіў';

  @override
  String get rssFeed => 'RSS-канал';

  @override
  String get downloadZip => 'Спампаваць Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count раздзелы';
  }

  @override
  String firstPublished(int year) {
    return 'Упершыню апублікавана $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Для гэтай назвы яшчэ няма даступнага агляду ад Open Library.';

  @override
  String get subjects => 'Суб\'екты';

  @override
  String get all => 'Усе';

  @override
  String booksCount(int count) {
    return '$count кнігі';
  }

  @override
  String get couldNotLoadSubject => 'Немагчыма загрузіць гэтую тэму зараз.';

  @override
  String get audiobookDetails => 'Падрабязнасці аўдыёкнігі';

  @override
  String authorsCountTitle(int count) {
    return '$count Аўтары';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аўдыякнігі',
      many: '$count аўдыякніг',
      few: '$count аўдыякнігі',
      one: '$count аўдыякніга',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Спіс трэкаў';

  @override
  String get itemListPlaceholder => 'Тут з\'явіцца спіс прадметаў';

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
  String get seasons => 'Сезоны';

  @override
  String get chapters => 'раздзелы';

  @override
  String get features => 'Асаблівасці';

  @override
  String get movies => 'Фільмы';

  @override
  String get musicVideos => 'Музычныя кліпы';

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
    return 'Дыск $number';
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
    return 'Апублікавана $year';
  }

  @override
  String get publicationDateUnknown => 'Дата публікацыі невядомая';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Сезона',
      many: '$count Сезонаў',
      few: '$count Сезоны',
      one: '$count Сезон',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Заканчваецца ў $time';
  }

  @override
  String get items => 'Элементы';

  @override
  String get extras => 'Дадаткі';

  @override
  String get behindTheScenes => 'За кадрам';

  @override
  String get deletedScenes => 'Выдаленыя сцэны';

  @override
  String get featurettes => 'Кароткія сюжэты';

  @override
  String get interviews => 'Інтэрв\'ю';

  @override
  String get scenes => 'Сцэны';

  @override
  String get shorts => 'Кароткаметражкі';

  @override
  String get trailers => 'Трэйлеры';

  @override
  String timeRemaining(String time) {
    return 'Засталося $time';
  }

  @override
  String endsIn(String time) {
    return 'Скончыцца праз $time';
  }

  @override
  String get view => 'Выгляд';

  @override
  String get resumeReading => 'Аднавіць чытанне';

  @override
  String get read => 'Прачытайце';

  @override
  String resumeFrom(String position) {
    return 'Аднавіць ад $position';
  }

  @override
  String get play => 'Прайграць';

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
  String get cast => 'Трансляваць';

  @override
  String get castMembers => 'Cast';

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
  String get finalizingDownload => 'Finalizing…';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Перайменаваць спіс прайгравання';

  @override
  String get playlistName => 'Назва плэйліста';

  @override
  String get deleteDownloadedAlbum => 'Выдаліць спампаваны альбом';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Выдаліць спампаваныя трэкі для \"$title\"?';
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
    return '$itemLabel не загружаны';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Спампоўка $title ($count элементаў)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Вы ўпэўнены, што хочаце выдаліць \"$name\" з сервера? Гэта дзеянне нельга адмяніць.';
  }

  @override
  String get itemDeleted => 'Элемент выдалены';

  @override
  String get noPlayableTrailerFound => 'Трэйлер для прайгравання не знойдзены.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Фармат кнігі не падтрымліваецца: .$extension';
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
    return 'Субтытры спампаваны і выбраны: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтытры спампаваны. З\'яўленне можа заняць некаторы час, пакуль Jellyfin абнаўляе элемент.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Аддаленыя субтытры для $language не знойдзены.';
  }

  @override
  String get selectVersion => 'Выберыце Версія';

  @override
  String versionNumber(int number) {
    return 'Версія $number';
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
    return 'Спампоўка $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Выдаліць спампаваныя файлы';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Выдаліць лакальныя файлы для $typeLabel?\n\nГэта вызваліць месца для захоўвання. Вы можаце паўторна спампаваць пазней.';
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
  String get directors => 'РЭЖЫСЁРЫ';

  @override
  String get writer => 'СЦЭНАРЫСТ';

  @override
  String get writers => 'СЦЭНАРЫСТЫ';

  @override
  String get studio => 'СТУДЫЯ';

  @override
  String studioMoreCount(int count) {
    return '+$count больш';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Эпізоды';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Эпізод $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Раздзел $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count трэка',
      many: '$count трэкаў',
      few: '$count трэкі',
      one: '$count трэк',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count раздзела',
      many: '$count раздзелаў',
      few: '$count раздзелы',
      one: '$count раздзел',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Нарадзіўся $date';
  }

  @override
  String died(String date) {
    return 'Памёр $date';
  }

  @override
  String age(int age) {
    return 'Узрост $age';
  }

  @override
  String get showLess => 'Паказаць менш';

  @override
  String get readMore => 'Больш падрабязна';

  @override
  String get shuffle => 'Перамяшаць';

  @override
  String get shuffleAllMusic => 'Перамяшаць усю музыку';

  @override
  String get carSignInPrompt => 'Увайдзіце ў Moonfin на тэлефоне';

  @override
  String get carServerUnreachable => 'Не ўдаецца звязацца з серверам';

  @override
  String downloadsCount(int count) {
    return 'Спампоўкі $count';
  }

  @override
  String get perfectMatch => 'Ідэальны матч';

  @override
  String channelsCount(int count) {
    return '$count кан.';
  }

  @override
  String get mono => 'Мона';

  @override
  String get stereo => 'Стэрэа';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Аддаленыя субцітры $action патрабуюць дазволу на кіраванне субтытрамі Jellyfin для гэтага карыстальніка.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Гэты элемент не можа быць знойдзены на серверы для аддаленых субтытраў $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Збой выдаленага субтытра $action: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Збой выдаленага субтытра $action (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Не атрымалася $action аддаленых субтытраў.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'усе спампаваныя серыі для \"$name\"';
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
    return '$label дзеянне не атрымалася: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Не ўдалося ўсталяваць гучнасць трансляцыі: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Элементы кіравання';
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
    return 'Спыніць $label';
  }

  @override
  String get queueIsEmpty => 'Чарга пустая';

  @override
  String trackNumber(int number) {
    return 'Трэк $number';
  }

  @override
  String get remotePlayback => 'Аддаленае прайграванне';

  @override
  String get castingToGoogleCast => 'Трансляцыя на Google Cast';

  @override
  String get castingViaAirPlay => 'Трансляцыя праз AirPlay';

  @override
  String get castingViaDlna => 'Трансляцыя праз DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds секунд';
  }

  @override
  String get longPressToUnlock => 'Доўгі націск, каб разблакіраваць';

  @override
  String get off => 'Выкл.';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Аўто';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Мбіт/с';
  }

  @override
  String get bitrateOverride => 'Перавызначэнне бітрэйту';

  @override
  String get audioDelay => 'Затрымка гуку';

  @override
  String delayMinusMs(int value) {
    return '-$value мс';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value мс';
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
  String get player => 'Прайгравальнік';

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
  String get track => 'Дарожка';

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
    return '$protocol памылка сеанса';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Не ўдалося загрузіць звесткі пра кнігу: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Візуалізацыя EPUB у праграме пакуль недаступная на гэтай платформе.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Гэты фармат (.$extension) пакуль што немагчыма адлюстраваць у праграме.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Убудаваная візуалізацыя дакументаў недаступная на гэтай платформе.';

  @override
  String get couldNotOpenExternalViewer =>
      'Немагчыма адкрыць знешнюю праграму прагляду.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Не ўдалося адкрыць праграму для чытання ў праграме: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Закладка ўжо захавана на $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Дададзена закладка: $label';
  }

  @override
  String get noBookmarksYet =>
      'Пакуль няма закладак.\nНацісніце на значок закладкі падчас чытання, каб захаваць сваю пазіцыю.';

  @override
  String get noTableOfContentsAvailable => 'Няма даступнага зместу';

  @override
  String pageLabel(int number) {
    return 'Старонка $number';
  }

  @override
  String get position => 'Пазіцыя';

  @override
  String get bookReader => 'Чытанка кніг';

  @override
  String formatExtension(String extension) {
    return 'Фармат: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% прачытана';
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
    return 'Скінуць маштаб (${zoom}x)';
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
    return 'Не ўдалося абнавіць стан чытання: $error';
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
    return 'На гэтай платформе не можа быць убудаваны механізм дакументаў для файлаў $extension.';
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
    return 'Не ўдалося загрузіць кіраўніцтва: $error';
  }

  @override
  String get noChannelsFound => 'Каналы не знойдзены';

  @override
  String get liveBadge => 'ЖЫВАЯ';

  @override
  String guideNextProgram(String time, String title) {
    return 'Далей: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Засталося $minutes хв';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Засталося $hours гадз';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Засталося $hours гадз $minutes хв';
  }

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
  String get record => 'Запісаць';

  @override
  String get cancelRecordingAction => 'Адмяніць запіс';

  @override
  String get programSetToRecord => 'Праграма настроена на запіс';

  @override
  String get recordingCancelled => 'Запіс адменены';

  @override
  String get unableToCreateRecording => 'Немагчыма стварыць запіс';

  @override
  String get watch => 'Глядзець';

  @override
  String get close => 'Закрыць';

  @override
  String failedToPlayChannel(String name) {
    return 'Не ўдалося прайграць $name';
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
    return 'Адмяніць запланаваны запіс \"$name\"?';
  }

  @override
  String get no => 'Не';

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
    return 'Спыніць запіс \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'Не ўдалося адмяніць запіс серыі';

  @override
  String get searchThisLibrary => 'Пошук у гэтай бібліятэцы...';

  @override
  String get searchEllipsis => 'Пошук...';

  @override
  String noResultsForQuery(String query) {
    return 'Няма вынікаў для \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Збой пошуку: $error';
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
    return 'Выдаліць \"$name\" і яго файлы?';
  }

  @override
  String tracksCount(int count) {
    return '$count трэкі';
  }

  @override
  String get album => 'Альбом';

  @override
  String get playAlbum => 'Прайграць альбом';

  @override
  String failedToLoadAlbum(String error) {
    return 'Не ўдалося загрузіць альбом: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Спампаваныя трэкі для $name не знойдзены.';
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
    return 'Выдаліць \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes мін';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'С$season Э$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Эпізод $number';
  }

  @override
  String get seriesNotFound => 'Серыял не знойдзены';

  @override
  String get errorLoadingSeries => 'Памылка загрузкі серыі';

  @override
  String get downloadedEpisodes => 'Спампаваныя серыі';

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
  String get deleteSeason => 'Выдаліць сезон';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Выдаліць усе спампаваныя серыі ў $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count эпізода',
      many: '$count эпізодаў',
      few: '$count эпізоды',
      one: '$count эпізод',
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
    return 'Выдаліць $count спампаваныя элементы?';
  }

  @override
  String get musicAndAudiobooks => 'Музыка і аўдыякнігі';

  @override
  String get images => 'Малюнкі';

  @override
  String get database => 'База дадзеных';

  @override
  String ofStorageLimit(String limit) {
    return 'ліміту $limit';
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
    return 'Параметры $count';
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
  String get themeMusicSettingsSubtitle =>
      'Старонкі звестак, радкі на галоўнай і гучнасць';

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
  String get loopThemeMusic => 'Паўтараць музычную тэму';

  @override
  String get loopThemeMusicSubtitle =>
      'Прайграваць трэк цыклічна, а не адзін раз';

  @override
  String get detailsBackgroundBlur => 'Размыццё фону дэталяў';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value пкс';
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
  String get settingsScrollWheelAction => 'Кола пракруткі мышы';

  @override
  String get settingsScrollWheelActionDescription =>
      'Выберыце, што робіць пракрутка кола мышы над відэа падчас прайгравання.';

  @override
  String get scrollWheelActionOff => 'Выкл.';

  @override
  String get scrollWheelActionSeek => 'Перамотка (наперад / назад)';

  @override
  String get scrollWheelActionVolume => 'Гучнасць';

  @override
  String get playerTooltipVolume => 'Гучнасць';

  @override
  String get fit => 'Прыстасаваны';

  @override
  String get autoCrop => 'Аўтаматычнае абрэзка';

  @override
  String get stretch => 'Расцяжка';

  @override
  String get refreshRateSwitching => 'Пераключэнне частоты абнаўлення';

  @override
  String get disabled => 'Адключана';

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
  String get fallbackAudioLanguage => 'Рэзервовая мова аўдыё';

  @override
  String get preferDefaultAudioTrack =>
      'Аддаваць перавагу стандартнай аўдыядарожцы';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Аддаваць перавагу арыгінальнай аўдыядарожцы замест лакалізаванага дубляжу.';

  @override
  String get preferAudioDescription =>
      'Аддаваць перавагу дарожкам з аўдыяапісаннем';

  @override
  String get preferAudioDescriptionDescription =>
      'Аддаваць перавагу дарожкам з аўдыяапісаннем замест звычайных.';

  @override
  String get transcodingAudio => 'Транскадаванне (аўдыё)';

  @override
  String get directStreamRemux => 'Прамы паток (рэмультыплексаванне)';

  @override
  String get transcodingBitrateOrResolution =>
      'Транскадаванне (бітрэйт або раздзяляльнасць)';

  @override
  String get transcodingVideoAndAudio => 'Транскадаванне (відэа і аўдыё)';

  @override
  String get transcodingVideo => 'Транскадаванне (відэа)';

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
  String get settingsAudioOutputMode => 'Рэжым вываду гуку';

  @override
  String get settingsAudioOutputModeDescription =>
      'Выберыце, як дэкадуецца гук. Транзіт праз AVR адпраўляе неапрацаваныя патокі Dolby/DTS на ваш рэсівер, а «Аўта» і «Звядзенне» дэкадуюць лакальна.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Праходжанне AVR';

  @override
  String get settingsAudioFallbackCodec => 'Аўдыязапасны кодэк';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Выберыце фармат для транскадавання шматканальнага гуку, калі зыходны паток нельга прайграць напрамую або перадаць транзітам.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Аўтавызначэнне\n(рэкамендуецца)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(стандартна)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(без страт)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(толькі стэрэа)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(эканомны)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(без страт)';

  @override
  String get settingsMaxAudioChannels => 'Максімум аўдыяканалаў';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Задайце максімальную колькасць каналаў вашай аўдыясістэмы. Шматканальныя патокі звыш гэтага ліміту будуць зведзены або транскадаваны.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Аўтавызначэнне\n(стандарт абсталявання)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Мона';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Стэрэа';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Аб\'ёмны гук';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Квадрафанічны';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Аб\'ёмны гук';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Аб\'ёмны гук';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Аб\'ёмны гук';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Аб\'ёмны гук';

  @override
  String get settingsAudioPassthroughAdvanced => 'Праходжанне (пашыраны)';

  @override
  String get settingsAudioCodecPassthrough => 'Праходжанне кодэка';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Уключыце толькі тыя фарматы, якія падтрымлівае ваш AVR або HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Праходжанне EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'Праход EAC3 JOC (Atmos).';

  @override
  String get settingsAudioDtsCorePassthrough => 'Транзіт ядра DTS';

  @override
  String get settingsAudioDtsHdPassthrough => 'Праходжанне DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'Праходжанне TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'Праходжанне TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) на знешні дэкодэр.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos праз EAC3 (JOC) на знешні дэкодэр.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (уключае ядро ​​DTS) на знешні дэкодэр.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD з метададзенымі Atmos на знешні дэкодэр.';

  @override
  String get settingsDetectedAudioCapabilities => 'Выяўленыя магчымасці гуку';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Пакуль няма даступнага здымка магчымасці выканання.';

  @override
  String get settingsAudioRouteLabel => 'Маршрут';

  @override
  String get settingsAudioDecodeLabel => 'Дэкадзіраваць';

  @override
  String get settingsAudioPassthroughLabel => 'Прахадны';

  @override
  String get settingsAudioHdRoute => 'Маршрут HD-аўдыё';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Дакладчык';

  @override
  String get settingsAudioRouteHeadphones => 'Навушнікі';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count кан. PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Дыягностыка';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Узровень відэа';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Відэа дыяпазон';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Кодэк для субтытраў';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Дазволеныя аўдыякодэкі';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Аўдыякодэкі HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Аўдыёкодэкі HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'праходжанне аўдыё-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Актыўны аўдыямаршрут';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Падтрымка Route HD Audio';

  @override
  String get nightMode => 'Начны рэжым';

  @override
  String get compressDynamicRange => 'Сціснуць дынамічны дыяпазон';

  @override
  String get advancedMpv => 'Пашыраны mpv';

  @override
  String get enableCustomMpvConf => 'Уключыць карыстальніцкі mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Ужыце зададзены карыстальнікам mpv.conf перад пачаткам прайгравання';

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
    return '$value с';
  }

  @override
  String get mediaQueuing => 'Медыя чарга';

  @override
  String get autoQueueNextEpisodes => 'Аўтаматычная чарга наступных серый';

  @override
  String get stillWatchingPrompt => 'Усё яшчэ гляджу падказку';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Пасля $episodes эпізодаў / $hoursг';
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
      'Не ўстаноўлена. Moonfin паспрабуе стандартны mpv.conf у папках прыкладанняў/дадзеных.';

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
  String get subtitleMode => 'Рэжым субтытраў';

  @override
  String get subtitleModeFlagged => 'Пазначаныя';

  @override
  String get subtitleModeAlways => 'Заўсёды';

  @override
  String get subtitleModeForeign => 'Замежныя';

  @override
  String get subtitleModeForced => 'Прымусовыя';

  @override
  String get subtitleModeFlaggedDescription =>
      'Прайграе дарожкі, пазначаныя ў метаданых медыяфайла як «default» або «forced».';

  @override
  String get subtitleModeAlwaysDescription =>
      'Аўтаматычна загружае і паказвае субтытры пры кожным запуску відэа.';

  @override
  String get subtitleModeForeignDescription =>
      'Аўтаматычна ўключае субтытры, калі стандартная аўдыядарожка на замежнай мове.';

  @override
  String get subtitleModeForcedDescription =>
      'Загружае толькі субтытры з яўнай пазнакай forced у метаданых.';

  @override
  String get subtitleModeNoneDescription =>
      'Цалкам адключае аўтаматычную загрузку субтытраў.';

  @override
  String get fallbackSubtitleLanguage => 'Рэзервовая мова субтытраў';

  @override
  String get subtitleStream => 'Паток субтытраў';

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
    return 'Загружаны налады профілю $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Не ўдалося загрузіць налады профілю $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Лакальныя налады сінхранізаваны з профілем $profile.';
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
  String get reportDownloadsActivity => 'Паказваць спампоўкі на серверы';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Дазволіць адміністратару сервера бачыць вашы транскадаваныя спампоўкі на панэлі кіравання';

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
      'Спампоўкі/Moonfin — бачныя іншым праграмам';

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
      'Спампаваныя мультымедыя будуць захаваны ў Downloads/Moonfin на вашай прыладзе. Гэтыя файлы будуць бачныя для іншых праграм, такіх як галерэя або музычны прайгравальнік.\n\nІснуючыя спампоўкі застануцца ў іх бягучым месцы.';

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
  String get navbarAlwaysExpanded =>
      'Заўсёды паказваць подпісы панэлі навігацыі';

  @override
  String get showSeerrButton => 'Паказваць кнопку Seerr';

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
  String get groupItemsIntoCollections => 'Групаваць элементы ў калекцыі';

  @override
  String get hideCollectionAssociatedItems =>
      'Хаваць элементы бібліятэкі, звязаныя з калекцыямі, пры праглядзе бібліятэк';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Заўвага пра групаванне бібліятэкі';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Каб выкарыстоўваць гэтую наладу, пераканайцеся, што ў наладах адлюстравання вашай бібліятэкі на серверы Jellyfin або Emby ўключаны параметры «Групаваць фільмы ў калекцыі» і/або «Групаваць серыялы ў калекцыі».';

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
    return '$count выбраны';
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
      'Выбірайце паміж рознымі стылямі медыяпанэлі або адключайце медыяпанэль';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Выкл.';

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
  String get trailerAudio => 'Гук трэйлераў';

  @override
  String get enableTrailerAudio => 'Уключыць гук трэйлераў у медыяпанэлі';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription =>
      'Show captions on YouTube trailers in the media bar';

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
  String get fullScreenRows => 'Разгорнутыя радкі галоўнай';

  @override
  String get fullScreenRowsDescription =>
      'Паказваць не больш за адзін радок галоўнай на экран';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Тып выявы ў радку';

  @override
  String get perRowSettings => 'Налады для кожнага радка';

  @override
  String get autoLogin => 'Аўтаматычны ўваход';

  @override
  String get lastUser => 'Апошні карыстальнік';

  @override
  String get currentUser => 'Бягучы карыстальнік';

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
    return '$minutes мін';
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
  String get clockModeStatic => 'Нерухомы';

  @override
  String get clockModeBouncing => 'Скачучы';

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
  String get trakt => 'Trakt';

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
  String get pluginLabel => 'Плагін Moonbase';

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
    return '$status\nВерсія: $version';
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
  String get seerrDiscoveryRows => 'Радкі агляду Seerr';

  @override
  String get yourWatchlist => 'Your Watchlist';

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
  String get seerrNotificationsSection => 'Апавяшчэнні';

  @override
  String get seerrNotifyNewRequestsTitle => 'Апавяшчэнні пра новыя запыты';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Паведамляць, калі хтосьці адпраўляе запыт';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Абнаўленні запытаў';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Ухвалена, адхілена і дададзена ў вашу бібліятэку';

  @override
  String get seerrNotifyIssuesTitle => 'Абнаўленні праблем';

  @override
  String get seerrNotifyIssuesSubtitle => 'Новыя праблемы, адказы і рашэнні';

  @override
  String loggedInAs(String username) {
    return 'Вы ўвайшлі як: $username';
  }

  @override
  String get discoverRows => 'Старонка агляду Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Уключыце радкі, якія трэба паказваць на галоўнай старонцы Seerr. Перацягвайце, каб змяніць парадак. Уласны парадак сінхранізуецца з Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Уключыце радкі, якія трэба паказваць на галоўнай старонцы Seerr. Перацягвайце, каб змяніць парадак. Уласны парадак сінхранізуецца з Moonbase.';

  @override
  String get enabled => 'Уключана';

  @override
  String get hidden => 'Схаваны';

  @override
  String get aboutTitle => 'Аб';

  @override
  String versionValue(String version) {
    return 'Версія $version';
  }

  @override
  String get openSourceLicenses => 'Ліцэнзіі з адкрытым зыходным кодам';

  @override
  String get sourceCode => 'Зыходны код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'Абнаўленне даступна: v$version';
  }

  @override
  String get updateNotifications => 'Апавяшчэнні аб абнаўленні';

  @override
  String get showWhenUpdatesAvailable => 'Паказаць, калі абнаўленні даступныя';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Даступны';
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
    return '$value ГБ';
  }

  @override
  String mbValue(int value) {
    return '$value МБ';
  }

  @override
  String get imageCacheLimit => 'Ліміт кэшу відарысаў';

  @override
  String get clearImageCache => 'Ачысціць кэш відарысаў';

  @override
  String get imageCacheCleared => 'Кэш відарысаў ачышчаны';

  @override
  String get clear => 'Ачысціць';

  @override
  String get browse => 'Праглядзіце';

  @override
  String get noResults => 'Няма вынікаў';

  @override
  String get seerrAvailableStatus => 'Даступны';

  @override
  String get seerrRequestedStatus => 'Запытаны';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Спампоўванне · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Імпартаванне';

  @override
  String itemsCount(int count) {
    return '$count Элементы';
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
    return 'Запытаў $name';
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
    return 'Адмяніць запыт на \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Скасаваць запыты $count для «$title»?';
  }

  @override
  String get keep => 'Трымайце';

  @override
  String get itemNotFoundInLibrary =>
      'Элемент не знойдзены ў вашай бібліятэцы Moonfin';

  @override
  String get errorSearchingLibrary => 'Памылка пошуку ў бібліятэцы';

  @override
  String budgetAmount(String amount) {
    return 'Бюджэт: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Даход: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Запыт $type';
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
  String get appearances => 'Ролі';

  @override
  String get crewSection => 'Экіпаж';

  @override
  String ageValue(int age) {
    return 'узрост $age';
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
  String get failedStatus => 'Не ўдалося';

  @override
  String get processingStatus => 'Апрацоўка';

  @override
  String modifiedByName(String name) {
    return 'Зменена: $name';
  }

  @override
  String get completedStatus => 'Завершана';

  @override
  String get requestErrorDuplicate => 'Гэтая назва ўжо запытана';

  @override
  String get requestErrorQuota => 'Дасягнуты ліміт запытаў';

  @override
  String get requestErrorBlocklisted => 'Гэтая назва ў чорным спісе';

  @override
  String get requestErrorNoSeasons => 'Не засталося сезонаў для запыту';

  @override
  String get requestErrorPermission => 'У вас няма дазволу на гэты запыт';

  @override
  String get seerrRequestsTitle => 'Запыты';

  @override
  String get seerrIssuesTitle => 'Праблемы';

  @override
  String get sortNewest => 'Найноўшыя';

  @override
  String get sortLastModified => 'Апошнія змены';

  @override
  String get noIssues => 'Няма праблем';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Засталося $remaining з $limit запытаў на фільмы';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Засталося $remaining з $limit запытаў на сезоны';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Уваходзіць у $name';
  }

  @override
  String get viewCollection => 'Адкрыць калекцыю';

  @override
  String get requestCollection => 'Запытаць калекцыю';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total фільмаў · $available даступна';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Запытаць $count фільмаў';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Запыт $current з $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Запытана $count фільмаў';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Запытана $ok з $total фільмаў';
  }

  @override
  String get collectionAllRequested => 'Усе фільмы ўжо даступныя або запытаныя';

  @override
  String get reportIssue => 'Паведаміць пра праблему';

  @override
  String get issueTypeVideo => 'Відэа';

  @override
  String get issueTypeAudio => 'Аўдыё';

  @override
  String get whatsWrong => 'Што не так?';

  @override
  String get allEpisodes => 'Усе эпізоды';

  @override
  String get episode => 'Эпізод';

  @override
  String get openStatus => 'Адкрыта';

  @override
  String get resolvedStatus => 'Вырашана';

  @override
  String get resolveAction => 'Вырашыць';

  @override
  String get reopenAction => 'Адкрыць зноў';

  @override
  String reportedByName(String name) {
    return 'Паведаміў $name';
  }

  @override
  String commentsCount(int count) {
    return '$count каментарыяў';
  }

  @override
  String get addComment => 'Дадаць каментарый';

  @override
  String get deleteIssueConfirm => 'Выдаліць гэтую праблему?';

  @override
  String get submitReport => 'Адправіць паведамленне';

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
  String get seasonsLabel => 'Сезоны';

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
  String get general => 'Агульныя';

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
  String get remote => 'Пульт';

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
  String get stop => 'Спыніць';

  @override
  String get streaming => 'Паток';

  @override
  String get time => 'Час';

  @override
  String get trickplay => 'Trickplay';

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
  String get mute => 'Без гуку';

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
  String get adminDrawerDisplay => 'Адлюстраванне';

  @override
  String get adminDrawerMetadata => 'Метаданыя';

  @override
  String get adminDrawerNfo => 'Налады NFO';

  @override
  String get adminDrawerTranscoding => 'Перакадзіроўка';

  @override
  String get adminDrawerResume => 'Працягнуць';

  @override
  String get adminDrawerStreaming => 'Паток';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
    return 'Даступныя абнаўленні плагінаў: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Убудовы, якія патрабуюць перазапуску: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Няўдалыя запланаваныя задачы: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Апошнія запісы папярэджанняў/памылак: $count';
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
    return 'Памылка: $error';
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
    return 'Збой каманды: $error';
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
  String get volume => 'Гучнасць';

  @override
  String get actions => 'Дзеянні';

  @override
  String get videoCodec => 'Відэа кодэк';

  @override
  String get audioCodec => 'Аўдыё кодэк';

  @override
  String get hwAccel => 'Апаратнае паскарэнне';

  @override
  String get completion => 'Завяршэнне';

  @override
  String get direct => 'Прамая';

  @override
  String get adminDisconnect => 'Адключыцца';

  @override
  String get adminClearDates => 'Выразныя даты';

  @override
  String get adminActivitySeverityAll => 'Усе ўзроўні';

  @override
  String get adminActivityDateRange => 'Дыяпазон дат';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Не ўдалося загрузіць журнал актыўнасці: $error';
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
    return 'Не ўдалося абнавіць прыладу: $error';
  }

  @override
  String get adminDeleteDevice => 'Выдаліць прыладу';

  @override
  String get adminDeviceDeleted => 'Прылада выдалена';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Не ўдалося выдаліць прыладу: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Выдаліць прыладу «$name»? Карыстальніку спатрэбіцца ўвайсці зноў на гэтай прыладзе.';
  }

  @override
  String get adminDeleteAllDevices => 'Выдаліць усе прылады';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Выдаліць $count прылад? Закранутым карыстальнікам спатрэбіцца ўвайсці зноў. Вашай бягучай прылады гэта не тычыцца.';
  }

  @override
  String get adminDevicesDeletedAll => 'Прылады выдалены';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Некаторыя прылады выдалены; $count выдаліць не ўдалося.';
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
    return 'Не ўдалося пачаць сканаванне: $error';
  }

  @override
  String get adminRenameLibrary => 'Перайменаваць бібліятэку';

  @override
  String get adminNewName => 'Новая назва';

  @override
  String adminLibraryRenamed(String name) {
    return 'Бібліятэка перайменавана ў \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Не ўдалося перайменаваць: $error';
  }

  @override
  String get adminDeleteLibrary => 'Выдаліць бібліятэку';

  @override
  String adminLibraryDeleted(String name) {
    return 'Бібліятэка \"$name\" выдалена';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Не ўдалося выдаліць бібліятэку: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Не ўдалося дадаць шлях: $error';
  }

  @override
  String get adminRemovePath => 'Выдаліць шлях';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Выдаліць \"$path\" з гэтай бібліятэкі?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Не ўдалося выдаліць шлях: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Параметры бібліятэкі захаваны';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Не ўдалося захаваць параметры: $error';
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
  String get adminLibraryTabPaths => 'Шляхі';

  @override
  String get adminLibraryTabOptions => 'Параметры';

  @override
  String get adminLibraryTabDownloaders => 'Спампоўшчыкі';

  @override
  String get adminLibMetadataSavers => 'Захавальнікі метаданых';

  @override
  String get adminLibSubtitleDownloaders => 'Спампоўшчыкі субтытраў';

  @override
  String get adminLibLyricDownloaders => 'Спампоўшчыкі тэкстаў песень';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Спампоўшчыкі метаданых: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Крыніцы відарысаў: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Гэты сервер не прапануе спампоўшчыкаў для гэтага тыпу бібліятэкі.';

  @override
  String get adminLibrarySectionGeneral => 'Агульныя';

  @override
  String get adminLibrarySectionMetadata => 'Метаданыя';

  @override
  String get adminLibrarySectionEmbedded => 'Убудаваныя звесткі';

  @override
  String get adminLibrarySectionSubtitles => 'Субтытры';

  @override
  String get adminLibrarySectionImages => 'Відарысы';

  @override
  String get adminLibrarySectionSeries => 'Серыялы';

  @override
  String get adminLibrarySectionMusic => 'Музыка';

  @override
  String get adminLibrarySectionMovies => 'Фільмы';

  @override
  String get adminLibRealtimeMonitor => 'Уключыць маніторынг у рэальным часе';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Выяўляць змены файлаў і апрацоўваць іх аўтаматычна.';

  @override
  String get adminLibArchiveMediaFiles => 'Лічыць архівы медыяфайламі';

  @override
  String get adminLibEnablePhotos => 'Паказваць фота';

  @override
  String get adminLibSaveLocalMetadata => 'Захоўваць ілюстрацыі ў медыяпапках';

  @override
  String get adminLibRefreshInterval => 'Аўтаматычнае абнаўленне метаданых';

  @override
  String get adminLibRefreshNever => 'Ніколі';

  @override
  String get adminLibDefault => 'Стандартна';

  @override
  String get adminLibDisplayTitle => 'Адлюстраванне';

  @override
  String get adminLibDisplaySection => 'Адлюстраванне бібліятэкі';

  @override
  String get adminLibFolderView =>
      'Паказваць выгляд папак для звычайных медыяпапак';

  @override
  String get adminLibSpecialsInSeasons =>
      'Паказваць спецвыпускі ў сезонах, дзе яны выйшлі';

  @override
  String get adminLibGroupMovies => 'Групаваць фільмы ў калекцыі';

  @override
  String get adminLibGroupShows => 'Групаваць серыялы ў калекцыі';

  @override
  String get adminLibExternalSuggestions =>
      'Паказваць знешняе змесціва ў прапановах';

  @override
  String get adminLibDateAddedSection => 'Паводзіны даты дадання';

  @override
  String get adminLibDateAddedLabel => 'Браць дату дадання з';

  @override
  String get adminLibDateAddedImport => 'Дата сканавання ў бібліятэку';

  @override
  String get adminLibDateAddedFile => 'Дата стварэння файла';

  @override
  String get adminLibMetadataTitle => 'Метаданыя і відарысы';

  @override
  String get adminLibMetadataLangSection => 'Пажаданая мова метаданых';

  @override
  String get adminLibChaptersSection => 'Раздзелы';

  @override
  String get adminLibDummyChapterDuration =>
      'Працягласць фіктыўнага раздзела (секунды)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Даўжыня раздзелаў, якія ствараюцца для медыя без іх. Задайце 0, каб адключыць.';

  @override
  String get adminLibChapterImageResolution =>
      'Раздзяляльнасць відарысаў раздзелаў';

  @override
  String get adminLibNfoTitle => 'Налады NFO';

  @override
  String get adminLibNfoHelp =>
      'Метаданыя NFO сумяшчальныя з Kodi і падобнымі кліентамі. Налады прымяняюцца да ўсіх бібліятэк, якія захоўваюць метаданыя NFO.';

  @override
  String get adminLibKodiUser =>
      'Карыстальнік, чые звесткі пра прагляд захоўваюцца ў файлах NFO';

  @override
  String get adminLibSaveImagePaths => 'Захоўваць шляхі відарысаў у файлах NFO';

  @override
  String get adminLibPathSubstitution =>
      'Уключыць падмену шляхоў для відарысаў NFO';

  @override
  String get adminLibExtraThumbs =>
      'Капіраваць відарысы extrafanart у папку extrathumbs';

  @override
  String get adminLibNone => 'Няма';

  @override
  String adminLibRefreshDays(int days) {
    return '$days дзён';
  }

  @override
  String get adminLibEmbeddedTitles => 'Выкарыстоўваць убудаваныя назвы';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Выкарыстоўваць убудаваныя назвы для дадаткаў';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Выкарыстоўваць убудаваныя звесткі пра эпізоды';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Дазволіць убудаваныя субтытры';

  @override
  String get adminLibEmbeddedAllowAll => 'Дазволіць усе';

  @override
  String get adminLibEmbeddedAllowText => 'Толькі тэкставыя';

  @override
  String get adminLibEmbeddedAllowImage => 'Толькі відарысы';

  @override
  String get adminLibEmbeddedAllowNone => 'Няма';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Прапускаць спампоўку, калі ёсць убудаваныя субтытры';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Прапускаць спампоўку, калі аўдыядарожка адпавядае мове спампоўкі';

  @override
  String get adminLibRequirePerfectMatch =>
      'Патрабаваць дакладнае супадзенне субтытраў';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Захоўваць субтытры ў медыяпапках';

  @override
  String get adminLibChapterImageExtraction => 'Здабываць відарысы раздзелаў';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Здабываць відарысы раздзелаў падчас сканавання бібліятэкі';

  @override
  String get adminLibTrickplayExtraction =>
      'Уключыць здабыванне відарысаў trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Здабываць відарысы trickplay падчас сканавання бібліятэкі';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Захоўваць відарысы trickplay у медыяпапках';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Аўтаматычна аб\'ядноўваць серыялы, размеркаваныя па некалькіх папках';

  @override
  String get adminLibSeasonZeroName => 'Назва нулявога сезона';

  @override
  String get adminLibLufsScan =>
      'Уключыць сканаванне LUFS для нармалізацыі гуку';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Аддаваць перавагу нестандартнаму тэгу выканаўцаў';

  @override
  String get adminLibAutoAddToCollection =>
      'Аўтаматычна дадаваць фільмы ў калекцыі';

  @override
  String get adminLibraryNameRequired => 'Увядзіце назву бібліятэкі';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Не ўдалося стварыць бібліятэку: $error';
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
    return 'Адключыць $name? Яны не змогуць увайсці.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Уключыць $name? Яны змогуць увайсці зноў.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Карыстальнік \"$name\" адключаны';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Карыстальнік \"$name\" уключаны';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Не ўдалося абнавіць палітыку карыстальніка: $error';
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
    return 'Не ўдалося стварыць карыстальніка: $error';
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
    return 'Не ўдалося захаваць: $error';
  }

  @override
  String get adminPermissionsSaved => 'Дазволы захаваны';

  @override
  String get adminPasswordsMismatch => 'Паролі не супадаюць';

  @override
  String adminFailed(String error) {
    return 'Збой: $error';
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
  String get adminParentalControl => 'Бацькоўскі кантроль';

  @override
  String get adminMaxParentalRating =>
      'Максімальны дазволены ўзроставы рэйтынг';

  @override
  String get adminMaxParentalRatingHint =>
      'Змесціва з вышэйшым рэйтынгам будзе схавана ад гэтага карыстальніка.';

  @override
  String get adminParentalRatingNone => 'Няма';

  @override
  String get adminBlockUnratedItems =>
      'Блакаваць элементы без рэйтынгу або з нераспазнаным рэйтынгам';

  @override
  String get adminUnratedBook => 'Кнігі';

  @override
  String get adminUnratedChannelContent => 'Каналы';

  @override
  String get adminUnratedLiveTvChannel => 'Жывое тэлебачанне';

  @override
  String get adminUnratedMovie => 'Фільмы';

  @override
  String get adminUnratedMusic => 'Музыка';

  @override
  String get adminUnratedTrailer => 'Трэйлеры';

  @override
  String get adminUnratedSeries => 'Серыялы';

  @override
  String get adminAccessSchedules => 'Расклады доступу';

  @override
  String get adminAccessSchedulesHint =>
      'Дазваляць доступ толькі ў пазначаны ніжэй час. Калі расклад не зададзены, доступ дазволены цэлы дзень.';

  @override
  String get adminAddSchedule => 'Дадаць расклад';

  @override
  String get adminScheduleDay => 'Дзень';

  @override
  String get adminScheduleStart => 'Пачатак';

  @override
  String get adminScheduleEnd => 'Канец';

  @override
  String get adminDayEveryday => 'Кожны дзень';

  @override
  String get adminDayWeekday => 'Будні дзень';

  @override
  String get adminDayWeekend => 'Выхадныя';

  @override
  String get adminDaySunday => 'Нядзеля';

  @override
  String get adminDayMonday => 'Панядзелак';

  @override
  String get adminDayTuesday => 'Аўторак';

  @override
  String get adminDayWednesday => 'Серада';

  @override
  String get adminDayThursday => 'Чацвер';

  @override
  String get adminDayFriday => 'Пятніца';

  @override
  String get adminDaySaturday => 'Субота';

  @override
  String get adminAllowedTags => 'Дазволеныя тэгі';

  @override
  String get adminAllowedTagsHint =>
      'Паказваецца толькі змесціва з гэтымі тэгамі. Пакіньце пустым, каб дазволіць усё.';

  @override
  String get adminBlockedTags => 'Заблакаваныя тэгі';

  @override
  String get adminBlockedTagsHint =>
      'Змесціва з гэтымі тэгамі схавана ад гэтага карыстальніка.';

  @override
  String get adminAddTag => 'Дадаць тэг';

  @override
  String get adminEnabledDevices => 'Уключаныя прылады';

  @override
  String get adminEnabledChannels => 'Уключаныя каналы';

  @override
  String get adminAuthProvider => 'Пастаўшчык аўтэнтыфікацыі';

  @override
  String get adminPasswordResetProvider => 'Пастаўшчык скіду пароля';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Максімум няўдалых спроб уваходу да блакіроўкі';

  @override
  String get adminLoginAttemptsHint =>
      'Задайце 0 для стандартнага значэння або -1, каб адключыць блакіроўку.';

  @override
  String get adminSyncPlayAccess => 'Доступ да SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Дазволіць ствараць групы і далучацца да іх';

  @override
  String get adminSyncPlayJoin => 'Дазволіць далучацца да груп';

  @override
  String get adminSyncPlayNone => 'Няма доступу';

  @override
  String get adminContentDeletionFolders => 'Дазволіць выдаленне змесціва з';

  @override
  String get adminResetPasswordWarning =>
      'Гэта выдаліць пароль. Карыстальнік зможа ўвайсці без пароля.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Сервер вярнуў HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Вы ўпэўнены, што хочаце выдаліць $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Карыстальнік \"$name\" выдалены';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Не ўдалося выдаліць карыстальніка: $error';
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
    return 'Не ўдалося стварыць ключ: $error';
  }

  @override
  String get adminKeyTokenMissing => 'У адказе сервера адсутнічае токен ключа';

  @override
  String get adminRevokeApiKey => 'Адклікаць ключ API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Адклікаць ключ для $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Ключ API ануляваны';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Не ўдалося адклікаць ключ: $error';
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
    return 'Маркер: $token\\nСтвораны: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Стварыць рэзервовую копію';

  @override
  String get adminBackupInclude => 'Выберыце, што ўключыць у рэзервовую копію.';

  @override
  String get adminBackupDatabase => 'База даных';

  @override
  String get adminBackupDatabaseAlways => 'Уключаецца заўсёды';

  @override
  String get adminBackupMetadata => 'Метаданыя';

  @override
  String get adminBackupSubtitles => 'Субтытры';

  @override
  String get adminBackupTrickplay => 'Відарысы Trickplay';

  @override
  String get adminCreatingBackup => 'Стварэнне рэзервовай копіі...';

  @override
  String get adminBackupCreated => 'Рэзервовае капіраванне паспяхова створана';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Не ўдалося стварыць рэзервовую копію: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Рэзервовы шлях адсутнічае ў адказе сервера';

  @override
  String adminBackupManifest(String name) {
    return 'Маніфест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Не ўдалося загрузіць маніфест: $error';
  }

  @override
  String get adminConfirmRestore => 'Пацвердзіце аднаўленне';

  @override
  String get adminRestoringBackup => 'Аднаўленне рэзервовай копіі...';

  @override
  String adminRestoreFailed(String error) {
    return 'Не ўдалося аднавіць рэзервовую копію: $error';
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
    return 'Захавана ў $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Не ўдалося захаваць файл: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Не ўдалося загрузіць $fileName';
  }

  @override
  String get adminSearchInLog => 'Пошук у журнале';

  @override
  String get adminNoMatchingLines => 'Няма адпаведных радкоў';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Не ўдалося загрузіць задачы: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Запланаваных заданняў не знойдзена';

  @override
  String get adminNoTasksMatchFilter =>
      'Няма задач, якія адпавядаюць бягучаму фільтру';

  @override
  String adminTaskStartFailed(String error) {
    return 'Не ўдалося пачаць заданне: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Не ўдалося спыніць задачу: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Не ўдалося загрузіць задачу: $error';
  }

  @override
  String get adminRunNow => 'Бяжы зараз';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Не ўдалося выдаліць трыгер: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Не атрымалася дадаць трыгер: $error';
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
    return '$hours гадзін(ы)';
  }

  @override
  String get adminDayOfWeek => 'Дзень тыдня';

  @override
  String get adminSearchPlugins => 'Пошук плагінаў...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Не ўдалося пераключыць плагін: $error';
  }

  @override
  String get adminUninstallPlugin => 'Выдаліць плагін';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Вы ўпэўнены, што хочаце выдаліць \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Не ўдалося выдаліць плагін: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Не ўдалося ўсталяваць пакет: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Не ўдалося ўсталяваць абнаўленне: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Не ўдалося загрузіць плагіны: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Няма плагінаў, якія адпавядаюць вашаму пошуку';

  @override
  String get adminNoPluginsInstalled => 'Убудоў не ўстаноўлена';

  @override
  String adminInstallUpdate(String version) {
    return 'Усталяваць абнаўленне (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Не ўдалося загрузіць каталог: $error';
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
    return '\"$name\" будзе выдалены пасля перазапуску сервера';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Не ўдалося выдаліць: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Абнаўленне \"$name\" да v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Немагчыма адкрыць налады: адсутнічае маркер аўтарызацыі.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Не ўдалося загрузіць плагін: $error';
  }

  @override
  String get adminPluginNotFound => 'Плагін не знойдзены';

  @override
  String adminPluginVersion(String version) {
    return 'Версія $version';
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
    return 'Вы ўпэўнены, што хочаце выдаліць \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Не ўдалося захаваць рэпазітары: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Не ўдалося загрузіць рэпазітары: $error';
  }

  @override
  String get adminRepositoryNameHint => 'напр. Jellyfin Стабільны';

  @override
  String get adminRepositoryUrl => 'URL рэпазітара';

  @override
  String get adminAddEntry => 'Дадаць запіс';

  @override
  String get adminInvalidUrl => 'Няправільны URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Немагчыма загрузіць налады плагіна: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Немагчыма адкрыць $uri';
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
  String get adminBaseUrlHint => 'напр. /jellyfin';

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
    return 'Не ўдалося загрузіць метаданыя: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Не ўдалося захаваць метаданыя: $error';
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
    return 'Не ўдалося абнавіць метаданыя: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Аддаленых супадзенняў не знойдзена';

  @override
  String get adminRemoteResults => 'Аддаленыя вынікі';

  @override
  String get adminRemoteMetadataApplied => 'Ужытыя аддаленыя метаданыя';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Збой аддаленага пошуку: $error';
  }

  @override
  String get adminUpdateContentType => 'Абнавіць тып кантэнту';

  @override
  String get adminContentType => 'Тып кантэнту';

  @override
  String get adminContentTypeUpdated => 'Тып кантэнту абноўлены';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Не ўдалося абнавіць тып кантэнту: $error';
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
    return 'Відарыс $imageType абноўлены';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Не ўдалося спампаваць выяву: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Фармат выявы не падтрымліваецца';

  @override
  String get adminImageReadFailed => 'Не ўдалося прачытаць выбраную выяву';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType выява запампавана';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Не ўдалося загрузіць выяву: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Выдаліць выяву $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Выява $imageType выдалена';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Не ўдалося выдаліць выяву: $error';
  }

  @override
  String get adminAllProviders => 'Усе правайдэры';

  @override
  String get adminNoRemoteImages => 'Аддаленыя выявы не знойдзены';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Памылка выяўлення цюнэра: $error';
  }

  @override
  String get adminAddTuner => 'Дадаць цюнэр';

  @override
  String get adminEditTuner => 'Змяніць цюнер';

  @override
  String get adminTunerTypeM3u => 'Цюнер M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Файл або URL';

  @override
  String get adminTunerIpAddress => 'IP-адрас цюнера';

  @override
  String get adminTunerFriendlyName => 'Зручная назва';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Ліміт адначасовых злучэнняў';

  @override
  String get adminTunerCountHelp =>
      'Максімальная колькасць патокаў, якія цюнер дазваляе адначасова. Задайце 0 для неабмежаванай колькасці.';

  @override
  String get adminTunerFallbackBitrate =>
      'Рэзервовы максімальны бітрэйт патоку';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Імпартаваць толькі выбраныя каналы';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Дазволіць апаратнае транскадаванне';

  @override
  String get adminTunerAllowFmp4 => 'Дазволіць кантэйнер транскадавання fMP4';

  @override
  String get adminTunerAllowStreamSharing =>
      'Дазволіць сумеснае выкарыстанне патоку';

  @override
  String get adminTunerEnableStreamLooping => 'Уключыць зацыкліванне патоку';

  @override
  String get adminTunerIgnoreDts => 'Ігнараваць DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Чытаць уваход з зыходнай частатой кадраў';

  @override
  String get adminEditProvider => 'Змяніць пастаўшчыка';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Файл або URL';

  @override
  String get adminXmltvMoviePrefix => 'Прэфікс фільмаў';

  @override
  String get adminXmltvMovieCategories => 'Катэгорыі фільмаў';

  @override
  String get adminXmltvCategoriesHelp =>
      'Раздзяляйце некалькі катэгорый вертыкальнай рыскай.';

  @override
  String get adminXmltvKidsCategories => 'Дзіцячыя катэгорыі';

  @override
  String get adminXmltvNewsCategories => 'Катэгорыі навін';

  @override
  String get adminXmltvSportsCategories => 'Спартыўныя катэгорыі';

  @override
  String get adminSdUsername => 'Імя карыстальніка';

  @override
  String get adminSdPassword => 'Пароль';

  @override
  String get adminSdCountry => 'Краіна';

  @override
  String get adminSdCountrySelect => 'Выберыце краіну';

  @override
  String get adminSdPostalCode => 'Паштовы індэкс';

  @override
  String get adminSdGetListings => 'Атрымаць праграму';

  @override
  String get adminSdListings => 'Праграма перадач';

  @override
  String get adminEnableAllTuners => 'Уключыць усе цюнеры';

  @override
  String get adminTunerType => 'Тып цюнэра';

  @override
  String get adminTunerAdded => 'Цюнэр дададзены';

  @override
  String adminTunerAddFailed(String error) {
    return 'Не атрымалася дадаць цюнэр: $error';
  }

  @override
  String get adminAddGuideProvider => 'Дадаць пастаўшчыка гіда';

  @override
  String get adminProviderType => 'Тып пастаўшчыка';

  @override
  String get adminProviderAdded => 'Пастаўшчык дададзены';

  @override
  String adminProviderAddFailed(String error) {
    return 'Не атрымалася дадаць пастаўшчыка: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Не ўдалося выдаліць цюнэр: $error';
  }

  @override
  String get adminTunerResetRequested => 'Запытаны скід цюнера';

  @override
  String adminTunerResetFailed(String error) {
    return 'Не ўдалося скінуць цюнэр: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Гэты тып цюнера не падтрымлівае скід.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Не ўдалося выдаліць пастаўшчыка: $error';
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
  String get adminMovieRecordingPath => 'Шлях для запісу фільмаў';

  @override
  String get adminGuideDays => 'Дзён даных праграмы';

  @override
  String get adminGuideDaysAuto => 'Аўтаматычна';

  @override
  String adminGuideDaysValue(int days) {
    return '$days дзён';
  }

  @override
  String get adminRecordingPostProcessor => 'Шлях да праграмы постапрацоўкі';

  @override
  String get adminRecordingPostProcessorArgs => 'Аргументы постапрацоўшчыка';

  @override
  String get adminSaveRecordingNfo => 'Захоўваць метаданыя NFO для запісаў';

  @override
  String get adminSaveRecordingImages => 'Захоўваць відарысы запісаў';

  @override
  String get adminLiveTvSectionTiming => 'Час';

  @override
  String get adminLiveTvSectionPaths => 'Шляхі запісу';

  @override
  String get adminLiveTvSectionPostProcessing => 'Постапрацоўка';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Даныя праграмы: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Налады запісу захаваны';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Не ўдалося захаваць налады: $error';
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
    return 'Не ўдалося абнавіць супастаўленні: $error';
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
  String get adminRefreshGuideData => 'Абнавіць даныя праграмы';

  @override
  String get adminGuideRefreshStarted => 'Абнаўленне даных праграмы пачалося';

  @override
  String get adminGuideRefreshUnavailable =>
      'Задача абнаўлення праграмы недаступная на гэтым серверы.';

  @override
  String get adminAddProvider => 'Дадаць пастаўшчыка';

  @override
  String get adminNoListingProviders => 'Пастаўшчыкі спісаў не настроены';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Шлях запісу: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Шлях серыі: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Папярэдняя абіўка: $minutes мін';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Запаўненне: $minutes мін';
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
    return 'Аднавіць рэзервовую копію $name зараз?';
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
    return '$minutesхв таму';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hoursгадз таму';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$daysдзён таму';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Не ўдалося загрузіць $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return 'Супадзенні $count';
  }

  @override
  String get adminLogViewerNoMatches => 'Няма адпаведных радкоў';

  @override
  String get adminMetadataEditorTitle => 'Рэдактар ​​метададзеных';

  @override
  String get adminMetadataIdentify => 'Апазнаць';

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
    return 'Відарыс $imageType абноўлены';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType выява запампавана';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Выява $imageType выдалена';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Не ўдалося спампаваць выяву: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Не ўдалося прачытаць выбраную выяву';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Не ўдалося загрузіць выяву: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Выдаліць выяву $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Гэта выдаляе бягучую выяву з элемента.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Не ўдалося выдаліць выяву: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Выберыце выяву $imageType';
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
    return 'Абнаўленне даступна: v$version';
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
    return 'Усталяваць абнаўленне (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Няма пакетаў, якія адпавядаюць вашаму пошуку';

  @override
  String get adminPluginsCatalogEmpty => 'Няма даступных пакетаў';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" усталёўваецца...';
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
    return '$name Налады';
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
    return 'Не ўдалося загрузіць рэпазітары: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Выдаліць рэпазітар';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Вы ўпэўнены, што хочаце выдаліць \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Прыбраць';

  @override
  String adminReposSaveFailed(String error) {
    return 'Не ўдалося захаваць рэпазітары: $error';
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
  String get adminReposNameHint => 'напр. Jellyfin Стабільны';

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
  String get adminBrandingSplashUpload => 'Загрузіць відарыс';

  @override
  String get adminBrandingSplashUploaded => 'Застаўка абноўлена';

  @override
  String get adminBrandingSplashUploadFailed => 'Не ўдалося загрузіць застаўку';

  @override
  String get adminBrandingSplashDeleted => 'Застаўка выдалена';

  @override
  String get adminBrandingNoSplash => 'Няма ўласнай застаўкі';

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
  String get adminPlaybackQsvDevice => 'Прылада QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Уключыць пашыраны дэкодэр NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Аддаваць перавагу сістэмнаму апаратнаму дэкодэру';

  @override
  String get adminPlaybackColorDepth => 'Глыбіня колеру апаратнага дэкадавання';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-бітнае дэкадаванне HEVC';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-бітнае дэкадаванне VP9';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      '8/10-бітнае дэкадаванне HEVC RExt';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      '12-бітнае дэкадаванне HEVC RExt';

  @override
  String get adminPlaybackHwEncodingSection => 'Апаратнае кадаванне';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Дазволіць кадаванне HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Дазволіць кадаванне AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Уключыць нізкаспажывальны кадавальнік Intel H.264';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Уключыць нізкаспажывальны кадавальнік Intel HEVC';

  @override
  String get adminPlaybackToneMapping => 'Танальнае адлюстраванне';

  @override
  String get adminPlaybackEnableTonemapping =>
      'Уключыць танальнае адлюстраванне';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Уключыць танальнае адлюстраванне VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Уключыць танальнае адлюстраванне VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Алгарытм танальнага адлюстравання';

  @override
  String get adminPlaybackTonemappingMode => 'Рэжым танальнага адлюстравання';

  @override
  String get adminPlaybackTonemappingRange =>
      'Дыяпазон танальнага адлюстравання';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Дэсатурацыя танальнага адлюстравання';

  @override
  String get adminPlaybackTonemappingPeak => 'Пік танальнага адлюстравання';

  @override
  String get adminPlaybackTonemappingParam =>
      'Параметр танальнага адлюстравання';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Яркасць танальнага адлюстравання VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Кантраст танальнага адлюстравання VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Прэсеты і якасць';

  @override
  String get adminPlaybackEncoderPreset => 'Прэсет кадавальніка';

  @override
  String get adminPlaybackH264Crf => 'CRF кадавання H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF кадавання H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Метад дэінтэрлейсінгу';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Падвойваць частату кадраў пры дэінтэрлейсінгу';

  @override
  String get adminPlaybackAudioSection => 'Аўдыё';

  @override
  String get adminPlaybackEnableAudioVbr => 'Уключыць кадаванне аўдыё VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Узмацненне пры звядзенні аўдыё';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Алгарытм звядзення ў стэрэа';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Максімальны памер чаргі мультыплексавання';

  @override
  String get adminPlaybackAutoOption => 'Аўта';

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
  String get adminTaskStop => 'Спыніць';

  @override
  String get adminRunningTasks => 'Задачы, што выконваюцца';

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
    return 'Штодня ў $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Кожны $day у $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Кожныя $duration';
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
      other: '$count гадзіны',
      many: '$count гадзін',
      few: '$count гадзіны',
      one: '$count гадзіна',
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
    return '$daysдзён таму';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hoursгадз таму';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutesхв таму';
  }

  @override
  String get adminActivityNow => 'зараз';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes хв';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours гадз';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days дз';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Наладзьце генерацыю відарысаў trickplay для эскізаў папярэдняга прагляду пры перамотцы.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Публічны порт HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Базавы URL';

  @override
  String get adminNetworkingBaseUrlHint => 'напр. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Публічны порт HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Патрабаваць HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Перанакіроўваць усе аддаленыя запыты на HTTPS. Не дзейнічае, калі ў сервера няма сапраўднага сертыфіката.';

  @override
  String get adminNetworkingCertPassword => 'Пароль сертыфіката';

  @override
  String get adminNetworkingIpSettings => 'Налады IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Уключыць IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Уключыць IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Уключыць аўтаматычнае супастаўленне портаў';

  @override
  String get adminNetworkingLocalSubnets => 'Сеткі LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Спіс IP-адрасоў або падсетак CIDR праз коску ці з новага радка, якія лічацца лакальнай сеткай.';

  @override
  String get adminNetworkingPublishedUris => 'Апублікаваныя URI сервера';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Супаставіце падсетку або адрас з апублікаваным URL, напр. all=https://example.com';

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
  String get adminPlaybackThrottleDelay =>
      'Затрымка абмежавання патоку (секунды)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Дазволіць здабыванне субтытраў на ляту';

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
    return 'Не ўдалося абнавіць тып кантэнту: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Парог павольнай рэакцыі (мс)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Уключыць папярэджанні пра павольны адказ';

  @override
  String get adminGeneralQuickConnect => 'Уключыць Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Сервер';

  @override
  String get adminGeneralSectionMetadata => 'Метаданыя';

  @override
  String get adminGeneralSectionPaths => 'Шляхі';

  @override
  String get adminGeneralSectionPerformance => 'Прадукцыйнасць';

  @override
  String get adminGeneralCachePath => 'Шлях кэша';

  @override
  String get adminGeneralMetadataPath => 'Шлях метаданых';

  @override
  String get adminGeneralServerName => 'Імя сервера';

  @override
  String get adminGeneralDisplayLanguage => 'Пажаданая мова адлюстравання';

  @override
  String get adminSettingsLoadFailed => 'Не ўдалося загрузіць налады';

  @override
  String get adminDiscover => 'Адкрыйце для сябе';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Не ўдалося абнавіць супастаўленні: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Ліміт часу: $duration';
  }

  @override
  String get folders => 'Папкі';

  @override
  String get libraries => 'Бібліятэкі';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay адключана';

  @override
  String get syncPlayDisabledMessage =>
      'Каб выкарыстоўваць сінхранізаванае прайграванне, уключыце SyncPlay у наладах.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сервер не падтрымліваецца';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'Для SyncPlay патрабуецца сервер Jellyfin. Бягучы сервер не падтрымлівае гэта.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Група';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay група';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# удзельніка',
      many: '# удзельнікаў',
      few: '# удзельнікі',
      one: '# удзельнік',
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
    return 'Элемент $index';
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
    return '$userName далучыўся да групы SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName пакінуў групу SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay доступ забаронены';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Вы не маеце доступу да аднаго або некалькіх элементаў у гэтай SyncPlay групе. Папрасіце ўладальніка групы праверыць дазволы бібліятэкі або выбраць іншую чаргу.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Сінхранізацыя прайгравання з $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Галасавы пошук недаступны.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Прамая гульня не атрымалася';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Не ўдалося пачаць прамое прайграванне для гэтага патоку Dolby Vision. Паўтарыць з дапамогай перакадзіравання сервера?';

  @override
  String get retryWithTranscode => 'Паўтарыце спробу з перакадзіраваннем';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Не падтрымліваецца';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Гэта прылада не можа дэкадаваць змесціва Dolby Vision непасрэдна. Выкарыстоўвайце HDR10 рэзервовы варыянт або запытвайце перакадзіраванне сервера.';

  @override
  String get rememberMyChoice => 'Запомні мой выбар';

  @override
  String get playHdr10Fallback => 'Гуляць HDR10 запасны';

  @override
  String get requestTranscode => 'Запытаць перакадзіраванне';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'знойдзена # радка',
      many: 'знойдзена # радкоў',
      few: 'знойдзена # радкі',
      one: 'знойдзены # радок',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'Вы па-за сеткай';

  @override
  String get offlineBannerSubtitle => 'Паказваем вашы спампоўкі';

  @override
  String get offlineBannerAction => 'Спампоўкі';

  @override
  String get serverUnreachableBannerTitle => 'Не ўдаецца звязацца з серверам';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Прайграванне са спамповак, пакуль ён не вернецца';

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
    return 'Збой кіравання трансляцыяй: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Элементы кіравання';
  }

  @override
  String get castDeviceVolume => 'Гучнасць прылады';

  @override
  String get castVolumeUnavailable => 'Недаступны';

  @override
  String castStopKind(String kind) {
    return 'Спыніць $kind';
  }

  @override
  String get audioLabel => 'Аўдыё';

  @override
  String get subtitlesLabel => 'субтытры';

  @override
  String get pinConfirmTitle => 'Пацвердзіце PIN-код';

  @override
  String get pinSetTitle => 'Усталюйце PIN-код';

  @override
  String get pinEnterTitle => 'Увядзіце PIN-код';

  @override
  String get pinReenterToConfirm =>
      'Паўторна ўвядзіце PIN-код для пацверджання';

  @override
  String pinEnterNDigit(int length) {
    return 'Увядзіце $length-значны PIN-код';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Увядзіце свой $length-значны PIN-код';
  }

  @override
  String get pinIncorrect => 'Няправільны PIN-код';

  @override
  String get pinMismatch => 'PIN-коды не супадаюць';

  @override
  String get pinForgot => 'Забыўся PIN-код?';

  @override
  String get pinClear => 'Ачысціць';

  @override
  String get pinBackspace => 'Выдаліць';

  @override
  String get quickConnectAuthorized => 'Запыт Quick Connect дазволены.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Код Quick Connect несапраўдны або пратэрмінаваны.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect не падтрымліваецца на гэтым серверы.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Не ўдалося аўтарызаваць код Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect адключаны на гэтым серверы.';

  @override
  String get quickConnectForbidden =>
      'Ваш уліковы запіс не можа аўтарызаваць гэты запыт Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Код Quick Connect не знойдзены. Паспрабуйце новы код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Памылка Quick Connect: $message';
  }

  @override
  String get quickConnectEnterCode => 'Увядзіце код';

  @override
  String get quickConnectAuthorize => 'Аўтарызаваць';

  @override
  String remoteCommandFailed(String error) {
    return 'Збой каманды: $error';
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
    return 'Не атрымалася пачаць трансляцыю: $error';
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
    return 'Спампоўка $name...';
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
  String get stillWatchingStop => 'Спыніць';

  @override
  String get stillWatchingContinue => 'Працягнуць';

  @override
  String skipSegment(String segment) {
    return 'Прапусціць $segment';
  }

  @override
  String get liveTv => 'Жывое тэлебачанне';

  @override
  String get continueWatchingAndNextUp => 'Працягнуць прагляд і далей';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Спампоўка $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Спампоўка $fileName';
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
  String get contextMenuHideFromContinueWatching =>
      'Схаваць з «Працягнуць прагляд»';

  @override
  String get contextMenuHideFromNextUp => 'Схаваць з «Далей»';

  @override
  String get contextMenuAddToCollection => 'Дадаць у калекцыю';

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
      'Налады аўдыё/відэа, субтытры, загрузкі і элементы кіравання SyncPlay';

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
  String get settingsConnectionSection => 'ЗЛУЧЭННЕ';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Дазволіць самападпісаныя сертыфікаты';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Давяраць серверам з самападпісанымі сертыфікатамі TLS або сертыфікатамі прыватнага ЦС. Уключайце толькі для сервераў, якімі вы кіруеце. Гэта адключае праверку сертыфікатаў для ўсіх злучэнняў.';

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
  String get settingsDetailsScreen => 'Экран звестак';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Стыль, размыццё фону і паводзіны ўкладак';

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
  String get settingsShowSeerrButtonInNavigation =>
      'Паказваць кнопку Seerr на панэлі навігацыі';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Заўсёды паказваць тэкставыя подпісы на верхняй панэлі навігацыі';

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
      'Moonbase забяспечвае інтэграцыю на баку сервера, уключаючы дадатковыя крыніцы рэйтынгаў, запыты Seerr і сінхранізаваныя налады.';

  @override
  String get settingsOfflineDownloads => 'Пазасеткавыя спампоўкі';

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
  String get settingsSupportMoonfinSubtitle => 'Ахвяруйце каву распрацоўніку';

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
      other: '# ліцэнзійнай заўвагі',
      many: '# ліцэнзійных заўваг',
      few: '# ліцэнзійныя заўвагі',
      one: '# ліцэнзійная заўвага',
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
  String get settingsMediaSegmentCountdown => 'Адлік медыясегмента';

  @override
  String get settingsProgressBar => 'Панэль прагрэсу';

  @override
  String get settingsTimer => 'Таймер';

  @override
  String get settingsNone => 'Няма';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (спадчына)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (спадчына)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (рэкамендуецца)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Рэзервны варыянт';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Паводзіны загалоўкаў Dolby Vision на прыладах без дэкадавання Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Пытайцеся кожны раз';

  @override
  String get settingsPreferHdr10Fallback =>
      'Аддайце перавагу HDR10 рэзервовым варыянтам';

  @override
  String get settingsPreferServerTranscode =>
      'Аддаць перавагу перакадаванню сервера';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Профіль 7 Прамая гульня';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Кантралюе, ці павінны патокі ўзроўню паляпшэння профілю 7 Dolby Vision накіроўваць прайграванне.';

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
    return '$value мс';
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
      'Стварайце, далучайцеся да SyncPlay груп або кіруйце імі';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Уключана';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Уключыць функцыі групавога прагляду';

  @override
  String get settingsSyncplayButton => 'SyncPlay Кнопка';

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
    return 'Апошні $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Нядаўна выйшлі: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Аўтапрайграванне наступнага эпізоду';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Аўтаматычна прайграваць наступны эпізод, калі ён даступны.';

  @override
  String get skipSilenceTitle => 'Прапусціць цішыню';

  @override
  String get skipSilenceSubtitle =>
      'Аўтаматычна прапускаць бясшумныя гукавыя сегменты, калі гэта падтрымліваецца патокам.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Дазволіць знешнія гукавыя эфекты';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Дазволіць праграмам эквалайзера і эфектаў (напрыклад, Wavelet) далучацца да сеансаў прайгравання Media3.';

  @override
  String get disableTunnelingTitle => 'Адключыць тунэляванне';

  @override
  String get disableTunnelingSubtitle =>
      'Прымусовае нетунэляванае прайграванне. Карысна на прыладах з разрывамі тунэлявання аўдыё/відэа.';

  @override
  String get enableTunnelingTitle => 'Уключыць тунэляванне';

  @override
  String get enableTunnelingSubtitle =>
      'Для дасведчаных. Накіроўвае аўдыё і відэа праз звязаны апаратны шлях. Стандартна выключана, бо на некаторых прыладах выклікае перапынкі гуку і відэа.';

  @override
  String get mapDolbyVisionP7Title =>
      'Адлюструйце Dolby Vision профіль 7 да HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Прайгравайце 7 патокаў профілю Dolby Vision як HDR10-сумяшчальны HEVC на прыладах без DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Выкарыстоўвайце ўбудаваныя стылі субтытраў';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Ужывайце колеры, шрыфты і пазіцыянаванне, убудаваныя ў дарожку субтытраў. Адключыце, каб замест гэтага выкарыстоўваць свае налады стылю субцітраў.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Выкарыстоўвайце памеры шрыфтоў убудаваных субтытраў';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Прымяніць падказкі памеру шрыфта, убудаваныя ў дарожку субтытраў. Адключыце выкарыстанне памеру субтытраў з вашых налад стылю.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Паказваць звесткі пра медыя';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Паказваць звесткі пра выбраны элемент угары старонак бібліятэкі.';

  @override
  String get hideBackdropsInLibraries =>
      'Хаваць фонавыя відарысы пры праглядзе?';

  @override
  String get useDetailedSubHeadings =>
      'Выкарыстоўвайце падрабязныя падзагалоўкі';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Паказаць падрабязны або мінімальны падрадок на старонках бібліятэкі.';

  @override
  String get savedThemesDeleteDialogTitle => 'Выдаліць захаваную тэму?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Выдаліць \"$themeName\" з кэша гэтай прылады?';
  }

  @override
  String get themeStore => 'Крама тэм';

  @override
  String get themeStoreSubtitle => 'Праглядайце і захоўвайце тэмы супольнасці';

  @override
  String get themeStoreDescription =>
      'Захавайце тэму, каб карыстацца ёй, як іншымі захаванымі тэмамі.';

  @override
  String get themeStoreEmpty => 'Зараз няма даступных тэм.';

  @override
  String get themeStoreLoadFailed =>
      'Не ўдалося загрузіць Краму тэм. Праверце злучэнне і паспрабуйце зноў.';

  @override
  String get themeStoreSave => 'Захаваць';

  @override
  String get themeStoreSaveAndApply => 'Захаваць і ўжыць';

  @override
  String get themeStoreSaved => 'Захавана';

  @override
  String get themeStoreInvalidMessage => 'Не ўдалося загрузіць гэтую тэму.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Захавана «$themeName».';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Выдалены \"$themeName\" з гэтай прылады.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Немагчыма выдаліць \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Захаваныя тэмы';

  @override
  String get savedThemesDescription =>
      'Гэта тэмы, спампаваныя з плагіна Moonfin для бягучага сервера. Выдаленне выдаляе толькі гэтую лакальную копію.';

  @override
  String get savedThemesEmpty =>
      'Для гэтага сервера не знойдзена захаваных тэм.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • У цяперашні час актыўны';
  }

  @override
  String get savedThemesDeleteTooltip => 'Выдаліць захаваную тэму';

  @override
  String get savedThemesManageSubtitle =>
      'Кіруйце спампаванымі тэмамі плагінаў на гэтай прыладзе';

  @override
  String get themeEditor => 'Рэдактар ​​тэм';

  @override
  String get themeEditorSubtitle =>
      'Адкрыйце рэдактар ​​тэм Moonfin у сваім браўзеры';

  @override
  String get homeScreen => 'Галоўны экран';

  @override
  String get bottomBar => 'Ніжняя панэль';

  @override
  String get homeRowsStyleClassic => 'Класіка';

  @override
  String get homeRowsStyleModern => 'Сучасны';

  @override
  String get homeRowsSection => 'Хатнія шэрагі';

  @override
  String get homeRowDisplay => 'Адлюстраванне радкоў галоўнай';

  @override
  String get homeRowSections => 'Раздзелы радкоў галоўнай';

  @override
  String get homeRowToggles => 'Пераключальнікі радкоў галоўнай';

  @override
  String get homeRowTogglesSubtitle =>
      'Уключыце або адключыце катэгорыі радкоў галоўнай на аснове бібліятэк';

  @override
  String get homeRowTogglesDescription =>
      'Уключыце наступныя пераключальнікі, каб паказваць радкі ў раздзелах галоўнай.';

  @override
  String get rowsType => 'Тып радкоў';

  @override
  String get rowsTypeDescription =>
      'Classic захоўвае тып выявы і накладанне інфармацыі для кожнага радка. У Modern выкарыстоўваюцца радкі з партрэтам на фон.';

  @override
  String get displayFavoritesRows => 'Адлюстраванне радкоў абранага';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Паказаць любімыя фільмы, серыялы і іншыя любімыя радкі ў галоўных раздзелах.';

  @override
  String get favoritesRowSorting => 'Сартаванне радкоў абранага';

  @override
  String get favoritesRowSortingDescription =>
      'Сартуйце радкі \"Выбранае\" па даце дадання, даце выпуску, у алфавітным парадку і іншым.';

  @override
  String get displayCollectionsRows => 'Адлюстраванне радкоў калекцый';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Паказваць радкі калекцый у галоўных раздзелах.';

  @override
  String get collectionsRowSorting => 'Сартаванне радкоў калекцый';

  @override
  String get collectionsRowSortingDescription =>
      'Сартуйце радкі калекцый па даце дадання, даце выпуску, у алфавітным парадку і іншым.';

  @override
  String get displayGenresRows => 'Адлюстраванне радкоў жанраў';

  @override
  String get displayGenresRowsSubtitle =>
      'Паказваць радкі жанраў у галоўных раздзелах.';

  @override
  String get genresRowSorting => 'Сартаванне радкоў па жанрах';

  @override
  String get genresRowSortingDescription =>
      'Сартуйце радкі жанраў па даце дадання, даце выпуску, у алфавітным парадку і г.д.';

  @override
  String get genresRowItems => 'Элементы радка жанраў';

  @override
  String get genresRowItemsDescription =>
      'Паказаць фільмы, серыялы або абодва ў радках жанраў.';

  @override
  String get displayPlaylistsRows => 'Паказваць радкі плэйлістоў';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Паказваць радкі плэйлістоў у раздзелах галоўнай.';

  @override
  String get playlistsRowSorting => 'Сартаванне радкоў плэйлістоў';

  @override
  String get playlistsRowSortingDescription =>
      'Сартуйце радкі плэйлістоў па даце дадання, даце выхаду, алфавіце і іншым.';

  @override
  String get displayAudioRows => 'Паказваць радкі аўдыё';

  @override
  String get displayAudioRowsSubtitle =>
      'Паказваць радкі аўдыё ў раздзелах галоўнай.';

  @override
  String get audioRowsSorting => 'Сартаванне радкоў аўдыё';

  @override
  String get audioRowsSortingDescription =>
      'Сартуйце радкі аўдыё па даце дадання, даце выхаду, алфавіце і іншым.';

  @override
  String get audioPlaylists => 'Аўдыяплэйлісты';

  @override
  String get appearance => 'Знешні выгляд';

  @override
  String get layout => 'Кампаноўка';

  @override
  String get theme => 'Тэма';

  @override
  String get keyboard => 'Клавіятура';

  @override
  String get navButtons => 'Кнопкі';

  @override
  String get rendering => 'Рэндэрынг';

  @override
  String get mpvConfiguration => 'Канфігурацыя MPV';

  @override
  String get cardSize => 'Памер карты';

  @override
  String get externalPlayerApp => 'Прыкладанне для вонкавага прайгравальніка';

  @override
  String get externalPlayerAppDescription =>
      'Задайце знешні плэер, каб уключыць прайграванне праз доўгае націсканне';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Паказваць сродак выбару праграм, калі пачынаецца прайграванне.';

  @override
  String get loadingInstalledPlayers =>
      'Загрузка ўсталяваных прайгравальнікаў...';

  @override
  String get connection => 'Злучэнне';

  @override
  String get audioTranscodeTarget => 'Мэта перакадавання аўдыя';

  @override
  String get passthrough => 'Прахадны';

  @override
  String get supportedOnThisDevice => 'Падтрымліваецца на гэтай прыладзе';

  @override
  String get notSupportedOnThisDevice => 'Не падтрымліваецца на гэтай прыладзе';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Праходжанне';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) на знешні дэкодэр.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD з праходжаннем Atmos (JOC).';

  @override
  String get mediaPlayerBehavior => 'Паводзіны медыяплэера';

  @override
  String get playbackEnhancements => 'Паляпшэнні прайгравання';

  @override
  String get alwaysOn => 'Заўсёды ўключаны.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Заменіце Skip Outro на Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Паказваць накладанне Next Up замест кнопкі Skip Outro.';

  @override
  String get playerRouting => 'Маршрутызацыя гульцоў';

  @override
  String get preferSoftwareDecoders => 'Аддайце перавагу праграмным дэкодэрам';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Выкарыстоўвайце FFmpeg (аўдыё) і libgav1 (AV1) перад апаратнымі дэкодэрамі. Адключыць, калі парушаецца праходжанне гуку HDMI.';

  @override
  String get useExternalPlayer => 'Выкарыстоўвайце знешні прайгравальнік';

  @override
  String get useExternalPlayerSubtitle =>
      'Адкрыйце прайграванне відэа ў абраным знешнім дадатку на Android TV.';

  @override
  String get automaticQueuing => 'Аўтаматычная чарга';

  @override
  String get preferSdhSubtitles => 'Аддайце перавагу субтытрам SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Прыярытэзуйце дарожкі субтытраў SDH/CC пры аўтаматычным выбары.';

  @override
  String get webDiagnostics => 'Вэб дыягностыка';

  @override
  String get webDiagnosticsTitle => 'Moonfin Вэб-дыягностыка';

  @override
  String get webDiagnosticsIntro =>
      'Выкарыстоўвайце гэтую старонку для дыягностыкі праблем з падключэннем браўзера (CORS, змешаны кантэнт і налады выяўлення).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Выяўлены збой са змешаным зместам';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Выяўлены збой CORS/Preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin выявіў старонку HTTPS, якая спрабуе выклікаць URL-адрас сервера HTTP. Браўзеры блакіруюць гэты запыт, перш чым ён дасягне вашага сервера.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin выявіў памылку запыту на ўзроўні браўзера, якая звычайна ўзнікае з-за адсутнасці CORS або перадпалётных загалоўкаў на медыясерверы.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Мэтавы URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Падрабязнасці: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Бягучы кантэкст выканання';

  @override
  String get webDiagnosticsOrigin => 'Паходжанне';

  @override
  String get webDiagnosticsScheme => 'Схема';

  @override
  String get webDiagnosticsPluginMode => 'Рэжым плагіна';

  @override
  String get webDiagnosticsWebRtcScan => 'Сканаванне WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'Прымусовы URL-адрас сервера';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL-адрас сервера па змаўчанні';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'URL-адрас проксі-сервера выяўлення';

  @override
  String get notConfigured => 'не наладжана';

  @override
  String get webDiagnosticsMixedContent => 'Змешаны кантэнт';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Гэта старонка загружаецца праз HTTPS, але адзін або некалькі настроеных URL-адрасоў з\'яўляюцца HTTP. Браўзеры блакуюць HTTPS-старонкі ад выкліку HTTP API.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Выпраўленне: абслугоўванне вашага медыясервера або канчатковай кропкі проксі праз HTTPS або загрузка Moonfin праз HTTP толькі ў надзейных лакальных сетках.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'У бягучых наладах выканання не выяўлена відавочнай канфігурацыі змешанага змесціва.';

  @override
  String get webDiagnosticsCorsChecklist => 'Кантрольны спіс CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Дазволіць паходжанне браўзера ў Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Уключыце аўтарызацыю, X-Emby-аўтарызацыю і X-Emby-токен у Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Адкрываць Content-Range і Accept-Ranges для трансляцыі і пошуку.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Вярніце 204 да OPTIONS перадпалётных запытаў.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Прыклад фрагмента загалоўка (стыль nginx)';

  @override
  String get note => 'Заўвага';

  @override
  String get webDiagnosticsNonWebNote =>
      'Гэты маршрут дыягностыкі прызначаны для вэб-зборак. Калі вы бачыце гэта на іншай платформе, гэтыя праверкі могуць не прымяняцца.';

  @override
  String get backToServerSelect => 'Назад да выбару сервера';

  @override
  String get signOutAllUsers => 'Выйсці ўсіх карыстальнікаў';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Дазвол мікрафона забаронены назаўжды. Уключыце яго ў наладах сістэмы.';

  @override
  String get voiceSearchPermissionRequired =>
      'Для галасавога пошуку патрабуецца доступ да мікрафона.';

  @override
  String get voiceSearchNoMatch => 'Не зразумеў. Паспрабуйце яшчэ раз.';

  @override
  String get voiceSearchNoSpeechDetected => 'Гаворка не выяўлена.';

  @override
  String get voiceSearchMicrophoneError => 'Памылка мікрафона.';

  @override
  String get voiceSearchNeedsInternet =>
      'Для галасавога пошуку патрэбны інтэрнэт.';

  @override
  String get voiceSearchServiceBusy =>
      'Галасавы сэрвіс заняты. Паспрабуйце яшчэ раз.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Дазвол мікрафона забаронены назаўжды.';

  @override
  String get microphonePermissionDenied =>
      'У дазволе на выкарыстанне мікрафона адмоўлена.';

  @override
  String get speechRecognitionUnavailable =>
      'Распазнаванне маўлення недаступнае на гэтай прыладзе.';

  @override
  String get openIosRoutePicker => 'Адкрыйце сродак выбару маршруту iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay інструмент выбару маршруту недаступны на гэтай прыладзе.';

  @override
  String get videos => 'Відэа';

  @override
  String get programs => 'Праграмы';

  @override
  String get songs => 'песні';

  @override
  String get photoAlbums => 'Фотаальбомы';

  @override
  String get photos => 'Фатаграфіі';

  @override
  String get people => 'Людзі';

  @override
  String get recentlyReleasedEpisodes => 'Нядаўна выпушчаныя эпізоды';

  @override
  String get watchAgain => 'Глядзець яшчэ раз';

  @override
  String get guestAppearances => 'Выступленні гасцей';

  @override
  String get appearancesSeerr => 'З\'яўленне (Seerr)';

  @override
  String get crewContributionsSeerr => 'Удзел здымачнай групы (Seerr)';

  @override
  String get watchWithGroup => 'Глядзіце з групай';

  @override
  String get errors => 'Памылкі';

  @override
  String get warnings => 'Папярэджанні';

  @override
  String get disk => 'Дыск';

  @override
  String get openInBrowser => 'Адкрыць у браўзеры';

  @override
  String get embeddedBrowserNotAvailable =>
      'Убудаваны браўзер недаступны на гэтай платформе.';

  @override
  String get adminRestartServerConfirmation =>
      'Вы ўпэўнены, што хочаце перазапусціць сервер?';

  @override
  String get adminShutdownServerConfirmation =>
      'Вы ўпэўнены, што хочаце закрыць сервер? Вам трэба будзе перазапусціць яго ўручную.';

  @override
  String get internal => 'Унутраны';

  @override
  String get idle => 'Бяздзейны';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Карыстальнікі не знойдзены';

  @override
  String get adminNoUsersMatchSearch =>
      'Няма карыстальнікаў, якія адпавядаюць вашаму пошуку';

  @override
  String get adminNoDevicesFound => 'Прылады не знойдзены';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Няма прылад, якія адпавядаюць бягучым фільтрам';

  @override
  String get passwordSet => 'Пароль усталяваны';

  @override
  String get noPasswordConfigured => 'Пароль не наладжаны';

  @override
  String get remoteAccess => 'Аддалены доступ';

  @override
  String get localOnly => 'Толькі мясцовыя';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Не ўдалося загрузіць медыяаналітыку';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Камбінаваная аналітыка па ўсіх медыятэках.';

  @override
  String get analyticsTopArtists => 'Лепшыя выканаўцы';

  @override
  String get analyticsTopAuthors => 'Лепшыя аўтары';

  @override
  String get analyticsTopContributors => 'Лепшыя ўдзельнікі';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Бібліятэкі',
      many: '$count Бібліятэк',
      few: '$count Бібліятэкі',
      one: '$count Бібліятэка',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Для гэтага выбару пакуль няма даступных праіндэксаваных медыя.';

  @override
  String get analyticsLibraryDetails => 'Падрабязнасці бібліятэкі';

  @override
  String get analyticsLibraryBreakdown => 'Разбіўка бібліятэкі';

  @override
  String get analyticsNoLibrariesAvailable => 'Няма даступных бібліятэк.';

  @override
  String get adminServerAdministrationTitle => 'Адміністраванне сервера';

  @override
  String get adminServerPathData => 'даныя';

  @override
  String get adminServerPathImageCache => 'Кэш малюнкаў';

  @override
  String get adminServerPathCache => 'Кэш';

  @override
  String get adminServerPathLogs => 'Лагі';

  @override
  String get adminServerPathMetadata => 'Метададзеныя';

  @override
  String get adminServerPathTranscode => 'Перакадзіраваць';

  @override
  String get adminServerPathWeb => 'Інтэрнэт';

  @override
  String get adminNoServerPathsReturned =>
      'Гэты сервер не вяртае шляхі да сервера.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% выкарыстана';
  }

  @override
  String get userActivity => 'Актыўнасць карыстальніка';

  @override
  String get systemEvents => 'Сістэмныя падзеі';

  @override
  String get needsAttention => 'Патрабуе ўвагі';

  @override
  String get adminDrawerSectionServer => 'Сервер';

  @override
  String get adminDrawerSectionPlayback => 'Прайграванне';

  @override
  String get adminDrawerSectionDevices => 'прылады';

  @override
  String get adminDrawerSectionAdvanced => 'Пашыраны';

  @override
  String get adminDrawerSectionPlugins => 'Убудовы';

  @override
  String get adminDrawerSectionLiveTv => 'Жывое тэлебачанне';

  @override
  String get homeVideos => 'Хатняе відэа';

  @override
  String get mixedContent => 'Змешаны кантэнт';

  @override
  String get homeVideosAndPhotos => 'Хатнія відэа і фота';

  @override
  String get mixedMoviesAndShows => 'Змешаныя фільмы і шоу';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Запісы не знойдзены';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'У архіве .$extension не знойдзена старонак малюнкаў.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Памылка ўбудаванага візуалізатара ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Памылка візуалізацыі EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Адсутнічае лакальны файл для чытача: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status падчас адкрыцця дадзеных кнігі з $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Няма даступнай канчатковай кропкі чытальнай кнігі';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Фармат архіва коміксаў не падтрымліваецца: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Убудова для здабывання CBR недаступны на гэтай платформе.';

  @override
  String get failedToExtractCbrArchive => 'Не ўдалося распакаваць архіў .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Здабыча CB7 недаступная на гэтай платформе.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Убудова для здабывання CB7 недаступны на гэтай платформе.';

  @override
  String get closeGenrePanel => 'Закрыць панэль жанраў';

  @override
  String get loadingShuffle => 'Загрузка перамешвання...';

  @override
  String get libraryShuffleLabel => 'ПЕРАМЯШАЦЬ БІБЛІЯТЭКУ';

  @override
  String get randomShuffleLabel => 'ВЫПАДКОВЫ ПАРАДАК';

  @override
  String get genresShuffleLabel => 'ПЕРАМЯШАЦЬ ЖАНРЫ';

  @override
  String get autoHdrSwitching => 'Аўтаматычнае пераключэнне HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Аўтаматычна ўключыць HDR для прайгравання HDR-відэа і аднавіць рэжым адлюстравання пры выхадзе.';

  @override
  String get whenFullscreen => 'У поўнаэкранным рэжыме';

  @override
  String get changeArtwork => 'Змяніць ілюстрацыю';

  @override
  String get missing => 'Адсутнічае';

  @override
  String get transcodingLimits => 'Абмежаванні перакадавання';

  @override
  String get clearAllArtworkButton => 'Ачысціць усе ілюстрацыі?';

  @override
  String get clearAllArtworkWarning =>
      'Вы сапраўды хочаце ачысціць усе спампаваныя ілюстрацыі?';

  @override
  String get confirmClear => 'Пацвердзіць ачыстку';

  @override
  String confirmClearMessage(String itemType) {
    return 'Вы сапраўды хочаце ачысціць элемент «$itemType»?';
  }

  @override
  String get uploadButton => 'Загрузіць?';

  @override
  String get resolutionLabel => 'Раздзяляльнасць: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Паказваць ілюстрацыі толькі на мове інтэрфейсу';

  @override
  String get confirmClearAll => 'Пацвердзіць ачыстку ўсяго';

  @override
  String get imageUploadSuccess => 'Відарыс паспяхова загружаны!';

  @override
  String imageUploadFailed(String error) {
    return 'Не ўдалося загрузіць відарыс: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Не ўдалося задаць відарыс: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Не ўдалося выдаліць відарыс: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Не ўдалося ачысціць усе ілюстрацыі: $error';
  }

  @override
  String get yes => 'Так';

  @override
  String get posterCategory => 'Плакат';

  @override
  String get backdropsCategory => 'Фонавыя відарысы';

  @override
  String get bannerCategory => 'Банер';

  @override
  String get logoCategory => 'Лагатып';

  @override
  String get thumbnailCategory => 'Эскіз';

  @override
  String get artCategory => 'Ілюстрацыя';

  @override
  String get discArtCategory => 'Ілюстрацыя дыска';

  @override
  String get screenshotCategory => 'Здымак экрана';

  @override
  String get boxCoverCategory => 'Вокладка';

  @override
  String get boxRearCoverCategory => 'Задняя вокладка';

  @override
  String get menuArtCategory => 'Ілюстрацыя меню';

  @override
  String get confirmItemPoster => 'плакат';

  @override
  String get confirmItemBackdrop => 'фонавы відарыс';

  @override
  String get confirmItemBanner => 'банер';

  @override
  String get confirmItemLogo => 'лагатып';

  @override
  String get confirmItemThumbnail => 'эскіз';

  @override
  String get confirmItemArt => 'ілюстрацыя';

  @override
  String get confirmItemDiscArt => 'ілюстрацыя дыска';

  @override
  String get confirmItemScreenshot => 'здымак экрана';

  @override
  String get confirmItemBoxCover => 'вокладка';

  @override
  String get confirmItemBoxRearCover => 'задняя вокладка';

  @override
  String get confirmItemMenuArt => 'ілюстрацыя меню';

  @override
  String get resolutionAll => 'Усе';

  @override
  String get resolutionHigh => 'Высокая (1080p+)';

  @override
  String get resolutionMedium => 'Сярэдняя (720p)';

  @override
  String get resolutionLow => 'Нізкая (<720p)';

  @override
  String get sources => 'Крыніцы';

  @override
  String get audiobookChapters => 'Раздзелы';

  @override
  String get audiobookBookmarks => 'Закладкі';

  @override
  String get audiobookNotes => 'Нататкі';

  @override
  String get audiobookQueue => 'Чарга';

  @override
  String get audiobookTimeline => 'Шкала часу';

  @override
  String get audiobookTimelineEmpty => 'Шкала часу пустая';

  @override
  String get audiobookWholeBook => 'Уся кніга';

  @override
  String get audiobookFocusedTimeline => 'Сфакусаваная шкала';

  @override
  String get audiobookExportBookmarks => 'Экспартаваць закладкі';

  @override
  String get audiobookExportNotes => 'Экспартаваць нататкі';

  @override
  String get audiobookExportAll => 'Экспартаваць усё';

  @override
  String audiobookExportSuccess(String path) {
    return 'Экспартавана ў $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Не ўдалося экспартаваць: $error';
  }

  @override
  String get audiobookLyrics => 'Тэкст';

  @override
  String get audiobookAddBookmark => 'Дадаць закладку';

  @override
  String get audiobookAddNote => 'Дадаць нататку';

  @override
  String get audiobookEditNote => 'Змяніць нататку';

  @override
  String get audiobookNoteHint => 'Напішыце нататку для гэтага моманту';

  @override
  String get audiobookSleepTimer => 'Таймер сну';

  @override
  String get audiobookSleepOff => 'Выкл.';

  @override
  String get audiobookSleepEndOfChapter => 'Канец раздзела';

  @override
  String get audiobookSleepCustom => 'Свой';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Засталося $remaining';
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
  String get audiobookPlaybackSpeed => 'Хуткасць прайгравання';

  @override
  String get audiobookRemainingTime => 'Засталося';

  @override
  String get audiobookElapsedTime => 'Прайшло';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Назад $seconds с';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Наперад $seconds с';
  }

  @override
  String get audiobookPreviousChapter => 'Папярэдні раздзел';

  @override
  String get audiobookNextChapter => 'Наступны раздзел';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Раздзел $current з $total';
  }

  @override
  String get audiobookNoChapters => 'Няма раздзелаў';

  @override
  String get audiobookNoBookmarks => 'Пакуль няма закладак';

  @override
  String get audiobookNoNotes => 'Пакуль няма нататак';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Закладка дададзена на $position';
  }

  @override
  String get audiobookSpeedReset => 'Скінуць да 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Захаваць';

  @override
  String get audiobookCancel => 'Адмяніць';

  @override
  String get audiobookDelete => 'Выдаліць';

  @override
  String get subtitlePreferences => 'Налады субтытраў';

  @override
  String get subtitlePreferencesDescription =>
      'Змяніце рэжымы субтытраў, стандартныя мовы, выгляд і параметры адлюстравання.';

  @override
  String get subtitleRendering => 'Адлюстраванне субтытраў';

  @override
  String get displayOptions => 'Параметры адлюстравання';

  @override
  String get releaseDateAscending => 'Дата выхаду (па ўзрастанні)';

  @override
  String get releaseDateDescending => 'Дата выхаду (па спаданні)';

  @override
  String get groupContributions => 'Групаваць удзел';

  @override
  String get groupMultipleRoles => 'Групаваць некалькі роляў';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Папярэджанне пра доступ на запіс у бібліятэку';

  @override
  String get libraryWriteAccessHowToFix => 'Як гэта выправіць:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Дайце дазвол на запіс службоваму карыстальніку Jellyfin (напр., jellyfin або Docker PUID/PGID) для папак вашай медыябібліятэкі на серверы.\n\n2. Або перайдзіце ў Панэль кіравання Jellyfin -> Бібліятэкі, адрэдагуйце гэтую бібліятэку і адключыце «Захоўваць ілюстрацыі ў медыяпапках», каб захоўваць ілюстрацыі ва ўнутранай базе даных Jellyfin.';

  @override
  String get dismiss => 'Закрыць';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Ваша бібліятэка «$libraryName» настроена захоўваць ілюстрацыі непасрэдна ў медыяпапках (уключана «Захоўваць ілюстрацыі ў медыяпапках»). Аднак Jellyfin праверыў доступ на запіс і не мае дазволу запісваць файлы ў гэты каталог:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Здаецца, Jellyfin не змог абнавіць ілюстрацыю. Ваша бібліятэка настроена захоўваць ілюстрацыі непасрэдна ў медыяпапках (уключана «Захоўваць ілюстрацыі ў медыяпапках»). Гэтая памылка звычайна ўзнікае, калі працэс сервера Jellyfin не мае дазволу запісваць файлы ў вашы медыякаталогі.';

  @override
  String get externalLists => 'Знешнія спісы';

  @override
  String get replay => 'Прайграць зноў';

  @override
  String get fileInformation => 'Звесткі пра файл';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Памер: $size  •  Фармат: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Паказаць усе аўдыядарожкі ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Паказаць усе дарожкі субтытраў ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Праверка магчымасці прамога прайгравання...';

  @override
  String get directPlayCapabilityLabel => 'Магчымасць прамога прайгравання: ';

  @override
  String get forced => 'Прымусовыя';

  @override
  String get transcodeContainerNotSupported =>
      'Фармат кантэйнера не падтрымліваецца плэерам.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Відэакодэк не падтрымліваецца.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Аўдыякодэк не падтрымліваецца.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Фармат субтытраў не падтрымліваецца (патрабуе ўпальвання).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Аўдыяпрофіль не падтрымліваецца.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Відэапрофіль не падтрымліваецца.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Узровень відэа не падтрымліваецца.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Раздзяляльнасць відэа не падтрымліваецца гэтай прыладай.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Глыбіня колеру відэа не падтрымліваецца.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Частата кадраў відэа не падтрымліваецца.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Бітрэйт файла перавышае ліміт патоку плэера.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Бітрэйт відэа перавышае ліміт патоку.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Бітрэйт аўдыё перавышае ліміт патоку.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Колькасць аўдыяканалаў не падтрымліваецца.';

  @override
  String get sortAlphabetical => 'Па алфавіце';

  @override
  String get sortReleaseAscending => 'Парадак выхаду (па ўзрастанні)';

  @override
  String get sortReleaseDescending => 'Парадак выхаду (па спаданні)';

  @override
  String get sortCustomDragDrop => 'Уласны (перацягванне)';

  @override
  String get playlistSortOptions => 'Параметры сартавання плэйліста';

  @override
  String get resetSort => 'Скінуць сартаванне';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Перагледзець С$season:Э$episode';
  }

  @override
  String get rewatchPlaylist => 'Перагледзець плэйліст';

  @override
  String get noSubtitlesFound => 'Субтытры не знойдзены.';

  @override
  String get adminControls => 'Кіраванне адміністратара';

  @override
  String get impellerRendering => 'Рухавік рэндэрынгу (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller — сучасны GPU-рэндэрар Flutter для плаўнейшых анімацый і меншых падтармажванняў. На некаторых ТБ-прыстаўках і старых GPU ён можа выклікаць артэфакты або чорнае відэа; выключыце яго, калі бачыце такое. «Аўтаматычна» выбірае найлепшы варыянт для вашай прылады. Перазапусціце Moonfin, каб ужыць.';

  @override
  String get impellerAuto => 'Аўтаматычна';

  @override
  String get impellerOn => 'Укл.';

  @override
  String get impellerOff => 'Выкл.';

  @override
  String get impellerRestartTitle => 'Патрэбны перазапуск';

  @override
  String get impellerRestartMessage =>
      'Каб змяніць рухавік рэндэрынгу, Moonfin трэба перазапусціць. Закрыйце праграму, а потым адкрыйце яе зноў, каб ужыць змены.';

  @override
  String get impellerCloseNow => 'Закрыць праграму зараз';

  @override
  String get adminRefreshLibrary => 'Абнавіць бібліятэку';

  @override
  String get adminRefreshAllLibraries => 'Абнавіць усе бібліятэкі';

  @override
  String get adminRepoSortDateOldest => 'Дата дадання (спачатку старыя)';

  @override
  String get adminRepoSortDateNewest => 'Дата дадання (спачатку новыя)';

  @override
  String get adminRepoSortNameAsc => 'Па алфавіце (ад А да Я)';

  @override
  String get adminRepoSortNameDesc => 'Па алфавіце (ад Я да А)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Загрузка аналітыкі сервера... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Як у крыніцы';

  @override
  String get imdbTop250Movies => 'IMDb Топ-250 фільмаў';

  @override
  String get imdbTop250TvShows => 'IMDb Топ-250 серыялаў';

  @override
  String get imdbMostPopularMovies => 'Самыя папулярныя фільмы IMDb';

  @override
  String get imdbMostPopularTvShows => 'Самыя папулярныя серыялы IMDb';

  @override
  String get imdbLowestRatedMovies => 'Фільмы з найніжэйшым рэйтынгам IMDb';

  @override
  String get imdbTopEnglishMovies => 'Найлепшыя англамоўныя фільмы IMDb';

  @override
  String get addToWatchlist => 'Add to Watchlist';

  @override
  String get removeFromWatchlist => 'Remove from Watchlist';

  @override
  String get watchlistUpdateFailed => 'Couldn\'t update watchlist';
}
