// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'مونفين';

  @override
  String get accountPreferences => 'ACCOUNT PREFERENCES';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get empty => 'Empty';

  @override
  String connectingToServer(String serverName) {
    return 'الاتصال بـ $serverName';
  }

  @override
  String get quickConnect => 'اتصال سريع';

  @override
  String get password => 'كلمة المرور';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get email => 'بريد إلكتروني';

  @override
  String get quickConnectInstruction =>
      'أدخل هذا الرمز في لوحة تحكم الويب الخاصة بخادمك:';

  @override
  String get waitingForAuthorization => 'في انتظار الترخيص...';

  @override
  String get back => 'خلف';

  @override
  String get serverUnavailable => 'الخادم غير متوفر';

  @override
  String get loginFailed => 'فشل تسجيل الدخول';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect غير متاح: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect غير متاح ($status): $detail';
  }

  @override
  String get whosWatching => 'من يراقب؟';

  @override
  String get addUser => 'إضافة مستخدم';

  @override
  String get selectServer => 'حدد الخادم';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin الإصدار $version';
  }

  @override
  String get savedServers => 'الخوادم المحفوظة';

  @override
  String get discoveredServers => 'الخوادم المكتشفة';

  @override
  String get noneFound => 'لم يتم العثور على أي شيء';

  @override
  String get unableToConnectToServer => 'غير قادر على الاتصال بالخادم';

  @override
  String get addServer => 'أضف الخادم';

  @override
  String get embyConnect => 'Emby تواصل';

  @override
  String get removeServer => 'إزالة الخادم';

  @override
  String removeServerConfirmation(String serverName) {
    return 'هل تريد إزالة \"$serverName\" من خوادمك؟';
  }

  @override
  String get cancel => 'يلغي';

  @override
  String get remove => 'يزيل';

  @override
  String get connectToServer => 'الاتصال بالخادم';

  @override
  String get serverAddress => 'عنوان الخادم';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'يتصل';

  @override
  String get secureStorageUnavailable => 'التخزين الآمن غير متوفر';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin تعذر الوصول إلى حلقة مفاتيح النظام. يمكن متابعة تسجيل الدخول، ولكن قد لا يكون تخزين الرمز المميز متاحًا حتى يتم إلغاء قفل حلقة المفاتيح.';

  @override
  String get ok => 'نعم';

  @override
  String get settingsAppearanceTheme => 'موضوع التطبيق';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'قم بالتبديل بين Moonfin وNeon Pulse دون إعادة تشغيل التطبيق';

  @override
  String get keyboardPreferSystemIme => 'تفضل لوحة مفاتيح النظام';

  @override
  String get keyboardPreferSystemImeDescription =>
      'استخدم طريقة إدخال جهازك بشكل افتراضي لإدخال النص';

  @override
  String get themeMoonfin => 'مونفين';

  @override
  String get themeMoonfinSubtitle => 'المظهر الحالي Moonfin الذي أحببته جميعًا';

  @override
  String get themeNeonPulse => 'نبض النيون';

  @override
  String get themeNeonPulseSubtitle =>
      'تصميم Synthwave مع توهج أرجواني ونص سماوي وتباين أقوى للكروم';

  @override
  String get embyConnectSignInSubtitle =>
      'قم بتسجيل الدخول باستخدام حساب Emby Connect الخاص بك';

  @override
  String get emailOrUsername => 'البريد الإلكتروني أو اسم المستخدم';

  @override
  String get selectAServer => 'حدد الخادم';

  @override
  String get tryAgain => 'حاول ثانية';

  @override
  String get noLinkedServers => 'لا توجد خوادم مرتبطة بحساب Connect Emby هذا';

  @override
  String get invalidEmbyConnectCredentials =>
      'Emby بيانات اعتماد الاتصال غير صالحة';

  @override
  String get invalidEmbyConnectLogin =>
      'Emby اسم المستخدم أو كلمة المرور غير صالحة';

  @override
  String get embyConnectExchangeNotSupported =>
      'الخادم لا يدعم Emby تبادل الاتصال';

  @override
  String get embyConnectNetworkError =>
      'حدث خطأ في الشبكة أثناء الاتصال بـ Emby Connect أو بالخادم المحدد';

  @override
  String get loadingLinkedServers => 'جارٍ تحميل الخوادم المرتبطة...';

  @override
  String get connectingToServerEllipsis => 'جارٍ الاتصال بالخادم...';

  @override
  String get noReachableAddress => 'لم يتم توفير عنوان يمكن الوصول إليه';

  @override
  String get invalidServerExchangeResponse =>
      'استجابة غير صالحة من نقطة نهاية تبادل الخادم';

  @override
  String unableToConnectTo(String target) {
    return 'غير قادر على الاتصال بـ $target';
  }

  @override
  String get exitApp => 'هل تريد الخروج من Moonfin؟';

  @override
  String get exitAppConfirmation => 'هل أنت متأكد أنك تريد الخروج؟';

  @override
  String get exit => 'مخرج';

  @override
  String get noHomeRowsLoaded => 'لا يمكن تحميل أي صفوف رئيسية';

  @override
  String get noHomeRowsHint => 'حاول تحديث أقسام المنزل النشطة أو تقليلها.';

  @override
  String get retryHomeRows => 'إعادة محاولة صفوف الصفحة الرئيسية';

  @override
  String get guide => 'مرشد';

  @override
  String get recordings => 'التسجيلات';

  @override
  String get schedule => 'جدول';

  @override
  String get series => 'مسلسل';

  @override
  String get noItemsFound => 'لم يتم العثور على أي عناصر';

  @override
  String get home => 'بيت';

  @override
  String get browseAll => 'تصفح الكل';

  @override
  String get genres => 'الأنواع';

  @override
  String get collectionPlaceholder => 'ستظهر عناصر المجموعة هنا';

  @override
  String get browseByLetter => 'تصفح حسب الرسالة';

  @override
  String get alphabeticalBrowsePlaceholder => 'سوف يظهر التصفح الأبجدي هنا';

  @override
  String get suggestions => 'اقتراحات';

  @override
  String get suggestionsPlaceholder => 'سوف تظهر العناصر المقترحة هنا';

  @override
  String get failedToLoadLibraries => 'فشل تحميل المكتبات';

  @override
  String get noLibrariesFound => 'لم يتم العثور على مكتبات';

  @override
  String get library => 'مكتبة';

  @override
  String get displaySettings => 'إعدادات العرض';

  @override
  String get allGenres => 'جميع الأنواع';

  @override
  String get noGenresFound => 'لم يتم العثور على أي أنواع';

  @override
  String failedToLoadFolderError(String error) {
    return 'فشل تحميل المجلد: $error';
  }

  @override
  String get thisFolderIsEmpty => 'هذا المجلد فارغ';

  @override
  String itemCountLabel(int count) {
    return '$count العناصر';
  }

  @override
  String get failedToLoadFavorites => 'فشل في تحميل المفضلة';

  @override
  String get retry => 'أعد المحاولة';

  @override
  String get noFavoritesYet => 'لا يوجد مفضلة بعد';

  @override
  String get favorites => 'المفضلة';

  @override
  String totalCountItems(int count) {
    return '$count العناصر';
  }

  @override
  String get continuing => 'مستمر';

  @override
  String get ended => 'انتهى';

  @override
  String get sortAndFilter => 'فرز وتصفية';

  @override
  String get type => 'يكتب';

  @override
  String get sortBy => 'فرز حسب';

  @override
  String get display => 'عرض';

  @override
  String get imageType => 'نوع الصورة';

  @override
  String get posterSize => 'حجم الملصق';

  @override
  String get small => 'صغير';

  @override
  String get medium => 'واسطة';

  @override
  String get large => 'كبير';

  @override
  String get extraLarge => 'كبير جدا';

  @override
  String libraryGenresTitle(String name) {
    return '$name — الأنواع';
  }

  @override
  String get views => 'وجهات النظر';

  @override
  String get albums => 'الألبومات';

  @override
  String get albumArtists => 'فنانين الالبوم';

  @override
  String get artists => 'الفنانين';

  @override
  String get bookmarks => 'الإشارات المرجعية';

  @override
  String get noSavedBookmarks =>
      'لا توجد إشارات مرجعية محفوظة لهذا العنوان حتى الآن.';

  @override
  String get openBook => 'افتح الكتاب';

  @override
  String get chapter => 'الفصل';

  @override
  String get page => 'صفحة';

  @override
  String get bookmark => 'إشارة مرجعية';

  @override
  String get justNow => 'الآن';

  @override
  String minutesAgo(int count) {
    return '$countم مضت';
  }

  @override
  String hoursAgo(int count) {
    return '$count منذ ساعة';
  }

  @override
  String daysAgo(int count) {
    return '${count}d مضت';
  }

  @override
  String get discoverySubjects => 'مواضيع الاكتشاف';

  @override
  String get pickDiscoverySubjects =>
      'اختر خلاصات الموضوع التي سيتم عرضها في Discover.';

  @override
  String get apply => 'يتقدم';

  @override
  String get openLink => 'افتح الرابط';

  @override
  String get scanWithYourPhone => 'مسح مع هاتفك';

  @override
  String get audiobookGenres => 'أنواع الكتب الصوتية';

  @override
  String get pickAudiobookGenres =>
      'اختر الأنواع التي تريد عرضها في Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'اكتشف الكتب الصوتية';

  @override
  String get librivoxDescription => 'عناوين النطاق العام الشهيرة من LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count العناوين';
  }

  @override
  String get scrollLeft => 'قم بالتمرير إلى اليسار';

  @override
  String get scrollRight => 'قم بالتمرير إلى اليمين';

  @override
  String get couldNotLoadGenre => 'تعذر تحميل هذا النوع الآن.';

  @override
  String get continueReading => 'مواصلة القراءة';

  @override
  String get savedHighlights => 'النقاط البارزة المحفوظة';

  @override
  String get continueListening => 'مواصلة الاستماع';

  @override
  String get listen => 'يستمع';

  @override
  String get resume => 'سيرة ذاتية';

  @override
  String get failedToLoadLibrary => 'فشل تحميل المكتبة';

  @override
  String get popularNow => 'شعبية الآن';

  @override
  String get savedForLater => 'تم الحفظ لوقت لاحق';

  @override
  String get topListens => 'أعلى مرات الاستماع';

  @override
  String get unreadDiscoveries => 'الاكتشافات غير المقروءة';

  @override
  String get pickUpAgain => 'التقط مرة أخرى';

  @override
  String get bookHighlightsDescription =>
      'كتبك مع النقاط البارزة أو المفضلة أو التقدم في القراءة.';

  @override
  String get handPickedFromLibrary => 'منتقاة بعناية من مكتبتك.';

  @override
  String get handPickedFromListeningQueue =>
      'تم اختياره يدويًا من قائمة انتظار الاستماع الخاصة بك.';

  @override
  String get booksWithHighlights =>
      'الكتب ذات النقاط البارزة أو المفضلة أو التقدم في القراءة.';

  @override
  String get jumpBackNarration => 'ارجع مرة أخرى إلى السرد دون البحث عن مكانك.';

  @override
  String get unreadBooksReady =>
      'الكتب غير المقروءة جاهزة لساعة الهدوء التالية.';

  @override
  String get quickAccessFavorites =>
      'الوصول السريع إلى الكتب التي تعود إليها باستمرار.';

  @override
  String get searchAudiobooks => 'بحث في الكتب الصوتية';

  @override
  String get searchYourLibrary => 'ابحث في مكتبتك';

  @override
  String get pickUpStory => 'التقط القصة من حيث توقفت';

  @override
  String get savedPlacesChapters => 'الأماكن المحفوظة والفصول غير المكتملة';

  @override
  String authorsCount(int count) {
    return '$count المؤلفون';
  }

  @override
  String genresCount(int count) {
    return '$count الأنواع';
  }

  @override
  String percentCompleted(int percent) {
    return 'اكتمل $percent%';
  }

  @override
  String get readyWhenYouAre => 'جاهز عندما تكون';

  @override
  String get details => 'تفاصيل';

  @override
  String get listeningRoom => 'غرفة الاستماع';

  @override
  String get bookmarksAndProgress => 'الإشارات المرجعية والتقدم';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count العناوين مرتبة للتصفح بالقراءة أولاً.';
  }

  @override
  String get titles => 'العناوين';

  @override
  String get allTitles => 'جميع العناوين';

  @override
  String get authors => 'المؤلفون';

  @override
  String get browseByAuthor => 'تصفح حسب المؤلف';

  @override
  String get browseByGenre => 'تصفح حسب النوع';

  @override
  String get discover => 'يكتشف';

  @override
  String get trendingTitlesOpenLibrary =>
      'العناوين الشائعة حسب الموضوع من Open Library.';

  @override
  String get noBookmarkedItems => 'لا توجد عناصر مرجعية حتى الآن';

  @override
  String get nothingMatchesSection =>
      'لا يوجد شيء يطابق هذا القسم حتى الآن. جرب علامة تبويب أخرى أو عد بعد انتهاء مزامنة المكتبة.';

  @override
  String get audiobooks => 'كتب صوتية';

  @override
  String noLabelFound(String label) {
    return 'لم يتم العثور على $label';
  }

  @override
  String get folder => 'مجلد';

  @override
  String get filters => 'المرشحات';

  @override
  String get readingStatus => 'حالة القراءة';

  @override
  String get playedStatus => 'حالة اللعب';

  @override
  String get readStatus => 'يقرأ';

  @override
  String get watched => 'شاهد';

  @override
  String get unread => 'غير مقروءة';

  @override
  String get unwatched => 'غير مراقب';

  @override
  String get seriesStatus => 'حالة السلسلة';

  @override
  String get allLibraries => 'جميع المكتبات';

  @override
  String get books => 'كتب';

  @override
  String get author => 'مؤلف';

  @override
  String get unknownAuthor => 'مؤلف غير معروف';

  @override
  String get uncategorized => 'غير مصنف';

  @override
  String get overview => 'ملخص';

  @override
  String get noLibrivoxDescription =>
      'لم يقدم LibriVox وصفًا لهذا العنوان حتى الآن.';

  @override
  String get readers => 'القراء';

  @override
  String get openLinks => 'فتح الروابط';

  @override
  String get librivoxPage => 'LibriVox الصفحة';

  @override
  String get internetArchive => 'أرشيف الإنترنت';

  @override
  String get rssFeed => 'تغذية RSS';

  @override
  String get downloadZip => 'تحميل الرمز البريدي';

  @override
  String sectionCountLabel(int count) {
    return '$count الأقسام';
  }

  @override
  String firstPublished(int year) {
    return 'تم النشر لأول مرة $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'لا تتوفر نظرة عامة من Open Library لهذا العنوان حتى الآن.';

  @override
  String get subjects => 'المواضيع';

  @override
  String get all => 'الجميع';

  @override
  String booksCount(int count) {
    return '$count الكتب';
  }

  @override
  String get couldNotLoadSubject => 'لا يمكن تحميل هذا الموضوع الآن.';

  @override
  String get audiobookDetails => 'تفاصيل الكتاب الصوتي';

  @override
  String authorsCountTitle(int count) {
    return '$count المؤلفون';
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
  String get trackList => 'قائمة المسار';

  @override
  String get itemListPlaceholder => 'ستظهر قائمة العناصر هنا';

  @override
  String get favoriteTracksPlaceholder => 'سوف تظهر المسارات المفضلة هنا';

  @override
  String get failedToLoad => 'فشل التحميل';

  @override
  String get delete => 'يمسح';

  @override
  String get save => 'يحفظ';

  @override
  String get moreLikeThis => 'المزيد مثل هذا';

  @override
  String get castAndCrew => 'الممثلون وطاقم العمل';

  @override
  String get collection => 'مجموعة';

  @override
  String get episodes => 'الحلقات';

  @override
  String get nextUp => 'التالي لأعلى';

  @override
  String get seasons => 'المواسم';

  @override
  String get chapters => 'فصول';

  @override
  String get features => 'سمات';

  @override
  String get movies => 'أفلام';

  @override
  String get musicVideos => 'فيديوهات موسيقية';

  @override
  String get other => 'آخر';

  @override
  String get discography => 'ديسكغرافيا';

  @override
  String get similarArtists => 'فنانين مشابهين';

  @override
  String get tableOfContents => 'جدول المحتويات';

  @override
  String get tracklist => 'قائمة الأغاني';

  @override
  String discNumber(int number) {
    return 'القرص $number';
  }

  @override
  String get biography => 'سيرة';

  @override
  String get authorDetails => 'تفاصيل المؤلف';

  @override
  String get noOverviewAvailable =>
      'لا توجد نظرة عامة متاحة لهذا العنوان حتى الآن.';

  @override
  String get noBiographyAvailable => 'لا توجد سيرة ذاتية متاحة لهذا المؤلف.';

  @override
  String get noBooksFound => 'لم يتم العثور على كتب لهذا المؤلف.';

  @override
  String get unableToLoadAuthorDetails =>
      'غير قادر على تحميل تفاصيل المؤلف الآن.';

  @override
  String published(int year) {
    return 'تم النشر $year';
  }

  @override
  String get publicationDateUnknown => 'تاريخ النشر غير معروف';

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
    return 'ينتهي عند $time';
  }

  @override
  String endsIn(String time) {
    return 'Ends in $time';
  }

  @override
  String get view => 'منظر';

  @override
  String get resumeReading => 'استئناف القراءة';

  @override
  String get read => 'يقرأ';

  @override
  String resumeFrom(String position) {
    return 'استئناف من $position';
  }

  @override
  String get play => 'يلعب';

  @override
  String get startOver => 'البدء من جديد';

  @override
  String get restart => 'إعادة تشغيل';

  @override
  String get readOffline => 'قراءة دون اتصال';

  @override
  String get playOffline => 'العب دون اتصال';

  @override
  String get audio => 'صوتي';

  @override
  String get subtitles => 'ترجمات';

  @override
  String get version => 'إصدار';

  @override
  String get cast => 'يقذف';

  @override
  String get trailer => 'جَرَّار';

  @override
  String get finished => 'انتهى';

  @override
  String get favorited => 'المفضلة';

  @override
  String get favorite => 'مفضل';

  @override
  String get playlist => 'قائمة التشغيل';

  @override
  String get downloaded => 'تم التنزيل';

  @override
  String get downloadAll => 'تحميل الكل';

  @override
  String get download => 'تحميل';

  @override
  String get deleteDownloaded => 'حذف تم تنزيله';

  @override
  String get goToSeries => 'اذهب إلى السلسلة';

  @override
  String get editMetadata => 'تحرير البيانات الوصفية';

  @override
  String get less => 'أقل';

  @override
  String get more => 'أكثر';

  @override
  String get deleteItem => 'حذف العنصر';

  @override
  String get deletePlaylist => 'حذف قائمة التشغيل';

  @override
  String get deletePlaylistMessage =>
      'هل تريد حذف قائمة التشغيل هذه من الخادم؟';

  @override
  String get deleteItemMessage => 'هل تريد حذف هذا العنصر من الخادم؟';

  @override
  String get failedToDeletePlaylist => 'فشل حذف قائمة التشغيل';

  @override
  String get failedToDeleteItem => 'فشل حذف العنصر';

  @override
  String get renamePlaylist => 'إعادة تسمية قائمة التشغيل';

  @override
  String get playlistName => 'اسم قائمة التشغيل';

  @override
  String get deleteDownloadedAlbum => 'حذف الألبوم الذي تم تنزيله';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'هل تريد حذف المسارات التي تم تنزيلها لـ \"$title\"؟';
  }

  @override
  String get downloadedTracksDeleted => 'تم حذف المسارات التي تم تنزيلها';

  @override
  String get downloadedTracksDeleteFailed =>
      'لا يمكن حذف بعض المسارات التي تم تنزيلها';

  @override
  String get noTracksLoaded => 'لم يتم تحميل أي مسارات';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'لم يتم تحميل $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'جارٍ التنزيل $title ($count العناصر)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'هل أنت متأكد من أنك تريد حذف \"$name\" من الخادم؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get itemDeleted => 'تم حذف العنصر';

  @override
  String get noPlayableTrailerFound =>
      'لم يتم العثور على مقطع دعائي قابل للتشغيل.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'تنسيق الكتاب غير مدعوم: .$extension';
  }

  @override
  String get audioTrack => 'المسار الصوتي';

  @override
  String get subtitleTrack => 'مسار الترجمة';

  @override
  String get none => 'لا أحد';

  @override
  String get downloadSubtitlesLabel => 'تحميل ترجمات...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'ابحث باستخدام البرنامج المساعد OpenSubtitles';

  @override
  String get downloadSubtitles => 'تحميل ترجمات';

  @override
  String get selectedSubtitleInvalid => 'العنوان الفرعي المحدد غير صالح.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'تم تنزيل الترجمة واختيارها: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'تم تنزيل الترجمة. قد يستغرق الأمر بعض الوقت للظهور بينما يقوم Jellyfin بتحديث العنصر.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'لم يتم العثور على ترجمات بعيدة لـ $language.';
  }

  @override
  String get selectVersion => 'حدد الإصدار';

  @override
  String versionNumber(int number) {
    return 'الإصدار $number';
  }

  @override
  String get downloadAllQuality => 'تنزيل الكل - الجودة';

  @override
  String get downloadQuality => 'تحميل الجودة';

  @override
  String get originalFileNoReencoding => 'الملف الأصلي، لا إعادة الترميز';

  @override
  String get originalFilesNoReencoding => 'الملفات الأصلية، لا إعادة الترميز';

  @override
  String get noEpisodesLoaded => 'لم يتم تحميل أي حلقات';

  @override
  String downloadingItem(String name, String quality) {
    return 'جارٍ التنزيل $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'حذف الملفات التي تم تنزيلها';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'هل تريد حذف الملفات المحلية لـ $typeLabel؟\n\nسيؤدي هذا إلى تحرير مساحة التخزين. يمكنك إعادة التحميل لاحقا.';
  }

  @override
  String get downloadedFilesDeleted => 'تم حذف الملفات التي تم تنزيلها';

  @override
  String get failedToDeleteFiles => 'فشل في حذف الملفات';

  @override
  String get deleteFiles => 'حذف الملفات';

  @override
  String get director => 'مخرج';

  @override
  String get writers => 'الكتاب';

  @override
  String get studio => 'استوديو';

  @override
  String studioMoreCount(int count) {
    return '+$count المزيد';
  }

  @override
  String totalEpisodes(int count) {
    return '$count الحلقات';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'الحلقة $number';
  }

  @override
  String chapterNumber(int number) {
    return 'الفصل $number';
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
    return 'ولد $date';
  }

  @override
  String died(String date) {
    return 'مات $date';
  }

  @override
  String age(int age) {
    return 'العمر $age';
  }

  @override
  String get showLess => 'عرض أقل';

  @override
  String get readMore => 'اقرأ المزيد';

  @override
  String get shuffle => 'خلط';

  @override
  String downloadsCount(int count) {
    return '$count التنزيلات';
  }

  @override
  String get perfectMatch => 'مباراة مثالية';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'كثرة الوحيدات';

  @override
  String get stereo => 'ستيريو';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'تتطلب الترجمة عن بعد $action إذن إدارة الترجمة Jellyfin لهذا المستخدم.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'تعذر العثور على هذا العنصر على الخادم للترجمة عن بعد $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'فشل الترجمة عن بعد $action: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'فشل الترجمة عن بعد $action (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'فشل $action في الترجمة عن بعد.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'جميع الحلقات التي تم تنزيلها لـ \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'جميع الحلقات التي تم تنزيلها في هذا الموسم';

  @override
  String get stillWatching => 'هل ما زلت تشاهد؟';

  @override
  String get unableToLoadTrailerStream => 'تعذر تحميل بث المقطع الدعائي.';

  @override
  String get trailerTimedOut => 'انتهت مهلة المقطورة أثناء التحميل.';

  @override
  String get playbackFailedForTrailer => 'فشل التشغيل لهذا المقطع الدعائي.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'الإرسال غير متاح أثناء التشغيل دون الاتصال بالإنترنت.';

  @override
  String castActionFailed(String label, String error) {
    return '$label فشل الإجراء: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'فشل تعيين حجم الإرسال: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label عناصر التحكم';
  }

  @override
  String get deviceVolume => 'حجم الجهاز';

  @override
  String get unavailable => 'غير متاح';

  @override
  String get pause => 'يوقف';

  @override
  String get syncPosition => 'موقف المزامنة';

  @override
  String stopCast(String label) {
    return 'توقف $label';
  }

  @override
  String get queueIsEmpty => 'قائمة الانتظار فارغة';

  @override
  String trackNumber(int number) {
    return 'تتبع $number';
  }

  @override
  String get remotePlayback => 'التشغيل عن بعد';

  @override
  String get castingToGoogleCast => 'الإرسال إلى Google Cast';

  @override
  String get castingViaAirPlay => 'الإرسال عبر AirPlay';

  @override
  String get castingViaDlna => 'الإرسال عبر DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds ثانية';
  }

  @override
  String get longPressToUnlock => 'اضغط لفترة طويلة لفتح';

  @override
  String get off => 'عن';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'آلي';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps ميجابت في الثانية';
  }

  @override
  String get bitrateOverride => 'تجاوز معدل البت';

  @override
  String get audioDelay => 'تأخير الصوت';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'تأخير الترجمة';

  @override
  String get reset => 'إعادة ضبط';

  @override
  String get unknown => 'مجهول';

  @override
  String get playbackInformation => 'معلومات التشغيل';

  @override
  String get playback => 'التشغيل';

  @override
  String get playMethod => 'طريقة اللعب';

  @override
  String get directPlay => 'اللعب المباشر';

  @override
  String get directStream => 'تيار مباشر';

  @override
  String get transcoding => 'تحويل الشفرة';

  @override
  String get transcodeReasons => 'أسباب التحويل';

  @override
  String get player => 'لاعب';

  @override
  String get container => 'حاوية';

  @override
  String get bitrate => 'معدل البت';

  @override
  String get video => 'فيديو';

  @override
  String get resolution => 'دقة';

  @override
  String get hdr => 'تقرير التنمية البشرية';

  @override
  String get codec => 'الترميز';

  @override
  String get videoBitrate => 'معدل البت للفيديو';

  @override
  String get track => 'مسار';

  @override
  String get channels => 'القنوات';

  @override
  String get audioBitrate => 'معدل البت الصوتي';

  @override
  String get sampleRate => 'معدل العينة';

  @override
  String get format => 'شكل';

  @override
  String get external => 'خارجي';

  @override
  String get embedded => 'مغروس';

  @override
  String castSessionError(String protocol) {
    return '$protocol خطأ في الجلسة';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'فشل تحميل تفاصيل الكتاب: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'لا يتوفر عرض EPUB داخل التطبيق على هذا النظام الأساسي حتى الآن.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'لا يمكن عرض هذا التنسيق (.$extension) داخل التطبيق حتى الآن.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'عرض المستندات المضمنة غير متاح على هذا النظام الأساسي.';

  @override
  String get couldNotOpenExternalViewer => 'لا يمكن فتح العارض الخارجي.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'فشل فتح القارئ داخل التطبيق: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'تم حفظ الإشارة المرجعية بالفعل في $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'تمت إضافة الإشارة المرجعية: $label';
  }

  @override
  String get noBookmarksYet =>
      'لا توجد إشارات مرجعية حتى الآن.\nاضغط على أيقونة الإشارة المرجعية أثناء القراءة لحفظ موقعك.';

  @override
  String get noTableOfContentsAvailable => 'لا يوجد جدول محتويات متاح';

  @override
  String pageLabel(int number) {
    return 'الصفحة $number';
  }

  @override
  String get position => 'موضع';

  @override
  String get bookReader => 'قارئ الكتاب';

  @override
  String formatExtension(String extension) {
    return 'التنسيق: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% قراءة';
  }

  @override
  String get updating => 'جارٍ التحديث...';

  @override
  String get markUnread => 'وضع علامة غير مقروءة';

  @override
  String get markAsRead => 'وضع علامة كمقروءة';

  @override
  String get reloadReader => 'إعادة تحميل القارئ';

  @override
  String get noPagesFound => 'لم يتم العثور على صفحات.';

  @override
  String get failedToDecodePageImage => 'فشل في فك ترميز صورة الصفحة.';

  @override
  String resetZoom(String zoom) {
    return 'إعادة ضبط التكبير/التصغير (${zoom}x)';
  }

  @override
  String get singlePage => 'صفحة واحدة';

  @override
  String get twoPageSpread => 'انتشار على صفحتين';

  @override
  String get addBookmark => 'إضافة إشارة مرجعية';

  @override
  String get bookmarksEllipsis => 'الإشارات المرجعية...';

  @override
  String get markedAsRead => 'تم وضع علامة كمقروءة';

  @override
  String get markedAsUnread => 'تم وضع علامة \"غير مقروءة\".';

  @override
  String failedToUpdateReadState(String error) {
    return 'فشل تحديث حالة القراءة: $error';
  }

  @override
  String get themeSystem => 'الموضوع: النظام';

  @override
  String get themeLight => 'الموضوع: نور';

  @override
  String get themeDark => 'الموضوع: الظلام';

  @override
  String get themeSepia => 'الموضوع: بني داكن';

  @override
  String get invertColorsFixedLayout => 'عكس الألوان (تخطيط ثابت)';

  @override
  String get invertColorsPdf => 'عكس الألوان (PDF)';

  @override
  String get preparingInAppReader => 'جارٍ إعداد القارئ داخل التطبيق...';

  @override
  String get pdfDataNotAvailable => 'بيانات PDF غير متوفرة.';

  @override
  String get readerFallbackModeActive => 'الوضع الاحتياطي للقارئ نشط';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'لا يمكن لهذا النظام الأساسي استضافة محرك المستندات المضمن لملفات $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'استخدم Reload Reader بعد التبديل إلى نظام أساسي مدعوم (Android وiOS وmacOS).';

  @override
  String get openExternally => 'فتح خارجيا';

  @override
  String get noEpubChaptersFound => 'لم يتم العثور على فصول EPUB.';

  @override
  String get readerNotReady => 'القارئ غير جاهز.';

  @override
  String get seriesRecordings => 'تسجيلات المسلسلات';

  @override
  String get now => 'الآن';

  @override
  String get sports => 'الرياضة';

  @override
  String get news => 'أخبار';

  @override
  String get kids => 'أطفال';

  @override
  String get premiere => 'العرض الأول';

  @override
  String get guideTimeline => 'دليل الجدول الزمني';

  @override
  String failedToLoadGuide(String error) {
    return 'فشل تحميل الدليل: $error';
  }

  @override
  String get noChannelsFound => 'لم يتم العثور على قنوات';

  @override
  String get liveBadge => 'يعيش';

  @override
  String get movie => 'فيلم';

  @override
  String get removedFromFavoriteChannels => 'تمت إزالته من القنوات المفضلة';

  @override
  String get addedToFavoriteChannels => 'تمت إضافته إلى القنوات المفضلة';

  @override
  String get failedToUpdateFavoriteChannel => 'فشل في تحديث القناة المفضلة';

  @override
  String get unfavoriteChannel => 'قناة غير مفضلة';

  @override
  String get favoriteChannel => 'القناة المفضلة';

  @override
  String get record => 'سِجِلّ';

  @override
  String get cancelRecordingAction => 'إلغاء التسجيل';

  @override
  String get programSetToRecord => 'تم ضبط البرنامج للتسجيل';

  @override
  String get recordingCancelled => 'تم إلغاء التسجيل';

  @override
  String get unableToCreateRecording => 'غير قادر على إنشاء التسجيل';

  @override
  String get watch => 'يشاهد';

  @override
  String get close => 'يغلق';

  @override
  String failedToPlayChannel(String name) {
    return 'فشل تشغيل $name';
  }

  @override
  String get failedToLoadRecordings => 'فشل في تحميل التسجيلات';

  @override
  String get scheduledInNext24Hours => 'المقرر في ال 24 ساعة القادمة';

  @override
  String get recentRecordings => 'التسجيلات الأخيرة';

  @override
  String get tvSeries => 'مسلسل تلفزيوني';

  @override
  String get failedToLoadSchedule => 'فشل تحميل الجدول الزمني';

  @override
  String get noScheduledRecordings => 'لا توجد تسجيلات مجدولة';

  @override
  String get cancelRecording => 'هل تريد إلغاء التسجيل؟';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'هل تريد إلغاء التسجيل المجدول لـ \"$name\"؟';
  }

  @override
  String get no => 'لا';

  @override
  String get yesCancel => 'نعم، إلغاء';

  @override
  String get failedToCancelRecording => 'فشل في إلغاء التسجيل';

  @override
  String get failedToLoadSeriesRecordings => 'فشل تحميل التسجيلات المتسلسلة';

  @override
  String get noSeriesRecordings => 'لا يوجد تسجيلات للمسلسل';

  @override
  String get cancelSeriesRecording => 'إلغاء تسجيل السلسلة';

  @override
  String get cancelSeriesRecordingQuestion => 'هل تريد إلغاء تسجيل المسلسل؟';

  @override
  String stopRecordingName(String name) {
    return 'هل تريد إيقاف التسجيل \"$name\"؟';
  }

  @override
  String get failedToCancelSeriesRecording => 'فشل في إلغاء تسجيل المسلسل';

  @override
  String get searchThisLibrary => 'ابحث في هذه المكتبة...';

  @override
  String get searchEllipsis => 'يبحث...';

  @override
  String noResultsForQuery(String query) {
    return 'لا توجد نتائج لـ \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'فشل البحث: $error';
  }

  @override
  String get seerr => 'سير';

  @override
  String get seerrAccountType => 'نوع حساب السير';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'محلي';

  @override
  String get savedMedia => 'الوسائط المحفوظة';

  @override
  String get tvShows => 'البرامج التلفزيونية';

  @override
  String get music => 'موسيقى';

  @override
  String get musicAlbums => 'ألبومات الموسيقى';

  @override
  String get noMediaInFilter => 'لا توجد وسائط في هذا الفلتر';

  @override
  String get noDownloadedMediaYet => 'لا توجد وسائط تم تنزيلها حتى الآن';

  @override
  String get browseLibrary => 'تصفح المكتبة';

  @override
  String get deleteDownload => 'حذف التنزيل';

  @override
  String removeItemAndFiles(String name) {
    return 'هل تريد إزالة \"$name\" وملفاته؟';
  }

  @override
  String tracksCount(int count) {
    return '$count المسارات';
  }

  @override
  String get album => 'الألبوم';

  @override
  String get playAlbum => 'تشغيل الألبوم';

  @override
  String failedToLoadAlbum(String error) {
    return 'فشل تحميل الألبوم: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'لم يتم العثور على مسارات تم تنزيلها لـ $name.';
  }

  @override
  String get season => 'موسم';

  @override
  String get errorLoadingEpisodes => 'حدث خطأ أثناء تحميل الحلقات';

  @override
  String get noDownloadedEpisodes => 'لا توجد حلقات تم تنزيلها';

  @override
  String get deleteEpisode => 'حذف الحلقة';

  @override
  String removeName(String name) {
    return 'هل تريد إزالة \"$name\"؟';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes دقيقة';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'الحلقة $number';
  }

  @override
  String get seriesNotFound => 'لم يتم العثور على السلسلة';

  @override
  String get errorLoadingSeries => 'حدث خطأ أثناء تحميل السلسلة';

  @override
  String get downloadedEpisodes => 'الحلقات التي تم تنزيلها';

  @override
  String seasonNumber(int number) {
    return 'الموسم $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'العروض الخاصة';

  @override
  String get deleteSeason => 'حذف الموسم';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'هل تريد حذف جميع الحلقات التي تم تنزيلها في $season؟';
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
  String get storageManagement => 'إدارة التخزين';

  @override
  String get storageBreakdown => 'انهيار التخزين';

  @override
  String get downloadedItems => 'العناصر التي تم تنزيلها';

  @override
  String get storageLimit => 'حد التخزين';

  @override
  String get noLimit => 'لا يوجد حد';

  @override
  String get deleteAllDownloads => 'حذف كافة التنزيلات';

  @override
  String get deleteAllDownloadsWarning =>
      'سيؤدي هذا إلى إزالة جميع ملفات الوسائط التي تم تنزيلها ولا يمكن التراجع عنها.';

  @override
  String get deleteAll => 'حذف الكل';

  @override
  String get deleteSelected => 'حذف المحدد';

  @override
  String deleteSelectedCount(int count) {
    return 'هل تريد حذف $count العناصر التي تم تنزيلها؟';
  }

  @override
  String get musicAndAudiobooks => 'الموسيقى والكتب الصوتية';

  @override
  String get images => 'الصور';

  @override
  String get database => 'قاعدة البيانات';

  @override
  String ofStorageLimit(String limit) {
    return 'من $limit الحد';
  }

  @override
  String get settings => 'إعدادات';

  @override
  String get authentication => 'المصادقة';

  @override
  String get autoLoginServerManagement =>
      'تسجيل الدخول التلقائي، وإدارة الخادم';

  @override
  String get pinCode => 'رمز التعريف الشخصي';

  @override
  String get setUpPinCodeProtection => 'قم بإعداد حماية رمز PIN';

  @override
  String get parentalControls => 'الضوابط الأبوية';

  @override
  String get contentRatingRestrictions => 'قيود تصنيف المحتوى';

  @override
  String get bitRateResolutionBehavior => 'معدل البت، القرار، السلوك';

  @override
  String get languageSizeAppearance => 'اللغة والحجم والمظهر';

  @override
  String get qualityStorage => 'الجودة والتخزين';

  @override
  String get serverSyncAndPluginStatus =>
      'مزامنة الخادم وحالة البرنامج المساعد';

  @override
  String get mediaRequestIntegration => 'تكامل طلب الوسائط';

  @override
  String get switchServer => 'تبديل الخادم';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get versionLicenses => 'الإصدار والتراخيص';

  @override
  String get account => 'حساب';

  @override
  String get signInAndSecurity => 'تسجيل الدخول والأمن';

  @override
  String get administration => 'إدارة';

  @override
  String get serverSettingsUsersLibraries =>
      'إعدادات الخادم والمستخدمين والمكتبات';

  @override
  String get customization => 'التخصيص';

  @override
  String get themeAndLayout => 'الموضوع والتخطيط';

  @override
  String get videoAndSubtitles => 'الفيديو والعناوين الفرعية';

  @override
  String get integrations => 'التكامل';

  @override
  String get pluginAndRequests => 'البرنامج المساعد والطلبات';

  @override
  String get customizeAccountPlaybackInterface =>
      'تخصيص الحساب والتشغيل وسلوك الواجهة';

  @override
  String optionsCount(int count) {
    return '$count الخيارات';
  }

  @override
  String get themeAndAppearance => 'الموضوع والمظهر';

  @override
  String get focusBorderColor => 'التركيز على لون الحدود';

  @override
  String get watchedIndicators => 'المؤشرات المشاهدة';

  @override
  String get always => 'دائماً';

  @override
  String get hideUnwatched => 'إخفاء غير مراقب';

  @override
  String get episodesOnly => 'الحلقات فقط';

  @override
  String get never => 'أبداً';

  @override
  String get focusExpansionAnimation => 'التركيز على توسيع الرسوم المتحركة';

  @override
  String get desktopUiScale => 'مقياس واجهة المستخدم لسطح المكتب';

  @override
  String get scaleFocusedCards =>
      'قم بتوسيع نطاق البطاقات والبلاطات المركزة أو التي تم تمريرها';

  @override
  String get backgroundBackdrops => 'الخلفيات الخلفية';

  @override
  String get showBackdropImages => 'إظهار الصور الخلفية خلف المحتوى';

  @override
  String get seriesThumbnails => 'الصور المصغرة للسلسلة';

  @override
  String get seriesThumbnailsDescription =>
      'الحلقات فقط: استخدم الأعمال الفنية المتسلسلة التي تتطابق مع كل نوع صورة صف';

  @override
  String get homeRowInfoOverlay => 'تراكب معلومات الصف الرئيسي';

  @override
  String get showTitleMetadataOnHomeRows =>
      'إظهار العنوان والبيانات الوصفية عند تصفح صفوف الصفحة الرئيسية';

  @override
  String get clockDisplay => 'عرض الساعة';

  @override
  String get inMenus => 'في القوائم';

  @override
  String get inVideo => 'في الفيديو';

  @override
  String get seasonalEffects => 'التأثيرات الموسمية';

  @override
  String get seasonalEffectsDescription =>
      'المؤثرات البصرية والديكورات الموسمية';

  @override
  String get snow => 'ثلج';

  @override
  String get fireworks => 'ألعاب نارية';

  @override
  String get confetti => 'حلويات';

  @override
  String get fallingLeaves => 'الأوراق المتساقطة';

  @override
  String get themeMusic => 'موضوع الموسيقى';

  @override
  String get playThemeMusicOnDetailPages =>
      'قم بتشغيل موسيقى الموضوع على صفحات التفاصيل';

  @override
  String get themeMusicVolume => 'حجم الموسيقى موضوع';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'موضوع الموسيقى على الصفوف الرئيسية';

  @override
  String get playWhenBrowsingHomeScreen => 'العب عند تصفح الشاشة الرئيسية';

  @override
  String get detailsBackgroundBlur => 'تفاصيل طمس الخلفية';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'طمس خلفية التصفح';

  @override
  String get maxStreamingBitrate => 'الحد الأقصى لمعدل البت المتدفق';

  @override
  String get maxResolution => 'ماكس القرار';

  @override
  String get playerZoomMode => 'وضع تكبير المشغل';

  @override
  String get settingsScrollWheelAction => 'Mouse scroll wheel';

  @override
  String get settingsScrollWheelActionDescription =>
      'Choose what scrolling the mouse wheel over the video does during playback.';

  @override
  String get scrollWheelActionOff => 'Off';

  @override
  String get scrollWheelActionSeek => 'Seek (forward / back)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'ملائم';

  @override
  String get autoCrop => 'الاقتصاص التلقائي';

  @override
  String get stretch => 'تمتد';

  @override
  String get refreshRateSwitching => 'تبديل معدل التحديث';

  @override
  String get disabled => 'عاجز';

  @override
  String get scaleOnTv => 'مقياس على شاشة التلفزيون';

  @override
  String get scaleOnDevice => 'مقياس على الجهاز';

  @override
  String get trickPlay => 'اللعب بالخدعة';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'إظهار الصور المصغرة للمعاينة عند البحث';

  @override
  String get showDescriptionOnPause => 'إظهار الوصف عند الإيقاف المؤقت';

  @override
  String get dimVideoShowOverview =>
      'تعتيم الفيديو وإظهار نص النظرة العامة أثناء الإيقاف المؤقت';

  @override
  String get osdLockButton => 'زر قفل OSD';

  @override
  String get osdLockButtonDescription =>
      'إظهار زر القفل الذي يمنع الإدخال باللمس حتى يتم الضغط عليه لفترة طويلة';

  @override
  String get audioBehavior => 'السلوك الصوتي';

  @override
  String get downmixToStereo => 'دوونميكس إلى ستيريو';

  @override
  String get defaultAudioLanguage => 'لغة الصوت الافتراضية';

  @override
  String get autoServerDefault => 'تلقائي (الخادم الافتراضي)';

  @override
  String get english => 'إنجليزي';

  @override
  String get spanish => 'الأسبانية';

  @override
  String get french => 'فرنسي';

  @override
  String get german => 'الألمانية';

  @override
  String get italian => 'ايطالي';

  @override
  String get portuguese => 'البرتغالية';

  @override
  String get japanese => 'اليابانية';

  @override
  String get korean => 'كوري';

  @override
  String get chinese => 'الصينية';

  @override
  String get russian => 'الروسية';

  @override
  String get arabic => 'عربي';

  @override
  String get hindi => 'الهندية';

  @override
  String get dutch => 'هولندي';

  @override
  String get swedish => 'السويدية';

  @override
  String get norwegian => 'النرويجية';

  @override
  String get danish => 'دانماركي';

  @override
  String get finnish => 'الفنلندية';

  @override
  String get polish => 'بولندي';

  @override
  String get ac3Passthrough => 'عبور AC3';

  @override
  String get dtsPassthrough => 'عبور DTS';

  @override
  String get trueHdSupport => 'دعم TrueHD';

  @override
  String get enableDtsPassthrough =>
      'صوت Bitstream DTS إلى AVR فقط؛ يتطلب دعم جهاز الاستقبال ومسار مصدر DTS';

  @override
  String get enableTrueHdAudio =>
      'تمكين صوت TrueHD (قد لا يعمل على جميع الأنظمة الأساسية)';

  @override
  String get settingsAudioOutputMode => 'وضع إخراج الصوت';

  @override
  String get settingsAudioOutputModeDescription =>
      'Choose how audio is decoded. AVR Passthrough sends raw Dolby/DTS streams to your receiver; Auto or Downmix decodes locally.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'عبور AVR';

  @override
  String get settingsAudioFallbackCodec => 'ترميز الصوت الاحتياطي';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Select the target format to transcode multi-channel audio when the source stream cannot be direct-played or passed through.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Auto Detect\n(Recommended)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Default)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Lossless)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Stereo Only)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efficient)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Lossless)';

  @override
  String get settingsMaxAudioChannels => 'Max Audio Channels';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configure the maximum channels of your audio setup. Multichannel streams exceeding this limit will downmix or transcode.';

  @override
  String get settingsMaxAudioChannelsAuto => 'Auto Detect\n(Hardware Default)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadraphonic';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'العبور (متقدم)';

  @override
  String get settingsAudioCodecPassthrough => 'عبور الترميز';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'قم بتمكين التنسيقات التي يدعمها حوض AVR أو HDMI فقط.';

  @override
  String get settingsAudioEac3Passthrough => 'عبور EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'عبور EAC3 JOC (أتموس).';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS الأساسية العبور';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA العبور';

  @override
  String get settingsAudioTrueHdPassthrough => 'عبور TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'عبور TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) إلى وحدة فك ترميز خارجية.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos عبر EAC3 (JOC) إلى وحدة فك ترميز خارجية.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (يتضمن DTS core) إلى وحدة فك ترميز خارجية.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD مع بيانات تعريف Atmos إلى وحدة فك ترميز خارجية.';

  @override
  String get settingsDetectedAudioCapabilities => 'تم الكشف عن القدرات الصوتية';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'لا تتوفر لقطة لقدرة وقت التشغيل حتى الآن.';

  @override
  String get settingsAudioRouteLabel => 'طريق';

  @override
  String get settingsAudioDecodeLabel => 'فك التشفير';

  @override
  String get settingsAudioPassthroughLabel => 'العبور';

  @override
  String get settingsAudioHdRoute => 'مسار الصوت عالي الدقة';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'بلوتوث';

  @override
  String get settingsAudioRouteSpeaker => 'المتحدث';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'التشخيص';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'مستوى الفيديو';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'نطاق الفيديو';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'برنامج ترميز الترجمة';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'برامج ترميز الصوت المسموح بها';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'برنامج ترميز الصوت HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'برنامج ترميز الصوت HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'عبور الصوت spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'مسار الصوت النشط';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'توجيه دعم الصوت عالي الدقة';

  @override
  String get nightMode => 'الوضع الليلي';

  @override
  String get compressDynamicRange => 'ضغط النطاق الديناميكي';

  @override
  String get advancedMpv => 'متقدم mpv';

  @override
  String get enableCustomMpvConf => 'تمكين mpv.conf المخصص';

  @override
  String get applyMpvConfBeforePlayback =>
      'قم بتطبيق mpv.conf المحدد من قبل المستخدم قبل بدء التشغيل';

  @override
  String get unsafeAdvancedMpvOptions => 'خيارات mpv المتقدمة غير الآمنة';

  @override
  String get unsafeMpvOptionsDescription =>
      'السماح بمجموعة أكبر من خيارات mpv. قد يعطل سلوك التشغيل.';

  @override
  String get hardwareDecoding => 'فك تشفير الأجهزة';

  @override
  String get hardwareDecodingSubtitle =>
      'قد يؤدي إلى تحسين الأداء ولكنه قد يسبب مشكلات في التشغيل على بعض الأجهزة.';

  @override
  String get nextUpAndQueuing => 'التالي للأعلى والانتظار';

  @override
  String get nextUpDisplay => 'العرض التالي';

  @override
  String get extended => 'ممتد';

  @override
  String get minimal => 'الحد الأدنى';

  @override
  String get nextUpTimeout => 'المهلة التالية';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'قائمة انتظار الوسائط';

  @override
  String get autoQueueNextEpisodes =>
      'قائمة الانتظار التلقائية للحلقات القادمة';

  @override
  String get stillWatchingPrompt => 'لا تزال تشاهد موجه';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'بعد $episodes الحلقات / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'استئناف وتخطي';

  @override
  String get resumeRewind => 'استئناف الترجيع';

  @override
  String get unpauseRewind => 'إلغاء الإيقاف المؤقت للترجيع';

  @override
  String get fiveSeconds => '5 ثواني';

  @override
  String get tenSeconds => '10 ثواني';

  @override
  String get fifteenSeconds => '15 ثانية';

  @override
  String get thirtySeconds => '30 ثانية';

  @override
  String get skipBackLength => 'تخطي طول الظهر';

  @override
  String get skipForwardLength => 'تخطي الطول للأمام';

  @override
  String get customMpvConfPath => 'مسار mpv.conf مخصص';

  @override
  String get notSetMpvConf =>
      'لم يتم ضبطه. Moonfin سيحاول mpv.conf الافتراضي في مجلدات التطبيق/البيانات.';

  @override
  String get selectMpvConf => 'حدد mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'تنطبق إعدادات النمط (الحجم واللون والإزاحة) على الترجمات النصية (SRT، VTT، TTML). تستخدم ترجمات ASS/SSA التصميم المضمن الخاص بها ما لم يتم إيقاف تشغيل \"ASS/SSA Direct Play\". لا يمكن إعادة تصميم الترجمة النقطية (PGS، DVB، VobSub).';

  @override
  String get defaultSubtitleLanguage => 'لغة الترجمة الافتراضية';

  @override
  String get defaultToNoSubtitles => 'الافتراضي إلى لا ترجمات';

  @override
  String get turnOffSubtitlesByDefault =>
      'قم بإيقاف تشغيل الترجمة بشكل افتراضي';

  @override
  String get subtitleSize => 'حجم الترجمة';

  @override
  String get textFillColor => 'لون تعبئة النص';

  @override
  String get backgroundColor => 'لون الخلفية';

  @override
  String get textStrokeColor => 'لون ضربة النص';

  @override
  String get subtitleCustomization => 'تخصيص الترجمة';

  @override
  String get subtitleCustomizationDescription => 'تخصيص مظهر الترجمة';

  @override
  String get subtitlePreviewText => 'يقفز الثعلب البني السريع فوق الكلب الكسول';

  @override
  String get verticalOffset => 'إزاحة عمودية';

  @override
  String get pgsDirectPlay => 'اللعب المباشر PGS';

  @override
  String get directPlayPgsSubtitles => 'تشغيل مباشر ترجمات PGS';

  @override
  String get assSsaDirectPlay => 'ASS/SSA اللعب المباشر';

  @override
  String get directPlayAssSsaSubtitles => 'التشغيل المباشر لترجمات ASS/SSA';

  @override
  String get white => 'أبيض';

  @override
  String get black => 'أسود';

  @override
  String get yellow => 'أصفر';

  @override
  String get green => 'أخضر';

  @override
  String get cyan => 'سماوي';

  @override
  String get red => 'أحمر';

  @override
  String get transparent => 'شفاف';

  @override
  String get semiTransparentBlack => 'أسود شبه شفاف';

  @override
  String get global => 'عالمي';

  @override
  String get desktop => 'سطح المكتب';

  @override
  String get mobile => 'متحرك';

  @override
  String get tv => 'تلفزيون';

  @override
  String loadedProfileSettings(String profile) {
    return 'تم تحميل $profile إعدادات الملف الشخصي.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'فشل تحميل $profile إعدادات الملف الشخصي.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'تمت مزامنة الإعدادات المحلية مع ملف تعريف $profile.';
  }

  @override
  String get customizationProfile => 'ملف التخصيص';

  @override
  String get customizationProfileDescription =>
      'اختر ملف التعريف لتحميله وتحريره ومزامنته. ينطبق العمومي في كل مكان ما لم يتجاوزه ملف تعريف الجهاز. تشير النقطة الخضراء إلى ملف تعريف جهازك الحالي.';

  @override
  String get loadProfile => 'تحميل الملف الشخصي';

  @override
  String get syncing => 'جارٍ المزامنة...';

  @override
  String get syncToProfile => 'المزامنة مع الملف الشخصي';

  @override
  String get profileSyncHidden => 'مزامنة الملف الشخصي مخفية';

  @override
  String get enablePluginSyncDescription =>
      'قم بتمكين Server Plugin Sync في إعدادات Plugin لإظهار عناصر التحكم في الملف الشخصي هنا.';

  @override
  String get quality => 'جودة';

  @override
  String get defaultDownloadQuality => 'جودة التنزيل الافتراضية';

  @override
  String get network => 'شبكة';

  @override
  String get wifiOnlyDownloads => 'تنزيلات WiFi فقط';

  @override
  String get onlyDownloadOnWifi => 'قم بالتنزيل فقط عند الاتصال بشبكة WiFi';

  @override
  String get storage => 'تخزين';

  @override
  String get storageUsed => 'التخزين المستخدمة';

  @override
  String get manage => 'يدير';

  @override
  String get calculating => 'جارٍ الحساب...';

  @override
  String get downloadLocation => 'تحميل الموقع';

  @override
  String get defaultLabel => 'تقصير';

  @override
  String get saveToDownloadsFolder => 'حفظ في مجلد التنزيلات';

  @override
  String get downloadsVisibleToOtherApps =>
      'التنزيلات/Moonfin - ​​مرئية للتطبيقات الأخرى';

  @override
  String get dangerZone => 'منطقة الخطر';

  @override
  String get clearAllDownloads => 'مسح كافة التنزيلات';

  @override
  String get original => 'إبداعي';

  @override
  String get changeDownloadLocation => 'تغيير موقع التنزيل';

  @override
  String get changeDownloadLocationDescription =>
      'سيتم حفظ التنزيلات الجديدة في المجلد المحدد. ستبقى التنزيلات الموجودة في موقعها الحالي ويمكن إدارتها من إعدادات التخزين.';

  @override
  String get confirm => 'يتأكد';

  @override
  String get cannotWriteToFolder =>
      'لا يمكن الكتابة إلى المجلد المحدد. الرجاء اختيار موقع مختلف أو منح أذونات التخزين.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'هل تريد الحفظ في مجلد التنزيلات؟';

  @override
  String get saveToDownloadsFolderDescription =>
      'سيتم حفظ الوسائط التي تم تنزيلها في التنزيلات/Moonfin على جهازك. ستكون هذه الملفات مرئية لتطبيقات أخرى مثل معرض الصور الخاص بك أو مشغل الموسيقى.\n\nستبقى التنزيلات الحالية في موقعها الحالي.';

  @override
  String get enable => 'يُمكَِن';

  @override
  String get clearAllDownloadsWarning =>
      'سيؤدي هذا إلى حذف جميع الوسائط التي تم تنزيلها ولا يمكن التراجع عنها.';

  @override
  String get clearAll => 'مسح الكل';

  @override
  String get navigationStyle => 'نمط التنقل';

  @override
  String get topBar => 'الشريط العلوي';

  @override
  String get leftSidebar => 'الشريط الجانبي الأيسر';

  @override
  String get showShuffleButton => 'إظهار زر خلط ورق اللعب';

  @override
  String get showGenresButton => 'إظهار زر الأنواع';

  @override
  String get showFavoritesButton => 'إظهار زر المفضلة';

  @override
  String get showLibrariesInToolbar => 'إظهار المكتبات في شريط الأدوات';

  @override
  String get showSeerrButton => 'Show Seerr Button';

  @override
  String get navbarOpacity => 'عتامة نافبار';

  @override
  String get navbarColor => 'لون شريط التنقل';

  @override
  String get gray => 'رمادي';

  @override
  String get darkBlue => 'أزرق غامق';

  @override
  String get purple => 'أرجواني';

  @override
  String get teal => 'البط البري';

  @override
  String get navy => 'البحرية';

  @override
  String get charcoal => 'فحم';

  @override
  String get brown => 'بني';

  @override
  String get darkRed => 'أحمر غامق';

  @override
  String get darkGreen => 'الأخضر الداكن';

  @override
  String get slate => 'لائحة';

  @override
  String get indigo => 'نيلي';

  @override
  String get libraryDisplay => 'عرض المكتبة';

  @override
  String get posterLabel => 'ملصق';

  @override
  String get thumbnailLabel => 'صورة مصغرة';

  @override
  String get bannerLabel => 'راية';

  @override
  String get overridePerLibrarySettings => 'تجاوز إعدادات كل مكتبة';

  @override
  String get applyImageTypeToAllLibraries =>
      'تطبيق نوع الصورة على كافة المكتبات';

  @override
  String get multiServerLibraries => 'مكتبات متعددة الخوادم';

  @override
  String get showLibrariesFromAllServers =>
      'إظهار المكتبات من كافة الخوادم المتصلة';

  @override
  String get enableFolderView => 'تمكين عرض المجلد';

  @override
  String get showFolderBrowsingOption => 'إظهار خيار تصفح المجلد';

  @override
  String get libraryVisibility => 'رؤية المكتبة';

  @override
  String get libraryVisibilityDescription =>
      'تبديل رؤية الصفحة الرئيسية لكل مكتبة. أعد تشغيل Moonfin لتصبح التغييرات سارية المفعول.';

  @override
  String get showInNavigation => 'عرض في التنقل';

  @override
  String get showInLatestMedia => 'تظهر في أحدث وسائل الإعلام';

  @override
  String get sourceLibraries => 'مكتبات المصدر';

  @override
  String get sourceCollections => 'مجموعات المصدر';

  @override
  String get excludedGenres => 'الأنواع المستبعدة';

  @override
  String get selectAll => 'حدد الكل';

  @override
  String itemsSelected(int count) {
    return '$count تم التحديد';
  }

  @override
  String get mediaBar => 'شريط الوسائط';

  @override
  String get mediaSources => 'مصادر وسائل الإعلام';

  @override
  String get behavior => 'سلوك';

  @override
  String get seconds => 'ثواني';

  @override
  String get localPreviews => 'المعاينة المحلية';

  @override
  String get localPreviewsDescription =>
      'قم بتكوين معاينات المقطع الدعائي والوسائط والصوت.';

  @override
  String get mediaBarMode => 'نمط شريط الوسائط';

  @override
  String get mediaBarModeDescription =>
      'اختر من بين أنماط متنوعة لشريط الوسائط، أو قم بإيقاف تشغيل شريط الوسائط';

  @override
  String get mediaBarModeMoonfin => 'مونفين';

  @override
  String get mediaBarModeMakd => 'ماكد';

  @override
  String get mediaBarModeOff => 'عن';

  @override
  String get enableMediaBar => 'تمكين شريط الوسائط';

  @override
  String get showFeaturedContentSlideshow =>
      'عرض شرائح المحتوى المميز في المنزل';

  @override
  String get contentType => 'نوع المحتوى';

  @override
  String get moviesAndTvShows => 'الأفلام والبرامج التلفزيونية';

  @override
  String get moviesOnly => 'أفلام فقط';

  @override
  String get tvShowsOnly => 'البرامج التلفزيونية فقط';

  @override
  String get itemCount => 'عدد العناصر';

  @override
  String get noneSelected => 'لم يتم تحديد أي شيء';

  @override
  String get noneExcluded => 'لا شيء مستبعد';

  @override
  String get autoAdvance => 'التقدم التلقائي';

  @override
  String get autoAdvanceSlides => 'التقدم تلقائيًا إلى الشريحة التالية';

  @override
  String get autoAdvanceInterval => 'الفاصل الزمني للتقدم التلقائي';

  @override
  String get trailerPreview => 'معاينة مقطورة';

  @override
  String get autoPlayTrailers =>
      'تشغيل المقطورات تلقائيًا في شريط الوسائط بعد 3 ثوانٍ';

  @override
  String get episodePreview => 'معاينة الحلقة';

  @override
  String get mediaPreview => 'معاينة الوسائط';

  @override
  String get episodePreviewDescription =>
      'قم بتشغيل معاينة مضمنة مدتها 30 ثانية على البطاقات المركزة أو التي تم تمريرها أو الضغط عليها لفترة طويلة';

  @override
  String get mediaPreviewDescription =>
      'قم بتشغيل معاينة مضمنة مدتها 30 ثانية على البطاقات المركزة أو التي تم تمريرها أو الضغط عليها لفترة طويلة';

  @override
  String get previewAudio => 'معاينة الصوت';

  @override
  String get enablePreviewAudio =>
      'تمكين الصوت لمعاينات المقطع الدعائي والحلقات';

  @override
  String get latestMedia => 'أحدث الوسائط';

  @override
  String get recentlyReleased => 'صدر مؤخرا';

  @override
  String get myMedia => 'وسائل الإعلام الخاصة بي';

  @override
  String get myMediaSmall => 'الوسائط الخاصة بي (صغير)';

  @override
  String get continueWatching => 'مواصلة المشاهدة';

  @override
  String get resumeAudio => 'استئناف الصوت';

  @override
  String get resumeBooks => 'كتب السيرة الذاتية';

  @override
  String get activeRecordings => 'التسجيلات النشطة';

  @override
  String get playlists => 'قوائم التشغيل';

  @override
  String get liveTV => 'البث التلفزيوني المباشر';

  @override
  String get homeSections => 'أقسام المنزل';

  @override
  String get resetToDefaults => 'إعادة التعيين إلى الإعدادات الافتراضية';

  @override
  String get homeRowPosterSize => 'حجم ملصق صف المنزل';

  @override
  String get perRowImageTypeSelection => 'تحديد نوع الصورة لكل صف';

  @override
  String get configureImageTypeForEachRow =>
      'قم بتكوين نوع الصورة لكل صف رئيسي ممكّن';

  @override
  String get mergeContinueWatchingAndNextUp => 'دمج، مواصلة المشاهدة والتالي';

  @override
  String get combineBothRows => 'ادمج كلا الصفين في قسم رئيسي واحد';

  @override
  String get fullScreenRows => 'Expanded Home Rows';

  @override
  String get fullScreenRowsDescription => 'Limit home rows to 1 row per screen';

  @override
  String get perRowImageType => 'نوع الصورة لكل صف';

  @override
  String get perRowSettings => 'إعدادات كل صف';

  @override
  String get autoLogin => 'تسجيل الدخول التلقائي';

  @override
  String get lastUser => 'المستخدم الأخير';

  @override
  String get currentUser => 'Current User';

  @override
  String get alwaysAuthenticate => 'المصادقة دائما';

  @override
  String get requirePasswordWithToken =>
      'تتطلب كلمة المرور حتى مع الرمز المميز المخزن';

  @override
  String get confirmExit => 'تأكيد الخروج';

  @override
  String get showConfirmationBeforeExiting => 'إظهار التأكيد قبل الخروج';

  @override
  String get blockContentWithRatings => 'حظر المحتوى بالتقييمات التالية:';

  @override
  String get noContentRatingsFound =>
      'لم يتم العثور على تقييمات المحتوى على هذا الخادم حتى الآن.';

  @override
  String get couldNotLoadServerRatings =>
      'تعذر تحميل تقييمات الخادم. عرض التقييمات المحفوظة فقط.';

  @override
  String get couldNotRefreshRatings =>
      'لا يمكن تحديث التقييمات من الخادم. عرض التقييمات المحفوظة.';

  @override
  String get enablePinCode => 'تمكين رمز PIN';

  @override
  String get requirePinToAccess => 'تتطلب رقم التعريف الشخصي للوصول إلى حسابك';

  @override
  String get changePin => 'تغيير رقم التعريف الشخصي';

  @override
  String get setNewPinCode => 'قم بتعيين رمز PIN جديد';

  @override
  String get removePin => 'قم بإزالة رقم التعريف الشخصي';

  @override
  String get removePinProtection => 'قم بإزالة حماية رمز PIN';

  @override
  String get screensaver => 'شاشة التوقف';

  @override
  String get inAppScreensaver => 'شاشة التوقف داخل التطبيق';

  @override
  String get enableBuiltInScreensaver => 'تمكين شاشة التوقف المدمجة';

  @override
  String get mode => 'وضع';

  @override
  String get libraryArt => 'فن المكتبة';

  @override
  String get logo => 'الشعار';

  @override
  String get clock => 'ساعة';

  @override
  String get timeout => 'نفذ الوقت';

  @override
  String minutesShort(int minutes) {
    return '$minutes دقيقة';
  }

  @override
  String get dimmingLevel => 'مستوى التعتيم';

  @override
  String get maxAgeRating => 'الحد الأقصى لتصنيف العمر';

  @override
  String get any => 'أي';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'يتطلب تصنيف العمر';

  @override
  String get onlyShowRatedContent => 'عرض المحتوى المُقيَّم فقط';

  @override
  String get showClock => 'عرض الساعة';

  @override
  String get displayClockDuringScreensaver => 'عرض الساعة أثناء شاشة التوقف';

  @override
  String get clockModeStatic => 'Static';

  @override
  String get clockModeBouncing => 'Bouncing';

  @override
  String get rottenTomatoesCritics => 'الطماطم الفاسدة (النقاد)';

  @override
  String get rottenTomatoesAudience => 'الطماطم الفاسدة (الجمهور)';

  @override
  String get imdb => 'شجونه';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'ميتاكريتيك';

  @override
  String get metacriticUser => 'ميتاكريتيك (مستخدم)';

  @override
  String get trakt => 'تراكت';

  @override
  String get letterboxd => 'ليتربوكسد';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'تصنيف المجتمع';

  @override
  String get ratings => 'التقييمات';

  @override
  String get additionalRatings => 'تقييمات إضافية';

  @override
  String get showMdbListAndTmdbRatings => 'عرض تقييمات MDBlist وTMDB';

  @override
  String get ratingLabels => 'تسميات التقييم';

  @override
  String get showLabelsNextToIcons => 'إظهار التسميات بجوار أيقونات التصنيف';

  @override
  String get ratingBadges => 'شارات التقييم';

  @override
  String get showDecorativeBadges => 'إظهار الشارات المزخرفة خلف التقييمات';

  @override
  String get episodeRatings => 'تقييمات الحلقة';

  @override
  String get showRatingsOnEpisodes => 'عرض التقييمات على الحلقات الفردية';

  @override
  String get ratingSources => 'مصادر التقييم';

  @override
  String get ratingSourcesDescription =>
      'تمكين وإعادة ترتيب مصادر التقييم المعروضة في التطبيق';

  @override
  String get pluginLabel => 'البرنامج المساعد';

  @override
  String get pluginDetected => 'تم اكتشاف البرنامج المساعد';

  @override
  String get pluginNotDetected => 'لم يتم الكشف عن البرنامج المساعد';

  @override
  String get pluginDetectedDescription =>
      'تم اكتشاف البرنامج المساعد للخادم. يتم تمكين المزامنة تلقائيًا عند العثور على المكون الإضافي لأول مرة.';

  @override
  String get pluginNotDetectedDescription =>
      'لم يتم الكشف عن البرنامج المساعد للخادم حاليا. لا تزال الإعدادات المحلية تستخدم القيم المحفوظة أو الإعدادات الافتراضية المضمنة.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nالإصدار: $version';
  }

  @override
  String get availableServices => 'الخدمات المتاحة';

  @override
  String get serverPluginSync => 'مزامنة البرنامج المساعد للخادم';

  @override
  String get syncSettingsWithPlugin =>
      'مزامنة الإعدادات مع البرنامج المساعد للخادم';

  @override
  String get whatSyncControls => 'ما الضوابط المزامنة';

  @override
  String get syncControlsDescription =>
      'تتحكم المزامنة فقط فيما إذا كان يتم دفع الإعدادات المدعومة بالمكونات الإضافية إلى الخادم وسحبها منه. يتم تحديد ملف التعريف وإجراءات مزامنة ملف التعريف في إعدادات التخصيص عند تمكين مزامنة البرنامج المساعد.';

  @override
  String get recentRequests => 'الطلبات الأخيرة';

  @override
  String get recentlyAdded => 'أضيفت مؤخرا';

  @override
  String get trending => 'تتجه';

  @override
  String get popularMovies => 'أفلام شعبية';

  @override
  String get movieGenres => 'أنواع الأفلام';

  @override
  String get upcomingMovies => 'الأفلام القادمة';

  @override
  String get studios => 'استوديوهات';

  @override
  String get popularSeries => 'سلسلة شعبية';

  @override
  String get seriesGenres => 'أنواع السلسلة';

  @override
  String get upcomingSeries => 'السلسلة القادمة';

  @override
  String get networks => 'الشبكات';

  @override
  String get seerrDiscoveryRows => 'Seerr Discovery Rows';

  @override
  String get resetRowsToDefaults =>
      'إعادة تعيين الصفوف إلى الإعدادات الافتراضية';

  @override
  String get enableSeerr => 'تمكين السير';

  @override
  String get showSeerrInNavigation =>
      'إظهار Serr في التنقل (يتطلب مكونًا إضافيًا للخادم)';

  @override
  String get seerrUnavailable =>
      'غير متاح نظرًا لتعطيل دعم المكون الإضافي للخادم Seerr.';

  @override
  String get nsfwFilter => 'مرشح نسفو';

  @override
  String get hideAdultContent => 'إخفاء محتوى البالغين في النتائج';

  @override
  String loggedInAs(String username) {
    return 'تم تسجيل الدخول باسم: $username';
  }

  @override
  String get discoverRows => 'اكتشف الصفوف';

  @override
  String get discoverRowsDescriptionPlugin =>
      'اسحب لإعادة الترتيب. تمكين أو تعطيل الصفوف. يتم مزامنة ترتيب الصفوف الممكّن مع المكون الإضافي Moonfin.';

  @override
  String get discoverRowsDescription =>
      'اسحب لإعادة الترتيب. تمكين أو تعطيل الصفوف.';

  @override
  String get enabled => 'ممكّن';

  @override
  String get hidden => 'مختفي';

  @override
  String get aboutTitle => 'عن';

  @override
  String versionValue(String version) {
    return 'الإصدار $version';
  }

  @override
  String get openSourceLicenses => 'تراخيص مفتوحة المصدر';

  @override
  String get sourceCode => 'كود المصدر';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'تحقق من وجود تحديثات الآن';

  @override
  String get checksLatestDesktopRelease =>
      'التحقق من أحدث إصدار لسطح المكتب لهذا النظام الأساسي';

  @override
  String get youAreUpToDate => 'أنت على اطلاع.';

  @override
  String get couldNotCheckForUpdates => 'لا يمكن التحقق من وجود تحديثات الآن.';

  @override
  String get noCompatibleUpdate =>
      'لم يتم العثور على حزمة تحديث متوافقة لهذا النظام الأساسي.';

  @override
  String get updateChecksNotSupported =>
      'عمليات التحقق من التحديث غير مدعومة على هذا النظام الأساسي.';

  @override
  String get updateNotificationsDisabled => 'تم تعطيل إشعارات التحديث.';

  @override
  String get pleaseWaitBeforeChecking => 'يرجى الانتظار قبل التحقق مرة أخرى.';

  @override
  String get latestUpdateAlreadyShown => 'تم عرض آخر تحديث بالفعل.';

  @override
  String get updateAvailable => 'التحديث متاح.';

  @override
  String updateAvailableVersion(String version) {
    return 'التحديث متاح: v$version';
  }

  @override
  String get updateNotifications => 'تحديث الإخطارات';

  @override
  String get showWhenUpdatesAvailable => 'إظهار متى تتوفر التحديثات';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version متاح';
  }

  @override
  String get readReleaseNotes => 'اقرأ ملاحظات الإصدار';

  @override
  String get downloadingUpdate => 'جارٍ تنزيل التحديث...';

  @override
  String get updateDownloadFailed =>
      'فشل تنزيل التحديث. يرجى المحاولة مرة أخرى.';

  @override
  String get openReleasesPage => 'افتح صفحة الإصدارات';

  @override
  String get navigation => 'ملاحة';

  @override
  String get watchedIndicatorsBackdrops => 'شاهدت المؤشرات والخلفيات';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'لون التركيز، المؤشرات المراقبة، الخلفيات';

  @override
  String get navbarStyleToolbarAppearance =>
      'نمط شريط التنقل، وأزرار شريط الأدوات، والمظهر';

  @override
  String get reorderToggleHomeRows => 'إعادة ترتيب وتبديل الصفوف الرئيسية';

  @override
  String get featuredContentAppearance => 'المحتوى المميز والمظهر';

  @override
  String get posterSizeImageTypeFolderView =>
      'حجم الملصق، نوع الصورة، عرض المجلد';

  @override
  String get mdbListTmdbRatingSources => 'قائمة MDB وTMDB ومصادر التصنيف';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'واضح';

  @override
  String get browse => 'تصفح';

  @override
  String get noResults => 'لا توجد نتائج';

  @override
  String get seerrAvailableStatus => 'متاح';

  @override
  String get seerrRequestedStatus => 'مطلوب';

  @override
  String itemsCount(int count) {
    return '$count العناصر';
  }

  @override
  String get seerrSettings => 'إعدادات السير';

  @override
  String get requestMore => 'اطلب المزيد';

  @override
  String get request => 'طلب';

  @override
  String get cancelRequest => 'إلغاء الطلب';

  @override
  String get playInMoonfin => 'العب في Moonfin';

  @override
  String requestedByName(String name) {
    return 'تم الطلب بواسطة $name';
  }

  @override
  String get approve => 'يعتمد';

  @override
  String get declineAction => 'انخفاض';

  @override
  String get similar => 'مشابه';

  @override
  String get recommendations => 'التوصيات';

  @override
  String cancelRequestForTitle(String title) {
    return 'إلغاء طلب \"$title\"؟';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'هل تريد إلغاء $count طلبات \"$title\"؟';
  }

  @override
  String get keep => 'يحفظ';

  @override
  String get itemNotFoundInLibrary =>
      'لم يتم العثور على العنصر في مكتبة Moonfin الخاصة بك';

  @override
  String get errorSearchingLibrary => 'خطأ في البحث في المكتبة';

  @override
  String budgetAmount(String amount) {
    return 'الميزانية: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'الإيرادات: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'طلب $type';
  }

  @override
  String get submitRequest => 'إرسال الطلب';

  @override
  String get allSeasons => 'كل المواسم';

  @override
  String get advancedOptions => 'خيارات متقدمة';

  @override
  String get noServiceServersConfigured => 'لم يتم تكوين أي خوادم خدمة';

  @override
  String get server => 'الخادم';

  @override
  String get qualityProfile => 'ملف تعريف الجودة';

  @override
  String get rootFolder => 'المجلد الجذر';

  @override
  String get showMore => 'عرض المزيد';

  @override
  String get appearances => 'المظاهر';

  @override
  String get crewSection => 'طاقم';

  @override
  String ageValue(int age) {
    return 'العمر $age';
  }

  @override
  String get noRequests => 'لا طلبات';

  @override
  String get pendingStatus => 'قيد الانتظار';

  @override
  String get declinedStatus => 'انخفض';

  @override
  String get partiallyAvailable => 'متاح جزئيا';

  @override
  String get downloadingStatus => 'جارٍ التنزيل';

  @override
  String get approvedStatus => 'موافقة';

  @override
  String get notRequestedStatus => 'غير مطلوب';

  @override
  String get blocklistedStatus => 'تم إدراجه في القائمة المحظورة';

  @override
  String get deletedStatus => 'تم الحذف';

  @override
  String get tmdbScore => 'نقاط TMDB';

  @override
  String get releaseDateLabel => 'تاريخ الافراج عنه';

  @override
  String get firstAirDateLabel => 'تاريخ الهواء الأول';

  @override
  String get revenueLabel => 'ربح';

  @override
  String get runtimeLabel => 'وقت التشغيل';

  @override
  String get budgetLabel => 'ميزانية';

  @override
  String get originalLanguageLabel => 'اللغة الأصلية';

  @override
  String get seasonsLabel => 'المواسم';

  @override
  String get episodesLabel => 'الحلقات';

  @override
  String get access => 'وصول';

  @override
  String get add => 'يضيف';

  @override
  String get address => 'عنوان';

  @override
  String get analytics => 'التحليلات';

  @override
  String get catalog => 'كتالوج';

  @override
  String get content => 'محتوى';

  @override
  String get copy => 'ينسخ';

  @override
  String get create => 'يخلق';

  @override
  String get disable => 'إبطال';

  @override
  String get done => 'منتهي';

  @override
  String get edit => 'يحرر';

  @override
  String get encoding => 'الترميز';

  @override
  String get error => 'خطأ';

  @override
  String get forward => 'إلى الأمام';

  @override
  String get general => 'عام';

  @override
  String get go => 'يذهب';

  @override
  String get install => 'ثَبَّتَ';

  @override
  String get installed => 'تم التثبيت';

  @override
  String get interval => 'فاصلة';

  @override
  String get name => 'اسم';

  @override
  String get networking => 'الشبكات';

  @override
  String get next => 'التالي';

  @override
  String get path => 'طريق';

  @override
  String get paused => 'متوقف مؤقتًا';

  @override
  String get permissions => 'الأذونات';

  @override
  String get processing => 'يعالج';

  @override
  String get profile => 'حساب تعريفي';

  @override
  String get provider => 'مزود';

  @override
  String get refresh => 'ينعش';

  @override
  String get remote => 'بعيد';

  @override
  String get rename => 'إعادة تسمية';

  @override
  String get revoke => 'إبطال';

  @override
  String get role => 'دور';

  @override
  String get root => 'جذر';

  @override
  String get run => 'يجري';

  @override
  String get search => 'يبحث';

  @override
  String get select => 'يختار';

  @override
  String get send => 'يرسل';

  @override
  String get sessions => 'الجلسات';

  @override
  String get set => 'تعيين';

  @override
  String get status => 'حالة';

  @override
  String get stop => 'قف';

  @override
  String get streaming => 'جاري';

  @override
  String get time => 'وقت';

  @override
  String get trickplay => 'خدعة';

  @override
  String get uninstall => 'إلغاء التثبيت';

  @override
  String get up => 'أعلى';

  @override
  String get update => 'تحديث';

  @override
  String get upload => 'رفع';

  @override
  String get unmute => 'إلغاء كتم الصوت';

  @override
  String get mute => 'صامت';

  @override
  String get branding => 'العلامة التجارية';

  @override
  String get adminDrawerDashboard => 'لوحة القيادة';

  @override
  String get adminDrawerAnalytics => 'التحليلات';

  @override
  String get adminDrawerSettings => 'إعدادات';

  @override
  String get adminDrawerBranding => 'العلامة التجارية';

  @override
  String get adminDrawerUsers => 'المستخدمين';

  @override
  String get adminDrawerLibraries => 'المكتبات';

  @override
  String get adminDrawerTranscoding => 'تحويل الشفرة';

  @override
  String get adminDrawerResume => 'سيرة ذاتية';

  @override
  String get adminDrawerStreaming => 'جاري';

  @override
  String get adminDrawerTrickplay => 'خدعة';

  @override
  String get adminDrawerDevices => 'الأجهزة';

  @override
  String get adminDrawerActivity => 'نشاط';

  @override
  String get adminDrawerNetworking => 'الشبكات';

  @override
  String get adminDrawerApiKeys => 'مفاتيح واجهة برمجة التطبيقات';

  @override
  String get adminDrawerBackups => 'النسخ الاحتياطية';

  @override
  String get adminDrawerLogs => 'سجلات';

  @override
  String get adminDrawerScheduledTasks => 'المهام المجدولة';

  @override
  String get adminDrawerPlugins => 'الإضافات';

  @override
  String get adminDrawerRepositories => 'المستودعات';

  @override
  String get adminDrawerLiveTv => 'البث التلفزيوني المباشر';

  @override
  String get adminExitTooltip => 'خروج المشرف';

  @override
  String get adminDashboardLoadFailed => 'فشل تحميل لوحة القيادة';

  @override
  String get adminMediaOverview => 'نظرة عامة على وسائل الإعلام';

  @override
  String get adminMediaTotalsError => 'تعذر تحميل إجماليات وسائط الخادم.';

  @override
  String get adminMediaOverviewSubtitle =>
      'قراءة سريعة حول مقدار المحتوى الموجود على هذا الخادم.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'تحديثات البرنامج المساعد المتاحة: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'المكونات الإضافية التي تتطلب إعادة التشغيل: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'فشل المهام المجدولة: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'إدخالات التحذير/الخطأ الأخيرة: $count';
  }

  @override
  String get analyticsMediaDistribution => 'توزيع الوسائط';

  @override
  String get analyticsVideoCodecs => 'برامج ترميز الفيديو';

  @override
  String get analyticsAudioCodecs => 'برامج ترميز الصوت';

  @override
  String get analyticsContainers => 'حاويات';

  @override
  String get analyticsTopGenres => 'أفضل الأنواع';

  @override
  String get analyticsReleaseYears => 'سنوات الإصدار';

  @override
  String get analyticsContentRatings => 'تقييمات المحتوى';

  @override
  String get analyticsRuntimeBuckets => 'دلاء وقت التشغيل';

  @override
  String get analyticsFileFormats => 'تنسيقات الملفات';

  @override
  String get analyticsNoData => 'لا توجد بيانات متاحة.';

  @override
  String get adminServerInfo => 'معلومات الخادم';

  @override
  String get adminRestartPending => 'إعادة التشغيل معلقة';

  @override
  String get adminServerPaths => 'مسارات الخادم';

  @override
  String get adminServerActions => 'إجراءات الخادم';

  @override
  String get adminRestartServer => 'إعادة تشغيل الخادم';

  @override
  String get adminShutdownServer => 'خادم الاغلاق';

  @override
  String get adminScanLibraries => 'مسح المكتبات';

  @override
  String get adminLibraryScanStarted => 'بدأ فحص المكتبة';

  @override
  String errorGeneric(String error) {
    return 'خطأ: $error';
  }

  @override
  String get adminServerRebootInProgress => 'جاري إعادة تشغيل الخادم';

  @override
  String get adminServerRebootMessage =>
      'جاري إعادة تشغيل الخادم، يرجى إعادة التشغيل Moonfin';

  @override
  String get adminActiveSessions => 'الجلسات النشطة';

  @override
  String get adminSessionsLoadFailed => 'فشل تحميل الجلسات';

  @override
  String get adminNoActiveSessions => 'لا توجد جلسات نشطة';

  @override
  String get adminRecentActivity => 'النشاط الأخير';

  @override
  String get adminNoRecentActivity => 'لا يوجد نشاط حديث';

  @override
  String adminCommandFailed(String error) {
    return 'فشل الأمر: $error';
  }

  @override
  String get adminSendMessage => 'أرسل رسالة';

  @override
  String get adminMessageTextHint => 'نص الرسالة';

  @override
  String get adminSetVolume => 'ضبط مستوى الصوت';

  @override
  String get sessionPrev => 'السابق';

  @override
  String get sessionRewind => 'الترجيع';

  @override
  String get sessionForward => 'إلى الأمام';

  @override
  String get sessionNext => 'التالي';

  @override
  String get sessionVolumeDown => 'المجلد –';

  @override
  String get sessionVolumeUp => 'المجلد +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'التشغيل الآن';

  @override
  String get volume => 'مقدار';

  @override
  String get actions => 'الإجراءات';

  @override
  String get videoCodec => 'برنامج ترميز الفيديو';

  @override
  String get audioCodec => 'ترميز الصوت';

  @override
  String get hwAccel => 'الأب أكسل';

  @override
  String get completion => 'انتهاء';

  @override
  String get direct => 'مباشر';

  @override
  String get adminDisconnect => 'قطع الاتصال';

  @override
  String get adminClearDates => 'تواريخ واضحة';

  @override
  String adminActivityLoadFailed(String error) {
    return 'فشل تحميل سجل النشاط: $error';
  }

  @override
  String get adminNoActivityEntries => 'لا توجد إدخالات للنشاط';

  @override
  String get adminEditDeviceName => 'تحرير اسم الجهاز';

  @override
  String get adminCustomName => 'الاسم المخصص';

  @override
  String get adminDeviceNameUpdated => 'تم تحديث اسم الجهاز';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'فشل تحديث الجهاز: $error';
  }

  @override
  String get adminDeleteDevice => 'حذف الجهاز';

  @override
  String get adminDeviceDeleted => 'تم حذف الجهاز';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'فشل حذف الجهاز: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'فشل في تحميل الأجهزة';

  @override
  String get adminSearchDevices => 'أجهزة البحث';

  @override
  String get adminThisDevice => 'هذا الجهاز';

  @override
  String get adminEditName => 'تحرير الاسم';

  @override
  String get adminLibrariesLoadFailed => 'فشل تحميل المكتبات';

  @override
  String get adminNoLibraries => 'لم يتم تكوين مكتبات';

  @override
  String get adminScanAllLibraries => 'مسح كافة المكتبات';

  @override
  String get adminAddLibrary => 'إضافة مكتبة';

  @override
  String adminScanFailed(String error) {
    return 'فشل بدء الفحص: $error';
  }

  @override
  String get adminRenameLibrary => 'إعادة تسمية المكتبة';

  @override
  String get adminNewName => 'اسم جديد';

  @override
  String adminLibraryRenamed(String name) {
    return 'تمت إعادة تسمية المكتبة إلى \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'فشلت إعادة التسمية: $error';
  }

  @override
  String get adminDeleteLibrary => 'حذف المكتبة';

  @override
  String adminLibraryDeleted(String name) {
    return 'تم حذف المكتبة \"$name\".';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'فشل حذف المكتبة: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'فشلت إضافة المسار: $error';
  }

  @override
  String get adminRemovePath => 'إزالة المسار';

  @override
  String adminRemovePathConfirm(String path) {
    return 'هل تريد إزالة \"$path\" من هذه المكتبة؟';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'فشلت إزالة المسار: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'تم حفظ خيارات المكتبة';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'فشل حفظ الخيارات: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'فشل تحميل المكتبة';

  @override
  String get adminNoMediaPaths => 'لم يتم تكوين مسارات الوسائط';

  @override
  String get adminAddPath => 'أضف المسار';

  @override
  String get adminBrowseFilesystem => 'تصفح نظام ملفات الخادم:';

  @override
  String get adminSaveOptions => 'حفظ الخيارات';

  @override
  String get adminPreferredMetadataLanguage => 'لغة البيانات الوصفية المفضلة';

  @override
  String get adminMetadataLanguageHint => 'على سبيل المثال أون، دي، الاب';

  @override
  String get adminMetadataCountryCode => 'رمز البلد للبيانات الوصفية';

  @override
  String get adminMetadataCountryHint =>
      'على سبيل المثال الولايات المتحدة، ألمانيا، فرنسا';

  @override
  String get adminLibraryNameRequired => 'اسم المكتبة مطلوب';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'فشل إنشاء المكتبة: $error';
  }

  @override
  String get adminLibraryName => 'اسم المكتبة';

  @override
  String get adminSelectedPaths => 'المسارات المحددة:';

  @override
  String get adminNoPathsAdded =>
      'لم تتم إضافة أي مسارات (يمكن إضافتها لاحقًا)';

  @override
  String get adminCreateLibrary => 'إنشاء مكتبة';

  @override
  String get paths => 'المسارات:';

  @override
  String get adminDisableUser => 'تعطيل المستخدم';

  @override
  String get adminEnableUser => 'تمكين المستخدم';

  @override
  String adminDisableUserConfirm(String name) {
    return 'هل تريد تعطيل $name؟ لن يتمكنوا من تسجيل الدخول.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'تمكين $name؟ سيكونون قادرين على تسجيل الدخول مرة أخرى.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'تم تعطيل المستخدم \"$name\".';
  }

  @override
  String adminUserEnabled(String name) {
    return 'تم تمكين المستخدم \"$name\".';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'فشل تحديث سياسة المستخدم: $error';
  }

  @override
  String get adminUsersLoadFailed => 'فشل تحميل المستخدمين';

  @override
  String get adminSearchUsers => 'بحث المستخدمين';

  @override
  String get adminEditUser => 'تحرير المستخدم';

  @override
  String get adminAddUser => 'إضافة مستخدم';

  @override
  String adminUserCreateFailed(String error) {
    return 'فشل إنشاء المستخدم: $error';
  }

  @override
  String get adminCreateUser => 'إنشاء مستخدم';

  @override
  String get adminPasswordOptional => 'كلمة المرور (اختياري)';

  @override
  String get adminUsernameRequired => 'لا يمكن أن يكون اسم المستخدم فارغًا';

  @override
  String get adminNoProfileChanges => 'لا توجد تغييرات في الملف الشخصي لحفظها';

  @override
  String get adminProfileSaved => 'تم حفظ الملف الشخصي';

  @override
  String adminSaveFailed(String error) {
    return 'فشل الحفظ: $error';
  }

  @override
  String get adminPermissionsSaved => 'تم حفظ الأذونات';

  @override
  String get adminPasswordsMismatch => 'كلمات المرور غير متطابقة';

  @override
  String adminFailed(String error) {
    return 'فشل: $error';
  }

  @override
  String get adminUserLoadFailed => 'فشل تحميل المستخدم';

  @override
  String get adminBackToUsers => 'العودة إلى المستخدمين';

  @override
  String get adminSaveProfile => 'حفظ الملف الشخصي';

  @override
  String get adminDeleteUser => 'حذف المستخدم';

  @override
  String get admin => 'مسؤل';

  @override
  String get adminFullAccessWarning =>
      'يتمتع المسؤولون بحق الوصول الكامل إلى الخادم. منح بحذر.';

  @override
  String get administrator => 'المسؤول';

  @override
  String get adminHiddenUser => 'المستخدم المخفي';

  @override
  String get adminAllowMediaPlayback => 'السماح بتشغيل الوسائط';

  @override
  String get adminAllowAudioTranscoding => 'السماح بتحويل الصوت';

  @override
  String get adminAllowVideoTranscoding => 'السماح بتحويل ترميز الفيديو';

  @override
  String get adminAllowRemuxing => 'السماح بإعادة التوزيع';

  @override
  String get adminForceRemoteTranscoding => 'فرض تحويل ترميز المصدر البعيد';

  @override
  String get adminAllowContentDeletion => 'السماح بحذف المحتوى';

  @override
  String get adminAllowContentDownloading => 'السماح بتنزيل المحتوى';

  @override
  String get adminAllowPublicSharing => 'السماح بالمشاركة العامة';

  @override
  String get adminAllowRemoteControl =>
      'السماح بالتحكم عن بعد للمستخدمين الآخرين';

  @override
  String get adminAllowSharedDeviceControl =>
      'السماح بالتحكم في الجهاز المشترك';

  @override
  String get adminAllowRemoteAccess => 'السماح بالوصول عن بعد';

  @override
  String get adminRemoteBitrateLimit =>
      'حد معدل البت للعميل البعيد (بت في الثانية)';

  @override
  String get adminLeaveEmptyNoLimit => 'اتركها فارغة بلا حدود';

  @override
  String get adminMaxActiveSessions => 'الحد الأقصى للجلسات النشطة';

  @override
  String get adminAllowLiveTvAccess =>
      'السماح بالوصول إلى البث التلفزيوني المباشر';

  @override
  String get adminAllowLiveTvManagement =>
      'السماح بإدارة البث التلفزيوني المباشر';

  @override
  String get adminAllowCollectionManagement => 'السماح بإدارة المجموعة';

  @override
  String get adminAllowSubtitleManagement => 'السماح بإدارة الترجمة';

  @override
  String get adminAllowLyricManagement => 'السماح بإدارة كلمات الأغاني';

  @override
  String get adminSavePermissions => 'حفظ الأذونات';

  @override
  String get adminEnableAllLibraryAccess => 'تمكين الوصول إلى كافة المكتبات';

  @override
  String get adminSaveAccess => 'حفظ الوصول';

  @override
  String get adminChangePassword => 'تغيير كلمة المرور';

  @override
  String get adminNewPassword => 'كلمة المرور الجديدة';

  @override
  String get adminConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get adminSetPassword => 'تعيين كلمة المرور';

  @override
  String get adminResetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get adminPasswordReset => 'إعادة تعيين كلمة المرور';

  @override
  String get adminPasswordUpdated => 'تم تحديث كلمة المرور';

  @override
  String get adminUserSettings => 'إعدادات المستخدم';

  @override
  String get adminLibraryAccess => 'الوصول إلى المكتبة';

  @override
  String get adminDeviceAndChannelAccess => 'الوصول إلى الجهاز والقناة';

  @override
  String get adminEnableAllDevices => 'تمكين الوصول إلى كافة الأجهزة';

  @override
  String get adminEnableAllChannels => 'تمكين الوصول إلى كافة القنوات';

  @override
  String get adminResetPasswordWarning =>
      'سيؤدي هذا إلى إزالة كلمة المرور. سيتمكن المستخدم من تسجيل الدخول بدون كلمة مرور.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'قام الخادم بإرجاع HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'هل أنت متأكد أنك تريد حذف $name؟';
  }

  @override
  String adminUserDeleted(String name) {
    return 'تم حذف المستخدم \"$name\".';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'فشل حذف المستخدم: $error';
  }

  @override
  String get adminCreateApiKey => 'إنشاء مفتاح API';

  @override
  String get adminAppName => 'اسم التطبيق';

  @override
  String get adminApiKeyCreated => 'تم إنشاء مفتاح API';

  @override
  String get adminApiKeyCreatedNoToken =>
      'تم إنشاء المفتاح بنجاح. لم يُرجع الخادم الرمز المميز. تحقق من مفاتيح واجهة برمجة تطبيقات الخادم.';

  @override
  String get adminKeyCopied => 'تم نسخ المفتاح إلى الحافظة';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'فشل في إنشاء المفتاح: $error';
  }

  @override
  String get adminKeyTokenMissing => 'رمز المفتاح مفقود من استجابة الخادم';

  @override
  String get adminRevokeApiKey => 'إبطال مفتاح API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'إبطال مفتاح $name؟';
  }

  @override
  String get adminApiKeyRevoked => 'تم إبطال مفتاح API';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'فشل في إبطال المفتاح: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'فشل تحميل مفاتيح API';

  @override
  String get adminApiKeysTitle => 'مفاتيح واجهة برمجة التطبيقات';

  @override
  String get adminCreateKey => 'إنشاء مفتاح';

  @override
  String get adminNoApiKeys => 'لم يتم العثور على مفاتيح API';

  @override
  String get adminUnknownApp => 'تطبيق غير معروف';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'الرمز المميز: $token\\nتم الإنشاء: $created';
  }

  @override
  String get adminCreatingBackup => 'جارٍ إنشاء نسخة احتياطية...';

  @override
  String get adminBackupCreated => 'تم إنشاء النسخة الاحتياطية بنجاح';

  @override
  String adminBackupCreateFailed(String error) {
    return 'فشل في إنشاء نسخة احتياطية: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'مسار النسخ الاحتياطي مفقود في استجابة الخادم';

  @override
  String adminBackupManifest(String name) {
    return 'البيان: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'فشل تحميل البيان: $error';
  }

  @override
  String get adminConfirmRestore => 'تأكيد الاستعادة';

  @override
  String get adminRestoringBackup => 'جارٍ استعادة النسخة الاحتياطية...';

  @override
  String adminRestoreFailed(String error) {
    return 'فشلت استعادة النسخة الاحتياطية: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'فشل تحميل النسخ الاحتياطية';

  @override
  String get adminCreateBackup => 'إنشاء نسخة احتياطية';

  @override
  String get adminNoBackups => 'لم يتم العثور على نسخ احتياطية';

  @override
  String get adminViewDetails => 'عرض التفاصيل';

  @override
  String get restore => 'يعيد';

  @override
  String get adminLogsLoadFailed => 'فشل تحميل سجلات الخادم';

  @override
  String get adminNoLogFiles => 'لم يتم العثور على ملفات السجل';

  @override
  String get adminLogCopied => 'تم نسخ السجل إلى الحافظة';

  @override
  String get adminSaveLogFile => 'حفظ ملف السجل';

  @override
  String adminSavedTo(String path) {
    return 'تم الحفظ في $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'فشل حفظ الملف: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'فشل التحميل $fileName';
  }

  @override
  String get adminSearchInLog => 'البحث في السجل';

  @override
  String get adminNoMatchingLines => 'لا توجد خطوط مطابقة';

  @override
  String adminTasksLoadFailed(String error) {
    return 'فشل تحميل المهام: $error';
  }

  @override
  String get adminNoScheduledTasks => 'لم يتم العثور على مهام مجدولة';

  @override
  String get adminNoTasksMatchFilter =>
      'لا توجد مهام تتطابق مع عامل التصفية الحالي';

  @override
  String adminTaskStartFailed(String error) {
    return 'فشل بدء المهمة: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'فشل في إيقاف المهمة: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'فشل تحميل المهمة: $error';
  }

  @override
  String get adminRunNow => 'تشغيل الآن';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'فشلت إزالة المشغل: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'فشلت إضافة المشغل: $error';
  }

  @override
  String get adminLastExecution => 'التنفيذ الأخير';

  @override
  String get adminTriggers => 'المشغلات';

  @override
  String get adminAddTrigger => 'إضافة الزناد';

  @override
  String get adminNoTriggers => 'لم يتم تكوين مشغلات';

  @override
  String get adminTriggerType => 'نوع الزناد';

  @override
  String get adminTimeLimit => 'الحد الزمني (اختياري)';

  @override
  String get adminNoLimit => 'لا يوجد حد';

  @override
  String adminHours(String hours) {
    return '$hours ساعة (ساعات)';
  }

  @override
  String get adminDayOfWeek => 'يوم من الأسبوع';

  @override
  String get adminSearchPlugins => 'بحث في الإضافات...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'فشل تبديل المكون الإضافي: $error';
  }

  @override
  String get adminUninstallPlugin => 'إلغاء تثبيت البرنامج المساعد';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'هل أنت متأكد أنك تريد إلغاء تثبيت \"$name\"؟';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'فشل إلغاء تثبيت البرنامج المساعد: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'فشل تثبيت الحزمة: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'فشل تثبيت التحديث: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'فشل تحميل المكونات الإضافية: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => 'لا توجد مكونات إضافية تطابق بحثك';

  @override
  String get adminNoPluginsInstalled => 'لم يتم تثبيت أي مكونات إضافية';

  @override
  String adminInstallUpdate(String version) {
    return 'تثبيت التحديث (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'فشل تحميل الكتالوج: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'لا توجد حزم تطابق بحثك';

  @override
  String get adminNoPackagesAvailable => 'لا توجد حزم متاحة';

  @override
  String get adminExperimentalIntegration => 'التكامل التجريبي';

  @override
  String get adminExperimentalWarning =>
      'لا يزال تكامل إعدادات البرنامج المساعد تجريبيًا. قد لا يتم عرض بعض صفحات الإعدادات بشكل صحيح.';

  @override
  String get continueAction => 'يكمل';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'ستتم إزالة \"$name\" بعد إعادة تشغيل الخادم';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'فشل إلغاء التثبيت: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'جارٍ تحديث \"$name\" إلى v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'غير قادر على فتح الإعدادات: رمز المصادقة مفقود.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'فشل تحميل البرنامج المساعد: $error';
  }

  @override
  String get adminPluginNotFound => 'لم يتم العثور على البرنامج المساعد';

  @override
  String adminPluginVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get adminEnablePlugin => 'تمكين البرنامج المساعد';

  @override
  String get adminPluginSettingsPage => 'صفحة إعدادات البرنامج المساعد';

  @override
  String get adminRevisionHistory => 'تاريخ المراجعة';

  @override
  String get adminNoChangelog => 'لا يوجد سجل التغيير متاح.';

  @override
  String get adminRemoveRepository => 'إزالة المستودع';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'هل أنت متأكد من أنك تريد إزالة \"$name\"؟';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'فشل في حفظ المستودعات: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'فشل تحميل المستودعات: $error';
  }

  @override
  String get adminRepositoryNameHint => 'على سبيل المثال Jellyfin مستقر';

  @override
  String get adminRepositoryUrl => 'عنوان URL للمستودع';

  @override
  String get adminAddEntry => 'إضافة إدخال';

  @override
  String get adminInvalidUrl => 'عنوان URL غير صالح';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'غير قادر على تحميل إعدادات البرنامج المساعد: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'لا يمكن فتح $uri';
  }

  @override
  String get adminOpenInBrowser => 'فتح في المتصفح';

  @override
  String get adminOpenExternally => 'مفتوح خارجيا';

  @override
  String get adminGeneralSettings => 'الإعدادات العامة';

  @override
  String get adminServerName => 'اسم الخادم';

  @override
  String get adminPreferredMetadataCountry => 'بلد البيانات الوصفية المفضل';

  @override
  String get adminCachePath => 'مسار ذاكرة التخزين المؤقت';

  @override
  String get adminMetadataPath => 'مسار البيانات الوصفية';

  @override
  String get adminLibraryScanConcurrency => 'مكتبة المسح التزامن';

  @override
  String get adminParallelImageEncodingLimit => 'حد ترميز الصور المتوازية';

  @override
  String get adminSlowResponseThreshold =>
      'عتبة الاستجابة البطيئة (مللي ثانية)';

  @override
  String get adminBrandingSaved => 'تم حفظ إعدادات العلامة التجارية';

  @override
  String get adminBrandingLoadFailed => 'فشل تحميل إعدادات العلامة التجارية';

  @override
  String get adminLoginDisclaimer => 'إخلاء المسؤولية عن تسجيل الدخول';

  @override
  String get adminLoginDisclaimerHint => 'يتم عرض HTML أسفل نموذج تسجيل الدخول';

  @override
  String get adminCustomCss => 'CSS مخصص';

  @override
  String get adminCustomCssHint => 'يتم تطبيق CSS المخصص على واجهة الويب';

  @override
  String get adminEnableSplashScreen => 'تمكين شاشة البداية';

  @override
  String get adminStreamingSaved => 'تم حفظ إعدادات البث';

  @override
  String get adminStreamingLoadFailed => 'فشل تحميل إعدادات البث';

  @override
  String get adminStreamingDescription =>
      'قم بتعيين حدود معدل البت المتدفق العالمي للاتصالات البعيدة.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'الحد الأقصى لمعدل البت للعميل البعيد (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'اتركه فارغًا أو 0 لعدد غير محدود';

  @override
  String get adminPlaybackSaved => 'تم حفظ إعدادات التشغيل';

  @override
  String get adminPlaybackLoadFailed => 'فشل تحميل إعدادات التشغيل';

  @override
  String get adminPlaybackTranscoding => 'تشغيل / تحويل الترميز';

  @override
  String get adminHardwareAcceleration => 'تسريع الأجهزة';

  @override
  String get adminVaapiDevice => 'جهاز VA-API';

  @override
  String get adminEnableHardwareEncoding => 'تمكين ترميز الأجهزة';

  @override
  String get adminEnableHardwareDecoding => 'تمكين فك تشفير الأجهزة لـ:';

  @override
  String get adminEncodingThreads => 'خيوط الترميز';

  @override
  String get adminAutomatic => '0 = تلقائي';

  @override
  String get adminTranscodingTempPath => 'تحويل مسار درجة الحرارة';

  @override
  String get adminEnableFallbackFont => 'تمكين الخط الاحتياطي';

  @override
  String get adminFallbackFontPath => 'مسار الخط الاحتياطي';

  @override
  String get adminAllowSegmentDeletion => 'السماح بحذف المقطع';

  @override
  String get adminSegmentKeepSeconds => 'الاحتفاظ بالمقطع (ثواني)';

  @override
  String get adminThrottleBuffering => 'خنق التخزين المؤقت';

  @override
  String get adminTrickplaySaved => 'تم حفظ إعدادات Trickplay';

  @override
  String get adminTrickplayLoadFailed => 'فشل تحميل إعدادات الخدعة';

  @override
  String get adminEnableHardwareAcceleration => 'تمكين تسريع الأجهزة';

  @override
  String get adminEnableKeyFrameExtraction =>
      'تمكين استخراج الإطار الرئيسي فقط';

  @override
  String get adminKeyFrameSubtitle => 'أسرع ولكن دقة أقل';

  @override
  String get adminScanBehavior => 'سلوك المسح';

  @override
  String get adminProcessPriority => 'أولوية العملية';

  @override
  String get adminImageSettings => 'إعدادات الصورة';

  @override
  String get adminIntervalMs => 'الفاصل الزمني (مللي ثانية)';

  @override
  String get adminCaptureFrameSubtitle => 'كم مرة لالتقاط الإطارات';

  @override
  String get adminWidthResolutions => 'قرارات العرض';

  @override
  String get adminTileWidth => 'عرض البلاط';

  @override
  String get adminTileHeight => 'ارتفاع البلاط';

  @override
  String get adminQualitySubtitle => 'القيم الأقل = جودة أفضل وملفات أكبر';

  @override
  String get adminProcessThreads => 'المواضيع العملية';

  @override
  String get adminResumeSaved => 'تم حفظ إعدادات السيرة الذاتية';

  @override
  String get adminResumeLoadFailed => 'فشل تحميل إعدادات السيرة الذاتية';

  @override
  String get adminResumeDescription =>
      'قم بالتكوين عندما يجب وضع علامة على المحتوى على أنه تم تشغيله جزئيًا أو تم تشغيله بالكامل.';

  @override
  String get adminMinResumePercentage => 'الحد الأدنى لنسبة السيرة الذاتية';

  @override
  String get adminMinResumeSubtitle =>
      'يجب تشغيل المحتوى بعد هذه النسبة لحفظ التقدم';

  @override
  String get adminMaxResumePercentage => 'الحد الأقصى لنسبة السيرة الذاتية';

  @override
  String get adminMaxResumeSubtitle =>
      'يعتبر المحتوى مشغلاً بالكامل بعد هذه النسبة';

  @override
  String get adminMinResumeDuration => 'الحد الأدنى لمدة الاستئناف (ثواني)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'العناصر الأقصر من هذا غير قابلة للاستئناف';

  @override
  String get adminMinAudiobookResume =>
      'الحد الأدنى لنسبة استئناف الكتب الصوتية';

  @override
  String get adminMaxAudiobookResume =>
      'الحد الأقصى لنسبة استئناف الكتب الصوتية';

  @override
  String get adminNetworkingSaved =>
      'تم حفظ إعدادات الشبكة. قد تكون هناك حاجة لإعادة تشغيل الخادم.';

  @override
  String get adminNetworkingLoadFailed => 'فشل تحميل إعدادات الشبكة';

  @override
  String get adminNetworkingWarning =>
      'قد تتطلب التغييرات في إعدادات الشبكة إعادة تشغيل الخادم.';

  @override
  String get adminEnableRemoteAccess => 'تمكين الوصول عن بعد';

  @override
  String get ports => 'الموانئ';

  @override
  String get adminHttpPort => 'منفذ HTTP';

  @override
  String get adminHttpsPort => 'منفذ HTTPS';

  @override
  String get adminPublicHttpsPort => 'منفذ HTTPS العام';

  @override
  String get adminBaseUrl => 'عنوان URL الأساسي';

  @override
  String get adminBaseUrlHint => 'على سبيل المثال /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'تمكين HTTPS';

  @override
  String get adminLocalNetwork => 'الشبكة المحلية';

  @override
  String get adminLocalNetworkAddresses => 'عناوين الشبكة المحلية';

  @override
  String get adminKnownProxies => 'الوكلاء المعروفون';

  @override
  String get adminRemoteIpFilter => 'مرشح IP البعيد';

  @override
  String get adminRemoteIpFilterEntries => 'مرشح IP البعيد';

  @override
  String get adminCertificatePath => 'مسار الشهادة';

  @override
  String get whitelist => 'القائمة البيضاء';

  @override
  String get blacklist => 'القائمة السوداء';

  @override
  String get notSet => 'لم يتم ضبطه';

  @override
  String get adminMetadataSaved => 'تم حفظ البيانات التعريفية';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'فشل تحميل البيانات التعريفية: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'فشل حفظ البيانات التعريفية: $error';
  }

  @override
  String get adminRefreshMetadata => 'تحديث البيانات الوصفية';

  @override
  String get recursive => 'عودي';

  @override
  String get adminReplaceAllMetadata => 'استبدال كافة البيانات الوصفية';

  @override
  String get adminReplaceAllImages => 'استبدال جميع الصور';

  @override
  String get adminMetadataRefreshRequested => 'تم طلب تحديث بيانات التعريف';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'فشل تحديث البيانات التعريفية: $error';
  }

  @override
  String get adminSearchRemotePerson => 'البحث عن شخص بعيد';

  @override
  String get adminNoRemoteMatches => 'لم يتم العثور على تطابقات بعيدة';

  @override
  String get adminRemoteResults => 'النتائج عن بعد';

  @override
  String get adminRemoteMetadataApplied => 'تم تطبيق بيانات التعريف عن بعد';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'فشل البحث عن بعد: $error';
  }

  @override
  String get adminUpdateContentType => 'تحديث نوع المحتوى';

  @override
  String get adminContentType => 'نوع المحتوى';

  @override
  String get adminContentTypeUpdated => 'تم تحديث نوع المحتوى';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'فشل تحديث نوع المحتوى: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'فشل تحميل محرر بيانات التعريف';

  @override
  String get adminNoPeopleEntries => 'لا توجد إدخالات الناس';

  @override
  String get adminNoExternalIds => 'لا توجد معرفات خارجية متاحة';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType تم تحديث الصورة';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'فشل تنزيل الصورة: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'تنسيق الصورة غير مدعوم';

  @override
  String get adminImageReadFailed => 'فشل في قراءة الصورة المحددة';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType تم تحميل الصورة';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'فشل تحميل الصورة: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'احذف الصورة $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType تم حذف الصورة';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'فشل حذف الصورة: $error';
  }

  @override
  String get adminAllProviders => 'جميع مقدمي الخدمة';

  @override
  String get adminNoRemoteImages => 'لم يتم العثور على صور عن بعد';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'فشل اكتشاف الموالف: $error';
  }

  @override
  String get adminAddTuner => 'أضف موالف';

  @override
  String get adminTunerType => 'نوع الموالف';

  @override
  String get adminTunerTypeHint => 'HDHomeRun، M3U، أخرى';

  @override
  String get adminUrlPath => 'عنوان URL/المسار';

  @override
  String get adminNameOptional => 'الاسم (اختياري)';

  @override
  String get adminTunerAdded => 'وأضاف موالف';

  @override
  String adminTunerAddFailed(String error) {
    return 'فشلت إضافة الموالف: $error';
  }

  @override
  String get adminAddGuideProvider => 'إضافة موفر الدليل';

  @override
  String get adminProviderType => 'نوع المزود';

  @override
  String get adminProviderTypeHint => 'جداول المباشر أو XMLTV';

  @override
  String get adminUsernameOptional => 'اسم المستخدم (اختياري)';

  @override
  String get adminRefreshInterval => 'الفاصل الزمني للتحديث (ساعات)';

  @override
  String get adminProviderAdded => 'تمت إضافة المزود';

  @override
  String adminProviderAddFailed(String error) {
    return 'فشلت إضافة الموفر: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'فشلت إزالة الموالف: $error';
  }

  @override
  String get adminTunerResetRequested => 'تم طلب إعادة ضبط الموالف';

  @override
  String adminTunerResetFailed(String error) {
    return 'فشلت إعادة ضبط الموالف: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'فشلت إزالة الموفر: $error';
  }

  @override
  String get adminRecordingSettings => 'إعدادات التسجيل';

  @override
  String get adminPrePadding => 'الحشو المسبق (دقائق)';

  @override
  String get adminPostPadding => 'ما بعد الحشو (دقائق)';

  @override
  String get adminRecordingPath => 'مسار التسجيل';

  @override
  String get adminSeriesRecordingPath => 'مسار تسجيل السلسلة';

  @override
  String get adminRecordingSettingsSaved => 'تم حفظ إعدادات التسجيل';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'فشل حفظ الإعدادات: $error';
  }

  @override
  String get adminSetChannelMappings => 'تعيين تعيينات القناة';

  @override
  String get adminMappingJson => 'رسم الخرائط JSON';

  @override
  String get adminMappingJsonHint => 'على سبيل المثال: تعيينات حمولة JSON';

  @override
  String get adminChannelMappingsUpdated => 'تم تحديث تعيينات القناة';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'فشل تحديث التعيينات: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'فشل تحميل إدارة البث التلفزيوني المباشر';

  @override
  String get adminTunerDevices => 'أجهزة الموالف';

  @override
  String get adminNoTunerHosts => 'لم يتم تكوين مضيفي الموالف';

  @override
  String get adminGuideProviders => 'مقدمو الدليل';

  @override
  String get adminAddProvider => 'إضافة موفر';

  @override
  String get adminNoListingProviders => 'لم يتم تكوين أي موفري بيانات';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'مسار التسجيل: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'مسار السلسلة: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'الحشو المسبق: $minutes دقيقة';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'ما بعد الحشو: $minutes دقيقة';
  }

  @override
  String get adminTunerDiscovery => 'اكتشاف موالف';

  @override
  String get adminChannelMappings => 'تعيينات القناة';

  @override
  String get adminNoDiscoveredTuners => 'لم يتم اكتشاف موالفات بعد';

  @override
  String get adminSettingsSaved => 'تم حفظ الإعدادات';

  @override
  String get adminBackupsNotAvailable =>
      'النسخ الاحتياطية غير متوفرة على بناء هذا الخادم.';

  @override
  String get adminRestoreWarning1 =>
      'ستؤدي الاستعادة إلى استبدال كافة بيانات الخادم الحالية بالبيانات الاحتياطية.';

  @override
  String get adminRestoreWarning2 =>
      'سيتم الكتابة فوق إعدادات الخادم الحالية والمستخدمين وبيانات المكتبة.';

  @override
  String get adminRestoreWarning3 => 'سيتم إعادة تشغيل الخادم بعد الاستعادة.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'هل تريد استعادة النسخة الاحتياطية $name الآن؟';
  }

  @override
  String get adminRestoreRequested =>
      'تم طلب الاستعادة. قد تؤدي إعادة تشغيل الخادم إلى قطع اتصال هذه الجلسة.';

  @override
  String get adminBackupsTitle => 'النسخ الاحتياطية';

  @override
  String get adminUnknownDate => 'تاريخ غير معروف';

  @override
  String get adminUnnamedBackup => 'نسخة احتياطية بدون اسم';

  @override
  String get adminLiveTvNotAvailable =>
      'إدارة البث التلفزيوني المباشر غير متوفرة في إصدار الخادم هذا.';

  @override
  String get adminLiveTvTitle => 'إدارة البث التلفزيوني المباشر';

  @override
  String get adminApply => 'يتقدم';

  @override
  String get adminNotSet => 'لم يتم ضبطه';

  @override
  String get adminReset => 'إعادة ضبط';

  @override
  String get adminLogsTitle => 'سجلات الخادم';

  @override
  String get adminLogsNewestFirst => 'الأحدث أولا';

  @override
  String get adminLogsOldestFirst => 'الأقدم أولاً';

  @override
  String get adminLogsJustNow => 'الآن';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutesم مضت';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours منذ ساعة';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d مضت';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'فشل التحميل $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count يطابق';
  }

  @override
  String get adminLogViewerNoMatches => 'لا توجد خطوط مطابقة';

  @override
  String get adminMetadataEditorTitle => 'محرر البيانات الوصفية';

  @override
  String get adminMetadataRemote => 'بعيد';

  @override
  String get adminMetadataType => 'يكتب';

  @override
  String get adminMetadataDetails => 'تفاصيل';

  @override
  String get adminMetadataExternalIds => 'معرفات خارجية';

  @override
  String get adminMetadataImages => 'الصور';

  @override
  String get adminMetadataFieldTitle => 'عنوان';

  @override
  String get adminMetadataFieldSortTitle => 'فرز العنوان';

  @override
  String get adminMetadataFieldOriginalTitle => 'العنوان الأصلي';

  @override
  String get adminMetadataFieldPremiereDate => 'تاريخ العرض الأول (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'تاريخ الانتهاء (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'سنة الإنتاج';

  @override
  String get adminMetadataFieldOfficialRating => 'التقييم الرسمي';

  @override
  String get adminMetadataFieldCommunityRating => 'تصنيف المجتمع';

  @override
  String get adminMetadataFieldCriticRating => 'تصنيف الناقد';

  @override
  String get adminMetadataFieldTagline => 'سطر الوصف';

  @override
  String get adminMetadataFieldOverview => 'ملخص';

  @override
  String get adminMetadataGenres => 'الأنواع';

  @override
  String get adminMetadataTags => 'العلامات';

  @override
  String get adminMetadataStudios => 'استوديوهات';

  @override
  String get adminMetadataPeople => 'الناس';

  @override
  String get adminMetadataAddGenre => 'أضف النوع';

  @override
  String get adminMetadataAddTag => 'إضافة علامة';

  @override
  String get adminMetadataAddStudio => 'أضف الاستوديو';

  @override
  String get adminMetadataAddPerson => 'إضافة شخص';

  @override
  String get adminMetadataEditPerson => 'تحرير الشخص';

  @override
  String get adminMetadataRole => 'دور';

  @override
  String get adminMetadataImagePrimary => 'أساسي';

  @override
  String get adminMetadataImageBackdrop => 'الخلفية';

  @override
  String get adminMetadataImageLogo => 'الشعار';

  @override
  String get adminMetadataImageBanner => 'راية';

  @override
  String get adminMetadataImageThumb => 'إبهام';

  @override
  String get adminMetadataRecursive => 'عودي';

  @override
  String get adminMetadataProvider => 'مزود';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType تم تحديث الصورة';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType تم تحميل الصورة';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType تم حذف الصورة';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'فشل تنزيل الصورة: $error';
  }

  @override
  String get adminMetadataImageReadFailed => 'فشل في قراءة الصورة المحددة';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'فشل تحميل الصورة: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'احذف الصورة $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'يؤدي هذا إلى إزالة الصورة الحالية من العنصر.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'فشل حذف الصورة: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'اختر صورة $imageType';
  }

  @override
  String get adminMetadataUpload => 'رفع';

  @override
  String get adminMetadataUpdate => 'تحديث';

  @override
  String get adminMetadataRemoteImage => 'الصورة عن بعد';

  @override
  String get adminPluginsInstalled => 'تم التثبيت';

  @override
  String get adminPluginsCatalog => 'كتالوج';

  @override
  String get adminPluginsActive => 'نشيط';

  @override
  String get adminPluginsRestart => 'إعادة تشغيل';

  @override
  String get adminPluginsNoSearchResults => 'لا توجد مكونات إضافية تطابق بحثك';

  @override
  String get adminPluginsNoneInstalled => 'لم يتم تثبيت أي مكونات إضافية';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'التحديث متاح: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'التحديث متاح';

  @override
  String get adminPluginsPendingRemoval =>
      'في انتظار الإزالة بعد إعادة التشغيل';

  @override
  String get adminPluginsChangesPending => 'التغييرات في انتظار إعادة التشغيل';

  @override
  String get adminPluginsEnable => 'يُمكَِن';

  @override
  String get adminPluginsDisable => 'إبطال';

  @override
  String get adminPluginsInstallUpdate => 'تثبيت التحديث';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'تثبيت التحديث (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => 'لا توجد حزم تطابق بحثك';

  @override
  String get adminPluginsCatalogEmpty => 'لا توجد حزم متاحة';

  @override
  String adminPluginsInstalling(String name) {
    return 'يتم الآن تثبيت \"$name\"...';
  }

  @override
  String get adminPluginDetailExperimental => 'التكامل التجريبي';

  @override
  String get adminPluginDetailExperimentalContent =>
      'لا يزال تكامل إعدادات البرنامج المساعد تجريبيًا. قد لا يتم عرض بعض الحقول أو التخطيطات بشكل صحيح حتى الآن.';

  @override
  String get adminPluginDetailToggle404 =>
      'فشل في تبديل البرنامج المساعد. تعذر على الخادم العثور على إصدار البرنامج المساعد هذا. حاول تحديث المكونات الإضافية، ثم أعد المحاولة.';

  @override
  String get adminPluginDetailToggleDioError =>
      'فشل في تبديل البرنامج المساعد. يرجى التحقق من سجلات الخادم للحصول على التفاصيل.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name الإعدادات';
  }

  @override
  String get adminPluginDetailDetails => 'تفاصيل';

  @override
  String get adminPluginDetailDeveloper => 'المطور';

  @override
  String get adminPluginDetailRepository => 'مستودع';

  @override
  String get adminPluginDetailBundled => 'المجمعة';

  @override
  String get adminPluginDetailEnablePlugin => 'تمكين البرنامج المساعد';

  @override
  String get adminPluginDetailRestartRequired =>
      'يلزم إعادة تشغيل الخادم حتى تدخل التغييرات حيز التنفيذ.';

  @override
  String get adminPluginDetailRemovalPending =>
      'ستتم إزالة هذا البرنامج المساعد بعد إعادة تشغيل الخادم.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'لقد حدث خلل في هذا البرنامج المساعد وقد لا يعمل بشكل صحيح.';

  @override
  String get adminPluginDetailNotSupported =>
      'هذا البرنامج المساعد غير مدعوم من قبل إصدار الخادم الحالي.';

  @override
  String get adminPluginDetailSuperseded =>
      'تم استبدال هذا البرنامج المساعد بإصدار أحدث.';

  @override
  String adminReposLoadFailed(String error) {
    return 'فشل تحميل المستودعات: $error';
  }

  @override
  String get adminReposRemoveTitle => 'إزالة المستودع';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'هل أنت متأكد من أنك تريد إزالة \"$name\"؟';
  }

  @override
  String get adminReposRemove => 'يزيل';

  @override
  String adminReposSaveFailed(String error) {
    return 'فشل في حفظ المستودعات: $error';
  }

  @override
  String get adminReposEmpty => 'لم يتم تكوين أي مستودعات';

  @override
  String get adminReposEmptySubtitle =>
      'أضف مستودعًا لتصفح المكونات الإضافية المتاحة';

  @override
  String get adminReposUnnamed => '(غير مسمى)';

  @override
  String get adminReposEditTitle => 'تحرير المستودع';

  @override
  String get adminReposAddTitle => 'إضافة مستودع';

  @override
  String get adminReposUrl => 'عنوان URL للمستودع';

  @override
  String get adminReposNameHint => 'على سبيل المثال Jellyfin مستقر';

  @override
  String get adminPluginSettingsInvalidUrl => 'عنوان URL غير صالح';

  @override
  String get adminGeneralSettingsTitle => 'الإعدادات العامة';

  @override
  String get adminGeneralMetadataLanguage => 'لغة البيانات الوصفية المفضلة';

  @override
  String get adminGeneralMetadataLanguageHint =>
      'على سبيل المثال أون، دي، الاب';

  @override
  String get adminGeneralMetadataCountry => 'بلد البيانات الوصفية المفضل';

  @override
  String get adminGeneralMetadataCountryHint =>
      'على سبيل المثال الولايات المتحدة، ألمانيا، فرنسا';

  @override
  String get adminGeneralLibraryScanConcurrency => 'مكتبة المسح التزامن';

  @override
  String get adminGeneralImageEncodingLimit => 'حد ترميز الصور المتوازية';

  @override
  String get adminUnknownError => 'خطأ غير معروف';

  @override
  String get adminBrowse => 'تصفح';

  @override
  String get adminCloseBrowser => 'إغلاق المتصفح';

  @override
  String get adminNetworkingTitle => 'الشبكات';

  @override
  String get adminNetworkingRestartWarning =>
      'قد تتطلب التغييرات في إعدادات الشبكة إعادة تشغيل الخادم.';

  @override
  String get adminNetworkingRemoteAccess => 'تمكين الوصول عن بعد';

  @override
  String get adminNetworkingPorts => 'الموانئ';

  @override
  String get adminNetworkingHttpPort => 'منفذ HTTP';

  @override
  String get adminNetworkingHttpsPort => 'منفذ HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'تمكين HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'الشبكة المحلية';

  @override
  String get adminNetworkingLocalAddresses => 'عناوين الشبكة المحلية';

  @override
  String get adminNetworkingAddressHint => 'على سبيل المثال 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'الوكلاء المعروفون';

  @override
  String get adminNetworkingProxyHint => 'على سبيل المثال 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'القائمة البيضاء';

  @override
  String get adminNetworkingBlacklist => 'القائمة السوداء';

  @override
  String get adminNetworkingAddEntry => 'إضافة إدخال';

  @override
  String get adminBrandingTitle => 'العلامة التجارية';

  @override
  String get adminBrandingLoginDisclaimer => 'إخلاء المسؤولية عن تسجيل الدخول';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'يتم عرض HTML أسفل نموذج تسجيل الدخول';

  @override
  String get adminBrandingCustomCss => 'CSS مخصص';

  @override
  String get adminBrandingCustomCssHint =>
      'يتم تطبيق CSS المخصص على واجهة الويب';

  @override
  String get adminBrandingEnableSplash => 'تمكين شاشة البداية';

  @override
  String get adminPlaybackHwAccel => 'تسريع الأجهزة';

  @override
  String get adminPlaybackHwAccelLabel => 'تسريع الأجهزة';

  @override
  String get adminPlaybackEnableHwEncoding => 'تمكين ترميز الأجهزة';

  @override
  String get adminPlaybackEnableHwDecoding => 'تمكين فك تشفير الأجهزة لـ:';

  @override
  String get adminPlaybackEncoding => 'الترميز';

  @override
  String get adminPlaybackEncodingThreads => 'خيوط الترميز';

  @override
  String get adminPlaybackFallbackFont => 'تمكين الخط الاحتياطي';

  @override
  String get adminPlaybackFallbackFontPath => 'مسار الخط الاحتياطي';

  @override
  String get adminPlaybackStreaming => 'جاري';

  @override
  String get adminResumeVideo => 'فيديو';

  @override
  String get adminResumeAudiobooks => 'كتب صوتية';

  @override
  String get adminResumeMinAudiobookPct =>
      'الحد الأدنى لنسبة استئناف الكتب الصوتية';

  @override
  String get adminResumeMaxAudiobookPct =>
      'الحد الأقصى لنسبة استئناف الكتب الصوتية';

  @override
  String get adminStreamingBitrateLimit =>
      'الحد الأقصى لمعدل البت للعميل البعيد (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'اتركه فارغًا أو 0 لعدد غير محدود';

  @override
  String get adminTrickplayHwAccel => 'تمكين تسريع الأجهزة';

  @override
  String get adminTrickplayHwEncoding => 'تمكين ترميز الأجهزة';

  @override
  String get adminTrickplayKeyFrameOnly => 'تمكين استخراج الإطار الرئيسي فقط';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'أسرع ولكن دقة أقل';

  @override
  String get adminTrickplayNonBlocking => 'عدم الحظر';

  @override
  String get adminTrickplayBlocking => 'الحظر';

  @override
  String get adminTrickplayPriorityHigh => 'عالي';

  @override
  String get adminTrickplayPriorityAboveNormal => 'فوق العادي';

  @override
  String get adminTrickplayPriorityNormal => 'طبيعي';

  @override
  String get adminTrickplayPriorityBelowNormal => 'تحت العادي';

  @override
  String get adminTrickplayPriorityIdle => 'عاطل';

  @override
  String get adminTrickplayImageSettings => 'إعدادات الصورة';

  @override
  String get adminTrickplayInterval => 'الفاصل الزمني (مللي ثانية)';

  @override
  String get adminTrickplayIntervalSubtitle => 'كم مرة لالتقاط الإطارات';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'عروض البكسل مفصولة بفواصل (على سبيل المثال 320)';

  @override
  String get adminTrickplayQuality => 'جودة';

  @override
  String get adminTrickplayQScale => 'مقياس الجودة';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'القيم الأقل = جودة أفضل وملفات أكبر';

  @override
  String get adminTrickplayJpegQuality => 'جودة JPEG';

  @override
  String get adminTrickplayProcessing => 'يعالج';

  @override
  String get adminTasksEmpty => 'لم يتم العثور على مهام مجدولة';

  @override
  String get adminTasksNoFilterMatch =>
      'لا توجد مهام تتطابق مع عامل التصفية الحالي';

  @override
  String get adminTaskCancelling => 'جارٍ الإلغاء...';

  @override
  String get adminTaskRunning => 'جري...';

  @override
  String get adminTaskNeverRun => 'لا تركض أبدًا';

  @override
  String get adminTaskStop => 'قف';

  @override
  String get adminTaskRun => 'يجري';

  @override
  String get adminTaskDetailLastExecution => 'التنفيذ الأخير';

  @override
  String get adminTaskDetailStarted => 'بدأت';

  @override
  String get adminTaskDetailEnded => 'انتهى';

  @override
  String get adminTaskDetailDuration => 'مدة';

  @override
  String get adminTaskDetailErrorLabel => 'خطأ:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'يوميًا في $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'كل $day في $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'كل $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'عند بدء تشغيل التطبيق';

  @override
  String get adminTaskTriggerTypeDaily => 'يوميًا';

  @override
  String get adminTaskTriggerTypeWeekly => 'أسبوعي';

  @override
  String get adminTaskTriggerTypeInterval => 'على فاصل زمني';

  @override
  String get adminTaskTriggerIntervalLabel => 'فاصلة';

  @override
  String get adminTaskTriggerEveryHour => 'كل ساعة';

  @override
  String get adminTaskTriggerEvery6Hours => 'كل 6 ساعات';

  @override
  String get adminTaskTriggerEvery12Hours => 'كل 12 ساعة';

  @override
  String get adminTaskTriggerEvery24Hours => 'كل 24 ساعة';

  @override
  String get adminTaskTriggerEvery2Days => 'كل يومين';

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
  String get adminTaskTriggerTime => 'وقت';

  @override
  String get adminTaskTriggerNoLimit => 'لا يوجد حد';

  @override
  String get adminActivityJustNow => 'الآن';

  @override
  String get adminActivityLastHour => 'الساعة الأخيرة';

  @override
  String get adminActivityToday => 'اليوم';

  @override
  String get adminActivityYesterday => 'أمس';

  @override
  String get adminActivityOlder => 'أقدم';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d مضت';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours منذ ساعة';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutesم مضت';
  }

  @override
  String get adminActivityNow => 'الآن';

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
      'قم بتكوين إنشاء الصور الخادعة للبحث عن الصور المصغرة للمعاينة.';

  @override
  String get adminNetworkingPublicHttpsPort => 'منفذ HTTPS العام';

  @override
  String get adminNetworkingBaseUrl => 'عنوان URL الأساسي';

  @override
  String get adminNetworkingBaseUrlHint => 'على سبيل المثال /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'مسار الشهادة';

  @override
  String get adminNetworkingRemoteIpFilter => 'مرشح IP البعيد';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'مرشح IP البعيد';

  @override
  String get adminPlaybackVaapiDevice => 'جهاز VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = تلقائي';

  @override
  String get adminPlaybackTranscodeTempPath => 'تحويل مسار درجة الحرارة';

  @override
  String get adminPlaybackSegmentDeletion => 'السماح بحذف المقطع';

  @override
  String get adminPlaybackSegmentKeep => 'الاحتفاظ بالمقطع (ثواني)';

  @override
  String get adminPlaybackThrottleBuffering => 'خنق التخزين المؤقت';

  @override
  String get adminResumeMinPct => 'الحد الأدنى لنسبة السيرة الذاتية';

  @override
  String get adminResumeMinPctSubtitle =>
      'يجب تشغيل المحتوى بعد هذه النسبة لحفظ التقدم';

  @override
  String get adminResumeMaxPct => 'الحد الأقصى لنسبة السيرة الذاتية';

  @override
  String get adminResumeMaxPctSubtitle =>
      'يعتبر المحتوى مشغلاً بالكامل بعد هذه النسبة';

  @override
  String get adminResumeMinDuration => 'الحد الأدنى لمدة الاستئناف (ثواني)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'العناصر الأقصر من هذا غير قابلة للاستئناف';

  @override
  String get adminTrickplayScanBehavior => 'سلوك المسح';

  @override
  String get adminTrickplayProcessPriority => 'أولوية العملية';

  @override
  String get adminTrickplayTileWidth => 'عرض البلاط';

  @override
  String get adminTrickplayTileHeight => 'ارتفاع البلاط';

  @override
  String get adminTrickplayProcessThreads => 'المواضيع العملية';

  @override
  String get adminTrickplayWidthResolutions => 'قرارات العرض';

  @override
  String get adminMetadataDefault => 'تقصير';

  @override
  String get adminMetadataContentTypeUpdated => 'تم تحديث نوع المحتوى';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'فشل تحديث نوع المحتوى: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'عتبة الاستجابة البطيئة (مللي ثانية)';

  @override
  String get adminGeneralCachePath => 'مسار ذاكرة التخزين المؤقت';

  @override
  String get adminGeneralMetadataPath => 'مسار البيانات الوصفية';

  @override
  String get adminGeneralServerName => 'اسم الخادم';

  @override
  String get adminSettingsLoadFailed => 'فشل تحميل الإعدادات';

  @override
  String get adminDiscover => 'يكتشف';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'فشل تحديث التعيينات: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'الحد الزمني: $duration';
  }

  @override
  String get folders => 'المجلدات';

  @override
  String get libraries => 'المكتبات';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay معطل';

  @override
  String get syncPlayDisabledMessage =>
      'قم بتمكين SyncPlay في الإعدادات لاستخدام التشغيل المتزامن.';

  @override
  String get syncPlayServerUnsupportedTitle => 'الخادم غير مدعوم';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay يتطلب خادم Jellyfin. الخادم الحالي لا يدعمه.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay المجموعة';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay المجموعة';

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
  String get syncPlayIgnoreWait => 'تجاهل الانتظار';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'لا تقم بإيقاف المجموعة أثناء تخزين هذا الجهاز مؤقتًا';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'استمر محليًا دون انتظار الأعضاء البطيئين';

  @override
  String get syncPlayRepeat => 'يكرر';

  @override
  String get syncPlayRepeatOne => 'واحد';

  @override
  String get syncPlayShuffleModeShuffled => 'خلطا';

  @override
  String get syncPlayShuffleModeSorted => 'مرتبة';

  @override
  String get syncPlaySyncCurrentQueue => 'مزامنة قائمة انتظار التشغيل الحالية';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'استبدل قائمة انتظار المجموعة بما يتم تشغيله محليًا';

  @override
  String get syncPlayLeaveGroup => 'مغادرة المجموعة';

  @override
  String get syncPlayGroupQueue => 'قائمة انتظار المجموعة';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'العنصر $index';
  }

  @override
  String get syncPlayPlayNow => 'العب الآن';

  @override
  String get syncPlayCreateNewGroup => 'إنشاء مجموعة جديدة';

  @override
  String get syncPlayGroupName => 'اسم المجموعة';

  @override
  String get syncPlayDefaultGroupName => 'مجموعتي SyncPlay مجموعتي';

  @override
  String get syncPlayCreateGroup => 'إنشاء مجموعة';

  @override
  String get syncPlayAvailableGroups => 'المجموعات المتاحة';

  @override
  String get syncPlayNoGroupsAvailable => 'لا توجد مجموعات متاحة';

  @override
  String get syncPlayJoinGroupQuestion => 'انضم إلى مجموعة SyncPlay؟';

  @override
  String get syncPlayJoinGroupWarning =>
      'قد يؤدي الانضمام إلى مجموعة SyncPlay إلى استبدال قائمة انتظار التشغيل الحالية. يكمل؟';

  @override
  String get syncPlayJoin => 'ينضم';

  @override
  String get syncPlayStateIdle => 'عاطل';

  @override
  String get syncPlayStateWaiting => 'منتظر';

  @override
  String get syncPlayStatePaused => 'متوقف مؤقتًا';

  @override
  String get syncPlayStatePlaying => 'اللعب';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return 'انضم $userName إلى مجموعة SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName غادر المجموعة SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay تم رفض الوصول';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ليس لديك حق الوصول إلى عنصر واحد أو أكثر في هذه المجموعة SyncPlay. اطلب من مالك المجموعة التحقق من أذونات المكتبة أو اختيار قائمة انتظار مختلفة.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'جارٍ مزامنة التشغيل مع $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'البحث الصوتي غير متاح.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision فشل اللعب المباشر';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'فشل التشغيل المباشر في بدء البث Dolby Vision هذا. هل تريد إعادة محاولة استخدام تحويل ترميز الخادم؟';

  @override
  String get retryWithTranscode => 'أعد المحاولة باستخدام رمز التحويل';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision غير مدعوم';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'لا يمكن لهذا الجهاز فك تشفير محتوى Dolby Vision مباشرة. استخدم HDR10 احتياطيًا أو اطلب تحويل ترميز الخادم.';

  @override
  String get rememberMyChoice => 'تذكر خياري';

  @override
  String get playHdr10Fallback => 'تشغيل HDR10 احتياطي';

  @override
  String get requestTranscode => 'طلب تحويل الرمز';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'اكتشف الصفوف المكشوفة بواسطة البرنامج المساعد \"أقسام الشاشة الرئيسية\" الخاص بـ IAmParadox27. يمكن تمكين الصفوف وإعادة ترتيبها أدناه.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'لا توجد خوادم Jellyfin تقوم بالإبلاغ عن المكون الإضافي حتى الآن.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'اكتشاف الصفوف التي تم تكوينها عبر البرنامج المساعد \"KefinTweaks\" الخاص بـ ranaldsgift. يتم عكس الأقسام المخصصة، التي تم إصدارها مؤخرًا، والمشاهدة مرة أخرى، والموسمية، والتي تمت إضافتها مؤخرًا في المكتبة من تكوين KefinTweaks على كل خادم Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'لا توجد خوادم Jellyfin تقوم بالإبلاغ عن KefinTweaks حتى الآن.';

  @override
  String get integrationOpenHomeSections => 'فتح الأقسام الرئيسية';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'تمكين الصفوف وتعطيلها وإعادة ترتيبها';

  @override
  String get integrationInstalledButDisabled => 'تم التثبيت ولكنه معطل';

  @override
  String get integrationNotInstalled => 'غير مثبت';

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
  String get seeAll => 'رؤية الكل';

  @override
  String get noItems => 'لا توجد عناصر';

  @override
  String get switchUser => 'تبديل المستخدم';

  @override
  String get remoteControl => 'التحكم عن بعد';

  @override
  String get mediaBarLoading => 'جارٍ تحميل شريط الوسائط...';

  @override
  String get mediaBarError => 'فشل تحميل شريط الوسائط';

  @override
  String get offlineServerUnavailable =>
      'متصل بالإنترنت، لكن الخادم الحالي غير متوفر.';

  @override
  String get offlineNoInternet =>
      'أنت غير متصل. المحتوى الذي تم تنزيله متاح فقط.';

  @override
  String get offlineFileNotAvailable => 'الملف غير متوفر';

  @override
  String get offlineSwitchServer => 'تبديل الخادم';

  @override
  String get offlineSavedMedia => 'الوسائط المحفوظة';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'التشغيل عن بعد';

  @override
  String castControlFailed(String error) {
    return 'فشل التحكم في الإرسال: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind عناصر التحكم';
  }

  @override
  String get castDeviceVolume => 'حجم الجهاز';

  @override
  String get castVolumeUnavailable => 'غير متاح';

  @override
  String castStopKind(String kind) {
    return 'توقف $kind';
  }

  @override
  String get audioLabel => 'صوتي';

  @override
  String get subtitlesLabel => 'ترجمات';

  @override
  String get pinConfirmTitle => 'تأكيد رقم التعريف الشخصي';

  @override
  String get pinSetTitle => 'تعيين رقم التعريف الشخصي';

  @override
  String get pinEnterTitle => 'أدخل رقم التعريف الشخصي';

  @override
  String get pinReenterToConfirm =>
      'أعد إدخال رقم التعريف الشخصي (PIN) الخاص بك للتأكيد';

  @override
  String pinEnterNDigit(int length) {
    return 'أدخل $length رقم التعريف الشخصي المكون من أرقام';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'أدخل $length رقم التعريف الشخصي الخاص بك';
  }

  @override
  String get pinIncorrect => 'رقم التعريف الشخصي غير صحيح';

  @override
  String get pinMismatch => 'أرقام التعريف الشخصية غير متطابقة';

  @override
  String get pinForgot => 'هل نسيت رقم التعريف الشخصي؟';

  @override
  String get pinClear => 'واضح';

  @override
  String get pinBackspace => 'مسافة للخلف';

  @override
  String get quickConnectAuthorized => 'طلب الاتصال السريع معتمد.';

  @override
  String get quickConnectInvalidOrExpired =>
      'رمز الاتصال السريع غير صالح أو منتهي الصلاحية.';

  @override
  String get quickConnectNotSupported =>
      'الاتصال السريع غير مدعوم على هذا الخادم.';

  @override
  String get quickConnectAuthorizeFailed => 'فشل في اعتماد رمز الاتصال السريع.';

  @override
  String get quickConnectDisabled => 'تم تعطيل الاتصال السريع على هذا الخادم.';

  @override
  String get quickConnectForbidden =>
      'لا يمكن لحسابك السماح بطلب الاتصال السريع هذا.';

  @override
  String get quickConnectNotFound =>
      'لم يتم العثور على رمز الاتصال السريع. جرب رمزًا جديدًا.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'فشل الاتصال السريع: $message';
  }

  @override
  String get quickConnectEnterCode => 'أدخل الرمز';

  @override
  String get quickConnectAuthorize => 'يأذن';

  @override
  String remoteCommandFailed(String error) {
    return 'فشل الأمر: $error';
  }

  @override
  String get remoteControlTitle => 'التحكم عن بعد';

  @override
  String get remoteFailedToLoadSessions => 'فشل تحميل الجلسات';

  @override
  String get remoteNoSessions => 'لا توجد جلسات يمكن السيطرة عليها';

  @override
  String get remoteStartPlayback => 'ابدأ التشغيل على جهاز آخر';

  @override
  String get unknownUser => 'مجهول';

  @override
  String get unknownItem => 'مجهول';

  @override
  String get remoteNothingPlaying => 'لا يوجد شيء يلعب في هذه الجلسة';

  @override
  String get castingStarted => 'بدأ الإرسال على الجهاز المحدد';

  @override
  String castingFailed(String error) {
    return 'فشل بدء الإرسال: $error';
  }

  @override
  String get noRemoteDevices => 'لا توجد أجهزة تشغيل عن بعد متاحة.';

  @override
  String get noRemoteDevicesIos =>
      'لا توجد أجهزة تشغيل عن بعد متاحة.\n\nعلى نظام التشغيل iOS، قد لا تكون الأهداف AirPlay متاحة في جهاز المحاكاة.';

  @override
  String get trackActionPlayNext => 'العب التالي';

  @override
  String get trackActionAddToQueue => 'إضافة إلى قائمة الانتظار';

  @override
  String get trackActionAddToPlaylist => 'أضف إلى قائمة التشغيل';

  @override
  String get trackActionCancelDownload => 'إلغاء التنزيل';

  @override
  String get trackActionDeleteFromPlaylist => 'حذف من قائمة التشغيل';

  @override
  String get trackActionMoveUp => 'تحرك لأعلى';

  @override
  String get trackActionMoveDown => 'تحرك للأسفل';

  @override
  String get trackActionRemoveFromFavorites => 'إزالة من المفضلة';

  @override
  String get trackActionAddToFavorites => 'أضف إلى المفضلة';

  @override
  String get trackActionGoToAlbum => 'اذهب إلى الألبوم';

  @override
  String get trackActionGoToArtist => 'اذهب إلى الفنان';

  @override
  String trackActionDownloading(String name) {
    return 'جارٍ التنزيل $name...';
  }

  @override
  String get trackActionDeletedFile => 'تم حذف الملف الذي تم تنزيله';

  @override
  String get trackActionDeleteFileFailed => 'لا يمكن حذف الملف الذي تم تنزيله';

  @override
  String get shuffleBy => 'خلط ورق اللعب بواسطة';

  @override
  String get shuffleSelectLibrary => 'حدد المكتبة';

  @override
  String get shuffleSelectGenre => 'حدد النوع';

  @override
  String get shuffleLibrary => 'مكتبة';

  @override
  String get shuffleGenre => 'النوع';

  @override
  String get shuffleNoLibraries => 'لا تتوفر مكتبات متوافقة.';

  @override
  String get shuffleNoGenres => 'لم يتم العثور على أنواع لهذا الوضع العشوائي.';

  @override
  String get posterDisplayTitle => 'عرض';

  @override
  String get posterImageType => 'نوع الصورة';

  @override
  String get imageTypePoster => 'ملصق';

  @override
  String get imageTypeThumbnail => 'صورة مصغرة';

  @override
  String get imageTypeBanner => 'راية';

  @override
  String get playlistAddFailed => 'فشلت الإضافة إلى قائمة التشغيل';

  @override
  String get playlistCreateFailed => 'فشل إنشاء قائمة التشغيل';

  @override
  String get playlistNew => 'قائمة تشغيل جديدة';

  @override
  String get playlistCreate => 'يخلق';

  @override
  String get playlistCreateNew => 'إنشاء قائمة تشغيل جديدة';

  @override
  String get playlistNoneFound => 'لم يتم العثور على قوائم التشغيل';

  @override
  String get addToPlaylist => 'أضف إلى قائمة التشغيل';

  @override
  String get lyricsNotAvailable => 'لا توجد كلمات متاحة';

  @override
  String get upNext => 'التالي';

  @override
  String get playNext => 'العب التالي';

  @override
  String get stillWatchingContent => 'تم إيقاف التشغيل مؤقتًا. هل مازلت تشاهد؟';

  @override
  String get stillWatchingStop => 'قف';

  @override
  String get stillWatchingContinue => 'يكمل';

  @override
  String skipSegment(String segment) {
    return 'تخطي $segment';
  }

  @override
  String get liveTv => 'البث التلفزيوني المباشر';

  @override
  String get continueWatchingAndNextUp => 'متابعة المشاهدة والتالي';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'جارٍ التنزيل $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'جارٍ التنزيل $fileName';
  }

  @override
  String get nextEpisode => 'الحلقة القادمة';

  @override
  String get moreFromThisSeason => 'المزيد من هذا الموسم';

  @override
  String get playerTooltipPlaybackSpeed => 'سرعة التشغيل';

  @override
  String get playerTooltipCastControls => 'ضوابط الإرسال';

  @override
  String get playerTooltipPlaybackQuality => 'معدل البت';

  @override
  String get playerTooltipEnterFullscreen => 'أدخل ملء الشاشة';

  @override
  String get playerTooltipExitFullscreen => 'الخروج من وضع ملء الشاشة';

  @override
  String get playerTooltipFloatOnTop => 'تطفو على القمة';

  @override
  String get playerTooltipExitFloatOnTop => 'تعطيل تعويم في الأعلى';

  @override
  String get playerTooltipLockLandscape => 'قفل المناظر الطبيعية';

  @override
  String get playerTooltipUnlockOrientation => 'السماح بالتناوب';

  @override
  String get playerTooltipPrevious => 'سابق';

  @override
  String get playerTooltipSeekBack => 'اطلب العودة';

  @override
  String get playerTooltipSeekForward => 'تسعى إلى الأمام';

  @override
  String get contextMenuMarkWatched => 'وضع علامة \"تمت مشاهدته\".';

  @override
  String get contextMenuMarkUnwatched => 'وضع علامة \"غير مراقب\".';

  @override
  String get contextMenuAddToFavorites => 'أضف إلى المفضلة';

  @override
  String get contextMenuRemoveFromFavorites => 'إزالة من المفضلة';

  @override
  String get contextMenuGoToSeries => 'اذهب إلى السلسلة';

  @override
  String get settingsAdministrationSubtitle => 'الوصول إلى لوحة إدارة الخادم';

  @override
  String get settingsAccountSecurity => 'الحساب والأمن';

  @override
  String get settingsAccountSecuritySubtitle =>
      'المصادقة ورمز PIN والرقابة الأبوية';

  @override
  String get settingsPersonalization => 'التخصيص';

  @override
  String get settingsPersonalizationSubtitle =>
      'السمة والملاحة والصفوف الرئيسية ورؤية المكتبة';

  @override
  String get settingsDynamicContent => 'المحتوى الديناميكي';

  @override
  String get settingsDynamicContentSubtitle =>
      'شريط الوسائط والتراكبات المرئية';

  @override
  String get settingsPlaybackSyncplay => 'التشغيل وSyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'إعدادات الصوت/الفيديو والترجمات والتنزيلات وعناصر التحكم SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'مزامنة المكونات الإضافية وSeerr والتقييمات والمزيد';

  @override
  String get settingsAboutSubtitle =>
      'إصدار التطبيق والمعلومات القانونية والاعتمادات';

  @override
  String get settingsAuthenticationSection => 'المصادقة';

  @override
  String get settingsSortServersBy => 'فرز الخوادم حسب';

  @override
  String get settingsLastUsed => 'آخر استخدام';

  @override
  String get settingsAlphabetical => 'أبجديا';

  @override
  String get settingsPrivacyAndSafetySection => 'الخصوصية والأمان';

  @override
  String get settingsBlockedRatings => 'التقييمات المحظورة';

  @override
  String get settingsGeneralStyle => 'النمط العام';

  @override
  String get settingsGeneralStyleSubtitle =>
      'لهجات السمات والخلفيات والمؤشرات التي تمت مشاهدتها وموسيقى السمات';

  @override
  String get settingsHomePage => 'الصفحة الرئيسية';

  @override
  String get settingsHomePageSubtitle =>
      'الأقسام وأنواع الصور والتراكبات ومعاينات الوسائط';

  @override
  String get settingsLibrariesSubtitle =>
      'رؤية المكتبة وعرض المجلد وسلوك الخوادم المتعددة';

  @override
  String get settingsTwentyFourHourClock => 'ساعة 24 ساعة';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'استخدم تنسيق الوقت على مدار 24 ساعة أينما تظهر الساعة';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'إظهار زر التبديل في شريط التنقل';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'إظهار زر الأنواع في شريط التنقل';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'إظهار زر المفضلة في شريط التنقل';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'إظهار زر المكتبات في شريط التنقل';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Show the Seerr button in the navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'تبديل رؤية الصفحة الرئيسية لكل مكتبة. أعد تشغيل Moonfin لتصبح التغييرات سارية المفعول.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'شريط الوسائط والمعاينة المحلية';

  @override
  String get settingsVisualOverlays => 'التراكبات المرئية';

  @override
  String get settingsSeasonalSurprise => 'مفاجأة موسمية';

  @override
  String get settingsMetadataAndRatings => 'البيانات الوصفية والتقييمات';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase يدعم عمليات التكامل على جانب الخادم بما في ذلك مصادر التصنيف الإضافية وطلبات Seerr والتفضيلات المتزامنة.';

  @override
  String get settingsOfflineDownloads => 'التنزيلات دون اتصال';

  @override
  String get settingsHigh => 'عالي';

  @override
  String get settingsLow => 'قليل';

  @override
  String get settingsCustomPath => 'مسار مخصص';

  @override
  String get settingsEnterDownloadFolderPath => 'أدخل مسار مجلد التنزيل';

  @override
  String get settingsConcurrentDownloads => 'التنزيلات المتزامنة';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'الحد الأقصى لعدد العناصر التي يمكن تنزيلها مرة واحدة.';

  @override
  String get settingsAppInfo => 'معلومات التطبيق';

  @override
  String get settingsReportAnIssue => 'الإبلاغ عن مشكلة';

  @override
  String get settingsReportAnIssueSubtitle =>
      'افتح أداة تعقب المشكلات على GitHub';

  @override
  String get settingsJoinDiscord => 'انضم إلى Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'الدردشة مع المجتمع';

  @override
  String get settingsJoinTheDiscord => 'انضم إلى Discord';

  @override
  String get settingsSupportMoonfin => 'الدعم Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'تبرع بالقهوة للمطور';

  @override
  String get settingsLegal => 'قانوني';

  @override
  String get settingsLicenses => 'التراخيص';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'إشعارات الترخيص مفتوحة المصدر';

  @override
  String get settingsPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get settingsPrivacyPolicySubtitle => 'كيف يتعامل Moonfin مع بياناتك';

  @override
  String get settingsCheckForUpdates => 'التحقق من وجود تحديثات';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'تحقق من وجود أحدث إصدار Moonfin';

  @override
  String get settingsPoweredByFlutter => 'مدعوم من رفرفة';

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
  String get settingsBoth => 'كلاهما';

  @override
  String get settingsShuffleContentTypeFilter => 'خلط مرشح نوع المحتوى';

  @override
  String get settingsVideoPlaybackPreferences => 'تفضيلات تشغيل الفيديو';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'محرك الفيديو الأساسي وإعدادات جودة البث';

  @override
  String get settingsAudioPreferences => 'تفضيلات الصوت';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'المسارات الصوتية والمعالجة وخيارات العبور';

  @override
  String get settingsAutomationAndQueue => 'الأتمتة وقائمة الانتظار';

  @override
  String get settingsAutomationAndQueueSubtitle => 'التشغيل الآلي والتسلسل';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'جودة التنزيل وحدود التخزين وحجم قائمة الانتظار';

  @override
  String get settingsSyncplaySubtitle => 'منطق المزامنة لجلسات المجموعة';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'ميزات اللاعب المتخصصة. استخدمه بحذر، لأن بعض الخيارات قد تسبب مشكلات في التشغيل';

  @override
  String get settingsSkipIntrosAndOutros => 'تخطي المقدمات والنهايات؟';

  @override
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

  @override
  String get settingsPromptUser => 'المستخدم الفوري';

  @override
  String get settingsSkip => 'يتخطى';

  @override
  String get settingsDoNothing => 'لا تفعل شيئا';

  @override
  String get settingsMaxBitrateDescription =>
      'قم بتغطية معدل البت المتدفق. سيتم تحويل المحتوى الذي يتجاوز هذا الحد إلى ملاءمته.';

  @override
  String get settingsMaxResolutionDescription =>
      'حدد الحد الأقصى للدقة التي سيطلبها اللاعب. سيتم تحويل المحتوى عالي الدقة إلى أسفل.';

  @override
  String get settingsPlayerZoomDescription =>
      'كيف ينبغي تغيير حجم الفيديو ليناسب الشاشة.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'محرك التشغيل (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'اختر محرك التشغيل الافتراضي على أجهزة Android TV. تنطبق التغييرات على جلسة التشغيل التالية.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (مستحسن)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (قديم)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (قديم)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (مستحسن)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision احتياطي';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'سلوك العناوين Dolby Vision على الأجهزة التي لا تحتوي على فك تشفير Dolby Vision.';

  @override
  String get settingsAskEachTime => 'اسأل في كل مرة';

  @override
  String get settingsPreferHdr10Fallback => 'تفضل HDR10 الاحتياطي';

  @override
  String get settingsPreferServerTranscode => 'تفضل تحويل الخادم';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision الملف الشخصي 7 اللعب المباشر';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'يتحكم في ما إذا كان Dolby Vision يجب أن يقوم تدفقات طبقة التحسين الخاصة بالملف الشخصي 7 بالتشغيل المباشر.';

  @override
  String get settingsAutoAftkrtEnabled => 'تلقائي (تمكين AFTKRT)';

  @override
  String get settingsEnabledOnThisDevice => 'تم التفعيل على هذا الجهاز';

  @override
  String get settingsDisabledPreferTranscode => 'معطل (يفضل التحويل)';

  @override
  String get settingsResumeRewindDescription =>
      'عند استئناف التشغيل (من \"متابعة المشاهدة\" أو من صفحة عنصر الوسائط)، ما هو عدد الثواني التي يجب إرجاعها؟';

  @override
  String get settingsUnpauseRewindDescription =>
      'عند استئناف التشغيل بعد الضغط على زر الإيقاف المؤقت، كم ثانية يجب إرجاعها؟';

  @override
  String get settingsSkipBackLengthDescription =>
      'كم ثانية يجب الرجوع إليها بعد الضغط على زر الترجيع.';

  @override
  String get settingsOneSecond => '1 ثانية';

  @override
  String get settingsThreeSeconds => '3 ثواني';

  @override
  String get settingsFortyFiveSeconds => '45 ثانية';

  @override
  String get settingsSixtySeconds => '60 ثانية';

  @override
  String get settingsSkipForwardLengthDescription =>
      'كم ثانية للقفز للأمام بعد الضغط على زر التقديم السريع.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 إلى وحدة فك ترميز خارجية';

  @override
  String get settingsCinemaMode => 'وضع السينما';

  @override
  String get settingsCinemaModeSubtitle =>
      'تشغيل المقطورات/الإعلانات المسبقة قبل الميزة الرئيسية';

  @override
  String get settingsNextUpDisplayDescription =>
      'يعرض Extended بطاقة كاملة تحتوي على العمل الفني للحلقة ووصفها. يظهر الحد الأدنى تراكب العد التنازلي المضغوط. معطل يخفي المطالبة بالكامل.';

  @override
  String get settingsShort => 'قصير';

  @override
  String get settingsLong => 'طويل';

  @override
  String get settingsVeryLong => 'طويل جدًا';

  @override
  String get settingsVideoStartDelay => 'تأخير بدء الفيديو';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'بث تلفزيوني مباشر';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'تمكين اللعب المباشر للتلفزيون المباشر';

  @override
  String get settingsOpenGroups => 'فتح المجموعات';

  @override
  String get settingsOpenGroupsSubtitle =>
      'قم بإنشاء مجموعات SyncPlay أو الانضمام إليها أو إدارتها';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay ممكّن';

  @override
  String get settingsSyncplayEnabledSubtitle => 'تمكين ميزات المشاهدة الجماعية';

  @override
  String get settingsSyncplayButton => 'SyncPlay زر';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'أظهر الزر SyncPlay على شريط التنقل';

  @override
  String get settingsSyncplayAdvancedCorrection => 'التصحيح المتقدم';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'تمكين منطق المزامنة الدقيق';

  @override
  String get settingsSyncplaySyncCorrection => 'تصحيح المزامنة';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'ضبط التشغيل تلقائيًا للبقاء متزامنًا';

  @override
  String get settingsSyncplaySpeedToSync => 'سرعة المزامنة';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'استخدم تعديل سرعة التشغيل للمزامنة';

  @override
  String get settingsSyncplaySkipToSync => 'انتقل إلى المزامنة';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => 'استخدم السعي للمزامنة';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'الحد الأدنى من تأخير السرعة';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'الحد الأقصى لتأخير السرعة';

  @override
  String get settingsSyncplaySpeedDuration => 'مدة السرعة';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'الحد الأدنى من تأخير التخطي';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay إزاحة إضافية';

  @override
  String get onNow => 'في الآن';

  @override
  String get collections => 'المجموعات';

  @override
  String get lastPlayed => 'آخر لعب';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'الأحدث $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'التشغيل التلقائي للحلقة القادمة';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'تشغيل الحلقة التالية تلقائيًا عندما تكون متاحة.';

  @override
  String get skipSilenceTitle => 'تخطي الصمت';

  @override
  String get skipSilenceSubtitle =>
      'تخطي مقاطع الصوت الصامتة تلقائيًا عندما يدعمها الدفق.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'السماح بالمؤثرات الصوتية الخارجية';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'السماح لتطبيقات المعادل والتأثيرات (مثل Wavelet) بالإرفاق بجلسات التشغيل Media3.';

  @override
  String get disableTunnelingTitle => 'تعطيل الأنفاق';

  @override
  String get disableTunnelingSubtitle =>
      'فرض التشغيل غير النفقي. مفيد على الأجهزة التي بها انقطاعات في الصوت/الفيديو.';

  @override
  String get enableTunnelingTitle => 'Enable tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Advanced. Routes audio and video through a coupled hardware path. Off by default because it causes audio/video dropouts on some devices.';

  @override
  String get mapDolbyVisionP7Title =>
      'قم بتعيين Dolby Vision الملف الشخصي 7 إلى HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'تشغيل Dolby Vision الملف الشخصي 7 تيارات كـ HDR10- متوافق مع HEVC على الأجهزة التي لا تحتوي على DV.';

  @override
  String get subtitlesUseEmbeddedStyles => 'استخدم أنماط الترجمة المضمنة';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'قم بتطبيق الألوان والخطوط والموضع المضمن في مسار الترجمة. قم بتعطيل استخدام تفضيلات نمط التسميات التوضيحية الخاصة بك بدلاً من ذلك.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'استخدم أحجام خطوط الترجمة المضمنة';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'قم بتطبيق تلميحات حجم الخط المضمنة في مسار الترجمة. قم بتعطيل استخدام حجم الترجمة من تفضيلات النمط الخاص بك.';

  @override
  String get useDetailedSubHeadings => 'استخدم العناوين الفرعية التفصيلية';

  @override
  String get useDetailedSubHeadingsDescription =>
      'إظهار الحواجب التفصيلية أو الحد الأدنى على صفحات المكتبة.';

  @override
  String get savedThemesDeleteDialogTitle => 'هل تريد حذف المظهر المحفوظ؟';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'هل تريد إزالة \"$themeName\" من ذاكرة التخزين المؤقت لهذا الجهاز؟';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'تم حذف \"$themeName\" من هذا الجهاز.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'تعذر حذف \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'المواضيع المحفوظة';

  @override
  String get savedThemesDescription =>
      'هذه هي السمات التي تم تنزيلها من المكون الإضافي Moonfin للخادم الحالي. يؤدي الحذف إلى إزالة هذه النسخة المحلية فقط.';

  @override
  String get savedThemesEmpty => 'لم يتم العثور على سمات محفوظة لهذا الخادم.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • نشط حاليًا';
  }

  @override
  String get savedThemesDeleteTooltip => 'حذف الموضوع المحفوظ';

  @override
  String get savedThemesManageSubtitle =>
      'إدارة سمات المكونات الإضافية التي تم تنزيلها على هذا الجهاز';

  @override
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'أقسام الشاشة الرئيسية';

  @override
  String get themeEditor => 'محرر الموضوع';

  @override
  String get themeEditorSubtitle => 'افتح Moonfin محرر السمات في متصفحك';

  @override
  String get homeScreen => 'الشاشة الرئيسية';

  @override
  String get bottomBar => 'شريط أسفل';

  @override
  String get homeRowsStyleClassic => 'كلاسيكي';

  @override
  String get homeRowsStyleModern => 'حديث';

  @override
  String get homeRowsSection => 'صفوف المنزل';

  @override
  String get homeRowDisplay => 'Home Row Display';

  @override
  String get homeRowSections => 'Home Row Sections';

  @override
  String get homeRowToggles => 'Home Row Toggles';

  @override
  String get homeRowTogglesSubtitle =>
      'Enable or disable different home row categories';

  @override
  String get homeRowTogglesDescription =>
      'Enable the following toggles to display the rows in Home Sections.';

  @override
  String get rowsType => 'نوع الصفوف';

  @override
  String get rowsTypeDescription =>
      'يحتفظ الإصدار الكلاسيكي بنوع الصورة وتراكب المعلومات لكل صف. يستخدم الحديث الصفوف العمودية للخلفية.';

  @override
  String get displayFavoritesRows => 'عرض صفوف المفضلة';

  @override
  String get displayFavoritesRowsSubtitle =>
      'إظهار الأفلام والمسلسلات المفضلة والصفوف المفضلة الأخرى في الأقسام الرئيسية.';

  @override
  String get favoritesRowSorting => 'فرز صف المفضلة';

  @override
  String get favoritesRowSortingDescription =>
      'فرز صفوف المفضلة حسب تاريخ الإضافة، وتاريخ الإصدار، أبجديًا، والمزيد.';

  @override
  String get displayCollectionsRows => 'عرض صفوف المجموعات';

  @override
  String get displayCollectionsRowsSubtitle =>
      'إظهار صفوف المجموعات في الأقسام الرئيسية.';

  @override
  String get collectionsRowSorting => 'فرز صف المجموعات';

  @override
  String get collectionsRowSortingDescription =>
      'فرز صفوف المجموعات حسب تاريخ الإضافة، وتاريخ الإصدار، أبجديًا، والمزيد.';

  @override
  String get displayGenresRows => 'عرض صفوف الأنواع';

  @override
  String get displayGenresRowsSubtitle =>
      'إظهار صفوف الأنواع في الأقسام الرئيسية.';

  @override
  String get genresRowSorting => 'تصنيف الصف الأنواع';

  @override
  String get genresRowSortingDescription =>
      'فرز صفوف الأنواع حسب تاريخ الإضافة وتاريخ الإصدار أبجديًا والمزيد.';

  @override
  String get genresRowItems => 'أنواع عناصر الصف';

  @override
  String get genresRowItemsDescription =>
      'عرض الأفلام أو المسلسلات أو كليهما في صفوف الأنواع.';

  @override
  String get displayPlaylistsRows => 'Display Playlist Rows';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Show Playlist rows in Home Sections.';

  @override
  String get playlistsRowSorting => 'Playlist Row Sorting';

  @override
  String get playlistsRowSortingDescription =>
      'Sort Playlist rows by date added, release date, alphabetically, and more.';

  @override
  String get displaySeerrRows => 'Display Seerr Discovery Rows';

  @override
  String get displaySeerrRowsSubtitle =>
      'Show Seerr discovery rows in Home Sections.';

  @override
  String get appearance => 'مظهر';

  @override
  String get cardSize => 'حجم البطاقة';

  @override
  String get externalPlayerApp => 'تطبيق مشغل خارجي';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'إظهار منتقي التطبيقات عند بدء التشغيل.';

  @override
  String get loadingInstalledPlayers => 'جارٍ تحميل اللاعبين المثبتين...';

  @override
  String get connection => 'اتصال';

  @override
  String get audioTranscodeTarget => 'هدف تحويل الصوت';

  @override
  String get passthrough => 'العبور';

  @override
  String get supportedOnThisDevice => 'المدعومة على هذا الجهاز';

  @override
  String get notSupportedOnThisDevice => 'غير مدعوم على هذا الجهاز';

  @override
  String get settingsAudioDtsXPassthrough => 'عبور DTS:X (DTS UHD).';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) إلى وحدة فك ترميز خارجية.';

  @override
  String get settingsAudioTrueHdJocPassthrough => 'TrueHD مع مرور Atmos (JOC).';

  @override
  String get mediaPlayerBehavior => 'سلوك مشغل الوسائط';

  @override
  String get playbackEnhancements => 'تحسينات التشغيل';

  @override
  String get alwaysOn => 'دائما على.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'استبدل Skip Outro بالعرض التالي';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'قم بإظهار تراكب Next Up بدلاً من زر Skip Outro.';

  @override
  String get playerRouting => 'توجيه اللاعب';

  @override
  String get preferSoftwareDecoders => 'تفضل برامج فك التشفير';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'استخدم FFmpeg (الصوت) وlibgav1 (AV1) قبل أجهزة فك ترميز الأجهزة. قم بالتعطيل في حالة انقطاع عبور الصوت عبر HDMI.';

  @override
  String get useExternalPlayer => 'استخدام مشغل خارجي';

  @override
  String get useExternalPlayerSubtitle =>
      'افتح تشغيل الفيديو في تطبيقك الخارجي المحدد على Android TV.';

  @override
  String get automaticQueuing => 'قائمة الانتظار التلقائية';

  @override
  String get preferSdhSubtitles => 'تفضل ترجمات SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'قم بإعطاء الأولوية لمسارات الترجمة SDH/CC عند التحديد التلقائي.';

  @override
  String get webDiagnostics => 'تشخيص الويب';

  @override
  String get webDiagnosticsTitle => 'Moonfin تشخيص الويب';

  @override
  String get webDiagnosticsIntro =>
      'استخدم هذه الصفحة لتشخيص مشكلات اتصال المتصفح (CORS والمحتوى المختلط وإعدادات الاكتشاف).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'تم اكتشاف فشل المحتوى المختلط';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'تم اكتشاف فشل CORS/التجربة المبدئية';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'اكتشف Moonfin صفحة HTTPS تحاول الاتصال بعنوان URL لخادم HTTP. تقوم المتصفحات بحظر هذا الطلب قبل أن يصل إلى الخادم الخاص بك.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'اكتشف Moonfin فشل طلب على مستوى المستعرض والذي يحدث عادةً بسبب فقدان CORS أو رؤوس الاختبار المبدئي على خادم الوسائط.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'عنوان URL المستهدف: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'التفاصيل: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'سياق وقت التشغيل الحالي';

  @override
  String get webDiagnosticsOrigin => 'أصل';

  @override
  String get webDiagnosticsScheme => 'مخطط';

  @override
  String get webDiagnosticsPluginMode => 'وضع البرنامج المساعد';

  @override
  String get webDiagnosticsWebRtcScan => 'مسح WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'عنوان URL للخادم القسري';

  @override
  String get webDiagnosticsDefaultServerUrl => 'عنوان URL الافتراضي للخادم';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'عنوان URL لوكيل الاكتشاف';

  @override
  String get notConfigured => 'لم يتم تكوينه';

  @override
  String get webDiagnosticsMixedContent => 'محتوى مختلط';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'تم تحميل هذه الصفحة عبر HTTPS، ولكن هناك عنوان URL واحد أو أكثر تم تكوينه هو HTTP. تمنع المتصفحات صفحات HTTPS من الاتصال بواجهات برمجة تطبيقات HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'الإصلاح: خدمة خادم الوسائط أو نقطة نهاية الوكيل عبر HTTPS، أو تحميل Moonfin عبر HTTP على الشبكات المحلية الموثوقة فقط.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'لم يتم اكتشاف أي تكوين واضح للمحتوى المختلط من إعدادات وقت التشغيل الحالية.';

  @override
  String get webDiagnosticsCorsChecklist => 'قائمة مراجعة CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• السماح بأصل المتصفح في Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• تضمين التفويض، X-Emby-التفويض، وX-Emby-الرمز المميز في Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• فضح نطاق المحتوى وقبول النطاقات للتدفق والبحث عن السلوك.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• إعادة 204 إلى طلبات الاختبار المبدئي للخيارات.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'مثال لمقتطف الرأس (نمط nginx)';

  @override
  String get note => 'ملحوظة';

  @override
  String get webDiagnosticsNonWebNote =>
      'مسار التشخيص هذا مخصص لبناء الويب. إذا كنت ترى هذا على نظام أساسي آخر، فقد لا يتم تطبيق عمليات التحقق هذه.';

  @override
  String get backToServerSelect => 'العودة إلى الخادم اختر';

  @override
  String get signOutAllUsers => 'تسجيل الخروج لجميع المستخدمين';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'تم رفض إذن الميكروفون بشكل دائم. تمكينه في إعدادات النظام.';

  @override
  String get voiceSearchPermissionRequired =>
      'مطلوب إذن الميكروفون للبحث الصوتي.';

  @override
  String get voiceSearchNoMatch => 'لم يمسك ذلك. حاول ثانية.';

  @override
  String get voiceSearchNoSpeechDetected => 'لم يتم اكتشاف أي كلام.';

  @override
  String get voiceSearchMicrophoneError => 'خطأ في الميكروفون.';

  @override
  String get voiceSearchNeedsInternet => 'البحث الصوتي يحتاج إلى الإنترنت.';

  @override
  String get voiceSearchServiceBusy => 'الخدمة الصوتية مشغولة. حاول ثانية.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'تم رفض إذن الميكروفون بشكل دائم.';

  @override
  String get microphonePermissionDenied => 'تم رفض إذن الميكروفون.';

  @override
  String get speechRecognitionUnavailable =>
      'التعرف على الكلام غير متوفر على هذا الجهاز.';

  @override
  String get openIosRoutePicker => 'افتح منتقي مسار iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay منتقي المسار غير متوفر على هذا الجهاز.';

  @override
  String get videos => 'فيديوهات';

  @override
  String get trailers => 'مقطورات';

  @override
  String get programs => 'البرامج';

  @override
  String get songs => 'أغاني';

  @override
  String get photoAlbums => 'ألبومات الصور';

  @override
  String get photos => 'صور';

  @override
  String get people => 'الناس';

  @override
  String get recentlyReleasedEpisodes => 'الحلقات التي تم إصدارها مؤخرًا';

  @override
  String get watchAgain => 'شاهد مرة أخرى';

  @override
  String get guestAppearances => 'ظهورات الضيوف';

  @override
  String get appearancesSeerr => 'المظاهر (العراف)';

  @override
  String get watchWithGroup => 'شاهد مع المجموعة';

  @override
  String get errors => 'أخطاء';

  @override
  String get warnings => 'تحذيرات';

  @override
  String get disk => 'القرص';

  @override
  String get openInBrowser => 'فتح في المتصفح';

  @override
  String get embeddedBrowserNotAvailable =>
      'المتصفح المضمن غير متوفر على هذا النظام الأساسي.';

  @override
  String get adminRestartServerConfirmation =>
      'هل أنت متأكد أنك تريد إعادة تشغيل الخادم؟';

  @override
  String get adminShutdownServerConfirmation =>
      'هل أنت متأكد أنك تريد إيقاف تشغيل الخادم؟ سوف تحتاج إلى إعادة تشغيله يدويًا.';

  @override
  String get internal => 'داخلي';

  @override
  String get idle => 'عاطل';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'لم يتم العثور على مستخدمين';

  @override
  String get adminNoUsersMatchSearch => 'لا يوجد مستخدمون يطابقون بحثك';

  @override
  String get adminNoDevicesFound => 'لم يتم العثور على أي أجهزة';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'لا توجد أجهزة تتطابق مع المرشحات الحالية';

  @override
  String get passwordSet => 'تم تعيين كلمة المرور';

  @override
  String get noPasswordConfigured => 'لم يتم تكوين كلمة مرور';

  @override
  String get remoteAccess => 'الوصول عن بعد';

  @override
  String get localOnly => 'محلي فقط';

  @override
  String get adminMediaAnalyticsLoadFailed => 'فشل تحميل تحليلات الوسائط';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'التحليلات المجمعة عبر جميع مكتبات الوسائط.';

  @override
  String get analyticsTopArtists => 'كبار الفنانين';

  @override
  String get analyticsTopAuthors => 'كبار المؤلفين';

  @override
  String get analyticsTopContributors => 'المساهمين الأساسيين';

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
      'لا تتوفر إجماليات الوسائط المفهرسة لهذا التحديد حتى الآن.';

  @override
  String get analyticsLibraryDetails => 'تفاصيل المكتبة';

  @override
  String get analyticsLibraryBreakdown => 'انهيار المكتبة';

  @override
  String get analyticsNoLibrariesAvailable => 'لا توجد مكتبات متاحة.';

  @override
  String get adminServerAdministrationTitle => 'إدارة الخادم';

  @override
  String get adminServerPathData => 'بيانات';

  @override
  String get adminServerPathImageCache => 'ذاكرة التخزين المؤقت للصورة';

  @override
  String get adminServerPathCache => 'مخبأ';

  @override
  String get adminServerPathLogs => 'سجلات';

  @override
  String get adminServerPathMetadata => 'البيانات الوصفية';

  @override
  String get adminServerPathTranscode => 'تحويل الشفرة';

  @override
  String get adminServerPathWeb => 'ويب';

  @override
  String get adminNoServerPathsReturned =>
      'لم يتم إرجاع أي مسارات خادم بواسطة هذا الخادم.';

  @override
  String adminPercentUsed(int percent) {
    return 'تم استخدام $percent%';
  }

  @override
  String get userActivity => 'نشاط المستخدم';

  @override
  String get systemEvents => 'أحداث النظام';

  @override
  String get needsAttention => 'يحتاج إلى اهتمام';

  @override
  String get adminDrawerSectionServer => 'الخادم';

  @override
  String get adminDrawerSectionPlayback => 'التشغيل';

  @override
  String get adminDrawerSectionDevices => 'الأجهزة';

  @override
  String get adminDrawerSectionAdvanced => 'متقدم';

  @override
  String get adminDrawerSectionPlugins => 'الإضافات';

  @override
  String get adminDrawerSectionLiveTv => 'البث التلفزيوني المباشر';

  @override
  String get homeVideos => 'فيديوهات منزلية';

  @override
  String get mixedContent => 'محتوى مختلط';

  @override
  String get homeVideosAndPhotos => 'فيديو وصور منزلية';

  @override
  String get mixedMoviesAndShows => 'أفلام وعروض مختلطة';

  @override
  String get intelQuickSync => 'إنتل مزامنة سريعة';

  @override
  String get rockchipMpp => 'روكشيب MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'لم يتم العثور على تسجيلات';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'لم يتم العثور على صفحات صور داخل أرشيف .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'فشل العارض المضمن ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'فشل عارض EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'الملف المحلي المفقود للقارئ: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status أثناء فتح بيانات الكتاب من $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'لا تتوفر نقطة نهاية للكتاب القابل للقراءة';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'تنسيق أرشيف القصص المصورة غير مدعوم: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'البرنامج المساعد لاستخراج CBR غير متوفر على هذا النظام الأساسي.';

  @override
  String get failedToExtractCbrArchive => 'فشل في استخراج أرشيف .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'استخراج CB7 غير متوفر على هذه المنصة.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'البرنامج المساعد لاستخراج CB7 غير متوفر على هذا النظام الأساسي.';

  @override
  String get closeGenrePanel => 'إغلاق لوحة النوع';

  @override
  String get loadingShuffle => 'جارٍ التحميل العشوائي...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'التبديل التلقائي لتقنية HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'تمكين HDR تلقائيًا لتشغيل فيديو HDR واستعادة وضع العرض عند الخروج.';

  @override
  String get whenFullscreen => 'عندما ملء الشاشة';

  @override
  String get transcodingLimits => 'حدود تحويل الترميز';
}
