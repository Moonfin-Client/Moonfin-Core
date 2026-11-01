// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

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
  String get interfaceLanguage => 'زبان رابط کاربری';

  @override
  String get systemLanguageDefault => 'پیش‌فرض سیستم';

  @override
  String get signIn => 'وارد شوید';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'خالی';

  @override
  String connectingToServer(String serverName) {
    return 'در حال اتصال به $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'رمز عبور';

  @override
  String get username => 'نام کاربری';

  @override
  String get email => 'ایمیل';

  @override
  String get quickConnectInstruction =>
      'این کد را در داشبورد وب سرور خود وارد کنید:';

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
  String get waitingForAuthorization => 'در انتظار مجوز...';

  @override
  String get back => 'بازگشت';

  @override
  String get serverUnavailable => 'سرور در دسترس نیست';

  @override
  String get loginFailed => 'ورود ناموفق بود';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect در دسترس نیست: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect در دسترس نیست ($status): $detail';
  }

  @override
  String get whosWatching => 'چه کسی تماشا می کند؟';

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
  String get addUser => 'افزودن کاربر';

  @override
  String get selectServer => 'سرور را انتخاب کنید';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin نسخه $version';
  }

  @override
  String get savedServers => 'سرورهای ذخیره شده';

  @override
  String get discoveredServers => 'سرورهای کشف شده';

  @override
  String get noneFound => 'هیچ کدام پیدا نشد';

  @override
  String get unableToConnectToServer => 'امکان اتصال به سرور وجود ندارد';

  @override
  String get addServer => 'افزودن سرور';

  @override
  String get embyConnect => 'Emby وصل شوید';

  @override
  String get removeServer => 'سرور را حذف کنید';

  @override
  String removeServerConfirmation(String serverName) {
    return '\"$serverName\" از سرورهای شما حذف شود؟';
  }

  @override
  String get cancel => 'لغو کنید';

  @override
  String get remove => 'حذف';

  @override
  String get connectToServer => 'به سرور متصل شوید';

  @override
  String get serverAddress => 'آدرس سرور';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'اتصال';

  @override
  String get secureStorageUnavailable => 'فضای ذخیره‌سازی امن در دسترس نیست';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin نمی‌تواند به کلید سیستم شما دسترسی پیدا کند. ورود به سیستم می‌تواند ادامه یابد، اما ذخیره رمز ایمن ممکن است تا زمانی که قفل کلید باز نشود، در دسترس نباشد.';

  @override
  String get ok => 'باشه';

  @override
  String get settingsAppearanceTheme => 'تم برنامه';

  @override
  String get detailScreenStyle => 'سبک صفحه جزئیات';

  @override
  String get detailScreenStyleSubtitle =>
      'کلاسیک همان چیدمان وسط‌چین اصلی Moonfin است. مدرن یک چیدمان سینمایی واکنش‌گراست.';

  @override
  String get detailScreenStyleMoonfin => 'کلاسیک';

  @override
  String get detailScreenStyleModern => 'مدرن';

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
  String get expandedTabs => 'برگه‌های گسترده';

  @override
  String get expandedTabsSubtitle =>
      'محتوای هر برگه هنگام مرور برگه‌ها به‌طور خودکار نمایش داده می‌شود. برای باز و بستن دستی هر برگه، این گزینه را خاموش کنید.';

  @override
  String get showTechnicalDetails => 'نمایش جزئیات فنی؟';

  @override
  String get showTechnicalDetailsSubtitle =>
      'نمایش کدک، وضوح و اطلاعات جریان در خلاصه بنر';

  @override
  String get recommendationSystem => 'سیستم پیشنهاد';

  @override
  String get recommendationSystemSubtitle =>
      'از الگوریتم کتابخانه محلی Moonfin Recommends یا سنجه‌های شباهت آنلاین TMDb استفاده کنید. توجه: پیشنهادهای آنلاین به یکپارچه‌سازی Seerr نیاز دارند.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'شباهت TMDb';

  @override
  String get recommendationsApplyParentalRatingCap => 'اعمال سقف رده‌بندی سنی؟';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'محدود کردن پیشنهادهای Moonfin Recommends بر اساس رده‌بندی سنی رسانه هدف';

  @override
  String get interfaceStyle => 'سبک رابط کاربری';

  @override
  String get interfaceStyleSubtitle =>
      'خودکار با دستگاه شما هماهنگ می‌شود. برای اعمال اجباری یک ظاهر، Apple یا Material را انتخاب کنید.';

  @override
  String get interfaceStyleAutomatic => 'خودکار';

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
  String get glassQuality => 'کیفیت شیشه';

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
      'خودکار بهترین جلوه شیشه‌ای را برای این دستگاه انتخاب می‌کند. کامل محوشدگی واقعی را اعمال می‌کند؛ کاهش‌یافته از شیشه‌ای سبک استفاده می‌کند که در مصرف GPU صرفه‌جویی می‌کند.';

  @override
  String get glassQualityAuto => 'خودکار';

  @override
  String get glassQualityFull => 'کامل';

  @override
  String get glassQualityReduced => 'کاهش‌یافته';

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
      'جابه‌جایی بین Moonfin و Neon Pulse بدون راه‌اندازی مجدد برنامه';

  @override
  String get customThemeTitle => 'تم سفارشی';

  @override
  String get customThemeSubtitle =>
      'تم‌های سفارشی عناصر بصری را در سراسر Moonfin تغییر می‌دهند. یکی از این گزینه‌ها را متناسب با سلیقه خود انتخاب کنید.';

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
      'ظاهر Moonfin کنونی که همه شما عاشق آن شده اید';

  @override
  String get themeNeonPulse => 'نئون پالس';

  @override
  String get themeNeonPulseSubtitle =>
      'استایل سینت ویو با درخشش سرخابی، متن فیروزه‌ای و کنتراست کروم قوی‌تر';

  @override
  String get themeGlass => 'شیشه';

  @override
  String get themeGlassSubtitle =>
      'استایل شیشه مایع با پس‌زمینه گرادیانی متحرک، سطوح مات و رنگ تأکیدی آبی Apple';

  @override
  String get theme8BitHero => 'قهرمان 8-بیتی';

  @override
  String get theme8BitHeroSubtitle =>
      'استایل پیکسل‌آرت رترو با پالت درشت، حاشیه‌های بلوکی، سایه‌های تیز و فونت پیکسلی';

  @override
  String get embyConnectSignInSubtitle => 'با اکانت Connect Emby خود وارد شوید';

  @override
  String get emailOrUsername => 'ایمیل یا نام کاربری';

  @override
  String get selectAServer => 'یک سرور را انتخاب کنید';

  @override
  String get tryAgain => 'دوباره امتحان کنید';

  @override
  String get noLinkedServers =>
      'هیچ سروری به این حساب Emby پیوند داده نشده است';

  @override
  String get invalidEmbyConnectCredentials => 'نامعتبر Emby اعتبارنامه اتصال';

  @override
  String get invalidEmbyConnectLogin =>
      'نام کاربری یا رمز عبور Emby نامعتبر است';

  @override
  String get embyConnectExchangeNotSupported =>
      'سرور Emby تبادل تبادل را پشتیبانی نمی‌کند';

  @override
  String get embyConnectNetworkError =>
      'خطای شبکه هنگام تماس با Emby اتصال یا سرور انتخابی';

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
  String get loadingLinkedServers => 'در حال بارگیری سرورهای مرتبط...';

  @override
  String get connectingToServerEllipsis => 'در حال اتصال به سرور...';

  @override
  String get noReachableAddress => 'آدرس قابل دسترسی ارائه نشده است';

  @override
  String get invalidServerExchangeResponse =>
      'پاسخ نامعتبر از نقطه پایانی تبادل سرور';

  @override
  String unableToConnectTo(String target) {
    return 'اتصال به $target ممکن نیست';
  }

  @override
  String get exitApp => 'از Moonfin خارج شوید؟';

  @override
  String get exitAppConfirmation => 'آیا مطمئن هستید که می خواهید خارج شوید؟';

  @override
  String get exit => 'خارج شوید';

  @override
  String get gameMenu => 'منو';

  @override
  String get gamePaused => 'متوقف شده';

  @override
  String get gameSaveState => 'ذخیره وضعیت';

  @override
  String get games => 'بازی‌ها';

  @override
  String get gameLoadState => 'بارگذاری وضعیت';

  @override
  String get gameFastForward => 'جلو بردن سریع';

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
  String get gameEmulatorSettings => 'تنظیمات شبیه‌ساز';

  @override
  String get gameNoCoreOptions => 'این هسته گزینه قابل تنظیمی ندارد.';

  @override
  String get gameHoldToOpenMenu => 'برای باز کردن منو نگه دارید';

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
      'اجرای بازی هنوز روی این دستگاه پشتیبانی نمی‌شود.';

  @override
  String get noHomeRowsLoaded => 'هیچ ردیف خانه بارگیری نشد';

  @override
  String get noHomeRowsHint =>
      'سعی کنید بخش‌های فعال خانه را به‌روزرسانی یا کاهش دهید.';

  @override
  String get retryHomeRows => 'سطرهای صفحه اصلی را دوباره امتحان کنید';

  @override
  String get guide => 'راهنما';

  @override
  String get recordings => 'ضبط‌ها';

  @override
  String get schedule => 'برنامه ریزی کنید';

  @override
  String get series => 'سریال‌ها';

  @override
  String get noItemsFound => 'هیچ موردی یافت نشد';

  @override
  String get home => 'صفحه اصلی';

  @override
  String get browseAll => 'مرور همه';

  @override
  String get genres => 'ژانرها';

  @override
  String get collectionPlaceholder => 'موارد مجموعه در اینجا ظاهر می شوند';

  @override
  String get browseByLetter => 'مرور بر اساس نامه';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'مرور بر اساس حروف الفبا در اینجا ظاهر می شود';

  @override
  String get suggestions => 'پیشنهادات';

  @override
  String get suggestionsPlaceholder => 'موارد پیشنهادی در اینجا ظاهر می شوند';

  @override
  String get failedToLoadLibraries => 'کتابخانه ها بارگیری نشد';

  @override
  String get noLibrariesFound => 'هیچ کتابخانه ای یافت نشد';

  @override
  String get library => 'کتابخانه';

  @override
  String get displaySettings => 'تنظیمات نمایش';

  @override
  String get allGenres => 'همه ژانرها';

  @override
  String get noGenresFound => 'هیچ ژانری پیدا نشد';

  @override
  String failedToLoadFolderError(String error) {
    return 'پوشه بارگیری نشد: $error';
  }

  @override
  String get thisFolderIsEmpty => 'این پوشه خالی است';

  @override
  String itemCountLabel(int count) {
    return '$count موارد';
  }

  @override
  String get failedToLoadFavorites => 'موارد دلخواه بارگیری نشد';

  @override
  String get retry => 'دوباره امتحان کنید';

  @override
  String get noFavoritesYet => 'هنوز موارد دلخواه وجود ندارد';

  @override
  String get favorites => 'موارد دلخواه';

  @override
  String totalCountItems(int count) {
    return '$count موارد';
  }

  @override
  String get continuing => 'ادامه دارد';

  @override
  String get ended => 'پایان یافت';

  @override
  String get sortAndFilter => 'مرتب سازی و فیلتر کردن';

  @override
  String get type => 'تایپ کنید';

  @override
  String get sortBy => 'مرتب سازی بر اساس';

  @override
  String get display => 'نمایش';

  @override
  String get imageType => 'نوع تصویر';

  @override
  String get posterSize => 'اندازه پوستر';

  @override
  String get small => 'کوچک';

  @override
  String get medium => 'متوسط';

  @override
  String get large => 'بزرگ';

  @override
  String get extraLarge => 'فوق العاده بزرگ';

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
    return '$name - ​​ژانرها';
  }

  @override
  String get views => 'بازدیدها';

  @override
  String get albums => 'آلبوم ها';

  @override
  String get albumArtists => 'هنرمندان آلبوم';

  @override
  String get artists => 'هنرمندان';

  @override
  String get bookmarks => 'نشانک ها';

  @override
  String get noSavedBookmarks =>
      'هنوز هیچ نشانک ذخیره ای برای این عنوان وجود ندارد.';

  @override
  String get openBook => 'کتاب را باز کنید';

  @override
  String get chapter => 'فصل';

  @override
  String get page => 'صفحه';

  @override
  String get bookmark => 'نشانک';

  @override
  String get justNow => 'همین الان';

  @override
  String minutesAgo(int count) {
    return '$count دقیقه پیش';
  }

  @override
  String hoursAgo(int count) {
    return '$count ساعت قبل';
  }

  @override
  String daysAgo(int count) {
    return '$count روز قبل';
  }

  @override
  String get discoverySubjects => 'موضوعات کشفی';

  @override
  String get apply => 'اعمال';

  @override
  String get openLink => 'پیوند را باز کنید';

  @override
  String get scanWithYourPhone => 'با گوشی خود اسکن کنید';

  @override
  String get audiobookGenres => 'ژانرهای کتاب صوتی';

  @override
  String get scrollLeft => 'به سمت چپ حرکت کنید';

  @override
  String get scrollRight => 'به سمت راست پیمایش کنید';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre => 'در حال حاضر این ژانر بارگیری نشد.';

  @override
  String get continueReading => 'به خواندن ادامه دهید';

  @override
  String get savedHighlights => 'نکات برجسته ذخیره شده';

  @override
  String get continueListening => 'به گوش دادن ادامه دهید';

  @override
  String get listen => 'گوش کن';

  @override
  String get resume => 'ادامه';

  @override
  String get failedToLoadLibrary => 'کتابخانه بارگیری نشد';

  @override
  String get popularNow => 'محبوب در حال حاضر';

  @override
  String get savedForLater => 'ذخیره شده برای بعد';

  @override
  String get topListens => 'برترین ها';

  @override
  String get unreadDiscoveries => 'اکتشافات خوانده نشده';

  @override
  String get pickUpAgain => 'دوباره انتخاب کنید';

  @override
  String get bookHighlightsDescription =>
      'کتاب‌های شما با نکات برجسته، موارد دلخواه یا پیشرفت خواندن.';

  @override
  String get handPickedFromLibrary => 'دستچین شده از کتابخانه شما.';

  @override
  String get handPickedFromListeningQueue =>
      'به صورت دستی از صف شنیداری شما انتخاب شده است.';

  @override
  String get booksWithHighlights =>
      'کتاب هایی با نکات برجسته، موارد دلخواه یا پیشرفت خواندن.';

  @override
  String get jumpBackNarration => 'بدون شکار مکان خود به روایت برگردید.';

  @override
  String get unreadBooksReady =>
      'کتاب های خوانده نشده آماده برای ساعت آرام بعدی.';

  @override
  String get quickAccessFavorites =>
      'دسترسی سریع به کتاب‌هایی که مدام به آنها سر می‌زنید.';

  @override
  String get searchAudiobooks => 'جستجوی کتاب های صوتی';

  @override
  String get searchYourLibrary => 'کتابخانه خود را جستجو کنید';

  @override
  String get pickUpStory => 'داستان را از جایی که متوقف کردید ادامه دهید';

  @override
  String get savedPlacesChapters => 'مکان های ذخیره شده و فصل های ناتمام شما';

  @override
  String authorsCount(int count) {
    return '$count نویسندگان';
  }

  @override
  String genresCount(int count) {
    return 'ژانرهای $count';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% تکمیل شد';
  }

  @override
  String get readyWhenYouAre => 'آماده وقتی که هستید';

  @override
  String get details => 'جزئیات';

  @override
  String get listeningRoom => 'اتاق گوش دادن';

  @override
  String get bookmarksAndProgress => 'نشانک‌ها و پیشرفت';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'عناوین $count برای خواندن در ابتدا مرتب شده اند.';
  }

  @override
  String get titles => 'عناوین';

  @override
  String get allTitles => 'همه عناوین';

  @override
  String get authors => 'نویسندگان';

  @override
  String get browseByAuthor => 'مرور بر اساس نویسنده';

  @override
  String get browseByGenre => 'مرور بر اساس ژانر';

  @override
  String get discover => 'کشف کنید';

  @override
  String get noBookmarkedItems => 'هنوز هیچ مورد نشانک گذاری شده ای وجود ندارد';

  @override
  String get nothingMatchesSection =>
      'هنوز چیزی با این بخش مطابقت ندارد. برگه دیگری را امتحان کنید یا پس از پایان همگام سازی کتابخانه برگردید.';

  @override
  String get audiobooks => 'کتاب های صوتی';

  @override
  String noLabelFound(String label) {
    return '$label یافت نشد';
  }

  @override
  String get folder => 'پوشه';

  @override
  String get filters => 'فیلترها';

  @override
  String get readingStatus => 'وضعیت خواندن';

  @override
  String get playedStatus => 'وضعیت پخش شده';

  @override
  String get readStatus => 'بخوانید';

  @override
  String get watched => 'تماشا شده';

  @override
  String get unread => 'خوانده نشده';

  @override
  String get unwatched => 'تماشا نشده';

  @override
  String get seriesStatus => 'وضعیت سریال';

  @override
  String get allLibraries => 'همه کتابخانه ها';

  @override
  String get books => 'کتاب ها';

  @override
  String get latestBooks => 'جدیدترین کتاب‌ها';

  @override
  String get latestAudiobooks => 'جدیدترین کتاب‌های صوتی';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کتاب',
      one: '1 کتاب',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'کتاب';

  @override
  String get bookFormatAudiobook => 'کتاب صوتی';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'هیچ کتابی برای این نویسنده یافت نشد.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% خوانده شده';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time باقی‌مانده';
  }

  @override
  String get bookHeroRead => 'خواندن';

  @override
  String get bookHeroListen => 'شنیدن';

  @override
  String get author => 'نویسنده';

  @override
  String get unknownAuthor => 'نویسنده ناشناس';

  @override
  String get uncategorized => 'دسته بندی نشده';

  @override
  String get overview => 'نمای کلی';

  @override
  String get noLibrivoxDescription =>
      'هنوز هیچ توضیحی توسط LibriVox برای این عنوان ارائه نشده است.';

  @override
  String get readers => 'خوانندگان';

  @override
  String get openLinks => 'پیوندها را باز کنید';

  @override
  String get librivoxPage => 'صفحه LibriVox';

  @override
  String get internetArchive => 'آرشیو اینترنت';

  @override
  String get rssFeed => 'فید RSS';

  @override
  String get downloadZip => 'زیپ را دانلود کنید';

  @override
  String sectionCountLabel(int count) {
    return 'بخش‌های $count';
  }

  @override
  String firstPublished(int year) {
    return 'اولین بار منتشر شد $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'هنوز نمای کلی از Open Library برای این عنوان موجود نیست.';

  @override
  String get subjects => 'موضوعات';

  @override
  String get all => 'همه';

  @override
  String booksCount(int count) {
    return '$count کتاب';
  }

  @override
  String get couldNotLoadSubject =>
      'در حال حاضر نمی توان این موضوع را بارگیری کرد.';

  @override
  String get audiobookDetails => 'جزئیات کتاب صوتی';

  @override
  String authorsCountTitle(int count) {
    return '$count نویسندگان';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کتاب صوتی',
      one: '1 کتاب صوتی',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'فهرست آهنگ';

  @override
  String get itemListPlaceholder => 'لیست موارد در اینجا ظاهر می شود';

  @override
  String get failedToLoad => 'بارگیری نشد';

  @override
  String get delete => 'حذف';

  @override
  String get save => 'ذخیره';

  @override
  String get moreLikeThis => 'بیشتر شبیه این';

  @override
  String get castAndCrew => 'بازیگران و خدمه';

  @override
  String get collection => 'مجموعه';

  @override
  String get episodes => 'اپیزودها';

  @override
  String get nextUp => 'بعدی بالا';

  @override
  String get seasons => 'فصل‌ها';

  @override
  String get chapters => 'فصل ها';

  @override
  String get features => 'ویژگی ها';

  @override
  String get movies => 'فیلم ها';

  @override
  String get musicVideos => 'موزیک ویدیوها';

  @override
  String get other => 'دیگر';

  @override
  String get discography => 'دیسکوگرافی';

  @override
  String get similarArtists => 'هنرمندان مشابه';

  @override
  String get tableOfContents => 'فهرست مطالب';

  @override
  String get tracklist => 'فهرست آهنگ';

  @override
  String discNumber(int number) {
    return 'دیسک $number';
  }

  @override
  String get biography => 'بیوگرافی';

  @override
  String get authorDetails => 'مشخصات نویسنده';

  @override
  String get noOverviewAvailable =>
      'هنوز نمای کلی برای این عنوان در دسترس نیست.';

  @override
  String get noBiographyAvailable => 'بیوگرافی برای این نویسنده موجود نیست.';

  @override
  String get unableToLoadAuthorDetails =>
      'بارگیری جزئیات نویسنده در حال حاضر ممکن نیست.';

  @override
  String published(int year) {
    return 'منتشر شده $year';
  }

  @override
  String get publicationDateUnknown => 'تاریخ انتشار نامعلوم';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فصل',
      one: '1 فصل',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'پایان در $time';
  }

  @override
  String get items => 'موارد';

  @override
  String get extras => 'موارد اضافی';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'پشت صحنه';

  @override
  String get deletedScenes => 'صحنه‌های حذف‌شده';

  @override
  String get featurettes => 'ویژه‌برنامه‌ها';

  @override
  String get interviews => 'مصاحبه‌ها';

  @override
  String get scenes => 'صحنه‌ها';

  @override
  String get shorts => 'فیلم‌های کوتاه';

  @override
  String get trailers => 'تریلرها';

  @override
  String timeRemaining(String time) {
    return '$time باقی‌مانده';
  }

  @override
  String endsIn(String time) {
    return '$time تا پایان';
  }

  @override
  String get view => 'مشاهده کنید';

  @override
  String get resumeReading => 'ادامه خواندن';

  @override
  String get read => 'بخوانید';

  @override
  String resumeFrom(String position) {
    return 'رزومه از $position';
  }

  @override
  String get play => 'پخش';

  @override
  String get startOver => 'شروع دوباره';

  @override
  String get restart => 'راه اندازی مجدد';

  @override
  String get readOffline => 'آفلاین بخوانید';

  @override
  String get playOffline => 'بازی آفلاین';

  @override
  String get audio => 'صوتی';

  @override
  String get subtitles => 'زیرنویس';

  @override
  String get version => 'نسخه';

  @override
  String get cast => 'ارسال به دستگاه';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'تریلر';

  @override
  String get finished => 'تمام شد';

  @override
  String get favorited => 'مورد علاقه';

  @override
  String get favorite => 'مورد علاقه';

  @override
  String get playlist => 'لیست پخش';

  @override
  String get downloaded => 'دانلود شد';

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
  String get downloadAll => 'دانلود همه';

  @override
  String get download => 'دانلود کنید';

  @override
  String get deleteDownloaded => 'حذف دانلود شده';

  @override
  String get goToSeries => 'به سریال بروید';

  @override
  String get editMetadata => 'ویرایش متادیتا';

  @override
  String get less => 'کمتر';

  @override
  String get more => 'بیشتر';

  @override
  String get deleteItem => 'حذف مورد';

  @override
  String get deletePlaylist => 'حذف لیست پخش';

  @override
  String get deletePlaylistMessage => 'این لیست پخش از سرور حذف شود؟';

  @override
  String get deleteItemMessage => 'این مورد از سرور حذف شود؟';

  @override
  String get failedToDeletePlaylist => 'لیست پخش حذف نشد';

  @override
  String get failedToDeleteItem => 'مورد حذف نشد';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'تغییر نام لیست پخش';

  @override
  String get playlistName => 'نام لیست پخش';

  @override
  String get deleteDownloadedAlbum => 'حذف آلبوم دانلود شده';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'آهنگ های دانلود شده برای \"$title\" حذف شود؟';
  }

  @override
  String get downloadedTracksDeleted => 'آهنگ های دانلود شده حذف شدند';

  @override
  String get downloadedTracksDeleteFailed =>
      'برخی از آهنگ های دانلود شده حذف نشدند';

  @override
  String get noTracksLoaded => 'هیچ آهنگی بارگیری نشده است';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'هیچ $itemLabel بارگیری نشده است';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'در حال دانلود $title ($count موارد)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'آیا مطمئن هستید که می خواهید \"$name\" را از سرور حذف کنید؟ این عمل قابل لغو نیست.';
  }

  @override
  String get itemDeleted => 'مورد حذف شد';

  @override
  String get noPlayableTrailerFound => 'تریلر قابل پخش یافت نشد.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'قالب کتاب پشتیبانی نشده: .$extension';
  }

  @override
  String get audioTrack => 'آهنگ صوتی';

  @override
  String get subtitleTrack => 'آهنگ زیرنویس';

  @override
  String get none => 'هیچ‌کدام';

  @override
  String get downloadSubtitlesLabel => 'دانلود زیرنویس ...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'با استفاده از افزونه OpenSubtitles جستجو کنید';

  @override
  String get downloadSubtitles => 'دانلود زیرنویس';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'زیرنویس انتخاب شده نامعتبر است.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'زیرنویس دانلود و انتخاب شد: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'زیرنویس دانلود شد ممکن است زمانی که Jellyfin مورد را تازه می‌کند ظاهر شود.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'هیچ زیرنویس از راه دور برای $language یافت نشد.';
  }

  @override
  String get selectVersion => 'نسخه را انتخاب کنید';

  @override
  String versionNumber(int number) {
    return 'نسخه $number';
  }

  @override
  String get downloadAllQuality => 'دانلود همه - با کیفیت';

  @override
  String get downloadQuality => 'کیفیت دانلود';

  @override
  String get originalFileNoReencoding => 'فایل اصلی، بدون رمزگذاری مجدد';

  @override
  String get originalFilesNoReencoding => 'فایل های اصلی، بدون رمزگذاری مجدد';

  @override
  String get noEpisodesLoaded => 'هیچ قسمتی بارگذاری نشده است';

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
    return 'در حال دانلود $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'حذف فایل های دانلود شده';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'فایل‌های محلی برای $typeLabel حذف شود؟\n\nبا این کار فضای ذخیره سازی آزاد می شود. بعدا می توانید دوباره دانلود کنید.';
  }

  @override
  String get downloadedFilesDeleted => 'فایل های دانلود شده حذف شدند';

  @override
  String get failedToDeleteFiles => 'فایل ها حذف نشد';

  @override
  String get deleteFiles => 'حذف فایل ها';

  @override
  String get director => 'کارگردان';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'کارگردانان';

  @override
  String get writer => 'نویسنده';

  @override
  String get writers => 'نویسندگان';

  @override
  String get studio => 'استودیو';

  @override
  String studioMoreCount(int count) {
    return '+$count بیشتر';
  }

  @override
  String totalEpisodes(int count) {
    return '$count قسمت‌ها';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'قسمت $number';
  }

  @override
  String chapterNumber(int number) {
    return 'فصل $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قطعه',
      one: '1 قطعه',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فصل',
      one: '1 فصل',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'متولد $date';
  }

  @override
  String died(String date) {
    return 'درگذشت $date';
  }

  @override
  String age(int age) {
    return 'سن $age';
  }

  @override
  String get showLess => 'نمایش کمتر';

  @override
  String get readMore => 'ادامه مطلب';

  @override
  String get shuffle => 'پخش تصادفی';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'پخش تصادفی همه موسیقی‌ها';

  @override
  String get carSignInPrompt => 'در گوشی خود وارد Moonfin شوید';

  @override
  String get carServerUnreachable => 'دسترسی به سرور شما ممکن نیست';

  @override
  String downloadsCount(int count) {
    return '$count دانلودها';
  }

  @override
  String get perfectMatch => 'تطابق کامل';

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
  String get mono => 'مونو';

  @override
  String get stereo => 'استریو';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'زیرنویس از راه دور $action به مجوز مدیریت زیرنویس Jellyfin برای این کاربر نیاز دارد.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'این مورد در سرور زیرنویس از راه دور $action یافت نشد.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'زیرنویس از راه دور $action ناموفق بود: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'زیرنویس از راه دور $action ناموفق بود (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'زیرنویس‌های راه دور $action انجام نشد.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'همه قسمت های دانلود شده برای \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'تمام قسمت های دانلود شده در این فصل';

  @override
  String get stillWatching => 'هنوز در حال تماشای؟';

  @override
  String get unableToLoadTrailerStream => 'بارگیری جریان تریلر ممکن نیست.';

  @override
  String get trailerTimedOut => 'مهلت تریلر هنگام بارگیری تمام شد.';

  @override
  String get playbackFailedForTrailer => 'پخش این تریلر ناموفق بود.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'ارسال محتوا در حین پخش آفلاین در دسترس نیست.';

  @override
  String castActionFailed(String label, String error) {
    return '$label اقدام انجام نشد: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'تنظیم صدا پخش انجام نشد: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label کنترل‌ها';
  }

  @override
  String get deviceVolume => 'میزان صدای دستگاه';

  @override
  String get unavailable => 'در دسترس نیست';

  @override
  String get pause => 'مکث';

  @override
  String get syncPosition => 'موقعیت همگام سازی';

  @override
  String stopCast(String label) {
    return 'توقف $label';
  }

  @override
  String get queueIsEmpty => 'صف خالی است';

  @override
  String trackNumber(int number) {
    return 'پیگیری $number';
  }

  @override
  String get remotePlayback => 'پخش از راه دور';

  @override
  String get castingToGoogleCast => 'ارسال به Google Cast';

  @override
  String get castingViaAirPlay => 'ارسال از طریق AirPlay';

  @override
  String get castingViaDlna => 'ارسال از طریق DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds ثانیه';
  }

  @override
  String get longPressToUnlock => 'برای باز کردن قفل، طولانی فشار دهید';

  @override
  String get off => 'خاموش';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'خودکار';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps مگابیت بر ثانیه';
  }

  @override
  String get audioDelay => 'تاخیر صوتی';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'تاخیر در زیرنویس';

  @override
  String get reset => 'بازنشانی';

  @override
  String get unknown => 'ناشناس';

  @override
  String get playbackInformation => 'اطلاعات پخش';

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
  String get playback => 'پخش';

  @override
  String get playMethod => 'روش بازی';

  @override
  String get directPlay => 'پخش مستقیم';

  @override
  String get directStream => 'جریان مستقیم';

  @override
  String get transcoding => 'رمزگذاری';

  @override
  String get transcodeReasons => 'دلایل Transcode';

  @override
  String get player => 'پخش‌کننده';

  @override
  String get container => 'ظرف';

  @override
  String get bitrate => 'میزان بیت';

  @override
  String get video => 'ویدئو';

  @override
  String get resolution => 'قطعنامه';

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
  String get track => 'قطعه';

  @override
  String get channels => 'کانال ها';

  @override
  String get format => 'قالب';

  @override
  String get external => 'خارجی';

  @override
  String get embedded => 'تعبیه شده است';

  @override
  String castSessionError(String protocol) {
    return 'خطای جلسه $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'جزئیات کتاب بارگیری نشد: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'رندر درون‌برنامه‌ای EPUB هنوز در این پلتفرم در دسترس نیست.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'این قالب ($extension) را نمی‌توان در برنامه ارائه کرد.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'ارائه سند جاسازی شده در این پلت فرم در دسترس نیست.';

  @override
  String get couldNotOpenExternalViewer => 'نمایشگر خارجی باز نشد.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'خواننده درون برنامه باز نشد: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'نشانک قبلاً در $label ذخیره شده است.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'نشانک اضافه شد: $label';
  }

  @override
  String get noBookmarksYet =>
      'هنوز هیچ نشانکی وجود ندارد.\nهنگام خواندن روی نماد نشانک ضربه بزنید تا موقعیت خود را ذخیره کنید.';

  @override
  String get noTableOfContentsAvailable => 'فهرست مطالب موجود نیست';

  @override
  String pageLabel(int number) {
    return 'صفحه $number';
  }

  @override
  String get position => 'موقعیت';

  @override
  String get bookReader => 'کتابخوان';

  @override
  String formatExtension(String extension) {
    return 'قالب: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% خوانده شده است';
  }

  @override
  String get updating => 'در حال به روز رسانی...';

  @override
  String get markUnread => 'علامت گذاری به عنوان خوانده نشده';

  @override
  String get markAsRead => 'علامت گذاری به عنوان خوانده شده';

  @override
  String get reloadReader => 'بارگذاری مجدد کتاب‌خوان';

  @override
  String get noPagesFound => 'هیچ صفحه ای یافت نشد';

  @override
  String get failedToDecodePageImage => 'رمزگشایی تصویر صفحه انجام نشد.';

  @override
  String resetZoom(String zoom) {
    return 'بازنشانی بزرگنمایی (${zoom}x)';
  }

  @override
  String get singlePage => 'صفحه تک';

  @override
  String get twoPageSpread => 'پخش دو صفحه ای';

  @override
  String get addBookmark => 'اضافه کردن نشانک';

  @override
  String get bookmarksEllipsis => 'نشانک ها...';

  @override
  String get markedAsRead => 'به عنوان خوانده شده علامت گذاری شد';

  @override
  String get markedAsUnread => 'به عنوان خوانده نشده علامت گذاری شد';

  @override
  String failedToUpdateReadState(String error) {
    return 'وضعیت خواندن به‌روزرسانی نشد: $error';
  }

  @override
  String get themeSystem => 'موضوع: سیستم';

  @override
  String get themeLight => 'موضوع: نور';

  @override
  String get themeDark => 'موضوع: تاریک';

  @override
  String get themeSepia => 'موضوع: سپیا';

  @override
  String get invertColorsFixedLayout => 'معکوس کردن رنگ ها (طرح بندی ثابت)';

  @override
  String get invertColorsPdf => 'معکوس کردن رنگ ها (PDF)';

  @override
  String get preparingInAppReader => 'در حال آماده سازی خواننده درون برنامه...';

  @override
  String get pdfDataNotAvailable => 'داده های PDF در دسترس نیست.';

  @override
  String get readerFallbackModeActive => 'حالت بازگشتی خواننده فعال است';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'این پلتفرم نمی‌تواند موتور سند جاسازی شده را برای فایل‌های $extension میزبانی کند.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'پس از جابجایی به هدف پلتفرم پشتیبانی شده (Android، iOS، macOS) از Reload Reader استفاده کنید.';

  @override
  String get openExternally => 'به صورت خارجی باز کنید';

  @override
  String get noEpubChaptersFound => 'هیچ فصل EPUB یافت نشد.';

  @override
  String get readerNotReady => 'خواننده آماده نیست';

  @override
  String get seriesRecordings => 'ضبط های سریال';

  @override
  String get now => 'در حال حاضر';

  @override
  String get sports => 'ورزش';

  @override
  String get news => 'اخبار';

  @override
  String get kids => 'بچه ها';

  @override
  String get premiere => 'اولین نمایش';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'راهنمای جدول زمانی';

  @override
  String failedToLoadGuide(String error) {
    return 'راهنما بارگیری نشد: $error';
  }

  @override
  String get noChannelsFound => 'کانالی پیدا نشد';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'زنده';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'بعدی: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes دقیقه باقی‌مانده';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours ساعت باقی‌مانده';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours ساعت و $minutes دقیقه باقی‌مانده';
  }

  @override
  String get movie => 'فیلم';

  @override
  String get removedFromFavoriteChannels => 'از کانال های مورد علاقه حذف شد';

  @override
  String get addedToFavoriteChannels => 'به کانال های مورد علاقه اضافه شد';

  @override
  String get failedToUpdateFavoriteChannel => 'کانال دلخواه به‌روزرسانی نشد';

  @override
  String get unfavoriteChannel => 'کانال مورد علاقه';

  @override
  String get favoriteChannel => 'کانال مورد علاقه';

  @override
  String get record => 'ضبط';

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
  String get cancelRecordingAction => 'لغو ضبط';

  @override
  String get programSetToRecord => 'برنامه تنظیم شده برای ضبط';

  @override
  String get recordingCancelled => 'ضبط لغو شد';

  @override
  String get unableToCreateRecording => 'امکان ایجاد ضبط وجود ندارد';

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
  String get watch => 'تماشا';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'بستن';

  @override
  String failedToPlayChannel(String name) {
    return '$name پخش نشد';
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
  String get failedToLoadRecordings => 'موارد ضبط شده بارگیری نشد';

  @override
  String get scheduledInNext24Hours => 'در 24 ساعت آینده برنامه ریزی شده است';

  @override
  String get recentRecordings => 'ضبط های اخیر';

  @override
  String get tvSeries => 'سریال های تلویزیونی';

  @override
  String get failedToLoadSchedule => 'برنامه بارگیری نشد';

  @override
  String get noScheduledRecordings => 'هیچ ضبط برنامه ریزی شده ای وجود ندارد';

  @override
  String get cancelRecording => 'ضبط لغو شود؟';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'ضبط برنامه ریزی شده «$name» لغو شود؟';
  }

  @override
  String get no => 'خیر';

  @override
  String get yesCancel => 'بله، لغو';

  @override
  String get failedToCancelRecording => 'ضبط لغو نشد';

  @override
  String get failedToLoadSeriesRecordings => 'ضبط های سری بارگیری نشد';

  @override
  String get noSeriesRecordings => 'بدون ضبط سریال';

  @override
  String get cancelSeriesRecording => 'لغو ضبط سریال';

  @override
  String get cancelSeriesRecordingQuestion => 'ضبط سریال لغو شود؟';

  @override
  String stopRecordingName(String name) {
    return 'ضبط \"$name\" متوقف شود؟';
  }

  @override
  String get failedToCancelSeriesRecording => 'ضبط سریال لغو نشد';

  @override
  String get searchThisLibrary => 'جستجو در این کتابخانه...';

  @override
  String get searchEllipsis => 'جستجو...';

  @override
  String noResultsForQuery(String query) {
    return 'هیچ نتیجه ای برای \"$query\" وجود ندارد';
  }

  @override
  String searchFailedError(String error) {
    return 'جستجو ناموفق بود: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'نوع حساب Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'محلی';

  @override
  String get savedMedia => 'رسانه ذخیره شده';

  @override
  String get tvShows => 'برنامه های تلویزیونی';

  @override
  String get music => 'موسیقی';

  @override
  String get musicAlbums => 'آلبوم های موسیقی';

  @override
  String get noMediaInFilter => 'هیچ رسانه ای در این فیلتر وجود ندارد';

  @override
  String get noDownloadedMediaYet => 'هنوز رسانه دانلود شده ای وجود ندارد';

  @override
  String get browseLibrary => 'مرور کتابخانه';

  @override
  String get deleteDownload => 'حذف دانلود';

  @override
  String removeItemAndFiles(String name) {
    return '«$name» و فایل‌های آن حذف شود؟';
  }

  @override
  String tracksCount(int count) {
    return 'آهنگ‌های $count';
  }

  @override
  String get album => 'آلبوم';

  @override
  String get playAlbum => 'پخش آلبوم';

  @override
  String failedToLoadAlbum(String error) {
    return 'آلبوم بارگیری نشد: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'هیچ آهنگ بارگیری شده ای برای $name یافت نشد.';
  }

  @override
  String get season => 'فصل';

  @override
  String get errorLoadingEpisodes => 'خطا در بارگیری قسمت ها';

  @override
  String get noDownloadedEpisodes => 'هیچ قسمت دانلود شده ای وجود ندارد';

  @override
  String get deleteEpisode => 'حذف قسمت';

  @override
  String removeName(String name) {
    return '\"$name\" حذف شود؟';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes دقیقه';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'فصل $season قسمت $episode';
  }

  @override
  String episodeNumber(int number) {
    return 'قسمت $number';
  }

  @override
  String get seriesNotFound => 'سریال پیدا نشد';

  @override
  String get errorLoadingSeries => 'خطا در بارگیری سری';

  @override
  String get downloadedEpisodes => 'قسمت های دانلود شده';

  @override
  String seasonNumber(int number) {
    return 'فصل $number';
  }

  @override
  String seasonChip(int number) {
    return 'فصل $number';
  }

  @override
  String get specials => 'ویژه';

  @override
  String get deleteSeason => 'حذف فصل';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'تمام قسمت های دانلود شده در $season حذف شود؟';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count قسمت',
      one: '1 قسمت',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'مدیریت ذخیره سازی';

  @override
  String get storageBreakdown => 'خرابی ذخیره سازی';

  @override
  String get downloadedItems => 'موارد دانلود شده';

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
  String get storageLimit => 'محدودیت ذخیره سازی';

  @override
  String get noLimit => 'بدون محدودیت';

  @override
  String get deleteAllDownloads => 'حذف همه دانلودها';

  @override
  String get deleteAllDownloadsWarning =>
      'با این کار همه فایل های رسانه ای دانلود شده حذف می شوند و قابل بازگشت نیستند.';

  @override
  String get deleteAll => 'حذف همه';

  @override
  String get deleteSelected => 'حذف انتخاب شده';

  @override
  String deleteSelectedCount(int count) {
    return 'موارد دانلود شده $count حذف شود؟';
  }

  @override
  String get musicAndAudiobooks => 'موسیقی و کتاب های صوتی';

  @override
  String get images => 'تصاویر';

  @override
  String get database => 'پایگاه داده';

  @override
  String ofStorageLimit(String limit) {
    return 'محدودیت $limit';
  }

  @override
  String get settings => 'تنظیمات';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'احراز هویت';

  @override
  String get autoLoginServerManagement => 'ورود خودکار، مدیریت سرور';

  @override
  String get pinCode => 'کد پین';

  @override
  String get setUpPinCodeProtection => 'حفاظت از کد پین را تنظیم کنید';

  @override
  String get parentalControls => 'کنترل های والدین';

  @override
  String get contentRatingRestrictions => 'محدودیت های رتبه بندی محتوا';

  @override
  String get bitRateResolutionBehavior => 'میزان بیت، وضوح، رفتار';

  @override
  String get languageSizeAppearance => 'زبان، اندازه، ظاهر';

  @override
  String get qualityStorage => 'کیفیت، ذخیره سازی';

  @override
  String get mediaRequestIntegration => 'ادغام درخواست رسانه';

  @override
  String get switchServer => 'سوئیچ سرور';

  @override
  String get signOut => 'از سیستم خارج شوید';

  @override
  String get versionLicenses => 'نسخه، مجوزها';

  @override
  String get account => 'حساب';

  @override
  String get signInAndSecurity => 'ورود به سیستم و امنیت';

  @override
  String get administration => 'اداره';

  @override
  String get serverSettingsUsersLibraries =>
      'تنظیمات سرور، کاربران، کتابخانه ها';

  @override
  String get customization => 'سفارشی سازی';

  @override
  String get themeAndLayout => 'تم و طرح';

  @override
  String get videoAndSubtitles => 'ویدئو و زیرنویس';

  @override
  String get pluginAndRequests => 'افزونه و درخواست ها';

  @override
  String get customizeAccountPlaybackInterface =>
      'حساب کاربری، پخش و رفتار رابط را سفارشی کنید';

  @override
  String optionsCount(int count) {
    return 'گزینه های $count';
  }

  @override
  String get themeAndAppearance => 'موضوع و ظاهر';

  @override
  String get focusBorderColor => 'فوکوس رنگ حاشیه';

  @override
  String get watchedIndicators => 'شاخص های تماشا شده';

  @override
  String get always => 'همیشه';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'پنهان کردن Unwatched';

  @override
  String get episodesOnly => 'فقط قسمت ها';

  @override
  String get never => 'هرگز';

  @override
  String get focusExpansionAnimation => 'انیمیشن گسترش تمرکز';

  @override
  String get desktopUiScale => 'مقیاس رابط کاربری دسکتاپ';

  @override
  String get scaleFocusedCards =>
      'کارت‌ها و کاشی‌های متمرکز یا شناور شده را مقیاس کنید';

  @override
  String get seriesThumbnails => 'ریز عکسهای سری';

  @override
  String get seriesThumbnailsDescription =>
      'فقط قسمت ها: از آثار هنری سری استفاده کنید که با هر نوع تصویر ردیف مطابقت دارد';

  @override
  String get homeRowInfoOverlay => 'پوشش اطلاعات ردیف صفحه اصلی';

  @override
  String get showTitleMetadataOnHomeRows =>
      'نمایش عنوان و ابرداده هنگام مرور ردیف‌های اصلی';

  @override
  String get clockDisplay => 'نمایشگر ساعت';

  @override
  String get inMenus => 'در منوها';

  @override
  String get inVideo => 'در ویدیو';

  @override
  String get seasonalEffects => 'جلوه های فصلی';

  @override
  String get seasonalEffectsDescription => 'جلوه های بصری و تزئینات فصلی';

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
  String get snow => 'برف';

  @override
  String get fireworks => 'آتش بازی';

  @override
  String get confetti => 'کانفتی';

  @override
  String get fallingLeaves => 'ریزش برگها';

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
  String get themeMusic => 'موسیقی تم';

  @override
  String get playThemeMusicOnDetailPages =>
      'موسیقی تم را در صفحات جزئیات پخش کنید';

  @override
  String get themeMusicVolume => 'حجم موسیقی تم';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'موسیقی تم در ردیف‌های صفحه اصلی';

  @override
  String get playWhenBrowsingHomeScreen => 'هنگام مرور صفحه اصلی بازی کنید';

  @override
  String get loopThemeMusic => 'تکرار موسیقی تم';

  @override
  String get loopThemeMusicSubtitle => 'تکرار قطعه به‌جای پخش یک‌باره آن';

  @override
  String get detailsBackgroundBlur => 'جزئیات تاری پس زمینه';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'مرور پس‌زمینه تاری';

  @override
  String get maxStreamingBitrate => 'حداکثر میزان بیت جریان';

  @override
  String get maxResolution => 'حداکثر وضوح';

  @override
  String get playerZoomMode => 'حالت زوم بازیکن';

  @override
  String get settingsScrollWheelAction => 'چرخ اسکرول ماوس';

  @override
  String get settingsScrollWheelActionDescription =>
      'انتخاب کنید چرخاندن چرخ ماوس روی ویدیو هنگام پخش چه کاری انجام دهد.';

  @override
  String get scrollWheelActionOff => 'خاموش';

  @override
  String get scrollWheelActionSeek => 'پرش (جلو / عقب)';

  @override
  String get scrollWheelActionVolume => 'میزان صدا';

  @override
  String get playerTooltipVolume => 'میزان صدا';

  @override
  String get fit => 'مناسب';

  @override
  String get autoCrop => 'برش خودکار';

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
  String get stretch => 'کشش';

  @override
  String get refreshRateSwitching => 'تغییر نرخ تازه سازی';

  @override
  String get disabled => 'غیرفعال';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'مقیاس در تلویزیون';

  @override
  String get scaleOnDevice => 'مقیاس روی دستگاه';

  @override
  String get trickPlay => 'بازی ترفند';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'هنگام جستجو، تصاویر کوچک پیش‌نمایش را نشان دهید';

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
  String get showDescriptionOnPause => 'نمایش توضیحات در حالت مکث';

  @override
  String get dimVideoShowOverview =>
      'ویدیو را کم نور کنید و متن نمای کلی را در حالت توقف نمایش دهید';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'دکمه قفل OSD';

  @override
  String get osdLockButtonDescription =>
      'دکمه قفلی را نشان دهید که ورودی لمسی را تا فشار طولانی مسدود می‌کند';

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
  String get audioBehavior => 'رفتار صوتی';

  @override
  String get downmixToStereo => 'پایین میکس به استریو';

  @override
  String get defaultAudioLanguage => 'زبان صوتی پیش فرض';

  @override
  String get fallbackAudioLanguage => 'زبان صوتی جایگزین';

  @override
  String get preferDefaultAudioTrack => 'ترجیح ترک صوتی پیش‌فرض';

  @override
  String get preferDefaultAudioTrackDescription =>
      'ترک صوتی اصلی به دوبله بومی‌سازی‌شده ترجیح داده شود.';

  @override
  String get preferAudioDescription => 'ترجیح ترک‌های توضیح صوتی';

  @override
  String get preferAudioDescriptionDescription =>
      'ترک‌های توضیح صوتی به ترک‌های عادی ترجیح داده شوند.';

  @override
  String get autoServerDefault => 'خودکار (پیش‌فرض سرور)';

  @override
  String get english => 'انگلیسی';

  @override
  String get spanish => 'اسپانیایی';

  @override
  String get french => 'فرانسوی';

  @override
  String get german => 'آلمانی';

  @override
  String get italian => 'ایتالیایی';

  @override
  String get portuguese => 'پرتغالی';

  @override
  String get japanese => 'ژاپنی';

  @override
  String get korean => 'کره ای';

  @override
  String get chinese => 'چینی';

  @override
  String get russian => 'روسی';

  @override
  String get arabic => 'عربی';

  @override
  String get hindi => 'هندی';

  @override
  String get dutch => 'هلندی';

  @override
  String get swedish => 'سوئدی';

  @override
  String get norwegian => 'نروژی';

  @override
  String get danish => 'دانمارکی';

  @override
  String get finnish => 'فنلاندی';

  @override
  String get polish => 'لهستانی';

  @override
  String get ac3Passthrough => 'عبور مستقیم AC3';

  @override
  String get dtsPassthrough => 'عبور مستقیم DTS';

  @override
  String get trueHdSupport => 'پشتیبانی TrueHD';

  @override
  String get enableDtsPassthrough =>
      'صدای بیت استریم DTS فقط به AVR. به پشتیبانی گیرنده و مسیر منبع DTS نیاز دارد';

  @override
  String get settingsAudioFallbackCodec => 'کدک بازگشتی صوتی';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'قالب مقصد را برای ترنسکد صدای چندکاناله انتخاب کنید؛ زمانی که جریان منبع قابل پخش مستقیم یا عبور مستقیم نیست.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto => 'تشخیص خودکار\n(توصیه‌شده)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(پیش‌فرض)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(فقط استریو)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(کارآمد)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(بدون افت کیفیت)';

  @override
  String get settingsMaxAudioChannels => 'حداکثر کانال‌های صوتی';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'حداکثر کانال‌های سیستم صوتی خود را تنظیم کنید. جریان‌های چندکاناله فراتر از این حد داون‌میکس یا ترنسکد می‌شوند.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'تشخیص خودکار\n(پیش‌فرض سخت‌افزار)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 مونو';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 استریو';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 فراگیر';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 چهارکاناله';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 فراگیر';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 فراگیر';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 فراگیر';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 فراگیر';

  @override
  String get settingsAudioPassthroughAdvanced => 'عبور (پیشرفته)';

  @override
  String get settingsAudioCodecPassthrough => 'رمز عبور عبور';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'فقط فرمت هایی را که سینک AVR یا HDMI شما پشتیبانی می کند، فعال کنید.';

  @override
  String get settingsAudioEac3Passthrough => 'عبور مستقیم EAC3';

  @override
  String get settingsAudioDtsCorePassthrough => 'عبور مستقیم DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'عبور مستقیم DTS-HD MA';

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
  String get settingsAudioTrueHdPassthrough => 'عبور مستقیم TrueHD';

  @override
  String get settingsDetectedAudioCapabilities => 'قابلیت های صوتی شناسایی شده';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'هنوز عکس فوری قابلیت زمان اجرا در دسترس نیست.';

  @override
  String get settingsAudioRouteLabel => 'مسیر';

  @override
  String get settingsAudioDecodeLabel => 'رمزگشایی';

  @override
  String get settingsAudioPassthroughLabel => 'عبور';

  @override
  String get settingsAudioHdRoute => 'مسیر صوتی HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'بلوتوث';

  @override
  String get settingsAudioRouteSpeaker => 'بلندگو';

  @override
  String get settingsAudioRouteHeadphones => 'هدفون';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count کانال PCM';
  }

  @override
  String get nightMode => 'حالت شب';

  @override
  String get compressDynamicRange => 'فشرده سازی محدوده دینامیکی';

  @override
  String get advancedMpv => 'پیشرفته mpv';

  @override
  String get enableCustomMpvConf => 'سفارشی mpv.conf را فعال کنید';

  @override
  String get applyMpvConfBeforePlayback =>
      'قبل از شروع پخش، یک mpv.conf مشخص شده توسط کاربر را اعمال کنید';

  @override
  String get unsafeAdvancedMpvOptions => 'گزینه های پیشرفته ناامن mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'به مجموعه گسترده‌تری از گزینه‌های mpv اجازه دهید. ممکن است رفتار پخش را خراب کند.';

  @override
  String get hardwareDecoding => 'رمزگشایی سخت افزاری';

  @override
  String get hardwareDecodingSubtitle =>
      'ممکن است عملکرد را بهبود بخشد، اما می‌تواند باعث مشکلات پخش در برخی دستگاه‌ها شود.';

  @override
  String get nextUpAndQueuing => 'بعدی و صف';

  @override
  String get nextUpDisplay => 'نمایش بعدی بعدی';

  @override
  String get extended => 'تمدید شد';

  @override
  String get minimal => 'حداقل';

  @override
  String get nextUpTimeout => 'مهلت زمانی بعدی به بالا';

  @override
  String secondsValue(int value) {
    return '$value ثانیه';
  }

  @override
  String get mediaQueuing => 'صف رسانه ها';

  @override
  String get autoQueueNextEpisodes => 'صف خودکار قسمت های بعدی';

  @override
  String get stillWatchingPrompt => 'هنوز در حال تماشای اعلان';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'بعد از قسمت‌های $episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'رزومه و رد شدن';

  @override
  String get resumeRewind => 'از سرگیری به عقب';

  @override
  String get unpauseRewind => 'لغو مکث به عقب';

  @override
  String get fiveSeconds => '5 ثانیه';

  @override
  String get tenSeconds => '10 ثانیه';

  @override
  String get fifteenSeconds => '15 ثانیه';

  @override
  String get thirtySeconds => '30 ثانیه';

  @override
  String get skipBackLength => 'رد شدن از طول پشت';

  @override
  String get skipForwardLength => 'از طول به جلو پرش کنید';

  @override
  String get customMpvConfPath => 'مسیر سفارشی mpv.conf';

  @override
  String get notSetMpvConf =>
      'تنظیم نشده است. Moonfin یک mpv.conf پیش‌فرض را در پوشه‌های برنامه/داده امتحان می‌کند.';

  @override
  String get selectMpvConf => 'mpv.conf را انتخاب کنید';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'تنظیمات سبک (اندازه، رنگ، افست) برای زیرنویس‌های متنی (SRT، VTT، TTML) اعمال می‌شود. زیرنویس‌های ASS/SSA از استایل تعبیه‌شده خود استفاده می‌کنند مگر اینکه «ASS/SSA Direct Play» خاموش باشد. زیرنویس‌های بیت مپ (PGS، DVB، VobSub) قابل تغییر نیستند.';

  @override
  String get defaultSubtitleLanguage => 'زبان پیش‌فرض زیرنویس';

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
  String get defaultToNoSubtitles => 'پیش‌فرض بدون زیرنویس است';

  @override
  String get turnOffSubtitlesByDefault =>
      'زیرنویس را به طور پیش فرض خاموش کنید';

  @override
  String get subtitleSize => 'اندازه زیرنویس';

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
  String get textFillColor => 'رنگ پر کردن متن';

  @override
  String get backgroundColor => 'رنگ پس زمینه';

  @override
  String get textStrokeColor => 'رنگ ضربه ای متن';

  @override
  String get subtitleCustomization => 'سفارشی سازی زیرنویس';

  @override
  String get subtitleCustomizationDescription => 'ظاهر زیرنویس را سفارشی کنید';

  @override
  String get subtitleMode => 'حالت زیرنویس';

  @override
  String get subtitleModeFlagged => 'نشان‌دار';

  @override
  String get subtitleModeAlways => 'همیشه';

  @override
  String get subtitleModeForeign => 'زبان خارجی';

  @override
  String get subtitleModeForced => 'اجباری';

  @override
  String get subtitleModeFlaggedDescription =>
      'ترک‌هایی را پخش می‌کند که در فراداده فایل رسانه به‌عنوان «پیش‌فرض» یا «اجباری» نشان‌گذاری شده‌اند.';

  @override
  String get subtitleModeAlwaysDescription =>
      'هر بار که ویدیویی شروع می‌شود، زیرنویس‌ها را به‌طور خودکار بارگذاری و نمایش می‌دهد.';

  @override
  String get subtitleModeForeignDescription =>
      'اگر ترک صوتی پیش‌فرض به زبان خارجی باشد، زیرنویس‌ها را به‌طور خودکار روشن می‌کند.';

  @override
  String get subtitleModeForcedDescription =>
      'فقط زیرنویس‌هایی را بارگذاری می‌کند که صراحتاً با نشان فراداده «اجباری» برچسب خورده‌اند.';

  @override
  String get subtitleModeNoneDescription =>
      'بارگذاری خودکار زیرنویس را کاملاً غیرفعال می‌کند.';

  @override
  String get fallbackSubtitleLanguage => 'زبان زیرنویس جایگزین';

  @override
  String get subtitleStream => 'جریان زیرنویس';

  @override
  String get subtitlePreviewText => 'روباه قهوه ای سریع از روی سگ تنبل می پرد';

  @override
  String get verticalOffset => 'افست عمودی';

  @override
  String get pgsDirectPlay => 'پخش مستقیم PGS';

  @override
  String get directPlayPgsSubtitles => 'پخش مستقیم زیرنویس PGS';

  @override
  String get assSsaDirectPlay => 'پخش مستقیم ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles => 'پخش مستقیم زیرنویس ASS/SSA';

  @override
  String get white => 'سفید';

  @override
  String get black => 'مشکی';

  @override
  String get yellow => 'زرد';

  @override
  String get green => 'سبز';

  @override
  String get cyan => 'فیروزه ای';

  @override
  String get red => 'قرمز';

  @override
  String get transparent => 'شفاف';

  @override
  String get semiTransparentBlack => 'مشکی نیمه شفاف';

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
  String get global => 'جهانی';

  @override
  String get desktop => 'دسکتاپ';

  @override
  String get mobile => 'موبایل';

  @override
  String get tv => 'تلویزیون';

  @override
  String loadedProfileSettings(String profile) {
    return 'تنظیمات نمایه $profile بارگیری شد.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'تنظیمات نمایه $profile بارگیری نشد.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'تنظیمات محلی را با نمایه $profile همگام‌سازی کرد.';
  }

  @override
  String get syncing => 'در حال همگام سازی...';

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
  String get profileSyncHidden => 'همگام سازی نمایه پنهان شد';

  @override
  String get enablePluginSyncDescription =>
      'همگام‌سازی پلاگین سرور را در تنظیمات افزونه فعال کنید تا کنترل‌های نمایه را در اینجا نشان دهید.';

  @override
  String get quality => 'کیفیت';

  @override
  String get defaultDownloadQuality => 'کیفیت دانلود پیش فرض';

  @override
  String get network => 'شبکه';

  @override
  String get wifiOnlyDownloads => 'دانلودهای فقط وای فای';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'نمایش دانلودها در سرور';

  @override
  String get reportDownloadsActivitySubtitle =>
      'به مدیر سرور اجازه دهید دانلودهای ترنسکدشده شما را در داشبورد ببیند';

  @override
  String get onlyDownloadOnWifi => 'دانلود فقط زمانی که به WiFi متصل است';

  @override
  String get storage => 'ذخیره سازی';

  @override
  String get storageUsed => 'ذخیره سازی استفاده شده';

  @override
  String get manage => 'مدیریت کنید';

  @override
  String get calculating => 'در حال محاسبه...';

  @override
  String get downloadLocation => 'مکان دانلود';

  @override
  String get defaultLabel => 'پیش فرض';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'در پوشه Downloads ذخیره کنید';

  @override
  String get downloadsVisibleToOtherApps =>
      'دانلودها/Moonfin — قابل مشاهده برای سایر برنامه ها';

  @override
  String get dangerZone => 'منطقه خطر';

  @override
  String get clearAllDownloads => 'پاک کردن همه دانلودها';

  @override
  String get original => 'اصل';

  @override
  String get changeDownloadLocation => 'مکان دانلود را تغییر دهید';

  @override
  String get changeDownloadLocationDescription =>
      'دانلودهای جدید در پوشه انتخابی ذخیره خواهند شد. دانلودهای موجود در مکان فعلی خود باقی می مانند و می توانند از تنظیمات فضای ذخیره سازی مدیریت شوند.';

  @override
  String get confirm => 'تایید کنید';

  @override
  String get cannotWriteToFolder =>
      'نمی توان در پوشه انتخابی نوشت. لطفاً مکان دیگری را انتخاب کنید یا اجازه ذخیره سازی بدهید.';

  @override
  String get saveToDownloadsFolderQuestion => 'در پوشه دانلودها ذخیره شود؟';

  @override
  String get saveToDownloadsFolderDescription =>
      'رسانه دانلود شده در Downloads/Moonfin در دستگاه شما ذخیره خواهد شد. این فایل ها برای سایر برنامه ها مانند گالری یا پخش کننده موسیقی شما قابل مشاهده خواهند بود.\n\nدانلودهای موجود در مکان فعلی خود باقی خواهند ماند.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'فعال کردن';

  @override
  String get clearAllDownloadsWarning =>
      'این کار همه رسانه های دانلود شده را حذف می کند و قابل واگرد نیست.';

  @override
  String get clearAll => 'پاک کردن همه';

  @override
  String get navigationStyle => 'سبک ناوبری';

  @override
  String get topBar => 'نوار بالا';

  @override
  String get leftSidebar => 'نوار کناری سمت چپ';

  @override
  String get showShuffleButton => 'نمایش دکمه زدن';

  @override
  String get showGenresButton => 'دکمه نمایش ژانرها';

  @override
  String get showFavoritesButton => 'دکمه نمایش موارد دلخواه';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'نمایش کتابخانه ها در نوار ابزار';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'همیشه نمایش برچسب‌های نوار ناوبری';

  @override
  String get showSeerrButton => 'نمایش دکمه Seerr';

  @override
  String get navbarOpacity => 'کدورت نوار ناوبری';

  @override
  String get navbarColor => 'رنگ نوار ناوبری';

  @override
  String get gray => 'خاکستری';

  @override
  String get darkBlue => 'آبی تیره';

  @override
  String get purple => 'بنفش';

  @override
  String get teal => 'آبی رنگ';

  @override
  String get navy => 'نیروی دریایی';

  @override
  String get charcoal => 'زغال چوب';

  @override
  String get brown => 'قهوه ای';

  @override
  String get darkRed => 'قرمز تیره';

  @override
  String get darkGreen => 'سبز تیره';

  @override
  String get slate => 'تخته سنگ';

  @override
  String get indigo => 'نیل';

  @override
  String get libraryDisplay => 'نمایش کتابخانه';

  @override
  String get posterLabel => 'پوستر';

  @override
  String get thumbnailLabel => 'تصویر کوچک';

  @override
  String get bannerLabel => 'بنر';

  @override
  String get overridePerLibrarySettings => 'لغو تنظیمات هر کتابخانه';

  @override
  String get applyImageTypeToAllLibraries =>
      'نوع تصویر را برای همه کتابخانه ها اعمال کنید';

  @override
  String get multiServerLibraries => 'کتابخانه های چند سروری';

  @override
  String get showLibrariesFromAllServers =>
      'نمایش کتابخانه ها از همه سرورهای متصل';

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
  String get groupItemsIntoCollections => 'گروه‌بندی موارد در مجموعه‌ها';

  @override
  String get hideCollectionAssociatedItems =>
      'پنهان کردن موارد کتابخانه مرتبط با مجموعه هنگام مرور کتابخانه‌ها';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'اطلاعیه گروه‌بندی کتابخانه';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'برای استفاده از این تنظیم، لطفاً مطمئن شوید تنظیمات کتابخانه‌ای «گروه‌بندی فیلم‌ها در مجموعه‌ها» و/یا «گروه‌بندی سریال‌ها در مجموعه‌ها» در بخش تنظیمات نمایش کتابخانه، روی سرور Jellyfin یا Emby شما فعال باشند.';

  @override
  String get libraryVisibility => 'قابلیت مشاهده کتابخانه';

  @override
  String get libraryVisibilityDescription =>
      'قابلیت مشاهده صفحه اصلی در هر کتابخانه را تغییر دهید. برای اعمال تغییرات Moonfin را مجددا راه اندازی کنید.';

  @override
  String get showInNavigation => 'نمایش در ناوبری';

  @override
  String get showInLatestMedia => 'نمایش در آخرین رسانه';

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
  String get sourceLibraries => 'کتابخانه های منبع';

  @override
  String get sourceCollections => 'مجموعه های منبع';

  @override
  String get excludedGenres => 'ژانرهای حذف شده';

  @override
  String get selectAll => 'همه را انتخاب کنید';

  @override
  String itemsSelected(int count) {
    return '$count انتخاب شد';
  }

  @override
  String get mediaBar => 'نوار رسانه';

  @override
  String get mediaSources => 'منابع رسانه ای';

  @override
  String get behavior => 'رفتار';

  @override
  String get seconds => 'ثانیه';

  @override
  String get mediaBarMode => 'سبک نوار رسانه';

  @override
  String get mediaBarModeDescription =>
      'از بین سبک‌های مختلف نوار رسانه انتخاب کنید، یا نوار رسانه را خاموش کنید';

  @override
  String get peekHomeRows => 'Peek Home Rows';

  @override
  String get peekHomeRowsDescription =>
      'Show the top half of the first row along the bottom of the media bar';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'خاموش';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'نوار رسانه را فعال کنید';

  @override
  String get showFeaturedContentSlideshow => 'نمایش اسلاید محتوای ویژه در خانه';

  @override
  String get contentType => 'نوع محتوا';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'فیلم‌ها و نمایش‌های تلویزیونی';

  @override
  String get moviesOnly => 'فقط فیلم';

  @override
  String get tvShowsOnly => 'فقط برنامه های تلویزیونی';

  @override
  String get itemCount => 'تعداد آیتم ها';

  @override
  String get noneSelected => 'هیچ کدام انتخاب نشد';

  @override
  String get noneExcluded => 'هیچ کدام مستثنی نشده است';

  @override
  String get autoAdvance => 'پیشروی خودکار';

  @override
  String get autoAdvanceSlides => 'به صورت خودکار به اسلاید بعدی بروید';

  @override
  String get autoAdvanceInterval => 'فاصله پیشروی خودکار';

  @override
  String get trailerPreview => 'پیش نمایش تریلر';

  @override
  String get autoPlayTrailers =>
      'پخش خودکار تریلرها در نوار رسانه بعد از 3 ثانیه';

  @override
  String get trailerAudio => 'صدای تریلر';

  @override
  String get enableTrailerAudio => 'فعال کردن صدا برای تریلرها در نوار رسانه';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'پیش نمایش قسمت';

  @override
  String get mediaPreview => 'پیش نمایش رسانه';

  @override
  String get episodePreviewDescription =>
      'یک پیش‌نمایش درون خطی 30 ثانیه‌ای روی کارت‌های متمرکز، شناور شده یا فشار داده شده طولانی پخش کنید.';

  @override
  String get mediaPreviewDescription =>
      'یک پیش‌نمایش درون خطی 30 ثانیه‌ای روی کارت‌های متمرکز، شناور شده یا فشار داده شده طولانی پخش کنید.';

  @override
  String get previewAudio => 'پیش نمایش صدا';

  @override
  String get enablePreviewAudio =>
      'صدا را برای پیش‌نمایش تریلر و قسمت فعال کنید';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'آخرین رسانه';

  @override
  String get recentlyReleased => 'به تازگی منتشر شده است';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'رسانه من';

  @override
  String get myMediaSmall => 'رسانه من (کوچک)';

  @override
  String get continueWatching => 'به تماشای ادامه دهید';

  @override
  String get resumeAudio => 'از سرگیری صدا';

  @override
  String get resumeBooks => 'کتاب های رزومه';

  @override
  String get activeRecordings => 'ضبط های فعال';

  @override
  String get playlists => 'لیست های پخش';

  @override
  String get liveTV => 'تلویزیون زنده';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'به حالت پیش فرض بازنشانی کنید';

  @override
  String get homeRowPosterSize => 'اندازه پوستر ردیف خانه';

  @override
  String get configureImageTypeForEachRow =>
      'نوع تصویر را برای هر ردیف اصلی فعال پیکربندی کنید';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Continue Watching و Next Up را ادغام کنید';

  @override
  String get combineBothRows => 'هر دو ردیف را در یک بخش خانه ترکیب کنید';

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
  String get fullScreenRows => 'ردیف‌های گسترده صفحه اصلی';

  @override
  String get fullScreenRowsDescription =>
      'محدود کردن ردیف‌های صفحه اصلی به 1 ردیف در هر صفحه';

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
  String get perRowSettings => 'تنظیمات هر ردیف';

  @override
  String get autoLogin => 'ورود خودکار';

  @override
  String get lastUser => 'آخرین کاربر';

  @override
  String get currentUser => 'کاربر فعلی';

  @override
  String get alwaysAuthenticate => 'همیشه احراز هویت';

  @override
  String get requirePasswordWithToken =>
      'نیاز به رمز عبور حتی با رمز ذخیره شده';

  @override
  String get confirmExit => 'خروج را تایید کنید';

  @override
  String get showConfirmationBeforeExiting => 'قبل از خروج تأیید را نشان دهید';

  @override
  String get blockContentWithRatings =>
      'مسدود کردن محتوای دارای رتبه‌بندی زیر:';

  @override
  String get noContentRatingsFound =>
      'هنوز هیچ رتبه بندی محتوایی در این سرور پیدا نشده است.';

  @override
  String get couldNotLoadServerRatings =>
      'رتبه‌بندی‌های سرور بارگیری نشد. نمایش فقط رتبه بندی های ذخیره شده';

  @override
  String get couldNotRefreshRatings =>
      'رتبه‌بندی‌ها از سرور بازخوانی نشد. نمایش رتبه بندی های ذخیره شده';

  @override
  String get enablePinCode => 'کد پین را فعال کنید';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess =>
      'برای دسترسی به حساب خود به یک پین نیاز دارید';

  @override
  String get changePin => 'پین را تغییر دهید';

  @override
  String get setNewPinCode => 'یک کد پین جدید تنظیم کنید';

  @override
  String get removePin => 'پین را بردارید';

  @override
  String get removePinProtection => 'حفاظت کد پین را بردارید';

  @override
  String get screensaver => 'محافظ صفحه نمایش';

  @override
  String get inAppScreensaver => 'محافظ صفحه نمایش درون برنامه ای';

  @override
  String get enableBuiltInScreensaver => 'محافظ صفحه نمایش داخلی را فعال کنید';

  @override
  String get mode => 'حالت';

  @override
  String get libraryArt => 'هنر کتابخانه';

  @override
  String get logo => 'لوگو';

  @override
  String get clock => 'ساعت';

  @override
  String get timeout => 'تایم اوت';

  @override
  String minutesShort(int minutes) {
    return '$minutes دقیقه';
  }

  @override
  String get dimmingLevel => 'سطح کم نور';

  @override
  String get maxAgeRating => 'حداکثر رده سنی';

  @override
  String get any => 'هر';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'نیاز به رتبه بندی سنی';

  @override
  String get onlyShowRatedContent => 'فقط محتوای دارای رتبه را نشان دهید';

  @override
  String get displayClockDuringScreensaver =>
      'نمایش ساعت در حین محافظ صفحه نمایش';

  @override
  String get clockModeStatic => 'ثابت';

  @override
  String get clockModeBouncing => 'متحرک';

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
  String get rottenTomatoesCritics => 'گوجه فرنگی گندیده (منتقدان)';

  @override
  String get rottenTomatoesAudience => 'گوجه فرنگی پوسیده (مخاطب)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'متاکریتیک';

  @override
  String get metacriticUser => 'متاکریتیک (کاربر)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'جعبه نامه';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'رتبه بندی جامعه';

  @override
  String get ratings => 'رتبه بندی ها';

  @override
  String get additionalRatings => 'رتبه بندی های اضافی';

  @override
  String get showMdbListAndTmdbRatings => 'نمایش امتیازهای MDBList و TMDB';

  @override
  String get ratingLabels => 'برچسب های رتبه بندی';

  @override
  String get showLabelsNextToIcons =>
      'نشان دادن برچسب ها در کنار نمادهای رتبه بندی';

  @override
  String get ratingBadges => 'نشان های رتبه بندی';

  @override
  String get showDecorativeBadges =>
      'نشان‌های تزئینی را در پشت رتبه‌بندی‌ها نشان دهید';

  @override
  String get episodeRatings => 'رتبه بندی قسمت ها';

  @override
  String get showRatingsOnEpisodes => 'نمایش رتبه بندی در قسمت های جداگانه';

  @override
  String get ratingSources => 'منابع رتبه بندی';

  @override
  String get ratingSourcesDescription =>
      'منابع رتبه بندی نشان داده شده در سراسر برنامه را فعال کرده و مرتب کنید';

  @override
  String get pluginDetected => 'پلاگین شناسایی شد';

  @override
  String get pluginNotDetected => 'افزونه شناسایی نشد';

  @override
  String get pluginNotDetectedDescription =>
      'افزونه سرور در حال حاضر شناسایی نشده است. تنظیمات محلی همچنان از مقادیر ذخیره شده یا پیش فرض های داخلی خود استفاده می کنند.';

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
  String get recentRequests => 'درخواست های اخیر';

  @override
  String get recentlyAdded => 'اخیرا اضافه شده است';

  @override
  String get trending => 'پرطرفدار';

  @override
  String get popularMovies => 'فیلم های محبوب';

  @override
  String get movieGenres => 'ژانرهای فیلم';

  @override
  String get upcomingMovies => 'فیلم های آینده';

  @override
  String get studios => 'استودیوها';

  @override
  String get popularSeries => 'سریال محبوب';

  @override
  String get seriesGenres => 'ژانرهای سریال';

  @override
  String get upcomingSeries => 'سری آینده';

  @override
  String get networks => 'شبکه ها';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'ردیف‌های کشف Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'سطرها را به حالت پیش فرض بازنشانی کنید';

  @override
  String get enableSeerr => 'Seerr را فعال کنید';

  @override
  String get showSeerrInNavigation =>
      'نمایش Seerr در ناوبری (نیاز به افزونه سرور)';

  @override
  String get seerrUnavailable =>
      'در دسترس نیست زیرا پشتیبانی از افزونه سرور Seerr غیرفعال است.';

  @override
  String get nsfwFilter => 'فیلتر NSFW';

  @override
  String get hideAdultContent => 'محتوای بزرگسالان را در نتایج پنهان کنید';

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
  String get seerrNotificationsSection => 'اعلان‌ها';

  @override
  String get seerrNotifyNewRequestsTitle => 'اعلان درخواست‌های جدید';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'وقتی کسی درخواستی ثبت می‌کند به من اطلاع بده';

  @override
  String get seerrNotifyLibraryAddedTitle => 'به‌روزرسانی درخواست‌ها';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'تأییدشده، ردشده و افزوده‌شده به کتابخانه شما';

  @override
  String get seerrNotifyIssuesTitle => 'به‌روزرسانی مشکلات';

  @override
  String get seerrNotifyIssuesSubtitle => 'مشکلات جدید، پاسخ‌ها و راه‌حل‌ها';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'وارد شده به عنوان: $username';
  }

  @override
  String get discoverRows => 'صفحه کشف Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'ردیف‌هایی را که می‌خواهید در صفحه اصلی Seerr ببینید فعال کنید. برای تغییر ترتیب بکشید. ترتیب سفارشی با Moonbase همگام می‌شود.';

  @override
  String get discoverRowsDescription =>
      'ردیف‌هایی را که می‌خواهید در صفحه اصلی Seerr ببینید فعال کنید. برای تغییر ترتیب بکشید. ترتیب سفارشی با Moonbase همگام می‌شود.';

  @override
  String get enabled => 'فعال';

  @override
  String get hidden => 'پنهان شده است';

  @override
  String get aboutTitle => 'درباره';

  @override
  String versionValue(String version) {
    return 'نسخه $version';
  }

  @override
  String get openSourceLicenses => 'مجوزهای منبع باز';

  @override
  String get sourceCode => 'کد منبع';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'اکنون به‌روزرسانی‌ها را بررسی کنید';

  @override
  String get checksLatestDesktopRelease =>
      'آخرین نسخه دسکتاپ را برای این پلتفرم بررسی می کند';

  @override
  String get youAreUpToDate => 'شما به روز هستید.';

  @override
  String get couldNotCheckForUpdates =>
      'در حال حاضر نمی‌توان به‌روزرسانی‌ها را بررسی کرد.';

  @override
  String get noCompatibleUpdate =>
      'هیچ بسته به‌روزرسانی سازگار برای این پلتفرم یافت نشد.';

  @override
  String get updateChecksNotSupported =>
      'بررسی‌های به‌روزرسانی در این پلتفرم پشتیبانی نمی‌شوند.';

  @override
  String get updateNotificationsDisabled =>
      'اعلان‌های به‌روزرسانی غیرفعال هستند.';

  @override
  String get pleaseWaitBeforeChecking => 'لطفا قبل از بررسی مجدد صبر کنید.';

  @override
  String get latestUpdateAlreadyShown =>
      'آخرین به روز رسانی قبلا نشان داده شده بود.';

  @override
  String get updateAvailable => 'به روز رسانی موجود است.';

  @override
  String updateAvailableVersion(String version) {
    return 'به‌روزرسانی موجود است: v$version';
  }

  @override
  String get updateNotifications => 'به روز رسانی اعلان ها';

  @override
  String get showWhenUpdatesAvailable =>
      'نمایش زمانی که به‌روزرسانی‌ها در دسترس هستند';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version موجود است';
  }

  @override
  String get readReleaseNotes => 'یادداشت های انتشار را بخوانید';

  @override
  String get downloadingUpdate => 'در حال دانلود به روز رسانی...';

  @override
  String get updateDownloadFailed =>
      'دانلود آپدیت انجام نشد. لطفا دوباره امتحان کنید.';

  @override
  String get openReleasesPage => 'صفحه انتشار را باز کنید';

  @override
  String get navigation => 'ناوبری';

  @override
  String get watchedIndicatorsBackdrops => 'شاخص های تماشا، پس زمینه';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'رنگ فوکوس، نشانگرهای تماشا شده، پس زمینه';

  @override
  String get navbarStyleToolbarAppearance =>
      'سبک نوار ابزار، دکمه‌های نوار ابزار، ظاهر';

  @override
  String get featuredContentAppearance => 'محتوای ویژه، ظاهر';

  @override
  String gbValue(String value) {
    return '$value گیگابایت';
  }

  @override
  String mbValue(int value) {
    return '$value مگابایت';
  }

  @override
  String get imageCacheLimit => 'محدودیت حافظه پنهان تصاویر';

  @override
  String get clearImageCache => 'پاک کردن حافظه پنهان تصاویر';

  @override
  String get imageCacheCleared => 'حافظه پنهان تصاویر پاک شد';

  @override
  String get clear => 'پاک کردن';

  @override
  String get browse => 'مرور کنید';

  @override
  String get noResults => 'هیچ نتیجه ای وجود ندارد';

  @override
  String get seerrAvailableStatus => 'موجود است';

  @override
  String get seerrRequestedStatus => 'درخواست شده است';

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
    return 'در حال دانلود · $percent%';
  }

  @override
  String get seerrImportingStatus => 'در حال وارد کردن';

  @override
  String itemsCount(int count) {
    return '$count موارد';
  }

  @override
  String get seerrSettings => 'تنظیمات Seerr';

  @override
  String get requestMore => 'درخواست بیشتر';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'درخواست کنید';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'لغو درخواست';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'بازی در Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'درخواست شده توسط $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'تایید کنید';

  @override
  String get declineAction => 'رد کردن';

  @override
  String get similar => 'مشابه';

  @override
  String get recommendations => 'توصیه ها';

  @override
  String cancelRequestForTitle(String title) {
    return 'درخواست برای \"$title\" لغو شود؟';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'درخواست‌های $count برای \"$title\" لغو شود؟';
  }

  @override
  String get keep => 'نگه دارید';

  @override
  String get itemNotFoundInLibrary => 'موردی در کتابخانه Moonfin شما یافت نشد';

  @override
  String get errorSearchingLibrary => 'خطا در جستجوی کتابخانه';

  @override
  String budgetAmount(String amount) {
    return 'بودجه: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'درآمد: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'درخواست $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'ارسال درخواست';

  @override
  String get allSeasons => 'تمام فصول';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'گزینه های پیشرفته';

  @override
  String get noServiceServersConfigured => 'هیچ سرور سرویسی پیکربندی نشده است';

  @override
  String get server => 'سرور';

  @override
  String get qualityProfile => 'نمایه کیفیت';

  @override
  String get rootFolder => 'پوشه ریشه';

  @override
  String get showMore => 'نمایش بیشتر';

  @override
  String get appearances => 'نقش‌آفرینی‌ها';

  @override
  String get crewSection => 'خدمه';

  @override
  String ageValue(int age) {
    return 'سن $age';
  }

  @override
  String get noRequests => 'بدون درخواست';

  @override
  String get pendingStatus => 'در انتظار';

  @override
  String get declinedStatus => 'رد کرد';

  @override
  String get partiallyAvailable => 'تا حدی در دسترس است';

  @override
  String get downloadingStatus => 'در حال دانلود';

  @override
  String get approvedStatus => 'تصویب شد';

  @override
  String get notRequestedStatus => 'درخواست نشده است';

  @override
  String get blocklistedStatus => 'فهرست مسدود شده';

  @override
  String get deletedStatus => 'حذف شد';

  @override
  String get failedStatus => 'ناموفق';

  @override
  String get processingStatus => 'در حال پردازش';

  @override
  String modifiedByName(String name) {
    return 'تغییر داده شده توسط $name';
  }

  @override
  String get completedStatus => 'تکمیل شد';

  @override
  String get requestErrorDuplicate => 'این عنوان قبلاً درخواست شده است';

  @override
  String get requestErrorQuota => 'به سقف درخواست رسیدید';

  @override
  String get requestErrorBlocklisted => 'این عنوان در فهرست مسدود است';

  @override
  String get requestErrorNoSeasons => 'فصلی برای درخواست باقی نمانده است';

  @override
  String get requestErrorPermission => 'شما اجازه ثبت این درخواست را ندارید';

  @override
  String get seerrRequestsTitle => 'درخواست‌ها';

  @override
  String get seerrIssuesTitle => 'مشکلات';

  @override
  String get sortNewest => 'جدیدترین';

  @override
  String get sortLastModified => 'آخرین تغییر';

  @override
  String get noIssues => 'هیچ مشکلی وجود ندارد';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining از $limit درخواست فیلم باقی مانده است';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining از $limit درخواست فصل باقی مانده است';
  }

  @override
  String partOfCollectionName(String name) {
    return 'بخشی از $name';
  }

  @override
  String get viewCollection => 'مشاهده مجموعه';

  @override
  String get requestCollection => 'درخواست مجموعه';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total فیلم · $available در دسترس';
  }

  @override
  String requestMoviesCount(int count) {
    return 'درخواست $count فیلم';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'در حال درخواست $current از $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count فیلم درخواست شد';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$ok فیلم از $total فیلم درخواست شد';
  }

  @override
  String get collectionAllRequested =>
      'همه فیلم‌ها از قبل در دسترس یا درخواست شده‌اند';

  @override
  String get reportIssue => 'گزارش مشکل';

  @override
  String get issueTypeVideo => 'ویدیو';

  @override
  String get issueTypeAudio => 'صدا';

  @override
  String get whatsWrong => 'مشکل چیست؟';

  @override
  String get allEpisodes => 'همه قسمت‌ها';

  @override
  String get episode => 'قسمت';

  @override
  String get openStatus => 'باز';

  @override
  String get resolvedStatus => 'حل‌شده';

  @override
  String get resolveAction => 'حل کردن';

  @override
  String get reopenAction => 'بازگشایی';

  @override
  String reportedByName(String name) {
    return 'گزارش‌شده توسط $name';
  }

  @override
  String commentsCount(int count) {
    return '$count نظر';
  }

  @override
  String get addComment => 'افزودن نظر';

  @override
  String get deleteIssueConfirm => 'این مشکل حذف شود؟';

  @override
  String get submitReport => 'ثبت گزارش';

  @override
  String get tmdbScore => 'امتیاز TMDB';

  @override
  String get releaseDateLabel => 'تاریخ انتشار';

  @override
  String get firstAirDateLabel => 'اولین تاریخ هوا';

  @override
  String get revenueLabel => 'درآمد';

  @override
  String get runtimeLabel => 'زمان اجرا';

  @override
  String get budgetLabel => 'بودجه';

  @override
  String get originalLanguageLabel => 'زبان اصلی';

  @override
  String get seasonsLabel => 'فصل‌ها';

  @override
  String get episodesLabel => 'اپیزودها';

  @override
  String get access => 'دسترسی داشته باشید';

  @override
  String get add => 'افزودن';

  @override
  String get address => 'آدرس';

  @override
  String get analytics => 'تجزیه و تحلیل';

  @override
  String get catalog => 'کاتالوگ';

  @override
  String get content => 'محتوا';

  @override
  String get copy => 'کپی کنید';

  @override
  String get create => 'ایجاد کنید';

  @override
  String get disable => 'غیر فعال کردن';

  @override
  String get done => 'انجام شد';

  @override
  String get edit => 'ویرایش';

  @override
  String get encoding => 'رمزگذاری';

  @override
  String get error => 'خطا';

  @override
  String get forward => 'جلو';

  @override
  String get general => 'عمومی';

  @override
  String get go => 'برو';

  @override
  String get install => 'نصب کنید';

  @override
  String get installed => 'نصب شده است';

  @override
  String get interval => 'فاصله';

  @override
  String get name => 'نام';

  @override
  String get networking => 'شبکه سازی';

  @override
  String get next => 'بعدی';

  @override
  String get path => 'مسیر';

  @override
  String get paused => 'مکث کرد';

  @override
  String get permissions => 'مجوزها';

  @override
  String get processing => 'پردازش';

  @override
  String get profile => 'نمایه';

  @override
  String get provider => 'ارائه دهنده';

  @override
  String get refresh => 'تازه کردن';

  @override
  String get remote => 'کنترل از راه دور';

  @override
  String get rename => 'تغییر نام دهید';

  @override
  String get revoke => 'لغو';

  @override
  String get role => 'نقش';

  @override
  String get root => 'ریشه';

  @override
  String get run => 'اجرا کنید';

  @override
  String get search => 'جستجو';

  @override
  String get select => 'انتخاب کنید';

  @override
  String get send => 'ارسال کنید';

  @override
  String get sessions => 'جلسات';

  @override
  String get set => 'تنظیم کنید';

  @override
  String get status => 'وضعیت';

  @override
  String get stop => 'توقف';

  @override
  String get streaming => 'پخش جریانی';

  @override
  String get time => 'زمان';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'حذف نصب کنید';

  @override
  String get up => 'بالا';

  @override
  String get update => 'به روز رسانی';

  @override
  String get upload => 'آپلود کنید';

  @override
  String get unmute => 'باصدا کردن';

  @override
  String get mute => 'بی‌صدا';

  @override
  String get branding => 'برندسازی';

  @override
  String get adminDrawerDashboard => 'داشبورد';

  @override
  String get adminDrawerAnalytics => 'تجزیه و تحلیل';

  @override
  String get adminDrawerSettings => 'تنظیمات';

  @override
  String get adminDrawerBranding => 'برندسازی';

  @override
  String get adminDrawerUsers => 'کاربران';

  @override
  String get adminDrawerLibraries => 'کتابخانه‌ها';

  @override
  String get adminDrawerDisplay => 'نمایش';

  @override
  String get adminDrawerMetadata => 'فراداده';

  @override
  String get adminDrawerNfo => 'تنظیمات NFO';

  @override
  String get adminDrawerTranscoding => 'رمزگذاری';

  @override
  String get adminDrawerResume => 'ادامه';

  @override
  String get adminDrawerStreaming => 'پخش جریانی';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'دستگاه ها';

  @override
  String get adminDrawerActivity => 'فعالیت';

  @override
  String get adminDrawerNetworking => 'شبکه سازی';

  @override
  String get adminDrawerApiKeys => 'کلیدهای API';

  @override
  String get adminDrawerBackups => 'پشتیبان گیری';

  @override
  String get adminDrawerLogs => 'سیاههها';

  @override
  String get adminDrawerScheduledTasks => 'وظایف برنامه ریزی شده';

  @override
  String get adminDrawerPlugins => 'پلاگین ها';

  @override
  String get adminDrawerRepositories => 'مخازن';

  @override
  String get adminDrawerLiveTv => 'تلویزیون زنده';

  @override
  String get adminExitTooltip => 'خروج از مدیریت';

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
  String get adminDashboardLoadFailed => 'داشبورد بارگیری نشد';

  @override
  String get adminMediaOverview => 'مروری بر رسانه ها';

  @override
  String get adminMediaTotalsError => 'مجموع رسانه سرور بارگیری نشد.';

  @override
  String get adminMediaOverviewSubtitle =>
      'یک مطالعه سریع در مورد مقدار محتوا در این سرور.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'به‌روزرسانی‌های افزونه موجود است: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'افزونه هایی که نیاز به راه اندازی مجدد دارند: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'کارهای برنامه ریزی شده ناموفق: $count';
  }

  @override
  String get analyticsMediaDistribution => 'توزیع رسانه ای';

  @override
  String get analyticsVideoCodecs => 'کدک های ویدیویی';

  @override
  String get analyticsAudioCodecs => 'کدک های صوتی';

  @override
  String get analyticsContainers => 'ظروف';

  @override
  String get analyticsTopGenres => 'ژانرهای برتر';

  @override
  String get analyticsReleaseYears => 'سال های انتشار';

  @override
  String get analyticsContentRatings => 'رتبه بندی محتوا';

  @override
  String get analyticsRuntimeBuckets => 'سطل های زمان اجرا';

  @override
  String get analyticsFileFormats => 'فرمت های فایل';

  @override
  String get analyticsNoData => 'داده ای موجود نیست.';

  @override
  String get adminServerInfo => 'اطلاعات سرور';

  @override
  String get adminRestartPending => 'راه اندازی مجدد در انتظار';

  @override
  String get adminServerPaths => 'مسیرهای سرور';

  @override
  String get adminServerActions => 'اقدامات سرور';

  @override
  String get adminRestartServer => 'سرور را مجددا راه اندازی کنید';

  @override
  String get adminShutdownServer => 'خاموش شدن سرور';

  @override
  String get adminLibraryScanStarted => 'اسکن کتابخانه شروع شد';

  @override
  String errorGeneric(String error) {
    return 'خطا: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'راه اندازی مجدد سرور در حال انجام است';

  @override
  String get adminServerRebootMessage =>
      'راه اندازی مجدد سرور در حال انجام است، لطفاً Moonfin را مجددا راه اندازی کنید';

  @override
  String get adminActiveSessions => 'جلسات فعال';

  @override
  String get adminSessionsLoadFailed => 'جلسات بارگیری نشد';

  @override
  String get adminNoActiveSessions => 'بدون جلسه فعال';

  @override
  String get adminRecentActivity => 'فعالیت اخیر';

  @override
  String get adminNoRecentActivity => 'هیچ فعالیت اخیری وجود ندارد';

  @override
  String adminCommandFailed(String error) {
    return 'دستور ناموفق بود: $error';
  }

  @override
  String get adminSendMessage => 'ارسال پیام';

  @override
  String get adminMessageTextHint => 'متن پیام';

  @override
  String get adminSetVolume => 'تنظیم صدا';

  @override
  String get sessionPrev => 'قبلی';

  @override
  String get sessionRewind => 'عقب';

  @override
  String get sessionForward => 'جلو';

  @override
  String get sessionNext => 'بعدی';

  @override
  String get sessionVolumeDown => 'جلد –';

  @override
  String get sessionVolumeUp => 'جلد +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'در حال پخش';

  @override
  String get volume => 'میزان صدا';

  @override
  String get actions => 'اقدامات';

  @override
  String get videoCodec => 'کدک ویدیویی';

  @override
  String get audioCodec => 'کدک صوتی';

  @override
  String get hwAccel => 'شتاب سخت‌افزاری';

  @override
  String get completion => 'تکمیل';

  @override
  String get adminClearDates => 'تاریخ ها را پاک کنید';

  @override
  String get adminActivitySeverityAll => 'همه سطوح اهمیت';

  @override
  String get adminActivityDateRange => 'بازه زمانی';

  @override
  String adminActivityLoadFailed(String error) {
    return 'گزارش فعالیت بارگیری نشد: $error';
  }

  @override
  String get adminNoActivityEntries => 'هیچ ورودی فعالیتی وجود ندارد';

  @override
  String get adminEditDeviceName => 'ویرایش نام دستگاه';

  @override
  String get adminCustomName => 'نام سفارشی';

  @override
  String get adminDeviceNameUpdated => 'نام دستگاه به روز شد';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'دستگاه به‌روزرسانی نشد: $error';
  }

  @override
  String get adminDeleteDevice => 'دستگاه را حذف کنید';

  @override
  String get adminDeviceDeleted => 'دستگاه حذف شد';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'دستگاه حذف نشد: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'دستگاه «$name» حذف شود؟ کاربر باید دوباره در این دستگاه وارد شود.';
  }

  @override
  String get adminDeleteAllDevices => 'حذف همه دستگاه‌ها';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count دستگاه حذف شود؟ کاربران متأثر باید دوباره وارد شوند. دستگاه فعلی شما تحت تأثیر قرار نمی‌گیرد.';
  }

  @override
  String get adminDevicesDeletedAll => 'دستگاه‌ها حذف شدند';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'برخی دستگاه‌ها حذف شدند؛ $count دستگاه حذف نشد.';
  }

  @override
  String get adminDevicesLoadFailed => 'دستگاه‌ها بارگیری نشد';

  @override
  String get adminSearchDevices => 'جستجوی دستگاه ها';

  @override
  String get adminThisDevice => 'این دستگاه';

  @override
  String get adminEditName => 'ویرایش نام';

  @override
  String get adminLibrariesLoadFailed => 'کتابخانه ها بارگیری نشد';

  @override
  String get adminNoLibraries => 'هیچ کتابخانه ای پیکربندی نشده است';

  @override
  String get adminScanAllLibraries => 'اسکن تمام کتابخانه ها';

  @override
  String get adminAddLibrary => 'افزودن کتابخانه';

  @override
  String adminScanFailed(String error) {
    return 'اسکن شروع نشد: $error';
  }

  @override
  String get adminRenameLibrary => 'تغییر نام کتابخانه';

  @override
  String get adminNewName => 'نام جدید';

  @override
  String adminLibraryRenamed(String name) {
    return 'کتابخانه به \"$name\" تغییر نام داد';
  }

  @override
  String adminRenameFailed(String error) {
    return 'تغییر نام انجام نشد: $error';
  }

  @override
  String get adminDeleteLibrary => 'حذف کتابخانه';

  @override
  String adminLibraryDeleted(String name) {
    return 'کتابخانه \"$name\" حذف شد';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'کتابخانه حذف نشد: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'مسیر اضافه نشد: $error';
  }

  @override
  String get adminRemovePath => 'مسیر را حذف کنید';

  @override
  String adminRemovePathConfirm(String path) {
    return '«$path» از این کتابخانه حذف شود؟';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'مسیر حذف نشد: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'کتابخانه بارگیری نشد';

  @override
  String get adminNoMediaPaths => 'هیچ مسیر رسانه ای پیکربندی نشده است';

  @override
  String get adminAddPath => 'اضافه کردن مسیر';

  @override
  String get adminBrowseFilesystem => 'مرور سیستم فایل سرور:';

  @override
  String get adminPreferredMetadataLanguage => 'زبان فراداده ترجیحی';

  @override
  String get adminMetadataLanguageHint => 'به عنوان مثال en, de, fr';

  @override
  String get adminMetadataCountryCode => 'کد کشور فراداده';

  @override
  String get adminMetadataCountryHint => 'به عنوان مثال ایالات متحده، DE، FR';

  @override
  String get adminLibraryTabPaths => 'مسیرها';

  @override
  String get adminLibraryTabOptions => 'گزینه‌ها';

  @override
  String get adminLibraryTabDownloaders => 'دانلودکننده‌ها';

  @override
  String get adminLibMetadataSavers => 'ذخیره‌کننده‌های فراداده';

  @override
  String get adminLibSubtitleDownloaders => 'دانلودکننده‌های زیرنویس';

  @override
  String get adminLibLyricDownloaders => 'دانلودکننده‌های متن ترانه';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'دانلودکننده‌های فراداده: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'دریافت‌کننده‌های تصویر: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'این سرور هیچ دانلودکننده‌ای برای این نوع کتابخانه ارائه نمی‌دهد.';

  @override
  String get adminLibrarySectionGeneral => 'عمومی';

  @override
  String get adminLibrarySectionMetadata => 'فراداده';

  @override
  String get adminLibrarySectionEmbedded => 'اطلاعات توکار';

  @override
  String get adminLibrarySectionSubtitles => 'زیرنویس‌ها';

  @override
  String get adminLibrarySectionImages => 'تصاویر';

  @override
  String get adminLibrarySectionSeries => 'سریال‌ها';

  @override
  String get adminLibrarySectionMusic => 'موسیقی';

  @override
  String get adminLibrarySectionMovies => 'فیلم‌ها';

  @override
  String get adminLibRealtimeMonitor => 'فعال کردن پایش بی‌درنگ';

  @override
  String get adminLibRealtimeMonitorHint =>
      'تغییرات فایل‌ها شناسایی و به‌طور خودکار پردازش می‌شوند.';

  @override
  String get adminLibEnablePhotos => 'نمایش عکس‌ها';

  @override
  String get adminLibSaveLocalMetadata => 'ذخیره آثار هنری در پوشه‌های رسانه';

  @override
  String get adminLibRefreshInterval => 'به‌روزرسانی خودکار فراداده';

  @override
  String get adminLibRefreshNever => 'هرگز';

  @override
  String get adminLibDefault => 'پیش‌فرض';

  @override
  String get adminLibDisplayTitle => 'نمایش';

  @override
  String get adminLibDisplaySection => 'نمایش کتابخانه';

  @override
  String get adminLibFolderView =>
      'نمایش نمای پوشه برای نشان دادن پوشه‌های رسانه ساده';

  @override
  String get adminLibSpecialsInSeasons =>
      'نمایش قسمت‌های ویژه در فصلی که پخش شده‌اند';

  @override
  String get adminLibGroupMovies => 'گروه‌بندی فیلم‌ها در مجموعه‌ها';

  @override
  String get adminLibGroupShows => 'گروه‌بندی سریال‌ها در مجموعه‌ها';

  @override
  String get adminLibExternalSuggestions => 'نمایش محتوای خارجی در پیشنهادها';

  @override
  String get adminLibDateAddedSection => 'رفتار تاریخ افزودن';

  @override
  String get adminLibDateAddedLabel => 'استفاده از تاریخ افزودن بر اساس';

  @override
  String get adminLibDateAddedImport => 'تاریخ پویش در کتابخانه';

  @override
  String get adminLibDateAddedFile => 'تاریخ ایجاد فایل';

  @override
  String get adminLibMetadataTitle => 'فراداده و تصاویر';

  @override
  String get adminLibMetadataLangSection => 'زبان ترجیحی فراداده';

  @override
  String get adminLibChaptersSection => 'فصل‌ها';

  @override
  String get adminLibDummyChapterDuration => 'مدت فصل ساختگی (ثانیه)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'طول فصل‌هایی که برای رسانه‌های بدون فصل ساخته می‌شوند. برای غیرفعال کردن روی 0 تنظیم کنید.';

  @override
  String get adminLibChapterImageResolution => 'وضوح تصویر فصل';

  @override
  String get adminLibNfoTitle => 'تنظیمات NFO';

  @override
  String get adminLibNfoHelp =>
      'فراداده NFO با Kodi و کلاینت‌های مشابه سازگار است. این تنظیمات برای همه کتابخانه‌هایی که فراداده NFO ذخیره می‌کنند اعمال می‌شود.';

  @override
  String get adminLibKodiUser =>
      'کاربری که داده‌های تماشای او در فایل‌های NFO ذخیره می‌شود';

  @override
  String get adminLibSaveImagePaths => 'ذخیره مسیر تصاویر در فایل‌های NFO';

  @override
  String get adminLibPathSubstitution =>
      'فعال کردن جایگزینی مسیر برای مسیرهای تصویر NFO';

  @override
  String get adminLibExtraThumbs =>
      'کپی تصاویر extrafanart در پوشه extrathumbs';

  @override
  String get adminLibNone => 'هیچ‌کدام';

  @override
  String adminLibRefreshDays(int days) {
    return '$days روز';
  }

  @override
  String get adminLibEmbeddedTitles => 'استفاده از عنوان‌های توکار';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'استفاده از عنوان‌های توکار برای موارد اضافی';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'استفاده از اطلاعات توکار قسمت';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'اجازه زیرنویس‌های توکار';

  @override
  String get adminLibEmbeddedAllowAll => 'اجازه همه';

  @override
  String get adminLibEmbeddedAllowText => 'فقط متنی';

  @override
  String get adminLibEmbeddedAllowImage => 'فقط تصویری';

  @override
  String get adminLibEmbeddedAllowNone => 'هیچ‌کدام';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'رد کردن دانلود در صورت وجود زیرنویس توکار';

  @override
  String get adminLibSkipIfAudioMatches =>
      'رد کردن دانلود اگر ترک صوتی با زبان دانلود مطابقت داشته باشد';

  @override
  String get adminLibRequirePerfectMatch => 'الزام تطابق کامل زیرنویس';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'ذخیره زیرنویس‌ها در پوشه‌های رسانه';

  @override
  String get adminLibChapterImageExtraction => 'استخراج تصاویر فصل';

  @override
  String get adminLibChapterImagesDuringScan =>
      'استخراج تصاویر فصل هنگام پویش کتابخانه';

  @override
  String get adminLibTrickplayExtraction =>
      'فعال کردن استخراج تصاویر Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'استخراج تصاویر Trickplay هنگام پویش کتابخانه';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'ذخیره تصاویر Trickplay در پوشه‌های رسانه';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'ادغام خودکار سریال‌هایی که در چند پوشه پراکنده‌اند';

  @override
  String get adminLibSeasonZeroName => 'نام نمایشی فصل صفر';

  @override
  String get adminLibLufsScan => 'فعال کردن پویش LUFS برای یکسان‌سازی صدا';

  @override
  String get adminLibPreferNonstandardArtist =>
      'ترجیح برچسب هنرمندان غیراستاندارد';

  @override
  String get adminLibAutoAddToCollection =>
      'افزودن خودکار فیلم‌ها به مجموعه‌ها';

  @override
  String get adminLibraryNameRequired => 'نام کتابخانه الزامی است';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'کتابخانه ایجاد نشد: $error';
  }

  @override
  String get adminLibraryName => 'نام کتابخانه';

  @override
  String get adminSelectedPaths => 'مسیرهای انتخاب شده:';

  @override
  String get adminCreateLibrary => 'ایجاد کتابخانه';

  @override
  String get paths => 'مسیرها:';

  @override
  String get adminDisableUser => 'کاربر را غیرفعال کنید';

  @override
  String get adminEnableUser => 'کاربر را فعال کنید';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name غیرفعال شود؟ آنها نمی توانند وارد سیستم شوند.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name فعال شود؟ آنها می توانند دوباره وارد سیستم شوند.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'کاربر \"$name\" غیرفعال شد';
  }

  @override
  String adminUserEnabled(String name) {
    return 'کاربر \"$name\" فعال شد';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'خط مشی کاربر به روز نشد: $error';
  }

  @override
  String get adminUsersLoadFailed => 'بارگیری کاربران انجام نشد';

  @override
  String get adminSearchUsers => 'جستجوی کاربران';

  @override
  String get adminEditUser => 'ویرایش کاربر';

  @override
  String get adminAddUser => 'افزودن کاربر';

  @override
  String adminUserCreateFailed(String error) {
    return 'کاربر ایجاد نشد: $error';
  }

  @override
  String get adminCreateUser => 'کاربر ایجاد کنید';

  @override
  String get adminPasswordOptional => 'رمز عبور (اختیاری)';

  @override
  String get adminUsernameRequired => 'نام کاربری نمی تواند خالی باشد';

  @override
  String adminSaveFailed(String error) {
    return 'ذخیره نشد: $error';
  }

  @override
  String get adminPasswordsMismatch => 'گذرواژه ها مطابقت ندارند';

  @override
  String adminFailed(String error) {
    return 'ناموفق: $error';
  }

  @override
  String get adminUserLoadFailed => 'کاربر بارگیری نشد';

  @override
  String get adminDeleteUser => 'حذف کاربر';

  @override
  String get admin => 'مدیر';

  @override
  String get adminFullAccessWarning =>
      'مدیران دسترسی کامل به سرور دارند. با احتیاط اعطا کنید.';

  @override
  String get administrator => 'مدیر';

  @override
  String get adminHiddenUser => 'کاربر پنهان';

  @override
  String get adminAllowMediaPlayback => 'اجازه پخش رسانه را بدهید';

  @override
  String get adminAllowAudioTranscoding => 'اجازه رمزگذاری صدا';

  @override
  String get adminAllowVideoTranscoding => 'اجازه رمزگذاری ویدیو';

  @override
  String get adminAllowRemuxing => 'اجازه ریمکس کردن';

  @override
  String get adminForceRemoteTranscoding => 'اجباری رمزگذاری منبع از راه دور';

  @override
  String get adminAllowContentDownloading => 'اجازه دانلود محتوا';

  @override
  String get adminAllowPublicSharing => 'اجازه اشتراک گذاری عمومی';

  @override
  String get adminAllowRemoteControl =>
      'اجازه کنترل از راه دور سایر کاربران را بدهید';

  @override
  String get adminAllowSharedDeviceControl => 'اجازه کنترل دستگاه مشترک';

  @override
  String get adminAllowRemoteAccess => 'اجازه دسترسی از راه دور';

  @override
  String get adminLeaveEmptyNoLimit => 'بدون محدودیت خالی بگذارید';

  @override
  String get adminMaxActiveSessions => 'حداکثر جلسات فعال';

  @override
  String get adminAllowLiveTvAccess => 'اجازه دسترسی به تلویزیون زنده';

  @override
  String get adminAllowLiveTvManagement => 'اجازه مدیریت تلویزیون زنده';

  @override
  String get adminAllowCollectionManagement => 'اجازه مدیریت مجموعه';

  @override
  String get adminAllowSubtitleManagement => 'اجازه مدیریت زیرنویس';

  @override
  String get adminAllowLyricManagement => 'اجازه مدیریت غزل';

  @override
  String get adminEnableAllLibraryAccess =>
      'دسترسی به تمام کتابخانه ها را فعال کنید';

  @override
  String get adminChangePassword => 'رمز عبور را تغییر دهید';

  @override
  String get adminNewPassword => 'رمز عبور جدید';

  @override
  String get adminConfirmPassword => 'رمز عبور را تایید کنید';

  @override
  String get adminSetPassword => 'رمز عبور را تنظیم کنید';

  @override
  String get adminResetPassword => 'بازنشانی رمز عبور';

  @override
  String get adminPasswordReset => 'بازنشانی رمز عبور';

  @override
  String get adminPasswordUpdated => 'رمز به روز شد';

  @override
  String get adminUserSettings => 'تنظیمات کاربر';

  @override
  String get adminLibraryAccess => 'دسترسی به کتابخانه';

  @override
  String get adminEnableAllDevices => 'دسترسی به همه دستگاه ها را فعال کنید';

  @override
  String get adminEnableAllChannels => 'دسترسی به همه کانال ها را فعال کنید';

  @override
  String get adminParentalControl => 'کنترل والدین';

  @override
  String get adminMaxParentalRating => 'حداکثر رده‌بندی سنی مجاز';

  @override
  String get adminMaxParentalRatingHint =>
      'محتوای با رده‌بندی بالاتر از این کاربر پنهان می‌شود.';

  @override
  String get adminParentalRatingNone => 'هیچ‌کدام';

  @override
  String get adminBlockUnratedItems =>
      'مسدود کردن مواردی که اطلاعات رده‌بندی ندارند یا رده‌بندی‌شان ناشناخته است';

  @override
  String get adminUnratedBook => 'کتاب‌ها';

  @override
  String get adminUnratedChannelContent => 'کانال‌ها';

  @override
  String get adminUnratedLiveTvChannel => 'تلویزیون زنده';

  @override
  String get adminUnratedMovie => 'فیلم‌ها';

  @override
  String get adminUnratedMusic => 'موسیقی';

  @override
  String get adminUnratedTrailer => 'تریلرها';

  @override
  String get adminUnratedSeries => 'سریال‌ها';

  @override
  String get adminAccessSchedules => 'زمان‌بندی‌های دسترسی';

  @override
  String get adminAccessSchedulesHint =>
      'دسترسی فقط در زمان‌های زمان‌بندی‌شده زیر مجاز است. وقتی زمان‌بندی‌ای تنظیم نشده باشد، دسترسی در تمام طول روز مجاز است.';

  @override
  String get adminAddSchedule => 'افزودن زمان‌بندی';

  @override
  String get adminScheduleDay => 'روز';

  @override
  String get adminScheduleStart => 'شروع';

  @override
  String get adminScheduleEnd => 'پایان';

  @override
  String get adminDayEveryday => 'هر روز';

  @override
  String get adminDayWeekday => 'روزهای هفته';

  @override
  String get adminDayWeekend => 'آخر هفته';

  @override
  String get adminDaySunday => 'یکشنبه';

  @override
  String get adminDayMonday => 'دوشنبه';

  @override
  String get adminDayTuesday => 'سه‌شنبه';

  @override
  String get adminDayWednesday => 'چهارشنبه';

  @override
  String get adminDayThursday => 'پنجشنبه';

  @override
  String get adminDayFriday => 'جمعه';

  @override
  String get adminDaySaturday => 'شنبه';

  @override
  String get adminAllowedTags => 'برچسب‌های مجاز';

  @override
  String get adminAllowedTagsHint =>
      'فقط محتوای دارای این برچسب‌ها نمایش داده می‌شود. برای اجازه به همه، خالی بگذارید.';

  @override
  String get adminBlockedTags => 'برچسب‌های مسدود';

  @override
  String get adminBlockedTagsHint =>
      'محتوای دارای این برچسب‌ها از این کاربر پنهان می‌شود.';

  @override
  String get adminAddTag => 'افزودن برچسب';

  @override
  String get adminAuthProvider => 'ارائه‌دهنده احراز هویت';

  @override
  String get adminPasswordResetProvider => 'ارائه‌دهنده بازنشانی رمز عبور';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'حداکثر تلاش‌های ناموفق ورود پیش از قفل شدن';

  @override
  String get adminLoginAttemptsHint =>
      'برای مقدار پیش‌فرض روی 0 و برای غیرفعال کردن قفل شدن روی -1 تنظیم کنید.';

  @override
  String get adminSyncPlayAccess => 'دسترسی SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin => 'اجازه ساخت و پیوستن به گروه‌ها';

  @override
  String get adminSyncPlayJoin => 'اجازه پیوستن به گروه‌ها';

  @override
  String get adminSyncPlayNone => 'بدون دسترسی';

  @override
  String get adminContentDeletionFolders => 'اجازه حذف محتوا از';

  @override
  String get adminResetPasswordWarning =>
      'با این کار رمز عبور حذف می شود. کاربر می تواند بدون رمز ورود وارد شود.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'سرور HTTP را برگرداند $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'آیا مطمئن هستید که می خواهید $name را حذف کنید؟';
  }

  @override
  String adminUserDeleted(String name) {
    return 'کاربر \"$name\" حذف شد';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'کاربر حذف نشد: $error';
  }

  @override
  String get adminCreateApiKey => 'کلید API ایجاد کنید';

  @override
  String get adminAppName => 'نام برنامه';

  @override
  String get adminApiKeyCreated => 'کلید API ایجاد شد';

  @override
  String get adminApiKeyCreatedNoToken =>
      'کلید با موفقیت ایجاد شد. سرور توکن را برنگرداند. کلیدهای API سرور را بررسی کنید.';

  @override
  String get adminKeyCopied => 'کلید در کلیپ بورد کپی شد';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'کلید ایجاد نشد: $error';
  }

  @override
  String get adminKeyTokenMissing => 'رمز کلید در پاسخ سرور وجود ندارد';

  @override
  String get adminRevokeApiKey => 'لغو کلید API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'کلید برای $name لغو شود؟';
  }

  @override
  String get adminApiKeyRevoked => 'کلید API باطل شد';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'کلید لغو نشد: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'کلیدهای API بارگیری نشد';

  @override
  String get adminApiKeysTitle => 'کلیدهای API';

  @override
  String get adminCreateKey => 'کلید ایجاد کنید';

  @override
  String get adminNoApiKeys => 'هیچ کلید API یافت نشد';

  @override
  String get adminUnknownApp => 'برنامه ناشناخته';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'رمز: $token\\nایجاد شده: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'ایجاد پشتیبان';

  @override
  String get adminBackupDatabase => 'پایگاه داده';

  @override
  String get adminBackupDatabaseAlways => 'همیشه گنجانده می‌شود';

  @override
  String get adminBackupMetadata => 'فراداده';

  @override
  String get adminBackupSubtitles => 'زیرنویس‌ها';

  @override
  String get adminBackupTrickplay => 'تصاویر Trickplay';

  @override
  String get adminCreatingBackup => 'در حال ایجاد پشتیبان...';

  @override
  String get adminBackupCreated => 'پشتیبان گیری با موفقیت ایجاد شد';

  @override
  String adminBackupCreateFailed(String error) {
    return 'پشتیبان‌گیری ایجاد نشد: $error';
  }

  @override
  String get adminBackupPathMissing => 'مسیر پشتیبان در پاسخ سرور وجود ندارد';

  @override
  String adminBackupManifest(String name) {
    return 'مانیفست: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'مانیفست بارگیری نشد: $error';
  }

  @override
  String get adminConfirmRestore => 'Restore را تایید کنید';

  @override
  String get adminRestoringBackup => 'در حال بازیابی نسخه پشتیبان...';

  @override
  String adminRestoreFailed(String error) {
    return 'پشتیبان‌گیری بازیابی نشد: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'پشتیبان‌گیری بارگیری نشد';

  @override
  String get adminCreateBackup => 'ایجاد پشتیبان';

  @override
  String get adminNoBackups => 'هیچ نسخه پشتیبان پیدا نشد';

  @override
  String get adminViewDetails => 'مشاهده جزئیات';

  @override
  String get restore => 'بازیابی کنید';

  @override
  String get adminLogsLoadFailed => 'گزارش‌های سرور بارگیری نشد';

  @override
  String get adminNoLogFiles => 'هیچ فایل گزارشی یافت نشد';

  @override
  String get adminLogCopied => 'گزارش در کلیپ بورد کپی شد';

  @override
  String get adminSaveLogFile => 'ذخیره فایل گزارش';

  @override
  String adminSavedTo(String path) {
    return 'ذخیره شده در $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'فایل ذخیره نشد: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName بارگیری نشد';
  }

  @override
  String get adminSearchInLog => 'جستجو در ورود';

  @override
  String get adminNoMatchingLines => 'بدون خطوط منطبق';

  @override
  String adminTasksLoadFailed(String error) {
    return 'وظایف بارگیری نشد: $error';
  }

  @override
  String get adminNoScheduledTasks => 'هیچ کار برنامه ریزی شده ای پیدا نشد';

  @override
  String get adminNoTasksMatchFilter => 'هیچ کاری با فیلتر فعلی مطابقت ندارد';

  @override
  String adminTaskStartFailed(String error) {
    return 'شروع کار ناموفق بود: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'کار متوقف نشد: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'کار بارگیری نشد: $error';
  }

  @override
  String get adminRunNow => 'اکنون اجرا کنید';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ماشه حذف نشد: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ماشه اضافه نشد: $error';
  }

  @override
  String get adminLastExecution => 'آخرین اعدام';

  @override
  String get adminTriggers => 'محرک ها';

  @override
  String get adminAddTrigger => 'ماشه را اضافه کنید';

  @override
  String get adminNoTriggers => 'هیچ محرکی پیکربندی نشده است';

  @override
  String get adminTriggerType => 'نوع ماشه';

  @override
  String get adminNoLimit => 'بدون محدودیت';

  @override
  String adminHours(String hours) {
    return '$hours ساعت(ها)';
  }

  @override
  String get adminDayOfWeek => 'روز هفته';

  @override
  String get adminSearchPlugins => 'جستجوی افزونه ها...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'تغییر پلاگین انجام نشد: $error';
  }

  @override
  String get adminUninstallPlugin => 'حذف نصب افزونه';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'آیا مطمئن هستید که می‌خواهید «$name» را حذف نصب کنید؟';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'پلاگین حذف نصب نشد: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'بسته نصب نشد: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'به روز رسانی نصب نشد: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'پلاگین ها بارگیری نشد: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'هیچ افزونه ای با جستجوی شما مطابقت ندارد';

  @override
  String get adminNoPluginsInstalled => 'هیچ پلاگینی نصب نشده است';

  @override
  String adminInstallUpdate(String version) {
    return 'نصب به‌روزرسانی (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'کاتالوگ بارگیری نشد: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'هیچ بسته ای با جستجوی شما مطابقت ندارد';

  @override
  String get adminNoPackagesAvailable => 'هیچ بسته ای موجود نیست';

  @override
  String get adminExperimentalIntegration => 'ادغام تجربی';

  @override
  String get adminExperimentalWarning =>
      'ادغام تنظیمات افزونه هنوز آزمایشی است. برخی از صفحات تنظیمات ممکن است به درستی ارائه نشوند.';

  @override
  String get continueAction => 'ادامه دهید';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" پس از راه اندازی مجدد سرور حذف خواهد شد';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'حذف نصب نشد: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'در حال به روز رسانی \"$name\" به v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'افزونه بارگیری نشد: $error';
  }

  @override
  String get adminPluginNotFound => 'افزونه پیدا نشد';

  @override
  String adminPluginVersion(String version) {
    return 'نسخه $version';
  }

  @override
  String get adminEnablePlugin => 'افزونه را فعال کنید';

  @override
  String get adminPluginSettingsPage => 'صفحه تنظیمات افزونه';

  @override
  String get adminRevisionHistory => 'تاریخچه تجدید نظر';

  @override
  String get adminNoChangelog => 'تغییراتی در دسترس نیست.';

  @override
  String get adminRemoveRepository => 'Repository را حذف کنید';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'آیا مطمئن هستید که می خواهید \"$name\" را حذف کنید؟';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'مخازن ذخیره نشد: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'بارگیری مخازن انجام نشد: $error';
  }

  @override
  String get adminRepositoryNameHint => 'به عنوان مثال Jellyfin پایدار';

  @override
  String get adminRepositoryUrl => 'URL مخزن';

  @override
  String get adminAddEntry => 'افزودن ورودی';

  @override
  String get adminInvalidUrl => 'URL نامعتبر است';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'بارگیری تنظیمات افزونه ممکن نیست: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri باز نشد';
  }

  @override
  String get adminOpenInBrowser => 'در مرورگر باز کنید';

  @override
  String get adminOpenExternally => 'خارجی باز کنید';

  @override
  String get adminGeneralSettings => 'تنظیمات عمومی';

  @override
  String get adminServerName => 'نام سرور';

  @override
  String get adminPreferredMetadataCountry => 'کشور فراداده ترجیحی';

  @override
  String get adminCachePath => 'مسیر کش';

  @override
  String get adminMetadataPath => 'مسیر فراداده';

  @override
  String get adminLibraryScanConcurrency => 'همزمانی اسکن کتابخانه';

  @override
  String get adminParallelImageEncodingLimit => 'محدودیت رمزگذاری تصویر موازی';

  @override
  String get adminSlowResponseThreshold => 'آستانه پاسخ آهسته (ms)';

  @override
  String get adminBrandingLoadFailed => 'تنظیمات نام تجاری بارگیری نشد';

  @override
  String get adminLoginDisclaimer => 'سلب مسئولیت ورود';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML در زیر فرم ورود نمایش داده می شود';

  @override
  String get adminCustomCss => 'CSS سفارشی';

  @override
  String get adminCustomCssHint => 'CSS سفارشی روی رابط وب اعمال می شود';

  @override
  String get adminEnableSplashScreen => 'روشن کردن صفحه نمایش را فعال کنید';

  @override
  String get adminStreamingLoadFailed => 'تنظیمات پخش جریانی بارگیری نشد';

  @override
  String get adminStreamingDescription =>
      'محدودیت‌های جهانی نرخ بیت جریان را برای اتصالات از راه دور تنظیم کنید.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'محدودیت نرخ بیت کلاینت راه دور (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'خالی یا 0 برای نامحدود بگذارید';

  @override
  String get adminPlaybackLoadFailed => 'تنظیمات پخش بارگیری نشد';

  @override
  String get adminHardwareAcceleration => 'شتاب سخت افزاری';

  @override
  String get adminVaapiDevice => 'دستگاه VA-API';

  @override
  String get adminEnableHardwareEncoding => 'رمزگذاری سخت افزاری را فعال کنید';

  @override
  String get adminEnableHardwareDecoding =>
      'فعال کردن رمزگشایی سخت افزاری برای:';

  @override
  String get adminEncodingThreads => 'رشته های رمزگذاری';

  @override
  String get adminAutomatic => '0 = خودکار';

  @override
  String get adminTranscodingTempPath => 'مسیر موقت رمزگذاری';

  @override
  String get adminEnableFallbackFont => 'فونت بازگشتی را فعال کنید';

  @override
  String get adminFallbackFontPath => 'مسیر فونت بازگشتی';

  @override
  String get adminAllowSegmentDeletion => 'اجازه حذف بخش';

  @override
  String get adminSegmentKeepSeconds => 'نگه داشتن بخش (ثانیه)';

  @override
  String get adminThrottleBuffering => 'بافر دریچه گاز';

  @override
  String get adminTrickplayLoadFailed => 'تنظیمات trickplay بارگیری نشد';

  @override
  String get adminEnableHardwareAcceleration => 'فعال کردن شتاب سخت افزاری';

  @override
  String get adminEnableKeyFrameExtraction => 'فعال کردن استخراج فقط قاب کلید';

  @override
  String get adminKeyFrameSubtitle => 'سریعتر اما دقت کمتر';

  @override
  String get adminScanBehavior => 'اسکن رفتار';

  @override
  String get adminProcessPriority => 'اولویت فرآیند';

  @override
  String get adminImageSettings => 'تنظیمات تصویر';

  @override
  String get adminIntervalMs => 'فاصله زمانی (میلی‌ثانیه)';

  @override
  String get adminCaptureFrameSubtitle =>
      'هر چند وقت یکبار از فریم ها عکس بگیرید';

  @override
  String get adminWidthResolutions => 'رزولوشن های عرض';

  @override
  String get adminTileWidth => 'عرض کاشی';

  @override
  String get adminTileHeight => 'ارتفاع کاشی';

  @override
  String get adminQualitySubtitle =>
      'مقادیر کمتر = کیفیت بهتر، فایل های بزرگتر';

  @override
  String get adminProcessThreads => 'رشته ها را پردازش کنید';

  @override
  String get adminResumeLoadFailed => 'تنظیمات رزومه بارگیری نشد';

  @override
  String get adminResumeDescription =>
      'زمانی که محتوا باید به‌عنوان نیمه پخش شده یا کامل پخش شده علامت‌گذاری شود، پیکربندی کنید.';

  @override
  String get adminMinResumePercentage => 'حداقل درصد رزومه';

  @override
  String get adminMinResumeSubtitle =>
      'برای صرفه جویی در پیشرفت، محتوا باید بیش از این درصد پخش شود';

  @override
  String get adminMaxResumePercentage => 'حداکثر درصد رزومه';

  @override
  String get adminMaxResumeSubtitle =>
      'پس از این درصد، محتوا به طور کامل پخش شده در نظر گرفته می شود';

  @override
  String get adminMinResumeDuration => 'حداقل مدت رزومه (ثانیه)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'موارد کوتاه‌تر از این قابل ازسرگیری نیستند';

  @override
  String get adminMinAudiobookResume => 'حداقل درصد رزومه کتاب صوتی';

  @override
  String get adminMaxAudiobookResume => 'حداکثر درصد رزومه کتاب صوتی';

  @override
  String get adminNetworkingLoadFailed => 'تنظیمات شبکه بارگیری نشد';

  @override
  String get adminNetworkingWarning =>
      'تغییرات در تنظیمات شبکه ممکن است نیاز به راه اندازی مجدد سرور داشته باشد.';

  @override
  String get adminEnableRemoteAccess => 'دسترسی از راه دور را فعال کنید';

  @override
  String get ports => 'پورت ها';

  @override
  String get adminHttpPort => 'پورت HTTP';

  @override
  String get adminHttpsPort => 'پورت HTTPS';

  @override
  String get adminPublicHttpsPort => 'پورت عمومی HTTPS';

  @override
  String get adminBaseUrl => 'URL پایه';

  @override
  String get adminBaseUrlHint => 'مثلاً /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS را فعال کنید';

  @override
  String get adminLocalNetwork => 'شبکه محلی';

  @override
  String get adminLocalNetworkAddresses => 'آدرس شبکه های محلی';

  @override
  String get adminKnownProxies => 'پروکسی های شناخته شده';

  @override
  String get adminRemoteIpFilter => 'فیلتر IP از راه دور';

  @override
  String get adminRemoteIpFilterEntries => 'فیلتر IP از راه دور';

  @override
  String get adminCertificatePath => 'مسیر گواهینامه';

  @override
  String get whitelist => 'لیست سفید';

  @override
  String get blacklist => 'لیست سیاه';

  @override
  String get notSet => 'تنظیم نشده است';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'ابرداده بارگیری نشد: $error';
  }

  @override
  String get adminRefreshMetadata => 'به‌روزرسانی فراداده';

  @override
  String get recursive => 'بازگشتی';

  @override
  String get adminReplaceAllMetadata => 'همه متادیتا را جایگزین کنید';

  @override
  String get adminMetadataRefreshRequested => 'به‌روزرسانی فراداده درخواست شد';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'فراداده بازخوانی نشد: $error';
  }

  @override
  String get adminNoRemoteMatches => 'هیچ منطبق از راه دور پیدا نشد';

  @override
  String get adminRemoteResults => 'نتایج از راه دور';

  @override
  String get adminRemoteMetadataApplied => 'ابرداده از راه دور اعمال شد';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'جستجوی راه دور ناموفق بود: $error';
  }

  @override
  String get adminUpdateContentType => 'نوع محتوا را به روز کنید';

  @override
  String get adminContentType => 'نوع محتوا';

  @override
  String get adminContentTypeUpdated => 'نوع محتوا به روز شد';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'نوع محتوا به‌روزرسانی نشد: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'ویرایشگر فراداده بارگیری نشد';

  @override
  String get adminNoPeopleEntries => 'هیچ ورودی شخصی وجود ندارد';

  @override
  String get adminNoExternalIds => 'هیچ شناسه خارجی موجود نیست';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType تصویر به روز شد';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'تصویر دانلود نشد: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'فرمت تصویر پشتیبانی نشده';

  @override
  String get adminImageReadFailed => 'تصویر انتخابی خوانده نشد';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType تصویر آپلود شد';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'تصویر آپلود نشد: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'تصویر $imageType را حذف کنید';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'تصویر $imageType حذف شد';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'تصویر حذف نشد: $error';
  }

  @override
  String get adminAllProviders => 'همه ارائه دهندگان';

  @override
  String get adminNoRemoteImages => 'هیچ تصویری از راه دور پیدا نشد';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'کشف تیونر ناموفق بود: $error';
  }

  @override
  String get adminTunerTypeM3u => 'تیونر M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'فایل یا URL';

  @override
  String get adminTunerIpAddress => 'آدرس IP تیونر';

  @override
  String get adminTunerFriendlyName => 'نام نمایشی';

  @override
  String get adminTunerUserAgent => 'عامل کاربر';

  @override
  String get adminTunerCount => 'محدودیت اتصال هم‌زمان';

  @override
  String get adminTunerCountHelp =>
      'حداکثر تعداد جریان‌هایی که تیونر به‌طور هم‌زمان اجازه می‌دهد. برای نامحدود روی 0 تنظیم کنید.';

  @override
  String get adminTunerFallbackBitrate => 'حداکثر نرخ بیت پخش جریانی جایگزین';

  @override
  String get adminTunerImportFavoritesOnly => 'وارد کردن فقط کانال‌های دلخواه';

  @override
  String get adminTunerAllowHwTranscoding => 'اجازه ترنسکد سخت‌افزاری';

  @override
  String get adminTunerAllowFmp4 => 'اجازه کانتینر ترنسکد fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'اجازه اشتراک‌گذاری جریان';

  @override
  String get adminTunerEnableStreamLooping => 'فعال کردن تکرار جریان';

  @override
  String get adminTunerIgnoreDts => 'نادیده گرفتن DTS';

  @override
  String get adminTunerReadAtNativeFramerate => 'خواندن ورودی با نرخ فریم اصلی';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'فایل یا URL';

  @override
  String get adminXmltvMoviePrefix => 'پیشوند فیلم';

  @override
  String get adminXmltvMovieCategories => 'دسته‌بندی‌های فیلم';

  @override
  String get adminXmltvCategoriesHelp =>
      'چند دسته‌بندی را با خط عمودی از هم جدا کنید.';

  @override
  String get adminXmltvKidsCategories => 'دسته‌بندی‌های کودکان';

  @override
  String get adminXmltvNewsCategories => 'دسته‌بندی‌های اخبار';

  @override
  String get adminXmltvSportsCategories => 'دسته‌بندی‌های ورزشی';

  @override
  String get adminSdUsername => 'نام کاربری';

  @override
  String get adminSdPassword => 'رمز عبور';

  @override
  String get adminSdCountry => 'کشور';

  @override
  String get adminSdCountrySelect => 'یک کشور انتخاب کنید';

  @override
  String get adminSdPostalCode => 'کد پستی';

  @override
  String get adminEnableAllTuners => 'فعال کردن همه تیونرها';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'تنظیم کننده حذف نشد: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'ارائه دهنده حذف نشد: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'مسیر ضبط سریال';

  @override
  String get adminMovieRecordingPath => 'مسیر ضبط فیلم';

  @override
  String get adminGuideDaysAuto => 'خودکار';

  @override
  String get adminRecordingPostProcessor => 'مسیر برنامه پس‌پردازش';

  @override
  String get adminRecordingPostProcessorArgs => 'آرگومان‌های پس‌پردازنده';

  @override
  String get adminSaveRecordingNfo => 'ذخیره فراداده NFO ضبط';

  @override
  String get adminSaveRecordingImages => 'ذخیره تصاویر ضبط';

  @override
  String get adminLiveTvSectionPaths => 'مسیرهای ضبط';

  @override
  String get adminLiveTvSectionPostProcessing => 'پس‌پردازش';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'تنظیمات ذخیره نشد: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'مدیریت پخش زنده بارگیری نشد';

  @override
  String get adminTunerDevices => 'دستگاه های تیونر';

  @override
  String get adminNoTunerHosts => 'هیچ میزبان تیونری پیکربندی نشده است';

  @override
  String get adminGuideProviders => 'ارائه دهندگان راهنما';

  @override
  String get adminGuideRefreshStarted => 'به‌روزرسانی داده راهنما آغاز شد';

  @override
  String get adminGuideRefreshUnavailable =>
      'وظیفه به‌روزرسانی راهنما در این سرور در دسترس نیست.';

  @override
  String get adminNoListingProviders =>
      'هیچ ارائه دهنده فهرستی پیکربندی نشده است';

  @override
  String get adminSettingsSaved => 'تنظیمات ذخیره شد';

  @override
  String get adminBackupsNotAvailable =>
      'پشتیبان گیری در این ساخت سرور در دسترس نیست.';

  @override
  String get adminRestoreWarning1 =>
      'بازیابی همه داده های سرور فعلی را با داده های پشتیبان جایگزین می کند.';

  @override
  String get adminRestoreWarning2 =>
      'تنظیمات سرور فعلی، کاربران و داده های کتابخانه رونویسی خواهند شد.';

  @override
  String get adminRestoreWarning3 =>
      'سرور پس از بازیابی مجدد راه اندازی می شود.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'اکنون پشتیبان $name بازیابی شود؟';
  }

  @override
  String get adminBackupsTitle => 'پشتیبان گیری';

  @override
  String get adminUnknownDate => 'تاریخ نامعلوم';

  @override
  String get adminUnnamedBackup => 'پشتیبان گیری بدون نام';

  @override
  String get adminApply => 'اعمال';

  @override
  String get adminLogsTitle => 'گزارش های سرور';

  @override
  String get adminLogsNewestFirst => 'جدیدترین اول';

  @override
  String get adminLogsOldestFirst => 'قدیمی ترین اول';

  @override
  String get adminLogsJustNow => 'همین الان';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes دقیقه پیش';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours ساعت قبل';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days روز قبل';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName بارگیری نشد';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count مطابقت دارد';
  }

  @override
  String get adminLogViewerNoMatches => 'بدون خطوط منطبق';

  @override
  String get adminMetadataEditorTitle => 'ویرایشگر فراداده';

  @override
  String get adminMetadataIdentify => 'شناسایی';

  @override
  String get adminMetadataType => 'تایپ کنید';

  @override
  String get adminMetadataDetails => 'جزئیات';

  @override
  String get adminMetadataExternalIds => 'شناسه های خارجی';

  @override
  String get adminMetadataImages => 'تصاویر';

  @override
  String get adminMetadataFieldTitle => 'عنوان';

  @override
  String get adminMetadataFieldSortTitle => 'عنوان را مرتب کنید';

  @override
  String get adminMetadataFieldOriginalTitle => 'عنوان اصلی';

  @override
  String get adminMetadataFieldPremiereDate => 'تاریخ پخش (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'تاریخ پایان (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'سال تولید';

  @override
  String get adminMetadataFieldOfficialRating => 'رتبه بندی رسمی';

  @override
  String get adminMetadataFieldCommunityRating => 'رتبه بندی جامعه';

  @override
  String get adminMetadataFieldCriticRating => 'رتبه بندی منتقد';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'شعار';

  @override
  String get adminMetadataFieldOverview => 'نمای کلی';

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
  String get adminMetadataGenres => 'ژانرها';

  @override
  String get adminMetadataTags => 'برچسب ها';

  @override
  String get adminMetadataStudios => 'استودیوها';

  @override
  String get adminMetadataPeople => 'مردم';

  @override
  String get adminMetadataAddGenre => 'اضافه کردن ژانر';

  @override
  String get adminMetadataAddTag => 'برچسب اضافه کنید';

  @override
  String get adminMetadataAddStudio => 'اضافه کردن استودیو';

  @override
  String get adminMetadataAddPerson => 'فرد را اضافه کنید';

  @override
  String get adminMetadataEditPerson => 'شخص را ویرایش کنید';

  @override
  String get adminMetadataRole => 'نقش';

  @override
  String get adminMetadataImagePrimary => 'اولیه';

  @override
  String get adminMetadataImageBackdrop => 'پس زمینه';

  @override
  String get adminMetadataImageLogo => 'لوگو';

  @override
  String get adminMetadataImageBanner => 'بنر';

  @override
  String get adminMetadataImageThumb => 'انگشت شست';

  @override
  String get adminMetadataProvider => 'ارائه دهنده';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType تصویر به روز شد';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType تصویر آپلود شد';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'تصویر $imageType حذف شد';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'تصویر دانلود نشد: $error';
  }

  @override
  String get adminMetadataImageReadFailed => 'تصویر انتخابی خوانده نشد';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'تصویر آپلود نشد: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'تصویر $imageType را حذف کنید';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'این تصویر فعلی را از آیتم حذف می کند.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'تصویر حذف نشد: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'تصویر $imageType را انتخاب کنید';
  }

  @override
  String get adminMetadataUpload => 'آپلود کنید';

  @override
  String get adminMetadataUpdate => 'به روز رسانی';

  @override
  String get adminMetadataRemoteImage => 'تصویر از راه دور';

  @override
  String get adminPluginsInstalled => 'نصب شده است';

  @override
  String get adminPluginsCatalog => 'کاتالوگ';

  @override
  String get adminPluginsActive => 'فعال';

  @override
  String get adminPluginsRestart => 'راه اندازی مجدد';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'هیچ افزونه ای با جستجوی شما مطابقت ندارد';

  @override
  String get adminPluginsNoneInstalled => 'هیچ پلاگینی نصب نشده است';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'به‌روزرسانی موجود است: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'به روز رسانی موجود است';

  @override
  String get adminPluginsPendingRemoval =>
      'در انتظار حذف پس از راه اندازی مجدد';

  @override
  String get adminPluginsChangesPending => 'تغییرات در انتظار راه اندازی مجدد';

  @override
  String get adminPluginsEnable => 'فعال کردن';

  @override
  String get adminPluginsDisable => 'غیر فعال کردن';

  @override
  String get adminPluginsInstallUpdate => 'آپدیت را نصب کنید';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'نصب به‌روزرسانی (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'هیچ بسته ای با جستجوی شما مطابقت ندارد';

  @override
  String get adminPluginsCatalogEmpty => 'هیچ بسته ای موجود نیست';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" در حال نصب است...';
  }

  @override
  String get adminPluginDetailExperimental => 'ادغام تجربی';

  @override
  String get adminPluginDetailExperimentalContent =>
      'ادغام تنظیمات افزونه هنوز آزمایشی است. برخی از فیلدها یا طرح‌بندی‌ها ممکن است هنوز به درستی ارائه نشوند.';

  @override
  String get adminPluginDetailToggle404 =>
      'جابجایی افزونه انجام نشد. سرور نتوانست این نسخه افزونه را پیدا کند. افزونه‌های تازه‌سازی را امتحان کنید، سپس دوباره امتحان کنید.';

  @override
  String get adminPluginDetailToggleDioError =>
      'جابجایی افزونه انجام نشد. لطفا گزارش های سرور را برای جزئیات بررسی کنید.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name تنظیمات';
  }

  @override
  String get adminPluginDetailDetails => 'جزئیات';

  @override
  String get adminPluginDetailDeveloper => 'توسعه دهنده';

  @override
  String get adminPluginDetailRepository => 'مخزن';

  @override
  String get adminPluginDetailBundled => 'همراه';

  @override
  String get adminPluginDetailEnablePlugin => 'افزونه را فعال کنید';

  @override
  String get adminPluginDetailRestartRequired =>
      'برای اعمال تغییرات به راه اندازی مجدد سرور نیاز است.';

  @override
  String get adminPluginDetailRemovalPending =>
      'این افزونه پس از راه اندازی مجدد سرور حذف خواهد شد.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'این افزونه دچار مشکل شده است و ممکن است به درستی کار نکند.';

  @override
  String get adminPluginDetailNotSupported =>
      'این افزونه توسط نسخه سرور فعلی پشتیبانی نمی شود.';

  @override
  String get adminPluginDetailSuperseded =>
      'این افزونه با نسخه جدیدتر جایگزین شده است.';

  @override
  String adminReposLoadFailed(String error) {
    return 'بارگیری مخازن انجام نشد: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Repository را حذف کنید';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'آیا مطمئن هستید که می خواهید \"$name\" را حذف کنید؟';
  }

  @override
  String get adminReposRemove => 'حذف';

  @override
  String adminReposSaveFailed(String error) {
    return 'مخازن ذخیره نشد: $error';
  }

  @override
  String get adminReposEmpty => 'هیچ مخزن پیکربندی نشده است';

  @override
  String get adminReposEmptySubtitle =>
      'برای مرور افزونه های موجود، یک مخزن اضافه کنید';

  @override
  String get adminReposUnnamed => '(بی نام)';

  @override
  String get adminReposEditTitle => 'ویرایش مخزن';

  @override
  String get adminReposAddTitle => 'افزودن مخزن';

  @override
  String get adminReposUrl => 'URL مخزن';

  @override
  String get adminReposNameHint => 'به عنوان مثال Jellyfin پایدار';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL نامعتبر است';

  @override
  String get adminGeneralSettingsTitle => 'تنظیمات عمومی';

  @override
  String get adminGeneralMetadataLanguage => 'زبان فراداده ترجیحی';

  @override
  String get adminGeneralMetadataLanguageHint => 'به عنوان مثال en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'کشور فراداده ترجیحی';

  @override
  String get adminGeneralMetadataCountryHint =>
      'به عنوان مثال ایالات متحده، DE، FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'همزمانی اسکن کتابخانه';

  @override
  String get adminGeneralImageEncodingLimit => 'محدودیت رمزگذاری تصویر موازی';

  @override
  String get adminUnknownError => 'خطای ناشناخته';

  @override
  String get adminBrowse => 'مرور کنید';

  @override
  String get adminCloseBrowser => 'مرورگر را ببندید';

  @override
  String get adminNetworkingTitle => 'شبکه سازی';

  @override
  String get adminNetworkingRestartWarning =>
      'تغییرات در تنظیمات شبکه ممکن است نیاز به راه اندازی مجدد سرور داشته باشد.';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS را فعال کنید';

  @override
  String get adminNetworkingAddressHint => 'به عنوان مثال 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'پروکسی های شناخته شده';

  @override
  String get adminNetworkingProxyHint => 'به عنوان مثال 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'لیست سفید';

  @override
  String get adminNetworkingBlacklist => 'لیست سیاه';

  @override
  String get adminNetworkingAddEntry => 'افزودن ورودی';

  @override
  String get adminBrandingTitle => 'برندسازی';

  @override
  String get adminBrandingLoginDisclaimer => 'سلب مسئولیت ورود';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML در زیر فرم ورود نمایش داده می شود';

  @override
  String get adminBrandingCustomCss => 'CSS سفارشی';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS سفارشی روی رابط وب اعمال می شود';

  @override
  String get adminBrandingEnableSplash => 'روشن کردن صفحه نمایش را فعال کنید';

  @override
  String get adminBrandingSplashUpload => 'بارگذاری تصویر';

  @override
  String get adminBrandingSplashUploaded => 'صفحه شروع به‌روزرسانی شد';

  @override
  String get adminBrandingSplashUploadFailed => 'بارگذاری صفحه شروع ناموفق بود';

  @override
  String get adminBrandingSplashDeleted => 'صفحه شروع حذف شد';

  @override
  String get adminBrandingNoSplash => 'بدون صفحه شروع سفارشی';

  @override
  String get adminPlaybackHwAccel => 'شتاب سخت افزاری';

  @override
  String get adminPlaybackHwAccelLabel => 'شتاب سخت افزاری';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'رمزگذاری سخت افزاری را فعال کنید';

  @override
  String get adminPlaybackQsvDevice => 'دستگاه QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'فعال کردن رمزگشای پیشرفته NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'ترجیح رمزگشای سخت‌افزاری بومی سیستم';

  @override
  String get adminPlaybackColorDepth10Hevc => 'رمزگشایی 10-بیتی HEVC';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'رمزگشایی 10-بیتی VP9';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'رمزگشایی 8/10-بیتی HEVC RExt';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'رمزگشایی 12-بیتی HEVC RExt';

  @override
  String get adminPlaybackHwEncodingSection => 'کدگذاری سخت‌افزاری';

  @override
  String get adminPlaybackAllowHevcEncoding => 'اجازه کدگذاری HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'اجازه کدگذاری AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'فعال کردن کدگذار کم‌مصرف H.264 اینتل';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'فعال کردن کدگذار کم‌مصرف HEVC اینتل';

  @override
  String get adminPlaybackToneMapping => 'نگاشت تُن';

  @override
  String get adminPlaybackEnableTonemapping => 'فعال کردن نگاشت تُن';

  @override
  String get adminPlaybackEnableVppTonemapping => 'فعال کردن نگاشت تُن VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'فعال کردن نگاشت تُن VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'الگوریتم نگاشت تُن';

  @override
  String get adminPlaybackTonemappingMode => 'حالت نگاشت تُن';

  @override
  String get adminPlaybackTonemappingRange => 'محدوده نگاشت تُن';

  @override
  String get adminPlaybackTonemappingDesat => 'کاهش اشباع نگاشت تُن';

  @override
  String get adminPlaybackTonemappingPeak => 'اوج نگاشت تُن';

  @override
  String get adminPlaybackTonemappingParam => 'پارامتر نگاشت تُن';

  @override
  String get adminPlaybackVppTonemappingBrightness => 'روشنایی نگاشت تُن VPP';

  @override
  String get adminPlaybackVppTonemappingContrast => 'کنتراست نگاشت تُن VPP';

  @override
  String get adminPlaybackEncoderPreset => 'پیش‌تنظیم کدگذار';

  @override
  String get adminPlaybackH264Crf => 'CRF کدگذاری H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF کدگذاری H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'روش حذف درهم‌بافتگی';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'دو برابر کردن نرخ فریم هنگام حذف درهم‌بافتگی';

  @override
  String get adminPlaybackAudioSection => 'صدا';

  @override
  String get adminPlaybackEnableAudioVbr => 'فعال کردن کدگذاری VBR صدا';

  @override
  String get adminPlaybackDownmixBoost => 'تقویت داون‌میکس صدا';

  @override
  String get adminPlaybackDownmixAlgorithm => 'الگوریتم داون‌میکس استریو';

  @override
  String get adminPlaybackMaxMuxingQueue => 'حداکثر اندازه صف مالتی‌پلکس';

  @override
  String get adminPlaybackAutoOption => 'خودکار';

  @override
  String get adminPlaybackEncoding => 'رمزگذاری';

  @override
  String get adminPlaybackEncodingThreads => 'رشته های رمزگذاری';

  @override
  String get adminPlaybackFallbackFont => 'فونت بازگشتی را فعال کنید';

  @override
  String get adminPlaybackFallbackFontPath => 'مسیر فونت بازگشتی';

  @override
  String get adminPlaybackStreaming => 'پخش جریانی';

  @override
  String get adminResumeVideo => 'ویدئو';

  @override
  String get adminResumeAudiobooks => 'کتاب های صوتی';

  @override
  String get adminStreamingBitrateLimit =>
      'محدودیت نرخ بیت کلاینت راه دور (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'خالی یا 0 برای نامحدود بگذارید';

  @override
  String get adminTrickplayHwAccel => 'فعال کردن شتاب سخت افزاری';

  @override
  String get adminTrickplayHwEncoding => 'رمزگذاری سخت افزاری را فعال کنید';

  @override
  String get adminTrickplayKeyFrameOnly => 'فعال کردن استخراج فقط قاب کلید';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'سریعتر اما دقت کمتر';

  @override
  String get adminTrickplayNonBlocking => 'غیر مسدود کننده';

  @override
  String get adminTrickplayBlocking => 'مسدود کردن';

  @override
  String get adminTrickplayPriorityHigh => 'بالا';

  @override
  String get adminTrickplayPriorityAboveNormal => 'بالاتر از نرمال';

  @override
  String get adminTrickplayPriorityNormal => 'عادی';

  @override
  String get adminTrickplayPriorityBelowNormal => 'زیر نرمال';

  @override
  String get adminTrickplayPriorityIdle => 'بیکار';

  @override
  String get adminTrickplayImageSettings => 'تنظیمات تصویر';

  @override
  String get adminTrickplayInterval => 'فاصله زمانی (میلی‌ثانیه)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'هر چند وقت یکبار از فریم ها عکس بگیرید';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'عرض پیکسل جدا شده با کاما (به عنوان مثال 320)';

  @override
  String get adminTrickplayQuality => 'کیفیت';

  @override
  String get adminTrickplayQScale => 'مقیاس کیفیت';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'مقادیر کمتر = کیفیت بهتر، فایل های بزرگتر';

  @override
  String get adminTrickplayJpegQuality => 'کیفیت JPEG';

  @override
  String get adminTrickplayProcessing => 'پردازش';

  @override
  String get adminTasksEmpty => 'هیچ کار برنامه ریزی شده ای پیدا نشد';

  @override
  String get adminTasksNoFilterMatch => 'هیچ کاری با فیلتر فعلی مطابقت ندارد';

  @override
  String get adminTaskCancelling => 'در حال لغو...';

  @override
  String get adminTaskRunning => 'در حال دویدن...';

  @override
  String get adminTaskNeverRun => 'هرگز اجرا نکنید';

  @override
  String get adminTaskStop => 'توقف';

  @override
  String get adminRunningTasks => 'وظایف در حال اجرا';

  @override
  String get adminTaskRun => 'اجرا کنید';

  @override
  String get adminTaskDetailLastExecution => 'آخرین اعدام';

  @override
  String get adminTaskDetailStarted => 'شروع شد';

  @override
  String get adminTaskDetailEnded => 'پایان یافت';

  @override
  String get adminTaskDetailDuration => 'مدت زمان';

  @override
  String get adminTaskDetailErrorLabel => 'خطا:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'روزانه در $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'هر $day در $time';
  }

  @override
  String get adminTaskTriggerStartup => 'هنگام راه اندازی برنامه';

  @override
  String get adminTaskTriggerTypeDaily => 'روزانه';

  @override
  String get adminTaskTriggerTypeWeekly => 'هفتگی';

  @override
  String get adminTaskTriggerTypeInterval => 'در یک بازه زمانی';

  @override
  String get adminTaskTriggerIntervalLabel => 'فاصله';

  @override
  String get adminTaskTriggerEveryHour => 'هر ساعت';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ساعت',
      one: '1 ساعت',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'زمان';

  @override
  String get adminActivityJustNow => 'همین الان';

  @override
  String get adminActivityLastHour => 'ساعت گذشته';

  @override
  String get adminActivityToday => 'امروز';

  @override
  String get adminActivityYesterday => 'دیروز';

  @override
  String get adminActivityOlder => 'قدیمی تر';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days روز قبل';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours ساعت قبل';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes دقیقه پیش';
  }

  @override
  String get adminActivityNow => 'اکنون';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes دقیقه';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours ساعت';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days روز';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'تولید تصویر trickplay را برای ریز عکسهای پیش نمایش جستجو پیکربندی کنید.';

  @override
  String get adminNetworkingPublicHttpsPort => 'پورت عمومی HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'URL پایه';

  @override
  String get adminNetworkingBaseUrlHint => 'مثلاً /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'پورت عمومی HTTP';

  @override
  String get adminNetworkingRequireHttps => 'الزام HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'همه درخواست‌های راه دور به HTTPS هدایت می‌شوند. اگر سرور گواهی معتبر نداشته باشد، تأثیری ندارد.';

  @override
  String get adminNetworkingCertPassword => 'رمز عبور گواهی';

  @override
  String get adminNetworkingEnableIpv4 => 'فعال کردن IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'فعال کردن IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'شبکه‌های LAN';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'فیلتر IP از راه دور';

  @override
  String get adminPlaybackVaapiDevice => 'دستگاه VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = خودکار';

  @override
  String get adminPlaybackTranscodeTempPath => 'مسیر موقت رمزگذاری';

  @override
  String get adminPlaybackSegmentDeletion => 'اجازه حذف بخش';

  @override
  String get adminPlaybackSegmentKeep => 'نگه داشتن بخش (ثانیه)';

  @override
  String get adminPlaybackThrottleBuffering => 'بافر دریچه گاز';

  @override
  String get adminPlaybackThrottleDelay => 'تأخیر محدودسازی (ثانیه)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'اجازه استخراج زیرنویس در لحظه';

  @override
  String get adminResumeMinPct => 'حداقل درصد رزومه';

  @override
  String get adminResumeMinPctSubtitle =>
      'برای صرفه جویی در پیشرفت، محتوا باید بیش از این درصد پخش شود';

  @override
  String get adminResumeMaxPct => 'حداکثر درصد رزومه';

  @override
  String get adminResumeMaxPctSubtitle =>
      'پس از این درصد، محتوا به طور کامل پخش شده در نظر گرفته می شود';

  @override
  String get adminResumeMinDuration => 'حداقل مدت رزومه (ثانیه)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'موارد کوتاه‌تر از این قابل ازسرگیری نیستند';

  @override
  String get adminTrickplayScanBehavior => 'اسکن رفتار';

  @override
  String get adminTrickplayProcessPriority => 'اولویت فرآیند';

  @override
  String get adminTrickplayTileWidth => 'عرض کاشی';

  @override
  String get adminTrickplayTileHeight => 'ارتفاع کاشی';

  @override
  String get adminTrickplayProcessThreads => 'رشته ها را پردازش کنید';

  @override
  String get adminTrickplayWidthResolutions => 'رزولوشن های عرض';

  @override
  String get adminMetadataDefault => 'پیش فرض';

  @override
  String get adminMetadataContentTypeUpdated => 'نوع محتوا به روز شد';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'نوع محتوا به‌روزرسانی نشد: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'آستانه پاسخ آهسته (ms)';

  @override
  String get adminGeneralEnableSlowResponse => 'فعال کردن هشدارهای پاسخ کند';

  @override
  String get adminGeneralQuickConnect => 'فعال کردن Quick Connect';

  @override
  String get adminGeneralSectionServer => 'سرور';

  @override
  String get adminGeneralSectionMetadata => 'فراداده';

  @override
  String get adminGeneralSectionPaths => 'مسیرها';

  @override
  String get adminGeneralSectionPerformance => 'کارایی';

  @override
  String get adminGeneralCachePath => 'مسیر کش';

  @override
  String get adminGeneralMetadataPath => 'مسیر فراداده';

  @override
  String get adminGeneralServerName => 'نام سرور';

  @override
  String get adminGeneralDisplayLanguage => 'زبان نمایش ترجیحی';

  @override
  String get adminSettingsLoadFailed => 'تنظیمات بارگیری نشد';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'نقشه‌برداری‌ها به‌روزرسانی نشد: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'محدودیت زمانی: $duration';
  }

  @override
  String get folders => 'پوشه ها';

  @override
  String get libraries => 'کتابخانه‌ها';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay غیرفعال شد';

  @override
  String get syncPlayDisabledMessage =>
      'برای استفاده از پخش همگام، SyncPlay را در تنظیمات فعال کنید.';

  @override
  String get syncPlayServerUnsupportedTitle => 'سرور پشتیبانی نمی شود';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay به سرور Jellyfin نیاز دارد. سرور فعلی آن را پشتیبانی نمی کند.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay گروه';

  @override
  String get syncPlayGroupTooltip => 'گروه SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# شرکت‌کننده',
      one: '# شرکت‌کننده',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'انتظار را نادیده بگیرید';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'وقتی این دستگاه در بافر است، گروه را بالا نگه ندارید';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'بدون منتظر ماندن اعضای کند به صورت محلی ادامه دهید';

  @override
  String get syncPlayRepeat => 'تکرار کنید';

  @override
  String get syncPlayRepeatOne => 'یکی';

  @override
  String get syncPlayShuffleModeShuffled => 'به هم ریخته';

  @override
  String get syncPlayShuffleModeSorted => 'مرتب شده است';

  @override
  String get syncPlaySyncCurrentQueue => 'همگام سازی صف پخش فعلی';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'صف گروه را با چیزی که به صورت محلی پخش می شود جایگزین کنید';

  @override
  String get syncPlayLeaveGroup => 'ترک گروه';

  @override
  String get syncPlayGroupQueue => 'صف گروهی';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'مورد $index';
  }

  @override
  String get syncPlayPlayNow => 'اکنون بازی کنید';

  @override
  String get syncPlayCreateNewGroup => 'یک گروه جدید ایجاد کنید';

  @override
  String get syncPlayGroupName => 'نام گروه';

  @override
  String get syncPlayDefaultGroupName => 'گروه SyncPlay من';

  @override
  String get syncPlayCreateGroup => 'گروه ایجاد کنید';

  @override
  String get syncPlayAvailableGroups => 'گروه های موجود';

  @override
  String get syncPlayNoGroupsAvailable => 'هیچ گروهی در دسترس نیست';

  @override
  String get syncPlayJoinGroupQuestion => 'به گروه SyncPlay بپیوندید؟';

  @override
  String get syncPlayJoinGroupWarning =>
      'پیوستن به یک گروه SyncPlay ممکن است جایگزین صف پخش فعلی شما شود. ادامه دهید؟';

  @override
  String get syncPlayJoin => 'بپیوندید';

  @override
  String get syncPlayStateIdle => 'بیکار';

  @override
  String get syncPlayStateWaiting => 'در انتظار';

  @override
  String get syncPlayStatePaused => 'مکث کرد';

  @override
  String get syncPlayStatePlaying => 'در حال پخش';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName به گروه SyncPlay پیوست';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName گروه SyncPlay را ترک کرد';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'دسترسی SyncPlay رد شد';

  @override
  String get syncPlayAccessDeniedMessage =>
      'شما به یک یا چند مورد در این گروه SyncPlay دسترسی ندارید. از مالک گروه بخواهید مجوزهای کتابخانه را تأیید کند یا یک صف دیگر انتخاب کند.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'همگام سازی پخش با $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'جستجوی صوتی در دسترس نیست.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision پخش مستقیم ناموفق بود';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'پخش مستقیم برای این جریان Dolby Vision شروع نشد. دوباره سعی می‌کنید از رمز عبور سرور استفاده کنید؟';

  @override
  String get retryWithTranscode => 'با رمز عبور دوباره امتحان کنید';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision پشتیبانی نمی‌شود';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'این دستگاه نمی‌تواند محتوای Dolby Vision را مستقیماً رمزگشایی کند. از HDR10 بازگشتی استفاده کنید یا رمزگذاری سرور را درخواست کنید.';

  @override
  String get rememberMyChoice => 'انتخاب من را به خاطر بسپار';

  @override
  String get playHdr10Fallback => 'پخش مجدد HDR10';

  @override
  String get requestTranscode => 'درخواست ترانکد';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ردیف کشف شد',
      one: '# ردیف کشف شد',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'مشاهده همه';

  @override
  String get noItems => 'هیچ موردی وجود ندارد';

  @override
  String get switchUser => 'تغییر کاربر';

  @override
  String get remoteControl => 'کنترل از راه دور';

  @override
  String get mediaBarLoading => 'در حال بارگیری نوار رسانه...';

  @override
  String get mediaBarError => 'نوار رسانه بارگیری نشد';

  @override
  String get offlineServerUnavailable =>
      'به اینترنت متصل است، اما سرور فعلی در دسترس نیست.';

  @override
  String get offlineNoInternet =>
      'شما آفلاین هستید. فقط محتوای دانلود شده در دسترس است.';

  @override
  String get offlineFileNotAvailable => 'فایل موجود نیست';

  @override
  String get offlineSwitchServer => 'سوئیچ سرور';

  @override
  String get offlineSavedMedia => 'رسانه ذخیره شده';

  @override
  String get offlineBannerTitle => 'آفلاین هستید';

  @override
  String get offlineBannerSubtitle => 'نمایش دانلودهای شما';

  @override
  String get serverUnreachableBannerTitle => 'دسترسی به سرور شما ممکن نیست';

  @override
  String get serverUnreachableBannerSubtitle =>
      'تا بازگشت سرور، پخش از دانلودها انجام می‌شود';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'پخش از راه دور';

  @override
  String castControlFailed(String error) {
    return 'کنترل بازیگران ناموفق بود: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind کنترل‌ها';
  }

  @override
  String get castDeviceVolume => 'میزان صدای دستگاه';

  @override
  String get castVolumeUnavailable => 'در دسترس نیست';

  @override
  String castStopKind(String kind) {
    return 'توقف $kind';
  }

  @override
  String get audioLabel => 'صوتی';

  @override
  String get subtitlesLabel => 'زیرنویس';

  @override
  String get pinConfirmTitle => 'پین را تایید کنید';

  @override
  String get pinSetTitle => 'پین را تنظیم کنید';

  @override
  String get pinEnterTitle => 'پین را وارد کنید';

  @override
  String get pinReenterToConfirm => 'برای تایید دوباره پین ​​خود را وارد کنید';

  @override
  String pinEnterNDigit(int length) {
    return 'یک پین رقمی $length وارد کنید';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'پین رقمی $length خود را وارد کنید';
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
  String get pinIncorrect => 'پین نادرست';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'پین ها مطابقت ندارند';

  @override
  String get pinForgot => 'پین را فراموش کرده اید؟';

  @override
  String get pinClear => 'پاک کردن';

  @override
  String get pinBackspace => 'بک اسپیس';

  @override
  String get quickConnectAuthorized => 'درخواست Quick Connect تأیید شد.';

  @override
  String get quickConnectInvalidOrExpired =>
      'کد Quick Connect نامعتبر یا منقضی شده است.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect در این سرور پشتیبانی نمی شود.';

  @override
  String get quickConnectAuthorizeFailed =>
      'تأیید کد Quick Connect ناموفق بود.';

  @override
  String get quickConnectDisabled => 'Quick Connect در این سرور غیرفعال است.';

  @override
  String get quickConnectForbidden =>
      'حساب شما نمی‌تواند این درخواست Quick Connect را تأیید کند.';

  @override
  String get quickConnectNotFound =>
      'کد Quick Connect یافت نشد. کد جدیدی را امتحان کنید.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect ناموفق بود: $message';
  }

  @override
  String get quickConnectEnterCode => 'کد را وارد کنید';

  @override
  String get quickConnectAuthorize => 'مجاز کردن';

  @override
  String remoteCommandFailed(String error) {
    return 'دستور ناموفق بود: $error';
  }

  @override
  String get remoteControlTitle => 'کنترل از راه دور';

  @override
  String get remoteFailedToLoadSessions => 'جلسات بارگیری نشد';

  @override
  String get remoteNoSessions => 'بدون جلسات قابل کنترل';

  @override
  String get remoteStartPlayback => 'پخش را در دستگاه دیگری شروع کنید';

  @override
  String get unknownUser => 'ناشناس';

  @override
  String get unknownItem => 'ناشناس';

  @override
  String get remoteNothingPlaying => 'هیچ چیزی در این جلسه پخش نمی شود';

  @override
  String get castingStarted => 'ارسال محتوا در دستگاه انتخابی شروع شد';

  @override
  String castingFailed(String error) {
    return 'شروع ارسال ناموفق بود: $error';
  }

  @override
  String get noRemoteDevices => 'دستگاه پخش از راه دور موجود نیست.';

  @override
  String get noRemoteDevicesIos =>
      'دستگاه پخش از راه دور موجود نیست.\n\nدر iOS، اهداف AirPlay ممکن است در شبیه ساز در دسترس نباشند.';

  @override
  String get trackActionPlayNext => 'پخش بعدی';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'به صف اضافه کنید';

  @override
  String get trackActionAddToPlaylist => 'به لیست پخش اضافه کنید';

  @override
  String get trackActionCancelDownload => 'لغو دانلود';

  @override
  String get trackActionDeleteFromPlaylist => 'حذف از لیست پخش';

  @override
  String get trackActionMoveUp => 'حرکت به بالا';

  @override
  String get trackActionMoveDown => 'حرکت به پایین';

  @override
  String get trackActionRemoveFromFavorites => 'حذف از موارد دلخواه';

  @override
  String get trackActionAddToFavorites => 'به موارد دلخواه اضافه کنید';

  @override
  String get trackActionGoToAlbum => 'به آلبوم بروید';

  @override
  String get trackActionGoToArtist => 'به هنرمند بروید';

  @override
  String trackActionDownloading(String name) {
    return 'در حال دانلود $name...';
  }

  @override
  String get trackActionDeletedFile => 'فایل دانلود شده حذف شد';

  @override
  String get trackActionDeleteFileFailed => 'فایل دانلود شده حذف نشد';

  @override
  String get shuffleBy => 'مخلوط کردن توسط';

  @override
  String get shuffleSelectLibrary => 'کتابخانه را انتخاب کنید';

  @override
  String get shuffleSelectGenre => 'ژانر را انتخاب کنید';

  @override
  String get shuffleLibrary => 'کتابخانه';

  @override
  String get shuffleGenre => 'ژانر';

  @override
  String get shuffleNoLibraries => 'هیچ کتابخانه سازگاری در دسترس نیست.';

  @override
  String get shuffleNoGenres => 'هیچ گونه ژانری برای این حالت زدن یافت نشد.';

  @override
  String get posterDisplayTitle => 'نمایش';

  @override
  String get posterImageType => 'نوع تصویر';

  @override
  String get imageTypePoster => 'پوستر';

  @override
  String get imageTypeThumbnail => 'تصویر کوچک';

  @override
  String get imageTypeBanner => 'بنر';

  @override
  String get playlistAddFailed => 'به لیست پخش اضافه نشد';

  @override
  String get playlistCreateFailed => 'لیست پخش ایجاد نشد';

  @override
  String get playlistNew => 'لیست پخش جدید';

  @override
  String get playlistCreate => 'ایجاد کنید';

  @override
  String get playlistCreateNew => 'ایجاد لیست پخش جدید';

  @override
  String get playlistNoneFound => 'هیچ لیست پخشی یافت نشد';

  @override
  String get addToPlaylist => 'به لیست پخش اضافه کنید';

  @override
  String get lyricsNotAvailable => 'متن آهنگ موجود نیست';

  @override
  String get upNext => 'بالا بعدی';

  @override
  String get playNext => 'پخش بعدی';

  @override
  String get stillWatchingContent =>
      'پخش موقتاً متوقف شده است. هنوز هم تماشا می کنی؟';

  @override
  String get stillWatchingStop => 'توقف';

  @override
  String get stillWatchingContinue => 'ادامه دهید';

  @override
  String skipSegment(String segment) {
    return 'رد شدن از $segment';
  }

  @override
  String get liveTv => 'تلویزیون زنده';

  @override
  String get continueWatchingAndNextUp => 'ادامه تماشا و بعدی';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'در حال دانلود $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'در حال دانلود $fileName';
  }

  @override
  String get nextEpisode => 'قسمت بعدی';

  @override
  String get moreFromThisSeason => 'بیشتر از این فصل';

  @override
  String get playerTooltipPlaybackSpeed => 'سرعت پخش';

  @override
  String get playerTooltipCastControls => 'کنترل بازیگران';

  @override
  String get playerTooltipPlaybackQuality => 'میزان بیت';

  @override
  String get playerTooltipEnterFullscreen => 'تمام صفحه را وارد کنید';

  @override
  String get playerTooltipExitFullscreen => 'خروج از تمام صفحه';

  @override
  String get playerTooltipFloatOnTop => 'شناور در بالا';

  @override
  String get playerTooltipExitFloatOnTop => 'شناور در بالا را غیرفعال کنید';

  @override
  String get playerTooltipLockLandscape => 'منظره قفل';

  @override
  String get playerTooltipUnlockOrientation => 'اجازه چرخش را بدهید';

  @override
  String get playerTooltipPrevious => 'قبلی';

  @override
  String get playerTooltipSeekBack => 'به دنبال عقب';

  @override
  String get playerTooltipSeekForward => 'به دنبال جلو بروید';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'علامت گذاری به عنوان تماشا شده';

  @override
  String get contextMenuMarkUnwatched => 'علامت گذاری به عنوان Unwatched';

  @override
  String get contextMenuAddToFavorites => 'به موارد دلخواه اضافه کنید';

  @override
  String get contextMenuRemoveFromFavorites => 'حذف از موارد دلخواه';

  @override
  String get contextMenuGoToSeries => 'به سریال بروید';

  @override
  String get contextMenuHideFromContinueWatching =>
      'پنهان کردن از «ادامه تماشا»';

  @override
  String get contextMenuHideFromNextUp => 'پنهان کردن از «بعدی»';

  @override
  String get contextMenuAddToCollection => 'افزودن به مجموعه';

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
      'به پنل مدیریت سرور دسترسی پیدا کنید';

  @override
  String get settingsDynamicContent => 'محتوای پویا';

  @override
  String get settingsDynamicContentSubtitle => 'نوار رسانه و پوشش های بصری';

  @override
  String get settingsAboutSubtitle => 'نسخه برنامه، اطلاعات حقوقی و اعتبار';

  @override
  String get settingsSortServersBy => 'مرتب سازی سرورها بر اساس';

  @override
  String get settingsLastUsed => 'آخرین استفاده';

  @override
  String get settingsAlphabetical => 'حروف الفبا';

  @override
  String get settingsAllowSelfSignedCerts => 'اجازه گواهی‌های خودامضا';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'به سرورهایی که از گواهی‌های TLS خودامضا یا CA خصوصی استفاده می‌کنند اعتماد کنید. فقط برای سرورهایی که خودتان کنترل می‌کنید فعال کنید. این کار اعتبارسنجی گواهی را برای همه اتصال‌ها غیرفعال می‌کند.';

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
  String get settingsHomePage => 'صفحه اصلی';

  @override
  String get settingsTwentyFourHourClock => 'ساعت 24 ساعته';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'هر جا که ساعت نشان داده می شود از قالب بندی 24 ساعته زمان استفاده کنید';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'دکمه shuffle را در نوار پیمایش نشان دهید';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'دکمه ژانرها را در نوار پیمایش نشان دهید';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'نمایش دکمه علاقه مندی ها در نوار ناوبری';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'نمایش دکمه کتابخانه ها در نوار پیمایش';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'نمایش دکمه Seerr در نوار ناوبری';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'همیشه نمایش برچسب‌های متنی در نوار ناوبری بالا';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'قابلیت مشاهده صفحه اصلی در هر کتابخانه را تغییر دهید. برای اعمال تغییرات Moonfin را مجددا راه اندازی کنید.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'نوار رسانه و پیش‌نمایش‌های محلی';

  @override
  String get settingsVisualOverlays => 'پوشش های بصری';

  @override
  String get settingsSeasonalSurprise => 'سورپرایز فصلی';

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
  String get settingsHigh => 'بالا';

  @override
  String get settingsLow => 'کم';

  @override
  String get settingsCustomPath => 'مسیر سفارشی';

  @override
  String get settingsEnterDownloadFolderPath => 'مسیر پوشه دانلود را وارد کنید';

  @override
  String get settingsConcurrentDownloads => 'دانلودهای همزمان';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'حداکثر تعداد موارد برای دانلود همزمان.';

  @override
  String get settingsAppInfo => 'اطلاعات برنامه';

  @override
  String get settingsReportAnIssue => 'گزارش یک مشکل';

  @override
  String get settingsReportAnIssueSubtitle =>
      'ردیاب مشکل را در GitHub باز کنید';

  @override
  String get settingsJoinDiscord => 'به Discord بپیوندید';

  @override
  String get settingsJoinDiscordSubtitle => 'با جامعه چت کنید';

  @override
  String get settingsJoinTheDiscord => 'به Discord بپیوندید';

  @override
  String get settingsSupportMoonfin => 'پشتیبانی Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'یک قهوه به توسعه دهنده اهدا کنید';

  @override
  String get settingsLegal => 'قانونی';

  @override
  String get settingsLicenses => 'مجوزها';

  @override
  String get settingsOpenSourceLicenseNotices => 'اعلامیه های مجوز منبع باز';

  @override
  String get settingsPrivacyPolicy => 'سیاست حفظ حریم خصوصی';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'چگونه Moonfin داده‌های شما را مدیریت می‌کند';

  @override
  String get settingsCheckForUpdates => 'به روز رسانی ها را بررسی کنید';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'آخرین نسخه Moonfin را بررسی کنید';

  @override
  String get settingsBoth => 'هر دو';

  @override
  String get settingsShuffleContentTypeFilter =>
      'فیلتر نوع محتوا را به هم بزنید';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'آهنگ های صوتی، پردازش، و گزینه های عبور';

  @override
  String get settingsAutomationAndQueueSubtitle => 'پخش و توالی خودکار';

  @override
  String get settingsSyncplaySubtitle => 'منطق همگام سازی برای جلسات گروهی';

  @override
  String get settingsSkipIntrosAndOutros => 'از معرفی و برون رفت بگذرید؟';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'شمارش معکوس بخش رسانه';

  @override
  String get settingsProgressBar => 'نوار پیشرفت';

  @override
  String get settingsTimer => 'زمان‌شمار';

  @override
  String get settingsNone => 'هیچ‌کدام';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'کاربر سریع';

  @override
  String get settingsSkip => 'پرش کنید';

  @override
  String get settingsDoNothing => 'هیچ کاری نکن';

  @override
  String get settingsMaxBitrateDescription =>
      'نرخ بیت جریان را درپوش بگذارید. محتوای بالای این آستانه برای جابجایی رمزگذاری خواهد شد.';

  @override
  String get settingsMaxResolutionDescription =>
      'حداکثر وضوحی که بازیکن درخواست می کند را محدود کنید. محتوای با وضوح بالاتر رمزگذاری خواهد شد.';

  @override
  String get settingsPlayerZoomDescription =>
      'چگونه ویدئو باید مقیاس بندی شود تا متناسب با صفحه نمایش باشد.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'موتور پخش (تلویزیون اندروید)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'موتور پخش پیش‌فرض را در دستگاه‌های Android TV انتخاب کنید. تغییرات در جلسه پخش بعدی اعمال می شود.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (توصیه می‌شود)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (میراث)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision بازگشت مجدد';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'رفتار برای عناوین Dolby Vision در دستگاه‌های بدون رمزگشایی Dolby Vision.';

  @override
  String get settingsAskEachTime => 'هر بار بپرسید';

  @override
  String get settingsPreferHdr10Fallback => 'بازگشت HDR10 را ترجیح دهید';

  @override
  String get settingsPreferServerTranscode => 'رمز عبور سرور را ترجیح دهید';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 پخش مستقیم';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'کنترل می‌کند که آیا Dolby Vision جریان‌های لایه بهبودیافته نمایه ۷ باید پخش را مستقیم کنند یا خیر.';

  @override
  String get settingsAutoAftkrtEnabled => 'خودکار (AFTKRT فعال)';

  @override
  String get settingsEnabledOnThisDevice => 'در این دستگاه فعال شده است';

  @override
  String get settingsDisabledPreferTranscode => 'غیرفعال (ترجیحاً رمز عبور)';

  @override
  String get settingsResumeRewindDescription =>
      'هنگام ازسرگیری پخش (از ادامه تماشا یا صفحه مورد رسانه)، چند ثانیه باید برگردانده شود؟';

  @override
  String get settingsUnpauseRewindDescription =>
      'هنگام از سرگیری پخش پس از فشار دادن دکمه مکث، چند ثانیه باید برگردانده شود؟';

  @override
  String get settingsSkipBackLengthDescription =>
      'پس از فشار دادن دکمه عقب، چند ثانیه به عقب پرش کنید.';

  @override
  String get settingsOneSecond => '1 ثانیه';

  @override
  String get settingsThreeSeconds => '3 ثانیه';

  @override
  String get settingsFortyFiveSeconds => '45 ثانیه';

  @override
  String get settingsSixtySeconds => '60 ثانیه';

  @override
  String get settingsSkipForwardLengthDescription =>
      'چند ثانیه بعد از فشار دادن دکمه سریع به جلو پرش به جلو.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'بیت استریم AC3 به رسیور خارجی';

  @override
  String get settingsCinemaMode => 'حالت سینما';

  @override
  String get settingsCinemaModeSubtitle =>
      'قبل از یک ویژگی اصلی، تریلر/پرول‌ها را پخش کنید';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended یک کارت کامل با آثار هنری و توضیحات قسمت را نشان می دهد. Minimal یک پوشش جمع و جور شمارش معکوس را نشان می دهد. غیرفعال، درخواست را به طور کامل پنهان می کند.';

  @override
  String get settingsShort => 'کوتاه';

  @override
  String get settingsLong => 'طولانی';

  @override
  String get settingsVeryLong => 'خیلی طولانی';

  @override
  String get settingsVideoStartDelay => 'تاخیر شروع ویدیو';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value میلی‌ثانیه';
  }

  @override
  String get settingsLiveTvDirect => 'مستقیم تلویزیون زنده';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'پخش مستقیم را برای تلویزیون زنده فعال کنید';

  @override
  String get settingsOpenGroups => 'باز کردن گروه ها';

  @override
  String get settingsOpenGroupsSubtitle =>
      'گروه‌های SyncPlay را ایجاد، ملحق یا مدیریت کنید';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay فعال شد';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'ویژگی های تماشای گروهی را فعال کنید';

  @override
  String get settingsSyncplayButton => 'دکمه SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'دکمه SyncPlay را در نوار پیمایش نشان دهید';

  @override
  String get settingsSyncplayAdvancedCorrection => 'تصحیح پیشرفته';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'منطق همگام سازی دقیق را فعال کنید';

  @override
  String get settingsSyncplaySyncCorrection => 'تصحیح همگام سازی';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'پخش را به صورت خودکار تنظیم کنید تا در همگام بمانید';

  @override
  String get settingsSyncplaySpeedToSync => 'سرعت برای همگام سازی';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'از تنظیم سرعت پخش برای همگام سازی استفاده کنید';

  @override
  String get settingsSyncplaySkipToSync => 'پرش به همگام سازی';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'از جستجو برای همگام سازی استفاده کنید';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'حداقل تاخیر سرعت';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'حداکثر سرعت تاخیر';

  @override
  String get settingsSyncplaySpeedDuration => 'مدت زمان سرعت';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'حداقل تاخیر پرش';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay افست اضافی';

  @override
  String get onNow => 'در حال حاضر';

  @override
  String get collections => 'مجموعه ها';

  @override
  String get lastPlayed => 'آخرین بازی';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'جدیدترین $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '$libraryName تازه‌منتشرشده';
  }

  @override
  String get autoplayNextEpisode => 'پخش خودکار قسمت بعدی';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'در صورت موجود بودن قسمت بعدی را به صورت خودکار پخش کنید.';

  @override
  String get skipSilenceTitle => 'از سکوت بگذر';

  @override
  String get skipSilenceSubtitle =>
      'هنگامی که جریان پشتیبانی می‌شود، به‌طور خودکار از بخش‌های صوتی بی‌صدا رد شوید.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'جلوه های صوتی خارجی را مجاز کنید';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'به برنامه‌های اکولایزر و افکت‌ها (مانند Wavelet) اجازه دهید به جلسات پخش Media3 متصل شوند.';

  @override
  String get disableTunnelingTitle => 'غیرفعال کردن تونل سازی';

  @override
  String get disableTunnelingSubtitle =>
      'اجباری پخش بدون تونل. برای دستگاه‌هایی با ناپیوستگی‌های صوتی/تصویری تونل‌سازی مفید است.';

  @override
  String get enableTunnelingTitle => 'فعال کردن تونل‌سازی';

  @override
  String get enableTunnelingSubtitle =>
      'پیشرفته. صدا و ویدیو را از یک مسیر سخت‌افزاری مشترک عبور می‌دهد. به‌طور پیش‌فرض خاموش است، زیرا در برخی دستگاه‌ها باعث قطعی صدا/تصویر می‌شود.';

  @override
  String get mapDolbyVisionP7Title => 'نمایه 7 Dolby Vision را به HEVC نگاشت';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'پخش Dolby Vision نمایه ۷ پخش جریانی به‌عنوان HDR10-سازگار HEVC در دستگاه‌های غیر DV.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'از سبک های زیرنویس تعبیه شده استفاده کنید';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'رنگ‌ها، فونت‌ها و موقعیت‌یابی تعبیه‌شده در آهنگ زیرنویس را اعمال کنید. غیرفعال کردن استفاده از تنظیمات برگزیده سبک شرح خود.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'از اندازه فونت زیرنویس تعبیه شده استفاده کنید';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'نکات اندازه فونت تعبیه شده در آهنگ زیرنویس را اعمال کنید. غیرفعال کردن استفاده از اندازه زیرنویس از تنظیمات برگزیده سبک.';

  @override
  String get showMediaDetailsOnLibraryPage => 'نمایش جزئیات رسانه';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'نمایش جزئیات مورد انتخاب‌شده در بالای صفحات کتابخانه.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'از عناوین فرعی تفصیلی استفاده کنید';

  @override
  String get useDetailedSubHeadingsDescription =>
      'نمایش زیر ردیف جزئی یا حداقل در صفحات کتابخانه.';

  @override
  String get savedThemesDeleteDialogTitle => 'تم ذخیره شده حذف شود؟';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '\"$themeName\" از حافظه پنهان این دستگاه حذف شود؟';
  }

  @override
  String get themeStore => 'فروشگاه تم';

  @override
  String get themeStoreSubtitle => 'مرور و ذخیره تم‌های انجمن';

  @override
  String get themeStoreDescription =>
      'یک تم را ذخیره کنید تا مانند سایر تم‌های ذخیره‌شده از آن استفاده کنید.';

  @override
  String get themeStoreEmpty => 'در حال حاضر هیچ تمی در دسترس نیست.';

  @override
  String get themeStoreLoadFailed =>
      'بارگذاری فروشگاه تم ممکن نشد. اتصال خود را بررسی کرده و دوباره تلاش کنید.';

  @override
  String get themeStoreSave => 'ذخیره';

  @override
  String get themeStoreSaveAndApply => 'ذخیره و اعمال';

  @override
  String get themeStoreSaved => 'ذخیره شد';

  @override
  String get themeStoreInvalidMessage => 'این تم بارگذاری نشد.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '«$themeName» ذخیره شد.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" از این دستگاه حذف شد.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" حذف نشد.';
  }

  @override
  String get savedThemesTitle => 'تم های ذخیره شده';

  @override
  String get savedThemesDescription =>
      'اینها مضامینی هستند که از پلاگین Moonfin برای سرور فعلی دانلود شده‌اند. حذف فقط این کپی محلی را حذف می کند.';

  @override
  String get savedThemesEmpty => 'هیچ تم ذخیره شده ای برای این سرور پیدا نشد.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • در حال حاضر فعال است';
  }

  @override
  String get savedThemesDeleteTooltip => 'حذف تم ذخیره شده';

  @override
  String get savedThemesManageSubtitle =>
      'مضامین بارگیری شده افزونه را در این دستگاه مدیریت کنید';

  @override
  String get themeEditor => 'ویرایشگر تم';

  @override
  String get themeEditorSubtitle =>
      'ویرایشگر تم Moonfin را در مرورگر خود باز کنید';

  @override
  String get homeScreen => 'صفحه اصلی';

  @override
  String get bottomBar => 'نوار پایین';

  @override
  String get homeRowsStyleClassic => 'کلاسیک';

  @override
  String get homeRowsStyleModern => 'مدرن';

  @override
  String get homeRowsSection => 'ردیف های صفحه اصلی';

  @override
  String get rowsType => 'نوع ردیف';

  @override
  String get rowsTypeDescription =>
      'کلاسیک نوع تصویر هر ردیف و همپوشانی اطلاعات را حفظ می کند. مدرن از ردیف های پرتره به پس زمینه استفاده می کند.';

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
  String get displayFavoritesRows => 'نمایش ردیف های مورد علاقه';

  @override
  String get displayFavoritesRowsSubtitle =>
      'نمایش فیلم‌ها، سریال‌ها و سایر ردیف‌های دلخواه در بخش‌های اصلی.';

  @override
  String get favoritesRowSorting => 'مرتب سازی ردیف های مورد علاقه';

  @override
  String get favoritesRowSortingDescription =>
      'ردیف های مورد علاقه را بر اساس تاریخ اضافه شدن، تاریخ انتشار، بر اساس حروف الفبا و موارد دیگر مرتب کنید.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'نمایش ردیف های مجموعه ها';

  @override
  String get displayCollectionsRowsSubtitle =>
      'نمایش ردیف‌های مجموعه‌ها در بخش‌های اصلی.';

  @override
  String get collectionsRowSorting => 'مرتب سازی ردیف مجموعه ها';

  @override
  String get collectionsRowSortingDescription =>
      'ردیف‌های مجموعه‌ها را بر اساس تاریخ اضافه شدن، تاریخ انتشار، بر اساس حروف الفبا و موارد دیگر مرتب کنید.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'نمایش ژانرهای ردیف';

  @override
  String get displayGenresRowsSubtitle =>
      'نمایش ردیف‌های ژانرها در بخش‌های اصلی.';

  @override
  String get genresRowSorting => 'ژانرها مرتب سازی ردیف';

  @override
  String get genresRowSortingDescription =>
      'ردیف‌های ژانرها را بر اساس تاریخ اضافه شدن، تاریخ انتشار، بر اساس حروف الفبا و موارد دیگر مرتب کنید.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'ژانر موارد ردیف';

  @override
  String get genresRowItemsDescription =>
      'نمایش فیلم، سریال یا هر دو در ردیف‌های ژانر.';

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
  String get displayPlaylistsRows => 'نمایش ردیف‌های لیست پخش';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'نمایش ردیف‌های لیست پخش در بخش‌های صفحه اصلی.';

  @override
  String get playlistsRowSorting => 'مرتب‌سازی ردیف لیست پخش';

  @override
  String get playlistsRowSortingDescription =>
      'ردیف‌های لیست پخش را بر اساس تاریخ افزودن، تاریخ انتشار، ترتیب الفبا و موارد دیگر مرتب کنید.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'نمایش ردیف‌های صوتی';

  @override
  String get displayAudioRowsSubtitle =>
      'نمایش ردیف‌های صوتی در بخش‌های صفحه اصلی.';

  @override
  String get audioRowsSorting => 'مرتب‌سازی ردیف‌های صوتی';

  @override
  String get audioRowsSortingDescription =>
      'ردیف‌های صوتی را بر اساس تاریخ افزودن، تاریخ انتشار، ترتیب الفبا و موارد دیگر مرتب کنید.';

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
  String get audioPlaylists => 'لیست‌های پخش صوتی';

  @override
  String get appearance => 'ظاهر';

  @override
  String get layout => 'چیدمان';

  @override
  String get theme => 'تم';

  @override
  String get keyboard => 'صفحه‌کلید';

  @override
  String get navButtons => 'دکمه‌ها';

  @override
  String get rendering => 'رندرینگ';

  @override
  String get mpvConfiguration => 'پیکربندی MPV';

  @override
  String get cardSize => 'اندازه کارت';

  @override
  String get externalPlayerApp => 'برنامه پخش خارجی';

  @override
  String get externalPlayerAppDescription =>
      'پخش‌کننده خارجی را تنظیم کنید تا گزینه پخش با فشار طولانی فعال شود';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'نمایش انتخابگر برنامه هنگام شروع پخش.';

  @override
  String get loadingInstalledPlayers =>
      'در حال بارگیری پخش کننده های نصب شده...';

  @override
  String get connection => 'اتصال';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'عبور';

  @override
  String get supportedOnThisDevice => 'در این دستگاه پشتیبانی می شود';

  @override
  String get notSupportedOnThisDevice => 'در این دستگاه پشتیبانی نمی شود';

  @override
  String get mediaPlayerBehavior => 'رفتار پخش کننده رسانه';

  @override
  String get playbackEnhancements => 'بهبودهای پخش';

  @override
  String get alwaysOn => 'همیشه روشن.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Skip Outro را با Next Up Display جایگزین کنید';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'به جای دکمه Skip Outro، روکش Next Up را نشان دهید.';

  @override
  String get playerRouting => 'مسیریابی بازیکن';

  @override
  String get preferSoftwareDecoders => 'رمزگشاهای نرم افزاری را ترجیح دهید';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'قبل از رمزگشاهای سخت افزاری از FFmpeg (صوتی) و libgav1 (AV1) استفاده کنید. در صورت خرابی گذر صوتی HDMI غیرفعال شود.';

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
  String get useExternalPlayer => 'از پخش کننده خارجی استفاده کنید';

  @override
  String get useExternalPlayerSubtitle =>
      'پخش ویدیو را در برنامه خارجی انتخابی خود در Android TV باز کنید.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'صف بندی خودکار';

  @override
  String get preferSdhSubtitles => 'زیرنویس SDH را ترجیح دهید';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'هنگام انتخاب خودکار، آهنگ‌های زیرنویس SDH/CC را اولویت‌بندی کنید.';

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
  String get webDiagnostics => 'تشخیص وب';

  @override
  String get webDiagnosticsTitle => 'Moonfin عیب‌یابی وب';

  @override
  String get webDiagnosticsIntro =>
      'از این صفحه برای تشخیص مشکلات اتصال مرورگر (CORS، محتوای مختلط و تنظیمات کشف) استفاده کنید.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'خطای محتوای مختلط شناسایی شد';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'تشخیص CORS/شکست قبل از پرواز';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin یک صفحه HTTPS را شناسایی کرد که سعی در فراخوانی URL سرور HTTP داشت. مرورگرها این درخواست را قبل از رسیدن به سرور شما مسدود می کنند.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin یک شکست درخواست در سطح مرورگر را شناسایی کرد که معمولاً به دلیل فقدان CORS یا سرصفحه‌های پیش از پرواز در سرور رسانه ایجاد می‌شود.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL هدف: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'جزئیات: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'زمینه زمان اجرا فعلی';

  @override
  String get webDiagnosticsOrigin => 'مبدا';

  @override
  String get webDiagnosticsScheme => 'طرح';

  @override
  String get webDiagnosticsPluginMode => 'حالت پلاگین';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC اسکن';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL سرور اجباری';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL سرور پیش فرض';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL پروکسی کشف';

  @override
  String get notConfigured => 'پیکربندی نشده است';

  @override
  String get webDiagnosticsMixedContent => 'محتوای ترکیبی';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'این صفحه از طریق HTTPS بارگیری می شود، اما یک یا چند URL پیکربندی شده HTTP هستند. مرورگرها صفحات HTTPS را از تماس با APIهای HTTP مسدود می کنند.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'رفع: سرور رسانه یا نقطه پایانی پراکسی خود را از طریق HTTPS ارائه دهید، یا Moonfin را از طریق HTTP فقط در شبکه‌های محلی مورد اعتماد بارگیری کنید.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'هیچ پیکربندی محتوای مختلط آشکاری از تنظیمات زمان اجرا فعلی شناسایی نشده است.';

  @override
  String get webDiagnosticsCorsChecklist => 'چک لیست CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• اجازه دادن به مبدأ مرورگر در Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• شامل مجوز، X-Emby-Authorization، و X-Emby-Token در Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Content-Range و Accept-Range را برای پخش جریانی و رفتار جستجو در معرض نمایش قرار دهید.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• بازگشت 204 به OPTIONS درخواست های قبل از پرواز.';

  @override
  String get webDiagnosticsHeaderSnippetTitle => 'نمونه سرصفحه (به سبک nginx)';

  @override
  String get note => 'توجه داشته باشید';

  @override
  String get webDiagnosticsNonWebNote =>
      'این مسیر تشخیصی برای ساخت وب در نظر گرفته شده است. اگر این مورد را در پلتفرم دیگری مشاهده می‌کنید، این بررسی‌ها ممکن است اعمال نشوند.';

  @override
  String get backToServerSelect => 'بازگشت به انتخاب سرور';

  @override
  String get signOutAllUsers => 'خروج از سیستم همه کاربران';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'اجازه میکروفون برای همیشه رد شده است. آن را در تنظیمات سیستم فعال کنید.';

  @override
  String get voiceSearchPermissionRequired =>
      'اجازه میکروفون برای جستجوی صوتی مورد نیاز است.';

  @override
  String get voiceSearchNoMatch => 'متوجه نشدم دوباره امتحان کنید.';

  @override
  String get voiceSearchNoSpeechDetected => 'گفتاری شناسایی نشد.';

  @override
  String get voiceSearchMicrophoneError => 'خطای میکروفون';

  @override
  String get voiceSearchNeedsInternet => 'جستجوی صوتی به اینترنت نیاز دارد.';

  @override
  String get voiceSearchServiceBusy =>
      'سرویس صوتی مشغول است. دوباره امتحان کنید.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'اجازه میکروفون برای همیشه رد شده است.';

  @override
  String get microphonePermissionDenied => 'اجازه میکروفون رد شده است.';

  @override
  String get speechRecognitionUnavailable =>
      'تشخیص گفتار در این دستگاه در دسترس نیست.';

  @override
  String get openIosRoutePicker => 'انتخابگر مسیر iOS را باز کنید';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay انتخابگر مسیر در این دستگاه در دسترس نیست.';

  @override
  String get videos => 'ویدیوها';

  @override
  String get programs => 'برنامه ها';

  @override
  String get songs => 'آهنگ ها';

  @override
  String get photoAlbums => 'آلبوم های عکس';

  @override
  String get photos => 'عکس ها';

  @override
  String get people => 'مردم';

  @override
  String get recentlyReleasedEpisodes => 'قسمت های اخیرا منتشر شده';

  @override
  String get watchAgain => 'دوباره تماشا کن';

  @override
  String get guestAppearances => 'حضور مهمان';

  @override
  String get appearancesSeerr => 'ظاهر (Seerr)';

  @override
  String get crewContributionsSeerr => 'مشارکت‌های عوامل (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'با گروه تماشا کنید';

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
  String get disk => 'دیسک';

  @override
  String get openInBrowser => 'در مرورگر باز کنید';

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
      'مرورگر تعبیه شده در این پلتفرم در دسترس نیست.';

  @override
  String get adminRestartServerConfirmation =>
      'آیا مطمئن هستید که می خواهید سرور را دوباره راه اندازی کنید؟';

  @override
  String get adminShutdownServerConfirmation =>
      'آیا مطمئن هستید که می خواهید سرور را خاموش کنید؟ شما باید آن را به صورت دستی راه اندازی مجدد کنید.';

  @override
  String get internal => 'داخلی';

  @override
  String get idle => 'بیکار';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'هیچ کاربری پیدا نشد';

  @override
  String get adminNoUsersMatchSearch => 'هیچ کاربری با جستجوی شما مطابقت ندارد';

  @override
  String get adminNoDevicesFound => 'دستگاهی پیدا نشد';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'هیچ دستگاهی با فیلترهای فعلی مطابقت ندارد';

  @override
  String get remoteAccess => 'دسترسی از راه دور';

  @override
  String get localOnly => 'فقط محلی';

  @override
  String get adminMediaAnalyticsLoadFailed => 'تجزیه و تحلیل رسانه بارگیری نشد';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'تجزیه و تحلیل ترکیبی در تمام کتابخانه های رسانه ای.';

  @override
  String get analyticsTopArtists => 'هنرمندان برتر';

  @override
  String get analyticsTopAuthors => 'نویسندگان برتر';

  @override
  String get analyticsTopContributors => 'مشارکت کنندگان برتر';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کتابخانه',
      one: '1 کتابخانه',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'هنوز مجموع رسانه های نمایه شده برای این انتخاب موجود نیست.';

  @override
  String get analyticsLibraryDetails => 'جزئیات کتابخانه';

  @override
  String get analyticsLibraryBreakdown => 'خرابی کتابخانه';

  @override
  String get analyticsNoLibrariesAvailable => 'هیچ کتابخانه ای در دسترس نیست.';

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
  String get adminServerAdministrationTitle => 'مدیریت سرور';

  @override
  String get adminServerPathData => 'داده ها';

  @override
  String get adminServerPathImageCache => 'حافظه پنهان تصویر';

  @override
  String get adminServerPathCache => 'حافظه پنهان';

  @override
  String get adminServerPathLogs => 'سیاههها';

  @override
  String get adminServerPathMetadata => 'فراداده';

  @override
  String get adminServerPathTranscode => 'رمز عبور';

  @override
  String get adminServerPathWeb => 'وب';

  @override
  String get adminNoServerPathsReturned =>
      'هیچ مسیر سروری توسط این سرور برگردانده نشده است.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% استفاده شده است';
  }

  @override
  String get userActivity => 'فعالیت کاربر';

  @override
  String get systemEvents => 'رویدادهای سیستم';

  @override
  String get needsAttention => 'نیاز به توجه دارد';

  @override
  String get homeVideos => 'فیلم های خانگی';

  @override
  String get mixedContent => 'محتوای ترکیبی';

  @override
  String get homeVideosAndPhotos => 'فیلم ها و عکس های صفحه اصلی';

  @override
  String get mixedMoviesAndShows => 'فیلم‌ها و نمایش‌های ترکیبی';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'هیچ ضبطی یافت نشد';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'هیچ صفحه تصویری در بایگانی .$extension یافت نشد.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'رندر جاسازی شده ناموفق بود ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'ارائه دهنده EPUB ناموفق بود ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'فایل محلی برای خواننده وجود ندارد: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status هنگام باز کردن داده‌های کتاب از $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'نقطه پایانی کتاب خواندنی موجود نیست';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'قالب آرشیو کمیک پشتیبانی نشده: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'افزونه استخراج CBR در این پلتفرم موجود نیست.';

  @override
  String get failedToExtractCbrArchive => 'بایگانی cbr. استخراج نشد.';

  @override
  String get cb7ExtractionUnavailable =>
      'استخراج CB7 در این پلتفرم در دسترس نیست.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'افزونه استخراج CB7 در این پلتفرم موجود نیست.';

  @override
  String get loadingShuffle => 'در حال بارگیری ترکیبی...';

  @override
  String get libraryShuffleLabel => 'پخش تصادفی کتابخانه';

  @override
  String get randomShuffleLabel => 'پخش تصادفی';

  @override
  String get genresShuffleLabel => 'پخش تصادفی ژانرها';

  @override
  String get autoHdrSwitching => 'سوئیچینگ خودکار HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'به طور خودکار HDR را برای پخش ویدیوی HDR فعال کنید و حالت نمایش را در هنگام خروج بازیابی کنید.';

  @override
  String get whenFullscreen => 'وقتی تمام صفحه';

  @override
  String get changeArtwork => 'تغییر تصویر';

  @override
  String get missing => 'موجود نیست';

  @override
  String get clearAllArtworkButton => 'همه تصاویر پاک شوند؟';

  @override
  String get clearAllArtworkWarning =>
      'آیا مطمئن هستید که می‌خواهید همه تصاویر دانلودشده را پاک کنید؟';

  @override
  String get confirmClear => 'تأیید پاک کردن';

  @override
  String confirmClearMessage(String itemType) {
    return 'آیا مطمئن هستید که می‌خواهید این $itemType را پاک کنید؟';
  }

  @override
  String get uploadButton => 'بارگذاری شود؟';

  @override
  String get resolutionLabel => 'وضوح: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'فقط نمایش تصاویر به زبان رابط کاربری';

  @override
  String get confirmClearAll => 'تأیید پاک کردن همه';

  @override
  String get imageUploadSuccess => 'تصویر با موفقیت بارگذاری شد!';

  @override
  String imageUploadFailed(String error) {
    return 'بارگذاری تصویر ناموفق بود: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'تنظیم تصویر ناموفق بود: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'حذف تصویر ناموفق بود: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'پاک کردن همه تصاویر ناموفق بود: $error';
  }

  @override
  String get yes => 'بله';

  @override
  String get posterCategory => 'پوستر';

  @override
  String get backdropsCategory => 'پس‌زمینه‌ها';

  @override
  String get bannerCategory => 'بنر';

  @override
  String get logoCategory => 'لوگو';

  @override
  String get thumbnailCategory => 'تصویر بندانگشتی';

  @override
  String get artCategory => 'تصویر هنری';

  @override
  String get discArtCategory => 'تصویر دیسک';

  @override
  String get screenshotCategory => 'اسکرین‌شات';

  @override
  String get boxCoverCategory => 'جلد جعبه';

  @override
  String get boxRearCoverCategory => 'جلد پشت جعبه';

  @override
  String get menuArtCategory => 'تصویر منو';

  @override
  String get confirmItemPoster => 'پوستر';

  @override
  String get confirmItemBackdrop => 'پس‌زمینه';

  @override
  String get confirmItemBanner => 'بنر';

  @override
  String get confirmItemLogo => 'لوگو';

  @override
  String get confirmItemThumbnail => 'تصویر بندانگشتی';

  @override
  String get confirmItemArt => 'تصویر هنری';

  @override
  String get confirmItemDiscArt => 'تصویر دیسک';

  @override
  String get confirmItemScreenshot => 'اسکرین‌شات';

  @override
  String get confirmItemBoxCover => 'جلد جعبه';

  @override
  String get confirmItemBoxRearCover => 'جلد پشت جعبه';

  @override
  String get confirmItemMenuArt => 'تصویر منو';

  @override
  String get resolutionAll => 'همه';

  @override
  String get resolutionHigh => 'بالا (1080p+)';

  @override
  String get resolutionMedium => 'متوسط (720p)';

  @override
  String get resolutionLow => 'پایین (<720p)';

  @override
  String get sources => 'منابع';

  @override
  String get audiobookChapters => 'فصل‌ها';

  @override
  String get audiobookBookmarks => 'نشانک‌ها';

  @override
  String get audiobookNotes => 'یادداشت‌ها';

  @override
  String get audiobookQueue => 'صف پخش';

  @override
  String get audiobookTimeline => 'خط زمانی';

  @override
  String get audiobookTimelineEmpty => 'خط زمانی خالی است';

  @override
  String get audiobookFocusedTimeline => 'خط زمانی متمرکز';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'برون‌بری نشانک‌ها';

  @override
  String get audiobookExportNotes => 'برون‌بری یادداشت‌ها';

  @override
  String get audiobookExportAll => 'برون‌بری همه';

  @override
  String audiobookExportSuccess(String path) {
    return 'برون‌بری شد در $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'برون‌بری ناموفق بود: $error';
  }

  @override
  String get audiobookLyrics => 'متن ترانه';

  @override
  String get audiobookAddBookmark => 'افزودن نشانک';

  @override
  String get audiobookAddNote => 'افزودن یادداشت';

  @override
  String get audiobookEditNote => 'ویرایش یادداشت';

  @override
  String get audiobookNoteHint => 'برای این لحظه یادداشتی بنویسید';

  @override
  String get audiobookSleepTimer => 'زمان‌سنج خواب';

  @override
  String get audiobookSleepOff => 'خاموش';

  @override
  String get audiobookSleepEndOfChapter => 'پایان فصل';

  @override
  String get audiobookSleepCustom => 'سفارشی';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining باقی‌مانده';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقیقه',
      one: '1 دقیقه',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'سرعت پخش';

  @override
  String get audiobookRemainingTime => 'باقی‌مانده';

  @override
  String get audiobookElapsedTime => 'سپری‌شده';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$seconds ثانیه عقب';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$seconds ثانیه جلو';
  }

  @override
  String get audiobookPreviousChapter => 'فصل قبلی';

  @override
  String get audiobookNextChapter => 'فصل بعدی';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'فصل $current از $total';
  }

  @override
  String get audiobookNoChapters => 'بدون فصل';

  @override
  String get audiobookNoBookmarks => 'هنوز نشانکی نیست';

  @override
  String get audiobookNoNotes => 'هنوز یادداشتی نیست';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'نشانک در $position افزوده شد';
  }

  @override
  String get audiobookSpeedReset => 'بازنشانی به 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'ذخیره';

  @override
  String get audiobookCancel => 'لغو';

  @override
  String get audiobookDelete => 'حذف';

  @override
  String get subtitlePreferencesDescription =>
      'تغییر حالت‌های زیرنویس، زبان‌های پیش‌فرض، ظاهر و گزینه‌های رندر.';

  @override
  String get subtitleRendering => 'رندر زیرنویس';

  @override
  String get displayOptions => 'گزینه‌های نمایش';

  @override
  String get releaseDateAscending => 'تاریخ انتشار (صعودی)';

  @override
  String get releaseDateDescending => 'تاریخ انتشار (نزولی)';

  @override
  String get groupContributions => 'گروه‌بندی مشارکت‌ها';

  @override
  String get groupMultipleRoles => 'گروه‌بندی چند نقش';

  @override
  String get libraryWriteAccessWarningTitle => 'هشدار دسترسی نوشتن در کتابخانه';

  @override
  String get libraryWriteAccessHowToFix => 'روش رفع این مشکل:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. به کاربر سرویس Jellyfin (مثلاً jellyfin یا PUID/PGID داکر) برای پوشه‌های کتابخانه رسانه خود روی سرور، مجوز نوشتن بدهید.\n\n2. یا به داشبورد Jellyfin -> کتابخانه‌ها بروید، این کتابخانه را ویرایش کنید و «ذخیره آثار هنری در پوشه‌های رسانه» را غیرفعال کنید تا آثار هنری در پایگاه داده داخلی Jellyfin ذخیره شوند.';

  @override
  String get dismiss => 'بستن';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'کتابخانه «$libraryName» شما طوری پیکربندی شده که آثار هنری را مستقیماً در پوشه‌های رسانه ذخیره کند («ذخیره آثار هنری در پوشه‌های رسانه» فعال است). با این حال، Jellyfin دسترسی نوشتن را آزمایش کرده و مجوز نوشتن فایل در این پوشه را ندارد:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'به نظر می‌رسد Jellyfin نتوانسته آثار هنری را به‌روزرسانی کند. کتابخانه شما طوری پیکربندی شده که آثار هنری را مستقیماً در پوشه‌های رسانه ذخیره کند («ذخیره آثار هنری در پوشه‌های رسانه» فعال است). این خطا معمولاً زمانی رخ می‌دهد که فرایند سرور Jellyfin مجوز نوشتن فایل در پوشه‌های رسانه شما را نداشته باشد.';

  @override
  String get replay => 'پخش دوباره';

  @override
  String get fileInformation => 'اطلاعات فایل';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'اندازه: $size  •  قالب: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'نمایش همه ($count) ترک صوتی';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'نمایش همه ($count) ترک زیرنویس';
  }

  @override
  String get checkingDirectPlay => 'در حال بررسی قابلیت پخش مستقیم...';

  @override
  String get directPlayCapabilityLabel => 'قابلیت پخش مستقیم: ';

  @override
  String get forced => 'اجباری';

  @override
  String get transcodeContainerNotSupported =>
      'قالب کانتینر توسط پخش‌کننده پشتیبانی نمی‌شود.';

  @override
  String get transcodeVideoCodecNotSupported => 'کدک ویدیو پشتیبانی نمی‌شود.';

  @override
  String get transcodeAudioCodecNotSupported => 'کدک صدا پشتیبانی نمی‌شود.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'قالب زیرنویس پشتیبانی نمی‌شود (نیاز به چاپ روی تصویر دارد).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'پروفایل صدا پشتیبانی نمی‌شود.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'پروفایل ویدیو پشتیبانی نمی‌شود.';

  @override
  String get transcodeVideoLevelNotSupported => 'سطح ویدیو پشتیبانی نمی‌شود.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'وضوح ویدیو توسط این دستگاه پشتیبانی نمی‌شود.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'عمق بیت ویدیو پشتیبانی نمی‌شود.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'نرخ فریم ویدیو پشتیبانی نمی‌شود.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'نرخ بیت فایل از حد پخش جریانی پخش‌کننده فراتر است.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'نرخ بیت ویدیو از حد پخش جریانی فراتر است.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'نرخ بیت صدا از حد پخش جریانی فراتر است.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'تعداد کانال‌های صوتی پشتیبانی نمی‌شود.';

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
  String get sortAlphabetical => 'الفبایی';

  @override
  String get sortReleaseAscending => 'ترتیب انتشار (صعودی)';

  @override
  String get sortReleaseDescending => 'ترتیب انتشار (نزولی)';

  @override
  String get sortCustomDragDrop => 'سفارشی (کشیدن و رها کردن)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'گزینه‌های مرتب‌سازی لیست پخش';

  @override
  String get resetSort => 'بازنشانی مرتب‌سازی';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'تماشای دوباره فصل $season قسمت $episode';
  }

  @override
  String get rewatchPlaylist => 'تماشای دوباره لیست پخش';

  @override
  String get noSubtitlesFound => 'زیرنویسی یافت نشد.';

  @override
  String get adminControls => 'کنترل‌های مدیر';

  @override
  String get impellerRendering => 'موتور رندر (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller موتور رندر مدرن GPU در Flutter است که انیمیشن‌های روان‌تر و پرش کمتری ارائه می‌دهد. در برخی تی‌وی‌باکس‌ها و GPUهای قدیمی ممکن است باعث اشکال تصویری یا ویدیوی سیاه شود؛ در این صورت آن را خاموش کنید. خودکار بهترین حالت پیش‌فرض را برای دستگاه شما انتخاب می‌کند. برای اعمال، Moonfin را دوباره راه‌اندازی کنید.';

  @override
  String get impellerAuto => 'خودکار';

  @override
  String get impellerOn => 'روشن';

  @override
  String get impellerOff => 'خاموش';

  @override
  String get impellerRestartTitle => 'راه‌اندازی مجدد لازم است';

  @override
  String get impellerRestartMessage =>
      'برای تغییر موتور رندر، Moonfin باید دوباره راه‌اندازی شود. اکنون برنامه را ببندید و سپس دوباره باز کنید تا اعمال شود.';

  @override
  String get impellerCloseNow => 'اکنون برنامه بسته شود';

  @override
  String get adminRefreshLibrary => 'به‌روزرسانی کتابخانه';

  @override
  String get adminRefreshAllLibraries => 'به‌روزرسانی همه کتابخانه‌ها';

  @override
  String get adminRepoSortDateOldest => 'تاریخ افزودن (قدیمی‌ترین اول)';

  @override
  String get adminRepoSortDateNewest => 'تاریخ افزودن (جدیدترین اول)';

  @override
  String get adminRepoSortNameAsc => 'الفبایی (الف تا ی)';

  @override
  String get adminRepoSortNameDesc => 'الفبایی (ی تا الف)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'در حال بارگذاری تحلیل‌های سرور... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'مطابق با منبع';

  @override
  String get imdbTop250Movies => '250 فیلم برتر IMDb';

  @override
  String get imdbTop250TvShows => '250 سریال برتر IMDb';

  @override
  String get imdbMostPopularMovies => 'محبوب‌ترین فیلم‌های IMDb';

  @override
  String get imdbMostPopularTvShows => 'محبوب‌ترین سریال‌های IMDb';

  @override
  String get imdbLowestRatedMovies => 'کم‌امتیازترین فیلم‌های IMDb';

  @override
  String get imdbTopEnglishMovies => 'برترین فیلم‌های انگلیسی‌زبان IMDb';

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
  String get integrations => 'ادغام ها';

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
