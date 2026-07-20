// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'העדפות חשבון';

  @override
  String get interfaceLanguage => 'שפת הממשק';

  @override
  String get systemLanguageDefault => 'ברירת המחדל של המערכת';

  @override
  String get signIn => 'היכנס';

  @override
  String get empty => 'ריק';

  @override
  String connectingToServer(String serverName) {
    return 'מתחבר אל $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'סִיסמָה';

  @override
  String get username => 'שם משתמש';

  @override
  String get email => 'אֶלֶקטרוֹנִי';

  @override
  String get quickConnectInstruction =>
      'הזן את הקוד הזה בלוח המחוונים האינטרנטי של השרת שלך:';

  @override
  String get waitingForAuthorization => 'ממתין לאישור...';

  @override
  String get back => 'חזרה';

  @override
  String get serverUnavailable => 'השרת אינו זמין';

  @override
  String get loginFailed => 'הכניסה נכשלה';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect אינו זמין: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect אינו זמין ($status): $detail';
  }

  @override
  String get whosWatching => 'מי צופה?';

  @override
  String get addUser => 'הוסף משתמש';

  @override
  String get selectServer => 'בחר שרת';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin גרסה $version';
  }

  @override
  String get savedServers => 'שרתים שמורים';

  @override
  String get discoveredServers => 'שרתים שהתגלו';

  @override
  String get noneFound => 'אף אחד לא נמצא';

  @override
  String get unableToConnectToServer => 'לא מצליח להתחבר לשרת';

  @override
  String get addServer => 'הוסף שרת';

  @override
  String get embyConnect => 'Emby התחבר';

  @override
  String get removeServer => 'הסר את השרת';

  @override
  String removeServerConfirmation(String serverName) {
    return 'להסיר את \"$serverName\" מרשימת השרתים שלך?';
  }

  @override
  String get cancel => 'לְבַטֵל';

  @override
  String get remove => 'הסר';

  @override
  String get connectToServer => 'התחבר לשרת';

  @override
  String get serverAddress => 'כתובת שרת';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'לְחַבֵּר';

  @override
  String get secureStorageUnavailable => 'אחסון מאובטח אינו זמין';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin לא הצליח לגשת למחזיק המפתחות של המערכת שלך. הכניסה יכולה להמשיך, אך ייתכן שאחסון אסימונים מאובטח לא יהיה זמין עד לביטול הנעילה של מחזיק המפתחות.';

  @override
  String get ok => 'בְּסֵדֶר';

  @override
  String get settingsAppearanceTheme => 'ערכת נושא לאפליקציה';

  @override
  String get detailScreenStyle => 'סגנון מסך הפרטים';

  @override
  String get detailScreenStyleSubtitle =>
      'קלאסי הוא הפריסה הממורכזת המקורית של Moonfin. מודרני הוא פריסה קולנועית רספונסיבית.';

  @override
  String get detailScreenStyleMoonfin => 'קלאסי';

  @override
  String get detailScreenStyleModern => 'מודרני';

  @override
  String get expandedTabs => 'לשוניות מורחבות';

  @override
  String get expandedTabsSubtitle =>
      'הצג אוטומטית את תוכן הלשונית בעת מעבר בין לשוניות. כבה כדי לפתוח ולסגור כל לשונית ידנית.';

  @override
  String get showTechnicalDetails => 'להציג פרטים טכניים?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'הצג מידע על קודק, רזולוציה וזרם בתקציר הכרזה';

  @override
  String get recommendationSystem => 'מערכת ההמלצות';

  @override
  String get recommendationSystemSubtitle =>
      'השתמש באלגוריתם הספרייה המקומית של Moonfin Recommends או במדדי הדמיון המקוונים של TMDb. לתשומת לבך: המלצות מקוונות מחייבות שילוב עם Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'דמיון TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'להחיל מגבלת דירוג הורים?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'הגבל את ההצעות של Moonfin Recommends לפי דירוג ההורים של המדיה';

  @override
  String get interfaceStyle => 'סגנון הממשק';

  @override
  String get interfaceStyleSubtitle =>
      'אוטומטי מתאים את עצמו למכשיר שלך. בחר Apple או Material כדי לכפות מראה מסוים.';

  @override
  String get interfaceStyleAutomatic => 'אוטומטי';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'איכות הזכוכית';

  @override
  String get glassQualitySubtitle =>
      'אוטומטי בוחר את אפקט הזכוכית הטוב ביותר למכשיר זה. מלא כופה טשטוש אמיתי; מופחת משתמש בזכוכית קלת משקל שחוסכת בצריכת ה-GPU.';

  @override
  String get glassQualityAuto => 'אוטומטי';

  @override
  String get glassQualityFull => 'מלא';

  @override
  String get glassQualityReduced => 'מופחת';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'מעבר בין Moonfin ל-Neon Pulse מבלי להפעיל מחדש את האפליקציה';

  @override
  String get customThemeTitle => 'ערכת נושא מותאמת';

  @override
  String get customThemeSubtitle =>
      'ערכות נושא מותאמות משנות רכיבים חזותיים ברחבי Moonfin. בחר אחת מהאפשרויות כדי להתאים לסגנון שלך.';

  @override
  String get keyboardPreferSystemIme => 'העדף את מקלדת המערכת';

  @override
  String get keyboardPreferSystemImeDescription =>
      'השתמש בשיטת הקלט של המכשיר כברירת מחדל להזנת טקסט';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => 'מראה Moonfin נוכחי שכולכם למדתם לאהוב';

  @override
  String get themeNeonPulse => 'דופק ניאון';

  @override
  String get themeNeonPulseSubtitle =>
      'עיצוב גלי סינת\' עם זוהר מגנטה, טקסט בצבע ציאן וניגודיות כרום חזקה יותר';

  @override
  String get themeGlass => 'זכוכית';

  @override
  String get themeGlassSubtitle =>
      'עיצוב זכוכית נוזלית עם רקע מדורג נע, משטחים חלביים ונגיעת כחול של Apple';

  @override
  String get theme8BitHero => 'גיבור 8-ביט';

  @override
  String get theme8BitHeroSubtitle =>
      'עיצוב פיקסל-ארט רטרו עם פלטה עבה, מסגרות מרובעות, צללים חדים וגופן פיקסלים';

  @override
  String get embyConnectSignInSubtitle => 'היכנס עם חשבון Emby Connect שלך';

  @override
  String get emailOrUsername => 'אימייל או שם משתמש';

  @override
  String get selectAServer => 'בחר שרת';

  @override
  String get tryAgain => 'נסה שוב';

  @override
  String get noLinkedServers => 'אין שרתים מקושרים לחשבון Emby Connect זה';

  @override
  String get invalidEmbyConnectCredentials =>
      'אישורים לא חוקיים של Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'שם משתמש או סיסמה לא חוקיים של Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'השרת אינו תומך בחילופי Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'שגיאת רשת בעת יצירת קשר עם Emby Connect או עם השרת הנבחר';

  @override
  String get loadingLinkedServers => 'טוען שרתים מקושרים...';

  @override
  String get connectingToServerEllipsis => 'מתחבר לשרת...';

  @override
  String get noReachableAddress => 'לא סופקה כתובת נגישה';

  @override
  String get invalidServerExchangeResponse =>
      'תגובה לא חוקית מנקודת הקצה של החלפת שרת';

  @override
  String unableToConnectTo(String target) {
    return 'לא ניתן להתחבר אל $target';
  }

  @override
  String get exitApp => 'לצאת מ- Moonfin?';

  @override
  String get exitAppConfirmation => 'האם אתה בטוח שאתה רוצה לצאת?';

  @override
  String get exit => 'יְצִיאָה';

  @override
  String get gameMenu => 'תפריט';

  @override
  String get gamePaused => 'מושהה';

  @override
  String get gameSaveState => 'שמור מצב';

  @override
  String get games => 'משחקים';

  @override
  String get gameLoadState => 'טען מצב';

  @override
  String get gameFastForward => 'הרצה מהירה';

  @override
  String get gameEmulatorSettings => 'הגדרות אמולטור';

  @override
  String get gameNoCoreOptions => 'לליבה זו אין אפשרויות להתאמה.';

  @override
  String get gameHoldToOpenMenu => 'החזק כדי לפתוח את התפריט';

  @override
  String get gamePlaybackUnsupported =>
      'הפעלת משחקים אינה נתמכת עדיין במכשיר זה.';

  @override
  String get noHomeRowsLoaded => 'לא ניתן היה לטעון שורות בית';

  @override
  String get noHomeRowsHint => 'נסה לרענן או לצמצם חלקי בית פעילים.';

  @override
  String get retryHomeRows => 'נסה שוב את שורות הבית';

  @override
  String get guide => 'מַדְרִיך';

  @override
  String get recordings => 'הקלטות';

  @override
  String get schedule => 'לוּחַ זְמַנִים';

  @override
  String get series => 'סדרות';

  @override
  String get noItemsFound => 'לא נמצאו פריטים';

  @override
  String get home => 'דף הבית';

  @override
  String get browseAll => 'עיין בהכל';

  @override
  String get genres => 'ז\'אנרים';

  @override
  String get collectionPlaceholder => 'פריטי אוסף יופיעו כאן';

  @override
  String get browseByLetter => 'דפדוף לפי אותיות';

  @override
  String get alphabeticalBrowsePlaceholder => 'עיון באלפביתי יופיע כאן';

  @override
  String get suggestions => 'הצעות';

  @override
  String get suggestionsPlaceholder => 'פריטים מוצעים יופיעו כאן';

  @override
  String get failedToLoadLibraries => 'טעינת הספריות נכשלה';

  @override
  String get noLibrariesFound => 'לא נמצאו ספריות';

  @override
  String get library => 'ספרייה';

  @override
  String get displaySettings => 'הגדרות תצוגה';

  @override
  String get allGenres => 'כל הז\'אנרים';

  @override
  String get noGenresFound => 'לא נמצאו ז\'אנרים';

  @override
  String failedToLoadFolderError(String error) {
    return 'טעינת התיקייה נכשלה: $error';
  }

  @override
  String get thisFolderIsEmpty => 'התיקיה הזו ריקה';

  @override
  String itemCountLabel(int count) {
    return '$count פריטים';
  }

  @override
  String get failedToLoadFavorites => 'טעינת המועדפים נכשלה';

  @override
  String get retry => 'נסה שוב';

  @override
  String get noFavoritesYet => 'עדיין אין מועדפים';

  @override
  String get favorites => 'מועדפים';

  @override
  String totalCountItems(int count) {
    return '$count פריטים';
  }

  @override
  String get continuing => 'ממשיכים';

  @override
  String get ended => 'הסתיים';

  @override
  String get sortAndFilter => 'מיון וסנן';

  @override
  String get type => 'סוּג';

  @override
  String get sortBy => 'מיין לפי';

  @override
  String get display => 'לְהַצִיג';

  @override
  String get imageType => 'סוג תמונה';

  @override
  String get posterSize => 'גודל פוסטר';

  @override
  String get small => 'קָטָן';

  @override
  String get medium => 'בֵּינוֹנִי';

  @override
  String get large => 'גָדוֹל';

  @override
  String get extraLarge => 'גדול במיוחד';

  @override
  String libraryGenresTitle(String name) {
    return '$name — ז\'אנרים';
  }

  @override
  String get views => 'צפיות';

  @override
  String get albums => 'אלבומים';

  @override
  String get albumArtists => 'אמני אלבום';

  @override
  String get artists => 'אמנים';

  @override
  String get bookmarks => 'סימניות';

  @override
  String get noSavedBookmarks => 'אין עדיין סימניות שמורות עבור הכותר הזה.';

  @override
  String get openBook => 'פתח ספר';

  @override
  String get chapter => 'פֶּרֶק';

  @override
  String get page => 'עַמוּד';

  @override
  String get bookmark => 'סימניה';

  @override
  String get justNow => 'זֶה עַתָה';

  @override
  String minutesAgo(int count) {
    return 'לפני $count דק\'';
  }

  @override
  String hoursAgo(int count) {
    return 'לפני $count שע\'';
  }

  @override
  String daysAgo(int count) {
    return 'לפני $count ימים';
  }

  @override
  String get discoverySubjects => 'נושאי גילוי';

  @override
  String get pickDiscoverySubjects =>
      'בחר אילו עדכוני נושאים להציג ב-Discover.';

  @override
  String get apply => 'החל';

  @override
  String get openLink => 'פתח קישור';

  @override
  String get scanWithYourPhone => 'סרוק עם הטלפון שלך';

  @override
  String get audiobookGenres => 'ז\'אנרים של ספרי שמע';

  @override
  String get pickAudiobookGenres =>
      'בחר אילו ז\'אנרים להצגה ב- Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'גלה ספרי אודיו';

  @override
  String get librivoxDescription => 'כותרים פופולריים ברשות הרבים מ-LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count כותרים';
  }

  @override
  String get scrollLeft => 'גלול שמאלה';

  @override
  String get scrollRight => 'גלול ימינה';

  @override
  String get couldNotLoadGenre => 'לא ניתן לטעון את הז\'אנר הזה כרגע.';

  @override
  String get continueReading => 'המשך קריאה';

  @override
  String get savedHighlights => 'הדגשות שמורות';

  @override
  String get continueListening => 'המשך להקשיב';

  @override
  String get listen => 'לְהַקְשִׁיב';

  @override
  String get resume => 'המשך';

  @override
  String get failedToLoadLibrary => 'טעינת הספרייה נכשלה';

  @override
  String get popularNow => 'פופולרי עכשיו';

  @override
  String get savedForLater => 'נשמר למועד מאוחר יותר';

  @override
  String get topListens => 'האזנות מובילות';

  @override
  String get unreadDiscoveries => 'תגליות שלא נקראו';

  @override
  String get pickUpAgain => 'תרים שוב';

  @override
  String get bookHighlightsDescription =>
      'הספרים שלך עם דגשים, מועדפים או התקדמות הקריאה.';

  @override
  String get handPickedFromLibrary => 'נבחר ידנית מהספרייה שלך.';

  @override
  String get handPickedFromListeningQueue => 'נבחר ידנית מתוך תור ההאזנה שלך.';

  @override
  String get booksWithHighlights =>
      'ספרים עם דגשים, מועדפים או התקדמות בקריאה.';

  @override
  String get jumpBackNarration => 'קפוץ חזרה לקריינות מבלי לחפש את המקום שלך.';

  @override
  String get unreadBooksReady => 'ספרים שלא נקראו מוכנים לשעה השקטה הבאה.';

  @override
  String get quickAccessFavorites =>
      'גישה מהירה לספרים שאתה כל הזמן חוזר אליהם.';

  @override
  String get searchAudiobooks => 'חפש ספרי שמע';

  @override
  String get searchYourLibrary => 'חפש בספרייה שלך';

  @override
  String get pickUpStory => 'תמשיך את הסיפור מאיפה שהפסקת';

  @override
  String get savedPlacesChapters => 'המקומות השמורים והפרקים הלא גמורים שלך';

  @override
  String authorsCount(int count) {
    return '$count מחברים';
  }

  @override
  String genresCount(int count) {
    return '$count ז\'אנרים';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% הושלמו';
  }

  @override
  String get readyWhenYouAre => 'מוכן כשאתה';

  @override
  String get details => 'פרטים';

  @override
  String get listeningRoom => 'חדר האזנה';

  @override
  String get bookmarksAndProgress => 'סימניות והתקדמות';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count כותרים מסודרים לעיון שמתמקד בקריאה.';
  }

  @override
  String get titles => 'כותרים';

  @override
  String get allTitles => 'כל הכותרות';

  @override
  String get authors => 'מחברים';

  @override
  String get browseByAuthor => 'דפדוף לפי מחבר';

  @override
  String get browseByGenre => 'דפדף לפי ז\'אנר';

  @override
  String get discover => 'לְגַלוֹת';

  @override
  String get trendingTitlesOpenLibrary =>
      'כותרות פופולריות לפי נושא מ-Open Library.';

  @override
  String get noBookmarkedItems => 'עדיין אין פריטים מסומנים';

  @override
  String get nothingMatchesSection =>
      'שום דבר עדיין לא תואם את הסעיף הזה. נסה כרטיסייה אחרת או חזור לאחר סיום סנכרון הספרייה.';

  @override
  String get audiobooks => 'ספרי שמע';

  @override
  String noLabelFound(String label) {
    return 'לא נמצאו $label';
  }

  @override
  String get folder => 'תיקיה';

  @override
  String get filters => 'מסננים';

  @override
  String get readingStatus => 'סטטוס קריאה';

  @override
  String get playedStatus => 'סטטוס שיחק';

  @override
  String get readStatus => 'לִקְרוֹא';

  @override
  String get watched => 'נצפה';

  @override
  String get unread => 'לא נקרא';

  @override
  String get unwatched => 'לא נצפה';

  @override
  String get seriesStatus => 'סטטוס סדרה';

  @override
  String get allLibraries => 'כל הספריות';

  @override
  String get books => 'ספרים';

  @override
  String get latestBooks => 'הספרים האחרונים';

  @override
  String get latestAudiobooks => 'ספרי השמע האחרונים';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ספרים',
      two: 'שני ספרים',
      one: 'ספר אחד',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'ספר';

  @override
  String get bookFormatAudiobook => 'ספר שמע';

  @override
  String bookPercentRead(int percent) {
    return '$percent% נקראו';
  }

  @override
  String bookTimeLeft(String time) {
    return 'נותרו $time';
  }

  @override
  String get bookHeroRead => 'קרא';

  @override
  String get bookHeroListen => 'האזן';

  @override
  String get author => 'מְחַבֵּר';

  @override
  String get unknownAuthor => 'מחבר לא ידוע';

  @override
  String get uncategorized => 'לא מסווג';

  @override
  String get overview => 'סקירה כללית';

  @override
  String get noLibrivoxDescription =>
      'לא סיפק עדיין תיאור על ידי LibriVox עבור כותר זה.';

  @override
  String get readers => 'קוראים';

  @override
  String get openLinks => 'פתח קישורים';

  @override
  String get librivoxPage => 'עמוד LibriVox';

  @override
  String get internetArchive => 'ארכיון אינטרנט';

  @override
  String get rssFeed => 'הזנת RSS';

  @override
  String get downloadZip => 'הורד את Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count חלקים';
  }

  @override
  String firstPublished(int year) {
    return 'פורסם לראשונה ב-$year';
  }

  @override
  String get noOpenLibraryOverview =>
      'אין עדיין סקירה כללית זמינה מ-Open Library עבור כותר זה.';

  @override
  String get subjects => 'נושאים';

  @override
  String get all => 'כֹּל';

  @override
  String booksCount(int count) {
    return '$count ספרים';
  }

  @override
  String get couldNotLoadSubject => 'לא ניתן לטעון נושא זה כעת.';

  @override
  String get audiobookDetails => 'פרטי ספר שמע';

  @override
  String authorsCountTitle(int count) {
    return '$count מחברים';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ספרי שמע',
      two: 'שני ספרי שמע',
      one: 'ספר שמע אחד',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'רשימת רצועות';

  @override
  String get itemListPlaceholder => 'רשימת הפריטים תופיע כאן';

  @override
  String get failedToLoad => 'הטעינה נכשלה';

  @override
  String get delete => 'מחק';

  @override
  String get save => 'שמור';

  @override
  String get moreLikeThis => 'עוד כאלה';

  @override
  String get castAndCrew => 'שחקנים וצוות';

  @override
  String get collection => 'גְבִיָה';

  @override
  String get episodes => 'פרקים';

  @override
  String get nextUp => 'הבא למעלה';

  @override
  String get seasons => 'עונות';

  @override
  String get chapters => 'פרקים';

  @override
  String get features => 'תכונות';

  @override
  String get movies => 'סרטים';

  @override
  String get musicVideos => 'קליפים';

  @override
  String get other => 'אַחֵר';

  @override
  String get discography => 'דיסקוגרפיה';

  @override
  String get similarArtists => 'אמנים דומים';

  @override
  String get tableOfContents => 'תוֹכֶן הָעִניָנִים';

  @override
  String get tracklist => 'רשימת רצועות';

  @override
  String discNumber(int number) {
    return 'דיסק $number';
  }

  @override
  String get biography => 'בִּיוֹגְרַפִיָה';

  @override
  String get authorDetails => 'פרטי מחבר';

  @override
  String get noOverviewAvailable =>
      'אין עדיין סקירה כללית זמינה עבור הכותר הזה.';

  @override
  String get noBiographyAvailable => 'אין ביוגרפיה זמינה עבור מחבר זה.';

  @override
  String get noBooksFound => 'לא נמצאו ספרים עבור מחבר זה.';

  @override
  String get unableToLoadAuthorDetails => 'לא ניתן לטעון את פרטי המחבר כרגע.';

  @override
  String published(int year) {
    return 'פורסם ב-$year';
  }

  @override
  String get publicationDateUnknown => 'תאריך פרסום לא ידוע';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count עונות',
      two: 'שתי עונות',
      one: 'עונה אחת',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'מסתיים ב-$time';
  }

  @override
  String get items => 'פריטים';

  @override
  String get extras => 'תוספות';

  @override
  String get behindTheScenes => 'מאחורי הקלעים';

  @override
  String get deletedScenes => 'סצנות שנמחקו';

  @override
  String get featurettes => 'סרטונים נלווים';

  @override
  String get interviews => 'ראיונות';

  @override
  String get scenes => 'סצנות';

  @override
  String get shorts => 'סרטים קצרים';

  @override
  String get trailers => 'טריילרים';

  @override
  String timeRemaining(String time) {
    return 'נותרו $time';
  }

  @override
  String endsIn(String time) {
    return 'מסתיים בעוד $time';
  }

  @override
  String get view => 'נוֹף';

  @override
  String get resumeReading => 'המשך קריאה';

  @override
  String get read => 'לִקְרוֹא';

  @override
  String resumeFrom(String position) {
    return 'המשך מ-$position';
  }

  @override
  String get play => 'נגן';

  @override
  String get startOver => 'התחל מחדש';

  @override
  String get restart => 'הפעל מחדש';

  @override
  String get readOffline => 'קרא במצב לא מקוון';

  @override
  String get playOffline => 'שחק במצב לא מקוון';

  @override
  String get audio => 'שֶׁמַע';

  @override
  String get subtitles => 'כתוביות';

  @override
  String get version => 'גִרְסָה';

  @override
  String get cast => 'שידור';

  @override
  String get trailer => 'טריילר';

  @override
  String get finished => 'גָמוּר';

  @override
  String get favorited => 'מועדף';

  @override
  String get favorite => 'מוּעֲדָף';

  @override
  String get playlist => 'רשימת השמעה';

  @override
  String get downloaded => 'הורד';

  @override
  String get downloadAll => 'הורד הכל';

  @override
  String get download => 'הורד';

  @override
  String get deleteDownloaded => 'מחק הורדה';

  @override
  String get goToSeries => 'לך לסדרה';

  @override
  String get editMetadata => 'ערוך מטא נתונים';

  @override
  String get less => 'פָּחוֹת';

  @override
  String get more => 'יוֹתֵר';

  @override
  String get deleteItem => 'מחק פריט';

  @override
  String get deletePlaylist => 'מחק רשימת השמעה';

  @override
  String get deletePlaylistMessage => 'למחוק את הפלייליסט הזה מהשרת?';

  @override
  String get deleteItemMessage => 'למחוק את הפריט הזה מהשרת?';

  @override
  String get failedToDeletePlaylist => 'מחיקת הפלייליסט נכשלה';

  @override
  String get failedToDeleteItem => 'מחיקת הפריט נכשלה';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'שנה שם רשימת השמעה';

  @override
  String get playlistName => 'שם רשימת ההשמעה';

  @override
  String get deleteDownloadedAlbum => 'מחק את האלבום שהורד';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'למחוק את הרצועות שהורדו עבור \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'רצועות שהורדו נמחקו';

  @override
  String get downloadedTracksDeleteFailed =>
      'לא ניתן היה למחוק חלק מהרצועות שהורדו';

  @override
  String get noTracksLoaded => 'לא נטענו רצועות';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'לא נטענו $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'מוריד את $title ($count פריטים)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'האם למחוק את \"$name\" מהשרת? לא ניתן לבטל פעולה זו.';
  }

  @override
  String get itemDeleted => 'הפריט נמחק';

  @override
  String get noPlayableTrailerFound => 'לא נמצא טריילר שניתן לשחק.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'פורמט ספר לא נתמך: .$extension';
  }

  @override
  String get audioTrack => 'רצועת אודיו';

  @override
  String get subtitleTrack => 'רצועת כתוביות';

  @override
  String get none => 'ללא';

  @override
  String get downloadSubtitlesLabel => 'הורד כתוביות...';

  @override
  String get searchOpenSubtitlesPlugin => 'חפש באמצעות הפלאגין OpenSubtitles';

  @override
  String get downloadSubtitles => 'הורד כתוביות';

  @override
  String get selectedSubtitleInvalid => 'הכתובית שנבחרה אינה חוקית.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'הכתובית הורדה ונבחרה: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'הורדת כתוביות. עשוי לקחת רגע עד שיופיע בזמן שJellyfin מרענן את הפריט.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'לא נמצאו כתוביות מרוחקות עבור $language.';
  }

  @override
  String get selectVersion => 'בחר גרסה';

  @override
  String versionNumber(int number) {
    return 'גרסה $number';
  }

  @override
  String get downloadAllQuality => 'הורד הכל - איכות';

  @override
  String get downloadQuality => 'איכות הורדה';

  @override
  String get originalFileNoReencoding => 'קובץ מקורי, ללא קידוד מחדש';

  @override
  String get originalFilesNoReencoding => 'קבצים מקוריים, ללא קידוד מחדש';

  @override
  String get noEpisodesLoaded => 'לא נטענו פרקים';

  @override
  String downloadingItem(String name, String quality) {
    return 'מוריד את $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'מחק קבצים שהורדת';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'למחוק את הקבצים המקומיים של $typeLabel?\n\nפעולה זו תפנה שטח אחסון. תוכל להוריד אותם שוב מאוחר יותר.';
  }

  @override
  String get downloadedFilesDeleted => 'קבצים שהורדו נמחקו';

  @override
  String get failedToDeleteFiles => 'מחיקת הקבצים נכשלה';

  @override
  String get deleteFiles => 'מחק קבצים';

  @override
  String get director => 'מְנַהֵל';

  @override
  String get directors => 'במאים';

  @override
  String get writer => 'תסריטאי';

  @override
  String get writers => 'תסריטאים';

  @override
  String get studio => 'סטוּדִיוֹ';

  @override
  String studioMoreCount(int count) {
    return '+$count נוספים';
  }

  @override
  String totalEpisodes(int count) {
    return '$count פרקים';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'פרק $number';
  }

  @override
  String chapterNumber(int number) {
    return 'פרק $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count רצועות',
      two: 'שתי רצועות',
      one: 'רצועה אחת',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count פרקים',
      two: 'שני פרקים',
      one: 'פרק אחד',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'נולד ב-$date';
  }

  @override
  String died(String date) {
    return 'נפטר ב-$date';
  }

  @override
  String age(int age) {
    return 'גיל $age';
  }

  @override
  String get showLess => 'הצג פחות';

  @override
  String get readMore => 'קרא עוד';

  @override
  String get shuffle => 'ערבוב';

  @override
  String get shuffleAllMusic => 'ערבב את כל המוזיקה';

  @override
  String get carSignInPrompt => 'היכנס ל-Moonfin בטלפון שלך';

  @override
  String get carServerUnreachable => 'לא ניתן להגיע לשרת שלך';

  @override
  String downloadsCount(int count) {
    return '$count הורדות';
  }

  @override
  String get perfectMatch => 'התאמה מושלמת';

  @override
  String channelsCount(int count) {
    return '$count ערוצים';
  }

  @override
  String get mono => 'מונו';

  @override
  String get stereo => 'סטריאו';

  @override
  String remoteSubtitlePermissionError(String action) {
    return '$action של כתוביות מרוחקות מחייב הרשאת ניהול כתוביות של Jellyfin עבור משתמש זה.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'הפריט לא נמצא בשרת עבור $action של כתוביות מרוחקות.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '$action של כתוביות מרוחקות נכשל: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '$action של כתוביות מרוחקות נכשל (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'לא ניתן לבצע $action לכתוביות מרוחקות.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'כל הפרקים שהורדו עבור \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'כל הפרקים שהורדו בעונה זו';

  @override
  String get stillWatching => 'עדיין צופה?';

  @override
  String get unableToLoadTrailerStream => 'לא ניתן לטעון את זרם הטריילר.';

  @override
  String get trailerTimedOut => 'תם הזמן הקצוב של הטריילר בזמן הטעינה.';

  @override
  String get playbackFailedForTrailer => 'ההשמעה של הטריילר הזה נכשלה.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'העברה אינה זמינה במהלך הפעלה במצב לא מקוון.';

  @override
  String castActionFailed(String label, String error) {
    return 'פעולת $label נכשלה: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'הגדרת עוצמת הקול של ה-Cast נכשלה: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'פקדי $label';
  }

  @override
  String get deviceVolume => 'עוצמת הקול של המכשיר';

  @override
  String get unavailable => 'לא זמין';

  @override
  String get pause => 'השהה';

  @override
  String get syncPosition => 'מיקום סנכרון';

  @override
  String stopCast(String label) {
    return 'עצור את $label';
  }

  @override
  String get queueIsEmpty => 'התור ריק';

  @override
  String trackNumber(int number) {
    return 'רצועה $number';
  }

  @override
  String get remotePlayback => 'השמעה מרחוק';

  @override
  String get castingToGoogleCast => 'העברה ל-Google Cast';

  @override
  String get castingViaAirPlay => 'ליהוק באמצעות AirPlay';

  @override
  String get castingViaDlna => 'ליהוק באמצעות DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds שניות';
  }

  @override
  String get longPressToUnlock => 'לחץ לחיצה ארוכה כדי לפתוח';

  @override
  String get off => 'כבוי';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'אוטומטי';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'ביטול קצב סיביות';

  @override
  String get audioDelay => 'השהיית שמע';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'עיכוב כתוביות';

  @override
  String get reset => 'איפוס';

  @override
  String get unknown => 'לֹא יְדוּעַ';

  @override
  String get playbackInformation => 'מידע השמעה';

  @override
  String get playback => 'השמעה';

  @override
  String get playMethod => 'שיטת משחק';

  @override
  String get directPlay => 'משחק ישיר';

  @override
  String get directStream => 'זרם ישיר';

  @override
  String get transcoding => 'המרת קידוד';

  @override
  String get transcodeReasons => 'סיבות להמרה';

  @override
  String get player => 'נגן';

  @override
  String get container => 'מְכוֹלָה';

  @override
  String get bitrate => 'קצב סיביות';

  @override
  String get video => 'וִידֵאוֹ';

  @override
  String get resolution => 'הַחְלָטָה';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'קודק';

  @override
  String get videoBitrate => 'קצב סיביות של וידאו';

  @override
  String get track => 'רצועה';

  @override
  String get channels => 'ערוצים';

  @override
  String get audioBitrate => 'אודיו Bitrate';

  @override
  String get sampleRate => 'קצב דגימה';

  @override
  String get format => 'פוּרמָט';

  @override
  String get external => 'חִיצוֹנִי';

  @override
  String get embedded => 'מוטבע';

  @override
  String castSessionError(String protocol) {
    return 'שגיאת הפעלה של $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'טעינת פרטי הספר נכשלה: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'עיבוד EPUB בתוך האפליקציה אינו זמין בפלטפורמה זו עדיין.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'פורמט זה (.$extension) עדיין לא ניתן להצגה בתוך האפליקציה.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'עיבוד מסמכים משובצים אינו זמין בפלטפורמה זו.';

  @override
  String get couldNotOpenExternalViewer =>
      'לא ניתן היה לפתוח את המציג החיצוני.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'פתיחת הקורא המובנה נכשלה: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'סימנייה כבר נשמרה ב-$label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'סימנייה נוספה: $label';
  }

  @override
  String get noBookmarksYet =>
      'עדיין אין סימניות.\nהקש על סמל הסימניה בזמן הקריאה כדי לשמור את המיקום שלך.';

  @override
  String get noTableOfContentsAvailable => 'אין תוכן עניינים זמין';

  @override
  String pageLabel(int number) {
    return 'עמוד $number';
  }

  @override
  String get position => 'מַצָב';

  @override
  String get bookReader => 'קורא ספרים';

  @override
  String formatExtension(String extension) {
    return 'פורמט: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% נקראו';
  }

  @override
  String get updating => 'עִדכּוּן...';

  @override
  String get markUnread => 'סמן לא נקרא';

  @override
  String get markAsRead => 'סמן כקריאה';

  @override
  String get reloadReader => 'טען מחדש את הקורא';

  @override
  String get noPagesFound => 'לא נמצאו דפים.';

  @override
  String get failedToDecodePageImage => 'פענוח תמונת העמוד נכשל.';

  @override
  String resetZoom(String zoom) {
    return 'אפס תקריב (${zoom}x)';
  }

  @override
  String get singlePage => 'עמוד בודד';

  @override
  String get twoPageSpread => 'פריסה של שני עמודים';

  @override
  String get addBookmark => 'הוסף סימניה';

  @override
  String get bookmarksEllipsis => 'סימניות...';

  @override
  String get markedAsRead => 'סומן כנקרא';

  @override
  String get markedAsUnread => 'סומן כלא נקרא';

  @override
  String failedToUpdateReadState(String error) {
    return 'עדכון מצב הקריאה נכשל: $error';
  }

  @override
  String get themeSystem => 'נושא: מערכת';

  @override
  String get themeLight => 'נושא: אור';

  @override
  String get themeDark => 'נושא: כהה';

  @override
  String get themeSepia => 'נושא: ספיה';

  @override
  String get invertColorsFixedLayout => 'היפוך צבעים (פריסה קבועה)';

  @override
  String get invertColorsPdf => 'הפוך צבעים (PDF)';

  @override
  String get preparingInAppReader => 'מכין קורא בתוך האפליקציה...';

  @override
  String get pdfDataNotAvailable => 'נתוני PDF אינם זמינים.';

  @override
  String get readerFallbackModeActive => 'מצב החזרה של הקורא פעיל';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'פלטפורמה זו אינה תומכת במנוע המסמכים המובנה עבור קובצי $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'השתמש ב-Reload Reader לאחר מעבר ליעד פלטפורמה נתמך (אנדרואיד, iOS, macOS).';

  @override
  String get openExternally => 'פתח חיצוני';

  @override
  String get noEpubChaptersFound => 'לא נמצאו פרקי EPUB.';

  @override
  String get readerNotReady => 'הקורא לא מוכן.';

  @override
  String get seriesRecordings => 'הקלטות סדרה';

  @override
  String get now => 'עַכשָׁיו';

  @override
  String get sports => 'ספורט';

  @override
  String get news => 'חֲדָשׁוֹת';

  @override
  String get kids => 'ילדים';

  @override
  String get premiere => 'בְּכוֹרָה';

  @override
  String get guideTimeline => 'ציר זמן מדריך';

  @override
  String failedToLoadGuide(String error) {
    return 'טעינת לוח השידורים נכשלה: $error';
  }

  @override
  String get noChannelsFound => 'לא נמצאו ערוצים';

  @override
  String get liveBadge => 'לִחיוֹת';

  @override
  String guideNextProgram(String time, String title) {
    return 'הבא: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'נותרו $minutes דק\'';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'נותרו $hours שע\'';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'נותרו $hours שע\' $minutes דק\'';
  }

  @override
  String get movie => 'סֶרֶט';

  @override
  String get removedFromFavoriteChannels => 'הוסר מהערוצים המועדפים';

  @override
  String get addedToFavoriteChannels => 'נוסף לערוצים מועדפים';

  @override
  String get failedToUpdateFavoriteChannel => 'עדכון הערוץ המועדף נכשל';

  @override
  String get unfavoriteChannel => 'ערוץ לא אהוב';

  @override
  String get favoriteChannel => 'ערוץ אהוב';

  @override
  String get record => 'הקלט';

  @override
  String get cancelRecordingAction => 'בטל הקלטה';

  @override
  String get programSetToRecord => 'התוכנית נקבעה להקלטה';

  @override
  String get recordingCancelled => 'ההקלטה בוטלה';

  @override
  String get unableToCreateRecording => 'לא ניתן ליצור הקלטה';

  @override
  String get watch => 'צפה';

  @override
  String get close => 'סגור';

  @override
  String failedToPlayChannel(String name) {
    return 'לא ניתן להפעיל את $name';
  }

  @override
  String get failedToLoadRecordings => 'טעינת ההקלטות נכשלה';

  @override
  String get scheduledInNext24Hours => 'מתוכנן ב-24 השעות הבאות';

  @override
  String get recentRecordings => 'הקלטות אחרונות';

  @override
  String get tvSeries => 'סדרת טלוויזיה';

  @override
  String get failedToLoadSchedule => 'טעינת לוח הזמנים נכשלה';

  @override
  String get noScheduledRecordings => 'אין הקלטות מתוזמנות';

  @override
  String get cancelRecording => 'לבטל את ההקלטה?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'לבטל את ההקלטה המתוכננת של \"$name\"?';
  }

  @override
  String get no => 'לא';

  @override
  String get yesCancel => 'כן, בטל';

  @override
  String get failedToCancelRecording => 'ביטול ההקלטה נכשל';

  @override
  String get failedToLoadSeriesRecordings => 'טעינת הקלטות הסדרה נכשלה';

  @override
  String get noSeriesRecordings => 'אין הקלטות סדרה';

  @override
  String get cancelSeriesRecording => 'בטל את הקלטת הסדרה';

  @override
  String get cancelSeriesRecordingQuestion => 'לבטל את הקלטת הסדרה?';

  @override
  String stopRecordingName(String name) {
    return 'להפסיק את ההקלטה של \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'ביטול הקלטת הסדרה נכשל';

  @override
  String get searchThisLibrary => 'חפש בספרייה זו...';

  @override
  String get searchEllipsis => 'לְחַפֵּשׂ...';

  @override
  String noResultsForQuery(String query) {
    return 'אין תוצאות עבור \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'החיפוש נכשל: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'סוג חשבון Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'מְקוֹמִי';

  @override
  String get savedMedia => 'מדיה שמורה';

  @override
  String get tvShows => 'תוכניות טלוויזיה';

  @override
  String get music => 'מוּסִיקָה';

  @override
  String get musicAlbums => 'אלבומי מוזיקה';

  @override
  String get noMediaInFilter => 'אין מדיה במסנן זה';

  @override
  String get noDownloadedMediaYet => 'עדיין לא הורדת מדיה';

  @override
  String get browseLibrary => 'עיין בספרייה';

  @override
  String get deleteDownload => 'מחק הורדה';

  @override
  String removeItemAndFiles(String name) {
    return 'להסיר את \"$name\" ואת הקבצים שלו?';
  }

  @override
  String tracksCount(int count) {
    return '$count רצועות';
  }

  @override
  String get album => 'אַלבּוֹם';

  @override
  String get playAlbum => 'הפעל אלבום';

  @override
  String failedToLoadAlbum(String error) {
    return 'טעינת האלבום נכשלה: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'לא נמצאו רצועות שהורדו עבור $name.';
  }

  @override
  String get season => 'עונה';

  @override
  String get errorLoadingEpisodes => 'שגיאה בטעינת פרקים';

  @override
  String get noDownloadedEpisodes => 'אין פרקים שהורדו';

  @override
  String get deleteEpisode => 'מחק את הפרק';

  @override
  String removeName(String name) {
    return 'להסיר את \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes דק\'';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'ע$season פ$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'פרק $number';
  }

  @override
  String get seriesNotFound => 'סדרה לא נמצאה';

  @override
  String get errorLoadingSeries => 'שגיאה בטעינת הסדרה';

  @override
  String get downloadedEpisodes => 'פרקים שהורדו';

  @override
  String seasonNumber(int number) {
    return 'עונה $number';
  }

  @override
  String seasonChip(int number) {
    return 'ע$number';
  }

  @override
  String get specials => 'מבצעים';

  @override
  String get deleteSeason => 'מחק עונה';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'למחוק את כל הפרקים שהורדו ב$season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count פרקים',
      two: 'שני פרקים',
      one: 'פרק אחד',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'ניהול אחסון';

  @override
  String get storageBreakdown => 'התמוטטות אחסון';

  @override
  String get downloadedItems => 'פריטים שהורדו';

  @override
  String get storageLimit => 'מגבלת אחסון';

  @override
  String get noLimit => 'אין הגבלה';

  @override
  String get deleteAllDownloads => 'מחק את כל ההורדות';

  @override
  String get deleteAllDownloadsWarning =>
      'פעולה זו תסיר את כל קובצי המדיה שהורדת ולא ניתן לבטלה.';

  @override
  String get deleteAll => 'מחק הכל';

  @override
  String get deleteSelected => 'מחק את נבחרות';

  @override
  String deleteSelectedCount(int count) {
    return 'למחוק $count פריטים שהורדו?';
  }

  @override
  String get musicAndAudiobooks => 'מוזיקה וספרי שמע';

  @override
  String get images => 'תמונות';

  @override
  String get database => 'מסד נתונים';

  @override
  String ofStorageLimit(String limit) {
    return 'מתוך מגבלה של $limit';
  }

  @override
  String get settings => 'הגדרות';

  @override
  String get authentication => 'אימות';

  @override
  String get autoLoginServerManagement => 'כניסה אוטומטית, ניהול שרתים';

  @override
  String get pinCode => 'קוד PIN';

  @override
  String get setUpPinCodeProtection => 'הגדר הגנת קוד PIN';

  @override
  String get parentalControls => 'בקרת הורים';

  @override
  String get contentRatingRestrictions => 'הגבלות על דירוג תוכן';

  @override
  String get bitRateResolutionBehavior => 'קצב סיביות, רזולוציה, התנהגות';

  @override
  String get languageSizeAppearance => 'שפה, גודל, מראה';

  @override
  String get qualityStorage => 'איכות, אחסון';

  @override
  String get serverSyncAndPluginStatus => 'סטטוס סנכרון שרת ופלאגין';

  @override
  String get mediaRequestIntegration => 'שילוב בקשות מדיה';

  @override
  String get switchServer => 'החלף שרת';

  @override
  String get signOut => 'צא';

  @override
  String get versionLicenses => 'גרסה, רישיונות';

  @override
  String get account => 'חֶשְׁבּוֹן';

  @override
  String get signInAndSecurity => 'כניסה ואבטחה';

  @override
  String get administration => 'מִנהָל';

  @override
  String get serverSettingsUsersLibraries => 'הגדרות שרת, משתמשים, ספריות';

  @override
  String get customization => 'התאמה אישית';

  @override
  String get themeAndLayout => 'נושא ופריסה';

  @override
  String get videoAndSubtitles => 'וידאו וכתוביות';

  @override
  String get integrations => 'אינטגרציות';

  @override
  String get pluginAndRequests => 'תוסף ובקשות';

  @override
  String get customizeAccountPlaybackInterface =>
      'התאם אישית חשבון, השמעה והתנהגות ממשק';

  @override
  String optionsCount(int count) {
    return '$count אפשרויות';
  }

  @override
  String get themeAndAppearance => 'נושא ומראה';

  @override
  String get focusBorderColor => 'צבע גבול פוקוס';

  @override
  String get watchedIndicators => 'צפו באינדיקטורים';

  @override
  String get always => 'תָמִיד';

  @override
  String get hideUnwatched => 'הסתר ללא צפייה';

  @override
  String get episodesOnly => 'פרקים בלבד';

  @override
  String get never => 'לְעוֹלָם לֹא';

  @override
  String get focusExpansionAnimation => 'אנימציית הרחבת פוקוס';

  @override
  String get desktopUiScale => 'סולם ממשק משתמש שולחני';

  @override
  String get scaleFocusedCards => 'קנה מידה של קלפים ואריחים ממוקדים או מרחפים';

  @override
  String get backgroundBackdrops => 'רקע רקע';

  @override
  String get showBackdropImages => 'הצג תמונות רקע מאחורי תוכן';

  @override
  String get seriesThumbnails => 'תמונות ממוזערות של סדרה';

  @override
  String get seriesThumbnailsDescription =>
      'פרקים בלבד: השתמש בגרפיקה של סדרה התואמת לכל סוג תמונה של שורה';

  @override
  String get homeRowInfoOverlay => 'שכבת-על מידע בשורה ביתית';

  @override
  String get showTitleMetadataOnHomeRows =>
      'הצג כותרת ומטא נתונים בעת גלישה בשורות הבית';

  @override
  String get clockDisplay => 'תצוגת שעון';

  @override
  String get inMenus => 'בתפריטים';

  @override
  String get inVideo => 'בווידאו';

  @override
  String get seasonalEffects => 'אפקטים עונתיים';

  @override
  String get seasonalEffectsDescription => 'אפקטים חזותיים וקישוטים עונתיים';

  @override
  String get snow => 'שֶׁלֶג';

  @override
  String get fireworks => 'זיקוקים';

  @override
  String get confetti => 'פְּתִיתֵי נִיָר סַסגוֹנִיִם';

  @override
  String get fallingLeaves => 'עלים נושרים';

  @override
  String get themeMusic => 'מוזיקת ​​נושא';

  @override
  String get playThemeMusicOnDetailPages => 'הפעל מוזיקת ​​נושא בדפי פרטים';

  @override
  String get themeMusicVolume => 'נפח מוזיקת ​​נושא';

  @override
  String get themeMusicSettingsSubtitle =>
      'דפי פרטים, שורות במסך הבית ועוצמת קול';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'מוסיקת נושא בשורות הבית';

  @override
  String get playWhenBrowsingHomeScreen => 'הפעל בעת גלישה במסך הבית';

  @override
  String get loopThemeMusic => 'נגן מוזיקת נושא בלולאה';

  @override
  String get loopThemeMusicSubtitle => 'חזור על הרצועה במקום לנגן אותה פעם אחת';

  @override
  String get detailsBackgroundBlur => 'פרטים טשטוש רקע';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String get detailsBackgroundOpacitySubtitle =>
      'Adjust amount of opacity on modern detail pages from light to dark.';

  @override
  String get opacityLightest => 'Lightest';

  @override
  String get opacityLight => 'Light';

  @override
  String get opacityMedium => 'Medium';

  @override
  String get opacityDark => 'Dark';

  @override
  String get opacityDarkest => 'Darkest';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'טשטוש רקע גלישה';

  @override
  String get maxStreamingBitrate => 'קצב העברת נתונים מקסימלי';

  @override
  String get maxResolution => 'רזולוציה מקסימלית';

  @override
  String get playerZoomMode => 'מצב זום לנגן';

  @override
  String get settingsScrollWheelAction => 'גלגל העכבר';

  @override
  String get settingsScrollWheelActionDescription =>
      'בחר מה תעשה גלילת גלגל העכבר מעל הווידאו במהלך ההפעלה.';

  @override
  String get scrollWheelActionOff => 'כבוי';

  @override
  String get scrollWheelActionSeek => 'דילוג (קדימה / אחורה)';

  @override
  String get scrollWheelActionVolume => 'עוצמת קול';

  @override
  String get playerTooltipVolume => 'עוצמת קול';

  @override
  String get fit => 'לְהַתְאִים';

  @override
  String get autoCrop => 'חיתוך אוטומטי';

  @override
  String get stretch => 'לִמְתוֹחַ';

  @override
  String get refreshRateSwitching => 'החלפת קצב רענון';

  @override
  String get disabled => 'מושבת';

  @override
  String get scaleOnTv => 'קנה מידה בטלוויזיה';

  @override
  String get scaleOnDevice => 'קנה מידה במכשיר';

  @override
  String get trickPlay => 'משחק טריק';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'הצג תמונות ממוזערות של תצוגה מקדימה בעת חיפוש';

  @override
  String get showDescriptionOnPause => 'הצג תיאור בהשהיה';

  @override
  String get dimVideoShowOverview =>
      'עמעום את הסרטון והצג טקסט סקירה בזמן השהייה';

  @override
  String get osdLockButton => 'לחצן נעילה של OSD';

  @override
  String get osdLockButtonDescription =>
      'הצג לחצן נעילה שחוסם קלט מגע עד ללחיצה ארוכה';

  @override
  String get audioBehavior => 'התנהגות שמע';

  @override
  String get downmixToStereo => 'Downmix לסטריאו';

  @override
  String get defaultAudioLanguage => 'שפת אודיו ברירת מחדל';

  @override
  String get fallbackAudioLanguage => 'שפת שמע חלופית';

  @override
  String get preferDefaultAudioTrack => 'העדף רצועת אודיו ברירת מחדל';

  @override
  String get preferDefaultAudioTrackDescription =>
      'העדף את רצועת האודיו המקורית על פני דיבוב מתורגם.';

  @override
  String get preferAudioDescription => 'העדף רצועות תיאור קולי';

  @override
  String get preferAudioDescriptionDescription =>
      'העדף רצועות תיאור קולי על פני רצועות רגילות.';

  @override
  String get transcodingAudio => 'המרת קידוד (אודיו)';

  @override
  String get directStreamRemux => 'הזרמה ישירה (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'המרת קידוד (קצב סיביות או רזולוציה)';

  @override
  String get transcodingVideoAndAudio => 'המרת קידוד (וידאו ואודיו)';

  @override
  String get transcodingVideo => 'המרת קידוד (וידאו)';

  @override
  String get autoServerDefault => 'אוטומטי (ברירת מחדל של שרת)';

  @override
  String get english => 'אַנגְלִית';

  @override
  String get spanish => 'סְפָרַדִית';

  @override
  String get french => 'צָרְפָתִית';

  @override
  String get german => 'גֶרמָנִיָת';

  @override
  String get italian => 'אִיטַלְקִית';

  @override
  String get portuguese => 'פורטוגזית';

  @override
  String get japanese => 'יַפָּנִית';

  @override
  String get korean => 'קוריאנית';

  @override
  String get chinese => 'סִינִית';

  @override
  String get russian => 'רוּסִי';

  @override
  String get arabic => 'עֲרָבִית';

  @override
  String get hindi => 'הינדי';

  @override
  String get dutch => 'הוֹלַנדִי';

  @override
  String get swedish => 'שוודית';

  @override
  String get norwegian => 'נורבגית';

  @override
  String get danish => 'דַנִי';

  @override
  String get finnish => 'פִינִית';

  @override
  String get polish => 'פּוֹלָנִית';

  @override
  String get ac3Passthrough => 'מעבר AC3';

  @override
  String get dtsPassthrough => 'מעבר DTS';

  @override
  String get trueHdSupport => 'תמיכת TrueHD';

  @override
  String get enableDtsPassthrough =>
      'אודיו של Bitstream DTS ל-AVR בלבד; דורש תמיכה במקלט ומסלול מקור DTS';

  @override
  String get enableTrueHdAudio =>
      'הפעל אודיו TrueHD (ייתכן שלא יפעל בכל הפלטפורמות)';

  @override
  String get settingsAudioOutputMode => 'מצב פלט אודיו';

  @override
  String get settingsAudioOutputModeDescription =>
      'בחר כיצד מפוענח האודיו. מעבר AVR שולח זרמי Dolby/DTS גולמיים למקלט שלך; אוטומטי או Downmix מפענחים במכשיר.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'מעבר AVR';

  @override
  String get settingsAudioFallbackCodec => 'קודק אודיו חלופי';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'בחר את פורמט היעד להמרת אודיו רב-ערוצי כאשר לא ניתן להפעיל את זרם המקור ישירות או להעבירו במעבר.';

  @override
  String get settingsAudioFallbackCodecAuto => 'זיהוי אוטומטי\n(מומלץ)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(ברירת מחדל)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(ללא אובדן)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(סטריאו בלבד)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(יעיל)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(ללא אובדן)';

  @override
  String get settingsMaxAudioChannels => 'מספר ערוצי אודיו מרבי';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'הגדר את מספר הערוצים המרבי של מערכת האודיו שלך. זרמים רב-ערוציים שחורגים מהמגבלה ימוזגו למטה או יומרו.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'זיהוי אוטומטי\n(ברירת מחדל של החומרה)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 מונו';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 סטריאו';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 סראונד';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 קוואדרופוני';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 סראונד';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 סראונד';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 סראונד';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 סראונד';

  @override
  String get settingsAudioPassthroughAdvanced => 'מעבר (מתקדם)';

  @override
  String get settingsAudioCodecPassthrough => 'מעבר קודקים';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'הפעל רק פורמטים שה-AVR או יעד ה-HDMI שלך תומכים בהם.';

  @override
  String get settingsAudioEac3Passthrough => 'מעבר EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'מעבר EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough => 'מעבר DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'מעבר DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'מעבר TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'מעבר TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'שולח זרם סיביות של Dolby Digital Plus (EAC3) למפענח חיצוני.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'שולח זרם סיביות של Dolby Atmos על גבי EAC3 (JOC) למפענח חיצוני.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'שולח זרם סיביות של DTS-HD MA (כולל DTS core) למפענח חיצוני.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'שולח זרם סיביות של Dolby TrueHD עם מטא-נתוני Atmos למפענח חיצוני.';

  @override
  String get settingsDetectedAudioCapabilities => 'יכולות אודיו שזוהו';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'אין עדיין תמונת מצב של יכולות זמן ריצה.';

  @override
  String get settingsAudioRouteLabel => 'נתיב';

  @override
  String get settingsAudioDecodeLabel => 'פענוח';

  @override
  String get settingsAudioPassthroughLabel => 'מעבר';

  @override
  String get settingsAudioHdRoute => 'נתיב אודיו HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'רמקול';

  @override
  String get settingsAudioRouteHeadphones => 'אוזניות';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count ערוצי PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'אבחון';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'רמת וידאו';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'טווח וידאו';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'קודק כתוביות';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs => 'קודקי אודיו מותרים';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'קודקי אודיו של HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'קודקי אודיו של HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'מעבר audio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'נתיב אודיו פעיל';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'תמיכת הנתיב באודיו HD';

  @override
  String get nightMode => 'מצב לילה';

  @override
  String get compressDynamicRange => 'דחוס טווח דינמי';

  @override
  String get advancedMpv => 'mpv מתקדם';

  @override
  String get enableCustomMpvConf => 'אפשר מותאם אישית mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'החל mpv.conf שצוין על ידי המשתמש לפני תחילת ההשמעה';

  @override
  String get unsafeAdvancedMpvOptions => 'אפשרויות mpv מתקדמות לא בטוחות';

  @override
  String get unsafeMpvOptionsDescription =>
      'אפשר קבוצה רחבה יותר של אפשרויות mpv. עלול לשבור את התנהגות ההשמעה.';

  @override
  String get hardwareDecoding => 'פענוח חומרה';

  @override
  String get hardwareDecodingSubtitle =>
      'עשוי לשפר את הביצועים אך עלול לגרום לבעיות הפעלה במכשירים מסוימים.';

  @override
  String get nextUpAndQueuing => 'הבא ותור';

  @override
  String get nextUpDisplay => 'תצוגה הבאה';

  @override
  String get extended => 'מוּרחָב';

  @override
  String get minimal => 'מִינִימָלִי';

  @override
  String get nextUpTimeout => 'פסק הזמן הבא';

  @override
  String secondsValue(int value) {
    return '$value שנ\'';
  }

  @override
  String get mediaQueuing => 'תור מדיה';

  @override
  String get autoQueueNextEpisodes => 'תור אוטומטית לתור לפרקים הבאים';

  @override
  String get stillWatchingPrompt => 'עדיין צופה ב-Prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'אחרי $episodes פרקים / $hours שע\'';
  }

  @override
  String get resumeAndSkip => 'המשך ודלג';

  @override
  String get resumeRewind => 'המשך הרצה לאחור';

  @override
  String get unpauseRewind => 'בטל את ההשהיה הרצה לאחור';

  @override
  String get fiveSeconds => '5 שניות';

  @override
  String get tenSeconds => '10 שניות';

  @override
  String get fifteenSeconds => '15 שניות';

  @override
  String get thirtySeconds => '30 שניות';

  @override
  String get skipBackLength => 'דלג על אורך אחורה';

  @override
  String get skipForwardLength => 'דלג על אורך קדימה';

  @override
  String get customMpvConfPath => 'נתיב mpv.conf מותאם אישית';

  @override
  String get notSetMpvConf =>
      'לא מוגדר. Moonfin ינסה ברירת מחדל mpv.conf בתיקיות אפליקציות/נתונים.';

  @override
  String get selectMpvConf => 'בחר mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'הגדרות סגנון (גודל, צבע, היסט) חלות על כתוביות מבוססות טקסט (SRT, VTT, TTML). כתוביות ASS/SSA משתמשות בסגנון מוטבע משלהן, אלא אם \"השמעה ישירה של ASS/SSA\" כבויה. לא ניתן לשנות את הסגנון של כתוביות מפת סיביות (PGS, DVB, VobSub).';

  @override
  String get defaultSubtitleLanguage => 'שפת ברירת המחדל של כתוביות';

  @override
  String get defaultToNoSubtitles => 'ברירת המחדל היא ללא כתוביות';

  @override
  String get turnOffSubtitlesByDefault => 'כבה את הכתוביות כברירת מחדל';

  @override
  String get subtitleSize => 'גודל כתוביות';

  @override
  String get textFillColor => 'צבע מילוי טקסט';

  @override
  String get backgroundColor => 'צבע רקע';

  @override
  String get textStrokeColor => 'צבע קו טקסט';

  @override
  String get subtitleCustomization => 'התאמה אישית של כתוביות';

  @override
  String get subtitleCustomizationDescription => 'התאם אישית את מראה הכתוביות';

  @override
  String get subtitleMode => 'מצב כתוביות';

  @override
  String get subtitleModeFlagged => 'מסומנות';

  @override
  String get subtitleModeAlways => 'תמיד';

  @override
  String get subtitleModeForeign => 'שפה זרה';

  @override
  String get subtitleModeForced => 'כפויות';

  @override
  String get subtitleModeFlaggedDescription =>
      'מפעיל רצועות המסומנות במטא-נתונים של קובץ המדיה כ\"ברירת מחדל\" או כ\"כפויות\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'טוען ומציג כתוביות אוטומטית בכל פעם שווידאו מתחיל.';

  @override
  String get subtitleModeForeignDescription =>
      'מפעיל כתוביות אוטומטית אם רצועת האודיו שנבחרה כברירת מחדל היא בשפה זרה.';

  @override
  String get subtitleModeForcedDescription =>
      'טוען רק כתוביות המתויגות במפורש בדגל המטא-נתונים forced.';

  @override
  String get subtitleModeNoneDescription =>
      'משבית לחלוטין את הטעינה האוטומטית של כתוביות.';

  @override
  String get fallbackSubtitleLanguage => 'שפת כתוביות חלופית';

  @override
  String get subtitleStream => 'זרם כתוביות';

  @override
  String get subtitlePreviewText => 'השועל החום המהיר קופץ מעל הכלב העצלן';

  @override
  String get verticalOffset => 'אופסט אנכי';

  @override
  String get pgsDirectPlay => 'משחק ישיר של PGS';

  @override
  String get directPlayPgsSubtitles => 'משחק ישיר של כתוביות PGS';

  @override
  String get assSsaDirectPlay => 'משחק ישיר ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles => 'השמעה ישירה של כתוביות ASS/SSA';

  @override
  String get white => 'לָבָן';

  @override
  String get black => 'שָׁחוֹר';

  @override
  String get yellow => 'צָהוֹב';

  @override
  String get green => 'יָרוֹק';

  @override
  String get cyan => 'ציאן';

  @override
  String get red => 'אָדוֹם';

  @override
  String get transparent => 'שָׁקוּף';

  @override
  String get semiTransparentBlack => 'שחור חצי שקוף';

  @override
  String get global => 'גלוֹבָּלִי';

  @override
  String get desktop => 'שולחן עבודה';

  @override
  String get mobile => 'נייד';

  @override
  String get tv => 'טֵלֶוִיזִיָה';

  @override
  String loadedProfileSettings(String profile) {
    return 'הגדרות הפרופיל $profile נטענו.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'טעינת הגדרות הפרופיל $profile נכשלה.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'ההגדרות המקומיות סונכרנו לפרופיל $profile.';
  }

  @override
  String get customizationProfile => 'פרופיל התאמה אישית';

  @override
  String get customizationProfileDescription =>
      'בחר את הפרופיל לטעינה, עריכה וסנכרון. גלובלי חל בכל מקום אלא אם פרופיל מכשיר עוקף אותו. הנקודה הירוקה מסמנת את פרופיל המכשיר הנוכחי שלך.';

  @override
  String get loadProfile => 'טען פרופיל';

  @override
  String get syncing => 'מסנכרן...';

  @override
  String get syncToProfile => 'סנכרון לפרופיל';

  @override
  String get profileSyncHidden => 'סנכרון פרופיל מוסתר';

  @override
  String get enablePluginSyncDescription =>
      'הפעל את סנכרון תוסף שרת בהגדרות הפלאגין כדי להציג כאן בקרות פרופיל.';

  @override
  String get quality => 'אֵיכוּת';

  @override
  String get defaultDownloadQuality => 'איכות הורדה כברירת מחדל';

  @override
  String get network => 'רֶשֶׁת';

  @override
  String get wifiOnlyDownloads => 'הורדות WiFi בלבד';

  @override
  String get reportDownloadsActivity => 'הצג הורדות בשרת';

  @override
  String get reportDownloadsActivitySubtitle =>
      'אפשר למנהל השרת לראות את ההורדות המומרות שלך בלוח הבקרה';

  @override
  String get onlyDownloadOnWifi => 'הורד רק כאשר אתה מחובר ל-WiFi';

  @override
  String get storage => 'אִחסוּן';

  @override
  String get storageUsed => 'אחסון בשימוש';

  @override
  String get manage => 'לְנַהֵל';

  @override
  String get calculating => 'מחשב...';

  @override
  String get downloadLocation => 'מיקום הורדה';

  @override
  String get defaultLabel => 'בְּרִירַת מֶחדָל';

  @override
  String get saveToDownloadsFolder => 'שמור בתיקיית הורדות';

  @override
  String get downloadsVisibleToOtherApps =>
      'הורדות/Moonfin — גלויות לאפליקציות אחרות';

  @override
  String get dangerZone => 'אזור הסכנה';

  @override
  String get clearAllDownloads => 'נקה את כל ההורדות';

  @override
  String get original => 'מְקוֹרִי';

  @override
  String get changeDownloadLocation => 'שנה את מיקום ההורדה';

  @override
  String get changeDownloadLocationDescription =>
      'הורדות חדשות יישמרו בתיקייה שנבחרה. הורדות קיימות יישארו במיקומן הנוכחי וניתן לנהל אותן מהגדרות האחסון.';

  @override
  String get confirm => 'לְאַשֵׁר';

  @override
  String get cannotWriteToFolder =>
      'לא ניתן לכתוב לתיקיה שנבחרה. אנא בחר מיקום אחר או הענק הרשאות אחסון.';

  @override
  String get saveToDownloadsFolderQuestion => 'לשמור בתיקיית הורדות?';

  @override
  String get saveToDownloadsFolderDescription =>
      'מדיה שהורדת תישמר להורדות/Moonfin במכשיר שלך. קבצים אלה יהיו גלויים לאפליקציות אחרות כגון הגלריה או נגן המוזיקה שלך.\n\nהורדות קיימות יישארו במיקומן הנוכחי.';

  @override
  String get enable => 'לְאַפשֵׁר';

  @override
  String get clearAllDownloadsWarning =>
      'פעולה זו תמחק את כל המדיה שהורדת ולא ניתן לבטל אותה.';

  @override
  String get clearAll => 'נקה הכל';

  @override
  String get navigationStyle => 'סגנון ניווט';

  @override
  String get topBar => 'בר עליון';

  @override
  String get leftSidebar => 'סרגל צד שמאל';

  @override
  String get showShuffleButton => 'הצג את לחצן ערבוב';

  @override
  String get showGenresButton => 'לחצן הצג ז\'אנרים';

  @override
  String get showFavoritesButton => 'לחצן הצג מועדפים';

  @override
  String get showLibrariesInToolbar => 'הצג ספריות בסרגל הכלים';

  @override
  String get navbarAlwaysExpanded => 'הצג תמיד את תוויות סרגל הניווט';

  @override
  String get showSeerrButton => 'הצג את כפתור Seerr';

  @override
  String get navbarOpacity => 'אטימות Navbar';

  @override
  String get navbarColor => 'צבע Navbar';

  @override
  String get gray => 'אָפוֹר';

  @override
  String get darkBlue => 'כחול כהה';

  @override
  String get purple => 'סָגוֹל';

  @override
  String get teal => 'צהבהב';

  @override
  String get navy => 'חֵיל הַיָם';

  @override
  String get charcoal => 'פֶּחָם';

  @override
  String get brown => 'חוּם';

  @override
  String get darkRed => 'אדום כהה';

  @override
  String get darkGreen => 'ירוק כהה';

  @override
  String get slate => 'צִפחָה';

  @override
  String get indigo => 'אִינדִיגוֹ';

  @override
  String get libraryDisplay => 'תצוגת ספרייה';

  @override
  String get posterLabel => 'פּוֹסטֵר';

  @override
  String get thumbnailLabel => 'תמונה ממוזערת';

  @override
  String get bannerLabel => 'דֶגֶל';

  @override
  String get overridePerLibrarySettings => 'עוקף הגדרות לכל ספרייה';

  @override
  String get applyImageTypeToAllLibraries => 'החל סוג תמונה על כל הספריות';

  @override
  String get multiServerLibraries => 'ספריות מרובות שרתים';

  @override
  String get showLibrariesFromAllServers => 'הצג ספריות מכל השרתים המחוברים';

  @override
  String get enableFolderView => 'הפעל תצוגת תיקיות';

  @override
  String get showFolderBrowsingOption => 'הצג אפשרות גלישה בתיקייה';

  @override
  String get groupItemsIntoCollections => 'קבץ פריטים לאוספים';

  @override
  String get hideCollectionAssociatedItems =>
      'הסתר פריטי ספרייה המשויכים לאוסף בעת עיון בספריות';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'הודעה על קיבוץ ספריות';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'כדי להשתמש בהגדרה זו, ודא שהגדרות הספרייה \"קבץ סרטים לאוספים\" ו/או \"קבץ סדרות לאוספים\" מופעלות בהגדרות התצוגה של הספרייה בשרת Jellyfin או Emby שלך.';

  @override
  String get libraryVisibility => 'נראות הספרייה';

  @override
  String get libraryVisibilityDescription =>
      'החלף את נראות דף הבית לכל ספריה. הפעל מחדש את Moonfin כדי שהשינויים ייכנסו לתוקף.';

  @override
  String get showInNavigation => 'הצג בניווט';

  @override
  String get showInLatestMedia => 'הצג במדיה העדכנית ביותר';

  @override
  String get sourceLibraries => 'ספריות מקור';

  @override
  String get sourceCollections => 'אוספי מקור';

  @override
  String get excludedGenres => 'ז\'אנרים לא נכללים';

  @override
  String get selectAll => 'בחר הכל';

  @override
  String itemsSelected(int count) {
    return '$count נבחרו';
  }

  @override
  String get mediaBar => 'סרגל מדיה';

  @override
  String get mediaSources => 'מקורות מדיה';

  @override
  String get behavior => 'הִתְנַהֲגוּת';

  @override
  String get seconds => 'שניות';

  @override
  String get localPreviews => 'תצוגות מקדימות מקומיות';

  @override
  String get localPreviewsDescription =>
      'הגדר תצוגות מקדימות של טריילר, מדיה ואודיו.';

  @override
  String get mediaBarMode => 'סגנון בר מדיה';

  @override
  String get mediaBarModeDescription =>
      'בחרו בין סגנונות שונים של סרגל מדיה, או כבו את סרגל המדיה';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'כבוי';

  @override
  String get enableMediaBar => 'הפעל את סרגל המדיה';

  @override
  String get showFeaturedContentSlideshow => 'הצג מצגת תוכן מוצג בבית';

  @override
  String get contentType => 'סוג תוכן';

  @override
  String get moviesAndTvShows => 'סרטים ותוכניות טלוויזיה';

  @override
  String get moviesOnly => 'סרטים בלבד';

  @override
  String get tvShowsOnly => 'תוכניות טלוויזיה בלבד';

  @override
  String get itemCount => 'ספירת פריטים';

  @override
  String get noneSelected => 'אף אחד לא נבחר';

  @override
  String get noneExcluded => 'אף אחד לא נכלל';

  @override
  String get autoAdvance => 'התקדמות אוטומטית';

  @override
  String get autoAdvanceSlides => 'התקדמות אוטומטית לשקופית הבאה';

  @override
  String get autoAdvanceInterval => 'מרווח קידום אוטומטי';

  @override
  String get trailerPreview => 'תצוגה מקדימה של טריילר';

  @override
  String get autoPlayTrailers =>
      'הפעל אוטומטית טריילרים בסרגל המדיה לאחר 3 שניות';

  @override
  String get trailerAudio => 'אודיו של טריילרים';

  @override
  String get enableTrailerAudio => 'הפעל אודיו לטריילרים בסרגל המדיה';

  @override
  String get episodePreview => 'תצוגה מקדימה של פרק';

  @override
  String get mediaPreview => 'תצוגה מקדימה של מדיה';

  @override
  String get episodePreviewDescription =>
      'הפעל תצוגה מקדימה של 30 שניות מובנה בכרטיסים ממוקדים, מרחפים או בלחיצה ארוכה';

  @override
  String get mediaPreviewDescription =>
      'הפעל תצוגה מקדימה של 30 שניות מובנה בכרטיסים ממוקדים, מרחפים או בלחיצה ארוכה';

  @override
  String get previewAudio => 'תצוגה מקדימה של אודיו';

  @override
  String get enablePreviewAudio =>
      'אפשר אודיו עבור תצוגות מקדימות של טריילר ופרק';

  @override
  String get latestMedia => 'המדיה האחרונה';

  @override
  String get recentlyReleased => 'שוחרר לאחרונה';

  @override
  String get myMedia => 'המדיה שלי';

  @override
  String get myMediaSmall => 'המדיה שלי (קטנה)';

  @override
  String get continueWatching => 'המשך לצפות';

  @override
  String get resumeAudio => 'המשך שמע';

  @override
  String get resumeBooks => 'ספרי קורות חיים';

  @override
  String get activeRecordings => 'הקלטות פעילות';

  @override
  String get playlists => 'רשימות השמעה';

  @override
  String get liveTV => 'טלוויזיה בשידור חי';

  @override
  String get homeSections => 'חלקי בית';

  @override
  String get resetToDefaults => 'אפס לברירות המחדל';

  @override
  String get homeRowPosterSize => 'גודל פוסטר בשורה ביתית';

  @override
  String get perRowImageTypeSelection => 'בחירת סוג תמונה לכל שורה';

  @override
  String get configureImageTypeForEachRow =>
      'הגדר את סוג התמונה עבור כל שורת בית מופעלת';

  @override
  String get mergeContinueWatchingAndNextUp => 'מיזוג המשך צפייה והבא';

  @override
  String get combineBothRows => 'שלב את שתי השורות למקטע בית אחד';

  @override
  String get fullScreenRows => 'שורות מורחבות במסך הבית';

  @override
  String get fullScreenRowsDescription =>
      'הגבל את שורות מסך הבית לשורה אחת לכל מסך';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'סוג תמונה לפי שורה';

  @override
  String get perRowSettings => 'הגדרות לכל שורה';

  @override
  String get autoLogin => 'התחברות אוטומטית';

  @override
  String get lastUser => 'משתמש אחרון';

  @override
  String get currentUser => 'משתמש נוכחי';

  @override
  String get alwaysAuthenticate => 'אימות תמיד';

  @override
  String get requirePasswordWithToken => 'דרוש סיסמה גם עם אסימון מאוחסן';

  @override
  String get confirmExit => 'אשר יציאה';

  @override
  String get showConfirmationBeforeExiting => 'הצג אישור לפני היציאה';

  @override
  String get blockContentWithRatings => 'חסום תוכן עם הדירוגים הבאים:';

  @override
  String get noContentRatingsFound => 'עדיין לא נמצאו דירוגי תוכן בשרת זה.';

  @override
  String get couldNotLoadServerRatings =>
      'לא ניתן לטעון את דירוגי השרת. מציג דירוגים שמורים בלבד.';

  @override
  String get couldNotRefreshRatings =>
      'לא ניתן היה לרענן דירוגים מהשרת. מציג דירוגים שמורים.';

  @override
  String get enablePinCode => 'אפשר קוד PIN';

  @override
  String get requirePinToAccess => 'דרוש PIN כדי לגשת לחשבון שלך';

  @override
  String get changePin => 'שנה PIN';

  @override
  String get setNewPinCode => 'הגדר קוד PIN חדש';

  @override
  String get removePin => 'הסר את ה-PIN';

  @override
  String get removePinProtection => 'הסר את הגנת קוד PIN';

  @override
  String get screensaver => 'שומר מסך';

  @override
  String get inAppScreensaver => 'שומר מסך בתוך האפליקציה';

  @override
  String get enableBuiltInScreensaver => 'הפעל את שומר המסך המובנה';

  @override
  String get mode => 'מצב';

  @override
  String get libraryArt => 'אמנות הספרייה';

  @override
  String get logo => 'סֵמֶל';

  @override
  String get clock => 'שָׁעוֹן';

  @override
  String get timeout => 'פסק זמן';

  @override
  String minutesShort(int minutes) {
    return '$minutes דק\'';
  }

  @override
  String get dimmingLevel => 'רמת עמעום';

  @override
  String get maxAgeRating => 'דירוג גיל מקסימלי';

  @override
  String get any => 'כֹּל';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'דורש דירוג גיל';

  @override
  String get onlyShowRatedContent => 'הצג רק תוכן מדורג';

  @override
  String get showClock => 'הצג שעון';

  @override
  String get displayClockDuringScreensaver => 'הצג שעון במהלך שומר מסך';

  @override
  String get clockModeStatic => 'קבוע';

  @override
  String get clockModeBouncing => 'מקפץ';

  @override
  String get rottenTomatoesCritics => 'עגבניות רקובות (מבקרים)';

  @override
  String get rottenTomatoesAudience => 'עגבניות רקובות (קהל)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (משתמש)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'אני ליסט';

  @override
  String get communityRating => 'דירוג קהילה';

  @override
  String get ratings => 'דירוגים';

  @override
  String get additionalRatings => 'דירוגים נוספים';

  @override
  String get showMdbListAndTmdbRatings => 'הצג דירוגי MDBList ו-TMDB';

  @override
  String get ratingLabels => 'תוויות דירוג';

  @override
  String get showLabelsNextToIcons => 'הצג תוויות לצד סמלי דירוג';

  @override
  String get ratingBadges => 'תגי דירוג';

  @override
  String get showDecorativeBadges => 'הצג תגים דקורטיביים מאחורי דירוגים';

  @override
  String get episodeRatings => 'דירוגי פרקים';

  @override
  String get showRatingsOnEpisodes => 'הצג דירוגים על פרקים בודדים';

  @override
  String get ratingSources => 'מקורות דירוג';

  @override
  String get ratingSourcesDescription =>
      'אפשר וסדר מחדש את מקורות הדירוג המוצגים בכל האפליקציה';

  @override
  String get pluginLabel => 'תוסף Moonbase';

  @override
  String get pluginDetected => 'תוסף זוהה';

  @override
  String get pluginNotDetected => 'תוסף לא זוהה';

  @override
  String get pluginDetectedDescription =>
      'זוהה תוסף שרת. סנכרון מופעל אוטומטית בפעם הראשונה שהתוסף נמצא.';

  @override
  String get pluginNotDetectedDescription =>
      'תוסף שרת אינו מזוהה כעת. הגדרות מקומיות עדיין משתמשות בערכים השמורים או בברירות המחדל המובנות שלהן.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nגרסה: $version';
  }

  @override
  String get availableServices => 'שירותים זמינים';

  @override
  String get serverPluginSync => 'סנכרון תוסף שרת';

  @override
  String get syncSettingsWithPlugin => 'סנכרון הגדרות עם תוסף השרת';

  @override
  String get whatSyncControls => 'אילו בקרות סנכרון';

  @override
  String get syncControlsDescription =>
      'סנכרון שולט רק אם הגדרות מגובות פלאגין נדחפות לשרת ונשלפות ממנו. פעולות בחירת פרופיל וסנכרון פרופיל נמצאות בהגדרות התאמה אישית כאשר סינכרון הפלאגין מופעל.';

  @override
  String get recentRequests => 'בקשות אחרונות';

  @override
  String get recentlyAdded => 'נוספו לאחרונה';

  @override
  String get trending => 'מגמות';

  @override
  String get popularMovies => 'סרטים פופולריים';

  @override
  String get movieGenres => 'ז\'אנרים של סרטים';

  @override
  String get upcomingMovies => 'סרטים בקרוב';

  @override
  String get studios => 'אולפנים';

  @override
  String get popularSeries => 'סדרה פופולרית';

  @override
  String get seriesGenres => 'ז\'אנרים של סדרה';

  @override
  String get upcomingSeries => 'הסדרה הקרובה';

  @override
  String get networks => 'רשתות';

  @override
  String get seerrDiscoveryRows => 'שורות גילוי של Seerr';

  @override
  String get resetRowsToDefaults => 'אפס שורות לברירות המחדל';

  @override
  String get enableSeerr => 'הפעל את Seerr';

  @override
  String get showSeerrInNavigation => 'הצג Seerr בניווט (דורש תוסף שרת)';

  @override
  String get seerrUnavailable =>
      'לא זמין מכיוון שתמיכת תוסף השרת Seerr מושבתת.';

  @override
  String get nsfwFilter => 'מסנן NSFW';

  @override
  String get hideAdultContent => 'הסתר תוכן למבוגרים בתוצאות';

  @override
  String get seerrNotificationsSection => 'התראות';

  @override
  String get seerrNotifyNewRequestsTitle => 'התראות על בקשות חדשות';

  @override
  String get seerrNotifyNewRequestsSubtitle => 'התריע לי כשמישהו שולח בקשה';

  @override
  String get seerrNotifyLibraryAddedTitle => 'עדכוני בקשות';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'אושרו, נדחו ונוספו לספרייה שלך';

  @override
  String get seerrNotifyIssuesTitle => 'עדכוני תקלות';

  @override
  String get seerrNotifyIssuesSubtitle => 'תקלות חדשות, תגובות ופתרונות';

  @override
  String loggedInAs(String username) {
    return 'מחובר בתור: $username';
  }

  @override
  String get discoverRows => 'עמוד הגילוי של Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'הפעל את השורות שיוצגו בעמוד הראשי של Seerr. גרור כדי לשנות את הסדר. הסדר המותאם מסונכרן עם Moonbase.';

  @override
  String get discoverRowsDescription =>
      'הפעל את השורות שיוצגו בעמוד הראשי של Seerr. גרור כדי לשנות את הסדר. הסדר המותאם מסונכרן עם Moonbase.';

  @override
  String get enabled => 'מופעל';

  @override
  String get hidden => 'מוּסתָר';

  @override
  String get aboutTitle => 'אוֹדוֹת';

  @override
  String versionValue(String version) {
    return 'גרסה $version';
  }

  @override
  String get openSourceLicenses => 'רישיונות קוד פתוח';

  @override
  String get sourceCode => 'קוד מקור';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'בדוק אם יש עדכונים עכשיו';

  @override
  String get checksLatestDesktopRelease =>
      'בודק את המהדורה האחרונה של שולחן העבודה עבור פלטפורמה זו';

  @override
  String get youAreUpToDate => 'אתה מעודכן.';

  @override
  String get couldNotCheckForUpdates => 'לא ניתן לחפש עדכונים כרגע.';

  @override
  String get noCompatibleUpdate => 'לא נמצאה חבילת עדכון תואמת לפלטפורמה זו.';

  @override
  String get updateChecksNotSupported =>
      'בדיקות עדכונים אינן נתמכות בפלטפורמה זו.';

  @override
  String get updateNotificationsDisabled => 'הודעות עדכונים מושבתות.';

  @override
  String get pleaseWaitBeforeChecking => 'אנא המתן לפני שתבדוק שוב.';

  @override
  String get latestUpdateAlreadyShown => 'העדכון האחרון כבר הוצג.';

  @override
  String get updateAvailable => 'עדכון זמין.';

  @override
  String updateAvailableVersion(String version) {
    return 'עדכון זמין: v$version';
  }

  @override
  String get updateNotifications => 'עדכן הודעות';

  @override
  String get showWhenUpdatesAvailable => 'הצג מתי עדכונים זמינים';

  @override
  String updateAvailableTitle(String version) {
    return 'גרסה v$version זמינה';
  }

  @override
  String get readReleaseNotes => 'קרא את הערות הפרסום';

  @override
  String get downloadingUpdate => 'מוריד עדכון...';

  @override
  String get updateDownloadFailed => 'הורדת העדכון נכשלה. אנא נסה שוב.';

  @override
  String get openReleasesPage => 'פתח את דף הפרסומים';

  @override
  String get navigation => 'ניווט';

  @override
  String get watchedIndicatorsBackdrops => 'נצפו מחוונים, תפאורות';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'צבע מיקוד, מחוונים שנצפו, תפאורות';

  @override
  String get navbarStyleToolbarAppearance =>
      'סגנון Navbar, לחצני סרגל הכלים, מראה';

  @override
  String get reorderToggleHomeRows => 'סדר מחדש והחלף את שורות הבית';

  @override
  String get featuredContentAppearance => 'תוכן מומלץ, מראה';

  @override
  String get posterSizeImageTypeFolderView =>
      'גודל פוסטר, סוג תמונה, תצוגת תיקייה';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB ומקורות דירוג';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'מגבלת מטמון תמונות';

  @override
  String get clearImageCache => 'נקה מטמון תמונות';

  @override
  String get imageCacheCleared => 'מטמון התמונות נוקה';

  @override
  String get clear => 'נקה';

  @override
  String get browse => 'לְדַפדֵף';

  @override
  String get noResults => 'אין תוצאות';

  @override
  String get seerrAvailableStatus => 'זָמִין';

  @override
  String get seerrRequestedStatus => 'התבקש';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'מוריד · $percent%';
  }

  @override
  String get seerrImportingStatus => 'מייבא';

  @override
  String itemsCount(int count) {
    return '$count פריטים';
  }

  @override
  String get seerrSettings => 'הגדרות Seerr';

  @override
  String get requestMore => 'בקש עוד';

  @override
  String get request => 'בַּקָשָׁה';

  @override
  String get cancelRequest => 'בטל את הבקשה';

  @override
  String get playInMoonfin => 'שחקו ב- Moonfin';

  @override
  String requestedByName(String name) {
    return 'התבקש על ידי $name';
  }

  @override
  String get approve => 'לְאַשֵׁר';

  @override
  String get declineAction => 'יְרִידָה';

  @override
  String get similar => 'דוֹמֶה';

  @override
  String get recommendations => 'המלצות';

  @override
  String cancelRequestForTitle(String title) {
    return 'לבטל את הבקשה עבור \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'לבטל $count בקשות עבור \"$title\"?';
  }

  @override
  String get keep => 'לִשְׁמוֹר';

  @override
  String get itemNotFoundInLibrary => 'הפריט לא נמצא בספריית Moonfin שלך';

  @override
  String get errorSearchingLibrary => 'שגיאה בחיפוש הספרייה';

  @override
  String budgetAmount(String amount) {
    return 'תקציב: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'הכנסות: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'בקש $type';
  }

  @override
  String get submitRequest => 'שלח בקשה';

  @override
  String get allSeasons => 'כל העונות';

  @override
  String get advancedOptions => 'אפשרויות מתקדמות';

  @override
  String get noServiceServersConfigured => 'לא הוגדרו שרתי שירות';

  @override
  String get server => 'שרת';

  @override
  String get qualityProfile => 'פרופיל איכות';

  @override
  String get rootFolder => 'תיקיית שורש';

  @override
  String get showMore => 'הצג עוד';

  @override
  String get appearances => 'הופעות';

  @override
  String get crewSection => 'צוות';

  @override
  String ageValue(int age) {
    return 'גיל $age';
  }

  @override
  String get noRequests => 'אין בקשות';

  @override
  String get pendingStatus => 'תָלוּי וְעוֹמֵד';

  @override
  String get declinedStatus => 'נדחה';

  @override
  String get partiallyAvailable => 'זמין חלקית';

  @override
  String get downloadingStatus => 'מוריד';

  @override
  String get approvedStatus => 'מְאוּשָׁר';

  @override
  String get notRequestedStatus => 'לא מתבקש';

  @override
  String get blocklistedStatus => 'ברשימת החסימה';

  @override
  String get deletedStatus => 'נמחק';

  @override
  String get failedStatus => 'נכשל';

  @override
  String get processingStatus => 'בעיבוד';

  @override
  String modifiedByName(String name) {
    return 'שונה על ידי $name';
  }

  @override
  String get completedStatus => 'הושלם';

  @override
  String get requestErrorDuplicate => 'כותר זה כבר התבקש';

  @override
  String get requestErrorQuota => 'הגעת למגבלת הבקשות';

  @override
  String get requestErrorBlocklisted => 'כותר זה נמצא ברשימת החסומים';

  @override
  String get requestErrorNoSeasons => 'לא נותרו עונות לבקש';

  @override
  String get requestErrorPermission => 'אין לך הרשאה לבצע בקשה זו';

  @override
  String get seerrRequestsTitle => 'בקשות';

  @override
  String get seerrIssuesTitle => 'תקלות';

  @override
  String get sortNewest => 'החדשים ביותר';

  @override
  String get sortLastModified => 'שונו לאחרונה';

  @override
  String get noIssues => 'אין תקלות';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'נותרו $remaining מתוך $limit בקשות סרטים';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'נותרו $remaining מתוך $limit בקשות עונות';
  }

  @override
  String partOfCollectionName(String name) {
    return 'חלק מ-$name';
  }

  @override
  String get viewCollection => 'הצג אוסף';

  @override
  String get requestCollection => 'בקש אוסף';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total סרטים · $available זמינים';
  }

  @override
  String requestMoviesCount(int count) {
    return 'בקש $count סרטים';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'מבקש $current מתוך $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'התבקשו $count סרטים';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'התבקשו $ok מתוך $total סרטים';
  }

  @override
  String get collectionAllRequested => 'כל הסרטים כבר זמינים או שכבר התבקשו';

  @override
  String get reportIssue => 'דווח על תקלה';

  @override
  String get issueTypeVideo => 'וידאו';

  @override
  String get issueTypeAudio => 'אודיו';

  @override
  String get whatsWrong => 'מה הבעיה?';

  @override
  String get allEpisodes => 'כל הפרקים';

  @override
  String get episode => 'פרק';

  @override
  String get openStatus => 'פתוח';

  @override
  String get resolvedStatus => 'נפתרה';

  @override
  String get resolveAction => 'פתור';

  @override
  String get reopenAction => 'פתח מחדש';

  @override
  String reportedByName(String name) {
    return 'דווח על ידי $name';
  }

  @override
  String commentsCount(int count) {
    return '$count תגובות';
  }

  @override
  String get addComment => 'הוסף תגובה';

  @override
  String get deleteIssueConfirm => 'למחוק את התקלה הזו?';

  @override
  String get submitReport => 'שלח דיווח';

  @override
  String get tmdbScore => 'ציון TMDB';

  @override
  String get releaseDateLabel => 'תאריך יציאה';

  @override
  String get firstAirDateLabel => 'תאריך שידור ראשון';

  @override
  String get revenueLabel => 'הַכנָסָה';

  @override
  String get runtimeLabel => 'זמן ריצה';

  @override
  String get budgetLabel => 'תַקצִיב';

  @override
  String get originalLanguageLabel => 'שפת מקור';

  @override
  String get seasonsLabel => 'עונות';

  @override
  String get episodesLabel => 'פרקים';

  @override
  String get access => 'גִישָׁה';

  @override
  String get add => 'הוסף';

  @override
  String get address => 'כְּתוֹבֶת';

  @override
  String get analytics => 'אנליטיקס';

  @override
  String get catalog => 'קָטָלוֹג';

  @override
  String get content => 'תוֹכֶן';

  @override
  String get copy => 'לְהַעְתִיק';

  @override
  String get create => 'לִיצוֹר';

  @override
  String get disable => 'השבת';

  @override
  String get done => 'סיום';

  @override
  String get edit => 'עריכה';

  @override
  String get encoding => 'הַצפָּנָה';

  @override
  String get error => 'שְׁגִיאָה';

  @override
  String get forward => 'קדימה';

  @override
  String get general => 'כללי';

  @override
  String get go => 'לָלֶכֶת';

  @override
  String get install => 'לְהַתְקִין';

  @override
  String get installed => 'מוּתקָן';

  @override
  String get interval => 'הַפסָקָה';

  @override
  String get name => 'שֵׁם';

  @override
  String get networking => 'רשת';

  @override
  String get next => 'הבא';

  @override
  String get path => 'נָתִיב';

  @override
  String get paused => 'מושהה';

  @override
  String get permissions => 'הרשאות';

  @override
  String get processing => 'עיבוד';

  @override
  String get profile => 'פּרוֹפִיל';

  @override
  String get provider => 'ספק';

  @override
  String get refresh => 'לְרַעֲנֵן';

  @override
  String get remote => 'שלט רחוק';

  @override
  String get rename => 'שנה שם';

  @override
  String get revoke => 'לְבַטֵל';

  @override
  String get role => 'תַפְקִיד';

  @override
  String get root => 'שׁוֹרֶשׁ';

  @override
  String get run => 'לָרוּץ';

  @override
  String get search => 'חיפוש';

  @override
  String get select => 'לִבחוֹר';

  @override
  String get send => 'לִשְׁלוֹחַ';

  @override
  String get sessions => 'הפעלות';

  @override
  String get set => 'מַעֲרֶכֶת';

  @override
  String get status => 'סטָטוּס';

  @override
  String get stop => 'עצור';

  @override
  String get streaming => 'נְהִירָה';

  @override
  String get time => 'זְמַן';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'הסר את ההתקנה';

  @override
  String get up => 'לְמַעלָה';

  @override
  String get update => 'לְעַדְכֵּן';

  @override
  String get upload => 'העלה';

  @override
  String get unmute => 'בטל השתקה';

  @override
  String get mute => 'השתק';

  @override
  String get branding => 'מיתוג';

  @override
  String get adminDrawerDashboard => 'לוּחַ מַחווָנִים';

  @override
  String get adminDrawerAnalytics => 'אנליטיקס';

  @override
  String get adminDrawerSettings => 'הגדרות';

  @override
  String get adminDrawerBranding => 'מיתוג';

  @override
  String get adminDrawerUsers => 'משתמשים';

  @override
  String get adminDrawerLibraries => 'ספריות';

  @override
  String get adminDrawerDisplay => 'תצוגה';

  @override
  String get adminDrawerMetadata => 'מטא-נתונים';

  @override
  String get adminDrawerNfo => 'הגדרות NFO';

  @override
  String get adminDrawerTranscoding => 'המרת קידוד';

  @override
  String get adminDrawerResume => 'המשך';

  @override
  String get adminDrawerStreaming => 'נְהִירָה';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'מכשירים';

  @override
  String get adminDrawerActivity => 'פְּעִילוּת';

  @override
  String get adminDrawerNetworking => 'רשת';

  @override
  String get adminDrawerApiKeys => 'מפתחות API';

  @override
  String get adminDrawerBackups => 'גיבויים';

  @override
  String get adminDrawerLogs => 'יומנים';

  @override
  String get adminDrawerScheduledTasks => 'משימות מתוזמנות';

  @override
  String get adminDrawerPlugins => 'תוספים';

  @override
  String get adminDrawerRepositories => 'מאגרים';

  @override
  String get adminDrawerLiveTv => 'טלוויזיה בשידור חי';

  @override
  String get adminExitTooltip => 'צא ממנהל המערכת';

  @override
  String get adminDashboardLoadFailed => 'טעינת לוח המחוונים נכשלה';

  @override
  String get adminMediaOverview => 'סקירת מדיה';

  @override
  String get adminMediaTotalsError =>
      'לא ניתן היה לטעון את סכומי המדיה של השרת.';

  @override
  String get adminMediaOverviewSubtitle =>
      'קריאה מהירה על כמה תוכן יש בשרת הזה.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'עדכוני תוספים זמינים: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'תוספים הדורשים הפעלה מחדש: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'משימות מתוזמנות שנכשלו: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'רשומות אזהרה/שגיאה אחרונות: $count';
  }

  @override
  String get analyticsMediaDistribution => 'הפצת מדיה';

  @override
  String get analyticsVideoCodecs => 'קודקים של וידאו';

  @override
  String get analyticsAudioCodecs => 'Codec אודיו';

  @override
  String get analyticsContainers => 'מיכלים';

  @override
  String get analyticsTopGenres => 'ז\'אנרים מובילים';

  @override
  String get analyticsReleaseYears => 'שנות שחרור';

  @override
  String get analyticsContentRatings => 'דירוגי תוכן';

  @override
  String get analyticsRuntimeBuckets => 'ריצה דליים';

  @override
  String get analyticsFileFormats => 'פורמטים של קבצים';

  @override
  String get analyticsNoData => 'אין נתונים זמינים.';

  @override
  String get adminServerInfo => 'מידע על השרת';

  @override
  String get adminRestartPending => 'הפעל מחדש בהמתנה';

  @override
  String get adminServerPaths => 'נתיבי שרת';

  @override
  String get adminServerActions => 'פעולות שרת';

  @override
  String get adminRestartServer => 'הפעל מחדש את השרת';

  @override
  String get adminShutdownServer => 'כיבוי שרת';

  @override
  String get adminScanLibraries => 'סרוק ספריות';

  @override
  String get adminLibraryScanStarted => 'סריקת הספרייה החלה';

  @override
  String errorGeneric(String error) {
    return 'שגיאה: $error';
  }

  @override
  String get adminServerRebootInProgress => 'אתחול השרת מתבצע';

  @override
  String get adminServerRebootMessage =>
      'אתחול השרת מתבצע, אנא הפעל מחדש את Moonfin';

  @override
  String get adminActiveSessions => 'הפעלות פעילות';

  @override
  String get adminSessionsLoadFailed => 'טעינת ההפעלות נכשלה';

  @override
  String get adminNoActiveSessions => 'אין הפעלות פעילות';

  @override
  String get adminRecentActivity => 'פעילות אחרונה';

  @override
  String get adminNoRecentActivity => 'אין פעילות אחרונה';

  @override
  String adminCommandFailed(String error) {
    return 'הפקודה נכשלה: $error';
  }

  @override
  String get adminSendMessage => 'שלח הודעה';

  @override
  String get adminMessageTextHint => 'טקסט הודעה';

  @override
  String get adminSetVolume => 'הגדר את עוצמת הקול';

  @override
  String get sessionPrev => 'הקודם';

  @override
  String get sessionRewind => 'החזר לאחור';

  @override
  String get sessionForward => 'קדימה';

  @override
  String get sessionNext => 'הבא';

  @override
  String get sessionVolumeDown => 'כרך -';

  @override
  String get sessionVolumeUp => 'כרך +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'עכשיו משחק';

  @override
  String get volume => 'עוצמת קול';

  @override
  String get actions => 'פעולות';

  @override
  String get videoCodec => 'Codec וידאו';

  @override
  String get audioCodec => 'Codec אודיו';

  @override
  String get hwAccel => 'האצת חומרה';

  @override
  String get completion => 'סִיוּם';

  @override
  String get direct => 'יָשִׁיר';

  @override
  String get adminDisconnect => 'לְנַתֵק';

  @override
  String get adminClearDates => 'תאריכים ברורים';

  @override
  String get adminActivitySeverityAll => 'כל רמות החומרה';

  @override
  String get adminActivityDateRange => 'טווח תאריכים';

  @override
  String adminActivityLoadFailed(String error) {
    return 'טעינת יומן הפעילות נכשלה: $error';
  }

  @override
  String get adminNoActivityEntries => 'אין רשומות פעילות';

  @override
  String get adminEditDeviceName => 'ערוך את שם המכשיר';

  @override
  String get adminCustomName => 'שם מותאם אישית';

  @override
  String get adminDeviceNameUpdated => 'שם המכשיר עודכן';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'עדכון המכשיר נכשל: $error';
  }

  @override
  String get adminDeleteDevice => 'מחק מכשיר';

  @override
  String get adminDeviceDeleted => 'המכשיר נמחק';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'מחיקת המכשיר נכשלה: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'להסיר את המכשיר \'$name\'? המשתמש יצטרך להתחבר שוב במכשיר זה.';
  }

  @override
  String get adminDeleteAllDevices => 'מחק את כל המכשירים';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'להסיר $count מכשירים? המשתמשים המושפעים יצטרכו להתחבר שוב. המכשיר הנוכחי שלך לא יושפע.';
  }

  @override
  String get adminDevicesDeletedAll => 'המכשירים הוסרו';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'חלק מהמכשירים הוסרו; לא ניתן היה להסיר $count.';
  }

  @override
  String get adminDevicesLoadFailed => 'טעינת המכשירים נכשלה';

  @override
  String get adminSearchDevices => 'חפש מכשירים';

  @override
  String get adminThisDevice => 'המכשיר הזה';

  @override
  String get adminEditName => 'ערוך שם';

  @override
  String get adminLibrariesLoadFailed => 'טעינת הספריות נכשלה';

  @override
  String get adminNoLibraries => 'לא הוגדרו ספריות';

  @override
  String get adminScanAllLibraries => 'סרוק את כל הספריות';

  @override
  String get adminAddLibrary => 'הוסף ספרייה';

  @override
  String adminScanFailed(String error) {
    return 'לא ניתן היה להתחיל את הסריקה: $error';
  }

  @override
  String get adminRenameLibrary => 'שנה את שם הספרייה';

  @override
  String get adminNewName => 'שם חדש';

  @override
  String adminLibraryRenamed(String name) {
    return 'שם הספרייה שונה ל-\"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'שינוי השם נכשל: $error';
  }

  @override
  String get adminDeleteLibrary => 'מחק ספרייה';

  @override
  String adminLibraryDeleted(String name) {
    return 'הספרייה \"$name\" נמחקה';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'מחיקת הספרייה נכשלה: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'הוספת הנתיב נכשלה: $error';
  }

  @override
  String get adminRemovePath => 'הסר נתיב';

  @override
  String adminRemovePathConfirm(String path) {
    return 'להסיר את \"$path\" מספרייה זו?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'הסרת הנתיב נכשלה: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'אפשרויות הספרייה נשמרו';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'שמירת האפשרויות נכשלה: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'טעינת הספרייה נכשלה';

  @override
  String get adminNoMediaPaths => 'לא הוגדרו נתיבי מדיה';

  @override
  String get adminAddPath => 'הוסף נתיב';

  @override
  String get adminBrowseFilesystem => 'עיין במערכת הקבצים של השרת:';

  @override
  String get adminSaveOptions => 'שמור אפשרויות';

  @override
  String get adminPreferredMetadataLanguage => 'שפת מטא נתונים מועדפת';

  @override
  String get adminMetadataLanguageHint => 'לְמָשָׁל en, de, fr';

  @override
  String get adminMetadataCountryCode => 'קוד מדינה של מטא נתונים';

  @override
  String get adminMetadataCountryHint => 'לְמָשָׁל ארה\"ב, DE, FR';

  @override
  String get adminLibraryTabPaths => 'נתיבים';

  @override
  String get adminLibraryTabOptions => 'אפשרויות';

  @override
  String get adminLibraryTabDownloaders => 'מנועי הורדה';

  @override
  String get adminLibMetadataSavers => 'שומרי מטא-נתונים';

  @override
  String get adminLibSubtitleDownloaders => 'מנועי הורדת כתוביות';

  @override
  String get adminLibLyricDownloaders => 'מנועי הורדת מילות שירים';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'מנועי הורדת מטא-נתונים: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'מאחזרי תמונות: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'השרת אינו מציע מנועי הורדה עבור סוג ספרייה זה.';

  @override
  String get adminLibrarySectionGeneral => 'כללי';

  @override
  String get adminLibrarySectionMetadata => 'מטא-נתונים';

  @override
  String get adminLibrarySectionEmbedded => 'מידע מוטמע';

  @override
  String get adminLibrarySectionSubtitles => 'כתוביות';

  @override
  String get adminLibrarySectionImages => 'תמונות';

  @override
  String get adminLibrarySectionSeries => 'סדרות';

  @override
  String get adminLibrarySectionMusic => 'מוזיקה';

  @override
  String get adminLibrarySectionMovies => 'סרטים';

  @override
  String get adminLibRealtimeMonitor => 'הפעל ניטור בזמן אמת';

  @override
  String get adminLibRealtimeMonitorHint =>
      'זהה שינויים בקבצים ועבד אותם אוטומטית.';

  @override
  String get adminLibArchiveMediaFiles => 'התייחס לארכיונים כאל קובצי מדיה';

  @override
  String get adminLibEnablePhotos => 'הצג תמונות';

  @override
  String get adminLibSaveLocalMetadata => 'שמור עטיפות בתיקיות המדיה';

  @override
  String get adminLibRefreshInterval => 'רענון אוטומטי של מטא-נתונים';

  @override
  String get adminLibRefreshNever => 'אף פעם';

  @override
  String get adminLibDefault => 'ברירת מחדל';

  @override
  String get adminLibDisplayTitle => 'תצוגה';

  @override
  String get adminLibDisplaySection => 'תצוגת ספרייה';

  @override
  String get adminLibFolderView => 'הצג תצוגת תיקיות עבור תיקיות מדיה רגילות';

  @override
  String get adminLibSpecialsInSeasons => 'הצג פרקים מיוחדים בעונות שבהן שודרו';

  @override
  String get adminLibGroupMovies => 'קבץ סרטים לאוספים';

  @override
  String get adminLibGroupShows => 'קבץ סדרות לאוספים';

  @override
  String get adminLibExternalSuggestions => 'הצג תוכן חיצוני בהצעות';

  @override
  String get adminLibDateAddedSection => 'התנהגות תאריך ההוספה';

  @override
  String get adminLibDateAddedLabel => 'השתמש בתאריך ההוספה מתוך';

  @override
  String get adminLibDateAddedImport => 'התאריך שבו נסרק לספרייה';

  @override
  String get adminLibDateAddedFile => 'התאריך שבו נוצר הקובץ';

  @override
  String get adminLibMetadataTitle => 'מטא-נתונים ותמונות';

  @override
  String get adminLibMetadataLangSection => 'שפת מטא-נתונים מועדפת';

  @override
  String get adminLibChaptersSection => 'פרקים';

  @override
  String get adminLibDummyChapterDuration => 'משך פרק מדומה (שניות)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'אורך הפרקים שנוצרים עבור מדיה שאין בה פרקים. הגדר 0 כדי להשבית.';

  @override
  String get adminLibChapterImageResolution => 'רזולוציית תמונות הפרקים';

  @override
  String get adminLibNfoTitle => 'הגדרות NFO';

  @override
  String get adminLibNfoHelp =>
      'מטא-נתוני NFO תואמים ל-Kodi וללקוחות דומים. ההגדרות חלות על כל הספריות ששומרות מטא-נתוני NFO.';

  @override
  String get adminLibKodiUser => 'המשתמש שעבורו יישמרו נתוני הצפייה בקובצי NFO';

  @override
  String get adminLibSaveImagePaths => 'שמור נתיבי תמונות בתוך קובצי NFO';

  @override
  String get adminLibPathSubstitution =>
      'הפעל החלפת נתיבים עבור נתיבי תמונות ב-NFO';

  @override
  String get adminLibExtraThumbs =>
      'העתק תמונות extrafanart לתיקיית extrathumbs';

  @override
  String get adminLibNone => 'ללא';

  @override
  String adminLibRefreshDays(int days) {
    return '$days ימים';
  }

  @override
  String get adminLibEmbeddedTitles => 'השתמש בכותרים מוטמעים';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'השתמש בכותרים מוטמעים עבור תוספות';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'השתמש במידע מוטמע על פרקים';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'אפשר כתוביות מוטמעות';

  @override
  String get adminLibEmbeddedAllowAll => 'אפשר הכל';

  @override
  String get adminLibEmbeddedAllowText => 'טקסט בלבד';

  @override
  String get adminLibEmbeddedAllowImage => 'תמונה בלבד';

  @override
  String get adminLibEmbeddedAllowNone => 'ללא';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'דלג על ההורדה אם קיימות כתוביות מוטמעות';

  @override
  String get adminLibSkipIfAudioMatches =>
      'דלג על ההורדה אם רצועת האודיו תואמת לשפת ההורדה';

  @override
  String get adminLibRequirePerfectMatch => 'דרוש התאמת כתוביות מושלמת';

  @override
  String get adminLibSaveSubtitlesWithMedia => 'שמור כתוביות בתיקיות המדיה';

  @override
  String get adminLibChapterImageExtraction => 'חלץ תמונות פרקים';

  @override
  String get adminLibChapterImagesDuringScan =>
      'חלץ תמונות פרקים במהלך סריקת הספרייה';

  @override
  String get adminLibTrickplayExtraction => 'הפעל חילוץ תמונות Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'חלץ תמונות Trickplay במהלך סריקת הספרייה';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'שמור תמונות Trickplay בתיקיות המדיה';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'מזג אוטומטית סדרות המפוזרות בכמה תיקיות';

  @override
  String get adminLibSeasonZeroName => 'שם התצוגה של עונה אפס';

  @override
  String get adminLibLufsScan => 'הפעל סריקת LUFS לנרמול עוצמת האודיו';

  @override
  String get adminLibPreferNonstandardArtist => 'העדף תג אמנים לא סטנדרטי';

  @override
  String get adminLibAutoAddToCollection => 'הוסף סרטים לאוספים אוטומטית';

  @override
  String get adminLibraryNameRequired => 'נדרש שם הספרייה';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'יצירת הספרייה נכשלה: $error';
  }

  @override
  String get adminLibraryName => 'שם הספרייה';

  @override
  String get adminSelectedPaths => 'נתיבים נבחרים:';

  @override
  String get adminNoPathsAdded => 'לא נוספו נתיבים (ניתן להוסיף מאוחר יותר)';

  @override
  String get adminCreateLibrary => 'צור ספרייה';

  @override
  String get paths => 'נתיבים:';

  @override
  String get adminDisableUser => 'השבת את המשתמש';

  @override
  String get adminEnableUser => 'אפשר משתמש';

  @override
  String adminDisableUserConfirm(String name) {
    return 'להשבית את $name? הוא לא יוכל להתחבר.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'להפעיל את $name? הוא יוכל להתחבר שוב.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'המשתמש \"$name\" הושבת';
  }

  @override
  String adminUserEnabled(String name) {
    return 'המשתמש \"$name\" הופעל';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'עדכון מדיניות המשתמש נכשל: $error';
  }

  @override
  String get adminUsersLoadFailed => 'טעינת המשתמשים נכשלה';

  @override
  String get adminSearchUsers => 'חפש משתמשים';

  @override
  String get adminEditUser => 'ערוך משתמש';

  @override
  String get adminAddUser => 'הוסף משתמש';

  @override
  String adminUserCreateFailed(String error) {
    return 'יצירת המשתמש נכשלה: $error';
  }

  @override
  String get adminCreateUser => 'צור משתמש';

  @override
  String get adminPasswordOptional => 'סיסמא (אופציונלי)';

  @override
  String get adminUsernameRequired => 'שם משתמש לא יכול להיות ריק';

  @override
  String get adminNoProfileChanges => 'אין שינויים בפרופיל לשמירה';

  @override
  String get adminProfileSaved => 'הפרופיל נשמר';

  @override
  String adminSaveFailed(String error) {
    return 'השמירה נכשלה: $error';
  }

  @override
  String get adminPermissionsSaved => 'ההרשאות נשמרו';

  @override
  String get adminPasswordsMismatch => 'הסיסמאות אינן תואמות';

  @override
  String adminFailed(String error) {
    return 'נכשל: $error';
  }

  @override
  String get adminUserLoadFailed => 'טעינת המשתמש נכשלה';

  @override
  String get adminBackToUsers => 'חזרה למשתמשים';

  @override
  String get adminSaveProfile => 'שמור פרופיל';

  @override
  String get adminDeleteUser => 'מחק משתמש';

  @override
  String get admin => 'מנהל מערכת';

  @override
  String get adminFullAccessWarning => 'למנהלים יש גישה מלאה לשרת. תן בזהירות.';

  @override
  String get administrator => 'מְנַהֵל';

  @override
  String get adminHiddenUser => 'משתמש נסתר';

  @override
  String get adminAllowMediaPlayback => 'אפשר השמעת מדיה';

  @override
  String get adminAllowAudioTranscoding => 'אפשר המרת קידוד אודיו';

  @override
  String get adminAllowVideoTranscoding => 'אפשר המרת קידוד וידאו';

  @override
  String get adminAllowRemuxing => 'אפשר רימיקס';

  @override
  String get adminForceRemoteTranscoding => 'כפה המרת קידוד מקור מרחוק';

  @override
  String get adminAllowContentDeletion => 'אפשר מחיקת תוכן';

  @override
  String get adminAllowContentDownloading => 'אפשר הורדת תוכן';

  @override
  String get adminAllowPublicSharing => 'אפשר שיתוף ציבורי';

  @override
  String get adminAllowRemoteControl => 'אפשר שליטה מרחוק של משתמשים אחרים';

  @override
  String get adminAllowSharedDeviceControl => 'אפשר שליטה במכשיר משותף';

  @override
  String get adminAllowRemoteAccess => 'אפשר גישה מרחוק';

  @override
  String get adminRemoteBitrateLimit => 'מגבלת קצב סיביות של לקוח מרחוק (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'השאר ריק ללא הגבלה';

  @override
  String get adminMaxActiveSessions => 'מקסימום הפעלות פעילות';

  @override
  String get adminAllowLiveTvAccess => 'אפשר גישה לטלוויזיה בשידור חי';

  @override
  String get adminAllowLiveTvManagement => 'אפשר ניהול טלוויזיה בשידור חי';

  @override
  String get adminAllowCollectionManagement => 'אפשר ניהול אוסף';

  @override
  String get adminAllowSubtitleManagement => 'אפשר ניהול כתוביות';

  @override
  String get adminAllowLyricManagement => 'אפשר ניהול מילים';

  @override
  String get adminSavePermissions => 'שמור הרשאות';

  @override
  String get adminEnableAllLibraryAccess => 'אפשר גישה לכל הספריות';

  @override
  String get adminSaveAccess => 'שמור גישה';

  @override
  String get adminChangePassword => 'שנה סיסמה';

  @override
  String get adminNewPassword => 'סיסמה חדשה';

  @override
  String get adminConfirmPassword => 'אשר את הסיסמה';

  @override
  String get adminSetPassword => 'הגדר סיסמה';

  @override
  String get adminResetPassword => 'אפס סיסמה';

  @override
  String get adminPasswordReset => 'איפוס סיסמה';

  @override
  String get adminPasswordUpdated => 'הסיסמה עודכנה';

  @override
  String get adminUserSettings => 'הגדרות משתמש';

  @override
  String get adminLibraryAccess => 'גישה לספרייה';

  @override
  String get adminDeviceAndChannelAccess => 'גישה למכשיר וערוץ';

  @override
  String get adminEnableAllDevices => 'אפשר גישה לכל המכשירים';

  @override
  String get adminEnableAllChannels => 'אפשר גישה לכל הערוצים';

  @override
  String get adminParentalControl => 'בקרת הורים';

  @override
  String get adminMaxParentalRating => 'דירוג הורים מרבי מותר';

  @override
  String get adminMaxParentalRatingHint =>
      'תוכן בעל דירוג גבוה יותר יוסתר ממשתמש זה.';

  @override
  String get adminParentalRatingNone => 'ללא';

  @override
  String get adminBlockUnratedItems =>
      'חסום פריטים ללא מידע דירוג או עם דירוג לא מזוהה';

  @override
  String get adminUnratedBook => 'ספרים';

  @override
  String get adminUnratedChannelContent => 'ערוצים';

  @override
  String get adminUnratedLiveTvChannel => 'טלוויזיה בשידור חי';

  @override
  String get adminUnratedMovie => 'סרטים';

  @override
  String get adminUnratedMusic => 'מוזיקה';

  @override
  String get adminUnratedTrailer => 'טריילרים';

  @override
  String get adminUnratedSeries => 'סדרות';

  @override
  String get adminAccessSchedules => 'לוחות זמנים לגישה';

  @override
  String get adminAccessSchedulesHint =>
      'אפשר גישה רק בזמנים המתוזמנים שלהלן. כאשר לא הוגדר לוח זמנים, הגישה מותרת כל היום.';

  @override
  String get adminAddSchedule => 'הוסף לוח זמנים';

  @override
  String get adminScheduleDay => 'יום';

  @override
  String get adminScheduleStart => 'התחלה';

  @override
  String get adminScheduleEnd => 'סיום';

  @override
  String get adminDayEveryday => 'כל יום';

  @override
  String get adminDayWeekday => 'יום חול';

  @override
  String get adminDayWeekend => 'סוף שבוע';

  @override
  String get adminDaySunday => 'יום ראשון';

  @override
  String get adminDayMonday => 'יום שני';

  @override
  String get adminDayTuesday => 'יום שלישי';

  @override
  String get adminDayWednesday => 'יום רביעי';

  @override
  String get adminDayThursday => 'יום חמישי';

  @override
  String get adminDayFriday => 'יום שישי';

  @override
  String get adminDaySaturday => 'שבת';

  @override
  String get adminAllowedTags => 'תגיות מותרות';

  @override
  String get adminAllowedTagsHint =>
      'רק תוכן עם התגיות האלה יוצג. השאר ריק כדי לאפשר הכל.';

  @override
  String get adminBlockedTags => 'תגיות חסומות';

  @override
  String get adminBlockedTagsHint => 'תוכן עם התגיות האלה יוסתר ממשתמש זה.';

  @override
  String get adminAddTag => 'הוסף תגית';

  @override
  String get adminEnabledDevices => 'מכשירים מופעלים';

  @override
  String get adminEnabledChannels => 'ערוצים מופעלים';

  @override
  String get adminAuthProvider => 'ספק אימות';

  @override
  String get adminPasswordResetProvider => 'ספק איפוס סיסמה';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'מספר ניסיונות ההתחברות הכושלים המרבי לפני נעילה';

  @override
  String get adminLoginAttemptsHint =>
      'הגדר 0 לברירת המחדל, או -1 כדי להשבית את הנעילה.';

  @override
  String get adminSyncPlayAccess => 'גישה ל-SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin => 'אפשר יצירת קבוצות והצטרפות אליהן';

  @override
  String get adminSyncPlayJoin => 'אפשר הצטרפות לקבוצות';

  @override
  String get adminSyncPlayNone => 'אין גישה';

  @override
  String get adminContentDeletionFolders => 'אפשר מחיקת תוכן מתוך';

  @override
  String get adminResetPasswordWarning =>
      'פעולה זו תסיר את הסיסמה. המשתמש יוכל להיכנס ללא סיסמה.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'השרת החזיר HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'האם אתה בטוח שברצונך למחוק את $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'המשתמש \"$name\" נמחק';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'מחיקת המשתמש נכשלה: $error';
  }

  @override
  String get adminCreateApiKey => 'צור מפתח API';

  @override
  String get adminAppName => 'שם האפליקציה';

  @override
  String get adminApiKeyCreated => 'מפתח API נוצר';

  @override
  String get adminApiKeyCreatedNoToken =>
      'מפתח נוצר בהצלחה. השרת לא החזיר את האסימון. בדוק את מפתחות ה-API של השרת.';

  @override
  String get adminKeyCopied => 'המפתח הועתק ללוח';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'יצירת המפתח נכשלה: $error';
  }

  @override
  String get adminKeyTokenMissing => 'אסימון מפתח חסר בתגובת השרת';

  @override
  String get adminRevokeApiKey => 'בטל מפתח API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'לבטל את המפתח עבור $name?';
  }

  @override
  String get adminApiKeyRevoked => 'מפתח API בוטל';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'ביטול המפתח נכשל: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'טעינת מפתחות API נכשלה';

  @override
  String get adminApiKeysTitle => 'מפתחות API';

  @override
  String get adminCreateKey => 'צור מפתח';

  @override
  String get adminNoApiKeys => 'לא נמצאו מפתחות API';

  @override
  String get adminUnknownApp => 'אפליקציה לא ידועה';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'אסימון: $token\\nנוצר: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'צור גיבוי';

  @override
  String get adminBackupInclude => 'בחר מה לכלול בגיבוי.';

  @override
  String get adminBackupDatabase => 'מסד נתונים';

  @override
  String get adminBackupDatabaseAlways => 'תמיד נכלל';

  @override
  String get adminBackupMetadata => 'מטא נתונים';

  @override
  String get adminBackupSubtitles => 'כתוביות';

  @override
  String get adminBackupTrickplay => 'תמונות Trickplay';

  @override
  String get adminCreatingBackup => 'יוצר גיבוי...';

  @override
  String get adminBackupCreated => 'הגיבוי נוצר בהצלחה';

  @override
  String adminBackupCreateFailed(String error) {
    return 'יצירת הגיבוי נכשלה: $error';
  }

  @override
  String get adminBackupPathMissing => 'נתיב גיבוי חסר בתגובת השרת';

  @override
  String adminBackupManifest(String name) {
    return 'מניפסט: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'טעינת המניפסט נכשלה: $error';
  }

  @override
  String get adminConfirmRestore => 'אשר שחזור';

  @override
  String get adminRestoringBackup => 'משחזר גיבוי...';

  @override
  String adminRestoreFailed(String error) {
    return 'שחזור הגיבוי נכשל: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'טעינת הגיבויים נכשלה';

  @override
  String get adminCreateBackup => 'צור גיבוי';

  @override
  String get adminNoBackups => 'לא נמצאו גיבויים';

  @override
  String get adminViewDetails => 'הצג פרטים';

  @override
  String get restore => 'לְשַׁחְזֵר';

  @override
  String get adminLogsLoadFailed => 'טעינת יומני השרת נכשלה';

  @override
  String get adminNoLogFiles => 'לא נמצאו קבצי יומן';

  @override
  String get adminLogCopied => 'היומן הועתק ללוח';

  @override
  String get adminSaveLogFile => 'שמור קובץ יומן';

  @override
  String adminSavedTo(String path) {
    return 'נשמר אל $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'שמירת הקובץ נכשלה: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'טעינת $fileName נכשלה';
  }

  @override
  String get adminSearchInLog => 'חפש ביומן';

  @override
  String get adminNoMatchingLines => 'אין קווים תואמים';

  @override
  String adminTasksLoadFailed(String error) {
    return 'טעינת המשימות נכשלה: $error';
  }

  @override
  String get adminNoScheduledTasks => 'לא נמצאו משימות מתוזמנות';

  @override
  String get adminNoTasksMatchFilter => 'אין משימות שתואמות למסנן הנוכחי';

  @override
  String adminTaskStartFailed(String error) {
    return 'הפעלת המשימה נכשלה: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'עצירת המשימה נכשלה: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'טעינת המשימה נכשלה: $error';
  }

  @override
  String get adminRunNow => 'הרץ עכשיו';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'הסרת הטריגר נכשלה: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'הוספת הטריגר נכשלה: $error';
  }

  @override
  String get adminLastExecution => 'ביצוע אחרון';

  @override
  String get adminTriggers => 'טריגרים';

  @override
  String get adminAddTrigger => 'הוסף טריגר';

  @override
  String get adminNoTriggers => 'לא הוגדרו טריגרים';

  @override
  String get adminTriggerType => 'סוג טריגר';

  @override
  String get adminTimeLimit => 'מגבלת זמן (אופציונלי)';

  @override
  String get adminNoLimit => 'אין הגבלה';

  @override
  String adminHours(String hours) {
    return '$hours שעות';
  }

  @override
  String get adminDayOfWeek => 'יום בשבוע';

  @override
  String get adminSearchPlugins => 'חפש תוספים...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'החלפת מצב התוסף נכשלה: $error';
  }

  @override
  String get adminUninstallPlugin => 'הסר את ההתקנה של הפלאגין';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'האם להסיר את ההתקנה של \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'הסרת ההתקנה של התוסף נכשלה: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'התקנת החבילה נכשלה: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'התקנת העדכון נכשלה: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'טעינת התוספים נכשלה: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => 'אין תוספים שתואמים לחיפוש שלך';

  @override
  String get adminNoPluginsInstalled => 'לא מותקנים תוספים';

  @override
  String adminInstallUpdate(String version) {
    return 'התקן עדכון (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'טעינת הקטלוג נכשלה: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'אין חבילות שתואמות את החיפוש שלך';

  @override
  String get adminNoPackagesAvailable => 'אין חבילות זמינות';

  @override
  String get adminExperimentalIntegration => 'אינטגרציה נסיונית';

  @override
  String get adminExperimentalWarning =>
      'שילוב הגדרות הפלאגין עדיין ניסיוני. ייתכן שדפי הגדרות מסוימים לא יוצגו כהלכה.';

  @override
  String get continueAction => 'לְהַמשִׁיך';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" יוסר לאחר הפעלה מחדש של השרת';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'הסרת ההתקנה נכשלה: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'מעדכן את \"$name\" לגרסה v$version...';
  }

  @override
  String get adminMissingAuthToken => 'לא ניתן לפתוח הגדרות: חסר אסימון אישור.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'טעינת התוסף נכשלה: $error';
  }

  @override
  String get adminPluginNotFound => 'התוסף לא נמצא';

  @override
  String adminPluginVersion(String version) {
    return 'גרסה $version';
  }

  @override
  String get adminEnablePlugin => 'אפשר פלאגין';

  @override
  String get adminPluginSettingsPage => 'דף הגדרות הפלאגין';

  @override
  String get adminRevisionHistory => 'היסטוריית גרסאות';

  @override
  String get adminNoChangelog => 'אין יומן שינויים זמין.';

  @override
  String get adminRemoveRepository => 'הסר מאגר';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'האם להסיר את \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'שמירת המאגרים נכשלה: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'טעינת המאגרים נכשלה: $error';
  }

  @override
  String get adminRepositoryNameHint => 'לְמָשָׁל Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'כתובת האתר של מאגר';

  @override
  String get adminAddEntry => 'הוסף ערך';

  @override
  String get adminInvalidUrl => 'כתובת אתר לא חוקית';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'לא ניתן לטעון את הגדרות התוסף: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'לא ניתן לפתוח את $uri';
  }

  @override
  String get adminOpenInBrowser => 'פתח בדפדפן';

  @override
  String get adminOpenExternally => 'פתיחה חיצונית';

  @override
  String get adminGeneralSettings => 'הגדרות כלליות';

  @override
  String get adminServerName => 'שם השרת';

  @override
  String get adminPreferredMetadataCountry => 'ארץ מטא נתונים מועדפת';

  @override
  String get adminCachePath => 'נתיב מטמון';

  @override
  String get adminMetadataPath => 'נתיב מטא נתונים';

  @override
  String get adminLibraryScanConcurrency => 'סריקת ספרייה במקביל';

  @override
  String get adminParallelImageEncodingLimit => 'מגבלת קידוד תמונה מקבילה';

  @override
  String get adminSlowResponseThreshold => 'סף תגובה איטית (ms)';

  @override
  String get adminBrandingSaved => 'הגדרות המיתוג נשמרו';

  @override
  String get adminBrandingLoadFailed => 'טעינת הגדרות המיתוג נכשלה';

  @override
  String get adminLoginDisclaimer => 'כתב ויתור על כניסה';

  @override
  String get adminLoginDisclaimerHint => 'HTML מוצג מתחת לטופס ההתחברות';

  @override
  String get adminCustomCss => 'CSS מותאם אישית';

  @override
  String get adminCustomCssHint => 'CSS מותאם אישית הוחל על ממשק האינטרנט';

  @override
  String get adminEnableSplashScreen => 'אפשר מסך פתיחה';

  @override
  String get adminStreamingSaved => 'הגדרות הסטרימינג נשמרו';

  @override
  String get adminStreamingLoadFailed => 'טעינת הגדרות הסטרימינג נכשלה';

  @override
  String get adminStreamingDescription =>
      'הגדר מגבלות קצב סיביות גלובליות של סטרימינג עבור חיבורים מרוחקים.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'מגבלת קצב סיביות של לקוח מרוחק (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'השאר ריק או 0 ללא הגבלה';

  @override
  String get adminPlaybackSaved => 'הגדרות ההשמעה נשמרו';

  @override
  String get adminPlaybackLoadFailed => 'טעינת הגדרות ההשמעה נכשלה';

  @override
  String get adminPlaybackTranscoding => 'השמעה / המרת קידוד';

  @override
  String get adminHardwareAcceleration => 'האצת חומרה';

  @override
  String get adminVaapiDevice => 'מכשיר VA-API';

  @override
  String get adminEnableHardwareEncoding => 'אפשר קידוד חומרה';

  @override
  String get adminEnableHardwareDecoding => 'אפשר פענוח חומרה עבור:';

  @override
  String get adminEncodingThreads => 'שרשורי קידוד';

  @override
  String get adminAutomatic => '0 = אוטומטי';

  @override
  String get adminTranscodingTempPath => 'המרת נתיב טמפ\'';

  @override
  String get adminEnableFallbackFont => 'אפשר גופן חלופי';

  @override
  String get adminFallbackFontPath => 'נתיב גופן חלופי';

  @override
  String get adminAllowSegmentDeletion => 'אפשר מחיקת קטע';

  @override
  String get adminSegmentKeepSeconds => 'שמירה על פלח (שניות)';

  @override
  String get adminThrottleBuffering => 'חציצה של מצערת';

  @override
  String get adminTrickplaySaved => 'הגדרות Trickplay נשמרו';

  @override
  String get adminTrickplayLoadFailed => 'טעינת הגדרות Trickplay נכשלה';

  @override
  String get adminEnableHardwareAcceleration => 'אפשר האצת חומרה';

  @override
  String get adminEnableKeyFrameExtraction => 'אפשר חילוץ של מסגרת מפתח בלבד';

  @override
  String get adminKeyFrameSubtitle => 'מהיר יותר אך דיוק נמוך יותר';

  @override
  String get adminScanBehavior => 'התנהגות סריקה';

  @override
  String get adminProcessPriority => 'עדיפות תהליך';

  @override
  String get adminImageSettings => 'הגדרות תמונה';

  @override
  String get adminIntervalMs => 'מרווח (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'באיזו תדירות ללכוד פריימים';

  @override
  String get adminWidthResolutions => 'רזולוציות רוחב';

  @override
  String get adminTileWidth => 'רוחב אריחים';

  @override
  String get adminTileHeight => 'גובה אריחים';

  @override
  String get adminQualitySubtitle =>
      'ערכים נמוכים יותר = איכות טובה יותר, קבצים גדולים יותר';

  @override
  String get adminProcessThreads => 'עיבוד חוטים';

  @override
  String get adminResumeSaved => 'הגדרות המשך נשמרו';

  @override
  String get adminResumeLoadFailed => 'טעינת הגדרות קורות החיים נכשלה';

  @override
  String get adminResumeDescription =>
      'הגדר מתי יש לסמן תוכן כמופעל חלקית או מופעל במלואו.';

  @override
  String get adminMinResumePercentage => 'אחוז מינימלי של קורות חיים';

  @override
  String get adminMinResumeSubtitle =>
      'יש להפעיל תוכן מעבר לאחוז הזה כדי לשמור את ההתקדמות';

  @override
  String get adminMaxResumePercentage => 'אחוז קורות חיים מקסימלי';

  @override
  String get adminMaxResumeSubtitle => 'תוכן נחשב למשחק מלא לאחר אחוז זה';

  @override
  String get adminMinResumeDuration => 'משך קורות חיים מינימלי (שניות)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'פריטים קצרים מזה אינם ניתנים לחידוש';

  @override
  String get adminMinAudiobookResume => 'אחוז מינימלי של קורות חיים לספר אודיו';

  @override
  String get adminMaxAudiobookResume => 'אחוז קורות חיים מקסימלי לספרי אודיו';

  @override
  String get adminNetworkingSaved =>
      'הגדרות הרשת נשמרו. ייתכן שתידרש הפעלה מחדש של השרת.';

  @override
  String get adminNetworkingLoadFailed => 'טעינת הגדרות הרשת נכשלה';

  @override
  String get adminNetworkingWarning =>
      'שינויים בהגדרות הרשת עשויים לדרוש הפעלה מחדש של השרת.';

  @override
  String get adminEnableRemoteAccess => 'אפשר גישה מרחוק';

  @override
  String get ports => 'נמלים';

  @override
  String get adminHttpPort => 'יציאת HTTP';

  @override
  String get adminHttpsPort => 'יציאת HTTPS';

  @override
  String get adminPublicHttpsPort => 'יציאת HTTPS ציבורית';

  @override
  String get adminBaseUrl => 'כתובת האתר הבסיסית';

  @override
  String get adminBaseUrlHint => 'למשל /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'הפעל HTTPS';

  @override
  String get adminLocalNetwork => 'רשת מקומית';

  @override
  String get adminLocalNetworkAddresses => 'כתובות רשת מקומיות';

  @override
  String get adminKnownProxies => 'פרוקסי ידועים';

  @override
  String get adminRemoteIpFilter => 'מסנן IP מרחוק';

  @override
  String get adminRemoteIpFilterEntries => 'מסנן IP מרחוק';

  @override
  String get adminCertificatePath => 'נתיב תעודה';

  @override
  String get whitelist => 'רשימת הלבנים';

  @override
  String get blacklist => 'רשימה שחורה';

  @override
  String get notSet => 'לא מוגדר';

  @override
  String get adminMetadataSaved => 'מטא נתונים נשמרו';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'טעינת המטא נתונים נכשלה: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'שמירת המטא נתונים נכשלה: $error';
  }

  @override
  String get adminRefreshMetadata => 'רענן מטא נתונים';

  @override
  String get recursive => 'רקורסיבי';

  @override
  String get adminReplaceAllMetadata => 'החלף את כל המטא נתונים';

  @override
  String get adminReplaceAllImages => 'החלף את כל התמונות';

  @override
  String get adminMetadataRefreshRequested => 'התבקש רענון מטא נתונים';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'רענון המטא נתונים נכשל: $error';
  }

  @override
  String get adminNoRemoteMatches => 'לא נמצאו התאמות מרחוק';

  @override
  String get adminRemoteResults => 'תוצאות מרחוק';

  @override
  String get adminRemoteMetadataApplied => 'הוחלו מטא נתונים מרוחקים';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'החיפוש המרוחק נכשל: $error';
  }

  @override
  String get adminUpdateContentType => 'עדכן את סוג התוכן';

  @override
  String get adminContentType => 'סוג תוכן';

  @override
  String get adminContentTypeUpdated => 'סוג התוכן עודכן';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'עדכון סוג התוכן נכשל: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'טעינת עורך המטא נתונים נכשלה';

  @override
  String get adminNoPeopleEntries => 'אין כניסות של אנשים';

  @override
  String get adminNoExternalIds => 'אין זיהויים חיצוניים זמינים';

  @override
  String adminImageUpdated(String imageType) {
    return 'תמונת $imageType עודכנה';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'הורדת התמונה נכשלה: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'פורמט תמונה לא נתמך';

  @override
  String get adminImageReadFailed => 'קריאת התמונה שנבחרה נכשלה';

  @override
  String adminImageUploaded(String imageType) {
    return 'תמונת $imageType הועלתה';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'העלאת התמונה נכשלה: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'מחק את תמונת $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'תמונת $imageType נמחקה';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'מחיקת התמונה נכשלה: $error';
  }

  @override
  String get adminAllProviders => 'כל הספקים';

  @override
  String get adminNoRemoteImages => 'לא נמצאו תמונות מרוחקות';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'גילוי הטיונר נכשל: $error';
  }

  @override
  String get adminAddTuner => 'הוסף טיונר';

  @override
  String get adminEditTuner => 'ערוך טיונר';

  @override
  String get adminTunerTypeM3u => 'טיונר M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'קובץ או URL';

  @override
  String get adminTunerIpAddress => 'כתובת IP של הטיונר';

  @override
  String get adminTunerFriendlyName => 'שם ידידותי';

  @override
  String get adminTunerUserAgent => 'סוכן משתמש';

  @override
  String get adminTunerCount => 'מגבלת חיבורים בו-זמניים';

  @override
  String get adminTunerCountHelp =>
      'המספר המרבי של זרמים שהטיונר מאפשר בו-זמנית. הגדר 0 ללא הגבלה.';

  @override
  String get adminTunerFallbackBitrate => 'קצב סיביות מרבי חלופי להזרמה';

  @override
  String get adminTunerImportFavoritesOnly => 'ייבא רק ערוצים מועדפים';

  @override
  String get adminTunerAllowHwTranscoding => 'אפשר טרנסקודינג בחומרה';

  @override
  String get adminTunerAllowFmp4 => 'אפשר קונטיינר טרנסקודינג fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'אפשר שיתוף זרמים';

  @override
  String get adminTunerEnableStreamLooping => 'הפעל לולאת זרם';

  @override
  String get adminTunerIgnoreDts => 'התעלם מ-DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'קרא את הקלט בקצב הפריימים המקורי';

  @override
  String get adminEditProvider => 'ערוך ספק';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'קובץ או URL';

  @override
  String get adminXmltvMoviePrefix => 'קידומת סרטים';

  @override
  String get adminXmltvMovieCategories => 'קטגוריות סרטים';

  @override
  String get adminXmltvCategoriesHelp => 'הפרד בין קטגוריות מרובות בקו אנכי.';

  @override
  String get adminXmltvKidsCategories => 'קטגוריות ילדים';

  @override
  String get adminXmltvNewsCategories => 'קטגוריות חדשות';

  @override
  String get adminXmltvSportsCategories => 'קטגוריות ספורט';

  @override
  String get adminSdUsername => 'שם משתמש';

  @override
  String get adminSdPassword => 'סיסמה';

  @override
  String get adminSdCountry => 'מדינה';

  @override
  String get adminSdCountrySelect => 'בחר מדינה';

  @override
  String get adminSdPostalCode => 'מיקוד';

  @override
  String get adminSdGetListings => 'קבל לוחות שידורים';

  @override
  String get adminSdListings => 'לוחות שידורים';

  @override
  String get adminEnableAllTuners => 'הפעל את כל הטיונרים';

  @override
  String get adminTunerType => 'סוג טיונר';

  @override
  String get adminTunerAdded => 'טיונר נוסף';

  @override
  String adminTunerAddFailed(String error) {
    return 'הוספת הטיונר נכשלה: $error';
  }

  @override
  String get adminAddGuideProvider => 'הוסף ספק מדריך';

  @override
  String get adminProviderType => 'סוג ספק';

  @override
  String get adminProviderAdded => 'ספק נוסף';

  @override
  String adminProviderAddFailed(String error) {
    return 'הוספת הספק נכשלה: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'הסרת הטיונר נכשלה: $error';
  }

  @override
  String get adminTunerResetRequested => 'התבקש איפוס טיונר';

  @override
  String adminTunerResetFailed(String error) {
    return 'איפוס הטיונר נכשל: $error';
  }

  @override
  String get adminTunerResetNotSupported => 'סוג טיונר זה אינו תומך באיפוס.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'הסרת הספק נכשלה: $error';
  }

  @override
  String get adminRecordingSettings => 'הגדרות הקלטה';

  @override
  String get adminPrePadding => 'ריפוד מראש (דקות)';

  @override
  String get adminPostPadding => 'לאחר ריפוד (דקות)';

  @override
  String get adminRecordingPath => 'נתיב הקלטה';

  @override
  String get adminSeriesRecordingPath => 'נתיב הקלטת סדרה';

  @override
  String get adminMovieRecordingPath => 'נתיב הקלטת סרטים';

  @override
  String get adminGuideDays => 'ימי נתוני מדריך';

  @override
  String get adminGuideDaysAuto => 'אוטומטי';

  @override
  String adminGuideDaysValue(int days) {
    return '$days ימים';
  }

  @override
  String get adminRecordingPostProcessor => 'נתיב יישום לעיבוד מאוחר';

  @override
  String get adminRecordingPostProcessorArgs => 'ארגומנטים לעיבוד מאוחר';

  @override
  String get adminSaveRecordingNfo => 'שמור מטא נתוני NFO של ההקלטה';

  @override
  String get adminSaveRecordingImages => 'שמור תמונות של ההקלטה';

  @override
  String get adminLiveTvSectionTiming => 'תזמון';

  @override
  String get adminLiveTvSectionPaths => 'נתיבי הקלטה';

  @override
  String get adminLiveTvSectionPostProcessing => 'עיבוד מאוחר';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'נתוני מדריך: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'הגדרות ההקלטה נשמרו';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'שמירת ההגדרות נכשלה: $error';
  }

  @override
  String get adminSetChannelMappings => 'הגדר מיפוי ערוצים';

  @override
  String get adminMappingJson => 'מיפוי JSON';

  @override
  String get adminMappingJsonHint => 'דוגמה: מיפוי מטען JSON';

  @override
  String get adminChannelMappingsUpdated => 'מיפוי הערוצים עודכן';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'עדכון המיפויים נכשל: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'טעינת ניהול הטלוויזיה בשידור חי נכשלה';

  @override
  String get adminTunerDevices => 'התקני טיונר';

  @override
  String get adminNoTunerHosts => 'לא הוגדרו מארחי טיונר';

  @override
  String get adminGuideProviders => 'ספקי מדריכים';

  @override
  String get adminRefreshGuideData => 'רענן את נתוני המדריך';

  @override
  String get adminGuideRefreshStarted => 'רענון נתוני המדריך התחיל';

  @override
  String get adminGuideRefreshUnavailable =>
      'משימת רענון המדריך אינה זמינה בשרת זה.';

  @override
  String get adminAddProvider => 'הוסף ספק';

  @override
  String get adminNoListingProviders => 'לא הוגדרו ספקי רישום';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'נתיב הקלטה: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'נתיב סדרות: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'תוספת לפני: $minutes דק׳';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'תוספת אחרי: $minutes דק׳';
  }

  @override
  String get adminTunerDiscovery => 'טיונר גילוי';

  @override
  String get adminChannelMappings => 'מיפוי ערוצים';

  @override
  String get adminNoDiscoveredTuners => 'עדיין לא התגלו מקלטים';

  @override
  String get adminSettingsSaved => 'ההגדרות נשמרו';

  @override
  String get adminBackupsNotAvailable => 'גיבויים אינם זמינים בבניית שרת זה.';

  @override
  String get adminRestoreWarning1 =>
      'השחזור יחליף את כל נתוני השרת הנוכחיים בנתוני הגיבוי.';

  @override
  String get adminRestoreWarning2 =>
      'הגדרות השרת הנוכחיות, המשתמשים ונתוני הספרייה יוחלפו.';

  @override
  String get adminRestoreWarning3 => 'השרת יופעל מחדש לאחר השחזור.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'לשחזר את הגיבוי $name עכשיו?';
  }

  @override
  String get adminRestoreRequested =>
      'התבקש שחזור. הפעלה מחדש של השרת עלולה לנתק את ההפעלה הזו.';

  @override
  String get adminBackupsTitle => 'גיבויים';

  @override
  String get adminUnknownDate => 'תאריך לא ידוע';

  @override
  String get adminUnnamedBackup => 'ללא שם גיבוי';

  @override
  String get adminLiveTvNotAvailable =>
      'ניהול טלוויזיה בשידור חי אינו זמין בבניית שרת זה.';

  @override
  String get adminLiveTvTitle => 'מנהלת טלוויזיה בשידור חי';

  @override
  String get adminApply => 'החל';

  @override
  String get adminNotSet => 'לא מוגדר';

  @override
  String get adminReset => 'איפוס';

  @override
  String get adminLogsTitle => 'יומני שרת';

  @override
  String get adminLogsNewestFirst => 'הכי חדש ראשון';

  @override
  String get adminLogsOldestFirst => 'הישן ביותר ראשון';

  @override
  String get adminLogsJustNow => 'זֶה עַתָה';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'לפני $minutes דק׳';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'לפני $hours שע׳';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'לפני $days ימים';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'טעינת $fileName נכשלה';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count התאמות';
  }

  @override
  String get adminLogViewerNoMatches => 'אין קווים תואמים';

  @override
  String get adminMetadataEditorTitle => 'עורך מטא נתונים';

  @override
  String get adminMetadataIdentify => 'זהה';

  @override
  String get adminMetadataType => 'סוּג';

  @override
  String get adminMetadataDetails => 'פרטים';

  @override
  String get adminMetadataExternalIds => 'תעודות זהות חיצוניות';

  @override
  String get adminMetadataImages => 'תמונות';

  @override
  String get adminMetadataFieldTitle => 'כותרת';

  @override
  String get adminMetadataFieldSortTitle => 'מיון כותרת';

  @override
  String get adminMetadataFieldOriginalTitle => 'כותרת מקורית';

  @override
  String get adminMetadataFieldPremiereDate => 'תאריך בכורה (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'תאריך סיום (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'שנת ייצור';

  @override
  String get adminMetadataFieldOfficialRating => 'דירוג רשמי';

  @override
  String get adminMetadataFieldCommunityRating => 'דירוג קהילה';

  @override
  String get adminMetadataFieldCriticRating => 'דירוג מבקר';

  @override
  String get adminMetadataFieldTagline => 'קו תג';

  @override
  String get adminMetadataFieldOverview => 'סקירה כללית';

  @override
  String get adminMetadataGenres => 'ז\'אנרים';

  @override
  String get adminMetadataTags => 'תגים';

  @override
  String get adminMetadataStudios => 'אולפנים';

  @override
  String get adminMetadataPeople => 'אֲנָשִׁים';

  @override
  String get adminMetadataAddGenre => 'הוסף ז\'אנר';

  @override
  String get adminMetadataAddTag => 'הוסף תג';

  @override
  String get adminMetadataAddStudio => 'הוסף סטודיו';

  @override
  String get adminMetadataAddPerson => 'הוסף אדם';

  @override
  String get adminMetadataEditPerson => 'ערוך אדם';

  @override
  String get adminMetadataRole => 'תַפְקִיד';

  @override
  String get adminMetadataImagePrimary => 'יְסוֹדִי';

  @override
  String get adminMetadataImageBackdrop => 'רקע';

  @override
  String get adminMetadataImageLogo => 'סֵמֶל';

  @override
  String get adminMetadataImageBanner => 'דֶגֶל';

  @override
  String get adminMetadataImageThumb => 'אֲגוּדָל';

  @override
  String get adminMetadataRecursive => 'רקורסיבי';

  @override
  String get adminMetadataProvider => 'ספק';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'תמונת $imageType עודכנה';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'תמונת $imageType הועלתה';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'תמונת $imageType נמחקה';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'הורדת התמונה נכשלה: $error';
  }

  @override
  String get adminMetadataImageReadFailed => 'קריאת התמונה שנבחרה נכשלה';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'העלאת התמונה נכשלה: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'מחק את תמונת $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'זה מסיר את התמונה הנוכחית מהפריט.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'מחיקת התמונה נכשלה: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'בחר תמונת $imageType';
  }

  @override
  String get adminMetadataUpload => 'העלה';

  @override
  String get adminMetadataUpdate => 'לְעַדְכֵּן';

  @override
  String get adminMetadataRemoteImage => 'תמונה מרחוק';

  @override
  String get adminPluginsInstalled => 'מוּתקָן';

  @override
  String get adminPluginsCatalog => 'קָטָלוֹג';

  @override
  String get adminPluginsActive => 'פָּעִיל';

  @override
  String get adminPluginsRestart => 'הפעל מחדש';

  @override
  String get adminPluginsNoSearchResults => 'אין תוספים שתואמים לחיפוש שלך';

  @override
  String get adminPluginsNoneInstalled => 'לא מותקנים תוספים';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'עדכון זמין: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'עדכון זמין';

  @override
  String get adminPluginsPendingRemoval => 'ממתין להסרה לאחר הפעלה מחדש';

  @override
  String get adminPluginsChangesPending => 'שינויים ממתינים להפעלה מחדש';

  @override
  String get adminPluginsEnable => 'לְאַפשֵׁר';

  @override
  String get adminPluginsDisable => 'השבת';

  @override
  String get adminPluginsInstallUpdate => 'התקן עדכון';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'התקן עדכון (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'אין חבילות שתואמות את החיפוש שלך';

  @override
  String get adminPluginsCatalogEmpty => 'אין חבילות זמינות';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" בהתקנה...';
  }

  @override
  String get adminPluginDetailExperimental => 'אינטגרציה נסיונית';

  @override
  String get adminPluginDetailExperimentalContent =>
      'שילוב הגדרות הפלאגין עדיין ניסיוני. ייתכן שחלק מהשדות או הפריסות עדיין לא יוצגו כראוי.';

  @override
  String get adminPluginDetailToggle404 =>
      'החלפת הפלאגין נכשלה. השרת לא הצליח למצוא את גרסת הפלאגין הזו. נסה לרענן תוספים ולאחר מכן נסה שוב.';

  @override
  String get adminPluginDetailToggleDioError =>
      'החלפת הפלאגין נכשלה. אנא בדוק את יומני השרת לפרטים.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'הגדרות $name';
  }

  @override
  String get adminPluginDetailDetails => 'פרטים';

  @override
  String get adminPluginDetailDeveloper => 'מפתח';

  @override
  String get adminPluginDetailRepository => 'מאגר';

  @override
  String get adminPluginDetailBundled => 'צרור';

  @override
  String get adminPluginDetailEnablePlugin => 'אפשר פלאגין';

  @override
  String get adminPluginDetailRestartRequired =>
      'נדרשת הפעלה מחדש של השרת כדי שהשינויים ייכנסו לתוקף.';

  @override
  String get adminPluginDetailRemovalPending =>
      'תוסף זה יוסר לאחר הפעלה מחדש של השרת.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'תוסף זה לא תקין וייתכן שלא יפעל כראוי.';

  @override
  String get adminPluginDetailNotSupported =>
      'תוסף זה אינו נתמך על ידי גרסת השרת הנוכחית.';

  @override
  String get adminPluginDetailSuperseded =>
      'תוסף זה הוחלף על ידי גרסה חדשה יותר.';

  @override
  String adminReposLoadFailed(String error) {
    return 'טעינת המאגרים נכשלה: $error';
  }

  @override
  String get adminReposRemoveTitle => 'הסר מאגר';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'האם להסיר את \"$name\"?';
  }

  @override
  String get adminReposRemove => 'הסר';

  @override
  String adminReposSaveFailed(String error) {
    return 'שמירת המאגרים נכשלה: $error';
  }

  @override
  String get adminReposEmpty => 'לא מוגדרים מאגרים';

  @override
  String get adminReposEmptySubtitle => 'הוסף מאגר כדי לעיין בתוספים זמינים';

  @override
  String get adminReposUnnamed => '(ללא שם)';

  @override
  String get adminReposEditTitle => 'ערוך מאגר';

  @override
  String get adminReposAddTitle => 'הוסף מאגר';

  @override
  String get adminReposUrl => 'כתובת האתר של מאגר';

  @override
  String get adminReposNameHint => 'לְמָשָׁל Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'כתובת אתר לא חוקית';

  @override
  String get adminGeneralSettingsTitle => 'הגדרות כלליות';

  @override
  String get adminGeneralMetadataLanguage => 'שפת מטא נתונים מועדפת';

  @override
  String get adminGeneralMetadataLanguageHint => 'לְמָשָׁל en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'ארץ מטא נתונים מועדפת';

  @override
  String get adminGeneralMetadataCountryHint => 'לְמָשָׁל ארה\"ב, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'סריקת ספרייה במקביל';

  @override
  String get adminGeneralImageEncodingLimit => 'מגבלת קידוד תמונה מקבילה';

  @override
  String get adminUnknownError => 'שגיאה לא ידועה';

  @override
  String get adminBrowse => 'לְדַפדֵף';

  @override
  String get adminCloseBrowser => 'סגור את הדפדפן';

  @override
  String get adminNetworkingTitle => 'רשת';

  @override
  String get adminNetworkingRestartWarning =>
      'שינויים בהגדרות הרשת עשויים לדרוש הפעלה מחדש של השרת.';

  @override
  String get adminNetworkingRemoteAccess => 'אפשר גישה מרחוק';

  @override
  String get adminNetworkingPorts => 'נמלים';

  @override
  String get adminNetworkingHttpPort => 'יציאת HTTP';

  @override
  String get adminNetworkingHttpsPort => 'יציאת HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'הפעל HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'רשת מקומית';

  @override
  String get adminNetworkingLocalAddresses => 'כתובות רשת מקומיות';

  @override
  String get adminNetworkingAddressHint => 'לְמָשָׁל 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'פרוקסי ידועים';

  @override
  String get adminNetworkingProxyHint => 'לְמָשָׁל 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'רשימת הלבנים';

  @override
  String get adminNetworkingBlacklist => 'רשימה שחורה';

  @override
  String get adminNetworkingAddEntry => 'הוסף ערך';

  @override
  String get adminBrandingTitle => 'מיתוג';

  @override
  String get adminBrandingLoginDisclaimer => 'כתב ויתור על כניסה';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML מוצג מתחת לטופס ההתחברות';

  @override
  String get adminBrandingCustomCss => 'CSS מותאם אישית';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS מותאם אישית הוחל על ממשק האינטרנט';

  @override
  String get adminBrandingEnableSplash => 'אפשר מסך פתיחה';

  @override
  String get adminBrandingSplashUpload => 'העלה תמונה';

  @override
  String get adminBrandingSplashUploaded => 'מסך הפתיחה עודכן';

  @override
  String get adminBrandingSplashUploadFailed => 'העלאת מסך הפתיחה נכשלה';

  @override
  String get adminBrandingSplashDeleted => 'מסך הפתיחה הוסר';

  @override
  String get adminBrandingNoSplash => 'אין מסך פתיחה מותאם אישית';

  @override
  String get adminPlaybackHwAccel => 'האצת חומרה';

  @override
  String get adminPlaybackHwAccelLabel => 'האצת חומרה';

  @override
  String get adminPlaybackEnableHwEncoding => 'אפשר קידוד חומרה';

  @override
  String get adminPlaybackEnableHwDecoding => 'אפשר פענוח חומרה עבור:';

  @override
  String get adminPlaybackQsvDevice => 'התקן QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'הפעל מפענח NVDEC משופר';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'העדף מפענח חומרה מובנה של המערכת';

  @override
  String get adminPlaybackColorDepth => 'עומק צבע בפענוח חומרה';

  @override
  String get adminPlaybackColorDepth10Hevc => 'פענוח HEVC ב-10 סיביות';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'פענוח VP9 ב-10 סיביות';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'פענוח HEVC RExt ב-8/10 סיביות';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'פענוח HEVC RExt ב-12 סיביות';

  @override
  String get adminPlaybackHwEncodingSection => 'קידוד בחומרה';

  @override
  String get adminPlaybackAllowHevcEncoding => 'אפשר קידוד HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'אפשר קידוד AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'הפעל מקודד H.264 חסכוני של Intel';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'הפעל מקודד HEVC חסכוני של Intel';

  @override
  String get adminPlaybackToneMapping => 'מיפוי גוונים';

  @override
  String get adminPlaybackEnableTonemapping => 'הפעל מיפוי גוונים';

  @override
  String get adminPlaybackEnableVppTonemapping => 'הפעל מיפוי גוונים VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'הפעל מיפוי גוונים VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'אלגוריתם מיפוי גוונים';

  @override
  String get adminPlaybackTonemappingMode => 'מצב מיפוי גוונים';

  @override
  String get adminPlaybackTonemappingRange => 'טווח מיפוי גוונים';

  @override
  String get adminPlaybackTonemappingDesat => 'הפחתת רוויה במיפוי גוונים';

  @override
  String get adminPlaybackTonemappingPeak => 'שיא מיפוי גוונים';

  @override
  String get adminPlaybackTonemappingParam => 'פרמטר מיפוי גוונים';

  @override
  String get adminPlaybackVppTonemappingBrightness => 'בהירות מיפוי גוונים VPP';

  @override
  String get adminPlaybackVppTonemappingContrast => 'ניגודיות מיפוי גוונים VPP';

  @override
  String get adminPlaybackPresetsQuality => 'הגדרות מראש ואיכות';

  @override
  String get adminPlaybackEncoderPreset => 'הגדרה מראש של המקודד';

  @override
  String get adminPlaybackH264Crf => 'CRF לקידוד H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF לקידוד H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'שיטת ביטול שזירה';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'הכפל את קצב הפריימים בעת ביטול שזירה';

  @override
  String get adminPlaybackAudioSection => 'שמע';

  @override
  String get adminPlaybackEnableAudioVbr => 'הפעל קידוד שמע VBR';

  @override
  String get adminPlaybackDownmixBoost => 'הגברת דאונמיקס שמע';

  @override
  String get adminPlaybackDownmixAlgorithm => 'אלגוריתם דאונמיקס לסטריאו';

  @override
  String get adminPlaybackMaxMuxingQueue => 'גודל מרבי של תור ה-muxing';

  @override
  String get adminPlaybackAutoOption => 'אוטומטי';

  @override
  String get adminPlaybackEncoding => 'הַצפָּנָה';

  @override
  String get adminPlaybackEncodingThreads => 'שרשורי קידוד';

  @override
  String get adminPlaybackFallbackFont => 'אפשר גופן חלופי';

  @override
  String get adminPlaybackFallbackFontPath => 'נתיב גופן חלופי';

  @override
  String get adminPlaybackStreaming => 'נְהִירָה';

  @override
  String get adminResumeVideo => 'וִידֵאוֹ';

  @override
  String get adminResumeAudiobooks => 'ספרי שמע';

  @override
  String get adminResumeMinAudiobookPct =>
      'אחוז מינימלי של קורות חיים לספר אודיו';

  @override
  String get adminResumeMaxAudiobookPct =>
      'אחוז קורות חיים מקסימלי לספרי אודיו';

  @override
  String get adminStreamingBitrateLimit =>
      'מגבלת קצב סיביות של לקוח מרוחק (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'השאר ריק או 0 ללא הגבלה';

  @override
  String get adminTrickplayHwAccel => 'אפשר האצת חומרה';

  @override
  String get adminTrickplayHwEncoding => 'אפשר קידוד חומרה';

  @override
  String get adminTrickplayKeyFrameOnly => 'אפשר חילוץ של מסגרת מפתח בלבד';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'מהיר יותר אך דיוק נמוך יותר';

  @override
  String get adminTrickplayNonBlocking => 'ללא חסימה';

  @override
  String get adminTrickplayBlocking => 'חסימה';

  @override
  String get adminTrickplayPriorityHigh => 'גָבוֹהַ';

  @override
  String get adminTrickplayPriorityAboveNormal => 'מעל הרגיל';

  @override
  String get adminTrickplayPriorityNormal => 'נוֹרמָלִי';

  @override
  String get adminTrickplayPriorityBelowNormal => 'מתחת לנורמה';

  @override
  String get adminTrickplayPriorityIdle => 'לְהִתְבַּטֵל';

  @override
  String get adminTrickplayImageSettings => 'הגדרות תמונה';

  @override
  String get adminTrickplayInterval => 'מרווח (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'באיזו תדירות ללכוד פריימים';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'רוחב פיקסלים מופרדים בפסיקים (למשל 320)';

  @override
  String get adminTrickplayQuality => 'אֵיכוּת';

  @override
  String get adminTrickplayQScale => 'סולם איכות';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'ערכים נמוכים יותר = איכות טובה יותר, קבצים גדולים יותר';

  @override
  String get adminTrickplayJpegQuality => 'איכות JPEG';

  @override
  String get adminTrickplayProcessing => 'עיבוד';

  @override
  String get adminTasksEmpty => 'לא נמצאו משימות מתוזמנות';

  @override
  String get adminTasksNoFilterMatch => 'אין משימות שתואמות למסנן הנוכחי';

  @override
  String get adminTaskCancelling => 'מבטל...';

  @override
  String get adminTaskRunning => 'רִיצָה...';

  @override
  String get adminTaskNeverRun => 'לעולם אל תברח';

  @override
  String get adminTaskStop => 'עצור';

  @override
  String get adminRunningTasks => 'משימות פעילות';

  @override
  String get adminTaskRun => 'לָרוּץ';

  @override
  String get adminTaskDetailLastExecution => 'ביצוע אחרון';

  @override
  String get adminTaskDetailStarted => 'התחיל';

  @override
  String get adminTaskDetailEnded => 'הסתיים';

  @override
  String get adminTaskDetailDuration => 'מֶשֶׁך';

  @override
  String get adminTaskDetailErrorLabel => 'שְׁגִיאָה:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'מדי יום בשעה $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'כל $day בשעה $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'כל $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'בעת הפעלת האפליקציה';

  @override
  String get adminTaskTriggerTypeDaily => 'יוֹמִי';

  @override
  String get adminTaskTriggerTypeWeekly => 'שְׁבוּעִי';

  @override
  String get adminTaskTriggerTypeInterval => 'במרווח';

  @override
  String get adminTaskTriggerIntervalLabel => 'הַפסָקָה';

  @override
  String get adminTaskTriggerEveryHour => 'כל שעה';

  @override
  String get adminTaskTriggerEvery6Hours => 'כל 6 שעות';

  @override
  String get adminTaskTriggerEvery12Hours => 'כל 12 שעות';

  @override
  String get adminTaskTriggerEvery24Hours => 'כל 24 שעות';

  @override
  String get adminTaskTriggerEvery2Days => 'כל יומיים';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count שעות',
      two: 'שעתיים',
      one: 'שעה אחת',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'זְמַן';

  @override
  String get adminTaskTriggerNoLimit => 'אין הגבלה';

  @override
  String get adminActivityJustNow => 'זֶה עַתָה';

  @override
  String get adminActivityLastHour => 'שעה אחרונה';

  @override
  String get adminActivityToday => 'הַיוֹם';

  @override
  String get adminActivityYesterday => 'אֶתמוֹל';

  @override
  String get adminActivityOlder => 'ישן יותר';

  @override
  String adminActivityDaysAgo(int days) {
    return 'לפני $days ימים';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'לפני $hours שע׳';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'לפני $minutes דק׳';
  }

  @override
  String get adminActivityNow => 'עַכשָׁיו';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes דק׳';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours שע׳';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days ימים';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'הגדר יצירת תמונות Trickplay לתמונות ממוזערות של תצוגה מקדימה בחיפוש.';

  @override
  String get adminNetworkingPublicHttpsPort => 'יציאת HTTPS ציבורית';

  @override
  String get adminNetworkingBaseUrl => 'כתובת האתר הבסיסית';

  @override
  String get adminNetworkingBaseUrlHint => 'למשל /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'יציאת HTTP ציבורית';

  @override
  String get adminNetworkingRequireHttps => 'דרוש HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'הפנה את כל הבקשות המרוחקות ל-HTTPS. אין לכך השפעה אם לשרת אין תעודה תקפה.';

  @override
  String get adminNetworkingCertPassword => 'סיסמת התעודה';

  @override
  String get adminNetworkingIpSettings => 'הגדרות IP';

  @override
  String get adminNetworkingEnableIpv4 => 'הפעל IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'הפעל IPv6';

  @override
  String get adminNetworkingAutoDiscovery => 'הפעל מיפוי יציאות אוטומטי';

  @override
  String get adminNetworkingLocalSubnets => 'רשתות LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'רשימה של כתובות IP או תת-רשתות CIDR, מופרדות בפסיקים או בשורות, שייחשבו כחלק מהרשת המקומית.';

  @override
  String get adminNetworkingPublishedUris => 'כתובות URI מפורסמות של השרת';

  @override
  String get adminNetworkingPublishedUriHint =>
      'מפה תת-רשת או כתובת לכתובת URL מפורסמת, למשל all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'נתיב תעודה';

  @override
  String get adminNetworkingRemoteIpFilter => 'מסנן IP מרחוק';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'מסנן IP מרחוק';

  @override
  String get adminPlaybackVaapiDevice => 'מכשיר VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = אוטומטי';

  @override
  String get adminPlaybackTranscodeTempPath => 'המרת נתיב טמפ\'';

  @override
  String get adminPlaybackSegmentDeletion => 'אפשר מחיקת קטע';

  @override
  String get adminPlaybackSegmentKeep => 'שמירה על פלח (שניות)';

  @override
  String get adminPlaybackThrottleBuffering => 'חציצה של מצערת';

  @override
  String get adminPlaybackThrottleDelay => 'השהיית ויסות (שניות)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'אפשר חילוץ כתוביות בזמן אמת';

  @override
  String get adminResumeMinPct => 'אחוז מינימלי של קורות חיים';

  @override
  String get adminResumeMinPctSubtitle =>
      'יש להפעיל תוכן מעבר לאחוז הזה כדי לשמור את ההתקדמות';

  @override
  String get adminResumeMaxPct => 'אחוז קורות חיים מקסימלי';

  @override
  String get adminResumeMaxPctSubtitle => 'תוכן נחשב למשחק מלא לאחר אחוז זה';

  @override
  String get adminResumeMinDuration => 'משך קורות חיים מינימלי (שניות)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'פריטים קצרים מזה אינם ניתנים לחידוש';

  @override
  String get adminTrickplayScanBehavior => 'התנהגות סריקה';

  @override
  String get adminTrickplayProcessPriority => 'עדיפות תהליך';

  @override
  String get adminTrickplayTileWidth => 'רוחב אריחים';

  @override
  String get adminTrickplayTileHeight => 'גובה אריחים';

  @override
  String get adminTrickplayProcessThreads => 'עיבוד חוטים';

  @override
  String get adminTrickplayWidthResolutions => 'רזולוציות רוחב';

  @override
  String get adminMetadataDefault => 'בְּרִירַת מֶחדָל';

  @override
  String get adminMetadataContentTypeUpdated => 'סוג התוכן עודכן';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'עדכון סוג התוכן נכשל: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'סף תגובה איטית (ms)';

  @override
  String get adminGeneralEnableSlowResponse => 'הפעל אזהרות על תגובה איטית';

  @override
  String get adminGeneralQuickConnect => 'הפעל את Quick Connect';

  @override
  String get adminGeneralSectionServer => 'שרת';

  @override
  String get adminGeneralSectionMetadata => 'מטא נתונים';

  @override
  String get adminGeneralSectionPaths => 'נתיבים';

  @override
  String get adminGeneralSectionPerformance => 'ביצועים';

  @override
  String get adminGeneralCachePath => 'נתיב מטמון';

  @override
  String get adminGeneralMetadataPath => 'נתיב מטא נתונים';

  @override
  String get adminGeneralServerName => 'שם השרת';

  @override
  String get adminGeneralDisplayLanguage => 'שפת תצוגה מועדפת';

  @override
  String get adminSettingsLoadFailed => 'טעינת ההגדרות נכשלה';

  @override
  String get adminDiscover => 'לְגַלוֹת';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'עדכון המיפויים נכשל: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'מגבלת זמן: $duration';
  }

  @override
  String get folders => 'תיקיות';

  @override
  String get libraries => 'ספריות';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay מושבת';

  @override
  String get syncPlayDisabledMessage =>
      'אפשר את SyncPlay בהגדרות כדי להשתמש בהפעלה מסונכרנת.';

  @override
  String get syncPlayServerUnsupportedTitle => 'השרת אינו נתמך';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay דורש שרת Jellyfin. השרת הנוכחי אינו תומך בו.';

  @override
  String get syncPlayGroupFallbackName => 'קבוצת SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'קבוצת SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# משתתפים',
      two: '# משתתפים',
      one: '# משתתף',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'התעלם לחכות';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'אל תחזיק את הקבוצה למעלה בזמן שהמכשיר הזה מאחסן';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'המשך באופן מקומי מבלי לחכות לחברים איטיים';

  @override
  String get syncPlayRepeat => 'לַחֲזוֹר עַל';

  @override
  String get syncPlayRepeatOne => 'אֶחָד';

  @override
  String get syncPlayShuffleModeShuffled => 'ערבב';

  @override
  String get syncPlayShuffleModeSorted => 'מְמוּיָן';

  @override
  String get syncPlaySyncCurrentQueue => 'סנכרן את תור ההשמעה הנוכחי';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'החלף את התור הקבוצתי במה שמתנגן במקום';

  @override
  String get syncPlayLeaveGroup => 'עזוב את הקבוצה';

  @override
  String get syncPlayGroupQueue => 'תור לקבוצות';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'פריט $index';
  }

  @override
  String get syncPlayPlayNow => 'שחק עכשיו';

  @override
  String get syncPlayCreateNewGroup => 'צור קבוצה חדשה';

  @override
  String get syncPlayGroupName => 'שם הקבוצה';

  @override
  String get syncPlayDefaultGroupName => 'קבוצת SyncPlay שלי';

  @override
  String get syncPlayCreateGroup => 'צור קבוצה';

  @override
  String get syncPlayAvailableGroups => 'קבוצות זמינות';

  @override
  String get syncPlayNoGroupsAvailable => 'אין קבוצות זמינות';

  @override
  String get syncPlayJoinGroupQuestion => 'להצטרף לקבוצת SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'הצטרפות לקבוצת SyncPlay עשויה להחליף את תור ההשמעה הנוכחי שלך. לְהַמשִׁיך?';

  @override
  String get syncPlayJoin => 'לְהִצְטַרֵף';

  @override
  String get syncPlayStateIdle => 'לְהִתְבַּטֵל';

  @override
  String get syncPlayStateWaiting => 'הַמתָנָה';

  @override
  String get syncPlayStatePaused => 'מושהה';

  @override
  String get syncPlayStatePlaying => 'משחק';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName הצטרף לקבוצת SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName עזב את קבוצת SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'גישת SyncPlay נדחתה';

  @override
  String get syncPlayAccessDeniedMessage =>
      'אין לך גישה לפריט אחד או יותר בקבוצת SyncPlay זו. בקש מבעל הקבוצה לאמת את הרשאות הספרייה או לבחור תור אחר.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'מסנכרן את ההפעלה עם $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'חיפוש קולי אינו זמין.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'הפעלה ישירה של Dolby Vision נכשלה';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'הפעלה ישירה נכשלה עבור זרם Dolby Vision זה. לנסות שוב להשתמש בטרנסקוד השרת?';

  @override
  String get retryWithTranscode => 'נסה שוב עם ההמרה';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision לא נתמך';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'מכשיר זה אינו יכול לפענח תוכן Dolby Vision ישירות. השתמש ב-HDR10 fallback או בקש המרת קידוד שרת.';

  @override
  String get rememberMyChoice => 'זכור את הבחירה שלי';

  @override
  String get playHdr10Fallback => 'הפעל HDR10 חזרה';

  @override
  String get requestTranscode => 'בקש טרנסקוד';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# שורות התגלו',
      two: '# שורות התגלו',
      one: '# שורה התגלתה',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'ראה הכל';

  @override
  String get noItems => 'אין פריטים';

  @override
  String get switchUser => 'החלף משתמש';

  @override
  String get remoteControl => 'שְׁלַט רָחוֹק';

  @override
  String get mediaBarLoading => 'טוען סרגל מדיה...';

  @override
  String get mediaBarError => 'טעינת סרגל המדיה נכשלה';

  @override
  String get offlineServerUnavailable =>
      'מחובר לאינטרנט, אך השרת הנוכחי אינו זמין.';

  @override
  String get offlineNoInternet => 'אתה במצב לא מקוון. רק תוכן שהורד זמין.';

  @override
  String get offlineFileNotAvailable => 'הקובץ אינו זמין';

  @override
  String get offlineSwitchServer => 'החלף שרת';

  @override
  String get offlineSavedMedia => 'מדיה שמורה';

  @override
  String get offlineBannerTitle => 'אתה במצב לא מקוון';

  @override
  String get offlineBannerSubtitle => 'מוצגות ההורדות שלך';

  @override
  String get offlineBannerAction => 'הורדות';

  @override
  String get serverUnreachableBannerTitle => 'לא ניתן להגיע לשרת שלך';

  @override
  String get serverUnreachableBannerSubtitle => 'מפעיל מההורדות עד שיחזור';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'השמעה מרחוק';

  @override
  String castControlFailed(String error) {
    return 'בקרת Cast נכשלה: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'בקרות $kind';
  }

  @override
  String get castDeviceVolume => 'עוצמת הקול של המכשיר';

  @override
  String get castVolumeUnavailable => 'לא זמין';

  @override
  String castStopKind(String kind) {
    return 'עצור $kind';
  }

  @override
  String get audioLabel => 'שֶׁמַע';

  @override
  String get subtitlesLabel => 'כתוביות';

  @override
  String get pinConfirmTitle => 'אשר את ה-PIN';

  @override
  String get pinSetTitle => 'הגדר PIN';

  @override
  String get pinEnterTitle => 'הזן PIN';

  @override
  String get pinReenterToConfirm => 'הזן מחדש את ה-PIN שלך כדי לאשר';

  @override
  String pinEnterNDigit(int length) {
    return 'הזן PIN בן $length ספרות';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'הזן את ה-PIN בן $length הספרות שלך';
  }

  @override
  String get pinIncorrect => 'PIN שגוי';

  @override
  String get pinMismatch => 'מספרי ה-PIN אינם תואמים';

  @override
  String get pinForgot => 'שכחת PIN?';

  @override
  String get pinClear => 'נקה';

  @override
  String get pinBackspace => 'מחיקה לאחור';

  @override
  String get quickConnectAuthorized => 'בקשת Quick Connect אושרה.';

  @override
  String get quickConnectInvalidOrExpired =>
      'קוד Quick Connect אינו חוקי או שפג תוקפו.';

  @override
  String get quickConnectNotSupported => 'Quick Connect אינו נתמך בשרת זה.';

  @override
  String get quickConnectAuthorizeFailed => 'אישור קוד Quick Connect נכשל.';

  @override
  String get quickConnectDisabled => 'Quick Connect מושבת בשרת זה.';

  @override
  String get quickConnectForbidden =>
      'החשבון שלך אינו יכול לאשר בקשת Quick Connect זו.';

  @override
  String get quickConnectNotFound => 'קוד Quick Connect לא נמצא. נסה קוד חדש.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect נכשל: $message';
  }

  @override
  String get quickConnectEnterCode => 'הזן קוד';

  @override
  String get quickConnectAuthorize => 'לְאַשֵׁר';

  @override
  String remoteCommandFailed(String error) {
    return 'הפקודה נכשלה: $error';
  }

  @override
  String get remoteControlTitle => 'שְׁלַט רָחוֹק';

  @override
  String get remoteFailedToLoadSessions => 'טעינת ההפעלות נכשלה';

  @override
  String get remoteNoSessions => 'אין הפעלות ניתנות לשליטה';

  @override
  String get remoteStartPlayback => 'התחל הפעלה במכשיר אחר';

  @override
  String get unknownUser => 'לֹא יְדוּעַ';

  @override
  String get unknownItem => 'לֹא יְדוּעַ';

  @override
  String get remoteNothingPlaying => 'שום דבר לא מתנגן בסשן הזה';

  @override
  String get castingStarted => 'ההעברה החלה במכשיר שנבחר';

  @override
  String castingFailed(String error) {
    return 'התחלת ה-Cast נכשלה: $error';
  }

  @override
  String get noRemoteDevices => 'אין התקני השמעה מרחוק זמינים.';

  @override
  String get noRemoteDevicesIos =>
      'אין התקני השמעה מרחוק זמינים.\n\nב-iOS, יעדי AirPlay עשויים להיות לא זמינים בסימולטור.';

  @override
  String get trackActionPlayNext => 'שחק הבא';

  @override
  String get trackActionAddToQueue => 'הוסף לתור';

  @override
  String get trackActionAddToPlaylist => 'הוסף לפלייליסט';

  @override
  String get trackActionCancelDownload => 'בטל הורדה';

  @override
  String get trackActionDeleteFromPlaylist => 'מחק מרשימת ההשמעה';

  @override
  String get trackActionMoveUp => 'לזוז למעלה';

  @override
  String get trackActionMoveDown => 'לזוז למטה';

  @override
  String get trackActionRemoveFromFavorites => 'הסר מהמועדפים';

  @override
  String get trackActionAddToFavorites => 'הוסף למועדפים';

  @override
  String get trackActionGoToAlbum => 'עבור לאלבום';

  @override
  String get trackActionGoToArtist => 'עבור אל אמן';

  @override
  String trackActionDownloading(String name) {
    return 'מוריד את $name...';
  }

  @override
  String get trackActionDeletedFile => 'נמחק קובץ שהורד';

  @override
  String get trackActionDeleteFileFailed => 'לא ניתן למחוק את הקובץ שהורד';

  @override
  String get shuffleBy => 'ערבב לפי';

  @override
  String get shuffleSelectLibrary => 'בחר ספרייה';

  @override
  String get shuffleSelectGenre => 'בחר ז\'אנר';

  @override
  String get shuffleLibrary => 'ספרייה';

  @override
  String get shuffleGenre => 'ז\'ָאנר';

  @override
  String get shuffleNoLibraries => 'אין ספריות תואמות זמינות.';

  @override
  String get shuffleNoGenres => 'לא נמצאו ז\'אנרים עבור מצב ערבוב זה.';

  @override
  String get posterDisplayTitle => 'לְהַצִיג';

  @override
  String get posterImageType => 'סוג תמונה';

  @override
  String get imageTypePoster => 'פּוֹסטֵר';

  @override
  String get imageTypeThumbnail => 'תמונה ממוזערת';

  @override
  String get imageTypeBanner => 'דֶגֶל';

  @override
  String get playlistAddFailed => 'ההוספה לפלייליסט נכשלה';

  @override
  String get playlistCreateFailed => 'יצירת רשימת השמעה נכשלה';

  @override
  String get playlistNew => 'רשימת השמעה חדשה';

  @override
  String get playlistCreate => 'לִיצוֹר';

  @override
  String get playlistCreateNew => 'צור רשימת השמעה חדשה';

  @override
  String get playlistNoneFound => 'לא נמצאו רשימות השמעה';

  @override
  String get addToPlaylist => 'הוסף לפלייליסט';

  @override
  String get lyricsNotAvailable => 'אין מילים זמינות';

  @override
  String get upNext => 'למעלה הבא';

  @override
  String get playNext => 'שחק הבא';

  @override
  String get stillWatchingContent => 'ההשמעה הושהתה. אתה עדיין צופה?';

  @override
  String get stillWatchingStop => 'עצור';

  @override
  String get stillWatchingContinue => 'לְהַמשִׁיך';

  @override
  String skipSegment(String segment) {
    return 'דלג על $segment';
  }

  @override
  String get liveTv => 'טלוויזיה בשידור חי';

  @override
  String get continueWatchingAndNextUp => 'המשך בצפייה ובהמשך';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'מוריד $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'מוריד את $fileName';
  }

  @override
  String get nextEpisode => 'הפרק הבא';

  @override
  String get moreFromThisSeason => 'עוד מהעונה הזו';

  @override
  String get playerTooltipPlaybackSpeed => 'מהירות השמעה';

  @override
  String get playerTooltipCastControls => 'בקרות שחקנים';

  @override
  String get playerTooltipPlaybackQuality => 'קצב סיביות';

  @override
  String get playerTooltipEnterFullscreen => 'היכנס למסך מלא';

  @override
  String get playerTooltipExitFullscreen => 'צא ממסך מלא';

  @override
  String get playerTooltipFloatOnTop => 'צף למעלה';

  @override
  String get playerTooltipExitFloatOnTop => 'השבת את הציפה למעלה';

  @override
  String get playerTooltipLockLandscape => 'מנעול נוף';

  @override
  String get playerTooltipUnlockOrientation => 'אפשר סיבוב';

  @override
  String get playerTooltipPrevious => 'הקודם';

  @override
  String get playerTooltipSeekBack => 'חפש בחזרה';

  @override
  String get playerTooltipSeekForward => 'חפש קדימה';

  @override
  String get contextMenuMarkWatched => 'סמן כנצפית';

  @override
  String get contextMenuMarkUnwatched => 'סמן כלא נצפה';

  @override
  String get contextMenuAddToFavorites => 'הוסף למועדפים';

  @override
  String get contextMenuRemoveFromFavorites => 'הסר מהמועדפים';

  @override
  String get contextMenuGoToSeries => 'לך לסדרה';

  @override
  String get contextMenuHideFromContinueWatching => 'הסתר מ\"המשך לצפות\"';

  @override
  String get contextMenuHideFromNextUp => 'הסתר מ\"הבא בתור\"';

  @override
  String get contextMenuAddToCollection => 'הוסף לאוסף';

  @override
  String get settingsAdministrationSubtitle => 'גש ללוח ניהול השרת';

  @override
  String get settingsAccountSecurity => 'חשבון ואבטחה';

  @override
  String get settingsAccountSecuritySubtitle => 'אימות, קוד PIN ובקרת הורים';

  @override
  String get settingsPersonalization => 'התאמה אישית';

  @override
  String get settingsPersonalizationSubtitle =>
      'ערכת נושא, ניווט, שורות בית ונראות ספרייה';

  @override
  String get settingsDynamicContent => 'תוכן דינמי';

  @override
  String get settingsDynamicContentSubtitle => 'סרגל מדיה ושכבות-על חזותיות';

  @override
  String get settingsPlaybackSyncplay => 'השמעה ו-SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'הגדרות אודיו/וידאו, כתוביות, הורדות ופקדי SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'סנכרון פלאגין, Seerr, דירוגים ועוד';

  @override
  String get settingsAboutSubtitle => 'גרסת האפליקציה, מידע משפטי וקרדיטים';

  @override
  String get settingsAuthenticationSection => 'אימות';

  @override
  String get settingsSortServersBy => 'מיין שרתים לפי';

  @override
  String get settingsLastUsed => 'בשימוש אחרון';

  @override
  String get settingsAlphabetical => 'אָלֶף בֵּיתִי';

  @override
  String get settingsConnectionSection => 'חיבור';

  @override
  String get settingsAllowSelfSignedCerts => 'אפשר תעודות בחתימה עצמית';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'תן אמון בשרתים המשתמשים בתעודות TLS בחתימה עצמית או מרשות אישורים פרטית. הפעל רק עבור שרתים שבשליטתך. פעולה זו משביתה את אימות התעודות בכל החיבורים.';

  @override
  String get settingsPrivacyAndSafetySection => 'פרטיות ובטיחות';

  @override
  String get settingsBlockedRatings => 'דירוגים חסומים';

  @override
  String get settingsGeneralStyle => 'סגנון כללי';

  @override
  String get settingsGeneralStyleSubtitle =>
      'הדגשות נושא, תפאורות, מחוונים שנצפו ומוזיקת ​​נושא';

  @override
  String get settingsDetailsScreen => 'מסך פרטים';

  @override
  String get settingsDetailsScreenSubtitle =>
      'סגנון, טשטוש רקע והתנהגות לשוניות';

  @override
  String get settingsHomePage => 'עמוד הבית';

  @override
  String get settingsHomePageSubtitle =>
      'קטעים, סוגי תמונות, שכבות-על ותצוגות מקדימות של מדיה';

  @override
  String get settingsLibrariesSubtitle =>
      'נראות ספרייה, תצוגת תיקיות והתנהגות מרובת שרתים';

  @override
  String get settingsTwentyFourHourClock => 'שעון 24 שעות';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'השתמש בעיצוב זמן של 24 שעות בכל מקום שבו השעון מוצג';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'הצג את לחצן ערבוב בסרגל הניווט';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'הצג את לחצן הז\'אנרים בסרגל הניווט';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'הצג את לחצן המועדפים בסרגל הניווט';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'הצג את לחצן הספריות בסרגל הניווט';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'הצג את לחצן Seerr בסרגל הניווט';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'הצג תמיד תוויות טקסט בסרגל הניווט העליון';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'החלף את נראות דף הבית לכל ספריה. הפעל מחדש את Moonfin כדי שהשינויים ייכנסו לתוקף.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'סרגל מדיה ותצוגות מקדימות מקומיות';

  @override
  String get settingsVisualOverlays => 'שכבות חזותיות';

  @override
  String get settingsSeasonalSurprise => 'הפתעה עונתית';

  @override
  String get settingsMetadataAndRatings => 'מטא נתונים ודירוגים';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase מפעיל שילובים בצד השרת, כולל מקורות דירוג נוספים, בקשות Seerr והעדפות מסונכרנות.';

  @override
  String get settingsOfflineDownloads => 'הורדות לא מקוונות';

  @override
  String get settingsHigh => 'גָבוֹהַ';

  @override
  String get settingsLow => 'נָמוּך';

  @override
  String get settingsCustomPath => 'נתיב מותאם אישית';

  @override
  String get settingsEnterDownloadFolderPath => 'הזן נתיב תיקיית הורדה';

  @override
  String get settingsConcurrentDownloads => 'הורדות במקביל';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'מספר פריטים מקסימלי להורדה בבת אחת.';

  @override
  String get settingsAppInfo => 'מידע על אפליקציה';

  @override
  String get settingsReportAnIssue => 'דווח על בעיה';

  @override
  String get settingsReportAnIssueSubtitle => 'פתח את מעקב הבעיות ב- GitHub';

  @override
  String get settingsJoinDiscord => 'הצטרף ל-Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'צ\'אט עם הקהילה';

  @override
  String get settingsJoinTheDiscord => 'הצטרף ל-Discord';

  @override
  String get settingsSupportMoonfin => 'תמכו ב- Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'תרום כוס קפה למפתח';

  @override
  String get settingsLegal => 'מִשׁפָּטִי';

  @override
  String get settingsLicenses => 'רישיונות';

  @override
  String get settingsOpenSourceLicenseNotices => 'הודעות רישיון קוד פתוח';

  @override
  String get settingsPrivacyPolicy => 'מדיניות פרטיות';

  @override
  String get settingsPrivacyPolicySubtitle => 'כיצד Moonfin מטפל בנתונים שלך';

  @override
  String get settingsCheckForUpdates => 'בדוק אם קיימים עדכונים';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'בדוק את המהדורה האחרונה של Moonfin';

  @override
  String get settingsPoweredByFlutter => 'מופעל על ידי Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# הודעות רישיון',
      two: '# הודעות רישיון',
      one: '# הודעת רישיון',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'שְׁנֵיהֶם';

  @override
  String get settingsShuffleContentTypeFilter => 'ערבב מסנן סוג תוכן';

  @override
  String get settingsVideoPlaybackPreferences => 'העדפות הפעלת וידאו';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'מנוע ליבה והגדרות איכות סטרימינג';

  @override
  String get settingsAudioPreferences => 'העדפות אודיו';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'אפשרויות רצועות אודיו, עיבוד ומעבר';

  @override
  String get settingsAutomationAndQueue => 'אוטומציה ותור';

  @override
  String get settingsAutomationAndQueueSubtitle => 'השמעה ורצף אוטומטיים';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'איכות הורדה, מגבלות אחסון וגודל תור';

  @override
  String get settingsSyncplaySubtitle => 'היגיון סנכרון למפגשים קבוצתיים';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'תכונות נגן מיוחדות. השתמש בזהירות, מכיוון שחלק מהאפשרויות עלולות לגרום לבעיות השמעה';

  @override
  String get settingsSkipIntrosAndOutros => 'לדלג על Intros ו-Outros?';

  @override
  String get settingsMediaSegmentCountdown => 'ספירה לאחור של מקטע מדיה';

  @override
  String get settingsProgressBar => 'סרגל התקדמות';

  @override
  String get settingsTimer => 'טיימר';

  @override
  String get settingsNone => 'ללא';

  @override
  String get settingsPromptUser => 'משתמש מהיר';

  @override
  String get settingsSkip => 'לְדַלֵג';

  @override
  String get settingsDoNothing => 'אל תעשה כלום';

  @override
  String get settingsMaxBitrateDescription =>
      'הגבל את קצב הסיביות של הסטרימינג. תוכן מעל סף זה יועבר להמרה כדי להתאים.';

  @override
  String get settingsMaxResolutionDescription =>
      'הגבל את הרזולוציה המקסימלית שהשחקן יבקש. תוכן ברזולוציה גבוהה יותר יקודד למטה.';

  @override
  String get settingsPlayerZoomDescription =>
      'כיצד יש להתאים את הווידאו כך שיתאים למסך.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'מנוע השמעה (אנדרואיד TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'בחר את מנוע ההשמעה המוגדר כברירת מחדל במכשירי Android TV. השינויים חלים על הפעלת ההשמעה הבאה.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (מומלץ)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (מיושן)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (מורשת)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (מומלץ)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision סתירה';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'התנהגות עבור כותרי Dolby Vision במכשירים ללא פענוח Dolby Vision.';

  @override
  String get settingsAskEachTime => 'תשאל כל פעם';

  @override
  String get settingsPreferHdr10Fallback => 'העדיפו HDR10 fallback';

  @override
  String get settingsPreferServerTranscode => 'העדיפו טרנסקוד שרת';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 הפעלה ישירה';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'קובע אם זרמים בשכבת שיפור בפרופיל Dolby Vision 7 צריכים לכוון הפעלה.';

  @override
  String get settingsAutoAftkrtEnabled => 'אוטומטי (AFTKRT מופעל)';

  @override
  String get settingsEnabledOnThisDevice => 'מופעל במכשיר זה';

  @override
  String get settingsDisabledPreferTranscode => 'מושבת (עדיף להמריא)';

  @override
  String get settingsResumeRewindDescription =>
      'בעת חידוש השמעה (מתוך המשך צפייה או מדף פריט מדיה), כמה שניות יש להחזיר לאחור?';

  @override
  String get settingsUnpauseRewindDescription =>
      'בעת חידוש השמעה לאחר לחיצה על כפתור ההשהיה, כמה שניות יש להחזיר לאחור?';

  @override
  String get settingsSkipBackLengthDescription =>
      'כמה שניות לקפוץ אחורה לאחר לחיצה על כפתור ההרצה לאחור.';

  @override
  String get settingsOneSecond => 'שנייה אחת';

  @override
  String get settingsThreeSeconds => '3 שניות';

  @override
  String get settingsFortyFiveSeconds => '45 שניות';

  @override
  String get settingsSixtySeconds => '60 שניות';

  @override
  String get settingsSkipForwardLengthDescription =>
      'כמה שניות לקפוץ קדימה לאחר לחיצה על כפתור ההרצה קדימה.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 למפענח חיצוני';

  @override
  String get settingsCinemaMode => 'מצב קולנוע';

  @override
  String get settingsCinemaModeSubtitle =>
      'שחק טריילרים/פררוולים לפני תכונה ראשית';

  @override
  String get settingsNextUpDisplayDescription =>
      'מורחב מציג כרטיס מלא עם גרפיקה ותיאור של פרק. Minimal מציג שכבת-על קומפקטית של ספירה לאחור. מושבת מסתיר את ההנחיה לחלוטין.';

  @override
  String get settingsShort => 'קָצָר';

  @override
  String get settingsLong => 'אָרוֹך';

  @override
  String get settingsVeryLong => 'ארוך מאוד';

  @override
  String get settingsVideoStartDelay => 'עיכוב תחילת וידאו';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'ישיר בטלוויזיה בשידור חי';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'אפשר הפעלה ישירה עבור טלוויזיה בשידור חי';

  @override
  String get settingsOpenGroups => 'פתח קבוצות';

  @override
  String get settingsOpenGroupsSubtitle => 'צור, הצטרף או נהל קבוצות SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay מופעל';

  @override
  String get settingsSyncplayEnabledSubtitle => 'אפשר תכונות של צפייה קבוצתית';

  @override
  String get settingsSyncplayButton => 'לחצן SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'הצג את לחצן SyncPlay בסרגל הניווט';

  @override
  String get settingsSyncplayAdvancedCorrection => 'תיקון מתקדם';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'אפשר לוגיקת סנכרון עדינה';

  @override
  String get settingsSyncplaySyncCorrection => 'תיקון סנכרון';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'התאם אוטומטית את ההשמעה כדי להישאר מסונכרן';

  @override
  String get settingsSyncplaySpeedToSync => 'מהירות לסנכרון';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'השתמש בכוונון מהירות ההשמעה כדי לסנכרן';

  @override
  String get settingsSyncplaySkipToSync => 'דלג לסנכרון';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => 'השתמש בחיפוש כדי לסנכרן';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'השהיית מהירות מינימלית';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'השהיית מהירות מרבית';

  @override
  String get settingsSyncplaySpeedDuration => 'מהירות משך';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'השהיית דילוג מינימלית';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay קיזוז נוסף';

  @override
  String get onNow => 'פועל עכשיו';

  @override
  String get collections => 'אוספים';

  @override
  String get lastPlayed => 'שיחק לאחרונה';

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
    return '$libraryName שיצאו לאחרונה';
  }

  @override
  String get autoplayNextEpisode => 'הפעלה אוטומטית של הפרק הבא';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'הפעל אוטומטית את הפרק הבא כשהוא זמין.';

  @override
  String get skipSilenceTitle => 'דלג על שקט';

  @override
  String get skipSilenceSubtitle =>
      'דלג אוטומטית על מקטעי שמע שקטים כשהזרם תומך בכך.';

  @override
  String get allowExternalAudioEffectsTitle => 'אפשר אפקטי שמע חיצוניים';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'אפשר לאפליקציות אקולייזר ואפקטים (למשל Wavelet) להתחבר להפעלות Media3.';

  @override
  String get disableTunnelingTitle => 'השבת מנהור';

  @override
  String get disableTunnelingSubtitle =>
      'אלץ הפעלה ללא מנהור. שימושי במכשירים שבהם המנהור גורם לקטיעות בשמע/וידאו.';

  @override
  String get enableTunnelingTitle => 'הפעל מנהור';

  @override
  String get enableTunnelingSubtitle =>
      'מתקדם. מנתב שמע ווידאו דרך נתיב חומרה משולב. כבוי כברירת מחדל מכיוון שהוא גורם לנפילות שמע/וידאו בחלק מהמכשירים.';

  @override
  String get mapDolbyVisionP7Title => 'מפה את Dolby Vision פרופיל 7 ל-HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'הפעל זרמי Dolby Vision פרופיל 7 כ-HEVC תואם HDR10 במכשירים ללא תמיכה ב-Dolby Vision.';

  @override
  String get subtitlesUseEmbeddedStyles => 'השתמש בסגנונות כתוביות מוטמעים';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'החל צבעים, גופנים ומיקום המוטמעים ברצועת הכתוביות. השבת כדי להשתמש במקום זאת בהעדפות סגנון הכתוביות שלך.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'השתמש בגדלי גופן מוטמעים של הכתוביות';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'החל רמזי גודל גופן המוטמעים ברצועת הכתוביות. השבת כדי להשתמש בגודל הכתוביות מהעדפות הסגנון שלך.';

  @override
  String get showMediaDetailsOnLibraryPage => 'הצג פרטי מדיה';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'הצג את פרטי הפריט הנבחר בראש דפי הספרייה.';

  @override
  String get hideBackdropsInLibraries => 'להסתיר תמונות רקע בעת גלישה?';

  @override
  String get useDetailedSubHeadings => 'השתמש בכותרות משנה מפורטות';

  @override
  String get useDetailedSubHeadingsDescription =>
      'הצג שורת משנה מפורטת או מינימלית בדפי הספרייה.';

  @override
  String get savedThemesDeleteDialogTitle => 'למחוק את ערכת הנושא השמורה?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'להסיר את \"$themeName\" ממטמון המכשיר הזה?';
  }

  @override
  String get themeStore => 'חנות ערכות הנושא';

  @override
  String get themeStoreSubtitle => 'עיין ושמור ערכות נושא של הקהילה';

  @override
  String get themeStoreDescription =>
      'שמור ערכת נושא כדי להשתמש בה כמו בערכות השמורות האחרות שלך.';

  @override
  String get themeStoreEmpty => 'אין ערכות נושא זמינות כרגע.';

  @override
  String get themeStoreLoadFailed =>
      'לא ניתן היה לטעון את חנות ערכות הנושא. בדוק את החיבור ונסה שוב.';

  @override
  String get themeStoreSave => 'שמור';

  @override
  String get themeStoreSaveAndApply => 'שמור והחל';

  @override
  String get themeStoreSaved => 'נשמר';

  @override
  String get themeStoreInvalidMessage => 'לא ניתן היה לטעון את ערכת הנושא הזו.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" נשמרה.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" נמחקה מהמכשיר הזה.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'לא ניתן היה למחוק את \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'ערכות נושא שמורות';

  @override
  String get savedThemesDescription =>
      'אלו ערכות נושא שהורדו מתוסף Moonfin עבור השרת הנוכחי. מחיקה מסירה רק את העותק המקומי הזה.';

  @override
  String get savedThemesEmpty => 'לא נמצאו ערכות נושא שמורות עבור שרת זה.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • פעילה כעת';
  }

  @override
  String get savedThemesDeleteTooltip => 'מחק ערכת נושא שמורה';

  @override
  String get savedThemesManageSubtitle =>
      'נהל ערכות נושא של התוסף שהורדו למכשיר הזה';

  @override
  String get themeEditor => 'עורך ערכות הנושא';

  @override
  String get themeEditorSubtitle => 'פתח את עורך ערכות הנושא של Moonfin בדפדפן';

  @override
  String get homeScreen => 'מסך הבית';

  @override
  String get bottomBar => 'הסרגל התחתון';

  @override
  String get homeRowsStyleClassic => 'קלאסי';

  @override
  String get homeRowsStyleModern => 'מודרני';

  @override
  String get homeRowsSection => 'שורות הבית';

  @override
  String get homeRowDisplay => 'תצוגת שורות הבית';

  @override
  String get homeRowSections => 'מקטעי שורות הבית';

  @override
  String get homeRowToggles => 'מתגי שורות הבית';

  @override
  String get homeRowTogglesSubtitle =>
      'הפעל או השבת קטגוריות של שורות בית מבוססות ספרייה';

  @override
  String get homeRowTogglesDescription =>
      'הפעל את המתגים הבאים כדי להציג את השורות במקטעי הבית.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'קלאסי שומר על סוג תמונה ושכבת מידע לכל שורה. מודרני משתמש בשורות מפוסטר לתמונת רקע.';

  @override
  String get displayFavoritesRows => 'הצג שורות מועדפים';

  @override
  String get displayFavoritesRowsSubtitle =>
      'הצג סרטים מועדפים, סדרות ושורות מועדפים אחרות במקטעי הבית.';

  @override
  String get favoritesRowSorting => 'מיון שורות המועדפים';

  @override
  String get favoritesRowSortingDescription =>
      'מיין את שורות המועדפים לפי תאריך הוספה, תאריך יציאה, סדר אלפביתי ועוד.';

  @override
  String get displayCollectionsRows => 'הצג שורות אוספים';

  @override
  String get displayCollectionsRowsSubtitle => 'הצג שורות אוספים במקטעי הבית.';

  @override
  String get collectionsRowSorting => 'מיון שורות האוספים';

  @override
  String get collectionsRowSortingDescription =>
      'מיין את שורות האוספים לפי תאריך הוספה, תאריך יציאה, סדר אלפביתי ועוד.';

  @override
  String get displayGenresRows => 'הצג שורות ז\'אנרים';

  @override
  String get displayGenresRowsSubtitle => 'הצג שורות ז\'אנרים במקטעי הבית.';

  @override
  String get genresRowSorting => 'מיון שורות הז\'אנרים';

  @override
  String get genresRowSortingDescription =>
      'מיין את שורות הז\'אנרים לפי תאריך הוספה, תאריך יציאה, סדר אלפביתי ועוד.';

  @override
  String get genresRowItems => 'פריטים בשורות הז\'אנרים';

  @override
  String get genresRowItemsDescription =>
      'הצג סרטים, סדרות או שניהם בשורות הז\'אנרים.';

  @override
  String get displayPlaylistsRows => 'הצג שורות רשימות השמעה';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'הצג שורות רשימות השמעה במקטעי הבית.';

  @override
  String get playlistsRowSorting => 'מיון שורות רשימות ההשמעה';

  @override
  String get playlistsRowSortingDescription =>
      'מיין את שורות רשימות ההשמעה לפי תאריך הוספה, תאריך יציאה, סדר אלפביתי ועוד.';

  @override
  String get displayAudioRows => 'הצג שורות שמע';

  @override
  String get displayAudioRowsSubtitle => 'הצג שורות שמע במקטעי הבית.';

  @override
  String get audioRowsSorting => 'מיון שורות השמע';

  @override
  String get audioRowsSortingDescription =>
      'מיין את שורות השמע לפי תאריך הוספה, תאריך יציאה, סדר אלפביתי ועוד.';

  @override
  String get audioPlaylists => 'רשימות השמעה של שמע';

  @override
  String get appearance => 'מראה';

  @override
  String get layout => 'פריסה';

  @override
  String get theme => 'ערכת נושא';

  @override
  String get keyboard => 'מקלדת';

  @override
  String get navButtons => 'כפתורים';

  @override
  String get rendering => 'רינדור';

  @override
  String get mpvConfiguration => 'תצורת MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'אפליקציית נגן חיצוני';

  @override
  String get externalPlayerAppDescription =>
      'הגדר נגן חיצוני כדי לאפשר הפעלה בלחיצה ארוכה';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'הצג בורר אפליקציות בתחילת ההפעלה.';

  @override
  String get loadingInstalledPlayers => 'טוען נגנים מותקנים...';

  @override
  String get connection => 'חיבור';

  @override
  String get audioTranscodeTarget => 'יעד המרת קידוד שמע';

  @override
  String get passthrough => 'העברה ישירה';

  @override
  String get supportedOnThisDevice => 'נתמך במכשיר זה';

  @override
  String get notSupportedOnThisDevice => 'לא נתמך במכשיר זה';

  @override
  String get settingsAudioDtsXPassthrough => 'העברה ישירה של DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'העברת DTS:X (DTS UHD) כזרם ביטים למפענח חיצוני.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'העברה ישירה של TrueHD עם Atmos (JOC)';

  @override
  String get mediaPlayerBehavior => 'התנהגות נגן המדיה';

  @override
  String get playbackEnhancements => 'שיפורי הפעלה';

  @override
  String get alwaysOn => 'תמיד פעיל.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'החלפת דילוג על הסיום בתצוגת הבא בתור';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'הצג את שכבת הבא בתור במקום את כפתור דילוג על הסיום.';

  @override
  String get playerRouting => 'ניתוב הנגן';

  @override
  String get preferSoftwareDecoders => 'העדף מפענחי תוכנה';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'השתמש ב-FFmpeg (שמע) וב-libgav1 (AV1) לפני מפענחי חומרה. השבת אם העברת השמע הישירה ב-HDMI מפסיקה לעבוד.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'פתח הפעלת וידאו באפליקציה החיצונית שבחרת ב-Android TV.';

  @override
  String get automaticQueuing => 'הוספה אוטומטית לתור';

  @override
  String get preferSdhSubtitles => 'העדף כתוביות SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'תעדף רצועות כתוביות SDH/CC בבחירה אוטומטית.';

  @override
  String get webDiagnostics => 'אבחון ווב';

  @override
  String get webDiagnosticsTitle => 'אבחון ווב של Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'השתמש בעמוד זה כדי לאבחן בעיות קישוריות בדפדפן (CORS, תוכן מעורב והגדרות איתור).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure => 'זוהה כשל תוכן מעורב';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'זוהה כשל CORS/Preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin זיהה עמוד HTTPS שמנסה לפנות לכתובת שרת HTTP. דפדפנים חוסמים בקשה זו עוד לפני שהיא מגיעה לשרת שלך.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin זיהה כשל בקשה ברמת הדפדפן, שנגרם בדרך כלל מכותרות CORS או preflight חסרות בשרת המדיה.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'כתובת יעד: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'פירוט: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'הקשר זמן הריצה הנוכחי';

  @override
  String get webDiagnosticsOrigin => 'מקור';

  @override
  String get webDiagnosticsScheme => 'סכמה';

  @override
  String get webDiagnosticsPluginMode => 'מצב תוסף';

  @override
  String get webDiagnosticsWebRtcScan => 'סריקת WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'כתובת שרת כפויה';

  @override
  String get webDiagnosticsDefaultServerUrl => 'כתובת שרת ברירת מחדל';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'כתובת פרוקסי לאיתור';

  @override
  String get notConfigured => 'לא מוגדר';

  @override
  String get webDiagnosticsMixedContent => 'תוכן מעורב';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'עמוד זה נטען דרך HTTPS, אך אחת או יותר מהכתובות המוגדרות הן HTTP. דפדפנים חוסמים פנייה של עמודי HTTPS לממשקי API מסוג HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'פתרון: הגש את שרת המדיה או את נקודת הקצה של הפרוקסי דרך HTTPS, או טען את Moonfin דרך HTTP ברשתות מקומיות מהימנות בלבד.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'לא זוהתה תצורת תוכן מעורב מובהקת מהגדרות זמן הריצה הנוכחיות.';

  @override
  String get webDiagnosticsCorsChecklist => 'רשימת בדיקה ל-CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• אפשר את מקור הדפדפן ב-Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• כלול את Authorization, X-Emby-Authorization ו-X-Emby-Token ב-Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• חשוף את Content-Range ואת Accept-Ranges עבור הזרמה ודילוג בזמן.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• החזר 204 לבקשות preflight מסוג OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'דוגמה לקטע כותרות (בסגנון nginx)';

  @override
  String get note => 'הערה';

  @override
  String get webDiagnosticsNonWebNote =>
      'מסלול אבחון זה מיועד לגרסאות ווב. אם אתה רואה אותו בפלטפורמה אחרת, ייתכן שהבדיקות אינן רלוונטיות.';

  @override
  String get backToServerSelect => 'חזרה לבחירת שרת';

  @override
  String get signOutAllUsers => 'נתק את כל המשתמשים';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'ההרשאה למיקרופון נדחתה לצמיתות. הפעל אותה בהגדרות המערכת.';

  @override
  String get voiceSearchPermissionRequired =>
      'נדרשת הרשאה למיקרופון לחיפוש קולי.';

  @override
  String get voiceSearchNoMatch => 'לא הצלחנו לקלוט. נסה שוב.';

  @override
  String get voiceSearchNoSpeechDetected => 'לא זוהה דיבור.';

  @override
  String get voiceSearchMicrophoneError => 'שגיאת מיקרופון.';

  @override
  String get voiceSearchNeedsInternet => 'חיפוש קולי דורש חיבור לאינטרנט.';

  @override
  String get voiceSearchServiceBusy => 'שירות הקול עסוק. נסה שוב.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'ההרשאה למיקרופון נדחתה לצמיתות.';

  @override
  String get microphonePermissionDenied => 'ההרשאה למיקרופון נדחתה.';

  @override
  String get speechRecognitionUnavailable => 'זיהוי דיבור אינו זמין במכשיר זה.';

  @override
  String get openIosRoutePicker => 'פתח את בורר המסלולים של iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'בורר המסלולים של AirPlay אינו זמין במכשיר זה.';

  @override
  String get videos => 'סרטונים';

  @override
  String get programs => 'תוכניות';

  @override
  String get songs => 'שירים';

  @override
  String get photoAlbums => 'אלבומי תמונות';

  @override
  String get photos => 'תמונות';

  @override
  String get people => 'אנשים';

  @override
  String get recentlyReleasedEpisodes => 'פרקים ששוחררו לאחרונה';

  @override
  String get watchAgain => 'צפה שוב';

  @override
  String get guestAppearances => 'הופעות אורח';

  @override
  String get appearancesSeerr => 'הופעות (Seerr)';

  @override
  String get crewContributionsSeerr => 'תרומות צוות (Seerr)';

  @override
  String get watchWithGroup => 'צפה עם קבוצה';

  @override
  String get errors => 'שגיאות';

  @override
  String get warnings => 'אזהרות';

  @override
  String get disk => 'דיסק';

  @override
  String get openInBrowser => 'פתח בדפדפן';

  @override
  String get embeddedBrowserNotAvailable =>
      'דפדפן מוטמע אינו זמין בפלטפורמה זו.';

  @override
  String get adminRestartServerConfirmation =>
      'האם אתה בטוח שברצונך להפעיל מחדש את השרת?';

  @override
  String get adminShutdownServerConfirmation =>
      'האם אתה בטוח שברצונך לכבות את השרת? תצטרך להפעיל אותו מחדש באופן ידני.';

  @override
  String get internal => 'פנימי';

  @override
  String get idle => 'לא פעיל';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'לא נמצאו משתמשים';

  @override
  String get adminNoUsersMatchSearch => 'אין משתמשים התואמים לחיפוש שלך';

  @override
  String get adminNoDevicesFound => 'לא נמצאו מכשירים';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'אין מכשירים התואמים למסננים הנוכחיים';

  @override
  String get passwordSet => 'סיסמה הוגדרה';

  @override
  String get noPasswordConfigured => 'לא הוגדרה סיסמה';

  @override
  String get remoteAccess => 'גישה מרחוק';

  @override
  String get localOnly => 'מקומי בלבד';

  @override
  String get adminMediaAnalyticsLoadFailed => 'טעינת ניתוח המדיה נכשלה';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'ניתוח משולב מכל ספריות המדיה.';

  @override
  String get analyticsTopArtists => 'אמנים מובילים';

  @override
  String get analyticsTopAuthors => 'סופרים מובילים';

  @override
  String get analyticsTopContributors => 'תורמים מובילים';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ספריות',
      two: 'שתי ספריות',
      one: 'ספרייה אחת',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'עדיין אין סיכומי מדיה מאונדקסת עבור בחירה זו.';

  @override
  String get analyticsLibraryDetails => 'פרטי הספרייה';

  @override
  String get analyticsLibraryBreakdown => 'פילוח לפי ספרייה';

  @override
  String get analyticsNoLibrariesAvailable => 'אין ספריות זמינות.';

  @override
  String get adminServerAdministrationTitle => 'ניהול השרת';

  @override
  String get adminServerPathData => 'נתונים';

  @override
  String get adminServerPathImageCache => 'מטמון תמונות';

  @override
  String get adminServerPathCache => 'מטמון';

  @override
  String get adminServerPathLogs => 'יומנים';

  @override
  String get adminServerPathMetadata => 'מטא-נתונים';

  @override
  String get adminServerPathTranscode => 'המרת קידוד';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned => 'שרת זה לא החזיר נתיבי שרת.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% בשימוש';
  }

  @override
  String get userActivity => 'פעילות משתמשים';

  @override
  String get systemEvents => 'אירועי מערכת';

  @override
  String get needsAttention => 'דורש טיפול';

  @override
  String get adminDrawerSectionServer => 'שרת';

  @override
  String get adminDrawerSectionPlayback => 'הפעלה';

  @override
  String get adminDrawerSectionDevices => 'מכשירים';

  @override
  String get adminDrawerSectionAdvanced => 'מתקדם';

  @override
  String get adminDrawerSectionPlugins => 'תוספים';

  @override
  String get adminDrawerSectionLiveTv => 'טלוויזיה בשידור חי';

  @override
  String get homeVideos => 'סרטוני בית';

  @override
  String get mixedContent => 'תוכן מעורב';

  @override
  String get homeVideosAndPhotos => 'סרטוני בית ותמונות';

  @override
  String get mixedMoviesAndShows => 'סרטים וסדרות מעורבים';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'לא נמצאו הקלטות';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'לא נמצאו עמודי תמונה בארכיון .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'מנוע הרינדור המוטמע נכשל ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'מנוע הרינדור של EPUB נכשל ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'חסר קובץ מקומי עבור הקורא: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status בעת פתיחת נתוני הספר מ-$uri';
  }

  @override
  String get noReadableBookEndpointAvailable => 'לא זמינה נקודת קצה קריאה לספר';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'פורמט ארכיון קומיקס שאינו נתמך: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'תוסף החילוץ של CBR אינו זמין בפלטפורמה זו.';

  @override
  String get failedToExtractCbrArchive => 'חילוץ ארכיון .cbr נכשל.';

  @override
  String get cb7ExtractionUnavailable => 'חילוץ CB7 אינו זמין בפלטפורמה זו.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'תוסף החילוץ של CB7 אינו זמין בפלטפורמה זו.';

  @override
  String get closeGenrePanel => 'סגור את פאנל הז\'אנרים';

  @override
  String get loadingShuffle => 'טוען ערבוב...';

  @override
  String get libraryShuffleLabel => 'ערבוב ספרייה';

  @override
  String get randomShuffleLabel => 'ערבוב אקראי';

  @override
  String get genresShuffleLabel => 'ערבוב ז\'אנרים';

  @override
  String get autoHdrSwitching => 'מעבר אוטומטי ל-HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'הפעל אוטומטית HDR בהפעלת וידאו HDR ושחזר את מצב התצוגה ביציאה.';

  @override
  String get whenFullscreen => 'במסך מלא';

  @override
  String get changeArtwork => 'החלף גרפיקה';

  @override
  String get missing => 'חסר';

  @override
  String get transcodingLimits => 'מגבלות המרת קידוד';

  @override
  String get clearAllArtworkButton => 'לנקות את כל הגרפיקה?';

  @override
  String get clearAllArtworkWarning =>
      'האם אתה בטוח שברצונך לנקות את כל הגרפיקה שהורדה?';

  @override
  String get confirmClear => 'אישור ניקוי';

  @override
  String confirmClearMessage(String itemType) {
    return 'האם אתה בטוח שברצונך לנקות את $itemType?';
  }

  @override
  String get uploadButton => 'להעלות?';

  @override
  String get resolutionLabel => 'רזולוציה: ';

  @override
  String get onlyShowInterfaceLanguage => 'הצג גרפיקה בשפת הממשק בלבד';

  @override
  String get confirmClearAll => 'אישור ניקוי הכול';

  @override
  String get imageUploadSuccess => 'התמונה הועלתה בהצלחה!';

  @override
  String imageUploadFailed(String error) {
    return 'העלאת התמונה נכשלה: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'הגדרת התמונה נכשלה: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'מחיקת התמונה נכשלה: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'ניקוי כל הגרפיקה נכשל: $error';
  }

  @override
  String get yes => 'כן';

  @override
  String get posterCategory => 'פוסטר';

  @override
  String get backdropsCategory => 'רקעים';

  @override
  String get bannerCategory => 'באנר';

  @override
  String get logoCategory => 'לוגו';

  @override
  String get thumbnailCategory => 'תמונה ממוזערת';

  @override
  String get artCategory => 'גרפיקה';

  @override
  String get discArtCategory => 'גרפיקת דיסק';

  @override
  String get screenshotCategory => 'צילום מסך';

  @override
  String get boxCoverCategory => 'עטיפת קופסה';

  @override
  String get boxRearCoverCategory => 'עטיפה אחורית של קופסה';

  @override
  String get menuArtCategory => 'גרפיקת תפריט';

  @override
  String get confirmItemPoster => 'הפוסטר';

  @override
  String get confirmItemBackdrop => 'הרקע';

  @override
  String get confirmItemBanner => 'הבאנר';

  @override
  String get confirmItemLogo => 'הלוגו';

  @override
  String get confirmItemThumbnail => 'התמונה הממוזערת';

  @override
  String get confirmItemArt => 'הגרפיקה';

  @override
  String get confirmItemDiscArt => 'גרפיקת הדיסק';

  @override
  String get confirmItemScreenshot => 'צילום המסך';

  @override
  String get confirmItemBoxCover => 'עטיפת הקופסה';

  @override
  String get confirmItemBoxRearCover => 'העטיפה האחורית של הקופסה';

  @override
  String get confirmItemMenuArt => 'גרפיקת התפריט';

  @override
  String get resolutionAll => 'הכול';

  @override
  String get resolutionHigh => 'גבוהה (1080p+)';

  @override
  String get resolutionMedium => 'בינונית (720p)';

  @override
  String get resolutionLow => 'נמוכה (מתחת ל-720p)';

  @override
  String get sources => 'מקורות';

  @override
  String get audiobookChapters => 'פרקים';

  @override
  String get audiobookBookmarks => 'סימניות';

  @override
  String get audiobookNotes => 'הערות';

  @override
  String get audiobookQueue => 'תור';

  @override
  String get audiobookTimeline => 'ציר זמן';

  @override
  String get audiobookTimelineEmpty => 'ציר הזמן ריק';

  @override
  String get audiobookWholeBook => 'הספר כולו';

  @override
  String get audiobookFocusedTimeline => 'ציר זמן ממוקד';

  @override
  String get audiobookExportBookmarks => 'ייצוא סימניות';

  @override
  String get audiobookExportNotes => 'ייצוא הערות';

  @override
  String get audiobookExportAll => 'ייצוא הכול';

  @override
  String audiobookExportSuccess(String path) {
    return 'הייצוא נשמר ב-$path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'הייצוא נכשל: $error';
  }

  @override
  String get audiobookLyrics => 'מילות השיר';

  @override
  String get audiobookAddBookmark => 'הוסף סימנייה';

  @override
  String get audiobookAddNote => 'הוסף הערה';

  @override
  String get audiobookEditNote => 'ערוך הערה';

  @override
  String get audiobookNoteHint => 'כתוב הערה לרגע הזה';

  @override
  String get audiobookSleepTimer => 'טיימר שינה';

  @override
  String get audiobookSleepOff => 'כבוי';

  @override
  String get audiobookSleepEndOfChapter => 'סוף הפרק';

  @override
  String get audiobookSleepCustom => 'מותאם אישית';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'נותרו $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count דקות',
      two: 'שתי דקות',
      one: 'דקה אחת',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'מהירות הפעלה';

  @override
  String get audiobookRemainingTime => 'נותר';

  @override
  String get audiobookElapsedTime => 'חלף';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'אחורה $seconds שניות';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'קדימה $seconds שניות';
  }

  @override
  String get audiobookPreviousChapter => 'הפרק הקודם';

  @override
  String get audiobookNextChapter => 'הפרק הבא';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'פרק $current מתוך $total';
  }

  @override
  String get audiobookNoChapters => 'אין פרקים';

  @override
  String get audiobookNoBookmarks => 'אין עדיין סימניות';

  @override
  String get audiobookNoNotes => 'אין עדיין הערות';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'סימנייה נוספה ב-$position';
  }

  @override
  String get audiobookSpeedReset => 'איפוס ל-1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'שמור';

  @override
  String get audiobookCancel => 'בטל';

  @override
  String get audiobookDelete => 'מחק';

  @override
  String get subtitlePreferences => 'העדפות כתוביות';

  @override
  String get subtitlePreferencesDescription =>
      'שנה מצבי כתוביות, שפות ברירת מחדל, מראה ואפשרויות רינדור.';

  @override
  String get subtitleRendering => 'רינדור כתוביות';

  @override
  String get displayOptions => 'אפשרויות תצוגה';

  @override
  String get releaseDateAscending => 'תאריך יציאה (מהישן לחדש)';

  @override
  String get releaseDateDescending => 'תאריך יציאה (מהחדש לישן)';

  @override
  String get groupContributions => 'קיבוץ תרומות';

  @override
  String get groupMultipleRoles => 'קבץ תפקידים מרובים';

  @override
  String get libraryWriteAccessWarningTitle => 'אזהרת הרשאת כתיבה לספרייה';

  @override
  String get libraryWriteAccessHowToFix => 'איך לתקן זאת:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. הענק הרשאות כתיבה למשתמש השירות של Jellyfin (למשל jellyfin או PUID/PGID של Docker) לתיקיות ספריית המדיה שלך בשרת.\n\n2. לחלופין, עבור אל לוח הבקרה של Jellyfin -> ספריות, ערוך את הספרייה הזו והשבת את \'שמירת גרפיקה בתיקיות המדיה\' כדי לאחסן את הגרפיקה במסד הנתונים הפנימי של Jellyfin.';

  @override
  String get dismiss => 'סגור';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'הספרייה \'$libraryName\' שלך מוגדרת לשמור גרפיקה ישירות בתיקיות המדיה (האפשרות \'שמירת גרפיקה בתיקיות המדיה\' מופעלת). עם זאת, Jellyfin בדק את הרשאות הכתיבה ואין לו הרשאה לכתוב קבצים לתיקייה הזו:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'נראה ש-Jellyfin לא הצליח לעדכן את הגרפיקה. הספרייה שלך מוגדרת לשמור גרפיקה ישירות בתיקיות המדיה (האפשרות \'שמירת גרפיקה בתיקיות המדיה\' מופעלת). שגיאה זו מתרחשת בדרך כלל כאשר לתהליך שרת Jellyfin אין הרשאה לכתוב קבצים לתיקיות המדיה שלך.';

  @override
  String get externalLists => 'רשימות חיצוניות';

  @override
  String get replay => 'הפעל שוב';

  @override
  String get fileInformation => 'פרטי הקובץ';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'גודל: $size  •  פורמט: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'הצג את כל רצועות השמע ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'הצג את כל רצועות הכתוביות ($count)';
  }

  @override
  String get checkingDirectPlay => 'בודק יכולת הפעלה ישירה...';

  @override
  String get directPlayCapabilityLabel => 'יכולת הפעלה ישירה: ';

  @override
  String get forced => 'כפוי';

  @override
  String get transcodeContainerNotSupported =>
      'פורמט המכל אינו נתמך על ידי הנגן.';

  @override
  String get transcodeVideoCodecNotSupported => 'קודק הווידאו אינו נתמך.';

  @override
  String get transcodeAudioCodecNotSupported => 'קודק השמע אינו נתמך.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'פורמט הכתוביות אינו נתמך (נדרשת צריבה).';

  @override
  String get transcodeAudioProfileNotSupported => 'פרופיל השמע אינו נתמך.';

  @override
  String get transcodeVideoProfileNotSupported => 'פרופיל הווידאו אינו נתמך.';

  @override
  String get transcodeVideoLevelNotSupported => 'רמת הווידאו אינה נתמכת.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'רזולוציית הווידאו אינה נתמכת במכשיר זה.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'עומק הסיביות של הווידאו אינו נתמך.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'קצב הפריימים של הווידאו אינו נתמך.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'קצב הסיביות של הקובץ חורג ממגבלת ההזרמה של הנגן.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'קצב הסיביות של הווידאו חורג ממגבלת ההזרמה.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'קצב הסיביות של השמע חורג ממגבלת ההזרמה.';

  @override
  String get transcodeAudioChannelsNotSupported => 'מספר ערוצי השמע אינו נתמך.';

  @override
  String get sortAlphabetical => 'לפי סדר האלפבית';

  @override
  String get sortReleaseAscending => 'סדר יציאה (מהישן לחדש)';

  @override
  String get sortReleaseDescending => 'סדר יציאה (מהחדש לישן)';

  @override
  String get sortCustomDragDrop => 'מותאם אישית (גרירה ושחרור)';

  @override
  String get playlistSortOptions => 'אפשרויות מיון של רשימת ההשמעה';

  @override
  String get resetSort => 'אפס מיון';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'צפה שוב בעונה $season פרק $episode';
  }

  @override
  String get rewatchPlaylist => 'צפה שוב ברשימת ההשמעה';

  @override
  String get noSubtitlesFound => 'לא נמצאו כתוביות.';

  @override
  String get adminControls => 'בקרות מנהל';

  @override
  String get impellerRendering => 'מנוע רינדור (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller הוא מנוע ה-GPU המודרני של Flutter, לאנימציות חלקות יותר ולפחות קפיצות. בחלק ממכשירי הטלוויזיה ובמעבדים גרפיים ישנים הוא עלול לגרום לתקלות תצוגה או לווידאו שחור; כבה אותו אם אתה נתקל בכך. אוטומטי בוחר את ברירת המחדל הטובה ביותר עבור המכשיר שלך. הפעל מחדש את Moonfin כדי להחיל.';

  @override
  String get impellerAuto => 'אוטומטי';

  @override
  String get impellerOn => 'פועל';

  @override
  String get impellerOff => 'כבוי';

  @override
  String get impellerRestartTitle => 'נדרשת הפעלה מחדש';

  @override
  String get impellerRestartMessage =>
      'יש להפעיל מחדש את Moonfin כדי לשנות את מנוע הרינדור. סגור את האפליקציה עכשיו ופתח אותה שוב כדי להחיל.';

  @override
  String get impellerCloseNow => 'סגור את האפליקציה עכשיו';

  @override
  String get adminRefreshLibrary => 'רענן ספרייה';

  @override
  String get adminRefreshAllLibraries => 'רענן את כל הספריות';

  @override
  String get adminRepoSortDateOldest => 'תאריך הוספה (הישן ביותר תחילה)';

  @override
  String get adminRepoSortDateNewest => 'תאריך הוספה (החדש ביותר תחילה)';

  @override
  String get adminRepoSortNameAsc => 'לפי סדר האלפבית (א-ת)';

  @override
  String get adminRepoSortNameDesc => 'לפי סדר האלפבית (ת-א)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'טוען ניתוח שרת... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'התאם למקור';

  @override
  String get imdbTop250Movies => '250 הסרטים המובילים ב-IMDb';

  @override
  String get imdbTop250TvShows => '250 סדרות הטלוויזיה המובילות ב-IMDb';

  @override
  String get imdbMostPopularMovies => 'הסרטים הפופולריים ביותר ב-IMDb';

  @override
  String get imdbMostPopularTvShows =>
      'סדרות הטלוויזיה הפופולריות ביותר ב-IMDb';

  @override
  String get imdbLowestRatedMovies => 'הסרטים בעלי הדירוג הנמוך ביותר ב-IMDb';

  @override
  String get imdbTopEnglishMovies =>
      'הסרטים באנגלית עם הדירוג הגבוה ביותר ב-IMDb';
}
