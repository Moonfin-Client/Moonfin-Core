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
  String get interfaceLanguage => 'Язык интерфейса';

  @override
  String get systemLanguageDefault => 'Как в системе';

  @override
  String get signIn => 'Войти';

  @override
  String get signingIn => 'Signing in...';

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
  String get waitingForAuthorization => 'Ожидание авторизации...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Сервер недоступен';

  @override
  String get loginFailed => 'Ошибка входа';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

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
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

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
  String get glassQuality => 'Качество стекла';

  @override
  String get oledMode => 'Режим OLED';

  @override
  String get oledModeSubtitle =>
      'Перевод: Углубляет чёрный цвет и делает изображение насыщеннее. Лучше всего работает на OLED-дисплеях.';

  @override
  String get oledModeSubtle => 'Subtle';

  @override
  String get oledModeVivid => 'Vivid';

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
      'Переключайтесь между Moonfin и Neon Pulse, не перезапуская приложение.';

  @override
  String get customThemeTitle => 'Своя тема';

  @override
  String get customThemeSubtitle =>
      'Пользовательские темы меняют оформление во всём Moonfin. Выберите вариант на свой вкус.';

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
  String get gameOrientation => 'Game orientation';

  @override
  String get gameOrientationSubtitle =>
      'Screen orientation while playing games';

  @override
  String get landscape => 'Landscape';

  @override
  String get portrait => 'Portrait';

  @override
  String get gameEmulatorSettings => 'Настройки эмулятора';

  @override
  String get gameNoCoreOptions => 'У этого ядра нет настраиваемых параметров.';

  @override
  String get gameHoldToOpenMenu => 'Удерживайте, чтобы открыть меню';

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
  String get apply => 'Применить';

  @override
  String get openLink => 'Открыть ссылку';

  @override
  String get scanWithYourPhone => 'Сканируйте с помощью телефона';

  @override
  String get audiobookGenres => 'Жанры аудиокниг';

  @override
  String get scrollLeft => 'Прокрутить влево';

  @override
  String get scrollRight => 'Прокрутите вправо';

  @override
  String get scrollToTop => 'Scroll to top';

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
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

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
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Книг этого автора не найдено.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

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
  String get additionalParts => 'Additional Parts';

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
  String get castMembers => 'Cast';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

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
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

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
  String get starring => 'STARRING';

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
  String get shuffleAll => 'Shuffle All';

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
  String get track => 'Дорожка';

  @override
  String get channels => 'Каналы';

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
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

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
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Руководство по временной шкале';

  @override
  String failedToLoadGuide(String error) {
    return 'Не удалось загрузить телепрограмму: $error';
  }

  @override
  String get noChannelsFound => 'Каналы не найдены';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'ЖИТЬ';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

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
  String get cancelRecordingAction => 'Отменить запись';

  @override
  String get programSetToRecord => 'Запись передачи запланирована';

  @override
  String get recordingCancelled => 'Запись отменена';

  @override
  String get unableToCreateRecording => 'Не удалось создать запись';

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
  String get watch => 'Смотреть';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Закрыть';

  @override
  String failedToPlayChannel(String name) {
    return 'Не удалось воспроизвести $name';
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
  String get settingsSearchHint => 'Search settings';

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
  String get mixedRowsOnly => 'Mixed rows only';

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
  String get fireworks => 'Фейерверк';

  @override
  String get confetti => 'Конфетти';

  @override
  String get fallingLeaves => 'Падающие листья';

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
  String get loopThemeMusic => 'Зациклить заглавную музыку';

  @override
  String get loopThemeMusicSubtitle =>
      'Повторять трек, а не проигрывать его один раз';

  @override
  String get detailsBackgroundBlur => 'Детали размытия фона';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

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
  String get stretch => 'Потягиваться';

  @override
  String get refreshRateSwitching => 'Переключение частоты обновления';

  @override
  String get disabled => 'Отключено';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

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
  String get showDescriptionOnPause => 'Показать описание на паузе';

  @override
  String get dimVideoShowOverview =>
      'Затемнять видео и показывать обзорный текст во время паузы';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'Кнопка блокировки экранного меню';

  @override
  String get osdLockButtonDescription =>
      'Показать кнопку блокировки, которая блокирует сенсорный ввод до длительного нажатия';

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
  String get settingsAudioFallbackCodec => 'Запасной аудиокодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Выберите формат для транскодирования многоканального звука, когда исходный поток нельзя воспроизвести напрямую или передать без обработки.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

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
  String get defaultToNoSubtitles => 'По умолчанию нет субтитров';

  @override
  String get turnOffSubtitlesByDefault => 'Отключить субтитры по умолчанию';

  @override
  String get subtitleSize => 'Размер субтитров';

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
  String get syncing => 'Синхронизация...';

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
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

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
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar =>
      'Показать библиотеки на панели инструментов';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

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
  String get mediaBarMode => 'Стиль медиа-бара';

  @override
  String get mediaBarModeDescription =>
      'Выберите один из вариантов оформления панели управления медиафайлами или отключите её';

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
  String get mediaBarModeOff => 'Выкл.';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Включить медиа-панель';

  @override
  String get showFeaturedContentSlideshow =>
      'Показывать слайд-шоу избранного контента на главной странице';

  @override
  String get contentType => 'Тип контента';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

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
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

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
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Последние СМИ';

  @override
  String get recentlyReleased => 'Недавно выпущенный';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

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
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Сбросить настройки по умолчанию';

  @override
  String get homeRowPosterSize => 'Размер плаката домашнего ряда';

  @override
  String get configureImageTypeForEachRow =>
      'Настройте тип изображения для каждой включенной главной строки';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Объединить Продолжить просмотр и следующее';

  @override
  String get combineBothRows => 'Объедините оба ряда в один домашний раздел.';

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
  String get fullScreenRows => 'Развёрнутые ряды на главной';

  @override
  String get fullScreenRowsDescription =>
      'Показывать не больше одного ряда на экране';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get displayClockDuringScreensaver =>
      'Отображать часы во время заставки';

  @override
  String get clockModeStatic => 'Статичные';

  @override
  String get clockModeBouncing => 'Прыгающие';

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
  String get pluginDetected => 'Плагин обнаружен';

  @override
  String get pluginNotDetected => 'Плагин не обнаружен';

  @override
  String get pluginNotDetectedDescription =>
      'Плагин сервера в настоящее время не обнаружен. Локальные настройки по-прежнему используют сохраненные значения или встроенные значения по умолчанию.';

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
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Ряды подборок Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

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
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

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
  String get featuredContentAppearance => 'Рекомендуемый контент, внешний вид';

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
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Запрос';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Отменить запрос';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Играйте в Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Запрос от $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

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
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Отправить запрос';

  @override
  String get allSeasons => 'Все сезоны';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

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
  String get adminLibraryLoadFailed => 'Не удалось загрузить библиотеку';

  @override
  String get adminNoMediaPaths => 'Не настроены пути к носителям';

  @override
  String get adminAddPath => 'Добавить путь';

  @override
  String get adminBrowseFilesystem => 'Просмотрите файловую систему сервера:';

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
  String adminSaveFailed(String error) {
    return 'Не удалось сохранить: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Пароли не совпадают';

  @override
  String adminFailed(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get adminUserLoadFailed => 'Не удалось загрузить пользователя';

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
  String get adminEnableAllLibraryAccess =>
      'Разрешить доступ ко всем библиотекам';

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
  String get adminPlaybackLoadFailed =>
      'Не удалось загрузить настройки воспроизведения.';

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
  String adminMetadataLoadFailed(String error) {
    return 'Не удалось загрузить метаданные: $error';
  }

  @override
  String get adminRefreshMetadata => 'Обновить метаданные';

  @override
  String get recursive => 'Рекурсивный';

  @override
  String get adminReplaceAllMetadata => 'Заменить все метаданные';

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
  String get adminEnableAllTuners => 'Включить все тюнеры';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Не удалось удалить тюнер: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Не удалось удалить провайдера: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Путь записи серии';

  @override
  String get adminMovieRecordingPath => 'Путь для записи фильмов';

  @override
  String get adminGuideDaysAuto => 'Автоматически';

  @override
  String get adminRecordingPostProcessor => 'Путь к приложению постобработки';

  @override
  String get adminRecordingPostProcessorArgs => 'Аргументы постобработчика';

  @override
  String get adminSaveRecordingNfo => 'Сохранять NFO-метаданные записей';

  @override
  String get adminSaveRecordingImages => 'Сохранять изображения записей';

  @override
  String get adminLiveTvSectionPaths => 'Пути записи';

  @override
  String get adminLiveTvSectionPostProcessing => 'Постобработка';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Не удалось сохранить настройки: $error';
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
  String get adminGuideRefreshStarted => 'Обновление телепрограммы запущено';

  @override
  String get adminGuideRefreshUnavailable =>
      'Задача обновления телепрограммы недоступна на этом сервере.';

  @override
  String get adminNoListingProviders => 'Поставщики листинга не настроены';

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
  String get adminBackupsTitle => 'Резервные копии';

  @override
  String get adminUnknownDate => 'Неизвестная дата';

  @override
  String get adminUnnamedBackup => 'Безымянное резервное копирование';

  @override
  String get adminApply => 'Применить';

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
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Слоган';

  @override
  String get adminMetadataFieldOverview => 'Обзор';

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
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Нет плагинов, соответствующих вашему запросу';

  @override
  String get adminPluginsNoneInstalled => 'Плагины не установлены';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

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
  String get adminNetworkingEnableHttps => 'Включить HTTPS';

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
  String get adminPlaybackQsvDevice => 'Устройство QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Включить расширенный декодер NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Предпочитать системный аппаратный декодер';

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
  String get adminNetworkingPublicHttpPort => 'Публичный порт HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Требовать HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Перенаправлять все удалённые запросы на HTTPS. Не действует, если у сервера нет действительного сертификата.';

  @override
  String get adminNetworkingCertPassword => 'Пароль сертификата';

  @override
  String get adminNetworkingEnableIpv4 => 'Включить IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Включить IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'Сети LAN';

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
  String get kidsMode => 'Kids Mode';

  @override
  String get kidsModeSubtitle =>
      'Simplify the app and lock the way out with a PIN';

  @override
  String get kidsModeExit => 'Exit Kids Mode';

  @override
  String get kidsModeExitSubtitle => 'Enter your PIN to restore the full app';

  @override
  String get pinIncorrect => 'Неправильный PIN-код';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

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
  String get trackActionViewDetails => 'View Details';

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
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

  @override
  String get settingsAdministrationSubtitle =>
      'Доступ к панели администрирования сервера';

  @override
  String get settingsDynamicContent => 'Динамический контент';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медиа-панель и визуальные наложения';

  @override
  String get settingsAboutSubtitle =>
      'Версия приложения, юридическая информация и кредиты';

  @override
  String get settingsSortServersBy => 'Сортировать серверы по';

  @override
  String get settingsLastUsed => 'Последнее использование';

  @override
  String get settingsAlphabetical => 'Алфавитный';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Разрешить самоподписанные сертификаты';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Доверять серверам с самоподписанными сертификатами TLS или сертификатами частного центра. Включайте только для своих серверов: проверка сертификатов отключится для всех подключений.';

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
  String get settingsHomePage => 'Домашняя страница';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

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
  String get settingsBoth => 'Оба';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Фильтр типов содержимого в случайном порядке';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аудиодорожки, параметры обработки и передачи';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматизированное воспроизведение и секвенирование';

  @override
  String get settingsSyncplaySubtitle =>
      'Логика синхронизации для групповых сеансов';

  @override
  String get settingsSkipIntrosAndOutros => 'Пропустить интро и аутро?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Обратный отсчёт сегментов';

  @override
  String get settingsProgressBar => 'Полоса прогресса';

  @override
  String get settingsTimer => 'Таймер';

  @override
  String get settingsNone => 'Нет';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv (старый вариант)';

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
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

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
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

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
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

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
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      '«Классический» сохраняет тип изображения для каждого ряда и информационный оверлей. «Современный» использует ряды с переходом от постера к фону.';

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
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

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
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Содержимое рядов жанров';

  @override
  String get genresRowItemsDescription =>
      'Показывать в рядах жанров фильмы, сериалы или и то, и другое.';

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
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Поддерживается на этом устройстве';

  @override
  String get notSupportedOnThisDevice => 'Не поддерживается на этом устройстве';

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
      'Открывать видео в выбранном внешнем приложении на Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Автоматическая очередь';

  @override
  String get preferSdhSubtitles => 'Предпочитать субтитры SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Отдавать приоритет дорожкам SDH/CC при автовыборе.';

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
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Смотреть с группой';

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
  String get openInBrowser => 'Открыть в браузере';

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
  String get homeVideos => 'Домашнее видео';

  @override
  String get mixedContent => 'Смешанный контент';

  @override
  String get homeVideosAndPhotos => 'Домашнее видео и фото';

  @override
  String get mixedMoviesAndShows => 'Фильмы и сериалы вместе';

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
  String get audiobookFocusedTimeline => 'Текущий фрагмент';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

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
  String get replay => 'Смотреть заново';

  @override
  String get fileInformation => 'Сведения о файле';

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
  String get sortAlphabetical => 'По алфавиту';

  @override
  String get sortReleaseAscending => 'Порядок выхода (по возрастанию)';

  @override
  String get sortReleaseDescending => 'Порядок выхода (по убыванию)';

  @override
  String get sortCustomDragDrop => 'Свой (перетаскиванием)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

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
