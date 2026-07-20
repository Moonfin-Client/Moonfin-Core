// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'ගිණුම් මනාප';

  @override
  String get interfaceLanguage => 'අතුරුමුහුණතේ භාෂාව';

  @override
  String get systemLanguageDefault => 'පද්ධතියේ පෙරනිමිය';

  @override
  String get signIn => 'පුරන්න';

  @override
  String get empty => 'හිස්';

  @override
  String connectingToServer(String serverName) {
    return '$serverName වෙත සම්බන්ධ වෙමින්';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'මුරපදය';

  @override
  String get username => 'පරිශීලක නාමය';

  @override
  String get email => 'ඊමේල් කරන්න';

  @override
  String get quickConnectInstruction =>
      'ඔබගේ සේවාදායකයේ වෙබ් උපකරණ පුවරුවේ මෙම කේතය ඇතුලත් කරන්න:';

  @override
  String get waitingForAuthorization => 'අවසරය සඳහා රැඳී සිටිමින්...';

  @override
  String get back => 'ආපසු';

  @override
  String get serverUnavailable => 'සේවාදායකය නොමැත';

  @override
  String get loginFailed => 'ඇතුළු වීම අසාර්ථක විය';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect ලබා ගත නොහැක: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect ලබා ගත නොහැක ($status): $detail';
  }

  @override
  String get whosWatching => 'කවුද බලන්නේ?';

  @override
  String get addUser => 'පරිශීලක එකතු කරන්න';

  @override
  String get selectServer => 'සේවාදායකය තෝරන්න';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin අනුවාදය $version';
  }

  @override
  String get savedServers => 'සුරකින ලද සේවාදායකයන්';

  @override
  String get discoveredServers => 'සොයාගත් සේවාදායකයන්';

  @override
  String get noneFound => 'කිසිවක් හමු නොවීය';

  @override
  String get unableToConnectToServer => 'සේවාදායකයට සම්බන්ධ වීමට නොහැකි විය';

  @override
  String get addServer => 'සේවාදායකය එක් කරන්න';

  @override
  String get embyConnect => 'Emby සම්බන්ධ කරන්න';

  @override
  String get removeServer => 'සේවාදායකය ඉවත් කරන්න';

  @override
  String removeServerConfirmation(String serverName) {
    return 'ඔබේ සේවාදායක අතරින් \"$serverName\" ඉවත් කරන්නද?';
  }

  @override
  String get cancel => 'අවලංගු කරන්න';

  @override
  String get remove => 'ඉවත් කරන්න';

  @override
  String get connectToServer => 'සේවාදායකයට සම්බන්ධ කරන්න';

  @override
  String get serverAddress => 'සේවාදායක ලිපිනය';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'සම්බන්ධ කරන්න';

  @override
  String get secureStorageUnavailable => 'ආරක්ෂිත ගබඩාව නොමැත';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin හට ඔබගේ පද්ධති යතුරුකරණයට ප්‍රවේශ විය නොහැක. පුරනය දිගටම කරගෙන යා හැක, නමුත් යතුර අගුලු හරින තෙක් ආරක්ෂිත ටෝකන ගබඩාව නොතිබිය හැක.';

  @override
  String get ok => 'හරි';

  @override
  String get settingsAppearanceTheme => 'යෙදුම් තේමාව';

  @override
  String get detailScreenStyle => 'විස්තර තිරයේ විලාසය';

  @override
  String get detailScreenStyleSubtitle =>
      'සම්භාව්‍ය යනු Moonfin හි මුල් මධ්‍යගත සැකැස්මයි. නවීන යනු ප්‍රතිචාරාත්මක සිනමාත්මක සැකැස්මකි.';

  @override
  String get detailScreenStyleMoonfin => 'සම්භාව්‍ය';

  @override
  String get detailScreenStyleModern => 'නවීන';

  @override
  String get expandedTabs => 'විස්තීරණ ටැබ';

  @override
  String get expandedTabsSubtitle =>
      'ටැබ පිරික්සන විට ටැබයේ අන්තර්ගතය ස්වයංක්‍රීයව පෙන්වයි. එක් එක් ටැබය අතින් විවෘත කර වැසීමට මෙය ක්‍රියාවිරහිත කරන්න.';

  @override
  String get showTechnicalDetails => 'තාක්ෂණික විස්තර පෙන්වන්නද?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'බැනර සාරාංශයේ කෝඩෙක්, විභේදනය සහ ප්‍රවාහ තොරතුරු පෙන්වන්න';

  @override
  String get recommendationSystem => 'නිර්දේශ පද්ධතිය';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin නිර්දේශ නම් දේශීය පුස්තකාල ඇල්ගොරිතමය හෝ මාර්ගගත TMDb සමානතා මිතික භාවිත කරන්න. සටහන: මාර්ගගත නිර්දේශ සඳහා Seerr ඒකාබද්ධතාව අවශ්‍ය වේ.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin නිර්දේශ';

  @override
  String get recommendationSystemTmdb => 'TMDb සමානතාව';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'මාපිය ශ්‍රේණිගත සීමාව යොදන්නද?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'ඉලක්ක මාධ්‍යයේ මාපිය ශ්‍රේණිගත කිරීම අනුව Moonfin නිර්දේශ යෝජනා සීමා කරන්න';

  @override
  String get interfaceStyle => 'අතුරුමුහුණතේ විලාසය';

  @override
  String get interfaceStyleSubtitle =>
      'ස්වයංක්‍රීය යනු ඔබේ උපාංගයට ගැළපෙන පෙනුමයි. නිශ්චිත පෙනුමක් බලාත්මක කිරීමට Apple හෝ Material තෝරන්න.';

  @override
  String get interfaceStyleAutomatic => 'ස්වයංක්‍රීය';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'වීදුරු ගුණාත්මකභාවය';

  @override
  String get glassQualitySubtitle =>
      'ස්වයංක්‍රීය මඟින් මෙම උපාංගයට හොඳම වීදුරු ප්‍රයෝගය තෝරයි. සම්පූර්ණ මඟින් සැබෑ බොඳ කිරීම බලාත්මක කරයි; අඩු කළ මඟින් GPU බලය ඉතිරි කරන සැහැල්ලු වීදුරුවක් භාවිත කරයි.';

  @override
  String get glassQualityAuto => 'ස්වයංක්‍රීය';

  @override
  String get glassQualityFull => 'සම්පූර්ණ';

  @override
  String get glassQualityReduced => 'අඩු කළ';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'යෙදුම නැවත ආරම්භ නොකර Moonfin සහ Neon Pulse අතර මාරු වන්න';

  @override
  String get customThemeTitle => 'අභිරුචි තේමාව';

  @override
  String get customThemeSubtitle =>
      'අභිරුචි තේමා Moonfin පුරා දෘශ්‍ය අංග වෙනස් කරයි. ඔබේ විලාසයට ගැළපෙන විකල්පයක් තෝරන්න.';

  @override
  String get keyboardPreferSystemIme => 'පද්ධති යතුරුපුවරුවට මුල් තැන දෙන්න';

  @override
  String get keyboardPreferSystemImeDescription =>
      'පෙළ ඇතුළත් කිරීම සඳහා පෙරනිමියෙන් ඔබේ උපාංගයේ ආදාන ක්‍රමය භාවිත කරන්න';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'වත්මන් Moonfin පෙනුම ඔබ සියලු දෙනාටම ආදරය කර ඇත';

  @override
  String get themeNeonPulse => 'නියොන් ස්පන්දනය';

  @override
  String get themeNeonPulseSubtitle =>
      'මැජෙන්ටා දිලිසීම, සයන් පෙළ සහ ශක්තිමත් ක්‍රෝම් ප්‍රතිවිරෝධය සහිත සින්ත්වේව් මෝස්තරය';

  @override
  String get themeGlass => 'වීදුරු';

  @override
  String get themeGlassSubtitle =>
      'ගලා යන අනුක්‍රමික පසුබිමක්, තුහින තලයන් සහ Apple-නිල් අවධාරකයක් සහිත ද්‍රව-වීදුරු විලාසය';

  @override
  String get theme8BitHero => '8-bit වීරයා';

  @override
  String get theme8BitHeroSubtitle =>
      'ඝන වර්ණාවලියක්, කොටස්-හැඩැති මායිම්, තද සෙවනැලි සහ පික්සල අකුරු සහිත රෙට්‍රෝ පික්සල-කලා විලාසය';

  @override
  String get embyConnectSignInSubtitle => 'ඔබගේ Emby Connect ගිණුමෙන් පුරන්න';

  @override
  String get emailOrUsername => 'ඊමේල් හෝ පරිශීලක නාමය';

  @override
  String get selectAServer => 'සේවාදායකයක් තෝරන්න';

  @override
  String get tryAgain => 'නැවත උත්සාහ කරන්න';

  @override
  String get noLinkedServers =>
      'මෙම Emby Connect ගිණුමට කිසිදු සේවාදායකයක් සම්බන්ධ කර නොමැත';

  @override
  String get invalidEmbyConnectCredentials =>
      'වලංගු නොවන Emby Connect අක්තපත්‍ර';

  @override
  String get invalidEmbyConnectLogin =>
      'වලංගු නොවන Emby Connect පරිශීලක නාමය හෝ මුරපදය';

  @override
  String get embyConnectExchangeNotSupported =>
      'සේවාදායකය Emby Connect හුවමාරුවට සහය නොදක්වයි';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect හෝ තෝරාගත් සේවාදායකය සම්බන්ධ කර ගැනීමේදී ජාල දෝෂයකි';

  @override
  String get loadingLinkedServers => 'සම්බන්ධිත සේවාදායකයන් පූරණය කරමින්...';

  @override
  String get connectingToServerEllipsis => 'සේවාදායකයට සම්බන්ධ වෙමින්...';

  @override
  String get noReachableAddress => 'ළඟා විය හැකි ලිපිනයක් සපයා නැත';

  @override
  String get invalidServerExchangeResponse =>
      'සේවාදායක හුවමාරු අන්ත ලක්ෂ්‍යයෙන් වලංගු නොවන ප්‍රතිචාරයක්';

  @override
  String unableToConnectTo(String target) {
    return '$target වෙත සම්බන්ධ විය නොහැක';
  }

  @override
  String get exitApp => 'Moonfin වෙතින් පිටවන්නද?';

  @override
  String get exitAppConfirmation => 'ඔබට පිටවීමට අවශ්‍ය බව විශ්වාසද?';

  @override
  String get exit => 'පිටවෙන්න';

  @override
  String get gameMenu => 'මෙනුව';

  @override
  String get gamePaused => 'විරාම කර ඇත';

  @override
  String get gameSaveState => 'තත්ත්වය සුරකින්න';

  @override
  String get games => 'ක්‍රීඩා';

  @override
  String get gameLoadState => 'තත්ත්වය පූරණය කරන්න';

  @override
  String get gameFastForward => 'වේගයෙන් ඉදිරියට';

  @override
  String get gameEmulatorSettings => 'අනුකාරක සැකසීම්';

  @override
  String get gameNoCoreOptions => 'මෙම කෝරයෙහි සකස් කළ හැකි විකල්ප නොමැත.';

  @override
  String get gameHoldToOpenMenu => 'මෙනුව විවෘත කිරීමට තදින් අල්ලාගෙන සිටින්න';

  @override
  String get gamePlaybackUnsupported =>
      'මෙම උපාංගයේ ක්‍රීඩා ධාවනයට තවම සහාය නොදක්වයි.';

  @override
  String get noHomeRowsLoaded => 'මුල් පේළි කිසිවක් පූරණය කළ නොහැක';

  @override
  String get noHomeRowsHint =>
      'සක්‍රිය නිවාස කොටස් නැවුම් කිරීමට හෝ අඩු කිරීමට උත්සාහ කරන්න.';

  @override
  String get retryHomeRows => 'මුල් පේළි නැවත උත්සාහ කරන්න';

  @override
  String get guide => 'මාර්ගෝපදේශකය';

  @override
  String get recordings => 'පටිගත කිරීම්';

  @override
  String get schedule => 'කාලසටහන';

  @override
  String get series => 'කතාමාලා';

  @override
  String get noItemsFound => 'අයිතම කිසිවක් හමු නොවීය';

  @override
  String get home => 'මුල් පිටුව';

  @override
  String get browseAll => 'සියල්ල බ්‍රවුස් කරන්න';

  @override
  String get genres => 'ප්‍රභේද';

  @override
  String get collectionPlaceholder => 'එකතු කිරීමේ අයිතම මෙහි දිස් වනු ඇත';

  @override
  String get browseByLetter => 'අකුරින් බ්‍රවුස් කරන්න';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'අකාරාදී බ්‍රවුස් මෙහි දිස්වනු ඇත';

  @override
  String get suggestions => 'යෝජනා';

  @override
  String get suggestionsPlaceholder => 'යෝජිත අයිතම මෙහි දිස් වනු ඇත';

  @override
  String get failedToLoadLibraries => 'පුස්තකාල පූරණය කිරීමට අසමත් විය';

  @override
  String get noLibrariesFound => 'පුස්තකාල හමු නොවීය';

  @override
  String get library => 'පුස්තකාලය';

  @override
  String get displaySettings => 'සංදර්ශක සැකසුම්';

  @override
  String get allGenres => 'සියලුම වර්ග';

  @override
  String get noGenresFound => 'ප්‍රභේද හමු නොවිණි';

  @override
  String failedToLoadFolderError(String error) {
    return 'ෆෝල්ඩරය පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get thisFolderIsEmpty => 'මෙම ෆෝල්ඩරය හිස් ය';

  @override
  String itemCountLabel(int count) {
    return 'අයිතම $count';
  }

  @override
  String get failedToLoadFavorites => 'ප්‍රියතමයන් පූරණය කිරීමට අසමත් විය';

  @override
  String get retry => 'නැවත උත්සාහ කරන්න';

  @override
  String get noFavoritesYet => 'තවමත් ප්‍රියතමයන් නැත';

  @override
  String get favorites => 'ප්රියතම';

  @override
  String totalCountItems(int count) {
    return 'අයිතම $count';
  }

  @override
  String get continuing => 'දිගටම කරගෙන යනවා';

  @override
  String get ended => 'අවසන්';

  @override
  String get sortAndFilter => 'වර්ග කිරීම සහ පෙරීම';

  @override
  String get type => 'ටයිප් කරන්න';

  @override
  String get sortBy => 'අනුව තෝරන්න';

  @override
  String get display => 'ප්රදර්ශනය කරන්න';

  @override
  String get imageType => 'රූප වර්ගය';

  @override
  String get posterSize => 'පෝස්ටර් ප්රමාණය';

  @override
  String get small => 'කුඩා';

  @override
  String get medium => 'මධ්යම';

  @override
  String get large => 'විශාල';

  @override
  String get extraLarge => 'අති විශාල';

  @override
  String libraryGenresTitle(String name) {
    return '$name — ප්‍රභේද';
  }

  @override
  String get views => 'දසුන්';

  @override
  String get albums => 'ඇල්බම';

  @override
  String get albumArtists => 'ඇල්බම කලාකරුවන්';

  @override
  String get artists => 'කලාකරුවන්';

  @override
  String get bookmarks => 'පිටු සලකුණු';

  @override
  String get noSavedBookmarks =>
      'මෙම මාතෘකාව සඳහා තවමත් සුරැකි පිටු සලකුණු නොමැත.';

  @override
  String get openBook => 'විවෘත පොත';

  @override
  String get chapter => 'පරිච්ඡේදය';

  @override
  String get page => 'පිටුව';

  @override
  String get bookmark => 'පිටු සලකුණ';

  @override
  String get justNow => 'මේ දැන්';

  @override
  String minutesAgo(int count) {
    return 'මිනි. $countකට පෙර';
  }

  @override
  String hoursAgo(int count) {
    return 'පැය $countකට පෙර';
  }

  @override
  String daysAgo(int count) {
    return 'දින $countකට පෙර';
  }

  @override
  String get discoverySubjects => 'සොයාගැනීම් විෂයයන්';

  @override
  String get pickDiscoverySubjects =>
      'Discover හි පෙන්විය යුතු විෂය සංග්‍රහ තෝරන්න.';

  @override
  String get apply => 'යොදන්න';

  @override
  String get openLink => 'සබැඳිය විවෘත කරන්න';

  @override
  String get scanWithYourPhone => 'ඔබගේ දුරකථනයෙන් ස්කෑන් කරන්න';

  @override
  String get audiobookGenres => 'ශ්‍රව්‍ය පොත් ප්‍රභේද';

  @override
  String get pickAudiobookGenres =>
      'Audiobook Discover හි පෙන්විය යුතු ප්‍රභේද තෝරන්න.';

  @override
  String get discoverAudiobooks => 'ශ්‍රව්‍ය පොත් සොයා ගන්න';

  @override
  String get librivoxDescription =>
      'LibriVox වෙතින් ජනප්‍රිය පොදු වසම් මාතෘකා.';

  @override
  String titlesCount(int count) {
    return 'මාතෘකා $count';
  }

  @override
  String get scrollLeft => 'වමට අනුචලනය කරන්න';

  @override
  String get scrollRight => 'දකුණට අනුචලනය කරන්න';

  @override
  String get couldNotLoadGenre => 'මෙම ප්‍රභේදය දැන් පූරණය කළ නොහැක.';

  @override
  String get continueReading => 'දිගටම කියවන්න';

  @override
  String get savedHighlights => 'සුරැකි උද්දීපනය';

  @override
  String get continueListening => 'දිගටම සවන් දෙන්න';

  @override
  String get listen => 'සවන් දෙන්න';

  @override
  String get resume => 'දිගටම කරගෙන යන්න';

  @override
  String get failedToLoadLibrary => 'පුස්තකාලය පූරණය කිරීමට අසමත් විය';

  @override
  String get popularNow => 'දැන් ජනප්‍රියයි';

  @override
  String get savedForLater => 'පසුව සඳහා සුරැකිණි';

  @override
  String get topListens => 'ඉහළම සවන්දෙන්නන්';

  @override
  String get unreadDiscoveries => 'නොකියවූ සොයාගැනීම්';

  @override
  String get pickUpAgain => 'නැවත ලබාගන්න';

  @override
  String get bookHighlightsDescription =>
      'උද්දීපනය, ප්‍රියතමයන් හෝ කියවීමේ ප්‍රගතිය සහිත ඔබේ පොත්.';

  @override
  String get handPickedFromLibrary => 'ඔබගේ පුස්තකාලයෙන් අතින් තෝරා ගන්නා ලදී.';

  @override
  String get handPickedFromListeningQueue =>
      'ඔබගේ සවන්දීමේ පෝලිමෙන් අතින් තෝරා ගන්නා ලදී.';

  @override
  String get booksWithHighlights =>
      'උද්දීපනය, ප්‍රියතමයන් හෝ කියවීමේ ප්‍රගතිය සහිත පොත්.';

  @override
  String get jumpBackNarration =>
      'ඔබේ ස්ථානය සඳහා දඩයම් නොකර නැවත ආඛ්‍යානය වෙත පනින්න.';

  @override
  String get unreadBooksReady => 'ඊළඟ නිහඬ පැය සඳහා නොකියවූ පොත් සූදානම්.';

  @override
  String get quickAccessFavorites => 'ඔබ නැවත එන පොත් වෙත ඉක්මන් ප්‍රවේශය.';

  @override
  String get searchAudiobooks => 'ඕඩියෝ පොත් සොයන්න';

  @override
  String get searchYourLibrary => 'ඔබේ පුස්තකාලය සොයන්න';

  @override
  String get pickUpStory => 'ඔයා නවත්තපු තැනින් කතාව ගන්න';

  @override
  String get savedPlacesChapters => 'ඔබගේ සුරැකි ස්ථාන සහ නිම නොකළ පරිච්ඡේද';

  @override
  String authorsCount(int count) {
    return 'කතුවරුන් $count';
  }

  @override
  String genresCount(int count) {
    return 'ප්‍රභේද $count';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% සම්පූර්ණයි';
  }

  @override
  String get readyWhenYouAre => 'ඔබ සිටින විට සූදානම්';

  @override
  String get details => 'විස්තර';

  @override
  String get listeningRoom => 'සවන්දීමේ කාමරය';

  @override
  String get bookmarksAndProgress => 'පිටු සලකුණු සහ ප්‍රගතිය';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'කියවීම මුල් කරගත් පිරික්සීම සඳහා සකසන ලද මාතෘකා $countක්.';
  }

  @override
  String get titles => 'මාතෘකා';

  @override
  String get allTitles => 'සියලුම මාතෘකා';

  @override
  String get authors => 'කතුවරුන්';

  @override
  String get browseByAuthor => 'කර්තෘ විසින් පිරික්සන්න';

  @override
  String get browseByGenre => 'ප්‍රභේදය අනුව බ්‍රවුස් කරන්න';

  @override
  String get discover => 'සොයා ගන්න';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library සිට විෂය අනුව නැඟී එන මාතෘකා.';

  @override
  String get noBookmarkedItems => 'තවමත් පිටු සලකුණු කළ අයිතම නැත';

  @override
  String get nothingMatchesSection =>
      'මෙම කොටසට තවමත් කිසිවක් ගැලපෙන්නේ නැත. වෙනත් ටැබයක් උත්සාහ කරන්න හෝ පුස්තකාල සමමුහුර්ත කිරීම අවසන් වූ පසු ආපසු එන්න.';

  @override
  String get audiobooks => 'ශ්රව්ය පොත්';

  @override
  String noLabelFound(String label) {
    return '$label හමු නොවීය';
  }

  @override
  String get folder => 'ෆෝල්ඩරය';

  @override
  String get filters => 'පෙරහන්';

  @override
  String get readingStatus => 'කියවීමේ තත්ත්වය';

  @override
  String get playedStatus => 'වාදනය කළ තත්ත්වය';

  @override
  String get readStatus => 'කියවන්න';

  @override
  String get watched => 'නරඹා ඇත';

  @override
  String get unread => 'නොකියවූ';

  @override
  String get unwatched => 'නරඹා නැත';

  @override
  String get seriesStatus => 'මාලාවේ තත්ත්වය';

  @override
  String get allLibraries => 'සියලුම පුස්තකාල';

  @override
  String get books => 'පොත්';

  @override
  String get latestBooks => 'නවතම පොත්';

  @override
  String get latestAudiobooks => 'නවතම ශ්‍රව්‍ය පොත්';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'පොත් $count',
      one: 'පොත 1',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'පොත';

  @override
  String get bookFormatAudiobook => 'ශ්‍රව්‍ය පොත';

  @override
  String bookPercentRead(int percent) {
    return '$percent% කියවා ඇත';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time ඉතිරියි';
  }

  @override
  String get bookHeroRead => 'කියවන්න';

  @override
  String get bookHeroListen => 'අසන්න';

  @override
  String get author => 'කර්තෘ';

  @override
  String get unknownAuthor => 'නොදන්නා කර්තෘ';

  @override
  String get uncategorized => 'වර්ගීකරණය නොකළ';

  @override
  String get overview => 'දළ විශ්ලේෂණය';

  @override
  String get noLibrivoxDescription =>
      'මෙම මාතෘකාව සඳහා තවමත් LibriVox විසින් විස්තරයක් සපයා නැත.';

  @override
  String get readers => 'පාඨකයින්';

  @override
  String get openLinks => 'සබැඳි විවෘත කරන්න';

  @override
  String get librivoxPage => 'LibriVox පිටුව';

  @override
  String get internetArchive => 'අන්තර්ජාල ලේඛනාගාරය';

  @override
  String get rssFeed => 'RSS සංග්‍රහය';

  @override
  String get downloadZip => 'Zip බාගන්න';

  @override
  String sectionCountLabel(int count) {
    return 'කොටස් $count';
  }

  @override
  String firstPublished(int year) {
    return 'මුලින්ම ප්‍රකාශිත $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'මෙම මාතෘකාව සඳහා තවමත් Open Library වෙතින් දළ විශ්ලේෂණයක් නොමැත.';

  @override
  String get subjects => 'විෂයන්';

  @override
  String get all => 'සියල්ල';

  @override
  String booksCount(int count) {
    return 'පොත් $count';
  }

  @override
  String get couldNotLoadSubject => 'මෙම විෂය දැන් පූරණය කළ නොහැක.';

  @override
  String get audiobookDetails => 'Audiobook විස්තර';

  @override
  String authorsCountTitle(int count) {
    return 'කතුවරුන් $count';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ශ්‍රව්‍ය පොත් $count',
      one: 'ශ්‍රව්‍ය පොත 1',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'ධාවන ලැයිස්තුව';

  @override
  String get itemListPlaceholder => 'අයිතම ලැයිස්තුව මෙහි දිස්වනු ඇත';

  @override
  String get failedToLoad => 'පූරණය කිරීමට අසමත් විය';

  @override
  String get delete => 'මකන්න';

  @override
  String get save => 'සුරකින්න';

  @override
  String get moreLikeThis => 'තවත් මේ වගේ';

  @override
  String get castAndCrew => 'රංගන ශිල්පීන් සහ කණ්ඩායම';

  @override
  String get collection => 'එකතුව';

  @override
  String get episodes => 'කථාංග';

  @override
  String get nextUp => 'ඊළඟට';

  @override
  String get seasons => 'වාර';

  @override
  String get chapters => 'පරිච්ඡේද';

  @override
  String get features => 'විශේෂාංග';

  @override
  String get movies => 'චිත්රපට';

  @override
  String get musicVideos => 'සංගීත වීඩියෝ';

  @override
  String get other => 'වෙනත්';

  @override
  String get discography => 'ඩිස්කෝග්‍රැෆි';

  @override
  String get similarArtists => 'සමාන කලාකරුවන්';

  @override
  String get tableOfContents => 'අන්තර්ගත වගුව';

  @override
  String get tracklist => 'ධාවන ලැයිස්තුව';

  @override
  String discNumber(int number) {
    return 'තැටිය $number';
  }

  @override
  String get biography => 'චරිතාපදානය';

  @override
  String get authorDetails => 'කර්තෘ විස්තර';

  @override
  String get noOverviewAvailable =>
      'මෙම මාතෘකාව සඳහා තවමත් දළ විශ්ලේෂණයක් නොමැත.';

  @override
  String get noBiographyAvailable => 'මෙම කතුවරයා සඳහා චරිතාපදානයක් නොමැත.';

  @override
  String get noBooksFound => 'මෙම කතුවරයා සඳහා පොත් කිසිවක් හමු නොවීය.';

  @override
  String get unableToLoadAuthorDetails => 'දැන් කර්තෘ විස්තර පූරණය කළ නොහැක.';

  @override
  String published(int year) {
    return 'ප්‍රකාශිත $year';
  }

  @override
  String get publicationDateUnknown => 'ප්‍රකාශන දිනය නොදනී';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'වාර $count',
      one: 'වාරය 1',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$timeට අවසන් වේ';
  }

  @override
  String get items => 'අයිතම';

  @override
  String get extras => 'අමතර';

  @override
  String get behindTheScenes => 'තිර පිටුපස';

  @override
  String get deletedScenes => 'ඉවත් කළ දර්ශන';

  @override
  String get featurettes => 'විශේෂාංග';

  @override
  String get interviews => 'සම්මුඛ සාකච්ඡා';

  @override
  String get scenes => 'දර්ශන';

  @override
  String get shorts => 'කෙටි චිත්‍රපට';

  @override
  String get trailers => 'ට්‍රේලර්';

  @override
  String timeRemaining(String time) {
    return '$time ඉතිරියි';
  }

  @override
  String endsIn(String time) {
    return '$timeකින් අවසන් වේ';
  }

  @override
  String get view => 'බලන්න';

  @override
  String get resumeReading => 'කියවීම නැවත ආරම්භ කරන්න';

  @override
  String get read => 'කියවන්න';

  @override
  String resumeFrom(String position) {
    return '$position සිට දිගටම කරන්න';
  }

  @override
  String get play => 'වාදනය කරන්න';

  @override
  String get startOver => 'නැවත ආරම්භ කරන්න';

  @override
  String get restart => 'යළි අරඹන්න';

  @override
  String get readOffline => 'නොබැඳි කියවන්න';

  @override
  String get playOffline => 'නොබැඳි ලෙස සෙල්ලම් කරන්න';

  @override
  String get audio => 'ශ්රව්ය උපකරණ';

  @override
  String get subtitles => 'උපසිරැසි';

  @override
  String get version => 'අනුවාදය';

  @override
  String get cast => 'කාස්ට් කරන්න';

  @override
  String get trailer => 'ට්‍රේලරය';

  @override
  String get finished => 'අවසන්';

  @override
  String get favorited => 'ප්රියතම';

  @override
  String get favorite => 'ප්රියතම';

  @override
  String get playlist => 'ධාවන ලැයිස්තුව';

  @override
  String get downloaded => 'බාගත කර ඇත';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get downloadAll => 'සියල්ල බාගත කරන්න';

  @override
  String get download => 'බාගන්න';

  @override
  String get deleteDownloaded => 'මකන්න බාගත කර ඇත';

  @override
  String get goToSeries => 'මාලාව වෙත යන්න';

  @override
  String get editMetadata => 'පාරදත්ත සංස්කරණය කරන්න';

  @override
  String get less => 'අඩු';

  @override
  String get more => 'තව';

  @override
  String get deleteItem => 'අයිතමය මකන්න';

  @override
  String get deletePlaylist => 'ධාවන ලැයිස්තුව මකන්න';

  @override
  String get deletePlaylistMessage => 'මෙම ධාවන ලැයිස්තුව සේවාදායකයෙන් මකන්නද?';

  @override
  String get deleteItemMessage => 'මෙම අයිතමය සේවාදායකයෙන් මකන්නද?';

  @override
  String get failedToDeletePlaylist => 'ධාවන ලැයිස්තුව මැකීමට අසමත් විය';

  @override
  String get failedToDeleteItem => 'අයිතමය මැකීමට අසමත් විය';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'ධාවන ලැයිස්තුව නැවත නම් කරන්න';

  @override
  String get playlistName => 'ධාවන ලැයිස්තුවේ නම';

  @override
  String get deleteDownloadedAlbum => 'බාගත කළ ඇල්බමය මකන්න';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\" සඳහා බාගත කළ ගීත මකන්නද?';
  }

  @override
  String get downloadedTracksDeleted => 'බාගත කළ ගීත මකා ඇත';

  @override
  String get downloadedTracksDeleteFailed =>
      'සමහර බාගත කළ පීලි මකා දැමිය නොහැක';

  @override
  String get noTracksLoaded => 'ධාවන පථයක් පූරණය කර නැත';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel පූරණය කර නැත';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title බාගත කරමින් (අයිතම $count)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'ඔබට \"$name\" සේවාදායකයෙන් මකා දැමීමට අවශ්‍ය බව විශ්වාසද? මෙම ක්‍රියාව අහෝසි කළ නොහැක.';
  }

  @override
  String get itemDeleted => 'අයිතමය මකා ඇත';

  @override
  String get noPlayableTrailerFound => 'වාදනය කළ හැකි ට්‍රේලරයක් හමු නොවිණි.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'සහාය නොදක්වන පොත් ආකෘතියකි: .$extension';
  }

  @override
  String get audioTrack => 'ශ්‍රව්‍ය පථය';

  @override
  String get subtitleTrack => 'උපසිරැසි පථය';

  @override
  String get none => 'කිසිවක් නැත';

  @override
  String get downloadSubtitlesLabel => 'උපසිරැසි බාගන්න...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles ප්ලගිනය භාවිතයෙන් සොයන්න';

  @override
  String get downloadSubtitles => 'උපසිරැසි බාගන්න';

  @override
  String get selectedSubtitleInvalid => 'තෝරාගත් උපසිරැසිය වලංගු නොවේ.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'උපසිරැසි බාගත කර තෝරා ගන්නා ලදී: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'උපසිරැසි බාගත කර ඇත. Jellyfin අයිතමය නැවුම් කරන අතරතුර දිස් වීමට මොහොතක් ගත විය හැක.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language සඳහා දුරස්ථ උපසිරැසි හමු නොවීය.';
  }

  @override
  String get selectVersion => 'අනුවාදය තෝරන්න';

  @override
  String versionNumber(int number) {
    return 'අනුවාදය $number';
  }

  @override
  String get downloadAllQuality => 'සියල්ල බාගත කරන්න - ගුණාත්මක';

  @override
  String get downloadQuality => 'ගුණාත්මක බාගන්න';

  @override
  String get originalFileNoReencoding => 'මුල් ගොනුව, නැවත කේතනය කිරීමක් නොමැත';

  @override
  String get originalFilesNoReencoding => 'මුල් ගොනු, නැවත කේතනය කිරීමක් නොමැත';

  @override
  String get noEpisodesLoaded => 'කථාංග කිසිවක් පූරණය කර නැත';

  @override
  String downloadingItem(String name, String quality) {
    return '$name බාගත කරමින් ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'බාගත කළ ගොනු මකන්න';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel සඳහා දේශීය ගොනු මකන්නද?\n\nමෙය ගබඩා ඉඩ නිදහස් කරයි. ඔබට පසුව නැවත බාගත කළ හැක.';
  }

  @override
  String get downloadedFilesDeleted => 'බාගත කළ ගොනු මකා ඇත';

  @override
  String get failedToDeleteFiles => 'ගොනු මැකීමට අසමත් විය';

  @override
  String get deleteFiles => 'ගොනු මකන්න';

  @override
  String get director => 'අධ්යක්ෂක';

  @override
  String get directors => 'අධ්‍යක්ෂවරු';

  @override
  String get writer => 'රචකයා';

  @override
  String get writers => 'තිර රචකයන්';

  @override
  String get studio => 'ස්ටුඩියෝව';

  @override
  String studioMoreCount(int count) {
    return 'තවත් +$count';
  }

  @override
  String totalEpisodes(int count) {
    return 'කථාංග $count';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'කථාංගය $number';
  }

  @override
  String chapterNumber(int number) {
    return 'පරිච්ඡේදය $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ගීත $count',
      one: 'ගීතය 1',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'පරිච්ඡේද $count',
      one: 'පරිච්ඡේදය 1',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'උපත $date';
  }

  @override
  String died(String date) {
    return 'මිය ගියේ $date';
  }

  @override
  String age(int age) {
    return 'වයස $age';
  }

  @override
  String get showLess => 'අඩුවෙන් පෙන්වන්න';

  @override
  String get readMore => 'තවත් කියවන්න';

  @override
  String get shuffle => 'කලවම් කරන්න';

  @override
  String get shuffleAllMusic => 'සියලු සංගීතය කලවම් කර වාදනය කරන්න';

  @override
  String get carSignInPrompt => 'ඔබේ දුරකථනයෙන් Moonfin වෙත පුරන්න';

  @override
  String get carServerUnreachable => 'ඔබේ සේවාදායකයට ළඟා විය නොහැක';

  @override
  String downloadsCount(int count) {
    return 'බාගැනීම් $count';
  }

  @override
  String get perfectMatch => 'පරිපූර්ණ ගැලපීම';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'මොනෝ';

  @override
  String get stereo => 'ස්ටීරියෝ';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'දුරස්ථ උපසිරැසි $action සඳහා මෙම පරිශීලකයාට Jellyfin උපසිරැසි කළමනාකරණ අවසරය අවශ්‍ය වේ.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'දුරස්ථ උපසිරැසි $action සඳහා මෙම අයිතමය සේවාදායකයේ හමු නොවීය.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'දුරස්ථ උපසිරැසි $action අසාර්ථක විය: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'දුරස්ථ උපසිරැසි $action අසාර්ථක විය (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'දුරස්ථ උපසිරැසි $action කිරීමට අසමත් විය.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\" සඳහා බාගත කළ සියලු කථාංග';
  }

  @override
  String get deleteSeasonFiles => 'මෙම වාරයේ සියලුම බාගත් කථාංග';

  @override
  String get stillWatching => 'තාම බලනවද?';

  @override
  String get unableToLoadTrailerStream => 'ට්‍රේලර් ප්‍රවාහය පූරණය කළ නොහැක.';

  @override
  String get trailerTimedOut => 'ප්‍රචාරක පටය පූරණය කිරීමේදී කල් ඉකුත් විය.';

  @override
  String get playbackFailedForTrailer =>
      'මෙම ට්‍රේලරය සඳහා පසුධාවනය අසාර්ථක විය.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'නොබැඳි නැවත ධාවනය අතරතුර විකාශනය ලබා ගත නොහැක.';

  @override
  String castActionFailed(String label, String error) {
    return '$label ක්‍රියාව අසාර්ථක විය: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'කාස්ට් හඬ පරිමාව සැකසීමට අසමත් විය: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label පාලන';
  }

  @override
  String get deviceVolume => 'උපාංග පරිමාව';

  @override
  String get unavailable => 'ලබා ගත නොහැක';

  @override
  String get pause => 'විරාමය';

  @override
  String get syncPosition => 'සමමුහුර්ත ස්ථානය';

  @override
  String stopCast(String label) {
    return '$label නවත්වන්න';
  }

  @override
  String get queueIsEmpty => 'පෝලිම හිස්';

  @override
  String trackNumber(int number) {
    return 'ගීතය $number';
  }

  @override
  String get remotePlayback => 'දුරස්ථ නැවත ධාවනය';

  @override
  String get castingToGoogleCast => 'Google Cast වෙත විකාශනය කිරීම';

  @override
  String get castingViaAirPlay => 'AirPlay හරහා වාත්තු කිරීම';

  @override
  String get castingViaDlna => 'DLNA හරහා වාත්තු කිරීම';

  @override
  String secondsCount(int seconds) {
    return 'තත්පර $seconds';
  }

  @override
  String get longPressToUnlock => 'අගුලු හැරීමට දිගු ඔබන්න';

  @override
  String get off => 'අක්‍රියයි';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'ඔටෝ';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'බිට්රේට් අභිබවා යාම';

  @override
  String get audioDelay => 'ශ්‍රව්‍ය ප්‍රමාදය';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'උපසිරැසි ප්‍රමාදය';

  @override
  String get reset => 'යළි සකසන්න';

  @override
  String get unknown => 'නොදන්නා';

  @override
  String get playbackInformation => 'පසුධාවන තොරතුරු';

  @override
  String get playback => 'නැවත ධාවනය';

  @override
  String get playMethod => 'ක්‍රීඩා ක්‍රමය';

  @override
  String get directPlay => 'සෘජු වාදනය';

  @override
  String get directStream => 'සෘජු ධාරාව';

  @override
  String get transcoding => 'ට්‍රාන්ස්කෝඩිං';

  @override
  String get transcodeReasons => 'ට්‍රාන්ස්කෝඩ් හේතු';

  @override
  String get player => 'වාදකය';

  @override
  String get container => 'කන්ටේනර්';

  @override
  String get bitrate => 'බිට්රේට්';

  @override
  String get video => 'වීඩියෝ';

  @override
  String get resolution => 'විභේදනය';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'කෝඩෙක්';

  @override
  String get videoBitrate => 'වීඩියෝ බිට්රේට්';

  @override
  String get track => 'පථය';

  @override
  String get channels => 'නාලිකා';

  @override
  String get audioBitrate => 'ශ්රව්ය බිට්රේට්';

  @override
  String get sampleRate => 'නියැදි අනුපාතය';

  @override
  String get format => 'ආකෘතිය';

  @override
  String get external => 'බාහිර';

  @override
  String get embedded => 'කාවැද්දූ';

  @override
  String castSessionError(String protocol) {
    return '$protocol සැසි දෝෂයකි';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'පොතේ විස්තර පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'යෙදුම තුළ EPUB විදැහුම්කරණය තවමත් මෙම වේදිකාවේ නොමැත.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'මෙම ආකෘතිය (.$extension) තවම යෙදුම තුළ පෙන්විය නොහැක.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'කාවැද්දූ ලේඛන විදැහුම්කරණය මෙම වේදිකාවේ නොමැත.';

  @override
  String get couldNotOpenExternalViewer => 'බාහිර බලන්නා විවෘත කළ නොහැකි විය.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'යෙදුම තුළ ඇති කියවනය විවෘත කිරීමට අසමත් විය: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label හි පිටු සලකුණ දැනටමත් සුරකිනු ලැබ ඇත.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'පිටු සලකුණ එක් කරන ලදී: $label';
  }

  @override
  String get noBookmarksYet =>
      'තවමත් පිටු සලකුණු නොමැත.\nඔබේ ස්ථානය සුරැකීමට කියවීමේදී පිටුසන් නිරූපකය තට්ටු කරන්න.';

  @override
  String get noTableOfContentsAvailable => 'පටුන නොමැත';

  @override
  String pageLabel(int number) {
    return 'පිටුව $number';
  }

  @override
  String get position => 'තනතුර';

  @override
  String get bookReader => 'පොත් කියවන්නා';

  @override
  String formatExtension(String extension) {
    return 'ආකෘතිය: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% කියවා ඇත';
  }

  @override
  String get updating => 'යාවත්කාලීන කරමින්...';

  @override
  String get markUnread => 'නොකියවූ ලකුණු කරන්න';

  @override
  String get markAsRead => 'කියවූ ලෙස ලකුණු කරන්න';

  @override
  String get reloadReader => 'රීඩර් රීඩර්';

  @override
  String get noPagesFound => 'පිටු කිසිවක් හමු නොවීය.';

  @override
  String get failedToDecodePageImage => 'පිටු රූපය විකේතනය කිරීමට අසමත් විය.';

  @override
  String resetZoom(String zoom) {
    return 'විශාලනය යළි පිහිටුවන්න (${zoom}x)';
  }

  @override
  String get singlePage => 'තනි පිටුව';

  @override
  String get twoPageSpread => 'පිටු දෙකක පැතිරීම';

  @override
  String get addBookmark => 'පිටු සලකුණ එක් කරන්න';

  @override
  String get bookmarksEllipsis => 'පිටු සලකුණු...';

  @override
  String get markedAsRead => 'කියවූ ලෙස සලකුණු කර ඇත';

  @override
  String get markedAsUnread => 'නොකියවූ ලෙස ලකුණු කර ඇත';

  @override
  String failedToUpdateReadState(String error) {
    return 'කියවීම් තත්ත්වය යාවත්කාලීන කිරීමට අසමත් විය: $error';
  }

  @override
  String get themeSystem => 'තේමාව: පද්ධතිය';

  @override
  String get themeLight => 'තේමාව: ආලෝකය';

  @override
  String get themeDark => 'තේමාව: අඳුරු';

  @override
  String get themeSepia => 'තේමාව: සේපියා';

  @override
  String get invertColorsFixedLayout => 'ප්‍රතිලෝම වර්ණ (ස්ථාවර පිරිසැලසුම)';

  @override
  String get invertColorsPdf => 'වර්ණ ප්‍රතිලෝම (PDF)';

  @override
  String get preparingInAppReader => 'යෙදුම-තුළ කියවනය සූදානම් කරමින්...';

  @override
  String get pdfDataNotAvailable => 'PDF දත්ත නොමැත.';

  @override
  String get readerFallbackModeActive => 'පාඨක පසුබැසීමේ මාදිලිය සක්‍රීයයි';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return '$extension ගොනු සඳහා වන කාවැද්දූ ලේඛන එන්ජිම මෙම වේදිකාවට දරාගත නොහැක.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'සහය දක්වන වේදිකා ඉලක්කයකට (Android, iOS, macOS) මාරු වීමෙන් පසු Reload Reader භාවිත කරන්න.';

  @override
  String get openExternally => 'බාහිරව විවෘත කරන්න';

  @override
  String get noEpubChaptersFound => 'EPUB පරිච්ඡේද කිසිවක් හමු නොවීය.';

  @override
  String get readerNotReady => 'පාඨකයා සූදානම් නැත.';

  @override
  String get seriesRecordings => 'මාලාවේ පටිගත කිරීම්';

  @override
  String get now => 'දැන්';

  @override
  String get sports => 'ක්රීඩා';

  @override
  String get news => 'පුවත්';

  @override
  String get kids => 'ළමයි';

  @override
  String get premiere => 'මංගල දර්ශනය';

  @override
  String get guideTimeline => 'මාර්ගෝපදේශ කාලරාමුව';

  @override
  String failedToLoadGuide(String error) {
    return 'මාර්ගෝපදේශකය පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get noChannelsFound => 'නාලිකා හමු නොවීය';

  @override
  String get liveBadge => 'සජීවී';

  @override
  String guideNextProgram(String time, String title) {
    return 'ඊළඟට: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'මිනි. $minutesක් ඉතිරියි';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'පැය $hoursක් ඉතිරියි';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'පැය $hours මිනි. $minutesක් ඉතිරියි';
  }

  @override
  String get movie => 'චිත්රපටය';

  @override
  String get removedFromFavoriteChannels =>
      'ප්‍රියතම නාලිකා වලින් ඉවත් කරන ලදී';

  @override
  String get addedToFavoriteChannels => 'ප්‍රියතම නාලිකා වෙත එක් කරන ලදී';

  @override
  String get failedToUpdateFavoriteChannel =>
      'ප්‍රියතම නාලිකාව යාවත්කාලීන කිරීමට අසමත් විය';

  @override
  String get unfavoriteChannel => 'ප්රියතම නාලිකාව';

  @override
  String get favoriteChannel => 'ප්රියතම නාලිකාව';

  @override
  String get record => 'පටිගත කරන්න';

  @override
  String get cancelRecordingAction => 'පටිගත කිරීම අවලංගු කරන්න';

  @override
  String get programSetToRecord => 'වැඩසටහන පටිගත කිරීමට සකසන ලදී';

  @override
  String get recordingCancelled => 'පටිගත කිරීම අවලංගු කරන ලදී';

  @override
  String get unableToCreateRecording => 'පටිගත කිරීමක් සෑදිය නොහැක';

  @override
  String get watch => 'නරඹන්න';

  @override
  String get close => 'වසන්න';

  @override
  String failedToPlayChannel(String name) {
    return '$name වාදනය කිරීමට අසමත් විය';
  }

  @override
  String get failedToLoadRecordings => 'පටිගත කිරීම් පූරණය කිරීමට අසමත් විය';

  @override
  String get scheduledInNext24Hours => 'ඉදිරි පැය 24 තුළ සැලසුම් කර ඇත';

  @override
  String get recentRecordings => 'මෑත පටිගත කිරීම්';

  @override
  String get tvSeries => 'TV මාලා';

  @override
  String get failedToLoadSchedule => 'කාලසටහන පූරණය කිරීමට අසමත් විය';

  @override
  String get noScheduledRecordings => 'නියමිත පටිගත කිරීම් නොමැත';

  @override
  String get cancelRecording => 'පටිගත කිරීම අවලංගු කරන්නද?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '\"$name\" හි නියමිත පටිගත කිරීම අවලංගු කරන්නද?';
  }

  @override
  String get no => 'නැත';

  @override
  String get yesCancel => 'ඔව්, අවලංගු කරන්න';

  @override
  String get failedToCancelRecording => 'පටිගත කිරීම අවලංගු කිරීමට අසමත් විය';

  @override
  String get failedToLoadSeriesRecordings =>
      'ශ්‍රේණි පටිගත කිරීම් පූරණය කිරීමට අසමත් විය';

  @override
  String get noSeriesRecordings => 'ශ්‍රේණි පටිගත කිරීම් නොමැත';

  @override
  String get cancelSeriesRecording => 'මාලාව පටිගත කිරීම අවලංගු කරන්න';

  @override
  String get cancelSeriesRecordingQuestion =>
      'ශ්‍රේණි පටිගත කිරීම අවලංගු කරන්නද?';

  @override
  String stopRecordingName(String name) {
    return '\"$name\" පටිගත කිරීම නවත්වන්නද?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'මාලාව පටිගත කිරීම අවලංගු කිරීමට අසමත් විය';

  @override
  String get searchThisLibrary => 'මෙම පුස්තකාලය සොයන්න...';

  @override
  String get searchEllipsis => 'සොයන්න...';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\" සඳහා ප්‍රතිඵල නැත';
  }

  @override
  String searchFailedError(String error) {
    return 'සෙවීම අසාර්ථක විය: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr ගිණුම් වර්ගය';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'දේශීය';

  @override
  String get savedMedia => 'සුරැකි මාධ්‍ය';

  @override
  String get tvShows => 'රූපවාහිනී වැඩසටහන්';

  @override
  String get music => 'සංගීතය';

  @override
  String get musicAlbums => 'සංගීත ඇල්බම';

  @override
  String get noMediaInFilter => 'මෙම පෙරහන තුළ මාධ්‍ය නැත';

  @override
  String get noDownloadedMediaYet => 'තවමත් බාගත කළ මාධ්‍ය නැත';

  @override
  String get browseLibrary => 'පුස්තකාලය පිරික්සන්න';

  @override
  String get deleteDownload => 'බාගත කිරීම මකන්න';

  @override
  String removeItemAndFiles(String name) {
    return '\"$name\" සහ එහි ගොනු ඉවත් කරන්නද?';
  }

  @override
  String tracksCount(int count) {
    return 'ගීත $count';
  }

  @override
  String get album => 'ඇල්බමය';

  @override
  String get playAlbum => 'ඇල්බමය වාදනය කරන්න';

  @override
  String failedToLoadAlbum(String error) {
    return 'ඇල්බමය පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name සඳහා බාගත කළ ගීත හමු නොවීය.';
  }

  @override
  String get season => 'වාරය';

  @override
  String get errorLoadingEpisodes => 'කථාංග පූරණය කිරීමේ දෝෂයකි';

  @override
  String get noDownloadedEpisodes => 'බාගත් කථාංග නැත';

  @override
  String get deleteEpisode => 'කථාංගය මකන්න';

  @override
  String removeName(String name) {
    return '\"$name\" ඉවත් කරන්නද?';
  }

  @override
  String durationMinutes(int minutes) {
    return 'මිනි. $minutes';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'කථාංගය $number';
  }

  @override
  String get seriesNotFound => 'මාලාවක් හමු නොවීය';

  @override
  String get errorLoadingSeries => 'මාලාවක් පූරණය කිරීමේ දෝෂයකි';

  @override
  String get downloadedEpisodes => 'බාගත් කථාංග';

  @override
  String seasonNumber(int number) {
    return 'වාරය $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'විශේෂ';

  @override
  String get deleteSeason => 'වාරය මකන්න';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '$season හි බාගත කළ සියලු කථාංග මකන්නද?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'කථාංග $count',
      one: 'කථාංගය 1',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'ගබඩා කළමනාකරණය';

  @override
  String get storageBreakdown => 'ගබඩා බිඳවැටීම';

  @override
  String get downloadedItems => 'බාගත කළ අයිතම';

  @override
  String get storageLimit => 'ගබඩා සීමාව';

  @override
  String get noLimit => 'සීමාවක් නැත';

  @override
  String get deleteAllDownloads => 'සියලුම බාගැනීම් මකන්න';

  @override
  String get deleteAllDownloadsWarning =>
      'මෙය බාගත කළ සියලුම මාධ්‍ය ගොනු ඉවත් කරනු ඇති අතර පසුගමනය කළ නොහැක.';

  @override
  String get deleteAll => 'සියල්ල මකන්න';

  @override
  String get deleteSelected => 'තෝරාගත් මකන්න';

  @override
  String deleteSelectedCount(int count) {
    return 'බාගත කළ අයිතම $countක් මකන්නද?';
  }

  @override
  String get musicAndAudiobooks => 'සංගීතය සහ ශ්‍රව්‍ය පොත්';

  @override
  String get images => 'රූප';

  @override
  String get database => 'දත්ත සමුදාය';

  @override
  String ofStorageLimit(String limit) {
    return '$limit සීමාවෙන්';
  }

  @override
  String get settings => 'සැකසීම්';

  @override
  String get authentication => 'සත්යාපනය';

  @override
  String get autoLoginServerManagement =>
      'ස්වයංක්‍රීය පුරනය වීම, සේවාදායක කළමනාකරණය';

  @override
  String get pinCode => 'PIN කේතය';

  @override
  String get setUpPinCodeProtection => 'PIN කේත ආරක්ෂාව සකසන්න';

  @override
  String get parentalControls => 'මාපිය පාලන';

  @override
  String get contentRatingRestrictions =>
      'අන්තර්ගත ශ්‍රේණිගත කිරීම් සීමා කිරීම්';

  @override
  String get bitRateResolutionBehavior => 'බිට්රේට්, විභේදනය, හැසිරීම';

  @override
  String get languageSizeAppearance => 'භාෂාව, ප්රමාණය, පෙනුම';

  @override
  String get qualityStorage => 'ගුණාත්මකභාවය, ගබඩා කිරීම';

  @override
  String get serverSyncAndPluginStatus =>
      'සේවාදායක සමමුහුර්තකරණය සහ ප්ලගින තත්ත්වය';

  @override
  String get mediaRequestIntegration => 'මාධ්‍ය ඉල්ලීම් ඒකාබද්ධ කිරීම';

  @override
  String get switchServer => 'සේවාදායකය මාරු කරන්න';

  @override
  String get signOut => 'වරන්න';

  @override
  String get versionLicenses => 'අනුවාදය, බලපත්ර';

  @override
  String get account => 'ගිණුම';

  @override
  String get signInAndSecurity => 'පුරනය වීම සහ ආරක්ෂාව';

  @override
  String get administration => 'පරිපාලනය';

  @override
  String get serverSettingsUsersLibraries =>
      'සේවාදායක සැකසුම්, පරිශීලකයින්, පුස්තකාල';

  @override
  String get customization => 'අභිරුචිකරණය';

  @override
  String get themeAndLayout => 'තේමාව සහ පිරිසැලසුම';

  @override
  String get videoAndSubtitles => 'වීඩියෝ සහ උපසිරැසි';

  @override
  String get integrations => 'ඒකාබද්ධ කිරීම්';

  @override
  String get pluginAndRequests => 'ප්ලගිනය සහ ඉල්ලීම්';

  @override
  String get customizeAccountPlaybackInterface =>
      'ගිණුම, නැවත ධාවනය සහ අතුරු මුහුණත් හැසිරීම අභිරුචිකරණය කරන්න';

  @override
  String optionsCount(int count) {
    return 'විකල්ප $count';
  }

  @override
  String get themeAndAppearance => 'තේමාව සහ පෙනුම';

  @override
  String get focusBorderColor => 'නාභිගත මායිම් වර්ණය';

  @override
  String get watchedIndicators => 'දර්ශක නැරඹුවා';

  @override
  String get always => 'සෑම විටම';

  @override
  String get hideUnwatched => 'නොදුටු සඟවන්න';

  @override
  String get episodesOnly => 'කථාංග පමණි';

  @override
  String get never => 'කවදාවත් නැහැ';

  @override
  String get focusExpansionAnimation => 'අවධානය පුළුල් කිරීමේ සජීවිකරණය';

  @override
  String get desktopUiScale => 'ඩෙස්ක්ටොප් UI පරිමාණය';

  @override
  String get scaleFocusedCards =>
      'පරිමාණ නාභිගත කළ හෝ තබා ඇති කාඩ්පත් සහ ටයිල්';

  @override
  String get backgroundBackdrops => 'පසුබිම් පසුබිම්';

  @override
  String get showBackdropImages => 'අන්තර්ගතය පිටුපස පසුබිම් රූප පෙන්වන්න';

  @override
  String get seriesThumbnails => 'මාලාවේ සිඟිති රූ';

  @override
  String get seriesThumbnailsDescription =>
      'කථාංග පමණි: එක් එක් පේළි රූප වර්ගයට ගැළපෙන ශ්‍රේණි කලා කෘති භාවිත කරන්න';

  @override
  String get homeRowInfoOverlay => 'මුල් පේළි තොරතුරු ආවරණය';

  @override
  String get showTitleMetadataOnHomeRows =>
      'මුල් පේළි බ්‍රවුස් කරන විට මාතෘකාව සහ පාර-දත්ත පෙන්වන්න';

  @override
  String get clockDisplay => 'ඔරලෝසු සංදර්ශකය';

  @override
  String get inMenus => 'මෙනු වල';

  @override
  String get inVideo => 'වීඩියෝ එකේ';

  @override
  String get seasonalEffects => 'සෘතුමය බලපෑම්';

  @override
  String get seasonalEffectsDescription => 'දෘශ්ය ප්රයෝග සහ සෘතුමය සැරසිලි';

  @override
  String get snow => 'හිම';

  @override
  String get fireworks => 'ගිනිකෙළි';

  @override
  String get confetti => 'කොන්ෆෙට්ටි';

  @override
  String get fallingLeaves => 'වැටෙන කොළ';

  @override
  String get themeMusic => 'තේමා සංගීතය';

  @override
  String get playThemeMusicOnDetailPages =>
      'විස්තර පිටුවල තේමා සංගීතය වාදනය කරන්න';

  @override
  String get themeMusicVolume => 'තේමා සංගීත පරිමාව';

  @override
  String get themeMusicSettingsSubtitle =>
      'විස්තර පිටු, මුල් තිර පේළි සහ හඬ පරිමාව';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'මුල් පේළිවල තේමා සංගීතය';

  @override
  String get playWhenBrowsingHomeScreen =>
      'මුල් තිරය බ්‍රවුස් කරන විට සෙල්ලම් කරන්න';

  @override
  String get loopThemeMusic => 'තේමා සංගීතය පුනරාවර්තනය කරන්න';

  @override
  String get loopThemeMusicSubtitle =>
      'ගීතය එක් වරක් වාදනය කරනවා වෙනුවට නැවත නැවත වාදනය කරන්න';

  @override
  String get detailsBackgroundBlur => 'විස්තර පසුබිම බොඳ කිරීම';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'බ්‍රවුස් කිරීමේ පසුබිම බොඳ කිරීම';

  @override
  String get maxStreamingBitrate => 'උපරිම Streaming Bitrate';

  @override
  String get maxResolution => 'උපරිම විභේදනය';

  @override
  String get playerZoomMode => 'ක්‍රීඩක විශාලන ප්‍රකාරය';

  @override
  String get settingsScrollWheelAction => 'මූසික අනුචලන රෝදය';

  @override
  String get settingsScrollWheelActionDescription =>
      'ධාවනය අතරතුර වීඩියෝව මතින් මූසික රෝදය අනුචලනය කිරීමෙන් සිදුවන දේ තෝරන්න.';

  @override
  String get scrollWheelActionOff => 'අක්‍රියයි';

  @override
  String get scrollWheelActionSeek => 'ගමන් කරන්න (ඉදිරියට / ආපසු)';

  @override
  String get scrollWheelActionVolume => 'හඬ පරිමාව';

  @override
  String get playerTooltipVolume => 'හඬ පරිමාව';

  @override
  String get fit => 'සුදුසුයි';

  @override
  String get autoCrop => 'ස්වයංක්‍රීය බෝග';

  @override
  String get stretch => 'දිගු කරන්න';

  @override
  String get refreshRateSwitching => 'නැවුම් අනුපාත මාරු කිරීම';

  @override
  String get disabled => 'අක්‍රියයි';

  @override
  String get scaleOnTv => 'රූපවාහිනියේ පරිමාණය';

  @override
  String get scaleOnDevice => 'උපාංගය මත පරිමාණය';

  @override
  String get trickPlay => 'උපක්‍රම වාදනය';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'සොයන විට පෙරදසුන් සිඟිති රූ පෙන්වන්න';

  @override
  String get showDescriptionOnPause => 'විරාමය මත විස්තරය පෙන්වන්න';

  @override
  String get dimVideoShowOverview =>
      'විරාමය ඇති අතරතුර වීඩියෝව අඳුරු කර දළ විශ්ලේෂණය පෙළ පෙන්වන්න';

  @override
  String get osdLockButton => 'OSD අගුළු බොත්තම';

  @override
  String get osdLockButtonDescription =>
      'දිගු එබීම දක්වා ස්පර්ශ ආදානය අවහිර කරන අගුළු බොත්තමක් පෙන්වන්න';

  @override
  String get audioBehavior => 'ශ්රව්ය හැසිරීම්';

  @override
  String get downmixToStereo => 'ස්ටීරියෝ වෙත ඩවුන්මික්ස් කරන්න';

  @override
  String get defaultAudioLanguage => 'පෙරනිමි ශ්‍රව්‍ය භාෂාව';

  @override
  String get fallbackAudioLanguage => 'විකල්ප ශ්‍රව්‍ය භාෂාව';

  @override
  String get preferDefaultAudioTrack => 'පෙරනිමි ශ්‍රව්‍ය පථයට මුල් තැන දෙන්න';

  @override
  String get preferDefaultAudioTrackDescription =>
      'දේශීයකරණය කළ හඬකැවීමට වඩා මුල් ශ්‍රව්‍ය පථයට මුල් තැන දෙන්න.';

  @override
  String get preferAudioDescription => 'ශ්‍රව්‍ය විස්තර පථවලට මුල් තැන දෙන්න';

  @override
  String get preferAudioDescriptionDescription =>
      'සාමාන්‍ය පථවලට වඩා ශ්‍රව්‍ය විස්තර පථවලට මුල් තැන දෙන්න.';

  @override
  String get transcodingAudio => 'ට්‍රාන්ස්කෝඩිං (ශ්‍රව්‍ය)';

  @override
  String get directStreamRemux => 'සෘජු ප්‍රවාහය (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'ට්‍රාන්ස්කෝඩිං (බිට්රේට් හෝ විභේදනය)';

  @override
  String get transcodingVideoAndAudio => 'ට්‍රාන්ස්කෝඩිං (වීඩියෝ සහ ශ්‍රව්‍ය)';

  @override
  String get transcodingVideo => 'ට්‍රාන්ස්කෝඩිං (වීඩියෝ)';

  @override
  String get autoServerDefault => 'ස්වයංක්‍රීය (සේවාදායක පෙරනිමිය)';

  @override
  String get english => 'ඉංග්රීසි';

  @override
  String get spanish => 'ස්පාඤ්ඤ';

  @override
  String get french => 'ප්රංශ';

  @override
  String get german => 'ජර්මන්';

  @override
  String get italian => 'ඉතාලි';

  @override
  String get portuguese => 'පෘතුගීසි';

  @override
  String get japanese => 'ජපන්';

  @override
  String get korean => 'කොරියානු';

  @override
  String get chinese => 'චීන';

  @override
  String get russian => 'රුසියානු';

  @override
  String get arabic => 'අරාබි';

  @override
  String get hindi => 'හින්දි';

  @override
  String get dutch => 'ලන්දේසි';

  @override
  String get swedish => 'ස්වීඩන්';

  @override
  String get norwegian => 'නෝර්වීජියානු';

  @override
  String get danish => 'ඩෙන්මාර්ක';

  @override
  String get finnish => 'ෆින්ලන්ත';

  @override
  String get polish => 'පෝලන්ත';

  @override
  String get ac3Passthrough => 'AC3 පාස්ත්‍රූ';

  @override
  String get dtsPassthrough => 'DTS පාස්ත්‍රූ';

  @override
  String get trueHdSupport => 'TrueHD සහාය';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS ශ්‍රව්‍ය AVR වෙත පමණි; ග්‍රාහක සහාය සහ DTS මූලාශ්‍ර ධාවන පථය අවශ්‍ය වේ';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ශ්‍රව්‍ය සක්‍රීය කරන්න (සියලු වේදිකාවල ක්‍රියා නොකරනු ඇත)';

  @override
  String get settingsAudioOutputMode => 'ශ්‍රව්‍ය ප්‍රතිදාන ප්‍රකාරය';

  @override
  String get settingsAudioOutputModeDescription =>
      'ශ්‍රව්‍ය විකේතනය කරන ආකාරය තෝරන්න. AVR පාස්ත්‍රූ මඟින් අමු Dolby/DTS ප්‍රවාහ ඔබේ ග්‍රාහකයට යවයි; ස්වයංක්‍රීය හෝ ඩවුන්මික්ස් මඟින් දේශීයව විකේතනය කරයි.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR පාස්ත්‍රූ';

  @override
  String get settingsAudioFallbackCodec => 'විකල්ප ශ්‍රව්‍ය කෝඩෙක්';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'මූලාශ්‍ර ප්‍රවාහය සෘජුව වාදනය කිරීමට හෝ පාස්ත්‍රූ කිරීමට නොහැකි විට බහු-නාලිකා ශ්‍රව්‍ය ට්‍රාන්ස්කෝඩ් කිරීමට ඉලක්ක ආකෘතිය තෝරන්න.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'ස්වයංක්‍රීයව හඳුනාගන්න\n(නිර්දේශිත)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(පෙරනිමි)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(හානි රහිත)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(ස්ටීරියෝ පමණි)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(කාර්යක්ෂම)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(හානි රහිත)';

  @override
  String get settingsMaxAudioChannels => 'උපරිම ශ්‍රව්‍ය නාලිකා';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'ඔබේ ශ්‍රව්‍ය පිහිටුවීමේ උපරිම නාලිකා ගණන වින්‍යාස කරන්න. මෙම සීමාව ඉක්මවන බහු-නාලිකා ප්‍රවාහ ඩවුන්මික්ස් හෝ ට්‍රාන්ස්කෝඩ් වේ.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'ස්වයංක්‍රීයව හඳුනාගන්න\n(දෘඪාංග පෙරනිමිය)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 මොනෝ';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 ස්ටීරියෝ';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 සරවුන්ඩ්';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 ක්වඩ්‍රොෆොනික්';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 සරවුන්ඩ්';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 සරවුන්ඩ්';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 සරවුන්ඩ්';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 සරවුන්ඩ්';

  @override
  String get settingsAudioPassthroughAdvanced => 'පාස්ත්‍රූ (උසස්)';

  @override
  String get settingsAudioCodecPassthrough => 'කෝඩෙක් පාස්ත්‍රූ';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'ඔබේ AVR හෝ HDMI ග්‍රාහකය සහාය දක්වන ආකෘති පමණක් සබල කරන්න.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 පාස්ත්‍රූ';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) පාස්ත්‍රූ';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core පාස්ත්‍රූ';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA පාස්ත්‍රූ';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD පාස්ත්‍රූ';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos පාස්ත්‍රූ';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) බාහිර විකේතකයට බිට්ස්ට්‍රීම් කරන්න.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) හරහා Dolby Atmos බාහිර විකේතකයට බිට්ස්ට්‍රීම් කරන්න.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS core ඇතුළුව) බාහිර විකේතකයට බිට්ස්ට්‍රීම් කරන්න.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos පාරදත්ත සහිත Dolby TrueHD බාහිර විකේතකයට බිට්ස්ට්‍රීම් කරන්න.';

  @override
  String get settingsDetectedAudioCapabilities => 'හඳුනාගත් ශ්‍රව්‍ය හැකියාවන්';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'ධාවන කාලයේ හැකියාවන් පිළිබඳ තොරතුරු තවම නොමැත.';

  @override
  String get settingsAudioRouteLabel => 'මාර්ගය';

  @override
  String get settingsAudioDecodeLabel => 'විකේතනය';

  @override
  String get settingsAudioPassthroughLabel => 'පාස්ත්‍රූ';

  @override
  String get settingsAudioHdRoute => 'HD ශ්‍රව්‍ය මාර්ගය';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'ස්පීකරය';

  @override
  String get settingsAudioRouteHeadphones => 'හෙඩ්ෆෝන්';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'දෝෂ නිර්ණය';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'වීඩියෝ මට්ටම';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'වීඩියෝ පරාසය';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'උපසිරැසි කෝඩෙක්';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'අවසර ලත් ශ්‍රව්‍ය කෝඩෙක්';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS ශ්‍රව්‍ය කෝඩෙක්';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 ශ්‍රව්‍ය කෝඩෙක්';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif පාස්ත්‍රූ';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'ක්‍රියාකාරී ශ්‍රව්‍ය මාර්ගය';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'මාර්ගයේ HD ශ්‍රව්‍ය සහාය';

  @override
  String get nightMode => 'රාත්රී මාදිලිය';

  @override
  String get compressDynamicRange => 'ගතික පරාසය සම්පීඩනය කරන්න';

  @override
  String get advancedMpv => 'උසස් mpv';

  @override
  String get enableCustomMpvConf => 'අභිරුචි mpv.conf සබල කරන්න';

  @override
  String get applyMpvConfBeforePlayback =>
      'නැවත ධාවනය ආරම්භ කිරීමට පෙර පරිශීලක-නිශ්චිත mpv.conf යොදන්න';

  @override
  String get unsafeAdvancedMpvOptions => 'අනාරක්ෂිත උසස් mpv විකල්ප';

  @override
  String get unsafeMpvOptionsDescription =>
      'පුළුල් mpv විකල්ප කට්ටලයකට ඉඩ දෙන්න. පසුධාවන හැසිරීම බිඳ දැමිය හැක.';

  @override
  String get hardwareDecoding => 'දෘඪාංග විකේතනය කිරීම';

  @override
  String get hardwareDecodingSubtitle =>
      'කාර්ය සාධනය වැඩි දියුණු කළ හැකි නමුත් සමහර උපාංගවල නැවත ධාවනය ගැටලු ඇති කළ හැක.';

  @override
  String get nextUpAndQueuing => 'ඊළඟට සහ පෝලිමේ';

  @override
  String get nextUpDisplay => 'ඊළඟට දර්ශනය';

  @override
  String get extended => 'දිගු කර ඇත';

  @override
  String get minimal => 'අවමයි';

  @override
  String get nextUpTimeout => 'ඊළඟට කල් ඉකුත්වීම';

  @override
  String secondsValue(int value) {
    return '$valueතත්';
  }

  @override
  String get mediaQueuing => 'මාධ්‍ය පෝලිමේ';

  @override
  String get autoQueueNextEpisodes => 'මීළඟ කථාංග ස්වයංක්‍රීය පෝලිමේ';

  @override
  String get stillWatchingPrompt => 'තවමත් Prompt නරඹමින්';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'කථාංග $episodesක් / පැය $hoursකට පසු';
  }

  @override
  String get resumeAndSkip => 'දිගටම කිරීම සහ මඟහැරීම';

  @override
  String get resumeRewind => 'දිගටම කිරීමේදී ආපසු යාම';

  @override
  String get unpauseRewind => 'Rewind නවත්වන්න';

  @override
  String get fiveSeconds => 'තත්පර 5 යි';

  @override
  String get tenSeconds => 'තත්පර 10 යි';

  @override
  String get fifteenSeconds => 'තත්පර 15 යි';

  @override
  String get thirtySeconds => 'තත්පර 30 යි';

  @override
  String get skipBackLength => 'ආපසු මඟහරින කාලය';

  @override
  String get skipForwardLength => 'ඉදිරියට මඟහරින කාලය';

  @override
  String get customMpvConfPath => 'අභිරුචි mpv.conf මාර්ගය';

  @override
  String get notSetMpvConf =>
      'සකසා නැත. Moonfin යෙදුම්/දත්ත ෆෝල්ඩරවල පෙරනිමි mpv.conf එකක් උත්සාහ කරනු ඇත.';

  @override
  String get selectMpvConf => 'mpv.conf තෝරන්න';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'විලාස සැකසුම් (ප්‍රමාණය, වර්ණය, ඕෆ්සෙට්) පෙළ-පාදක උපසිරැසි සඳහා (SRT, VTT, TTML) අදාළ වේ. \"ASS/SSA Direct Play\" ක්‍රියාවිරහිත කර ඇත්නම් මිස ASS/SSA උපසිරැසි ඔවුන්ගේම කාවැද්දූ මෝස්තරයක් භාවිතා කරයි. Bitmap උපසිරැසි (PGS, DVB, VobSub) නැවත සකස් කළ නොහැක.';

  @override
  String get defaultSubtitleLanguage => 'පෙරනිමි උපසිරැසි භාෂාව';

  @override
  String get defaultToNoSubtitles => 'උපසිරැසි නැත යන්නට පෙරනිමිය';

  @override
  String get turnOffSubtitlesByDefault => 'පෙරනිමියෙන් උපසිරැසි අක්‍රිය කරන්න';

  @override
  String get subtitleSize => 'උපසිරැසි ප්රමාණය';

  @override
  String get textFillColor => 'පෙළ පිරවුම් වර්ණය';

  @override
  String get backgroundColor => 'පසුබිම් වර්ණය';

  @override
  String get textStrokeColor => 'පෙළ පහර වර්ණය';

  @override
  String get subtitleCustomization => 'උපසිරැසි අභිරුචිකරණය';

  @override
  String get subtitleCustomizationDescription =>
      'උපසිරැසි පෙනුම අභිරුචිකරණය කරන්න';

  @override
  String get subtitleMode => 'උපසිරැසි ප්‍රකාරය';

  @override
  String get subtitleModeFlagged => 'සලකුණු කළ';

  @override
  String get subtitleModeAlways => 'සැමවිටම';

  @override
  String get subtitleModeForeign => 'විදෙස්';

  @override
  String get subtitleModeForced => 'බලාත්මක';

  @override
  String get subtitleModeFlaggedDescription =>
      'මාධ්‍ය ගොනුවේ පාරදත්තවල \"default\" හෝ \"forced\" ලෙස අභ්‍යන්තරව සලකුණු කර ඇති පථ වාදනය කරයි.';

  @override
  String get subtitleModeAlwaysDescription =>
      'වීඩියෝවක් ආරම්භ වන සෑම විටම ස්වයංක්‍රීයව උපසිරැසි පූරණය කර පෙන්වයි.';

  @override
  String get subtitleModeForeignDescription =>
      'පෙරනිමි ශ්‍රව්‍ය පථය විදෙස් භාෂාවකින් නම් ස්වයංක්‍රීයව උපසිරැසි ක්‍රියාත්මක කරයි.';

  @override
  String get subtitleModeForcedDescription =>
      'forced පාරදත්ත සලකුණින් පැහැදිලිව ටැග් කර ඇති උපසිරැසි පමණක් පූරණය කරයි.';

  @override
  String get subtitleModeNoneDescription =>
      'ස්වයංක්‍රීය උපසිරැසි පූරණය සම්පූර්ණයෙන්ම අබල කරයි.';

  @override
  String get fallbackSubtitleLanguage => 'විකල්ප උපසිරැසි භාෂාව';

  @override
  String get subtitleStream => 'උපසිරැසි ප්‍රවාහය';

  @override
  String get subtitlePreviewText =>
      'ඉක්මන් දුඹුරු නරියා කම්මැලි බල්ලා උඩින් පනිනවා';

  @override
  String get verticalOffset => 'සිරස් ඕෆ්සෙට්';

  @override
  String get pgsDirectPlay => 'PGS සෘජු වාදනය';

  @override
  String get directPlayPgsSubtitles => 'සෘජු වාදනය PGS උපසිරැසි';

  @override
  String get assSsaDirectPlay => 'ASS/SSA සෘජු වාදනය';

  @override
  String get directPlayAssSsaSubtitles => 'සෘජු වාදනය ASS/SSA උපසිරැසි';

  @override
  String get white => 'සුදු';

  @override
  String get black => 'කළු';

  @override
  String get yellow => 'කහ';

  @override
  String get green => 'කොළ පාටයි';

  @override
  String get cyan => 'සියන්';

  @override
  String get red => 'රතු';

  @override
  String get transparent => 'විනිවිද පෙනෙන';

  @override
  String get semiTransparentBlack => 'අර්ධ විනිවිද පෙනෙන කළු';

  @override
  String get global => 'ගෝලීය';

  @override
  String get desktop => 'ඩෙස්ක්ටොප්';

  @override
  String get mobile => 'ජංගම';

  @override
  String get tv => 'රූපවාහිනිය';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile පැතිකඩේ සැකසීම් පූරණය කරන ලදී.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile පැතිකඩේ සැකසීම් පූරණය කිරීමට අසමත් විය.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'දේශීය සැකසීම් $profile පැතිකඩට සමමුහුර්ත කරන ලදී.';
  }

  @override
  String get customizationProfile => 'අභිරුචිකරණ පැතිකඩ';

  @override
  String get customizationProfileDescription =>
      'පූරණය කිරීමට, සංස්කරණය කිරීමට සහ සමමුහුර්ත කිරීමට පැතිකඩ තෝරන්න. උපාංග පැතිකඩක් එය අභිබවා යන්නේ නම් මිස Global සෑම තැනකම අදාළ වේ. හරිත තිත ඔබගේ වත්මන් උපාංග පැතිකඩ සලකුණු කරයි.';

  @override
  String get loadProfile => 'පැතිකඩ පූරණය කරන්න';

  @override
  String get syncing => 'සමමුහුර්ත කරමින්...';

  @override
  String get syncToProfile => 'පැතිකඩ වෙත සමමුහුර්ත කරන්න';

  @override
  String get profileSyncHidden => 'පැතිකඩ සමමුහුර්ත කිරීම සැඟවී ඇත';

  @override
  String get enablePluginSyncDescription =>
      'මෙහි පැතිකඩ පාලන පෙන්වීමට Plugin සැකසීම් තුළ Server Plugin Sync සබල කරන්න.';

  @override
  String get quality => 'ගුණාත්මකභාවය';

  @override
  String get defaultDownloadQuality => 'පෙරනිමි බාගත කිරීමේ ගුණාත්මකභාවය';

  @override
  String get network => 'ජාලය';

  @override
  String get wifiOnlyDownloads => 'WiFi-පමණි බාගැනීම්';

  @override
  String get reportDownloadsActivity => 'සේවාදායකයේ බාගැනීම් පෙන්වන්න';

  @override
  String get reportDownloadsActivitySubtitle =>
      'ඔබේ ට්‍රාන්ස්කෝඩ් කළ බාගැනීම් උපකරණ පුවරුවේ බැලීමට සේවාදායක පරිපාලකයාට ඉඩ දෙන්න';

  @override
  String get onlyDownloadOnWifi => 'WiFi වෙත සම්බන්ධ වූ විට පමණක් බාගත කරන්න';

  @override
  String get storage => 'ගබඩා කිරීම';

  @override
  String get storageUsed => 'භාවිතා කරන ගබඩා';

  @override
  String get manage => 'කළමනාකරණය කරන්න';

  @override
  String get calculating => 'ගණනය කරමින්...';

  @override
  String get downloadLocation => 'ස්ථානය බාගන්න';

  @override
  String get defaultLabel => 'පෙරනිමිය';

  @override
  String get saveToDownloadsFolder => 'බාගැනීම් ෆෝල්ඩරයට සුරකින්න';

  @override
  String get downloadsVisibleToOtherApps =>
      'බාගැනීම්/Moonfin — වෙනත් යෙදුම්වලට දෘශ්‍යමාන වේ';

  @override
  String get dangerZone => 'අවදානම් කලාපය';

  @override
  String get clearAllDownloads => 'සියලුම බාගැනීම් හිස් කරන්න';

  @override
  String get original => 'මුල්';

  @override
  String get changeDownloadLocation => 'බාගැනීම් ස්ථානය වෙනස් කරන්න';

  @override
  String get changeDownloadLocationDescription =>
      'නව බාගැනීම් තෝරාගත් ෆෝල්ඩරයට සුරකිනු ඇත. පවතින බාගැනීම් ඒවායේ වත්මන් ස්ථානයේ පවතිනු ඇති අතර ගබඩා සැකසීම් වෙතින් කළමනාකරණය කළ හැක.';

  @override
  String get confirm => 'තහවුරු කරන්න';

  @override
  String get cannotWriteToFolder =>
      'තෝරාගත් ෆෝල්ඩරයට ලිවිය නොහැක. කරුණාකර වෙනත් ස්ථානයක් තෝරන්න හෝ ගබඩා අවසර ලබා දෙන්න.';

  @override
  String get saveToDownloadsFolderQuestion => 'බාගැනීම් ෆෝල්ඩරයට සුරකින්නද?';

  @override
  String get saveToDownloadsFolderDescription =>
      'බාගත කළ මාධ්‍ය ඔබගේ උපාංගයේ බාගැනීම්/Moonfin වෙත සුරකිනු ඇත. මෙම ගොනු ඔබගේ ගැලරිය හෝ සංගීත වාදකය වැනි වෙනත් යෙදුම්වලට දෘශ්‍යමාන වනු ඇත.\n\nපවතින බාගැනීම් ඒවායේ වත්මන් ස්ථානයේ පවතිනු ඇත.';

  @override
  String get enable => 'සබල කරන්න';

  @override
  String get clearAllDownloadsWarning =>
      'මෙය බාගත කළ සියලුම මාධ්‍ය මකනු ඇති අතර පසුගමනය කළ නොහැක.';

  @override
  String get clearAll => 'සියල්ල හිස් කරන්න';

  @override
  String get navigationStyle => 'නාවික විලාසය';

  @override
  String get topBar => 'ඉහළ තීරුව';

  @override
  String get leftSidebar => 'වම් පැති තීරුව';

  @override
  String get showShuffleButton => 'ෂෆල් බොත්තම පෙන්වන්න';

  @override
  String get showGenresButton => 'ප්‍රභේද බොත්තම පෙන්වන්න';

  @override
  String get showFavoritesButton => 'ප්‍රියතම බොත්තම පෙන්වන්න';

  @override
  String get showLibrariesInToolbar => 'මෙවලම් තීරුවේ පුස්තකාල පෙන්වන්න';

  @override
  String get navbarAlwaysExpanded => 'සංචාලන තීරුවේ ලේබල සැමවිටම විදහන්න';

  @override
  String get showSeerrButton => 'Seerr බොත්තම පෙන්වන්න';

  @override
  String get navbarOpacity => 'Navbar පාරාන්ධතාව';

  @override
  String get navbarColor => 'නවබාර් වර්ණය';

  @override
  String get gray => 'අළු';

  @override
  String get darkBlue => 'තද නිල්';

  @override
  String get purple => 'දම් පාට';

  @override
  String get teal => 'ටීල්';

  @override
  String get navy => 'නාවික හමුදාව';

  @override
  String get charcoal => 'අඟුරු';

  @override
  String get brown => 'දුඹුරු';

  @override
  String get darkRed => 'තද රතු';

  @override
  String get darkGreen => 'තද කොළ';

  @override
  String get slate => 'ස්ලයිට්';

  @override
  String get indigo => 'ඉන්ඩිගෝ';

  @override
  String get libraryDisplay => 'පුස්තකාල සංදර්ශකය';

  @override
  String get posterLabel => 'පෝස්ටර්';

  @override
  String get thumbnailLabel => 'සිඟිති රුව';

  @override
  String get bannerLabel => 'බැනරය';

  @override
  String get overridePerLibrarySettings => 'එක් පුස්තකාලයේ සිටුවම් අභිබවා යන්න';

  @override
  String get applyImageTypeToAllLibraries =>
      'සියලුම පුස්තකාල සඳහා රූප වර්ගය යොදන්න';

  @override
  String get multiServerLibraries => 'බහු-සේවාදායක පුස්තකාල';

  @override
  String get showLibrariesFromAllServers =>
      'සියලුම සම්බන්ධිත සර්වර් වලින් පුස්තකාල පෙන්වන්න';

  @override
  String get enableFolderView => 'ෆෝල්ඩර දර්ශනය සබල කරන්න';

  @override
  String get showFolderBrowsingOption => 'ෆෝල්ඩර බ්‍රවුසින් විකල්පය පෙන්වන්න';

  @override
  String get groupItemsIntoCollections => 'අයිතම එකතුවලට කාණ්ඩගත කරන්න';

  @override
  String get hideCollectionAssociatedItems =>
      'පුස්තකාල පිරික්සන විට එකතුවකට අයත් පුස්තකාල අයිතම සඟවන්න';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'පුස්තකාල කාණ්ඩගත කිරීමේ දැන්වීම';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'මෙම සැකසුම භාවිත කිරීමට, ඔබේ Jellyfin හෝ Emby සේවාදායකයේ ඔබේ පුස්තකාලයේ Display සැකසීම් යටතේ \"Group movies into collections\" සහ/හෝ \"Group shows into collections\" පුස්තකාල සැකසීම් සබල කර ඇති බවට වග බලා ගන්න.';

  @override
  String get libraryVisibility => 'පුස්තකාල දෘශ්‍යතාව';

  @override
  String get libraryVisibilityDescription =>
      'පුස්තකාලයකට මුල් පිටුව දෘශ්‍යතාව ටොගල් කරන්න. වෙනස්කම් බලාත්මක වීමට Moonfin නැවත ආරම්භ කරන්න.';

  @override
  String get showInNavigation => 'සංචාලනය තුළ පෙන්වන්න';

  @override
  String get showInLatestMedia => 'නවතම මාධ්‍යවල පෙන්වන්න';

  @override
  String get sourceLibraries => 'මූලාශ්ර පුස්තකාල';

  @override
  String get sourceCollections => 'මූලාශ්ර එකතු කිරීම්';

  @override
  String get excludedGenres => 'බැහැර කළ ප්‍රභේද';

  @override
  String get selectAll => 'සියල්ල තෝරන්න';

  @override
  String itemsSelected(int count) {
    return '$countක් තෝරා ඇත';
  }

  @override
  String get mediaBar => 'මාධ්ය තීරුව';

  @override
  String get mediaSources => 'මාධ්ය මූලාශ්ර';

  @override
  String get behavior => 'හැසිරීම';

  @override
  String get seconds => 'තත්පර';

  @override
  String get localPreviews => 'දේශීය පෙරදසුන්';

  @override
  String get localPreviewsDescription =>
      'ට්‍රේලරය, මාධ්‍ය සහ ශ්‍රව්‍ය පෙරදසුන් වින්‍යාස කරන්න.';

  @override
  String get mediaBarMode => 'මාධ්‍ය තීරු විලාසය';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD අතර තෝරන්න, නැතහොත් මාධ්‍ය තීරුව අක්‍රිය කරන්න';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'මැක්ඩී';

  @override
  String get mediaBarModeOff => 'අක්‍රියයි';

  @override
  String get enableMediaBar => 'මාධ්‍ය තීරුව සබල කරන්න';

  @override
  String get showFeaturedContentSlideshow =>
      'නිවසේ විශේෂාංගගත අන්තර්ගත විනිවිදක පෙන්වන්න';

  @override
  String get contentType => 'අන්තර්ගත වර්ගය';

  @override
  String get moviesAndTvShows => 'චිත්‍රපට සහ රූපවාහිනී වැඩසටහන්';

  @override
  String get moviesOnly => 'චිත්‍රපට පමණයි';

  @override
  String get tvShowsOnly => 'රූපවාහිනී වැඩසටහන් පමණි';

  @override
  String get itemCount => 'අයිතම ගණන';

  @override
  String get noneSelected => 'කිසිවක් තෝරා නැත';

  @override
  String get noneExcluded => 'කිසිවක් බැහැර කර නැත';

  @override
  String get autoAdvance => 'ස්වයංක්‍රීය අත්තිකාරම්';

  @override
  String get autoAdvanceSlides => 'ඊළඟ ස්ලයිඩයට ස්වයංක්‍රීයව ඉදිරියට යන්න';

  @override
  String get autoAdvanceInterval => 'ස්වයංක්‍රීය අත්තිකාරම් පරතරය';

  @override
  String get trailerPreview => 'ට්‍රේලර් පෙරදසුන';

  @override
  String get autoPlayTrailers =>
      'තත්පර 3කට පසු මාධ්‍ය තීරුවේ ට්‍රේලර් ස්වයංක්‍රීයව ධාවනය කරන්න';

  @override
  String get trailerAudio => 'ට්‍රේලර ශ්‍රව්‍යය';

  @override
  String get enableTrailerAudio =>
      'මාධ්‍ය තීරුවේ ට්‍රේලර සඳහා ශ්‍රව්‍යය සබල කරන්න';

  @override
  String get episodePreview => 'කථාංග පෙරදසුන';

  @override
  String get mediaPreview => 'මාධ්ය පෙරදසුන';

  @override
  String get episodePreviewDescription =>
      'නාභිගත, සැරිසැරූ, හෝ දිගු-පීඩිත කාඩ්පත් මත තත්පර 30ක පේළිගත පෙරදසුනක් වාදනය කරන්න';

  @override
  String get mediaPreviewDescription =>
      'නාභිගත, සැරිසැරූ, හෝ දිගු වේලාවක් එබූ කාඩ්පත් මත තත්පර 30ක පේළිගත පෙරදසුනක් වාදනය කරන්න';

  @override
  String get previewAudio => 'ශ්‍රව්‍ය පෙරදසුන් කරන්න';

  @override
  String get enablePreviewAudio =>
      'ට්‍රේලරය සහ කථාංග පෙරදසුන් සඳහා ශ්‍රව්‍ය සබල කරන්න';

  @override
  String get latestMedia => 'නවතම මාධ්‍ය';

  @override
  String get recentlyReleased => 'මෑතකදී නිකුත් කරන ලදී';

  @override
  String get myMedia => 'මගේ මාධ්‍ය';

  @override
  String get myMediaSmall => 'මගේ මාධ්‍ය (කුඩා)';

  @override
  String get continueWatching => 'නැරඹීම දිගටම කරගෙන යන්න';

  @override
  String get resumeAudio => 'ශ්‍රව්‍ය නැවත ආරම්භ කරන්න';

  @override
  String get resumeBooks => 'පොත් නැවත ආරම්භ කරන්න';

  @override
  String get activeRecordings => 'ක්රියාකාරී පටිගත කිරීම්';

  @override
  String get playlists => 'ධාවන ලැයිස්තු';

  @override
  String get liveTV => 'සජීවී රූපවාහිනිය';

  @override
  String get homeSections => 'මුල් පිටුව කොටස්';

  @override
  String get resetToDefaults => 'පෙරනිමියට යළි පිහිටුවන්න';

  @override
  String get homeRowPosterSize => 'මුල් පේළි පෝස්ටර් ප්රමාණය';

  @override
  String get perRowImageTypeSelection => 'පේළියකට රූප වර්ගය තේරීම';

  @override
  String get configureImageTypeForEachRow =>
      'එක් එක් සක්‍රීය මුල් පේළිය සඳහා රූප වර්ගය වින්‍යාස කරන්න';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'දිගටම නැරඹීම සහ ඊළඟට ඒකාබද්ධ කරන්න';

  @override
  String get combineBothRows => 'පේළි දෙකම එක් නිවසක කොටසකට ඒකාබද්ධ කරන්න';

  @override
  String get fullScreenRows => 'විස්තීරණ මුල් තිර පේළි';

  @override
  String get fullScreenRowsDescription =>
      'මුල් තිර පේළි එක් තිරයකට පේළි 1කට සීමා කරන්න';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'පේළි රූප වර්ගය අනුව';

  @override
  String get perRowSettings => 'පේළියකට සැකසීම්';

  @override
  String get autoLogin => 'ස්වයංක්‍රීය පිවිසුම';

  @override
  String get lastUser => 'අවසාන පරිශීලකයා';

  @override
  String get currentUser => 'වත්මන් පරිශීලකයා';

  @override
  String get alwaysAuthenticate => 'සැමවිටම සත්‍යාපනය කරන්න';

  @override
  String get requirePasswordWithToken =>
      'ගබඩා කර ඇති ටෝකනය සමඟ පවා මුරපදය අවශ්‍ය වේ';

  @override
  String get confirmExit => 'පිටවීම තහවුරු කරන්න';

  @override
  String get showConfirmationBeforeExiting =>
      'පිටවීමට පෙර තහවුරු කිරීම පෙන්වන්න';

  @override
  String get blockContentWithRatings =>
      'පහත ශ්‍රේණිගත කිරීම් සමඟ අන්තර්ගතය අවහිර කරන්න:';

  @override
  String get noContentRatingsFound =>
      'මෙම සේවාදායකයේ අන්තර්ගත ශ්‍රේණිගත කිරීම් තවමත් හමු නොවීය.';

  @override
  String get couldNotLoadServerRatings =>
      'සේවාදායක ශ්‍රේණිගත කිරීම් පූරණය කළ නොහැකි විය. සුරැකි ඇගයීම් පමණක් පෙන්වමින්.';

  @override
  String get couldNotRefreshRatings =>
      'සේවාදායකයෙන් ශ්‍රේණිගත කිරීම් නැවුම් කිරීමට නොහැකි විය. සුරැකි ඇගයීම් පෙන්වමින්.';

  @override
  String get enablePinCode => 'PIN කේතය සබල කරන්න';

  @override
  String get requirePinToAccess =>
      'ඔබගේ ගිණුමට ප්‍රවේශ වීමට PIN එකක් අවශ්‍ය වේ';

  @override
  String get changePin => 'PIN වෙනස් කරන්න';

  @override
  String get setNewPinCode => 'නව PIN කේතයක් සකසන්න';

  @override
  String get removePin => 'PIN ඉවත් කරන්න';

  @override
  String get removePinProtection => 'PIN කේත ආරක්ෂාව ඉවත් කරන්න';

  @override
  String get screensaver => 'තිර සුරැකුම';

  @override
  String get inAppScreensaver => 'යෙදුම තුළ තිර සුරැකුම';

  @override
  String get enableBuiltInScreensaver => 'බිල්ට් තිර සුරැකුම සබල කරන්න';

  @override
  String get mode => 'ප්‍රකාරය';

  @override
  String get libraryArt => 'පුස්තකාල කලාව';

  @override
  String get logo => 'ලාංඡනය';

  @override
  String get clock => 'ඔරලෝසුව';

  @override
  String get timeout => 'කාලය හමාරයි';

  @override
  String minutesShort(int minutes) {
    return 'මිනි. $minutes';
  }

  @override
  String get dimmingLevel => 'අඳුරු මට්ටම';

  @override
  String get maxAgeRating => 'උපරිම වයස් ශ්‍රේණිගත කිරීම';

  @override
  String get any => 'ඕනෑම';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'වයස් ශ්රේණිගත කිරීම අවශ්ය වේ';

  @override
  String get onlyShowRatedContent => 'ශ්‍රේණිගත කළ අන්තර්ගතය පමණක් පෙන්වන්න';

  @override
  String get showClock => 'ඔරලෝසුව පෙන්වන්න';

  @override
  String get displayClockDuringScreensaver =>
      'තිර සුරැකුම අතරතුර ඔරලෝසුව පෙන්වන්න';

  @override
  String get clockModeStatic => 'ස්ථිර';

  @override
  String get clockModeBouncing => 'පනින';

  @override
  String get rottenTomatoesCritics => 'කුණු වූ තක්කාලි (විවේචකයන්)';

  @override
  String get rottenTomatoesAudience => 'කුණු තක්කාලි (ප්‍රේක්ෂක)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'මෙටාක්‍රිටික්';

  @override
  String get metacriticUser => 'Metacritic (පරිශීලක)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'ලිපි පෙට්ටිය';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'ඇනිලිස්ට්';

  @override
  String get communityRating => 'ප්‍රජා ශ්‍රේණිගත කිරීම';

  @override
  String get ratings => 'ශ්රේණිගත කිරීම්';

  @override
  String get additionalRatings => 'අතිරේක ශ්රේණිගත කිරීම්';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList සහ TMDB ශ්‍රේණිගත කිරීම් පෙන්වන්න';

  @override
  String get ratingLabels => 'ශ්‍රේණිගත කිරීමේ ලේබල';

  @override
  String get showLabelsNextToIcons =>
      'ශ්‍රේණිගත කිරීමේ අයිකන අසල ලේබල පෙන්වන්න';

  @override
  String get ratingBadges => 'ශ්‍රේණිගත කිරීමේ ලාංඡන';

  @override
  String get showDecorativeBadges =>
      'ශ්‍රේණිගත කිරීම් පිටුපස අලංකාර ලාංඡන පෙන්වන්න';

  @override
  String get episodeRatings => 'කථාංග ශ්‍රේණිගත කිරීම්';

  @override
  String get showRatingsOnEpisodes => 'තනි කථාංග මත ශ්‍රේණිගත කිරීම් පෙන්වන්න';

  @override
  String get ratingSources => 'ශ්රේණිගත කිරීමේ මූලාශ්ර';

  @override
  String get ratingSourcesDescription =>
      'යෙදුම පුරා පෙන්වා ඇති ශ්‍රේණිගත කිරීමේ මූලාශ්‍ර සබල කර නැවත ඇණවුම් කරන්න';

  @override
  String get pluginLabel => 'Moonbase ප්ලගිනය';

  @override
  String get pluginDetected => 'ප්ලගිනය අනාවරණය විය';

  @override
  String get pluginNotDetected => 'ප්ලගිනය අනාවරණය කර නොමැත';

  @override
  String get pluginDetectedDescription =>
      'සේවාදායක ප්ලගිනය අනාවරණය විය. පළමු වරට ප්ලගිනය සොයාගත් විට සමමුහුර්ත කිරීම ස්වයංක්‍රීයව සක්‍රීය වේ.';

  @override
  String get pluginNotDetectedDescription =>
      'සේවාදායක ප්ලගිනය දැනට අනාවරණය කර නොමැත. ස්ථානීය සැකසීම් තවමත් ඒවායේ සුරැකි අගයන් හෝ බිල්ට් පෙරනිමි භාවිතා කරයි.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nඅනුවාදය: $version';
  }

  @override
  String get availableServices => 'ලබා ගත හැකි සේවා';

  @override
  String get serverPluginSync => 'සේවාදායක ප්ලගින සමමුහුර්තකරණය';

  @override
  String get syncSettingsWithPlugin =>
      'සේවාදායක ප්ලගිනය සමඟ සැකසුම් සමමුහුර්ත කරන්න';

  @override
  String get whatSyncControls => 'සමමුහුර්ත පාලන මොනවාද';

  @override
  String get syncControlsDescription =>
      'සමමුහුර්තකරණය පාලනය කරන්නේ ප්ලගින පිටුබලය සහිත සැකසුම් සේවාදායකය වෙත තල්ලු කර ඇදගෙන යාම පමණි. ප්ලගින සමමුහුර්තකරණය සබල කර ඇති විට පැතිකඩ තේරීම සහ පැතිකඩ සමමුහුර්ත කිරීමේ ක්‍රියා අභිරුචිකරණ සැකසීම් තුළ ඇත.';

  @override
  String get recentRequests => 'මෑත ඉල්ලීම්';

  @override
  String get recentlyAdded => 'මෑතකදී එකතු කරන ලදී';

  @override
  String get trending => 'ප්රවණතා';

  @override
  String get popularMovies => 'ජනප්‍රිය චිත්‍රපට';

  @override
  String get movieGenres => 'චිත්‍රපට ප්‍රභේද';

  @override
  String get upcomingMovies => 'ඉදිරියට එන චිත්‍රපට';

  @override
  String get studios => 'චිත්රාගාර';

  @override
  String get popularSeries => 'ජනප්‍රිය මාලාව';

  @override
  String get seriesGenres => 'ශ්‍රේණි ප්‍රභේද';

  @override
  String get upcomingSeries => 'ඉදිරි මාලාව';

  @override
  String get networks => 'ජාල';

  @override
  String get seerrDiscoveryRows => 'Seerr සොයාගැනීමේ පේළි';

  @override
  String get resetRowsToDefaults => 'පේළි පෙරනිමියට නැවත සකසන්න';

  @override
  String get enableSeerr => 'Seerr සබල කරන්න';

  @override
  String get showSeerrInNavigation =>
      'සංචාලනයේ Seerr පෙන්වන්න (සේවාදායක ප්ලගිනය අවශ්‍යයි)';

  @override
  String get seerrUnavailable =>
      'සේවාදායක ප්ලගිනය Seerr සහාය අක්‍රිය කර ඇති නිසා ලබා ගත නොහැක.';

  @override
  String get nsfwFilter => 'NSFW පෙරහන';

  @override
  String get hideAdultContent => 'ප්‍රතිඵලවල වැඩිහිටි අන්තර්ගතය සඟවන්න';

  @override
  String get seerrNotificationsSection => 'දැනුම්දීම්';

  @override
  String get seerrNotifyNewRequestsTitle => 'නව ඉල්ලීම් දැනුම්දීම්';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'යමෙකු ඉල්ලීමක් ඉදිරිපත් කරන විට මට දැනුම් දෙන්න';

  @override
  String get seerrNotifyLibraryAddedTitle => 'ඉල්ලීම් යාවත්කාලීන';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'අනුමත කළ, ප්‍රතික්ෂේප කළ සහ ඔබේ පුස්තකාලයට එක් කළ';

  @override
  String get seerrNotifyIssuesTitle => 'ගැටලු යාවත්කාලීන';

  @override
  String get seerrNotifyIssuesSubtitle => 'නව ගැටලු, පිළිතුරු සහ විසඳුම්';

  @override
  String loggedInAs(String username) {
    return 'පුරන ලද්දේ: $username';
  }

  @override
  String get discoverRows => 'Seerr සොයාගැනීමේ පිටුව';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr ප්‍රධාන පිටුවේ දැකීමට පේළි සබල කරන්න. නැවත පිළිවෙළට සැකසීමට ඇදගෙන යන්න. අභිරුචි පිළිවෙළ Moonbase සමඟ සමමුහුර්ත වේ.';

  @override
  String get discoverRowsDescription =>
      'Seerr ප්‍රධාන පිටුවේ දැකීමට පේළි සබල කරන්න. නැවත පිළිවෙළට සැකසීමට ඇදගෙන යන්න. අභිරුචි පිළිවෙළ Moonbase සමඟ සමමුහුර්ත වේ.';

  @override
  String get enabled => 'සක්‍රියයි';

  @override
  String get hidden => 'සැඟවී ඇත';

  @override
  String get aboutTitle => 'ගැන';

  @override
  String versionValue(String version) {
    return 'අනුවාදය $version';
  }

  @override
  String get openSourceLicenses => 'විවෘත මූලාශ්ර බලපත්ර';

  @override
  String get sourceCode => 'මූලාශ්ර කේතය';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'දැන් යාවත්කාලීන සඳහා පරීක්ෂා කරන්න';

  @override
  String get checksLatestDesktopRelease =>
      'මෙම වේදිකාව සඳහා නවතම ඩෙස්ක්ටොප් නිකුතුව පරීක්ෂා කරයි';

  @override
  String get youAreUpToDate => 'ඔබ යාවත්කාලීනයි.';

  @override
  String get couldNotCheckForUpdates =>
      'දැන් යාවත්කාලීන සඳහා පරීක්ෂා කළ නොහැක.';

  @override
  String get noCompatibleUpdate =>
      'මෙම වේදිකාව සඳහා ගැළපෙන යාවත්කාලීන පැකේජයක් හමු නොවීය.';

  @override
  String get updateChecksNotSupported =>
      'යාවත්කාලීන චෙක්පත් මෙම වේදිකාවේ සහාය නොදක්වයි.';

  @override
  String get updateNotificationsDisabled => 'යාවත්කාලීන දැනුම්දීම් අබල කර ඇත.';

  @override
  String get pleaseWaitBeforeChecking =>
      'කරුණාකර නැවත පරීක්ෂා කිරීමට පෙර රැඳී සිටින්න.';

  @override
  String get latestUpdateAlreadyShown => 'නවතම යාවත්කාලීනය දැනටමත් පෙන්වා ඇත.';

  @override
  String get updateAvailable => 'යාවත්කාලීන ලබා ගත හැක.';

  @override
  String updateAvailableVersion(String version) {
    return 'යාවත්කාලීනයක් තිබේ: v$version';
  }

  @override
  String get updateNotifications => 'දැනුම්දීම් යාවත්කාලීන කරන්න';

  @override
  String get showWhenUpdatesAvailable => 'යාවත්කාලීන ලබා ගත හැකි විට පෙන්වන්න';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version තිබේ';
  }

  @override
  String get readReleaseNotes => 'නිකුතු සටහන් කියවන්න';

  @override
  String get downloadingUpdate => 'යාවත්කාලීනය බාගනිමින්...';

  @override
  String get updateDownloadFailed =>
      'යාවත්කාලීන බාගැනීම අසාර්ථක විය. කරුණාකර නැවත උත්සාහ කරන්න.';

  @override
  String get openReleasesPage => 'නිකුතු පිටුව විවෘත කරන්න';

  @override
  String get navigation => 'සංචලනය';

  @override
  String get watchedIndicatorsBackdrops => 'දර්ශක, පසුතල නැරඹුවා';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'නාභිගත වර්ණය, නැරඹූ දර්ශක, පසුතල';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar විලාසය, මෙවලම් තීරු බොත්තම්, පෙනුම';

  @override
  String get reorderToggleHomeRows => 'මුල් පේළි නැවත සකස් කර ටොගල් කරන්න';

  @override
  String get featuredContentAppearance => 'විශේෂාංග අන්තර්ගතය, පෙනුම';

  @override
  String get posterSizeImageTypeFolderView =>
      'පෝස්ටර් ප්‍රමාණය, රූප වර්ගය, ෆෝල්ඩර දර්ශනය';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB, සහ ශ්‍රේණිගත කිරීමේ මූලාශ්‍ර';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'රූප හැඹිලි සීමාව';

  @override
  String get clearImageCache => 'රූප හැඹිලිය හිස් කරන්න';

  @override
  String get imageCacheCleared => 'රූප හැඹිලිය හිස් කරන ලදී';

  @override
  String get clear => 'හිස් කරන්න';

  @override
  String get browse => 'බ්‍රවුස් කරන්න';

  @override
  String get noResults => 'ප්‍රතිඵල නැත';

  @override
  String get seerrAvailableStatus => 'ලබා ගත හැක';

  @override
  String get seerrRequestedStatus => 'ඉල්ලා ඇත';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'බාගත වෙමින් · $percent%';
  }

  @override
  String get seerrImportingStatus => 'ආයාත වෙමින්';

  @override
  String itemsCount(int count) {
    return 'අයිතම $count';
  }

  @override
  String get seerrSettings => 'Seerr සැකසීම්';

  @override
  String get requestMore => 'තවත් ඉල්ලන්න';

  @override
  String get request => 'ඉල්ලීම';

  @override
  String get cancelRequest => 'ඉල්ලීම අවලංගු කරන්න';

  @override
  String get playInMoonfin => 'Moonfin හි සෙල්ලම් කරන්න';

  @override
  String requestedByName(String name) {
    return '$name විසින් ඉල්ලා ඇත';
  }

  @override
  String get approve => 'අනුමත කරන්න';

  @override
  String get declineAction => 'ප්රතික්ෂේප කරන්න';

  @override
  String get similar => 'සමානයි';

  @override
  String get recommendations => 'නිර්දේශ';

  @override
  String cancelRequestForTitle(String title) {
    return '\"$title\" සඳහා ඉල්ලීම අවලංගු කරන්නද?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" සඳහා ඉල්ලීම් $countක් අවලංගු කරන්නද?';
  }

  @override
  String get keep => 'තබා ගන්න';

  @override
  String get itemNotFoundInLibrary =>
      'ඔබගේ Moonfin පුස්තකාලයේ අයිතමය හමු නොවීය';

  @override
  String get errorSearchingLibrary => 'පුස්තකාලය සෙවීමේ දෝෂයකි';

  @override
  String budgetAmount(String amount) {
    return 'අයවැය: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'ආදායම: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type ඉල්ලන්න';
  }

  @override
  String get submitRequest => 'ඉල්ලීම ඉදිරිපත් කරන්න';

  @override
  String get allSeasons => 'සියලුම වාර';

  @override
  String get advancedOptions => 'උසස් විකල්ප';

  @override
  String get noServiceServersConfigured => 'සේවා සේවාදායකයන් වින්‍යාස කර නොමැත';

  @override
  String get server => 'සේවාදායකය';

  @override
  String get qualityProfile => 'ගුණාත්මක පැතිකඩ';

  @override
  String get rootFolder => 'මූල ෆෝල්ඩරය';

  @override
  String get showMore => 'තවත් පෙන්වන්න';

  @override
  String get appearances => 'පෙනී සිටීම්';

  @override
  String get crewSection => 'කාර්ය මණ්ඩලය';

  @override
  String ageValue(int age) {
    return 'වයස $age';
  }

  @override
  String get noRequests => 'ඉල්ලීම් නැත';

  @override
  String get pendingStatus => 'පොරොත්තුවෙන්';

  @override
  String get declinedStatus => 'ප්‍රතික්ෂේප කළා';

  @override
  String get partiallyAvailable => 'අර්ධ වශයෙන් පවතී';

  @override
  String get downloadingStatus => 'බාගත කිරීම';

  @override
  String get approvedStatus => 'අනුමත කළා';

  @override
  String get notRequestedStatus => 'ඉල්ලා නැත';

  @override
  String get blocklistedStatus => 'අවහිර ලැයිස්තුගත කර ඇත';

  @override
  String get deletedStatus => 'මකා දමන ලදී';

  @override
  String get failedStatus => 'අසාර්ථකයි';

  @override
  String get processingStatus => 'සකසමින්';

  @override
  String modifiedByName(String name) {
    return '$name විසින් වෙනස් කරන ලදී';
  }

  @override
  String get completedStatus => 'සම්පූර්ණයි';

  @override
  String get requestErrorDuplicate => 'මෙම මාතෘකාව දැනටමත් ඉල්ලා ඇත';

  @override
  String get requestErrorQuota => 'ඉල්ලීම් සීමාවට පැමිණ ඇත';

  @override
  String get requestErrorBlocklisted => 'මෙම මාතෘකාව අවහිර ලැයිස්තුවේ ඇත';

  @override
  String get requestErrorNoSeasons => 'ඉල්ලීමට තවත් වාර ඉතිරි නැත';

  @override
  String get requestErrorPermission => 'මෙම ඉල්ලීම කිරීමට ඔබට අවසර නැත';

  @override
  String get seerrRequestsTitle => 'ඉල්ලීම්';

  @override
  String get seerrIssuesTitle => 'ගැටලු';

  @override
  String get sortNewest => 'නවතම';

  @override
  String get sortLastModified => 'අවසන් වරට වෙනස් කළ';

  @override
  String get noIssues => 'ගැටලු නැත';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'චිත්‍රපට ඉල්ලීම් $limitන් $remainingක් ඉතිරියි';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'වාර ඉල්ලීම් $limitන් $remainingක් ඉතිරියි';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name හි කොටසකි';
  }

  @override
  String get viewCollection => 'එකතුව බලන්න';

  @override
  String get requestCollection => 'එකතුව ඉල්ලන්න';

  @override
  String collectionMoviesSummary(int total, int available) {
    return 'චිත්‍රපට $total · $availableක් තිබේ';
  }

  @override
  String requestMoviesCount(int count) {
    return 'චිත්‍රපට $countක් ඉල්ලන්න';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$totalන් $current ඉල්ලමින්...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'චිත්‍රපට $countක් ඉල්ලා ඇත';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'චිත්‍රපට $totalන් $okක් ඉල්ලා ඇත';
  }

  @override
  String get collectionAllRequested =>
      'සියලු චිත්‍රපට දැනටමත් තිබේ හෝ ඉල්ලා ඇත';

  @override
  String get reportIssue => 'ගැටලුව වාර්තා කරන්න';

  @override
  String get issueTypeVideo => 'වීඩියෝ';

  @override
  String get issueTypeAudio => 'ශ්‍රව්‍ය';

  @override
  String get whatsWrong => 'වැරැද්ද කුමක්ද?';

  @override
  String get allEpisodes => 'සියලු කථාංග';

  @override
  String get episode => 'කථාංගය';

  @override
  String get openStatus => 'විවෘතයි';

  @override
  String get resolvedStatus => 'විසඳා ඇත';

  @override
  String get resolveAction => 'විසඳන්න';

  @override
  String get reopenAction => 'නැවත විවෘත කරන්න';

  @override
  String reportedByName(String name) {
    return '$name විසින් වාර්තා කරන ලදී';
  }

  @override
  String commentsCount(int count) {
    return 'අදහස් $count';
  }

  @override
  String get addComment => 'අදහසක් එක් කරන්න';

  @override
  String get deleteIssueConfirm => 'මෙම ගැටලුව මකන්නද?';

  @override
  String get submitReport => 'වාර්තාව යොමු කරන්න';

  @override
  String get tmdbScore => 'TMDB ලකුණු';

  @override
  String get releaseDateLabel => 'නිකුත් කරන දිනය';

  @override
  String get firstAirDateLabel => 'පළමු ගුවන් දිනය';

  @override
  String get revenueLabel => 'ආදායම';

  @override
  String get runtimeLabel => 'ධාවන කාලය';

  @override
  String get budgetLabel => 'අයවැය';

  @override
  String get originalLanguageLabel => 'මුල් භාෂාව';

  @override
  String get seasonsLabel => 'වාර';

  @override
  String get episodesLabel => 'කථාංග';

  @override
  String get access => 'ප්රවේශය';

  @override
  String get add => 'එක් කරන්න';

  @override
  String get address => 'ලිපිනය';

  @override
  String get analytics => 'විශ්ලේෂණ';

  @override
  String get catalog => 'නාමාවලිය';

  @override
  String get content => 'අන්තර්ගතය';

  @override
  String get copy => 'පිටපත් කරන්න';

  @override
  String get create => 'නිර්මාණය කරන්න';

  @override
  String get disable => 'අක්රිය කරන්න';

  @override
  String get done => 'අවසන්';

  @override
  String get edit => 'සංස්කරණය කරන්න';

  @override
  String get encoding => 'කේතනය කිරීම';

  @override
  String get error => 'දෝෂයකි';

  @override
  String get forward => 'ඉදිරියට';

  @override
  String get general => 'සාමාන්‍ය';

  @override
  String get go => 'යන්න';

  @override
  String get install => 'ස්ථාපනය කරන්න';

  @override
  String get installed => 'ස්ථාපනය කර ඇත';

  @override
  String get interval => 'අන්තරය';

  @override
  String get name => 'නම';

  @override
  String get networking => 'ජාලකරණය';

  @override
  String get next => 'ඊළඟ';

  @override
  String get path => 'මාර්ගය';

  @override
  String get paused => 'විරාම කළා';

  @override
  String get permissions => 'අවසර';

  @override
  String get processing => 'සැකසීම';

  @override
  String get profile => 'පැතිකඩ';

  @override
  String get provider => 'සපයන්නා';

  @override
  String get refresh => 'නැවුම් කරන්න';

  @override
  String get remote => 'දුරස්ථ පාලකය';

  @override
  String get rename => 'නැවත නම් කරන්න';

  @override
  String get revoke => 'අවලංගු කරන්න';

  @override
  String get role => 'භූමිකාව';

  @override
  String get root => 'මූල';

  @override
  String get run => 'දුවන්න';

  @override
  String get search => 'සොයන්න';

  @override
  String get select => 'තෝරන්න';

  @override
  String get send => 'යවන්න';

  @override
  String get sessions => 'සැසි';

  @override
  String get set => 'සකසන්න';

  @override
  String get status => 'තත්ත්වය';

  @override
  String get stop => 'නවත්වන්න';

  @override
  String get streaming => 'ප්‍රවාහය';

  @override
  String get time => 'කාලය';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'අස්ථාපනය කරන්න';

  @override
  String get up => 'ඉහළට';

  @override
  String get update => 'යාවත්කාලීන කරන්න';

  @override
  String get upload => 'උඩුගත කරන්න';

  @override
  String get unmute => 'නිහඬ නොකරන්න';

  @override
  String get mute => 'නිහඬ කරන්න';

  @override
  String get branding => 'වෙළඳ නාමකරණය';

  @override
  String get adminDrawerDashboard => 'උපකරණ පුවරුව';

  @override
  String get adminDrawerAnalytics => 'විශ්ලේෂණ';

  @override
  String get adminDrawerSettings => 'සැකසීම්';

  @override
  String get adminDrawerBranding => 'වෙළඳ නාමකරණය';

  @override
  String get adminDrawerUsers => 'පරිශීලකයන්';

  @override
  String get adminDrawerLibraries => 'පුස්තකාල';

  @override
  String get adminDrawerDisplay => 'සංදර්ශනය';

  @override
  String get adminDrawerMetadata => 'පාරදත්ත';

  @override
  String get adminDrawerNfo => 'NFO සැකසීම්';

  @override
  String get adminDrawerTranscoding => 'ට්‍රාන්ස්කෝඩිං';

  @override
  String get adminDrawerResume => 'දිගටම කරගෙන යන්න';

  @override
  String get adminDrawerStreaming => 'ප්‍රවාහය';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'උපාංග';

  @override
  String get adminDrawerActivity => 'ක්රියාකාරිත්වය';

  @override
  String get adminDrawerNetworking => 'ජාලකරණය';

  @override
  String get adminDrawerApiKeys => 'API යතුරු';

  @override
  String get adminDrawerBackups => 'උපස්ථ';

  @override
  String get adminDrawerLogs => 'ලඝු-සටහන්';

  @override
  String get adminDrawerScheduledTasks => 'උපලේඛනගත කාර්යයන්';

  @override
  String get adminDrawerPlugins => 'ප්ලගීන';

  @override
  String get adminDrawerRepositories => 'ගබඩා';

  @override
  String get adminDrawerLiveTv => 'සජීවී රූපවාහිනිය';

  @override
  String get adminExitTooltip => 'පරිපාලකගෙන් ඉවත් වන්න';

  @override
  String get adminDashboardLoadFailed => 'උපකරණ පුවරුව පූරණය කිරීමට අසමත් විය';

  @override
  String get adminMediaOverview => 'මාධ්ය දළ විශ්ලේෂණය';

  @override
  String get adminMediaTotalsError =>
      'සේවාදායක මාධ්‍ය එකතුව පූරණය කළ නොහැකි විය.';

  @override
  String get adminMediaOverviewSubtitle =>
      'මෙම සේවාදායකයේ කොපමණ අන්තර්ගතයක් තිබේද යන්න පිළිබඳ ඉක්මන් කියවීමක්.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'ප්ලගින යාවත්කාලීන තිබේ: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'නැවත ඇරඹීම අවශ්‍ය ප්ලගින: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'අසාර්ථක නියමිත කාර්ය: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'මෑත අනතුරු ඇඟවීම්/දෝෂ ඇතුළත් කිරීම්: $count';
  }

  @override
  String get analyticsMediaDistribution => 'මාධ්ය බෙදාහැරීම';

  @override
  String get analyticsVideoCodecs => 'වීඩියෝ කෝඩෙක්ස්';

  @override
  String get analyticsAudioCodecs => 'ශ්රව්ය කෝඩෙක්ස්';

  @override
  String get analyticsContainers => 'බහාලුම්';

  @override
  String get analyticsTopGenres => 'ඉහළම ප්‍රභේද';

  @override
  String get analyticsReleaseYears => 'නිදහස් වසර';

  @override
  String get analyticsContentRatings => 'අන්තර්ගත ශ්‍රේණිගත කිරීම්';

  @override
  String get analyticsRuntimeBuckets => 'ධාවන කාල බාල්දි';

  @override
  String get analyticsFileFormats => 'ගොනු ආකෘති';

  @override
  String get analyticsNoData => 'දත්ත නොමැත.';

  @override
  String get adminServerInfo => 'සේවාදායක තොරතුරු';

  @override
  String get adminRestartPending => 'නැවත ආරම්භ කිරීම පොරොත්තුවෙන්';

  @override
  String get adminServerPaths => 'සේවාදායක මාර්ග';

  @override
  String get adminServerActions => 'සේවාදායක ක්රියා';

  @override
  String get adminRestartServer => 'සේවාදායකය නැවත ආරම්භ කරන්න';

  @override
  String get adminShutdownServer => 'වසා දැමීමේ සේවාදායකය';

  @override
  String get adminScanLibraries => 'පුස්තකාල ස්කෑන් කරන්න';

  @override
  String get adminLibraryScanStarted => 'පුස්තකාල ස්කෑන් කිරීම ආරම්භ විය';

  @override
  String errorGeneric(String error) {
    return 'දෝෂය: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'සේවාදායකය නැවත ආරම්භ කිරීම සිදු වෙමින් පවතී';

  @override
  String get adminServerRebootMessage =>
      'සේවාදායකය නැවත ආරම්භ කිරීම සිදු වෙමින් පවතී, කරුණාකර Moonfin නැවත ආරම්භ කරන්න';

  @override
  String get adminActiveSessions => 'ක්රියාකාරී සැසි';

  @override
  String get adminSessionsLoadFailed => 'සැසි පූරණය කිරීමට අසමත් විය';

  @override
  String get adminNoActiveSessions => 'සක්‍රිය සැසි නැත';

  @override
  String get adminRecentActivity => 'මෑත ක්රියාකාරිත්වය';

  @override
  String get adminNoRecentActivity => 'මෑත ක්‍රියාකාරකම් නැත';

  @override
  String adminCommandFailed(String error) {
    return 'විධානය අසාර්ථක විය: $error';
  }

  @override
  String get adminSendMessage => 'පණිවිඩයක් යවන්න';

  @override
  String get adminMessageTextHint => 'පණිවිඩ පෙළ';

  @override
  String get adminSetVolume => 'පරිමාව සකසන්න';

  @override
  String get sessionPrev => 'පෙර';

  @override
  String get sessionRewind => 'ආපසු හරවන්න';

  @override
  String get sessionForward => 'ඉදිරියට';

  @override
  String get sessionNext => 'ඊළඟ';

  @override
  String get sessionVolumeDown => 'වෙළුම -';

  @override
  String get sessionVolumeUp => 'වෙළුම +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'දැන් සෙල්ලම් කරනවා';

  @override
  String get volume => 'හඬ පරිමාව';

  @override
  String get actions => 'ක්රියාවන්';

  @override
  String get videoCodec => 'වීඩියෝ කෝඩෙක්';

  @override
  String get audioCodec => 'ශ්රව්ය කෝඩෙක්';

  @override
  String get hwAccel => 'දෘඪාංග ත්වරණය';

  @override
  String get completion => 'සම්පූර්ණ කිරීම';

  @override
  String get direct => 'සෘජු';

  @override
  String get adminDisconnect => 'විසන්ධි කරන්න';

  @override
  String get adminClearDates => 'පැහැදිලි දිනයන්';

  @override
  String get adminActivitySeverityAll => 'සියලු බරපතළකම්';

  @override
  String get adminActivityDateRange => 'දින පරාසය';

  @override
  String adminActivityLoadFailed(String error) {
    return 'ක්‍රියාකාරකම් ලොගය පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminNoActivityEntries => 'ක්‍රියාකාරකම් ඇතුළත් කිරීම් නොමැත';

  @override
  String get adminEditDeviceName => 'උපාංගයේ නම සංස්කරණය කරන්න';

  @override
  String get adminCustomName => 'අභිරුචි නම';

  @override
  String get adminDeviceNameUpdated => 'උපාංගයේ නම යාවත්කාලීන කරන ලදී';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'උපාංගය යාවත්කාලීන කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminDeleteDevice => 'උපාංගය මකන්න';

  @override
  String get adminDeviceDeleted => 'උපාංගය මකා ඇත';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'උපාංගය මැකීමට අසමත් විය: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '\'$name\' උපාංගය ඉවත් කරන්නද? පරිශීලකයාට මෙම උපාංගයේ නැවත පුරන්නට සිදුවේ.';
  }

  @override
  String get adminDeleteAllDevices => 'සියලු උපාංග මකන්න';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'උපාංග $countක් ඉවත් කරන්නද? බලපෑමට ලක්වන පරිශීලකයන්ට නැවත පුරන්නට සිදුවේ. ඔබේ වත්මන් උපාංගයට බලපෑමක් නොවේ.';
  }

  @override
  String get adminDevicesDeletedAll => 'උපාංග ඉවත් කරන ලදී';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'සමහර උපාංග ඉවත් කරන ලදී; $countක් ඉවත් කළ නොහැකි විය.';
  }

  @override
  String get adminDevicesLoadFailed => 'උපාංග පූරණය කිරීමට අසමත් විය';

  @override
  String get adminSearchDevices => 'සෙවුම් උපාංග';

  @override
  String get adminThisDevice => 'මෙම උපාංගය';

  @override
  String get adminEditName => 'නම සංස්කරණය කරන්න';

  @override
  String get adminLibrariesLoadFailed => 'පුස්තකාල පූරණය කිරීමට අසමත් විය';

  @override
  String get adminNoLibraries => 'පුස්තකාල වින්‍යාස කර නැත';

  @override
  String get adminScanAllLibraries => 'සියලුම පුස්තකාල පරිලෝකනය කරන්න';

  @override
  String get adminAddLibrary => 'පුස්තකාලය එක් කරන්න';

  @override
  String adminScanFailed(String error) {
    return 'පරිලෝකනය ආරම්භ කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminRenameLibrary => 'පුස්තකාලය නැවත නම් කරන්න';

  @override
  String get adminNewName => 'අලුත් නම';

  @override
  String adminLibraryRenamed(String name) {
    return 'පුස්තකාලය \"$name\" ලෙස නැවත නම් කරන ලදී';
  }

  @override
  String adminRenameFailed(String error) {
    return 'නැවත නම් කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminDeleteLibrary => 'පුස්තකාලය මකන්න';

  @override
  String adminLibraryDeleted(String name) {
    return '\"$name\" පුස්තකාලය මකා දමන ලදී';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'පුස්තකාලය මැකීමට අසමත් විය: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'මාර්ගය එක් කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminRemovePath => 'මාර්ගය ඉවත් කරන්න';

  @override
  String adminRemovePathConfirm(String path) {
    return 'මෙම පුස්තකාලයෙන් \"$path\" ඉවත් කරන්නද?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'මාර්ගය ඉවත් කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'පුස්තකාල විකල්ප සුරකින ලදී';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'විකල්ප සුරැකීමට අසමත් විය: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'පුස්තකාලය පූරණය කිරීමට අසමත් විය';

  @override
  String get adminNoMediaPaths => 'මාධ්‍ය මාර්ග වින්‍යාස කර නැත';

  @override
  String get adminAddPath => 'මාර්ගය එකතු කරන්න';

  @override
  String get adminBrowseFilesystem => 'සේවාදායක ගොනු පද්ධතිය පිරික්සන්න:';

  @override
  String get adminSaveOptions => 'විකල්ප සුරකින්න';

  @override
  String get adminPreferredMetadataLanguage => 'කැමති පාරදත්ත භාෂාව';

  @override
  String get adminMetadataLanguageHint => 'උදා. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'පාරදත්ත රටේ කේතය';

  @override
  String get adminMetadataCountryHint => 'උදා. එක්සත් ජනපදය, DE, FR';

  @override
  String get adminLibraryTabPaths => 'මාර්ග';

  @override
  String get adminLibraryTabOptions => 'විකල්ප';

  @override
  String get adminLibraryTabDownloaders => 'බාගැනීම් මෙවලම්';

  @override
  String get adminLibMetadataSavers => 'පාරදත්ත සුරකින්නන්';

  @override
  String get adminLibSubtitleDownloaders => 'උපසිරැසි බාගැනීම් මෙවලම්';

  @override
  String get adminLibLyricDownloaders => 'ගී පද බාගැනීම් මෙවලම්';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'පාරදත්ත බාගැනීම් මෙවලම්: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'රූප ලබාගන්නන්: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'මෙම සේවාදායකය මෙම පුස්තකාල වර්ගය සඳහා බාගැනීම් මෙවලම් සපයන්නේ නැත.';

  @override
  String get adminLibrarySectionGeneral => 'සාමාන්‍ය';

  @override
  String get adminLibrarySectionMetadata => 'පාරදත්ත';

  @override
  String get adminLibrarySectionEmbedded => 'කාවැද්දූ තොරතුරු';

  @override
  String get adminLibrarySectionSubtitles => 'උපසිරැසි';

  @override
  String get adminLibrarySectionImages => 'රූප';

  @override
  String get adminLibrarySectionSeries => 'කතාමාලා';

  @override
  String get adminLibrarySectionMusic => 'සංගීතය';

  @override
  String get adminLibrarySectionMovies => 'චිත්‍රපට';

  @override
  String get adminLibRealtimeMonitor => 'තත්‍ය කාලීන නිරීක්ෂණය සබල කරන්න';

  @override
  String get adminLibRealtimeMonitorHint =>
      'ගොනු වෙනස්කම් හඳුනාගෙන ස්වයංක්‍රීයව සකසන්න.';

  @override
  String get adminLibArchiveMediaFiles =>
      'සංරක්ෂිත ගොනු මාධ්‍ය ගොනු ලෙස සලකන්න';

  @override
  String get adminLibEnablePhotos => 'ඡායාරූප පෙන්වන්න';

  @override
  String get adminLibSaveLocalMetadata =>
      'කලා නිර්මාණ මාධ්‍ය ෆෝල්ඩරවලට සුරකින්න';

  @override
  String get adminLibRefreshInterval => 'ස්වයංක්‍රීය පාරදත්ත නැවුම් කිරීම';

  @override
  String get adminLibRefreshNever => 'කිසිවිටෙක';

  @override
  String get adminLibDefault => 'පෙරනිමිය';

  @override
  String get adminLibDisplayTitle => 'සංදර්ශනය';

  @override
  String get adminLibDisplaySection => 'පුස්තකාල සංදර්ශනය';

  @override
  String get adminLibFolderView =>
      'සරල මාධ්‍ය ෆෝල්ඩර පෙන්වීමට ෆෝල්ඩර දසුනක් සංදර්ශනය කරන්න';

  @override
  String get adminLibSpecialsInSeasons =>
      'විශේෂාංග ඒවා විකාශය වූ වාර තුළ පෙන්වන්න';

  @override
  String get adminLibGroupMovies => 'චිත්‍රපට එකතුවලට කාණ්ඩගත කරන්න';

  @override
  String get adminLibGroupShows => 'වැඩසටහන් එකතුවලට කාණ්ඩගත කරන්න';

  @override
  String get adminLibExternalSuggestions => 'යෝජනාවල බාහිර අන්තර්ගතය පෙන්වන්න';

  @override
  String get adminLibDateAddedSection => 'එක් කළ දිනයේ හැසිරීම';

  @override
  String get adminLibDateAddedLabel => 'එක් කළ දිනය ලබාගන්නේ';

  @override
  String get adminLibDateAddedImport => 'පුස්තකාලයට පරිලෝකනය කළ දිනය';

  @override
  String get adminLibDateAddedFile => 'ගොනුව සෑදූ දිනය';

  @override
  String get adminLibMetadataTitle => 'පාරදත්ත සහ රූප';

  @override
  String get adminLibMetadataLangSection => 'කැමති පාරදත්ත භාෂාව';

  @override
  String get adminLibChaptersSection => 'පරිච්ඡේද';

  @override
  String get adminLibDummyChapterDuration => 'ව්‍යාජ පරිච්ඡේද කාලය (තත්පර)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'පරිච්ඡේද නොමැති මාධ්‍ය සඳහා ජනනය කරන පරිච්ඡේදවල දිග. අබල කිරීමට 0 ලෙස සකසන්න.';

  @override
  String get adminLibChapterImageResolution => 'පරිච්ඡේද රූප විභේදනය';

  @override
  String get adminLibNfoTitle => 'NFO සැකසීම්';

  @override
  String get adminLibNfoHelp =>
      'NFO පාරදත්ත Kodi සහ සමාන සේවාලාභීන් සමඟ ගැළපේ. සැකසීම් NFO පාරදත්ත සුරකින සියලු පුස්තකාලවලට අදාළ වේ.';

  @override
  String get adminLibKodiUser => 'NFO ගොනුවල නැරඹීමේ දත්ත ගබඩා කරන පරිශීලකයා';

  @override
  String get adminLibSaveImagePaths => 'NFO ගොනු තුළ රූප මාර්ග සුරකින්න';

  @override
  String get adminLibPathSubstitution =>
      'NFO රූප මාර්ග සඳහා මාර්ග ආදේශනය සබල කරන්න';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart රූප extrathumbs ෆෝල්ඩරයකට පිටපත් කරන්න';

  @override
  String get adminLibNone => 'කිසිවක් නැත';

  @override
  String adminLibRefreshDays(int days) {
    return 'දින $days';
  }

  @override
  String get adminLibEmbeddedTitles => 'කාවැද්දූ මාතෘකා භාවිත කරන්න';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'අමතර සඳහා කාවැද්දූ මාතෘකා භාවිත කරන්න';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'කාවැද්දූ කථාංග තොරතුරු භාවිත කරන්න';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'කාවැද්දූ උපසිරැසිවලට ඉඩ දෙන්න';

  @override
  String get adminLibEmbeddedAllowAll => 'සියල්ලට ඉඩ දෙන්න';

  @override
  String get adminLibEmbeddedAllowText => 'පෙළ පමණි';

  @override
  String get adminLibEmbeddedAllowImage => 'රූප පමණි';

  @override
  String get adminLibEmbeddedAllowNone => 'කිසිවක් නැත';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'කාවැද්දූ උපසිරැසි තිබේ නම් බාගැනීම මඟහරින්න';

  @override
  String get adminLibSkipIfAudioMatches =>
      'ශ්‍රව්‍ය පථය බාගැනීමේ භාෂාවට ගැළපේ නම් බාගැනීම මඟහරින්න';

  @override
  String get adminLibRequirePerfectMatch =>
      'පරිපූර්ණ උපසිරැසි ගැළපීමක් අවශ්‍යයි';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'උපසිරැසි මාධ්‍ය ෆෝල්ඩරවලට සුරකින්න';

  @override
  String get adminLibChapterImageExtraction => 'පරිච්ඡේද රූප උපුටා ගන්න';

  @override
  String get adminLibChapterImagesDuringScan =>
      'පුස්තකාල පරිලෝකනය අතරතුර පරිච්ඡේද රූප උපුටා ගන්න';

  @override
  String get adminLibTrickplayExtraction =>
      'Trickplay රූප උපුටා ගැනීම සබල කරන්න';

  @override
  String get adminLibTrickplayDuringScan =>
      'පුස්තකාල පරිලෝකනය අතරතුර Trickplay රූප උපුටා ගන්න';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay රූප මාධ්‍ය ෆෝල්ඩරවලට සුරකින්න';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'බහු ෆෝල්ඩර හරහා විසිරී ඇති මාලා ස්වයංක්‍රීයව එකට ඒකාබද්ධ කරන්න';

  @override
  String get adminLibSeasonZeroName => 'බිංදු වාරයේ සංදර්ශන නාමය';

  @override
  String get adminLibLufsScan =>
      'ශ්‍රව්‍ය සාමාන්‍යකරණය සඳහා LUFS පරිලෝකනය සබල කරන්න';

  @override
  String get adminLibPreferNonstandardArtist =>
      'සම්මත නොවන කලාකරු ටැගයට මුල් තැන දෙන්න';

  @override
  String get adminLibAutoAddToCollection =>
      'චිත්‍රපට ස්වයංක්‍රීයව එකතුවලට එක් කරන්න';

  @override
  String get adminLibraryNameRequired => 'පුස්තකාලයේ නම අවශ්‍යයි';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'පුස්තකාලය සෑදීමට අසමත් විය: $error';
  }

  @override
  String get adminLibraryName => 'පුස්තකාලයේ නම';

  @override
  String get adminSelectedPaths => 'තෝරාගත් මාර්ග:';

  @override
  String get adminNoPathsAdded => 'මාර්ග එකතු කර නැත (පසුව එකතු කළ හැක)';

  @override
  String get adminCreateLibrary => 'පුස්තකාලයක් සාදන්න';

  @override
  String get paths => 'මාර්ග:';

  @override
  String get adminDisableUser => 'පරිශීලක අක්රිය කරන්න';

  @override
  String get adminEnableUser => 'පරිශීලක සක්රිය කරන්න';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name අබල කරන්නද? ඔවුන්ට පුරන්නට නොහැකි වේ.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name සබල කරන්නද? ඔවුන්ට නැවත පුරන්නට හැකි වේ.';
  }

  @override
  String adminUserDisabled(String name) {
    return '\"$name\" පරිශීලකයා අබල කරන ලදී';
  }

  @override
  String adminUserEnabled(String name) {
    return '\"$name\" පරිශීලකයා සබල කරන ලදී';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'පරිශීලක ප්‍රතිපත්තිය යාවත්කාලීන කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminUsersLoadFailed => 'පරිශීලකයන් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminSearchUsers => 'පරිශීලකයන් සොයන්න';

  @override
  String get adminEditUser => 'පරිශීලක සංස්කරණය කරන්න';

  @override
  String get adminAddUser => 'පරිශීලක එකතු කරන්න';

  @override
  String adminUserCreateFailed(String error) {
    return 'පරිශීලකයා සෑදීමට අසමත් විය: $error';
  }

  @override
  String get adminCreateUser => 'පරිශීලක නිර්මාණය කරන්න';

  @override
  String get adminPasswordOptional => 'මුරපදය (විකල්ප)';

  @override
  String get adminUsernameRequired => 'පරිශීලක නාමය හිස් විය නොහැක';

  @override
  String get adminNoProfileChanges => 'සුරැකීමට පැතිකඩ වෙනස්කම් නොමැත';

  @override
  String get adminProfileSaved => 'පැතිකඩ සුරැකිණි';

  @override
  String adminSaveFailed(String error) {
    return 'සුරැකීමට අසමත් විය: $error';
  }

  @override
  String get adminPermissionsSaved => 'අවසර සුරකින ලදී';

  @override
  String get adminPasswordsMismatch => 'මුරපද නොගැලපේ';

  @override
  String adminFailed(String error) {
    return 'අසාර්ථක විය: $error';
  }

  @override
  String get adminUserLoadFailed => 'පරිශීලකයා පූරණය කිරීමට අසමත් විය';

  @override
  String get adminBackToUsers => 'පරිශීලකයන් වෙත ආපසු';

  @override
  String get adminSaveProfile => 'පැතිකඩ සුරකින්න';

  @override
  String get adminDeleteUser => 'පරිශීලක මකන්න';

  @override
  String get admin => 'පරිපාලක';

  @override
  String get adminFullAccessWarning =>
      'පරිපාලකයින්ට සේවාදායකයට සම්පූර්ණ ප්‍රවේශය ඇත. පරිස්සමෙන් දෙන්න.';

  @override
  String get administrator => 'පරිපාලක';

  @override
  String get adminHiddenUser => 'සැඟවුණු පරිශීලක';

  @override
  String get adminAllowMediaPlayback => 'මාධ්‍ය නැවත ධාවනයට ඉඩ දෙන්න';

  @override
  String get adminAllowAudioTranscoding => 'ශ්‍රව්‍ය සම්ප්‍රේෂණයට ඉඩ දෙන්න';

  @override
  String get adminAllowVideoTranscoding => 'වීඩියෝ සම්ප්‍රේෂණයට ඉඩ දෙන්න';

  @override
  String get adminAllowRemuxing => 'Remuxing කිරීමට ඉඩ දෙන්න';

  @override
  String get adminForceRemoteTranscoding =>
      'දුරස්ථ මූලාශ්‍ර ට්‍රාන්ස්කෝඩින් බල කරන්න';

  @override
  String get adminAllowContentDeletion => 'අන්තර්ගතය මකා දැමීමට ඉඩ දෙන්න';

  @override
  String get adminAllowContentDownloading => 'අන්තර්ගතය බාගත කිරීමට ඉඩ දෙන්න';

  @override
  String get adminAllowPublicSharing => 'පොදු බෙදා ගැනීමට ඉඩ දෙන්න';

  @override
  String get adminAllowRemoteControl =>
      'වෙනත් පරිශීලකයින්ගේ දුරස්ථ පාලනයට ඉඩ දෙන්න';

  @override
  String get adminAllowSharedDeviceControl => 'බෙදාගත් උපාංග පාලනයට ඉඩ දෙන්න';

  @override
  String get adminAllowRemoteAccess => 'දුරස්ථ ප්රවේශයට ඉඩ දෙන්න';

  @override
  String get adminRemoteBitrateLimit =>
      'දුරස්ථ සේවාදායක බිටු අනුපාතය සීමාව (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'සීමාවක් නොමැතිව හිස්ව තබන්න';

  @override
  String get adminMaxActiveSessions => 'උපරිම ක්රියාකාරී සැසි';

  @override
  String get adminAllowLiveTvAccess => 'සජීවී රූපවාහිනී ප්‍රවේශයට ඉඩ දෙන්න';

  @override
  String get adminAllowLiveTvManagement =>
      'සජීවී රූපවාහිනී කළමනාකරණයට ඉඩ දෙන්න';

  @override
  String get adminAllowCollectionManagement => 'එකතු කළමණාකරණයට ඉඩ දෙන්න';

  @override
  String get adminAllowSubtitleManagement => 'උපසිරැසි කළමනාකරණයට ඉඩ දෙන්න';

  @override
  String get adminAllowLyricManagement => 'ගීත කළමනාකරණයට ඉඩ දෙන්න';

  @override
  String get adminSavePermissions => 'අවසර සුරකින්න';

  @override
  String get adminEnableAllLibraryAccess =>
      'සියලුම පුස්තකාල වෙත ප්‍රවේශය සබල කරන්න';

  @override
  String get adminSaveAccess => 'ප්රවේශය සුරකින්න';

  @override
  String get adminChangePassword => 'මුරපදය වෙනස් කරන්න';

  @override
  String get adminNewPassword => 'නව මුරපදය';

  @override
  String get adminConfirmPassword => 'මුරපදය තහවුරු කරන්න';

  @override
  String get adminSetPassword => 'මුරපදය සකසන්න';

  @override
  String get adminResetPassword => 'මුරපදය යළි පිහිටුවන්න';

  @override
  String get adminPasswordReset => 'මුරපදය යළි පිහිටුවීම';

  @override
  String get adminPasswordUpdated => 'මුරපදය යාවත්කාලීන කරන ලදී';

  @override
  String get adminUserSettings => 'පරිශීලක සැකසුම්';

  @override
  String get adminLibraryAccess => 'පුස්තකාල ප්රවේශය';

  @override
  String get adminDeviceAndChannelAccess => 'උපාංග සහ නාලිකා ප්‍රවේශය';

  @override
  String get adminEnableAllDevices => 'සියලුම උපාංග වෙත ප්‍රවේශය සබල කරන්න';

  @override
  String get adminEnableAllChannels => 'සියලුම නාලිකා වෙත ප්‍රවේශය සබල කරන්න';

  @override
  String get adminParentalControl => 'මාපිය පාලනය';

  @override
  String get adminMaxParentalRating => 'උපරිම අනුමත මාපිය ශ්‍රේණිගත කිරීම';

  @override
  String get adminMaxParentalRatingHint =>
      'ඊට වඩා ඉහළ ශ්‍රේණිගත කිරීමක් සහිත අන්තර්ගතය මෙම පරිශීලකයාගෙන් සඟවනු ලැබේ.';

  @override
  String get adminParentalRatingNone => 'කිසිවක් නැත';

  @override
  String get adminBlockUnratedItems =>
      'ශ්‍රේණිගත තොරතුරු නොමැති හෝ හඳුනාගත නොහැකි අයිතම අවහිර කරන්න';

  @override
  String get adminUnratedBook => 'පොත්';

  @override
  String get adminUnratedChannelContent => 'නාලිකා';

  @override
  String get adminUnratedLiveTvChannel => 'සජීවී රූපවාහිනිය';

  @override
  String get adminUnratedMovie => 'චිත්‍රපට';

  @override
  String get adminUnratedMusic => 'සංගීතය';

  @override
  String get adminUnratedTrailer => 'ට්‍රේලර්';

  @override
  String get adminUnratedSeries => 'වැඩසටහන්';

  @override
  String get adminAccessSchedules => 'ප්‍රවේශ කාලසටහන්';

  @override
  String get adminAccessSchedulesHint =>
      'පහත නියමිත වේලාවන්හිදී පමණක් ප්‍රවේශයට ඉඩ දෙන්න. කාලසටහනක් සකසා නොමැති විට දවස පුරා ප්‍රවේශයට ඉඩ දෙනු ලැබේ.';

  @override
  String get adminAddSchedule => 'කාලසටහනක් එක් කරන්න';

  @override
  String get adminScheduleDay => 'දිනය';

  @override
  String get adminScheduleStart => 'ආරම්භය';

  @override
  String get adminScheduleEnd => 'අවසානය';

  @override
  String get adminDayEveryday => 'සෑම දිනකම';

  @override
  String get adminDayWeekday => 'සතියේ දිනයක්';

  @override
  String get adminDayWeekend => 'සති අන්තය';

  @override
  String get adminDaySunday => 'ඉරිදා';

  @override
  String get adminDayMonday => 'සඳුදා';

  @override
  String get adminDayTuesday => 'අඟහරුවාදා';

  @override
  String get adminDayWednesday => 'බදාදා';

  @override
  String get adminDayThursday => 'බ්‍රහස්පතින්දා';

  @override
  String get adminDayFriday => 'සිකුරාදා';

  @override
  String get adminDaySaturday => 'සෙනසුරාදා';

  @override
  String get adminAllowedTags => 'අවසර ලත් ටැග';

  @override
  String get adminAllowedTagsHint =>
      'මෙම ටැග සහිත අන්තර්ගතය පමණක් පෙන්වයි. සියල්ලට ඉඩ දීමට හිස්ව තබන්න.';

  @override
  String get adminBlockedTags => 'අවහිර කළ ටැග';

  @override
  String get adminBlockedTagsHint =>
      'මෙම ටැග සහිත අන්තර්ගතය මෙම පරිශීලකයාගෙන් සඟවනු ලැබේ.';

  @override
  String get adminAddTag => 'ටැගයක් එක් කරන්න';

  @override
  String get adminEnabledDevices => 'සබල උපාංග';

  @override
  String get adminEnabledChannels => 'සබල නාලිකා';

  @override
  String get adminAuthProvider => 'සත්‍යාපන සපයන්නා';

  @override
  String get adminPasswordResetProvider => 'මුරපද යළි පිහිටුවීමේ සපයන්නා';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'අගුළු දැමීමට පෙර උපරිම අසාර්ථක පිවිසුම් උත්සාහ';

  @override
  String get adminLoginAttemptsHint =>
      'පෙරනිමිය සඳහා 0 ලෙසත්, අගුළු දැමීම අබල කිරීමට -1 ලෙසත් සකසන්න.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay ප්‍රවේශය';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'කණ්ඩායම් සෑදීමට සහ ඒවාට එක්වීමට ඉඩ දෙන්න';

  @override
  String get adminSyncPlayJoin => 'කණ්ඩායම්වලට එක්වීමට ඉඩ දෙන්න';

  @override
  String get adminSyncPlayNone => 'ප්‍රවේශයක් නැත';

  @override
  String get adminContentDeletionFolders => 'අන්තර්ගතය මැකීමට ඉඩ දෙන්නේ';

  @override
  String get adminResetPasswordWarning =>
      'මෙය මුරපදය ඉවත් කරනු ඇත. මුරපදයක් නොමැතිව පරිශීලකයාට ලොග් වීමට හැකි වනු ඇත.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'සේවාදායකය HTTP $status ලබා දුන්නේය';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'ඔබට $name මකා දැමීමට අවශ්‍ය බව විශ්වාසද?';
  }

  @override
  String adminUserDeleted(String name) {
    return '\"$name\" පරිශීලකයා මකා දමන ලදී';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'පරිශීලකයා මැකීමට අසමත් විය: $error';
  }

  @override
  String get adminCreateApiKey => 'API යතුර සාදන්න';

  @override
  String get adminAppName => 'යෙදුමේ නම';

  @override
  String get adminApiKeyCreated => 'API යතුර සාදන ලදී';

  @override
  String get adminApiKeyCreatedNoToken =>
      'යතුර සාර්ථකව සාදන ලදී. සේවාදායකයා ටෝකනය ආපසු ලබා දුන්නේ නැත. සේවාදායක API යතුරු පරීක්ෂා කරන්න.';

  @override
  String get adminKeyCopied => 'යතුර පසුරු පුවරුවට පිටපත් කරන ලදී';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'යතුර සෑදීමට අසමත් විය: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'සේවාදායක ප්‍රතිචාරයෙන් යතුරු ටෝකනය අතුරුදහන්';

  @override
  String get adminRevokeApiKey => 'API යතුර අවලංගු කරන්න';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name සඳහා යතුර අවලංගු කරන්නද?';
  }

  @override
  String get adminApiKeyRevoked => 'API යතුර අවලංගු කරන ලදී';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'යතුර අවලංගු කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API යතුරු පූරණය කිරීමට අසමත් විය';

  @override
  String get adminApiKeysTitle => 'API යතුරු';

  @override
  String get adminCreateKey => 'යතුර සාදන්න';

  @override
  String get adminNoApiKeys => 'API යතුරු හමු නොවීය';

  @override
  String get adminUnknownApp => 'නොදන්නා යෙදුම';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'ටෝකනය: $token\\nසෑදූ දිනය: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'උපස්ථයක් සාදන්න';

  @override
  String get adminBackupInclude => 'උපස්ථයට ඇතුළත් කරන දේ තෝරන්න.';

  @override
  String get adminBackupDatabase => 'දත්ත සමුදාය';

  @override
  String get adminBackupDatabaseAlways => 'සැමවිටම ඇතුළත්';

  @override
  String get adminBackupMetadata => 'පාරදත්ත';

  @override
  String get adminBackupSubtitles => 'උපසිරැසි';

  @override
  String get adminBackupTrickplay => 'Trickplay රූප';

  @override
  String get adminCreatingBackup => 'උපස්ථයක් නිර්මාණය කරමින්...';

  @override
  String get adminBackupCreated => 'උපස්ථය සාර්ථකව සාදන ලදී';

  @override
  String adminBackupCreateFailed(String error) {
    return 'උපස්ථය සෑදීමට අසමත් විය: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'සේවාදායක ප්‍රතිචාරයේ උපස්ථ මාර්ගය අතුරුදහන්';

  @override
  String adminBackupManifest(String name) {
    return 'මැනිෆෙස්ට්: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'මැනිෆෙස්ට් පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminConfirmRestore => 'ප්‍රතිසාධනය තහවුරු කරන්න';

  @override
  String get adminRestoringBackup => 'උපස්ථය ප්‍රතිසාධනය කරමින්...';

  @override
  String adminRestoreFailed(String error) {
    return 'උපස්ථය ප්‍රතිසාධනය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'උපස්ථ පූරණය කිරීමට අසමත් විය';

  @override
  String get adminCreateBackup => 'උපස්ථ සාදන්න';

  @override
  String get adminNoBackups => 'උපස්ථ කිසිවක් හමු නොවීය';

  @override
  String get adminViewDetails => 'විස්තර බලන්න';

  @override
  String get restore => 'ප්‍රතිෂ්ඨාපනය කරන්න';

  @override
  String get adminLogsLoadFailed => 'සේවාදායක ලොග පූරණය කිරීමට අසමත් විය';

  @override
  String get adminNoLogFiles => 'ලොග් ගොනු හමු නොවිණි';

  @override
  String get adminLogCopied => 'ලොගය පසුරු පුවරුවට පිටපත් කරන ලදී';

  @override
  String get adminSaveLogFile => 'ලොග් ගොනුව සුරකින්න';

  @override
  String adminSavedTo(String path) {
    return '$path වෙත සුරකින ලදී';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ගොනුව සුරැකීමට අසමත් විය: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName පූරණය කිරීමට අසමත් විය';
  }

  @override
  String get adminSearchInLog => 'ලොග් එකේ සොයන්න';

  @override
  String get adminNoMatchingLines => 'ගැළපෙන රේඛා නැත';

  @override
  String adminTasksLoadFailed(String error) {
    return 'කාර්ය පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminNoScheduledTasks => 'කාලසටහන්ගත කාර්ය කිසිවක් හමු නොවීය';

  @override
  String get adminNoTasksMatchFilter => 'වත්මන් පෙරහනට කිසිදු කාර්යයක් නොගැලපේ';

  @override
  String adminTaskStartFailed(String error) {
    return 'කාර්යය ආරම්භ කිරීමට අසමත් විය: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'කාර්යය නැවැත්වීමට අසමත් විය: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'කාර්යය පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminRunNow => 'දැන් ධාවනය කරන්න';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ප්‍රේරකය ඉවත් කිරීමට අසමත් විය: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ප්‍රේරකය එක් කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminLastExecution => 'අවසාන ක්රියාත්මක කිරීම';

  @override
  String get adminTriggers => 'ප්‍රේරක';

  @override
  String get adminAddTrigger => 'ප්‍රේරකය එක් කරන්න';

  @override
  String get adminNoTriggers => 'ප්‍රේරක කිසිවක් වින්‍යාස කර නැත';

  @override
  String get adminTriggerType => 'ප්‍රේරක වර්ගය';

  @override
  String get adminTimeLimit => 'කාල සීමාව (විකල්ප)';

  @override
  String get adminNoLimit => 'සීමාවක් නැත';

  @override
  String adminHours(String hours) {
    return 'පැය $hours';
  }

  @override
  String get adminDayOfWeek => 'සතියේ දිනය';

  @override
  String get adminSearchPlugins => 'ප්ලගින සොයන්න...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'ප්ලගිනය මාරු කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminUninstallPlugin => 'ප්ලගිනය අස්ථාපනය කරන්න';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'ඔබට \"$name\" අස්ථාපනය කිරීමට අවශ්‍ය බව විශ්වාසද?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'ප්ලගිනය අස්ථාපනය කිරීමට අසමත් විය: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'පැකේජය ස්ථාපනය කිරීමට අසමත් විය: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'යාවත්කාලීනය ස්ථාපනය කිරීමට අසමත් විය: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'ප්ලගින පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'ඔබගේ සෙවුමට ගැලපෙන ප්ලගීන කිසිවක් නැත';

  @override
  String get adminNoPluginsInstalled => 'ප්ලගීන ස්ථාපනය කර නැත';

  @override
  String adminInstallUpdate(String version) {
    return 'යාවත්කාලීනය ස්ථාපනය කරන්න (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'නාමාවලිය පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'ඔබගේ සෙවුමට ගැලපෙන පැකේජ නොමැත';

  @override
  String get adminNoPackagesAvailable => 'පැකේජ නොමැත';

  @override
  String get adminExperimentalIntegration => 'පර්යේෂණාත්මක ඒකාබද්ධ කිරීම';

  @override
  String get adminExperimentalWarning =>
      'ප්ලගින සැකසුම් ඒකාබද්ධ කිරීම තවමත් පර්යේෂණාත්මක ය. සමහර සිටුවම් පිටු නිවැරදිව විදැහුම් නොකළ හැක.';

  @override
  String get continueAction => 'දිගටම කරගෙන යන්න';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'සේවාදායකය නැවත ඇරඹීමෙන් පසු \"$name\" ඉවත් කරනු ලැබේ';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'අස්ථාපනය කිරීමට අසමත් විය: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" v$version වෙත යාවත්කාලීන කරමින්...';
  }

  @override
  String get adminMissingAuthToken =>
      'සැකසීම් විවෘත කළ නොහැක: සත්‍යාපන ටෝකනය අතුරුදහන්.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'ප්ලගිනය පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminPluginNotFound => 'ප්ලගිනය හමු නොවීය';

  @override
  String adminPluginVersion(String version) {
    return 'අනුවාදය $version';
  }

  @override
  String get adminEnablePlugin => 'ප්ලගිනය සබල කරන්න';

  @override
  String get adminPluginSettingsPage => 'ප්ලගින සැකසුම් පිටුව';

  @override
  String get adminRevisionHistory => 'සංශෝධන ඉතිහාසය';

  @override
  String get adminNoChangelog => 'වෙනස් ලොග් නොමැත.';

  @override
  String get adminRemoveRepository => 'ගබඩාව ඉවත් කරන්න';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'ඔබට \"$name\" ඉවත් කිරීමට අවශ්‍ය බව විශ්වාසද?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'ගබඩා සුරැකීමට අසමත් විය: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'ගබඩා පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminRepositoryNameHint => 'උදා. Jellyfin ස්ථාවර';

  @override
  String get adminRepositoryUrl => 'ගබඩා URL';

  @override
  String get adminAddEntry => 'ඇතුළත් කිරීම එකතු කරන්න';

  @override
  String get adminInvalidUrl => 'වලංගු නොවන URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'ප්ලගින සැකසීම් පූරණය කළ නොහැක: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri විවෘත කළ නොහැකි විය';
  }

  @override
  String get adminOpenInBrowser => 'බ්‍රව්සරයේ විවෘත කරන්න';

  @override
  String get adminOpenExternally => 'බාහිරව විවෘත කරන්න';

  @override
  String get adminGeneralSettings => 'සාමාන්ය සැකසුම්';

  @override
  String get adminServerName => 'සේවාදායකයේ නම';

  @override
  String get adminPreferredMetadataCountry => 'කැමති පාරදත්ත රට';

  @override
  String get adminCachePath => 'හැඹිලි මාර්ගය';

  @override
  String get adminMetadataPath => 'පාරදත්ත මාර්ගය';

  @override
  String get adminLibraryScanConcurrency => 'පුස්තකාල ස්කෑන් සමගාමී';

  @override
  String get adminParallelImageEncodingLimit => 'සමාන්තර රූප කේතන සීමාව';

  @override
  String get adminSlowResponseThreshold => 'මන්දගාමී ප්‍රතිචාර සීමාව (මිලි)';

  @override
  String get adminBrandingSaved => 'සන්නම් සැකසීම් සුරකින ලදී';

  @override
  String get adminBrandingLoadFailed => 'සන්නම් සැකසීම් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminLoginDisclaimer => 'පිවිසුම් වියාචනය';

  @override
  String get adminLoginDisclaimerHint =>
      'පිවිසුම් පෝරමයට පහළින් HTML දර්ශනය වේ';

  @override
  String get adminCustomCss => 'අභිරුචි CSS';

  @override
  String get adminCustomCssHint => 'අභිරුචි CSS වෙබ් අතුරු මුහුණතට යොදන ලදී';

  @override
  String get adminEnableSplashScreen => 'ස්ප්ලෑෂ් තිරය සබල කරන්න';

  @override
  String get adminStreamingSaved => 'ප්‍රවාහ සැකසුම් සුරකින ලදී';

  @override
  String get adminStreamingLoadFailed =>
      'ප්‍රවාහ සැකසුම් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminStreamingDescription =>
      'දුරස්ථ සම්බන්ධතා සඳහා ගෝලීය ප්‍රවාහ බිට්රේට් සීමාවන් සකසන්න.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'දුරස්ථ සේවාදායක බිටු අනුපාතය සීමාව (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'අසීමිත සඳහා හිස් හෝ 0 තබන්න';

  @override
  String get adminPlaybackSaved => 'පසුධාවන සැකසුම් සුරකින ලදී';

  @override
  String get adminPlaybackLoadFailed =>
      'පසුධාවන සැකසුම් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminPlaybackTranscoding => 'ප්ලේබැක් / ට්‍රාන්ස්කෝඩිං';

  @override
  String get adminHardwareAcceleration => 'දෘඪාංග ත්වරණය';

  @override
  String get adminVaapiDevice => 'VA-API උපාංගය';

  @override
  String get adminEnableHardwareEncoding => 'දෘඪාංග කේතනය සක්රිය කරන්න';

  @override
  String get adminEnableHardwareDecoding => 'දෘඪාංග විකේතනය සක්රිය කරන්න:';

  @override
  String get adminEncodingThreads => 'නූල් කේතනය කිරීම';

  @override
  String get adminAutomatic => '0 = ස්වයංක්‍රීය';

  @override
  String get adminTranscodingTempPath => 'ට්‍රාන්ස්කෝඩින් temp path';

  @override
  String get adminEnableFallbackFont => 'ෆොල්බැක් අකුරු සබල කරන්න';

  @override
  String get adminFallbackFontPath => 'ෆොල්බැක් අකුරු මාර්ගය';

  @override
  String get adminAllowSegmentDeletion => 'කොටස මකා දැමීමට ඉඩ දෙන්න';

  @override
  String get adminSegmentKeepSeconds => 'කොටස තබා ගන්න (තත්පර)';

  @override
  String get adminThrottleBuffering => 'බෆරින් සීමා කරන්න';

  @override
  String get adminTrickplaySaved => 'Trickplay සැකසීම් සුරකින ලදී';

  @override
  String get adminTrickplayLoadFailed =>
      'Trickplay සැකසීම් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminEnableHardwareAcceleration => 'දෘඪාංග ත්වරණය සබල කරන්න';

  @override
  String get adminEnableKeyFrameExtraction =>
      'යතුරු රාමු පමණක් නිස්සාරණය සබල කරන්න';

  @override
  String get adminKeyFrameSubtitle => 'වේගවත් නමුත් අඩු නිරවද්‍යතාවයක්';

  @override
  String get adminScanBehavior => 'හැසිරීම පරිලෝකනය කරන්න';

  @override
  String get adminProcessPriority => 'ක්‍රියාවලි ප්‍රමුඛතාවය';

  @override
  String get adminImageSettings => 'රූප සැකසුම්';

  @override
  String get adminIntervalMs => 'අන්තරය (මිලි)';

  @override
  String get adminCaptureFrameSubtitle => 'රාමු අල්ලා ගැනීමට කොපමණ වාරයක්';

  @override
  String get adminWidthResolutions => 'පළල විභේදන';

  @override
  String get adminTileWidth => 'ටයිල් පළල';

  @override
  String get adminTileHeight => 'ටයිල් උස';

  @override
  String get adminQualitySubtitle => 'අඩු අගයන් = වඩා හොඳ ගුණාත්මක, විශාල ගොනු';

  @override
  String get adminProcessThreads => 'ක්‍රියාවලි නූල්';

  @override
  String get adminResumeSaved => 'නැවත ආරම්භ කිරීමේ සැකසුම් සුරකින ලදී';

  @override
  String get adminResumeLoadFailed =>
      'නැවත ආරම්භ සැකසීම් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminResumeDescription =>
      'අන්තර්ගතය අර්ධ වශයෙන් වාදනය කළ හෝ සම්පූර්ණයෙන්ම වාදනය කළ ලෙස සලකුණු කළ යුත්තේ කවදාදැයි වින්‍යාස කරන්න.';

  @override
  String get adminMinResumePercentage => 'අවම නැවත ආරම්භ කිරීමේ ප්‍රතිශතය';

  @override
  String get adminMinResumeSubtitle =>
      'ප්‍රගතිය සුරැකීමට මෙම ප්‍රතිශතය ඉක්මවා අන්තර්ගතය වාදනය කළ යුතුය';

  @override
  String get adminMaxResumePercentage => 'උපරිම නැවත ආරම්භ කිරීමේ ප්‍රතිශතය';

  @override
  String get adminMaxResumeSubtitle =>
      'මෙම ප්‍රතිශතයෙන් පසුව අන්තර්ගතය සම්පුර්ණයෙන්ම වාදනය වූ බව සැලකේ';

  @override
  String get adminMinResumeDuration => 'අවම නැවත ආරම්භ කිරීමේ කාලය (තත්පර)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'මීට වඩා කෙටි අයිතම නැවත ආරම්භ කළ නොහැක';

  @override
  String get adminMinAudiobookResume =>
      'අවම ශ්‍රව්‍ය පොත් නැවත ආරම්භ කිරීමේ ප්‍රතිශතය';

  @override
  String get adminMaxAudiobookResume =>
      'උපරිම ශ්‍රව්‍ය පොත් නැවත ආරම්භ කිරීමේ ප්‍රතිශතය';

  @override
  String get adminNetworkingSaved =>
      'ජාල සැකසීම් සුරකින ලදී. සේවාදායකය නැවත ආරම්භ කිරීම අවශ්‍ය විය හැකිය.';

  @override
  String get adminNetworkingLoadFailed => 'ජාල සැකසීම් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminNetworkingWarning =>
      'ජාල සැකසීම් වෙනස් කිරීමට සේවාදායකය නැවත ආරම්භ කිරීම අවශ්‍ය විය හැක.';

  @override
  String get adminEnableRemoteAccess => 'දුරස්ථ ප්රවේශය සක්රිය කරන්න';

  @override
  String get ports => 'වරායන්';

  @override
  String get adminHttpPort => 'HTTP වරාය';

  @override
  String get adminHttpsPort => 'HTTPS වරාය';

  @override
  String get adminPublicHttpsPort => 'පොදු HTTPS වරාය';

  @override
  String get adminBaseUrl => 'මූලික URL';

  @override
  String get adminBaseUrlHint => 'උදා. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS සබල කරන්න';

  @override
  String get adminLocalNetwork => 'දේශීය ජාලය';

  @override
  String get adminLocalNetworkAddresses => 'දේශීය ජාල ලිපින';

  @override
  String get adminKnownProxies => 'දන්නා ප්‍රොක්සි';

  @override
  String get adminRemoteIpFilter => 'දුරස්ථ IP පෙරහන';

  @override
  String get adminRemoteIpFilterEntries => 'දුරස්ථ IP පෙරහන';

  @override
  String get adminCertificatePath => 'සහතික මාර්ගය';

  @override
  String get whitelist => 'සුදු ලැයිස්තුව';

  @override
  String get blacklist => 'අසාදු ලේඛනය';

  @override
  String get notSet => 'සකසා නැත';

  @override
  String get adminMetadataSaved => 'පාරදත්ත සුරකින ලදී';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'පාරදත්ත පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'පාරදත්ත සුරැකීමට අසමත් විය: $error';
  }

  @override
  String get adminRefreshMetadata => 'පාරදත්ත නැවුම් කරන්න';

  @override
  String get recursive => 'පුනරාවර්තන';

  @override
  String get adminReplaceAllMetadata => 'සියලුම පාර-දත්ත ප්‍රතිස්ථාපනය කරන්න';

  @override
  String get adminReplaceAllImages => 'සියලුම පින්තූර ප්‍රතිස්ථාපනය කරන්න';

  @override
  String get adminMetadataRefreshRequested => 'පාරදත්ත නැවුම් කිරීම ඉල්ලා ඇත';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'පාරදත්ත නැවුම් කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminNoRemoteMatches => 'දුරස්ථ ගැළපීමක් හමු නොවීය';

  @override
  String get adminRemoteResults => 'දුරස්ථ ප්රතිඵල';

  @override
  String get adminRemoteMetadataApplied => 'දුරස්ථ පාරදත්ත යොදන ලදී';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'දුරස්ථ සෙවීම අසාර්ථක විය: $error';
  }

  @override
  String get adminUpdateContentType => 'අන්තර්ගත වර්ගය යාවත්කාලීන කරන්න';

  @override
  String get adminContentType => 'අන්තර්ගත වර්ගය';

  @override
  String get adminContentTypeUpdated => 'අන්තර්ගත වර්ගය යාවත්කාලීන කරන ලදී';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'අන්තර්ගත වර්ගය යාවත්කාලීන කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'පාරදත්ත සංස්කාරකය පූරණය කිරීමට අසමත් විය';

  @override
  String get adminNoPeopleEntries => 'පුද්ගල ඇතුළත් කිරීම් නැත';

  @override
  String get adminNoExternalIds => 'බාහිර හැඳුනුම්පත් නොමැත';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType රූපය යාවත්කාලීන කරන ලදී';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'රූපය බාගැනීමට අසමත් විය: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'සහාය නොදක්වන රූප ආකෘතිය';

  @override
  String get adminImageReadFailed => 'තෝරාගත් රූපය කියවීමට අසමත් විය';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType රූපය උඩුගත කරන ලදී';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'රූපය උඩුගත කිරීමට අසමත් විය: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType රූපය මකන්න';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType රූපය මකා දමන ලදී';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'රූපය මැකීමට අසමත් විය: $error';
  }

  @override
  String get adminAllProviders => 'සියලුම සපයන්නන්';

  @override
  String get adminNoRemoteImages => 'දුරස්ථ පින්තූර හමු නොවිණි';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'ට්‍යූනර සොයාගැනීම අසාර්ථක විය: $error';
  }

  @override
  String get adminAddTuner => 'සුසරකය එක් කරන්න';

  @override
  String get adminEditTuner => 'ට්‍යූනරය සංස්කරණය කරන්න';

  @override
  String get adminTunerTypeM3u => 'M3U ට්‍යූනරය';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'ගොනුව හෝ URL';

  @override
  String get adminTunerIpAddress => 'ට්‍යූනර IP ලිපිනය';

  @override
  String get adminTunerFriendlyName => 'හඳුනාගැනීමේ නම';

  @override
  String get adminTunerUserAgent => 'පරිශීලක නියෝජිතයා';

  @override
  String get adminTunerCount => 'එකවර සම්බන්ධතා සීමාව';

  @override
  String get adminTunerCountHelp =>
      'ට්‍යූනරය එකවර ඉඩ දෙන උපරිම ප්‍රවාහ ගණන. අසීමිත සඳහා 0 ලෙස සකසන්න.';

  @override
  String get adminTunerFallbackBitrate => 'විකල්ප උපරිම ප්‍රවාහ බිට්රේට්';

  @override
  String get adminTunerImportFavoritesOnly =>
      'ප්‍රියතම නාලිකා පමණක් ආයාත කරන්න';

  @override
  String get adminTunerAllowHwTranscoding => 'දෘඪාංග ට්‍රාන්ස්කෝඩිංට ඉඩ දෙන්න';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 ට්‍රාන්ස්කෝඩිං බහාලුමට ඉඩ දෙන්න';

  @override
  String get adminTunerAllowStreamSharing => 'ප්‍රවාහ බෙදාගැනීමට ඉඩ දෙන්න';

  @override
  String get adminTunerEnableStreamLooping => 'ප්‍රවාහ ලූප් කිරීම සබල කරන්න';

  @override
  String get adminTunerIgnoreDts => 'DTS නොසලකා හරින්න';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'ආදානය දේශීය රාමු අනුපාතයෙන් කියවන්න';

  @override
  String get adminEditProvider => 'සපයන්නා සංස්කරණය කරන්න';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'ගොනුව හෝ URL';

  @override
  String get adminXmltvMoviePrefix => 'චිත්‍රපට උපසර්ගය';

  @override
  String get adminXmltvMovieCategories => 'චිත්‍රපට ප්‍රවර්ග';

  @override
  String get adminXmltvCategoriesHelp =>
      'බහු ප්‍රවර්ග සිරස් තීරුවකින් වෙන් කරන්න.';

  @override
  String get adminXmltvKidsCategories => 'ළමා ප්‍රවර්ග';

  @override
  String get adminXmltvNewsCategories => 'පුවත් ප්‍රවර්ග';

  @override
  String get adminXmltvSportsCategories => 'ක්‍රීඩා ප්‍රවර්ග';

  @override
  String get adminSdUsername => 'පරිශීලක නාමය';

  @override
  String get adminSdPassword => 'මුරපදය';

  @override
  String get adminSdCountry => 'රට';

  @override
  String get adminSdCountrySelect => 'රටක් තෝරන්න';

  @override
  String get adminSdPostalCode => 'තැපැල් කේතය';

  @override
  String get adminSdGetListings => 'ලැයිස්තු ලබාගන්න';

  @override
  String get adminSdListings => 'ලැයිස්තු';

  @override
  String get adminEnableAllTuners => 'සියලු ට්‍යූනර සබල කරන්න';

  @override
  String get adminTunerType => 'සුසරක වර්ගය';

  @override
  String get adminTunerAdded => 'සුසරකය එකතු කරන ලදී';

  @override
  String adminTunerAddFailed(String error) {
    return 'ට්‍යූනරය එක් කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminAddGuideProvider => 'මාර්ගෝපදේශ සපයන්නා එක් කරන්න';

  @override
  String get adminProviderType => 'සැපයුම්කරු වර්ගය';

  @override
  String get adminProviderAdded => 'සපයන්නා එකතු කරන ලදී';

  @override
  String adminProviderAddFailed(String error) {
    return 'සපයන්නා එක් කිරීමට අසමත් විය: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'ට්‍යූනරය ඉවත් කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminTunerResetRequested => 'සුසරකය යළි පිහිටුවීම ඉල්ලා ඇත';

  @override
  String adminTunerResetFailed(String error) {
    return 'ට්‍යූනරය යළි පිහිටුවීමට අසමත් විය: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'මෙම ට්‍යූනර වර්ගය යළි පිහිටුවීමට සහාය නොදක්වයි.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'සපයන්නා ඉවත් කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminRecordingSettings => 'පටිගත කිරීමේ සැකසුම්';

  @override
  String get adminPrePadding => 'පෙර-පැඩිං (විනාඩි)';

  @override
  String get adminPostPadding => 'පසු-පැඩිං (විනාඩි)';

  @override
  String get adminRecordingPath => 'පටිගත කිරීමේ මාර්ගය';

  @override
  String get adminSeriesRecordingPath => 'මාලාව පටිගත කිරීමේ මාර්ගය';

  @override
  String get adminMovieRecordingPath => 'චිත්‍රපට පටිගත කිරීමේ මාර්ගය';

  @override
  String get adminGuideDays => 'මාර්ගෝපදේශ දත්ත දින';

  @override
  String get adminGuideDaysAuto => 'ස්වයංක්‍රීය';

  @override
  String adminGuideDaysValue(int days) {
    return 'දින $days';
  }

  @override
  String get adminRecordingPostProcessor => 'පසු සැකසුම් යෙදුම් මාර්ගය';

  @override
  String get adminRecordingPostProcessorArgs => 'පසු සකසනයේ තර්ක';

  @override
  String get adminSaveRecordingNfo => 'පටිගත කිරීමේ NFO පාරදත්ත සුරකින්න';

  @override
  String get adminSaveRecordingImages => 'පටිගත කිරීමේ රූප සුරකින්න';

  @override
  String get adminLiveTvSectionTiming => 'වේලාව';

  @override
  String get adminLiveTvSectionPaths => 'පටිගත කිරීමේ මාර්ග';

  @override
  String get adminLiveTvSectionPostProcessing => 'පසු සැකසුම්';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'මාර්ගෝපදේශ දත්ත: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'පටිගත කිරීමේ සැකසුම් සුරකින ලදී';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'සැකසීම් සුරැකීමට අසමත් විය: $error';
  }

  @override
  String get adminSetChannelMappings => 'නාලිකා සිතියම්ගත කිරීම් සකසන්න';

  @override
  String get adminMappingJson => 'JSON සිතියම්ගත කිරීම';

  @override
  String get adminMappingJsonHint => 'උදාහරණය: සිතියම්කරණ JSON ගෙවීම';

  @override
  String get adminChannelMappingsUpdated =>
      'නාලිකා සිතියම්ගත කිරීම් යාවත්කාලීන කරන ලදී';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'සිතියම්කරණ යාවත්කාලීන කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'සජීවී රූපවාහිනී පරිපාලනය පූරණය කිරීමට අසමත් විය';

  @override
  String get adminTunerDevices => 'සුසරක උපාංග';

  @override
  String get adminNoTunerHosts => 'සුසරක සත්කාරක වින්‍යාස කර නැත';

  @override
  String get adminGuideProviders => 'මාර්ගෝපදේශ සපයන්නන්';

  @override
  String get adminRefreshGuideData => 'මාර්ගෝපදේශ දත්ත නැවුම් කරන්න';

  @override
  String get adminGuideRefreshStarted =>
      'මාර්ගෝපදේශ දත්ත නැවුම් කිරීම ආරම්භ විය';

  @override
  String get adminGuideRefreshUnavailable =>
      'මාර්ගෝපදේශ නැවුම් කිරීමේ කාර්යය මෙම සේවාදායකයේ නොමැත.';

  @override
  String get adminAddProvider => 'සපයන්නා එක් කරන්න';

  @override
  String get adminNoListingProviders =>
      'ලැයිස්තුගත කිරීමේ සපයන්නන් වින්‍යාස කර නැත';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'පටිගත කිරීමේ මාර්ගය: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'මාලා මාර්ගය: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'පූර්ව-පෑඩිං: මිනි. $minutes';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'පසු-පෑඩිං: මිනි. $minutes';
  }

  @override
  String get adminTunerDiscovery => 'සුසරක සොයාගැනීම';

  @override
  String get adminChannelMappings => 'නාලිකා සිතියම්ගත කිරීම්';

  @override
  String get adminNoDiscoveredTuners => 'තවමත් සොයා ගත් සුසරක නොමැත';

  @override
  String get adminSettingsSaved => 'සැකසීම් සුරකින ලදී';

  @override
  String get adminBackupsNotAvailable => 'මෙම සේවාදායක ගොඩනැගීමේ උපස්ථ නොමැත.';

  @override
  String get adminRestoreWarning1 =>
      'ප්‍රතිසාධනය මඟින් සියලුම වත්මන් සේවාදායක දත්ත උපස්ථ දත්ත සමඟ ප්‍රතිස්ථාපනය කරනු ඇත.';

  @override
  String get adminRestoreWarning2 =>
      'වත්මන් සේවාදායක සැකසීම්, පරිශීලකයින් සහ පුස්තකාල දත්ත නැවත ලියනු ඇත.';

  @override
  String get adminRestoreWarning3 =>
      'ප්‍රතිසාධනය කිරීමෙන් පසු සේවාදායකය නැවත ආරම්භ වේ.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'දැන් $name උපස්ථය ප්‍රතිසාධනය කරන්නද?';
  }

  @override
  String get adminRestoreRequested =>
      'ප්‍රතිසාධනය ඉල්ලා ඇත. සේවාදායකය නැවත ආරම්භ කිරීම මෙම සැසිය විසන්ධි විය හැක.';

  @override
  String get adminBackupsTitle => 'උපස්ථ';

  @override
  String get adminUnknownDate => 'නොදන්නා දිනය';

  @override
  String get adminUnnamedBackup => 'නම් නොකළ උපස්ථය';

  @override
  String get adminLiveTvNotAvailable =>
      'සජීවී රූපවාහිනී පරිපාලනය මෙම සේවාදායක ගොඩනැගීමේ නොමැත.';

  @override
  String get adminLiveTvTitle => 'සජීවී රූපවාහිනී පරිපාලනය';

  @override
  String get adminApply => 'යොදන්න';

  @override
  String get adminNotSet => 'සකසා නැත';

  @override
  String get adminReset => 'යළි සකසන්න';

  @override
  String get adminLogsTitle => 'සේවාදායක ලොග්';

  @override
  String get adminLogsNewestFirst => 'අලුත්ම මුලින්ම';

  @override
  String get adminLogsOldestFirst => 'පැරණිතම පළමු';

  @override
  String get adminLogsJustNow => 'මේ දැන්';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'මිනි. $minutesකට පෙර';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'පැය $hoursකට පෙර';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'දින $daysකට පෙර';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName පූරණය කිරීමට අසමත් විය';
  }

  @override
  String adminLogViewerMatches(int count) {
    return 'ගැළපීම් $count';
  }

  @override
  String get adminLogViewerNoMatches => 'ගැළපෙන රේඛා නැත';

  @override
  String get adminMetadataEditorTitle => 'පාරදත්ත සංස්කාරකය';

  @override
  String get adminMetadataIdentify => 'හඳුනාගන්න';

  @override
  String get adminMetadataType => 'ටයිප් කරන්න';

  @override
  String get adminMetadataDetails => 'විස්තර';

  @override
  String get adminMetadataExternalIds => 'බාහිර හැඳුනුම්පත්';

  @override
  String get adminMetadataImages => 'රූප';

  @override
  String get adminMetadataFieldTitle => 'මාතෘකාව';

  @override
  String get adminMetadataFieldSortTitle => 'මාතෘකාව වර්ග කරන්න';

  @override
  String get adminMetadataFieldOriginalTitle => 'මුල් මාතෘකාව';

  @override
  String get adminMetadataFieldPremiereDate => 'මංගල දිනය (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'අවසන් දිනය (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'නිෂ්පාදන වර්ෂය';

  @override
  String get adminMetadataFieldOfficialRating => 'නිල ශ්රේණිගත කිරීම';

  @override
  String get adminMetadataFieldCommunityRating => 'ප්‍රජා ශ්‍රේණිගත කිරීම';

  @override
  String get adminMetadataFieldCriticRating => 'විචාරක ශ්රේණිගත කිරීම';

  @override
  String get adminMetadataFieldTagline => 'ටැග්ලයින්';

  @override
  String get adminMetadataFieldOverview => 'දළ විශ්ලේෂණය';

  @override
  String get adminMetadataGenres => 'ප්‍රභේද';

  @override
  String get adminMetadataTags => 'ටැග්';

  @override
  String get adminMetadataStudios => 'චිත්රාගාර';

  @override
  String get adminMetadataPeople => 'මිනිස්සු';

  @override
  String get adminMetadataAddGenre => 'ප්‍රභේදය එක් කරන්න';

  @override
  String get adminMetadataAddTag => 'ටැගය එක් කරන්න';

  @override
  String get adminMetadataAddStudio => 'චිත්රාගාරය එකතු කරන්න';

  @override
  String get adminMetadataAddPerson => 'පුද්ගලයා එකතු කරන්න';

  @override
  String get adminMetadataEditPerson => 'පුද්ගලයා සංස්කරණය කරන්න';

  @override
  String get adminMetadataRole => 'භූමිකාව';

  @override
  String get adminMetadataImagePrimary => 'ප්රාථමික';

  @override
  String get adminMetadataImageBackdrop => 'පසුතලය';

  @override
  String get adminMetadataImageLogo => 'ලාංඡනය';

  @override
  String get adminMetadataImageBanner => 'බැනරය';

  @override
  String get adminMetadataImageThumb => 'මහපටැඟිල්ල';

  @override
  String get adminMetadataRecursive => 'පුනරාවර්තන';

  @override
  String get adminMetadataProvider => 'සපයන්නා';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType රූපය යාවත්කාලීන කරන ලදී';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType රූපය උඩුගත කරන ලදී';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType රූපය මකා දමන ලදී';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'රූපය බාගැනීමට අසමත් විය: $error';
  }

  @override
  String get adminMetadataImageReadFailed => 'තෝරාගත් රූපය කියවීමට අසමත් විය';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'රූපය උඩුගත කිරීමට අසමත් විය: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType රූපය මකන්න';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'මෙය අයිතමයෙන් වත්මන් රූපය ඉවත් කරයි.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'රූපය මැකීමට අසමත් විය: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType රූපය තෝරන්න';
  }

  @override
  String get adminMetadataUpload => 'උඩුගත කරන්න';

  @override
  String get adminMetadataUpdate => 'යාවත්කාලීන කරන්න';

  @override
  String get adminMetadataRemoteImage => 'දුරස්ථ රූපය';

  @override
  String get adminPluginsInstalled => 'ස්ථාපනය කර ඇත';

  @override
  String get adminPluginsCatalog => 'නාමාවලිය';

  @override
  String get adminPluginsActive => 'ක්රියාකාරී';

  @override
  String get adminPluginsRestart => 'යළි අරඹන්න';

  @override
  String get adminPluginsNoSearchResults =>
      'ඔබගේ සෙවුමට ගැලපෙන ප්ලගීන කිසිවක් නැත';

  @override
  String get adminPluginsNoneInstalled => 'ප්ලගීන ස්ථාපනය කර නැත';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'යාවත්කාලීනයක් තිබේ: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'යාවත්කාලීන ලබා ගත හැක';

  @override
  String get adminPluginsPendingRemoval =>
      'නැවත ආරම්භ කිරීමෙන් පසු ඉවත් කිරීමට බලාපොරොත්තු වේ';

  @override
  String get adminPluginsChangesPending =>
      'නැවත ආරම්භ කිරීමට බලාපොරොත්තු වන වෙනස්කම්';

  @override
  String get adminPluginsEnable => 'සබල කරන්න';

  @override
  String get adminPluginsDisable => 'අක්රිය කරන්න';

  @override
  String get adminPluginsInstallUpdate => 'යාවත්කාලීන ස්ථාපනය කරන්න';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'යාවත්කාලීනය ස්ථාපනය කරන්න (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ඔබගේ සෙවුමට ගැලපෙන පැකේජ නොමැත';

  @override
  String get adminPluginsCatalogEmpty => 'පැකේජ නොමැත';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" ස්ථාපනය වෙමින් පවතී...';
  }

  @override
  String get adminPluginDetailExperimental => 'පර්යේෂණාත්මක ඒකාබද්ධ කිරීම';

  @override
  String get adminPluginDetailExperimentalContent =>
      'ප්ලගින සැකසුම් ඒකාබද්ධ කිරීම තවමත් පර්යේෂණාත්මක ය. සමහර ක්ෂේත්‍ර හෝ පිරිසැලසුම් තවමත් නිවැරදිව ඉදිරිපත් නොවිය හැක.';

  @override
  String get adminPluginDetailToggle404 =>
      'ප්ලගිනය ටොගල් කිරීමට අසමත් විය. සේවාදායකයට මෙම ප්ලගින අනුවාදය සොයාගත නොහැකි විය. ප්ලගින නැවුම් කිරීමට උත්සාහ කරන්න, ඉන්පසු නැවත උත්සාහ කරන්න.';

  @override
  String get adminPluginDetailToggleDioError =>
      'ප්ලගිනය ටොගල් කිරීමට අසමත් විය. විස්තර සඳහා කරුණාකර සේවාදායක ලොග පරීක්ෂා කරන්න.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name සැකසීම්';
  }

  @override
  String get adminPluginDetailDetails => 'විස්තර';

  @override
  String get adminPluginDetailDeveloper => 'සංවර්ධකයා';

  @override
  String get adminPluginDetailRepository => 'ගබඩාව';

  @override
  String get adminPluginDetailBundled => 'බණ්ඩල් කර ඇත';

  @override
  String get adminPluginDetailEnablePlugin => 'ප්ලගිනය සබල කරන්න';

  @override
  String get adminPluginDetailRestartRequired =>
      'වෙනස්කම් බලාත්මක වීමට සේවාදායකය නැවත ආරම්භ කිරීම අවශ්‍ය වේ.';

  @override
  String get adminPluginDetailRemovalPending =>
      'සේවාදායකය නැවත ආරම්භ කිරීමෙන් පසු මෙම ප්ලගිනය ඉවත් කරනු ලැබේ.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'මෙම ප්ලගිනය වැරදි ලෙස ක්‍රියා කර ඇති අතර නිවැරදිව ක්‍රියා නොකරනු ඇත.';

  @override
  String get adminPluginDetailNotSupported =>
      'මෙම ප්ලගිනය වත්මන් සේවාදායක අනුවාදය මගින් සහය නොදක්වයි.';

  @override
  String get adminPluginDetailSuperseded =>
      'මෙම ප්ලගිනය නව අනුවාදයකින් ආදේශ කර ඇත.';

  @override
  String adminReposLoadFailed(String error) {
    return 'ගබඩා පූරණය කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ගබඩාව ඉවත් කරන්න';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'ඔබට \"$name\" ඉවත් කිරීමට අවශ්‍ය බව විශ්වාසද?';
  }

  @override
  String get adminReposRemove => 'ඉවත් කරන්න';

  @override
  String adminReposSaveFailed(String error) {
    return 'ගබඩා සුරැකීමට අසමත් විය: $error';
  }

  @override
  String get adminReposEmpty => 'කිසිදු ගබඩාවක් වින්‍යාස කර නොමැත';

  @override
  String get adminReposEmptySubtitle =>
      'පවතින ප්ලගීන බ්‍රවුස් කිරීමට ගබඩාවක් එක් කරන්න';

  @override
  String get adminReposUnnamed => '(නම් නොකළ)';

  @override
  String get adminReposEditTitle => 'ගබඩාව සංස්කරණය කරන්න';

  @override
  String get adminReposAddTitle => 'ගබඩාව එක් කරන්න';

  @override
  String get adminReposUrl => 'ගබඩා URL';

  @override
  String get adminReposNameHint => 'උදා. Jellyfin ස්ථාවර';

  @override
  String get adminPluginSettingsInvalidUrl => 'වලංගු නොවන URL';

  @override
  String get adminGeneralSettingsTitle => 'සාමාන්ය සැකසුම්';

  @override
  String get adminGeneralMetadataLanguage => 'කැමති පාරදත්ත භාෂාව';

  @override
  String get adminGeneralMetadataLanguageHint => 'උදා. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'කැමති පාරදත්ත රට';

  @override
  String get adminGeneralMetadataCountryHint => 'උදා. එක්සත් ජනපදය, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'පුස්තකාල ස්කෑන් සමගාමී';

  @override
  String get adminGeneralImageEncodingLimit => 'සමාන්තර රූප කේතන සීමාව';

  @override
  String get adminUnknownError => 'නොදන්නා දෝෂයකි';

  @override
  String get adminBrowse => 'බ්‍රවුස් කරන්න';

  @override
  String get adminCloseBrowser => 'බ්‍රවුසරය වසන්න';

  @override
  String get adminNetworkingTitle => 'ජාලකරණය';

  @override
  String get adminNetworkingRestartWarning =>
      'ජාල සැකසීම් වෙනස් කිරීමට සේවාදායකය නැවත ආරම්භ කිරීම අවශ්‍ය විය හැක.';

  @override
  String get adminNetworkingRemoteAccess => 'දුරස්ථ ප්රවේශය සක්රිය කරන්න';

  @override
  String get adminNetworkingPorts => 'වරායන්';

  @override
  String get adminNetworkingHttpPort => 'HTTP වරාය';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS වරාය';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS සබල කරන්න';

  @override
  String get adminNetworkingLocalNetwork => 'දේශීය ජාලය';

  @override
  String get adminNetworkingLocalAddresses => 'දේශීය ජාල ලිපින';

  @override
  String get adminNetworkingAddressHint => 'උදා. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'දන්නා ප්‍රොක්සි';

  @override
  String get adminNetworkingProxyHint => 'උදා. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'සුදු ලැයිස්තුව';

  @override
  String get adminNetworkingBlacklist => 'අසාදු ලේඛනය';

  @override
  String get adminNetworkingAddEntry => 'ඇතුළත් කිරීම එකතු කරන්න';

  @override
  String get adminBrandingTitle => 'වෙළඳ නාමකරණය';

  @override
  String get adminBrandingLoginDisclaimer => 'පිවිසුම් වියාචනය';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'පිවිසුම් පෝරමයට පහළින් HTML දර්ශනය වේ';

  @override
  String get adminBrandingCustomCss => 'අභිරුචි CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'අභිරුචි CSS වෙබ් අතුරු මුහුණතට යොදන ලදී';

  @override
  String get adminBrandingEnableSplash => 'ස්ප්ලෑෂ් තිරය සබල කරන්න';

  @override
  String get adminBrandingSplashUpload => 'රූපය උඩුගත කරන්න';

  @override
  String get adminBrandingSplashUploaded => 'විවෘත තිරය යාවත්කාලීන කරන ලදී';

  @override
  String get adminBrandingSplashUploadFailed =>
      'විවෘත තිරය උඩුගත කිරීමට අසමත් විය';

  @override
  String get adminBrandingSplashDeleted => 'විවෘත තිරය ඉවත් කරන ලදී';

  @override
  String get adminBrandingNoSplash => 'අභිරුචි විවෘත තිරයක් නැත';

  @override
  String get adminPlaybackHwAccel => 'දෘඪාංග ත්වරණය';

  @override
  String get adminPlaybackHwAccelLabel => 'දෘඪාංග ත්වරණය';

  @override
  String get adminPlaybackEnableHwEncoding => 'දෘඪාංග කේතනය සක්රිය කරන්න';

  @override
  String get adminPlaybackEnableHwDecoding => 'දෘඪාංග විකේතනය සක්රිය කරන්න:';

  @override
  String get adminPlaybackQsvDevice => 'QSV උපාංගය';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'වැඩිදියුණු කළ NVDEC විකේතකය සබල කරන්න';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'පද්ධතියේ දේශීය දෘඪාංග විකේතකයට මුල් තැන දෙන්න';

  @override
  String get adminPlaybackColorDepth => 'දෘඪාංග විකේතන වර්ණ ගැඹුර';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC විකේතනය';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 විකේතනය';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-bit විකේතනය';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit විකේතනය';

  @override
  String get adminPlaybackHwEncodingSection => 'දෘඪාංග කේතනය';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC කේතනයට ඉඩ දෙන්න';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 කේතනයට ඉඩ දෙන්න';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel අඩු-බල H.264 කේතකය සබල කරන්න';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel අඩු-බල HEVC කේතකය සබල කරන්න';

  @override
  String get adminPlaybackToneMapping => 'ටෝන් සිතියම්කරණය';

  @override
  String get adminPlaybackEnableTonemapping => 'ටෝන් සිතියම්කරණය සබල කරන්න';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'VPP ටෝන් සිතියම්කරණය සබල කරන්න';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox ටෝන් සිතියම්කරණය සබල කරන්න';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'ටෝන් සිතියම්කරණ ඇල්ගොරිතමය';

  @override
  String get adminPlaybackTonemappingMode => 'ටෝන් සිතියම්කරණ ප්‍රකාරය';

  @override
  String get adminPlaybackTonemappingRange => 'ටෝන් සිතියම්කරණ පරාසය';

  @override
  String get adminPlaybackTonemappingDesat => 'ටෝන් සිතියම්කරණ අසංතෘප්තිය';

  @override
  String get adminPlaybackTonemappingPeak => 'ටෝන් සිතියම්කරණ උච්චය';

  @override
  String get adminPlaybackTonemappingParam => 'ටෝන් සිතියම්කරණ පරාමිතිය';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP ටෝන් සිතියම්කරණ දීප්තිය';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP ටෝන් සිතියම්කරණ ප්‍රතිවිරෝධය';

  @override
  String get adminPlaybackPresetsQuality => 'පෙරසැකසුම් සහ ගුණාත්මකභාවය';

  @override
  String get adminPlaybackEncoderPreset => 'කේතක පෙරසැකසුම';

  @override
  String get adminPlaybackH264Crf => 'H.264 කේතන CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) කේතන CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'ඩීඉන්ටර්ලේස් ක්‍රමය';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'ඩීඉන්ටර්ලේස් කිරීමේදී රාමු අනුපාතය දෙගුණ කරන්න';

  @override
  String get adminPlaybackAudioSection => 'ශ්‍රව්‍ය';

  @override
  String get adminPlaybackEnableAudioVbr => 'ශ්‍රව්‍ය VBR කේතනය සබල කරන්න';

  @override
  String get adminPlaybackDownmixBoost => 'ශ්‍රව්‍ය ඩවුන්මික්ස් වර්ධනය';

  @override
  String get adminPlaybackDownmixAlgorithm => 'ස්ටීරියෝ ඩවුන්මික්ස් ඇල්ගොරිතමය';

  @override
  String get adminPlaybackMaxMuxingQueue => 'උපරිම මක්සිං පෝලිම් ප්‍රමාණය';

  @override
  String get adminPlaybackAutoOption => 'ස්වයංක්‍රීය';

  @override
  String get adminPlaybackEncoding => 'කේතනය කිරීම';

  @override
  String get adminPlaybackEncodingThreads => 'නූල් කේතනය කිරීම';

  @override
  String get adminPlaybackFallbackFont => 'ෆොල්බැක් අකුරු සබල කරන්න';

  @override
  String get adminPlaybackFallbackFontPath => 'ෆොල්බැක් අකුරු මාර්ගය';

  @override
  String get adminPlaybackStreaming => 'ප්‍රවාහය';

  @override
  String get adminResumeVideo => 'වීඩියෝ';

  @override
  String get adminResumeAudiobooks => 'ශ්රව්ය පොත්';

  @override
  String get adminResumeMinAudiobookPct =>
      'අවම ශ්‍රව්‍ය පොත් නැවත ආරම්භ කිරීමේ ප්‍රතිශතය';

  @override
  String get adminResumeMaxAudiobookPct =>
      'උපරිම ශ්‍රව්‍ය පොත් නැවත ආරම්භ කිරීමේ ප්‍රතිශතය';

  @override
  String get adminStreamingBitrateLimit =>
      'දුරස්ථ සේවාදායක බිටු අනුපාතය සීමාව (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'අසීමිත සඳහා හිස් හෝ 0 තබන්න';

  @override
  String get adminTrickplayHwAccel => 'දෘඪාංග ත්වරණය සබල කරන්න';

  @override
  String get adminTrickplayHwEncoding => 'දෘඪාංග කේතනය සක්රිය කරන්න';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'යතුරු රාමු පමණක් නිස්සාරණය සබල කරන්න';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'වේගවත් නමුත් අඩු නිරවද්‍යතාවයක්';

  @override
  String get adminTrickplayNonBlocking => 'අවහිර නොකිරීම';

  @override
  String get adminTrickplayBlocking => 'අවහිර කිරීම';

  @override
  String get adminTrickplayPriorityHigh => 'ඉහළ';

  @override
  String get adminTrickplayPriorityAboveNormal => 'සාමාන්‍යයට ඉහළින්';

  @override
  String get adminTrickplayPriorityNormal => 'සාමාන්යයි';

  @override
  String get adminTrickplayPriorityBelowNormal => 'සාමාන්‍යයට පහළින්';

  @override
  String get adminTrickplayPriorityIdle => 'නිෂ්ක්‍රීයයි';

  @override
  String get adminTrickplayImageSettings => 'රූප සැකසුම්';

  @override
  String get adminTrickplayInterval => 'අන්තරය (මිලි)';

  @override
  String get adminTrickplayIntervalSubtitle => 'රාමු අල්ලා ගැනීමට කොපමණ වාරයක්';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'කොමාවෙන් වෙන් වූ පික්සල් පළල (උදා. 320)';

  @override
  String get adminTrickplayQuality => 'ගුණාත්මකභාවය';

  @override
  String get adminTrickplayQScale => 'තත්ත්ව පරිමාණය';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'අඩු අගයන් = වඩා හොඳ ගුණාත්මක, විශාල ගොනු';

  @override
  String get adminTrickplayJpegQuality => 'JPEG ගුණාත්මකභාවය';

  @override
  String get adminTrickplayProcessing => 'සැකසීම';

  @override
  String get adminTasksEmpty => 'කාලසටහන්ගත කාර්ය කිසිවක් හමු නොවීය';

  @override
  String get adminTasksNoFilterMatch => 'වත්මන් පෙරහනට කිසිදු කාර්යයක් නොගැලපේ';

  @override
  String get adminTaskCancelling => 'අවලංගු කරමින්...';

  @override
  String get adminTaskRunning => 'දුවමින්...';

  @override
  String get adminTaskNeverRun => 'කවදාවත් දුවන්න එපා';

  @override
  String get adminTaskStop => 'නවත්වන්න';

  @override
  String get adminRunningTasks => 'ධාවනය වන කාර්ය';

  @override
  String get adminTaskRun => 'දුවන්න';

  @override
  String get adminTaskDetailLastExecution => 'අවසාන ක්රියාත්මක කිරීම';

  @override
  String get adminTaskDetailStarted => 'පටන් ගත්තා';

  @override
  String get adminTaskDetailEnded => 'අවසන්';

  @override
  String get adminTaskDetailDuration => 'කාලසීමාව';

  @override
  String get adminTaskDetailErrorLabel => 'දෝෂය:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'දිනපතා $timeට';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'සෑම $dayම $timeට';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'සෑම $durationකට';
  }

  @override
  String get adminTaskTriggerStartup => 'යෙදුම් ආරම්භයේදී';

  @override
  String get adminTaskTriggerTypeDaily => 'දිනපතා';

  @override
  String get adminTaskTriggerTypeWeekly => 'සතිපතා';

  @override
  String get adminTaskTriggerTypeInterval => 'පරතරයක් මත';

  @override
  String get adminTaskTriggerIntervalLabel => 'අන්තරය';

  @override
  String get adminTaskTriggerEveryHour => 'සෑම පැයකටම';

  @override
  String get adminTaskTriggerEvery6Hours => 'සෑම පැය 6 කට වරක්';

  @override
  String get adminTaskTriggerEvery12Hours => 'සෑම පැය 12 කට වරක්';

  @override
  String get adminTaskTriggerEvery24Hours => 'සෑම පැය 24 කට වරක්';

  @override
  String get adminTaskTriggerEvery2Days => 'සෑම දින 2 කට වරක්';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'පැය $count',
      one: 'පැය 1',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'කාලය';

  @override
  String get adminTaskTriggerNoLimit => 'සීමාවක් නැත';

  @override
  String get adminActivityJustNow => 'මේ දැන්';

  @override
  String get adminActivityLastHour => 'පසුගිය පැය';

  @override
  String get adminActivityToday => 'අද';

  @override
  String get adminActivityYesterday => 'ඊයේ';

  @override
  String get adminActivityOlder => 'වැඩිහිටි';

  @override
  String adminActivityDaysAgo(int days) {
    return 'දින $daysකට පෙර';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'පැය $hoursකට පෙර';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'මිනි. $minutesකට පෙර';
  }

  @override
  String get adminActivityNow => 'දැන්';

  @override
  String adminActivityMinutesShort(int minutes) {
    return 'මිනි. $minutes';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return 'පැය $hours';
  }

  @override
  String adminActivityDaysShort(int days) {
    return 'දින $days';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'ගමන් පෙරදැක්ම සිඟිති රූ සඳහා Trickplay රූප ජනනය වින්‍යාස කරන්න.';

  @override
  String get adminNetworkingPublicHttpsPort => 'පොදු HTTPS වරාය';

  @override
  String get adminNetworkingBaseUrl => 'මූලික URL';

  @override
  String get adminNetworkingBaseUrlHint => 'උදා. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'පොදු HTTP තොට';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS අවශ්‍යයි';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'සියලු දුරස්ථ ඉල්ලීම් HTTPS වෙත හරවා යවන්න. සේවාදායකයට වලංගු සහතිකයක් නොමැති නම් බලපෑමක් නැත.';

  @override
  String get adminNetworkingCertPassword => 'සහතික මුරපදය';

  @override
  String get adminNetworkingIpSettings => 'IP සැකසීම්';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 සබල කරන්න';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 සබල කරන්න';

  @override
  String get adminNetworkingAutoDiscovery =>
      'ස්වයංක්‍රීය තොට සිතියම්කරණය සබල කරන්න';

  @override
  String get adminNetworkingLocalSubnets => 'LAN ජාල';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'දේශීය ජාලයේ ඇතැයි සලකන IP ලිපින හෝ CIDR උපජාලවල කොමා හෝ පේළියෙන් වෙන් කළ ලැයිස්තුවක්.';

  @override
  String get adminNetworkingPublishedUris => 'ප්‍රකාශිත සේවාදායක URI';

  @override
  String get adminNetworkingPublishedUriHint =>
      'උපජාලයක් හෝ ලිපිනයක් ප්‍රකාශිත URL එකකට සිතියම්ගත කරන්න, උදා. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'සහතික මාර්ගය';

  @override
  String get adminNetworkingRemoteIpFilter => 'දුරස්ථ IP පෙරහන';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'දුරස්ථ IP පෙරහන';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API උපාංගය';

  @override
  String get adminPlaybackAutomatic => '0 = ස්වයංක්‍රීය';

  @override
  String get adminPlaybackTranscodeTempPath => 'ට්‍රාන්ස්කෝඩින් temp path';

  @override
  String get adminPlaybackSegmentDeletion => 'කොටස මකා දැමීමට ඉඩ දෙන්න';

  @override
  String get adminPlaybackSegmentKeep => 'කොටස තබා ගන්න (තත්පර)';

  @override
  String get adminPlaybackThrottleBuffering => 'බෆරින් සීමා කරන්න';

  @override
  String get adminPlaybackThrottleDelay => 'සීමා ප්‍රමාදය (තත්පර)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'ක්ෂණිකව උපසිරැසි උපුටා ගැනීමට ඉඩ දෙන්න';

  @override
  String get adminResumeMinPct => 'අවම නැවත ආරම්භ කිරීමේ ප්‍රතිශතය';

  @override
  String get adminResumeMinPctSubtitle =>
      'ප්‍රගතිය සුරැකීමට මෙම ප්‍රතිශතය ඉක්මවා අන්තර්ගතය වාදනය කළ යුතුය';

  @override
  String get adminResumeMaxPct => 'උපරිම නැවත ආරම්භ කිරීමේ ප්‍රතිශතය';

  @override
  String get adminResumeMaxPctSubtitle =>
      'මෙම ප්‍රතිශතයෙන් පසුව අන්තර්ගතය සම්පුර්ණයෙන්ම වාදනය වූ බව සැලකේ';

  @override
  String get adminResumeMinDuration => 'අවම නැවත ආරම්භ කිරීමේ කාලය (තත්පර)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'මීට වඩා කෙටි අයිතම නැවත ආරම්භ කළ නොහැක';

  @override
  String get adminTrickplayScanBehavior => 'හැසිරීම පරිලෝකනය කරන්න';

  @override
  String get adminTrickplayProcessPriority => 'ක්‍රියාවලි ප්‍රමුඛතාවය';

  @override
  String get adminTrickplayTileWidth => 'ටයිල් පළල';

  @override
  String get adminTrickplayTileHeight => 'ටයිල් උස';

  @override
  String get adminTrickplayProcessThreads => 'ක්‍රියාවලි නූල්';

  @override
  String get adminTrickplayWidthResolutions => 'පළල විභේදන';

  @override
  String get adminMetadataDefault => 'පෙරනිමිය';

  @override
  String get adminMetadataContentTypeUpdated =>
      'අන්තර්ගත වර්ගය යාවත්කාලීන කරන ලදී';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'අන්තර්ගත වර්ගය යාවත්කාලීන කිරීමට අසමත් විය: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'මන්දගාමී ප්‍රතිචාර සීමාව (මිලි)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'මන්දගාමී ප්‍රතිචාර අනතුරු ඇඟවීම් සබල කරන්න';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect සබල කරන්න';

  @override
  String get adminGeneralSectionServer => 'සේවාදායකය';

  @override
  String get adminGeneralSectionMetadata => 'පාරදත්ත';

  @override
  String get adminGeneralSectionPaths => 'මාර්ග';

  @override
  String get adminGeneralSectionPerformance => 'කාර්යසාධනය';

  @override
  String get adminGeneralCachePath => 'හැඹිලි මාර්ගය';

  @override
  String get adminGeneralMetadataPath => 'පාරදත්ත මාර්ගය';

  @override
  String get adminGeneralServerName => 'සේවාදායකයේ නම';

  @override
  String get adminGeneralDisplayLanguage => 'කැමති සංදර්ශන භාෂාව';

  @override
  String get adminSettingsLoadFailed => 'සැකසීම් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminDiscover => 'සොයා ගන්න';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'සිතියම්කරණ යාවත්කාලීන කිරීමට අසමත් විය: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'කාල සීමාව: $duration';
  }

  @override
  String get folders => 'ෆෝල්ඩර';

  @override
  String get libraries => 'පුස්තකාල';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay අබල කර ඇත';

  @override
  String get syncPlayDisabledMessage =>
      'සමමුහුර්ත කළ පසුධාවනය භාවිත කිරීමට සැකසීම් තුළ SyncPlay සබල කරන්න.';

  @override
  String get syncPlayServerUnsupportedTitle => 'සේවාදායකය සහාය නොදක්වයි';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay සඳහා Jellyfin සේවාදායකයක් අවශ්‍ය වේ. වත්මන් සේවාදායකය එයට සහාය නොදක්වයි.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay සමූහය';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay කණ්ඩායම';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# සහභාගිවන්නන්',
      one: '# සහභාගිවන්නා',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'බලා සිටීම නොසලකා හරින්න';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'මෙම උපාංගය බෆරවන අතරතුර සමූහය රඳවා නොගන්න';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'මන්දගාමී සාමාජිකයින් බලා නොසිට දේශීයව ඉදිරියට යන්න';

  @override
  String get syncPlayRepeat => 'නැවත නැවත කරන්න';

  @override
  String get syncPlayRepeatOne => 'එකක්';

  @override
  String get syncPlayShuffleModeShuffled => 'කලවම් කළා';

  @override
  String get syncPlayShuffleModeSorted => 'වර්ග කර ඇත';

  @override
  String get syncPlaySyncCurrentQueue => 'වත්මන් පසුධාවන පෝලිම සමමුහුර්ත කරන්න';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'සමූහ පෝලිම දේශීයව ක්‍රීඩා කරන දේ සමඟ ප්‍රතිස්ථාපනය කරන්න';

  @override
  String get syncPlayLeaveGroup => 'කණ්ඩායම හැර යන්න';

  @override
  String get syncPlayGroupQueue => 'කණ්ඩායම් පෝලිම';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'අයිතමය $index';
  }

  @override
  String get syncPlayPlayNow => 'දැන් සෙල්ලම් කරන්න';

  @override
  String get syncPlayCreateNewGroup => 'නව කණ්ඩායමක් සාදන්න';

  @override
  String get syncPlayGroupName => 'කණ්ඩායමේ නම';

  @override
  String get syncPlayDefaultGroupName => 'මගේ SyncPlay සමූහය';

  @override
  String get syncPlayCreateGroup => 'කණ්ඩායමක් සාදන්න';

  @override
  String get syncPlayAvailableGroups => 'පවතින කණ්ඩායම්';

  @override
  String get syncPlayNoGroupsAvailable => 'කණ්ඩායම් නොමැත';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay කණ්ඩායමට සම්බන්ධ වන්නද?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay කණ්ඩායමකට සම්බන්ධ වීමෙන් ඔබේ වත්මන් පසුධාවන පෝලිම ප්‍රතිස්ථාපනය කළ හැක. දිගටම කරගෙන යන්නද?';

  @override
  String get syncPlayJoin => 'එක්වන්න';

  @override
  String get syncPlayStateIdle => 'නිෂ්ක්‍රීයයි';

  @override
  String get syncPlayStateWaiting => 'බලාගෙන ඉන්නවා';

  @override
  String get syncPlayStatePaused => 'විරාම කළා';

  @override
  String get syncPlayStatePlaying => 'සෙල්ලම් කරනවා';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay කණ්ඩායමට එක් විය';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay කණ්ඩායමෙන් ඉවත් විය';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay ප්‍රවේශය ප්‍රතික්ෂේප විය';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ඔබට මෙම SyncPlay සමූහයේ ඇති අයිතම එකකට හෝ වැඩි ගණනකට ප්‍රවේශය නොමැත. පුස්තකාල අවසර සත්‍යාපනය කිරීමට හෝ වෙනත් පෝලිමක් තෝරා ගැනීමට කණ්ඩායම් හිමිකරුගෙන් ඉල්ලා සිටින්න.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName වෙත ධාවනය සමමුහුර්ත කරමින්';
  }

  @override
  String get voiceSearchUnavailable => 'හඬ සෙවීම නොමැත.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct Play අසාර්ථක විය';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'මෙම Dolby Vision ප්‍රවාහය සඳහා සෘජු ක්‍රීඩාව ආරම්භ කිරීමට අසමත් විය. සේවාදායක ට්‍රාන්ස්කෝඩ් භාවිතයෙන් නැවත උත්සාහ කරන්නද?';

  @override
  String get retryWithTranscode => 'ට්‍රාන්ස්කෝඩ් සමඟ නැවත උත්සාහ කරන්න';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision සඳහා සහය නොදක්වයි';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'මෙම උපාංගයට Dolby Vision අන්තර්ගතය කෙලින්ම විකේතනය කළ නොහැක. HDR10 පසුබැසීම භාවිතා කරන්න හෝ සේවාදායක ට්‍රාන්ස්කෝඩින් ඉල්ලන්න.';

  @override
  String get rememberMyChoice => 'මගේ තේරීම මතක තබා ගන්න';

  @override
  String get playHdr10Fallback => 'HDR10 පසුබැසීම වාදනය කරන්න';

  @override
  String get requestTranscode => 'ට්‍රාන්ස්කෝඩ් ඉල්ලන්න';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'පේළි # ක් සොයාගන්නා ලදී',
      one: 'පේළි # ක් සොයාගන්නා ලදී',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'සියල්ල බලන්න';

  @override
  String get noItems => 'අයිතම නැත';

  @override
  String get switchUser => 'පරිශීලක මාරු කරන්න';

  @override
  String get remoteControl => 'දුරස්ථ පාලකය';

  @override
  String get mediaBarLoading => 'මාධ්‍ය තීරුව පූරණය වෙමින්...';

  @override
  String get mediaBarError => 'මාධ්‍ය තීරුව පූරණය කිරීමට අසමත් විය';

  @override
  String get offlineServerUnavailable =>
      'අන්තර්ජාලයට සම්බන්ධ වී ඇත, නමුත් වත්මන් සේවාදායකය නොමැත.';

  @override
  String get offlineNoInternet => 'ඔබ නොබැඳිය. බාගත කළ අන්තර්ගතය පමණක් තිබේ.';

  @override
  String get offlineFileNotAvailable => 'ගොනුව නොමැත';

  @override
  String get offlineSwitchServer => 'සේවාදායකය මාරු කරන්න';

  @override
  String get offlineSavedMedia => 'සුරැකි මාධ්‍ය';

  @override
  String get offlineBannerTitle => 'ඔබ නොබැඳියි';

  @override
  String get offlineBannerSubtitle => 'ඔබේ බාගැනීම් පෙන්වමින්';

  @override
  String get offlineBannerAction => 'බාගැනීම්';

  @override
  String get serverUnreachableBannerTitle => 'ඔබේ සේවාදායකයට ළඟා විය නොහැක';

  @override
  String get serverUnreachableBannerSubtitle =>
      'එය නැවත එනතුරු බාගැනීම්වලින් වාදනය කරමින්';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'දුරස්ථ නැවත ධාවනය';

  @override
  String castControlFailed(String error) {
    return 'කාස්ට් පාලනය අසාර්ථක විය: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind පාලන';
  }

  @override
  String get castDeviceVolume => 'උපාංග පරිමාව';

  @override
  String get castVolumeUnavailable => 'ලබා ගත නොහැක';

  @override
  String castStopKind(String kind) {
    return '$kind නවත්වන්න';
  }

  @override
  String get audioLabel => 'ශ්රව්ය උපකරණ';

  @override
  String get subtitlesLabel => 'උපසිරැසි';

  @override
  String get pinConfirmTitle => 'PIN තහවුරු කරන්න';

  @override
  String get pinSetTitle => 'PIN සකසන්න';

  @override
  String get pinEnterTitle => 'PIN ඇතුලත් කරන්න';

  @override
  String get pinReenterToConfirm =>
      'තහවුරු කිරීමට ඔබගේ PIN අංකය නැවත ඇතුල් කරන්න';

  @override
  String pinEnterNDigit(int length) {
    return 'අංක $lengthක PIN එකක් ඇතුළත් කරන්න';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'ඔබේ අංක $lengthක PIN එක ඇතුළත් කරන්න';
  }

  @override
  String get pinIncorrect => 'වැරදි PIN අංකය';

  @override
  String get pinMismatch => 'PIN නොගැලපේ';

  @override
  String get pinForgot => 'PIN අමතකද?';

  @override
  String get pinClear => 'හිස් කරන්න';

  @override
  String get pinBackspace => 'පසුඉඩ';

  @override
  String get quickConnectAuthorized => 'Quick Connect ඉල්ලීම අනුමත කරන ලදී.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect කේතය වලංගු නැත හෝ කල් ඉකුත් වී ඇත.';

  @override
  String get quickConnectNotSupported =>
      'මෙම සේවාදායකයේ Quick Connect සඳහා සහය නොදක්වයි.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect කේතය අනුමත කිරීමට අසමත් විය.';

  @override
  String get quickConnectDisabled => 'මෙම සේවාදායකයේ Quick Connect අබල කර ඇත.';

  @override
  String get quickConnectForbidden =>
      'ඔබේ ගිණුමට මෙම Quick Connect ඉල්ලීම අනුමත කළ නොහැක.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect කේතය හමු නොවීය. නව කේතයක් උත්සාහ කරන්න.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect අසාර්ථක විය: $message';
  }

  @override
  String get quickConnectEnterCode => 'කේතය ඇතුලත් කරන්න';

  @override
  String get quickConnectAuthorize => 'අවසර දෙන්න';

  @override
  String remoteCommandFailed(String error) {
    return 'විධානය අසාර්ථක විය: $error';
  }

  @override
  String get remoteControlTitle => 'දුරස්ථ පාලකය';

  @override
  String get remoteFailedToLoadSessions => 'සැසි පූරණය කිරීමට අසමත් විය';

  @override
  String get remoteNoSessions => 'පාලනය කළ හැකි සැසි නැත';

  @override
  String get remoteStartPlayback => 'වෙනත් උපාංගයක නැවත ධාවනය ආරම්භ කරන්න';

  @override
  String get unknownUser => 'නොදන්නා';

  @override
  String get unknownItem => 'නොදන්නා';

  @override
  String get remoteNothingPlaying => 'මෙම සැසියේ කිසිවක් වාදනය නොවේ';

  @override
  String get castingStarted => 'තෝරාගත් උපාංගය මත විකාශනය ආරම්භ විය';

  @override
  String castingFailed(String error) {
    return 'කාස්ට් කිරීම ආරම්භ කිරීමට අසමත් විය: $error';
  }

  @override
  String get noRemoteDevices => 'දුරස්ථ ධාවන උපාංග නොමැත.';

  @override
  String get noRemoteDevicesIos =>
      'දුරස්ථ ධාවන උපාංග නොමැත.\n\niOS මත, AirPlay ඉලක්ක සිමියුලේටරය තුළ නොතිබිය හැකිය.';

  @override
  String get trackActionPlayNext => 'ඊළඟට සෙල්ලම් කරන්න';

  @override
  String get trackActionAddToQueue => 'පෝලිමට එකතු කරන්න';

  @override
  String get trackActionAddToPlaylist => 'ධාවන ලැයිස්තුවට එක් කරන්න';

  @override
  String get trackActionCancelDownload => 'බාගත කිරීම අවලංගු කරන්න';

  @override
  String get trackActionDeleteFromPlaylist => 'ධාවන ලැයිස්තුවෙන් මකන්න';

  @override
  String get trackActionMoveUp => 'ඉහළට ගෙන යන්න';

  @override
  String get trackActionMoveDown => 'පහළට ගමන් කරන්න';

  @override
  String get trackActionRemoveFromFavorites => 'ප්‍රියතමයන් වෙතින් ඉවත් කරන්න';

  @override
  String get trackActionAddToFavorites => 'ප්‍රියතමයන් වෙත එක් කරන්න';

  @override
  String get trackActionGoToAlbum => 'ඇල්බමය වෙත යන්න';

  @override
  String get trackActionGoToArtist => 'කලාකරු වෙත යන්න';

  @override
  String trackActionDownloading(String name) {
    return '$name බාගත වෙමින්...';
  }

  @override
  String get trackActionDeletedFile => 'බාගත කළ ගොනුව මකා දමන ලදී';

  @override
  String get trackActionDeleteFileFailed => 'බාගත කළ ගොනුව මැකීමට නොහැකි විය';

  @override
  String get shuffleBy => 'කලවම් කරන්න';

  @override
  String get shuffleSelectLibrary => 'පුස්තකාලය තෝරන්න';

  @override
  String get shuffleSelectGenre => 'ප්‍රභේදය තෝරන්න';

  @override
  String get shuffleLibrary => 'පුස්තකාලය';

  @override
  String get shuffleGenre => 'ප්‍රභේදය';

  @override
  String get shuffleNoLibraries => 'ගැළපෙන පුස්තකාල නොමැත.';

  @override
  String get shuffleNoGenres =>
      'මෙම කලවම් ප්‍රකාරය සඳහා ප්‍රභේද කිසිවක් හමු නොවීය.';

  @override
  String get posterDisplayTitle => 'ප්රදර්ශනය කරන්න';

  @override
  String get posterImageType => 'රූප වර්ගය';

  @override
  String get imageTypePoster => 'පෝස්ටර්';

  @override
  String get imageTypeThumbnail => 'සිඟිති රුව';

  @override
  String get imageTypeBanner => 'බැනරය';

  @override
  String get playlistAddFailed => 'ධාවන ලැයිස්තුවට එක් කිරීමට අසමත් විය';

  @override
  String get playlistCreateFailed => 'ධාවන ලැයිස්තුව සෑදීමට අසමත් විය';

  @override
  String get playlistNew => 'නව ධාවන ලැයිස්තුව';

  @override
  String get playlistCreate => 'නිර්මාණය කරන්න';

  @override
  String get playlistCreateNew => 'නව ධාවන ලැයිස්තුවක් සාදන්න';

  @override
  String get playlistNoneFound => 'ධාවන ලැයිස්තු හමු නොවීය';

  @override
  String get addToPlaylist => 'ධාවන ලැයිස්තුවට එක් කරන්න';

  @override
  String get lyricsNotAvailable => 'ගී පද නොමැත';

  @override
  String get upNext => 'ඊළඟට';

  @override
  String get playNext => 'ඊළඟට සෙල්ලම් කරන්න';

  @override
  String get stillWatchingContent => 'පසුධාවනය විරාම කර ඇත. ඔබ තවමත් බලනවාද?';

  @override
  String get stillWatchingStop => 'නවත්වන්න';

  @override
  String get stillWatchingContinue => 'දිගටම කරගෙන යන්න';

  @override
  String skipSegment(String segment) {
    return '$segment මඟහරින්න';
  }

  @override
  String get liveTv => 'සජීවී රූපවාහිනිය';

  @override
  String get continueWatchingAndNextUp => 'නැරඹීම දිගටම කරගෙන යන්න සහ ඊළඟට';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'බාගත වෙමින් $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName බාගත වෙමින්';
  }

  @override
  String get nextEpisode => 'ඊළඟ කථාංගය';

  @override
  String get moreFromThisSeason => 'මෙම වාරයේ තවත්';

  @override
  String get playerTooltipPlaybackSpeed => 'නැවත ධාවනය වේගය';

  @override
  String get playerTooltipCastControls => 'වාත්තු පාලන';

  @override
  String get playerTooltipPlaybackQuality => 'බිට්රේට්';

  @override
  String get playerTooltipEnterFullscreen => 'සම්පූර්ණ තිරයට ඇතුළු වන්න';

  @override
  String get playerTooltipExitFullscreen => 'සම්පූර්ණ තිරයෙන් පිටවන්න';

  @override
  String get playerTooltipFloatOnTop => 'උඩින් පාවෙන්න';

  @override
  String get playerTooltipExitFloatOnTop => 'උඩින් float අක්‍රිය කරන්න';

  @override
  String get playerTooltipLockLandscape => 'භූ දර්ශනය අගුළු දමන්න';

  @override
  String get playerTooltipUnlockOrientation => 'භ්රමණයට ඉඩ දෙන්න';

  @override
  String get playerTooltipPrevious => 'පෙර';

  @override
  String get playerTooltipSeekBack => 'ආපසු සොයන්න';

  @override
  String get playerTooltipSeekForward => 'ඉදිරියට සොයන්න';

  @override
  String get contextMenuMarkWatched => 'නැරඹූ ලෙස ලකුණු කරන්න';

  @override
  String get contextMenuMarkUnwatched => 'නොබැලු ලෙස ලකුණු කරන්න';

  @override
  String get contextMenuAddToFavorites => 'ප්‍රියතමයන් වෙත එක් කරන්න';

  @override
  String get contextMenuRemoveFromFavorites => 'ප්‍රියතමයන් වෙතින් ඉවත් කරන්න';

  @override
  String get contextMenuGoToSeries => 'මාලාව වෙත යන්න';

  @override
  String get contextMenuHideFromContinueWatching =>
      'නැරඹීම දිගටම කරන්නෙන් සඟවන්න';

  @override
  String get contextMenuHideFromNextUp => 'ඊළඟට කින් සඟවන්න';

  @override
  String get contextMenuAddToCollection => 'එකතුවට එක් කරන්න';

  @override
  String get settingsAdministrationSubtitle =>
      'සේවාදායක පරිපාලන පැනලය වෙත පිවිසෙන්න';

  @override
  String get settingsAccountSecurity => 'ගිණුම සහ ආරක්ෂාව';

  @override
  String get settingsAccountSecuritySubtitle =>
      'සත්‍යාපනය, PIN කේතය, සහ මාපිය පාලන';

  @override
  String get settingsPersonalization => 'පුද්ගලීකරණය';

  @override
  String get settingsPersonalizationSubtitle =>
      'තේමාව, සංචාලනය, නිවාස පේළි සහ පුස්තකාල දෘශ්‍යතාව';

  @override
  String get settingsDynamicContent => 'ගතික අන්තර්ගතය';

  @override
  String get settingsDynamicContentSubtitle => 'මාධ්‍ය තීරුව සහ දෘශ්‍ය ආවරණ';

  @override
  String get settingsPlaybackSyncplay => 'පසුධාවනය සහ SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'ශ්‍රව්‍ය/වීඩියෝ සැකසීම්, උපසිරැසි, බාගැනීම්, සහ SyncPlay පාලන';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plugin sync, Seerr, ratings, සහ තවත් දේ';

  @override
  String get settingsAboutSubtitle => 'යෙදුම් අනුවාදය, නීතිමය තොරතුරු සහ ණය';

  @override
  String get settingsAuthenticationSection => 'Authentication';

  @override
  String get settingsSortServersBy => 'සේවාදායකයන් අනුව වර්ග කරන්න';

  @override
  String get settingsLastUsed => 'අවසන් වරට භාවිතා කරන ලදී';

  @override
  String get settingsAlphabetical => 'අකාරාදී';

  @override
  String get settingsConnectionSection => 'සම්බන්ධතාව';

  @override
  String get settingsAllowSelfSignedCerts =>
      'ස්වයං-අත්සන් කළ සහතිකවලට ඉඩ දෙන්න';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'ස්වයං-අත්සන් කළ හෝ පෞද්ගලික-CA TLS සහතික භාවිත කරන සේවාදායක විශ්වාස කරන්න. ඔබ පාලනය කරන සේවාදායක සඳහා පමණක් සබල කරන්න. මෙය සියලු සම්බන්ධතා සඳහා සහතික වලංගුකරණය අබල කරයි.';

  @override
  String get settingsPrivacyAndSafetySection => 'පෞද්ගලිකත්වය සහ ආරක්ෂාව';

  @override
  String get settingsBlockedRatings => 'අවහිර කළ ශ්‍රේණිගත කිරීම්';

  @override
  String get settingsGeneralStyle => 'සාමාන්ය ශෛලිය';

  @override
  String get settingsGeneralStyleSubtitle =>
      'තේමා උච්චාරණ, පසුබිම්, නැරඹූ දර්ශක සහ තේමා සංගීතය';

  @override
  String get settingsDetailsScreen => 'විස්තර තිරය';

  @override
  String get settingsDetailsScreenSubtitle =>
      'විලාසය, පසුබිම් බොඳ කිරීම සහ ටැබ හැසිරීම';

  @override
  String get settingsHomePage => 'මුල් පිටුව';

  @override
  String get settingsHomePageSubtitle =>
      'කොටස්, රූප වර්ග, උඩැතිරි සහ මාධ්‍ය පෙරදසුන්';

  @override
  String get settingsLibrariesSubtitle =>
      'පුස්තකාල දෘශ්‍යතාව, ෆෝල්ඩර දර්ශනය සහ බහු-සේවාදායක හැසිරීම';

  @override
  String get settingsTwentyFourHourClock => 'පැය 24 ඔරලෝසුව';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'ඔරලෝසුව පෙන්වන ඕනෑම තැනක පැය 24 කාල හැඩතල ගැන්වීම භාවිතා කරන්න';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'සංචාලන තීරුවේ කලවම් බොත්තම පෙන්වන්න';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'සංචාලන තීරුවේ ප්‍රභේද බොත්තම පෙන්වන්න';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'සංචාලන තීරුවේ ප්‍රියතම බොත්තම පෙන්වන්න';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'සංචාලන තීරුවේ පුස්තකාල බොත්තම පෙන්වන්න';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'සංචාලන තීරුවේ Seerr බොත්තම පෙන්වන්න';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'ඉහළ සංචාලන තීරුවේ පෙළ ලේබල සැමවිටම පෙන්වන්න';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'පුස්තකාලයකට මුල් පිටුව දෘශ්‍යතාව ටොගල් කරන්න. වෙනස්කම් බලාත්මක වීමට Moonfin නැවත ආරම්භ කරන්න.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'මාධ්‍ය තීරුව සහ දේශීය පෙරදසුන්';

  @override
  String get settingsVisualOverlays => 'දෘශ්ය ආවරණ';

  @override
  String get settingsSeasonalSurprise => 'සෘතුමය පුදුමය';

  @override
  String get settingsMetadataAndRatings => 'පාරදත්ත සහ ශ්‍රේණිගත කිරීම්';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase අමතර ශ්‍රේණිගත කිරීමේ මූලාශ්‍ර, Seerr ඉල්ලීම්, සහ සමමුහුර්ත මනාප ඇතුළුව සේවාදායක පාර්ශවීය ඒකාබද්ධ කිරීම් බලගන්වයි.';

  @override
  String get settingsOfflineDownloads => 'නොබැඳි බාගැනීම්';

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
  String get settingsHigh => 'ඉහළ';

  @override
  String get settingsLow => 'අඩුයි';

  @override
  String get settingsCustomPath => 'අභිරුචි මාර්ගය';

  @override
  String get settingsEnterDownloadFolderPath =>
      'බාගැනීම් ෆෝල්ඩර මාර්ගය ඇතුළත් කරන්න';

  @override
  String get settingsConcurrentDownloads => 'සමගාමී බාගැනීම්';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'එකවර බාගැනීමට හැකි උපරිම අයිතම ගණන.';

  @override
  String get settingsAppInfo => 'යෙදුම් තොරතුරු';

  @override
  String get settingsReportAnIssue => 'ගැටලුවක් වාර්තා කරන්න';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub හි ගැටළු ට්රැකර් විවෘත කරන්න';

  @override
  String get settingsJoinDiscord => 'Discord එක්වන්න';

  @override
  String get settingsJoinDiscordSubtitle => 'ප්රජාව සමඟ කතාබස් කරන්න';

  @override
  String get settingsJoinTheDiscord => 'Discord එකට එකතු වෙන්න';

  @override
  String get settingsSupportMoonfin => 'Moonfin සඳහා සහය වන්න';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'සංවර්ධකයාට කෝපි කෝප්පයක් පරිත්‍යාග කරන්න';

  @override
  String get settingsLegal => 'නීතිමය';

  @override
  String get settingsLicenses => 'බලපත්ර';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'විවෘත මූලාශ්‍ර බලපත්‍ර දැන්වීම්';

  @override
  String get settingsPrivacyPolicy => 'රහස්යතා ප්රතිපත්තිය';

  @override
  String get settingsPrivacyPolicySubtitle => 'Moonfin ඔබේ දත්ත හසුරුවන ආකාරය';

  @override
  String get settingsCheckForUpdates => 'යාවත්කාලීන සඳහා පරීක්ෂා කරන්න';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'නවතම Moonfin නිකුතුව සඳහා පරීක්ෂා කරන්න';

  @override
  String get settingsPoweredByFlutter => 'Flutter මගින් බල ගැන්වේ';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'බලපත්‍ර දැන්වීම් #',
      one: 'බලපත්‍ර දැන්වීම් #',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'දෙකම';

  @override
  String get settingsShuffleContentTypeFilter =>
      'අන්තර්ගත ආකාරයේ පෙරහන කලවම් කරන්න';

  @override
  String get settingsVideoPlaybackPreferences => 'වීඩියෝ නැවත ධාවනය මනාප';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'මූලික වීඩියෝ එන්ජිම සහ ප්‍රවාහ තත්ත්ව සැකසුම්';

  @override
  String get settingsAudioPreferences => 'ශ්‍රව්‍ය මනාප';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ශ්‍රව්‍ය ඛණ්ඩ, සැකසීම සහ ගමන් මාර්ග විකල්ප';

  @override
  String get settingsAutomationAndQueue => 'ස්වයංක්‍රීයකරණය සහ පෝලිම්';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'ස්වයංක්‍රීය නැවත ධාවනය සහ අනුපිළිවෙල';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'බාගත කිරීමේ ගුණාත්මකභාවය, ගබඩා සීමාවන් සහ පෝලිම් ප්‍රමාණය';

  @override
  String get settingsSyncplaySubtitle =>
      'කණ්ඩායම් සැසි සඳහා සමමුහුර්ත කිරීමේ තර්කනය';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'විශේෂිත ක්රීඩක විශේෂාංග. සමහර විකල්ප නැවත ධාවනය ගැටළු ඇති කළ හැකි බැවින්, ප්‍රවේශමෙන් භාවිතා කරන්න';

  @override
  String get settingsSkipIntrosAndOutros => 'හැඳින්වීම් සහ පිටවීම් මඟ හරින්නද?';

  @override
  String get settingsMediaSegmentCountdown => 'මාධ්‍ය කොටස් ආපසු ගණන් කිරීම';

  @override
  String get settingsProgressBar => 'ප්‍රගති තීරුව';

  @override
  String get settingsTimer => 'ටයිමරය';

  @override
  String get settingsNone => 'කිසිවක් නැත';

  @override
  String get settingsPromptUser => 'ඉක්මන් පරිශීලක';

  @override
  String get settingsSkip => 'මඟ හරින්න';

  @override
  String get settingsDoNothing => 'කිසිවක් නොකරන්න';

  @override
  String get settingsMaxBitrateDescription =>
      'ප්‍රවාහ බිටු අනුපාතය සීමා කරන්න. මෙම සීමාවට ඉහළින් ඇති අන්තර්ගතය ගැළපෙන පරිදි පරිවර්තනය කරනු ලැබේ.';

  @override
  String get settingsMaxResolutionDescription =>
      'ක්‍රීඩකයා ඉල්ලා සිටින උපරිම විභේදනය සීමා කරන්න. ඉහළ-විභේදන අන්තර්ගතයන් සංඛේතය අඩු කරනු ඇත.';

  @override
  String get settingsPlayerZoomDescription =>
      'තිරයට ගැළපෙන පරිදි වීඩියෝව පරිමාණය කළ යුතු ආකාරය.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'ප්ලේබැක් එන්ජිම (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV උපාංගවල පෙරනිමි ධාවන එන්ජිම තෝරන්න. මීළඟ පසුධාවන සැසියට වෙනස්කම් අදාළ වේ.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (නිර්දේශිත)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (පැරණි)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (උරුමය)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (නිර්දේශිත)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision පසුබැසීම';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision විකේතනය නොමැති උපාංග මත Dolby Vision මාතෘකා සඳහා හැසිරීම.';

  @override
  String get settingsAskEachTime => 'සෑම අවස්ථාවකදීම අසන්න';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 පසුබැසීමට කැමති වන්න';

  @override
  String get settingsPreferServerTranscode =>
      'සේවාදායක ට්‍රාන්ස්කෝඩ් වලට කැමති වන්න';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision පැතිකඩ 7 සෘජු වාදනය';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision profile 7 වැඩිදියුණු කිරීමේ-ස්ථර ප්‍රවාහයන් සෘජු වාදනය කළ යුතුද යන්න පාලනය කරයි.';

  @override
  String get settingsAutoAftkrtEnabled => 'ස්වයංක්‍රීය (AFTKRT සබලයි)';

  @override
  String get settingsEnabledOnThisDevice => 'මෙම උපාංගය මත සබල කර ඇත';

  @override
  String get settingsDisabledPreferTranscode => 'අබල කර ඇත (සංකේත කේතය කැමති)';

  @override
  String get settingsResumeRewindDescription =>
      'නැවත ධාවනය ආරම්භ කරන විට (දිගටම නැරඹීමෙන් හෝ මාධ්‍ය අයිතම පිටුවකින්), තත්පර කීයක් නැවත ධාවනය කළ යුතුද?';

  @override
  String get settingsUnpauseRewindDescription =>
      'විරාම බොත්තම එබීමෙන් පසු නැවත ධාවනය නැවත ආරම්භ කරන විට, තත්පර කීයක් නැවත ධාවනය කළ යුතුද?';

  @override
  String get settingsSkipBackLengthDescription =>
      'රිවයින්ඩ් බොත්තම එබීමෙන් පසු තත්පර කීයක් ආපසු පනින්න.';

  @override
  String get settingsOneSecond => 'තත්පර 1';

  @override
  String get settingsThreeSeconds => 'තත්පර 3 යි';

  @override
  String get settingsFortyFiveSeconds => 'තත්පර 45 යි';

  @override
  String get settingsSixtySeconds => 'තත්පර 60 යි';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Fast forward බොත්තම එබීමෙන් පසු තත්පර කීයක් ඉදිරියට පනින්න.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 බාහිර විකේතකය වෙත';

  @override
  String get settingsCinemaMode => 'සිනමා මාදිලිය';

  @override
  String get settingsCinemaModeSubtitle =>
      'ප්‍රධාන විශේෂාංගයකට පෙර ට්‍රේලර්/පෙරෝල් වාදනය කරන්න';

  @override
  String get settingsNextUpDisplayDescription =>
      'විස්තීරණ කථාංග කලාකෘති සහ විස්තරය සහිත සම්පූර්ණ කාඩ්පතක් පෙන්වයි. අවමය සංයුක්ත ගණන් කිරීමේ උඩැතිරියක් පෙන්වයි. අබල කර ඇති ප්‍රේරකය සම්පූර්ණයෙන්ම සඟවයි.';

  @override
  String get settingsShort => 'කෙටි';

  @override
  String get settingsLong => 'දිගු';

  @override
  String get settingsVeryLong => 'ඉතා දිගු';

  @override
  String get settingsVideoStartDelay => 'වීඩියෝ ආරම්භය ප්‍රමාදය';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'සජීවී රූපවාහිනී සෘජු';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'සජීවී රූපවාහිනිය සඳහා සෘජු වාදනය සබල කරන්න';

  @override
  String get settingsOpenGroups => 'කණ්ඩායම් විවෘත කරන්න';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay කණ්ඩායම් සාදන්න, සම්බන්ධ වන්න, හෝ කළමනාකරණය කරන්න';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay සබල කර ඇත';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'කණ්ඩායම් නැරඹීමේ විශේෂාංග සබල කරන්න';

  @override
  String get settingsSyncplayButton => 'SyncPlay බොත්තම';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'සංචාලන තීරුවේ SyncPlay බොත්තම පෙන්වන්න';

  @override
  String get settingsSyncplayAdvancedCorrection => 'උසස් නිවැරදි කිරීම';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'සියුම් සමමුහුර්ත තර්කනය සබල කරන්න';

  @override
  String get settingsSyncplaySyncCorrection => 'සමමුහුර්ත නිවැරදි කිරීම';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'සමමුහුර්තව සිටීමට නැවත ධාවනය ස්වයංක්‍රීයව සීරුමාරු කරන්න';

  @override
  String get settingsSyncplaySpeedToSync => 'සමමුහුර්ත කිරීමට වේගය';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'සමමුහුර්ත කිරීමට පසුධාවන වේග ගැලපුම භාවිතා කරන්න';

  @override
  String get settingsSyncplaySkipToSync => 'සමමුහුර්ත කිරීමට යන්න';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'සමමුහුර්ත කිරීමට සෙවීම භාවිතා කරන්න';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'අවම වේග ප්රමාදය';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'උපරිම වේග ප්‍රමාදය';

  @override
  String get settingsSyncplaySpeedDuration => 'වේග කාලසීමාව';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'අවම මඟ හැරීම ප්‍රමාදය';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay අමතර ඕෆ්සෙට්';

  @override
  String get onNow => 'දැන් මත';

  @override
  String get collections => 'එකතු කිරීම්';

  @override
  String get lastPlayed => 'අවසන් වරට ක්‍රීඩා කළේ';

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
    return 'මෑතකදී නිකුත් වූ $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'ඊළඟ කථාංගය ස්වයංක්‍රීයව වාදනය කරන්න';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'ලද හැකි විට ඊළඟ කථාංගය ස්වයංක්‍රීයව වාදනය කරන්න.';

  @override
  String get skipSilenceTitle => 'නිශ්ශබ්දතාව මඟහරින්න';

  @override
  String get skipSilenceSubtitle =>
      'ප්‍රවාහය සහාය දක්වන විට නිශ්ශබ්ද ශ්‍රව්‍ය කොටස් ස්වයංක්‍රීයව මඟහරින්න.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'බාහිර ශ්‍රව්‍ය ප්‍රයෝගවලට ඉඩ දෙන්න';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'සමකාරක සහ ප්‍රයෝග යෙදුම් (උදා. Wavelet) Media3 ධාවන සැසිවලට සම්බන්ධ වීමට ඉඩ දෙන්න.';

  @override
  String get disableTunnelingTitle => 'ටනලින් අබල කරන්න';

  @override
  String get disableTunnelingSubtitle =>
      'ටනල් නොකළ ධාවනය බලාත්මක කරන්න. ටනලින් ශ්‍රව්‍ය/වීඩියෝ අඛණ්ඩතා ගැටලු ඇති උපාංගවල ප්‍රයෝජනවත්.';

  @override
  String get enableTunnelingTitle => 'ටනලින් සබල කරන්න';

  @override
  String get enableTunnelingSubtitle =>
      'උසස්. ශ්‍රව්‍ය සහ වීඩියෝ සම්බන්ධිත දෘඪාංග මාර්ගයක් හරහා යවයි. සමහර උපාංගවල ශ්‍රව්‍ය/වීඩියෝ බිඳවැටීම් ඇති කරන බැවින් පෙරනිමියෙන් ක්‍රියාවිරහිතයි.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision පැතිකඩ 7 HEVC වෙත සිතියම්ගත කරන්න';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'DV නොවන උපාංගවල Dolby Vision පැතිකඩ 7 ප්‍රවාහ HDR10-ගැළපෙන HEVC ලෙස වාදනය කරන්න.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'කාවැද්දූ උපසිරැසි විලාස භාවිත කරන්න';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'උපසිරැසි පථයේ කාවැද්දූ වර්ණ, අකුරු සහ පිහිටුම යොදන්න. ඒ වෙනුවට ඔබේ සිරැසි විලාස මනාප භාවිත කිරීමට අබල කරන්න.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'කාවැද්දූ උපසිරැසි අකුරු ප්‍රමාණ භාවිත කරන්න';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'උපසිරැසි පථයේ කාවැද්දූ අකුරු-ප්‍රමාණ ඉඟි යොදන්න. ඔබේ විලාස මනාපවල උපසිරැසි ප්‍රමාණය භාවිත කිරීමට අබල කරන්න.';

  @override
  String get showMediaDetailsOnLibraryPage => 'මාධ්‍ය විස්තර පෙන්වන්න';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'පුස්තකාල පිටුවල ඉහළින් තෝරාගත් අයිතමයේ විස්තර පෙන්වන්න.';

  @override
  String get hideBackdropsInLibraries => 'පිරික්සන විට පසුබිම් සඟවන්නද?';

  @override
  String get useDetailedSubHeadings => 'විස්තරාත්මක උප-මාතෘකා භාවිත කරන්න';

  @override
  String get useDetailedSubHeadingsDescription =>
      'පුස්තකාල පිටුවල විස්තරාත්මක හෝ අවම උප-පේළියක් පෙන්වන්න.';

  @override
  String get savedThemesDeleteDialogTitle => 'සුරැකි තේමාව මකන්නද?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'මෙම උපාංග හැඹිලියෙන් \"$themeName\" ඉවත් කරන්නද?';
  }

  @override
  String get themeStore => 'තේමා වෙළඳසැල';

  @override
  String get themeStoreSubtitle => 'ප්‍රජා තේමා පිරික්සා සුරකින්න';

  @override
  String get themeStoreDescription =>
      'ඔබේ අනෙකුත් සුරැකි තේමා මෙන් භාවිත කිරීමට තේමාවක් සුරකින්න.';

  @override
  String get themeStoreEmpty => 'දැන් තේමා කිසිවක් නොමැත.';

  @override
  String get themeStoreLoadFailed =>
      'තේමා වෙළඳසැල පූරණය කළ නොහැකි විය. ඔබේ සම්බන්ධතාව පරීක්ෂා කර නැවත උත්සාහ කරන්න.';

  @override
  String get themeStoreSave => 'සුරකින්න';

  @override
  String get themeStoreSaveAndApply => 'සුරැකා යොදන්න';

  @override
  String get themeStoreSaved => 'සුරකින ලදී';

  @override
  String get themeStoreInvalidMessage => 'මෙම තේමාව පූරණය කළ නොහැකි විය.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" සුරකින ලදී.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'මෙම උපාංගයෙන් \"$themeName\" මකා දමන ලදී.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" මැකිය නොහැකි විය.';
  }

  @override
  String get savedThemesTitle => 'සුරැකි තේමා';

  @override
  String get savedThemesDescription =>
      'මේවා වත්මන් සේවාදායකය සඳහා Moonfin ප්ලගිනයෙන් බාගත කළ තේමා වේ. මැකීමෙන් මෙම දේශීය පිටපත පමණක් ඉවත් වේ.';

  @override
  String get savedThemesEmpty => 'මෙම සේවාදායකය සඳහා සුරැකි තේමා හමු නොවීය.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • දැනට ක්‍රියාත්මකයි';
  }

  @override
  String get savedThemesDeleteTooltip => 'සුරැකි තේමාව මකන්න';

  @override
  String get savedThemesManageSubtitle =>
      'මෙම උපාංගයේ බාගත කළ ප්ලගින තේමා කළමනාකරණය කරන්න';

  @override
  String get themeEditor => 'තේමා සංස්කාරකය';

  @override
  String get themeEditorSubtitle =>
      'ඔබේ බ්‍රවුසරයේ Moonfin තේමා සංස්කාරකය විවෘත කරන්න';

  @override
  String get homeScreen => 'මුල් තිරය';

  @override
  String get bottomBar => 'පහළ තීරුව';

  @override
  String get homeRowsStyleClassic => 'සම්භාව්‍ය';

  @override
  String get homeRowsStyleModern => 'නවීන';

  @override
  String get homeRowsSection => 'මුල් තිර පේළි';

  @override
  String get homeRowDisplay => 'මුල් තිර පේළි සංදර්ශනය';

  @override
  String get homeRowSections => 'මුල් තිර පේළි කොටස්';

  @override
  String get homeRowToggles => 'මුල් තිර පේළි ටොගල';

  @override
  String get homeRowTogglesSubtitle =>
      'පුස්තකාල පදනම් මුල් තිර පේළි ප්‍රවර්ග සබල හෝ අබල කරන්න';

  @override
  String get homeRowTogglesDescription =>
      'මුල් තිර කොටස්වල පේළි පෙන්වීමට පහත ටොගල සබල කරන්න.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'සම්භාව්‍ය මඟින් පේළියකට රූප වර්ගය සහ තොරතුරු උඩැතිරිය තබා ගනී. නවීන මඟින් සිරස්-සිට-පසුබිම පේළි භාවිත කරයි.';

  @override
  String get displayFavoritesRows => 'ප්‍රියතම පේළි පෙන්වන්න';

  @override
  String get displayFavoritesRowsSubtitle =>
      'මුල් තිර කොටස්වල ප්‍රියතම චිත්‍රපට, මාලා සහ අනෙකුත් ප්‍රියතම පේළි පෙන්වන්න.';

  @override
  String get favoritesRowSorting => 'ප්‍රියතම පේළි වර්ග කිරීම';

  @override
  String get favoritesRowSortingDescription =>
      'එක් කළ දිනය, නිකුත් වූ දිනය, අකාරාදී ලෙස සහ තවත් ක්‍රම අනුව ප්‍රියතම පේළි වර්ග කරන්න.';

  @override
  String get displayCollectionsRows => 'එකතු පේළි පෙන්වන්න';

  @override
  String get displayCollectionsRowsSubtitle =>
      'මුල් තිර කොටස්වල එකතු පේළි පෙන්වන්න.';

  @override
  String get collectionsRowSorting => 'එකතු පේළි වර්ග කිරීම';

  @override
  String get collectionsRowSortingDescription =>
      'එක් කළ දිනය, නිකුත් වූ දිනය, අකාරාදී ලෙස සහ තවත් ක්‍රම අනුව එකතු පේළි වර්ග කරන්න.';

  @override
  String get displayGenresRows => 'ප්‍රභේද පේළි පෙන්වන්න';

  @override
  String get displayGenresRowsSubtitle =>
      'මුල් තිර කොටස්වල ප්‍රභේද පේළි පෙන්වන්න.';

  @override
  String get genresRowSorting => 'ප්‍රභේද පේළි වර්ග කිරීම';

  @override
  String get genresRowSortingDescription =>
      'එක් කළ දිනය, නිකුත් වූ දිනය, අකාරාදී ලෙස සහ තවත් ක්‍රම අනුව ප්‍රභේද පේළි වර්ග කරන්න.';

  @override
  String get genresRowItems => 'ප්‍රභේද පේළි අයිතම';

  @override
  String get genresRowItemsDescription =>
      'ප්‍රභේද පේළිවල චිත්‍රපට, මාලා හෝ දෙකම පෙන්වන්න.';

  @override
  String get displayPlaylistsRows => 'ධාවන ලැයිස්තු පේළි පෙන්වන්න';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'මුල් තිර කොටස්වල ධාවන ලැයිස්තු පේළි පෙන්වන්න.';

  @override
  String get playlistsRowSorting => 'ධාවන ලැයිස්තු පේළි වර්ග කිරීම';

  @override
  String get playlistsRowSortingDescription =>
      'එක් කළ දිනය, නිකුත් වූ දිනය, අකාරාදී ලෙස සහ තවත් ක්‍රම අනුව ධාවන ලැයිස්තු පේළි වර්ග කරන්න.';

  @override
  String get displayAudioRows => 'ශ්‍රව්‍ය පේළි පෙන්වන්න';

  @override
  String get displayAudioRowsSubtitle =>
      'මුල් තිර කොටස්වල ශ්‍රව්‍ය පේළි පෙන්වන්න.';

  @override
  String get audioRowsSorting => 'ශ්‍රව්‍ය පේළි වර්ග කිරීම';

  @override
  String get audioRowsSortingDescription =>
      'එක් කළ දිනය, නිකුත් වූ දිනය, අකාරාදී ලෙස සහ තවත් ක්‍රම අනුව ශ්‍රව්‍ය පේළි වර්ග කරන්න.';

  @override
  String get audioPlaylists => 'ශ්‍රව්‍ය ධාවන ලැයිස්තු';

  @override
  String get appearance => 'පෙනුම';

  @override
  String get layout => 'සැකැස්ම';

  @override
  String get theme => 'තේමාව';

  @override
  String get keyboard => 'යතුරුපුවරුව';

  @override
  String get navButtons => 'බොත්තම්';

  @override
  String get rendering => 'විදැහුම්කරණය';

  @override
  String get mpvConfiguration => 'MPV වින්‍යාසය';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'බාහිර ධාවක යෙදුම';

  @override
  String get externalPlayerAppDescription =>
      'දිගු-ඔබන්න වාදන විකල්පය සබල කිරීමට බාහිර ධාවකයක් සකසන්න';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'ධාවනය ආරම්භ වන විට යෙදුම් තෝරකය පෙන්වන්න.';

  @override
  String get loadingInstalledPlayers => 'ස්ථාපිත ධාවක පූරණය වෙමින්...';

  @override
  String get connection => 'සම්බන්ධතාව';

  @override
  String get audioTranscodeTarget => 'ශ්‍රව්‍ය ට්‍රාන්ස්කෝඩ් ඉලක්කය';

  @override
  String get passthrough => 'පාස්ත්‍රූ';

  @override
  String get supportedOnThisDevice => 'මෙම උපාංගයේ සහාය දක්වයි';

  @override
  String get notSupportedOnThisDevice => 'මෙම උපාංගයේ සහාය නොදක්වයි';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) පාස්ත්‍රූ';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) බාහිර විකේතකයට බිට්ස්ට්‍රීම් කරන්න.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Atmos (JOC) සහිත TrueHD පාස්ත්‍රූ';

  @override
  String get mediaPlayerBehavior => 'මාධ්‍ය ධාවක හැසිරීම';

  @override
  String get playbackEnhancements => 'වාදන වැඩිදියුණු කිරීම්';

  @override
  String get alwaysOn => 'සැමවිටම ක්‍රියාත්මකයි.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'අවසානය මඟහැරීම ඊළඟට සංදර්ශනයෙන් ප්‍රතිස්ථාපනය කරන්න';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'අවසානය මඟහරින බොත්තම වෙනුවට ඊළඟට උඩැතිරිය පෙන්වන්න.';

  @override
  String get playerRouting => 'ධාවක මාර්ගගත කිරීම';

  @override
  String get preferSoftwareDecoders => 'මෘදුකාංග විකේතකවලට මුල් තැන දෙන්න';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'දෘඪාංග විකේතකවලට පෙර FFmpeg (ශ්‍රව්‍ය) සහ libgav1 (AV1) භාවිත කරන්න. HDMI ශ්‍රව්‍ය පාස්ත්‍රූ බිඳ වැටේ නම් අබල කරන්න.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV හි ඔබ තෝරාගත් බාහිර යෙදුමේ වීඩියෝ ධාවනය විවෘත කරන්න.';

  @override
  String get automaticQueuing => 'ස්වයංක්‍රීය පෝලිම් කිරීම';

  @override
  String get preferSdhSubtitles => 'SDH උපසිරැසිවලට මුල් තැන දෙන්න';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'ස්වයංක්‍රීයව තෝරන විට SDH/CC උපසිරැසි පථවලට ප්‍රමුඛත්වය දෙන්න.';

  @override
  String get webDiagnostics => 'වෙබ් දෝෂ නිර්ණය';

  @override
  String get webDiagnosticsTitle => 'Moonfin වෙබ් දෝෂ නිර්ණය';

  @override
  String get webDiagnosticsIntro =>
      'බ්‍රවුසර සම්බන්ධතා ගැටලු (CORS, මිශ්‍ර අන්තර්ගතය සහ සොයාගැනීමේ සැකසීම්) විනිශ්චය කිරීමට මෙම පිටුව භාවිත කරන්න.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'මිශ්‍ර-අන්තර්ගත අසාර්ථකත්වයක් හඳුනාගන්නා ලදී';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight අසාර්ථකත්වයක් හඳුනාගන්නා ලදී';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'HTTP සේවාදායක URL එකක් ඇමතීමට උත්සාහ කරන HTTPS පිටුවක් Moonfin හඳුනාගත්තේය. බ්‍රවුසර මෙම ඉල්ලීම ඔබේ සේවාදායකයට ළඟා වීමට පෙර අවහිර කරයි.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'මාධ්‍ය සේවාදායකයේ අස්ථානගත වූ CORS හෝ preflight ශීර්ෂ නිසා බහුලව ඇතිවන බ්‍රවුසර මට්ටමේ ඉල්ලීම් අසාර්ථකත්වයක් Moonfin හඳුනාගත්තේය.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'ඉලක්ක URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'විස්තරය: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'වත්මන් ධාවන කාල සන්දර්භය';

  @override
  String get webDiagnosticsOrigin => 'මූලාරම්භය';

  @override
  String get webDiagnosticsScheme => 'යෝජනා ක්‍රමය';

  @override
  String get webDiagnosticsPluginMode => 'ප්ලගින ප්‍රකාරය';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC පරිලෝකනය';

  @override
  String get webDiagnosticsForcedServerUrl => 'බලෙන් යෙදූ සේවාදායක URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'පෙරනිමි සේවාදායක URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'සොයාගැනීමේ ප්‍රොක්සි URL';

  @override
  String get notConfigured => 'වින්‍යාස කර නැත';

  @override
  String get webDiagnosticsMixedContent => 'මිශ්‍ර අන්තර්ගතය';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'මෙම පිටුව HTTPS හරහා පූරණය වී ඇත, නමුත් වින්‍යාස කළ URL එකක් හෝ කිහිපයක් HTTP වේ. බ්‍රවුසර HTTPS පිටුවලට HTTP API ඇමතීම අවහිර කරයි.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'විසඳුම: ඔබේ මාධ්‍ය සේවාදායකය හෝ ප්‍රොක්සි අන්තය HTTPS හරහා සපයන්න, නැතහොත් Moonfin HTTP හරහා විශ්වාසනීය දේශීය ජාලවල පමණක් පූරණය කරන්න.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'වත්මන් ධාවන කාල සැකසීම්වලින් පැහැදිලි මිශ්‍ර-අන්තර්ගත වින්‍යාසයක් හඳුනාගත නොහැකි විය.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS පිරික්සුම් ලැයිස්තුව';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin හි බ්‍රවුසර මූලාරම්භයට ඉඩ දෙන්න.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers හි Authorization, X-Emby-Authorization සහ X-Emby-Token ඇතුළත් කරන්න.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• ප්‍රවාහ සහ ගමන් හැසිරීම සඳහා Content-Range සහ Accept-Ranges හෙළිදරව් කරන්න.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight ඉල්ලීම්වලට 204 ලබා දෙන්න.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'උදාහරණ ශීර්ෂ කැබැල්ල (nginx-විලාසය)';

  @override
  String get note => 'සටහන';

  @override
  String get webDiagnosticsNonWebNote =>
      'මෙම දෝෂ නිර්ණ මාර්ගය වෙබ් නිර්මාණ සඳහා අදහස් කර ඇත. ඔබ මෙය වෙනත් වේදිකාවක දකින්නේ නම්, මෙම පරීක්ෂණ අදාළ නොවිය හැක.';

  @override
  String get backToServerSelect => 'සේවාදායක තේරීමට ආපසු';

  @override
  String get signOutAllUsers => 'සියලු පරිශීලකයන් නික්මන්න';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'මයික්‍රොෆෝන අවසරය ස්ථිරවම ප්‍රතික්ෂේප වී ඇත. එය පද්ධති සැකසීම්වල සබල කරන්න.';

  @override
  String get voiceSearchPermissionRequired =>
      'හඬ සෙවීම සඳහා මයික්‍රොෆෝන අවසරය අවශ්‍යයි.';

  @override
  String get voiceSearchNoMatch => 'එය හසු නොවීය. නැවත උත්සාහ කරන්න.';

  @override
  String get voiceSearchNoSpeechDetected => 'කථනයක් හඳුනාගත නොහැකි විය.';

  @override
  String get voiceSearchMicrophoneError => 'මයික්‍රොෆෝන දෝෂයකි.';

  @override
  String get voiceSearchNeedsInternet => 'හඬ සෙවීමට අන්තර්ජාලය අවශ්‍යයි.';

  @override
  String get voiceSearchServiceBusy =>
      'හඬ සේවාව කාර්යබහුලයි. නැවත උත්සාහ කරන්න.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'මයික්‍රොෆෝන අවසරය ස්ථිරවම ප්‍රතික්ෂේප වී ඇත.';

  @override
  String get microphonePermissionDenied =>
      'මයික්‍රොෆෝන අවසරය ප්‍රතික්ෂේප වී ඇත.';

  @override
  String get speechRecognitionUnavailable =>
      'මෙම උපාංගයේ කථන හඳුනාගැනීම නොමැත.';

  @override
  String get openIosRoutePicker => 'iOS මාර්ග තෝරකය විවෘත කරන්න';

  @override
  String get airPlayRoutePickerUnavailable =>
      'මෙම උපාංගයේ AirPlay මාර්ග තෝරකය නොමැත.';

  @override
  String get videos => 'වීඩියෝ';

  @override
  String get programs => 'වැඩසටහන්';

  @override
  String get songs => 'ගීත';

  @override
  String get photoAlbums => 'ඡායාරූප ඇල්බම';

  @override
  String get photos => 'ඡායාරූප';

  @override
  String get people => 'පුද්ගලයන්';

  @override
  String get recentlyReleasedEpisodes => 'මෑතකදී නිකුත් වූ කථාංග';

  @override
  String get watchAgain => 'නැවත නරඹන්න';

  @override
  String get guestAppearances => 'අමුත්තන්ගේ පෙනී සිටීම්';

  @override
  String get appearancesSeerr => 'පෙනී සිටීම් (Seerr)';

  @override
  String get crewContributionsSeerr => 'කණ්ඩායම් දායකත්ව (Seerr)';

  @override
  String get watchWithGroup => 'කණ්ඩායම සමඟ නරඹන්න';

  @override
  String get errors => 'දෝෂ';

  @override
  String get warnings => 'අනතුරු ඇඟවීම්';

  @override
  String get disk => 'තැටිය';

  @override
  String get openInBrowser => 'බ්‍රවුසරයේ විවෘත කරන්න';

  @override
  String get embeddedBrowserNotAvailable =>
      'මෙම වේදිකාවේ කාවැද්දූ බ්‍රවුසරයක් නොමැත.';

  @override
  String get adminRestartServerConfirmation =>
      'ඔබට සේවාදායකය නැවත ඇරඹීමට අවශ්‍ය බව විශ්වාසද?';

  @override
  String get adminShutdownServerConfirmation =>
      'ඔබට සේවාදායකය වසා දැමීමට අවශ්‍ය බව විශ්වාසද? ඔබට එය අතින් නැවත ඇරඹීමට සිදුවේ.';

  @override
  String get internal => 'අභ්‍යන්තර';

  @override
  String get idle => 'නිෂ්ක්‍රීය';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'පරිශීලකයන් හමු නොවීය';

  @override
  String get adminNoUsersMatchSearch => 'ඔබේ සෙවීමට ගැළපෙන පරිශීලකයන් නැත';

  @override
  String get adminNoDevicesFound => 'උපාංග හමු නොවීය';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'වත්මන් පෙරහන්වලට ගැළපෙන උපාංග නැත';

  @override
  String get passwordSet => 'මුරපදය සකසා ඇත';

  @override
  String get noPasswordConfigured => 'මුරපදයක් වින්‍යාස කර නැත';

  @override
  String get remoteAccess => 'දුරස්ථ ප්‍රවේශය';

  @override
  String get localOnly => 'දේශීය පමණි';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'මාධ්‍ය විශ්ලේෂණ පූරණය කිරීමට අසමත් විය';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'සියලු මාධ්‍ය පුස්තකාල හරහා ඒකාබද්ධ විශ්ලේෂණ.';

  @override
  String get analyticsTopArtists => 'ප්‍රමුඛ කලාකරුවන්';

  @override
  String get analyticsTopAuthors => 'ප්‍රමුඛ කතුවරුන්';

  @override
  String get analyticsTopContributors => 'ප්‍රමුඛ දායකයන්';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'පුස්තකාල $count',
      one: 'පුස්තකාලය 1',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'මෙම තේරීම සඳහා සුචිගත මාධ්‍ය එකතුවක් තවම නොමැත.';

  @override
  String get analyticsLibraryDetails => 'පුස්තකාල විස්තර';

  @override
  String get analyticsLibraryBreakdown => 'පුස්තකාල විග්‍රහය';

  @override
  String get analyticsNoLibrariesAvailable => 'පුස්තකාල කිසිවක් නොමැත.';

  @override
  String get adminServerAdministrationTitle => 'සේවාදායක පරිපාලනය';

  @override
  String get adminServerPathData => 'දත්ත';

  @override
  String get adminServerPathImageCache => 'රූප හැඹිලිය';

  @override
  String get adminServerPathCache => 'හැඹිලිය';

  @override
  String get adminServerPathLogs => 'ලොග';

  @override
  String get adminServerPathMetadata => 'පාරදත්ත';

  @override
  String get adminServerPathTranscode => 'ට්‍රාන්ස්කෝඩ්';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'මෙම සේවාදායකය සේවාදායක මාර්ග කිසිවක් ලබා දුන්නේ නැත.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% භාවිත කර ඇත';
  }

  @override
  String get userActivity => 'පරිශීලක ක්‍රියාකාරකම්';

  @override
  String get systemEvents => 'පද්ධති සිදුවීම්';

  @override
  String get needsAttention => 'අවධානය අවශ්‍යයි';

  @override
  String get adminDrawerSectionServer => 'සේවාදායකය';

  @override
  String get adminDrawerSectionPlayback => 'වාදනය';

  @override
  String get adminDrawerSectionDevices => 'උපාංග';

  @override
  String get adminDrawerSectionAdvanced => 'උසස්';

  @override
  String get adminDrawerSectionPlugins => 'ප්ලගින';

  @override
  String get adminDrawerSectionLiveTv => 'සජීවී රූපවාහිනිය';

  @override
  String get homeVideos => 'නිවසේ වීඩියෝ';

  @override
  String get mixedContent => 'මිශ්‍ර අන්තර්ගතය';

  @override
  String get homeVideosAndPhotos => 'නිවසේ වීඩියෝ සහ ඡායාරූප';

  @override
  String get mixedMoviesAndShows => 'මිශ්‍ර චිත්‍රපට සහ වැඩසටහන්';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'පටිගත කිරීම් හමු නොවීය';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension සංරක්ෂිතය තුළ රූප පිටු හමු නොවීය.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'කාවැද්දූ විදැහුම්කරු අසාර්ථක විය ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB විදැහුම්කරු අසාර්ථක විය ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'කියවනය සඳහා දේශීය ගොනුව අස්ථානගතයි: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri වෙතින් පොත් දත්ත විවෘත කිරීමේදී HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'කියවිය හැකි පොත් අන්තයක් නොමැත';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'සහාය නොදක්වන කොමික් සංරක්ෂිත ආකෘතියකි: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'මෙම වේදිකාවේ CBR උපුටාගැනීමේ ප්ලගිනය නොමැත.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr සංරක්ෂිතය උපුටා ගැනීමට අසමත් විය.';

  @override
  String get cb7ExtractionUnavailable => 'මෙම වේදිකාවේ CB7 උපුටාගැනීම නොමැත.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'මෙම වේදිකාවේ CB7 උපුටාගැනීමේ ප්ලගිනය නොමැත.';

  @override
  String get closeGenrePanel => 'ප්‍රභේද පැනලය වසන්න';

  @override
  String get loadingShuffle => 'කලවම් කිරීම පූරණය වෙමින්...';

  @override
  String get libraryShuffleLabel => 'පුස්තකාල කලවම් කිරීම';

  @override
  String get randomShuffleLabel => 'අහඹු කලවම් කිරීම';

  @override
  String get genresShuffleLabel => 'ප්‍රභේද කලවම් කිරීම';

  @override
  String get autoHdrSwitching => 'ස්වයංක්‍රීය HDR මාරු කිරීම';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR වීඩියෝ ධාවනය සඳහා ස්වයංක්‍රීයව HDR සබල කර පිටවීමේදී සංදර්ශන ප්‍රකාරය ප්‍රතිසාධනය කරන්න.';

  @override
  String get whenFullscreen => 'පූර්ණ තිරයේදී';

  @override
  String get changeArtwork => 'කලා නිර්මාණය වෙනස් කරන්න';

  @override
  String get missing => 'අස්ථානගතයි';

  @override
  String get transcodingLimits => 'ට්‍රාන්ස්කෝඩිං සීමා';

  @override
  String get clearAllArtworkButton => 'සියලු කලා නිර්මාණ හිස් කරන්නද?';

  @override
  String get clearAllArtworkWarning =>
      'ඔබට බාගත කළ සියලු කලා නිර්මාණ හිස් කිරීමට අවශ්‍ය බව විශ්වාසද?';

  @override
  String get confirmClear => 'හිස් කිරීම තහවුරු කරන්න';

  @override
  String confirmClearMessage(String itemType) {
    return 'ඔබට මෙම $itemType හිස් කිරීමට අවශ්‍ය බව විශ්වාසද?';
  }

  @override
  String get uploadButton => 'උඩුගත කරන්නද?';

  @override
  String get resolutionLabel => 'විභේදනය: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'අතුරුමුහුණතේ භාෂාවෙන් පමණක් කලා නිර්මාණ පෙන්වන්න';

  @override
  String get confirmClearAll => 'සියල්ල හිස් කිරීම තහවුරු කරන්න';

  @override
  String get imageUploadSuccess => 'රූපය සාර්ථකව උඩුගත කරන ලදී!';

  @override
  String imageUploadFailed(String error) {
    return 'රූපය උඩුගත කිරීමට අසමත් විය: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'රූපය සැකසීමට අසමත් විය: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'රූපය මැකීමට අසමත් විය: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'සියලු කලා නිර්මාණ හිස් කිරීමට අසමත් විය: $error';
  }

  @override
  String get yes => 'ඔව්';

  @override
  String get posterCategory => 'පෝස්ටරය';

  @override
  String get backdropsCategory => 'පසුබිම්';

  @override
  String get bannerCategory => 'බැනරය';

  @override
  String get logoCategory => 'ලාංඡනය';

  @override
  String get thumbnailCategory => 'සිඟිති රූව';

  @override
  String get artCategory => 'කලාව';

  @override
  String get discArtCategory => 'තැටි කලාව';

  @override
  String get screenshotCategory => 'තිර රුව';

  @override
  String get boxCoverCategory => 'පෙට්ටි කවරය';

  @override
  String get boxRearCoverCategory => 'පෙට්ටියේ පිටුපස කවරය';

  @override
  String get menuArtCategory => 'මෙනු කලාව';

  @override
  String get confirmItemPoster => 'පෝස්ටරය';

  @override
  String get confirmItemBackdrop => 'පසුබිම';

  @override
  String get confirmItemBanner => 'බැනරය';

  @override
  String get confirmItemLogo => 'ලාංඡනය';

  @override
  String get confirmItemThumbnail => 'සිඟිති රූව';

  @override
  String get confirmItemArt => 'කලාව';

  @override
  String get confirmItemDiscArt => 'තැටි කලාව';

  @override
  String get confirmItemScreenshot => 'තිර රුව';

  @override
  String get confirmItemBoxCover => 'පෙට්ටි කවරය';

  @override
  String get confirmItemBoxRearCover => 'පෙට්ටියේ පිටුපස කවරය';

  @override
  String get confirmItemMenuArt => 'මෙනු කලාව';

  @override
  String get resolutionAll => 'සියල්ල';

  @override
  String get resolutionHigh => 'ඉහළ (1080p+)';

  @override
  String get resolutionMedium => 'මධ්‍යම (720p)';

  @override
  String get resolutionLow => 'අඩු (<720p)';

  @override
  String get sources => 'මූලාශ්‍ර';

  @override
  String get audiobookChapters => 'පරිච්ඡේද';

  @override
  String get audiobookBookmarks => 'පිටු සලකුණු';

  @override
  String get audiobookNotes => 'සටහන්';

  @override
  String get audiobookQueue => 'පෝලිම';

  @override
  String get audiobookTimeline => 'කාල රේඛාව';

  @override
  String get audiobookTimelineEmpty => 'කාල රේඛාව හිස්ය';

  @override
  String get audiobookWholeBook => 'සම්පූර්ණ පොත';

  @override
  String get audiobookFocusedTimeline => 'නාභිගත කාල රේඛාව';

  @override
  String get audiobookExportBookmarks => 'පිටු සලකුණු නිර්යාත කරන්න';

  @override
  String get audiobookExportNotes => 'සටහන් නිර්යාත කරන්න';

  @override
  String get audiobookExportAll => 'සියල්ල නිර්යාත කරන්න';

  @override
  String audiobookExportSuccess(String path) {
    return '$path වෙත නිර්යාත කරන ලදී';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'නිර්යාත කිරීම අසාර්ථක විය: $error';
  }

  @override
  String get audiobookLyrics => 'ගී පද';

  @override
  String get audiobookAddBookmark => 'පිටු සලකුණක් එක් කරන්න';

  @override
  String get audiobookAddNote => 'සටහනක් එක් කරන්න';

  @override
  String get audiobookEditNote => 'සටහන සංස්කරණය කරන්න';

  @override
  String get audiobookNoteHint => 'මෙම මොහොත සඳහා සටහනක් ලියන්න';

  @override
  String get audiobookSleepTimer => 'නින්ද ටයිමරය';

  @override
  String get audiobookSleepOff => 'අක්‍රියයි';

  @override
  String get audiobookSleepEndOfChapter => 'පරිච්ඡේදය අවසානය';

  @override
  String get audiobookSleepCustom => 'අභිරුචි';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining ඉතිරියි';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'මිනි. $count',
      one: 'මිනි. 1',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'වාදන වේගය';

  @override
  String get audiobookRemainingTime => 'ඉතිරි';

  @override
  String get audiobookElapsedTime => 'ගත වූ';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'තත් $seconds ආපසු';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'තත් $seconds ඉදිරියට';
  }

  @override
  String get audiobookPreviousChapter => 'පෙර පරිච්ඡේදය';

  @override
  String get audiobookNextChapter => 'ඊළඟ පරිච්ඡේදය';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'පරිච්ඡේද $totalන් $current';
  }

  @override
  String get audiobookNoChapters => 'පරිච්ඡේද නැත';

  @override
  String get audiobookNoBookmarks => 'තවම පිටු සලකුණු නැත';

  @override
  String get audiobookNoNotes => 'තවම සටහන් නැත';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position හි පිටු සලකුණක් එක් කරන ලදී';
  }

  @override
  String get audiobookSpeedReset => '1.0x වෙත යළි පිහිටුවන්න';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'සුරකින්න';

  @override
  String get audiobookCancel => 'අවලංගු කරන්න';

  @override
  String get audiobookDelete => 'මකන්න';

  @override
  String get subtitlePreferences => 'උපසිරැසි මනාප';

  @override
  String get subtitlePreferencesDescription =>
      'උපසිරැසි ප්‍රකාර, පෙරනිමි භාෂා, පෙනුම සහ විදැහුම්කරණ විකල්ප වෙනස් කරන්න.';

  @override
  String get subtitleRendering => 'උපසිරැසි විදැහුම්කරණය';

  @override
  String get displayOptions => 'සංදර්ශන විකල්ප';

  @override
  String get releaseDateAscending => 'නිකුත් වූ දිනය (ආරෝහණ)';

  @override
  String get releaseDateDescending => 'නිකුත් වූ දිනය (අවරෝහණ)';

  @override
  String get groupContributions => 'දායකත්ව කාණ්ඩගත කරන්න';

  @override
  String get groupMultipleRoles => 'බහු භූමිකා කාණ්ඩගත කරන්න';

  @override
  String get libraryWriteAccessWarningTitle =>
      'පුස්තකාල ලිවීමේ ප්‍රවේශ අනතුරු ඇඟවීම';

  @override
  String get libraryWriteAccessHowToFix => 'මෙය නිවැරදි කරන ආකාරය:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. සේවාදායකයේ ඔබේ මාධ්‍ය පුස්තකාල ෆෝල්ඩර සඳහා Jellyfin සේවා පරිශීලකයාට (උදා. jellyfin හෝ Docker PUID/PGID) ලිවීමේ අවසර ලබා දෙන්න.\n\n2. නැතහොත්, ඔබේ Jellyfin උපකරණ පුවරුව -> පුස්තකාල වෙත ගොස්, මෙම පුස්තකාලය සංස්කරණය කර, කලා නිර්මාණ Jellyfin හි අභ්‍යන්තර දත්ත සමුදායේ ගබඩා කිරීමට \'Save artwork into media folders\' අබල කරන්න.';

  @override
  String get dismiss => 'නොසලකන්න';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'ඔබේ \'$libraryName\' පුස්තකාලය කලා නිර්මාණ කෙලින්ම මාධ්‍ය ෆෝල්ඩරවලට සුරැකීමට වින්‍යාස කර ඇත (\'Save artwork into media folders\' සබලයි). කෙසේ වෙතත්, Jellyfin ලිවීමේ ප්‍රවේශය පරීක්ෂා කර ඇති අතර මෙම නාමාවලියට ගොනු ලිවීමට අවසරයක් නැත:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin කලා නිර්මාණය යාවත්කාලීන කිරීමට අසමත් වූ බව පෙනේ. ඔබේ පුස්තකාලය කලා නිර්මාණ කෙලින්ම මාධ්‍ය ෆෝල්ඩරවලට සුරැකීමට වින්‍යාස කර ඇත (\'Save artwork into media folders\' සබලයි). Jellyfin සේවාදායක ක්‍රියාවලියට ඔබේ මාධ්‍ය නාමාවලිවලට ගොනු ලිවීමට අවසරයක් නොමැති විට මෙම දෝෂය සාමාන්‍යයෙන් ඇතිවේ.';

  @override
  String get externalLists => 'බාහිර ලැයිස්තු';

  @override
  String get replay => 'නැවත වාදනය';

  @override
  String get fileInformation => 'ගොනු තොරතුරු';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'ප්‍රමාණය: $size  •  ආකෘතිය: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'සියලු ($count) ශ්‍රව්‍ය පථ පෙන්වන්න';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'සියලු ($count) උපසිරැසි පථ පෙන්වන්න';
  }

  @override
  String get checkingDirectPlay => 'සෘජු වාදන හැකියාව පරීක්ෂා කරමින්...';

  @override
  String get directPlayCapabilityLabel => 'සෘජු වාදන හැකියාව: ';

  @override
  String get forced => 'බලාත්මක';

  @override
  String get transcodeContainerNotSupported =>
      'බහාලුම් ආකෘතියට ධාවකය සහාය නොදක්වයි.';

  @override
  String get transcodeVideoCodecNotSupported => 'වීඩියෝ කෝඩෙක් සහාය නොදක්වයි.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'ශ්‍රව්‍ය කෝඩෙක් සහාය නොදක්වයි.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'උපසිරැසි ආකෘතියට සහාය නොදක්වයි (දැවීම අවශ්‍යයි).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'ශ්‍රව්‍ය පැතිකඩට සහාය නොදක්වයි.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'වීඩියෝ පැතිකඩට සහාය නොදක්වයි.';

  @override
  String get transcodeVideoLevelNotSupported => 'වීඩියෝ මට්ටමට සහාය නොදක්වයි.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'මෙම උපාංගය වීඩියෝ විභේදනයට සහාය නොදක්වයි.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'වීඩියෝ බිට් ගැඹුරට සහාය නොදක්වයි.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'වීඩියෝ රාමු අනුපාතයට සහාය නොදක්වයි.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'ගොනු බිට්රේට් ධාවක ප්‍රවාහ සීමාව ඉක්මවයි.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'වීඩියෝ බිට්රේට් ප්‍රවාහ සීමාව ඉක්මවයි.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'ශ්‍රව්‍ය බිට්රේට් ප්‍රවාහ සීමාව ඉක්මවයි.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'ශ්‍රව්‍ය නාලිකා ගණනට සහාය නොදක්වයි.';

  @override
  String get sortAlphabetical => 'අකාරාදී';

  @override
  String get sortReleaseAscending => 'නිකුත් වූ පිළිවෙළ (ආරෝහණ)';

  @override
  String get sortReleaseDescending => 'නිකුත් වූ පිළිවෙළ (අවරෝහණ)';

  @override
  String get sortCustomDragDrop => 'අභිරුචි (ඇදගෙන-දමන්න)';

  @override
  String get playlistSortOptions => 'ධාවන ලැයිස්තු වර්ග කිරීමේ විකල්ප';

  @override
  String get resetSort => 'වර්ග කිරීම යළි පිහිටුවන්න';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode නැවත නරඹන්න';
  }

  @override
  String get rewatchPlaylist => 'ධාවන ලැයිස්තුව නැවත නරඹන්න';

  @override
  String get noSubtitlesFound => 'උපසිරැසි හමු නොවීය.';

  @override
  String get adminControls => 'පරිපාලක පාලන';

  @override
  String get impellerRendering => 'විදැහුම්කරණ එන්ජිම (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller යනු සුමට සජීවීකරණ සහ අඩු ගැහීම් සඳහා Flutter හි නවීන GPU විදැහුම්කරුයි. සමහර TV පෙට්ටි සහ පැරණි GPU වල එය දෝෂ හෝ කළු වීඩියෝ ඇති කළ හැක; ඒවා දුටුවහොත් එය ක්‍රියාවිරහිත කරන්න. ස්වයංක්‍රීය මඟින් ඔබේ උපාංගයට හොඳම පෙරනිමිය තෝරයි. යෙදීමට Moonfin නැවත අරඹන්න.';

  @override
  String get impellerAuto => 'ස්වයංක්‍රීය';

  @override
  String get impellerOn => 'සක්‍රියයි';

  @override
  String get impellerOff => 'අක්‍රියයි';

  @override
  String get impellerRestartTitle => 'නැවත ඇරඹීම අවශ්‍යයි';

  @override
  String get impellerRestartMessage =>
      'විදැහුම්කරණ එන්ජිම වෙනස් කිරීමට Moonfin නැවත ඇරඹිය යුතුය. දැන් යෙදුම වසා, යෙදීමට එය නැවත විවෘත කරන්න.';

  @override
  String get impellerCloseNow => 'දැන් යෙදුම වසන්න';

  @override
  String get adminRefreshLibrary => 'පුස්තකාලය නැවුම් කරන්න';

  @override
  String get adminRefreshAllLibraries => 'සියලු පුස්තකාල නැවුම් කරන්න';

  @override
  String get adminRepoSortDateOldest => 'එක් කළ දිනය (පැරණිතම පළමුව)';

  @override
  String get adminRepoSortDateNewest => 'එක් කළ දිනය (නවතම පළමුව)';

  @override
  String get adminRepoSortNameAsc => 'අකාරාදී (A සිට Z)';

  @override
  String get adminRepoSortNameDesc => 'අකාරාදී (Z සිට A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'සේවාදායක විශ්ලේෂණ පූරණය වෙමින්... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'මූලාශ්‍රයට ගැළපෙන';

  @override
  String get imdbTop250Movies => 'IMDb හොඳම චිත්‍රපට 250';

  @override
  String get imdbTop250TvShows => 'IMDb හොඳම රූපවාහිනී වැඩසටහන් 250';

  @override
  String get imdbMostPopularMovies => 'IMDb වඩාත් ජනප්‍රිය චිත්‍රපට';

  @override
  String get imdbMostPopularTvShows => 'IMDb වඩාත් ජනප්‍රිය රූපවාහිනී වැඩසටහන්';

  @override
  String get imdbLowestRatedMovies => 'IMDb අඩුම ශ්‍රේණිගත චිත්‍රපට';

  @override
  String get imdbTopEnglishMovies => 'IMDb හොඳම ශ්‍රේණිගත ඉංග්‍රීසි චිත්‍රපට';
}
