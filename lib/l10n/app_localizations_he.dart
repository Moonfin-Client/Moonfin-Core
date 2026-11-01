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
  String get interfaceLanguage => 'שפת הממשק';

  @override
  String get systemLanguageDefault => 'ברירת המחדל של המערכת';

  @override
  String get signIn => 'היכנס';

  @override
  String get signingIn => 'Signing in...';

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
  String get waitingForAuthorization => 'ממתין לאישור...';

  @override
  String get back => 'חזרה';

  @override
  String get serverUnavailable => 'השרת אינו זמין';

  @override
  String get loginFailed => 'הכניסה נכשלה';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

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
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

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
  String get glassQuality => 'איכות הזכוכית';

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
      'אוטומטי בוחר את אפקט הזכוכית הטוב ביותר למכשיר זה. מלא כופה טשטוש אמיתי; מופחת משתמש בזכוכית קלת משקל שחוסכת בצריכת ה-GPU.';

  @override
  String get glassQualityAuto => 'אוטומטי';

  @override
  String get glassQualityFull => 'מלא';

  @override
  String get glassQualityReduced => 'מופחת';

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
      'מעבר בין Moonfin ל-Neon Pulse מבלי להפעיל מחדש את האפליקציה';

  @override
  String get customThemeTitle => 'ערכת נושא מותאמת';

  @override
  String get customThemeSubtitle =>
      'ערכות נושא מותאמות משנות רכיבים חזותיים ברחבי Moonfin. בחר אחת מהאפשרויות כדי להתאים לסגנון שלך.';

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
  String get gameOrientation => 'Game orientation';

  @override
  String get gameOrientationSubtitle =>
      'Screen orientation while playing games';

  @override
  String get landscape => 'Landscape';

  @override
  String get portrait => 'Portrait';

  @override
  String get gameEmulatorSettings => 'הגדרות אמולטור';

  @override
  String get gameNoCoreOptions => 'לליבה זו אין אפשרויות להתאמה.';

  @override
  String get gameHoldToOpenMenu => 'החזק כדי לפתוח את התפריט';

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
  String get apply => 'החל';

  @override
  String get openLink => 'פתח קישור';

  @override
  String get scanWithYourPhone => 'סרוק עם הטלפון שלך';

  @override
  String get audiobookGenres => 'ז\'אנרים של ספרי שמע';

  @override
  String get scrollLeft => 'גלול שמאלה';

  @override
  String get scrollRight => 'גלול ימינה';

  @override
  String get scrollToTop => 'Scroll to top';

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
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

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
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'לא נמצאו ספרים עבור מחבר זה.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

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
  String get additionalParts => 'Additional Parts';

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
  String get castMembers => 'Cast';

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
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

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
  String get starring => 'STARRING';

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
  String get shuffleAll => 'Shuffle All';

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
  String get track => 'רצועה';

  @override
  String get channels => 'ערוצים';

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
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

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
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'ציר זמן מדריך';

  @override
  String failedToLoadGuide(String error) {
    return 'טעינת לוח השידורים נכשלה: $error';
  }

  @override
  String get noChannelsFound => 'לא נמצאו ערוצים';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'לִחיוֹת';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

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
  String get cancelRecordingAction => 'בטל הקלטה';

  @override
  String get programSetToRecord => 'התוכנית נקבעה להקלטה';

  @override
  String get recordingCancelled => 'ההקלטה בוטלה';

  @override
  String get unableToCreateRecording => 'לא ניתן ליצור הקלטה';

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
  String get watch => 'צפה';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'סגור';

  @override
  String failedToPlayChannel(String name) {
    return 'לא ניתן להפעיל את $name';
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
  String get settingsSearchHint => 'Search settings';

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
  String get mixedRowsOnly => 'Mixed rows only';

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
  String get snow => 'שֶׁלֶג';

  @override
  String get fireworks => 'זיקוקים';

  @override
  String get confetti => 'פְּתִיתֵי נִיָר סַסגוֹנִיִם';

  @override
  String get fallingLeaves => 'עלים נושרים';

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
  String get loopThemeMusic => 'נגן מוזיקת נושא בלולאה';

  @override
  String get loopThemeMusicSubtitle => 'חזור על הרצועה במקום לנגן אותה פעם אחת';

  @override
  String get detailsBackgroundBlur => 'פרטים טשטוש רקע';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

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
  String get stretch => 'לִמְתוֹחַ';

  @override
  String get refreshRateSwitching => 'החלפת קצב רענון';

  @override
  String get disabled => 'מושבת';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

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
  String get showDescriptionOnPause => 'הצג תיאור בהשהיה';

  @override
  String get dimVideoShowOverview =>
      'עמעום את הסרטון והצג טקסט סקירה בזמן השהייה';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'לחצן נעילה של OSD';

  @override
  String get osdLockButtonDescription =>
      'הצג לחצן נעילה שחוסם קלט מגע עד ללחיצה ארוכה';

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
  String get settingsAudioFallbackCodec => 'קודק אודיו חלופי';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'בחר את פורמט היעד להמרת אודיו רב-ערוצי כאשר לא ניתן להפעיל את זרם המקור ישירות או להעבירו במעבר.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto => 'זיהוי אוטומטי\n(מומלץ)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(ברירת מחדל)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

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
  String get settingsAudioDtsCorePassthrough => 'מעבר DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'מעבר DTS-HD MA';

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
  String get settingsAudioTrueHdPassthrough => 'מעבר TrueHD';

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
  String get defaultToNoSubtitles => 'ברירת המחדל היא ללא כתוביות';

  @override
  String get turnOffSubtitlesByDefault => 'כבה את הכתוביות כברירת מחדל';

  @override
  String get subtitleSize => 'גודל כתוביות';

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
  String get syncing => 'מסנכרן...';

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
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

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
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'הצג ספריות בסרגל הכלים';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

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
  String get mediaBarMode => 'סגנון בר מדיה';

  @override
  String get mediaBarModeDescription =>
      'בחרו בין סגנונות שונים של סרגל מדיה, או כבו את סרגל המדיה';

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
  String get mediaBarModeOff => 'כבוי';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'הפעל את סרגל המדיה';

  @override
  String get showFeaturedContentSlideshow => 'הצג מצגת תוכן מוצג בבית';

  @override
  String get contentType => 'סוג תוכן';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

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
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

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
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'המדיה האחרונה';

  @override
  String get recentlyReleased => 'שוחרר לאחרונה';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

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
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'אפס לברירות המחדל';

  @override
  String get homeRowPosterSize => 'גודל פוסטר בשורה ביתית';

  @override
  String get configureImageTypeForEachRow =>
      'הגדר את סוג התמונה עבור כל שורת בית מופעלת';

  @override
  String get mergeContinueWatchingAndNextUp => 'מיזוג המשך צפייה והבא';

  @override
  String get combineBothRows => 'שלב את שתי השורות למקטע בית אחד';

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
  String get fullScreenRows => 'שורות מורחבות במסך הבית';

  @override
  String get fullScreenRowsDescription =>
      'הגבל את שורות מסך הבית לשורה אחת לכל מסך';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get displayClockDuringScreensaver => 'הצג שעון במהלך שומר מסך';

  @override
  String get clockModeStatic => 'קבוע';

  @override
  String get clockModeBouncing => 'מקפץ';

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
  String get pluginDetected => 'תוסף זוהה';

  @override
  String get pluginNotDetected => 'תוסף לא זוהה';

  @override
  String get pluginNotDetectedDescription =>
      'תוסף שרת אינו מזוהה כעת. הגדרות מקומיות עדיין משתמשות בערכים השמורים או בברירות המחדל המובנות שלהן.';

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
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'שורות גילוי של Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

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
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

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
  String get featuredContentAppearance => 'תוכן מומלץ, מראה';

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
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'בַּקָשָׁה';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'בטל את הבקשה';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'שחקו ב- Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'התבקש על ידי $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

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
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'שלח בקשה';

  @override
  String get allSeasons => 'כל העונות';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

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
  String get adminLibraryLoadFailed => 'טעינת הספרייה נכשלה';

  @override
  String get adminNoMediaPaths => 'לא הוגדרו נתיבי מדיה';

  @override
  String get adminAddPath => 'הוסף נתיב';

  @override
  String get adminBrowseFilesystem => 'עיין במערכת הקבצים של השרת:';

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
  String adminSaveFailed(String error) {
    return 'השמירה נכשלה: $error';
  }

  @override
  String get adminPasswordsMismatch => 'הסיסמאות אינן תואמות';

  @override
  String adminFailed(String error) {
    return 'נכשל: $error';
  }

  @override
  String get adminUserLoadFailed => 'טעינת המשתמש נכשלה';

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
  String get adminEnableAllLibraryAccess => 'אפשר גישה לכל הספריות';

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
  String get adminPlaybackLoadFailed => 'טעינת הגדרות ההשמעה נכשלה';

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
  String adminMetadataLoadFailed(String error) {
    return 'טעינת המטא נתונים נכשלה: $error';
  }

  @override
  String get adminRefreshMetadata => 'רענן מטא נתונים';

  @override
  String get recursive => 'רקורסיבי';

  @override
  String get adminReplaceAllMetadata => 'החלף את כל המטא נתונים';

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
  String get adminEnableAllTuners => 'הפעל את כל הטיונרים';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'הסרת הטיונר נכשלה: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'הסרת הספק נכשלה: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'נתיב הקלטת סדרה';

  @override
  String get adminMovieRecordingPath => 'נתיב הקלטת סרטים';

  @override
  String get adminGuideDaysAuto => 'אוטומטי';

  @override
  String get adminRecordingPostProcessor => 'נתיב יישום לעיבוד מאוחר';

  @override
  String get adminRecordingPostProcessorArgs => 'ארגומנטים לעיבוד מאוחר';

  @override
  String get adminSaveRecordingNfo => 'שמור מטא נתוני NFO של ההקלטה';

  @override
  String get adminSaveRecordingImages => 'שמור תמונות של ההקלטה';

  @override
  String get adminLiveTvSectionPaths => 'נתיבי הקלטה';

  @override
  String get adminLiveTvSectionPostProcessing => 'עיבוד מאוחר';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'שמירת ההגדרות נכשלה: $error';
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
  String get adminGuideRefreshStarted => 'רענון נתוני המדריך התחיל';

  @override
  String get adminGuideRefreshUnavailable =>
      'משימת רענון המדריך אינה זמינה בשרת זה.';

  @override
  String get adminNoListingProviders => 'לא הוגדרו ספקי רישום';

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
  String get adminBackupsTitle => 'גיבויים';

  @override
  String get adminUnknownDate => 'תאריך לא ידוע';

  @override
  String get adminUnnamedBackup => 'ללא שם גיבוי';

  @override
  String get adminApply => 'החל';

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
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'קו תג';

  @override
  String get adminMetadataFieldOverview => 'סקירה כללית';

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
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults => 'אין תוספים שתואמים לחיפוש שלך';

  @override
  String get adminPluginsNoneInstalled => 'לא מותקנים תוספים';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

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
  String get adminNetworkingEnableHttps => 'הפעל HTTPS';

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
  String get adminPlaybackQsvDevice => 'התקן QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'הפעל מפענח NVDEC משופר';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'העדף מפענח חומרה מובנה של המערכת';

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
  String get adminNetworkingPublicHttpPort => 'יציאת HTTP ציבורית';

  @override
  String get adminNetworkingRequireHttps => 'דרוש HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'הפנה את כל הבקשות המרוחקות ל-HTTPS. אין לכך השפעה אם לשרת אין תעודה תקפה.';

  @override
  String get adminNetworkingCertPassword => 'סיסמת התעודה';

  @override
  String get adminNetworkingEnableIpv4 => 'הפעל IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'הפעל IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'רשתות LAN';

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
  String get kidsMode => 'Kids Mode';

  @override
  String get kidsModeSubtitle =>
      'Simplify the app and lock the way out with a PIN';

  @override
  String get kidsModeExit => 'Exit Kids Mode';

  @override
  String get kidsModeExitSubtitle => 'Enter your PIN to restore the full app';

  @override
  String get pinIncorrect => 'PIN שגוי';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

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
  String get trackActionViewDetails => 'View Details';

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
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

  @override
  String get settingsAdministrationSubtitle => 'גש ללוח ניהול השרת';

  @override
  String get settingsDynamicContent => 'תוכן דינמי';

  @override
  String get settingsDynamicContentSubtitle => 'סרגל מדיה ושכבות-על חזותיות';

  @override
  String get settingsAboutSubtitle => 'גרסת האפליקציה, מידע משפטי וקרדיטים';

  @override
  String get settingsSortServersBy => 'מיין שרתים לפי';

  @override
  String get settingsLastUsed => 'בשימוש אחרון';

  @override
  String get settingsAlphabetical => 'אָלֶף בֵּיתִי';

  @override
  String get settingsAllowSelfSignedCerts => 'אפשר תעודות בחתימה עצמית';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'תן אמון בשרתים המשתמשים בתעודות TLS בחתימה עצמית או מרשות אישורים פרטית. הפעל רק עבור שרתים שבשליטתך. פעולה זו משביתה את אימות התעודות בכל החיבורים.';

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
  String get settingsHomePage => 'עמוד הבית';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

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
  String get settingsBoth => 'שְׁנֵיהֶם';

  @override
  String get settingsShuffleContentTypeFilter => 'ערבב מסנן סוג תוכן';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'אפשרויות רצועות אודיו, עיבוד ומעבר';

  @override
  String get settingsAutomationAndQueueSubtitle => 'השמעה ורצף אוטומטיים';

  @override
  String get settingsSyncplaySubtitle => 'היגיון סנכרון למפגשים קבוצתיים';

  @override
  String get settingsSkipIntrosAndOutros => 'לדלג על Intros ו-Outros?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'ספירה לאחור של מקטע מדיה';

  @override
  String get settingsProgressBar => 'סרגל התקדמות';

  @override
  String get settingsTimer => 'טיימר';

  @override
  String get settingsNone => 'ללא';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv (מורשת)';

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
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

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
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

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
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

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
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'קלאסי שומר על סוג תמונה ושכבת מידע לכל שורה. מודרני משתמש בשורות מפוסטר לתמונת רקע.';

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
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

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
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'פריטים בשורות הז\'אנרים';

  @override
  String get genresRowItemsDescription =>
      'הצג סרטים, סדרות או שניהם בשורות הז\'אנרים.';

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
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'העברה ישירה';

  @override
  String get supportedOnThisDevice => 'נתמך במכשיר זה';

  @override
  String get notSupportedOnThisDevice => 'לא נתמך במכשיר זה';

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
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'פתח הפעלת וידאו באפליקציה החיצונית שבחרת ב-Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'הוספה אוטומטית לתור';

  @override
  String get preferSdhSubtitles => 'העדף כתוביות SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'תעדף רצועות כתוביות SDH/CC בבחירה אוטומטית.';

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
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'צפה עם קבוצה';

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
  String get disk => 'דיסק';

  @override
  String get openInBrowser => 'פתח בדפדפן';

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
  String get homeVideos => 'סרטוני בית';

  @override
  String get mixedContent => 'תוכן מעורב';

  @override
  String get homeVideosAndPhotos => 'סרטוני בית ותמונות';

  @override
  String get mixedMoviesAndShows => 'סרטים וסדרות מעורבים';

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
  String get audiobookFocusedTimeline => 'ציר זמן ממוקד';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

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
  String get replay => 'הפעל שוב';

  @override
  String get fileInformation => 'פרטי הקובץ';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'גודל: $size  •  פורמט: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
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
  String get sortAlphabetical => 'לפי סדר האלפבית';

  @override
  String get sortReleaseAscending => 'סדר יציאה (מהישן לחדש)';

  @override
  String get sortReleaseDescending => 'סדר יציאה (מהחדש לישן)';

  @override
  String get sortCustomDragDrop => 'מותאם אישית (גרירה ושחרור)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

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
  String get integrations => 'אינטגרציות';

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
