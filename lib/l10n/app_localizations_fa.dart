// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'باله ماه';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'وارد شوید';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'در حال اتصال به $serverName';
  }

  @override
  String get quickConnect => 'اتصال سریع';

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
  String get waitingForAuthorization => 'در انتظار مجوز...';

  @override
  String get back => 'برگشت';

  @override
  String get serverUnavailable => 'سرور در دسترس نیست';

  @override
  String get loginFailed => 'ورود ناموفق بود';

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
  String get remove => 'حذف کنید';

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
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Classic is the original centered moonfin layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Classic';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get expandedTabs => 'Expanded Tabs';

  @override
  String get expandedTabsSubtitle =>
      'Automatically show tab content while browsing tabs. Turn off to open and close each tab manually.';

  @override
  String get recommendationSystem => 'Recommendation System';

  @override
  String get recommendationSystemSubtitle =>
      'Use the Moonfin Recommends local-library algorithm or the online TMDb\'s Similarity Metrics. Note: Online recommendations require Seerr integration.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb Similarity';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Apply Parental Rating Cap?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limit Moonfin Recommends suggestions by parental rating of target media';

  @override
  String get interfaceStyle => '';

  @override
  String get interfaceStyleSubtitle => '';

  @override
  String get interfaceStyleAutomatic => '';

  @override
  String get interfaceStyleApple => '';

  @override
  String get interfaceStyleMaterial => '';

  @override
  String get glassQuality => 'Glass Quality';

  @override
  String get glassQualitySubtitle =>
      'Auto picks the best glass effect for this device. Full forces real blur; Reduced uses a lightweight glass that saves GPU power.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Full';

  @override
  String get glassQualityReduced => 'Reduced';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'جابه‌جایی بین Moonfin و Neon Pulse بدون راه‌اندازی مجدد برنامه';

  @override
  String get customThemeTitle => 'Custom Theme';

  @override
  String get customThemeSubtitle =>
      'Custom themes alter visual elements across Moonfin. Choose one of these options to suit your style.';

  @override
  String get keyboardPreferSystemIme => 'صفحه کلید سیستم را ترجیح دهید';

  @override
  String get keyboardPreferSystemImeDescription =>
      'از روش ورودی دستگاه خود به طور پیش فرض برای وارد کردن متن استفاده کنید';

  @override
  String get themeMoonfin => 'باله ماه';

  @override
  String get themeMoonfinSubtitle =>
      'ظاهر Moonfin کنونی که همه شما عاشق آن شده اید';

  @override
  String get themeNeonPulse => 'نئون پالس';

  @override
  String get themeNeonPulseSubtitle =>
      'استایل سینت ویو با درخشش سرخابی، متن فیروزه‌ای و کنتراست کروم قوی‌تر';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixel-art styling with a chunky palette, blocky borders, hard drop-shadows, and a pixel font';

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
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Paused';

  @override
  String get gameSaveState => 'Save state';

  @override
  String get gameLoadState => 'Load state';

  @override
  String get gameFastForward => 'Fast-forward';

  @override
  String get gameEmulatorSettings => 'Emulator settings';

  @override
  String get gameNoCoreOptions => 'This core has no adjustable options.';

  @override
  String get gameHoldToOpenMenu => 'Hold to open menu';

  @override
  String get gamePlaybackUnsupported =>
      'Game playback is not supported on this device yet.';

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
  String get recordings => 'ضبط ها';

  @override
  String get schedule => 'برنامه ریزی کنید';

  @override
  String get series => 'سری';

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
  String get pickDiscoverySubjects =>
      'انتخاب کنید که کدام موضوع فیدها در Discover نمایش داده شود.';

  @override
  String get apply => 'درخواست کنید';

  @override
  String get openLink => 'پیوند را باز کنید';

  @override
  String get scanWithYourPhone => 'با گوشی خود اسکن کنید';

  @override
  String get audiobookGenres => 'ژانرهای کتاب صوتی';

  @override
  String get pickAudiobookGenres =>
      'انتخاب کنید کدام ژانرها در Audiobook Discover نمایش داده شوند.';

  @override
  String get discoverAudiobooks => 'کتاب های صوتی را کشف کنید';

  @override
  String get librivoxDescription => 'عناوین محبوب دامنه عمومی از LibriVox.';

  @override
  String titlesCount(int count) {
    return 'عناوین $count';
  }

  @override
  String get scrollLeft => 'به سمت چپ حرکت کنید';

  @override
  String get scrollRight => 'به سمت راست پیمایش کنید';

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
  String get resume => 'رزومه';

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
  String get trendingTitlesOpenLibrary =>
      'عناوین پرطرفدار بر اساس موضوع از Open Library.';

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
  String get watched => 'تماشا کرد';

  @override
  String get unread => 'خوانده نشده';

  @override
  String get unwatched => 'دیده نشده';

  @override
  String get seriesStatus => 'وضعیت سریال';

  @override
  String get allLibraries => 'همه کتابخانه ها';

  @override
  String get books => 'کتاب ها';

  @override
  String get latestBooks => 'Latest Books';

  @override
  String get latestAudiobooks => 'Latest Audiobooks';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books',
      one: '1 book',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Book';

  @override
  String get bookFormatAudiobook => 'Audiobook';

  @override
  String bookPercentRead(int percent) {
    return '$percent% read';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time left';
  }

  @override
  String get bookHeroRead => 'Read';

  @override
  String get bookHeroListen => 'Listen';

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
      other: '$count audiobooks',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'فهرست آهنگ';

  @override
  String get itemListPlaceholder => 'لیست موارد در اینجا ظاهر می شود';

  @override
  String get favoriteTracksPlaceholder =>
      'آهنگ های مورد علاقه در اینجا ظاهر می شوند';

  @override
  String get failedToLoad => 'بارگیری نشد';

  @override
  String get delete => 'حذف کنید';

  @override
  String get save => 'ذخیره کنید';

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
  String get seasons => 'فصل ها';

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
  String get noBooksFound => 'هیچ کتابی برای این نویسنده یافت نشد.';

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
      other: '$count Seasons',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'پایان در $time';
  }

  @override
  String get items => 'Items';

  @override
  String get extras => 'Extras';

  @override
  String get behindTheScenes => 'Behind the Scenes';

  @override
  String get deletedScenes => 'Deleted Scenes';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Interviews';

  @override
  String get scenes => 'Scenes';

  @override
  String get shorts => 'Shorts';

  @override
  String get trailers => 'تریلرها';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
  }

  @override
  String get view => 'مشاهده کنید';

  @override
  String get resumeReading => 'Resume Reading';

  @override
  String get read => 'بخوانید';

  @override
  String resumeFrom(String position) {
    return 'رزومه از $position';
  }

  @override
  String get play => 'بازی کنید';

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
  String get cast => 'بازیگران';

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
  String get none => 'هیچ کدام';

  @override
  String get downloadSubtitlesLabel => 'دانلود زیرنویس ...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'با استفاده از افزونه OpenSubtitles جستجو کنید';

  @override
  String get downloadSubtitles => 'دانلود زیرنویس';

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
  String get directors => '';

  @override
  String get writer => '';

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
  String get shuffle => 'مخلوط کردن';

  @override
  String get shuffleAllMusic => 'Shuffle all music';

  @override
  String get carSignInPrompt => 'Sign in to Moonfin on your phone';

  @override
  String get carServerUnreachable => 'Can\'t reach your server';

  @override
  String downloadsCount(int count) {
    return '$count دانلودها';
  }

  @override
  String get perfectMatch => 'تطابق کامل';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'مونونوکلئوز';

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
  String get pause => 'مکث کنید';

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
  String get bitrateOverride => 'لغو نرخ بیت';

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
  String get reset => 'بازنشانی کنید';

  @override
  String get unknown => 'ناشناس';

  @override
  String get playbackInformation => 'اطلاعات پخش';

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
  String get player => 'بازیکن';

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
  String get codec => 'کدک';

  @override
  String get videoBitrate => 'میزان بیت ویدیو';

  @override
  String get track => 'آهنگ';

  @override
  String get channels => 'کانال ها';

  @override
  String get audioBitrate => 'میزان بیت صدا';

  @override
  String get sampleRate => 'نرخ نمونه';

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
  String get reloadReader => 'Reload Reader';

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
  String get guideTimeline => 'راهنمای جدول زمانی';

  @override
  String failedToLoadGuide(String error) {
    return 'راهنما بارگیری نشد: $error';
  }

  @override
  String get noChannelsFound => 'کانالی پیدا نشد';

  @override
  String get liveBadge => 'زنده';

  @override
  String guideNextProgram(String time, String title) {
    return 'Next: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m left';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h left';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m left';
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
  String get record => 'ضبط کنید';

  @override
  String get cancelRecordingAction => 'لغو ضبط';

  @override
  String get programSetToRecord => 'برنامه تنظیم شده برای ضبط';

  @override
  String get recordingCancelled => 'ضبط لغو شد';

  @override
  String get unableToCreateRecording => 'امکان ایجاد ضبط وجود ندارد';

  @override
  String get watch => 'تماشا کنید';

  @override
  String get close => 'بستن';

  @override
  String failedToPlayChannel(String name) {
    return '$name پخش نشد';
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
  String get seerrAccountType => 'نوع حساب Serr';

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
    return 'S$season E$episode';
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
    return 'S$number';
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
      other: '$count episodes',
      one: '1 episode',
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
  String get serverSyncAndPluginStatus => 'همگام سازی سرور و وضعیت پلاگین';

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
  String get integrations => 'ادغام ها';

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
  String get backgroundBackdrops => 'پس زمینه پس زمینه';

  @override
  String get showBackdropImages => 'نمایش تصاویر پس زمینه پشت محتوا';

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
  String get snow => 'برف';

  @override
  String get fireworks => 'آتش بازی';

  @override
  String get confetti => 'کانفتی';

  @override
  String get fallingLeaves => 'ریزش برگها';

  @override
  String get themeMusic => 'موسیقی تم';

  @override
  String get playThemeMusicOnDetailPages =>
      'موسیقی تم را در صفحات جزئیات پخش کنید';

  @override
  String get themeMusicVolume => 'حجم موسیقی تم';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'موسیقی تم در ردیف‌های صفحه اصلی';

  @override
  String get playWhenBrowsingHomeScreen => 'هنگام مرور صفحه اصلی بازی کنید';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => 'جزئیات تاری پس زمینه';

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
  String get settingsScrollWheelAction => '';

  @override
  String get settingsScrollWheelActionDescription => '';

  @override
  String get scrollWheelActionOff => '';

  @override
  String get scrollWheelActionSeek => '';

  @override
  String get scrollWheelActionVolume => '';

  @override
  String get playerTooltipVolume => '';

  @override
  String get fit => 'مناسب';

  @override
  String get autoCrop => 'برش خودکار';

  @override
  String get stretch => 'کشش';

  @override
  String get refreshRateSwitching => 'تغییر نرخ تازه سازی';

  @override
  String get disabled => 'از کار افتاده است';

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
  String get showDescriptionOnPause => 'نمایش توضیحات در حالت مکث';

  @override
  String get dimVideoShowOverview =>
      'ویدیو را کم نور کنید و متن نمای کلی را در حالت توقف نمایش دهید';

  @override
  String get osdLockButton => 'دکمه قفل OSD';

  @override
  String get osdLockButtonDescription =>
      'دکمه قفلی را نشان دهید که ورودی لمسی را تا فشار طولانی مسدود می‌کند';

  @override
  String get audioBehavior => 'رفتار صوتی';

  @override
  String get downmixToStereo => 'پایین میکس به استریو';

  @override
  String get defaultAudioLanguage => 'زبان صوتی پیش فرض';

  @override
  String get fallbackAudioLanguage => '';

  @override
  String get preferDefaultAudioTrack => '';

  @override
  String get preferDefaultAudioTrackDescription => '';

  @override
  String get preferAudioDescription => '';

  @override
  String get preferAudioDescriptionDescription => '';

  @override
  String get transcodingAudio => '';

  @override
  String get directStreamRemux => 'Direct Stream (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcoding (Bitrate or Resolution)';

  @override
  String get transcodingVideoAndAudio => 'Transcoding (Video & Audio)';

  @override
  String get transcodingVideo => 'Transcoding (Video)';

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
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'پشتیبانی TrueHD';

  @override
  String get enableDtsPassthrough =>
      'صدای بیت استریم DTS فقط به AVR. به پشتیبانی گیرنده و مسیر منبع DTS نیاز دارد';

  @override
  String get enableTrueHdAudio =>
      'صدای TrueHD را فعال کنید (ممکن است در همه پلتفرم ها کار نکند)';

  @override
  String get settingsAudioOutputMode => 'حالت خروجی صدا';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'کدک بازگشتی صوتی';

  @override
  String get settingsAudioFallbackCodecDescription => '';

  @override
  String get settingsAudioFallbackCodecAuto => '';

  @override
  String get settingsAudioFallbackCodecAac => '';

  @override
  String get settingsAudioFallbackCodecAc3 => '';

  @override
  String get settingsAudioFallbackCodecEac3 => '';

  @override
  String get settingsAudioFallbackCodecTrueHd => '';

  @override
  String get settingsAudioFallbackCodecMp3 => '';

  @override
  String get settingsAudioFallbackCodecOpus => '';

  @override
  String get settingsAudioFallbackCodecFlac => '';

  @override
  String get settingsMaxAudioChannels => '';

  @override
  String get settingsMaxAudioChannelsDescription => '';

  @override
  String get settingsMaxAudioChannelsAuto => '';

  @override
  String get settingsMaxAudioChannelsMono => '';

  @override
  String get settingsMaxAudioChannelsStereo => '';

  @override
  String get settingsMaxAudioChannels3_0 => '';

  @override
  String get settingsMaxAudioChannels4_0 => '';

  @override
  String get settingsMaxAudioChannels5_0 => '';

  @override
  String get settingsMaxAudioChannels5_1 => '';

  @override
  String get settingsMaxAudioChannels6_1 => '';

  @override
  String get settingsMaxAudioChannels7_1 => '';

  @override
  String get settingsAudioPassthroughAdvanced => 'عبور (پیشرفته)';

  @override
  String get settingsAudioCodecPassthrough => 'رمز عبور عبور';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'فقط فرمت هایی را که سینک AVR یا HDMI شما پشتیبانی می کند، فعال کنید.';

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
      'Bitstream Dolby Digital Plus (EAC3) به رسیور خارجی.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos از طریق EAC3 (JOC) به رمزگشای خارجی.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (شامل هسته DTS) به رسیور خارجی.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD با متادیتا Atmos به رمزگشای خارجی.';

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
  String get settingsAudioRouteHeadphones => 'Headphones';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'تشخیص';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'سطح ویدیو';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'محدوده ویدیویی';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'کدک زیرنویس';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs => 'کدک های صوتی مجاز';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'کدک های صوتی HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'کدک های صوتی HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough => 'عبور صوتی-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'مسیر فعال صوتی';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Route HD Audio Support';

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
    return '${value}s';
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
  String get defaultToNoSubtitles => 'پیش‌فرض بدون زیرنویس است';

  @override
  String get turnOffSubtitlesByDefault =>
      'زیرنویس را به طور پیش فرض خاموش کنید';

  @override
  String get subtitleSize => 'اندازه زیرنویس';

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
  String get subtitleMode => '';

  @override
  String get subtitleModeFlagged => '';

  @override
  String get subtitleModeAlways => '';

  @override
  String get subtitleModeForeign => '';

  @override
  String get subtitleModeForced => '';

  @override
  String get subtitleModeFlaggedDescription => '';

  @override
  String get subtitleModeAlwaysDescription => '';

  @override
  String get subtitleModeForeignDescription => '';

  @override
  String get subtitleModeForcedDescription => '';

  @override
  String get subtitleModeNoneDescription => '';

  @override
  String get fallbackSubtitleLanguage => '';

  @override
  String get subtitleStream => '';

  @override
  String get subtitlePreviewText => 'روباه قهوه ای سریع از روی سگ تنبل می پرد';

  @override
  String get verticalOffset => 'افست عمودی';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

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
  String get customizationProfile => 'نمایه سفارشی سازی';

  @override
  String get customizationProfileDescription =>
      'نمایه را برای بارگیری، ویرایش و همگام سازی انتخاب کنید. جهانی در همه جا اعمال می شود مگر اینکه نمایه دستگاهی آن را لغو کند. نقطه سبز نمایه دستگاه فعلی شما را مشخص می کند.';

  @override
  String get loadProfile => 'بارگذاری نمایه';

  @override
  String get syncing => 'در حال همگام سازی...';

  @override
  String get syncToProfile => 'همگام سازی با نمایه';

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
  String get showLibrariesInToolbar => 'نمایش کتابخانه ها در نوار ابزار';

  @override
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

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
  String get enableFolderView => 'نمای پوشه را فعال کنید';

  @override
  String get showFolderBrowsingOption => 'نمایش گزینه مرور پوشه';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

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
  String get localPreviews => 'پیش نمایش های محلی';

  @override
  String get localPreviewsDescription =>
      'پیش‌نمایش‌های تریلر، رسانه و صدا را پیکربندی کنید.';

  @override
  String get mediaBarMode => 'سبک نوار رسانه';

  @override
  String get mediaBarModeDescription =>
      'از بین سبک‌های مختلف نوار رسانه انتخاب کنید، یا نوار رسانه را خاموش کنید';

  @override
  String get mediaBarModeMoonfin => 'باله ماه';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'خاموش';

  @override
  String get enableMediaBar => 'نوار رسانه را فعال کنید';

  @override
  String get showFeaturedContentSlideshow => 'نمایش اسلاید محتوای ویژه در خانه';

  @override
  String get contentType => 'نوع محتوا';

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
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

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
  String get latestMedia => 'آخرین رسانه';

  @override
  String get recentlyReleased => 'به تازگی منتشر شده است';

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
  String get homeSections => 'بخش های صفحه اصلی';

  @override
  String get resetToDefaults => 'به حالت پیش فرض بازنشانی کنید';

  @override
  String get homeRowPosterSize => 'اندازه پوستر ردیف خانه';

  @override
  String get perRowImageTypeSelection => 'انتخاب نوع تصویر در هر ردیف';

  @override
  String get configureImageTypeForEachRow =>
      'نوع تصویر را برای هر ردیف اصلی فعال پیکربندی کنید';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Continue Watching و Next Up را ادغام کنید';

  @override
  String get combineBothRows => 'هر دو ردیف را در یک بخش خانه ترکیب کنید';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'نوع تصویر در هر ردیف';

  @override
  String get perRowSettings => 'تنظیمات هر ردیف';

  @override
  String get autoLogin => 'ورود خودکار';

  @override
  String get lastUser => 'آخرین کاربر';

  @override
  String get currentUser => '';

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
  String get showClock => 'نمایش ساعت';

  @override
  String get displayClockDuringScreensaver =>
      'نمایش ساعت در حین محافظ صفحه نمایش';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

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
  String get trakt => 'تراکت';

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
  String get showMdbListAndTmdbRatings => 'نمایش رتبه بندی MDBLlist و TMDB';

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
  String get pluginLabel => 'پلاگین';

  @override
  String get pluginDetected => 'پلاگین شناسایی شد';

  @override
  String get pluginNotDetected => 'افزونه شناسایی نشد';

  @override
  String get pluginDetectedDescription =>
      'افزونه سرور شناسایی شد. اولین باری که افزونه پیدا می شود، همگام سازی به طور خودکار فعال می شود.';

  @override
  String get pluginNotDetectedDescription =>
      'افزونه سرور در حال حاضر شناسایی نشده است. تنظیمات محلی همچنان از مقادیر ذخیره شده یا پیش فرض های داخلی خود استفاده می کنند.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nنسخه: $version';
  }

  @override
  String get availableServices => 'خدمات موجود';

  @override
  String get serverPluginSync => 'همگام سازی پلاگین سرور';

  @override
  String get syncSettingsWithPlugin => 'تنظیمات را با افزونه سرور همگام کنید';

  @override
  String get whatSyncControls => 'چه کنترل های همگام سازی';

  @override
  String get syncControlsDescription =>
      'همگام‌سازی فقط کنترل می‌کند که آیا تنظیمات پشتیبانی شده از افزونه به سرور فشار داده می‌شوند یا از آن خارج می‌شوند. وقتی همگام‌سازی افزونه فعال است، عملکردهای انتخاب نمایه و همگام‌سازی نمایه در تنظیمات سفارشی‌سازی هستند.';

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
  String get seerrDiscoveryRows => '';

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
  String get seerrNotificationsSection => 'Notifications';

  @override
  String get seerrNotifyNewRequestsTitle => 'New request notifications';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Alert me when someone submits a request';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Request updates';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Approved, declined, and added to your library';

  @override
  String get seerrNotifyIssuesTitle => 'Issue updates';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'New issues, replies, and resolutions';

  @override
  String loggedInAs(String username) {
    return 'وارد شده به عنوان: $username';
  }

  @override
  String get discoverRows => 'ردیف ها را کشف کنید';

  @override
  String get discoverRowsDescriptionPlugin =>
      'برای سفارش مجدد بکشید. فعال یا غیرفعال کردن ردیف ها سفارش ردیف فعال با افزونه Moonfin همگام‌سازی می‌شود.';

  @override
  String get discoverRowsDescription =>
      'برای سفارش مجدد بکشید. فعال یا غیرفعال کردن ردیف ها';

  @override
  String get enabled => 'فعال شد';

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
  String get reorderToggleHomeRows =>
      'ردیف‌های خانه را دوباره ترتیب دهید و تغییر دهید';

  @override
  String get featuredContentAppearance => 'محتوای ویژه، ظاهر';

  @override
  String get posterSizeImageTypeFolderView =>
      'اندازه پوستر، نوع تصویر، نمای پوشه';

  @override
  String get mdbListTmdbRatingSources => 'MDBList، TMDB، و منابع رتبه بندی';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

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
  String seerrDownloadingPercent(int percent) {
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

  @override
  String itemsCount(int count) {
    return '$count موارد';
  }

  @override
  String get seerrSettings => 'تنظیمات Seer';

  @override
  String get requestMore => 'درخواست بیشتر';

  @override
  String get request => 'درخواست کنید';

  @override
  String get cancelRequest => 'لغو درخواست';

  @override
  String get playInMoonfin => 'بازی در Moonfin';

  @override
  String requestedByName(String name) {
    return 'درخواست شده توسط $name';
  }

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
  String get submitRequest => 'ارسال درخواست';

  @override
  String get allSeasons => 'تمام فصول';

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
  String get appearances => 'ظواهر';

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
  String get failedStatus => 'Failed';

  @override
  String get processingStatus => 'Processing';

  @override
  String modifiedByName(String name) {
    return 'Modified by $name';
  }

  @override
  String get completedStatus => 'Completed';

  @override
  String get requestErrorDuplicate => 'This title was already requested';

  @override
  String get requestErrorQuota => 'Request limit reached';

  @override
  String get requestErrorBlocklisted => 'This title is blocklisted';

  @override
  String get requestErrorNoSeasons => 'No seasons left to request';

  @override
  String get requestErrorPermission =>
      'You don\'t have permission to make this request';

  @override
  String get seerrRequestsTitle => 'Requests';

  @override
  String get seerrIssuesTitle => 'Issues';

  @override
  String get sortNewest => 'Newest';

  @override
  String get sortLastModified => 'Last Modified';

  @override
  String get noIssues => 'No issues';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit movie requests remaining';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit season requests remaining';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Part of $name';
  }

  @override
  String get viewCollection => 'View Collection';

  @override
  String get requestCollection => 'Request Collection';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total movies · $available available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Request $count movies';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Requesting $current of $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Requested $count movies';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Requested $ok of $total movies';
  }

  @override
  String get collectionAllRequested =>
      'All movies are already available or requested';

  @override
  String get reportIssue => 'Report Issue';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'What\'s wrong?';

  @override
  String get allEpisodes => 'All Episodes';

  @override
  String get episode => 'Episode';

  @override
  String get openStatus => 'Open';

  @override
  String get resolvedStatus => 'Resolved';

  @override
  String get resolveAction => 'Resolve';

  @override
  String get reopenAction => 'Reopen';

  @override
  String reportedByName(String name) {
    return 'Reported by $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comments';
  }

  @override
  String get addComment => 'Add a comment';

  @override
  String get deleteIssueConfirm => 'Delete this issue?';

  @override
  String get submitReport => 'Submit Report';

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
  String get seasonsLabel => 'فصل ها';

  @override
  String get episodesLabel => 'اپیزودها';

  @override
  String get access => 'دسترسی داشته باشید';

  @override
  String get add => 'اضافه کنید';

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
  String get edit => 'ویرایش کنید';

  @override
  String get encoding => 'رمزگذاری';

  @override
  String get error => 'خطا';

  @override
  String get forward => 'به جلو';

  @override
  String get general => 'ژنرال';

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
  String get remote => 'از راه دور';

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
  String get search => 'جستجو کنید';

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
  String get stop => 'توقف کنید';

  @override
  String get streaming => 'پخش جریانی';

  @override
  String get time => 'زمان';

  @override
  String get trickplay => 'ترفند بازی';

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
  String get mute => 'بی صدا';

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
  String get adminDrawerLibraries => 'کتابخانه ها';

  @override
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => 'رمزگذاری';

  @override
  String get adminDrawerResume => 'رزومه';

  @override
  String get adminDrawerStreaming => 'پخش جریانی';

  @override
  String get adminDrawerTrickplay => 'ترفند بازی';

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
  String adminRecentAlertEntries(int count) {
    return 'هشدار/خطاهای اخیر: $count';
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
  String get adminScanLibraries => 'اسکن کتابخانه ها';

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
  String get sessionForward => 'به جلو';

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
  String get volume => 'حجم';

  @override
  String get actions => 'اقدامات';

  @override
  String get videoCodec => 'کدک ویدیویی';

  @override
  String get audioCodec => 'کدک صوتی';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'تکمیل';

  @override
  String get direct => 'مستقیم';

  @override
  String get adminDisconnect => 'قطع کن';

  @override
  String get adminClearDates => 'تاریخ ها را پاک کنید';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

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
    return 'Remove device \'$name\'? The user will need to sign in again on this device.';
  }

  @override
  String get adminDeleteAllDevices => 'Delete all devices';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Remove $count devices? Affected users will need to sign in again. Your current device is not affected.';
  }

  @override
  String get adminDevicesDeletedAll => 'Devices removed';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Removed some devices; $count could not be removed.';
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
  String get adminLibraryOptionsSaved => 'گزینه های کتابخانه ذخیره شد';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'گزینه‌ها ذخیره نشد: $error';
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
  String get adminSaveOptions => 'ذخیره گزینه ها';

  @override
  String get adminPreferredMetadataLanguage => 'زبان فراداده ترجیحی';

  @override
  String get adminMetadataLanguageHint => 'به عنوان مثال en, de, fr';

  @override
  String get adminMetadataCountryCode => 'کد کشور فراداده';

  @override
  String get adminMetadataCountryHint => 'به عنوان مثال ایالات متحده، DE، FR';

  @override
  String get adminLibraryTabPaths => 'Paths';

  @override
  String get adminLibraryTabOptions => 'Options';

  @override
  String get adminLibraryTabDownloaders => 'Downloaders';

  @override
  String get adminLibMetadataSavers => 'Metadata savers';

  @override
  String get adminLibSubtitleDownloaders => 'Subtitle downloaders';

  @override
  String get adminLibLyricDownloaders => 'Lyric downloaders';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadata downloaders: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Image fetchers: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'This server exposes no downloaders for this library type.';

  @override
  String get adminLibrarySectionGeneral => 'General';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Embedded Info';

  @override
  String get adminLibrarySectionSubtitles => 'Subtitles';

  @override
  String get adminLibrarySectionImages => 'Images';

  @override
  String get adminLibrarySectionSeries => 'Series';

  @override
  String get adminLibrarySectionMusic => 'Music';

  @override
  String get adminLibrarySectionMovies => 'Movies';

  @override
  String get adminLibRealtimeMonitor => 'Enable real-time monitoring';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detect file changes and process them automatically.';

  @override
  String get adminLibArchiveMediaFiles => 'Treat archives as media files';

  @override
  String get adminLibEnablePhotos => 'Display photos';

  @override
  String get adminLibSaveLocalMetadata => 'Save artwork into media folders';

  @override
  String get adminLibRefreshInterval => 'Automatic metadata refresh';

  @override
  String get adminLibRefreshNever => 'Never';

  @override
  String get adminLibDefault => 'Default';

  @override
  String get adminLibDisplayTitle => 'Display';

  @override
  String get adminLibDisplaySection => 'Library display';

  @override
  String get adminLibFolderView =>
      'Display a folder view to show plain media folders';

  @override
  String get adminLibSpecialsInSeasons =>
      'Display specials within seasons they aired in';

  @override
  String get adminLibGroupMovies => 'Group movies into collections';

  @override
  String get adminLibGroupShows => 'Group shows into collections';

  @override
  String get adminLibExternalSuggestions =>
      'Show external content in suggestions';

  @override
  String get adminLibDateAddedSection => 'Date added behavior';

  @override
  String get adminLibDateAddedLabel => 'Use date added from';

  @override
  String get adminLibDateAddedImport => 'Date scanned into the library';

  @override
  String get adminLibDateAddedFile => 'Date the file was created';

  @override
  String get adminLibMetadataTitle => 'Metadata and Images';

  @override
  String get adminLibMetadataLangSection => 'Preferred metadata language';

  @override
  String get adminLibChaptersSection => 'Chapters';

  @override
  String get adminLibDummyChapterDuration => 'Dummy chapter duration (seconds)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Length of chapters generated for media that has none. Set to 0 to disable.';

  @override
  String get adminLibChapterImageResolution => 'Chapter image resolution';

  @override
  String get adminLibNfoTitle => 'NFO Settings';

  @override
  String get adminLibNfoHelp =>
      'NFO metadata is compatible with Kodi and similar clients. Settings apply to all libraries that save NFO metadata.';

  @override
  String get adminLibKodiUser => 'User to store watch data for in NFO files';

  @override
  String get adminLibSaveImagePaths => 'Save image paths within NFO files';

  @override
  String get adminLibPathSubstitution =>
      'Enable path substitution for NFO image paths';

  @override
  String get adminLibExtraThumbs =>
      'Copy extrafanart images into an extrathumbs folder';

  @override
  String get adminLibNone => 'None';

  @override
  String adminLibRefreshDays(int days) {
    return '$days days';
  }

  @override
  String get adminLibEmbeddedTitles => 'Use embedded titles';

  @override
  String get adminLibEmbeddedExtrasTitles => 'Use embedded titles for extras';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Use embedded episode information';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Allow embedded subtitles';

  @override
  String get adminLibEmbeddedAllowAll => 'Allow all';

  @override
  String get adminLibEmbeddedAllowText => 'Text only';

  @override
  String get adminLibEmbeddedAllowImage => 'Image only';

  @override
  String get adminLibEmbeddedAllowNone => 'None';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Skip download if embedded subtitles are present';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Skip download if the audio track matches the download language';

  @override
  String get adminLibRequirePerfectMatch => 'Require a perfect subtitle match';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Save subtitles into media folders';

  @override
  String get adminLibChapterImageExtraction => 'Extract chapter images';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extract chapter images during the library scan';

  @override
  String get adminLibTrickplayExtraction => 'Enable trickplay image extraction';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extract trickplay images during the library scan';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Save trickplay images into media folders';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automatically merge series that are spread across multiple folders';

  @override
  String get adminLibSeasonZeroName => 'Season zero display name';

  @override
  String get adminLibLufsScan => 'Enable LUFS scan for audio normalization';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Prefer non-standard artists tag';

  @override
  String get adminLibAutoAddToCollection =>
      'Automatically add movies to collections';

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
  String get adminNoPathsAdded =>
      'هیچ مسیری اضافه نشده است (بعدا می توان اضافه کرد)';

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
  String get adminNoProfileChanges =>
      'هیچ تغییری در نمایه برای ذخیره وجود ندارد';

  @override
  String get adminProfileSaved => 'نمایه ذخیره شد';

  @override
  String adminSaveFailed(String error) {
    return 'ذخیره نشد: $error';
  }

  @override
  String get adminPermissionsSaved => 'مجوزها ذخیره شد';

  @override
  String get adminPasswordsMismatch => 'گذرواژه ها مطابقت ندارند';

  @override
  String adminFailed(String error) {
    return 'ناموفق: $error';
  }

  @override
  String get adminUserLoadFailed => 'کاربر بارگیری نشد';

  @override
  String get adminBackToUsers => 'بازگشت به کاربران';

  @override
  String get adminSaveProfile => 'ذخیره نمایه';

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
  String get adminAllowContentDeletion => 'اجازه حذف محتوا';

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
  String get adminRemoteBitrateLimit => 'محدودیت نرخ بیت کلاینت راه دور (bps)';

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
  String get adminSavePermissions => 'ذخیره مجوزها';

  @override
  String get adminEnableAllLibraryAccess =>
      'دسترسی به تمام کتابخانه ها را فعال کنید';

  @override
  String get adminSaveAccess => 'ذخیره دسترسی';

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
  String get adminDeviceAndChannelAccess => 'دسترسی به دستگاه و کانال';

  @override
  String get adminEnableAllDevices => 'دسترسی به همه دستگاه ها را فعال کنید';

  @override
  String get adminEnableAllChannels => 'دسترسی به همه کانال ها را فعال کنید';

  @override
  String get adminParentalControl => 'Parental Control';

  @override
  String get adminMaxParentalRating => 'Maximum allowed parental rating';

  @override
  String get adminMaxParentalRatingHint =>
      'Content with a higher rating will be hidden from this user.';

  @override
  String get adminParentalRatingNone => 'None';

  @override
  String get adminBlockUnratedItems =>
      'Block items with no or unrecognized rating information';

  @override
  String get adminUnratedBook => 'Books';

  @override
  String get adminUnratedChannelContent => 'Channels';

  @override
  String get adminUnratedLiveTvChannel => 'Live TV';

  @override
  String get adminUnratedMovie => 'Movies';

  @override
  String get adminUnratedMusic => 'Music';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Shows';

  @override
  String get adminAccessSchedules => 'Access Schedules';

  @override
  String get adminAccessSchedulesHint =>
      'Allow access only during the scheduled times below. Access is allowed all day when no schedule is set.';

  @override
  String get adminAddSchedule => 'Add Schedule';

  @override
  String get adminScheduleDay => 'Day';

  @override
  String get adminScheduleStart => 'Start';

  @override
  String get adminScheduleEnd => 'End';

  @override
  String get adminDayEveryday => 'Every day';

  @override
  String get adminDayWeekday => 'Weekday';

  @override
  String get adminDayWeekend => 'Weekend';

  @override
  String get adminDaySunday => 'Sunday';

  @override
  String get adminDayMonday => 'Monday';

  @override
  String get adminDayTuesday => 'Tuesday';

  @override
  String get adminDayWednesday => 'Wednesday';

  @override
  String get adminDayThursday => 'Thursday';

  @override
  String get adminDayFriday => 'Friday';

  @override
  String get adminDaySaturday => 'Saturday';

  @override
  String get adminAllowedTags => 'Allowed tags';

  @override
  String get adminAllowedTagsHint =>
      'Only content with these tags is shown. Leave empty to allow all.';

  @override
  String get adminBlockedTags => 'Blocked tags';

  @override
  String get adminBlockedTagsHint =>
      'Content with these tags is hidden from this user.';

  @override
  String get adminAddTag => 'Add tag';

  @override
  String get adminEnabledDevices => 'Enabled devices';

  @override
  String get adminEnabledChannels => 'Enabled channels';

  @override
  String get adminAuthProvider => 'Authentication provider';

  @override
  String get adminPasswordResetProvider => 'Password reset provider';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maximum failed login attempts before lockout';

  @override
  String get adminLoginAttemptsHint =>
      'Set to 0 for the default, or -1 to disable lockout.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay access';

  @override
  String get adminSyncPlayCreateAndJoin => 'Allow creating and joining groups';

  @override
  String get adminSyncPlayJoin => 'Allow joining groups';

  @override
  String get adminSyncPlayNone => 'No access';

  @override
  String get adminContentDeletionFolders => 'Allow content deletion from';

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
  String get adminBackupOptionsTitle => 'Create Backup';

  @override
  String get adminBackupInclude => 'Choose what to include in the backup.';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Always included';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Subtitles';

  @override
  String get adminBackupTrickplay => 'Trickplay images';

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
  String get adminTimeLimit => 'محدودیت زمانی (اختیاری)';

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
  String get adminMissingAuthToken =>
      'تنظیمات باز نشد: نشانه تأیید وجود ندارد.';

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
  String get adminBrandingSaved => 'تنظیمات نام تجاری ذخیره شد';

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
  String get adminStreamingSaved => 'تنظیمات پخش جریانی ذخیره شد';

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
  String get adminPlaybackSaved => 'تنظیمات پخش ذخیره شد';

  @override
  String get adminPlaybackLoadFailed => 'تنظیمات پخش بارگیری نشد';

  @override
  String get adminPlaybackTranscoding => 'پخش / رمزگذاری';

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
  String get adminTrickplaySaved => 'تنظیمات Trickplay ذخیره شد';

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
  String get adminResumeSaved => 'تنظیمات از سرگیری ذخیره شد';

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
  String get adminNetworkingSaved =>
      'تنظیمات شبکه ذخیره شد. ممکن است نیاز به راه اندازی مجدد سرور باشد.';

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
  String get adminBaseUrlHint => 'به عنوان مثال /ژله فین';

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
  String get adminMetadataSaved => 'متادیتا ذخیره شد';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'ابرداده بارگیری نشد: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'ابرداده ذخیره نشد: $error';
  }

  @override
  String get adminRefreshMetadata => 'Refresh Metadata';

  @override
  String get recursive => 'بازگشتی';

  @override
  String get adminReplaceAllMetadata => 'همه متادیتا را جایگزین کنید';

  @override
  String get adminReplaceAllImages => 'همه تصاویر را جایگزین کنید';

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
  String get adminAddTuner => 'تیونر را اضافه کنید';

  @override
  String get adminTunerType => 'نوع تیونر';

  @override
  String get adminTunerTypeHint => 'HDHomeRun، M3U، سایر موارد';

  @override
  String get adminUrlPath => 'URL / مسیر';

  @override
  String get adminNameOptional => 'نام (اختیاری)';

  @override
  String get adminTunerAdded => 'تیونر اضافه شد';

  @override
  String adminTunerAddFailed(String error) {
    return 'تیونر اضافه نشد: $error';
  }

  @override
  String get adminAddGuideProvider => 'ارائه دهنده راهنما را اضافه کنید';

  @override
  String get adminProviderType => 'نوع ارائه دهنده';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect یا XMLTV';

  @override
  String get adminUsernameOptional => 'نام کاربری (اختیاری)';

  @override
  String get adminRefreshInterval => 'فاصله بازخوانی (ساعت)';

  @override
  String get adminProviderAdded => 'ارائه دهنده اضافه شد';

  @override
  String adminProviderAddFailed(String error) {
    return 'ارائه دهنده اضافه نشد: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'تنظیم کننده حذف نشد: $error';
  }

  @override
  String get adminTunerResetRequested => 'تنظیم مجدد درخواست شد';

  @override
  String adminTunerResetFailed(String error) {
    return 'تنظیم مجدد انجام نشد: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'This tuner type does not support resetting.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'ارائه دهنده حذف نشد: $error';
  }

  @override
  String get adminRecordingSettings => 'تنظیمات ضبط';

  @override
  String get adminPrePadding => 'پیش لایه (دقیقه)';

  @override
  String get adminPostPadding => 'پس از بالشتک (دقیقه)';

  @override
  String get adminRecordingPath => 'مسیر ضبط';

  @override
  String get adminSeriesRecordingPath => 'مسیر ضبط سریال';

  @override
  String get adminMovieRecordingPath => 'Movie recording path';

  @override
  String get adminGuideDays => 'Guide data days';

  @override
  String get adminGuideDaysAuto => 'Automatic';

  @override
  String adminGuideDaysValue(int days) {
    return '$days days';
  }

  @override
  String get adminRecordingPostProcessor => 'Post-processing application path';

  @override
  String get adminRecordingPostProcessorArgs => 'Post-processor arguments';

  @override
  String get adminSaveRecordingNfo => 'Save recording NFO metadata';

  @override
  String get adminSaveRecordingImages => 'Save recording images';

  @override
  String get adminLiveTvSectionTiming => 'Timing';

  @override
  String get adminLiveTvSectionPaths => 'Recording paths';

  @override
  String get adminLiveTvSectionPostProcessing => 'Post-processing';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Guide data: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'تنظیمات ضبط ذخیره شد';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'تنظیمات ذخیره نشد: $error';
  }

  @override
  String get adminSetChannelMappings => 'نگاشت کانال را تنظیم کنید';

  @override
  String get adminMappingJson => 'نقشه برداری JSON';

  @override
  String get adminMappingJsonHint => 'مثال: نگاشت محموله JSON';

  @override
  String get adminChannelMappingsUpdated => 'نگاشت کانال به روز شد';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'نقشه‌برداری‌ها به‌روزرسانی نشد: $error';
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
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'ارائه دهنده را اضافه کنید';

  @override
  String get adminNoListingProviders =>
      'هیچ ارائه دهنده فهرستی پیکربندی نشده است';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'مسیر ضبط: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'مسیر سری: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'پیش‌پرداخت: $minutes دقیقه';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'پست padding: $minutes دقیقه';
  }

  @override
  String get adminTunerDiscovery => 'کشف تیونر';

  @override
  String get adminChannelMappings => 'نقشه برداری کانال';

  @override
  String get adminNoDiscoveredTuners => 'هنوز هیچ تیونری کشف نشده است';

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
  String get adminRestoreRequested =>
      'بازیابی درخواست شد. راه اندازی مجدد سرور ممکن است این جلسه را قطع کند.';

  @override
  String get adminBackupsTitle => 'پشتیبان گیری';

  @override
  String get adminUnknownDate => 'تاریخ نامعلوم';

  @override
  String get adminUnnamedBackup => 'پشتیبان گیری بدون نام';

  @override
  String get adminLiveTvNotAvailable =>
      'مدیریت تلویزیون زنده در این ساخت سرور در دسترس نیست.';

  @override
  String get adminLiveTvTitle => 'مدیریت تلویزیون زنده';

  @override
  String get adminApply => 'درخواست کنید';

  @override
  String get adminNotSet => 'تنظیم نشده است';

  @override
  String get adminReset => 'بازنشانی کنید';

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
  String get adminMetadataIdentify => 'Identify';

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
  String get adminMetadataFieldTagline => 'شعار';

  @override
  String get adminMetadataFieldOverview => 'نمای کلی';

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
  String get adminMetadataRecursive => 'بازگشتی';

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
  String get adminPluginsNoSearchResults =>
      'هیچ افزونه ای با جستجوی شما مطابقت ندارد';

  @override
  String get adminPluginsNoneInstalled => 'هیچ پلاگینی نصب نشده است';

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
  String get adminReposRemove => 'حذف کنید';

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
  String get adminNetworkingRemoteAccess => 'دسترسی از راه دور را فعال کنید';

  @override
  String get adminNetworkingPorts => 'پورت ها';

  @override
  String get adminNetworkingHttpPort => 'پورت HTTP';

  @override
  String get adminNetworkingHttpsPort => 'پورت HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS را فعال کنید';

  @override
  String get adminNetworkingLocalNetwork => 'شبکه محلی';

  @override
  String get adminNetworkingLocalAddresses => 'آدرس شبکه های محلی';

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
  String get adminBrandingSplashUpload => 'Upload image';

  @override
  String get adminBrandingSplashUploaded => 'Splashscreen updated';

  @override
  String get adminBrandingSplashUploadFailed => 'Failed to upload splashscreen';

  @override
  String get adminBrandingSplashDeleted => 'Splashscreen removed';

  @override
  String get adminBrandingNoSplash => 'No custom splashscreen';

  @override
  String get adminPlaybackHwAccel => 'شتاب سخت افزاری';

  @override
  String get adminPlaybackHwAccelLabel => 'شتاب سخت افزاری';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'رمزگذاری سخت افزاری را فعال کنید';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'فعال کردن رمزگشایی سخت افزاری برای:';

  @override
  String get adminPlaybackQsvDevice => 'QSV device';

  @override
  String get adminPlaybackEnhancedNvdec => 'Enable enhanced NVDEC decoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Prefer system native hardware decoder';

  @override
  String get adminPlaybackColorDepth => 'Hardware decoding color depth';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC decoding';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 decoding';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-bit decoding';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit decoding';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardware encoding';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Allow HEVC encoding';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Allow AV1 encoding';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Enable Intel low-power H.264 encoder';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Enable Intel low-power HEVC encoder';

  @override
  String get adminPlaybackToneMapping => 'Tone Mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Enable tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Enable VPP tone mapping';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Enable VideoToolbox tone mapping';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Tone mapping algorithm';

  @override
  String get adminPlaybackTonemappingMode => 'Tone mapping mode';

  @override
  String get adminPlaybackTonemappingRange => 'Tone mapping range';

  @override
  String get adminPlaybackTonemappingDesat => 'Tone mapping desaturation';

  @override
  String get adminPlaybackTonemappingPeak => 'Tone mapping peak';

  @override
  String get adminPlaybackTonemappingParam => 'Tone mapping parameter';

  @override
  String get adminPlaybackPresetsQuality => 'Presets & Quality';

  @override
  String get adminPlaybackEncoderPreset => 'Encoder preset';

  @override
  String get adminPlaybackH264Crf => 'H.264 encoding CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) encoding CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deinterlace method';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Enable audio VBR encoding';

  @override
  String get adminPlaybackDownmixBoost => 'Audio downmix boost';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo downmix algorithm';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Max muxing queue size';

  @override
  String get adminPlaybackAutoOption => 'Auto';

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
  String get adminResumeMinAudiobookPct => 'حداقل درصد رزومه کتاب صوتی';

  @override
  String get adminResumeMaxAudiobookPct => 'حداکثر درصد رزومه کتاب صوتی';

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
  String get adminTaskStop => 'توقف کنید';

  @override
  String get adminRunningTasks => 'Running Tasks';

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
  String adminTaskTriggerInterval(String duration) {
    return 'هر $duration';
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
  String get adminTaskTriggerEvery6Hours => 'هر 6 ساعت';

  @override
  String get adminTaskTriggerEvery12Hours => 'هر 12 ساعت';

  @override
  String get adminTaskTriggerEvery24Hours => 'هر 24 ساعت';

  @override
  String get adminTaskTriggerEvery2Days => 'هر 2 روز';

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
  String get adminTaskTriggerTime => 'زمان';

  @override
  String get adminTaskTriggerNoLimit => 'بدون محدودیت';

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
      'تولید تصویر trickplay را برای ریز عکسهای پیش نمایش جستجو پیکربندی کنید.';

  @override
  String get adminNetworkingPublicHttpsPort => 'پورت عمومی HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'URL پایه';

  @override
  String get adminNetworkingBaseUrlHint => 'به عنوان مثال /ژله فین';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Public HTTP port';

  @override
  String get adminNetworkingRequireHttps => 'Require HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirect all remote requests to HTTPS. Has no effect if the server has no valid certificate.';

  @override
  String get adminNetworkingCertPassword => 'Certificate password';

  @override
  String get adminNetworkingIpSettings => 'IP Settings';

  @override
  String get adminNetworkingEnableIpv4 => 'Enable IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Enable IPv6';

  @override
  String get adminNetworkingAutoDiscovery => 'Enable automatic port mapping';

  @override
  String get adminNetworkingLocalSubnets => 'LAN networks';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Comma or line separated list of IP addresses or CIDR subnets treated as being on the local network.';

  @override
  String get adminNetworkingPublishedUris => 'Published server URIs';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Map a subnet or address to a published URL, e.g. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'مسیر گواهینامه';

  @override
  String get adminNetworkingRemoteIpFilter => 'فیلتر IP از راه دور';

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
  String get adminGeneralEnableSlowResponse => 'Enable slow response warnings';

  @override
  String get adminGeneralQuickConnect => 'Enable Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Paths';

  @override
  String get adminGeneralSectionPerformance => 'Performance';

  @override
  String get adminGeneralCachePath => 'مسیر کش';

  @override
  String get adminGeneralMetadataPath => 'مسیر فراداده';

  @override
  String get adminGeneralServerName => 'نام سرور';

  @override
  String get adminSettingsLoadFailed => 'تنظیمات بارگیری نشد';

  @override
  String get adminDiscover => 'کشف کنید';

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
  String get libraries => 'کتابخانه ها';

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
      other: '# participants',
      one: '# participant',
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
      other: '# rows discovered',
      one: '# row discovered',
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
  String get offlineBannerTitle => 'You\'re offline';

  @override
  String get offlineBannerSubtitle => 'Showing your downloads';

  @override
  String get offlineBannerAction => 'Downloads';

  @override
  String get serverUnreachableBannerTitle => 'Can\'t reach your server';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Playing from downloads until it\'s back';

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
  String get pinIncorrect => 'پین نادرست';

  @override
  String get pinMismatch => 'پین ها مطابقت ندارند';

  @override
  String get pinForgot => 'پین را فراموش کرده اید؟';

  @override
  String get pinClear => 'پاک کردن';

  @override
  String get pinBackspace => 'بک اسپیس';

  @override
  String get quickConnectAuthorized => 'درخواست اتصال سریع مجاز است.';

  @override
  String get quickConnectInvalidOrExpired =>
      'کد اتصال سریع نامعتبر یا منقضی شده است.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect در این سرور پشتیبانی نمی شود.';

  @override
  String get quickConnectAuthorizeFailed => 'کد اتصال سریع تأیید نشد.';

  @override
  String get quickConnectDisabled => 'اتصال سریع در این سرور غیرفعال است.';

  @override
  String get quickConnectForbidden =>
      'حساب شما نمی‌تواند این درخواست اتصال سریع را تأیید کند.';

  @override
  String get quickConnectNotFound =>
      'کد اتصال سریع پیدا نشد. یک کد جدید را امتحان کنید.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'اتصال سریع انجام نشد: $message';
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
  String get stillWatchingStop => 'توقف کنید';

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
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

  @override
  String get settingsAdministrationSubtitle =>
      'به پنل مدیریت سرور دسترسی پیدا کنید';

  @override
  String get settingsAccountSecurity => 'حساب و امنیت';

  @override
  String get settingsAccountSecuritySubtitle =>
      'احراز هویت، کد پین و کنترل‌های والدین';

  @override
  String get settingsPersonalization => 'شخصی سازی';

  @override
  String get settingsPersonalizationSubtitle =>
      'طرح زمینه، پیمایش، ردیف‌های اصلی و قابلیت مشاهده کتابخانه';

  @override
  String get settingsDynamicContent => 'محتوای پویا';

  @override
  String get settingsDynamicContentSubtitle => 'نوار رسانه و پوشش های بصری';

  @override
  String get settingsPlaybackSyncplay => 'پخش و SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'تنظیمات صوتی/تصویری، زیرنویس‌ها، دانلودها و کنترل‌های SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'همگام‌سازی پلاگین، Seerr، رتبه‌بندی‌ها و موارد دیگر';

  @override
  String get settingsAboutSubtitle => 'نسخه برنامه، اطلاعات حقوقی و اعتبار';

  @override
  String get settingsAuthenticationSection => 'احراز هویت';

  @override
  String get settingsSortServersBy => 'مرتب سازی سرورها بر اساس';

  @override
  String get settingsLastUsed => 'آخرین استفاده';

  @override
  String get settingsAlphabetical => 'حروف الفبا';

  @override
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => 'حریم خصوصی و ایمنی';

  @override
  String get settingsBlockedRatings => 'رتبه بندی های مسدود شده';

  @override
  String get settingsGeneralStyle => 'سبک عمومی';

  @override
  String get settingsGeneralStyleSubtitle =>
      'لهجه‌های تم، پس‌زمینه، شاخص‌های تماشا شده، و موسیقی تم';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

  @override
  String get settingsHomePage => 'صفحه اصلی';

  @override
  String get settingsHomePageSubtitle =>
      'بخش‌ها، انواع تصویر، پوشش‌ها و پیش‌نمایش رسانه‌ها';

  @override
  String get settingsLibrariesSubtitle =>
      'قابلیت مشاهده کتابخانه، نمای پوشه و رفتار چند سرور';

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
  String get settingsShowLibrariesButtonInNavigation =>
      'نمایش دکمه کتابخانه ها در نوار پیمایش';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

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
  String get settingsMetadataAndRatings => 'فراداده و رتبه بندی';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase ادغام‌های سمت سرور از جمله منابع رتبه‌بندی اضافی، درخواست‌های Seerr و اولویت‌های همگام‌سازی شده را تقویت می‌کند.';

  @override
  String get settingsOfflineDownloads => 'دانلودهای آفلاین';

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
  String get settingsPoweredByFlutter => 'پشتیبانی شده توسط فلاتر';

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
  String get settingsBoth => 'هر دو';

  @override
  String get settingsShuffleContentTypeFilter =>
      'فیلتر نوع محتوا را به هم بزنید';

  @override
  String get settingsVideoPlaybackPreferences => 'تنظیمات پخش ویدیو';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'موتور اصلی ویدیو و تنظیمات کیفیت پخش';

  @override
  String get settingsAudioPreferences => 'تنظیمات صوتی';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'آهنگ های صوتی، پردازش، و گزینه های عبور';

  @override
  String get settingsAutomationAndQueue => 'اتوماسیون و صف';

  @override
  String get settingsAutomationAndQueueSubtitle => 'پخش و توالی خودکار';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'کیفیت دانلود، محدودیت های فضای ذخیره سازی، و اندازه صف';

  @override
  String get settingsSyncplaySubtitle => 'منطق همگام سازی برای جلسات گروهی';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'ویژگی های پخش کننده تخصصی با احتیاط استفاده کنید، زیرا برخی از گزینه ها ممکن است باعث مشکلات پخش شوند';

  @override
  String get settingsSkipIntrosAndOutros => 'از معرفی و برون رفت بگذرید؟';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (میراث)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (میراث)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (توصیه می‌شود)';

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
    return '$value ms';
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
    return '';
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
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

  @override
  String get mapDolbyVisionP7Title => 'نمایه 7 Dolby Vision را به HEVC نگاشت';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'پخش Dolby Vision نمایه ۷ پخش جریانی به‌عنوان HDR10-سازگار HEVC در دستگاه‌های غیر DV.';

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
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

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
  String get themeStore => '';

  @override
  String get themeStoreSubtitle => '';

  @override
  String get themeStoreDescription => '';

  @override
  String get themeStoreEmpty => '';

  @override
  String get themeStoreLoadFailed => '';

  @override
  String get themeStoreSave => '';

  @override
  String get themeStoreSaveAndApply => '';

  @override
  String get themeStoreSaved => '';

  @override
  String get themeStoreInvalidMessage => '';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '';
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
  String get homeRowDisplay => '';

  @override
  String get homeRowSections => '';

  @override
  String get homeRowToggles => '';

  @override
  String get homeRowTogglesSubtitle => '';

  @override
  String get homeRowTogglesDescription => '';

  @override
  String get rowsType => 'نوع ردیف';

  @override
  String get rowsTypeDescription =>
      'کلاسیک نوع تصویر هر ردیف و همپوشانی اطلاعات را حفظ می کند. مدرن از ردیف های پرتره به پس زمینه استفاده می کند.';

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
  String get genresRowItems => 'ژانر موارد ردیف';

  @override
  String get genresRowItemsDescription =>
      'نمایش فیلم، سریال یا هر دو در ردیف‌های ژانر.';

  @override
  String get displayPlaylistsRows => '';

  @override
  String get displayPlaylistsRowsSubtitle => '';

  @override
  String get playlistsRowSorting => '';

  @override
  String get playlistsRowSortingDescription => '';

  @override
  String get displayAudioRows => '';

  @override
  String get displayAudioRowsSubtitle => '';

  @override
  String get audioRowsSorting => '';

  @override
  String get audioRowsSortingDescription => '';

  @override
  String get audioPlaylists => '';

  @override
  String get appearance => 'ظاهر';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Theme';

  @override
  String get keyboard => 'Keyboard';

  @override
  String get navButtons => 'Buttons';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'MPV configuration';

  @override
  String get cardSize => 'اندازه کارت';

  @override
  String get externalPlayerApp => 'برنامه پخش خارجی';

  @override
  String get externalPlayerAppDescription => '';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'نمایش انتخابگر برنامه هنگام شروع پخش.';

  @override
  String get loadingInstalledPlayers =>
      'در حال بارگیری پخش کننده های نصب شده...';

  @override
  String get connection => 'اتصال';

  @override
  String get audioTranscodeTarget => 'هدف رمز عبور صوتی';

  @override
  String get passthrough => 'عبور';

  @override
  String get supportedOnThisDevice => 'در این دستگاه پشتیبانی می شود';

  @override
  String get notSupportedOnThisDevice => 'در این دستگاه پشتیبانی نمی شود';

  @override
  String get settingsAudioDtsXPassthrough => 'عبور DTS:X (DTS UHD).';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'بیت استریم DTS:X (DTS UHD) به رسیور خارجی.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD با Atmos (JOC) Passthrough';

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
  String get useExternalPlayer => 'از پخش کننده خارجی استفاده کنید';

  @override
  String get useExternalPlayerSubtitle =>
      'پخش ویدیو را در برنامه خارجی انتخابی خود در Android TV باز کنید.';

  @override
  String get automaticQueuing => 'صف بندی خودکار';

  @override
  String get preferSdhSubtitles => 'زیرنویس SDH را ترجیح دهید';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'هنگام انتخاب خودکار، آهنگ‌های زیرنویس SDH/CC را اولویت‌بندی کنید.';

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
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'با گروه تماشا کنید';

  @override
  String get errors => 'خطاها';

  @override
  String get warnings => 'هشدارها';

  @override
  String get disk => 'دیسک';

  @override
  String get openInBrowser => 'در مرورگر باز کنید';

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
  String get passwordSet => 'مجموعه رمز عبور';

  @override
  String get noPasswordConfigured => 'هیچ رمز عبوری پیکربندی نشده است';

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
      other: '$count Libraries',
      one: '1 Library',
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
  String get adminDrawerSectionServer => 'سرور';

  @override
  String get adminDrawerSectionPlayback => 'پخش';

  @override
  String get adminDrawerSectionDevices => 'دستگاه ها';

  @override
  String get adminDrawerSectionAdvanced => 'پیشرفته';

  @override
  String get adminDrawerSectionPlugins => 'پلاگین ها';

  @override
  String get adminDrawerSectionLiveTv => 'تلویزیون زنده';

  @override
  String get homeVideos => 'فیلم های خانگی';

  @override
  String get mixedContent => 'محتوای ترکیبی';

  @override
  String get homeVideosAndPhotos => 'فیلم ها و عکس های صفحه اصلی';

  @override
  String get mixedMoviesAndShows => 'فیلم‌ها و نمایش‌های ترکیبی';

  @override
  String get intelQuickSync => 'همگام سازی سریع اینتل';

  @override
  String get rockchipMpp => 'Rockchip MPP';

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
  String get closeGenrePanel => 'پانل ژانر را ببندید';

  @override
  String get loadingShuffle => 'در حال بارگیری ترکیبی...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'سوئیچینگ خودکار HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'به طور خودکار HDR را برای پخش ویدیوی HDR فعال کنید و حالت نمایش را در هنگام خروج بازیابی کنید.';

  @override
  String get whenFullscreen => 'وقتی تمام صفحه';

  @override
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'محدودیت های رمزگذاری';

  @override
  String get clearAllArtworkButton => '';

  @override
  String get clearAllArtworkWarning => '';

  @override
  String get confirmClear => '';

  @override
  String confirmClearMessage(String itemType) {
    return '';
  }

  @override
  String get uploadButton => '';

  @override
  String get resolutionLabel => '';

  @override
  String get onlyShowInterfaceLanguage => '';

  @override
  String get confirmClearAll => '';

  @override
  String get imageUploadSuccess => '';

  @override
  String imageUploadFailed(String error) {
    return '';
  }

  @override
  String imageDownloadFailed(String error) {
    return '';
  }

  @override
  String imageDeleteFailed(String error) {
    return '';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return '';
  }

  @override
  String get yes => '';

  @override
  String get posterCategory => '';

  @override
  String get backdropsCategory => '';

  @override
  String get bannerCategory => '';

  @override
  String get logoCategory => '';

  @override
  String get thumbnailCategory => '';

  @override
  String get artCategory => '';

  @override
  String get discArtCategory => '';

  @override
  String get screenshotCategory => '';

  @override
  String get boxCoverCategory => '';

  @override
  String get boxRearCoverCategory => '';

  @override
  String get menuArtCategory => '';

  @override
  String get confirmItemPoster => '';

  @override
  String get confirmItemBackdrop => '';

  @override
  String get confirmItemBanner => '';

  @override
  String get confirmItemLogo => '';

  @override
  String get confirmItemThumbnail => '';

  @override
  String get confirmItemArt => '';

  @override
  String get confirmItemDiscArt => '';

  @override
  String get confirmItemScreenshot => '';

  @override
  String get confirmItemBoxCover => '';

  @override
  String get confirmItemBoxRearCover => '';

  @override
  String get confirmItemMenuArt => '';

  @override
  String get resolutionAll => '';

  @override
  String get resolutionHigh => '';

  @override
  String get resolutionMedium => '';

  @override
  String get resolutionLow => '';

  @override
  String get sources => '';

  @override
  String get audiobookChapters => 'Chapters';

  @override
  String get audiobookBookmarks => 'Bookmarks';

  @override
  String get audiobookNotes => 'Notes';

  @override
  String get audiobookQueue => 'Queue';

  @override
  String get audiobookTimeline => 'Timeline';

  @override
  String get audiobookTimelineEmpty => 'Timeline is empty';

  @override
  String get audiobookWholeBook => 'Whole Book';

  @override
  String get audiobookFocusedTimeline => 'Focused Timeline';

  @override
  String get audiobookExportBookmarks => 'Export Bookmarks';

  @override
  String get audiobookExportNotes => 'Export Notes';

  @override
  String get audiobookExportAll => 'Export All';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exported to $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String get audiobookLyrics => 'Lyrics';

  @override
  String get audiobookAddBookmark => 'Add bookmark';

  @override
  String get audiobookAddNote => 'Add note';

  @override
  String get audiobookEditNote => 'Edit note';

  @override
  String get audiobookNoteHint => 'Write a note for this moment';

  @override
  String get audiobookSleepTimer => 'Sleep timer';

  @override
  String get audiobookSleepOff => 'Off';

  @override
  String get audiobookSleepEndOfChapter => 'End of chapter';

  @override
  String get audiobookSleepCustom => 'Custom';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining left';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Playback speed';

  @override
  String get audiobookRemainingTime => 'Remaining';

  @override
  String get audiobookElapsedTime => 'Elapsed';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Back ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Forward ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Previous chapter';

  @override
  String get audiobookNextChapter => 'Next chapter';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Chapter $current of $total';
  }

  @override
  String get audiobookNoChapters => 'No chapters';

  @override
  String get audiobookNoBookmarks => 'No bookmarks yet';

  @override
  String get audiobookNoNotes => 'No notes yet';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Bookmark added at $position';
  }

  @override
  String get audiobookSpeedReset => 'Reset to 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Save';

  @override
  String get audiobookCancel => 'Cancel';

  @override
  String get audiobookDelete => 'Delete';

  @override
  String get subtitlePreferences => '';

  @override
  String get subtitlePreferencesDescription => '';

  @override
  String get subtitleRendering => '';

  @override
  String get displayOptions => '';

  @override
  String get releaseDateAscending => '';

  @override
  String get releaseDateDescending => '';

  @override
  String get groupContributions => '';

  @override
  String get groupMultipleRoles => '';

  @override
  String get libraryWriteAccessWarningTitle => '';

  @override
  String get libraryWriteAccessHowToFix => '';

  @override
  String get libraryWriteAccessFixSteps => '';

  @override
  String get dismiss => '';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '';
  }

  @override
  String get libraryWriteAccessReactiveBody => '';

  @override
  String get externalLists => 'External Lists';

  @override
  String get replay => 'Replay';

  @override
  String get fileInformation => 'File Information';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Size: $size  •  Format: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Show All ($count) Audio Tracks';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Show All ($count) Subtitle Tracks';
  }

  @override
  String get checkingDirectPlay => 'Checking Direct Play capability...';

  @override
  String get directPlayCapabilityLabel => 'Direct Play Capability: ';

  @override
  String get forced => 'Forced';

  @override
  String get transcodeContainerNotSupported =>
      'Container format is not supported by the player.';

  @override
  String get transcodeVideoCodecNotSupported => 'Video codec is not supported.';

  @override
  String get transcodeAudioCodecNotSupported => 'Audio codec is not supported.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Subtitle format is not supported (requires burning).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Audio profile is not supported.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Video profile is not supported.';

  @override
  String get transcodeVideoLevelNotSupported => 'Video level is not supported.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Video resolution is not supported by this device.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Video bit depth is not supported.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Video framerate is not supported.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'File bitrate exceeds player streaming limit.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Video bitrate exceeds streaming limit.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Audio bitrate exceeds streaming limit.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Number of audio channels is not supported.';

  @override
  String get sortAlphabetical => 'Alphabetical';

  @override
  String get sortReleaseAscending => 'Release Order (Ascending)';

  @override
  String get sortReleaseDescending => 'Release Order (Descending)';

  @override
  String get sortCustomDragDrop => 'Custom (Drag-and-Drop)';

  @override
  String get playlistSortOptions => 'Playlist Sort Options';

  @override
  String get resetSort => 'Reset Sort';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Rewatch S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Rewatch Playlist';

  @override
  String get noSubtitlesFound => 'No subtitles found.';

  @override
  String get adminControls => 'Admin Controls';

  @override
  String get impellerRendering => 'Rendering engine (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller is Flutter\'s modern GPU renderer for smoother animations and less stutter. On some TV boxes and older GPUs it can cause glitches or black video; switch it Off if you see those. Automatic picks the best default for your device. Restart Moonfin to apply.';

  @override
  String get impellerAuto => 'Automatic';

  @override
  String get impellerOn => 'On';

  @override
  String get impellerOff => 'Off';

  @override
  String get impellerRestartTitle => 'Restart required';

  @override
  String get impellerRestartMessage =>
      'Moonfin needs to restart to change the rendering engine. Close the app now, then reopen it to apply.';

  @override
  String get impellerCloseNow => 'Close app now';

  @override
  String get adminRefreshLibrary => 'Refresh Library';

  @override
  String get adminRefreshAllLibraries => 'Refresh All Libraries';

  @override
  String get adminRepoSortDateOldest => 'Date Added (Oldest First)';

  @override
  String get adminRepoSortDateNewest => 'Date Added (Newest First)';

  @override
  String get adminRepoSortNameAsc => 'Alphabetical (A to Z)';

  @override
  String get adminRepoSortNameDesc => 'Alphabetical (Z to A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Loading Server Analytics... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Match source';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 Movies';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 TV Shows';

  @override
  String get imdbMostPopularMovies => 'IMDb Most Popular Movies';

  @override
  String get imdbMostPopularTvShows => 'IMDb Most Popular TV Shows';

  @override
  String get imdbLowestRatedMovies => 'IMDb Lowest Rated Movies';

  @override
  String get imdbTopEnglishMovies => 'IMDb Top Rated English Movies';
}
