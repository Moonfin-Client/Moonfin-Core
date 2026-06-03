// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਮੂਨਫਿਨ';

  @override
  String get signIn => 'ਸਾਈਨ - ਇਨ';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'ਤੇਜ਼ ਕਨੈਕਟ';

  @override
  String get password => 'ਪਾਸਵਰਡ';

  @override
  String get username => 'ਯੂਜ਼ਰਨੇਮ';

  @override
  String get email => 'ਈਮੇਲ';

  @override
  String get quickConnectInstruction =>
      'ਆਪਣੇ ਸਰਵਰ ਦੇ ਵੈੱਬ ਡੈਸ਼ਬੋਰਡ \'ਤੇ ਇਹ ਕੋਡ ਦਰਜ ਕਰੋ:';

  @override
  String get waitingForAuthorization => 'ਅਧਿਕਾਰ ਦੀ ਉਡੀਕ ਕਰ ਰਿਹਾ ਹੈ...';

  @override
  String get back => 'ਪਿੱਛੇ';

  @override
  String get serverUnavailable => 'ਸਰਵਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String get loginFailed => 'ਲਾਗਿਨ ਅਸਫਲ ਰਿਹਾ';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'ਕੌਣ ਦੇਖ ਰਿਹਾ ਹੈ?';

  @override
  String get addUser => 'ਉਪਭੋਗਤਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get selectServer => 'ਸਰਵਰ ਚੁਣੋ';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'ਸੁਰੱਖਿਅਤ ਸਰਵਰ';

  @override
  String get discoveredServers => 'ਖੋਜਿਆ ਸਰਵਰ';

  @override
  String get noneFound => 'ਕੋਈ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get unableToConnectToServer => 'ਸਰਵਰ ਨਾਲ ਜੁੜਨ ਵਿੱਚ ਅਸਮਰੱਥ';

  @override
  String get addServer => 'ਸਰਵਰ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get embyConnect => 'Emby ਕਨੈਕਟ';

  @override
  String get removeServer => 'ਸਰਵਰ ਹਟਾਓ';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get remove => 'ਹਟਾਓ';

  @override
  String get connectToServer => 'ਸਰਵਰ ਨਾਲ ਜੁੜੋ';

  @override
  String get serverAddress => 'ਸਰਵਰ ਪਤਾ';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'ਜੁੜੋ';

  @override
  String get secureStorageUnavailable => 'ਸੁਰੱਖਿਅਤ ਸਟੋਰੇਜ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin ਤੁਹਾਡੀ ਸਿਸਟਮ ਕੀਰਿੰਗ ਤੱਕ ਪਹੁੰਚ ਨਹੀਂ ਕਰ ਸਕਿਆ। ਲੌਗਇਨ ਜਾਰੀ ਰਹਿ ਸਕਦਾ ਹੈ, ਪਰ ਕੀਰਿੰਗ ਅਨਲੌਕ ਹੋਣ ਤੱਕ ਸੁਰੱਖਿਅਤ ਟੋਕਨ ਸਟੋਰੇਜ ਉਪਲਬਧ ਨਹੀਂ ਹੋ ਸਕਦੀ ਹੈ।';

  @override
  String get ok => 'ਠੀਕ ਹੈ';

  @override
  String get settingsAppearanceTheme => 'ਐਪ ਥੀਮ';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'ਐਪ ਨੂੰ ਰੀਸਟਾਰਟ ਕੀਤੇ ਬਿਨਾਂ Moonfin ਅਤੇ Neon Pulse ਵਿਚਕਾਰ ਸਵਿਚ ਕਰੋ';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'ਮੂਨਫਿਨ';

  @override
  String get themeMoonfinSubtitle =>
      'ਮੌਜੂਦਾ Moonfin ਦਿੱਖ ਤੁਹਾਨੂੰ ਸਭ ਨੂੰ ਪਿਆਰ ਹੋ ਗਈ ਹੈ';

  @override
  String get themeNeonPulse => 'ਨਿਓਨ ਪਲਸ';

  @override
  String get themeNeonPulseSubtitle =>
      'ਮੈਜੈਂਟਾ ਗਲੋ, ਸਿਆਨ ਟੈਕਸਟ, ਅਤੇ ਮਜ਼ਬੂਤ ​​ਕ੍ਰੋਮ ਕੰਟ੍ਰਾਸਟ ਦੇ ਨਾਲ ਸਿੰਥਵੇਵ ਸਟਾਈਲਿੰਗ';

  @override
  String get embyConnectSignInSubtitle =>
      'ਆਪਣੇ Emby ਕਨੈਕਟ ਖਾਤੇ ਨਾਲ ਸਾਈਨ ਇਨ ਕਰੋ';

  @override
  String get emailOrUsername => 'ਈਮੇਲ ਜਾਂ ਉਪਭੋਗਤਾ ਨਾਮ';

  @override
  String get selectAServer => 'ਇੱਕ ਸਰਵਰ ਚੁਣੋ';

  @override
  String get tryAgain => 'ਫਿਰ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get noLinkedServers => 'ਇਸ Emby ਕਨੈਕਟ ਖਾਤੇ ਨਾਲ ਕੋਈ ਸਰਵਰ ਲਿੰਕ ਨਹੀਂ ਹੈ';

  @override
  String get invalidEmbyConnectCredentials => 'ਅਵੈਧ Emby ਕਨੈਕਟ ਪ੍ਰਮਾਣ ਪੱਤਰ';

  @override
  String get invalidEmbyConnectLogin =>
      'ਅਵੈਧ Emby ਕਨੈਕਟ ਉਪਭੋਗਤਾ ਨਾਮ ਜਾਂ ਪਾਸਵਰਡ';

  @override
  String get embyConnectExchangeNotSupported =>
      'ਸਰਵਰ Emby ਕਨੈਕਟ ਐਕਸਚੇਂਜ ਦਾ ਸਮਰਥਨ ਨਹੀਂ ਕਰਦਾ ਹੈ';

  @override
  String get embyConnectNetworkError =>
      'Emby ਕਨੈਕਟ ਜਾਂ ਚੁਣੇ ਹੋਏ ਸਰਵਰ ਨਾਲ ਸੰਪਰਕ ਕਰਨ ਦੌਰਾਨ ਨੈੱਟਵਰਕ ਗੜਬੜ';

  @override
  String get loadingLinkedServers =>
      'ਲਿੰਕ ਕੀਤੇ ਸਰਵਰਾਂ ਨੂੰ ਲੋਡ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get connectingToServerEllipsis => 'ਸਰਵਰ ਨਾਲ ਕਨੈਕਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get noReachableAddress => 'ਕੋਈ ਪਹੁੰਚਯੋਗ ਪਤਾ ਨਹੀਂ ਦਿੱਤਾ ਗਿਆ';

  @override
  String get invalidServerExchangeResponse =>
      'ਸਰਵਰ ਐਕਸਚੇਂਜ ਐਂਡਪੁਆਇੰਟ ਤੋਂ ਅਵੈਧ ਜਵਾਬ';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin ਤੋਂ ਬਾਹਰ ਜਾਣਾ?';

  @override
  String get exitAppConfirmation =>
      'ਕੀ ਤੁਸੀਂ ਯਕੀਨੀ ਤੌਰ \'ਤੇ ਬਾਹਰ ਜਾਣਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get exit => 'ਨਿਕਾਸ';

  @override
  String get noHomeRowsLoaded => 'ਕੋਈ ਘਰੇਲੂ ਕਤਾਰਾਂ ਨੂੰ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ';

  @override
  String get noHomeRowsHint =>
      'ਕਿਰਿਆਸ਼ੀਲ ਘਰੇਲੂ ਭਾਗਾਂ ਨੂੰ ਤਾਜ਼ਾ ਕਰਨ ਜਾਂ ਘਟਾਉਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get retryHomeRows => 'ਘਰ ਦੀਆਂ ਕਤਾਰਾਂ ਦੀ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get guide => 'ਗਾਈਡ';

  @override
  String get recordings => 'ਰਿਕਾਰਡਿੰਗਜ਼';

  @override
  String get schedule => 'ਤਹਿ';

  @override
  String get series => 'ਲੜੀ';

  @override
  String get noItemsFound => 'ਕੋਈ ਆਈਟਮਾਂ ਨਹੀਂ ਮਿਲੀਆਂ';

  @override
  String get home => 'ਘਰ';

  @override
  String get browseAll => 'ਸਭ ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get genres => 'ਸ਼ੈਲੀਆਂ';

  @override
  String get collectionPlaceholder => 'ਸੰਗ੍ਰਹਿ ਆਈਟਮਾਂ ਇੱਥੇ ਦਿਖਾਈ ਦੇਣਗੀਆਂ';

  @override
  String get browseByLetter => 'ਅੱਖਰ ਦੁਆਰਾ ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'ਵਰਣਮਾਲਾ ਬ੍ਰਾਊਜ਼ ਇੱਥੇ ਦਿਖਾਈ ਦੇਵੇਗਾ';

  @override
  String get suggestions => 'ਸੁਝਾਅ';

  @override
  String get suggestionsPlaceholder => 'ਸੁਝਾਈਆਂ ਗਈਆਂ ਆਈਟਮਾਂ ਇੱਥੇ ਦਿਖਾਈ ਦੇਣਗੀਆਂ';

  @override
  String get failedToLoadLibraries => 'ਲਾਇਬ੍ਰੇਰੀਆਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get noLibrariesFound => 'ਕੋਈ ਲਾਇਬ੍ਰੇਰੀਆਂ ਨਹੀਂ ਮਿਲੀਆਂ';

  @override
  String get library => 'ਲਾਇਬ੍ਰੇਰੀ';

  @override
  String get displaySettings => 'ਡਿਸਪਲੇ ਸੈਟਿੰਗਜ਼';

  @override
  String get allGenres => 'ਸਾਰੀਆਂ ਸ਼ੈਲੀਆਂ';

  @override
  String get noGenresFound => 'ਕੋਈ ਸ਼ੈਲੀਆਂ ਨਹੀਂ ਲੱਭੀਆਂ';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'ਇਹ ਫੋਲਡਰ ਖਾਲੀ ਹੈ';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'ਮਨਪਸੰਦ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get noFavoritesYet => 'ਅਜੇ ਤੱਕ ਕੋਈ ਮਨਪਸੰਦ ਨਹੀਂ';

  @override
  String get favorites => 'ਮਨਪਸੰਦ';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'ਜਾਰੀ ਹੈ';

  @override
  String get ended => 'ਖਤਮ ਹੋ ਗਿਆ';

  @override
  String get sortAndFilter => 'ਕ੍ਰਮਬੱਧ ਅਤੇ ਫਿਲਟਰ';

  @override
  String get type => 'ਟਾਈਪ ਕਰੋ';

  @override
  String get sortBy => 'ਦੇ ਨਾਲ ਕ੍ਰਮਬੱਧ';

  @override
  String get display => 'ਡਿਸਪਲੇ';

  @override
  String get imageType => 'ਚਿੱਤਰ ਦੀ ਕਿਸਮ';

  @override
  String get posterSize => 'ਪੋਸਟਰ ਦਾ ਆਕਾਰ';

  @override
  String get small => 'ਛੋਟਾ';

  @override
  String get medium => 'ਦਰਮਿਆਨਾ';

  @override
  String get large => 'ਵੱਡਾ';

  @override
  String get extraLarge => 'ਵਾਧੂ ਵੱਡਾ';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'ਦ੍ਰਿਸ਼';

  @override
  String get albums => 'ਐਲਬਮਾਂ';

  @override
  String get albumArtists => 'ਐਲਬਮ ਕਲਾਕਾਰ';

  @override
  String get artists => 'ਕਲਾਕਾਰ';

  @override
  String get bookmarks => 'ਬੁੱਕਮਾਰਕਸ';

  @override
  String get noSavedBookmarks =>
      'ਇਸ ਸਿਰਲੇਖ ਲਈ ਅਜੇ ਤੱਕ ਕੋਈ ਸੁਰੱਖਿਅਤ ਕੀਤੇ ਬੁੱਕਮਾਰਕ ਨਹੀਂ ਹਨ।';

  @override
  String get openBook => 'ਕਿਤਾਬ ਖੋਲ੍ਹੋ';

  @override
  String get chapter => 'ਅਧਿਆਇ';

  @override
  String get page => 'ਪੰਨਾ';

  @override
  String get bookmark => 'ਬੁੱਕਮਾਰਕ';

  @override
  String get justNow => 'ਹੁਣੇ';

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
  String get discoverySubjects => 'ਖੋਜ ਵਿਸ਼ੇ';

  @override
  String get pickDiscoverySubjects =>
      'ਚੁਣੋ ਕਿ ਡਿਸਕਵਰ ਵਿੱਚ ਕਿਹੜਾ ਵਿਸ਼ਾ ਫੀਡ ਦਿਖਾਉਣਾ ਹੈ।';

  @override
  String get apply => 'ਲਾਗੂ ਕਰੋ';

  @override
  String get openLink => 'ਲਿੰਕ ਖੋਲ੍ਹੋ';

  @override
  String get scanWithYourPhone => 'ਆਪਣੇ ਫ਼ੋਨ ਨਾਲ ਸਕੈਨ ਕਰੋ';

  @override
  String get audiobookGenres => 'ਆਡੀਓਬੁੱਕ ਸ਼ੈਲੀਆਂ';

  @override
  String get pickAudiobookGenres =>
      'ਔਡੀਓਬੁੱਕ ਡਿਸਕਵਰ ਵਿੱਚ ਦਿਖਾਉਣ ਲਈ ਕਿਹੜੀਆਂ ਸ਼ੈਲੀਆਂ ਚੁਣੋ।';

  @override
  String get discoverAudiobooks => 'ਆਡੀਓਬੁੱਕਾਂ ਦੀ ਖੋਜ ਕਰੋ';

  @override
  String get librivoxDescription => 'LibriVox ਤੋਂ ਪ੍ਰਸਿੱਧ ਜਨਤਕ ਡੋਮੇਨ ਸਿਰਲੇਖ।';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'ਖੱਬੇ ਪਾਸੇ ਸਕ੍ਰੋਲ ਕਰੋ';

  @override
  String get scrollRight => 'ਸੱਜੇ ਸਕ੍ਰੋਲ ਕਰੋ';

  @override
  String get couldNotLoadGenre => 'ਇਸ ਸ਼ੈਲੀ ਨੂੰ ਹੁਣੇ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ।';

  @override
  String get continueReading => 'ਪੜ੍ਹਨਾ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get savedHighlights => 'ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਹਾਈਲਾਈਟਸ';

  @override
  String get continueListening => 'ਸੁਣਨਾ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get listen => 'ਸੁਣੋ';

  @override
  String get resume => 'ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get failedToLoadLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get popularNow => 'ਹੁਣ ਪ੍ਰਸਿੱਧ';

  @override
  String get savedForLater => 'ਬਾਅਦ ਲਈ ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਗਿਆ';

  @override
  String get topListens => 'ਚੋਟੀ ਦੀਆਂ ਸੁਣੀਆਂ';

  @override
  String get unreadDiscoveries => 'ਅਣਪੜ੍ਹੀਆਂ ਖੋਜਾਂ';

  @override
  String get pickUpAgain => 'ਦੁਬਾਰਾ ਚੁੱਕੋ';

  @override
  String get bookHighlightsDescription =>
      'ਹਾਈਲਾਈਟਸ, ਮਨਪਸੰਦ, ਜਾਂ ਪੜ੍ਹਨ ਦੀ ਪ੍ਰਗਤੀ ਨਾਲ ਤੁਹਾਡੀਆਂ ਕਿਤਾਬਾਂ।';

  @override
  String get handPickedFromLibrary => 'ਤੁਹਾਡੀ ਲਾਇਬ੍ਰੇਰੀ ਤੋਂ ਹੱਥੀਂ ਚੁਣਿਆ ਗਿਆ।';

  @override
  String get handPickedFromListeningQueue =>
      'ਤੁਹਾਡੀ ਸੁਣਨ ਵਾਲੀ ਕਤਾਰ ਵਿੱਚੋਂ ਹੱਥੀਂ ਚੁਣਿਆ ਗਿਆ।';

  @override
  String get booksWithHighlights =>
      'ਹਾਈਲਾਈਟਸ, ਮਨਪਸੰਦ, ਜਾਂ ਪੜ੍ਹਨ ਦੀ ਪ੍ਰਗਤੀ ਵਾਲੀਆਂ ਕਿਤਾਬਾਂ।';

  @override
  String get jumpBackNarration =>
      'ਆਪਣੀ ਜਗ੍ਹਾ ਦਾ ਸ਼ਿਕਾਰ ਕੀਤੇ ਬਿਨਾਂ ਕਥਾ ਵਿੱਚ ਵਾਪਸ ਜਾਓ।';

  @override
  String get unreadBooksReady =>
      'ਅਣਪੜ੍ਹੀਆਂ ਕਿਤਾਬਾਂ ਅਗਲੇ ਸ਼ਾਂਤ ਘੰਟੇ ਲਈ ਤਿਆਰ ਹਨ।';

  @override
  String get quickAccessFavorites =>
      'ਉਹਨਾਂ ਕਿਤਾਬਾਂ ਤੱਕ ਤੁਰੰਤ ਪਹੁੰਚ ਜੋ ਤੁਸੀਂ ਵਾਪਸ ਆਉਂਦੇ ਰਹਿੰਦੇ ਹੋ।';

  @override
  String get searchAudiobooks => 'ਆਡੀਓਬੁੱਕ ਖੋਜੋ';

  @override
  String get searchYourLibrary => 'ਆਪਣੀ ਲਾਇਬ੍ਰੇਰੀ ਖੋਜੋ';

  @override
  String get pickUpStory => 'ਉਹ ਕਹਾਣੀ ਚੁੱਕੋ ਜਿੱਥੇ ਤੁਸੀਂ ਛੱਡੀ ਸੀ';

  @override
  String get savedPlacesChapters =>
      'ਤੁਹਾਡੀਆਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਥਾਵਾਂ ਅਤੇ ਅਧੂਰੇ ਅਧਿਆਏ';

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
  String get readyWhenYouAre => 'ਜਦੋਂ ਤੁਸੀਂ ਹੋ ਤਾਂ ਤਿਆਰ ਰਹੋ';

  @override
  String get details => 'ਵੇਰਵੇ';

  @override
  String get listeningRoom => 'ਸੁਣਨ ਵਾਲਾ ਕਮਰਾ';

  @override
  String get bookmarksAndProgress => 'ਬੁੱਕਮਾਰਕ ਅਤੇ ਤਰੱਕੀ';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'ਸਿਰਲੇਖ';

  @override
  String get allTitles => 'ਸਾਰੇ ਸਿਰਲੇਖ';

  @override
  String get authors => 'ਲੇਖਕ';

  @override
  String get browseByAuthor => 'ਲੇਖਕ ਦੁਆਰਾ ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get browseByGenre => 'ਸ਼ੈਲੀ ਦੁਆਰਾ ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get discover => 'ਖੋਜੋ';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library ਤੋਂ ਵਿਸ਼ੇ ਅਨੁਸਾਰ ਪ੍ਰਚਲਿਤ ਸਿਰਲੇਖ।';

  @override
  String get noBookmarkedItems => 'ਅਜੇ ਤੱਕ ਕੋਈ ਬੁੱਕਮਾਰਕ ਆਈਟਮਾਂ ਨਹੀਂ ਹਨ';

  @override
  String get nothingMatchesSection =>
      'ਅਜੇ ਤੱਕ ਇਸ ਸੈਕਸ਼ਨ ਨਾਲ ਕੁਝ ਵੀ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ। ਕੋਈ ਹੋਰ ਟੈਬ ਅਜ਼ਮਾਓ ਜਾਂ ਲਾਇਬ੍ਰੇਰੀ ਸਿੰਕ ਪੂਰਾ ਹੋਣ ਤੋਂ ਬਾਅਦ ਵਾਪਸ ਆਓ।';

  @override
  String get audiobooks => 'ਆਡੀਓਬੁੱਕਸ';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'ਫੋਲਡਰ';

  @override
  String get filters => 'ਫਿਲਟਰ';

  @override
  String get readingStatus => 'ਪੜ੍ਹਨ ਦੀ ਸਥਿਤੀ';

  @override
  String get playedStatus => 'ਖੇਡੀ ਗਈ ਸਥਿਤੀ';

  @override
  String get readStatus => 'ਪੜ੍ਹੋ';

  @override
  String get watched => 'ਦੇਖਿਆ';

  @override
  String get unread => 'ਨਾ ਪੜ੍ਹਿਆ';

  @override
  String get unwatched => 'ਅਣਦੇਖਿਆ';

  @override
  String get seriesStatus => 'ਸੀਰੀਜ਼ ਸਥਿਤੀ';

  @override
  String get allLibraries => 'ਸਾਰੀਆਂ ਲਾਇਬ੍ਰੇਰੀਆਂ';

  @override
  String get books => 'ਕਿਤਾਬਾਂ';

  @override
  String get author => 'ਲੇਖਕ';

  @override
  String get unknownAuthor => 'ਅਗਿਆਤ ਲੇਖਕ';

  @override
  String get uncategorized => 'ਅਨਸ਼੍ਰੇਣੀਯ';

  @override
  String get overview => 'ਸੰਖੇਪ ਜਾਣਕਾਰੀ';

  @override
  String get noLibrivoxDescription =>
      'ਇਸ ਸਿਰਲੇਖ ਲਈ ਅਜੇ ਤੱਕ LibriVox ਦੁਆਰਾ ਕੋਈ ਵੇਰਵਾ ਨਹੀਂ ਦਿੱਤਾ ਗਿਆ ਹੈ।';

  @override
  String get readers => 'ਪਾਠਕ';

  @override
  String get openLinks => 'ਲਿੰਕ ਖੋਲ੍ਹੋ';

  @override
  String get librivoxPage => 'LibriVox ਪੰਨਾ';

  @override
  String get internetArchive => 'ਇੰਟਰਨੈੱਟ ਆਰਕਾਈਵ';

  @override
  String get rssFeed => 'RSS ਫੀਡ';

  @override
  String get downloadZip => 'Zip ਡਾਊਨਲੋਡ ਕਰੋ';

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
      'ਇਸ ਸਿਰਲੇਖ ਲਈ ਅਜੇ ਤੱਕ Open Library ਤੋਂ ਕੋਈ ਸੰਖੇਪ ਜਾਣਕਾਰੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get subjects => 'ਵਿਸ਼ੇ';

  @override
  String get all => 'ਸਾਰੇ';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'ਇਸ ਵਿਸ਼ੇ ਨੂੰ ਹੁਣੇ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ।';

  @override
  String get audiobookDetails => 'ਆਡੀਓਬੁੱਕ ਵੇਰਵੇ';

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
  String get trackList => 'ਟਰੈਕ ਸੂਚੀ';

  @override
  String get itemListPlaceholder => 'ਆਈਟਮ ਸੂਚੀ ਇੱਥੇ ਦਿਖਾਈ ਦੇਵੇਗੀ';

  @override
  String get favoriteTracksPlaceholder => 'ਮਨਪਸੰਦ ਟਰੈਕ ਇੱਥੇ ਦਿਖਾਈ ਦੇਣਗੇ';

  @override
  String get failedToLoad => 'ਲੋਡ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get delete => 'ਮਿਟਾਓ';

  @override
  String get save => 'ਸੇਵ ਕਰੋ';

  @override
  String get moreLikeThis => 'ਇਸੇ ਤਰਾਂ ਦੇ ਹੋਰ';

  @override
  String get castAndCrew => 'ਕਾਸਟ ਅਤੇ ਕਰੂ';

  @override
  String get collection => 'ਸੰਗ੍ਰਹਿ';

  @override
  String get episodes => 'ਐਪੀਸੋਡ';

  @override
  String get nextUp => 'ਅਗਲਾ ਉੱਪਰ';

  @override
  String get seasons => 'ਰੁੱਤਾਂ';

  @override
  String get chapters => 'ਅਧਿਆਏ';

  @override
  String get features => 'ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ';

  @override
  String get movies => 'ਫਿਲਮਾਂ';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'ਹੋਰ';

  @override
  String get discography => 'ਡਿਸਕੋਗ੍ਰਾਫੀ';

  @override
  String get similarArtists => 'ਮਿਲਦੇ-ਜੁਲਦੇ ਕਲਾਕਾਰ';

  @override
  String get tableOfContents => 'ਵਿਸ਼ਾ - ਸੂਚੀ';

  @override
  String get tracklist => 'ਟਰੈਕਲਿਸਟ';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'ਜੀਵਨੀ';

  @override
  String get authorDetails => 'ਲੇਖਕ ਦੇ ਵੇਰਵੇ';

  @override
  String get noOverviewAvailable =>
      'ਇਸ ਸਿਰਲੇਖ ਲਈ ਅਜੇ ਤੱਕ ਕੋਈ ਸੰਖੇਪ ਜਾਣਕਾਰੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get noBiographyAvailable => 'ਇਸ ਲੇਖਕ ਲਈ ਕੋਈ ਜੀਵਨੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get noBooksFound => 'ਇਸ ਲੇਖਕ ਲਈ ਕੋਈ ਕਿਤਾਬ ਨਹੀਂ ਮਿਲੀ।';

  @override
  String get unableToLoadAuthorDetails =>
      'ਇਸ ਸਮੇਂ ਲੇਖਕ ਦੇ ਵੇਰਵੇ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਮਰੱਥ।';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'ਪ੍ਰਕਾਸ਼ਨ ਮਿਤੀ ਅਗਿਆਤ';

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
  String get view => 'ਦੇਖੋ';

  @override
  String get resumeReading => 'ਪੜ੍ਹਨਾ ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get read => 'ਪੜ੍ਹੋ';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'ਖੇਡੋ';

  @override
  String get startOver => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get restart => 'ਰੀਸਟਾਰਟ ਕਰੋ';

  @override
  String get readOffline => 'ਔਫਲਾਈਨ ਪੜ੍ਹੋ';

  @override
  String get playOffline => 'ਔਫਲਾਈਨ ਖੇਡੋ';

  @override
  String get audio => 'ਆਡੀਓ';

  @override
  String get subtitles => 'ਉਪਸਿਰਲੇਖ';

  @override
  String get version => 'ਸੰਸਕਰਣ';

  @override
  String get cast => 'ਕਾਸਟ';

  @override
  String get trailer => 'ਟ੍ਰੇਲਰ';

  @override
  String get finished => 'ਸਮਾਪਤ';

  @override
  String get favorited => 'ਮਨਪਸੰਦ';

  @override
  String get favorite => 'ਮਨਪਸੰਦ';

  @override
  String get playlist => 'ਪਲੇਲਿਸਟ';

  @override
  String get downloaded => 'ਡਾਊਨਲੋਡ ਕੀਤਾ';

  @override
  String get downloadAll => 'ਸਾਰੇ ਡਾਊਨਲੋਡ ਕਰੋ';

  @override
  String get download => 'ਡਾਊਨਲੋਡ ਕਰੋ';

  @override
  String get deleteDownloaded => 'ਡਾਊਨਲੋਡ ਕੀਤਾ ਮਿਟਾਓ';

  @override
  String get goToSeries => 'ਸੀਰੀਜ਼ \'ਤੇ ਜਾਓ';

  @override
  String get editMetadata => 'ਮੈਟਾਡੇਟਾ ਦਾ ਸੰਪਾਦਨ ਕਰੋ';

  @override
  String get less => 'ਘੱਟ';

  @override
  String get more => 'ਹੋਰ';

  @override
  String get deleteItem => 'ਆਈਟਮ ਮਿਟਾਓ';

  @override
  String get deletePlaylist => 'ਪਲੇਲਿਸਟ ਮਿਟਾਓ';

  @override
  String get deletePlaylistMessage => 'ਕੀ ਸਰਵਰ ਤੋਂ ਇਸ ਪਲੇਲਿਸਟ ਨੂੰ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get deleteItemMessage => 'ਕੀ ਇਸ ਆਈਟਮ ਨੂੰ ਸਰਵਰ ਤੋਂ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get failedToDeletePlaylist => 'ਪਲੇਲਿਸਟ ਨੂੰ ਮਿਟਾਉਣਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get failedToDeleteItem => 'ਆਈਟਮ ਨੂੰ ਮਿਟਾਉਣਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get renamePlaylist => 'ਪਲੇਲਿਸਟ ਦਾ ਨਾਮ ਬਦਲੋ';

  @override
  String get playlistName => 'ਪਲੇਲਿਸਟ ਦਾ ਨਾਮ';

  @override
  String get deleteDownloadedAlbum => 'ਡਾਊਨਲੋਡ ਕੀਤੀ ਐਲਬਮ ਮਿਟਾਓ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'ਡਾਊਨਲੋਡ ਕੀਤੇ ਟਰੈਕ ਮਿਟਾਏ ਗਏ';

  @override
  String get downloadedTracksDeleteFailed =>
      'ਕੁਝ ਡਾਊਨਲੋਡ ਕੀਤੇ ਟਰੈਕਾਂ ਨੂੰ ਮਿਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ';

  @override
  String get noTracksLoaded => 'ਕੋਈ ਟਰੈਕ ਲੋਡ ਨਹੀਂ ਕੀਤੇ ਗਏ';

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
  String get itemDeleted => 'ਆਈਟਮ ਮਿਟਾਈ ਗਈ';

  @override
  String get noPlayableTrailerFound => 'ਕੋਈ ਚਲਾਉਣ ਯੋਗ ਟ੍ਰੇਲਰ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'ਆਡੀਓ ਟਰੈਕ';

  @override
  String get subtitleTrack => 'ਉਪਸਿਰਲੇਖ ਟਰੈਕ';

  @override
  String get none => 'ਕੋਈ ਨਹੀਂ';

  @override
  String get downloadSubtitlesLabel => 'ਉਪਸਿਰਲੇਖ ਡਾਊਨਲੋਡ ਕਰੋ...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles ਪਲੱਗਇਨ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਖੋਜ ਕਰੋ';

  @override
  String get downloadSubtitles => 'ਉਪਸਿਰਲੇਖ ਡਾਊਨਲੋਡ ਕਰੋ';

  @override
  String get selectedSubtitleInvalid => 'ਚੁਣਿਆ ਉਪਸਿਰਲੇਖ ਅਵੈਧ ਹੈ।';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'ਉਪਸਿਰਲੇਖ ਡਾਊਨਲੋਡ ਕੀਤਾ ਗਿਆ। ਜਦੋਂ Jellyfin ਆਈਟਮ ਨੂੰ ਰਿਫ੍ਰੈਸ਼ ਕਰਦਾ ਹੈ ਤਾਂ ਇਸ ਨੂੰ ਦਿਖਾਈ ਦੇਣ ਵਿੱਚ ਕੁਝ ਸਮਾਂ ਲੱਗ ਸਕਦਾ ਹੈ।';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'ਸੰਸਕਰਣ ਚੁਣੋ';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'ਸਭ ਨੂੰ ਡਾਊਨਲੋਡ ਕਰੋ — ਗੁਣਵੱਤਾ';

  @override
  String get downloadQuality => 'ਡਾਊਨਲੋਡ ਗੁਣਵੱਤਾ';

  @override
  String get originalFileNoReencoding => 'ਮੂਲ ਫ਼ਾਈਲ, ਕੋਈ ਰੀ-ਏਨਕੋਡਿੰਗ ਨਹੀਂ';

  @override
  String get originalFilesNoReencoding => 'ਅਸਲ ਫ਼ਾਈਲਾਂ, ਕੋਈ ਰੀ-ਏਨਕੋਡਿੰਗ ਨਹੀਂ';

  @override
  String get noEpisodesLoaded => 'ਕੋਈ ਐਪੀਸੋਡ ਲੋਡ ਨਹੀਂ ਕੀਤੇ ਗਏ';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'ਡਾਊਨਲੋਡ ਕੀਤੀਆਂ ਫ਼ਾਈਲਾਂ ਨੂੰ ਮਿਟਾਓ';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted =>
      'ਡਾਊਨਲੋਡ ਕੀਤੀਆਂ ਫ਼ਾਈਲਾਂ ਮਿਟਾ ਦਿੱਤੀਆਂ ਗਈਆਂ';

  @override
  String get failedToDeleteFiles => 'ਫ਼ਾਈਲਾਂ ਨੂੰ ਮਿਟਾਉਣਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get deleteFiles => 'ਫਾਈਲਾਂ ਮਿਟਾਓ';

  @override
  String get director => 'ਡਾਇਰੈਕਟਰ';

  @override
  String get writers => 'ਲੇਖਕ';

  @override
  String get studio => 'ਸਟੂਡੀਓ';

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
  String get showLess => 'ਘੱਟ ਦਿਖਾਓ';

  @override
  String get readMore => 'ਹੋਰ ਪੜ੍ਹੋ';

  @override
  String get shuffle => 'ਸ਼ਫਲ';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'ਸੰਪੂਰਣ ਮੈਚ';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'ਮੋਨੋ';

  @override
  String get stereo => 'ਸਟੀਰੀਓ';

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
  String get deleteSeasonFiles => 'ਇਸ ਸੀਜ਼ਨ ਵਿੱਚ ਸਾਰੇ ਡਾਊਨਲੋਡ ਕੀਤੇ ਐਪੀਸੋਡ';

  @override
  String get stillWatching => 'ਅਜੇ ਵੀ ਦੇਖ ਰਹੇ ਹੋ?';

  @override
  String get unableToLoadTrailerStream =>
      'ਟ੍ਰੇਲਰ ਸਟ੍ਰੀਮ ਨੂੰ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਮਰੱਥ।';

  @override
  String get trailerTimedOut => 'ਲੋਡ ਕਰਨ ਦੌਰਾਨ ਟ੍ਰੇਲਰ ਦਾ ਸਮਾਂ ਸਮਾਪਤ ਹੋਇਆ।';

  @override
  String get playbackFailedForTrailer => 'ਇਸ ਟ੍ਰੇਲਰ ਲਈ ਪਲੇਬੈਕ ਅਸਫਲ ਰਿਹਾ।';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'ਔਫਲਾਈਨ ਪਲੇਬੈਕ ਦੌਰਾਨ ਕਾਸਟਿੰਗ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

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
  String get deviceVolume => 'ਡਿਵਾਈਸ ਵਾਲੀਅਮ';

  @override
  String get unavailable => 'ਅਣਉਪਲਬਧ';

  @override
  String get pause => 'ਵਿਰਾਮ';

  @override
  String get syncPosition => 'ਸਿੰਕ ਸਥਿਤੀ';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'ਕਤਾਰ ਖਾਲੀ ਹੈ';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'ਰਿਮੋਟ ਪਲੇਬੈਕ';

  @override
  String get castingToGoogleCast => 'Google Cast \'ਤੇ ਕਾਸਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ';

  @override
  String get castingViaAirPlay => 'AirPlay ਦੁਆਰਾ ਕਾਸਟਿੰਗ';

  @override
  String get castingViaDlna => 'DLNA ਰਾਹੀਂ ਕਾਸਟਿੰਗ';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'ਅਨਲੌਕ ਕਰਨ ਲਈ ਦੇਰ ਤੱਕ ਦਬਾਓ';

  @override
  String get off => 'ਬੰਦ';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'ਆਟੋ';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'ਬਿੱਟਰੇਟ ਓਵਰਰਾਈਡ';

  @override
  String get audioDelay => 'ਆਡੀਓ ਦੇਰੀ';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'ਉਪਸਿਰਲੇਖ ਦੇਰੀ';

  @override
  String get reset => 'ਰੀਸੈਟ ਕਰੋ';

  @override
  String get unknown => 'ਅਗਿਆਤ';

  @override
  String get playbackInformation => 'ਪਲੇਬੈਕ ਜਾਣਕਾਰੀ';

  @override
  String get playback => 'ਪਲੇਬੈਕ';

  @override
  String get playMethod => 'ਪਲੇ ਵਿਧੀ';

  @override
  String get directPlay => 'ਡਾਇਰੈਕਟ ਪਲੇ';

  @override
  String get directStream => 'ਸਿੱਧੀ ਸਟ੍ਰੀਮ';

  @override
  String get transcoding => 'ਟ੍ਰਾਂਸਕੋਡਿੰਗ';

  @override
  String get transcodeReasons => 'ਟ੍ਰਾਂਸਕੋਡ ਕਾਰਨ';

  @override
  String get player => 'ਖਿਡਾਰੀ';

  @override
  String get container => 'ਕੰਟੇਨਰ';

  @override
  String get bitrate => 'ਬਿੱਟਰੇਟ';

  @override
  String get video => 'ਵੀਡੀਓ';

  @override
  String get resolution => 'ਮਤਾ';

  @override
  String get hdr => 'ਐਚ.ਡੀ.ਆਰ';

  @override
  String get codec => 'ਕੋਡੇਕ';

  @override
  String get videoBitrate => 'ਵੀਡੀਓ ਬਿੱਟਰੇਟ';

  @override
  String get track => 'ਟਰੈਕ';

  @override
  String get channels => 'ਚੈਨਲ';

  @override
  String get audioBitrate => 'ਆਡੀਓ ਬਿੱਟਰੇਟ';

  @override
  String get sampleRate => 'ਨਮੂਨਾ ਦਰ';

  @override
  String get format => 'ਫਾਰਮੈਟ';

  @override
  String get external => 'ਬਾਹਰੀ';

  @override
  String get embedded => 'ਏਮਬੇਡ ਕੀਤਾ';

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
      'EPUB ਰੈਂਡਰਿੰਗ ਇਨ-ਐਪ ਅਜੇ ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'ਏਮਬੈਡਡ ਦਸਤਾਵੇਜ਼ ਰੈਂਡਰਿੰਗ ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get couldNotOpenExternalViewer => 'ਬਾਹਰੀ ਦਰਸ਼ਕ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ।';

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
      'ਅਜੇ ਤੱਕ ਕੋਈ ਬੁੱਕਮਾਰਕ ਨਹੀਂ ਹਨ।\nਆਪਣੀ ਸਥਿਤੀ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰਨ ਲਈ ਪੜ੍ਹਦੇ ਸਮੇਂ ਬੁੱਕਮਾਰਕ ਆਈਕਨ \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get noTableOfContentsAvailable => 'ਸਮੱਗਰੀ ਦੀ ਕੋਈ ਸਾਰਣੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'ਸਥਿਤੀ';

  @override
  String get bookReader => 'ਬੁੱਕ ਰੀਡਰ';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'ਅੱਪਡੇਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get markUnread => 'ਨਾ-ਪੜ੍ਹੇ ਦੀ ਨਿਸ਼ਾਨਦੇਹੀ ਕਰੋ';

  @override
  String get markAsRead => 'ਪੜ੍ਹੇ ਵਜੋਂ ਚਿੰਨ੍ਹਿਤ ਕਰੋ';

  @override
  String get reloadReader => 'ਰੀਡਰ ਰੀਲੋਡ ਕਰੋ';

  @override
  String get noPagesFound => 'ਕੋਈ ਪੰਨੇ ਨਹੀਂ ਮਿਲੇ।';

  @override
  String get failedToDecodePageImage => 'ਪੰਨਾ ਚਿੱਤਰ ਨੂੰ ਡੀਕੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ।';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'ਸਿੰਗਲ ਪੰਨਾ';

  @override
  String get twoPageSpread => 'ਦੋ-ਪੰਨਿਆਂ ਦਾ ਫੈਲਾਅ';

  @override
  String get addBookmark => 'ਬੁੱਕਮਾਰਕ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get bookmarksEllipsis => 'ਬੁੱਕਮਾਰਕਸ...';

  @override
  String get markedAsRead => 'ਪੜ੍ਹੀ ਗਈ ਵਜੋਂ ਨਿਸ਼ਾਨਦੇਹੀ ਕੀਤੀ ਗਈ';

  @override
  String get markedAsUnread => 'ਨਾ-ਪੜ੍ਹੇ ਵਜੋਂ ਚਿੰਨ੍ਹਿਤ ਕੀਤਾ ਗਿਆ';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'ਥੀਮ: ਸਿਸਟਮ';

  @override
  String get themeLight => 'ਥੀਮ: ਚਾਨਣ';

  @override
  String get themeDark => 'ਥੀਮ: ਹਨੇਰਾ';

  @override
  String get themeSepia => 'ਥੀਮ: ਸੇਪੀਆ';

  @override
  String get invertColorsFixedLayout => 'ਉਲਟਾ ਰੰਗ (ਸਥਿਰ ਖਾਕਾ)';

  @override
  String get invertColorsPdf => 'ਉਲਟਾ ਰੰਗ (PDF)';

  @override
  String get preparingInAppReader => 'ਇਨ-ਐਪ ਰੀਡਰ ਤਿਆਰ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get pdfDataNotAvailable => 'PDF ਡਾਟਾ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get readerFallbackModeActive => 'ਰੀਡਰ ਫਾਲਬੈਕ ਮੋਡ ਕਿਰਿਆਸ਼ੀਲ ਹੈ';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'ਇੱਕ ਸਮਰਥਿਤ ਪਲੇਟਫਾਰਮ ਟਾਰਗਿਟ (Android, iOS, macOS) \'ਤੇ ਸਵਿਚ ਕਰਨ ਤੋਂ ਬਾਅਦ ਰੀਲੋਡ ਰੀਡਰ ਦੀ ਵਰਤੋਂ ਕਰੋ।';

  @override
  String get openExternally => 'ਬਾਹਰੋਂ ਖੋਲ੍ਹੋ';

  @override
  String get noEpubChaptersFound => 'ਕੋਈ EPUB ਚੈਪਟਰ ਨਹੀਂ ਮਿਲੇ।';

  @override
  String get readerNotReady => 'ਪਾਠਕ ਤਿਆਰ ਨਹੀਂ।';

  @override
  String get seriesRecordings => 'ਸੀਰੀਜ਼ ਰਿਕਾਰਡਿੰਗਜ਼';

  @override
  String get now => 'ਹੁਣ';

  @override
  String get sports => 'ਖੇਡਾਂ';

  @override
  String get news => 'ਖ਼ਬਰਾਂ';

  @override
  String get kids => 'ਬੱਚੇ';

  @override
  String get premiere => 'ਪ੍ਰੀਮੀਅਰ';

  @override
  String get guideTimeline => 'ਗਾਈਡ ਟਾਈਮਲਾਈਨ';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'ਕੋਈ ਚੈਨਲ ਨਹੀਂ ਮਿਲੇ';

  @override
  String get liveBadge => 'ਲਾਈਵ';

  @override
  String get movie => 'ਮੂਵੀ';

  @override
  String get removedFromFavoriteChannels => 'ਮਨਪਸੰਦ ਚੈਨਲਾਂ ਤੋਂ ਹਟਾਇਆ ਗਿਆ';

  @override
  String get addedToFavoriteChannels => 'ਮਨਪਸੰਦ ਚੈਨਲਾਂ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ';

  @override
  String get failedToUpdateFavoriteChannel =>
      'ਮਨਪਸੰਦ ਚੈਨਲ ਨੂੰ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get unfavoriteChannel => 'ਮਨਪਸੰਦ ਚੈਨਲ';

  @override
  String get favoriteChannel => 'ਮਨਪਸੰਦ ਚੈਨਲ';

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
  String get watch => 'ਦੇਖੋ';

  @override
  String get close => 'ਬੰਦ ਕਰੋ';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'ਰਿਕਾਰਡਿੰਗ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get scheduledInNext24Hours => 'ਅਗਲੇ 24 ਘੰਟਿਆਂ ਵਿੱਚ ਨਿਯਤ ਕੀਤਾ ਗਿਆ';

  @override
  String get recentRecordings => 'ਹਾਲੀਆ ਰਿਕਾਰਡਿੰਗਾਂ';

  @override
  String get tvSeries => 'ਟੀਵੀ ਲੜੀ';

  @override
  String get failedToLoadSchedule => 'ਸਮਾਂ-ਸਾਰਣੀ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get noScheduledRecordings => 'ਕੋਈ ਅਨੁਸੂਚਿਤ ਰਿਕਾਰਡਿੰਗ ਨਹੀਂ';

  @override
  String get cancelRecording => 'ਕੀ ਰਿਕਾਰਡਿੰਗ ਰੱਦ ਕਰਨੀ ਹੈ?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'ਨੰ';

  @override
  String get yesCancel => 'ਹਾਂ, ਰੱਦ ਕਰੋ';

  @override
  String get failedToCancelRecording => 'ਰਿਕਾਰਡਿੰਗ ਨੂੰ ਰੱਦ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get failedToLoadSeriesRecordings =>
      'ਸੀਰੀਜ਼ ਰਿਕਾਰਡਿੰਗਾਂ ਨੂੰ ਲੋਡ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get noSeriesRecordings => 'ਕੋਈ ਸੀਰੀਜ਼ ਰਿਕਾਰਡਿੰਗ ਨਹੀਂ';

  @override
  String get cancelSeriesRecording => 'ਸੀਰੀਜ਼ ਰਿਕਾਰਡਿੰਗ ਰੱਦ ਕਰੋ';

  @override
  String get cancelSeriesRecordingQuestion =>
      'ਕੀ ਸੀਰੀਜ਼ ਰਿਕਾਰਡਿੰਗ ਨੂੰ ਰੱਦ ਕਰਨਾ ਹੈ?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'ਸੀਰੀਜ਼ ਰਿਕਾਰਡਿੰਗ ਨੂੰ ਰੱਦ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get searchThisLibrary => 'ਇਸ ਲਾਇਬ੍ਰੇਰੀ ਨੂੰ ਖੋਜੋ...';

  @override
  String get searchEllipsis => 'ਖੋਜ...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'ਸੀਰ';

  @override
  String get seerrAccountType => 'Seerr ਖਾਤਾ ਕਿਸਮ';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'ਸਥਾਨਕ';

  @override
  String get savedMedia => 'ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਮੀਡੀਆ';

  @override
  String get tvShows => 'ਟੀਵੀ ਸ਼ੋਅ';

  @override
  String get music => 'ਸੰਗੀਤ';

  @override
  String get musicAlbums => 'ਸੰਗੀਤ ਐਲਬਮਾਂ';

  @override
  String get noMediaInFilter => 'ਇਸ ਫਿਲਟਰ ਵਿੱਚ ਕੋਈ ਮੀਡੀਆ ਨਹੀਂ ਹੈ';

  @override
  String get noDownloadedMediaYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਡਾਊਨਲੋਡ ਕੀਤਾ ਮੀਡੀਆ ਨਹੀਂ ਹੈ';

  @override
  String get browseLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get deleteDownload => 'ਡਾਊਨਲੋਡ ਮਿਟਾਓ';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'ਐਲਬਮ';

  @override
  String get playAlbum => 'ਐਲਬਮ ਚਲਾਓ';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'ਸੀਜ਼ਨ';

  @override
  String get errorLoadingEpisodes => 'ਐਪੀਸੋਡ ਲੋਡ ਕਰਨ ਵਿੱਚ ਤਰੁੱਟੀ';

  @override
  String get noDownloadedEpisodes => 'ਕੋਈ ਡਾਊਨਲੋਡ ਕੀਤੇ ਐਪੀਸੋਡ ਨਹੀਂ ਹਨ';

  @override
  String get deleteEpisode => 'ਐਪੀਸੋਡ ਮਿਟਾਓ';

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
  String get seriesNotFound => 'ਲੜੀ ਨਹੀਂ ਮਿਲੀ';

  @override
  String get errorLoadingSeries => 'ਲੜੀ ਲੋਡ ਕਰਨ ਵਿੱਚ ਤਰੁੱਟੀ';

  @override
  String get downloadedEpisodes => 'ਡਾਊਨਲੋਡ ਕੀਤੇ ਐਪੀਸੋਡ';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'ਵਿਸ਼ੇਸ਼';

  @override
  String get deleteSeason => 'ਸੀਜ਼ਨ ਮਿਟਾਓ';

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
  String get storageManagement => 'ਸਟੋਰੇਜ਼ ਪ੍ਰਬੰਧਨ';

  @override
  String get storageBreakdown => 'ਸਟੋਰੇਜ ਬਰੇਕਡਾਊਨ';

  @override
  String get downloadedItems => 'ਡਾਊਨਲੋਡ ਕੀਤੀਆਂ ਆਈਟਮਾਂ';

  @override
  String get storageLimit => 'ਸਟੋਰੇਜ ਸੀਮਾ';

  @override
  String get noLimit => 'ਕੋਈ ਸੀਮਾ ਨਹੀਂ';

  @override
  String get deleteAllDownloads => 'ਸਾਰੇ ਡਾਊਨਲੋਡ ਮਿਟਾਓ';

  @override
  String get deleteAllDownloadsWarning =>
      'ਇਹ ਸਾਰੀਆਂ ਡਾਊਨਲੋਡ ਕੀਤੀਆਂ ਮੀਡੀਆ ਫ਼ਾਈਲਾਂ ਨੂੰ ਹਟਾ ਦੇਵੇਗਾ ਅਤੇ ਇਸਨੂੰ ਅਣਕੀਤਾ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get deleteAll => 'ਸਭ ਮਿਟਾਓ';

  @override
  String get deleteSelected => 'ਚੁਣਿਆ ਮਿਟਾਓ';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'ਸੰਗੀਤ ਅਤੇ ਆਡੀਓਬੁੱਕਸ';

  @override
  String get images => 'ਚਿੱਤਰ';

  @override
  String get database => 'ਡਾਟਾਬੇਸ';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get authentication => 'ਪ੍ਰਮਾਣਿਕਤਾ';

  @override
  String get autoLoginServerManagement => 'ਆਟੋ ਲੌਗਇਨ, ਸਰਵਰ ਪ੍ਰਬੰਧਨ';

  @override
  String get pinCode => 'ਪਿੰਨ ਕੋਡ';

  @override
  String get setUpPinCodeProtection => 'ਪਿੰਨ ਕੋਡ ਸੁਰੱਖਿਆ ਸੈਟ ਅਪ ਕਰੋ';

  @override
  String get parentalControls => 'ਮਾਪਿਆਂ ਦੇ ਨਿਯੰਤਰਣ';

  @override
  String get contentRatingRestrictions => 'ਸਮੱਗਰੀ ਰੇਟਿੰਗ ਪਾਬੰਦੀਆਂ';

  @override
  String get bitRateResolutionBehavior => 'ਬਿੱਟਰੇਟ, ਰੈਜ਼ੋਲਿਊਸ਼ਨ, ਵਿਹਾਰ';

  @override
  String get languageSizeAppearance => 'ਭਾਸ਼ਾ, ਆਕਾਰ, ਦਿੱਖ';

  @override
  String get qualityStorage => 'ਗੁਣਵੱਤਾ, ਸਟੋਰੇਜ਼';

  @override
  String get serverSyncAndPluginStatus => 'ਸਰਵਰ ਸਿੰਕ ਅਤੇ ਪਲੱਗਇਨ ਸਥਿਤੀ';

  @override
  String get mediaRequestIntegration => 'ਮੀਡੀਆ ਬੇਨਤੀ ਏਕੀਕਰਣ';

  @override
  String get switchServer => 'ਸਰਵਰ ਬਦਲੋ';

  @override
  String get signOut => 'ਸਾਇਨ ਆਉਟ';

  @override
  String get versionLicenses => 'ਸੰਸਕਰਣ, ਲਾਇਸੰਸ';

  @override
  String get account => 'ਖਾਤਾ';

  @override
  String get signInAndSecurity => 'ਸਾਈਨ-ਇਨ ਅਤੇ ਸੁਰੱਖਿਆ';

  @override
  String get administration => 'ਪ੍ਰਸ਼ਾਸਨ';

  @override
  String get serverSettingsUsersLibraries =>
      'ਸਰਵਰ ਸੈਟਿੰਗਾਂ, ਉਪਭੋਗਤਾ, ਲਾਇਬ੍ਰੇਰੀਆਂ';

  @override
  String get customization => 'ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ';

  @override
  String get themeAndLayout => 'ਥੀਮ ਅਤੇ ਖਾਕਾ';

  @override
  String get videoAndSubtitles => 'ਵੀਡੀਓ ਅਤੇ ਉਪਸਿਰਲੇਖ';

  @override
  String get integrations => 'ਏਕੀਕਰਣ';

  @override
  String get pluginAndRequests => 'ਪਲੱਗਇਨ ਅਤੇ ਬੇਨਤੀਆਂ';

  @override
  String get customizeAccountPlaybackInterface =>
      'ਖਾਤਾ, ਪਲੇਬੈਕ, ਅਤੇ ਇੰਟਰਫੇਸ ਵਿਵਹਾਰ ਨੂੰ ਅਨੁਕੂਲਿਤ ਕਰੋ';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'ਥੀਮ ਅਤੇ ਦਿੱਖ';

  @override
  String get focusBorderColor => 'ਫੋਕਸ ਬਾਰਡਰ ਰੰਗ';

  @override
  String get watchedIndicators => 'ਸੂਚਕਾਂ ਨੂੰ ਦੇਖਿਆ';

  @override
  String get always => 'ਹਮੇਸ਼ਾ';

  @override
  String get hideUnwatched => 'ਅਣਦੇਖਿਆ ਲੁਕਾਓ';

  @override
  String get episodesOnly => 'ਸਿਰਫ਼ ਐਪੀਸੋਡ';

  @override
  String get never => 'ਕਦੇ ਨਹੀਂ';

  @override
  String get focusExpansionAnimation => 'ਫੋਕਸ ਐਕਸਪੈਂਸ਼ਨ ਐਨੀਮੇਸ਼ਨ';

  @override
  String get desktopUiScale => 'ਡੈਸਕਟਾਪ UI ਸਕੇਲ';

  @override
  String get scaleFocusedCards => 'ਸਕੇਲ ਫੋਕਸ ਜਾਂ ਹੋਵਰਡ ਕਾਰਡ ਅਤੇ ਟਾਈਲਾਂ';

  @override
  String get backgroundBackdrops => 'ਬੈਕਗ੍ਰਾਊਂਡ ਬੈਕਡ੍ਰੌਪਸ';

  @override
  String get showBackdropImages => 'ਸਮੱਗਰੀ ਦੇ ਪਿੱਛੇ ਬੈਕਡ੍ਰੌਪ ਚਿੱਤਰ ਦਿਖਾਓ';

  @override
  String get seriesThumbnails => 'ਲੜੀ ਥੰਬਨੇਲ';

  @override
  String get seriesThumbnailsDescription =>
      'ਸਿਰਫ਼ ਐਪੀਸੋਡ: ਲੜੀਵਾਰ ਕਲਾਕਾਰੀ ਦੀ ਵਰਤੋਂ ਕਰੋ ਜੋ ਹਰੇਕ ਕਤਾਰ ਚਿੱਤਰ ਦੀ ਕਿਸਮ ਨਾਲ ਮੇਲ ਖਾਂਦੀ ਹੈ';

  @override
  String get homeRowInfoOverlay => 'ਹੋਮ ਰੋਅ ਜਾਣਕਾਰੀ ਓਵਰਲੇ';

  @override
  String get showTitleMetadataOnHomeRows =>
      'ਘਰ ਦੀਆਂ ਕਤਾਰਾਂ ਨੂੰ ਬ੍ਰਾਊਜ਼ ਕਰਨ ਵੇਲੇ ਸਿਰਲੇਖ ਅਤੇ ਮੈਟਾਡੇਟਾ ਦਿਖਾਓ';

  @override
  String get clockDisplay => 'ਘੜੀ ਡਿਸਪਲੇ';

  @override
  String get inMenus => 'ਮੇਨੂ ਵਿੱਚ';

  @override
  String get inVideo => 'ਵੀਡੀਓ ਵਿੱਚ';

  @override
  String get seasonalEffects => 'ਮੌਸਮੀ ਪ੍ਰਭਾਵ';

  @override
  String get seasonalEffectsDescription => 'ਵਿਜ਼ੂਅਲ ਪ੍ਰਭਾਵ ਅਤੇ ਮੌਸਮੀ ਸਜਾਵਟ';

  @override
  String get snow => 'ਬਰਫ਼';

  @override
  String get fireworks => 'ਆਤਿਸ਼ਬਾਜ਼ੀ';

  @override
  String get confetti => 'ਕੰਫੇਟੀ';

  @override
  String get fallingLeaves => 'ਡਿੱਗਦੇ ਪੱਤੇ';

  @override
  String get themeMusic => 'ਥੀਮ ਸੰਗੀਤ';

  @override
  String get playThemeMusicOnDetailPages =>
      'ਵੇਰਵੇ ਵਾਲੇ ਪੰਨਿਆਂ \'ਤੇ ਥੀਮ ਸੰਗੀਤ ਚਲਾਓ';

  @override
  String get themeMusicVolume => 'ਥੀਮ ਸੰਗੀਤ ਵਾਲੀਅਮ';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'ਘਰੇਲੂ ਕਤਾਰਾਂ \'ਤੇ ਥੀਮ ਸੰਗੀਤ';

  @override
  String get playWhenBrowsingHomeScreen => 'ਹੋਮ ਸਕ੍ਰੀਨ ਬ੍ਰਾਊਜ਼ ਕਰਨ ਵੇਲੇ ਚਲਾਓ';

  @override
  String get detailsBackgroundBlur => 'ਵੇਰਵੇ ਬੈਕਗ੍ਰਾਊਂਡ ਬਲਰ';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'ਬ੍ਰਾਊਜ਼ਿੰਗ ਬੈਕਗ੍ਰਾਊਂਡ ਬਲਰ';

  @override
  String get maxStreamingBitrate => 'ਅਧਿਕਤਮ ਸਟ੍ਰੀਮਿੰਗ ਬਿੱਟਰੇਟ';

  @override
  String get maxResolution => 'ਅਧਿਕਤਮ ਰੈਜ਼ੋਲਿਊਸ਼ਨ';

  @override
  String get playerZoomMode => 'ਪਲੇਅਰ ਜ਼ੂਮ ਮੋਡ';

  @override
  String get fit => 'ਫਿੱਟ';

  @override
  String get autoCrop => 'ਆਟੋ ਕ੍ਰੌਪ';

  @override
  String get stretch => 'ਖਿੱਚੋ';

  @override
  String get refreshRateSwitching => 'ਰਿਫ੍ਰੈਸ਼ ਰੇਟ ਸਵਿਚ ਕਰਨਾ';

  @override
  String get disabled => 'ਅਯੋਗ';

  @override
  String get scaleOnTv => 'ਟੀਵੀ \'ਤੇ ਸਕੇਲ';

  @override
  String get scaleOnDevice => 'ਡਿਵਾਈਸ \'ਤੇ ਸਕੇਲ';

  @override
  String get trickPlay => 'ਟ੍ਰਿਕ ਪਲੇ';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'ਮੰਗਣ ਵੇਲੇ ਝਲਕ ਦੇ ਥੰਬਨੇਲ ਦਿਖਾਓ';

  @override
  String get showDescriptionOnPause => 'ਵਿਰਾਮ \'ਤੇ ਵਰਣਨ ਦਿਖਾਓ';

  @override
  String get dimVideoShowOverview =>
      'ਵਿਡਿਓ ਨੂੰ ਮੱਧਮ ਕਰੋ ਅਤੇ ਵਿਰਾਮ ਦੇ ਦੌਰਾਨ ਓਵਰਵਿਊ ਟੈਕਸਟ ਦਿਖਾਓ';

  @override
  String get osdLockButton => 'OSD ਲਾਕ ਬਟਨ';

  @override
  String get osdLockButtonDescription =>
      'ਇੱਕ ਲੌਕ ਬਟਨ ਦਿਖਾਓ ਜੋ ਲੰਬੇ ਸਮੇਂ ਤੱਕ ਦਬਾਏ ਜਾਣ ਤੱਕ ਟੱਚ ਇਨਪੁਟ ਨੂੰ ਰੋਕਦਾ ਹੈ';

  @override
  String get audioBehavior => 'ਆਡੀਓ ਵਿਵਹਾਰ';

  @override
  String get downmixToStereo => 'ਡਾਊਨਮਿਕਸ ਤੋਂ ਸਟੀਰੀਓ';

  @override
  String get defaultAudioLanguage => 'ਡਿਫੌਲਟ ਆਡੀਓ ਭਾਸ਼ਾ';

  @override
  String get autoServerDefault => 'ਆਟੋ (ਸਰਵਰ ਡਿਫੌਲਟ)';

  @override
  String get english => 'ਅੰਗਰੇਜ਼ੀ';

  @override
  String get spanish => 'ਸਪੇਨੀ';

  @override
  String get french => 'ਫ੍ਰੈਂਚ';

  @override
  String get german => 'ਜਰਮਨ';

  @override
  String get italian => 'ਇਤਾਲਵੀ';

  @override
  String get portuguese => 'ਪੁਰਤਗਾਲੀ';

  @override
  String get japanese => 'ਜਾਪਾਨੀ';

  @override
  String get korean => 'ਕੋਰੀਅਨ';

  @override
  String get chinese => 'ਚੀਨੀ';

  @override
  String get russian => 'ਰੂਸੀ';

  @override
  String get arabic => 'ਅਰਬੀ';

  @override
  String get hindi => 'ਹਿੰਦੀ';

  @override
  String get dutch => 'ਡੱਚ';

  @override
  String get swedish => 'ਸਵੀਡਿਸ਼';

  @override
  String get norwegian => 'ਨਾਰਵੇਜਿਅਨ';

  @override
  String get danish => 'ਡੈਨਿਸ਼';

  @override
  String get finnish => 'ਫਿਨਿਸ਼';

  @override
  String get polish => 'ਪੋਲਿਸ਼';

  @override
  String get ac3Passthrough => 'AC3 ਪਾਸਥਰੂ';

  @override
  String get dtsPassthrough => 'DTS ਪਾਸਥਰੂ';

  @override
  String get trueHdSupport => 'TrueHD ਸਪੋਰਟ';

  @override
  String get enableDtsPassthrough =>
      'ਬਿੱਟਸਟ੍ਰੀਮ ਡੀਟੀਐਸ ਆਡੀਓ ਸਿਰਫ AVR ਲਈ; ਪ੍ਰਾਪਤਕਰਤਾ ਸਮਰਥਨ ਅਤੇ DTS ਸਰੋਤ ਟਰੈਕ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ਆਡੀਓ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ (ਸ਼ਾਇਦ ਸਾਰੇ ਪਲੇਟਫਾਰਮਾਂ \'ਤੇ ਕੰਮ ਨਾ ਕਰੇ)';

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
  String get nightMode => 'ਨਾਈਟ ਮੋਡ';

  @override
  String get compressDynamicRange => 'ਗਤੀਸ਼ੀਲ ਰੇਂਜ ਨੂੰ ਸੰਕੁਚਿਤ ਕਰੋ';

  @override
  String get advancedMpv => 'ਉੱਨਤ mpv';

  @override
  String get enableCustomMpvConf => 'ਕਸਟਮ mpv.conf ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get applyMpvConfBeforePlayback =>
      'ਪਲੇਬੈਕ ਸ਼ੁਰੂ ਹੋਣ ਤੋਂ ਪਹਿਲਾਂ ਉਪਭੋਗਤਾ ਦੁਆਰਾ ਨਿਰਧਾਰਤ mpv.conf ਲਾਗੂ ਕਰੋ';

  @override
  String get unsafeAdvancedMpvOptions => 'ਅਸੁਰੱਖਿਅਤ ਉੱਨਤ mpv ਵਿਕਲਪ';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv ਵਿਕਲਪਾਂ ਦੇ ਇੱਕ ਵਿਸ਼ਾਲ ਸਮੂਹ ਦੀ ਆਗਿਆ ਦਿਓ। ਪਲੇਬੈਕ ਵਿਵਹਾਰ ਨੂੰ ਤੋੜ ਸਕਦਾ ਹੈ।';

  @override
  String get hardwareDecoding => 'ਹਾਰਡਵੇਅਰ ਡੀਕੋਡਿੰਗ';

  @override
  String get hardwareDecodingSubtitle =>
      'ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਬਿਹਤਰ ਬਣਾ ਸਕਦਾ ਹੈ ਪਰ ਕੁਝ ਡਿਵਾਈਸਾਂ \'ਤੇ ਪਲੇਬੈਕ ਸਮੱਸਿਆਵਾਂ ਪੈਦਾ ਕਰ ਸਕਦਾ ਹੈ।';

  @override
  String get nextUpAndQueuing => 'ਅੱਗੇ ਅਤੇ ਕਤਾਰਬੱਧ';

  @override
  String get nextUpDisplay => 'ਅਗਲਾ ਉੱਪਰ ਡਿਸਪਲੇ';

  @override
  String get extended => 'ਵਿਸਤ੍ਰਿਤ';

  @override
  String get minimal => 'ਨਿਊਨਤਮ';

  @override
  String get nextUpTimeout => 'ਅੱਗੇ ਦਾ ਸਮਾਂ ਸਮਾਪਤ';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'ਮੀਡੀਆ ਕਤਾਰਬੰਦੀ';

  @override
  String get autoQueueNextEpisodes => 'ਅਗਲੇ ਐਪੀਸੋਡਾਂ ਨੂੰ ਆਟੋ-ਕਤਾਰ ਕਰੋ';

  @override
  String get stillWatchingPrompt => 'ਅਜੇ ਵੀ ਪ੍ਰੋਂਪਟ ਦੇਖ ਰਿਹਾ ਹੈ';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਛੱਡੋ';

  @override
  String get resumeRewind => 'ਰੀਵਾਈਂਡ ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get unpauseRewind => 'ਰੀਵਾਈਂਡ ਨੂੰ ਰੋਕੋ';

  @override
  String get fiveSeconds => '5 ਸਕਿੰਟ';

  @override
  String get tenSeconds => '10 ਸਕਿੰਟ';

  @override
  String get fifteenSeconds => '15 ਸਕਿੰਟ';

  @override
  String get thirtySeconds => '30 ਸਕਿੰਟ';

  @override
  String get skipBackLength => 'ਪਿੱਛੇ ਦੀ ਲੰਬਾਈ ਛੱਡੋ';

  @override
  String get skipForwardLength => 'ਅੱਗੇ ਦੀ ਲੰਬਾਈ ਛੱਡੋ';

  @override
  String get customMpvConfPath => 'ਕਸਟਮ mpv.conf ਮਾਰਗ';

  @override
  String get notSetMpvConf =>
      'ਸੈੱਟ ਨਹੀਂ ਹੈ। Moonfin ਐਪ/ਡਾਟਾ ਫੋਲਡਰਾਂ ਵਿੱਚ ਇੱਕ ਡਿਫੌਲਟ mpv.conf ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੇਗਾ।';

  @override
  String get selectMpvConf => 'mpv.conf ਚੁਣੋ';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'ਸ਼ੈਲੀ ਸੈਟਿੰਗਾਂ (ਆਕਾਰ, ਰੰਗ, ਆਫਸੈੱਟ) ਟੈਕਸਟ-ਅਧਾਰਿਤ ਉਪਸਿਰਲੇਖਾਂ (SRT, VTT, TTML) \'ਤੇ ਲਾਗੂ ਹੁੰਦੀਆਂ ਹਨ। ASS/SSA ਉਪਸਿਰਲੇਖ ਆਪਣੀ ਖੁਦ ਦੀ ਏਮਬੈਡਡ ਸਟਾਈਲ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਨ ਜਦੋਂ ਤੱਕ \"ASS/SSA ਡਾਇਰੈਕਟ ਪਲੇ\" ਨੂੰ ਬੰਦ ਨਹੀਂ ਕੀਤਾ ਜਾਂਦਾ ਹੈ। ਬਿਟਮੈਪ ਉਪਸਿਰਲੇਖਾਂ (PGS, DVB, VobSub) ਨੂੰ ਰੀਸਟਾਇਲ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।';

  @override
  String get defaultSubtitleLanguage => 'ਪੂਰਵ-ਨਿਰਧਾਰਤ ਉਪਸਿਰਲੇਖ ਭਾਸ਼ਾ';

  @override
  String get defaultToNoSubtitles => 'ਪੂਰਵ-ਨਿਰਧਾਰਤ ਕੋਈ ਉਪਸਿਰਲੇਖ ਨਹੀਂ';

  @override
  String get turnOffSubtitlesByDefault => 'ਮੂਲ ਰੂਪ ਵਿੱਚ ਉਪਸਿਰਲੇਖਾਂ ਨੂੰ ਬੰਦ ਕਰੋ';

  @override
  String get subtitleSize => 'ਉਪਸਿਰਲੇਖ ਦਾ ਆਕਾਰ';

  @override
  String get textFillColor => 'ਟੈਕਸਟ ਫਿਲ ਰੰਗ';

  @override
  String get backgroundColor => 'ਬੈਕਗ੍ਰਾਊਂਡ ਦਾ ਰੰਗ';

  @override
  String get textStrokeColor => 'ਟੈਕਸਟ ਸਟ੍ਰੋਕ ਰੰਗ';

  @override
  String get subtitleCustomization => 'ਉਪਸਿਰਲੇਖ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ';

  @override
  String get subtitleCustomizationDescription =>
      'ਉਪਸਿਰਲੇਖ ਦਿੱਖ ਨੂੰ ਅਨੁਕੂਲਿਤ ਕਰੋ';

  @override
  String get subtitlePreviewText =>
      'ਤੇਜ਼ ਭੂਰੀ ਲੂੰਬੜੀ ਆਲਸੀ ਕੁੱਤੇ ਦੇ ਉੱਪਰ ਛਾਲ ਮਾਰਦੀ ਹੈ';

  @override
  String get verticalOffset => 'ਵਰਟੀਕਲ ਆਫਸੈੱਟ';

  @override
  String get pgsDirectPlay => 'PGS ਡਾਇਰੈਕਟ ਪਲੇ';

  @override
  String get directPlayPgsSubtitles => 'ਡਾਇਰੈਕਟ ਪਲੇ PGS ਉਪਸਿਰਲੇਖ';

  @override
  String get assSsaDirectPlay => 'ASS/SSA ਡਾਇਰੈਕਟ ਪਲੇ';

  @override
  String get directPlayAssSsaSubtitles => 'ਡਾਇਰੈਕਟ ਪਲੇ ASS/SSA ਉਪਸਿਰਲੇਖ';

  @override
  String get white => 'ਚਿੱਟਾ';

  @override
  String get black => 'ਕਾਲਾ';

  @override
  String get yellow => 'ਪੀਲਾ';

  @override
  String get green => 'ਹਰਾ';

  @override
  String get cyan => 'ਸਿਆਨ';

  @override
  String get red => 'ਲਾਲ';

  @override
  String get transparent => 'ਪਾਰਦਰਸ਼ੀ';

  @override
  String get semiTransparentBlack => 'ਅਰਧ-ਪਾਰਦਰਸ਼ੀ ਕਾਲਾ';

  @override
  String get global => 'ਗਲੋਬਲ';

  @override
  String get desktop => 'ਡੈਸਕਟਾਪ';

  @override
  String get mobile => 'ਮੋਬਾਈਲ';

  @override
  String get tv => 'ਟੀ.ਵੀ';

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
  String get customizationProfile => 'ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get customizationProfileDescription =>
      'ਲੋਡ ਕਰਨ, ਸੰਪਾਦਿਤ ਕਰਨ ਅਤੇ ਸਿੰਕ ਕਰਨ ਲਈ ਪ੍ਰੋਫਾਈਲ ਚੁਣੋ। ਗਲੋਬਲ ਹਰ ਜਗ੍ਹਾ ਲਾਗੂ ਹੁੰਦਾ ਹੈ ਜਦੋਂ ਤੱਕ ਕੋਈ ਡਿਵਾਈਸ ਪ੍ਰੋਫਾਈਲ ਇਸ ਨੂੰ ਓਵਰਰਾਈਡ ਨਹੀਂ ਕਰਦੀ। ਹਰਾ ਬਿੰਦੂ ਤੁਹਾਡੇ ਮੌਜੂਦਾ ਡਿਵਾਈਸ ਪ੍ਰੋਫਾਈਲ ਨੂੰ ਚਿੰਨ੍ਹਿਤ ਕਰਦਾ ਹੈ।';

  @override
  String get loadProfile => 'ਪ੍ਰੋਫਾਈਲ ਲੋਡ ਕਰੋ';

  @override
  String get syncing => 'ਸਿੰਕ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get syncToProfile => 'ਪ੍ਰੋਫਾਈਲ ਨਾਲ ਸਿੰਕ ਕਰੋ';

  @override
  String get profileSyncHidden => 'ਪ੍ਰੋਫਾਈਲ ਸਿੰਕ ਲੁਕਿਆ ਹੋਇਆ ਹੈ';

  @override
  String get enablePluginSyncDescription =>
      'ਇੱਥੇ ਪ੍ਰੋਫਾਈਲ ਨਿਯੰਤਰਣ ਦਿਖਾਉਣ ਲਈ ਪਲੱਗਇਨ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਸਰਵਰ ਪਲੱਗਇਨ ਸਿੰਕ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ।';

  @override
  String get quality => 'ਗੁਣਵੱਤਾ';

  @override
  String get defaultDownloadQuality => 'ਪੂਰਵ-ਨਿਰਧਾਰਤ ਡਾਊਨਲੋਡ ਗੁਣਵੱਤਾ';

  @override
  String get network => 'ਨੈੱਟਵਰਕ';

  @override
  String get wifiOnlyDownloads => 'WiFi-ਸਿਰਫ਼ ਡਾਊਨਲੋਡਸ';

  @override
  String get onlyDownloadOnWifi => 'WiFi ਨਾਲ ਕਨੈਕਟ ਹੋਣ \'ਤੇ ਹੀ ਡਾਊਨਲੋਡ ਕਰੋ';

  @override
  String get storage => 'ਸਟੋਰੇਜ';

  @override
  String get storageUsed => 'ਸਟੋਰੇਜ ਵਰਤੀ ਗਈ';

  @override
  String get manage => 'ਪ੍ਰਬੰਧਿਤ ਕਰੋ';

  @override
  String get calculating => 'ਗਣਨਾ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get downloadLocation => 'ਟਿਕਾਣਾ ਡਾਊਨਲੋਡ ਕਰੋ';

  @override
  String get defaultLabel => 'ਡਿਫਾਲਟ';

  @override
  String get saveToDownloadsFolder => 'ਡਾਊਨਲੋਡ ਫੋਲਡਰ ਵਿੱਚ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get downloadsVisibleToOtherApps =>
      'ਡਾਉਨਲੋਡਸ/Moonfin — ਹੋਰ ਐਪਾਂ ਨੂੰ ਦਿਖਣਯੋਗ';

  @override
  String get dangerZone => 'ਖ਼ਤਰਾ ਜ਼ੋਨ';

  @override
  String get clearAllDownloads => 'ਸਾਰੇ ਡਾਊਨਲੋਡ ਕਲੀਅਰ ਕਰੋ';

  @override
  String get original => 'ਮੂਲ';

  @override
  String get changeDownloadLocation => 'ਡਾਊਨਲੋਡ ਟਿਕਾਣਾ ਬਦਲੋ';

  @override
  String get changeDownloadLocationDescription =>
      'ਨਵੇਂ ਡਾਊਨਲੋਡ ਚੁਣੇ ਹੋਏ ਫੋਲਡਰ ਵਿੱਚ ਸੁਰੱਖਿਅਤ ਕੀਤੇ ਜਾਣਗੇ। ਮੌਜੂਦਾ ਡਾਊਨਲੋਡ ਉਹਨਾਂ ਦੇ ਮੌਜੂਦਾ ਟਿਕਾਣੇ ਵਿੱਚ ਰਹਿਣਗੇ ਅਤੇ ਸਟੋਰੇਜ ਸੈਟਿੰਗਾਂ ਤੋਂ ਪ੍ਰਬੰਧਿਤ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ।';

  @override
  String get confirm => 'ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get cannotWriteToFolder =>
      'ਚੁਣੇ ਫੋਲਡਰ ਵਿੱਚ ਨਹੀਂ ਲਿਖਿਆ ਜਾ ਸਕਦਾ। ਕਿਰਪਾ ਕਰਕੇ ਕੋਈ ਵੱਖਰਾ ਟਿਕਾਣਾ ਚੁਣੋ ਜਾਂ ਸਟੋਰੇਜ ਅਨੁਮਤੀਆਂ ਦਿਓ।';

  @override
  String get saveToDownloadsFolderQuestion =>
      'ਕੀ ਡਾਊਨਲੋਡ ਫੋਲਡਰ ਵਿੱਚ ਸੁਰੱਖਿਅਤ ਕਰਨਾ ਹੈ?';

  @override
  String get saveToDownloadsFolderDescription =>
      'ਡਾਊਨਲੋਡ ਕੀਤਾ ਮੀਡੀਆ ਤੁਹਾਡੀ ਡਿਵਾਈਸ \'ਤੇ ਡਾਊਨਲੋਡ/Moonfin ਵਿੱਚ ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਜਾਵੇਗਾ। ਇਹ ਫ਼ਾਈਲਾਂ ਤੁਹਾਡੀ ਗੈਲਰੀ ਜਾਂ ਸੰਗੀਤ ਪਲੇਅਰ ਵਰਗੀਆਂ ਹੋਰ ਐਪਾਂ ਲਈ ਦਿਖਾਈ ਦੇਣਗੀਆਂ।\n\nਮੌਜੂਦਾ ਡਾਊਨਲੋਡ ਆਪਣੇ ਮੌਜੂਦਾ ਟਿਕਾਣੇ \'ਤੇ ਹੀ ਰਹਿਣਗੇ।';

  @override
  String get enable => 'ਯੋਗ ਕਰੋ';

  @override
  String get clearAllDownloadsWarning =>
      'ਇਹ ਸਾਰੇ ਡਾਊਨਲੋਡ ਕੀਤੇ ਮੀਡੀਆ ਨੂੰ ਮਿਟਾ ਦੇਵੇਗਾ ਅਤੇ ਇਸਨੂੰ ਅਣਕੀਤਾ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get clearAll => 'ਸਭ ਸਾਫ਼ ਕਰੋ';

  @override
  String get navigationStyle => 'ਨੈਵੀਗੇਸ਼ਨ ਸ਼ੈਲੀ';

  @override
  String get topBar => 'ਸਿਖਰ ਪੱਟੀ';

  @override
  String get leftSidebar => 'ਖੱਬਾ ਸਾਈਡਬਾਰ';

  @override
  String get showShuffleButton => 'ਸ਼ਫਲ ਬਟਨ ਦਿਖਾਓ';

  @override
  String get showGenresButton => 'ਸ਼ੈਲੀਆਂ ਬਟਨ ਦਿਖਾਓ';

  @override
  String get showFavoritesButton => 'ਮਨਪਸੰਦ ਬਟਨ ਦਿਖਾਓ';

  @override
  String get showLibrariesInToolbar => 'ਟੂਲਬਾਰ ਵਿੱਚ ਲਾਇਬ੍ਰੇਰੀਆਂ ਦਿਖਾਓ';

  @override
  String get navbarOpacity => 'ਨਵਬਾਰ ਧੁੰਦਲਾਪਨ';

  @override
  String get navbarColor => 'ਨਵਬਾਰ ਰੰਗ';

  @override
  String get gray => 'ਸਲੇਟੀ';

  @override
  String get darkBlue => 'ਗੂੜ੍ਹਾ ਨੀਲਾ';

  @override
  String get purple => 'ਜਾਮਨੀ';

  @override
  String get teal => 'ਟੀਲ';

  @override
  String get navy => 'ਨੇਵੀ';

  @override
  String get charcoal => 'ਚਾਰਕੋਲ';

  @override
  String get brown => 'ਭੂਰਾ';

  @override
  String get darkRed => 'ਗੂੜ੍ਹਾ ਲਾਲ';

  @override
  String get darkGreen => 'ਗੂੜ੍ਹਾ ਹਰਾ';

  @override
  String get slate => 'ਸਲੇਟ';

  @override
  String get indigo => 'ਇੰਡੀਗੋ';

  @override
  String get libraryDisplay => 'ਲਾਇਬ੍ਰੇਰੀ ਡਿਸਪਲੇ';

  @override
  String get posterLabel => 'ਪੋਸਟਰ';

  @override
  String get thumbnailLabel => 'ਥੰਬਨੇਲ';

  @override
  String get bannerLabel => 'ਬੈਨਰ';

  @override
  String get overridePerLibrarySettings =>
      'ਪ੍ਰਤੀ-ਲਾਇਬ੍ਰੇਰੀ ਸੈਟਿੰਗਾਂ ਨੂੰ ਓਵਰਰਾਈਡ ਕਰੋ';

  @override
  String get applyImageTypeToAllLibraries =>
      'ਸਾਰੀਆਂ ਲਾਇਬ੍ਰੇਰੀਆਂ \'ਤੇ ਚਿੱਤਰ ਦੀ ਕਿਸਮ ਲਾਗੂ ਕਰੋ';

  @override
  String get multiServerLibraries => 'ਮਲਟੀ-ਸਰਵਰ ਲਾਇਬ੍ਰੇਰੀਆਂ';

  @override
  String get showLibrariesFromAllServers =>
      'ਸਾਰੇ ਕਨੈਕਟ ਕੀਤੇ ਸਰਵਰਾਂ ਤੋਂ ਲਾਇਬ੍ਰੇਰੀਆਂ ਦਿਖਾਓ';

  @override
  String get enableFolderView => 'ਫੋਲਡਰ ਦ੍ਰਿਸ਼ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get showFolderBrowsingOption => 'ਫੋਲਡਰ ਬ੍ਰਾਊਜ਼ਿੰਗ ਵਿਕਲਪ ਦਿਖਾਓ';

  @override
  String get libraryVisibility => 'ਲਾਇਬ੍ਰੇਰੀ ਦਰਿਸ਼ਗੋਚਰਤਾ';

  @override
  String get libraryVisibilityDescription =>
      'ਪ੍ਰਤੀ ਲਾਇਬ੍ਰੇਰੀ ਹੋਮ ਪੇਜ ਦੀ ਦਿੱਖ ਨੂੰ ਟੌਗਲ ਕਰੋ। ਤਬਦੀਲੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰਨ ਲਈ Moonfin ਨੂੰ ਮੁੜ ਚਾਲੂ ਕਰੋ।';

  @override
  String get showInNavigation => 'ਨੈਵੀਗੇਸ਼ਨ ਵਿੱਚ ਦਿਖਾਓ';

  @override
  String get showInLatestMedia => 'ਨਵੀਨਤਮ ਮੀਡੀਆ ਵਿੱਚ ਦਿਖਾਓ';

  @override
  String get sourceLibraries => 'ਸਰੋਤ ਲਾਇਬ੍ਰੇਰੀਆਂ';

  @override
  String get sourceCollections => 'ਸਰੋਤ ਸੰਗ੍ਰਹਿ';

  @override
  String get excludedGenres => 'ਵੱਖ ਕੀਤੀਆਂ ਸ਼ੈਲੀਆਂ';

  @override
  String get selectAll => 'ਸਭ ਚੁਣੋ';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'ਮੀਡੀਆ ਬਾਰ';

  @override
  String get mediaSources => 'ਮੀਡੀਆ ਸਰੋਤ';

  @override
  String get behavior => 'ਵਿਵਹਾਰ';

  @override
  String get seconds => 'ਸਕਿੰਟ';

  @override
  String get localPreviews => 'ਸਥਾਨਕ ਝਲਕ';

  @override
  String get localPreviewsDescription =>
      'ਟ੍ਰੇਲਰ, ਮੀਡੀਆ ਅਤੇ ਆਡੀਓ ਪੂਰਵਦਰਸ਼ਨਾਂ ਨੂੰ ਕੌਂਫਿਗਰ ਕਰੋ।';

  @override
  String get mediaBarMode => 'ਮੀਡੀਆ ਬਾਰ ਸਟਾਈਲ';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD ਵਿੱਚੋਂ ਚੁਣੋ, ਜਾਂ ਮੀਡੀਆ ਬਾਰ ਨੂੰ ਬੰਦ ਕਰੋ';

  @override
  String get mediaBarModeMoonfin => 'ਮੂਨਫਿਨ';

  @override
  String get mediaBarModeMakd => 'ਮਾਕਡੀ';

  @override
  String get mediaBarModeOff => 'ਬੰਦ';

  @override
  String get enableMediaBar => 'ਮੀਡੀਆ ਬਾਰ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get showFeaturedContentSlideshow =>
      'ਘਰ \'ਤੇ ਵਿਸ਼ੇਸ਼ ਸਮੱਗਰੀ ਸਲਾਈਡਸ਼ੋ ਦਿਖਾਓ';

  @override
  String get contentType => 'ਸਮੱਗਰੀ ਦੀ ਕਿਸਮ';

  @override
  String get moviesAndTvShows => 'ਫਿਲਮਾਂ ਅਤੇ ਟੀਵੀ ਸ਼ੋਅ';

  @override
  String get moviesOnly => 'ਸਿਰਫ਼ ਫ਼ਿਲਮਾਂ';

  @override
  String get tvShowsOnly => 'ਸਿਰਫ਼ ਟੀਵੀ ਸ਼ੋਅ';

  @override
  String get itemCount => 'ਆਈਟਮ ਦੀ ਗਿਣਤੀ';

  @override
  String get noneSelected => 'ਕੋਈ ਵੀ ਨਹੀਂ ਚੁਣਿਆ ਗਿਆ';

  @override
  String get noneExcluded => 'ਕੋਈ ਵੀ ਬਾਹਰ ਨਹੀਂ ਕੀਤਾ ਗਿਆ';

  @override
  String get autoAdvance => 'ਆਟੋ ਐਡਵਾਂਸ';

  @override
  String get autoAdvanceSlides => 'ਅਗਲੀ ਸਲਾਈਡ \'ਤੇ ਆਟੋਮੈਟਿਕਲੀ ਅੱਗੇ ਵਧੋ';

  @override
  String get autoAdvanceInterval => 'ਆਟੋ ਐਡਵਾਂਸ ਅੰਤਰਾਲ';

  @override
  String get trailerPreview => 'ਟ੍ਰੇਲਰ ਦੀ ਝਲਕ';

  @override
  String get autoPlayTrailers => '3 ਸਕਿੰਟਾਂ ਬਾਅਦ ਮੀਡੀਆ ਬਾਰ ਵਿੱਚ ਆਟੋ-ਪਲੇ ਟ੍ਰੇਲਰ';

  @override
  String get episodePreview => 'ਐਪੀਸੋਡ ਪੂਰਵ-ਝਲਕ';

  @override
  String get mediaPreview => 'ਮੀਡੀਆ ਪ੍ਰੀਵਿਊ';

  @override
  String get episodePreviewDescription =>
      'ਫੋਕਸਡ, ਹੋਵਰਡ, ਜਾਂ ਲੰਬੇ-ਦਬਾਏ ਕਾਰਡਾਂ \'ਤੇ 30-ਸਕਿੰਟ ਦੀ ਇਨਲਾਈਨ ਪੂਰਵਦਰਸ਼ਨ ਚਲਾਓ';

  @override
  String get mediaPreviewDescription =>
      'ਫੋਕਸਡ, ਹੋਵਰਡ, ਜਾਂ ਲੰਬੇ-ਦਬਾਏ ਕਾਰਡਾਂ \'ਤੇ 30-ਸਕਿੰਟ ਦੀ ਇਨਲਾਈਨ ਪੂਰਵਦਰਸ਼ਨ ਚਲਾਓ';

  @override
  String get previewAudio => 'ਪੂਰਵਦਰਸ਼ਨ ਆਡੀਓ';

  @override
  String get enablePreviewAudio =>
      'ਟ੍ਰੇਲਰ ਅਤੇ ਐਪੀਸੋਡ ਪੂਰਵ-ਝਲਕ ਲਈ ਆਡੀਓ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get latestMedia => 'ਨਵੀਨਤਮ ਮੀਡੀਆ';

  @override
  String get recentlyReleased => 'ਹਾਲ ਹੀ ਵਿੱਚ ਰਿਲੀਜ਼ ਹੋਈ';

  @override
  String get myMedia => 'ਮੇਰਾ ਮੀਡੀਆ';

  @override
  String get myMediaSmall => 'ਮੇਰਾ ਮੀਡੀਆ (ਛੋਟਾ)';

  @override
  String get continueWatching => 'ਦੇਖਣਾ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get resumeAudio => 'ਆਡੀਓ ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get resumeBooks => 'ਕਿਤਾਬਾਂ ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get activeRecordings => 'ਕਿਰਿਆਸ਼ੀਲ ਰਿਕਾਰਡਿੰਗਾਂ';

  @override
  String get playlists => 'ਪਲੇਲਿਸਟਸ';

  @override
  String get liveTV => 'ਲਾਈਵ ਟੀ.ਵੀ';

  @override
  String get homeSections => 'ਹੋਮ ਸੈਕਸ਼ਨ';

  @override
  String get resetToDefaults => 'ਪੂਰਵ-ਨਿਰਧਾਰਤ \'ਤੇ ਰੀਸੈਟ ਕਰੋ';

  @override
  String get homeRowPosterSize => 'ਹੋਮ ਰੋਅ ਪੋਸਟਰ ਦਾ ਆਕਾਰ';

  @override
  String get perRowImageTypeSelection => 'ਪ੍ਰਤੀ ਕਤਾਰ ਚਿੱਤਰ ਕਿਸਮ ਦੀ ਚੋਣ';

  @override
  String get configureImageTypeForEachRow =>
      'ਹਰੇਕ ਸਮਰਥਿਤ ਹੋਮ ਕਤਾਰ ਲਈ ਚਿੱਤਰ ਕਿਸਮ ਨੂੰ ਕੌਂਫਿਗਰ ਕਰੋ';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'ਦੇਖਣਾ ਜਾਰੀ ਰੱਖੋ ਅਤੇ ਅੱਗੇ ਨੂੰ ਮਿਲਾਓ';

  @override
  String get combineBothRows =>
      'ਦੋਵਾਂ ਕਤਾਰਾਂ ਨੂੰ ਇੱਕ ਸਿੰਗਲ ਹੋਮ ਸੈਕਸ਼ਨ ਵਿੱਚ ਜੋੜੋ';

  @override
  String get perRowImageType => 'ਪ੍ਰਤੀ ਕਤਾਰ ਚਿੱਤਰ ਦੀ ਕਿਸਮ';

  @override
  String get perRowSettings => 'ਪ੍ਰਤੀ-ਕਤਾਰ ਸੈਟਿੰਗਾਂ';

  @override
  String get autoLogin => 'ਆਟੋ ਲੌਗਇਨ';

  @override
  String get lastUser => 'ਆਖਰੀ ਉਪਭੋਗਤਾ';

  @override
  String get specificUser => 'ਖਾਸ ਉਪਭੋਗਤਾ';

  @override
  String get alwaysAuthenticate => 'ਹਮੇਸ਼ਾ ਪ੍ਰਮਾਣਿਤ ਕਰੋ';

  @override
  String get requirePasswordWithToken =>
      'ਸਟੋਰ ਕੀਤੇ ਟੋਕਨ ਦੇ ਨਾਲ ਵੀ ਪਾਸਵਰਡ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get confirmExit => 'ਬਾਹਰ ਨਿਕਲਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get showConfirmationBeforeExiting =>
      'ਬਾਹਰ ਜਾਣ ਤੋਂ ਪਹਿਲਾਂ ਪੁਸ਼ਟੀ ਦਿਖਾਓ';

  @override
  String get blockContentWithRatings =>
      'ਹੇਠ ਲਿਖੀਆਂ ਰੇਟਿੰਗਾਂ ਵਾਲੀ ਸਮੱਗਰੀ ਨੂੰ ਬਲੌਕ ਕਰੋ:';

  @override
  String get noContentRatingsFound =>
      'ਇਸ ਸਰਵਰ \'ਤੇ ਅਜੇ ਤੱਕ ਕੋਈ ਸਮੱਗਰੀ ਰੇਟਿੰਗ ਨਹੀਂ ਮਿਲੀ।';

  @override
  String get couldNotLoadServerRatings =>
      'ਸਰਵਰ ਰੇਟਿੰਗਾਂ ਨੂੰ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ। ਸਿਰਫ਼ ਰੱਖਿਅਤ ਰੇਟਿੰਗ ਦਿਖਾ ਰਿਹਾ ਹੈ।';

  @override
  String get couldNotRefreshRatings =>
      'ਸਰਵਰ ਤੋਂ ਰੇਟਿੰਗਾਂ ਨੂੰ ਤਾਜ਼ਾ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ। ਰੱਖਿਅਤ ਰੇਟਿੰਗ ਦਿਖਾ ਰਿਹਾ ਹੈ।';

  @override
  String get enablePinCode => 'ਪਿੰਨ ਕੋਡ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get requirePinToAccess =>
      'ਤੁਹਾਡੇ ਖਾਤੇ ਤੱਕ ਪਹੁੰਚ ਕਰਨ ਲਈ ਇੱਕ ਪਿੰਨ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get changePin => 'ਪਿੰਨ ਬਦਲੋ';

  @override
  String get setNewPinCode => 'ਇੱਕ ਨਵਾਂ ਪਿੰਨ ਕੋਡ ਸੈੱਟ ਕਰੋ';

  @override
  String get removePin => 'ਪਿੰਨ ਹਟਾਓ';

  @override
  String get removePinProtection => 'ਪਿੰਨ ਕੋਡ ਸੁਰੱਖਿਆ ਹਟਾਓ';

  @override
  String get screensaver => 'ਸਕਰੀਨ ਸੇਵਰ';

  @override
  String get inAppScreensaver => 'ਇਨ-ਐਪ ਸਕ੍ਰੀਨਸੇਵਰ';

  @override
  String get enableBuiltInScreensaver => 'ਬਿਲਟ-ਇਨ ਸਕ੍ਰੀਨਸੇਵਰ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get mode => 'ਮੋਡ';

  @override
  String get libraryArt => 'ਲਾਇਬ੍ਰੇਰੀ ਕਲਾ';

  @override
  String get logo => 'ਲੋਗੋ';

  @override
  String get clock => 'ਘੜੀ';

  @override
  String get timeout => 'ਸਮਾਂ ਖ਼ਤਮ';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'ਮੱਧਮ ਪੱਧਰ';

  @override
  String get maxAgeRating => 'ਅਧਿਕਤਮ ਉਮਰ ਰੇਟਿੰਗ';

  @override
  String get any => 'ਕੋਈ ਵੀ';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'ਉਮਰ ਰੇਟਿੰਗ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get onlyShowRatedContent => 'ਸਿਰਫ਼ ਰੇਟ ਕੀਤੀ ਸਮੱਗਰੀ ਦਿਖਾਓ';

  @override
  String get showClock => 'ਘੜੀ ਦਿਖਾਓ';

  @override
  String get displayClockDuringScreensaver => 'ਸਕ੍ਰੀਨਸੇਵਰ ਦੌਰਾਨ ਘੜੀ ਡਿਸਪਲੇ ਕਰੋ';

  @override
  String get rottenTomatoesCritics => 'ਸੜੇ ਹੋਏ ਟਮਾਟਰ (ਆਲੋਚਕ)';

  @override
  String get rottenTomatoesAudience => 'ਸੜੇ ਹੋਏ ਟਮਾਟਰ (ਦਰਸ਼ਕ)';

  @override
  String get imdb => 'ਆਈ.ਐਮ.ਡੀ.ਬੀ';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'ਮੈਟਾਕ੍ਰਿਟਿਕ';

  @override
  String get metacriticUser => 'ਮੈਟਾਕ੍ਰਿਟਿਕ (ਉਪਭੋਗਤਾ)';

  @override
  String get trakt => 'ਟ੍ਰੈਕਟ';

  @override
  String get letterboxd => 'ਲੈਟਰਬਾਕਸਡੀ';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'ਐਨੀਲਿਸਟ';

  @override
  String get communityRating => 'ਕਮਿਊਨਿਟੀ ਰੇਟਿੰਗ';

  @override
  String get ratings => 'ਰੇਟਿੰਗ';

  @override
  String get additionalRatings => 'ਵਧੀਕ ਰੇਟਿੰਗਾਂ';

  @override
  String get showMdbListAndTmdbRatings => 'MDBList ਅਤੇ TMDB ਰੇਟਿੰਗ ਦਿਖਾਓ';

  @override
  String get ratingLabels => 'ਰੇਟਿੰਗ ਲੇਬਲ';

  @override
  String get showLabelsNextToIcons => 'ਰੇਟਿੰਗ ਆਈਕਨਾਂ ਦੇ ਅੱਗੇ ਲੇਬਲ ਦਿਖਾਓ';

  @override
  String get ratingBadges => 'ਰੇਟਿੰਗ ਬੈਜ';

  @override
  String get showDecorativeBadges => 'ਰੇਟਿੰਗਾਂ ਦੇ ਪਿੱਛੇ ਸਜਾਵਟੀ ਬੈਜ ਦਿਖਾਓ';

  @override
  String get episodeRatings => 'ਐਪੀਸੋਡ ਰੇਟਿੰਗ';

  @override
  String get showRatingsOnEpisodes => 'ਵਿਅਕਤੀਗਤ ਐਪੀਸੋਡਾਂ \'ਤੇ ਰੇਟਿੰਗ ਦਿਖਾਓ';

  @override
  String get ratingSources => 'ਰੇਟਿੰਗ ਸਰੋਤ';

  @override
  String get ratingSourcesDescription =>
      'ਪੂਰੇ ਐਪ ਵਿੱਚ ਦਰਸਾਏ ਗਏ ਰੇਟਿੰਗ ਸਰੋਤਾਂ ਨੂੰ ਸਮਰੱਥ ਅਤੇ ਮੁੜ ਕ੍ਰਮਬੱਧ ਕਰੋ';

  @override
  String get pluginLabel => 'ਪਲੱਗਇਨ';

  @override
  String get pluginDetected => 'ਪਲੱਗਇਨ ਖੋਜਿਆ ਗਿਆ';

  @override
  String get pluginNotDetected => 'ਪਲੱਗਇਨ ਖੋਜਿਆ ਨਹੀਂ ਗਿਆ';

  @override
  String get pluginDetectedDescription =>
      'ਸਰਵਰ ਪਲੱਗਇਨ ਖੋਜਿਆ ਗਿਆ। ਪਹਿਲੀ ਵਾਰ ਪਲੱਗਇਨ ਲੱਭੇ ਜਾਣ \'ਤੇ ਸਿੰਕ ਆਪਣੇ ਆਪ ਹੀ ਸਮਰੱਥ ਹੋ ਜਾਂਦਾ ਹੈ।';

  @override
  String get pluginNotDetectedDescription =>
      'ਸਰਵਰ ਪਲੱਗਇਨ ਇਸ ਵੇਲੇ ਖੋਜਿਆ ਨਹੀਂ ਗਿਆ ਹੈ। ਸਥਾਨਕ ਸੈਟਿੰਗਾਂ ਅਜੇ ਵੀ ਉਹਨਾਂ ਦੇ ਸੁਰੱਖਿਅਤ ਕੀਤੇ ਮੁੱਲ ਜਾਂ ਬਿਲਟ-ਇਨ ਡਿਫੌਲਟ ਵਰਤਦੀਆਂ ਹਨ।';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'ਉਪਲਬਧ ਸੇਵਾਵਾਂ';

  @override
  String get serverPluginSync => 'ਸਰਵਰ ਪਲੱਗਇਨ ਸਿੰਕ';

  @override
  String get syncSettingsWithPlugin => 'ਸਰਵਰ ਪਲੱਗਇਨ ਨਾਲ ਸੈਟਿੰਗਾਂ ਸਿੰਕ ਕਰੋ';

  @override
  String get whatSyncControls => 'ਕੀ ਸਿੰਕ ਕੰਟਰੋਲ ਕਰਦਾ ਹੈ';

  @override
  String get syncControlsDescription =>
      'ਸਿੰਕ ਸਿਰਫ਼ ਇਹ ਨਿਯੰਤਰਿਤ ਕਰਦਾ ਹੈ ਕਿ ਕੀ ਪਲੱਗਇਨ-ਬੈਕਡ ਸੈਟਿੰਗਾਂ ਨੂੰ ਸਰਵਰ \'ਤੇ ਧੱਕਿਆ ਜਾਂ ਖਿੱਚਿਆ ਗਿਆ ਹੈ ਜਾਂ ਨਹੀਂ। ਪ੍ਰੋਫਾਈਲ ਚੋਣ ਅਤੇ ਪ੍ਰੋਫਾਈਲ ਸਮਕਾਲੀਕਰਨ ਕਿਰਿਆਵਾਂ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਹੁੰਦੀਆਂ ਹਨ ਜਦੋਂ ਪਲੱਗਇਨ ਸਮਕਾਲੀਕਰਨ ਯੋਗ ਹੁੰਦਾ ਹੈ।';

  @override
  String get recentRequests => 'ਹਾਲੀਆ ਬੇਨਤੀਆਂ';

  @override
  String get recentlyAdded => 'ਹਾਲ ਹੀ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ';

  @override
  String get trending => 'ਪ੍ਰਚਲਿਤ';

  @override
  String get popularMovies => 'ਪ੍ਰਸਿੱਧ ਫ਼ਿਲਮਾਂ';

  @override
  String get movieGenres => 'ਮੂਵੀ ਸ਼ੈਲੀਆਂ';

  @override
  String get upcomingMovies => 'ਆਗਾਮੀ ਫਿਲਮਾਂ';

  @override
  String get studios => 'ਸਟੂਡੀਓਜ਼';

  @override
  String get popularSeries => 'ਪ੍ਰਸਿੱਧ ਲੜੀ';

  @override
  String get seriesGenres => 'ਲੜੀ ਦੀਆਂ ਸ਼ੈਲੀਆਂ';

  @override
  String get upcomingSeries => 'ਆਗਾਮੀ ਸੀਰੀਜ਼';

  @override
  String get networks => 'ਨੈੱਟਵਰਕ';

  @override
  String get resetRowsToDefaults => 'ਕਤਾਰਾਂ ਨੂੰ ਪੂਰਵ-ਨਿਰਧਾਰਤ \'ਤੇ ਰੀਸੈਟ ਕਰੋ';

  @override
  String get enableSeerr => 'Seerr ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get showSeerrInNavigation =>
      'ਨੇਵੀਗੇਸ਼ਨ ਵਿੱਚ Seerr ਦਿਖਾਓ (ਸਰਵਰ ਪਲੱਗਇਨ ਦੀ ਲੋੜ ਹੈ)';

  @override
  String get seerrUnavailable =>
      'ਅਣਉਪਲਬਧ ਕਿਉਂਕਿ ਸਰਵਰ ਪਲੱਗਇਨ Seerr ਸਮਰਥਨ ਅਯੋਗ ਹੈ।';

  @override
  String get nsfwFilter => 'NSFW ਫਿਲਟਰ';

  @override
  String get hideAdultContent => 'ਨਤੀਜਿਆਂ ਵਿੱਚ ਬਾਲਗ ਸਮੱਗਰੀ ਨੂੰ ਲੁਕਾਓ';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'ਕਤਾਰਾਂ ਦੀ ਖੋਜ ਕਰੋ';

  @override
  String get discoverRowsDescriptionPlugin =>
      'ਮੁੜ ਕ੍ਰਮਬੱਧ ਕਰਨ ਲਈ ਘਸੀਟੋ। ਕਤਾਰਾਂ ਨੂੰ ਸਮਰੱਥ ਜਾਂ ਅਯੋਗ ਕਰੋ। ਸਮਰੱਥ ਕਤਾਰ ਆਰਡਰ Moonfin ਪਲੱਗਇਨ ਨਾਲ ਸਿੰਕ ਕਰਦਾ ਹੈ।';

  @override
  String get discoverRowsDescription =>
      'ਮੁੜ ਕ੍ਰਮਬੱਧ ਕਰਨ ਲਈ ਘਸੀਟੋ। ਕਤਾਰਾਂ ਨੂੰ ਸਮਰੱਥ ਜਾਂ ਅਯੋਗ ਕਰੋ।';

  @override
  String get enabled => 'ਸਮਰਥਿਤ';

  @override
  String get hidden => 'ਲੁਕਿਆ ਹੋਇਆ';

  @override
  String get aboutTitle => 'ਬਾਰੇ';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'ਓਪਨ ਸੋਰਸ ਲਾਇਸੰਸ';

  @override
  String get sourceCode => 'ਸਰੋਤ ਕੋਡ';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'ਹੁਣੇ ਅੱਪਡੇਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ';

  @override
  String get checksLatestDesktopRelease =>
      'ਇਸ ਪਲੇਟਫਾਰਮ ਲਈ ਨਵੀਨਤਮ ਡੈਸਕਟਾਪ ਰੀਲੀਜ਼ ਦੀ ਜਾਂਚ ਕਰਦਾ ਹੈ';

  @override
  String get youAreUpToDate => 'ਤੁਸੀਂ ਅੱਪ ਟੂ ਡੇਟ ਹੋ।';

  @override
  String get couldNotCheckForUpdates =>
      'ਇਸ ਵੇਲੇ ਅੱਪਡੇਟਾਂ ਦੀ ਜਾਂਚ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ।';

  @override
  String get noCompatibleUpdate =>
      'ਇਸ ਪਲੇਟਫਾਰਮ ਲਈ ਕੋਈ ਅਨੁਕੂਲ ਅੱਪਡੇਟ ਪੈਕੇਜ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String get updateChecksNotSupported =>
      'ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ ਅੱਪਡੇਟ ਜਾਂਚਾਂ ਸਮਰਥਿਤ ਨਹੀਂ ਹਨ।';

  @override
  String get updateNotificationsDisabled => 'ਅੱਪਡੇਟ ਸੂਚਨਾਵਾਂ ਅਯੋਗ ਹਨ।';

  @override
  String get pleaseWaitBeforeChecking =>
      'ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਜਾਂਚ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਉਡੀਕ ਕਰੋ।';

  @override
  String get latestUpdateAlreadyShown =>
      'ਨਵੀਨਤਮ ਅਪਡੇਟ ਪਹਿਲਾਂ ਹੀ ਦਿਖਾਇਆ ਗਿਆ ਸੀ।';

  @override
  String get updateAvailable => 'ਅੱਪਡੇਟ ਉਪਲਬਧ ਹੈ।';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'ਸੂਚਨਾਵਾਂ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get showWhenUpdatesAvailable => 'ਅੱਪਡੇਟ ਉਪਲਬਧ ਹੋਣ \'ਤੇ ਦਿਖਾਓ';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'ਰੀਲੀਜ਼ ਨੋਟਸ ਪੜ੍ਹੋ';

  @override
  String get downloadingUpdate => 'ਅੱਪਡੇਟ ਡਾਊਨਲੋਡ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get updateDownloadFailed =>
      'ਅੱਪਡੇਟ ਡਾਊਨਲੋਡ ਅਸਫਲ ਰਿਹਾ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get openReleasesPage => 'ਰੀਲੀਜ਼ ਪੰਨਾ ਖੋਲ੍ਹੋ';

  @override
  String get navigation => 'ਨੈਵੀਗੇਸ਼ਨ';

  @override
  String get watchedIndicatorsBackdrops => 'ਦੇਖੇ ਗਏ ਸੂਚਕਾਂ, ਬੈਕਡ੍ਰੌਪ';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'ਫੋਕਸ ਰੰਗ, ਦੇਖੇ ਗਏ ਸੂਚਕਾਂ, ਬੈਕਡ੍ਰੌਪਸ';

  @override
  String get navbarStyleToolbarAppearance => 'ਨਵਬਾਰ ਸ਼ੈਲੀ, ਟੂਲਬਾਰ ਬਟਨ, ਦਿੱਖ';

  @override
  String get reorderToggleHomeRows =>
      'ਘਰ ਦੀਆਂ ਕਤਾਰਾਂ ਨੂੰ ਮੁੜ ਕ੍ਰਮਬੱਧ ਅਤੇ ਟੌਗਲ ਕਰੋ';

  @override
  String get featuredContentAppearance => 'ਵਿਸ਼ੇਸ਼ ਸਮੱਗਰੀ, ਦਿੱਖ';

  @override
  String get posterSizeImageTypeFolderView =>
      'ਪੋਸਟਰ ਦਾ ਆਕਾਰ, ਚਿੱਤਰ ਦੀ ਕਿਸਮ, ਫੋਲਡਰ ਦ੍ਰਿਸ਼';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB, ਅਤੇ ਰੇਟਿੰਗ ਸਰੋਤ';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'ਸਾਫ਼';

  @override
  String get browse => 'ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get noResults => 'ਕੋਈ ਨਤੀਜਾ ਨਹੀਂ';

  @override
  String get seerrAvailableStatus => 'ਉਪਲਬਧ ਹੈ';

  @override
  String get seerrRequestedStatus => 'ਬੇਨਤੀ ਕੀਤੀ';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'ਸੀਰਰ ਸੈਟਿੰਗਾਂ';

  @override
  String get requestMore => 'ਹੋਰ ਬੇਨਤੀ ਕਰੋ';

  @override
  String get request => 'ਬੇਨਤੀ';

  @override
  String get cancelRequest => 'ਬੇਨਤੀ ਰੱਦ ਕਰੋ';

  @override
  String get playInMoonfin => 'Moonfin ਵਿੱਚ ਚਲਾਓ';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'ਮਨਜ਼ੂਰ ਕਰੋ';

  @override
  String get declineAction => 'ਅਸਵੀਕਾਰ ਕਰੋ';

  @override
  String get similar => 'ਸਮਾਨ';

  @override
  String get recommendations => 'ਸਿਫ਼ਾਰਿਸ਼ਾਂ';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'ਰੱਖੋ';

  @override
  String get itemNotFoundInLibrary =>
      'ਤੁਹਾਡੀ Moonfin ਲਾਇਬ੍ਰੇਰੀ ਵਿੱਚ ਆਈਟਮ ਨਹੀਂ ਮਿਲੀ';

  @override
  String get errorSearchingLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਖੋਜਣ ਵਿੱਚ ਤਰੁੱਟੀ';

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
  String get submitRequest => 'ਬੇਨਤੀ ਦਰਜ ਕਰੋ';

  @override
  String get allSeasons => 'ਸਾਰੇ ਸੀਜ਼ਨ';

  @override
  String get advancedOptions => 'ਉੱਨਤ ਵਿਕਲਪ';

  @override
  String get noServiceServersConfigured =>
      'ਕੋਈ ਸੇਵਾ ਸਰਵਰ ਕੌਂਫਿਗਰ ਨਹੀਂ ਕੀਤਾ ਗਿਆ';

  @override
  String get server => 'ਸਰਵਰ';

  @override
  String get qualityProfile => 'ਗੁਣਵੱਤਾ ਪ੍ਰੋਫ਼ਾਈਲ';

  @override
  String get rootFolder => 'ਰੂਟ ਫੋਲਡਰ';

  @override
  String get showMore => 'ਹੋਰ ਦਿਖਾਓ';

  @override
  String get appearances => 'ਦਿੱਖ';

  @override
  String get crewSection => 'ਚਾਲਕ ਦਲ';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'ਕੋਈ ਬੇਨਤੀ ਨਹੀਂ';

  @override
  String get pendingStatus => 'ਬਕਾਇਆ';

  @override
  String get declinedStatus => 'ਅਸਵੀਕਾਰ ਕੀਤਾ';

  @override
  String get partiallyAvailable => 'ਅੰਸ਼ਕ ਤੌਰ \'ਤੇ ਉਪਲਬਧ';

  @override
  String get downloadingStatus => 'ਡਾਊਨਲੋਡ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ';

  @override
  String get approvedStatus => 'ਨੂੰ ਮਨਜ਼ੂਰੀ ਦਿੱਤੀ';

  @override
  String get notRequestedStatus => 'ਬੇਨਤੀ ਨਹੀਂ ਕੀਤੀ ਗਈ';

  @override
  String get blocklistedStatus => 'ਬਲਾਕ ਸੂਚੀਬੱਧ';

  @override
  String get deletedStatus => 'ਮਿਟਾਇਆ ਗਿਆ';

  @override
  String get tmdbScore => 'TMDB ਸਕੋਰ';

  @override
  String get releaseDateLabel => 'ਰਿਹਾਈ ਤਾਰੀਖ';

  @override
  String get firstAirDateLabel => 'ਪਹਿਲੀ ਏਅਰ ਡੇਟ';

  @override
  String get revenueLabel => 'ਮਾਲੀਆ';

  @override
  String get runtimeLabel => 'ਰਨਟਾਈਮ';

  @override
  String get budgetLabel => 'ਬਜਟ';

  @override
  String get originalLanguageLabel => 'ਮੂਲ ਭਾਸ਼ਾ';

  @override
  String get seasonsLabel => 'ਰੁੱਤਾਂ';

  @override
  String get episodesLabel => 'ਐਪੀਸੋਡ';

  @override
  String get access => 'ਪਹੁੰਚ';

  @override
  String get add => 'ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get address => 'ਪਤਾ';

  @override
  String get analytics => 'ਵਿਸ਼ਲੇਸ਼ਣ';

  @override
  String get catalog => 'ਕੈਟਾਲਾਗ';

  @override
  String get content => 'ਸਮੱਗਰੀ';

  @override
  String get copy => 'ਕਾਪੀ ਕਰੋ';

  @override
  String get create => 'ਬਣਾਓ';

  @override
  String get disable => 'ਅਸਮਰੱਥ';

  @override
  String get done => 'ਹੋ ਗਿਆ';

  @override
  String get edit => 'ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get encoding => 'ਏਨਕੋਡਿੰਗ';

  @override
  String get error => 'ਗਲਤੀ';

  @override
  String get forward => 'ਅੱਗੇ';

  @override
  String get general => 'ਜਨਰਲ';

  @override
  String get go => 'ਜਾਓ';

  @override
  String get install => 'ਇੰਸਟਾਲ ਕਰੋ';

  @override
  String get installed => 'ਸਥਾਪਿਤ ਕੀਤਾ';

  @override
  String get interval => 'ਅੰਤਰਾਲ';

  @override
  String get name => 'ਨਾਮ';

  @override
  String get networking => 'ਨੈੱਟਵਰਕਿੰਗ';

  @override
  String get next => 'ਅਗਲਾ';

  @override
  String get path => 'ਮਾਰਗ';

  @override
  String get paused => 'ਰੋਕਿਆ ਗਿਆ';

  @override
  String get permissions => 'ਇਜਾਜ਼ਤਾਂ';

  @override
  String get processing => 'ਪ੍ਰੋਸੈਸਿੰਗ';

  @override
  String get profile => 'ਪ੍ਰੋਫਾਈਲ';

  @override
  String get provider => 'ਪ੍ਰਦਾਤਾ';

  @override
  String get refresh => 'ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get remote => 'ਰਿਮੋਟ';

  @override
  String get rename => 'ਨਾਮ ਬਦਲੋ';

  @override
  String get revoke => 'ਰੱਦ ਕਰੋ';

  @override
  String get role => 'ਭੂਮਿਕਾ';

  @override
  String get root => 'ਰੂਟ';

  @override
  String get run => 'ਚਲਾਓ';

  @override
  String get search => 'ਖੋਜ';

  @override
  String get select => 'ਚੁਣੋ';

  @override
  String get send => 'ਭੇਜੋ';

  @override
  String get sessions => 'ਸੈਸ਼ਨ';

  @override
  String get set => 'ਸੈੱਟ ਕਰੋ';

  @override
  String get status => 'ਸਥਿਤੀ';

  @override
  String get stop => 'ਰੂਕੋ';

  @override
  String get streaming => 'ਸਟ੍ਰੀਮਿੰਗ';

  @override
  String get time => 'ਸਮਾਂ';

  @override
  String get trickplay => 'ਟ੍ਰਿਕਪਲੇ';

  @override
  String get uninstall => 'ਅਣਇੰਸਟੌਲ ਕਰੋ';

  @override
  String get up => 'ਉੱਪਰ';

  @override
  String get update => 'ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get upload => 'ਅੱਪਲੋਡ ਕਰੋ';

  @override
  String get unmute => 'ਅਣਮਿਊਟ ਕਰੋ';

  @override
  String get mute => 'ਚੁੱਪ';

  @override
  String get branding => 'ਬ੍ਰਾਂਡਿੰਗ';

  @override
  String get adminDrawerDashboard => 'ਡੈਸ਼ਬੋਰਡ';

  @override
  String get adminDrawerAnalytics => 'ਵਿਸ਼ਲੇਸ਼ਣ';

  @override
  String get adminDrawerSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get adminDrawerBranding => 'ਬ੍ਰਾਂਡਿੰਗ';

  @override
  String get adminDrawerUsers => 'ਉਪਭੋਗਤਾ';

  @override
  String get adminDrawerLibraries => 'ਲਾਇਬ੍ਰੇਰੀਆਂ';

  @override
  String get adminDrawerTranscoding => 'ਟ੍ਰਾਂਸਕੋਡਿੰਗ';

  @override
  String get adminDrawerResume => 'ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get adminDrawerStreaming => 'ਸਟ੍ਰੀਮਿੰਗ';

  @override
  String get adminDrawerTrickplay => 'ਟ੍ਰਿਕਪਲੇ';

  @override
  String get adminDrawerDevices => 'ਡਿਵਾਈਸਾਂ';

  @override
  String get adminDrawerActivity => 'ਗਤੀਵਿਧੀ';

  @override
  String get adminDrawerNetworking => 'ਨੈੱਟਵਰਕਿੰਗ';

  @override
  String get adminDrawerApiKeys => 'API ਕੁੰਜੀਆਂ';

  @override
  String get adminDrawerBackups => 'ਬੈਕਅੱਪ';

  @override
  String get adminDrawerLogs => 'ਲਾਗ';

  @override
  String get adminDrawerScheduledTasks => 'ਤਹਿ ਕੀਤੇ ਕਾਰਜ';

  @override
  String get adminDrawerPlugins => 'ਪਲੱਗਇਨ';

  @override
  String get adminDrawerRepositories => 'ਰਿਪੋਜ਼ਟਰੀਆਂ';

  @override
  String get adminDrawerLiveTv => 'ਲਾਈਵ ਟੀ.ਵੀ';

  @override
  String get adminExitTooltip => 'ਐਡਮਿਨ ਤੋਂ ਬਾਹਰ ਜਾਓ';

  @override
  String get adminDashboardLoadFailed => 'ਡੈਸ਼ਬੋਰਡ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminMediaOverview => 'ਮੀਡੀਆ ਸੰਖੇਪ ਜਾਣਕਾਰੀ';

  @override
  String get adminMediaTotalsError => 'ਸਰਵਰ ਮੀਡੀਆ ਕੁੱਲ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ।';

  @override
  String get adminMediaOverviewSubtitle =>
      'ਇਸ ਸਰਵਰ \'ਤੇ ਕਿੰਨੀ ਸਮੱਗਰੀ ਹੈ ਇਸ ਬਾਰੇ ਤੁਰੰਤ ਪੜ੍ਹੋ।';

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
  String get analyticsMediaDistribution => 'ਮੀਡੀਆ ਵੰਡ';

  @override
  String get analyticsVideoCodecs => 'ਵੀਡੀਓ ਕੋਡੈਕਸ';

  @override
  String get analyticsAudioCodecs => 'ਆਡੀਓ ਕੋਡੈਕਸ';

  @override
  String get analyticsContainers => 'ਕੰਟੇਨਰ';

  @override
  String get analyticsTopGenres => 'ਪ੍ਰਮੁੱਖ ਸ਼ੈਲੀਆਂ';

  @override
  String get analyticsReleaseYears => 'ਰੀਲੀਜ਼ ਦੇ ਸਾਲ';

  @override
  String get analyticsContentRatings => 'ਸਮੱਗਰੀ ਰੇਟਿੰਗ';

  @override
  String get analyticsRuntimeBuckets => 'ਰਨਟਾਈਮ ਬਾਲਟੀਆਂ';

  @override
  String get analyticsFileFormats => 'ਫਾਈਲ ਫਾਰਮੈਟ';

  @override
  String get analyticsNoData => 'ਕੋਈ ਡਾਟਾ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get adminServerInfo => 'ਸਰਵਰ ਜਾਣਕਾਰੀ';

  @override
  String get adminRestartPending => 'ਬਕਾਇਆ ਮੁੜ-ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get adminServerPaths => 'ਸਰਵਰ ਮਾਰਗ';

  @override
  String get adminServerActions => 'ਸਰਵਰ ਕਾਰਵਾਈਆਂ';

  @override
  String get adminRestartServer => 'ਸਰਵਰ ਰੀਸਟਾਰਟ ਕਰੋ';

  @override
  String get adminShutdownServer => 'ਬੰਦ ਸਰਵਰ';

  @override
  String get adminScanLibraries => 'ਸਕੈਨ ਲਾਇਬ੍ਰੇਰੀਆਂ';

  @override
  String get adminLibraryScanStarted => 'ਲਾਇਬ੍ਰੇਰੀ ਸਕੈਨ ਸ਼ੁਰੂ ਹੋਇਆ';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'ਸਰਵਰ ਰੀਬੂਟ ਪ੍ਰਗਤੀ ਵਿੱਚ ਹੈ';

  @override
  String get adminServerRebootMessage =>
      'ਸਰਵਰ ਰੀਬੂਟ ਪ੍ਰਗਤੀ ਵਿੱਚ ਹੈ, ਕਿਰਪਾ ਕਰਕੇ ਮੁੜ ਚਾਲੂ ਕਰੋ Moonfin';

  @override
  String get adminActiveSessions => 'ਕਿਰਿਆਸ਼ੀਲ ਸੈਸ਼ਨ';

  @override
  String get adminSessionsLoadFailed => 'ਸੈਸ਼ਨਾਂ ਨੂੰ ਲੋਡ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get adminNoActiveSessions => 'ਕੋਈ ਕਿਰਿਆਸ਼ੀਲ ਸੈਸ਼ਨ ਨਹੀਂ';

  @override
  String get adminRecentActivity => 'ਹਾਲੀਆ ਗਤੀਵਿਧੀ';

  @override
  String get adminNoRecentActivity => 'ਕੋਈ ਹਾਲੀਆ ਸਰਗਰਮੀ ਨਹੀਂ';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'ਸੁਨੇਹਾ ਭੇਜੋ';

  @override
  String get adminMessageTextHint => 'ਸੁਨੇਹਾ ਟੈਕਸਟ';

  @override
  String get adminSetVolume => 'ਵਾਲੀਅਮ ਸੈੱਟ ਕਰੋ';

  @override
  String get sessionPrev => 'ਪਿਛਲਾ';

  @override
  String get sessionRewind => 'ਰੀਵਾਈਂਡ';

  @override
  String get sessionForward => 'ਅੱਗੇ';

  @override
  String get sessionNext => 'ਅਗਲਾ';

  @override
  String get sessionVolumeDown => 'ਵੋਲ -';

  @override
  String get sessionVolumeUp => 'ਵੋਲ +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'ਹੁਣ ਚੱਲ ਰਿਹਾ ਹੈ';

  @override
  String get volume => 'ਵਾਲੀਅਮ';

  @override
  String get actions => 'ਕਾਰਵਾਈਆਂ';

  @override
  String get videoCodec => 'ਵੀਡੀਓ ਕੋਡੇਕ';

  @override
  String get audioCodec => 'ਆਡੀਓ ਕੋਡੇਕ';

  @override
  String get hwAccel => 'HW ਐਕਸਲ';

  @override
  String get completion => 'ਸੰਪੂਰਨਤਾ';

  @override
  String get direct => 'ਸਿੱਧਾ';

  @override
  String get adminDisconnect => 'ਡਿਸਕਨੈਕਟ ਕਰੋ';

  @override
  String get adminClearDates => 'ਤਾਰੀਖਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'ਕੋਈ ਗਤੀਵਿਧੀ ਇੰਦਰਾਜ਼ ਨਹੀਂ';

  @override
  String get adminEditDeviceName => 'ਡਿਵਾਈਸ ਦਾ ਨਾਮ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get adminCustomName => 'ਕਸਟਮ ਨਾਮ';

  @override
  String get adminDeviceNameUpdated => 'ਡੀਵਾਈਸ ਦਾ ਨਾਮ ਅੱਪਡੇਟ ਕੀਤਾ ਗਿਆ';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'ਡਿਵਾਈਸ ਮਿਟਾਓ';

  @override
  String get adminDeviceDeleted => 'ਡੀਵਾਈਸ ਮਿਟਾਇਆ ਗਿਆ';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'ਡਿਵਾਈਸਾਂ ਨੂੰ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminSearchDevices => 'ਡਿਵਾਈਸਾਂ ਦੀ ਖੋਜ ਕਰੋ';

  @override
  String get adminThisDevice => 'ਇਹ ਡਿਵਾਈਸ';

  @override
  String get adminEditName => 'ਨਾਮ ਦਾ ਸੰਪਾਦਨ ਕਰੋ';

  @override
  String get adminLibrariesLoadFailed => 'ਲਾਇਬ੍ਰੇਰੀਆਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminNoLibraries => 'ਕੋਈ ਲਾਇਬ੍ਰੇਰੀਆਂ ਕੌਂਫਿਗਰ ਨਹੀਂ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminScanAllLibraries => 'ਸਾਰੀਆਂ ਲਾਇਬ੍ਰੇਰੀਆਂ ਨੂੰ ਸਕੈਨ ਕਰੋ';

  @override
  String get adminAddLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਦਾ ਨਾਮ ਬਦਲੋ';

  @override
  String get adminNewName => 'ਨਵਾਂ ਨਾਮ';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਮਿਟਾਓ';

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
  String get adminRemovePath => 'ਮਾਰਗ ਹਟਾਓ';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'ਲਾਇਬ੍ਰੇਰੀ ਵਿਕਲਪ ਸੁਰੱਖਿਅਤ ਕੀਤੇ ਗਏ';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'ਲਾਇਬ੍ਰੇਰੀ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminNoMediaPaths => 'ਕੋਈ ਮੀਡੀਆ ਮਾਰਗ ਕੌਂਫਿਗਰ ਨਹੀਂ ਕੀਤਾ ਗਿਆ';

  @override
  String get adminAddPath => 'ਮਾਰਗ ਜੋੜੋ';

  @override
  String get adminBrowseFilesystem => 'ਸਰਵਰ ਫਾਈਲ ਸਿਸਟਮ ਬ੍ਰਾਊਜ਼ ਕਰੋ:';

  @override
  String get adminSaveOptions => 'ਵਿਕਲਪ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get adminPreferredMetadataLanguage => 'ਤਰਜੀਹੀ ਮੈਟਾਡੇਟਾ ਭਾਸ਼ਾ';

  @override
  String get adminMetadataLanguageHint => 'ਜਿਵੇਂ ਕਿ en, de, fr';

  @override
  String get adminMetadataCountryCode => 'ਮੈਟਾਡਾਟਾ ਦੇਸ਼ ਕੋਡ';

  @override
  String get adminMetadataCountryHint => 'ਜਿਵੇਂ ਕਿ US, DE, FR';

  @override
  String get adminLibraryNameRequired => 'ਲਾਇਬ੍ਰੇਰੀ ਦਾ ਨਾਮ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'ਲਾਇਬ੍ਰੇਰੀ ਦਾ ਨਾਮ';

  @override
  String get adminSelectedPaths => 'ਚੁਣੇ ਗਏ ਮਾਰਗ:';

  @override
  String get adminNoPathsAdded =>
      'ਕੋਈ ਮਾਰਗ ਨਹੀਂ ਜੋੜਿਆ ਗਿਆ (ਬਾਅਦ ਵਿੱਚ ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ)';

  @override
  String get adminCreateLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਬਣਾਓ';

  @override
  String get paths => 'ਮਾਰਗ:';

  @override
  String get adminDisableUser => 'ਉਪਭੋਗਤਾ ਨੂੰ ਅਯੋਗ ਕਰੋ';

  @override
  String get adminEnableUser => 'ਉਪਭੋਗਤਾ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

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
  String get adminUsersLoadFailed => 'ਉਪਭੋਗਤਾਵਾਂ ਨੂੰ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminSearchUsers => 'ਉਪਭੋਗਤਾਵਾਂ ਦੀ ਖੋਜ ਕਰੋ';

  @override
  String get adminEditUser => 'ਉਪਭੋਗਤਾ ਦਾ ਸੰਪਾਦਨ ਕਰੋ';

  @override
  String get adminAddUser => 'ਉਪਭੋਗਤਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'ਯੂਜ਼ਰ ਬਣਾਓ';

  @override
  String get adminPasswordOptional => 'ਪਾਸਵਰਡ (ਵਿਕਲਪਿਕ)';

  @override
  String get adminUsernameRequired => 'ਉਪਭੋਗਤਾ ਨਾਮ ਖਾਲੀ ਨਹੀਂ ਹੋ ਸਕਦਾ ਹੈ';

  @override
  String get adminNoProfileChanges =>
      'ਸੁਰੱਖਿਅਤ ਕਰਨ ਲਈ ਕੋਈ ਪ੍ਰੋਫਾਈਲ ਬਦਲਾਅ ਨਹੀਂ ਹੈ';

  @override
  String get adminProfileSaved => 'ਪ੍ਰੋਫਾਈਲ ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਗਿਆ';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'ਇਜਾਜ਼ਤਾਂ ਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminPasswordsMismatch => 'ਪਾਸਵਰਡ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'ਉਪਭੋਗਤਾ ਨੂੰ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminBackToUsers => 'ਉਪਭੋਗਤਾਵਾਂ \'ਤੇ ਵਾਪਸ ਜਾਓ';

  @override
  String get adminSaveProfile => 'ਪ੍ਰੋਫਾਈਲ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get adminDeleteUser => 'ਉਪਭੋਗਤਾ ਨੂੰ ਮਿਟਾਓ';

  @override
  String get admin => 'ਐਡਮਿਨ';

  @override
  String get adminFullAccessWarning =>
      'ਪ੍ਰਬੰਧਕਾਂ ਕੋਲ ਸਰਵਰ ਤੱਕ ਪੂਰੀ ਪਹੁੰਚ ਹੈ। ਸਾਵਧਾਨੀ ਨਾਲ ਗਰਾਂਟ ਦਿਓ.';

  @override
  String get administrator => 'ਪ੍ਰਸ਼ਾਸਕ';

  @override
  String get adminHiddenUser => 'ਲੁਕਿਆ ਹੋਇਆ ਉਪਭੋਗਤਾ';

  @override
  String get adminAllowMediaPlayback => 'ਮੀਡੀਆ ਪਲੇਬੈਕ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowAudioTranscoding => 'ਆਡੀਓ ਟ੍ਰਾਂਸਕੋਡਿੰਗ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowVideoTranscoding => 'ਵੀਡੀਓ ਟ੍ਰਾਂਸਕੋਡਿੰਗ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowRemuxing => 'ਰੀਮਕਸਿੰਗ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminForceRemoteTranscoding =>
      'ਰਿਮੋਟ ਸਰੋਤ ਟ੍ਰਾਂਸਕੋਡਿੰਗ ਲਈ ਜ਼ੋਰ ਦਿਓ';

  @override
  String get adminAllowContentDeletion => 'ਸਮੱਗਰੀ ਨੂੰ ਮਿਟਾਉਣ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get adminAllowContentDownloading =>
      'ਸਮੱਗਰੀ ਨੂੰ ਡਾਊਨਲੋਡ ਕਰਨ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get adminAllowPublicSharing => 'ਜਨਤਕ ਸਾਂਝਾਕਰਨ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowRemoteControl =>
      'ਦੂਜੇ ਉਪਭੋਗਤਾਵਾਂ ਦੇ ਰਿਮੋਟ ਕੰਟਰੋਲ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowSharedDeviceControl =>
      'ਸ਼ੇਅਰਡ ਡਿਵਾਈਸ ਕੰਟਰੋਲ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowRemoteAccess => 'ਰਿਮੋਟ ਪਹੁੰਚ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminRemoteBitrateLimit => 'ਰਿਮੋਟ ਕਲਾਇੰਟ ਬਿਟਰੇਟ ਸੀਮਾ (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'ਬਿਨਾਂ ਸੀਮਾ ਦੇ ਖਾਲੀ ਛੱਡੋ';

  @override
  String get adminMaxActiveSessions => 'ਅਧਿਕਤਮ ਕਿਰਿਆਸ਼ੀਲ ਸੈਸ਼ਨ';

  @override
  String get adminAllowLiveTvAccess => 'ਲਾਈਵ ਟੀਵੀ ਤੱਕ ਪਹੁੰਚ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowLiveTvManagement => 'ਲਾਈਵ ਟੀਵੀ ਪ੍ਰਬੰਧਨ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowCollectionManagement => 'ਸੰਗ੍ਰਹਿ ਪ੍ਰਬੰਧਨ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowSubtitleManagement => 'ਉਪਸਿਰਲੇਖ ਪ੍ਰਬੰਧਨ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminAllowLyricManagement => 'ਗੀਤ ਪ੍ਰਬੰਧਨ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get adminSavePermissions => 'ਅਧਿਕਾਰ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get adminEnableAllLibraryAccess =>
      'ਸਾਰੀਆਂ ਲਾਇਬ੍ਰੇਰੀਆਂ ਤੱਕ ਪਹੁੰਚ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminSaveAccess => 'ਪਹੁੰਚ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get adminChangePassword => 'ਪਾਸਵਰਡ ਬਦਲੋ';

  @override
  String get adminNewPassword => 'ਨਵਾਂ ਪਾਸਵਰਡ';

  @override
  String get adminConfirmPassword => 'ਪਾਸਵਰਡ ਪੱਕਾ ਕਰੋ';

  @override
  String get adminSetPassword => 'ਪਾਸਵਰਡ ਸੈੱਟ ਕਰੋ';

  @override
  String get adminResetPassword => 'ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰੋ';

  @override
  String get adminPasswordReset => 'ਪਾਸਵਰਡ ਰੀਸੈੱਟ';

  @override
  String get adminPasswordUpdated => 'ਪਾਸਵਰਡ ਅੱਪਡੇਟ ਕੀਤਾ ਗਿਆ';

  @override
  String get adminUserSettings => 'ਉਪਭੋਗਤਾ ਸੈਟਿੰਗਾਂ';

  @override
  String get adminLibraryAccess => 'ਲਾਇਬ੍ਰੇਰੀ ਪਹੁੰਚ';

  @override
  String get adminDeviceAndChannelAccess => 'ਡਿਵਾਈਸ ਅਤੇ ਚੈਨਲ ਪਹੁੰਚ';

  @override
  String get adminEnableAllDevices =>
      'ਸਾਰੀਆਂ ਡਿਵਾਈਸਾਂ ਤੱਕ ਪਹੁੰਚ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminEnableAllChannels => 'ਸਾਰੇ ਚੈਨਲਾਂ ਤੱਕ ਪਹੁੰਚ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminResetPasswordWarning =>
      'ਇਹ ਪਾਸਵਰਡ ਨੂੰ ਹਟਾ ਦੇਵੇਗਾ। ਉਪਭੋਗਤਾ ਬਿਨਾਂ ਪਾਸਵਰਡ ਦੇ ਲਾਗਇਨ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੇਗਾ।';

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
  String get adminCreateApiKey => 'API ਕੁੰਜੀ ਬਣਾਓ';

  @override
  String get adminAppName => 'ਐਪ ਦਾ ਨਾਮ';

  @override
  String get adminApiKeyCreated => 'API ਕੁੰਜੀ ਬਣਾਈ ਗਈ';

  @override
  String get adminApiKeyCreatedNoToken =>
      'ਕੁੰਜੀ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਈ ਗਈ। ਸਰਵਰ ਨੇ ਟੋਕਨ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ। ਸਰਵਰ API ਕੁੰਜੀਆਂ ਦੀ ਜਾਂਚ ਕਰੋ।';

  @override
  String get adminKeyCopied => 'ਕੁੰਜੀ ਨੂੰ ਕਲਿੱਪਬੋਰਡ \'ਤੇ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'ਸਰਵਰ ਜਵਾਬ ਤੋਂ ਕੁੰਜੀ ਟੋਕਨ ਗੁੰਮ ਹੈ';

  @override
  String get adminRevokeApiKey => 'API ਕੁੰਜੀ ਨੂੰ ਰੱਦ ਕਰੋ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API ਕੁੰਜੀ ਰੱਦ ਕੀਤੀ ਗਈ';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API ਕੁੰਜੀਆਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminApiKeysTitle => 'API ਕੁੰਜੀਆਂ';

  @override
  String get adminCreateKey => 'ਕੁੰਜੀ ਬਣਾਓ';

  @override
  String get adminNoApiKeys => 'ਕੋਈ API ਕੁੰਜੀਆਂ ਨਹੀਂ ਮਿਲੀਆਂ';

  @override
  String get adminUnknownApp => 'ਅਗਿਆਤ ਐਪ';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'ਬੈਕਅੱਪ ਬਣਾਇਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get adminBackupCreated => 'ਬੈਕਅੱਪ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਇਆ ਗਿਆ';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'ਸਰਵਰ ਜਵਾਬ ਵਿੱਚ ਬੈਕਅੱਪ ਮਾਰਗ ਗੁੰਮ ਹੈ';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'ਰੀਸਟੋਰ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get adminRestoringBackup => 'ਬੈਕਅੱਪ ਰੀਸਟੋਰ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'ਬੈਕਅੱਪ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminCreateBackup => 'ਬੈਕਅੱਪ ਬਣਾਓ';

  @override
  String get adminNoBackups => 'ਕੋਈ ਬੈਕਅੱਪ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get adminViewDetails => 'ਵੇਰਵੇ ਵੇਖੋ';

  @override
  String get restore => 'ਰੀਸਟੋਰ ਕਰੋ';

  @override
  String get adminLogsLoadFailed => 'ਸਰਵਰ ਲੌਗ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminNoLogFiles => 'ਕੋਈ ਲੌਗ ਫਾਈਲਾਂ ਨਹੀਂ ਲੱਭੀਆਂ';

  @override
  String get adminLogCopied => 'ਲੌਗ ਕਲਿੱਪਬੋਰਡ \'ਤੇ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String get adminSaveLogFile => 'ਲੌਗ ਫਾਈਲ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰੋ';

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
  String get adminSearchInLog => 'ਲੌਗ ਵਿੱਚ ਖੋਜ ਕਰੋ';

  @override
  String get adminNoMatchingLines => 'ਕੋਈ ਮੇਲ ਖਾਂਦੀਆਂ ਲਾਈਨਾਂ ਨਹੀਂ ਹਨ';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'ਕੋਈ ਨਿਯਤ ਕਾਰਜ ਨਹੀਂ ਮਿਲੇ';

  @override
  String get adminNoTasksMatchFilter =>
      'ਕੋਈ ਵੀ ਕਾਰਜ ਮੌਜੂਦਾ ਫਿਲਟਰ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ';

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
  String get adminRunNow => 'ਹੁਣੇ ਚਲਾਓ';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'ਆਖਰੀ ਐਗਜ਼ੀਕਿਊਸ਼ਨ';

  @override
  String get adminTriggers => 'ਟਰਿਗਰਜ਼';

  @override
  String get adminAddTrigger => 'ਟਰਿੱਗਰ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminNoTriggers => 'ਕੋਈ ਟਰਿਗਰਸ ਕੌਂਫਿਗਰ ਨਹੀਂ ਕੀਤੇ ਗਏ';

  @override
  String get adminTriggerType => 'ਟਰਿੱਗਰ ਦੀ ਕਿਸਮ';

  @override
  String get adminTimeLimit => 'ਸਮਾਂ ਸੀਮਾ (ਵਿਕਲਪਿਕ)';

  @override
  String get adminNoLimit => 'ਕੋਈ ਸੀਮਾ ਨਹੀਂ';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'ਹਫ਼ਤੇ ਦਾ ਦਿਨ';

  @override
  String get adminSearchPlugins => 'ਪਲੱਗਇਨ ਖੋਜੋ...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'ਪਲੱਗਇਨ ਨੂੰ ਅਣਇੰਸਟੌਲ ਕਰੋ';

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
      'ਕੋਈ ਪਲੱਗਇਨ ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ';

  @override
  String get adminNoPluginsInstalled => 'ਕੋਈ ਪਲੱਗਇਨ ਸਥਾਪਤ ਨਹੀਂ ਹਨ';

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
      'ਕੋਈ ਪੈਕੇਜ ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ';

  @override
  String get adminNoPackagesAvailable => 'ਕੋਈ ਪੈਕੇਜ ਉਪਲਬਧ ਨਹੀਂ ਹਨ';

  @override
  String get adminExperimentalIntegration => 'ਪ੍ਰਯੋਗਾਤਮਕ ਏਕੀਕਰਣ';

  @override
  String get adminExperimentalWarning =>
      'ਪਲੱਗਇਨ ਸੈਟਿੰਗਾਂ ਏਕੀਕਰਣ ਅਜੇ ਵੀ ਪ੍ਰਯੋਗਾਤਮਕ ਹੈ। ਕੁਝ ਸੈਟਿੰਗਾਂ ਪੰਨੇ ਸਹੀ ਢੰਗ ਨਾਲ ਰੈਂਡਰ ਨਹੀਂ ਹੋ ਸਕਦੇ ਹਨ।';

  @override
  String get continueAction => 'ਜਾਰੀ ਰੱਖੋ';

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
      'ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹਣ ਵਿੱਚ ਅਸਮਰੱਥ: ਪ੍ਰਮਾਣਿਕਤਾ ਟੋਕਨ ਗੁੰਮ ਹੈ।';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'ਪਲੱਗਇਨ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'ਪਲੱਗਇਨ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminPluginSettingsPage => 'ਪਲੱਗਇਨ ਸੈਟਿੰਗਜ਼ ਪੰਨਾ';

  @override
  String get adminRevisionHistory => 'ਸੰਸ਼ੋਧਨ ਇਤਿਹਾਸ';

  @override
  String get adminNoChangelog => 'ਕੋਈ ਚੇਂਜਲੌਗ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get adminRemoveRepository => 'ਰਿਪੋਜ਼ਟਰੀ ਹਟਾਓ';

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
  String get adminRepositoryNameHint => 'ਜਿਵੇਂ ਕਿ Jellyfin ਸਥਿਰ';

  @override
  String get adminRepositoryUrl => 'ਰਿਪੋਜ਼ਟਰੀ URL';

  @override
  String get adminAddEntry => 'ਐਂਟਰੀ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminInvalidUrl => 'ਅਵੈਧ URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੋਲ੍ਹੋ';

  @override
  String get adminOpenExternally => 'ਬਾਹਰੋਂ ਖੋਲ੍ਹੋ';

  @override
  String get adminGeneralSettings => 'ਆਮ ਸੈਟਿੰਗਾਂ';

  @override
  String get adminServerName => 'ਸਰਵਰ ਦਾ ਨਾਮ';

  @override
  String get adminPreferredMetadataCountry => 'ਤਰਜੀਹੀ ਮੈਟਾਡੇਟਾ ਦੇਸ਼';

  @override
  String get adminCachePath => 'ਕੈਸ਼ ਮਾਰਗ';

  @override
  String get adminMetadataPath => 'ਮੈਟਾਡੇਟਾ ਮਾਰਗ';

  @override
  String get adminLibraryScanConcurrency => 'ਲਾਇਬ੍ਰੇਰੀ ਸਕੈਨ ਇਕਸਾਰਤਾ';

  @override
  String get adminParallelImageEncodingLimit => 'ਸਮਾਨਾਂਤਰ ਚਿੱਤਰ ਏਨਕੋਡਿੰਗ ਸੀਮਾ';

  @override
  String get adminSlowResponseThreshold => 'ਹੌਲੀ ਜਵਾਬ ਸੀਮਾ (ms)';

  @override
  String get adminBrandingSaved => 'ਬ੍ਰਾਂਡਿੰਗ ਸੈਟਿੰਗਾਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminBrandingLoadFailed => 'ਬ੍ਰਾਂਡਿੰਗ ਸੈਟਿੰਗਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminLoginDisclaimer => 'ਲੌਗਇਨ ਬੇਦਾਅਵਾ';

  @override
  String get adminLoginDisclaimerHint => 'ਲੌਗਇਨ ਫਾਰਮ ਦੇ ਹੇਠਾਂ ਪ੍ਰਦਰਸ਼ਿਤ HTML';

  @override
  String get adminCustomCss => 'ਕਸਟਮ CSS';

  @override
  String get adminCustomCssHint => 'ਵੈੱਬ ਇੰਟਰਫੇਸ \'ਤੇ ਕਸਟਮ CSS ਲਾਗੂ ਕੀਤਾ ਗਿਆ';

  @override
  String get adminEnableSplashScreen => 'ਸਪਲੈਸ਼ ਸਕ੍ਰੀਨ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminStreamingSaved => 'ਸਟ੍ਰੀਮਿੰਗ ਸੈਟਿੰਗਾਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminStreamingLoadFailed =>
      'ਸਟ੍ਰੀਮਿੰਗ ਸੈਟਿੰਗਾਂ ਨੂੰ ਲੋਡ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get adminStreamingDescription =>
      'ਰਿਮੋਟ ਕਨੈਕਸ਼ਨਾਂ ਲਈ ਗਲੋਬਲ ਸਟ੍ਰੀਮਿੰਗ ਬਿੱਟਰੇਟ ਸੀਮਾਵਾਂ ਸੈੱਟ ਕਰੋ।';

  @override
  String get adminRemoteBitrateLimitMbps => 'ਰਿਮੋਟ ਕਲਾਇੰਟ ਬਿਟਰੇਟ ਸੀਮਾ (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'ਬੇਅੰਤ ਲਈ ਖਾਲੀ ਜਾਂ 0 ਛੱਡੋ';

  @override
  String get adminPlaybackSaved => 'ਪਲੇਬੈਕ ਸੈਟਿੰਗਾਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminPlaybackLoadFailed => 'ਪਲੇਬੈਕ ਸੈਟਿੰਗਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminPlaybackTranscoding => 'ਪਲੇਬੈਕ / ਟ੍ਰਾਂਸਕੋਡਿੰਗ';

  @override
  String get adminHardwareAcceleration => 'ਹਾਰਡਵੇਅਰ ਪ੍ਰਵੇਗ';

  @override
  String get adminVaapiDevice => 'VA-API ਡਿਵਾਈਸ';

  @override
  String get adminEnableHardwareEncoding => 'ਹਾਰਡਵੇਅਰ ਏਨਕੋਡਿੰਗ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminEnableHardwareDecoding =>
      'ਇਸ ਲਈ ਹਾਰਡਵੇਅਰ ਡੀਕੋਡਿੰਗ ਨੂੰ ਸਮਰੱਥ ਕਰੋ:';

  @override
  String get adminEncodingThreads => 'ਐਨਕੋਡਿੰਗ ਥ੍ਰੈੱਡਸ';

  @override
  String get adminAutomatic => '0 = ਆਟੋਮੈਟਿਕ';

  @override
  String get adminTranscodingTempPath => 'ਟ੍ਰਾਂਸਕੋਡਿੰਗ ਤਾਪਮਾਨ ਮਾਰਗ';

  @override
  String get adminEnableFallbackFont => 'ਫਾਲਬੈਕ ਫੌਂਟ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminFallbackFontPath => 'ਫਾਲਬੈਕ ਫੌਂਟ ਮਾਰਗ';

  @override
  String get adminAllowSegmentDeletion => 'ਖੰਡ ਨੂੰ ਮਿਟਾਉਣ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminSegmentKeepSeconds => 'ਖੰਡ ਰੱਖੋ (ਸਕਿੰਟ)';

  @override
  String get adminThrottleBuffering => 'ਥ੍ਰੋਟਲ ਬਫਰਿੰਗ';

  @override
  String get adminTrickplaySaved => 'ਟ੍ਰਿਕਪਲੇ ਸੈਟਿੰਗਾਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminTrickplayLoadFailed => 'ਟ੍ਰਿਕਪਲੇ ਸੈਟਿੰਗਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminEnableHardwareAcceleration =>
      'ਹਾਰਡਵੇਅਰ ਪ੍ਰਵੇਗ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminEnableKeyFrameExtraction =>
      'ਸਿਰਫ਼ ਕੁੰਜੀ ਫ੍ਰੇਮ ਕੱਢਣ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminKeyFrameSubtitle => 'ਤੇਜ਼ ਪਰ ਘੱਟ ਸ਼ੁੱਧਤਾ';

  @override
  String get adminScanBehavior => 'ਸਕੈਨ ਵਿਵਹਾਰ';

  @override
  String get adminProcessPriority => 'ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਤਰਜੀਹ';

  @override
  String get adminImageSettings => 'ਚਿੱਤਰ ਸੈਟਿੰਗਾਂ';

  @override
  String get adminIntervalMs => 'ਅੰਤਰਾਲ (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'ਫਰੇਮਾਂ ਨੂੰ ਕਿੰਨੀ ਵਾਰ ਕੈਪਚਰ ਕਰਨਾ ਹੈ';

  @override
  String get adminWidthResolutions => 'ਚੌੜਾਈ ਰੈਜ਼ੋਲੂਸ਼ਨ';

  @override
  String get adminTileWidth => 'ਟਾਇਲ ਦੀ ਚੌੜਾਈ';

  @override
  String get adminTileHeight => 'ਟਾਇਲ ਦੀ ਉਚਾਈ';

  @override
  String get adminQualitySubtitle =>
      'ਹੇਠਲੇ ਮੁੱਲ = ਬਿਹਤਰ ਗੁਣਵੱਤਾ, ਵੱਡੀਆਂ ਫਾਈਲਾਂ';

  @override
  String get adminProcessThreads => 'ਪ੍ਰਕਿਰਿਆ ਥ੍ਰੈਡਸ';

  @override
  String get adminResumeSaved => 'ਮੁੜ-ਚਾਲੂ ਸੈਟਿੰਗਾਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminResumeLoadFailed =>
      'ਰੈਜ਼ਿਊਮੇ ਸੈਟਿੰਗਾਂ ਨੂੰ ਲੋਡ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get adminResumeDescription =>
      'ਕੌਂਫਿਗਰ ਕਰੋ ਕਿ ਸਮਗਰੀ ਨੂੰ ਅੰਸ਼ਕ ਤੌਰ \'ਤੇ ਚਲਾਏ ਜਾਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਚਲਾਏ ਗਏ ਵਜੋਂ ਚਿੰਨ੍ਹਿਤ ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get adminMinResumePercentage => 'ਘੱਟੋ-ਘੱਟ ਰੈਜ਼ਿਊਮੇ ਪ੍ਰਤੀਸ਼ਤ';

  @override
  String get adminMinResumeSubtitle =>
      'ਪ੍ਰਗਤੀ ਨੂੰ ਬਚਾਉਣ ਲਈ ਸਮੱਗਰੀ ਨੂੰ ਇਸ ਪ੍ਰਤੀਸ਼ਤ ਤੋਂ ਅੱਗੇ ਚਲਾਇਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String get adminMaxResumePercentage => 'ਅਧਿਕਤਮ ਰੈਜ਼ਿਊਮੇ ਪ੍ਰਤੀਸ਼ਤ';

  @override
  String get adminMaxResumeSubtitle =>
      'ਸਮੱਗਰੀ ਨੂੰ ਇਸ ਪ੍ਰਤੀਸ਼ਤ ਤੋਂ ਬਾਅਦ ਪੂਰੀ ਤਰ੍ਹਾਂ ਚਲਾਇਆ ਗਿਆ ਮੰਨਿਆ ਜਾਂਦਾ ਹੈ';

  @override
  String get adminMinResumeDuration => 'ਘੱਟੋ-ਘੱਟ ਰੈਜ਼ਿਊਮੇ ਦੀ ਮਿਆਦ (ਸਕਿੰਟ)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'ਇਸ ਤੋਂ ਛੋਟੀਆਂ ਆਈਟਮਾਂ ਮੁੜ ਸ਼ੁਰੂ ਕਰਨ ਯੋਗ ਨਹੀਂ ਹਨ';

  @override
  String get adminMinAudiobookResume => 'ਨਿਊਨਤਮ ਆਡੀਓਬੁੱਕ ਰੈਜ਼ਿਊਮੇ ਪ੍ਰਤੀਸ਼ਤਤਾ';

  @override
  String get adminMaxAudiobookResume => 'ਅਧਿਕਤਮ ਆਡੀਓਬੁੱਕ ਰੈਜ਼ਿਊਮੇ ਪ੍ਰਤੀਸ਼ਤਤਾ';

  @override
  String get adminNetworkingSaved =>
      'ਨੈੱਟਵਰਕਿੰਗ ਸੈਟਿੰਗਾਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ। ਇੱਕ ਸਰਵਰ ਰੀਸਟਾਰਟ ਦੀ ਲੋੜ ਹੋ ਸਕਦੀ ਹੈ।';

  @override
  String get adminNetworkingLoadFailed =>
      'ਨੈੱਟਵਰਕਿੰਗ ਸੈਟਿੰਗਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminNetworkingWarning =>
      'ਨੈੱਟਵਰਕਿੰਗ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਤਬਦੀਲੀਆਂ ਲਈ ਸਰਵਰ ਨੂੰ ਮੁੜ ਚਾਲੂ ਕਰਨ ਦੀ ਲੋੜ ਹੋ ਸਕਦੀ ਹੈ।';

  @override
  String get adminEnableRemoteAccess => 'ਰਿਮੋਟ ਪਹੁੰਚ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get ports => 'ਬੰਦਰਗਾਹਾਂ';

  @override
  String get adminHttpPort => 'HTTP ਪੋਰਟ';

  @override
  String get adminHttpsPort => 'HTTPS ਪੋਰਟ';

  @override
  String get adminPublicHttpsPort => 'ਜਨਤਕ HTTPS ਪੋਰਟ';

  @override
  String get adminBaseUrl => 'ਬੇਸ URL';

  @override
  String get adminBaseUrlHint => 'ਜਿਵੇਂ ਕਿ /ਜੈਲੀਫਿਨ';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminLocalNetwork => 'ਸਥਾਨਕ ਨੈੱਟਵਰਕ';

  @override
  String get adminLocalNetworkAddresses => 'ਸਥਾਨਕ ਨੈੱਟਵਰਕ ਪਤੇ';

  @override
  String get adminKnownProxies => 'ਜਾਣੇ-ਪਛਾਣੇ ਪ੍ਰੌਕਸੀ';

  @override
  String get adminRemoteIpFilter => 'ਰਿਮੋਟ IP ਫਿਲਟਰ';

  @override
  String get adminRemoteIpFilterEntries => 'ਰਿਮੋਟ IP ਫਿਲਟਰ';

  @override
  String get adminCertificatePath => 'ਸਰਟੀਫਿਕੇਟ ਮਾਰਗ';

  @override
  String get whitelist => 'ਵ੍ਹਾਈਟਲਿਸਟ';

  @override
  String get blacklist => 'ਬਲੈਕਲਿਸਟ';

  @override
  String get notSet => 'ਸੈੱਟ ਨਹੀਂ ਹੈ';

  @override
  String get adminMetadataSaved => 'ਮੈਟਾਡੇਟਾ ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਗਿਆ';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'ਮੈਟਾਡੇਟਾ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get recursive => 'ਆਵਰਤੀ';

  @override
  String get adminReplaceAllMetadata => 'ਸਾਰਾ ਮੈਟਾਡੇਟਾ ਬਦਲੋ';

  @override
  String get adminReplaceAllImages => 'ਸਾਰੀਆਂ ਤਸਵੀਰਾਂ ਬਦਲੋ';

  @override
  String get adminMetadataRefreshRequested =>
      'ਮੈਟਾਡੇਟਾ ਰਿਫ੍ਰੈਸ਼ ਦੀ ਬੇਨਤੀ ਕੀਤੀ ਗਈ';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'ਰਿਮੋਟ ਵਿਅਕਤੀ ਦੀ ਖੋਜ ਕਰੋ';

  @override
  String get adminNoRemoteMatches => 'ਕੋਈ ਰਿਮੋਟ ਮੇਲ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get adminRemoteResults => 'ਰਿਮੋਟ ਨਤੀਜੇ';

  @override
  String get adminRemoteMetadataApplied => 'ਰਿਮੋਟ ਮੈਟਾਡੇਟਾ ਲਾਗੂ ਕੀਤਾ ਗਿਆ';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'ਸਮੱਗਰੀ ਦੀ ਕਿਸਮ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get adminContentType => 'ਸਮੱਗਰੀ ਦੀ ਕਿਸਮ';

  @override
  String get adminContentTypeUpdated => 'ਸਮੱਗਰੀ ਦੀ ਕਿਸਮ ਅੱਪਡੇਟ ਕੀਤੀ ਗਈ';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'ਮੈਟਾਡੇਟਾ ਸੰਪਾਦਕ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminNoPeopleEntries => 'ਕੋਈ ਲੋਕ ਇੰਦਰਾਜ਼';

  @override
  String get adminNoExternalIds => 'ਕੋਈ ਬਾਹਰੀ ਆਈਡੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'ਅਸਮਰਥਿਤ ਚਿੱਤਰ ਫਾਰਮੈਟ';

  @override
  String get adminImageReadFailed => 'ਚੁਣੇ ਗਏ ਚਿੱਤਰ ਨੂੰ ਪੜ੍ਹਨ ਵਿੱਚ ਅਸਫਲ';

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
  String get adminAllProviders => 'ਸਾਰੇ ਪ੍ਰਦਾਤਾ';

  @override
  String get adminNoRemoteImages => 'ਕੋਈ ਰਿਮੋਟ ਚਿੱਤਰ ਨਹੀਂ ਮਿਲੇ';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'ਟਿਊਨਰ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminTunerType => 'ਟਿਊਨਰ ਦੀ ਕਿਸਮ';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, ਹੋਰ';

  @override
  String get adminUrlPath => 'URL / ਮਾਰਗ';

  @override
  String get adminNameOptional => 'ਨਾਮ (ਵਿਕਲਪਿਕ)';

  @override
  String get adminTunerAdded => 'ਟਿਊਨਰ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'ਗਾਈਡ ਪ੍ਰਦਾਤਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminProviderType => 'ਪ੍ਰਦਾਤਾ ਦੀ ਕਿਸਮ';

  @override
  String get adminProviderTypeHint => 'ਅਨੁਸੂਚੀ ਡਾਇਰੈਕਟ ਜਾਂ XMLTV';

  @override
  String get adminUsernameOptional => 'ਉਪਭੋਗਤਾ ਨਾਮ (ਵਿਕਲਪਿਕ)';

  @override
  String get adminRefreshInterval => 'ਰਿਫ੍ਰੈਸ਼ ਅੰਤਰਾਲ (ਘੰਟੇ)';

  @override
  String get adminProviderAdded => 'ਪ੍ਰਦਾਤਾ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'ਟਿਊਨਰ ਰੀਸੈੱਟ ਦੀ ਬੇਨਤੀ ਕੀਤੀ ਗਈ';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'ਰਿਕਾਰਡਿੰਗ ਸੈਟਿੰਗਾਂ';

  @override
  String get adminPrePadding => 'ਪ੍ਰੀ-ਪੈਡਿੰਗ (ਮਿੰਟ)';

  @override
  String get adminPostPadding => 'ਪੋਸਟ-ਪੈਡਿੰਗ (ਮਿੰਟ)';

  @override
  String get adminRecordingPath => 'ਰਿਕਾਰਡਿੰਗ ਮਾਰਗ';

  @override
  String get adminSeriesRecordingPath => 'ਸੀਰੀਜ਼ ਰਿਕਾਰਡਿੰਗ ਮਾਰਗ';

  @override
  String get adminRecordingSettingsSaved =>
      'ਰਿਕਾਰਡਿੰਗ ਸੈਟਿੰਗਾਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'ਚੈਨਲ ਮੈਪਿੰਗ ਸੈੱਟ ਕਰੋ';

  @override
  String get adminMappingJson => 'JSON ਮੈਪਿੰਗ';

  @override
  String get adminMappingJsonHint => 'ਉਦਾਹਰਨ: JSON ਪੇਲੋਡ ਮੈਪਿੰਗ';

  @override
  String get adminChannelMappingsUpdated => 'ਚੈਨਲ ਮੈਪਿੰਗ ਅੱਪਡੇਟ ਕੀਤੀ ਗਈ';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'ਲਾਈਵ ਟੀਵੀ ਪ੍ਰਸ਼ਾਸਨ ਨੂੰ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminTunerDevices => 'ਟਿਊਨਰ ਡਿਵਾਈਸਾਂ';

  @override
  String get adminNoTunerHosts => 'ਕੋਈ ਟਿਊਨਰ ਹੋਸਟ ਕੌਂਫਿਗਰ ਨਹੀਂ ਕੀਤਾ ਗਿਆ';

  @override
  String get adminGuideProviders => 'ਗਾਈਡ ਪ੍ਰਦਾਤਾ';

  @override
  String get adminAddProvider => 'ਪ੍ਰਦਾਤਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminNoListingProviders =>
      'ਕੋਈ ਸੂਚੀ ਪ੍ਰਦਾਤਾ ਕੌਂਫਿਗਰ ਨਹੀਂ ਕੀਤਾ ਗਿਆ';

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
  String get adminTunerDiscovery => 'ਟਿਊਨਰ ਖੋਜ';

  @override
  String get adminChannelMappings => 'ਚੈਨਲ ਮੈਪਿੰਗ';

  @override
  String get adminNoDiscoveredTuners => 'ਅਜੇ ਤੱਕ ਕੋਈ ਖੋਜਿਆ ਟਿਊਨਰ ਨਹੀਂ';

  @override
  String get adminSettingsSaved => 'ਸੈਟਿੰਗਾਂ ਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminBackupsNotAvailable =>
      'ਇਸ ਸਰਵਰ ਬਿਲਡ \'ਤੇ ਬੈਕਅੱਪ ਉਪਲਬਧ ਨਹੀਂ ਹਨ।';

  @override
  String get adminRestoreWarning1 =>
      'ਰੀਸਟੋਰ ਕਰਨਾ ਸਾਰੇ ਮੌਜੂਦਾ ਸਰਵਰ ਡੇਟਾ ਨੂੰ ਬੈਕਅੱਪ ਡੇਟਾ ਨਾਲ ਬਦਲ ਦੇਵੇਗਾ।';

  @override
  String get adminRestoreWarning2 =>
      'ਮੌਜੂਦਾ ਸਰਵਰ ਸੈਟਿੰਗਾਂ, ਉਪਭੋਗਤਾਵਾਂ ਅਤੇ ਲਾਇਬ੍ਰੇਰੀ ਡੇਟਾ ਨੂੰ ਓਵਰਰਾਈਟ ਕੀਤਾ ਜਾਵੇਗਾ।';

  @override
  String get adminRestoreWarning3 => 'ਸਰਵਰ ਬਹਾਲੀ ਤੋਂ ਬਾਅਦ ਮੁੜ ਚਾਲੂ ਹੋ ਜਾਵੇਗਾ।';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'ਮੁੜ ਬਹਾਲ ਕਰਨ ਦੀ ਬੇਨਤੀ ਕੀਤੀ ਗਈ। ਸਰਵਰ ਰੀਸਟਾਰਟ ਇਸ ਸੈਸ਼ਨ ਨੂੰ ਡਿਸਕਨੈਕਟ ਕਰ ਸਕਦਾ ਹੈ।';

  @override
  String get adminBackupsTitle => 'ਬੈਕਅੱਪ';

  @override
  String get adminUnknownDate => 'ਅਗਿਆਤ ਮਿਤੀ';

  @override
  String get adminUnnamedBackup => 'ਬੇਨਾਮ ਬੈਕਅੱਪ';

  @override
  String get adminLiveTvNotAvailable =>
      'ਲਾਈਵ ਟੀਵੀ ਪ੍ਰਸ਼ਾਸਨ ਇਸ ਸਰਵਰ ਬਿਲਡ \'ਤੇ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get adminLiveTvTitle => 'ਲਾਈਵ ਟੀਵੀ ਪ੍ਰਸ਼ਾਸਨ';

  @override
  String get adminApply => 'ਲਾਗੂ ਕਰੋ';

  @override
  String get adminNotSet => 'ਸੈੱਟ ਨਹੀਂ ਹੈ';

  @override
  String get adminReset => 'ਰੀਸੈਟ ਕਰੋ';

  @override
  String get adminLogsTitle => 'ਸਰਵਰ ਲੌਗਸ';

  @override
  String get adminLogsNewestFirst => 'ਸਭ ਤੋਂ ਨਵਾਂ ਪਹਿਲਾ';

  @override
  String get adminLogsOldestFirst => 'ਸਭ ਤੋਂ ਪੁਰਾਣਾ ਪਹਿਲਾ';

  @override
  String get adminLogsJustNow => 'ਹੁਣੇ';

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
  String get adminLogViewerNoMatches => 'ਕੋਈ ਮੇਲ ਖਾਂਦੀਆਂ ਲਾਈਨਾਂ ਨਹੀਂ ਹਨ';

  @override
  String get adminMetadataEditorTitle => 'ਮੈਟਾਡੇਟਾ ਸੰਪਾਦਕ';

  @override
  String get adminMetadataRemote => 'ਰਿਮੋਟ';

  @override
  String get adminMetadataType => 'ਟਾਈਪ ਕਰੋ';

  @override
  String get adminMetadataDetails => 'ਵੇਰਵੇ';

  @override
  String get adminMetadataExternalIds => 'ਬਾਹਰੀ ਆਈ.ਡੀ';

  @override
  String get adminMetadataImages => 'ਚਿੱਤਰ';

  @override
  String get adminMetadataFieldTitle => 'ਸਿਰਲੇਖ';

  @override
  String get adminMetadataFieldSortTitle => 'ਕ੍ਰਮਬੱਧ ਸਿਰਲੇਖ';

  @override
  String get adminMetadataFieldOriginalTitle => 'ਮੂਲ ਸਿਰਲੇਖ';

  @override
  String get adminMetadataFieldPremiereDate => 'ਪ੍ਰੀਮੀਅਰ ਦੀ ਮਿਤੀ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'ਸਮਾਪਤੀ ਮਿਤੀ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'ਉਤਪਾਦਨ ਸਾਲ';

  @override
  String get adminMetadataFieldOfficialRating => 'ਅਧਿਕਾਰਤ ਰੇਟਿੰਗ';

  @override
  String get adminMetadataFieldCommunityRating => 'ਕਮਿਊਨਿਟੀ ਰੇਟਿੰਗ';

  @override
  String get adminMetadataFieldCriticRating => 'ਆਲੋਚਕ ਰੇਟਿੰਗ';

  @override
  String get adminMetadataFieldTagline => 'ਟੈਗਲਾਈਨ';

  @override
  String get adminMetadataFieldOverview => 'ਸੰਖੇਪ ਜਾਣਕਾਰੀ';

  @override
  String get adminMetadataGenres => 'ਸ਼ੈਲੀਆਂ';

  @override
  String get adminMetadataTags => 'ਟੈਗਸ';

  @override
  String get adminMetadataStudios => 'ਸਟੂਡੀਓਜ਼';

  @override
  String get adminMetadataPeople => 'ਲੋਕ';

  @override
  String get adminMetadataAddGenre => 'ਸ਼ੈਲੀ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminMetadataAddTag => 'ਟੈਗ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminMetadataAddStudio => 'ਸਟੂਡੀਓ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminMetadataAddPerson => 'ਵਿਅਕਤੀ ਨੂੰ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminMetadataEditPerson => 'ਵਿਅਕਤੀ ਦਾ ਸੰਪਾਦਨ ਕਰੋ';

  @override
  String get adminMetadataRole => 'ਭੂਮਿਕਾ';

  @override
  String get adminMetadataImagePrimary => 'ਪ੍ਰਾਇਮਰੀ';

  @override
  String get adminMetadataImageBackdrop => 'ਬੈਕਡ੍ਰੌਪ';

  @override
  String get adminMetadataImageLogo => 'ਲੋਗੋ';

  @override
  String get adminMetadataImageBanner => 'ਬੈਨਰ';

  @override
  String get adminMetadataImageThumb => 'ਅੰਗੂਠਾ';

  @override
  String get adminMetadataRecursive => 'ਆਵਰਤੀ';

  @override
  String get adminMetadataProvider => 'ਪ੍ਰਦਾਤਾ';

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
  String get adminMetadataImageReadFailed =>
      'ਚੁਣੇ ਗਏ ਚਿੱਤਰ ਨੂੰ ਪੜ੍ਹਨ ਵਿੱਚ ਅਸਫਲ';

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
      'ਇਹ ਆਈਟਮ ਤੋਂ ਮੌਜੂਦਾ ਚਿੱਤਰ ਨੂੰ ਹਟਾਉਂਦਾ ਹੈ।';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'ਅੱਪਲੋਡ ਕਰੋ';

  @override
  String get adminMetadataUpdate => 'ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get adminMetadataRemoteImage => 'ਰਿਮੋਟ ਚਿੱਤਰ';

  @override
  String get adminPluginsInstalled => 'ਸਥਾਪਿਤ ਕੀਤਾ';

  @override
  String get adminPluginsCatalog => 'ਕੈਟਾਲਾਗ';

  @override
  String get adminPluginsActive => 'ਕਿਰਿਆਸ਼ੀਲ';

  @override
  String get adminPluginsRestart => 'ਰੀਸਟਾਰਟ ਕਰੋ';

  @override
  String get adminPluginsNoSearchResults =>
      'ਕੋਈ ਪਲੱਗਇਨ ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ';

  @override
  String get adminPluginsNoneInstalled => 'ਕੋਈ ਪਲੱਗਇਨ ਸਥਾਪਤ ਨਹੀਂ ਹਨ';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'ਅੱਪਡੇਟ ਉਪਲਬਧ ਹੈ';

  @override
  String get adminPluginsPendingRemoval =>
      'ਮੁੜ-ਚਾਲੂ ਹੋਣ ਤੋਂ ਬਾਅਦ ਹਟਾਉਣਾ ਬਾਕੀ ਹੈ';

  @override
  String get adminPluginsChangesPending => 'ਬਕਾਇਆ ਮੁੜ-ਚਾਲੂ ਤਬਦੀਲੀਆਂ';

  @override
  String get adminPluginsEnable => 'ਯੋਗ ਕਰੋ';

  @override
  String get adminPluginsDisable => 'ਅਸਮਰੱਥ';

  @override
  String get adminPluginsInstallUpdate => 'ਅੱਪਡੇਟ ਸਥਾਪਤ ਕਰੋ';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ਕੋਈ ਪੈਕੇਜ ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ';

  @override
  String get adminPluginsCatalogEmpty => 'ਕੋਈ ਪੈਕੇਜ ਉਪਲਬਧ ਨਹੀਂ ਹਨ';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'ਪ੍ਰਯੋਗਾਤਮਕ ਏਕੀਕਰਣ';

  @override
  String get adminPluginDetailExperimentalContent =>
      'ਪਲੱਗਇਨ ਸੈਟਿੰਗਾਂ ਏਕੀਕਰਣ ਅਜੇ ਵੀ ਪ੍ਰਯੋਗਾਤਮਕ ਹੈ। ਹੋ ਸਕਦਾ ਹੈ ਕਿ ਕੁਝ ਖੇਤਰ ਜਾਂ ਲੇਆਉਟ ਅਜੇ ਸਹੀ ਢੰਗ ਨਾਲ ਰੈਂਡਰ ਨਾ ਹੋਣ।';

  @override
  String get adminPluginDetailToggle404 =>
      'ਪਲੱਗਇਨ ਨੂੰ ਟੌਗਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ। ਸਰਵਰ ਇਹ ਪਲੱਗਇਨ ਸੰਸਕਰਣ ਨਹੀਂ ਲੱਭ ਸਕਿਆ। ਪਲੱਗਇਨ ਨੂੰ ਤਾਜ਼ਾ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ, ਫਿਰ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get adminPluginDetailToggleDioError =>
      'ਪਲੱਗਇਨ ਨੂੰ ਟੌਗਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ। ਕਿਰਪਾ ਕਰਕੇ ਵੇਰਵਿਆਂ ਲਈ ਸਰਵਰ ਲੌਗਸ ਦੀ ਜਾਂਚ ਕਰੋ।';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'ਵੇਰਵੇ';

  @override
  String get adminPluginDetailDeveloper => 'ਵਿਕਾਸਕਾਰ';

  @override
  String get adminPluginDetailRepository => 'ਰਿਪੋਜ਼ਟਰੀ';

  @override
  String get adminPluginDetailBundled => 'ਬੰਡਲ ਕੀਤਾ';

  @override
  String get adminPluginDetailEnablePlugin => 'ਪਲੱਗਇਨ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminPluginDetailRestartRequired =>
      'ਤਬਦੀਲੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰਨ ਲਈ ਇੱਕ ਸਰਵਰ ਰੀਸਟਾਰਟ ਦੀ ਲੋੜ ਹੈ।';

  @override
  String get adminPluginDetailRemovalPending =>
      'ਇਸ ਪਲੱਗਇਨ ਨੂੰ ਸਰਵਰ ਰੀਸਟਾਰਟ ਕਰਨ ਤੋਂ ਬਾਅਦ ਹਟਾ ਦਿੱਤਾ ਜਾਵੇਗਾ।';

  @override
  String get adminPluginDetailMalfunctioned =>
      'ਇਹ ਪਲੱਗਇਨ ਖਰਾਬ ਹੋ ਗਈ ਹੈ ਅਤੇ ਹੋ ਸਕਦਾ ਹੈ ਕਿ ਸਹੀ ਢੰਗ ਨਾਲ ਕੰਮ ਨਾ ਕਰੇ।';

  @override
  String get adminPluginDetailNotSupported =>
      'ਇਹ ਪਲੱਗਇਨ ਮੌਜੂਦਾ ਸਰਵਰ ਸੰਸਕਰਣ ਦੁਆਰਾ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get adminPluginDetailSuperseded =>
      'ਇਸ ਪਲੱਗਇਨ ਨੂੰ ਇੱਕ ਨਵੇਂ ਸੰਸਕਰਣ ਦੁਆਰਾ ਬਦਲ ਦਿੱਤਾ ਗਿਆ ਹੈ।';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ਰਿਪੋਜ਼ਟਰੀ ਹਟਾਓ';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'ਹਟਾਓ';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'ਕੋਈ ਰਿਪੋਜ਼ਟਰੀਆਂ ਕੌਂਫਿਗਰ ਨਹੀਂ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminReposEmptySubtitle =>
      'ਉਪਲਬਧ ਪਲੱਗਇਨਾਂ ਨੂੰ ਬ੍ਰਾਊਜ਼ ਕਰਨ ਲਈ ਇੱਕ ਰਿਪੋਜ਼ਟਰੀ ਜੋੜੋ';

  @override
  String get adminReposUnnamed => '(ਬੇਨਾਮ)';

  @override
  String get adminReposEditTitle => 'ਰਿਪੋਜ਼ਟਰੀ ਦਾ ਸੰਪਾਦਨ ਕਰੋ';

  @override
  String get adminReposAddTitle => 'ਰਿਪੋਜ਼ਟਰੀ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminReposUrl => 'ਰਿਪੋਜ਼ਟਰੀ URL';

  @override
  String get adminReposNameHint => 'ਜਿਵੇਂ ਕਿ Jellyfin ਸਥਿਰ';

  @override
  String get adminPluginSettingsInvalidUrl => 'ਅਵੈਧ URL';

  @override
  String get adminGeneralSettingsTitle => 'ਆਮ ਸੈਟਿੰਗਾਂ';

  @override
  String get adminGeneralMetadataLanguage => 'ਤਰਜੀਹੀ ਮੈਟਾਡੇਟਾ ਭਾਸ਼ਾ';

  @override
  String get adminGeneralMetadataLanguageHint => 'ਜਿਵੇਂ ਕਿ en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'ਤਰਜੀਹੀ ਮੈਟਾਡੇਟਾ ਦੇਸ਼';

  @override
  String get adminGeneralMetadataCountryHint => 'ਜਿਵੇਂ ਕਿ US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'ਲਾਇਬ੍ਰੇਰੀ ਸਕੈਨ ਇਕਸਾਰਤਾ';

  @override
  String get adminGeneralImageEncodingLimit => 'ਸਮਾਨਾਂਤਰ ਚਿੱਤਰ ਏਨਕੋਡਿੰਗ ਸੀਮਾ';

  @override
  String get adminUnknownError => 'ਅਗਿਆਤ ਤਰੁੱਟੀ';

  @override
  String get adminBrowse => 'ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get adminCloseBrowser => 'ਬ੍ਰਾਊਜ਼ਰ ਬੰਦ ਕਰੋ';

  @override
  String get adminNetworkingTitle => 'ਨੈੱਟਵਰਕਿੰਗ';

  @override
  String get adminNetworkingRestartWarning =>
      'ਨੈੱਟਵਰਕਿੰਗ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਤਬਦੀਲੀਆਂ ਲਈ ਸਰਵਰ ਨੂੰ ਮੁੜ ਚਾਲੂ ਕਰਨ ਦੀ ਲੋੜ ਹੋ ਸਕਦੀ ਹੈ।';

  @override
  String get adminNetworkingRemoteAccess => 'ਰਿਮੋਟ ਪਹੁੰਚ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminNetworkingPorts => 'ਬੰਦਰਗਾਹਾਂ';

  @override
  String get adminNetworkingHttpPort => 'HTTP ਪੋਰਟ';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS ਪੋਰਟ';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminNetworkingLocalNetwork => 'ਸਥਾਨਕ ਨੈੱਟਵਰਕ';

  @override
  String get adminNetworkingLocalAddresses => 'ਸਥਾਨਕ ਨੈੱਟਵਰਕ ਪਤੇ';

  @override
  String get adminNetworkingAddressHint => 'ਜਿਵੇਂ ਕਿ 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'ਜਾਣੇ-ਪਛਾਣੇ ਪ੍ਰੌਕਸੀ';

  @override
  String get adminNetworkingProxyHint => 'ਜਿਵੇਂ ਕਿ 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'ਵ੍ਹਾਈਟਲਿਸਟ';

  @override
  String get adminNetworkingBlacklist => 'ਬਲੈਕਲਿਸਟ';

  @override
  String get adminNetworkingAddEntry => 'ਐਂਟਰੀ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminBrandingTitle => 'ਬ੍ਰਾਂਡਿੰਗ';

  @override
  String get adminBrandingLoginDisclaimer => 'ਲੌਗਇਨ ਬੇਦਾਅਵਾ';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'ਲੌਗਇਨ ਫਾਰਮ ਦੇ ਹੇਠਾਂ ਪ੍ਰਦਰਸ਼ਿਤ HTML';

  @override
  String get adminBrandingCustomCss => 'ਕਸਟਮ CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'ਵੈੱਬ ਇੰਟਰਫੇਸ \'ਤੇ ਕਸਟਮ CSS ਲਾਗੂ ਕੀਤਾ ਗਿਆ';

  @override
  String get adminBrandingEnableSplash => 'ਸਪਲੈਸ਼ ਸਕ੍ਰੀਨ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminPlaybackHwAccel => 'ਹਾਰਡਵੇਅਰ ਪ੍ਰਵੇਗ';

  @override
  String get adminPlaybackHwAccelLabel => 'ਹਾਰਡਵੇਅਰ ਪ੍ਰਵੇਗ';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'ਹਾਰਡਵੇਅਰ ਏਨਕੋਡਿੰਗ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'ਇਸ ਲਈ ਹਾਰਡਵੇਅਰ ਡੀਕੋਡਿੰਗ ਨੂੰ ਸਮਰੱਥ ਕਰੋ:';

  @override
  String get adminPlaybackEncoding => 'ਏਨਕੋਡਿੰਗ';

  @override
  String get adminPlaybackEncodingThreads => 'ਐਨਕੋਡਿੰਗ ਥ੍ਰੈੱਡਸ';

  @override
  String get adminPlaybackFallbackFont => 'ਫਾਲਬੈਕ ਫੌਂਟ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminPlaybackFallbackFontPath => 'ਫਾਲਬੈਕ ਫੌਂਟ ਮਾਰਗ';

  @override
  String get adminPlaybackStreaming => 'ਸਟ੍ਰੀਮਿੰਗ';

  @override
  String get adminResumeVideo => 'ਵੀਡੀਓ';

  @override
  String get adminResumeAudiobooks => 'ਆਡੀਓਬੁੱਕਸ';

  @override
  String get adminResumeMinAudiobookPct =>
      'ਨਿਊਨਤਮ ਆਡੀਓਬੁੱਕ ਰੈਜ਼ਿਊਮੇ ਪ੍ਰਤੀਸ਼ਤਤਾ';

  @override
  String get adminResumeMaxAudiobookPct =>
      'ਅਧਿਕਤਮ ਆਡੀਓਬੁੱਕ ਰੈਜ਼ਿਊਮੇ ਪ੍ਰਤੀਸ਼ਤਤਾ';

  @override
  String get adminStreamingBitrateLimit => 'ਰਿਮੋਟ ਕਲਾਇੰਟ ਬਿਟਰੇਟ ਸੀਮਾ (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'ਬੇਅੰਤ ਲਈ ਖਾਲੀ ਜਾਂ 0 ਛੱਡੋ';

  @override
  String get adminTrickplayHwAccel => 'ਹਾਰਡਵੇਅਰ ਪ੍ਰਵੇਗ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminTrickplayHwEncoding => 'ਹਾਰਡਵੇਅਰ ਏਨਕੋਡਿੰਗ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'ਸਿਰਫ਼ ਕੁੰਜੀ ਫ੍ਰੇਮ ਕੱਢਣ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'ਤੇਜ਼ ਪਰ ਘੱਟ ਸ਼ੁੱਧਤਾ';

  @override
  String get adminTrickplayNonBlocking => 'ਗੈਰ-ਬਲਾਕਿੰਗ';

  @override
  String get adminTrickplayBlocking => 'ਬਲਾਕਿੰਗ';

  @override
  String get adminTrickplayPriorityHigh => 'ਉੱਚ';

  @override
  String get adminTrickplayPriorityAboveNormal => 'ਆਮ ਤੋਂ ਉੱਪਰ';

  @override
  String get adminTrickplayPriorityNormal => 'ਸਧਾਰਣ';

  @override
  String get adminTrickplayPriorityBelowNormal => 'ਸਧਾਰਨ ਤੋਂ ਹੇਠਾਂ';

  @override
  String get adminTrickplayPriorityIdle => 'ਵਿਹਲਾ';

  @override
  String get adminTrickplayImageSettings => 'ਚਿੱਤਰ ਸੈਟਿੰਗਾਂ';

  @override
  String get adminTrickplayInterval => 'ਅੰਤਰਾਲ (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'ਫਰੇਮਾਂ ਨੂੰ ਕਿੰਨੀ ਵਾਰ ਕੈਪਚਰ ਕਰਨਾ ਹੈ';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'ਕਾਮੇ ਨਾਲ ਵੱਖ ਕੀਤੇ ਪਿਕਸਲ ਚੌੜਾਈ (ਉਦਾਹਰਨ ਲਈ 320)';

  @override
  String get adminTrickplayQuality => 'ਗੁਣਵੱਤਾ';

  @override
  String get adminTrickplayQScale => 'ਗੁਣਵੱਤਾ ਦਾ ਪੈਮਾਨਾ';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'ਹੇਠਲੇ ਮੁੱਲ = ਬਿਹਤਰ ਗੁਣਵੱਤਾ, ਵੱਡੀਆਂ ਫਾਈਲਾਂ';

  @override
  String get adminTrickplayJpegQuality => 'JPEG ਗੁਣਵੱਤਾ';

  @override
  String get adminTrickplayProcessing => 'ਪ੍ਰੋਸੈਸਿੰਗ';

  @override
  String get adminTasksEmpty => 'ਕੋਈ ਨਿਯਤ ਕਾਰਜ ਨਹੀਂ ਮਿਲੇ';

  @override
  String get adminTasksNoFilterMatch =>
      'ਕੋਈ ਵੀ ਕਾਰਜ ਮੌਜੂਦਾ ਫਿਲਟਰ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ';

  @override
  String get adminTaskCancelling => 'ਰੱਦ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get adminTaskRunning => 'ਚੱਲ ਰਿਹਾ ਹੈ...';

  @override
  String get adminTaskNeverRun => 'ਕਦੇ ਨਾ ਦੌੜੋ';

  @override
  String get adminTaskStop => 'ਰੂਕੋ';

  @override
  String get adminTaskRun => 'ਚਲਾਓ';

  @override
  String get adminTaskDetailLastExecution => 'ਆਖਰੀ ਐਗਜ਼ੀਕਿਊਸ਼ਨ';

  @override
  String get adminTaskDetailStarted => 'ਸ਼ੁਰੂ ਕੀਤਾ';

  @override
  String get adminTaskDetailEnded => 'ਖਤਮ ਹੋ ਗਿਆ';

  @override
  String get adminTaskDetailDuration => 'ਮਿਆਦ';

  @override
  String get adminTaskDetailErrorLabel => 'ਗਲਤੀ:';

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
  String get adminTaskTriggerStartup => 'ਐਪਲੀਕੇਸ਼ਨ ਸ਼ੁਰੂ ਹੋਣ \'ਤੇ';

  @override
  String get adminTaskTriggerTypeDaily => 'ਰੋਜ਼ਾਨਾ';

  @override
  String get adminTaskTriggerTypeWeekly => 'ਹਫਤਾਵਾਰੀ';

  @override
  String get adminTaskTriggerTypeInterval => 'ਇੱਕ ਅੰਤਰਾਲ \'ਤੇ';

  @override
  String get adminTaskTriggerIntervalLabel => 'ਅੰਤਰਾਲ';

  @override
  String get adminTaskTriggerEveryHour => 'ਹਰ ਘੰਟੇ';

  @override
  String get adminTaskTriggerEvery6Hours => 'ਹਰ 6 ਘੰਟੇ';

  @override
  String get adminTaskTriggerEvery12Hours => 'ਹਰ 12 ਘੰਟੇ';

  @override
  String get adminTaskTriggerEvery24Hours => 'ਹਰ 24 ਘੰਟੇ';

  @override
  String get adminTaskTriggerEvery2Days => 'ਹਰ 2 ਦਿਨਾਂ ਬਾਅਦ';

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
  String get adminTaskTriggerTime => 'ਸਮਾਂ';

  @override
  String get adminTaskTriggerNoLimit => 'ਕੋਈ ਸੀਮਾ ਨਹੀਂ';

  @override
  String get adminActivityJustNow => 'ਹੁਣੇ';

  @override
  String get adminActivityLastHour => 'ਪਿਛਲੇ ਘੰਟੇ';

  @override
  String get adminActivityToday => 'ਅੱਜ';

  @override
  String get adminActivityYesterday => 'ਕੱਲ੍ਹ';

  @override
  String get adminActivityOlder => 'ਪੁਰਾਣੀ';

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
  String get adminActivityNow => 'ਹੁਣ';

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
      'ਪੂਰਵਦਰਸ਼ਨ ਥੰਬਨੇਲ ਦੀ ਭਾਲ ਲਈ ਟ੍ਰਿਕਪਲੇ ਚਿੱਤਰ ਜਨਰੇਸ਼ਨ ਨੂੰ ਕੌਂਫਿਗਰ ਕਰੋ।';

  @override
  String get adminNetworkingPublicHttpsPort => 'ਜਨਤਕ HTTPS ਪੋਰਟ';

  @override
  String get adminNetworkingBaseUrl => 'ਬੇਸ URL';

  @override
  String get adminNetworkingBaseUrlHint => 'ਜਿਵੇਂ ਕਿ /ਜੈਲੀਫਿਨ';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'ਸਰਟੀਫਿਕੇਟ ਮਾਰਗ';

  @override
  String get adminNetworkingRemoteIpFilter => 'ਰਿਮੋਟ IP ਫਿਲਟਰ';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'ਰਿਮੋਟ IP ਫਿਲਟਰ';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API ਡਿਵਾਈਸ';

  @override
  String get adminPlaybackAutomatic => '0 = ਆਟੋਮੈਟਿਕ';

  @override
  String get adminPlaybackTranscodeTempPath => 'ਟ੍ਰਾਂਸਕੋਡਿੰਗ ਤਾਪਮਾਨ ਮਾਰਗ';

  @override
  String get adminPlaybackSegmentDeletion => 'ਖੰਡ ਨੂੰ ਮਿਟਾਉਣ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminPlaybackSegmentKeep => 'ਖੰਡ ਰੱਖੋ (ਸਕਿੰਟ)';

  @override
  String get adminPlaybackThrottleBuffering => 'ਥ੍ਰੋਟਲ ਬਫਰਿੰਗ';

  @override
  String get adminResumeMinPct => 'ਘੱਟੋ-ਘੱਟ ਰੈਜ਼ਿਊਮੇ ਪ੍ਰਤੀਸ਼ਤ';

  @override
  String get adminResumeMinPctSubtitle =>
      'ਪ੍ਰਗਤੀ ਨੂੰ ਬਚਾਉਣ ਲਈ ਸਮੱਗਰੀ ਨੂੰ ਇਸ ਪ੍ਰਤੀਸ਼ਤ ਤੋਂ ਅੱਗੇ ਚਲਾਇਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String get adminResumeMaxPct => 'ਅਧਿਕਤਮ ਰੈਜ਼ਿਊਮੇ ਪ੍ਰਤੀਸ਼ਤ';

  @override
  String get adminResumeMaxPctSubtitle =>
      'ਸਮੱਗਰੀ ਨੂੰ ਇਸ ਪ੍ਰਤੀਸ਼ਤ ਤੋਂ ਬਾਅਦ ਪੂਰੀ ਤਰ੍ਹਾਂ ਚਲਾਇਆ ਗਿਆ ਮੰਨਿਆ ਜਾਂਦਾ ਹੈ';

  @override
  String get adminResumeMinDuration => 'ਘੱਟੋ-ਘੱਟ ਰੈਜ਼ਿਊਮੇ ਦੀ ਮਿਆਦ (ਸਕਿੰਟ)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'ਇਸ ਤੋਂ ਛੋਟੀਆਂ ਆਈਟਮਾਂ ਮੁੜ ਸ਼ੁਰੂ ਕਰਨ ਯੋਗ ਨਹੀਂ ਹਨ';

  @override
  String get adminTrickplayScanBehavior => 'ਸਕੈਨ ਵਿਵਹਾਰ';

  @override
  String get adminTrickplayProcessPriority => 'ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਤਰਜੀਹ';

  @override
  String get adminTrickplayTileWidth => 'ਟਾਇਲ ਦੀ ਚੌੜਾਈ';

  @override
  String get adminTrickplayTileHeight => 'ਟਾਇਲ ਦੀ ਉਚਾਈ';

  @override
  String get adminTrickplayProcessThreads => 'ਪ੍ਰਕਿਰਿਆ ਥ੍ਰੈਡਸ';

  @override
  String get adminTrickplayWidthResolutions => 'ਚੌੜਾਈ ਰੈਜ਼ੋਲੂਸ਼ਨ';

  @override
  String get adminMetadataDefault => 'ਡਿਫਾਲਟ';

  @override
  String get adminMetadataContentTypeUpdated => 'ਸਮੱਗਰੀ ਦੀ ਕਿਸਮ ਅੱਪਡੇਟ ਕੀਤੀ ਗਈ';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'ਹੌਲੀ ਜਵਾਬ ਸੀਮਾ (ms)';

  @override
  String get adminGeneralCachePath => 'ਕੈਸ਼ ਮਾਰਗ';

  @override
  String get adminGeneralMetadataPath => 'ਮੈਟਾਡੇਟਾ ਮਾਰਗ';

  @override
  String get adminGeneralServerName => 'ਸਰਵਰ ਦਾ ਨਾਮ';

  @override
  String get adminSettingsLoadFailed => 'ਸੈਟਿੰਗਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminDiscover => 'ਖੋਜੋ';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'ਫੋਲਡਰ';

  @override
  String get libraries => 'ਲਾਇਬ੍ਰੇਰੀਆਂ';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay ਅਯੋਗ ਹੈ';

  @override
  String get syncPlayDisabledMessage =>
      'ਸਮਕਾਲੀ ਪਲੇਬੈਕ ਦੀ ਵਰਤੋਂ ਕਰਨ ਲਈ ਸੈਟਿੰਗਾਂ ਵਿੱਚ SyncPlay ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ।';

  @override
  String get syncPlayServerUnsupportedTitle => 'ਸਰਵਰ ਅਸਮਰਥਿਤ ਹੈ';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay ਨੂੰ ਇੱਕ Jellyfin ਸਰਵਰ ਦੀ ਲੋੜ ਹੈ। ਮੌਜੂਦਾ ਸਰਵਰ ਇਸਦਾ ਸਮਰਥਨ ਨਹੀਂ ਕਰਦਾ ਹੈ।';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay ਸਮੂਹ';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay ਸਮੂਹ';

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
  String get syncPlayIgnoreWait => 'ਉਡੀਕ ਨੂੰ ਅਣਡਿੱਠ ਕਰੋ';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'ਜਦੋਂ ਇਹ ਡਿਵਾਈਸ ਬਫਰ ਹੁੰਦੀ ਹੈ ਤਾਂ ਸਮੂਹ ਨੂੰ ਨਾ ਫੜੋ';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'ਹੌਲੀ ਮੈਂਬਰਾਂ ਦੀ ਉਡੀਕ ਕੀਤੇ ਬਿਨਾਂ ਸਥਾਨਕ ਤੌਰ \'ਤੇ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get syncPlayRepeat => 'ਦੁਹਰਾਓ';

  @override
  String get syncPlayRepeatOne => 'ਇੱਕ';

  @override
  String get syncPlayShuffleModeShuffled => 'ਸ਼ਫਲ ਕੀਤਾ';

  @override
  String get syncPlayShuffleModeSorted => 'ਕ੍ਰਮਬੱਧ';

  @override
  String get syncPlaySyncCurrentQueue => 'ਮੌਜੂਦਾ ਪਲੇਬੈਕ ਕਤਾਰ ਨੂੰ ਸਿੰਕ ਕਰੋ';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'ਸਮੂਹ ਕਤਾਰ ਨੂੰ ਉਸ ਨਾਲ ਬਦਲੋ ਜੋ ਸਥਾਨਕ ਤੌਰ \'ਤੇ ਚੱਲ ਰਿਹਾ ਹੈ';

  @override
  String get syncPlayLeaveGroup => 'ਗਰੁੱਪ ਛੱਡੋ';

  @override
  String get syncPlayGroupQueue => 'ਸਮੂਹ ਕਤਾਰ';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'ਹੁਣੇ ਚਲਾਓ';

  @override
  String get syncPlayCreateNewGroup => 'ਇੱਕ ਨਵਾਂ ਸਮੂਹ ਬਣਾਓ';

  @override
  String get syncPlayGroupName => 'ਸਮੂਹ ਦਾ ਨਾਮ';

  @override
  String get syncPlayDefaultGroupName => 'ਮੇਰਾ SyncPlay ਸਮੂਹ';

  @override
  String get syncPlayCreateGroup => 'ਗਰੁੱਪ ਬਣਾਓ';

  @override
  String get syncPlayAvailableGroups => 'ਉਪਲਬਧ ਸਮੂਹ';

  @override
  String get syncPlayNoGroupsAvailable => 'ਕੋਈ ਸਮੂਹ ਉਪਲਬਧ ਨਹੀਂ ਹਨ';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay ਸਮੂਹ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ?';

  @override
  String get syncPlayJoinGroupWarning =>
      'ਇੱਕ SyncPlay ਸਮੂਹ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਣਾ ਤੁਹਾਡੀ ਮੌਜੂਦਾ ਪਲੇਬੈਕ ਕਤਾਰ ਨੂੰ ਬਦਲ ਸਕਦਾ ਹੈ। ਜਾਰੀ ਰੱਖਣਾ ਹੈ?';

  @override
  String get syncPlayJoin => 'ਸ਼ਾਮਲ ਹੋਵੋ';

  @override
  String get syncPlayStateIdle => 'ਵਿਹਲਾ';

  @override
  String get syncPlayStateWaiting => 'ਉਡੀਕ ਕਰ ਰਿਹਾ ਹੈ';

  @override
  String get syncPlayStatePaused => 'ਰੋਕਿਆ ਗਿਆ';

  @override
  String get syncPlayStatePlaying => 'ਖੇਡ ਰਿਹਾ ਹੈ';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay ਪਹੁੰਚ ਅਸਵੀਕਾਰ ਕੀਤੀ ਗਈ';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ਤੁਹਾਡੇ ਕੋਲ ਇਸ SyncPlay ਸਮੂਹ ਵਿੱਚ ਇੱਕ ਜਾਂ ਵੱਧ ਆਈਟਮਾਂ ਤੱਕ ਪਹੁੰਚ ਨਹੀਂ ਹੈ। ਗਰੁੱਪ ਮਾਲਕ ਨੂੰ ਲਾਇਬ੍ਰੇਰੀ ਅਨੁਮਤੀਆਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨ ਲਈ ਕਹੋ ਜਾਂ ਕੋਈ ਵੱਖਰੀ ਕਤਾਰ ਚੁਣੋ।';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'ਵੌਇਸ ਖੋਜ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision ਡਾਇਰੈਕਟ ਪਲੇ ਅਸਫਲ';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'ਇਸ Dolby Vision ਸਟ੍ਰੀਮ ਲਈ ਡਾਇਰੈਕਟ ਪਲੇ ਸ਼ੁਰੂ ਕਰਨ ਵਿੱਚ ਅਸਫਲ ਰਿਹਾ। ਕੀ ਸਰਵਰ ਟ੍ਰਾਂਸਕੋਡ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰਨੀ ਹੈ?';

  @override
  String get retryWithTranscode => 'ਟ੍ਰਾਂਸਕੋਡ ਨਾਲ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'ਇਹ ਡਿਵਾਈਸ Dolby Vision ਸਮੱਗਰੀ ਨੂੰ ਸਿੱਧਾ ਡੀਕੋਡ ਨਹੀਂ ਕਰ ਸਕਦੀ। HDR10 ਫਾਲਬੈਕ ਦੀ ਵਰਤੋਂ ਕਰੋ ਜਾਂ ਸਰਵਰ ਟ੍ਰਾਂਸਕੋਡਿੰਗ ਦੀ ਬੇਨਤੀ ਕਰੋ।';

  @override
  String get rememberMyChoice => 'ਮੇਰੀ ਪਸੰਦ ਨੂੰ ਯਾਦ ਰੱਖੋ';

  @override
  String get playHdr10Fallback => 'HDR10 ਫਾਲਬੈਕ ਚਲਾਓ';

  @override
  String get requestTranscode => 'ਟ੍ਰਾਂਸਕੋਡ ਦੀ ਬੇਨਤੀ ਕਰੋ';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'IAmParadox27 ਦੇ \"ਹੋਮ ਸਕ੍ਰੀਨ ਸੈਕਸ਼ਨ\" ਪਲੱਗਇਨ ਦੁਆਰਾ ਉਜਾਗਰ ਕੀਤੀਆਂ ਕਤਾਰਾਂ ਦਾ ਪਤਾ ਲਗਾਓ। ਕਤਾਰਾਂ ਨੂੰ ਯੋਗ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ ਅਤੇ ਹੇਠਾਂ ਮੁੜ ਕ੍ਰਮਬੱਧ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'ਕੋਈ Jellyfin ਸਰਵਰ ਅਜੇ ਪਲੱਗਇਨ ਦੀ ਰਿਪੋਰਟ ਕਰ ਰਹੇ ਹਨ।';

  @override
  String get kefinTweaksIntegrationDescription =>
      'ranaldsgift ਦੇ \"KefinTweaks\" ਪਲੱਗਇਨ ਰਾਹੀਂ ਸੰਰਚਿਤ ਕੀਤੀਆਂ ਕਤਾਰਾਂ ਦਾ ਪਤਾ ਲਗਾਓ। ਕਸਟਮ ਸੈਕਸ਼ਨ, ਹਾਲ ਹੀ ਵਿੱਚ ਜਾਰੀ ਕੀਤੇ ਗਏ, ਦੁਬਾਰਾ ਦੇਖੋ, ਮੌਸਮੀ, ਅਤੇ ਹਾਲ ਹੀ ਵਿੱਚ ਲਾਇਬ੍ਰੇਰੀ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤੇ ਗਏ, ਹਰੇਕ Jellyfin ਸਰਵਰ \'ਤੇ KefinTweaks ਸੰਰਚਨਾ ਤੋਂ ਪ੍ਰਤੀਬਿੰਬ ਕੀਤੇ ਗਏ ਹਨ।';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'ਅਜੇ ਤੱਕ ਕੋਈ Jellyfin ਸਰਵਰ KefinTweaks ਦੀ ਰਿਪੋਰਟ ਨਹੀਂ ਕਰ ਰਹੇ ਹਨ।';

  @override
  String get integrationOpenHomeSections => 'ਹੋਮ ਸੈਕਸ਼ਨ ਖੋਲ੍ਹੋ';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'ਕਤਾਰਾਂ ਨੂੰ ਸਮਰੱਥ, ਅਯੋਗ ਅਤੇ ਮੁੜ ਕ੍ਰਮਬੱਧ ਕਰੋ';

  @override
  String get integrationInstalledButDisabled => 'ਇੰਸਟੌਲ ਕੀਤਾ ਪਰ ਅਸਮਰੱਥ';

  @override
  String get integrationNotInstalled => 'ਇੰਸਟਾਲ ਨਹੀਂ ਹੈ';

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
  String get seeAll => 'ਸਭ ਦੇਖੋ';

  @override
  String get noItems => 'ਕੋਈ ਆਈਟਮਾਂ ਨਹੀਂ';

  @override
  String get switchUser => 'ਯੂਜ਼ਰ ਬਦਲੋ';

  @override
  String get remoteControl => 'ਰਿਮੋਟ ਕੰਟਰੋਲ';

  @override
  String get mediaBarLoading => 'ਮੀਡੀਆ ਪੱਟੀ ਨੂੰ ਲੋਡ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get mediaBarError => 'ਮੀਡੀਆ ਪੱਟੀ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ ਰਹੀ';

  @override
  String get offlineServerUnavailable =>
      'ਇੰਟਰਨੈੱਟ ਨਾਲ ਕਨੈਕਟ ਕੀਤਾ ਗਿਆ ਹੈ, ਪਰ ਮੌਜੂਦਾ ਸਰਵਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get offlineNoInternet =>
      'ਤੁਸੀਂ ਔਫਲਾਈਨ ਹੋ। ਸਿਰਫ਼ ਡਾਊਨਲੋਡ ਕੀਤੀ ਸਮੱਗਰੀ ਉਪਲਬਧ ਹੈ।';

  @override
  String get offlineFileNotAvailable => 'ਫ਼ਾਈਲ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String get offlineSwitchServer => 'ਸਰਵਰ ਬਦਲੋ';

  @override
  String get offlineSavedMedia => 'ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਮੀਡੀਆ';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'ਰਿਮੋਟ ਪਲੇਬੈਕ';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'ਡਿਵਾਈਸ ਵਾਲੀਅਮ';

  @override
  String get castVolumeUnavailable => 'ਅਣਉਪਲਬਧ';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'ਆਡੀਓ';

  @override
  String get subtitlesLabel => 'ਉਪਸਿਰਲੇਖ';

  @override
  String get pinConfirmTitle => 'ਪਿੰਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get pinSetTitle => 'ਪਿੰਨ ਸੈੱਟ ਕਰੋ';

  @override
  String get pinEnterTitle => 'ਪਿੰਨ ਦਾਖਲ ਕਰੋ';

  @override
  String get pinReenterToConfirm => 'ਪੁਸ਼ਟੀ ਕਰਨ ਲਈ ਆਪਣਾ ਪਿੰਨ ਦੁਬਾਰਾ ਦਾਖਲ ਕਰੋ';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'ਗਲਤ ਪਿੰਨ';

  @override
  String get pinMismatch => 'ਪਿੰਨ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String get pinForgot => 'ਪਿੰਨ ਭੁੱਲ ਗਏ ਹੋ?';

  @override
  String get pinClear => 'ਸਾਫ਼';

  @override
  String get pinBackspace => 'ਬੈਕਸਪੇਸ';

  @override
  String get quickConnectAuthorized =>
      'ਤਤਕਾਲ ਕਨੈਕਟ ਦੀ ਬੇਨਤੀ ਨੂੰ ਅਧਿਕਾਰਤ ਕੀਤਾ ਗਿਆ ਹੈ।';

  @override
  String get quickConnectInvalidOrExpired =>
      'ਤਤਕਾਲ ਕਨੈਕਟ ਕੋਡ ਅਵੈਧ ਜਾਂ ਮਿਆਦ ਪੁੱਗ ਗਿਆ ਹੈ।';

  @override
  String get quickConnectNotSupported =>
      'ਇਸ ਸਰਵਰ \'ਤੇ ਤੇਜ਼ ਕਨੈਕਟ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get quickConnectAuthorizeFailed =>
      'ਤਤਕਾਲ ਕਨੈਕਟ ਕੋਡ ਨੂੰ ਅਧਿਕਾਰਤ ਕਰਨ ਵਿੱਚ ਅਸਫਲ।';

  @override
  String get quickConnectDisabled =>
      'ਇਸ ਸਰਵਰ \'ਤੇ ਤੇਜ਼ ਕਨੈਕਟ ਨੂੰ ਅਯੋਗ ਬਣਾਇਆ ਗਿਆ ਹੈ।';

  @override
  String get quickConnectForbidden =>
      'ਤੁਹਾਡਾ ਖਾਤਾ ਇਸ ਕਵਿੱਕ ਕਨੈਕਟ ਬੇਨਤੀ ਨੂੰ ਅਧਿਕਾਰਤ ਨਹੀਂ ਕਰ ਸਕਦਾ ਹੈ।';

  @override
  String get quickConnectNotFound =>
      'ਤਤਕਾਲ ਕਨੈਕਟ ਕੋਡ ਨਹੀਂ ਮਿਲਿਆ। ਇੱਕ ਨਵਾਂ ਕੋਡ ਅਜ਼ਮਾਓ।';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get quickConnectAuthorize => 'ਅਧਿਕਾਰਤ ਕਰੋ';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'ਰਿਮੋਟ ਕੰਟਰੋਲ';

  @override
  String get remoteFailedToLoadSessions => 'ਸੈਸ਼ਨਾਂ ਨੂੰ ਲੋਡ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get remoteNoSessions => 'ਕੋਈ ਨਿਯੰਤਰਣਯੋਗ ਸੈਸ਼ਨ ਨਹੀਂ ਹਨ';

  @override
  String get remoteStartPlayback => 'ਕਿਸੇ ਹੋਰ ਡਿਵਾਈਸ \'ਤੇ ਪਲੇਬੈਕ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get unknownUser => 'ਅਗਿਆਤ';

  @override
  String get unknownItem => 'ਅਗਿਆਤ';

  @override
  String get remoteNothingPlaying => 'ਇਸ ਸੈਸ਼ਨ \'ਤੇ ਕੁਝ ਨਹੀਂ ਚੱਲ ਰਿਹਾ';

  @override
  String get castingStarted => 'ਚੁਣੀ ਗਈ ਡਿਵਾਈਸ \'ਤੇ ਕਾਸਟ ਕਰਨਾ ਸ਼ੁਰੂ ਹੋਇਆ';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'ਕੋਈ ਰਿਮੋਟ ਪਲੇਬੈਕ ਡਿਵਾਈਸ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get noRemoteDevicesIos =>
      'ਕੋਈ ਰਿਮੋਟ ਪਲੇਬੈਕ ਡਿਵਾਈਸ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।\n\niOS \'ਤੇ, AirPlay ਟੀਚੇ ਸਿਮੂਲੇਟਰ ਵਿੱਚ ਅਣਉਪਲਬਧ ਹੋ ਸਕਦੇ ਹਨ।';

  @override
  String get trackActionPlayNext => 'ਅੱਗੇ ਚਲਾਓ';

  @override
  String get trackActionAddToQueue => 'ਕਤਾਰ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get trackActionAddToPlaylist => 'ਪਲੇਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get trackActionCancelDownload => 'ਡਾਊਨਲੋਡ ਰੱਦ ਕਰੋ';

  @override
  String get trackActionDeleteFromPlaylist => 'ਪਲੇਲਿਸਟ ਤੋਂ ਮਿਟਾਓ';

  @override
  String get trackActionMoveUp => 'ਉੱਪਰ ਜਾਓ';

  @override
  String get trackActionMoveDown => 'ਹੇਠਾਂ ਜਾਓ';

  @override
  String get trackActionRemoveFromFavorites => 'ਮਨਪਸੰਦ ਵਿੱਚੋਂ ਹਟਾਓ';

  @override
  String get trackActionAddToFavorites => 'ਮਨਪਸੰਦ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get trackActionGoToAlbum => 'ਐਲਬਮ \'ਤੇ ਜਾਓ';

  @override
  String get trackActionGoToArtist => 'ਕਲਾਕਾਰ \'ਤੇ ਜਾਓ';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'ਡਾਊਨਲੋਡ ਕੀਤੀ ਫ਼ਾਈਲ ਨੂੰ ਮਿਟਾਇਆ ਗਿਆ';

  @override
  String get trackActionDeleteFileFailed =>
      'ਡਾਊਨਲੋਡ ਕੀਤੀ ਫ਼ਾਈਲ ਨੂੰ ਮਿਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ';

  @override
  String get shuffleBy => 'ਦੁਆਰਾ ਸ਼ਫਲ ਕਰੋ';

  @override
  String get shuffleSelectLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਚੁਣੋ';

  @override
  String get shuffleSelectGenre => 'ਸ਼ੈਲੀ ਚੁਣੋ';

  @override
  String get shuffleLibrary => 'ਲਾਇਬ੍ਰੇਰੀ';

  @override
  String get shuffleGenre => 'ਸ਼ੈਲੀ';

  @override
  String get shuffleNoLibraries => 'ਕੋਈ ਅਨੁਕੂਲ ਲਾਇਬ੍ਰੇਰੀਆਂ ਉਪਲਬਧ ਨਹੀਂ ਹਨ।';

  @override
  String get shuffleNoGenres => 'ਇਸ ਸ਼ਫਲ ਮੋਡ ਲਈ ਕੋਈ ਸ਼ੈਲੀਆਂ ਨਹੀਂ ਲੱਭੀਆਂ।';

  @override
  String get posterDisplayTitle => 'ਡਿਸਪਲੇ';

  @override
  String get posterImageType => 'ਚਿੱਤਰ ਦੀ ਕਿਸਮ';

  @override
  String get imageTypePoster => 'ਪੋਸਟਰ';

  @override
  String get imageTypeThumbnail => 'ਥੰਬਨੇਲ';

  @override
  String get imageTypeBanner => 'ਬੈਨਰ';

  @override
  String get playlistAddFailed => 'ਪਲੇਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get playlistCreateFailed => 'ਪਲੇਲਿਸਟ ਬਣਾਉਣ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get playlistNew => 'ਨਵੀਂ ਪਲੇਲਿਸਟ';

  @override
  String get playlistCreate => 'ਬਣਾਓ';

  @override
  String get playlistCreateNew => 'ਨਵੀਂ ਪਲੇਲਿਸਟ ਬਣਾਓ';

  @override
  String get playlistNoneFound => 'ਕੋਈ ਪਲੇਲਿਸਟ ਨਹੀਂ ਮਿਲੀ';

  @override
  String get addToPlaylist => 'ਪਲੇਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get lyricsNotAvailable => 'ਕੋਈ ਬੋਲ ਉਪਲਬਧ ਨਹੀਂ ਹਨ';

  @override
  String get upNext => 'ਅੱਗੇ';

  @override
  String get playNext => 'ਅੱਗੇ ਚਲਾਓ';

  @override
  String get stillWatchingContent =>
      'ਪਲੇਬੈਕ ਨੂੰ ਰੋਕਿਆ ਗਿਆ ਹੈ। ਕੀ ਤੁਸੀਂ ਅਜੇ ਵੀ ਦੇਖ ਰਹੇ ਹੋ?';

  @override
  String get stillWatchingStop => 'ਰੂਕੋ';

  @override
  String get stillWatchingContinue => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'ਲਾਈਵ ਟੀ.ਵੀ';

  @override
  String get continueWatchingAndNextUp => 'ਦੇਖਣਾ ਜਾਰੀ ਰੱਖੋ ਅਤੇ ਅੱਗੇ ਵਧੋ';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'ਅਗਲਾ ਐਪੀਸੋਡ';

  @override
  String get moreFromThisSeason => 'ਇਸ ਸੀਜ਼ਨ ਤੋਂ ਹੋਰ';

  @override
  String get playerTooltipPlaybackSpeed => 'ਪਲੇਬੈਕ ਗਤੀ';

  @override
  String get playerTooltipCastControls => 'ਕਾਸਟ ਕੰਟਰੋਲ';

  @override
  String get playerTooltipPlaybackQuality => 'ਬਿੱਟਰੇਟ';

  @override
  String get playerTooltipEnterFullscreen => 'ਪੂਰੀ ਸਕ੍ਰੀਨ ਵਿੱਚ ਦਾਖਲ ਹੋਵੋ';

  @override
  String get playerTooltipExitFullscreen => 'ਪੂਰੀ ਸਕ੍ਰੀਨ ਤੋਂ ਬਾਹਰ ਜਾਓ';

  @override
  String get playerTooltipFloatOnTop => 'ਸਿਖਰ \'ਤੇ ਫਲੋਟ';

  @override
  String get playerTooltipExitFloatOnTop => 'ਸਿਖਰ \'ਤੇ ਫਲੋਟ ਨੂੰ ਅਸਮਰੱਥ ਕਰੋ';

  @override
  String get playerTooltipLockLandscape => 'ਲੈਂਡਸਕੇਪ ਨੂੰ ਲਾਕ ਕਰੋ';

  @override
  String get playerTooltipUnlockOrientation => 'ਰੋਟੇਸ਼ਨ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get playerTooltipPrevious => 'ਪਿਛਲਾ';

  @override
  String get playerTooltipSeekBack => 'ਵਾਪਸ ਭਾਲੋ';

  @override
  String get playerTooltipSeekForward => 'ਅੱਗੇ ਭਾਲੋ';

  @override
  String get contextMenuMarkWatched => 'ਦੇਖੇ ਗਏ ਵਜੋਂ ਨਿਸ਼ਾਨਦੇਹੀ ਕਰੋ';

  @override
  String get contextMenuMarkUnwatched => 'ਅਣਦੇਖੇ ਵਜੋਂ ਨਿਸ਼ਾਨਦੇਹੀ ਕਰੋ';

  @override
  String get contextMenuAddToFavorites => 'ਮਨਪਸੰਦ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get contextMenuRemoveFromFavorites => 'ਮਨਪਸੰਦ ਵਿੱਚੋਂ ਹਟਾਓ';

  @override
  String get contextMenuGoToSeries => 'ਸੀਰੀਜ਼ \'ਤੇ ਜਾਓ';

  @override
  String get settingsAdministrationSubtitle => 'ਸਰਵਰ ਪ੍ਰਸ਼ਾਸਨ ਪੈਨਲ ਤੱਕ ਪਹੁੰਚ';

  @override
  String get settingsAccountSecurity => 'ਖਾਤਾ ਅਤੇ ਸੁਰੱਖਿਆ';

  @override
  String get settingsAccountSecuritySubtitle =>
      'ਪ੍ਰਮਾਣੀਕਰਨ, ਪਿੰਨ ਕੋਡ, ਅਤੇ ਮਾਪਿਆਂ ਦੇ ਨਿਯੰਤਰਣ';

  @override
  String get settingsPersonalization => 'ਵਿਅਕਤੀਗਤਕਰਨ';

  @override
  String get settingsPersonalizationSubtitle =>
      'ਥੀਮ, ਨੈਵੀਗੇਸ਼ਨ, ਘਰੇਲੂ ਕਤਾਰਾਂ, ਅਤੇ ਲਾਇਬ੍ਰੇਰੀ ਦਿੱਖ';

  @override
  String get settingsDynamicContent => 'ਗਤੀਸ਼ੀਲ ਸਮੱਗਰੀ';

  @override
  String get settingsDynamicContentSubtitle => 'ਮੀਡੀਆ ਬਾਰ ਅਤੇ ਵਿਜ਼ੂਅਲ ਓਵਰਲੇਅ';

  @override
  String get settingsPlaybackSyncplay => 'ਪਲੇਬੈਕ ਅਤੇ SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'ਆਡੀਓ/ਵੀਡੀਓ ਸੈਟਿੰਗਾਂ, ਉਪਸਿਰਲੇਖ, ਡਾਊਨਲੋਡ, ਅਤੇ SyncPlay ਨਿਯੰਤਰਣ';

  @override
  String get settingsIntegrationsSubtitle =>
      'ਪਲੱਗਇਨ ਸਿੰਕ, ਸੀਰਰ, ਰੇਟਿੰਗ, ਅਤੇ ਹੋਰ';

  @override
  String get settingsAboutSubtitle => 'ਐਪ ਸੰਸਕਰਣ, ਕਾਨੂੰਨੀ ਜਾਣਕਾਰੀ ਅਤੇ ਕ੍ਰੈਡਿਟ';

  @override
  String get settingsAuthenticationSection => 'ਪ੍ਰਮਾਣਿਕਤਾ';

  @override
  String get settingsSortServersBy => 'ਸਰਵਰ ਦੁਆਰਾ ਛਾਂਟੋ';

  @override
  String get settingsLastUsed => 'ਆਖਰੀ ਵਾਰ ਵਰਤਿਆ ਗਿਆ';

  @override
  String get settingsAlphabetical => 'ਵਰਣਮਾਲਾ';

  @override
  String get settingsPrivacyAndSafetySection => 'ਗੋਪਨੀਯਤਾ ਅਤੇ ਸੁਰੱਖਿਆ';

  @override
  String get settingsBlockedRatings => 'ਬਲੌਕ ਕੀਤੀਆਂ ਰੇਟਿੰਗਾਂ';

  @override
  String get settingsGeneralStyle => 'ਆਮ ਸ਼ੈਲੀ';

  @override
  String get settingsGeneralStyleSubtitle =>
      'ਥੀਮ ਲਹਿਜ਼ੇ, ਬੈਕਡ੍ਰੌਪਸ, ਦੇਖੇ ਗਏ ਸੂਚਕਾਂ, ਅਤੇ ਥੀਮ ਸੰਗੀਤ';

  @override
  String get settingsHomePage => 'ਮੁੱਖ ਪੰਨਾ';

  @override
  String get settingsHomePageSubtitle =>
      'ਸੈਕਸ਼ਨ, ਚਿੱਤਰ ਕਿਸਮ, ਓਵਰਲੇਅ ਅਤੇ ਮੀਡੀਆ ਪੂਰਵਦਰਸ਼ਨ';

  @override
  String get settingsLibrariesSubtitle =>
      'ਲਾਇਬ੍ਰੇਰੀ ਦਿੱਖ, ਫੋਲਡਰ ਦ੍ਰਿਸ਼, ਅਤੇ ਮਲਟੀ-ਸਰਵਰ ਵਿਵਹਾਰ';

  @override
  String get settingsTwentyFourHourClock => '24-ਘੰਟੇ ਦੀ ਘੜੀ';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'ਜਿੱਥੇ ਵੀ ਘੜੀ ਦਿਖਾਈ ਜਾਂਦੀ ਹੈ ਉੱਥੇ 24-ਘੰਟੇ ਦੇ ਸਮੇਂ ਦੀ ਫਾਰਮੈਟਿੰਗ ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'ਨੈਵੀਗੇਸ਼ਨ ਪੱਟੀ ਵਿੱਚ ਸ਼ਫਲ ਬਟਨ ਦਿਖਾਓ';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'ਨੈਵੀਗੇਸ਼ਨ ਪੱਟੀ ਵਿੱਚ ਸ਼ੈਲੀ ਬਟਨ ਦਿਖਾਓ';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'ਨੈਵੀਗੇਸ਼ਨ ਬਾਰ ਵਿੱਚ ਮਨਪਸੰਦ ਬਟਨ ਦਿਖਾਓ';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'ਨੈਵੀਗੇਸ਼ਨ ਪੱਟੀ ਵਿੱਚ ਲਾਇਬ੍ਰੇਰੀਆਂ ਬਟਨ ਦਿਖਾਓ';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'ਪ੍ਰਤੀ ਲਾਇਬ੍ਰੇਰੀ ਹੋਮ ਪੇਜ ਦੀ ਦਿੱਖ ਨੂੰ ਟੌਗਲ ਕਰੋ। ਤਬਦੀਲੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰਨ ਲਈ Moonfin ਨੂੰ ਮੁੜ ਚਾਲੂ ਕਰੋ।';

  @override
  String get settingsMediaBarAndLocalPreviews => 'ਮੀਡੀਆ ਬਾਰ ਅਤੇ ਸਥਾਨਕ ਝਲਕ';

  @override
  String get settingsVisualOverlays => 'ਵਿਜ਼ੂਅਲ ਓਵਰਲੇਅ';

  @override
  String get settingsSeasonalSurprise => 'ਮੌਸਮੀ ਹੈਰਾਨੀ';

  @override
  String get settingsMetadataAndRatings => 'ਮੈਟਾਡੇਟਾ ਅਤੇ ਰੇਟਿੰਗਾਂ';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase ਵਾਧੂ ਰੇਟਿੰਗ ਸਰੋਤਾਂ, ਸੀਰ ਬੇਨਤੀਆਂ, ਅਤੇ ਸਿੰਕ ਕੀਤੀਆਂ ਤਰਜੀਹਾਂ ਸਮੇਤ ਸਰਵਰ-ਸਾਈਡ ਏਕੀਕਰਣ ਨੂੰ ਸ਼ਕਤੀ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ।';

  @override
  String get settingsOfflineDownloads => 'ਔਫਲਾਈਨ ਡਾਊਨਲੋਡ';

  @override
  String get settingsHigh => 'ਉੱਚ';

  @override
  String get settingsLow => 'ਘੱਟ';

  @override
  String get settingsCustomPath => 'ਕਸਟਮ ਮਾਰਗ';

  @override
  String get settingsEnterDownloadFolderPath => 'ਡਾਊਨਲੋਡ ਫੋਲਡਰ ਮਾਰਗ ਦਰਜ ਕਰੋ';

  @override
  String get settingsConcurrentDownloads => 'ਸਮਕਾਲੀ ਡਾਊਨਲੋਡ';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'ਇੱਕ ਵਾਰ ਵਿੱਚ ਡਾਊਨਲੋਡ ਕਰਨ ਲਈ ਆਈਟਮਾਂ ਦੀ ਅਧਿਕਤਮ ਸੰਖਿਆ।';

  @override
  String get settingsAppInfo => 'ਐਪ ਜਾਣਕਾਰੀ';

  @override
  String get settingsReportAnIssue => 'ਕਿਸੇ ਮੁੱਦੇ ਦੀ ਰਿਪੋਰਟ ਕਰੋ';

  @override
  String get settingsReportAnIssueSubtitle => 'GitHub \'ਤੇ ਮੁੱਦਾ ਟਰੈਕਰ ਖੋਲ੍ਹੋ';

  @override
  String get settingsJoinDiscord => 'Discord ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ';

  @override
  String get settingsJoinDiscordSubtitle => 'ਭਾਈਚਾਰੇ ਨਾਲ ਗੱਲਬਾਤ ਕਰੋ';

  @override
  String get settingsJoinTheDiscord => 'Discord ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ';

  @override
  String get settingsSupportMoonfin => 'ਸਹਾਇਤਾ Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'ਕਾਨੂੰਨੀ';

  @override
  String get settingsLicenses => 'ਲਾਇਸੰਸ';

  @override
  String get settingsOpenSourceLicenseNotices => 'ਓਪਨ-ਸੋਰਸ ਲਾਇਸੰਸ ਨੋਟਿਸ';

  @override
  String get settingsPrivacyPolicy => 'ਪਰਾਈਵੇਟ ਨੀਤੀ';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin ਤੁਹਾਡੇ ਡੇਟਾ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਦਾ ਹੈ';

  @override
  String get settingsCheckForUpdates => 'ਅੱਪਡੇਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'ਨਵੀਨਤਮ Moonfin ਰੀਲੀਜ਼ ਦੀ ਜਾਂਚ ਕਰੋ';

  @override
  String get settingsPoweredByFlutter => 'ਫਲਟਰ ਦੁਆਰਾ ਸੰਚਾਲਿਤ';

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
  String get settingsBoth => 'ਦੋਵੇਂ';

  @override
  String get settingsShuffleContentTypeFilter =>
      'ਸਮਗਰੀ ਕਿਸਮ ਫਿਲਟਰ ਨੂੰ ਸ਼ਫਲ ਕਰੋ';

  @override
  String get settingsVideoPlaybackPreferences => 'ਵੀਡੀਓ ਪਲੇਬੈਕ ਤਰਜੀਹਾਂ';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'ਕੋਰ ਵੀਡੀਓ ਇੰਜਣ ਅਤੇ ਸਟ੍ਰੀਮਿੰਗ ਗੁਣਵੱਤਾ ਸੈਟਿੰਗਾਂ';

  @override
  String get settingsAudioPreferences => 'ਆਡੀਓ ਤਰਜੀਹਾਂ';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ਆਡੀਓ ਟਰੈਕ, ਪ੍ਰੋਸੈਸਿੰਗ, ਅਤੇ ਪਾਸਥਰੂ ਵਿਕਲਪ';

  @override
  String get settingsAutomationAndQueue => 'ਆਟੋਮੇਸ਼ਨ ਅਤੇ ਕਤਾਰ';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'ਆਟੋਮੇਟਿਡ ਪਲੇਬੈਕ ਅਤੇ ਸੀਕਵੈਂਸਿੰਗ';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'ਡਾਊਨਲੋਡ ਗੁਣਵੱਤਾ, ਸਟੋਰੇਜ ਸੀਮਾਵਾਂ ਅਤੇ ਕਤਾਰ ਦਾ ਆਕਾਰ';

  @override
  String get settingsSyncplaySubtitle => 'ਸਮੂਹ ਸੈਸ਼ਨਾਂ ਲਈ ਸਮਕਾਲੀਕਰਨ ਤਰਕ';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'ਵਿਸ਼ੇਸ਼ ਖਿਡਾਰੀ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ। ਸਾਵਧਾਨੀ ਨਾਲ ਵਰਤੋ, ਕਿਉਂਕਿ ਕੁਝ ਵਿਕਲਪ ਪਲੇਬੈਕ ਸਮੱਸਿਆਵਾਂ ਦਾ ਕਾਰਨ ਬਣ ਸਕਦੇ ਹਨ';

  @override
  String get settingsSkipIntrosAndOutros => 'Intros ਅਤੇ Outros ਨੂੰ ਛੱਡਣਾ ਹੈ?';

  @override
  String get settingsPromptUser => 'ਪ੍ਰੋਂਪਟ ਯੂਜ਼ਰ';

  @override
  String get settingsSkip => 'ਛੱਡੋ';

  @override
  String get settingsDoNothing => 'ਕੁਝ ਨਾ ਕਰੋ';

  @override
  String get settingsMaxBitrateDescription =>
      'ਸਟ੍ਰੀਮਿੰਗ ਬਿੱਟਰੇਟ ਨੂੰ ਕੈਪ ਕਰੋ। ਇਸ ਥ੍ਰੈਸ਼ਹੋਲਡ ਤੋਂ ਉੱਪਰ ਦੀ ਸਮੱਗਰੀ ਨੂੰ ਫਿੱਟ ਕਰਨ ਲਈ ਟ੍ਰਾਂਸਕੋਡ ਕੀਤਾ ਜਾਵੇਗਾ।';

  @override
  String get settingsMaxResolutionDescription =>
      'ਵੱਧ ਤੋਂ ਵੱਧ ਰੈਜ਼ੋਲਿਊਸ਼ਨ ਨੂੰ ਸੀਮਿਤ ਕਰੋ ਜੋ ਖਿਡਾਰੀ ਬੇਨਤੀ ਕਰੇਗਾ। ਉੱਚ-ਰੈਜ਼ੋਲੂਸ਼ਨ ਸਮੱਗਰੀ ਨੂੰ ਹੇਠਾਂ ਟ੍ਰਾਂਸਕੋਡ ਕੀਤਾ ਜਾਵੇਗਾ।';

  @override
  String get settingsPlayerZoomDescription =>
      'ਸਕ੍ਰੀਨ ਨੂੰ ਫਿੱਟ ਕਰਨ ਲਈ ਵੀਡੀਓ ਨੂੰ ਕਿਵੇਂ ਸਕੇਲ ਕੀਤਾ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get settingsPlaybackEngineAndroidTv => 'ਪਲੇਬੈਕ ਇੰਜਣ (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV ਡੀਵਾਈਸਾਂ \'ਤੇ ਪੂਰਵ-ਨਿਰਧਾਰਤ ਪਲੇਬੈਕ ਇੰਜਣ ਚੁਣੋ। ਬਦਲਾਅ ਅਗਲੇ ਪਲੇਬੈਕ ਸੈਸ਼ਨ \'ਤੇ ਲਾਗੂ ਹੁੰਦੇ ਹਨ।';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (ਸਿਫ਼ਾਰਸ਼ੀ)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (ਵਿਰਾਸਤੀ)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision ਫਾਲਬੈਕ';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision ਡੀਕੋਡਿੰਗ ਤੋਂ ਬਿਨਾਂ ਡਿਵਾਈਸਾਂ \'ਤੇ Dolby Vision ਸਿਰਲੇਖਾਂ ਲਈ ਵਿਵਹਾਰ।';

  @override
  String get settingsAskEachTime => 'ਹਰ ਵਾਰ ਪੁੱਛੋ';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 ਫਾਲਬੈਕ ਨੂੰ ਤਰਜੀਹ ਦਿਓ';

  @override
  String get settingsPreferServerTranscode => 'ਸਰਵਰ ਟ੍ਰਾਂਸਕੋਡ ਨੂੰ ਤਰਜੀਹ ਦਿਓ';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision ਪ੍ਰੋਫਾਈਲ 7 ਡਾਇਰੈਕਟ ਪਲੇ';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'ਨਿਯੰਤਰਣ ਕਰਦਾ ਹੈ ਕਿ ਕੀ Dolby Vision ਪ੍ਰੋਫਾਈਲ 7 ਐਨਹਾਂਸਮੈਂਟ-ਲੇਅਰ ਸਟ੍ਰੀਮਾਂ ਨੂੰ ਨਿਰਦੇਸ਼ਿਤ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get settingsAutoAftkrtEnabled => 'ਆਟੋ (AFTKRT ਸਮਰਥਿਤ)';

  @override
  String get settingsEnabledOnThisDevice => 'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਸਮਰੱਥ ਹੈ';

  @override
  String get settingsDisabledPreferTranscode => 'ਅਯੋਗ (ਟਰਾਂਸਕੋਡ ਨੂੰ ਤਰਜੀਹ ਦਿਓ)';

  @override
  String get settingsResumeRewindDescription =>
      'ਪਲੇਬੈਕ ਨੂੰ ਮੁੜ-ਚਾਲੂ ਕਰਨ ਵੇਲੇ (ਦੇਖਣਾ ਜਾਰੀ ਰੱਖੋ ਜਾਂ ਮੀਡੀਆ ਆਈਟਮ ਪੰਨੇ ਤੋਂ), ਕਿੰਨੇ ਸਕਿੰਟਾਂ ਨੂੰ ਮੁੜ ਚਾਲੂ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ?';

  @override
  String get settingsUnpauseRewindDescription =>
      'ਵਿਰਾਮ ਬਟਨ ਨੂੰ ਦਬਾਉਣ ਤੋਂ ਬਾਅਦ ਪਲੇਬੈਕ ਨੂੰ ਮੁੜ-ਚਾਲੂ ਕਰਨ ਵੇਲੇ, ਕਿੰਨੇ ਸਕਿੰਟਾਂ ਨੂੰ ਮੁੜ ਚਾਲੂ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ?';

  @override
  String get settingsSkipBackLengthDescription =>
      'ਰਿਵਾਈਂਡ ਬਟਨ ਦਬਾਉਣ ਤੋਂ ਬਾਅਦ ਕਿੰਨੇ ਸਕਿੰਟ ਪਿੱਛੇ ਛਾਲ ਮਾਰਨੀ ਹੈ।';

  @override
  String get settingsOneSecond => '1 ਸਕਿੰਟ';

  @override
  String get settingsThreeSeconds => '3 ਸਕਿੰਟ';

  @override
  String get settingsFortyFiveSeconds => '45 ਸਕਿੰਟ';

  @override
  String get settingsSixtySeconds => '60 ਸਕਿੰਟ';

  @override
  String get settingsSkipForwardLengthDescription =>
      'ਫਾਸਟ ਫਾਰਵਰਡ ਬਟਨ ਨੂੰ ਦਬਾਉਣ ਤੋਂ ਬਾਅਦ ਕਿੰਨੇ ਸਕਿੰਟ ਅੱਗੇ ਛਾਲ ਮਾਰਨੀ ਹੈ।';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 ਨੂੰ ਬਾਹਰੀ ਡੀਕੋਡਰ';

  @override
  String get settingsCinemaMode => 'ਸਿਨੇਮਾ ਮੋਡ';

  @override
  String get settingsCinemaModeSubtitle =>
      'ਮੁੱਖ ਵਿਸ਼ੇਸ਼ਤਾ ਤੋਂ ਪਹਿਲਾਂ ਟ੍ਰੇਲਰ/ਪ੍ਰੀਰੋਲ ਚਲਾਓ';

  @override
  String get settingsNextUpDisplayDescription =>
      'ਵਿਸਤ੍ਰਿਤ ਐਪੀਸੋਡ ਆਰਟਵਰਕ ਅਤੇ ਵਰਣਨ ਦੇ ਨਾਲ ਇੱਕ ਪੂਰਾ ਕਾਰਡ ਦਿਖਾਉਂਦਾ ਹੈ। ਨਿਊਨਤਮ ਇੱਕ ਸੰਖੇਪ ਕਾਊਂਟਡਾਊਨ ਓਵਰਲੇ ਦਿਖਾਉਂਦਾ ਹੈ। ਅਯੋਗ ਪ੍ਰੋਂਪਟ ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਲੁਕਾਉਂਦਾ ਹੈ।';

  @override
  String get settingsShort => 'ਛੋਟਾ';

  @override
  String get settingsLong => 'ਲੰਬੀ';

  @override
  String get settingsVeryLong => 'ਬਹੁਤ ਲੰਬਾ';

  @override
  String get settingsVideoStartDelay => 'ਵੀਡੀਓ ਸ਼ੁਰੂ ਕਰਨ ਵਿੱਚ ਦੇਰੀ';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'ਲਾਈਵ ਟੀਵੀ ਡਾਇਰੈਕਟ';

  @override
  String get settingsLiveTvDirectSubtitle => 'ਲਾਈਵ ਟੀਵੀ ਲਈ ਸਿੱਧਾ ਪਲੇ ਚਾਲੂ ਕਰੋ';

  @override
  String get settingsOpenGroups => 'ਗਰੁੱਪ ਖੋਲ੍ਹੋ';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay ਸਮੂਹ ਬਣਾਓ, ਸ਼ਾਮਲ ਹੋਵੋ ਜਾਂ ਪ੍ਰਬੰਧਿਤ ਕਰੋ';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay ਸਮਰਥਿਤ';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'ਸਮੂਹ ਦੇਖਣ ਦੀਆਂ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get settingsSyncplayButton => 'SyncPlay ਬਟਨ';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'ਨੈਵੀਗੇਸ਼ਨ ਪੱਟੀ \'ਤੇ SyncPlay ਬਟਨ ਦਿਖਾਓ';

  @override
  String get settingsSyncplayAdvancedCorrection => 'ਉੱਨਤ ਸੁਧਾਰ';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'ਵਧੀਆ ਸਮਕਾਲੀ ਤਰਕ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get settingsSyncplaySyncCorrection => 'ਸਿੰਕ ਸੁਧਾਰ';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'ਸਿੰਕ ਵਿੱਚ ਰਹਿਣ ਲਈ ਪਲੇਬੈਕ ਨੂੰ ਆਟੋਮੈਟਿਕਲੀ ਵਿਵਸਥਿਤ ਕਰੋ';

  @override
  String get settingsSyncplaySpeedToSync => 'ਸਿੰਕ ਕਰਨ ਦੀ ਗਤੀ';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'ਸਿੰਕ ਕਰਨ ਲਈ ਪਲੇਬੈਕ ਸਪੀਡ ਐਡਜਸਟਮੈਂਟ ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get settingsSyncplaySkipToSync => 'ਸਿੰਕ \'ਤੇ ਜਾਓ';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'ਸਿੰਕ ਕਰਨ ਲਈ ਖੋਜ ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'ਘੱਟੋ-ਘੱਟ ਸਪੀਡ ਦੇਰੀ';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'ਅਧਿਕਤਮ ਸਪੀਡ ਦੇਰੀ';

  @override
  String get settingsSyncplaySpeedDuration => 'ਗਤੀ ਦੀ ਮਿਆਦ';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'ਘੱਟੋ-ਘੱਟ ਦੇਰੀ ਛੱਡੋ';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay ਵਾਧੂ ਔਫਸੈੱਟ';

  @override
  String get onNow => 'ਹੁਣ \'ਤੇ';

  @override
  String get collections => 'ਸੰਗ੍ਰਹਿ';

  @override
  String get lastPlayed => 'ਆਖਰੀ ਵਾਰ ਖੇਡਿਆ ਗਿਆ';

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
