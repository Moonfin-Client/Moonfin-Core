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
  String get animeMarkerFiller => 'Filler';

  @override
  String get animeMarkerMixed => 'Mixed';

  @override
  String get animeMarkerAnimeCanon => 'Anime Canon';

  @override
  String get animeMarkerMangaCanon => 'Manga Canon';

  @override
  String get animeMarkerSubbed => 'Subbed';

  @override
  String get animeMarkerDubbed => 'Dubbed';

  @override
  String get animeMarkerSubbedAndDubbed => 'Subbed/Dubbed';

  @override
  String get animeMarkerSubbedShort => 'Sub';

  @override
  String get animeMarkerDubbedShort => 'Dub';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Sub/Dub';

  @override
  String get animeMarkerPending => 'Pending';

  @override
  String get animeMarkerRecap => 'Recap';

  @override
  String get interfaceLanguage => 'Јазик на интерфејсот';

  @override
  String get systemLanguageDefault => 'Системски стандард';

  @override
  String get signIn => 'Пријавете се';

  @override
  String get signingIn => 'Signing in...';

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
  String get quickConnectScanHint =>
      'Or scan this with a phone that\'s signed in to your server';

  @override
  String get quickConnectTapOrScanHint =>
      'Tap to approve in your browser, or scan this with another device';

  @override
  String get timesUpTitle => 'Time\'s up';

  @override
  String get timesUpMessage => 'This account isn\'t available right now.';

  @override
  String timesUpResumesToday(String time) {
    return 'You can use it again today at $time.';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'You can use it again tomorrow at $time.';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return 'You can use it again on $day at $time.';
  }

  @override
  String get waitingForAuthorization => 'Се чека овластување...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Серверот е недостапен';

  @override
  String get loginFailed => 'Најавата не успеа';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

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
  String get signedInOnThisDevice => 'Signed in on this device';

  @override
  String get pinRequired => 'PIN required';

  @override
  String get passwordRequired => 'Password required';

  @override
  String continueAsUser(String name) {
    return 'Continue as $name';
  }

  @override
  String switchToUser(String name) {
    return 'Switch to $name';
  }

  @override
  String signedInAsOnServer(String user, String server) {
    return 'Signed in as $user on $server';
  }

  @override
  String get accountActive => 'Active';

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
  String get detailScreenStyleSpotlight => 'Spotlight';

  @override
  String get spotlightMoreActions => 'More Actions';

  @override
  String get spotlightCastCrewStudios => 'Cast, Crew, and Studios';

  @override
  String get spotlightChaptersExtras => 'Chapters and Extras';

  @override
  String get spotlightFileDetails => 'File Details';

  @override
  String get spotlightSimilarRecommendations => 'Similar and Recommendations';

  @override
  String get spotlightSeasonsEpisodes => 'Seasons and Episodes';

  @override
  String get spotlightMoreEpisodes => 'More Episodes';

  @override
  String get spotlightFilmography => 'Filmography';

  @override
  String get spotlightCollectionsCard => 'Collections';

  @override
  String get spotlightPlaylistOrder => 'Playlist Order';

  @override
  String get spotlightMoviesAndShows => 'Movies & Shows';

  @override
  String get spotlightSimilarSeerr => 'Similar (Seerr)';

  @override
  String get spotlightRecommendationsSeerr => 'Recommendations (Seerr)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count facts',
      one: '1 fact',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tags',
      one: '1 tag',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count studios',
      one: '1 studio',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapters',
      one: '1 chapter',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count extras',
      one: '1 extra',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seasons',
      one: '1 season',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count movies',
      one: '1 movie',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count shows',
      one: '1 show',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tracks',
      one: '1 track',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count albums',
      one: '1 album',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count collections',
      one: '1 collection',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titles',
      one: '1 title',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Nouveau';

  @override
  String get detailScreenStyleMinimalist => 'Minimalist';

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
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

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
  String get interfaceLayout => 'Interface Layout';

  @override
  String get interfaceLayoutSubtitle =>
      'Override the detected layout when this device is read wrong. Restart Moonfin for changes to take effect.';

  @override
  String get interfaceLayoutAutomatic => 'Automatic';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Desktop';

  @override
  String get interfaceLayoutPhone => 'Phone';

  @override
  String get glassQuality => 'Квалитет на стаклото';

  @override
  String get oledMode => 'OLED Mode';

  @override
  String get oledModeSubtitle =>
      'Deepen blacks and enrich artwork. Best on OLED displays.';

  @override
  String get oledModeSubtle => 'Subtle';

  @override
  String get oledModeVivid => 'Vivid';

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
  String get performanceMode => 'Performance';

  @override
  String get performanceModeSubtitle =>
      'Auto measures this device and holds back on the ones short on memory, which keeps fewer images in memory and leaves trailers as still images. Takes full effect on the next launch.';

  @override
  String get performanceModeAuto => 'Auto';

  @override
  String get performanceModeStandard => 'Standard';

  @override
  String get performanceModeReduced => 'Reduced';

  @override
  String get rendererMode => 'Renderer';

  @override
  String get rendererModeSubtitle =>
      'Auto uses Impeller on boxes whose graphics run it smoothly and Skia everywhere else. Pick Skia if animations or video look wrong. Takes effect on the next launch.';

  @override
  String get rendererModeAuto => 'Auto';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack =>
      'Off because Performance is set to Reduced for this device';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Префрлете се помеѓу Moonfin и Neon Pulse без да ја рестартирате апликацијата';

  @override
  String get customThemeTitle => 'Прилагодена тема';

  @override
  String get customThemeSubtitle =>
      'Прилагодените теми ги менуваат визуелните елементи низ Moonfin. Изберете една од овие опции според вашиот стил.';

  @override
  String get keyboardStyle => 'Keyboard Style';

  @override
  String get keyboardStyleDescription =>
      'Native uses your TV\'s own keyboard. Classic is the original Moonfin keyboard. Glass is a frosted panel with larger keys. Docked fills the bottom of the screen and shows what you type above the keys.';

  @override
  String get keyboardStyleNative => 'Native';

  @override
  String get keyboardStyleClassic => 'Classic';

  @override
  String get keyboardStyleGlass => 'Glass';

  @override
  String get keyboardStyleDocked => 'Docked';

  @override
  String get keyboardSpace => 'space';

  @override
  String get keyboardHoldForAccents => 'hold for accents';

  @override
  String get keyboardClose => 'close';

  @override
  String get controller => 'Controller';

  @override
  String get gamepadNavigation => 'Gamepad Navigation';

  @override
  String get gamepadNavigationDescription =>
      'Let a connected game controller move focus and select items';

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
  String get signInWithPlex => 'Sign in with Plex';

  @override
  String get plexLinkInstructions =>
      'Go to plex.tv/link on any device and enter this code';

  @override
  String get plexOpenLink => 'Open plex.tv/link';

  @override
  String get plexWaitingForApproval => 'Waiting for you to approve the code...';

  @override
  String get plexSignInWithPassword => 'Sign in with a password';

  @override
  String get plexVerificationCode => 'Verification code';

  @override
  String get plexNoServers => 'No Plex servers found on this account';

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
  String get gameOrientation => 'Game orientation';

  @override
  String get gameOrientationSubtitle =>
      'Screen orientation while playing games';

  @override
  String get landscape => 'Landscape';

  @override
  String get portrait => 'Portrait';

  @override
  String get gameEmulatorSettings => 'Поставки на емулаторот';

  @override
  String get gameNoCoreOptions => 'Ова јадро нема прилагодливи опции.';

  @override
  String get gameHoldToOpenMenu => 'Задржете за мени';

  @override
  String get gameKeepPlaying => 'Keep playing';

  @override
  String get gameSaveAndExit => 'Save & exit';

  @override
  String get gameExitGame => 'Exit game';

  @override
  String get gameSavingBeforeExit => 'Saving…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Could not save state. Still playing.';

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
  String get uiScaleGrandparents => 'Grandparents';

  @override
  String get uiScaleGreatGrandparents => 'Great-Grandparents';

  @override
  String get scrollDirection => 'Scroll Direction';

  @override
  String get scrollDirectionVertical => 'Vertical';

  @override
  String get scrollDirectionHorizontal => 'Horizontal';

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
  String get apply => 'Примени';

  @override
  String get openLink => 'Отворете ја врската';

  @override
  String get scanWithYourPhone => 'Скенирајте со вашиот телефон';

  @override
  String get audiobookGenres => 'Жанрови на аудио книги';

  @override
  String get scrollLeft => 'Скролувајте лево';

  @override
  String get scrollRight => 'Скролувајте десно';

  @override
  String get scrollToTop => 'Scroll to top';

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
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

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
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Не се пронајдени книги за овој автор.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

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
  String get additionalParts => 'Additional Parts';

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
  String get castMembers => 'Cast';

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
  String get finalizingDownload => 'Finalizing…';

  @override
  String get queuedDownload => 'Queued';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more queued',
      one: '1 more queued',
    );
    return '$_temp0';
  }

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
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

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
  String get downloadScopeTitle => 'What to download';

  @override
  String get downloadAllEpisodes => 'All episodes';

  @override
  String get downloadUnwatchedEpisodes => 'All unwatched episodes';

  @override
  String get downloadAllMovies => 'All movies';

  @override
  String get downloadUnwatchedMovies => 'All unwatched movies';

  @override
  String get downloadScopeLoading => 'Loading items...';

  @override
  String get downloadScopeLoadFailed => 'Could not load items to download';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size total';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received of $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return '$size total';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count unknown';
  }

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
  String get starring => 'STARRING';

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
  String get shuffleAll => 'Shuffle All';

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
  String get aiTranslated => 'AI Translated';

  @override
  String get machineTranslated => 'Machine Translated';

  @override
  String get hearingImpaired => 'SDH';

  @override
  String framerateFps(String rate) {
    return '$rate fps';
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
  String get showMpvStats => 'Show mpv Statistics (Shift+I)';

  @override
  String get hideMpvStats => 'Hide mpv Statistics (Shift+I)';

  @override
  String get keyboardShortcutsTitle => 'Keyboard shortcuts';

  @override
  String get keyboardShortcutsSubtitle =>
      'Keys for the app, video player and reader';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Press ? or F1 while a video plays to see this list without leaving the player.';

  @override
  String get keyboardShortcutsSectionApp => 'Everywhere';

  @override
  String get keyboardShortcutsSectionAppScope => 'On any screen';

  @override
  String get keyboardShortcutsSectionPlayer => 'Video player';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'While a video is open, playing or paused';

  @override
  String get keyboardShortcutsSectionReader => 'Book and comic reader';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'While reading a book or comic';

  @override
  String get keyNameArrowKeys => 'Arrow keys';

  @override
  String get keyNameSpace => 'Space';

  @override
  String get keyNameEnter => 'Enter';

  @override
  String get keyNameEsc => 'Esc';

  @override
  String get keyNameBackspace => 'Backspace';

  @override
  String get keyNameDelete => 'Delete';

  @override
  String get keyNamePageUp => 'Page Up';

  @override
  String get keyNamePageDown => 'Page Down';

  @override
  String get keyNameHome => 'Home';

  @override
  String get keyNameEnd => 'End';

  @override
  String get keyNameShift => 'Shift';

  @override
  String get keyNameCtrl => 'Ctrl';

  @override
  String get keyNameAlt => 'Alt';

  @override
  String get keyNameScrollWheel => 'Scroll wheel';

  @override
  String get shortcutMoveFocus => 'Move between items';

  @override
  String get shortcutActivate => 'Open the selected item';

  @override
  String get shortcutGoBack => 'Go back';

  @override
  String get shortcutToggleFullscreen => 'Fullscreen on or off';

  @override
  String get shortcutQuit => 'Quit Moonfin';

  @override
  String get shortcutPlayPause => 'Play or pause';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Show controls, or play/pause if shown';

  @override
  String get shortcutSeekBack => 'Seek back (hold for bigger jumps)';

  @override
  String get shortcutSeekForward => 'Seek forward (hold for bigger jumps)';

  @override
  String get shortcutVolumeUp => 'Volume up';

  @override
  String get shortcutVolumeDown => 'Volume down';

  @override
  String get shortcutMute => 'Mute or unmute';

  @override
  String get shortcutToggleSubtitles => 'Subtitles on or off';

  @override
  String get shortcutSlower => 'Slow down';

  @override
  String get shortcutFaster => 'Speed up';

  @override
  String get shortcutPlaybackInfo => 'Show playback information';

  @override
  String get shortcutMpvStats => 'mpv statistics on or off';

  @override
  String get shortcutRecropBlackBars => 'Recrop black bars';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Exit fullscreen, or stop if not fullscreen';

  @override
  String get shortcutHideControls => 'Hide controls';

  @override
  String get shortcutStopPlayback => 'Stop playback';

  @override
  String get shortcutNextItem => 'Next item';

  @override
  String get shortcutPreviousItem => 'Previous item';

  @override
  String get shortcutSkipSegment => 'Skip intro or credits when offered';

  @override
  String get shortcutShowShortcuts => 'Show this list';

  @override
  String get shortcutNextPage => 'Next page';

  @override
  String get shortcutPreviousPage => 'Previous page';

  @override
  String get shortcutScrollPage => 'Scroll the page (ebooks)';

  @override
  String get shortcutFirstPage => 'First page, or start of chapter';

  @override
  String get shortcutLastPage => 'Last page, or end of chapter';

  @override
  String get shortcutZoom => 'Zoom in or out (comics)';

  @override
  String get shortcutResetZoom => 'Reset zoom (comics)';

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
  String get videoRenderer => 'Video Renderer';

  @override
  String get videoRendererDescription =>
      'Native window gives the smoothest motion and sends HDR to the display untouched. Try another option if video misbehaves.';

  @override
  String get videoRendererNativeWindow => 'Native window (recommended)';

  @override
  String get videoRendererNativeHdrOnly => 'Native window for HDR only';

  @override
  String get videoRendererInApp => 'In-app (legacy)';

  @override
  String get track => 'Запис';

  @override
  String get channels => 'Канали';

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
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

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
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Водич временска линија';

  @override
  String failedToLoadGuide(String error) {
    return 'Неуспешно вчитување на водичот: $error';
  }

  @override
  String get noChannelsFound => 'Не се пронајдени канали';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'ВО ЖИВО';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

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
  String nextSeriesRecording(String dateTime) {
    return 'Next series recording: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'Series recording is scheduled, but the guide has no upcoming episodes';

  @override
  String get seriesRecordingSkipsShowing =>
      'The series recording will skip this showing';

  @override
  String get seriesRecordingEpisodesQuestion =>
      'Which episodes should be recorded?';

  @override
  String get seriesRecordingAllEpisodes => 'All Episodes';

  @override
  String get seriesRecordingAllEpisodesDescription =>
      'Every showing, including repeats';

  @override
  String get seriesRecordingNotRecordedEpisodes =>
      'Episodes Not Already Recorded';

  @override
  String get seriesRecordingNotRecordedEpisodesDescription =>
      'Skips episodes already in your library and records each episode once';

  @override
  String get seriesRecordingNewEpisodesOnly => 'New Episodes Only';

  @override
  String get seriesRecordingNewEpisodesOnlyDescription =>
      'First airings only, no repeats';

  @override
  String get seriesRecordingSettings => 'Series Settings';

  @override
  String get seriesRecordingUpdated => 'Series recording updated';

  @override
  String get failedToUpdateSeriesRecording =>
      'Unable to update series recording';

  @override
  String get recordCurrentEpisode => 'Record This Episode';

  @override
  String get recordCurrentProgram => 'Record This Program';

  @override
  String get cancelCurrentRecording => 'Cancel This Recording';

  @override
  String get cancelRecordingAction => 'Откажи снимање';

  @override
  String get programSetToRecord => 'Програмата е закажана за снимање';

  @override
  String get recordingCancelled => 'Снимањето е откажано';

  @override
  String get unableToCreateRecording => 'Не може да се создаде снимка';

  @override
  String get recordSeries => 'Record Series';

  @override
  String get seriesSetToRecord => 'Series set to record';

  @override
  String get seriesRecordingCancelled => 'Series recording cancelled';

  @override
  String get unableToCreateSeriesRecording =>
      'Unable to create series recording';

  @override
  String get watch => 'Гледај';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Затвори';

  @override
  String failedToPlayChannel(String name) {
    return 'Неуспешно пуштање на $name';
  }

  @override
  String get playbackStreamLost =>
      'Playback stopped and could not be recovered.';

  @override
  String get playbackVideoUnsupported =>
      'This device can\'t play this video\'s format. Try an external player.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Reconnecting… ($attempt of $total)';
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
  String get activeDownloads => 'Active Downloads';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used of $limit';
  }

  @override
  String get savedMediaSelectItems => 'Select items';

  @override
  String get savedMediaNoDownloads => 'Nothing saved yet';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Downloads you start appear here and play without a connection.';

  @override
  String get savedMediaNoActiveDownloads => 'Nothing downloading right now';

  @override
  String get savedMediaNoResults => 'No downloads match that search';

  @override
  String get savedMediaPlayFromStart => 'Play from start';

  @override
  String get savedMediaGoToDetails => 'Go to details';

  @override
  String get savedMediaDeleteDownload => 'Delete download';

  @override
  String savedMediaDeleteSeason(String season) {
    return 'Delete $season';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count episodes',
      one: 'Delete 1 episode',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Open show';

  @override
  String get savedMediaPlayNextUnwatched => 'Play next unwatched';

  @override
  String get savedMediaRead => 'Read';

  @override
  String get savedMediaCancelDownload => 'Cancel download';

  @override
  String get sortBySize => 'Size';

  @override
  String get sortByName => 'Name';

  @override
  String get sortByDateAdded => 'Date added';

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
  String get settingsSearchHint => 'Search settings';

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
  String get mixedRowsOnly => 'Mixed rows only';

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
  String get loadingAnimation => 'Loading Animation';

  @override
  String get loadingAnimationDescription =>
      'Customize the loading animations used throughout Moonfin';

  @override
  String get loadingAnimationConfiguration => 'Loading Animation Configuration';

  @override
  String get loadingAnimationImage => 'Image';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Moonfin Logo';

  @override
  String get loadingAnimationImageSpinner => 'Spinner';

  @override
  String get loadingAnimationImageRunner => 'Runner';

  @override
  String get loadingAnimationImageMoonPhases => 'Moon Phases';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Moonfin Phases';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Neonfin Phases';

  @override
  String get loadingAnimationSize => 'Animation Size';

  @override
  String get loadingAnimationSizeThumbnail => 'Thumbnail';

  @override
  String get loadingAnimationSizeSmall => 'Small';

  @override
  String get loadingAnimationSizeMedium => 'Medium';

  @override
  String get loadingAnimationSizeLarge => 'Large';

  @override
  String get loadingAnimationPosition => 'Animation Position';

  @override
  String get loadingAnimationPositionTopLeft => 'Top-Left';

  @override
  String get loadingAnimationPositionTopCenter => 'Top-Center';

  @override
  String get loadingAnimationPositionTopRight => 'Top-Right';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Middle-Left';

  @override
  String get loadingAnimationPositionMiddle => 'Middle';

  @override
  String get loadingAnimationPositionMiddleRight => 'Middle-Right';

  @override
  String get loadingAnimationPositionBottomLeft => 'Bottom-Left';

  @override
  String get loadingAnimationPositionBottomCenter => 'Bottom-Center';

  @override
  String get loadingAnimationPositionBottomRight => 'Bottom-Right';

  @override
  String get loadingAnimationPositionBouncing => 'Bouncing';

  @override
  String get loadingAnimationSpeed => 'Animation Speed';

  @override
  String get loadingAnimationSpeedSlow => 'Slow';

  @override
  String get loadingAnimationSpeedModerate => 'Moderate';

  @override
  String get loadingAnimationSpeedFast => 'Fast';

  @override
  String get loadingAnimationSpeedUltra => 'Ultra';

  @override
  String get showLoadingAnimationText => 'Show Text';

  @override
  String get loadingAnimationPreview => 'Preview';

  @override
  String get snow => 'Снег';

  @override
  String get fireworks => 'огномет';

  @override
  String get confetti => 'Конфети';

  @override
  String get fallingLeaves => 'Паѓаат лисја';

  @override
  String get seasonalChristmas => 'Christmas';

  @override
  String get seasonalPetals => 'Spring Petals';

  @override
  String get seasonalFireflies => 'Fireflies';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Density';

  @override
  String get seasonalDensityLight => 'Light';

  @override
  String get seasonalDensityNormal => 'Normal';

  @override
  String get seasonalDensityHeavy => 'Heavy';

  @override
  String get seasonalFollower => 'Focus Follower';

  @override
  String get seasonalFollowerDescription =>
      'A holiday piece, like Halloween\'s planchette, follows what you select on Home';

  @override
  String get seasonalFollowerPointerDescription =>
      'A holiday piece, like Halloween\'s planchette, replaces the mouse pointer on Home';

  @override
  String get seasonalRow => 'Seasonal Row';

  @override
  String get seasonalRowDescription =>
      'Show a row of holiday movies from your library, with Seerr suggestions when available.';

  @override
  String get seasonalRowSubtitle => 'Seasonal';

  @override
  String get seasonalRowCountry => 'Country';

  @override
  String get seasonalRowCountryAuto => 'Automatic';

  @override
  String get countryUnitedStates => 'United States';

  @override
  String get countryCanada => 'Canada';

  @override
  String get seasonalRowCountryOther => 'Other';

  @override
  String get seasonalRowHolidays => 'Holidays';

  @override
  String get seasonalRowHolidaysHint => 'Untick a holiday to hide its row.';

  @override
  String get holidayNewYear => 'New Year\'s';

  @override
  String get holidayValentines => 'Valentine\'s Day';

  @override
  String get holidayEaster => 'Easter';

  @override
  String get holidayPride => 'Pride';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Thanksgiving';

  @override
  String get holidayChristmas => 'Christmas Movies';

  @override
  String get holidayLunarNewYear => 'Lunar New Year';

  @override
  String get holidayDiwali => 'Diwali';

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
  String get loopThemeMusic => 'Повторувај ја тематската музика';

  @override
  String get loopThemeMusicSubtitle =>
      'Повторувај ја песната наместо да се пушти еднаш';

  @override
  String get detailsBackgroundBlur => 'Детали Заматување на позадината';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

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
  String get cropBlackBars => 'Crop Black Bars';

  @override
  String get settingsCropBlackBarsDescription =>
      'Detect encoded letterbox bars after playback starts, crop them, then fill the screen. Recrop from the player zoom button.';

  @override
  String get cropBlackBarsRecropInterval => 'Recrop Interval';

  @override
  String get cropBlackBarsOnce => 'Once at start';

  @override
  String get cropBlackBarsEverySecond => 'Every second';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Follow aspect ratio changes during playback.';

  @override
  String get playerRecroppingBlackBars => 'Recropping black bars';

  @override
  String get stretch => 'Истегнете се';

  @override
  String get refreshRateSwitching => 'Префрлување на стапката на освежување';

  @override
  String get disabled => 'Оневозможено';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

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
  String get trickplayDisplayStyleSingle => 'Single Thumbnail';

  @override
  String get trickplayDisplayStyleStrip => 'Filmstrip';

  @override
  String get trickplayModeFull => 'Full Screen';

  @override
  String get trickplaySettingsPreviewHint =>
      'Drag the slider to preview scrubbing';

  @override
  String get trickplayPreviewScale => 'Preview Size';

  @override
  String get trickplayVerticalOffset => 'Distance From Seekbar';

  @override
  String get trickplayFollowScrubPosition => 'Follow Scrub Position';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Preview slides along the seekbar as you scrub, instead of staying centered';

  @override
  String get trickplayPauseWhileScrubbing => 'Pause While Scrubbing';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Playback pauses while you seek and resumes when you press play. Turn this off to keep playing and jump straight to the new spot';

  @override
  String get showDescriptionOnPause => 'Прикажи опис на пауза';

  @override
  String get dimVideoShowOverview =>
      'Затемнете го видеото и прикажете го текстот за преглед додека е паузиран';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'Копче за заклучување на OSD';

  @override
  String get osdLockButtonDescription =>
      'Прикажи копче за заклучување што го блокира внесувањето на допир додека не се притисне долго';

  @override
  String get playerSwipeGestures => 'Volume and Brightness Swipes';

  @override
  String get playerSwipeGesturesDescription =>
      'Slide up or down on the player to change brightness on the left and volume on the right';

  @override
  String get invertGestureIndicators => 'Invert Gesture Indicators';

  @override
  String get invertGestureIndicatorsDescription =>
      'Place brightness and volume visual indicators on same or opposite side of screen from swipe';

  @override
  String get gestureIndicatorSame => 'Same';

  @override
  String get gestureIndicatorInverted => 'Inverted';

  @override
  String get osdButtons => 'Player Buttons';

  @override
  String get osdButtonsDescription => 'Choose which buttons the player shows';

  @override
  String get osdButtonsSectionDescription =>
      'Playback controls are always shown. Everything below is up to you, and each kind of device keeps its own list.';

  @override
  String get detailButtons => 'Action Buttons';

  @override
  String get detailButtonsDescription =>
      'Choose which buttons the details screen shows';

  @override
  String get detailButtonsSectionDescription =>
      'Play is always first and the locked buttons are always shown. Everything else is up to you, and each kind of device keeps its own list.';

  @override
  String get actionButtonsOnScreen => 'Action Buttons on Screen';

  @override
  String get actionButtonsOnScreenDescription =>
      'Customize how many action buttons appear before folding into the More Actions menu.';

  @override
  String get actionButtonsOnScreenAuto => 'Auto (Theme Default)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (Play only)';

  @override
  String get actionButtonsOnScreenAll => 'All (Horizontal Scroll)';

  @override
  String get detailMetadata => 'Metadata Row';

  @override
  String get detailMetadataDescription =>
      'Choose and reorder what metadata the details screen shows';

  @override
  String get detailMetadataSectionDescription =>
      'Turn metadata items on or off, and arrange the order they appear on the details screen. Each kind of device keeps its own list.';

  @override
  String get detailMetadataYear => 'Release Year';

  @override
  String get detailMetadataParentalRating => 'Parental Rating';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Runtime & Seasons';

  @override
  String get detailMetadataStatus => 'Series Status';

  @override
  String get detailMetadataStatusSubtitle =>
      'Shows whether the series is continuing, ended, or returning';

  @override
  String get detailMetadataGenres => 'Genres';

  @override
  String get detailMetadataSeerrAvailability => 'Seerr Availability';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Shows request and media availability status from Seerr';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Upcoming Episodes';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Uses Sonarr and TMDB to show upcoming release dates';

  @override
  String get detailSections => 'Sections';

  @override
  String get detailSectionsDescription =>
      'Choose which parts of the Details screen to show';

  @override
  String get detailSectionsScreenDescription =>
      'Only the sections the current Details screen style can show are listed. Hiding one hides it in every style that has it.';

  @override
  String get detailSectionGroupHeader => 'Header';

  @override
  String get detailSectionGroupSections => 'Sections';

  @override
  String get detailSectionGroupPerson => 'Person pages';

  @override
  String get detailSectionGroupCollection => 'Collection pages';

  @override
  String get detailSectionGroupOther => 'Other';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle => 'Shows the title as text when off';

  @override
  String get detailSectionTagline => 'Tagline';

  @override
  String get detailSectionPoster => 'Poster';

  @override
  String get detailSectionVersionBadge => 'Version badge';

  @override
  String get detailSectionUpNext => 'Next Up';

  @override
  String get detailSectionLyrics => 'Lyrics';

  @override
  String get detailSectionCast => 'Cast';

  @override
  String get detailSectionCastSubtitle => 'Also on collection pages';

  @override
  String get detailSectionCrew => 'Directors & writers';

  @override
  String get detailSectionStudios => 'Studios';

  @override
  String get detailSectionChapters => 'Chapters';

  @override
  String get detailSectionExtras => 'Extras';

  @override
  String get detailSectionCollections => 'Collections';

  @override
  String get detailSectionMoreLikeThis => 'More Like This';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Also similar albums and artists';

  @override
  String get detailSectionMoreEpisodes => 'More episodes';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'On episode pages';

  @override
  String get detailSectionMediaInfo => 'Media info';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'File, streams and Direct Play check';

  @override
  String get detailSectionSeerrGenresTags => 'Genres & tags';

  @override
  String get detailSectionSeerrStats => 'Stats';

  @override
  String get detailSectionSeerrStreaming => 'Streaming services';

  @override
  String get seerrStreamingOn => 'Streaming on';

  @override
  String get detailSectionSeerrRecommendations => 'Recommendations';

  @override
  String get detailSectionSeerrSimilar => 'Similar titles';

  @override
  String get detailSectionSeerrCollection => 'Collection banner';

  @override
  String get detailSectionSeerrPersonAppearances => 'Appearances';

  @override
  String get detailSectionSeerrPersonCrew => 'Crew credits';

  @override
  String get detailSectionPersonPagesSubtitle => 'On person pages';

  @override
  String get detailSectionBiography => 'Biography';

  @override
  String get detailSectionBirthplace => 'Birthplace';

  @override
  String get detailSectionPersonLinks => 'Links';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB and social media';

  @override
  String get detailSectionGuestAppearances => 'Guest appearances';

  @override
  String get detailSectionMusicVideos => 'Music videos';

  @override
  String get detailSectionPlaylistOrder => 'Playlist order';

  @override
  String get detailSectionBookGenres => 'Book genres';

  @override
  String get detailSectionPhotoExif => 'Photo details';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Next: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Today';

  @override
  String get upcomingEpisodeTomorrow => 'Tomorrow';

  @override
  String get moveUp => 'Move Up';

  @override
  String get moveDown => 'Move Down';

  @override
  String get buttonOrderHint =>
      'Use the arrows to change the order. On a remote, left and right move the highlighted button. Switching one off drops it below the rest.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Only shows while you\'re in a SyncPlay group';

  @override
  String get orientationLock => 'Orientation Lock';

  @override
  String get fullscreen => 'Fullscreen';

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
  String get settingsAudioFallbackCodec => 'Резервен аудио кодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Изберете го целниот формат за транскодирање на повеќеканално аудио кога изворниот стрим не може да се пушти директно или да помине без обработка.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

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
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA Passthrough';

  @override
  String get settingsAudioPassthroughMode => 'Passthrough';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'How compressed surround sound reaches your TV or receiver.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Disabled (always decode on this device)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Auto (match detected device support)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Manual (choose formats below)';

  @override
  String get settingsAudioPassthroughOutput => 'Passthrough Output';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'Who packs bitstreams for the HDMI link. Try the app packer if passthrough is silent or glitchy on this device.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Automatic, system packer (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec => 'App packer (AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'App (IEC)';

  @override
  String get settingsDownmixToStereoDescription =>
      'Mix all decoded audio down to two channels.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Bitstream E-AC-3, including Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'Bitstream DTS-HD, including DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Bitstream TrueHD, including Dolby Atmos.';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

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
  String get subtitleDownloadLanguages => 'Subtitle Download Languages';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'Languages to search when downloading subtitles, up to 5. Auto searches one language picked from your default subtitle language or the video.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Preferred Secondary Subtitle Language';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Show a second subtitle track at the same time. The subtitle menu then asks for the primary or secondary track first';

  @override
  String get defaultToNoSubtitles => 'Стандардно е без преводи';

  @override
  String get turnOffSubtitlesByDefault => 'Стандардно исклучете ги преводите';

  @override
  String get subtitleSize => 'Големина на титл';

  @override
  String get primarySubtitleSlot => 'Primary Track';

  @override
  String get secondarySubtitleSlot => 'Secondary Track';

  @override
  String get secondarySubtitleTrack => 'Secondary Subtitles';

  @override
  String get secondaryDelayAdjustment => 'Secondary Delay Adjustment';

  @override
  String decreaseValue(String setting) {
    return 'Decrease $setting';
  }

  @override
  String increaseValue(String setting) {
    return 'Increase $setting';
  }

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
  String get semiTransparentWhite => 'Semi-transparent White';

  @override
  String get lightGray => 'Light Gray';

  @override
  String get darkGray => 'Dark Gray';

  @override
  String get blue => 'Blue';

  @override
  String get magenta => 'Magenta';

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
  String get syncing => 'Се синхронизира...';

  @override
  String resetProfileTitle(String profile) {
    return 'Reset $profile?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'This deletes the $profile profile from the server and puts every synced setting on this device back to its default.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'This deletes every saved profile from the server and puts every synced setting on this device back to its default.';

  @override
  String profileReset(String profile) {
    return 'Reset $profile profile to defaults.';
  }

  @override
  String get resetRatingsTitle => 'Reset ratings?';

  @override
  String get resetRatingsDescription =>
      'This puts every ratings setting back to its default, including which sources show and the order they appear in.';

  @override
  String get ratingsReset => 'Reset ratings to defaults.';

  @override
  String failedToResetProfile(String profile) {
    return 'Failed to reset $profile profile.';
  }

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
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

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
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar =>
      'Прикажи библиотеки во лентата со алатки';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

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
  String get mergeRecentRowsByType => 'Merge Recent Rows by Type';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Combine separate libraries of the same type for Recently Added and Recently Released home rows.';

  @override
  String get libraryView => 'Library View';

  @override
  String get libraryStyle => 'Video Library Style';

  @override
  String get libraryStyleDescription =>
      'Classic is the original header with icon buttons. Modern puts search and labeled sort, group and filter buttons in one bar. Docked moves the controls and the letters into a side panel.';

  @override
  String get libraryStyleDescriptionPhone =>
      'Classic is the original header with icon buttons. Modern adds labeled sort, group and filter chips under the search. Docked keeps the controls in a bar at the bottom of the screen.';

  @override
  String get libraryStyleClassic => 'Classic';

  @override
  String get libraryStyleModern => 'Modern';

  @override
  String get libraryStyleDocked => 'Docked';

  @override
  String get bookLibraryStyle => 'Book Library Style';

  @override
  String get bookLibraryStyleDescription =>
      'Classic is the original shelves under a featured title. Reading Room leads with what you\'re reading on large cards. Bookstore browses the whole library in a grid.';

  @override
  String get bookLibraryStyleClassic => 'Classic';

  @override
  String get bookLibraryStyleReadingRoom => 'Reading Room';

  @override
  String get bookLibraryStyleBookstore => 'Bookstore';

  @override
  String get musicLibraryStyle => 'Music Library Style';

  @override
  String get musicLibraryStyleDescription =>
      'Classic is the original rows under a Jump Back In card. Quick Access starts with a grid of your recent albums and playlists. Immersive leads with the album you\'re listening to.';

  @override
  String get musicLibraryStyleClassic => 'Classic';

  @override
  String get musicLibraryStyleQuickAccess => 'Quick Access';

  @override
  String get musicLibraryStyleImmersive => 'Immersive';

  @override
  String get jumpBackIn => 'Jump Back In';

  @override
  String get yourPlaylists => 'Your Playlists';

  @override
  String get fromThisAlbum => 'From This Album';

  @override
  String get searchMusic => 'Search Music';

  @override
  String bookSeriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count series',
      one: '1 series',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count in progress';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Browse all $count titles',
      one: 'Browse 1 title',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => 'Search books';

  @override
  String get libraryShowLabel => 'Show';

  @override
  String get libraryAToZ => 'A to Z';

  @override
  String get libraryJumpToLetter => 'Jump to letter';

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
  String get libraryOrder => 'Library Order';

  @override
  String get libraryOrderSubtitle => 'Choose the order of your libraries';

  @override
  String get libraryOrderDescription =>
      'Your libraries appear in this order on My Media, the recently added rows and the navigation bar. The order is saved to your server account, so other apps you sign in to use it too.';

  @override
  String get libraryOrderTvHint =>
      'Press left or right to move the highlighted library.';

  @override
  String get libraryOrderSaveFailed => 'Couldn\'t save the library order';

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
  String get mediaBarMode => 'Стил на медиумска лента';

  @override
  String get mediaBarModeDescription =>
      'Изберете помеѓу различни стилови на медиумска лента или исклучете ја медиумската лента';

  @override
  String get peekHomeRows => 'Peek Home Rows';

  @override
  String get peekHomeRowsDescription =>
      'Show the top half of the first row along the bottom of the media bar';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Исклучено';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Овозможи медиумска лента';

  @override
  String get showFeaturedContentSlideshow =>
      'Прикажи слајдшоу на истакната содржина дома';

  @override
  String get contentType => 'Тип на содржина';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

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
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

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
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Најнови медиуми';

  @override
  String get recentlyReleased => 'Неодамна објавени';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

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
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Ресетирање на стандардните';

  @override
  String get homeRowPosterSize => 'Големина на постер за домашен ред';

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
  String get continueWatchingDefaultAction => 'Default Action';

  @override
  String get continueWatchingDefaultActionDescription =>
      'What selecting a Continue Watching or Next Up item does';

  @override
  String get goToDetailsScreen => 'Go to Details';

  @override
  String get playImmediately => 'Play immediately';

  @override
  String get nextUpMaxDays => 'Max days in Next Up';

  @override
  String get nextUpMaxDaysDescription =>
      'How long a show stays in Next Up after you last watched it';

  @override
  String daysValue(int days) {
    return '$days days';
  }

  @override
  String get fullScreenRows => 'Проширени почетни редови';

  @override
  String get fullScreenRowsDescription =>
      'Ограничи ги почетните редови на 1 ред по екран';

  @override
  String get homeRowsPadding => 'Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get homeRowsGenresAndStudios => 'Genres and Studios';

  @override
  String get homeRowsExternalLists => 'External Lists';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get displayClockDuringScreensaver =>
      'Приказ на часовникот за време на заштитниот екран';

  @override
  String get clockModeStatic => 'Статичен';

  @override
  String get clockModeBouncing => 'Отскокнувачки';

  @override
  String get screensaverGeneralSettings => 'General Settings';

  @override
  String get screensaverVisualComponents => 'Visual Components';

  @override
  String get screensaverLibraryContent => 'Library Content';

  @override
  String get screensaverBackdrop => 'Backdrop';

  @override
  String get screensaverBackdropBlack => 'Black';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => 'Calm';

  @override
  String get screensaverBackdropNeonPulse => 'Neon Pulse';

  @override
  String get screensaverBackdropAurora => 'Aurora';

  @override
  String get screensaverAdditionalComponent => 'Additional Component';

  @override
  String get screensaverComponentMoonfinLogo => 'Moonfin Logo';

  @override
  String get screensaverComponentRunner => 'Runner';

  @override
  String get screensaverComponentMovement => 'Component Movement';

  @override
  String get screensaverComponentPosition => 'Component Position';

  @override
  String get screensaverComponentSize => 'Component Size';

  @override
  String get screensaverSourceLibrariesDefault => 'All (Default)';

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
  String get pluginDetected => 'Откриен е приклучокот';

  @override
  String get pluginNotDetected => 'Приклучокот не е откриен';

  @override
  String get pluginNotDetectedDescription =>
      'Приклучокот за серверот во моментов не е откриен. Локалните поставки сè уште ги користат нивните зачувани вредности или вградените стандардни поставки.';

  @override
  String get moonbaseAddress => 'Moonbase Address';

  @override
  String get pluginConnected => 'Connected';

  @override
  String pluginConnectedVersion(String version) {
    return 'Connected, version $version';
  }

  @override
  String get pluginSyncOn => 'Sync on';

  @override
  String get pluginSyncOff => 'Sync off';

  @override
  String get syncProfileDescription =>
      'This device syncs with the profile you pick until you pick another.';

  @override
  String get profileAppliesEverywhere => 'Applies everywhere';

  @override
  String get profileOverridesGlobal => 'Overrides Global';

  @override
  String get profileThisDevice => 'This device';

  @override
  String get profileLoad => 'Load';

  @override
  String get profileLoadSubtitle => 'Server to this device';

  @override
  String get profileSaveSubtitle => 'This device to server';

  @override
  String resetNamedProfile(String profile) {
    return 'Reset $profile Profile';
  }

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
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Редови за откривање во Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

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
  String get showMissingCollectionItems => 'Show Missing Collection Items';

  @override
  String get showMissingCollectionItemsDesc =>
      'Include missing items on Collection pages';

  @override
  String get showSeerrAvailabilityBadges => 'Show Seerr Availability Badges';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Show season availability badges on media details pages';

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
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

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
  String get featuredContentAppearance => 'Избрана содржина, изглед';

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
  String get seerrDownloading => 'Downloading';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Downloading · $done / $total';
  }

  @override
  String seerrDownloadedOfTotal(String done, String total) {
    return '$done / $total';
  }

  @override
  String seerrPercentValue(int percent) {
    return '$percent%';
  }

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
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Барање';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Откажете го барањето';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Играјте во Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Побарано од $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

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
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Поднесете барање';

  @override
  String get allSeasons => 'Сите годишни времиња';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

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
  String get adminPremiereNoteLiveTv =>
      'Live TV needs Emby Premiere. Without it the server doesn\'t import channels or record anything.';

  @override
  String get adminPremiereNoteBackups =>
      'Backup & Restore needs Emby Premiere once its trial ends.';

  @override
  String get adminGeneralRunAtStartup => 'Run the server at startup';

  @override
  String get adminGeneralLaunchWebApp =>
      'Open the web app in a browser when the server starts';

  @override
  String get adminGeneralBannerText => 'Home screen banner text';

  @override
  String get adminGeneralBannerTextHelp =>
      'Shown to every user on their home screen';

  @override
  String get adminGeneralSectionMaintenance => 'Maintenance mode';

  @override
  String get adminGeneralMaintenanceMode =>
      'Put the server into maintenance mode';

  @override
  String get adminGeneralMaintenanceModeHelp =>
      'Users only see the maintenance message.';

  @override
  String get adminGeneralMaintenanceMessage => 'Maintenance message';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      'Leave it blank for a general message in each user\'s language.';

  @override
  String get adminGeneralSectionUpdates => 'Automatic updates';

  @override
  String get adminGeneralAutoUpdate => 'Update the server automatically';

  @override
  String get adminGeneralAutoRestart =>
      'Restart automatically to apply updates';

  @override
  String get adminGeneralAutoRestartHelp =>
      'The server only restarts while no users are active.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return 'After a system event ($event)';
  }

  @override
  String get adminPluginNeedsPremiere =>
      'Needs Emby Premiere after a 14-day free trial';

  @override
  String get adminEmbyBackupsHelp =>
      'Emby backs up through its Backup & Restore plugin.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      'The Backup & Restore plugin isn\'t installed. Install it from the plugin catalog to back up this server.';

  @override
  String get adminEmbyBackupNow => 'Back up now';

  @override
  String get adminEmbyFullBackup => 'Full backup';

  @override
  String get adminEmbyLightBackups => 'Database backups';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return 'Restore $name? It replaces this server\'s libraries, settings, users and passwords, and the server shuts down when it\'s done. You may need to start it again yourself.';
  }

  @override
  String get adminEmbyRestoreServerId => 'Restore the server ID';

  @override
  String get adminEmbyRestoreServerIdHelp =>
      'Turn this off when you restore the same backup onto more than one server.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      'The restore is done and the server is shutting down. Start it again if it doesn\'t restart by itself.';

  @override
  String get adminHiddenRemotely =>
      'Hide from login screens when connected remotely';

  @override
  String get adminHiddenFromUnusedDevices =>
      'Hide from login screens on devices they\'ve never signed in on';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      'Limits how many videos this user can play at once.';

  @override
  String get adminUnlimited => 'Unlimited';

  @override
  String get adminAutoRemoteQuality => 'Auto remote quality (Mbps)';

  @override
  String get adminAutoRemoteQualityHelp =>
      'Used remotely when the player is set to auto quality. Leave empty to detect it.';

  @override
  String get adminAllowCameraUpload => 'Allow camera upload';

  @override
  String get adminAllowSubtitleDownloading => 'Allow subtitle downloading';

  @override
  String get adminAllowMediaConversion => 'Allow media conversion';

  @override
  String get adminAllowSyncTranscoding =>
      'Allow downloads that need transcoding';

  @override
  String get adminAllowSharingPersonalItems =>
      'Allow sharing playlists with other users';

  @override
  String get adminAllowPreferenceAccess =>
      'Allow changing their own password and profile image';

  @override
  String get adminTagMode => 'Tag mode';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser => 'Emby Connect username or email';

  @override
  String get adminEmbyConnectHelp =>
      'Lets this user sign in from any Emby app without knowing the server address.';

  @override
  String get adminEmbyConnectLink => 'Link';

  @override
  String get adminEmbyConnectUnlink => 'Unlink';

  @override
  String get adminEmbyConnectLinked => 'Linked to Emby Connect';

  @override
  String get adminEmbyConnectPending =>
      'Invitation sent. The link is made once they accept it.';

  @override
  String get adminEmbyConnectUnlinked => 'Emby Connect link removed';

  @override
  String get adminEmbyConnectNotFound =>
      'No Emby Connect account has that username or email.';

  @override
  String get adminLibImportPlaylists => 'Import playlist files';

  @override
  String get adminLibExcludeFromSearch => 'Exclude from global search';

  @override
  String get adminLibForcedSubtitlesOnly => 'Download forced subtitles only';

  @override
  String get adminLibImportCollections =>
      'Import collections from metadata downloaders';

  @override
  String get adminLibThumbnailInterval => 'Preview thumbnail interval';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return 'Every $count seconds';
  }

  @override
  String get adminLibThumbnailAtChapters => 'At chapter markers';

  @override
  String get adminLibSaveThumbnailsWithMedia =>
      'Save preview thumbnails into media folders';

  @override
  String get adminLibrarySectionMarkers => 'Intro markers';

  @override
  String get adminLibIntroDetection => 'Detect intros';

  @override
  String get adminLibIntroDetectionDuringScan =>
      'Detect intros during the library scan';

  @override
  String get adminProviderEmbyGuide => 'Emby Guide Data';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      'Select a lineup. If none are listed, check the postal code. Lineups need Emby Premiere.';

  @override
  String get adminLiveTvWakeServer => 'Wake the server for recordings';

  @override
  String get adminDrawerLiveTvChannels => 'Live TV Channels';

  @override
  String get adminPageDescLiveTvChannels =>
      'Turn channels on and off and set their order';

  @override
  String get adminLiveTvChannelsEmpty =>
      'No channels yet. They show up here once a tuner is set up and the server has imported its channels.';

  @override
  String get adminTranscodingHwaAdvanced => 'Advanced';

  @override
  String get adminTranscodingHwaHelp =>
      'Advanced lets you pick and order the hardware codecs.';

  @override
  String get adminTranscodingHwDecoders => 'Preferred hardware decoders';

  @override
  String get adminTranscodingHwEncoders => 'Preferred hardware encoders';

  @override
  String get adminTranscodingTempPathHelp =>
      'Where the transcoder keeps its working files. Leave it empty to use the server\'s data folder.';

  @override
  String get adminTranscodingThrottleHelp =>
      'Slows transcoding down once enough is buffered, to lower CPU use.';

  @override
  String get adminTranscodingDownmixHelp =>
      'Raises the volume when audio is downmixed. 1 keeps the original volume.';

  @override
  String get adminTranscodingFontExtraction =>
      'Allow font extraction on the fly';

  @override
  String get adminTranscodingMaxResolution => 'Max transcoding resolution';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      'A limit on every transcode, whatever quality the app asks for.';

  @override
  String get adminTranscodingToneMapSoftware =>
      'Tone mapping in software transcodes';

  @override
  String get adminTranscodingToneMapHardware =>
      'Tone mapping in hardware transcodes';

  @override
  String get adminTranscodingToneMapHelp =>
      'Keeps HDR video from looking dim and washed out when it\'s transcoded.';

  @override
  String get adminNetworkingLocalAddress => 'Local IP address';

  @override
  String get adminNetworkingLocalAddressHelp =>
      'The local address the server gives to apps. Leave it empty to detect it automatically.';

  @override
  String get adminNetworkingBehindProxy =>
      'HTTPS is handled by a reverse proxy';

  @override
  String get adminNetworkingExternalDomain => 'External domain';

  @override
  String get adminNetworkingExternalDomainHelp =>
      'A domain or dynamic DNS name for remote connections, without the protocol or port. A custom certificate needs it.';

  @override
  String get adminNetworkingUpnp => 'Enable automatic port mapping';

  @override
  String get adminNetworkingUpnpHelp =>
      'Tries to map the public port to the local port with UPnP. Some routers don\'t support it.';

  @override
  String get adminNetworkingProxyHeaders =>
      'Read proxy headers for client addresses';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'Uses headers like X-Forwarded-For to find each client\'s address. Only turn this on behind a reverse proxy.';

  @override
  String get adminNetworkingProxyHeadersRemote =>
      'Only when they hold remote addresses';

  @override
  String get adminNetworkingIpv4Only => 'Use IPv4 for outgoing requests';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      'For when metadata providers and other services can\'t be reached over IPv6.';

  @override
  String get adminOnePerLine => 'One per line';

  @override
  String get adminStreamingStreamLimit => 'Max simultaneous video streams';

  @override
  String get adminStreamingStreamLimitHelp =>
      'How many videos can play at once across the server. 0 means no limit.';

  @override
  String get adminSyncJobsConversions => 'Conversion jobs';

  @override
  String get adminSyncJobsDownloads => 'Download jobs';

  @override
  String get adminSyncJobsEmpty => 'No jobs';

  @override
  String get adminSyncJobCancel => 'Cancel job';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return 'Cancel $name and remove it from the list?';
  }

  @override
  String get adminSyncJobConverting => 'Converting';

  @override
  String get adminSyncJobReady => 'Ready to transfer';

  @override
  String get adminSyncJobTransferring => 'Transferring';

  @override
  String get adminSyncJobCompletedWithError => 'Completed with errors';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => 'Database';

  @override
  String get adminPageDescDatabase => 'Cache size and upkeep';

  @override
  String get adminDatabaseWarning =>
      'These are advanced options. Leave them at their defaults unless you have a reason to change them.';

  @override
  String get adminDatabaseCacheSize => 'Database cache size (MB)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      'How much of each database file the server keeps in memory. More can make the server faster. Takes effect after a restart.';

  @override
  String get adminDatabaseOptimize =>
      'Optimize the database when the server shuts down';

  @override
  String get adminDatabaseOptimizeHelp =>
      'Usually this does nothing, but now and then it runs an analysis that helps the server\'s queries. Shutdowns can take longer.';

  @override
  String get adminDatabaseAnalysisLimit => 'Analysis row limit';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      'About how many rows of each index the optimize step reads. More rows work better but can slow shutdowns.';

  @override
  String get adminDatabaseVacuum => 'Vacuum the database on the next startup';

  @override
  String get adminDatabaseVacuumHelp =>
      'Rebuilds the database file so it takes up the least space, which can help performance. The server can\'t be used while it runs and shows no progress, so don\'t force it closed. It turns itself back off after that startup.';

  @override
  String get adminDrawerCinemaIntros => 'Cinema Intros';

  @override
  String get adminPageDescCinemaIntros => 'Trailers and intros before playback';

  @override
  String get adminCinemaIntrosPlayBefore => 'Play intros before';

  @override
  String get adminCinemaIntrosUpcoming =>
      'Include trailers from new and upcoming movies';

  @override
  String get adminCinemaIntrosOlder => 'Include trailers from older movies';

  @override
  String get adminCinemaIntrosLibrary =>
      'Include trailers from movies in my libraries';

  @override
  String get adminCinemaIntrosLibraryHelp => 'Needs local trailers set up.';

  @override
  String get adminCinemaIntrosCount => 'Number of trailers to play';

  @override
  String get adminCinemaIntrosParental => 'Smart parental control';

  @override
  String get adminCinemaIntrosParentalHelp =>
      'Only picks trailers rated the same as or lower than what\'s being watched.';

  @override
  String get adminCinemaIntrosUnwatchedOnly =>
      'Only play intros before unwatched content';

  @override
  String get adminCinemaIntrosSimilarOnly =>
      'Only play trailers similar to what\'s being watched';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      'Based on shared genres, tags, studios and so on.';

  @override
  String get adminCinemaIntrosCustom => 'Custom intros';

  @override
  String get adminCinemaIntrosCustomPath => 'Custom intros folder';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      'A folder of videos. One is picked at random and plays after the trailers.';

  @override
  String get adminCinemaIntrosCodecPath => 'Codec intros folder';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      'A folder of videos. One whose file name matches the video codec, audio codec, audio profile or a tag plays before the main feature.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => 'Play To and the DLNA server';

  @override
  String get adminDlnaPlayTo => 'Enable DLNA Play To';

  @override
  String get adminDlnaPlayToHelp =>
      'Emby can find devices on your network and control them remotely.';

  @override
  String get adminDlnaServer => 'Enable the DLNA server';

  @override
  String get adminDlnaServerHelp =>
      'Lets the server stream media to DLNA devices.';

  @override
  String get adminDlnaDefaultUser => 'Default user';

  @override
  String get adminDlnaDefaultUserHelp =>
      'Whose libraries connected devices see. A device profile can override it.';

  @override
  String get adminDlnaDebugLog => 'Enable DLNA debug logging';

  @override
  String get adminDlnaDebugLogHelp =>
      'Makes large log files. Only turn it on while troubleshooting.';

  @override
  String get adminDrawerCameraUpload => 'Camera Upload';

  @override
  String get adminPageDescCameraUpload => 'Where photos from phones are saved';

  @override
  String get adminCameraUploadPath => 'Camera upload folder';

  @override
  String get adminCameraUploadPathHelp =>
      'Leave it blank to use the default folder. A custom folder also has to be added as a library.';

  @override
  String get adminCameraUploadSubfolders => 'Make a subfolder for each device';

  @override
  String get adminDrawerConversions => 'Conversions';

  @override
  String get adminPageDescConversions => 'Converted media and downloads';

  @override
  String get adminConversionsTempPath => 'Temporary file folder';

  @override
  String get adminConversionsTempPathHelp =>
      'Where media is kept while it\'s being converted.';

  @override
  String get adminConversionsFullSpeed => 'Convert at full speed';

  @override
  String get adminConversionsFullSpeedHelp =>
      'Conversions run slowly by default to keep the load down.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => 'License status and key';

  @override
  String get adminPremiereActive => 'Premiere is active on this server.';

  @override
  String get adminPremiereInactive => 'This server has no Premiere key.';

  @override
  String get adminPremiereKeyInvalid =>
      'A key is set but isn\'t active. It may be mistyped or expired.';

  @override
  String get adminPremiereCurrentKey => 'Current key';

  @override
  String get adminPremiereNewKey => 'New key';

  @override
  String get adminPremiereNewKeyHint =>
      'Paste the key from your Emby Premiere email.';

  @override
  String get adminPremiereSaveKey => 'Save key';

  @override
  String get adminPremiereRemoveKey => 'Remove key';

  @override
  String get adminPremiereKeyRejected =>
      'Emby saved the key but didn\'t accept it.';

  @override
  String get adminPremiereLoadFailed => 'Couldn\'t load the Premiere status';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere required';

  @override
  String get embyPremiereRequiredBody =>
      'This needs an active Emby Premiere subscription on the server.';

  @override
  String get embyPremiereRequiredSaveBody =>
      'This needs an active Emby Premiere subscription. Emby keeps the setting but won\'t use it until Premiere is active.';

  @override
  String get embyPremiereLearnMore => 'Learn more';

  @override
  String get embyPremiereSaveAnyway => 'Save anyway';

  @override
  String get embyPremiereEnterKey => 'Enter key';

  @override
  String get adminPremiereNote =>
      'Needs Emby Premiere. The server keeps this setting but won\'t use it until Premiere is active.';

  @override
  String adminExternalIdLabel(String name) {
    return '$name Id';
  }

  @override
  String get adminExternalIdTypePerson => 'Person';

  @override
  String get adminExternalIdTypeArtist => 'Artist';

  @override
  String get adminExternalIdTypeAlbumArtist => 'Album Artist';

  @override
  String get adminExternalIdTypeOtherArtist => 'Other Artist';

  @override
  String get adminExternalIdTypeReleaseGroup => 'Release Group';

  @override
  String get adminExternalIdTypeBook => 'Book';

  @override
  String get adminPlaybackHwAccelWarning =>
      'Hardware acceleration can be unstable on some systems. Keep the operating system and video drivers up to date, and set this back to None if video stops playing.';

  @override
  String get adminLibMetadataChangeHelp =>
      'Changes to metadata settings apply to new content. To update existing content, refresh it from its detail page or refresh the library.';

  @override
  String get adminLibFetcherSettings => 'Fetcher settings';

  @override
  String adminLibImageOptionsTitle(String type) {
    return 'Image options for $type';
  }

  @override
  String get adminLibFetchImages => 'Fetch images';

  @override
  String get adminLibMaxBackdrops => 'Maximum number of backdrops per item';

  @override
  String get adminLibMinBackdropWidth => 'Minimum backdrop download width';

  @override
  String get adminImageTypeArt => 'Clearart';

  @override
  String get adminImageTypeBox => 'Box';

  @override
  String get adminImageTypeBoxRear => 'Box (back)';

  @override
  String get adminImageTypeDisc => 'Disc';

  @override
  String get adminImageTypeMenu => 'Menu';

  @override
  String get adminActivityMediaDetails => 'Media details';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      'e.g. 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => 'Original language';

  @override
  String get adminMetadataFieldDateAdded => 'Date added';

  @override
  String get adminMetadataFieldArtists => 'Artists';

  @override
  String get adminMetadataFieldAlbumArtists => 'Album artists';

  @override
  String get adminMetadataFieldAlbum => 'Album';

  @override
  String get adminMetadataFieldSeriesName => 'Series name';

  @override
  String get adminMetadataFieldEpisodeNumber => 'Episode number';

  @override
  String get adminMetadataFieldSeasonNumber => 'Season number';

  @override
  String get adminMetadataFieldTrackNumber => 'Track number';

  @override
  String get adminMetadataFieldDiscNumber => 'Disc number';

  @override
  String get adminMetadataFieldAirTime => 'Air time';

  @override
  String get adminMetadataFieldRuntime => 'Runtime in minutes';

  @override
  String get adminMetadataFieldPlaceOfBirth => 'Place of birth';

  @override
  String get adminMetadataFieldBirthDate => 'Birth date';

  @override
  String get adminMetadataFieldBirthYear => 'Birth year';

  @override
  String get adminMetadataFieldDeathDate => 'Death date';

  @override
  String get adminMetadataFieldAspectRatio => 'Original aspect ratio';

  @override
  String get adminMetadataFieldAirsBeforeSeason => 'Airs before season';

  @override
  String get adminMetadataFieldAirsAfterSeason => 'Airs after season';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => 'Airs before episode';

  @override
  String get adminMetadataNamesHelp =>
      'Separate several names with a semicolon.';

  @override
  String get adminMetadataSectionRatings => 'Ratings';

  @override
  String get adminMetadataItemLocked =>
      'This item\'s metadata is locked. Unlock it before you identify it.';

  @override
  String get adminMetadataNameOrIdRequired => 'Enter a name or an external ID.';

  @override
  String get adminLibMetadataReaders => 'Metadata readers';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return 'Similar item providers: $type';
  }

  @override
  String get adminLibMediaSegmentProviders => 'Media segment providers';

  @override
  String get adminLibEnableLibrary => 'Enable the library';

  @override
  String get adminLibEnableLibraryHelp =>
      'Disabling the library hides it from all user views.';

  @override
  String get adminLibSaveLyricsWithMedia => 'Save lyrics into media folders';

  @override
  String get adminLibUseCustomTagDelimiters => 'Use custom tag delimiter';

  @override
  String get adminLibCustomTagDelimiters => 'Custom tag delimiter';

  @override
  String get adminLibCustomTagDelimitersHelp =>
      'Characters to treat as delimiters that separate tags.';

  @override
  String get adminLibDelimiterWhitelist => 'Delimiter whitelist';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      'Items to leave out of tag splitting, one per line.';

  @override
  String get adminLibDownloadLanguages => 'Download languages';

  @override
  String get adminLibraryFolderRequired =>
      'Add at least one folder to this library.';

  @override
  String get adminRenameLibraryWarning =>
      'Renaming a library loses all of its metadata. Proceed with caution.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return 'Remove the library \"$name\"? Files on disk are not deleted.';
  }

  @override
  String get adminDeleteLibraryLocations =>
      'These media locations will be removed from the library:';

  @override
  String get adminRefreshMode => 'Refresh mode';

  @override
  String get adminRefreshModeScan => 'Scan for new and updated files';

  @override
  String get adminRefreshModeMissing => 'Search for missing metadata';

  @override
  String get adminReplaceTrickplayImages => 'Replace existing trickplay images';

  @override
  String get adminRefreshDialogHelp =>
      'Metadata is refreshed based on the settings and internet services enabled in the dashboard.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown of $total';
  }

  @override
  String get adminLiveTvTabSources => 'Tuners and guide';

  @override
  String get adminLiveTvTabRecordings => 'Recordings';

  @override
  String get adminLiveTvAddTuner => 'Add tuner device';

  @override
  String get adminLiveTvEditTuner => 'Edit tuner device';

  @override
  String get adminLiveTvTunerType => 'Tuner type';

  @override
  String get adminLiveTvDetectDevices => 'Detect my devices';

  @override
  String get adminLiveTvNoNewDevices => 'No new devices found';

  @override
  String get adminLiveTvDrmNote => 'Channels with DRM will not be imported.';

  @override
  String get adminLiveTvTunerSaved => 'Tuner saved';

  @override
  String get adminLiveTvDeleteTuner => 'Delete tuner device';

  @override
  String get adminLiveTvDeleteTunerConfirm =>
      'Are you sure you want to delete this tuner device?';

  @override
  String get adminLiveTvDeleteProvider => 'Delete guide provider';

  @override
  String get adminLiveTvDeleteProviderConfirm =>
      'Are you sure you want to delete this guide provider?';

  @override
  String get adminLiveTvProviderSaved => 'Guide provider saved';

  @override
  String get adminLiveTvAddProvider => 'Add provider';

  @override
  String get adminLiveTvRefreshGuide => 'Refresh guide data';

  @override
  String get adminLiveTvMapChannels => 'Map channels';

  @override
  String get adminLiveTvNoTunerChannels => 'No tuner channels found';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'A path or URL to an XMLTV file. The server reads it and checks it for updates. You are responsible for creating and updating the file.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return 'Create an account at $url';
  }

  @override
  String get adminLiveTvSdSignIn => 'Sign in';

  @override
  String get adminLiveTvSdLineup => 'Lineup';

  @override
  String get adminLiveTvSdSelectLineup =>
      'Select a lineup. If none are listed, check your username, password and postal code.';

  @override
  String get adminLiveTvGuideDays => 'Number of days of guide data to download';

  @override
  String get adminLiveTvGuideDaysHelp =>
      'More days let you schedule further ahead and see more listings, but the download takes longer. Automatic picks a value from the number of channels.';

  @override
  String get adminLiveTvRecordingPath => 'Default recording path';

  @override
  String get adminLiveTvRecordingPathHelp =>
      'Where recordings are saved. If empty, the server\'s program data folder is used.';

  @override
  String get adminLiveTvStartWhenPossible => 'Start when possible';

  @override
  String get adminLiveTvStopWhenPossible => 'Stop when possible';

  @override
  String get adminLiveTvMinutesBefore => 'minutes before';

  @override
  String get adminLiveTvMinutesAfter => 'minutes after';

  @override
  String get adminLiveTvSectionGuide => 'Guide data';

  @override
  String get adminLiveTvSectionDefaultRecording => 'Default recording settings';

  @override
  String get adminLiveTvSectionMetadata => 'Recording metadata';

  @override
  String adminUserLastActivity(String time) {
    return 'Last activity $time';
  }

  @override
  String get adminCurrentPassword => 'Current password';

  @override
  String get adminChannelAccess => 'Channel access';

  @override
  String get adminDeviceAccess => 'Device access';

  @override
  String get adminDeleteFromAllLibraries => 'All libraries';

  @override
  String get adminUserDisabledBanner =>
      'This user is disabled. Turn off Disabled under Permissions to let them sign in again.';

  @override
  String get adminNewPasswordEmpty => 'New password cannot be empty';

  @override
  String get adminScheduleStartBeforeEnd =>
      'The start time must be before the end time';

  @override
  String get adminDashboardAlerts => 'Alerts';

  @override
  String get adminSessionGoHome => 'Go to home screen';

  @override
  String get adminPlayMethodRemux => 'Remuxing';

  @override
  String get adminPlayMethodDirectStream => 'Direct streaming';

  @override
  String get adminPlayMethodDirectPlay => 'Direct playing';

  @override
  String get adminLogLevelTrace => 'Trace';

  @override
  String get adminLogLevelDebug => 'Debug';

  @override
  String get adminLogLevelInformation => 'Information';

  @override
  String get adminLogLevelWarning => 'Warning';

  @override
  String get adminLogLevelError => 'Error';

  @override
  String get adminLogLevelCritical => 'Critical';

  @override
  String get adminLogLevelNone => 'None';

  @override
  String get adminActivityAllUsers => 'All users';

  @override
  String adminTaskLastRan(String time, String duration) {
    return 'Last ran $time, taking $duration.';
  }

  @override
  String get adminTaskResultFailed => 'Failed';

  @override
  String get adminTaskResultCancelled => 'Cancelled';

  @override
  String get adminTaskResultAborted => 'Aborted by server shutdown';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '${seconds}s';
  }

  @override
  String get adminDeleteTaskTrigger => 'Delete task trigger';

  @override
  String get adminDeleteTaskTriggerConfirm =>
      'Are you sure you want to delete this task trigger?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return 'Every $minutes minutes';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return 'Every $hours hours';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes minutes';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours hours';
  }

  @override
  String get adminTimeLimitHours => 'Time limit (hours)';

  @override
  String get adminTranscodingDecodingFor => 'Enable hardware decoding for';

  @override
  String get adminTranscodingThreadCountHelp =>
      'The most threads a transcode can use. Fewer threads lower CPU use but may be too slow for smooth playback.';

  @override
  String get adminTranscodingThreadMax => 'Max';

  @override
  String get adminTranscodingFfmpegPath => 'FFmpeg path';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      'The FFmpeg the server runs. It is set on the server, not here.';

  @override
  String get adminTranscodingAudioSeek => 'Audio seek strategy';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'How the server handles audio when you seek in an HLS stream.';

  @override
  String get adminTranscodingTrimCopiedAudio => 'Trim copied audio';

  @override
  String get adminTranscodingTranscodeAudio => 'Transcode audio';

  @override
  String get adminResumeMinAudiobookMinutes =>
      'Minimum audiobook resume (minutes)';

  @override
  String get adminResumeMinAudiobookHelp =>
      'Audiobooks stopped before this time count as unplayed.';

  @override
  String get adminResumeAudiobookRemaining =>
      'Audiobook remaining minutes to resume';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      'Audiobooks stopped with less than this many minutes left count as played.';

  @override
  String get adminBrandingSplashSection => 'Splash screen';

  @override
  String get adminBrandingSectionWebClient => 'Web client';

  @override
  String get adminBrandingSplashSizeHint =>
      'Custom images should be in a 16x9 aspect ratio at a minimum size of 1920x1080.';

  @override
  String get adminNetworkingSectionServerAddress => 'Server address settings';

  @override
  String get adminNetworkingSectionHttps => 'HTTPS settings';

  @override
  String get adminNetworkingSectionRemoteAccess => 'Remote access settings';

  @override
  String get adminNetworkingSectionIpProtocols => 'IP protocols';

  @override
  String get adminNetworkingSectionDiscovery => 'Network discovery';

  @override
  String get adminNetworkingSectionFirewall => 'Firewall and proxy settings';

  @override
  String get adminNetworkingLocalHttpPort => 'Local HTTP port number';

  @override
  String get adminNetworkingLocalHttpPortHelp =>
      'The TCP port number for the HTTP server.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'Listen on the HTTPS port. A valid certificate must also be set for this to take effect.';

  @override
  String get adminNetworkingLocalHttpsPort => 'Local HTTPS port number';

  @override
  String get adminNetworkingLocalHttpsPortHelp =>
      'The TCP port number for the HTTPS server.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      'Adds a subdirectory to the server URL, for example https://example.com/jellyfin.';

  @override
  String get adminNetworkingBindAddress => 'Bind to local network address';

  @override
  String get adminNetworkingBindAddressHelp =>
      'Overrides the local IP address of the HTTP server. Leave it empty to bind to all addresses. A change needs a restart.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      'IP addresses or IP/netmask entries of networks treated as local for bandwidth and remote access limits. Leave it empty to treat all RFC1918 addresses as local.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      'IP addresses or host names of the proxies in front of this server. Needed to read X-Forwarded-For headers. A change needs a restart.';

  @override
  String get adminNetworkingCustomCertPath => 'Custom SSL certificate path';

  @override
  String get adminNetworkingCertPathHelp =>
      'Path to a PKCS #12 file with a certificate and private key, for TLS on a custom domain.';

  @override
  String get adminNetworkingCertPasswordHelp =>
      'Enter the password if your certificate needs one.';

  @override
  String get adminNetworkingAllowRemote =>
      'Allow remote connections to this server';

  @override
  String get adminNetworkingAllowRemoteHelp =>
      'When off, all remote connections are blocked.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      'IP addresses or IP/netmask entries of remote networks. Leave it empty to allow every remote address.';

  @override
  String get adminNetworkingRemoteIpFilterMode =>
      'Remote IP address filter mode';

  @override
  String get adminNetworkingPublicHttpPortHelp =>
      'The public port mapped to the local HTTP port.';

  @override
  String get adminNetworkingPublicHttpsPortHelp =>
      'The public port mapped to the local HTTPS port.';

  @override
  String get adminNetworkingAutoDiscoveryLabel => 'Enable auto discovery';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      'Lets apps find this server on UDP port 7359.';

  @override
  String get adminNetworkingSamePublishedUri =>
      'Use the same published server URI for internal and external access';

  @override
  String get adminNetworkingPublishedUri => 'Published server URI';

  @override
  String get adminNetworkingPublishedUriHelp =>
      'Overrides the URI the server gives out, based on the interface or the client IP address.';

  @override
  String get adminNetworkingInternalUri => 'Internal URI';

  @override
  String get adminNetworkingInternalUriHelp =>
      'Published server URI for internal access.';

  @override
  String get adminNetworkingExternalUri => 'External URI';

  @override
  String get adminNetworkingExternalUriHelp =>
      'Published server URI for external access.';

  @override
  String get adminNetworkingOtherPublishedUris => 'Other published URIs';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      'URIs for one subnet or interface, written as subnet=URI.';

  @override
  String get adminBackupsHelp =>
      'Create and restore snapshots of your server. They can include the database, metadata, subtitles and trickplay images.';

  @override
  String get adminBackupDisclaimer =>
      'Depending on the size of your library, the backup can take a while.';

  @override
  String get adminBackupTasksWarningTitle => 'Scheduled tasks are running';

  @override
  String get adminBackupTasksWarning =>
      'Stop these tasks or wait for them to finish before you create a backup.';

  @override
  String get adminBackupArchiveNotFound =>
      'The server could not find this backup archive.';

  @override
  String get adminRestoreInProgress => 'Restore in progress';

  @override
  String get adminRestoreWaitingForServer =>
      'Waiting for the server to come back.';

  @override
  String get adminRestoreSucceeded => 'Restore completed';

  @override
  String get adminLogWatch => 'Watch';

  @override
  String get adminLogStopWatching => 'Stop watching';

  @override
  String get adminPluginInstallConfirmTitle => 'Confirm plugin installation';

  @override
  String get adminPluginInstallDisclaimer =>
      'Installing a third party plugin carries risks. It may contain unstable or malicious code, and it can change at any time. Only install plugins from authors you trust, and know what they can do, such as query outside services, slow down library scans or add background work.';

  @override
  String get adminGroupOverview => 'Overview';

  @override
  String get adminGroupLibrary => 'Library';

  @override
  String get adminGroupPlayback => 'Playback';

  @override
  String get adminGroupPeople => 'People';

  @override
  String get adminGroupSystem => 'System';

  @override
  String get adminAreasLabel => 'Admin areas';

  @override
  String get adminPagesLabel => 'Pages';

  @override
  String get adminPageDescDashboard =>
      'Server health, sessions and recent activity';

  @override
  String get adminPageDescAnalytics => 'Library sizes, codecs and formats';

  @override
  String get adminPageDescActivity => 'Everything that happened on the server';

  @override
  String get adminPageDescTasks => 'Scans, cleanups and their triggers';

  @override
  String get adminPageDescLibraries =>
      'Folders, scanners and metadata fetchers';

  @override
  String get adminPageDescDisplay => 'How libraries show to users';

  @override
  String get adminPageDescMetadata => 'Default language, country and images';

  @override
  String get adminPageDescNfo => 'Kodi NFO reading and saving';

  @override
  String get adminPageDescLiveTv => 'Tuners, guide data and recordings';

  @override
  String get adminPageDescTranscoding =>
      'Hardware acceleration, encoders, tone mapping';

  @override
  String get adminPageDescResume => 'When items count as started or played';

  @override
  String get adminPageDescStreaming => 'Remote bitrate limit';

  @override
  String get adminPageDescTrickplay => 'Seek preview thumbnails';

  @override
  String get adminPageDescUsers => 'Accounts, access and parental control';

  @override
  String get adminPageDescDevices => 'Signed in devices and their names';

  @override
  String get adminPageDescApiKeys => 'Keys for apps and scripts';

  @override
  String get adminPageDescSettings =>
      'Server name, language, paths, performance';

  @override
  String get adminPageDescBranding =>
      'Login message, custom CSS, splash screen';

  @override
  String get adminPageDescNetworking => 'Ports, HTTPS, LAN and remote access';

  @override
  String get adminPageDescPlugins => 'Installed plugins and the catalog';

  @override
  String get adminPageDescRepositories => 'Where plugins come from';

  @override
  String get adminPageDescBackups => 'Create and restore server backups';

  @override
  String get adminPageDescLogs => 'Server log files';

  @override
  String adminSearchSettingsHint(int count) {
    return 'Search $count settings';
  }

  @override
  String get adminSearchNoResults => 'No settings match';

  @override
  String get adminSearchClear => 'Clear search';

  @override
  String get adminUnsavedChanges => 'Unsaved changes';

  @override
  String get adminDiscard => 'Discard';

  @override
  String get adminLeaveTitle => 'Discard unsaved changes?';

  @override
  String get adminLeaveMessage =>
      'The changes on this page haven\'t been saved yet.';

  @override
  String get adminKeepEditing => 'Keep editing';

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
  String get adminLibraryLoadFailed => 'Не успеа да се вчита библиотеката';

  @override
  String get adminNoMediaPaths => 'Нема конфигурирани медиумски патеки';

  @override
  String get adminAddPath => 'Додадете патека';

  @override
  String get adminBrowseFilesystem =>
      'Прелистајте го датотечен систем на серверот:';

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
  String adminSaveFailed(String error) {
    return 'Неуспешно зачувување: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Лозинките не се совпаѓаат';

  @override
  String adminFailed(String error) {
    return 'Неуспешно: $error';
  }

  @override
  String get adminUserLoadFailed => 'Не успеа да се вчита корисникот';

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
  String get adminEnableAllLibraryAccess =>
      'Овозможете пристап до сите библиотеки';

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
  String get adminPlaybackLoadFailed =>
      'Не успеа да се вчитаат поставките за репродукција';

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
  String adminMetadataLoadFailed(String error) {
    return 'Неуспешно вчитување на метаподатоците: $error';
  }

  @override
  String get adminRefreshMetadata => 'Освежете ги метаподатоците';

  @override
  String get recursive => 'Рекурзивен';

  @override
  String get adminReplaceAllMetadata => 'Заменете ги сите метаподатоци';

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
  String get adminEnableAllTuners => 'Овозможи ги сите тјунери';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Неуспешно отстранување на тјунерот: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Неуспешно отстранување на провајдерот: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Патека за снимање на серии';

  @override
  String get adminMovieRecordingPath => 'Патека за снимките на филмови';

  @override
  String get adminGuideDaysAuto => 'Автоматски';

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
  String get adminLiveTvSectionPaths => 'Патеки за снимките';

  @override
  String get adminLiveTvSectionPostProcessing => 'Последователна обработка';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Неуспешно зачувување на поставките: $error';
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
  String get adminGuideRefreshStarted =>
      'Освежувањето на податоците за водичот започна';

  @override
  String get adminGuideRefreshUnavailable =>
      'Задачата за освежување на водичот не е достапна на овој сервер.';

  @override
  String get adminNoListingProviders =>
      'Не се конфигурирани даватели на огласи';

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
  String get adminBackupsTitle => 'Резервни копии';

  @override
  String get adminUnknownDate => 'Непознат датум';

  @override
  String get adminUnnamedBackup => 'Неименувана резервна копија';

  @override
  String get adminApply => 'Примени';

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
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Ознака';

  @override
  String get adminMetadataFieldOverview => 'Преглед';

  @override
  String get adminMetadataFieldDisplayOrder => 'Display order';

  @override
  String get adminMetadataDisplayOrderAired => 'Aired';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate => 'Original air date';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Absolute';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Digital';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Story arc';

  @override
  String get adminMetadataDisplayOrderProduction => 'Production';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternate';

  @override
  String get adminMetadataDisplayOrderRegional => 'Regional';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'Alternate DVD';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Date modified';

  @override
  String get adminMetadataDisplayOrderSortName => 'Sort name';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Release date';

  @override
  String get adminMetadataSettings => 'Metadata Settings';

  @override
  String get adminMetadataDownloadLanguage => 'Preferred download language';

  @override
  String get adminMetadataCountryRegion => 'Country/Region';

  @override
  String get adminMetadataInheritHelp =>
      'Leave this on Default to inherit the setting from a parent item, or from the server default.';

  @override
  String get adminMetadataField3DFormat => '3D format';

  @override
  String get adminMetadataPersonKindActor => 'Actor';

  @override
  String get adminMetadataPersonKindDirector => 'Director';

  @override
  String get adminMetadataPersonKindComposer => 'Composer';

  @override
  String get adminMetadataPersonKindWriter => 'Writer';

  @override
  String get adminMetadataPersonKindGuestStar => 'Guest star';

  @override
  String get adminMetadataPersonKindProducer => 'Producer';

  @override
  String get adminMetadataPersonKindConductor => 'Conductor';

  @override
  String get adminMetadataPersonKindLyricist => 'Lyricist';

  @override
  String get adminMetadataPersonKindArranger => 'Arranger';

  @override
  String get adminMetadataPersonKindEngineer => 'Engineer';

  @override
  String get adminMetadataPersonKindMixer => 'Mixer';

  @override
  String get adminMetadataPersonKindRemixer => 'Remixer';

  @override
  String get adminMetadataPersonKindCreator => 'Creator';

  @override
  String get adminMetadataPersonKindArtist => 'Artist';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Album artist';

  @override
  String get adminMetadataPersonKindAuthor => 'Author';

  @override
  String get adminMetadataPersonKindIllustrator => 'Illustrator';

  @override
  String get adminMetadataPersonKindPenciller => 'Penciller';

  @override
  String get adminMetadataPersonKindInker => 'Inker';

  @override
  String get adminMetadataPersonKindColorist => 'Colorist';

  @override
  String get adminMetadataPersonKindLetterer => 'Letterer';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Cover artist';

  @override
  String get adminMetadataPersonKindEditor => 'Editor';

  @override
  String get adminMetadataPersonKindTranslator => 'Translator';

  @override
  String get adminMetadataPersonKindNarrator => 'Narrator';

  @override
  String get adminMetadataAirDays => 'Air days';

  @override
  String get adminMetadataLockItem =>
      'Lock this item to prevent future metadata changes';

  @override
  String get adminMetadataEnabledFields => 'Enabled Fields';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Uncheck a field to lock it and prevent its data from being changed.';

  @override
  String get adminMetadataLockFieldName => 'Name';

  @override
  String get adminMetadataLockFieldOverview => 'Overview';

  @override
  String get adminMetadataLockFieldGenres => 'Genres';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Parental rating';

  @override
  String get adminMetadataLockFieldCast => 'People';

  @override
  String get adminMetadataLockFieldProductionLocations =>
      'Production locations';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Birth location';

  @override
  String get adminMetadataLockFieldRuntime => 'Runtime';

  @override
  String get adminMetadataLockFieldStudios => 'Studios';

  @override
  String get adminMetadataLockFieldTags => 'Tags';

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
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Нема додатоци кои одговараат на вашето пребарување';

  @override
  String get adminPluginsNoneInstalled => 'Нема инсталирани додатоци';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

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
  String get adminNetworkingEnableHttps => 'Овозможи HTTPS';

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
  String get adminPlaybackQsvDevice => 'QSV уред';

  @override
  String get adminPlaybackEnhancedNvdec => 'Овозможи подобрен NVDEC декодер';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Претпочитај го системскиот хардверски декодер';

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
  String get adminNetworkingPublicHttpPort => 'Јавен HTTP порт';

  @override
  String get adminNetworkingRequireHttps => 'Барај HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Пренасочи ги сите оддалечени барања кон HTTPS. Нема ефект ако серверот нема важечки сертификат.';

  @override
  String get adminNetworkingCertPassword => 'Лозинка на сертификатот';

  @override
  String get adminNetworkingEnableIpv4 => 'Овозможи IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Овозможи IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'LAN мрежи';

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
  String get kidsMode => 'Kids Mode';

  @override
  String get kidsModeSubtitle =>
      'Simplify the app and lock the way out with a PIN';

  @override
  String get kidsModeExit => 'Exit Kids Mode';

  @override
  String get kidsModeExitSubtitle => 'Enter your PIN to restore the full app';

  @override
  String get pinIncorrect => 'Неточен ПИН';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

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
  String get trackActionViewDetails => 'View Details';

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
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

  @override
  String get settingsAdministrationSubtitle =>
      'Пристапете до панелот за администрација на серверот';

  @override
  String get settingsDynamicContent => 'Динамичка содржина';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медиумска лента и визуелни преклопувања';

  @override
  String get settingsAboutSubtitle =>
      'Верзија на апликација, правни информации и кредити';

  @override
  String get settingsSortServersBy => 'Подреди сервери по';

  @override
  String get settingsLastUsed => 'Последно користено';

  @override
  String get settingsAlphabetical => 'Азбучно';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Дозволи самопотпишани сертификати';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Верувај им на серверите што користат самопотпишани TLS сертификати или сертификати од приватен CA. Овозможете само за сервери што ги контролирате. Ова ја оневозможува проверката на сертификатите за сите врски.';

  @override
  String get untrustedServerCertificate =>
      'This server\'s certificate isn\'t trusted. If it\'s your own server and uses a self-signed or private certificate, you can allow it here.';

  @override
  String get clientCertTitle => 'Client certificate';

  @override
  String clientCertHost(String host) {
    return 'Certificate for $host';
  }

  @override
  String get clientCertChooseFile => 'Choose file';

  @override
  String get clientCertPassword => 'Certificate password';

  @override
  String get clientCertStartUpload => 'Send from phone';

  @override
  String get clientCertUploadHint =>
      'Scan this code with your phone, or open the address in its browser, then pick the file and enter its password.';

  @override
  String get clientCertStopUpload => 'Stop waiting';

  @override
  String get clientCertNoFileData => 'Couldn\'t read the file. Try again.';

  @override
  String get clientCertPickFailed => 'Couldn\'t open the file picker.';

  @override
  String get clientCertUploadFailed =>
      'Couldn\'t start the upload page. Try again.';

  @override
  String get clientCertNoSecureStorage =>
      'This device has no secure storage, so the certificate can\'t be saved. On Linux, install libsecret and try again.';

  @override
  String get clientCertDecodeFailed =>
      'Couldn\'t read that file as a certificate. Make sure it\'s a .p12 or .pfx.';

  @override
  String get clientCertWrongPassword =>
      'That password doesn\'t unlock this certificate.';

  @override
  String get clientCertRequired =>
      'This server needs a client certificate (mTLS). Add one for this host to continue.';

  @override
  String clientCertExpired(String date) {
    return 'The certificate for this server expired on $date. Replace it to continue.';
  }

  @override
  String get clientCertAddButton => 'Add client certificate';

  @override
  String get settingsClientCertificates => 'Client certificates';

  @override
  String get settingsClientCertificatesSubtitle =>
      'Certificates this app presents to servers that require one (mTLS)';

  @override
  String get clientCertSubject => 'Subject';

  @override
  String clientCertExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get clientCertReplace => 'Replace';

  @override
  String get clientCertAdd => 'Add certificate';

  @override
  String get clientCertAddHostPrompt =>
      'Which server host needs a certificate?';

  @override
  String get itemBlockedByParentalControls => 'This isn\'t available';

  @override
  String get blockedRatingsCeilingHint =>
      'Blocking a rating also blocks everything stronger than it.';

  @override
  String get blockedRatingsUnrankedSection => 'Only blocks itself';

  @override
  String get settingsHomePage => 'Почетна страница';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

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
  String emulatorCoreResetSettings(String system) {
    return 'Reset $system settings to defaults';
  }

  @override
  String get emulatorCoreSettingsReset => 'Settings reset to defaults.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Could not reset settings. Check your connection and try again.';

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
  String get settingsBoth => 'И двете';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Измешај го филтерот за тип на содржина';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Опции за аудио траки, обработка и премин';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматска репродукција и секвенционирање';

  @override
  String get settingsSyncplaySubtitle =>
      'Логика за синхронизација за групни сесии';

  @override
  String get settingsSkipIntrosAndOutros => 'Прескокнете воведни и аутроси?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

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
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv (наследство)';

  @override
  String get settingsRedetectDisplay => 'Re-detect display';

  @override
  String get settingsRedetectDisplayDescription =>
      'Ask the TV again what HDR formats it supports. Use this if Dolby Vision or HDR10 titles are being transcoded after the TV or receiver was powered on late.';

  @override
  String get settingsDisplayIsSdr => 'My TV is not HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Stop advertising HDR support for this display. Use this only if detection keeps reporting HDR your TV can\'t actually show.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Display re-detected: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'No HDR formats detected';

  @override
  String get settingsDisplayMarkedSdr => 'Display saved as SDR';

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
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

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
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

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
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

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
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Класичниот задржува тип на слика по ред и информативен слој. Модерниот користи редови од портрет до позадина.';

  @override
  String get modernCardsOnMyMediaRow => 'Modern cards on My Media row';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Display customizable posters that expand on focus. Disable to always show landscape thumbnail.';

  @override
  String get sortOrder => 'Sort Order';

  @override
  String get ascending => 'Ascending';

  @override
  String get descending => 'Descending';

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
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

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
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Ставки во редовите со жанрови';

  @override
  String get genresRowItemsDescription =>
      'Прикажувај филмови, серии или и двете во редовите со жанрови.';

  @override
  String get displayStudiosRows => 'Display Studio Row';

  @override
  String get displayStudiosRowsSubtitle => 'Show Studio row in Home Sections.';

  @override
  String get studiosRowSorting => 'Studio Row Sorting';

  @override
  String get studiosRowSortingDescription =>
      'Studio row by name, recently added, and more.';

  @override
  String get studiosRowSortOrderDescription =>
      'Choose Ascending or Descending sort order.';

  @override
  String get selectStudiosToInclude => 'Select Studios to Include';

  @override
  String get selectStudiosToIncludeDescription =>
      'Select which studios should be included on the home row.';

  @override
  String get selectAllStudios => 'Select All';

  @override
  String get deselectAllStudios => 'Deselect All';

  @override
  String get tvStudiosFilter => 'TV Studios';

  @override
  String get movieStudiosFilter => 'Movie Studios';

  @override
  String get selectedStudiosFilter => 'Selected Studios';

  @override
  String get unselectedStudiosFilter => 'Unselected Studios';

  @override
  String get filtersHeader => 'Filters';

  @override
  String get showHeader => 'Show';

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
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get audioRowsSortOrderDescription =>
      'Sort Audio rows in ascending or descending order.';

  @override
  String get sorting => 'Sorting';

  @override
  String get imdbRowsSorting => 'IMDb Row Sorting';

  @override
  String get imdbRowsSortingDescription =>
      'Sort IMDb rows by name, release date, rating, and more.';

  @override
  String get imdbRowsSortOrderDescription =>
      'Sort IMDb rows in ascending or descending order.';

  @override
  String get tmdbRowsSorting => 'TMDB Row Sorting';

  @override
  String get tmdbRowsSortingDescription =>
      'Sort TMDB rows by name, release date, rating, and more.';

  @override
  String get tmdbRowsSortOrderDescription =>
      'Sort TMDB rows in ascending or descending order.';

  @override
  String get seerrRowsSorting => 'Seerr Row Sorting';

  @override
  String get seerrRowsSortingDescription =>
      'Sort Seerr rows by name, release date, rating, and more.';

  @override
  String get seerrRowsSortOrderDescription =>
      'Sort Seerr rows in ascending or descending order.';

  @override
  String get externalRowSortDefault => 'Default (List Order)';

  @override
  String get externalRowSortName => 'Name';

  @override
  String get externalRowSortReleaseDate => 'Release Date';

  @override
  String get externalRowSortRating => 'Rating';

  @override
  String get externalRowSortPopularity => 'Popularity';

  @override
  String get externalRowSortShuffle => 'Shuffle';

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
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Поддржано на овој уред';

  @override
  String get notSupportedOnThisDevice => 'Не е поддржано на овој уред';

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
  String get hevcSoftwareDirectPlay => 'Direct Play HEVC (Software Decode)';

  @override
  String get hevcSoftwareDirectPlaySubtitle =>
      'Play HEVC up to 1080p from the original file instead of asking the server to transcode it. This Apple TV decodes it in software, so heavy 10-bit or high bitrate files may stutter.';

  @override
  String get av1SoftwareUhdDirectPlay => 'Direct Play 4K AV1 (Software Decode)';

  @override
  String get av1SoftwareUhdDirectPlaySubtitle =>
      'Play AV1 above 1080p, including HDR10, from the original file instead of asking the server to transcode it. This device decodes AV1 in software, so heavy 4K or high bitrate files may stutter.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Отворај ја видео репродукцијата во избраната надворешна апликација на Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Автоматско редење';

  @override
  String get preferSdhSubtitles => 'Претпочитај SDH преводи';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Дај приоритет на SDH/CC преводите при автоматски избор.';

  @override
  String get preferTextSubtitles => 'Prefer Text Subtitles';

  @override
  String get preferTextSubtitlesSubtitle =>
      'Prioritize text-based subtitles (SRT, VTT) over image-based formats (PGS, VobSub).';

  @override
  String get preferExternalSubtitles => 'Prefer External Subtitles';

  @override
  String get preferExternalSubtitlesSubtitle =>
      'Prioritize external subtitle files over embedded tracks.';

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
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Гледај со група';

  @override
  String get watchPartyGroupSubtitles => 'Subtitles for everyone';

  @override
  String get watchPartyOwnSubtitles => 'Each person\'s choice';

  @override
  String get watchPartyLobby => 'In the lobby';

  @override
  String get watchPartyUpNextLabel => 'Up next';

  @override
  String get watchPartyRoomSettings => 'Room settings';

  @override
  String get watchPartyCodeOrLink => 'Room code or invite link';

  @override
  String get watchPartyCopyInvite => 'Copy invite link';

  @override
  String get watchPartyInviteCopied => 'Invite link copied';

  @override
  String get watchPartyLetEveryoneVote => 'Let everyone vote on movies';

  @override
  String get watchPartyVoteHelp =>
      'Add movies for everyone to vote on, then play the one you want. TV episodes are still your pick.';

  @override
  String get watchPartyGuestVoteHelp =>
      'Vote for what you want to watch. The host plays one.';

  @override
  String get watchPartySearchMovies => 'Search movies';

  @override
  String get watchPartyNoSuggestions => 'No movies to vote on yet.';

  @override
  String get watchPartySuggested => 'Added to the Watch Party vote';

  @override
  String watchPartyVoteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count votes',
      one: '$count vote',
    );
    return '$_temp0';
  }

  @override
  String get watchParty => 'Watch Party';

  @override
  String get watchPartyUnavailable => 'This server doesn\'t offer Watch Party.';

  @override
  String get watchPartyRoomCode => 'Room code';

  @override
  String get watchPartyStart => 'Start a Watch Party';

  @override
  String get watchPartyPickTitle =>
      'Open a title and choose Watch with group to pick what everyone watches.';

  @override
  String get watchPartyWaitingForHost =>
      'Waiting for the host to pick something.';

  @override
  String get watchPartyShareCode =>
      'Others join with this code from their Watch Party screen.';

  @override
  String get watchPartyReconnecting => 'Reconnecting...';

  @override
  String get watchPartyOffline => 'offline';

  @override
  String get watchPartyStartForEveryone => 'Start for everyone';

  @override
  String get watchPartyBackToLobby => 'Back to the lobby';

  @override
  String get watchPartyGuestsCanPause => 'Guests can play and pause';

  @override
  String get watchPartyEnd => 'End Watch Party';

  @override
  String get watchPartyEnded => 'The Watch Party has ended.';

  @override
  String get watchPartyStaged => 'Picked for the Watch Party';

  @override
  String watchPartyUpNext(String title) {
    return 'Up next: $title';
  }

  @override
  String get disk => 'Диск';

  @override
  String get openInBrowser => 'Отвори во прелистувач';

  @override
  String get achievementBadges => 'Achievement Badges';

  @override
  String get achievementBadgesSubtitle =>
      'Badges, ranks and quests earned from what you watch';

  @override
  String get achievementsBadges => 'Badges';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked of $total badges';
  }

  @override
  String get achievementsUnlockToasts => 'Unlock Notifications';

  @override
  String get achievementsUnlockToastsSubtitle =>
      'Show a notification when you unlock a badge';

  @override
  String get achievementsUnlockedNotification => 'Achievement unlocked';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count achievements unlocked',
      one: '$count achievement unlocked',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count more';
  }

  @override
  String get achievementsQuests => 'Quests';

  @override
  String achievementsQuestCount(int count) {
    return '$count completed';
  }

  @override
  String get achievementsLeaderboard => 'Leaderboard';

  @override
  String get achievementsLeaderboardSubtitle =>
      'How you compare with other users on this server';

  @override
  String get achievementsRecap => 'Recap';

  @override
  String get achievementsRecapSubtitle => 'What you watched recently';

  @override
  String get achievementsLibraryCompletion => 'Library completion';

  @override
  String achievementsLibraryCount(int count) {
    return '$count libraries';
  }

  @override
  String achievementsScore(int score) {
    return '$score points';
  }

  @override
  String get achievementsScoreLabel => 'Score';

  @override
  String get achievementsTopRank => 'Top rank reached';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '$points points to $tier';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return '$days day streak';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'Best: $days days';
  }

  @override
  String get achievementsShowcase => 'Showcase';

  @override
  String get achievementsUnlocked => 'Unlocked';

  @override
  String get achievementsLocked => 'Locked';

  @override
  String get achievementsNothingHere => 'Nothing here yet.';

  @override
  String get achievementsHiddenBadge => 'Hidden achievement';

  @override
  String achievementsUnlockedOn(String date) {
    return 'Unlocked $date';
  }

  @override
  String achievementsPoints(int points) {
    return '$points pts';
  }

  @override
  String get achievementsDailyQuests => 'Daily';

  @override
  String get achievementsWeeklyQuests => 'Weekly';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Reroll daily quests';

  @override
  String get achievementsRerollWeekly => 'Reroll weekly quests';

  @override
  String get achievementsRerollOffer => 'Swap this set for a different one';

  @override
  String get achievementsRerollSpentDaily =>
      'Used today, comes back at midnight UTC';

  @override
  String get achievementsRerollSpentWeekly =>
      'Used this week, comes back Monday UTC';

  @override
  String get achievementsRerollConfirm => 'Reroll these quests?';

  @override
  String get achievementsRerollConfirmBody =>
      'You get one daily and one weekly reroll, and this spends it.';

  @override
  String get achievementsRerollFailed => 'Could not reroll those quests.';

  @override
  String get achievementsSuggested => 'Suggested items to watch';

  @override
  String get achievementsNoSuggestions => 'Nothing to suggest for this badge.';

  @override
  String get achievementsProgressLabel => 'Progress';

  @override
  String get achievementsLoadout => 'Loadout';

  @override
  String get achievementsLoadoutSubtitle =>
      'Score to spend and the boosts you hold';

  @override
  String get achievementsAppearance => 'Appearance';

  @override
  String get achievementsAppearanceSubtitle =>
      'The avatar and title on your profile';

  @override
  String get achievementsAvatars => 'Avatars';

  @override
  String get achievementsTitles => 'Titles';

  @override
  String get achievementsEquipped => 'Equipped';

  @override
  String get achievementsOwned => 'Owned';

  @override
  String achievementsEarnedAt(int score) {
    return 'Earned at $score lifetime score';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'This server has no avatars or titles to wear.';

  @override
  String get achievementsAppearanceFailed =>
      'Could not change how the profile looks.';

  @override
  String get achievementsPowerUps => 'Power-ups';

  @override
  String get achievementsStats => 'Stats';

  @override
  String get achievementsStatsSubtitle =>
      'Your records and how the server is doing';

  @override
  String get achievementsStatsWatched => 'Watched';

  @override
  String get achievementsStatsBests => 'Bests';

  @override
  String get achievementsStatsHabits => 'Habits';

  @override
  String get achievementsStatsVariety => 'Variety';

  @override
  String get achievementsStatsServer => 'This server';

  @override
  String get achievementsStatsClock => 'When you watch';

  @override
  String get achievementsStatItems => 'Items watched';

  @override
  String get achievementsStatMovies => 'Films watched';

  @override
  String get achievementsStatSeries => 'Series finished';

  @override
  String get achievementsStatHours => 'Hours watched';

  @override
  String get achievementsStatDays => 'Days watched';

  @override
  String get achievementsStatRewatches => 'Rewatches';

  @override
  String get achievementsStatBestWatchStreak => 'Best watch streak';

  @override
  String get achievementsStatBestLoginStreak => 'Best login streak';

  @override
  String get achievementsStatMostEpisodes => 'Most episodes in a day';

  @override
  String get achievementsStatMostMovies => 'Most films in a day';

  @override
  String get achievementsStatLongestItem => 'Longest single item';

  @override
  String get achievementsStatBestCombo => 'Best combo';

  @override
  String get achievementsStatLateNight => 'Late night sessions';

  @override
  String get achievementsStatEarlyMorning => 'Early morning sessions';

  @override
  String get achievementsStatWeekend => 'Weekend sessions';

  @override
  String get achievementsStatDaysSignedIn => 'Days signed in';

  @override
  String get achievementsStatLibraries => 'Libraries visited';

  @override
  String get achievementsStatGenres => 'Genres watched';

  @override
  String get achievementsStatDecades => 'Decades watched';

  @override
  String get achievementsStatCountries => 'Countries watched';

  @override
  String get achievementsStatLanguages => 'Languages watched';

  @override
  String get achievementsStatUsers => 'Users';

  @override
  String get achievementsStatBadgesUnlocked => 'Badges unlocked';

  @override
  String get achievementsStatScoreEarned => 'Score earned';

  @override
  String get achievementsStatCommonBadge => 'Most common badge';

  @override
  String get achievementsActivity => 'Activity';

  @override
  String get achievementsActivitySubtitle =>
      'What the server has unlocked lately';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user unlocked $badge';
  }

  @override
  String get achievementsShop => 'Shop';

  @override
  String get achievementsShopSubtitle => 'Spend score on more boosts';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Nothing for sale right now.';

  @override
  String get achievementsBuyConfirm => 'Buy this?';

  @override
  String get achievementsBuyConfirmBody =>
      'It comes straight out of your score bank.';

  @override
  String get achievementsBuyFailed => 'Could not buy that.';

  @override
  String get achievementsScoreBank => 'Score bank';

  @override
  String get achievementsBoost => 'XP Boost';

  @override
  String get achievementsBoostBody =>
      'Doubles score for an hour. Using it again restarts the hour.';

  @override
  String get achievementsDoubleCredit => 'Double Credit';

  @override
  String get achievementsDoubleCreditBody =>
      'The next thing you finish counts twice towards badges.';

  @override
  String get achievementsStreakFreeze => 'Streak Freeze';

  @override
  String get achievementsStreakFreezeBody =>
      'Covers one missed day. Only one can be banked.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count held',
      one: '1 held',
      zero: 'None held',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'Running now';

  @override
  String get achievementsUsePowerUp => 'Use this power-up?';

  @override
  String get achievementsUsePowerUpBody =>
      'It\'s spent as soon as you confirm.';

  @override
  String get achievementsPowerUpFailed => 'Could not use that power-up.';

  @override
  String get achievementsHours => 'Hours';

  @override
  String get achievementsStreak => 'Streak';

  @override
  String get achievementsPeriodWeek => 'Week';

  @override
  String get achievementsPeriodMonth => 'Month';

  @override
  String get achievementsPeriodYear => 'Year';

  @override
  String achievementsDaysWatched(int count) {
    return '$count days watched';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '$count badges earned';
  }

  @override
  String get achievementsTopDirectors => 'Top directors';

  @override
  String get achievementsTopActors => 'Top actors';

  @override
  String get achievementsLoadFailed => 'Could not load your achievements.';

  @override
  String get friends => 'Friends';

  @override
  String get friendsSubtitle =>
      'See who\'s online and chat with people on this server';

  @override
  String get friendsShowButton => 'Show Friends Button';

  @override
  String get friendsShowButtonSubtitle =>
      'Friends and chat from the Achievement Badges plugin';

  @override
  String get friendsMessages => 'Messages';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count unread messages',
      one: '1 unread message',
      zero: 'No unread messages',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => 'Friend requests';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count waiting for you',
      one: '1 waiting for you',
      zero: 'Nothing waiting',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => 'Add friends';

  @override
  String get friendsAddSubtitle => 'Find people on this server';

  @override
  String get friendsPrivacy => 'Privacy';

  @override
  String get friendsPrivacySubtitle => 'What your friends can see';

  @override
  String get friendsOnline => 'Online';

  @override
  String get friendsOffline => 'Offline';

  @override
  String get friendsNone =>
      'No friends yet. Add people from this server to see them here.';

  @override
  String friendsWatching(String title) {
    return 'Watching $title';
  }

  @override
  String friendsLastWatched(String title) {
    return 'Last watched $title';
  }

  @override
  String friendsLastSeen(String time) {
    return 'Last seen $time';
  }

  @override
  String get friendsLoadFailed =>
      'Could not load this. Check your connection and try again.';

  @override
  String get friendsActionFailed => 'That didn\'t work. Try again in a moment.';

  @override
  String get friendsIncoming => 'Waiting for you';

  @override
  String get friendsOutgoing => 'Sent by you';

  @override
  String get friendsNoRequests => 'No friend requests.';

  @override
  String get friendsAccept => 'Accept';

  @override
  String get friendsDecline => 'Decline';

  @override
  String get friendsCancelRequest => 'Cancel request';

  @override
  String friendsRequestFrom(String name) {
    return '$name wants to be friends';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return 'Take back the request you sent to $name?';
  }

  @override
  String get friendsSearchHint => 'Search people';

  @override
  String get friendsNoMatches => 'No one matches that name.';

  @override
  String friendsRequestSent(String name) {
    return 'Request sent to $name';
  }

  @override
  String get friendsSendRequest => 'Add as friend';

  @override
  String get friendsSendMessage => 'Send message';

  @override
  String friendsOpenItem(String title) {
    return 'Open $title';
  }

  @override
  String get friendsRemove => 'Remove friend';

  @override
  String friendsRemoveBody(String name) {
    return 'Remove $name from your friends? You can add them again later.';
  }

  @override
  String get friendsBlock => 'Block';

  @override
  String get friendsUnblock => 'Unblock';

  @override
  String friendsBlockBody(String name) {
    return 'Block $name? Neither of you will be able to message the other directly. Group chats you share stay open.';
  }

  @override
  String friendsUnblockBody(String name) {
    return 'Unblock $name?';
  }

  @override
  String get friendsBlocked => 'Blocked users';

  @override
  String friendsProfileHidden(String name) {
    return '$name keeps their profile private.';
  }

  @override
  String get friendsAppearOffline => 'Appear Offline';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Friends always see you as offline';

  @override
  String get friendsHideNowPlaying => 'Hide What I\'m Watching';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Friends still see you online, but not what\'s playing';

  @override
  String get friendsHideLastWatched => 'Hide My Last Watched';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Friends won\'t see what you watched last while you\'re offline';

  @override
  String get friendsMessageNotifications => 'Message Notifications';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Show a banner when a friend messages you';

  @override
  String get friendsMuteDuringPlayback => 'Mute During Playback';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      'No message banners while a video or game is playing';

  @override
  String get friendsSaveFailed => 'Could not save your settings.';

  @override
  String get chatNew => 'New message';

  @override
  String get chatNewSubtitle => 'Start a chat with a friend';

  @override
  String get chatNewGroup => 'New group';

  @override
  String get chatNewGroupSubtitle => 'Chat with several friends at once';

  @override
  String get chatNone => 'No messages yet.';

  @override
  String get chatYou => 'You';

  @override
  String chatYouSaid(String text) {
    return 'You: $text';
  }

  @override
  String get chatPhoto => 'Photo';

  @override
  String get chatEmoji => 'Emoji';

  @override
  String get chatEmojiSearch => 'Search emoji';

  @override
  String get chatNoRecentEmoji => 'No recent emoji';

  @override
  String get chatViewPhoto => 'View photo';

  @override
  String get chatHint => 'Write a message';

  @override
  String get chatAttach => 'Send a photo';

  @override
  String get chatEdited => 'edited';

  @override
  String get chatSeen => 'Seen';

  @override
  String get chatSent => 'Sent';

  @override
  String get chatEditing => 'Editing message';

  @override
  String get chatMessageOptions => 'Message options';

  @override
  String get chatDeleteBody => 'Delete this message for everyone?';

  @override
  String get chatClear => 'Clear conversation';

  @override
  String get chatClearBody =>
      'Delete every message in this chat for everyone in it?';

  @override
  String get chatGroupInfo => 'Group info';

  @override
  String get chatGroupName => 'Group name';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => 'Owner';

  @override
  String get chatAdmin => 'Admin';

  @override
  String get chatMakeAdmin => 'Make admin';

  @override
  String get chatRemoveAdmin => 'Remove admin';

  @override
  String get chatRemoveMember => 'Remove from group';

  @override
  String get chatAddMember => 'Add people';

  @override
  String get chatNobodyToAdd => 'No one left to add.';

  @override
  String get chatLeave => 'Leave group';

  @override
  String get chatLeaveBody =>
      'Leave this group? Someone will have to add you back to rejoin.';

  @override
  String get chatCreate => 'Create group';

  @override
  String get chatPickMembers => 'Pick at least two friends';

  @override
  String chatNewMessageFrom(String name) {
    return 'New message from $name';
  }

  @override
  String get chatImageTooLarge => 'That image is over 8 MB.';

  @override
  String get chatImageUnsupported =>
      'Only PNG, JPEG, GIF and WebP images can be sent.';

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
  String get analyticsLibraryShare => 'Share of items by library';

  @override
  String get analyticsTopRating => 'Most common rating';

  @override
  String get analyticsTypicalRuntime => 'Typical runtime';

  @override
  String analyticsShareOfItems(String percent) {
    return '$percent% of items';
  }

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
  String get homeVideos => 'Домашни видеа';

  @override
  String get mixedContent => 'Мешана содржина';

  @override
  String get homeVideosAndPhotos => 'Домашни видеа и фотографии';

  @override
  String get mixedMoviesAndShows => 'Мешани филмови и серии';

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
  String get audiobookFocusedTimeline => 'Фокусирана временска линија';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

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
  String get replay => 'Пушти повторно';

  @override
  String get fileInformation => 'Информации за датотеката';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Големина: $size  •  Формат: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
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
  String transcodeAudioCodecWithCodec(String codec) {
    return 'Audio codec ($codec) is not supported directly.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'Tip: If your audio receiver or soundbar supports $codec, enable Audio Passthrough in Audio settings.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Audio channel count (${channels}ch) exceeds the player limit.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'Tip: Adjust \'Max Audio Channels\' or multichannel downmixing in Audio settings.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'ASS/SSA subtitles require transcoding because direct play is turned off.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'Tip: Enable \'ASS/SSA Direct Play\' in Playback settings to play directly without transcoding.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'PGS subtitles require transcoding because direct play is turned off.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'Tip: Enable \'PGS Direct Play\' in Playback settings to play directly without transcoding.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Subtitle format ($codec) is not supported directly and must be burned in.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'File bitrate ($fileBitrate) exceeds the configured streaming limit ($maxBitrate).';
  }

  @override
  String get transcodeBitrateHint =>
      'Tip: Increase \'Maximum Bitrate\' in Playback settings to allow direct streaming.';

  @override
  String get transcodeResolutionHint =>
      'Tip: Increase \'Maximum Resolution\' in Playback settings to allow direct streaming.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'Video dynamic range (e.g. Dolby Vision / HDR) is not supported by this display.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'Dolby Vision Profile 7 enhancement layer direct play is disabled.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'Tip: Enable \'Dolby Vision Profile 7 Direct Play\' in Playback settings if your display supports it.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'Transcoding is preferred for Dolby Vision fallback per user settings.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'Tip: Set \'Dolby Vision Fallback\' to \'Play as HDR10\' in Playback settings to avoid transcoding.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'Connected display does not report support for HDR or Dolby Vision.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'Connected display lacks HDR10 support needed for Dolby Vision fallback.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'Audio sample rate is not supported.';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'Audio bit depth is not supported.';

  @override
  String get transcodeRefFramesNotSupported =>
      'Video reference frames exceed player limits.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'Anamorphic video is not supported.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'Interlaced video is not supported.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'Secondary audio stream requires transcoding.';

  @override
  String get transcodeDirectPlayError =>
      'Direct play is not supported for this media format.';

  @override
  String get sortServerOrder => 'Server Order';

  @override
  String get sortAlphabetical => 'Азбучно';

  @override
  String get sortReleaseAscending => 'Редослед на издавање (растечки)';

  @override
  String get sortReleaseDescending => 'Редослед на издавање (опаѓачки)';

  @override
  String get sortCustomDragDrop => 'Прилагоден (со влечење)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

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

  @override
  String get addToWatchlist => 'Add to Watchlist';

  @override
  String get removeFromWatchlist => 'Remove from Watchlist';

  @override
  String get watchlistUpdateFailed => 'Couldn\'t update watchlist';

  @override
  String get adminSearchParameters => 'Search Parameters';

  @override
  String get adminCurrentMetadata => 'Current Metadata';

  @override
  String get adminLabelYear => 'Year';

  @override
  String get adminReplaceImages => 'Replace existing images';

  @override
  String get adminBackToSearch => 'Back to Search Criteria';

  @override
  String get grouping => 'Grouping';

  @override
  String get groupByType => 'Group by Type';

  @override
  String get playlistTypes => 'Playlist Types';

  @override
  String get playlistTypeVideo => 'Video';

  @override
  String get playlistTypeMusicVideo => 'Music Video';

  @override
  String get playlistTypeAudio => 'Audio (Music)';

  @override
  String get playlistTypeAudiobook => 'Audiobook';

  @override
  String get playlistTypeBook => 'Book';

  @override
  String get playlistTypePhoto => 'Photo';

  @override
  String get playlistTypeMixed => 'Mixed';

  @override
  String get videoPlaylistsSection => 'Video Playlists';

  @override
  String get musicVideoPlaylistsSection => 'Music Video Playlists';

  @override
  String get audioPlaylistsSection => 'Audio Playlists';

  @override
  String get audiobookPlaylistsSection => 'Audiobook Playlists';

  @override
  String get bookPlaylistsSection => 'Book Playlists';

  @override
  String get photoPlaylistsSection => 'Photo Playlists';

  @override
  String get mixedPlaylistsSection => 'Mixed Playlists';

  @override
  String get currentTime => 'Current Time';

  @override
  String get playbackTimeDisplay => 'Progress Bar Time';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Choose which time labels appear around the playback progress bar.';

  @override
  String get playbackTimeTotal => 'Total duration';

  @override
  String get playbackTimeRemaining => 'Time remaining';

  @override
  String get playbackTimeEndsAt => 'Ends at';

  @override
  String get playbackTimeElapsed => 'Time elapsed';

  @override
  String get playbackTimeVideoSection => 'Video Player';

  @override
  String get playbackTimeMusicSection => 'Music Player';

  @override
  String get playbackTimeSlotDescription =>
      'Choose what is shown here, or hide it.';

  @override
  String get playbackTimeAboveBarLeft => 'Above bar, left';

  @override
  String get playbackTimeAboveBarCenter => 'Above bar, center';

  @override
  String get playbackTimeAboveBarRight => 'Above bar, right';

  @override
  String get playbackTimeBelowBarLeft => 'Below bar, left';

  @override
  String get playbackTimeBelowBarCenter => 'Below bar, center';

  @override
  String get playbackTimeBelowBarRight => 'Below bar, right';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Choose what is shown on the right side of the music progress bar.';

  @override
  String get groupByTitle => 'Group By';

  @override
  String get groupByDecade => 'Decade (Year)';

  @override
  String get groupByParentalRating => 'Parental Rating';

  @override
  String get groupByStudio => 'Studio';

  @override
  String get showAlphabeticalFilters => 'Show Alphabet';

  @override
  String get libraryFolderView => 'Folder View';

  @override
  String get personalRatingStyle => 'Personal Rating Style';

  @override
  String get personalRatingThumbs => 'Like / dislike';

  @override
  String get personalRatingStars => '5 stars';

  @override
  String get personalRatingNumeric => 'Numeric score out of 10';

  @override
  String get rate => 'Rate';

  @override
  String get like => 'Like';

  @override
  String get dislike => 'Dislike';

  @override
  String get personalRatingClear => 'Clear rating';

  @override
  String get personalRatingRated => 'Rated';

  @override
  String get personalRatingMine => 'My Rating';

  @override
  String get personalRatingSaveFailed => 'Could not save rating';

  @override
  String get increase => 'Increase';

  @override
  String get decrease => 'Decrease';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'In Progress';

  @override
  String get filterUnreleased => 'Unreleased';

  @override
  String get filterTrailers => 'Trailers';

  @override
  String get filterExtras => 'Extras';

  @override
  String get filterThemeSongs => 'Theme Songs';

  @override
  String get filterThemeVideos => 'Theme Videos';

  @override
  String get source => 'Source';

  @override
  String get years => 'Years';

  @override
  String get audioLanguage => 'Audio Language';

  @override
  String get subtitleLanguage => 'Subtitle Language';

  @override
  String get clearFilters => 'Clear Filters';

  @override
  String get seerrShortcutsRow => 'Seerr Browse';

  @override
  String get seerrReleased => 'Released';

  @override
  String get seerrMinRating => 'Minimum Rating';

  @override
  String get seerrMinVotes => 'Minimum Votes';

  @override
  String get seerrOriginalLanguage => 'Original Language';

  @override
  String get seerrRuntime => 'Runtime';

  @override
  String get subtitleHdrSeparate => 'Separate HDR Style';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'White is much brighter in HDR than in SDR, so a dimmer style here avoids the glare';

  @override
  String get scrollSensitivity => 'Scroll Sensitivity';

  @override
  String get scrollSensitivitySubtitle =>
      'How far one mouse wheel notch scrolls';

  @override
  String get mediaDetailsAndSpoilers => 'Media Details and Spoilers';

  @override
  String get openTrailersExternally => 'Open Trailers in External App';

  @override
  String get openTrailersExternallySubtitle =>
      'Trailers open in the YouTube app or browser instead of the built-in player';

  @override
  String get hideDetailsMediaDescription => 'Hide Media Description';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Hide the movie or episode descriptive text.';

  @override
  String get detailUseSeriesThumbnails => 'Use Series Thumbnails';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Replace all thumbnails on Classic details page with series thumbnail';

  @override
  String get hideHomeMediaDescription => 'Hide Media Description';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Hide the movie or episode descriptive text.';

  @override
  String get hideHomeWatchProgress => 'Hide Watch Progress';

  @override
  String get hideHomeWatchProgressSubtitle =>
      'Hide the progress bar on posters you\'ve started watching.';

  @override
  String get hideHomeUnwatchedCount => 'Hide Unwatched Count';

  @override
  String get hideHomeUnwatchedCountSubtitle =>
      'Hide the badge showing how many episodes are left to watch.';

  @override
  String get continueWatchingAndNextUpHeader => 'Continue Watching and Next Up';

  @override
  String get setupSkip => 'Skip setup';

  @override
  String get setupNavbarQuestion => 'Where should navigation go?';

  @override
  String get setupMediaBarQuestion =>
      'How should the top of your Home screen look?';

  @override
  String get setupHomeRowsQuestion => 'How should your rows look?';

  @override
  String get setupDetailQuestion =>
      'How should a movie or show look when you open it?';

  @override
  String get setupTourQuestion => 'You\'re set. Here\'s what else is in here.';

  @override
  String get setupPlaybackLanguages => 'Playback languages';

  @override
  String get setupOptional => 'Optional';

  @override
  String get setupStyleClassic => 'Classic';

  @override
  String get setupStyleModern => 'Modern';

  @override
  String get setupRowsClassicHint => 'Compact. More rows on screen at once.';

  @override
  String get setupRowsModernHint => 'Larger cards with titles underneath.';

  @override
  String get setupDetailClassicHint => 'Everything centred in one stack.';

  @override
  String get setupDetailModernHint =>
      'Cinematic, with tabs for cast and extras.';

  @override
  String get setupStyleSpotlight => 'Spotlight';

  @override
  String get setupDetailSpotlightHint =>
      'Hero-first, with pop-up cards for cast and extras.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint =>
      'Full-screen, with sections stacked instead of tabs.';

  @override
  String get setupStyleMinimalist => 'Minimalist';

  @override
  String get setupDetailMinimalistHint =>
      'Artwork, one play button and the episodes.';

  @override
  String get setupNavbarStyleQuestion => 'How should the bottom bar look?';

  @override
  String get setupNavbarStyleDockHint =>
      'A floating pill with labels under every tab.';

  @override
  String get setupNavbarStyleSplitHint =>
      'Search gets its own button, and the bar shrinks while you scroll.';

  @override
  String get setupNavbarStyleStripHint =>
      'A full-width bar along the bottom edge.';

  @override
  String get setupPickALook => 'Pick a look';

  @override
  String get setupTourMoreHeader => 'There is more waiting in Settings';

  @override
  String get setupTourBulletRequests => 'Seerr requests';

  @override
  String get setupTourBulletSyncPlay => 'SyncPlay watch parties';

  @override
  String get setupTourBulletThemes => 'Custom themes';

  @override
  String get setupTourBulletDownloads => 'Offline downloads';

  @override
  String get setupTourBulletMore => 'And plenty more';

  @override
  String setupStepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get setupCurrent => 'Current';

  @override
  String get setupTvHint =>
      'Up and down to preview · OK to choose · Back twice to skip';

  @override
  String get setupNavbarTopHint => 'Tabs across the top of the screen.';

  @override
  String get setupNavbarLeftHint => 'A slim rail of icons down the left side.';

  @override
  String get setupNavbarBottomHint =>
      'Tabs along the bottom edge, in easy reach of your thumb.';

  @override
  String get setupMediaBarMoonfinHint =>
      'Large artwork with the title, details and overview laid over it.';

  @override
  String get setupMediaBarMakdHint => 'Large artwork led by a big title logo.';

  @override
  String get setupMediaBarBookshelfHint =>
      'Titles shelved as book spines, with the featured one face out.';

  @override
  String get setupMediaBarGalleryHint =>
      'The featured title opened up, with the next few lined up beside it.';

  @override
  String get setupMediaBarBannerHint =>
      'A shorter banner above your rows, so more of them fit on screen.';

  @override
  String get setupMediaBarAyaHint =>
      'Artwork first in a framed panel, with your rows right underneath.';

  @override
  String get setupMediaBarOffHint =>
      'No featured area. Home opens straight onto your rows.';

  @override
  String get runSetupAgain => 'Run setup again';

  @override
  String get serverMessages => 'Messages';

  @override
  String get serverMessagesEmpty => 'No messages from your server yet';

  @override
  String get serverMessagesMarkAllRead => 'Mark all as read';

  @override
  String get serverMessagesShowButton => 'Show Messages Button';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Adds a button to the menu for messages sent by your server admin';

  @override
  String get showBookDiscoverTab => 'Show Book Library Discovery';

  @override
  String get showBookDiscoverTabDescription =>
      'Browse titles from Open Library and LibriVox in your book and audiobook libraries';

  @override
  String get autoDownloadNewEpisodes => 'Auto-download new episodes';

  @override
  String get autoDownloadStop => 'Stop auto-download';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Downloads new episodes, up to $count unwatched at a time',
      one: 'Downloads new episodes, up to 1 unwatched at a time',
      zero: 'Downloads every new episode',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'On • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Transcoded qualities only download while Moonfin is open. Original quality also downloads in the background.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'Transcoded downloads can\'t resume after an interruption and start over from the beginning. Original quality can resume.';

  @override
  String get autoDownloadForegroundOnly =>
      'Downloads only while Moonfin is open';

  @override
  String get autoDownloadQualityTitle => 'Auto-download quality';

  @override
  String autoDownloadEnabledFor(String title) {
    return 'Auto-download enabled for $title';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return 'Auto-download stopped for $title';
  }

  @override
  String get smartDownloadsSection => 'Smart downloads';

  @override
  String get smartDownloadsEnable => 'Download Next Episodes';

  @override
  String get smartDownloadsEnableDescription =>
      'When you finish an episode on any device, Moonfin downloads the next ones. Episodes it downloads are deleted once watched.';

  @override
  String get smartDownloadsKeepReady => 'Episodes to Keep Downloaded';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Keeps the next $count episodes downloaded',
      one: 'Keeps the next episode downloaded',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered =>
      'Episodes already downloaded stay on your device. The new number applies to future downloads.';

  @override
  String get autoDownloadSection => 'Automatic downloads';

  @override
  String get autoDownloadEnable => 'Enable Automatic Downloads';

  @override
  String get autoDownloadEnableSubtitle =>
      'Downloads new episodes of the series you follow. Existing episodes can still be downloaded manually.';

  @override
  String get autoDownloadKeepUnwatched => 'Keep Unwatched Episodes';

  @override
  String get autoDownloadKeepAll => 'All';

  @override
  String get autoDownloadDelete => 'Delete Downloaded Episodes';

  @override
  String get autoDownloadDeleteFollowedSubtitle =>
      'When to remove episodes downloaded for series you follow, after you watch them';

  @override
  String get removeWatchedDownloads => 'Remove Watched Downloads';

  @override
  String get removeWatchedDownloadsSubtitle =>
      'When to remove episodes and movies you downloaded yourself. Only those you watch after turning this on are removed';

  @override
  String get keepDownloaded => 'Keep Downloaded';

  @override
  String get keepDownloadedSubtitle =>
      'Never remove this automatically after watching';

  @override
  String get autoDownloadDeleteNever => 'Never';

  @override
  String get autoDownloadDeleteImmediately => 'Right after watching';

  @override
  String get autoDownloadDeleteAfterDay => '1 day after watching';

  @override
  String get autoDownloadDeleteAfterWeek => '1 week after watching';

  @override
  String get autoDownloadBackgroundRefresh => 'Check in the Background';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Allow the system to check for new episodes periodically while Moonfin is closed';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Background App Refresh is disabled for Moonfin. Enable it in iOS Settings.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Background usage is restricted for Moonfin in Android Settings.';

  @override
  String get autoDownloadCheckNow => 'Check Now';

  @override
  String get autoDownloadChecking => 'Checking...';

  @override
  String get autoDownloadNeverChecked => 'Not checked yet';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued episodes queued',
      one: '1 episode queued',
      zero: 'nothing new',
    );
    return 'Last check $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Last check $when failed: $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Followed series';

  @override
  String get autoDownloadNoSubscriptions =>
      'Open a series and choose \"Auto-download new episodes\" from its download menu';

  @override
  String get autoDownloadRemove => 'Stop following';

  @override
  String get autoDownloadStorageFull => 'Not enough storage';

  @override
  String get autoDownloadWaitingForWifi => 'Waiting for WiFi';

  @override
  String get downloadNotificationRunning => 'Downloading';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'Downloading ($done/$total)';
  }

  @override
  String downloadNotificationProgress(String name, int percent) {
    return '$name — $percent%';
  }

  @override
  String downloadNotificationTransfer(
    String name,
    String progress,
    String timeRemaining,
  ) {
    return '$name — $progress · $timeRemaining';
  }

  @override
  String downloadNotificationStarting(String name) {
    return '$name...';
  }

  @override
  String downloadNotificationCompleteTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Downloads complete',
      one: 'Download complete',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name saved for offline';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items saved for offline',
      one: '1 item saved for offline',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'Download failed';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Remote message';

  @override
  String get serverMessagesNotificationReceived => 'Message received';

  @override
  String get downloadStorageLimitReached =>
      'Storage limit reached. Free up space or increase the limit.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Not enough storage: $needed needed, $free free';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Not enough storage for new episodes';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes are waiting for space.',
      one: '$name needs $size.',
    );
    return '$_temp0 Free up space or raise the download limit.';
  }

  @override
  String get pageTransitions => 'Page Transitions';

  @override
  String get pageTransitionsSubtitle =>
      'Adjusts fade time when navigating between pages';

  @override
  String get navigationSpeed => 'Navigation Speed';

  @override
  String get navigationSpeedSubtitle =>
      'Adjusts how quickly the focus indicator moves between items and rows';

  @override
  String get modernCardsTransitionSpeed => 'Modern Cards Transition Speed';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Adjusts animation speed when expanding focused modern cards';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Delay Card Expansion on Rapid Scroll';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Waits for focus movement to pause before expanding modern cards';

  @override
  String get animationSpeedExtraSlow => 'Extra Slow';

  @override
  String get animationSpeedSlow => 'Slow';

  @override
  String get animationSpeedMedium => 'Medium';

  @override
  String get animationSpeedFast => 'Fast';

  @override
  String get animationSpeedOff => 'Off';

  @override
  String get pageTransitionFadeNone => 'No Fade';

  @override
  String get pageTransitionFadeShort => 'Short Fade';

  @override
  String get pageTransitionFadeMedium => 'Medium Fade';

  @override
  String get pageTransitionFadeLong => 'Long Fade';

  @override
  String get siriRemoteSwipeSensitivity => 'Touchpad Swipe Sensitivity';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'How far focus moves for each swipe on the Siri Remote touchpad';

  @override
  String get appleTvHomeScreen => 'Apple TV home screen';

  @override
  String get topShelf => 'Top Shelf';

  @override
  String get topShelfDescription =>
      'What the Apple TV home screen shows above the Moonfin icon when it is selected. This setting stays on this device.';

  @override
  String get topShelfLatestMedia => 'Latest media';

  @override
  String get topShelfAppBanner => 'Moonfin banner';

  @override
  String get keepVideoClearOfDynamicIsland =>
      'Keep Video Clear of the Dynamic Island';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'In landscape the camera housing covers one edge of the screen. This holds the picture back from it, which only changes anything for video wide enough to reach that far.';

  @override
  String get bottomNavbarStyle => 'Bottom Bar Style';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Split';

  @override
  String get bottomNavbarStyleStrip => 'Strip';

  @override
  String get bottomNavbarTabs => 'Bottom Bar Tabs';

  @override
  String get bottomNavbarTabsDescription =>
      'Pin up to 3 tabs between Home and You. Everything else is in the bottom navbar hub.';

  @override
  String get bottomNavbarTabsAutomatic => 'Automatic';

  @override
  String get bottomNavbarTabsPinned => 'Pinned';

  @override
  String get bottomNavbarTabsAvailable => 'Available';

  @override
  String get bottomNavbarTabsReset => 'Reset to Automatic';

  @override
  String get bottomNavbarTabsLimit =>
      'You can pin up to 3 tabs. Remove one to pin another.';

  @override
  String get bottomNavbarTabTurnedOff => 'Turned off under Buttons';

  @override
  String get bottomNavbarSplitSearchNote =>
      'In the Split style, Search always has its own button.';

  @override
  String get bottomNavbarButtonsNote =>
      'These decide what shows in the bottom navbar hub and which tabs you can pin to the bottom bar. Tabs already on the bar aren\'t listed here.';

  @override
  String get navYou => 'You';

  @override
  String get cinemaSkipPrerolls => 'Cinema Mode Skip Button';

  @override
  String get cinemaSkipPrerollsDescription =>
      'Show a Skip button during Cinema Mode trailers, commercials, and other pre-rolls.';

  @override
  String get detailsPage => 'Details Page';

  @override
  String get storageAndDownloads => 'Storage & Downloads';

  @override
  String get integrations => 'Интеграции';

  @override
  String get settingsSync => 'Settings Sync';

  @override
  String get settingsSyncSubtitle =>
      'Moonbase plugin sync and customization profiles';

  @override
  String get navigationBar => 'Navigation Bar';

  @override
  String get homeRows => 'Rows';

  @override
  String get homeRowsSubtitle => 'Turn rows on or off and change their order';

  @override
  String get rowOptions => 'Row Options';

  @override
  String get rowOptionsSubtitle => 'Sorting and content for each row';

  @override
  String get imageTypePerRow => 'Image Type per Row';

  @override
  String get externalSources => 'External Sources';

  @override
  String get qualityAndDecoding => 'Quality & Decoding';

  @override
  String get qualityAndDecodingSubtitle =>
      'Bitrate, resolution, decoding, HDR, and Dolby Vision';

  @override
  String get skippingAndAutoplay => 'Skipping & Autoplay';

  @override
  String get advancedPlayback => 'Advanced Playback';

  @override
  String get advancedPlaybackSubtitle =>
      'Player routing, external players, and mpv';

  @override
  String get settingsAccountSubtitle =>
      'Sign-in, PIN code, Kids Mode, parental controls, and settings sync';

  @override
  String get settingsGeneralSubtitle =>
      'Language, clock, input, and performance';

  @override
  String get settingsAppearanceSubtitle =>
      'Navigation, home screen, libraries, details page, and themes';

  @override
  String get settingsHomeScreenSubtitle =>
      'Rows, media bar, looks, and external sources';

  @override
  String get settingsLibrariesEntrySubtitle =>
      'Library visibility, order, and library pages';

  @override
  String get settingsDetailsPageSubtitle =>
      'Layout, buttons, sections, ratings, and theme music';

  @override
  String get settingsPlaybackSubtitle =>
      'Player, quality, audio, subtitles, skipping, and SyncPlay';

  @override
  String get settingsStorageSubtitle =>
      'Downloads, storage location, and the image cache';

  @override
  String get settingsServicesSubtitle => 'Seerr and Achievement Badges';

  @override
  String get settingsSignInSection => 'Sign-in';

  @override
  String get settingsFamilySection => 'Family';

  @override
  String get settingsServersSection => 'Servers';

  @override
  String get settingsLanguageSection => 'Language';

  @override
  String get settingsInputSection => 'Input';

  @override
  String get settingsMotionSection => 'Motion';

  @override
  String get settingsContentsSection => 'Contents';

  @override
  String get settingsLooksSection => 'Looks';

  @override
  String get settingsAudioAndSubtitlesSection => 'Audio & Subtitles';

  @override
  String get settingsSkippingAndQueueSection => 'Skipping & Queue';

  @override
  String get settingsWatchTogetherSection => 'Watch Together';

  @override
  String get settingsAdvancedSection => 'Advanced';

  @override
  String get playerSettingsSubtitle =>
      'Controls, seeking, player buttons, and trick play';

  @override
  String get siloPasswordChangeTitle => 'Choose a new password';

  @override
  String get siloPasswordChangeMessage =>
      'This account has a temporary password. Choose a new one to finish signing in.';

  @override
  String get siloPasswordChangeNew => 'New password';

  @override
  String get siloPasswordChangeConfirm => 'Confirm new password';

  @override
  String get siloPasswordChangeSubmit => 'Change password';

  @override
  String siloPasswordChangeTooShort(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Use at least $count characters',
      one: 'Use at least 1 character',
    );
    return '$_temp0';
  }

  @override
  String get siloPasswordChangeTooLong => 'That password is too long';

  @override
  String get siloPasswordChangeMismatch => 'The passwords don\'t match';

  @override
  String get siloPasswordChangeSameAsTemporary =>
      'Choose a password different from the temporary one';

  @override
  String get siloPasswordChangeFailed =>
      'Couldn\'t change the password. Try again.';

  @override
  String get siloPasswordChangeUnavailable =>
      'This account has a temporary password, and this server doesn\'t allow changing it here. Change it in Silo\'s web app, then sign in again.';

  @override
  String get siloPasswordChangedSignInAgain =>
      'Your password was changed. Sign in with the new password.';

  @override
  String get siloServerRowSubtitle => 'From your server';

  @override
  String get playlistSortReleaseDate => 'Release Date';

  @override
  String get playlistSortCriticRating => 'Critic Rating';

  @override
  String get playlistSortRuntime => 'Runtime';

  @override
  String get playlistSortLastPlayed => 'Last Played';

  @override
  String get playlistSortPlayCount => 'Play Count';

  @override
  String get playlistSortRandom => 'Random';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count active',
      one: '1 active',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks => 'No tracks match the active filters';

  @override
  String get librarySortPlaylistOrder => 'Playlist Order';

  @override
  String get librarySortDateAdded => 'Date Added';

  @override
  String get librarySortDateEpisodeAdded => 'Date Episode Added';

  @override
  String get librarySortParentalRating => 'Parental Rating';

  @override
  String get librarySortMyRating => 'My Rating';

  @override
  String get librarySortAlbumArtist => 'Album Artist';

  @override
  String get librarySortAlbum => 'Album';

  @override
  String get librarySortArtist => 'Artist';

  @override
  String get librarySortTrackNumber => 'Track Number';

  @override
  String get librarySortGenre => 'Genre';

  @override
  String get librarySortFoldersFirst => 'Folders First';

  @override
  String get librarySortLength => 'Length';

  @override
  String get homeScreenBackdrop => 'Home Screen Backdrop';

  @override
  String get homeScreenBackdropFullScreen => 'Full Screen';

  @override
  String get homeScreenBackdropCorner => 'Corner';

  @override
  String get homeScreenBackdropTop => 'Top';

  @override
  String get detailsScreenBackdrop => 'Details Screen Backdrop';

  @override
  String get detailsBackdropSize => 'Backdrop Size';

  @override
  String get detailsBackdropFullScreen => 'Full Screen';

  @override
  String get detailsBackdropFit => 'Fit';

  @override
  String get libraryBackdrops => 'Library Backdrops';

  @override
  String get playbackInfoChannel => 'Channel';

  @override
  String get playbackInfoProgram => 'Program';

  @override
  String get playbackInfoWhy => 'Why';

  @override
  String get playbackInfoQualityLimit => 'Quality Limit';

  @override
  String get playbackInfoFrameRate => 'Frame Rate';

  @override
  String get playbackInfoDelivery => 'Delivery';

  @override
  String get playbackInfoFile => 'File';

  @override
  String get playbackInfoTechnical => 'Technical';

  @override
  String get playbackInfoDevice => 'Device';

  @override
  String get playbackInfoAudioRoute => 'Audio Route';

  @override
  String get playbackInfoSurround51 => '5.1 surround';

  @override
  String get playbackInfoSurround71 => '7.1 surround';

  @override
  String playbackInfoChannelCount(int count) {
    return '$count channels';
  }

  @override
  String get playbackInfoBurnedIn => 'Burned in by the server';

  @override
  String playbackInfoOriginal(String value, String original) {
    return '$value (original $original)';
  }

  @override
  String playbackInfoConvertedFrom(String value, String source) {
    return '$value (converted from $source)';
  }

  @override
  String playbackInfoResolutionConverted(
    String name,
    String size,
    String source,
  ) {
    return '$name ($size, converted from $source)';
  }

  @override
  String get playbackInfoNoteDirectPlay => 'Playing the original file as is.';

  @override
  String get playbackInfoNoteDirectStream =>
      'The server is repackaging the file without converting it.';

  @override
  String get playbackInfoNoteTranscodeVideo =>
      'The server is converting the video so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeAudio =>
      'The server is converting the audio so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeBoth =>
      'The server is converting the video and audio so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeUnknown =>
      'The server is converting this file so this device can play it.';

  @override
  String get playbackInfoNoteOffline => 'Playing a downloaded copy.';

  @override
  String get playbackInfoWhyForced => 'Transcoding is forced in settings';

  @override
  String get playbackInfoWhyBitrate =>
      'The bitrate is above the streaming limit';

  @override
  String get playbackInfoWhyContainer =>
      'This device can\'t play this file type';

  @override
  String get playbackInfoWhyVideo =>
      'This device can\'t play this video format';

  @override
  String get playbackInfoWhyHdr => 'This device can\'t display this HDR format';

  @override
  String get playbackInfoWhyAudio =>
      'This device can\'t play this audio format';

  @override
  String get playbackInfoWhySubtitles =>
      'Subtitles are being burned into the video';

  @override
  String get playbackInfoWhyOther => 'The file couldn\'t be played directly';

  @override
  String playbackInfoWhyBitrateLimit(String bitrate, String limit) {
    return '$bitrate is above the $limit streaming limit';
  }

  @override
  String playbackInfoWhyContainerName(String container) {
    return 'This device can\'t open $container files';
  }

  @override
  String playbackInfoWhyVideoCodec(String codec) {
    return 'This device can\'t play $codec video';
  }

  @override
  String playbackInfoWhyVideoProfile(String codec, String profile) {
    return 'This device can\'t play $codec $profile video';
  }

  @override
  String playbackInfoWhyVideoLevel(String codec, String level) {
    return 'This device can\'t play $codec level $level video';
  }

  @override
  String playbackInfoWhyVideoBitDepth(int bits) {
    return 'This device can\'t play $bits-bit video';
  }

  @override
  String playbackInfoWhyVideoResolution(String resolution) {
    return 'This device can\'t play $resolution video';
  }

  @override
  String playbackInfoWhyVideoFrameRate(String fps) {
    return 'This device can\'t play $fps fps video';
  }

  @override
  String get playbackInfoWhyInterlaced =>
      'This device can\'t play interlaced video';

  @override
  String get playbackInfoWhyAnamorphic =>
      'This device can\'t play anamorphic video';

  @override
  String playbackInfoWhyHdrName(String range) {
    return 'This device can\'t display $range';
  }

  @override
  String playbackInfoWhyAudioCodec(String format) {
    return 'This device can\'t play $format audio';
  }

  @override
  String playbackInfoWhyAudioProfile(String fullFormat) {
    return 'This device can\'t play $fullFormat';
  }

  @override
  String playbackInfoWhyAudioChannels(String channels) {
    return 'This device can\'t play $channels audio';
  }

  @override
  String playbackInfoWhyAudioSampleRate(String rate) {
    return 'This device can\'t play $rate kHz audio';
  }

  @override
  String playbackInfoWhyAudioBitDepth(int bits) {
    return 'This device can\'t play $bits-bit audio';
  }

  @override
  String get playbackInfoWhyAudioExternal =>
      'The audio track is in a separate file';

  @override
  String get playbackInfoWhySecondaryAudio =>
      'This device can only play the first audio track';

  @override
  String playbackInfoWhySubtitleFormat(String format) {
    return '$format subtitles are being burned into the video';
  }

  @override
  String get playbackInfoDroppedFrames => 'Dropped Frames';

  @override
  String get playFromServer => 'Play from Server';

  @override
  String get settingsApplePlayerUi => 'Video player';

  @override
  String get settingsApplePlayerUiDescription =>
      'The native Apple style player has no casting, audio delay or PiP button, and its rotation lock is only in Live TV';

  @override
  String get settingsApplePlayerUiStandard => 'Standard';

  @override
  String get settingsApplePlayerUiNative => 'Native Apple style';

  @override
  String get playerTransportPosition => 'Play buttons';

  @override
  String get playerTransportPositionDescription =>
      'Show play, skip and seek in the middle of the video or docked in the bottom bar';

  @override
  String get playerTransportOnScreen => 'On screen';

  @override
  String get playerTransportDocked => 'Docked';

  @override
  String get incompleteRecording => 'Incomplete';

  @override
  String incompleteRecordingMinutes(int recorded, int expected) {
    return '$recorded of $expected min';
  }

  @override
  String completeShowingScheduled(String dateTime) {
    return 'Complete showing scheduled $dateTime';
  }

  @override
  String completeCopyRecorded(String dateTime) {
    return 'Complete copy recorded $dateTime';
  }

  @override
  String get noCompleteShowingFound => 'No complete showing found';

  @override
  String get keepAsComplete => 'Keep as Complete';

  @override
  String get keptAsComplete => 'Marked as complete';

  @override
  String get unableToKeepAsComplete => 'Unable to mark as complete';

  @override
  String recordPromptTitle(String name) {
    return 'Record $name';
  }

  @override
  String recordPromptStarted(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'This showing started $minutes minutes ago, so the recording will miss the start.',
      one: 'This showing started 1 minute ago, so the recording will miss the start.',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptAlsoRecordLater =>
      'Also record the future showing to get a complete recording?';

  @override
  String get recordPromptSearchLater =>
      'Also record a future showing automatically once one is found, to get a complete recording?';

  @override
  String get recordPromptNow => 'Now';

  @override
  String get recordPromptLater => 'Future showing';

  @override
  String recordPromptAired(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min already aired',
      one: '1 min already aired',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptUncertainMatch =>
      'Matched by title and description only. Check it\'s the same program.';

  @override
  String get recordPromptDescriptionsDiffer =>
      'The descriptions differ, so this may be a different program.';

  @override
  String recordPromptSameEpisode(int season, int episode) {
    return 'Same episode (S${season}E$episode)';
  }

  @override
  String get recordPromptAlreadyScheduled => 'Already set to record';

  @override
  String get recordPromptTomorrow => 'Tomorrow';

  @override
  String get recordNowOnly => 'Record Now Only';

  @override
  String recordNowAnd(String when) {
    return 'Record Now and $when';
  }

  @override
  String get recordNowAndLater => 'Record Now and Future Showing';

  @override
  String recordOnlyLater(String when) {
    return 'Record $when Only';
  }

  @override
  String get recordLaterShowingOnly => 'Record Future Showing Only';

  @override
  String get laterShowingOnlyRequested =>
      'The future showing will be recorded.';

  @override
  String get unableToRequestLaterShowingOnly =>
      'Couldn\'t request the future showing, so nothing will be recorded.';

  @override
  String get laterShowingRequested =>
      'Recording started. A future showing will be recorded too.';

  @override
  String get unableToRequestLaterShowing =>
      'Recording started, but couldn\'t request a future showing.';

  @override
  String get siloCodeSignIn => 'Sign in with a code';

  @override
  String siloCodeSignInInstruction(String address) {
    return 'Scan the QR code with your phone, or go to $address on any signed-in device and enter this code:';
  }

  @override
  String get siloCodeSignInInstructionNoLink =>
      'Enter this code in Silo on a device where you\'re signed in:';

  @override
  String get siloCodeSignInOpened =>
      'Code found. Approve the sign-in on your other device.';

  @override
  String get siloCodeSignInDenied => 'This sign-in was declined.';

  @override
  String get siloCodeSignInNewCode => 'Get a new code';

  @override
  String get siloCodeSignInOff =>
      'Signing in with a code is turned off on this server.';

  @override
  String get siloCodeSignInPasswordChangeRequired =>
      'This account has a temporary password. Sign in with the password once to replace it.';

  @override
  String get siloApproveSignIn => 'Approve a sign-in';

  @override
  String get siloApproveSignInHint => 'Code shown on the other device';

  @override
  String get siloApproveSignInApprove => 'Approve';

  @override
  String get siloApproveSignInDone =>
      'Approved. The other device is signing in.';

  @override
  String get siloApproveSignInNoRequest =>
      'No sign-in is waiting with that code. Check it, or get a new code on the other device.';

  @override
  String get siloNativeOfferTitle => 'Connect to Silo directly?';

  @override
  String siloNativeOfferMessage(String serverName, String address) {
    return 'This address is the Jellyfin-compatible service of $serverName. Moonfin can connect to Silo directly at $address, with Silo\'s own features.';
  }

  @override
  String get siloNativeOfferUse => 'Use Silo';

  @override
  String get siloNativeOfferKeep => 'Keep Jellyfin';

  @override
  String get siloAppUpdateRequired =>
      'This Silo server needs a newer version of Moonfin. Update Moonfin to use it.';

  @override
  String get siloServerUpdateRequired =>
      'This Silo server is too old for this version of Moonfin. Update Silo to use it.';

  @override
  String get siloTooManyAttempts => 'Too many attempts. Try again later.';

  @override
  String siloTooManyAttemptsWait(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get siloServerBusy =>
      'The server is busy or still starting. Try again later.';

  @override
  String siloServerBusyWait(String wait) {
    return 'The server is busy or still starting. Try again in $wait.';
  }

  @override
  String siloWaitSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      one: '1 second',
    );
    return '$_temp0';
  }

  @override
  String siloWaitMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String get siloPlaybackUnavailable =>
      'Playback isn\'t available on this Silo server.';

  @override
  String get siloPlaybackUpdateRequired =>
      'This Silo server needs a newer version of Moonfin to play.';

  @override
  String get siloPlaybackEndedOnServer =>
      'Playback was ended on the Silo server.';

  @override
  String siloPinTitle(String name) {
    return 'PIN for $name';
  }

  @override
  String get siloPinHint => 'PIN';

  @override
  String get siloPinUnlock => 'Unlock';

  @override
  String get siloPinWrong => 'That PIN isn\'t right.';

  @override
  String get siloPinLocked => 'Too many wrong PINs. Try again later.';

  @override
  String siloPinLockedWait(String wait) {
    return 'Too many wrong PINs. Try again in $wait.';
  }

  @override
  String get siloPinFailed => 'The PIN couldn\'t be checked. Try again.';

  @override
  String get siloSignOutAccount => 'Sign out of the Silo account';

  @override
  String trailerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trailers',
      one: '1 trailer',
    );
    return '$_temp0';
  }

  @override
  String trailerNumber(int number) {
    return 'Trailer $number';
  }

  @override
  String get subtitled => 'Subtitled';

  @override
  String get rommAccount => 'RomM account';

  @override
  String get rommAccountIntro =>
      'Link your RomM account to play from your own RomM library and keep your saves in RomM.';

  @override
  String get rommLinkAccount => 'Link RomM account';

  @override
  String get rommLinkInstructions =>
      'Sign in to RomM and enter this code to link your account.';

  @override
  String rommLinkScanOrVisit(String url) {
    return 'Scan the QR code with your phone, or go to $url';
  }

  @override
  String get rommOpen => 'Open RomM';

  @override
  String get rommWaitingForApproval =>
      'Waiting for you to approve the code in RomM...';

  @override
  String rommLinkedAs(String username) {
    return 'Linked as $username';
  }

  @override
  String get rommLinked => 'Your RomM account is linked.';

  @override
  String get rommUnlinkNote =>
      'Unlinking stops Moonfin from using your RomM key. The key stays in RomM until you remove it from your API tokens there.';

  @override
  String get rommUnlink => 'Unlink';

  @override
  String get rommLinkExpired =>
      'The code expired before it was approved. Link again to get a new one.';

  @override
  String get rommLinkDenied => 'The link was turned down in RomM.';

  @override
  String get rommUnreachable =>
      'Moonfin couldn\'t reach RomM. Try again in a moment.';

  @override
  String get rommNotAvailable => 'This server has no RomM library.';

  @override
  String get rommAccountLoadFailed => 'Couldn\'t load your RomM account.';

  @override
  String get reviews => 'Reviews';

  @override
  String get detailSectionReviews => 'Reviews';

  @override
  String spotlightReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reviews',
      one: '1 review',
    );
    return '$_temp0';
  }

  @override
  String get readOnTmdb => 'Read on TMDB';

  @override
  String get addServerButtonSubtitle =>
      'By address, or with a Plex or Emby Connect account';

  @override
  String get addServerChooseHow => 'Choose how you\'d like to connect.';

  @override
  String get addServerAddressChoice =>
      'Jellyfin, Emby or Silo on your network or online';

  @override
  String get addServerPlexChoice => 'Use your Plex account to find its servers';

  @override
  String get addServerAddressHelp =>
      'The same address you\'d open in a browser, including the port.';

  @override
  String get addServerDetectNote =>
      'Works with Jellyfin, Emby and Silo. A Plex address opens the Plex sign-in.';

  @override
  String addServerChecking(String address) {
    return 'Checking $address';
  }

  @override
  String get addServerUnreachableDetail =>
      'Check the address and port, and that the server is running.';

  @override
  String get addServerFound => 'Server found';

  @override
  String get addServerFoundNote => 'Continue to choose who\'s signing in.';

  @override
  String get addServerUseDifferentAddress => 'Use a different address';

  @override
  String musicArtistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artists',
      one: '1 artist',
    );
    return '$_temp0';
  }

  @override
  String musicSongCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count songs',
      one: '1 song',
    );
    return '$_temp0';
  }

  @override
  String musicPlaylistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count playlists',
      one: '1 playlist',
    );
    return '$_temp0';
  }

  @override
  String musicPlayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plays',
      one: '1 play',
    );
    return '$_temp0';
  }

  @override
  String get allArtists => 'All Artists';

  @override
  String get libraryZToA => 'Z to A';

  @override
  String get musicSortYear => 'Year';

  @override
  String get musicFilter => 'Filter';

  @override
  String get musicGenreFilterTitle => 'Filter by Genre';

  @override
  String get openAlbum => 'Open Album';

  @override
  String get openPlaylist => 'Open Playlist';

  @override
  String get allSongsAToZ => 'All Songs A to Z';

  @override
  String get musicMix => 'Mix';

  @override
  String get musicMixEverything => 'Everything';

  @override
  String get musicMixEverythingSubtitle => '300 songs at random';

  @override
  String get mostPlayed => 'Most Played';

  @override
  String get musicMixMostPlayedSubtitle => 'Your top 100';

  @override
  String get musicMixFreshArrivals => 'Fresh Arrivals';

  @override
  String get musicMixFreshArrivalsSubtitle => 'The newest 100 songs';

  @override
  String get musicMixRediscover => 'Rediscover';

  @override
  String get musicMixRediscoverSubtitle =>
      'Favorites you haven\'t played lately';

  @override
  String get musicSortMostAlbums => 'Most Albums';

  @override
  String bookSeriesPosition(int index, int total) {
    return 'Book $index of $total';
  }

  @override
  String bookFavoriteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count favorites',
      one: '1 favorite',
    );
    return '$_temp0';
  }

  @override
  String get bookSortZToA => 'Z to A';

  @override
  String get bookSortMostTitles => 'Most Titles';

  @override
  String get bookSurpriseMe => 'Surprise Me';

  @override
  String get bookShuffleAudiobooks => 'Shuffle Audiobooks';

  @override
  String get bookStartReading => 'Start Reading';

  @override
  String get bookOtherBooks => 'Other Books';

  @override
  String get bookDiscoverSearchBooks => 'Search Open Library';

  @override
  String get bookDiscoverSearchAudiobooks => 'Search LibriVox';

  @override
  String get bookDiscoverFeatured => 'Featured';

  @override
  String get bookReaderControlsAutoHide => 'Controls hide automatically';

  @override
  String get bookReaderControlsStayVisible => 'Controls stay visible';

  @override
  String get settingsLivePreview => 'Live preview';

  @override
  String settingsPreviewShowsOn(String screen) {
    return 'Shows on the $screen preview';
  }

  @override
  String get settingsPreviewNotShown => 'Not shown in the preview';

  @override
  String get settingsPreviewSaved => 'Saved';
}
