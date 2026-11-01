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
  String get interfaceLanguage => 'Мова інтэрфейсу';

  @override
  String get systemLanguageDefault => 'Як у сістэме';

  @override
  String get signIn => 'Увайдзіце';

  @override
  String get signingIn => 'Signing in...';

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
  String get waitingForAuthorization => 'Чаканне аўтарызацыі...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Сервер недаступны';

  @override
  String get loginFailed => 'Не атрымалася ўвайсці';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

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
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

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
  String get glassQuality => 'Якасць шкла';

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
      '«Аўта» выбірае найлепшы эфект шкла для гэтай прылады. «Поўная» уключае сапраўднае размыццё, «Зніжаная» выкарыстоўвае лёгкае шкло, якое эканоміць рэсурсы GPU.';

  @override
  String get glassQualityAuto => 'Аўта';

  @override
  String get glassQualityFull => 'Поўная';

  @override
  String get glassQualityReduced => 'Зніжаная';

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
      'Пераключайцеся паміж Moonfin і Neon Pulse без перазапуску праграмы';

  @override
  String get customThemeTitle => 'Уласная тэма';

  @override
  String get customThemeSubtitle =>
      'Уласныя тэмы змяняюць візуальныя элементы ва ўсім Moonfin. Выберыце адзін з варыянтаў пад свой густ.';

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
  String get gameOrientation => 'Game orientation';

  @override
  String get gameOrientationSubtitle =>
      'Screen orientation while playing games';

  @override
  String get landscape => 'Landscape';

  @override
  String get portrait => 'Portrait';

  @override
  String get gameEmulatorSettings => 'Налады эмулятара';

  @override
  String get gameNoCoreOptions => 'Гэтае ядро не мае наладжвальных параметраў.';

  @override
  String get gameHoldToOpenMenu => 'Утрымлівайце, каб адкрыць меню';

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
  String get apply => 'Ужыць';

  @override
  String get openLink => 'Адкрыць спасылку';

  @override
  String get scanWithYourPhone => 'Сканаванне з дапамогай тэлефона';

  @override
  String get audiobookGenres => 'Жанры аўдыёкніжкі';

  @override
  String get scrollLeft => 'Пракрутка ўлева';

  @override
  String get scrollRight => 'Пракрутка ўправа';

  @override
  String get scrollToTop => 'Scroll to top';

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
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

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
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Кнігі гэтага аўтара не знойдзены.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

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
  String get additionalParts => 'Additional Parts';

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
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

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
  String get starring => 'STARRING';

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
  String get shuffleAll => 'Shuffle All';

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
  String get track => 'Дарожка';

  @override
  String get channels => 'Каналы';

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
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

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
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Храналогія кіраўніцтва';

  @override
  String failedToLoadGuide(String error) {
    return 'Не ўдалося загрузіць кіраўніцтва: $error';
  }

  @override
  String get noChannelsFound => 'Каналы не знойдзены';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'ЖЫВАЯ';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

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
  String get cancelRecordingAction => 'Адмяніць запіс';

  @override
  String get programSetToRecord => 'Праграма настроена на запіс';

  @override
  String get recordingCancelled => 'Запіс адменены';

  @override
  String get unableToCreateRecording => 'Немагчыма стварыць запіс';

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
  String get watch => 'Глядзець';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Закрыць';

  @override
  String failedToPlayChannel(String name) {
    return 'Не ўдалося прайграць $name';
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
  String get settingsSearchHint => 'Search settings';

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
  String get mixedRowsOnly => 'Mixed rows only';

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
  String get fireworks => 'Феерверк';

  @override
  String get confetti => 'Канфеці';

  @override
  String get fallingLeaves => 'Ападае лісце';

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
  String get loopThemeMusic => 'Паўтараць музычную тэму';

  @override
  String get loopThemeMusicSubtitle =>
      'Прайграваць трэк цыклічна, а не адзін раз';

  @override
  String get detailsBackgroundBlur => 'Размыццё фону дэталяў';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

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
  String get stretch => 'Расцяжка';

  @override
  String get refreshRateSwitching => 'Пераключэнне частоты абнаўлення';

  @override
  String get disabled => 'Адключана';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

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
  String get showDescriptionOnPause => 'Паказаць апісанне на паўзе';

  @override
  String get dimVideoShowOverview =>
      'Прыглушыць відэа і паказаць аглядны тэкст падчас паўзы';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'Кнопка блакіроўкі экраннага меню';

  @override
  String get osdLockButtonDescription =>
      'Паказаць кнопку блакіроўкі, якая блакуе сэнсарны ўвод, пакуль не будзе націснута доўга';

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
  String get settingsAudioFallbackCodec => 'Аўдыязапасны кодэк';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Выберыце фармат для транскадавання шматканальнага гуку, калі зыходны паток нельга прайграць напрамую або перадаць транзітам.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

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
  String get settingsAudioDtsCorePassthrough => 'Транзіт ядра DTS';

  @override
  String get settingsAudioDtsHdPassthrough => 'Праходжанне DTS-HD MA';

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
  String get settingsAudioTrueHdPassthrough => 'Праходжанне TrueHD';

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
  String get defaultToNoSubtitles => 'Па змаўчанні няма субтытраў';

  @override
  String get turnOffSubtitlesByDefault => 'Выключыць субтытры па змаўчанні';

  @override
  String get subtitleSize => 'Памер субтытраў';

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
  String get syncing => 'Сінхранізацыя...';

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
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

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
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar =>
      'Паказаць бібліятэкі на панэлі інструментаў';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

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
  String get mediaBarMode => 'Стыль медыябара';

  @override
  String get mediaBarModeDescription =>
      'Выбірайце паміж рознымі стылямі медыяпанэлі або адключайце медыяпанэль';

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
  String get enableMediaBar => 'Уключыць медыяпанэль';

  @override
  String get showFeaturedContentSlideshow =>
      'Паказваць слайд-шоу абранага змесціва на галоўнай старонцы';

  @override
  String get contentType => 'Тып кантэнту';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

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
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

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
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Апошнія медыя';

  @override
  String get recentlyReleased => 'Нядаўна выпушчаны';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

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
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Скінуць налады па змаўчанні';

  @override
  String get homeRowPosterSize => 'Памер плаката Home Row';

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
  String get fullScreenRows => 'Разгорнутыя радкі галоўнай';

  @override
  String get fullScreenRowsDescription =>
      'Паказваць не больш за адзін радок галоўнай на экран';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get displayClockDuringScreensaver =>
      'Паказаць гадзіннік падчас застаўкі';

  @override
  String get clockModeStatic => 'Нерухомы';

  @override
  String get clockModeBouncing => 'Скачучы';

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
  String get pluginDetected => 'Убудова выяўлены';

  @override
  String get pluginNotDetected => 'Плагін не выяўлены';

  @override
  String get pluginNotDetectedDescription =>
      'Серверны плагін зараз не выяўлены. Лакальныя налады па-ранейшаму выкарыстоўваюць свае захаваныя значэнні або ўбудаваныя значэнні па змаўчанні.';

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
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Радкі агляду Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

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
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

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
  String get featuredContentAppearance => 'Рэкамендаваны змест, знешні выгляд';

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
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Запыт';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Адмяніць запыт';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Гуляць у Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Запытаў $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

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
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Адправіць запыт';

  @override
  String get allSeasons => 'Усе сезоны';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

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
  String get adminLibraryLoadFailed => 'Не ўдалося загрузіць бібліятэку';

  @override
  String get adminNoMediaPaths => 'Шляхі носьбітаў не настроены';

  @override
  String get adminAddPath => 'Дадаць шлях';

  @override
  String get adminBrowseFilesystem => 'Агляд файлавай сістэмы сервера:';

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
  String adminSaveFailed(String error) {
    return 'Не ўдалося захаваць: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Паролі не супадаюць';

  @override
  String adminFailed(String error) {
    return 'Збой: $error';
  }

  @override
  String get adminUserLoadFailed => 'Не ўдалося загрузіць карыстальніка';

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
  String get adminEnableAllLibraryAccess =>
      'Дазволіць доступ да ўсіх бібліятэк';

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
  String get adminPlaybackLoadFailed =>
      'Не ўдалося загрузіць налады прайгравання';

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
  String adminMetadataLoadFailed(String error) {
    return 'Не ўдалося загрузіць метаданыя: $error';
  }

  @override
  String get adminRefreshMetadata => 'Абнавіць метаданыя';

  @override
  String get recursive => 'Рэкурсіўны';

  @override
  String get adminReplaceAllMetadata => 'Замяніць усе метаданыя';

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
  String get adminEnableAllTuners => 'Уключыць усе цюнеры';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Не ўдалося выдаліць цюнэр: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Не ўдалося выдаліць пастаўшчыка: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Шлях запісу серыі';

  @override
  String get adminMovieRecordingPath => 'Шлях для запісу фільмаў';

  @override
  String get adminGuideDaysAuto => 'Аўтаматычна';

  @override
  String get adminRecordingPostProcessor => 'Шлях да праграмы постапрацоўкі';

  @override
  String get adminRecordingPostProcessorArgs => 'Аргументы постапрацоўшчыка';

  @override
  String get adminSaveRecordingNfo => 'Захоўваць метаданыя NFO для запісаў';

  @override
  String get adminSaveRecordingImages => 'Захоўваць відарысы запісаў';

  @override
  String get adminLiveTvSectionPaths => 'Шляхі запісу';

  @override
  String get adminLiveTvSectionPostProcessing => 'Постапрацоўка';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Не ўдалося захаваць налады: $error';
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
  String get adminGuideRefreshStarted => 'Абнаўленне даных праграмы пачалося';

  @override
  String get adminGuideRefreshUnavailable =>
      'Задача абнаўлення праграмы недаступная на гэтым серверы.';

  @override
  String get adminNoListingProviders => 'Пастаўшчыкі спісаў не настроены';

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
  String get adminBackupsTitle => 'Рэзервовыя копіі';

  @override
  String get adminUnknownDate => 'Невядомая дата';

  @override
  String get adminUnnamedBackup => 'Рэзервовае капіраванне без назвы';

  @override
  String get adminApply => 'Ужыць';

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
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Слоган';

  @override
  String get adminMetadataFieldOverview => 'Агляд';

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
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Няма плагінаў, якія адпавядаюць вашаму пошуку';

  @override
  String get adminPluginsNoneInstalled => 'Убудоў не ўстаноўлена';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

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
  String get adminNetworkingEnableHttps => 'Уключыць HTTPS';

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
  String get adminPlaybackQsvDevice => 'Прылада QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Уключыць пашыраны дэкодэр NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Аддаваць перавагу сістэмнаму апаратнаму дэкодэру';

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
  String get adminNetworkingPublicHttpPort => 'Публічны порт HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Патрабаваць HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Перанакіроўваць усе аддаленыя запыты на HTTPS. Не дзейнічае, калі ў сервера няма сапраўднага сертыфіката.';

  @override
  String get adminNetworkingCertPassword => 'Пароль сертыфіката';

  @override
  String get adminNetworkingEnableIpv4 => 'Уключыць IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Уключыць IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'Сеткі LAN';

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
  String get kidsMode => 'Kids Mode';

  @override
  String get kidsModeSubtitle =>
      'Simplify the app and lock the way out with a PIN';

  @override
  String get kidsModeExit => 'Exit Kids Mode';

  @override
  String get kidsModeExitSubtitle => 'Enter your PIN to restore the full app';

  @override
  String get pinIncorrect => 'Няправільны PIN-код';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

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
  String get trackActionViewDetails => 'View Details';

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
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

  @override
  String get settingsAdministrationSubtitle =>
      'Доступ да панэлі адміністравання сервера';

  @override
  String get settingsDynamicContent => 'Дынамічны кантэнт';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медыяпанэль і візуальныя накладкі';

  @override
  String get settingsAboutSubtitle =>
      'Версія праграмы, юрыдычная інфармацыя і крэдыты';

  @override
  String get settingsSortServersBy => 'Сартаваць серверы па';

  @override
  String get settingsLastUsed => 'Апошняе выкарыстанне';

  @override
  String get settingsAlphabetical => 'Алфавітны';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Дазволіць самападпісаныя сертыфікаты';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Давяраць серверам з самападпісанымі сертыфікатамі TLS або сертыфікатамі прыватнага ЦС. Уключайце толькі для сервераў, якімі вы кіруеце. Гэта адключае праверку сертыфікатаў для ўсіх злучэнняў.';

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
  String get settingsHomePage => 'Галоўная старонка';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

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
  String get settingsBoth => 'Абодва';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Ператасаваць фільтр тыпу змесціва';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аўдыядарожкі, параметры апрацоўкі і перадачы';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Аўтаматызаванае прайграванне і паслядоўнасць';

  @override
  String get settingsSyncplaySubtitle =>
      'Логіка сінхранізацыі для групавых сеансаў';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Прапусціць уводныя і канчатковыя часткі?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Адлік медыясегмента';

  @override
  String get settingsProgressBar => 'Панэль прагрэсу';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv (спадчына)';

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
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

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
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

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
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

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
  String get rowsType => 'Тып радкоў';

  @override
  String get rowsTypeDescription =>
      'Classic захоўвае тып выявы і накладанне інфармацыі для кожнага радка. У Modern выкарыстоўваюцца радкі з партрэтам на фон.';

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
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

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
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Элементы радка жанраў';

  @override
  String get genresRowItemsDescription =>
      'Паказаць фільмы, серыялы або абодва ў радках жанраў.';

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
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Прахадны';

  @override
  String get supportedOnThisDevice => 'Падтрымліваецца на гэтай прыладзе';

  @override
  String get notSupportedOnThisDevice => 'Не падтрымліваецца на гэтай прыладзе';

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
  String get useExternalPlayer => 'Выкарыстоўвайце знешні прайгравальнік';

  @override
  String get useExternalPlayerSubtitle =>
      'Адкрыйце прайграванне відэа ў абраным знешнім дадатку на Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Аўтаматычная чарга';

  @override
  String get preferSdhSubtitles => 'Аддайце перавагу субтытрам SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Прыярытэзуйце дарожкі субтытраў SDH/CC пры аўтаматычным выбары.';

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
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Глядзіце з групай';

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
  String get disk => 'Дыск';

  @override
  String get openInBrowser => 'Адкрыць у браўзеры';

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
  String get homeVideos => 'Хатняе відэа';

  @override
  String get mixedContent => 'Змешаны кантэнт';

  @override
  String get homeVideosAndPhotos => 'Хатнія відэа і фота';

  @override
  String get mixedMoviesAndShows => 'Змешаныя фільмы і шоу';

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
  String get audiobookFocusedTimeline => 'Сфакусаваная шкала';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

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
  String get replay => 'Прайграць зноў';

  @override
  String get fileInformation => 'Звесткі пра файл';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Памер: $size  •  Фармат: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
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
  String get sortAlphabetical => 'Па алфавіце';

  @override
  String get sortReleaseAscending => 'Парадак выхаду (па ўзрастанні)';

  @override
  String get sortReleaseDescending => 'Парадак выхаду (па спаданні)';

  @override
  String get sortCustomDragDrop => 'Уласны (перацягванне)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

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
  String get integrations => 'Інтэграцыі';

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
