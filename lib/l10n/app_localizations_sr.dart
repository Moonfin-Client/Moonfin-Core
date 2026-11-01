// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get animeMarkerFiller => 'Филер';

  @override
  String get animeMarkerMixed => 'Мешовито';

  @override
  String get animeMarkerAnimeCanon => 'Аниме канон';

  @override
  String get animeMarkerMangaCanon => 'Манга канон';

  @override
  String get animeMarkerSubbed => 'С титловима';

  @override
  String get animeMarkerDubbed => 'Синхронизовано';

  @override
  String get animeMarkerSubbedAndDubbed => 'С титловима/синхронизовано';

  @override
  String get animeMarkerSubbedShort => 'Саб';

  @override
  String get animeMarkerDubbedShort => 'Даб';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Саб/Даб';

  @override
  String get animeMarkerPending => 'На чекању';

  @override
  String get animeMarkerRecap => 'Резиме';

  @override
  String get interfaceLanguage => 'Језик интерфејса';

  @override
  String get systemLanguageDefault => 'Подразумевани језик система';

  @override
  String get signIn => 'Пријава';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Празно';

  @override
  String connectingToServer(String serverName) {
    return 'Повезивање са сервером $serverName';
  }

  @override
  String get quickConnect => 'Брзо повезивање';

  @override
  String get password => 'Лозинка';

  @override
  String get username => 'Корисничко име';

  @override
  String get email => 'Имејл';

  @override
  String get quickConnectInstruction =>
      'Унесите овај код на веб-контролној табли свог сервера:';

  @override
  String get quickConnectScanHint =>
      'Или скенирајте ово телефоном који је пријављен на ваш сервер';

  @override
  String get quickConnectTapOrScanHint =>
      'Додирните да бисте одобрили у прегледачу или скенирајте ово другим уређајем';

  @override
  String get timesUpTitle => 'Време је истекло';

  @override
  String get timesUpMessage => 'Овај налог тренутно није доступан.';

  @override
  String timesUpResumesToday(String time) {
    return 'Биће вам поново доступан за коришћење данас у $time.';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'Биће вам поново доступан за коришћење сутра у $time.';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return 'Биће вам поново доступно за коришћење $day у $time.';
  }

  @override
  String get waitingForAuthorization => 'Чекање на ауторизацију...';

  @override
  String get back => 'Назад';

  @override
  String get serverUnavailable => 'Сервер није доступан';

  @override
  String get loginFailed => 'Пријава није успела';

  @override
  String get loginForbidden =>
      'Овим налогом тренутно не можете да се пријавите. Могуће је да пријављивање није дозвољено у ово време, да је налог закључан или да је онемогућен. Покушајте поново касније или затражите помоћ од администратора.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Брзо повезивање није доступно: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Брзо повезивање није доступно ($status): $detail';
  }

  @override
  String get whosWatching => 'Ко гледа?';

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
  String get addUser => 'Додај корисника';

  @override
  String get selectServer => 'Изабери сервер';

  @override
  String appVersionFooter(String version) {
    return 'Мунфин, верзија $version';
  }

  @override
  String get savedServers => 'Сачувани сервери';

  @override
  String get discoveredServers => 'Откривени сервери';

  @override
  String get noneFound => 'Ниједан није пронађен';

  @override
  String get unableToConnectToServer => 'Повезивање са сервером није могуће';

  @override
  String get addServer => 'Додај сервер';

  @override
  String get embyConnect => 'Емби конект (Emby Connect)';

  @override
  String get removeServer => 'Уклони сервер';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Уклонити „$serverName“ са списка ваших сервера?';
  }

  @override
  String get cancel => 'Откажи';

  @override
  String get remove => 'Уклони';

  @override
  String get connectToServer => 'Повежи се са сервером';

  @override
  String get serverAddress => 'Адреса сервера';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Повежи се';

  @override
  String get secureStorageUnavailable => 'Безбедно складиште није доступно';

  @override
  String get secureStorageUnavailableMessage =>
      'Мунфин није могао да приступи системском привеску за кључеве. Можете наставити са пријавом, али безбедно чување токена можда неће бити доступно док се привезак за кључеве не откључа.';

  @override
  String get ok => 'У реду';

  @override
  String get settingsAppearanceTheme => 'Тема апликације';

  @override
  String get detailScreenStyle => 'Стил екрана са детаљима';

  @override
  String get detailScreenStyleSubtitle =>
      'Класични је изворни, центрирани изглед Мунфина. Савремени је прилагодљив, филмски изглед. У центру пажње најпре истиче главни садржај, уз искачуће картице. Нови је приказ преко целог екрана са одељцима поређаним један испод другог. Минималистички приказује графички приказ садржаја, једно дугме за репродукцију и епизоде.';

  @override
  String get detailScreenStyleMoonfin => 'Класични';

  @override
  String get detailScreenStyleModern => 'Савремени';

  @override
  String get detailScreenStyleSpotlight => 'У центру пажње';

  @override
  String get spotlightMoreActions => 'Још радњи';

  @override
  String get spotlightCastCrewStudios => 'Глумци, екипа и студији';

  @override
  String get spotlightChaptersExtras => 'Поглавља и додаци';

  @override
  String get spotlightFileDetails => 'Детаљи о датотеци';

  @override
  String get spotlightSimilarRecommendations => 'Слични наслови и препоруке';

  @override
  String get spotlightSeasonsEpisodes => 'Сезоне и епизоде';

  @override
  String get spotlightMoreEpisodes => 'Још епизода';

  @override
  String get spotlightFilmography => 'Филмографија';

  @override
  String get spotlightCollectionsCard => 'Колекције';

  @override
  String get spotlightPlaylistOrder => 'Редослед на листи за репродукцију';

  @override
  String get spotlightMoviesAndShows => 'Филмови и серије';

  @override
  String get spotlightSimilarSeerr => 'Слични наслови (Сир (Seerr))';

  @override
  String get spotlightRecommendationsSeerr => 'Препоруке (Сир (Seerr))';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count особа',
      few: '$count особе',
      one: '1 особа',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чињеница',
      few: '$count чињенице',
      one: '1 чињеница',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ознака',
      few: '$count ознаке',
      one: '1 ознака',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count студија',
      few: '$count студија',
      one: '1 студио',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count поглавља',
      few: '$count поглавља',
      one: '1 поглавље',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count додатака',
      few: '$count додатка',
      one: '1 додатак',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сезона',
      few: '$count сезоне',
      one: '1 сезона',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count епизода',
      few: '$count епизоде',
      one: '1 епизода',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count филмова',
      few: '$count филма',
      one: '1 филм',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count серија',
      few: '$count серије',
      one: '1 серија',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудио-записа',
      few: '$count аудио-записа',
      one: '1 аудио-запис',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ставки',
      few: '$count ставке',
      one: '1 ставка',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count албума',
      few: '$count албума',
      one: '1 албум',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count колекција',
      few: '$count колекције',
      one: '1 колекција',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count наслова',
      few: '$count наслова',
      one: '1 наслов',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Нови';

  @override
  String get detailScreenStyleMinimalist => 'Минималистички';

  @override
  String get expandedTabs => 'Проширене картице';

  @override
  String get expandedTabsSubtitle =>
      'Аутоматски приказујте садржај картица док их прегледате. Искључите ову опцију да бисте сваку картицу отварали и затварали ручно.';

  @override
  String get showTechnicalDetails => 'Приказати техничке детаље?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Приказујте кодек, резолуцију и податке о стриму у сажетку банера';

  @override
  String get recommendationSystem => 'Систем препорука';

  @override
  String get recommendationSystemSubtitle =>
      'Користите алгоритам Мунфинових препорука заснован на локалној библиотеци, серверски механизам препорука Џелифина (Jellyfin) или онлајн метрике сличности ТМДБ-а (TMDb). Напомена: за онлајн препоруке потребна је интеграција са Сиром (Seerr).';

  @override
  String get recommendationSystemMoonfin => 'Мунфинове препоруке';

  @override
  String get recommendationSystemJellyfin => 'Препоруке Џелифина (Jellyfin)';

  @override
  String get recommendationSystemTmdb => 'Сличност према ТМДБ-у (TMDb)';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Применити ограничење према узрасној класификацији?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Ограничите Мунфинове препоруке према узрасној класификацији изабраног медијског садржаја';

  @override
  String get interfaceStyle => 'Стил интерфејса';

  @override
  String get interfaceStyleSubtitle =>
      'Аутоматски стил се прилагођава вашем уређају. Изаберите Епл (Apple) или Материјал (Material) да бисте користили одређени изглед.';

  @override
  String get interfaceStyleAutomatic => 'Аутоматски';

  @override
  String get interfaceStyleApple => 'Епл (Apple)';

  @override
  String get interfaceStyleMaterial => 'Материјал (Material)';

  @override
  String get interfaceLayout => 'Распоред интерфејса';

  @override
  String get interfaceLayoutSubtitle =>
      'Ручно изаберите распоред ако је овај уређај погрешно препознат. Поново покрените Мунфин да би измене ступиле на снагу.';

  @override
  String get interfaceLayoutAutomatic => 'Аутоматски';

  @override
  String get interfaceLayoutTv => 'ТВ';

  @override
  String get interfaceLayoutDesktop => 'Рачунар';

  @override
  String get interfaceLayoutPhone => 'Телефон';

  @override
  String get glassQuality => 'Квалитет стакластог ефекта';

  @override
  String get oledMode => 'ОЛЕД режим';

  @override
  String get oledModeSubtitle =>
      'Продубљује црне тонове и обогаћује графички приказ. Најбоље изгледа на ОЛЕД екранима.';

  @override
  String get oledModeSubtle => 'Суптилно';

  @override
  String get oledModeVivid => 'Живописно';

  @override
  String get glassQualitySubtitle =>
      'Аутоматски бира најбољи ефекат стакла за овај уређај. Потпуно намеће стварно замућење; Смањено користи лагани ефекат стакла који штеди ресурсе графичког процесора.';

  @override
  String get glassQualityAuto => 'Аутоматски';

  @override
  String get glassQualityFull => 'Потпуно';

  @override
  String get glassQualityReduced => 'Смањено';

  @override
  String get performanceMode => 'Перформансе';

  @override
  String get performanceModeSubtitle =>
      'Аутоматски процењује могућности овог уређаја и ограничава рад на уређајима са мало меморије, тако да се у меморији задржава мање слика, а трејлери се приказују као статичне слике. Подешавање у потпуности ступа на снагу при следећем покретању.';

  @override
  String get performanceModeAuto => 'Аутоматски';

  @override
  String get performanceModeStandard => 'Стандардно';

  @override
  String get performanceModeReduced => 'Смањено';

  @override
  String get rendererMode => 'Рендерер';

  @override
  String get rendererModeSubtitle =>
      'Аутоматски режим користи Импелер на боксовима чија графика омогућава да ради глатко, а Скију свуда другде. Изаберите Скију ако анимације или видео не изгледају исправно. Промена ступа на снагу при следећем покретању.';

  @override
  String get rendererModeAuto => 'Аутоматски';

  @override
  String get rendererModeSkia => 'Скиа';

  @override
  String get trailerPreviewHeldBack =>
      'Искључено јер су перформансе за овај уређај подешене на „Смањено“';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Примените потпуно прилагођену тему и бирајте између корисничког интерфејса инспирисаног Епловим (Apple) дизајном или дизајном Материјал (Material).';

  @override
  String get customThemeTitle => 'Прилагођена тема';

  @override
  String get customThemeSubtitle =>
      'Прилагођене теме мењају изглед елемената широм апликације Мунфин (Moonfin). Изаберите једну од понуђених опција према свом укусу.';

  @override
  String get keyboardStyle => 'Стил тастатуре';

  @override
  String get keyboardStyleDescription =>
      'Нативна користи тастатуру вашег телевизора. Класична је оригинална Мунфин тастатура. Стаклена је панел од мат стакла са већим тастерима. Усидрена испуњава доњи део екрана и приказује оно што куцате изнад тастера.';

  @override
  String get keyboardStyleNative => 'Нативна';

  @override
  String get keyboardStyleClassic => 'Класична';

  @override
  String get keyboardStyleGlass => 'Стаклена';

  @override
  String get keyboardStyleDocked => 'Усидрена';

  @override
  String get keyboardSpace => 'размак';

  @override
  String get keyboardHoldForAccents => 'држи за акценте';

  @override
  String get keyboardClose => 'затвори';

  @override
  String get controller => 'Контролер';

  @override
  String get gamepadNavigation => 'Навигација контролером';

  @override
  String get gamepadNavigationDescription =>
      'Омогућава повезаном контролеру за игре да помера фокус и бира ставке';

  @override
  String get themeMoonfin => 'Мунфин (Moonfin)';

  @override
  String get themeMoonfinSubtitle =>
      'Оригинални, једноставни подразумевани изглед Мунфина.';

  @override
  String get themeNeonPulse => 'Неонски пулс';

  @override
  String get themeNeonPulseSubtitle =>
      'Синтвејв естетика са магента сјајем, цијан текстом и израженијим контрастом елемената интерфејса';

  @override
  String get themeGlass => 'Стакло';

  @override
  String get themeGlassSubtitle =>
      'Изглед течног стакла са преливном позадином која се помера, матираним површинама и плавим нагласком у стилу Епла (Apple)';

  @override
  String get theme8BitHero => 'Осмобитни јунак';

  @override
  String get theme8BitHeroSubtitle =>
      'Ретро пиксел-арт изглед са изразитом палетом боја, угластим ивицама, оштрим сенкама и пикселским фонтом';

  @override
  String get embyConnectSignInSubtitle =>
      'Пријавите се помоћу налога Емби конект (Emby Connect)';

  @override
  String get emailOrUsername => 'Имејл адреса или корисничко име';

  @override
  String get selectAServer => 'Изаберите сервер';

  @override
  String get tryAgain => 'Покушајте поново';

  @override
  String get noLinkedServers =>
      'Ниједан сервер није повезан са овим налогом Емби конекта';

  @override
  String get invalidEmbyConnectCredentials =>
      'Неважећи подаци за пријаву на Емби конект';

  @override
  String get invalidEmbyConnectLogin =>
      'Неважеће корисничко име или лозинка за Емби конект';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сервер не подржава размену података са Емби конектом';

  @override
  String get embyConnectNetworkError =>
      'Мрежна грешка при повезивању са Емби конектом или изабраним сервером';

  @override
  String get signInWithPlex => 'Пријави се на Плекс';

  @override
  String get plexLinkInstructions =>
      'На било ком уређају отворите plex.tv/link и унесите овај код';

  @override
  String get plexOpenLink => 'Отвори plex.tv/link';

  @override
  String get plexWaitingForApproval => 'Чекам да одобриш код...';

  @override
  String get plexSignInWithPassword => 'Пријавите се лозинком';

  @override
  String get plexVerificationCode => 'Верификациони код';

  @override
  String get plexNoServers => 'На овом налогу нису пронађени Плекс сервери';

  @override
  String get loadingLinkedServers => 'Учитавање повезаних сервера...';

  @override
  String get connectingToServerEllipsis => 'Повезивање са сервером...';

  @override
  String get noReachableAddress => 'Није наведена доступна адреса';

  @override
  String get invalidServerExchangeResponse =>
      'Неважећи одговор серверске приступне тачке за размену података';

  @override
  String unableToConnectTo(String target) {
    return 'Није могуће повезати се са $target';
  }

  @override
  String get exitApp => 'Желите ли да изађете из Мунфина?';

  @override
  String get exitAppConfirmation => 'Да ли сте сигурни да желите да изађете?';

  @override
  String get exit => 'Изађи';

  @override
  String get gameMenu => 'Мени';

  @override
  String get gamePaused => 'Паузирано';

  @override
  String get gameSaveState => 'Сачувај стање';

  @override
  String get games => 'Игре';

  @override
  String get gameLoadState => 'Учитај стање';

  @override
  String get gameFastForward => 'Премотавање унапред';

  @override
  String get gameOrientation => 'Оријентација игре';

  @override
  String get gameOrientationSubtitle =>
      'Оријентација екрана током играња игара';

  @override
  String get landscape => 'Водоравно';

  @override
  String get portrait => 'Вертикално';

  @override
  String get gameEmulatorSettings => 'Подешавања емулатора';

  @override
  String get gameNoCoreOptions => 'Ово језгро нема подесивих опција.';

  @override
  String get gameHoldToOpenMenu => 'Држите притиснуто да бисте отворили мени';

  @override
  String get gameKeepPlaying => 'Настави са игром';

  @override
  String get gameSaveAndExit => 'Сачувај и изађи';

  @override
  String get gameExitGame => 'Изађи из игре';

  @override
  String get gameSavingBeforeExit => 'Чувам…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Стање није могло да се сачува. Игра и даље траје.';

  @override
  String get gamePlaybackUnsupported =>
      'Покретање игара још није подржано на овом уређају.';

  @override
  String get noHomeRowsLoaded =>
      'Није могуће учитати ниједан ред почетног екрана';

  @override
  String get noHomeRowsHint =>
      'Покушајте да освежите екран или смањите број активних одељака почетног екрана.';

  @override
  String get retryHomeRows => 'Поново учитај редове почетног екрана';

  @override
  String get guide => 'Програм';

  @override
  String get recordings => 'Снимци';

  @override
  String get schedule => 'Распоред';

  @override
  String get series => 'Серије';

  @override
  String get noItemsFound => 'Ниједна ставка није пронађена';

  @override
  String get home => 'Почетна';

  @override
  String get browseAll => 'Прегледај све';

  @override
  String get genres => 'Жанрови';

  @override
  String get collectionPlaceholder =>
      'Ставке из колекције ће се приказивати овде';

  @override
  String get browseByLetter => 'Прегледај по слову';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Овде ће се приказивати азбучни преглед';

  @override
  String get suggestions => 'Предлози';

  @override
  String get suggestionsPlaceholder =>
      'Предложене ставке ће се приказивати овде';

  @override
  String get failedToLoadLibraries => 'Учитавање библиотека није успело';

  @override
  String get noLibrariesFound => 'Ниједна библиотека није пронађена';

  @override
  String get library => 'Библиотека';

  @override
  String get displaySettings => 'Подешавања приказа';

  @override
  String get allGenres => 'Сви жанрови';

  @override
  String get noGenresFound => 'Ниједан жанр није пронађен';

  @override
  String failedToLoadFolderError(String error) {
    return 'Учитавање фасцикле није успело: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ова фасцикла је празна';

  @override
  String itemCountLabel(int count) {
    return '$count ставки';
  }

  @override
  String get failedToLoadFavorites => 'Учитавање омиљених ставки није успело';

  @override
  String get retry => 'Покушај поново';

  @override
  String get noFavoritesYet => 'Још нема омиљених ставки';

  @override
  String get favorites => 'Омиљено';

  @override
  String totalCountItems(int count) {
    return '$count ставки';
  }

  @override
  String get continuing => 'У току';

  @override
  String get ended => 'Завршено';

  @override
  String get sortAndFilter => 'Сортирај и филтрирај';

  @override
  String get type => 'Тип';

  @override
  String get sortBy => 'Сортирај по';

  @override
  String get display => 'Приказ';

  @override
  String get imageType => 'Тип слике';

  @override
  String get posterSize => 'Величина постера';

  @override
  String get small => 'Мала';

  @override
  String get medium => 'Средња';

  @override
  String get large => 'Велика';

  @override
  String get extraLarge => 'Веома велика';

  @override
  String get uiScaleGrandparents => 'Баке и деке';

  @override
  String get uiScaleGreatGrandparents => 'Прабаке и прадеке';

  @override
  String get scrollDirection => 'Смер померања';

  @override
  String get scrollDirectionVertical => 'Усправно';

  @override
  String get scrollDirectionHorizontal => 'Водоравно';

  @override
  String libraryGenresTitle(String name) {
    return '$name — жанрови';
  }

  @override
  String get views => 'Прикази';

  @override
  String get albums => 'Албуми';

  @override
  String get albumArtists => 'Извођачи албума';

  @override
  String get artists => 'Извођачи';

  @override
  String get bookmarks => 'Обележивачи';

  @override
  String get noSavedBookmarks =>
      'За овај наслов још нема сачуваних обележивача.';

  @override
  String get openBook => 'Отвори књигу';

  @override
  String get chapter => 'Поглавље';

  @override
  String get page => 'Страница';

  @override
  String get bookmark => 'Обележивач';

  @override
  String get justNow => 'Управо сада';

  @override
  String minutesAgo(int count) {
    return 'Пре $count мин';
  }

  @override
  String hoursAgo(int count) {
    return 'Пре $count ч';
  }

  @override
  String daysAgo(int count) {
    return 'Пре $count д';
  }

  @override
  String get discoverySubjects => 'Теме за откривање';

  @override
  String get apply => 'Примени';

  @override
  String get openLink => 'Отвори везу';

  @override
  String get scanWithYourPhone => 'Скенирајте телефоном';

  @override
  String get audiobookGenres => 'Жанрови аудио-књига';

  @override
  String get scrollLeft => 'Помери улево';

  @override
  String get scrollRight => 'Помери удесно';

  @override
  String get scrollToTop => 'Помери на врх';

  @override
  String get couldNotLoadGenre => 'Тренутно није могуће учитати овај жанр.';

  @override
  String get continueReading => 'Настави читање';

  @override
  String get savedHighlights => 'Сачувани истакнути одломци';

  @override
  String get continueListening => 'Наставите са слушањем';

  @override
  String get listen => 'Слушајте';

  @override
  String get resume => 'Наставите';

  @override
  String get failedToLoadLibrary => 'Учитавање библиотеке није успело';

  @override
  String get popularNow => 'Тренутно популарно';

  @override
  String get savedForLater => 'Сачувано за касније';

  @override
  String get topListens => 'Најслушаније';

  @override
  String get unreadDiscoveries => 'Непрочитана открића';

  @override
  String get pickUpAgain => 'Наставите где сте стали';

  @override
  String get bookHighlightsDescription =>
      'Ваше књиге са истакнутим деловима, омиљеним насловима или напретком у читању.';

  @override
  String get handPickedFromLibrary => 'Пажљиво одабрано из ваше библиотеке.';

  @override
  String get handPickedFromListeningQueue =>
      'Пажљиво одабрано из вашег реда за слушање.';

  @override
  String get booksWithHighlights =>
      'Књиге са истакнутим деловима, омиљеним насловима или напретком у читању.';

  @override
  String get jumpBackNarration =>
      'Вратите се слушању без тражења места на ком сте стали.';

  @override
  String get unreadBooksReady =>
      'Непрочитане књиге спремне за следећи миран час.';

  @override
  String get quickAccessFavorites =>
      'Брз приступ књигама којима се увек изнова враћате.';

  @override
  String get searchAudiobooks => 'Претражите аудио-књиге';

  @override
  String get searchYourLibrary => 'Претражите своју библиотеку';

  @override
  String get pickUpStory => 'Наставите причу тамо где сте стали';

  @override
  String get savedPlacesChapters => 'Ваша сачувана места и недовршена поглавља';

  @override
  String authorsCount(int count) {
    return '$count аутора';
  }

  @override
  String genresCount(int count) {
    return '$count жанрова';
  }

  @override
  String percentCompleted(int percent) {
    return 'Завршено $percent%';
  }

  @override
  String get readyWhenYouAre => 'Спремно кад и ви будете';

  @override
  String get details => 'Детаљи';

  @override
  String get listeningRoom => 'Простор за слушање';

  @override
  String get bookmarksAndProgress => 'Обележивачи и напредак';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count наслова распоређених тако да читање буде у првом плану.';
  }

  @override
  String get titles => 'Наслови';

  @override
  String get allTitles => 'Сви наслови';

  @override
  String get authors => 'Аутори';

  @override
  String get browseByAuthor => 'Прегледајте по аутору';

  @override
  String get browseByGenre => 'Прегледајте по жанру';

  @override
  String get discover => 'Откријте';

  @override
  String get noBookmarkedItems => 'Још нема обележених ставки';

  @override
  String get nothingMatchesSection =>
      'Још нема ничега што одговара овом одељку. Испробајте другу картицу или се вратите када се синхронизација библиотеке заврши.';

  @override
  String get audiobooks => 'Аудио-књиге';

  @override
  String noLabelFound(String label) {
    return 'Није пронађено: $label';
  }

  @override
  String get folder => 'Фасцикла';

  @override
  String get filters => 'Филтери';

  @override
  String get readingStatus => 'Статус читања';

  @override
  String get playedStatus => 'Статус репродукције';

  @override
  String get readStatus => 'Прочитано';

  @override
  String get watched => 'Одгледано';

  @override
  String get unread => 'Непрочитано';

  @override
  String get unwatched => 'Неодгледано';

  @override
  String get seriesStatus => 'Статус серијала';

  @override
  String get allLibraries => 'Све библиотеке';

  @override
  String get books => 'Књиге';

  @override
  String get latestBooks => 'Најновије књиге';

  @override
  String get latestAudiobooks => 'Најновије аудио-књиге';

  @override
  String get latestComics => 'Најновији стрипови';

  @override
  String get comics => 'Стрипови';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count књига',
      few: '$count књиге',
      one: '1 књига',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Књига';

  @override
  String get bookFormatAudiobook => 'Аудио-књига';

  @override
  String get bookFormatComic => 'Стрип';

  @override
  String get noBooksFound => 'Нису пронађене књиге овог аутора.';

  @override
  String get noBooksFoundDescription =>
      'Ова библиотека још не садржи књиге, аудио-књиге нити стрипове.';

  @override
  String bookPercentRead(int percent) {
    return 'Прочитано $percent%';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Преостало је $time';
  }

  @override
  String get bookHeroRead => 'Читајте';

  @override
  String get bookHeroListen => 'Слушајте';

  @override
  String get author => 'Аутор';

  @override
  String get unknownAuthor => 'Непознат аутор';

  @override
  String get uncategorized => 'Некатегорисано';

  @override
  String get overview => 'Преглед';

  @override
  String get noLibrivoxDescription =>
      'Либривокс (LibriVox) још није доставио опис овог наслова.';

  @override
  String get readers => 'Читаоци';

  @override
  String get openLinks => 'Отворите везе';

  @override
  String get librivoxPage => 'Страница Либривокса (LibriVox)';

  @override
  String get internetArchive => 'Интернет архива (Internet Archive)';

  @override
  String get rssFeed => 'РСС (RSS) извор';

  @override
  String get downloadZip => 'Преузми ЗИП (ZIP)';

  @override
  String sectionCountLabel(int count) {
    return '$count одељака';
  }

  @override
  String firstPublished(int year) {
    return 'Први пут објављено $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'За овај наслов још нема доступног прегледа у Отвореној библиотеци (Open Library).';

  @override
  String get subjects => 'Теме';

  @override
  String get all => 'Све';

  @override
  String booksCount(int count) {
    return '$count књига';
  }

  @override
  String get couldNotLoadSubject => 'Тренутно није могуће учитати ову тему.';

  @override
  String get audiobookDetails => 'Детаљи аудио-књиге';

  @override
  String authorsCountTitle(int count) {
    return '$count аутора';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудио-књига',
      few: '$count аудио-књиге',
      one: '1 аудио-књига',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Листа нумера';

  @override
  String get itemListPlaceholder => 'Листа ставки ће се појавити овде';

  @override
  String get failedToLoad => 'Учитавање није успело';

  @override
  String get delete => 'Избриши';

  @override
  String get save => 'Сачувај';

  @override
  String get moreLikeThis => 'Још сличног';

  @override
  String get castAndCrew => 'Глумци и екипа';

  @override
  String get collection => 'Колекција';

  @override
  String get episodes => 'Епизоде';

  @override
  String get nextUp => 'Следеће';

  @override
  String get seasons => 'Сезоне';

  @override
  String get chapters => 'Поглавља';

  @override
  String get features => 'Додатни садржаји';

  @override
  String get movies => 'Филмови';

  @override
  String get musicVideos => 'Музички спотови';

  @override
  String get other => 'Остало';

  @override
  String get discography => 'Дискографија';

  @override
  String get similarArtists => 'Слични извођачи';

  @override
  String get tableOfContents => 'Садржај';

  @override
  String get tracklist => 'Листа нумера';

  @override
  String discNumber(int number) {
    return 'Диск $number';
  }

  @override
  String get biography => 'Биографија';

  @override
  String get authorDetails => 'Детаљи о аутору';

  @override
  String get noOverviewAvailable =>
      'За овај наслов још нема доступног прегледа.';

  @override
  String get noBiographyAvailable => 'Биографија овог аутора није доступна.';

  @override
  String get unableToLoadAuthorDetails =>
      'Тренутно није могуће учитати детаље о аутору.';

  @override
  String published(int year) {
    return 'Објављено $year';
  }

  @override
  String get publicationDateUnknown => 'Датум објављивања није познат';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сезона',
      few: '$count сезоне',
      one: '1 сезона',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Завршава се у $time';
  }

  @override
  String get items => 'Ставке';

  @override
  String get extras => 'Додаци';

  @override
  String get additionalParts => 'Додатни делови';

  @override
  String get behindTheScenes => 'Иза кулиса';

  @override
  String get deletedScenes => 'Избачене сцене';

  @override
  String get featurettes => 'Кратки прилози';

  @override
  String get interviews => 'Интервјуи';

  @override
  String get scenes => 'Сцене';

  @override
  String get shorts => 'Кратки филмови';

  @override
  String get trailers => 'Трејлери';

  @override
  String timeRemaining(String time) {
    return 'Преостало је $time';
  }

  @override
  String endsIn(String time) {
    return 'Завршава се за $time';
  }

  @override
  String get view => 'Погледај';

  @override
  String get resumeReading => 'Наставите са читањем';

  @override
  String get read => 'Читај';

  @override
  String resumeFrom(String position) {
    return 'Наставите од $position';
  }

  @override
  String get play => 'Пусти';

  @override
  String get startOver => 'Почни изнова';

  @override
  String get restart => 'Покрени поново';

  @override
  String get readOffline => 'Читај ван мреже';

  @override
  String get playOffline => 'Репродукуј ван мреже';

  @override
  String get audio => 'Аудио';

  @override
  String get subtitles => 'Титлови';

  @override
  String get version => 'Верзија';

  @override
  String get cast => 'Емитовање';

  @override
  String get castMembers => 'Глумачка екипа';

  @override
  String get trailer => 'Трејлер';

  @override
  String get finished => 'Завршено';

  @override
  String get favorited => 'Означено као омиљено';

  @override
  String get favorite => 'Означи као омиљено';

  @override
  String get playlist => 'Листа песама';

  @override
  String get downloaded => 'Преузето';

  @override
  String get finalizingDownload => 'Довршавање…';

  @override
  String get queuedDownload => 'На чекању';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Још $count на чекању',
      one: 'Још 1 на чекању',
    );
    return '$_temp0';
  }

  @override
  String get downloadAll => 'Преузми све';

  @override
  String get download => 'Преузми';

  @override
  String get deleteDownloaded => 'Избриши преузето';

  @override
  String get goToSeries => 'Иди на серију';

  @override
  String get editMetadata => 'Уреди метаподатке';

  @override
  String get less => 'Мање';

  @override
  String get more => 'Више';

  @override
  String get deleteItem => 'Избриши ставку';

  @override
  String get deletePlaylist => 'Избриши листу песама';

  @override
  String get deletePlaylistMessage => 'Избрисати ову листу песама са сервера?';

  @override
  String get deleteItemMessage => 'Избрисати ову ставку са сервера?';

  @override
  String get failedToDeletePlaylist => 'Није успело брисање листе песама';

  @override
  String get failedToDeleteItem => 'Није успело брисање ставке';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Брисање није успело због следеће грешке: $error';
  }

  @override
  String get renamePlaylist => 'Преименуј листу песама';

  @override
  String get playlistName => 'Назив листе песама';

  @override
  String get deleteDownloadedAlbum => 'Избриши преузети албум';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Избрисати преузете нумере са албума „$title“?';
  }

  @override
  String get downloadedTracksDeleted => 'Преузете нумере су избрисане';

  @override
  String get downloadedTracksDeleteFailed =>
      'Неке преузете нумере није било могуће избрисати';

  @override
  String get noTracksLoaded => 'Нема учитаних нумера';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Нема учитаних ставки типа „$itemLabel“';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Преузимање ставке „$title“ ($count ставки)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Да ли сте сигурни да желите да избришете „$name“ са сервера? Ова радња се не може опозвати.';
  }

  @override
  String get itemDeleted => 'Ставка је избрисана';

  @override
  String get noPlayableTrailerFound =>
      'Није пронађен трејлер који може да се репродукује.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Неподржан формат књиге: .$extension';
  }

  @override
  String get audioTrack => 'Аудио-запис';

  @override
  String get subtitleTrack => 'Титл';

  @override
  String get none => 'Ниједан';

  @override
  String get downloadSubtitlesLabel => 'Преузми титлове...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Претражи помоћу Опенсабтајтлс (OpenSubtitles)';

  @override
  String get downloadSubtitles => 'Преузми титлове';

  @override
  String get searchingSubtitles => 'Претрага титлова у току…';

  @override
  String get fetchingSubtitles => 'Преузимање титлова';

  @override
  String get downloadingSubtitle => 'Преузимање титла у току…';

  @override
  String get selectedSubtitleInvalid => 'Изабрани титл није исправан.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Титл је преузет и изабран: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Титл је преузет. Можда ће проћи мало времена пре него што се појави, док Џелифин (Jellyfin) не освежи ставку.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Нису пронађени удаљени титлови за језик: $language.';
  }

  @override
  String get selectVersion => 'Изабери верзију';

  @override
  String versionNumber(int number) {
    return 'Верзија $number';
  }

  @override
  String get downloadAllQuality => 'Преузми све — квалитет';

  @override
  String get downloadQuality => 'Квалитет преузимања';

  @override
  String get originalFileNoReencoding =>
      'Оригинална датотека, без поновног кодирања';

  @override
  String get originalFilesNoReencoding =>
      'Оригиналне датотеке, без поновног кодирања';

  @override
  String get noEpisodesLoaded => 'Нема учитаних епизода';

  @override
  String get downloadScopeTitle => 'Шта преузети';

  @override
  String get downloadAllEpisodes => 'Све епизоде';

  @override
  String get downloadUnwatchedEpisodes => 'Све негледане епизоде';

  @override
  String get downloadAllMovies => 'Сви филмови';

  @override
  String get downloadUnwatchedMovies => 'Сви негледани филмови';

  @override
  String get downloadScopeLoading => 'Учитавање ставки...';

  @override
  String get downloadScopeLoadFailed =>
      'Учитавање ставки за преузимање није успело';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size укупно';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received од $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/с';
  }

  @override
  String downloadSizeTotal(String size) {
    return '$size укупно';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count непознато';
  }

  @override
  String downloadingItem(String name, String quality) {
    return 'Преузимање ставке „$name“ ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Избриши преузете датотеке';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Избрисати локалне датотеке за ставку типа „$typeLabel“?\n\nТиме ћете ослободити простор за складиштење. Можете их поново преузети касније.';
  }

  @override
  String get downloadedFilesDeleted => 'Преузете датотеке су избрисане';

  @override
  String get failedToDeleteFiles => 'Није успело брисање датотека';

  @override
  String get deleteFiles => 'Избриши датотеке';

  @override
  String get director => 'РЕЖИСЕР';

  @override
  String get starring => 'У ГЛАВНИМ УЛОГАМА';

  @override
  String get directors => 'РЕЖИСЕРИ';

  @override
  String get writer => 'СЦЕНАРИСТА';

  @override
  String get writers => 'СЦЕНАРИСТИ';

  @override
  String get studio => 'СТУДИО';

  @override
  String studioMoreCount(int count) {
    return '+$count још';
  }

  @override
  String totalEpisodes(int count) {
    return '$count епизода';
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
    return 'Поглавље $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count нумера',
      few: '$count нумере',
      one: '$count нумера',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count поглавља',
      few: '$count поглавља',
      one: '$count поглавље',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Рођен/а $date';
  }

  @override
  String died(String date) {
    return 'Преминуо/ла $date';
  }

  @override
  String age(int age) {
    return 'Узраст $age';
  }

  @override
  String get showLess => 'Прикажи мање';

  @override
  String get readMore => 'Прочитај више';

  @override
  String get shuffle => 'Насумична репродукција';

  @override
  String get shuffleAll => 'Насумично пусти све';

  @override
  String get shuffleAllMusic => 'Насумично пусти сву музику';

  @override
  String get carSignInPrompt =>
      'Пријавите се у апликацију Мунфин (Moonfin) на телефону';

  @override
  String get carServerUnreachable => 'Није могуће повезати се са сервером';

  @override
  String downloadsCount(int count) {
    return '$count преузимања';
  }

  @override
  String get perfectMatch => 'Савршено поклапање';

  @override
  String get aiTranslated => 'Преведено помоћу вештачке интелигенције';

  @override
  String get machineTranslated => 'Машински преведено';

  @override
  String get hearingImpaired => 'За особе оштећеног слуха';

  @override
  String framerateFps(String rate) {
    return '$rate кадрова/с';
  }

  @override
  String get mono => 'Моно';

  @override
  String get stereo => 'Стерео';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'За радњу „$action“ над удаљеним титловима кориснику је потребна Џелифинова (Jellyfin) дозвола за управљање титловима.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Ставка за радњу „$action“ над удаљеним титловима није пронађена на серверу.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Радња „$action“ над удаљеним титловима није успела: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Радња „$action“ над удаљеним титловима није успела (ХТТП $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Није успело извршавање радње „$action“ над удаљеним титловима.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'све преузете епизоде за „$name“';
  }

  @override
  String get deleteSeasonFiles => 'све преузете епизоде у овој сезони';

  @override
  String get stillWatching => 'Још увек гледате?';

  @override
  String get unableToLoadTrailerStream => 'Није могуће учитати ток трејлера.';

  @override
  String get trailerTimedOut => 'Истекло је време за учитавање трејлера.';

  @override
  String get playbackFailedForTrailer =>
      'Репродукција овог трејлера није успела.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Емитовање није доступно током репродукције ван мреже.';

  @override
  String castActionFailed(String label, String error) {
    return 'Радња за $label није успела: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Није успело подешавање јачине звука емитовања: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Контроле за $label';
  }

  @override
  String get deviceVolume => 'Јачина звука уређаја';

  @override
  String get unavailable => 'Није доступно';

  @override
  String get pause => 'Паузирај';

  @override
  String get syncPosition => 'Синхронизуј позицију';

  @override
  String stopCast(String label) {
    return 'Заустави $label';
  }

  @override
  String get queueIsEmpty => 'Ред чекања је празан';

  @override
  String trackNumber(int number) {
    return 'Нумера $number';
  }

  @override
  String get remotePlayback => 'Удаљена репродукција';

  @override
  String get castingToGoogleCast => 'Емитовање на Гугл Каст (Google Cast)';

  @override
  String get castingViaAirPlay => 'Емитовање преко ЕрПлеја (AirPlay)';

  @override
  String get castingViaDlna => 'Емитовање преко ДЛНА (DLNA)';

  @override
  String secondsCount(int seconds) {
    return '$seconds секунди';
  }

  @override
  String get longPressToUnlock => 'Дуго притисните да бисте откључали';

  @override
  String get off => 'Искључено';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Аутоматски';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Мб/с';
  }

  @override
  String get audioDelay => 'Кашњење звука';

  @override
  String delayMinusMs(int value) {
    return '-$value мс';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value мс';
  }

  @override
  String get subtitleDelay => 'Кашњење титлова';

  @override
  String get reset => 'Ресетуј';

  @override
  String get unknown => 'Непознато';

  @override
  String get playbackInformation => 'Информације о репродукцији';

  @override
  String get showMpvStats => 'Прикажи статистику плејера мпв (mpv) (Shift+I)';

  @override
  String get hideMpvStats => 'Сакриј статистику плејера мпв (mpv) (Shift+I)';

  @override
  String get keyboardShortcutsTitle => 'Пречице на тастатури';

  @override
  String get keyboardShortcutsSubtitle =>
      'Тастери за апликацију, видео-плејер и читач';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Притисните ? или F1 током репродукције видео-снимка да бисте приказали овај списак без напуштања плејера.';

  @override
  String get keyboardShortcutsSectionApp => 'Свуда';

  @override
  String get keyboardShortcutsSectionAppScope => 'На било ком екрану';

  @override
  String get keyboardShortcutsSectionPlayer => 'Видео-плејер';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'Док је видео отворен, репродукује се или је паузиран';

  @override
  String get keyboardShortcutsSectionReader => 'Читач књига и стрипова';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'Током читања књиге или стрипа';

  @override
  String get keyNameArrowKeys => 'Стрелице';

  @override
  String get keyNameSpace => 'Размак';

  @override
  String get keyNameEnter => 'Ентер';

  @override
  String get keyNameEsc => 'Ескејп';

  @override
  String get keyNameBackspace => 'Бекспејс';

  @override
  String get keyNameDelete => 'Обриши';

  @override
  String get keyNamePageUp => 'Страница нагоре';

  @override
  String get keyNamePageDown => 'Страница надоле';

  @override
  String get keyNameHome => 'Почетак';

  @override
  String get keyNameEnd => 'Крај';

  @override
  String get keyNameShift => 'Шифт';

  @override
  String get keyNameCtrl => 'Контрол';

  @override
  String get keyNameAlt => 'Алт';

  @override
  String get keyNameScrollWheel => 'Точкић миша';

  @override
  String get shortcutMoveFocus => 'Кретање између ставки';

  @override
  String get shortcutActivate => 'Отвори изабрану ставку';

  @override
  String get shortcutGoBack => 'Назад';

  @override
  String get shortcutToggleFullscreen =>
      'Укључи или искључи приказ преко целог екрана';

  @override
  String get shortcutQuit => 'Изађи из апликације';

  @override
  String get shortcutPlayPause => 'Пусти или паузирај';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Прикажи контроле или пусти/паузирај ако су већ приказане';

  @override
  String get shortcutSeekBack => 'Премотај уназад (задржите за веће скокове)';

  @override
  String get shortcutSeekForward =>
      'Премотај унапред (задржите за веће скокове)';

  @override
  String get shortcutVolumeUp => 'Појачај звук';

  @override
  String get shortcutVolumeDown => 'Смањи јачину звука';

  @override
  String get shortcutMute => 'Искључи или укључи звук';

  @override
  String get shortcutToggleSubtitles => 'Укључи или искључи титлове';

  @override
  String get shortcutSlower => 'Успори';

  @override
  String get shortcutFaster => 'Убрзај';

  @override
  String get shortcutPlaybackInfo => 'Прикажи информације о репродукцији';

  @override
  String get shortcutMpvStats =>
      'Укључи или искључи статистику плејера мпв (mpv)';

  @override
  String get shortcutRecropBlackBars => 'Поново одсеци црне траке';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Изађи из приказа преко целог екрана или заустави репродукцију ако тај приказ није активан';

  @override
  String get shortcutHideControls => 'Сакриј контроле';

  @override
  String get shortcutStopPlayback => 'Заустави репродукцију';

  @override
  String get shortcutNextItem => 'Следећа ставка';

  @override
  String get shortcutPreviousItem => 'Претходна ставка';

  @override
  String get shortcutSkipSegment =>
      'Прескочите уводну или одјавну шпицу када вам се понуди та могућност';

  @override
  String get shortcutShowShortcuts => 'Прикажи овај списак';

  @override
  String get shortcutNextPage => 'Следећа страница';

  @override
  String get shortcutPreviousPage => 'Претходна страница';

  @override
  String get shortcutScrollPage => 'Померите страницу (електронске књиге)';

  @override
  String get shortcutFirstPage => 'Прва страница или почетак поглавља';

  @override
  String get shortcutLastPage => 'Последња страница или крај поглавља';

  @override
  String get shortcutZoom => 'Увећај или умањи (стрипови)';

  @override
  String get shortcutResetZoom => 'Врати подразумевано увећање (стрипови)';

  @override
  String get playback => 'Репродукција';

  @override
  String get playMethod => 'Начин репродукције';

  @override
  String get directPlay => 'Директна репродукција';

  @override
  String get directStream => 'Директни ток';

  @override
  String get transcoding => 'Транскодирање';

  @override
  String get transcodeReasons => 'Разлози за транскодирање';

  @override
  String get player => 'Плејер';

  @override
  String get container => 'Контејнер';

  @override
  String get bitrate => 'Битрејт';

  @override
  String get video => 'Видео';

  @override
  String get resolution => 'Резолуција';

  @override
  String get hdr => 'ХДР (HDR)';

  @override
  String get videoRenderer => 'Видео рендерер';

  @override
  String get videoRendererDescription =>
      'Изворни прозор омогућава најглаткији приказ покрета и прослеђује ХДР екрану без измена. Ако се видео не приказује исправно, покушајте са другом опцијом.';

  @override
  String get videoRendererNativeWindow => 'Нативни прозор (препоручено)';

  @override
  String get videoRendererNativeHdrOnly => 'Нативни прозор само за ХДР';

  @override
  String get videoRendererInApp => 'У апликацији (застарело)';

  @override
  String get track => 'Нумера';

  @override
  String get channels => 'Канали';

  @override
  String get format => 'Формат';

  @override
  String get external => 'Спољни';

  @override
  String get embedded => 'Уграђени';

  @override
  String castSessionError(String protocol) {
    return 'Грешка у сесији $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Учитавање детаља о књизи није успело: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Приказивање ЕПУБ (EPUB) књига у апликацији још није доступно на овој платформи.';

  @override
  String get bookReadingUnavailableTitle =>
      'Књиге не могу да се читају на Епл ТВ-у';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Приказивање овог формата (.$extension) у апликацији још није подржано.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Уграђени приказ докумената није доступан на овој платформи.';

  @override
  String get couldNotOpenExternalViewer =>
      'Није могуће отворити спољни прегледач.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Отварање у читачу у апликацији није успело: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Обележивач је већ сачуван на позицији $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Обележивач је додат: $label';
  }

  @override
  String get noBookmarksYet =>
      'Још нема обележивача.\nДодирните икону обележивача током читања да бисте сачували позицију.';

  @override
  String get noTableOfContentsAvailable => 'Садржај није доступан';

  @override
  String pageLabel(int number) {
    return 'Страница $number';
  }

  @override
  String get position => 'Позиција';

  @override
  String get bookReader => 'Читач књига';

  @override
  String formatExtension(String extension) {
    return 'Формат: .$extension';
  }

  @override
  String percentRead(String percent) {
    return 'Прочитано $percent%';
  }

  @override
  String get updating => 'Ажурирање...';

  @override
  String get markUnread => 'Означи као непрочитано';

  @override
  String get markAsRead => 'Означи као прочитано';

  @override
  String get reloadReader => 'Поново учитај читач';

  @override
  String get noPagesFound => 'Ниједна страница није пронађена.';

  @override
  String get failedToDecodePageImage =>
      'Декодирање слике странице није успело.';

  @override
  String resetZoom(String zoom) {
    return 'Ресетуј увећање (${zoom}x)';
  }

  @override
  String get singlePage => 'Једна страница';

  @override
  String get twoPageSpread => 'Двостранични приказ';

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
    return 'Ажурирање статуса читања није успело: $error';
  }

  @override
  String get themeSystem => 'Тема: системска';

  @override
  String get themeLight => 'Тема: светла';

  @override
  String get themeDark => 'Тема: тамна';

  @override
  String get themeSepia => 'Тема: сепија';

  @override
  String get invertColorsFixedLayout => 'Инвертуј боје (фиксни распоред)';

  @override
  String get invertColorsPdf => 'Инвертуј боје (ПДФ)';

  @override
  String get preparingInAppReader => 'Припрема се читач у апликацији...';

  @override
  String get pdfDataNotAvailable => 'Подаци ПДФ-а нису доступни.';

  @override
  String get readerFallbackModeActive => 'Режим резервног читача је активан';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ова платформа не може да покрене уграђени механизам за документе формата $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Након преласка на подржану платформу (Андроид, иОС, макОС), изаберите „Поново учитај читач“.';

  @override
  String get openExternally => 'Отвори у спољној апликацији';

  @override
  String get noEpubChaptersFound => 'Ниједно поглавље ЕПУБ-а није пронађено.';

  @override
  String get readerNotReady => 'Читач није спреман.';

  @override
  String get seriesRecordings => 'Снимања серија';

  @override
  String get now => 'Сада';

  @override
  String get sports => 'Спорт';

  @override
  String get news => 'Вести';

  @override
  String get kids => 'Дечји програм';

  @override
  String get premiere => 'Премијера';

  @override
  String get guideRepeatBadge => 'Реприза';

  @override
  String get guideTimeline => 'Временска линија ТВ водича';

  @override
  String failedToLoadGuide(String error) {
    return 'Учитавање ТВ водича није успело: $error';
  }

  @override
  String get noChannelsFound => 'Ниједан канал није пронађен';

  @override
  String get noProgramData => 'Нема података о програму';

  @override
  String get liveBadge => 'УЖИВО';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Следеће: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Још $minutes мин';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Још $hours ч';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Још $hours ч и $minutes мин';
  }

  @override
  String get movie => 'Филм';

  @override
  String get removedFromFavoriteChannels => 'Уклоњено из омиљених канала';

  @override
  String get addedToFavoriteChannels => 'Додато у омиљене канале';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Ажурирање омиљеног канала није успело';

  @override
  String get unfavoriteChannel => 'Уклони канал из омиљених';

  @override
  String get favoriteChannel => 'Додај канал у омиљене';

  @override
  String get record => 'Сними';

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
  String get programSetToRecord => 'Програм је додат у распоред снимања';

  @override
  String get recordingCancelled => 'Снимање је отказано';

  @override
  String get unableToCreateRecording => 'Није могуће заказати снимање';

  @override
  String get recordSeries => 'Снимај серију';

  @override
  String get seriesSetToRecord => 'Серија је додата у распоред снимања';

  @override
  String get seriesRecordingCancelled => 'Снимање серије је отказано';

  @override
  String get unableToCreateSeriesRecording =>
      'Није могуће заказати снимање серије';

  @override
  String get watch => 'Гледај';

  @override
  String get watchChannelLive => 'Гледај канал уживо';

  @override
  String get close => 'Затвори';

  @override
  String failedToPlayChannel(String name) {
    return 'Репродукција канала $name није успела';
  }

  @override
  String get playbackStreamLost =>
      'Репродукција је заустављена и није је било могуће наставити.';

  @override
  String get playbackVideoUnsupported =>
      'This device can\'t play this video\'s format. Try an external player.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Поновно повезивање… ($attempt од $total)';
  }

  @override
  String get failedToLoadRecordings => 'Учитавање снимака није успело';

  @override
  String get scheduledInNext24Hours => 'Заказано у наредна 24 сата';

  @override
  String get recentRecordings => 'Недавна снимања';

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
    return 'Отказати заказано снимање „$name“?';
  }

  @override
  String get no => 'Не';

  @override
  String get yesCancel => 'Да, откажи';

  @override
  String get failedToCancelRecording => 'Отказивање снимања није успело';

  @override
  String get failedToLoadSeriesRecordings =>
      'Учитавање снимања серија није успело';

  @override
  String get noSeriesRecordings => 'Нема снимања серија';

  @override
  String get cancelSeriesRecording => 'Откажи снимање серије';

  @override
  String get cancelSeriesRecordingQuestion => 'Отказати снимање серије?';

  @override
  String stopRecordingName(String name) {
    return 'Зауставити снимање „$name“?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Отказивање снимања серије није успело';

  @override
  String get searchThisLibrary => 'Претражи ову библиотеку...';

  @override
  String get searchEllipsis => 'Претрага...';

  @override
  String noResultsForQuery(String query) {
    return 'Нема резултата за „$query“';
  }

  @override
  String searchFailedError(String error) {
    return 'Претрага није успела: $error';
  }

  @override
  String get seerr => 'Сир (Seerr)';

  @override
  String get seerrAccountType => 'Тип налога за Сир (Seerr)';

  @override
  String get jellyfinAccount => 'Џелифин (Jellyfin)';

  @override
  String get localAccount => 'Локални';

  @override
  String get savedMedia => 'Преузимања';

  @override
  String get tvShows => 'ТВ серије';

  @override
  String get music => 'Музика';

  @override
  String get musicAlbums => 'Музички албуми';

  @override
  String get noMediaInFilter =>
      'Нема медијских садржаја који одговарају овом филтеру';

  @override
  String get noDownloadedMediaYet => 'Још нема преузетих медијских садржаја';

  @override
  String get browseLibrary => 'Прегледај библиотеку';

  @override
  String get deleteDownload => 'Обриши преузети садржај';

  @override
  String removeItemAndFiles(String name) {
    return 'Уклонити „$name“ и његове датотеке?';
  }

  @override
  String tracksCount(int count) {
    return '$count нумера';
  }

  @override
  String get album => 'Албум';

  @override
  String get playAlbum => 'Пусти албум';

  @override
  String failedToLoadAlbum(String error) {
    return 'Учитавање албума није успело: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Нису пронађене преузете нумере за албум $name.';
  }

  @override
  String get season => 'Сезона';

  @override
  String get errorLoadingEpisodes => 'Грешка при учитавању епизода';

  @override
  String get noDownloadedEpisodes => 'Нема преузетих епизода';

  @override
  String get deleteEpisode => 'Обриши епизоду';

  @override
  String removeName(String name) {
    return 'Уклонити „$name“?';
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
  String get seriesNotFound => 'Серија није пронађена';

  @override
  String get errorLoadingSeries => 'Грешка при учитавању серије';

  @override
  String get downloadedEpisodes => 'Преузете епизоде';

  @override
  String seasonNumber(int number) {
    return 'Сезона $number';
  }

  @override
  String seasonChip(int number) {
    return 'С$number';
  }

  @override
  String get specials => 'Специјалне епизоде';

  @override
  String get deleteSeason => 'Обриши сезону';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Обрисати све преузете епизоде у сезони $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count епизода',
      one: '1 епизода',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Управљање складиштем';

  @override
  String get storageBreakdown => 'Преглед заузећа складишта';

  @override
  String get downloadedItems => 'Преузете ставке';

  @override
  String get activeDownloads => 'Активна преузимања';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ставки',
      one: '1 ставка',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used од $limit';
  }

  @override
  String get savedMediaSelectItems => 'Изабери ставке';

  @override
  String get savedMediaNoDownloads => 'Још ништа није сачувано';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Преузимања која покренете појавиће се овде и моћи ћете да их репродукујете без везе.';

  @override
  String get savedMediaNoActiveDownloads => 'Тренутно се ништа не преузима';

  @override
  String get savedMediaNoResults => 'Ниједно преузимање не одговара претрази';

  @override
  String get savedMediaPlayFromStart => 'Пусти од почетка';

  @override
  String get savedMediaGoToDetails => 'Иди на детаље';

  @override
  String get savedMediaDeleteDownload => 'Обриши преузимање';

  @override
  String savedMediaDeleteSeason(String season) {
    return 'Обриши $season';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Обриши $count епизода',
      one: 'Обриши 1 епизоду',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Отвори серију';

  @override
  String get savedMediaPlayNextUnwatched => 'Пусти следећу неогледану епизоду';

  @override
  String get savedMediaRead => 'Читај';

  @override
  String get savedMediaCancelDownload => 'Откажи преузимање';

  @override
  String get sortBySize => 'Величина';

  @override
  String get sortByName => 'Назив';

  @override
  String get sortByDateAdded => 'Датум додавања';

  @override
  String get storageLimit => 'Ограничење складишта';

  @override
  String get noLimit => 'Без ограничења';

  @override
  String get deleteAllDownloads => 'Обриши сва преузимања';

  @override
  String get deleteAllDownloadsWarning =>
      'Овим ће бити уклоњене све преузете медијске датотеке и та радња се не може опозвати.';

  @override
  String get deleteAll => 'Обриши све';

  @override
  String get deleteSelected => 'Обриши изабране';

  @override
  String deleteSelectedCount(int count) {
    return 'Обрисати $count преузетих ставки?';
  }

  @override
  String get musicAndAudiobooks => 'Музика и аудио-књиге';

  @override
  String get images => 'Слике';

  @override
  String get database => 'База података';

  @override
  String ofStorageLimit(String limit) {
    return 'од ограничења од $limit';
  }

  @override
  String get settings => 'Подешавања';

  @override
  String get settingsSearchHint => 'Претражи подешавања';

  @override
  String get authentication => 'Аутентификација';

  @override
  String get autoLoginServerManagement =>
      'Аутоматска пријава, управљање сервером';

  @override
  String get pinCode => 'ПИН код';

  @override
  String get setUpPinCodeProtection => 'Подеси заштиту ПИН кодом';

  @override
  String get parentalControls => 'Родитељски надзор';

  @override
  String get contentRatingRestrictions =>
      'Ограничења према узрасној категорији садржаја';

  @override
  String get bitRateResolutionBehavior =>
      'Брзина преноса, резолуција, понашање';

  @override
  String get languageSizeAppearance => 'Језик, величина, изглед';

  @override
  String get qualityStorage => 'Квалитет, складиште';

  @override
  String get mediaRequestIntegration => 'Интеграција захтева за медије';

  @override
  String get switchServer => 'Промени сервер';

  @override
  String get signOut => 'Одјави се';

  @override
  String get versionLicenses => 'Верзија, лиценце';

  @override
  String get account => 'Налог';

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
  String get themeAndLayout => 'Тема и распоред';

  @override
  String get videoAndSubtitles => 'Видео и титлови';

  @override
  String get pluginAndRequests => 'Додатак и захтеви';

  @override
  String get customizeAccountPlaybackInterface =>
      'Прилагодите понашање налога, репродукције и интерфејса';

  @override
  String optionsCount(int count) {
    return '$count опција';
  }

  @override
  String get themeAndAppearance => 'Тема и изглед';

  @override
  String get focusBorderColor => 'Боја оквира фокуса';

  @override
  String get watchedIndicators => 'Ознаке одгледаног';

  @override
  String get always => 'Увек';

  @override
  String get mixedRowsOnly => 'Само редови са мешовитим садржајем';

  @override
  String get hideUnwatched => 'Сакриј ознаке неогледаног';

  @override
  String get episodesOnly => 'Само епизоде';

  @override
  String get never => 'Никада';

  @override
  String get focusExpansionAnimation => 'Анимација увећања при фокусу';

  @override
  String get desktopUiScale => 'Размера корисничког интерфејса';

  @override
  String get scaleFocusedCards =>
      'Увећај картице и плочице у фокусу или под показивачем';

  @override
  String get seriesThumbnails => 'Прикажи сличице серија';

  @override
  String get seriesThumbnailsDescription =>
      'За ТВ серије користи главну илустрацију серије уместо сличице епизоде.';

  @override
  String get homeRowInfoOverlay => 'Информације преко редова почетне странице';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Прикажи наслов и метаподатке при прегледању редова почетне странице';

  @override
  String get clockDisplay => 'Приказ сата';

  @override
  String get inMenus => 'У менијима';

  @override
  String get inVideo => 'Током видеа';

  @override
  String get seasonalEffects => 'Сезонски ефекти';

  @override
  String get seasonalEffectsDescription => 'Визуелни ефекти и сезонски украси';

  @override
  String get loadingAnimation => 'Анимација учитавања';

  @override
  String get loadingAnimationDescription =>
      'Прилагодите анимације учитавања које се користе широм Мунфина (Moonfin)';

  @override
  String get loadingAnimationConfiguration => 'Подешавање анимације учитавања';

  @override
  String get loadingAnimationImage => 'Слика';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Лого Мунфина (Moonfin)';

  @override
  String get loadingAnimationImageSpinner => 'Ротирајући индикатор';

  @override
  String get loadingAnimationImageRunner => 'Тркач';

  @override
  String get loadingAnimationImageMoonPhases => 'Месечеве мене';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Мене Мунфина (Moonfin)';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Мене Неонфина (Neonfin)';

  @override
  String get loadingAnimationSize => 'Величина анимације';

  @override
  String get loadingAnimationSizeThumbnail => 'Сличица';

  @override
  String get loadingAnimationSizeSmall => 'Мала';

  @override
  String get loadingAnimationSizeMedium => 'Средња';

  @override
  String get loadingAnimationSizeLarge => 'Велика';

  @override
  String get loadingAnimationPosition => 'Положај анимације';

  @override
  String get loadingAnimationPositionTopLeft => 'Горе лево';

  @override
  String get loadingAnimationPositionTopCenter => 'Горе по средини';

  @override
  String get loadingAnimationPositionTopRight => 'Горе десно';

  @override
  String get loadingAnimationPositionMiddleLeft => 'По средини лево';

  @override
  String get loadingAnimationPositionMiddle => 'По средини';

  @override
  String get loadingAnimationPositionMiddleRight => 'По средини десно';

  @override
  String get loadingAnimationPositionBottomLeft => 'Доле лево';

  @override
  String get loadingAnimationPositionBottomCenter => 'Доле по средини';

  @override
  String get loadingAnimationPositionBottomRight => 'Доле десно';

  @override
  String get loadingAnimationPositionBouncing => 'Одбијање од ивица';

  @override
  String get loadingAnimationSpeed => 'Брзина анимације';

  @override
  String get loadingAnimationSpeedSlow => 'Споро';

  @override
  String get loadingAnimationSpeedModerate => 'Умерено';

  @override
  String get loadingAnimationSpeedFast => 'Брзо';

  @override
  String get loadingAnimationSpeedUltra => 'Ултрабрзо';

  @override
  String get showLoadingAnimationText => 'Прикажи текст?';

  @override
  String get loadingAnimationPreview => 'Преглед';

  @override
  String get snow => 'Снег';

  @override
  String get fireworks => 'Ватромет';

  @override
  String get confetti => 'Конфете';

  @override
  String get fallingLeaves => 'Опадање лишћа';

  @override
  String get seasonalChristmas => 'Божић';

  @override
  String get seasonalPetals => 'Пролећне латице';

  @override
  String get seasonalFireflies => 'Свици';

  @override
  String get seasonalHalloween => 'Ноћ вештица';

  @override
  String get seasonalDensity => 'Густина';

  @override
  String get seasonalDensityLight => 'Мала';

  @override
  String get seasonalDensityNormal => 'Уобичајена';

  @override
  String get seasonalDensityHeavy => 'Велика';

  @override
  String get seasonalFollower => 'Focus Follower';

  @override
  String get seasonalFollowerDescription =>
      'A holiday piece, like Halloween\'s planchette, follows what you select on Home';

  @override
  String get seasonalFollowerPointerDescription =>
      'A holiday piece, like Halloween\'s planchette, replaces the mouse pointer on Home';

  @override
  String get seasonalRow => 'Сезонски ред';

  @override
  String get seasonalRowDescription =>
      'Прикажи ред празничних филмова из своје библиотеке, уз предлоге Сиира (Seerr) када су доступни.';

  @override
  String get seasonalRowSubtitle => 'Сезонски';

  @override
  String get seasonalRowCountry => 'Земља';

  @override
  String get seasonalRowCountryAuto => 'Аутоматски';

  @override
  String get countryUnitedStates => 'Сједињене Америчке Државе';

  @override
  String get countryCanada => 'Канада';

  @override
  String get seasonalRowCountryOther => 'Остало';

  @override
  String get seasonalRowHolidays => 'Празници';

  @override
  String get seasonalRowHolidaysHint =>
      'Поништите избор празника да бисте сакрили његов ред.';

  @override
  String get holidayNewYear => 'Нова година';

  @override
  String get holidayValentines => 'Дан заљубљених';

  @override
  String get holidayEaster => 'Ускрс';

  @override
  String get holidayPride => 'Прајд';

  @override
  String get holidayHalloween => 'Ноћ вештица';

  @override
  String get holidayThanksgiving => 'Дан захвалности';

  @override
  String get holidayChristmas => 'Божићни филмови';

  @override
  String get holidayLunarNewYear => 'Лунарна нова година';

  @override
  String get holidayDiwali => 'Дивали';

  @override
  String get themeMusic => 'Тематска музика';

  @override
  String get playThemeMusicOnDetailPages =>
      'Пуштај тематску музику на страницама са детаљима';

  @override
  String get themeMusicVolume => 'Јачина звука тематске музике';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows =>
      'Тематска музика у редовима на почетном екрану';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Пуштај током прегледања почетног екрана';

  @override
  String get loopThemeMusic => 'Понављај тематску музику';

  @override
  String get loopThemeMusicSubtitle =>
      'Понављај нумеру уместо да је пустиш само једном';

  @override
  String get detailsBackgroundBlur => 'Замућење позадине екрана са детаљима';

  @override
  String get detailsBackgroundOpacity =>
      'Непрозирност позадине екрана са детаљима';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Замућење позадине при прегледању';

  @override
  String get maxStreamingBitrate => 'Највећа брзина протока при стримовању';

  @override
  String get maxResolution => 'Највећа резолуција';

  @override
  String get playerZoomMode => 'Режим зумирања плејера';

  @override
  String get settingsScrollWheelAction => 'Точкић миша';

  @override
  String get settingsScrollWheelActionDescription =>
      'Изаберите шта се дешава када током репродукције померате точкић миша изнад видеа.';

  @override
  String get scrollWheelActionOff => 'Искључено';

  @override
  String get scrollWheelActionSeek => 'Премотавање (напред / назад)';

  @override
  String get scrollWheelActionVolume => 'Јачина звука';

  @override
  String get playerTooltipVolume => 'Јачина звука';

  @override
  String get fit => 'Уклопи';

  @override
  String get autoCrop => 'Аутоматско исецање';

  @override
  String get cropBlackBars => 'Исеци црне траке';

  @override
  String get settingsCropBlackBarsDescription =>
      'По покретању репродукције откриј кодиране црне траке, исеци их и попуни екран. Поново их исеци помоћу дугмета за зумирање плејера.';

  @override
  String get cropBlackBarsRecropInterval => 'Учесталост поновног исецања';

  @override
  String get cropBlackBarsOnce => 'Једном на почетку';

  @override
  String get cropBlackBarsEverySecond => 'Сваке секунде';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Прати промене односа ширине и висине током репродукције.';

  @override
  String get playerRecroppingBlackBars => 'Поновно исецање црних трака';

  @override
  String get stretch => 'Развуци';

  @override
  String get refreshRateSwitching => 'Промена брзине освежавања';

  @override
  String get disabled => 'Онемогућено';

  @override
  String get manual => 'Ручно';

  @override
  String get autoDetect => 'Аутоматско откривање';

  @override
  String get scaleOnTv => 'Скалирај на телевизору';

  @override
  String get scaleOnDevice => 'Скалирај на уређају';

  @override
  String get trickPlay => 'Преглед при премотавању';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Прикажи сличице прегледа при премотавању';

  @override
  String get trickplayDisplayStyleSingle => 'Једна сличица';

  @override
  String get trickplayDisplayStyleStrip => 'Филмска трака';

  @override
  String get trickplayModeFull => 'Цео екран';

  @override
  String get trickplaySettingsPreviewHint =>
      'Превуците клизач да бисте видели преглед премотавања';

  @override
  String get trickplayPreviewScale => 'Величина прегледа';

  @override
  String get trickplayVerticalOffset => 'Удаљеност од траке за премотавање';

  @override
  String get trickplayFollowScrubPosition => 'Прати положај премотавања';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Преглед се помера дуж траке за премотавање док превлачите клизач, уместо да остане у средини';

  @override
  String get trickplayPauseWhileScrubbing => 'Паузирај током премотавања';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Репродукција се паузира док премотавате и наставља када притиснете дугме за репродукцију. Искључите ову опцију да би се репродукција наставила током премотавања, а затим одмах прешла на ново место';

  @override
  String get showDescriptionOnPause => 'Прикажи опис при паузи';

  @override
  String get dimVideoShowOverview =>
      'Затамни видео и прикажи кратак опис док је репродукција паузирана';

  @override
  String get showChapterMarkers => 'Ознаке поглавља';

  @override
  String get showChapterMarkersDescription =>
      'Означи почетак сваког поглавља на траци за премотавање';

  @override
  String get osdLockButton => 'Дугме за закључавање контрола на екрану';

  @override
  String get osdLockButtonDescription =>
      'Прикажи дугме за закључавање које блокира унос додиром док га не притиснете и задржите';

  @override
  String get playerSwipeGestures =>
      'Превлачење за подешавање јачине звука и осветљености';

  @override
  String get playerSwipeGesturesDescription =>
      'Превуците нагоре или надоле преко плејера да бисте мењали осветљеност са леве стране и јачину звука са десне стране';

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
  String get osdButtons => 'Дугмад плејера';

  @override
  String get osdButtonsDescription =>
      'Изаберите која дугмад ће плејер приказивати';

  @override
  String get osdButtonsSectionDescription =>
      'Контроле репродукције су увек приказане. Све остало бирате сами, а свака врста уређаја има сопствену листу.';

  @override
  String get detailButtons => 'Дугмад за радње';

  @override
  String get detailButtonsDescription =>
      'Изаберите која дугмад ће се приказивати на екрану са детаљима';

  @override
  String get detailButtonsSectionDescription =>
      'Дугме за репродукцију је увек прво, а закључана дугмад су увек приказана. Све остало бирате сами, а свака врста уређаја има сопствену листу.';

  @override
  String get actionButtonsOnScreen => 'Дугмад за радње на екрану';

  @override
  String get actionButtonsOnScreenDescription =>
      'Подесите колико ће се дугмади за радње приказивати пре него што пређу у мени „Још радњи“.';

  @override
  String get actionButtonsOnScreenAuto => 'Аутоматски (подразумевано за тему)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (само репродукција)';

  @override
  String get actionButtonsOnScreenAll => 'Сва (хоризонтално померање)';

  @override
  String get detailMetadata => 'Ред метаподатака';

  @override
  String get detailMetadataDescription =>
      'Изаберите и промените редослед метаподатака који се приказују на екрану са детаљима';

  @override
  String get detailMetadataSectionDescription =>
      'Укључите или искључите ставке метаподатака и одредите редослед којим ће се приказивати на екрану са детаљима. Свака врста уређаја има сопствену листу.';

  @override
  String get detailMetadataYear => 'Година издања';

  @override
  String get detailMetadataParentalRating => 'Старосна ознака';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Трајање и сезоне';

  @override
  String get detailMetadataStatus => 'Статус серије';

  @override
  String get detailMetadataStatusSubtitle =>
      'Приказује да ли се серија наставља, завршена је или се враћа';

  @override
  String get detailMetadataGenres => 'Жанрови';

  @override
  String get detailMetadataSeerrAvailability =>
      'Доступност на сервису Сир (Seerr)';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Приказује статус захтева и доступност медија из сервиса Сир (Seerr)';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Предстојеће епизоде';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Користи Сонар (Sonarr) и Ти-Ем-Ди-Би (TMDB) за приказ предстојећих датума изласка';

  @override
  String get detailSections => 'Одељци';

  @override
  String get detailSectionsDescription =>
      'Изаберите које делове екрана са детаљима желите да прикажете';

  @override
  String get detailSectionsScreenDescription =>
      'На списку су само одељци које може да прикаже тренутни стил екрана са детаљима. Скривањем одељка сакривате га у сваком стилу који га садржи.';

  @override
  String get detailSectionGroupHeader => 'Заглавље';

  @override
  String get detailSectionGroupSections => 'Одељци';

  @override
  String get detailSectionGroupPerson => 'Странице особа';

  @override
  String get detailSectionGroupCollection => 'Странице колекција';

  @override
  String get detailSectionGroupOther => 'Остало';

  @override
  String get detailSectionLogo => 'Лого';

  @override
  String get detailSectionLogoSubtitle =>
      'Када је искључено, приказује наслов као текст';

  @override
  String get detailSectionTagline => 'Слоган';

  @override
  String get detailSectionPoster => 'Постер';

  @override
  String get detailSectionVersionBadge => 'Ознака верзије';

  @override
  String get detailSectionUpNext => 'Следеће';

  @override
  String get detailSectionLyrics => 'Текст песме';

  @override
  String get detailSectionCast => 'Глумачка екипа';

  @override
  String get detailSectionCastSubtitle =>
      'Приказује се и на страницама колекција';

  @override
  String get detailSectionCrew => 'Редитељи и сценаристи';

  @override
  String get detailSectionStudios => 'Студији';

  @override
  String get detailSectionChapters => 'Поглавља';

  @override
  String get detailSectionExtras => 'Додаци';

  @override
  String get detailSectionCollections => 'Колекције';

  @override
  String get detailSectionMoreLikeThis => 'Слично овоме';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Такође слични албуми и извођачи';

  @override
  String get detailSectionMoreEpisodes => 'Још епизода';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'На страницама епизода';

  @override
  String get detailSectionMediaInfo => 'Информације о медију';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'Провера датотеке, токова и директне репродукције';

  @override
  String get detailSectionSeerrGenresTags => 'Жанрови и ознаке';

  @override
  String get detailSectionSeerrStats => 'Статистика';

  @override
  String get detailSectionSeerrStreaming => 'Streaming services';

  @override
  String get seerrStreamingOn => 'Streaming on';

  @override
  String get detailSectionSeerrRecommendations => 'Препоруке';

  @override
  String get detailSectionSeerrSimilar => 'Слични наслови';

  @override
  String get detailSectionSeerrCollection => 'Банер колекције';

  @override
  String get detailSectionSeerrPersonAppearances => 'Појављивања';

  @override
  String get detailSectionSeerrPersonCrew => 'Ангажмани у филмској екипи';

  @override
  String get detailSectionPersonPagesSubtitle => 'На страницама особа';

  @override
  String get detailSectionBiography => 'Биографија';

  @override
  String get detailSectionBirthplace => 'Место рођења';

  @override
  String get detailSectionPersonLinks => 'Links';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB and social media';

  @override
  String get detailSectionGuestAppearances => 'Гостовања';

  @override
  String get detailSectionMusicVideos => 'Музички спотови';

  @override
  String get detailSectionPlaylistOrder => 'Редослед на плејлисти';

  @override
  String get detailSectionBookGenres => 'Жанрови књиге';

  @override
  String get detailSectionPhotoExif => 'Детаљи фотографије';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Следећа: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Данас';

  @override
  String get upcomingEpisodeTomorrow => 'Сутра';

  @override
  String get moveUp => 'Помери нагоре';

  @override
  String get moveDown => 'Помери надоле';

  @override
  String get buttonOrderHint =>
      'Користите стрелице да промените редослед. На даљинском управљачу притисните лево или десно да померите означено дугме. Када неко дугме искључите, оно ће бити померено испод осталих.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Only shows while you\'re in a SyncPlay group';

  @override
  String get orientationLock => 'Закључавање оријентације';

  @override
  String get fullscreen => 'Цео екран';

  @override
  String get audioBehavior => 'Понашање звука';

  @override
  String get downmixToStereo => 'Свођење на стерео';

  @override
  String get defaultAudioLanguage => 'Подразумевани језик звука';

  @override
  String get fallbackAudioLanguage => 'Резервни језик звука';

  @override
  String get preferDefaultAudioTrack => 'Предност подразумеваном аудио-запису';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Дајте предност оригиналном аудио-запису у односу на локализовану синхронизацију.';

  @override
  String get preferAudioDescription => 'Предност аудио-описима';

  @override
  String get preferAudioDescriptionDescription =>
      'Дајте предност записима са аудио-описом у односу на уобичајене аудио-записе.';

  @override
  String get autoServerDefault => 'Аутоматски (подразумевано на серверу)';

  @override
  String get english => 'Енглески';

  @override
  String get spanish => 'Шпански';

  @override
  String get french => 'Француски';

  @override
  String get german => 'Немачки';

  @override
  String get italian => 'Италијански';

  @override
  String get portuguese => 'Португалски';

  @override
  String get japanese => 'Јапански';

  @override
  String get korean => 'Корејски';

  @override
  String get chinese => 'Кинески';

  @override
  String get russian => 'Руски';

  @override
  String get arabic => 'Арапски';

  @override
  String get hindi => 'Хинди';

  @override
  String get dutch => 'Холандски';

  @override
  String get swedish => 'Шведски';

  @override
  String get norwegian => 'Норвешки';

  @override
  String get danish => 'Дански';

  @override
  String get finnish => 'Фински';

  @override
  String get polish => 'Пољски';

  @override
  String get ac3Passthrough => 'Прослеђивање АЦ-3 (AC3)';

  @override
  String get dtsPassthrough => 'Прослеђивање ДТС-а (DTS)';

  @override
  String get trueHdSupport => 'Подршка за Тру-ХД (TrueHD)';

  @override
  String get enableDtsPassthrough =>
      'Прослеђује ДТС (DTS) звук као битски ток искључиво АВ-пријемнику (AVR); неопходни су пријемник који подржава овај формат и изворни ДТС (DTS) запис.';

  @override
  String get settingsAudioFallbackCodec => 'Резервни аудио-кодек';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Изаберите циљни формат у који ће се транскодирати вишеканални звук када изворни ток не може да се репродукује директно нити да се проследи.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Аутоматско откривање\n(препоручено)';

  @override
  String get settingsAudioFallbackCodecAac => 'ААЦ (AAC)\n(подразумевано)';

  @override
  String get settingsAudioFallbackCodecAc3 =>
      'АЦ-3 (AC3)\n(Долби дигитал (Dolby Digital))';

  @override
  String get settingsAudioFallbackCodecEac3 =>
      'Е-АЦ-3 (EAC3)\n(Долби дигитал плус (Dolby Digital Plus))';

  @override
  String get settingsAudioFallbackCodecMp3 => 'МП3 (MP3)\n(само стерео)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Опус (Opus)\n(ефикасан)';

  @override
  String get settingsAudioFallbackCodecFlac => 'ФЛАК (FLAC)\n(без губитака)';

  @override
  String get settingsMaxAudioChannels => 'Највећи број аудио-канала';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Подесите највећи број канала које ваш аудио-систем подржава. Вишеканални токови који премашују ово ограничење биће сведени на мањи број канала или транскодирани.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Аутоматско откривање\n(подразумевано за хардвер)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 моно';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 стерео';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 окружујући звук';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 квадрофонија';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 окружујући звук';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 окружујући звук';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 окружујући звук';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 окружујући звук';

  @override
  String get settingsAudioPassthroughAdvanced => 'Прослеђивање (напредно)';

  @override
  String get settingsAudioCodecPassthrough => 'Прослеђивање кодека';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Омогућите само формате које подржавају ваш АВ-пријемник (AVR) или ХДМИ (HDMI) уређај који прима сигнал.';

  @override
  String get settingsAudioEac3Passthrough => 'Прослеђивање Е-АЦ-3 (EAC3)';

  @override
  String get settingsAudioDtsCorePassthrough =>
      'Прослеђивање ДТС-језгра (DTS Core)';

  @override
  String get settingsAudioDtsHdPassthrough =>
      'Прослеђивање ДТС-ХД МА (DTS-HD MA)';

  @override
  String get settingsAudioPassthroughMode => 'Прослеђивање';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'Како компримовани окружујући звук стиже до телевизора или пријемника.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Искључено (увек декодирај на овом уређају)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Аутоматски (усклади са откривеном подршком уређаја)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Ручно (изаберите формате испод)';

  @override
  String get settingsAudioPassthroughOutput => 'Излаз за прослеђивање';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'Ко пакује битске токове за ХДМИ (HDMI) везу. Ако на овом уређају нема звука при прослеђивању или звук прекида, испробајте пакер апликације.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Аутоматски, системски пакер (АудиоТрак РАВ (AudioTrack RAW))';

  @override
  String get settingsAudioPassthroughOutputIec =>
      'Пакер апликације (АудиоТрак ИЕЦ (AudioTrack IEC))';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'Апликација (ИЕЦ (IEC))';

  @override
  String get settingsDownmixToStereoDescription =>
      'Сведите сав декодирани звук на два канала.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Прослеђује Е-АЦ-3 (E-AC-3) као битски ток, укључујући Долби Атмос (Dolby Atmos) (ЈОЦ (JOC)).';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'Прослеђује ДТС-ХД (DTS-HD) као битски ток, укључујући ДТС:Икс (DTS:X).';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Прослеђује Тру-ХД (TrueHD) као битски ток, укључујући Долби Атмос (Dolby Atmos).';

  @override
  String get settingsAudioTrueHdPassthrough => 'Прослеђивање Тру-ХД (TrueHD)';

  @override
  String get settingsDetectedAudioCapabilities => 'Откривене аудио-могућности';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Снимак тренутних могућности још није доступан.';

  @override
  String get settingsAudioRouteLabel => 'Путања';

  @override
  String get settingsAudioDecodeLabel => 'Декодирање';

  @override
  String get settingsAudioPassthroughLabel => 'Прослеђивање';

  @override
  String get settingsAudioHdRoute => 'Путања за звук високе резолуције';

  @override
  String get settingsAudioRouteHdmi => 'ХДМИ (HDMI)';

  @override
  String get settingsAudioRouteArc => 'АРЦ (ARC)';

  @override
  String get settingsAudioRouteEarc => 'еАРЦ (eARC)';

  @override
  String get settingsAudioRouteBluetooth => 'Блутут (Bluetooth)';

  @override
  String get settingsAudioRouteSpeaker => 'Звучник';

  @override
  String get settingsAudioRouteHeadphones => 'Слушалице';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count канала ПЦМ (PCM)';
  }

  @override
  String get nightMode => 'Ноћни режим';

  @override
  String get compressDynamicRange => 'Компресија динамичког опсега';

  @override
  String get advancedMpv => 'Напредна подешавања мпв-а (mpv)';

  @override
  String get enableCustomMpvConf => 'Омогући прилагођену датотеку mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Примени кориснички наведену конфигурацију mpv.conf пре почетка репродукције';

  @override
  String get unsafeAdvancedMpvOptions =>
      'Небезбедне напредне опције за мпв (mpv)';

  @override
  String get unsafeMpvOptionsDescription =>
      'Дозволи шири скуп опција за мпв (mpv). То може да поремети репродукцију.';

  @override
  String get hardwareDecoding => 'Хардверско декодирање';

  @override
  String get hardwareDecodingSubtitle =>
      'Може да побољша перформансе, али и да изазове проблеме са репродукцијом на неким уређајима.';

  @override
  String get nextUpAndQueuing => 'Следеће и ред за репродукцију';

  @override
  String get nextUpDisplay => 'Приказ следеће ставке';

  @override
  String get extended => 'Проширено';

  @override
  String get minimal => 'Минимално';

  @override
  String get nextUpTimeout => 'Време приказа следеће ставке';

  @override
  String secondsValue(int value) {
    return '$value с';
  }

  @override
  String get mediaQueuing =>
      'Додавање медијског садржаја у ред за репродукцију';

  @override
  String get autoQueueNextEpisodes =>
      'Аутоматски додај следеће епизоде у ред за репродукцију';

  @override
  String get stillWatchingPrompt => 'Упит „Још увек гледате?“';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'После $episodes епизода / $hours ч';
  }

  @override
  String get resumeAndSkip => 'Наставак и прескакање';

  @override
  String get resumeRewind => 'Премотавање при наставку';

  @override
  String get unpauseRewind => 'Премотавање при наставку после паузе';

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
  String get customMpvConfPath => 'Путања до прилагођене датотеке mpv.conf';

  @override
  String get notSetMpvConf =>
      'Није подешено. Мунфин (Moonfin) ће покушати да пронађе подразумевану датотеку mpv.conf у фасциклама апликације или података.';

  @override
  String get selectMpvConf => 'Изабери mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Подешавања стила (величина, боја, померај) примењују се на текстуалне титлове (СРТ (SRT), ВТТ (VTT), ТТМЛ (TTML)). Титлови АСС/ССА (ASS/SSA) користе сопствени уграђени стил, осим ако је опција „Директна репродукција АСС/ССА (ASS/SSA)“ искључена. Титловима у облику битмапе (ПГС (PGS), ДВБ (DVB), Вобсаб (VobSub)) није могуће мењати стил.';

  @override
  String get defaultSubtitleLanguage => 'Подразумевани језик титлова';

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
  String get defaultToNoSubtitles => 'Подразумевано без титлова';

  @override
  String get turnOffSubtitlesByDefault => 'Подразумевано искључи титлове';

  @override
  String get subtitleSize => 'Величина титлова';

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
  String get textFillColor => 'Боја испуне текста';

  @override
  String get backgroundColor => 'Боја позадине';

  @override
  String get textStrokeColor => 'Боја контуре текста';

  @override
  String get subtitleCustomization => 'Прилагођавање титлова';

  @override
  String get subtitleCustomizationDescription => 'Прилагодите изглед титлова';

  @override
  String get subtitleMode => 'Режим титлова';

  @override
  String get subtitleModeFlagged => 'Означени';

  @override
  String get subtitleModeAlways => 'Увек';

  @override
  String get subtitleModeForeign => 'Страни језик';

  @override
  String get subtitleModeForced => 'Принудни';

  @override
  String get subtitleModeFlaggedDescription =>
      'Репродукује титлове који су у метаподацима медијске датотеке означени као „подразумевани“ или „принудни“.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Аутоматски учитава и приказује титлове сваки пут када започне репродукција видео-снимка.';

  @override
  String get subtitleModeForeignDescription =>
      'Аутоматски укључује титлове ако је подразумевани аудио-запис на страном језику.';

  @override
  String get subtitleModeForcedDescription =>
      'Учитава само титлове који су изричито означени метаподатком за принудни приказ.';

  @override
  String get subtitleModeNoneDescription =>
      'Потпуно онемогућава аутоматско учитавање титлова.';

  @override
  String get fallbackSubtitleLanguage => 'Резервни језик титлова';

  @override
  String get subtitleStream => 'Ток титлова';

  @override
  String get subtitlePreviewText => 'Брза смеђа лисица прескаче лењог пса';

  @override
  String get verticalOffset => 'Вертикални померај';

  @override
  String get pgsDirectPlay => 'Директна репродукција ПГС (PGS)';

  @override
  String get directPlayPgsSubtitles => 'Директно репродукуј ПГС (PGS) титлове';

  @override
  String get assSsaDirectPlay => 'Директна репродукција АСС/ССА (ASS/SSA)';

  @override
  String get directPlayAssSsaSubtitles =>
      'Директно репродукуј АСС/ССА (ASS/SSA) титлове';

  @override
  String get white => 'Бела';

  @override
  String get black => 'Црна';

  @override
  String get yellow => 'Жута';

  @override
  String get green => 'Зелена';

  @override
  String get cyan => 'Цијан';

  @override
  String get red => 'Црвена';

  @override
  String get transparent => 'Провидна';

  @override
  String get semiTransparentBlack => 'Полупровидна црна';

  @override
  String get semiTransparentWhite => 'Полупровидна бела';

  @override
  String get lightGray => 'Светлосива';

  @override
  String get darkGray => 'Тамносива';

  @override
  String get blue => 'Плава';

  @override
  String get magenta => 'Магента';

  @override
  String get global => 'Општи';

  @override
  String get desktop => 'Рачунар';

  @override
  String get mobile => 'Мобилни';

  @override
  String get tv => 'ТВ';

  @override
  String loadedProfileSettings(String profile) {
    return 'Подешавања профила $profile су учитана.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Учитавање подешавања профила $profile није успело.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Локална подешавања су синхронизована са профилом $profile.';
  }

  @override
  String get syncing => 'Синхронизација...';

  @override
  String resetProfileTitle(String profile) {
    return 'Вратити профил $profile на подразумеване вредности?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Овим се профил $profile брише са сервера, а сва синхронизована подешавања на овом уређају враћају на подразумеване вредности.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Овим се са сервера бришу сви сачувани профили, а сва синхронизована подешавања на овом уређају враћају на подразумеване вредности.';

  @override
  String profileReset(String profile) {
    return 'Профил $profile је враћен на подразумеване вредности.';
  }

  @override
  String get resetRatingsTitle =>
      'Вратити подешавања оцена на подразумеване вредности?';

  @override
  String get resetRatingsDescription =>
      'Овим се сва подешавања оцена враћају на подразумеване вредности, укључујући то који се извори приказују и којим редоследом.';

  @override
  String get ratingsReset =>
      'Подешавања оцена су враћена на подразумеване вредности.';

  @override
  String failedToResetProfile(String profile) {
    return 'Враћање профила $profile на подразумеване вредности није успело.';
  }

  @override
  String get profileSyncHidden => 'Синхронизација профила је скривена';

  @override
  String get enablePluginSyncDescription =>
      'Укључите синхронизацију са серверским додатком у подешавањима додатака да би се овде приказале контроле профила.';

  @override
  String get quality => 'Квалитет';

  @override
  String get defaultDownloadQuality => 'Подразумевани квалитет преузимања';

  @override
  String get network => 'Мрежа';

  @override
  String get wifiOnlyDownloads => 'Преузимања само преко вај-фаја (WiFi)';

  @override
  String get tvOfflineDownloads => 'Омогући преузимања за коришћење ван мреже';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Прикажи радње за преузимање на страницама ставки';

  @override
  String get reportDownloadsActivity => 'Прикажи преузимања на серверу';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Омогући администратору сервера да на контролној табли види ваша транскодирана преузимања';

  @override
  String get onlyDownloadOnWifi =>
      'Преузимај само када је уређај повезан на вај-фај (WiFi)';

  @override
  String get storage => 'Складиште';

  @override
  String get storageUsed => 'Заузет простор';

  @override
  String get manage => 'Управљај';

  @override
  String get calculating => 'Израчунавање...';

  @override
  String get downloadLocation => 'Локација преузимања';

  @override
  String get defaultLabel => 'Подразумевано';

  @override
  String get sdCard => 'СД (SD) картица';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Андроид (Android) дозвољава Мунфину (Moonfin) да уписује само у фасцикле које припадају апликацији, а овај уређај нема преносиво складиште. Укључите опцију „Сачувај у фасциклу за преузимања“ изнад да би преузимања била на месту доступном другим апликацијама.';

  @override
  String get saveToDownloadsFolder => 'Сачувај у фасциклу за преузимања';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin — видљиво другим апликацијама';

  @override
  String get dangerZone => 'Зона опасности';

  @override
  String get clearAllDownloads => 'Обриши сва преузимања';

  @override
  String get original => 'Оригинални';

  @override
  String get changeDownloadLocation => 'Промени локацију преузимања';

  @override
  String get changeDownloadLocationDescription =>
      'Нова преузимања биће сачувана у изабраној фасцикли. Постојећа преузимања остаће на тренутној локацији и њима можете управљати у подешавањима складишта.';

  @override
  String get confirm => 'Потврди';

  @override
  String get cannotWriteToFolder =>
      'Није могуће уписивати у изабрану фасциклу. Изаберите другу локацију или одобрите приступ складишту.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Сачувати у фасциклу за преузимања?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Преузети медијски садржај биће сачуван у фасцикли Downloads/Moonfin на вашем уређају. Те датотеке биће видљиве другим апликацијама, као што су галерија или музички плејер.\n\nПостојећа преузимања остаће на тренутној локацији.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Транскодирање: преостало време није доступно';

  @override
  String get enable => 'Омогући';

  @override
  String get clearAllDownloadsWarning =>
      'Овим ће бити обрисан сав преузети медијски садржај и то се не може опозвати.';

  @override
  String get clearAll => 'Обриши све';

  @override
  String get navigationStyle => 'Стил навигације';

  @override
  String get topBar => 'Горња трака';

  @override
  String get leftSidebar => 'Лева бочна трака';

  @override
  String get showShuffleButton => 'Прикажи дугме за насумичну репродукцију';

  @override
  String get showGenresButton => 'Прикажи дугме за жанрове';

  @override
  String get showFavoritesButton => 'Прикажи дугме за омиљене ставке';

  @override
  String get showLiveTvButton => 'Прикажи дугме за ТВ уживо';

  @override
  String get showDownloadsButton => 'Прикажи дугме за преузимања';

  @override
  String get showLibrariesInToolbar =>
      'Прикажи библиотеке на траци са алаткама';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'Увек прикажи ознаке навигационе траке';

  @override
  String get showSeerrButton => 'Прикажи дугме Сир (Seerr)';

  @override
  String get navbarOpacity => 'Непрозирност навигационе траке';

  @override
  String get navbarColor => 'Боја навигационе траке';

  @override
  String get gray => 'Сива';

  @override
  String get darkBlue => 'Тамноплава';

  @override
  String get purple => 'Љубичаста';

  @override
  String get teal => 'Плавозелена';

  @override
  String get navy => 'Морнарскоплава';

  @override
  String get charcoal => 'Угљеносива';

  @override
  String get brown => 'Смеђа';

  @override
  String get darkRed => 'Тамноцрвена';

  @override
  String get darkGreen => 'Тамнозелена';

  @override
  String get slate => 'Шкриљастосива';

  @override
  String get indigo => 'Индиго';

  @override
  String get libraryDisplay => 'Приказ библиотеке';

  @override
  String get posterLabel => 'Плакат';

  @override
  String get thumbnailLabel => 'Сличица';

  @override
  String get bannerLabel => 'Банер';

  @override
  String get overridePerLibrarySettings =>
      'Замени подешавања појединачних библиотека';

  @override
  String get applyImageTypeToAllLibraries =>
      'Примени тип слике на све библиотеке';

  @override
  String get multiServerLibraries => 'Библиотеке са више сервера';

  @override
  String get showLibrariesFromAllServers =>
      'Прикажи библиотеке са свих повезаних сервера';

  @override
  String get mergeRecentRowsByType =>
      'Обједини редове недавних ставки по врсти';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Обједини засебне библиотеке исте врсте у редовима „Недавно додато“ и „Недавно објављено“ на почетној страници.';

  @override
  String get libraryView => 'Приказ библиотеке';

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
  String get groupItemsIntoCollections => 'Групиши ставке у колекције';

  @override
  String get hideCollectionAssociatedItems =>
      'Сакриј ставке библиотеке повезане са колекцијама приликом прегледања библиотека';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Обавештење о груписању ставки библиотеке';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Да бисте користили ово подешавање, уверите се да су у подешавањима приказа ваше библиотеке на серверу Џелифин (Jellyfin) или Емби (Emby) омогућене опције „Групиши филмове у колекције“ и/или „Групиши серије у колекције“.';

  @override
  String get libraryVisibility => 'Видљивост библиотеке';

  @override
  String get libraryVisibilityDescription =>
      'Укључите или искључите видљивост сваке библиотеке на почетној страници. Поново покрените Мунфин (Moonfin) да би промене ступиле на снагу.';

  @override
  String get showInNavigation => 'Прикажи у навигацији';

  @override
  String get showInLatestMedia =>
      'Прикажи међу недавно додатим/објављеним медијима';

  @override
  String get libraryOrder => 'Редослед библиотека';

  @override
  String get libraryOrderSubtitle => 'Изаберите редослед својих библиотека';

  @override
  String get libraryOrderDescription =>
      'Ваше библиотеке се овим редоследом приказују у одељку „Моји медији“, редовима недавно додатих ставки и на навигационој траци. Редослед се чува на вашем серверском налогу, па га користе и друге апликације у које се пријавите.';

  @override
  String get libraryOrderTvHint =>
      'Притисните лево или десно да померите истакнуту библиотеку.';

  @override
  String get libraryOrderSaveFailed =>
      'Није могуће сачувати редослед библиотека';

  @override
  String get sourceLibraries => 'Изворне библиотеке';

  @override
  String get sourceCollections => 'Изворне колекције';

  @override
  String get excludedGenres => 'Искључени жанрови';

  @override
  String get selectAll => 'Изабери све';

  @override
  String itemsSelected(int count) {
    return 'Изабрано: $count';
  }

  @override
  String get mediaBar => 'Медијска трака';

  @override
  String get mediaSources => 'Извори медија';

  @override
  String get behavior => 'Понашање';

  @override
  String get seconds => 'секунде';

  @override
  String get mediaBarMode => 'Стил медијске траке';

  @override
  String get mediaBarModeDescription =>
      'Изаберите један од различитих стилова медијске траке или је искључите';

  @override
  String get peekHomeRows => 'Peek Home Rows';

  @override
  String get peekHomeRowsDescription =>
      'Show the top half of the first row along the bottom of the media bar';

  @override
  String get mediaBarModeMoonfin => 'Мунфин (Moonfin)';

  @override
  String get mediaBarModeMakd => 'МакД (MakD)';

  @override
  String get mediaBarModeOff => 'Искључено';

  @override
  String get mediaBarModeBookshelf => 'Полица за књиге';

  @override
  String get mediaBarModeGallery => 'Галерија';

  @override
  String get mediaBarModeBanner => 'Банер';

  @override
  String get mediaBarModeAya => 'Аја (Aya)';

  @override
  String get enableMediaBar => 'Омогући медијску траку';

  @override
  String get showFeaturedContentSlideshow =>
      'Прикажи пројекцију истакнутог садржаја на почетној страници';

  @override
  String get contentType => 'Врста садржаја';

  @override
  String get mediaBarSourceType => 'Извор';

  @override
  String get mediaBarSourceRandom => 'Насумично';

  @override
  String get moviesAndTvShows => 'Филмови и ТВ серије';

  @override
  String get moviesOnly => 'Само филмови';

  @override
  String get tvShowsOnly => 'Само ТВ серије';

  @override
  String get itemCount => 'Број ставки';

  @override
  String get noneSelected => 'Ништа није изабрано';

  @override
  String get noneExcluded => 'Ниједан жанр није искључен';

  @override
  String get autoAdvance => 'Аутоматски прелазак';

  @override
  String get autoAdvanceSlides => 'Аутоматски пређи на следећи слајд';

  @override
  String get autoAdvanceInterval => 'Интервал аутоматског преласка';

  @override
  String get trailerPreview => 'Преглед трејлера';

  @override
  String get autoPlayTrailers =>
      'Аутоматски пусти трејлере у медијској траци након 3 секунде';

  @override
  String get trailerAudio => 'Звук трејлера';

  @override
  String get enableTrailerAudio => 'Омогући звук трејлера у медијској траци';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Титлови трејлера';

  @override
  String get trailerCaptionsDescription =>
      'Прикажи титлове на трејлерима са Јутјуба (YouTube) у медијској траци';

  @override
  String get episodePreview => 'Преглед епизоде';

  @override
  String get mediaPreview => 'Преглед медија';

  @override
  String get episodePreviewDescription =>
      'Пусти преглед у трајању од 30 секунди у оквиру картица које су у фокусу, над којима је показивач или које су дуго притиснуте';

  @override
  String get mediaPreviewDescription =>
      'Пусти преглед у трајању од 30 секунди у оквиру картица које су у фокусу, над којима је показивач или које су дуго притиснуте';

  @override
  String get previewAudio => 'Звук прегледа';

  @override
  String get enablePreviewAudio => 'Омогући звук у прегледима медија';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Недавно додати медији';

  @override
  String get recentlyReleased => 'Недавно објављено';

  @override
  String get recentlyReleasedSeriesType =>
      'Начин сортирања недавно објављених серија';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Сортирај редове недавно објављених серија на почетној страници према серији, последњој сезони или датуму емитовања последње епизоде';

  @override
  String get myMedia => 'Моји медији';

  @override
  String get myMediaSmall => 'Моји медији (мало)';

  @override
  String get continueWatching => 'Настави са гледањем';

  @override
  String get resumeAudio => 'Настави са слушањем';

  @override
  String get resumeBooks => 'Настави са читањем';

  @override
  String get activeRecordings => 'Активна снимања';

  @override
  String get playlists => 'Листе за репродукцију';

  @override
  String get liveTV => 'ТВ уживо';

  @override
  String get favoriteChannels => 'Омиљени канали';

  @override
  String get resetToDefaults => 'Врати подразумеване вредности';

  @override
  String get homeRowPosterSize =>
      'Величина плаката у реду на почетној страници';

  @override
  String get configureImageTypeForEachRow =>
      'Подесите врсту слике за сваки омогућени ред на почетној страници';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Обједини „Настави са гледањем“ и „Следеће“';

  @override
  String get combineBothRows =>
      'Обједини оба реда у један одељак на почетној страници';

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
  String get nextUpMaxDays => 'Највећи број дана у одељку „Следеће“';

  @override
  String get nextUpMaxDaysDescription =>
      'Колико дуго серија остаје у одељку „Следеће“ након што сте је последњи пут гледали';

  @override
  String daysValue(int days) {
    return '$days дана';
  }

  @override
  String get fullScreenRows => 'Проширени редови на почетној страници';

  @override
  String get fullScreenRowsDescription =>
      'Ограничи приказ на један ред почетне странице по екрану';

  @override
  String get homeRowsPadding => 'Размак између редова на почетној страници';

  @override
  String get homeRowsPaddingDescription =>
      'Прилагодите размак између редова на почетној страници';

  @override
  String get homeRowsGenresAndStudios => 'Genres and Studios';

  @override
  String get homeRowsExternalLists => 'External Lists';

  @override
  String get perRowSettings => 'Подешавања за сваки ред';

  @override
  String get autoLogin => 'Аутоматска пријава';

  @override
  String get lastUser => 'Последњи корисник';

  @override
  String get currentUser => 'Тренутни корисник';

  @override
  String get alwaysAuthenticate => 'Увек захтевај потврду идентитета';

  @override
  String get requirePasswordWithToken =>
      'Захтевај лозинку чак и када је токен сачуван';

  @override
  String get confirmExit => 'Потврди излазак';

  @override
  String get showConfirmationBeforeExiting => 'Прикажи потврду пре изласка';

  @override
  String get blockContentWithRatings =>
      'Блокирај садржај са следећим ознакама приступа:';

  @override
  String get noContentRatingsFound =>
      'На овом серверу још нису пронађене ознаке приступа садржају.';

  @override
  String get couldNotLoadServerRatings =>
      'Није могуће учитати ознаке приступа са сервера. Приказују се само сачуване ознаке.';

  @override
  String get couldNotRefreshRatings =>
      'Није могуће освежити ознаке приступа са сервера. Приказују се сачуване ознаке.';

  @override
  String get enablePinCode => 'Омогући ПИН код';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess => 'Захтевај ПИН за приступ налогу';

  @override
  String get changePin => 'Промени ПИН';

  @override
  String get setNewPinCode => 'Постави нови ПИН код';

  @override
  String get removePin => 'Уклони ПИН';

  @override
  String get removePinProtection => 'Уклони заштиту ПИН кодом';

  @override
  String get screensaver => 'Чувар екрана';

  @override
  String get inAppScreensaver => 'Чувар екрана у апликацији';

  @override
  String get enableBuiltInScreensaver => 'Омогући уграђени чувар екрана';

  @override
  String get mode => 'Режим';

  @override
  String get libraryArt => 'Уметнички прикази библиотеке';

  @override
  String get logo => 'Лого';

  @override
  String get clock => 'Сат';

  @override
  String get timeout => 'Време до активирања';

  @override
  String minutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String get dimmingLevel => 'Ниво затамњења';

  @override
  String get maxAgeRating => 'Највиша старосна оцена';

  @override
  String get any => 'Било која';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Захтевај старосну оцену';

  @override
  String get onlyShowRatedContent => 'Прикажи само садржај са старосном оценом';

  @override
  String get displayClockDuringScreensaver =>
      'Приказуј сат током чувара екрана';

  @override
  String get clockModeStatic => 'Непомичан';

  @override
  String get clockModeBouncing => 'Одбијање';

  @override
  String get screensaverGeneralSettings => 'Општа подешавања';

  @override
  String get screensaverVisualComponents => 'Визуелне компоненте';

  @override
  String get screensaverLibraryContent => 'Садржај библиотеке';

  @override
  String get screensaverBackdrop => 'Позадина';

  @override
  String get screensaverBackdropBlack => 'Црна';

  @override
  String get screensaverBackdropMoonfin => 'Мунфин (Moonfin)';

  @override
  String get screensaverBackdropCalm => 'Смирена';

  @override
  String get screensaverBackdropNeonPulse => 'Неонски пулс';

  @override
  String get screensaverBackdropAurora => 'Аурора';

  @override
  String get screensaverAdditionalComponent => 'Додатна компонента';

  @override
  String get screensaverComponentMoonfinLogo => 'Лого Мунфина (Moonfin)';

  @override
  String get screensaverComponentRunner => 'Покретни елемент';

  @override
  String get screensaverComponentMovement => 'Кретање компоненте';

  @override
  String get screensaverComponentPosition => 'Положај компоненте';

  @override
  String get screensaverComponentSize => 'Величина компоненте';

  @override
  String get screensaverSourceLibrariesDefault => 'Све (подразумевано)';

  @override
  String get rottenTomatoesCritics =>
      'Ротен томејтос (Rotten Tomatoes) (критичари)';

  @override
  String get rottenTomatoesAudience =>
      'Ротен томејтос (Rotten Tomatoes) (публика)';

  @override
  String get imdb => 'ИМДБ (IMDb)';

  @override
  String get tmdb => 'ТМДБ (TMDB)';

  @override
  String get metacritic => 'Метакритик (Metacritic)';

  @override
  String get metacriticUser => 'Метакритик (Metacritic) (корисници)';

  @override
  String get trakt => 'Тракт (Trakt)';

  @override
  String get letterboxd => 'Летербоксд (Letterboxd)';

  @override
  String get myAnimeList => 'Мај аниме лист (MyAnimeList)';

  @override
  String get aniList => 'Анилист (AniList)';

  @override
  String get communityRating => 'Оцена заједнице';

  @override
  String get ratings => 'Оцене';

  @override
  String get additionalRatings => 'Додатне оцене';

  @override
  String get showMdbListAndTmdbRatings =>
      'Прикажи оцене са МДБЛиста (MDBList) и ТМДБ-а (TMDB)';

  @override
  String get ratingLabels => 'Ознаке оцена';

  @override
  String get showLabelsNextToIcons => 'Прикажи ознаке поред икона оцена';

  @override
  String get ratingBadges => 'Беџеви оцена';

  @override
  String get showDecorativeBadges => 'Прикажи украсне беџеве иза оцена';

  @override
  String get episodeRatings => 'Оцене епизода';

  @override
  String get showRatingsOnEpisodes => 'Прикажи оцене појединачних епизода';

  @override
  String get ratingSources => 'Извори оцена';

  @override
  String get ratingSourcesDescription =>
      'Омогућите и промените редослед извора оцена који се приказују у апликацији';

  @override
  String get pluginDetected => 'Додатак је откривен';

  @override
  String get pluginNotDetected => 'Додатак није откривен';

  @override
  String get pluginNotDetectedDescription =>
      'Додатак на серверу тренутно није откривен. Локална подешавања и даље користе сачуване вредности или уграђене подразумеване вредности.';

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
  String get recentRequests => 'Недавни захтеви';

  @override
  String get recentlyAdded => 'Недавно додато';

  @override
  String get trending => 'У тренду';

  @override
  String get popularMovies => 'Популарни филмови';

  @override
  String get movieGenres => 'Жанрови филмова';

  @override
  String get upcomingMovies => 'Предстојећи филмови';

  @override
  String get studios => 'Студији';

  @override
  String get popularSeries => 'Популарне серије';

  @override
  String get seriesGenres => 'Жанрови серија';

  @override
  String get upcomingSeries => 'Предстојеће серије';

  @override
  String get networks => 'Мреже';

  @override
  String get tags => 'Ознаке';

  @override
  String get genresAndTags => 'Жанрови и ознаке';

  @override
  String get seerrDiscoveryRows => 'Редови за откривање у Сиру (Seerr)';

  @override
  String get seerrDiscoverSliders => 'Клизачи за откривање у Сиру (Seerr)';

  @override
  String get yourWatchlist => 'Ваша листа за гледање';

  @override
  String get resetRowsToDefaults => 'Врати редове на подразумеване вредности';

  @override
  String get enableSeerr => 'Омогући Сир (Seerr)';

  @override
  String get showSeerrInNavigation =>
      'Прикажи Сир (Seerr) у навигацији (захтева додатак на серверу)';

  @override
  String get seerrUnavailable =>
      'Није доступно јер је подршка за Сир (Seerr) у додатку на серверу онемогућена.';

  @override
  String get nsfwFilter => 'Филтер за садржај за одрасле';

  @override
  String get hideAdultContent => 'Сакриј садржај за одрасле из резултата';

  @override
  String get showMissingCollectionItems =>
      'Прикажи ставке које недостају у колекцији';

  @override
  String get showMissingCollectionItemsDesc =>
      'Укључи ставке које недостају на страницама колекција';

  @override
  String get showSeerrAvailabilityBadges =>
      'Прикажи беџеве доступности Сира (Seerr)';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Прикажи беџеве доступности сезона на страницама са детаљима медија';

  @override
  String get seerrNotificationsSection => 'Обавештења';

  @override
  String get seerrNotifyNewRequestsTitle => 'Обавештења о новим захтевима';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Обавести ме када неко пошаље захтев';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Ажурирања захтева';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Одобрено, одбијено и додато у вашу библиотеку';

  @override
  String get seerrNotifyIssuesTitle => 'Ажурирања проблема';

  @override
  String get seerrNotifyIssuesSubtitle => 'Нови проблеми, одговори и решења';

  @override
  String get seerrNotifyNewMediaTitle => 'Додат је нови медијски садржај';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Све што се ново дода у библиотеку на серверу';

  @override
  String loggedInAs(String username) {
    return 'Пријављени сте као: $username';
  }

  @override
  String get discoverRows => 'Страница за откривање у Сиру (Seerr)';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Омогућите редове који ће се приказивати на главној страници Сира (Seerr). Превуците их да бисте променили редослед. Прилагођени редослед се синхронизује са Мунбејсом (Moonbase).';

  @override
  String get discoverRowsDescription =>
      'Омогућите редове који ће се приказивати на главној страници Сира (Seerr). Превуците их да бисте променили редослед. Прилагођени редослед се синхронизује са Мунбејсом (Moonbase).';

  @override
  String get enabled => 'Омогућено';

  @override
  String get hidden => 'Сакривено';

  @override
  String get aboutTitle => 'О апликацији';

  @override
  String versionValue(String version) {
    return 'Верзија $version';
  }

  @override
  String get openSourceLicenses => 'Лиценце отвореног кода';

  @override
  String get sourceCode => 'Изворни код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Провери да ли има ажурирања';

  @override
  String get checksLatestDesktopRelease =>
      'Проверава најновије издање за рачунаре за ову платформу';

  @override
  String get youAreUpToDate => 'Користите најновију верзију.';

  @override
  String get couldNotCheckForUpdates =>
      'Тренутно није могуће проверити да ли има ажурирања.';

  @override
  String get noCompatibleUpdate =>
      'Није пронађен пакет ажурирања компатибилан са овом платформом.';

  @override
  String get updateChecksNotSupported =>
      'Провера ажурирања није подржана на овој платформи.';

  @override
  String get updateNotificationsDisabled =>
      'Обавештења о ажурирањима су онемогућена.';

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
    return 'Доступно је ажурирање: v$version';
  }

  @override
  String get updateNotifications => 'Обавештења о ажурирањима';

  @override
  String get showWhenUpdatesAvailable => 'Прикажи када су доступна ажурирања';

  @override
  String updateAvailableTitle(String version) {
    return 'Доступна је верзија v$version';
  }

  @override
  String get readReleaseNotes => 'Прочитај белешке о издању';

  @override
  String get downloadingUpdate => 'Преузимање ажурирања...';

  @override
  String get updateDownloadFailed =>
      'Преузимање ажурирања није успело. Покушајте поново.';

  @override
  String get openReleasesPage => 'Отвори страницу са издањима';

  @override
  String get navigation => 'Навигација';

  @override
  String get watchedIndicatorsBackdrops =>
      'Индикатори одгледаног садржаја, позадине';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Боја фокуса, индикатори одгледаног садржаја, позадине';

  @override
  String get navbarStyleToolbarAppearance =>
      'Изглед траке за навигацију, дугмад на траци са алаткама, изглед';

  @override
  String get featuredContentAppearance => 'Истакнути садржај, изглед';

  @override
  String gbValue(String value) {
    return '$value ГБ';
  }

  @override
  String mbValue(int value) {
    return '$value МБ';
  }

  @override
  String get imageCacheLimit => 'Ограничење кеша слика';

  @override
  String get clearImageCache => 'Обриши кеш слика';

  @override
  String get imageCacheCleared => 'Кеш слика је обрисан';

  @override
  String get clear => 'Обриши';

  @override
  String get browse => 'Прегледај';

  @override
  String get noResults => 'Нема резултата';

  @override
  String get seerrAvailableStatus => 'Доступно';

  @override
  String get seerrRequestedStatus => 'Затражено';

  @override
  String get seerrDownloading => 'Преузимање';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Преузимање · $done / $total';
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
    return 'Преузимање · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Увоз';

  @override
  String itemsCount(int count) {
    return '$count ставки';
  }

  @override
  String get seerrSettings => 'Подешавања Сира (Seerr)';

  @override
  String get requestMore => 'Затражи још';

  @override
  String get requestMore4k => 'Затражи још у 4К резолуцији';

  @override
  String get request => 'Затражи';

  @override
  String get request4k => 'Затражи у 4К резолуцији';

  @override
  String get requested4k => 'Затражено у 4К резолуцији';

  @override
  String get cancelRequest => 'Откажи захтев';

  @override
  String get cancelRequest4k => 'Откажи захтев за 4К резолуцију';

  @override
  String get playInMoonfin => 'Пусти у Мунфину (Moonfin)';

  @override
  String get requestedByLabel => 'Затражио/ла';

  @override
  String requestedByName(String name) {
    return 'Затражио/ла: $name';
  }

  @override
  String get manageRequests => 'Управљај захтевима';

  @override
  String get watchlist => 'Листа за праћење';

  @override
  String get onWatchlist => 'На листи за праћење';

  @override
  String get approve => 'Одобри';

  @override
  String get declineAction => 'Одбиј';

  @override
  String get similar => 'Слично';

  @override
  String get recommendations => 'Препоруке';

  @override
  String cancelRequestForTitle(String title) {
    return 'Отказати захтев за „$title“?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Отказати $count захтева за „$title“?';
  }

  @override
  String get keep => 'Задржи';

  @override
  String get itemNotFoundInLibrary =>
      'Ставка није пронађена у вашој библиотеци Мунфина (Moonfin)';

  @override
  String get errorSearchingLibrary => 'Грешка при претрази библиотеке';

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
    return 'Затражи $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Затражи $type у 4К резолуцији';
  }

  @override
  String get submitRequest => 'Пошаљи захтев';

  @override
  String get allSeasons => 'Све сезоне';

  @override
  String get seerrSeriesContinuing =>
      'Серија се наставља · Могуће је затражити будуће сезоне';

  @override
  String get advancedOptions => 'Напредне опције';

  @override
  String get noServiceServersConfigured =>
      'Није конфигурисан ниједан сервер сервиса';

  @override
  String get server => 'Сервер';

  @override
  String get qualityProfile => 'Профил квалитета';

  @override
  String get rootFolder => 'Коренска фасцикла';

  @override
  String get showMore => 'Прикажи више';

  @override
  String get appearances => 'Појављивања';

  @override
  String get crewSection => 'Екипа';

  @override
  String ageValue(int age) {
    return 'старост $age';
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
  String get blocklistedStatus => 'На списку блокираних';

  @override
  String get deletedStatus => 'Обрисано';

  @override
  String get failedStatus => 'Неуспело';

  @override
  String get processingStatus => 'Обрада';

  @override
  String modifiedByName(String name) {
    return 'Изменио/ла: $name';
  }

  @override
  String get completedStatus => 'Завршено';

  @override
  String get requestErrorDuplicate => 'Овај наслов је већ затражен';

  @override
  String get requestErrorQuota => 'Достигнуто је ограничење броја захтева';

  @override
  String get requestErrorBlocklisted =>
      'Овај наслов се налази на списку блокираних';

  @override
  String get requestErrorNoSeasons =>
      'Нема више сезона које можете да затражите';

  @override
  String get requestErrorPermission =>
      'Немате дозволу да поднесете овај захтев';

  @override
  String get seerrRequestsTitle => 'Захтеви';

  @override
  String get seerrIssuesTitle => 'Проблеми';

  @override
  String get sortNewest => 'Најновије';

  @override
  String get sortLastModified => 'Последње измењено';

  @override
  String get noIssues => 'Нема проблема';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Преостало је $remaining од $limit захтева за филмове';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Преостало је $remaining од $limit захтева за сезоне';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Део колекције „$name“';
  }

  @override
  String get viewCollection => 'Погледај колекцију';

  @override
  String get requestCollection => 'Затражи колекцију';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total филмова · $available доступних';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Затражи $count филмова';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Подношење захтева $current од $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Затражено филмова: $count';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Затражено $ok од $total филмова';
  }

  @override
  String get collectionAllRequested =>
      'Сви филмови су већ доступни или затражени';

  @override
  String get reportIssue => 'Пријави проблем';

  @override
  String get issueTypeVideo => 'Видео';

  @override
  String get issueTypeAudio => 'Аудио';

  @override
  String get whatsWrong => 'У чему је проблем?';

  @override
  String get allEpisodes => 'Све епизоде';

  @override
  String get episode => 'Епизода';

  @override
  String get openStatus => 'Отворено';

  @override
  String get resolvedStatus => 'Решено';

  @override
  String get resolveAction => 'Означи као решено';

  @override
  String get reopenAction => 'Поново отвори';

  @override
  String reportedByName(String name) {
    return 'Пријавио/ла: $name';
  }

  @override
  String commentsCount(int count) {
    return '$count коментара';
  }

  @override
  String get addComment => 'Додај коментар';

  @override
  String get deleteIssueConfirm => 'Избрисати овај проблем?';

  @override
  String get submitReport => 'Пошаљи пријаву';

  @override
  String get tmdbScore => 'Оцена на ТМДБ-у (TMDB)';

  @override
  String get releaseDateLabel => 'Датум објављивања';

  @override
  String get firstAirDateLabel => 'Датум првог емитовања';

  @override
  String get revenueLabel => 'Приход';

  @override
  String get runtimeLabel => 'Трајање';

  @override
  String get budgetLabel => 'Буџет';

  @override
  String get originalLanguageLabel => 'Изворни језик';

  @override
  String get seasonsLabel => 'Сезоне';

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
  String get create => 'Направи';

  @override
  String get disable => 'Онемогући';

  @override
  String get done => 'Готово';

  @override
  String get edit => 'Измени';

  @override
  String get encoding => 'Кодирање';

  @override
  String get error => 'Грешка';

  @override
  String get forward => 'Проследи';

  @override
  String get general => 'Опште';

  @override
  String get go => 'Иди';

  @override
  String get install => 'Инсталирај';

  @override
  String get installed => 'Инсталирано';

  @override
  String get interval => 'Интервал';

  @override
  String get name => 'Име';

  @override
  String get networking => 'Умрежавање';

  @override
  String get next => 'Следеће';

  @override
  String get path => 'Путања';

  @override
  String get paused => 'Паузирано';

  @override
  String get permissions => 'Дозволе';

  @override
  String get processing => 'Обрада';

  @override
  String get profile => 'Профил';

  @override
  String get provider => 'Добављач';

  @override
  String get refresh => 'Освежи';

  @override
  String get remote => 'Удаљено';

  @override
  String get rename => 'Преименуј';

  @override
  String get revoke => 'Опозови';

  @override
  String get role => 'Улога';

  @override
  String get root => 'Коренски';

  @override
  String get run => 'Покрени';

  @override
  String get search => 'Претражи';

  @override
  String get select => 'Изабери';

  @override
  String get send => 'Пошаљи';

  @override
  String get sessions => 'Сесије';

  @override
  String get set => 'Постави';

  @override
  String get status => 'Статус';

  @override
  String get stop => 'Заустави';

  @override
  String get streaming => 'Стримовање';

  @override
  String get time => 'Време';

  @override
  String get trickplay => 'Навигација кроз видео';

  @override
  String get uninstall => 'Деинсталирај';

  @override
  String get up => 'Горе';

  @override
  String get update => 'Ажурирај';

  @override
  String get upload => 'Отпреми';

  @override
  String get unmute => 'Укључи звук';

  @override
  String get mute => 'Искључи звук';

  @override
  String get branding => 'Брендирање';

  @override
  String get adminDrawerDashboard => 'Контролна табла';

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
  String get adminDrawerDisplay => 'Приказ';

  @override
  String get adminDrawerMetadata => 'Метаподаци';

  @override
  String get adminDrawerNfo => 'НФО (NFO) подешавања';

  @override
  String get adminDrawerTranscoding => 'Транскодирање';

  @override
  String get adminDrawerResume => 'Наставак репродукције';

  @override
  String get adminDrawerStreaming => 'Стримовање';

  @override
  String get adminDrawerTrickplay => 'Навигација кроз видео';

  @override
  String get adminDrawerDevices => 'Уређаји';

  @override
  String get adminDrawerActivity => 'Активност';

  @override
  String get adminDrawerNetworking => 'Умрежавање';

  @override
  String get adminDrawerApiKeys => 'АПИ (API) кључеви';

  @override
  String get adminDrawerBackups => 'Резервне копије';

  @override
  String get adminDrawerLogs => 'Евиденције';

  @override
  String get adminDrawerScheduledTasks => 'Планирани задаци';

  @override
  String get adminDrawerPlugins => 'Додаци';

  @override
  String get adminDrawerRepositories => 'Репозиторијуми';

  @override
  String get adminDrawerLiveTv => 'Телевизија уживо';

  @override
  String get adminExitTooltip => 'Изађи из администрације';

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
      'Учитавање контролне табле није успело';

  @override
  String get adminMediaOverview => 'Преглед медија';

  @override
  String get adminMediaTotalsError =>
      'Учитавање укупног броја медија на серверу није успело.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Кратак преглед количине садржаја на овом серверу.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Доступна су ажурирања додатака: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Додаци који захтевају поновно покретање: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Неуспешни заказани задаци: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Расподела медија';

  @override
  String get analyticsVideoCodecs => 'Видео кодеци';

  @override
  String get analyticsAudioCodecs => 'Аудио кодеци';

  @override
  String get analyticsContainers => 'Контејнери';

  @override
  String get analyticsTopGenres => 'Најзаступљенији жанрови';

  @override
  String get analyticsReleaseYears => 'Године издања';

  @override
  String get analyticsContentRatings => 'Оцене садржаја';

  @override
  String get analyticsRuntimeBuckets => 'Категорије трајања';

  @override
  String get analyticsFileFormats => 'Формати датотека';

  @override
  String get analyticsNoData => 'Нема доступних података.';

  @override
  String get adminServerInfo => 'Информације о серверу';

  @override
  String get adminRestartPending => 'Чека се поновно покретање';

  @override
  String get adminServerPaths => 'Путање сервера';

  @override
  String get adminServerActions => 'Радње сервера';

  @override
  String get adminRestartServer => 'Поново покрени сервер';

  @override
  String get adminShutdownServer => 'Искључи сервер';

  @override
  String get adminLibraryScanStarted => 'Скенирање библиотеке је покренуто';

  @override
  String errorGeneric(String error) {
    return 'Грешка: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Поновно покретање сервера је у току';

  @override
  String get adminServerRebootMessage =>
      'Поновно покретање сервера је у току, поново покрените Мунфин (Moonfin)';

  @override
  String get adminActiveSessions => 'Активне сесије';

  @override
  String get adminSessionsLoadFailed => 'Учитавање сесија није успело';

  @override
  String get adminNoActiveSessions => 'Нема активних сесија';

  @override
  String get adminRecentActivity => 'Недавна активност';

  @override
  String get adminNoRecentActivity => 'Нема недавне активности';

  @override
  String adminCommandFailed(String error) {
    return 'Извршавање команде није успело: $error';
  }

  @override
  String get adminSendMessage => 'Пошаљи поруку';

  @override
  String get adminMessageTextHint => 'Текст поруке';

  @override
  String get adminSetVolume => 'Подеси јачину звука';

  @override
  String get sessionPrev => 'Претходно';

  @override
  String get sessionRewind => 'Премотај уназад';

  @override
  String get sessionForward => 'Премотај унапред';

  @override
  String get sessionNext => 'Следеће';

  @override
  String get sessionVolumeDown => 'Јачина –';

  @override
  String get sessionVolumeUp => 'Јачина +';

  @override
  String get uhd4k => '4К';

  @override
  String get nowPlaying => 'Сада се репродукује';

  @override
  String get volume => 'Јачина звука';

  @override
  String get actions => 'Радње';

  @override
  String get videoCodec => 'Видео кодек';

  @override
  String get audioCodec => 'Аудио кодек';

  @override
  String get hwAccel => 'Хардверско убрзање';

  @override
  String get completion => 'Завршеност';

  @override
  String get adminClearDates => 'Обриши датуме';

  @override
  String get adminActivitySeverityAll => 'Сви нивои озбиљности';

  @override
  String get adminActivityDateRange => 'Период';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Учитавање дневника активности није успело: $error';
  }

  @override
  String get adminNoActivityEntries => 'Нема записа о активностима';

  @override
  String get adminEditDeviceName => 'Измени назив уређаја';

  @override
  String get adminCustomName => 'Прилагођени назив';

  @override
  String get adminDeviceNameUpdated => 'Назив уређаја је ажуриран';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Ажурирање уређаја није успело: $error';
  }

  @override
  String get adminDeleteDevice => 'Обриши уређај';

  @override
  String get adminDeviceDeleted => 'Уређај је обрисан';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Брисање уређаја није успело: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Уклонити уређај „$name“? Корисник ће морати поново да се пријави на овом уређају.';
  }

  @override
  String get adminDeleteAllDevices => 'Обриши све уређаје';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Уклонити уређаје ($count)? Корисници на које се ово односи мораће поново да се пријаве. Ово неће утицати на ваш тренутни уређај.';
  }

  @override
  String get adminDevicesDeletedAll => 'Уређаји су уклоњени';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Неки уређаји су уклоњени; број уређаја које није било могуће уклонити: $count.';
  }

  @override
  String get adminDevicesLoadFailed => 'Учитавање уређаја није успело';

  @override
  String get adminSearchDevices => 'Претражи уређаје';

  @override
  String get adminThisDevice => 'Овај уређај';

  @override
  String get adminEditName => 'Измени назив';

  @override
  String get adminLibrariesLoadFailed => 'Учитавање библиотека није успело';

  @override
  String get adminNoLibraries => 'Ниједна библиотека није подешена';

  @override
  String get adminScanAllLibraries => 'Скенирај све библиотеке';

  @override
  String get adminAddLibrary => 'Додај библиотеку';

  @override
  String adminScanFailed(String error) {
    return 'Покретање скенирања није успело: $error';
  }

  @override
  String get adminRenameLibrary => 'Преименуј библиотеку';

  @override
  String get adminNewName => 'Нови назив';

  @override
  String adminLibraryRenamed(String name) {
    return 'Назив библиотеке је промењен у „$name“';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Преименовање није успело: $error';
  }

  @override
  String get adminDeleteLibrary => 'Обриши библиотеку';

  @override
  String adminLibraryDeleted(String name) {
    return 'Библиотека „$name“ је обрисана';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Брисање библиотеке није успело: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Додавање путање није успело: $error';
  }

  @override
  String get adminRemovePath => 'Уклони путању';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Уклонити „$path“ из ове библиотеке?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Уклањање путање није успело: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Учитавање библиотеке није успело';

  @override
  String get adminNoMediaPaths => 'Ниједна путања до медија није подешена';

  @override
  String get adminAddPath => 'Додај путању';

  @override
  String get adminBrowseFilesystem => 'Прегледај систем датотека сервера:';

  @override
  String get adminPreferredMetadataLanguage => 'Жељени језик метаподатака';

  @override
  String get adminMetadataLanguageHint => 'нпр. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Код земље за метаподатке';

  @override
  String get adminMetadataCountryHint => 'нпр. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Путање';

  @override
  String get adminLibraryTabOptions => 'Опције';

  @override
  String get adminLibraryTabDownloaders => 'Програми за преузимање';

  @override
  String get adminLibMetadataSavers => 'Програми за чување метаподатака';

  @override
  String get adminLibSubtitleDownloaders => 'Програми за преузимање титлова';

  @override
  String get adminLibLyricDownloaders =>
      'Програми за преузимање текстова песама';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Програми за преузимање метаподатака: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Програми за преузимање слика: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Овај сервер не нуди програме за преузимање за ову врсту библиотеке.';

  @override
  String get adminLibrarySectionGeneral => 'Опште';

  @override
  String get adminLibrarySectionMetadata => 'Метаподаци';

  @override
  String get adminLibrarySectionEmbedded => 'Уграђене информације';

  @override
  String get adminLibrarySectionSubtitles => 'Титлови';

  @override
  String get adminLibrarySectionImages => 'Слике';

  @override
  String get adminLibrarySectionSeries => 'Серије';

  @override
  String get adminLibrarySectionMusic => 'Музика';

  @override
  String get adminLibrarySectionMovies => 'Филмови';

  @override
  String get adminLibRealtimeMonitor => 'Омогући праћење у реалном времену';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Открива промене датотека и аутоматски их обрађује.';

  @override
  String get adminLibEnablePhotos => 'Прикажи фотографије';

  @override
  String get adminLibSaveLocalMetadata =>
      'Сачувај слике у фасциклама са медијима';

  @override
  String get adminLibRefreshInterval => 'Аутоматско освежавање метаподатака';

  @override
  String get adminLibRefreshNever => 'Никада';

  @override
  String get adminLibDefault => 'Подразумевано';

  @override
  String get adminLibDisplayTitle => 'Приказ';

  @override
  String get adminLibDisplaySection => 'Приказ библиотеке';

  @override
  String get adminLibFolderView =>
      'Прикажи приказ фасцикли да би се виделе обичне фасцикле са медијима';

  @override
  String get adminLibSpecialsInSeasons =>
      'Прикажи специјалне епизоде у сезонама у којима су емитоване';

  @override
  String get adminLibGroupMovies => 'Групиши филмове у колекције';

  @override
  String get adminLibGroupShows => 'Групиши серије у колекције';

  @override
  String get adminLibExternalSuggestions =>
      'Прикажи спољни садржај у предлозима';

  @override
  String get adminLibDateAddedSection => 'Начин одређивања датума додавања';

  @override
  String get adminLibDateAddedLabel => 'Користи датум додавања из';

  @override
  String get adminLibDateAddedImport => 'Датум скенирања у библиотеку';

  @override
  String get adminLibDateAddedFile => 'Датум креирања датотеке';

  @override
  String get adminLibMetadataTitle => 'Метаподаци и слике';

  @override
  String get adminLibMetadataLangSection => 'Жељени језик метаподатака';

  @override
  String get adminLibChaptersSection => 'Поглавља';

  @override
  String get adminLibDummyChapterDuration =>
      'Трајање привременог поглавља (у секундама)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Трајање поглавља генерисаних за медије који немају поглавља. Подесите на 0 да бисте онемогућили.';

  @override
  String get adminLibChapterImageResolution => 'Резолуција слика поглавља';

  @override
  String get adminLibNfoTitle => 'Подешавања НФО датотека (NFO)';

  @override
  String get adminLibNfoHelp =>
      'НФО метаподаци (NFO) компатибилни су са Кодијем (Kodi) и сличним клијентима. Подешавања важе за све библиотеке у које се чувају НФО метаподаци.';

  @override
  String get adminLibKodiUser =>
      'Корисник чији ће се подаци о гледању чувати у НФО датотекама';

  @override
  String get adminLibSaveImagePaths => 'Сачувај путање слика у НФО датотекама';

  @override
  String get adminLibPathSubstitution =>
      'Омогући замену путања за слике у НФО датотекама';

  @override
  String get adminLibExtraThumbs =>
      'Копирај слике extrafanart у фасциклу extrathumbs';

  @override
  String get adminLibNone => 'Ништа';

  @override
  String adminLibRefreshDays(int days) {
    return '$days дана';
  }

  @override
  String get adminLibEmbeddedTitles => 'Користи уграђене наслове';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Користи уграђене наслове за додатке';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Користи уграђене информације о епизодама';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Дозволи уграђене титлове';

  @override
  String get adminLibEmbeddedAllowAll => 'Дозволи све';

  @override
  String get adminLibEmbeddedAllowText => 'Само текстуалне';

  @override
  String get adminLibEmbeddedAllowImage => 'Само сликовне';

  @override
  String get adminLibEmbeddedAllowNone => 'Ништа';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Прескочи преузимање ако већ постоје уграђени титлови';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Прескочи преузимање ако се језик аудио-записа подудара са језиком преузимања';

  @override
  String get adminLibRequirePerfectMatch =>
      'Захтевај потпуно подударање титлова';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Сачувај титлове у фасциклама са медијима';

  @override
  String get adminLibChapterImageExtraction => 'Издвајај слике поглавља';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Издвајај слике поглавља током скенирања библиотеке';

  @override
  String get adminLibTrickplayExtraction =>
      'Омогући издвајање слика за преглед током премотавања';

  @override
  String get adminLibTrickplayDuringScan =>
      'Издвајај слике за преглед током премотавања приликом скенирања библиотеке';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Сачувај слике за преглед током премотавања у фасциклама са медијима';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Аутоматски обједињуј серије смештене у више фасцикли';

  @override
  String get adminLibSeasonZeroName => 'Назив за приказ нулте сезоне';

  @override
  String get adminLibLufsScan =>
      'Омогући ЛУФС (LUFS) скенирање за нормализацију звука';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Дај предност нестандардној ознаци извођача';

  @override
  String get adminLibAutoAddToCollection =>
      'Аутоматски додај филмове у колекције';

  @override
  String get adminLibraryNameRequired => 'Назив библиотеке је обавезан';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Креирање библиотеке није успело: $error';
  }

  @override
  String get adminLibraryName => 'Назив библиотеке';

  @override
  String get adminSelectedPaths => 'Изабране путање:';

  @override
  String get adminCreateLibrary => 'Креирај библиотеку';

  @override
  String get paths => 'Путање:';

  @override
  String get adminDisableUser => 'Онемогући корисника';

  @override
  String get adminEnableUser => 'Омогући корисника';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Онемогућити налог корисника $name? Неће моћи да се пријави.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Омогућити налог корисника $name? Поново ће моћи да се пријави.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Кориснички налог „$name“ је онемогућен';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Кориснички налог „$name“ је омогућен';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Ажурирање смерница корисника није успело: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Учитавање корисника није успело';

  @override
  String get adminSearchUsers => 'Претражи кориснике';

  @override
  String get adminEditUser => 'Измени корисника';

  @override
  String get adminAddUser => 'Додај корисника';

  @override
  String adminUserCreateFailed(String error) {
    return 'Креирање корисника није успело: $error';
  }

  @override
  String get adminCreateUser => 'Креирај корисника';

  @override
  String get adminPasswordOptional => 'Лозинка (опционално)';

  @override
  String get adminUsernameRequired => 'Корисничко име не може бити празно';

  @override
  String adminSaveFailed(String error) {
    return 'Чување није успело: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Лозинке се не подударају';

  @override
  String adminFailed(String error) {
    return 'Није успело: $error';
  }

  @override
  String get adminUserLoadFailed => 'Учитавање корисника није успело';

  @override
  String get adminDeleteUser => 'Обриши корисника';

  @override
  String get admin => 'Администратор';

  @override
  String get adminFullAccessWarning =>
      'Администратори имају потпун приступ серверу. Додељујте ово овлашћење опрезно.';

  @override
  String get administrator => 'Администратор';

  @override
  String get adminHiddenUser => 'Скривени корисник';

  @override
  String get adminAllowMediaPlayback => 'Дозволи репродукцију медија';

  @override
  String get adminAllowAudioTranscoding => 'Дозволи транскодирање звука';

  @override
  String get adminAllowVideoTranscoding => 'Дозволи транскодирање видеа';

  @override
  String get adminAllowRemuxing => 'Дозволи поновно мултиплексирање';

  @override
  String get adminForceRemoteTranscoding =>
      'Присилно транскодирај удаљени извор';

  @override
  String get adminAllowContentDownloading => 'Дозволи преузимање садржаја';

  @override
  String get adminAllowPublicSharing => 'Дозволи јавно дељење';

  @override
  String get adminAllowRemoteControl =>
      'Дозволи даљинско управљање другим корисницима';

  @override
  String get adminAllowSharedDeviceControl =>
      'Дозволи управљање дељеним уређајима';

  @override
  String get adminAllowRemoteAccess => 'Дозволи удаљени приступ';

  @override
  String get adminLeaveEmptyNoLimit =>
      'Оставите празно ако не желите ограничење';

  @override
  String get adminMaxActiveSessions => 'Највећи број активних сесија';

  @override
  String get adminAllowLiveTvAccess => 'Дозволи приступ телевизији уживо';

  @override
  String get adminAllowLiveTvManagement =>
      'Дозволи управљање телевизијом уживо';

  @override
  String get adminAllowCollectionManagement => 'Дозволи управљање колекцијама';

  @override
  String get adminAllowSubtitleManagement => 'Дозволи управљање титловима';

  @override
  String get adminAllowLyricManagement => 'Дозволи управљање текстовима песама';

  @override
  String get adminEnableAllLibraryAccess => 'Омогући приступ свим библиотекама';

  @override
  String get adminChangePassword => 'Промени лозинку';

  @override
  String get adminNewPassword => 'Нова лозинка';

  @override
  String get adminConfirmPassword => 'Потврди лозинку';

  @override
  String get adminSetPassword => 'Постави лозинку';

  @override
  String get adminResetPassword => 'Ресетуј лозинку';

  @override
  String get adminPasswordReset => 'Лозинка је ресетована';

  @override
  String get adminPasswordUpdated => 'Лозинка је ажурирана';

  @override
  String get adminUserSettings => 'Корисничка подешавања';

  @override
  String get adminLibraryAccess => 'Приступ библиотекама';

  @override
  String get adminEnableAllDevices => 'Омогући приступ свим уређајима';

  @override
  String get adminEnableAllChannels => 'Омогући приступ свим каналима';

  @override
  String get adminParentalControl => 'Родитељски надзор';

  @override
  String get adminMaxParentalRating => 'Највиша дозвољена старосна оцена';

  @override
  String get adminMaxParentalRatingHint =>
      'Садржај са вишом оценом биће скривен од овог корисника.';

  @override
  String get adminParentalRatingNone => 'Ништа';

  @override
  String get adminBlockUnratedItems =>
      'Блокирај ставке без оцена или са непрепознатим подацима о оцени';

  @override
  String get adminUnratedBook => 'Књиге';

  @override
  String get adminUnratedChannelContent => 'Канали';

  @override
  String get adminUnratedLiveTvChannel => 'Телевизија уживо';

  @override
  String get adminUnratedMovie => 'Филмови';

  @override
  String get adminUnratedMusic => 'Музика';

  @override
  String get adminUnratedTrailer => 'Трејлери';

  @override
  String get adminUnratedSeries => 'Серије';

  @override
  String get adminAccessSchedules => 'Распореди приступа';

  @override
  String get adminAccessSchedulesHint =>
      'Дозволи приступ само у доленаведеним терминима. Ако распоред није подешен, приступ је дозвољен током целог дана.';

  @override
  String get adminAddSchedule => 'Додај распоред';

  @override
  String get adminScheduleDay => 'Дан';

  @override
  String get adminScheduleStart => 'Почетак';

  @override
  String get adminScheduleEnd => 'Крај';

  @override
  String get adminDayEveryday => 'Сваког дана';

  @override
  String get adminDayWeekday => 'Радним даном';

  @override
  String get adminDayWeekend => 'Викендом';

  @override
  String get adminDaySunday => 'Недеља';

  @override
  String get adminDayMonday => 'Понедељак';

  @override
  String get adminDayTuesday => 'Уторак';

  @override
  String get adminDayWednesday => 'Среда';

  @override
  String get adminDayThursday => 'Четвртак';

  @override
  String get adminDayFriday => 'Петак';

  @override
  String get adminDaySaturday => 'Субота';

  @override
  String get adminAllowedTags => 'Дозвољене ознаке';

  @override
  String get adminAllowedTagsHint =>
      'Приказује се само садржај са овим ознакама. Оставите празно да бисте дозволили сав садржај.';

  @override
  String get adminBlockedTags => 'Блокиране ознаке';

  @override
  String get adminBlockedTagsHint =>
      'Садржај са овим ознакама биће скривен од овог корисника.';

  @override
  String get adminAddTag => 'Додај ознаку';

  @override
  String get adminAuthProvider => 'Провајдер аутентификације';

  @override
  String get adminPasswordResetProvider => 'Провајдер за ресетовање лозинке';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Највећи број неуспешних покушаја пријаве пре закључавања';

  @override
  String get adminLoginAttemptsHint =>
      'Поставите на 0 за подразумевану вредност или на -1 да бисте онемогућили закључавање.';

  @override
  String get adminSyncPlayAccess => 'Приступ функцији СинкПлеј (SyncPlay)';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Дозволи креирање група и придруживање њима';

  @override
  String get adminSyncPlayJoin => 'Дозволи придруживање групама';

  @override
  String get adminSyncPlayNone => 'Нема приступа';

  @override
  String get adminContentDeletionFolders => 'Дозволи брисање садржаја из';

  @override
  String get adminResetPasswordWarning =>
      'Овим ће лозинка бити уклоњена. Корисник ће моћи да се пријави без лозинке.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Сервер је вратио ХТТП (HTTP) статус $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Да ли сте сигурни да желите да обришете корисника $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Корисник „$name“ је обрисан';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Брисање корисника није успело: $error';
  }

  @override
  String get adminCreateApiKey => 'Креирај кључ АПИ-ја';

  @override
  String get adminAppName => 'Назив апликације';

  @override
  String get adminApiKeyCreated => 'Кључ АПИ-ја је креиран';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Кључ је успешно креиран. Сервер није вратио токен. Проверите кључеве АПИ-ја на серверу.';

  @override
  String get adminKeyCopied => 'Кључ је копиран у међуспремник';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Креирање кључа није успело: $error';
  }

  @override
  String get adminKeyTokenMissing => 'У одговору сервера недостаје токен кључа';

  @override
  String get adminRevokeApiKey => 'Опозови кључ АПИ-ја';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Опозвати кључ за $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Кључ АПИ-ја је опозван';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Опозив кључа није успео: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Учитавање АПИ кључева није успело';

  @override
  String get adminApiKeysTitle => 'АПИ кључеви';

  @override
  String get adminCreateKey => 'Направи кључ';

  @override
  String get adminNoApiKeys => 'Није пронађен ниједан АПИ кључ';

  @override
  String get adminUnknownApp => 'Непозната апликација';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Токен: $token\\nНаправљено: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Направи резервну копију';

  @override
  String get adminBackupDatabase => 'База података';

  @override
  String get adminBackupDatabaseAlways => 'Увек укључено';

  @override
  String get adminBackupMetadata => 'Метаподаци';

  @override
  String get adminBackupSubtitles => 'Титлови';

  @override
  String get adminBackupTrickplay => 'Слике за навигацију кроз видео';

  @override
  String get adminCreatingBackup => 'Прављење резервне копије...';

  @override
  String get adminBackupCreated => 'Резервна копија је успешно направљена';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Прављење резервне копије није успело: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Путања до резервне копије недостаје у одговору сервера';

  @override
  String adminBackupManifest(String name) {
    return 'Манифест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Учитавање манифеста није успело: $error';
  }

  @override
  String get adminConfirmRestore => 'Потврди враћање';

  @override
  String get adminRestoringBackup => 'Враћање резервне копије...';

  @override
  String adminRestoreFailed(String error) {
    return 'Враћање резервне копије није успело: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Учитавање резервних копија није успело';

  @override
  String get adminCreateBackup => 'Направи резервну копију';

  @override
  String get adminNoBackups => 'Није пронађена ниједна резервна копија';

  @override
  String get adminViewDetails => 'Прикажи детаље';

  @override
  String get restore => 'Врати';

  @override
  String get adminLogsLoadFailed => 'Учитавање евиденција сервера није успело';

  @override
  String get adminNoLogFiles => 'Нису пронађене датотеке евиденције';

  @override
  String get adminLogCopied => 'Евиденција је копирана у привремену меморију';

  @override
  String get adminSaveLogFile => 'Сачувај датотеку евиденције';

  @override
  String adminSavedTo(String path) {
    return 'Сачувано у $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Чување датотеке није успело: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Учитавање датотеке $fileName није успело';
  }

  @override
  String get adminSearchInLog => 'Претражи евиденцију';

  @override
  String get adminNoMatchingLines => 'Нема одговарајућих редова';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Учитавање задатака није успело: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Није пронађен ниједан заказани задатак';

  @override
  String get adminNoTasksMatchFilter =>
      'Ниједан задатак не одговара тренутном филтеру';

  @override
  String adminTaskStartFailed(String error) {
    return 'Покретање задатка није успело: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Заустављање задатка није успело: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Учитавање задатка није успело: $error';
  }

  @override
  String get adminRunNow => 'Покрени одмах';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Уклањање окидача није успело: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Додавање окидача није успело: $error';
  }

  @override
  String get adminLastExecution => 'Последње извршавање';

  @override
  String get adminTriggers => 'Окидачи';

  @override
  String get adminAddTrigger => 'Додај окидач';

  @override
  String get adminNoTriggers => 'Ниједан окидач није подешен';

  @override
  String get adminTriggerType => 'Тип окидача';

  @override
  String get adminNoLimit => 'Без ограничења';

  @override
  String adminHours(String hours) {
    return '$hours ч.';
  }

  @override
  String get adminDayOfWeek => 'Дан у недељи';

  @override
  String get adminSearchPlugins => 'Претражи додатке...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Промена стања додатка није успела: $error';
  }

  @override
  String get adminUninstallPlugin => 'Деинсталирај додатак';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Да ли сте сигурни да желите да деинсталирате „$name“?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Деинсталација додатка није успела: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Инсталација пакета није успела: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Инсталација ажурирања није успела: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Учитавање додатака није успело: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Ниједан додатак не одговара претрази';

  @override
  String get adminNoPluginsInstalled => 'Ниједан додатак није инсталиран';

  @override
  String adminInstallUpdate(String version) {
    return 'Инсталирај ажурирање (в$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Учитавање каталога није успело: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'Ниједан пакет не одговара претрази';

  @override
  String get adminNoPackagesAvailable => 'Нема доступних пакета';

  @override
  String get adminExperimentalIntegration => 'Експериментална интеграција';

  @override
  String get adminExperimentalWarning =>
      'Интеграција подешавања додатака је и даље експериментална. Неке странице са подешавањима можда се неће исправно приказивати.';

  @override
  String get continueAction => 'Настави';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '„$name“ ће бити уклоњен након поновног покретања сервера';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Деинсталација није успела: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Ажурирање додатка „$name“ на в$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Учитавање додатка није успело: $error';
  }

  @override
  String get adminPluginNotFound => 'Додатак није пронађен';

  @override
  String adminPluginVersion(String version) {
    return 'Верзија $version';
  }

  @override
  String get adminEnablePlugin => 'Омогући додатак';

  @override
  String get adminPluginSettingsPage => 'Страница са подешавањима додатка';

  @override
  String get adminRevisionHistory => 'Историја ревизија';

  @override
  String get adminNoChangelog => 'Нема доступног дневника измена.';

  @override
  String get adminRemoveRepository => 'Уклони складиште';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Да ли сте сигурни да желите да уклоните „$name“?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Чување складишта није успело: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Учитавање складишта није успело: $error';
  }

  @override
  String get adminRepositoryNameHint => 'нпр. Џелифин Стејбл (Jellyfin Stable)';

  @override
  String get adminRepositoryUrl => 'УРЛ складишта';

  @override
  String get adminAddEntry => 'Додај ставку';

  @override
  String get adminInvalidUrl => 'Неважећи УРЛ';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Учитавање подешавања додатка није успело: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Није могуће отворити $uri';
  }

  @override
  String get adminOpenInBrowser => 'Отвори у прегледачу';

  @override
  String get adminOpenExternally => 'Отвори у спољној апликацији';

  @override
  String get adminGeneralSettings => 'Општа подешавања';

  @override
  String get adminServerName => 'Назив сервера';

  @override
  String get adminPreferredMetadataCountry => 'Жељена земља метаподатака';

  @override
  String get adminCachePath => 'Путања до кеша';

  @override
  String get adminMetadataPath => 'Путања до метаподатака';

  @override
  String get adminLibraryScanConcurrency => 'Паралелност скенирања библиотеке';

  @override
  String get adminParallelImageEncodingLimit =>
      'Ограничење паралелног кодирања слика';

  @override
  String get adminSlowResponseThreshold => 'Праг спорог одговора (мс)';

  @override
  String get adminBrandingLoadFailed =>
      'Учитавање подешавања брендирања није успело';

  @override
  String get adminLoginDisclaimer => 'Напомена при пријављивању';

  @override
  String get adminLoginDisclaimerHint =>
      'ХТМЛ који се приказује испод обрасца за пријављивање';

  @override
  String get adminCustomCss => 'Прилагођени ЦСС';

  @override
  String get adminCustomCssHint => 'Прилагођени ЦСС примењен на веб-интерфејс';

  @override
  String get adminEnableSplashScreen => 'Омогући уводни екран';

  @override
  String get adminStreamingLoadFailed =>
      'Учитавање подешавања стримовања није успело';

  @override
  String get adminStreamingDescription =>
      'Подесите глобална ограничења брзине протока за стримовање путем удаљених веза.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ограничење брзине протока за удаљене клијенте (Мб/с)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Оставите празно или унесите 0 за неограничено';

  @override
  String get adminPlaybackLoadFailed =>
      'Учитавање подешавања репродукције није успело';

  @override
  String get adminHardwareAcceleration => 'Хардверско убрзање';

  @override
  String get adminVaapiDevice => 'ВА-АПИ (VA-API) уређај';

  @override
  String get adminEnableHardwareEncoding => 'Омогући хардверско кодирање';

  @override
  String get adminEnableHardwareDecoding => 'Омогући хардверско декодирање за:';

  @override
  String get adminEncodingThreads => 'Нити кодирања';

  @override
  String get adminAutomatic => '0 = аутоматски';

  @override
  String get adminTranscodingTempPath =>
      'Путања до привремене фасцикле за транскодирање';

  @override
  String get adminEnableFallbackFont => 'Омогући резервни фонт';

  @override
  String get adminFallbackFontPath => 'Путања до резервног фонта';

  @override
  String get adminAllowSegmentDeletion => 'Дозволи брисање сегмената';

  @override
  String get adminSegmentKeepSeconds => 'Време задржавања сегмента (секунде)';

  @override
  String get adminThrottleBuffering => 'Ограничи баферовање';

  @override
  String get adminTrickplayLoadFailed =>
      'Учитавање подешавања слика за навигацију кроз видео није успело';

  @override
  String get adminEnableHardwareAcceleration => 'Омогући хардверско убрзање';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Омогући издвајање само кључних кадрова';

  @override
  String get adminKeyFrameSubtitle => 'Брже, али мање прецизно';

  @override
  String get adminScanBehavior => 'Понашање скенирања';

  @override
  String get adminProcessPriority => 'Приоритет процеса';

  @override
  String get adminImageSettings => 'Подешавања слика';

  @override
  String get adminIntervalMs => 'Интервал (мс)';

  @override
  String get adminCaptureFrameSubtitle => 'Учесталост снимања кадрова';

  @override
  String get adminWidthResolutions => 'Резолуције ширине';

  @override
  String get adminTileWidth => 'Ширина плочице';

  @override
  String get adminTileHeight => 'Висина плочице';

  @override
  String get adminQualitySubtitle =>
      'Мање вредности = бољи квалитет, веће датотеке';

  @override
  String get adminProcessThreads => 'Нити процеса';

  @override
  String get adminResumeLoadFailed =>
      'Учитавање подешавања наставка репродукције није успело';

  @override
  String get adminResumeDescription =>
      'Подесите када садржај треба означити као делимично или у потпуности репродукован.';

  @override
  String get adminMinResumePercentage => 'Минимални проценат за наставак';

  @override
  String get adminMinResumeSubtitle =>
      'Садржај мора бити репродукован преко овог процента да би се напредак сачувао';

  @override
  String get adminMaxResumePercentage => 'Максимални проценат за наставак';

  @override
  String get adminMaxResumeSubtitle =>
      'Садржај се сматра репродукованим у целости када пређе овај проценат';

  @override
  String get adminMinResumeDuration =>
      'Минимално трајање за наставак (секунде)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'За ставке краће од овог трајања није могуће наставити репродукцију';

  @override
  String get adminMinAudiobookResume =>
      'Минимални проценат за наставак аудио-књиге';

  @override
  String get adminMaxAudiobookResume =>
      'Максимални проценат за наставак аудио-књиге';

  @override
  String get adminNetworkingLoadFailed =>
      'Учитавање мрежних подешавања није успело';

  @override
  String get adminNetworkingWarning =>
      'Измене мрежних подешавања могу захтевати поновно покретање сервера.';

  @override
  String get adminEnableRemoteAccess => 'Омогући удаљени приступ';

  @override
  String get ports => 'Портови';

  @override
  String get adminHttpPort => 'ХТТП порт';

  @override
  String get adminHttpsPort => 'ХТТПС порт';

  @override
  String get adminPublicHttpsPort => 'Јавни ХТТПС порт';

  @override
  String get adminBaseUrl => 'Основни УРЛ';

  @override
  String get adminBaseUrlHint => 'нпр. /jellyfin';

  @override
  String get https => 'ХТТПС';

  @override
  String get adminEnableHttps => 'Омогући ХТТПС';

  @override
  String get adminLocalNetwork => 'Локална мрежа';

  @override
  String get adminLocalNetworkAddresses => 'Адресе локалне мреже';

  @override
  String get adminKnownProxies => 'Познати посреднички сервери';

  @override
  String get adminRemoteIpFilter => 'Филтер удаљених ИП адреса';

  @override
  String get adminRemoteIpFilterEntries => 'Филтер удаљених ИП адреса';

  @override
  String get adminCertificatePath => 'Путања до сертификата';

  @override
  String get whitelist => 'Бела листа';

  @override
  String get blacklist => 'Црна листа';

  @override
  String get notSet => 'Није постављено';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Учитавање метаподатака није успело: $error';
  }

  @override
  String get adminRefreshMetadata => 'Освежи метаподатке';

  @override
  String get recursive => 'Рекурзивно';

  @override
  String get adminReplaceAllMetadata => 'Замени све метаподатке';

  @override
  String get adminMetadataRefreshRequested =>
      'Затражено је освежавање метаподатака';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Освежавање метаподатака није успело: $error';
  }

  @override
  String get adminNoRemoteMatches =>
      'Нису пронађени подударни резултати на удаљеним изворима';

  @override
  String get adminRemoteResults => 'Резултати са удаљених извора';

  @override
  String get adminRemoteMetadataApplied =>
      'Примењени су метаподаци са удаљеног извора';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Претрага удаљених извора није успела: $error';
  }

  @override
  String get adminUpdateContentType => 'Ажурирај тип садржаја';

  @override
  String get adminContentType => 'Тип садржаја';

  @override
  String get adminContentTypeUpdated => 'Тип садржаја је ажуриран';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Ажурирање типа садржаја није успело: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Учитавање уређивача метаподатака није успело';

  @override
  String get adminNoPeopleEntries => 'Нема уноса о особама';

  @override
  String get adminNoExternalIds => 'Нема доступних спољних идентификатора';

  @override
  String adminImageUpdated(String imageType) {
    return 'Слика типа „$imageType“ је ажурирана';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Преузимање слике није успело: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Формат слике није подржан';

  @override
  String get adminImageReadFailed => 'Читање изабране слике није успело';

  @override
  String adminImageUploaded(String imageType) {
    return 'Слика типа „$imageType“ је отпремљена';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Отпремање слике није успело: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Обриши слику типа „$imageType“';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Слика типа „$imageType“ је обрисана';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Брисање слике није успело: $error';
  }

  @override
  String get adminAllProviders => 'Сви добављачи';

  @override
  String get adminNoRemoteImages => 'Нису пронађене слике на удаљеним изворима';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Откривање тјунера није успело: $error';
  }

  @override
  String get adminTunerTypeM3u => 'М3У тјунер';

  @override
  String get adminTunerTypeHdHomerun => 'ХДХоумРан (HDHomeRun)';

  @override
  String get adminTunerFileOrUrl => 'Датотека или УРЛ';

  @override
  String get adminTunerIpAddress => 'ИП адреса тјунера';

  @override
  String get adminTunerFriendlyName => 'Приказно име';

  @override
  String get adminTunerUserAgent => 'Кориснички агент';

  @override
  String get adminTunerCount => 'Ограничење истовремених веза';

  @override
  String get adminTunerCountHelp =>
      'Највећи број стримова које тјунер може истовремено да испоручује. Поставите на 0 за неограничен број.';

  @override
  String get adminTunerFallbackBitrate =>
      'Резервно ограничење брзине протока за стримовање';

  @override
  String get adminTunerImportFavoritesOnly => 'Увези само омиљене канале';

  @override
  String get adminTunerAllowHwTranscoding => 'Дозволи хардверско транскодирање';

  @override
  String get adminTunerAllowFmp4 =>
      'Дозволи фМП4 (fMP4) контејнер за транскодирање';

  @override
  String get adminTunerAllowStreamSharing => 'Дозволи дељење стримова';

  @override
  String get adminTunerEnableStreamLooping => 'Омогући понављање стрима';

  @override
  String get adminTunerIgnoreDts => 'Занемари ДТС (DTS)';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Читај улазни ток изворном брзином кадрова';

  @override
  String get adminProviderXmltv => 'Икс-ем-ел-ти-ви (XMLTV)';

  @override
  String get adminProviderSchedulesDirect =>
      'Шедјулс Дајрект (Schedules Direct)';

  @override
  String get adminXmltvPath => 'Датотека или УРЛ';

  @override
  String get adminXmltvMoviePrefix => 'Префикс филмова';

  @override
  String get adminXmltvMovieCategories => 'Категорије филмова';

  @override
  String get adminXmltvCategoriesHelp =>
      'Раздвојите више категорија усправном цртом.';

  @override
  String get adminXmltvKidsCategories => 'Дечје категорије';

  @override
  String get adminXmltvNewsCategories => 'Категорије вести';

  @override
  String get adminXmltvSportsCategories => 'Категорије спорта';

  @override
  String get adminSdUsername => 'Корисничко име';

  @override
  String get adminSdPassword => 'Лозинка';

  @override
  String get adminSdCountry => 'Земља';

  @override
  String get adminSdCountrySelect => 'Изаберите земљу';

  @override
  String get adminSdPostalCode => 'Поштански број';

  @override
  String get adminEnableAllTuners => 'Омогући све тјунере';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Уклањање тјунера није успело: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Уклањање добављача није успело: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Путања за снимање серија';

  @override
  String get adminMovieRecordingPath => 'Путања за снимање филмова';

  @override
  String get adminGuideDaysAuto => 'Аутоматски';

  @override
  String get adminRecordingPostProcessor =>
      'Путања до апликације за накнадну обраду';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Аргументи апликације за накнадну обраду';

  @override
  String get adminSaveRecordingNfo => 'Сачувај НФО (NFO) метаподатке снимка';

  @override
  String get adminSaveRecordingImages => 'Сачувај слике снимка';

  @override
  String get adminLiveTvSectionPaths => 'Путање за снимање';

  @override
  String get adminLiveTvSectionPostProcessing => 'Накнадна обрада';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Чување подешавања није успело: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Учитавање администрације ТВ-а уживо није успело';

  @override
  String get adminTunerDevices => 'Тјунерски уређаји';

  @override
  String get adminNoTunerHosts => 'Није конфигурисан ниједан тјунерски домаћин';

  @override
  String get adminGuideProviders => 'Пружаоци ТВ водича';

  @override
  String get adminGuideRefreshStarted =>
      'Освежавање података ТВ водича је започето';

  @override
  String get adminGuideRefreshUnavailable =>
      'Задатак за освежавање ТВ водича није доступан на овом серверу.';

  @override
  String get adminNoListingProviders =>
      'Није конфигурисан ниједан пружалац ТВ програма';

  @override
  String get adminSettingsSaved => 'Подешавања су сачувана';

  @override
  String get adminBackupsNotAvailable =>
      'Резервне копије нису доступне у овој верзији сервера.';

  @override
  String get adminRestoreWarning1 =>
      'Враћањем резервне копије СВИ тренутни подаци сервера биће замењени подацима из резервне копије.';

  @override
  String get adminRestoreWarning2 =>
      'Тренутна подешавања сервера, корисници и подаци библиотеке биће преписани.';

  @override
  String get adminRestoreWarning3 =>
      'Сервер ће се поново покренути након враћања резервне копије.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Желите ли сада да вратите резервну копију $name?';
  }

  @override
  String get adminBackupsTitle => 'Резервне копије';

  @override
  String get adminUnknownDate => 'Непознат датум';

  @override
  String get adminUnnamedBackup => 'Неименована резервна копија';

  @override
  String get adminApply => 'Примени';

  @override
  String get adminLogsTitle => 'Дневници сервера';

  @override
  String get adminLogsNewestFirst => 'Најновије прво';

  @override
  String get adminLogsOldestFirst => 'Најстарије прво';

  @override
  String get adminLogsJustNow => 'Управо сада';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'Пре $minutes мин';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'Пре $hours ч';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'Пре $days д';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Учитавање датотеке $fileName није успело';
  }

  @override
  String adminLogViewerMatches(int count) {
    return 'Подударања: $count';
  }

  @override
  String get adminLogViewerNoMatches => 'Нема редова који се подударају';

  @override
  String get adminMetadataEditorTitle => 'Уређивач метаподатака';

  @override
  String get adminMetadataIdentify => 'Идентификуј';

  @override
  String get adminMetadataType => 'Тип';

  @override
  String get adminMetadataDetails => 'Детаљи';

  @override
  String get adminMetadataExternalIds => 'Спољни идентификатори';

  @override
  String get adminMetadataImages => 'Слике';

  @override
  String get adminMetadataFieldTitle => 'Наслов';

  @override
  String get adminMetadataFieldSortTitle => 'Наслов за сортирање';

  @override
  String get adminMetadataFieldOriginalTitle => 'Оригинални наслов';

  @override
  String get adminMetadataFieldPremiereDate => 'Датум премијере (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldEndDate => 'Датум завршетка (ГГГГ-ММ-ДД)';

  @override
  String get adminMetadataFieldProductionYear => 'Година производње';

  @override
  String get adminMetadataFieldOfficialRating => 'Званична оцена';

  @override
  String get adminMetadataFieldCommunityRating => 'Оцена заједнице';

  @override
  String get adminMetadataFieldCriticRating => 'Оцена критичара';

  @override
  String get adminMetadataFieldCustomRating => 'Прилагођена оцена';

  @override
  String get adminMetadataFieldTagline => 'Слоган';

  @override
  String get adminMetadataFieldOverview => 'Садржај';

  @override
  String get adminMetadataFieldDisplayOrder => 'Редослед приказа';

  @override
  String get adminMetadataDisplayOrderAired => 'Према емитовању';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate =>
      'Према датуму првог емитовања';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Апсолутни';

  @override
  String get adminMetadataDisplayOrderDvd => 'ДВД';

  @override
  String get adminMetadataDisplayOrderDigital => 'Дигитални';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Према наративном луку';

  @override
  String get adminMetadataDisplayOrderProduction => 'Према продукцији';

  @override
  String get adminMetadataDisplayOrderTv => 'ТВ';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Алтернативни';

  @override
  String get adminMetadataDisplayOrderRegional => 'Регионални';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'Алтернативни ДВД';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Према датуму измене';

  @override
  String get adminMetadataDisplayOrderSortName => 'Према називу за сортирање';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Према датуму објављивања';

  @override
  String get adminMetadataSettings => 'Подешавања метаподатака';

  @override
  String get adminMetadataDownloadLanguage => 'Жељени језик преузимања';

  @override
  String get adminMetadataCountryRegion => 'Земља/регион';

  @override
  String get adminMetadataInheritHelp =>
      'Оставите подразумевану вредност да бисте наследили подешавање од надређене ставке или подразумевано подешавање сервера.';

  @override
  String get adminMetadataField3DFormat => '3Д формат';

  @override
  String get adminMetadataPersonKindActor => 'Глумац';

  @override
  String get adminMetadataPersonKindDirector => 'Редитељ';

  @override
  String get adminMetadataPersonKindComposer => 'Композитор';

  @override
  String get adminMetadataPersonKindWriter => 'Писац';

  @override
  String get adminMetadataPersonKindGuestStar => 'Гостујућа звезда';

  @override
  String get adminMetadataPersonKindProducer => 'Продуцент';

  @override
  String get adminMetadataPersonKindConductor => 'Диригент';

  @override
  String get adminMetadataPersonKindLyricist => 'Текстописац';

  @override
  String get adminMetadataPersonKindArranger => 'Аранжер';

  @override
  String get adminMetadataPersonKindEngineer => 'Инжењер';

  @override
  String get adminMetadataPersonKindMixer => 'Миксер';

  @override
  String get adminMetadataPersonKindRemixer => 'Ремиксер';

  @override
  String get adminMetadataPersonKindCreator => 'Творац';

  @override
  String get adminMetadataPersonKindArtist => 'Уметник';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Извођач албума';

  @override
  String get adminMetadataPersonKindAuthor => 'Аутор';

  @override
  String get adminMetadataPersonKindIllustrator => 'Илустратор';

  @override
  String get adminMetadataPersonKindPenciller => 'Цртач оловком';

  @override
  String get adminMetadataPersonKindInker => 'Тушер';

  @override
  String get adminMetadataPersonKindColorist => 'Колориста';

  @override
  String get adminMetadataPersonKindLetterer => 'Аутор текста у стрипу';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Аутор омота';

  @override
  String get adminMetadataPersonKindEditor => 'Уредник';

  @override
  String get adminMetadataPersonKindTranslator => 'Преводилац';

  @override
  String get adminMetadataPersonKindNarrator => 'Наратор';

  @override
  String get adminMetadataAirDays => 'Дани емитовања';

  @override
  String get adminMetadataLockItem =>
      'Закључај ову ставку да би се спречиле будуће измене метаподатака';

  @override
  String get adminMetadataEnabledFields => 'Омогућена поља';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Опозовите избор поља да бисте га закључали и спречили измену његових података.';

  @override
  String get adminMetadataLockFieldName => 'Назив';

  @override
  String get adminMetadataLockFieldOverview => 'Садржај';

  @override
  String get adminMetadataLockFieldGenres => 'Жанрови';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Родитељска оцена';

  @override
  String get adminMetadataLockFieldCast => 'Особе';

  @override
  String get adminMetadataLockFieldProductionLocations => 'Локације продукције';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Место рођења';

  @override
  String get adminMetadataLockFieldRuntime => 'Трајање';

  @override
  String get adminMetadataLockFieldStudios => 'Студији';

  @override
  String get adminMetadataLockFieldTags => 'Ознаке';

  @override
  String get adminMetadataGenres => 'Жанрови';

  @override
  String get adminMetadataTags => 'Ознаке';

  @override
  String get adminMetadataStudios => 'Студији';

  @override
  String get adminMetadataPeople => 'Особе';

  @override
  String get adminMetadataAddGenre => 'Додај жанр';

  @override
  String get adminMetadataAddTag => 'Додај ознаку';

  @override
  String get adminMetadataAddStudio => 'Додај студио';

  @override
  String get adminMetadataAddPerson => 'Додај особу';

  @override
  String get adminMetadataEditPerson => 'Уреди особу';

  @override
  String get adminMetadataRole => 'Улога';

  @override
  String get adminMetadataImagePrimary => 'Главна';

  @override
  String get adminMetadataImageBackdrop => 'Позадинска слика';

  @override
  String get adminMetadataImageLogo => 'Лого';

  @override
  String get adminMetadataImageBanner => 'Банер';

  @override
  String get adminMetadataImageThumb => 'Сличица';

  @override
  String get adminMetadataProvider => 'Добављач';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Слика типа $imageType је ажурирана';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Слика типа $imageType је отпремљена';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Слика типа $imageType је обрисана';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Преузимање слике није успело: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Читање изабране слике није успело';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Отпремање слике није успело: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Обриши слику типа $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Овим се уклања тренутна слика са ставке.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Брисање слике није успело: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Изабери слику типа $imageType';
  }

  @override
  String get adminMetadataUpload => 'Отпреми';

  @override
  String get adminMetadataUpdate => 'Ажурирај';

  @override
  String get adminMetadataRemoteImage => 'Удаљена слика';

  @override
  String get adminPluginsInstalled => 'Инсталирани';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Активни';

  @override
  String get adminPluginsRestart => 'Поново покрени';

  @override
  String get adminPluginsRestartRequired => 'Потребно је поновно покретање';

  @override
  String get adminPluginsNoSearchResults =>
      'Ниједан додатак не одговара вашој претрази';

  @override
  String get adminPluginsNoneInstalled => 'Нема инсталираних додатака';

  @override
  String get adminPluginsNoneActive => 'Нема активних додатака';

  @override
  String get adminPluginsNoneRequireRestart =>
      'Ниједан додатак не захтева поновно покретање сервера';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Доступно је ажурирање: в$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Доступно је ажурирање';

  @override
  String get adminPluginsPendingRemoval =>
      'Чека уклањање након поновног покретања';

  @override
  String get adminPluginsChangesPending => 'Измене чекају поновно покретање';

  @override
  String get adminPluginsEnable => 'Омогући';

  @override
  String get adminPluginsDisable => 'Онемогући';

  @override
  String get adminPluginsInstallUpdate => 'Инсталирај ажурирање';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Инсталирај ажурирање (в$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ниједан пакет не одговара вашој претрази';

  @override
  String get adminPluginsCatalogEmpty => 'Нема доступних пакета';

  @override
  String adminPluginsInstalling(String name) {
    return 'Инсталација пакета „$name“ је у току...';
  }

  @override
  String get adminPluginDetailExperimental => 'Експериментална интеграција';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Интеграција подешавања додатака је и даље експериментална. Нека поља или распореди можда се још неће исправно приказивати.';

  @override
  String get adminPluginDetailToggle404 =>
      'Промена стања додатка није успела. Сервер није могао да пронађе ову верзију додатка. Освежите листу додатака, па покушајте поново.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Промена стања додатка није успела. За детаље погледајте дневнике сервера.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Подешавања: $name';
  }

  @override
  String get adminPluginDetailDetails => 'Детаљи';

  @override
  String get adminPluginDetailDeveloper => 'Програмер';

  @override
  String get adminPluginDetailRepository => 'Репозиторијум';

  @override
  String get adminPluginDetailBundled => 'Укључен у пакет';

  @override
  String get adminPluginDetailEnablePlugin => 'Омогући додатак';

  @override
  String get adminPluginDetailRestartRequired =>
      'Да би измене ступиле на снагу, потребно је поново покренути сервер.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Овај додатак биће уклоњен након поновног покретања сервера.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Дошло је до квара овог додатка и можда неће исправно радити.';

  @override
  String get adminPluginDetailNotSupported =>
      'Тренутна верзија сервера не подржава овај додатак.';

  @override
  String get adminPluginDetailSuperseded =>
      'Овај додатак је замењен новијом верзијом.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Учитавање репозиторијума није успело: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Уклони репозиторијум';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Желите ли заиста да уклоните „$name“?';
  }

  @override
  String get adminReposRemove => 'Уклони';

  @override
  String adminReposSaveFailed(String error) {
    return 'Чување репозиторијума није успело: $error';
  }

  @override
  String get adminReposEmpty => 'Ниједан репозиторијум није конфигурисан';

  @override
  String get adminReposEmptySubtitle =>
      'Додајте репозиторијум да бисте прегледали доступне додатке';

  @override
  String get adminReposUnnamed => '(без назива)';

  @override
  String get adminReposEditTitle => 'Уреди репозиторијум';

  @override
  String get adminReposAddTitle => 'Додај репозиторијум';

  @override
  String get adminReposUrl => 'УРЛ репозиторијума';

  @override
  String get adminReposNameHint => 'нпр. Џелифин стабилна верзија';

  @override
  String get adminPluginSettingsInvalidUrl => 'Неважећи УРЛ';

  @override
  String get adminGeneralSettingsTitle => 'Општа подешавања';

  @override
  String get adminGeneralMetadataLanguage => 'Жељени језик метаподатака';

  @override
  String get adminGeneralMetadataLanguageHint => 'нпр. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Жељена земља за метаподатке';

  @override
  String get adminGeneralMetadataCountryHint => 'нпр. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Паралелност скенирања библиотеке';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Ограничење паралелног кодирања слика';

  @override
  String get adminUnknownError => 'Непозната грешка';

  @override
  String get adminBrowse => 'Прегледај';

  @override
  String get adminCloseBrowser => 'Затвори прегледач';

  @override
  String get adminNetworkingTitle => 'Мрежа';

  @override
  String get adminNetworkingRestartWarning =>
      'Промене мрежних подешавања могу захтевати поновно покретање сервера.';

  @override
  String get adminNetworkingEnableHttps => 'Омогући ХТТПС';

  @override
  String get adminNetworkingAddressHint => 'нпр. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Познати проксији';

  @override
  String get adminNetworkingProxyHint => 'нпр. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Листа дозвољених';

  @override
  String get adminNetworkingBlacklist => 'Листа забрањених';

  @override
  String get adminNetworkingAddEntry => 'Додај ставку';

  @override
  String get adminBrandingTitle => 'Брендирање';

  @override
  String get adminBrandingLoginDisclaimer => 'Напомена при пријављивању';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'ХТМЛ који се приказује испод обрасца за пријаву';

  @override
  String get adminBrandingCustomCss => 'Прилагођени ЦСС';

  @override
  String get adminBrandingCustomCssHint =>
      'Прилагођени ЦСС који се примењује на веб-интерфејс';

  @override
  String get adminBrandingEnableSplash => 'Омогући уводни екран';

  @override
  String get adminBrandingSplashUpload => 'Отпреми слику';

  @override
  String get adminBrandingSplashUploaded => 'Уводни екран је ажуриран';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Отпремање уводног екрана није успело';

  @override
  String get adminBrandingSplashDeleted => 'Уводни екран је уклоњен';

  @override
  String get adminBrandingNoSplash => 'Нема прилагођеног уводног екрана';

  @override
  String get adminPlaybackHwAccel => 'Хардверско убрзање';

  @override
  String get adminPlaybackHwAccelLabel => 'Хардверско убрзање';

  @override
  String get adminPlaybackEnableHwEncoding => 'Омогући хардверско кодирање';

  @override
  String get adminPlaybackQsvDevice => 'Квик синк видео уређај';

  @override
  String get adminPlaybackEnhancedNvdec => 'Омогући побољшани декодер НВДЕК';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Дај предност изворном системском хардверском декодеру';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Десетобитно декодирање ХЕВЦ-а';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Десетобитно декодирање ВП9';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Декодирање ХЕВЦ РЕкст од 8/10 бита';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Декодирање ХЕВЦ РЕкст од 12 бита';

  @override
  String get adminPlaybackHwEncodingSection => 'Хардверско кодирање';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Дозволи ХЕВЦ кодирање';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Дозволи АВ1 кодирање';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Омогући Интелов Х.264 кодер мале потрошње';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Омогући Интелов ХЕВЦ кодер мале потрошње';

  @override
  String get adminPlaybackToneMapping => 'Мапирање тонова';

  @override
  String get adminPlaybackEnableTonemapping => 'Омогући мапирање тонова';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Омогући ВПП мапирање тонова';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Омогући мапирање тонова у Видео тулбоксу';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Алгоритам мапирања тонова';

  @override
  String get adminPlaybackTonemappingMode => 'Режим мапирања тонова';

  @override
  String get adminPlaybackTonemappingRange => 'Опсег мапирања тонова';

  @override
  String get adminPlaybackTonemappingDesat => 'Дезасићење при мапирању тонова';

  @override
  String get adminPlaybackTonemappingPeak => 'Вршна вредност мапирања тонова';

  @override
  String get adminPlaybackTonemappingParam => 'Параметар мапирања тонова';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Осветљеност ВПП мапирања тонова';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Контраст ВПП мапирања тонова';

  @override
  String get adminPlaybackEncoderPreset =>
      'Унапред подешена конфигурација кодера';

  @override
  String get adminPlaybackH264Crf => 'ЦРФ вредност Х.264 кодирања';

  @override
  String get adminPlaybackH265Crf => 'ЦРФ вредност Х.265 (ХЕВЦ) кодирања';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Метод уклањања испреплетености';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Удвостручи број кадрова у секунди приликом уклањања испреплетености';

  @override
  String get adminPlaybackAudioSection => 'Звук';

  @override
  String get adminPlaybackEnableAudioVbr => 'Омогући ВБР кодирање звука';

  @override
  String get adminPlaybackDownmixBoost => 'Појачање при свођењу звучног микса';

  @override
  String get adminPlaybackDownmixAlgorithm =>
      'Алгоритам свођења звука на стерео';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Највећа величина реда за мултиплексирање';

  @override
  String get adminPlaybackAutoOption => 'Аутоматски';

  @override
  String get adminPlaybackEncoding => 'Кодирање';

  @override
  String get adminPlaybackEncodingThreads => 'Нити за кодирање';

  @override
  String get adminPlaybackFallbackFont => 'Омогући резервни фонт';

  @override
  String get adminPlaybackFallbackFontPath => 'Путања до резервног фонта';

  @override
  String get adminPlaybackStreaming => 'Стримовање';

  @override
  String get adminResumeVideo => 'Видео';

  @override
  String get adminResumeAudiobooks => 'Аудио-књиге';

  @override
  String get adminStreamingBitrateLimit =>
      'Ограничење брзине протока за удаљене клијенте (Мбпс)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Оставите празно или унесите 0 за неограничену вредност';

  @override
  String get adminTrickplayHwAccel => 'Омогући хардверско убрзање';

  @override
  String get adminTrickplayHwEncoding => 'Омогући хардверско кодирање';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Омогући издвајање само кључних кадрова';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'Брже, али мање прецизно';

  @override
  String get adminTrickplayNonBlocking => 'Без блокирања';

  @override
  String get adminTrickplayBlocking => 'Блокирање';

  @override
  String get adminTrickplayPriorityHigh => 'Висок';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Изнад нормалног';

  @override
  String get adminTrickplayPriorityNormal => 'Нормалан';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Испод нормалног';

  @override
  String get adminTrickplayPriorityIdle => 'Неактиван';

  @override
  String get adminTrickplayImageSettings => 'Подешавања слике';

  @override
  String get adminTrickplayInterval => 'Интервал (мс)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Колико често се снимају кадрови';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Ширине у пикселима раздвојене зарезима (нпр. 320)';

  @override
  String get adminTrickplayQuality => 'Квалитет';

  @override
  String get adminTrickplayQScale => 'Скала квалитета';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Мање вредности = бољи квалитет, веће датотеке';

  @override
  String get adminTrickplayJpegQuality => 'Квалитет ЈПЕГ-а (JPEG)';

  @override
  String get adminTrickplayProcessing => 'Обрада';

  @override
  String get adminTasksEmpty => 'Нема заказаних задатака';

  @override
  String get adminTasksNoFilterMatch =>
      'Ниједан задатак не одговара тренутном филтеру';

  @override
  String get adminTaskCancelling => 'Отказивање...';

  @override
  String get adminTaskRunning => 'Извршавање...';

  @override
  String get adminTaskNeverRun => 'Никада није покренут';

  @override
  String get adminTaskStop => 'Заустави';

  @override
  String get adminRunningTasks => 'Задаци у току';

  @override
  String get adminTaskRun => 'Покрени';

  @override
  String get adminTaskDetailLastExecution => 'Последње извршавање';

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
    return 'Сваког дана у $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Сваке недеље, $day у $time';
  }

  @override
  String get adminTaskTriggerStartup => 'При покретању апликације';

  @override
  String get adminTaskTriggerTypeDaily => 'Дневно';

  @override
  String get adminTaskTriggerTypeWeekly => 'Недељно';

  @override
  String get adminTaskTriggerTypeInterval => 'У интервалима';

  @override
  String get adminTaskTriggerIntervalLabel => 'Интервал';

  @override
  String get adminTaskTriggerEveryHour => 'Сваког сата';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сати',
      few: '$count сата',
      one: '1 сат',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Време';

  @override
  String get adminActivityJustNow => 'Управо сада';

  @override
  String get adminActivityLastHour => 'У последњих сат времена';

  @override
  String get adminActivityToday => 'Данас';

  @override
  String get adminActivityYesterday => 'Јуче';

  @override
  String get adminActivityOlder => 'Раније';

  @override
  String adminActivityDaysAgo(int days) {
    return 'Пре $days д';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'Пре $hours ч';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'Пре $minutes мин';
  }

  @override
  String get adminActivityNow => 'сада';

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
    return '$days д';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'Подесите генерисање сличица за преглед при премотавању.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Јавни ХТТПС порт';

  @override
  String get adminNetworkingBaseUrl => 'Основна УРЛ адреса';

  @override
  String get adminNetworkingBaseUrlHint => 'нпр. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Јавни ХТТП порт';

  @override
  String get adminNetworkingRequireHttps => 'Захтевај ХТТПС';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Преусмери све удаљене захтеве на ХТТПС. Нема ефекта ако сервер нема важећи сертификат.';

  @override
  String get adminNetworkingCertPassword => 'Лозинка сертификата';

  @override
  String get adminNetworkingEnableIpv4 => 'Омогући ИПв4';

  @override
  String get adminNetworkingEnableIpv6 => 'Омогући ИПв6';

  @override
  String get adminNetworkingLocalSubnets => 'Локалне мреже';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Филтер удаљених ИП адреса';

  @override
  String get adminPlaybackVaapiDevice => 'ВА-АПИ уређај (VA-API)';

  @override
  String get adminPlaybackAutomatic => '0 = аутоматски';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Путања до привремених датотека за транскодирање';

  @override
  String get adminPlaybackSegmentDeletion => 'Дозволи брисање сегмената';

  @override
  String get adminPlaybackSegmentKeep => 'Задржавање сегмената (секунде)';

  @override
  String get adminPlaybackThrottleBuffering => 'Ограничи баферовање';

  @override
  String get adminPlaybackThrottleDelay => 'Кашњење ограничења (секунде)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Дозволи издвајање титлова у ходу';

  @override
  String get adminResumeMinPct => 'Најмањи проценат за наставак';

  @override
  String get adminResumeMinPctSubtitle =>
      'Садржај мора бити репродукован преко овог процента да би се сачувао напредак';

  @override
  String get adminResumeMaxPct => 'Највећи проценат за наставак';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Садржај се сматра потпуно репродукованим након овог процента';

  @override
  String get adminResumeMinDuration => 'Најкраће трајање за наставак (секунде)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Репродукција ставки краћих од овога не може да се настави';

  @override
  String get adminTrickplayScanBehavior => 'Понашање скенирања';

  @override
  String get adminTrickplayProcessPriority => 'Приоритет процеса';

  @override
  String get adminTrickplayTileWidth => 'Ширина плочице';

  @override
  String get adminTrickplayTileHeight => 'Висина плочице';

  @override
  String get adminTrickplayProcessThreads => 'Нити процеса';

  @override
  String get adminTrickplayWidthResolutions => 'Резолуције ширине';

  @override
  String get adminMetadataDefault => 'Подразумевано';

  @override
  String get adminMetadataContentTypeUpdated => 'Тип садржаја је ажуриран';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Ажурирање типа садржаја није успело: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Праг спорог одзива (мс)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Омогући упозорења о спором одзиву';

  @override
  String get adminGeneralQuickConnect => 'Омогући Брзо повезивање';

  @override
  String get adminGeneralSectionServer => 'Сервер';

  @override
  String get adminGeneralSectionMetadata => 'Метаподаци';

  @override
  String get adminGeneralSectionPaths => 'Путање';

  @override
  String get adminGeneralSectionPerformance => 'Перформансе';

  @override
  String get adminGeneralCachePath => 'Путања до кеша';

  @override
  String get adminGeneralMetadataPath => 'Путања до метаподатака';

  @override
  String get adminGeneralServerName => 'Назив сервера';

  @override
  String get adminGeneralDisplayLanguage => 'Жељени језик приказа';

  @override
  String get adminSettingsLoadFailed => 'Учитавање подешавања није успело';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Ажурирање мапирања није успело: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Временско ограничење: $duration';
  }

  @override
  String get folders => 'Фасцикле';

  @override
  String get libraries => 'Библиотеке';

  @override
  String get syncPlay => 'Синхронизована репродукција';

  @override
  String get syncPlayDisabledTitle =>
      'Синхронизована репродукција је онемогућена';

  @override
  String get syncPlayDisabledMessage =>
      'Омогућите синхронизовану репродукцију у подешавањима да бисте је користили.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сервер није подржан';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'За синхронизовану репродукцију је потребан Џелифин сервер (Jellyfin). Тренутни сервер је не подржава.';

  @override
  String get syncPlayGroupFallbackName =>
      'Група за синхронизовану репродукцију';

  @override
  String get syncPlayGroupTooltip => 'Група за синхронизовану репродукцију';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# учесника',
      few: '# учесника',
      one: '# учесник',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Занемари чекање';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Не задржавај групу док се садржај баферује на овом уређају';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Настави локално без чекања споријих чланова';

  @override
  String get syncPlayRepeat => 'Понављање';

  @override
  String get syncPlayRepeatOne => 'Једна ставка';

  @override
  String get syncPlayShuffleModeShuffled => 'Насумичним редоследом';

  @override
  String get syncPlayShuffleModeSorted => 'По реду';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Синхронизуј тренутни ред за репродукцију';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Замени групни ред тренутним локалним редом за репродукцију';

  @override
  String get syncPlayLeaveGroup => 'Напусти групу';

  @override
  String get syncPlayGroupQueue => 'Групни ред за репродукцију';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Ставка $index';
  }

  @override
  String get syncPlayPlayNow => 'Пусти сада';

  @override
  String get syncPlayCreateNewGroup => 'Направи нову групу';

  @override
  String get syncPlayGroupName => 'Назив групе';

  @override
  String get syncPlayDefaultGroupName =>
      'Моја група за синхронизовану репродукцију';

  @override
  String get syncPlayCreateGroup => 'Направи групу';

  @override
  String get syncPlayAvailableGroups => 'Доступне групе';

  @override
  String get syncPlayNoGroupsAvailable => 'Нема доступних група';

  @override
  String get syncPlayJoinGroupQuestion =>
      'Придружити се групи за синхронизовану репродукцију?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Придруживање групи за синхронизовану репродукцију може заменити ваш тренутни ред за репродукцију. Желите ли да наставите?';

  @override
  String get syncPlayJoin => 'Придружи се';

  @override
  String get syncPlayStateIdle => 'Неактивно';

  @override
  String get syncPlayStateWaiting => 'Чекање';

  @override
  String get syncPlayStatePaused => 'Паузирано';

  @override
  String get syncPlayStatePlaying => 'Репродукција';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName се придружио групи за синхронизовану репродукцију';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName је напустио групу за синхронизовану репродукцију';
  }

  @override
  String get syncPlayAccessDeniedTitle =>
      'Приступ синхронизованој репродукцији је одбијен';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Немате приступ једној или више ставки у овој групи за синхронизовану репродукцију. Замолите власника групе да провери дозволе за библиотеке или изаберите други ред за репродукцију.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Синхронизује се репродукција са групом $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Гласовна претрага није доступна.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Непосредна репродукција Долби вижна (Dolby Vision) није успела';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Непосредна репродукција овог Долби вижн (Dolby Vision) тока није успела да се покрене. Покушати поново уз транскодирање на серверу?';

  @override
  String get retryWithTranscode => 'Покушај поново уз транскодирање';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Долби вижн (Dolby Vision) није подржан';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Овај уређај не може непосредно да декодира садржај у формату Долби вижн (Dolby Vision). Користите резервну ХДР10 верзију или затражите транскодирање на серверу.';

  @override
  String get rememberMyChoice => 'Запамти мој избор';

  @override
  String get playHdr10Fallback => 'Пусти резервну ХДР10 верзију';

  @override
  String get requestTranscode => 'Затражи транскодирање';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# откривених редова',
      few: '# откривена реда',
      one: '# откривен ред',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Прикажи све';

  @override
  String get noItems => 'Нема ставки';

  @override
  String get switchUser => 'Промени корисника';

  @override
  String get remoteControl => 'Даљински управљач';

  @override
  String get mediaBarLoading => 'Учитавање траке са медијима...';

  @override
  String get mediaBarError => 'Учитавање траке са медијима није успело';

  @override
  String get offlineServerUnavailable =>
      'Повезани сте на интернет, али тренутни сервер није доступан.';

  @override
  String get offlineNoInternet =>
      'Нисте повезани на интернет. Доступан је само преузети садржај.';

  @override
  String get offlineFileNotAvailable => 'Датотека није доступна';

  @override
  String get offlineSwitchServer => 'Промени сервер';

  @override
  String get offlineSavedMedia => 'Преузимања';

  @override
  String get offlineBannerTitle => 'Нисте повезани на интернет';

  @override
  String get offlineBannerSubtitle => 'Приказују се преузети садржаји';

  @override
  String get serverUnreachableBannerTitle => 'Серверу није могуће приступити';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Репродукција преузетих садржаја док сервер поново не буде доступан';

  @override
  String get castGoogleCast => 'Гугл каст (Google Cast)';

  @override
  String get castAirPlay => 'Ерплеј (AirPlay)';

  @override
  String get castDlna => 'ДЛНА (DLNA)';

  @override
  String get castRemotePlayback => 'Удаљена репродукција';

  @override
  String castControlFailed(String error) {
    return 'Управљање пребацивањем није успело: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Контроле за $kind';
  }

  @override
  String get castDeviceVolume => 'Јачина звука уређаја';

  @override
  String get castVolumeUnavailable => 'Није доступно';

  @override
  String castStopKind(String kind) {
    return 'Заустави $kind';
  }

  @override
  String get audioLabel => 'Звук';

  @override
  String get subtitlesLabel => 'Титлови';

  @override
  String get pinConfirmTitle => 'Потврди ПИН';

  @override
  String get pinSetTitle => 'Постави ПИН';

  @override
  String get pinEnterTitle => 'Унеси ПИН';

  @override
  String get pinReenterToConfirm => 'Поново унесите ПИН да бисте га потврдили';

  @override
  String pinEnterNDigit(int length) {
    return 'Унесите ПИН од $length цифара';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Унесите свој ПИН од $length цифара';
  }

  @override
  String get kidsMode => 'Дечји режим';

  @override
  String get kidsModeSubtitle =>
      'Поједноставите апликацију и закључајте излаз ПИН-ом';

  @override
  String get kidsModeExit => 'Изађи из дечјег режима';

  @override
  String get kidsModeExitSubtitle =>
      'Унесите ПИН да бисте поново приступили свим функцијама апликације';

  @override
  String get pinIncorrect => 'Погрешан ПИН';

  @override
  String pinTryAgainIn(String wait) {
    return 'Превише покушаја. Покушајте поново за $wait.';
  }

  @override
  String get pinMismatch => 'ПИН-ови се не подударају';

  @override
  String get pinForgot => 'Заборавили сте ПИН?';

  @override
  String get pinClear => 'Обриши';

  @override
  String get pinBackspace => 'Брисање уназад';

  @override
  String get quickConnectAuthorized => 'Захтев за Брзо повезивање је одобрен.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Кôд за Брзо повезивање је неважећи или је истекао.';

  @override
  String get quickConnectNotSupported =>
      'Овај сервер не подржава Брзо повезивање.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Одобравање кôда за Брзо повезивање није успело.';

  @override
  String get quickConnectDisabled =>
      'Брзо повезивање је онемогућено на овом серверу.';

  @override
  String get quickConnectForbidden =>
      'Ваш налог не може да одобри овај захтев за Брзо повезивање.';

  @override
  String get quickConnectNotFound =>
      'Кôд за Брзо повезивање није пронађен. Покушајте са новим кôдом.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Брзо повезивање није успело: $message';
  }

  @override
  String get quickConnectEnterCode => 'Унеси кôд';

  @override
  String get quickConnectAuthorize => 'Одобри';

  @override
  String remoteCommandFailed(String error) {
    return 'Команда није успела: $error';
  }

  @override
  String get remoteControlTitle => 'Даљински управљач';

  @override
  String get remoteFailedToLoadSessions => 'Учитавање сесија није успело';

  @override
  String get remoteNoSessions => 'Нема сесија којима се може управљати';

  @override
  String get remoteStartPlayback => 'Покрени репродукцију на другом уређају';

  @override
  String get unknownUser => 'Непознат';

  @override
  String get unknownItem => 'Непознато';

  @override
  String get remoteNothingPlaying => 'У овој сесији се ништа не репродукује';

  @override
  String get castingStarted => 'Пребацивање је покренуто на изабраном уређају';

  @override
  String castingFailed(String error) {
    return 'Покретање пребацивања није успело: $error';
  }

  @override
  String get noRemoteDevices =>
      'Нема доступних уређаја за удаљену репродукцију.';

  @override
  String get noRemoteDevicesIos =>
      'Нема доступних уређаја за удаљену репродукцију.\n\nНа иОС-у (iOS), Ерплеј (AirPlay) одредишта можда нису доступна у симулатору.';

  @override
  String get trackActionPlayNext => 'Пусти следеће';

  @override
  String get trackActionViewDetails => 'Прикажи детаље';

  @override
  String get trackActionAddToQueue => 'Додај у ред';

  @override
  String get trackActionAddToPlaylist => 'Додај на листу за репродукцију';

  @override
  String get trackActionCancelDownload => 'Откажи преузимање';

  @override
  String get trackActionDeleteFromPlaylist => 'Уклони са листе за репродукцију';

  @override
  String get trackActionMoveUp => 'Помери нагоре';

  @override
  String get trackActionMoveDown => 'Помери надоле';

  @override
  String get trackActionRemoveFromFavorites => 'Уклони из омиљених';

  @override
  String get trackActionAddToFavorites => 'Додај у омиљене';

  @override
  String get trackActionGoToAlbum => 'Иди на албум';

  @override
  String get trackActionGoToArtist => 'Иди на извођача';

  @override
  String trackActionDownloading(String name) {
    return 'Преузимање: $name...';
  }

  @override
  String get trackActionDeletedFile => 'Преузета датотека је обрисана';

  @override
  String get trackActionDeleteFileFailed =>
      'Брисање преузете датотеке није успело';

  @override
  String get shuffleBy => 'Насумично пуштање по';

  @override
  String get shuffleSelectLibrary => 'Изаберите библиотеку';

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
      'За овај режим насумичног пуштања није пронађен ниједан жанр.';

  @override
  String get posterDisplayTitle => 'Приказ';

  @override
  String get posterImageType => 'Тип слике';

  @override
  String get imageTypePoster => 'Постер';

  @override
  String get imageTypeThumbnail => 'Сличица';

  @override
  String get imageTypeBanner => 'Банер';

  @override
  String get playlistAddFailed =>
      'Додавање на листу за репродукцију није успело';

  @override
  String get playlistCreateFailed =>
      'Прављење листе за репродукцију није успело';

  @override
  String get playlistNew => 'Нова листа за репродукцију';

  @override
  String get playlistCreate => 'Направи';

  @override
  String get playlistCreateNew => 'Направи нову листу за репродукцију';

  @override
  String get playlistNoneFound =>
      'Није пронађена ниједна листа за репродукцију';

  @override
  String get addToPlaylist => 'Додај на листу за репродукцију';

  @override
  String get lyricsNotAvailable => 'Текст песме није доступан';

  @override
  String get upNext => 'Следеће';

  @override
  String get playNext => 'Пусти следеће';

  @override
  String get stillWatchingContent =>
      'Репродукција је паузирана. Да ли још гледате?';

  @override
  String get stillWatchingStop => 'Заустави';

  @override
  String get stillWatchingContinue => 'Настави';

  @override
  String skipSegment(String segment) {
    return 'Прескочи: $segment';
  }

  @override
  String get liveTv => 'ТВ уживо';

  @override
  String get continueWatchingAndNextUp => 'Наставите гледање и следеће';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Преузимање $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Преузимање датотеке $fileName';
  }

  @override
  String get nextEpisode => 'Следећа епизода';

  @override
  String get moreFromThisSeason => 'Још из ове сезоне';

  @override
  String get playerTooltipPlaybackSpeed => 'Брзина репродукције';

  @override
  String get playerTooltipCastControls => 'Контроле пребацивања';

  @override
  String get playerTooltipPlaybackQuality => 'Брзина протока';

  @override
  String get playerTooltipEnterFullscreen => 'Прикажи преко целог екрана';

  @override
  String get playerTooltipExitFullscreen =>
      'Изађи из приказа преко целог екрана';

  @override
  String get playerTooltipFloatOnTop => 'Прикажи изнад осталих прозора';

  @override
  String get playerTooltipExitFloatOnTop =>
      'Искључи приказ изнад осталих прозора';

  @override
  String get playerTooltipLockLandscape => 'Закључај положену оријентацију';

  @override
  String get playerTooltipUnlockOrientation => 'Дозволи ротирање';

  @override
  String get playerTooltipPrevious => 'Претходно';

  @override
  String get playerTooltipSeekBack => 'Премотај уназад';

  @override
  String get playerTooltipSeekForward => 'Премотај унапред';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Означи као одгледано';

  @override
  String get contextMenuMarkUnwatched => 'Означи као неодгледано';

  @override
  String get contextMenuAddToFavorites => 'Додај у омиљене';

  @override
  String get contextMenuRemoveFromFavorites => 'Уклони из омиљених';

  @override
  String get contextMenuGoToSeries => 'Иди на серију';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Сакриј из одељка „Настави са гледањем“';

  @override
  String get contextMenuHideFromNextUp => 'Сакриј из одељка „Следеће“';

  @override
  String get contextMenuAddToCollection => 'Додај у колекцију';

  @override
  String get contextMenuRemoveFromCollection => 'Уклони из колекције';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Уклонити ставку $item из колекције $collection? Ставка ће остати у вашој библиотеци.';
  }

  @override
  String get removeFromCollectionFailed => 'Уклањање из колекције није успело';

  @override
  String get settingsAdministrationSubtitle =>
      'Приступите серверском административном панелу';

  @override
  String get settingsDynamicContent => 'Динамички садржај';

  @override
  String get settingsDynamicContentSubtitle =>
      'Медијска трака и визуелни преклопи';

  @override
  String get settingsAboutSubtitle =>
      'Верзија апликације, правне информације и заслуге';

  @override
  String get settingsSortServersBy => 'Сортирај сервере по';

  @override
  String get settingsLastUsed => 'Последњем коришћењу';

  @override
  String get settingsAlphabetical => 'Азбучном реду';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Дозволи самопотписане сертификате';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Веруј серверима који користе самопотписане ТЛС (TLS) сертификате или сертификате приватног сертификационог тела. Омогућите ово само за сервере под вашом контролом. Овим се искључује провера сертификата за све везе.';

  @override
  String get untrustedServerCertificate =>
      'Сертификат овог сервера није поуздан. Ако је сервер ваш и користи самопотписан или приватни сертификат, можете то да дозволите овде.';

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
  String get itemBlockedByParentalControls => 'Ово није доступно';

  @override
  String get blockedRatingsCeilingHint =>
      'Блокирањем неке старосне ознаке блокирају се и све ознаке за старији узраст.';

  @override
  String get blockedRatingsUnrankedSection => 'Блокира само ту ознаку';

  @override
  String get settingsHomePage => 'Почетна страница';

  @override
  String get settingsTwentyFourHourClock => '24-часовни формат';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Користи 24-часовни формат времена свуда где се приказује сат';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Прикажи дугме за насумичну репродукцију у траци за навигацију';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Прикажи дугме за жанрове у траци за навигацију';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Прикажи дугме за омиљене у траци за навигацију';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Прикажи дугме за телевизију уживо у траци за навигацију ако сервер има библиотеку телевизије уживо';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Прикажи дугме за библиотеке у траци за навигацију';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Прикажи дугме за Сир (Seerr) у траци за навигацију';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Увек приказуј текстуалне ознаке у горњој траци за навигацију';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Укључите или искључите видљивост сваке библиотеке на почетној страници. Поново покрените Мунфин (Moonfin) да би промене ступиле на снагу.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Медијска трака и локални прегледи';

  @override
  String get settingsVisualOverlays => 'Визуелни преклопи';

  @override
  String get settingsSeasonalSurprise => 'Сезонско изненађење';

  @override
  String get useNativeEmulator => 'Изворна емулација';

  @override
  String get useNativeEmulatorSubtitle =>
      'Играјте игре помоћу изворних језгара уместо веб-плејера Емулатор Џеј-Ес (EmulatorJS)';

  @override
  String get emulatorCores => 'Језгра емулатора';

  @override
  String get emulatorCoresSubtitle =>
      'Преузмите системе за изворно играње игара';

  @override
  String get emulatorCoresDescription =>
      'Изаберите системе које желите да инсталирате. Језгра обезбеђује пројекат либретро (libretro) и она омогућавају покретање игара изворно, уместо у прегледачу.';

  @override
  String get emulatorCoreDownloading => 'Преузимање';

  @override
  String get emulatorCoreUnavailable => 'Није доступно за овај уређај';

  @override
  String get emulatorCoreDownloadFailed =>
      'Преузимање језгра није успело. Проверите везу и покушајте поново.';

  @override
  String emulatorCoreResetSettings(String system) {
    return 'Врати подешавања система $system на подразумеване вредности';
  }

  @override
  String get emulatorCoreSettingsReset =>
      'Подешавања су враћена на подразумеване вредности.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Враћање подешавања није успело. Проверите везу и покушајте поново.';

  @override
  String get downloadedGames => 'Преузете игре';

  @override
  String get downloadedGamesSubtitle =>
      'Ослободите простор који заузимају датотеке игара';

  @override
  String get downloadedGamesDescription =>
      'Игре се копирају на овај уређај пре покретања. Уклоните игре које сте завршили да бисте ослободили простор. Сачуване позиције остају на серверу и не бришу се.';

  @override
  String get downloadedGamesEmpty =>
      'Још ниједна игра није преузета на овај уређај.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count игара, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Уклони све';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Уклонити игру $title са овог уређаја? Поново ће се преузети када је следећи пут покренете.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Уклонити све преузете игре са овог уређаја? Поново ће се преузети када их следећи пут покренете.';

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
  String get settingsConcurrentDownloads => 'Истовремена преузимања';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Највећи број ставки које се могу преузимати истовремено.';

  @override
  String get settingsAppInfo => 'ИНФОРМАЦИЈЕ О АПЛИКАЦИЈИ';

  @override
  String get settingsReportAnIssue => 'Пријави проблем';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Отворите списак пријављених проблема на Гитхабу (GitHub)';

  @override
  String get settingsJoinDiscord => 'Придружи се Дискорду (Discord)';

  @override
  String get settingsJoinDiscordSubtitle => 'Разговарајте са заједницом';

  @override
  String get settingsJoinTheDiscord => 'Придружи се Дискорду (Discord)';

  @override
  String get settingsSupportMoonfin => 'Подржи Мунфин (Moonfin)';

  @override
  String get settingsSupportMoonfinSubtitle => 'Частите програмера кафом';

  @override
  String get settingsLegal => 'ПРАВНЕ ИНФОРМАЦИЈЕ';

  @override
  String get settingsLicenses => 'Лиценце';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Обавештења о лиценцама отвореног кода';

  @override
  String get settingsPrivacyPolicy => 'Политика приватности';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Како Мунфин (Moonfin) поступа са вашим подацима';

  @override
  String get settingsCheckForUpdates => 'Провери да ли постоје ажурирања';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Проверите да ли је доступно најновије издање Мунфина (Moonfin)';

  @override
  String get settingsBoth => 'Обоје';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Филтер врсте садржаја за насумичну репродукцију';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аудио-записи, обрада звука и опције директног преноса';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Аутоматизована репродукција и редослед ставки';

  @override
  String get settingsSyncplaySubtitle =>
      'Логика синхронизације за групне сесије';

  @override
  String get settingsSkipIntrosAndOutros => 'Прескочи уводне и завршне шпице?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return 'Сегменти типа $segment';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Одбројавање медијског сегмента';

  @override
  String get settingsProgressBar => 'Трака напретка';

  @override
  String get settingsTimer => 'Тајмер';

  @override
  String get settingsNone => 'Ништа';

  @override
  String get settingsSkipButtonAutoHide =>
      'Аутоматски сакриј дугме за прескакање';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Аутоматски сакриј дугме за прескакање увода и завршних шпица након неколико секунди.';

  @override
  String get settingsPromptUser => 'Питај корисника';

  @override
  String get settingsSkip => 'Прескочи';

  @override
  String get settingsDoNothing => 'Не ради ништа';

  @override
  String get settingsMaxBitrateDescription =>
      'Ограничава брзину преноса при стримовању. Садржај чија је брзина преноса изнад овог прага биће транскодиран како би се уклопио у ограничење.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ограничава највећу резолуцију коју ће плејер захтевати. Садржај веће резолуције биће транскодиран на нижу резолуцију.';

  @override
  String get settingsPlayerZoomDescription =>
      'Начин скалирања видеа како би се уклопио у екран.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Механизам репродукције (Андроид ТВ (Android TV))';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Изаберите подразумевани механизам репродукције на уређајима са Андроидом ТВ (Android TV). Промене ће се применити при следећој репродукцији.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Медија 3 (Media3) (препоручено)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'мпв (mpv) (застарело)';

  @override
  String get settingsRedetectDisplay => 'Поново откриј екран';

  @override
  String get settingsRedetectDisplayDescription =>
      'Поново затражи од телевизора информације о подржаним ХДР (HDR) форматима. Користите ову опцију ако се садржај у форматима Долби вижн (Dolby Vision) или ХДР10 (HDR10) транскодира након што су телевизор или пријемник укључени са закашњењем.';

  @override
  String get settingsDisplayIsSdr => 'Мој телевизор не подржава ХДР (HDR)';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Престани да пријављујеш подршку за ХДР (HDR) на овом екрану. Користите ово само ако се упорно пријављује подршка за ХДР (HDR) који ваш телевизор заправо не може да прикаже.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Екран је поново откривен: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'Нису откривени ХДР (HDR) формати';

  @override
  String get settingsDisplayMarkedSdr => 'Екран је сачуван као СДР (SDR)';

  @override
  String get settingsDolbyVisionFallback =>
      'Резервни режим за Долби вижн (Dolby Vision)';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Понашање при репродукцији садржаја у формату Долби вижн (Dolby Vision) на уређајима који га не могу декодирати.';

  @override
  String get settingsAskEachTime => 'Питај сваки пут';

  @override
  String get settingsPreferHdr10Fallback =>
      'Дај предност резервном режиму ХДР10 (HDR10)';

  @override
  String get settingsPreferServerTranscode =>
      'Дај предност транскодирању на серверу';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Директна репродукција Долби вижн (Dolby Vision) профила 7';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Одређује да ли се токови слоја побољшања Долби вижн (Dolby Vision) профила 7 репродукују директно.';

  @override
  String get settingsAutoAftkrtEnabled => 'Аутоматски';

  @override
  String get settingsEnabledOnThisDevice => 'Омогућено';

  @override
  String get settingsDisabledPreferTranscode => 'Искључено';

  @override
  String get settingsResumeRewindDescription =>
      'При наставку репродукције (из одељка „Настави са гледањем“ или са странице ставке), за колико секунди треба вратити репродукцију уназад?';

  @override
  String get settingsUnpauseRewindDescription =>
      'При наставку репродукције након притиска на дугме за паузу, за колико секунди треба вратити репродукцију уназад?';

  @override
  String get settingsSkipBackLengthDescription =>
      'За колико секунди треба премотати уназад након притиска на дугме за премотавање?';

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
      'За колико секунди треба премотати унапред након притиска на дугме за брзо премотавање унапред?';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Пошаљи АЦ3 (AC3) битски ток спољном декодеру';

  @override
  String get settingsCinemaMode => 'Биоскопски режим';

  @override
  String get settingsCinemaModeSubtitle =>
      'Репродукуј трејлере и уводне клипове пре главног филма';

  @override
  String get settingsCinemaModeEpisodes => 'Биоскопски режим за епизоде';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Репродукуј уводне клипове и пре ТВ епизода';

  @override
  String get settingsNextUpDisplayDescription =>
      'Проширени приказ приказује целу картицу са илустрацијом епизоде и описом. Минимални приказ приказује сажет преклоп са одбројавањем. Искључен приказ у потпуности сакрива упит.';

  @override
  String get settingsShort => 'Кратко';

  @override
  String get settingsLong => 'Дуго';

  @override
  String get settingsVeryLong => 'Веома дуго';

  @override
  String get settingsVideoStartDelay => 'Кашњење почетка видеа';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value мс';
  }

  @override
  String get settingsLiveTvDirect => 'Директна репродукција ТВ програма уживо';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Омогући директну репродукцију ТВ програма уживо';

  @override
  String get settingsOpenGroups => 'Отвори групе';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Креирајте групе за синхронизовано гледање, придружите им се или управљајте њима';

  @override
  String get settingsSyncplayEnabled => 'Синхронизовано гледање је омогућено';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Омогући функције групног гледања';

  @override
  String get settingsSyncplayButton => 'Дугме за синхронизовано гледање';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Прикажи дугме за синхронизовано гледање на траци за навигацију';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Напредна корекција';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Омогући прецизну логику синхронизације';

  @override
  String get settingsSyncplaySyncCorrection => 'Корекција синхронизације';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Аутоматски прилагођавај репродукцију ради одржавања синхронизације';

  @override
  String get settingsSyncplaySpeedToSync => 'Брзина за синхронизацију';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Користи прилагођавање брзине репродукције за синхронизацију';

  @override
  String get settingsSyncplaySkipToSync => 'Премотавање ради синхронизације';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Користи премотавање ради синхронизације';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Минимално кашњење брзине';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Максимално кашњење брзине';

  @override
  String get settingsSyncplaySpeedDuration => 'Трајање промене брзине';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Минимално кашњење премотавања';

  @override
  String get settingsSyncplayExtraOffset => 'Додатни помак синхронизације';

  @override
  String get onNow => 'Тренутно на програму';

  @override
  String get collections => 'Колекције';

  @override
  String get lastPlayed => 'Последње репродуковано';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Недавно додато: $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Недавно објављено: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Аутоматски пусти следећу епизоду';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Аутоматски пусти следећу епизоду када буде доступна.';

  @override
  String get skipSilenceTitle => 'Прескочи тишину';

  @override
  String get skipSilenceSubtitle =>
      'Аутоматски прескочи делове без звука ако ток то подржава.';

  @override
  String get allowExternalAudioEffectsTitle => 'Дозволи спољне звучне ефекте';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Дозволи апликацијама за еквилајзер и звучне ефекте (нпр. Вејвлет (Wavelet)) да се повежу са сесијама репродукције Медиа3 (Media3).';

  @override
  String get disableTunnelingTitle => 'Онемогући тунелски пренос';

  @override
  String get disableTunnelingSubtitle =>
      'Присилно користи репродукцију без тунелског преноса. Корисно на уређајима код којих тунелски пренос узрокује прекиде у звуку и слици.';

  @override
  String get enableTunnelingTitle => 'Омогући тунелски пренос';

  @override
  String get enableTunnelingSubtitle =>
      'Напредно. Усмерава звук и слику кроз заједничку хардверску путању. Подразумевано је искључено јер на неким уређајима изазива прекиде звука и слике.';

  @override
  String get mapDolbyVisionP7Title =>
      'Увек репродукуј Долби Вижн (Dolby Vision) профил 7 као ХДР10 (HDR10)';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Прескочи конверзију у профил 8 и из токова Долби Вижн (Dolby Vision) профила 7 уклони податке Долби Вижна, тако да остане ХЕВЦ (HEVC) компатибилан са ХДР10 (HDR10). Користи ову опцију ако конвертовани токови изгледају неисправно.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Користи уграђене стилове титлова';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Примени боје, фонтове и положај уграђене у запис титлова. Искључи ову опцију да би се уместо тога користиле твоје поставке стила титлова.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Користи уграђене величине фонта титлова';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Примени податке о величини фонта уграђене у запис титлова. Искључи ову опцију да би се користила величина титлова из твојих поставки стила.';

  @override
  String get showMediaDetailsOnLibraryPage =>
      'Прикажи детаље о медијском садржају';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Прикажи детаље о изабраној ставци на врху страница библиотеке.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Користи детаљније поднаслове';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Прикажи детаљнији или сажетији подред на страницама библиотеке.';

  @override
  String get savedThemesDeleteDialogTitle => 'Избрисати сачувану тему?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Уклонити тему „$themeName“ из кеша овог уређаја?';
  }

  @override
  String get themeStore => 'Продавница тема';

  @override
  String get themeStoreSubtitle => 'Прегледај и сачувај теме заједнице';

  @override
  String get themeStoreDescription =>
      'Сачувај тему да би је користио као и остале сачуване теме.';

  @override
  String get themeStoreEmpty => 'Тренутно нема доступних тема.';

  @override
  String get themeStoreLoadFailed =>
      'Учитавање продавнице тема није успело. Проверите везу и покушајте поново.';

  @override
  String get themeStoreSave => 'Сачувај';

  @override
  String get themeStoreSaveAndApply => 'Сачувај и примени';

  @override
  String get themeStoreSaved => 'Сачувано';

  @override
  String get themeStoreInvalidMessage => 'Учитавање ове теме није успело.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Тема „$themeName“ је сачувана.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Тема „$themeName“ је избрисана са овог уређаја.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Брисање теме „$themeName“ није успело.';
  }

  @override
  String get savedThemesTitle => 'Сачуване теме';

  @override
  String get savedThemesDescription =>
      'Ово су теме преузете из додатка Муфин (Moonfin) за тренутни сервер. Брисањем се уклања само локална копија.';

  @override
  String get savedThemesEmpty => 'За овај сервер нису пронађене сачуване теме.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Тренутно активна';
  }

  @override
  String get savedThemesDeleteTooltip => 'Избриши сачувану тему';

  @override
  String get savedThemesManageSubtitle =>
      'Управљај преузетим темама додатка на овом уређају';

  @override
  String get themeEditor => 'Уређивач тема';

  @override
  String get themeEditorSubtitle =>
      'Отвори уређивач тема Муфин (Moonfin) у прегледачу';

  @override
  String get homeScreen => 'Почетни екран';

  @override
  String get bottomBar => 'Доња трака';

  @override
  String get homeRowsStyleClassic => 'Класични';

  @override
  String get homeRowsStyleModern => 'Модерни';

  @override
  String get homeRowsSection => 'Редови почетне странице';

  @override
  String get rowsType => 'Врста реда';

  @override
  String get rowsTypeDescription =>
      'Класични приказ задржава сопствену врсту слике и преклопни приказ информација за сваки ред. Модерни приказ користи редове који прелазе са усправних слика на позадинске слике.';

  @override
  String get modernCardsOnMyMediaRow => 'Модерне картице у реду „Моји медији“';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Прикажи прилагодљиве постере који се увећавају када су у фокусу. Искључи ову опцију да би се увек приказивале водоравне сличице.';

  @override
  String get sortOrder => 'Редослед сортирања';

  @override
  String get ascending => 'Растући';

  @override
  String get descending => 'Опадајући';

  @override
  String get displayFavoritesRows => 'Прикажи редове омиљених ставки';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Прикажи редове омиљених филмова, серија и других омиљених ставки у одељцима почетне странице.';

  @override
  String get favoritesRowSorting => 'Сортирање редова омиљених ставки';

  @override
  String get favoritesRowSortingDescription =>
      'Сортирај редове омиљених ставки по датуму додавања, датуму објављивања, азбучном реду и другим критеријумима.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Сортирај редове омиљених ставки растућим или опадајућим редоследом.';

  @override
  String get displayCollectionsRows => 'Прикажи редове колекција';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Прикажи редове колекција у одељцима почетне странице.';

  @override
  String get collectionsRowSorting => 'Сортирање редова колекција';

  @override
  String get collectionsRowSortingDescription =>
      'Сортирај редове колекција по датуму додавања, датуму објављивања, азбучном реду и другим критеријумима.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Сортирај редове колекција растућим или опадајућим редоследом.';

  @override
  String get collectionsRowShowEpisodes => 'Прикажи појединачне епизоде';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Разложи ТВ серије тако да се свака епизода приказује засебно.';

  @override
  String get displayGenresRows => 'Прикажи редове жанрова';

  @override
  String get displayGenresRowsSubtitle =>
      'Прикажи редове жанрова у одељцима почетне странице.';

  @override
  String get genresRowSorting => 'Сортирање редова жанрова';

  @override
  String get genresRowSortingDescription =>
      'Сортирај редове жанрова по датуму додавања, датуму објављивања, азбучном реду и другим критеријумима.';

  @override
  String get genresRowSortOrderDescription =>
      'Сортирај редове жанрова растућим или опадајућим редоследом.';

  @override
  String get genresRowItems => 'Ставке у редовима жанрова';

  @override
  String get genresRowItemsDescription =>
      'Прикажи филмове, серије или обоје у редовима жанрова.';

  @override
  String get displayStudiosRows => 'Прикажи ред студија';

  @override
  String get displayStudiosRowsSubtitle =>
      'Прикажи ред студија у одељцима почетне странице.';

  @override
  String get studiosRowSorting => 'Сортирање реда студија';

  @override
  String get studiosRowSortingDescription =>
      'Сортирај ред студија по називу, времену додавања и другим критеријумима.';

  @override
  String get studiosRowSortOrderDescription =>
      'Изабери растући или опадајући редослед сортирања.';

  @override
  String get selectStudiosToInclude => 'Изабери студије које желиш да укључиш';

  @override
  String get selectStudiosToIncludeDescription =>
      'Изабери који студији треба да буду укључени у ред на почетној страници.';

  @override
  String get selectAllStudios => 'Изабери све';

  @override
  String get deselectAllStudios => 'Опозови избор свих';

  @override
  String get tvStudiosFilter => 'ТВ студији';

  @override
  String get movieStudiosFilter => 'Филмски студији';

  @override
  String get selectedStudiosFilter => 'Изабрани студији';

  @override
  String get unselectedStudiosFilter => 'Неизабрани студији';

  @override
  String get filtersHeader => 'Филтери';

  @override
  String get showHeader => 'Прикажи';

  @override
  String get displayPlaylistsRows => 'Прикажи редове плејлиста';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Прикажи редове плејлиста у одељцима почетне странице.';

  @override
  String get playlistsRowSorting => 'Сортирање редова плејлиста';

  @override
  String get playlistsRowSortingDescription =>
      'Сортирај редове плејлиста по датуму додавања, датуму објављивања, азбучном реду и другим критеријумима.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Сортирај редове плејлиста растућим или опадајућим редоследом.';

  @override
  String get playlistsRowShowEpisodes => 'Прикажи појединачне епизоде';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Разложи ТВ серије тако да се свака епизода приказује засебно.';

  @override
  String get displayAudioRows => 'Прикажи аудио-редове';

  @override
  String get displayAudioRowsSubtitle =>
      'Прикажи аудио-редове у одељцима почетне странице.';

  @override
  String get audioRowsSorting => 'Сортирање аудио-редова';

  @override
  String get audioRowsSortingDescription =>
      'Сортирај аудио-редове по датуму додавања, датуму објављивања, азбучном реду и другим критеријумима.';

  @override
  String get audioRowsSortOrderDescription =>
      'Сортирај аудио-редове растућим или опадајућим редоследом.';

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
  String get audioPlaylists => 'Аудио-плејлисте';

  @override
  String get appearance => 'Изглед';

  @override
  String get layout => 'Распоред';

  @override
  String get theme => 'Тема';

  @override
  String get keyboard => 'Тастатура';

  @override
  String get navButtons => 'Дугмад';

  @override
  String get rendering => 'Рендеровање';

  @override
  String get mpvConfiguration => 'Конфигурација МПВ-а (MPV)';

  @override
  String get cardSize => 'Величина картица у реду почетне странице';

  @override
  String get externalPlayerApp => 'Апликација за спољни плејер';

  @override
  String get externalPlayerAppDescription =>
      'Изабери спољни плејер да би омогућио опцију репродукције дугим притиском';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Прикажи избор апликације када репродукција почне.';

  @override
  String get loadingInstalledPlayers => 'Учитавање инсталираних плејера...';

  @override
  String get connection => 'Веза';

  @override
  String get locallyDecodedCodecs => 'Кодеци који се декодирају локално';

  @override
  String get transcodeTargetCodecs => 'Циљни кодеци за транскодирање';

  @override
  String get passthrough => 'Пропуштање сигнала';

  @override
  String get supportedOnThisDevice => 'Подржано на овом уређају';

  @override
  String get notSupportedOnThisDevice => 'Није подржано на овом уређају';

  @override
  String get mediaPlayerBehavior => 'Понашање медијског плејера';

  @override
  String get playbackEnhancements => 'Побољшања репродукције';

  @override
  String get alwaysOn => 'Увек укључено.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Замени дугме за прескакање одјавне шпице приказом следеће ставке';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Прикажи преклопни приказ следеће ставке уместо дугмета за прескакање одјавне шпице.';

  @override
  String get playerRouting => 'Усмеравање плејера';

  @override
  String get preferSoftwareDecoders => 'Дај предност софтверским декодерима';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Користи ФФмпег (FFmpeg) за звук и либгејв1 (libgav1) за АВ1 (AV1) пре хардверских декодера. Искључи ову опцију ако пролазни пренос звука преко ХДМИ-ја (HDMI) престане да ради.';

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
  String get useExternalPlayer => 'Увек користи спољни плејер';

  @override
  String get useExternalPlayerSubtitle =>
      'Отвори репродукцију видеа у изабраној спољној апликацији на Андроид ТВ-у (Android TV).';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Аутоматско додавање у ред';

  @override
  String get preferSdhSubtitles => 'Дај предност титловима за глуве и наглуве';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'При аутоматском избору дај предност титловима за глуве и наглуве (SDH/CC).';

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
  String get webDiagnostics => 'Веб-дијагностика';

  @override
  String get webDiagnosticsTitle => 'Веб-дијагностика Муфин (Moonfin)';

  @override
  String get webDiagnosticsIntro =>
      'Ову страницу користите за откривање проблема са повезивањем прегледача (ЦОРС (CORS), мешовит садржај и поставке откривања сервера).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Откривен је неуспех због мешовитог садржаја';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Откривен је неуспех ЦОРС-а (CORS) или претходне провере';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Муфин (Moonfin) је открио да страница учитана преко ХТТПС-а (HTTPS) покушава да приступи адреси сервера преко ХТТП-а (HTTP). Прегледачи блокирају овај захтев пре него што стигне до сервера.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Муфин (Moonfin) је открио неуспех захтева на нивоу прегледача, који је често последица недостајућих заглавља за ЦОРС (CORS) или претходну проверу на медијском серверу.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Циљна адреса: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Детаљи: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Тренутни контекст извршавања';

  @override
  String get webDiagnosticsOrigin => 'Порекло';

  @override
  String get webDiagnosticsScheme => 'Шема';

  @override
  String get webDiagnosticsPluginMode => 'Режим додатка';

  @override
  String get webDiagnosticsWebRtcScan => 'ВебРТЦ (WebRTC) скенирање';

  @override
  String get webDiagnosticsForcedServerUrl => 'Принудно задата адреса сервера';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Подразумевана адреса сервера';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'Адреса посредника за откривање сервера';

  @override
  String get notConfigured => 'није подешено';

  @override
  String get webDiagnosticsMixedContent => 'Мешовит садржај';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ова страница је учитана преко ХТТПС-а (HTTPS), али једна или више подешених адреса користе ХТТП (HTTP). Прегледачи блокирају приступ ХТТП (HTTP) програмским интерфејсима са страница учитаних преко ХТТПС-а (HTTPS).';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Решење: омогућите приступ медијском серверу или адреси посредника преко ХТТПС-а (HTTPS), или учитајте Муфин (Moonfin) преко ХТТП-а (HTTP) само на поузданим локалним мрежама.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'У тренутним поставкама окружења нису уочена очигледна подешавања мешовитог садржаја.';

  @override
  String get webDiagnosticsCorsChecklist => 'Контролна листа за ЦОРС (CORS)';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Дозволите порекло прегледача у заглављу Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• У заглавље Access-Control-Allow-Headers уврстите Authorization, X-Emby-Authorization и X-Emby-Token.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Омогућите приступ заглављима Content-Range и Accept-Ranges ради стримовања и премотавања.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• На захтеве за претходну проверу OPTIONS одговорите статусом 204.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Пример исечка заглавља (у стилу Енџинкса (nginx))';

  @override
  String get note => 'Напомена';

  @override
  String get webDiagnosticsNonWebNote =>
      'Ова дијагностичка путања намењена је веб-верзијама. Ако ово видите на другој платформи, ове провере можда нису применљиве.';

  @override
  String get backToServerSelect => 'Назад на избор сервера';

  @override
  String get signOutAllUsers => 'Одјави све кориснике';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Приступ микрофону је трајно одбијен. Омогућите га у системским поставкама.';

  @override
  String get voiceSearchPermissionRequired =>
      'За гласовну претрагу је потребна дозвола за приступ микрофону.';

  @override
  String get voiceSearchNoMatch => 'Нисмо вас разумели. Покушајте поново.';

  @override
  String get voiceSearchNoSpeechDetected => 'Говор није откривен.';

  @override
  String get voiceSearchMicrophoneError => 'Грешка микрофона.';

  @override
  String get voiceSearchNeedsInternet =>
      'За гласовну претрагу је потребан интернет.';

  @override
  String get voiceSearchServiceBusy =>
      'Гласовна услуга је заузета. Покушајте поново.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Приступ микрофону је трајно одбијен.';

  @override
  String get microphonePermissionDenied => 'Приступ микрофону је одбијен.';

  @override
  String get speechRecognitionUnavailable =>
      'Препознавање говора није доступно на овом уређају.';

  @override
  String get openIosRoutePicker => 'Отвори бирач аудио-излаза за иОС (iOS)';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Бирач аудио-излаза ЕрПлеја (AirPlay) није доступан на овом уређају.';

  @override
  String get videos => 'Видео-снимци';

  @override
  String get programs => 'Програми';

  @override
  String get songs => 'Песме';

  @override
  String get photoAlbums => 'Фото-албуми';

  @override
  String get photos => 'Фотографије';

  @override
  String get people => 'Особе';

  @override
  String get recentlyReleasedEpisodes => 'Недавно објављене епизоде';

  @override
  String get watchAgain => 'Поново погледај';

  @override
  String get guestAppearances => 'Гостујућа појављивања';

  @override
  String get appearancesSeerr => 'Појављивања (Сир (Seerr))';

  @override
  String get crewContributionsSeerr => 'Доприноси екипе (Сир (Seerr))';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Гледај са групом';

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
  String get openInBrowser => 'Отвори у прегледачу';

  @override
  String get achievementBadges => 'Значке за достигнућа';

  @override
  String get achievementBadgesSubtitle =>
      'Значке, рангови и мисије освојени гледањем';

  @override
  String get achievementsBadges => 'Значке';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked од $total значки';
  }

  @override
  String get achievementsUnlockToasts => 'Обавештења о откључавању';

  @override
  String get achievementsUnlockToastsSubtitle =>
      'Прикажи обавештење када откључаш значку';

  @override
  String get achievementsUnlockedNotification => 'Достигнуће је откључано';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count откључаних достигнућа',
      one: '$count откључано достигнуће',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count још';
  }

  @override
  String get achievementsQuests => 'Мисије';

  @override
  String achievementsQuestCount(int count) {
    return '$count завршено';
  }

  @override
  String get achievementsLeaderboard => 'Табела са пласманом';

  @override
  String get achievementsLeaderboardSubtitle =>
      'Како се котираш у поређењу са другим корисницима на овом серверу';

  @override
  String get achievementsRecap => 'Преглед';

  @override
  String get achievementsRecapSubtitle => 'Шта си недавно гледао';

  @override
  String get achievementsLibraryCompletion => 'Завршеност библиотека';

  @override
  String achievementsLibraryCount(int count) {
    return '$count библиотека';
  }

  @override
  String achievementsScore(int score) {
    return '$score поена';
  }

  @override
  String get achievementsScoreLabel => 'Резултат';

  @override
  String get achievementsTopRank => 'Достигнут највиши ранг';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return 'Још $points поена до ранга „$tier“';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return 'Низ од $days дана';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'Најбоље: $days дана';
  }

  @override
  String get achievementsShowcase => 'Издвојено';

  @override
  String get achievementsUnlocked => 'Откључане';

  @override
  String get achievementsLocked => 'Закључане';

  @override
  String get achievementsNothingHere => 'Овде још нема ничега.';

  @override
  String get achievementsHiddenBadge => 'Скривено достигнуће';

  @override
  String achievementsUnlockedOn(String date) {
    return 'Откључано $date';
  }

  @override
  String achievementsPoints(int points) {
    return '$points поена';
  }

  @override
  String get achievementsDailyQuests => 'Дневне';

  @override
  String get achievementsWeeklyQuests => 'Недељне';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Замени дневне мисије';

  @override
  String get achievementsRerollWeekly => 'Замени недељне мисије';

  @override
  String get achievementsRerollOffer => 'Замени овај скуп другим';

  @override
  String get achievementsRerollSpentDaily =>
      'Искоришћено данас; поново доступно у поноћ по универзалном времену';

  @override
  String get achievementsRerollSpentWeekly =>
      'Искоришћено ове недеље; поново доступно у понедељак по универзалном времену';

  @override
  String get achievementsRerollConfirm =>
      'Поново насумично изабрати ове мисије?';

  @override
  String get achievementsRerollConfirmBody =>
      'На располагању имаш по једну дневну и недељну замену, а овим ћеш искористити једну од њих.';

  @override
  String get achievementsRerollFailed => 'Није било могуће заменити те мисије.';

  @override
  String get achievementsSuggested => 'Предложени садржаји за гледање';

  @override
  String get achievementsNoSuggestions => 'Нема предлога за ову значку.';

  @override
  String get achievementsProgressLabel => 'Напредак';

  @override
  String get achievementsLoadout => 'Опрема';

  @override
  String get achievementsLoadoutSubtitle =>
      'Поени за трошење и појачања која поседујеш';

  @override
  String get achievementsAppearance => 'Изглед';

  @override
  String get achievementsAppearanceSubtitle =>
      'Аватар и титула на твом профилу';

  @override
  String get achievementsAvatars => 'Аватари';

  @override
  String get achievementsTitles => 'Титуле';

  @override
  String get achievementsEquipped => 'Опремљено';

  @override
  String get achievementsOwned => 'Поседујеш';

  @override
  String achievementsEarnedAt(int score) {
    return 'Откључава се при укупном резултату од $score';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'На овом серверу нема аватара нити титула које можеш да користиш.';

  @override
  String get achievementsAppearanceFailed =>
      'Није било могуће променити изглед профила.';

  @override
  String get achievementsPowerUps => 'Појачања';

  @override
  String get achievementsStats => 'Статистика';

  @override
  String get achievementsStatsSubtitle => 'Твоји рекорди и стање на серверу';

  @override
  String get achievementsStatsWatched => 'Одгледано';

  @override
  String get achievementsStatsBests => 'Најбољи резултати';

  @override
  String get achievementsStatsHabits => 'Навике';

  @override
  String get achievementsStatsVariety => 'Разноврсност';

  @override
  String get achievementsStatsServer => 'Овај сервер';

  @override
  String get achievementsStatsClock => 'Када гледаш';

  @override
  String get achievementsStatItems => 'Одгледани садржаји';

  @override
  String get achievementsStatMovies => 'Одгледани филмови';

  @override
  String get achievementsStatSeries => 'Завршене серије';

  @override
  String get achievementsStatHours => 'Сати гледања';

  @override
  String get achievementsStatDays => 'Дани гледања';

  @override
  String get achievementsStatRewatches => 'Поновна гледања';

  @override
  String get achievementsStatBestWatchStreak => 'Најдужи низ гледања';

  @override
  String get achievementsStatBestLoginStreak =>
      'Најдужи низ узастопних пријава';

  @override
  String get achievementsStatMostEpisodes => 'Највише епизода у једном дану';

  @override
  String get achievementsStatMostMovies => 'Највише филмова у једном дану';

  @override
  String get achievementsStatLongestItem => 'Најдужи појединачни садржај';

  @override
  String get achievementsStatBestCombo => 'Најбоља комбинација';

  @override
  String get achievementsStatLateNight => 'Ноћне сесије';

  @override
  String get achievementsStatEarlyMorning => 'Ранојутарње сесије';

  @override
  String get achievementsStatWeekend => 'Викенд-сесије';

  @override
  String get achievementsStatDaysSignedIn => 'Дани пријављивања';

  @override
  String get achievementsStatLibraries => 'Посећене библиотеке';

  @override
  String get achievementsStatGenres => 'Гледани жанрови';

  @override
  String get achievementsStatDecades => 'Гледане деценије';

  @override
  String get achievementsStatCountries => 'Земље порекла гледаних садржаја';

  @override
  String get achievementsStatLanguages => 'Језици гледаних садржаја';

  @override
  String get achievementsStatUsers => 'Корисници';

  @override
  String get achievementsStatBadgesUnlocked => 'Откључане значке';

  @override
  String get achievementsStatScoreEarned => 'Освојени поени';

  @override
  String get achievementsStatCommonBadge => 'Најчешћа значка';

  @override
  String get achievementsActivity => 'Активност';

  @override
  String get achievementsActivitySubtitle =>
      'Шта је недавно откључано на серверу';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user је откључао/откључала значку „$badge“';
  }

  @override
  String get achievementsShop => 'Продавница';

  @override
  String get achievementsShopSubtitle => 'Потроши поене на додатна појачања';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Тренутно се ништа не продаје.';

  @override
  String get achievementsBuyConfirm => 'Купити ово?';

  @override
  String get achievementsBuyConfirmBody =>
      'Износ ће бити одмах одузет од твојих расположивих поена.';

  @override
  String get achievementsBuyFailed => 'Куповина није успела.';

  @override
  String get achievementsScoreBank => 'Расположиви поени';

  @override
  String get achievementsBoost => 'Појачање искуства';

  @override
  String get achievementsBoostBody =>
      'Удвостручује поене на сат времена. Поновном употребом почиње нови сат.';

  @override
  String get achievementsDoubleCredit => 'Двоструки кредит';

  @override
  String get achievementsDoubleCreditBody =>
      'Следећи садржај који завршиш рачуна се двоструко за значке.';

  @override
  String get achievementsStreakFreeze => 'Замрзавање низа';

  @override
  String get achievementsStreakFreezeBody =>
      'Покрива један пропуштени дан. Можеш да имаш само једно на залихама.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Имаш $count',
      one: 'Имаш 1',
      zero: 'Немаш ниједно',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'Тренутно активно';

  @override
  String get achievementsUsePowerUp => 'Употребити ово појачање?';

  @override
  String get achievementsUsePowerUpBody => 'Појачање се троши чим потврдиш.';

  @override
  String get achievementsPowerUpFailed =>
      'Није било могуће употребити то појачање.';

  @override
  String get achievementsHours => 'Сати';

  @override
  String get achievementsStreak => 'Низ';

  @override
  String get achievementsPeriodWeek => 'Недеља';

  @override
  String get achievementsPeriodMonth => 'Месец';

  @override
  String get achievementsPeriodYear => 'Година';

  @override
  String achievementsDaysWatched(int count) {
    return '$count дана гледања';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return 'Освојено значки: $count';
  }

  @override
  String get achievementsTopDirectors => 'Најгледанији редитељи';

  @override
  String get achievementsTopActors => 'Најгледанији глумци';

  @override
  String get achievementsLoadFailed =>
      'Није било могуће учитати твоја достигнућа.';

  @override
  String get friends => 'Пријатељи';

  @override
  String get friendsSubtitle =>
      'Погледајте ко је на мрежи и ћаскајте са људима на овом серверу';

  @override
  String get friendsShowButton => 'Прикажи дугме Пријатељи';

  @override
  String get friendsShowButtonSubtitle =>
      'Пријатељи и ћаскање из додатка Значке достигнућа';

  @override
  String get friendsMessages => 'Поруке';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count непрочитаних порука',
      few: '$count непрочитане поруке',
      one: '$count непрочитана порука',
      zero: 'Нема непрочитаних порука',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => 'Захтеви за пријатељство';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count захтева чека на ваш одговор',
      few: '$count захтева чекају на ваш одговор',
      one: '$count захтев чека на ваш одговор',
      zero: 'Ништа не чека на ваш одговор',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => 'Додај пријатеље';

  @override
  String get friendsAddSubtitle => 'Пронађите људе на овом серверу';

  @override
  String get friendsPrivacy => 'Приватност';

  @override
  String get friendsPrivacySubtitle => 'Шта ваши пријатељи могу да виде';

  @override
  String get friendsOnline => 'На мрежи';

  @override
  String get friendsOffline => 'Ван мреже';

  @override
  String get friendsNone =>
      'Још немате пријатеља. Додајте људе са овог сервера да бисте их видели овде.';

  @override
  String friendsWatching(String title) {
    return 'Гледа $title';
  }

  @override
  String friendsLastWatched(String title) {
    return 'Последње гледано: $title';
  }

  @override
  String friendsLastSeen(String time) {
    return 'Последњи пут виђен $time';
  }

  @override
  String get friendsLoadFailed =>
      'Учитавање није успело. Проверите везу и покушајте поново.';

  @override
  String get friendsActionFailed =>
      'Радња није успела. Покушајте поново за тренутак.';

  @override
  String get friendsIncoming => 'Захтеви које сте примили';

  @override
  String get friendsOutgoing => 'Захтеви које сте послали';

  @override
  String get friendsNoRequests => 'Нема захтева за пријатељство.';

  @override
  String get friendsAccept => 'Прихвати';

  @override
  String get friendsDecline => 'Одбиј';

  @override
  String get friendsCancelRequest => 'Откажи захтев';

  @override
  String friendsRequestFrom(String name) {
    return '$name жели да вам буде пријатељ';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return 'Да ли желите да повучете захтев који сте послали кориснику $name?';
  }

  @override
  String get friendsSearchHint => 'Претражи људе';

  @override
  String get friendsNoMatches => 'Нико не одговара том имену.';

  @override
  String friendsRequestSent(String name) {
    return 'Захтев је послат кориснику $name';
  }

  @override
  String get friendsSendRequest => 'Додај у пријатеље';

  @override
  String get friendsSendMessage => 'Пошаљи поруку';

  @override
  String friendsOpenItem(String title) {
    return 'Отвори $title';
  }

  @override
  String get friendsRemove => 'Уклони пријатеља';

  @override
  String friendsRemoveBody(String name) {
    return 'Уклонити корисника $name из пријатеља? Можете га поново додати касније.';
  }

  @override
  String get friendsBlock => 'Блокирај';

  @override
  String get friendsUnblock => 'Деблокирај';

  @override
  String friendsBlockBody(String name) {
    return 'Блокирати корисника $name? Нећете моћи да шаљете директне поруке једно другом. Заједничка групна ћаскања остају отворена.';
  }

  @override
  String friendsUnblockBody(String name) {
    return 'Деблокирати корисника $name?';
  }

  @override
  String get friendsBlocked => 'Блокирани корисници';

  @override
  String friendsProfileHidden(String name) {
    return '$name држи свој профил приватним.';
  }

  @override
  String get friendsAppearOffline => 'Прикажи ме као да сам ван мреже';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Пријатељи ће вас увек видети као да сте ван мреже';

  @override
  String get friendsHideNowPlaying => 'Сакриј шта гледам';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Пријатељи ће и даље видети да сте на мрежи, али не и шта гледате';

  @override
  String get friendsHideLastWatched => 'Сакриј последње гледани садржај';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Пријатељи неће видети шта сте последње гледали док сте ван мреже';

  @override
  String get friendsMessageNotifications => 'Обавештења о порукама';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Прикажи банер када вам пријатељ пошаље поруку';

  @override
  String get friendsMuteDuringPlayback => 'Утишај током репродукције';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      'Без банера са порукама док се репродукује видео или игра';

  @override
  String get friendsSaveFailed => 'Чување подешавања није успело.';

  @override
  String get chatNew => 'Нова порука';

  @override
  String get chatNewSubtitle => 'Започните ћаскање са пријатељем';

  @override
  String get chatNewGroup => 'Нова група';

  @override
  String get chatNewGroupSubtitle => 'Ћаскајте са више пријатеља истовремено';

  @override
  String get chatNone => 'Још нема порука.';

  @override
  String get chatYou => 'Ви';

  @override
  String chatYouSaid(String text) {
    return 'Ви: $text';
  }

  @override
  String get chatPhoto => 'Фотографија';

  @override
  String get chatEmoji => 'Емоџи';

  @override
  String get chatEmojiSearch => 'Претражи емоџије';

  @override
  String get chatNoRecentEmoji => 'Нема недавно коришћених емоџија';

  @override
  String get chatViewPhoto => 'Погледај фотографију';

  @override
  String get chatHint => 'Напишите поруку';

  @override
  String get chatAttach => 'Пошаљи фотографију';

  @override
  String get chatEdited => 'измењено';

  @override
  String get chatSeen => 'Прочитано';

  @override
  String get chatSent => 'Послато';

  @override
  String get chatEditing => 'Уређивање поруке';

  @override
  String get chatMessageOptions => 'Опције поруке';

  @override
  String get chatDeleteBody => 'Избрисати ову поруку за све?';

  @override
  String get chatClear => 'Обриши разговор';

  @override
  String get chatClearBody =>
      'Избрисати све поруке у овом ћаскању за све учеснике?';

  @override
  String get chatGroupInfo => 'Информације о групи';

  @override
  String get chatGroupName => 'Назив групе';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чланова',
      few: '$count члана',
      one: '$count члан',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => 'Власник';

  @override
  String get chatAdmin => 'Администратор';

  @override
  String get chatMakeAdmin => 'Постави за администратора';

  @override
  String get chatRemoveAdmin => 'Уклони администраторска овлашћења';

  @override
  String get chatRemoveMember => 'Уклони из групе';

  @override
  String get chatAddMember => 'Додај људе';

  @override
  String get chatNobodyToAdd => 'Нема више никога за додавање.';

  @override
  String get chatLeave => 'Напусти групу';

  @override
  String get chatLeaveBody =>
      'Напустити ову групу? Неко ће морати поново да вас дода да бисте се вратили.';

  @override
  String get chatCreate => 'Направи групу';

  @override
  String get chatPickMembers => 'Изаберите најмање два пријатеља';

  @override
  String chatNewMessageFrom(String name) {
    return 'Нова порука од корисника $name';
  }

  @override
  String get chatImageTooLarge => 'Слика је већа од 8 МБ.';

  @override
  String get chatImageUnsupported =>
      'Могу се слати само слике у форматима ПНГ (PNG), ЈПЕГ (JPEG), ГИФ (GIF) и ВебП (WebP).';

  @override
  String get embeddedBrowserNotAvailable =>
      'Уграђени прегледач није доступан на овој платформи.';

  @override
  String get adminRestartServerConfirmation =>
      'Да ли сте сигурни да желите да поново покренете сервер?';

  @override
  String get adminShutdownServerConfirmation =>
      'Да ли сте сигурни да желите да искључите сервер? Мораћете ручно поново да га покренете.';

  @override
  String get internal => 'Интерно';

  @override
  String get idle => 'Неактивно';

  @override
  String get os => 'Оперативни систем';

  @override
  String get adminNoUsersFound => 'Није пронађен ниједан корисник';

  @override
  String get adminNoUsersMatchSearch => 'Ниједан корисник не одговара претрази';

  @override
  String get adminNoDevicesFound => 'Није пронађен ниједан уређај';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Ниједан уређај не одговара тренутним филтерима';

  @override
  String get remoteAccess => 'Удаљени приступ';

  @override
  String get localOnly => 'Само локално';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Учитавање аналитике медија није успело';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Обједињена аналитика за све медијатеке.';

  @override
  String get analyticsTopArtists => 'Водећи извођачи';

  @override
  String get analyticsTopAuthors => 'Водећи аутори';

  @override
  String get analyticsTopContributors => 'Водећи сарадници';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count медијатека',
      few: '$count медијатеке',
      one: '$count медијатека',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'За овај избор још нема података о укупном броју индексираних медијских садржаја.';

  @override
  String get analyticsLibraryDetails => 'Детаљи медијатеке';

  @override
  String get analyticsLibraryBreakdown => 'Преглед по медијатекама';

  @override
  String get analyticsNoLibrariesAvailable => 'Нема доступних медијатека.';

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
  String get adminServerAdministrationTitle => 'Администрација сервера';

  @override
  String get adminServerPathData => 'Подаци';

  @override
  String get adminServerPathImageCache => 'Кеш слика';

  @override
  String get adminServerPathCache => 'Кеш';

  @override
  String get adminServerPathLogs => 'Дневници';

  @override
  String get adminServerPathMetadata => 'Метаподаци';

  @override
  String get adminServerPathTranscode => 'Транскодирање';

  @override
  String get adminServerPathWeb => 'Веб';

  @override
  String get adminNoServerPathsReturned =>
      'Овај сервер није вратио ниједну путању.';

  @override
  String adminPercentUsed(int percent) {
    return 'Искоришћено: $percent%';
  }

  @override
  String get userActivity => 'Активност корисника';

  @override
  String get systemEvents => 'Системски догађаји';

  @override
  String get needsAttention => 'Захтева пажњу';

  @override
  String get homeVideos => 'Кућни видео-снимци';

  @override
  String get mixedContent => 'Мешовити садржај';

  @override
  String get homeVideosAndPhotos => 'Кућни видео-снимци и фотографије';

  @override
  String get mixedMoviesAndShows => 'Мешовити филмови и серије';

  @override
  String get dolbyVision => 'Долби Вижн (Dolby Vision)';

  @override
  String get noRecordingsFound => 'Нису пронађени снимци';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'У архиви .$extension нису пронађене странице са сликама.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Уграђени приказивач није успео ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Приказивач ЕПУБ-а (EPUB) није успео ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Недостаје локална датотека за читач: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'ХТТП (HTTP) статус $status при отварању података књиге са адресе $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Није доступна ниједна крајња тачка са које се књига може прочитати';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Неподржан формат архиве стрипа: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Додатак за распакивање ЦБР-а (CBR) није доступан на овој платформи.';

  @override
  String get failedToExtractCbrArchive =>
      'Распаковање архиве .cbr није успело.';

  @override
  String get cb7ExtractionUnavailable =>
      'Распаковање ЦБ7-а (CB7) није доступно на овој платформи.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Додатак за распакивање ЦБ7-а (CB7) није доступан на овој платформи.';

  @override
  String get loadingShuffle => 'Учитавање насумичног избора...';

  @override
  String get libraryShuffleLabel => 'НАСУМИЧНИ ИЗБОР ИЗ МЕДИЈАТЕКЕ';

  @override
  String get randomShuffleLabel => 'НАСУМИЧНИ ИЗБОР';

  @override
  String get genresShuffleLabel => 'НАСУМИЧНИ ИЗБОР ПО ЖАНРОВИМА';

  @override
  String get autoHdrSwitching => 'Аутоматско пребацивање ХДР-а (HDR)';

  @override
  String get autoHdrSwitchingDescription =>
      'Аутоматски укључи ХДР за репродукцију ХДР видеа и врати претходни режим приказа по изласку.';

  @override
  String get whenFullscreen => 'Када је приказ преко целог екрана';

  @override
  String get changeArtwork => 'Промени слику';

  @override
  String get missing => 'Недостаје';

  @override
  String get clearAllArtworkButton => 'Обриши све слике?';

  @override
  String get clearAllArtworkWarning =>
      'Да ли сте сигурни да желите да обришете све преузете слике?';

  @override
  String get confirmClear => 'Потврди брисање';

  @override
  String confirmClearMessage(String itemType) {
    return 'Да ли сте сигурни да желите да обришете ову ставку ($itemType)?';
  }

  @override
  String get uploadButton => 'Отпреми?';

  @override
  String get resolutionLabel => 'Резолуција: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Прикажи слике само на језику интерфејса';

  @override
  String get confirmClearAll => 'Потврди брисање свега';

  @override
  String get imageUploadSuccess => 'Слика је успешно отпремљена!';

  @override
  String imageUploadFailed(String error) {
    return 'Отпремање слике није успело: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Постављање слике није успело: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Брисање слике није успело: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Брисање свих слика није успело: $error';
  }

  @override
  String get yes => 'Да';

  @override
  String get posterCategory => 'Плакат';

  @override
  String get backdropsCategory => 'Позадине';

  @override
  String get bannerCategory => 'Банер';

  @override
  String get logoCategory => 'Лого';

  @override
  String get thumbnailCategory => 'Сличица';

  @override
  String get artCategory => 'Илустрација';

  @override
  String get discArtCategory => 'Илустрација диска';

  @override
  String get screenshotCategory => 'Снимак екрана';

  @override
  String get boxCoverCategory => 'Предња страна омота';

  @override
  String get boxRearCoverCategory => 'Задња страна омота';

  @override
  String get menuArtCategory => 'Илустрација менија';

  @override
  String get confirmItemPoster => 'плакат';

  @override
  String get confirmItemBackdrop => 'позадина';

  @override
  String get confirmItemBanner => 'банер';

  @override
  String get confirmItemLogo => 'лого';

  @override
  String get confirmItemThumbnail => 'сличица';

  @override
  String get confirmItemArt => 'илустрација';

  @override
  String get confirmItemDiscArt => 'илустрација диска';

  @override
  String get confirmItemScreenshot => 'снимак екрана';

  @override
  String get confirmItemBoxCover => 'предња страна омота';

  @override
  String get confirmItemBoxRearCover => 'задња страна омота';

  @override
  String get confirmItemMenuArt => 'илустрација менија';

  @override
  String get resolutionAll => 'Све';

  @override
  String get resolutionHigh => 'Висока (1080п и више)';

  @override
  String get resolutionMedium => 'Средња (720п)';

  @override
  String get resolutionLow => 'Ниска (мање од 720п)';

  @override
  String get sources => 'Извори';

  @override
  String get audiobookChapters => 'Поглавља';

  @override
  String get audiobookBookmarks => 'Обележивачи';

  @override
  String get audiobookNotes => 'Белешке';

  @override
  String get audiobookQueue => 'Ред за репродукцију';

  @override
  String get audiobookTimeline => 'Временска линија';

  @override
  String get audiobookTimelineEmpty => 'Временска линија је празна';

  @override
  String get audiobookFocusedTimeline => 'Фокусирана временска линија';

  @override
  String get audiobookFullTimeline => 'Цела временска линија';

  @override
  String get audiobookExportBookmarks => 'Извези обележиваче';

  @override
  String get audiobookExportNotes => 'Извези белешке';

  @override
  String get audiobookExportAll => 'Извези све';

  @override
  String audiobookExportSuccess(String path) {
    return 'Извезено у $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Извоз није успео: $error';
  }

  @override
  String get audiobookLyrics => 'Текст песме';

  @override
  String get audiobookAddBookmark => 'Додај обележивач';

  @override
  String get audiobookAddNote => 'Додај белешку';

  @override
  String get audiobookEditNote => 'Измени белешку';

  @override
  String get audiobookNoteHint => 'Напишите белешку о овом тренутку';

  @override
  String get audiobookSleepTimer => 'Тајмер за спавање';

  @override
  String get audiobookSleepOff => 'Искључено';

  @override
  String get audiobookSleepEndOfChapter => 'На крају поглавља';

  @override
  String get audiobookSleepCustom => 'Прилагођено';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Преостало: $remaining';
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
  String get audiobookPlaybackSpeed => 'Брзина репродукције';

  @override
  String get audiobookRemainingTime => 'Преостало';

  @override
  String get audiobookElapsedTime => 'Протекло';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Назад $seconds с';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Напред $seconds с';
  }

  @override
  String get audiobookPreviousChapter => 'Претходно поглавље';

  @override
  String get audiobookNextChapter => 'Следеће поглавље';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Поглавље $current од $total';
  }

  @override
  String get audiobookNoChapters => 'Нема поглавља';

  @override
  String get audiobookNoBookmarks => 'Још нема обележивача';

  @override
  String get audiobookNoNotes => 'Још нема белешки';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Обележивач је додат на позицији $position';
  }

  @override
  String get audiobookSpeedReset => 'Врати на 1,0×';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '$value×';
  }

  @override
  String get audiobookSave => 'Сачувај';

  @override
  String get audiobookCancel => 'Откажи';

  @override
  String get audiobookDelete => 'Обриши';

  @override
  String get subtitlePreferencesDescription =>
      'Промените режиме титлова, подразумеване језике, изглед и опције приказивања.';

  @override
  String get subtitleRendering => 'Приказ титлова';

  @override
  String get displayOptions => 'Опције приказа';

  @override
  String get releaseDateAscending => 'Датум објављивања (растући редослед)';

  @override
  String get releaseDateDescending => 'Датум објављивања (опадајући редослед)';

  @override
  String get groupContributions => 'Групиши доприносе';

  @override
  String get groupMultipleRoles => 'Групиши више улога';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Упозорење о дозволи уписа у библиотеку';

  @override
  String get libraryWriteAccessHowToFix => 'Како да решите проблем:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Доделите кориснику сервиса Џелифин (нпр. jellyfin или Docker PUID/PGID) дозволе за упис у фасцикле медијске библиотеке на серверу.\n\n2. Или отворите контролну таблу Џелифина → Библиотеке, уредите ову библиотеку и онемогућите опцију „Чувај слике у фасциклама медија“ како би се слике чувале у интерној бази података Џелифина.';

  @override
  String get dismiss => 'Затвори';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Библиотека „$libraryName“ подешена је тако да чува слике непосредно у фасциклама медија (опција „Чувај слике у фасциклама медија“ је укључена). Међутим, Џелифин је проверио приступ за упис и утврдио да нема дозволу за уписивање датотека у овај директоријум:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Изгледа да Џелифин није успео да ажурира слику. Библиотека је подешена тако да чува слике непосредно у фасциклама медија (опција „Чувај слике у фасциклама медија“ је укључена). До ове грешке обично долази када серверски процес Џелифина нема дозволу за уписивање датотека у директоријуме медија.';

  @override
  String get replay => 'Пусти поново';

  @override
  String get fileInformation => 'Информације о датотеци';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Величина: $size  •  Формат: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Датум додавања: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Прикажи све аудио-записе ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Прикажи све титлове ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Провера могућности непосредне репродукције...';

  @override
  String get directPlayCapabilityLabel => 'Могућност непосредне репродукције: ';

  @override
  String get forced => 'Принудни';

  @override
  String get transcodeContainerNotSupported =>
      'Плејер не подржава формат контејнера.';

  @override
  String get transcodeVideoCodecNotSupported => 'Видео-кодек није подржан.';

  @override
  String get transcodeAudioCodecNotSupported => 'Аудио-кодек није подржан.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Формат титлова није подржан (потребно је уграђивање у видео).';

  @override
  String get transcodeAudioProfileNotSupported => 'Аудио-профил није подржан.';

  @override
  String get transcodeVideoProfileNotSupported => 'Видео-профил није подржан.';

  @override
  String get transcodeVideoLevelNotSupported => 'Видео-ниво није подржан.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Овај уређај не подржава видео-резолуцију.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Дубина бита видео-записа није подржана.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Брзина кадрова видео-записа није подржана.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Битска брзина датотеке премашује ограничење стримовања плејера.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Битска брзина видео-записа премашује ограничење стримовања.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Битска брзина аудио-записа премашује ограничење стримовања.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Број аудио-канала није подржан.';

  @override
  String transcodeAudioCodecWithCodec(String codec) {
    return 'Аудио-кодек ($codec) није непосредно подржан.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'Савет: Ако ваш аудио-пријемник или звучна трака подржава $codec, укључите прослеђивање звука у аудио-подешавањима.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Број аудио-канала ($channels канала) премашује ограничење плејера.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'Савет: Подесите опцију „Максималан број аудио-канала“ или мешање вишеканалног звука у аудио-подешавањима.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'Титлови АСС/ССА захтевају транскодирање јер је непосредна репродукција искључена.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'Савет: Укључите „Непосредна репродукција АСС/ССА титлова“ у подешавањима репродукције да бисте их пуштали без транскодирања.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'ПГС титлови захтевају транскодирање јер је непосредна репродукција искључена.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'Савет: Укључите „Непосредна репродукција ПГС титлова“ у подешавањима репродукције да бисте их пуштали без транскодирања.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Формат титлова ($codec) није непосредно подржан и мора бити уграђен у видео.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'Битска брзина датотеке ($fileBitrate) премашује подешено ограничење стримовања ($maxBitrate).';
  }

  @override
  String get transcodeBitrateHint =>
      'Савет: Повећајте „Максималну битску брзину“ у подешавањима репродукције да бисте омогућили непосредно стримовање.';

  @override
  String get transcodeResolutionHint =>
      'Савет: Повећајте „Максималну резолуцију“ у подешавањима репродукције да бисте омогућили непосредно стримовање.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'Овај екран не подржава динамички опсег видео-сигнала (нпр. Долби вижн / ХДР).';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'Непосредна репродукција побољшавајућег слоја профила 7 Долби вижна је онемогућена.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'Савет: Ако ваш екран то подржава, укључите „Непосредна репродукција профила 7 Долби вижна“ у подешавањима репродукције.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'Према корисничким подешавањима, за резервни режим Долби вижна даје се предност транскодирању.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'Савет: Подесите „Резервни режим Долби вижна“ на „Репродукуј као ХДР10“ у подешавањима репродукције да бисте избегли транскодирање.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'Повезани екран не пријављује подршку за ХДР или Долби вижн.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'Повезани екран не подржава ХДР10, који је неопходан за резервни режим Долби вижна.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'Фреквенција одабирања звука није подржана.';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'Дубина бита звука није подржана.';

  @override
  String get transcodeRefFramesNotSupported =>
      'Број референтних видео-кадрова премашује ограничења плејера.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'Анаморфни видео-запис није подржан.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'Преплетени видео-запис није подржан.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'Секундарни аудио-ток захтева транскодирање.';

  @override
  String get transcodeDirectPlayError =>
      'Непосредна репродукција овог медијског формата није подржана.';

  @override
  String get sortServerOrder => 'Server Order';

  @override
  String get sortAlphabetical => 'Азбучни редослед';

  @override
  String get sortReleaseAscending => 'Редослед објављивања (растући)';

  @override
  String get sortReleaseDescending => 'Редослед објављивања (опадајући)';

  @override
  String get sortCustomDragDrop => 'Прилагођено (превлачење и отпуштање)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Опције сортирања листе за репродукцију';

  @override
  String get resetSort => 'Поништи сортирање';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Поново гледај сезону $season, епизоду $episode';
  }

  @override
  String get rewatchPlaylist => 'Поново гледај листу за репродукцију';

  @override
  String get noSubtitlesFound => 'Нису пронађени титлови.';

  @override
  String get adminControls => 'Администраторске контроле';

  @override
  String get impellerRendering => 'Механизам за приказивање (Импелер)';

  @override
  String get impellerRenderingSubtitle =>
      'Импелер је савремени Флатеров ГПУ рендерер који обезбеђује глаткије анимације и мање застајања. На неким ТВ-кутијама и старијим графичким процесорима може изазвати грешке у приказу или црну слику; искључите га ако наиђете на такве проблеме. Аутоматски режим бира најприкладније подразумевано подешавање за ваш уређај. Поново покрените Мунфин да би промене ступиле на снагу.';

  @override
  String get impellerAuto => 'Аутоматски';

  @override
  String get impellerOn => 'Укључено';

  @override
  String get impellerOff => 'Искључено';

  @override
  String get impellerRestartTitle => 'Потребно је поновно покретање';

  @override
  String get impellerRestartMessage =>
      'Мунфин треба поново покренути да би се променио механизам за приказивање. Затворите апликацију сада, па је поново отворите да би промена ступила на снагу.';

  @override
  String get impellerCloseNow => 'Затвори апликацију сада';

  @override
  String get adminRefreshLibrary => 'Освежи библиотеку';

  @override
  String get adminRefreshAllLibraries => 'Освежи све библиотеке';

  @override
  String get adminRepoSortDateOldest => 'Датум додавања (од најстаријег)';

  @override
  String get adminRepoSortDateNewest => 'Датум додавања (од најновијег)';

  @override
  String get adminRepoSortNameAsc => 'Азбучни редослед (А–Ш)';

  @override
  String get adminRepoSortNameDesc => 'Азбучни редослед (Ш–А)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Учитавање аналитике сервера... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Према извору';

  @override
  String get imdbTop250Movies => 'ИМДб 250 најбољих филмова';

  @override
  String get imdbTop250TvShows => 'ИМДб 250 најбољих ТВ серија';

  @override
  String get imdbMostPopularMovies => 'ИМДб најпопуларнији филмови';

  @override
  String get imdbMostPopularTvShows => 'ИМДб најпопуларније ТВ серије';

  @override
  String get imdbLowestRatedMovies => 'ИМДб најслабије оцењени филмови';

  @override
  String get imdbTopEnglishMovies =>
      'ИМДб најбоље оцењени филмови на енглеском језику';

  @override
  String get addToWatchlist => 'Додај на листу за гледање';

  @override
  String get removeFromWatchlist => 'Уклони са листе за гледање';

  @override
  String get watchlistUpdateFailed => 'Ажурирање листе за гледање није успело';

  @override
  String get adminSearchParameters => 'Параметри претраге';

  @override
  String get adminCurrentMetadata => 'Тренутни метаподаци';

  @override
  String get adminLabelYear => 'Година';

  @override
  String get adminReplaceImages => 'Замени постојеће слике';

  @override
  String get adminBackToSearch => 'Назад на критеријуме претраге';

  @override
  String get grouping => 'Груписање';

  @override
  String get groupByType => 'Групиши по типу';

  @override
  String get playlistTypes => 'Типови плејлиста';

  @override
  String get playlistTypeVideo => 'Видео';

  @override
  String get playlistTypeMusicVideo => 'Музички спот';

  @override
  String get playlistTypeAudio => 'Аудио (музика)';

  @override
  String get playlistTypeAudiobook => 'Аудио-књига';

  @override
  String get playlistTypeBook => 'Књига';

  @override
  String get playlistTypePhoto => 'Фотографија';

  @override
  String get playlistTypeMixed => 'Мешовито';

  @override
  String get videoPlaylistsSection => 'Видео-плејлисте';

  @override
  String get musicVideoPlaylistsSection => 'Плејлисте музичких спотова';

  @override
  String get audioPlaylistsSection => 'Аудио-плејлисте';

  @override
  String get audiobookPlaylistsSection => 'Плејлисте аудио-књига';

  @override
  String get bookPlaylistsSection => 'Плејлисте књига';

  @override
  String get photoPlaylistsSection => 'Фото-плејлисте';

  @override
  String get mixedPlaylistsSection => 'Мешовите плејлисте';

  @override
  String get currentTime => 'Тренутно време';

  @override
  String get playbackTimeDisplay => 'Време на траци напретка';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Изаберите које се ознаке времена приказују око траке напретка репродукције.';

  @override
  String get playbackTimeTotal => 'Укупно трајање';

  @override
  String get playbackTimeRemaining => 'Преостало време';

  @override
  String get playbackTimeEndsAt => 'Завршава се у';

  @override
  String get playbackTimeElapsed => 'Протекло време';

  @override
  String get playbackTimeVideoSection => 'Видео-плејер';

  @override
  String get playbackTimeMusicSection => 'Музички плејер';

  @override
  String get playbackTimeSlotDescription =>
      'Изаберите шта ће се овде приказивати или сакријте приказ.';

  @override
  String get playbackTimeAboveBarLeft => 'Изнад траке, лево';

  @override
  String get playbackTimeAboveBarCenter => 'Изнад траке, у средини';

  @override
  String get playbackTimeAboveBarRight => 'Изнад траке, десно';

  @override
  String get playbackTimeBelowBarLeft => 'Испод траке, лево';

  @override
  String get playbackTimeBelowBarCenter => 'Испод траке, у средини';

  @override
  String get playbackTimeBelowBarRight => 'Испод траке, десно';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Изаберите шта се приказује са десне стране траке напретка музике.';

  @override
  String get groupByTitle => 'Групиши по';

  @override
  String get groupByDecade => 'Деценија (година)';

  @override
  String get groupByParentalRating => 'Родитељска оцена';

  @override
  String get groupByStudio => 'Студио';

  @override
  String get showAlphabeticalFilters => 'Прикажи абецеду';

  @override
  String get libraryFolderView => 'Folder View';

  @override
  String get personalRatingStyle => 'Стил личне оцене';

  @override
  String get personalRatingThumbs => 'Свиђа ми се / не свиђа ми се';

  @override
  String get personalRatingStars => '5 звездица';

  @override
  String get personalRatingNumeric => 'Нумеричка оцена од 10';

  @override
  String get rate => 'Оцени';

  @override
  String get like => 'Свиђа ми се';

  @override
  String get dislike => 'Не свиђа ми се';

  @override
  String get personalRatingClear => 'Уклони оцену';

  @override
  String get personalRatingRated => 'Оцењено';

  @override
  String get personalRatingMine => 'Моја оцена';

  @override
  String get personalRatingSaveFailed => 'Чување оцене није успело';

  @override
  String get increase => 'Повећај';

  @override
  String get decrease => 'Смањи';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'Започето';

  @override
  String get filterUnreleased => 'Још није објављено';

  @override
  String get filterTrailers => 'Трејлери';

  @override
  String get filterExtras => 'Додатни садржаји';

  @override
  String get filterThemeSongs => 'Уводне песме';

  @override
  String get filterThemeVideos => 'Уводни видео-садржаји';

  @override
  String get source => 'Извор';

  @override
  String get years => 'Године';

  @override
  String get audioLanguage => 'Језик аудио-записа';

  @override
  String get subtitleLanguage => 'Језик титлова';

  @override
  String get clearFilters => 'Обриши филтере';

  @override
  String get seerrShortcutsRow => 'Прегледање услуге Сер (Seerr)';

  @override
  String get seerrReleased => 'Датум објављивања';

  @override
  String get seerrMinRating => 'Најнижа оцена';

  @override
  String get seerrMinVotes => 'Најмањи број гласова';

  @override
  String get seerrOriginalLanguage => 'Изворни језик';

  @override
  String get seerrRuntime => 'Трајање';

  @override
  String get subtitleHdrSeparate => 'Посебан стил за ХДР (HDR)';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'Бела боја је у ХДР-у (HDR) знатно светлија него у СДР-у (SDR), па ће тамнији стил овде смањити одсјај';

  @override
  String get scrollSensitivity => 'Осетљивост померања';

  @override
  String get scrollSensitivitySubtitle =>
      'Колико далеко се помери садржај једним зарезом точкића миша';

  @override
  String get mediaDetailsAndSpoilers => 'Детаљи о медијима и спојлери';

  @override
  String get openTrailersExternally => 'Отварај трејлере у спољној апликацији';

  @override
  String get openTrailersExternallySubtitle =>
      'Трејлери се отварају у апликацији Јутјуб (YouTube) или прегледачу, уместо у уграђеном плејеру';

  @override
  String get hideDetailsMediaDescription =>
      'Сакриј опис медија на страници са детаљима';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Сакриј описни текст филма или епизоде.';

  @override
  String get detailUseSeriesThumbnails =>
      'Користи сличице серије на страници са детаљима';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Замени све сличице на класичној страници са детаљима сличицом серије';

  @override
  String get hideHomeMediaDescription =>
      'Сакриј опис медија на почетном екрану';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Сакриј описни текст филма или епизоде.';

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
  String get continueWatchingAndNextUpHeader => 'Настави гледање и следеће';

  @override
  String get setupSkip => 'Прескочи подешавање';

  @override
  String get setupNavbarQuestion => 'Где желите да се налази навигација?';

  @override
  String get setupMediaBarQuestion =>
      'Како желите да изгледа врх почетног екрана?';

  @override
  String get setupHomeRowsQuestion => 'Како желите да изгледају редови?';

  @override
  String get setupDetailQuestion =>
      'Како желите да изгледа филм или серија када га отворите?';

  @override
  String get setupTourQuestion =>
      'Све је спремно. Погледајте шта вас још чека.';

  @override
  String get setupPlaybackLanguages => 'Језици репродукције';

  @override
  String get setupOptional => 'Опционо';

  @override
  String get setupStyleClassic => 'Класични';

  @override
  String get setupStyleModern => 'Модерни';

  @override
  String get setupRowsClassicHint =>
      'Компактан приказ. Више редова истовремено на екрану.';

  @override
  String get setupRowsModernHint => 'Веће картице са насловима испод.';

  @override
  String get setupDetailClassicHint => 'Сав садржај поређан у једном низу.';

  @override
  String get setupDetailModernHint =>
      'Кинематографски приказ, са картицама за глумце и додатне садржаје.';

  @override
  String get setupStyleSpotlight => 'У центру пажње';

  @override
  String get setupDetailSpotlightHint =>
      'У првом плану је главни садржај, уз искачуће картице за глумце и додатне садржаје.';

  @override
  String get setupStyleNouveau => 'Ново';

  @override
  String get setupDetailNouveauHint =>
      'Преко целог екрана, са одељцима поређаним један испод другог уместо картица.';

  @override
  String get setupStyleMinimalist => 'Минималистички';

  @override
  String get setupDetailMinimalistHint =>
      'Илустрација, једно дугме за репродукцију и епизоде.';

  @override
  String get setupNavbarStyleQuestion => 'Како желите да изгледа доња трака?';

  @override
  String get setupNavbarStyleDockHint =>
      'Плутајућа трака у облику пилуле, са натписом испод сваке картице.';

  @override
  String get setupNavbarStyleSplitHint =>
      'Претрага има засебно дугме, а трака се смањује док померате садржај.';

  @override
  String get setupNavbarStyleStripHint => 'Трака целом ширином дуж доње ивице.';

  @override
  String get setupPickALook => 'Изаберите изглед';

  @override
  String get setupTourMoreHeader => 'Још много тога вас чека у подешавањима';

  @override
  String get setupTourBulletRequests => 'Захтеви преко услуге Сер (Seerr)';

  @override
  String get setupTourBulletSyncPlay =>
      'Заједничко гледање уз синхронизацију (SyncPlay)';

  @override
  String get setupTourBulletThemes => 'Прилагођене теме';

  @override
  String get setupTourBulletDownloads => 'Преузимање за гледање ван мреже';

  @override
  String get setupTourBulletMore => 'И још много тога';

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
  String get runSetupAgain => 'Поново покрени подешавање';

  @override
  String get serverMessages => 'Поруке';

  @override
  String get serverMessagesEmpty => 'Још увек нема порука са вашег сервера';

  @override
  String get serverMessagesMarkAllRead => 'Означи све као прочитано';

  @override
  String get serverMessagesShowButton => 'Прикажи дугме за поруке';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Додаје у мени дугме за поруке које шаље администратор вашег сервера';

  @override
  String get showBookDiscoverTab =>
      'Прикажи откривање садржаја у библиотеци књига';

  @override
  String get showBookDiscoverTabDescription =>
      'Прегледајте наслове са сервиса Опен лајбрари (Open Library) и ЛибриВокс (LibriVox) у библиотекама књига и аудио-књига';

  @override
  String get autoDownloadNewEpisodes => 'Аутоматски преузимај нове епизоде';

  @override
  String get autoDownloadStop => 'Заустави аутоматско преузимање';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Преузима нове епизоде, највише $count непрегледаних одједном',
      one: 'Преузима нове епизоде, највише 1 непрегледану одједном',
      zero: 'Преузима сваку нову епизоду',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'Укључено • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Транскодирани квалитети преузимају се само док је Мунфин (Moonfin) отворен. Оригинални квалитет се преузима и у позадини.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'Транскодирана преузимања не могу да се наставе након прекида, већ почињу испочетка. Преузимање у оригиналном квалитету може да се настави.';

  @override
  String get autoDownloadForegroundOnly =>
      'Преузима се само док је Мунфин (Moonfin) отворен';

  @override
  String get autoDownloadQualityTitle => 'Квалитет аутоматског преузимања';

  @override
  String autoDownloadEnabledFor(String title) {
    return 'Аутоматско преузимање је укључено за $title';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return 'Аутоматско преузимање је заустављено за $title';
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
  String get autoDownloadSection => 'Аутоматска преузимања';

  @override
  String get autoDownloadEnable => 'Укључи аутоматска преузимања';

  @override
  String get autoDownloadEnableSubtitle =>
      'Преузима нове епизоде серија које пратите. Постојеће епизоде и даље можете да преузимате ручно.';

  @override
  String get autoDownloadKeepUnwatched => 'Задржи непрегледане епизоде';

  @override
  String get autoDownloadKeepAll => 'Све';

  @override
  String get autoDownloadDelete => 'Обриши преузете епизоде';

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
  String get autoDownloadDeleteNever => 'Никада';

  @override
  String get autoDownloadDeleteImmediately => 'Одмах након гледања';

  @override
  String get autoDownloadDeleteAfterDay => '1 дан након гледања';

  @override
  String get autoDownloadDeleteAfterWeek => '1 недеља након гледања';

  @override
  String get autoDownloadBackgroundRefresh => 'Проверавај у позадини';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Дозволи систему да повремено проверава има ли нових епизода док је Мунфин (Moonfin) затворен';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Освежавање апликације у позадини је онемогућено за Мунфин (Moonfin). Омогућите га у подешавањима иОС-а (iOS).';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Употреба Мунфина (Moonfin) у позадини ограничена је у подешавањима Андроида (Android).';

  @override
  String get autoDownloadCheckNow => 'Провери сада';

  @override
  String get autoDownloadChecking => 'Провера у току...';

  @override
  String get autoDownloadNeverChecked => 'Још није проверено';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued епизода је стављено у ред',
      one: '1 епизода је стављена у ред',
      zero: 'ништа ново',
    );
    return 'Последња провера $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Последња провера $when није успела: $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Серије које пратите';

  @override
  String get autoDownloadNoSubscriptions =>
      'Отворите серију и у менију за преузимање изаберите „Аутоматски преузимај нове епизоде“';

  @override
  String get autoDownloadRemove => 'Престани да пратиш';

  @override
  String get autoDownloadStorageFull => 'Нема довољно простора за складиштење';

  @override
  String get autoDownloadWaitingForWifi => 'Чека се вај-фај (WiFi)';

  @override
  String get downloadNotificationRunning => 'Преузимање у току';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'Преузимање у току ($done/$total)';
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
      other: 'Преузимања су завршена',
      one: 'Преузимање је завршено',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name је сачувано за коришћење ван мреже';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ставки је сачувано за коришћење ван мреже',
      one: '1 ставка је сачувана за коришћење ван мреже',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count епизода',
      one: '1 епизода',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'Преузимање није успело';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Даљинска порука';

  @override
  String get serverMessagesNotificationReceived => 'Порука је примљена';

  @override
  String get downloadStorageLimitReached =>
      'Достигнуто је ограничење простора за складиштење. Ослободите простор или повећајте ограничење.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Нема довољно простора за складиштење: потребно је $needed, доступно је $free';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Нема довољно простора за нове епизоде';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count епизода чека да се ослободи простор.',
      one: '$name захтева $size.',
    );
    return '$_temp0 Ослободите простор или повећајте ограничење преузимања.';
  }

  @override
  String get pageTransitions => 'Прелази између страница';

  @override
  String get pageTransitionsSubtitle =>
      'Подешава трајање постепеног ишчезавања при преласку са странице на страницу';

  @override
  String get navigationSpeed => 'Брзина навигације';

  @override
  String get navigationSpeedSubtitle =>
      'Подешава брзину кретања показивача фокуса између ставки и редова';

  @override
  String get modernCardsTransitionSpeed => 'Брзина прелаза модерних картица';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Подешава брзину анимације при проширивању модерних картица у фокусу';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Одложи проширивање картица при брзом померању';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Сачека да се кретање фокуса заустави пре него што прошири модерне картице';

  @override
  String get animationSpeedExtraSlow => 'Изузетно споро';

  @override
  String get animationSpeedSlow => 'Споро';

  @override
  String get animationSpeedMedium => 'Средње';

  @override
  String get animationSpeedFast => 'Брзо';

  @override
  String get animationSpeedOff => 'Искључено';

  @override
  String get pageTransitionFadeNone => 'Без постепеног ишчезавања';

  @override
  String get pageTransitionFadeShort => 'Кратко постепено ишчезавање';

  @override
  String get pageTransitionFadeMedium => 'Средње постепено ишчезавање';

  @override
  String get pageTransitionFadeLong => 'Дуго постепено ишчезавање';

  @override
  String get siriRemoteSwipeSensitivity =>
      'Осетљивост додирне површине на превлачење';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'Колико се далеко помери фокус при сваком превлачењу по додирној површини даљинског управљача Сири (Siri)';

  @override
  String get appleTvHomeScreen => 'Почетни екран Епл ТВ-а (Apple TV)';

  @override
  String get topShelf => 'Горња полица';

  @override
  String get topShelfDescription =>
      'Садржај који се приказује изнад иконе Мунфина (Moonfin) на почетном екрану Епл ТВ-а (Apple TV) када је изабрана. Ово подешавање важи само за овај уређај.';

  @override
  String get topShelfLatestMedia => 'Најновији садржаји';

  @override
  String get topShelfAppBanner => 'Банер Мунфина (Moonfin)';

  @override
  String get keepVideoClearOfDynamicIsland =>
      'Не прекривај видео динамичким острвом';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'У пејзажном положају кућиште камере прекрива једну ивицу екрана. Ова опција помера слику тако да је кућиште не прекрива; то има утицаја само на видео-записе довољно широке да допиру до те ивице.';

  @override
  String get bottomNavbarStyle => 'Стил доње траке';

  @override
  String get bottomNavbarStyleDock => 'Док';

  @override
  String get bottomNavbarStyleSplit => 'Подељено';

  @override
  String get bottomNavbarStyleStrip => 'Трака';

  @override
  String get bottomNavbarTabs => 'Картице доње траке';

  @override
  String get bottomNavbarTabsDescription =>
      'Закачите до 3 картице између одељака „Почетна“ и „Ви“. Све остало је у чворишту доње траке.';

  @override
  String get bottomNavbarTabsAutomatic => 'Аутоматски';

  @override
  String get bottomNavbarTabsPinned => 'Закачено';

  @override
  String get bottomNavbarTabsAvailable => 'Доступно';

  @override
  String get bottomNavbarTabsReset => 'Врати на аутоматски избор';

  @override
  String get bottomNavbarTabsLimit =>
      'Можете закачити највише 3 картице. Уклоните једну да бисте закачили другу.';

  @override
  String get bottomNavbarTabTurnedOff => 'Искључено у одељку „Дугмад“';

  @override
  String get bottomNavbarSplitSearchNote =>
      'У стилу „Подељено“, претрага увек има засебно дугме.';

  @override
  String get bottomNavbarButtonsNote =>
      'Овде одређујете шта се приказује у чворишту доње траке и које картице можете да закачите на доњу траку. Картице које су већ на траци нису наведене овде.';

  @override
  String get navYou => 'Ви';

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
  String get integrations => 'Интеграције';

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
