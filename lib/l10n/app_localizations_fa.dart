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
  String get signIn => 'وارد شوید';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
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
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'چه کسی تماشا می کند؟';

  @override
  String get addUser => 'افزودن کاربر';

  @override
  String get selectServer => 'سرور را انتخاب کنید';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
  String get embyConnect => 'Emby اتصال';

  @override
  String get removeServer => 'سرور را حذف کنید';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
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
      'Moonfin نمی تواند به کلید سیستم شما دسترسی پیدا کند. ورود به سیستم می‌تواند ادامه یابد، اما ذخیره رمز ایمن ممکن است تا زمانی که قفل کلید باز نشود، در دسترس نباشد.';

  @override
  String get ok => 'باشه';

  @override
  String get settingsAppearanceTheme => 'تم برنامه';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'بدون راه‌اندازی مجدد برنامه، بین Moonfin و Neon Pulse جابه‌جا شوید';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'باله ماه';

  @override
  String get themeMoonfinSubtitle =>
      'ظاهر فعلی Moonfin که همه شما عاشق آن شده اید';

  @override
  String get themeNeonPulse => 'نئون پالس';

  @override
  String get themeNeonPulseSubtitle =>
      'استایل سینت ویو با درخشش سرخابی، متن فیروزه‌ای و کنتراست کروم قوی‌تر';

  @override
  String get embyConnectSignInSubtitle => 'با حساب Emby Connect خود وارد شوید';

  @override
  String get emailOrUsername => 'ایمیل یا نام کاربری';

  @override
  String get selectAServer => 'یک سرور را انتخاب کنید';

  @override
  String get tryAgain => 'دوباره امتحان کنید';

  @override
  String get noLinkedServers =>
      'هیچ سروری به این حساب Emby Connect پیوند داده نشده است';

  @override
  String get invalidEmbyConnectCredentials =>
      'اعتبارنامه Emby Connect نامعتبر است';

  @override
  String get invalidEmbyConnectLogin =>
      'نام کاربری یا رمز عبور Emby Connect نامعتبر است';

  @override
  String get embyConnectExchangeNotSupported =>
      'سرور از تبادل Emby Connect پشتیبانی نمی کند';

  @override
  String get embyConnectNetworkError =>
      'خطای شبکه هنگام تماس با Emby Connect یا سرور انتخاب شده';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'از Moonfin خارج شوید؟';

  @override
  String get exitAppConfirmation => 'آیا مطمئن هستید که می خواهید خارج شوید؟';

  @override
  String get exit => 'خارج شوید';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'این پوشه خالی است';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
    return '$name — Genres';
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
    return '${count}m ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String daysAgo(int count) {
    return '${count}d ago';
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
  String get librivoxDescription => 'عناوین عمومی محبوب از LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
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
    return '$count authors';
  }

  @override
  String genresCount(int count) {
    return '$count genres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% completed';
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
    return '$count titles arranged for reading-first browsing.';
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
    return 'No $label found';
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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'در حال حاضر نمی توان این موضوع را بارگیری کرد.';

  @override
  String get audiobookDetails => 'جزئیات کتاب صوتی';

  @override
  String authorsCountTitle(int count) {
    return '$count Authors';
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
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
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
    return 'Ends at $time';
  }

  @override
  String get view => 'مشاهده کنید';

  @override
  String get resumeReading => 'Resume Reading';

  @override
  String get read => 'بخوانید';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
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
    return 'Delete downloaded tracks for \"$title\"?';
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
    return 'No $itemLabel loaded';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Downloading $title ($count items)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Are you sure you want to delete \"$name\" from the server? This action cannot be undone.';
  }

  @override
  String get itemDeleted => 'مورد حذف شد';

  @override
  String get noPlayableTrailerFound => 'تریلر قابل پخش یافت نشد.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'زیرنویس دانلود شد ممکن است زمانی که Jellyfin مورد را تازه می کند ظاهر شود.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'نسخه را انتخاب کنید';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'حذف فایل های دانلود شده';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'نویسندگان';

  @override
  String get studio => 'استودیو';

  @override
  String studioMoreCount(int count) {
    return '+$count more';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episodes';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Episode $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Chapter $number';
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
    return 'Born $date';
  }

  @override
  String died(String date) {
    return 'Died $date';
  }

  @override
  String age(int age) {
    return 'Age $age';
  }

  @override
  String get showLess => 'نمایش کمتر';

  @override
  String get readMore => 'ادامه مطلب';

  @override
  String get shuffle => 'مخلوط کردن';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
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
    return 'Remote subtitle $action requires the Jellyfin subtitle management permission for this user.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'This item could not be found on the server for remote subtitle $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Remote subtitle $action failed: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Remote subtitle $action failed (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Failed to $action remote subtitles.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'all downloaded episodes for \"$name\"';
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
    return '$label action failed: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Failed to set cast volume: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Controls';
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
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'صف خالی است';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'پخش از راه دور';

  @override
  String get castingToGoogleCast => 'ارسال به Google Cast';

  @override
  String get castingViaAirPlay => 'ارسال محتوا از طریق AirPlay';

  @override
  String get castingViaDlna => 'ارسال از طریق DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
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
    return '$mbps Mbps';
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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'رندر درون‌برنامه‌ای EPUB هنوز در این پلتفرم در دسترس نیست.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'ارائه سند جاسازی شده در این پلت فرم در دسترس نیست.';

  @override
  String get couldNotOpenExternalViewer => 'نمایشگر خارجی باز نشد.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Failed to open in-app reader: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Bookmark already saved at $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Bookmark added: $label';
  }

  @override
  String get noBookmarksYet =>
      'هنوز هیچ نشانکی وجود ندارد.\nهنگام خواندن روی نماد نشانک ضربه بزنید تا موقعیت خود را ذخیره کنید.';

  @override
  String get noTableOfContentsAvailable => 'فهرست مطالب موجود نیست';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'موقعیت';

  @override
  String get bookReader => 'کتابخوان';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'کانالی پیدا نشد';

  @override
  String get liveBadge => 'زنده';

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
  String get record => 'Record';

  @override
  String get cancelRecordingAction => 'Cancel Recording';

  @override
  String get programSetToRecord => 'Program set to record';

  @override
  String get recordingCancelled => 'Recording cancelled';

  @override
  String get unableToCreateRecording => 'Unable to create recording';

  @override
  String get watch => 'تماشا کنید';

  @override
  String get close => 'بستن';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
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
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'ضبط سریال لغو نشد';

  @override
  String get searchThisLibrary => 'جستجو در این کتابخانه...';

  @override
  String get searchEllipsis => 'جستجو...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'بیننده';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'آلبوم';

  @override
  String get playAlbum => 'پخش آلبوم';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
    return 'Remove \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Episode $number';
  }

  @override
  String get seriesNotFound => 'سریال پیدا نشد';

  @override
  String get errorLoadingSeries => 'خطا در بارگیری سری';

  @override
  String get downloadedEpisodes => 'قسمت های دانلود شده';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
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
    return 'Delete all downloaded episodes in $season?';
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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'موسیقی و کتاب های صوتی';

  @override
  String get images => 'تصاویر';

  @override
  String get database => 'پایگاه داده';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'موسیقی تم در ردیف‌های صفحه اصلی';

  @override
  String get playWhenBrowsingHomeScreen => 'هنگام مرور صفحه اصلی بازی کنید';

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
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

  @override
  String get settingsAudioFallbackAacStereo => 'AAC Stereo';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Advanced)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Enable only formats your AVR or HDMI sink supports.';

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
      'Bitstream Dolby Digital Plus (EAC3) to external decoder.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos over EAC3 (JOC) to external decoder.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (includes DTS core) to external decoder.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD with Atmos metadata to external decoder.';

  @override
  String get settingsDetectedAudioCapabilities => 'Detected Audio Capabilities';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'No runtime capability snapshot available yet.';

  @override
  String get settingsAudioRouteLabel => 'Route';

  @override
  String get settingsAudioDecodeLabel => 'Decode';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD audio route';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Speaker';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostics';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Video Level';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Video Range';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Subtitle Codec';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Allowed Audio Codecs';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS Audio Codecs';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 Audio Codecs';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Active Audio Route';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Route HD Audio Support';

  @override
  String get nightMode => 'حالت شب';

  @override
  String get compressDynamicRange => 'فشرده سازی محدوده دینامیکی';

  @override
  String get advancedMpv => 'mpv پیشرفته';

  @override
  String get enableCustomMpvConf => 'سفارشی mpv.conf را فعال کنید';

  @override
  String get applyMpvConfBeforePlayback =>
      'قبل از شروع پخش، یک mpv.conf مشخص شده توسط کاربر اعمال کنید';

  @override
  String get unsafeAdvancedMpvOptions => 'گزینه های پیشرفته mpv ناامن';

  @override
  String get unsafeMpvOptionsDescription =>
      'به مجموعه وسیع تری از گزینه های mpv اجازه دهید. ممکن است رفتار پخش را خراب کند.';

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
    return 'After $episodes episodes / ${hours}h';
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
  String get customMpvConfPath => 'مسیر mpv.conf سفارشی';

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
    return 'Loaded $profile profile settings.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Failed to load $profile profile settings.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Synced local settings to $profile profile.';
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
      'دانلودها/Moonfin - قابل مشاهده برای سایر برنامه ها';

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
  String get libraryVisibility => 'قابلیت مشاهده کتابخانه';

  @override
  String get libraryVisibilityDescription =>
      'قابلیت مشاهده صفحه اصلی در هر کتابخانه را تغییر دهید. برای اعمال تغییرات، Moonfin را مجددا راه اندازی کنید.';

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
    return '$count selected';
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
      'بین Moonfin، MakD انتخاب کنید یا نوار رسانه را خاموش کنید';

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
  String get perRowImageType => 'نوع تصویر در هر ردیف';

  @override
  String get perRowSettings => 'تنظیمات هر ردیف';

  @override
  String get autoLogin => 'ورود خودکار';

  @override
  String get lastUser => 'آخرین کاربر';

  @override
  String get specificUser => 'کاربر خاص';

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
    return '$minutes min';
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
    return '$status\nVersion: $version';
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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
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
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'مجوزهای منبع باز';

  @override
  String get sourceCode => 'کد منبع';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'به روز رسانی اعلان ها';

  @override
  String get showWhenUpdatesAvailable =>
      'نمایش زمانی که به‌روزرسانی‌ها در دسترس هستند';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String itemsCount(int count) {
    return '$count Items';
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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'نگه دارید';

  @override
  String get itemNotFoundInLibrary => 'موردی در کتابخانه Moonfin شما یافت نشد';

  @override
  String get errorSearchingLibrary => 'خطا در جستجوی کتابخانه';

  @override
  String budgetAmount(String amount) {
    return 'Budget: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Revenue: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Request $type';
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
    return 'age $age';
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
    return 'Plugin updates available: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins requiring restart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Failed scheduled tasks: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Recent warning/error entries: $count';
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
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'راه اندازی مجدد سرور در حال انجام است';

  @override
  String get adminServerRebootMessage =>
      'راه اندازی مجدد سرور در حال انجام است، لطفاً Moonfin را مجدداً راه اندازی کنید';

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
    return 'Command failed: $error';
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
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'دستگاه را حذف کنید';

  @override
  String get adminDeviceDeleted => 'دستگاه حذف شد';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'تغییر نام کتابخانه';

  @override
  String get adminNewName => 'نام جدید';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'حذف کتابخانه';

  @override
  String adminLibraryDeleted(String name) {
    return 'Library \"$name\" deleted';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Failed to delete library: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Failed to add path: $error';
  }

  @override
  String get adminRemovePath => 'مسیر را حذف کنید';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'گزینه های کتابخانه ذخیره شد';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'نام کتابخانه الزامی است';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
    return 'Disable $name? They will not be able to sign in.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Enable $name? They will be able to sign in again.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'User \"$name\" disabled';
  }

  @override
  String adminUserEnabled(String name) {
    return 'User \"$name\" enabled';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Failed to update user policy: $error';
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
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'مجوزها ذخیره شد';

  @override
  String get adminPasswordsMismatch => 'گذرواژه ها مطابقت ندارند';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get adminResetPasswordWarning =>
      'با این کار رمز عبور حذف می شود. کاربر می تواند بدون رمز ورود وارد شود.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server returned HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'User \"$name\" deleted';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Failed to delete user: $error';
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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'رمز کلید در پاسخ سرور وجود ندارد';

  @override
  String get adminRevokeApiKey => 'لغو کلید API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'کلید API باطل شد';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'در حال ایجاد پشتیبان...';

  @override
  String get adminBackupCreated => 'پشتیبان گیری با موفقیت ایجاد شد';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'مسیر پشتیبان در پاسخ سرور وجود ندارد';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Restore را تایید کنید';

  @override
  String get adminRestoringBackup => 'در حال بازیابی نسخه پشتیبان...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
    return 'Saved to $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Failed to save file: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Failed to load $fileName';
  }

  @override
  String get adminSearchInLog => 'جستجو در ورود';

  @override
  String get adminNoMatchingLines => 'بدون خطوط منطبق';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'هیچ کار برنامه ریزی شده ای پیدا نشد';

  @override
  String get adminNoTasksMatchFilter => 'هیچ کاری با فیلتر فعلی مطابقت ندارد';

  @override
  String adminTaskStartFailed(String error) {
    return 'Failed to start task: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Failed to stop task: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Failed to load task: $error';
  }

  @override
  String get adminRunNow => 'اکنون اجرا کنید';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'روز هفته';

  @override
  String get adminSearchPlugins => 'جستجوی افزونه ها...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'حذف نصب افزونه';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Are you sure you want to uninstall \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Failed to uninstall plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Failed to install package: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Failed to install update: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Failed to load plugins: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'هیچ افزونه ای با جستجوی شما مطابقت ندارد';

  @override
  String get adminNoPluginsInstalled => 'هیچ پلاگینی نصب نشده است';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
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
    return '\"$name\" will be removed after server restart';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Failed to uninstall: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Updating \"$name\" to v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'تنظیمات باز نشد: نشانه تأیید وجود ندارد.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'افزونه پیدا نشد';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Failed to load repositories: $error';
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
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
      'محدودیت نرخ بیت کلاینت از راه دور (Mbps)';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'جستجوی شخص از راه دور';

  @override
  String get adminNoRemoteMatches => 'هیچ منطبق از راه دور پیدا نشد';

  @override
  String get adminRemoteResults => 'نتایج از راه دور';

  @override
  String get adminRemoteMetadataApplied => 'ابرداده از راه دور اعمال شد';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'نوع محتوا را به روز کنید';

  @override
  String get adminContentType => 'نوع محتوا';

  @override
  String get adminContentTypeUpdated => 'نوع محتوا به روز شد';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'ویرایشگر فراداده بارگیری نشد';

  @override
  String get adminNoPeopleEntries => 'هیچ ورودی شخصی وجود ندارد';

  @override
  String get adminNoExternalIds => 'هیچ شناسه خارجی موجود نیست';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'فرمت تصویر پشتیبانی نشده';

  @override
  String get adminImageReadFailed => 'تصویر انتخابی خوانده نشد';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType image uploaded';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType image deleted';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String get adminAllProviders => 'همه ارائه دهندگان';

  @override
  String get adminNoRemoteImages => 'هیچ تصویری از راه دور پیدا نشد';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
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
    return 'Failed to add tuner: $error';
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
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'تنظیم مجدد درخواست شد';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved => 'تنظیمات ضبط ذخیره شد';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'ارائه دهنده را اضافه کنید';

  @override
  String get adminNoListingProviders =>
      'هیچ ارائه دهنده فهرستی پیکربندی نشده است';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Recording path: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Series path: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Pre-padding: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Post-padding: $minutes min';
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
    return 'Restore backup $name now?';
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
    return '${minutes}m ago';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d ago';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Failed to load $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count matches';
  }

  @override
  String get adminLogViewerNoMatches => 'بدون خطوط منطبق';

  @override
  String get adminMetadataEditorTitle => 'ویرایشگر فراداده';

  @override
  String get adminMetadataRemote => 'از راه دور';

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
  String get adminMetadataFieldPremiereDate => 'تاریخ نمایش (YYYY-MM-DD)';

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
    return '$imageType image updated';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType image uploaded';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType image deleted';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminMetadataImageReadFailed => 'تصویر انتخابی خوانده نشد';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'این تصویر فعلی را از آیتم حذف می کند.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'هیچ بسته ای با جستجوی شما مطابقت ندارد';

  @override
  String get adminPluginsCatalogEmpty => 'هیچ بسته ای موجود نیست';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Repository را حذف کنید';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'حذف کنید';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
      'محدودیت نرخ بیت کلاینت از راه دور (Mbps)';

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
    return 'Daily at $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Every $day at $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Every $duration';
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
    return '${days}d ago';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m ago';
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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'آستانه پاسخ آهسته (ms)';

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
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'پوشه ها';

  @override
  String get libraries => 'کتابخانه ها';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay غیرفعال است';

  @override
  String get syncPlayDisabledMessage =>
      'برای استفاده از پخش همگام، SyncPlay را در تنظیمات فعال کنید.';

  @override
  String get syncPlayServerUnsupportedTitle => 'سرور پشتیبانی نمی شود';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay به یک سرور Jellyfin نیاز دارد. سرور فعلی آن را پشتیبانی نمی کند.';

  @override
  String get syncPlayGroupFallbackName => 'گروه SyncPlay';

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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'دسترسی SyncPlay رد شد';

  @override
  String get syncPlayAccessDeniedMessage =>
      'شما به یک یا چند مورد در این گروه SyncPlay دسترسی ندارید. از مالک گروه بخواهید مجوزهای کتابخانه را تأیید کند یا یک صف دیگر انتخاب کند.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'جستجوی صوتی در دسترس نیست.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'پخش مستقیم Dolby Vision ناموفق بود';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'پخش مستقیم برای این جریان Dolby Vision شروع نشد. دوباره سعی می‌کنید از رمز عبور سرور استفاده کنید؟';

  @override
  String get retryWithTranscode => 'با رمز عبور دوباره امتحان کنید';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision پشتیبانی نمی شود';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'این دستگاه نمی تواند محتوای Dolby Vision را مستقیماً رمزگشایی کند. از HDR10 بازگشتی استفاده کنید یا رمزگذاری سرور را درخواست کنید.';

  @override
  String get rememberMyChoice => 'انتخاب من را به خاطر بسپار';

  @override
  String get playHdr10Fallback => 'پخش مجدد HDR10';

  @override
  String get requestTranscode => 'درخواست ترانکد';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'ردیف‌هایی را که توسط افزونه «بخش‌های صفحه اصلی» IAmParadox27 در معرض دید قرار گرفته‌اند، شناسایی کنید. ردیف‌ها را می‌توان در زیر فعال و مرتب کرد.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'هنوز هیچ سرور Jellyfin این افزونه را گزارش نکرده است.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'ردیف های پیکربندی شده از طریق پلاگین \"KefinTweaks\" ranaldsgift را شناسایی کنید. بخش‌های سفارشی، اخیراً منتشر شده، تماشای مجدد، فصلی و اخیراً در کتابخانه اضافه شده از پیکربندی KefinTweaks در هر سرور Jellyfin منعکس شده‌اند.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'هنوز هیچ سرور Jellyfin که KefinTweaks را گزارش نکرده باشد.';

  @override
  String get integrationOpenHomeSections => 'بخش های صفحه اصلی را باز کنید';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'فعال کردن، غیرفعال کردن و ترتیب مجدد ردیف ها';

  @override
  String get integrationInstalledButDisabled => 'نصب شده اما غیرفعال است';

  @override
  String get integrationNotInstalled => 'نصب نشده است';

  @override
  String integrationSectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# sections',
      one: '# section',
    );
    return '$_temp0';
  }

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
  String get jellyseerr => 'Jellyseerr';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'پخش از راه دور';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'میزان صدای دستگاه';

  @override
  String get castVolumeUnavailable => 'در دسترس نیست';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
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
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'کد را وارد کنید';

  @override
  String get quickConnectAuthorize => 'مجاز کردن';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'تلویزیون زنده';

  @override
  String get continueWatchingAndNextUp => 'ادامه تماشا و بعدی';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get settingsPrivacyAndSafetySection => 'حریم خصوصی و ایمنی';

  @override
  String get settingsBlockedRatings => 'رتبه بندی های مسدود شده';

  @override
  String get settingsGeneralStyle => 'سبک عمومی';

  @override
  String get settingsGeneralStyleSubtitle =>
      'لهجه‌های تم، پس‌زمینه، شاخص‌های تماشا شده، و موسیقی تم';

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
  String get settingsLibraryVisibilitySubtitle =>
      'قابلیت مشاهده صفحه اصلی در هر کتابخانه را تغییر دهید. برای اعمال تغییرات، Moonfin را مجددا راه اندازی کنید.';

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
  String get settingsSupportMoonfin => 'Moonfin را پشتیبانی کنید';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'پروژه را در GitHub ستاره دار کنید یا مشارکت کنید';

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
      'Moonfin چگونه داده های شما را مدیریت می کند';

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
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (توصیه می شود)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (میراث)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision بازگشتی';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'رفتار برای عناوین Dolby Vision در دستگاه‌های بدون رمزگشایی Dolby Vision.';

  @override
  String get settingsAskEachTime => 'هر بار بپرسید';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 بازگشتی را ترجیح دهید';

  @override
  String get settingsPreferServerTranscode => 'رمز عبور سرور را ترجیح دهید';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 پخش مستقیم';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'کنترل می‌کند که آیا جریان‌های لایه بهبودیافته نمایه Dolby Vision 7 باید مستقیم پخش شوند یا خیر.';

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
      'گروه های SyncPlay را ایجاد، ملحق یا مدیریت کنید';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay فعال شد';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'ویژگی های تماشای گروهی را فعال کنید';

  @override
  String get settingsSyncplayButton => 'دکمه SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'دکمه SyncPlay را در نوار ناوبری نشان دهید';

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
  String get settingsSyncplayExtraOffset => 'افست اضافی SyncPlay';

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
    return 'Latest $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Autoplay Next Episode';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automatically play the next episode when available.';

  @override
  String get skipSilenceTitle => 'Skip silence';

  @override
  String get skipSilenceSubtitle =>
      'Automatically skip silent audio segments when supported by the stream.';

  @override
  String get allowExternalAudioEffectsTitle => 'Allow external audio effects';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Allow equalizer and effects apps (e.g. Wavelet) to attach to Media3 playback sessions.';

  @override
  String get disableTunnelingTitle => 'Disable tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Force non-tunneled playback. Useful on devices with tunneling audio/video discontinuities.';

  @override
  String get mapDolbyVisionP7Title => 'Map Dolby Vision profile 7 to HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Play Dolby Vision profile 7 streams as HDR10-compatible HEVC on non-DV devices.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Use embedded subtitle styles';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Apply colours, fonts, and positioning embedded in the subtitle track. Disable to use your caption style preferences instead.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Use embedded subtitle font sizes';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Apply font-size hints embedded in the subtitle track. Disable to use the subtitle size from your style preferences.';

  @override
  String get useDetailedSubHeadings => 'Use Detailed Sub-Headings';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Show detailed or minimal subrow on Library pages.';

  @override
  String get savedThemesDeleteDialogTitle => 'Delete saved theme?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Remove \"$themeName\" from this device cache?';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Deleted \"$themeName\" from this device.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Could not delete \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Saved themes';

  @override
  String get savedThemesDescription =>
      'These are themes downloaded from the Moonfin plugin for the current server. Deleting removes only this local copy.';

  @override
  String get savedThemesEmpty => 'No saved themes were found for this server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Currently active';
  }

  @override
  String get savedThemesDeleteTooltip => 'Delete saved theme';

  @override
  String get savedThemesManageSubtitle =>
      'Manage downloaded plugin themes on this device';

  @override
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Home Screen Sections';

  @override
  String get themeEditor => 'Theme Editor';

  @override
  String get themeEditorSubtitle =>
      'Open the Moonfin Theme Editor in your browser';

  @override
  String get homeScreen => 'Home Screen';

  @override
  String get bottomBar => 'Bottom Bar';

  @override
  String get homeRowsStyleClassic => 'Classic';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Home Rows';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Classic keeps per-row image type and info overlay. Modern uses portrait-to-backdrop rows.';

  @override
  String get displayFavoritesRows => 'Display Favorites Rows';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Show Favorite Movies, Series, and other favorite rows in Home Sections.';

  @override
  String get favoritesRowSorting => 'Favorites Row Sorting';

  @override
  String get favoritesRowSortingDescription =>
      'Sort Favorites rows by date added, release date, alphabetically, and more.';

  @override
  String get displayCollectionsRows => 'Display Collections Rows';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Show Collections rows in Home Sections.';

  @override
  String get collectionsRowSorting => 'Collections Row Sorting';

  @override
  String get collectionsRowSortingDescription =>
      'Sort Collections rows by date added, release date, alphabetically, and more.';

  @override
  String get displayGenresRows => 'Display Genres Rows';

  @override
  String get displayGenresRowsSubtitle => 'Show Genres rows in Home Sections.';

  @override
  String get genresRowSorting => 'Genres Row Sorting';

  @override
  String get genresRowSortingDescription =>
      'Sort Genres rows by date added, release date, alphabetically, and more.';

  @override
  String get genresRowItems => 'Genres Row Items';

  @override
  String get genresRowItemsDescription =>
      'Show Movies, Series, or both in Genres rows.';

  @override
  String get appearance => 'Appearance';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Show app chooser when playback starts.';

  @override
  String get loadingInstalledPlayers => 'Loading installed players...';

  @override
  String get connection => 'Connection';

  @override
  String get audioTranscodeTarget => 'Audio Transcode Target';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Supported on this device';

  @override
  String get notSupportedOnThisDevice => 'Not Supported on this device';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) to external decoder.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD with Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Media Player Behavior';

  @override
  String get playbackEnhancements => 'Playback Enhancements';

  @override
  String get alwaysOn => 'Always on.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Replace Skip Outro with Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Show the Next Up overlay instead of the Skip Outro button.';

  @override
  String get playerRouting => 'Player Routing';

  @override
  String get preferSoftwareDecoders => 'Prefer software decoders';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Use FFmpeg (audio) and libgav1 (AV1) before hardware decoders. Disable if HDMI audio passthrough breaks.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Open video playback in your selected external app on Android TV.';

  @override
  String get automaticQueuing => 'Automatic Queuing';

  @override
  String get preferSdhSubtitles => 'Prefer SDH subtitles';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritize SDH/CC subtitle tracks when auto-selecting.';

  @override
  String get webDiagnostics => 'Web diagnostics';

  @override
  String get webDiagnosticsTitle => 'Moonfin Web Diagnostics';

  @override
  String get webDiagnosticsIntro =>
      'Use this page to diagnose browser connectivity issues (CORS, mixed content, and discovery settings).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Detected Mixed-Content Failure';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Detected CORS/Preflight Failure';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin detected an HTTPS page trying to call an HTTP server URL. Browsers block this request before it reaches your server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin detected a browser-level request failure that is commonly caused by missing CORS or preflight headers on the media server.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Target URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detail: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Current Runtime Context';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Scheme';

  @override
  String get webDiagnosticsPluginMode => 'Plugin Mode';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC Scan';

  @override
  String get webDiagnosticsForcedServerUrl => 'Forced Server URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Default Server URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Discovery Proxy URL';

  @override
  String get notConfigured => 'not configured';

  @override
  String get webDiagnosticsMixedContent => 'Mixed Content';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'This page is loaded over HTTPS, but one or more configured URLs are HTTP. Browsers block HTTPS pages from calling HTTP APIs.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Fix: serve your media server or proxy endpoint via HTTPS, or load Moonfin over HTTP on trusted local networks only.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'No obvious mixed-content configuration detected from current runtime settings.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS Checklist';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Allow the browser origin in Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Include Authorization, X-Emby-Authorization, and X-Emby-Token in Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Expose Content-Range and Accept-Ranges for streaming and seek behavior.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Return 204 to OPTIONS preflight requests.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Example Header Snippet (nginx-style)';

  @override
  String get note => 'Note';

  @override
  String get webDiagnosticsNonWebNote =>
      'This diagnostics route is intended for web builds. If you are seeing this on another platform, these checks may not apply.';

  @override
  String get backToServerSelect => 'Back To Server Select';

  @override
  String get signOutAllUsers => 'Sign Out All Users';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Microphone permission is permanently denied. Enable it in system settings.';

  @override
  String get voiceSearchPermissionRequired =>
      'Microphone permission is required for voice search.';

  @override
  String get voiceSearchNoMatch => 'Did not catch that. Try again.';

  @override
  String get voiceSearchNoSpeechDetected => 'No speech detected.';

  @override
  String get voiceSearchMicrophoneError => 'Microphone error.';

  @override
  String get voiceSearchNeedsInternet => 'Voice search needs internet.';

  @override
  String get voiceSearchServiceBusy => 'Voice service is busy. Try again.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Microphone permission is permanently denied.';

  @override
  String get microphonePermissionDenied => 'Microphone permission is denied.';

  @override
  String get speechRecognitionUnavailable =>
      'Speech recognition is unavailable on this device.';

  @override
  String get openIosRoutePicker => 'Open iOS route picker';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay route picker is unavailable on this device.';

  @override
  String get videos => 'Videos';

  @override
  String get trailers => 'Trailers';

  @override
  String get programs => 'Programs';

  @override
  String get songs => 'Songs';

  @override
  String get photoAlbums => 'Photo Albums';

  @override
  String get photos => 'Photos';

  @override
  String get people => 'People';

  @override
  String get recentlyReleasedEpisodes => 'Recently Released Episodes';

  @override
  String get watchAgain => 'Watch Again';

  @override
  String get guestAppearances => 'Guest Appearances';

  @override
  String get appearancesSeerr => 'Appearances (Seerr)';

  @override
  String get watchWithGroup => 'Watch with group';

  @override
  String get errors => 'Errors';

  @override
  String get warnings => 'Warnings';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Open in Browser';

  @override
  String get embeddedBrowserNotAvailable =>
      'Embedded browser is not available on this platform.';

  @override
  String get adminRestartServerConfirmation =>
      'Are you sure you want to restart the server?';

  @override
  String get adminShutdownServerConfirmation =>
      'Are you sure you want to shut down the server? You will need to restart it manually.';

  @override
  String get internal => 'Internal';

  @override
  String get idle => 'Idle';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'No users found';

  @override
  String get adminNoUsersMatchSearch => 'No users match your search';

  @override
  String get adminNoDevicesFound => 'No devices found';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'No devices match the current filters';

  @override
  String get passwordSet => 'Password set';

  @override
  String get noPasswordConfigured => 'No password configured';

  @override
  String get remoteAccess => 'Remote Access';

  @override
  String get localOnly => 'Local Only';

  @override
  String get adminMediaAnalyticsLoadFailed => 'Failed to load media analytics';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Combined analytics across all media libraries.';

  @override
  String get analyticsTopArtists => 'Top Artists';

  @override
  String get analyticsTopAuthors => 'Top Authors';

  @override
  String get analyticsTopContributors => 'Top Contributors';

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
      'No indexed media totals are available for this selection yet.';

  @override
  String get analyticsLibraryDetails => 'Library Details';

  @override
  String get analyticsLibraryBreakdown => 'Library Breakdown';

  @override
  String get analyticsNoLibrariesAvailable => 'No libraries are available.';

  @override
  String get adminServerAdministrationTitle => 'Server Administration';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Image Cache';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Logs';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Transcode';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'No server paths returned by this server.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% used';
  }

  @override
  String get userActivity => 'User Activity';

  @override
  String get systemEvents => 'System Events';

  @override
  String get needsAttention => 'Needs Attention';

  @override
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Playback';

  @override
  String get adminDrawerSectionDevices => 'Devices';

  @override
  String get adminDrawerSectionAdvanced => 'Advanced';

  @override
  String get adminDrawerSectionPlugins => 'Plugins';

  @override
  String get adminDrawerSectionLiveTv => 'Live TV';

  @override
  String get homeVideos => 'Home Videos';

  @override
  String get mixedContent => 'Mixed Content';

  @override
  String get homeVideosAndPhotos => 'Home Videos & Photos';

  @override
  String get mixedMoviesAndShows => 'Mixed Movies & Shows';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'No recordings found';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'No image pages found inside .$extension archive.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Embedded renderer failed ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB renderer failed ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Missing local file for reader: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status while opening book data from $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'No readable book endpoint available';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Unsupported comic archive format: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR extraction plugin is not available on this platform.';

  @override
  String get failedToExtractCbrArchive => 'Failed to extract .cbr archive.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 extraction is not available on this platform.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 extraction plugin is not available on this platform.';

  @override
  String get closeGenrePanel => 'Close genre panel';

  @override
  String get loadingShuffle => 'Loading shuffle...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Auto HDR Switching';

  @override
  String get autoHdrSwitchingDescription =>
      'Automatically enable HDR for HDR video playback and restore display mode on exit.';

  @override
  String get whenFullscreen => 'When fullscreen';

  @override
  String get transcodingLimits => 'Transcoding Limits';
}
