// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'סנפיר ירח';

  @override
  String get accountPreferences => 'ACCOUNT PREFERENCES';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'היכנס';

  @override
  String get empty => 'Empty';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'חיבור מהיר';

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
  String get back => 'בְּחֲזָרָה';

  @override
  String get serverUnavailable => 'השרת אינו זמין';

  @override
  String get loginFailed => 'הכניסה נכשלה';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'מי צופה?';

  @override
  String get addUser => 'הוסף משתמש';

  @override
  String get selectServer => 'בחר שרת';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'לְבַטֵל';

  @override
  String get remove => 'לְהַסִיר';

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
  String get settingsAppearanceThemeSubtitle =>
      'מעבר בין Moonfin ל-Neon Pulse מבלי להפעיל מחדש את האפליקציה';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'סנפיר ירח';

  @override
  String get themeMoonfinSubtitle => 'מראה Moonfin נוכחי שכולכם למדתם לאהוב';

  @override
  String get themeNeonPulse => 'דופק ניאון';

  @override
  String get themeNeonPulseSubtitle =>
      'עיצוב גלי סינת\' עם זוהר מגנטה, טקסט בצבע ציאן וניגודיות כרום חזקה יותר';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'לצאת מ- Moonfin?';

  @override
  String get exitAppConfirmation => 'האם אתה בטוח שאתה רוצה לצאת?';

  @override
  String get exit => 'יְצִיאָה';

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
  String get series => 'סִדרָה';

  @override
  String get noItemsFound => 'לא נמצאו פריטים';

  @override
  String get home => 'בַּיִת';

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
  String get library => 'סִפְרִיָה';

  @override
  String get displaySettings => 'הגדרות תצוגה';

  @override
  String get allGenres => 'כל הז\'אנרים';

  @override
  String get noGenresFound => 'לא נמצאו ז\'אנרים';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'התיקיה הזו ריקה';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
    return '$name — Genres';
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
  String get discoverySubjects => 'נושאי גילוי';

  @override
  String get pickDiscoverySubjects =>
      'בחר אילו עדכוני נושאים להציג ב-Discover.';

  @override
  String get apply => 'לִפְנוֹת';

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
    return '$count titles';
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
  String get resume => 'קוֹרוֹת חַיִים';

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
  String get readyWhenYouAre => 'מוכן כשאתה';

  @override
  String get details => 'פרטים';

  @override
  String get listeningRoom => 'חדר האזנה';

  @override
  String get bookmarksAndProgress => 'סימניות והתקדמות';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'כותרות';

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
    return 'No $label found';
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
  String get watched => 'צפו';

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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'לא ניתן לטעון נושא זה כעת.';

  @override
  String get audiobookDetails => 'פרטי ספר שמע';

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
  String get trackList => 'רשימת רצועות';

  @override
  String get itemListPlaceholder => 'רשימת הפריטים תופיע כאן';

  @override
  String get favoriteTracksPlaceholder => 'רצועות אהובות יופיעו כאן';

  @override
  String get failedToLoad => 'הטעינה נכשלה';

  @override
  String get delete => 'לִמְחוֹק';

  @override
  String get save => 'לְהַצִיל';

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
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'תאריך פרסום לא ידוע';

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
  String endsIn(String time) {
    return 'Ends in $time';
  }

  @override
  String get view => 'נוֹף';

  @override
  String get resumeReading => 'המשך קריאה';

  @override
  String get read => 'לִקְרוֹא';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'לְשַׂחֵק';

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
  String get cast => 'יָצוּק';

  @override
  String get trailer => 'גְרוֹר';

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
  String get renamePlaylist => 'שנה שם רשימת השמעה';

  @override
  String get playlistName => 'שם רשימת ההשמעה';

  @override
  String get deleteDownloadedAlbum => 'מחק את האלבום שהורד';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'הפריט נמחק';

  @override
  String get noPlayableTrailerFound => 'לא נמצא טריילר שניתן לשחק.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'רצועת אודיו';

  @override
  String get subtitleTrack => 'רצועת כתוביות';

  @override
  String get none => 'אַף לֹא אֶחָד';

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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'הורדת כתוביות. עשוי לקחת רגע עד שיופיע בזמן שJellyfin מרענן את הפריט.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'בחר גרסה';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'מחק קבצים שהורדת';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'סופרים';

  @override
  String get studio => 'סטוּדִיוֹ';

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
  String get showLess => 'הצג פחות';

  @override
  String get readMore => 'קרא עוד';

  @override
  String get shuffle => 'לְעַרְבֵּב';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'התאמה מושלמת';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'מונו';

  @override
  String get stereo => 'סטריאו';

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
  String get deviceVolume => 'עוצמת הקול של המכשיר';

  @override
  String get unavailable => 'לא זמין';

  @override
  String get pause => 'הַפסָקָה';

  @override
  String get syncPosition => 'מיקום סנכרון';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'התור ריק';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
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
  String get reset => 'אִתחוּל';

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
  String get player => 'נַגָן';

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
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'קצב סיביות של וידאו';

  @override
  String get track => 'מַסלוּל';

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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'עיבוד EPUB בתוך האפליקציה אינו זמין בפלטפורמה זו עדיין.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'עיבוד מסמכים משובצים אינו זמין בפלטפורמה זו.';

  @override
  String get couldNotOpenExternalViewer =>
      'לא ניתן היה לפתוח את המציג החיצוני.';

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
      'עדיין אין סימניות.\nהקש על סמל הסימניה בזמן הקריאה כדי לשמור את המיקום שלך.';

  @override
  String get noTableOfContentsAvailable => 'אין תוכן עניינים זמין';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'מַצָב';

  @override
  String get bookReader => 'קורא ספרים';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'לא נמצאו ערוצים';

  @override
  String get liveBadge => 'לִחיוֹת';

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
  String get watch => 'לִצְפּוֹת';

  @override
  String get close => 'לִסְגוֹר';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'לֹא';

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
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'ביטול הקלטת הסדרה נכשל';

  @override
  String get searchThisLibrary => 'חפש בספרייה זו...';

  @override
  String get searchEllipsis => 'לְחַפֵּשׂ...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'רואה';

  @override
  String get seerrAccountType => 'סוג חשבון רואה';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'אַלבּוֹם';

  @override
  String get playAlbum => 'הפעל אלבום';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'עוֹנָה';

  @override
  String get errorLoadingEpisodes => 'שגיאה בטעינת פרקים';

  @override
  String get noDownloadedEpisodes => 'אין פרקים שהורדו';

  @override
  String get deleteEpisode => 'מחק את הפרק';

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
  String get seriesNotFound => 'סדרה לא נמצאה';

  @override
  String get errorLoadingSeries => 'שגיאה בטעינת הסדרה';

  @override
  String get downloadedEpisodes => 'פרקים שהורדו';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'מבצעים';

  @override
  String get deleteSeason => 'מחק עונה';

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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'מוזיקה וספרי שמע';

  @override
  String get images => 'תמונות';

  @override
  String get database => 'מסד נתונים';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'מוסיקת נושא בשורות הבית';

  @override
  String get playWhenBrowsingHomeScreen => 'הפעל בעת גלישה במסך הבית';

  @override
  String get detailsBackgroundBlur => 'פרטים טשטוש רקע';

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
  String get fit => 'לְהַתְאִים';

  @override
  String get autoCrop => 'חיתוך אוטומטי';

  @override
  String get stretch => 'לִמְתוֹחַ';

  @override
  String get refreshRateSwitching => 'החלפת קצב רענון';

  @override
  String get disabled => 'נָכֶה';

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
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'תור מדיה';

  @override
  String get autoQueueNextEpisodes => 'תור אוטומטית לתור לפרקים הבאים';

  @override
  String get stillWatchingPrompt => 'עדיין צופה ב-Prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
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
  String get showSeerrButton => 'Show Seerr Button';

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
    return '$count selected';
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
  String get mediaBarModeMoonfin => 'סנפיר ירח';

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
  String get perRowImageType => 'סוג תמונה לפי שורה';

  @override
  String get perRowSettings => 'הגדרות לכל שורה';

  @override
  String get autoLogin => 'התחברות אוטומטית';

  @override
  String get lastUser => 'משתמש אחרון';

  @override
  String get currentUser => 'Current User';

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
    return '$minutes min';
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
  String get trakt => 'טראקט';

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
  String get pluginLabel => 'תוסף';

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
    return '$status\nVersion: $version';
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
  String get seerrDiscoveryRows => 'Seerr Discovery Rows';

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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'גלה שורות';

  @override
  String get discoverRowsDescriptionPlugin =>
      'גרור כדי לסדר מחדש. הפעל או השבת שורות. סדר שורות זמין מסתנכרן עם תוסף Moonfin.';

  @override
  String get discoverRowsDescription =>
      'גרור כדי לסדר מחדש. הפעל או השבת שורות.';

  @override
  String get enabled => 'מופעל';

  @override
  String get hidden => 'מוּסתָר';

  @override
  String get aboutTitle => 'אוֹדוֹת';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'רישיונות קוד פתוח';

  @override
  String get sourceCode => 'קוד מקור';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'עדכן הודעות';

  @override
  String get showWhenUpdatesAvailable => 'הצג מתי עדכונים זמינים';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get clear => 'בָּרוּר';

  @override
  String get browse => 'לְדַפדֵף';

  @override
  String get noResults => 'אין תוצאות';

  @override
  String get seerrAvailableStatus => 'זָמִין';

  @override
  String get seerrRequestedStatus => 'התבקש';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'הגדרות רואה';

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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'לִשְׁמוֹר';

  @override
  String get itemNotFoundInLibrary => 'הפריט לא נמצא בספריית Moonfin שלך';

  @override
  String get errorSearchingLibrary => 'שגיאה בחיפוש הספרייה';

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
    return 'age $age';
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
  String get add => 'לְהוֹסִיף';

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
  String get done => 'נַעֲשָׂה';

  @override
  String get edit => 'לַעֲרוֹך';

  @override
  String get encoding => 'הַצפָּנָה';

  @override
  String get error => 'שְׁגִיאָה';

  @override
  String get forward => 'קָדִימָה';

  @override
  String get general => 'כְּלָלִי';

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
  String get next => 'הַבָּא';

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
  String get remote => 'מְרוּחָק';

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
  String get search => 'לְחַפֵּשׂ';

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
  String get stop => 'לְהַפְסִיק';

  @override
  String get streaming => 'נְהִירָה';

  @override
  String get time => 'זְמַן';

  @override
  String get trickplay => 'משחק טריק';

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
  String get mute => 'לְהַשְׁתִיק';

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
  String get adminDrawerTranscoding => 'המרת קידוד';

  @override
  String get adminDrawerResume => 'קוֹרוֹת חַיִים';

  @override
  String get adminDrawerStreaming => 'נְהִירָה';

  @override
  String get adminDrawerTrickplay => 'משחק טריק';

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
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get sessionForward => 'קָדִימָה';

  @override
  String get sessionNext => 'הַבָּא';

  @override
  String get sessionVolumeDown => 'כרך -';

  @override
  String get sessionVolumeUp => 'כרך +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'עכשיו משחק';

  @override
  String get volume => 'כֶּרֶך';

  @override
  String get actions => 'פעולות';

  @override
  String get videoCodec => 'Codec וידאו';

  @override
  String get audioCodec => 'Codec אודיו';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'סִיוּם';

  @override
  String get direct => 'יָשִׁיר';

  @override
  String get adminDisconnect => 'לְנַתֵק';

  @override
  String get adminClearDates => 'תאריכים ברורים';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'מחק מכשיר';

  @override
  String get adminDeviceDeleted => 'המכשיר נמחק';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'שנה את שם הספרייה';

  @override
  String get adminNewName => 'שם חדש';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'מחק ספרייה';

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
  String get adminRemovePath => 'הסר נתיב';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'אפשרויות הספרייה נשמרו';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'נדרש שם הספרייה';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'טעינת המשתמשים נכשלה';

  @override
  String get adminSearchUsers => 'חפש משתמשים';

  @override
  String get adminEditUser => 'ערוך משתמש';

  @override
  String get adminAddUser => 'הוסף משתמש';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'ההרשאות נשמרו';

  @override
  String get adminPasswordsMismatch => 'הסיסמאות אינן תואמות';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get adminResetPasswordWarning =>
      'פעולה זו תסיר את הסיסמה. המשתמש יוכל להיכנס ללא סיסמה.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'אסימון מפתח חסר בתגובת השרת';

  @override
  String get adminRevokeApiKey => 'בטל מפתח API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'מפתח API בוטל';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'יוצר גיבוי...';

  @override
  String get adminBackupCreated => 'הגיבוי נוצר בהצלחה';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'נתיב גיבוי חסר בתגובת השרת';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'אשר שחזור';

  @override
  String get adminRestoringBackup => 'משחזר גיבוי...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'חפש ביומן';

  @override
  String get adminNoMatchingLines => 'אין קווים תואמים';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'לא נמצאו משימות מתוזמנות';

  @override
  String get adminNoTasksMatchFilter => 'אין משימות שתואמות למסנן הנוכחי';

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
  String get adminRunNow => 'הרץ עכשיו';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'יום בשבוע';

  @override
  String get adminSearchPlugins => 'חפש תוספים...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'הסר את ההתקנה של הפלאגין';

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
  String get adminNoPluginsMatchSearch => 'אין תוספים שתואמים לחיפוש שלך';

  @override
  String get adminNoPluginsInstalled => 'לא מותקנים תוספים';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
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
  String get adminMissingAuthToken => 'לא ניתן לפתוח הגדרות: חסר אסימון אישור.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'התוסף לא נמצא';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'לְמָשָׁל Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'כתובת האתר של מאגר';

  @override
  String get adminAddEntry => 'הוסף ערך';

  @override
  String get adminInvalidUrl => 'כתובת אתר לא חוקית';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminTrickplaySaved => 'הגדרות הטריק פליי נשמרו';

  @override
  String get adminTrickplayLoadFailed => 'טעינת הגדרות טריק פליי נכשלה';

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
  String get adminBaseUrlHint => 'לְמָשָׁל /ג\'ליפין';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'חפש אדם מרוחק';

  @override
  String get adminNoRemoteMatches => 'לא נמצאו התאמות מרחוק';

  @override
  String get adminRemoteResults => 'תוצאות מרחוק';

  @override
  String get adminRemoteMetadataApplied => 'הוחלו מטא נתונים מרוחקים';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'עדכן את סוג התוכן';

  @override
  String get adminContentType => 'סוג תוכן';

  @override
  String get adminContentTypeUpdated => 'סוג התוכן עודכן';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'טעינת עורך המטא נתונים נכשלה';

  @override
  String get adminNoPeopleEntries => 'אין כניסות של אנשים';

  @override
  String get adminNoExternalIds => 'אין זיהויים חיצוניים זמינים';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'פורמט תמונה לא נתמך';

  @override
  String get adminImageReadFailed => 'קריאת התמונה שנבחרה נכשלה';

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
  String get adminAllProviders => 'כל הספקים';

  @override
  String get adminNoRemoteImages => 'לא נמצאו תמונות מרוחקות';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'הוסף טיונר';

  @override
  String get adminTunerType => 'סוג טיונר';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, אחר';

  @override
  String get adminUrlPath => 'כתובת URL / נתיב';

  @override
  String get adminNameOptional => 'שם (אופציונלי)';

  @override
  String get adminTunerAdded => 'טיונר נוסף';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'הוסף ספק מדריך';

  @override
  String get adminProviderType => 'סוג ספק';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect או XMLTV';

  @override
  String get adminUsernameOptional => 'שם משתמש (אופציונלי)';

  @override
  String get adminRefreshInterval => 'מרווח רענון (שעות)';

  @override
  String get adminProviderAdded => 'ספק נוסף';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'התבקש איפוס טיונר';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved => 'הגדרות ההקלטה נשמרו';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'הוסף ספק';

  @override
  String get adminNoListingProviders => 'לא הוגדרו ספקי רישום';

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
    return 'Restore backup $name now?';
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
  String get adminApply => 'לִפְנוֹת';

  @override
  String get adminNotSet => 'לא מוגדר';

  @override
  String get adminReset => 'אִתחוּל';

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
  String get adminLogViewerNoMatches => 'אין קווים תואמים';

  @override
  String get adminMetadataEditorTitle => 'עורך מטא נתונים';

  @override
  String get adminMetadataRemote => 'מְרוּחָק';

  @override
  String get adminMetadataType => 'סוּג';

  @override
  String get adminMetadataDetails => 'פרטים';

  @override
  String get adminMetadataExternalIds => 'תעודות זהות חיצוניות';

  @override
  String get adminMetadataImages => 'תמונות';

  @override
  String get adminMetadataFieldTitle => 'כּוֹתֶרֶת';

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
  String get adminMetadataImageReadFailed => 'קריאת התמונה שנבחרה נכשלה';

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
      'זה מסיר את התמונה הנוכחית מהפריט.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'אין חבילות שתואמות את החיפוש שלך';

  @override
  String get adminPluginsCatalogEmpty => 'אין חבילות זמינות';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'הסר מאגר';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'לְהַסִיר';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminPlaybackHwAccel => 'האצת חומרה';

  @override
  String get adminPlaybackHwAccelLabel => 'האצת חומרה';

  @override
  String get adminPlaybackEnableHwEncoding => 'אפשר קידוד חומרה';

  @override
  String get adminPlaybackEnableHwDecoding => 'אפשר פענוח חומרה עבור:';

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
  String get adminTaskStop => 'לְהַפְסִיק';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminActivityNow => 'עַכשָׁיו';

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
      'הגדר יצירת תמונות טריק פליי לחיפוש תמונות ממוזערות של תצוגה מקדימה.';

  @override
  String get adminNetworkingPublicHttpsPort => 'יציאת HTTPS ציבורית';

  @override
  String get adminNetworkingBaseUrl => 'כתובת האתר הבסיסית';

  @override
  String get adminNetworkingBaseUrlHint => 'לְמָשָׁל /ג\'ליפין';

  @override
  String get adminNetworkingHttps => 'HTTPS';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'סף תגובה איטית (ms)';

  @override
  String get adminGeneralCachePath => 'נתיב מטמון';

  @override
  String get adminGeneralMetadataPath => 'נתיב מטא נתונים';

  @override
  String get adminGeneralServerName => 'שם השרת';

  @override
  String get adminSettingsLoadFailed => 'טעינת ההגדרות נכשלה';

  @override
  String get adminDiscover => 'לְגַלוֹת';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'גישת SyncPlay נדחתה';

  @override
  String get syncPlayAccessDeniedMessage =>
      'אין לך גישה לפריט אחד או יותר בקבוצת SyncPlay זו. בקש מבעל הקבוצה לאמת את הרשאות הספרייה או לבחור תור אחר.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
  String get homeScreenSectionsIntegrationDescription =>
      'זיהוי שורות שנחשפו על ידי התוסף \"חלקי מסך הבית\" של IAmParadox27. ניתן להפעיל שורות ולסדר מחדש למטה.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'עדיין אין שרתי Jellyfin שדיווחו על התוסף.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'זיהוי שורות שהוגדרו באמצעות התוסף \"KefinTweaks\" של ranaldsgift. קטעים מותאמים אישית, שפורסמו לאחרונה, צפו שוב, עונתיים ונוספו לאחרונה בספרייה, משתקפים מתצורת KefinTweaks בכל שרת Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'עדיין אין שרתי Jellyfin שמדווחים על KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'פתח את מדור הבית';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'הפעל, השבת וסדר מחדש שורות';

  @override
  String get integrationInstalledButDisabled => 'מותקן אך מושבת';

  @override
  String get integrationNotInstalled => 'לא מותקן';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'השמעה מרחוק';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'עוצמת הקול של המכשיר';

  @override
  String get castVolumeUnavailable => 'לא זמין';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN שגוי';

  @override
  String get pinMismatch => 'מספרי ה-PIN אינם תואמים';

  @override
  String get pinForgot => 'שכחת PIN?';

  @override
  String get pinClear => 'בָּרוּר';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'בקשת חיבור מהיר אושרה.';

  @override
  String get quickConnectInvalidOrExpired =>
      'קוד החיבור המהיר אינו חוקי או שפג תוקפו.';

  @override
  String get quickConnectNotSupported => 'חיבור מהיר אינו נתמך בשרת זה.';

  @override
  String get quickConnectAuthorizeFailed => 'נכשל הרשאה של קוד חיבור מהיר.';

  @override
  String get quickConnectDisabled => 'חיבור מהיר מושבת בשרת זה.';

  @override
  String get quickConnectForbidden =>
      'החשבון שלך לא יכול לאשר בקשת חיבור מהיר זו.';

  @override
  String get quickConnectNotFound => 'קוד חיבור מהיר לא נמצא. נסה קוד חדש.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'הזן קוד';

  @override
  String get quickConnectAuthorize => 'לְאַשֵׁר';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
  String get shuffleLibrary => 'סִפְרִיָה';

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
  String get stillWatchingStop => 'לְהַפְסִיק';

  @override
  String get stillWatchingContinue => 'לְהַמשִׁיך';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'טלוויזיה בשידור חי';

  @override
  String get continueWatchingAndNextUp => 'המשך בצפייה ובהמשך';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get playerTooltipPrevious => 'קוֹדֵם';

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
  String get settingsPrivacyAndSafetySection => 'פרטיות ובטיחות';

  @override
  String get settingsBlockedRatings => 'דירוגים חסומים';

  @override
  String get settingsGeneralStyle => 'סגנון כללי';

  @override
  String get settingsGeneralStyleSubtitle =>
      'הדגשות נושא, תפאורות, מחוונים שנצפו ומוזיקת ​​נושא';

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
      'Show the Seerr button in the navigation bar';

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
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (מורשת)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
  String get enableTunnelingTitle => 'Enable tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Advanced. Routes audio and video through a coupled hardware path. Off by default because it causes audio/video dropouts on some devices.';

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
