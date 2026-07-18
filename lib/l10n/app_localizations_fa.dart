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
  String get accountPreferences => 'ترجیحات حساب';

  @override
  String get interfaceLanguage => 'زبان رابط کاربری';

  @override
  String get systemLanguageDefault => 'پیش‌فرض سیستم';

  @override
  String get signIn => 'وارد شوید';

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
  String get waitingForAuthorization => 'در انتظار مجوز...';

  @override
  String get back => 'بازگشت';

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
  String get glassQuality => 'کیفیت شیشه';

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
  String get settingsAppearanceThemeSubtitle =>
      'جابه‌جایی بین Moonfin و Neon Pulse بدون راه‌اندازی مجدد برنامه';

  @override
  String get customThemeTitle => 'تم سفارشی';

  @override
  String get customThemeSubtitle =>
      'تم‌های سفارشی عناصر بصری را در سراسر Moonfin تغییر می‌دهند. یکی از این گزینه‌ها را متناسب با سلیقه خود انتخاب کنید.';

  @override
  String get keyboardPreferSystemIme => 'صفحه کلید سیستم را ترجیح دهید';

  @override
  String get keyboardPreferSystemImeDescription =>
      'از روش ورودی دستگاه خود به طور پیش فرض برای وارد کردن متن استفاده کنید';

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
  String get gameEmulatorSettings => 'تنظیمات شبیه‌ساز';

  @override
  String get gameNoCoreOptions => 'این هسته گزینه قابل تنظیمی ندارد.';

  @override
  String get gameHoldToOpenMenu => 'برای باز کردن منو نگه دارید';

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
  String get apply => 'اعمال';

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
  String channelsCount(int count) {
    return '$count کانال';
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
  String get reset => 'بازنشانی';

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
  String get codec => 'کدک';

  @override
  String get videoBitrate => 'میزان بیت ویدیو';

  @override
  String get track => 'قطعه';

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
  String get cancelRecordingAction => 'لغو ضبط';

  @override
  String get programSetToRecord => 'برنامه تنظیم شده برای ضبط';

  @override
  String get recordingCancelled => 'ضبط لغو شد';

  @override
  String get unableToCreateRecording => 'امکان ایجاد ضبط وجود ندارد';

  @override
  String get watch => 'تماشا';

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
      'صفحات جزئیات، ردیف‌های صفحه اصلی و صدا';

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
  String get stretch => 'کشش';

  @override
  String get refreshRateSwitching => 'تغییر نرخ تازه سازی';

  @override
  String get disabled => 'غیرفعال';

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
  String get transcodingAudio => 'ترنسکد (صدا)';

  @override
  String get directStreamRemux => 'پخش مستقیم (Remux)';

  @override
  String get transcodingBitrateOrResolution => 'ترنسکد (نرخ بیت یا وضوح)';

  @override
  String get transcodingVideoAndAudio => 'ترنسکد (ویدیو و صدا)';

  @override
  String get transcodingVideo => 'ترنسکد (ویدیو)';

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
  String get enableTrueHdAudio =>
      'صدای TrueHD را فعال کنید (ممکن است در همه پلتفرم ها کار نکند)';

  @override
  String get settingsAudioOutputMode => 'حالت خروجی صدا';

  @override
  String get settingsAudioOutputModeDescription =>
      'انتخاب کنید صدا چگونه رمزگشایی شود. عبور مستقیم AVR جریان‌های خام Dolby/DTS را به گیرنده شما می‌فرستد؛ خودکار یا داون‌میکس به‌صورت محلی رمزگشایی می‌کند.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'عبور مستقیم AVR';

  @override
  String get settingsAudioFallbackCodec => 'کدک بازگشتی صوتی';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'قالب مقصد را برای ترنسکد صدای چندکاناله انتخاب کنید؛ زمانی که جریان منبع قابل پخش مستقیم یا عبور مستقیم نیست.';

  @override
  String get settingsAudioFallbackCodecAuto => 'تشخیص خودکار\n(توصیه‌شده)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(پیش‌فرض)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(بدون افت کیفیت)';

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
  String get settingsAudioEac3JocPassthrough => 'عبور مستقیم EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough => 'عبور مستقیم DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'عبور مستقیم DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'عبور مستقیم TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'عبور مستقیم TrueHD Atmos';

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
  String get settingsAudioRouteHeadphones => 'هدفون';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count کانال PCM';
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
      'پشتیبانی از صدای HD در مسیر خروجی';

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
  String get enableFolderView => 'نمای پوشه را فعال کنید';

  @override
  String get showFolderBrowsingOption => 'نمایش گزینه مرور پوشه';

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
  String get mediaBarModeMoonfin => 'Moonfin';

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
  String get trailerAudio => 'صدای تریلر';

  @override
  String get enableTrailerAudio => 'فعال کردن صدا برای تریلرها در نوار رسانه';

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
  String get fullScreenRows => 'ردیف‌های گسترده صفحه اصلی';

  @override
  String get fullScreenRowsDescription =>
      'محدود کردن ردیف‌های صفحه اصلی به 1 ردیف در هر صفحه';

  @override
  String get perRowImageType => 'نوع تصویر در هر ردیف';

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
  String get clockModeStatic => 'ثابت';

  @override
  String get clockModeBouncing => 'متحرک';

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
  String get pluginLabel => 'افزونه Moonbase';

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
  String get seerrDiscoveryRows => 'ردیف‌های کشف Seerr';

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
  String get direct => 'مستقیم';

  @override
  String get adminDisconnect => 'قطع کن';

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
  String get adminLibArchiveMediaFiles =>
      'در نظر گرفتن آرشیوها به‌عنوان فایل رسانه';

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
  String get adminEnabledDevices => 'دستگاه‌های فعال';

  @override
  String get adminEnabledChannels => 'کانال‌های فعال';

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
  String get adminBackupInclude =>
      'انتخاب کنید چه چیزی در پشتیبان گنجانده شود.';

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
  String get adminRefreshMetadata => 'به‌روزرسانی فراداده';

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
  String get adminEditTuner => 'ویرایش تیونر';

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
  String get adminEditProvider => 'ویرایش ارائه‌دهنده';

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
  String get adminSdGetListings => 'دریافت فهرست برنامه‌ها';

  @override
  String get adminSdListings => 'فهرست برنامه‌ها';

  @override
  String get adminEnableAllTuners => 'فعال کردن همه تیونرها';

  @override
  String get adminTunerType => 'نوع تیونر';

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
      'این نوع تیونر از بازنشانی پشتیبانی نمی‌کند.';

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
  String get adminMovieRecordingPath => 'مسیر ضبط فیلم';

  @override
  String get adminGuideDays => 'روزهای داده راهنما';

  @override
  String get adminGuideDaysAuto => 'خودکار';

  @override
  String adminGuideDaysValue(int days) {
    return '$days روز';
  }

  @override
  String get adminRecordingPostProcessor => 'مسیر برنامه پس‌پردازش';

  @override
  String get adminRecordingPostProcessorArgs => 'آرگومان‌های پس‌پردازنده';

  @override
  String get adminSaveRecordingNfo => 'ذخیره فراداده NFO ضبط';

  @override
  String get adminSaveRecordingImages => 'ذخیره تصاویر ضبط';

  @override
  String get adminLiveTvSectionTiming => 'زمان‌بندی';

  @override
  String get adminLiveTvSectionPaths => 'مسیرهای ضبط';

  @override
  String get adminLiveTvSectionPostProcessing => 'پس‌پردازش';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'داده راهنما: $value';
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
  String get adminRefreshGuideData => 'به‌روزرسانی داده راهنما';

  @override
  String get adminGuideRefreshStarted => 'به‌روزرسانی داده راهنما آغاز شد';

  @override
  String get adminGuideRefreshUnavailable =>
      'وظیفه به‌روزرسانی راهنما در این سرور در دسترس نیست.';

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
  String get adminApply => 'اعمال';

  @override
  String get adminNotSet => 'تنظیم نشده است';

  @override
  String get adminReset => 'بازنشانی';

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
  String get adminPlaybackEnableHwDecoding =>
      'فعال کردن رمزگشایی سخت افزاری برای:';

  @override
  String get adminPlaybackQsvDevice => 'دستگاه QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'فعال کردن رمزگشای پیشرفته NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'ترجیح رمزگشای سخت‌افزاری بومی سیستم';

  @override
  String get adminPlaybackColorDepth => 'عمق رنگ رمزگشایی سخت‌افزاری';

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
  String get adminPlaybackPresetsQuality => 'پیش‌تنظیم‌ها و کیفیت';

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
      other: '$count ساعت',
      one: '1 ساعت',
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
  String get adminNetworkingHttps => 'HTTPS';

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
  String get adminNetworkingIpSettings => 'تنظیمات IP';

  @override
  String get adminNetworkingEnableIpv4 => 'فعال کردن IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'فعال کردن IPv6';

  @override
  String get adminNetworkingAutoDiscovery => 'فعال کردن نگاشت خودکار پورت';

  @override
  String get adminNetworkingLocalSubnets => 'شبکه‌های LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'فهرست آدرس‌های IP یا زیرشبکه‌های CIDR که به‌عنوان شبکه محلی در نظر گرفته می‌شوند، جداشده با کاما یا خط جدید.';

  @override
  String get adminNetworkingPublishedUris => 'URIهای منتشرشده سرور';

  @override
  String get adminNetworkingPublishedUriHint =>
      'یک زیرشبکه یا آدرس را به یک URL منتشرشده نگاشت کنید، مثلاً all=https://example.com';

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
  String get offlineBannerAction => 'دانلودها';

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
  String get settingsConnectionSection => 'اتصال';

  @override
  String get settingsAllowSelfSignedCerts => 'اجازه گواهی‌های خودامضا';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'به سرورهایی که از گواهی‌های TLS خودامضا یا CA خصوصی استفاده می‌کنند اعتماد کنید. فقط برای سرورهایی که خودتان کنترل می‌کنید فعال کنید. این کار اعتبارسنجی گواهی را برای همه اتصال‌ها غیرفعال می‌کند.';

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
  String get settingsDetailsScreen => 'صفحه جزئیات';

  @override
  String get settingsDetailsScreenSubtitle =>
      'سبک، محوشدگی پس‌زمینه و رفتار برگه‌ها';

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
      other: '# اعلان مجوز',
      one: '# اعلان مجوز',
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
  String get settingsMediaSegmentCountdown => 'شمارش معکوس بخش رسانه';

  @override
  String get settingsProgressBar => 'نوار پیشرفت';

  @override
  String get settingsTimer => 'زمان‌شمار';

  @override
  String get settingsNone => 'هیچ‌کدام';

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
  String get hideBackdropsInLibraries => 'پنهان کردن پس‌زمینه‌ها هنگام مرور؟';

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
  String get homeRowDisplay => 'نمایش ردیف‌های صفحه اصلی';

  @override
  String get homeRowSections => 'بخش‌های ردیف صفحه اصلی';

  @override
  String get homeRowToggles => 'کلیدهای ردیف صفحه اصلی';

  @override
  String get homeRowTogglesSubtitle =>
      'فعال یا غیرفعال کردن دسته‌بندی‌های ردیف صفحه اصلی مبتنی بر کتابخانه';

  @override
  String get homeRowTogglesDescription =>
      'کلیدهای زیر را فعال کنید تا ردیف‌ها در بخش‌های صفحه اصلی نمایش داده شوند.';

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
  String get crewContributionsSeerr => 'مشارکت‌های عوامل (Seerr)';

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
  String get intelQuickSync => 'Intel Quick Sync';

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
  String get transcodingLimits => 'محدودیت های رمزگذاری';

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
  String get audiobookWholeBook => 'کل کتاب';

  @override
  String get audiobookFocusedTimeline => 'خط زمانی متمرکز';

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
  String get subtitlePreferences => 'ترجیحات زیرنویس';

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
  String get externalLists => 'فهرست‌های خارجی';

  @override
  String get replay => 'پخش دوباره';

  @override
  String get fileInformation => 'اطلاعات فایل';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'اندازه: $size  •  قالب: $format';
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
  String get sortAlphabetical => 'الفبایی';

  @override
  String get sortReleaseAscending => 'ترتیب انتشار (صعودی)';

  @override
  String get sortReleaseDescending => 'ترتیب انتشار (نزولی)';

  @override
  String get sortCustomDragDrop => 'سفارشی (کشیدن و رها کردن)';

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
}
