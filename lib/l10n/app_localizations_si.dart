// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appTitle => 'මූන්ෆින්';

  @override
  String get accountPreferences => 'ACCOUNT PREFERENCES';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'පුරන්න';

  @override
  String get empty => 'Empty';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'ඉක්මන් සම්බන්ධතාවය';

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
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'කවුද බලන්නේ?';

  @override
  String get addUser => 'පරිශීලක එකතු කරන්න';

  @override
  String get selectServer => 'සේවාදායකය තෝරන්න';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
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
  String get settingsAppearanceThemeSubtitle =>
      'යෙදුම නැවත ආරම්භ නොකර Moonfin සහ Neon Pulse අතර මාරු වන්න';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'මූන්ෆින්';

  @override
  String get themeMoonfinSubtitle =>
      'වත්මන් Moonfin පෙනුම ඔබ සියලු දෙනාටම ආදරය කර ඇත';

  @override
  String get themeNeonPulse => 'නියොන් ස්පන්දනය';

  @override
  String get themeNeonPulseSubtitle =>
      'මැජෙන්ටා දිලිසීම, සයන් පෙළ සහ ශක්තිමත් ක්‍රෝම් ප්‍රතිවිරෝධය සහිත සින්ත්වේව් මෝස්තරය';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin වෙතින් පිටවන්නද?';

  @override
  String get exitAppConfirmation => 'ඔබට පිටවීමට අවශ්‍ය බව විශ්වාසද?';

  @override
  String get exit => 'පිටවෙන්න';

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
  String get series => 'මාලාව';

  @override
  String get noItemsFound => 'අයිතම කිසිවක් හමු නොවීය';

  @override
  String get home => 'නිවස';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'මෙම ෆෝල්ඩරය හිස් ය';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
    return '$name — Genres';
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
  String get discoverySubjects => 'සොයාගැනීම් විෂයයන්';

  @override
  String get pickDiscoverySubjects =>
      'Discover හි පෙන්විය යුතු විෂය සංග්‍රහ තෝරන්න.';

  @override
  String get apply => 'අයදුම් කරන්න';

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
    return '$count titles';
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
  String get resume => 'අරඹන්න';

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
  String get readyWhenYouAre => 'ඔබ සිටින විට සූදානම්';

  @override
  String get details => 'විස්තර';

  @override
  String get listeningRoom => 'සවන්දීමේ කාමරය';

  @override
  String get bookmarksAndProgress => 'පිටු සලකුණු සහ ප්‍රගතිය';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
    return 'No $label found';
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
  String get watched => 'නැරඹුවා';

  @override
  String get unread => 'නොකියවූ';

  @override
  String get unwatched => 'නැරඹුවේ නැත';

  @override
  String get seriesStatus => 'මාලාවේ තත්ත්වය';

  @override
  String get allLibraries => 'සියලුම පුස්තකාල';

  @override
  String get books => 'පොත්';

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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'මෙම විෂය දැන් පූරණය කළ නොහැක.';

  @override
  String get audiobookDetails => 'Audiobook විස්තර';

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
  String get trackList => 'ධාවන ලැයිස්තුව';

  @override
  String get itemListPlaceholder => 'අයිතම ලැයිස්තුව මෙහි දිස්වනු ඇත';

  @override
  String get favoriteTracksPlaceholder => 'ප්‍රියතම ගීත මෙහි දිස් වනු ඇත';

  @override
  String get failedToLoad => 'පූරණය කිරීමට අසමත් විය';

  @override
  String get delete => 'මකන්න';

  @override
  String get save => 'සුරකින්න';

  @override
  String get moreLikeThis => 'තවත් මේ වගේ';

  @override
  String get castAndCrew => 'Cast & Crew';

  @override
  String get collection => 'එකතුව';

  @override
  String get episodes => 'කථාංග';

  @override
  String get nextUp => 'ඊළඟට';

  @override
  String get seasons => 'ඍතු';

  @override
  String get chapters => 'පරිච්ඡේද';

  @override
  String get features => 'විශේෂාංග';

  @override
  String get movies => 'චිත්රපට';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'ප්‍රකාශන දිනය නොදනී';

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
  String get view => 'බලන්න';

  @override
  String get resumeReading => 'කියවීම නැවත ආරම්භ කරන්න';

  @override
  String get read => 'කියවන්න';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'සෙල්ලම් කරන්න';

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
  String get cast => 'කස්ටිය';

  @override
  String get trailer => 'ට්රේලරය';

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
  String get renamePlaylist => 'ධාවන ලැයිස්තුව නැවත නම් කරන්න';

  @override
  String get playlistName => 'ධාවන ලැයිස්තුවේ නම';

  @override
  String get deleteDownloadedAlbum => 'බාගත කළ ඇල්බමය මකන්න';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'අයිතමය මකා ඇත';

  @override
  String get noPlayableTrailerFound => 'වාදනය කළ හැකි ට්‍රේලරයක් හමු නොවිණි.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'උපසිරැසි බාගත කර ඇත. Jellyfin අයිතමය නැවුම් කරන අතරතුර දිස් වීමට මොහොතක් ගත විය හැක.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'අනුවාදය තෝරන්න';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'බාගත කළ ගොනු මකන්න';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'ලේඛකයින්';

  @override
  String get studio => 'ස්ටුඩියෝව';

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
  String get showLess => 'අඩුවෙන් පෙන්වන්න';

  @override
  String get readMore => 'තවත් කියවන්න';

  @override
  String get shuffle => 'කලවම් කරන්න';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
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
  String get deviceVolume => 'උපාංග පරිමාව';

  @override
  String get unavailable => 'ලබා ගත නොහැක';

  @override
  String get pause => 'නවත්වන්න';

  @override
  String get syncPosition => 'සමමුහුර්ත ස්ථානය';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'පෝලිම හිස්';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'අගුලු හැරීමට දිගු ඔබන්න';

  @override
  String get off => 'අක්රියයි';

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
  String get reset => 'යළි පිහිටුවන්න';

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
  String get player => 'ක්රීඩකයා';

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
  String get track => 'ලුහුබැඳීම';

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
  String get embedded => 'Embedded';

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
      'යෙදුම තුළ EPUB විදැහුම්කරණය තවමත් මෙම වේදිකාවේ නොමැත.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'කාවැද්දූ ලේඛන විදැහුම්කරණය මෙම වේදිකාවේ නොමැත.';

  @override
  String get couldNotOpenExternalViewer => 'බාහිර බලන්නා විවෘත කළ නොහැකි විය.';

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
      'තවමත් පිටු සලකුණු නොමැත.\nඔබේ ස්ථානය සුරැකීමට කියවීමේදී පිටුසන් නිරූපකය තට්ටු කරන්න.';

  @override
  String get noTableOfContentsAvailable => 'පටුන නොමැත';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'තනතුර';

  @override
  String get bookReader => 'පොත් කියවන්නා';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'නාලිකා හමු නොවීය';

  @override
  String get liveBadge => 'සජීවී';

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
  String get watch => 'නරඹන්න';

  @override
  String get close => 'වසන්න';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'සීර්';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'ඇල්බමය';

  @override
  String get playAlbum => 'ඇල්බමය වාදනය කරන්න';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'මාලාවක් හමු නොවීය';

  @override
  String get errorLoadingSeries => 'මාලාවක් පූරණය කිරීමේ දෝෂයකි';

  @override
  String get downloadedEpisodes => 'බාගත් කථාංග';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'සංගීතය සහ ශ්‍රව්‍ය පොත්';

  @override
  String get images => 'රූප';

  @override
  String get database => 'දත්ත සමුදාය';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'මුල් පේළිවල තේමා සංගීතය';

  @override
  String get playWhenBrowsingHomeScreen =>
      'මුල් තිරය බ්‍රවුස් කරන විට සෙල්ලම් කරන්න';

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
  String get fit => 'සුදුසුයි';

  @override
  String get autoCrop => 'ස්වයංක්‍රීය බෝග';

  @override
  String get stretch => 'දිගු කරන්න';

  @override
  String get refreshRateSwitching => 'Refresh Rate Switching';

  @override
  String get disabled => 'ආබාධිතයි';

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
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'TrueHD සහාය';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS ශ්‍රව්‍ය AVR වෙත පමණි; ග්‍රාහක සහාය සහ DTS මූලාශ්‍ර ධාවන පථය අවශ්‍ය වේ';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ශ්‍රව්‍ය සක්‍රීය කරන්න (සියලු වේදිකාවල ක්‍රියා නොකරනු ඇත)';

  @override
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeDescription =>
      'Choose how audio is decoded. AVR Passthrough sends raw Dolby/DTS streams to your receiver; Auto or Downmix decodes locally.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

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
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'මාධ්‍ය පෝලිමේ';

  @override
  String get autoQueueNextEpisodes => 'මීළඟ කථාංග ස්වයංක්‍රීය පෝලිමේ';

  @override
  String get stillWatchingPrompt => 'තවමත් Prompt නරඹමින්';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Resume & Skip';

  @override
  String get resumeRewind => 'Resume Rewind';

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
  String get skipBackLength => 'Skip Back Length';

  @override
  String get skipForwardLength => 'Skip Forward Length';

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
  String get subtitlePreviewText =>
      'ඉක්මන් දුඹුරු නරියා කම්මැලි බල්ලා උඩින් පනිනවා';

  @override
  String get verticalOffset => 'සිරස් ඕෆ්සෙට්';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles => 'සෘජු වාදනය PGS උපසිරැසි';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

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
  String get showSeerrButton => 'Show Seerr Button';

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
    return '$count selected';
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
  String get mediaBarModeMoonfin => 'මූන්ෆින්';

  @override
  String get mediaBarModeMakd => 'මැක්ඩී';

  @override
  String get mediaBarModeOff => 'අක්රියයි';

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
  String get fullScreenRows => 'Expanded Home Rows';

  @override
  String get fullScreenRowsDescription => 'Limit home rows to 1 row per screen';

  @override
  String get perRowImageType => 'පේළි රූප වර්ගය අනුව';

  @override
  String get perRowSettings => 'පේළියකට සැකසීම්';

  @override
  String get autoLogin => 'ස්වයංක්‍රීය පිවිසුම';

  @override
  String get lastUser => 'අවසාන පරිශීලකයා';

  @override
  String get currentUser => 'Current User';

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
  String get mode => 'මාදිලිය';

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
    return '$minutes min';
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
  String get clockModeStatic => 'Static';

  @override
  String get clockModeBouncing => 'Bouncing';

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
  String get trakt => 'ට්රැක්ට්';

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
  String get pluginLabel => 'ප්ලගිනය';

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
    return '$status\nVersion: $version';
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
  String get seerrDiscoveryRows => 'Seerr Discovery Rows';

  @override
  String get resetRowsToDefaults => 'පේළි පෙරනිමියට නැවත සකසන්න';

  @override
  String get enableSeerr => 'Seerr සබල කරන්න';

  @override
  String get showSeerrInNavigation =>
      'Serr සංචලනය තුළ පෙන්වන්න (සේවාදායක ප්ලගිනය අවශ්‍යයි)';

  @override
  String get seerrUnavailable =>
      'සේවාදායක ප්ලගිනය Seerr සහාය අක්‍රිය කර ඇති නිසා ලබා ගත නොහැක.';

  @override
  String get nsfwFilter => 'NSFW පෙරහන';

  @override
  String get hideAdultContent => 'ප්‍රතිඵලවල වැඩිහිටි අන්තර්ගතය සඟවන්න';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'පේළි සොයා ගන්න';

  @override
  String get discoverRowsDescriptionPlugin =>
      'නැවත ඇණවුම් කිරීමට අදින්න. පේළි සක්රිය හෝ අක්රිය කරන්න. සබල කළ පේළි ඇණවුම Moonfin ප්ලගිනය සමඟ සමමුහුර්ත කරයි.';

  @override
  String get discoverRowsDescription =>
      'නැවත ඇණවුම් කිරීමට අදින්න. පේළි සක්රිය හෝ අක්රිය කරන්න.';

  @override
  String get enabled => 'සබල කර ඇත';

  @override
  String get hidden => 'සැඟවී ඇත';

  @override
  String get aboutTitle => 'ගැන';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'විවෘත මූලාශ්ර බලපත්ර';

  @override
  String get sourceCode => 'මූලාශ්ර කේතය';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'දැනුම්දීම් යාවත්කාලීන කරන්න';

  @override
  String get showWhenUpdatesAvailable => 'යාවත්කාලීන ලබා ගත හැකි විට පෙන්වන්න';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get clear => 'පැහැදිලියි';

  @override
  String get browse => 'බ්‍රවුස් කරන්න';

  @override
  String get noResults => 'ප්‍රතිඵල නැත';

  @override
  String get seerrAvailableStatus => 'ලබා ගත හැක';

  @override
  String get seerrRequestedStatus => 'ඉල්ලා ඇත';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'සීරර් සැකසුම්';

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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
  String get appearances => 'පෙනුම';

  @override
  String get crewSection => 'කාර්ය මණ්ඩලය';

  @override
  String ageValue(int age) {
    return 'age $age';
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
  String get seasonsLabel => 'ඍතු';

  @override
  String get episodesLabel => 'කථාංග';

  @override
  String get access => 'ප්රවේශය';

  @override
  String get add => 'එකතු කරන්න';

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
  String get done => 'කළා';

  @override
  String get edit => 'සංස්කරණය කරන්න';

  @override
  String get encoding => 'කේතනය කිරීම';

  @override
  String get error => 'දෝෂයකි';

  @override
  String get forward => 'ඉදිරියට';

  @override
  String get general => 'ජෙනරාල්';

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
  String get remote => 'දුරස්ථ';

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
  String get trickplay => 'කපටි ක්‍රීඩාව';

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
  String get adminDrawerTranscoding => 'ට්‍රාන්ස්කෝඩිං';

  @override
  String get adminDrawerResume => 'අරඹන්න';

  @override
  String get adminDrawerStreaming => 'ප්‍රවාහය';

  @override
  String get adminDrawerTrickplay => 'කපටි ක්‍රීඩාව';

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
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get volume => 'පරිමාව';

  @override
  String get actions => 'ක්රියාවන්';

  @override
  String get videoCodec => 'වීඩියෝ කෝඩෙක්';

  @override
  String get audioCodec => 'ශ්රව්ය කෝඩෙක්';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'සම්පූර්ණ කිරීම';

  @override
  String get direct => 'සෘජු';

  @override
  String get adminDisconnect => 'විසන්ධි කරන්න';

  @override
  String get adminClearDates => 'පැහැදිලි දිනයන්';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'උපාංගය මකන්න';

  @override
  String get adminDeviceDeleted => 'උපාංගය මකා ඇත';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'පුස්තකාලය නැවත නම් කරන්න';

  @override
  String get adminNewName => 'අලුත් නම';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'පුස්තකාලය මකන්න';

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
  String get adminRemovePath => 'මාර්ගය ඉවත් කරන්න';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'පුස්තකාල විකල්ප සුරකින ලදී';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'පුස්තකාලයේ නම අවශ්‍යයි';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'පරිශීලකයන් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminSearchUsers => 'පරිශීලකයන් සොයන්න';

  @override
  String get adminEditUser => 'පරිශීලක සංස්කරණය කරන්න';

  @override
  String get adminAddUser => 'පරිශීලක එකතු කරන්න';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'අවසර සුරකින ලදී';

  @override
  String get adminPasswordsMismatch => 'මුරපද නොගැලපේ';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get adminResetPasswordWarning =>
      'මෙය මුරපදය ඉවත් කරනු ඇත. මුරපදයක් නොමැතිව පරිශීලකයාට ලොග් වීමට හැකි වනු ඇත.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'සේවාදායක ප්‍රතිචාරයෙන් යතුරු ටෝකනය අතුරුදහන්';

  @override
  String get adminRevokeApiKey => 'API යතුර අවලංගු කරන්න';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API යතුර අවලංගු කරන ලදී';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'උපස්ථයක් නිර්මාණය කරමින්...';

  @override
  String get adminBackupCreated => 'උපස්ථය සාර්ථකව සාදන ලදී';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'සේවාදායක ප්‍රතිචාරයේ උපස්ථ මාර්ගය අතුරුදහන්';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'ප්‍රතිසාධනය තහවුරු කරන්න';

  @override
  String get adminRestoringBackup => 'උපස්ථය ප්‍රතිසාධනය කරමින්...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'ලොග් එකේ සොයන්න';

  @override
  String get adminNoMatchingLines => 'ගැළපෙන රේඛා නැත';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'කාලසටහන්ගත කාර්ය කිසිවක් හමු නොවීය';

  @override
  String get adminNoTasksMatchFilter => 'වත්මන් පෙරහනට කිසිදු කාර්යයක් නොගැලපේ';

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
  String get adminRunNow => 'දැන් ධාවනය කරන්න';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'සතියේ දිනය';

  @override
  String get adminSearchPlugins => 'ප්ලගින සොයන්න...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'ප්ලගිනය අස්ථාපනය කරන්න';

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
      'ඔබගේ සෙවුමට ගැලපෙන ප්ලගීන කිසිවක් නැත';

  @override
  String get adminNoPluginsInstalled => 'ප්ලගීන ස්ථාපනය කර නැත';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
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
      'සැකසීම් විවෘත කළ නොහැක: සත්‍යාපන ටෝකනය අතුරුදහන්.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'ප්ලගිනය හමු නොවීය';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'උදා. Jellyfin ස්ථාවර';

  @override
  String get adminRepositoryUrl => 'ගබඩා URL';

  @override
  String get adminAddEntry => 'ඇතුළත් කිරීම එකතු කරන්න';

  @override
  String get adminInvalidUrl => 'වලංගු නොවන URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminThrottleBuffering => 'Throttle buffering';

  @override
  String get adminTrickplaySaved => 'ට්‍රික්ප්ලේ සැකසීම් සුරකින ලදී';

  @override
  String get adminTrickplayLoadFailed =>
      'උපක්‍රම සැකසීම් පූරණය කිරීමට අසමත් විය';

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
  String get adminBaseUrlHint => 'උදා. / ජෙලිෆින්';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'දුරස්ථ පුද්ගලයා සොයන්න';

  @override
  String get adminNoRemoteMatches => 'දුරස්ථ ගැළපීමක් හමු නොවීය';

  @override
  String get adminRemoteResults => 'දුරස්ථ ප්රතිඵල';

  @override
  String get adminRemoteMetadataApplied => 'දුරස්ථ පාරදත්ත යොදන ලදී';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'අන්තර්ගත වර්ගය යාවත්කාලීන කරන්න';

  @override
  String get adminContentType => 'අන්තර්ගත වර්ගය';

  @override
  String get adminContentTypeUpdated => 'අන්තර්ගත වර්ගය යාවත්කාලීන කරන ලදී';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'සහාය නොදක්වන රූප ආකෘතිය';

  @override
  String get adminImageReadFailed => 'තෝරාගත් රූපය කියවීමට අසමත් විය';

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
  String get adminAllProviders => 'සියලුම සපයන්නන්';

  @override
  String get adminNoRemoteImages => 'දුරස්ථ පින්තූර හමු නොවිණි';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'සුසරකය එක් කරන්න';

  @override
  String get adminTunerType => 'සුසරක වර්ගය';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, වෙනත්';

  @override
  String get adminUrlPath => 'URL / මාර්ගය';

  @override
  String get adminNameOptional => 'නම (විකල්ප)';

  @override
  String get adminTunerAdded => 'සුසරකය එකතු කරන ලදී';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'මාර්ගෝපදේශ සපයන්නා එක් කරන්න';

  @override
  String get adminProviderType => 'සැපයුම්කරු වර්ගය';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect හෝ XMLTV';

  @override
  String get adminUsernameOptional => 'පරිශීලක නාමය (විකල්ප)';

  @override
  String get adminRefreshInterval => 'නැවුම් කාල පරතරය (පැය)';

  @override
  String get adminProviderAdded => 'සපයන්නා එකතු කරන ලදී';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'සුසරකය යළි පිහිටුවීම ඉල්ලා ඇත';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved => 'පටිගත කිරීමේ සැකසුම් සුරකින ලදී';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'සපයන්නා එක් කරන්න';

  @override
  String get adminNoListingProviders =>
      'ලැයිස්තුගත කිරීමේ සපයන්නන් වින්‍යාස කර නැත';

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
    return 'Restore backup $name now?';
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
  String get adminApply => 'අයදුම් කරන්න';

  @override
  String get adminNotSet => 'සකසා නැත';

  @override
  String get adminReset => 'යළි පිහිටුවන්න';

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
  String get adminLogViewerNoMatches => 'ගැළපෙන රේඛා නැත';

  @override
  String get adminMetadataEditorTitle => 'පාරදත්ත සංස්කාරකය';

  @override
  String get adminMetadataRemote => 'දුරස්ථ';

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
  String get adminMetadataImageReadFailed => 'තෝරාගත් රූපය කියවීමට අසමත් විය';

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
      'මෙය අයිතමයෙන් වත්මන් රූපය ඉවත් කරයි.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ඔබගේ සෙවුමට ගැලපෙන පැකේජ නොමැත';

  @override
  String get adminPluginsCatalogEmpty => 'පැකේජ නොමැත';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ගබඩාව ඉවත් කරන්න';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'ඉවත් කරන්න';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminPlaybackHwAccel => 'දෘඪාංග ත්වරණය';

  @override
  String get adminPlaybackHwAccelLabel => 'දෘඪාංග ත්වරණය';

  @override
  String get adminPlaybackEnableHwEncoding => 'දෘඪාංග කේතනය සක්රිය කරන්න';

  @override
  String get adminPlaybackEnableHwDecoding => 'දෘඪාංග විකේතනය සක්රිය කරන්න:';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminActivityNow => 'දැන්';

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
      'පෙරදසුන් සිඟිති රූ සෙවීම සඳහා උපක්‍රමශීලී රූප උත්පාදනය වින්‍යාස කරන්න.';

  @override
  String get adminNetworkingPublicHttpsPort => 'පොදු HTTPS වරාය';

  @override
  String get adminNetworkingBaseUrl => 'මූලික URL';

  @override
  String get adminNetworkingBaseUrlHint => 'උදා. / ජෙලිෆින්';

  @override
  String get adminNetworkingHttps => 'HTTPS';

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
  String get adminPlaybackThrottleBuffering => 'Throttle buffering';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'මන්දගාමී ප්‍රතිචාර සීමාව (මිලි)';

  @override
  String get adminGeneralCachePath => 'හැඹිලි මාර්ගය';

  @override
  String get adminGeneralMetadataPath => 'පාරදත්ත මාර්ගය';

  @override
  String get adminGeneralServerName => 'සේවාදායකයේ නම';

  @override
  String get adminSettingsLoadFailed => 'සැකසීම් පූරණය කිරීමට අසමත් විය';

  @override
  String get adminDiscover => 'සොයා ගන්න';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay ප්‍රවේශය ප්‍රතික්ෂේප විය';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ඔබට මෙම SyncPlay සමූහයේ ඇති අයිතම එකකට හෝ වැඩි ගණනකට ප්‍රවේශය නොමැත. පුස්තකාල අවසර සත්‍යාපනය කිරීමට හෝ වෙනත් පෝලිමක් තෝරා ගැනීමට කණ්ඩායම් හිමිකරුගෙන් ඉල්ලා සිටින්න.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
  String get homeScreenSectionsIntegrationDescription =>
      'IAmParadox27 හි \"Home Screen Sections\" ප්ලගිනය මගින් නිරාවරණය වන පේළි හඳුනා ගන්න. පේළි සක්‍රීය කර පහතින් නැවත ඇණවුම් කළ හැක.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Jellyfin සේවාදායකයන් තවමත් ප්ලගිනය වාර්තා නොකරයි.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Ranaldsgift හි \"KefinTweaks\" ප්ලගිනය හරහා වින්‍යාස කර ඇති පේළි හඳුනා ගන්න. අභිරුචි කොටස්, මෑතකදී නිකුත් කරන ලද, නැවත නරඹන්න, සෘතුමය සහ මෑතකදී එකතු කරන ලද පුස්තකාලයේ එක් එක් Jellyfin සේවාදායකයේ KefinTweaks වින්‍යාසයෙන් පිළිබිඹු වේ.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'KefinTweaks තවමත් Jellyfin සේවාදායකයක් වාර්තා නොකරයි.';

  @override
  String get integrationOpenHomeSections => 'මුල් පිටුව කොටස් විවෘත කරන්න';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'පේළි සබල කරන්න, අබල කරන්න, සහ නැවත ඇණවුම් කරන්න';

  @override
  String get integrationInstalledButDisabled =>
      'ස්ථාපනය කර ඇති නමුත් අබල කර ඇත';

  @override
  String get integrationNotInstalled => 'ස්ථාපනය කර නැත';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'දුරස්ථ නැවත ධාවනය';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'උපාංග පරිමාව';

  @override
  String get castVolumeUnavailable => 'ලබා ගත නොහැක';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'වැරදි PIN අංකය';

  @override
  String get pinMismatch => 'PIN නොගැලපේ';

  @override
  String get pinForgot => 'PIN අමතකද?';

  @override
  String get pinClear => 'පැහැදිලියි';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'ඉක්මන් සම්බන්ධතා ඉල්ලීම අනුමත කර ඇත.';

  @override
  String get quickConnectInvalidOrExpired =>
      'ඉක්මන් සම්බන්ධතා කේතය අවලංගු හෝ කල් ඉකුත් වී ඇත.';

  @override
  String get quickConnectNotSupported =>
      'මෙම සේවාදායකයේ Quick Connect සඳහා සහය නොදක්වයි.';

  @override
  String get quickConnectAuthorizeFailed =>
      'ඉක්මන් සම්බන්ධතා කේතය අනුමත කිරීමට අසමත් විය.';

  @override
  String get quickConnectDisabled => 'මෙම සේවාදායකයේ Quick Connect අබල කර ඇත.';

  @override
  String get quickConnectForbidden =>
      'ඔබගේ ගිණුමට මෙම ඉක්මන් සම්බන්ධතා ඉල්ලීමට අවසර දිය නොහැක.';

  @override
  String get quickConnectNotFound =>
      'ඉක්මන් සම්බන්ධතා කේතය හමු නොවීය. නව කේතයක් උත්සාහ කරන්න.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'කේතය ඇතුලත් කරන්න';

  @override
  String get quickConnectAuthorize => 'අවසර දෙන්න';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'සජීවී රූපවාහිනිය';

  @override
  String get continueWatchingAndNextUp => 'නැරඹීම දිගටම කරගෙන යන්න සහ ඊළඟට';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get settingsPrivacyAndSafetySection => 'පෞද්ගලිකත්වය සහ ආරක්ෂාව';

  @override
  String get settingsBlockedRatings => 'අවහිර කළ ශ්‍රේණිගත කිරීම්';

  @override
  String get settingsGeneralStyle => 'සාමාන්ය ශෛලිය';

  @override
  String get settingsGeneralStyleSubtitle =>
      'තේමා උච්චාරණ, පසුබිම්, නැරඹූ දර්ශක සහ තේමා සංගීතය';

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
      'Show the Seerr button in the navigation bar';

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
      'Donate a coffee to the developer';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (උරුමය)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
