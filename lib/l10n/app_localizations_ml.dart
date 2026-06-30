// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'മൂൺഫിൻ';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'സൈൻ ഇൻ';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'ദ്രുത കണക്ഷൻ';

  @override
  String get password => 'രഹസ്യവാക്ക്';

  @override
  String get username => 'ഉപയോക്തൃനാമം';

  @override
  String get email => 'ഇമെയിൽ';

  @override
  String get quickConnectInstruction =>
      'നിങ്ങളുടെ സെർവറിൻ്റെ വെബ് ഡാഷ്‌ബോർഡിൽ ഈ കോഡ് നൽകുക:';

  @override
  String get waitingForAuthorization => 'അംഗീകാരത്തിനായി കാത്തിരിക്കുന്നു...';

  @override
  String get back => 'തിരികെ';

  @override
  String get serverUnavailable => 'സെർവർ ലഭ്യമല്ല';

  @override
  String get loginFailed => 'ലോഗിൻ ചെയ്യുന്നത് പരാജയപ്പെട്ടു';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'ആരാണ് നിരീക്ഷിക്കുന്നത്?';

  @override
  String get addUser => 'ഉപയോക്താവിനെ ചേർക്കുക';

  @override
  String get selectServer => 'സെർവർ തിരഞ്ഞെടുക്കുക';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'സംരക്ഷിച്ച സെർവറുകൾ';

  @override
  String get discoveredServers => 'കണ്ടെത്തിയ സെർവറുകൾ';

  @override
  String get noneFound => 'ഒന്നും കണ്ടെത്തിയില്ല';

  @override
  String get unableToConnectToServer => 'സെർവറിലേക്ക് കണക്റ്റുചെയ്യാനായില്ല';

  @override
  String get addServer => 'സെർവർ ചേർക്കുക';

  @override
  String get embyConnect => 'Emby ബന്ധിപ്പിക്കുക';

  @override
  String get removeServer => 'സെർവർ നീക്കം ചെയ്യുക';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get remove => 'നീക്കം ചെയ്യുക';

  @override
  String get connectToServer => 'സെർവറിലേക്ക് ബന്ധിപ്പിക്കുക';

  @override
  String get serverAddress => 'സെർവർ വിലാസം';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'ബന്ധിപ്പിക്കുക';

  @override
  String get secureStorageUnavailable => 'സുരക്ഷിത സംഭരണം ലഭ്യമല്ല';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin നിങ്ങളുടെ സിസ്റ്റം കീറിംഗ് ആക്സസ് ചെയ്യാനായില്ല. ലോഗിൻ തുടരാം, പക്ഷേ കീറിംഗ് അൺലോക്ക് ചെയ്യുന്നതുവരെ സുരക്ഷിത ടോക്കൺ സംഭരണം ലഭ്യമല്ലായിരിക്കാം.';

  @override
  String get ok => 'ശരി';

  @override
  String get settingsAppearanceTheme => 'ആപ്പ് തീം';

  @override
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Moonfin is the classic layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Moonfin';

  @override
  String get detailScreenStyleModern => 'Modern';

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
  String get settingsAppearanceThemeSubtitle =>
      'ആപ്പ് പുനരാരംഭിക്കാതെ തന്നെ Moonfin, Neon Pulse എന്നിവയ്ക്കിടയിൽ മാറുക';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'മൂൺഫിൻ';

  @override
  String get themeMoonfinSubtitle =>
      'നിലവിലെ Moonfin നിങ്ങൾ എല്ലാവരും ഇഷ്ടപ്പെട്ടു';

  @override
  String get themeNeonPulse => 'നിയോൺ പൾസ്';

  @override
  String get themeNeonPulseSubtitle =>
      'മജന്ത ഗ്ലോ, സിയാൻ ടെക്‌സ്‌റ്റ്, ശക്തമായ ക്രോം കോൺട്രാസ്റ്റ് എന്നിവയ്‌ക്കൊപ്പം സിന്ത്‌വേവ് സ്‌റ്റൈലിംഗ്';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get embyConnectSignInSubtitle =>
      'നിങ്ങളുടെ Emby കണക്റ്റ് അക്കൗണ്ട് ഉപയോഗിച്ച് സൈൻ ഇൻ ചെയ്യുക';

  @override
  String get emailOrUsername => 'ഇമെയിൽ അല്ലെങ്കിൽ ഉപയോക്തൃനാമം';

  @override
  String get selectAServer => 'ഒരു സെർവർ തിരഞ്ഞെടുക്കുക';

  @override
  String get tryAgain => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get noLinkedServers =>
      'ഈ Emby കണക്‌റ്റ് അക്കൗണ്ടിലേക്ക് സെർവറുകളൊന്നും ലിങ്ക് ചെയ്‌തിട്ടില്ല';

  @override
  String get invalidEmbyConnectCredentials =>
      'അസാധുവായ Emby കണക്റ്റ് ക്രെഡൻഷ്യലുകൾ';

  @override
  String get invalidEmbyConnectLogin =>
      'Emby Connect ഉപയോക്തൃനാമമോ പാസ്‌വേഡോ അസാധുവാണ്';

  @override
  String get embyConnectExchangeNotSupported =>
      'സെർവർ Emby കണക്റ്റ് എക്സ്ചേഞ്ചിനെ പിന്തുണയ്ക്കുന്നില്ല';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect അല്ലെങ്കിൽ തിരഞ്ഞെടുത്ത സെർവറുമായി ബന്ധപ്പെടുമ്പോൾ നെറ്റ്‌വർക്ക് പിശക്';

  @override
  String get loadingLinkedServers => 'ലിങ്ക് ചെയ്‌ത സെർവറുകൾ ലോഡുചെയ്യുന്നു...';

  @override
  String get connectingToServerEllipsis => 'സെർവറിലേക്ക് ബന്ധിപ്പിക്കുന്നു...';

  @override
  String get noReachableAddress =>
      'എത്തിച്ചേരാവുന്ന വിലാസമൊന്നും നൽകിയിട്ടില്ല';

  @override
  String get invalidServerExchangeResponse =>
      'സെർവർ എക്സ്ചേഞ്ച് എൻഡ് പോയിൻ്റിൽ നിന്നുള്ള അസാധുവായ പ്രതികരണം';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin-ൽ നിന്ന് പുറത്തുകടക്കണോ?';

  @override
  String get exitAppConfirmation => 'പുറത്തുകടക്കണമെന്ന് തീർച്ചയാണോ?';

  @override
  String get exit => 'പുറത്ത്';

  @override
  String get noHomeRowsLoaded => 'ഹോം വരികളൊന്നും ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല';

  @override
  String get noHomeRowsHint =>
      'സജീവമായ ഹോം സെക്ഷനുകൾ പുതുക്കാനോ കുറയ്ക്കാനോ ശ്രമിക്കുക.';

  @override
  String get retryHomeRows => 'ഹോം വരികൾ വീണ്ടും ശ്രമിക്കുക';

  @override
  String get guide => 'വഴികാട്ടി';

  @override
  String get recordings => 'റെക്കോർഡിംഗുകൾ';

  @override
  String get schedule => 'ഷെഡ്യൂൾ';

  @override
  String get series => 'പരമ്പര';

  @override
  String get noItemsFound => 'ഇനങ്ങളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get home => 'വീട്';

  @override
  String get browseAll => 'എല്ലാം ബ്രൗസ് ചെയ്യുക';

  @override
  String get genres => 'വിഭാഗങ്ങൾ';

  @override
  String get collectionPlaceholder => 'ശേഖരണ ഇനങ്ങൾ ഇവിടെ ദൃശ്യമാകും';

  @override
  String get browseByLetter => 'കത്ത് ഉപയോഗിച്ച് ബ്രൗസ് ചെയ്യുക';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'അക്ഷരമാലാക്രമത്തിലുള്ള ബ്രൗസ് ഇവിടെ ദൃശ്യമാകും';

  @override
  String get suggestions => 'നിർദ്ദേശങ്ങൾ';

  @override
  String get suggestionsPlaceholder => 'നിർദ്ദേശിച്ച ഇനങ്ങൾ ഇവിടെ ദൃശ്യമാകും';

  @override
  String get failedToLoadLibraries =>
      'ലൈബ്രറികൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get noLibrariesFound => 'ലൈബ്രറികളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get library => 'ലൈബ്രറി';

  @override
  String get displaySettings => 'പ്രദർശന ക്രമീകരണങ്ങൾ';

  @override
  String get allGenres => 'എല്ലാ വിഭാഗങ്ങളും';

  @override
  String get noGenresFound => 'വിഭാഗങ്ങളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'ഈ ഫോൾഡർ ശൂന്യമാണ്';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'പ്രിയപ്പെട്ടവ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get retry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get noFavoritesYet => 'ഇതുവരെ പ്രിയങ്കരങ്ങളൊന്നുമില്ല';

  @override
  String get favorites => 'പ്രിയപ്പെട്ടവ';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'തുടരുന്നു';

  @override
  String get ended => 'അവസാനിച്ചു';

  @override
  String get sortAndFilter => 'അടുക്കുക & ഫിൽട്ടർ ചെയ്യുക';

  @override
  String get type => 'ടൈപ്പ് ചെയ്യുക';

  @override
  String get sortBy => 'ഇങ്ങനെ അടുക്കുക';

  @override
  String get display => 'പ്രദർശിപ്പിക്കുക';

  @override
  String get imageType => 'ഇമേജ് തരം';

  @override
  String get posterSize => 'പോസ്റ്റർ വലിപ്പം';

  @override
  String get small => 'ചെറുത്';

  @override
  String get medium => 'ഇടത്തരം';

  @override
  String get large => 'വലിയ';

  @override
  String get extraLarge => 'എക്സ്ട്രാ ലാർജ്';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'കാഴ്ചകൾ';

  @override
  String get albums => 'ആൽബങ്ങൾ';

  @override
  String get albumArtists => 'ആൽബം ആർട്ടിസ്റ്റുകൾ';

  @override
  String get artists => 'കലാകാരന്മാർ';

  @override
  String get bookmarks => 'ബുക്ക്മാർക്കുകൾ';

  @override
  String get noSavedBookmarks =>
      'ഈ ശീർഷകത്തിനായി ഇതുവരെ സംരക്ഷിച്ച ബുക്ക്‌മാർക്കുകളൊന്നുമില്ല.';

  @override
  String get openBook => 'പുസ്തകം തുറക്കുക';

  @override
  String get chapter => 'അധ്യായം';

  @override
  String get page => 'പേജ്';

  @override
  String get bookmark => 'ബുക്ക്മാർക്ക്';

  @override
  String get justNow => 'ഇപ്പോള്';

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
  String get discoverySubjects => 'കണ്ടെത്തൽ വിഷയങ്ങൾ';

  @override
  String get pickDiscoverySubjects =>
      'Discover-ൽ കാണിക്കേണ്ട വിഷയ ഫീഡുകൾ തിരഞ്ഞെടുക്കുക.';

  @override
  String get apply => 'അപേക്ഷിക്കുക';

  @override
  String get openLink => 'ലിങ്ക് തുറക്കുക';

  @override
  String get scanWithYourPhone => 'നിങ്ങളുടെ ഫോൺ ഉപയോഗിച്ച് സ്കാൻ ചെയ്യുക';

  @override
  String get audiobookGenres => 'ഓഡിയോബുക്ക് വിഭാഗങ്ങൾ';

  @override
  String get pickAudiobookGenres =>
      'Audiobook Discover-ൽ കാണിക്കേണ്ട വിഭാഗങ്ങൾ തിരഞ്ഞെടുക്കുക.';

  @override
  String get discoverAudiobooks => 'ഓഡിയോബുക്കുകൾ കണ്ടെത്തുക';

  @override
  String get librivoxDescription =>
      'LibriVox-ൽ നിന്നുള്ള ജനപ്രിയ പൊതു ഡൊമെയ്ൻ ശീർഷകങ്ങൾ.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'ഇടത്തേക്ക് സ്ക്രോൾ ചെയ്യുക';

  @override
  String get scrollRight => 'വലത്തേക്ക് സ്ക്രോൾ ചെയ്യുക';

  @override
  String get couldNotLoadGenre => 'ഈ തരം ഇപ്പോൾ ലോഡ് ചെയ്യാനായില്ല.';

  @override
  String get continueReading => 'വായന തുടരുക';

  @override
  String get savedHighlights => 'സംരക്ഷിച്ച ഹൈലൈറ്റുകൾ';

  @override
  String get continueListening => 'കേൾക്കുന്നത് തുടരുക';

  @override
  String get listen => 'കേൾക്കുക';

  @override
  String get resume => 'പുനരാരംഭിക്കുക';

  @override
  String get failedToLoadLibrary => 'ലൈബ്രറി ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get popularNow => 'ഇപ്പോൾ ജനപ്രിയമായത്';

  @override
  String get savedForLater => 'പിന്നീട് വേണ്ടി സംരക്ഷിച്ചു';

  @override
  String get topListens => 'മികച്ച ശ്രവിക്കുന്നവ';

  @override
  String get unreadDiscoveries => 'വായിക്കാത്ത കണ്ടെത്തലുകൾ';

  @override
  String get pickUpAgain => 'വീണ്ടും എടുക്കുക';

  @override
  String get bookHighlightsDescription =>
      'ഹൈലൈറ്റുകളോ പ്രിയങ്കരങ്ങളോ വായനാ പുരോഗതിയോ ഉള്ള നിങ്ങളുടെ പുസ്‌തകങ്ങൾ.';

  @override
  String get handPickedFromLibrary =>
      'നിങ്ങളുടെ ലൈബ്രറിയിൽ നിന്ന് തിരഞ്ഞെടുത്തത്.';

  @override
  String get handPickedFromListeningQueue =>
      'നിങ്ങളുടെ ശ്രവിക്കുന്ന ക്യൂവിൽ നിന്ന് തിരഞ്ഞെടുത്തത്.';

  @override
  String get booksWithHighlights =>
      'ഹൈലൈറ്റുകളോ പ്രിയങ്കരങ്ങളോ വായനാ പുരോഗതിയോ ഉള്ള പുസ്‌തകങ്ങൾ.';

  @override
  String get jumpBackNarration =>
      'നിങ്ങളുടെ സ്ഥലത്തെ വേട്ടയാടാതെ ആഖ്യാനത്തിലേക്ക് മടങ്ങുക.';

  @override
  String get unreadBooksReady =>
      'അടുത്ത നിശബ്‌ദ സമയത്തേക്ക് വായിക്കാത്ത പുസ്തകങ്ങൾ തയ്യാറാണ്.';

  @override
  String get quickAccessFavorites =>
      'നിങ്ങൾ തിരികെ വരുന്ന പുസ്‌തകങ്ങളിലേക്കുള്ള ദ്രുത പ്രവേശനം.';

  @override
  String get searchAudiobooks => 'ഓഡിയോബുക്കുകൾ തിരയുക';

  @override
  String get searchYourLibrary => 'നിങ്ങളുടെ ലൈബ്രറി തിരയുക';

  @override
  String get pickUpStory => 'നിങ്ങൾ നിർത്തിയിടത്ത് നിന്ന് കഥ എടുക്കുക';

  @override
  String get savedPlacesChapters =>
      'നിങ്ങളുടെ സംരക്ഷിച്ച സ്ഥലങ്ങളും പൂർത്തിയാകാത്ത അധ്യായങ്ങളും';

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
  String get readyWhenYouAre => 'നിങ്ങൾ ആയിരിക്കുമ്പോൾ തയ്യാറാണ്';

  @override
  String get details => 'വിശദാംശങ്ങൾ';

  @override
  String get listeningRoom => 'ശ്രവണമുറി';

  @override
  String get bookmarksAndProgress => 'ബുക്ക്‌മാർക്കുകളും പുരോഗതിയും';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'ശീർഷകങ്ങൾ';

  @override
  String get allTitles => 'എല്ലാ ശീർഷകങ്ങളും';

  @override
  String get authors => 'രചയിതാക്കൾ';

  @override
  String get browseByAuthor => 'രചയിതാവ് പ്രകാരം ബ്രൗസ് ചെയ്യുക';

  @override
  String get browseByGenre => 'തരം അനുസരിച്ച് ബ്രൗസ് ചെയ്യുക';

  @override
  String get discover => 'കണ്ടെത്തുക';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library എന്നതിൽ നിന്നുള്ള വിഷയം അനുസരിച്ച് ട്രെൻഡിംഗ് ശീർഷകങ്ങൾ.';

  @override
  String get noBookmarkedItems => 'ബുക്ക്‌മാർക്ക് ചെയ്‌ത ഇനങ്ങളൊന്നുമില്ല';

  @override
  String get nothingMatchesSection =>
      'ഈ വിഭാഗവുമായി ഇതുവരെ ഒന്നും പൊരുത്തപ്പെടുന്നില്ല. മറ്റൊരു ടാബ് പരീക്ഷിക്കുക അല്ലെങ്കിൽ ലൈബ്രറി സമന്വയം പൂർത്തിയാക്കിയ ശേഷം തിരികെ വരിക.';

  @override
  String get audiobooks => 'ഓഡിയോബുക്കുകൾ';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'ഫോൾഡർ';

  @override
  String get filters => 'ഫിൽട്ടറുകൾ';

  @override
  String get readingStatus => 'വായനാ നില';

  @override
  String get playedStatus => 'പ്ലേ ചെയ്ത സ്റ്റാറ്റസ്';

  @override
  String get readStatus => 'വായിക്കുക';

  @override
  String get watched => 'നിരീക്ഷിച്ചു';

  @override
  String get unread => 'വായിക്കാത്തത്';

  @override
  String get unwatched => 'കാണാത്തത്';

  @override
  String get seriesStatus => 'സീരീസ് സ്റ്റാറ്റസ്';

  @override
  String get allLibraries => 'എല്ലാ ലൈബ്രറികളും';

  @override
  String get books => 'പുസ്തകങ്ങൾ';

  @override
  String get author => 'രചയിതാവ്';

  @override
  String get unknownAuthor => 'അജ്ഞാത രചയിതാവ്';

  @override
  String get uncategorized => 'വർഗ്ഗീകരിക്കാത്തത്';

  @override
  String get overview => 'അവലോകനം';

  @override
  String get noLibrivoxDescription =>
      'ഈ ശീർഷകത്തിന് LibriVox ഇതുവരെ വിവരണമൊന്നും നൽകിയിട്ടില്ല.';

  @override
  String get readers => 'വായനക്കാർ';

  @override
  String get openLinks => 'ലിങ്കുകൾ തുറക്കുക';

  @override
  String get librivoxPage => 'LibriVox പേജ്';

  @override
  String get internetArchive => 'ഇൻ്റർനെറ്റ് ആർക്കൈവ്';

  @override
  String get rssFeed => 'ആർഎസ്എസ് ഫീഡ്';

  @override
  String get downloadZip => 'Zip ഡൗൺലോഡ് ചെയ്യുക';

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
      'ഈ ശീർഷകത്തിന് Open Library എന്നതിൽ നിന്ന് ഇതുവരെ ഒരു അവലോകനവും ലഭ്യമല്ല.';

  @override
  String get subjects => 'വിഷയങ്ങൾ';

  @override
  String get all => 'എല്ലാം';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'ഈ വിഷയം ഇപ്പോൾ ലോഡ് ചെയ്യാനായില്ല.';

  @override
  String get audiobookDetails => 'ഓഡിയോബുക്ക് വിശദാംശങ്ങൾ';

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
  String get trackList => 'ട്രാക്ക് ലിസ്റ്റ്';

  @override
  String get itemListPlaceholder => 'ഇനങ്ങളുടെ ലിസ്റ്റ് ഇവിടെ ദൃശ്യമാകും';

  @override
  String get favoriteTracksPlaceholder =>
      'പ്രിയപ്പെട്ട ട്രാക്കുകൾ ഇവിടെ ദൃശ്യമാകും';

  @override
  String get failedToLoad => 'ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get delete => 'ഇല്ലാതാക്കുക';

  @override
  String get save => 'സംരക്ഷിക്കുക';

  @override
  String get moreLikeThis => 'ഇത് പോലെ കൂടുതൽ';

  @override
  String get castAndCrew => 'കാസ്റ്റ് & ക്രൂ';

  @override
  String get collection => 'ശേഖരണം';

  @override
  String get episodes => 'എപ്പിസോഡുകൾ';

  @override
  String get nextUp => 'അടുത്തത്';

  @override
  String get seasons => 'സീസണുകൾ';

  @override
  String get chapters => 'അധ്യായങ്ങൾ';

  @override
  String get features => 'ഫീച്ചറുകൾ';

  @override
  String get movies => 'സിനിമകൾ';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'മറ്റുള്ളവ';

  @override
  String get discography => 'ഡിസ്ക്കോഗ്രാഫി';

  @override
  String get similarArtists => 'സമാന കലാകാരന്മാർ';

  @override
  String get tableOfContents => 'ഉള്ളടക്ക പട്ടിക';

  @override
  String get tracklist => 'ട്രാക്ക്ലിസ്റ്റ്';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'ജീവചരിത്രം';

  @override
  String get authorDetails => 'രചയിതാവിൻ്റെ വിശദാംശങ്ങൾ';

  @override
  String get noOverviewAvailable =>
      'ഈ ശീർഷകത്തിന് ഇതുവരെ ഒരു അവലോകനവും ലഭ്യമല്ല.';

  @override
  String get noBiographyAvailable => 'ഈ രചയിതാവിന് ജീവചരിത്രമൊന്നും ലഭ്യമല്ല.';

  @override
  String get noBooksFound => 'ഈ രചയിതാവിനായി പുസ്‌തകങ്ങളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get unableToLoadAuthorDetails =>
      'രചയിതാവിൻ്റെ വിശദാംശങ്ങൾ ഇപ്പോൾ ലോഡ് ചെയ്യാൻ കഴിയുന്നില്ല.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'പ്രസിദ്ധീകരണ തീയതി അജ്ഞാതമാണ്';

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
  String get items => 'Items';

  @override
  String get extras => 'Extras';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
  }

  @override
  String get view => 'കാണുക';

  @override
  String get resumeReading => 'വായന പുനരാരംഭിക്കുക';

  @override
  String get read => 'വായിക്കുക';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'കളിക്കുക';

  @override
  String get startOver => 'വീണ്ടും ആരംഭിക്കുക';

  @override
  String get restart => 'പുനരാരംഭിക്കുക';

  @override
  String get readOffline => 'ഓഫ്‌ലൈനിൽ വായിക്കുക';

  @override
  String get playOffline => 'ഓഫ്‌ലൈനിൽ പ്ലേ ചെയ്യുക';

  @override
  String get audio => 'ഓഡിയോ';

  @override
  String get subtitles => 'സബ്ടൈറ്റിലുകൾ';

  @override
  String get version => 'പതിപ്പ്';

  @override
  String get cast => 'കാസ്റ്റ്';

  @override
  String get trailer => 'ട്രെയിലർ';

  @override
  String get finished => 'തീർന്നു';

  @override
  String get favorited => 'പ്രിയപ്പെട്ടത്';

  @override
  String get favorite => 'പ്രിയപ്പെട്ടത്';

  @override
  String get playlist => 'പ്ലേലിസ്റ്റ്';

  @override
  String get downloaded => 'ഡൗൺലോഡ് ചെയ്തു';

  @override
  String get downloadAll => 'എല്ലാം ഡൗൺലോഡ് ചെയ്യുക';

  @override
  String get download => 'ഡൗൺലോഡ് ചെയ്യുക';

  @override
  String get deleteDownloaded => 'ഡൗൺലോഡ് ചെയ്‌തത് ഇല്ലാതാക്കുക';

  @override
  String get goToSeries => 'സീരീസിലേക്ക് പോകുക';

  @override
  String get editMetadata => 'മെറ്റാഡാറ്റ എഡിറ്റ് ചെയ്യുക';

  @override
  String get less => 'കുറവ്';

  @override
  String get more => 'കൂടുതൽ';

  @override
  String get deleteItem => 'ഇനം ഇല്ലാതാക്കുക';

  @override
  String get deletePlaylist => 'പ്ലേലിസ്റ്റ് ഇല്ലാതാക്കുക';

  @override
  String get deletePlaylistMessage =>
      'സെർവറിൽ നിന്ന് ഈ പ്ലേലിസ്റ്റ് ഇല്ലാതാക്കണോ?';

  @override
  String get deleteItemMessage => 'സെർവറിൽ നിന്ന് ഈ ഇനം ഇല്ലാതാക്കണോ?';

  @override
  String get failedToDeletePlaylist =>
      'പ്ലേലിസ്റ്റ് ഇല്ലാതാക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get failedToDeleteItem => 'ഇനം ഇല്ലാതാക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get renamePlaylist => 'പ്ലേലിസ്റ്റ് പേരുമാറ്റുക';

  @override
  String get playlistName => 'പ്ലേലിസ്റ്റ് പേര്';

  @override
  String get deleteDownloadedAlbum => 'ഡൗൺലോഡ് ചെയ്ത ആൽബം ഇല്ലാതാക്കുക';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'ഡൗൺലോഡ് ചെയ്ത ട്രാക്കുകൾ ഇല്ലാതാക്കി';

  @override
  String get downloadedTracksDeleteFailed =>
      'ഡൗൺലോഡ് ചെയ്‌ത ചില ട്രാക്കുകൾ ഇല്ലാതാക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get noTracksLoaded => 'ട്രാക്കുകളൊന്നും ലോഡ് ചെയ്തിട്ടില്ല';

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
  String get itemDeleted => 'ഇനം ഇല്ലാതാക്കി';

  @override
  String get noPlayableTrailerFound =>
      'പ്ലേ ചെയ്യാവുന്ന ട്രെയിലറൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'ഓഡിയോ ട്രാക്ക്';

  @override
  String get subtitleTrack => 'സബ്ടൈറ്റിൽ ട്രാക്ക്';

  @override
  String get none => 'ഒന്നുമില്ല';

  @override
  String get downloadSubtitlesLabel => 'സബ്‌ടൈറ്റിലുകൾ ഡൗൺലോഡ് ചെയ്യുക...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles പ്ലഗിൻ ഉപയോഗിച്ച് തിരയുക';

  @override
  String get downloadSubtitles => 'സബ്‌ടൈറ്റിലുകൾ ഡൗൺലോഡ് ചെയ്യുക';

  @override
  String get selectedSubtitleInvalid => 'തിരഞ്ഞെടുത്ത സബ്ടൈറ്റിൽ അസാധുവാണ്.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'സബ്ടൈറ്റിൽ ഡൗൺലോഡ് ചെയ്തു. Jellyfin ഇനം പുതുക്കുമ്പോൾ അത് ദൃശ്യമാകാൻ കുറച്ച് സമയമെടുത്തേക്കാം.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'പതിപ്പ് തിരഞ്ഞെടുക്കുക';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'എല്ലാം ഡൗൺലോഡ് ചെയ്യുക - ഗുണനിലവാരം';

  @override
  String get downloadQuality => 'ഡൗൺലോഡ് ഗുണനിലവാരം';

  @override
  String get originalFileNoReencoding => 'യഥാർത്ഥ ഫയൽ, വീണ്ടും എൻകോഡിംഗ് ഇല്ല';

  @override
  String get originalFilesNoReencoding =>
      'യഥാർത്ഥ ഫയലുകൾ, വീണ്ടും എൻകോഡിംഗ് ഇല്ല';

  @override
  String get noEpisodesLoaded => 'എപ്പിസോഡുകളൊന്നും ലോഡ് ചെയ്തിട്ടില്ല';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'ഡൗൺലോഡ് ചെയ്ത ഫയലുകൾ ഇല്ലാതാക്കുക';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'ഡൗൺലോഡ് ചെയ്ത ഫയലുകൾ ഇല്ലാതാക്കി';

  @override
  String get failedToDeleteFiles => 'ഫയലുകൾ ഇല്ലാതാക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get deleteFiles => 'ഫയലുകൾ ഇല്ലാതാക്കുക';

  @override
  String get director => 'ഡയറക്ടർ';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'എഴുത്തുകാർ';

  @override
  String get studio => 'സ്റ്റുഡിയോ';

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
  String get showLess => 'കുറവ് കാണിക്കുക';

  @override
  String get readMore => 'കൂടുതൽ വായിക്കുക';

  @override
  String get shuffle => 'ഷഫിൾ ചെയ്യുക';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'തികഞ്ഞ പൊരുത്തം';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'മോണോ';

  @override
  String get stereo => 'സ്റ്റീരിയോ';

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
  String get deleteSeasonFiles => 'ഈ സീസണിൽ ഡൗൺലോഡ് ചെയ്ത എല്ലാ എപ്പിസോഡുകളും';

  @override
  String get stillWatching => 'ഇപ്പോഴും കാണുന്നുണ്ടോ?';

  @override
  String get unableToLoadTrailerStream =>
      'ട്രെയിലർ സ്ട്രീം ലോഡ് ചെയ്യാനായില്ല.';

  @override
  String get trailerTimedOut => 'ട്രെയിലർ ലോഡ് ചെയ്യുമ്പോൾ സമയം കഴിഞ്ഞു.';

  @override
  String get playbackFailedForTrailer =>
      'ഈ ട്രെയിലറിൻ്റെ പ്ലേബാക്ക് പരാജയപ്പെട്ടു.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'ഓഫ്‌ലൈൻ പ്ലേബാക്ക് സമയത്ത് കാസ്റ്റിംഗ് ലഭ്യമല്ല.';

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
  String get deviceVolume => 'ഉപകരണ വോളിയം';

  @override
  String get unavailable => 'ലഭ്യമല്ല';

  @override
  String get pause => 'താൽക്കാലികമായി നിർത്തുക';

  @override
  String get syncPosition => 'സമന്വയ സ്ഥാനം';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'ക്യൂ ശൂന്യമാണ്';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'റിമോട്ട് പ്ലേബാക്ക്';

  @override
  String get castingToGoogleCast => 'Google Cast-ലേക്ക് കാസ്‌റ്റുചെയ്യുന്നു';

  @override
  String get castingViaAirPlay => 'AirPlay വഴി കാസ്റ്റുചെയ്യുന്നു';

  @override
  String get castingViaDlna => 'DLNA വഴി കാസ്റ്റിംഗ്';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'അൺലോക്ക് ചെയ്യാൻ ദീർഘനേരം അമർത്തുക';

  @override
  String get off => 'ഓഫ്';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'ഓട്ടോ';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'ബിട്രേറ്റ് ഓവർറൈഡ്';

  @override
  String get audioDelay => 'ഓഡിയോ കാലതാമസം';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'സബ്‌ടൈറ്റിൽ കാലതാമസം';

  @override
  String get reset => 'പുനഃസജ്ജമാക്കുക';

  @override
  String get unknown => 'അജ്ഞാതം';

  @override
  String get playbackInformation => 'പ്ലേബാക്ക് വിവരങ്ങൾ';

  @override
  String get playback => 'പ്ലേബാക്ക്';

  @override
  String get playMethod => 'കളി രീതി';

  @override
  String get directPlay => 'നേരിട്ടുള്ള പ്ലേ';

  @override
  String get directStream => 'നേരിട്ടുള്ള സ്ട്രീം';

  @override
  String get transcoding => 'ട്രാൻസ്കോഡിംഗ്';

  @override
  String get transcodeReasons => 'ട്രാൻസ്കോഡ് കാരണങ്ങൾ';

  @override
  String get player => 'കളിക്കാരൻ';

  @override
  String get container => 'കണ്ടെയ്നർ';

  @override
  String get bitrate => 'ബിറ്റ്റേറ്റ്';

  @override
  String get video => 'വീഡിയോ';

  @override
  String get resolution => 'റെസലൂഷൻ';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'കോഡെക്';

  @override
  String get videoBitrate => 'വീഡിയോ ബിറ്റ്റേറ്റ്';

  @override
  String get track => 'ട്രാക്ക്';

  @override
  String get channels => 'ചാനലുകൾ';

  @override
  String get audioBitrate => 'ഓഡിയോ ബിറ്റ്റേറ്റ്';

  @override
  String get sampleRate => 'സാമ്പിൾ നിരക്ക്';

  @override
  String get format => 'ഫോർമാറ്റ്';

  @override
  String get external => 'ബാഹ്യ';

  @override
  String get embedded => 'ഉൾച്ചേർത്തത്';

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
      'ഈ പ്ലാറ്റ്‌ഫോമിൽ EPUB റെൻഡറിംഗ് ഇൻ-ആപ്പ് ഇതുവരെ ലഭ്യമല്ല.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'എംബഡഡ് ഡോക്യുമെൻ്റ് റെൻഡറിംഗ് ഈ പ്ലാറ്റ്‌ഫോമിൽ ലഭ്യമല്ല.';

  @override
  String get couldNotOpenExternalViewer => 'ബാഹ്യ വ്യൂവർ തുറക്കാൻ കഴിഞ്ഞില്ല.';

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
      'ഇതുവരെ ബുക്ക്‌മാർക്കുകളൊന്നുമില്ല.\nനിങ്ങളുടെ സ്ഥാനം സംരക്ഷിക്കാൻ വായിക്കുമ്പോൾ ബുക്ക്മാർക്ക് ഐക്കണിൽ ടാപ്പുചെയ്യുക.';

  @override
  String get noTableOfContentsAvailable => 'ഉള്ളടക്ക പട്ടിക ലഭ്യമല്ല';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'സ്ഥാനം';

  @override
  String get bookReader => 'ബുക്ക് റീഡർ';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'അപ്ഡേറ്റ് ചെയ്യുന്നു...';

  @override
  String get markUnread => 'വായിക്കാത്തതായി അടയാളപ്പെടുത്തുക';

  @override
  String get markAsRead => 'വായിച്ചതായി അടയാളപ്പെടുത്തുക';

  @override
  String get reloadReader => 'റീഡർ റീലോഡ് ചെയ്യുക';

  @override
  String get noPagesFound => 'പേജുകളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get failedToDecodePageImage =>
      'പേജ് ചിത്രം ഡീകോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'ഒറ്റ പേജ്';

  @override
  String get twoPageSpread => 'രണ്ട് പേജ് വ്യാപനം';

  @override
  String get addBookmark => 'ബുക്ക്മാർക്ക് ചേർക്കുക';

  @override
  String get bookmarksEllipsis => 'ബുക്ക്‌മാർക്കുകൾ...';

  @override
  String get markedAsRead => 'വായിച്ചതായി അടയാളപ്പെടുത്തി';

  @override
  String get markedAsUnread => 'വായിക്കാത്തതായി അടയാളപ്പെടുത്തി';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'തീം: സിസ്റ്റം';

  @override
  String get themeLight => 'തീം: വെളിച്ചം';

  @override
  String get themeDark => 'തീം: ഇരുട്ട്';

  @override
  String get themeSepia => 'തീം: സെപിയ';

  @override
  String get invertColorsFixedLayout => 'വിപരീത നിറങ്ങൾ (നിശ്ചിത ലേഔട്ട്)';

  @override
  String get invertColorsPdf => 'വിപരീത നിറങ്ങൾ (PDF)';

  @override
  String get preparingInAppReader => 'ഇൻ-ആപ്പ് റീഡർ തയ്യാറാക്കുന്നു...';

  @override
  String get pdfDataNotAvailable => 'PDF ഡാറ്റ ലഭ്യമല്ല.';

  @override
  String get readerFallbackModeActive => 'റീഡർ ഫാൾബാക്ക് മോഡ് സജീവമാണ്';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'പിന്തുണയ്‌ക്കുന്ന പ്ലാറ്റ്‌ഫോം ലക്ഷ്യത്തിലേക്ക് (Android, iOS, macOS) മാറിയതിന് ശേഷം റീലോഡ് റീഡർ ഉപയോഗിക്കുക.';

  @override
  String get openExternally => 'ബാഹ്യമായി തുറക്കുക';

  @override
  String get noEpubChaptersFound => 'EPUB ചാപ്റ്ററുകളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get readerNotReady => 'വായനക്കാരൻ തയ്യാറല്ല.';

  @override
  String get seriesRecordings => 'സീരീസ് റെക്കോർഡിംഗുകൾ';

  @override
  String get now => 'ഇപ്പോൾ';

  @override
  String get sports => 'സ്പോർട്സ്';

  @override
  String get news => 'വാർത്ത';

  @override
  String get kids => 'കുട്ടികൾ';

  @override
  String get premiere => 'പ്രീമിയർ';

  @override
  String get guideTimeline => 'ഗൈഡ് ടൈംലൈൻ';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'ചാനലുകളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get liveBadge => 'തത്സമയം';

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
  String get movie => 'സിനിമ';

  @override
  String get removedFromFavoriteChannels =>
      'പ്രിയപ്പെട്ട ചാനലുകളിൽ നിന്ന് നീക്കം ചെയ്‌തു';

  @override
  String get addedToFavoriteChannels => 'പ്രിയപ്പെട്ട ചാനലുകളിലേക്ക് ചേർത്തു';

  @override
  String get failedToUpdateFavoriteChannel =>
      'പ്രിയപ്പെട്ട ചാനൽ അപ്ഡേറ്റ് ചെയ്യാനായില്ല';

  @override
  String get unfavoriteChannel => 'ഇഷ്ടപ്പെടാത്ത ചാനൽ';

  @override
  String get favoriteChannel => 'പ്രിയപ്പെട്ട ചാനൽ';

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
  String get watch => 'കാണുക';

  @override
  String get close => 'അടയ്ക്കുക';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'റെക്കോർഡിംഗുകൾ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get scheduledInNext24Hours =>
      'അടുത്ത 24 മണിക്കൂറിനുള്ളിൽ ഷെഡ്യൂൾ ചെയ്‌തു';

  @override
  String get recentRecordings => 'സമീപകാല റെക്കോർഡിംഗുകൾ';

  @override
  String get tvSeries => 'TV പരമ്പര';

  @override
  String get failedToLoadSchedule => 'ഷെഡ്യൂൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get noScheduledRecordings => 'ഷെഡ്യൂൾ ചെയ്ത റെക്കോർഡിംഗുകളൊന്നുമില്ല';

  @override
  String get cancelRecording => 'റെക്കോർഡിംഗ് റദ്ദാക്കണോ?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'ഇല്ല';

  @override
  String get yesCancel => 'അതെ, റദ്ദാക്കുക';

  @override
  String get failedToCancelRecording =>
      'റെക്കോർഡിംഗ് റദ്ദാക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get failedToLoadSeriesRecordings =>
      'സീരീസ് റെക്കോർഡിംഗുകൾ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get noSeriesRecordings => 'സീരീസ് റെക്കോർഡിംഗുകളൊന്നുമില്ല';

  @override
  String get cancelSeriesRecording => 'സീരീസ് റെക്കോർഡിംഗ് റദ്ദാക്കുക';

  @override
  String get cancelSeriesRecordingQuestion => 'സീരീസ് റെക്കോർഡിംഗ് റദ്ദാക്കണോ?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'സീരീസ് റെക്കോർഡിംഗ് റദ്ദാക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get searchThisLibrary => 'ഈ ലൈബ്രറി തിരയൂ...';

  @override
  String get searchEllipsis => 'തിരയുക...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'സീർ അക്കൗണ്ട് തരം';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'പ്രാദേശിക';

  @override
  String get savedMedia => 'സംരക്ഷിച്ച മീഡിയ';

  @override
  String get tvShows => 'ടിവി ഷോകൾ';

  @override
  String get music => 'സംഗീതം';

  @override
  String get musicAlbums => 'സംഗീത ആൽബങ്ങൾ';

  @override
  String get noMediaInFilter => 'ഈ ഫിൽട്ടറിൽ മീഡിയയില്ല';

  @override
  String get noDownloadedMediaYet => 'ഇതുവരെ ഡൗൺലോഡ് ചെയ്ത മീഡിയകളൊന്നുമില്ല';

  @override
  String get browseLibrary => 'ലൈബ്രറി ബ്രൗസ് ചെയ്യുക';

  @override
  String get deleteDownload => 'ഡൗൺലോഡ് ഇല്ലാതാക്കുക';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'ആൽബം';

  @override
  String get playAlbum => 'ആൽബം പ്ലേ ചെയ്യുക';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'സീസൺ';

  @override
  String get errorLoadingEpisodes => 'എപ്പിസോഡുകൾ ലോഡുചെയ്യുന്നതിൽ പിശക്';

  @override
  String get noDownloadedEpisodes => 'ഡൗൺലോഡ് ചെയ്ത എപ്പിസോഡുകളൊന്നുമില്ല';

  @override
  String get deleteEpisode => 'എപ്പിസോഡ് ഇല്ലാതാക്കുക';

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
  String get seriesNotFound => 'സീരീസ് കണ്ടെത്തിയില്ല';

  @override
  String get errorLoadingSeries => 'സീരീസ് ലോഡുചെയ്യുന്നതിൽ പിശക്';

  @override
  String get downloadedEpisodes => 'എപ്പിസോഡുകൾ ഡൗൺലോഡ് ചെയ്തു';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'വിശേഷങ്ങൾ';

  @override
  String get deleteSeason => 'സീസൺ ഇല്ലാതാക്കുക';

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
  String get storageManagement => 'സ്റ്റോറേജ് മാനേജ്മെൻ്റ്';

  @override
  String get storageBreakdown => 'സ്റ്റോറേജ് ബ്രേക്ക്ഡൗൺ';

  @override
  String get downloadedItems => 'ഡൗൺലോഡ് ചെയ്ത ഇനങ്ങൾ';

  @override
  String get storageLimit => 'സംഭരണ ​​പരിധി';

  @override
  String get noLimit => 'പരിധിയില്ല';

  @override
  String get deleteAllDownloads => 'എല്ലാ ഡൗൺലോഡുകളും ഇല്ലാതാക്കുക';

  @override
  String get deleteAllDownloadsWarning =>
      'ഇത് ഡൗൺലോഡ് ചെയ്ത എല്ലാ മീഡിയ ഫയലുകളും നീക്കം ചെയ്യും, പഴയപടിയാക്കാനാകില്ല.';

  @override
  String get deleteAll => 'എല്ലാം ഇല്ലാതാക്കുക';

  @override
  String get deleteSelected => 'തിരഞ്ഞെടുത്തത് ഇല്ലാതാക്കുക';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'സംഗീതവും ഓഡിയോബുക്കുകളും';

  @override
  String get images => 'ചിത്രങ്ങൾ';

  @override
  String get database => 'ഡാറ്റാബേസ്';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get authentication => 'പ്രാമാണീകരണം';

  @override
  String get autoLoginServerManagement => 'ഓട്ടോ ലോഗിൻ, സെർവർ മാനേജ്മെൻ്റ്';

  @override
  String get pinCode => 'പിൻ കോഡ്';

  @override
  String get setUpPinCodeProtection => 'പിൻ കോഡ് പരിരക്ഷ സജ്ജീകരിക്കുക';

  @override
  String get parentalControls => 'രക്ഷാകർതൃ നിയന്ത്രണങ്ങൾ';

  @override
  String get contentRatingRestrictions => 'ഉള്ളടക്ക റേറ്റിംഗ് നിയന്ത്രണങ്ങൾ';

  @override
  String get bitRateResolutionBehavior => 'ബിറ്റ്റേറ്റ്, റെസല്യൂഷൻ, പെരുമാറ്റം';

  @override
  String get languageSizeAppearance => 'ഭാഷ, വലിപ്പം, രൂപം';

  @override
  String get qualityStorage => 'ഗുണനിലവാരം, സംഭരണം';

  @override
  String get serverSyncAndPluginStatus => 'സെർവർ സമന്വയവും പ്ലഗിൻ നിലയും';

  @override
  String get mediaRequestIntegration => 'മീഡിയ അഭ്യർത്ഥന ഏകീകരണം';

  @override
  String get switchServer => 'സെർവർ മാറുക';

  @override
  String get signOut => 'സൈൻ ഔട്ട്';

  @override
  String get versionLicenses => 'പതിപ്പ്, ലൈസൻസുകൾ';

  @override
  String get account => 'അക്കൗണ്ട്';

  @override
  String get signInAndSecurity => 'പ്രവേശനവും സുരക്ഷയും';

  @override
  String get administration => 'അഡ്മിനിസ്ട്രേഷൻ';

  @override
  String get serverSettingsUsersLibraries =>
      'സെർവർ ക്രമീകരണങ്ങൾ, ഉപയോക്താക്കൾ, ലൈബ്രറികൾ';

  @override
  String get customization => 'ഇഷ്ടാനുസൃതമാക്കൽ';

  @override
  String get themeAndLayout => 'തീമും ലേഔട്ടും';

  @override
  String get videoAndSubtitles => 'വീഡിയോയും സബ്ടൈറ്റിലുകളും';

  @override
  String get integrations => 'സംയോജനങ്ങൾ';

  @override
  String get pluginAndRequests => 'പ്ലഗിനും അഭ്യർത്ഥനകളും';

  @override
  String get customizeAccountPlaybackInterface =>
      'അക്കൗണ്ട്, പ്ലേബാക്ക്, ഇൻ്റർഫേസ് പെരുമാറ്റം എന്നിവ ഇഷ്ടാനുസൃതമാക്കുക';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'തീം & രൂപഭാവം';

  @override
  String get focusBorderColor => 'ഫോക്കസ് ബോർഡർ കളർ';

  @override
  String get watchedIndicators => 'സൂചകങ്ങൾ നിരീക്ഷിച്ചു';

  @override
  String get always => 'എപ്പോഴും';

  @override
  String get hideUnwatched => 'കാണാത്തവ മറയ്ക്കുക';

  @override
  String get episodesOnly => 'എപ്പിസോഡുകൾ മാത്രം';

  @override
  String get never => 'ഒരിക്കലും';

  @override
  String get focusExpansionAnimation => 'ഫോക്കസ് എക്സ്പാൻഷൻ ആനിമേഷൻ';

  @override
  String get desktopUiScale => 'ഡെസ്ക്ടോപ്പ് യുഐ സ്കെയിൽ';

  @override
  String get scaleFocusedCards =>
      'സ്കെയിൽ ഫോക്കസ് ചെയ്‌തതോ ഹോവർ ചെയ്‌തതോ ആയ കാർഡുകളും ടൈലുകളും';

  @override
  String get backgroundBackdrops => 'പശ്ചാത്തല പശ്ചാത്തലങ്ങൾ';

  @override
  String get showBackdropImages =>
      'ഉള്ളടക്കത്തിന് പിന്നിലെ ബാക്ക്‌ഡ്രോപ്പ് ചിത്രങ്ങൾ കാണിക്കുക';

  @override
  String get seriesThumbnails => 'സീരീസ് ലഘുചിത്രങ്ങൾ';

  @override
  String get seriesThumbnailsDescription =>
      'എപ്പിസോഡുകൾ മാത്രം: ഓരോ വരി ചിത്ര തരവുമായി പൊരുത്തപ്പെടുന്ന സീരീസ് ആർട്ട് വർക്ക് ഉപയോഗിക്കുക';

  @override
  String get homeRowInfoOverlay => 'ഹോം റോ വിവര ഓവർലേ';

  @override
  String get showTitleMetadataOnHomeRows =>
      'ഹോം വരികൾ ബ്രൗസ് ചെയ്യുമ്പോൾ ശീർഷകവും മെറ്റാഡാറ്റയും കാണിക്കുക';

  @override
  String get clockDisplay => 'ക്ലോക്ക് ഡിസ്പ്ലേ';

  @override
  String get inMenus => 'മെനുകളിൽ';

  @override
  String get inVideo => 'വീഡിയോയിൽ';

  @override
  String get seasonalEffects => 'സീസണൽ ഇഫക്റ്റുകൾ';

  @override
  String get seasonalEffectsDescription =>
      'വിഷ്വൽ ഇഫക്റ്റുകളും സീസണൽ അലങ്കാരങ്ങളും';

  @override
  String get snow => 'മഞ്ഞ്';

  @override
  String get fireworks => 'വെടിക്കെട്ട്';

  @override
  String get confetti => 'കോൺഫെറ്റി';

  @override
  String get fallingLeaves => 'വീഴുന്ന ഇലകൾ';

  @override
  String get themeMusic => 'തീം സംഗീതം';

  @override
  String get playThemeMusicOnDetailPages =>
      'വിശദമായ പേജുകളിൽ തീം മ്യൂസിക് പ്ലേ ചെയ്യുക';

  @override
  String get themeMusicVolume => 'തീം മ്യൂസിക് വോളിയം';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'ഹോം റോകളിൽ തീം മ്യൂസിക്';

  @override
  String get playWhenBrowsingHomeScreen =>
      'ഹോം സ്‌ക്രീൻ ബ്രൗസ് ചെയ്യുമ്പോൾ പ്ലേ ചെയ്യുക';

  @override
  String get detailsBackgroundBlur => 'വിശദാംശങ്ങളുടെ പശ്ചാത്തല മങ്ങൽ';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'ബ്രൗസിംഗ് പശ്ചാത്തല മങ്ങൽ';

  @override
  String get maxStreamingBitrate => 'പരമാവധി സ്ട്രീമിംഗ് ബിറ്റ്റേറ്റ്';

  @override
  String get maxResolution => 'പരമാവധി റെസല്യൂഷൻ';

  @override
  String get playerZoomMode => 'പ്ലെയർ സൂം മോഡ്';

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
  String get fit => 'അനുയോജ്യം';

  @override
  String get autoCrop => 'ഓട്ടോ ക്രോപ്പ്';

  @override
  String get stretch => 'വലിച്ചുനീട്ടുക';

  @override
  String get refreshRateSwitching => 'പുതുക്കിയ നിരക്ക് സ്വിച്ചിംഗ്';

  @override
  String get disabled => 'അപ്രാപ്തമാക്കി';

  @override
  String get scaleOnTv => 'ടിവിയിൽ സ്കെയിൽ';

  @override
  String get scaleOnDevice => 'ഉപകരണത്തിൽ സ്കെയിൽ ചെയ്യുക';

  @override
  String get trickPlay => 'ട്രിക്ക് പ്ലേ';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'തിരയുമ്പോൾ പ്രിവ്യൂ ലഘുചിത്രങ്ങൾ കാണിക്കുക';

  @override
  String get showDescriptionOnPause =>
      'താൽക്കാലികമായി നിർത്തുന്നതിൽ വിവരണം കാണിക്കുക';

  @override
  String get dimVideoShowOverview =>
      'താൽക്കാലികമായി നിർത്തിയിരിക്കുമ്പോൾ വീഡിയോ ഡിം ചെയ്‌ത് അവലോകന ടെക്‌സ്‌റ്റ് കാണിക്കുക';

  @override
  String get osdLockButton => 'OSD ലോക്ക് ബട്ടൺ';

  @override
  String get osdLockButtonDescription =>
      'ദീർഘനേരം അമർത്തുന്നത് വരെ ടച്ച് ഇൻപുട്ടിനെ തടയുന്ന ഒരു ലോക്ക് ബട്ടൺ കാണിക്കുക';

  @override
  String get audioBehavior => 'ഓഡിയോ പെരുമാറ്റം';

  @override
  String get downmixToStereo => 'സ്റ്റീരിയോയിലേക്ക് ഡൗൺമിക്സ് ചെയ്യുക';

  @override
  String get defaultAudioLanguage => 'ഡിഫോൾട്ട് ഓഡിയോ ഭാഷ';

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
  String get autoServerDefault => 'സ്വയമേവ (സെർവർ ഡിഫോൾട്ട്)';

  @override
  String get english => 'ഇംഗ്ലീഷ്';

  @override
  String get spanish => 'സ്പാനിഷ്';

  @override
  String get french => 'ഫ്രഞ്ച്';

  @override
  String get german => 'ജർമ്മൻ';

  @override
  String get italian => 'ഇറ്റാലിയൻ';

  @override
  String get portuguese => 'പോർച്ചുഗീസ്';

  @override
  String get japanese => 'ജാപ്പനീസ്';

  @override
  String get korean => 'കൊറിയൻ';

  @override
  String get chinese => 'ചൈനീസ്';

  @override
  String get russian => 'റഷ്യൻ';

  @override
  String get arabic => 'അറബി';

  @override
  String get hindi => 'ഹിന്ദി';

  @override
  String get dutch => 'ഡച്ച്';

  @override
  String get swedish => 'സ്വീഡിഷ്';

  @override
  String get norwegian => 'നോർവീജിയൻ';

  @override
  String get danish => 'ഡാനിഷ്';

  @override
  String get finnish => 'ഫിന്നിഷ്';

  @override
  String get polish => 'പോളിഷ്';

  @override
  String get ac3Passthrough => 'AC3 പാസ്ത്രൂ';

  @override
  String get dtsPassthrough => 'DTS പാസ്ത്രൂ';

  @override
  String get trueHdSupport => 'TrueHD പിന്തുണ';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS ഓഡിയോ AVR-ലേക്ക് മാത്രം; റിസീവർ പിന്തുണയും DTS ഉറവിട ട്രാക്കും ആവശ്യമാണ്';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ഓഡിയോ പ്രവർത്തനക്ഷമമാക്കുക (എല്ലാ പ്ലാറ്റ്ഫോമുകളിലും പ്രവർത്തിച്ചേക്കില്ല)';

  @override
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

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
  String get nightMode => 'രാത്രി മോഡ്';

  @override
  String get compressDynamicRange => 'ഡൈനാമിക് ശ്രേണി കംപ്രസ് ചെയ്യുക';

  @override
  String get advancedMpv => 'വിപുലമായ mpv';

  @override
  String get enableCustomMpvConf => 'ഇഷ്‌ടാനുസൃത mpv.conf പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get applyMpvConfBeforePlayback =>
      'പ്ലേബാക്ക് ആരംഭിക്കുന്നതിന് മുമ്പ് ഉപയോക്താവ് വ്യക്തമാക്കിയ mpv.conf പ്രയോഗിക്കുക';

  @override
  String get unsafeAdvancedMpvOptions =>
      'സുരക്ഷിതമല്ലാത്ത വിപുലമായ mpv ഓപ്ഷനുകൾ';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv ഓപ്‌ഷനുകളുടെ വിശാലമായ സെറ്റ് അനുവദിക്കുക. പ്ലേബാക്ക് സ്വഭാവം തകർത്തേക്കാം.';

  @override
  String get hardwareDecoding => 'ഹാർഡ്‌വെയർ ഡീകോഡിംഗ്';

  @override
  String get hardwareDecodingSubtitle =>
      'പ്രകടനം മെച്ചപ്പെടുത്തിയേക്കാം എന്നാൽ ചില ഉപകരണങ്ങളിൽ പ്ലേബാക്ക് പ്രശ്നങ്ങൾ ഉണ്ടാക്കാം.';

  @override
  String get nextUpAndQueuing => 'അടുത്തത് & ക്യൂയിംഗ്';

  @override
  String get nextUpDisplay => 'അടുത്ത ഡിസ്പ്ലേ';

  @override
  String get extended => 'വിപുലീകരിച്ചു';

  @override
  String get minimal => 'ചുരുങ്ങിയത്';

  @override
  String get nextUpTimeout => 'അടുത്തത് ടൈംഔട്ട്';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'മാധ്യമങ്ങൾ ക്യൂവിംഗ്';

  @override
  String get autoQueueNextEpisodes => 'അടുത്ത എപ്പിസോഡുകൾ സ്വയമേവ ക്യൂ';

  @override
  String get stillWatchingPrompt => 'ഇപ്പോഴും പ്രോംപ്റ്റ് വീക്ഷിക്കുന്നു';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'പുനരാരംഭിക്കുക & ഒഴിവാക്കുക';

  @override
  String get resumeRewind => 'റിവൈൻഡ് പുനരാരംഭിക്കുക';

  @override
  String get unpauseRewind => 'റിവൈൻഡ് താൽക്കാലികമായി നിർത്തുക';

  @override
  String get fiveSeconds => '5 സെക്കൻഡ്';

  @override
  String get tenSeconds => '10 സെക്കൻഡ്';

  @override
  String get fifteenSeconds => '15 സെക്കൻഡ്';

  @override
  String get thirtySeconds => '30 സെക്കൻഡ്';

  @override
  String get skipBackLength => 'പിന്നോട്ട് ദൈർഘ്യം ഒഴിവാക്കുക';

  @override
  String get skipForwardLength => 'മുന്നോട്ട് നീളം ഒഴിവാക്കുക';

  @override
  String get customMpvConfPath => 'ഇഷ്‌ടാനുസൃത mpv.conf പാത';

  @override
  String get notSetMpvConf =>
      'സജ്ജമാക്കിയിട്ടില്ല. ആപ്പ്/ഡാറ്റ ഫോൾഡറുകളിൽ Moonfin ഒരു ഡിഫോൾട്ട് mpv.conf പരീക്ഷിക്കും.';

  @override
  String get selectMpvConf => 'mpv.conf തിരഞ്ഞെടുക്കുക';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'സ്റ്റൈൽ ക്രമീകരണങ്ങൾ (വലിപ്പം, നിറം, ഓഫ്‌സെറ്റ്) ടെക്‌സ്‌റ്റ് അധിഷ്‌ഠിത സബ്‌ടൈറ്റിലുകൾക്ക് (SRT, VTT, TTML) ബാധകമാണ്. \"ASS/SSA ഡയറക്ട് പ്ലേ\" ഓഫാക്കിയിട്ടില്ലെങ്കിൽ ASS/SSA സബ്‌ടൈറ്റിലുകൾ അവരുടേതായ എംബഡഡ് സ്റ്റൈലിംഗ് ഉപയോഗിക്കുന്നു. ബിറ്റ്മാപ്പ് സബ്ടൈറ്റിലുകൾ (PGS, DVB, VobSub) പുനഃസ്ഥാപിക്കാൻ കഴിയില്ല.';

  @override
  String get defaultSubtitleLanguage => 'ഡിഫോൾട്ട് സബ്ടൈറ്റിൽ ഭാഷ';

  @override
  String get defaultToNoSubtitles =>
      'സബ്‌ടൈറ്റിലുകൾ ഇല്ല എന്നതിലേക്ക് ഡിഫോൾട്ട്';

  @override
  String get turnOffSubtitlesByDefault =>
      'സ്ഥിരസ്ഥിതിയായി സബ്‌ടൈറ്റിലുകൾ ഓഫാക്കുക';

  @override
  String get subtitleSize => 'ഉപശീർഷക വലുപ്പം';

  @override
  String get textFillColor => 'ടെക്സ്റ്റ് ഫിൽ കളർ';

  @override
  String get backgroundColor => 'പശ്ചാത്തല നിറം';

  @override
  String get textStrokeColor => 'ടെക്സ്റ്റ് സ്ട്രോക്ക് നിറം';

  @override
  String get subtitleCustomization => 'സബ്ടൈറ്റിൽ ഇഷ്‌ടാനുസൃതമാക്കൽ';

  @override
  String get subtitleCustomizationDescription =>
      'ഉപശീർഷക രൂപം ഇഷ്ടാനുസൃതമാക്കുക';

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
  String get subtitlePreviewText =>
      'പെട്ടെന്നുള്ള തവിട്ട് കുറുക്കൻ മടിയനായ നായയുടെ മുകളിലൂടെ ചാടുന്നു';

  @override
  String get verticalOffset => 'ലംബമായ ഓഫ്സെറ്റ്';

  @override
  String get pgsDirectPlay => 'PGS ഡയറക്ട് പ്ലേ';

  @override
  String get directPlayPgsSubtitles => 'നേരിട്ടുള്ള പ്ലേ PGS സബ്‌ടൈറ്റിലുകൾ';

  @override
  String get assSsaDirectPlay => 'ASS/SSA ഡയറക്ട് പ്ലേ';

  @override
  String get directPlayAssSsaSubtitles =>
      'ASS/SSA സബ്‌ടൈറ്റിലുകൾ നേരിട്ട് പ്ലേ ചെയ്യുക';

  @override
  String get white => 'വെള്ള';

  @override
  String get black => 'കറുപ്പ്';

  @override
  String get yellow => 'മഞ്ഞ';

  @override
  String get green => 'പച്ച';

  @override
  String get cyan => 'സിയാൻ';

  @override
  String get red => 'ചുവപ്പ്';

  @override
  String get transparent => 'സുതാര്യം';

  @override
  String get semiTransparentBlack => 'അർദ്ധ സുതാര്യമായ കറുപ്പ്';

  @override
  String get global => 'ആഗോള';

  @override
  String get desktop => 'ഡെസ്ക്ടോപ്പ്';

  @override
  String get mobile => 'മൊബൈൽ';

  @override
  String get tv => 'ടി.വി';

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
  String get customizationProfile => 'ഇഷ്‌ടാനുസൃതമാക്കൽ പ്രൊഫൈൽ';

  @override
  String get customizationProfileDescription =>
      'ലോഡ് ചെയ്യാനും എഡിറ്റ് ചെയ്യാനും സമന്വയിപ്പിക്കാനും പ്രൊഫൈൽ തിരഞ്ഞെടുക്കുക. ഒരു ഉപകരണ പ്രൊഫൈൽ അതിനെ അസാധുവാക്കുന്നില്ലെങ്കിൽ ഗ്ലോബൽ എല്ലായിടത്തും ബാധകമാണ്. പച്ച ഡോട്ട് നിങ്ങളുടെ നിലവിലെ ഉപകരണ പ്രൊഫൈൽ അടയാളപ്പെടുത്തുന്നു.';

  @override
  String get loadProfile => 'പ്രൊഫൈൽ ലോഡ് ചെയ്യുക';

  @override
  String get syncing => 'സമന്വയിപ്പിക്കുന്നു...';

  @override
  String get syncToProfile => 'പ്രൊഫൈലിലേക്ക് സമന്വയിപ്പിക്കുക';

  @override
  String get profileSyncHidden => 'പ്രൊഫൈൽ സമന്വയം മറച്ചിരിക്കുന്നു';

  @override
  String get enablePluginSyncDescription =>
      'പ്രൊഫൈൽ നിയന്ത്രണങ്ങൾ ഇവിടെ കാണിക്കാൻ പ്ലഗിൻ ക്രമീകരണങ്ങളിൽ സെർവർ പ്ലഗിൻ സമന്വയം പ്രവർത്തനക്ഷമമാക്കുക.';

  @override
  String get quality => 'ഗുണനിലവാരം';

  @override
  String get defaultDownloadQuality => 'ഡിഫോൾട്ട് ഡൗൺലോഡ് നിലവാരം';

  @override
  String get network => 'നെറ്റ്വർക്ക്';

  @override
  String get wifiOnlyDownloads => 'വൈഫൈ-മാത്രം ഡൗൺലോഡുകൾ';

  @override
  String get onlyDownloadOnWifi =>
      'വൈഫൈയിലേക്ക് കണക്റ്റ് ചെയ്യുമ്പോൾ മാത്രം ഡൗൺലോഡ് ചെയ്യുക';

  @override
  String get storage => 'സംഭരണം';

  @override
  String get storageUsed => 'ഉപയോഗിച്ച സംഭരണം';

  @override
  String get manage => 'കൈകാര്യം ചെയ്യുക';

  @override
  String get calculating => 'കണക്കാക്കുന്നു...';

  @override
  String get downloadLocation => 'ലൊക്കേഷൻ ഡൗൺലോഡ് ചെയ്യുക';

  @override
  String get defaultLabel => 'സ്ഥിരസ്ഥിതി';

  @override
  String get saveToDownloadsFolder => 'ഡൗൺലോഡ് ഫോൾഡറിലേക്ക് സംരക്ഷിക്കുക';

  @override
  String get downloadsVisibleToOtherApps =>
      'ഡൗൺലോഡുകൾ/Moonfin — മറ്റ് ആപ്പുകൾക്ക് ദൃശ്യമാണ്';

  @override
  String get dangerZone => 'അപകടമേഖല';

  @override
  String get clearAllDownloads => 'എല്ലാ ഡൗൺലോഡുകളും മായ്‌ക്കുക';

  @override
  String get original => 'ഒറിജിനൽ';

  @override
  String get changeDownloadLocation => 'ഡൗൺലോഡ് ലൊക്കേഷൻ മാറ്റുക';

  @override
  String get changeDownloadLocationDescription =>
      'പുതിയ ഡൗൺലോഡുകൾ തിരഞ്ഞെടുത്ത ഫോൾഡറിലേക്ക് സംരക്ഷിക്കപ്പെടും. നിലവിലുള്ള ഡൗൺലോഡുകൾ അവയുടെ നിലവിലെ ലൊക്കേഷനിൽ തന്നെ നിലനിൽക്കും, അവ സ്‌റ്റോറേജ് ക്രമീകരണങ്ങളിൽ നിന്ന് മാനേജ് ചെയ്യാനുമാകും.';

  @override
  String get confirm => 'സ്ഥിരീകരിക്കുക';

  @override
  String get cannotWriteToFolder =>
      'തിരഞ്ഞെടുത്ത ഫോൾഡറിലേക്ക് എഴുതാൻ കഴിയില്ല. ദയവായി മറ്റൊരു ലൊക്കേഷൻ തിരഞ്ഞെടുക്കുക അല്ലെങ്കിൽ സംഭരണ ​​അനുമതികൾ നൽകുക.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'ഡൗൺലോഡ് ഫോൾഡറിലേക്ക് സംരക്ഷിക്കണോ?';

  @override
  String get saveToDownloadsFolderDescription =>
      'ഡൗൺലോഡ് ചെയ്‌ത മീഡിയ നിങ്ങളുടെ ഉപകരണത്തിലെ ഡൗൺലോഡുകൾ/Moonfin എന്നതിലേക്ക് സംരക്ഷിക്കപ്പെടും. നിങ്ങളുടെ ഗാലറി അല്ലെങ്കിൽ മ്യൂസിക് പ്ലെയർ പോലുള്ള മറ്റ് ആപ്പുകൾക്ക് ഈ ഫയലുകൾ ദൃശ്യമാകും.\n\nനിലവിലുള്ള ഡൗൺലോഡുകൾ അവയുടെ നിലവിലെ ലൊക്കേഷനിൽ തന്നെ നിലനിൽക്കും.';

  @override
  String get enable => 'പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get clearAllDownloadsWarning =>
      'ഇത് ഡൗൺലോഡ് ചെയ്ത എല്ലാ മീഡിയയും ഇല്ലാതാക്കും, പഴയപടിയാക്കാനാകില്ല.';

  @override
  String get clearAll => 'എല്ലാം മായ്‌ക്കുക';

  @override
  String get navigationStyle => 'നാവിഗേഷൻ ശൈലി';

  @override
  String get topBar => 'മുകളിലെ ബാർ';

  @override
  String get leftSidebar => 'ഇടത് സൈഡ്‌ബാർ';

  @override
  String get showShuffleButton => 'ഷഫിൾ ബട്ടൺ കാണിക്കുക';

  @override
  String get showGenresButton => 'ജനറസ് ബട്ടൺ കാണിക്കുക';

  @override
  String get showFavoritesButton => 'പ്രിയപ്പെട്ടവ ബട്ടൺ കാണിക്കുക';

  @override
  String get showLibrariesInToolbar => 'ടൂൾബാറിൽ ലൈബ്രറികൾ കാണിക്കുക';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => 'നവബാർ അതാര്യത';

  @override
  String get navbarColor => 'നവബാർ നിറം';

  @override
  String get gray => 'ചാരനിറം';

  @override
  String get darkBlue => 'കടും നീല';

  @override
  String get purple => 'പർപ്പിൾ';

  @override
  String get teal => 'ടീൽ';

  @override
  String get navy => 'നാവികസേന';

  @override
  String get charcoal => 'കരി';

  @override
  String get brown => 'തവിട്ട്';

  @override
  String get darkRed => 'കടും ചുവപ്പ്';

  @override
  String get darkGreen => 'ഇരുണ്ട പച്ച';

  @override
  String get slate => 'സ്ലേറ്റ്';

  @override
  String get indigo => 'ഇൻഡിഗോ';

  @override
  String get libraryDisplay => 'ലൈബ്രറി ഡിസ്പ്ലേ';

  @override
  String get posterLabel => 'പോസ്റ്റർ';

  @override
  String get thumbnailLabel => 'ലഘുചിത്രം';

  @override
  String get bannerLabel => 'ബാനർ';

  @override
  String get overridePerLibrarySettings =>
      'ഓരോ-ലൈബ്രറി ക്രമീകരണങ്ങളും അസാധുവാക്കുക';

  @override
  String get applyImageTypeToAllLibraries =>
      'എല്ലാ ലൈബ്രറികളിലും ഇമേജ് തരം പ്രയോഗിക്കുക';

  @override
  String get multiServerLibraries => 'മൾട്ടി-സെർവർ ലൈബ്രറികൾ';

  @override
  String get showLibrariesFromAllServers =>
      'ബന്ധിപ്പിച്ച എല്ലാ സെർവറുകളിൽ നിന്നും ലൈബ്രറികൾ കാണിക്കുക';

  @override
  String get enableFolderView => 'ഫോൾഡർ കാഴ്ച പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get showFolderBrowsingOption => 'ഫോൾഡർ ബ്രൗസിംഗ് ഓപ്ഷൻ കാണിക്കുക';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'ലൈബ്രറി ദൃശ്യപരത';

  @override
  String get libraryVisibilityDescription =>
      'ഓരോ ലൈബ്രറിയിലും ഹോം പേജ് ദൃശ്യപരത ടോഗിൾ ചെയ്യുക. മാറ്റങ്ങൾ പ്രാബല്യത്തിൽ വരാൻ Moonfin പുനരാരംഭിക്കുക.';

  @override
  String get showInNavigation => 'നാവിഗേഷനിൽ കാണിക്കുക';

  @override
  String get showInLatestMedia => 'ഏറ്റവും പുതിയ മീഡിയയിൽ കാണിക്കുക';

  @override
  String get sourceLibraries => 'ഉറവിട ലൈബ്രറികൾ';

  @override
  String get sourceCollections => 'ഉറവിട ശേഖരങ്ങൾ';

  @override
  String get excludedGenres => 'ഒഴിവാക്കിയ വിഭാഗങ്ങൾ';

  @override
  String get selectAll => 'എല്ലാം തിരഞ്ഞെടുക്കുക';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'മീഡിയ ബാർ';

  @override
  String get mediaSources => 'മാധ്യമ സ്രോതസ്സുകൾ';

  @override
  String get behavior => 'പെരുമാറ്റം';

  @override
  String get seconds => 'സെക്കൻ്റുകൾ';

  @override
  String get localPreviews => 'പ്രാദേശിക പ്രിവ്യൂകൾ';

  @override
  String get localPreviewsDescription =>
      'ട്രെയിലർ, മീഡിയ, ഓഡിയോ പ്രിവ്യൂ എന്നിവ കോൺഫിഗർ ചെയ്യുക.';

  @override
  String get mediaBarMode => 'മീഡിയ ബാർ ശൈലി';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD എന്നിവയ്ക്കിടയിൽ തിരഞ്ഞെടുക്കുക അല്ലെങ്കിൽ മീഡിയ ബാർ ഓഫാക്കുക';

  @override
  String get mediaBarModeMoonfin => 'മൂൺഫിൻ';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'ഓഫ്';

  @override
  String get enableMediaBar => 'മീഡിയ ബാർ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get showFeaturedContentSlideshow =>
      'ഹോമിൽ ഫീച്ചർ ചെയ്‌ത ഉള്ളടക്ക സ്ലൈഡ്‌ഷോ കാണിക്കുക';

  @override
  String get contentType => 'ഉള്ളടക്ക തരം';

  @override
  String get moviesAndTvShows => 'സിനിമകളും ടിവി ഷോകളും';

  @override
  String get moviesOnly => 'സിനിമകൾ മാത്രം';

  @override
  String get tvShowsOnly => 'ടിവി ഷോകൾ മാത്രം';

  @override
  String get itemCount => 'ഇനങ്ങളുടെ എണ്ണം';

  @override
  String get noneSelected => 'ഒന്നും തിരഞ്ഞെടുത്തില്ല';

  @override
  String get noneExcluded => 'ആരും ഒഴിവാക്കിയിട്ടില്ല';

  @override
  String get autoAdvance => 'ഓട്ടോ അഡ്വാൻസ്';

  @override
  String get autoAdvanceSlides => 'അടുത്ത സ്ലൈഡിലേക്ക് സ്വയമേവ മുന്നേറുക';

  @override
  String get autoAdvanceInterval => 'ഓട്ടോ അഡ്വാൻസ് ഇടവേള';

  @override
  String get trailerPreview => 'ട്രെയിലർ പ്രിവ്യൂ';

  @override
  String get autoPlayTrailers =>
      '3 സെക്കൻഡിന് ശേഷം മീഡിയ ബാറിൽ ട്രെയിലറുകൾ സ്വയമേവ പ്ലേ ചെയ്യുക';

  @override
  String get episodePreview => 'എപ്പിസോഡ് പ്രിവ്യൂ';

  @override
  String get mediaPreview => 'മീഡിയ പ്രിവ്യൂ';

  @override
  String get episodePreviewDescription =>
      'ഫോക്കസ് ചെയ്‌തതോ ഹോവർ ചെയ്‌തതോ ദീർഘനേരം അമർത്തിപ്പിടിച്ചതോ ആയ കാർഡുകളിൽ 30 സെക്കൻഡ് ഇൻലൈൻ പ്രിവ്യൂ പ്ലേ ചെയ്യുക';

  @override
  String get mediaPreviewDescription =>
      'ഫോക്കസ് ചെയ്‌തതോ ഹോവർ ചെയ്‌തതോ ദീർഘനേരം അമർത്തിപ്പിടിച്ചതോ ആയ കാർഡുകളിൽ 30 സെക്കൻഡ് ഇൻലൈൻ പ്രിവ്യൂ പ്ലേ ചെയ്യുക';

  @override
  String get previewAudio => 'പ്രിവ്യൂ ഓഡിയോ';

  @override
  String get enablePreviewAudio =>
      'ട്രെയിലറിനും എപ്പിസോഡ് പ്രിവ്യൂവിനും ഓഡിയോ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get latestMedia => 'ഏറ്റവും പുതിയ മീഡിയ';

  @override
  String get recentlyReleased => 'അടുത്തിടെ പുറത്തിറങ്ങിയത്';

  @override
  String get myMedia => 'എൻ്റെ മീഡിയ';

  @override
  String get myMediaSmall => 'എൻ്റെ മീഡിയ (ചെറിയ)';

  @override
  String get continueWatching => 'കാണുന്നത് തുടരുക';

  @override
  String get resumeAudio => 'ഓഡിയോ പുനരാരംഭിക്കുക';

  @override
  String get resumeBooks => 'പുസ്തകങ്ങൾ പുനരാരംഭിക്കുക';

  @override
  String get activeRecordings => 'സജീവമായ റെക്കോർഡിംഗുകൾ';

  @override
  String get playlists => 'പ്ലേലിസ്റ്റുകൾ';

  @override
  String get liveTV => 'ലൈവ് ടി.വി';

  @override
  String get homeSections => 'ഹോം വിഭാഗങ്ങൾ';

  @override
  String get resetToDefaults => 'സ്ഥിരസ്ഥിതികളിലേക്ക് പുനഃസജ്ജമാക്കുക';

  @override
  String get homeRowPosterSize => 'ഹോം റോ പോസ്റ്റർ വലിപ്പം';

  @override
  String get perRowImageTypeSelection => 'ഓരോ വരി ചിത്ര തരം തിരഞ്ഞെടുക്കൽ';

  @override
  String get configureImageTypeForEachRow =>
      'പ്രവർത്തനക്ഷമമാക്കിയ ഓരോ ഹോം റോയ്‌ക്കും ഇമേജ് തരം കോൺഫിഗർ ചെയ്യുക';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'കാണൽ തുടരുക, അടുത്തത് എന്നിവ ലയിപ്പിക്കുക';

  @override
  String get combineBothRows =>
      'രണ്ട് വരികളും ഒരു ഹോം വിഭാഗത്തിലേക്ക് സംയോജിപ്പിക്കുക';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'ഓരോ വരി ചിത്ര തരം';

  @override
  String get perRowSettings => 'ഓരോ-വരി ക്രമീകരണങ്ങൾ';

  @override
  String get autoLogin => 'യാന്ത്രിക ലോഗിൻ';

  @override
  String get lastUser => 'അവസാന ഉപയോക്താവ്';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => 'എപ്പോഴും പ്രാമാണീകരിക്കുക';

  @override
  String get requirePasswordWithToken =>
      'സംഭരിച്ച ടോക്കണിനൊപ്പം പോലും പാസ്‌വേഡ് ആവശ്യമാണ്';

  @override
  String get confirmExit => 'പുറത്തുകടക്കുക സ്ഥിരീകരിക്കുക';

  @override
  String get showConfirmationBeforeExiting =>
      'പുറത്തുകടക്കുന്നതിന് മുമ്പ് സ്ഥിരീകരണം കാണിക്കുക';

  @override
  String get blockContentWithRatings =>
      'ഇനിപ്പറയുന്ന റേറ്റിംഗുകൾ ഉള്ള ഉള്ളടക്കം തടയുക:';

  @override
  String get noContentRatingsFound =>
      'ഈ സെർവറിൽ ഇതുവരെ ഉള്ളടക്ക റേറ്റിംഗുകളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get couldNotLoadServerRatings =>
      'സെർവർ റേറ്റിംഗുകൾ ലോഡ് ചെയ്യാനായില്ല. സംരക്ഷിച്ച റേറ്റിംഗുകൾ മാത്രം കാണിക്കുന്നു.';

  @override
  String get couldNotRefreshRatings =>
      'സെർവറിൽ നിന്ന് റേറ്റിംഗുകൾ പുതുക്കാൻ കഴിഞ്ഞില്ല. സംരക്ഷിച്ച റേറ്റിംഗുകൾ കാണിക്കുന്നു.';

  @override
  String get enablePinCode => 'പിൻ കോഡ് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get requirePinToAccess =>
      'നിങ്ങളുടെ അക്കൗണ്ട് ആക്‌സസ് ചെയ്യാൻ ഒരു പിൻ ആവശ്യമാണ്';

  @override
  String get changePin => 'പിൻ മാറ്റുക';

  @override
  String get setNewPinCode => 'ഒരു പുതിയ പിൻ കോഡ് സജ്ജീകരിക്കുക';

  @override
  String get removePin => 'പിൻ നീക്കം ചെയ്യുക';

  @override
  String get removePinProtection => 'പിൻ കോഡ് പരിരക്ഷ നീക്കം ചെയ്യുക';

  @override
  String get screensaver => 'സ്ക്രീൻ സേവർ';

  @override
  String get inAppScreensaver => 'ഇൻ-ആപ്പ് സ്ക്രീൻസേവർ';

  @override
  String get enableBuiltInScreensaver =>
      'അന്തർനിർമ്മിത സ്ക്രീൻസേവർ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get mode => 'മോഡ്';

  @override
  String get libraryArt => 'ലൈബ്രറി ആർട്ട്';

  @override
  String get logo => 'ലോഗോ';

  @override
  String get clock => 'ക്ലോക്ക്';

  @override
  String get timeout => 'ടൈം ഔട്ട്';

  @override
  String minutesShort(int minutes) {
    return '$minutes മിനിറ്റ്';
  }

  @override
  String get dimmingLevel => 'ഡിമ്മിംഗ് ലെവൽ';

  @override
  String get maxAgeRating => 'പരമാവധി പ്രായ റേറ്റിംഗ്';

  @override
  String get any => 'ഏതെങ്കിലും';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'പ്രായ റേറ്റിംഗ് ആവശ്യമാണ്';

  @override
  String get onlyShowRatedContent => 'റേറ്റുചെയ്ത ഉള്ളടക്കം മാത്രം കാണിക്കുക';

  @override
  String get showClock => 'ക്ലോക്ക് കാണിക്കുക';

  @override
  String get displayClockDuringScreensaver =>
      'സ്ക്രീൻസേവർ സമയത്ത് ക്ലോക്ക് പ്രദർശിപ്പിക്കുക';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'റോട്ടൻ തക്കാളി (വിമർശകർ)';

  @override
  String get rottenTomatoesAudience => 'റോട്ടൻ തക്കാളി (പ്രേക്ഷകർ)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'ടിഎംഡിബി';

  @override
  String get metacritic => 'മെറ്റാക്രിറ്റിക്';

  @override
  String get metacriticUser => 'മെറ്റാക്രിറ്റിക് (ഉപയോക്താവ്)';

  @override
  String get trakt => 'ട്രാക്റ്റ്';

  @override
  String get letterboxd => 'ലെറ്റർബോക്സ്ഡ്';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'അനിലിസ്റ്റ്';

  @override
  String get communityRating => 'കമ്മ്യൂണിറ്റി റേറ്റിംഗ്';

  @override
  String get ratings => 'റേറ്റിംഗുകൾ';

  @override
  String get additionalRatings => 'അധിക റേറ്റിംഗുകൾ';

  @override
  String get showMdbListAndTmdbRatings => 'MDBList, TMDB റേറ്റിംഗുകൾ കാണിക്കുക';

  @override
  String get ratingLabels => 'റേറ്റിംഗ് ലേബലുകൾ';

  @override
  String get showLabelsNextToIcons =>
      'റേറ്റിംഗ് ഐക്കണുകൾക്ക് അടുത്തുള്ള ലേബലുകൾ കാണിക്കുക';

  @override
  String get ratingBadges => 'റേറ്റിംഗ് ബാഡ്ജുകൾ';

  @override
  String get showDecorativeBadges =>
      'റേറ്റിംഗുകൾക്ക് പിന്നിൽ അലങ്കാര ബാഡ്ജുകൾ കാണിക്കുക';

  @override
  String get episodeRatings => 'എപ്പിസോഡ് റേറ്റിംഗുകൾ';

  @override
  String get showRatingsOnEpisodes =>
      'വ്യക്തിഗത എപ്പിസോഡുകളിൽ റേറ്റിംഗുകൾ കാണിക്കുക';

  @override
  String get ratingSources => 'റേറ്റിംഗ് ഉറവിടങ്ങൾ';

  @override
  String get ratingSourcesDescription =>
      'ആപ്പിലുടനീളം കാണിച്ചിരിക്കുന്ന റേറ്റിംഗ് ഉറവിടങ്ങൾ പ്രവർത്തനക്ഷമമാക്കുകയും പുനഃക്രമീകരിക്കുകയും ചെയ്യുക';

  @override
  String get pluginLabel => 'പ്ലഗിൻ';

  @override
  String get pluginDetected => 'പ്ലഗിൻ കണ്ടെത്തി';

  @override
  String get pluginNotDetected => 'പ്ലഗിൻ കണ്ടെത്തിയില്ല';

  @override
  String get pluginDetectedDescription =>
      'സെർവർ പ്ലഗിൻ കണ്ടെത്തി. ആദ്യമായി പ്ലഗിൻ കണ്ടെത്തുമ്പോൾ സമന്വയം സ്വയമേവ പ്രവർത്തനക്ഷമമാകും.';

  @override
  String get pluginNotDetectedDescription =>
      'സെർവർ പ്ലഗിൻ നിലവിൽ കണ്ടെത്തിയിട്ടില്ല. പ്രാദേശിക ക്രമീകരണങ്ങൾ ഇപ്പോഴും അവയുടെ സംരക്ഷിച്ച മൂല്യങ്ങളോ ബിൽറ്റ്-ഇൻ ഡിഫോൾട്ടുകളോ ഉപയോഗിക്കുന്നു.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nപതിപ്പ്: $version';
  }

  @override
  String get availableServices => 'ലഭ്യമായ സേവനങ്ങൾ';

  @override
  String get serverPluginSync => 'സെർവർ പ്ലഗിൻ സമന്വയം';

  @override
  String get syncSettingsWithPlugin =>
      'സെർവർ പ്ലഗിൻ ഉപയോഗിച്ച് ക്രമീകരണങ്ങൾ സമന്വയിപ്പിക്കുക';

  @override
  String get whatSyncControls => 'എന്ത് സമന്വയ നിയന്ത്രണങ്ങൾ';

  @override
  String get syncControlsDescription =>
      'പ്ലഗിൻ പിന്തുണയുള്ള ക്രമീകരണങ്ങൾ സെർവറിലേക്ക് തള്ളുകയും അതിൽ നിന്ന് വലിക്കുകയും ചെയ്യുന്നുണ്ടോ എന്ന് മാത്രമേ സമന്വയം നിയന്ത്രിക്കൂ. പ്ലഗിൻ സമന്വയം പ്രവർത്തനക്ഷമമാക്കുമ്പോൾ, പ്രൊഫൈൽ തിരഞ്ഞെടുക്കലും പ്രൊഫൈൽ സമന്വയ പ്രവർത്തനങ്ങളും ഇഷ്‌ടാനുസൃതമാക്കൽ ക്രമീകരണത്തിലാണ്.';

  @override
  String get recentRequests => 'സമീപകാല അഭ്യർത്ഥനകൾ';

  @override
  String get recentlyAdded => 'അടുത്തിടെ ചേർത്തത്';

  @override
  String get trending => 'ട്രെൻഡിംഗ്';

  @override
  String get popularMovies => 'ജനപ്രിയ സിനിമകൾ';

  @override
  String get movieGenres => 'സിനിമാ വിഭാഗങ്ങൾ';

  @override
  String get upcomingMovies => 'വരാനിരിക്കുന്ന സിനിമകൾ';

  @override
  String get studios => 'സ്റ്റുഡിയോകൾ';

  @override
  String get popularSeries => 'ജനപ്രിയ സീരീസ്';

  @override
  String get seriesGenres => 'സീരീസ് വിഭാഗങ്ങൾ';

  @override
  String get upcomingSeries => 'വരാനിരിക്കുന്ന സീരീസ്';

  @override
  String get networks => 'നെറ്റ്വർക്കുകൾ';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => 'വരികൾ ഡിഫോൾട്ടിലേക്ക് പുനഃസജ്ജമാക്കുക';

  @override
  String get enableSeerr => 'സീർ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get showSeerrInNavigation =>
      'നാവിഗേഷനിൽ സീർ കാണിക്കുക (സെർവർ പ്ലഗിൻ ആവശ്യമാണ്)';

  @override
  String get seerrUnavailable =>
      'സെർവർ പ്ലഗിൻ സീർ പിന്തുണ പ്രവർത്തനരഹിതമാക്കിയതിനാൽ ലഭ്യമല്ല.';

  @override
  String get nsfwFilter => 'NSFW ഫിൽട്ടർ';

  @override
  String get hideAdultContent =>
      'ഫലങ്ങളിൽ മുതിർന്നവർക്കുള്ള ഉള്ളടക്കം മറയ്ക്കുക';

  @override
  String loggedInAs(String username) {
    return 'ഇതായി ലോഗിൻ ചെയ്‌തു: $username';
  }

  @override
  String get discoverRows => 'വരികൾ കണ്ടെത്തുക';

  @override
  String get discoverRowsDescriptionPlugin =>
      'പുനഃക്രമീകരിക്കാൻ വലിച്ചിടുക. വരികൾ പ്രവർത്തനക്ഷമമാക്കുക അല്ലെങ്കിൽ പ്രവർത്തനരഹിതമാക്കുക. Moonfin പ്ലഗിനുമായി വരി ഓർഡർ സമന്വയം പ്രാപ്തമാക്കി.';

  @override
  String get discoverRowsDescription =>
      'പുനഃക്രമീകരിക്കാൻ വലിച്ചിടുക. വരികൾ പ്രവർത്തനക്ഷമമാക്കുക അല്ലെങ്കിൽ പ്രവർത്തനരഹിതമാക്കുക.';

  @override
  String get enabled => 'പ്രവർത്തനക്ഷമമാക്കി';

  @override
  String get hidden => 'മറച്ചിരിക്കുന്നു';

  @override
  String get aboutTitle => 'കുറിച്ച്';

  @override
  String versionValue(String version) {
    return 'പതിപ്പ് $version';
  }

  @override
  String get openSourceLicenses => 'ഓപ്പൺ സോഴ്സ് ലൈസൻസുകൾ';

  @override
  String get sourceCode => 'ഉറവിട കോഡ്';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'ഇപ്പോൾ അപ്ഡേറ്റുകൾ പരിശോധിക്കുക';

  @override
  String get checksLatestDesktopRelease =>
      'ഈ പ്ലാറ്റ്‌ഫോമിനായുള്ള ഏറ്റവും പുതിയ ഡെസ്‌ക്‌ടോപ്പ് റിലീസ് പരിശോധിക്കുന്നു';

  @override
  String get youAreUpToDate => 'നിങ്ങൾ കാലികമാണ്.';

  @override
  String get couldNotCheckForUpdates =>
      'ഇപ്പോൾ അപ്‌ഡേറ്റുകൾക്കായി പരിശോധിക്കാനായില്ല.';

  @override
  String get noCompatibleUpdate =>
      'ഈ പ്ലാറ്റ്‌ഫോമിന് അനുയോജ്യമായ അപ്‌ഡേറ്റ് പാക്കേജുകളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get updateChecksNotSupported =>
      'ഈ പ്ലാറ്റ്‌ഫോമിൽ അപ്‌ഡേറ്റ് പരിശോധനകൾ പിന്തുണയ്ക്കുന്നില്ല.';

  @override
  String get updateNotificationsDisabled =>
      'അപ്‌ഡേറ്റ് അറിയിപ്പുകൾ പ്രവർത്തനരഹിതമാക്കി.';

  @override
  String get pleaseWaitBeforeChecking =>
      'വീണ്ടും പരിശോധിക്കുന്നതിന് മുമ്പ് ദയവായി കാത്തിരിക്കുക.';

  @override
  String get latestUpdateAlreadyShown =>
      'ഏറ്റവും പുതിയ അപ്ഡേറ്റ് ഇതിനകം കാണിച്ചിട്ടുണ്ട്.';

  @override
  String get updateAvailable => 'അപ്ഡേറ്റ് ലഭ്യമാണ്.';

  @override
  String updateAvailableVersion(String version) {
    return 'അപ്‌ഡേറ്റ് ലഭ്യമാണ്: v$version';
  }

  @override
  String get updateNotifications => 'അറിയിപ്പുകൾ അപ്ഡേറ്റ് ചെയ്യുക';

  @override
  String get showWhenUpdatesAvailable => 'അപ്ഡേറ്റുകൾ ലഭ്യമാകുമ്പോൾ കാണിക്കുക';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version ലഭ്യമാണ്';
  }

  @override
  String get readReleaseNotes => 'റിലീസ് കുറിപ്പുകൾ വായിക്കുക';

  @override
  String get downloadingUpdate => 'അപ്‌ഡേറ്റ് ഡൗൺലോഡ് ചെയ്യുന്നു...';

  @override
  String get updateDownloadFailed =>
      'അപ്‌ഡേറ്റ് ഡൗൺലോഡ് പരാജയപ്പെട്ടു. ദയവായി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get openReleasesPage => 'റിലീസുകളുടെ പേജ് തുറക്കുക';

  @override
  String get navigation => 'നാവിഗേഷൻ';

  @override
  String get watchedIndicatorsBackdrops =>
      'സൂചകങ്ങൾ, ബാക്ക്‌ഡ്രോപ്പുകൾ നിരീക്ഷിച്ചു';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'ഫോക്കസ് കളർ, കണ്ട സൂചകങ്ങൾ, ബാക്ക്‌ഡ്രോപ്പുകൾ';

  @override
  String get navbarStyleToolbarAppearance =>
      'നവബാർ ശൈലി, ടൂൾബാർ ബട്ടണുകൾ, രൂപം';

  @override
  String get reorderToggleHomeRows =>
      'ഹോം വരികൾ പുനഃക്രമീകരിച്ച് ടോഗിൾ ചെയ്യുക';

  @override
  String get featuredContentAppearance => 'ഫീച്ചർ ചെയ്ത ഉള്ളടക്കം, രൂപം';

  @override
  String get posterSizeImageTypeFolderView =>
      'പോസ്റ്റർ വലുപ്പം, ചിത്രത്തിൻ്റെ തരം, ഫോൾഡർ കാഴ്ച';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB, റേറ്റിംഗ് ഉറവിടങ്ങൾ';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'ക്ലിയർ';

  @override
  String get browse => 'ബ്രൗസ് ചെയ്യുക';

  @override
  String get noResults => 'ഫലങ്ങളൊന്നുമില്ല';

  @override
  String get seerrAvailableStatus => 'ലഭ്യമാണ്';

  @override
  String get seerrRequestedStatus => 'അഭ്യർത്ഥിച്ചു';

  @override
  String itemsCount(int count) {
    return '$count ഇനങ്ങൾ';
  }

  @override
  String get seerrSettings => 'സീർ ക്രമീകരണങ്ങൾ';

  @override
  String get requestMore => 'കൂടുതൽ അഭ്യർത്ഥിക്കുക';

  @override
  String get request => 'അഭ്യർത്ഥിക്കുക';

  @override
  String get cancelRequest => 'അഭ്യർത്ഥന റദ്ദാക്കുക';

  @override
  String get playInMoonfin => 'Moonfin എന്നതിൽ പ്ലേ ചെയ്യുക';

  @override
  String requestedByName(String name) {
    return '$name അഭ്യർത്ഥിച്ചു';
  }

  @override
  String get approve => 'അംഗീകരിക്കുക';

  @override
  String get declineAction => 'നിരസിക്കുക';

  @override
  String get similar => 'സമാനമായ';

  @override
  String get recommendations => 'ശുപാർശകൾ';

  @override
  String cancelRequestForTitle(String title) {
    return '\"$title\" എന്നതിനായുള്ള അഭ്യർത്ഥന റദ്ദാക്കണോ?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" എന്നതിനായുള്ള $count അഭ്യർത്ഥനകൾ റദ്ദാക്കണോ?';
  }

  @override
  String get keep => 'സൂക്ഷിക്കുക';

  @override
  String get itemNotFoundInLibrary =>
      'നിങ്ങളുടെ Moonfin ലൈബ്രറിയിൽ ഇനം കണ്ടെത്തിയില്ല';

  @override
  String get errorSearchingLibrary => 'ലൈബ്രറി തിരയുന്നതിൽ പിശക്';

  @override
  String budgetAmount(String amount) {
    return 'ബജറ്റ്: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'വരുമാനം: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type അഭ്യർത്ഥിക്കുക';
  }

  @override
  String get submitRequest => 'അഭ്യർത്ഥന സമർപ്പിക്കുക';

  @override
  String get allSeasons => 'എല്ലാ സീസണുകളും';

  @override
  String get advancedOptions => 'വിപുലമായ ഓപ്ഷനുകൾ';

  @override
  String get noServiceServersConfigured =>
      'സേവന സെർവറുകളൊന്നും കോൺഫിഗർ ചെയ്തിട്ടില്ല';

  @override
  String get server => 'സെർവർ';

  @override
  String get qualityProfile => 'ഗുണമേന്മയുള്ള പ്രൊഫൈൽ';

  @override
  String get rootFolder => 'റൂട്ട് ഫോൾഡർ';

  @override
  String get showMore => 'കൂടുതൽ കാണിക്കുക';

  @override
  String get appearances => 'രൂപഭാവങ്ങൾ';

  @override
  String get crewSection => 'ക്രൂ';

  @override
  String ageValue(int age) {
    return 'പ്രായം $age';
  }

  @override
  String get noRequests => 'അഭ്യർത്ഥനകളൊന്നുമില്ല';

  @override
  String get pendingStatus => 'തീർപ്പാക്കാത്തത്';

  @override
  String get declinedStatus => 'നിരസിച്ചു';

  @override
  String get partiallyAvailable => 'ഭാഗികമായി ലഭ്യമാണ്';

  @override
  String get downloadingStatus => 'ഡൗൺലോഡ് ചെയ്യുന്നു';

  @override
  String get approvedStatus => 'അംഗീകരിച്ചു';

  @override
  String get notRequestedStatus => 'ആവശ്യപ്പെട്ടിട്ടില്ല';

  @override
  String get blocklistedStatus => 'ബ്ലോക്ക്‌ലിസ്റ്റ് ചെയ്‌തു';

  @override
  String get deletedStatus => 'ഇല്ലാതാക്കി';

  @override
  String get tmdbScore => 'TMDB സ്കോർ';

  @override
  String get releaseDateLabel => 'റിലീസ് തീയതി';

  @override
  String get firstAirDateLabel => 'ആദ്യ എയർ തീയതി';

  @override
  String get revenueLabel => 'വരുമാനം';

  @override
  String get runtimeLabel => 'പ്രവർത്തനസമയം';

  @override
  String get budgetLabel => 'ബജറ്റ്';

  @override
  String get originalLanguageLabel => 'യഥാർത്ഥ ഭാഷ';

  @override
  String get seasonsLabel => 'സീസണുകൾ';

  @override
  String get episodesLabel => 'എപ്പിസോഡുകൾ';

  @override
  String get access => 'പ്രവേശനം';

  @override
  String get add => 'ചേർക്കുക';

  @override
  String get address => 'വിലാസം';

  @override
  String get analytics => 'അനലിറ്റിക്സ്';

  @override
  String get catalog => 'കാറ്റലോഗ്';

  @override
  String get content => 'ഉള്ളടക്കം';

  @override
  String get copy => 'പകർത്തുക';

  @override
  String get create => 'സൃഷ്ടിക്കുക';

  @override
  String get disable => 'പ്രവർത്തനരഹിതമാക്കുക';

  @override
  String get done => 'ചെയ്തു';

  @override
  String get edit => 'എഡിറ്റ് ചെയ്യുക';

  @override
  String get encoding => 'എൻകോഡിംഗ്';

  @override
  String get error => 'പിശക്';

  @override
  String get forward => 'മുന്നോട്ട്';

  @override
  String get general => 'ജനറൽ';

  @override
  String get go => 'പോകൂ';

  @override
  String get install => 'ഇൻസ്റ്റാൾ ചെയ്യുക';

  @override
  String get installed => 'ഇൻസ്റ്റാൾ ചെയ്തു';

  @override
  String get interval => 'ഇടവേള';

  @override
  String get name => 'പേര്';

  @override
  String get networking => 'നെറ്റ്വർക്കിംഗ്';

  @override
  String get next => 'അടുത്തത്';

  @override
  String get path => 'പാത';

  @override
  String get paused => 'താൽക്കാലികമായി നിർത്തി';

  @override
  String get permissions => 'അനുമതികൾ';

  @override
  String get processing => 'പ്രോസസ്സിംഗ്';

  @override
  String get profile => 'പ്രൊഫൈൽ';

  @override
  String get provider => 'ദാതാവ്';

  @override
  String get refresh => 'പുതുക്കുക';

  @override
  String get remote => 'റിമോട്ട്';

  @override
  String get rename => 'പേരുമാറ്റുക';

  @override
  String get revoke => 'അസാധുവാക്കുക';

  @override
  String get role => 'പങ്ക്';

  @override
  String get root => 'റൂട്ട്';

  @override
  String get run => 'ഓടുക';

  @override
  String get search => 'തിരയുക';

  @override
  String get select => 'തിരഞ്ഞെടുക്കുക';

  @override
  String get send => 'അയക്കുക';

  @override
  String get sessions => 'സെഷനുകൾ';

  @override
  String get set => 'സജ്ജമാക്കുക';

  @override
  String get status => 'നില';

  @override
  String get stop => 'നിർത്തുക';

  @override
  String get streaming => 'സ്ട്രീമിംഗ്';

  @override
  String get time => 'സമയം';

  @override
  String get trickplay => 'ട്രിക്ക്പ്ലേ';

  @override
  String get uninstall => 'അൺഇൻസ്റ്റാൾ ചെയ്യുക';

  @override
  String get up => 'മുകളിലേക്ക്';

  @override
  String get update => 'അപ്ഡേറ്റ്';

  @override
  String get upload => 'അപ്‌ലോഡ് ചെയ്യുക';

  @override
  String get unmute => 'അൺമ്യൂട്ട് ചെയ്യുക';

  @override
  String get mute => 'നിശബ്ദമാക്കുക';

  @override
  String get branding => 'ബ്രാൻഡിംഗ്';

  @override
  String get adminDrawerDashboard => 'ഡാഷ്ബോർഡ്';

  @override
  String get adminDrawerAnalytics => 'അനലിറ്റിക്സ്';

  @override
  String get adminDrawerSettings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get adminDrawerBranding => 'ബ്രാൻഡിംഗ്';

  @override
  String get adminDrawerUsers => 'ഉപയോക്താക്കൾ';

  @override
  String get adminDrawerLibraries => 'ലൈബ്രറികൾ';

  @override
  String get adminDrawerTranscoding => 'ട്രാൻസ്കോഡിംഗ്';

  @override
  String get adminDrawerResume => 'പുനരാരംഭിക്കുക';

  @override
  String get adminDrawerStreaming => 'സ്ട്രീമിംഗ്';

  @override
  String get adminDrawerTrickplay => 'ട്രിക്ക്പ്ലേ';

  @override
  String get adminDrawerDevices => 'ഉപകരണങ്ങൾ';

  @override
  String get adminDrawerActivity => 'പ്രവർത്തനം';

  @override
  String get adminDrawerNetworking => 'നെറ്റ്വർക്കിംഗ്';

  @override
  String get adminDrawerApiKeys => 'API കീകൾ';

  @override
  String get adminDrawerBackups => 'ബാക്കപ്പുകൾ';

  @override
  String get adminDrawerLogs => 'രേഖകൾ';

  @override
  String get adminDrawerScheduledTasks => 'ഷെഡ്യൂൾ ചെയ്ത ജോലികൾ';

  @override
  String get adminDrawerPlugins => 'പ്ലഗിനുകൾ';

  @override
  String get adminDrawerRepositories => 'ശേഖരങ്ങൾ';

  @override
  String get adminDrawerLiveTv => 'ലൈവ് ടി.വി';

  @override
  String get adminExitTooltip => 'അഡ്മിൻ പുറത്തുകടക്കുക';

  @override
  String get adminDashboardLoadFailed =>
      'ഡാഷ്‌ബോർഡ് ലോഡുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminMediaOverview => 'മീഡിയ അവലോകനം';

  @override
  String get adminMediaTotalsError =>
      'സെർവർ മീഡിയ ടോട്ടലുകൾ ലോഡ് ചെയ്യാനായില്ല.';

  @override
  String get adminMediaOverviewSubtitle =>
      'ഈ സെർവറിൽ എത്രമാത്രം ഉള്ളടക്കം ഉണ്ടെന്ന് ഒരു പെട്ടെന്നുള്ള വായന.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'പ്ലഗിൻ അപ്‌ഡേറ്റുകൾ ലഭ്യമാണ്: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'പുനരാരംഭിക്കേണ്ട പ്ലഗിനുകൾ: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'ഷെഡ്യൂൾ ചെയ്ത ജോലികൾ പരാജയപ്പെട്ടു: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'സമീപകാല മുന്നറിയിപ്പ്/പിശക് എൻട്രികൾ: $count';
  }

  @override
  String get analyticsMediaDistribution => 'മീഡിയ വിതരണം';

  @override
  String get analyticsVideoCodecs => 'വീഡിയോ കോഡെക്കുകൾ';

  @override
  String get analyticsAudioCodecs => 'ഓഡിയോ കോഡെക്കുകൾ';

  @override
  String get analyticsContainers => 'കണ്ടെയ്നറുകൾ';

  @override
  String get analyticsTopGenres => 'മുൻനിര വിഭാഗങ്ങൾ';

  @override
  String get analyticsReleaseYears => 'റിലീസ് വർഷങ്ങൾ';

  @override
  String get analyticsContentRatings => 'ഉള്ളടക്ക റേറ്റിംഗുകൾ';

  @override
  String get analyticsRuntimeBuckets => 'റൺടൈം ബക്കറ്റുകൾ';

  @override
  String get analyticsFileFormats => 'ഫയൽ ഫോർമാറ്റുകൾ';

  @override
  String get analyticsNoData => 'ഡാറ്റ ലഭ്യമല്ല.';

  @override
  String get adminServerInfo => 'സെർവർ വിവരം';

  @override
  String get adminRestartPending =>
      'പുനരാരംഭിക്കുന്നത് തീർച്ചപ്പെടുത്തിയിട്ടില്ല';

  @override
  String get adminServerPaths => 'സെർവർ പാതകൾ';

  @override
  String get adminServerActions => 'സെർവർ പ്രവർത്തനങ്ങൾ';

  @override
  String get adminRestartServer => 'സെർവർ പുനരാരംഭിക്കുക';

  @override
  String get adminShutdownServer => 'ഷട്ട്ഡൗൺ സെർവർ';

  @override
  String get adminScanLibraries => 'ലൈബ്രറികൾ സ്കാൻ ചെയ്യുക';

  @override
  String get adminLibraryScanStarted => 'ലൈബ്രറി സ്കാൻ ആരംഭിച്ചു';

  @override
  String errorGeneric(String error) {
    return 'പിശക്: $error';
  }

  @override
  String get adminServerRebootInProgress => 'സെർവർ റീബൂട്ട് പുരോഗമിക്കുന്നു';

  @override
  String get adminServerRebootMessage =>
      'സെർവർ റീബൂട്ട് പുരോഗതിയിലാണ്, Moonfin പുനരാരംഭിക്കുക';

  @override
  String get adminActiveSessions => 'സജീവ സെഷനുകൾ';

  @override
  String get adminSessionsLoadFailed =>
      'സെഷനുകൾ ലോഡുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminNoActiveSessions => 'സജീവമായ സെഷനുകളൊന്നുമില്ല';

  @override
  String get adminRecentActivity => 'സമീപകാല പ്രവർത്തനം';

  @override
  String get adminNoRecentActivity => 'സമീപകാല പ്രവർത്തനങ്ങളൊന്നുമില്ല';

  @override
  String adminCommandFailed(String error) {
    return 'കമാൻഡ് പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminSendMessage => 'സന്ദേശം അയയ്‌ക്കുക';

  @override
  String get adminMessageTextHint => 'സന്ദേശ വാചകം';

  @override
  String get adminSetVolume => 'വോളിയം സജ്ജമാക്കുക';

  @override
  String get sessionPrev => 'മുൻ';

  @override
  String get sessionRewind => 'റിവൈൻഡ് ചെയ്യുക';

  @override
  String get sessionForward => 'മുന്നോട്ട്';

  @override
  String get sessionNext => 'അടുത്തത്';

  @override
  String get sessionVolumeDown => 'വാല്യം -';

  @override
  String get sessionVolumeUp => 'വാല്യം +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'ഇപ്പോൾ പ്ലേ ചെയ്യുന്നു';

  @override
  String get volume => 'വോളിയം';

  @override
  String get actions => 'പ്രവർത്തനങ്ങൾ';

  @override
  String get videoCodec => 'വീഡിയോ കോഡെക്';

  @override
  String get audioCodec => 'ഓഡിയോ കോഡെക്';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'പൂർത്തീകരണം';

  @override
  String get direct => 'നേരിട്ട്';

  @override
  String get adminDisconnect => 'വിച്ഛേദിക്കുക';

  @override
  String get adminClearDates => 'വ്യക്തമായ തീയതികൾ';

  @override
  String adminActivityLoadFailed(String error) {
    return 'പ്രവർത്തന ലോഗ് ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminNoActivityEntries => 'പ്രവർത്തന എൻട്രികളൊന്നുമില്ല';

  @override
  String get adminEditDeviceName => 'ഉപകരണത്തിൻ്റെ പേര് എഡിറ്റ് ചെയ്യുക';

  @override
  String get adminCustomName => 'ഇഷ്ടാനുസൃത നാമം';

  @override
  String get adminDeviceNameUpdated => 'ഉപകരണത്തിൻ്റെ പേര് അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'ഉപകരണം അപ്‌ഡേറ്റ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminDeleteDevice => 'ഉപകരണം ഇല്ലാതാക്കുക';

  @override
  String get adminDeviceDeleted => 'ഉപകരണം ഇല്ലാതാക്കി';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'ഉപകരണം ഇല്ലാതാക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminDevicesLoadFailed =>
      'ഉപകരണങ്ങൾ ലോഡുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminSearchDevices => 'ഉപകരണങ്ങൾ തിരയുക';

  @override
  String get adminThisDevice => 'ഈ ഉപകരണം';

  @override
  String get adminEditName => 'പേര് എഡിറ്റ് ചെയ്യുക';

  @override
  String get adminLibrariesLoadFailed =>
      'ലൈബ്രറികൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminNoLibraries => 'ലൈബ്രറികളൊന്നും ക്രമീകരിച്ചിട്ടില്ല';

  @override
  String get adminScanAllLibraries => 'എല്ലാ ലൈബ്രറികളും സ്കാൻ ചെയ്യുക';

  @override
  String get adminAddLibrary => 'ലൈബ്രറി ചേർക്കുക';

  @override
  String adminScanFailed(String error) {
    return 'സ്കാൻ ആരംഭിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminRenameLibrary => 'ലൈബ്രറിയുടെ പേര് മാറ്റുക';

  @override
  String get adminNewName => 'പുതിയ പേര്';

  @override
  String adminLibraryRenamed(String name) {
    return 'ലൈബ്രറി \"$name\" എന്ന് പുനർനാമകരണം ചെയ്തു';
  }

  @override
  String adminRenameFailed(String error) {
    return 'പേരുമാറ്റുന്നത് പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminDeleteLibrary => 'ലൈബ്രറി ഇല്ലാതാക്കുക';

  @override
  String adminLibraryDeleted(String name) {
    return 'ലൈബ്രറി \"$name\" ഇല്ലാതാക്കി';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'ലൈബ്രറി ഇല്ലാതാക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'പാത ചേർക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminRemovePath => 'പാത നീക്കം ചെയ്യുക';

  @override
  String adminRemovePathConfirm(String path) {
    return 'ഈ ലൈബ്രറിയിൽ നിന്ന് \"$path\" നീക്കം ചെയ്യണോ?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'പാത നീക്കം ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'ലൈബ്രറി ഓപ്ഷനുകൾ സംരക്ഷിച്ചു';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'ഓപ്ഷനുകൾ സംരക്ഷിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminLibraryLoadFailed =>
      'ലൈബ്രറി ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminNoMediaPaths => 'മീഡിയ പാതകളൊന്നും കോൺഫിഗർ ചെയ്തിട്ടില്ല';

  @override
  String get adminAddPath => 'പാത ചേർക്കുക';

  @override
  String get adminBrowseFilesystem => 'സെർവർ ഫയൽസിസ്റ്റം ബ്രൗസ് ചെയ്യുക:';

  @override
  String get adminSaveOptions => 'ഓപ്ഷനുകൾ സംരക്ഷിക്കുക';

  @override
  String get adminPreferredMetadataLanguage => 'തിരഞ്ഞെടുത്ത മെറ്റാഡാറ്റ ഭാഷ';

  @override
  String get adminMetadataLanguageHint => 'ഉദാ. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'മെറ്റാഡാറ്റ രാജ്യ കോഡ്';

  @override
  String get adminMetadataCountryHint => 'ഉദാ. യുഎസ്, ഡിഇ, എഫ്ആർ';

  @override
  String get adminLibraryNameRequired => 'ലൈബ്രറിയുടെ പേര് ആവശ്യമാണ്';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'ലൈബ്രറി സൃഷ്ടിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminLibraryName => 'ലൈബ്രറിയുടെ പേര്';

  @override
  String get adminSelectedPaths => 'തിരഞ്ഞെടുത്ത പാതകൾ:';

  @override
  String get adminNoPathsAdded =>
      'പാതകളൊന്നും ചേർത്തിട്ടില്ല (പിന്നീട് ചേർക്കാവുന്നതാണ്)';

  @override
  String get adminCreateLibrary => 'ലൈബ്രറി സൃഷ്ടിക്കുക';

  @override
  String get paths => 'പാതകൾ:';

  @override
  String get adminDisableUser => 'ഉപയോക്താവിനെ പ്രവർത്തനരഹിതമാക്കുക';

  @override
  String get adminEnableUser => 'ഉപയോക്താവിനെ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name പ്രവർത്തനരഹിതമാക്കണോ? അവർക്ക് സൈൻ ഇൻ ചെയ്യാൻ കഴിയില്ല.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name പ്രവർത്തനക്ഷമമാക്കണോ? അവർക്ക് വീണ്ടും സൈൻ ഇൻ ചെയ്യാൻ കഴിയും.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'ഉപയോക്താവ് \"$name\" പ്രവർത്തനരഹിതമാക്കി';
  }

  @override
  String adminUserEnabled(String name) {
    return 'ഉപയോക്താവ് \"$name\" പ്രവർത്തനക്ഷമമാക്കി';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'ഉപയോക്തൃ നയം അപ്ഡേറ്റ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminUsersLoadFailed =>
      'ഉപയോക്താക്കളെ ലോഡുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminSearchUsers => 'ഉപയോക്താക്കളെ തിരയുക';

  @override
  String get adminEditUser => 'ഉപയോക്താവിനെ എഡിറ്റ് ചെയ്യുക';

  @override
  String get adminAddUser => 'ഉപയോക്താവിനെ ചേർക്കുക';

  @override
  String adminUserCreateFailed(String error) {
    return 'ഉപയോക്താവിനെ സൃഷ്ടിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminCreateUser => 'ഉപയോക്താവിനെ സൃഷ്ടിക്കുക';

  @override
  String get adminPasswordOptional => 'പാസ്‌വേഡ് (ഓപ്ഷണൽ)';

  @override
  String get adminUsernameRequired => 'ഉപയോക്തൃനാമം ശൂന്യമാക്കാൻ കഴിയില്ല';

  @override
  String get adminNoProfileChanges =>
      'സംരക്ഷിക്കാൻ പ്രൊഫൈൽ മാറ്റങ്ങളൊന്നുമില്ല';

  @override
  String get adminProfileSaved => 'പ്രൊഫൈൽ സംരക്ഷിച്ചു';

  @override
  String adminSaveFailed(String error) {
    return 'സംരക്ഷിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminPermissionsSaved => 'അനുമതികൾ സംരക്ഷിച്ചു';

  @override
  String get adminPasswordsMismatch => 'പാസ്‌വേഡുകൾ പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String adminFailed(String error) {
    return 'പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminUserLoadFailed =>
      'ഉപയോക്താവിനെ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminBackToUsers => 'ഉപയോക്താക്കളിലേക്ക് മടങ്ങുക';

  @override
  String get adminSaveProfile => 'പ്രൊഫൈൽ സംരക്ഷിക്കുക';

  @override
  String get adminDeleteUser => 'ഉപയോക്താവിനെ ഇല്ലാതാക്കുക';

  @override
  String get admin => 'അഡ്മിൻ';

  @override
  String get adminFullAccessWarning =>
      'അഡ്മിനിസ്ട്രേറ്റർക്ക് സെർവറിലേക്ക് പൂർണ്ണമായ ആക്സസ് ഉണ്ട്. ജാഗ്രതയോടെ നൽകുക.';

  @override
  String get administrator => 'കാര്യനിർവാഹകൻ';

  @override
  String get adminHiddenUser => 'മറഞ്ഞിരിക്കുന്ന ഉപയോക്താവ്';

  @override
  String get adminAllowMediaPlayback => 'മീഡിയ പ്ലേബാക്ക് അനുവദിക്കുക';

  @override
  String get adminAllowAudioTranscoding => 'ഓഡിയോ ട്രാൻസ്കോഡിംഗ് അനുവദിക്കുക';

  @override
  String get adminAllowVideoTranscoding => 'വീഡിയോ ട്രാൻസ്‌കോഡിംഗ് അനുവദിക്കുക';

  @override
  String get adminAllowRemuxing => 'റീമുക്സിംഗ് അനുവദിക്കുക';

  @override
  String get adminForceRemoteTranscoding =>
      'വിദൂര ഉറവിട ട്രാൻസ്‌കോഡിംഗ് നിർബന്ധമാക്കുക';

  @override
  String get adminAllowContentDeletion => 'ഉള്ളടക്കം ഇല്ലാതാക്കാൻ അനുവദിക്കുക';

  @override
  String get adminAllowContentDownloading =>
      'ഉള്ളടക്കം ഡൗൺലോഡ് ചെയ്യാൻ അനുവദിക്കുക';

  @override
  String get adminAllowPublicSharing => 'പൊതു പങ്കിടൽ അനുവദിക്കുക';

  @override
  String get adminAllowRemoteControl =>
      'മറ്റ് ഉപയോക്താക്കളുടെ വിദൂര നിയന്ത്രണം അനുവദിക്കുക';

  @override
  String get adminAllowSharedDeviceControl =>
      'പങ്കിട്ട ഉപകരണ നിയന്ത്രണം അനുവദിക്കുക';

  @override
  String get adminAllowRemoteAccess => 'വിദൂര ആക്സസ് അനുവദിക്കുക';

  @override
  String get adminRemoteBitrateLimit =>
      'റിമോട്ട് ക്ലയൻ്റ് ബിറ്റ്റേറ്റ് പരിധി (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'പരിധിയില്ലാതെ ശൂന്യമായി വിടുക';

  @override
  String get adminMaxActiveSessions => 'പരമാവധി സജീവമായ സെഷനുകൾ';

  @override
  String get adminAllowLiveTvAccess => 'ലൈവ് ടിവി ആക്‌സസ് അനുവദിക്കുക';

  @override
  String get adminAllowLiveTvManagement =>
      'ലൈവ് ടിവി മാനേജ്‌മെൻ്റ് അനുവദിക്കുക';

  @override
  String get adminAllowCollectionManagement => 'ശേഖരണ മാനേജ്മെൻ്റ് അനുവദിക്കുക';

  @override
  String get adminAllowSubtitleManagement =>
      'സബ്ടൈറ്റിൽ മാനേജ്മെൻ്റ് അനുവദിക്കുക';

  @override
  String get adminAllowLyricManagement => 'ഗാനരചന നിയന്ത്രിക്കാൻ അനുവദിക്കുക';

  @override
  String get adminSavePermissions => 'അനുമതികൾ സംരക്ഷിക്കുക';

  @override
  String get adminEnableAllLibraryAccess =>
      'എല്ലാ ലൈബ്രറികളിലേക്കും പ്രവേശനം പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminSaveAccess => 'ആക്സസ് സംരക്ഷിക്കുക';

  @override
  String get adminChangePassword => 'പാസ്വേഡ് മാറ്റുക';

  @override
  String get adminNewPassword => 'പുതിയ പാസ്വേഡ്';

  @override
  String get adminConfirmPassword => 'പാസ്വേഡ് സ്ഥിരീകരിക്കുക';

  @override
  String get adminSetPassword => 'പാസ്‌വേഡ് സജ്ജമാക്കുക';

  @override
  String get adminResetPassword => 'പാസ്‌വേഡ് പുനഃസജ്ജമാക്കുക';

  @override
  String get adminPasswordReset => 'പാസ്‌വേഡ് റീസെറ്റ്';

  @override
  String get adminPasswordUpdated => 'പാസ്‌വേഡ് അപ്‌ഡേറ്റ് ചെയ്‌തു';

  @override
  String get adminUserSettings => 'ഉപയോക്തൃ ക്രമീകരണങ്ങൾ';

  @override
  String get adminLibraryAccess => 'ലൈബ്രറി പ്രവേശനം';

  @override
  String get adminDeviceAndChannelAccess => 'ഉപകരണവും ചാനൽ ആക്‌സസ്സും';

  @override
  String get adminEnableAllDevices =>
      'എല്ലാ ഉപകരണങ്ങളിലേക്കും ആക്‌സസ് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminEnableAllChannels =>
      'എല്ലാ ചാനലുകളിലേക്കും ആക്സസ് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminResetPasswordWarning =>
      'ഇത് പാസ്‌വേഡ് നീക്കം ചെയ്യും. പാസ്‌വേഡ് ഇല്ലാതെ തന്നെ ഉപയോക്താവിന് ലോഗിൻ ചെയ്യാൻ സാധിക്കും.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'സെർവർ HTTP തിരികെ നൽകി $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name ഇല്ലാതാക്കണമെന്ന് തീർച്ചയാണോ?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'ഉപയോക്താവ് \"$name\" ഇല്ലാതാക്കി';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'ഉപയോക്താവിനെ ഇല്ലാതാക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminCreateApiKey => 'API കീ സൃഷ്‌ടിക്കുക';

  @override
  String get adminAppName => 'ആപ്പിൻ്റെ പേര്';

  @override
  String get adminApiKeyCreated => 'API കീ സൃഷ്ടിച്ചു';

  @override
  String get adminApiKeyCreatedNoToken =>
      'കീ സൃഷ്ടിച്ചു. സെർവർ ടോക്കൺ തിരികെ നൽകിയില്ല. സെർവർ API കീകൾ പരിശോധിക്കുക.';

  @override
  String get adminKeyCopied => 'കീ ക്ലിപ്പ്ബോർഡിലേക്ക് പകർത്തി';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'കീ സൃഷ്ടിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'സെർവർ പ്രതികരണത്തിൽ നിന്ന് കീ ടോക്കൺ കാണുന്നില്ല';

  @override
  String get adminRevokeApiKey => 'API കീ അസാധുവാക്കുക';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name എന്നതിനായുള്ള കീ അസാധുവാക്കണോ?';
  }

  @override
  String get adminApiKeyRevoked => 'API കീ അസാധുവാക്കി';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'കീ അസാധുവാക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminApiKeysLoadFailed =>
      'API കീകൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminApiKeysTitle => 'API കീകൾ';

  @override
  String get adminCreateKey => 'കീ സൃഷ്ടിക്കുക';

  @override
  String get adminNoApiKeys => 'API കീകളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get adminUnknownApp => 'അജ്ഞാത ആപ്പ്';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'ടോക്കൺ: $token\\nസൃഷ്ടിച്ചത്: $created';
  }

  @override
  String get adminCreatingBackup => 'ബാക്കപ്പ് സൃഷ്‌ടിക്കുന്നു...';

  @override
  String get adminBackupCreated => 'ബാക്കപ്പ് സൃഷ്‌ടിച്ചു';

  @override
  String adminBackupCreateFailed(String error) {
    return 'ബാക്കപ്പ് സൃഷ്ടിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'സെർവർ പ്രതികരണത്തിൽ ബാക്കപ്പ് പാത്ത് കാണുന്നില്ല';

  @override
  String adminBackupManifest(String name) {
    return 'മാനിഫെസ്റ്റ്: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'മാനിഫെസ്റ്റ് ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminConfirmRestore => 'പുനഃസ്ഥാപിക്കൽ സ്ഥിരീകരിക്കുക';

  @override
  String get adminRestoringBackup => 'ബാക്കപ്പ് പുനഃസ്ഥാപിക്കുന്നു...';

  @override
  String adminRestoreFailed(String error) {
    return 'ബാക്കപ്പ് പുനഃസ്ഥാപിക്കാനായില്ല: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'ബാക്കപ്പുകൾ ലോഡുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminCreateBackup => 'ബാക്കപ്പ് സൃഷ്ടിക്കുക';

  @override
  String get adminNoBackups => 'ബാക്കപ്പുകളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get adminViewDetails => 'വിശദാംശങ്ങൾ കാണുക';

  @override
  String get restore => 'പുനഃസ്ഥാപിക്കുക';

  @override
  String get adminLogsLoadFailed =>
      'സെർവർ ലോഗുകൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminNoLogFiles => 'ലോഗ് ഫയലുകളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get adminLogCopied => 'ലോഗ് ക്ലിപ്പ്ബോർഡിലേക്ക് പകർത്തി';

  @override
  String get adminSaveLogFile => 'ലോഗ് ഫയൽ സംരക്ഷിക്കുക';

  @override
  String adminSavedTo(String path) {
    return '$path എന്നതിൽ സംരക്ഷിച്ചു';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ഫയൽ സംരക്ഷിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName ലോഡ് ചെയ്യാനായില്ല';
  }

  @override
  String get adminSearchInLog => 'ലോഗിൽ തിരയുക';

  @override
  String get adminNoMatchingLines => 'പൊരുത്തപ്പെടുന്ന വരികളൊന്നുമില്ല';

  @override
  String adminTasksLoadFailed(String error) {
    return 'ടാസ്‌ക്കുകൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminNoScheduledTasks =>
      'ഷെഡ്യൂൾ ചെയ്ത ജോലികളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get adminNoTasksMatchFilter =>
      'നിലവിലെ ഫിൽട്ടറുമായി പൊരുത്തപ്പെടുന്ന ടാസ്ക്കുകളൊന്നുമില്ല';

  @override
  String adminTaskStartFailed(String error) {
    return 'ടാസ്ക് ആരംഭിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'ടാസ്ക് നിർത്തുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'ടാസ്‌ക് ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminRunNow => 'ഇപ്പോൾ പ്രവർത്തിപ്പിക്കുക';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ട്രിഗർ നീക്കംചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ട്രിഗർ ചേർക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminLastExecution => 'അവസാന നിർവ്വഹണം';

  @override
  String get adminTriggers => 'ട്രിഗറുകൾ';

  @override
  String get adminAddTrigger => 'ട്രിഗർ ചേർക്കുക';

  @override
  String get adminNoTriggers => 'ട്രിഗറുകളൊന്നും കോൺഫിഗർ ചെയ്തിട്ടില്ല';

  @override
  String get adminTriggerType => 'ട്രിഗർ തരം';

  @override
  String get adminTimeLimit => 'സമയ പരിധി (ഓപ്ഷണൽ)';

  @override
  String get adminNoLimit => 'പരിധിയില്ല';

  @override
  String adminHours(String hours) {
    return '$hours മണിക്കൂർ(ങ്ങൾ)';
  }

  @override
  String get adminDayOfWeek => 'ആഴ്ചയിലെ ദിവസം';

  @override
  String get adminSearchPlugins => 'പ്ലഗിനുകൾ തിരയുക...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'പ്ലഗിൻ ടോഗിൾ ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminUninstallPlugin => 'പ്ലഗിൻ അൺഇൻസ്റ്റാൾ ചെയ്യുക';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '\"$name\" അൺഇൻസ്റ്റാൾ ചെയ്യണമെന്ന് തീർച്ചയാണോ?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'പ്ലഗിൻ അൺഇൻസ്റ്റാൾ ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'പാക്കേജ് ഇൻസ്റ്റാൾ ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'അപ്‌ഡേറ്റ് ഇൻസ്റ്റാൾ ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'പ്ലഗിനുകൾ ലോഡുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'നിങ്ങളുടെ തിരയലുമായി പൊരുത്തപ്പെടുന്ന പ്ലഗിനുകളൊന്നും ഇല്ല';

  @override
  String get adminNoPluginsInstalled =>
      'പ്ലഗിന്നുകളൊന്നും ഇൻസ്റ്റാൾ ചെയ്തിട്ടില്ല';

  @override
  String adminInstallUpdate(String version) {
    return 'അപ്ഡേറ്റ് ഇൻസ്റ്റാൾ ചെയ്യുക (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'കാറ്റലോഗ് ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'നിങ്ങളുടെ തിരയലുമായി പൊരുത്തപ്പെടുന്ന പാക്കേജുകളൊന്നുമില്ല';

  @override
  String get adminNoPackagesAvailable => 'പാക്കേജുകളൊന്നും ലഭ്യമല്ല';

  @override
  String get adminExperimentalIntegration => 'പരീക്ഷണാത്മക ഏകീകരണം';

  @override
  String get adminExperimentalWarning =>
      'പ്ലഗിൻ ക്രമീകരണങ്ങളുടെ ഏകീകരണം ഇപ്പോഴും പരീക്ഷണാത്മകമാണ്. ചില ക്രമീകരണ പേജുകൾ ശരിയായി റെൻഡർ ചെയ്തേക്കില്ല.';

  @override
  String get continueAction => 'തുടരുക';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'സെർവർ പുനരാരംഭിച്ചതിന് ശേഷം \"$name\" നീക്കം ചെയ്യപ്പെടും';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'അൺഇൻസ്റ്റാൾ ചെയ്യാനായില്ല: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" v$version എന്നതിലേക്ക് അപ്ഡേറ്റ് ചെയ്യുന്നു...';
  }

  @override
  String get adminMissingAuthToken =>
      'ക്രമീകരണങ്ങൾ തുറക്കാനായില്ല: ഓത്ത് ടോക്കൺ വിട്ടുപോയിരിക്കുന്നു.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'പ്ലഗിൻ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminPluginNotFound => 'പ്ലഗിൻ കണ്ടെത്തിയില്ല';

  @override
  String adminPluginVersion(String version) {
    return 'പതിപ്പ് $version';
  }

  @override
  String get adminEnablePlugin => 'പ്ലഗിൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminPluginSettingsPage => 'പ്ലഗിൻ ക്രമീകരണ പേജ്';

  @override
  String get adminRevisionHistory => 'റിവിഷൻ ചരിത്രം';

  @override
  String get adminNoChangelog => 'ചേഞ്ച്ലോഗ് ലഭ്യമല്ല.';

  @override
  String get adminRemoveRepository => 'റിപ്പോസിറ്ററി നീക്കം ചെയ്യുക';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return '\"$name\" നീക്കം ചെയ്യണമെന്ന് തീർച്ചയാണോ?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'ശേഖരണങ്ങൾ സംരക്ഷിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'ശേഖരണങ്ങൾ ലോഡുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminRepositoryNameHint => 'ഉദാ. Jellyfin സ്ഥിരതയുള്ള';

  @override
  String get adminRepositoryUrl => 'റിപ്പോസിറ്ററി URL';

  @override
  String get adminAddEntry => 'എൻട്രി ചേർക്കുക';

  @override
  String get adminInvalidUrl => 'അസാധുവായ URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'പ്ലഗിൻ ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യാൻ കഴിയുന്നില്ല: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri തുറക്കാൻ കഴിഞ്ഞില്ല';
  }

  @override
  String get adminOpenInBrowser => 'ബ്രൗസറിൽ തുറക്കുക';

  @override
  String get adminOpenExternally => 'ബാഹ്യമായി തുറക്കുക';

  @override
  String get adminGeneralSettings => 'പൊതുവായ ക്രമീകരണങ്ങൾ';

  @override
  String get adminServerName => 'സെർവറിൻ്റെ പേര്';

  @override
  String get adminPreferredMetadataCountry => 'തിരഞ്ഞെടുത്ത മെറ്റാഡാറ്റ രാജ്യം';

  @override
  String get adminCachePath => 'കാഷെ പാത';

  @override
  String get adminMetadataPath => 'മെറ്റാഡാറ്റ പാത';

  @override
  String get adminLibraryScanConcurrency => 'ലൈബ്രറി സ്കാൻ കൺകറൻസി';

  @override
  String get adminParallelImageEncodingLimit => 'സമാന്തര ഇമേജ് എൻകോഡിംഗ് പരിധി';

  @override
  String get adminSlowResponseThreshold =>
      'മന്ദഗതിയിലുള്ള പ്രതികരണ പരിധി (മിസെ)';

  @override
  String get adminBrandingSaved => 'ബ്രാൻഡിംഗ് ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു';

  @override
  String get adminBrandingLoadFailed =>
      'ബ്രാൻഡിംഗ് ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminLoginDisclaimer => 'ലോഗിൻ നിരാകരണം';

  @override
  String get adminLoginDisclaimerHint =>
      'ലോഗിൻ ഫോമിന് താഴെ പ്രദർശിപ്പിച്ചിരിക്കുന്ന HTML';

  @override
  String get adminCustomCss => 'ഇഷ്ടാനുസൃത CSS';

  @override
  String get adminCustomCssHint =>
      'ഇഷ്‌ടാനുസൃത CSS വെബ് ഇൻ്റർഫേസിലേക്ക് പ്രയോഗിച്ചു';

  @override
  String get adminEnableSplashScreen => 'സ്പ്ലാഷ് സ്ക്രീൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminStreamingSaved => 'സ്ട്രീമിംഗ് ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു';

  @override
  String get adminStreamingLoadFailed =>
      'സ്ട്രീമിംഗ് ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminStreamingDescription =>
      'റിമോട്ട് കണക്ഷനുകൾക്കായി ആഗോള സ്ട്രീമിംഗ് ബിറ്റ്റേറ്റ് പരിധികൾ സജ്ജമാക്കുക.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'റിമോട്ട് ക്ലയൻ്റ് ബിറ്റ്റേറ്റ് പരിധി (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'അൺലിമിറ്റഡ് എന്നതിന് ശൂന്യമോ 0യോ ഇടുക';

  @override
  String get adminPlaybackSaved => 'പ്ലേബാക്ക് ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു';

  @override
  String get adminPlaybackLoadFailed =>
      'പ്ലേബാക്ക് ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminPlaybackTranscoding => 'പ്ലേബാക്ക് / ട്രാൻസ്കോഡിംഗ്';

  @override
  String get adminHardwareAcceleration => 'ഹാർഡ്‌വെയർ ത്വരണം';

  @override
  String get adminVaapiDevice => 'VA-API ഉപകരണം';

  @override
  String get adminEnableHardwareEncoding =>
      'ഹാർഡ്‌വെയർ എൻകോഡിംഗ് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminEnableHardwareDecoding =>
      'ഇതിനായി ഹാർഡ്‌വെയർ ഡീകോഡിംഗ് പ്രവർത്തനക്ഷമമാക്കുക:';

  @override
  String get adminEncodingThreads => 'എൻകോഡിംഗ് ത്രെഡുകൾ';

  @override
  String get adminAutomatic => '0 = ഓട്ടോമാറ്റിക്';

  @override
  String get adminTranscodingTempPath => 'ട്രാൻസ്കോഡിംഗ് ടെമ്പ് പാത്ത്';

  @override
  String get adminEnableFallbackFont => 'ഫോൾബാക്ക് ഫോണ്ട് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminFallbackFontPath => 'ഫോൾബാക്ക് ഫോണ്ട് പാത്ത്';

  @override
  String get adminAllowSegmentDeletion =>
      'സെഗ്‌മെൻ്റ് ഇല്ലാതാക്കാൻ അനുവദിക്കുക';

  @override
  String get adminSegmentKeepSeconds => 'സെഗ്മെൻ്റ് സൂക്ഷിക്കുക (സെക്കൻഡ്)';

  @override
  String get adminThrottleBuffering => 'ത്രോട്ടിൽ ബഫറിംഗ്';

  @override
  String get adminTrickplaySaved => 'ട്രിക്ക്പ്ലേ ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു';

  @override
  String get adminTrickplayLoadFailed =>
      'ട്രിക്ക്പ്ലേ ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminEnableHardwareAcceleration =>
      'ഹാർഡ്‌വെയർ ആക്സിലറേഷൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminEnableKeyFrameExtraction =>
      'കീ ഫ്രെയിം മാത്രം എക്സ്ട്രാക്ഷൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminKeyFrameSubtitle => 'വേഗതയേറിയതും എന്നാൽ കുറഞ്ഞ കൃത്യതയും';

  @override
  String get adminScanBehavior => 'പെരുമാറ്റം സ്കാൻ ചെയ്യുക';

  @override
  String get adminProcessPriority => 'പ്രോസസ്സ് മുൻഗണന';

  @override
  String get adminImageSettings => 'ഇമേജ് ക്രമീകരണങ്ങൾ';

  @override
  String get adminIntervalMs => 'ഇടവേള (മിസെ)';

  @override
  String get adminCaptureFrameSubtitle => 'എത്ര തവണ ഫ്രെയിമുകൾ പിടിച്ചെടുക്കണം';

  @override
  String get adminWidthResolutions => 'വീതി റെസലൂഷനുകൾ';

  @override
  String get adminTileWidth => 'ടൈൽ വീതി';

  @override
  String get adminTileHeight => 'ടൈൽ ഉയരം';

  @override
  String get adminQualitySubtitle =>
      'താഴ്ന്ന മൂല്യങ്ങൾ = മികച്ച നിലവാരം, വലിയ ഫയലുകൾ';

  @override
  String get adminProcessThreads => 'ത്രെഡുകൾ പ്രോസസ്സ് ചെയ്യുക';

  @override
  String get adminResumeSaved =>
      'പുനരാരംഭിക്കുന്നതിനുള്ള ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു';

  @override
  String get adminResumeLoadFailed =>
      'റെസ്യൂമെ ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminResumeDescription =>
      'ഉള്ളടക്കം ഭാഗികമായി പ്ലേ ചെയ്തതോ പൂർണ്ണമായി പ്ലേ ചെയ്തതോ ആയി അടയാളപ്പെടുത്തുമ്പോൾ കോൺഫിഗർ ചെയ്യുക.';

  @override
  String get adminMinResumePercentage => 'ഏറ്റവും കുറഞ്ഞ റെസ്യൂമെ ശതമാനം';

  @override
  String get adminMinResumeSubtitle =>
      'പുരോഗതി സംരക്ഷിക്കാൻ ഈ ശതമാനം കഴിഞ്ഞുള്ള ഉള്ളടക്കം പ്ലേ ചെയ്യണം';

  @override
  String get adminMaxResumePercentage => 'പരമാവധി റെസ്യൂമെ ശതമാനം';

  @override
  String get adminMaxResumeSubtitle =>
      'ഈ ശതമാനത്തിന് ശേഷം ഉള്ളടക്കം പൂർണ്ണമായി പ്ലേ ചെയ്തതായി കണക്കാക്കുന്നു';

  @override
  String get adminMinResumeDuration =>
      'ഏറ്റവും കുറഞ്ഞ പുനരാരംഭിക്കൽ ദൈർഘ്യം (സെക്കൻഡ്)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'ഇതിലും ചെറിയ ഇനങ്ങൾ പുനരാരംഭിക്കാനാവില്ല';

  @override
  String get adminMinAudiobookResume =>
      'ഏറ്റവും കുറഞ്ഞ ഓഡിയോബുക്ക് റെസ്യൂമെ ശതമാനം';

  @override
  String get adminMaxAudiobookResume => 'പരമാവധി ഓഡിയോബുക്ക് റെസ്യൂമെ ശതമാനം';

  @override
  String get adminNetworkingSaved =>
      'നെറ്റ്‌വർക്കിംഗ് ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു. ഒരു സെർവർ റീസ്റ്റാർട്ട് ആവശ്യമായി വന്നേക്കാം.';

  @override
  String get adminNetworkingLoadFailed =>
      'നെറ്റ്‌വർക്കിംഗ് ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminNetworkingWarning =>
      'നെറ്റ്‌വർക്കിംഗ് ക്രമീകരണങ്ങളിലെ മാറ്റങ്ങൾക്ക് സെർവർ പുനരാരംഭിക്കേണ്ടതുണ്ട്.';

  @override
  String get adminEnableRemoteAccess => 'വിദൂര ആക്സസ് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get ports => 'തുറമുഖങ്ങൾ';

  @override
  String get adminHttpPort => 'HTTP പോർട്ട്';

  @override
  String get adminHttpsPort => 'HTTPS പോർട്ട്';

  @override
  String get adminPublicHttpsPort => 'പൊതു HTTPS പോർട്ട്';

  @override
  String get adminBaseUrl => 'അടിസ്ഥാന URL';

  @override
  String get adminBaseUrlHint => 'ഉദാ. /ജെല്ലിഫിൻ';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminLocalNetwork => 'പ്രാദേശിക നെറ്റ്‌വർക്ക്';

  @override
  String get adminLocalNetworkAddresses => 'പ്രാദേശിക നെറ്റ്‌വർക്ക് വിലാസങ്ങൾ';

  @override
  String get adminKnownProxies => 'അറിയപ്പെടുന്ന പ്രോക്സികൾ';

  @override
  String get adminRemoteIpFilter => 'വിദൂര ഐപി ഫിൽട്ടർ';

  @override
  String get adminRemoteIpFilterEntries => 'വിദൂര ഐപി ഫിൽട്ടർ';

  @override
  String get adminCertificatePath => 'സർട്ടിഫിക്കറ്റ് പാത';

  @override
  String get whitelist => 'വൈറ്റ്‌ലിസ്റ്റ്';

  @override
  String get blacklist => 'കരിമ്പട്ടിക';

  @override
  String get notSet => 'സജ്ജമാക്കിയിട്ടില്ല';

  @override
  String get adminMetadataSaved => 'മെറ്റാഡാറ്റ സംരക്ഷിച്ചു';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'മെറ്റാഡാറ്റ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'മെറ്റാഡാറ്റ സംരക്ഷിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminRefreshMetadata => 'മെറ്റാഡാറ്റ പുതുക്കുക';

  @override
  String get recursive => 'ആവർത്തിച്ചുള്ള';

  @override
  String get adminReplaceAllMetadata =>
      'എല്ലാ മെറ്റാഡാറ്റയും മാറ്റിസ്ഥാപിക്കുക';

  @override
  String get adminReplaceAllImages => 'എല്ലാ ചിത്രങ്ങളും മാറ്റിസ്ഥാപിക്കുക';

  @override
  String get adminMetadataRefreshRequested =>
      'മെറ്റാഡാറ്റ പുതുക്കാൻ അഭ്യർത്ഥിച്ചു';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'മെറ്റാഡാറ്റ പുതുക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminSearchRemotePerson => 'വിദൂര വ്യക്തിയെ തിരയുക';

  @override
  String get adminNoRemoteMatches => 'വിദൂര പൊരുത്തങ്ങളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get adminRemoteResults => 'റിമോട്ട് ഫലങ്ങൾ';

  @override
  String get adminRemoteMetadataApplied => 'റിമോട്ട് മെറ്റാഡാറ്റ പ്രയോഗിച്ചു';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'വിദൂര തിരയൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminUpdateContentType => 'ഉള്ളടക്ക തരം അപ്ഡേറ്റ് ചെയ്യുക';

  @override
  String get adminContentType => 'ഉള്ളടക്ക തരം';

  @override
  String get adminContentTypeUpdated => 'ഉള്ളടക്ക തരം അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'ഉള്ളടക്ക തരം അപ്‌ഡേറ്റ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'മെറ്റാഡാറ്റ എഡിറ്റർ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminNoPeopleEntries => 'ആളുകളുടെ എൻട്രികളൊന്നുമില്ല';

  @override
  String get adminNoExternalIds => 'ബാഹ്യ ഐഡികളൊന്നും ലഭ്യമല്ല';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType ചിത്രം അപ്ഡേറ്റ് ചെയ്തു';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'ചിത്രം ഡൗൺലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'പിന്തുണയ്ക്കാത്ത ചിത്ര ഫോർമാറ്റ്';

  @override
  String get adminImageReadFailed =>
      'തിരഞ്ഞെടുത്ത ചിത്രം വായിക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType ചിത്രം അപ്‌ലോഡ് ചെയ്‌തു';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'ചിത്രം അപ്‌ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType ചിത്രം ഇല്ലാതാക്കുക';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType ചിത്രം ഇല്ലാതാക്കി';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'ചിത്രം ഇല്ലാതാക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminAllProviders => 'എല്ലാ ദാതാക്കളും';

  @override
  String get adminNoRemoteImages => 'വിദൂര ചിത്രങ്ങളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'ട്യൂണർ കണ്ടെത്തൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminAddTuner => 'ട്യൂണർ ചേർക്കുക';

  @override
  String get adminTunerType => 'ട്യൂണർ തരം';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, മറ്റുള്ളവ';

  @override
  String get adminUrlPath => 'URL / പാത';

  @override
  String get adminNameOptional => 'പേര് (ഓപ്ഷണൽ)';

  @override
  String get adminTunerAdded => 'ട്യൂണർ കൂട്ടിച്ചേർത്തു';

  @override
  String adminTunerAddFailed(String error) {
    return 'ട്യൂണർ ചേർക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminAddGuideProvider => 'ഗൈഡ് ദാതാവിനെ ചേർക്കുക';

  @override
  String get adminProviderType => 'ദാതാവിൻ്റെ തരം';

  @override
  String get adminProviderTypeHint => 'ഷെഡ്യൂൾസ്ഡയറക്ട് അല്ലെങ്കിൽ XMLTV';

  @override
  String get adminUsernameOptional => 'ഉപയോക്തൃനാമം (ഓപ്ഷണൽ)';

  @override
  String get adminRefreshInterval => 'പുതുക്കിയ ഇടവേള (മണിക്കൂറുകൾ)';

  @override
  String get adminProviderAdded => 'ദാതാവ് ചേർത്തു';

  @override
  String adminProviderAddFailed(String error) {
    return 'ദാതാവിനെ ചേർക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'ട്യൂണർ നീക്കം ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminTunerResetRequested => 'ട്യൂണർ റീസെറ്റ് അഭ്യർത്ഥിച്ചു';

  @override
  String adminTunerResetFailed(String error) {
    return 'ട്യൂണർ പുനഃസജ്ജമാക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'ദാതാവിനെ നീക്കം ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminRecordingSettings => 'റെക്കോർഡിംഗ് ക്രമീകരണങ്ങൾ';

  @override
  String get adminPrePadding => 'പ്രീ-പാഡിംഗ് (മിനിറ്റുകൾ)';

  @override
  String get adminPostPadding => 'പോസ്റ്റ്-പാഡിംഗ് (മിനിറ്റുകൾ)';

  @override
  String get adminRecordingPath => 'റെക്കോർഡിംഗ് പാത';

  @override
  String get adminSeriesRecordingPath => 'സീരീസ് റെക്കോർഡിംഗ് പാത';

  @override
  String get adminRecordingSettingsSaved =>
      'റെക്കോർഡിംഗ് ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'ക്രമീകരണങ്ങൾ സംരക്ഷിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminSetChannelMappings => 'ചാനൽ മാപ്പിംഗുകൾ സജ്ജമാക്കുക';

  @override
  String get adminMappingJson => 'JSON മാപ്പിംഗ്';

  @override
  String get adminMappingJsonHint => 'ഉദാഹരണം: മാപ്പിംഗ്സ് JSON പേലോഡ്';

  @override
  String get adminChannelMappingsUpdated => 'ചാനൽ മാപ്പിംഗ് അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'മാപ്പിംഗുകൾ അപ്ഡേറ്റ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'തത്സമയ ടിവി അഡ്മിനിസ്ട്രേഷൻ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get adminTunerDevices => 'ട്യൂണർ ഉപകരണങ്ങൾ';

  @override
  String get adminNoTunerHosts =>
      'ട്യൂണർ ഹോസ്റ്റുകളൊന്നും കോൺഫിഗർ ചെയ്തിട്ടില്ല';

  @override
  String get adminGuideProviders => 'ഗൈഡ് ദാതാക്കൾ';

  @override
  String get adminAddProvider => 'ദാതാവിനെ ചേർക്കുക';

  @override
  String get adminNoListingProviders =>
      'ലിസ്റ്റിംഗ് ദാതാക്കളൊന്നും കോൺഫിഗർ ചെയ്തിട്ടില്ല';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'റെക്കോർഡിംഗ് പാത: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'സീരീസ് പാത: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'പ്രീ-പാഡിംഗ്: $minutes മിനിറ്റ്';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'പോസ്റ്റ്-പാഡിംഗ്: $minutes മിനിറ്റ്';
  }

  @override
  String get adminTunerDiscovery => 'ട്യൂണർ കണ്ടെത്തൽ';

  @override
  String get adminChannelMappings => 'ചാനൽ മാപ്പിംഗ്സ്';

  @override
  String get adminNoDiscoveredTuners => 'ഇതുവരെ ട്യൂണറുകളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get adminSettingsSaved => 'ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു';

  @override
  String get adminBackupsNotAvailable => 'ഈ സെർവർ ബിൽഡിൽ ബാക്കപ്പുകൾ ലഭ്യമല്ല.';

  @override
  String get adminRestoreWarning1 =>
      'പുനഃസ്ഥാപിക്കുന്നത് നിലവിലുള്ള എല്ലാ സെർവർ ഡാറ്റയും ബാക്കപ്പ് ഡാറ്റ ഉപയോഗിച്ച് മാറ്റിസ്ഥാപിക്കും.';

  @override
  String get adminRestoreWarning2 =>
      'നിലവിലെ സെർവർ ക്രമീകരണങ്ങൾ, ഉപയോക്താക്കൾ, ലൈബ്രറി ഡാറ്റ എന്നിവ തിരുത്തിയെഴുതപ്പെടും.';

  @override
  String get adminRestoreWarning3 =>
      'പുനഃസ്ഥാപിച്ചതിന് ശേഷം സെർവർ പുനരാരംഭിക്കും.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '$name ഇപ്പോൾ ബാക്കപ്പ് പുനഃസ്ഥാപിക്കണോ?';
  }

  @override
  String get adminRestoreRequested =>
      'പുനഃസ്ഥാപിക്കാൻ അഭ്യർത്ഥിച്ചു. സെർവർ പുനരാരംഭിക്കുന്നത് ഈ സെഷൻ വിച്ഛേദിച്ചേക്കാം.';

  @override
  String get adminBackupsTitle => 'ബാക്കപ്പുകൾ';

  @override
  String get adminUnknownDate => 'അജ്ഞാത തീയതി';

  @override
  String get adminUnnamedBackup => 'പേരിടാത്ത ബാക്കപ്പ്';

  @override
  String get adminLiveTvNotAvailable =>
      'ഈ സെർവർ ബിൽഡിൽ ലൈവ് ടിവി അഡ്മിനിസ്ട്രേഷൻ ലഭ്യമല്ല.';

  @override
  String get adminLiveTvTitle => 'ലൈവ് ടിവി അഡ്മിനിസ്ട്രേഷൻ';

  @override
  String get adminApply => 'അപേക്ഷിക്കുക';

  @override
  String get adminNotSet => 'സജ്ജമാക്കിയിട്ടില്ല';

  @override
  String get adminReset => 'പുനഃസജ്ജമാക്കുക';

  @override
  String get adminLogsTitle => 'സെർവർ ലോഗുകൾ';

  @override
  String get adminLogsNewestFirst => 'ഏറ്റവും പുതിയത് ആദ്യം';

  @override
  String get adminLogsOldestFirst => 'ഏറ്റവും പഴയ ആദ്യ';

  @override
  String get adminLogsJustNow => 'ഇപ്പോള്';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m മുമ്പ്';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h മുമ്പ്';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d മുമ്പ്';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName ലോഡ് ചെയ്യാനായില്ല';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count പൊരുത്തങ്ങൾ';
  }

  @override
  String get adminLogViewerNoMatches => 'പൊരുത്തപ്പെടുന്ന വരികളൊന്നുമില്ല';

  @override
  String get adminMetadataEditorTitle => 'മെറ്റാഡാറ്റ എഡിറ്റർ';

  @override
  String get adminMetadataRemote => 'റിമോട്ട്';

  @override
  String get adminMetadataType => 'ടൈപ്പ് ചെയ്യുക';

  @override
  String get adminMetadataDetails => 'വിശദാംശങ്ങൾ';

  @override
  String get adminMetadataExternalIds => 'ബാഹ്യ ഐഡികൾ';

  @override
  String get adminMetadataImages => 'ചിത്രങ്ങൾ';

  @override
  String get adminMetadataFieldTitle => 'തലക്കെട്ട്';

  @override
  String get adminMetadataFieldSortTitle => 'ശീർഷകം അടുക്കുക';

  @override
  String get adminMetadataFieldOriginalTitle => 'യഥാർത്ഥ തലക്കെട്ട്';

  @override
  String get adminMetadataFieldPremiereDate => 'പ്രീമിയർ തീയതി (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'അവസാന തീയതി (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'ഉൽപ്പാദന വർഷം';

  @override
  String get adminMetadataFieldOfficialRating => 'ഔദ്യോഗിക റേറ്റിംഗ്';

  @override
  String get adminMetadataFieldCommunityRating => 'കമ്മ്യൂണിറ്റി റേറ്റിംഗ്';

  @override
  String get adminMetadataFieldCriticRating => 'നിരൂപക റേറ്റിംഗ്';

  @override
  String get adminMetadataFieldTagline => 'ടാഗ്‌ലൈൻ';

  @override
  String get adminMetadataFieldOverview => 'അവലോകനം';

  @override
  String get adminMetadataGenres => 'വിഭാഗങ്ങൾ';

  @override
  String get adminMetadataTags => 'ടാഗുകൾ';

  @override
  String get adminMetadataStudios => 'സ്റ്റുഡിയോകൾ';

  @override
  String get adminMetadataPeople => 'ആളുകൾ';

  @override
  String get adminMetadataAddGenre => 'തരം ചേർക്കുക';

  @override
  String get adminMetadataAddTag => 'ടാഗ് ചേർക്കുക';

  @override
  String get adminMetadataAddStudio => 'സ്റ്റുഡിയോ ചേർക്കുക';

  @override
  String get adminMetadataAddPerson => 'വ്യക്തിയെ ചേർക്കുക';

  @override
  String get adminMetadataEditPerson => 'വ്യക്തിയെ എഡിറ്റ് ചെയ്യുക';

  @override
  String get adminMetadataRole => 'പങ്ക്';

  @override
  String get adminMetadataImagePrimary => 'പ്രാഥമികം';

  @override
  String get adminMetadataImageBackdrop => 'പശ്ചാത്തലം';

  @override
  String get adminMetadataImageLogo => 'ലോഗോ';

  @override
  String get adminMetadataImageBanner => 'ബാനർ';

  @override
  String get adminMetadataImageThumb => 'തള്ളവിരൽ';

  @override
  String get adminMetadataRecursive => 'ആവർത്തിച്ചുള്ള';

  @override
  String get adminMetadataProvider => 'ദാതാവ്';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType ചിത്രം അപ്ഡേറ്റ് ചെയ്തു';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType ചിത്രം അപ്‌ലോഡ് ചെയ്‌തു';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType ചിത്രം ഇല്ലാതാക്കി';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'ചിത്രം ഡൗൺലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'തിരഞ്ഞെടുത്ത ചിത്രം വായിക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'ചിത്രം അപ്‌ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType ചിത്രം ഇല്ലാതാക്കുക';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'ഇത് ഇനത്തിൽ നിന്ന് നിലവിലെ ചിത്രം നീക്കംചെയ്യുന്നു.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'ചിത്രം ഇല്ലാതാക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType ചിത്രം തിരഞ്ഞെടുക്കുക';
  }

  @override
  String get adminMetadataUpload => 'അപ്‌ലോഡ് ചെയ്യുക';

  @override
  String get adminMetadataUpdate => 'അപ്ഡേറ്റ്';

  @override
  String get adminMetadataRemoteImage => 'വിദൂര ചിത്രം';

  @override
  String get adminPluginsInstalled => 'ഇൻസ്റ്റാൾ ചെയ്തു';

  @override
  String get adminPluginsCatalog => 'കാറ്റലോഗ്';

  @override
  String get adminPluginsActive => 'സജീവമാണ്';

  @override
  String get adminPluginsRestart => 'പുനരാരംഭിക്കുക';

  @override
  String get adminPluginsNoSearchResults =>
      'നിങ്ങളുടെ തിരയലുമായി പൊരുത്തപ്പെടുന്ന പ്ലഗിനുകളൊന്നും ഇല്ല';

  @override
  String get adminPluginsNoneInstalled =>
      'പ്ലഗിന്നുകളൊന്നും ഇൻസ്റ്റാൾ ചെയ്തിട്ടില്ല';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'അപ്‌ഡേറ്റ് ലഭ്യമാണ്: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'അപ്ഡേറ്റ് ലഭ്യമാണ്';

  @override
  String get adminPluginsPendingRemoval =>
      'പുനരാരംഭിച്ചതിന് ശേഷം നീക്കം ചെയ്യപ്പെടാതെ കിടക്കുന്നു';

  @override
  String get adminPluginsChangesPending => 'പുനരാരംഭിക്കാത്ത മാറ്റങ്ങൾ';

  @override
  String get adminPluginsEnable => 'പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminPluginsDisable => 'പ്രവർത്തനരഹിതമാക്കുക';

  @override
  String get adminPluginsInstallUpdate => 'അപ്ഡേറ്റ് ഇൻസ്റ്റാൾ ചെയ്യുക';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'അപ്ഡേറ്റ് ഇൻസ്റ്റാൾ ചെയ്യുക (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'നിങ്ങളുടെ തിരയലുമായി പൊരുത്തപ്പെടുന്ന പാക്കേജുകളൊന്നുമില്ല';

  @override
  String get adminPluginsCatalogEmpty => 'പാക്കേജുകളൊന്നും ലഭ്യമല്ല';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" ഇൻസ്റ്റാൾ ചെയ്യുന്നു...';
  }

  @override
  String get adminPluginDetailExperimental => 'പരീക്ഷണാത്മക ഏകീകരണം';

  @override
  String get adminPluginDetailExperimentalContent =>
      'പ്ലഗിൻ ക്രമീകരണങ്ങളുടെ ഏകീകരണം ഇപ്പോഴും പരീക്ഷണാത്മകമാണ്. ചില ഫീൽഡുകളോ ലേഔട്ടുകളോ ഇതുവരെ ശരിയായി റെൻഡർ ചെയ്തേക്കില്ല.';

  @override
  String get adminPluginDetailToggle404 =>
      'പ്ലഗിൻ ടോഗിൾ ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു. സെർവറിന് ഈ പ്ലഗിൻ പതിപ്പ് കണ്ടെത്താൻ കഴിഞ്ഞില്ല. പ്ലഗിനുകൾ പുതുക്കാൻ ശ്രമിക്കുക, തുടർന്ന് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get adminPluginDetailToggleDioError =>
      'പ്ലഗിൻ ടോഗിൾ ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു. വിശദാംശങ്ങൾക്ക് ദയവായി സെർവർ ലോഗുകൾ പരിശോധിക്കുക.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name ക്രമീകരണങ്ങൾ';
  }

  @override
  String get adminPluginDetailDetails => 'വിശദാംശങ്ങൾ';

  @override
  String get adminPluginDetailDeveloper => 'ഡെവലപ്പർ';

  @override
  String get adminPluginDetailRepository => 'ശേഖരം';

  @override
  String get adminPluginDetailBundled => 'ബണ്ടിൽ';

  @override
  String get adminPluginDetailEnablePlugin => 'പ്ലഗിൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminPluginDetailRestartRequired =>
      'മാറ്റങ്ങൾ പ്രാബല്യത്തിൽ വരുന്നതിന് ഒരു സെർവർ പുനരാരംഭിക്കേണ്ടതുണ്ട്.';

  @override
  String get adminPluginDetailRemovalPending =>
      'സെർവർ പുനരാരംഭിച്ചതിന് ശേഷം ഈ പ്ലഗിൻ നീക്കം ചെയ്യപ്പെടും.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'ഈ പ്ലഗിൻ തകരാറിലായതിനാൽ ശരിയായി പ്രവർത്തിച്ചേക്കില്ല.';

  @override
  String get adminPluginDetailNotSupported =>
      'ഈ പ്ലഗിൻ നിലവിലെ സെർവർ പതിപ്പ് പിന്തുണയ്ക്കുന്നില്ല.';

  @override
  String get adminPluginDetailSuperseded =>
      'ഈ പ്ലഗിൻ ഒരു പുതിയ പതിപ്പ് അസാധുവാക്കിയിരിക്കുന്നു.';

  @override
  String adminReposLoadFailed(String error) {
    return 'ശേഖരണങ്ങൾ ലോഡുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminReposRemoveTitle => 'റിപ്പോസിറ്ററി നീക്കം ചെയ്യുക';

  @override
  String adminReposRemoveConfirm(String name) {
    return '\"$name\" നീക്കം ചെയ്യണമെന്ന് തീർച്ചയാണോ?';
  }

  @override
  String get adminReposRemove => 'നീക്കം ചെയ്യുക';

  @override
  String adminReposSaveFailed(String error) {
    return 'ശേഖരണങ്ങൾ സംരക്ഷിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminReposEmpty => 'റിപ്പോസിറ്ററികളൊന്നും ക്രമീകരിച്ചിട്ടില്ല';

  @override
  String get adminReposEmptySubtitle =>
      'ലഭ്യമായ പ്ലഗിനുകൾ ബ്രൗസ് ചെയ്യാൻ ഒരു ശേഖരം ചേർക്കുക';

  @override
  String get adminReposUnnamed => '(പേരില്ല)';

  @override
  String get adminReposEditTitle => 'ശേഖരം എഡിറ്റ് ചെയ്യുക';

  @override
  String get adminReposAddTitle => 'ശേഖരം ചേർക്കുക';

  @override
  String get adminReposUrl => 'റിപ്പോസിറ്ററി URL';

  @override
  String get adminReposNameHint => 'ഉദാ. Jellyfin സ്ഥിരതയുള്ള';

  @override
  String get adminPluginSettingsInvalidUrl => 'അസാധുവായ URL';

  @override
  String get adminGeneralSettingsTitle => 'പൊതുവായ ക്രമീകരണങ്ങൾ';

  @override
  String get adminGeneralMetadataLanguage => 'തിരഞ്ഞെടുത്ത മെറ്റാഡാറ്റ ഭാഷ';

  @override
  String get adminGeneralMetadataLanguageHint => 'ഉദാ. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'തിരഞ്ഞെടുത്ത മെറ്റാഡാറ്റ രാജ്യം';

  @override
  String get adminGeneralMetadataCountryHint => 'ഉദാ. യുഎസ്, ഡിഇ, എഫ്ആർ';

  @override
  String get adminGeneralLibraryScanConcurrency => 'ലൈബ്രറി സ്കാൻ കൺകറൻസി';

  @override
  String get adminGeneralImageEncodingLimit => 'സമാന്തര ഇമേജ് എൻകോഡിംഗ് പരിധി';

  @override
  String get adminUnknownError => 'അജ്ഞാത പിശക്';

  @override
  String get adminBrowse => 'ബ്രൗസ് ചെയ്യുക';

  @override
  String get adminCloseBrowser => 'ബ്രൗസർ അടയ്ക്കുക';

  @override
  String get adminNetworkingTitle => 'നെറ്റ്വർക്കിംഗ്';

  @override
  String get adminNetworkingRestartWarning =>
      'നെറ്റ്‌വർക്കിംഗ് ക്രമീകരണങ്ങളിലെ മാറ്റങ്ങൾക്ക് സെർവർ പുനരാരംഭിക്കേണ്ടതുണ്ട്.';

  @override
  String get adminNetworkingRemoteAccess => 'വിദൂര ആക്സസ് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminNetworkingPorts => 'തുറമുഖങ്ങൾ';

  @override
  String get adminNetworkingHttpPort => 'HTTP പോർട്ട്';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS പോർട്ട്';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminNetworkingLocalNetwork => 'പ്രാദേശിക നെറ്റ്‌വർക്ക്';

  @override
  String get adminNetworkingLocalAddresses =>
      'പ്രാദേശിക നെറ്റ്‌വർക്ക് വിലാസങ്ങൾ';

  @override
  String get adminNetworkingAddressHint => 'ഉദാ. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'അറിയപ്പെടുന്ന പ്രോക്സികൾ';

  @override
  String get adminNetworkingProxyHint => 'ഉദാ. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'വൈറ്റ്‌ലിസ്റ്റ്';

  @override
  String get adminNetworkingBlacklist => 'കരിമ്പട്ടിക';

  @override
  String get adminNetworkingAddEntry => 'എൻട്രി ചേർക്കുക';

  @override
  String get adminBrandingTitle => 'ബ്രാൻഡിംഗ്';

  @override
  String get adminBrandingLoginDisclaimer => 'ലോഗിൻ നിരാകരണം';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'ലോഗിൻ ഫോമിന് താഴെ പ്രദർശിപ്പിച്ചിരിക്കുന്ന HTML';

  @override
  String get adminBrandingCustomCss => 'ഇഷ്ടാനുസൃത CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'ഇഷ്‌ടാനുസൃത CSS വെബ് ഇൻ്റർഫേസിലേക്ക് പ്രയോഗിച്ചു';

  @override
  String get adminBrandingEnableSplash =>
      'സ്പ്ലാഷ് സ്ക്രീൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminPlaybackHwAccel => 'ഹാർഡ്‌വെയർ ആക്സിലറേഷൻ';

  @override
  String get adminPlaybackHwAccelLabel => 'ഹാർഡ്‌വെയർ ത്വരണം';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'ഹാർഡ്‌വെയർ എൻകോഡിംഗ് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'ഇതിനായി ഹാർഡ്‌വെയർ ഡീകോഡിംഗ് പ്രവർത്തനക്ഷമമാക്കുക:';

  @override
  String get adminPlaybackEncoding => 'എൻകോഡിംഗ്';

  @override
  String get adminPlaybackEncodingThreads => 'എൻകോഡിംഗ് ത്രെഡുകൾ';

  @override
  String get adminPlaybackFallbackFont =>
      'ഫോൾബാക്ക് ഫോണ്ട് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminPlaybackFallbackFontPath => 'ഫോൾബാക്ക് ഫോണ്ട് പാത്ത്';

  @override
  String get adminPlaybackStreaming => 'സ്ട്രീമിംഗ്';

  @override
  String get adminResumeVideo => 'വീഡിയോ';

  @override
  String get adminResumeAudiobooks => 'ഓഡിയോബുക്കുകൾ';

  @override
  String get adminResumeMinAudiobookPct =>
      'ഏറ്റവും കുറഞ്ഞ ഓഡിയോബുക്ക് റെസ്യൂമെ ശതമാനം';

  @override
  String get adminResumeMaxAudiobookPct =>
      'പരമാവധി ഓഡിയോബുക്ക് റെസ്യൂമെ ശതമാനം';

  @override
  String get adminStreamingBitrateLimit =>
      'റിമോട്ട് ക്ലയൻ്റ് ബിറ്റ്റേറ്റ് പരിധി (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'അൺലിമിറ്റഡ് എന്നതിന് ശൂന്യമോ 0യോ ഇടുക';

  @override
  String get adminTrickplayHwAccel =>
      'ഹാർഡ്‌വെയർ ആക്സിലറേഷൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminTrickplayHwEncoding =>
      'ഹാർഡ്‌വെയർ എൻകോഡിംഗ് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'കീ ഫ്രെയിം മാത്രം എക്സ്ട്രാക്ഷൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'വേഗതയേറിയതും എന്നാൽ കുറഞ്ഞ കൃത്യതയും';

  @override
  String get adminTrickplayNonBlocking => 'നോൺ-ബ്ലോക്കിംഗ്';

  @override
  String get adminTrickplayBlocking => 'തടയുന്നു';

  @override
  String get adminTrickplayPriorityHigh => 'ഉയർന്നത്';

  @override
  String get adminTrickplayPriorityAboveNormal => 'സാധാരണ മുകളിൽ';

  @override
  String get adminTrickplayPriorityNormal => 'സാധാരണ';

  @override
  String get adminTrickplayPriorityBelowNormal => 'സാധാരണ താഴെ';

  @override
  String get adminTrickplayPriorityIdle => 'നിഷ്ക്രിയ';

  @override
  String get adminTrickplayImageSettings => 'ഇമേജ് ക്രമീകരണങ്ങൾ';

  @override
  String get adminTrickplayInterval => 'ഇടവേള (മിസെ)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'എത്ര തവണ ഫ്രെയിമുകൾ പിടിച്ചെടുക്കണം';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'കോമയാൽ വേർതിരിച്ച പിക്സൽ വീതികൾ (ഉദാ. 320)';

  @override
  String get adminTrickplayQuality => 'ഗുണനിലവാരം';

  @override
  String get adminTrickplayQScale => 'ഗുണനിലവാര സ്കെയിൽ';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'താഴ്ന്ന മൂല്യങ്ങൾ = മികച്ച നിലവാരം, വലിയ ഫയലുകൾ';

  @override
  String get adminTrickplayJpegQuality => 'JPEG നിലവാരം';

  @override
  String get adminTrickplayProcessing => 'പ്രോസസ്സിംഗ്';

  @override
  String get adminTasksEmpty => 'ഷെഡ്യൂൾ ചെയ്ത ജോലികളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get adminTasksNoFilterMatch =>
      'നിലവിലെ ഫിൽട്ടറുമായി പൊരുത്തപ്പെടുന്ന ടാസ്ക്കുകളൊന്നുമില്ല';

  @override
  String get adminTaskCancelling => 'റദ്ദാക്കുന്നു...';

  @override
  String get adminTaskRunning => 'ഓടുന്നു...';

  @override
  String get adminTaskNeverRun => 'ഒരിക്കലും ഓടരുത്';

  @override
  String get adminTaskStop => 'നിർത്തുക';

  @override
  String get adminTaskRun => 'ഓടുക';

  @override
  String get adminTaskDetailLastExecution => 'അവസാന നിർവ്വഹണം';

  @override
  String get adminTaskDetailStarted => 'ആരംഭിച്ചു';

  @override
  String get adminTaskDetailEnded => 'അവസാനിച്ചു';

  @override
  String get adminTaskDetailDuration => 'ദൈർഘ്യം';

  @override
  String get adminTaskDetailErrorLabel => 'പിശക്:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'ദിവസവും $time എന്നതിൽ';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'എല്ലാ $day $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'ഓരോ $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'ആപ്ലിക്കേഷൻ ആരംഭിക്കുമ്പോൾ';

  @override
  String get adminTaskTriggerTypeDaily => 'ദിവസേന';

  @override
  String get adminTaskTriggerTypeWeekly => 'പ്രതിവാരം';

  @override
  String get adminTaskTriggerTypeInterval => 'ഒരു ഇടവേളയിൽ';

  @override
  String get adminTaskTriggerIntervalLabel => 'ഇടവേള';

  @override
  String get adminTaskTriggerEveryHour => 'ഓരോ മണിക്കൂറിലും';

  @override
  String get adminTaskTriggerEvery6Hours => 'ഓരോ 6 മണിക്കൂറിലും';

  @override
  String get adminTaskTriggerEvery12Hours => 'ഓരോ 12 മണിക്കൂറിലും';

  @override
  String get adminTaskTriggerEvery24Hours => 'ഓരോ 24 മണിക്കൂറിലും';

  @override
  String get adminTaskTriggerEvery2Days => 'ഓരോ 2 ദിവസത്തിലും';

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
  String get adminTaskTriggerTime => 'സമയം';

  @override
  String get adminTaskTriggerNoLimit => 'പരിധിയില്ല';

  @override
  String get adminActivityJustNow => 'ഇപ്പോള്';

  @override
  String get adminActivityLastHour => 'അവസാന മണിക്കൂർ';

  @override
  String get adminActivityToday => 'ഇന്ന്';

  @override
  String get adminActivityYesterday => 'ഇന്നലെ';

  @override
  String get adminActivityOlder => 'പഴയത്';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d മുമ്പ്';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h മുമ്പ്';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m മുമ്പ്';
  }

  @override
  String get adminActivityNow => 'ഇപ്പോൾ';

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
      'തിരനോട്ടം ലഘുചിത്രങ്ങൾക്കായി ട്രിക്ക്പ്ലേ ഇമേജ് ജനറേഷൻ കോൺഫിഗർ ചെയ്യുക.';

  @override
  String get adminNetworkingPublicHttpsPort => 'പൊതു HTTPS പോർട്ട്';

  @override
  String get adminNetworkingBaseUrl => 'അടിസ്ഥാന URL';

  @override
  String get adminNetworkingBaseUrlHint => 'ഉദാ. /ജെല്ലിഫിൻ';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'സർട്ടിഫിക്കറ്റ് പാത';

  @override
  String get adminNetworkingRemoteIpFilter => 'വിദൂര ഐപി ഫിൽട്ടർ';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'വിദൂര ഐപി ഫിൽട്ടർ';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API ഉപകരണം';

  @override
  String get adminPlaybackAutomatic => '0 = ഓട്ടോമാറ്റിക്';

  @override
  String get adminPlaybackTranscodeTempPath => 'ട്രാൻസ്കോഡിംഗ് ടെമ്പ് പാത്ത്';

  @override
  String get adminPlaybackSegmentDeletion =>
      'സെഗ്‌മെൻ്റ് ഇല്ലാതാക്കാൻ അനുവദിക്കുക';

  @override
  String get adminPlaybackSegmentKeep => 'സെഗ്മെൻ്റ് സൂക്ഷിക്കുക (സെക്കൻഡ്)';

  @override
  String get adminPlaybackThrottleBuffering => 'ത്രോട്ടിൽ ബഫറിംഗ്';

  @override
  String get adminResumeMinPct => 'ഏറ്റവും കുറഞ്ഞ റെസ്യൂമെ ശതമാനം';

  @override
  String get adminResumeMinPctSubtitle =>
      'പുരോഗതി സംരക്ഷിക്കാൻ ഈ ശതമാനം കഴിഞ്ഞുള്ള ഉള്ളടക്കം പ്ലേ ചെയ്യണം';

  @override
  String get adminResumeMaxPct => 'പരമാവധി റെസ്യൂമെ ശതമാനം';

  @override
  String get adminResumeMaxPctSubtitle =>
      'ഈ ശതമാനത്തിന് ശേഷം ഉള്ളടക്കം പൂർണ്ണമായി പ്ലേ ചെയ്തതായി കണക്കാക്കുന്നു';

  @override
  String get adminResumeMinDuration =>
      'ഏറ്റവും കുറഞ്ഞ പുനരാരംഭിക്കൽ ദൈർഘ്യം (സെക്കൻഡ്)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'ഇതിലും ചെറിയ ഇനങ്ങൾ പുനരാരംഭിക്കാനാവില്ല';

  @override
  String get adminTrickplayScanBehavior => 'പെരുമാറ്റം സ്കാൻ ചെയ്യുക';

  @override
  String get adminTrickplayProcessPriority => 'പ്രോസസ്സ് മുൻഗണന';

  @override
  String get adminTrickplayTileWidth => 'ടൈൽ വീതി';

  @override
  String get adminTrickplayTileHeight => 'ടൈൽ ഉയരം';

  @override
  String get adminTrickplayProcessThreads => 'ത്രെഡുകൾ പ്രോസസ്സ് ചെയ്യുക';

  @override
  String get adminTrickplayWidthResolutions => 'വീതി റെസലൂഷനുകൾ';

  @override
  String get adminMetadataDefault => 'സ്ഥിരസ്ഥിതി';

  @override
  String get adminMetadataContentTypeUpdated => 'ഉള്ളടക്ക തരം അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'ഉള്ളടക്ക തരം അപ്‌ഡേറ്റ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'മന്ദഗതിയിലുള്ള പ്രതികരണ പരിധി (മിസെ)';

  @override
  String get adminGeneralCachePath => 'കാഷെ പാത';

  @override
  String get adminGeneralMetadataPath => 'മെറ്റാഡാറ്റ പാത';

  @override
  String get adminGeneralServerName => 'സെർവറിൻ്റെ പേര്';

  @override
  String get adminSettingsLoadFailed =>
      'ക്രമീകരണങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get adminDiscover => 'കണ്ടെത്തുക';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'മാപ്പിംഗുകൾ അപ്ഡേറ്റ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'സമയ പരിധി: $duration';
  }

  @override
  String get folders => 'ഫോൾഡറുകൾ';

  @override
  String get libraries => 'ലൈബ്രറികൾ';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay പ്രവർത്തനരഹിതമാക്കി';

  @override
  String get syncPlayDisabledMessage =>
      'സമന്വയിപ്പിച്ച പ്ലേബാക്ക് ഉപയോഗിക്കുന്നതിന് ക്രമീകരണങ്ങളിൽ SyncPlay പ്രവർത്തനക്ഷമമാക്കുക.';

  @override
  String get syncPlayServerUnsupportedTitle => 'സെർവർ പിന്തുണയ്ക്കുന്നില്ല';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay എന്നതിന് Jellyfin സെർവർ ആവശ്യമാണ്. നിലവിലെ സെർവർ അതിനെ പിന്തുണയ്ക്കുന്നില്ല.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay ഗ്രൂപ്പ്';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay ഗ്രൂപ്പ്';

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
  String get syncPlayIgnoreWait => 'കാത്തിരിക്കുന്നത് അവഗണിക്കുക';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'ഈ ഉപകരണം ബഫർ ചെയ്യുമ്പോൾ ഗ്രൂപ്പിനെ പിടിച്ച് നിർത്തരുത്';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'സ്ലോ അംഗങ്ങൾക്കായി കാത്തിരിക്കാതെ പ്രാദേശികമായി തുടരുക';

  @override
  String get syncPlayRepeat => 'ആവർത്തിക്കുക';

  @override
  String get syncPlayRepeatOne => 'ഒന്ന്';

  @override
  String get syncPlayShuffleModeShuffled => 'കലക്കി';

  @override
  String get syncPlayShuffleModeSorted => 'അടുക്കി';

  @override
  String get syncPlaySyncCurrentQueue =>
      'നിലവിലെ പ്ലേബാക്ക് ക്യൂ സമന്വയിപ്പിക്കുക';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'പ്രാദേശികമായി പ്ലേ ചെയ്യുന്നവ ഉപയോഗിച്ച് ഗ്രൂപ്പ് ക്യൂ മാറ്റിസ്ഥാപിക്കുക';

  @override
  String get syncPlayLeaveGroup => 'ഗ്രൂപ്പ് വിടുക';

  @override
  String get syncPlayGroupQueue => 'ഗ്രൂപ്പ് ക്യൂ';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'ഇനം $index';
  }

  @override
  String get syncPlayPlayNow => 'ഇപ്പോൾ കളിക്കുക';

  @override
  String get syncPlayCreateNewGroup => 'ഒരു പുതിയ ഗ്രൂപ്പ് ഉണ്ടാക്കുക';

  @override
  String get syncPlayGroupName => 'ഗ്രൂപ്പിൻ്റെ പേര്';

  @override
  String get syncPlayDefaultGroupName => 'എൻ്റെ SyncPlay ഗ്രൂപ്പ്';

  @override
  String get syncPlayCreateGroup => 'ഗ്രൂപ്പ് സൃഷ്ടിക്കുക';

  @override
  String get syncPlayAvailableGroups => 'ലഭ്യമായ ഗ്രൂപ്പുകൾ';

  @override
  String get syncPlayNoGroupsAvailable => 'ഗ്രൂപ്പുകളൊന്നും ലഭ്യമല്ല';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay ഗ്രൂപ്പിൽ ചേരണോ?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay ഗ്രൂപ്പിൽ ചേരുന്നത് നിങ്ങളുടെ നിലവിലെ പ്ലേബാക്ക് ക്യൂ മാറ്റിസ്ഥാപിച്ചേക്കാം. തുടരണോ?';

  @override
  String get syncPlayJoin => 'ചേരുക';

  @override
  String get syncPlayStateIdle => 'നിഷ്ക്രിയ';

  @override
  String get syncPlayStateWaiting => 'കാത്തിരിക്കുന്നു';

  @override
  String get syncPlayStatePaused => 'താൽക്കാലികമായി നിർത്തി';

  @override
  String get syncPlayStatePlaying => 'കളിക്കുന്നു';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay ഗ്രൂപ്പിൽ ചേർന്നു';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay ഗ്രൂപ്പ് വിട്ടു';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay ആക്സസ് നിരസിച്ചു';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ഈ SyncPlay ഗ്രൂപ്പിലെ ഒന്നോ അതിലധികമോ ഇനങ്ങളിലേക്ക് നിങ്ങൾക്ക് ആക്‌സസ് ഇല്ല. ലൈബ്രറി അനുമതികൾ പരിശോധിക്കാൻ ഗ്രൂപ്പ് ഉടമയോട് ആവശ്യപ്പെടുക അല്ലെങ്കിൽ മറ്റൊരു ക്യൂ തിരഞ്ഞെടുക്കുക.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName എന്നതിലേക്ക് പ്ലേബാക്ക് സമന്വയിപ്പിക്കുന്നു';
  }

  @override
  String get voiceSearchUnavailable => 'ശബ്ദ തിരയൽ ലഭ്യമല്ല.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision ഡയറക്ട് പ്ലേ പരാജയപ്പെട്ടു';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'ഈ Dolby Vision സ്ട്രീമിനായി നേരിട്ടുള്ള പ്ലേ ആരംഭിക്കുന്നത് പരാജയപ്പെട്ടു. സെർവർ ട്രാൻസ്‌കോഡ് ഉപയോഗിച്ച് വീണ്ടും ശ്രമിക്കണോ?';

  @override
  String get retryWithTranscode => 'ട്രാൻസ്കോഡ് ഉപയോഗിച്ച് വീണ്ടും ശ്രമിക്കുക';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Dolby Vision പിന്തുണയ്ക്കുന്നില്ല';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'ഈ ഉപകരണത്തിന് Dolby Vision ഉള്ളടക്കം നേരിട്ട് ഡീകോഡ് ചെയ്യാൻ കഴിയില്ല. HDR10 ഫാൾബാക്ക് ഉപയോഗിക്കുക അല്ലെങ്കിൽ സെർവർ ട്രാൻസ്‌കോഡിംഗ് അഭ്യർത്ഥിക്കുക.';

  @override
  String get rememberMyChoice => 'എൻ്റെ തിരഞ്ഞെടുപ്പ് ഓർക്കുക';

  @override
  String get playHdr10Fallback => 'HDR10 ഫാൾബാക്ക് പ്ലേ ചെയ്യുക';

  @override
  String get requestTranscode => 'ട്രാൻസ്കോഡ് അഭ്യർത്ഥിക്കുക';

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
  String get seeAll => 'എല്ലാം കാണുക';

  @override
  String get noItems => 'ഇനങ്ങളില്ല';

  @override
  String get switchUser => 'ഉപയോക്താവിനെ മാറ്റുക';

  @override
  String get remoteControl => 'റിമോട്ട് കൺട്രോൾ';

  @override
  String get mediaBarLoading => 'മീഡിയ ബാർ ലോഡ് ചെയ്യുന്നു...';

  @override
  String get mediaBarError => 'മീഡിയ ബാർ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get offlineServerUnavailable =>
      'ഇൻ്റർനെറ്റിലേക്ക് കണക്‌റ്റ് ചെയ്‌തിട്ടുണ്ട്, എന്നാൽ നിലവിലെ സെർവർ ലഭ്യമല്ല.';

  @override
  String get offlineNoInternet =>
      'നിങ്ങൾ ഓഫ്‌ലൈനാണ്. ഡൗൺലോഡ് ചെയ്ത ഉള്ളടക്കം മാത്രമേ ലഭ്യമാകൂ.';

  @override
  String get offlineFileNotAvailable => 'ഫയൽ ലഭ്യമല്ല';

  @override
  String get offlineSwitchServer => 'സെർവർ മാറുക';

  @override
  String get offlineSavedMedia => 'സംരക്ഷിച്ച മീഡിയ';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'റിമോട്ട് പ്ലേബാക്ക്';

  @override
  String castControlFailed(String error) {
    return 'കാസ്റ്റ് നിയന്ത്രണം പരാജയപ്പെട്ടു: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind നിയന്ത്രണങ്ങൾ';
  }

  @override
  String get castDeviceVolume => 'ഉപകരണ വോളിയം';

  @override
  String get castVolumeUnavailable => 'ലഭ്യമല്ല';

  @override
  String castStopKind(String kind) {
    return 'നിർത്തുക $kind';
  }

  @override
  String get audioLabel => 'ഓഡിയോ';

  @override
  String get subtitlesLabel => 'സബ്ടൈറ്റിലുകൾ';

  @override
  String get pinConfirmTitle => 'പിൻ സ്ഥിരീകരിക്കുക';

  @override
  String get pinSetTitle => 'പിൻ സജ്ജീകരിക്കുക';

  @override
  String get pinEnterTitle => 'പിൻ നൽകുക';

  @override
  String get pinReenterToConfirm =>
      'സ്ഥിരീകരിക്കാൻ നിങ്ങളുടെ പിൻ വീണ്ടും നൽകുക';

  @override
  String pinEnterNDigit(int length) {
    return '$length-അക്ക പിൻ നൽകുക';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'നിങ്ങളുടെ $length-അക്ക പിൻ നൽകുക';
  }

  @override
  String get pinIncorrect => 'തെറ്റായ പിൻ';

  @override
  String get pinMismatch => 'PIN-കൾ പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get pinForgot => 'പിൻ മറന്നോ?';

  @override
  String get pinClear => 'ക്ലിയർ';

  @override
  String get pinBackspace => 'ബാക്ക്സ്പേസ്';

  @override
  String get quickConnectAuthorized => 'ദ്രുത കണക്ഷൻ അഭ്യർത്ഥന അംഗീകരിച്ചു.';

  @override
  String get quickConnectInvalidOrExpired =>
      'ദ്രുത കണക്റ്റ് കോഡ് അസാധുവാണ് അല്ലെങ്കിൽ കാലഹരണപ്പെട്ടു.';

  @override
  String get quickConnectNotSupported =>
      'ഈ സെർവറിൽ Quick Connect പിന്തുണയ്ക്കുന്നില്ല.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect കോഡ് അംഗീകരിക്കുന്നതിൽ പരാജയപ്പെട്ടു.';

  @override
  String get quickConnectDisabled =>
      'ഈ സെർവറിൽ ദ്രുത കണക്ഷൻ പ്രവർത്തനരഹിതമാക്കിയിരിക്കുന്നു.';

  @override
  String get quickConnectForbidden =>
      'നിങ്ങളുടെ അക്കൗണ്ടിന് ഈ ദ്രുത കണക്ഷൻ അഭ്യർത്ഥന അംഗീകരിക്കാൻ കഴിയില്ല.';

  @override
  String get quickConnectNotFound =>
      'ദ്രുത കണക്റ്റ് കോഡ് കണ്ടെത്തിയില്ല. ഒരു പുതിയ കോഡ് പരീക്ഷിക്കുക.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'ദ്രുത കണക്ഷൻ പരാജയപ്പെട്ടു: $message';
  }

  @override
  String get quickConnectEnterCode => 'കോഡ് നൽകുക';

  @override
  String get quickConnectAuthorize => 'അധികാരപ്പെടുത്തുക';

  @override
  String remoteCommandFailed(String error) {
    return 'കമാൻഡ് പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get remoteControlTitle => 'റിമോട്ട് കൺട്രോൾ';

  @override
  String get remoteFailedToLoadSessions =>
      'സെഷനുകൾ ലോഡുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get remoteNoSessions => 'നിയന്ത്രിക്കാവുന്ന സെഷനുകളൊന്നുമില്ല';

  @override
  String get remoteStartPlayback => 'മറ്റൊരു ഉപകരണത്തിൽ പ്ലേബാക്ക് ആരംഭിക്കുക';

  @override
  String get unknownUser => 'അജ്ഞാതം';

  @override
  String get unknownItem => 'അജ്ഞാതം';

  @override
  String get remoteNothingPlaying => 'ഈ സെഷനിൽ ഒന്നും പ്ലേ ചെയ്യുന്നില്ല';

  @override
  String get castingStarted => 'തിരഞ്ഞെടുത്ത ഉപകരണത്തിൽ കാസ്റ്റിംഗ് ആരംഭിച്ചു';

  @override
  String castingFailed(String error) {
    return 'കാസ്റ്റിംഗ് ആരംഭിക്കുന്നതിൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get noRemoteDevices => 'വിദൂര പ്ലേബാക്ക് ഉപകരണങ്ങളൊന്നും ലഭ്യമല്ല.';

  @override
  String get noRemoteDevicesIos =>
      'വിദൂര പ്ലേബാക്ക് ഉപകരണങ്ങളൊന്നും ലഭ്യമല്ല.\n\niOS-ൽ, AirPlay ടാർഗെറ്റുകൾ സിമുലേറ്ററിൽ ലഭ്യമല്ലായിരിക്കാം.';

  @override
  String get trackActionPlayNext => 'അടുത്തത് കളിക്കുക';

  @override
  String get trackActionAddToQueue => 'ക്യൂവിൽ ചേർക്കുക';

  @override
  String get trackActionAddToPlaylist => 'പ്ലേലിസ്റ്റിലേക്ക് ചേർക്കുക';

  @override
  String get trackActionCancelDownload => 'ഡൗൺലോഡ് റദ്ദാക്കുക';

  @override
  String get trackActionDeleteFromPlaylist =>
      'പ്ലേലിസ്റ്റിൽ നിന്ന് ഇല്ലാതാക്കുക';

  @override
  String get trackActionMoveUp => 'മുകളിലേക്ക് നീങ്ങുക';

  @override
  String get trackActionMoveDown => 'താഴേക്ക് നീങ്ങുക';

  @override
  String get trackActionRemoveFromFavorites =>
      'പ്രിയപ്പെട്ടവയിൽ നിന്ന് നീക്കം ചെയ്യുക';

  @override
  String get trackActionAddToFavorites => 'പ്രിയപ്പെട്ടവയിലേക്ക് ചേർക്കുക';

  @override
  String get trackActionGoToAlbum => 'ആൽബത്തിലേക്ക് പോകുക';

  @override
  String get trackActionGoToArtist => 'കലാകാരനിലേക്ക് പോകുക';

  @override
  String trackActionDownloading(String name) {
    return 'ഡൗൺലോഡ് ചെയ്യുന്നു $name...';
  }

  @override
  String get trackActionDeletedFile => 'ഡൗൺലോഡ് ചെയ്ത ഫയൽ ഇല്ലാതാക്കി';

  @override
  String get trackActionDeleteFileFailed =>
      'ഡൗൺലോഡ് ചെയ്ത ഫയൽ ഇല്ലാതാക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get shuffleBy => 'ഷഫിൾ ബൈ';

  @override
  String get shuffleSelectLibrary => 'ലൈബ്രറി തിരഞ്ഞെടുക്കുക';

  @override
  String get shuffleSelectGenre => 'തരം തിരഞ്ഞെടുക്കുക';

  @override
  String get shuffleLibrary => 'ലൈബ്രറി';

  @override
  String get shuffleGenre => 'തരം';

  @override
  String get shuffleNoLibraries => 'അനുയോജ്യമായ ലൈബ്രറികളൊന്നും ലഭ്യമല്ല.';

  @override
  String get shuffleNoGenres => 'ഈ ഷഫിൾ മോഡിനായി തരങ്ങളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get posterDisplayTitle => 'പ്രദർശിപ്പിക്കുക';

  @override
  String get posterImageType => 'ഇമേജ് തരം';

  @override
  String get imageTypePoster => 'പോസ്റ്റർ';

  @override
  String get imageTypeThumbnail => 'ലഘുചിത്രം';

  @override
  String get imageTypeBanner => 'ബാനർ';

  @override
  String get playlistAddFailed =>
      'പ്ലേലിസ്റ്റിലേക്ക് ചേർക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get playlistCreateFailed =>
      'പ്ലേലിസ്റ്റ് സൃഷ്ടിക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get playlistNew => 'പുതിയ പ്ലേലിസ്റ്റ്';

  @override
  String get playlistCreate => 'സൃഷ്ടിക്കുക';

  @override
  String get playlistCreateNew => 'പുതിയ പ്ലേലിസ്റ്റ് സൃഷ്ടിക്കുക';

  @override
  String get playlistNoneFound => 'പ്ലേലിസ്റ്റുകളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get addToPlaylist => 'പ്ലേലിസ്റ്റിലേക്ക് ചേർക്കുക';

  @override
  String get lyricsNotAvailable => 'വരികളൊന്നും ലഭ്യമല്ല';

  @override
  String get upNext => 'അടുത്തത്';

  @override
  String get playNext => 'അടുത്തത് കളിക്കുക';

  @override
  String get stillWatchingContent =>
      'പ്ലേബാക്ക് താൽക്കാലികമായി നിർത്തി. നിങ്ങൾ ഇപ്പോഴും കാണുന്നുണ്ടോ?';

  @override
  String get stillWatchingStop => 'നിർത്തുക';

  @override
  String get stillWatchingContinue => 'തുടരുക';

  @override
  String skipSegment(String segment) {
    return 'ഒഴിവാക്കുക $segment';
  }

  @override
  String get liveTv => 'ലൈവ് ടി.വി';

  @override
  String get continueWatchingAndNextUp => 'കാണുന്നത് തുടരുക & അടുത്തത്';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'ഡൗൺലോഡ് ചെയ്യുന്നു $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'ഡൗൺലോഡ് ചെയ്യുന്നു $fileName';
  }

  @override
  String get nextEpisode => 'അടുത്ത എപ്പിസോഡ്';

  @override
  String get moreFromThisSeason => 'ഈ സീസണിൽ നിന്ന് കൂടുതൽ';

  @override
  String get playerTooltipPlaybackSpeed => 'പ്ലേബാക്ക് വേഗത';

  @override
  String get playerTooltipCastControls => 'കാസ്റ്റ് നിയന്ത്രണങ്ങൾ';

  @override
  String get playerTooltipPlaybackQuality => 'ബിറ്റ്റേറ്റ്';

  @override
  String get playerTooltipEnterFullscreen => 'പൂർണ്ണസ്‌ക്രീനിൽ പ്രവേശിക്കുക';

  @override
  String get playerTooltipExitFullscreen =>
      'പൂർണ്ണസ്‌ക്രീനിൽ നിന്ന് പുറത്തുകടക്കുക';

  @override
  String get playerTooltipFloatOnTop => 'മുകളിൽ ഫ്ലോട്ട്';

  @override
  String get playerTooltipExitFloatOnTop =>
      'മുകളിൽ ഫ്ലോട്ട് പ്രവർത്തനരഹിതമാക്കുക';

  @override
  String get playerTooltipLockLandscape => 'ലാൻഡ്സ്കേപ്പ് ലോക്ക് ചെയ്യുക';

  @override
  String get playerTooltipUnlockOrientation => 'റൊട്ടേഷൻ അനുവദിക്കുക';

  @override
  String get playerTooltipPrevious => 'മുമ്പത്തെ';

  @override
  String get playerTooltipSeekBack => 'തിരികെ അന്വേഷിക്കുക';

  @override
  String get playerTooltipSeekForward => 'മുന്നോട്ട് അന്വേഷിക്കുക';

  @override
  String get contextMenuMarkWatched => 'കണ്ടതായി അടയാളപ്പെടുത്തുക';

  @override
  String get contextMenuMarkUnwatched => 'കണ്ടിട്ടില്ലെന്ന് അടയാളപ്പെടുത്തുക';

  @override
  String get contextMenuAddToFavorites => 'പ്രിയപ്പെട്ടവയിലേക്ക് ചേർക്കുക';

  @override
  String get contextMenuRemoveFromFavorites =>
      'പ്രിയപ്പെട്ടവയിൽ നിന്ന് നീക്കം ചെയ്യുക';

  @override
  String get contextMenuGoToSeries => 'സീരീസിലേക്ക് പോകുക';

  @override
  String get settingsAdministrationSubtitle =>
      'സെർവർ അഡ്മിനിസ്ട്രേഷൻ പാനൽ ആക്സസ് ചെയ്യുക';

  @override
  String get settingsAccountSecurity => 'അക്കൗണ്ടും സുരക്ഷയും';

  @override
  String get settingsAccountSecuritySubtitle =>
      'പ്രാമാണീകരണം, പിൻ കോഡ്, രക്ഷാകർതൃ നിയന്ത്രണങ്ങൾ';

  @override
  String get settingsPersonalization => 'വ്യക്തിഗതമാക്കൽ';

  @override
  String get settingsPersonalizationSubtitle =>
      'തീം, നാവിഗേഷൻ, ഹോം വരികൾ, ലൈബ്രറി ദൃശ്യപരത';

  @override
  String get settingsDynamicContent => 'ഡൈനാമിക് ഉള്ളടക്കം';

  @override
  String get settingsDynamicContentSubtitle => 'മീഡിയ ബാറും വിഷ്വൽ ഓവർലേകളും';

  @override
  String get settingsPlaybackSyncplay => 'പ്ലേബാക്ക് & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'ഓഡിയോ/വീഡിയോ ക്രമീകരണങ്ങൾ, സബ്‌ടൈറ്റിലുകൾ, ഡൗൺലോഡുകൾ, SyncPlay നിയന്ത്രണങ്ങൾ';

  @override
  String get settingsIntegrationsSubtitle =>
      'പ്ലഗിൻ സമന്വയം, സീർ, റേറ്റിംഗുകൾ എന്നിവയും അതിലേറെയും';

  @override
  String get settingsAboutSubtitle =>
      'ആപ്പ് പതിപ്പ്, നിയമപരമായ വിവരങ്ങൾ, ക്രെഡിറ്റുകൾ';

  @override
  String get settingsAuthenticationSection => 'പ്രാമാണീകരണം';

  @override
  String get settingsSortServersBy => 'സെർവറുകൾ അടുക്കുക';

  @override
  String get settingsLastUsed => 'അവസാനം ഉപയോഗിച്ചത്';

  @override
  String get settingsAlphabetical => 'അക്ഷരമാലാക്രമം';

  @override
  String get settingsPrivacyAndSafetySection => 'സ്വകാര്യതയും സുരക്ഷയും';

  @override
  String get settingsBlockedRatings => 'തടഞ്ഞ റേറ്റിംഗുകൾ';

  @override
  String get settingsGeneralStyle => 'പൊതു ശൈലി';

  @override
  String get settingsGeneralStyleSubtitle =>
      'തീം ആക്‌സൻ്റുകൾ, ബാക്ക്‌ഡ്രോപ്പുകൾ, കണ്ട സൂചകങ്ങൾ, തീം സംഗീതം';

  @override
  String get settingsHomePage => 'ഹോം പേജ്';

  @override
  String get settingsHomePageSubtitle =>
      'വിഭാഗങ്ങൾ, ചിത്ര തരങ്ങൾ, ഓവർലേകൾ, മീഡിയ പ്രിവ്യൂകൾ';

  @override
  String get settingsLibrariesSubtitle =>
      'ലൈബ്രറി ദൃശ്യപരത, ഫോൾഡർ കാഴ്ച, മൾട്ടി-സെർവർ സ്വഭാവം';

  @override
  String get settingsTwentyFourHourClock => '24-മണിക്കൂർ ക്ലോക്ക്';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'ക്ലോക്ക് കാണിക്കുന്നിടത്തെല്ലാം 24 മണിക്കൂർ സമയ ഫോർമാറ്റിംഗ് ഉപയോഗിക്കുക';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'നാവിഗേഷൻ ബാറിൽ ഷഫിൾ ബട്ടൺ കാണിക്കുക';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'നാവിഗേഷൻ ബാറിൽ വിഭാഗങ്ങളുടെ ബട്ടൺ കാണിക്കുക';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'നാവിഗേഷൻ ബാറിൽ പ്രിയപ്പെട്ടവ ബട്ടൺ കാണിക്കുക';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'നാവിഗേഷൻ ബാറിലെ ലൈബ്രറികളുടെ ബട്ടൺ കാണിക്കുക';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'ഓരോ ലൈബ്രറിയിലും ഹോം പേജ് ദൃശ്യപരത ടോഗിൾ ചെയ്യുക. മാറ്റങ്ങൾ പ്രാബല്യത്തിൽ വരുന്നതിന് Moonfin പുനരാരംഭിക്കുക.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'മീഡിയ ബാറും പ്രാദേശിക പ്രിവ്യൂകളും';

  @override
  String get settingsVisualOverlays => 'വിഷ്വൽ ഓവർലേകൾ';

  @override
  String get settingsSeasonalSurprise => 'സീസണൽ സർപ്രൈസ്';

  @override
  String get settingsMetadataAndRatings => 'മെറ്റാഡാറ്റയും റേറ്റിംഗുകളും';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase അധിക റേറ്റിംഗ് ഉറവിടങ്ങൾ, സീർ അഭ്യർത്ഥനകൾ, സമന്വയിപ്പിച്ച മുൻഗണനകൾ എന്നിവ ഉൾപ്പെടെയുള്ള സെർവർ-സൈഡ് സംയോജനങ്ങൾക്ക് ശക്തി നൽകുന്നു.';

  @override
  String get settingsOfflineDownloads => 'ഓഫ്‌ലൈൻ ഡൗൺലോഡുകൾ';

  @override
  String get settingsHigh => 'ഉയർന്നത്';

  @override
  String get settingsLow => 'താഴ്ന്നത്';

  @override
  String get settingsCustomPath => 'ഇഷ്ടാനുസൃത പാത';

  @override
  String get settingsEnterDownloadFolderPath => 'ഡൗൺലോഡ് ഫോൾഡർ പാത്ത് നൽകുക';

  @override
  String get settingsConcurrentDownloads => 'കൺകറൻ്റ് ഡൗൺലോഡുകൾ';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'ഒരേസമയം ഡൗൺലോഡ് ചെയ്യാനുള്ള പരമാവധി എണ്ണം ഇനങ്ങൾ.';

  @override
  String get settingsAppInfo => 'ആപ്പ് വിവരം';

  @override
  String get settingsReportAnIssue => 'ഒരു പ്രശ്നം റിപ്പോർട്ട് ചെയ്യുക';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub എന്നതിൽ ഇഷ്യൂ ട്രാക്കർ തുറക്കുക';

  @override
  String get settingsJoinDiscord => 'ചേരുക Discord';

  @override
  String get settingsJoinDiscordSubtitle =>
      'കമ്മ്യൂണിറ്റിയുമായി ചാറ്റ് ചെയ്യുക';

  @override
  String get settingsJoinTheDiscord => 'Discord എന്നതിൽ ചേരുക';

  @override
  String get settingsSupportMoonfin => 'പിന്തുണ Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'നിയമപരമായ';

  @override
  String get settingsLicenses => 'ലൈസൻസുകൾ';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'ഓപ്പൺ സോഴ്സ് ലൈസൻസ് അറിയിപ്പുകൾ';

  @override
  String get settingsPrivacyPolicy => 'സ്വകാര്യതാ നയം';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'എങ്ങനെയാണ് Moonfin നിങ്ങളുടെ ഡാറ്റ കൈകാര്യം ചെയ്യുന്നത്';

  @override
  String get settingsCheckForUpdates => 'അപ്‌ഡേറ്റുകൾക്കായി പരിശോധിക്കുക';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'ഏറ്റവും പുതിയ Moonfin റിലീസിനായി പരിശോധിക്കുക';

  @override
  String get settingsPoweredByFlutter => 'Flutter നാൽ പ്രവർത്തിക്കുന്നത്';

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
  String get settingsBoth => 'രണ്ടും';

  @override
  String get settingsShuffleContentTypeFilter =>
      'ഉള്ളടക്ക തരം ഫിൽട്ടർ ഷഫിൾ ചെയ്യുക';

  @override
  String get settingsVideoPlaybackPreferences => 'വീഡിയോ പ്ലേബാക്ക് മുൻഗണനകൾ';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'പ്രധാന വീഡിയോ എഞ്ചിനും സ്ട്രീമിംഗ് ഗുണനിലവാര ക്രമീകരണങ്ങളും';

  @override
  String get settingsAudioPreferences => 'ഓഡിയോ മുൻഗണനകൾ';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ഓഡിയോ ട്രാക്കുകൾ, പ്രോസസ്സിംഗ്, പാസ്ത്രൂ ഓപ്ഷനുകൾ';

  @override
  String get settingsAutomationAndQueue => 'ഓട്ടോമേഷൻ & ക്യൂ';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'ഓട്ടോമേറ്റഡ് പ്ലേബാക്കും സീക്വൻസിംഗും';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'ഡൗൺലോഡ് ഗുണനിലവാരം, സംഭരണ ​​പരിധികൾ, ക്യൂ വലുപ്പം';

  @override
  String get settingsSyncplaySubtitle =>
      'ഗ്രൂപ്പ് സെഷനുകൾക്കുള്ള സിൻക്രൊണൈസേഷൻ ലോജിക്';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'പ്രത്യേക കളിക്കാരുടെ സവിശേഷതകൾ. ചില ഓപ്‌ഷനുകൾ പ്ലേബാക്ക് പ്രശ്‌നങ്ങൾ ഉണ്ടാക്കിയേക്കാം എന്നതിനാൽ ജാഗ്രതയോടെ ഉപയോഗിക്കുക';

  @override
  String get settingsSkipIntrosAndOutros =>
      'ആമുഖങ്ങളും ഔട്ട്റോകളും ഒഴിവാക്കണോ?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => 'പ്രോംപ്റ്റ് ഉപയോക്താവ്';

  @override
  String get settingsSkip => 'ഒഴിവാക്കുക';

  @override
  String get settingsDoNothing => 'ഒന്നും ചെയ്യരുത്';

  @override
  String get settingsMaxBitrateDescription =>
      'സ്ട്രീമിംഗ് ബിറ്റ്റേറ്റ് ക്യാപ് ചെയ്യുക. ഈ പരിധിക്ക് മുകളിലുള്ള ഉള്ളടക്കം അനുയോജ്യമാക്കുന്നതിന് ട്രാൻസ്കോഡ് ചെയ്യപ്പെടും.';

  @override
  String get settingsMaxResolutionDescription =>
      'കളിക്കാരൻ ആവശ്യപ്പെടുന്ന പരമാവധി റെസല്യൂഷൻ പരിമിതപ്പെടുത്തുക. ഉയർന്ന മിഴിവുള്ള ഉള്ളടക്കം ട്രാൻസ്‌കോഡ് ഡൗൺ ചെയ്യപ്പെടും.';

  @override
  String get settingsPlayerZoomDescription =>
      'സ്‌ക്രീനിന് അനുയോജ്യമായ രീതിയിൽ വീഡിയോ എങ്ങനെ സ്‌കെയിൽ ചെയ്യണം.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'പ്ലേബാക്ക് എഞ്ചിൻ (ആൻഡ്രോയിഡ് ടിവി)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV ഉപകരണങ്ങളിൽ ഡിഫോൾട്ട് പ്ലേബാക്ക് എഞ്ചിൻ തിരഞ്ഞെടുക്കുക. അടുത്ത പ്ലേബാക്ക് സെഷനിൽ മാറ്റങ്ങൾ ബാധകമാണ്.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (ശുപാർശ ചെയ്യുന്നു)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (പൈതൃകം)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (പൈതൃകം)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (ശുപാർശ ചെയ്യുന്നു)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision ഫാൾബാക്ക്';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision ഡീകോഡിംഗ് ഇല്ലാതെ ഉപകരണങ്ങളിൽ Dolby Vision ശീർഷകങ്ങൾക്കുള്ള പെരുമാറ്റം.';

  @override
  String get settingsAskEachTime => 'ഓരോ തവണയും ചോദിക്കുക';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 ഫാൾബാക്ക് തിരഞ്ഞെടുക്കുക';

  @override
  String get settingsPreferServerTranscode =>
      'സെർവർ ട്രാൻസ്‌കോഡ് തിരഞ്ഞെടുക്കുക';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision പ്രൊഫൈൽ 7 ഡയറക്ട് പ്ലേ';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision പ്രൊഫൈൽ 7 എൻഹാൻസ്‌മെൻ്റ്-ലെയർ സ്ട്രീമുകൾ നേരിട്ട് പ്ലേ ചെയ്യണമോ എന്നത് നിയന്ത്രിക്കുന്നു.';

  @override
  String get settingsAutoAftkrtEnabled =>
      'സ്വയമേവ (AFTKRT പ്രവർത്തനക്ഷമമാക്കി)';

  @override
  String get settingsEnabledOnThisDevice => 'ഈ ഉപകരണത്തിൽ പ്രവർത്തനക്ഷമമാക്കി';

  @override
  String get settingsDisabledPreferTranscode =>
      'പ്രവർത്തനരഹിതമാക്കി (ട്രാൻസ്‌കോഡ് മുൻഗണന നൽകുക)';

  @override
  String get settingsResumeRewindDescription =>
      'പ്ലേബാക്ക് പുനരാരംഭിക്കുമ്പോൾ (കാണുന്നത് തുടരുക എന്നതിൽ നിന്നോ മീഡിയ ഇനം പേജിൽ നിന്നോ), എത്ര സെക്കൻഡ് റിവൈൻഡ് ചെയ്യണം?';

  @override
  String get settingsUnpauseRewindDescription =>
      'താൽക്കാലികമായി നിർത്തുക ബട്ടൺ അമർത്തിപ്പിടിച്ച് പ്ലേബാക്ക് പുനരാരംഭിക്കുമ്പോൾ, എത്ര സെക്കൻഡ് റിവൈൻഡ് ചെയ്യണം?';

  @override
  String get settingsSkipBackLengthDescription =>
      'റിവൈൻഡ് ബട്ടൺ അമർത്തി എത്ര സെക്കൻ്റുകൾ പിന്നിലേക്ക് ചാടണം.';

  @override
  String get settingsOneSecond => '1 സെക്കൻഡ്';

  @override
  String get settingsThreeSeconds => '3 സെക്കൻഡ്';

  @override
  String get settingsFortyFiveSeconds => '45 സെക്കൻഡ്';

  @override
  String get settingsSixtySeconds => '60 സെക്കൻഡ്';

  @override
  String get settingsSkipForwardLengthDescription =>
      'ഫാസ്റ്റ് ഫോർവേഡ് ബട്ടൺ അമർത്തിയാൽ എത്ര സെക്കൻ്റുകൾ മുന്നോട്ട് കുതിക്കണം.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'ബിറ്റ്സ്ട്രീം AC3 ബാഹ്യ ഡീകോഡറിലേക്ക്';

  @override
  String get settingsCinemaMode => 'സിനിമാ മോഡ്';

  @override
  String get settingsCinemaModeSubtitle =>
      'ഒരു പ്രധാന ഫീച്ചറിന് മുമ്പ് ട്രെയിലറുകൾ/പ്രീറോളുകൾ പ്ലേ ചെയ്യുക';

  @override
  String get settingsNextUpDisplayDescription =>
      'എപ്പിസോഡ് കലാസൃഷ്‌ടിയും വിവരണവും ഉള്ള ഒരു മുഴുവൻ കാർഡ് വിപുലീകരിച്ചത് കാണിക്കുന്നു. ചുരുങ്ങിയത് ഒരു കോംപാക്റ്റ് കൗണ്ട്ഡൗൺ ഓവർലേ കാണിക്കുന്നു. പ്രവർത്തനരഹിതമാക്കിയത് നിർദ്ദേശം പൂർണ്ണമായും മറയ്ക്കുന്നു.';

  @override
  String get settingsShort => 'ചെറുത്';

  @override
  String get settingsLong => 'നീണ്ട';

  @override
  String get settingsVeryLong => 'വളരെ നീണ്ട';

  @override
  String get settingsVideoStartDelay => 'വീഡിയോ ആരംഭിക്കാൻ കാലതാമസം';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'ലൈവ് ടിവി ഡയറക്ട്';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'തത്സമയ ടിവിയ്‌ക്കായി നേരിട്ട് പ്ലേ ചെയ്യുന്നത് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get settingsOpenGroups => 'ഗ്രൂപ്പുകൾ തുറക്കുക';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay ഗ്രൂപ്പുകൾ സൃഷ്‌ടിക്കുക, ചേരുക അല്ലെങ്കിൽ നിയന്ത്രിക്കുക';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay പ്രവർത്തനക്ഷമമാക്കി';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'ഗ്രൂപ്പ് കാണൽ ഫീച്ചറുകൾ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get settingsSyncplayButton => 'SyncPlay ബട്ടൺ';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'നാവിഗേഷൻ ബാറിൽ SyncPlay ബട്ടൺ കാണിക്കുക';

  @override
  String get settingsSyncplayAdvancedCorrection => 'വിപുലമായ തിരുത്തൽ';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'സൂക്ഷ്മമായ സമന്വയ ലോജിക് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get settingsSyncplaySyncCorrection => 'സമന്വയ തിരുത്തൽ';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'സമന്വയത്തിൽ തുടരാൻ പ്ലേബാക്ക് സ്വയമേവ ക്രമീകരിക്കുക';

  @override
  String get settingsSyncplaySpeedToSync => 'സമന്വയിപ്പിക്കുന്നതിനുള്ള വേഗത';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'സമന്വയിപ്പിക്കാൻ പ്ലേബാക്ക് വേഗത ക്രമീകരണം ഉപയോഗിക്കുക';

  @override
  String get settingsSyncplaySkipToSync => 'സമന്വയത്തിലേക്ക് പോകുക';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'സമന്വയിപ്പിക്കാൻ തിരയുന്നത് ഉപയോഗിക്കുക';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'കുറഞ്ഞ വേഗത കാലതാമസം';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'പരമാവധി വേഗത കാലതാമസം';

  @override
  String get settingsSyncplaySpeedDuration => 'സ്പീഡ് ദൈർഘ്യം';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'ഏറ്റവും കുറഞ്ഞ ഒഴിവാക്കൽ കാലതാമസം';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay അധിക ഓഫ്സെറ്റ്';

  @override
  String get onNow => 'ഇപ്പോൾ';

  @override
  String get collections => 'ശേഖരങ്ങൾ';

  @override
  String get lastPlayed => 'അവസാനം കളിച്ചത്';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'ഏറ്റവും പുതിയ $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '';
  }

  @override
  String get autoplayNextEpisode => 'അടുത്ത എപ്പിസോഡ് സ്വയമേവ പ്ലേ ചെയ്യുക';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'ലഭ്യമാകുമ്പോൾ അടുത്ത എപ്പിസോഡ് സ്വയമേവ പ്ലേ ചെയ്യുക.';

  @override
  String get skipSilenceTitle => 'നിശബ്ദത ഒഴിവാക്കുക';

  @override
  String get skipSilenceSubtitle =>
      'സ്ട്രീം പിന്തുണയ്‌ക്കുമ്പോൾ നിശബ്ദ ഓഡിയോ സെഗ്‌മെൻ്റുകൾ സ്വയമേവ ഒഴിവാക്കുക.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'ബാഹ്യ ഓഡിയോ ഇഫക്റ്റുകൾ അനുവദിക്കുക';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Media3 പ്ലേബാക്ക് സെഷനുകളിലേക്ക് അറ്റാച്ചുചെയ്യാൻ ഇക്വലൈസർ, ഇഫക്റ്റ് ആപ്പുകൾ (ഉദാ. Wavelet) അനുവദിക്കുക.';

  @override
  String get disableTunnelingTitle => 'ടണലിംഗ് പ്രവർത്തനരഹിതമാക്കുക';

  @override
  String get disableTunnelingSubtitle =>
      'ടണൽ ചെയ്യാത്ത പ്ലേബാക്ക് നിർബന്ധിക്കുക. ടണലിംഗ് ഓഡിയോ/വീഡിയോ നിർത്തലുള്ള ഉപകരണങ്ങളിൽ ഉപയോഗപ്രദമാണ്.';

  @override
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

  @override
  String get mapDolbyVisionP7Title =>
      'മാപ്പ് Dolby Vision പ്രൊഫൈൽ 7-ലേക്ക് HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'ഡിവി ഇതര ഉപകരണങ്ങളിൽ Dolby Vision പ്രൊഫൈൽ 7 സ്ട്രീമുകൾ HDR10-അനുയോജ്യമായ HEVC ആയി പ്ലേ ചെയ്യുക.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'ഉൾച്ചേർത്ത സബ്ടൈറ്റിൽ ശൈലികൾ ഉപയോഗിക്കുക';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'സബ്‌ടൈറ്റിൽ ട്രാക്കിൽ ഉൾച്ചേർത്ത നിറങ്ങൾ, ഫോണ്ടുകൾ, പൊസിഷനിംഗ് എന്നിവ പ്രയോഗിക്കുക. പകരം നിങ്ങളുടെ അടിക്കുറിപ്പ് ശൈലി മുൻഗണനകൾ ഉപയോഗിക്കുന്നത് പ്രവർത്തനരഹിതമാക്കുക.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'ഉൾച്ചേർത്ത സബ്ടൈറ്റിൽ ഫോണ്ട് വലുപ്പങ്ങൾ ഉപയോഗിക്കുക';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'സബ്‌ടൈറ്റിൽ ട്രാക്കിൽ ഉൾച്ചേർത്ത ഫോണ്ട് സൈസ് സൂചനകൾ പ്രയോഗിക്കുക. നിങ്ങളുടെ ശൈലി മുൻഗണനകളിൽ നിന്ന് സബ്‌ടൈറ്റിൽ സൈസ് ഉപയോഗിക്കുന്നത് പ്രവർത്തനരഹിതമാക്കുക.';

  @override
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

  @override
  String get useDetailedSubHeadings => 'വിശദമായ ഉപതലക്കെട്ടുകൾ ഉപയോഗിക്കുക';

  @override
  String get useDetailedSubHeadingsDescription =>
      'ലൈബ്രറി പേജുകളിൽ വിശദമായതോ കുറഞ്ഞതോ ആയ സബ്റോ കാണിക്കുക.';

  @override
  String get savedThemesDeleteDialogTitle => 'സംരക്ഷിച്ച തീം ഇല്ലാതാക്കണോ?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'ഈ ഉപകരണ കാഷെയിൽ നിന്ന് \"$themeName\" നീക്കം ചെയ്യണോ?';
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
    return 'ഈ ഉപകരണത്തിൽ നിന്ന് \"$themeName\" ഇല്ലാതാക്കി.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" ഇല്ലാതാക്കാൻ കഴിഞ്ഞില്ല.';
  }

  @override
  String get savedThemesTitle => 'സംരക്ഷിച്ച തീമുകൾ';

  @override
  String get savedThemesDescription =>
      'നിലവിലെ സെർവറിനായുള്ള Moonfin പ്ലഗിനിൽ നിന്ന് ഡൗൺലോഡ് ചെയ്‌ത തീമുകളാണ് ഇവ. ഇല്ലാതാക്കുന്നത് ഈ പ്രാദേശിക പകർപ്പ് മാത്രമേ നീക്കംചെയ്യൂ.';

  @override
  String get savedThemesEmpty =>
      'ഈ സെർവറിനായി സംരക്ഷിച്ച തീമുകളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • നിലവിൽ സജീവമാണ്';
  }

  @override
  String get savedThemesDeleteTooltip => 'സംരക്ഷിച്ച തീം ഇല്ലാതാക്കുക';

  @override
  String get savedThemesManageSubtitle =>
      'ഈ ഉപകരണത്തിൽ ഡൗൺലോഡ് ചെയ്‌ത പ്ലഗിൻ തീമുകൾ നിയന്ത്രിക്കുക';

  @override
  String get themeEditor => 'തീം എഡിറ്റർ';

  @override
  String get themeEditorSubtitle =>
      'നിങ്ങളുടെ ബ്രൗസറിൽ Moonfin തീം എഡിറ്റർ തുറക്കുക';

  @override
  String get homeScreen => 'ഹോം സ്‌ക്രീൻ';

  @override
  String get bottomBar => 'താഴെയുള്ള ബാർ';

  @override
  String get homeRowsStyleClassic => 'ക്ലാസിക്';

  @override
  String get homeRowsStyleModern => 'ആധുനികം';

  @override
  String get homeRowsSection => 'ഹോം വരികൾ';

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
  String get rowsType => 'വരികളുടെ തരം';

  @override
  String get rowsTypeDescription =>
      'ക്ലാസിക് ഓരോ വരി ചിത്ര തരവും വിവര ഓവർലേയും നിലനിർത്തുന്നു. മോഡേൺ പോർട്രെയ്‌റ്റ്-ടു-ബാക്ക്‌ഡ്രോപ്പ് വരികൾ ഉപയോഗിക്കുന്നു.';

  @override
  String get displayFavoritesRows => 'പ്രിയപ്പെട്ട വരികൾ പ്രദർശിപ്പിക്കുക';

  @override
  String get displayFavoritesRowsSubtitle =>
      'ഹോം സെക്ഷനുകളിൽ പ്രിയപ്പെട്ട സിനിമകൾ, പരമ്പരകൾ, മറ്റ് പ്രിയപ്പെട്ട വരികൾ എന്നിവ കാണിക്കുക.';

  @override
  String get favoritesRowSorting => 'പ്രിയപ്പെട്ടവ വരി അടുക്കൽ';

  @override
  String get favoritesRowSortingDescription =>
      'ചേർത്ത തീയതി, റിലീസ് തീയതി, അക്ഷരമാലാക്രമം എന്നിവയും അതിലേറെയും അനുസരിച്ച് പ്രിയപ്പെട്ട വരികൾ അടുക്കുക.';

  @override
  String get displayCollectionsRows => 'ശേഖരണ വരികൾ പ്രദർശിപ്പിക്കുക';

  @override
  String get displayCollectionsRowsSubtitle =>
      'ഹോം സെക്ഷനുകളിൽ ശേഖരണ വരികൾ കാണിക്കുക.';

  @override
  String get collectionsRowSorting => 'ശേഖരങ്ങളുടെ വരി അടുക്കൽ';

  @override
  String get collectionsRowSortingDescription =>
      'ചേർത്ത തീയതി, റിലീസ് തീയതി, അക്ഷരമാലാക്രമം എന്നിവയും അതിലേറെയും അനുസരിച്ച് ശേഖരങ്ങളുടെ വരികൾ അടുക്കുക.';

  @override
  String get displayGenresRows => 'ജനറുകളുടെ വരികൾ പ്രദർശിപ്പിക്കുക';

  @override
  String get displayGenresRowsSubtitle =>
      'ഹോം വിഭാഗങ്ങളിൽ വിഭാഗങ്ങളുടെ വരികൾ കാണിക്കുക.';

  @override
  String get genresRowSorting => 'വിഭാഗങ്ങളുടെ വരി അടുക്കൽ';

  @override
  String get genresRowSortingDescription =>
      'ചേർത്ത തീയതി, റിലീസ് തീയതി, അക്ഷരമാലാക്രമം എന്നിവയും അതിലേറെയും അനുസരിച്ച് വിഭാഗങ്ങളുടെ വരികൾ അടുക്കുക.';

  @override
  String get genresRowItems => 'വിഭാഗങ്ങളുടെ വരി ഇനങ്ങൾ';

  @override
  String get genresRowItemsDescription =>
      'സിനിമകൾ, പരമ്പരകൾ, അല്ലെങ്കിൽ രണ്ടും വിഭാഗങ്ങളുടെ വരികളിൽ കാണിക്കുക.';

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
  String get appearance => 'രൂപഭാവം';

  @override
  String get cardSize => 'കാർഡ് വലിപ്പം';

  @override
  String get externalPlayerApp => 'ബാഹ്യ പ്ലെയർ ആപ്പ്';

  @override
  String get externalPlayerAppDescription => '';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'പ്ലേബാക്ക് ആരംഭിക്കുമ്പോൾ ആപ്പ് ചൂസർ കാണിക്കുക.';

  @override
  String get loadingInstalledPlayers =>
      'ഇൻസ്റ്റാൾ ചെയ്ത പ്ലേയറുകൾ ലോഡുചെയ്യുന്നു...';

  @override
  String get connection => 'കണക്ഷൻ';

  @override
  String get audioTranscodeTarget => 'ഓഡിയോ ട്രാൻസ്‌കോഡ് ലക്ഷ്യം';

  @override
  String get passthrough => 'പാസ്ത്രൂ';

  @override
  String get supportedOnThisDevice => 'ഈ ഉപകരണത്തിൽ പിന്തുണയ്ക്കുന്നു';

  @override
  String get notSupportedOnThisDevice => 'ഈ ഉപകരണത്തിൽ പിന്തുണയില്ല';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) പാസ്ത്രൂ';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'ബാഹ്യ ഡീകോഡറിലേക്ക് ബിറ്റ്സ്ട്രീം DTS:X (DTS UHD).';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Atmos (JOC) പാസ്ത്രൂ ഉള്ള TrueHD';

  @override
  String get mediaPlayerBehavior => 'മീഡിയ പ്ലെയർ പെരുമാറ്റം';

  @override
  String get playbackEnhancements => 'പ്ലേബാക്ക് മെച്ചപ്പെടുത്തലുകൾ';

  @override
  String get alwaysOn => 'എപ്പോഴും ഓണാണ്.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'സ്‌കിപ്പ് ഔട്ട്‌റോയ്ക്ക് പകരം നെക്സ്റ്റ് അപ്പ് ഡിസ്‌പ്ലേ';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'സ്കിപ്പ് ഔട്ട്‌റോ ബട്ടണിന് പകരം അടുത്ത അപ്പ് ഓവർലേ കാണിക്കുക.';

  @override
  String get playerRouting => 'പ്ലെയർ റൂട്ടിംഗ്';

  @override
  String get preferSoftwareDecoders => 'സോഫ്റ്റ്‌വെയർ ഡീകോഡറുകൾ മുൻഗണന നൽകുക';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'ഹാർഡ്‌വെയർ ഡീകോഡറുകൾക്ക് മുമ്പ് FFmpeg (ഓഡിയോ), libgav1 (AV1) എന്നിവ ഉപയോഗിക്കുക. HDMI ഓഡിയോ പാസ്‌ത്രൂ തകരാറിലായാൽ പ്രവർത്തനരഹിതമാക്കുക.';

  @override
  String get useExternalPlayer => 'ബാഹ്യ പ്ലേയർ ഉപയോഗിക്കുക';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV-യിൽ നിങ്ങൾ തിരഞ്ഞെടുത്ത ബാഹ്യ ആപ്പിൽ വീഡിയോ പ്ലേബാക്ക് തുറക്കുക.';

  @override
  String get automaticQueuing => 'ഓട്ടോമാറ്റിക് ക്യൂയിംഗ്';

  @override
  String get preferSdhSubtitles => 'SDH സബ്‌ടൈറ്റിലുകൾ തിരഞ്ഞെടുക്കുക';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'സ്വയമേവ തിരഞ്ഞെടുക്കുമ്പോൾ SDH/CC സബ്‌ടൈറ്റിൽ ട്രാക്കുകൾക്ക് മുൻഗണന നൽകുക.';

  @override
  String get webDiagnostics => 'വെബ് ഡയഗ്നോസ്റ്റിക്സ്';

  @override
  String get webDiagnosticsTitle => 'Moonfin വെബ് ഡയഗ്നോസ്റ്റിക്സ്';

  @override
  String get webDiagnosticsIntro =>
      'ബ്രൗസർ കണക്റ്റിവിറ്റി പ്രശ്നങ്ങൾ (CORS, മിക്സഡ് ഉള്ളടക്കം, കണ്ടെത്തൽ ക്രമീകരണം) കണ്ടുപിടിക്കാൻ ഈ പേജ് ഉപയോഗിക്കുക.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'മിക്സഡ്-ഉള്ളടക്ക പരാജയം കണ്ടെത്തി';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/പ്രീഫ്ലൈറ്റ് പരാജയം കണ്ടെത്തി';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin ഒരു HTTP സെർവർ URL-ലേക്ക് വിളിക്കാൻ ശ്രമിക്കുന്ന ഒരു HTTPS പേജ് കണ്ടെത്തി. ഈ അഭ്യർത്ഥന നിങ്ങളുടെ സെർവറിൽ എത്തുന്നതിന് മുമ്പ് ബ്രൗസറുകൾ തടയുന്നു.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin മീഡിയ സെർവറിലെ CORS അല്ലെങ്കിൽ പ്രിഫ്ലൈറ്റ് ഹെഡറുകൾ നഷ്‌ടപ്പെടുന്നത് കാരണം സാധാരണയായി സംഭവിക്കുന്ന ബ്രൗസർ-ലെവൽ അഭ്യർത്ഥന പരാജയം കണ്ടെത്തി.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'ടാർഗെറ്റ് URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'വിശദാംശങ്ങൾ: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'നിലവിലെ റൺടൈം സന്ദർഭം';

  @override
  String get webDiagnosticsOrigin => 'ഉത്ഭവം';

  @override
  String get webDiagnosticsScheme => 'സ്കീം';

  @override
  String get webDiagnosticsPluginMode => 'പ്ലഗിൻ മോഡ്';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC സ്കാൻ';

  @override
  String get webDiagnosticsForcedServerUrl => 'നിർബന്ധിത സെർവർ URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'ഡിഫോൾട്ട് സെർവർ URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'ഡിസ്കവറി പ്രോക്സി URL';

  @override
  String get notConfigured => 'ക്രമീകരിച്ചിട്ടില്ല';

  @override
  String get webDiagnosticsMixedContent => 'സമ്മിശ്ര ഉള്ളടക്കം';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'ഈ പേജ് HTTPS-ൽ ലോഡുചെയ്‌തു, എന്നാൽ ഒന്നോ അതിലധികമോ കോൺഫിഗർ ചെയ്‌ത URL-കൾ HTTP ആണ്. HTTP API-കളെ വിളിക്കുന്നതിൽ നിന്ന് HTTPS പേജുകളെ ബ്രൗസറുകൾ തടയുന്നു.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'പരിഹരിക്കുക: HTTPS വഴി നിങ്ങളുടെ മീഡിയ സെർവർ അല്ലെങ്കിൽ പ്രോക്സി എൻഡ്‌പോയിൻ്റ് സേവിക്കുക, അല്ലെങ്കിൽ വിശ്വസനീയമായ പ്രാദേശിക നെറ്റ്‌വർക്കുകളിൽ മാത്രം HTTP വഴി Moonfin ലോഡ് ചെയ്യുക.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'നിലവിലെ റൺടൈം ക്രമീകരണങ്ങളിൽ നിന്ന് വ്യക്തമായ മിക്സഡ്-ഉള്ളടക്ക കോൺഫിഗറേഷനൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS ചെക്ക്‌ലിസ്റ്റ്';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin-ൽ ബ്രൗസർ ഉത്ഭവം അനുവദിക്കുക.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers-ൽ Authorization, X-Emby-Authorization, X-Emby-Token എന്നിവ ഉൾപ്പെടുത്തുക.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• സ്ട്രീമിംഗിനായി ഉള്ളടക്ക-പരിധി, അംഗീകരിക്കൽ-പരിധികൾ എന്നിവ വെളിപ്പെടുത്തുക, പെരുമാറ്റം തേടുക.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS പ്രിഫ്ലൈറ്റ് അഭ്യർത്ഥനകളിലേക്ക് 204 മടങ്ങുക.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'ഉദാഹരണ തലക്കെട്ട് സ്നിപ്പെറ്റ് (nginx-ശൈലി)';

  @override
  String get note => 'കുറിപ്പ്';

  @override
  String get webDiagnosticsNonWebNote =>
      'ഈ ഡയഗ്നോസ്റ്റിക്സ് റൂട്ട് വെബ് ബിൽഡുകൾക്ക് വേണ്ടിയുള്ളതാണ്. നിങ്ങൾ ഇത് മറ്റൊരു പ്ലാറ്റ്‌ഫോമിൽ കാണുന്നുണ്ടെങ്കിൽ, ഈ പരിശോധനകൾ ബാധകമായേക്കില്ല.';

  @override
  String get backToServerSelect => 'സെർവറിലേക്ക് മടങ്ങുക തിരഞ്ഞെടുക്കുക';

  @override
  String get signOutAllUsers => 'എല്ലാ ഉപയോക്താക്കളെയും സൈൻ ഔട്ട് ചെയ്യുക';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'മൈക്രോഫോൺ അനുമതി ശാശ്വതമായി നിരസിക്കപ്പെട്ടു. സിസ്റ്റം ക്രമീകരണങ്ങളിൽ ഇത് പ്രവർത്തനക്ഷമമാക്കുക.';

  @override
  String get voiceSearchPermissionRequired =>
      'ശബ്ദ തിരയലിന് മൈക്രോഫോൺ അനുമതി ആവശ്യമാണ്.';

  @override
  String get voiceSearchNoMatch => 'അത് പിടികിട്ടിയില്ല. വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get voiceSearchNoSpeechDetected => 'സംസാരമൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get voiceSearchMicrophoneError => 'മൈക്രോഫോൺ പിശക്.';

  @override
  String get voiceSearchNeedsInternet => 'ശബ്ദ തിരയലിന് ഇൻ്റർനെറ്റ് ആവശ്യമാണ്.';

  @override
  String get voiceSearchServiceBusy =>
      'വോയ്സ് സർവീസ് തിരക്കിലാണ്. വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'മൈക്രോഫോൺ അനുമതി ശാശ്വതമായി നിരസിക്കപ്പെട്ടു.';

  @override
  String get microphonePermissionDenied => 'മൈക്രോഫോൺ അനുമതി നിരസിച്ചു.';

  @override
  String get speechRecognitionUnavailable =>
      'ഈ ഉപകരണത്തിൽ സംഭാഷണം തിരിച്ചറിയൽ ലഭ്യമല്ല.';

  @override
  String get openIosRoutePicker => 'iOS റൂട്ട് പിക്കർ തുറക്കുക';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay റൂട്ട് പിക്കർ ഈ ഉപകരണത്തിൽ ലഭ്യമല്ല.';

  @override
  String get videos => 'വീഡിയോകൾ';

  @override
  String get trailers => 'ട്രെയിലറുകൾ';

  @override
  String get programs => 'പ്രോഗ്രാമുകൾ';

  @override
  String get songs => 'ഗാനങ്ങൾ';

  @override
  String get photoAlbums => 'ഫോട്ടോ ആൽബങ്ങൾ';

  @override
  String get photos => 'ഫോട്ടോകൾ';

  @override
  String get people => 'ആളുകൾ';

  @override
  String get recentlyReleasedEpisodes => 'അടുത്തിടെ പുറത്തിറങ്ങിയ എപ്പിസോഡുകൾ';

  @override
  String get watchAgain => 'വീണ്ടും കാണുക';

  @override
  String get guestAppearances => 'അതിഥി വേഷങ്ങൾ';

  @override
  String get appearancesSeerr => 'രൂപഭാവങ്ങൾ (സീർ)';

  @override
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'ഗ്രൂപ്പിനൊപ്പം കാണുക';

  @override
  String get errors => 'പിശകുകൾ';

  @override
  String get warnings => 'മുന്നറിയിപ്പുകൾ';

  @override
  String get disk => 'ഡിസ്ക്';

  @override
  String get openInBrowser => 'ബ്രൗസറിൽ തുറക്കുക';

  @override
  String get embeddedBrowserNotAvailable =>
      'എംബഡഡ് ബ്രൗസർ ഈ പ്ലാറ്റ്‌ഫോമിൽ ലഭ്യമല്ല.';

  @override
  String get adminRestartServerConfirmation =>
      'സെർവർ പുനരാരംഭിക്കണമെന്ന് തീർച്ചയാണോ?';

  @override
  String get adminShutdownServerConfirmation =>
      'സെർവർ ഷട്ട് ഡൗൺ ചെയ്യണമെന്ന് തീർച്ചയാണോ? നിങ്ങൾ ഇത് സ്വമേധയാ പുനരാരംഭിക്കേണ്ടതുണ്ട്.';

  @override
  String get internal => 'ആന്തരികം';

  @override
  String get idle => 'നിഷ്ക്രിയ';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'ഉപയോക്താക്കളെ കണ്ടെത്തിയില്ല';

  @override
  String get adminNoUsersMatchSearch =>
      'നിങ്ങളുടെ തിരയലുമായി പൊരുത്തപ്പെടുന്ന ഉപയോക്താക്കളൊന്നും ഇല്ല';

  @override
  String get adminNoDevicesFound => 'ഉപകരണങ്ങളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'നിലവിലെ ഫിൽട്ടറുകളുമായി ഉപകരണങ്ങളൊന്നും പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get passwordSet => 'പാസ്‌വേഡ് സെറ്റ്';

  @override
  String get noPasswordConfigured => 'പാസ്‌വേഡ് ക്രമീകരിച്ചിട്ടില്ല';

  @override
  String get remoteAccess => 'വിദൂര ആക്സസ്';

  @override
  String get localOnly => 'ലോക്കൽ മാത്രം';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'മീഡിയ അനലിറ്റിക്‌സ് ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'എല്ലാ മീഡിയ ലൈബ്രറികളിലും സംയോജിത വിശകലനം.';

  @override
  String get analyticsTopArtists => 'മുൻനിര കലാകാരന്മാർ';

  @override
  String get analyticsTopAuthors => 'മുൻനിര എഴുത്തുകാർ';

  @override
  String get analyticsTopContributors => 'മുൻനിര സംഭാവകർ';

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
      'ഈ തിരഞ്ഞെടുപ്പിനായി ഇതുവരെ സൂചികയിലാക്കിയ മീഡിയ മൊത്തങ്ങളൊന്നും ലഭ്യമല്ല.';

  @override
  String get analyticsLibraryDetails => 'ലൈബ്രറി വിശദാംശങ്ങൾ';

  @override
  String get analyticsLibraryBreakdown => 'ലൈബ്രറി തകരാർ';

  @override
  String get analyticsNoLibrariesAvailable => 'ലൈബ്രറികളൊന്നും ലഭ്യമല്ല.';

  @override
  String get adminServerAdministrationTitle => 'സെർവർ അഡ്മിനിസ്ട്രേഷൻ';

  @override
  String get adminServerPathData => 'ഡാറ്റ';

  @override
  String get adminServerPathImageCache => 'ഇമേജ് കാഷെ';

  @override
  String get adminServerPathCache => 'കാഷെ';

  @override
  String get adminServerPathLogs => 'രേഖകൾ';

  @override
  String get adminServerPathMetadata => 'മെറ്റാഡാറ്റ';

  @override
  String get adminServerPathTranscode => 'ട്രാൻസ്കോഡ്';

  @override
  String get adminServerPathWeb => 'വെബ്';

  @override
  String get adminNoServerPathsReturned =>
      'ഈ സെർവർ തിരികെ നൽകിയ സെർവർ പാതകളൊന്നും.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ഉപയോഗിച്ചു';
  }

  @override
  String get userActivity => 'ഉപയോക്തൃ പ്രവർത്തനം';

  @override
  String get systemEvents => 'സിസ്റ്റം ഇവൻ്റുകൾ';

  @override
  String get needsAttention => 'ശ്രദ്ധ ആവശ്യമാണ്';

  @override
  String get adminDrawerSectionServer => 'സെർവർ';

  @override
  String get adminDrawerSectionPlayback => 'പ്ലേബാക്ക്';

  @override
  String get adminDrawerSectionDevices => 'ഉപകരണങ്ങൾ';

  @override
  String get adminDrawerSectionAdvanced => 'വിപുലമായ';

  @override
  String get adminDrawerSectionPlugins => 'പ്ലഗിനുകൾ';

  @override
  String get adminDrawerSectionLiveTv => 'ലൈവ് ടി.വി';

  @override
  String get homeVideos => 'ഹോം വീഡിയോകൾ';

  @override
  String get mixedContent => 'സമ്മിശ്ര ഉള്ളടക്കം';

  @override
  String get homeVideosAndPhotos => 'ഹോം വീഡിയോകളും ഫോട്ടോകളും';

  @override
  String get mixedMoviesAndShows => 'മിക്സഡ് സിനിമകളും ഷോകളും';

  @override
  String get intelQuickSync => 'ഇൻ്റൽ ദ്രുത സമന്വയം';

  @override
  String get rockchipMpp => 'റോക്ക്ചിപ്പ് എംപിപി';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'റെക്കോർഡിംഗുകളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension ആർക്കൈവിനുള്ളിൽ ചിത്ര പേജുകളൊന്നും കണ്ടെത്തിയില്ല.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'ഉൾച്ചേർത്ത റെൻഡറർ പരാജയപ്പെട്ടു ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB റെൻഡറർ പരാജയപ്പെട്ടു ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'വായനക്കാരന് പ്രാദേശിക ഫയൽ നഷ്‌ടമായി: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri എന്നതിൽ നിന്ന് ബുക്ക് ഡാറ്റ തുറക്കുമ്പോൾ HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'വായിക്കാനാകുന്ന ബുക്ക് എൻഡ് പോയിൻ്റ് ലഭ്യമല്ല';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'പിന്തുണയ്ക്കാത്ത കോമിക് ആർക്കൈവ് ഫോർമാറ്റ്: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR എക്‌സ്‌ട്രാക്ഷൻ പ്ലഗിൻ ഈ പ്ലാറ്റ്‌ഫോമിൽ ലഭ്യമല്ല.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr ആർക്കൈവ് എക്‌സ്‌ട്രാക്‌റ്റുചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു.';

  @override
  String get cb7ExtractionUnavailable =>
      'ഈ പ്ലാറ്റ്‌ഫോമിൽ CB7 എക്‌സ്‌ട്രാക്ഷൻ ലഭ്യമല്ല.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 എക്‌സ്‌ട്രാക്ഷൻ പ്ലഗിൻ ഈ പ്ലാറ്റ്‌ഫോമിൽ ലഭ്യമല്ല.';

  @override
  String get closeGenrePanel => 'തരം പാനൽ അടയ്ക്കുക';

  @override
  String get loadingShuffle => 'ഷഫിൾ ലോഡുചെയ്യുന്നു...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'യാന്ത്രിക HDR സ്വിച്ചിംഗ്';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR വീഡിയോ പ്ലേബാക്കിനായി HDR സ്വയമേവ പ്രവർത്തനക്ഷമമാക്കുകയും പുറത്തുകടക്കുമ്പോൾ ഡിസ്പ്ലേ മോഡ് പുനഃസ്ഥാപിക്കുകയും ചെയ്യുക.';

  @override
  String get whenFullscreen => 'ഫുൾസ്ക്രീൻ ആയിരിക്കുമ്പോൾ';

  @override
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'ട്രാൻസ്കോഡിംഗ് പരിധികൾ';

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
  String get externalLists => 'External Home Row Lists';

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
}
