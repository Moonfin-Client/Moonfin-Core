// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

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
  String get interfaceLanguage => 'Интерфейс тілі';

  @override
  String get systemLanguageDefault => 'Жүйе бойынша';

  @override
  String get signIn => 'Кіру';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Бос';

  @override
  String connectingToServer(String serverName) {
    return '$serverName серверіне қосылуда';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Құпия сөз';

  @override
  String get username => 'Пайдаланушы аты';

  @override
  String get email => 'Электрондық пошта';

  @override
  String get quickConnectInstruction =>
      'Бұл кодты серверіңіздің веб-бақылау тақтасына енгізіңіз:';

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
  String get waitingForAuthorization => 'Авторизация күтілуде...';

  @override
  String get back => 'Артқа';

  @override
  String get serverUnavailable => 'Сервер қолжетімсіз';

  @override
  String get loginFailed => 'Логин кірмеді';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect қолжетімсіз: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect қолжетімсіз ($status): $detail';
  }

  @override
  String get whosWatching => 'Кім қарап отыр?';

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
  String get addUser => 'Пайдаланушы қосу';

  @override
  String get selectServer => 'Серверді таңдаңыз';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin нұсқасы $version';
  }

  @override
  String get savedServers => 'Сақталған серверлер';

  @override
  String get discoveredServers => 'Табылған серверлер';

  @override
  String get noneFound => 'Ешқайсысы табылмады';

  @override
  String get unableToConnectToServer => 'Серверге қосылу мүмкін емес';

  @override
  String get addServer => 'Сервер қосу';

  @override
  String get embyConnect => 'Emby Қосылу';

  @override
  String get removeServer => 'Серверді жою';

  @override
  String removeServerConfirmation(String serverName) {
    return '«$serverName» серверлер тізімінен жойылсын ба?';
  }

  @override
  String get cancel => 'Болдырмау';

  @override
  String get remove => 'Алып тастау';

  @override
  String get connectToServer => 'Серверге қосылу';

  @override
  String get serverAddress => 'Сервер мекенжайы';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Қосылу';

  @override
  String get secureStorageUnavailable => 'Қауіпсіз жад қолжетімсіз';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin жүйе кілттеріне қол жеткізе алмады. Жүйеге кіруді жалғастыруға болады, бірақ кілт сақинасының құлпы ашылғанша қауіпсіз таңбалауыш қоймасы қолжетімсіз болуы мүмкін.';

  @override
  String get ok => 'Жарайды';

  @override
  String get settingsAppearanceTheme => 'Қолданба тақырыбы';

  @override
  String get detailScreenStyle => 'Мәліметтер экранының стилі';

  @override
  String get detailScreenStyleSubtitle =>
      '«Классикалық» — Moonfin бағдарламасының бастапқы, ортаға тураланған қалыбы. «Заманауи» — бейімделгіш кинематографиялық қалып.';

  @override
  String get detailScreenStyleMoonfin => 'Классикалық';

  @override
  String get detailScreenStyleModern => 'Заманауи';

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
  String get expandedTabs => 'Жайылған қойындылар';

  @override
  String get expandedTabsSubtitle =>
      'Қойындыларды шолу кезінде олардың мазмұнын автоматты түрде көрсету. Әр қойындыны қолмен ашып-жабу үшін өшіріңіз.';

  @override
  String get showTechnicalDetails => 'Техникалық мәліметтер көрсетілсін бе?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Баннер түйіндемесінде кодек, ажыратымдылық және ағын туралы мәліметтерді көрсету';

  @override
  String get recommendationSystem => 'Ұсыныс жүйесі';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin ұсынады жергілікті кітапхана алгоритмін немесе TMDb ұсынатын желілік ұқсастық метрикаларын пайдаланыңыз. Ескертпе: желілік ұсыныстар Seerr интеграциясын талап етеді.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin ұсынады';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb ұқсастығы';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Жас шектеуі бойынша шек қойылсын ба?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Moonfin ұсынады тізіміндегі ұсыныстарды таңдалған медиафайлдың жас шектеуі бойынша шектеу';

  @override
  String get interfaceStyle => 'Интерфейс стилі';

  @override
  String get interfaceStyleSubtitle =>
      '«Автоматты» құрылғыңызға сәйкес келеді. Белгілі бір көріністі мәжбүрлеп орнату үшін Apple немесе Material таңдаңыз.';

  @override
  String get interfaceStyleAutomatic => 'Автоматты';

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
  String get glassQuality => 'Шыны сапасы';

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
      '«Авто» осы құрылғыға ең қолайлы шыны әсерін таңдайды. «Толық» нақты бұлдырлатуды қосады, «Азайтылған» GPU қуатын үнемдейтін жеңіл шыныны пайдаланады.';

  @override
  String get glassQualityAuto => 'Авто';

  @override
  String get glassQualityFull => 'Толық';

  @override
  String get glassQualityReduced => 'Азайтылған';

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
      'Қолданбаны қайта іске қоспай, Moonfin және Neon Pulse арасында ауысыңыз';

  @override
  String get customThemeTitle => 'Жеке тақырып';

  @override
  String get customThemeSubtitle =>
      'Жеке тақырыптар Moonfin бойынша визуалды элементтерді өзгертеді. Өз стиліңізге сай нұсқаны таңдаңыз.';

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
  String get themeMoonfinSubtitle => 'Ағымдағы Moonfin келбеті бәріңізге ұнады';

  @override
  String get themeNeonPulse => 'Неон импульсі';

  @override
  String get themeNeonPulseSubtitle =>
      'Күлгін түсті жарқыл, көгілдір мәтін және күшті хром контрастымен Synthwave стилі';

  @override
  String get themeGlass => 'Шыны';

  @override
  String get themeGlassSubtitle =>
      'Сұйық шыны стилі: жылжымалы градиент фоны, күңгірт беттер және Apple көк екпіні';

  @override
  String get theme8BitHero => '8-биттік батыр';

  @override
  String get theme8BitHeroSubtitle =>
      'Ретро пиксель-арт стилі: ірі палитра, блокты жиектер, қатты көлеңкелер және пиксельдік қаріп';

  @override
  String get embyConnectSignInSubtitle =>
      'Emby Connect есептік жазбасымен кіріңіз';

  @override
  String get emailOrUsername => 'Электрондық пошта немесе пайдаланушы аты';

  @override
  String get selectAServer => 'Серверді таңдаңыз';

  @override
  String get tryAgain => 'Қайтадан байқап көріңіз';

  @override
  String get noLinkedServers =>
      'Осы Emby Connect тіркелгісімен байланыстырылған серверлер жоқ';

  @override
  String get invalidEmbyConnectCredentials =>
      'Жарамсыз Emby Connect тіркелгі деректері';

  @override
  String get invalidEmbyConnectLogin =>
      'Жарамсыз Emby Connect пайдаланушы аты немесе құпия сөз';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сервер Emby Connect алмасуын қолдамайды';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect немесе таңдалған сервермен байланысу кезінде желі қатесі';

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
  String get loadingLinkedServers => 'Байланыстырылған серверлер жүктелуде...';

  @override
  String get connectingToServerEllipsis => 'Серверге қосылуда...';

  @override
  String get noReachableAddress => 'Қолжетімді мекенжай көрсетілмеген';

  @override
  String get invalidServerExchangeResponse =>
      'Сервер алмасудың соңғы нүктесінен жарамсыз жауап';

  @override
  String unableToConnectTo(String target) {
    return '$target серверіне қосылу мүмкін болмады';
  }

  @override
  String get exitApp => 'Moonfin шығу керек пе?';

  @override
  String get exitAppConfirmation => 'Шығыңыз келетініне сенімдісіз бе?';

  @override
  String get exit => 'Шығу';

  @override
  String get gameMenu => 'Мәзір';

  @override
  String get gamePaused => 'Кідіртілді';

  @override
  String get gameSaveState => 'Күйді сақтау';

  @override
  String get games => 'Ойындар';

  @override
  String get gameLoadState => 'Күйді жүктеу';

  @override
  String get gameFastForward => 'Жылдам алға';

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
  String get gameEmulatorSettings => 'Эмулятор параметрлері';

  @override
  String get gameNoCoreOptions => 'Бұл ядроның реттелетін параметрлері жоқ.';

  @override
  String get gameHoldToOpenMenu => 'Мәзірді ашу үшін басып тұрыңыз';

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
      'Ойындар бұл құрылғыда әзірге қолдау таппайды.';

  @override
  String get noHomeRowsLoaded => 'Ешбір негізгі жолдарды жүктеу мүмкін болмады';

  @override
  String get noHomeRowsHint =>
      'Белсенді үй бөлімдерін жаңартып немесе азайтып көріңіз.';

  @override
  String get retryHomeRows => 'Басты жолдарды қайталап көріңіз';

  @override
  String get guide => 'Гид';

  @override
  String get recordings => 'Жазбалар';

  @override
  String get schedule => 'Кесте';

  @override
  String get series => 'Сериалдар';

  @override
  String get noItemsFound => 'Ешбір элемент табылмады';

  @override
  String get home => 'Басты бет';

  @override
  String get browseAll => 'Барлығын шолу';

  @override
  String get genres => 'Жанрлар';

  @override
  String get collectionPlaceholder =>
      'Жинақ элементтері осы жерде пайда болады';

  @override
  String get browseByLetter => 'Хат бойынша шолу';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Мұнда алфавиттік шолу пайда болады';

  @override
  String get suggestions => 'Ұсыныстар';

  @override
  String get suggestionsPlaceholder =>
      'Ұсынылған элементтер осы жерде пайда болады';

  @override
  String get failedToLoadLibraries => 'Кітапханалар жүктелмеді';

  @override
  String get noLibrariesFound => 'Ешқандай кітапхана табылмады';

  @override
  String get library => 'Медиатека';

  @override
  String get displaySettings => 'Дисплей параметрлері';

  @override
  String get allGenres => 'Барлық жанрлар';

  @override
  String get noGenresFound => 'Жанрлар табылмады';

  @override
  String failedToLoadFolderError(String error) {
    return 'Қалтаны жүктеу мүмкін болмады: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Бұл қалта бос';

  @override
  String itemCountLabel(int count) {
    return '$count элемент';
  }

  @override
  String get failedToLoadFavorites => 'Таңдаулылар жүктелмеді';

  @override
  String get retry => 'Қайталап көріңіз';

  @override
  String get noFavoritesYet => 'Таңдаулылар әлі жоқ';

  @override
  String get favorites => 'Таңдаулылар';

  @override
  String totalCountItems(int count) {
    return '$count Элемент';
  }

  @override
  String get continuing => 'Жалғастыруда';

  @override
  String get ended => 'Аяқталды';

  @override
  String get sortAndFilter => 'Сұрыптау және сүзу';

  @override
  String get type => 'Түр';

  @override
  String get sortBy => 'Бойынша сұрыптау';

  @override
  String get display => 'Дисплей';

  @override
  String get imageType => 'Кескін түрі';

  @override
  String get posterSize => 'Постер өлшемі';

  @override
  String get small => 'Кішкентай';

  @override
  String get medium => 'Орташа';

  @override
  String get large => 'Үлкен';

  @override
  String get extraLarge => 'Өте үлкен';

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
    return '$name — Жанрлар';
  }

  @override
  String get views => 'Көрулер';

  @override
  String get albums => 'Альбомдар';

  @override
  String get albumArtists => 'Альбом әртістері';

  @override
  String get artists => 'Орындаушылар';

  @override
  String get bookmarks => 'Бетбелгілер';

  @override
  String get noSavedBookmarks =>
      'Бұл тақырып үшін әлі сақталған бетбелгілер жоқ.';

  @override
  String get openBook => 'Ашық кітап';

  @override
  String get chapter => 'тарау';

  @override
  String get page => 'Бет';

  @override
  String get bookmark => 'Бетбелгі';

  @override
  String get justNow => 'Жаңа ғана';

  @override
  String minutesAgo(int count) {
    return '$count мин бұрын';
  }

  @override
  String hoursAgo(int count) {
    return '$count сағ бұрын';
  }

  @override
  String daysAgo(int count) {
    return '$count күн бұрын';
  }

  @override
  String get discoverySubjects => 'Ашу тақырыптары';

  @override
  String get apply => 'Қолдану';

  @override
  String get openLink => 'Сілтемені ашу';

  @override
  String get scanWithYourPhone => 'Телефонмен сканерлеңіз';

  @override
  String get audiobookGenres => 'Аудиокітап жанрлары';

  @override
  String get scrollLeft => 'Солға айналдырыңыз';

  @override
  String get scrollRight => 'Оңға айналдырыңыз';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre => 'Дәл қазір бұл жанрды жүктеу мүмкін емес.';

  @override
  String get continueReading => 'Оқуды жалғастыру';

  @override
  String get savedHighlights => 'Сақталған ерекшеліктер';

  @override
  String get continueListening => 'Тыңдауды жалғастыру';

  @override
  String get listen => 'Тыңда';

  @override
  String get resume => 'Жалғастыру';

  @override
  String get failedToLoadLibrary => 'Кітапхана жүктелмеді';

  @override
  String get popularNow => 'Қазір танымал';

  @override
  String get savedForLater => 'Кейінірек үшін сақталды';

  @override
  String get topListens => 'Үздік тыңдаушылар';

  @override
  String get unreadDiscoveries => 'Оқылмаған жаңалықтар';

  @override
  String get pickUpAgain => 'Қайтадан алыңыз';

  @override
  String get bookHighlightsDescription =>
      'Маңызды жерлері, таңдаулылары немесе оқылу барысы бар кітаптарыңыз.';

  @override
  String get handPickedFromLibrary => 'Кітапханаңыздан таңдалған.';

  @override
  String get handPickedFromListeningQueue =>
      'Тыңдау кезегінен қолмен таңдалды.';

  @override
  String get booksWithHighlights =>
      'Маңызды жерлері, таңдаулылары немесе оқылу барысы бар кітаптар.';

  @override
  String get jumpBackNarration => 'Орныңызды іздемей, әңгімеге қайта оралыңыз.';

  @override
  String get unreadBooksReady =>
      'Оқылмаған кітаптар келесі тыныш сағатқа дайын.';

  @override
  String get quickAccessFavorites =>
      'Қайта оралатын кітаптарға жылдам қол жеткізу.';

  @override
  String get searchAudiobooks => 'Аудиокітаптарды іздеу';

  @override
  String get searchYourLibrary => 'Кітапханаңызды іздеңіз';

  @override
  String get pickUpStory => 'Әңгімені тоқтаған жерден жалғастырыңыз';

  @override
  String get savedPlacesChapters =>
      'Сақталған орындарыңыз бен аяқталмаған тарауларыңыз';

  @override
  String authorsCount(int count) {
    return '$count автор';
  }

  @override
  String genresCount(int count) {
    return '$count жанр';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% аяқталды';
  }

  @override
  String get readyWhenYouAre => 'Бар кезде дайын';

  @override
  String get details => 'Мәліметтер';

  @override
  String get listeningRoom => 'Тыңдау бөлмесі';

  @override
  String get bookmarksAndProgress => 'Бетбелгілер және орындалу барысы';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Оқуға бағытталған шолу үшін $count атау реттелген.';
  }

  @override
  String get titles => 'Атаулар';

  @override
  String get allTitles => 'Барлық тақырыптар';

  @override
  String get authors => 'Авторлар';

  @override
  String get browseByAuthor => 'Авторы бойынша шолу';

  @override
  String get browseByGenre => 'Жанр бойынша шолу';

  @override
  String get discover => 'Ашу';

  @override
  String get noBookmarkedItems => 'Әлі бетбелгі қойылған элементтер жоқ';

  @override
  String get nothingMatchesSection =>
      'Бұл бөлімге әлі ештеңе сәйкес келмейді. Басқа қойындыны қолданып көріңіз немесе кітапхана синхрондауы аяқталғаннан кейін қайта оралыңыз.';

  @override
  String get audiobooks => 'Аудиокітаптар';

  @override
  String noLabelFound(String label) {
    return '$label табылмады';
  }

  @override
  String get folder => 'Қалта';

  @override
  String get filters => 'Сүзгілер';

  @override
  String get readingStatus => 'Оқу күйі';

  @override
  String get playedStatus => 'Ойналған күй';

  @override
  String get readStatus => 'Оқы';

  @override
  String get watched => 'Қаралған';

  @override
  String get unread => 'Оқылмаған';

  @override
  String get unwatched => 'Қаралмаған';

  @override
  String get seriesStatus => 'Серия күйі';

  @override
  String get allLibraries => 'Барлық кітапханалар';

  @override
  String get books => 'Кітаптар';

  @override
  String get latestBooks => 'Соңғы кітаптар';

  @override
  String get latestAudiobooks => 'Соңғы аудиокітаптар';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count кітап',
      one: '$count кітап',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Кітап';

  @override
  String get bookFormatAudiobook => 'Аудиокітап';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Бұл авторға арналған кітаптар табылмады.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% оқылды';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time қалды';
  }

  @override
  String get bookHeroRead => 'Оқу';

  @override
  String get bookHeroListen => 'Тыңдау';

  @override
  String get author => 'Автор';

  @override
  String get unknownAuthor => 'Белгісіз автор';

  @override
  String get uncategorized => 'Санатсыз';

  @override
  String get overview => 'Шолу';

  @override
  String get noLibrivoxDescription =>
      'Бұл тақырып үшін LibriVox әлі сипаттама бермеген.';

  @override
  String get readers => 'Оқырмандар';

  @override
  String get openLinks => 'Сілтемелерді ашу';

  @override
  String get librivoxPage => 'LibriVox беті';

  @override
  String get internetArchive => 'Интернет мұрағаты';

  @override
  String get rssFeed => 'RSS арнасы';

  @override
  String get downloadZip => 'Zip жүктеп алыңыз';

  @override
  String sectionCountLabel(int count) {
    return '$count бөлім';
  }

  @override
  String firstPublished(int year) {
    return 'Алғаш $year жылы жарық көрген';
  }

  @override
  String get noOpenLibraryOverview =>
      'Бұл тақырып үшін Open Library шолу әлі жоқ.';

  @override
  String get subjects => 'Тақырыптар';

  @override
  String get all => 'Барлығы';

  @override
  String booksCount(int count) {
    return '$count кітап';
  }

  @override
  String get couldNotLoadSubject =>
      'Бұл тақырыпты дәл қазір жүктеу мүмкін емес.';

  @override
  String get audiobookDetails => 'Аудиокітап туралы мәліметтер';

  @override
  String authorsCountTitle(int count) {
    return '$count Автор';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудиокітап',
      one: '$count аудиокітап',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Трек тізімі';

  @override
  String get itemListPlaceholder => 'Элемент тізімі осы жерде пайда болады';

  @override
  String get failedToLoad => 'Жүктелмеді';

  @override
  String get delete => 'Жою';

  @override
  String get save => 'Сақтау';

  @override
  String get moreLikeThis => 'Осыған ұқсас';

  @override
  String get castAndCrew => 'Рөлдер және түсірілім тобы';

  @override
  String get collection => 'Жинақ';

  @override
  String get episodes => 'Эпизодтар';

  @override
  String get nextUp => 'Келесі';

  @override
  String get seasons => 'Маусымдар';

  @override
  String get chapters => 'тараулар';

  @override
  String get features => 'Ерекше өзгешеліктері';

  @override
  String get movies => 'Фильмдер';

  @override
  String get musicVideos => 'Музыкалық бейнелер';

  @override
  String get other => 'Басқа';

  @override
  String get discography => 'Дискография';

  @override
  String get similarArtists => 'Ұқсас суретшілер';

  @override
  String get tableOfContents => 'Мазмұны';

  @override
  String get tracklist => 'Трек тізімі';

  @override
  String discNumber(int number) {
    return '$number-диск';
  }

  @override
  String get biography => 'Өмірбаяны';

  @override
  String get authorDetails => 'Автор туралы мәліметтер';

  @override
  String get noOverviewAvailable => 'Бұл тақырыпқа шолу әлі жоқ.';

  @override
  String get noBiographyAvailable => 'Бұл автордың өмірбаяны жоқ.';

  @override
  String get unableToLoadAuthorDetails =>
      'Дәл қазір автор туралы мәліметтерді жүктеу мүмкін емес.';

  @override
  String published(int year) {
    return '$year жылы жарық көрген';
  }

  @override
  String get publicationDateUnknown => 'Жарияланатын күні белгісіз';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Маусым',
      one: '$count Маусым',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time аяқталады';
  }

  @override
  String get items => 'Элементтер';

  @override
  String get extras => 'Қосымшалар';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Сахна артында';

  @override
  String get deletedScenes => 'Жойылған көріністер';

  @override
  String get featurettes => 'Қысқа сюжеттер';

  @override
  String get interviews => 'Сұхбаттар';

  @override
  String get scenes => 'Көріністер';

  @override
  String get shorts => 'Қысқаметражды фильмдер';

  @override
  String get trailers => 'Трейлерлер';

  @override
  String timeRemaining(String time) {
    return '$time қалды';
  }

  @override
  String endsIn(String time) {
    return '$time кейін аяқталады';
  }

  @override
  String get view => 'Көру';

  @override
  String get resumeReading => 'Оқуды жалғастыру';

  @override
  String get read => 'Оқы';

  @override
  String resumeFrom(String position) {
    return '$position орнынан жалғастыру';
  }

  @override
  String get play => 'Ойнату';

  @override
  String get startOver => 'Қайтадан бастау';

  @override
  String get restart => 'Қайтадан қосу';

  @override
  String get readOffline => 'Офлайн оқу';

  @override
  String get playOffline => 'Офлайн ойнаңыз';

  @override
  String get audio => 'Аудио';

  @override
  String get subtitles => 'Субтитрлер';

  @override
  String get version => 'Нұсқа';

  @override
  String get cast => 'Трансляциялау';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Трейлер';

  @override
  String get finished => 'Аяқталды';

  @override
  String get favorited => 'Таңдаулы';

  @override
  String get favorite => 'Таңдаулы';

  @override
  String get playlist => 'Ойнату тізімі';

  @override
  String get downloaded => 'Жүктеп алынды';

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
  String get downloadAll => 'Барлығын жүктеп алыңыз';

  @override
  String get download => 'Жүктеп алу';

  @override
  String get deleteDownloaded => 'Жүктеп алынғанды ​​жою';

  @override
  String get goToSeries => 'Серияға өтіңіз';

  @override
  String get editMetadata => 'Метадеректерді өңдеу';

  @override
  String get less => 'Аздау';

  @override
  String get more => 'Көбірек';

  @override
  String get deleteItem => 'Элементті жою';

  @override
  String get deletePlaylist => 'Ойнату тізімін жою';

  @override
  String get deletePlaylistMessage =>
      'Бұл ойнату тізімін серверден жою керек пе?';

  @override
  String get deleteItemMessage => 'Бұл элементті серверден жою керек пе?';

  @override
  String get failedToDeletePlaylist => 'Ойнату тізімін жою мүмкін болмады';

  @override
  String get failedToDeleteItem => 'Элементті жою мүмкін болмады';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Ойнату тізімінің атын өзгерту';

  @override
  String get playlistName => 'Ойнату тізімінің аты';

  @override
  String get deleteDownloadedAlbum => 'Жүктеп алынған альбомды жою';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '«$title» үшін жүктелген тректер жойылсын ба?';
  }

  @override
  String get downloadedTracksDeleted => 'Жүктеп алынған тректер жойылды';

  @override
  String get downloadedTracksDeleteFailed =>
      'Кейбір жүктеп алынған тректерді жою мүмкін болмады';

  @override
  String get noTracksLoaded => 'Жүктелген тректер жоқ';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel жүктелмеген';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title жүктелуде ($count элемент)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return '«$name» серверден жойылсын ба? Бұл әрекетті қайтару мүмкін емес.';
  }

  @override
  String get itemDeleted => 'Элемент жойылды';

  @override
  String get noPlayableTrailerFound => 'Ойналатын трейлер табылмады.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Қолдау көрсетілмейтін кітап пішімі: .$extension';
  }

  @override
  String get audioTrack => 'Аудио трек';

  @override
  String get subtitleTrack => 'Субтитр жолы';

  @override
  String get none => 'Жоқ';

  @override
  String get downloadSubtitlesLabel => 'Субтитрлерді жүктеп алу...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles плагинін пайдаланып іздеңіз';

  @override
  String get downloadSubtitles => 'Субтитрлерді жүктеп алыңыз';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'Таңдалған субтитр жарамсыз.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Субтитр жүктелді және таңдалды: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Субтитр жүктеп алынды. Jellyfin элементті жаңартқанда пайда болуына біраз уақыт кетуі мүмкін.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language тілі үшін қашықтағы субтитрлер табылмады.';
  }

  @override
  String get selectVersion => 'Нұсқа таңдаңыз';

  @override
  String versionNumber(int number) {
    return '$number-нұсқа';
  }

  @override
  String get downloadAllQuality => 'Барлығын жүктеп алу — сапалы';

  @override
  String get downloadQuality => 'Жүктеп алу сапасы';

  @override
  String get originalFileNoReencoding => 'Түпнұсқа файл, қайта кодтау жоқ';

  @override
  String get originalFilesNoReencoding => 'Түпнұсқа файлдар, қайта кодтау жоқ';

  @override
  String get noEpisodesLoaded => 'Жүктелген эпизодтар жоқ';

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
    return '$name жүктелуде ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Жүктелген файлдарды жою';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel үшін жергілікті файлдар жойылсын ба?\n\nБұл жад орнын босатады. Кейінірек қайта жүктей аласыз.';
  }

  @override
  String get downloadedFilesDeleted => 'Жүктеп алынған файлдар жойылды';

  @override
  String get failedToDeleteFiles => 'Файлдарды жою мүмкін болмады';

  @override
  String get deleteFiles => 'Файлдарды жою';

  @override
  String get director => 'ДИРЕКТОР';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'РЕЖИССЁРЛЕР';

  @override
  String get writer => 'СЦЕНАРИСТ';

  @override
  String get writers => 'СЦЕНАРИСТЕР';

  @override
  String get studio => 'СТУДИЯ';

  @override
  String studioMoreCount(int count) {
    return '+$count тағы';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Эпизод';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '$number-эпизод';
  }

  @override
  String chapterNumber(int number) {
    return '$number-тарау';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count трек',
      one: '$count трек',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count тарау',
      one: '$count тарау',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Туған күні: $date';
  }

  @override
  String died(String date) {
    return 'Қайтыс болған күні: $date';
  }

  @override
  String age(int age) {
    return 'Жасы: $age';
  }

  @override
  String get showLess => 'Аз көрсету';

  @override
  String get readMore => 'Толығырақ оқу';

  @override
  String get shuffle => 'Араластыру';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Барлық музыканы араластыру';

  @override
  String get carSignInPrompt => 'Телефоныңызда Moonfin-ге кіріңіз';

  @override
  String get carServerUnreachable => 'Серверге қосылу мүмкін емес';

  @override
  String downloadsCount(int count) {
    return '$count жүктеу';
  }

  @override
  String get perfectMatch => 'Керемет сәйкестік';

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
    return 'Қашықтағы субтитрді $action үшін бұл пайдаланушыға Jellyfin субтитрлерін басқару рұқсаты қажет.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Қашықтағы субтитрді $action үшін бұл элемент серверде табылмады.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Қашықтағы субтитрді $action орындалмады: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Қашықтағы субтитрді $action орындалмады (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Қашықтағы субтитрлерді $action мүмкін болмады.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '«$name» үшін жүктелген барлық эпизодтар';
  }

  @override
  String get deleteSeasonFiles =>
      'осы маусымдағы барлық жүктеп алынған эпизодтар';

  @override
  String get stillWatching => 'Әлі қарайсыз ба?';

  @override
  String get unableToLoadTrailerStream => 'Трейлер ағынын жүктеу мүмкін емес.';

  @override
  String get trailerTimedOut =>
      'Жүктеу кезінде трейлердің күту уақыты аяқталды.';

  @override
  String get playbackFailedForTrailer => 'Бұл трейлер ойнатылмады.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Офлайн ойнату кезінде трансляциялау мүмкін емес.';

  @override
  String castActionFailed(String label, String error) {
    return '$label әрекеті орындалмады: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Cast дыбыс деңгейін орнату мүмкін болмады: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label басқару элементтері';
  }

  @override
  String get deviceVolume => 'Құрылғының дыбыс деңгейі';

  @override
  String get unavailable => 'Қолжетімсіз';

  @override
  String get pause => 'Кідірту';

  @override
  String get syncPosition => 'Синхрондау орны';

  @override
  String stopCast(String label) {
    return '$label тоқтату';
  }

  @override
  String get queueIsEmpty => 'Кезек бос';

  @override
  String trackNumber(int number) {
    return '$number-трек';
  }

  @override
  String get remotePlayback => 'Қашықтан ойнату';

  @override
  String get castingToGoogleCast => 'Google Cast қызметіне трансляциялау';

  @override
  String get castingViaAirPlay => 'AirPlay арқылы трансляциялау';

  @override
  String get castingViaDlna => 'DLNA арқылы трансляция';

  @override
  String secondsCount(int seconds) {
    return '$seconds секунд';
  }

  @override
  String get longPressToUnlock => 'Құлыпты ашу үшін ұзақ басыңыз';

  @override
  String get off => 'Өшірулі';

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
  String get audioDelay => 'Дыбыс кідірісі';

  @override
  String delayMinusMs(int value) {
    return '-$value мс';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value мс';
  }

  @override
  String get subtitleDelay => 'Субтитрді кешіктіру';

  @override
  String get reset => 'Қалпына келтіру';

  @override
  String get unknown => 'Белгісіз';

  @override
  String get playbackInformation => 'Ойнату туралы ақпарат';

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
  String get playback => 'Ойнату';

  @override
  String get playMethod => 'Ойын әдісі';

  @override
  String get directPlay => 'Тікелей ойнату';

  @override
  String get directStream => 'Тікелей ағын';

  @override
  String get transcoding => 'Транскодтау';

  @override
  String get transcodeReasons => 'Транскодтың себептері';

  @override
  String get player => 'Ойнатқыш';

  @override
  String get container => 'Контейнер';

  @override
  String get bitrate => 'Бит жылдамдығы';

  @override
  String get video => 'Бейне';

  @override
  String get resolution => 'Ажыратымдылық';

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
  String get track => 'Трек';

  @override
  String get channels => 'Арналар';

  @override
  String get format => 'Формат';

  @override
  String get external => 'Сыртқы';

  @override
  String get embedded => 'Ендірілген';

  @override
  String castSessionError(String protocol) {
    return '$protocol сеансының қатесі';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Кітап мәліметтерін жүктеу мүмкін болмады: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Қолданбада EPUB көрсету бұл платформада әлі қолжетімді емес.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Бұл пішім (.$extension) қолданбада әзірге көрсетілмейді.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Бұл платформада ендірілген құжатты көрсету мүмкін емес.';

  @override
  String get couldNotOpenExternalViewer =>
      'Сыртқы қарау құралын ашу мүмкін болмады.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Кірістірілген оқу құралын ашу мүмкін болмады: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label орнында бетбелгі бұрыннан сақталған.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Бетбелгі қосылды: $label';
  }

  @override
  String get noBookmarksYet =>
      'Әлі бетбелгілер жоқ.\nОрныңызды сақтау үшін оқу кезінде бетбелгі белгішесін түртіңіз.';

  @override
  String get noTableOfContentsAvailable => 'Мазмұны жоқ';

  @override
  String pageLabel(int number) {
    return '$number-бет';
  }

  @override
  String get position => 'Позиция';

  @override
  String get bookReader => 'Кітап оқу құралы';

  @override
  String formatExtension(String extension) {
    return 'Пішім: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% оқылды';
  }

  @override
  String get updating => 'Жаңарту...';

  @override
  String get markUnread => 'Оқылмаған деп белгілеу';

  @override
  String get markAsRead => 'Оқылған деп белгілеңіз';

  @override
  String get reloadReader => 'Оқу құралын қайта жүктеңіз';

  @override
  String get noPagesFound => 'Ешбір бет табылмады.';

  @override
  String get failedToDecodePageImage => 'Бет кескінін декодтау мүмкін болмады.';

  @override
  String resetZoom(String zoom) {
    return 'Масштабты ысыру (${zoom}x)';
  }

  @override
  String get singlePage => 'Бір бет';

  @override
  String get twoPageSpread => 'Екі беттік тарату';

  @override
  String get addBookmark => 'Бетбелгі қосу';

  @override
  String get bookmarksEllipsis => 'Бетбелгілер...';

  @override
  String get markedAsRead => 'Оқылған деп белгіленген';

  @override
  String get markedAsUnread => 'Оқылмаған деп белгіленді';

  @override
  String failedToUpdateReadState(String error) {
    return 'Оқылу күйін жаңарту мүмкін болмады: $error';
  }

  @override
  String get themeSystem => 'Тақырыбы: Жүйе';

  @override
  String get themeLight => 'Тақырыбы: Жарық';

  @override
  String get themeDark => 'Тақырыбы: Қараңғы';

  @override
  String get themeSepia => 'Тақырыбы: Сепия';

  @override
  String get invertColorsFixedLayout =>
      'Түстерді инверттеу (бекітілген орналасу)';

  @override
  String get invertColorsPdf => 'Түстерді өзгерту (PDF)';

  @override
  String get preparingInAppReader => 'Қолданбадағы оқу құралы дайындалуда...';

  @override
  String get pdfDataNotAvailable => 'PDF деректері қолжетімді емес.';

  @override
  String get readerFallbackModeActive =>
      'Оқырманның қалпына келтіру режимі белсенді';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Бұл платформа $extension файлдары үшін кірістірілген құжат жүйесін іске қоса алмайды.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Қолдау көрсетілетін платформа мақсатына (Android, iOS, macOS) ауысқаннан кейін Reload Reader бағдарламасын пайдаланыңыз.';

  @override
  String get openExternally => 'Сырттай ашу';

  @override
  String get noEpubChaptersFound => 'EPUB тараулары табылмады.';

  @override
  String get readerNotReady => 'Оқырман дайын емес.';

  @override
  String get seriesRecordings => 'Сериялық жазбалар';

  @override
  String get now => 'Қазір';

  @override
  String get sports => 'Спорт';

  @override
  String get news => 'Жаңалықтар';

  @override
  String get kids => 'Балалар';

  @override
  String get premiere => 'Премьера';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Нұсқаулық хронологиясы';

  @override
  String failedToLoadGuide(String error) {
    return 'Бағдарламаны жүктеу мүмкін болмады: $error';
  }

  @override
  String get noChannelsFound => 'Ешбір арна табылмады';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'ТІКЕЛЕЙ ЭФИР';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Келесі: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes мин қалды';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours сағ қалды';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours сағ $minutes мин қалды';
  }

  @override
  String get movie => 'Фильм';

  @override
  String get removedFromFavoriteChannels => 'Таңдаулы арналардан жойылды';

  @override
  String get addedToFavoriteChannels => 'Таңдаулы арналарға қосылды';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Таңдаулы арнаны жаңарту мүмкін болмады';

  @override
  String get unfavoriteChannel => 'Таңдаулы емес арна';

  @override
  String get favoriteChannel => 'Сүйікті арна';

  @override
  String get record => 'Жазу';

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
  String get cancelRecordingAction => 'Жазуды болдырмау';

  @override
  String get programSetToRecord => 'Бағдарлама жазуға қойылды';

  @override
  String get recordingCancelled => 'Жазу болдырылмады';

  @override
  String get unableToCreateRecording => 'Жазу жасау мүмкін болмады';

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
  String get watch => 'Қарау';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Жабу';

  @override
  String failedToPlayChannel(String name) {
    return '$name ойнату мүмкін болмады';
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
  String get failedToLoadRecordings => 'Жазбалар жүктелмеді';

  @override
  String get scheduledInNext24Hours => 'Келесі 24 сағатта жоспарланған';

  @override
  String get recentRecordings => 'Соңғы жазбалар';

  @override
  String get tvSeries => 'Телехикая';

  @override
  String get failedToLoadSchedule => 'Кесте жүктелмеді';

  @override
  String get noScheduledRecordings => 'Жоспарланған жазбалар жоқ';

  @override
  String get cancelRecording => 'Жазуды тоқтату керек пе?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '«$name» жоспарланған жазуы болдырылмасын ба?';
  }

  @override
  String get no => 'Жоқ';

  @override
  String get yesCancel => 'Иә, Бас тарту';

  @override
  String get failedToCancelRecording => 'Жазудан бас тарту мүмкін болмады';

  @override
  String get failedToLoadSeriesRecordings => 'Сериялық жазбалар жүктелмеді';

  @override
  String get noSeriesRecordings => 'Сериялық жазбалар жоқ';

  @override
  String get cancelSeriesRecording => 'Сериялық жазудан бас тарту';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Сериялық жазудан бас тарту керек пе?';

  @override
  String stopRecordingName(String name) {
    return '«$name» жазуы тоқтатылсын ба?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Сериялық жазудан бас тарту мүмкін болмады';

  @override
  String get searchThisLibrary => 'Осы кітапхананы іздеу...';

  @override
  String get searchEllipsis => 'Іздеу...';

  @override
  String noResultsForQuery(String query) {
    return '«$query» бойынша нәтиже жоқ';
  }

  @override
  String searchFailedError(String error) {
    return 'Іздеу орындалмады: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr тіркелгі түрі';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Жергілікті';

  @override
  String get savedMedia => 'Сақталған медиа';

  @override
  String get tvShows => 'Телешоулар';

  @override
  String get music => 'Музыка';

  @override
  String get musicAlbums => 'Музыкалық альбомдар';

  @override
  String get noMediaInFilter => 'Бұл сүзгіде медиа жоқ';

  @override
  String get noDownloadedMediaYet => 'Жүктеп алынған медиа әлі жоқ';

  @override
  String get browseLibrary => 'Кітапхананы шолу';

  @override
  String get deleteDownload => 'Жүктеп алуды жою';

  @override
  String removeItemAndFiles(String name) {
    return '«$name» және оның файлдары жойылсын ба?';
  }

  @override
  String tracksCount(int count) {
    return '$count трек';
  }

  @override
  String get album => 'Альбом';

  @override
  String get playAlbum => 'Альбомды ойнату';

  @override
  String failedToLoadAlbum(String error) {
    return 'Альбомды жүктеу мүмкін болмады: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name үшін жүктелген тректер табылмады.';
  }

  @override
  String get season => 'Маусым';

  @override
  String get errorLoadingEpisodes => 'Эпизодтарды жүктеу қатесі';

  @override
  String get noDownloadedEpisodes => 'Жүктеп алынған эпизодтар жоқ';

  @override
  String get deleteEpisode => 'Эпизодты жою';

  @override
  String removeName(String name) {
    return '«$name» жойылсын ба?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'М$season Э$episode';
  }

  @override
  String episodeNumber(int number) {
    return '$number-эпизод';
  }

  @override
  String get seriesNotFound => 'Серия табылмады';

  @override
  String get errorLoadingSeries => 'Серияларды жүктеу қатесі';

  @override
  String get downloadedEpisodes => 'Жүктеп алынған эпизодтар';

  @override
  String seasonNumber(int number) {
    return '$number-маусым';
  }

  @override
  String seasonChip(int number) {
    return 'М$number';
  }

  @override
  String get specials => 'Ерекшеліктер';

  @override
  String get deleteSeason => 'Маусымды жою';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '$season ішіндегі барлық жүктелген эпизодтар жойылсын ба?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count эпизод',
      one: '$count эпизод',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Сақтауды басқару';

  @override
  String get storageBreakdown => 'Жадтың бұзылуы';

  @override
  String get downloadedItems => 'Жүктеп алынған элементтер';

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
  String get storageLimit => 'Сақтау шегі';

  @override
  String get noLimit => 'Шектеу жоқ';

  @override
  String get deleteAllDownloads => 'Барлық жүктеулерді жою';

  @override
  String get deleteAllDownloadsWarning =>
      'Бұл барлық жүктелген медиа файлдарды жояды және оны қайтару мүмкін емес.';

  @override
  String get deleteAll => 'Барлығын жою';

  @override
  String get deleteSelected => 'Таңдалғанды ​​жою';

  @override
  String deleteSelectedCount(int count) {
    return '$count жүктелген элемент жойылсын ба?';
  }

  @override
  String get musicAndAudiobooks => 'Музыка және аудиокітаптар';

  @override
  String get images => 'Суреттер';

  @override
  String get database => 'Мәліметтер қоры';

  @override
  String ofStorageLimit(String limit) {
    return '$limit шегінен';
  }

  @override
  String get settings => 'Параметрлер';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Аутентификация';

  @override
  String get autoLoginServerManagement =>
      'Автоматты түрде кіру, серверді басқару';

  @override
  String get pinCode => 'PIN коды';

  @override
  String get setUpPinCodeProtection => 'PIN кодты қорғауды орнатыңыз';

  @override
  String get parentalControls => 'Ата-ана бақылауы';

  @override
  String get contentRatingRestrictions => 'Мазмұнды бағалауға шектеулер';

  @override
  String get bitRateResolutionBehavior =>
      'Бит жылдамдығы, ажыратымдылық, мінез-құлық';

  @override
  String get languageSizeAppearance => 'Тілі, көлемі, сыртқы түрі';

  @override
  String get qualityStorage => 'Сапа, сақтау';

  @override
  String get mediaRequestIntegration => 'Медиа сұранысты біріктіру';

  @override
  String get switchServer => 'Серверді ауыстыру';

  @override
  String get signOut => 'Шығу';

  @override
  String get versionLicenses => 'Нұсқа, лицензиялар';

  @override
  String get account => 'Есептік жазба';

  @override
  String get signInAndSecurity => 'Жүйеге кіру және қауіпсіздік';

  @override
  String get administration => 'Әкімшілік';

  @override
  String get serverSettingsUsersLibraries =>
      'Сервер параметрлері, пайдаланушылар, кітапханалар';

  @override
  String get customization => 'Баптау';

  @override
  String get themeAndLayout => 'Тақырып және орналасу';

  @override
  String get videoAndSubtitles => 'Бейне және субтитрлер';

  @override
  String get pluginAndRequests => 'Плагин және сұраулар';

  @override
  String get customizeAccountPlaybackInterface =>
      'Тіркелгіні, ойнатуды және интерфейс әрекетін теңшеңіз';

  @override
  String optionsCount(int count) {
    return '$count параметр';
  }

  @override
  String get themeAndAppearance => 'Тақырып және сыртқы түрі';

  @override
  String get focusBorderColor => 'Жиек түсі';

  @override
  String get watchedIndicators => 'Қаралған көрсеткіштер';

  @override
  String get always => 'Әрқашан';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Қаралмағандарды жасыру';

  @override
  String get episodesOnly => 'Тек эпизодтар';

  @override
  String get never => 'Ешқашан';

  @override
  String get focusExpansionAnimation => 'Фокусты кеңейту анимациясы';

  @override
  String get desktopUiScale =>
      'Жұмыс үстелінің пайдаланушы интерфейсі масштабы';

  @override
  String get scaleFocusedCards =>
      'Фокусталған немесе жылжытылған карталар мен тақтайшаларды масштабтаңыз';

  @override
  String get seriesThumbnails => 'Нобайлар сериясы';

  @override
  String get seriesThumbnailsDescription =>
      'Тек эпизодтар: әр жол кескін түріне сәйкес келетін сериялық өнер туындысын пайдаланыңыз';

  @override
  String get homeRowInfoOverlay => 'Басты жол ақпаратының қабаттасуы';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Негізгі жолдарды шолу кезінде тақырып пен метадеректерді көрсету';

  @override
  String get clockDisplay => 'Сағат дисплейі';

  @override
  String get inMenus => 'Мәзірлерде';

  @override
  String get inVideo => 'Бейнеде';

  @override
  String get seasonalEffects => 'Маусымдық әсерлер';

  @override
  String get seasonalEffectsDescription =>
      'Көрнекі әсерлер және маусымдық декорациялар';

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
  String get snow => 'Қар';

  @override
  String get fireworks => 'Отшашу';

  @override
  String get confetti => 'Конфетти';

  @override
  String get fallingLeaves => 'Жапырақтардың түсуі';

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
  String get themeMusic => 'Тақырыптық музыка';

  @override
  String get playThemeMusicOnDetailPages =>
      'Тақырыптық музыканы егжей-тегжейлі беттерде ойнатыңыз';

  @override
  String get themeMusicVolume => 'Тақырыптық музыка көлемі';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Негізгі қатарлардағы тақырыптық музыка';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Негізгі экранды шолу кезінде ойнату';

  @override
  String get loopThemeMusic => 'Тақырыптық музыканы қайталау';

  @override
  String get loopThemeMusicSubtitle =>
      'Тректі бір рет ойнатудың орнына циклмен қайталау';

  @override
  String get detailsBackgroundBlur => 'Мәліметтер Фонды бұлыңғырлау';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value пикс';
  }

  @override
  String get browsingBackgroundBlur => 'Шолуда фондық бұлыңғыр';

  @override
  String get maxStreamingBitrate => 'Ағынның максималды бит жылдамдығы';

  @override
  String get maxResolution => 'Максималды ажыратымдылық';

  @override
  String get playerZoomMode => 'Ойыншының масштабтау режимі';

  @override
  String get settingsScrollWheelAction => 'Тінтуір дөңгелегі';

  @override
  String get settingsScrollWheelActionDescription =>
      'Ойнату кезінде бейне үстінде тінтуір дөңгелегін айналдыру не істейтінін таңдаңыз.';

  @override
  String get scrollWheelActionOff => 'Өшірулі';

  @override
  String get scrollWheelActionSeek => 'Айналдыру (алға / артқа)';

  @override
  String get scrollWheelActionVolume => 'Дыбыс деңгейі';

  @override
  String get playerTooltipVolume => 'Дыбыс деңгейі';

  @override
  String get fit => 'Сәйкес';

  @override
  String get autoCrop => 'Автоматты қию';

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
  String get stretch => 'Созылу';

  @override
  String get refreshRateSwitching => 'Жаңарту жылдамдығын ауыстыру';

  @override
  String get disabled => 'Өшірілген';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Теледидарда масштабтау';

  @override
  String get scaleOnDevice => 'Құрылғыдағы масштабтау';

  @override
  String get trickPlay => 'Трик ойнау';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Іздеу кезінде алдын ала қарау нобайларын көрсетіңіз';

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
  String get showDescriptionOnPause => 'Сипаттаманы кідіртуде көрсету';

  @override
  String get dimVideoShowOverview =>
      'Бейнені күңгірттеңіз және кідірту кезінде шолу мәтінін көрсетіңіз';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD құлыптау түймесі';

  @override
  String get osdLockButtonDescription =>
      'Ұзақ басылғанша сенсорлық енгізуді блоктайтын құлыптау түймесін көрсетіңіз';

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
  String get audioBehavior => 'Аудио мінез-құлық';

  @override
  String get downmixToStereo => 'Стереоға дейін араластырыңыз';

  @override
  String get defaultAudioLanguage => 'Әдепкі аудио тілі';

  @override
  String get fallbackAudioLanguage => 'Резервтік аудио тілі';

  @override
  String get preferDefaultAudioTrack => 'Әдепкі аудиотрек таңдалсын';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Локализацияланған дубляждың орнына түпнұсқа аудиотректі таңдау.';

  @override
  String get preferAudioDescription => 'Аудиосипаттама тректері таңдалсын';

  @override
  String get preferAudioDescriptionDescription =>
      'Қарапайым тректердің орнына аудиосипаттама тректерін таңдау.';

  @override
  String get autoServerDefault => 'Авто (Сервердің әдепкі)';

  @override
  String get english => 'Ағылшын';

  @override
  String get spanish => 'испан';

  @override
  String get french => 'француз';

  @override
  String get german => 'неміс';

  @override
  String get italian => 'итальян';

  @override
  String get portuguese => 'португал';

  @override
  String get japanese => 'жапон';

  @override
  String get korean => 'корей';

  @override
  String get chinese => 'қытай';

  @override
  String get russian => 'орыс';

  @override
  String get arabic => 'араб';

  @override
  String get hindi => 'хинди';

  @override
  String get dutch => 'голланд';

  @override
  String get swedish => 'швед';

  @override
  String get norwegian => 'норвег';

  @override
  String get danish => 'дат';

  @override
  String get finnish => 'фин';

  @override
  String get polish => 'поляк';

  @override
  String get ac3Passthrough => 'AC3 өту жолы';

  @override
  String get dtsPassthrough => 'DTS өту жолы';

  @override
  String get trueHdSupport => 'TrueHD қолдауы';

  @override
  String get enableDtsPassthrough =>
      'DTS дыбысының биттік ағыны тек AVR үшін; ресивер қолдауын және DTS бастапқы жолын қажет етеді';

  @override
  String get settingsAudioFallbackCodec => 'Резервтік аудиокодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Бастапқы ағынды тікелей ойнату немесе транзитпен жіберу мүмкін болмағанда, көпарналы аудионы транскодтайтын мақсатты пішімді таңдаңыз.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Автоанықтау\n(ұсынылады)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(әдепкі)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(тек стерео)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(үнемді)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(шығынсыз)';

  @override
  String get settingsMaxAudioChannels => 'Ең көп аудиоарна';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Аудиожүйеңіздің ең көп арна санын реттеңіз. Осы шектен асатын көпарналы ағындар араластырылады немесе транскодталады.';

  @override
  String get settingsMaxAudioChannelsAuto => 'Автоанықтау\n(жабдық әдепкісі)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Моно';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Стерео';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Көлемді дыбыс';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Квадрофониялық';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Көлемді дыбыс';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Көлемді дыбыс';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Көлемді дыбыс';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Көлемді дыбыс';

  @override
  String get settingsAudioPassthroughAdvanced => 'Транзит (кеңейтілген)';

  @override
  String get settingsAudioCodecPassthrough => 'Кодек транзиті';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Тек AVR немесе HDMI қабылдағышыңыз қолдайтын пішімдерді қосыңыз.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 транзиті';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core транзиті';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA транзиті';

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
  String get settingsAudioTrueHdPassthrough => 'TrueHD транзиті';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Анықталған аудио мүмкіндіктері';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Орындалу кезіндегі мүмкіндіктер туралы дерек әзірге жоқ.';

  @override
  String get settingsAudioRouteLabel => 'Бағыт';

  @override
  String get settingsAudioDecodeLabel => 'Декодтау';

  @override
  String get settingsAudioPassthroughLabel => 'Транзит';

  @override
  String get settingsAudioHdRoute => 'HD аудио бағыты';

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
  String get settingsAudioRouteHeadphones => 'Құлаққап';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count арна PCM';
  }

  @override
  String get nightMode => 'Түнгі режим';

  @override
  String get compressDynamicRange => 'Динамикалық диапазонды қысу';

  @override
  String get advancedMpv => 'Жетілдірілген mpv';

  @override
  String get enableCustomMpvConf => 'Custom mpv.conf мүмкіндігін қосыңыз';

  @override
  String get applyMpvConfBeforePlayback =>
      'Ойнату басталғанға дейін пайдаланушы көрсеткен mpv.conf файлын қолданыңыз';

  @override
  String get unsafeAdvancedMpvOptions => 'Қауіпті кеңейтілген mpv опциялары';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv опцияларының кеңірек жинағына рұқсат етіңіз. Ойнату әрекетін бұзуы мүмкін.';

  @override
  String get hardwareDecoding => 'Аппараттық құралдарды декодтау';

  @override
  String get hardwareDecodingSubtitle =>
      'Өнімділікті жақсартуы мүмкін, бірақ кейбір құрылғыларда ойнату мәселелерін тудыруы мүмкін.';

  @override
  String get nextUpAndQueuing => 'Келесі және кезек';

  @override
  String get nextUpDisplay => 'Келесі дисплей';

  @override
  String get extended => 'Ұзартылған';

  @override
  String get minimal => 'Минималды';

  @override
  String get nextUpTimeout => 'Келесі күту уақыты';

  @override
  String secondsValue(int value) {
    return '$value с';
  }

  @override
  String get mediaQueuing => 'БАҚ кезегі';

  @override
  String get autoQueueNextEpisodes =>
      'Келесі эпизодтарды автоматты түрде кезекке қою';

  @override
  String get stillWatchingPrompt => 'Сұрау әлі де қаралуда';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes эпизодтан / $hours сағаттан кейін';
  }

  @override
  String get resumeAndSkip => 'Жалғастыру және өткізіп жіберу';

  @override
  String get resumeRewind => 'Артқа айналдыруды жалғастыру';

  @override
  String get unpauseRewind => 'Артқа айналдыруды тоқтату';

  @override
  String get fiveSeconds => '5 секунд';

  @override
  String get tenSeconds => '10 секунд';

  @override
  String get fifteenSeconds => '15 секунд';

  @override
  String get thirtySeconds => '30 секунд';

  @override
  String get skipBackLength => 'Артқа ұзындықты өткізіп жіберу';

  @override
  String get skipForwardLength => 'Алға ұзындықты өткізіп жіберу';

  @override
  String get customMpvConfPath => 'Теңшелетін mpv.conf жолы';

  @override
  String get notSetMpvConf =>
      'Орнатылмаған. Moonfin қолданба/деректер қалталарында әдепкі mpv.conf файлын қолданып көреді.';

  @override
  String get selectMpvConf => 'mpv.conf таңдаңыз';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Мәнер параметрлері (өлшем, түс, офсет) мәтінге негізделген субтитрлерге (SRT, VTT, TTML) қолданылады. ASS/SSA субтитрлері \"ASS/SSA Direct Play\" өшірілмейінше, өздерінің кірістірілген стилін пайдаланады. Растрлық субтитрлерді (PGS, DVB, VobSub) қайта стильдеу мүмкін емес.';

  @override
  String get defaultSubtitleLanguage => 'Әдепкі субтитр тілі';

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
  String get defaultToNoSubtitles => 'Әдепкі бойынша Субтитрлер жоқ';

  @override
  String get turnOffSubtitlesByDefault =>
      'Әдепкі бойынша субтитрлерді өшіріңіз';

  @override
  String get subtitleSize => 'Субтитр өлшемі';

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
  String get textFillColor => 'Мәтінді толтыру түсі';

  @override
  String get backgroundColor => 'Фон түсі';

  @override
  String get textStrokeColor => 'Мәтін штрих түсі';

  @override
  String get subtitleCustomization => 'Субтитрді теңшеу';

  @override
  String get subtitleCustomizationDescription => 'Субтитр көрінісін реттеңіз';

  @override
  String get subtitleMode => 'Субтитр режимі';

  @override
  String get subtitleModeFlagged => 'Белгіленген';

  @override
  String get subtitleModeAlways => 'Әрқашан';

  @override
  String get subtitleModeForeign => 'Шет тіліндегі';

  @override
  String get subtitleModeForced => 'Мәжбүрлі';

  @override
  String get subtitleModeFlaggedDescription =>
      'Медиафайл метадеректерінде «default» немесе «forced» деп белгіленген тректерді ойнатады.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Бейне басталған сайын субтитрлерді автоматты түрде жүктеп көрсетеді.';

  @override
  String get subtitleModeForeignDescription =>
      'Әдепкі аудиотрек шет тілінде болса, субтитрлерді автоматты түрде қосады.';

  @override
  String get subtitleModeForcedDescription =>
      'Тек метадеректерде forced деп белгіленген субтитрлерді жүктейді.';

  @override
  String get subtitleModeNoneDescription =>
      'Субтитрлерді автоматты жүктеуді толығымен өшіреді.';

  @override
  String get fallbackSubtitleLanguage => 'Резервтік субтитр тілі';

  @override
  String get subtitleStream => 'Субтитр ағыны';

  @override
  String get subtitlePreviewText =>
      'Жылдам қоңыр түлкі жалқау иттің үстінен секіреді';

  @override
  String get verticalOffset => 'Тік ығысу';

  @override
  String get pgsDirectPlay => 'PGS тікелей ойнату';

  @override
  String get directPlayPgsSubtitles => 'PGS субтитрлерін тікелей ойнату';

  @override
  String get assSsaDirectPlay => 'ASS/SSA тікелей ойнату';

  @override
  String get directPlayAssSsaSubtitles => 'ASS/SSA субтитрлерін тікелей ойнату';

  @override
  String get white => 'Ақ';

  @override
  String get black => 'Қара';

  @override
  String get yellow => 'Сары';

  @override
  String get green => 'Жасыл';

  @override
  String get cyan => 'Көгілдір';

  @override
  String get red => 'Қызыл';

  @override
  String get transparent => 'Мөлдір';

  @override
  String get semiTransparentBlack => 'Жартылай мөлдір қара';

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
  String get global => 'Ғаламдық';

  @override
  String get desktop => 'Жұмыс үстелі';

  @override
  String get mobile => 'Ұялы';

  @override
  String get tv => 'теледидар';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile профилінің параметрлері жүктелді.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile профилінің параметрлерін жүктеу мүмкін болмады.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Жергілікті параметрлер $profile профиліне синхрондалды.';
  }

  @override
  String get syncing => 'Синхрондалуда...';

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
  String get profileSyncHidden => 'Профильді синхрондау жасырын';

  @override
  String get enablePluginSyncDescription =>
      'Профильді басқару элементтерін осы жерде көрсету үшін Плагин параметрлерінде Сервер плагинін синхрондауды қосыңыз.';

  @override
  String get quality => 'Сапасы';

  @override
  String get defaultDownloadQuality => 'Әдепкі жүктеп алу сапасы';

  @override
  String get network => 'Желі';

  @override
  String get wifiOnlyDownloads => 'Тек WiFi жүктеп алулар';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Жүктеулерді серверде көрсету';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Сервер әкімшісіне басқару тақтасында транскодталған жүктеулеріңізді көруге рұқсат ету';

  @override
  String get onlyDownloadOnWifi =>
      'WiFi желісіне қосылған кезде ғана жүктеп алыңыз';

  @override
  String get storage => 'Сақтау';

  @override
  String get storageUsed => 'Қолданылатын сақтау орны';

  @override
  String get manage => 'Басқару';

  @override
  String get calculating => 'Есептелуде...';

  @override
  String get downloadLocation => 'Орын жүктеп алыңыз';

  @override
  String get defaultLabel => 'Әдепкі';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Жүктеулер қалтасына сақтаңыз';

  @override
  String get downloadsVisibleToOtherApps =>
      'Жүктеулер/Moonfin — басқа қолданбаларға көрінеді';

  @override
  String get dangerZone => 'Қауіпті аймақ';

  @override
  String get clearAllDownloads => 'Барлық жүктеп алынғандарды өшіріңіз';

  @override
  String get original => 'Түпнұсқа';

  @override
  String get changeDownloadLocation => 'Жүктеп алу орнын өзгерту';

  @override
  String get changeDownloadLocationDescription =>
      'Жаңа жүктеп алынғандар таңдалған қалтаға сақталады. Бар жүктеп алынған файлдар ағымдағы орнында қалады және оларды Жад параметрлерінен басқаруға болады.';

  @override
  String get confirm => 'Растау';

  @override
  String get cannotWriteToFolder =>
      'Таңдалған қалтаға жазу мүмкін емес. Басқа орынды таңдаңыз немесе сақтау рұқсаттарын беріңіз.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Жүктеулер қалтасына сақтау керек пе?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Жүктеп алынған медиа құрылғыңыздағы Жүктеулер/Moonfin ішіне сақталады. Бұл файлдар галерея немесе музыка ойнатқышы сияқты басқа қолданбаларға көрінеді.\n\nБар жүктеп алынған файлдар ағымдағы орнында қалады.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Қосу';

  @override
  String get clearAllDownloadsWarning =>
      'Бұл барлық жүктеп алынған медианы жояды және оны кері қайтару мүмкін емес.';

  @override
  String get clearAll => 'Барлығын өшіру';

  @override
  String get navigationStyle => 'Навигация стилі';

  @override
  String get topBar => 'Жоғарғы жолақ';

  @override
  String get leftSidebar => 'Сол жақ бүйірлік тақта';

  @override
  String get showShuffleButton => 'Араластыру түймешігін көрсету';

  @override
  String get showGenresButton => 'Жанрларды көрсету түймесі';

  @override
  String get showFavoritesButton => 'Таңдаулыларды көрсету түймесі';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar =>
      'Құралдар тақтасында кітапханаларды көрсету';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'Навигация жолағының белгілері әрқашан жайылсын';

  @override
  String get showSeerrButton => 'Seerr түймесін көрсету';

  @override
  String get navbarOpacity => 'Шарлау тақтасының мөлдірлігі';

  @override
  String get navbarColor => 'Шарлау тақтасының түсі';

  @override
  String get gray => 'Сұр';

  @override
  String get darkBlue => 'Қою көк';

  @override
  String get purple => 'Күлгін';

  @override
  String get teal => 'Қызғылт';

  @override
  String get navy => 'Әскери-теңіз күштері';

  @override
  String get charcoal => 'Көмір';

  @override
  String get brown => 'Қоңыр';

  @override
  String get darkRed => 'Қою қызыл';

  @override
  String get darkGreen => 'Қою жасыл';

  @override
  String get slate => 'Шифер';

  @override
  String get indigo => 'Индиго';

  @override
  String get libraryDisplay => 'Кітапхана дисплейі';

  @override
  String get posterLabel => 'Постер';

  @override
  String get thumbnailLabel => 'Нобай';

  @override
  String get bannerLabel => 'Баннер';

  @override
  String get overridePerLibrarySettings =>
      'Әр кітапхана параметрлерін қайта анықтау';

  @override
  String get applyImageTypeToAllLibraries =>
      'Кескін түрін барлық кітапханаларға қолданыңыз';

  @override
  String get multiServerLibraries => 'Көп серверлік кітапханалар';

  @override
  String get showLibrariesFromAllServers =>
      'Барлық қосылған серверлерден кітапханаларды көрсету';

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
  String get groupItemsIntoCollections => 'Элементтерді жинақтарға топтау';

  @override
  String get hideCollectionAssociatedItems =>
      'Кітапханаларды шолу кезінде жинаққа байланысты элементтерді жасыру';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Кітапхананы топтау туралы ескертпе';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Бұл параметрді пайдалану үшін Jellyfin немесе Emby серверіңіздегі кітапхананың «Көрсету» параметрлерінде «Фильмдерді жинақтарға топтау» және/немесе «Сериалдарды жинақтарға топтау» параметрлерінің қосулы екеніне көз жеткізіңіз.';

  @override
  String get libraryVisibility => 'Кітапхананың көрінуі';

  @override
  String get libraryVisibilityDescription =>
      'Әрбір кітапхананың басты бетінің көріну мүмкіндігін ауыстырып-қосқыш. Өзгерістердің күшіне енуі үшін Moonfin қолданбасын қайта іске қосыңыз.';

  @override
  String get showInNavigation => 'Навигацияда көрсету';

  @override
  String get showInLatestMedia => 'Соңғы медиада көрсету';

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
  String get sourceLibraries => 'Бастапқы кітапханалар';

  @override
  String get sourceCollections => 'Бастапқы жинақтар';

  @override
  String get excludedGenres => 'Шығарылған жанрлар';

  @override
  String get selectAll => 'Барлығын таңдаңыз';

  @override
  String itemsSelected(int count) {
    return '$count таңдалды';
  }

  @override
  String get mediaBar => 'Медиа жолағы';

  @override
  String get mediaSources => 'БАҚ көздері';

  @override
  String get behavior => 'Мінез-құлық';

  @override
  String get seconds => 'секунд';

  @override
  String get mediaBarMode => 'Медиа жолақ стилі';

  @override
  String get mediaBarModeDescription =>
      'Түрлі медиа жолақ мәнерлерінің бірін таңдаңыз немесе медиа жолағын өшіріңіз';

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
  String get mediaBarModeOff => 'Өшірулі';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Медиа жолағын қосыңыз';

  @override
  String get showFeaturedContentSlideshow =>
      'Үйде таңдаулы мазмұн слайдшоуын көрсету';

  @override
  String get contentType => 'Мазмұн түрі';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Фильмдер мен телешоулар';

  @override
  String get moviesOnly => 'Тек фильмдер';

  @override
  String get tvShowsOnly => 'Тек телешоулар';

  @override
  String get itemCount => 'Элемент саны';

  @override
  String get noneSelected => 'Ешқайсысы таңдалмаған';

  @override
  String get noneExcluded => 'Ешқайсысы алынып тасталмаған';

  @override
  String get autoAdvance => 'Автоматты алға жылжыту';

  @override
  String get autoAdvanceSlides => 'Келесі слайдқа автоматты түрде жылжытыңыз';

  @override
  String get autoAdvanceInterval => 'Автоматты ілгерілету аралығы';

  @override
  String get trailerPreview => 'Трейлерді алдын ала қарау';

  @override
  String get autoPlayTrailers =>
      '3 секундтан кейін медиа жолағында трейлерлерді автоматты түрде ойнату';

  @override
  String get trailerAudio => 'Трейлер дыбысы';

  @override
  String get enableTrailerAudio =>
      'Медиажолақтағы трейлерлер үшін дыбысты қосу';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Эпизодты алдын ала қарау';

  @override
  String get mediaPreview => 'Медиа алдын ала қарау';

  @override
  String get episodePreviewDescription =>
      'Фокусталған, меңзердегі немесе ұзақ басылған карталарда 30 секундтық кірістірілген алдын ала қарауды ойнатыңыз';

  @override
  String get mediaPreviewDescription =>
      'Фокусталған, жылжытылған немесе ұзақ басылған карталарда 30 секундтық кірістірілген алдын ала қарауды ойнатыңыз';

  @override
  String get previewAudio => 'Аудионы алдын ала қарау';

  @override
  String get enablePreviewAudio =>
      'Трейлер мен эпизодты алдын ала қарау үшін дыбысты қосыңыз';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Соңғы БАҚ';

  @override
  String get recentlyReleased => 'Жақында шығарылған';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Менің медиам';

  @override
  String get myMediaSmall => 'Менің медиам (шағын)';

  @override
  String get continueWatching => 'Көруді жалғастыру';

  @override
  String get resumeAudio => 'Аудионы жалғастыру';

  @override
  String get resumeBooks => 'Түйіндеме кітаптары';

  @override
  String get activeRecordings => 'Белсенді жазбалар';

  @override
  String get playlists => 'Ойнату тізімдері';

  @override
  String get liveTV => 'Тікелей теледидар';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Әдепкі мәндерге қайта орнату';

  @override
  String get homeRowPosterSize => 'Негізгі қатардағы постер өлшемі';

  @override
  String get configureImageTypeForEachRow =>
      'Әрбір қосылған басты жол үшін кескін түрін конфигурациялаңыз';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Біріктіру «Көруді жалғастыру» және «Келесі';

  @override
  String get combineBothRows => 'Екі жолды бір үй бөліміне біріктіріңіз';

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
  String get fullScreenRows => 'Жайылған негізгі бет жолдары';

  @override
  String get fullScreenRowsDescription =>
      'Негізгі бет жолдарын әр экранға бір жолмен шектеу';

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
  String get perRowSettings => 'Әр жол параметрлері';

  @override
  String get autoLogin => 'Автоматты түрде кіру';

  @override
  String get lastUser => 'Соңғы пайдаланушы';

  @override
  String get currentUser => 'Ағымдағы пайдаланушы';

  @override
  String get alwaysAuthenticate => 'Әрқашан аутентификация';

  @override
  String get requirePasswordWithToken =>
      'Сақталған таңбалауыш болса да құпия сөзді талап етіңіз';

  @override
  String get confirmExit => 'Шығуды растау';

  @override
  String get showConfirmationBeforeExiting =>
      'Шығу алдында растауды көрсетіңіз';

  @override
  String get blockContentWithRatings =>
      'Келесі рейтингтері бар мазмұнды блоктау:';

  @override
  String get noContentRatingsFound =>
      'Бұл серверде әлі мазмұн рейтингтері табылмады.';

  @override
  String get couldNotLoadServerRatings =>
      'Сервер рейтингтерін жүктеу мүмкін болмады. Тек сақталған рейтингтерді көрсету.';

  @override
  String get couldNotRefreshRatings =>
      'Серверден бағалауларды жаңарту мүмкін болмады. Сақталған рейтингтер көрсетілуде.';

  @override
  String get enablePinCode => 'PIN кодын қосыңыз';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess =>
      'Тіркелгіңізге кіру үшін PIN кодын талап етіңіз';

  @override
  String get changePin => 'PIN кодын өзгерту';

  @override
  String get setNewPinCode => 'Жаңа PIN кодын орнатыңыз';

  @override
  String get removePin => 'PIN кодын жою';

  @override
  String get removePinProtection => 'PIN кодты қорғауды алып тастаңыз';

  @override
  String get screensaver => 'Скринсейвер';

  @override
  String get inAppScreensaver => 'Қолданба ішіндегі скринсейвер';

  @override
  String get enableBuiltInScreensaver =>
      'Кірістірілген экран сақтағышын қосыңыз';

  @override
  String get mode => 'Режим';

  @override
  String get libraryArt => 'Кітапхана өнері';

  @override
  String get logo => 'Логотип';

  @override
  String get clock => 'Сағат';

  @override
  String get timeout => 'Үзіліс';

  @override
  String minutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String get dimmingLevel => 'Күңгірттеу деңгейі';

  @override
  String get maxAgeRating => 'Максималды жас рейтингі';

  @override
  String get any => 'Кез келген';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Жас рейтингін талап етеді';

  @override
  String get onlyShowRatedContent => 'Тек бағаланған мазмұнды көрсетіңіз';

  @override
  String get displayClockDuringScreensaver =>
      'Скринсейвер кезінде сағатты көрсету';

  @override
  String get clockModeStatic => 'Тұрақты';

  @override
  String get clockModeBouncing => 'Секіретін';

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
  String get rottenTomatoesCritics => 'Rotten Tomatoes (сыншылар)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (аудитория)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Метакритикалық';

  @override
  String get metacriticUser => 'Metacritic (пайдаланушы)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Қауымдастық рейтингі';

  @override
  String get ratings => 'Рейтингтер';

  @override
  String get additionalRatings => 'Қосымша рейтингтер';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList және TMDB рейтингтерін көрсету';

  @override
  String get ratingLabels => 'Бағалау белгілері';

  @override
  String get showLabelsNextToIcons =>
      'Бағалау белгішелерінің жанында белгілерді көрсетіңіз';

  @override
  String get ratingBadges => 'Баға белгілері';

  @override
  String get showDecorativeBadges =>
      'Бағалардың артында сәндік белгілерді көрсетіңіз';

  @override
  String get episodeRatings => 'Эпизод рейтингтері';

  @override
  String get showRatingsOnEpisodes =>
      'Жеке эпизодтар бойынша рейтингтерді көрсету';

  @override
  String get ratingSources => 'Бағалау көздері';

  @override
  String get ratingSourcesDescription =>
      'Қолданбада көрсетілген бағалау көздерін қосыңыз және қайта реттеңіз';

  @override
  String get pluginDetected => 'Плагин анықталды';

  @override
  String get pluginNotDetected => 'Плагин анықталмады';

  @override
  String get pluginNotDetectedDescription =>
      'Сервер плагині қазір анықталмаған. Жергілікті параметрлер әлі де өздерінің сақталған мәндерін немесе кірістірілген әдепкі параметрлерді пайдаланады.';

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
  String get recentRequests => 'Соңғы сұраулар';

  @override
  String get recentlyAdded => 'Жақында қосылған';

  @override
  String get trending => 'Тренд';

  @override
  String get popularMovies => 'Танымал фильмдер';

  @override
  String get movieGenres => 'Фильм жанрлары';

  @override
  String get upcomingMovies => 'Алдағы фильмдер';

  @override
  String get studios => 'Студиялар';

  @override
  String get popularSeries => 'Танымал сериялар';

  @override
  String get seriesGenres => 'Серия жанрлары';

  @override
  String get upcomingSeries => 'Алдағы серия';

  @override
  String get networks => 'Желілер';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Seerr ашу жолдары';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'Жолдарды әдепкі мәндерге қайтарыңыз';

  @override
  String get enableSeerr => 'Seerr қосыңыз';

  @override
  String get showSeerrInNavigation =>
      'Навигацияда Seerr көрсету (сервер плагинін қажет етеді)';

  @override
  String get seerrUnavailable =>
      'Қолжетімсіз, себебі сервер плагині Seerr қолдауы өшірілген.';

  @override
  String get nsfwFilter => 'NSFW сүзгісі';

  @override
  String get hideAdultContent =>
      'Нәтижелерде ересектерге арналған мазмұнды жасыру';

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
  String get seerrNotificationsSection => 'Хабарландырулар';

  @override
  String get seerrNotifyNewRequestsTitle => 'Жаңа сұраныс хабарландырулары';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Біреу сұраныс жібергенде маған хабарлау';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Сұраныс жаңартулары';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Мақұлданды, қабылданбады және кітапханаңызға қосылды';

  @override
  String get seerrNotifyIssuesTitle => 'Мәселе жаңартулары';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Жаңа мәселелер, жауаптар және шешімдер';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Кірген пайдаланушы: $username';
  }

  @override
  String get discoverRows => 'Seerr ашу беті';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr негізгі бетінде көрсетілетін жолдарды қосыңыз. Ретін өзгерту үшін сүйреңіз. Жеке рет Moonbase-пен синхрондалады.';

  @override
  String get discoverRowsDescription =>
      'Seerr негізгі бетінде көрсетілетін жолдарды қосыңыз. Ретін өзгерту үшін сүйреңіз. Жеке рет Moonbase-пен синхрондалады.';

  @override
  String get enabled => 'Қосылған';

  @override
  String get hidden => 'Жасырын';

  @override
  String get aboutTitle => 'туралы';

  @override
  String versionValue(String version) {
    return '$version нұсқасы';
  }

  @override
  String get openSourceLicenses => 'Ашық бастапқы лицензиялар';

  @override
  String get sourceCode => 'Бастапқы код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Қазір жаңартуларды тексеріңіз';

  @override
  String get checksLatestDesktopRelease =>
      'Осы платформа үшін соңғы жұмыс үстелі шығарылымын тексереді';

  @override
  String get youAreUpToDate => 'Сіз жаңасыз.';

  @override
  String get couldNotCheckForUpdates =>
      'Дәл қазір жаңартуларды тексеру мүмкін емес.';

  @override
  String get noCompatibleUpdate =>
      'Бұл платформа үшін үйлесімді жаңарту бумасы табылмады.';

  @override
  String get updateChecksNotSupported =>
      'Бұл платформада жаңартуды тексеруге қолдау көрсетілмейді.';

  @override
  String get updateNotificationsDisabled =>
      'Жаңарту хабарландырулары өшірілген.';

  @override
  String get pleaseWaitBeforeChecking => 'Қайта тексермес бұрын күте тұрыңыз.';

  @override
  String get latestUpdateAlreadyShown => 'Соңғы жаңарту әлдеқашан көрсетілді.';

  @override
  String get updateAvailable => 'Жаңарту қолжетімді.';

  @override
  String updateAvailableVersion(String version) {
    return 'Жаңарту қолжетімді: v$version';
  }

  @override
  String get updateNotifications => 'Хабарландыруларды жаңарту';

  @override
  String get showWhenUpdatesAvailable =>
      'Жаңартулар қолжетімді болған кезде көрсету';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version қолжетімді';
  }

  @override
  String get readReleaseNotes => 'Шығарылым жазбаларын оқыңыз';

  @override
  String get downloadingUpdate => 'Жаңарту жүктеп алынуда...';

  @override
  String get updateDownloadFailed => 'Жаңарту жүктелмеді. Қайталап көріңіз.';

  @override
  String get openReleasesPage => 'Шығармалар бетін ашыңыз';

  @override
  String get navigation => 'Навигация';

  @override
  String get watchedIndicatorsBackdrops => 'Қаралған көрсеткіштер, фон';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Фокус түсі, қаралған индикаторлар, фон';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar стилі, құралдар тақтасының түймелері, сыртқы түрі';

  @override
  String get featuredContentAppearance => 'Таңдаулы мазмұн, сыртқы түрі';

  @override
  String gbValue(String value) {
    return '$value ГБ';
  }

  @override
  String mbValue(int value) {
    return '$value МБ';
  }

  @override
  String get imageCacheLimit => 'Кескін кэшінің шегі';

  @override
  String get clearImageCache => 'Кескін кэшін тазалау';

  @override
  String get imageCacheCleared => 'Кескін кэші тазаланды';

  @override
  String get clear => 'Тазалау';

  @override
  String get browse => 'Шолу';

  @override
  String get noResults => 'Нәтиже жоқ';

  @override
  String get seerrAvailableStatus => 'Қол жетімді';

  @override
  String get seerrRequestedStatus => 'Сұралған';

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
    return 'Жүктелуде · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Импортталуда';

  @override
  String itemsCount(int count) {
    return '$count Элемент';
  }

  @override
  String get seerrSettings => 'Seerr параметрлері';

  @override
  String get requestMore => 'Қосымша сұрау';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Сұраныс';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Сұраныстан бас тарту';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Moonfin ойынында ойнаңыз';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Сұраған: $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Мақұлдау';

  @override
  String get declineAction => 'Бас тарту';

  @override
  String get similar => 'Ұқсас';

  @override
  String get recommendations => 'Ұсыныстар';

  @override
  String cancelRequestForTitle(String title) {
    return '«$title» сұранысы болдырылмасын ба?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '«$title» үшін $count сұраныс болдырылмасын ба?';
  }

  @override
  String get keep => 'Сақтау';

  @override
  String get itemNotFoundInLibrary =>
      'Элемент Moonfin кітапханасынан табылмады';

  @override
  String get errorSearchingLibrary => 'Кітапхананы іздеу қатесі';

  @override
  String budgetAmount(String amount) {
    return 'Бюджеті: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Табысы: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type сұрау';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Сұраныс жіберу';

  @override
  String get allSeasons => 'Барлық маусымдар';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Қосымша опциялар';

  @override
  String get noServiceServersConfigured =>
      'Ешбір қызмет серверлері конфигурацияланбаған';

  @override
  String get server => 'Сервер';

  @override
  String get qualityProfile => 'Сапа профилі';

  @override
  String get rootFolder => 'Түбірлік қалта';

  @override
  String get showMore => 'Көбірек көрсету';

  @override
  String get appearances => 'Фильмография';

  @override
  String get crewSection => 'Экипаж';

  @override
  String ageValue(int age) {
    return 'жасы $age';
  }

  @override
  String get noRequests => 'Сұраныс жоқ';

  @override
  String get pendingStatus => 'Күтуде';

  @override
  String get declinedStatus => 'Қабылданбады';

  @override
  String get partiallyAvailable => 'Ішінара қол жетімді';

  @override
  String get downloadingStatus => 'Жүктеп алынуда';

  @override
  String get approvedStatus => 'Бекітілді';

  @override
  String get notRequestedStatus => 'Сұралған жоқ';

  @override
  String get blocklistedStatus => 'Тізімге тыйым салынған';

  @override
  String get deletedStatus => 'Жойылды';

  @override
  String get failedStatus => 'Сәтсіз';

  @override
  String get processingStatus => 'Өңделуде';

  @override
  String modifiedByName(String name) {
    return 'Өзгерткен: $name';
  }

  @override
  String get completedStatus => 'Аяқталды';

  @override
  String get requestErrorDuplicate => 'Бұл атау бұрын сұралған';

  @override
  String get requestErrorQuota => 'Сұраныс шегіне жетті';

  @override
  String get requestErrorBlocklisted => 'Бұл атау бұғаттау тізімінде';

  @override
  String get requestErrorNoSeasons => 'Сұрауға маусым қалмады';

  @override
  String get requestErrorPermission => 'Бұл сұранысты жасауға рұқсатыңыз жоқ';

  @override
  String get seerrRequestsTitle => 'Сұраныстар';

  @override
  String get seerrIssuesTitle => 'Мәселелер';

  @override
  String get sortNewest => 'Ең жаңа';

  @override
  String get sortLastModified => 'Соңғы өзгертілген';

  @override
  String get noIssues => 'Мәселе жоқ';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit фильм сұранысының $remaining қалды';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit маусым сұранысының $remaining қалды';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name құрамында';
  }

  @override
  String get viewCollection => 'Жинақты ашу';

  @override
  String get requestCollection => 'Жинақты сұрау';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total фильм · $available қолжетімді';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count фильм сұрау';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total ішінен $current сұралуда...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count фильм сұралды';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total фильмнің $ok сұралды';
  }

  @override
  String get collectionAllRequested =>
      'Барлық фильмдер қолжетімді немесе сұралып қойған';

  @override
  String get reportIssue => 'Мәселе туралы хабарлау';

  @override
  String get issueTypeVideo => 'Бейне';

  @override
  String get issueTypeAudio => 'Аудио';

  @override
  String get whatsWrong => 'Не дұрыс емес?';

  @override
  String get allEpisodes => 'Барлық эпизодтар';

  @override
  String get episode => 'Эпизод';

  @override
  String get openStatus => 'Ашық';

  @override
  String get resolvedStatus => 'Шешілді';

  @override
  String get resolveAction => 'Шешу';

  @override
  String get reopenAction => 'Қайта ашу';

  @override
  String reportedByName(String name) {
    return 'Хабарлаған: $name';
  }

  @override
  String commentsCount(int count) {
    return '$count пікір';
  }

  @override
  String get addComment => 'Пікір қосу';

  @override
  String get deleteIssueConfirm => 'Бұл мәселе жойылсын ба?';

  @override
  String get submitReport => 'Хабарламаны жіберу';

  @override
  String get tmdbScore => 'TMDB ұпайы';

  @override
  String get releaseDateLabel => 'Шығарылған күні';

  @override
  String get firstAirDateLabel => 'Алғашқы эфир күні';

  @override
  String get revenueLabel => 'Кіріс';

  @override
  String get runtimeLabel => 'Орындалу уақыты';

  @override
  String get budgetLabel => 'Бюджет';

  @override
  String get originalLanguageLabel => 'Түпнұсқа тілі';

  @override
  String get seasonsLabel => 'Маусымдар';

  @override
  String get episodesLabel => 'Эпизодтар';

  @override
  String get access => 'Қол жеткізу';

  @override
  String get add => 'Қосу';

  @override
  String get address => 'Мекенжай';

  @override
  String get analytics => 'Аналитика';

  @override
  String get catalog => 'Каталог';

  @override
  String get content => 'Мазмұны';

  @override
  String get copy => 'Көшіру';

  @override
  String get create => 'Жасау';

  @override
  String get disable => 'Өшіру';

  @override
  String get done => 'Дайын';

  @override
  String get edit => 'Өңдеу';

  @override
  String get encoding => 'Кодтау';

  @override
  String get error => 'Қате';

  @override
  String get forward => 'Алға';

  @override
  String get general => 'Жалпы';

  @override
  String get go => 'Бар';

  @override
  String get install => 'Орнату';

  @override
  String get installed => 'Орнатылған';

  @override
  String get interval => 'Интервал';

  @override
  String get name => 'Аты';

  @override
  String get networking => 'Желі құру';

  @override
  String get next => 'Келесі';

  @override
  String get path => 'Жол';

  @override
  String get paused => 'Кідіртілді';

  @override
  String get permissions => 'Рұқсаттар';

  @override
  String get processing => 'Өңдеу';

  @override
  String get profile => 'Профиль';

  @override
  String get provider => 'Провайдер';

  @override
  String get refresh => 'Жаңарту';

  @override
  String get remote => 'Қашықтағы';

  @override
  String get rename => 'Атын өзгерту';

  @override
  String get revoke => 'Күшін жою';

  @override
  String get role => 'Рөл';

  @override
  String get root => 'Түбір';

  @override
  String get run => 'Жүгіру';

  @override
  String get search => 'Іздеу';

  @override
  String get select => 'таңдаңыз';

  @override
  String get send => 'Жіберу';

  @override
  String get sessions => 'Сеанстар';

  @override
  String get set => 'Орнату';

  @override
  String get status => 'Күй';

  @override
  String get stop => 'Тоқтату';

  @override
  String get streaming => 'Ағын';

  @override
  String get time => 'Уақыт';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Жою';

  @override
  String get up => 'Жоғары';

  @override
  String get update => 'Жаңарту';

  @override
  String get upload => 'Жүктеп салу';

  @override
  String get unmute => 'Дыбысты қосу';

  @override
  String get mute => 'Дыбысты өшіру';

  @override
  String get branding => 'Брендинг';

  @override
  String get adminDrawerDashboard => 'Бақылау тақтасы';

  @override
  String get adminDrawerAnalytics => 'Аналитика';

  @override
  String get adminDrawerSettings => 'Параметрлер';

  @override
  String get adminDrawerBranding => 'Брендинг';

  @override
  String get adminDrawerUsers => 'Пайдаланушылар';

  @override
  String get adminDrawerLibraries => 'Медиатекалар';

  @override
  String get adminDrawerDisplay => 'Көрсету';

  @override
  String get adminDrawerMetadata => 'Метадеректер';

  @override
  String get adminDrawerNfo => 'NFO параметрлері';

  @override
  String get adminDrawerTranscoding => 'Транскодтау';

  @override
  String get adminDrawerResume => 'Жалғастыру';

  @override
  String get adminDrawerStreaming => 'Ағын';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Құрылғылар';

  @override
  String get adminDrawerActivity => 'Белсенділік';

  @override
  String get adminDrawerNetworking => 'Желі құру';

  @override
  String get adminDrawerApiKeys => 'API кілттері';

  @override
  String get adminDrawerBackups => 'Сақтық көшірмелер';

  @override
  String get adminDrawerLogs => 'Журналдар';

  @override
  String get adminDrawerScheduledTasks => 'Жоспарланған тапсырмалар';

  @override
  String get adminDrawerPlugins => 'Плагиндер';

  @override
  String get adminDrawerRepositories => 'Репозиторийлер';

  @override
  String get adminDrawerLiveTv => 'Тікелей теледидар';

  @override
  String get adminExitTooltip => 'Әкімшіден шығыңыз';

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
  String get adminDashboardLoadFailed => 'Бақылау тақтасы жүктелмеді';

  @override
  String get adminMediaOverview => 'Бұқаралық ақпарат құралдарына шолу';

  @override
  String get adminMediaTotalsError =>
      'Сервер медиасының жиынтықтары жүктелмеді.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Бұл серверде қанша мазмұн бар екенін жылдам оқу.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Қолжетімді плагин жаңартулары: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Қайта іске қосуды қажет ететін плагиндер: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Орындалмаған жоспарлы тапсырмалар: $count';
  }

  @override
  String get analyticsMediaDistribution => 'БАҚ тарату';

  @override
  String get analyticsVideoCodecs => 'Бейне кодектер';

  @override
  String get analyticsAudioCodecs => 'Аудио кодектер';

  @override
  String get analyticsContainers => 'Контейнерлер';

  @override
  String get analyticsTopGenres => 'Үздік жанрлар';

  @override
  String get analyticsReleaseYears => 'Шығарылған жылдар';

  @override
  String get analyticsContentRatings => 'Мазмұн рейтингтері';

  @override
  String get analyticsRuntimeBuckets => 'Орындау уақыты шелектері';

  @override
  String get analyticsFileFormats => 'Файл пішімдері';

  @override
  String get analyticsNoData => 'Деректер жоқ.';

  @override
  String get adminServerInfo => 'Сервер ақпараты';

  @override
  String get adminRestartPending => 'Қайта бастау Күтуде';

  @override
  String get adminServerPaths => 'Сервер жолдары';

  @override
  String get adminServerActions => 'Сервер әрекеттері';

  @override
  String get adminRestartServer => 'Серверді қайта іске қосыңыз';

  @override
  String get adminShutdownServer => 'Серверді өшіру';

  @override
  String get adminLibraryScanStarted => 'Кітапхананы сканерлеу басталды';

  @override
  String errorGeneric(String error) {
    return 'Қате: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Серверді қайта жүктеу орындалуда';

  @override
  String get adminServerRebootMessage =>
      'Сервер қайта жүктелуде, Moonfin қайта іске қосыңыз';

  @override
  String get adminActiveSessions => 'Белсенді сессиялар';

  @override
  String get adminSessionsLoadFailed => 'Сеанстарды жүктеу сәтсіз аяқталды';

  @override
  String get adminNoActiveSessions => 'Белсенді сеанстар жоқ';

  @override
  String get adminRecentActivity => 'Соңғы әрекет';

  @override
  String get adminNoRecentActivity => 'Соңғы әрекет жоқ';

  @override
  String adminCommandFailed(String error) {
    return 'Пәрмен орындалмады: $error';
  }

  @override
  String get adminSendMessage => 'Хабар жіберу';

  @override
  String get adminMessageTextHint => 'Хабарлама мәтіні';

  @override
  String get adminSetVolume => 'Дыбыс деңгейін орнату';

  @override
  String get sessionPrev => 'Алдыңғы';

  @override
  String get sessionRewind => 'Артқа айналдыру';

  @override
  String get sessionForward => 'Алға айналдыру';

  @override
  String get sessionNext => 'Келесі';

  @override
  String get sessionVolumeDown => 'Том –';

  @override
  String get sessionVolumeUp => '+ том';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Қазір ойнатылады';

  @override
  String get volume => 'Дыбыс деңгейі';

  @override
  String get actions => 'Әрекеттер';

  @override
  String get videoCodec => 'Бейне кодек';

  @override
  String get audioCodec => 'Аудио кодек';

  @override
  String get hwAccel => 'Аппараттық үдету';

  @override
  String get completion => 'Аяқтау';

  @override
  String get adminClearDates => 'Күндерді тазалау';

  @override
  String get adminActivitySeverityAll => 'Барлық деңгейлер';

  @override
  String get adminActivityDateRange => 'Күн ауқымы';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Әрекеттер журналын жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminNoActivityEntries => 'Әрекет жазбалары жоқ';

  @override
  String get adminEditDeviceName => 'Құрылғы атауын өңдеу';

  @override
  String get adminCustomName => 'Пайдаланушы аты';

  @override
  String get adminDeviceNameUpdated => 'Құрылғы атауы жаңартылды';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Құрылғыны жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminDeleteDevice => 'Құрылғыны жою';

  @override
  String get adminDeviceDeleted => 'Құрылғы жойылды';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Құрылғыны жою мүмкін болмады: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '«$name» құрылғысы жойылсын ба? Пайдаланушыға осы құрылғыда қайта кіру қажет болады.';
  }

  @override
  String get adminDeleteAllDevices => 'Барлық құрылғыны жою';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count құрылғы жойылсын ба? Тиісті пайдаланушыларға қайта кіру қажет болады. Ағымдағы құрылғыңызға әсер етпейді.';
  }

  @override
  String get adminDevicesDeletedAll => 'Құрылғылар жойылды';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Кейбір құрылғылар жойылды; $count құрылғыны жою мүмкін болмады.';
  }

  @override
  String get adminDevicesLoadFailed => 'Құрылғылар жүктелмеді';

  @override
  String get adminSearchDevices => 'Құрылғыларды іздеу';

  @override
  String get adminThisDevice => 'Бұл құрылғы';

  @override
  String get adminEditName => 'Атауды өңдеу';

  @override
  String get adminLibrariesLoadFailed => 'Кітапханалар жүктелмеді';

  @override
  String get adminNoLibraries => 'Бірде-бір кітапхана конфигурацияланбаған';

  @override
  String get adminScanAllLibraries => 'Барлық кітапханаларды сканерлеу';

  @override
  String get adminAddLibrary => 'Кітапхана қосу';

  @override
  String adminScanFailed(String error) {
    return 'Сканерлеуді бастау мүмкін болмады: $error';
  }

  @override
  String get adminRenameLibrary => 'Кітапхананың атын өзгерту';

  @override
  String get adminNewName => 'Жаңа атау';

  @override
  String adminLibraryRenamed(String name) {
    return 'Кітапхана «$name» деп өзгертілді';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Атын өзгерту мүмкін болмады: $error';
  }

  @override
  String get adminDeleteLibrary => 'Кітапхананы жою';

  @override
  String adminLibraryDeleted(String name) {
    return '«$name» кітапханасы жойылды';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Кітапхананы жою мүмкін болмады: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Жолды қосу мүмкін болмады: $error';
  }

  @override
  String get adminRemovePath => 'Жолды жою';

  @override
  String adminRemovePathConfirm(String path) {
    return '«$path» осы кітапханадан жойылсын ба?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Жолды жою мүмкін болмады: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Кітапхана жүктелмеді';

  @override
  String get adminNoMediaPaths => 'Ешбір медиа жолы конфигурацияланбаған';

  @override
  String get adminAddPath => 'Жол қосу';

  @override
  String get adminBrowseFilesystem => 'Сервер файлдық жүйесін шолу:';

  @override
  String get adminPreferredMetadataLanguage => 'Таңдаулы метадеректер тілі';

  @override
  String get adminMetadataLanguageHint => 'мысалы en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Метадеректер ел коды';

  @override
  String get adminMetadataCountryHint => 'мысалы АҚШ, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Жолдар';

  @override
  String get adminLibraryTabOptions => 'Параметрлер';

  @override
  String get adminLibraryTabDownloaders => 'Жүктеушілер';

  @override
  String get adminLibMetadataSavers => 'Метадеректерді сақтаушылар';

  @override
  String get adminLibSubtitleDownloaders => 'Субтитр жүктеушілері';

  @override
  String get adminLibLyricDownloaders => 'Ән мәтінін жүктеушілер';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Метадеректерді жүктеушілер: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Кескін көздері: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Бұл сервер кітапхананың осы түрі үшін жүктеушілер ұсынбайды.';

  @override
  String get adminLibrarySectionGeneral => 'Жалпы';

  @override
  String get adminLibrarySectionMetadata => 'Метадеректер';

  @override
  String get adminLibrarySectionEmbedded => 'Кірістірілген мәліметтер';

  @override
  String get adminLibrarySectionSubtitles => 'Субтитрлер';

  @override
  String get adminLibrarySectionImages => 'Кескіндер';

  @override
  String get adminLibrarySectionSeries => 'Сериалдар';

  @override
  String get adminLibrarySectionMusic => 'Музыка';

  @override
  String get adminLibrarySectionMovies => 'Фильмдер';

  @override
  String get adminLibRealtimeMonitor => 'Нақты уақыттағы бақылауды қосу';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Файл өзгерістерін анықтап, оларды автоматты түрде өңдеу.';

  @override
  String get adminLibEnablePhotos => 'Фотосуреттерді көрсету';

  @override
  String get adminLibSaveLocalMetadata => 'Мұқабаларды медиақалталарға сақтау';

  @override
  String get adminLibRefreshInterval => 'Метадеректерді автоматты жаңарту';

  @override
  String get adminLibRefreshNever => 'Ешқашан';

  @override
  String get adminLibDefault => 'Әдепкі';

  @override
  String get adminLibDisplayTitle => 'Көрсету';

  @override
  String get adminLibDisplaySection => 'Кітапхананы көрсету';

  @override
  String get adminLibFolderView =>
      'Қарапайым медиақалталарды көрсету үшін қалталар көрінісін пайдалану';

  @override
  String get adminLibSpecialsInSeasons =>
      'Арнайы шығарылымдарды шыққан маусымдарында көрсету';

  @override
  String get adminLibGroupMovies => 'Фильмдерді жинақтарға топтау';

  @override
  String get adminLibGroupShows => 'Сериалдарды жинақтарға топтау';

  @override
  String get adminLibExternalSuggestions =>
      'Ұсыныстарда сыртқы мазмұнды көрсету';

  @override
  String get adminLibDateAddedSection => 'Қосылған күн әрекеті';

  @override
  String get adminLibDateAddedLabel => 'Қосылған күнді мына көзден алу';

  @override
  String get adminLibDateAddedImport => 'Кітапханаға сканерленген күн';

  @override
  String get adminLibDateAddedFile => 'Файл жасалған күн';

  @override
  String get adminLibMetadataTitle => 'Метадеректер және кескіндер';

  @override
  String get adminLibMetadataLangSection => 'Қалаулы метадерек тілі';

  @override
  String get adminLibChaptersSection => 'Тараулар';

  @override
  String get adminLibDummyChapterDuration =>
      'Жасанды тараудың ұзақтығы (секунд)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Тараулары жоқ медиа үшін жасалатын тараулардың ұзақтығы. Өшіру үшін 0 мәнін қойыңыз.';

  @override
  String get adminLibChapterImageResolution =>
      'Тарау кескінінің ажыратымдылығы';

  @override
  String get adminLibNfoTitle => 'NFO параметрлері';

  @override
  String get adminLibNfoHelp =>
      'NFO метадеректері Kodi және ұқсас клиенттермен үйлесімді. Параметрлер NFO метадеректерін сақтайтын барлық кітапханаға қолданылады.';

  @override
  String get adminLibKodiUser =>
      'NFO файлдарында көру деректері сақталатын пайдаланушы';

  @override
  String get adminLibSaveImagePaths => 'Кескін жолдарын NFO файлдарында сақтау';

  @override
  String get adminLibPathSubstitution =>
      'NFO кескін жолдары үшін жолды алмастыруды қосу';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart кескіндерін extrathumbs қалтасына көшіру';

  @override
  String get adminLibNone => 'Жоқ';

  @override
  String adminLibRefreshDays(int days) {
    return '$days күн';
  }

  @override
  String get adminLibEmbeddedTitles => 'Кірістірілген атауларды пайдалану';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Қосымшалар үшін кірістірілген атауларды пайдалану';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Кірістірілген эпизод мәліметтерін пайдалану';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Кірістірілген субтитрлерге рұқсат ету';

  @override
  String get adminLibEmbeddedAllowAll => 'Барлығына рұқсат ету';

  @override
  String get adminLibEmbeddedAllowText => 'Тек мәтіндік';

  @override
  String get adminLibEmbeddedAllowImage => 'Тек кескіндік';

  @override
  String get adminLibEmbeddedAllowNone => 'Жоқ';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Кірістірілген субтитрлер болса, жүктеуді өткізіп жіберу';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Аудиотрек жүктеу тіліне сәйкес келсе, жүктеуді өткізіп жіберу';

  @override
  String get adminLibRequirePerfectMatch =>
      'Субтитрлердің дәл сәйкестігін талап ету';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Субтитрлерді медиақалталарға сақтау';

  @override
  String get adminLibChapterImageExtraction => 'Тарау кескіндерін шығарып алу';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Кітапхананы сканерлеу кезінде тарау кескіндерін шығарып алу';

  @override
  String get adminLibTrickplayExtraction =>
      'trickplay кескіндерін шығарып алуды қосу';

  @override
  String get adminLibTrickplayDuringScan =>
      'Кітапхананы сканерлеу кезінде trickplay кескіндерін шығарып алу';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'trickplay кескіндерін медиақалталарға сақтау';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Бірнеше қалтаға таралған сериалдарды автоматты түрде біріктіру';

  @override
  String get adminLibSeasonZeroName => 'Нөлінші маусымның көрсетілетін атауы';

  @override
  String get adminLibLufsScan =>
      'Дыбысты қалыпқа келтіру үшін LUFS сканерлеуін қосу';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Стандартты емес орындаушылар тегін таңдау';

  @override
  String get adminLibAutoAddToCollection =>
      'Фильмдерді жинақтарға автоматты түрде қосу';

  @override
  String get adminLibraryNameRequired => 'Кітапхана атауы қажет';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Кітапхана жасау мүмкін болмады: $error';
  }

  @override
  String get adminLibraryName => 'Кітапхана аты';

  @override
  String get adminSelectedPaths => 'Таңдалған жолдар:';

  @override
  String get adminCreateLibrary => 'Кітапхана жасау';

  @override
  String get paths => 'Жолдар:';

  @override
  String get adminDisableUser => 'Пайдаланушыны өшіру';

  @override
  String get adminEnableUser => 'Пайдаланушыны қосыңыз';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name өшірілсін бе? Ол кіре алмайтын болады.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name қосылсын ба? Ол қайта кіре алатын болады.';
  }

  @override
  String adminUserDisabled(String name) {
    return '«$name» пайдаланушысы өшірілді';
  }

  @override
  String adminUserEnabled(String name) {
    return '«$name» пайдаланушысы қосылды';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Пайдаланушы саясатын жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Пайдаланушыларды жүктеу мүмкін болмады';

  @override
  String get adminSearchUsers => 'Пайдаланушыларды іздеу';

  @override
  String get adminEditUser => 'Пайдаланушыны өңдеу';

  @override
  String get adminAddUser => 'Пайдаланушы қосу';

  @override
  String adminUserCreateFailed(String error) {
    return 'Пайдаланушы жасау мүмкін болмады: $error';
  }

  @override
  String get adminCreateUser => 'Пайдаланушы жасау';

  @override
  String get adminPasswordOptional => 'Құпия сөз (міндетті емес)';

  @override
  String get adminUsernameRequired => 'Пайдаланушы аты бос болмауы керек';

  @override
  String adminSaveFailed(String error) {
    return 'Сақтау мүмкін болмады: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Құпия сөздер сәйкес келмейді';

  @override
  String adminFailed(String error) {
    return 'Сәтсіз: $error';
  }

  @override
  String get adminUserLoadFailed => 'Пайдаланушы жүктелмеді';

  @override
  String get adminDeleteUser => 'Пайдаланушыны жою';

  @override
  String get admin => 'Админ';

  @override
  String get adminFullAccessWarning =>
      'Әкімшілер серверге толық қол жеткізе алады. Сақтықпен беріңіз.';

  @override
  String get administrator => 'Әкімші';

  @override
  String get adminHiddenUser => 'Жасырын пайдаланушы';

  @override
  String get adminAllowMediaPlayback => 'Медиа ойнатуға рұқсат беріңіз';

  @override
  String get adminAllowAudioTranscoding =>
      'Дыбысты қайта кодтауға рұқсат етіңіз';

  @override
  String get adminAllowVideoTranscoding =>
      'Бейнені қайта кодтауға рұқсат беріңіз';

  @override
  String get adminAllowRemuxing => 'Ремукс жасауға рұқсат етіңіз';

  @override
  String get adminForceRemoteTranscoding =>
      'Қашықтағы дереккөзді қайта кодтауды мәжбүрлеу';

  @override
  String get adminAllowContentDownloading =>
      'Мазмұнды жүктеп алуға рұқсат беріңіз';

  @override
  String get adminAllowPublicSharing => 'Жалпыға ортақ бөлісуге рұқсат беріңіз';

  @override
  String get adminAllowRemoteControl =>
      'Басқа пайдаланушыларды қашықтан басқаруға рұқсат ету';

  @override
  String get adminAllowSharedDeviceControl =>
      'Ортақ құрылғыны басқаруға рұқсат етіңіз';

  @override
  String get adminAllowRemoteAccess => 'Қашықтан кіруге рұқсат беріңіз';

  @override
  String get adminLeaveEmptyNoLimit => 'Шектеусіз бос қалдырыңыз';

  @override
  String get adminMaxActiveSessions => 'Максималды белсенді сеанстар';

  @override
  String get adminAllowLiveTvAccess =>
      'Тікелей теледидарға кіруге рұқсат беріңіз';

  @override
  String get adminAllowLiveTvManagement => 'Live TV басқаруына рұқсат беріңіз';

  @override
  String get adminAllowCollectionManagement =>
      'Коллекцияны басқаруға рұқсат етіңіз';

  @override
  String get adminAllowSubtitleManagement =>
      'Субтитрлерді басқаруға рұқсат беріңіз';

  @override
  String get adminAllowLyricManagement => 'Лириканы басқаруға рұқсат етіңіз';

  @override
  String get adminEnableAllLibraryAccess =>
      'Барлық кітапханаларға кіру мүмкіндігін қосыңыз';

  @override
  String get adminChangePassword => 'Құпия сөзді өзгерту';

  @override
  String get adminNewPassword => 'Жаңа құпия сөз';

  @override
  String get adminConfirmPassword => 'Құпия сөзді Растау';

  @override
  String get adminSetPassword => 'Құпия сөзді орнату';

  @override
  String get adminResetPassword => 'Құпия сөзді қалпына келтіру';

  @override
  String get adminPasswordReset => 'Құпия сөзді қалпына келтіру';

  @override
  String get adminPasswordUpdated => 'Құпия сөз жаңартылды';

  @override
  String get adminUserSettings => 'Пайдаланушы параметрлері';

  @override
  String get adminLibraryAccess => 'Кітапханаға кіру';

  @override
  String get adminEnableAllDevices =>
      'Барлық құрылғыларға кіру мүмкіндігін қосыңыз';

  @override
  String get adminEnableAllChannels => 'Барлық арналарға кіруді қосыңыз';

  @override
  String get adminParentalControl => 'Ата-ана бақылауы';

  @override
  String get adminMaxParentalRating => 'Рұқсат етілген ең жоғары жас шектеуі';

  @override
  String get adminMaxParentalRatingHint =>
      'Одан жоғары шектеуі бар мазмұн бұл пайдаланушыдан жасырылады.';

  @override
  String get adminParentalRatingNone => 'Жоқ';

  @override
  String get adminBlockUnratedItems =>
      'Шектеу туралы мәліметі жоқ немесе танылмаған элементтерді бұғаттау';

  @override
  String get adminUnratedBook => 'Кітаптар';

  @override
  String get adminUnratedChannelContent => 'Арналар';

  @override
  String get adminUnratedLiveTvChannel => 'Тікелей теледидар';

  @override
  String get adminUnratedMovie => 'Фильмдер';

  @override
  String get adminUnratedMusic => 'Музыка';

  @override
  String get adminUnratedTrailer => 'Трейлерлер';

  @override
  String get adminUnratedSeries => 'Сериалдар';

  @override
  String get adminAccessSchedules => 'Қатынау кестелері';

  @override
  String get adminAccessSchedulesHint =>
      'Қатынауға тек төмендегі кесте бойынша рұқсат ету. Кесте орнатылмаса, қатынауға күні бойы рұқсат етіледі.';

  @override
  String get adminAddSchedule => 'Кесте қосу';

  @override
  String get adminScheduleDay => 'Күн';

  @override
  String get adminScheduleStart => 'Басталуы';

  @override
  String get adminScheduleEnd => 'Аяқталуы';

  @override
  String get adminDayEveryday => 'Күн сайын';

  @override
  String get adminDayWeekday => 'Жұмыс күні';

  @override
  String get adminDayWeekend => 'Демалыс күні';

  @override
  String get adminDaySunday => 'Жексенбі';

  @override
  String get adminDayMonday => 'Дүйсенбі';

  @override
  String get adminDayTuesday => 'Сейсенбі';

  @override
  String get adminDayWednesday => 'Сәрсенбі';

  @override
  String get adminDayThursday => 'Бейсенбі';

  @override
  String get adminDayFriday => 'Жұма';

  @override
  String get adminDaySaturday => 'Сенбі';

  @override
  String get adminAllowedTags => 'Рұқсат етілген тегтер';

  @override
  String get adminAllowedTagsHint =>
      'Тек осы тегтері бар мазмұн көрсетіледі. Барлығына рұқсат ету үшін бос қалдырыңыз.';

  @override
  String get adminBlockedTags => 'Бұғатталған тегтер';

  @override
  String get adminBlockedTagsHint =>
      'Осы тегтері бар мазмұн бұл пайдаланушыдан жасырылады.';

  @override
  String get adminAddTag => 'Тег қосу';

  @override
  String get adminAuthProvider => 'Аутентификация провайдері';

  @override
  String get adminPasswordResetProvider => 'Құпия сөзді ысыру провайдері';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Бұғаттауға дейінгі сәтсіз кіру әрекеттерінің ең көп саны';

  @override
  String get adminLoginAttemptsHint =>
      'Әдепкі мән үшін 0, бұғаттауды өшіру үшін -1 қойыңыз.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay қатынауы';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Топтар жасауға және оларға қосылуға рұқсат ету';

  @override
  String get adminSyncPlayJoin => 'Топтарға қосылуға рұқсат ету';

  @override
  String get adminSyncPlayNone => 'Қатынау жоқ';

  @override
  String get adminContentDeletionFolders => 'Мазмұнды жоюға рұқсат ету көзі';

  @override
  String get adminResetPasswordWarning =>
      'Бұл құпия сөзді жояды. Пайдаланушы парольсіз жүйеге кіре алады.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Сервер HTTP $status қайтарды';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name жойылсын ба?';
  }

  @override
  String adminUserDeleted(String name) {
    return '«$name» пайдаланушысы жойылды';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Пайдаланушыны жою мүмкін болмады: $error';
  }

  @override
  String get adminCreateApiKey => 'API кілтін жасау';

  @override
  String get adminAppName => 'Қолданба атауы';

  @override
  String get adminApiKeyCreated => 'API кілті жасалды';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Кілт сәтті жасалды. Сервер таңбалауышты қайтармады. Сервер API кілттерін тексеріңіз.';

  @override
  String get adminKeyCopied => 'Перне алмасу буферіне көшірілді';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Кілт жасау мүмкін болмады: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Сервер жауабында кілт таңбалауышы жоқ';

  @override
  String get adminRevokeApiKey => 'API кілтін қайтарып алу';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name үшін кілт кері қайтарылсын ба?';
  }

  @override
  String get adminApiKeyRevoked => 'API кілті кері қайтарылды';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Кілтті кері қайтару мүмкін болмады: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API кілттері жүктелмеді';

  @override
  String get adminApiKeysTitle => 'API кілттері';

  @override
  String get adminCreateKey => 'Кілт жасау';

  @override
  String get adminNoApiKeys => 'API кілттері табылмады';

  @override
  String get adminUnknownApp => 'Белгісіз қолданба';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Токен: $token\\nЖасалды: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Сақтық көшірме жасау';

  @override
  String get adminBackupDatabase => 'Дерекқор';

  @override
  String get adminBackupDatabaseAlways => 'Әрқашан қосылады';

  @override
  String get adminBackupMetadata => 'Метадеректер';

  @override
  String get adminBackupSubtitles => 'Субтитрлер';

  @override
  String get adminBackupTrickplay => 'Trickplay кескіндері';

  @override
  String get adminCreatingBackup => 'Сақтық көшірме жасалуда...';

  @override
  String get adminBackupCreated => 'Сақтық көшірме сәтті жасалды';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Сақтық көшірме жасау мүмкін болмады: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Сервер жауабында сақтық көшірме жолы жоқ';

  @override
  String adminBackupManifest(String name) {
    return 'Манифест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Манифестті жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminConfirmRestore => 'Қалпына келтіруді растаңыз';

  @override
  String get adminRestoringBackup => 'Сақтық көшірме қалпына келтірілуде...';

  @override
  String adminRestoreFailed(String error) {
    return 'Сақтық көшірмеден қалпына келтіру мүмкін болмады: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Сақтық көшірмелер жүктелмеді';

  @override
  String get adminCreateBackup => 'Сақтық көшірме жасау';

  @override
  String get adminNoBackups => 'Сақтық көшірмелер табылмады';

  @override
  String get adminViewDetails => 'Мәліметтерді көру';

  @override
  String get restore => 'Қалпына келтіру';

  @override
  String get adminLogsLoadFailed => 'Сервер журналдарын жүктеу сәтсіз аяқталды';

  @override
  String get adminNoLogFiles => 'Ешбір журнал файлдары табылмады';

  @override
  String get adminLogCopied => 'Журнал алмасу буферіне көшірілді';

  @override
  String get adminSaveLogFile => 'Журнал файлын сақтаңыз';

  @override
  String adminSavedTo(String path) {
    return '$path орнына сақталды';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Файлды сақтау мүмкін болмады: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName жүктеу мүмкін болмады';
  }

  @override
  String get adminSearchInLog => 'Журналда іздеу';

  @override
  String get adminNoMatchingLines => 'Сәйкес сызықтар жоқ';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Тапсырмаларды жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Жоспарланған тапсырмалар табылмады';

  @override
  String get adminNoTasksMatchFilter =>
      'Ағымдағы сүзгіге сәйкес тапсырмалар жоқ';

  @override
  String adminTaskStartFailed(String error) {
    return 'Тапсырманы бастау мүмкін болмады: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Тапсырманы тоқтату мүмкін болмады: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Тапсырманы жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminRunNow => 'Қазір іске қосыңыз';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Триггерді жою мүмкін болмады: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Триггер қосу мүмкін болмады: $error';
  }

  @override
  String get adminLastExecution => 'Соңғы орындалу';

  @override
  String get adminTriggers => 'Триггерлер';

  @override
  String get adminAddTrigger => 'Триггерді қосыңыз';

  @override
  String get adminNoTriggers => 'Триггерлер конфигурацияланбаған';

  @override
  String get adminTriggerType => 'Триггер түрі';

  @override
  String get adminNoLimit => 'Шектеу жоқ';

  @override
  String adminHours(String hours) {
    return '$hours сағат';
  }

  @override
  String get adminDayOfWeek => 'Аптаның күні';

  @override
  String get adminSearchPlugins => 'Плагиндерді іздеу...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Плагинді ауыстыру мүмкін болмады: $error';
  }

  @override
  String get adminUninstallPlugin => 'Плагинді жою';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '«$name» жойылсын ба?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Плагинді жою мүмкін болмады: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Пакетті орнату мүмкін болмады: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Жаңартуды орнату мүмкін болмады: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Плагиндерді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Іздеуіңізге сәйкес келетін плагиндер жоқ';

  @override
  String get adminNoPluginsInstalled => 'Ешқандай плагин орнатылмаған';

  @override
  String adminInstallUpdate(String version) {
    return 'Жаңартуды орнату (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Каталогты жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'Іздеуіңізге сәйкес пакеттер жоқ';

  @override
  String get adminNoPackagesAvailable => 'Қолжетімді пакеттер жоқ';

  @override
  String get adminExperimentalIntegration => 'Эксперименттік интеграция';

  @override
  String get adminExperimentalWarning =>
      'Плагин параметрлерін біріктіру әлі эксперименталды. Кейбір параметрлер беттері дұрыс көрсетілмеуі мүмкін.';

  @override
  String get continueAction => 'Жалғастыру';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '«$name» сервер қайта іске қосылғаннан кейін жойылады';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Жою мүмкін болмады: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '«$name» v$version нұсқасына жаңартылуда...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Плагинді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminPluginNotFound => 'Плагин табылмады';

  @override
  String adminPluginVersion(String version) {
    return '$version нұсқасы';
  }

  @override
  String get adminEnablePlugin => 'Плагинді қосыңыз';

  @override
  String get adminPluginSettingsPage => 'Плагин параметрлері беті';

  @override
  String get adminRevisionHistory => 'Қайта қарау тарихы';

  @override
  String get adminNoChangelog => 'Өзгеріс журналы жоқ.';

  @override
  String get adminRemoveRepository => 'Репозиторийді жою';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return '«$name» жойылсын ба?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Репозиторийлерді сақтау мүмкін болмады: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Репозиторийлерді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminRepositoryNameHint => 'мысалы Jellyfin Тұрақты';

  @override
  String get adminRepositoryUrl => 'Репозиторий URL';

  @override
  String get adminAddEntry => 'Жазба қосу';

  @override
  String get adminInvalidUrl => 'Жарамсыз URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Плагин параметрлерін жүктеу мүмкін емес: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri ашу мүмкін болмады';
  }

  @override
  String get adminOpenInBrowser => 'Браузерде ашыңыз';

  @override
  String get adminOpenExternally => 'Сырттай ашыңыз';

  @override
  String get adminGeneralSettings => 'Жалпы параметрлер';

  @override
  String get adminServerName => 'Сервер атауы';

  @override
  String get adminPreferredMetadataCountry => 'Таңдаулы метадеректер елі';

  @override
  String get adminCachePath => 'Кэш жолы';

  @override
  String get adminMetadataPath => 'Метадеректер жолы';

  @override
  String get adminLibraryScanConcurrency =>
      'Кітапхананы сканерлеудің параллельдігі';

  @override
  String get adminParallelImageEncodingLimit =>
      'Параллель кескінді кодтау шегі';

  @override
  String get adminSlowResponseThreshold => 'Баяу жауап шегі (мс)';

  @override
  String get adminBrandingLoadFailed => 'Бренд параметрлері жүктелмеді';

  @override
  String get adminLoginDisclaimer => 'Жүйеге кіруден бас тарту';

  @override
  String get adminLoginDisclaimerHint =>
      'Жүйеге кіру пішінінің астында HTML көрсетіледі';

  @override
  String get adminCustomCss => 'Арнаулы CSS';

  @override
  String get adminCustomCssHint =>
      'Веб-интерфейске қолданылған пайдаланушы CSS';

  @override
  String get adminEnableSplashScreen => 'Экранды қосу';

  @override
  String get adminStreamingLoadFailed =>
      'Ағындық параметрлерді жүктеу мүмкін болмады';

  @override
  String get adminStreamingDescription =>
      'Қашықтағы қосылымдар үшін жаһандық ағындық бит жылдамдығы шектеулерін орнатыңыз.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Қашықтағы клиенттің бит жылдамдығының шегі (Мбит/с)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Бос қалдырыңыз немесе шектеусіз үшін 0 қалдырыңыз';

  @override
  String get adminPlaybackLoadFailed => 'Ойнату параметрлері жүктелмеді';

  @override
  String get adminHardwareAcceleration => 'Аппараттық жеделдету';

  @override
  String get adminVaapiDevice => 'VA-API құрылғысы';

  @override
  String get adminEnableHardwareEncoding => 'Аппараттық кодтауды қосыңыз';

  @override
  String get adminEnableHardwareDecoding =>
      'Аппараттық құралдардың декодтауын қосыңыз:';

  @override
  String get adminEncodingThreads => 'Жіптерді кодтау';

  @override
  String get adminAutomatic => '0 = автоматты';

  @override
  String get adminTranscodingTempPath => 'Транскодтау уақытша жол';

  @override
  String get adminEnableFallbackFont => 'Қосымша қаріпті қосыңыз';

  @override
  String get adminFallbackFontPath => 'Қайта қаріп жолы';

  @override
  String get adminAllowSegmentDeletion => 'Сегментті жоюға рұқсат ету';

  @override
  String get adminSegmentKeepSeconds => 'Сегменттерді сақтау (секундтар)';

  @override
  String get adminThrottleBuffering => 'Дроссельді буферлеу';

  @override
  String get adminTrickplayLoadFailed =>
      'Trickplay параметрлерін жүктеу мүмкін болмады';

  @override
  String get adminEnableHardwareAcceleration =>
      'Аппараттық жеделдетуді қосыңыз';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Тек негізгі кадрды шығаруды қосыңыз';

  @override
  String get adminKeyFrameSubtitle => 'Жылдамырақ, бірақ дәлдігі төмен';

  @override
  String get adminScanBehavior => 'Тәртіпті сканерлеу';

  @override
  String get adminProcessPriority => 'Процесс басымдығы';

  @override
  String get adminImageSettings => 'Кескін параметрлері';

  @override
  String get adminIntervalMs => 'Аралық (мс)';

  @override
  String get adminCaptureFrameSubtitle =>
      'Жақтауларды қаншалықты жиі түсіру керек';

  @override
  String get adminWidthResolutions => 'Ені ажыратымдылықтары';

  @override
  String get adminTileWidth => 'Плитка ені';

  @override
  String get adminTileHeight => 'Плитка биіктігі';

  @override
  String get adminQualitySubtitle =>
      'Төменгі мәндер = жақсы сапа, үлкенірек файлдар';

  @override
  String get adminProcessThreads => 'Жіптерді өңдеу';

  @override
  String get adminResumeLoadFailed => 'Жалғастыру параметрлері жүктелмеді';

  @override
  String get adminResumeDescription =>
      'Мазмұнның қашан жартылай ойнатылатын немесе толық ойнатылатыны белгіленетінін конфигурациялаңыз.';

  @override
  String get adminMinResumePercentage => 'Резюменің минималды пайызы';

  @override
  String get adminMinResumeSubtitle =>
      'Прогрессті сақтау үшін мазмұн осы пайыздан жоғары ойнатылуы керек';

  @override
  String get adminMaxResumePercentage => 'Резюменің максималды пайызы';

  @override
  String get adminMaxResumeSubtitle =>
      'Осы пайыздан кейін мазмұн толығымен ойнатылды деп саналады';

  @override
  String get adminMinResumeDuration => 'Ең аз түйіндеме ұзақтығы (секунд)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Бұдан қысқа элементтерді қалпына келтіру мүмкін емес';

  @override
  String get adminMinAudiobookResume =>
      'Аудиокітап түйіндемесінің ең аз пайызы';

  @override
  String get adminMaxAudiobookResume =>
      'Аудиокітап түйіндемесінің максималды пайызы';

  @override
  String get adminNetworkingLoadFailed => 'Желі параметрлері жүктелмеді';

  @override
  String get adminNetworkingWarning =>
      'Желі параметрлерін өзгерту серверді қайта іске қосуды қажет етуі мүмкін.';

  @override
  String get adminEnableRemoteAccess => 'Қашықтан қол жеткізуді қосыңыз';

  @override
  String get ports => 'Порттар';

  @override
  String get adminHttpPort => 'HTTP порты';

  @override
  String get adminHttpsPort => 'HTTPS порты';

  @override
  String get adminPublicHttpsPort => 'Қоғамдық HTTPS порты';

  @override
  String get adminBaseUrl => 'Негізгі URL';

  @override
  String get adminBaseUrlHint => 'мыс. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS қосыңыз';

  @override
  String get adminLocalNetwork => 'Жергілікті желі';

  @override
  String get adminLocalNetworkAddresses => 'Жергілікті желі мекенжайлары';

  @override
  String get adminKnownProxies => 'Белгілі проксилер';

  @override
  String get adminRemoteIpFilter => 'Қашықтағы IP сүзгісі';

  @override
  String get adminRemoteIpFilterEntries => 'Қашықтағы IP сүзгісі';

  @override
  String get adminCertificatePath => 'Сертификат жолы';

  @override
  String get whitelist => 'Ақ тізім';

  @override
  String get blacklist => 'Қара тізім';

  @override
  String get notSet => 'Орнатылмаған';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Метадеректерді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminRefreshMetadata => 'Метадеректерді жаңарту';

  @override
  String get recursive => 'Рекурсивті';

  @override
  String get adminReplaceAllMetadata => 'Барлық метадеректерді ауыстырыңыз';

  @override
  String get adminMetadataRefreshRequested => 'Метадеректерді жаңарту сұралды';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Метадеректерді жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Қашықтағы сәйкестіктер табылмады';

  @override
  String get adminRemoteResults => 'Қашықтағы нәтижелер';

  @override
  String get adminRemoteMetadataApplied => 'Қашықтағы метадеректер қолданылды';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Қашықтан іздеу орындалмады: $error';
  }

  @override
  String get adminUpdateContentType => 'Мазмұн түрін жаңарту';

  @override
  String get adminContentType => 'Мазмұн түрі';

  @override
  String get adminContentTypeUpdated => 'Мазмұн түрі жаңартылды';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Мазмұн түрін жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Метадеректер өңдегішін жүктеу сәтсіз аяқталды';

  @override
  String get adminNoPeopleEntries => 'Ешқандай адам жоқ';

  @override
  String get adminNoExternalIds => 'Сыртқы идентификаторлар жоқ';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType кескіні жаңартылды';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Кескінді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Қолдау көрсетілмейтін кескін пішімі';

  @override
  String get adminImageReadFailed => 'Таңдалған кескінді оқу мүмкін болмады';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType кескіні жүктеп салынды';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Кескінді жүктеп салу мүмкін болмады: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType кескінін жою';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType кескіні жойылды';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Кескінді жою мүмкін болмады: $error';
  }

  @override
  String get adminAllProviders => 'Барлық провайдерлер';

  @override
  String get adminNoRemoteImages => 'Ешқандай қашықтағы кескіндер табылмады';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Тюнерді табу мүмкін болмады: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U тюнері';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Файл немесе URL';

  @override
  String get adminTunerIpAddress => 'Тюнердің IP мекенжайы';

  @override
  String get adminTunerFriendlyName => 'Ыңғайлы атауы';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Бір мезгілдегі қосылым шегі';

  @override
  String get adminTunerCountHelp =>
      'Тюнер бір мезгілде рұқсат ететін ағындардың ең көп саны. Шектеусіз ету үшін 0 қойыңыз.';

  @override
  String get adminTunerFallbackBitrate => 'Резервтік ең жоғары ағын битрейті';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Тек таңдаулы арналарды импорттау';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Аппараттық транскодтауға рұқсат ету';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 транскодтау контейнеріне рұқсат ету';

  @override
  String get adminTunerAllowStreamSharing =>
      'Ағынды бірлесіп пайдалануға рұқсат ету';

  @override
  String get adminTunerEnableStreamLooping => 'Ағынды циклмен қайталауды қосу';

  @override
  String get adminTunerIgnoreDts => 'DTS елемеу';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Кірісті бастапқы кадр жиілігімен оқу';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Файл немесе URL';

  @override
  String get adminXmltvMoviePrefix => 'Фильм префиксі';

  @override
  String get adminXmltvMovieCategories => 'Фильм санаттары';

  @override
  String get adminXmltvCategoriesHelp =>
      'Бірнеше санатты тік сызықпен бөліңіз.';

  @override
  String get adminXmltvKidsCategories => 'Балалар санаттары';

  @override
  String get adminXmltvNewsCategories => 'Жаңалықтар санаттары';

  @override
  String get adminXmltvSportsCategories => 'Спорт санаттары';

  @override
  String get adminSdUsername => 'Пайдаланушы аты';

  @override
  String get adminSdPassword => 'Құпия сөз';

  @override
  String get adminSdCountry => 'Ел';

  @override
  String get adminSdCountrySelect => 'Елді таңдаңыз';

  @override
  String get adminSdPostalCode => 'Пошта индексі';

  @override
  String get adminEnableAllTuners => 'Барлық тюнерді қосу';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Тюнерді жою мүмкін болмады: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Провайдерді жою мүмкін болмады: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Сериялық жазу жолы';

  @override
  String get adminMovieRecordingPath => 'Фильм жазбасының жолы';

  @override
  String get adminGuideDaysAuto => 'Автоматты';

  @override
  String get adminRecordingPostProcessor => 'Кейінгі өңдеу қолданбасының жолы';

  @override
  String get adminRecordingPostProcessorArgs => 'Кейінгі өңдеу аргументтері';

  @override
  String get adminSaveRecordingNfo => 'Жазбаның NFO метадеректерін сақтау';

  @override
  String get adminSaveRecordingImages => 'Жазба кескіндерін сақтау';

  @override
  String get adminLiveTvSectionPaths => 'Жазба жолдары';

  @override
  String get adminLiveTvSectionPostProcessing => 'Кейінгі өңдеу';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Параметрлерді сақтау мүмкін болмады: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'Live TV әкімшілігі жүктелмеді';

  @override
  String get adminTunerDevices => 'Тюнер құрылғылары';

  @override
  String get adminNoTunerHosts => 'Тюнер хосттары конфигурацияланбаған';

  @override
  String get adminGuideProviders => 'Гид провайдерлері';

  @override
  String get adminGuideRefreshStarted =>
      'Бағдарлама деректерін жаңарту басталды';

  @override
  String get adminGuideRefreshUnavailable =>
      'Бағдарламаны жаңарту тапсырмасы бұл серверде қолжетімсіз.';

  @override
  String get adminNoListingProviders =>
      'Листинг провайдерлері конфигурацияланбаған';

  @override
  String get adminSettingsSaved => 'Параметрлер сақталды';

  @override
  String get adminBackupsNotAvailable =>
      'Бұл сервер құрылымында сақтық көшірмелер қол жетімді емес.';

  @override
  String get adminRestoreWarning1 =>
      'Қалпына келтіру БАРЛЫҚ ағымдағы сервер деректерін сақтық көшірме деректерімен ауыстырады.';

  @override
  String get adminRestoreWarning2 =>
      'Ағымдағы сервер параметрлері, пайдаланушылар және кітапхана деректері қайта жазылады.';

  @override
  String get adminRestoreWarning3 =>
      'Қалпына келтіруден кейін сервер қайта іске қосылады.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '$name сақтық көшірмесі қазір қалпына келтірілсін бе?';
  }

  @override
  String get adminBackupsTitle => 'Сақтық көшірмелер';

  @override
  String get adminUnknownDate => 'Белгісіз күн';

  @override
  String get adminUnnamedBackup => 'Аты жоқ сақтық көшірме';

  @override
  String get adminApply => 'Қолдану';

  @override
  String get adminLogsTitle => 'Сервер журналдары';

  @override
  String get adminLogsNewestFirst => 'Ең жаңасы Бірінші';

  @override
  String get adminLogsOldestFirst => 'Ең ескі Бірінші';

  @override
  String get adminLogsJustNow => 'Жаңа ғана';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes мин бұрын';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours сағ бұрын';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days күн бұрын';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName жүктеу мүмкін болмады';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count сәйкестік';
  }

  @override
  String get adminLogViewerNoMatches => 'Сәйкес сызықтар жоқ';

  @override
  String get adminMetadataEditorTitle => 'Метадеректер редакторы';

  @override
  String get adminMetadataIdentify => 'Анықтау';

  @override
  String get adminMetadataType => 'Түр';

  @override
  String get adminMetadataDetails => 'Мәліметтер';

  @override
  String get adminMetadataExternalIds => 'Сыртқы идентификаторлар';

  @override
  String get adminMetadataImages => 'Суреттер';

  @override
  String get adminMetadataFieldTitle => 'Атауы';

  @override
  String get adminMetadataFieldSortTitle => 'Тақырыпты сұрыптау';

  @override
  String get adminMetadataFieldOriginalTitle => 'Түпнұсқа атауы';

  @override
  String get adminMetadataFieldPremiereDate => 'Премьера күні (ЖЖЖЖ-АА-КК)';

  @override
  String get adminMetadataFieldEndDate => 'Аяқталу күні (ЖЖЖЖ-АА-КК)';

  @override
  String get adminMetadataFieldProductionYear => 'Өндіріс жылы';

  @override
  String get adminMetadataFieldOfficialRating => 'Ресми рейтинг';

  @override
  String get adminMetadataFieldCommunityRating => 'Қауымдастық рейтингі';

  @override
  String get adminMetadataFieldCriticRating => 'Сыни бағалау';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Таглайн';

  @override
  String get adminMetadataFieldOverview => 'Шолу';

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
  String get adminMetadataGenres => 'Жанрлар';

  @override
  String get adminMetadataTags => 'Тегтер';

  @override
  String get adminMetadataStudios => 'Студиялар';

  @override
  String get adminMetadataPeople => 'Адамдар';

  @override
  String get adminMetadataAddGenre => 'Жанр қосыңыз';

  @override
  String get adminMetadataAddTag => 'Тег қосыңыз';

  @override
  String get adminMetadataAddStudio => 'Студия қосыңыз';

  @override
  String get adminMetadataAddPerson => 'Адам қосу';

  @override
  String get adminMetadataEditPerson => 'Адамды өңдеу';

  @override
  String get adminMetadataRole => 'Рөл';

  @override
  String get adminMetadataImagePrimary => 'Негізгі';

  @override
  String get adminMetadataImageBackdrop => 'Фон';

  @override
  String get adminMetadataImageLogo => 'Логотип';

  @override
  String get adminMetadataImageBanner => 'Баннер';

  @override
  String get adminMetadataImageThumb => 'Бас бармақ';

  @override
  String get adminMetadataProvider => 'Провайдер';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType кескіні жаңартылды';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType кескіні жүктеп салынды';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType кескіні жойылды';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Кескінді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Таңдалған кескінді оқу мүмкін болмады';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Кескінді жүктеп салу мүмкін болмады: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType кескінін жою';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Бұл элементтен ағымдағы кескінді жояды.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Кескінді жою мүмкін болмады: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType кескінін таңдау';
  }

  @override
  String get adminMetadataUpload => 'Жүктеп салу';

  @override
  String get adminMetadataUpdate => 'Жаңарту';

  @override
  String get adminMetadataRemoteImage => 'Қашықтағы кескін';

  @override
  String get adminPluginsInstalled => 'Орнатылған';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Белсенді';

  @override
  String get adminPluginsRestart => 'Қайтадан қосу';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Іздеуіңізге сәйкес келетін плагиндер жоқ';

  @override
  String get adminPluginsNoneInstalled => 'Ешқандай плагин орнатылмаған';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Жаңарту қолжетімді: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Жаңарту қолжетімді';

  @override
  String get adminPluginsPendingRemoval =>
      'Қайта іске қосқаннан кейін жою күтілуде';

  @override
  String get adminPluginsChangesPending =>
      'Қайта іске қосуды күткен өзгерістер';

  @override
  String get adminPluginsEnable => 'Қосу';

  @override
  String get adminPluginsDisable => 'Өшіру';

  @override
  String get adminPluginsInstallUpdate => 'Жаңартуды орнату';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Жаңартуды орнату (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Іздеуіңізге сәйкес пакеттер жоқ';

  @override
  String get adminPluginsCatalogEmpty => 'Қолжетімді пакеттер жоқ';

  @override
  String adminPluginsInstalling(String name) {
    return '«$name» орнатылуда...';
  }

  @override
  String get adminPluginDetailExperimental => 'Эксперименттік интеграция';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Плагин параметрлерін біріктіру әлі эксперименталды. Кейбір өрістер немесе орналасулар әлі дұрыс көрсетілмеуі мүмкін.';

  @override
  String get adminPluginDetailToggle404 =>
      'Плагинді ауыстырып қосу мүмкін болмады. Сервер бұл плагин нұсқасын таба алмады. Плагиндерді жаңартып көріңіз, содан кейін әрекетті қайталаңыз.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Плагинді ауыстырып қосу мүмкін болмады. Мәліметтер алу үшін сервер журналдарын тексеріңіз.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name параметрлері';
  }

  @override
  String get adminPluginDetailDetails => 'Мәліметтер';

  @override
  String get adminPluginDetailDeveloper => 'Әзірлеуші';

  @override
  String get adminPluginDetailRepository => 'Репозиторий';

  @override
  String get adminPluginDetailBundled => 'Жинақталған';

  @override
  String get adminPluginDetailEnablePlugin => 'Плагинді қосыңыз';

  @override
  String get adminPluginDetailRestartRequired =>
      'Өзгерістердің күшіне енуі үшін серверді қайта іске қосу қажет.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Бұл плагин серверді қайта іске қосқаннан кейін жойылады.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Бұл плагин дұрыс жұмыс істемеді және дұрыс жұмыс істемеуі мүмкін.';

  @override
  String get adminPluginDetailNotSupported =>
      'Бұл плагинге ағымдағы сервер нұсқасы қолдау көрсетпейді.';

  @override
  String get adminPluginDetailSuperseded =>
      'Бұл плагин жаңарақ нұсқасымен ауыстырылды.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Репозиторийлерді жүктеу мүмкін болмады: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Репозиторийді жою';

  @override
  String adminReposRemoveConfirm(String name) {
    return '«$name» жойылсын ба?';
  }

  @override
  String get adminReposRemove => 'Алып тастау';

  @override
  String adminReposSaveFailed(String error) {
    return 'Репозиторийлерді сақтау мүмкін болмады: $error';
  }

  @override
  String get adminReposEmpty => 'Репозиторийлер конфигурацияланбаған';

  @override
  String get adminReposEmptySubtitle =>
      'Қол жетімді плагиндерді шолу үшін репозиторий қосыңыз';

  @override
  String get adminReposUnnamed => '(аты жоқ)';

  @override
  String get adminReposEditTitle => 'Репозиторийді өңдеу';

  @override
  String get adminReposAddTitle => 'Репозиторий қосу';

  @override
  String get adminReposUrl => 'Репозиторий URL';

  @override
  String get adminReposNameHint => 'мысалы Jellyfin Тұрақты';

  @override
  String get adminPluginSettingsInvalidUrl => 'Жарамсыз URL';

  @override
  String get adminGeneralSettingsTitle => 'Жалпы параметрлер';

  @override
  String get adminGeneralMetadataLanguage => 'Таңдаулы метадеректер тілі';

  @override
  String get adminGeneralMetadataLanguageHint => 'мысалы en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Таңдаулы метадеректер елі';

  @override
  String get adminGeneralMetadataCountryHint => 'мысалы АҚШ, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Кітапхананы сканерлеудің параллельдігі';

  @override
  String get adminGeneralImageEncodingLimit => 'Параллель кескінді кодтау шегі';

  @override
  String get adminUnknownError => 'Белгісіз қате';

  @override
  String get adminBrowse => 'Шолу';

  @override
  String get adminCloseBrowser => 'Браузерді жабыңыз';

  @override
  String get adminNetworkingTitle => 'Желі құру';

  @override
  String get adminNetworkingRestartWarning =>
      'Желі параметрлерін өзгерту серверді қайта іске қосуды қажет етуі мүмкін.';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS қосыңыз';

  @override
  String get adminNetworkingAddressHint => 'мысалы 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Белгілі проксилер';

  @override
  String get adminNetworkingProxyHint => 'мысалы 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Ақ тізім';

  @override
  String get adminNetworkingBlacklist => 'Қара тізім';

  @override
  String get adminNetworkingAddEntry => 'Жазба қосу';

  @override
  String get adminBrandingTitle => 'Брендинг';

  @override
  String get adminBrandingLoginDisclaimer => 'Жүйеге кіруден бас тарту';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'Жүйеге кіру пішінінің астында HTML көрсетіледі';

  @override
  String get adminBrandingCustomCss => 'Арнаулы CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Веб-интерфейске қолданылған пайдаланушы CSS';

  @override
  String get adminBrandingEnableSplash => 'Экранды қосу';

  @override
  String get adminBrandingSplashUpload => 'Кескінді жүктеп салу';

  @override
  String get adminBrandingSplashUploaded => 'Бастау экраны жаңартылды';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Бастау экранын жүктеп салу мүмкін болмады';

  @override
  String get adminBrandingSplashDeleted => 'Бастау экраны жойылды';

  @override
  String get adminBrandingNoSplash => 'Жеке бастау экраны жоқ';

  @override
  String get adminPlaybackHwAccel => 'Аппараттық жеделдету';

  @override
  String get adminPlaybackHwAccelLabel => 'Аппараттық жеделдету';

  @override
  String get adminPlaybackEnableHwEncoding => 'Аппараттық кодтауды қосыңыз';

  @override
  String get adminPlaybackQsvDevice => 'QSV құрылғысы';

  @override
  String get adminPlaybackEnhancedNvdec => 'Кеңейтілген NVDEC декодерін қосу';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Жүйенің өз аппараттық декодерін таңдау';

  @override
  String get adminPlaybackColorDepth10Hevc => '10 биттік HEVC декодтауы';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10 биттік VP9 декодтауы';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10 биттік декодтауы';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12 биттік декодтауы';

  @override
  String get adminPlaybackHwEncodingSection => 'Аппараттық кодтау';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC кодтауына рұқсат ету';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 кодтауына рұқсат ету';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel аз қуатты H.264 кодерін қосу';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel аз қуатты HEVC кодерін қосу';

  @override
  String get adminPlaybackToneMapping => 'Тон салыстыру';

  @override
  String get adminPlaybackEnableTonemapping => 'Тон салыстыруды қосу';

  @override
  String get adminPlaybackEnableVppTonemapping => 'VPP тон салыстыруын қосу';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox тон салыстыруын қосу';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Тон салыстыру алгоритмі';

  @override
  String get adminPlaybackTonemappingMode => 'Тон салыстыру режимі';

  @override
  String get adminPlaybackTonemappingRange => 'Тон салыстыру ауқымы';

  @override
  String get adminPlaybackTonemappingDesat => 'Тон салыстыру десатурациясы';

  @override
  String get adminPlaybackTonemappingPeak => 'Тон салыстыру шыңы';

  @override
  String get adminPlaybackTonemappingParam => 'Тон салыстыру параметрі';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP тон салыстыруының жарықтығы';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP тон салыстыруының контрасты';

  @override
  String get adminPlaybackEncoderPreset => 'Кодер баптауы';

  @override
  String get adminPlaybackH264Crf => 'H.264 кодтауының CRF мәні';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) кодтауының CRF мәні';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Деинтерлейс әдісі';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Деинтерлейс кезінде кадр жиілігін екі есе арттыру';

  @override
  String get adminPlaybackAudioSection => 'Аудио';

  @override
  String get adminPlaybackEnableAudioVbr => 'VBR аудиокодтауын қосу';

  @override
  String get adminPlaybackDownmixBoost =>
      'Аудионы араластыру кезіндегі күшейту';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Стереоға араластыру алгоритмі';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Мультиплекстеу кезегінің ең үлкен өлшемі';

  @override
  String get adminPlaybackAutoOption => 'Авто';

  @override
  String get adminPlaybackEncoding => 'Кодтау';

  @override
  String get adminPlaybackEncodingThreads => 'Жіптерді кодтау';

  @override
  String get adminPlaybackFallbackFont => 'Қосымша қаріпті қосыңыз';

  @override
  String get adminPlaybackFallbackFontPath => 'Қайта қаріп жолы';

  @override
  String get adminPlaybackStreaming => 'Ағын';

  @override
  String get adminResumeVideo => 'Бейне';

  @override
  String get adminResumeAudiobooks => 'Аудиокітаптар';

  @override
  String get adminStreamingBitrateLimit =>
      'Қашықтағы клиенттің бит жылдамдығының шегі (Мбит/с)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Бос қалдырыңыз немесе шектеусіз үшін 0 қалдырыңыз';

  @override
  String get adminTrickplayHwAccel => 'Аппараттық жеделдетуді қосыңыз';

  @override
  String get adminTrickplayHwEncoding => 'Аппараттық кодтауды қосыңыз';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Тек негізгі кадрды шығаруды қосыңыз';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Жылдамырақ, бірақ дәлдігі төмен';

  @override
  String get adminTrickplayNonBlocking => 'Блокталмайтын';

  @override
  String get adminTrickplayBlocking => 'Блоктау';

  @override
  String get adminTrickplayPriorityHigh => 'Жоғары';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Қалыптыдан жоғары';

  @override
  String get adminTrickplayPriorityNormal => 'Қалыпты';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Қалыптыдан төмен';

  @override
  String get adminTrickplayPriorityIdle => 'Бос';

  @override
  String get adminTrickplayImageSettings => 'Кескін параметрлері';

  @override
  String get adminTrickplayInterval => 'Аралық (мс)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Жақтауларды қаншалықты жиі түсіру керек';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Үтірмен бөлінген пиксель ені (мысалы, 320)';

  @override
  String get adminTrickplayQuality => 'Сапасы';

  @override
  String get adminTrickplayQScale => 'Сапа шкаласы';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Төменгі мәндер = жақсы сапа, үлкенірек файлдар';

  @override
  String get adminTrickplayJpegQuality => 'JPEG сапасы';

  @override
  String get adminTrickplayProcessing => 'Өңдеу';

  @override
  String get adminTasksEmpty => 'Жоспарланған тапсырмалар табылмады';

  @override
  String get adminTasksNoFilterMatch =>
      'Ағымдағы сүзгіге сәйкес тапсырмалар жоқ';

  @override
  String get adminTaskCancelling => 'Бас тартуда...';

  @override
  String get adminTaskRunning => 'Жүгіру...';

  @override
  String get adminTaskNeverRun => 'Ешқашан жүгірме';

  @override
  String get adminTaskStop => 'Тоқтату';

  @override
  String get adminRunningTasks => 'Орындалып жатқан тапсырмалар';

  @override
  String get adminTaskRun => 'Жүгіру';

  @override
  String get adminTaskDetailLastExecution => 'Соңғы орындалу';

  @override
  String get adminTaskDetailStarted => 'Басталды';

  @override
  String get adminTaskDetailEnded => 'Аяқталды';

  @override
  String get adminTaskDetailDuration => 'Ұзақтығы';

  @override
  String get adminTaskDetailErrorLabel => 'Қате:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Күн сайын $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Әр $day сайын $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Қолданбаны іске қосу кезінде';

  @override
  String get adminTaskTriggerTypeDaily => 'Күнделікті';

  @override
  String get adminTaskTriggerTypeWeekly => 'Апта сайын';

  @override
  String get adminTaskTriggerTypeInterval => 'Аралықта';

  @override
  String get adminTaskTriggerIntervalLabel => 'Интервал';

  @override
  String get adminTaskTriggerEveryHour => 'Әр сағат сайын';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сағат',
      one: '$count сағат',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Уақыт';

  @override
  String get adminActivityJustNow => 'Жаңа ғана';

  @override
  String get adminActivityLastHour => 'Соңғы сағат';

  @override
  String get adminActivityToday => 'Бүгін';

  @override
  String get adminActivityYesterday => 'Кеше';

  @override
  String get adminActivityOlder => 'Үлкенірек';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days күн бұрын';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours сағ бұрын';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes мин бұрын';
  }

  @override
  String get adminActivityNow => 'қазір';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours сағ';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days күн';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Айналдыру кезіндегі алдын ала қарау нобайлары үшін trickplay кескіндерін жасауды реттеңіз.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Қоғамдық HTTPS порты';

  @override
  String get adminNetworkingBaseUrl => 'Негізгі URL';

  @override
  String get adminNetworkingBaseUrlHint => 'мыс. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Ашық HTTP порты';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS талап ету';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Барлық қашықтағы сұраныстарды HTTPS-ке бағыттау. Серверде жарамды сертификат болмаса, әсер етпейді.';

  @override
  String get adminNetworkingCertPassword => 'Сертификат құпия сөзі';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 қосу';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 қосу';

  @override
  String get adminNetworkingLocalSubnets => 'LAN желілері';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Қашықтағы IP сүзгісі';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API құрылғысы';

  @override
  String get adminPlaybackAutomatic => '0 = автоматты';

  @override
  String get adminPlaybackTranscodeTempPath => 'Транскодтау уақытша жол';

  @override
  String get adminPlaybackSegmentDeletion => 'Сегментті жоюға рұқсат ету';

  @override
  String get adminPlaybackSegmentKeep => 'Сегменттерді сақтау (секундтар)';

  @override
  String get adminPlaybackThrottleBuffering => 'Дроссельді буферлеу';

  @override
  String get adminPlaybackThrottleDelay => 'Ағынды шектеу кідірісі (секунд)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Субтитрлерді жүріп жатқанда шығарып алуға рұқсат ету';

  @override
  String get adminResumeMinPct => 'Резюменің минималды пайызы';

  @override
  String get adminResumeMinPctSubtitle =>
      'Прогрессті сақтау үшін мазмұн осы пайыздан жоғары ойнатылуы керек';

  @override
  String get adminResumeMaxPct => 'Резюменің максималды пайызы';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Осы пайыздан кейін мазмұн толығымен ойнатылды деп саналады';

  @override
  String get adminResumeMinDuration => 'Ең аз түйіндеме ұзақтығы (секунд)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Бұдан қысқа элементтерді қалпына келтіру мүмкін емес';

  @override
  String get adminTrickplayScanBehavior => 'Тәртіпті сканерлеу';

  @override
  String get adminTrickplayProcessPriority => 'Процесс басымдығы';

  @override
  String get adminTrickplayTileWidth => 'Плитка ені';

  @override
  String get adminTrickplayTileHeight => 'Плитка биіктігі';

  @override
  String get adminTrickplayProcessThreads => 'Жіптерді өңдеу';

  @override
  String get adminTrickplayWidthResolutions => 'Ені ажыратымдылықтары';

  @override
  String get adminMetadataDefault => 'Әдепкі';

  @override
  String get adminMetadataContentTypeUpdated => 'Мазмұн түрі жаңартылды';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Мазмұн түрін жаңарту мүмкін болмады: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Баяу жауап шегі (мс)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Баяу жауап туралы ескертулерді қосу';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect қосу';

  @override
  String get adminGeneralSectionServer => 'Сервер';

  @override
  String get adminGeneralSectionMetadata => 'Метадеректер';

  @override
  String get adminGeneralSectionPaths => 'Жолдар';

  @override
  String get adminGeneralSectionPerformance => 'Өнімділік';

  @override
  String get adminGeneralCachePath => 'Кэш жолы';

  @override
  String get adminGeneralMetadataPath => 'Метадеректер жолы';

  @override
  String get adminGeneralServerName => 'Сервер атауы';

  @override
  String get adminGeneralDisplayLanguage => 'Қалаулы көрсету тілі';

  @override
  String get adminSettingsLoadFailed => 'Параметрлерді жүктеу сәтсіз аяқталды';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Салыстыруларды жаңарту мүмкін болмады: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Уақыт шегі: $duration';
  }

  @override
  String get folders => 'Қалталар';

  @override
  String get libraries => 'Медиатекалар';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay өшірілген';

  @override
  String get syncPlayDisabledMessage =>
      'Синхрондалған ойнатуды пайдалану үшін SyncPlay параметрін Параметрлерде қосыңыз.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Серверге қолдау көрсетілмейді';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay үшін Jellyfin сервері қажет. Ағымдағы сервер оны қолдамайды.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay тобы';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay тобы';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# қатысушы',
      one: '# қатысушы',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Күтуді елемеу';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Бұл құрылғы буферленген кезде топты жоғары ұстамаңыз';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Баяу мүшелерді күтпестен жергілікті жерде жалғастырыңыз';

  @override
  String get syncPlayRepeat => 'Қайталау';

  @override
  String get syncPlayRepeatOne => 'Бір';

  @override
  String get syncPlayShuffleModeShuffled => 'Аралас';

  @override
  String get syncPlayShuffleModeSorted => 'Сұрыпталған';

  @override
  String get syncPlaySyncCurrentQueue => 'Ағымдағы ойнату кезегін синхрондау';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Топтық кезекті жергілікті жерде ойнайтын нәрсемен ауыстырыңыз';

  @override
  String get syncPlayLeaveGroup => 'Топтан шығу';

  @override
  String get syncPlayGroupQueue => 'Топтық кезек';

  @override
  String syncPlayQueueItemFallback(int index) {
    return '$index-элемент';
  }

  @override
  String get syncPlayPlayNow => 'Қазір ойнаңыз';

  @override
  String get syncPlayCreateNewGroup => 'Жаңа топ құру';

  @override
  String get syncPlayGroupName => 'Топ аты';

  @override
  String get syncPlayDefaultGroupName => 'Менің SyncPlay тобым';

  @override
  String get syncPlayCreateGroup => 'Топ құру';

  @override
  String get syncPlayAvailableGroups => 'Қолжетімді топтар';

  @override
  String get syncPlayNoGroupsAvailable => 'Топтар жоқ';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay тобына қосылу керек пе?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay тобына қосылу ағымдағы ойнату кезегін ауыстыруы мүмкін. Жалғастыру керек пе?';

  @override
  String get syncPlayJoin => 'Қосылыңыз';

  @override
  String get syncPlayStateIdle => 'Бос';

  @override
  String get syncPlayStateWaiting => 'Күтуде';

  @override
  String get syncPlayStatePaused => 'Кідіртілді';

  @override
  String get syncPlayStatePlaying => 'Ойнап жатыр';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay тобына қосылды';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay тобынан шықты';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay кіруге тыйым салынды';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Осы SyncPlay тобындағы бір немесе бірнеше элементтерге кіру рұқсатыңыз жоқ. Топ иесінен кітапхана рұқсаттарын тексеруді немесе басқа кезекті таңдауды сұраңыз.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Ойнату $groupName тобымен синхрондалуда';
  }

  @override
  String get voiceSearchUnavailable => 'Дауыспен іздеу қолжетімсіз.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision тікелей ойнату сәтсіз аяқталды';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Осы Dolby Vision ағыны үшін тікелей ойнатуды бастау мүмкін болмады. Серверді қайта кодтау арқылы қайталап көріңіз бе?';

  @override
  String get retryWithTranscode => 'Транскод арқылы қайталап көріңіз';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Dolby Vision қолданбасына қолдау көрсетілмейді';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Бұл құрылғы Dolby Vision мазмұнын тікелей шеше алмайды. HDR10 қалпына келтіру нұсқасын пайдаланыңыз немесе серверді қайта кодтауды сұраңыз.';

  @override
  String get rememberMyChoice => 'Менің таңдауымды есте сақтаңыз';

  @override
  String get playHdr10Fallback => 'HDR10 нұсқасын ойнату';

  @override
  String get requestTranscode => 'Транскодты сұрау';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# жол табылды',
      one: '# жол табылды',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Барлығын көру';

  @override
  String get noItems => 'Элементтер жоқ';

  @override
  String get switchUser => 'Пайдаланушыны ауыстыру';

  @override
  String get remoteControl => 'Қашықтан басқару құралы';

  @override
  String get mediaBarLoading => 'Медиа жолағы жүктелуде...';

  @override
  String get mediaBarError => 'Медиа жолақ жүктелмеді';

  @override
  String get offlineServerUnavailable =>
      'Интернетке қосылған, бірақ ағымдағы сервер қолжетімсіз.';

  @override
  String get offlineNoInternet =>
      'Сіз желіден тыссыз. Тек жүктеп алынған мазмұн қолжетімді.';

  @override
  String get offlineFileNotAvailable => 'Файл қолжетімді емес';

  @override
  String get offlineSwitchServer => 'Серверді ауыстыру';

  @override
  String get offlineSavedMedia => 'Сақталған медиа';

  @override
  String get offlineBannerTitle => 'Желіден тыссыз';

  @override
  String get offlineBannerSubtitle => 'Жүктеулеріңіз көрсетілуде';

  @override
  String get serverUnreachableBannerTitle => 'Серверге қосылу мүмкін емес';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Ол қайта қосылғанша жүктеулерден ойнатылуда';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Қашықтан ойнату';

  @override
  String castControlFailed(String error) {
    return 'Cast басқаруы орындалмады: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind басқару элементтері';
  }

  @override
  String get castDeviceVolume => 'Құрылғының дыбыс деңгейі';

  @override
  String get castVolumeUnavailable => 'Қолжетімсіз';

  @override
  String castStopKind(String kind) {
    return '$kind тоқтату';
  }

  @override
  String get audioLabel => 'Аудио';

  @override
  String get subtitlesLabel => 'Субтитрлер';

  @override
  String get pinConfirmTitle => 'PIN кодын растаңыз';

  @override
  String get pinSetTitle => 'PIN кодын орнату';

  @override
  String get pinEnterTitle => 'PIN кодын енгізіңіз';

  @override
  String get pinReenterToConfirm => 'Растау үшін PIN кодын қайта енгізіңіз';

  @override
  String pinEnterNDigit(int length) {
    return '$length таңбалы PIN енгізіңіз';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return '$length таңбалы PIN кодыңызды енгізіңіз';
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
  String get pinIncorrect => 'Қате PIN';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN кодтары сәйкес келмейді';

  @override
  String get pinForgot => 'PIN кодын ұмыттыңыз ба?';

  @override
  String get pinClear => 'Тазалау';

  @override
  String get pinBackspace => 'Жою';

  @override
  String get quickConnectAuthorized => 'Quick Connect сұранысы расталды.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect коды жарамсыз немесе мерзімі өткен.';

  @override
  String get quickConnectNotSupported =>
      'Бұл серверде Quick Connect функциясына қолдау көрсетілмейді.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect кодын растау мүмкін болмады.';

  @override
  String get quickConnectDisabled => 'Бұл серверде Quick Connect өшірілген.';

  @override
  String get quickConnectForbidden =>
      'Тіркелгіңіз осы Quick Connect сұрауына рұқсат бере алмайды.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect коды табылмады. Жаңа кодты байқап көріңіз.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect қатесі: $message';
  }

  @override
  String get quickConnectEnterCode => 'Кодты енгізіңіз';

  @override
  String get quickConnectAuthorize => 'Рұқсат ету';

  @override
  String remoteCommandFailed(String error) {
    return 'Пәрмен орындалмады: $error';
  }

  @override
  String get remoteControlTitle => 'Қашықтан басқару құралы';

  @override
  String get remoteFailedToLoadSessions => 'Сеанстарды жүктеу сәтсіз аяқталды';

  @override
  String get remoteNoSessions => 'Басқарылатын сеанстар жоқ';

  @override
  String get remoteStartPlayback => 'Басқа құрылғыда ойнатуды бастаңыз';

  @override
  String get unknownUser => 'Белгісіз';

  @override
  String get unknownItem => 'Белгісіз';

  @override
  String get remoteNothingPlaying => 'Бұл сеанста ештеңе ойнамайды';

  @override
  String get castingStarted => 'Таңдалған құрылғыда трансляция басталды';

  @override
  String castingFailed(String error) {
    return 'Тасымалдауды бастау мүмкін болмады: $error';
  }

  @override
  String get noRemoteDevices => 'Қашықтан ойнату құрылғылары қолжетімді емес.';

  @override
  String get noRemoteDevicesIos =>
      'Қашықтан ойнату құрылғылары қолжетімді емес.\n\niOS жүйесінде AirPlay мақсаттары симуляторда қолжетімсіз болуы мүмкін.';

  @override
  String get trackActionPlayNext => 'Келесі ойнату';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Кезекке қосу';

  @override
  String get trackActionAddToPlaylist => 'Ойнату тізіміне қосу';

  @override
  String get trackActionCancelDownload => 'Жүктеп алудан бас тарту';

  @override
  String get trackActionDeleteFromPlaylist => 'Ойнату тізімінен жою';

  @override
  String get trackActionMoveUp => 'Жоғары жылжыту';

  @override
  String get trackActionMoveDown => 'Төменге жылжытыңыз';

  @override
  String get trackActionRemoveFromFavorites => 'Таңдаулылардан өшіру';

  @override
  String get trackActionAddToFavorites => 'Таңдаулыларға қосу';

  @override
  String get trackActionGoToAlbum => 'Альбомға өтіңіз';

  @override
  String get trackActionGoToArtist => 'Суретшіге өтіңіз';

  @override
  String trackActionDownloading(String name) {
    return '$name жүктелуде...';
  }

  @override
  String get trackActionDeletedFile => 'Жүктеп алынған файл жойылды';

  @override
  String get trackActionDeleteFileFailed =>
      'Жүктеп алынған файлды жою мүмкін болмады';

  @override
  String get shuffleBy => 'Араластыру';

  @override
  String get shuffleSelectLibrary => 'Кітапхана таңдаңыз';

  @override
  String get shuffleSelectGenre => 'Жанр таңдаңыз';

  @override
  String get shuffleLibrary => 'Медиатека';

  @override
  String get shuffleGenre => 'Жанр';

  @override
  String get shuffleNoLibraries => 'Үйлесімді кітапханалар жоқ.';

  @override
  String get shuffleNoGenres => 'Бұл араластыру режимі үшін жанрлар табылмады.';

  @override
  String get posterDisplayTitle => 'Дисплей';

  @override
  String get posterImageType => 'Кескін түрі';

  @override
  String get imageTypePoster => 'Постер';

  @override
  String get imageTypeThumbnail => 'Нобай';

  @override
  String get imageTypeBanner => 'Баннер';

  @override
  String get playlistAddFailed => 'Ойнату тізіміне қосу мүмкін болмады';

  @override
  String get playlistCreateFailed => 'Ойнату тізімі жасалмады';

  @override
  String get playlistNew => 'Жаңа ойнату тізімі';

  @override
  String get playlistCreate => 'Жасау';

  @override
  String get playlistCreateNew => 'Жаңа ойнату тізімін жасау';

  @override
  String get playlistNoneFound => 'Ойнату тізімдері табылмады';

  @override
  String get addToPlaylist => 'Ойнату тізіміне қосу';

  @override
  String get lyricsNotAvailable => 'Ән мәтіндері жоқ';

  @override
  String get upNext => 'Келесі';

  @override
  String get playNext => 'Келесі ойнату';

  @override
  String get stillWatchingContent =>
      'Ойнату кідіртілді. Сіз әлі қарап отырсыз ба?';

  @override
  String get stillWatchingStop => 'Тоқтату';

  @override
  String get stillWatchingContinue => 'Жалғастыру';

  @override
  String skipSegment(String segment) {
    return '$segment өткізіп жіберу';
  }

  @override
  String get liveTv => 'Тікелей теледидар';

  @override
  String get continueWatchingAndNextUp => 'Көруді және келесіні жалғастыру';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$total ішінен $current жүктелуде — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName жүктелуде';
  }

  @override
  String get nextEpisode => 'Келесі эпизод';

  @override
  String get moreFromThisSeason => 'Осы маусымнан көбірек';

  @override
  String get playerTooltipPlaybackSpeed => 'Ойнату жылдамдығы';

  @override
  String get playerTooltipCastControls => 'Трансляцияны басқару элементтері';

  @override
  String get playerTooltipPlaybackQuality => 'Бит жылдамдығы';

  @override
  String get playerTooltipEnterFullscreen => 'Толық экранға өтіңіз';

  @override
  String get playerTooltipExitFullscreen => 'Толық экраннан шығу';

  @override
  String get playerTooltipFloatOnTop => 'Үстінде қалқыңыз';

  @override
  String get playerTooltipExitFloatOnTop => 'Үстіңгі жағындағы қалқыманы өшіру';

  @override
  String get playerTooltipLockLandscape => 'Пейзажды құлыптау';

  @override
  String get playerTooltipUnlockOrientation => 'Айналдыруға рұқсат етіңіз';

  @override
  String get playerTooltipPrevious => 'Алдыңғы';

  @override
  String get playerTooltipSeekBack => 'Артқа іздеу';

  @override
  String get playerTooltipSeekForward => 'Алға ұмтыл';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Қаралған деп белгілеу';

  @override
  String get contextMenuMarkUnwatched => 'Қаралмаған деп белгілеңіз';

  @override
  String get contextMenuAddToFavorites => 'Таңдаулыларға қосу';

  @override
  String get contextMenuRemoveFromFavorites => 'Таңдаулылардан өшіру';

  @override
  String get contextMenuGoToSeries => 'Серияға өтіңіз';

  @override
  String get contextMenuHideFromContinueWatching =>
      '«Көруді жалғастыру» бөлімінен жасыру';

  @override
  String get contextMenuHideFromNextUp => '«Келесі» бөлімінен жасыру';

  @override
  String get contextMenuAddToCollection => 'Жинаққа қосу';

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
      'Серверді басқару тақтасына қол жеткізіңіз';

  @override
  String get settingsDynamicContent => 'Динамикалық мазмұн';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медиа жолағы және көрнекі қабаттасмалар';

  @override
  String get settingsAboutSubtitle =>
      'Қолданба нұсқасы, заңды ақпарат және несиелер';

  @override
  String get settingsSortServersBy => 'Серверлерді сұрыптау';

  @override
  String get settingsLastUsed => 'Соңғы пайдаланылған';

  @override
  String get settingsAlphabetical => 'Алфавиттік';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Өздігінен қол қойылған сертификаттарға рұқсат ету';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Өздігінен қол қойылған немесе жеке ЦС берген TLS сертификаттарын пайдаланатын серверлерге сену. Тек өзіңіз басқаратын серверлер үшін қосыңыз. Бұл барлық қосылым үшін сертификатты тексеруді өшіреді.';

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
  String get settingsHomePage => 'Негізгі бет';

  @override
  String get settingsTwentyFourHourClock => '24 сағаттық сағат';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Сағат көрсетілген жерде 24 сағаттық уақыт пішімдеуін пайдаланыңыз';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Шарлау жолағында араластыру түймесін көрсетіңіз';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Шарлау жолағында жанрлар түймесін көрсетіңіз';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Навигация жолағында таңдаулылар түймесін көрсетіңіз';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Шарлау жолағында кітапханалар түймесін көрсетіңіз';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Навигация жолағында Seerr түймесін көрсету';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Жоғарғы навигация жолағында мәтіндік белгілерді әрқашан көрсету';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Әрбір кітапхананың басты бетінің көріну мүмкіндігін ауыстырып-қосқыш. Өзгерістердің күшіне енуі үшін Moonfin қолданбасын қайта іске қосыңыз.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Медиа жолағы және жергілікті алдын ала қараулар';

  @override
  String get settingsVisualOverlays => 'Көрнекі қабаттасулар';

  @override
  String get settingsSeasonalSurprise => 'Маусымдық тосынсый';

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
  String get settingsHigh => 'Жоғары';

  @override
  String get settingsLow => 'Төмен';

  @override
  String get settingsCustomPath => 'Теңшелетін жол';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Жүктеп алу қалтасының жолын енгізіңіз';

  @override
  String get settingsConcurrentDownloads => 'Бір мезгілде жүктеулер';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Бірден жүктеп алуға болатын элементтердің максималды саны.';

  @override
  String get settingsAppInfo => 'ҚОЛДАНБА АҚПАРАТЫ';

  @override
  String get settingsReportAnIssue => 'Мәселе туралы хабарлау';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub жүйесінде мәселені бақылау құралын ашыңыз';

  @override
  String get settingsJoinDiscord => 'Discord-қа қосылыңыз';

  @override
  String get settingsJoinDiscordSubtitle => 'Қауымдастықпен сөйлесу';

  @override
  String get settingsJoinTheDiscord => 'Discord қосылыңыз';

  @override
  String get settingsSupportMoonfin => 'Қолдау Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Әзірлеушіге бір кесе кофеге қайыр беру';

  @override
  String get settingsLegal => 'ЗАҢДЫ';

  @override
  String get settingsLicenses => 'Лицензиялар';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Ашық бастапқы лицензия туралы ескертулер';

  @override
  String get settingsPrivacyPolicy => 'Құпиялылық саясаты';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin деректеріңізді қалай өңдейді';

  @override
  String get settingsCheckForUpdates => 'Жаңартуларды тексеріңіз';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Соңғы Moonfin шығарылымын тексеріңіз';

  @override
  String get settingsBoth => 'Екеуі де';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Мазмұн түрі сүзгісін араластыру';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аудио тректер, өңдеу және өту опциялары';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматтандырылған ойнату және реттілік';

  @override
  String get settingsSyncplaySubtitle =>
      'Топтық сеанстар үшін синхрондау логикасы';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Кіріспелер мен шығыстарды өткізіп жіберу керек пе?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Медиасегмент кері санағы';

  @override
  String get settingsProgressBar => 'Прогресс жолағы';

  @override
  String get settingsTimer => 'Таймер';

  @override
  String get settingsNone => 'Жоқ';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Шұғыл пайдаланушы';

  @override
  String get settingsSkip => 'Өткізіп жіберу';

  @override
  String get settingsDoNothing => 'Ештеңе жасама';

  @override
  String get settingsMaxBitrateDescription =>
      'Ағынның бит жылдамдығын шектеңіз. Осы шекті мәннен жоғары мазмұн сәйкестендіру үшін қайта кодталады.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ойыншы сұрайтын максималды ажыратымдылықты шектеңіз. Ажыратымдылығы жоғары мазмұн қайта кодталады.';

  @override
  String get settingsPlayerZoomDescription =>
      'Бейнені экранға сыйғызу үшін қалай масштабтау керек.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Ойнату механизмі (Android теледидары)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV құрылғыларында әдепкі ойнату механизмін таңдаңыз. Өзгерістер келесі ойнату сеансына қолданылады.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (ұсынылады)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (мұра)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision Қайта';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision декодтауы жоқ құрылғылардағы Dolby Vision тақырыптарының әрекеті.';

  @override
  String get settingsAskEachTime => 'Әр жолы сұраңыз';

  @override
  String get settingsPreferHdr10Fallback =>
      'HDR10 қалпына келтіруге артықшылық беріңіз';

  @override
  String get settingsPreferServerTranscode => 'Серверді транскодтауды ұнатыңыз';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision профилі 7 тікелей ойнату';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision профилінің 7 жақсарту қабатының ағындарының тікелей ойнату қажеттігін басқарады.';

  @override
  String get settingsAutoAftkrtEnabled => 'Авто (AFTKRT қосылған)';

  @override
  String get settingsEnabledOnThisDevice => 'Бұл құрылғыда қосылған';

  @override
  String get settingsDisabledPreferTranscode => 'Өшірілген (транскодты таңдау)';

  @override
  String get settingsResumeRewindDescription =>
      'Ойнатуды жалғастырған кезде (Көруді жалғастыру немесе мультимедиа элементі бетінен) қанша секундты кері айналдыру керек?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Кідірту түймесін басқаннан кейін ойнатуды жалғастырған кезде, неше секунд қайта оралу керек?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Артқа айналдыру түймесін басқаннан кейін неше секунд артқа секіру керек.';

  @override
  String get settingsOneSecond => '1 секунд';

  @override
  String get settingsThreeSeconds => '3 секунд';

  @override
  String get settingsFortyFiveSeconds => '45 секунд';

  @override
  String get settingsSixtySeconds => '60 секунд';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Жылдам алға түймесін басқаннан кейін қанша секунд алға секіру керек.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'AC3 биттік ағыны сыртқы декодерге';

  @override
  String get settingsCinemaMode => 'Кинотеатр режимі';

  @override
  String get settingsCinemaModeSubtitle =>
      'Негізгі мүмкіндіктен бұрын трейлерлерді/алдын ала роликтерді ойнату';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Кеңейтілген эпизод суреті мен сипаттамасы бар толық картаны көрсетеді. Минималды ықшам кері санақ қабатын көрсетеді. Өшірулі болса шақыруды толығымен жасырады.';

  @override
  String get settingsShort => 'Қысқа';

  @override
  String get settingsLong => 'Ұзақ';

  @override
  String get settingsVeryLong => 'Өте ұзақ';

  @override
  String get settingsVideoStartDelay => 'Бейнені бастаудың кешігуі';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value мс';
  }

  @override
  String get settingsLiveTvDirect => 'Тікелей тікелей эфир';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Live TV үшін тікелей ойнатуды қосыңыз';

  @override
  String get settingsOpenGroups => 'Топтарды ашыңыз';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay топтарын жасаңыз, қосылыңыз немесе басқарыңыз';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay қосулы';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Топтық көру мүмкіндіктерін қосыңыз';

  @override
  String get settingsSyncplayButton => 'SyncPlay түймесі';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Шарлау жолағында SyncPlay түймесін көрсетіңіз';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Жетілдірілген түзету';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Ұқсас синхрондау логикасын қосыңыз';

  @override
  String get settingsSyncplaySyncCorrection => 'Синхронды түзету';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Синхронда болу үшін ойнатуды автоматты түрде реттеңіз';

  @override
  String get settingsSyncplaySpeedToSync => 'Синхрондау жылдамдығы';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Синхрондау үшін ойнату жылдамдығын реттеуді пайдаланыңыз';

  @override
  String get settingsSyncplaySkipToSync => 'Синхрондауға өтіңіз';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Синхрондау үшін іздеуді пайдаланыңыз';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Ең аз жылдамдықты кешіктіру';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Максималды жылдамдықты кешіктіру';

  @override
  String get settingsSyncplaySpeedDuration => 'Жылдамдық ұзақтығы';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Ең аз өткізіп жіберу кешігуі';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay қосымша офсет';

  @override
  String get onNow => 'Қазір қосулы';

  @override
  String get collections => 'Жинақтар';

  @override
  String get lastPlayed => 'Соңғы ойналған';

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
    return 'Жақында шыққан: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Келесі эпизодты автоойнату';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Қолжетімді болғанда келесі эпизодты автоматты түрде ойнату.';

  @override
  String get skipSilenceTitle => 'Үнсіздікті өткізіп жіберу';

  @override
  String get skipSilenceSubtitle =>
      'Ағын қолдаса, үнсіз аудиосегменттерді автоматты түрде өткізіп жіберу.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Сыртқы аудиоәсерлерге рұқсат ету';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Эквалайзер мен әсер қолданбаларына (мыс. Wavelet) Media3 ойнату сеанстарына қосылуға рұқсат ету.';

  @override
  String get disableTunnelingTitle => 'Туннельдеуді өшіру';

  @override
  String get disableTunnelingSubtitle =>
      'Туннельсіз ойнатуды мәжбүрлеу. Туннельдеу кезінде аудио/бейне үзілістері бар құрылғыларда пайдалы.';

  @override
  String get enableTunnelingTitle => 'Туннельдеуді қосу';

  @override
  String get enableTunnelingSubtitle =>
      'Кеңейтілген. Аудио мен бейнені байланысқан аппараттық жол арқылы бағыттайды. Кейбір құрылғыларда аудио/бейне үзілістерін тудыратындықтан әдепкіде өшірулі.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision 7-профилін HEVC-ке салыстыру';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'DV емес құрылғыларда Dolby Vision 7-профиль ағындарын HDR10-үйлесімді HEVC ретінде ойнату.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Кірістірілген субтитр стильдерін пайдалану';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Субтитр трегіне кірістірілген түстерді, қаріптерді және орналасуды қолдану. Оның орнына өз субтитр стилі параметрлеріңізді пайдалану үшін өшіріңіз.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Кірістірілген субтитр қаріп өлшемдерін пайдалану';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Субтитр трегіне кірістірілген қаріп өлшемі кеңестерін қолдану. Стиль параметрлеріңіздегі субтитр өлшемін пайдалану үшін өшіріңіз.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Медиа мәліметтерін көрсету';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Таңдалған элементтің мәліметтерін кітапхана беттерінің жоғарғы жағында көрсету.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Толық ішкі тақырыптарды пайдалану';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Кітапхана беттерінде толық немесе қысқа ішкі жолды көрсету.';

  @override
  String get savedThemesDeleteDialogTitle => 'Сақталған тақырып жойылсын ба?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '«$themeName» осы құрылғының кэшінен жойылсын ба?';
  }

  @override
  String get themeStore => 'Тақырыптар дүкені';

  @override
  String get themeStoreSubtitle => 'Қауымдастық тақырыптарын шолу және сақтау';

  @override
  String get themeStoreDescription =>
      'Тақырыпты басқа сақталған тақырыптарыңыздай пайдалану үшін оны сақтаңыз.';

  @override
  String get themeStoreEmpty => 'Қазір қолжетімді тақырыптар жоқ.';

  @override
  String get themeStoreLoadFailed =>
      'Тақырыптар дүкенін жүктеу мүмкін болмады. Қосылымыңызды тексеріп, қайталап көріңіз.';

  @override
  String get themeStoreSave => 'Сақтау';

  @override
  String get themeStoreSaveAndApply => 'Сақтап, қолдану';

  @override
  String get themeStoreSaved => 'Сақталды';

  @override
  String get themeStoreInvalidMessage => 'Бұл тақырыпты жүктеу мүмкін болмады.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '«$themeName» сақталды.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '«$themeName» осы құрылғыдан жойылды.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '«$themeName» жою мүмкін болмады.';
  }

  @override
  String get savedThemesTitle => 'Сақталған тақырыптар';

  @override
  String get savedThemesDescription =>
      'Бұл — ағымдағы сервер үшін Moonfin плагинінен жүктелген тақырыптар. Жою тек осы жергілікті көшірмені өшіреді.';

  @override
  String get savedThemesEmpty =>
      'Бұл сервер үшін сақталған тақырыптар табылмады.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Қазір белсенді';
  }

  @override
  String get savedThemesDeleteTooltip => 'Сақталған тақырыпты жою';

  @override
  String get savedThemesManageSubtitle =>
      'Осы құрылғыда жүктелген плагин тақырыптарын басқару';

  @override
  String get themeEditor => 'Тақырып өңдегіші';

  @override
  String get themeEditorSubtitle => 'Браузерде Moonfin тақырып өңдегішін ашу';

  @override
  String get homeScreen => 'Негізгі экран';

  @override
  String get bottomBar => 'Төменгі жолақ';

  @override
  String get homeRowsStyleClassic => 'Классикалық';

  @override
  String get homeRowsStyleModern => 'Заманауи';

  @override
  String get homeRowsSection => 'Негізгі бет жолдары';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      '«Классикалық» әр жолдың кескін түрі мен ақпарат қабатын сақтайды. «Заманауи» тік бағыттан фондық кескінге өтетін жолдарды пайдаланады.';

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
  String get displayFavoritesRows => 'Таңдаулылар жолдарын көрсету';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Негізгі бет бөлімдерінде таңдаулы фильмдер, сериалдар және басқа таңдаулы жолдарды көрсету.';

  @override
  String get favoritesRowSorting => 'Таңдаулылар жолын сұрыптау';

  @override
  String get favoritesRowSortingDescription =>
      'Таңдаулылар жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Жинақтар жолдарын көрсету';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Негізгі бет бөлімдерінде жинақтар жолдарын көрсету.';

  @override
  String get collectionsRowSorting => 'Жинақтар жолын сұрыптау';

  @override
  String get collectionsRowSortingDescription =>
      'Жинақтар жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Жанрлар жолдарын көрсету';

  @override
  String get displayGenresRowsSubtitle =>
      'Негізгі бет бөлімдерінде жанрлар жолдарын көрсету.';

  @override
  String get genresRowSorting => 'Жанрлар жолын сұрыптау';

  @override
  String get genresRowSortingDescription =>
      'Жанрлар жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Жанрлар жолының элементтері';

  @override
  String get genresRowItemsDescription =>
      'Жанрлар жолдарында фильмдерді, сериалдарды немесе екеуін де көрсету.';

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
  String get displayPlaylistsRows => 'Ойнату тізімі жолдарын көрсету';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Негізгі бет бөлімдерінде ойнату тізімі жолдарын көрсету.';

  @override
  String get playlistsRowSorting => 'Ойнату тізімі жолын сұрыптау';

  @override
  String get playlistsRowSortingDescription =>
      'Ойнату тізімі жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Аудио жолдарын көрсету';

  @override
  String get displayAudioRowsSubtitle =>
      'Негізгі бет бөлімдерінде аудио жолдарын көрсету.';

  @override
  String get audioRowsSorting => 'Аудио жолдарын сұрыптау';

  @override
  String get audioRowsSortingDescription =>
      'Аудио жолдарын қосылған күні, шығу күні, әліпби бойынша және басқаша сұрыптаңыз.';

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
  String get audioPlaylists => 'Аудио ойнату тізімдері';

  @override
  String get appearance => 'Сыртқы түрі';

  @override
  String get layout => 'Қалып';

  @override
  String get theme => 'Тақырып';

  @override
  String get keyboard => 'Пернетақта';

  @override
  String get navButtons => 'Түймелер';

  @override
  String get rendering => 'Рендеринг';

  @override
  String get mpvConfiguration => 'MPV конфигурациясы';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Сыртқы ойнатқыш қолданбасы';

  @override
  String get externalPlayerAppDescription =>
      'Ұзақ басу арқылы ойнату опциясын қосу үшін сыртқы ойнатқышты орнатыңыз';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Ойнату басталғанда қолданба таңдағышын көрсету.';

  @override
  String get loadingInstalledPlayers => 'Орнатылған ойнатқыштар жүктелуде...';

  @override
  String get connection => 'Қосылым';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Транзит';

  @override
  String get supportedOnThisDevice => 'Бұл құрылғыда қолдау көрсетіледі';

  @override
  String get notSupportedOnThisDevice => 'Бұл құрылғыда қолдау көрсетілмейді';

  @override
  String get mediaPlayerBehavior => 'Медиаойнатқыш әрекеті';

  @override
  String get playbackEnhancements => 'Ойнату жақсартулары';

  @override
  String get alwaysOn => 'Әрқашан қосулы.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      '«Титрді өткізу» орнына «Келесі» көрінісін қолдану';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      '«Титрді өткізу» түймесінің орнына «Келесі» қабатын көрсету.';

  @override
  String get playerRouting => 'Ойнатқыш бағыттауы';

  @override
  String get preferSoftwareDecoders => 'Бағдарламалық декодерлерді таңдау';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Аппараттық декодерлерден бұрын FFmpeg (аудио) және libgav1 (AV1) пайдалану. HDMI аудио транзиті бұзылса, өшіріңіз.';

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
      'Android TV-де бейнені таңдалған сыртқы қолданбада ойнату.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Автоматты кезекке қою';

  @override
  String get preferSdhSubtitles => 'SDH субтитрлерін таңдау';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Автоматты таңдау кезінде SDH/CC субтитр тректеріне басымдық беру.';

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
  String get webDiagnosticsTitle => 'Moonfin веб-диагностикасы';

  @override
  String get webDiagnosticsIntro =>
      'Браузердің қосылым мәселелерін (CORS, аралас мазмұн және табу параметрлері) диагностикалау үшін осы бетті пайдаланыңыз.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Аралас мазмұн қатесі анықталды';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight қатесі анықталды';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin HTTPS бетінің HTTP сервер URL-іне қоңырау шалу әрекетін анықтады. Браузерлер бұл сұранысты серверіңізге жетпей тұрып бұғаттайды.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin браузер деңгейіндегі сұраныс қатесін анықтады, ол әдетте медиасервердегі CORS немесе preflight тақырыптарының болмауынан туындайды.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Мақсатты URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Мәлімет: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Ағымдағы орындалу контексті';

  @override
  String get webDiagnosticsOrigin => 'Бастапқы көзі';

  @override
  String get webDiagnosticsScheme => 'Схема';

  @override
  String get webDiagnosticsPluginMode => 'Плагин режимі';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC сканерлеуі';

  @override
  String get webDiagnosticsForcedServerUrl => 'Мәжбүрлі сервер URL-і';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Әдепкі сервер URL-і';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Табу прокси URL-і';

  @override
  String get notConfigured => 'конфигурацияланбаған';

  @override
  String get webDiagnosticsMixedContent => 'Аралас мазмұн';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Бұл бет HTTPS арқылы жүктелген, бірақ бір немесе бірнеше конфигурацияланған URL — HTTP. Браузерлер HTTPS беттеріне HTTP API-ге қоңырау шалуды бұғаттайды.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Түзету: медиасерверіңізді немесе прокси нүктеңізді HTTPS арқылы ұсыныңыз, немесе Moonfin-ді HTTP арқылы тек сенімді жергілікті желілерде жүктеңіз.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Ағымдағы орындалу параметрлерінен айқын аралас мазмұн конфигурациясы анықталмады.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS тексеру тізімі';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Браузердің бастапқы көзіне Access-Control-Allow-Origin ішінде рұқсат етіңіз.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers ішіне Authorization, X-Emby-Authorization және X-Emby-Token қосыңыз.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Ағын мен айналдыру әрекеті үшін Content-Range және Accept-Ranges ашыңыз.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight сұраныстарына 204 қайтарыңыз.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Тақырып үзіндісінің мысалы (nginx стилінде)';

  @override
  String get note => 'Ескертпе';

  @override
  String get webDiagnosticsNonWebNote =>
      'Бұл диагностика бағыты веб-құрастырылымдарға арналған. Мұны басқа платформада көріп тұрсаңыз, бұл тексерулер қолданылмауы мүмкін.';

  @override
  String get backToServerSelect => 'Сервер таңдауға оралу';

  @override
  String get signOutAllUsers => 'Барлық пайдаланушыны шығару';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Микрофон рұқсаты біржола қабылданбады. Оны жүйе параметрлерінде қосыңыз.';

  @override
  String get voiceSearchPermissionRequired =>
      'Дауыстық іздеу үшін микрофон рұқсаты қажет.';

  @override
  String get voiceSearchNoMatch => 'Түсінбедім. Қайталап көріңіз.';

  @override
  String get voiceSearchNoSpeechDetected => 'Сөйлеу анықталмады.';

  @override
  String get voiceSearchMicrophoneError => 'Микрофон қатесі.';

  @override
  String get voiceSearchNeedsInternet => 'Дауыстық іздеу үшін интернет қажет.';

  @override
  String get voiceSearchServiceBusy =>
      'Дауыстық қызмет бос емес. Қайталап көріңіз.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Микрофон рұқсаты біржола қабылданбады.';

  @override
  String get microphonePermissionDenied => 'Микрофон рұқсаты қабылданбады.';

  @override
  String get speechRecognitionUnavailable =>
      'Сөйлеуді тану бұл құрылғыда қолжетімсіз.';

  @override
  String get openIosRoutePicker => 'iOS бағыт таңдағышын ашу';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay бағыт таңдағышы бұл құрылғыда қолжетімсіз.';

  @override
  String get videos => 'Бейнелер';

  @override
  String get programs => 'Бағдарламалар';

  @override
  String get songs => 'Әндер';

  @override
  String get photoAlbums => 'Фотоальбомдар';

  @override
  String get photos => 'Фотосуреттер';

  @override
  String get people => 'Адамдар';

  @override
  String get recentlyReleasedEpisodes => 'Жақында шыққан эпизодтар';

  @override
  String get watchAgain => 'Қайта көру';

  @override
  String get guestAppearances => 'Қонақ ретінде қатысу';

  @override
  String get appearancesSeerr => 'Қатысуы (Seerr)';

  @override
  String get crewContributionsSeerr => 'Түсіру тобының үлесі (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Топпен бірге көру';

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
  String get openInBrowser => 'Браузерде ашу';

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
      'Кірістірілген браузер бұл платформада қолжетімсіз.';

  @override
  String get adminRestartServerConfirmation => 'Сервер қайта іске қосылсын ба?';

  @override
  String get adminShutdownServerConfirmation =>
      'Сервер өшірілсін бе? Оны қолмен қайта іске қосу қажет болады.';

  @override
  String get internal => 'Ішкі';

  @override
  String get idle => 'Бос';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Пайдаланушылар табылмады';

  @override
  String get adminNoUsersMatchSearch => 'Іздеуіңізге сәйкес пайдаланушы жоқ';

  @override
  String get adminNoDevicesFound => 'Құрылғылар табылмады';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Ағымдағы сүзгілерге сәйкес құрылғы жоқ';

  @override
  String get remoteAccess => 'Қашықтан қатынау';

  @override
  String get localOnly => 'Тек жергілікті';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Медиа аналитикасын жүктеу мүмкін болмады';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Барлық медиакітапхана бойынша біріктірілген аналитика.';

  @override
  String get analyticsTopArtists => 'Үздік орындаушылар';

  @override
  String get analyticsTopAuthors => 'Үздік авторлар';

  @override
  String get analyticsTopContributors => 'Үздік үлес қосушылар';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Кітапхана',
      one: '$count Кітапхана',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Бұл таңдау үшін индекстелген медиа қосындылары әзірге қолжетімсіз.';

  @override
  String get analyticsLibraryDetails => 'Кітапхана мәліметтері';

  @override
  String get analyticsLibraryBreakdown => 'Кітапхана бөлінісі';

  @override
  String get analyticsNoLibrariesAvailable => 'Қолжетімді кітапханалар жоқ.';

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
  String get adminServerAdministrationTitle => 'Сервер әкімшілігі';

  @override
  String get adminServerPathData => 'Деректер';

  @override
  String get adminServerPathImageCache => 'Кескін кэші';

  @override
  String get adminServerPathCache => 'Кэш';

  @override
  String get adminServerPathLogs => 'Журналдар';

  @override
  String get adminServerPathMetadata => 'Метадеректер';

  @override
  String get adminServerPathTranscode => 'Транскодтау';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Бұл сервер сервер жолдарын қайтармады.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% пайдаланылды';
  }

  @override
  String get userActivity => 'Пайдаланушы әрекеті';

  @override
  String get systemEvents => 'Жүйелік оқиғалар';

  @override
  String get needsAttention => 'Назар аудару қажет';

  @override
  String get homeVideos => 'Үй бейнелері';

  @override
  String get mixedContent => 'Аралас мазмұн';

  @override
  String get homeVideosAndPhotos => 'Үй бейнелері мен фотосуреттер';

  @override
  String get mixedMoviesAndShows => 'Аралас фильмдер мен сериалдар';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Жазбалар табылмады';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension архивінің ішінен кескін беттері табылмады.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Кірістірілген рендерер сәтсіз болды ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB рендерері сәтсіз болды ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Оқу құралы үшін жергілікті файл жоқ: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri көзінен кітап деректерін ашу кезінде HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Оқуға болатын кітап нүктесі қолжетімсіз';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Қолдау көрсетілмейтін комикс архивінің пішімі: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR шығарып алу плагині бұл платформада қолжетімсіз.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr архивін шығарып алу мүмкін болмады.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 шығарып алу бұл платформада қолжетімсіз.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 шығарып алу плагині бұл платформада қолжетімсіз.';

  @override
  String get loadingShuffle => 'Араластыру жүктелуде...';

  @override
  String get libraryShuffleLabel => 'КІТАПХАНАНЫ АРАЛАСТЫРУ';

  @override
  String get randomShuffleLabel => 'КЕЗДЕЙСОҚ АРАЛАСТЫРУ';

  @override
  String get genresShuffleLabel => 'ЖАНРЛАРДЫ АРАЛАСТЫРУ';

  @override
  String get autoHdrSwitching => 'Автоматты HDR ауыстыру';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR бейнесін ойнату үшін HDR-ды автоматты түрде қосу және шыққанда дисплей режимін қалпына келтіру.';

  @override
  String get whenFullscreen => 'Толық экран кезінде';

  @override
  String get changeArtwork => 'Мұқабаны өзгерту';

  @override
  String get missing => 'Жоқ';

  @override
  String get clearAllArtworkButton => 'Барлық мұқаба тазалансын ба?';

  @override
  String get clearAllArtworkWarning =>
      'Барлық жүктелген мұқабаны тазалағыңыз келе ме?';

  @override
  String get confirmClear => 'Тазалауды растау';

  @override
  String confirmClearMessage(String itemType) {
    return 'Осы «$itemType» тазалағыңыз келе ме?';
  }

  @override
  String get uploadButton => 'Жүктеп салу керек пе?';

  @override
  String get resolutionLabel => 'Ажыратымдылық: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Мұқабаларды тек интерфейс тілінде көрсету';

  @override
  String get confirmClearAll => 'Барлығын тазалауды растау';

  @override
  String get imageUploadSuccess => 'Кескін сәтті жүктеп салынды!';

  @override
  String imageUploadFailed(String error) {
    return 'Кескінді жүктеп салу мүмкін болмады: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Кескінді орнату мүмкін болмады: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Кескінді жою мүмкін болмады: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Барлық мұқабаны тазалау мүмкін болмады: $error';
  }

  @override
  String get yes => 'Иә';

  @override
  String get posterCategory => 'Постер';

  @override
  String get backdropsCategory => 'Фондық кескіндер';

  @override
  String get bannerCategory => 'Баннер';

  @override
  String get logoCategory => 'Логотип';

  @override
  String get thumbnailCategory => 'Нобай';

  @override
  String get artCategory => 'Мұқаба';

  @override
  String get discArtCategory => 'Диск мұқабасы';

  @override
  String get screenshotCategory => 'Скриншот';

  @override
  String get boxCoverCategory => 'Қорап мұқабасы';

  @override
  String get boxRearCoverCategory => 'Қораптың артқы мұқабасы';

  @override
  String get menuArtCategory => 'Мәзір мұқабасы';

  @override
  String get confirmItemPoster => 'постер';

  @override
  String get confirmItemBackdrop => 'фондық кескін';

  @override
  String get confirmItemBanner => 'баннер';

  @override
  String get confirmItemLogo => 'логотип';

  @override
  String get confirmItemThumbnail => 'нобай';

  @override
  String get confirmItemArt => 'мұқаба';

  @override
  String get confirmItemDiscArt => 'диск мұқабасы';

  @override
  String get confirmItemScreenshot => 'скриншот';

  @override
  String get confirmItemBoxCover => 'қорап мұқабасы';

  @override
  String get confirmItemBoxRearCover => 'қораптың артқы мұқабасы';

  @override
  String get confirmItemMenuArt => 'мәзір мұқабасы';

  @override
  String get resolutionAll => 'Барлығы';

  @override
  String get resolutionHigh => 'Жоғары (1080p+)';

  @override
  String get resolutionMedium => 'Орташа (720p)';

  @override
  String get resolutionLow => 'Төмен (<720p)';

  @override
  String get sources => 'Көздер';

  @override
  String get audiobookChapters => 'Тараулар';

  @override
  String get audiobookBookmarks => 'Бетбелгілер';

  @override
  String get audiobookNotes => 'Ескертпелер';

  @override
  String get audiobookQueue => 'Кезек';

  @override
  String get audiobookTimeline => 'Уақыт шкаласы';

  @override
  String get audiobookTimelineEmpty => 'Уақыт шкаласы бос';

  @override
  String get audiobookFocusedTimeline => 'Фокустелген шкала';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Бетбелгілерді экспорттау';

  @override
  String get audiobookExportNotes => 'Ескертпелерді экспорттау';

  @override
  String get audiobookExportAll => 'Барлығын экспорттау';

  @override
  String audiobookExportSuccess(String path) {
    return '$path орнына экспортталды';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Экспорттау мүмкін болмады: $error';
  }

  @override
  String get audiobookLyrics => 'Мәтін';

  @override
  String get audiobookAddBookmark => 'Бетбелгі қосу';

  @override
  String get audiobookAddNote => 'Ескертпе қосу';

  @override
  String get audiobookEditNote => 'Ескертпені өңдеу';

  @override
  String get audiobookNoteHint => 'Осы сәт үшін ескертпе жазыңыз';

  @override
  String get audiobookSleepTimer => 'Ұйқы таймері';

  @override
  String get audiobookSleepOff => 'Өшірулі';

  @override
  String get audiobookSleepEndOfChapter => 'Тарау соңы';

  @override
  String get audiobookSleepCustom => 'Реттелетін';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining қалды';
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
  String get audiobookPlaybackSpeed => 'Ойнату жылдамдығы';

  @override
  String get audiobookRemainingTime => 'Қалды';

  @override
  String get audiobookElapsedTime => 'Өтті';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Артқа $seconds с';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Алға $seconds с';
  }

  @override
  String get audiobookPreviousChapter => 'Алдыңғы тарау';

  @override
  String get audiobookNextChapter => 'Келесі тарау';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$total ішінен $current-тарау';
  }

  @override
  String get audiobookNoChapters => 'Тараулар жоқ';

  @override
  String get audiobookNoBookmarks => 'Әзірге бетбелгілер жоқ';

  @override
  String get audiobookNoNotes => 'Әзірге ескертпелер жоқ';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position орнына бетбелгі қосылды';
  }

  @override
  String get audiobookSpeedReset => '1.0x-ке ысыру';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Сақтау';

  @override
  String get audiobookCancel => 'Болдырмау';

  @override
  String get audiobookDelete => 'Жою';

  @override
  String get subtitlePreferencesDescription =>
      'Субтитр режимдерін, әдепкі тілдерді, сыртқы түрін және көрсету параметрлерін өзгертіңіз.';

  @override
  String get subtitleRendering => 'Субтитрлерді көрсету';

  @override
  String get displayOptions => 'Көрсету параметрлері';

  @override
  String get releaseDateAscending => 'Шығу күні (өсу ретімен)';

  @override
  String get releaseDateDescending => 'Шығу күні (кему ретімен)';

  @override
  String get groupContributions => 'Үлесті топтау';

  @override
  String get groupMultipleRoles => 'Бірнеше рөлді топтау';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Кітапханаға жазу рұқсаты туралы ескерту';

  @override
  String get libraryWriteAccessHowToFix => 'Мұны қалай түзетуге болады:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Серверіңіздегі медиакітапхана қалталары үшін Jellyfin қызметінің пайдаланушысына (мыс. jellyfin немесе Docker PUID/PGID) жазу рұқсатын беріңіз.\n\n2. Немесе Jellyfin басқару тақтасы -> Кітапханалар бөліміне өтіп, осы кітапхананы өңдеп, мұқабаны Jellyfin ішкі дерекқорында сақтау үшін «Мұқабаларды медиақалталарға сақтау» параметрін өшіріңіз.';

  @override
  String get dismiss => 'Жабу';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '«$libraryName» кітапханаңыз мұқабаларды тікелей медиақалталарға сақтауға конфигурацияланған («Мұқабаларды медиақалталарға сақтау» қосулы). Алайда Jellyfin жазу рұқсатын тексерді және осы каталогқа файлдар жазуға рұқсаты жоқ:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin мұқабаны жаңарта алмаған сияқты. Кітапханаңыз мұқабаларды тікелей медиақалталарға сақтауға конфигурацияланған («Мұқабаларды медиақалталарға сақтау» қосулы). Бұл қате әдетте Jellyfin сервер процесінің медиакаталогтарыңызға файлдар жазуға рұқсаты болмағанда орын алады.';

  @override
  String get replay => 'Қайта ойнату';

  @override
  String get fileInformation => 'Файл туралы мәлімет';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Өлшемі: $size  •  Пішімі: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Барлық ($count) аудиотректі көрсету';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Барлық ($count) субтитр трегін көрсету';
  }

  @override
  String get checkingDirectPlay => 'Тікелей ойнату мүмкіндігі тексерілуде...';

  @override
  String get directPlayCapabilityLabel => 'Тікелей ойнату мүмкіндігі: ';

  @override
  String get forced => 'Мәжбүрлі';

  @override
  String get transcodeContainerNotSupported =>
      'Контейнер пішімі ойнатқышта қолдау таппайды.';

  @override
  String get transcodeVideoCodecNotSupported => 'Видеокодек қолдау таппайды.';

  @override
  String get transcodeAudioCodecNotSupported => 'Аудиокодек қолдау таппайды.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Субтитр пішімі қолдау таппайды (қаттауды қажет етеді).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Аудиопрофиль қолдау таппайды.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Видеопрофиль қолдау таппайды.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Бейне деңгейі қолдау таппайды.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Бейне ажыратымдылығы бұл құрылғыда қолдау таппайды.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Бейне түс тереңдігі қолдау таппайды.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Бейне кадр жиілігі қолдау таппайды.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Файл битрейті ойнатқыштың ағын шегінен асады.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Бейне битрейті ағын шегінен асады.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Аудио битрейті ағын шегінен асады.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Аудиоарналар саны қолдау таппайды.';

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
  String get sortAlphabetical => 'Әліпби бойынша';

  @override
  String get sortReleaseAscending => 'Шығу реті (өсу ретімен)';

  @override
  String get sortReleaseDescending => 'Шығу реті (кему ретімен)';

  @override
  String get sortCustomDragDrop => 'Реттелетін (сүйреп апару)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Ойнату тізімін сұрыптау параметрлері';

  @override
  String get resetSort => 'Сұрыптауды ысыру';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'М$season:Э$episode қайта көру';
  }

  @override
  String get rewatchPlaylist => 'Ойнату тізімін қайта көру';

  @override
  String get noSubtitlesFound => 'Субтитрлер табылмады.';

  @override
  String get adminControls => 'Әкімші басқаруы';

  @override
  String get impellerRendering => 'Рендеринг қозғалтқышы (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller — плавнырақ анимациялар мен азырақ кідірістер үшін Flutter-дің заманауи GPU рендерері. Кейбір ТД-приставкаларда және ескі GPU-ларда ол ақаулар немесе қара бейне тудыруы мүмкін; мұны көрсеңіз, өшіріңіз. «Автоматты» құрылғыңызға ең қолайлы әдепкіні таңдайды. Қолдану үшін Moonfin-ді қайта іске қосыңыз.';

  @override
  String get impellerAuto => 'Автоматты';

  @override
  String get impellerOn => 'Қосулы';

  @override
  String get impellerOff => 'Өшірулі';

  @override
  String get impellerRestartTitle => 'Қайта іске қосу қажет';

  @override
  String get impellerRestartMessage =>
      'Рендеринг қозғалтқышын өзгерту үшін Moonfin-ді қайта іске қосу қажет. Қолдану үшін қолданбаны қазір жауып, содан кейін қайта ашыңыз.';

  @override
  String get impellerCloseNow => 'Қолданбаны қазір жабу';

  @override
  String get adminRefreshLibrary => 'Кітапхананы жаңарту';

  @override
  String get adminRefreshAllLibraries => 'Барлық кітапхананы жаңарту';

  @override
  String get adminRepoSortDateOldest => 'Қосылған күні (алдымен ескілері)';

  @override
  String get adminRepoSortDateNewest => 'Қосылған күні (алдымен жаңалары)';

  @override
  String get adminRepoSortNameAsc => 'Әліпби бойынша (А-дан Я-ға)';

  @override
  String get adminRepoSortNameDesc => 'Әліпби бойынша (Я-дан А-ға)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Сервер аналитикасы жүктелуде... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Көзге сәйкес';

  @override
  String get imdbTop250Movies => 'IMDb үздік 250 фильм';

  @override
  String get imdbTop250TvShows => 'IMDb үздік 250 сериал';

  @override
  String get imdbMostPopularMovies => 'IMDb ең танымал фильмдер';

  @override
  String get imdbMostPopularTvShows => 'IMDb ең танымал сериалдар';

  @override
  String get imdbLowestRatedMovies => 'IMDb ең төмен бағаланған фильмдер';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb ең жоғары бағаланған ағылшын фильмдері';

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
  String get integrations => 'Интеграциялар';

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
