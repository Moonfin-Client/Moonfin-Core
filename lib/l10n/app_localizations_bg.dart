// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

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
  String get interfaceLanguage => 'Език на интерфейса';

  @override
  String get systemLanguageDefault => 'Системен по подразбиране';

  @override
  String get signIn => 'Вход';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Празно';

  @override
  String connectingToServer(String serverName) {
    return 'Свързване към $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get waitingForAuthorization => 'Изчакване на разрешение...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Сървърът е недостъпен';

  @override
  String get loginFailed => 'Неуспешно влизане';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect не е наличен: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect не е наличен ($status): $detail';
  }

  @override
  String get whosWatching => 'Кой гледа?';

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
  String get addUser => 'Добавяне на потребител';

  @override
  String get selectServer => 'Изберете Сървър';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin версия $version';
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
  String get embyConnect => 'Emby Свържете се';

  @override
  String get removeServer => 'Премахване на сървъра';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Да се ​​премахне ли „$serverName“ от вашите сървъри?';
  }

  @override
  String get cancel => 'Отказ';

  @override
  String get remove => 'Премахване';

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
  String get detailScreenStyle => 'Стил на екрана с детайли';

  @override
  String get detailScreenStyleSubtitle =>
      'Класически е оригиналното центрирано оформление на Moonfin. Модерен е адаптивно кинематографично оформление.';

  @override
  String get detailScreenStyleMoonfin => 'Класически';

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
  String get expandedTabs => 'Разгънати раздели';

  @override
  String get expandedTabsSubtitle =>
      'Автоматично показване на съдържанието на разделите при разглеждане. Изключете, за да отваряте и затваряте всеки раздел ръчно.';

  @override
  String get showTechnicalDetails => 'Показване на технически детайли?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Показване на кодек, резолюция и информация за потока в обобщението на банера';

  @override
  String get recommendationSystem => 'Система за препоръки';

  @override
  String get recommendationSystemSubtitle =>
      'Използвайте алгоритъма Moonfin Recommends за локалната библиотека или онлайн показателите за сходство на TMDb. Забележка: онлайн препоръките изискват интеграция със Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Сходство по TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Прилагане на ограничение по родителска оценка?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Ограничаване на предложенията на Moonfin Recommends според родителската оценка на целевата медия';

  @override
  String get interfaceStyle => 'Стил на интерфейса';

  @override
  String get interfaceStyleSubtitle =>
      'Автоматично съответства на вашето устройство. Изберете Apple или Material, за да наложите определен облик.';

  @override
  String get interfaceStyleAutomatic => 'Автоматично';

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
  String get glassQuality => 'Качество на стъклото';

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
      'Автоматично избира най-добрия стъклен ефект за това устройство. Пълно налага истинско размиване; Намалено използва олекотено стъкло, което пести GPU ресурси.';

  @override
  String get glassQualityAuto => 'Автоматично';

  @override
  String get glassQualityFull => 'Пълно';

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
      'Превключвайте между Moonfin и Neon Pulse без рестартиране на приложението';

  @override
  String get customThemeTitle => 'Персонализирана тема';

  @override
  String get customThemeSubtitle =>
      'Персонализираните теми променят визуалните елементи в Moonfin. Изберете една от тези опции според вашия стил.';

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
      'Текущият Moonfin вид, който всички обичате';

  @override
  String get themeNeonPulse => 'Неонов импулс';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave стил с пурпурно сияние, циан текст и по-силен хромиран контраст';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Стил с течно стъкло, плавно движещ се градиентен фон, матирани повърхности и акцент в Apple синьо';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Ретро пиксел-арт стил с плътна палитра, блокови рамки, резки сенки и пикселен шрифт';

  @override
  String get embyConnectSignInSubtitle => 'Влезте с вашия акаунт Emby Connect';

  @override
  String get emailOrUsername => 'Имейл или потребителско име';

  @override
  String get selectAServer => 'Изберете сървър';

  @override
  String get tryAgain => 'Опитайте отново';

  @override
  String get noLinkedServers =>
      'Няма сървъри, свързани с този Emby Connect акаунт';

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
      'Мрежова грешка при свързване с Emby Свързване или избрания сървър';

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
    return 'Не може да се свърже с $target';
  }

  @override
  String get exitApp => 'Изход от Moonfin?';

  @override
  String get exitAppConfirmation => 'Сигурни ли сте, че искате да излезете?';

  @override
  String get exit => 'Изход';

  @override
  String get gameMenu => 'Меню';

  @override
  String get gamePaused => 'На пауза';

  @override
  String get gameSaveState => 'Запазване на състоянието';

  @override
  String get games => 'Игри';

  @override
  String get gameLoadState => 'Зареждане на състоянието';

  @override
  String get gameFastForward => 'Превъртане напред';

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
  String get gameEmulatorSettings => 'Настройки на емулатора';

  @override
  String get gameNoCoreOptions => 'Това ядро няма настройваеми опции.';

  @override
  String get gameHoldToOpenMenu => 'Задръжте за меню';

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
      'Възпроизвеждането на игри още не се поддържа на това устройство.';

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
  String get series => 'Сериали';

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
    return 'Неуспешно зареждане на папка: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Тази папка е празна';

  @override
  String itemCountLabel(int count) {
    return '$count елементи';
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
    return '$count Елементи';
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
    return '$name — Жанрове';
  }

  @override
  String get views => 'Изгледи';

  @override
  String get albums => 'Албуми';

  @override
  String get albumArtists => 'Изпълнители на албуми';

  @override
  String get artists => 'Изпълнители';

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
    return '$count преди мин';
  }

  @override
  String hoursAgo(int count) {
    return '$countпреди ч';
  }

  @override
  String daysAgo(int count) {
    return '$countпреди д';
  }

  @override
  String get discoverySubjects => 'Теми за откриване';

  @override
  String get apply => 'Прилагане';

  @override
  String get openLink => 'Отворете връзката';

  @override
  String get scanWithYourPhone => 'Сканирайте с телефона си';

  @override
  String get audiobookGenres => 'Жанрове аудиокниги';

  @override
  String get scrollLeft => 'Превъртете наляво';

  @override
  String get scrollRight => 'Превъртете надясно';

  @override
  String get scrollToTop => 'Scroll to top';

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
  String get resume => 'Продължи';

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
    return '$count автори';
  }

  @override
  String genresCount(int count) {
    return '$count жанрове';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% завършено';
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
    return '$count заглавия, подредени за сърфиране първо за четене.';
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
  String get noBookmarkedItems => 'Все още няма отбелязани елементи';

  @override
  String get nothingMatchesSection =>
      'Все още нищо не съответства на този раздел. Опитайте друг раздел или се върнете, след като синхронизирането на библиотеката приключи.';

  @override
  String get audiobooks => 'Аудиокниги';

  @override
  String noLabelFound(String label) {
    return 'Не е намерен $label';
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
  String get watched => 'Гледани';

  @override
  String get unread => 'Непрочетено';

  @override
  String get unwatched => 'Негледани';

  @override
  String get seriesStatus => 'Състояние на серията';

  @override
  String get allLibraries => 'Всички библиотеки';

  @override
  String get books => 'Книги';

  @override
  String get latestBooks => 'Последни книги';

  @override
  String get latestAudiobooks => 'Последни аудиокниги';

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
      one: '1 книга',
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
  String get noBooksFound => 'Няма намерени книги за този автор.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% прочетено';
  }

  @override
  String bookTimeLeft(String time) {
    return 'остават $time';
  }

  @override
  String get bookHeroRead => 'Четене';

  @override
  String get bookHeroListen => 'Слушане';

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
  String get librivoxPage => 'LibriVox Страница';

  @override
  String get internetArchive => 'Интернет архив';

  @override
  String get rssFeed => 'RSS емисия';

  @override
  String get downloadZip => 'Изтеглете Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count секции';
  }

  @override
  String firstPublished(int year) {
    return 'Първо публикувано $year';
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
    return '$count книги';
  }

  @override
  String get couldNotLoadSubject => 'Тази тема не можа да се зареди в момента.';

  @override
  String get audiobookDetails => 'Подробности за аудиокнигата';

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
      one: '1 аудиокнига',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Списък с песни';

  @override
  String get itemListPlaceholder => 'Тук ще се появи списък с артикули';

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
  String get musicVideos => 'Музикални видеоклипове';

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
    return 'Диск $number';
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
  String get unableToLoadAuthorDetails =>
      'В момента не могат да се заредят подробности за автора.';

  @override
  String published(int year) {
    return 'Публикувано $year';
  }

  @override
  String get publicationDateUnknown => 'Дата на публикуване неизвестна';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Сезона',
      one: '1 Сезон',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Завършва в $time';
  }

  @override
  String get items => 'Елементи';

  @override
  String get extras => 'Допълнения';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Зад кулисите';

  @override
  String get deletedScenes => 'Изтрити сцени';

  @override
  String get featurettes => 'Кратки материали';

  @override
  String get interviews => 'Интервюта';

  @override
  String get scenes => 'Сцени';

  @override
  String get shorts => 'Късометражни филми';

  @override
  String get trailers => 'Трейлъри';

  @override
  String timeRemaining(String time) {
    return 'остават $time';
  }

  @override
  String endsIn(String time) {
    return 'Завършва след $time';
  }

  @override
  String get view => 'Преглед';

  @override
  String get resumeReading => 'Възобновете четенето';

  @override
  String get read => 'Прочетете';

  @override
  String resumeFrom(String position) {
    return 'Възобновете от $position';
  }

  @override
  String get play => 'Пусни';

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
  String get cast => 'Предаване';

  @override
  String get castMembers => 'Cast';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Преименуване на плейлист';

  @override
  String get playlistName => 'Име на плейлиста';

  @override
  String get deleteDownloadedAlbum => 'Изтриване на изтегления албум';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Да се ​​изтрият ли изтеглените записи за „$title“?';
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
    return 'Не е зареден $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Изтегля се $title ($count елементи)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Сигурни ли сте, че искате да изтриете „$name“ от сървъра? Това действие не може да бъде отменено.';
  }

  @override
  String get itemDeleted => 'Елементът е изтрит';

  @override
  String get noPlayableTrailerFound =>
      'Няма намерен трейлър за възпроизвеждане.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Неподдържан формат на книгата: .$extension';
  }

  @override
  String get audioTrack => 'Аудио запис';

  @override
  String get subtitleTrack => 'Запис със субтитри';

  @override
  String get none => 'Без';

  @override
  String get downloadSubtitlesLabel => 'Изтегляне на субтитри...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Търсете с помощта на плъгина OpenSubtitles';

  @override
  String get downloadSubtitles => 'Изтегляне на субтитри';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'Избраният субтитър е невалиден.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Изтеглени и избрани субтитри: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтитрите са изтеглени. Може да отнеме известно време, докато се появи, докато Jellyfin опреснява елемента.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Няма намерени отдалечени субтитри за $language.';
  }

  @override
  String get selectVersion => 'Изберете Версия';

  @override
  String versionNumber(int number) {
    return 'Версия $number';
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
    return 'Изтегля се $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Изтриване на изтеглените файлове';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Изтриване на локални файлове за $typeLabel?\n\nТова ще освободи място за съхранение. Можете да изтеглите отново по-късно.';
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
  String get starring => 'STARRING';

  @override
  String get directors => 'РЕЖИСЬОРИ';

  @override
  String get writer => 'СЦЕНАРИСТ';

  @override
  String get writers => 'СЦЕНАРИСТИ';

  @override
  String get studio => 'СТУДИО';

  @override
  String studioMoreCount(int count) {
    return '+$count още';
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
    return 'Епизод $number';
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
      other: '$count песни',
      one: '1 песен',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count глави',
      one: '1 глава',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Роден $date';
  }

  @override
  String died(String date) {
    return 'Почина $date';
  }

  @override
  String age(int age) {
    return 'Възраст $age';
  }

  @override
  String get showLess => 'Покажи по-малко';

  @override
  String get readMore => 'Прочетете повече';

  @override
  String get shuffle => 'Разбъркай';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Разбъркване на цялата музика';

  @override
  String get carSignInPrompt => 'Влезте в Moonfin на телефона си';

  @override
  String get carServerUnreachable => 'Сървърът не е достъпен';

  @override
  String downloadsCount(int count) {
    return '$count изтегляния';
  }

  @override
  String get perfectMatch => 'Перфектно съвпадение';

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
    return 'Отдалечените субтитри $action изискват Jellyfin разрешение за управление на субтитри за този потребител.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Този елемент не може да бъде намерен на сървъра за отдалечени субтитри $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Отдалеченият субтитър $action не бе успешен: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Отдалечените субтитри $action са неуспешни (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Неуспешно $action отдалечени субтитри.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'всички изтеглени епизоди за „$name“';
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
    return 'Неуспешно действие $label: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Неуспешно задаване на звука на предаване: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Контроли';
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
    return 'Спри $label';
  }

  @override
  String get queueIsEmpty => 'Опашката е празна';

  @override
  String trackNumber(int number) {
    return 'Проследяване на $number';
  }

  @override
  String get remotePlayback => 'Дистанционно възпроизвеждане';

  @override
  String get castingToGoogleCast => 'Предаване към Google Cast';

  @override
  String get castingViaAirPlay => 'Предаването чрез AirPlay';

  @override
  String get castingViaDlna => 'Предаването чрез DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds секунди';
  }

  @override
  String get longPressToUnlock => 'Натиснете дълго за отключване';

  @override
  String get off => 'Изкл.';

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
  String get audioDelay => 'Закъснение на звука';

  @override
  String delayMinusMs(int value) {
    return '-$valueмс';
  }

  @override
  String delayPlusMs(int value) {
    return '+$valueмс';
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
  String get player => 'Плейър';

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
  String get track => 'Писта';

  @override
  String get channels => 'Канали';

  @override
  String get format => 'Форматиране';

  @override
  String get external => 'Външен';

  @override
  String get embedded => 'Вграден';

  @override
  String castSessionError(String protocol) {
    return '$protocol грешка в сесията';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Неуспешно зареждане на подробности за книгата: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Рендирането на EPUB в приложението все още не е налично на тази платформа.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Този формат (.$extension) все още не може да бъде изобразен в приложението.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Вграденото изобразяване на документи не е налично на тази платформа.';

  @override
  String get couldNotOpenExternalViewer =>
      'Не може да се отвори външен визуализатор.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Неуспешно отваряне на четеца в приложението: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Отметката вече е запазена в $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Добавена отметка: $label';
  }

  @override
  String get noBookmarksYet =>
      'Все още няма отметки.\nДокоснете иконата на отметка, докато четете, за да запазите позицията си.';

  @override
  String get noTableOfContentsAvailable => 'Няма налично съдържание';

  @override
  String pageLabel(int number) {
    return 'Страница $number';
  }

  @override
  String get position => 'Позиция';

  @override
  String get bookReader => 'Четец на книги';

  @override
  String formatExtension(String extension) {
    return 'Формат: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% прочетено';
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
    return 'Нулиране на мащаба (${zoom}x)';
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
    return 'Неуспешно актуализиране на състоянието на четене: $error';
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
    return 'Тази платформа не може да хоства вградената машина за документи за $extension файлове.';
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
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Ръководство Хронология';

  @override
  String failedToLoadGuide(String error) {
    return 'Неуспешно зареждане на ръководството: $error';
  }

  @override
  String get noChannelsFound => 'Няма намерени канали';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'НА ЖИВО';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Следва: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'остават $minutes мин';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'остават $hours ч';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'остават $hours ч $minutes мин';
  }

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
  String get record => 'Запис';

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
  String get cancelRecordingAction => 'Отказ от записване';

  @override
  String get programSetToRecord => 'Програмата е настроена за запис';

  @override
  String get recordingCancelled => 'Записването е отменено';

  @override
  String get unableToCreateRecording => 'Не може да се създаде запис';

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
  String get watch => 'Гледай';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Затвори';

  @override
  String failedToPlayChannel(String name) {
    return 'Неуспешно пускане на $name';
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
    return 'Да се ​​отмени ли планираният запис на „$name“?';
  }

  @override
  String get no => 'Не';

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
    return 'Спиране на записа на „$name“?';
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
    return 'Няма резултати за „$query“';
  }

  @override
  String searchFailedError(String error) {
    return 'Неуспешно търсене: $error';
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
    return 'Да се ​​премахнат ли „$name“ и неговите файлове?';
  }

  @override
  String tracksCount(int count) {
    return '$count песни';
  }

  @override
  String get album => 'Албум';

  @override
  String get playAlbum => 'Възпроизвеждане на албум';

  @override
  String failedToLoadAlbum(String error) {
    return 'Неуспешно зареждане на албума: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Няма намерени изтеглени записи за $name.';
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
    return 'Премахване на „$name“?';
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
    return 'Епизод $number';
  }

  @override
  String get seriesNotFound => 'Серията не е намерена';

  @override
  String get errorLoadingSeries => 'Грешка при зареждането на серията';

  @override
  String get downloadedEpisodes => 'Изтеглени епизоди';

  @override
  String seasonNumber(int number) {
    return 'Сезон $number';
  }

  @override
  String seasonChip(int number) {
    return 'С$number';
  }

  @override
  String get specials => 'Специални';

  @override
  String get deleteSeason => 'Изтриване на сезон';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Да се ​​изтрият ли всички изтеглени епизоди в $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count епизода',
      one: '1 епизод',
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
    return 'Да се ​​изтрият ли $count изтеглените елементи?';
  }

  @override
  String get musicAndAudiobooks => 'Музика и аудиокниги';

  @override
  String get images => 'Изображения';

  @override
  String get database => 'База данни';

  @override
  String ofStorageLimit(String limit) {
    return 'от $limit лимит';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get settingsSearchHint => 'Search settings';

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
  String get pluginAndRequests => 'Плъгин и заявки';

  @override
  String get customizeAccountPlaybackInterface =>
      'Персонализирайте поведението на акаунта, възпроизвеждането и интерфейса';

  @override
  String optionsCount(int count) {
    return '$count опции';
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
  String get mixedRowsOnly => 'Mixed rows only';

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
  String get snow => 'сняг';

  @override
  String get fireworks => 'Фойерверки';

  @override
  String get confetti => 'Конфети';

  @override
  String get fallingLeaves => 'Падащи листа';

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
  String get loopThemeMusic => 'Повтаряне на тематичната музика';

  @override
  String get loopThemeMusicSubtitle =>
      'Повтаряне на записа вместо еднократно възпроизвеждане';

  @override
  String get detailsBackgroundBlur => 'Замъгляване на фона на детайлите';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

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
  String get settingsScrollWheelAction => 'Колелце на мишката';

  @override
  String get settingsScrollWheelActionDescription =>
      'Изберете какво прави превъртането с колелцето на мишката върху видеото по време на възпроизвеждане.';

  @override
  String get scrollWheelActionOff => 'Изкл.';

  @override
  String get scrollWheelActionSeek => 'Превъртане (напред / назад)';

  @override
  String get scrollWheelActionVolume => 'Сила на звука';

  @override
  String get playerTooltipVolume => 'Сила на звука';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Автоматично изрязване';

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
  String get stretch => 'Разтягане';

  @override
  String get refreshRateSwitching => 'Превключване на скоростта на опресняване';

  @override
  String get disabled => 'Изключено';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

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
  String get showDescriptionOnPause => 'Показване на описание на пауза';

  @override
  String get dimVideoShowOverview =>
      'Затъмняване на видеото и показване на общ текст, докато е на пауза';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'Бутон за заключване на OSD';

  @override
  String get osdLockButtonDescription =>
      'Показване на бутон за заключване, който блокира въвеждането чрез докосване до дълго натискане';

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
  String get audioBehavior => 'Аудио поведение';

  @override
  String get downmixToStereo => 'Смесване към стерео';

  @override
  String get defaultAudioLanguage => 'Аудио език по подразбиране';

  @override
  String get fallbackAudioLanguage => 'Резервен език на звука';

  @override
  String get preferDefaultAudioTrack =>
      'Предпочитане на аудиозаписа по подразбиране';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Предпочитайте оригиналния аудиозапис пред локализирания дублаж.';

  @override
  String get preferAudioDescription => 'Предпочитане на записи с аудиоописание';

  @override
  String get preferAudioDescriptionDescription =>
      'Предпочитайте записите с аудиоописание пред обикновените.';

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
  String get settingsAudioFallbackCodec => 'Аудио резервен кодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Изберете целевия формат за прекодиране на многоканален звук, когато изходният поток не може да се възпроизведе директно или да премине без обработка.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Автоматично разпознаване\n(Препоръчително)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(По подразбиране)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Само стерео)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Ефективен)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Без загуби)';

  @override
  String get settingsMaxAudioChannels => 'Максимален брой аудиоканали';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Задайте максималния брой канали на вашата аудиосистема. Многоканалните потоци над този лимит ще бъдат смесени или прекодирани.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Автоматично разпознаване\n(Хардуер по подразбиране)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Моно';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Стерео';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Съраунд';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Квадрофоничен';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Съраунд';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Съраунд';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Съраунд';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Съраунд';

  @override
  String get settingsAudioPassthroughAdvanced => 'Преминаване (разширено)';

  @override
  String get settingsAudioCodecPassthrough => 'Кодек Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Активирайте само формати, поддържани от вашия AVR или HDMI приемник.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 преминаване';

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
  String get settingsDetectedAudioCapabilities => 'Открити аудио възможности';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Все още няма налична моментна снимка на възможностите за изпълнение.';

  @override
  String get settingsAudioRouteLabel => 'Маршрут';

  @override
  String get settingsAudioDecodeLabel => 'Декодирай';

  @override
  String get settingsAudioPassthroughLabel => 'Преминаване';

  @override
  String get settingsAudioHdRoute => 'HD аудио маршрут';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Говорител';

  @override
  String get settingsAudioRouteHeadphones => 'Слушалки';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get nightMode => 'Нощен режим';

  @override
  String get compressDynamicRange => 'Компресирайте динамичния диапазон';

  @override
  String get advancedMpv => 'Разширени mpv';

  @override
  String get enableCustomMpvConf => 'Активиране на потребителски mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Приложете указан от потребителя mpv.conf преди да започне възпроизвеждането';

  @override
  String get unsafeAdvancedMpvOptions => 'Небезопасни разширени mpv опции';

  @override
  String get unsafeMpvOptionsDescription =>
      'Позволете по-широк набор от mpv опции. Може да наруши поведението при възпроизвеждане.';

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
    return '$valueс';
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
    return 'След $episodes епизоди / ${hours}h';
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
  String get customMpvConfPath => 'Персонализиран mpv.conf път';

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
  String get defaultToNoSubtitles => 'По подразбиране няма субтитри';

  @override
  String get turnOffSubtitlesByDefault =>
      'Изключете субтитрите по подразбиране';

  @override
  String get subtitleSize => 'Размер на субтитрите';

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
  String get subtitleMode => 'Режим на субтитрите';

  @override
  String get subtitleModeFlagged => 'Маркирани';

  @override
  String get subtitleModeAlways => 'Винаги';

  @override
  String get subtitleModeForeign => 'Чуждоезични';

  @override
  String get subtitleModeForced => 'Принудителни';

  @override
  String get subtitleModeFlaggedDescription =>
      'Възпроизвежда записите, маркирани в метаданните на медийния файл като „по подразбиране“ или „принудителни“.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Автоматично зарежда и показва субтитри при всяко пускане на видео.';

  @override
  String get subtitleModeForeignDescription =>
      'Автоматично включва субтитрите, ако аудиозаписът по подразбиране е на чужд език.';

  @override
  String get subtitleModeForcedDescription =>
      'Зарежда само субтитрите, изрично маркирани с флага „принудителни“ в метаданните.';

  @override
  String get subtitleModeNoneDescription =>
      'Напълно изключва автоматичното зареждане на субтитри.';

  @override
  String get fallbackSubtitleLanguage => 'Резервен език на субтитрите';

  @override
  String get subtitleStream => 'Поток на субтитрите';

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
  String get global => 'Глобален';

  @override
  String get desktop => 'Работен плот';

  @override
  String get mobile => 'Мобилен';

  @override
  String get tv => 'телевизор';

  @override
  String loadedProfileSettings(String profile) {
    return 'Заредени са настройките на $profile профил.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Неуспешно зареждане на настройките на профила $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Синхронизирани локални настройки към $profile профил.';
  }

  @override
  String get syncing => 'Синхронизиране...';

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
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Показване на изтеглянията на сървъра';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Позволете на администратора на сървъра да вижда вашите прекодирани изтегляния в таблото за управление';

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
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar =>
      'Показване на библиотеки в лентата с инструменти';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'Винаги разгънати надписи в навигацията';

  @override
  String get showSeerrButton => 'Показване на бутона Seerr';

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
  String get groupItemsIntoCollections => 'Групиране на елементите в колекции';

  @override
  String get hideCollectionAssociatedItems =>
      'Скриване на елементите, свързани с колекция, при разглеждане на библиотеките';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Бележка за групирането на библиотеката';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'За да използвате тази настройка, уверете се, че настройките на библиотеката „Групиране на филмите в колекции“ и/или „Групиране на сериалите в колекции“ са включени в настройките за показване на вашата библиотека на вашия Jellyfin или Emby сървър.';

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
  String get sourceLibraries => 'Библиотеки с източници';

  @override
  String get sourceCollections => 'Изходни колекции';

  @override
  String get excludedGenres => 'Изключени жанрове';

  @override
  String get selectAll => 'Изберете Всички';

  @override
  String itemsSelected(int count) {
    return '$count избрано';
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
  String get mediaBarMode => 'Стил на медийната лента';

  @override
  String get mediaBarModeDescription =>
      'Изберете между различни стилове на медийната лента или я изключете';

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
  String get mediaBarModeOff => 'Изкл.';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Активиране на медийната лента';

  @override
  String get showFeaturedContentSlideshow =>
      'Показване на слайдшоу с представено съдържание на началната страница';

  @override
  String get contentType => 'Тип съдържание';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

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
  String get trailerAudio => 'Звук на трейлърите';

  @override
  String get enableTrailerAudio =>
      'Включване на звука за трейлърите в медийната лента';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

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
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Най-новите медии';

  @override
  String get recentlyReleased => 'Наскоро пуснат';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

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
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Възстановяване на настройките по подразбиране';

  @override
  String get homeRowPosterSize => 'Размер на постера на началния ред';

  @override
  String get configureImageTypeForEachRow =>
      'Конфигурирайте типа на изображението за всеки активиран начален ред';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Обединете Продължете да гледате и Следващия';

  @override
  String get combineBothRows => 'Комбинирайте двата реда в една начална секция';

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
  String get fullScreenRows => 'Разгънати начални редове';

  @override
  String get fullScreenRowsDescription =>
      'Ограничаване до 1 начален ред на екран';

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
  String get perRowSettings => 'Настройки за всеки ред';

  @override
  String get autoLogin => 'Автоматично влизане';

  @override
  String get lastUser => 'Последен потребител';

  @override
  String get currentUser => 'Текущ потребител';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
    return '$minutes мин';
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
  String get displayClockDuringScreensaver =>
      'Показване на часовник по време на скрийнсейвър';

  @override
  String get clockModeStatic => 'Статичен';

  @override
  String get clockModeBouncing => 'Подскачащ';

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
  String get trakt => 'Trakt';

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
  String get pluginDetected => 'Добавката е открита';

  @override
  String get pluginNotDetected => 'Приставката не е открита';

  @override
  String get pluginNotDetectedDescription =>
      'Сървърният плъгин в момента не е открит. Локалните настройки все още използват своите запазени стойности или вградени настройки по подразбиране.';

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
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Редове за откриване в Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

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
  String get seerrNotificationsSection => 'Известия';

  @override
  String get seerrNotifyNewRequestsTitle => 'Известия за нови заявки';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Известие, когато някой подаде заявка';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Актуализации на заявките';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Одобрени, отхвърлени и добавени в библиотеката ви';

  @override
  String get seerrNotifyIssuesTitle => 'Актуализации на проблемите';

  @override
  String get seerrNotifyIssuesSubtitle => 'Нови проблеми, отговори и решения';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Влезли сте като: $username';
  }

  @override
  String get discoverRows => 'Страница за откриване в Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Включете редовете, които да виждате на началната страница на Seerr. Плъзнете, за да пренаредите. Персонализираният ред се синхронизира с Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Включете редовете, които да виждате на началната страница на Seerr. Плъзнете, за да пренаредите. Персонализираният ред се синхронизира с Moonbase.';

  @override
  String get enabled => 'Включено';

  @override
  String get hidden => 'Скрити';

  @override
  String get aboutTitle => 'За';

  @override
  String versionValue(String version) {
    return 'Версия $version';
  }

  @override
  String get openSourceLicenses => 'Лицензи за отворен код';

  @override
  String get sourceCode => 'Изходен код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'Налична актуализация: v$version';
  }

  @override
  String get updateNotifications => 'Известия за актуализиране';

  @override
  String get showWhenUpdatesAvailable => 'Покажи кога са налични актуализации';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Наличен';
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
  String get featuredContentAppearance => 'Представено съдържание, външен вид';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Лимит на кеша за изображения';

  @override
  String get clearImageCache => 'Изчистване на кеша за изображения';

  @override
  String get imageCacheCleared => 'Кешът за изображения е изчистен';

  @override
  String get clear => 'Изчисти';

  @override
  String get browse => 'Прегледайте';

  @override
  String get noResults => 'Няма резултати';

  @override
  String get seerrAvailableStatus => 'Наличен';

  @override
  String get seerrRequestedStatus => 'Поискано';

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
    return 'Изтегляне · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Импортиране';

  @override
  String itemsCount(int count) {
    return '$count Елементи';
  }

  @override
  String get seerrSettings => 'Настройки на Seerr';

  @override
  String get requestMore => 'Поискайте повече';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Заявка';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Отказ от заявка';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Играйте в Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Поискано от $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

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
    return 'Анулиране на заявка за „$title“?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Анулиране на $count заявки за „$title“?';
  }

  @override
  String get keep => 'Запазете';

  @override
  String get itemNotFoundInLibrary =>
      'Елементът не е намерен във вашата Moonfin библиотека';

  @override
  String get errorSearchingLibrary => 'Грешка при търсене на библиотека';

  @override
  String budgetAmount(String amount) {
    return 'Бюджет: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Приходи: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Заявка $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Изпратете заявка';

  @override
  String get allSeasons => 'Всички сезони';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

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
  String get appearances => 'Участия';

  @override
  String get crewSection => 'Екипаж';

  @override
  String ageValue(int age) {
    return 'възраст $age';
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
  String get failedStatus => 'Неуспешно';

  @override
  String get processingStatus => 'Обработва се';

  @override
  String modifiedByName(String name) {
    return 'Променено от $name';
  }

  @override
  String get completedStatus => 'Завършено';

  @override
  String get requestErrorDuplicate => 'Това заглавие вече е заявено';

  @override
  String get requestErrorQuota => 'Достигнат е лимитът на заявките';

  @override
  String get requestErrorBlocklisted => 'Това заглавие е в списъка с блокирани';

  @override
  String get requestErrorNoSeasons => 'Няма останали сезони за заявяване';

  @override
  String get requestErrorPermission =>
      'Нямате разрешение да направите тази заявка';

  @override
  String get seerrRequestsTitle => 'Заявки';

  @override
  String get seerrIssuesTitle => 'Проблеми';

  @override
  String get sortNewest => 'Най-нови';

  @override
  String get sortLastModified => 'Последно променени';

  @override
  String get noIssues => 'Няма проблеми';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Остават $remaining от $limit заявки за филми';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Остават $remaining от $limit заявки за сезони';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Част от $name';
  }

  @override
  String get viewCollection => 'Преглед на колекцията';

  @override
  String get requestCollection => 'Заявяване на колекцията';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total филма · $available налични';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Заявяване на $count филма';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Заявяване на $current от $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Заявени са $count филма';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Заявени са $ok от $total филма';
  }

  @override
  String get collectionAllRequested =>
      'Всички филми вече са налични или заявени';

  @override
  String get reportIssue => 'Докладване на проблем';

  @override
  String get issueTypeVideo => 'Видео';

  @override
  String get issueTypeAudio => 'Звук';

  @override
  String get whatsWrong => 'Какъв е проблемът?';

  @override
  String get allEpisodes => 'Всички епизоди';

  @override
  String get episode => 'Епизод';

  @override
  String get openStatus => 'Отворен';

  @override
  String get resolvedStatus => 'Решен';

  @override
  String get resolveAction => 'Разрешаване';

  @override
  String get reopenAction => 'Отваряне отново';

  @override
  String reportedByName(String name) {
    return 'Докладвано от $name';
  }

  @override
  String commentsCount(int count) {
    return '$count коментара';
  }

  @override
  String get addComment => 'Добавете коментар';

  @override
  String get deleteIssueConfirm => 'Изтриване на този проблем?';

  @override
  String get submitReport => 'Изпращане на доклада';

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
  String get add => 'Добавяне';

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
  String get general => 'Общи';

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
  String get next => 'Следващ';

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
  String get stop => 'Спри';

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
  String get adminDrawerLibraries => 'Библиотеки';

  @override
  String get adminDrawerDisplay => 'Показване';

  @override
  String get adminDrawerMetadata => 'Метаданни';

  @override
  String get adminDrawerNfo => 'NFO настройки';

  @override
  String get adminDrawerTranscoding => 'Транскодиране';

  @override
  String get adminDrawerResume => 'Продължаване';

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
    return 'Налични актуализации на добавки: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Приставки, изискващи рестартиране: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Неуспешни планирани задачи: $count';
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
  String get adminLibraryScanStarted => 'Сканирането на библиотеката започна';

  @override
  String errorGeneric(String error) {
    return 'Грешка: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Извършва се рестартиране на сървъра';

  @override
  String get adminServerRebootMessage =>
      'Извършва се рестартиране на сървъра, моля, рестартирайте Moonfin';

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
    return 'Неуспешна команда: $error';
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
  String get sessionNext => 'Следващ';

  @override
  String get sessionVolumeDown => 'том –';

  @override
  String get sessionVolumeUp => 'Звук +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Сега се играе';

  @override
  String get volume => 'Сила на звука';

  @override
  String get actions => 'Действия';

  @override
  String get videoCodec => 'Видео кодек';

  @override
  String get audioCodec => 'Аудио кодек';

  @override
  String get hwAccel => 'Хард. ускорение';

  @override
  String get completion => 'Завършване';

  @override
  String get adminClearDates => 'Ясни дати';

  @override
  String get adminActivitySeverityAll => 'Всички нива';

  @override
  String get adminActivityDateRange => 'Период';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Неуспешно зареждане на регистъра на активността: $error';
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
    return 'Неуспешно актуализиране на устройството: $error';
  }

  @override
  String get adminDeleteDevice => 'Изтриване на устройство';

  @override
  String get adminDeviceDeleted => 'Устройството е изтрито';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Неуспешно изтриване на устройство: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Да се премахне ли устройството „$name“? Потребителят ще трябва да влезе отново на това устройство.';
  }

  @override
  String get adminDeleteAllDevices => 'Изтриване на всички устройства';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Да се премахнат ли $count устройства? Засегнатите потребители ще трябва да влязат отново. Текущото ви устройство не е засегнато.';
  }

  @override
  String get adminDevicesDeletedAll => 'Устройствата са премахнати';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Някои устройства бяха премахнати; $count не можаха да бъдат премахнати.';
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
    return 'Неуспешно стартиране на сканирането: $error';
  }

  @override
  String get adminRenameLibrary => 'Преименуване на библиотека';

  @override
  String get adminNewName => 'Ново име';

  @override
  String adminLibraryRenamed(String name) {
    return 'Библиотеката е преименувана на „$name“';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Неуспешно преименуване: $error';
  }

  @override
  String get adminDeleteLibrary => 'Изтриване на библиотека';

  @override
  String adminLibraryDeleted(String name) {
    return 'Библиотеката „$name“ е изтрита';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Неуспешно изтриване на библиотека: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Неуспешно добавяне на път: $error';
  }

  @override
  String get adminRemovePath => 'Премахване на пътя';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Да се ​​премахне ли „$path“ от тази библиотека?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Неуспешно премахване на пътя: $error';
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
  String get adminPreferredMetadataLanguage => 'Предпочитан език за метаданни';

  @override
  String get adminMetadataLanguageHint => 'напр. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Код на държавата с метаданни';

  @override
  String get adminMetadataCountryHint => 'напр. САЩ, Германия, Франция';

  @override
  String get adminLibraryTabPaths => 'Пътища';

  @override
  String get adminLibraryTabOptions => 'Опции';

  @override
  String get adminLibraryTabDownloaders => 'Модули за изтегляне';

  @override
  String get adminLibMetadataSavers => 'Модули за запис на метаданни';

  @override
  String get adminLibSubtitleDownloaders => 'Модули за изтегляне на субтитри';

  @override
  String get adminLibLyricDownloaders => 'Модули за изтегляне на текстове';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Модули за изтегляне на метаданни: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Модули за изображения: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Този сървър не предоставя модули за изтегляне за този тип библиотека.';

  @override
  String get adminLibrarySectionGeneral => 'Общи';

  @override
  String get adminLibrarySectionMetadata => 'Метаданни';

  @override
  String get adminLibrarySectionEmbedded => 'Вградена информация';

  @override
  String get adminLibrarySectionSubtitles => 'Субтитри';

  @override
  String get adminLibrarySectionImages => 'Изображения';

  @override
  String get adminLibrarySectionSeries => 'Сериали';

  @override
  String get adminLibrarySectionMusic => 'Музика';

  @override
  String get adminLibrarySectionMovies => 'Филми';

  @override
  String get adminLibRealtimeMonitor => 'Наблюдение в реално време';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Откриване на промени във файловете и автоматичната им обработка.';

  @override
  String get adminLibEnablePhotos => 'Показване на снимки';

  @override
  String get adminLibSaveLocalMetadata =>
      'Запазване на обложките в медийните папки';

  @override
  String get adminLibRefreshInterval => 'Автоматично обновяване на метаданните';

  @override
  String get adminLibRefreshNever => 'Никога';

  @override
  String get adminLibDefault => 'По подразбиране';

  @override
  String get adminLibDisplayTitle => 'Показване';

  @override
  String get adminLibDisplaySection => 'Показване на библиотеката';

  @override
  String get adminLibFolderView =>
      'Показване на изглед с папки за обикновените медийни папки';

  @override
  String get adminLibSpecialsInSeasons =>
      'Показване на специалните епизоди в сезоните, в които са излъчени';

  @override
  String get adminLibGroupMovies => 'Групиране на филмите в колекции';

  @override
  String get adminLibGroupShows => 'Групиране на сериалите в колекции';

  @override
  String get adminLibExternalSuggestions =>
      'Показване на външно съдържание в предложенията';

  @override
  String get adminLibDateAddedSection => 'Поведение на датата на добавяне';

  @override
  String get adminLibDateAddedLabel => 'Използване на дата на добавяне от';

  @override
  String get adminLibDateAddedImport => 'Датата на сканиране в библиотеката';

  @override
  String get adminLibDateAddedFile => 'Датата на създаване на файла';

  @override
  String get adminLibMetadataTitle => 'Метаданни и изображения';

  @override
  String get adminLibMetadataLangSection => 'Предпочитан език на метаданните';

  @override
  String get adminLibChaptersSection => 'Глави';

  @override
  String get adminLibDummyChapterDuration =>
      'Продължителност на фиктивните глави (секунди)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Дължина на главите, генерирани за медия, която няма такива. Задайте 0, за да изключите.';

  @override
  String get adminLibChapterImageResolution =>
      'Резолюция на изображенията за главите';

  @override
  String get adminLibNfoTitle => 'NFO настройки';

  @override
  String get adminLibNfoHelp =>
      'NFO метаданните са съвместими с Kodi и подобни клиенти. Настройките важат за всички библиотеки, които записват NFO метаданни.';

  @override
  String get adminLibKodiUser =>
      'Потребител, за когото да се записват данните за гледане в NFO файловете';

  @override
  String get adminLibSaveImagePaths =>
      'Запазване на пътищата към изображенията в NFO файловете';

  @override
  String get adminLibPathSubstitution =>
      'Заместване на пътищата за изображенията в NFO файловете';

  @override
  String get adminLibExtraThumbs =>
      'Копиране на extrafanart изображенията в папка extrathumbs';

  @override
  String get adminLibNone => 'Няма';

  @override
  String adminLibRefreshDays(int days) {
    return '$days дни';
  }

  @override
  String get adminLibEmbeddedTitles => 'Използване на вградените заглавия';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Използване на вградените заглавия за допълненията';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Използване на вградената информация за епизодите';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Разрешаване на вградените субтитри';

  @override
  String get adminLibEmbeddedAllowAll => 'Всички';

  @override
  String get adminLibEmbeddedAllowText => 'Само текст';

  @override
  String get adminLibEmbeddedAllowImage => 'Само изображения';

  @override
  String get adminLibEmbeddedAllowNone => 'Няма';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Пропускане на изтеглянето, ако има вградени субтитри';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Пропускане на изтеглянето, ако аудиозаписът съвпада с езика за изтегляне';

  @override
  String get adminLibRequirePerfectMatch =>
      'Изискване на пълно съвпадение на субтитрите';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Запазване на субтитрите в медийните папки';

  @override
  String get adminLibChapterImageExtraction =>
      'Извличане на изображения за главите';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Извличане на изображенията за главите по време на сканирането на библиотеката';

  @override
  String get adminLibTrickplayExtraction =>
      'Извличане на Trickplay изображения';

  @override
  String get adminLibTrickplayDuringScan =>
      'Извличане на Trickplay изображенията по време на сканирането на библиотеката';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Запазване на Trickplay изображенията в медийните папки';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Автоматично обединяване на сериалите, разпределени в няколко папки';

  @override
  String get adminLibSeasonZeroName => 'Име на нулевия сезон';

  @override
  String get adminLibLufsScan => 'LUFS сканиране за нормализиране на звука';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Предпочитане на нестандартния таг за изпълнител';

  @override
  String get adminLibAutoAddToCollection =>
      'Автоматично добавяне на филмите към колекции';

  @override
  String get adminLibraryNameRequired => 'Името на библиотеката е задължително';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Неуспешно създаване на библиотека: $error';
  }

  @override
  String get adminLibraryName => 'Име на библиотеката';

  @override
  String get adminSelectedPaths => 'Избрани пътища:';

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
    return 'Да се ​​деактивира ли $name? Те няма да могат да влязат.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Активиране на $name? Те ще могат да влязат отново.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Потребителят „$name“ е деактивиран';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Потребителят „$name“ е активиран';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Неуспешно актуализиране на потребителските правила: $error';
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
    return 'Неуспешно създаване на потребител: $error';
  }

  @override
  String get adminCreateUser => 'Създаване на потребител';

  @override
  String get adminPasswordOptional => 'Парола (по избор)';

  @override
  String get adminUsernameRequired =>
      'Потребителското име не може да бъде празно';

  @override
  String adminSaveFailed(String error) {
    return 'Неуспешно запазване: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Паролите не съвпадат';

  @override
  String adminFailed(String error) {
    return 'Неуспешно: $error';
  }

  @override
  String get adminUserLoadFailed => 'Неуспешно зареждане на потребителя';

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
  String get adminEnableAllLibraryAccess =>
      'Разрешете достъп до всички библиотеки';

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
  String get adminEnableAllDevices => 'Разрешете достъп до всички устройства';

  @override
  String get adminEnableAllChannels => 'Разрешете достъпа до всички канали';

  @override
  String get adminParentalControl => 'Родителски контрол';

  @override
  String get adminMaxParentalRating => 'Максимална разрешена родителска оценка';

  @override
  String get adminMaxParentalRatingHint =>
      'Съдържанието с по-висока оценка ще бъде скрито от този потребител.';

  @override
  String get adminParentalRatingNone => 'Няма';

  @override
  String get adminBlockUnratedItems =>
      'Блокиране на елементите без или с неразпозната информация за оценка';

  @override
  String get adminUnratedBook => 'Книги';

  @override
  String get adminUnratedChannelContent => 'Канали';

  @override
  String get adminUnratedLiveTvChannel => 'Телевизия на живо';

  @override
  String get adminUnratedMovie => 'Филми';

  @override
  String get adminUnratedMusic => 'Музика';

  @override
  String get adminUnratedTrailer => 'Трейлъри';

  @override
  String get adminUnratedSeries => 'Сериали';

  @override
  String get adminAccessSchedules => 'Графици за достъп';

  @override
  String get adminAccessSchedulesHint =>
      'Разрешаване на достъп само в посочените по-долу часове. Когато не е зададен график, достъпът е разрешен през целия ден.';

  @override
  String get adminAddSchedule => 'Добавяне на график';

  @override
  String get adminScheduleDay => 'Ден';

  @override
  String get adminScheduleStart => 'Начало';

  @override
  String get adminScheduleEnd => 'Край';

  @override
  String get adminDayEveryday => 'Всеки ден';

  @override
  String get adminDayWeekday => 'Делничен ден';

  @override
  String get adminDayWeekend => 'Уикенд';

  @override
  String get adminDaySunday => 'Неделя';

  @override
  String get adminDayMonday => 'Понеделник';

  @override
  String get adminDayTuesday => 'Вторник';

  @override
  String get adminDayWednesday => 'Сряда';

  @override
  String get adminDayThursday => 'Четвъртък';

  @override
  String get adminDayFriday => 'Петък';

  @override
  String get adminDaySaturday => 'Събота';

  @override
  String get adminAllowedTags => 'Разрешени тагове';

  @override
  String get adminAllowedTagsHint =>
      'Показва се само съдържание с тези тагове. Оставете празно, за да разрешите всички.';

  @override
  String get adminBlockedTags => 'Блокирани тагове';

  @override
  String get adminBlockedTagsHint =>
      'Съдържанието с тези тагове е скрито от този потребител.';

  @override
  String get adminAddTag => 'Добавяне на таг';

  @override
  String get adminAuthProvider => 'Доставчик на удостоверяване';

  @override
  String get adminPasswordResetProvider => 'Доставчик за нулиране на паролата';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Максимален брой неуспешни опити за вход преди заключване';

  @override
  String get adminLoginAttemptsHint =>
      'Задайте 0 за стойността по подразбиране или -1, за да изключите заключването.';

  @override
  String get adminSyncPlayAccess => 'Достъп до SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Разрешаване на създаване и присъединяване към групи';

  @override
  String get adminSyncPlayJoin => 'Разрешаване на присъединяване към групи';

  @override
  String get adminSyncPlayNone => 'Без достъп';

  @override
  String get adminContentDeletionFolders =>
      'Разрешаване на изтриване на съдържание от';

  @override
  String get adminResetPasswordWarning =>
      'Това ще премахне паролата. Потребителят ще може да влезе без парола.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Сървърът върна HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Сигурни ли сте, че искате да изтриете $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Потребителят „$name“ е изтрит';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Неуспешно изтриване на потребител: $error';
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
    return 'Неуспешно създаване на ключ: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Ключов токен липсва в отговора на сървъра';

  @override
  String get adminRevokeApiKey => 'Отмяна на API ключ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Отмяна на ключа за $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API ключът е отменен';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Неуспешно отмяна на ключа: $error';
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
    return 'Токен: $token\\nСъздаден: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Създаване на резервно копие';

  @override
  String get adminBackupDatabase => 'База данни';

  @override
  String get adminBackupDatabaseAlways => 'Винаги включена';

  @override
  String get adminBackupMetadata => 'Метаданни';

  @override
  String get adminBackupSubtitles => 'Субтитри';

  @override
  String get adminBackupTrickplay => 'Trickplay изображения';

  @override
  String get adminCreatingBackup => 'Създава се резервно копие...';

  @override
  String get adminBackupCreated => 'Архивирането е създадено успешно';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Неуспешно създаване на резервно копие: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'В отговора на сървъра липсва резервен път';

  @override
  String adminBackupManifest(String name) {
    return 'Манифест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Неуспешно зареждане на манифеста: $error';
  }

  @override
  String get adminConfirmRestore => 'Потвърдете Възстановяване';

  @override
  String get adminRestoringBackup => 'Възстановява се резервно копие...';

  @override
  String adminRestoreFailed(String error) {
    return 'Неуспешно възстановяване на архива: $error';
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
    return 'Запазено в $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Неуспешно запазване на файла: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Неуспешно зареждане на $fileName';
  }

  @override
  String get adminSearchInLog => 'Търсене в дневник';

  @override
  String get adminNoMatchingLines => 'Няма съответстващи редове';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Неуспешно зареждане на задачите: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Няма намерени планирани задачи';

  @override
  String get adminNoTasksMatchFilter =>
      'Няма задачи, които отговарят на текущия филтър';

  @override
  String adminTaskStartFailed(String error) {
    return 'Неуспешно стартиране на задача: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Неуспешно спиране на задачата: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Неуспешно зареждане на задача: $error';
  }

  @override
  String get adminRunNow => 'Бягай сега';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Неуспешно премахване на тригера: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Неуспешно добавяне на тригер: $error';
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
  String get adminNoLimit => 'Без ограничение';

  @override
  String adminHours(String hours) {
    return '$hours час(ове)';
  }

  @override
  String get adminDayOfWeek => 'Ден от седмицата';

  @override
  String get adminSearchPlugins => 'Търсене на добавки...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Неуспешно превключване на приставката: $error';
  }

  @override
  String get adminUninstallPlugin => 'Деинсталирайте приставката';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Сигурни ли сте, че искате да деинсталирате „$name“?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Неуспешно деинсталиране на приставката: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Неуспешно инсталиране на пакет: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Неуспешно инсталиране на актуализация: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Неуспешно зареждане на добавки: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Няма плъгини, отговарящи на вашето търсене';

  @override
  String get adminNoPluginsInstalled => 'Няма инсталирани добавки';

  @override
  String adminInstallUpdate(String version) {
    return 'Инсталиране на актуализация (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Неуспешно зареждане на каталога: $error';
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
    return '„$name“ ще бъде премахнат след рестартиране на сървъра';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Неуспешно деинсталиране: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Актуализиране на „$name“ до v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Неуспешно зареждане на приставката: $error';
  }

  @override
  String get adminPluginNotFound => 'Приставката не е намерена';

  @override
  String adminPluginVersion(String version) {
    return 'Версия $version';
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
    return 'Сигурни ли сте, че искате да премахнете „$name“?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Неуспешно запазване на хранилища: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Неуспешно зареждане на хранилища: $error';
  }

  @override
  String get adminRepositoryNameHint => 'напр. Jellyfin Стабилен';

  @override
  String get adminRepositoryUrl => 'URL адрес на хранилището';

  @override
  String get adminAddEntry => 'Добавете запис';

  @override
  String get adminInvalidUrl => 'Невалиден URL адрес';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Не могат да се заредят настройките на приставката: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Не може да се отвори $uri';
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
  String get adminPlaybackLoadFailed =>
      'Неуспешно зареждане на настройките за възпроизвеждане';

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
  String get adminTrickplayLoadFailed =>
      'Неуспешно зареждане на настройките за Trickplay';

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
  String get adminBaseUrlHint => 'напр. /jellyfin';

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
  String adminMetadataLoadFailed(String error) {
    return 'Неуспешно зареждане на метаданните: $error';
  }

  @override
  String get adminRefreshMetadata => 'Обновяване на метаданните';

  @override
  String get recursive => 'Рекурсивен';

  @override
  String get adminReplaceAllMetadata => 'Замяна на всички метаданни';

  @override
  String get adminMetadataRefreshRequested =>
      'Поискано е опресняване на метаданни';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Неуспешно опресняване на метаданните: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Няма открити отдалечени съвпадения';

  @override
  String get adminRemoteResults => 'Дистанционни резултати';

  @override
  String get adminRemoteMetadataApplied => 'Приложени са отдалечени метаданни';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Неуспешно отдалечено търсене: $error';
  }

  @override
  String get adminUpdateContentType => 'Актуализиране на типа съдържание';

  @override
  String get adminContentType => 'Тип съдържание';

  @override
  String get adminContentTypeUpdated => 'Актуализиран тип съдържание';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Неуспешно актуализиране на типа съдържание: $error';
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
    return '$imageType изображението е актуализирано';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Неуспешно изтегляне на изображение: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Неподдържан формат на изображението';

  @override
  String get adminImageReadFailed =>
      'Неуспешно четене на избраното изображение';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType изображението е качено';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Неуспешно качване на изображение: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Изтриване на $imageType изображение';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType изображението е изтрито';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Неуспешно изтриване на изображение: $error';
  }

  @override
  String get adminAllProviders => 'Всички доставчици';

  @override
  String get adminNoRemoteImages => 'Няма намерени отдалечени изображения';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Неуспешно откриване на тунер: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U тунер';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Файл или URL';

  @override
  String get adminTunerIpAddress => 'IP адрес на тунера';

  @override
  String get adminTunerFriendlyName => 'Показвано име';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Лимит на едновременните връзки';

  @override
  String get adminTunerCountHelp =>
      'Максималният брой потоци, които тунерът позволява едновременно. Задайте 0 за неограничено.';

  @override
  String get adminTunerFallbackBitrate =>
      'Резервен максимален битрейт за стрийминг';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Импортиране само на любимите канали';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Разрешаване на хардуерно прекодиране';

  @override
  String get adminTunerAllowFmp4 =>
      'Разрешаване на fMP4 контейнер за прекодиране';

  @override
  String get adminTunerAllowStreamSharing =>
      'Разрешаване на споделяне на потока';

  @override
  String get adminTunerEnableStreamLooping =>
      'Включване на зацикляне на потока';

  @override
  String get adminTunerIgnoreDts => 'Игнориране на DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Четене на входа с оригиналната честота на кадрите';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Файл или URL';

  @override
  String get adminXmltvMoviePrefix => 'Префикс за филми';

  @override
  String get adminXmltvMovieCategories => 'Категории за филми';

  @override
  String get adminXmltvCategoriesHelp =>
      'Разделяйте няколко категории с вертикална черта.';

  @override
  String get adminXmltvKidsCategories => 'Категории за деца';

  @override
  String get adminXmltvNewsCategories => 'Категории за новини';

  @override
  String get adminXmltvSportsCategories => 'Категории за спорт';

  @override
  String get adminSdUsername => 'Потребителско име';

  @override
  String get adminSdPassword => 'Парола';

  @override
  String get adminSdCountry => 'Държава';

  @override
  String get adminSdCountrySelect => 'Изберете държава';

  @override
  String get adminSdPostalCode => 'Пощенски код';

  @override
  String get adminEnableAllTuners => 'Включване на всички тунери';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Неуспешно премахване на тунера: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Неуспешно премахване на доставчик: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Път за запис на серия';

  @override
  String get adminMovieRecordingPath => 'Път за записите на филми';

  @override
  String get adminGuideDaysAuto => 'Автоматично';

  @override
  String get adminRecordingPostProcessor =>
      'Път до приложението за последваща обработка';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Аргументи за последващата обработка';

  @override
  String get adminSaveRecordingNfo => 'Запазване на NFO метаданни за записите';

  @override
  String get adminSaveRecordingImages => 'Запазване на изображения за записите';

  @override
  String get adminLiveTvSectionPaths => 'Пътища за записите';

  @override
  String get adminLiveTvSectionPostProcessing => 'Последваща обработка';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Неуспешно запазване на настройките: $error';
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
  String get adminGuideRefreshStarted =>
      'Обновяването на данните за програмата започна';

  @override
  String get adminGuideRefreshUnavailable =>
      'Задачата за обновяване на програмата не е налична на този сървър.';

  @override
  String get adminNoListingProviders =>
      'Няма конфигурирани доставчици на обяви';

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
    return 'Да се ​​възстанови ли резервното копие $name сега?';
  }

  @override
  String get adminBackupsTitle => 'Архивиране';

  @override
  String get adminUnknownDate => 'Неизвестна дата';

  @override
  String get adminUnnamedBackup => 'Резервно копие без име';

  @override
  String get adminApply => 'Прилагане';

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
    return '$minutes преди мин';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hoursпреди ч';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$daysпреди д';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Неуспешно зареждане на $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count съвпадения';
  }

  @override
  String get adminLogViewerNoMatches => 'Няма съответстващи редове';

  @override
  String get adminMetadataEditorTitle => 'Редактор на метаданни';

  @override
  String get adminMetadataIdentify => 'Идентифициране';

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
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Слоган';

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
  String get adminMetadataProvider => 'Доставчик';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType изображението е актуализирано';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType изображението е качено';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType изображението е изтрито';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Неуспешно изтегляне на изображение: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Неуспешно четене на избраното изображение';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Неуспешно качване на изображение: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Изтриване на $imageType изображение';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Това премахва текущото изображение от елемента.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Неуспешно изтриване на изображение: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Изберете $imageType изображение';
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
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Няма плъгини, отговарящи на вашето търсене';

  @override
  String get adminPluginsNoneInstalled => 'Няма инсталирани добавки';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Налична актуализация: v$version';
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
    return 'Инсталиране на актуализация (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Няма пакети, отговарящи на вашето търсене';

  @override
  String get adminPluginsCatalogEmpty => 'Няма налични пакети';

  @override
  String adminPluginsInstalling(String name) {
    return '„$name“ се инсталира...';
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
    return '$name Настройки';
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
    return 'Неуспешно зареждане на хранилища: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Премахване на хранилище';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Сигурни ли сте, че искате да премахнете „$name“?';
  }

  @override
  String get adminReposRemove => 'Премахване';

  @override
  String adminReposSaveFailed(String error) {
    return 'Неуспешно запазване на хранилища: $error';
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
  String get adminReposNameHint => 'напр. Jellyfin Стабилен';

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
  String get adminNetworkingEnableHttps => 'Активирайте HTTPS';

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
  String get adminBrandingSplashUpload => 'Качване на изображение';

  @override
  String get adminBrandingSplashUploaded => 'Началният екран е обновен';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Неуспешно качване на началния екран';

  @override
  String get adminBrandingSplashDeleted => 'Началният екран е премахнат';

  @override
  String get adminBrandingNoSplash => 'Няма персонализиран начален екран';

  @override
  String get adminPlaybackHwAccel => 'Хардуерно ускорение';

  @override
  String get adminPlaybackHwAccelLabel => 'Хардуерно ускорение';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Активирайте хардуерното кодиране';

  @override
  String get adminPlaybackQsvDevice => 'QSV устройство';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Включване на подобрения NVDEC декодер';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Предпочитане на системния хардуерен декодер';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-битово HEVC декодиране';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-битово VP9 декодиране';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-битово декодиране';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12-битово декодиране';

  @override
  String get adminPlaybackHwEncodingSection => 'Хардуерно кодиране';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Разрешаване на HEVC кодиране';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Разрешаване на AV1 кодиране';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Включване на Intel нискоенергийния H.264 кодер';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Включване на Intel нискоенергийния HEVC кодер';

  @override
  String get adminPlaybackToneMapping => 'Тонално преобразуване';

  @override
  String get adminPlaybackEnableTonemapping =>
      'Включване на тонално преобразуване';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Включване на VPP тонално преобразуване';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Включване на VideoToolbox тонално преобразуване';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Алгоритъм за тонално преобразуване';

  @override
  String get adminPlaybackTonemappingMode => 'Режим на тонално преобразуване';

  @override
  String get adminPlaybackTonemappingRange =>
      'Обхват на тоналното преобразуване';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Обезцветяване при тоналното преобразуване';

  @override
  String get adminPlaybackTonemappingPeak => 'Пик на тоналното преобразуване';

  @override
  String get adminPlaybackTonemappingParam =>
      'Параметър на тоналното преобразуване';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Яркост при VPP тонално преобразуване';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Контраст при VPP тонално преобразуване';

  @override
  String get adminPlaybackEncoderPreset => 'Профил на кодера';

  @override
  String get adminPlaybackH264Crf => 'CRF при H.264 кодиране';

  @override
  String get adminPlaybackH265Crf => 'CRF при H.265 (HEVC) кодиране';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Метод на деинтерлейсинг';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Удвояване на честотата на кадрите при деинтерлейсинг';

  @override
  String get adminPlaybackAudioSection => 'Звук';

  @override
  String get adminPlaybackEnableAudioVbr =>
      'Включване на VBR кодиране на звука';

  @override
  String get adminPlaybackDownmixBoost => 'Усилване при смесване на звука';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Алгоритъм за стерео смесване';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Максимален размер на опашката за мултиплексиране';

  @override
  String get adminPlaybackAutoOption => 'Автоматично';

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
  String get adminTaskStop => 'Спри';

  @override
  String get adminRunningTasks => 'Изпълнявани задачи';

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
    return 'Всеки ден в $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Всеки $day в $time';
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
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count часа',
      one: '1 час',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'време';

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
    return '$daysпреди д';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hoursпреди ч';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes преди мин';
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
      'Конфигурирайте генерирането на Trickplay изображения за миниатюрите при превъртане.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Обществен HTTPS порт';

  @override
  String get adminNetworkingBaseUrl => 'Основен URL адрес';

  @override
  String get adminNetworkingBaseUrlHint => 'напр. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Публичен HTTP порт';

  @override
  String get adminNetworkingRequireHttps => 'Изискване на HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Пренасочва всички отдалечени заявки към HTTPS. Няма ефект, ако сървърът няма валиден сертификат.';

  @override
  String get adminNetworkingCertPassword => 'Парола на сертификата';

  @override
  String get adminNetworkingEnableIpv4 => 'Включване на IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Включване на IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'LAN мрежи';

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
  String get adminPlaybackThrottleDelay =>
      'Забавяне при ограничаване (секунди)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Разрешаване на извличане на субтитри в движение';

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
    return 'Неуспешно актуализиране на типа съдържание: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Праг на бавна реакция (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Включване на предупрежденията за бавен отговор';

  @override
  String get adminGeneralQuickConnect => 'Включване на Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Сървър';

  @override
  String get adminGeneralSectionMetadata => 'Метаданни';

  @override
  String get adminGeneralSectionPaths => 'Пътища';

  @override
  String get adminGeneralSectionPerformance => 'Производителност';

  @override
  String get adminGeneralCachePath => 'Път на кеша';

  @override
  String get adminGeneralMetadataPath => 'Път на метаданни';

  @override
  String get adminGeneralServerName => 'Име на сървъра';

  @override
  String get adminGeneralDisplayLanguage => 'Предпочитан език на показване';

  @override
  String get adminSettingsLoadFailed => 'Неуспешно зареждане на настройките';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Неуспешно актуализиране на съпоставянията: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Времево ограничение: $duration';
  }

  @override
  String get folders => 'Папки';

  @override
  String get libraries => 'Библиотеки';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay деактивиран';

  @override
  String get syncPlayDisabledMessage =>
      'Активирайте SyncPlay в Настройки, за да използвате синхронизирано възпроизвеждане.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сървърът не се поддържа';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay изисква Jellyfin сървър. Текущият сървър не го поддържа.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Група';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay група';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# участници',
      one: '# участник',
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
    return 'Артикул $index';
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
      'Присъединяването към SyncPlay група може да замени текущата ви опашка за възпроизвеждане. Продължаване?';

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
    return '$userName се присъедини към групата SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName напусна SyncPlay групата';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay достъпът е отказан';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Нямате достъп до един или повече елементи в тази SyncPlay група. Помолете собственика на групата да потвърди разрешенията на библиотеката или да изберете друга опашка.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Възпроизвеждането се синхронизира към $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Гласовото търсене не е налично.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Неуспешна директна игра';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Директното възпроизвеждане не успя да започне за този Dolby Vision поток. Повторен опит с прекодиране на сървъра?';

  @override
  String get retryWithTranscode => 'Опитайте отново с прекодиране';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Не се поддържа';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Това устройство не може директно да декодира Dolby Vision съдържание. Използвайте HDR10 резервен вариант или поискайте прекодиране на сървъра.';

  @override
  String get rememberMyChoice => 'Запомни моя избор';

  @override
  String get playHdr10Fallback => 'Играйте HDR10 резервен вариант';

  @override
  String get requestTranscode => 'Заявка за прекодиране';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'открити # реда',
      one: 'открит # ред',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'Нямате връзка';

  @override
  String get offlineBannerSubtitle => 'Показват се изтеглянията ви';

  @override
  String get serverUnreachableBannerTitle => 'Сървърът не е достъпен';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Възпроизвеждане от изтеглянията, докато се възстанови';

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
    return 'Управлението на предаването е неуспешно: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Контроли';
  }

  @override
  String get castDeviceVolume => 'Сила на звука на устройството';

  @override
  String get castVolumeUnavailable => 'Недостъпен';

  @override
  String castStopKind(String kind) {
    return 'Спри $kind';
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
    return 'Въведете $length-цифрен ПИН';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Въведете вашия $length-цифрен ПИН';
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
  String get pinIncorrect => 'Неправилен ПИН';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'ПИН кодовете не съвпадат';

  @override
  String get pinForgot => 'Забравен ПИН?';

  @override
  String get pinClear => 'Изчисти';

  @override
  String get pinBackspace => 'Изтриване';

  @override
  String get quickConnectAuthorized => 'Заявката за Quick Connect е одобрена.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Кодът за Quick Connect е невалиден или изтекъл.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect не се поддържа на този сървър.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Неуспешно одобряване на кода за Quick Connect.';

  @override
  String get quickConnectDisabled => 'Quick Connect е изключен на този сървър.';

  @override
  String get quickConnectForbidden =>
      'Вашият акаунт не може да одобри тази заявка за Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Кодът за Quick Connect не е намерен. Опитайте с нов код.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect беше неуспешен: $message';
  }

  @override
  String get quickConnectEnterCode => 'Въведете код';

  @override
  String get quickConnectAuthorize => 'Упълномощаване';

  @override
  String remoteCommandFailed(String error) {
    return 'Неуспешна команда: $error';
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
    return 'Неуспешно стартиране на предаване: $error';
  }

  @override
  String get noRemoteDevices =>
      'Няма налични устройства за отдалечено възпроизвеждане.';

  @override
  String get noRemoteDevicesIos =>
      'Няма налични устройства за отдалечено възпроизвеждане.\n\nВ iOS целите AirPlay може да не са налични в симулатора.';

  @override
  String get trackActionPlayNext => 'Възпроизвеждане Следващ';

  @override
  String get trackActionViewDetails => 'View Details';

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
    return 'Изтегля се $name...';
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
  String get stillWatchingStop => 'Спри';

  @override
  String get stillWatchingContinue => 'Продължи';

  @override
  String skipSegment(String segment) {
    return 'Пропускане на $segment';
  }

  @override
  String get liveTv => 'Телевизия на живо';

  @override
  String get continueWatchingAndNextUp =>
      'Продължаване на гледането и следващо';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Изтегля се $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Изтегля се $fileName';
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
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
  String get contextMenuHideFromContinueWatching =>
      'Скриване от „Продължете да гледате“';

  @override
  String get contextMenuHideFromNextUp => 'Скриване от „Следва“';

  @override
  String get contextMenuAddToCollection => 'Добавяне към колекция';

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
      'Влезте в административния панел на сървъра';

  @override
  String get settingsDynamicContent => 'Динамично съдържание';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медийна лента и визуални наслагвания';

  @override
  String get settingsAboutSubtitle =>
      'Версия на приложението, правна информация и кредити';

  @override
  String get settingsSortServersBy => 'Сортиране на сървъри по';

  @override
  String get settingsLastUsed => 'Последно използвано';

  @override
  String get settingsAlphabetical => 'Азбучен ред';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Разрешаване на самоподписани сертификати';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Доверявайте се на сървъри, използващи самоподписани TLS сертификати или такива от частен сертифициращ орган. Включвайте само за сървъри, които контролирате. Това изключва проверката на сертификатите за всички връзки.';

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
  String get settingsHomePage => 'Начална страница';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Показване на бутона за библиотеки в лентата за навигация';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Показване на бутона Seerr в навигационната лента';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Винаги показване на текстовите надписи в горната навигационна лента';

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
      'Отворете програмата за проследяване на проблеми на GitHub';

  @override
  String get settingsJoinDiscord => 'Присъединете се към Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Разговаряйте с общността';

  @override
  String get settingsJoinTheDiscord => 'Присъединете се към Discord';

  @override
  String get settingsSupportMoonfin => 'Поддръжка Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Дарете кафе на разработчика';

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
      'Проверете за най-новата Moonfin версия';

  @override
  String get settingsBoth => 'И двете';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Филтър за тип съдържание за разбъркване';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аудио записи, обработка и опции за преминаване';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматизирано възпроизвеждане и секвениране';

  @override
  String get settingsSyncplaySubtitle =>
      'Синхронизираща логика за групови сесии';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Пропускане на въведения и изключения?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown =>
      'Обратно броене за медийните сегменти';

  @override
  String get settingsProgressBar => 'Лента за напредъка';

  @override
  String get settingsTimer => 'Таймер';

  @override
  String get settingsNone => 'Няма';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv (наследено)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision Резервен вариант';

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
      'Контролира дали Dolby Vision потоците на слоя за подобрение на профил 7 трябва да насочват възпроизвеждането.';

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
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

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
    return '$value мс';
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
  String get settingsSyncplayEnabled => 'SyncPlay Активирано';

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
  String get settingsSyncplayExtraOffset => 'SyncPlay Допълнително отместване';

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
    return 'Последни $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Наскоро издадени $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Автоматично пускане на следващия епизод';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Автоматично пускане на следващия епизод, когато е наличен.';

  @override
  String get skipSilenceTitle => 'Пропуснете мълчанието';

  @override
  String get skipSilenceSubtitle =>
      'Автоматично пропускане на тихи аудио сегменти, когато се поддържа от потока.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Разрешаване на външни аудио ефекти';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Разрешете на приложенията за еквалайзер и ефекти (напр. Wavelet) да се прикачват към Media3 сесиите за възпроизвеждане.';

  @override
  String get disableTunnelingTitle => 'Деактивирайте тунелирането';

  @override
  String get disableTunnelingSubtitle =>
      'Принудително нетунелирано възпроизвеждане. Полезно за устройства с прекъсвания на аудио/видео при тунелиране.';

  @override
  String get enableTunnelingTitle => 'Включване на тунелиране';

  @override
  String get enableTunnelingSubtitle =>
      'За напреднали. Насочва звука и видеото през свързан хардуерен път. Изключено по подразбиране, защото причинява прекъсвания на звука/видеото на някои устройства.';

  @override
  String get mapDolbyVisionP7Title => 'Карта Dolby Vision профил 7 към HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Възпроизвеждане на Dolby Vision профил 7 потока като HDR10-съвместим HEVC на не-DV устройства.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Използвайте вградени стилове на субтитри';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Прилагане на цветове, шрифтове и позициониране, вградени в пистата със субтитри. Деактивирайте, за да използвате вашите предпочитания за стил на надписи вместо това.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Използвайте размери на шрифта на вградените субтитри';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Прилагане на съвети за размера на шрифта, вградени в пистата със субтитри. Деактивирайте, за да използвате размера на субтитрите от вашите стилови предпочитания.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Показване на детайли за медията';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Показване на детайли за избрания елемент в горната част на страниците с библиотеки.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Използвайте подробни подзаглавия';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Показване на подробен или минимален подред на страниците на библиотеката.';

  @override
  String get savedThemesDeleteDialogTitle =>
      'Да се ​​изтрие ли запазената тема?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Да се ​​премахне ли „$themeName“ от кеша на това устройство?';
  }

  @override
  String get themeStore => 'Магазин за теми';

  @override
  String get themeStoreSubtitle =>
      'Разглеждайте и запазвайте теми от общността';

  @override
  String get themeStoreDescription =>
      'Запазете дадена тема, за да я използвате като другите си запазени теми.';

  @override
  String get themeStoreEmpty => 'В момента няма налични теми.';

  @override
  String get themeStoreLoadFailed =>
      'Магазинът за теми не можа да се зареди. Проверете връзката си и опитайте отново.';

  @override
  String get themeStoreSave => 'Запазване';

  @override
  String get themeStoreSaveAndApply => 'Запазване и прилагане';

  @override
  String get themeStoreSaved => 'Запазена';

  @override
  String get themeStoreInvalidMessage => 'Тази тема не можа да бъде заредена.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '„$themeName“ е запазена.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '„$themeName“ е изтрит от това устройство.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Не можа да се изтрие „$themeName“.';
  }

  @override
  String get savedThemesTitle => 'Запазени теми';

  @override
  String get savedThemesDescription =>
      'Това са теми, изтеглени от плъгина Moonfin за текущия сървър. Изтриването премахва само това локално копие.';

  @override
  String get savedThemesEmpty => 'Няма запазени теми за този сървър.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Активен в момента';
  }

  @override
  String get savedThemesDeleteTooltip => 'Изтриване на запазена тема';

  @override
  String get savedThemesManageSubtitle =>
      'Управлявайте изтеглените теми на приставката на това устройство';

  @override
  String get themeEditor => 'Редактор на теми';

  @override
  String get themeEditorSubtitle =>
      'Отворете Moonfin редактора на теми във вашия браузър';

  @override
  String get homeScreen => 'Начален екран';

  @override
  String get bottomBar => 'Долна лента';

  @override
  String get homeRowsStyleClassic => 'Класически';

  @override
  String get homeRowsStyleModern => 'Модерен';

  @override
  String get homeRowsSection => 'Домашни редове';

  @override
  String get rowsType => 'Тип редове';

  @override
  String get rowsTypeDescription =>
      'Classic запазва типа на изображението на ред и наслагването на информация. Modern използва редове от портрет към фон.';

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
  String get displayFavoritesRows => 'Показване на редове с предпочитани';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Показване на любими филми, сериали и други любими редове в началните секции.';

  @override
  String get favoritesRowSorting => 'Сортиране на любими редове';

  @override
  String get favoritesRowSortingDescription =>
      'Сортирайте редовете с предпочитани по дата на добавяне, дата на издаване, по азбучен ред и др.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Показване на редове за колекции';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Показване на редове с колекции в началните секции.';

  @override
  String get collectionsRowSorting => 'Колекции Сортиране на редове';

  @override
  String get collectionsRowSortingDescription =>
      'Сортирайте редовете на колекциите по дата на добавяне, дата на издаване, по азбучен ред и др.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Показване на редове за жанрове';

  @override
  String get displayGenresRowsSubtitle =>
      'Показване на редове с жанрове в началните секции.';

  @override
  String get genresRowSorting => 'Сортиране на редове по жанрове';

  @override
  String get genresRowSortingDescription =>
      'Сортирайте редовете на жанровете по дата на добавяне, дата на издаване, по азбучен ред и др.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Елементи от редове на жанрове';

  @override
  String get genresRowItemsDescription =>
      'Показване на филми, сериали или и двете в редовете за жанрове.';

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
  String get displayPlaylistsRows => 'Показване на редовете с плейлисти';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Показване на редовете с плейлисти в началните секции.';

  @override
  String get playlistsRowSorting => 'Подреждане на редовете с плейлисти';

  @override
  String get playlistsRowSortingDescription =>
      'Подреждайте редовете с плейлисти по дата на добавяне, дата на издаване, по азбучен ред и други.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Показване на аудиоредовете';

  @override
  String get displayAudioRowsSubtitle =>
      'Показване на аудиоредовете в началните секции.';

  @override
  String get audioRowsSorting => 'Подреждане на аудиоредовете';

  @override
  String get audioRowsSortingDescription =>
      'Подреждайте аудиоредовете по дата на добавяне, дата на издаване, по азбучен ред и други.';

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
  String get audioPlaylists => 'Аудиоплейлисти';

  @override
  String get appearance => 'Външен вид';

  @override
  String get layout => 'Оформление';

  @override
  String get theme => 'Тема';

  @override
  String get keyboard => 'Клавиатура';

  @override
  String get navButtons => 'Бутони';

  @override
  String get rendering => 'Рендиране';

  @override
  String get mpvConfiguration => 'MPV конфигурация';

  @override
  String get cardSize => 'Размер на картата';

  @override
  String get externalPlayerApp => 'Приложение за външен плейър';

  @override
  String get externalPlayerAppDescription =>
      'Задайте външен плейър, за да включите опцията за възпроизвеждане при задържане';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Показване на инструмента за избор на приложение, когато възпроизвеждането започне.';

  @override
  String get loadingInstalledPlayers => 'Зареждат се инсталираните плейъри...';

  @override
  String get connection => 'Връзка';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Преминаване';

  @override
  String get supportedOnThisDevice => 'Поддържа се на това устройство';

  @override
  String get notSupportedOnThisDevice => 'Не се поддържа на това устройство';

  @override
  String get mediaPlayerBehavior => 'Поведение на медийния плейър';

  @override
  String get playbackEnhancements => 'Подобрения при възпроизвеждане';

  @override
  String get alwaysOn => 'Винаги включен.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Заменете Skip Outro със Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Показване на наслагването Next Up вместо бутона Skip Outro.';

  @override
  String get playerRouting => 'Насочване на играчи';

  @override
  String get preferSoftwareDecoders => 'Предпочитайте софтуерни декодери';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Използвайте FFmpeg (аудио) и libgav1 (AV1) преди хардуерните декодери. Деактивирайте, ако преминаването на аудио HDMI прекъсва.';

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
  String get useExternalPlayer => 'Използвайте външен плейър';

  @override
  String get useExternalPlayerSubtitle =>
      'Отворете възпроизвеждането на видео в избраното от вас външно приложение на Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Автоматично опашка';

  @override
  String get preferSdhSubtitles => 'Предпочитам SDH субтитри';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Дайте приоритет на SDH/CC песните на субтитрите при автоматичен избор.';

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
  String get webDiagnostics => 'Уеб диагностика';

  @override
  String get webDiagnosticsTitle => 'Moonfin Уеб диагностика';

  @override
  String get webDiagnosticsIntro =>
      'Използвайте тази страница, за да диагностицирате проблеми с връзката на браузъра (CORS, смесено съдържание и настройки за откриване).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Открита грешка със смесено съдържание';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Открита повреда на CORS/Предполет';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin откри HTTPS страница, която се опитва да извика URL адрес на HTTP сървър. Браузърите блокират тази заявка, преди да достигне вашия сървър.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin откри неуспешна заявка на ниво браузър, която обикновено се причинява от липсващ CORS или предполетни заглавки на медийния сървър.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Целеви URL адрес: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Подробности: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Текущ контекст на изпълнение';

  @override
  String get webDiagnosticsOrigin => 'Произход';

  @override
  String get webDiagnosticsScheme => 'Схема';

  @override
  String get webDiagnosticsPluginMode => 'Режим на приставки';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC сканиране';

  @override
  String get webDiagnosticsForcedServerUrl => 'Принуден URL адрес на сървъра';

  @override
  String get webDiagnosticsDefaultServerUrl =>
      'URL адрес на сървъра по подразбиране';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'URL адрес на прокси сървър за откриване';

  @override
  String get notConfigured => 'не е конфигуриран';

  @override
  String get webDiagnosticsMixedContent => 'Смесено съдържание';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Тази страница се зарежда през HTTPS, но един или повече конфигурирани URL адреси са HTTP. Браузърите блокират HTTPS страниците да извикват HTTP API.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Поправка: обслужвайте вашия медиен сървър или прокси крайна точка чрез HTTPS или заредете Moonfin през HTTP само в надеждни локални мрежи.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Не е открита очевидна конфигурация със смесено съдържание от текущите настройки по време на изпълнение.';

  @override
  String get webDiagnosticsCorsChecklist => 'Контролен списък на CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Разрешете произхода на браузъра в Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Включете Authorization, X-Emby-Authorization и X-Emby-Token в Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Изложете Content-Range и Accept-Ranges за стрийминг и търсене.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Върнете 204 към OPTIONS предполетни заявки.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Примерен фрагмент от заглавката (в стил nginx)';

  @override
  String get note => 'Забележка';

  @override
  String get webDiagnosticsNonWebNote =>
      'Този път за диагностика е предназначен за уеб компилации. Ако виждате това на друга платформа, тези проверки може да не се прилагат.';

  @override
  String get backToServerSelect => 'Назад към сървъра Изберете';

  @override
  String get signOutAllUsers => 'Излезте от всички потребители';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Разрешението за микрофон е отказано за постоянно. Активирайте го в системните настройки.';

  @override
  String get voiceSearchPermissionRequired =>
      'За гласово търсене се изисква разрешение за микрофон.';

  @override
  String get voiceSearchNoMatch => 'Не разбрах това. Опитайте отново.';

  @override
  String get voiceSearchNoSpeechDetected => 'Не е открита реч.';

  @override
  String get voiceSearchMicrophoneError => 'Грешка в микрофона.';

  @override
  String get voiceSearchNeedsInternet =>
      'Гласовото търсене се нуждае от интернет.';

  @override
  String get voiceSearchServiceBusy =>
      'Гласовата услуга е заета. Опитайте отново.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Разрешението за микрофон е отказано за постоянно.';

  @override
  String get microphonePermissionDenied =>
      'Разрешението за микрофон е отказано.';

  @override
  String get speechRecognitionUnavailable =>
      'Разпознаването на говор не е налично на това устройство.';

  @override
  String get openIosRoutePicker =>
      'Отворете инструмента за избор на маршрут на iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay инструментът за избор на маршрут не е наличен на това устройство.';

  @override
  String get videos => 'Видеоклипове';

  @override
  String get programs => 'програми';

  @override
  String get songs => 'песни';

  @override
  String get photoAlbums => 'Фотоалбуми';

  @override
  String get photos => 'Снимки';

  @override
  String get people => 'хора';

  @override
  String get recentlyReleasedEpisodes => 'Наскоро излезли епизоди';

  @override
  String get watchAgain => 'Гледайте отново';

  @override
  String get guestAppearances => 'Гост изяви';

  @override
  String get appearancesSeerr => 'Изяви (Seerr)';

  @override
  String get crewContributionsSeerr => 'Участие на екипа (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Гледайте с група';

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
  String get disk => 'диск';

  @override
  String get openInBrowser => 'Отворете в браузъра';

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
      'Вграденият браузър не е наличен на тази платформа.';

  @override
  String get adminRestartServerConfirmation =>
      'Сигурни ли сте, че искате да рестартирате сървъра?';

  @override
  String get adminShutdownServerConfirmation =>
      'Сигурни ли сте, че искате да изключите сървъра? Ще трябва да го рестартирате ръчно.';

  @override
  String get internal => 'Вътрешен';

  @override
  String get idle => 'празен ход';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Няма намерени потребители';

  @override
  String get adminNoUsersMatchSearch =>
      'Няма потребители, отговарящи на вашето търсене';

  @override
  String get adminNoDevicesFound => 'Няма намерени устройства';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Нито едно устройство не отговаря на текущите филтри';

  @override
  String get remoteAccess => 'Отдалечен достъп';

  @override
  String get localOnly => 'Само местно';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Неуспешно зареждане на медиен анализ';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Комбиниран анализ във всички медийни библиотеки.';

  @override
  String get analyticsTopArtists => 'Топ изпълнители';

  @override
  String get analyticsTopAuthors => 'Топ автори';

  @override
  String get analyticsTopContributors => 'Най-активни сътрудници';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Библиотеки',
      one: '1 Библиотека',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'За тази селекция все още няма налични индексирани общи медии.';

  @override
  String get analyticsLibraryDetails => 'Подробности за библиотеката';

  @override
  String get analyticsLibraryBreakdown => 'Разбивка на библиотеката';

  @override
  String get analyticsNoLibrariesAvailable => 'Няма налични библиотеки.';

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
  String get adminServerAdministrationTitle => 'Сървърна администрация';

  @override
  String get adminServerPathData => 'данни';

  @override
  String get adminServerPathImageCache => 'Кеш изображения';

  @override
  String get adminServerPathCache => 'Кеш памет';

  @override
  String get adminServerPathLogs => 'трупи';

  @override
  String get adminServerPathMetadata => 'Метаданни';

  @override
  String get adminServerPathTranscode => 'Прекодиране';

  @override
  String get adminServerPathWeb => 'Мрежа';

  @override
  String get adminNoServerPathsReturned =>
      'Няма сървърни пътища, върнати от този сървър.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% използван';
  }

  @override
  String get userActivity => 'Потребителска активност';

  @override
  String get systemEvents => 'Системни събития';

  @override
  String get needsAttention => 'Нуждае се от внимание';

  @override
  String get homeVideos => 'Домашни видеоклипове';

  @override
  String get mixedContent => 'Смесено съдържание';

  @override
  String get homeVideosAndPhotos => 'Домашни видеоклипове и снимки';

  @override
  String get mixedMoviesAndShows => 'Смесени филми и предавания';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Няма намерени записи';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'В архива .$extension не са намерени страници с изображения.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Неуспешно вградено изобразяване ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Неуспешно изобразяване на EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Липсва локален файл за четец: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status при отваряне на данни за книги от $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Няма налична крайна точка за четима книга';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Неподдържан формат на комичен архив: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Плъгинът за извличане на CBR не е наличен на тази платформа.';

  @override
  String get failedToExtractCbrArchive => 'Неуспешно извличане на .cbr архив.';

  @override
  String get cb7ExtractionUnavailable =>
      'Извличането на CB7 не е налично на тази платформа.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Плъгинът за извличане на CB7 не е наличен на тази платформа.';

  @override
  String get loadingShuffle => 'Разбъркването се зарежда...';

  @override
  String get libraryShuffleLabel => 'РАЗБЪРКВАНЕ НА БИБЛИОТЕКАТА';

  @override
  String get randomShuffleLabel => 'СЛУЧАЙНО РАЗБЪРКВАНЕ';

  @override
  String get genresShuffleLabel => 'РАЗБЪРКВАНЕ ПО ЖАНРОВЕ';

  @override
  String get autoHdrSwitching => 'Автоматично превключване на HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Автоматично активиране на HDR за възпроизвеждане на HDR видео и възстановяване на режима на показване при излизане.';

  @override
  String get whenFullscreen => 'Когато е на цял екран';

  @override
  String get changeArtwork => 'Смяна на изображението';

  @override
  String get missing => 'Липсва';

  @override
  String get clearAllArtworkButton => 'Изчистване на всички изображения?';

  @override
  String get clearAllArtworkWarning =>
      'Сигурни ли сте, че искате да изчистите всички изтеглени изображения?';

  @override
  String get confirmClear => 'Потвърдете изчистването';

  @override
  String confirmClearMessage(String itemType) {
    return 'Сигурни ли сте, че искате да изчистите $itemType?';
  }

  @override
  String get uploadButton => 'Качване?';

  @override
  String get resolutionLabel => 'Резолюция: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Показване само на изображения на езика на интерфейса';

  @override
  String get confirmClearAll => 'Потвърдете изчистването на всичко';

  @override
  String get imageUploadSuccess => 'Изображението е качено успешно!';

  @override
  String imageUploadFailed(String error) {
    return 'Неуспешно качване на изображението: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Неуспешно задаване на изображението: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Неуспешно изтриване на изображението: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Неуспешно изчистване на всички изображения: $error';
  }

  @override
  String get yes => 'Да';

  @override
  String get posterCategory => 'Постер';

  @override
  String get backdropsCategory => 'Фонове';

  @override
  String get bannerCategory => 'Банер';

  @override
  String get logoCategory => 'Лого';

  @override
  String get thumbnailCategory => 'Миниатюра';

  @override
  String get artCategory => 'Изображение';

  @override
  String get discArtCategory => 'Изображение на диска';

  @override
  String get screenshotCategory => 'Екранна снимка';

  @override
  String get boxCoverCategory => 'Предна корица';

  @override
  String get boxRearCoverCategory => 'Задна корица';

  @override
  String get menuArtCategory => 'Изображение на менюто';

  @override
  String get confirmItemPoster => 'постера';

  @override
  String get confirmItemBackdrop => 'фона';

  @override
  String get confirmItemBanner => 'банера';

  @override
  String get confirmItemLogo => 'логото';

  @override
  String get confirmItemThumbnail => 'миниатюрата';

  @override
  String get confirmItemArt => 'изображението';

  @override
  String get confirmItemDiscArt => 'изображението на диска';

  @override
  String get confirmItemScreenshot => 'екранната снимка';

  @override
  String get confirmItemBoxCover => 'предната корица';

  @override
  String get confirmItemBoxRearCover => 'задната корица';

  @override
  String get confirmItemMenuArt => 'изображението на менюто';

  @override
  String get resolutionAll => 'Всички';

  @override
  String get resolutionHigh => 'Висока (1080p+)';

  @override
  String get resolutionMedium => 'Средна (720p)';

  @override
  String get resolutionLow => 'Ниска (<720p)';

  @override
  String get sources => 'Източници';

  @override
  String get audiobookChapters => 'Глави';

  @override
  String get audiobookBookmarks => 'Отметки';

  @override
  String get audiobookNotes => 'Бележки';

  @override
  String get audiobookQueue => 'Опашка';

  @override
  String get audiobookTimeline => 'Хронология';

  @override
  String get audiobookTimelineEmpty => 'Хронологията е празна';

  @override
  String get audiobookFocusedTimeline => 'Фокусирана хронология';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Експортиране на отметките';

  @override
  String get audiobookExportNotes => 'Експортиране на бележките';

  @override
  String get audiobookExportAll => 'Експортиране на всичко';

  @override
  String audiobookExportSuccess(String path) {
    return 'Експортирано в $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Неуспешно експортиране: $error';
  }

  @override
  String get audiobookLyrics => 'Текст';

  @override
  String get audiobookAddBookmark => 'Добавяне на отметка';

  @override
  String get audiobookAddNote => 'Добавяне на бележка';

  @override
  String get audiobookEditNote => 'Редактиране на бележката';

  @override
  String get audiobookNoteHint => 'Напишете бележка за този момент';

  @override
  String get audiobookSleepTimer => 'Таймер за заспиване';

  @override
  String get audiobookSleepOff => 'Изкл.';

  @override
  String get audiobookSleepEndOfChapter => 'В края на главата';

  @override
  String get audiobookSleepCustom => 'Персонализиран';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'остават $remaining';
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
  String get audiobookPlaybackSpeed => 'Скорост на възпроизвеждане';

  @override
  String get audiobookRemainingTime => 'Оставащо';

  @override
  String get audiobookElapsedTime => 'Изминало';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Назад $secondsс';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Напред $secondsс';
  }

  @override
  String get audiobookPreviousChapter => 'Предишна глава';

  @override
  String get audiobookNextChapter => 'Следваща глава';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Глава $current от $total';
  }

  @override
  String get audiobookNoChapters => 'Няма глави';

  @override
  String get audiobookNoBookmarks => 'Все още няма отметки';

  @override
  String get audiobookNoNotes => 'Все още няма бележки';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Добавена е отметка на $position';
  }

  @override
  String get audiobookSpeedReset => 'Връщане на 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Запазване';

  @override
  String get audiobookCancel => 'Отказ';

  @override
  String get audiobookDelete => 'Изтриване';

  @override
  String get subtitlePreferencesDescription =>
      'Променете режимите на субтитрите, езиците по подразбиране, външния вид и опциите за изобразяване.';

  @override
  String get subtitleRendering => 'Изобразяване на субтитрите';

  @override
  String get displayOptions => 'Опции за показване';

  @override
  String get releaseDateAscending => 'Дата на издаване (възходящо)';

  @override
  String get releaseDateDescending => 'Дата на издаване (низходящо)';

  @override
  String get groupContributions => 'Групиране на участията';

  @override
  String get groupMultipleRoles => 'Групиране на няколко роли';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Предупреждение за достъп за запис в библиотеката';

  @override
  String get libraryWriteAccessHowToFix => 'Как да поправите това:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Дайте права за запис на потребителя на услугата Jellyfin (напр. jellyfin или Docker PUID/PGID) върху папките с медийната ви библиотека на сървъра.\n\n2. Или отидете в таблото за управление на Jellyfin -> Библиотеки, редактирайте тази библиотека и изключете „Запазване на обложките в медийните папки“, за да се съхраняват обложките във вътрешната база данни на Jellyfin.';

  @override
  String get dismiss => 'Отхвърляне';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Вашата библиотека „$libraryName“ е конфигурирана да запазва обложките директно в медийните папки (включено е „Запазване на обложките в медийните папки“). Jellyfin обаче провери достъпа за запис и няма права да записва файлове в тази директория:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Изглежда, че Jellyfin не успя да обнови обложката. Вашата библиотека е конфигурирана да запазва обложките директно в медийните папки (включено е „Запазване на обложките в медийните папки“). Тази грешка обикновено възниква, когато процесът на сървъра Jellyfin няма права да записва файлове в медийните ви директории.';

  @override
  String get replay => 'Възпроизвеждане отново';

  @override
  String get fileInformation => 'Информация за файла';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Размер: $size  •  Формат: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Показване на всички ($count) аудиозаписи';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Показване на всички ($count) субтитри';
  }

  @override
  String get checkingDirectPlay =>
      'Проверка на възможността за директно възпроизвеждане...';

  @override
  String get directPlayCapabilityLabel =>
      'Възможност за директно възпроизвеждане: ';

  @override
  String get forced => 'Принудителни';

  @override
  String get transcodeContainerNotSupported =>
      'Форматът на контейнера не се поддържа от плейъра.';

  @override
  String get transcodeVideoCodecNotSupported => 'Видеокодекът не се поддържа.';

  @override
  String get transcodeAudioCodecNotSupported => 'Аудиокодекът не се поддържа.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Форматът на субтитрите не се поддържа (изисква вграждане).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Аудиопрофилът не се поддържа.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Видеопрофилът не се поддържа.';

  @override
  String get transcodeVideoLevelNotSupported => 'Видеонивото не се поддържа.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Видеорезолюцията не се поддържа от това устройство.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Битовата дълбочина на видеото не се поддържа.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Честотата на кадрите не се поддържа.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Битрейтът на файла надвишава лимита за стрийминг на плейъра.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Битрейтът на видеото надвишава лимита за стрийминг.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Битрейтът на звука надвишава лимита за стрийминг.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Броят на аудиоканалите не се поддържа.';

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
  String get sortAlphabetical => 'По азбучен ред';

  @override
  String get sortReleaseAscending => 'Ред на издаване (възходящо)';

  @override
  String get sortReleaseDescending => 'Ред на издаване (низходящо)';

  @override
  String get sortCustomDragDrop => 'Персонализиран (с плъзгане)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Опции за подреждане на плейлиста';

  @override
  String get resetSort => 'Нулиране на подреждането';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Гледай отново С$season:Е$episode';
  }

  @override
  String get rewatchPlaylist => 'Гледай отново плейлиста';

  @override
  String get noSubtitlesFound => 'Не са намерени субтитри.';

  @override
  String get adminControls => 'Административни контроли';

  @override
  String get impellerRendering => 'Двигател за изобразяване (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller е модерният GPU рендер на Flutter за по-плавни анимации и по-малко забавяния. На някои TV устройства и по-стари GPU може да причини дефекти или черно видео; изключете го, ако забележите такива. „Автоматично“ избира най-добрата настройка за вашето устройство. Рестартирайте Moonfin, за да приложите промяната.';

  @override
  String get impellerAuto => 'Автоматично';

  @override
  String get impellerOn => 'Вкл.';

  @override
  String get impellerOff => 'Изкл.';

  @override
  String get impellerRestartTitle => 'Изисква се рестартиране';

  @override
  String get impellerRestartMessage =>
      'Moonfin трябва да се рестартира, за да смени двигателя за изобразяване. Затворете приложението сега и след това го отворете отново, за да приложите промяната.';

  @override
  String get impellerCloseNow => 'Затвори приложението сега';

  @override
  String get adminRefreshLibrary => 'Обновяване на библиотеката';

  @override
  String get adminRefreshAllLibraries => 'Обновяване на всички библиотеки';

  @override
  String get adminRepoSortDateOldest => 'Дата на добавяне (първо най-старите)';

  @override
  String get adminRepoSortDateNewest => 'Дата на добавяне (първо най-новите)';

  @override
  String get adminRepoSortNameAsc => 'По азбучен ред (А до Я)';

  @override
  String get adminRepoSortNameDesc => 'По азбучен ред (Я до А)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Зареждане на анализите на сървъра... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Като източника';

  @override
  String get imdbTop250Movies => 'IMDb Топ 250 филми';

  @override
  String get imdbTop250TvShows => 'IMDb Топ 250 сериали';

  @override
  String get imdbMostPopularMovies => 'IMDb Най-популярни филми';

  @override
  String get imdbMostPopularTvShows => 'IMDb Най-популярни сериали';

  @override
  String get imdbLowestRatedMovies => 'IMDb Най-ниско оценени филми';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb Най-високо оценени филми на английски';

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
