// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'ਖਾਤਾ ਤਰਜੀਹਾਂ';

  @override
  String get interfaceLanguage => 'ਇੰਟਰਫੇਸ ਭਾਸ਼ਾ';

  @override
  String get systemLanguageDefault => 'ਸਿਸਟਮ ਡਿਫਾਲਟ';

  @override
  String get signIn => 'ਸਾਈਨ - ਇਨ';

  @override
  String get empty => 'ਖਾਲੀ';

  @override
  String connectingToServer(String serverName) {
    return '$serverName ਨਾਲ ਕਨੈਕਟ ਹੋ ਰਿਹਾ ਹੈ';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
    return 'QuickConnect ਉਪਲਬਧ ਨਹੀਂ: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect ਉਪਲਬਧ ਨਹੀਂ ($status): $detail';
  }

  @override
  String get whosWatching => 'ਕੌਣ ਦੇਖ ਰਿਹਾ ਹੈ?';

  @override
  String get addUser => 'ਉਪਭੋਗਤਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get selectServer => 'ਸਰਵਰ ਚੁਣੋ';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin ਸੰਸਕਰਣ $version';
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
    return 'ਆਪਣੇ ਸਰਵਰਾਂ ਵਿੱਚੋਂ \"$serverName\" ਹਟਾਉਣਾ ਹੈ?';
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
  String get detailScreenStyle => 'ਵੇਰਵਾ ਸਕ੍ਰੀਨ ਸ਼ੈਲੀ';

  @override
  String get detailScreenStyleSubtitle =>
      'ਕਲਾਸਿਕ ਅਸਲ ਕੇਂਦਰਿਤ Moonfin ਲੇਆਉਟ ਹੈ। ਮਾਡਰਨ ਇੱਕ ਜਵਾਬਦੇਹ ਸਿਨੇਮੈਟਿਕ ਲੇਆਉਟ ਹੈ।';

  @override
  String get detailScreenStyleMoonfin => 'ਕਲਾਸਿਕ';

  @override
  String get detailScreenStyleModern => 'ਮਾਡਰਨ';

  @override
  String get expandedTabs => 'ਵਿਸਤ੍ਰਿਤ ਟੈਬਾਂ';

  @override
  String get expandedTabsSubtitle =>
      'ਟੈਬਾਂ ਬ੍ਰਾਊਜ਼ ਕਰਦੇ ਸਮੇਂ ਟੈਬ ਸਮੱਗਰੀ ਆਪਣੇ-ਆਪ ਦਿਖਾਓ। ਹਰ ਟੈਬ ਨੂੰ ਹੱਥੀਂ ਖੋਲ੍ਹਣ ਅਤੇ ਬੰਦ ਕਰਨ ਲਈ ਬੰਦ ਕਰੋ।';

  @override
  String get showTechnicalDetails => 'ਤਕਨੀਕੀ ਵੇਰਵੇ ਦਿਖਾਉਣੇ ਹਨ?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'ਬੈਨਰ ਸੰਖੇਪ ਵਿੱਚ ਕੋਡੇਕ, ਰੈਜ਼ੋਲਿਊਸ਼ਨ ਅਤੇ ਸਟ੍ਰੀਮ ਜਾਣਕਾਰੀ ਦਿਖਾਓ';

  @override
  String get recommendationSystem => 'ਸਿਫਾਰਸ਼ ਸਿਸਟਮ';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin Recommends ਲੋਕਲ-ਲਾਇਬ੍ਰੇਰੀ ਐਲਗੋਰਿਦਮ ਜਾਂ ਆਨਲਾਈਨ TMDb ਦੇ ਸਮਾਨਤਾ ਮੈਟ੍ਰਿਕਸ ਵਰਤੋ। ਨੋਟ: ਆਨਲਾਈਨ ਸਿਫਾਰਸ਼ਾਂ ਲਈ Seerr ਏਕੀਕਰਨ ਦੀ ਲੋੜ ਹੈ।';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb ਸਮਾਨਤਾ';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'ਮਾਪਾ ਰੇਟਿੰਗ ਸੀਮਾ ਲਾਗੂ ਕਰਨੀ ਹੈ?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'ਟਾਰਗੇਟ ਮੀਡੀਆ ਦੀ ਮਾਪਾ ਰੇਟਿੰਗ ਅਨੁਸਾਰ Moonfin Recommends ਸੁਝਾਅ ਸੀਮਿਤ ਕਰੋ';

  @override
  String get interfaceStyle => 'ਇੰਟਰਫੇਸ ਸ਼ੈਲੀ';

  @override
  String get interfaceStyleSubtitle =>
      'ਆਟੋਮੈਟਿਕ ਤੁਹਾਡੇ ਡਿਵਾਈਸ ਨਾਲ ਮੇਲ ਖਾਂਦਾ ਹੈ। ਕੋਈ ਦਿੱਖ ਲਾਗੂ ਕਰਨ ਲਈ Apple ਜਾਂ Material ਚੁਣੋ।';

  @override
  String get interfaceStyleAutomatic => 'ਆਟੋਮੈਟਿਕ';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'ਗਲਾਸ ਗੁਣਵੱਤਾ';

  @override
  String get glassQualitySubtitle =>
      'ਆਟੋ ਇਸ ਡਿਵਾਈਸ ਲਈ ਸਭ ਤੋਂ ਵਧੀਆ ਗਲਾਸ ਪ੍ਰਭਾਵ ਚੁਣਦਾ ਹੈ। ਫੁੱਲ ਅਸਲ ਧੁੰਦਲਾਪਣ ਲਾਗੂ ਕਰਦਾ ਹੈ; ਘਟਾਇਆ ਹੋਇਆ ਇੱਕ ਹਲਕਾ ਗਲਾਸ ਵਰਤਦਾ ਹੈ ਜੋ GPU ਊਰਜਾ ਬਚਾਉਂਦਾ ਹੈ।';

  @override
  String get glassQualityAuto => 'ਆਟੋ';

  @override
  String get glassQualityFull => 'ਫੁੱਲ';

  @override
  String get glassQualityReduced => 'ਘਟਾਇਆ';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'ਐਪ ਨੂੰ ਰੀਸਟਾਰਟ ਕੀਤੇ ਬਿਨਾਂ Moonfin ਅਤੇ Neon Pulse ਵਿਚਕਾਰ ਸਵਿਚ ਕਰੋ';

  @override
  String get customThemeTitle => 'ਕਸਟਮ ਥੀਮ';

  @override
  String get customThemeSubtitle =>
      'ਕਸਟਮ ਥੀਮ Moonfin ਵਿੱਚ ਦ੍ਰਿਸ਼ ਤੱਤ ਬਦਲਦੇ ਹਨ। ਆਪਣੀ ਸ਼ੈਲੀ ਦੇ ਅਨੁਕੂਲ ਇਹਨਾਂ ਵਿੱਚੋਂ ਇੱਕ ਵਿਕਲਪ ਚੁਣੋ।';

  @override
  String get keyboardPreferSystemIme => 'ਸਿਸਟਮ ਕੀਬੋਰਡ ਨੂੰ ਤਰਜੀਹ ਦਿਓ';

  @override
  String get keyboardPreferSystemImeDescription =>
      'ਟੈਕਸਟ ਦਾਖਲ ਕਰਨ ਲਈ ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ ਆਪਣੇ ਡਿਵਾਈਸ ਦੀ ਇਨਪੁੱਟ ਵਿਧੀ ਵਰਤੋ';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'ਮੌਜੂਦਾ Moonfin ਦਿੱਖ ਤੁਹਾਨੂੰ ਸਭ ਨੂੰ ਪਿਆਰ ਹੋ ਗਈ ਹੈ';

  @override
  String get themeNeonPulse => 'ਨਿਓਨ ਪਲਸ';

  @override
  String get themeNeonPulseSubtitle =>
      'ਮੈਜੈਂਟਾ ਗਲੋ, ਸਿਆਨ ਟੈਕਸਟ, ਅਤੇ ਮਜ਼ਬੂਤ ​​ਕ੍ਰੋਮ ਕੰਟ੍ਰਾਸਟ ਦੇ ਨਾਲ ਸਿੰਥਵੇਵ ਸਟਾਈਲਿੰਗ';

  @override
  String get themeGlass => 'ਗਲਾਸ';

  @override
  String get themeGlassSubtitle =>
      'ਇੱਕ ਵਹਿੰਦੇ ਗ੍ਰੇਡੀਐਂਟ ਪਿਛੋਕੜ, ਧੁੰਦਲੀਆਂ ਸਤਹਾਂ ਅਤੇ Apple-ਨੀਲੇ ਲਹਿਜੇ ਨਾਲ ਲਿਕੁਇਡ-ਗਲਾਸ ਸ਼ੈਲੀ';

  @override
  String get theme8BitHero => '8-bit ਹੀਰੋ';

  @override
  String get theme8BitHeroSubtitle =>
      'ਮੋਟੇ ਪੈਲੇਟ, ਬਲਾਕੀ ਕਿਨਾਰਿਆਂ, ਸਖ਼ਤ ਪਰਛਾਵੇਂ ਅਤੇ ਪਿਕਸਲ ਫੌਂਟ ਨਾਲ ਰੈਟਰੋ ਪਿਕਸਲ-ਆਰਟ ਸ਼ੈਲੀ';

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
    return '$target ਨਾਲ ਕਨੈਕਟ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ';
  }

  @override
  String get exitApp => 'Moonfin ਤੋਂ ਬਾਹਰ ਜਾਣਾ?';

  @override
  String get exitAppConfirmation =>
      'ਕੀ ਤੁਸੀਂ ਯਕੀਨੀ ਤੌਰ \'ਤੇ ਬਾਹਰ ਜਾਣਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get exit => 'ਨਿਕਾਸ';

  @override
  String get gameMenu => 'ਮੀਨੂ';

  @override
  String get gamePaused => 'ਰੋਕਿਆ ਗਿਆ';

  @override
  String get gameSaveState => 'ਸਟੇਟ ਸੇਵ ਕਰੋ';

  @override
  String get games => 'ਖੇਡਾਂ';

  @override
  String get gameLoadState => 'ਸਟੇਟ ਲੋਡ ਕਰੋ';

  @override
  String get gameFastForward => 'ਤੇਜ਼-ਅੱਗੇ';

  @override
  String get gameEmulatorSettings => 'ਐਮੂਲੇਟਰ ਸੈਟਿੰਗਾਂ';

  @override
  String get gameNoCoreOptions =>
      'ਇਸ ਕੋਰ ਦੇ ਕੋਈ ਵਿਵਸਥਿਤ ਹੋਣ ਯੋਗ ਵਿਕਲਪ ਨਹੀਂ ਹਨ।';

  @override
  String get gameHoldToOpenMenu => 'ਮੀਨੂ ਖੋਲ੍ਹਣ ਲਈ ਦਬਾ ਕੇ ਰੱਖੋ';

  @override
  String get gamePlaybackUnsupported =>
      'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਗੇਮ ਪਲੇਬੈਕ ਅਜੇ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

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
  String get recordings => 'ਰਿਕਾਰਡਿੰਗਾਂ';

  @override
  String get schedule => 'ਤਹਿ';

  @override
  String get series => 'ਸੀਰੀਜ਼';

  @override
  String get noItemsFound => 'ਕੋਈ ਆਈਟਮਾਂ ਨਹੀਂ ਮਿਲੀਆਂ';

  @override
  String get home => 'ਹੋਮ';

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
    return 'ਫੋਲਡਰ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get thisFolderIsEmpty => 'ਇਹ ਫੋਲਡਰ ਖਾਲੀ ਹੈ';

  @override
  String itemCountLabel(int count) {
    return '$count ਆਈਟਮਾਂ';
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
    return '$count ਆਈਟਮਾਂ';
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
    return '$name — ਸ਼ੈਲੀਆਂ';
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
    return '$countਮਿੰਟ ਪਹਿਲਾਂ';
  }

  @override
  String hoursAgo(int count) {
    return '$countਘੰਟੇ ਪਹਿਲਾਂ';
  }

  @override
  String daysAgo(int count) {
    return '$countਦਿਨ ਪਹਿਲਾਂ';
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
    return '$count ਸਿਰਲੇਖ';
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
  String get resume => 'ਜਾਰੀ ਰੱਖੋ';

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
    return '$count ਲੇਖਕ';
  }

  @override
  String genresCount(int count) {
    return '$count ਸ਼ੈਲੀਆਂ';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% ਪੂਰਾ ਹੋਇਆ';
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
    return 'ਪੜ੍ਹਨ-ਪਹਿਲਾਂ ਬ੍ਰਾਊਜ਼ਿੰਗ ਲਈ ਵਿਵਸਥਿਤ $count ਸਿਰਲੇਖ।';
  }

  @override
  String get titles => 'ਟਾਈਟਲ';

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
    return 'ਕੋਈ $label ਨਹੀਂ ਮਿਲੇ';
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
  String get watched => 'ਦੇਖੇ ਹੋਏ';

  @override
  String get unread => 'ਨਾ ਪੜ੍ਹਿਆ';

  @override
  String get unwatched => 'ਅਣਦੇਖੇ';

  @override
  String get seriesStatus => 'ਸੀਰੀਜ਼ ਸਥਿਤੀ';

  @override
  String get allLibraries => 'ਸਾਰੀਆਂ ਲਾਇਬ੍ਰੇਰੀਆਂ';

  @override
  String get books => 'ਕਿਤਾਬਾਂ';

  @override
  String get latestBooks => 'ਨਵੀਨਤਮ ਕਿਤਾਬਾਂ';

  @override
  String get latestAudiobooks => 'ਨਵੀਨਤਮ ਆਡੀਓਬੁੱਕਸ';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਕਿਤਾਬਾਂ',
      one: '1 ਕਿਤਾਬ',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'ਕਿਤਾਬ';

  @override
  String get bookFormatAudiobook => 'ਆਡੀਓਬੁੱਕ';

  @override
  String bookPercentRead(int percent) {
    return '$percent% ਪੜ੍ਹੀ';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time ਬਾਕੀ';
  }

  @override
  String get bookHeroRead => 'ਪੜ੍ਹੋ';

  @override
  String get bookHeroListen => 'ਸੁਣੋ';

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
    return '$count ਭਾਗ';
  }

  @override
  String firstPublished(int year) {
    return 'ਪਹਿਲੀ ਵਾਰ ਪ੍ਰਕਾਸ਼ਿਤ $year';
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
    return '$count ਕਿਤਾਬਾਂ';
  }

  @override
  String get couldNotLoadSubject => 'ਇਸ ਵਿਸ਼ੇ ਨੂੰ ਹੁਣੇ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ।';

  @override
  String get audiobookDetails => 'ਆਡੀਓਬੁੱਕ ਵੇਰਵੇ';

  @override
  String authorsCountTitle(int count) {
    return '$count ਲੇਖਕ';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਆਡੀਓਬੁੱਕਸ',
      one: '1 ਆਡੀਓਬੁੱਕ',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'ਟਰੈਕ ਸੂਚੀ';

  @override
  String get itemListPlaceholder => 'ਆਈਟਮ ਸੂਚੀ ਇੱਥੇ ਦਿਖਾਈ ਦੇਵੇਗੀ';

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
  String get seasons => 'ਸੀਜ਼ਨ';

  @override
  String get chapters => 'ਅਧਿਆਏ';

  @override
  String get features => 'ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ';

  @override
  String get movies => 'ਫਿਲਮਾਂ';

  @override
  String get musicVideos => 'ਸੰਗੀਤ ਵੀਡੀਓ';

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
    return 'ਡਿਸਕ $number';
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
    return 'ਪ੍ਰਕਾਸ਼ਿਤ $year';
  }

  @override
  String get publicationDateUnknown => 'ਪ੍ਰਕਾਸ਼ਨ ਮਿਤੀ ਅਗਿਆਤ';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਸੀਜ਼ਨ',
      one: '1 ਸੀਜ਼ਨ',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time \'ਤੇ ਖਤਮ ਹੁੰਦਾ ਹੈ';
  }

  @override
  String get items => 'ਆਈਟਮਾਂ';

  @override
  String get extras => 'ਵਾਧੂ';

  @override
  String get behindTheScenes => 'ਪਰਦੇ ਪਿੱਛੇ';

  @override
  String get deletedScenes => 'ਹਟਾਏ ਗਏ ਦ੍ਰਿਸ਼';

  @override
  String get featurettes => 'ਫੀਚਰੈੱਟ';

  @override
  String get interviews => 'ਇੰਟਰਵਿਊ';

  @override
  String get scenes => 'ਦ੍ਰਿਸ਼';

  @override
  String get shorts => 'ਸ਼ਾਰਟਸ';

  @override
  String get trailers => 'ਟ੍ਰੇਲਰ';

  @override
  String timeRemaining(String time) {
    return '$time ਬਾਕੀ';
  }

  @override
  String endsIn(String time) {
    return '$time ਵਿੱਚ ਖਤਮ ਹੁੰਦਾ ਹੈ';
  }

  @override
  String get view => 'ਦੇਖੋ';

  @override
  String get resumeReading => 'ਪੜ੍ਹਨਾ ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get read => 'ਪੜ੍ਹੋ';

  @override
  String resumeFrom(String position) {
    return '$position ਤੋਂ ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ';
  }

  @override
  String get play => 'ਚਲਾਓ';

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
  String get cast => 'ਕਾਸਟ ਕਰੋ';

  @override
  String get castMembers => 'Cast';

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
  String get finalizingDownload => 'Finalizing…';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'ਪਲੇਲਿਸਟ ਦਾ ਨਾਮ ਬਦਲੋ';

  @override
  String get playlistName => 'ਪਲੇਲਿਸਟ ਦਾ ਨਾਮ';

  @override
  String get deleteDownloadedAlbum => 'ਡਾਊਨਲੋਡ ਕੀਤੀ ਐਲਬਮ ਮਿਟਾਓ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\" ਲਈ ਡਾਊਨਲੋਡ ਕੀਤੇ ਟਰੈਕ ਮਿਟਾਉਣੇ ਹਨ?';
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
    return 'ਕੋਈ $itemLabel ਲੋਡ ਨਹੀਂ ਹੋਏ';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title ਡਾਊਨਲੋਡ ਹੋ ਰਿਹਾ ਹੈ ($count ਆਈਟਮਾਂ)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ \"$name\" ਨੂੰ ਸਰਵਰ ਤੋਂ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਹ ਕਾਰਵਾਈ ਵਾਪਸ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ।';
  }

  @override
  String get itemDeleted => 'ਆਈਟਮ ਮਿਟਾਈ ਗਈ';

  @override
  String get noPlayableTrailerFound => 'ਕੋਈ ਚਲਾਉਣ ਯੋਗ ਟ੍ਰੇਲਰ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String unsupportedBookFormat(String extension) {
    return 'ਅਸਮਰਥਿਤ ਕਿਤਾਬ ਫਾਰਮੈਟ: .$extension';
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
    return 'ਉਪਸਿਰਲੇਖ ਡਾਊਨਲੋਡ ਕੀਤਾ ਅਤੇ ਚੁਣਿਆ ਗਿਆ: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'ਉਪਸਿਰਲੇਖ ਡਾਊਨਲੋਡ ਕੀਤਾ ਗਿਆ। ਜਦੋਂ Jellyfin ਆਈਟਮ ਨੂੰ ਰਿਫ੍ਰੈਸ਼ ਕਰਦਾ ਹੈ ਤਾਂ ਇਸ ਨੂੰ ਦਿਖਾਈ ਦੇਣ ਵਿੱਚ ਕੁਝ ਸਮਾਂ ਲੱਗ ਸਕਦਾ ਹੈ।';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language ਲਈ ਕੋਈ ਰਿਮੋਟ ਉਪਸਿਰਲੇਖ ਨਹੀਂ ਮਿਲੇ।';
  }

  @override
  String get selectVersion => 'ਸੰਸਕਰਣ ਚੁਣੋ';

  @override
  String versionNumber(int number) {
    return 'ਸੰਸਕਰਣ $number';
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
    return '$name ਡਾਊਨਲੋਡ ਹੋ ਰਿਹਾ ਹੈ ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'ਡਾਊਨਲੋਡ ਕੀਤੀਆਂ ਫ਼ਾਈਲਾਂ ਨੂੰ ਮਿਟਾਓ';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel ਲਈ ਲੋਕਲ ਫਾਈਲਾਂ ਮਿਟਾਉਣੀਆਂ ਹਨ?\n\nਇਸ ਨਾਲ ਸਟੋਰੇਜ ਥਾਂ ਖਾਲੀ ਹੋਵੇਗੀ। ਤੁਸੀਂ ਬਾਅਦ ਵਿੱਚ ਮੁੜ-ਡਾਊਨਲੋਡ ਕਰ ਸਕਦੇ ਹੋ।';
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
  String get directors => 'ਡਾਇਰੈਕਟਰ';

  @override
  String get writer => 'ਲੇਖਕ';

  @override
  String get writers => 'ਲੇਖਕ';

  @override
  String get studio => 'ਸਟੂਡੀਓ';

  @override
  String studioMoreCount(int count) {
    return '+$count ਹੋਰ';
  }

  @override
  String totalEpisodes(int count) {
    return '$count ਐਪੀਸੋਡ';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'ਐਪੀਸੋਡ $number';
  }

  @override
  String chapterNumber(int number) {
    return 'ਅਧਿਆਏ $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਟਰੈਕ',
      one: '1 ਟਰੈਕ',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਅਧਿਆਏ',
      one: '1 ਅਧਿਆਏ',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'ਜਨਮ $date';
  }

  @override
  String died(String date) {
    return 'ਮੌਤ $date';
  }

  @override
  String age(int age) {
    return 'ਉਮਰ $age';
  }

  @override
  String get showLess => 'ਘੱਟ ਦਿਖਾਓ';

  @override
  String get readMore => 'ਹੋਰ ਪੜ੍ਹੋ';

  @override
  String get shuffle => 'ਸ਼ਫਲ';

  @override
  String get shuffleAllMusic => 'ਸਾਰਾ ਸੰਗੀਤ ਸ਼ਫਲ ਕਰੋ';

  @override
  String get carSignInPrompt => 'ਆਪਣੇ ਫੋਨ \'ਤੇ Moonfin ਵਿੱਚ ਸਾਈਨ ਇਨ ਕਰੋ';

  @override
  String get carServerUnreachable => 'ਤੁਹਾਡੇ ਸਰਵਰ ਤੱਕ ਪਹੁੰਚ ਨਹੀਂ ਹੋ ਸਕਦੀ';

  @override
  String downloadsCount(int count) {
    return '$count ਡਾਊਨਲੋਡ';
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
    return 'ਰਿਮੋਟ ਉਪਸਿਰਲੇਖ $action ਲਈ ਇਸ ਯੂਜ਼ਰ ਵਾਸਤੇ Jellyfin ਉਪਸਿਰਲੇਖ ਪ੍ਰਬੰਧਨ ਅਨੁਮਤੀ ਦੀ ਲੋੜ ਹੈ।';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'ਰਿਮੋਟ ਉਪਸਿਰਲੇਖ $action ਲਈ ਇਹ ਆਈਟਮ ਸਰਵਰ \'ਤੇ ਨਹੀਂ ਮਿਲ ਸਕੀ।';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'ਰਿਮੋਟ ਉਪਸਿਰਲੇਖ $action ਅਸਫਲ: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'ਰਿਮੋਟ ਉਪਸਿਰਲੇਖ $action ਅਸਫਲ (HTTP $status)।';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'ਰਿਮੋਟ ਉਪਸਿਰਲੇਖ $action ਕਰਨ ਵਿੱਚ ਅਸਫਲ।';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\" ਲਈ ਸਾਰੇ ਡਾਊਨਲੋਡ ਕੀਤੇ ਐਪੀਸੋਡ';
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
    return '$label ਕਾਰਵਾਈ ਅਸਫਲ: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'ਕਾਸਟ ਵਾਲੀਅਮ ਸੈੱਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label ਕੰਟਰੋਲ';
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
    return '$label ਰੋਕੋ';
  }

  @override
  String get queueIsEmpty => 'ਕਤਾਰ ਖਾਲੀ ਹੈ';

  @override
  String trackNumber(int number) {
    return 'ਟਰੈਕ $number';
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
    return '$seconds ਸਕਿੰਟ';
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
  String get reset => 'ਰੀਸੈੱਟ ਕਰੋ';

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
  String get player => 'ਪਲੇਅਰ';

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
    return '$protocol ਸੈਸ਼ਨ ਗਲਤੀ';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'ਕਿਤਾਬ ਵੇਰਵੇ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB ਰੈਂਡਰਿੰਗ ਇਨ-ਐਪ ਅਜੇ ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'ਇਹ ਫਾਰਮੈਟ (.$extension) ਅਜੇ ਐਪ ਵਿੱਚ ਰੈਂਡਰ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'ਏਮਬੈਡਡ ਦਸਤਾਵੇਜ਼ ਰੈਂਡਰਿੰਗ ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get couldNotOpenExternalViewer => 'ਬਾਹਰੀ ਦਰਸ਼ਕ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ।';

  @override
  String failedToOpenInAppReader(String error) {
    return 'ਐਪ ਵਿੱਚ ਰੀਡਰ ਖੋਲ੍ਹਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label \'ਤੇ ਬੁੱਕਮਾਰਕ ਪਹਿਲਾਂ ਹੀ ਸੇਵ ਹੈ।';
  }

  @override
  String bookmarkAdded(String label) {
    return 'ਬੁੱਕਮਾਰਕ ਸ਼ਾਮਲ ਕੀਤਾ: $label';
  }

  @override
  String get noBookmarksYet =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਬੁੱਕਮਾਰਕ ਨਹੀਂ ਹਨ।\nਆਪਣੀ ਸਥਿਤੀ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰਨ ਲਈ ਪੜ੍ਹਦੇ ਸਮੇਂ ਬੁੱਕਮਾਰਕ ਆਈਕਨ \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get noTableOfContentsAvailable => 'ਸਮੱਗਰੀ ਦੀ ਕੋਈ ਸਾਰਣੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String pageLabel(int number) {
    return 'ਪੰਨਾ $number';
  }

  @override
  String get position => 'ਸਥਿਤੀ';

  @override
  String get bookReader => 'ਬੁੱਕ ਰੀਡਰ';

  @override
  String formatExtension(String extension) {
    return 'ਫਾਰਮੈਟ: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% ਪੜ੍ਹੀ';
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
    return 'ਜ਼ੂਮ ਰੀਸੈਟ ਕਰੋ (${zoom}x)';
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
    return 'ਪੜ੍ਹਨ ਸਥਿਤੀ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return 'ਇਹ ਪਲੇਟਫਾਰਮ $extension ਫਾਈਲਾਂ ਲਈ ਏਮਬੈੱਡਡ ਦਸਤਾਵੇਜ਼ ਇੰਜਣ ਹੋਸਟ ਨਹੀਂ ਕਰ ਸਕਦਾ।';
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
    return 'ਗਾਈਡ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get noChannelsFound => 'ਕੋਈ ਚੈਨਲ ਨਹੀਂ ਮਿਲੇ';

  @override
  String get liveBadge => 'ਲਾਈਵ';

  @override
  String guideNextProgram(String time, String title) {
    return 'ਅਗਲਾ: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutesਮਿੰਟ ਬਾਕੀ';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hoursਘੰਟੇ ਬਾਕੀ';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hoursਘੰਟੇ $minutesਮਿੰਟ ਬਾਕੀ';
  }

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
  String get record => 'ਰਿਕਾਰਡ ਕਰੋ';

  @override
  String get cancelRecordingAction => 'ਰਿਕਾਰਡਿੰਗ ਰੱਦ ਕਰੋ';

  @override
  String get programSetToRecord => 'ਪ੍ਰੋਗਰਾਮ ਰਿਕਾਰਡ ਕਰਨ ਲਈ ਸੈੱਟ ਕੀਤਾ ਗਿਆ';

  @override
  String get recordingCancelled => 'ਰਿਕਾਰਡਿੰਗ ਰੱਦ ਕੀਤੀ ਗਈ';

  @override
  String get unableToCreateRecording => 'ਰਿਕਾਰਡਿੰਗ ਬਣਾਈ ਨਹੀਂ ਜਾ ਸਕੀ';

  @override
  String get watch => 'ਦੇਖੋ';

  @override
  String get close => 'ਬੰਦ ਕਰੋ';

  @override
  String failedToPlayChannel(String name) {
    return '$name ਚਲਾਉਣ ਵਿੱਚ ਅਸਫਲ';
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
    return '\"$name\" ਦੀ ਨਿਰਧਾਰਿਤ ਰਿਕਾਰਡਿੰਗ ਰੱਦ ਕਰਨੀ ਹੈ?';
  }

  @override
  String get no => 'ਨਹੀਂ';

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
    return '\"$name\" ਦੀ ਰਿਕਾਰਡਿੰਗ ਰੋਕਣੀ ਹੈ?';
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
    return '\"$query\" ਲਈ ਕੋਈ ਨਤੀਜੇ ਨਹੀਂ';
  }

  @override
  String searchFailedError(String error) {
    return 'ਖੋਜ ਅਸਫਲ: $error';
  }

  @override
  String get seerr => 'Seerr';

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
    return '\"$name\" ਅਤੇ ਇਸ ਦੀਆਂ ਫਾਈਲਾਂ ਹਟਾਉਣੀਆਂ ਹਨ?';
  }

  @override
  String tracksCount(int count) {
    return '$count ਟਰੈਕ';
  }

  @override
  String get album => 'ਐਲਬਮ';

  @override
  String get playAlbum => 'ਐਲਬਮ ਚਲਾਓ';

  @override
  String failedToLoadAlbum(String error) {
    return 'ਐਲਬਮ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name ਲਈ ਕੋਈ ਡਾਊਨਲੋਡ ਕੀਤੇ ਟਰੈਕ ਨਹੀਂ ਮਿਲੇ।';
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
    return '\"$name\" ਹਟਾਉਣਾ ਹੈ?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes ਮਿੰਟ';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'ਐਪੀਸੋਡ $number';
  }

  @override
  String get seriesNotFound => 'ਲੜੀ ਨਹੀਂ ਮਿਲੀ';

  @override
  String get errorLoadingSeries => 'ਲੜੀ ਲੋਡ ਕਰਨ ਵਿੱਚ ਤਰੁੱਟੀ';

  @override
  String get downloadedEpisodes => 'ਡਾਊਨਲੋਡ ਕੀਤੇ ਐਪੀਸੋਡ';

  @override
  String seasonNumber(int number) {
    return 'ਸੀਜ਼ਨ $number';
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
    return '$season ਵਿੱਚ ਸਾਰੇ ਡਾਊਨਲੋਡ ਕੀਤੇ ਐਪੀਸੋਡ ਮਿਟਾਉਣੇ ਹਨ?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਐਪੀਸੋਡ',
      one: '1 ਐਪੀਸੋਡ',
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
    return '$count ਡਾਊਨਲੋਡ ਕੀਤੀਆਂ ਆਈਟਮਾਂ ਮਿਟਾਉਣੀਆਂ ਹਨ?';
  }

  @override
  String get musicAndAudiobooks => 'ਸੰਗੀਤ ਅਤੇ ਆਡੀਓਬੁੱਕਸ';

  @override
  String get images => 'ਚਿੱਤਰ';

  @override
  String get database => 'ਡਾਟਾਬੇਸ';

  @override
  String ofStorageLimit(String limit) {
    return '$limit ਸੀਮਾ ਵਿੱਚੋਂ';
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
    return '$count ਵਿਕਲਪ';
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
  String get themeMusicSettingsSubtitle => 'ਵੇਰਵਾ ਪੰਨੇ, ਹੋਮ ਕਤਾਰਾਂ ਅਤੇ ਵਾਲੀਅਮ';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'ਘਰੇਲੂ ਕਤਾਰਾਂ \'ਤੇ ਥੀਮ ਸੰਗੀਤ';

  @override
  String get playWhenBrowsingHomeScreen => 'ਹੋਮ ਸਕ੍ਰੀਨ ਬ੍ਰਾਊਜ਼ ਕਰਨ ਵੇਲੇ ਚਲਾਓ';

  @override
  String get loopThemeMusic => 'ਥੀਮ ਸੰਗੀਤ ਲੂਪ ਕਰੋ';

  @override
  String get loopThemeMusicSubtitle => 'ਟਰੈਕ ਨੂੰ ਇੱਕ ਵਾਰ ਚਲਾਉਣ ਦੀ ਬਜਾਏ ਦੁਹਰਾਓ';

  @override
  String get detailsBackgroundBlur => 'ਵੇਰਵੇ ਬੈਕਗ੍ਰਾਊਂਡ ਬਲਰ';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

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
  String get settingsScrollWheelAction => 'ਮਾਊਸ ਸਕ੍ਰੋਲ ਵ੍ਹੀਲ';

  @override
  String get settingsScrollWheelActionDescription =>
      'ਪਲੇਬੈਕ ਦੌਰਾਨ ਵੀਡੀਓ ਉੱਤੇ ਮਾਊਸ ਵ੍ਹੀਲ ਸਕ੍ਰੋਲ ਕਰਨ ਨਾਲ ਕੀ ਹੋਵੇ ਚੁਣੋ।';

  @override
  String get scrollWheelActionOff => 'ਬੰਦ';

  @override
  String get scrollWheelActionSeek => 'ਸੀਕ (ਅੱਗੇ / ਪਿੱਛੇ)';

  @override
  String get scrollWheelActionVolume => 'ਵਾਲੀਅਮ';

  @override
  String get playerTooltipVolume => 'ਵਾਲੀਅਮ';

  @override
  String get fit => 'ਫਿੱਟ';

  @override
  String get autoCrop => 'ਆਟੋ ਕ੍ਰੌਪ';

  @override
  String get stretch => 'ਖਿੱਚੋ';

  @override
  String get refreshRateSwitching => 'ਰਿਫ੍ਰੈਸ਼ ਰੇਟ ਸਵਿਚ ਕਰਨਾ';

  @override
  String get disabled => 'ਅਸਮਰੱਥ';

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
  String get fallbackAudioLanguage => 'ਬੈਕਅੱਪ ਆਡੀਓ ਭਾਸ਼ਾ';

  @override
  String get preferDefaultAudioTrack => 'ਡਿਫਾਲਟ ਆਡੀਓ ਟਰੈਕ ਨੂੰ ਤਰਜੀਹ ਦਿਓ';

  @override
  String get preferDefaultAudioTrackDescription =>
      'ਸਥਾਨਕ ਡੱਬ ਦੀ ਬਜਾਏ ਮੂਲ ਆਡੀਓ ਟਰੈਕ ਨੂੰ ਤਰਜੀਹ ਦਿਓ।';

  @override
  String get preferAudioDescription => 'ਆਡੀਓ ਵਰਣਨ ਟਰੈਕਾਂ ਨੂੰ ਤਰਜੀਹ ਦਿਓ';

  @override
  String get preferAudioDescriptionDescription =>
      'ਆਮ ਟਰੈਕਾਂ ਦੀ ਬਜਾਏ ਆਡੀਓ ਵਰਣਨ ਟਰੈਕਾਂ ਨੂੰ ਤਰਜੀਹ ਦਿਓ।';

  @override
  String get transcodingAudio => 'ਟ੍ਰਾਂਸਕੋਡਿੰਗ (ਆਡੀਓ)';

  @override
  String get directStreamRemux => 'ਡਾਇਰੈਕਟ ਸਟ੍ਰੀਮ (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'ਟ੍ਰਾਂਸਕੋਡਿੰਗ (ਬਿੱਟਰੇਟ ਜਾਂ ਰੈਜ਼ੋਲਿਊਸ਼ਨ)';

  @override
  String get transcodingVideoAndAudio => 'ਟ੍ਰਾਂਸਕੋਡਿੰਗ (ਵੀਡੀਓ ਅਤੇ ਆਡੀਓ)';

  @override
  String get transcodingVideo => 'ਟ੍ਰਾਂਸਕੋਡਿੰਗ (ਵੀਡੀਓ)';

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
  String get settingsAudioOutputMode => 'ਆਡੀਓ ਆਉਟਪੁੱਟ ਮੋਡ';

  @override
  String get settingsAudioOutputModeDescription =>
      'ਚੁਣੋ ਕਿ ਆਡੀਓ ਕਿਵੇਂ ਡੀਕੋਡ ਹੋਵੇ। AVR ਪਾਸਥਰੂ ਕੱਚੀਆਂ Dolby/DTS ਸਟ੍ਰੀਮਾਂ ਤੁਹਾਡੇ ਰਿਸੀਵਰ ਨੂੰ ਭੇਜਦਾ ਹੈ; ਆਟੋ ਜਾਂ ਡਾਊਨਮਿਕਸ ਸਥਾਨਕ ਤੌਰ \'ਤੇ ਡੀਕੋਡ ਕਰਦਾ ਹੈ।';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR ਪਾਸਥਰੂ';

  @override
  String get settingsAudioFallbackCodec => 'ਆਡੀਓ ਬੈਕਅੱਪ ਕੋਡੇਕ';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'ਜਦੋਂ ਸਰੋਤ ਸਟ੍ਰੀਮ ਸਿੱਧੀ-ਚਲਾਈ ਜਾਂ ਪਾਸ ਨਹੀਂ ਹੋ ਸਕਦੀ, ਤਾਂ ਮਲਟੀ-ਚੈਨਲ ਆਡੀਓ ਟ੍ਰਾਂਸਕੋਡ ਕਰਨ ਲਈ ਟਾਰਗੇਟ ਫਾਰਮੈਟ ਚੁਣੋ।';

  @override
  String get settingsAudioFallbackCodecAuto => 'ਆਟੋ ਖੋਜ\n(ਸਿਫਾਰਸ਼ੀ)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(ਡਿਫਾਲਟ)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(ਨੁਕਸਾਨ-ਰਹਿਤ)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(ਸਿਰਫ ਸਟੀਰੀਓ)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(ਕੁਸ਼ਲ)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(ਨੁਕਸਾਨ-ਰਹਿਤ)';

  @override
  String get settingsMaxAudioChannels => 'ਵੱਧ ਤੋਂ ਵੱਧ ਆਡੀਓ ਚੈਨਲ';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'ਆਪਣੇ ਆਡੀਓ ਸੈੱਟਅੱਪ ਦੇ ਵੱਧ ਤੋਂ ਵੱਧ ਚੈਨਲ ਸੰਰਚਿਤ ਕਰੋ। ਇਸ ਸੀਮਾ ਤੋਂ ਵੱਧ ਮਲਟੀ-ਚੈਨਲ ਸਟ੍ਰੀਮਾਂ ਡਾਊਨਮਿਕਸ ਜਾਂ ਟ੍ਰਾਂਸਕੋਡ ਹੋਣਗੀਆਂ।';

  @override
  String get settingsMaxAudioChannelsAuto => 'ਆਟੋ ਖੋਜ\n(ਹਾਰਡਵੇਅਰ ਡਿਫਾਲਟ)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 ਮੋਨੋ';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 ਸਟੀਰੀਓ';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 ਸਰਾਊਂਡ';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 ਕਵਾਡ੍ਰਾਫੋਨਿਕ';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 ਸਰਾਊਂਡ';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 ਸਰਾਊਂਡ';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 ਸਰਾਊਂਡ';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 ਸਰਾਊਂਡ';

  @override
  String get settingsAudioPassthroughAdvanced => 'ਪਾਸਥਰੂ (ਉੱਨਤ)';

  @override
  String get settingsAudioCodecPassthrough => 'ਕੋਡੇਕ ਪਾਸਥਰੂ';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'ਸਿਰਫ ਉਹ ਫਾਰਮੈਟ ਸਮਰੱਥ ਕਰੋ ਜੋ ਤੁਹਾਡਾ AVR ਜਾਂ HDMI ਸਿੰਕ ਸਮਰਥਨ ਕਰਦਾ ਹੈ।';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 ਪਾਸਥਰੂ';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) ਪਾਸਥਰੂ';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core ਪਾਸਥਰੂ';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA ਪਾਸਥਰੂ';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD ਪਾਸਥਰੂ';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos ਪਾਸਥਰੂ';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) ਬਾਹਰੀ ਡੀਕੋਡਰ ਨੂੰ ਬਿੱਟਸਟ੍ਰੀਮ ਕਰੋ।';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) ਉੱਤੇ Dolby Atmos ਬਾਹਰੀ ਡੀਕੋਡਰ ਨੂੰ ਬਿੱਟਸਟ੍ਰੀਮ ਕਰੋ।';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS core ਸਮੇਤ) ਬਾਹਰੀ ਡੀਕੋਡਰ ਨੂੰ ਬਿੱਟਸਟ੍ਰੀਮ ਕਰੋ।';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos ਮੈਟਾਡਾਟਾ ਨਾਲ Dolby TrueHD ਬਾਹਰੀ ਡੀਕੋਡਰ ਨੂੰ ਬਿੱਟਸਟ੍ਰੀਮ ਕਰੋ।';

  @override
  String get settingsDetectedAudioCapabilities => 'ਖੋਜੀਆਂ ਗਈਆਂ ਆਡੀਓ ਸਮਰੱਥਾਵਾਂ';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'ਅਜੇ ਕੋਈ ਰਨਟਾਈਮ ਸਮਰੱਥਾ ਸਨੈਪਸ਼ਾਟ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get settingsAudioRouteLabel => 'ਰੂਟ';

  @override
  String get settingsAudioDecodeLabel => 'ਡੀਕੋਡ';

  @override
  String get settingsAudioPassthroughLabel => 'ਪਾਸਥਰੂ';

  @override
  String get settingsAudioHdRoute => 'HD ਆਡੀਓ ਰੂਟ';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'ਸਪੀਕਰ';

  @override
  String get settingsAudioRouteHeadphones => 'ਹੈੱਡਫੋਨ';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'ਡਾਇਗਨੌਸਟਿਕਸ';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'ਵੀਡੀਓ ਪੱਧਰ';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'ਵੀਡੀਓ ਰੇਂਜ';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'ਉਪਸਿਰਲੇਖ ਕੋਡੇਕ';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs => 'ਮਨਜ਼ੂਰ ਆਡੀਓ ਕੋਡੇਕ';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS ਆਡੀਓ ਕੋਡੇਕ';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 ਆਡੀਓ ਕੋਡੇਕ';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif ਪਾਸਥਰੂ';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'ਸਰਗਰਮ ਆਡੀਓ ਰੂਟ';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport => 'ਰੂਟ HD ਆਡੀਓ ਸਮਰਥਨ';

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
    return '$valueਸ';
  }

  @override
  String get mediaQueuing => 'ਮੀਡੀਆ ਕਤਾਰਬੰਦੀ';

  @override
  String get autoQueueNextEpisodes => 'ਅਗਲੇ ਐਪੀਸੋਡਾਂ ਨੂੰ ਆਟੋ-ਕਤਾਰ ਕਰੋ';

  @override
  String get stillWatchingPrompt => 'ਅਜੇ ਵੀ ਪ੍ਰੋਂਪਟ ਦੇਖ ਰਿਹਾ ਹੈ';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes ਐਪੀਸੋਡ / $hoursਘੰਟੇ ਬਾਅਦ';
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
  String get subtitleMode => 'ਉਪਸਿਰਲੇਖ ਮੋਡ';

  @override
  String get subtitleModeFlagged => 'ਫਲੈਗ ਕੀਤੇ';

  @override
  String get subtitleModeAlways => 'ਹਮੇਸ਼ਾ';

  @override
  String get subtitleModeForeign => 'ਵਿਦੇਸ਼ੀ';

  @override
  String get subtitleModeForced => 'ਲਾਜ਼ਮੀ';

  @override
  String get subtitleModeFlaggedDescription =>
      'ਮੀਡੀਆ ਫਾਈਲ ਦੇ ਮੈਟਾਡਾਟਾ ਵਿੱਚ \"default\" ਜਾਂ \"forced\" ਵਜੋਂ ਅੰਦਰੂਨੀ ਤੌਰ \'ਤੇ ਫਲੈਗ ਕੀਤੇ ਟਰੈਕ ਚਲਾਉਂਦਾ ਹੈ।';

  @override
  String get subtitleModeAlwaysDescription =>
      'ਹਰ ਵਾਰ ਵੀਡੀਓ ਸ਼ੁਰੂ ਹੋਣ \'ਤੇ ਆਪਣੇ-ਆਪ ਉਪਸਿਰਲੇਖ ਲੋਡ ਕਰਕੇ ਦਿਖਾਉਂਦਾ ਹੈ।';

  @override
  String get subtitleModeForeignDescription =>
      'ਜੇ ਡਿਫਾਲਟ ਆਡੀਓ ਟਰੈਕ ਵਿਦੇਸ਼ੀ ਭਾਸ਼ਾ ਵਿੱਚ ਹੈ ਤਾਂ ਆਪਣੇ-ਆਪ ਉਪਸਿਰਲੇਖ ਚਾਲੂ ਕਰਦਾ ਹੈ।';

  @override
  String get subtitleModeForcedDescription =>
      'ਸਿਰਫ forced ਮੈਟਾਡਾਟਾ ਫਲੈਗ ਨਾਲ ਸਪੱਸ਼ਟ ਤੌਰ \'ਤੇ ਟੈਗ ਕੀਤੇ ਉਪਸਿਰਲੇਖ ਲੋਡ ਕਰਦਾ ਹੈ।';

  @override
  String get subtitleModeNoneDescription =>
      'ਆਪਣੇ-ਆਪ ਉਪਸਿਰਲੇਖ ਲੋਡਿੰਗ ਪੂਰੀ ਤਰ੍ਹਾਂ ਅਯੋਗ ਕਰਦਾ ਹੈ।';

  @override
  String get fallbackSubtitleLanguage => 'ਬੈਕਅੱਪ ਉਪਸਿਰਲੇਖ ਭਾਸ਼ਾ';

  @override
  String get subtitleStream => 'ਉਪਸਿਰਲੇਖ ਸਟ੍ਰੀਮ';

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
    return '$profile ਪ੍ਰੋਫਾਈਲ ਸੈਟਿੰਗਾਂ ਲੋਡ ਕੀਤੀਆਂ।';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile ਪ੍ਰੋਫਾਈਲ ਸੈਟਿੰਗਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ।';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'ਲੋਕਲ ਸੈਟਿੰਗਾਂ $profile ਪ੍ਰੋਫਾਈਲ ਨਾਲ ਸਿੰਕ ਕੀਤੀਆਂ।';
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
  String get reportDownloadsActivity => 'ਸਰਵਰ \'ਤੇ ਡਾਊਨਲੋਡ ਦਿਖਾਓ';

  @override
  String get reportDownloadsActivitySubtitle =>
      'ਸਰਵਰ ਐਡਮਿਨ ਨੂੰ ਡੈਸ਼ਬੋਰਡ ਵਿੱਚ ਤੁਹਾਡੇ ਟ੍ਰਾਂਸਕੋਡ ਕੀਤੇ ਡਾਊਨਲੋਡ ਦੇਖਣ ਦਿਓ';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get navbarAlwaysExpanded => 'ਨੈਵਬਾਰ ਲੇਬਲ ਹਮੇਸ਼ਾ ਵਿਸਤ੍ਰਿਤ ਕਰੋ';

  @override
  String get showSeerrButton => 'Seerr ਬਟਨ ਦਿਖਾਓ';

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
  String get groupItemsIntoCollections => 'ਆਈਟਮਾਂ ਨੂੰ ਸੰਗ੍ਰਹਿ ਵਿੱਚ ਸਮੂਹ ਕਰੋ';

  @override
  String get hideCollectionAssociatedItems =>
      'ਲਾਇਬ੍ਰੇਰੀਆਂ ਬ੍ਰਾਊਜ਼ ਕਰਦੇ ਸਮੇਂ ਸੰਗ੍ਰਹਿ ਨਾਲ ਜੁੜੀਆਂ ਲਾਇਬ੍ਰੇਰੀ ਆਈਟਮਾਂ ਲੁਕਾਓ';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'ਲਾਇਬ੍ਰੇਰੀ ਸਮੂਹੀਕਰਨ ਸੂਚਨਾ';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'ਇਸ ਸੈਟਿੰਗ ਨੂੰ ਵਰਤਣ ਲਈ, ਕਿਰਪਾ ਕਰਕੇ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ Jellyfin ਜਾਂ Emby ਸਰਵਰ \'ਤੇ ਤੁਹਾਡੀ ਲਾਇਬ੍ਰੇਰੀ ਦੀਆਂ Display ਸੈਟਿੰਗਾਂ ਹੇਠ \"Group movies into collections\" ਅਤੇ/ਜਾਂ \"Group shows into collections\" ਲਾਇਬ੍ਰੇਰੀ ਸੈਟਿੰਗਾਂ ਸਮਰੱਥ ਹਨ।';

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
    return '$count ਚੁਣੇ ਗਏ';
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
  String get mediaBarModeMoonfin => 'Moonfin';

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
  String get trailerAudio => 'ਟ੍ਰੇਲਰ ਆਡੀਓ';

  @override
  String get enableTrailerAudio => 'ਮੀਡੀਆ ਬਾਰ ਵਿੱਚ ਟ੍ਰੇਲਰਾਂ ਲਈ ਆਡੀਓ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription =>
      'Show captions on YouTube trailers in the media bar';

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
  String get fullScreenRows => 'ਵਿਸਤ੍ਰਿਤ ਹੋਮ ਕਤਾਰਾਂ';

  @override
  String get fullScreenRowsDescription =>
      'ਹੋਮ ਕਤਾਰਾਂ ਨੂੰ ਪ੍ਰਤੀ ਸਕ੍ਰੀਨ 1 ਕਤਾਰ ਤੱਕ ਸੀਮਿਤ ਕਰੋ';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'ਪ੍ਰਤੀ ਕਤਾਰ ਚਿੱਤਰ ਦੀ ਕਿਸਮ';

  @override
  String get perRowSettings => 'ਪ੍ਰਤੀ-ਕਤਾਰ ਸੈਟਿੰਗਾਂ';

  @override
  String get autoLogin => 'ਆਟੋ ਲੌਗਇਨ';

  @override
  String get lastUser => 'ਆਖਰੀ ਉਪਭੋਗਤਾ';

  @override
  String get currentUser => 'ਮੌਜੂਦਾ ਯੂਜ਼ਰ';

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
    return '$minutes ਮਿੰਟ';
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
  String get clockModeStatic => 'ਸਥਿਰ';

  @override
  String get clockModeBouncing => 'ਉਛਲਦਾ';

  @override
  String get rottenTomatoesCritics => 'ਸੜੇ ਹੋਏ ਟਮਾਟਰ (ਆਲੋਚਕ)';

  @override
  String get rottenTomatoesAudience => 'ਸੜੇ ਹੋਏ ਟਮਾਟਰ (ਦਰਸ਼ਕ)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'ਮੈਟਾਕ੍ਰਿਟਿਕ';

  @override
  String get metacriticUser => 'ਮੈਟਾਕ੍ਰਿਟਿਕ (ਉਪਭੋਗਤਾ)';

  @override
  String get trakt => 'Trakt';

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
  String get pluginLabel => 'Moonbase ਪਲੱਗਇਨ';

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
    return '$status\nਸੰਸਕਰਣ: $version';
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
  String get seerrDiscoveryRows => 'Seerr ਖੋਜ ਕਤਾਰਾਂ';

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
  String get seerrNotificationsSection => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get seerrNotifyNewRequestsTitle => 'ਨਵੀਂ ਬੇਨਤੀ ਸੂਚਨਾਵਾਂ';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'ਜਦੋਂ ਕੋਈ ਬੇਨਤੀ ਭੇਜੇ ਤਾਂ ਮੈਨੂੰ ਸੁਚੇਤ ਕਰੋ';

  @override
  String get seerrNotifyLibraryAddedTitle => 'ਬੇਨਤੀ ਅੱਪਡੇਟ';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'ਮਨਜ਼ੂਰ, ਅਸਵੀਕਾਰ ਅਤੇ ਤੁਹਾਡੀ ਲਾਇਬ੍ਰੇਰੀ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤਾ';

  @override
  String get seerrNotifyIssuesTitle => 'ਮੁੱਦਾ ਅੱਪਡੇਟ';

  @override
  String get seerrNotifyIssuesSubtitle => 'ਨਵੇਂ ਮੁੱਦੇ, ਜਵਾਬ ਅਤੇ ਹੱਲ';

  @override
  String loggedInAs(String username) {
    return 'ਇਸ ਵਜੋਂ ਲੌਗ ਇਨ: $username';
  }

  @override
  String get discoverRows => 'Seerr ਖੋਜ ਪੰਨਾ';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr ਮੇਨਪੇਜ \'ਤੇ ਦੇਖਣ ਲਈ ਕਤਾਰਾਂ ਸਮਰੱਥ ਕਰੋ। ਮੁੜ-ਕ੍ਰਮਬੱਧ ਕਰਨ ਲਈ ਖਿੱਚੋ। ਕਸਟਮ ਕ੍ਰਮ Moonbase ਨਾਲ ਸਿੰਕ ਹੁੰਦਾ ਹੈ।';

  @override
  String get discoverRowsDescription =>
      'Seerr ਮੇਨਪੇਜ \'ਤੇ ਦੇਖਣ ਲਈ ਕਤਾਰਾਂ ਸਮਰੱਥ ਕਰੋ। ਮੁੜ-ਕ੍ਰਮਬੱਧ ਕਰਨ ਲਈ ਖਿੱਚੋ। ਕਸਟਮ ਕ੍ਰਮ Moonbase ਨਾਲ ਸਿੰਕ ਹੁੰਦਾ ਹੈ।';

  @override
  String get enabled => 'ਸਮਰੱਥ';

  @override
  String get hidden => 'ਲੁਕਿਆ ਹੋਇਆ';

  @override
  String get aboutTitle => 'ਬਾਰੇ';

  @override
  String versionValue(String version) {
    return 'ਸੰਸਕਰਣ $version';
  }

  @override
  String get openSourceLicenses => 'ਓਪਨ ਸੋਰਸ ਲਾਇਸੰਸ';

  @override
  String get sourceCode => 'ਸਰੋਤ ਕੋਡ';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'ਅੱਪਡੇਟ ਉਪਲਬਧ: v$version';
  }

  @override
  String get updateNotifications => 'ਸੂਚਨਾਵਾਂ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get showWhenUpdatesAvailable => 'ਅੱਪਡੇਟ ਉਪਲਬਧ ਹੋਣ \'ਤੇ ਦਿਖਾਓ';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version ਉਪਲਬਧ';
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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'ਚਿੱਤਰ ਕੈਸ਼ ਸੀਮਾ';

  @override
  String get clearImageCache => 'ਚਿੱਤਰ ਕੈਸ਼ ਸਾਫ਼ ਕਰੋ';

  @override
  String get imageCacheCleared => 'ਚਿੱਤਰ ਕੈਸ਼ ਸਾਫ਼ ਕੀਤਾ';

  @override
  String get clear => 'ਸਾਫ਼ ਕਰੋ';

  @override
  String get browse => 'ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get noResults => 'ਕੋਈ ਨਤੀਜਾ ਨਹੀਂ';

  @override
  String get seerrAvailableStatus => 'ਉਪਲਬਧ ਹੈ';

  @override
  String get seerrRequestedStatus => 'ਬੇਨਤੀ ਕੀਤੀ';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'ਡਾਊਨਲੋਡ ਹੋ ਰਿਹਾ · $percent%';
  }

  @override
  String get seerrImportingStatus => 'ਆਯਾਤ ਹੋ ਰਿਹਾ';

  @override
  String itemsCount(int count) {
    return '$count ਆਈਟਮਾਂ';
  }

  @override
  String get seerrSettings => 'Seerr ਸੈਟਿੰਗਾਂ';

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
    return '$name ਦੁਆਰਾ ਬੇਨਤੀ ਕੀਤੀ';
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
    return '\"$title\" ਲਈ ਬੇਨਤੀ ਰੱਦ ਕਰਨੀ ਹੈ?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" ਲਈ $count ਬੇਨਤੀਆਂ ਰੱਦ ਕਰਨੀਆਂ ਹਨ?';
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
    return 'ਬਜਟ: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'ਆਮਦਨ: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type ਦੀ ਬੇਨਤੀ ਕਰੋ';
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
  String get appearances => 'ਪੇਸ਼ਕਾਰੀਆਂ';

  @override
  String get crewSection => 'ਚਾਲਕ ਦਲ';

  @override
  String ageValue(int age) {
    return 'ਉਮਰ $age';
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
  String get failedStatus => 'ਅਸਫਲ';

  @override
  String get processingStatus => 'ਪ੍ਰੋਸੈਸਿੰਗ';

  @override
  String modifiedByName(String name) {
    return '$name ਦੁਆਰਾ ਸੋਧਿਆ';
  }

  @override
  String get completedStatus => 'ਪੂਰਾ ਹੋਇਆ';

  @override
  String get requestErrorDuplicate => 'ਇਸ ਸਿਰਲੇਖ ਦੀ ਪਹਿਲਾਂ ਹੀ ਬੇਨਤੀ ਕੀਤੀ ਗਈ ਸੀ';

  @override
  String get requestErrorQuota => 'ਬੇਨਤੀ ਸੀਮਾ ਪੂਰੀ ਹੋ ਗਈ';

  @override
  String get requestErrorBlocklisted => 'ਇਹ ਸਿਰਲੇਖ ਬਲਾਕਸੂਚੀ ਵਿੱਚ ਹੈ';

  @override
  String get requestErrorNoSeasons => 'ਬੇਨਤੀ ਕਰਨ ਲਈ ਕੋਈ ਸੀਜ਼ਨ ਬਾਕੀ ਨਹੀਂ';

  @override
  String get requestErrorPermission => 'ਤੁਹਾਨੂੰ ਇਹ ਬੇਨਤੀ ਕਰਨ ਦੀ ਅਨੁਮਤੀ ਨਹੀਂ ਹੈ';

  @override
  String get seerrRequestsTitle => 'ਬੇਨਤੀਆਂ';

  @override
  String get seerrIssuesTitle => 'ਮੁੱਦੇ';

  @override
  String get sortNewest => 'ਨਵੀਨਤਮ';

  @override
  String get sortLastModified => 'ਆਖਰੀ ਵਾਰ ਸੋਧਿਆ';

  @override
  String get noIssues => 'ਕੋਈ ਮੁੱਦੇ ਨਹੀਂ';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit ਫਿਲਮ ਬੇਨਤੀਆਂ ਵਿੱਚੋਂ $remaining ਬਾਕੀ';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit ਸੀਜ਼ਨ ਬੇਨਤੀਆਂ ਵਿੱਚੋਂ $remaining ਬਾਕੀ';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name ਦਾ ਹਿੱਸਾ';
  }

  @override
  String get viewCollection => 'ਸੰਗ੍ਰਹਿ ਦੇਖੋ';

  @override
  String get requestCollection => 'ਸੰਗ੍ਰਹਿ ਦੀ ਬੇਨਤੀ ਕਰੋ';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total ਫਿਲਮਾਂ · $available ਉਪਲਬਧ';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count ਫਿਲਮਾਂ ਦੀ ਬੇਨਤੀ ਕਰੋ';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total ਵਿੱਚੋਂ $current ਦੀ ਬੇਨਤੀ ਹੋ ਰਹੀ ਹੈ...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count ਫਿਲਮਾਂ ਦੀ ਬੇਨਤੀ ਕੀਤੀ';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total ਵਿੱਚੋਂ $ok ਫਿਲਮਾਂ ਦੀ ਬੇਨਤੀ ਕੀਤੀ';
  }

  @override
  String get collectionAllRequested =>
      'ਸਾਰੀਆਂ ਫਿਲਮਾਂ ਪਹਿਲਾਂ ਹੀ ਉਪਲਬਧ ਹਨ ਜਾਂ ਬੇਨਤੀ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ';

  @override
  String get reportIssue => 'ਮੁੱਦਾ ਰਿਪੋਰਟ ਕਰੋ';

  @override
  String get issueTypeVideo => 'ਵੀਡੀਓ';

  @override
  String get issueTypeAudio => 'ਆਡੀਓ';

  @override
  String get whatsWrong => 'ਕੀ ਗਲਤ ਹੈ?';

  @override
  String get allEpisodes => 'ਸਾਰੇ ਐਪੀਸੋਡ';

  @override
  String get episode => 'ਐਪੀਸੋਡ';

  @override
  String get openStatus => 'ਖੁੱਲ੍ਹਾ';

  @override
  String get resolvedStatus => 'ਹੱਲ ਕੀਤਾ';

  @override
  String get resolveAction => 'ਹੱਲ ਕਰੋ';

  @override
  String get reopenAction => 'ਮੁੜ ਖੋਲ੍ਹੋ';

  @override
  String reportedByName(String name) {
    return '$name ਦੁਆਰਾ ਰਿਪੋਰਟ ਕੀਤਾ';
  }

  @override
  String commentsCount(int count) {
    return '$count ਟਿੱਪਣੀਆਂ';
  }

  @override
  String get addComment => 'ਇੱਕ ਟਿੱਪਣੀ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get deleteIssueConfirm => 'ਇਹ ਮੁੱਦਾ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get submitReport => 'ਰਿਪੋਰਟ ਭੇਜੋ';

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
  String get seasonsLabel => 'ਸੀਜ਼ਨ';

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
  String get edit => 'ਸੋਧੋ';

  @override
  String get encoding => 'ਏਨਕੋਡਿੰਗ';

  @override
  String get error => 'ਗਲਤੀ';

  @override
  String get forward => 'ਅੱਗੇ';

  @override
  String get general => 'ਆਮ';

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
  String get search => 'ਖੋਜੋ';

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
  String get stop => 'ਰੋਕੋ';

  @override
  String get streaming => 'ਸਟ੍ਰੀਮਿੰਗ';

  @override
  String get time => 'ਸਮਾਂ';

  @override
  String get trickplay => 'Trickplay';

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
  String get mute => 'ਮਿਊਟ ਕਰੋ';

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
  String get adminDrawerDisplay => 'ਡਿਸਪਲੇ';

  @override
  String get adminDrawerMetadata => 'ਮੈਟਾਡਾਟਾ';

  @override
  String get adminDrawerNfo => 'NFO ਸੈਟਿੰਗਾਂ';

  @override
  String get adminDrawerTranscoding => 'ਟ੍ਰਾਂਸਕੋਡਿੰਗ';

  @override
  String get adminDrawerResume => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get adminDrawerStreaming => 'ਸਟ੍ਰੀਮਿੰਗ';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
    return 'ਪਲੱਗਇਨ ਅੱਪਡੇਟ ਉਪਲਬਧ: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'ਮੁੜ-ਚਾਲੂ ਦੀ ਲੋੜ ਵਾਲੇ ਪਲੱਗਇਨ: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'ਅਸਫਲ ਨਿਰਧਾਰਿਤ ਕਾਰਜ: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'ਹਾਲੀਆ ਚੇਤਾਵਨੀ/ਗਲਤੀ ਐਂਟਰੀਆਂ: $count';
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
    return 'ਗਲਤੀ: $error';
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
    return 'ਕਮਾਂਡ ਅਸਫਲ: $error';
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
  String get adminActivitySeverityAll => 'ਸਾਰੀਆਂ ਗੰਭੀਰਤਾਵਾਂ';

  @override
  String get adminActivityDateRange => 'ਮਿਤੀ ਰੇਂਜ';

  @override
  String adminActivityLoadFailed(String error) {
    return 'ਗਤੀਵਿਧੀ ਲੌਗ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return 'ਡਿਵਾਈਸ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminDeleteDevice => 'ਡਿਵਾਈਸ ਮਿਟਾਓ';

  @override
  String get adminDeviceDeleted => 'ਡੀਵਾਈਸ ਮਿਟਾਇਆ ਗਿਆ';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'ਡਿਵਾਈਸ ਮਿਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'ਡਿਵਾਈਸ \'$name\' ਹਟਾਉਣਾ ਹੈ? ਯੂਜ਼ਰ ਨੂੰ ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਮੁੜ ਸਾਈਨ ਇਨ ਕਰਨਾ ਪਵੇਗਾ।';
  }

  @override
  String get adminDeleteAllDevices => 'ਸਾਰੇ ਡਿਵਾਈਸ ਮਿਟਾਓ';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count ਡਿਵਾਈਸ ਹਟਾਉਣੇ ਹਨ? ਪ੍ਰਭਾਵਿਤ ਯੂਜ਼ਰਾਂ ਨੂੰ ਮੁੜ ਸਾਈਨ ਇਨ ਕਰਨਾ ਪਵੇਗਾ। ਤੁਹਾਡਾ ਮੌਜੂਦਾ ਡਿਵਾਈਸ ਪ੍ਰਭਾਵਿਤ ਨਹੀਂ ਹੁੰਦਾ।';
  }

  @override
  String get adminDevicesDeletedAll => 'ਡਿਵਾਈਸ ਹਟਾਏ ਗਏ';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'ਕੁਝ ਡਿਵਾਈਸ ਹਟਾਏ ਗਏ; $count ਨੂੰ ਹਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ।';
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
    return 'ਸਕੈਨ ਸ਼ੁਰੂ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminRenameLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਦਾ ਨਾਮ ਬਦਲੋ';

  @override
  String get adminNewName => 'ਨਵਾਂ ਨਾਮ';

  @override
  String adminLibraryRenamed(String name) {
    return 'ਲਾਇਬ੍ਰੇਰੀ ਦਾ ਨਾਮ \"$name\" ਰੱਖਿਆ ਗਿਆ';
  }

  @override
  String adminRenameFailed(String error) {
    return 'ਨਾਮ ਬਦਲਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminDeleteLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਮਿਟਾਓ';

  @override
  String adminLibraryDeleted(String name) {
    return 'ਲਾਇਬ੍ਰੇਰੀ \"$name\" ਮਿਟਾਈ ਗਈ';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'ਲਾਇਬ੍ਰੇਰੀ ਮਿਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'ਪਾਥ ਸ਼ਾਮਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminRemovePath => 'ਮਾਰਗ ਹਟਾਓ';

  @override
  String adminRemovePathConfirm(String path) {
    return 'ਇਸ ਲਾਇਬ੍ਰੇਰੀ ਵਿੱਚੋਂ \"$path\" ਹਟਾਉਣਾ ਹੈ?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'ਪਾਥ ਹਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'ਲਾਇਬ੍ਰੇਰੀ ਵਿਕਲਪ ਸੁਰੱਖਿਅਤ ਕੀਤੇ ਗਏ';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'ਵਿਕਲਪ ਸੇਵ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
  String get adminLibraryTabPaths => 'ਪਾਥ';

  @override
  String get adminLibraryTabOptions => 'ਵਿਕਲਪ';

  @override
  String get adminLibraryTabDownloaders => 'ਡਾਊਨਲੋਡਰ';

  @override
  String get adminLibMetadataSavers => 'ਮੈਟਾਡਾਟਾ ਸੇਵਰ';

  @override
  String get adminLibSubtitleDownloaders => 'ਉਪਸਿਰਲੇਖ ਡਾਊਨਲੋਡਰ';

  @override
  String get adminLibLyricDownloaders => 'ਬੋਲ ਡਾਊਨਲੋਡਰ';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'ਮੈਟਾਡਾਟਾ ਡਾਊਨਲੋਡਰ: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'ਚਿੱਤਰ ਫੈਚਰ: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'ਇਹ ਸਰਵਰ ਇਸ ਲਾਇਬ੍ਰੇਰੀ ਕਿਸਮ ਲਈ ਕੋਈ ਡਾਊਨਲੋਡਰ ਪੇਸ਼ ਨਹੀਂ ਕਰਦਾ।';

  @override
  String get adminLibrarySectionGeneral => 'ਆਮ';

  @override
  String get adminLibrarySectionMetadata => 'ਮੈਟਾਡਾਟਾ';

  @override
  String get adminLibrarySectionEmbedded => 'ਏਮਬੈੱਡਡ ਜਾਣਕਾਰੀ';

  @override
  String get adminLibrarySectionSubtitles => 'ਉਪਸਿਰਲੇਖ';

  @override
  String get adminLibrarySectionImages => 'ਚਿੱਤਰ';

  @override
  String get adminLibrarySectionSeries => 'ਸੀਰੀਜ਼';

  @override
  String get adminLibrarySectionMusic => 'ਸੰਗੀਤ';

  @override
  String get adminLibrarySectionMovies => 'ਫਿਲਮਾਂ';

  @override
  String get adminLibRealtimeMonitor => 'ਰੀਅਲ-ਟਾਈਮ ਨਿਗਰਾਨੀ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminLibRealtimeMonitorHint =>
      'ਫਾਈਲ ਬਦਲਾਵਾਂ ਦਾ ਪਤਾ ਲਗਾ ਕੇ ਉਹਨਾਂ ਨੂੰ ਆਪਣੇ-ਆਪ ਪ੍ਰੋਸੈਸ ਕਰੋ।';

  @override
  String get adminLibArchiveMediaFiles => 'ਆਰਕਾਈਵਾਂ ਨੂੰ ਮੀਡੀਆ ਫਾਈਲਾਂ ਵਜੋਂ ਸਮਝੋ';

  @override
  String get adminLibEnablePhotos => 'ਫੋਟੋ ਦਿਖਾਓ';

  @override
  String get adminLibSaveLocalMetadata => 'ਆਰਟਵਰਕ ਮੀਡੀਆ ਫੋਲਡਰਾਂ ਵਿੱਚ ਸੇਵ ਕਰੋ';

  @override
  String get adminLibRefreshInterval => 'ਆਟੋਮੈਟਿਕ ਮੈਟਾਡਾਟਾ ਤਾਜ਼ਾ ਕਰਨਾ';

  @override
  String get adminLibRefreshNever => 'ਕਦੇ ਨਹੀਂ';

  @override
  String get adminLibDefault => 'ਡਿਫਾਲਟ';

  @override
  String get adminLibDisplayTitle => 'ਡਿਸਪਲੇ';

  @override
  String get adminLibDisplaySection => 'ਲਾਇਬ੍ਰੇਰੀ ਡਿਸਪਲੇ';

  @override
  String get adminLibFolderView =>
      'ਸਾਦੇ ਮੀਡੀਆ ਫੋਲਡਰ ਦਿਖਾਉਣ ਲਈ ਇੱਕ ਫੋਲਡਰ ਦ੍ਰਿਸ਼ ਦਿਖਾਓ';

  @override
  String get adminLibSpecialsInSeasons =>
      'ਵਿਸ਼ੇਸ਼ ਨੂੰ ਉਹਨਾਂ ਸੀਜ਼ਨਾਂ ਵਿੱਚ ਦਿਖਾਓ ਜਿਨ੍ਹਾਂ ਵਿੱਚ ਉਹ ਪ੍ਰਸਾਰਿਤ ਹੋਏ';

  @override
  String get adminLibGroupMovies => 'ਫਿਲਮਾਂ ਨੂੰ ਸੰਗ੍ਰਹਿ ਵਿੱਚ ਸਮੂਹ ਕਰੋ';

  @override
  String get adminLibGroupShows => 'ਸ਼ੋਅ ਨੂੰ ਸੰਗ੍ਰਹਿ ਵਿੱਚ ਸਮੂਹ ਕਰੋ';

  @override
  String get adminLibExternalSuggestions => 'ਸੁਝਾਵਾਂ ਵਿੱਚ ਬਾਹਰੀ ਸਮੱਗਰੀ ਦਿਖਾਓ';

  @override
  String get adminLibDateAddedSection => 'ਸ਼ਾਮਲ ਕਰਨ ਦੀ ਮਿਤੀ ਦਾ ਵਿਹਾਰ';

  @override
  String get adminLibDateAddedLabel => 'ਸ਼ਾਮਲ ਕਰਨ ਦੀ ਮਿਤੀ ਇੱਥੋਂ ਵਰਤੋ';

  @override
  String get adminLibDateAddedImport => 'ਲਾਇਬ੍ਰੇਰੀ ਵਿੱਚ ਸਕੈਨ ਕੀਤੀ ਮਿਤੀ';

  @override
  String get adminLibDateAddedFile => 'ਫਾਈਲ ਬਣਾਏ ਜਾਣ ਦੀ ਮਿਤੀ';

  @override
  String get adminLibMetadataTitle => 'ਮੈਟਾਡਾਟਾ ਅਤੇ ਚਿੱਤਰ';

  @override
  String get adminLibMetadataLangSection => 'ਤਰਜੀਹੀ ਮੈਟਾਡਾਟਾ ਭਾਸ਼ਾ';

  @override
  String get adminLibChaptersSection => 'ਅਧਿਆਏ';

  @override
  String get adminLibDummyChapterDuration => 'ਡਮੀ ਅਧਿਆਏ ਮਿਆਦ (ਸਕਿੰਟ)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'ਉਸ ਮੀਡੀਆ ਲਈ ਬਣਾਏ ਗਏ ਅਧਿਆਵਾਂ ਦੀ ਲੰਬਾਈ ਜਿਸ ਦੇ ਕੋਈ ਨਹੀਂ ਹਨ। ਅਯੋਗ ਕਰਨ ਲਈ 0 \'ਤੇ ਸੈੱਟ ਕਰੋ।';

  @override
  String get adminLibChapterImageResolution => 'ਅਧਿਆਏ ਚਿੱਤਰ ਰੈਜ਼ੋਲਿਊਸ਼ਨ';

  @override
  String get adminLibNfoTitle => 'NFO ਸੈਟਿੰਗਾਂ';

  @override
  String get adminLibNfoHelp =>
      'NFO ਮੈਟਾਡਾਟਾ Kodi ਅਤੇ ਸਮਾਨ ਕਲਾਇੰਟਾਂ ਨਾਲ ਅਨੁਕੂਲ ਹੈ। ਸੈਟਿੰਗਾਂ ਉਹਨਾਂ ਸਾਰੀਆਂ ਲਾਇਬ੍ਰੇਰੀਆਂ \'ਤੇ ਲਾਗੂ ਹੁੰਦੀਆਂ ਹਨ ਜੋ NFO ਮੈਟਾਡਾਟਾ ਸੇਵ ਕਰਦੀਆਂ ਹਨ।';

  @override
  String get adminLibKodiUser =>
      'NFO ਫਾਈਲਾਂ ਵਿੱਚ ਦੇਖਣ ਡੇਟਾ ਸਟੋਰ ਕਰਨ ਵਾਲਾ ਯੂਜ਼ਰ';

  @override
  String get adminLibSaveImagePaths => 'NFO ਫਾਈਲਾਂ ਵਿੱਚ ਚਿੱਤਰ ਪਾਥ ਸੇਵ ਕਰੋ';

  @override
  String get adminLibPathSubstitution =>
      'NFO ਚਿੱਤਰ ਪਾਥਾਂ ਲਈ ਪਾਥ ਬਦਲੀ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart ਚਿੱਤਰਾਂ ਨੂੰ extrathumbs ਫੋਲਡਰ ਵਿੱਚ ਕਾਪੀ ਕਰੋ';

  @override
  String get adminLibNone => 'ਕੋਈ ਨਹੀਂ';

  @override
  String adminLibRefreshDays(int days) {
    return '$days ਦਿਨ';
  }

  @override
  String get adminLibEmbeddedTitles => 'ਏਮਬੈੱਡਡ ਸਿਰਲੇਖ ਵਰਤੋ';

  @override
  String get adminLibEmbeddedExtrasTitles => 'ਵਾਧੂ ਲਈ ਏਮਬੈੱਡਡ ਸਿਰਲੇਖ ਵਰਤੋ';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'ਏਮਬੈੱਡਡ ਐਪੀਸੋਡ ਜਾਣਕਾਰੀ ਵਰਤੋ';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'ਏਮਬੈੱਡਡ ਉਪਸਿਰਲੇਖ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminLibEmbeddedAllowAll => 'ਸਭ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminLibEmbeddedAllowText => 'ਸਿਰਫ ਟੈਕਸਟ';

  @override
  String get adminLibEmbeddedAllowImage => 'ਸਿਰਫ ਚਿੱਤਰ';

  @override
  String get adminLibEmbeddedAllowNone => 'ਕੋਈ ਨਹੀਂ';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'ਜੇ ਏਮਬੈੱਡਡ ਉਪਸਿਰਲੇਖ ਮੌਜੂਦ ਹਨ ਤਾਂ ਡਾਊਨਲੋਡ ਛੱਡੋ';

  @override
  String get adminLibSkipIfAudioMatches =>
      'ਜੇ ਆਡੀਓ ਟਰੈਕ ਡਾਊਨਲੋਡ ਭਾਸ਼ਾ ਨਾਲ ਮੇਲ ਖਾਂਦਾ ਹੈ ਤਾਂ ਡਾਊਨਲੋਡ ਛੱਡੋ';

  @override
  String get adminLibRequirePerfectMatch => 'ਸੰਪੂਰਨ ਉਪਸਿਰਲੇਖ ਮੇਲ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'ਉਪਸਿਰਲੇਖ ਮੀਡੀਆ ਫੋਲਡਰਾਂ ਵਿੱਚ ਸੇਵ ਕਰੋ';

  @override
  String get adminLibChapterImageExtraction => 'ਅਧਿਆਏ ਚਿੱਤਰ ਕੱਢੋ';

  @override
  String get adminLibChapterImagesDuringScan =>
      'ਲਾਇਬ੍ਰੇਰੀ ਸਕੈਨ ਦੌਰਾਨ ਅਧਿਆਏ ਚਿੱਤਰ ਕੱਢੋ';

  @override
  String get adminLibTrickplayExtraction => 'Trickplay ਚਿੱਤਰ ਕੱਢਣਾ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminLibTrickplayDuringScan =>
      'ਲਾਇਬ੍ਰੇਰੀ ਸਕੈਨ ਦੌਰਾਨ Trickplay ਚਿੱਤਰ ਕੱਢੋ';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay ਚਿੱਤਰ ਮੀਡੀਆ ਫੋਲਡਰਾਂ ਵਿੱਚ ਸੇਵ ਕਰੋ';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'ਕਈ ਫੋਲਡਰਾਂ ਵਿੱਚ ਫੈਲੀਆਂ ਲੜੀਆਂ ਨੂੰ ਆਪਣੇ-ਆਪ ਮਿਲਾਓ';

  @override
  String get adminLibSeasonZeroName => 'ਸੀਜ਼ਨ ਜ਼ੀਰੋ ਡਿਸਪਲੇ ਨਾਮ';

  @override
  String get adminLibLufsScan => 'ਆਡੀਓ ਸਧਾਰਨੀਕਰਨ ਲਈ LUFS ਸਕੈਨ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminLibPreferNonstandardArtist =>
      'ਗੈਰ-ਮਿਆਰੀ ਕਲਾਕਾਰ ਟੈਗ ਨੂੰ ਤਰਜੀਹ ਦਿਓ';

  @override
  String get adminLibAutoAddToCollection =>
      'ਫਿਲਮਾਂ ਨੂੰ ਆਪਣੇ-ਆਪ ਸੰਗ੍ਰਹਿ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminLibraryNameRequired => 'ਲਾਇਬ੍ਰੇਰੀ ਦਾ ਨਾਮ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'ਲਾਇਬ੍ਰੇਰੀ ਬਣਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return '$name ਨੂੰ ਅਯੋਗ ਕਰਨਾ ਹੈ? ਉਹ ਸਾਈਨ ਇਨ ਨਹੀਂ ਕਰ ਸਕਣਗੇ।';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name ਨੂੰ ਯੋਗ ਕਰਨਾ ਹੈ? ਉਹ ਮੁੜ ਸਾਈਨ ਇਨ ਕਰ ਸਕਣਗੇ।';
  }

  @override
  String adminUserDisabled(String name) {
    return 'ਯੂਜ਼ਰ \"$name\" ਅਯੋਗ ਕੀਤਾ';
  }

  @override
  String adminUserEnabled(String name) {
    return 'ਯੂਜ਼ਰ \"$name\" ਯੋਗ ਕੀਤਾ';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'ਯੂਜ਼ਰ ਨੀਤੀ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return 'ਯੂਜ਼ਰ ਬਣਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return 'ਸੇਵ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminPermissionsSaved => 'ਇਜਾਜ਼ਤਾਂ ਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get adminPasswordsMismatch => 'ਪਾਸਵਰਡ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String adminFailed(String error) {
    return 'ਅਸਫਲ: $error';
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
  String get adminParentalControl => 'ਮਾਪਾ ਕੰਟਰੋਲ';

  @override
  String get adminMaxParentalRating => 'ਵੱਧ ਤੋਂ ਵੱਧ ਮਨਜ਼ੂਰ ਮਾਪਾ ਰੇਟਿੰਗ';

  @override
  String get adminMaxParentalRatingHint =>
      'ਉੱਚੀ ਰੇਟਿੰਗ ਵਾਲੀ ਸਮੱਗਰੀ ਇਸ ਯੂਜ਼ਰ ਤੋਂ ਲੁਕਾਈ ਜਾਵੇਗੀ।';

  @override
  String get adminParentalRatingNone => 'ਕੋਈ ਨਹੀਂ';

  @override
  String get adminBlockUnratedItems =>
      'ਬਿਨਾਂ ਜਾਂ ਅਣਪਛਾਤੀ ਰੇਟਿੰਗ ਜਾਣਕਾਰੀ ਵਾਲੀਆਂ ਆਈਟਮਾਂ ਬਲਾਕ ਕਰੋ';

  @override
  String get adminUnratedBook => 'ਕਿਤਾਬਾਂ';

  @override
  String get adminUnratedChannelContent => 'ਚੈਨਲ';

  @override
  String get adminUnratedLiveTvChannel => 'ਲਾਈਵ ਟੀਵੀ';

  @override
  String get adminUnratedMovie => 'ਫਿਲਮਾਂ';

  @override
  String get adminUnratedMusic => 'ਸੰਗੀਤ';

  @override
  String get adminUnratedTrailer => 'ਟ੍ਰੇਲਰ';

  @override
  String get adminUnratedSeries => 'ਸ਼ੋਅ';

  @override
  String get adminAccessSchedules => 'ਪਹੁੰਚ ਸਮਾਂ-ਸਾਰਣੀਆਂ';

  @override
  String get adminAccessSchedulesHint =>
      'ਸਿਰਫ ਹੇਠਾਂ ਦਿੱਤੇ ਨਿਰਧਾਰਿਤ ਸਮਿਆਂ ਦੌਰਾਨ ਪਹੁੰਚ ਦੀ ਆਗਿਆ ਦਿਓ। ਜਦੋਂ ਕੋਈ ਸਮਾਂ-ਸਾਰਣੀ ਸੈੱਟ ਨਹੀਂ ਹੁੰਦੀ ਤਾਂ ਸਾਰਾ ਦਿਨ ਪਹੁੰਚ ਦੀ ਆਗਿਆ ਹੁੰਦੀ ਹੈ।';

  @override
  String get adminAddSchedule => 'ਸਮਾਂ-ਸਾਰਣੀ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminScheduleDay => 'ਦਿਨ';

  @override
  String get adminScheduleStart => 'ਸ਼ੁਰੂ';

  @override
  String get adminScheduleEnd => 'ਅੰਤ';

  @override
  String get adminDayEveryday => 'ਹਰ ਦਿਨ';

  @override
  String get adminDayWeekday => 'ਹਫ਼ਤੇ ਦਾ ਦਿਨ';

  @override
  String get adminDayWeekend => 'ਹਫ਼ਤੇ ਦਾ ਅੰਤ';

  @override
  String get adminDaySunday => 'ਐਤਵਾਰ';

  @override
  String get adminDayMonday => 'ਸੋਮਵਾਰ';

  @override
  String get adminDayTuesday => 'ਮੰਗਲਵਾਰ';

  @override
  String get adminDayWednesday => 'ਬੁੱਧਵਾਰ';

  @override
  String get adminDayThursday => 'ਵੀਰਵਾਰ';

  @override
  String get adminDayFriday => 'ਸ਼ੁੱਕਰਵਾਰ';

  @override
  String get adminDaySaturday => 'ਸ਼ਨਿੱਚਰਵਾਰ';

  @override
  String get adminAllowedTags => 'ਮਨਜ਼ੂਰ ਟੈਗ';

  @override
  String get adminAllowedTagsHint =>
      'ਸਿਰਫ ਇਹਨਾਂ ਟੈਗਾਂ ਵਾਲੀ ਸਮੱਗਰੀ ਦਿਖਾਈ ਜਾਂਦੀ ਹੈ। ਸਭ ਦੀ ਆਗਿਆ ਦੇਣ ਲਈ ਖਾਲੀ ਛੱਡੋ।';

  @override
  String get adminBlockedTags => 'ਬਲਾਕ ਕੀਤੇ ਟੈਗ';

  @override
  String get adminBlockedTagsHint =>
      'ਇਹਨਾਂ ਟੈਗਾਂ ਵਾਲੀ ਸਮੱਗਰੀ ਇਸ ਯੂਜ਼ਰ ਤੋਂ ਲੁਕਾਈ ਜਾਂਦੀ ਹੈ।';

  @override
  String get adminAddTag => 'ਟੈਗ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminEnabledDevices => 'ਯੋਗ ਡਿਵਾਈਸ';

  @override
  String get adminEnabledChannels => 'ਯੋਗ ਚੈਨਲ';

  @override
  String get adminAuthProvider => 'ਪ੍ਰਮਾਣੀਕਰਨ ਪ੍ਰਦਾਤਾ';

  @override
  String get adminPasswordResetProvider => 'ਪਾਸਵਰਡ ਰੀਸੈਟ ਪ੍ਰਦਾਤਾ';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'ਲਾਕਆਉਟ ਤੋਂ ਪਹਿਲਾਂ ਵੱਧ ਤੋਂ ਵੱਧ ਅਸਫਲ ਲੌਗਇਨ ਕੋਸ਼ਿਸ਼ਾਂ';

  @override
  String get adminLoginAttemptsHint =>
      'ਡਿਫਾਲਟ ਲਈ 0, ਜਾਂ ਲਾਕਆਉਟ ਅਯੋਗ ਕਰਨ ਲਈ -1 \'ਤੇ ਸੈੱਟ ਕਰੋ।';

  @override
  String get adminSyncPlayAccess => 'SyncPlay ਪਹੁੰਚ';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'ਸਮੂਹ ਬਣਾਉਣ ਅਤੇ ਸ਼ਾਮਲ ਹੋਣ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminSyncPlayJoin => 'ਸਮੂਹਾਂ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਣ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminSyncPlayNone => 'ਕੋਈ ਪਹੁੰਚ ਨਹੀਂ';

  @override
  String get adminContentDeletionFolders => 'ਇੱਥੋਂ ਸਮੱਗਰੀ ਮਿਟਾਉਣ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminResetPasswordWarning =>
      'ਇਹ ਪਾਸਵਰਡ ਨੂੰ ਹਟਾ ਦੇਵੇਗਾ। ਉਪਭੋਗਤਾ ਬਿਨਾਂ ਪਾਸਵਰਡ ਦੇ ਲਾਗਇਨ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੇਗਾ।';

  @override
  String adminServerReturnedHttp(int status) {
    return 'ਸਰਵਰ ਨੇ HTTP $status ਵਾਪਸ ਕੀਤਾ';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ $name ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'ਯੂਜ਼ਰ \"$name\" ਮਿਟਾਇਆ';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'ਯੂਜ਼ਰ ਮਿਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return 'ਕੁੰਜੀ ਬਣਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminKeyTokenMissing => 'ਸਰਵਰ ਜਵਾਬ ਤੋਂ ਕੁੰਜੀ ਟੋਕਨ ਗੁੰਮ ਹੈ';

  @override
  String get adminRevokeApiKey => 'API ਕੁੰਜੀ ਨੂੰ ਰੱਦ ਕਰੋ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name ਲਈ ਕੁੰਜੀ ਰੱਦ ਕਰਨੀ ਹੈ?';
  }

  @override
  String get adminApiKeyRevoked => 'API ਕੁੰਜੀ ਰੱਦ ਕੀਤੀ ਗਈ';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'ਕੁੰਜੀ ਰੱਦ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return 'ਟੋਕਨ: $token\\nਬਣਾਇਆ: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'ਬੈਕਅੱਪ ਬਣਾਓ';

  @override
  String get adminBackupInclude => 'ਬੈਕਅੱਪ ਵਿੱਚ ਕੀ ਸ਼ਾਮਲ ਕਰਨਾ ਹੈ ਚੁਣੋ।';

  @override
  String get adminBackupDatabase => 'ਡਾਟਾਬੇਸ';

  @override
  String get adminBackupDatabaseAlways => 'ਹਮੇਸ਼ਾ ਸ਼ਾਮਲ';

  @override
  String get adminBackupMetadata => 'ਮੈਟਾਡਾਟਾ';

  @override
  String get adminBackupSubtitles => 'ਉਪਸਿਰਲੇਖ';

  @override
  String get adminBackupTrickplay => 'Trickplay ਚਿੱਤਰ';

  @override
  String get adminCreatingBackup => 'ਬੈਕਅੱਪ ਬਣਾਇਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get adminBackupCreated => 'ਬੈਕਅੱਪ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਇਆ ਗਿਆ';

  @override
  String adminBackupCreateFailed(String error) {
    return 'ਬੈਕਅੱਪ ਬਣਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminBackupPathMissing => 'ਸਰਵਰ ਜਵਾਬ ਵਿੱਚ ਬੈਕਅੱਪ ਮਾਰਗ ਗੁੰਮ ਹੈ';

  @override
  String adminBackupManifest(String name) {
    return 'ਮੈਨੀਫੈਸਟ: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'ਮੈਨੀਫੈਸਟ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminConfirmRestore => 'ਰੀਸਟੋਰ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get adminRestoringBackup => 'ਬੈਕਅੱਪ ਰੀਸਟੋਰ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String adminRestoreFailed(String error) {
    return 'ਬੈਕਅੱਪ ਬਹਾਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return '$path ਵਿੱਚ ਸੇਵ ਕੀਤਾ';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ਫਾਈਲ ਸੇਵ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';
  }

  @override
  String get adminSearchInLog => 'ਲੌਗ ਵਿੱਚ ਖੋਜ ਕਰੋ';

  @override
  String get adminNoMatchingLines => 'ਕੋਈ ਮੇਲ ਖਾਂਦੀਆਂ ਲਾਈਨਾਂ ਨਹੀਂ ਹਨ';

  @override
  String adminTasksLoadFailed(String error) {
    return 'ਕਾਰਜ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminNoScheduledTasks => 'ਕੋਈ ਨਿਯਤ ਕਾਰਜ ਨਹੀਂ ਮਿਲੇ';

  @override
  String get adminNoTasksMatchFilter =>
      'ਕੋਈ ਵੀ ਕਾਰਜ ਮੌਜੂਦਾ ਫਿਲਟਰ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ';

  @override
  String adminTaskStartFailed(String error) {
    return 'ਕਾਰਜ ਸ਼ੁਰੂ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'ਕਾਰਜ ਰੋਕਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'ਕਾਰਜ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminRunNow => 'ਹੁਣੇ ਚਲਾਓ';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ਟ੍ਰਿਗਰ ਹਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ਟ੍ਰਿਗਰ ਸ਼ਾਮਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return '$hours ਘੰਟੇ';
  }

  @override
  String get adminDayOfWeek => 'ਹਫ਼ਤੇ ਦਾ ਦਿਨ';

  @override
  String get adminSearchPlugins => 'ਪਲੱਗਇਨ ਖੋਜੋ...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'ਪਲੱਗਇਨ ਟੌਗਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminUninstallPlugin => 'ਪਲੱਗਇਨ ਨੂੰ ਅਣਇੰਸਟੌਲ ਕਰੋ';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ \"$name\" ਨੂੰ ਅਣਇੰਸਟਾਲ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'ਪਲੱਗਇਨ ਅਣਇੰਸਟਾਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'ਪੈਕੇਜ ਇੰਸਟਾਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'ਅੱਪਡੇਟ ਇੰਸਟਾਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'ਪਲੱਗਇਨ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'ਕੋਈ ਪਲੱਗਇਨ ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ';

  @override
  String get adminNoPluginsInstalled => 'ਕੋਈ ਪਲੱਗਇਨ ਸਥਾਪਤ ਨਹੀਂ ਹਨ';

  @override
  String adminInstallUpdate(String version) {
    return 'ਅੱਪਡੇਟ ਇੰਸਟਾਲ ਕਰੋ (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'ਕੈਟਾਲਾਗ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return '\"$name\" ਸਰਵਰ ਮੁੜ-ਚਾਲੂ ਹੋਣ ਤੋਂ ਬਾਅਦ ਹਟਾਇਆ ਜਾਵੇਗਾ';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'ਅਣਇੰਸਟਾਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" ਨੂੰ v$version \'ਤੇ ਅੱਪਡੇਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';
  }

  @override
  String get adminMissingAuthToken =>
      'ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹਣ ਵਿੱਚ ਅਸਮਰੱਥ: ਪ੍ਰਮਾਣਿਕਤਾ ਟੋਕਨ ਗੁੰਮ ਹੈ।';

  @override
  String adminPluginLoadFailed(String error) {
    return 'ਪਲੱਗਇਨ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminPluginNotFound => 'ਪਲੱਗਇਨ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String adminPluginVersion(String version) {
    return 'ਸੰਸਕਰਣ $version';
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
    return 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ \"$name\" ਨੂੰ ਹਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'ਰਿਪੋਜ਼ਟਰੀਆਂ ਸੇਵ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'ਰਿਪੋਜ਼ਟਰੀਆਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return 'ਪਲੱਗਇਨ ਸੈਟਿੰਗਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਮਰੱਥ: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri ਨਹੀਂ ਖੋਲ੍ਹਿਆ ਜਾ ਸਕਿਆ';
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
  String get adminTrickplaySaved => 'Trickplay ਸੈਟਿੰਗਾਂ ਸੇਵ ਕੀਤੀਆਂ';

  @override
  String get adminTrickplayLoadFailed => 'Trickplay ਸੈਟਿੰਗਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

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
  String get adminBaseUrlHint => 'ਜਿਵੇਂ /jellyfin';

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
    return 'ਮੈਟਾਡਾਟਾ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'ਮੈਟਾਡਾਟਾ ਸੇਵ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return 'ਮੈਟਾਡਾਟਾ ਤਾਜ਼ਾ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminNoRemoteMatches => 'ਕੋਈ ਰਿਮੋਟ ਮੇਲ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get adminRemoteResults => 'ਰਿਮੋਟ ਨਤੀਜੇ';

  @override
  String get adminRemoteMetadataApplied => 'ਰਿਮੋਟ ਮੈਟਾਡੇਟਾ ਲਾਗੂ ਕੀਤਾ ਗਿਆ';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'ਰਿਮੋਟ ਖੋਜ ਅਸਫਲ: $error';
  }

  @override
  String get adminUpdateContentType => 'ਸਮੱਗਰੀ ਦੀ ਕਿਸਮ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get adminContentType => 'ਸਮੱਗਰੀ ਦੀ ਕਿਸਮ';

  @override
  String get adminContentTypeUpdated => 'ਸਮੱਗਰੀ ਦੀ ਕਿਸਮ ਅੱਪਡੇਟ ਕੀਤੀ ਗਈ';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'ਸਮੱਗਰੀ ਕਿਸਮ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return '$imageType ਚਿੱਤਰ ਅੱਪਡੇਟ ਕੀਤਾ';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'ਚਿੱਤਰ ਡਾਊਨਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'ਅਸਮਰਥਿਤ ਚਿੱਤਰ ਫਾਰਮੈਟ';

  @override
  String get adminImageReadFailed => 'ਚੁਣੇ ਗਏ ਚਿੱਤਰ ਨੂੰ ਪੜ੍ਹਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType ਚਿੱਤਰ ਅੱਪਲੋਡ ਕੀਤਾ';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'ਚਿੱਤਰ ਅੱਪਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType ਚਿੱਤਰ ਮਿਟਾਓ';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType ਚਿੱਤਰ ਮਿਟਾਇਆ';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'ਚਿੱਤਰ ਮਿਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminAllProviders => 'ਸਾਰੇ ਪ੍ਰਦਾਤਾ';

  @override
  String get adminNoRemoteImages => 'ਕੋਈ ਰਿਮੋਟ ਚਿੱਤਰ ਨਹੀਂ ਮਿਲੇ';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'ਟਿਊਨਰ ਖੋਜ ਅਸਫਲ: $error';
  }

  @override
  String get adminAddTuner => 'ਟਿਊਨਰ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminEditTuner => 'ਟਿਊਨਰ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get adminTunerTypeM3u => 'M3U ਟਿਊਨਰ';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'ਫਾਈਲ ਜਾਂ URL';

  @override
  String get adminTunerIpAddress => 'ਟਿਊਨਰ IP ਪਤਾ';

  @override
  String get adminTunerFriendlyName => 'ਪਛਾਣ ਨਾਮ';

  @override
  String get adminTunerUserAgent => 'ਯੂਜ਼ਰ ਏਜੰਟ';

  @override
  String get adminTunerCount => 'ਇੱਕੋ ਸਮੇਂ ਕਨੈਕਸ਼ਨ ਸੀਮਾ';

  @override
  String get adminTunerCountHelp =>
      'ਟਿਊਨਰ ਇੱਕੋ ਵਾਰ ਜਿੰਨੀਆਂ ਸਟ੍ਰੀਮਾਂ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ ਉਹਨਾਂ ਦੀ ਵੱਧ ਤੋਂ ਵੱਧ ਗਿਣਤੀ। ਅਸੀਮਿਤ ਲਈ 0 \'ਤੇ ਸੈੱਟ ਕਰੋ।';

  @override
  String get adminTunerFallbackBitrate =>
      'ਬੈਕਅੱਪ ਵੱਧ ਤੋਂ ਵੱਧ ਸਟ੍ਰੀਮਿੰਗ ਬਿੱਟਰੇਟ';

  @override
  String get adminTunerImportFavoritesOnly => 'ਸਿਰਫ ਮਨਪਸੰਦ ਚੈਨਲ ਆਯਾਤ ਕਰੋ';

  @override
  String get adminTunerAllowHwTranscoding =>
      'ਹਾਰਡਵੇਅਰ ਟ੍ਰਾਂਸਕੋਡਿੰਗ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 ਟ੍ਰਾਂਸਕੋਡਿੰਗ ਕੰਟੇਨਰ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminTunerAllowStreamSharing => 'ਸਟ੍ਰੀਮ ਸਾਂਝਾਕਰਨ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminTunerEnableStreamLooping => 'ਸਟ੍ਰੀਮ ਲੂਪਿੰਗ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminTunerIgnoreDts => 'DTS ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਕਰੋ';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'ਇਨਪੁੱਟ ਨੂੰ ਮੂਲ ਫ੍ਰੇਮ ਰੇਟ \'ਤੇ ਪੜ੍ਹੋ';

  @override
  String get adminEditProvider => 'ਪ੍ਰਦਾਤਾ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'ਫਾਈਲ ਜਾਂ URL';

  @override
  String get adminXmltvMoviePrefix => 'ਫਿਲਮ ਅਗੇਤਰ';

  @override
  String get adminXmltvMovieCategories => 'ਫਿਲਮ ਸ਼੍ਰੇਣੀਆਂ';

  @override
  String get adminXmltvCategoriesHelp =>
      'ਕਈ ਸ਼੍ਰੇਣੀਆਂ ਨੂੰ ਲੰਬਕਾਰੀ ਲਾਈਨ ਨਾਲ ਵੱਖ ਕਰੋ।';

  @override
  String get adminXmltvKidsCategories => 'ਬੱਚਿਆਂ ਦੀਆਂ ਸ਼੍ਰੇਣੀਆਂ';

  @override
  String get adminXmltvNewsCategories => 'ਖ਼ਬਰਾਂ ਦੀਆਂ ਸ਼੍ਰੇਣੀਆਂ';

  @override
  String get adminXmltvSportsCategories => 'ਖੇਡ ਸ਼੍ਰੇਣੀਆਂ';

  @override
  String get adminSdUsername => 'ਯੂਜ਼ਰਨੇਮ';

  @override
  String get adminSdPassword => 'ਪਾਸਵਰਡ';

  @override
  String get adminSdCountry => 'ਦੇਸ਼';

  @override
  String get adminSdCountrySelect => 'ਇੱਕ ਦੇਸ਼ ਚੁਣੋ';

  @override
  String get adminSdPostalCode => 'ਡਾਕ ਕੋਡ';

  @override
  String get adminSdGetListings => 'ਸੂਚੀਆਂ ਪ੍ਰਾਪਤ ਕਰੋ';

  @override
  String get adminSdListings => 'ਸੂਚੀਆਂ';

  @override
  String get adminEnableAllTuners => 'ਸਾਰੇ ਟਿਊਨਰ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminTunerType => 'ਟਿਊਨਰ ਦੀ ਕਿਸਮ';

  @override
  String get adminTunerAdded => 'ਟਿਊਨਰ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ';

  @override
  String adminTunerAddFailed(String error) {
    return 'ਟਿਊਨਰ ਸ਼ਾਮਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminAddGuideProvider => 'ਗਾਈਡ ਪ੍ਰਦਾਤਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminProviderType => 'ਪ੍ਰਦਾਤਾ ਦੀ ਕਿਸਮ';

  @override
  String get adminProviderAdded => 'ਪ੍ਰਦਾਤਾ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ';

  @override
  String adminProviderAddFailed(String error) {
    return 'ਪ੍ਰਦਾਤਾ ਸ਼ਾਮਲ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'ਟਿਊਨਰ ਹਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminTunerResetRequested => 'ਟਿਊਨਰ ਰੀਸੈੱਟ ਦੀ ਬੇਨਤੀ ਕੀਤੀ ਗਈ';

  @override
  String adminTunerResetFailed(String error) {
    return 'ਟਿਊਨਰ ਰੀਸੈਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'ਇਹ ਟਿਊਨਰ ਕਿਸਮ ਰੀਸੈਟ ਕਰਨ ਦਾ ਸਮਰਥਨ ਨਹੀਂ ਕਰਦੀ।';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'ਪ੍ਰਦਾਤਾ ਹਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
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
  String get adminMovieRecordingPath => 'ਫਿਲਮ ਰਿਕਾਰਡਿੰਗ ਪਾਥ';

  @override
  String get adminGuideDays => 'ਗਾਈਡ ਡੇਟਾ ਦਿਨ';

  @override
  String get adminGuideDaysAuto => 'ਆਟੋਮੈਟਿਕ';

  @override
  String adminGuideDaysValue(int days) {
    return '$days ਦਿਨ';
  }

  @override
  String get adminRecordingPostProcessor => 'ਪੋਸਟ-ਪ੍ਰੋਸੈਸਿੰਗ ਐਪਲੀਕੇਸ਼ਨ ਪਾਥ';

  @override
  String get adminRecordingPostProcessorArgs => 'ਪੋਸਟ-ਪ੍ਰੋਸੈਸਰ ਆਰਗੂਮੈਂਟ';

  @override
  String get adminSaveRecordingNfo => 'ਰਿਕਾਰਡਿੰਗ NFO ਮੈਟਾਡਾਟਾ ਸੇਵ ਕਰੋ';

  @override
  String get adminSaveRecordingImages => 'ਰਿਕਾਰਡਿੰਗ ਚਿੱਤਰ ਸੇਵ ਕਰੋ';

  @override
  String get adminLiveTvSectionTiming => 'ਸਮਾਂ';

  @override
  String get adminLiveTvSectionPaths => 'ਰਿਕਾਰਡਿੰਗ ਪਾਥ';

  @override
  String get adminLiveTvSectionPostProcessing => 'ਪੋਸਟ-ਪ੍ਰੋਸੈਸਿੰਗ';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'ਗਾਈਡ ਡੇਟਾ: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'ਰਿਕਾਰਡਿੰਗ ਸੈਟਿੰਗਾਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'ਸੈਟਿੰਗਾਂ ਸੇਵ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return 'ਮੈਪਿੰਗ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
  String get adminRefreshGuideData => 'ਗਾਈਡ ਡੇਟਾ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get adminGuideRefreshStarted => 'ਗਾਈਡ ਡੇਟਾ ਤਾਜ਼ਾ ਕਰਨਾ ਸ਼ੁਰੂ ਹੋਇਆ';

  @override
  String get adminGuideRefreshUnavailable =>
      'ਗਾਈਡ ਤਾਜ਼ਾ ਕਰਨ ਦਾ ਕਾਰਜ ਇਸ ਸਰਵਰ \'ਤੇ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get adminAddProvider => 'ਪ੍ਰਦਾਤਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get adminNoListingProviders =>
      'ਕੋਈ ਸੂਚੀ ਪ੍ਰਦਾਤਾ ਕੌਂਫਿਗਰ ਨਹੀਂ ਕੀਤਾ ਗਿਆ';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'ਰਿਕਾਰਡਿੰਗ ਪਾਥ: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'ਲੜੀ ਪਾਥ: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'ਪ੍ਰੀ-ਪੈਡਿੰਗ: $minutes ਮਿੰਟ';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'ਪੋਸਟ-ਪੈਡਿੰਗ: $minutes ਮਿੰਟ';
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
    return 'ਹੁਣ ਬੈਕਅੱਪ $name ਬਹਾਲ ਕਰਨਾ ਹੈ?';
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
  String get adminReset => 'ਰੀਸੈੱਟ ਕਰੋ';

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
    return '$minutesਮਿੰਟ ਪਹਿਲਾਂ';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hoursਘੰਟੇ ਪਹਿਲਾਂ';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$daysਦਿਨ ਪਹਿਲਾਂ';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count ਮੇਲ';
  }

  @override
  String get adminLogViewerNoMatches => 'ਕੋਈ ਮੇਲ ਖਾਂਦੀਆਂ ਲਾਈਨਾਂ ਨਹੀਂ ਹਨ';

  @override
  String get adminMetadataEditorTitle => 'ਮੈਟਾਡੇਟਾ ਸੰਪਾਦਕ';

  @override
  String get adminMetadataIdentify => 'ਪਛਾਣੋ';

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
    return '$imageType ਚਿੱਤਰ ਅੱਪਡੇਟ ਕੀਤਾ';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType ਚਿੱਤਰ ਅੱਪਲੋਡ ਕੀਤਾ';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType ਚਿੱਤਰ ਮਿਟਾਇਆ';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'ਚਿੱਤਰ ਡਾਊਨਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'ਚੁਣੇ ਗਏ ਚਿੱਤਰ ਨੂੰ ਪੜ੍ਹਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'ਚਿੱਤਰ ਅੱਪਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType ਚਿੱਤਰ ਮਿਟਾਓ';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'ਇਹ ਆਈਟਮ ਤੋਂ ਮੌਜੂਦਾ ਚਿੱਤਰ ਨੂੰ ਹਟਾਉਂਦਾ ਹੈ।';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'ਚਿੱਤਰ ਮਿਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType ਚਿੱਤਰ ਚੁਣੋ';
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
    return 'ਅੱਪਡੇਟ ਉਪਲਬਧ: v$version';
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
    return 'ਅੱਪਡੇਟ ਇੰਸਟਾਲ ਕਰੋ (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ਕੋਈ ਪੈਕੇਜ ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ';

  @override
  String get adminPluginsCatalogEmpty => 'ਕੋਈ ਪੈਕੇਜ ਉਪਲਬਧ ਨਹੀਂ ਹਨ';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" ਇੰਸਟਾਲ ਹੋ ਰਿਹਾ ਹੈ...';
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
    return '$name ਸੈਟਿੰਗਾਂ';
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
    return 'ਰਿਪੋਜ਼ਟਰੀਆਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ਰਿਪੋਜ਼ਟਰੀ ਹਟਾਓ';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ \"$name\" ਨੂੰ ਹਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
  }

  @override
  String get adminReposRemove => 'ਹਟਾਓ';

  @override
  String adminReposSaveFailed(String error) {
    return 'ਰਿਪੋਜ਼ਟਰੀਆਂ ਸੇਵ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
  String get adminBrandingSplashUpload => 'ਚਿੱਤਰ ਅੱਪਲੋਡ ਕਰੋ';

  @override
  String get adminBrandingSplashUploaded => 'ਸਪਲੈਸ਼ਸਕ੍ਰੀਨ ਅੱਪਡੇਟ ਕੀਤੀ';

  @override
  String get adminBrandingSplashUploadFailed =>
      'ਸਪਲੈਸ਼ਸਕ੍ਰੀਨ ਅੱਪਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminBrandingSplashDeleted => 'ਸਪਲੈਸ਼ਸਕ੍ਰੀਨ ਹਟਾਈ ਗਈ';

  @override
  String get adminBrandingNoSplash => 'ਕੋਈ ਕਸਟਮ ਸਪਲੈਸ਼ਸਕ੍ਰੀਨ ਨਹੀਂ';

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
  String get adminPlaybackQsvDevice => 'QSV ਡਿਵਾਈਸ';

  @override
  String get adminPlaybackEnhancedNvdec => 'ਵਧਾਇਆ NVDEC ਡੀਕੋਡਰ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'ਸਿਸਟਮ ਮੂਲ ਹਾਰਡਵੇਅਰ ਡੀਕੋਡਰ ਨੂੰ ਤਰਜੀਹ ਦਿਓ';

  @override
  String get adminPlaybackColorDepth => 'ਹਾਰਡਵੇਅਰ ਡੀਕੋਡਿੰਗ ਰੰਗ ਡੂੰਘਾਈ';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC ਡੀਕੋਡਿੰਗ';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 ਡੀਕੋਡਿੰਗ';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-bit ਡੀਕੋਡਿੰਗ';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit ਡੀਕੋਡਿੰਗ';

  @override
  String get adminPlaybackHwEncodingSection => 'ਹਾਰਡਵੇਅਰ ਏਨਕੋਡਿੰਗ';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC ਏਨਕੋਡਿੰਗ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 ਏਨਕੋਡਿੰਗ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel ਘੱਟ-ਪਾਵਰ H.264 ਏਨਕੋਡਰ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel ਘੱਟ-ਪਾਵਰ HEVC ਏਨਕੋਡਰ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminPlaybackToneMapping => 'ਟੋਨ ਮੈਪਿੰਗ';

  @override
  String get adminPlaybackEnableTonemapping => 'ਟੋਨ ਮੈਪਿੰਗ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminPlaybackEnableVppTonemapping => 'VPP ਟੋਨ ਮੈਪਿੰਗ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox ਟੋਨ ਮੈਪਿੰਗ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'ਟੋਨ ਮੈਪਿੰਗ ਐਲਗੋਰਿਦਮ';

  @override
  String get adminPlaybackTonemappingMode => 'ਟੋਨ ਮੈਪਿੰਗ ਮੋਡ';

  @override
  String get adminPlaybackTonemappingRange => 'ਟੋਨ ਮੈਪਿੰਗ ਰੇਂਜ';

  @override
  String get adminPlaybackTonemappingDesat => 'ਟੋਨ ਮੈਪਿੰਗ ਡੀਸੈਚੁਰੇਸ਼ਨ';

  @override
  String get adminPlaybackTonemappingPeak => 'ਟੋਨ ਮੈਪਿੰਗ ਸਿਖਰ';

  @override
  String get adminPlaybackTonemappingParam => 'ਟੋਨ ਮੈਪਿੰਗ ਪੈਰਾਮੀਟਰ';

  @override
  String get adminPlaybackVppTonemappingBrightness => 'VPP ਟੋਨ ਮੈਪਿੰਗ ਚਮਕ';

  @override
  String get adminPlaybackVppTonemappingContrast => 'VPP ਟੋਨ ਮੈਪਿੰਗ ਕੰਟ੍ਰਾਸਟ';

  @override
  String get adminPlaybackPresetsQuality => 'ਪ੍ਰੀਸੈਟ ਅਤੇ ਗੁਣਵੱਤਾ';

  @override
  String get adminPlaybackEncoderPreset => 'ਏਨਕੋਡਰ ਪ੍ਰੀਸੈਟ';

  @override
  String get adminPlaybackH264Crf => 'H.264 ਏਨਕੋਡਿੰਗ CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) ਏਨਕੋਡਿੰਗ CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'ਡੀਇੰਟਰਲੇਸ ਵਿਧੀ';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'ਡੀਇੰਟਰਲੇਸ ਕਰਦੇ ਸਮੇਂ ਫ੍ਰੇਮ ਰੇਟ ਦੁੱਗਣਾ ਕਰੋ';

  @override
  String get adminPlaybackAudioSection => 'ਆਡੀਓ';

  @override
  String get adminPlaybackEnableAudioVbr => 'ਆਡੀਓ VBR ਏਨਕੋਡਿੰਗ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminPlaybackDownmixBoost => 'ਆਡੀਓ ਡਾਊਨਮਿਕਸ ਬੂਸਟ';

  @override
  String get adminPlaybackDownmixAlgorithm => 'ਸਟੀਰੀਓ ਡਾਊਨਮਿਕਸ ਐਲਗੋਰਿਦਮ';

  @override
  String get adminPlaybackMaxMuxingQueue => 'ਵੱਧ ਤੋਂ ਵੱਧ ਮਕਸਿੰਗ ਕਤਾਰ ਆਕਾਰ';

  @override
  String get adminPlaybackAutoOption => 'ਆਟੋ';

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
  String get adminTaskStop => 'ਰੋਕੋ';

  @override
  String get adminRunningTasks => 'ਚੱਲ ਰਹੇ ਕਾਰਜ';

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
    return 'ਰੋਜ਼ਾਨਾ $time \'ਤੇ';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'ਹਰ $day ਨੂੰ $time \'ਤੇ';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'ਹਰ $duration';
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
      other: '$count ਘੰਟੇ',
      one: '1 ਘੰਟਾ',
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
    return '$daysਦਿਨ ਪਹਿਲਾਂ';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hoursਘੰਟੇ ਪਹਿਲਾਂ';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutesਮਿੰਟ ਪਹਿਲਾਂ';
  }

  @override
  String get adminActivityNow => 'ਹੁਣ';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutesਮਿੰਟ';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hoursਘੰਟੇ';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$daysਦਿਨ';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'ਸੀਕ ਪ੍ਰੀਵਿਊ ਥੰਬਨੇਲ ਲਈ Trickplay ਚਿੱਤਰ ਬਣਾਉਣਾ ਸੰਰਚਿਤ ਕਰੋ।';

  @override
  String get adminNetworkingPublicHttpsPort => 'ਜਨਤਕ HTTPS ਪੋਰਟ';

  @override
  String get adminNetworkingBaseUrl => 'ਬੇਸ URL';

  @override
  String get adminNetworkingBaseUrlHint => 'ਜਿਵੇਂ /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'ਪਬਲਿਕ HTTP ਪੋਰਟ';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS ਦੀ ਲੋੜ ਹੈ';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'ਸਾਰੀਆਂ ਰਿਮੋਟ ਬੇਨਤੀਆਂ ਨੂੰ HTTPS \'ਤੇ ਰੀਡਾਇਰੈਕਟ ਕਰੋ। ਜੇ ਸਰਵਰ ਕੋਲ ਕੋਈ ਵੈਧ ਸਰਟੀਫਿਕੇਟ ਨਹੀਂ ਹੈ ਤਾਂ ਕੋਈ ਪ੍ਰਭਾਵ ਨਹੀਂ ਹੁੰਦਾ।';

  @override
  String get adminNetworkingCertPassword => 'ਸਰਟੀਫਿਕੇਟ ਪਾਸਵਰਡ';

  @override
  String get adminNetworkingIpSettings => 'IP ਸੈਟਿੰਗਾਂ';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminNetworkingAutoDiscovery => 'ਆਟੋਮੈਟਿਕ ਪੋਰਟ ਮੈਪਿੰਗ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminNetworkingLocalSubnets => 'LAN ਨੈੱਟਵਰਕ';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'ਸਥਾਨਕ ਨੈੱਟਵਰਕ \'ਤੇ ਮੰਨੇ ਜਾਂਦੇ IP ਪਤਿਆਂ ਜਾਂ CIDR ਸਬਨੈੱਟਾਂ ਦੀ ਕਾਮੇ ਜਾਂ ਲਾਈਨ ਨਾਲ ਵੱਖ ਕੀਤੀ ਸੂਚੀ।';

  @override
  String get adminNetworkingPublishedUris => 'ਪ੍ਰਕਾਸ਼ਿਤ ਸਰਵਰ URI';

  @override
  String get adminNetworkingPublishedUriHint =>
      'ਇੱਕ ਸਬਨੈੱਟ ਜਾਂ ਪਤੇ ਨੂੰ ਪ੍ਰਕਾਸ਼ਿਤ URL ਨਾਲ ਮੈਪ ਕਰੋ, ਜਿਵੇਂ all=https://example.com';

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
  String get adminPlaybackThrottleDelay => 'ਥ੍ਰੋਟਲ ਦੇਰੀ (ਸਕਿੰਟ)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'ਤੁਰੰਤ ਉਪਸਿਰਲੇਖ ਕੱਢਣ ਦੀ ਆਗਿਆ ਦਿਓ';

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
    return 'ਸਮੱਗਰੀ ਕਿਸਮ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'ਹੌਲੀ ਜਵਾਬ ਸੀਮਾ (ms)';

  @override
  String get adminGeneralEnableSlowResponse => 'ਹੌਲੀ ਜਵਾਬ ਚੇਤਾਵਨੀਆਂ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect ਸਮਰੱਥ ਕਰੋ';

  @override
  String get adminGeneralSectionServer => 'ਸਰਵਰ';

  @override
  String get adminGeneralSectionMetadata => 'ਮੈਟਾਡਾਟਾ';

  @override
  String get adminGeneralSectionPaths => 'ਪਾਥ';

  @override
  String get adminGeneralSectionPerformance => 'ਪ੍ਰਦਰਸ਼ਨ';

  @override
  String get adminGeneralCachePath => 'ਕੈਸ਼ ਮਾਰਗ';

  @override
  String get adminGeneralMetadataPath => 'ਮੈਟਾਡੇਟਾ ਮਾਰਗ';

  @override
  String get adminGeneralServerName => 'ਸਰਵਰ ਦਾ ਨਾਮ';

  @override
  String get adminGeneralDisplayLanguage => 'ਤਰਜੀਹੀ ਡਿਸਪਲੇ ਭਾਸ਼ਾ';

  @override
  String get adminSettingsLoadFailed => 'ਸੈਟਿੰਗਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get adminDiscover => 'ਖੋਜੋ';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'ਮੈਪਿੰਗ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'ਸਮਾਂ ਸੀਮਾ: $duration';
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
      other: '# ਭਾਗੀਦਾਰ',
      one: '# ਭਾਗੀਦਾਰ',
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
    return 'ਆਈਟਮ $index';
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
    return '$userName SyncPlay ਸਮੂਹ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਇਆ';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay ਸਮੂਹ ਤੋਂ ਬਾਹਰ ਹੋਇਆ';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay ਪਹੁੰਚ ਅਸਵੀਕਾਰ ਕੀਤੀ ਗਈ';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ਤੁਹਾਡੇ ਕੋਲ ਇਸ SyncPlay ਸਮੂਹ ਵਿੱਚ ਇੱਕ ਜਾਂ ਵੱਧ ਆਈਟਮਾਂ ਤੱਕ ਪਹੁੰਚ ਨਹੀਂ ਹੈ। ਗਰੁੱਪ ਮਾਲਕ ਨੂੰ ਲਾਇਬ੍ਰੇਰੀ ਅਨੁਮਤੀਆਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨ ਲਈ ਕਹੋ ਜਾਂ ਕੋਈ ਵੱਖਰੀ ਕਤਾਰ ਚੁਣੋ।';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName ਨਾਲ ਪਲੇਬੈਕ ਸਿੰਕ ਹੋ ਰਿਹਾ ਹੈ';
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ਕਤਾਰਾਂ ਲੱਭੀਆਂ',
      one: '# ਕਤਾਰ ਲੱਭੀ',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'ਤੁਸੀਂ ਆਫਲਾਈਨ ਹੋ';

  @override
  String get offlineBannerSubtitle => 'ਤੁਹਾਡੇ ਡਾਊਨਲੋਡ ਦਿਖਾ ਰਹੇ ਹਾਂ';

  @override
  String get offlineBannerAction => 'ਡਾਊਨਲੋਡ';

  @override
  String get serverUnreachableBannerTitle =>
      'ਤੁਹਾਡੇ ਸਰਵਰ ਤੱਕ ਪਹੁੰਚ ਨਹੀਂ ਹੋ ਸਕਦੀ';

  @override
  String get serverUnreachableBannerSubtitle =>
      'ਵਾਪਸ ਆਉਣ ਤੱਕ ਡਾਊਨਲੋਡ ਤੋਂ ਚਲਾ ਰਹੇ ਹਾਂ';

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
    return 'ਕਾਸਟ ਕੰਟਰੋਲ ਅਸਫਲ: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind ਕੰਟਰੋਲ';
  }

  @override
  String get castDeviceVolume => 'ਡਿਵਾਈਸ ਵਾਲੀਅਮ';

  @override
  String get castVolumeUnavailable => 'ਅਣਉਪਲਬਧ';

  @override
  String castStopKind(String kind) {
    return '$kind ਰੋਕੋ';
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
    return '$length-ਅੰਕ ਦਾ PIN ਦਾਖਲ ਕਰੋ';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'ਆਪਣਾ $length-ਅੰਕ ਦਾ PIN ਦਾਖਲ ਕਰੋ';
  }

  @override
  String get pinIncorrect => 'ਗਲਤ ਪਿੰਨ';

  @override
  String get pinMismatch => 'ਪਿੰਨ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String get pinForgot => 'ਪਿੰਨ ਭੁੱਲ ਗਏ ਹੋ?';

  @override
  String get pinClear => 'ਸਾਫ਼ ਕਰੋ';

  @override
  String get pinBackspace => 'ਬੈਕਸਪੇਸ';

  @override
  String get quickConnectAuthorized => 'Quick Connect ਬੇਨਤੀ ਮਨਜ਼ੂਰ ਕੀਤੀ।';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect ਕੋਡ ਅਵੈਧ ਹੈ ਜਾਂ ਮਿਆਦ ਪੁੱਗ ਗਈ ਹੈ।';

  @override
  String get quickConnectNotSupported =>
      'ਇਸ ਸਰਵਰ \'ਤੇ Quick Connect ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect ਕੋਡ ਮਨਜ਼ੂਰ ਕਰਨ ਵਿੱਚ ਅਸਫਲ।';

  @override
  String get quickConnectDisabled => 'ਇਸ ਸਰਵਰ \'ਤੇ Quick Connect ਅਯੋਗ ਹੈ।';

  @override
  String get quickConnectForbidden =>
      'ਤੁਹਾਡਾ ਖਾਤਾ ਇਸ Quick Connect ਬੇਨਤੀ ਨੂੰ ਮਨਜ਼ੂਰ ਨਹੀਂ ਕਰ ਸਕਦਾ।';

  @override
  String get quickConnectNotFound =>
      'Quick Connect ਕੋਡ ਨਹੀਂ ਮਿਲਿਆ। ਨਵਾਂ ਕੋਡ ਅਜ਼ਮਾਓ।';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect ਅਸਫਲ: $message';
  }

  @override
  String get quickConnectEnterCode => 'ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get quickConnectAuthorize => 'ਅਧਿਕਾਰਤ ਕਰੋ';

  @override
  String remoteCommandFailed(String error) {
    return 'ਕਮਾਂਡ ਅਸਫਲ: $error';
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
    return 'ਕਾਸਟਿੰਗ ਸ਼ੁਰੂ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
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
    return '$name ਡਾਊਨਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';
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
  String get stillWatchingStop => 'ਰੋਕੋ';

  @override
  String get stillWatchingContinue => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String skipSegment(String segment) {
    return '$segment ਛੱਡੋ';
  }

  @override
  String get liveTv => 'ਲਾਈਵ ਟੀ.ਵੀ';

  @override
  String get continueWatchingAndNextUp => 'ਦੇਖਣਾ ਜਾਰੀ ਰੱਖੋ ਅਤੇ ਅੱਗੇ ਵਧੋ';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'ਡਾਊਨਲੋਡ ਹੋ ਰਿਹਾ $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName ਡਾਊਨਲੋਡ ਹੋ ਰਿਹਾ ਹੈ';
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
  String get contextMenuHideFromContinueWatching => 'ਦੇਖਣਾ ਜਾਰੀ ਰੱਖੋ ਤੋਂ ਲੁਕਾਓ';

  @override
  String get contextMenuHideFromNextUp => 'ਅਗਲਾ ਤੋਂ ਲੁਕਾਓ';

  @override
  String get contextMenuAddToCollection => 'ਸੰਗ੍ਰਹਿ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

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
      'ਪਲੱਗਇਨ ਸਿੰਕ, Seerr, ਰੇਟਿੰਗ ਅਤੇ ਹੋਰ';

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
  String get settingsConnectionSection => 'ਕਨੈਕਸ਼ਨ';

  @override
  String get settingsAllowSelfSignedCerts =>
      'ਸਵੈ-ਹਸਤਾਖਰਿਤ ਸਰਟੀਫਿਕੇਟਾਂ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'ਸਵੈ-ਹਸਤਾਖਰਿਤ ਜਾਂ ਪ੍ਰਾਈਵੇਟ-CA TLS ਸਰਟੀਫਿਕੇਟ ਵਰਤਣ ਵਾਲੇ ਸਰਵਰਾਂ \'ਤੇ ਭਰੋਸਾ ਕਰੋ। ਸਿਰਫ ਉਹਨਾਂ ਸਰਵਰਾਂ ਲਈ ਸਮਰੱਥ ਕਰੋ ਜਿਨ੍ਹਾਂ ਨੂੰ ਤੁਸੀਂ ਕੰਟਰੋਲ ਕਰਦੇ ਹੋ। ਇਹ ਸਾਰੇ ਕਨੈਕਸ਼ਨਾਂ ਲਈ ਸਰਟੀਫਿਕੇਟ ਪ੍ਰਮਾਣਿਕਤਾ ਅਯੋਗ ਕਰਦਾ ਹੈ।';

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
  String get settingsDetailsScreen => 'ਵੇਰਵਾ ਸਕ੍ਰੀਨ';

  @override
  String get settingsDetailsScreenSubtitle =>
      'ਸ਼ੈਲੀ, ਪਿਛੋਕੜ ਧੁੰਦਲਾਪਣ ਅਤੇ ਟੈਬ ਵਿਹਾਰ';

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
  String get settingsShowSeerrButtonInNavigation =>
      'ਨੈਵੀਗੇਸ਼ਨ ਬਾਰ ਵਿੱਚ Seerr ਬਟਨ ਦਿਖਾਓ';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'ਉੱਪਰਲੀ ਨੈਵੀਗੇਸ਼ਨ ਬਾਰ ਵਿੱਚ ਹਮੇਸ਼ਾ ਟੈਕਸਟ ਲੇਬਲ ਦਿਖਾਓ';

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
      'Moonbase ਵਾਧੂ ਰੇਟਿੰਗ ਸਰੋਤਾਂ, Seerr ਬੇਨਤੀਆਂ ਅਤੇ ਸਿੰਕ ਕੀਤੀਆਂ ਤਰਜੀਹਾਂ ਸਮੇਤ ਸਰਵਰ-ਸਾਈਡ ਏਕੀਕਰਨ ਨੂੰ ਸ਼ਕਤੀ ਦਿੰਦਾ ਹੈ।';

  @override
  String get settingsOfflineDownloads => 'ਔਫਲਾਈਨ ਡਾਊਨਲੋਡ';

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
  String get settingsSupportMoonfinSubtitle => 'ਡਿਵੈਲਪਰ ਨੂੰ ਇੱਕ ਕੌਫੀ ਦਾਨ ਕਰੋ';

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
      other: '# ਲਾਇਸੈਂਸ ਸੂਚਨਾਵਾਂ',
      one: '# ਲਾਇਸੈਂਸ ਸੂਚਨਾ',
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
  String get settingsMediaSegmentCountdown => 'ਮੀਡੀਆ ਖੰਡ ਕਾਊਂਟਡਾਊਨ';

  @override
  String get settingsProgressBar => 'ਪ੍ਰਗਤੀ ਬਾਰ';

  @override
  String get settingsTimer => 'ਟਾਈਮਰ';

  @override
  String get settingsNone => 'ਕੋਈ ਨਹੀਂ';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (ਪੁਰਾਣਾ)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (ਵਿਰਾਸਤੀ)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (ਸਿਫਾਰਸ਼ੀ)';

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
  String recentlyReleasedLibraryName(String libraryName) {
    return 'ਹਾਲ ਹੀ ਵਿੱਚ ਜਾਰੀ $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'ਅਗਲਾ ਐਪੀਸੋਡ ਆਟੋਪਲੇ ਕਰੋ';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'ਉਪਲਬਧ ਹੋਣ \'ਤੇ ਅਗਲਾ ਐਪੀਸੋਡ ਆਪਣੇ-ਆਪ ਚਲਾਓ।';

  @override
  String get skipSilenceTitle => 'ਚੁੱਪ ਛੱਡੋ';

  @override
  String get skipSilenceSubtitle =>
      'ਜਦੋਂ ਸਟ੍ਰੀਮ ਸਮਰਥਨ ਕਰਦੀ ਹੈ ਤਾਂ ਚੁੱਪ ਆਡੀਓ ਖੰਡ ਆਪਣੇ-ਆਪ ਛੱਡੋ।';

  @override
  String get allowExternalAudioEffectsTitle =>
      'ਬਾਹਰੀ ਆਡੀਓ ਪ੍ਰਭਾਵਾਂ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'ਇਕੁਅਲਾਈਜ਼ਰ ਅਤੇ ਪ੍ਰਭਾਵ ਐਪਾਂ (ਜਿਵੇਂ Wavelet) ਨੂੰ Media3 ਪਲੇਬੈਕ ਸੈਸ਼ਨਾਂ ਨਾਲ ਜੁੜਨ ਦੀ ਆਗਿਆ ਦਿਓ।';

  @override
  String get disableTunnelingTitle => 'ਟਨਲਿੰਗ ਅਯੋਗ ਕਰੋ';

  @override
  String get disableTunnelingSubtitle =>
      'ਗੈਰ-ਟਨਲਡ ਪਲੇਬੈਕ ਲਾਗੂ ਕਰੋ। ਟਨਲਿੰਗ ਆਡੀਓ/ਵੀਡੀਓ ਵਿਘਨ ਵਾਲੇ ਡਿਵਾਈਸਾਂ \'ਤੇ ਲਾਭਦਾਇਕ।';

  @override
  String get enableTunnelingTitle => 'ਟਨਲਿੰਗ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get enableTunnelingSubtitle =>
      'ਉੱਨਤ। ਆਡੀਓ ਅਤੇ ਵੀਡੀਓ ਨੂੰ ਇੱਕ ਜੁੜੇ ਹੋਏ ਹਾਰਡਵੇਅਰ ਪਾਥ ਰਾਹੀਂ ਭੇਜਦਾ ਹੈ। ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ ਬੰਦ ਕਿਉਂਕਿ ਇਹ ਕੁਝ ਡਿਵਾਈਸਾਂ \'ਤੇ ਆਡੀਓ/ਵੀਡੀਓ ਡ੍ਰੌਪਆਉਟ ਦਾ ਕਾਰਨ ਬਣਦਾ ਹੈ।';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision ਪ੍ਰੋਫਾਈਲ 7 ਨੂੰ HEVC ਨਾਲ ਮੈਪ ਕਰੋ';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'ਗੈਰ-DV ਡਿਵਾਈਸਾਂ \'ਤੇ Dolby Vision ਪ੍ਰੋਫਾਈਲ 7 ਸਟ੍ਰੀਮਾਂ ਨੂੰ HDR10-ਅਨੁਕੂਲ HEVC ਵਜੋਂ ਚਲਾਓ।';

  @override
  String get subtitlesUseEmbeddedStyles => 'ਏਮਬੈੱਡਡ ਉਪਸਿਰਲੇਖ ਸ਼ੈਲੀਆਂ ਵਰਤੋ';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'ਉਪਸਿਰਲੇਖ ਟਰੈਕ ਵਿੱਚ ਏਮਬੈੱਡ ਕੀਤੇ ਰੰਗ, ਫੌਂਟ ਅਤੇ ਸਥਿਤੀ ਲਾਗੂ ਕਰੋ। ਇਸ ਦੀ ਬਜਾਏ ਆਪਣੀਆਂ ਕੈਪਸ਼ਨ ਸ਼ੈਲੀ ਤਰਜੀਹਾਂ ਵਰਤਣ ਲਈ ਅਯੋਗ ਕਰੋ।';

  @override
  String get subtitlesUseEmbeddedFontSizes => 'ਏਮਬੈੱਡਡ ਉਪਸਿਰਲੇਖ ਫੌਂਟ ਆਕਾਰ ਵਰਤੋ';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'ਉਪਸਿਰਲੇਖ ਟਰੈਕ ਵਿੱਚ ਏਮਬੈੱਡ ਕੀਤੇ ਫੌਂਟ-ਆਕਾਰ ਸੰਕੇਤ ਲਾਗੂ ਕਰੋ। ਆਪਣੀਆਂ ਸ਼ੈਲੀ ਤਰਜੀਹਾਂ ਤੋਂ ਉਪਸਿਰਲੇਖ ਆਕਾਰ ਵਰਤਣ ਲਈ ਅਯੋਗ ਕਰੋ।';

  @override
  String get showMediaDetailsOnLibraryPage => 'ਮੀਡੀਆ ਵੇਰਵੇ ਦਿਖਾਓ';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'ਲਾਇਬ੍ਰੇਰੀ ਪੰਨਿਆਂ ਦੇ ਉੱਪਰ ਚੁਣੀ ਆਈਟਮ ਦੇ ਵੇਰਵੇ ਦਿਖਾਓ।';

  @override
  String get hideBackdropsInLibraries => 'ਬ੍ਰਾਊਜ਼ ਕਰਦੇ ਸਮੇਂ ਪਿਛੋਕੜ ਲੁਕਾਉਣੇ ਹਨ?';

  @override
  String get useDetailedSubHeadings => 'ਵਿਸਤ੍ਰਿਤ ਉਪ-ਸਿਰਲੇਖ ਵਰਤੋ';

  @override
  String get useDetailedSubHeadingsDescription =>
      'ਲਾਇਬ੍ਰੇਰੀ ਪੰਨਿਆਂ \'ਤੇ ਵਿਸਤ੍ਰਿਤ ਜਾਂ ਘੱਟੋ-ਘੱਟ ਉਪ-ਕਤਾਰ ਦਿਖਾਓ।';

  @override
  String get savedThemesDeleteDialogTitle => 'ਸੇਵ ਕੀਤੀ ਥੀਮ ਮਿਟਾਉਣੀ ਹੈ?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'ਇਸ ਡਿਵਾਈਸ ਕੈਸ਼ ਵਿੱਚੋਂ \"$themeName\" ਹਟਾਉਣਾ ਹੈ?';
  }

  @override
  String get themeStore => 'ਥੀਮ ਸਟੋਰ';

  @override
  String get themeStoreSubtitle => 'ਕਮਿਊਨਿਟੀ ਥੀਮ ਬ੍ਰਾਊਜ਼ ਅਤੇ ਸੇਵ ਕਰੋ';

  @override
  String get themeStoreDescription =>
      'ਕਿਸੇ ਥੀਮ ਨੂੰ ਆਪਣੀਆਂ ਹੋਰ ਸੇਵ ਕੀਤੀਆਂ ਥੀਮਾਂ ਵਾਂਗ ਵਰਤਣ ਲਈ ਸੇਵ ਕਰੋ।';

  @override
  String get themeStoreEmpty => 'ਇਸ ਵੇਲੇ ਕੋਈ ਥੀਮ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get themeStoreLoadFailed =>
      'ਥੀਮ ਸਟੋਰ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ। ਆਪਣਾ ਕਨੈਕਸ਼ਨ ਜਾਂਚੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get themeStoreSave => 'ਸੇਵ ਕਰੋ';

  @override
  String get themeStoreSaveAndApply => 'ਸੇਵ ਕਰੋ ਅਤੇ ਲਾਗੂ ਕਰੋ';

  @override
  String get themeStoreSaved => 'ਸੇਵ ਕੀਤਾ';

  @override
  String get themeStoreInvalidMessage => 'ਇਹ ਥੀਮ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕੀ।';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" ਸੇਵ ਕੀਤਾ।';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'ਇਸ ਡਿਵਾਈਸ ਤੋਂ \"$themeName\" ਮਿਟਾਇਆ।';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" ਮਿਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ।';
  }

  @override
  String get savedThemesTitle => 'ਸੇਵ ਕੀਤੀਆਂ ਥੀਮਾਂ';

  @override
  String get savedThemesDescription =>
      'ਇਹ ਮੌਜੂਦਾ ਸਰਵਰ ਲਈ Moonfin ਪਲੱਗਇਨ ਤੋਂ ਡਾਊਨਲੋਡ ਕੀਤੀਆਂ ਥੀਮਾਂ ਹਨ। ਮਿਟਾਉਣ ਨਾਲ ਸਿਰਫ ਇਹ ਲੋਕਲ ਕਾਪੀ ਹਟਦੀ ਹੈ।';

  @override
  String get savedThemesEmpty => 'ਇਸ ਸਰਵਰ ਲਈ ਕੋਈ ਸੇਵ ਕੀਤੀਆਂ ਥੀਮਾਂ ਨਹੀਂ ਮਿਲੀਆਂ।';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • ਇਸ ਵੇਲੇ ਸਰਗਰਮ';
  }

  @override
  String get savedThemesDeleteTooltip => 'ਸੇਵ ਕੀਤੀ ਥੀਮ ਮਿਟਾਓ';

  @override
  String get savedThemesManageSubtitle =>
      'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਡਾਊਨਲੋਡ ਕੀਤੀਆਂ ਪਲੱਗਇਨ ਥੀਮਾਂ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ';

  @override
  String get themeEditor => 'ਥੀਮ ਸੰਪਾਦਕ';

  @override
  String get themeEditorSubtitle =>
      'ਆਪਣੇ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ Moonfin ਥੀਮ ਸੰਪਾਦਕ ਖੋਲ੍ਹੋ';

  @override
  String get homeScreen => 'ਹੋਮ ਸਕ੍ਰੀਨ';

  @override
  String get bottomBar => 'ਹੇਠਲੀ ਬਾਰ';

  @override
  String get homeRowsStyleClassic => 'ਕਲਾਸਿਕ';

  @override
  String get homeRowsStyleModern => 'ਮਾਡਰਨ';

  @override
  String get homeRowsSection => 'ਹੋਮ ਕਤਾਰਾਂ';

  @override
  String get homeRowDisplay => 'ਹੋਮ ਕਤਾਰ ਡਿਸਪਲੇ';

  @override
  String get homeRowSections => 'ਹੋਮ ਕਤਾਰ ਭਾਗ';

  @override
  String get homeRowToggles => 'ਹੋਮ ਕਤਾਰ ਟੌਗਲ';

  @override
  String get homeRowTogglesSubtitle =>
      'ਲਾਇਬ੍ਰੇਰੀ-ਅਧਾਰਿਤ ਹੋਮ ਕਤਾਰ ਸ਼੍ਰੇਣੀਆਂ ਸਮਰੱਥ ਜਾਂ ਅਯੋਗ ਕਰੋ';

  @override
  String get homeRowTogglesDescription =>
      'ਹੋਮ ਭਾਗਾਂ ਵਿੱਚ ਕਤਾਰਾਂ ਦਿਖਾਉਣ ਲਈ ਹੇਠਲੇ ਟੌਗਲ ਸਮਰੱਥ ਕਰੋ।';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'ਕਲਾਸਿਕ ਪ੍ਰਤੀ-ਕਤਾਰ ਚਿੱਤਰ ਕਿਸਮ ਅਤੇ ਜਾਣਕਾਰੀ ਓਵਰਲੇ ਰੱਖਦਾ ਹੈ। ਮਾਡਰਨ ਪੋਰਟਰੇਟ-ਤੋਂ-ਪਿਛੋਕੜ ਕਤਾਰਾਂ ਵਰਤਦਾ ਹੈ।';

  @override
  String get displayFavoritesRows => 'ਮਨਪਸੰਦ ਕਤਾਰਾਂ ਦਿਖਾਓ';

  @override
  String get displayFavoritesRowsSubtitle =>
      'ਹੋਮ ਭਾਗਾਂ ਵਿੱਚ ਮਨਪਸੰਦ ਫਿਲਮਾਂ, ਲੜੀ ਅਤੇ ਹੋਰ ਮਨਪਸੰਦ ਕਤਾਰਾਂ ਦਿਖਾਓ।';

  @override
  String get favoritesRowSorting => 'ਮਨਪਸੰਦ ਕਤਾਰ ਕ੍ਰਮਬੱਧੀ';

  @override
  String get favoritesRowSortingDescription =>
      'ਸ਼ਾਮਲ ਕਰਨ ਦੀ ਮਿਤੀ, ਰਿਲੀਜ਼ ਮਿਤੀ, ਵਰਣਮਾਲਾ ਅਨੁਸਾਰ ਅਤੇ ਹੋਰ ਦੁਆਰਾ ਮਨਪਸੰਦ ਕਤਾਰਾਂ ਕ੍ਰਮਬੱਧ ਕਰੋ।';

  @override
  String get displayCollectionsRows => 'ਸੰਗ੍ਰਹਿ ਕਤਾਰਾਂ ਦਿਖਾਓ';

  @override
  String get displayCollectionsRowsSubtitle =>
      'ਹੋਮ ਭਾਗਾਂ ਵਿੱਚ ਸੰਗ੍ਰਹਿ ਕਤਾਰਾਂ ਦਿਖਾਓ।';

  @override
  String get collectionsRowSorting => 'ਸੰਗ੍ਰਹਿ ਕਤਾਰ ਕ੍ਰਮਬੱਧੀ';

  @override
  String get collectionsRowSortingDescription =>
      'ਸ਼ਾਮਲ ਕਰਨ ਦੀ ਮਿਤੀ, ਰਿਲੀਜ਼ ਮਿਤੀ, ਵਰਣਮਾਲਾ ਅਨੁਸਾਰ ਅਤੇ ਹੋਰ ਦੁਆਰਾ ਸੰਗ੍ਰਹਿ ਕਤਾਰਾਂ ਕ੍ਰਮਬੱਧ ਕਰੋ।';

  @override
  String get displayGenresRows => 'ਸ਼ੈਲੀ ਕਤਾਰਾਂ ਦਿਖਾਓ';

  @override
  String get displayGenresRowsSubtitle => 'ਹੋਮ ਭਾਗਾਂ ਵਿੱਚ ਸ਼ੈਲੀ ਕਤਾਰਾਂ ਦਿਖਾਓ।';

  @override
  String get genresRowSorting => 'ਸ਼ੈਲੀ ਕਤਾਰ ਕ੍ਰਮਬੱਧੀ';

  @override
  String get genresRowSortingDescription =>
      'ਸ਼ਾਮਲ ਕਰਨ ਦੀ ਮਿਤੀ, ਰਿਲੀਜ਼ ਮਿਤੀ, ਵਰਣਮਾਲਾ ਅਨੁਸਾਰ ਅਤੇ ਹੋਰ ਦੁਆਰਾ ਸ਼ੈਲੀ ਕਤਾਰਾਂ ਕ੍ਰਮਬੱਧ ਕਰੋ।';

  @override
  String get genresRowItems => 'ਸ਼ੈਲੀ ਕਤਾਰ ਆਈਟਮਾਂ';

  @override
  String get genresRowItemsDescription =>
      'ਸ਼ੈਲੀ ਕਤਾਰਾਂ ਵਿੱਚ ਫਿਲਮਾਂ, ਲੜੀ ਜਾਂ ਦੋਵੇਂ ਦਿਖਾਓ।';

  @override
  String get displayPlaylistsRows => 'ਪਲੇਲਿਸਟ ਕਤਾਰਾਂ ਦਿਖਾਓ';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'ਹੋਮ ਭਾਗਾਂ ਵਿੱਚ ਪਲੇਲਿਸਟ ਕਤਾਰਾਂ ਦਿਖਾਓ।';

  @override
  String get playlistsRowSorting => 'ਪਲੇਲਿਸਟ ਕਤਾਰ ਕ੍ਰਮਬੱਧੀ';

  @override
  String get playlistsRowSortingDescription =>
      'ਸ਼ਾਮਲ ਕਰਨ ਦੀ ਮਿਤੀ, ਰਿਲੀਜ਼ ਮਿਤੀ, ਵਰਣਮਾਲਾ ਅਨੁਸਾਰ ਅਤੇ ਹੋਰ ਦੁਆਰਾ ਪਲੇਲਿਸਟ ਕਤਾਰਾਂ ਕ੍ਰਮਬੱਧ ਕਰੋ।';

  @override
  String get displayAudioRows => 'ਆਡੀਓ ਕਤਾਰਾਂ ਦਿਖਾਓ';

  @override
  String get displayAudioRowsSubtitle => 'ਹੋਮ ਭਾਗਾਂ ਵਿੱਚ ਆਡੀਓ ਕਤਾਰਾਂ ਦਿਖਾਓ।';

  @override
  String get audioRowsSorting => 'ਆਡੀਓ ਕਤਾਰ ਕ੍ਰਮਬੱਧੀ';

  @override
  String get audioRowsSortingDescription =>
      'ਸ਼ਾਮਲ ਕਰਨ ਦੀ ਮਿਤੀ, ਰਿਲੀਜ਼ ਮਿਤੀ, ਵਰਣਮਾਲਾ ਅਨੁਸਾਰ ਅਤੇ ਹੋਰ ਦੁਆਰਾ ਆਡੀਓ ਕਤਾਰਾਂ ਕ੍ਰਮਬੱਧ ਕਰੋ।';

  @override
  String get audioPlaylists => 'ਆਡੀਓ ਪਲੇਲਿਸਟਸ';

  @override
  String get appearance => 'ਦਿੱਖ';

  @override
  String get layout => 'ਲੇਆਉਟ';

  @override
  String get theme => 'ਥੀਮ';

  @override
  String get keyboard => 'ਕੀਬੋਰਡ';

  @override
  String get navButtons => 'ਬਟਨ';

  @override
  String get rendering => 'ਰੈਂਡਰਿੰਗ';

  @override
  String get mpvConfiguration => 'MPV ਸੰਰਚਨਾ';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'ਬਾਹਰੀ ਪਲੇਅਰ ਐਪ';

  @override
  String get externalPlayerAppDescription =>
      'ਲੰਬੀ-ਦਬਾਓ ਪਲੇ ਵਿਕਲਪ ਸਮਰੱਥ ਕਰਨ ਲਈ ਬਾਹਰੀ ਪਲੇਅਰ ਸੈੱਟ ਕਰੋ';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'ਪਲੇਬੈਕ ਸ਼ੁਰੂ ਹੋਣ \'ਤੇ ਐਪ ਚੋਣਕਾਰ ਦਿਖਾਓ।';

  @override
  String get loadingInstalledPlayers => 'ਇੰਸਟਾਲ ਕੀਤੇ ਪਲੇਅਰ ਲੋਡ ਹੋ ਰਹੇ ਹਨ...';

  @override
  String get connection => 'ਕਨੈਕਸ਼ਨ';

  @override
  String get audioTranscodeTarget => 'ਆਡੀਓ ਟ੍ਰਾਂਸਕੋਡ ਟਾਰਗੇਟ';

  @override
  String get passthrough => 'ਪਾਸਥਰੂ';

  @override
  String get supportedOnThisDevice => 'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਸਮਰਥਿਤ';

  @override
  String get notSupportedOnThisDevice => 'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਸਮਰਥਿਤ ਨਹੀਂ';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) ਪਾਸਥਰੂ';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) ਬਾਹਰੀ ਡੀਕੋਡਰ ਨੂੰ ਬਿੱਟਸਟ੍ਰੀਮ ਕਰੋ।';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Atmos (JOC) ਨਾਲ TrueHD ਪਾਸਥਰੂ';

  @override
  String get mediaPlayerBehavior => 'ਮੀਡੀਆ ਪਲੇਅਰ ਵਿਹਾਰ';

  @override
  String get playbackEnhancements => 'ਪਲੇਬੈਕ ਸੁਧਾਰ';

  @override
  String get alwaysOn => 'ਹਮੇਸ਼ਾ ਚਾਲੂ।';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'ਸਕਿੱਪ ਆਊਟ੍ਰੋ ਨੂੰ ਅਗਲਾ ਡਿਸਪਲੇ ਨਾਲ ਬਦਲੋ';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'ਸਕਿੱਪ ਆਊਟ੍ਰੋ ਬਟਨ ਦੀ ਬਜਾਏ ਅਗਲਾ ਓਵਰਲੇ ਦਿਖਾਓ।';

  @override
  String get playerRouting => 'ਪਲੇਅਰ ਰੂਟਿੰਗ';

  @override
  String get preferSoftwareDecoders => 'ਸਾਫਟਵੇਅਰ ਡੀਕੋਡਰਾਂ ਨੂੰ ਤਰਜੀਹ ਦਿਓ';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'ਹਾਰਡਵੇਅਰ ਡੀਕੋਡਰਾਂ ਤੋਂ ਪਹਿਲਾਂ FFmpeg (ਆਡੀਓ) ਅਤੇ libgav1 (AV1) ਵਰਤੋ। ਜੇ HDMI ਆਡੀਓ ਪਾਸਥਰੂ ਟੁੱਟਦਾ ਹੈ ਤਾਂ ਅਯੋਗ ਕਰੋ।';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV \'ਤੇ ਆਪਣੀ ਚੁਣੀ ਬਾਹਰੀ ਐਪ ਵਿੱਚ ਵੀਡੀਓ ਪਲੇਬੈਕ ਖੋਲ੍ਹੋ।';

  @override
  String get automaticQueuing => 'ਆਟੋਮੈਟਿਕ ਕਤਾਰਬੰਦੀ';

  @override
  String get preferSdhSubtitles => 'SDH ਉਪਸਿਰਲੇਖਾਂ ਨੂੰ ਤਰਜੀਹ ਦਿਓ';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'ਆਪਣੇ-ਆਪ ਚੁਣਨ ਵੇਲੇ SDH/CC ਉਪਸਿਰਲੇਖ ਟਰੈਕਾਂ ਨੂੰ ਤਰਜੀਹ ਦਿਓ।';

  @override
  String get webDiagnostics => 'ਵੈੱਬ ਡਾਇਗਨੌਸਟਿਕਸ';

  @override
  String get webDiagnosticsTitle => 'Moonfin ਵੈੱਬ ਡਾਇਗਨੌਸਟਿਕਸ';

  @override
  String get webDiagnosticsIntro =>
      'ਬ੍ਰਾਊਜ਼ਰ ਕਨੈਕਟੀਵਿਟੀ ਮੁੱਦਿਆਂ (CORS, ਮਿਸ਼੍ਰਿਤ ਸਮੱਗਰੀ ਅਤੇ ਖੋਜ ਸੈਟਿੰਗਾਂ) ਦੀ ਜਾਂਚ ਕਰਨ ਲਈ ਇਸ ਪੰਨੇ ਦੀ ਵਰਤੋਂ ਕਰੋ।';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'ਮਿਸ਼੍ਰਿਤ-ਸਮੱਗਰੀ ਅਸਫਲਤਾ ਖੋਜੀ ਗਈ';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight ਅਸਫਲਤਾ ਖੋਜੀ ਗਈ';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin ਨੇ ਇੱਕ HTTPS ਪੰਨਾ ਖੋਜਿਆ ਜੋ ਇੱਕ HTTP ਸਰਵਰ URL ਨੂੰ ਕਾਲ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰ ਰਿਹਾ ਹੈ। ਬ੍ਰਾਊਜ਼ਰ ਇਸ ਬੇਨਤੀ ਨੂੰ ਤੁਹਾਡੇ ਸਰਵਰ ਤੱਕ ਪਹੁੰਚਣ ਤੋਂ ਪਹਿਲਾਂ ਬਲਾਕ ਕਰਦੇ ਹਨ।';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin ਨੇ ਬ੍ਰਾਊਜ਼ਰ-ਪੱਧਰ ਦੀ ਬੇਨਤੀ ਅਸਫਲਤਾ ਖੋਜੀ ਜੋ ਆਮ ਤੌਰ \'ਤੇ ਮੀਡੀਆ ਸਰਵਰ \'ਤੇ ਗਾਇਬ CORS ਜਾਂ preflight ਹੈੱਡਰਾਂ ਕਾਰਨ ਹੁੰਦੀ ਹੈ।';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'ਟਾਰਗੇਟ URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'ਵੇਰਵਾ: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'ਮੌਜੂਦਾ ਰਨਟਾਈਮ ਸੰਦਰਭ';

  @override
  String get webDiagnosticsOrigin => 'ਮੂਲ';

  @override
  String get webDiagnosticsScheme => 'ਸਕੀਮ';

  @override
  String get webDiagnosticsPluginMode => 'ਪਲੱਗਇਨ ਮੋਡ';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC ਸਕੈਨ';

  @override
  String get webDiagnosticsForcedServerUrl => 'ਜ਼ਬਰਦਸਤੀ ਸਰਵਰ URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'ਡਿਫਾਲਟ ਸਰਵਰ URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'ਖੋਜ ਪ੍ਰੌਕਸੀ URL';

  @override
  String get notConfigured => 'ਸੰਰਚਿਤ ਨਹੀਂ';

  @override
  String get webDiagnosticsMixedContent => 'ਮਿਸ਼੍ਰਿਤ ਸਮੱਗਰੀ';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'ਇਹ ਪੰਨਾ HTTPS ਉੱਤੇ ਲੋਡ ਹੋਇਆ ਹੈ, ਪਰ ਇੱਕ ਜਾਂ ਵੱਧ ਸੰਰਚਿਤ URL HTTP ਹਨ। ਬ੍ਰਾਊਜ਼ਰ HTTPS ਪੰਨਿਆਂ ਨੂੰ HTTP API ਕਾਲ ਕਰਨ ਤੋਂ ਬਲਾਕ ਕਰਦੇ ਹਨ।';

  @override
  String get webDiagnosticsMixedContentFix =>
      'ਹੱਲ: ਆਪਣੇ ਮੀਡੀਆ ਸਰਵਰ ਜਾਂ ਪ੍ਰੌਕਸੀ ਐਂਡਪੁਆਇੰਟ ਨੂੰ HTTPS ਰਾਹੀਂ ਪੇਸ਼ ਕਰੋ, ਜਾਂ Moonfin ਨੂੰ ਸਿਰਫ ਭਰੋਸੇਯੋਗ ਸਥਾਨਕ ਨੈੱਟਵਰਕਾਂ \'ਤੇ HTTP ਉੱਤੇ ਲੋਡ ਕਰੋ।';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'ਮੌਜੂਦਾ ਰਨਟਾਈਮ ਸੈਟਿੰਗਾਂ ਤੋਂ ਕੋਈ ਸਪੱਸ਼ਟ ਮਿਸ਼੍ਰਿਤ-ਸਮੱਗਰੀ ਸੰਰਚਨਾ ਨਹੀਂ ਖੋਜੀ ਗਈ।';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS ਜਾਂਚ-ਸੂਚੀ';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin ਵਿੱਚ ਬ੍ਰਾਊਜ਼ਰ ਮੂਲ ਦੀ ਆਗਿਆ ਦਿਓ।';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers ਵਿੱਚ Authorization, X-Emby-Authorization ਅਤੇ X-Emby-Token ਸ਼ਾਮਲ ਕਰੋ।';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• ਸਟ੍ਰੀਮਿੰਗ ਅਤੇ ਸੀਕ ਵਿਹਾਰ ਲਈ Content-Range ਅਤੇ Accept-Ranges ਪ੍ਰਗਟ ਕਰੋ।';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight ਬੇਨਤੀਆਂ ਨੂੰ 204 ਵਾਪਸ ਕਰੋ।';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'ਉਦਾਹਰਨ ਹੈੱਡਰ ਸਨਿੱਪਟ (nginx-ਸ਼ੈਲੀ)';

  @override
  String get note => 'ਨੋਟ';

  @override
  String get webDiagnosticsNonWebNote =>
      'ਇਹ ਡਾਇਗਨੌਸਟਿਕਸ ਰੂਟ ਵੈੱਬ ਬਿਲਡਾਂ ਲਈ ਹੈ। ਜੇ ਤੁਸੀਂ ਇਸ ਨੂੰ ਕਿਸੇ ਹੋਰ ਪਲੇਟਫਾਰਮ \'ਤੇ ਦੇਖ ਰਹੇ ਹੋ, ਤਾਂ ਇਹ ਜਾਂਚਾਂ ਲਾਗੂ ਨਹੀਂ ਹੋ ਸਕਦੀਆਂ।';

  @override
  String get backToServerSelect => 'ਸਰਵਰ ਚੋਣ \'ਤੇ ਵਾਪਸ';

  @override
  String get signOutAllUsers => 'ਸਾਰੇ ਯੂਜ਼ਰ ਸਾਈਨ ਆਉਟ ਕਰੋ';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'ਮਾਈਕ੍ਰੋਫੋਨ ਅਨੁਮਤੀ ਸਥਾਈ ਤੌਰ \'ਤੇ ਇਨਕਾਰ ਕੀਤੀ ਗਈ ਹੈ। ਇਸ ਨੂੰ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਸਮਰੱਥ ਕਰੋ।';

  @override
  String get voiceSearchPermissionRequired =>
      'ਵੌਇਸ ਖੋਜ ਲਈ ਮਾਈਕ੍ਰੋਫੋਨ ਅਨੁਮਤੀ ਦੀ ਲੋੜ ਹੈ।';

  @override
  String get voiceSearchNoMatch => 'ਇਹ ਸਮਝ ਨਹੀਂ ਆਇਆ। ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get voiceSearchNoSpeechDetected => 'ਕੋਈ ਭਾਸ਼ਣ ਨਹੀਂ ਖੋਜਿਆ।';

  @override
  String get voiceSearchMicrophoneError => 'ਮਾਈਕ੍ਰੋਫੋਨ ਗਲਤੀ।';

  @override
  String get voiceSearchNeedsInternet => 'ਵੌਇਸ ਖੋਜ ਨੂੰ ਇੰਟਰਨੈੱਟ ਦੀ ਲੋੜ ਹੈ।';

  @override
  String get voiceSearchServiceBusy =>
      'ਵੌਇਸ ਸੇਵਾ ਰੁੱਝੀ ਹੋਈ ਹੈ। ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'ਮਾਈਕ੍ਰੋਫੋਨ ਅਨੁਮਤੀ ਸਥਾਈ ਤੌਰ \'ਤੇ ਇਨਕਾਰ ਕੀਤੀ ਗਈ ਹੈ।';

  @override
  String get microphonePermissionDenied =>
      'ਮਾਈਕ੍ਰੋਫੋਨ ਅਨੁਮਤੀ ਇਨਕਾਰ ਕੀਤੀ ਗਈ ਹੈ।';

  @override
  String get speechRecognitionUnavailable =>
      'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਭਾਸ਼ਣ ਪਛਾਣ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get openIosRoutePicker => 'iOS ਰੂਟ ਚੋਣਕਾਰ ਖੋਲ੍ਹੋ';

  @override
  String get airPlayRoutePickerUnavailable =>
      'ਇਸ ਡਿਵਾਈਸ \'ਤੇ AirPlay ਰੂਟ ਚੋਣਕਾਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get videos => 'ਵੀਡੀਓ';

  @override
  String get programs => 'ਪ੍ਰੋਗਰਾਮ';

  @override
  String get songs => 'ਗੀਤ';

  @override
  String get photoAlbums => 'ਫੋਟੋ ਐਲਬਮਾਂ';

  @override
  String get photos => 'ਫੋਟੋ';

  @override
  String get people => 'ਲੋਕ';

  @override
  String get recentlyReleasedEpisodes => 'ਹਾਲ ਹੀ ਵਿੱਚ ਜਾਰੀ ਐਪੀਸੋਡ';

  @override
  String get watchAgain => 'ਦੁਬਾਰਾ ਦੇਖੋ';

  @override
  String get guestAppearances => 'ਮਹਿਮਾਨ ਪੇਸ਼ਕਾਰੀਆਂ';

  @override
  String get appearancesSeerr => 'ਪੇਸ਼ਕਾਰੀਆਂ (Seerr)';

  @override
  String get crewContributionsSeerr => 'ਕਰੂ ਯੋਗਦਾਨ (Seerr)';

  @override
  String get watchWithGroup => 'ਸਮੂਹ ਨਾਲ ਦੇਖੋ';

  @override
  String get errors => 'ਗਲਤੀਆਂ';

  @override
  String get warnings => 'ਚੇਤਾਵਨੀਆਂ';

  @override
  String get disk => 'ਡਿਸਕ';

  @override
  String get openInBrowser => 'ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੋਲ੍ਹੋ';

  @override
  String get embeddedBrowserNotAvailable =>
      'ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ ਏਮਬੈੱਡਡ ਬ੍ਰਾਊਜ਼ਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get adminRestartServerConfirmation =>
      'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਸਰਵਰ ਮੁੜ-ਚਾਲੂ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get adminShutdownServerConfirmation =>
      'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਸਰਵਰ ਬੰਦ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ? ਤੁਹਾਨੂੰ ਇਸ ਨੂੰ ਹੱਥੀਂ ਮੁੜ-ਚਾਲੂ ਕਰਨਾ ਪਵੇਗਾ।';

  @override
  String get internal => 'ਅੰਦਰੂਨੀ';

  @override
  String get idle => 'ਵਿਹਲਾ';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'ਕੋਈ ਯੂਜ਼ਰ ਨਹੀਂ ਮਿਲੇ';

  @override
  String get adminNoUsersMatchSearch =>
      'ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਕੋਈ ਯੂਜ਼ਰ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String get adminNoDevicesFound => 'ਕੋਈ ਡਿਵਾਈਸ ਨਹੀਂ ਮਿਲੇ';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'ਮੌਜੂਦਾ ਫਿਲਟਰਾਂ ਨਾਲ ਕੋਈ ਡਿਵਾਈਸ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String get passwordSet => 'ਪਾਸਵਰਡ ਸੈੱਟ ਕੀਤਾ';

  @override
  String get noPasswordConfigured => 'ਕੋਈ ਪਾਸਵਰਡ ਸੰਰਚਿਤ ਨਹੀਂ';

  @override
  String get remoteAccess => 'ਰਿਮੋਟ ਪਹੁੰਚ';

  @override
  String get localOnly => 'ਸਿਰਫ ਲੋਕਲ';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'ਮੀਡੀਆ ਵਿਸ਼ਲੇਸ਼ਣ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'ਸਾਰੀਆਂ ਮੀਡੀਆ ਲਾਇਬ੍ਰੇਰੀਆਂ ਵਿੱਚ ਸੰਯੁਕਤ ਵਿਸ਼ਲੇਸ਼ਣ।';

  @override
  String get analyticsTopArtists => 'ਚੋਟੀ ਦੇ ਕਲਾਕਾਰ';

  @override
  String get analyticsTopAuthors => 'ਚੋਟੀ ਦੇ ਲੇਖਕ';

  @override
  String get analyticsTopContributors => 'ਚੋਟੀ ਦੇ ਯੋਗਦਾਨੀ';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਲਾਇਬ੍ਰੇਰੀਆਂ',
      one: '1 ਲਾਇਬ੍ਰੇਰੀ',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'ਇਸ ਚੋਣ ਲਈ ਅਜੇ ਕੋਈ ਸੂਚੀਬੱਧ ਮੀਡੀਆ ਕੁੱਲ ਉਪਲਬਧ ਨਹੀਂ ਹਨ।';

  @override
  String get analyticsLibraryDetails => 'ਲਾਇਬ੍ਰੇਰੀ ਵੇਰਵੇ';

  @override
  String get analyticsLibraryBreakdown => 'ਲਾਇਬ੍ਰੇਰੀ ਵੇਰਵਾ';

  @override
  String get analyticsNoLibrariesAvailable => 'ਕੋਈ ਲਾਇਬ੍ਰੇਰੀਆਂ ਉਪਲਬਧ ਨਹੀਂ ਹਨ।';

  @override
  String get adminServerAdministrationTitle => 'ਸਰਵਰ ਪ੍ਰਸ਼ਾਸਨ';

  @override
  String get adminServerPathData => 'ਡੇਟਾ';

  @override
  String get adminServerPathImageCache => 'ਚਿੱਤਰ ਕੈਸ਼';

  @override
  String get adminServerPathCache => 'ਕੈਸ਼';

  @override
  String get adminServerPathLogs => 'ਲੌਗ';

  @override
  String get adminServerPathMetadata => 'ਮੈਟਾਡਾਟਾ';

  @override
  String get adminServerPathTranscode => 'ਟ੍ਰਾਂਸਕੋਡ';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'ਇਸ ਸਰਵਰ ਦੁਆਰਾ ਕੋਈ ਸਰਵਰ ਪਾਥ ਵਾਪਸ ਨਹੀਂ ਕੀਤੇ ਗਏ।';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ਵਰਤਿਆ';
  }

  @override
  String get userActivity => 'ਯੂਜ਼ਰ ਗਤੀਵਿਧੀ';

  @override
  String get systemEvents => 'ਸਿਸਟਮ ਘਟਨਾਵਾਂ';

  @override
  String get needsAttention => 'ਧਿਆਨ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get adminDrawerSectionServer => 'ਸਰਵਰ';

  @override
  String get adminDrawerSectionPlayback => 'ਪਲੇਬੈਕ';

  @override
  String get adminDrawerSectionDevices => 'ਡਿਵਾਈਸ';

  @override
  String get adminDrawerSectionAdvanced => 'ਉੱਨਤ';

  @override
  String get adminDrawerSectionPlugins => 'ਪਲੱਗਇਨ';

  @override
  String get adminDrawerSectionLiveTv => 'ਲਾਈਵ ਟੀਵੀ';

  @override
  String get homeVideos => 'ਹੋਮ ਵੀਡੀਓ';

  @override
  String get mixedContent => 'ਮਿਸ਼੍ਰਿਤ ਸਮੱਗਰੀ';

  @override
  String get homeVideosAndPhotos => 'ਹੋਮ ਵੀਡੀਓ ਅਤੇ ਫੋਟੋ';

  @override
  String get mixedMoviesAndShows => 'ਮਿਸ਼੍ਰਿਤ ਫਿਲਮਾਂ ਅਤੇ ਸ਼ੋਅ';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'ਕੋਈ ਰਿਕਾਰਡਿੰਗ ਨਹੀਂ ਮਿਲੀ';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension ਆਰਕਾਈਵ ਦੇ ਅੰਦਰ ਕੋਈ ਚਿੱਤਰ ਪੰਨੇ ਨਹੀਂ ਮਿਲੇ।';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'ਏਮਬੈੱਡਡ ਰੈਂਡਰਰ ਅਸਫਲ ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB ਰੈਂਡਰਰ ਅਸਫਲ ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'ਰੀਡਰ ਲਈ ਲੋਕਲ ਫਾਈਲ ਗਾਇਬ: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri ਤੋਂ ਕਿਤਾਬ ਡੇਟਾ ਖੋਲ੍ਹਦੇ ਸਮੇਂ HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'ਕੋਈ ਪੜ੍ਹਨਯੋਗ ਕਿਤਾਬ ਐਂਡਪੁਆਇੰਟ ਉਪਲਬਧ ਨਹੀਂ';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'ਅਸਮਰਥਿਤ ਕਾਮਿਕ ਆਰਕਾਈਵ ਫਾਰਮੈਟ: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ CBR ਕੱਢਣ ਵਾਲਾ ਪਲੱਗਇਨ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get failedToExtractCbrArchive => '.cbr ਆਰਕਾਈਵ ਕੱਢਣ ਵਿੱਚ ਅਸਫਲ।';

  @override
  String get cb7ExtractionUnavailable =>
      'ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ CB7 ਕੱਢਣਾ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'ਇਸ ਪਲੇਟਫਾਰਮ \'ਤੇ CB7 ਕੱਢਣ ਵਾਲਾ ਪਲੱਗਇਨ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get closeGenrePanel => 'ਸ਼ੈਲੀ ਪੈਨਲ ਬੰਦ ਕਰੋ';

  @override
  String get loadingShuffle => 'ਸ਼ਫਲ ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get libraryShuffleLabel => 'ਲਾਇਬ੍ਰੇਰੀ ਸ਼ਫਲ';

  @override
  String get randomShuffleLabel => 'ਬੇਤਰਤੀਬ ਸ਼ਫਲ';

  @override
  String get genresShuffleLabel => 'ਸ਼ੈਲੀ ਸ਼ਫਲ';

  @override
  String get autoHdrSwitching => 'ਆਟੋ HDR ਸਵਿਚਿੰਗ';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR ਵੀਡੀਓ ਪਲੇਬੈਕ ਲਈ ਆਪਣੇ-ਆਪ HDR ਸਮਰੱਥ ਕਰੋ ਅਤੇ ਬਾਹਰ ਨਿਕਲਣ \'ਤੇ ਡਿਸਪਲੇ ਮੋਡ ਬਹਾਲ ਕਰੋ।';

  @override
  String get whenFullscreen => 'ਜਦੋਂ ਪੂਰੀ ਸਕ੍ਰੀਨ ਹੋਵੇ';

  @override
  String get changeArtwork => 'ਆਰਟਵਰਕ ਬਦਲੋ';

  @override
  String get missing => 'ਗਾਇਬ';

  @override
  String get transcodingLimits => 'ਟ੍ਰਾਂਸਕੋਡਿੰਗ ਸੀਮਾਵਾਂ';

  @override
  String get clearAllArtworkButton => 'ਸਾਰਾ ਆਰਟਵਰਕ ਸਾਫ਼ ਕਰਨਾ ਹੈ?';

  @override
  String get clearAllArtworkWarning =>
      'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਸਾਰਾ ਡਾਊਨਲੋਡ ਕੀਤਾ ਆਰਟਵਰਕ ਸਾਫ਼ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get confirmClear => 'ਸਾਫ਼ ਕਰਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String confirmClearMessage(String itemType) {
    return 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਇਹ $itemType ਸਾਫ਼ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';
  }

  @override
  String get uploadButton => 'ਅੱਪਲੋਡ ਕਰਨਾ ਹੈ?';

  @override
  String get resolutionLabel => 'ਰੈਜ਼ੋਲਿਊਸ਼ਨ: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'ਸਿਰਫ ਇੰਟਰਫੇਸ ਭਾਸ਼ਾ ਵਿੱਚ ਆਰਟਵਰਕ ਦਿਖਾਓ';

  @override
  String get confirmClearAll => 'ਸਭ ਸਾਫ਼ ਕਰਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get imageUploadSuccess => 'ਚਿੱਤਰ ਸਫਲਤਾਪੂਰਵਕ ਅੱਪਲੋਡ ਕੀਤਾ!';

  @override
  String imageUploadFailed(String error) {
    return 'ਚਿੱਤਰ ਅੱਪਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'ਚਿੱਤਰ ਸੈੱਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'ਚਿੱਤਰ ਮਿਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'ਸਾਰਾ ਆਰਟਵਰਕ ਸਾਫ਼ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get yes => 'ਹਾਂ';

  @override
  String get posterCategory => 'ਪੋਸਟਰ';

  @override
  String get backdropsCategory => 'ਪਿਛੋਕੜ';

  @override
  String get bannerCategory => 'ਬੈਨਰ';

  @override
  String get logoCategory => 'ਲੋਗੋ';

  @override
  String get thumbnailCategory => 'ਥੰਬਨੇਲ';

  @override
  String get artCategory => 'ਕਲਾ';

  @override
  String get discArtCategory => 'ਡਿਸਕ ਕਲਾ';

  @override
  String get screenshotCategory => 'ਸਕ੍ਰੀਨਸ਼ਾਟ';

  @override
  String get boxCoverCategory => 'ਬਾਕਸ ਕਵਰ';

  @override
  String get boxRearCoverCategory => 'ਬਾਕਸ ਪਿਛਲਾ ਕਵਰ';

  @override
  String get menuArtCategory => 'ਮੀਨੂ ਕਲਾ';

  @override
  String get confirmItemPoster => 'ਪੋਸਟਰ';

  @override
  String get confirmItemBackdrop => 'ਪਿਛੋਕੜ';

  @override
  String get confirmItemBanner => 'ਬੈਨਰ';

  @override
  String get confirmItemLogo => 'ਲੋਗੋ';

  @override
  String get confirmItemThumbnail => 'ਥੰਬਨੇਲ';

  @override
  String get confirmItemArt => 'ਕਲਾ';

  @override
  String get confirmItemDiscArt => 'ਡਿਸਕ ਕਲਾ';

  @override
  String get confirmItemScreenshot => 'ਸਕ੍ਰੀਨਸ਼ਾਟ';

  @override
  String get confirmItemBoxCover => 'ਬਾਕਸ ਕਵਰ';

  @override
  String get confirmItemBoxRearCover => 'ਬਾਕਸ ਪਿਛਲਾ ਕਵਰ';

  @override
  String get confirmItemMenuArt => 'ਮੀਨੂ ਕਲਾ';

  @override
  String get resolutionAll => 'ਸਾਰੇ';

  @override
  String get resolutionHigh => 'ਉੱਚ (1080p+)';

  @override
  String get resolutionMedium => 'ਦਰਮਿਆਨਾ (720p)';

  @override
  String get resolutionLow => 'ਘੱਟ (<720p)';

  @override
  String get sources => 'ਸਰੋਤ';

  @override
  String get audiobookChapters => 'ਅਧਿਆਏ';

  @override
  String get audiobookBookmarks => 'ਬੁੱਕਮਾਰਕ';

  @override
  String get audiobookNotes => 'ਨੋਟਸ';

  @override
  String get audiobookQueue => 'ਕਤਾਰ';

  @override
  String get audiobookTimeline => 'ਟਾਈਮਲਾਈਨ';

  @override
  String get audiobookTimelineEmpty => 'ਟਾਈਮਲਾਈਨ ਖਾਲੀ ਹੈ';

  @override
  String get audiobookFocusedTimeline => 'ਕੇਂਦਰਿਤ ਟਾਈਮਲਾਈਨ';

  @override
  String get audiobookExportBookmarks => 'ਬੁੱਕਮਾਰਕ ਨਿਰਯਾਤ ਕਰੋ';

  @override
  String get audiobookExportNotes => 'ਨੋਟਸ ਨਿਰਯਾਤ ਕਰੋ';

  @override
  String get audiobookExportAll => 'ਸਭ ਨਿਰਯਾਤ ਕਰੋ';

  @override
  String audiobookExportSuccess(String path) {
    return '$path ਵਿੱਚ ਨਿਰਯਾਤ ਕੀਤਾ';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'ਨਿਰਯਾਤ ਅਸਫਲ: $error';
  }

  @override
  String get audiobookLyrics => 'ਬੋਲ';

  @override
  String get audiobookAddBookmark => 'ਬੁੱਕਮਾਰਕ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get audiobookAddNote => 'ਨੋਟ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get audiobookEditNote => 'ਨੋਟ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get audiobookNoteHint => 'ਇਸ ਪਲ ਲਈ ਇੱਕ ਨੋਟ ਲਿਖੋ';

  @override
  String get audiobookSleepTimer => 'ਸਲੀਪ ਟਾਈਮਰ';

  @override
  String get audiobookSleepOff => 'ਬੰਦ';

  @override
  String get audiobookSleepEndOfChapter => 'ਅਧਿਆਏ ਦੇ ਅੰਤ';

  @override
  String get audiobookSleepCustom => 'ਕਸਟਮ';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining ਬਾਕੀ';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਮਿੰਟ',
      one: '1 ਮਿੰਟ',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'ਪਲੇਬੈਕ ਗਤੀ';

  @override
  String get audiobookRemainingTime => 'ਬਾਕੀ';

  @override
  String get audiobookElapsedTime => 'ਬੀਤਿਆ';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$secondsਸ ਪਿੱਛੇ';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$secondsਸ ਅੱਗੇ';
  }

  @override
  String get audiobookPreviousChapter => 'ਪਿਛਲਾ ਅਧਿਆਏ';

  @override
  String get audiobookNextChapter => 'ਅਗਲਾ ਅਧਿਆਏ';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$total ਵਿੱਚੋਂ ਅਧਿਆਏ $current';
  }

  @override
  String get audiobookNoChapters => 'ਕੋਈ ਅਧਿਆਏ ਨਹੀਂ';

  @override
  String get audiobookNoBookmarks => 'ਅਜੇ ਕੋਈ ਬੁੱਕਮਾਰਕ ਨਹੀਂ';

  @override
  String get audiobookNoNotes => 'ਅਜੇ ਕੋਈ ਨੋਟਸ ਨਹੀਂ';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position \'ਤੇ ਬੁੱਕਮਾਰਕ ਸ਼ਾਮਲ ਕੀਤਾ';
  }

  @override
  String get audiobookSpeedReset => '1.0x \'ਤੇ ਰੀਸੈਟ ਕਰੋ';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'ਸੇਵ ਕਰੋ';

  @override
  String get audiobookCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get audiobookDelete => 'ਮਿਟਾਓ';

  @override
  String get subtitlePreferences => 'ਉਪਸਿਰਲੇਖ ਤਰਜੀਹਾਂ';

  @override
  String get subtitlePreferencesDescription =>
      'ਉਪਸਿਰਲੇਖ ਮੋਡ, ਡਿਫਾਲਟ ਭਾਸ਼ਾਵਾਂ, ਦਿੱਖ ਅਤੇ ਰੈਂਡਰਿੰਗ ਵਿਕਲਪ ਬਦਲੋ।';

  @override
  String get subtitleRendering => 'ਉਪਸਿਰਲੇਖ ਰੈਂਡਰਿੰਗ';

  @override
  String get displayOptions => 'ਡਿਸਪਲੇ ਵਿਕਲਪ';

  @override
  String get releaseDateAscending => 'ਰਿਲੀਜ਼ ਮਿਤੀ (ਵਧਦੇ ਕ੍ਰਮ)';

  @override
  String get releaseDateDescending => 'ਰਿਲੀਜ਼ ਮਿਤੀ (ਘਟਦੇ ਕ੍ਰਮ)';

  @override
  String get groupContributions => 'ਯੋਗਦਾਨ ਸਮੂਹ ਕਰੋ';

  @override
  String get groupMultipleRoles => 'ਕਈ ਭੂਮਿਕਾਵਾਂ ਸਮੂਹ ਕਰੋ';

  @override
  String get libraryWriteAccessWarningTitle => 'ਲਾਇਬ੍ਰੇਰੀ ਲਿਖਣ ਪਹੁੰਚ ਚੇਤਾਵਨੀ';

  @override
  String get libraryWriteAccessHowToFix => 'ਇਸ ਨੂੰ ਕਿਵੇਂ ਠੀਕ ਕਰਨਾ ਹੈ:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. ਸਰਵਰ \'ਤੇ ਆਪਣੇ ਮੀਡੀਆ ਲਾਇਬ੍ਰੇਰੀ ਫੋਲਡਰਾਂ ਲਈ Jellyfin ਸੇਵਾ ਯੂਜ਼ਰ (ਜਿਵੇਂ, jellyfin ਜਾਂ Docker PUID/PGID) ਨੂੰ ਲਿਖਣ ਦੀਆਂ ਅਨੁਮਤੀਆਂ ਦਿਓ।\n\n2. ਜਾਂ, ਆਪਣੇ Jellyfin ਡੈਸ਼ਬੋਰਡ -> ਲਾਇਬ੍ਰੇਰੀਆਂ \'ਤੇ ਜਾਓ, ਇਸ ਲਾਇਬ੍ਰੇਰੀ ਨੂੰ ਸੰਪਾਦਿਤ ਕਰੋ, ਅਤੇ ਆਰਟਵਰਕ ਨੂੰ Jellyfin ਦੇ ਅੰਦਰੂਨੀ ਡਾਟਾਬੇਸ ਵਿੱਚ ਸਟੋਰ ਕਰਨ ਲਈ \'Save artwork into media folders\' ਨੂੰ ਅਯੋਗ ਕਰੋ।';

  @override
  String get dismiss => 'ਖਾਰਜ ਕਰੋ';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'ਤੁਹਾਡੀ \'$libraryName\' ਲਾਇਬ੍ਰੇਰੀ ਆਰਟਵਰਕ ਨੂੰ ਸਿੱਧਾ ਮੀਡੀਆ ਫੋਲਡਰਾਂ ਵਿੱਚ ਸੇਵ ਕਰਨ ਲਈ ਸੰਰਚਿਤ ਹੈ (\'Save artwork into media folders\' ਸਮਰੱਥ ਹੈ)। ਹਾਲਾਂਕਿ, Jellyfin ਨੇ ਲਿਖਣ ਪਹੁੰਚ ਦੀ ਜਾਂਚ ਕੀਤੀ ਹੈ ਅਤੇ ਇਸ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਫਾਈਲਾਂ ਲਿਖਣ ਦੀ ਅਨੁਮਤੀ ਨਹੀਂ ਹੈ:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'ਇੰਝ ਲੱਗਦਾ ਹੈ ਕਿ Jellyfin ਆਰਟਵਰਕ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ ਰਿਹਾ। ਤੁਹਾਡੀ ਲਾਇਬ੍ਰੇਰੀ ਆਰਟਵਰਕ ਨੂੰ ਸਿੱਧਾ ਮੀਡੀਆ ਫੋਲਡਰਾਂ ਵਿੱਚ ਸੇਵ ਕਰਨ ਲਈ ਸੰਰਚਿਤ ਹੈ (\'Save artwork into media folders\' ਸਮਰੱਥ ਹੈ)। ਇਹ ਗਲਤੀ ਆਮ ਤੌਰ \'ਤੇ ਉਦੋਂ ਹੁੰਦੀ ਹੈ ਜਦੋਂ Jellyfin ਸਰਵਰ ਪ੍ਰਕਿਰਿਆ ਕੋਲ ਤੁਹਾਡੀਆਂ ਮੀਡੀਆ ਡਾਇਰੈਕਟਰੀਆਂ ਵਿੱਚ ਫਾਈਲਾਂ ਲਿਖਣ ਦੀ ਅਨੁਮਤੀ ਨਹੀਂ ਹੁੰਦੀ।';

  @override
  String get externalLists => 'ਬਾਹਰੀ ਸੂਚੀਆਂ';

  @override
  String get replay => 'ਦੁਬਾਰਾ ਚਲਾਓ';

  @override
  String get fileInformation => 'ਫਾਈਲ ਜਾਣਕਾਰੀ';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'ਆਕਾਰ: $size  •  ਫਾਰਮੈਟ: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'ਸਾਰੇ ($count) ਆਡੀਓ ਟਰੈਕ ਦਿਖਾਓ';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'ਸਾਰੇ ($count) ਉਪਸਿਰਲੇਖ ਟਰੈਕ ਦਿਖਾਓ';
  }

  @override
  String get checkingDirectPlay => 'ਡਾਇਰੈਕਟ ਪਲੇ ਸਮਰੱਥਾ ਜਾਂਚ ਰਹੇ ਹਾਂ...';

  @override
  String get directPlayCapabilityLabel => 'ਡਾਇਰੈਕਟ ਪਲੇ ਸਮਰੱਥਾ: ';

  @override
  String get forced => 'ਲਾਜ਼ਮੀ';

  @override
  String get transcodeContainerNotSupported =>
      'ਕੰਟੇਨਰ ਫਾਰਮੈਟ ਪਲੇਅਰ ਦੁਆਰਾ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get transcodeVideoCodecNotSupported => 'ਵੀਡੀਓ ਕੋਡੇਕ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get transcodeAudioCodecNotSupported => 'ਆਡੀਓ ਕੋਡੇਕ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'ਉਪਸਿਰਲੇਖ ਫਾਰਮੈਟ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ (ਬਰਨਿੰਗ ਦੀ ਲੋੜ ਹੈ)।';

  @override
  String get transcodeAudioProfileNotSupported =>
      'ਆਡੀਓ ਪ੍ਰੋਫਾਈਲ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get transcodeVideoProfileNotSupported =>
      'ਵੀਡੀਓ ਪ੍ਰੋਫਾਈਲ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get transcodeVideoLevelNotSupported => 'ਵੀਡੀਓ ਪੱਧਰ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'ਇਸ ਡਿਵਾਈਸ ਦੁਆਰਾ ਵੀਡੀਓ ਰੈਜ਼ੋਲਿਊਸ਼ਨ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'ਵੀਡੀਓ ਬਿੱਟ ਡੂੰਘਾਈ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'ਵੀਡੀਓ ਫ੍ਰੇਮਰੇਟ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'ਫਾਈਲ ਬਿੱਟਰੇਟ ਪਲੇਅਰ ਸਟ੍ਰੀਮਿੰਗ ਸੀਮਾ ਤੋਂ ਵੱਧ ਹੈ।';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'ਵੀਡੀਓ ਬਿੱਟਰੇਟ ਸਟ੍ਰੀਮਿੰਗ ਸੀਮਾ ਤੋਂ ਵੱਧ ਹੈ।';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'ਆਡੀਓ ਬਿੱਟਰੇਟ ਸਟ੍ਰੀਮਿੰਗ ਸੀਮਾ ਤੋਂ ਵੱਧ ਹੈ।';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'ਆਡੀਓ ਚੈਨਲਾਂ ਦੀ ਗਿਣਤੀ ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String get sortAlphabetical => 'ਵਰਣਮਾਲਾ ਅਨੁਸਾਰ';

  @override
  String get sortReleaseAscending => 'ਰਿਲੀਜ਼ ਕ੍ਰਮ (ਵਧਦੇ ਕ੍ਰਮ)';

  @override
  String get sortReleaseDescending => 'ਰਿਲੀਜ਼ ਕ੍ਰਮ (ਘਟਦੇ ਕ੍ਰਮ)';

  @override
  String get sortCustomDragDrop => 'ਕਸਟਮ (ਖਿੱਚੋ-ਅਤੇ-ਛੱਡੋ)';

  @override
  String get playlistSortOptions => 'ਪਲੇਲਿਸਟ ਕ੍ਰਮਬੱਧ ਵਿਕਲਪ';

  @override
  String get resetSort => 'ਕ੍ਰਮਬੱਧੀ ਰੀਸੈਟ ਕਰੋ';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode ਦੁਬਾਰਾ ਦੇਖੋ';
  }

  @override
  String get rewatchPlaylist => 'ਪਲੇਲਿਸਟ ਦੁਬਾਰਾ ਦੇਖੋ';

  @override
  String get noSubtitlesFound => 'ਕੋਈ ਉਪਸਿਰਲੇਖ ਨਹੀਂ ਮਿਲੇ।';

  @override
  String get adminControls => 'ਐਡਮਿਨ ਕੰਟਰੋਲ';

  @override
  String get impellerRendering => 'ਰੈਂਡਰਿੰਗ ਇੰਜਣ (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller ਸੁਚੱਜੀਆਂ ਐਨੀਮੇਸ਼ਨਾਂ ਅਤੇ ਘੱਟ ਲੜਖੜਾਹਟ ਲਈ Flutter ਦਾ ਆਧੁਨਿਕ GPU ਰੈਂਡਰਰ ਹੈ। ਕੁਝ TV ਬਾਕਸਾਂ ਅਤੇ ਪੁਰਾਣੇ GPU \'ਤੇ ਇਹ ਗੜਬੜ ਜਾਂ ਕਾਲੀ ਵੀਡੀਓ ਦਾ ਕਾਰਨ ਬਣ ਸਕਦਾ ਹੈ; ਜੇ ਤੁਸੀਂ ਇਹ ਦੇਖਦੇ ਹੋ ਤਾਂ ਇਸ ਨੂੰ ਬੰਦ ਕਰੋ। ਆਟੋਮੈਟਿਕ ਤੁਹਾਡੇ ਡਿਵਾਈਸ ਲਈ ਸਭ ਤੋਂ ਵਧੀਆ ਡਿਫਾਲਟ ਚੁਣਦਾ ਹੈ। ਲਾਗੂ ਕਰਨ ਲਈ Moonfin ਮੁੜ-ਚਾਲੂ ਕਰੋ।';

  @override
  String get impellerAuto => 'ਆਟੋਮੈਟਿਕ';

  @override
  String get impellerOn => 'ਚਾਲੂ';

  @override
  String get impellerOff => 'ਬੰਦ';

  @override
  String get impellerRestartTitle => 'ਮੁੜ-ਚਾਲੂ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get impellerRestartMessage =>
      'ਰੈਂਡਰਿੰਗ ਇੰਜਣ ਬਦਲਣ ਲਈ Moonfin ਨੂੰ ਮੁੜ-ਚਾਲੂ ਕਰਨ ਦੀ ਲੋੜ ਹੈ। ਹੁਣ ਐਪ ਬੰਦ ਕਰੋ, ਫਿਰ ਲਾਗੂ ਕਰਨ ਲਈ ਇਸ ਨੂੰ ਦੁਬਾਰਾ ਖੋਲ੍ਹੋ।';

  @override
  String get impellerCloseNow => 'ਹੁਣ ਐਪ ਬੰਦ ਕਰੋ';

  @override
  String get adminRefreshLibrary => 'ਲਾਇਬ੍ਰੇਰੀ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get adminRefreshAllLibraries => 'ਸਾਰੀਆਂ ਲਾਇਬ੍ਰੇਰੀਆਂ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get adminRepoSortDateOldest =>
      'ਸ਼ਾਮਲ ਕਰਨ ਦੀ ਮਿਤੀ (ਸਭ ਤੋਂ ਪੁਰਾਣੀ ਪਹਿਲਾਂ)';

  @override
  String get adminRepoSortDateNewest =>
      'ਸ਼ਾਮਲ ਕਰਨ ਦੀ ਮਿਤੀ (ਸਭ ਤੋਂ ਨਵੀਂ ਪਹਿਲਾਂ)';

  @override
  String get adminRepoSortNameAsc => 'ਵਰਣਮਾਲਾ ਅਨੁਸਾਰ (A ਤੋਂ Z)';

  @override
  String get adminRepoSortNameDesc => 'ਵਰਣਮਾਲਾ ਅਨੁਸਾਰ (Z ਤੋਂ A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'ਸਰਵਰ ਵਿਸ਼ਲੇਸ਼ਣ ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'ਸਰੋਤ ਨਾਲ ਮੇਲ ਕਰੋ';

  @override
  String get imdbTop250Movies => 'IMDb ਚੋਟੀ ਦੀਆਂ 250 ਫਿਲਮਾਂ';

  @override
  String get imdbTop250TvShows => 'IMDb ਚੋਟੀ ਦੇ 250 ਟੀਵੀ ਸ਼ੋਅ';

  @override
  String get imdbMostPopularMovies => 'IMDb ਸਭ ਤੋਂ ਪ੍ਰਸਿੱਧ ਫਿਲਮਾਂ';

  @override
  String get imdbMostPopularTvShows => 'IMDb ਸਭ ਤੋਂ ਪ੍ਰਸਿੱਧ ਟੀਵੀ ਸ਼ੋਅ';

  @override
  String get imdbLowestRatedMovies => 'IMDb ਸਭ ਤੋਂ ਘੱਟ ਰੇਟਿੰਗ ਵਾਲੀਆਂ ਫਿਲਮਾਂ';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb ਚੋਟੀ ਦੀਆਂ ਰੇਟਿੰਗ ਵਾਲੀਆਂ ਅੰਗਰੇਜ਼ੀ ਫਿਲਮਾਂ';
}
