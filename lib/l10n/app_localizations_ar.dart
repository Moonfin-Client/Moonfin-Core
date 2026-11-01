// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

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
  String get interfaceLanguage => 'لغة الواجهة';

  @override
  String get systemLanguageDefault => 'افتراضي النظام';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'فارغ';

  @override
  String connectingToServer(String serverName) {
    return 'الاتصال بـ $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get waitingForAuthorization => 'في انتظار الترخيص...';

  @override
  String get back => 'رجوع';

  @override
  String get serverUnavailable => 'الخادم غير متوفر';

  @override
  String get loginFailed => 'فشل تسجيل الدخول';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

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
  String get remove => 'إزالة';

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
  String get detailScreenStyle => 'شكل صفحة التفاصيل';

  @override
  String get detailScreenStyleSubtitle =>
      'الكلاسيكي هو تخطيط Moonfin الأصلي المتمركز. الحديث تخطيط سينمائي متجاوب.';

  @override
  String get detailScreenStyleMoonfin => 'كلاسيكي';

  @override
  String get detailScreenStyleModern => 'حديث';

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
  String get expandedTabs => 'علامات تبويب موسّعة';

  @override
  String get expandedTabsSubtitle =>
      'عرض محتوى علامة التبويب تلقائيًا أثناء تصفّح العلامات. عطّل الخيار لفتح كل علامة تبويب وإغلاقها يدويًا.';

  @override
  String get showTechnicalDetails => 'عرض التفاصيل التقنية؟';

  @override
  String get showTechnicalDetailsSubtitle =>
      'عرض معلومات الترميز والدقة والبث في ملخص اللافتة';

  @override
  String get recommendationSystem => 'نظام التوصيات';

  @override
  String get recommendationSystemSubtitle =>
      'استخدم خوارزمية المكتبة المحلية Moonfin Recommends أو مقاييس التشابه من TMDb عبر الإنترنت. ملاحظة: تتطلب التوصيات عبر الإنترنت تكامل Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'تشابه TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'تطبيق حد التصنيف العمري؟';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'تقييد اقتراحات Moonfin Recommends حسب التصنيف العمري للوسائط المستهدفة';

  @override
  String get interfaceStyle => 'نمط الواجهة';

  @override
  String get interfaceStyleSubtitle =>
      'يطابق الوضع التلقائي جهازك. اختر Apple أو Material لفرض مظهر معيّن.';

  @override
  String get interfaceStyleAutomatic => 'تلقائي';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'شكل الواجهة';

  @override
  String get interfaceLayoutSubtitle =>
      'غير شكل الواجهة إذا تم التعرّف على الجهاز بشكل خاطئ. أعد تشغيل Moonfin حتى تظهر التغييرات.';

  @override
  String get interfaceLayoutAutomatic => 'أوتوماتيك';

  @override
  String get interfaceLayoutTv => 'وضع التلفاز';

  @override
  String get interfaceLayoutDesktop => 'وضع سطح المكتب';

  @override
  String get interfaceLayoutPhone => 'واجهة الهاتف';

  @override
  String get glassQuality => 'جودة الزجاج';

  @override
  String get oledMode => 'وضع OLED';

  @override
  String get oledModeSubtitle =>
      'خلّي اللون الأسود أغمق والصور أوضح وأجمل. يُفضّل استخدامه على شاشات OLED.';

  @override
  String get oledModeSubtle => 'خفيف';

  @override
  String get oledModeVivid => 'ديناميكي';

  @override
  String get glassQualitySubtitle =>
      'يختار الوضع التلقائي أفضل تأثير زجاجي لهذا الجهاز. يفرض الوضع الكامل ضبابية حقيقية، بينما يستخدم الوضع المخفّض زجاجًا خفيفًا يوفّر طاقة GPU.';

  @override
  String get glassQualityAuto => 'تلقائي';

  @override
  String get glassQualityFull => 'كامل';

  @override
  String get glassQualityReduced => 'مخفّض';

  @override
  String get performanceMode => 'الأداء';

  @override
  String get performanceModeSubtitle =>
      'يحدد إمكانيات جهازك تلقائيًا ويخفف الإعدادات إذا كانت الذاكرة محدودة، مع الاحتفاظ بعدد أقل من الصور وعرض المقاطع الدعائية كصور ثابتة. أعد تشغيل التطبيق لتطبيق التغييرات.';

  @override
  String get performanceModeAuto => 'اوتوماتيكي';

  @override
  String get performanceModeStandard => 'اعتيادي';

  @override
  String get performanceModeReduced => 'منخفض';

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
      'متوقف لأن وضع الأداء مضبوط على منخفض لهذا الجهاز.';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'قم بالتبديل بين Moonfin وNeon Pulse دون إعادة تشغيل التطبيق';

  @override
  String get customThemeTitle => 'سمة مخصصة';

  @override
  String get customThemeSubtitle =>
      'تغيّر السمات المخصصة العناصر المرئية في Moonfin. اختر أحد هذه الخيارات بما يناسب ذوقك.';

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
  String get controller => 'يد التحكم';

  @override
  String get gamepadNavigation => 'التنقل بيد التحكم';

  @override
  String get gamepadNavigationDescription =>
      'استخدم يد تحكم متصلة للتنقل بين العناصر واختيارها';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => 'مظهر Moonfin الأصلي والبسيط.';

  @override
  String get themeNeonPulse => 'نبض النيون';

  @override
  String get themeNeonPulseSubtitle =>
      'تصميم Synthwave مع توهج أرجواني ونص سماوي وتباين أقوى للكروم';

  @override
  String get themeGlass => 'زجاجي';

  @override
  String get themeGlassSubtitle =>
      'تصميم زجاجي سائل مع خلفية متدرّجة متحرّكة وأسطح مصنفرة ولون تمييز أزرق بأسلوب Apple';

  @override
  String get theme8BitHero => 'بطل 8 بت';

  @override
  String get theme8BitHeroSubtitle =>
      'تصميم بكسل كلاسيكي بلوحة ألوان جريئة وحدود مربّعة وظلال حادة وخط بكسلي';

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
  String get gameMenu => 'القائمة';

  @override
  String get gamePaused => 'متوقف مؤقتًا';

  @override
  String get gameSaveState => 'حفظ الحالة';

  @override
  String get games => 'الألعاب';

  @override
  String get gameLoadState => 'تحميل الحالة';

  @override
  String get gameFastForward => 'تقديم سريع';

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
  String get gameEmulatorSettings => 'إعدادات المحاكي';

  @override
  String get gameNoCoreOptions =>
      'لا تتوفّر خيارات قابلة للتعديل في هذه النواة.';

  @override
  String get gameHoldToOpenMenu => 'استمر بالضغط لفتح القائمة';

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
      'تشغيل الألعاب غير مدعوم على هذا الجهاز بعد.';

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
  String get series => 'المسلسلات';

  @override
  String get noItemsFound => 'لم يتم العثور على أي عناصر';

  @override
  String get home => 'الرئيسية';

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
  String get library => 'المكتبة';

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
  String get uiScaleGrandparents => 'Grandparents';

  @override
  String get uiScaleGreatGrandparents => 'Great-Grandparents';

  @override
  String get scrollDirection => 'اتجاه التمرير';

  @override
  String get scrollDirectionVertical => 'عمودي';

  @override
  String get scrollDirectionHorizontal => 'أفقي';

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
  String get artists => 'الفنانون';

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
  String get apply => 'تطبيق';

  @override
  String get openLink => 'افتح الرابط';

  @override
  String get scanWithYourPhone => 'مسح مع هاتفك';

  @override
  String get audiobookGenres => 'أنواع الكتب الصوتية';

  @override
  String get scrollLeft => 'قم بالتمرير إلى اليسار';

  @override
  String get scrollRight => 'قم بالتمرير إلى اليمين';

  @override
  String get scrollToTop => 'التمرير إلى الأعلى';

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
  String get resume => 'استئناف';

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
  String get watched => 'تمت مشاهدته';

  @override
  String get unread => 'غير مقروءة';

  @override
  String get unwatched => 'لم تتم مشاهدته';

  @override
  String get seriesStatus => 'حالة السلسلة';

  @override
  String get allLibraries => 'جميع المكتبات';

  @override
  String get books => 'كتب';

  @override
  String get latestBooks => 'أحدث الكتب';

  @override
  String get latestAudiobooks => 'أحدث الكتب الصوتية';

  @override
  String get latestComics => 'أحدث القصص المصورة';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count كتاب',
      many: '$count كتابًا',
      few: '$count كتب',
      two: 'كتابان',
      zero: 'لا توجد كتب',
      one: 'كتاب واحد',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'كتاب';

  @override
  String get bookFormatAudiobook => 'كتاب صوتي';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'لم يتم العثور على كتب لهذا المؤلف.';

  @override
  String get noBooksFoundDescription =>
      'لا تحتوي هذه المكتبة على أي كتب أو كتب صوتية أو قصص مصورة حتى الآن.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% مقروء';
  }

  @override
  String bookTimeLeft(String time) {
    return 'متبقٍ $time';
  }

  @override
  String get bookHeroRead => 'قراءة';

  @override
  String get bookHeroListen => 'استماع';

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
      other: '$count كتاب صوتي',
      many: '$count كتابًا صوتيًا',
      few: '$count كتب صوتية',
      two: 'كتابان صوتيان',
      zero: 'لا توجد كتب صوتية',
      one: 'كتاب صوتي واحد',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'قائمة المسار';

  @override
  String get itemListPlaceholder => 'ستظهر قائمة العناصر هنا';

  @override
  String get failedToLoad => 'فشل التحميل';

  @override
  String get delete => 'حذف';

  @override
  String get save => 'حفظ';

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
      other: '$count موسم',
      many: '$count موسمًا',
      few: '$count مواسم',
      two: 'موسمان',
      zero: 'لا توجد مواسم',
      one: 'موسم واحد',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'ينتهي عند $time';
  }

  @override
  String get items => 'العناصر';

  @override
  String get extras => 'إضافات';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'خلف الكواليس';

  @override
  String get deletedScenes => 'مشاهد محذوفة';

  @override
  String get featurettes => 'مقاطع تعريفية';

  @override
  String get interviews => 'مقابلات';

  @override
  String get scenes => 'مشاهد';

  @override
  String get shorts => 'أفلام قصيرة';

  @override
  String get trailers => 'الإعلانات التشويقية';

  @override
  String timeRemaining(String time) {
    return 'متبقٍ $time';
  }

  @override
  String endsIn(String time) {
    return 'ينتهي خلال $time';
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
  String get play => 'تشغيل';

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
  String get cast => 'إرسال';

  @override
  String get castMembers => 'طاقم التمثيل';

  @override
  String get trailer => 'الإعلان التشويقي';

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
  String get finalizingDownload => 'جار الإنهاء…';

  @override
  String get queuedDownload => 'في الانتظار';

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
  String failedToDeleteItemWithError(String error) {
    return 'تعذّر حذف العنصر بسبب الخطأ التالي: $error';
  }

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
  String get none => 'بدون';

  @override
  String get downloadSubtitlesLabel => 'تحميل ترجمات...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'ابحث باستخدام البرنامج المساعد OpenSubtitles';

  @override
  String get downloadSubtitles => 'تحميل ترجمات';

  @override
  String get searchingSubtitles => 'جارٍ البحث عن الترجمة…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'يتم تحميل الترجمة…';

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
  String get downloadScopeTitle => 'ما الذي تريد تنزيله';

  @override
  String get downloadAllEpisodes => 'جميع الحلقات';

  @override
  String get downloadUnwatchedEpisodes => 'كل الحلقات غير المشاهدة';

  @override
  String get downloadAllMovies => 'كل الأفلام';

  @override
  String get downloadUnwatchedMovies => 'كل الأفلام غير المشاهدة';

  @override
  String get downloadScopeLoading => 'جاري تحميل المحتوى...';

  @override
  String get downloadScopeLoadFailed => 'تعذر تحميل الملفات للتنزيل';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size الإجمالي';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received من $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/ث';
  }

  @override
  String downloadSizeTotal(String size) {
    return '$size الإجمالي';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count غير معروف';
  }

  @override
  String downloadingItem(String name, String quality) {
    return 'جارٍ التنزيل $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'حذف الملفات التي تم تنزيلها';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'هل تريد حذف الملفات المحلية لـ $typeLabel؟\n\nسيؤدي هذا إلى إخلاء مساحة التخزين. يمكنك إعادة التنزيل لاحقاً.';
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
  String get starring => 'بطولة';

  @override
  String get directors => 'المخرجون';

  @override
  String get writer => 'الكاتب';

  @override
  String get writers => 'الكتّاب';

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
      other: '$count مسار',
      many: '$count مسارًا',
      few: '$count مسارات',
      two: 'مساران',
      zero: 'لا توجد مسارات',
      one: 'مسار واحد',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فصل',
      many: '$count فصلًا',
      few: '$count فصول',
      two: 'فصلان',
      zero: 'لا توجد فصول',
      one: 'فصل واحد',
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
  String get shuffle => 'تشغيل عشوائي';

  @override
  String get shuffleAll => 'الكل عشوائي';

  @override
  String get shuffleAllMusic => 'تشغيل كل الموسيقى عشوائيًا';

  @override
  String get carSignInPrompt => 'سجّل الدخول إلى Moonfin من هاتفك';

  @override
  String get carServerUnreachable => 'تعذّر الوصول إلى الخادم';

  @override
  String downloadsCount(int count) {
    return '$count التنزيلات';
  }

  @override
  String get perfectMatch => 'مباراة مثالية';

  @override
  String get aiTranslated => 'مترجمة بالذكاء الإصطناعي';

  @override
  String get machineTranslated => 'Machine Translated';

  @override
  String get hearingImpaired => 'لضعاف السمع';

  @override
  String framerateFps(String rate) {
    return '$rate إطار/ثانية';
  }

  @override
  String get mono => 'أحادي';

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
  String get pause => 'إيقاف مؤقت';

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
  String get off => 'إيقاف';

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
  String get reset => 'إعادة تعيين';

  @override
  String get unknown => 'مجهول';

  @override
  String get playbackInformation => 'معلومات التشغيل';

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
  String get player => 'المشغّل';

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
  String get track => 'المسار';

  @override
  String get channels => 'القنوات';

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
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

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
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'دليل الجدول الزمني';

  @override
  String failedToLoadGuide(String error) {
    return 'فشل تحميل الدليل: $error';
  }

  @override
  String get noChannelsFound => 'لم يتم العثور على قنوات';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'يعيش';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'التالي: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'متبقٍ $minutes د';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'متبقٍ $hours س';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'متبقٍ $hours س $minutes د';
  }

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
  String get record => 'تسجيل';

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
  String get cancelRecordingAction => 'إلغاء التسجيل';

  @override
  String get programSetToRecord => 'تم ضبط البرنامج للتسجيل';

  @override
  String get recordingCancelled => 'تم إلغاء التسجيل';

  @override
  String get unableToCreateRecording => 'غير قادر على إنشاء التسجيل';

  @override
  String get recordSeries => 'إقتراحات Moonfin';

  @override
  String get seriesSetToRecord => 'Series set to record';

  @override
  String get seriesRecordingCancelled => 'Series recording cancelled';

  @override
  String get unableToCreateSeriesRecording =>
      'Unable to create series recording';

  @override
  String get watch => 'مشاهدة';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'إغلاق';

  @override
  String failedToPlayChannel(String name) {
    return 'فشل تشغيل $name';
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
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'نوع حساب Seerr';

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
    return 'م$season ح$episode';
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
    return 'م$number';
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
      other: '$count حلقة',
      many: '$count حلقة',
      few: '$count حلقات',
      two: 'حلقتان',
      zero: 'لا توجد حلقات',
      one: 'حلقة واحدة',
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
  String get settingsSearchHint => 'Search settings';

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
  String get mixedRowsOnly => 'Mixed rows only';

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
  String get seriesThumbnails => 'الصور المصغرة للسلسلة';

  @override
  String get seriesThumbnailsDescription =>
      'للمسلسلات: استخدام بوستر المسلسل بدلاً من صورة الحلقة.';

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
  String get snow => 'ثلج';

  @override
  String get fireworks => 'ألعاب نارية';

  @override
  String get confetti => 'حلويات';

  @override
  String get fallingLeaves => 'الأوراق المتساقطة';

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
  String get loopThemeMusic => 'تكرار الموسيقى التعريفية';

  @override
  String get loopThemeMusicSubtitle => 'تكرار المسار بدلًا من تشغيله مرة واحدة';

  @override
  String get detailsBackgroundBlur => 'تفاصيل طمس الخلفية';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

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
  String get settingsScrollWheelAction => 'عجلة تمرير الماوس';

  @override
  String get settingsScrollWheelActionDescription =>
      'اختر ما تفعله عجلة الماوس عند التمرير فوق الفيديو أثناء التشغيل.';

  @override
  String get scrollWheelActionOff => 'إيقاف';

  @override
  String get scrollWheelActionSeek => 'التنقل (تقديم / إرجاع)';

  @override
  String get scrollWheelActionVolume => 'مستوى الصوت';

  @override
  String get playerTooltipVolume => 'مستوى الصوت';

  @override
  String get fit => 'ملائم';

  @override
  String get autoCrop => 'الاقتصاص التلقائي';

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
  String get stretch => 'تمتد';

  @override
  String get refreshRateSwitching => 'تبديل معدل التحديث';

  @override
  String get disabled => 'معطّل';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

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
  String get showDescriptionOnPause => 'إظهار الوصف عند الإيقاف المؤقت';

  @override
  String get dimVideoShowOverview =>
      'تعتيم الفيديو وإظهار نص النظرة العامة أثناء الإيقاف المؤقت';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'زر قفل OSD';

  @override
  String get osdLockButtonDescription =>
      'إظهار زر القفل الذي يمنع الإدخال باللمس حتى يتم الضغط عليه لفترة طويلة';

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
  String get audioBehavior => 'السلوك الصوتي';

  @override
  String get downmixToStereo => 'دوونميكس إلى ستيريو';

  @override
  String get defaultAudioLanguage => 'لغة الصوت الافتراضية';

  @override
  String get fallbackAudioLanguage => 'لغة الصوت الاحتياطية';

  @override
  String get preferDefaultAudioTrack => 'تفضيل مسار الصوت الافتراضي';

  @override
  String get preferDefaultAudioTrackDescription =>
      'تفضيل مسار الصوت الأصلي على الدبلجة المحلية.';

  @override
  String get preferAudioDescription => 'تفضيل مسارات الوصف الصوتي';

  @override
  String get preferAudioDescriptionDescription =>
      'تفضيل مسارات الوصف الصوتي على المسارات العادية.';

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
  String get settingsAudioFallbackCodec => 'ترميز الصوت الاحتياطي';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'حدّد التنسيق الهدف لإعادة ترميز الصوت متعدد القنوات عندما يتعذّر تشغيل تدفق المصدر مباشرةً أو تمريره.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto => 'اكتشاف تلقائي\n(موصى به)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(افتراضي)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(ستيريو فقط)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(فعّال)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(بلا فقدان)';

  @override
  String get settingsMaxAudioChannels => 'الحد الأقصى لقنوات الصوت';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'اضبط الحد الأقصى لقنوات نظامك الصوتي. سيتم مزج التدفقات متعددة القنوات التي تتجاوز هذا الحد أو إعادة ترميزها.';

  @override
  String get settingsMaxAudioChannelsAuto => 'اكتشاف تلقائي\n(افتراضي العتاد)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 أحادي';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 ستيريو';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 محيطي';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 رباعي';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 محيطي';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 محيطي';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 محيطي';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 محيطي';

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
  String get settingsAudioDtsCorePassthrough => 'DTS الأساسية العبور';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA العبور';

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
  String get settingsAudioTrueHdPassthrough => 'عبور TrueHD';

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
  String get settingsAudioRouteHeadphones => 'سماعات الرأس';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count قناة PCM';
  }

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
    return '$value ث';
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
  String get defaultToNoSubtitles => 'الافتراضي إلى لا ترجمات';

  @override
  String get turnOffSubtitlesByDefault =>
      'قم بإيقاف تشغيل الترجمة بشكل افتراضي';

  @override
  String get subtitleSize => 'حجم الترجمة';

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
  String get subtitleMode => 'وضع الترجمة';

  @override
  String get subtitleModeFlagged => 'المُعلَّمة';

  @override
  String get subtitleModeAlways => 'دائمًا';

  @override
  String get subtitleModeForeign => 'الأجنبية';

  @override
  String get subtitleModeForced => 'المفروضة';

  @override
  String get subtitleModeFlaggedDescription =>
      'يشغّل المسارات المُعلَّمة داخليًا في بيانات ملف الوسائط على أنها \"افتراضية\" أو \"مفروضة\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'يحمّل الترجمات ويعرضها تلقائيًا في كل مرة يبدأ فيها الفيديو.';

  @override
  String get subtitleModeForeignDescription =>
      'يفعّل الترجمات تلقائيًا إذا كان مسار الصوت الافتراضي بلغة أجنبية.';

  @override
  String get subtitleModeForcedDescription =>
      'يحمّل الترجمات المُعلَّمة صراحةً بعلامة \"مفروضة\" فقط.';

  @override
  String get subtitleModeNoneDescription =>
      'يعطّل التحميل التلقائي للترجمات تمامًا.';

  @override
  String get fallbackSubtitleLanguage => 'لغة الترجمة الاحتياطية';

  @override
  String get subtitleStream => 'مسار الترجمة';

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
  String get syncing => 'جارٍ المزامنة...';

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
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'عرض التحميلات على الخادم';

  @override
  String get reportDownloadsActivitySubtitle =>
      'السماح لمسؤول الخادم برؤية تحميلاتك المعاد ترميزها في لوحة التحكم';

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
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'إظهار المكتبات في شريط الأدوات';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'توسيع تسميات شريط التنقل دائمًا';

  @override
  String get showSeerrButton => 'عرض زر Seerr';

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
  String get groupItemsIntoCollections => 'تجميع العناصر في مجموعات';

  @override
  String get hideCollectionAssociatedItems =>
      'إخفاء عناصر المكتبة المرتبطة بمجموعة عند تصفّح المكتبات';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'تنبيه بشأن تجميع المكتبة';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'لاستخدام هذا الإعداد، تأكّد من تفعيل إعدادَي المكتبة \"تجميع الأفلام في مجموعات\" و/أو \"تجميع المسلسلات في مجموعات\" ضمن إعدادات العرض لمكتبتك على خادم Jellyfin أو Emby.';

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
  String get mediaBarMode => 'نمط شريط الوسائط';

  @override
  String get mediaBarModeDescription =>
      'اختر من بين أنماط متنوعة لشريط الوسائط، أو قم بإيقاف تشغيل شريط الوسائط';

  @override
  String get peekHomeRows => 'Peek Home Rows';

  @override
  String get peekHomeRowsDescription =>
      'Show the top half of the first row along the bottom of the media bar';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'ماكد';

  @override
  String get mediaBarModeOff => 'إيقاف';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'تمكين شريط الوسائط';

  @override
  String get showFeaturedContentSlideshow =>
      'عرض شرائح المحتوى المميز في المنزل';

  @override
  String get contentType => 'نوع المحتوى';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

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
  String get trailerAudio => 'صوت المقاطع الدعائية';

  @override
  String get enableTrailerAudio =>
      'تفعيل الصوت للمقاطع الدعائية في شريط الوسائط';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

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
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'أحدث الوسائط';

  @override
  String get recentlyReleased => 'صدر مؤخرا';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

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
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'إعادة التعيين إلى الإعدادات الافتراضية';

  @override
  String get homeRowPosterSize => 'حجم ملصق صف المنزل';

  @override
  String get configureImageTypeForEachRow =>
      'قم بتكوين نوع الصورة لكل صف رئيسي ممكّن';

  @override
  String get mergeContinueWatchingAndNextUp => 'دمج، مواصلة المشاهدة والتالي';

  @override
  String get combineBothRows => 'ادمج كلا الصفين في قسم رئيسي واحد';

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
  String get fullScreenRows => 'صفوف الرئيسية الموسّعة';

  @override
  String get fullScreenRowsDescription =>
      'قصر صفوف الرئيسية على صف واحد لكل شاشة';

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
  String get perRowSettings => 'إعدادات كل صف';

  @override
  String get autoLogin => 'تسجيل الدخول التلقائي';

  @override
  String get lastUser => 'المستخدم الأخير';

  @override
  String get currentUser => 'المستخدم الحالي';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get mode => 'الوضع';

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
  String get displayClockDuringScreensaver => 'عرض الساعة أثناء شاشة التوقف';

  @override
  String get clockModeStatic => 'ثابت';

  @override
  String get clockModeBouncing => 'مرتد';

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
  String get rottenTomatoesCritics => 'الطماطم الفاسدة (النقاد)';

  @override
  String get rottenTomatoesAudience => 'الطماطم الفاسدة (الجمهور)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'ميتاكريتيك';

  @override
  String get metacriticUser => 'ميتاكريتيك (مستخدم)';

  @override
  String get trakt => 'Trakt';

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
  String get pluginDetected => 'تم اكتشاف البرنامج المساعد';

  @override
  String get pluginNotDetected => 'لم يتم الكشف عن البرنامج المساعد';

  @override
  String get pluginNotDetectedDescription =>
      'لم يتم الكشف عن البرنامج المساعد للخادم حاليا. لا تزال الإعدادات المحلية تستخدم القيم المحفوظة أو الإعدادات الافتراضية المضمنة.';

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
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'صفوف استكشاف Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults =>
      'إعادة تعيين الصفوف إلى الإعدادات الافتراضية';

  @override
  String get enableSeerr => 'تفعيل Seerr';

  @override
  String get showSeerrInNavigation =>
      'عرض Seerr في شريط التنقل (يتطلب إضافة الخادم)';

  @override
  String get seerrUnavailable =>
      'غير متاح نظرًا لتعطيل دعم المكون الإضافي للخادم Seerr.';

  @override
  String get nsfwFilter => 'مرشح نسفو';

  @override
  String get hideAdultContent => 'إخفاء محتوى البالغين في النتائج';

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
  String get seerrNotificationsSection => 'الإشعارات';

  @override
  String get seerrNotifyNewRequestsTitle => 'إشعارات الطلبات الجديدة';

  @override
  String get seerrNotifyNewRequestsSubtitle => 'تنبيهي عندما يقدّم أحدهم طلبًا';

  @override
  String get seerrNotifyLibraryAddedTitle => 'تحديثات الطلبات';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'المقبولة والمرفوضة والمضافة إلى مكتبتك';

  @override
  String get seerrNotifyIssuesTitle => 'تحديثات المشكلات';

  @override
  String get seerrNotifyIssuesSubtitle => 'المشكلات الجديدة والردود والحلول';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'تم تسجيل الدخول باسم: $username';
  }

  @override
  String get discoverRows => 'صفحة استكشاف Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'فعّل الصفوف التي تريد رؤيتها في صفحة Seerr الرئيسية. اسحب لإعادة الترتيب. تتم مزامنة الترتيب المخصص مع Moonbase.';

  @override
  String get discoverRowsDescription =>
      'فعّل الصفوف التي تريد رؤيتها في صفحة Seerr الرئيسية. اسحب لإعادة الترتيب. تتم مزامنة الترتيب المخصص مع Moonbase.';

  @override
  String get enabled => 'مفعّل';

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
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
  String get featuredContentAppearance => 'المحتوى المميز والمظهر';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'حد ذاكرة التخزين المؤقت للصور';

  @override
  String get clearImageCache => 'مسح ذاكرة التخزين المؤقت للصور';

  @override
  String get imageCacheCleared => 'تم مسح ذاكرة التخزين المؤقت للصور';

  @override
  String get clear => 'مسح';

  @override
  String get browse => 'تصفح';

  @override
  String get noResults => 'لا توجد نتائج';

  @override
  String get seerrAvailableStatus => 'متاح';

  @override
  String get seerrRequestedStatus => 'مطلوب';

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
    return 'جارٍ التحميل · $percent%';
  }

  @override
  String get seerrImportingStatus => 'جارٍ الاستيراد';

  @override
  String itemsCount(int count) {
    return '$count العناصر';
  }

  @override
  String get seerrSettings => 'إعدادات Seerr';

  @override
  String get requestMore => 'اطلب المزيد';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'طلب';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'إلغاء الطلب';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'العب في Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'تم الطلب بواسطة $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

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
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'إرسال الطلب';

  @override
  String get allSeasons => 'كل المواسم';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

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
  String get appearances => 'الظهور';

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
  String get failedStatus => 'فشل';

  @override
  String get processingStatus => 'قيد المعالجة';

  @override
  String modifiedByName(String name) {
    return 'عُدّل بواسطة $name';
  }

  @override
  String get completedStatus => 'مكتمل';

  @override
  String get requestErrorDuplicate => 'تم طلب هذا العنوان بالفعل';

  @override
  String get requestErrorQuota => 'تم بلوغ حد الطلبات';

  @override
  String get requestErrorBlocklisted => 'هذا العنوان محظور';

  @override
  String get requestErrorNoSeasons => 'لا توجد مواسم متبقية للطلب';

  @override
  String get requestErrorPermission => 'ليس لديك إذن لتقديم هذا الطلب';

  @override
  String get seerrRequestsTitle => 'الطلبات';

  @override
  String get seerrIssuesTitle => 'المشكلات';

  @override
  String get sortNewest => 'الأحدث';

  @override
  String get sortLastModified => 'آخر تعديل';

  @override
  String get noIssues => 'لا توجد مشكلات';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'متبقٍ $remaining من أصل $limit من طلبات الأفلام';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'متبقٍ $remaining من أصل $limit من طلبات المواسم';
  }

  @override
  String partOfCollectionName(String name) {
    return 'جزء من $name';
  }

  @override
  String get viewCollection => 'عرض المجموعة';

  @override
  String get requestCollection => 'طلب المجموعة';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total فيلم · $available متاح';
  }

  @override
  String requestMoviesCount(int count) {
    return 'طلب $count فيلم';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'جارٍ طلب $current من $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'تم طلب $count فيلم';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'تم طلب $ok من أصل $total فيلم';
  }

  @override
  String get collectionAllRequested => 'جميع الأفلام متاحة أو مطلوبة بالفعل';

  @override
  String get reportIssue => 'الإبلاغ عن مشكلة';

  @override
  String get issueTypeVideo => 'فيديو';

  @override
  String get issueTypeAudio => 'صوت';

  @override
  String get whatsWrong => 'ما المشكلة؟';

  @override
  String get allEpisodes => 'كل الحلقات';

  @override
  String get episode => 'حلقة';

  @override
  String get openStatus => 'مفتوحة';

  @override
  String get resolvedStatus => 'محلولة';

  @override
  String get resolveAction => 'حل';

  @override
  String get reopenAction => 'إعادة فتح';

  @override
  String reportedByName(String name) {
    return 'أبلغ عنها $name';
  }

  @override
  String commentsCount(int count) {
    return '$count تعليق';
  }

  @override
  String get addComment => 'أضف تعليقًا';

  @override
  String get deleteIssueConfirm => 'حذف هذه المشكلة؟';

  @override
  String get submitReport => 'إرسال البلاغ';

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
  String get add => 'إضافة';

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
  String get done => 'تم';

  @override
  String get edit => 'تعديل';

  @override
  String get encoding => 'الترميز';

  @override
  String get error => 'خطأ';

  @override
  String get forward => 'تقديم';

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
  String get remote => 'التحكم عن بُعد';

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
  String get search => 'بحث';

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
  String get stop => 'إيقاف';

  @override
  String get streaming => 'جاري';

  @override
  String get time => 'وقت';

  @override
  String get trickplay => 'Trickplay';

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
  String get mute => 'كتم الصوت';

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
  String get adminDrawerDisplay => 'العرض';

  @override
  String get adminDrawerMetadata => 'البيانات الوصفية';

  @override
  String get adminDrawerNfo => 'إعدادات NFO';

  @override
  String get adminDrawerTranscoding => 'تحويل الشفرة';

  @override
  String get adminDrawerResume => 'استئناف';

  @override
  String get adminDrawerStreaming => 'جاري';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
  String get sessionForward => 'تقديم';

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
  String get volume => 'مستوى الصوت';

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
  String get adminClearDates => 'تواريخ واضحة';

  @override
  String get adminActivitySeverityAll => 'كل مستويات الخطورة';

  @override
  String get adminActivityDateRange => 'النطاق الزمني';

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
  String adminRemoveDeviceConfirm(String name) {
    return 'إزالة الجهاز \'$name\'؟ سيحتاج المستخدم إلى تسجيل الدخول مرة أخرى على هذا الجهاز.';
  }

  @override
  String get adminDeleteAllDevices => 'حذف كل الأجهزة';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'إزالة $count جهاز؟ سيحتاج المستخدمون المتأثرون إلى تسجيل الدخول مرة أخرى. جهازك الحالي غير متأثر.';
  }

  @override
  String get adminDevicesDeletedAll => 'تمت إزالة الأجهزة';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'تمت إزالة بعض الأجهزة، وتعذّر إزالة $count منها.';
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
  String get adminLibraryLoadFailed => 'فشل تحميل المكتبة';

  @override
  String get adminNoMediaPaths => 'لم يتم تكوين مسارات الوسائط';

  @override
  String get adminAddPath => 'أضف المسار';

  @override
  String get adminBrowseFilesystem => 'تصفح نظام ملفات الخادم:';

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
  String get adminLibraryTabPaths => 'المسارات';

  @override
  String get adminLibraryTabOptions => 'الخيارات';

  @override
  String get adminLibraryTabDownloaders => 'أدوات التحميل';

  @override
  String get adminLibMetadataSavers => 'أدوات حفظ البيانات الوصفية';

  @override
  String get adminLibSubtitleDownloaders => 'أدوات تحميل الترجمات';

  @override
  String get adminLibLyricDownloaders => 'أدوات تحميل كلمات الأغاني';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'أدوات تحميل البيانات الوصفية: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'أدوات جلب الصور: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'لا يوفّر هذا الخادم أي أدوات تحميل لهذا النوع من المكتبات.';

  @override
  String get adminLibrarySectionGeneral => 'عام';

  @override
  String get adminLibrarySectionMetadata => 'البيانات الوصفية';

  @override
  String get adminLibrarySectionEmbedded => 'المعلومات المضمّنة';

  @override
  String get adminLibrarySectionSubtitles => 'الترجمات';

  @override
  String get adminLibrarySectionImages => 'الصور';

  @override
  String get adminLibrarySectionSeries => 'المسلسلات';

  @override
  String get adminLibrarySectionMusic => 'الموسيقى';

  @override
  String get adminLibrarySectionMovies => 'الأفلام';

  @override
  String get adminLibRealtimeMonitor => 'تفعيل المراقبة الفورية';

  @override
  String get adminLibRealtimeMonitorHint =>
      'اكتشاف تغييرات الملفات ومعالجتها تلقائيًا.';

  @override
  String get adminLibEnablePhotos => 'عرض الصور';

  @override
  String get adminLibSaveLocalMetadata => 'حفظ الصور الفنية في مجلدات الوسائط';

  @override
  String get adminLibRefreshInterval => 'التحديث التلقائي للبيانات الوصفية';

  @override
  String get adminLibRefreshNever => 'أبدًا';

  @override
  String get adminLibDefault => 'افتراضي';

  @override
  String get adminLibDisplayTitle => 'العرض';

  @override
  String get adminLibDisplaySection => 'عرض المكتبة';

  @override
  String get adminLibFolderView =>
      'عرض واجهة المجلدات لإظهار مجلدات الوسائط العادية';

  @override
  String get adminLibSpecialsInSeasons =>
      'عرض الحلقات الخاصة ضمن المواسم التي عُرضت فيها';

  @override
  String get adminLibGroupMovies => 'تجميع الأفلام في مجموعات';

  @override
  String get adminLibGroupShows => 'تجميع المسلسلات في مجموعات';

  @override
  String get adminLibExternalSuggestions =>
      'عرض المحتوى الخارجي ضمن الاقتراحات';

  @override
  String get adminLibDateAddedSection => 'سلوك تاريخ الإضافة';

  @override
  String get adminLibDateAddedLabel => 'استخدام تاريخ الإضافة من';

  @override
  String get adminLibDateAddedImport => 'تاريخ فحص العنصر وإضافته إلى المكتبة';

  @override
  String get adminLibDateAddedFile => 'تاريخ إنشاء الملف';

  @override
  String get adminLibMetadataTitle => 'البيانات الوصفية والصور';

  @override
  String get adminLibMetadataLangSection => 'لغة البيانات الوصفية المفضّلة';

  @override
  String get adminLibChaptersSection => 'الفصول';

  @override
  String get adminLibDummyChapterDuration => 'مدة الفصل الوهمي (بالثواني)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'مدة الفصول التي تُنشأ للوسائط التي لا تحتوي على فصول. اضبطها على 0 للتعطيل.';

  @override
  String get adminLibChapterImageResolution => 'دقة صور الفصول';

  @override
  String get adminLibNfoTitle => 'إعدادات NFO';

  @override
  String get adminLibNfoHelp =>
      'بيانات NFO الوصفية متوافقة مع Kodi والتطبيقات المشابهة. تنطبق الإعدادات على جميع المكتبات التي تحفظ بيانات NFO الوصفية.';

  @override
  String get adminLibKodiUser =>
      'المستخدم الذي تُحفظ بيانات مشاهدته في ملفات NFO';

  @override
  String get adminLibSaveImagePaths => 'حفظ مسارات الصور داخل ملفات NFO';

  @override
  String get adminLibPathSubstitution =>
      'تفعيل استبدال المسارات لمسارات صور NFO';

  @override
  String get adminLibExtraThumbs => 'نسخ صور extrafanart إلى مجلد extrathumbs';

  @override
  String get adminLibNone => 'لا شيء';

  @override
  String adminLibRefreshDays(int days) {
    return '$days يومًا';
  }

  @override
  String get adminLibEmbeddedTitles => 'استخدام العناوين المضمّنة';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'استخدام العناوين المضمّنة للإضافات';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'استخدام معلومات الحلقات المضمّنة';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'السماح بالترجمات المضمّنة';

  @override
  String get adminLibEmbeddedAllowAll => 'السماح بالكل';

  @override
  String get adminLibEmbeddedAllowText => 'النصية فقط';

  @override
  String get adminLibEmbeddedAllowImage => 'الصورية فقط';

  @override
  String get adminLibEmbeddedAllowNone => 'لا شيء';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'تخطي التحميل عند وجود ترجمات مضمّنة';

  @override
  String get adminLibSkipIfAudioMatches =>
      'تخطي التحميل إذا كان مسار الصوت مطابقًا للغة التحميل';

  @override
  String get adminLibRequirePerfectMatch => 'اشتراط تطابق تام للترجمة';

  @override
  String get adminLibSaveSubtitlesWithMedia => 'حفظ الترجمات في مجلدات الوسائط';

  @override
  String get adminLibChapterImageExtraction => 'استخراج صور الفصول';

  @override
  String get adminLibChapterImagesDuringScan =>
      'استخراج صور الفصول أثناء فحص المكتبة';

  @override
  String get adminLibTrickplayExtraction => 'تفعيل استخراج صور Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'استخراج صور Trickplay أثناء فحص المكتبة';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'حفظ صور Trickplay في مجلدات الوسائط';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'دمج المسلسلات الموزّعة على عدة مجلدات تلقائيًا';

  @override
  String get adminLibSeasonZeroName => 'اسم عرض الموسم صفر';

  @override
  String get adminLibLufsScan => 'تفعيل فحص LUFS لتسوية مستوى الصوت';

  @override
  String get adminLibPreferNonstandardArtist =>
      'تفضيل وسم الفنانين غير القياسي';

  @override
  String get adminLibAutoAddToCollection =>
      'إضافة الأفلام إلى المجموعات تلقائيًا';

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
  String adminSaveFailed(String error) {
    return 'فشل الحفظ: $error';
  }

  @override
  String get adminPasswordsMismatch => 'كلمات المرور غير متطابقة';

  @override
  String adminFailed(String error) {
    return 'فشل: $error';
  }

  @override
  String get adminUserLoadFailed => 'فشل تحميل المستخدم';

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
  String get adminEnableAllLibraryAccess => 'تمكين الوصول إلى كافة المكتبات';

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
  String get adminEnableAllDevices => 'تمكين الوصول إلى كافة الأجهزة';

  @override
  String get adminEnableAllChannels => 'تمكين الوصول إلى كافة القنوات';

  @override
  String get adminParentalControl => 'الرقابة الأبوية';

  @override
  String get adminMaxParentalRating => 'الحد الأقصى المسموح به للتصنيف العمري';

  @override
  String get adminMaxParentalRatingHint =>
      'سيُخفى المحتوى ذو التصنيف الأعلى عن هذا المستخدم.';

  @override
  String get adminParentalRatingNone => 'لا شيء';

  @override
  String get adminBlockUnratedItems =>
      'حظر العناصر التي لا تحمل معلومات تصنيف أو التي تحمل تصنيفًا غير معروف';

  @override
  String get adminUnratedBook => 'الكتب';

  @override
  String get adminUnratedChannelContent => 'القنوات';

  @override
  String get adminUnratedLiveTvChannel => 'البث التلفزيوني المباشر';

  @override
  String get adminUnratedMovie => 'الأفلام';

  @override
  String get adminUnratedMusic => 'الموسيقى';

  @override
  String get adminUnratedTrailer => 'الإعلانات التشويقية';

  @override
  String get adminUnratedSeries => 'المسلسلات';

  @override
  String get adminAccessSchedules => 'جداول الوصول';

  @override
  String get adminAccessSchedulesHint =>
      'السماح بالوصول خلال الأوقات المجدولة أدناه فقط. يُسمح بالوصول طوال اليوم عند عدم ضبط أي جدول.';

  @override
  String get adminAddSchedule => 'إضافة جدول';

  @override
  String get adminScheduleDay => 'اليوم';

  @override
  String get adminScheduleStart => 'البداية';

  @override
  String get adminScheduleEnd => 'النهاية';

  @override
  String get adminDayEveryday => 'كل يوم';

  @override
  String get adminDayWeekday => 'أيام الأسبوع';

  @override
  String get adminDayWeekend => 'عطلة نهاية الأسبوع';

  @override
  String get adminDaySunday => 'الأحد';

  @override
  String get adminDayMonday => 'الاثنين';

  @override
  String get adminDayTuesday => 'الثلاثاء';

  @override
  String get adminDayWednesday => 'الأربعاء';

  @override
  String get adminDayThursday => 'الخميس';

  @override
  String get adminDayFriday => 'الجمعة';

  @override
  String get adminDaySaturday => 'السبت';

  @override
  String get adminAllowedTags => 'الوسوم المسموح بها';

  @override
  String get adminAllowedTagsHint =>
      'يُعرض المحتوى الذي يحمل هذه الوسوم فقط. اتركه فارغًا للسماح بالكل.';

  @override
  String get adminBlockedTags => 'الوسوم المحظورة';

  @override
  String get adminBlockedTagsHint =>
      'يُخفى المحتوى الذي يحمل هذه الوسوم عن هذا المستخدم.';

  @override
  String get adminAddTag => 'إضافة وسم';

  @override
  String get adminAuthProvider => 'موفّر المصادقة';

  @override
  String get adminPasswordResetProvider => 'موفّر إعادة تعيين كلمة المرور';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'الحد الأقصى لمحاولات تسجيل الدخول الفاشلة قبل الحظر';

  @override
  String get adminLoginAttemptsHint =>
      'اضبطها على 0 للقيمة الافتراضية، أو على -1 لتعطيل الحظر.';

  @override
  String get adminSyncPlayAccess => 'الوصول إلى SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'السماح بإنشاء المجموعات والانضمام إليها';

  @override
  String get adminSyncPlayJoin => 'السماح بالانضمام إلى المجموعات';

  @override
  String get adminSyncPlayNone => 'لا يوجد وصول';

  @override
  String get adminContentDeletionFolders => 'السماح بحذف المحتوى من';

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
  String get adminBackupOptionsTitle => 'إنشاء نسخة احتياطية';

  @override
  String get adminBackupDatabase => 'قاعدة البيانات';

  @override
  String get adminBackupDatabaseAlways => 'مُضمّنة دائمًا';

  @override
  String get adminBackupMetadata => 'البيانات الوصفية';

  @override
  String get adminBackupSubtitles => 'الترجمات';

  @override
  String get adminBackupTrickplay => 'صور Trickplay';

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
  String get adminPlaybackLoadFailed => 'فشل تحميل إعدادات التشغيل';

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
  String get adminTrickplayLoadFailed => 'فشل تحميل إعدادات Trickplay';

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
  String adminMetadataLoadFailed(String error) {
    return 'فشل تحميل البيانات التعريفية: $error';
  }

  @override
  String get adminRefreshMetadata => 'تحديث البيانات الوصفية';

  @override
  String get recursive => 'عودي';

  @override
  String get adminReplaceAllMetadata => 'استبدال كافة البيانات الوصفية';

  @override
  String get adminMetadataRefreshRequested => 'تم طلب تحديث بيانات التعريف';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'فشل تحديث البيانات التعريفية: $error';
  }

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
  String get adminTunerTypeM3u => 'موالف M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'ملف أو URL';

  @override
  String get adminTunerIpAddress => 'عنوان IP للموالف';

  @override
  String get adminTunerFriendlyName => 'الاسم الظاهر';

  @override
  String get adminTunerUserAgent => 'وكيل المستخدم';

  @override
  String get adminTunerCount => 'حد الاتصالات المتزامنة';

  @override
  String get adminTunerCountHelp =>
      'الحد الأقصى لعدد عمليات البث التي يسمح بها الموالف في وقت واحد. اضبطه على 0 لجعله بلا حدود.';

  @override
  String get adminTunerFallbackBitrate => 'الحد الأقصى الاحتياطي لمعدل بت البث';

  @override
  String get adminTunerImportFavoritesOnly => 'استيراد القنوات المفضلة فقط';

  @override
  String get adminTunerAllowHwTranscoding => 'السماح بتحويل الشفرة بالعتاد';

  @override
  String get adminTunerAllowFmp4 => 'السماح بحاوية تحويل الشفرة fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'السماح بمشاركة البث';

  @override
  String get adminTunerEnableStreamLooping => 'تفعيل تكرار البث';

  @override
  String get adminTunerIgnoreDts => 'تجاهل DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'قراءة المُدخل بمعدل الإطارات الأصلي';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'ملف أو URL';

  @override
  String get adminXmltvMoviePrefix => 'بادئة الأفلام';

  @override
  String get adminXmltvMovieCategories => 'فئات الأفلام';

  @override
  String get adminXmltvCategoriesHelp =>
      'افصل بين الفئات المتعددة بشَرطة عمودية.';

  @override
  String get adminXmltvKidsCategories => 'فئات الأطفال';

  @override
  String get adminXmltvNewsCategories => 'فئات الأخبار';

  @override
  String get adminXmltvSportsCategories => 'فئات الرياضة';

  @override
  String get adminSdUsername => 'اسم المستخدم';

  @override
  String get adminSdPassword => 'كلمة المرور';

  @override
  String get adminSdCountry => 'الدولة';

  @override
  String get adminSdCountrySelect => 'اختر دولة';

  @override
  String get adminSdPostalCode => 'الرمز البريدي';

  @override
  String get adminEnableAllTuners => 'تفعيل جميع الموالفات';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'فشلت إزالة الموالف: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'فشلت إزالة الموفر: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'مسار تسجيل السلسلة';

  @override
  String get adminMovieRecordingPath => 'مسار تسجيل الأفلام';

  @override
  String get adminGuideDaysAuto => 'تلقائي';

  @override
  String get adminRecordingPostProcessor => 'مسار تطبيق المعالجة اللاحقة';

  @override
  String get adminRecordingPostProcessorArgs => 'معاملات المعالج اللاحق';

  @override
  String get adminSaveRecordingNfo => 'حفظ بيانات NFO الوصفية للتسجيلات';

  @override
  String get adminSaveRecordingImages => 'حفظ صور التسجيلات';

  @override
  String get adminLiveTvSectionPaths => 'مسارات التسجيل';

  @override
  String get adminLiveTvSectionPostProcessing => 'المعالجة اللاحقة';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'فشل حفظ الإعدادات: $error';
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
  String get adminGuideRefreshStarted => 'بدأ تحديث بيانات الدليل';

  @override
  String get adminGuideRefreshUnavailable =>
      'مهمة تحديث الدليل غير متوفرة على هذا الخادم.';

  @override
  String get adminNoListingProviders => 'لم يتم تكوين أي موفري بيانات';

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
  String get adminBackupsTitle => 'النسخ الاحتياطية';

  @override
  String get adminUnknownDate => 'تاريخ غير معروف';

  @override
  String get adminUnnamedBackup => 'نسخة احتياطية بدون اسم';

  @override
  String get adminApply => 'تطبيق';

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
  String get adminMetadataIdentify => 'تحديد الهوية';

  @override
  String get adminMetadataType => 'يكتب';

  @override
  String get adminMetadataDetails => 'تفاصيل';

  @override
  String get adminMetadataExternalIds => 'معرفات خارجية';

  @override
  String get adminMetadataImages => 'الصور';

  @override
  String get adminMetadataFieldTitle => 'العنوان';

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
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'سطر الوصف';

  @override
  String get adminMetadataFieldOverview => 'ملخص';

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
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults => 'لا توجد مكونات إضافية تطابق بحثك';

  @override
  String get adminPluginsNoneInstalled => 'لم يتم تثبيت أي مكونات إضافية';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

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
  String get adminReposRemove => 'إزالة';

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
  String get adminNetworkingEnableHttps => 'تمكين HTTPS';

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
  String get adminBrandingSplashUpload => 'رفع صورة';

  @override
  String get adminBrandingSplashUploaded => 'تم تحديث شاشة البداية';

  @override
  String get adminBrandingSplashUploadFailed => 'فشل رفع شاشة البداية';

  @override
  String get adminBrandingSplashDeleted => 'تمت إزالة شاشة البداية';

  @override
  String get adminBrandingNoSplash => 'لا توجد شاشة بداية مخصّصة';

  @override
  String get adminPlaybackHwAccel => 'تسريع الأجهزة';

  @override
  String get adminPlaybackHwAccelLabel => 'تسريع الأجهزة';

  @override
  String get adminPlaybackEnableHwEncoding => 'تمكين ترميز الأجهزة';

  @override
  String get adminPlaybackQsvDevice => 'جهاز QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'تفعيل مفكك ترميز NVDEC المحسّن';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'تفضيل مفكك الترميز العتادي الأصلي للنظام';

  @override
  String get adminPlaybackColorDepth10Hevc => 'فك ترميز HEVC بعمق 10 بت';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'فك ترميز VP9 بعمق 10 بت';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'فك ترميز HEVC RExt بعمق 8/10 بت';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'فك ترميز HEVC RExt بعمق 12 بت';

  @override
  String get adminPlaybackHwEncodingSection => 'الترميز بالعتاد';

  @override
  String get adminPlaybackAllowHevcEncoding => 'السماح بترميز HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'السماح بترميز AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'تفعيل مُرمِّز H.264 منخفض الطاقة من Intel';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'تفعيل مُرمِّز HEVC منخفض الطاقة من Intel';

  @override
  String get adminPlaybackToneMapping => 'تعيين درجات الألوان';

  @override
  String get adminPlaybackEnableTonemapping => 'تفعيل تعيين درجات الألوان';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'تفعيل تعيين درجات الألوان بـVPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'تفعيل تعيين درجات الألوان بـVideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'خوارزمية تعيين درجات الألوان';

  @override
  String get adminPlaybackTonemappingMode => 'وضع تعيين درجات الألوان';

  @override
  String get adminPlaybackTonemappingRange => 'نطاق تعيين درجات الألوان';

  @override
  String get adminPlaybackTonemappingDesat => 'إزالة تشبّع تعيين درجات الألوان';

  @override
  String get adminPlaybackTonemappingPeak => 'ذروة تعيين درجات الألوان';

  @override
  String get adminPlaybackTonemappingParam => 'مُعامل تعيين درجات الألوان';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'سطوع تعيين درجات الألوان بـVPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'تباين تعيين درجات الألوان بـVPP';

  @override
  String get adminPlaybackEncoderPreset => 'الإعداد المسبق للمُرمِّز';

  @override
  String get adminPlaybackH264Crf => 'قيمة CRF لترميز H.264';

  @override
  String get adminPlaybackH265Crf => 'قيمة CRF لترميز H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'طريقة إزالة التشابك';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'مضاعفة معدل الإطارات عند إزالة التشابك';

  @override
  String get adminPlaybackAudioSection => 'الصوت';

  @override
  String get adminPlaybackEnableAudioVbr =>
      'تفعيل ترميز الصوت بمعدل بت متغير (VBR)';

  @override
  String get adminPlaybackDownmixBoost => 'تعزيز خفض مزج الصوت';

  @override
  String get adminPlaybackDownmixAlgorithm => 'خوارزمية خفض المزج إلى ستيريو';

  @override
  String get adminPlaybackMaxMuxingQueue => 'الحد الأقصى لحجم طابور المزج';

  @override
  String get adminPlaybackAutoOption => 'تلقائي';

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
  String get adminTaskStop => 'إيقاف';

  @override
  String get adminRunningTasks => 'المهام قيد التشغيل';

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
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ساعة',
      many: '$count ساعة',
      few: '$count ساعات',
      two: 'ساعتان',
      one: 'ساعة واحدة',
      zero: '$count ساعة',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'وقت';

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
    return '$minutes د';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours س';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days ي';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'اضبط إنشاء صور Trickplay لمعاينات التقديم المصغّرة.';

  @override
  String get adminNetworkingPublicHttpsPort => 'منفذ HTTPS العام';

  @override
  String get adminNetworkingBaseUrl => 'عنوان URL الأساسي';

  @override
  String get adminNetworkingBaseUrlHint => 'على سبيل المثال /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'منفذ HTTP العام';

  @override
  String get adminNetworkingRequireHttps => 'اشتراط HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'إعادة توجيه جميع الطلبات البعيدة إلى HTTPS. لا تأثير لذلك إذا لم يكن لدى الخادم شهادة صالحة.';

  @override
  String get adminNetworkingCertPassword => 'كلمة مرور الشهادة';

  @override
  String get adminNetworkingEnableIpv4 => 'تفعيل IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'تفعيل IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'شبكات LAN';

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
  String get adminPlaybackThrottleDelay => 'مهلة التقييد (بالثواني)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'السماح باستخراج الترجمات أثناء التشغيل';

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
  String get adminGeneralEnableSlowResponse =>
      'تفعيل تحذيرات الاستجابة البطيئة';

  @override
  String get adminGeneralQuickConnect => 'تفعيل Quick Connect';

  @override
  String get adminGeneralSectionServer => 'الخادم';

  @override
  String get adminGeneralSectionMetadata => 'البيانات الوصفية';

  @override
  String get adminGeneralSectionPaths => 'المسارات';

  @override
  String get adminGeneralSectionPerformance => 'الأداء';

  @override
  String get adminGeneralCachePath => 'مسار ذاكرة التخزين المؤقت';

  @override
  String get adminGeneralMetadataPath => 'مسار البيانات الوصفية';

  @override
  String get adminGeneralServerName => 'اسم الخادم';

  @override
  String get adminGeneralDisplayLanguage => 'لغة العرض المفضّلة';

  @override
  String get adminSettingsLoadFailed => 'فشل تحميل الإعدادات';

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
      other: '# مشارك',
      many: '# مشاركًا',
      few: '# مشاركين',
      two: '# مشاركان',
      one: '# مشارك',
      zero: '# مشاركين',
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم اكتشاف # صف',
      many: 'تم اكتشاف # صفًا',
      few: 'تم اكتشاف # صفوف',
      two: 'تم اكتشاف # صفّين',
      one: 'تم اكتشاف # صف',
      zero: 'تم اكتشاف # صفوف',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'أنت غير متصل بالإنترنت';

  @override
  String get offlineBannerSubtitle => 'عرض التحميلات الخاصة بك';

  @override
  String get serverUnreachableBannerTitle => 'تعذّر الوصول إلى الخادم';

  @override
  String get serverUnreachableBannerSubtitle =>
      'التشغيل من التحميلات حتى عودة الخادم';

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
  String get kidsMode => 'Kids Mode';

  @override
  String get kidsModeSubtitle =>
      'Simplify the app and lock the way out with a PIN';

  @override
  String get kidsModeExit => 'Exit Kids Mode';

  @override
  String get kidsModeExitSubtitle => 'Enter your PIN to restore the full app';

  @override
  String get pinIncorrect => 'رقم التعريف الشخصي غير صحيح';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'أرقام التعريف الشخصية غير متطابقة';

  @override
  String get pinForgot => 'هل نسيت رقم التعريف الشخصي؟';

  @override
  String get pinClear => 'مسح';

  @override
  String get pinBackspace => 'مسافة للخلف';

  @override
  String get quickConnectAuthorized => 'تمت الموافقة على طلب Quick Connect.';

  @override
  String get quickConnectInvalidOrExpired =>
      'رمز Quick Connect غير صالح أو منتهي الصلاحية.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect غير مدعوم على هذا الخادم.';

  @override
  String get quickConnectAuthorizeFailed =>
      'تعذّرت الموافقة على رمز Quick Connect.';

  @override
  String get quickConnectDisabled => 'Quick Connect معطّل على هذا الخادم.';

  @override
  String get quickConnectForbidden =>
      'لا يمكن لحسابك الموافقة على طلب Quick Connect هذا.';

  @override
  String get quickConnectNotFound =>
      'لم يُعثر على رمز Quick Connect. جرّب رمزًا جديدًا.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'فشل Quick Connect: $message';
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
  String get trackActionViewDetails => 'View Details';

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
  String get shuffleLibrary => 'المكتبة';

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
  String get stillWatchingStop => 'إيقاف';

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
  String get playerTooltipPrevious => 'السابق';

  @override
  String get playerTooltipSeekBack => 'اطلب العودة';

  @override
  String get playerTooltipSeekForward => 'تسعى إلى الأمام';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
  String get contextMenuHideFromContinueWatching => 'إخفاء من مواصلة المشاهدة';

  @override
  String get contextMenuHideFromNextUp => 'إخفاء من التالي';

  @override
  String get contextMenuAddToCollection => 'إضافة إلى مجموعة';

  @override
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

  @override
  String get settingsAdministrationSubtitle => 'الوصول إلى لوحة إدارة الخادم';

  @override
  String get settingsDynamicContent => 'المحتوى الديناميكي';

  @override
  String get settingsDynamicContentSubtitle =>
      'شريط الوسائط والتراكبات المرئية';

  @override
  String get settingsAboutSubtitle =>
      'إصدار التطبيق والمعلومات القانونية والاعتمادات';

  @override
  String get settingsSortServersBy => 'فرز الخوادم حسب';

  @override
  String get settingsLastUsed => 'آخر استخدام';

  @override
  String get settingsAlphabetical => 'أبجديا';

  @override
  String get settingsAllowSelfSignedCerts => 'السماح بالشهادات الموقّعة ذاتيًا';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'الوثوق بالخوادم التي تستخدم شهادات TLS موقّعة ذاتيًا أو صادرة عن مرجع خاص. فعّل هذا الخيار للخوادم التي تتحكم بها فقط. يؤدي ذلك إلى تعطيل التحقق من الشهادات لجميع الاتصالات.';

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
  String get settingsHomePage => 'الصفحة الرئيسية';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'إظهار زر المكتبات في شريط التنقل';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'إظهار زر Seerr في شريط التنقل';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'إظهار التسميات النصية دائمًا في شريط التنقل العلوي';

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
  String get settingsBoth => 'كلاهما';

  @override
  String get settingsShuffleContentTypeFilter => 'خلط مرشح نوع المحتوى';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'المسارات الصوتية والمعالجة وخيارات العبور';

  @override
  String get settingsAutomationAndQueueSubtitle => 'التشغيل الآلي والتسلسل';

  @override
  String get settingsSyncplaySubtitle => 'منطق المزامنة لجلسات المجموعة';

  @override
  String get settingsSkipIntrosAndOutros => 'تخطي المقدمات والنهايات؟';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'العد التنازلي لمقاطع الوسائط';

  @override
  String get settingsProgressBar => 'شريط التقدم';

  @override
  String get settingsTimer => 'المؤقّت';

  @override
  String get settingsNone => 'بدون';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv (قديم)';

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
  String get settingsAutoAftkrtEnabled => 'تلقائي';

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
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

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
  String recentlyReleasedLibraryName(String libraryName) {
    return 'صدر حديثًا في $libraryName';
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
  String get enableTunnelingTitle => 'تفعيل النفق';

  @override
  String get enableTunnelingSubtitle =>
      'متقدم. يوجّه الصوت والفيديو عبر مسار عتادي مقترن. مُعطّل افتراضيًا لأنه يسبب انقطاعات في الصوت والفيديو على بعض الأجهزة.';

  @override
  String get mapDolbyVisionP7Title =>
      'قم بتعيين Dolby Vision الملف الشخصي 7 إلى HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'تشغيل Dolby Vision الملف الشخصي 7 تيارات كـ HDR10- متوافق مع HEVC على الأجهزة التي لا تحتوي على DV.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

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
  String get showMediaDetailsOnLibraryPage => 'إظهار تفاصيل الوسائط';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'إظهار تفاصيل العنصر المحدد في أعلى صفحات المكتبة.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

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
  String get themeStore => 'متجر السمات';

  @override
  String get themeStoreSubtitle => 'تصفّح سمات المجتمع واحفظها';

  @override
  String get themeStoreDescription =>
      'احفظ سمة لاستخدامها مثل سماتك المحفوظة الأخرى.';

  @override
  String get themeStoreEmpty => 'لا تتوفر أي سمات في الوقت الحالي.';

  @override
  String get themeStoreLoadFailed =>
      'تعذّر تحميل متجر السمات. تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get themeStoreSave => 'حفظ';

  @override
  String get themeStoreSaveAndApply => 'حفظ وتطبيق';

  @override
  String get themeStoreSaved => 'تم الحفظ';

  @override
  String get themeStoreInvalidMessage => 'تعذّر تحميل هذه السمة.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'تم حفظ \"$themeName\".';
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
  String get rowsType => 'نوع الصفوف';

  @override
  String get rowsTypeDescription =>
      'يحتفظ الإصدار الكلاسيكي بنوع الصورة وتراكب المعلومات لكل صف. يستخدم الحديث الصفوف العمودية للخلفية.';

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
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

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
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'أنواع عناصر الصف';

  @override
  String get genresRowItemsDescription =>
      'عرض الأفلام أو المسلسلات أو كليهما في صفوف الأنواع.';

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
  String get displayPlaylistsRows => 'عرض صفوف قوائم التشغيل';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'إظهار صفوف قوائم التشغيل في أقسام الرئيسية.';

  @override
  String get playlistsRowSorting => 'ترتيب صفوف قوائم التشغيل';

  @override
  String get playlistsRowSortingDescription =>
      'رتّب صفوف قوائم التشغيل حسب تاريخ الإضافة أو تاريخ الإصدار أو أبجديًا وغير ذلك.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'عرض صفوف الصوت';

  @override
  String get displayAudioRowsSubtitle => 'إظهار صفوف الصوت في أقسام الرئيسية.';

  @override
  String get audioRowsSorting => 'ترتيب صفوف الصوت';

  @override
  String get audioRowsSortingDescription =>
      'رتّب صفوف الصوت حسب تاريخ الإضافة أو تاريخ الإصدار أو أبجديًا وغير ذلك.';

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
  String get audioPlaylists => 'قوائم تشغيل الصوت';

  @override
  String get appearance => 'المظهر';

  @override
  String get layout => 'التخطيط';

  @override
  String get theme => 'السمة';

  @override
  String get keyboard => 'لوحة المفاتيح';

  @override
  String get navButtons => 'الأزرار';

  @override
  String get rendering => 'التصيير';

  @override
  String get mpvConfiguration => 'تهيئة MPV';

  @override
  String get cardSize => 'حجم البطاقة';

  @override
  String get externalPlayerApp => 'تطبيق مشغل خارجي';

  @override
  String get externalPlayerAppDescription =>
      'عيّن مشغّلاً خارجيًا لتفعيل خيار التشغيل بالضغط المطوّل';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'إظهار منتقي التطبيقات عند بدء التشغيل.';

  @override
  String get loadingInstalledPlayers => 'جارٍ تحميل اللاعبين المثبتين...';

  @override
  String get connection => 'اتصال';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'العبور';

  @override
  String get supportedOnThisDevice => 'المدعومة على هذا الجهاز';

  @override
  String get notSupportedOnThisDevice => 'غير مدعوم على هذا الجهاز';

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
  String get useExternalPlayer => 'استخدام مشغل خارجي';

  @override
  String get useExternalPlayerSubtitle =>
      'افتح تشغيل الفيديو في تطبيقك الخارجي المحدد على Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'قائمة الانتظار التلقائية';

  @override
  String get preferSdhSubtitles => 'تفضل ترجمات SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'قم بإعطاء الأولوية لمسارات الترجمة SDH/CC عند التحديد التلقائي.';

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
  String get appearancesSeerr => 'الظهور (Seerr)';

  @override
  String get crewContributionsSeerr => 'مساهمات طاقم العمل (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'شاهد مع المجموعة';

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
  String get disk => 'القرص';

  @override
  String get openInBrowser => 'فتح في المتصفح';

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
      other: '$count مكتبة',
      many: '$count مكتبة',
      few: '$count مكتبات',
      two: 'مكتبتان',
      zero: 'لا توجد مكتبات',
      one: 'مكتبة واحدة',
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
  String get homeVideos => 'فيديوهات منزلية';

  @override
  String get mixedContent => 'محتوى مختلط';

  @override
  String get homeVideosAndPhotos => 'فيديو وصور منزلية';

  @override
  String get mixedMoviesAndShows => 'أفلام وعروض مختلطة';

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
  String get loadingShuffle => 'جارٍ التحميل العشوائي...';

  @override
  String get libraryShuffleLabel => 'تشغيل عشوائي للمكتبة';

  @override
  String get randomShuffleLabel => 'تشغيل عشوائي';

  @override
  String get genresShuffleLabel => 'تشغيل عشوائي حسب النوع';

  @override
  String get autoHdrSwitching => 'التبديل التلقائي لتقنية HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'تمكين HDR تلقائيًا لتشغيل فيديو HDR واستعادة وضع العرض عند الخروج.';

  @override
  String get whenFullscreen => 'عندما ملء الشاشة';

  @override
  String get changeArtwork => 'تغيير الصور الفنية';

  @override
  String get missing => 'مفقود';

  @override
  String get clearAllArtworkButton => 'مسح جميع الصور الفنية؟';

  @override
  String get clearAllArtworkWarning =>
      'هل أنت متأكد أنك تريد مسح جميع الصور الفنية التي تم تحميلها؟';

  @override
  String get confirmClear => 'تأكيد المسح';

  @override
  String confirmClearMessage(String itemType) {
    return 'هل أنت متأكد أنك تريد مسح $itemType؟';
  }

  @override
  String get uploadButton => 'رفع؟';

  @override
  String get resolutionLabel => 'الدقة: ';

  @override
  String get onlyShowInterfaceLanguage => 'إظهار الصور الفنية بلغة الواجهة فقط';

  @override
  String get confirmClearAll => 'تأكيد مسح الكل';

  @override
  String get imageUploadSuccess => 'تم رفع الصورة بنجاح!';

  @override
  String imageUploadFailed(String error) {
    return 'تعذّر رفع الصورة: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'تعذّر تعيين الصورة: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'تعذّر حذف الصورة: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'تعذّر مسح جميع الصور الفنية: $error';
  }

  @override
  String get yes => 'نعم';

  @override
  String get posterCategory => 'ملصق';

  @override
  String get backdropsCategory => 'خلفيات';

  @override
  String get bannerCategory => 'لافتة';

  @override
  String get logoCategory => 'شعار';

  @override
  String get thumbnailCategory => 'صورة مصغّرة';

  @override
  String get artCategory => 'صورة فنية';

  @override
  String get discArtCategory => 'صورة القرص';

  @override
  String get screenshotCategory => 'لقطة شاشة';

  @override
  String get boxCoverCategory => 'غلاف العلبة';

  @override
  String get boxRearCoverCategory => 'غلاف العلبة الخلفي';

  @override
  String get menuArtCategory => 'صورة القائمة';

  @override
  String get confirmItemPoster => 'الملصق';

  @override
  String get confirmItemBackdrop => 'الخلفية';

  @override
  String get confirmItemBanner => 'اللافتة';

  @override
  String get confirmItemLogo => 'الشعار';

  @override
  String get confirmItemThumbnail => 'الصورة المصغّرة';

  @override
  String get confirmItemArt => 'الصورة الفنية';

  @override
  String get confirmItemDiscArt => 'صورة القرص';

  @override
  String get confirmItemScreenshot => 'لقطة الشاشة';

  @override
  String get confirmItemBoxCover => 'غلاف العلبة';

  @override
  String get confirmItemBoxRearCover => 'غلاف العلبة الخلفي';

  @override
  String get confirmItemMenuArt => 'صورة القائمة';

  @override
  String get resolutionAll => 'الكل';

  @override
  String get resolutionHigh => 'عالية (1080p+)';

  @override
  String get resolutionMedium => 'متوسطة (720p)';

  @override
  String get resolutionLow => 'منخفضة (<720p)';

  @override
  String get sources => 'المصادر';

  @override
  String get audiobookChapters => 'الفصول';

  @override
  String get audiobookBookmarks => 'الإشارات المرجعية';

  @override
  String get audiobookNotes => 'الملاحظات';

  @override
  String get audiobookQueue => 'قائمة الانتظار';

  @override
  String get audiobookTimeline => 'المخطط الزمني';

  @override
  String get audiobookTimelineEmpty => 'المخطط الزمني فارغ';

  @override
  String get audiobookFocusedTimeline => 'المخطط الزمني المركّز';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'تصدير الإشارات المرجعية';

  @override
  String get audiobookExportNotes => 'تصدير الملاحظات';

  @override
  String get audiobookExportAll => 'تصدير الكل';

  @override
  String audiobookExportSuccess(String path) {
    return 'تم التصدير إلى $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'فشل التصدير: $error';
  }

  @override
  String get audiobookLyrics => 'الكلمات';

  @override
  String get audiobookAddBookmark => 'إضافة إشارة مرجعية';

  @override
  String get audiobookAddNote => 'إضافة ملاحظة';

  @override
  String get audiobookEditNote => 'تعديل الملاحظة';

  @override
  String get audiobookNoteHint => 'اكتب ملاحظة لهذه اللحظة';

  @override
  String get audiobookSleepTimer => 'مؤقّت النوم';

  @override
  String get audiobookSleepOff => 'إيقاف';

  @override
  String get audiobookSleepEndOfChapter => 'نهاية الفصل';

  @override
  String get audiobookSleepCustom => 'مخصص';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'متبقٍ $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقيقة',
      many: '$count دقيقة',
      few: '$count دقائق',
      two: 'دقيقتان',
      zero: '$count دقيقة',
      one: 'دقيقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'سرعة التشغيل';

  @override
  String get audiobookRemainingTime => 'المتبقي';

  @override
  String get audiobookElapsedTime => 'المنقضي';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'للخلف $seconds ث';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'للأمام $seconds ث';
  }

  @override
  String get audiobookPreviousChapter => 'الفصل السابق';

  @override
  String get audiobookNextChapter => 'الفصل التالي';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'الفصل $current من $total';
  }

  @override
  String get audiobookNoChapters => 'لا توجد فصول';

  @override
  String get audiobookNoBookmarks => 'لا توجد إشارات مرجعية بعد';

  @override
  String get audiobookNoNotes => 'لا توجد ملاحظات بعد';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'تمت إضافة إشارة مرجعية عند $position';
  }

  @override
  String get audiobookSpeedReset => 'إعادة الضبط إلى 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'حفظ';

  @override
  String get audiobookCancel => 'إلغاء';

  @override
  String get audiobookDelete => 'حذف';

  @override
  String get subtitlePreferencesDescription =>
      'غيّر أوضاع الترجمة واللغات الافتراضية والمظهر وخيارات التصيير.';

  @override
  String get subtitleRendering => 'تصيير الترجمة';

  @override
  String get displayOptions => 'خيارات العرض';

  @override
  String get releaseDateAscending => 'تاريخ الإصدار (تصاعديًا)';

  @override
  String get releaseDateDescending => 'تاريخ الإصدار (تنازليًا)';

  @override
  String get groupContributions => 'تجميع المساهمات';

  @override
  String get groupMultipleRoles => 'تجميع الأدوار المتعددة';

  @override
  String get libraryWriteAccessWarningTitle =>
      'تحذير بشأن صلاحية الكتابة في المكتبة';

  @override
  String get libraryWriteAccessHowToFix => 'كيفية إصلاح ذلك:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. امنح صلاحيات الكتابة لمستخدم خدمة Jellyfin (مثل jellyfin أو PUID/PGID في Docker) على مجلدات مكتبة الوسائط في الخادم.\n\n2. أو انتقل إلى لوحة تحكم Jellyfin ← المكتبات، وعدّل هذه المكتبة، وعطّل خيار \'حفظ الصور الفنية في مجلدات الوسائط\' لتخزين الصور الفنية في قاعدة بيانات Jellyfin الداخلية.';

  @override
  String get dismiss => 'تجاهل';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'مكتبة \'$libraryName\' مضبوطة على حفظ الصور الفنية مباشرة في مجلدات الوسائط (خيار \'حفظ الصور الفنية في مجلدات الوسائط\' مُفعّل). لكن Jellyfin اختبر صلاحية الكتابة ولا يملك إذنًا بكتابة الملفات في هذا المجلد:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'يبدو أن Jellyfin فشل في تحديث الصور الفنية. مكتبتك مضبوطة على حفظ الصور الفنية مباشرة في مجلدات الوسائط (خيار \'حفظ الصور الفنية في مجلدات الوسائط\' مُفعّل). يحدث هذا الخطأ عادةً عندما لا يملك خادم Jellyfin إذنًا بكتابة الملفات في مجلدات الوسائط.';

  @override
  String get replay => 'إعادة التشغيل';

  @override
  String get fileInformation => 'معلومات الملف';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'الحجم: $size  •  الصيغة: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'إظهار جميع مسارات الصوت ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'إظهار جميع مسارات الترجمة ($count)';
  }

  @override
  String get checkingDirectPlay => 'جارٍ التحقق من إمكانية التشغيل المباشر...';

  @override
  String get directPlayCapabilityLabel => 'إمكانية التشغيل المباشر: ';

  @override
  String get forced => 'إجباري';

  @override
  String get transcodeContainerNotSupported =>
      'صيغة الحاوية غير مدعومة من المشغّل.';

  @override
  String get transcodeVideoCodecNotSupported => 'مرمّز الفيديو غير مدعوم.';

  @override
  String get transcodeAudioCodecNotSupported => 'مرمّز الصوت غير مدعوم.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'صيغة الترجمة غير مدعومة (تتطلب الدمج).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'الملف التعريفي للصوت غير مدعوم.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'الملف التعريفي للفيديو غير مدعوم.';

  @override
  String get transcodeVideoLevelNotSupported => 'مستوى الفيديو غير مدعوم.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'دقة الفيديو غير مدعومة على هذا الجهاز.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'عمق ألوان الفيديو غير مدعوم.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'معدل إطارات الفيديو غير مدعوم.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'معدل بت الملف يتجاوز حد البث في المشغّل.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'معدل بت الفيديو يتجاوز حد البث.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'معدل بت الصوت يتجاوز حد البث.';

  @override
  String get transcodeAudioChannelsNotSupported => 'عدد قنوات الصوت غير مدعوم.';

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
  String get sortAlphabetical => 'أبجديًا';

  @override
  String get sortReleaseAscending => 'ترتيب الإصدار (تصاعديًا)';

  @override
  String get sortReleaseDescending => 'ترتيب الإصدار (تنازليًا)';

  @override
  String get sortCustomDragDrop => 'مخصص (سحب وإفلات)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'خيارات ترتيب قائمة التشغيل';

  @override
  String get resetSort => 'إعادة ضبط الترتيب';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'إعادة مشاهدة م$season:ح$episode';
  }

  @override
  String get rewatchPlaylist => 'إعادة مشاهدة قائمة التشغيل';

  @override
  String get noSubtitlesFound => 'لم يُعثر على ترجمات.';

  @override
  String get adminControls => 'أدوات المسؤول';

  @override
  String get impellerRendering => 'محرك التصيير (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller هو محرك التصيير الحديث في Flutter الذي يعتمد على GPU لحركات أكثر سلاسة وتقطّع أقل. قد يسبب خللاً في الصورة أو فيديو أسود على بعض أجهزة التلفزيون وبطاقات GPU الأقدم؛ اضبطه على إيقاف إذا واجهت ذلك. يختار الوضع التلقائي أفضل إعداد افتراضي لجهازك. أعد تشغيل Moonfin للتطبيق.';

  @override
  String get impellerAuto => 'تلقائي';

  @override
  String get impellerOn => 'تشغيل';

  @override
  String get impellerOff => 'إيقاف';

  @override
  String get impellerRestartTitle => 'يلزم إعادة التشغيل';

  @override
  String get impellerRestartMessage =>
      'يحتاج Moonfin إلى إعادة التشغيل لتغيير محرك التصيير. أغلق التطبيق الآن ثم أعد فتحه للتطبيق.';

  @override
  String get impellerCloseNow => 'إغلاق التطبيق الآن';

  @override
  String get adminRefreshLibrary => 'تحديث المكتبة';

  @override
  String get adminRefreshAllLibraries => 'تحديث جميع المكتبات';

  @override
  String get adminRepoSortDateOldest => 'تاريخ الإضافة (الأقدم أولاً)';

  @override
  String get adminRepoSortDateNewest => 'تاريخ الإضافة (الأحدث أولاً)';

  @override
  String get adminRepoSortNameAsc => 'أبجديًا (من A إلى Z)';

  @override
  String get adminRepoSortNameDesc => 'أبجديًا (من Z إلى A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'جارٍ تحميل تحليلات الخادم... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'مطابقة المصدر';

  @override
  String get imdbTop250Movies => 'أفضل 250 فيلمًا على IMDb';

  @override
  String get imdbTop250TvShows => 'أفضل 250 مسلسلاً على IMDb';

  @override
  String get imdbMostPopularMovies => 'أكثر الأفلام شعبية على IMDb';

  @override
  String get imdbMostPopularTvShows => 'أكثر المسلسلات شعبية على IMDb';

  @override
  String get imdbLowestRatedMovies => 'الأفلام الأقل تقييمًا على IMDb';

  @override
  String get imdbTopEnglishMovies => 'أفضل الأفلام الإنجليزية تقييمًا على IMDb';

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
  String get downloadNotificationFailedTitle => 'فشل التنزيل';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'رسالة من السيرفر';

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
  String get integrations => 'التكامل';

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
