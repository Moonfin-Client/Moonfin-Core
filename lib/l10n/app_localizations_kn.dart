// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'ಖಾತೆ ಆದ್ಯತೆಗಳು';

  @override
  String get interfaceLanguage => 'ಇಂಟರ್‌ಫೇಸ್ ಭಾಷೆ';

  @override
  String get systemLanguageDefault => 'ಸಿಸ್ಟಂ ಡೀಫಾಲ್ಟ್';

  @override
  String get signIn => 'ಸೈನ್ ಇನ್ ಮಾಡಿ';

  @override
  String get empty => 'ಖಾಲಿ';

  @override
  String connectingToServer(String serverName) {
    return '$serverName ಗೆ ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'ಪಾಸ್ವರ್ಡ್';

  @override
  String get username => 'ಬಳಕೆದಾರ ಹೆಸರು';

  @override
  String get email => 'ಇಮೇಲ್';

  @override
  String get quickConnectInstruction =>
      'ನಿಮ್ಮ ಸರ್ವರ್‌ನ ವೆಬ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ನಲ್ಲಿ ಈ ಕೋಡ್ ಅನ್ನು ನಮೂದಿಸಿ:';

  @override
  String get waitingForAuthorization => 'ದೃಢೀಕರಣಕ್ಕಾಗಿ ನಿರೀಕ್ಷಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get back => 'ಹಿಂದೆ';

  @override
  String get serverUnavailable => 'ಸರ್ವರ್ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get loginFailed => 'ಲಾಗಿನ್ ವಿಫಲವಾಗಿದೆ';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect ಲಭ್ಯವಿಲ್ಲ: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect ಲಭ್ಯವಿಲ್ಲ ($status): $detail';
  }

  @override
  String get whosWatching => 'ಯಾರು ನೋಡುತ್ತಿದ್ದಾರೆ?';

  @override
  String get addUser => 'ಬಳಕೆದಾರರನ್ನು ಸೇರಿಸಿ';

  @override
  String get selectServer => 'ಸರ್ವರ್ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin ಆವೃತ್ತಿ $version';
  }

  @override
  String get savedServers => 'ಉಳಿಸಿದ ಸರ್ವರ್‌ಗಳು';

  @override
  String get discoveredServers => 'ಪತ್ತೆಯಾದ ಸರ್ವರ್‌ಗಳು';

  @override
  String get noneFound => 'ಯಾವುದೂ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get unableToConnectToServer => 'ಸರ್ವರ್‌ಗೆ ಸಂಪರ್ಕಿಸಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ';

  @override
  String get addServer => 'ಸರ್ವರ್ ಸೇರಿಸಿ';

  @override
  String get embyConnect => 'Emby ಸಂಪರ್ಕಿಸಿ';

  @override
  String get removeServer => 'ಸರ್ವರ್ ತೆಗೆದುಹಾಕಿ';

  @override
  String removeServerConfirmation(String serverName) {
    return 'ನಿಮ್ಮ ಸರ್ವರ್‌ಗಳಿಂದ \"$serverName\" ಅನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
  }

  @override
  String get cancel => 'ರದ್ದುಮಾಡು';

  @override
  String get remove => 'ತೆಗೆದುಹಾಕಿ';

  @override
  String get connectToServer => 'ಸರ್ವರ್‌ಗೆ ಸಂಪರ್ಕಪಡಿಸಿ';

  @override
  String get serverAddress => 'ಸರ್ವರ್ ವಿಳಾಸ';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'ಸಂಪರ್ಕಿಸಿ';

  @override
  String get secureStorageUnavailable => 'ಸುರಕ್ಷಿತ ಸಂಗ್ರಹಣೆ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin ನಿಮ್ಮ ಸಿಸ್ಟಂ ಕೀರಿಂಗ್ ಅನ್ನು ಪ್ರವೇಶಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ಲಾಗಿನ್ ಅನ್ನು ಮುಂದುವರಿಸಬಹುದು, ಆದರೆ ಕೀರಿಂಗ್ ಅನ್‌ಲಾಕ್ ಆಗುವವರೆಗೆ ಸುರಕ್ಷಿತ ಟೋಕನ್ ಸಂಗ್ರಹಣೆ ಲಭ್ಯವಿರುವುದಿಲ್ಲ.';

  @override
  String get ok => 'ಸರಿ';

  @override
  String get settingsAppearanceTheme => 'ಅಪ್ಲಿಕೇಶನ್ ಥೀಮ್';

  @override
  String get detailScreenStyle => 'ವಿವರ ಪರದೆಯ ಶೈಲಿ';

  @override
  String get detailScreenStyleSubtitle =>
      'ಕ್ಲಾಸಿಕ್ ಎಂಬುದು ಮೂಲ ಕೇಂದ್ರೀಕೃತ Moonfin ವಿನ್ಯಾಸ. ಮಾಡರ್ನ್ ಎಂಬುದು ಸ್ಪಂದನಶೀಲ ಸಿನಿಮ್ಯಾಟಿಕ್ ವಿನ್ಯಾಸ.';

  @override
  String get detailScreenStyleMoonfin => 'ಕ್ಲಾಸಿಕ್';

  @override
  String get detailScreenStyleModern => 'ಮಾಡರ್ನ್';

  @override
  String get expandedTabs => 'ವಿಸ್ತರಿಸಿದ ಟ್ಯಾಬ್‌ಗಳು';

  @override
  String get expandedTabsSubtitle =>
      'ಟ್ಯಾಬ್‌ಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡುವಾಗ ಟ್ಯಾಬ್ ವಿಷಯವನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ತೋರಿಸಿ. ಪ್ರತಿ ಟ್ಯಾಬ್ ಅನ್ನು ಹಸ್ತಚಾಲಿತವಾಗಿ ತೆರೆಯಲು ಮತ್ತು ಮುಚ್ಚಲು ಆಫ್ ಮಾಡಿ.';

  @override
  String get showTechnicalDetails => 'ತಾಂತ್ರಿಕ ವಿವರಗಳನ್ನು ತೋರಿಸುವುದೇ?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'ಬ್ಯಾನರ್ ಸಾರಾಂಶದಲ್ಲಿ ಕೊಡೆಕ್, ರೆಸಲ್ಯೂಶನ್ ಮತ್ತು ಸ್ಟ್ರೀಮ್ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಿ';

  @override
  String get recommendationSystem => 'ಶಿಫಾರಸು ವ್ಯವಸ್ಥೆ';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin Recommends ಸ್ಥಳೀಯ-ಲೈಬ್ರರಿ ಅಲ್ಗಾರಿದಮ್ ಅಥವಾ ಆನ್‌ಲೈನ್ TMDb ಸಾಮ್ಯತೆ ಮಾಪನಗಳನ್ನು ಬಳಸಿ. ಗಮನಿಸಿ: ಆನ್‌ಲೈನ್ ಶಿಫಾರಸುಗಳಿಗೆ Seerr ಸಂಯೋಜನೆ ಅಗತ್ಯವಿದೆ.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb ಸಾಮ್ಯತೆ';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'ಪೋಷಕರ ರೇಟಿಂಗ್ ಮಿತಿಯನ್ನು ಅನ್ವಯಿಸುವುದೇ?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'ಗುರಿ ಮಾಧ್ಯಮದ ಪೋಷಕರ ರೇಟಿಂಗ್ ಪ್ರಕಾರ Moonfin Recommends ಸಲಹೆಗಳನ್ನು ಮಿತಿಗೊಳಿಸಿ';

  @override
  String get interfaceStyle => 'ಇಂಟರ್‌ಫೇಸ್ ಶೈಲಿ';

  @override
  String get interfaceStyleSubtitle =>
      'ಸ್ವಯಂಚಾಲಿತವು ನಿಮ್ಮ ಸಾಧನಕ್ಕೆ ಹೊಂದಿಕೊಳ್ಳುತ್ತದೆ. ನಿರ್ದಿಷ್ಟ ನೋಟವನ್ನು ಒತ್ತಾಯಿಸಲು Apple ಅಥವಾ Material ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get interfaceStyleAutomatic => 'ಸ್ವಯಂಚಾಲಿತ';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'ಗ್ಲಾಸ್ ಗುಣಮಟ್ಟ';

  @override
  String get glassQualitySubtitle =>
      'ಆಟೋ ಈ ಸಾಧನಕ್ಕೆ ಅತ್ಯುತ್ತಮ ಗ್ಲಾಸ್ ಪರಿಣಾಮವನ್ನು ಆಯ್ಕೆಮಾಡುತ್ತದೆ. ಫುಲ್ ನಿಜವಾದ ಬ್ಲರ್ ಅನ್ನು ಒತ್ತಾಯಿಸುತ್ತದೆ; ರಿಡ್ಯೂಸ್ಡ್ GPU ಶಕ್ತಿಯನ್ನು ಉಳಿಸುವ ಹಗುರವಾದ ಗ್ಲಾಸ್ ಅನ್ನು ಬಳಸುತ್ತದೆ.';

  @override
  String get glassQualityAuto => 'ಆಟೋ';

  @override
  String get glassQualityFull => 'ಫುಲ್';

  @override
  String get glassQualityReduced => 'ರಿಡ್ಯೂಸ್ಡ್';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸದೆಯೇ Moonfin ಮತ್ತು Neon Pulse ನಡುವೆ ಬದಲಿಸಿ';

  @override
  String get customThemeTitle => 'ಕಸ್ಟಮ್ ಥೀಮ್';

  @override
  String get customThemeSubtitle =>
      'ಕಸ್ಟಮ್ ಥೀಮ್‌ಗಳು Moonfin ನಾದ್ಯಂತ ದೃಶ್ಯ ಅಂಶಗಳನ್ನು ಬದಲಾಯಿಸುತ್ತವೆ. ನಿಮ್ಮ ಶೈಲಿಗೆ ಸರಿಹೊಂದುವ ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get keyboardPreferSystemIme => 'ಸಿಸ್ಟಂ ಕೀಬೋರ್ಡ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get keyboardPreferSystemImeDescription =>
      'ಪಠ್ಯ ನಮೂದಿಗೆ ಪೂರ್ವನಿಯೋಜಿತವಾಗಿ ನಿಮ್ಮ ಸಾಧನದ ಇನ್‌ಪುಟ್ ವಿಧಾನವನ್ನು ಬಳಸಿ';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'ಪ್ರಸ್ತುತ Moonfin ನೋಟ ನೀವೆಲ್ಲರೂ ಪ್ರೀತಿಸುವಂತೆ ಮಾಡಿದ್ದೀರಿ';

  @override
  String get themeNeonPulse => 'ನಿಯಾನ್ ಪಲ್ಸ್';

  @override
  String get themeNeonPulseSubtitle =>
      'ಮೆಜೆಂಟಾ ಗ್ಲೋ, ಸಯಾನ್ ಪಠ್ಯ ಮತ್ತು ಬಲವಾದ ಕ್ರೋಮ್ ಕಾಂಟ್ರಾಸ್ಟ್‌ನೊಂದಿಗೆ ಸಿಂಥ್ವೇವ್ ಸ್ಟೈಲಿಂಗ್';

  @override
  String get themeGlass => 'ಗ್ಲಾಸ್';

  @override
  String get themeGlassSubtitle =>
      'ತೇಲುವ ಗ್ರೇಡಿಯಂಟ್ ಹಿನ್ನೆಲೆ, ಮಂಜುಗಟ್ಟಿದ ಮೇಲ್ಮೈಗಳು ಮತ್ತು Apple-ನೀಲಿ ಆಕ್ಸೆಂಟ್‌ನೊಂದಿಗೆ ಲಿಕ್ವಿಡ್-ಗ್ಲಾಸ್ ಶೈಲಿ';

  @override
  String get theme8BitHero => '8-bit ಹೀರೋ';

  @override
  String get theme8BitHeroSubtitle =>
      'ದಪ್ಪ ಬಣ್ಣದ ಪ್ಯಾಲೆಟ್, ಬ್ಲಾಕಿ ಅಂಚುಗಳು, ಗಟ್ಟಿಯಾದ ಡ್ರಾಪ್-ಶ್ಯಾಡೋಗಳು ಮತ್ತು ಪಿಕ್ಸೆಲ್ ಫಾಂಟ್‌ನೊಂದಿಗೆ ರೆಟ್ರೊ ಪಿಕ್ಸೆಲ್-ಆರ್ಟ್ ಶೈಲಿ';

  @override
  String get embyConnectSignInSubtitle =>
      'ನಿಮ್ಮ Emby ಸಂಪರ್ಕ ಖಾತೆಯೊಂದಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ';

  @override
  String get emailOrUsername => 'ಇಮೇಲ್ ಅಥವಾ ಬಳಕೆದಾರಹೆಸರು';

  @override
  String get selectAServer => 'ಸರ್ವರ್ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get tryAgain => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get noLinkedServers =>
      'ಈ Emby ಸಂಪರ್ಕ ಖಾತೆಗೆ ಯಾವುದೇ ಸರ್ವರ್‌ಗಳನ್ನು ಲಿಂಕ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get invalidEmbyConnectCredentials => 'ಅಮಾನ್ಯ Emby ಸಂಪರ್ಕ ರುಜುವಾತುಗಳು';

  @override
  String get invalidEmbyConnectLogin =>
      'ಅಮಾನ್ಯ Emby ಬಳಕೆದಾರಹೆಸರು ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get embyConnectExchangeNotSupported =>
      'ಸರ್ವರ್ Emby ಸಂಪರ್ಕ ವಿನಿಮಯವನ್ನು ಬೆಂಬಲಿಸುವುದಿಲ್ಲ';

  @override
  String get embyConnectNetworkError =>
      'Emby ಸಂಪರ್ಕ ಅಥವಾ ಆಯ್ಕೆಮಾಡಿದ ಸರ್ವರ್ ಅನ್ನು ಸಂಪರ್ಕಿಸುವಾಗ ನೆಟ್‌ವರ್ಕ್ ದೋಷ';

  @override
  String get loadingLinkedServers =>
      'ಲಿಂಕ್ ಮಾಡಲಾದ ಸರ್ವರ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get connectingToServerEllipsis => 'ಸರ್ವರ್‌ಗೆ ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get noReachableAddress => 'ತಲುಪಬಹುದಾದ ವಿಳಾಸವನ್ನು ಒದಗಿಸಲಾಗಿಲ್ಲ';

  @override
  String get invalidServerExchangeResponse =>
      'ಸರ್ವರ್ ಎಕ್ಸ್ಚೇಂಜ್ ಎಂಡ್ ಪಾಯಿಂಟ್ನಿಂದ ಅಮಾನ್ಯ ಪ್ರತಿಕ್ರಿಯೆ';

  @override
  String unableToConnectTo(String target) {
    return '$target ಗೆ ಸಂಪರ್ಕಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';
  }

  @override
  String get exitApp => 'Moonfin ನಿರ್ಗಮಿಸುವುದೇ?';

  @override
  String get exitAppConfirmation => 'ನೀವು ನಿರ್ಗಮಿಸಲು ಖಚಿತವಾಗಿ ಬಯಸುವಿರಾ?';

  @override
  String get exit => 'ನಿರ್ಗಮಿಸಿ';

  @override
  String get gameMenu => 'ಮೆನು';

  @override
  String get gamePaused => 'ವಿರಾಮಗೊಂಡಿದೆ';

  @override
  String get gameSaveState => 'ಸ್ಥಿತಿಯನ್ನು ಉಳಿಸಿ';

  @override
  String get games => 'ಆಟಗಳು';

  @override
  String get gameLoadState => 'ಸ್ಥಿತಿಯನ್ನು ಲೋಡ್ ಮಾಡಿ';

  @override
  String get gameFastForward => 'ಫಾಸ್ಟ್-ಫಾರ್ವರ್ಡ್';

  @override
  String get gameEmulatorSettings => 'ಎಮ್ಯುಲೇಟರ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get gameNoCoreOptions => 'ಈ ಕೋರ್‌ಗೆ ಹೊಂದಿಸಬಹುದಾದ ಆಯ್ಕೆಗಳಿಲ್ಲ.';

  @override
  String get gameHoldToOpenMenu => 'ಮೆನು ತೆರೆಯಲು ಒತ್ತಿ ಹಿಡಿಯಿರಿ';

  @override
  String get gamePlaybackUnsupported =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಆಟ ಆಡುವುದನ್ನು ಇನ್ನೂ ಬೆಂಬಲಿಸಲಾಗಿಲ್ಲ.';

  @override
  String get noHomeRowsLoaded => 'ಯಾವುದೇ ಹೋಮ್ ಸಾಲುಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುವುದಿಲ್ಲ';

  @override
  String get noHomeRowsHint =>
      'ಸಕ್ರಿಯ ಹೋಮ್ ವಿಭಾಗಗಳನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಲು ಅಥವಾ ಕಡಿಮೆ ಮಾಡಲು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get retryHomeRows => 'ಮುಖಪುಟ ಸಾಲುಗಳನ್ನು ಮರುಪ್ರಯತ್ನಿಸಿ';

  @override
  String get guide => 'ಮಾರ್ಗದರ್ಶಿ';

  @override
  String get recordings => 'ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು';

  @override
  String get schedule => 'ವೇಳಾಪಟ್ಟಿ';

  @override
  String get series => 'ಸರಣಿಗಳು';

  @override
  String get noItemsFound => 'ಯಾವುದೇ ಐಟಂಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get home => 'ಮುಖಪುಟ';

  @override
  String get browseAll => 'ಎಲ್ಲವನ್ನೂ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get genres => 'ಪ್ರಕಾರಗಳು';

  @override
  String get collectionPlaceholder => 'ಸಂಗ್ರಹಣೆಯ ಐಟಂಗಳು ಇಲ್ಲಿ ಗೋಚರಿಸುತ್ತವೆ';

  @override
  String get browseByLetter => 'ಅಕ್ಷರದ ಮೂಲಕ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'ವರ್ಣಮಾಲೆಯ ಬ್ರೌಸ್ ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತದೆ';

  @override
  String get suggestions => 'ಸಲಹೆಗಳು';

  @override
  String get suggestionsPlaceholder => 'ಸೂಚಿಸಿದ ಐಟಂಗಳು ಇಲ್ಲಿ ಗೋಚರಿಸುತ್ತವೆ';

  @override
  String get failedToLoadLibraries => 'ಲೈಬ್ರರಿಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get noLibrariesFound => 'ಯಾವುದೇ ಗ್ರಂಥಾಲಯಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get library => 'ಲೈಬ್ರರಿ';

  @override
  String get displaySettings => 'ಪ್ರದರ್ಶನ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get allGenres => 'ಎಲ್ಲಾ ಪ್ರಕಾರಗಳು';

  @override
  String get noGenresFound => 'ಯಾವುದೇ ಪ್ರಕಾರಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String failedToLoadFolderError(String error) {
    return 'ಫೋಲ್ಡರ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get thisFolderIsEmpty => 'ಈ ಫೋಲ್ಡರ್ ಖಾಲಿಯಾಗಿದೆ';

  @override
  String itemCountLabel(int count) {
    return '$count ಐಟಂಗಳು';
  }

  @override
  String get failedToLoadFavorites => 'ಮೆಚ್ಚಿನವುಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get retry => 'ಮರುಪ್ರಯತ್ನಿಸಿ';

  @override
  String get noFavoritesYet => 'ಇನ್ನೂ ಯಾವುದೇ ಮೆಚ್ಚಿನವುಗಳಿಲ್ಲ';

  @override
  String get favorites => 'ಮೆಚ್ಚಿನವುಗಳು';

  @override
  String totalCountItems(int count) {
    return '$count ಐಟಂಗಳು';
  }

  @override
  String get continuing => 'ಮುಂದುವರೆಯುತ್ತಿದೆ';

  @override
  String get ended => 'ಕೊನೆಗೊಂಡಿದೆ';

  @override
  String get sortAndFilter => 'ವಿಂಗಡಿಸಿ ಮತ್ತು ಫಿಲ್ಟರ್ ಮಾಡಿ';

  @override
  String get type => 'ಟೈಪ್ ಮಾಡಿ';

  @override
  String get sortBy => 'ವಿಂಗಡಿಸಿ';

  @override
  String get display => 'ಪ್ರದರ್ಶನ';

  @override
  String get imageType => 'ಚಿತ್ರದ ಪ್ರಕಾರ';

  @override
  String get posterSize => 'ಪೋಸ್ಟರ್ ಗಾತ್ರ';

  @override
  String get small => 'ಚಿಕ್ಕದು';

  @override
  String get medium => 'ಮಧ್ಯಮ';

  @override
  String get large => 'ದೊಡ್ಡದು';

  @override
  String get extraLarge => 'ಹೆಚ್ಚುವರಿ ದೊಡ್ಡದು';

  @override
  String libraryGenresTitle(String name) {
    return '$name — ಪ್ರಕಾರಗಳು';
  }

  @override
  String get views => 'ವೀಕ್ಷಣೆಗಳು';

  @override
  String get albums => 'ಆಲ್ಬಮ್‌ಗಳು';

  @override
  String get albumArtists => 'ಆಲ್ಬಮ್ ಕಲಾವಿದರು';

  @override
  String get artists => 'ಕಲಾವಿದರು';

  @override
  String get bookmarks => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು';

  @override
  String get noSavedBookmarks =>
      'ಈ ಶೀರ್ಷಿಕೆಗಾಗಿ ಇನ್ನೂ ಯಾವುದೇ ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿಲ್ಲ.';

  @override
  String get openBook => 'ಪುಸ್ತಕ ತೆರೆಯಿರಿ';

  @override
  String get chapter => 'ಅಧ್ಯಾಯ';

  @override
  String get page => 'ಪುಟ';

  @override
  String get bookmark => 'ಬುಕ್ಮಾರ್ಕ್';

  @override
  String get justNow => 'ಈಗಷ್ಟೇ';

  @override
  String minutesAgo(int count) {
    return '$countನಿ ಹಿಂದೆ';
  }

  @override
  String hoursAgo(int count) {
    return '$countಗಂ ಹಿಂದೆ';
  }

  @override
  String daysAgo(int count) {
    return '$countದಿ ಹಿಂದೆ';
  }

  @override
  String get discoverySubjects => 'ಡಿಸ್ಕವರಿ ವಿಷಯಗಳು';

  @override
  String get pickDiscoverySubjects =>
      'Discover ನಲ್ಲಿ ತೋರಿಸಲು ಯಾವ ವಿಷಯದ ಫೀಡ್‌ಗಳನ್ನು ಆರಿಸಿ.';

  @override
  String get apply => 'ಅನ್ವಯಿಸಿ';

  @override
  String get openLink => 'ಲಿಂಕ್ ತೆರೆಯಿರಿ';

  @override
  String get scanWithYourPhone => 'ನಿಮ್ಮ ಫೋನ್‌ನೊಂದಿಗೆ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get audiobookGenres => 'ಆಡಿಯೋಬುಕ್ ಪ್ರಕಾರಗಳು';

  @override
  String get pickAudiobookGenres =>
      'ಆಡಿಯೋಬುಕ್ ಡಿಸ್ಕವರ್‌ನಲ್ಲಿ ಯಾವ ಪ್ರಕಾರಗಳನ್ನು ತೋರಿಸಬೇಕೆಂದು ಆರಿಸಿ.';

  @override
  String get discoverAudiobooks => 'ಆಡಿಯೋಬುಕ್‌ಗಳನ್ನು ಅನ್ವೇಷಿಸಿ';

  @override
  String get librivoxDescription =>
      'LibriVox ನಿಂದ ಜನಪ್ರಿಯ ಸಾರ್ವಜನಿಕ ಡೊಮೇನ್ ಶೀರ್ಷಿಕೆಗಳು.';

  @override
  String titlesCount(int count) {
    return '$count ಶೀರ್ಷಿಕೆಗಳು';
  }

  @override
  String get scrollLeft => 'ಎಡಕ್ಕೆ ಸ್ಕ್ರಾಲ್ ಮಾಡಿ';

  @override
  String get scrollRight => 'ಬಲಕ್ಕೆ ಸ್ಕ್ರಾಲ್ ಮಾಡಿ';

  @override
  String get couldNotLoadGenre =>
      'ಇದೀಗ ಈ ಪ್ರಕಾರವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get continueReading => 'ಓದುವುದನ್ನು ಮುಂದುವರಿಸಿ';

  @override
  String get savedHighlights => 'ಉಳಿಸಿದ ಮುಖ್ಯಾಂಶಗಳು';

  @override
  String get continueListening => 'ಕೇಳುವುದನ್ನು ಮುಂದುವರಿಸಿ';

  @override
  String get listen => 'ಕೇಳು';

  @override
  String get resume => 'ಮುಂದುವರಿಸಿ';

  @override
  String get failedToLoadLibrary => 'ಲೈಬ್ರರಿಯನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get popularNow => 'ಈಗ ಜನಪ್ರಿಯವಾಗಿದೆ';

  @override
  String get savedForLater => 'ನಂತರ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get topListens => 'ಟಾಪ್ ಕೇಳುಗರು';

  @override
  String get unreadDiscoveries => 'ಓದದ ಅನ್ವೇಷಣೆಗಳು';

  @override
  String get pickUpAgain => 'ಮತ್ತೆ ಎತ್ತಿಕೊಳ್ಳಿ';

  @override
  String get bookHighlightsDescription =>
      'ಮುಖ್ಯಾಂಶಗಳು, ಮೆಚ್ಚಿನವುಗಳು ಅಥವಾ ಓದುವ ಪ್ರಗತಿಯೊಂದಿಗೆ ನಿಮ್ಮ ಪುಸ್ತಕಗಳು.';

  @override
  String get handPickedFromLibrary => 'ನಿಮ್ಮ ಲೈಬ್ರರಿಯಿಂದ ಕೈಯಿಂದ ಆರಿಸಲಾಗಿದೆ.';

  @override
  String get handPickedFromListeningQueue =>
      'ನಿಮ್ಮ ಆಲಿಸುವ ಸರದಿಯಿಂದ ಕೈಯಿಂದ ಆರಿಸಲಾಗಿದೆ.';

  @override
  String get booksWithHighlights =>
      'ಮುಖ್ಯಾಂಶಗಳು, ಮೆಚ್ಚಿನವುಗಳು ಅಥವಾ ಓದುವ ಪ್ರಗತಿಯೊಂದಿಗೆ ಪುಸ್ತಕಗಳು.';

  @override
  String get jumpBackNarration =>
      'ನಿಮ್ಮ ಸ್ಥಳವನ್ನು ಬೇಟೆಯಾಡದೆ ನಿರೂಪಣೆಗೆ ಹಿಂತಿರುಗಿ.';

  @override
  String get unreadBooksReady =>
      'ಮುಂದಿನ ಸ್ತಬ್ಧ ಗಂಟೆಗೆ ಓದದ ಪುಸ್ತಕಗಳು ಸಿದ್ಧವಾಗಿವೆ.';

  @override
  String get quickAccessFavorites =>
      'ನೀವು ಮರಳಿ ಬರುತ್ತಿರುವ ಪುಸ್ತಕಗಳಿಗೆ ತ್ವರಿತ ಪ್ರವೇಶ.';

  @override
  String get searchAudiobooks => 'ಆಡಿಯೋಬುಕ್‌ಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get searchYourLibrary => 'ನಿಮ್ಮ ಲೈಬ್ರರಿಯನ್ನು ಹುಡುಕಿ';

  @override
  String get pickUpStory => 'ನೀವು ನಿಲ್ಲಿಸಿದ ಕಥೆಯನ್ನು ಎತ್ತಿಕೊಳ್ಳಿ';

  @override
  String get savedPlacesChapters =>
      'ನಿಮ್ಮ ಉಳಿಸಿದ ಸ್ಥಳಗಳು ಮತ್ತು ಅಪೂರ್ಣ ಅಧ್ಯಾಯಗಳು';

  @override
  String authorsCount(int count) {
    return '$count ಲೇಖಕರು';
  }

  @override
  String genresCount(int count) {
    return '$count ಪ್ರಕಾರಗಳು';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% ಪೂರ್ಣಗೊಂಡಿದೆ';
  }

  @override
  String get readyWhenYouAre => 'ನೀವು ಇರುವಾಗ ಸಿದ್ಧ';

  @override
  String get details => 'ವಿವರಗಳು';

  @override
  String get listeningRoom => 'ಆಲಿಸುವ ಕೊಠಡಿ';

  @override
  String get bookmarksAndProgress => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು ಮತ್ತು ಪ್ರಗತಿ';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'ಓದುವಿಕೆಗೆ ಆದ್ಯತೆ ನೀಡುವ ಬ್ರೌಸಿಂಗ್‌ಗಾಗಿ ಜೋಡಿಸಲಾದ $count ಶೀರ್ಷಿಕೆಗಳು.';
  }

  @override
  String get titles => 'ಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get allTitles => 'ಎಲ್ಲಾ ಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get authors => 'ಲೇಖಕರು';

  @override
  String get browseByAuthor => 'ಲೇಖಕರಿಂದ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get browseByGenre => 'ಪ್ರಕಾರದ ಪ್ರಕಾರ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get discover => 'ಅನ್ವೇಷಿಸಿ';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library ರಿಂದ ವಿಷಯದ ಮೂಲಕ ಟ್ರೆಂಡಿಂಗ್ ಶೀರ್ಷಿಕೆಗಳು.';

  @override
  String get noBookmarkedItems => 'ಯಾವುದೇ ಬುಕ್‌ಮಾರ್ಕ್ ಮಾಡಲಾದ ಐಟಂಗಳು ಇನ್ನೂ ಇಲ್ಲ';

  @override
  String get nothingMatchesSection =>
      'ಈ ವಿಭಾಗಕ್ಕೆ ಇನ್ನೂ ಯಾವುದೂ ಹೊಂದಾಣಿಕೆಯಾಗುತ್ತಿಲ್ಲ. ಇನ್ನೊಂದು ಟ್ಯಾಬ್ ಪ್ರಯತ್ನಿಸಿ ಅಥವಾ ಲೈಬ್ರರಿ ಸಿಂಕ್ ಮುಗಿದ ನಂತರ ಹಿಂತಿರುಗಿ.';

  @override
  String get audiobooks => 'ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String noLabelFound(String label) {
    return 'ಯಾವುದೇ $label ಕಂಡುಬಂದಿಲ್ಲ';
  }

  @override
  String get folder => 'ಫೋಲ್ಡರ್';

  @override
  String get filters => 'ಶೋಧಕಗಳು';

  @override
  String get readingStatus => 'ಓದುವ ಸ್ಥಿತಿ';

  @override
  String get playedStatus => 'ಆಡಿದ ಸ್ಥಿತಿ';

  @override
  String get readStatus => 'ಓದು';

  @override
  String get watched => 'ವೀಕ್ಷಿಸಲಾಗಿದೆ';

  @override
  String get unread => 'ಓದಿಲ್ಲ';

  @override
  String get unwatched => 'ವೀಕ್ಷಿಸಲಾಗಿಲ್ಲ';

  @override
  String get seriesStatus => 'ಸರಣಿ ಸ್ಥಿತಿ';

  @override
  String get allLibraries => 'ಎಲ್ಲಾ ಗ್ರಂಥಾಲಯಗಳು';

  @override
  String get books => 'ಪುಸ್ತಕಗಳು';

  @override
  String get latestBooks => 'ಇತ್ತೀಚಿನ ಪುಸ್ತಕಗಳು';

  @override
  String get latestAudiobooks => 'ಇತ್ತೀಚಿನ ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಪುಸ್ತಕಗಳು',
      one: '1 ಪುಸ್ತಕ',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'ಪುಸ್ತಕ';

  @override
  String get bookFormatAudiobook => 'ಆಡಿಯೋಬುಕ್';

  @override
  String bookPercentRead(int percent) {
    return '$percent% ಓದಲಾಗಿದೆ';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time ಬಾಕಿ';
  }

  @override
  String get bookHeroRead => 'ಓದಿ';

  @override
  String get bookHeroListen => 'ಕೇಳಿ';

  @override
  String get author => 'ಲೇಖಕ';

  @override
  String get unknownAuthor => 'ಅಜ್ಞಾತ ಲೇಖಕ';

  @override
  String get uncategorized => 'ವರ್ಗೀಕರಿಸಲಾಗಿಲ್ಲ';

  @override
  String get overview => 'ಅವಲೋಕನ';

  @override
  String get noLibrivoxDescription =>
      'ಈ ಶೀರ್ಷಿಕೆಗೆ LibriVox ಯಾವುದೇ ವಿವರಣೆಯನ್ನು ಇನ್ನೂ ಒದಗಿಸಿಲ್ಲ.';

  @override
  String get readers => 'ಓದುಗರು';

  @override
  String get openLinks => 'ಲಿಂಕ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get librivoxPage => 'LibriVox ಪುಟ';

  @override
  String get internetArchive => 'ಇಂಟರ್ನೆಟ್ ಆರ್ಕೈವ್';

  @override
  String get rssFeed => 'RSS ಫೀಡ್';

  @override
  String get downloadZip => 'ಜಿಪ್ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String sectionCountLabel(int count) {
    return '$count ವಿಭಾಗಗಳು';
  }

  @override
  String firstPublished(int year) {
    return 'ಮೊದಲ ಪ್ರಕಟಣೆ $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'ಈ ಶೀರ್ಷಿಕೆಗಾಗಿ ಇನ್ನೂ Open Library ನಿಂದ ಯಾವುದೇ ಅವಲೋಕನ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get subjects => 'ವಿಷಯಗಳು';

  @override
  String get all => 'ಎಲ್ಲಾ';

  @override
  String booksCount(int count) {
    return '$count ಪುಸ್ತಕಗಳು';
  }

  @override
  String get couldNotLoadSubject =>
      'ಇದೀಗ ಈ ವಿಷಯವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get audiobookDetails => 'ಆಡಿಯೋಬುಕ್ ವಿವರಗಳು';

  @override
  String authorsCountTitle(int count) {
    return '$count ಲೇಖಕರು';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಆಡಿಯೋಬುಕ್‌ಗಳು',
      one: '1 ಆಡಿಯೋಬುಕ್',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'ಟ್ರ್ಯಾಕ್ ಪಟ್ಟಿ';

  @override
  String get itemListPlaceholder => 'ಐಟಂ ಪಟ್ಟಿ ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತದೆ';

  @override
  String get failedToLoad => 'ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get delete => 'ಅಳಿಸಿ';

  @override
  String get save => 'ಉಳಿಸಿ';

  @override
  String get moreLikeThis => 'ಈ ರೀತಿ ಇನ್ನಷ್ಟು';

  @override
  String get castAndCrew => 'ಪಾತ್ರವರ್ಗ ಮತ್ತು ಸಿಬ್ಬಂದಿ';

  @override
  String get collection => 'ಸಂಗ್ರಹ';

  @override
  String get episodes => 'ಸಂಚಿಕೆಗಳು';

  @override
  String get nextUp => 'ಮುಂದೆ';

  @override
  String get seasons => 'ಸೀಸನ್‌ಗಳು';

  @override
  String get chapters => 'ಅಧ್ಯಾಯಗಳು';

  @override
  String get features => 'ವೈಶಿಷ್ಟ್ಯಗಳು';

  @override
  String get movies => 'ಚಲನಚಿತ್ರಗಳು';

  @override
  String get musicVideos => 'ಸಂಗೀತ ವಿಡಿಯೋಗಳು';

  @override
  String get other => 'ಇತರೆ';

  @override
  String get discography => 'ಧ್ವನಿಮುದ್ರಿಕೆ';

  @override
  String get similarArtists => 'ಇದೇ ಕಲಾವಿದರು';

  @override
  String get tableOfContents => 'ಪರಿವಿಡಿ';

  @override
  String get tracklist => 'ಟ್ರ್ಯಾಕ್‌ಲಿಸ್ಟ್';

  @override
  String discNumber(int number) {
    return 'ಡಿಸ್ಕ್ $number';
  }

  @override
  String get biography => 'ಜೀವನಚರಿತ್ರೆ';

  @override
  String get authorDetails => 'ಲೇಖಕರ ವಿವರಗಳು';

  @override
  String get noOverviewAvailable =>
      'ಈ ಶೀರ್ಷಿಕೆಗೆ ಇನ್ನೂ ಯಾವುದೇ ಅವಲೋಕನ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get noBiographyAvailable => 'ಈ ಲೇಖಕರಿಗೆ ಯಾವುದೇ ಜೀವನಚರಿತ್ರೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get noBooksFound => 'ಈ ಲೇಖಕರಿಗೆ ಯಾವುದೇ ಪುಸ್ತಕಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get unableToLoadAuthorDetails =>
      'ಇದೀಗ ಲೇಖಕರ ವಿವರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ.';

  @override
  String published(int year) {
    return 'ಪ್ರಕಟಣೆ $year';
  }

  @override
  String get publicationDateUnknown => 'ಪ್ರಕಟಣೆಯ ದಿನಾಂಕ ತಿಳಿದಿಲ್ಲ';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಸೀಸನ್‌ಗಳು',
      one: '1 ಸೀಸನ್',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time ಕ್ಕೆ ಮುಗಿಯುತ್ತದೆ';
  }

  @override
  String get items => 'ಐಟಂಗಳು';

  @override
  String get extras => 'ಹೆಚ್ಚುವರಿಗಳು';

  @override
  String get behindTheScenes => 'ತೆರೆಯ ಹಿಂದೆ';

  @override
  String get deletedScenes => 'ಅಳಿಸಿದ ದೃಶ್ಯಗಳು';

  @override
  String get featurettes => 'ಫೀಚರೆಟ್‌ಗಳು';

  @override
  String get interviews => 'ಸಂದರ್ಶನಗಳು';

  @override
  String get scenes => 'ದೃಶ್ಯಗಳು';

  @override
  String get shorts => 'ಕಿರುಚಿತ್ರಗಳು';

  @override
  String get trailers => 'ಟ್ರೇಲರ್‌ಗಳು';

  @override
  String timeRemaining(String time) {
    return '$time ಉಳಿದಿದೆ';
  }

  @override
  String endsIn(String time) {
    return '$time ನಲ್ಲಿ ಮುಗಿಯುತ್ತದೆ';
  }

  @override
  String get view => 'ವೀಕ್ಷಿಸಿ';

  @override
  String get resumeReading => 'ಓದುವಿಕೆಯನ್ನು ಪುನರಾರಂಭಿಸಿ';

  @override
  String get read => 'ಓದು';

  @override
  String resumeFrom(String position) {
    return '$position ರಿಂದ ಪುನರಾರಂಭಿಸಿ';
  }

  @override
  String get play => 'ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get startOver => 'ಮತ್ತೆ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get restart => 'ಮರುಪ್ರಾರಂಭಿಸಿ';

  @override
  String get readOffline => 'ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ಓದಿ';

  @override
  String get playOffline => 'ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get audio => 'ಆಡಿಯೋ';

  @override
  String get subtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get version => 'ಆವೃತ್ತಿ';

  @override
  String get cast => 'ಬಿತ್ತರಿಸಿ';

  @override
  String get trailer => 'ಟ್ರೇಲರ್';

  @override
  String get finished => 'ಮುಗಿದಿದೆ';

  @override
  String get favorited => 'ಮೆಚ್ಚಿನವು';

  @override
  String get favorite => 'ಮೆಚ್ಚಿನ';

  @override
  String get playlist => 'ಪ್ಲೇಪಟ್ಟಿ';

  @override
  String get downloaded => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get downloadAll => 'ಎಲ್ಲವನ್ನೂ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get download => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get deleteDownloaded => 'ಅಳಿಸಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get goToSeries => 'ಸರಣಿಗೆ ಹೋಗಿ';

  @override
  String get editMetadata => 'ಮೆಟಾಡೇಟಾ ಸಂಪಾದಿಸಿ';

  @override
  String get less => 'ಕಡಿಮೆ';

  @override
  String get more => 'ಇನ್ನಷ್ಟು';

  @override
  String get deleteItem => 'ಐಟಂ ಅಳಿಸಿ';

  @override
  String get deletePlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ಅಳಿಸಿ';

  @override
  String get deletePlaylistMessage => 'ಸರ್ವರ್‌ನಿಂದ ಈ ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String get deleteItemMessage => 'ಸರ್ವರ್‌ನಿಂದ ಈ ಐಟಂ ಅನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String get failedToDeletePlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get failedToDeleteItem => 'ಐಟಂ ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get renamePlaylist => 'ಪ್ಲೇಪಟ್ಟಿಗೆ ಮರುಹೆಸರಿಸಿ';

  @override
  String get playlistName => 'ಪ್ಲೇಪಟ್ಟಿ ಹೆಸರು';

  @override
  String get deleteDownloadedAlbum => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಆಲ್ಬಮ್ ಅನ್ನು ಅಳಿಸಿ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\" ಗಾಗಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಅಳಿಸುವುದೇ?';
  }

  @override
  String get downloadedTracksDeleted =>
      'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get downloadedTracksDeleteFailed =>
      'ಕೆಲವು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಅಳಿಸಲಾಗಲಿಲ್ಲ';

  @override
  String get noTracksLoaded => 'ಯಾವುದೇ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'ಯಾವುದೇ $itemLabel ಲೋಡ್ ಆಗಿಲ್ಲ';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ ($count ಐಟಂಗಳು)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'ಸರ್ವರ್‌ನಿಂದ \"$name\" ಅನ್ನು ಅಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ? ಈ ಕ್ರಿಯೆಯನ್ನು ರದ್ದುಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.';
  }

  @override
  String get itemDeleted => 'ಐಟಂ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get noPlayableTrailerFound => 'ಪ್ಲೇ ಮಾಡಬಹುದಾದ ಟ್ರೇಲರ್ ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'ಬೆಂಬಲಿಸದ ಪುಸ್ತಕ ಸ್ವರೂಪ: .$extension';
  }

  @override
  String get audioTrack => 'ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್';

  @override
  String get subtitleTrack => 'ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್';

  @override
  String get none => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get downloadSubtitlesLabel => 'ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ...';

  @override
  String get searchOpenSubtitlesPlugin => 'OpenSubtitles ಪ್ಲಗಿನ್ ಬಳಸಿ ಹುಡುಕಿ';

  @override
  String get downloadSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get selectedSubtitleInvalid => 'ಆಯ್ಕೆಮಾಡಿದ ಉಪಶೀರ್ಷಿಕೆ ಅಮಾನ್ಯವಾಗಿದೆ.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'ಉಪಶೀರ್ಷಿಕೆ ಡೌನ್‌ಲೋಡ್ ಆಗಿ ಆಯ್ಕೆಯಾಗಿದೆ: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'ಉಪಶೀರ್ಷಿಕೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ. Jellyfin ಐಟಂ ಅನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡುವಾಗ ಅದು ಕಾಣಿಸಿಕೊಳ್ಳಲು ಸ್ವಲ್ಪ ಸಮಯ ತೆಗೆದುಕೊಳ್ಳಬಹುದು.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language ಗಾಗಿ ಯಾವುದೇ ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';
  }

  @override
  String get selectVersion => 'ಆವೃತ್ತಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String versionNumber(int number) {
    return 'ಆವೃತ್ತಿ $number';
  }

  @override
  String get downloadAllQuality => 'ಎಲ್ಲವನ್ನೂ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ - ಗುಣಮಟ್ಟ';

  @override
  String get downloadQuality => 'ಡೌನ್‌ಲೋಡ್ ಗುಣಮಟ್ಟ';

  @override
  String get originalFileNoReencoding => 'ಮೂಲ ಫೈಲ್, ಮರು-ಎನ್ಕೋಡಿಂಗ್ ಇಲ್ಲ';

  @override
  String get originalFilesNoReencoding => 'ಮೂಲ ಫೈಲ್‌ಗಳು, ಮರು-ಎನ್‌ಕೋಡಿಂಗ್ ಇಲ್ಲ';

  @override
  String get noEpisodesLoaded => 'ಯಾವುದೇ ಸಂಚಿಕೆಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String downloadingItem(String name, String quality) {
    return '$name ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel ಗಾಗಿ ಸ್ಥಳೀಯ ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸುವುದೇ?\n\nಇದು ಸಂಗ್ರಹಣಾ ಸ್ಥಳವನ್ನು ಮುಕ್ತಗೊಳಿಸುತ್ತದೆ. ನೀವು ನಂತರ ಮತ್ತೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡಬಹುದು.';
  }

  @override
  String get downloadedFilesDeleted => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get failedToDeleteFiles => 'ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get deleteFiles => 'ಫೈಲ್‌ಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String get director => 'ನಿರ್ದೇಶಕ';

  @override
  String get directors => 'ನಿರ್ದೇಶಕರು';

  @override
  String get writer => 'ಬರಹಗಾರ';

  @override
  String get writers => 'ಬರಹಗಾರರು';

  @override
  String get studio => 'ಸ್ಟುಡಿಯೋ';

  @override
  String studioMoreCount(int count) {
    return '+$count ಇನ್ನಷ್ಟು';
  }

  @override
  String totalEpisodes(int count) {
    return '$count ಸಂಚಿಕೆಗಳು';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'ಸಂಚಿಕೆ $number';
  }

  @override
  String chapterNumber(int number) {
    return 'ಅಧ್ಯಾಯ $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಟ್ರ್ಯಾಕ್‌ಗಳು',
      one: '1 ಟ್ರ್ಯಾಕ್',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಅಧ್ಯಾಯಗಳು',
      one: '1 ಅಧ್ಯಾಯ',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'ಜನನ $date';
  }

  @override
  String died(String date) {
    return 'ಮರಣ $date';
  }

  @override
  String age(int age) {
    return 'ವಯಸ್ಸು $age';
  }

  @override
  String get showLess => 'ಕಡಿಮೆ ತೋರಿಸು';

  @override
  String get readMore => 'ಮುಂದೆ ಓದಿ';

  @override
  String get shuffle => 'ಷಫಲ್';

  @override
  String get shuffleAllMusic => 'ಎಲ್ಲಾ ಸಂಗೀತವನ್ನು ಷಫಲ್ ಮಾಡಿ';

  @override
  String get carSignInPrompt => 'ನಿಮ್ಮ ಫೋನ್‌ನಲ್ಲಿ Moonfin ಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ';

  @override
  String get carServerUnreachable =>
      'ನಿಮ್ಮ ಸರ್ವರ್ ಅನ್ನು ತಲುಪಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ';

  @override
  String downloadsCount(int count) {
    return '$count ಡೌನ್‌ಲೋಡ್‌ಗಳು';
  }

  @override
  String get perfectMatch => 'ಪರಿಪೂರ್ಣ ಹೊಂದಾಣಿಕೆ';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'ಮೊನೊ';

  @override
  String get stereo => 'ಸ್ಟೀರಿಯೋ';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆ $action ಗೆ ಈ ಬಳಕೆದಾರರಿಗೆ Jellyfin ಉಪಶೀರ್ಷಿಕೆ ನಿರ್ವಹಣೆ ಅನುಮತಿ ಅಗತ್ಯವಿದೆ.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆ $action ಗಾಗಿ ಈ ಐಟಂ ಸರ್ವರ್‌ನಲ್ಲಿ ಕಂಡುಬಂದಿಲ್ಲ.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆ $action ವಿಫಲವಾಗಿದೆ: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆ $action ವಿಫಲವಾಗಿದೆ (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'ರಿಮೋಟ್ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು $action ಮಾಡಲು ವಿಫಲವಾಗಿದೆ.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\" ಗಾಗಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಎಲ್ಲಾ ಸಂಚಿಕೆಗಳು';
  }

  @override
  String get deleteSeasonFiles =>
      'ಈ ಋತುವಿನಲ್ಲಿ ಎಲ್ಲಾ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಸಂಚಿಕೆಗಳು';

  @override
  String get stillWatching => 'ಇನ್ನೂ ನೋಡುತ್ತಿರುವಿರಾ?';

  @override
  String get unableToLoadTrailerStream =>
      'ಟ್ರೇಲರ್ ಸ್ಟ್ರೀಮ್ ಅನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ.';

  @override
  String get trailerTimedOut => 'ಲೋಡ್ ಮಾಡುವಾಗ ಟ್ರೈಲರ್ ಸಮಯ ಮೀರಿದೆ.';

  @override
  String get playbackFailedForTrailer =>
      'ಈ ಟ್ರೈಲರ್‌ಗಾಗಿ ಪ್ಲೇಬ್ಯಾಕ್ ವಿಫಲವಾಗಿದೆ.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'ಆಫ್‌ಲೈನ್ ಪ್ಲೇಬ್ಯಾಕ್ ಸಮಯದಲ್ಲಿ ಬಿತ್ತರಿಸುವಿಕೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String castActionFailed(String label, String error) {
    return '$label ಕ್ರಿಯೆ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'ಕಾಸ್ಟ್ ವಾಲ್ಯೂಮ್ ಹೊಂದಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label ನಿಯಂತ್ರಣಗಳು';
  }

  @override
  String get deviceVolume => 'ಸಾಧನದ ಪರಿಮಾಣ';

  @override
  String get unavailable => 'ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get pause => 'ವಿರಾಮ';

  @override
  String get syncPosition => 'ಸಿಂಕ್ ಸ್ಥಾನ';

  @override
  String stopCast(String label) {
    return '$label ನಿಲ್ಲಿಸಿ';
  }

  @override
  String get queueIsEmpty => 'ಸರತಿ ಸಾಲು ಖಾಲಿಯಾಗಿದೆ';

  @override
  String trackNumber(int number) {
    return 'ಟ್ರ್ಯಾಕ್ $number';
  }

  @override
  String get remotePlayback => 'ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್';

  @override
  String get castingToGoogleCast => 'Google Cast ಗೆ ಬಿತ್ತರಿಸಲಾಗುತ್ತಿದೆ';

  @override
  String get castingViaAirPlay => 'AirPlay ಮೂಲಕ ಬಿತ್ತರಿಸುವುದು';

  @override
  String get castingViaDlna => 'DLNA ಮೂಲಕ ಬಿತ್ತರಿಸುವುದು';

  @override
  String secondsCount(int seconds) {
    return '$seconds ಸೆಕೆಂಡುಗಳು';
  }

  @override
  String get longPressToUnlock => 'ಅನ್‌ಲಾಕ್ ಮಾಡಲು ದೀರ್ಘವಾಗಿ ಒತ್ತಿರಿ';

  @override
  String get off => 'ಆಫ್';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'ಆಟೋ';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'ಬಿಟ್ರೇಟ್ ಅತಿಕ್ರಮಣ';

  @override
  String get audioDelay => 'ಆಡಿಯೋ ವಿಳಂಬ';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'ಉಪಶೀರ್ಷಿಕೆ ವಿಳಂಬ';

  @override
  String get reset => 'ಮರುಹೊಂದಿಸಿ';

  @override
  String get unknown => 'ಅಜ್ಞಾತ';

  @override
  String get playbackInformation => 'ಪ್ಲೇಬ್ಯಾಕ್ ಮಾಹಿತಿ';

  @override
  String get playback => 'ಪ್ಲೇಬ್ಯಾಕ್';

  @override
  String get playMethod => 'ಆಟದ ವಿಧಾನ';

  @override
  String get directPlay => 'ನೇರ ಆಟ';

  @override
  String get directStream => 'ನೇರ ಸ್ಟ್ರೀಮ್';

  @override
  String get transcoding => 'ಟ್ರಾನ್ಸ್ಕೋಡಿಂಗ್';

  @override
  String get transcodeReasons => 'ಟ್ರಾನ್ಸ್ಕೋಡ್ ಕಾರಣಗಳು';

  @override
  String get player => 'ಪ್ಲೇಯರ್';

  @override
  String get container => 'ಕಂಟೈನರ್';

  @override
  String get bitrate => 'ಬಿಟ್ರೇಟ್';

  @override
  String get video => 'ವೀಡಿಯೊ';

  @override
  String get resolution => 'ರೆಸಲ್ಯೂಶನ್';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'ಕೊಡೆಕ್';

  @override
  String get videoBitrate => 'ವೀಡಿಯೊ ಬಿಟ್ರೇಟ್';

  @override
  String get track => 'ಟ್ರ್ಯಾಕ್';

  @override
  String get channels => 'ಚಾನೆಲ್‌ಗಳು';

  @override
  String get audioBitrate => 'ಆಡಿಯೋ ಬಿಟ್ರೇಟ್';

  @override
  String get sampleRate => 'ಮಾದರಿ ದರ';

  @override
  String get format => 'ಫಾರ್ಮ್ಯಾಟ್';

  @override
  String get external => 'ಬಾಹ್ಯ';

  @override
  String get embedded => 'ಎಂಬೆಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String castSessionError(String protocol) {
    return '$protocol ಸೆಷನ್ ದೋಷ';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'ಪುಸ್ತಕದ ವಿವರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ EPUB ರೆಂಡರಿಂಗ್ ಇನ್ನೂ ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'ಈ ಸ್ವರೂಪವನ್ನು (.$extension) ಇನ್ನೂ ಆ್ಯಪ್‌ನಲ್ಲಿ ತೋರಿಸಲಾಗುವುದಿಲ್ಲ.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'ಎಂಬೆಡೆಡ್ ಡಾಕ್ಯುಮೆಂಟ್ ರೆಂಡರಿಂಗ್ ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get couldNotOpenExternalViewer =>
      'ಬಾಹ್ಯ ವೀಕ್ಷಕವನ್ನು ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'ಆ್ಯಪ್‌ನಲ್ಲಿನ ರೀಡರ್ ತೆರೆಯಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label ನಲ್ಲಿ ಬುಕ್‌ಮಾರ್ಕ್ ಈಗಾಗಲೇ ಉಳಿಸಲಾಗಿದೆ.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'ಬುಕ್‌ಮಾರ್ಕ್ ಸೇರಿಸಲಾಗಿದೆ: $label';
  }

  @override
  String get noBookmarksYet =>
      'ಇನ್ನೂ ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳಿಲ್ಲ.\nನಿಮ್ಮ ಸ್ಥಾನವನ್ನು ಉಳಿಸಲು ಓದುವಾಗ ಬುಕ್‌ಮಾರ್ಕ್ ಐಕಾನ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get noTableOfContentsAvailable => 'ಯಾವುದೇ ಪರಿವಿಡಿ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String pageLabel(int number) {
    return 'ಪುಟ $number';
  }

  @override
  String get position => 'ಸ್ಥಾನ';

  @override
  String get bookReader => 'ಪುಸ್ತಕ ಓದುಗ';

  @override
  String formatExtension(String extension) {
    return 'ಸ್ವರೂಪ: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% ಓದಲಾಗಿದೆ';
  }

  @override
  String get updating => 'ನವೀಕರಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get markUnread => 'ಓದದಿರುವುದನ್ನು ಗುರುತಿಸಿ';

  @override
  String get markAsRead => 'ಓದಿದಂತೆ ಗುರುತಿಸಿ';

  @override
  String get reloadReader => 'ರೀಡರ್ ಅನ್ನು ಮರುಲೋಡ್ ಮಾಡಿ';

  @override
  String get noPagesFound => 'ಯಾವುದೇ ಪುಟಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get failedToDecodePageImage =>
      'ಪುಟದ ಚಿತ್ರವನ್ನು ಡಿಕೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String resetZoom(String zoom) {
    return 'ಝೂಮ್ ಮರುಹೊಂದಿಸಿ (${zoom}x)';
  }

  @override
  String get singlePage => 'ಏಕ ಪುಟ';

  @override
  String get twoPageSpread => 'ಎರಡು ಪುಟಗಳ ಹರಡುವಿಕೆ';

  @override
  String get addBookmark => 'ಬುಕ್ಮಾರ್ಕ್ ಸೇರಿಸಿ';

  @override
  String get bookmarksEllipsis => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು...';

  @override
  String get markedAsRead => 'ಓದಿದೆ ಎಂದು ಗುರುತಿಸಲಾಗಿದೆ';

  @override
  String get markedAsUnread => 'ಓದಿಲ್ಲ ಎಂದು ಗುರುತಿಸಲಾಗಿದೆ';

  @override
  String failedToUpdateReadState(String error) {
    return 'ಓದಿದ ಸ್ಥಿತಿಯನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get themeSystem => 'ಥೀಮ್: ವ್ಯವಸ್ಥೆ';

  @override
  String get themeLight => 'ಥೀಮ್: ಬೆಳಕು';

  @override
  String get themeDark => 'ಥೀಮ್: ಡಾರ್ಕ್';

  @override
  String get themeSepia => 'ಥೀಮ್: ಸೆಪಿಯಾ';

  @override
  String get invertColorsFixedLayout => 'ವಿಲೋಮ ಬಣ್ಣಗಳು (ಸ್ಥಿರ ವಿನ್ಯಾಸ)';

  @override
  String get invertColorsPdf => 'ವಿಲೋಮ ಬಣ್ಣಗಳು (PDF)';

  @override
  String get preparingInAppReader =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ರೀಡರ್ ಅನ್ನು ಸಿದ್ಧಪಡಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get pdfDataNotAvailable => 'PDF ಡೇಟಾ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get readerFallbackModeActive => 'ರೀಡರ್ ಫಾಲ್‌ಬ್ಯಾಕ್ ಮೋಡ್ ಸಕ್ರಿಯವಾಗಿದೆ';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ $extension ಫೈಲ್‌ಗಳಿಗಾಗಿ ಎಂಬೆಡೆಡ್ ಡಾಕ್ಯುಮೆಂಟ್ ಎಂಜಿನ್ ಅನ್ನು ಹೋಸ್ಟ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'ಬೆಂಬಲಿತ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ಗುರಿಗೆ ಬದಲಾಯಿಸಿದ ನಂತರ ರೀಲೋಡ್ ರೀಡರ್ ಅನ್ನು ಬಳಸಿ (Android, iOS, macOS).';

  @override
  String get openExternally => 'ಬಾಹ್ಯವಾಗಿ ತೆರೆಯಿರಿ';

  @override
  String get noEpubChaptersFound => 'ಯಾವುದೇ EPUB ಅಧ್ಯಾಯಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get readerNotReady => 'ಓದುಗ ಸಿದ್ಧವಾಗಿಲ್ಲ.';

  @override
  String get seriesRecordings => 'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು';

  @override
  String get now => 'ಈಗ';

  @override
  String get sports => 'ಕ್ರೀಡೆಗಳು';

  @override
  String get news => 'ಸುದ್ದಿ';

  @override
  String get kids => 'ಮಕ್ಕಳು';

  @override
  String get premiere => 'ಪ್ರಥಮ ಪ್ರದರ್ಶನ';

  @override
  String get guideTimeline => 'ಮಾರ್ಗದರ್ಶಿ ಟೈಮ್‌ಲೈನ್';

  @override
  String failedToLoadGuide(String error) {
    return 'ಗೈಡ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get noChannelsFound => 'ಯಾವುದೇ ಚಾನಲ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get liveBadge => 'ಲೈವ್';

  @override
  String guideNextProgram(String time, String title) {
    return 'ಮುಂದೆ: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutesನಿ ಬಾಕಿ';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hoursಗಂ ಬಾಕಿ';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hoursಗಂ $minutesನಿ ಬಾಕಿ';
  }

  @override
  String get movie => 'ಚಲನಚಿತ್ರ';

  @override
  String get removedFromFavoriteChannels =>
      'ಮೆಚ್ಚಿನ ಚಾನಲ್‌ಗಳಿಂದ ತೆಗೆದುಹಾಕಲಾಗಿದೆ';

  @override
  String get addedToFavoriteChannels => 'ಮೆಚ್ಚಿನ ಚಾನಲ್‌ಗಳಿಗೆ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get failedToUpdateFavoriteChannel =>
      'ಮೆಚ್ಚಿನ ಚಾನಲ್ ಅನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get unfavoriteChannel => 'ಮೆಚ್ಚಿನವಲ್ಲದ ಚಾನಲ್';

  @override
  String get favoriteChannel => 'ಮೆಚ್ಚಿನ ಚಾನಲ್';

  @override
  String get record => 'ರೆಕಾರ್ಡ್ ಮಾಡಿ';

  @override
  String get cancelRecordingAction => 'ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಮಾಡಿ';

  @override
  String get programSetToRecord => 'ಪ್ರೋಗ್ರಾಂ ರೆಕಾರ್ಡ್ ಮಾಡಲು ಹೊಂದಿಸಲಾಗಿದೆ';

  @override
  String get recordingCancelled => 'ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದಾಗಿದೆ';

  @override
  String get unableToCreateRecording => 'ರೆಕಾರ್ಡಿಂಗ್ ರಚಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get watch => 'ವೀಕ್ಷಿಸಿ';

  @override
  String get close => 'ಮುಚ್ಚಿ';

  @override
  String failedToPlayChannel(String name) {
    return '$name ಪ್ಲೇ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';
  }

  @override
  String get failedToLoadRecordings =>
      'ರೆಕಾರ್ಡಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get scheduledInNext24Hours => 'ಮುಂದಿನ 24 ಗಂಟೆಗಳಲ್ಲಿ ನಿಗದಿಪಡಿಸಲಾಗಿದೆ';

  @override
  String get recentRecordings => 'ಇತ್ತೀಚಿನ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು';

  @override
  String get tvSeries => 'ಟಿವಿ ಸರಣಿ';

  @override
  String get failedToLoadSchedule => 'ವೇಳಾಪಟ್ಟಿಯನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get noScheduledRecordings => 'ಯಾವುದೇ ನಿಗದಿತ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳಿಲ್ಲ';

  @override
  String get cancelRecording => 'ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಗೊಳಿಸುವುದೇ?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '\"$name\" ನ ನಿಗದಿತ ರೆಕಾರ್ಡಿಂಗ್ ಅನ್ನು ರದ್ದುಮಾಡುವುದೇ?';
  }

  @override
  String get no => 'ಇಲ್ಲ';

  @override
  String get yesCancel => 'ಹೌದು, ರದ್ದುಮಾಡಿ';

  @override
  String get failedToCancelRecording => 'ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get failedToLoadSeriesRecordings =>
      'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get noSeriesRecordings => 'ಯಾವುದೇ ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳಿಲ್ಲ';

  @override
  String get cancelSeriesRecording => 'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಮಾಡಿ';

  @override
  String get cancelSeriesRecordingQuestion =>
      'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಗೊಳಿಸುವುದೇ?';

  @override
  String stopRecordingName(String name) {
    return '\"$name\" ರೆಕಾರ್ಡಿಂಗ್ ನಿಲ್ಲಿಸುವುದೇ?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್ ರದ್ದುಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get searchThisLibrary => 'ಈ ಗ್ರಂಥಾಲಯವನ್ನು ಹುಡುಕಿ...';

  @override
  String get searchEllipsis => 'ಹುಡುಕು...';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\" ಗಾಗಿ ಯಾವುದೇ ಫಲಿತಾಂಶಗಳಿಲ್ಲ';
  }

  @override
  String searchFailedError(String error) {
    return 'ಹುಡುಕಾಟ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr ಖಾತೆ ಪ್ರಕಾರ';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'ಸ್ಥಳೀಯ';

  @override
  String get savedMedia => 'ಉಳಿಸಿದ ಮಾಧ್ಯಮ';

  @override
  String get tvShows => 'ಟಿವಿ ಶೋಗಳು';

  @override
  String get music => 'ಸಂಗೀತ';

  @override
  String get musicAlbums => 'ಸಂಗೀತ ಆಲ್ಬಂಗಳು';

  @override
  String get noMediaInFilter => 'ಈ ಫಿಲ್ಟರ್‌ನಲ್ಲಿ ಯಾವುದೇ ಮಾಧ್ಯಮವಿಲ್ಲ';

  @override
  String get noDownloadedMediaYet =>
      'ಇನ್ನೂ ಯಾವುದೇ ಮಾಧ್ಯಮವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿಲ್ಲ';

  @override
  String get browseLibrary => 'ಲೈಬ್ರರಿ ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get deleteDownload => 'ಡೌನ್‌ಲೋಡ್ ಅಳಿಸಿ';

  @override
  String removeItemAndFiles(String name) {
    return '\"$name\" ಮತ್ತು ಅದರ ಫೈಲ್‌ಗಳನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
  }

  @override
  String tracksCount(int count) {
    return '$count ಟ್ರ್ಯಾಕ್‌ಗಳು';
  }

  @override
  String get album => 'ಆಲ್ಬಮ್';

  @override
  String get playAlbum => 'ಆಲ್ಬಮ್ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String failedToLoadAlbum(String error) {
    return 'ಆಲ್ಬಮ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name ಗಾಗಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಯಾವುದೇ ಟ್ರ್ಯಾಕ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';
  }

  @override
  String get season => 'ಸೀಸನ್';

  @override
  String get errorLoadingEpisodes => 'ಸಂಚಿಕೆಗಳನ್ನು ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get noDownloadedEpisodes => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಸಂಚಿಕೆಗಳಿಲ್ಲ';

  @override
  String get deleteEpisode => 'ಸಂಚಿಕೆಯನ್ನು ಅಳಿಸಿ';

  @override
  String removeName(String name) {
    return '\"$name\" ಅನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes ನಿಮಿ';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'ಸಂಚಿಕೆ $number';
  }

  @override
  String get seriesNotFound => 'ಸರಣಿ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get errorLoadingSeries => 'ಸರಣಿಯನ್ನು ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get downloadedEpisodes => 'ಸಂಚಿಕೆಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String seasonNumber(int number) {
    return 'ಸೀಸನ್ $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'ವಿಶೇಷತೆಗಳು';

  @override
  String get deleteSeason => 'ಸೀಸನ್ ಅಳಿಸಿ';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '$season ನಲ್ಲಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಎಲ್ಲಾ ಸಂಚಿಕೆಗಳನ್ನು ಅಳಿಸುವುದೇ?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಸಂಚಿಕೆಗಳು',
      one: '1 ಸಂಚಿಕೆ',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'ಶೇಖರಣಾ ನಿರ್ವಹಣೆ';

  @override
  String get storageBreakdown => 'ಶೇಖರಣಾ ಸ್ಥಗಿತ';

  @override
  String get downloadedItems => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಐಟಂಗಳು';

  @override
  String get storageLimit => 'ಶೇಖರಣಾ ಮಿತಿ';

  @override
  String get noLimit => 'ಮಿತಿ ಇಲ್ಲ';

  @override
  String get deleteAllDownloads => 'ಎಲ್ಲಾ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String get deleteAllDownloadsWarning =>
      'ಇದು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾದ ಎಲ್ಲಾ ಮಾಧ್ಯಮ ಫೈಲ್‌ಗಳನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ ಮತ್ತು ರದ್ದುಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get deleteAll => 'ಎಲ್ಲವನ್ನೂ ಅಳಿಸಿ';

  @override
  String get deleteSelected => 'ಆಯ್ಕೆ ಮಾಡಿರುವುದನ್ನು ಅಳಿಸಿ';

  @override
  String deleteSelectedCount(int count) {
    return 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ $count ಐಟಂಗಳನ್ನು ಅಳಿಸುವುದೇ?';
  }

  @override
  String get musicAndAudiobooks => 'ಸಂಗೀತ ಮತ್ತು ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String get images => 'ಚಿತ್ರಗಳು';

  @override
  String get database => 'ಡೇಟಾಬೇಸ್';

  @override
  String ofStorageLimit(String limit) {
    return '$limit ಮಿತಿಯಲ್ಲಿ';
  }

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get authentication => 'ದೃಢೀಕರಣ';

  @override
  String get autoLoginServerManagement => 'ಸ್ವಯಂ ಲಾಗಿನ್, ಸರ್ವರ್ ನಿರ್ವಹಣೆ';

  @override
  String get pinCode => 'ಪಿನ್ ಕೋಡ್';

  @override
  String get setUpPinCodeProtection => 'ಪಿನ್ ಕೋಡ್ ರಕ್ಷಣೆಯನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get parentalControls => 'ಪೋಷಕರ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get contentRatingRestrictions => 'ವಿಷಯ ರೇಟಿಂಗ್ ನಿರ್ಬಂಧಗಳು';

  @override
  String get bitRateResolutionBehavior => 'ಬಿಟ್ರೇಟ್, ರೆಸಲ್ಯೂಶನ್, ನಡವಳಿಕೆ';

  @override
  String get languageSizeAppearance => 'ಭಾಷೆ, ಗಾತ್ರ, ನೋಟ';

  @override
  String get qualityStorage => 'ಗುಣಮಟ್ಟ, ಸಂಗ್ರಹಣೆ';

  @override
  String get serverSyncAndPluginStatus => 'ಸರ್ವರ್ ಸಿಂಕ್ ಮತ್ತು ಪ್ಲಗಿನ್ ಸ್ಥಿತಿ';

  @override
  String get mediaRequestIntegration => 'ಮಾಧ್ಯಮ ವಿನಂತಿ ಏಕೀಕರಣ';

  @override
  String get switchServer => 'ಸರ್ವರ್ ಬದಲಿಸಿ';

  @override
  String get signOut => 'ಸೈನ್ ಔಟ್';

  @override
  String get versionLicenses => 'ಆವೃತ್ತಿ, ಪರವಾನಗಿಗಳು';

  @override
  String get account => 'ಖಾತೆ';

  @override
  String get signInAndSecurity => 'ಸೈನ್ ಇನ್ ಮತ್ತು ಭದ್ರತೆ';

  @override
  String get administration => 'ಆಡಳಿತ';

  @override
  String get serverSettingsUsersLibraries =>
      'ಸರ್ವರ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು, ಬಳಕೆದಾರರು, ಲೈಬ್ರರಿಗಳು';

  @override
  String get customization => 'ಗ್ರಾಹಕೀಕರಣ';

  @override
  String get themeAndLayout => 'ಥೀಮ್ ಮತ್ತು ಲೇಔಟ್';

  @override
  String get videoAndSubtitles => 'ವೀಡಿಯೊ ಮತ್ತು ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get integrations => 'ಏಕೀಕರಣಗಳು';

  @override
  String get pluginAndRequests => 'ಪ್ಲಗಿನ್ ಮತ್ತು ವಿನಂತಿಗಳು';

  @override
  String get customizeAccountPlaybackInterface =>
      'ಖಾತೆ, ಪ್ಲೇಬ್ಯಾಕ್ ಮತ್ತು ಇಂಟರ್ಫೇಸ್ ನಡವಳಿಕೆಯನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ';

  @override
  String optionsCount(int count) {
    return '$count ಆಯ್ಕೆಗಳು';
  }

  @override
  String get themeAndAppearance => 'ಥೀಮ್ ಮತ್ತು ಗೋಚರತೆ';

  @override
  String get focusBorderColor => 'ಫೋಕಸ್ ಬಾರ್ಡರ್ ಕಲರ್';

  @override
  String get watchedIndicators => 'ಸೂಚಕಗಳನ್ನು ವೀಕ್ಷಿಸಲಾಗಿದೆ';

  @override
  String get always => 'ಯಾವಾಗಲೂ';

  @override
  String get hideUnwatched => 'ವೀಕ್ಷಿಸದಿರುವುದನ್ನು ಮರೆಮಾಡಿ';

  @override
  String get episodesOnly => 'ಸಂಚಿಕೆಗಳು ಮಾತ್ರ';

  @override
  String get never => 'ಎಂದಿಗೂ ಇಲ್ಲ';

  @override
  String get focusExpansionAnimation => 'ಫೋಕಸ್ ವಿಸ್ತರಣೆ ಅನಿಮೇಷನ್';

  @override
  String get desktopUiScale => 'ಡೆಸ್ಕ್‌ಟಾಪ್ UI ಸ್ಕೇಲ್';

  @override
  String get scaleFocusedCards =>
      'ಸ್ಕೇಲ್ ಫೋಕಸ್ಡ್ ಅಥವಾ ಹೋವರ್ಡ್ ಕಾರ್ಡ್‌ಗಳು ಮತ್ತು ಟೈಲ್ಸ್';

  @override
  String get backgroundBackdrops => 'ಹಿನ್ನೆಲೆ ಹಿನ್ನೆಲೆಗಳು';

  @override
  String get showBackdropImages =>
      'ವಿಷಯದ ಹಿಂದೆ ಬ್ಯಾಕ್‌ಡ್ರಾಪ್ ಚಿತ್ರಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get seriesThumbnails => 'ಸರಣಿ ಥಂಬ್‌ನೇಲ್‌ಗಳು';

  @override
  String get seriesThumbnailsDescription =>
      'ಸಂಚಿಕೆಗಳು ಮಾತ್ರ: ಪ್ರತಿ ಸಾಲಿನ ಚಿತ್ರ ಪ್ರಕಾರಕ್ಕೆ ಹೊಂದಿಕೆಯಾಗುವ ಸರಣಿ ಕಲಾಕೃತಿಯನ್ನು ಬಳಸಿ';

  @override
  String get homeRowInfoOverlay => 'ಮುಖಪುಟ ಸಾಲಿನ ಮಾಹಿತಿ ಓವರ್‌ಲೇ';

  @override
  String get showTitleMetadataOnHomeRows =>
      'ಹೋಮ್ ಸಾಲುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡುವಾಗ ಶೀರ್ಷಿಕೆ ಮತ್ತು ಮೆಟಾಡೇಟಾವನ್ನು ತೋರಿಸಿ';

  @override
  String get clockDisplay => 'ಗಡಿಯಾರ ಪ್ರದರ್ಶನ';

  @override
  String get inMenus => 'ಮೆನುಗಳಲ್ಲಿ';

  @override
  String get inVideo => 'ವೀಡಿಯೊದಲ್ಲಿ';

  @override
  String get seasonalEffects => 'ಕಾಲೋಚಿತ ಪರಿಣಾಮಗಳು';

  @override
  String get seasonalEffectsDescription =>
      'ದೃಶ್ಯ ಪರಿಣಾಮಗಳು ಮತ್ತು ಕಾಲೋಚಿತ ಅಲಂಕಾರಗಳು';

  @override
  String get snow => 'ಹಿಮ';

  @override
  String get fireworks => 'ಪಟಾಕಿ';

  @override
  String get confetti => 'ಕಾನ್ಫೆಟ್ಟಿ';

  @override
  String get fallingLeaves => 'ಬೀಳುವ ಎಲೆಗಳು';

  @override
  String get themeMusic => 'ಥೀಮ್ ಸಂಗೀತ';

  @override
  String get playThemeMusicOnDetailPages =>
      'ವಿವರ ಪುಟಗಳಲ್ಲಿ ಥೀಮ್ ಸಂಗೀತವನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get themeMusicVolume => 'ಥೀಮ್ ಸಂಗೀತ ಸಂಪುಟ';

  @override
  String get themeMusicSettingsSubtitle =>
      'ವಿವರ ಪುಟಗಳು, ಹೋಮ್ ಸಾಲುಗಳು ಮತ್ತು ವಾಲ್ಯೂಮ್';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'ಹೋಮ್ ರೋಗಳಲ್ಲಿ ಥೀಮ್ ಸಂಗೀತ';

  @override
  String get playWhenBrowsingHomeScreen =>
      'ಹೋಮ್ ಸ್ಕ್ರೀನ್ ಬ್ರೌಸ್ ಮಾಡುವಾಗ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get loopThemeMusic => 'ಥೀಮ್ ಸಂಗೀತವನ್ನು ಲೂಪ್ ಮಾಡಿ';

  @override
  String get loopThemeMusicSubtitle =>
      'ಟ್ರ್ಯಾಕ್ ಅನ್ನು ಒಮ್ಮೆ ಪ್ಲೇ ಮಾಡುವ ಬದಲು ಪುನರಾವರ್ತಿಸಿ';

  @override
  String get detailsBackgroundBlur => 'ವಿವರಗಳ ಹಿನ್ನೆಲೆ ಮಸುಕು';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'ಬ್ರೌಸಿಂಗ್ ಹಿನ್ನೆಲೆ ಮಸುಕು';

  @override
  String get maxStreamingBitrate => 'ಗರಿಷ್ಠ ಸ್ಟ್ರೀಮಿಂಗ್ ಬಿಟ್ರೇಟ್';

  @override
  String get maxResolution => 'ಗರಿಷ್ಠ ರೆಸಲ್ಯೂಶನ್';

  @override
  String get playerZoomMode => 'ಪ್ಲೇಯರ್ ಜೂಮ್ ಮೋಡ್';

  @override
  String get settingsScrollWheelAction => 'ಮೌಸ್ ಸ್ಕ್ರಾಲ್ ವೀಲ್';

  @override
  String get settingsScrollWheelActionDescription =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಸಮಯದಲ್ಲಿ ವಿಡಿಯೋ ಮೇಲೆ ಮೌಸ್ ವೀಲ್ ಸ್ಕ್ರಾಲ್ ಮಾಡಿದಾಗ ಏನಾಗಬೇಕು ಎಂಬುದನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get scrollWheelActionOff => 'ಆಫ್';

  @override
  String get scrollWheelActionSeek => 'ಸೀಕ್ (ಮುಂದೆ / ಹಿಂದೆ)';

  @override
  String get scrollWheelActionVolume => 'ವಾಲ್ಯೂಮ್';

  @override
  String get playerTooltipVolume => 'ವಾಲ್ಯೂಮ್';

  @override
  String get fit => 'ಫಿಟ್';

  @override
  String get autoCrop => 'ಸ್ವಯಂ ಬೆಳೆ';

  @override
  String get stretch => 'ಸ್ಟ್ರೆಚ್';

  @override
  String get refreshRateSwitching => 'ರಿಫ್ರೆಶ್ ದರ ಸ್ವಿಚಿಂಗ್';

  @override
  String get disabled => 'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get scaleOnTv => 'ಟಿವಿಯಲ್ಲಿ ಸ್ಕೇಲ್';

  @override
  String get scaleOnDevice => 'ಸಾಧನದಲ್ಲಿ ಸ್ಕೇಲ್';

  @override
  String get trickPlay => 'ಟ್ರಿಕ್ ಪ್ಲೇ';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'ಹುಡುಕುತ್ತಿರುವಾಗ ಪೂರ್ವವೀಕ್ಷಣೆ ಥಂಬ್‌ನೇಲ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get showDescriptionOnPause => 'ವಿರಾಮದಲ್ಲಿ ವಿವರಣೆಯನ್ನು ತೋರಿಸಿ';

  @override
  String get dimVideoShowOverview =>
      'ವಿರಾಮಗೊಳಿಸಿದಾಗ ವೀಡಿಯೊವನ್ನು ಮಂದಗೊಳಿಸಿ ಮತ್ತು ಅವಲೋಕನ ಪಠ್ಯವನ್ನು ತೋರಿಸಿ';

  @override
  String get osdLockButton => 'OSD ಲಾಕ್ ಬಟನ್';

  @override
  String get osdLockButtonDescription =>
      'ದೀರ್ಘಕಾಲ ಒತ್ತಿದರೆ ಸ್ಪರ್ಶ ಇನ್‌ಪುಟ್ ಅನ್ನು ನಿರ್ಬಂಧಿಸುವ ಲಾಕ್ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get audioBehavior => 'ಆಡಿಯೋ ಬಿಹೇವಿಯರ್';

  @override
  String get downmixToStereo => 'ಸ್ಟಿರಿಯೊಗೆ ಡೌನ್ಮಿಕ್ಸ್ ಮಾಡಿ';

  @override
  String get defaultAudioLanguage => 'ಡೀಫಾಲ್ಟ್ ಆಡಿಯೊ ಭಾಷೆ';

  @override
  String get fallbackAudioLanguage => 'ಪರ್ಯಾಯ ಆಡಿಯೋ ಭಾಷೆ';

  @override
  String get preferDefaultAudioTrack =>
      'ಡೀಫಾಲ್ಟ್ ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get preferDefaultAudioTrackDescription =>
      'ಸ್ಥಳೀಯ ಡಬ್‌ಗಿಂತ ಮೂಲ ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ.';

  @override
  String get preferAudioDescription =>
      'ಆಡಿಯೋ ವಿವರಣೆ ಟ್ರ್ಯಾಕ್‌ಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get preferAudioDescriptionDescription =>
      'ಸಾಮಾನ್ಯ ಟ್ರ್ಯಾಕ್‌ಗಳಿಗಿಂತ ಆಡಿಯೋ ವಿವರಣೆ ಟ್ರ್ಯಾಕ್‌ಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ.';

  @override
  String get transcodingAudio => 'ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ (ಆಡಿಯೋ)';

  @override
  String get directStreamRemux => 'ಡೈರೆಕ್ಟ್ ಸ್ಟ್ರೀಮ್ (ರೀಮಕ್ಸ್)';

  @override
  String get transcodingBitrateOrResolution =>
      'ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ (ಬಿಟ್‌ರೇಟ್ ಅಥವಾ ರೆಸಲ್ಯೂಶನ್)';

  @override
  String get transcodingVideoAndAudio =>
      'ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ (ವಿಡಿಯೋ ಮತ್ತು ಆಡಿಯೋ)';

  @override
  String get transcodingVideo => 'ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ (ವಿಡಿಯೋ)';

  @override
  String get autoServerDefault => 'ಸ್ವಯಂ (ಸರ್ವರ್ ಡೀಫಾಲ್ಟ್)';

  @override
  String get english => 'ಇಂಗ್ಲೀಷ್';

  @override
  String get spanish => 'ಸ್ಪ್ಯಾನಿಷ್';

  @override
  String get french => 'ಫ್ರೆಂಚ್';

  @override
  String get german => 'ಜರ್ಮನ್';

  @override
  String get italian => 'ಇಟಾಲಿಯನ್';

  @override
  String get portuguese => 'ಪೋರ್ಚುಗೀಸ್';

  @override
  String get japanese => 'ಜಪಾನೀಸ್';

  @override
  String get korean => 'ಕೊರಿಯನ್';

  @override
  String get chinese => 'ಚೈನೀಸ್';

  @override
  String get russian => 'ರಷ್ಯನ್';

  @override
  String get arabic => 'ಅರೇಬಿಕ್';

  @override
  String get hindi => 'ಹಿಂದಿ';

  @override
  String get dutch => 'ಡಚ್';

  @override
  String get swedish => 'ಸ್ವೀಡಿಷ್';

  @override
  String get norwegian => 'ನಾರ್ವೇಜಿಯನ್';

  @override
  String get danish => 'ಡ್ಯಾನಿಶ್';

  @override
  String get finnish => 'ಫಿನ್ನಿಶ್';

  @override
  String get polish => 'ಪೋಲಿಷ್';

  @override
  String get ac3Passthrough => 'AC3 ಪಾಸ್ಥ್ರೂ';

  @override
  String get dtsPassthrough => 'ಡಿಟಿಎಸ್ ಪಾಸ್ ಥ್ರೂ';

  @override
  String get trueHdSupport => 'TrueHD ಬೆಂಬಲ';

  @override
  String get enableDtsPassthrough =>
      'ಬಿಟ್‌ಸ್ಟ್ರೀಮ್ DTS ಆಡಿಯೋ AVR ಗೆ ಮಾತ್ರ; ರಿಸೀವರ್ ಬೆಂಬಲ ಮತ್ತು DTS ಮೂಲ ಟ್ರ್ಯಾಕ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ಆಡಿಯೊವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ (ಎಲ್ಲಾ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ಗಳಲ್ಲಿ ಕೆಲಸ ಮಾಡದಿರಬಹುದು)';

  @override
  String get settingsAudioOutputMode => 'ಆಡಿಯೋ ಔಟ್‌ಪುಟ್ ಮೋಡ್';

  @override
  String get settingsAudioOutputModeDescription =>
      'ಆಡಿಯೋವನ್ನು ಹೇಗೆ ಡಿಕೋಡ್ ಮಾಡಬೇಕು ಎಂಬುದನ್ನು ಆಯ್ಕೆಮಾಡಿ. AVR ಪಾಸ್‌ಥ್ರೂ ಕಚ್ಚಾ Dolby/DTS ಸ್ಟ್ರೀಮ್‌ಗಳನ್ನು ನಿಮ್ಮ ರಿಸೀವರ್‌ಗೆ ಕಳುಹಿಸುತ್ತದೆ; ಆಟೋ ಅಥವಾ ಡೌನ್‌ಮಿಕ್ಸ್ ಸ್ಥಳೀಯವಾಗಿ ಡಿಕೋಡ್ ಮಾಡುತ್ತದೆ.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioFallbackCodec => 'ಆಡಿಯೋ ಪರ್ಯಾಯ ಕೊಡೆಕ್';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'ಮೂಲ ಸ್ಟ್ರೀಮ್ ಅನ್ನು ನೇರವಾಗಿ ಪ್ಲೇ ಮಾಡಲು ಅಥವಾ ಪಾಸ್‌ಥ್ರೂ ಮಾಡಲು ಸಾಧ್ಯವಾಗದಿದ್ದಾಗ ಬಹು-ಚಾನೆಲ್ ಆಡಿಯೋವನ್ನು ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಮಾಡಲು ಗುರಿ ಸ್ವರೂಪವನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'ಸ್ವಯಂ ಪತ್ತೆ\n(ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(ಡೀಫಾಲ್ಟ್)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(ನಷ್ಟರಹಿತ)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(ಸ್ಟೀರಿಯೋ ಮಾತ್ರ)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(ದಕ್ಷ)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(ನಷ್ಟರಹಿತ)';

  @override
  String get settingsMaxAudioChannels => 'ಗರಿಷ್ಠ ಆಡಿಯೋ ಚಾನೆಲ್‌ಗಳು';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'ನಿಮ್ಮ ಆಡಿಯೋ ಸೆಟಪ್‌ನ ಗರಿಷ್ಠ ಚಾನೆಲ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ. ಈ ಮಿತಿಯನ್ನು ಮೀರಿದ ಬಹು-ಚಾನೆಲ್ ಸ್ಟ್ರೀಮ್‌ಗಳು ಡೌನ್‌ಮಿಕ್ಸ್ ಅಥವಾ ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಆಗುತ್ತವೆ.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'ಸ್ವಯಂ ಪತ್ತೆ\n(ಹಾರ್ಡ್‌ವೇರ್ ಡೀಫಾಲ್ಟ್)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 ಮೊನೊ';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 ಸ್ಟೀರಿಯೋ';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 ಸರೌಂಡ್';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 ಕ್ವಾಡ್ರಾಫೋನಿಕ್';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 ಸರೌಂಡ್';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 ಸರೌಂಡ್';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 ಸರೌಂಡ್';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 ಸರೌಂಡ್';

  @override
  String get settingsAudioPassthroughAdvanced => 'ಪಾಸ್‌ಥ್ರೂ (ಸುಧಾರಿತ)';

  @override
  String get settingsAudioCodecPassthrough => 'ಕೊಡೆಕ್ ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'ನಿಮ್ಮ AVR ಅಥವಾ HDMI ಸಿಂಕ್ ಬೆಂಬಲಿಸುವ ಸ್ವರೂಪಗಳನ್ನು ಮಾತ್ರ ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS ಕೋರ್ ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) ಅನ್ನು ಬಾಹ್ಯ ಡಿಕೋಡರ್‌ಗೆ ಬಿಟ್‌ಸ್ಟ್ರೀಮ್ ಮಾಡಿ.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) ಮೂಲಕ Dolby Atmos ಅನ್ನು ಬಾಹ್ಯ ಡಿಕೋಡರ್‌ಗೆ ಬಿಟ್‌ಸ್ಟ್ರೀಮ್ ಮಾಡಿ.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS ಕೋರ್ ಸೇರಿದಂತೆ) ಅನ್ನು ಬಾಹ್ಯ ಡಿಕೋಡರ್‌ಗೆ ಬಿಟ್‌ಸ್ಟ್ರೀಮ್ ಮಾಡಿ.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos ಮೆಟಾಡೇಟಾದೊಂದಿಗೆ Dolby TrueHD ಅನ್ನು ಬಾಹ್ಯ ಡಿಕೋಡರ್‌ಗೆ ಬಿಟ್‌ಸ್ಟ್ರೀಮ್ ಮಾಡಿ.';

  @override
  String get settingsDetectedAudioCapabilities => 'ಪತ್ತೆಯಾದ ಆಡಿಯೋ ಸಾಮರ್ಥ್ಯಗಳು';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'ಇನ್ನೂ ಯಾವುದೇ ರನ್‌ಟೈಮ್ ಸಾಮರ್ಥ್ಯ ಸ್ನ್ಯಾಪ್‌ಶಾಟ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get settingsAudioRouteLabel => 'ಮಾರ್ಗ';

  @override
  String get settingsAudioDecodeLabel => 'ಡಿಕೋಡ್';

  @override
  String get settingsAudioPassthroughLabel => 'ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioHdRoute => 'HD ಆಡಿಯೋ ಮಾರ್ಗ';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'ಸ್ಪೀಕರ್';

  @override
  String get settingsAudioRouteHeadphones => 'ಹೆಡ್‌ಫೋನ್‌ಗಳು';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'ವಿಡಿಯೋ ಲೆವೆಲ್';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'ವಿಡಿಯೋ ರೇಂಜ್';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'ಉಪಶೀರ್ಷಿಕೆ ಕೊಡೆಕ್';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'ಅನುಮತಿಸಲಾದ ಆಡಿಯೋ ಕೊಡೆಕ್‌ಗಳು';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS ಆಡಿಯೋ ಕೊಡೆಕ್‌ಗಳು';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 ಆಡಿಯೋ ಕೊಡೆಕ್‌ಗಳು';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'ಸಕ್ರಿಯ ಆಡಿಯೋ ಮಾರ್ಗ';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'ಮಾರ್ಗದ HD ಆಡಿಯೋ ಬೆಂಬಲ';

  @override
  String get nightMode => 'ರಾತ್ರಿ ಮೋಡ್';

  @override
  String get compressDynamicRange => 'ಡೈನಾಮಿಕ್ ಶ್ರೇಣಿಯನ್ನು ಕುಗ್ಗಿಸಿ';

  @override
  String get advancedMpv => 'ಸುಧಾರಿತ mpv';

  @override
  String get enableCustomMpvConf => 'ಕಸ್ಟಮ್ mpv.conf ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get applyMpvConfBeforePlayback =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಪ್ರಾರಂಭವಾಗುವ ಮೊದಲು ಬಳಕೆದಾರ-ನಿರ್ದಿಷ್ಟಪಡಿಸಿದ mpv.conf ಅನ್ನು ಅನ್ವಯಿಸಿ';

  @override
  String get unsafeAdvancedMpvOptions => 'ಅಸುರಕ್ಷಿತ ಸುಧಾರಿತ mpv ಆಯ್ಕೆಗಳು';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv ಆಯ್ಕೆಗಳ ವ್ಯಾಪಕ ಸೆಟ್ ಅನ್ನು ಅನುಮತಿಸಿ. ಪ್ಲೇಬ್ಯಾಕ್ ನಡವಳಿಕೆಯನ್ನು ಮುರಿಯಬಹುದು.';

  @override
  String get hardwareDecoding => 'ಹಾರ್ಡ್ವೇರ್ ಡಿಕೋಡಿಂಗ್';

  @override
  String get hardwareDecodingSubtitle =>
      'ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಸುಧಾರಿಸಬಹುದು ಆದರೆ ಕೆಲವು ಸಾಧನಗಳಲ್ಲಿ ಪ್ಲೇಬ್ಯಾಕ್ ಸಮಸ್ಯೆಗಳನ್ನು ಉಂಟುಮಾಡಬಹುದು.';

  @override
  String get nextUpAndQueuing => 'ಮುಂದಿನದು ಮತ್ತು ಸರತಿ ಸಾಲಿನಲ್ಲಿ';

  @override
  String get nextUpDisplay => 'ಮುಂದಿನ ಪ್ರದರ್ಶನ';

  @override
  String get extended => 'ವಿಸ್ತರಿಸಲಾಗಿದೆ';

  @override
  String get minimal => 'ಕನಿಷ್ಠ';

  @override
  String get nextUpTimeout => 'ಮುಂದಿನ ಕಾಲಾವಧಿ';

  @override
  String secondsValue(int value) {
    return '$valueಸೆ';
  }

  @override
  String get mediaQueuing => 'ಮಾಧ್ಯಮ ಕ್ಯೂಯಿಂಗ್';

  @override
  String get autoQueueNextEpisodes => 'ಮುಂದಿನ ಸಂಚಿಕೆಗಳಲ್ಲಿ ಸ್ವಯಂ-ಸರದಿ';

  @override
  String get stillWatchingPrompt => 'ಇನ್ನೂ ಪ್ರಾಂಪ್ಟ್ ವೀಕ್ಷಿಸುತ್ತಿದೆ';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes ಸಂಚಿಕೆಗಳ ನಂತರ / $hoursಗಂ';
  }

  @override
  String get resumeAndSkip => 'ಪುನರಾರಂಭಿಸಿ ಮತ್ತು ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get resumeRewind => 'ರಿಸ್ಯೂಮ್ ರಿವೈಂಡ್';

  @override
  String get unpauseRewind => 'ರಿವೈಂಡ್ ಅನ್ನು ವಿರಾಮಗೊಳಿಸಬೇಡಿ';

  @override
  String get fiveSeconds => '5 ಸೆಕೆಂಡುಗಳು';

  @override
  String get tenSeconds => '10 ಸೆಕೆಂಡುಗಳು';

  @override
  String get fifteenSeconds => '15 ಸೆಕೆಂಡುಗಳು';

  @override
  String get thirtySeconds => '30 ಸೆಕೆಂಡುಗಳು';

  @override
  String get skipBackLength => 'ಸ್ಕಿಪ್ ಬ್ಯಾಕ್ ಲೆಂಗ್ತ್';

  @override
  String get skipForwardLength => 'ಮುಂದಕ್ಕೆ ಉದ್ದವನ್ನು ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get customMpvConfPath => 'ಕಸ್ಟಮ್ mpv.conf ಮಾರ್ಗ';

  @override
  String get notSetMpvConf =>
      'ಹೊಂದಿಸಿಲ್ಲ. Moonfin ಅಪ್ಲಿಕೇಶನ್/ಡೇಟಾ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಡೀಫಾಲ್ಟ್ mpv.conf ಅನ್ನು ಪ್ರಯತ್ನಿಸುತ್ತದೆ.';

  @override
  String get selectMpvConf => 'mpv.conf ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'ಶೈಲಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳು (ಗಾತ್ರ, ಬಣ್ಣ, ಆಫ್‌ಸೆಟ್) ಪಠ್ಯ ಆಧಾರಿತ ಉಪಶೀರ್ಷಿಕೆಗಳಿಗೆ (SRT, VTT, TTML) ಅನ್ವಯಿಸುತ್ತವೆ. \"ASS/SSA ಡೈರೆಕ್ಟ್ ಪ್ಲೇ\" ಅನ್ನು ಆಫ್ ಮಾಡದ ಹೊರತು ASS/SSA ಉಪಶೀರ್ಷಿಕೆಗಳು ತಮ್ಮದೇ ಆದ ಎಂಬೆಡೆಡ್ ಸ್ಟೈಲಿಂಗ್ ಅನ್ನು ಬಳಸುತ್ತವೆ. ಬಿಟ್‌ಮ್ಯಾಪ್ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು (PGS, DVB, VobSub) ಮರುಹೊಂದಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';

  @override
  String get defaultSubtitleLanguage => 'ಡೀಫಾಲ್ಟ್ ಉಪಶೀರ್ಷಿಕೆ ಭಾಷೆ';

  @override
  String get defaultToNoSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳಿಲ್ಲ ಎಂಬುದಕ್ಕೆ ಡೀಫಾಲ್ಟ್';

  @override
  String get turnOffSubtitlesByDefault =>
      'ಡೀಫಾಲ್ಟ್ ಆಗಿ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಆಫ್ ಮಾಡಿ';

  @override
  String get subtitleSize => 'ಉಪಶೀರ್ಷಿಕೆ ಗಾತ್ರ';

  @override
  String get textFillColor => 'ಪಠ್ಯವನ್ನು ತುಂಬುವ ಬಣ್ಣ';

  @override
  String get backgroundColor => 'ಹಿನ್ನೆಲೆ ಬಣ್ಣ';

  @override
  String get textStrokeColor => 'ಪಠ್ಯ ಸ್ಟ್ರೋಕ್ ಬಣ್ಣ';

  @override
  String get subtitleCustomization => 'ಉಪಶೀರ್ಷಿಕೆ ಗ್ರಾಹಕೀಕರಣ';

  @override
  String get subtitleCustomizationDescription =>
      'ಉಪಶೀರ್ಷಿಕೆ ನೋಟವನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ';

  @override
  String get subtitleMode => 'ಉಪಶೀರ್ಷಿಕೆ ಮೋಡ್';

  @override
  String get subtitleModeFlagged => 'ಫ್ಲ್ಯಾಗ್ ಮಾಡಲಾದ';

  @override
  String get subtitleModeAlways => 'ಯಾವಾಗಲೂ';

  @override
  String get subtitleModeForeign => 'ವಿದೇಶಿ';

  @override
  String get subtitleModeForced => 'ಫೋರ್ಸ್ಡ್';

  @override
  String get subtitleModeFlaggedDescription =>
      'ಮಾಧ್ಯಮ ಫೈಲ್‌ನ ಮೆಟಾಡೇಟಾದಲ್ಲಿ \"default\" ಅಥವಾ \"forced\" ಎಂದು ಆಂತರಿಕವಾಗಿ ಫ್ಲ್ಯಾಗ್ ಮಾಡಲಾದ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ಪ್ಲೇ ಮಾಡುತ್ತದೆ.';

  @override
  String get subtitleModeAlwaysDescription =>
      'ವಿಡಿಯೋ ಪ್ರಾರಂಭವಾದಾಗಲೆಲ್ಲಾ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಲೋಡ್ ಮಾಡಿ ತೋರಿಸುತ್ತದೆ.';

  @override
  String get subtitleModeForeignDescription =>
      'ಡೀಫಾಲ್ಟ್ ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್ ವಿದೇಶಿ ಭಾಷೆಯಲ್ಲಿದ್ದರೆ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಆನ್ ಮಾಡುತ್ತದೆ.';

  @override
  String get subtitleModeForcedDescription =>
      'ಫೋರ್ಸ್ಡ್ ಮೆಟಾಡೇಟಾ ಫ್ಲ್ಯಾಗ್‌ನೊಂದಿಗೆ ಸ್ಪಷ್ಟವಾಗಿ ಟ್ಯಾಗ್ ಮಾಡಲಾದ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಮಾತ್ರ ಲೋಡ್ ಮಾಡುತ್ತದೆ.';

  @override
  String get subtitleModeNoneDescription =>
      'ಸ್ವಯಂಚಾಲಿತ ಉಪಶೀರ್ಷಿಕೆ ಲೋಡಿಂಗ್ ಅನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುತ್ತದೆ.';

  @override
  String get fallbackSubtitleLanguage => 'ಪರ್ಯಾಯ ಉಪಶೀರ್ಷಿಕೆ ಭಾಷೆ';

  @override
  String get subtitleStream => 'ಉಪಶೀರ್ಷಿಕೆ ಸ್ಟ್ರೀಮ್';

  @override
  String get subtitlePreviewText =>
      'ತ್ವರಿತ ಕಂದು ನರಿ ಸೋಮಾರಿಯಾದ ನಾಯಿಯ ಮೇಲೆ ಜಿಗಿಯುತ್ತದೆ';

  @override
  String get verticalOffset => 'ಲಂಬ ಆಫ್ಸೆಟ್';

  @override
  String get pgsDirectPlay => 'PGS ಡೈರೆಕ್ಟ್ ಪ್ಲೇ';

  @override
  String get directPlayPgsSubtitles => 'ನೇರ ಪ್ಲೇ PGS ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get assSsaDirectPlay => 'ASS/SSA ಡೈರೆಕ್ಟ್ ಪ್ಲೇ';

  @override
  String get directPlayAssSsaSubtitles =>
      'ASS/SSA ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ನೇರವಾಗಿ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get white => 'ಬಿಳಿ';

  @override
  String get black => 'ಕಪ್ಪು';

  @override
  String get yellow => 'ಹಳದಿ';

  @override
  String get green => 'ಹಸಿರು';

  @override
  String get cyan => 'ಸಯಾನ್';

  @override
  String get red => 'ಕೆಂಪು';

  @override
  String get transparent => 'ಪಾರದರ್ಶಕ';

  @override
  String get semiTransparentBlack => 'ಅರೆ-ಪಾರದರ್ಶಕ ಕಪ್ಪು';

  @override
  String get global => 'ಜಾಗತಿಕ';

  @override
  String get desktop => 'ಡೆಸ್ಕ್ಟಾಪ್';

  @override
  String get mobile => 'ಮೊಬೈಲ್';

  @override
  String get tv => 'ಟಿ.ವಿ';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile ಪ್ರೊಫೈಲ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗಿದೆ.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile ಪ್ರೊಫೈಲ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'ಸ್ಥಳೀಯ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು $profile ಪ್ರೊಫೈಲ್‌ಗೆ ಸಿಂಕ್ ಮಾಡಲಾಗಿದೆ.';
  }

  @override
  String get customizationProfile => 'ಗ್ರಾಹಕೀಕರಣ ಪ್ರೊಫೈಲ್';

  @override
  String get customizationProfileDescription =>
      'ಲೋಡ್ ಮಾಡಲು, ಎಡಿಟ್ ಮಾಡಲು ಮತ್ತು ಸಿಂಕ್ ಮಾಡಲು ಪ್ರೊಫೈಲ್ ಅನ್ನು ಆಯ್ಕೆಮಾಡಿ. ಸಾಧನದ ಪ್ರೊಫೈಲ್ ಅದನ್ನು ಅತಿಕ್ರಮಿಸದ ಹೊರತು ಗ್ಲೋಬಲ್ ಎಲ್ಲೆಡೆ ಅನ್ವಯಿಸುತ್ತದೆ. ಹಸಿರು ಚುಕ್ಕೆ ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಸಾಧನದ ಪ್ರೊಫೈಲ್ ಅನ್ನು ಗುರುತಿಸುತ್ತದೆ.';

  @override
  String get loadProfile => 'ಪ್ರೊಫೈಲ್ ಅನ್ನು ಲೋಡ್ ಮಾಡಿ';

  @override
  String get syncing => 'ಸಿಂಕ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get syncToProfile => 'ಪ್ರೊಫೈಲ್‌ಗೆ ಸಿಂಕ್ ಮಾಡಿ';

  @override
  String get profileSyncHidden => 'ಪ್ರೊಫೈಲ್ ಸಿಂಕ್ ಮರೆಮಾಡಲಾಗಿದೆ';

  @override
  String get enablePluginSyncDescription =>
      'ಪ್ರೊಫೈಲ್ ನಿಯಂತ್ರಣಗಳನ್ನು ಇಲ್ಲಿ ತೋರಿಸಲು ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಸಿಂಕ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get quality => 'ಗುಣಮಟ್ಟ';

  @override
  String get defaultDownloadQuality => 'ಡೀಫಾಲ್ಟ್ ಡೌನ್‌ಲೋಡ್ ಗುಣಮಟ್ಟ';

  @override
  String get network => 'ನೆಟ್ವರ್ಕ್';

  @override
  String get wifiOnlyDownloads => 'ವೈಫೈ-ಮಾತ್ರ ಡೌನ್‌ಲೋಡ್‌ಗಳು';

  @override
  String get reportDownloadsActivity => 'ಸರ್ವರ್‌ನಲ್ಲಿ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get reportDownloadsActivitySubtitle =>
      'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಮಾಡಿದ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ಸರ್ವರ್ ನಿರ್ವಾಹಕರು ನೋಡಲು ಅನುಮತಿಸಿ';

  @override
  String get onlyDownloadOnWifi => 'ವೈಫೈಗೆ ಸಂಪರ್ಕಗೊಂಡಾಗ ಮಾತ್ರ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get storage => 'ಸಂಗ್ರಹಣೆ';

  @override
  String get storageUsed => 'ಶೇಖರಣೆಯನ್ನು ಬಳಸಲಾಗಿದೆ';

  @override
  String get manage => 'ನಿರ್ವಹಿಸಿ';

  @override
  String get calculating => 'ಲೆಕ್ಕಾಚಾರ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get downloadLocation => 'ಸ್ಥಳವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get defaultLabel => 'ಡೀಫಾಲ್ಟ್';

  @override
  String get saveToDownloadsFolder => 'ಡೌನ್‌ಲೋಡ್‌ಗಳ ಫೋಲ್ಡರ್‌ಗೆ ಉಳಿಸಿ';

  @override
  String get downloadsVisibleToOtherApps =>
      'ಡೌನ್‌ಲೋಡ್‌ಗಳು/Moonfin — ಇತರ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ ಗೋಚರಿಸುತ್ತದೆ';

  @override
  String get dangerZone => 'ಡೇಂಜರ್ ಝೋನ್';

  @override
  String get clearAllDownloads => 'ಎಲ್ಲಾ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get original => 'ಮೂಲ';

  @override
  String get changeDownloadLocation => 'ಡೌನ್‌ಲೋಡ್ ಸ್ಥಳವನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get changeDownloadLocationDescription =>
      'ಹೊಸ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿದ ಫೋಲ್ಡರ್‌ಗೆ ಉಳಿಸಲಾಗುತ್ತದೆ. ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಡೌನ್‌ಲೋಡ್‌ಗಳು ಅವುಗಳ ಪ್ರಸ್ತುತ ಸ್ಥಳದಲ್ಲಿಯೇ ಉಳಿಯುತ್ತವೆ ಮತ್ತು ಶೇಖರಣಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಂದ ನಿರ್ವಹಿಸಬಹುದು.';

  @override
  String get confirm => 'ದೃಢೀಕರಿಸಿ';

  @override
  String get cannotWriteToFolder =>
      'ಆಯ್ಕೆಮಾಡಿದ ಫೋಲ್ಡರ್‌ಗೆ ಬರೆಯಲು ಸಾಧ್ಯವಿಲ್ಲ. ದಯವಿಟ್ಟು ಬೇರೆ ಸ್ಥಳವನ್ನು ಆಯ್ಕೆಮಾಡಿ ಅಥವಾ ಶೇಖರಣಾ ಅನುಮತಿಗಳನ್ನು ನೀಡಿ.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'ಡೌನ್‌ಲೋಡ್‌ಗಳ ಫೋಲ್ಡರ್‌ಗೆ ಉಳಿಸುವುದೇ?';

  @override
  String get saveToDownloadsFolderDescription =>
      'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಮಾಧ್ಯಮವನ್ನು ನಿಮ್ಮ ಸಾಧನದಲ್ಲಿ ಡೌನ್‌ಲೋಡ್‌ಗಳು/Moonfin ಗೆ ಉಳಿಸಲಾಗುತ್ತದೆ. ಈ ಫೈಲ್‌ಗಳು ನಿಮ್ಮ ಗ್ಯಾಲರಿ ಅಥವಾ ಮ್ಯೂಸಿಕ್ ಪ್ಲೇಯರ್‌ನಂತಹ ಇತರ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ ಗೋಚರಿಸುತ್ತವೆ.\n\nಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಡೌನ್‌ಲೋಡ್‌ಗಳು ಅವುಗಳ ಪ್ರಸ್ತುತ ಸ್ಥಳದಲ್ಲಿಯೇ ಉಳಿಯುತ್ತವೆ.';

  @override
  String get enable => 'ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get clearAllDownloadsWarning =>
      'ಇದು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಎಲ್ಲಾ ಮಾಧ್ಯಮವನ್ನು ಅಳಿಸುತ್ತದೆ ಮತ್ತು ರದ್ದುಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get clearAll => 'ಎಲ್ಲವನ್ನೂ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get navigationStyle => 'ನ್ಯಾವಿಗೇಷನ್ ಶೈಲಿ';

  @override
  String get topBar => 'ಟಾಪ್ ಬಾರ್';

  @override
  String get leftSidebar => 'ಎಡ ಸೈಡ್ಬಾರ್';

  @override
  String get showShuffleButton => 'ಷಫಲ್ ಬಟನ್ ತೋರಿಸಿ';

  @override
  String get showGenresButton => 'ಪ್ರಕಾರಗಳ ಬಟನ್ ತೋರಿಸಿ';

  @override
  String get showFavoritesButton => 'ಮೆಚ್ಚಿನವುಗಳ ಬಟನ್ ತೋರಿಸಿ';

  @override
  String get showLibrariesInToolbar => 'ಟೂಲ್‌ಬಾರ್‌ನಲ್ಲಿ ಲೈಬ್ರರಿಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get navbarAlwaysExpanded =>
      'ನ್ಯಾವ್‌ಬಾರ್ ಲೇಬಲ್‌ಗಳನ್ನು ಯಾವಾಗಲೂ ವಿಸ್ತರಿಸಿ';

  @override
  String get showSeerrButton => 'Seerr ಬಟನ್ ತೋರಿಸಿ';

  @override
  String get navbarOpacity => 'ನವಬಾರ್ ಅಪಾರದರ್ಶಕತೆ';

  @override
  String get navbarColor => 'ನವಬಾರ್ ಬಣ್ಣ';

  @override
  String get gray => 'ಬೂದು';

  @override
  String get darkBlue => 'ಗಾಢ ನೀಲಿ';

  @override
  String get purple => 'ನೇರಳೆ';

  @override
  String get teal => 'ಟೀಲ್';

  @override
  String get navy => 'ನೌಕಾಪಡೆ';

  @override
  String get charcoal => 'ಇದ್ದಿಲು';

  @override
  String get brown => 'ಕಂದು';

  @override
  String get darkRed => 'ಗಾಢ ಕೆಂಪು';

  @override
  String get darkGreen => 'ಗಾಢ ಹಸಿರು';

  @override
  String get slate => 'ಸ್ಲೇಟ್';

  @override
  String get indigo => 'ಇಂಡಿಗೊ';

  @override
  String get libraryDisplay => 'ಲೈಬ್ರರಿ ಪ್ರದರ್ಶನ';

  @override
  String get posterLabel => 'ಪೋಸ್ಟರ್';

  @override
  String get thumbnailLabel => 'ಥಂಬ್‌ನೇಲ್';

  @override
  String get bannerLabel => 'ಬ್ಯಾನರ್';

  @override
  String get overridePerLibrarySettings =>
      'ಪ್ರತಿ-ಲೈಬ್ರರಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಅತಿಕ್ರಮಿಸಿ';

  @override
  String get applyImageTypeToAllLibraries =>
      'ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳಿಗೆ ಚಿತ್ರದ ಪ್ರಕಾರವನ್ನು ಅನ್ವಯಿಸಿ';

  @override
  String get multiServerLibraries => 'ಬಹು-ಸರ್ವರ್ ಗ್ರಂಥಾಲಯಗಳು';

  @override
  String get showLibrariesFromAllServers =>
      'ಎಲ್ಲಾ ಸಂಪರ್ಕಿತ ಸರ್ವರ್‌ಗಳಿಂದ ಲೈಬ್ರರಿಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get enableFolderView => 'ಫೋಲ್ಡರ್ ವೀಕ್ಷಣೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get showFolderBrowsingOption => 'ಫೋಲ್ಡರ್ ಬ್ರೌಸಿಂಗ್ ಆಯ್ಕೆಯನ್ನು ತೋರಿಸಿ';

  @override
  String get groupItemsIntoCollections => 'ಐಟಂಗಳನ್ನು ಸಂಗ್ರಹಣೆಗಳಾಗಿ ಗುಂಪು ಮಾಡಿ';

  @override
  String get hideCollectionAssociatedItems =>
      'ಲೈಬ್ರರಿಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡುವಾಗ ಸಂಗ್ರಹಣೆಗೆ ಸಂಬಂಧಿಸಿದ ಲೈಬ್ರರಿ ಐಟಂಗಳನ್ನು ಮರೆಮಾಡಿ';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'ಲೈಬ್ರರಿ ಗುಂಪುಗೊಳಿಸುವಿಕೆ ಸೂಚನೆ';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'ಈ ಸೆಟ್ಟಿಂಗ್ ಅನ್ನು ಬಳಸಲು, ನಿಮ್ಮ Jellyfin ಅಥವಾ Emby ಸರ್ವರ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಲೈಬ್ರರಿಯ ಪ್ರದರ್ಶನ ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಅಡಿಯಲ್ಲಿ \"Group movies into collections\" ಮತ್ತು/ಅಥವಾ \"Group shows into collections\" ಲೈಬ್ರರಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಸಕ್ರಿಯಗೊಂಡಿವೆ ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ.';

  @override
  String get libraryVisibility => 'ಲೈಬ್ರರಿ ಗೋಚರತೆ';

  @override
  String get libraryVisibilityDescription =>
      'ಪ್ರತಿ ಲೈಬ್ರರಿಗೆ ಮುಖಪುಟದ ಗೋಚರತೆಯನ್ನು ಟಾಗಲ್ ಮಾಡಿ. ಬದಲಾವಣೆಗಳು ಕಾರ್ಯರೂಪಕ್ಕೆ ಬರಲು Moonfin ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get showInNavigation => 'ನ್ಯಾವಿಗೇಶನ್‌ನಲ್ಲಿ ತೋರಿಸಿ';

  @override
  String get showInLatestMedia => 'ಇತ್ತೀಚಿನ ಮಾಧ್ಯಮದಲ್ಲಿ ತೋರಿಸಿ';

  @override
  String get sourceLibraries => 'ಮೂಲ ಗ್ರಂಥಾಲಯಗಳು';

  @override
  String get sourceCollections => 'ಮೂಲ ಸಂಗ್ರಹಣೆಗಳು';

  @override
  String get excludedGenres => 'ಹೊರತುಪಡಿಸಿದ ಪ್ರಕಾರಗಳು';

  @override
  String get selectAll => 'ಎಲ್ಲವನ್ನೂ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String itemsSelected(int count) {
    return '$count ಆಯ್ಕೆಮಾಡಲಾಗಿದೆ';
  }

  @override
  String get mediaBar => 'ಮೀಡಿಯಾ ಬಾರ್';

  @override
  String get mediaSources => 'ಮಾಧ್ಯಮ ಮೂಲಗಳು';

  @override
  String get behavior => 'ನಡವಳಿಕೆ';

  @override
  String get seconds => 'ಸೆಕೆಂಡುಗಳು';

  @override
  String get localPreviews => 'ಸ್ಥಳೀಯ ಮುನ್ನೋಟಗಳು';

  @override
  String get localPreviewsDescription =>
      'ಟ್ರೇಲರ್, ಮಾಧ್ಯಮ ಮತ್ತು ಆಡಿಯೊ ಪೂರ್ವವೀಕ್ಷಣೆಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ.';

  @override
  String get mediaBarMode => 'ಮೀಡಿಯಾ ಬಾರ್ ಶೈಲಿ';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD ನಡುವೆ ಆಯ್ಕೆಮಾಡಿ ಅಥವಾ ಮಾಧ್ಯಮ ಬಾರ್ ಅನ್ನು ಆಫ್ ಮಾಡಿ';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'ಆಫ್';

  @override
  String get enableMediaBar => 'ಮೀಡಿಯಾ ಬಾರ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get showFeaturedContentSlideshow =>
      'ಮುಖಪುಟದಲ್ಲಿ ವೈಶಿಷ್ಟ್ಯಗೊಳಿಸಿದ ವಿಷಯ ಸ್ಲೈಡ್‌ಶೋ ತೋರಿಸಿ';

  @override
  String get contentType => 'ವಿಷಯದ ಪ್ರಕಾರ';

  @override
  String get moviesAndTvShows => 'ಚಲನಚಿತ್ರಗಳು ಮತ್ತು ಟಿವಿ ಶೋಗಳು';

  @override
  String get moviesOnly => 'ಚಲನಚಿತ್ರಗಳು ಮಾತ್ರ';

  @override
  String get tvShowsOnly => 'ಟಿವಿ ಶೋಗಳು ಮಾತ್ರ';

  @override
  String get itemCount => 'ಐಟಂ ಎಣಿಕೆ';

  @override
  String get noneSelected => 'ಯಾವುದನ್ನೂ ಆಯ್ಕೆ ಮಾಡಿಲ್ಲ';

  @override
  String get noneExcluded => 'ಯಾವುದನ್ನೂ ಹೊರಗಿಡಲಾಗಿಲ್ಲ';

  @override
  String get autoAdvance => 'ಆಟೋ ಅಡ್ವಾನ್ಸ್';

  @override
  String get autoAdvanceSlides => 'ಮುಂದಿನ ಸ್ಲೈಡ್‌ಗೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಮುನ್ನಡೆಯಿರಿ';

  @override
  String get autoAdvanceInterval => 'ಸ್ವಯಂ ಮುಂಗಡ ಮಧ್ಯಂತರ';

  @override
  String get trailerPreview => 'ಟ್ರೈಲರ್ ಪೂರ್ವವೀಕ್ಷಣೆ';

  @override
  String get autoPlayTrailers =>
      '3 ಸೆಕೆಂಡುಗಳ ನಂತರ ಮೀಡಿಯಾ ಬಾರ್‌ನಲ್ಲಿ ಸ್ವಯಂ-ಪ್ಲೇ ಟ್ರೇಲರ್‌ಗಳು';

  @override
  String get trailerAudio => 'ಟ್ರೇಲರ್ ಆಡಿಯೋ';

  @override
  String get enableTrailerAudio =>
      'ಮೀಡಿಯಾ ಬಾರ್‌ನಲ್ಲಿ ಟ್ರೇಲರ್‌ಗಳಿಗೆ ಆಡಿಯೋ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get episodePreview => 'ಸಂಚಿಕೆ ಮುನ್ನೋಟ';

  @override
  String get mediaPreview => 'ಮಾಧ್ಯಮ ಮುನ್ನೋಟ';

  @override
  String get episodePreviewDescription =>
      'ಕೇಂದ್ರೀಕರಿಸಿದ, ಸುಳಿದಾಡಿದ ಅಥವಾ ದೀರ್ಘ-ಒತ್ತಿದ ಕಾರ್ಡ್‌ಗಳಲ್ಲಿ 30-ಸೆಕೆಂಡ್ ಇನ್‌ಲೈನ್ ಪೂರ್ವವೀಕ್ಷಣೆಯನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get mediaPreviewDescription =>
      'ಕೇಂದ್ರೀಕರಿಸಿದ, ಸುಳಿದಾಡಿದ ಅಥವಾ ದೀರ್ಘ-ಒತ್ತಿದ ಕಾರ್ಡ್‌ಗಳಲ್ಲಿ 30-ಸೆಕೆಂಡ್ ಇನ್‌ಲೈನ್ ಪೂರ್ವವೀಕ್ಷಣೆಯನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get previewAudio => 'ಪೂರ್ವವೀಕ್ಷಣೆ ಆಡಿಯೋ';

  @override
  String get enablePreviewAudio =>
      'ಟ್ರೈಲರ್ ಮತ್ತು ಎಪಿಸೋಡ್ ಪೂರ್ವವೀಕ್ಷಣೆಗಳಿಗಾಗಿ ಆಡಿಯೊವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get latestMedia => 'ಇತ್ತೀಚಿನ ಮಾಧ್ಯಮ';

  @override
  String get recentlyReleased => 'ಇತ್ತೀಚೆಗೆ ಬಿಡುಗಡೆಯಾಗಿದೆ';

  @override
  String get myMedia => 'ನನ್ನ ಮಾಧ್ಯಮ';

  @override
  String get myMediaSmall => 'ನನ್ನ ಮಾಧ್ಯಮ (ಸಣ್ಣ)';

  @override
  String get continueWatching => 'ನೋಡುವುದನ್ನು ಮುಂದುವರಿಸಿ';

  @override
  String get resumeAudio => 'ಆಡಿಯೊವನ್ನು ಪುನರಾರಂಭಿಸಿ';

  @override
  String get resumeBooks => 'ಪುಸ್ತಕಗಳನ್ನು ಪುನರಾರಂಭಿಸಿ';

  @override
  String get activeRecordings => 'ಸಕ್ರಿಯ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು';

  @override
  String get playlists => 'ಪ್ಲೇಪಟ್ಟಿಗಳು';

  @override
  String get liveTV => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get homeSections => 'ಮುಖಪುಟ ವಿಭಾಗಗಳು';

  @override
  String get resetToDefaults => 'ಡೀಫಾಲ್ಟ್‌ಗಳಿಗೆ ಮರುಹೊಂದಿಸಿ';

  @override
  String get homeRowPosterSize => 'ಹೋಮ್ ರೋ ಪೋಸ್ಟರ್ ಗಾತ್ರ';

  @override
  String get perRowImageTypeSelection => 'ಪ್ರತಿ ಸಾಲಿನ ಚಿತ್ರ ಪ್ರಕಾರದ ಆಯ್ಕೆ';

  @override
  String get configureImageTypeForEachRow =>
      'ಪ್ರತಿ ಸಕ್ರಿಯಗೊಳಿಸಲಾದ ಹೋಮ್ ಸಾಲಿಗೆ ಚಿತ್ರದ ಪ್ರಕಾರವನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'ವಿಲೀನವನ್ನು ಮುಂದುವರಿಸಿ ವೀಕ್ಷಣೆ ಮತ್ತು ಮುಂದಿನದು';

  @override
  String get combineBothRows => 'ಎರಡೂ ಸಾಲುಗಳನ್ನು ಒಂದೇ ಹೋಮ್ ವಿಭಾಗಕ್ಕೆ ಸೇರಿಸಿ';

  @override
  String get fullScreenRows => 'ವಿಸ್ತರಿಸಿದ ಹೋಮ್ ಸಾಲುಗಳು';

  @override
  String get fullScreenRowsDescription =>
      'ಹೋಮ್ ಸಾಲುಗಳನ್ನು ಪ್ರತಿ ಪರದೆಗೆ 1 ಸಾಲಿಗೆ ಮಿತಿಗೊಳಿಸಿ';

  @override
  String get perRowImageType => 'ಪ್ರತಿ ಸಾಲಿನ ಚಿತ್ರ ಪ್ರಕಾರ';

  @override
  String get perRowSettings => 'ಪ್ರತಿ ಸಾಲಿನ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get autoLogin => 'ಸ್ವಯಂ ಲಾಗಿನ್';

  @override
  String get lastUser => 'ಕೊನೆಯ ಬಳಕೆದಾರ';

  @override
  String get currentUser => 'ಪ್ರಸ್ತುತ ಬಳಕೆದಾರ';

  @override
  String get alwaysAuthenticate => 'ಯಾವಾಗಲೂ ಪ್ರಮಾಣೀಕರಿಸಿ';

  @override
  String get requirePasswordWithToken =>
      'ಸಂಗ್ರಹಿಸಿದ ಟೋಕನ್‌ನೊಂದಿಗೆ ಸಹ ಪಾಸ್‌ವರ್ಡ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get confirmExit => 'ನಿರ್ಗಮನವನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get showConfirmationBeforeExiting =>
      'ನಿರ್ಗಮಿಸುವ ಮೊದಲು ದೃಢೀಕರಣವನ್ನು ತೋರಿಸಿ';

  @override
  String get blockContentWithRatings =>
      'ಕೆಳಗಿನ ರೇಟಿಂಗ್‌ಗಳೊಂದಿಗೆ ವಿಷಯವನ್ನು ನಿರ್ಬಂಧಿಸಿ:';

  @override
  String get noContentRatingsFound =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ ಇನ್ನೂ ಯಾವುದೇ ವಿಷಯ ರೇಟಿಂಗ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get couldNotLoadServerRatings =>
      'ಸರ್ವರ್ ರೇಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ಉಳಿಸಿದ ರೇಟಿಂಗ್‌ಗಳನ್ನು ಮಾತ್ರ ತೋರಿಸಲಾಗುತ್ತಿದೆ.';

  @override
  String get couldNotRefreshRatings =>
      'ಸರ್ವರ್‌ನಿಂದ ರೇಟಿಂಗ್‌ಗಳನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ಉಳಿಸಿದ ರೇಟಿಂಗ್‌ಗಳನ್ನು ತೋರಿಸಲಾಗುತ್ತಿದೆ.';

  @override
  String get enablePinCode => 'ಪಿನ್ ಕೋಡ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get requirePinToAccess => 'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಪ್ರವೇಶಿಸಲು ಪಿನ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get changePin => 'ಪಿನ್ ಬದಲಾಯಿಸಿ';

  @override
  String get setNewPinCode => 'ಹೊಸ ಪಿನ್ ಕೋಡ್ ಹೊಂದಿಸಿ';

  @override
  String get removePin => 'ಪಿನ್ ತೆಗೆದುಹಾಕಿ';

  @override
  String get removePinProtection => 'ಪಿನ್ ಕೋಡ್ ರಕ್ಷಣೆಯನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String get screensaver => 'ಸ್ಕ್ರೀನ್ ಸೇವರ್';

  @override
  String get inAppScreensaver => 'ಇನ್-ಅಪ್ಲಿಕೇಶನ್ ಸ್ಕ್ರೀನ್ ಸೇವರ್';

  @override
  String get enableBuiltInScreensaver =>
      'ಅಂತರ್ನಿರ್ಮಿತ ಸ್ಕ್ರೀನ್ ಸೇವರ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get mode => 'ಮೋಡ್';

  @override
  String get libraryArt => 'ಗ್ರಂಥಾಲಯ ಕಲೆ';

  @override
  String get logo => 'ಲೋಗೋ';

  @override
  String get clock => 'ಗಡಿಯಾರ';

  @override
  String get timeout => 'ಸಮಯ ಮೀರಿದೆ';

  @override
  String minutesShort(int minutes) {
    return '$minutes ನಿಮಿ';
  }

  @override
  String get dimmingLevel => 'ಮಬ್ಬಾಗಿಸುವಿಕೆ ಮಟ್ಟ';

  @override
  String get maxAgeRating => 'ಗರಿಷ್ಠ ವಯಸ್ಸಿನ ರೇಟಿಂಗ್';

  @override
  String get any => 'ಯಾವುದೇ';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'ವಯಸ್ಸಿನ ರೇಟಿಂಗ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get onlyShowRatedContent => 'ರೇಟ್ ಮಾಡಲಾದ ವಿಷಯವನ್ನು ಮಾತ್ರ ತೋರಿಸಿ';

  @override
  String get showClock => 'ಗಡಿಯಾರವನ್ನು ತೋರಿಸಿ';

  @override
  String get displayClockDuringScreensaver =>
      'ಸ್ಕ್ರೀನ್ ಸೇವರ್ ಸಮಯದಲ್ಲಿ ಗಡಿಯಾರವನ್ನು ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get clockModeStatic => 'ಸ್ಥಿರ';

  @override
  String get clockModeBouncing => 'ಪುಟಿಯುವ';

  @override
  String get rottenTomatoesCritics => 'ರಾಟನ್ ಟೊಮ್ಯಾಟೋಸ್ (ವಿಮರ್ಶಕರು)';

  @override
  String get rottenTomatoesAudience => 'ರಾಟನ್ ಟೊಮ್ಯಾಟೋಸ್ (ಪ್ರೇಕ್ಷಕರು)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'ಮೆಟಾಕ್ರಿಟಿಕ್';

  @override
  String get metacriticUser => 'ಮೆಟಾಕ್ರಿಟಿಕ್ (ಬಳಕೆದಾರ)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'ಲೆಟರ್ ಬಾಕ್ಸ್';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'ಅನಿಲಿಸ್ಟ್';

  @override
  String get communityRating => 'ಸಮುದಾಯ ರೇಟಿಂಗ್';

  @override
  String get ratings => 'ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get additionalRatings => 'ಹೆಚ್ಚುವರಿ ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList ಮತ್ತು TMDB ರೇಟಿಂಗ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get ratingLabels => 'ರೇಟಿಂಗ್ ಲೇಬಲ್‌ಗಳು';

  @override
  String get showLabelsNextToIcons =>
      'ರೇಟಿಂಗ್ ಐಕಾನ್‌ಗಳ ಪಕ್ಕದಲ್ಲಿ ಲೇಬಲ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get ratingBadges => 'ರೇಟಿಂಗ್ ಬ್ಯಾಡ್ಜ್‌ಗಳು';

  @override
  String get showDecorativeBadges =>
      'ರೇಟಿಂಗ್‌ಗಳ ಹಿಂದೆ ಅಲಂಕಾರಿಕ ಬ್ಯಾಡ್ಜ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get episodeRatings => 'ಸಂಚಿಕೆ ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get showRatingsOnEpisodes =>
      'ಪ್ರತ್ಯೇಕ ಸಂಚಿಕೆಗಳಲ್ಲಿ ರೇಟಿಂಗ್‌ಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get ratingSources => 'ರೇಟಿಂಗ್ ಮೂಲಗಳು';

  @override
  String get ratingSourcesDescription =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನಾದ್ಯಂತ ತೋರಿಸಲಾದ ರೇಟಿಂಗ್ ಮೂಲಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ ಮತ್ತು ಮರುಕ್ರಮಗೊಳಿಸಿ';

  @override
  String get pluginLabel => 'Moonbase ಪ್ಲಗಿನ್';

  @override
  String get pluginDetected => 'ಪ್ಲಗಿನ್ ಪತ್ತೆಯಾಗಿದೆ';

  @override
  String get pluginNotDetected => 'ಪ್ಲಗಿನ್ ಪತ್ತೆಯಾಗಿಲ್ಲ';

  @override
  String get pluginDetectedDescription =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಪತ್ತೆಯಾಗಿದೆ. ಮೊದಲ ಬಾರಿಗೆ ಪ್ಲಗಿನ್ ಕಂಡುಬಂದಾಗ ಸಿಂಕ್ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get pluginNotDetectedDescription =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಪ್ರಸ್ತುತ ಪತ್ತೆಯಾಗಿಲ್ಲ. ಸ್ಥಳೀಯ ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಇನ್ನೂ ತಮ್ಮ ಉಳಿಸಿದ ಮೌಲ್ಯಗಳನ್ನು ಅಥವಾ ಅಂತರ್ನಿರ್ಮಿತ ಡೀಫಾಲ್ಟ್‌ಗಳನ್ನು ಬಳಸುತ್ತವೆ.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nಆವೃತ್ತಿ: $version';
  }

  @override
  String get availableServices => 'ಲಭ್ಯವಿರುವ ಸೇವೆಗಳು';

  @override
  String get serverPluginSync => 'ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಸಿಂಕ್';

  @override
  String get syncSettingsWithPlugin =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್‌ನೊಂದಿಗೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಸಿಂಕ್ ಮಾಡಿ';

  @override
  String get whatSyncControls => 'ಯಾವ ಸಿಂಕ್ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get syncControlsDescription =>
      'ಪ್ಲಗಿನ್-ಬೆಂಬಲಿತ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಸರ್ವರ್‌ಗೆ ತಳ್ಳಲಾಗುತ್ತದೆ ಮತ್ತು ಎಳೆಯಲಾಗುತ್ತದೆಯೇ ಎಂಬುದನ್ನು ಮಾತ್ರ ಸಿಂಕ್ ನಿಯಂತ್ರಿಸುತ್ತದೆ. ಪ್ಲಗಿನ್ ಸಿಂಕ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿದಾಗ ಪ್ರೊಫೈಲ್ ಆಯ್ಕೆ ಮತ್ತು ಪ್ರೊಫೈಲ್ ಸಿಂಕ್ ಕ್ರಿಯೆಗಳು ಗ್ರಾಹಕೀಕರಣ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿವೆ.';

  @override
  String get recentRequests => 'ಇತ್ತೀಚಿನ ವಿನಂತಿಗಳು';

  @override
  String get recentlyAdded => 'ಇತ್ತೀಚೆಗೆ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get trending => 'ಟ್ರೆಂಡಿಂಗ್';

  @override
  String get popularMovies => 'ಜನಪ್ರಿಯ ಚಲನಚಿತ್ರಗಳು';

  @override
  String get movieGenres => 'ಚಲನಚಿತ್ರ ಪ್ರಕಾರಗಳು';

  @override
  String get upcomingMovies => 'ಮುಂಬರುವ ಚಲನಚಿತ್ರಗಳು';

  @override
  String get studios => 'ಸ್ಟುಡಿಯೋಗಳು';

  @override
  String get popularSeries => 'ಜನಪ್ರಿಯ ಸರಣಿ';

  @override
  String get seriesGenres => 'ಸರಣಿ ಪ್ರಕಾರಗಳು';

  @override
  String get upcomingSeries => 'ಮುಂಬರುವ ಸರಣಿ';

  @override
  String get networks => 'ಜಾಲಗಳು';

  @override
  String get seerrDiscoveryRows => 'Seerr ಡಿಸ್ಕವರಿ ಸಾಲುಗಳು';

  @override
  String get resetRowsToDefaults => 'ಸಾಲುಗಳನ್ನು ಡೀಫಾಲ್ಟ್‌ಗೆ ಮರುಹೊಂದಿಸಿ';

  @override
  String get enableSeerr => 'Seerr ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get showSeerrInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್‌ನಲ್ಲಿ Seerr ತೋರಿಸಿ (ಸರ್ವರ್ ಪ್ಲಗಿನ್ ಅಗತ್ಯವಿದೆ)';

  @override
  String get seerrUnavailable =>
      'ಸರ್ವರ್ ಪ್ಲಗಿನ್‌ನ Seerr ಬೆಂಬಲ ನಿಷ್ಕ್ರಿಯಗೊಂಡಿರುವುದರಿಂದ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get nsfwFilter => 'NSFW ಫಿಲ್ಟರ್';

  @override
  String get hideAdultContent => 'ಫಲಿತಾಂಶಗಳಲ್ಲಿ ವಯಸ್ಕ ವಿಷಯವನ್ನು ಮರೆಮಾಡಿ';

  @override
  String get seerrNotificationsSection => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get seerrNotifyNewRequestsTitle => 'ಹೊಸ ವಿನಂತಿ ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'ಯಾರಾದರೂ ವಿನಂತಿ ಸಲ್ಲಿಸಿದಾಗ ನನಗೆ ತಿಳಿಸಿ';

  @override
  String get seerrNotifyLibraryAddedTitle => 'ವಿನಂತಿ ನವೀಕರಣಗಳು';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'ಅನುಮೋದಿಸಲಾಗಿದೆ, ತಿರಸ್ಕರಿಸಲಾಗಿದೆ ಮತ್ತು ನಿಮ್ಮ ಲೈಬ್ರರಿಗೆ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get seerrNotifyIssuesTitle => 'ಸಮಸ್ಯೆ ನವೀಕರಣಗಳು';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'ಹೊಸ ಸಮಸ್ಯೆಗಳು, ಪ್ರತ್ಯುತ್ತರಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು';

  @override
  String loggedInAs(String username) {
    return 'ಇವರಾಗಿ ಲಾಗಿನ್ ಆಗಿದ್ದೀರಿ: $username';
  }

  @override
  String get discoverRows => 'Seerr ಡಿಸ್ಕವರಿ ಪುಟ';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr ಮುಖಪುಟದಲ್ಲಿ ನೋಡಲು ಸಾಲುಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ. ಮರುಕ್ರಮಗೊಳಿಸಲು ಎಳೆಯಿರಿ. ಕಸ್ಟಮ್ ಕ್ರಮವು Moonbase ನೊಂದಿಗೆ ಸಿಂಕ್ ಆಗುತ್ತದೆ.';

  @override
  String get discoverRowsDescription =>
      'Seerr ಮುಖಪುಟದಲ್ಲಿ ನೋಡಲು ಸಾಲುಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ. ಮರುಕ್ರಮಗೊಳಿಸಲು ಎಳೆಯಿರಿ. ಕಸ್ಟಮ್ ಕ್ರಮವು Moonbase ನೊಂದಿಗೆ ಸಿಂಕ್ ಆಗುತ್ತದೆ.';

  @override
  String get enabled => 'ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get hidden => 'ಮರೆಮಾಡಲಾಗಿದೆ';

  @override
  String get aboutTitle => 'ಬಗ್ಗೆ';

  @override
  String versionValue(String version) {
    return 'ಆವೃತ್ತಿ $version';
  }

  @override
  String get openSourceLicenses => 'ಮುಕ್ತ ಮೂಲ ಪರವಾನಗಿಗಳು';

  @override
  String get sourceCode => 'ಮೂಲ ಕೋಡ್';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'ಇದೀಗ ನವೀಕರಣಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ';

  @override
  String get checksLatestDesktopRelease =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ಗಾಗಿ ಇತ್ತೀಚಿನ ಡೆಸ್ಕ್‌ಟಾಪ್ ಬಿಡುಗಡೆಯನ್ನು ಪರಿಶೀಲಿಸುತ್ತದೆ';

  @override
  String get youAreUpToDate => 'ನೀವು ನವೀಕೃತವಾಗಿರುವಿರಿ.';

  @override
  String get couldNotCheckForUpdates => 'ಇದೀಗ ನವೀಕರಣಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಲಾಗಲಿಲ್ಲ.';

  @override
  String get noCompatibleUpdate =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ಗಾಗಿ ಯಾವುದೇ ಹೊಂದಾಣಿಕೆಯ ಅಪ್‌ಡೇಟ್ ಪ್ಯಾಕೇಜ್ ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get updateChecksNotSupported =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ನವೀಕರಣ ಪರಿಶೀಲನೆಗಳನ್ನು ಬೆಂಬಲಿಸುವುದಿಲ್ಲ.';

  @override
  String get updateNotificationsDisabled =>
      'ನವೀಕರಣ ಅಧಿಸೂಚನೆಗಳನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get pleaseWaitBeforeChecking =>
      'ಮತ್ತೊಮ್ಮೆ ಪರಿಶೀಲಿಸುವ ಮೊದಲು ದಯವಿಟ್ಟು ನಿರೀಕ್ಷಿಸಿ.';

  @override
  String get latestUpdateAlreadyShown =>
      'ಇತ್ತೀಚಿನ ನವೀಕರಣವನ್ನು ಈಗಾಗಲೇ ತೋರಿಸಲಾಗಿದೆ.';

  @override
  String get updateAvailable => 'ನವೀಕರಣ ಲಭ್ಯವಿದೆ.';

  @override
  String updateAvailableVersion(String version) {
    return 'ನವೀಕರಣ ಲಭ್ಯವಿದೆ: v$version';
  }

  @override
  String get updateNotifications => 'ಅಧಿಸೂಚನೆಗಳನ್ನು ನವೀಕರಿಸಿ';

  @override
  String get showWhenUpdatesAvailable => 'ನವೀಕರಣಗಳು ಲಭ್ಯವಿದ್ದಾಗ ತೋರಿಸಿ';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version ಲಭ್ಯವಿದೆ';
  }

  @override
  String get readReleaseNotes => 'ಬಿಡುಗಡೆ ಟಿಪ್ಪಣಿಗಳನ್ನು ಓದಿ';

  @override
  String get downloadingUpdate => 'ನವೀಕರಣವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get updateDownloadFailed =>
      'ಅಪ್‌ಡೇಟ್ ಡೌನ್‌ಲೋಡ್ ವಿಫಲವಾಗಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get openReleasesPage => 'ಬಿಡುಗಡೆಯ ಪುಟವನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get navigation => 'ನ್ಯಾವಿಗೇಷನ್';

  @override
  String get watchedIndicatorsBackdrops =>
      'ಸೂಚಕಗಳು, ಹಿನ್ನೆಲೆಗಳನ್ನು ವೀಕ್ಷಿಸಲಾಗಿದೆ';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'ಫೋಕಸ್ ಬಣ್ಣ, ವೀಕ್ಷಿಸಿದ ಸೂಚಕಗಳು, ಬ್ಯಾಕ್‌ಡ್ರಾಪ್‌ಗಳು';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar ಶೈಲಿ, ಟೂಲ್‌ಬಾರ್ ಬಟನ್‌ಗಳು, ನೋಟ';

  @override
  String get reorderToggleHomeRows =>
      'ಹೋಮ್ ಸಾಲುಗಳನ್ನು ಮರುಕ್ರಮಗೊಳಿಸಿ ಮತ್ತು ಟಾಗಲ್ ಮಾಡಿ';

  @override
  String get featuredContentAppearance => 'ವೈಶಿಷ್ಟ್ಯಗೊಳಿಸಿದ ವಿಷಯ, ನೋಟ';

  @override
  String get posterSizeImageTypeFolderView =>
      'ಪೋಸ್ಟರ್ ಗಾತ್ರ, ಚಿತ್ರದ ಪ್ರಕಾರ, ಫೋಲ್ಡರ್ ವೀಕ್ಷಣೆ';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB, ಮತ್ತು ರೇಟಿಂಗ್ ಮೂಲಗಳು';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'ಚಿತ್ರ ಕ್ಯಾಶ್ ಮಿತಿ';

  @override
  String get clearImageCache => 'ಚಿತ್ರ ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get imageCacheCleared => 'ಚಿತ್ರ ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get clear => 'ತೆರವುಗೊಳಿಸಿ';

  @override
  String get browse => 'ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get noResults => 'ಯಾವುದೇ ಫಲಿತಾಂಶಗಳಿಲ್ಲ';

  @override
  String get seerrAvailableStatus => 'ಲಭ್ಯವಿದೆ';

  @override
  String get seerrRequestedStatus => 'ಕೋರಲಾಗಿದೆ';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ · $percent%';
  }

  @override
  String get seerrImportingStatus => 'ಆಮದು ಮಾಡಲಾಗುತ್ತಿದೆ';

  @override
  String itemsCount(int count) {
    return '$count ಐಟಂಗಳು';
  }

  @override
  String get seerrSettings => 'Seerr ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get requestMore => 'ಇನ್ನಷ್ಟು ವಿನಂತಿಸಿ';

  @override
  String get request => 'ವಿನಂತಿ';

  @override
  String get cancelRequest => 'ವಿನಂತಿಯನ್ನು ರದ್ದುಮಾಡಿ';

  @override
  String get playInMoonfin => 'Moonfin ನಲ್ಲಿ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String requestedByName(String name) {
    return '$name ವಿನಂತಿಸಿದ್ದಾರೆ';
  }

  @override
  String get approve => 'ಅನುಮೋದಿಸಿ';

  @override
  String get declineAction => 'ನಿರಾಕರಿಸು';

  @override
  String get similar => 'ಇದೇ';

  @override
  String get recommendations => 'ಶಿಫಾರಸುಗಳು';

  @override
  String cancelRequestForTitle(String title) {
    return '\"$title\" ಗಾಗಿ ವಿನಂತಿಯನ್ನು ರದ್ದುಮಾಡುವುದೇ?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" ಗಾಗಿ $count ವಿನಂತಿಗಳನ್ನು ರದ್ದುಮಾಡುವುದೇ?';
  }

  @override
  String get keep => 'ಇರಿಸಿಕೊಳ್ಳಿ';

  @override
  String get itemNotFoundInLibrary =>
      'ನಿಮ್ಮ Moonfin ಲೈಬ್ರರಿಯಲ್ಲಿ ಐಟಂ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get errorSearchingLibrary => 'ಲೈಬ್ರರಿಯನ್ನು ಹುಡುಕುವಲ್ಲಿ ದೋಷ';

  @override
  String budgetAmount(String amount) {
    return 'ಬಜೆಟ್: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'ಆದಾಯ: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type ವಿನಂತಿಸಿ';
  }

  @override
  String get submitRequest => 'ವಿನಂತಿಯನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get allSeasons => 'ಎಲ್ಲಾ ಋತುಗಳು';

  @override
  String get advancedOptions => 'ಸುಧಾರಿತ ಆಯ್ಕೆಗಳು';

  @override
  String get noServiceServersConfigured =>
      'ಯಾವುದೇ ಸೇವಾ ಸರ್ವರ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get server => 'ಸರ್ವರ್';

  @override
  String get qualityProfile => 'ಗುಣಮಟ್ಟದ ಪ್ರೊಫೈಲ್';

  @override
  String get rootFolder => 'ರೂಟ್ ಫೋಲ್ಡರ್';

  @override
  String get showMore => 'ಇನ್ನಷ್ಟು ತೋರಿಸು';

  @override
  String get appearances => 'ಕಾಣಿಸಿಕೊಂಡ ಕೃತಿಗಳು';

  @override
  String get crewSection => 'ಸಿಬ್ಬಂದಿ';

  @override
  String ageValue(int age) {
    return 'ವಯಸ್ಸು $age';
  }

  @override
  String get noRequests => 'ಯಾವುದೇ ವಿನಂತಿಗಳಿಲ್ಲ';

  @override
  String get pendingStatus => 'ಬಾಕಿಯಿದೆ';

  @override
  String get declinedStatus => 'ನಿರಾಕರಿಸಲಾಗಿದೆ';

  @override
  String get partiallyAvailable => 'ಭಾಗಶಃ ಲಭ್ಯವಿದೆ';

  @override
  String get downloadingStatus => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ';

  @override
  String get approvedStatus => 'ಅನುಮೋದಿಸಲಾಗಿದೆ';

  @override
  String get notRequestedStatus => 'ವಿನಂತಿಸಲಾಗಿಲ್ಲ';

  @override
  String get blocklistedStatus => 'ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ';

  @override
  String get deletedStatus => 'ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get failedStatus => 'ವಿಫಲವಾಗಿದೆ';

  @override
  String get processingStatus => 'ಪ್ರಕ್ರಿಯೆಗೊಳ್ಳುತ್ತಿದೆ';

  @override
  String modifiedByName(String name) {
    return '$name ಮಾರ್ಪಡಿಸಿದ್ದಾರೆ';
  }

  @override
  String get completedStatus => 'ಪೂರ್ಣಗೊಂಡಿದೆ';

  @override
  String get requestErrorDuplicate => 'ಈ ಶೀರ್ಷಿಕೆಯನ್ನು ಈಗಾಗಲೇ ವಿನಂತಿಸಲಾಗಿದೆ';

  @override
  String get requestErrorQuota => 'ವಿನಂತಿ ಮಿತಿ ತಲುಪಿದೆ';

  @override
  String get requestErrorBlocklisted => 'ಈ ಶೀರ್ಷಿಕೆ ನಿರ್ಬಂಧಿತ ಪಟ್ಟಿಯಲ್ಲಿದೆ';

  @override
  String get requestErrorNoSeasons => 'ವಿನಂತಿಸಲು ಯಾವುದೇ ಸೀಸನ್‌ಗಳು ಉಳಿದಿಲ್ಲ';

  @override
  String get requestErrorPermission => 'ಈ ವಿನಂತಿಯನ್ನು ಮಾಡಲು ನಿಮಗೆ ಅನುಮತಿ ಇಲ್ಲ';

  @override
  String get seerrRequestsTitle => 'ವಿನಂತಿಗಳು';

  @override
  String get seerrIssuesTitle => 'ಸಮಸ್ಯೆಗಳು';

  @override
  String get sortNewest => 'ಹೊಸದು';

  @override
  String get sortLastModified => 'ಕೊನೆಯದಾಗಿ ಮಾರ್ಪಡಿಸಿದ್ದು';

  @override
  String get noIssues => 'ಯಾವುದೇ ಸಮಸ್ಯೆಗಳಿಲ್ಲ';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit ಚಲನಚಿತ್ರ ವಿನಂತಿಗಳಲ್ಲಿ $remaining ಬಾಕಿ ಉಳಿದಿವೆ';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit ಸೀಸನ್ ವಿನಂತಿಗಳಲ್ಲಿ $remaining ಬಾಕಿ ಉಳಿದಿವೆ';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name ನ ಭಾಗ';
  }

  @override
  String get viewCollection => 'ಸಂಗ್ರಹಣೆಯನ್ನು ವೀಕ್ಷಿಸಿ';

  @override
  String get requestCollection => 'ಸಂಗ್ರಹಣೆಯನ್ನು ವಿನಂತಿಸಿ';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total ಚಲನಚಿತ್ರಗಳು · $available ಲಭ್ಯವಿದೆ';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count ಚಲನಚಿತ್ರಗಳನ್ನು ವಿನಂತಿಸಿ';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total ರಲ್ಲಿ $current ವಿನಂತಿಸಲಾಗುತ್ತಿದೆ...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count ಚಲನಚಿತ್ರಗಳನ್ನು ವಿನಂತಿಸಲಾಗಿದೆ';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total ಚಲನಚಿತ್ರಗಳಲ್ಲಿ $ok ಅನ್ನು ವಿನಂತಿಸಲಾಗಿದೆ';
  }

  @override
  String get collectionAllRequested =>
      'ಎಲ್ಲಾ ಚಲನಚಿತ್ರಗಳು ಈಗಾಗಲೇ ಲಭ್ಯವಿವೆ ಅಥವಾ ವಿನಂತಿಸಲಾಗಿದೆ';

  @override
  String get reportIssue => 'ಸಮಸ್ಯೆಯನ್ನು ವರದಿ ಮಾಡಿ';

  @override
  String get issueTypeVideo => 'ವಿಡಿಯೋ';

  @override
  String get issueTypeAudio => 'ಆಡಿಯೋ';

  @override
  String get whatsWrong => 'ಏನು ತಪ್ಪಾಗಿದೆ?';

  @override
  String get allEpisodes => 'ಎಲ್ಲಾ ಸಂಚಿಕೆಗಳು';

  @override
  String get episode => 'ಸಂಚಿಕೆ';

  @override
  String get openStatus => 'ತೆರೆದಿದೆ';

  @override
  String get resolvedStatus => 'ಪರಿಹರಿಸಲಾಗಿದೆ';

  @override
  String get resolveAction => 'ಪರಿಹರಿಸಿ';

  @override
  String get reopenAction => 'ಮತ್ತೆ ತೆರೆಯಿರಿ';

  @override
  String reportedByName(String name) {
    return '$name ವರದಿ ಮಾಡಿದ್ದಾರೆ';
  }

  @override
  String commentsCount(int count) {
    return '$count ಕಾಮೆಂಟ್‌ಗಳು';
  }

  @override
  String get addComment => 'ಕಾಮೆಂಟ್ ಸೇರಿಸಿ';

  @override
  String get deleteIssueConfirm => 'ಈ ಸಮಸ್ಯೆಯನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String get submitReport => 'ವರದಿಯನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get tmdbScore => 'TMDB ಸ್ಕೋರ್';

  @override
  String get releaseDateLabel => 'ಬಿಡುಗಡೆ ದಿನಾಂಕ';

  @override
  String get firstAirDateLabel => 'ಮೊದಲ ಪ್ರಸಾರ ದಿನಾಂಕ';

  @override
  String get revenueLabel => 'ಆದಾಯ';

  @override
  String get runtimeLabel => 'ಚಾಲನಾಸಮಯ';

  @override
  String get budgetLabel => 'ಬಜೆಟ್';

  @override
  String get originalLanguageLabel => 'ಮೂಲ ಭಾಷೆ';

  @override
  String get seasonsLabel => 'ಸೀಸನ್‌ಗಳು';

  @override
  String get episodesLabel => 'ಸಂಚಿಕೆಗಳು';

  @override
  String get access => 'ಪ್ರವೇಶ';

  @override
  String get add => 'ಸೇರಿಸಿ';

  @override
  String get address => 'ವಿಳಾಸ';

  @override
  String get analytics => 'ಅನಾಲಿಟಿಕ್ಸ್';

  @override
  String get catalog => 'ಕ್ಯಾಟಲಾಗ್';

  @override
  String get content => 'ವಿಷಯ';

  @override
  String get copy => 'ನಕಲು ಮಾಡಿ';

  @override
  String get create => 'ರಚಿಸಿ';

  @override
  String get disable => 'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get done => 'ಮುಗಿದಿದೆ';

  @override
  String get edit => 'ಸಂಪಾದಿಸಿ';

  @override
  String get encoding => 'ಎನ್ಕೋಡಿಂಗ್';

  @override
  String get error => 'ದೋಷ';

  @override
  String get forward => 'ಮುಂದಕ್ಕೆ';

  @override
  String get general => 'ಸಾಮಾನ್ಯ';

  @override
  String get go => 'ಹೋಗು';

  @override
  String get install => 'ಸ್ಥಾಪಿಸಿ';

  @override
  String get installed => 'ಸ್ಥಾಪಿಸಲಾಗಿದೆ';

  @override
  String get interval => 'ಮಧ್ಯಂತರ';

  @override
  String get name => 'ಹೆಸರು';

  @override
  String get networking => 'ನೆಟ್ವರ್ಕಿಂಗ್';

  @override
  String get next => 'ಮುಂದೆ';

  @override
  String get path => 'ಮಾರ್ಗ';

  @override
  String get paused => 'ವಿರಾಮಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get permissions => 'ಅನುಮತಿಗಳು';

  @override
  String get processing => 'ಸಂಸ್ಕರಣೆ';

  @override
  String get profile => 'ಪ್ರೊಫೈಲ್';

  @override
  String get provider => 'ಒದಗಿಸುವವರು';

  @override
  String get refresh => 'ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get remote => 'ರಿಮೋಟ್';

  @override
  String get rename => 'ಮರುಹೆಸರಿಸು';

  @override
  String get revoke => 'ಹಿಂತೆಗೆದುಕೊಳ್ಳಿ';

  @override
  String get role => 'ಪಾತ್ರ';

  @override
  String get root => 'ರೂಟ್';

  @override
  String get run => 'ಓಡು';

  @override
  String get search => 'ಹುಡುಕಿ';

  @override
  String get select => 'ಆಯ್ಕೆ ಮಾಡಿ';

  @override
  String get send => 'ಕಳುಹಿಸು';

  @override
  String get sessions => 'ಸೆಷನ್ಸ್';

  @override
  String get set => 'ಹೊಂದಿಸಿ';

  @override
  String get status => 'ಸ್ಥಿತಿ';

  @override
  String get stop => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get streaming => 'ಸ್ಟ್ರೀಮಿಂಗ್';

  @override
  String get time => 'ಸಮಯ';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'ಅನ್‌ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ';

  @override
  String get up => 'ಮೇಲಕ್ಕೆ';

  @override
  String get update => 'ನವೀಕರಿಸಿ';

  @override
  String get upload => 'ಅಪ್ಲೋಡ್ ಮಾಡಿ';

  @override
  String get unmute => 'ಅನ್‌ಮ್ಯೂಟ್ ಮಾಡಿ';

  @override
  String get mute => 'ಮ್ಯೂಟ್ ಮಾಡಿ';

  @override
  String get branding => 'ಬ್ರ್ಯಾಂಡಿಂಗ್';

  @override
  String get adminDrawerDashboard => 'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್';

  @override
  String get adminDrawerAnalytics => 'ಅನಾಲಿಟಿಕ್ಸ್';

  @override
  String get adminDrawerSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminDrawerBranding => 'ಬ್ರ್ಯಾಂಡಿಂಗ್';

  @override
  String get adminDrawerUsers => 'ಬಳಕೆದಾರರು';

  @override
  String get adminDrawerLibraries => 'ಲೈಬ್ರರಿಗಳು';

  @override
  String get adminDrawerDisplay => 'ಪ್ರದರ್ಶನ';

  @override
  String get adminDrawerMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminDrawerNfo => 'NFO ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminDrawerTranscoding => 'ಟ್ರಾನ್ಸ್ಕೋಡಿಂಗ್';

  @override
  String get adminDrawerResume => 'ಮುಂದುವರಿಸಿ';

  @override
  String get adminDrawerStreaming => 'ಸ್ಟ್ರೀಮಿಂಗ್';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'ಸಾಧನಗಳು';

  @override
  String get adminDrawerActivity => 'ಚಟುವಟಿಕೆ';

  @override
  String get adminDrawerNetworking => 'ನೆಟ್ವರ್ಕಿಂಗ್';

  @override
  String get adminDrawerApiKeys => 'API ಕೀಗಳು';

  @override
  String get adminDrawerBackups => 'ಬ್ಯಾಕಪ್‌ಗಳು';

  @override
  String get adminDrawerLogs => 'ದಾಖಲೆಗಳು';

  @override
  String get adminDrawerScheduledTasks => 'ನಿಗದಿತ ಕಾರ್ಯಗಳು';

  @override
  String get adminDrawerPlugins => 'ಪ್ಲಗಿನ್‌ಗಳು';

  @override
  String get adminDrawerRepositories => 'ರೆಪೊಸಿಟರಿಗಳು';

  @override
  String get adminDrawerLiveTv => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get adminExitTooltip => 'ನಿರ್ವಾಹಕರಿಂದ ನಿರ್ಗಮಿಸಿ';

  @override
  String get adminDashboardLoadFailed => 'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminMediaOverview => 'ಮಾಧ್ಯಮ ಅವಲೋಕನ';

  @override
  String get adminMediaTotalsError =>
      'ಸರ್ವರ್ ಮೀಡಿಯಾ ಮೊತ್ತವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get adminMediaOverviewSubtitle =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ ಎಷ್ಟು ವಿಷಯವಿದೆ ಎಂಬುದರ ಕುರಿತು ತ್ವರಿತ ಓದುವಿಕೆ.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'ಪ್ಲಗಿನ್ ನವೀಕರಣಗಳು ಲಭ್ಯವಿವೆ: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'ಮರುಪ್ರಾರಂಭ ಅಗತ್ಯವಿರುವ ಪ್ಲಗಿನ್‌ಗಳು: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'ವಿಫಲವಾದ ನಿಗದಿತ ಕಾರ್ಯಗಳು: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'ಇತ್ತೀಚಿನ ಎಚ್ಚರಿಕೆ/ದೋಷ ನಮೂದುಗಳು: $count';
  }

  @override
  String get analyticsMediaDistribution => 'ಮಾಧ್ಯಮ ವಿತರಣೆ';

  @override
  String get analyticsVideoCodecs => 'ವೀಡಿಯೊ ಕೋಡೆಕ್‌ಗಳು';

  @override
  String get analyticsAudioCodecs => 'ಆಡಿಯೋ ಕೋಡೆಕ್‌ಗಳು';

  @override
  String get analyticsContainers => 'ಕಂಟೈನರ್ಗಳು';

  @override
  String get analyticsTopGenres => 'ಉನ್ನತ ಪ್ರಕಾರಗಳು';

  @override
  String get analyticsReleaseYears => 'ಬಿಡುಗಡೆಯ ವರ್ಷಗಳು';

  @override
  String get analyticsContentRatings => 'ವಿಷಯ ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get analyticsRuntimeBuckets => 'ರನ್ಟೈಮ್ ಬಕೆಟ್ಗಳು';

  @override
  String get analyticsFileFormats => 'ಫೈಲ್ ಸ್ವರೂಪಗಳು';

  @override
  String get analyticsNoData => 'ಯಾವುದೇ ಡೇಟಾ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminServerInfo => 'ಸರ್ವರ್ ಮಾಹಿತಿ';

  @override
  String get adminRestartPending => 'ಮರುಪ್ರಾರಂಭಿಸಲು ಬಾಕಿಯಿದೆ';

  @override
  String get adminServerPaths => 'ಸರ್ವರ್ ಮಾರ್ಗಗಳು';

  @override
  String get adminServerActions => 'ಸರ್ವರ್ ಕ್ರಿಯೆಗಳು';

  @override
  String get adminRestartServer => 'ಸರ್ವರ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ';

  @override
  String get adminShutdownServer => 'ಸ್ಥಗಿತಗೊಳಿಸುವ ಸರ್ವರ್';

  @override
  String get adminScanLibraries => 'ಲೈಬ್ರರಿಗಳನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get adminLibraryScanStarted => 'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಪ್ರಾರಂಭಿಸಲಾಗಿದೆ';

  @override
  String errorGeneric(String error) {
    return 'ದೋಷ: $error';
  }

  @override
  String get adminServerRebootInProgress => 'ಸರ್ವರ್ ರೀಬೂಟ್ ಪ್ರಗತಿಯಲ್ಲಿದೆ';

  @override
  String get adminServerRebootMessage =>
      'ಸರ್ವರ್ ರೀಬೂಟ್ ಪ್ರಗತಿಯಲ್ಲಿದೆ, ದಯವಿಟ್ಟು ಮರುಪ್ರಾರಂಭಿಸಿ Moonfin';

  @override
  String get adminActiveSessions => 'ಸಕ್ರಿಯ ಅವಧಿಗಳು';

  @override
  String get adminSessionsLoadFailed => 'ಸೆಶನ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoActiveSessions => 'ಯಾವುದೇ ಸಕ್ರಿಯ ಅವಧಿಗಳಿಲ್ಲ';

  @override
  String get adminRecentActivity => 'ಇತ್ತೀಚಿನ ಚಟುವಟಿಕೆ';

  @override
  String get adminNoRecentActivity => 'ಯಾವುದೇ ಇತ್ತೀಚಿನ ಚಟುವಟಿಕೆ ಇಲ್ಲ';

  @override
  String adminCommandFailed(String error) {
    return 'ಆದೇಶ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminSendMessage => 'ಸಂದೇಶ ಕಳುಹಿಸಿ';

  @override
  String get adminMessageTextHint => 'ಸಂದೇಶ ಪಠ್ಯ';

  @override
  String get adminSetVolume => 'ವಾಲ್ಯೂಮ್ ಹೊಂದಿಸಿ';

  @override
  String get sessionPrev => 'ಹಿಂದಿನ';

  @override
  String get sessionRewind => 'ರಿವೈಂಡ್';

  @override
  String get sessionForward => 'ಮುಂದಕ್ಕೆ';

  @override
  String get sessionNext => 'ಮುಂದೆ';

  @override
  String get sessionVolumeDown => 'ಸಂಪುಟ -';

  @override
  String get sessionVolumeUp => 'ಸಂಪುಟ +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'ಈಗ ಪ್ಲೇ ಆಗುತ್ತಿದೆ';

  @override
  String get volume => 'ವಾಲ್ಯೂಮ್';

  @override
  String get actions => 'ಕ್ರಿಯೆಗಳು';

  @override
  String get videoCodec => 'ವೀಡಿಯೊ ಕೋಡೆಕ್';

  @override
  String get audioCodec => 'ಆಡಿಯೋ ಕೋಡೆಕ್';

  @override
  String get hwAccel => 'HW ವೇಗವರ್ಧನೆ';

  @override
  String get completion => 'ಪೂರ್ಣಗೊಳಿಸುವಿಕೆ';

  @override
  String get direct => 'ನೇರ';

  @override
  String get adminDisconnect => 'ಸಂಪರ್ಕ ಕಡಿತಗೊಳಿಸಿ';

  @override
  String get adminClearDates => 'ದಿನಾಂಕಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get adminActivitySeverityAll => 'ಎಲ್ಲಾ ತೀವ್ರತೆಗಳು';

  @override
  String get adminActivityDateRange => 'ದಿನಾಂಕ ವ್ಯಾಪ್ತಿ';

  @override
  String adminActivityLoadFailed(String error) {
    return 'ಚಟುವಟಿಕೆ ಲಾಗ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminNoActivityEntries => 'ಯಾವುದೇ ಚಟುವಟಿಕೆ ನಮೂದುಗಳಿಲ್ಲ';

  @override
  String get adminEditDeviceName => 'ಸಾಧನದ ಹೆಸರನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get adminCustomName => 'ಕಸ್ಟಮ್ ಹೆಸರು';

  @override
  String get adminDeviceNameUpdated => 'ಸಾಧನದ ಹೆಸರನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'ಸಾಧನವನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminDeleteDevice => 'ಸಾಧನವನ್ನು ಅಳಿಸಿ';

  @override
  String get adminDeviceDeleted => 'ಸಾಧನವನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'ಸಾಧನವನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '\'$name\' ಸಾಧನವನ್ನು ತೆಗೆದುಹಾಕುವುದೇ? ಬಳಕೆದಾರರು ಈ ಸಾಧನದಲ್ಲಿ ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಬೇಕಾಗುತ್ತದೆ.';
  }

  @override
  String get adminDeleteAllDevices => 'ಎಲ್ಲಾ ಸಾಧನಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count ಸಾಧನಗಳನ್ನು ತೆಗೆದುಹಾಕುವುದೇ? ಪ್ರಭಾವಿತ ಬಳಕೆದಾರರು ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಬೇಕಾಗುತ್ತದೆ. ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಸಾಧನಕ್ಕೆ ಇದು ಪರಿಣಾಮ ಬೀರುವುದಿಲ್ಲ.';
  }

  @override
  String get adminDevicesDeletedAll => 'ಸಾಧನಗಳನ್ನು ತೆಗೆದುಹಾಕಲಾಗಿದೆ';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'ಕೆಲವು ಸಾಧನಗಳನ್ನು ತೆಗೆದುಹಾಕಲಾಗಿದೆ; $count ಅನ್ನು ತೆಗೆದುಹಾಕಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';
  }

  @override
  String get adminDevicesLoadFailed => 'ಸಾಧನಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminSearchDevices => 'ಸಾಧನಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get adminThisDevice => 'ಈ ಸಾಧನ';

  @override
  String get adminEditName => 'ಹೆಸರು ಸಂಪಾದಿಸಿ';

  @override
  String get adminLibrariesLoadFailed => 'ಲೈಬ್ರರಿಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoLibraries => 'ಯಾವುದೇ ಗ್ರಂಥಾಲಯಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminScanAllLibraries => 'ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get adminAddLibrary => 'ಲೈಬ್ರರಿ ಸೇರಿಸಿ';

  @override
  String adminScanFailed(String error) {
    return 'ಸ್ಕ್ಯಾನ್ ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRenameLibrary => 'ಲೈಬ್ರರಿಯನ್ನು ಮರುಹೆಸರಿಸಿ';

  @override
  String get adminNewName => 'ಹೊಸ ಹೆಸರು';

  @override
  String adminLibraryRenamed(String name) {
    return 'ಲೈಬ್ರರಿಯನ್ನು \"$name\" ಎಂದು ಮರುಹೆಸರಿಸಲಾಗಿದೆ';
  }

  @override
  String adminRenameFailed(String error) {
    return 'ಮರುಹೆಸರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminDeleteLibrary => 'ಲೈಬ್ರರಿ ಅಳಿಸಿ';

  @override
  String adminLibraryDeleted(String name) {
    return '\"$name\" ಲೈಬ್ರರಿಯನ್ನು ಅಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'ಲೈಬ್ರರಿಯನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'ಪಥವನ್ನು ಸೇರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRemovePath => 'ಮಾರ್ಗವನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String adminRemovePathConfirm(String path) {
    return 'ಈ ಲೈಬ್ರರಿಯಿಂದ \"$path\" ಅನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'ಪಥವನ್ನು ತೆಗೆದುಹಾಕಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'ಲೈಬ್ರರಿ ಆಯ್ಕೆಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'ಆಯ್ಕೆಗಳನ್ನು ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'ಲೈಬ್ರರಿಯನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoMediaPaths =>
      'ಯಾವುದೇ ಮಾಧ್ಯಮ ಮಾರ್ಗಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminAddPath => 'ಮಾರ್ಗವನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminBrowseFilesystem => 'ಸರ್ವರ್ ಫೈಲ್ ಸಿಸ್ಟಮ್ ಅನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ:';

  @override
  String get adminSaveOptions => 'ಆಯ್ಕೆಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get adminPreferredMetadataLanguage => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ಭಾಷೆ';

  @override
  String get adminMetadataLanguageHint => 'ಉದಾ. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'ಮೆಟಾಡೇಟಾ ದೇಶದ ಕೋಡ್';

  @override
  String get adminMetadataCountryHint => 'ಉದಾ. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'ಪಥಗಳು';

  @override
  String get adminLibraryTabOptions => 'ಆಯ್ಕೆಗಳು';

  @override
  String get adminLibraryTabDownloaders => 'ಡೌನ್‌ಲೋಡರ್‌ಗಳು';

  @override
  String get adminLibMetadataSavers => 'ಮೆಟಾಡೇಟಾ ಸೇವರ್‌ಗಳು';

  @override
  String get adminLibSubtitleDownloaders => 'ಉಪಶೀರ್ಷಿಕೆ ಡೌನ್‌ಲೋಡರ್‌ಗಳು';

  @override
  String get adminLibLyricDownloaders => 'ಸಾಹಿತ್ಯ ಡೌನ್‌ಲೋಡರ್‌ಗಳು';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'ಮೆಟಾಡೇಟಾ ಡೌನ್‌ಲೋಡರ್‌ಗಳು: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'ಚಿತ್ರ ಫೆಚರ್‌ಗಳು: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'ಈ ಸರ್ವರ್ ಈ ಲೈಬ್ರರಿ ಪ್ರಕಾರಕ್ಕೆ ಯಾವುದೇ ಡೌನ್‌ಲೋಡರ್‌ಗಳನ್ನು ಒದಗಿಸುವುದಿಲ್ಲ.';

  @override
  String get adminLibrarySectionGeneral => 'ಸಾಮಾನ್ಯ';

  @override
  String get adminLibrarySectionMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminLibrarySectionEmbedded => 'ಎಂಬೆಡೆಡ್ ಮಾಹಿತಿ';

  @override
  String get adminLibrarySectionSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get adminLibrarySectionImages => 'ಚಿತ್ರಗಳು';

  @override
  String get adminLibrarySectionSeries => 'ಸರಣಿಗಳು';

  @override
  String get adminLibrarySectionMusic => 'ಸಂಗೀತ';

  @override
  String get adminLibrarySectionMovies => 'ಚಲನಚಿತ್ರಗಳು';

  @override
  String get adminLibRealtimeMonitor =>
      'ನೈಜ-ಸಮಯದ ಮೇಲ್ವಿಚಾರಣೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLibRealtimeMonitorHint =>
      'ಫೈಲ್ ಬದಲಾವಣೆಗಳನ್ನು ಪತ್ತೆ ಮಾಡಿ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಿ.';

  @override
  String get adminLibArchiveMediaFiles =>
      'ಆರ್ಕೈವ್‌ಗಳನ್ನು ಮಾಧ್ಯಮ ಫೈಲ್‌ಗಳಾಗಿ ಪರಿಗಣಿಸಿ';

  @override
  String get adminLibEnablePhotos => 'ಫೋಟೋಗಳನ್ನು ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get adminLibSaveLocalMetadata =>
      'ಕಲಾಕೃತಿಯನ್ನು ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get adminLibRefreshInterval => 'ಸ್ವಯಂಚಾಲಿತ ಮೆಟಾಡೇಟಾ ರಿಫ್ರೆಶ್';

  @override
  String get adminLibRefreshNever => 'ಎಂದಿಗೂ ಇಲ್ಲ';

  @override
  String get adminLibDefault => 'ಡೀಫಾಲ್ಟ್';

  @override
  String get adminLibDisplayTitle => 'ಪ್ರದರ್ಶನ';

  @override
  String get adminLibDisplaySection => 'ಲೈಬ್ರರಿ ಪ್ರದರ್ಶನ';

  @override
  String get adminLibFolderView =>
      'ಸರಳ ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳನ್ನು ತೋರಿಸಲು ಫೋಲ್ಡರ್ ವೀಕ್ಷಣೆಯನ್ನು ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get adminLibSpecialsInSeasons =>
      'ವಿಶೇಷ ಸಂಚಿಕೆಗಳನ್ನು ಅವು ಪ್ರಸಾರವಾದ ಸೀಸನ್‌ಗಳಲ್ಲಿ ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get adminLibGroupMovies => 'ಚಲನಚಿತ್ರಗಳನ್ನು ಸಂಗ್ರಹಣೆಗಳಾಗಿ ಗುಂಪು ಮಾಡಿ';

  @override
  String get adminLibGroupShows => 'ಶೋಗಳನ್ನು ಸಂಗ್ರಹಣೆಗಳಾಗಿ ಗುಂಪು ಮಾಡಿ';

  @override
  String get adminLibExternalSuggestions => 'ಸಲಹೆಗಳಲ್ಲಿ ಬಾಹ್ಯ ವಿಷಯವನ್ನು ತೋರಿಸಿ';

  @override
  String get adminLibDateAddedSection => 'ಸೇರಿಸಿದ ದಿನಾಂಕದ ವರ್ತನೆ';

  @override
  String get adminLibDateAddedLabel => 'ಸೇರಿಸಿದ ದಿನಾಂಕವನ್ನು ಇಲ್ಲಿಂದ ಬಳಸಿ';

  @override
  String get adminLibDateAddedImport => 'ಲೈಬ್ರರಿಗೆ ಸ್ಕ್ಯಾನ್ ಮಾಡಿದ ದಿನಾಂಕ';

  @override
  String get adminLibDateAddedFile => 'ಫೈಲ್ ರಚಿಸಲಾದ ದಿನಾಂಕ';

  @override
  String get adminLibMetadataTitle => 'ಮೆಟಾಡೇಟಾ ಮತ್ತು ಚಿತ್ರಗಳು';

  @override
  String get adminLibMetadataLangSection => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ಭಾಷೆ';

  @override
  String get adminLibChaptersSection => 'ಅಧ್ಯಾಯಗಳು';

  @override
  String get adminLibDummyChapterDuration => 'ಡಮ್ಮಿ ಅಧ್ಯಾಯದ ಅವಧಿ (ಸೆಕೆಂಡುಗಳು)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'ಅಧ್ಯಾಯಗಳಿಲ್ಲದ ಮಾಧ್ಯಮಕ್ಕಾಗಿ ರಚಿಸಲಾದ ಅಧ್ಯಾಯಗಳ ಉದ್ದ. ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲು 0 ಗೆ ಹೊಂದಿಸಿ.';

  @override
  String get adminLibChapterImageResolution => 'ಅಧ್ಯಾಯ ಚಿತ್ರದ ರೆಸಲ್ಯೂಶನ್';

  @override
  String get adminLibNfoTitle => 'NFO ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminLibNfoHelp =>
      'NFO ಮೆಟಾಡೇಟಾ Kodi ಮತ್ತು ಅಂತಹುದೇ ಕ್ಲೈಂಟ್‌ಗಳೊಂದಿಗೆ ಹೊಂದಿಕೊಳ್ಳುತ್ತದೆ. ಈ ಸೆಟ್ಟಿಂಗ್‌ಗಳು NFO ಮೆಟಾಡೇಟಾವನ್ನು ಉಳಿಸುವ ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳಿಗೆ ಅನ್ವಯಿಸುತ್ತವೆ.';

  @override
  String get adminLibKodiUser =>
      'NFO ಫೈಲ್‌ಗಳಲ್ಲಿ ವೀಕ್ಷಣಾ ಡೇಟಾವನ್ನು ಸಂಗ್ರಹಿಸಬೇಕಾದ ಬಳಕೆದಾರ';

  @override
  String get adminLibSaveImagePaths => 'NFO ಫೈಲ್‌ಗಳಲ್ಲಿ ಚಿತ್ರ ಪಥಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get adminLibPathSubstitution =>
      'NFO ಚಿತ್ರ ಪಥಗಳಿಗೆ ಪಥ ಬದಲಿಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart ಚಿತ್ರಗಳನ್ನು extrathumbs ಫೋಲ್ಡರ್‌ಗೆ ನಕಲಿಸಿ';

  @override
  String get adminLibNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String adminLibRefreshDays(int days) {
    return '$days ದಿನಗಳು';
  }

  @override
  String get adminLibEmbeddedTitles => 'ಎಂಬೆಡೆಡ್ ಶೀರ್ಷಿಕೆಗಳನ್ನು ಬಳಸಿ';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'ಹೆಚ್ಚುವರಿಗಳಿಗೆ ಎಂಬೆಡೆಡ್ ಶೀರ್ಷಿಕೆಗಳನ್ನು ಬಳಸಿ';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'ಎಂಬೆಡೆಡ್ ಸಂಚಿಕೆ ಮಾಹಿತಿಯನ್ನು ಬಳಸಿ';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'ಎಂಬೆಡೆಡ್ ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminLibEmbeddedAllowAll => 'ಎಲ್ಲವನ್ನೂ ಅನುಮತಿಸಿ';

  @override
  String get adminLibEmbeddedAllowText => 'ಪಠ್ಯ ಮಾತ್ರ';

  @override
  String get adminLibEmbeddedAllowImage => 'ಚಿತ್ರ ಮಾತ್ರ';

  @override
  String get adminLibEmbeddedAllowNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'ಎಂಬೆಡೆಡ್ ಉಪಶೀರ್ಷಿಕೆಗಳಿದ್ದರೆ ಡೌನ್‌ಲೋಡ್ ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get adminLibSkipIfAudioMatches =>
      'ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್ ಡೌನ್‌ಲೋಡ್ ಭಾಷೆಗೆ ಹೊಂದಿಕೆಯಾದರೆ ಡೌನ್‌ಲೋಡ್ ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get adminLibRequirePerfectMatch =>
      'ನಿಖರವಾದ ಉಪಶೀರ್ಷಿಕೆ ಹೊಂದಾಣಿಕೆ ಅಗತ್ಯವಿದೆ';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'ಉಪಶೀರ್ಷಿಕೆಗಳನ್ನು ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get adminLibChapterImageExtraction => 'ಅಧ್ಯಾಯ ಚಿತ್ರಗಳನ್ನು ಹೊರತೆಗೆಯಿರಿ';

  @override
  String get adminLibChapterImagesDuringScan =>
      'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಸಮಯದಲ್ಲಿ ಅಧ್ಯಾಯ ಚಿತ್ರಗಳನ್ನು ಹೊರತೆಗೆಯಿರಿ';

  @override
  String get adminLibTrickplayExtraction =>
      'trickplay ಚಿತ್ರ ಹೊರತೆಗೆಯುವಿಕೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLibTrickplayDuringScan =>
      'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಸಮಯದಲ್ಲಿ trickplay ಚಿತ್ರಗಳನ್ನು ಹೊರತೆಗೆಯಿರಿ';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'trickplay ಚಿತ್ರಗಳನ್ನು ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'ಬಹು ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಹರಡಿರುವ ಸರಣಿಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ವಿಲೀನಗೊಳಿಸಿ';

  @override
  String get adminLibSeasonZeroName => 'ಸೀಸನ್ ಶೂನ್ಯದ ಪ್ರದರ್ಶನ ಹೆಸರು';

  @override
  String get adminLibLufsScan =>
      'ಆಡಿಯೋ ನಾರ್ಮಲೈಸೇಶನ್‌ಗಾಗಿ LUFS ಸ್ಕ್ಯಾನ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLibPreferNonstandardArtist =>
      'ಪ್ರಮಾಣಿತವಲ್ಲದ ಕಲಾವಿದರ ಟ್ಯಾಗ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get adminLibAutoAddToCollection =>
      'ಚಲನಚಿತ್ರಗಳನ್ನು ಸಂಗ್ರಹಣೆಗಳಿಗೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸೇರಿಸಿ';

  @override
  String get adminLibraryNameRequired => 'ಗ್ರಂಥಾಲಯದ ಹೆಸರು ಅಗತ್ಯವಿದೆ';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'ಲೈಬ್ರರಿ ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminLibraryName => 'ಗ್ರಂಥಾಲಯದ ಹೆಸರು';

  @override
  String get adminSelectedPaths => 'ಆಯ್ದ ಮಾರ್ಗಗಳು:';

  @override
  String get adminNoPathsAdded =>
      'ಯಾವುದೇ ಮಾರ್ಗಗಳನ್ನು ಸೇರಿಸಲಾಗಿಲ್ಲ (ನಂತರ ಸೇರಿಸಬಹುದು)';

  @override
  String get adminCreateLibrary => 'ಲೈಬ್ರರಿ ರಚಿಸಿ';

  @override
  String get paths => 'ಮಾರ್ಗಗಳು:';

  @override
  String get adminDisableUser => 'ಬಳಕೆದಾರರನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminEnableUser => 'ಬಳಕೆದಾರರನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name ಅವರನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುವುದೇ? ಅವರಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುವುದಿಲ್ಲ.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name ಅವರನ್ನು ಸಕ್ರಿಯಗೊಳಿಸುವುದೇ? ಅವರು ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಬಹುದು.';
  }

  @override
  String adminUserDisabled(String name) {
    return '\"$name\" ಬಳಕೆದಾರರನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminUserEnabled(String name) {
    return '\"$name\" ಬಳಕೆದಾರರನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'ಬಳಕೆದಾರ ನೀತಿಯನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminUsersLoadFailed => 'ಬಳಕೆದಾರರನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminSearchUsers => 'ಬಳಕೆದಾರರನ್ನು ಹುಡುಕಿ';

  @override
  String get adminEditUser => 'ಬಳಕೆದಾರರನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get adminAddUser => 'ಬಳಕೆದಾರರನ್ನು ಸೇರಿಸಿ';

  @override
  String adminUserCreateFailed(String error) {
    return 'ಬಳಕೆದಾರರನ್ನು ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminCreateUser => 'ಬಳಕೆದಾರರನ್ನು ರಚಿಸಿ';

  @override
  String get adminPasswordOptional => 'ಪಾಸ್ವರ್ಡ್ (ಐಚ್ಛಿಕ)';

  @override
  String get adminUsernameRequired => 'ಬಳಕೆದಾರ ಹೆಸರು ಖಾಲಿ ಇರುವಂತಿಲ್ಲ';

  @override
  String get adminNoProfileChanges => 'ಉಳಿಸಲು ಯಾವುದೇ ಪ್ರೊಫೈಲ್ ಬದಲಾವಣೆಗಳಿಲ್ಲ';

  @override
  String get adminProfileSaved => 'ಪ್ರೊಫೈಲ್ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String adminSaveFailed(String error) {
    return 'ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminPermissionsSaved => 'ಅನುಮತಿಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminPasswordsMismatch => 'ಪಾಸ್‌ವರ್ಡ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ';

  @override
  String adminFailed(String error) {
    return 'ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminUserLoadFailed => 'ಬಳಕೆದಾರರನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminBackToUsers => 'ಬಳಕೆದಾರರಿಗೆ ಹಿಂತಿರುಗಿ';

  @override
  String get adminSaveProfile => 'ಪ್ರೊಫೈಲ್ ಉಳಿಸಿ';

  @override
  String get adminDeleteUser => 'ಬಳಕೆದಾರರನ್ನು ಅಳಿಸಿ';

  @override
  String get admin => 'ನಿರ್ವಾಹಕ';

  @override
  String get adminFullAccessWarning =>
      'ನಿರ್ವಾಹಕರು ಸರ್ವರ್‌ಗೆ ಸಂಪೂರ್ಣ ಪ್ರವೇಶವನ್ನು ಹೊಂದಿರುತ್ತಾರೆ. ಎಚ್ಚರಿಕೆಯಿಂದ ಅನುದಾನ ನೀಡಿ.';

  @override
  String get administrator => 'ನಿರ್ವಾಹಕ';

  @override
  String get adminHiddenUser => 'ಗುಪ್ತ ಬಳಕೆದಾರ';

  @override
  String get adminAllowMediaPlayback => 'ಮಾಧ್ಯಮ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowAudioTranscoding =>
      'ಆಡಿಯೋ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowVideoTranscoding =>
      'ವೀಡಿಯೊ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowRemuxing => 'ರೀಮಕ್ಸಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminForceRemoteTranscoding =>
      'ರಿಮೋಟ್ ಸೋರ್ಸ್ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಒತ್ತಾಯಿಸಿ';

  @override
  String get adminAllowContentDeletion => 'ವಿಷಯವನ್ನು ಅಳಿಸಲು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowContentDownloading =>
      'ವಿಷಯವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowPublicSharing => 'ಸಾರ್ವಜನಿಕ ಹಂಚಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowRemoteControl =>
      'ಇತರ ಬಳಕೆದಾರರ ರಿಮೋಟ್ ಕಂಟ್ರೋಲ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowSharedDeviceControl =>
      'ಹಂಚಿದ ಸಾಧನ ನಿಯಂತ್ರಣವನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowRemoteAccess => 'ರಿಮೋಟ್ ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminRemoteBitrateLimit => 'ರಿಮೋಟ್ ಕ್ಲೈಂಟ್ ಬಿಟ್ರೇಟ್ ಮಿತಿ (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'ಯಾವುದೇ ಮಿತಿಯಿಲ್ಲದೆ ಖಾಲಿ ಬಿಡಿ';

  @override
  String get adminMaxActiveSessions => 'ಗರಿಷ್ಠ ಸಕ್ರಿಯ ಅವಧಿಗಳು';

  @override
  String get adminAllowLiveTvAccess => 'ಲೈವ್ ಟಿವಿ ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowLiveTvManagement => 'ಲೈವ್ ಟಿವಿ ನಿರ್ವಹಣೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowCollectionManagement => 'ಸಂಗ್ರಹ ನಿರ್ವಹಣೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowSubtitleManagement =>
      'ಉಪಶೀರ್ಷಿಕೆ ನಿರ್ವಹಣೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminAllowLyricManagement => 'ಸಾಹಿತ್ಯ ನಿರ್ವಹಣೆಗೆ ಅವಕಾಶ ನೀಡಿ';

  @override
  String get adminSavePermissions => 'ಅನುಮತಿಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get adminEnableAllLibraryAccess =>
      'ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminSaveAccess => 'ಪ್ರವೇಶವನ್ನು ಉಳಿಸಿ';

  @override
  String get adminChangePassword => 'ಪಾಸ್ವರ್ಡ್ ಬದಲಾಯಿಸಿ';

  @override
  String get adminNewPassword => 'ಹೊಸ ಪಾಸ್ವರ್ಡ್';

  @override
  String get adminConfirmPassword => 'ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get adminSetPassword => 'ಪಾಸ್ವರ್ಡ್ ಹೊಂದಿಸಿ';

  @override
  String get adminResetPassword => 'ಪಾಸ್ವರ್ಡ್ ಮರುಹೊಂದಿಸಿ';

  @override
  String get adminPasswordReset => 'ಪಾಸ್ವರ್ಡ್ ಮರುಹೊಂದಿಸಿ';

  @override
  String get adminPasswordUpdated => 'ಪಾಸ್ವರ್ಡ್ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get adminUserSettings => 'ಬಳಕೆದಾರರ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminLibraryAccess => 'ಗ್ರಂಥಾಲಯ ಪ್ರವೇಶ';

  @override
  String get adminDeviceAndChannelAccess => 'ಸಾಧನ ಮತ್ತು ಚಾನಲ್ ಪ್ರವೇಶ';

  @override
  String get adminEnableAllDevices =>
      'ಎಲ್ಲಾ ಸಾಧನಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminEnableAllChannels =>
      'ಎಲ್ಲಾ ಚಾನಲ್‌ಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminParentalControl => 'ಪೋಷಕರ ನಿಯಂತ್ರಣ';

  @override
  String get adminMaxParentalRating => 'ಗರಿಷ್ಠ ಅನುಮತಿಸಲಾದ ಪೋಷಕರ ರೇಟಿಂಗ್';

  @override
  String get adminMaxParentalRatingHint =>
      'ಹೆಚ್ಚಿನ ರೇಟಿಂಗ್ ಇರುವ ವಿಷಯವನ್ನು ಈ ಬಳಕೆದಾರರಿಂದ ಮರೆಮಾಡಲಾಗುತ್ತದೆ.';

  @override
  String get adminParentalRatingNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get adminBlockUnratedItems =>
      'ರೇಟಿಂಗ್ ಮಾಹಿತಿ ಇಲ್ಲದ ಅಥವಾ ಗುರುತಿಸಲಾಗದ ಐಟಂಗಳನ್ನು ನಿರ್ಬಂಧಿಸಿ';

  @override
  String get adminUnratedBook => 'ಪುಸ್ತಕಗಳು';

  @override
  String get adminUnratedChannelContent => 'ಚಾನೆಲ್‌ಗಳು';

  @override
  String get adminUnratedLiveTvChannel => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get adminUnratedMovie => 'ಚಲನಚಿತ್ರಗಳು';

  @override
  String get adminUnratedMusic => 'ಸಂಗೀತ';

  @override
  String get adminUnratedTrailer => 'ಟ್ರೇಲರ್‌ಗಳು';

  @override
  String get adminUnratedSeries => 'ಶೋಗಳು';

  @override
  String get adminAccessSchedules => 'ಪ್ರವೇಶ ವೇಳಾಪಟ್ಟಿಗಳು';

  @override
  String get adminAccessSchedulesHint =>
      'ಕೆಳಗಿನ ನಿಗದಿತ ಸಮಯದಲ್ಲಿ ಮಾತ್ರ ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಿ. ಯಾವುದೇ ವೇಳಾಪಟ್ಟಿ ಹೊಂದಿಸದಿದ್ದಾಗ ಇಡೀ ದಿನ ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get adminAddSchedule => 'ವೇಳಾಪಟ್ಟಿ ಸೇರಿಸಿ';

  @override
  String get adminScheduleDay => 'ದಿನ';

  @override
  String get adminScheduleStart => 'ಪ್ರಾರಂಭ';

  @override
  String get adminScheduleEnd => 'ಅಂತ್ಯ';

  @override
  String get adminDayEveryday => 'ಪ್ರತಿದಿನ';

  @override
  String get adminDayWeekday => 'ವಾರದ ದಿನ';

  @override
  String get adminDayWeekend => 'ವಾರಾಂತ್ಯ';

  @override
  String get adminDaySunday => 'ಭಾನುವಾರ';

  @override
  String get adminDayMonday => 'ಸೋಮವಾರ';

  @override
  String get adminDayTuesday => 'ಮಂಗಳವಾರ';

  @override
  String get adminDayWednesday => 'ಬುಧವಾರ';

  @override
  String get adminDayThursday => 'ಗುರುವಾರ';

  @override
  String get adminDayFriday => 'ಶುಕ್ರವಾರ';

  @override
  String get adminDaySaturday => 'ಶನಿವಾರ';

  @override
  String get adminAllowedTags => 'ಅನುಮತಿಸಲಾದ ಟ್ಯಾಗ್‌ಗಳು';

  @override
  String get adminAllowedTagsHint =>
      'ಈ ಟ್ಯಾಗ್‌ಗಳಿರುವ ವಿಷಯವನ್ನು ಮಾತ್ರ ತೋರಿಸಲಾಗುತ್ತದೆ. ಎಲ್ಲವನ್ನೂ ಅನುಮತಿಸಲು ಖಾಲಿ ಬಿಡಿ.';

  @override
  String get adminBlockedTags => 'ನಿರ್ಬಂಧಿಸಿದ ಟ್ಯಾಗ್‌ಗಳು';

  @override
  String get adminBlockedTagsHint =>
      'ಈ ಟ್ಯಾಗ್‌ಗಳಿರುವ ವಿಷಯವನ್ನು ಈ ಬಳಕೆದಾರರಿಂದ ಮರೆಮಾಡಲಾಗುತ್ತದೆ.';

  @override
  String get adminAddTag => 'ಟ್ಯಾಗ್ ಸೇರಿಸಿ';

  @override
  String get adminEnabledDevices => 'ಸಕ್ರಿಯಗೊಳಿಸಿದ ಸಾಧನಗಳು';

  @override
  String get adminEnabledChannels => 'ಸಕ್ರಿಯಗೊಳಿಸಿದ ಚಾನೆಲ್‌ಗಳು';

  @override
  String get adminAuthProvider => 'ದೃಢೀಕರಣ ಪೂರೈಕೆದಾರ';

  @override
  String get adminPasswordResetProvider => 'ಪಾಸ್‌ವರ್ಡ್ ಮರುಹೊಂದಿಸುವ ಪೂರೈಕೆದಾರ';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'ಲಾಕ್‌ಔಟ್‌ಗೂ ಮೊದಲು ಗರಿಷ್ಠ ವಿಫಲ ಲಾಗಿನ್ ಪ್ರಯತ್ನಗಳು';

  @override
  String get adminLoginAttemptsHint =>
      'ಡೀಫಾಲ್ಟ್‌ಗಾಗಿ 0 ಗೆ ಹೊಂದಿಸಿ, ಅಥವಾ ಲಾಕ್‌ಔಟ್ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲು -1 ಗೆ ಹೊಂದಿಸಿ.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay ಪ್ರವೇಶ';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'ಗುಂಪುಗಳನ್ನು ರಚಿಸಲು ಮತ್ತು ಸೇರಲು ಅನುಮತಿಸಿ';

  @override
  String get adminSyncPlayJoin => 'ಗುಂಪುಗಳಿಗೆ ಸೇರಲು ಅನುಮತಿಸಿ';

  @override
  String get adminSyncPlayNone => 'ಪ್ರವೇಶವಿಲ್ಲ';

  @override
  String get adminContentDeletionFolders =>
      'ಇಲ್ಲಿಂದ ವಿಷಯ ಅಳಿಸುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminResetPasswordWarning =>
      'ಇದು ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ. ಬಳಕೆದಾರರು ಪಾಸ್‌ವರ್ಡ್ ಇಲ್ಲದೆ ಲಾಗ್ ಇನ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗುತ್ತದೆ.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'ಸರ್ವರ್ HTTP $status ಅನ್ನು ಹಿಂತಿರುಗಿಸಿದೆ';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name ಅವರನ್ನು ಅಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String adminUserDeleted(String name) {
    return '\"$name\" ಬಳಕೆದಾರರನ್ನು ಅಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'ಬಳಕೆದಾರರನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminCreateApiKey => 'API ಕೀಯನ್ನು ರಚಿಸಿ';

  @override
  String get adminAppName => 'ಅಪ್ಲಿಕೇಶನ್ ಹೆಸರು';

  @override
  String get adminApiKeyCreated => 'API ಕೀಯನ್ನು ರಚಿಸಲಾಗಿದೆ';

  @override
  String get adminApiKeyCreatedNoToken =>
      'ಕೀಲಿಯನ್ನು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ. ಸರ್ವರ್ ಟೋಕನ್ ಹಿಂತಿರುಗಿಸಲಿಲ್ಲ. ಸರ್ವರ್ API ಕೀಗಳನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String get adminKeyCopied => 'ಕೀಲಿಯನ್ನು ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ಗೆ ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'ಕೀ ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'ಸರ್ವರ್ ಪ್ರತಿಕ್ರಿಯೆಯಿಂದ ಕೀ ಟೋಕನ್ ಕಾಣೆಯಾಗಿದೆ';

  @override
  String get adminRevokeApiKey => 'API ಕೀ ಹಿಂತೆಗೆದುಕೊಳ್ಳಿ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name ಗಾಗಿ ಕೀಯನ್ನು ರದ್ದುಗೊಳಿಸುವುದೇ?';
  }

  @override
  String get adminApiKeyRevoked => 'API ಕೀ ಹಿಂತೆಗೆದುಕೊಳ್ಳಲಾಗಿದೆ';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'ಕೀಯನ್ನು ರದ್ದುಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API ಕೀಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminApiKeysTitle => 'API ಕೀಗಳು';

  @override
  String get adminCreateKey => 'ಕೀಲಿಯನ್ನು ರಚಿಸಿ';

  @override
  String get adminNoApiKeys => 'ಯಾವುದೇ API ಕೀಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminUnknownApp => 'ಅಜ್ಞಾತ ಅಪ್ಲಿಕೇಶನ್';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'ಟೋಕನ್: $token\\nರಚಿಸಲಾಗಿದೆ: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'ಬ್ಯಾಕಪ್ ರಚಿಸಿ';

  @override
  String get adminBackupInclude =>
      'ಬ್ಯಾಕಪ್‌ನಲ್ಲಿ ಏನನ್ನು ಸೇರಿಸಬೇಕು ಎಂಬುದನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get adminBackupDatabase => 'ಡೇಟಾಬೇಸ್';

  @override
  String get adminBackupDatabaseAlways => 'ಯಾವಾಗಲೂ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get adminBackupMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminBackupSubtitles => 'ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get adminBackupTrickplay => 'Trickplay ಚಿತ್ರಗಳು';

  @override
  String get adminCreatingBackup => 'ಬ್ಯಾಕಪ್ ರಚಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get adminBackupCreated => 'ಬ್ಯಾಕಪ್ ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ';

  @override
  String adminBackupCreateFailed(String error) {
    return 'ಬ್ಯಾಕಪ್ ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'ಸರ್ವರ್ ಪ್ರತಿಕ್ರಿಯೆಯಲ್ಲಿ ಬ್ಯಾಕಪ್ ಮಾರ್ಗ ಕಾಣೆಯಾಗಿದೆ';

  @override
  String adminBackupManifest(String name) {
    return 'ಮ್ಯಾನಿಫೆಸ್ಟ್: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'ಮ್ಯಾನಿಫೆಸ್ಟ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminConfirmRestore => 'ಮರುಸ್ಥಾಪನೆಯನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get adminRestoringBackup => 'ಬ್ಯಾಕಪ್ ಅನ್ನು ಮರುಸ್ಥಾಪಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String adminRestoreFailed(String error) {
    return 'ಬ್ಯಾಕಪ್ ಮರುಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'ಬ್ಯಾಕಪ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminCreateBackup => 'ಬ್ಯಾಕಪ್ ರಚಿಸಿ';

  @override
  String get adminNoBackups => 'ಯಾವುದೇ ಬ್ಯಾಕ್‌ಅಪ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminViewDetails => 'ವಿವರಗಳನ್ನು ವೀಕ್ಷಿಸಿ';

  @override
  String get restore => 'ಮರುಸ್ಥಾಪಿಸಿ';

  @override
  String get adminLogsLoadFailed => 'ಸರ್ವರ್ ಲಾಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoLogFiles => 'ಯಾವುದೇ ಲಾಗ್ ಫೈಲ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminLogCopied => 'ಲಾಗ್ ಅನ್ನು ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ಗೆ ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String get adminSaveLogFile => 'ಲಾಗ್ ಫೈಲ್ ಅನ್ನು ಉಳಿಸಿ';

  @override
  String adminSavedTo(String path) {
    return '$path ಗೆ ಉಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ಫೈಲ್ ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';
  }

  @override
  String get adminSearchInLog => 'ಲಾಗ್‌ನಲ್ಲಿ ಹುಡುಕಿ';

  @override
  String get adminNoMatchingLines => 'ಹೊಂದಾಣಿಕೆಯ ಸಾಲುಗಳಿಲ್ಲ';

  @override
  String adminTasksLoadFailed(String error) {
    return 'ಕಾರ್ಯಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminNoScheduledTasks => 'ಯಾವುದೇ ನಿಗದಿತ ಕಾರ್ಯಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminNoTasksMatchFilter =>
      'ಪ್ರಸ್ತುತ ಫಿಲ್ಟರ್‌ಗೆ ಯಾವುದೇ ಕಾರ್ಯಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String adminTaskStartFailed(String error) {
    return 'ಕಾರ್ಯವನ್ನು ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'ಕಾರ್ಯವನ್ನು ನಿಲ್ಲಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'ಕಾರ್ಯವನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRunNow => 'ಈಗ ರನ್ ಮಾಡಿ';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ಟ್ರಿಗರ್ ತೆಗೆದುಹಾಕಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ಟ್ರಿಗರ್ ಸೇರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminLastExecution => 'ಕೊನೆಯ ಮರಣದಂಡನೆ';

  @override
  String get adminTriggers => 'ಪ್ರಚೋದಿಸುತ್ತದೆ';

  @override
  String get adminAddTrigger => 'ಪ್ರಚೋದಕವನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminNoTriggers => 'ಯಾವುದೇ ಟ್ರಿಗ್ಗರ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminTriggerType => 'ಪ್ರಚೋದಕ ಪ್ರಕಾರ';

  @override
  String get adminTimeLimit => 'ಸಮಯದ ಮಿತಿ (ಐಚ್ಛಿಕ)';

  @override
  String get adminNoLimit => 'ಮಿತಿ ಇಲ್ಲ';

  @override
  String adminHours(String hours) {
    return '$hours ಗಂಟೆ(ಗಳು)';
  }

  @override
  String get adminDayOfWeek => 'ವಾರದ ದಿನ';

  @override
  String get adminSearchPlugins => 'ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'ಪ್ಲಗಿನ್ ಟಾಗಲ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminUninstallPlugin => 'ಅಸ್ಥಾಪಿಸು ಪ್ಲಗಿನ್';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '\"$name\" ಅನ್ನು ಅಸ್ಥಾಪಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'ಪ್ಲಗಿನ್ ಅಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'ಪ್ಯಾಕೇಜ್ ಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'ನವೀಕರಣವನ್ನು ಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminNoPluginsInstalled => 'ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಸ್ಥಾಪಿಸಲಾಗಿಲ್ಲ';

  @override
  String adminInstallUpdate(String version) {
    return 'ನವೀಕರಣವನ್ನು ಸ್ಥಾಪಿಸಿ (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'ಕ್ಯಾಟಲಾಗ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminNoPackagesAvailable => 'ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get adminExperimentalIntegration => 'ಪ್ರಾಯೋಗಿಕ ಏಕೀಕರಣ';

  @override
  String get adminExperimentalWarning =>
      'ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಏಕೀಕರಣವು ಇನ್ನೂ ಪ್ರಾಯೋಗಿಕವಾಗಿದೆ. ಕೆಲವು ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಪುಟಗಳು ಸರಿಯಾಗಿ ರೆಂಡರ್ ಆಗದೇ ಇರಬಹುದು.';

  @override
  String get continueAction => 'ಮುಂದುವರಿಸಿ';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ನಂತರ \"$name\" ಅನ್ನು ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'ಅಸ್ಥಾಪಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" ಅನ್ನು v$version ಗೆ ನವೀಕರಿಸಲಾಗುತ್ತಿದೆ...';
  }

  @override
  String get adminMissingAuthToken =>
      'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಲು ಸಾಧ್ಯವಿಲ್ಲ: ದೃಢೀಕರಣ ಟೋಕನ್ ಕಾಣೆಯಾಗಿದೆ.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'ಪ್ಲಗಿನ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminPluginNotFound => 'ಪ್ಲಗಿನ್ ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String adminPluginVersion(String version) {
    return 'ಆವೃತ್ತಿ $version';
  }

  @override
  String get adminEnablePlugin => 'ಪ್ಲಗಿನ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPluginSettingsPage => 'ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಪುಟ';

  @override
  String get adminRevisionHistory => 'ಪರಿಷ್ಕರಣೆ ಇತಿಹಾಸ';

  @override
  String get adminNoChangelog => 'ಯಾವುದೇ ಚೇಂಜ್ಲಾಗ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminRemoveRepository => 'ರೆಪೊಸಿಟರಿಯನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return '\"$name\" ಅನ್ನು ತೆಗೆದುಹಾಕಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'ರೆಪೊಸಿಟರಿಗಳನ್ನು ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'ರೆಪೊಸಿಟರಿಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRepositoryNameHint => 'ಉದಾ. Jellyfin ಸ್ಥಿರ';

  @override
  String get adminRepositoryUrl => 'ರೆಪೊಸಿಟರಿ URL';

  @override
  String get adminAddEntry => 'ನಮೂದನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminInvalidUrl => 'ಅಮಾನ್ಯ URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri ಅನ್ನು ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';
  }

  @override
  String get adminOpenInBrowser => 'ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯಿರಿ';

  @override
  String get adminOpenExternally => 'ಬಾಹ್ಯವಾಗಿ ತೆರೆಯಿರಿ';

  @override
  String get adminGeneralSettings => 'ಸಾಮಾನ್ಯ ಸೆಟ್ಟಿಂಗ್ಗಳು';

  @override
  String get adminServerName => 'ಸರ್ವರ್ ಹೆಸರು';

  @override
  String get adminPreferredMetadataCountry => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ದೇಶ';

  @override
  String get adminCachePath => 'ಸಂಗ್ರಹ ಮಾರ್ಗ';

  @override
  String get adminMetadataPath => 'ಮೆಟಾಡೇಟಾ ಮಾರ್ಗ';

  @override
  String get adminLibraryScanConcurrency => 'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಏಕಕಾಲಿಕತೆ';

  @override
  String get adminParallelImageEncodingLimit =>
      'ಸಮಾನಾಂತರ ಚಿತ್ರ ಎನ್ಕೋಡಿಂಗ್ ಮಿತಿ';

  @override
  String get adminSlowResponseThreshold => 'ನಿಧಾನ ಪ್ರತಿಕ್ರಿಯೆ ಮಿತಿ (ಮಿಸೆ)';

  @override
  String get adminBrandingSaved => 'ಬ್ರ್ಯಾಂಡಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminBrandingLoadFailed =>
      'ಬ್ರ್ಯಾಂಡಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminLoginDisclaimer => 'ಲಾಗಿನ್ ಹಕ್ಕು ನಿರಾಕರಣೆ';

  @override
  String get adminLoginDisclaimerHint =>
      'ಲಾಗಿನ್ ಫಾರ್ಮ್‌ನ ಕೆಳಗೆ HTML ಅನ್ನು ಪ್ರದರ್ಶಿಸಲಾಗುತ್ತದೆ';

  @override
  String get adminCustomCss => 'ಕಸ್ಟಮ್ CSS';

  @override
  String get adminCustomCssHint => 'ವೆಬ್ ಇಂಟರ್ಫೇಸ್‌ಗೆ ಕಸ್ಟಮ್ CSS ಅನ್ವಯಿಸಲಾಗಿದೆ';

  @override
  String get adminEnableSplashScreen => 'ಸ್ಪ್ಲಾಶ್ ಪರದೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminStreamingSaved => 'ಸ್ಟ್ರೀಮಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminStreamingLoadFailed =>
      'ಸ್ಟ್ರೀಮಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminStreamingDescription =>
      'ರಿಮೋಟ್ ಸಂಪರ್ಕಗಳಿಗಾಗಿ ಜಾಗತಿಕ ಸ್ಟ್ರೀಮಿಂಗ್ ಬಿಟ್ರೇಟ್ ಮಿತಿಗಳನ್ನು ಹೊಂದಿಸಿ.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'ರಿಮೋಟ್ ಕ್ಲೈಂಟ್ ಬಿಟ್ರೇಟ್ ಮಿತಿ (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'ಅನಿಯಮಿತಕ್ಕೆ ಖಾಲಿ ಅಥವಾ 0 ಅನ್ನು ಬಿಡಿ';

  @override
  String get adminPlaybackSaved => 'ಪ್ಲೇಬ್ಯಾಕ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminPlaybackLoadFailed =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminPlaybackTranscoding => 'ಪ್ಲೇಬ್ಯಾಕ್ / ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್';

  @override
  String get adminHardwareAcceleration => 'ಯಂತ್ರಾಂಶ ವೇಗವರ್ಧನೆ';

  @override
  String get adminVaapiDevice => 'VA-API ಸಾಧನ';

  @override
  String get adminEnableHardwareEncoding =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminEnableHardwareDecoding =>
      'ಇದಕ್ಕಾಗಿ ಹಾರ್ಡ್‌ವೇರ್ ಡಿಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ:';

  @override
  String get adminEncodingThreads => 'ಎನ್ಕೋಡಿಂಗ್ ಥ್ರೆಡ್ಗಳು';

  @override
  String get adminAutomatic => '0 = ಸ್ವಯಂಚಾಲಿತ';

  @override
  String get adminTranscodingTempPath => 'ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ತಾಪ ಮಾರ್ಗ';

  @override
  String get adminEnableFallbackFont => 'ಫಾಲ್ಬ್ಯಾಕ್ ಫಾಂಟ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminFallbackFontPath => 'ಫಾಲ್ಬ್ಯಾಕ್ ಫಾಂಟ್ ಮಾರ್ಗ';

  @override
  String get adminAllowSegmentDeletion => 'ವಿಭಾಗ ಅಳಿಸುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminSegmentKeepSeconds => 'ಸೆಗ್ಮೆಂಟ್ ಕೀಪ್ (ಸೆಕೆಂಡ್)';

  @override
  String get adminThrottleBuffering => 'ಥ್ರೊಟಲ್ ಬಫರಿಂಗ್';

  @override
  String get adminTrickplaySaved => 'Trickplay ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminTrickplayLoadFailed =>
      'trickplay ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminEnableHardwareAcceleration =>
      'ಹಾರ್ಡ್‌ವೇರ್ ವೇಗವರ್ಧನೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminEnableKeyFrameExtraction =>
      'ಕೀ ಫ್ರೇಮ್ ಮಾತ್ರ ಹೊರತೆಗೆಯುವಿಕೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminKeyFrameSubtitle => 'ವೇಗವಾಗಿ ಆದರೆ ಕಡಿಮೆ ನಿಖರತೆ';

  @override
  String get adminScanBehavior => 'ನಡವಳಿಕೆಯನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get adminProcessPriority => 'ಪ್ರಕ್ರಿಯೆಯ ಆದ್ಯತೆ';

  @override
  String get adminImageSettings => 'ಚಿತ್ರ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminIntervalMs => 'ಮಧ್ಯಂತರ (ಮಿಸೆ)';

  @override
  String get adminCaptureFrameSubtitle =>
      'ಚೌಕಟ್ಟುಗಳನ್ನು ಸೆರೆಹಿಡಿಯಲು ಎಷ್ಟು ಬಾರಿ';

  @override
  String get adminWidthResolutions => 'ಅಗಲ ನಿರ್ಣಯಗಳು';

  @override
  String get adminTileWidth => 'ಟೈಲ್ ಅಗಲ';

  @override
  String get adminTileHeight => 'ಟೈಲ್ ಎತ್ತರ';

  @override
  String get adminQualitySubtitle =>
      'ಕಡಿಮೆ ಮೌಲ್ಯಗಳು = ಉತ್ತಮ ಗುಣಮಟ್ಟ, ದೊಡ್ಡ ಫೈಲ್‌ಗಳು';

  @override
  String get adminProcessThreads => 'ಪ್ರಕ್ರಿಯೆ ಎಳೆಗಳು';

  @override
  String get adminResumeSaved => 'ರೆಸ್ಯೂಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminResumeLoadFailed =>
      'ರೆಸ್ಯೂಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminResumeDescription =>
      'ವಿಷಯವನ್ನು ಯಾವಾಗ ಭಾಗಶಃ ಪ್ಲೇ ಮಾಡಲಾಗಿದೆ ಅಥವಾ ಸಂಪೂರ್ಣವಾಗಿ ಪ್ಲೇ ಮಾಡಲಾಗಿದೆ ಎಂದು ಗುರುತಿಸಬೇಕು ಎಂದು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ.';

  @override
  String get adminMinResumePercentage => 'ಕನಿಷ್ಠ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminMinResumeSubtitle =>
      'ಪ್ರಗತಿಯನ್ನು ಉಳಿಸಲು ಈ ಶೇಕಡಾವಾರು ಪ್ರಮಾಣವನ್ನು ಮೀರಿ ವಿಷಯವನ್ನು ಪ್ಲೇ ಮಾಡಬೇಕು';

  @override
  String get adminMaxResumePercentage => 'ಗರಿಷ್ಠ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminMaxResumeSubtitle =>
      'ಈ ಶೇಕಡಾವಾರು ನಂತರ ವಿಷಯವನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಪ್ಲೇ ಮಾಡಲಾಗಿದೆ ಎಂದು ಪರಿಗಣಿಸಲಾಗುತ್ತದೆ';

  @override
  String get adminMinResumeDuration => 'ಕನಿಷ್ಠ ಪುನರಾರಂಭದ ಅವಧಿ (ಸೆಕೆಂಡ್‌ಗಳು)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'ಇದಕ್ಕಿಂತ ಚಿಕ್ಕದಾದ ಐಟಂಗಳನ್ನು ಪುನರಾರಂಭಿಸಲಾಗುವುದಿಲ್ಲ';

  @override
  String get adminMinAudiobookResume => 'ಕನಿಷ್ಠ ಆಡಿಯೊಬುಕ್ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminMaxAudiobookResume => 'ಗರಿಷ್ಠ ಆಡಿಯೊಬುಕ್ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminNetworkingSaved =>
      'ನೆಟ್‌ವರ್ಕಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ. ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ಅಗತ್ಯವಿರಬಹುದು.';

  @override
  String get adminNetworkingLoadFailed =>
      'ನೆಟ್‌ವರ್ಕಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNetworkingWarning =>
      'ನೆಟ್‌ವರ್ಕಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಗೆ ಬದಲಾವಣೆಗಳಿಗೆ ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ಅಗತ್ಯವಿರಬಹುದು.';

  @override
  String get adminEnableRemoteAccess => 'ರಿಮೋಟ್ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get ports => 'ಬಂದರುಗಳು';

  @override
  String get adminHttpPort => 'HTTP ಪೋರ್ಟ್';

  @override
  String get adminHttpsPort => 'HTTPS ಪೋರ್ಟ್';

  @override
  String get adminPublicHttpsPort => 'ಸಾರ್ವಜನಿಕ HTTPS ಪೋರ್ಟ್';

  @override
  String get adminBaseUrl => 'ಮೂಲ URL';

  @override
  String get adminBaseUrlHint => 'ಉದಾ. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminLocalNetwork => 'ಸ್ಥಳೀಯ ನೆಟ್ವರ್ಕ್';

  @override
  String get adminLocalNetworkAddresses => 'ಸ್ಥಳೀಯ ನೆಟ್ವರ್ಕ್ ವಿಳಾಸಗಳು';

  @override
  String get adminKnownProxies => 'ತಿಳಿದಿರುವ ಪ್ರಾಕ್ಸಿಗಳು';

  @override
  String get adminRemoteIpFilter => 'ರಿಮೋಟ್ ಐಪಿ ಫಿಲ್ಟರ್';

  @override
  String get adminRemoteIpFilterEntries => 'ರಿಮೋಟ್ ಐಪಿ ಫಿಲ್ಟರ್';

  @override
  String get adminCertificatePath => 'ಪ್ರಮಾಣಪತ್ರ ಮಾರ್ಗ';

  @override
  String get whitelist => 'ಶ್ವೇತಪಟ್ಟಿ';

  @override
  String get blacklist => 'ಕಪ್ಪುಪಟ್ಟಿ';

  @override
  String get notSet => 'ಹೊಂದಿಸಿಲ್ಲ';

  @override
  String get adminMetadataSaved => 'ಮೆಟಾಡೇಟಾವನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'ಮೆಟಾಡೇಟಾ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'ಮೆಟಾಡೇಟಾ ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRefreshMetadata => 'ಮೆಟಾಡೇಟಾವನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get recursive => 'ಪುನರಾವರ್ತಿತ';

  @override
  String get adminReplaceAllMetadata => 'ಎಲ್ಲಾ ಮೆಟಾಡೇಟಾವನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get adminReplaceAllImages => 'ಎಲ್ಲಾ ಚಿತ್ರಗಳನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get adminMetadataRefreshRequested =>
      'ಮೆಟಾಡೇಟಾ ರಿಫ್ರೆಶ್ ಮಾಡಲು ವಿನಂತಿಸಲಾಗಿದೆ';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'ಮೆಟಾಡೇಟಾ ರಿಫ್ರೆಶ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminNoRemoteMatches => 'ಯಾವುದೇ ರಿಮೋಟ್ ಹೊಂದಾಣಿಕೆಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminRemoteResults => 'ರಿಮೋಟ್ ಫಲಿತಾಂಶಗಳು';

  @override
  String get adminRemoteMetadataApplied => 'ರಿಮೋಟ್ ಮೆಟಾಡೇಟಾ ಅನ್ವಯಿಸಲಾಗಿದೆ';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'ರಿಮೋಟ್ ಹುಡುಕಾಟ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminUpdateContentType => 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಿ';

  @override
  String get adminContentType => 'ವಿಷಯ ಪ್ರಕಾರ';

  @override
  String get adminContentTypeUpdated => 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'ಮೆಟಾಡೇಟಾ ಸಂಪಾದಕವನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminNoPeopleEntries => 'ಯಾವುದೇ ಜನರ ನಮೂದುಗಳಿಲ್ಲ';

  @override
  String get adminNoExternalIds => 'ಯಾವುದೇ ಬಾಹ್ಯ ID ಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'ಬೆಂಬಲವಿಲ್ಲದ ಚಿತ್ರ ಸ್ವರೂಪ';

  @override
  String get adminImageReadFailed => 'ಆಯ್ಕೆಮಾಡಿದ ಚಿತ್ರವನ್ನು ಓದಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಳಿಸಿ';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminAllProviders => 'ಎಲ್ಲಾ ಪೂರೈಕೆದಾರರು';

  @override
  String get adminNoRemoteImages => 'ಯಾವುದೇ ದೂರಸ್ಥ ಚಿತ್ರಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'ಟ್ಯೂನರ್ ಅನ್ವೇಷಣೆ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminAddTuner => 'ಟ್ಯೂನರ್ ಸೇರಿಸಿ';

  @override
  String get adminEditTuner => 'ಟ್ಯೂನರ್ ಸಂಪಾದಿಸಿ';

  @override
  String get adminTunerTypeM3u => 'M3U ಟ್ಯೂನರ್';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'ಫೈಲ್ ಅಥವಾ URL';

  @override
  String get adminTunerIpAddress => 'ಟ್ಯೂನರ್ IP ವಿಳಾಸ';

  @override
  String get adminTunerFriendlyName => 'ಪ್ರದರ್ಶನ ಹೆಸರು';

  @override
  String get adminTunerUserAgent => 'ಬಳಕೆದಾರ ಏಜೆಂಟ್';

  @override
  String get adminTunerCount => 'ಏಕಕಾಲಿಕ ಸಂಪರ್ಕ ಮಿತಿ';

  @override
  String get adminTunerCountHelp =>
      'ಟ್ಯೂನರ್ ಒಂದೇ ಬಾರಿಗೆ ಅನುಮತಿಸುವ ಗರಿಷ್ಠ ಸ್ಟ್ರೀಮ್‌ಗಳ ಸಂಖ್ಯೆ. ಅನಿಯಮಿತಕ್ಕೆ 0 ಗೆ ಹೊಂದಿಸಿ.';

  @override
  String get adminTunerFallbackBitrate => 'ಪರ್ಯಾಯ ಗರಿಷ್ಠ ಸ್ಟ್ರೀಮಿಂಗ್ ಬಿಟ್‌ರೇಟ್';

  @override
  String get adminTunerImportFavoritesOnly =>
      'ಮೆಚ್ಚಿನ ಚಾನೆಲ್‌ಗಳನ್ನು ಮಾತ್ರ ಆಮದು ಮಾಡಿ';

  @override
  String get adminTunerAllowHwTranscoding =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminTunerAllowFmp4 =>
      'fMP4 ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಕಂಟೇನರ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminTunerAllowStreamSharing => 'ಸ್ಟ್ರೀಮ್ ಹಂಚಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminTunerEnableStreamLooping => 'ಸ್ಟ್ರೀಮ್ ಲೂಪಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminTunerIgnoreDts => 'DTS ಅನ್ನು ನಿರ್ಲಕ್ಷಿಸಿ';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'ಸ್ಥಳೀಯ ಫ್ರೇಮ್ ದರದಲ್ಲಿ ಇನ್‌ಪುಟ್ ಓದಿ';

  @override
  String get adminEditProvider => 'ಪೂರೈಕೆದಾರರನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'ಫೈಲ್ ಅಥವಾ URL';

  @override
  String get adminXmltvMoviePrefix => 'ಚಲನಚಿತ್ರ ಪೂರ್ವಪ್ರತ್ಯಯ';

  @override
  String get adminXmltvMovieCategories => 'ಚಲನಚಿತ್ರ ವರ್ಗಗಳು';

  @override
  String get adminXmltvCategoriesHelp =>
      'ಬಹು ವರ್ಗಗಳನ್ನು ಲಂಬ ಗೆರೆಯಿಂದ ಬೇರ್ಪಡಿಸಿ.';

  @override
  String get adminXmltvKidsCategories => 'ಮಕ್ಕಳ ವರ್ಗಗಳು';

  @override
  String get adminXmltvNewsCategories => 'ಸುದ್ದಿ ವರ್ಗಗಳು';

  @override
  String get adminXmltvSportsCategories => 'ಕ್ರೀಡಾ ವರ್ಗಗಳು';

  @override
  String get adminSdUsername => 'ಬಳಕೆದಾರ ಹೆಸರು';

  @override
  String get adminSdPassword => 'ಪಾಸ್‌ವರ್ಡ್';

  @override
  String get adminSdCountry => 'ದೇಶ';

  @override
  String get adminSdCountrySelect => 'ದೇಶವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get adminSdPostalCode => 'ಅಂಚೆ ಕೋಡ್';

  @override
  String get adminSdGetListings => 'ಪಟ್ಟಿಗಳನ್ನು ಪಡೆಯಿರಿ';

  @override
  String get adminSdListings => 'ಪಟ್ಟಿಗಳು';

  @override
  String get adminEnableAllTuners => 'ಎಲ್ಲಾ ಟ್ಯೂನರ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminTunerType => 'ಟ್ಯೂನರ್ ಪ್ರಕಾರ';

  @override
  String get adminTunerAdded => 'ಟ್ಯೂನರ್ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String adminTunerAddFailed(String error) {
    return 'ಟ್ಯೂನರ್ ಸೇರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminAddGuideProvider => 'ಮಾರ್ಗದರ್ಶಿ ಪೂರೈಕೆದಾರರನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminProviderType => 'ಪೂರೈಕೆದಾರರ ಪ್ರಕಾರ';

  @override
  String get adminProviderAdded => 'ಪೂರೈಕೆದಾರರನ್ನು ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String adminProviderAddFailed(String error) {
    return 'ಪೂರೈಕೆದಾರರನ್ನು ಸೇರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'ಟ್ಯೂನರ್ ತೆಗೆದುಹಾಕಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminTunerResetRequested => 'ಟ್ಯೂನರ್ ಮರುಹೊಂದಿಸಲು ವಿನಂತಿಸಲಾಗಿದೆ';

  @override
  String adminTunerResetFailed(String error) {
    return 'ಟ್ಯೂನರ್ ಮರುಹೊಂದಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'ಈ ಟ್ಯೂನರ್ ಪ್ರಕಾರವು ಮರುಹೊಂದಿಸುವಿಕೆಯನ್ನು ಬೆಂಬಲಿಸುವುದಿಲ್ಲ.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'ಪೂರೈಕೆದಾರರನ್ನು ತೆಗೆದುಹಾಕಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminRecordingSettings => 'ರೆಕಾರ್ಡಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminPrePadding => 'ಪೂರ್ವ-ಪ್ಯಾಡಿಂಗ್ (ನಿಮಿಷಗಳು)';

  @override
  String get adminPostPadding => 'ಪೋಸ್ಟ್-ಪ್ಯಾಡಿಂಗ್ (ನಿಮಿಷಗಳು)';

  @override
  String get adminRecordingPath => 'ರೆಕಾರ್ಡಿಂಗ್ ಮಾರ್ಗ';

  @override
  String get adminSeriesRecordingPath => 'ಸರಣಿ ರೆಕಾರ್ಡಿಂಗ್ ಮಾರ್ಗ';

  @override
  String get adminMovieRecordingPath => 'ಚಲನಚಿತ್ರ ರೆಕಾರ್ಡಿಂಗ್ ಪಥ';

  @override
  String get adminGuideDays => 'ಗೈಡ್ ಡೇಟಾ ದಿನಗಳು';

  @override
  String get adminGuideDaysAuto => 'ಸ್ವಯಂಚಾಲಿತ';

  @override
  String adminGuideDaysValue(int days) {
    return '$days ದಿನಗಳು';
  }

  @override
  String get adminRecordingPostProcessor => 'ನಂತರದ-ಸಂಸ್ಕರಣೆ ಅಪ್ಲಿಕೇಶನ್ ಪಥ';

  @override
  String get adminRecordingPostProcessorArgs =>
      'ನಂತರದ-ಸಂಸ್ಕಾರಕ ಆರ್ಗ್ಯುಮೆಂಟ್‌ಗಳು';

  @override
  String get adminSaveRecordingNfo => 'ರೆಕಾರ್ಡಿಂಗ್ NFO ಮೆಟಾಡೇಟಾವನ್ನು ಉಳಿಸಿ';

  @override
  String get adminSaveRecordingImages => 'ರೆಕಾರ್ಡಿಂಗ್ ಚಿತ್ರಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get adminLiveTvSectionTiming => 'ಸಮಯ ನಿಗದಿ';

  @override
  String get adminLiveTvSectionPaths => 'ರೆಕಾರ್ಡಿಂಗ್ ಪಥಗಳು';

  @override
  String get adminLiveTvSectionPostProcessing => 'ನಂತರದ-ಸಂಸ್ಕರಣೆ';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'ಗೈಡ್ ಡೇಟಾ: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'ರೆಕಾರ್ಡಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminSetChannelMappings => 'ಚಾನಲ್ ಮ್ಯಾಪಿಂಗ್‌ಗಳನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get adminMappingJson => 'JSON ಮ್ಯಾಪಿಂಗ್';

  @override
  String get adminMappingJsonHint => 'ಉದಾಹರಣೆ: ಮ್ಯಾಪಿಂಗ್‌ಗಳು JSON ಪೇಲೋಡ್';

  @override
  String get adminChannelMappingsUpdated =>
      'ಚಾನಲ್ ಮ್ಯಾಪಿಂಗ್‌ಗಳನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'ಮ್ಯಾಪಿಂಗ್‌ಗಳನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'ಲೈವ್ ಟಿವಿ ಆಡಳಿತವನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminTunerDevices => 'ಟ್ಯೂನರ್ ಸಾಧನಗಳು';

  @override
  String get adminNoTunerHosts =>
      'ಯಾವುದೇ ಟ್ಯೂನರ್ ಹೋಸ್ಟ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminGuideProviders => 'ಮಾರ್ಗದರ್ಶಿ ಪೂರೈಕೆದಾರರು';

  @override
  String get adminRefreshGuideData => 'ಗೈಡ್ ಡೇಟಾವನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get adminGuideRefreshStarted => 'ಗೈಡ್ ಡೇಟಾ ರಿಫ್ರೆಶ್ ಪ್ರಾರಂಭವಾಗಿದೆ';

  @override
  String get adminGuideRefreshUnavailable =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ ಗೈಡ್ ರಿಫ್ರೆಶ್ ಕಾರ್ಯ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminAddProvider => 'ಒದಗಿಸುವವರನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminNoListingProviders =>
      'ಯಾವುದೇ ಪಟ್ಟಿ ಒದಗಿಸುವವರನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'ರೆಕಾರ್ಡಿಂಗ್ ಪಥ: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'ಸರಣಿ ಪಥ: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'ಪೂರ್ವ-ಪ್ಯಾಡಿಂಗ್: $minutes ನಿಮಿ';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'ನಂತರದ-ಪ್ಯಾಡಿಂಗ್: $minutes ನಿಮಿ';
  }

  @override
  String get adminTunerDiscovery => 'ಟ್ಯೂನರ್ ಡಿಸ್ಕವರಿ';

  @override
  String get adminChannelMappings => 'ಚಾನಲ್ ಮ್ಯಾಪಿಂಗ್‌ಗಳು';

  @override
  String get adminNoDiscoveredTuners => 'ಟ್ಯೂನರ್‌ಗಳು ಇನ್ನೂ ಪತ್ತೆಯಾಗಿಲ್ಲ';

  @override
  String get adminSettingsSaved => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get adminBackupsNotAvailable =>
      'ಈ ಸರ್ವರ್ ಬಿಲ್ಡ್‌ನಲ್ಲಿ ಬ್ಯಾಕಪ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminRestoreWarning1 =>
      'ಮರುಸ್ಥಾಪನೆಯು ಎಲ್ಲಾ ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಡೇಟಾವನ್ನು ಬ್ಯಾಕಪ್ ಡೇಟಾದೊಂದಿಗೆ ಬದಲಾಯಿಸುತ್ತದೆ.';

  @override
  String get adminRestoreWarning2 =>
      'ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು, ಬಳಕೆದಾರರು ಮತ್ತು ಲೈಬ್ರರಿ ಡೇಟಾವನ್ನು ತಿದ್ದಿ ಬರೆಯಲಾಗುತ್ತದೆ.';

  @override
  String get adminRestoreWarning3 =>
      'ಮರುಸ್ಥಾಪನೆಯ ನಂತರ ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭಗೊಳ್ಳುತ್ತದೆ.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '$name ಬ್ಯಾಕಪ್ ಅನ್ನು ಈಗ ಮರುಸ್ಥಾಪಿಸುವುದೇ?';
  }

  @override
  String get adminRestoreRequested =>
      'ಮರುಸ್ಥಾಪಿಸಲು ವಿನಂತಿಸಲಾಗಿದೆ. ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭವು ಈ ಸೆಶನ್ ಅನ್ನು ಸಂಪರ್ಕ ಕಡಿತಗೊಳಿಸಬಹುದು.';

  @override
  String get adminBackupsTitle => 'ಬ್ಯಾಕಪ್‌ಗಳು';

  @override
  String get adminUnknownDate => 'ಅಜ್ಞಾತ ದಿನಾಂಕ';

  @override
  String get adminUnnamedBackup => 'ಹೆಸರಿಸದ ಬ್ಯಾಕಪ್';

  @override
  String get adminLiveTvNotAvailable =>
      'ಈ ಸರ್ವರ್ ಬಿಲ್ಡ್‌ನಲ್ಲಿ ಲೈವ್ ಟಿವಿ ಆಡಳಿತ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminLiveTvTitle => 'ಲೈವ್ ಟಿವಿ ಆಡಳಿತ';

  @override
  String get adminApply => 'ಅನ್ವಯಿಸಿ';

  @override
  String get adminNotSet => 'ಹೊಂದಿಸಿಲ್ಲ';

  @override
  String get adminReset => 'ಮರುಹೊಂದಿಸಿ';

  @override
  String get adminLogsTitle => 'ಸರ್ವರ್ ಲಾಗ್‌ಗಳು';

  @override
  String get adminLogsNewestFirst => 'ಹೊಸದು ಮೊದಲನೆಯದು';

  @override
  String get adminLogsOldestFirst => 'ಅತ್ಯಂತ ಹಳೆಯ ಮೊದಲ';

  @override
  String get adminLogsJustNow => 'ಈಗಷ್ಟೇ';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutesನಿ ಹಿಂದೆ';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hoursಗಂ ಹಿಂದೆ';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$daysದಿ ಹಿಂದೆ';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count ಹೊಂದಾಣಿಕೆಗಳು';
  }

  @override
  String get adminLogViewerNoMatches => 'ಹೊಂದಾಣಿಕೆಯ ಸಾಲುಗಳಿಲ್ಲ';

  @override
  String get adminMetadataEditorTitle => 'ಮೆಟಾಡೇಟಾ ಸಂಪಾದಕ';

  @override
  String get adminMetadataIdentify => 'ಗುರುತಿಸಿ';

  @override
  String get adminMetadataType => 'ಟೈಪ್ ಮಾಡಿ';

  @override
  String get adminMetadataDetails => 'ವಿವರಗಳು';

  @override
  String get adminMetadataExternalIds => 'ಬಾಹ್ಯ ID ಗಳು';

  @override
  String get adminMetadataImages => 'ಚಿತ್ರಗಳು';

  @override
  String get adminMetadataFieldTitle => 'ಶೀರ್ಷಿಕೆ';

  @override
  String get adminMetadataFieldSortTitle => 'ಶೀರ್ಷಿಕೆಯನ್ನು ವಿಂಗಡಿಸಿ';

  @override
  String get adminMetadataFieldOriginalTitle => 'ಮೂಲ ಶೀರ್ಷಿಕೆ';

  @override
  String get adminMetadataFieldPremiereDate => 'ಪ್ರೀಮಿಯರ್ ದಿನಾಂಕ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'ಅಂತಿಮ ದಿನಾಂಕ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'ಉತ್ಪಾದನಾ ವರ್ಷ';

  @override
  String get adminMetadataFieldOfficialRating => 'ಅಧಿಕೃತ ರೇಟಿಂಗ್';

  @override
  String get adminMetadataFieldCommunityRating => 'ಸಮುದಾಯ ರೇಟಿಂಗ್';

  @override
  String get adminMetadataFieldCriticRating => 'ವಿಮರ್ಶಕ ರೇಟಿಂಗ್';

  @override
  String get adminMetadataFieldTagline => 'ಅಡಿಬರಹ';

  @override
  String get adminMetadataFieldOverview => 'ಅವಲೋಕನ';

  @override
  String get adminMetadataGenres => 'ಪ್ರಕಾರಗಳು';

  @override
  String get adminMetadataTags => 'ಟ್ಯಾಗ್‌ಗಳು';

  @override
  String get adminMetadataStudios => 'ಸ್ಟುಡಿಯೋಗಳು';

  @override
  String get adminMetadataPeople => 'ಜನರು';

  @override
  String get adminMetadataAddGenre => 'ಪ್ರಕಾರವನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminMetadataAddTag => 'ಟ್ಯಾಗ್ ಸೇರಿಸಿ';

  @override
  String get adminMetadataAddStudio => 'ಸ್ಟುಡಿಯೋ ಸೇರಿಸಿ';

  @override
  String get adminMetadataAddPerson => 'ವ್ಯಕ್ತಿಯನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminMetadataEditPerson => 'ವ್ಯಕ್ತಿಯನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get adminMetadataRole => 'ಪಾತ್ರ';

  @override
  String get adminMetadataImagePrimary => 'ಪ್ರಾಥಮಿಕ';

  @override
  String get adminMetadataImageBackdrop => 'ಹಿನ್ನೆಲೆ';

  @override
  String get adminMetadataImageLogo => 'ಲೋಗೋ';

  @override
  String get adminMetadataImageBanner => 'ಬ್ಯಾನರ್';

  @override
  String get adminMetadataImageThumb => 'ಹೆಬ್ಬೆರಳು';

  @override
  String get adminMetadataRecursive => 'ಪುನರಾವರ್ತಿತ';

  @override
  String get adminMetadataProvider => 'ಒದಗಿಸುವವರು';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಳಿಸಲಾಗಿದೆ';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'ಆಯ್ಕೆಮಾಡಿದ ಚಿತ್ರವನ್ನು ಓದಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಅಳಿಸಿ';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'ಇದು ಐಟಂನಿಂದ ಪ್ರಸ್ತುತ ಚಿತ್ರವನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType ಚಿತ್ರವನ್ನು ಆಯ್ಕೆಮಾಡಿ';
  }

  @override
  String get adminMetadataUpload => 'ಅಪ್ಲೋಡ್ ಮಾಡಿ';

  @override
  String get adminMetadataUpdate => 'ನವೀಕರಿಸಿ';

  @override
  String get adminMetadataRemoteImage => 'ದೂರಸ್ಥ ಚಿತ್ರ';

  @override
  String get adminPluginsInstalled => 'ಸ್ಥಾಪಿಸಲಾಗಿದೆ';

  @override
  String get adminPluginsCatalog => 'ಕ್ಯಾಟಲಾಗ್';

  @override
  String get adminPluginsActive => 'ಸಕ್ರಿಯ';

  @override
  String get adminPluginsRestart => 'ಮರುಪ್ರಾರಂಭಿಸಿ';

  @override
  String get adminPluginsNoSearchResults =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminPluginsNoneInstalled =>
      'ಯಾವುದೇ ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಸ್ಥಾಪಿಸಲಾಗಿಲ್ಲ';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'ನವೀಕರಣ ಲಭ್ಯವಿದೆ: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'ನವೀಕರಣ ಲಭ್ಯವಿದೆ';

  @override
  String get adminPluginsPendingRemoval =>
      'ಮರುಪ್ರಾರಂಭಿಸಿದ ನಂತರ ತೆಗೆಯುವಿಕೆ ಬಾಕಿಯಿದೆ';

  @override
  String get adminPluginsChangesPending => 'ಬಾಕಿ ಉಳಿದಿರುವ ಬದಲಾವಣೆಗಳು ಪುನರಾರಂಭ';

  @override
  String get adminPluginsEnable => 'ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPluginsDisable => 'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPluginsInstallUpdate => 'ನವೀಕರಣವನ್ನು ಸ್ಥಾಪಿಸಿ';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'ನವೀಕರಣವನ್ನು ಸ್ಥಾಪಿಸಿ (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminPluginsCatalogEmpty => 'ಯಾವುದೇ ಪ್ಯಾಕೇಜ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" ಅನ್ನು ಸ್ಥಾಪಿಸಲಾಗುತ್ತಿದೆ...';
  }

  @override
  String get adminPluginDetailExperimental => 'ಪ್ರಾಯೋಗಿಕ ಏಕೀಕರಣ';

  @override
  String get adminPluginDetailExperimentalContent =>
      'ಪ್ಲಗಿನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಏಕೀಕರಣವು ಇನ್ನೂ ಪ್ರಾಯೋಗಿಕವಾಗಿದೆ. ಕೆಲವು ಕ್ಷೇತ್ರಗಳು ಅಥವಾ ಲೇಔಟ್‌ಗಳು ಇನ್ನೂ ಸರಿಯಾಗಿ ರೆಂಡರ್ ಆಗದೇ ಇರಬಹುದು.';

  @override
  String get adminPluginDetailToggle404 =>
      'ಪ್ಲಗಿನ್ ಅನ್ನು ಟಾಗಲ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ. ಸರ್ವರ್‌ಗೆ ಈ ಪ್ಲಗಿನ್ ಆವೃತ್ತಿಯನ್ನು ಹುಡುಕಲಾಗಲಿಲ್ಲ. ಪ್ಲಗಿನ್‌ಗಳನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಲು ಪ್ರಯತ್ನಿಸಿ, ನಂತರ ಮರುಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get adminPluginDetailToggleDioError =>
      'ಪ್ಲಗಿನ್ ಅನ್ನು ಟಾಗಲ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ. ವಿವರಗಳಿಗಾಗಿ ದಯವಿಟ್ಟು ಸರ್ವರ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name ಸೆಟ್ಟಿಂಗ್‌ಗಳು';
  }

  @override
  String get adminPluginDetailDetails => 'ವಿವರಗಳು';

  @override
  String get adminPluginDetailDeveloper => 'ಡೆವಲಪರ್';

  @override
  String get adminPluginDetailRepository => 'ಭಂಡಾರ';

  @override
  String get adminPluginDetailBundled => 'ಬಂಡಲ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get adminPluginDetailEnablePlugin => 'ಪ್ಲಗಿನ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPluginDetailRestartRequired =>
      'ಬದಲಾವಣೆಗಳು ಕಾರ್ಯರೂಪಕ್ಕೆ ಬರಲು ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ಅಗತ್ಯವಿದೆ.';

  @override
  String get adminPluginDetailRemovalPending =>
      'ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭಿಸಿದ ನಂತರ ಈ ಪ್ಲಗಿನ್ ಅನ್ನು ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'ಈ ಪ್ಲಗಿನ್ ಅಸಮರ್ಪಕವಾಗಿದೆ ಮತ್ತು ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸದೇ ಇರಬಹುದು.';

  @override
  String get adminPluginDetailNotSupported =>
      'ಈ ಪ್ಲಗಿನ್ ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಆವೃತ್ತಿಯಿಂದ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get adminPluginDetailSuperseded =>
      'ಈ ಪ್ಲಗಿನ್ ಅನ್ನು ಹೊಸ ಆವೃತ್ತಿಯಿಂದ ಬದಲಾಯಿಸಲಾಗಿದೆ.';

  @override
  String adminReposLoadFailed(String error) {
    return 'ರೆಪೊಸಿಟರಿಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ರೆಪೊಸಿಟರಿಯನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String adminReposRemoveConfirm(String name) {
    return '\"$name\" ಅನ್ನು ತೆಗೆದುಹಾಕಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String get adminReposRemove => 'ತೆಗೆದುಹಾಕಿ';

  @override
  String adminReposSaveFailed(String error) {
    return 'ರೆಪೊಸಿಟರಿಗಳನ್ನು ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminReposEmpty => 'ಯಾವುದೇ ರೆಪೊಸಿಟರಿಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get adminReposEmptySubtitle =>
      'ಲಭ್ಯವಿರುವ ಪ್ಲಗಿನ್‌ಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಲು ರೆಪೊಸಿಟರಿಯನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminReposUnnamed => '(ಹೆಸರಿಲ್ಲದ)';

  @override
  String get adminReposEditTitle => 'ರೆಪೊಸಿಟರಿಯನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get adminReposAddTitle => 'ರೆಪೊಸಿಟರಿಯನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminReposUrl => 'ರೆಪೊಸಿಟರಿ URL';

  @override
  String get adminReposNameHint => 'ಉದಾ. Jellyfin ಸ್ಥಿರ';

  @override
  String get adminPluginSettingsInvalidUrl => 'ಅಮಾನ್ಯ URL';

  @override
  String get adminGeneralSettingsTitle => 'ಸಾಮಾನ್ಯ ಸೆಟ್ಟಿಂಗ್ಗಳು';

  @override
  String get adminGeneralMetadataLanguage => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ಭಾಷೆ';

  @override
  String get adminGeneralMetadataLanguageHint => 'ಉದಾ. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'ಆದ್ಯತೆಯ ಮೆಟಾಡೇಟಾ ದೇಶ';

  @override
  String get adminGeneralMetadataCountryHint => 'ಉದಾ. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'ಲೈಬ್ರರಿ ಸ್ಕ್ಯಾನ್ ಏಕಕಾಲಿಕತೆ';

  @override
  String get adminGeneralImageEncodingLimit => 'ಸಮಾನಾಂತರ ಚಿತ್ರ ಎನ್ಕೋಡಿಂಗ್ ಮಿತಿ';

  @override
  String get adminUnknownError => 'ಅಜ್ಞಾತ ದೋಷ';

  @override
  String get adminBrowse => 'ಬ್ರೌಸ್ ಮಾಡಿ';

  @override
  String get adminCloseBrowser => 'ಬ್ರೌಸರ್ ಅನ್ನು ಮುಚ್ಚಿ';

  @override
  String get adminNetworkingTitle => 'ನೆಟ್ವರ್ಕಿಂಗ್';

  @override
  String get adminNetworkingRestartWarning =>
      'ನೆಟ್‌ವರ್ಕಿಂಗ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಗೆ ಬದಲಾವಣೆಗಳಿಗೆ ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭದ ಅಗತ್ಯವಿರಬಹುದು.';

  @override
  String get adminNetworkingRemoteAccess => 'ರಿಮೋಟ್ ಪ್ರವೇಶವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminNetworkingPorts => 'ಬಂದರುಗಳು';

  @override
  String get adminNetworkingHttpPort => 'HTTP ಪೋರ್ಟ್';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS ಪೋರ್ಟ್';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminNetworkingLocalNetwork => 'ಸ್ಥಳೀಯ ನೆಟ್ವರ್ಕ್';

  @override
  String get adminNetworkingLocalAddresses => 'ಸ್ಥಳೀಯ ನೆಟ್ವರ್ಕ್ ವಿಳಾಸಗಳು';

  @override
  String get adminNetworkingAddressHint => 'ಉದಾ. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'ತಿಳಿದಿರುವ ಪ್ರಾಕ್ಸಿಗಳು';

  @override
  String get adminNetworkingProxyHint => 'ಉದಾ. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'ಶ್ವೇತಪಟ್ಟಿ';

  @override
  String get adminNetworkingBlacklist => 'ಕಪ್ಪುಪಟ್ಟಿ';

  @override
  String get adminNetworkingAddEntry => 'ನಮೂದನ್ನು ಸೇರಿಸಿ';

  @override
  String get adminBrandingTitle => 'ಬ್ರ್ಯಾಂಡಿಂಗ್';

  @override
  String get adminBrandingLoginDisclaimer => 'ಲಾಗಿನ್ ಹಕ್ಕು ನಿರಾಕರಣೆ';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'ಲಾಗಿನ್ ಫಾರ್ಮ್‌ನ ಕೆಳಗೆ HTML ಅನ್ನು ಪ್ರದರ್ಶಿಸಲಾಗುತ್ತದೆ';

  @override
  String get adminBrandingCustomCss => 'ಕಸ್ಟಮ್ CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'ವೆಬ್ ಇಂಟರ್ಫೇಸ್‌ಗೆ ಕಸ್ಟಮ್ CSS ಅನ್ವಯಿಸಲಾಗಿದೆ';

  @override
  String get adminBrandingEnableSplash => 'ಸ್ಪ್ಲಾಶ್ ಪರದೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminBrandingSplashUpload => 'ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get adminBrandingSplashUploaded => 'ಸ್ಪ್ಲಾಶ್‌ಸ್ಕ್ರೀನ್ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get adminBrandingSplashUploadFailed =>
      'ಸ್ಪ್ಲಾಶ್‌ಸ್ಕ್ರೀನ್ ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminBrandingSplashDeleted => 'ಸ್ಪ್ಲಾಶ್‌ಸ್ಕ್ರೀನ್ ತೆಗೆದುಹಾಕಲಾಗಿದೆ';

  @override
  String get adminBrandingNoSplash => 'ಕಸ್ಟಮ್ ಸ್ಪ್ಲಾಶ್‌ಸ್ಕ್ರೀನ್ ಇಲ್ಲ';

  @override
  String get adminPlaybackHwAccel => 'ಯಂತ್ರಾಂಶ ವೇಗವರ್ಧನೆ';

  @override
  String get adminPlaybackHwAccelLabel => 'ಯಂತ್ರಾಂಶ ವೇಗವರ್ಧನೆ';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'ಇದಕ್ಕಾಗಿ ಹಾರ್ಡ್‌ವೇರ್ ಡಿಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ:';

  @override
  String get adminPlaybackQsvDevice => 'QSV ಸಾಧನ';

  @override
  String get adminPlaybackEnhancedNvdec => 'ವರ್ಧಿತ NVDEC ಡಿಕೋಡರ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'ಸಿಸ್ಟಂ ಸ್ಥಳೀಯ ಹಾರ್ಡ್‌ವೇರ್ ಡಿಕೋಡರ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get adminPlaybackColorDepth => 'ಹಾರ್ಡ್‌ವೇರ್ ಡಿಕೋಡಿಂಗ್ ಬಣ್ಣದ ಆಳ';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC ಡಿಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 ಡಿಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bit ಡಿಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit ಡಿಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackHwEncodingSection => 'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackAllowHevcEncoding =>
      'HEVC ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel ಕಡಿಮೆ-ಶಕ್ತಿಯ H.264 ಎನ್‌ಕೋಡರ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel ಕಡಿಮೆ-ಶಕ್ತಿಯ HEVC ಎನ್‌ಕೋಡರ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackToneMapping => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್';

  @override
  String get adminPlaybackEnableTonemapping => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'VPP ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಅಲ್ಗಾರಿದಮ್';

  @override
  String get adminPlaybackTonemappingMode => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಮೋಡ್';

  @override
  String get adminPlaybackTonemappingRange => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ರೇಂಜ್';

  @override
  String get adminPlaybackTonemappingDesat => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಡಿಸ್ಯಾಚುರೇಶನ್';

  @override
  String get adminPlaybackTonemappingPeak => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಪೀಕ್';

  @override
  String get adminPlaybackTonemappingParam => 'ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಪ್ಯಾರಾಮೀಟರ್';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಹೊಳಪು';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP ಟೋನ್ ಮ್ಯಾಪಿಂಗ್ ಕಾಂಟ್ರಾಸ್ಟ್';

  @override
  String get adminPlaybackPresetsQuality => 'ಪ್ರಿಸೆಟ್‌ಗಳು ಮತ್ತು ಗುಣಮಟ್ಟ';

  @override
  String get adminPlaybackEncoderPreset => 'ಎನ್‌ಕೋಡರ್ ಪ್ರಿಸೆಟ್';

  @override
  String get adminPlaybackH264Crf => 'H.264 ಎನ್‌ಕೋಡಿಂಗ್ CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) ಎನ್‌ಕೋಡಿಂಗ್ CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'ಡಿಇಂಟರ್‌ಲೇಸ್ ವಿಧಾನ';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'ಡಿಇಂಟರ್‌ಲೇಸ್ ಮಾಡುವಾಗ ಫ್ರೇಮ್ ದರವನ್ನು ದ್ವಿಗುಣಗೊಳಿಸಿ';

  @override
  String get adminPlaybackAudioSection => 'ಆಡಿಯೋ';

  @override
  String get adminPlaybackEnableAudioVbr =>
      'ಆಡಿಯೋ VBR ಎನ್‌ಕೋಡಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackDownmixBoost => 'ಆಡಿಯೋ ಡೌನ್‌ಮಿಕ್ಸ್ ಬೂಸ್ಟ್';

  @override
  String get adminPlaybackDownmixAlgorithm => 'ಸ್ಟೀರಿಯೋ ಡೌನ್‌ಮಿಕ್ಸ್ ಅಲ್ಗಾರಿದಮ್';

  @override
  String get adminPlaybackMaxMuxingQueue => 'ಗರಿಷ್ಠ ಮಕ್ಸಿಂಗ್ ಕ್ಯೂ ಗಾತ್ರ';

  @override
  String get adminPlaybackAutoOption => 'ಆಟೋ';

  @override
  String get adminPlaybackEncoding => 'ಎನ್ಕೋಡಿಂಗ್';

  @override
  String get adminPlaybackEncodingThreads => 'ಎನ್ಕೋಡಿಂಗ್ ಥ್ರೆಡ್ಗಳು';

  @override
  String get adminPlaybackFallbackFont => 'ಫಾಲ್ಬ್ಯಾಕ್ ಫಾಂಟ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminPlaybackFallbackFontPath => 'ಫಾಲ್ಬ್ಯಾಕ್ ಫಾಂಟ್ ಮಾರ್ಗ';

  @override
  String get adminPlaybackStreaming => 'ಸ್ಟ್ರೀಮಿಂಗ್';

  @override
  String get adminResumeVideo => 'ವೀಡಿಯೊ';

  @override
  String get adminResumeAudiobooks => 'ಆಡಿಯೋಬುಕ್‌ಗಳು';

  @override
  String get adminResumeMinAudiobookPct =>
      'ಕನಿಷ್ಠ ಆಡಿಯೊಬುಕ್ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminResumeMaxAudiobookPct =>
      'ಗರಿಷ್ಠ ಆಡಿಯೊಬುಕ್ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminStreamingBitrateLimit =>
      'ರಿಮೋಟ್ ಕ್ಲೈಂಟ್ ಬಿಟ್ರೇಟ್ ಮಿತಿ (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'ಅನಿಯಮಿತಕ್ಕೆ ಖಾಲಿ ಅಥವಾ 0 ಅನ್ನು ಬಿಡಿ';

  @override
  String get adminTrickplayHwAccel => 'ಹಾರ್ಡ್‌ವೇರ್ ವೇಗವರ್ಧನೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminTrickplayHwEncoding =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಎನ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'ಕೀ ಫ್ರೇಮ್ ಮಾತ್ರ ಹೊರತೆಗೆಯುವಿಕೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'ವೇಗವಾಗಿ ಆದರೆ ಕಡಿಮೆ ನಿಖರತೆ';

  @override
  String get adminTrickplayNonBlocking => 'ನಾನ್-ಬ್ಲಾಕಿಂಗ್';

  @override
  String get adminTrickplayBlocking => 'ತಡೆಯುವುದು';

  @override
  String get adminTrickplayPriorityHigh => 'ಹೆಚ್ಚು';

  @override
  String get adminTrickplayPriorityAboveNormal => 'ಸಾಮಾನ್ಯಕ್ಕಿಂತ ಹೆಚ್ಚು';

  @override
  String get adminTrickplayPriorityNormal => 'ಸಾಮಾನ್ಯ';

  @override
  String get adminTrickplayPriorityBelowNormal => 'ಸಾಮಾನ್ಯಕ್ಕಿಂತ ಕೆಳಗೆ';

  @override
  String get adminTrickplayPriorityIdle => 'ಐಡಲ್';

  @override
  String get adminTrickplayImageSettings => 'ಚಿತ್ರ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminTrickplayInterval => 'ಮಧ್ಯಂತರ (ಮಿಸೆ)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'ಚೌಕಟ್ಟುಗಳನ್ನು ಸೆರೆಹಿಡಿಯಲು ಎಷ್ಟು ಬಾರಿ';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'ಅಲ್ಪವಿರಾಮದಿಂದ ಬೇರ್ಪಡಿಸಿದ ಪಿಕ್ಸೆಲ್ ಅಗಲಗಳು (ಉದಾ. 320)';

  @override
  String get adminTrickplayQuality => 'ಗುಣಮಟ್ಟ';

  @override
  String get adminTrickplayQScale => 'ಗುಣಮಟ್ಟದ ಪ್ರಮಾಣ';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'ಕಡಿಮೆ ಮೌಲ್ಯಗಳು = ಉತ್ತಮ ಗುಣಮಟ್ಟ, ದೊಡ್ಡ ಫೈಲ್‌ಗಳು';

  @override
  String get adminTrickplayJpegQuality => 'JPEG ಗುಣಮಟ್ಟ';

  @override
  String get adminTrickplayProcessing => 'ಸಂಸ್ಕರಣೆ';

  @override
  String get adminTasksEmpty => 'ಯಾವುದೇ ನಿಗದಿತ ಕಾರ್ಯಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminTasksNoFilterMatch =>
      'ಪ್ರಸ್ತುತ ಫಿಲ್ಟರ್‌ಗೆ ಯಾವುದೇ ಕಾರ್ಯಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminTaskCancelling => 'ರದ್ದುಗೊಳಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get adminTaskRunning => 'ಚಾಲನೆಯಲ್ಲಿದೆ...';

  @override
  String get adminTaskNeverRun => 'ಎಂದಿಗೂ ಓಡುವುದಿಲ್ಲ';

  @override
  String get adminTaskStop => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get adminRunningTasks => 'ಚಾಲನೆಯಲ್ಲಿರುವ ಕಾರ್ಯಗಳು';

  @override
  String get adminTaskRun => 'ಓಡು';

  @override
  String get adminTaskDetailLastExecution => 'ಕೊನೆಯ ಮರಣದಂಡನೆ';

  @override
  String get adminTaskDetailStarted => 'ಪ್ರಾರಂಭಿಸಲಾಗಿದೆ';

  @override
  String get adminTaskDetailEnded => 'ಕೊನೆಗೊಂಡಿದೆ';

  @override
  String get adminTaskDetailDuration => 'ಅವಧಿ';

  @override
  String get adminTaskDetailErrorLabel => 'ದೋಷ:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'ಪ್ರತಿದಿನ $time ಕ್ಕೆ';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'ಪ್ರತಿ $day $time ಕ್ಕೆ';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'ಪ್ರತಿ $duration ಗೆ';
  }

  @override
  String get adminTaskTriggerStartup => 'ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಾರಂಭದಲ್ಲಿ';

  @override
  String get adminTaskTriggerTypeDaily => 'ಪ್ರತಿದಿನ';

  @override
  String get adminTaskTriggerTypeWeekly => 'ಸಾಪ್ತಾಹಿಕ';

  @override
  String get adminTaskTriggerTypeInterval => 'ಮಧ್ಯಂತರದಲ್ಲಿ';

  @override
  String get adminTaskTriggerIntervalLabel => 'ಮಧ್ಯಂತರ';

  @override
  String get adminTaskTriggerEveryHour => 'ಪ್ರತಿ ಗಂಟೆಗೆ';

  @override
  String get adminTaskTriggerEvery6Hours => 'ಪ್ರತಿ 6 ಗಂಟೆಗಳಿಗೊಮ್ಮೆ';

  @override
  String get adminTaskTriggerEvery12Hours => 'ಪ್ರತಿ 12 ಗಂಟೆಗಳಿಗೊಮ್ಮೆ';

  @override
  String get adminTaskTriggerEvery24Hours => 'ಪ್ರತಿ 24 ಗಂಟೆಗಳಿಗೊಮ್ಮೆ';

  @override
  String get adminTaskTriggerEvery2Days => 'ಪ್ರತಿ 2 ದಿನಗಳು';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಗಂಟೆಗಳು',
      one: '1 ಗಂಟೆ',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'ಸಮಯ';

  @override
  String get adminTaskTriggerNoLimit => 'ಮಿತಿ ಇಲ್ಲ';

  @override
  String get adminActivityJustNow => 'ಈಗಷ್ಟೇ';

  @override
  String get adminActivityLastHour => 'ಕೊನೆಯ ಗಂಟೆ';

  @override
  String get adminActivityToday => 'ಇಂದು';

  @override
  String get adminActivityYesterday => 'ನಿನ್ನೆ';

  @override
  String get adminActivityOlder => 'ಹಳೆಯದು';

  @override
  String adminActivityDaysAgo(int days) {
    return '$daysದಿ ಹಿಂದೆ';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hoursಗಂ ಹಿಂದೆ';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutesನಿ ಹಿಂದೆ';
  }

  @override
  String get adminActivityNow => 'ಈಗ';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutesನಿ';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hoursಗಂ';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$daysದಿ';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'ಸೀಕ್ ಪೂರ್ವವೀಕ್ಷಣೆ ಥಂಬ್‌ನೇಲ್‌ಗಳಿಗಾಗಿ trickplay ಚಿತ್ರ ರಚನೆಯನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ.';

  @override
  String get adminNetworkingPublicHttpsPort => 'ಸಾರ್ವಜನಿಕ HTTPS ಪೋರ್ಟ್';

  @override
  String get adminNetworkingBaseUrl => 'ಮೂಲ URL';

  @override
  String get adminNetworkingBaseUrlHint => 'ಉದಾ. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'ಸಾರ್ವಜನಿಕ HTTP ಪೋರ್ಟ್';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS ಅಗತ್ಯವಿದೆ';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'ಎಲ್ಲಾ ರಿಮೋಟ್ ವಿನಂತಿಗಳನ್ನು HTTPS ಗೆ ಮರುನಿರ್ದೇಶಿಸಿ. ಸರ್ವರ್‌ಗೆ ಮಾನ್ಯ ಪ್ರಮಾಣಪತ್ರ ಇಲ್ಲದಿದ್ದರೆ ಇದು ಯಾವುದೇ ಪರಿಣಾಮ ಬೀರುವುದಿಲ್ಲ.';

  @override
  String get adminNetworkingCertPassword => 'ಪ್ರಮಾಣಪತ್ರ ಪಾಸ್‌ವರ್ಡ್';

  @override
  String get adminNetworkingIpSettings => 'IP ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminNetworkingAutoDiscovery =>
      'ಸ್ವಯಂಚಾಲಿತ ಪೋರ್ಟ್ ಮ್ಯಾಪಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminNetworkingLocalSubnets => 'LAN ನೆಟ್‌ವರ್ಕ್‌ಗಳು';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'ಸ್ಥಳೀಯ ನೆಟ್‌ವರ್ಕ್‌ನಲ್ಲಿವೆ ಎಂದು ಪರಿಗಣಿಸಲಾಗುವ IP ವಿಳಾಸಗಳು ಅಥವಾ CIDR ಸಬ್‌ನೆಟ್‌ಗಳ ಅಲ್ಪವಿರಾಮ ಅಥವಾ ಸಾಲಿನಿಂದ ಬೇರ್ಪಡಿಸಿದ ಪಟ್ಟಿ.';

  @override
  String get adminNetworkingPublishedUris => 'ಪ್ರಕಟಿಸಿದ ಸರ್ವರ್ URI ಗಳು';

  @override
  String get adminNetworkingPublishedUriHint =>
      'ಸಬ್‌ನೆಟ್ ಅಥವಾ ವಿಳಾಸವನ್ನು ಪ್ರಕಟಿಸಿದ URL ಗೆ ಮ್ಯಾಪ್ ಮಾಡಿ, ಉದಾ. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'ಪ್ರಮಾಣಪತ್ರ ಮಾರ್ಗ';

  @override
  String get adminNetworkingRemoteIpFilter => 'ರಿಮೋಟ್ ಐಪಿ ಫಿಲ್ಟರ್';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'ರಿಮೋಟ್ ಐಪಿ ಫಿಲ್ಟರ್';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API ಸಾಧನ';

  @override
  String get adminPlaybackAutomatic => '0 = ಸ್ವಯಂಚಾಲಿತ';

  @override
  String get adminPlaybackTranscodeTempPath => 'ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ತಾಪ ಮಾರ್ಗ';

  @override
  String get adminPlaybackSegmentDeletion => 'ವಿಭಾಗ ಅಳಿಸುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminPlaybackSegmentKeep => 'ಸೆಗ್ಮೆಂಟ್ ಕೀಪ್ (ಸೆಕೆಂಡ್)';

  @override
  String get adminPlaybackThrottleBuffering => 'ಥ್ರೊಟಲ್ ಬಫರಿಂಗ್';

  @override
  String get adminPlaybackThrottleDelay => 'ಥ್ರಾಟಲ್ ವಿಳಂಬ (ಸೆಕೆಂಡುಗಳು)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'ತಕ್ಷಣದ ಉಪಶೀರ್ಷಿಕೆ ಹೊರತೆಗೆಯುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get adminResumeMinPct => 'ಕನಿಷ್ಠ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminResumeMinPctSubtitle =>
      'ಪ್ರಗತಿಯನ್ನು ಉಳಿಸಲು ಈ ಶೇಕಡಾವಾರು ಪ್ರಮಾಣವನ್ನು ಮೀರಿ ವಿಷಯವನ್ನು ಪ್ಲೇ ಮಾಡಬೇಕು';

  @override
  String get adminResumeMaxPct => 'ಗರಿಷ್ಠ ಪುನರಾರಂಭದ ಶೇಕಡಾವಾರು';

  @override
  String get adminResumeMaxPctSubtitle =>
      'ಈ ಶೇಕಡಾವಾರು ನಂತರ ವಿಷಯವನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಪ್ಲೇ ಮಾಡಲಾಗಿದೆ ಎಂದು ಪರಿಗಣಿಸಲಾಗುತ್ತದೆ';

  @override
  String get adminResumeMinDuration => 'ಕನಿಷ್ಠ ಪುನರಾರಂಭದ ಅವಧಿ (ಸೆಕೆಂಡ್‌ಗಳು)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'ಇದಕ್ಕಿಂತ ಚಿಕ್ಕದಾದ ಐಟಂಗಳನ್ನು ಪುನರಾರಂಭಿಸಲಾಗುವುದಿಲ್ಲ';

  @override
  String get adminTrickplayScanBehavior => 'ನಡವಳಿಕೆಯನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get adminTrickplayProcessPriority => 'ಪ್ರಕ್ರಿಯೆಯ ಆದ್ಯತೆ';

  @override
  String get adminTrickplayTileWidth => 'ಟೈಲ್ ಅಗಲ';

  @override
  String get adminTrickplayTileHeight => 'ಟೈಲ್ ಎತ್ತರ';

  @override
  String get adminTrickplayProcessThreads => 'ಪ್ರಕ್ರಿಯೆ ಎಳೆಗಳು';

  @override
  String get adminTrickplayWidthResolutions => 'ಅಗಲ ನಿರ್ಣಯಗಳು';

  @override
  String get adminMetadataDefault => 'ಡೀಫಾಲ್ಟ್';

  @override
  String get adminMetadataContentTypeUpdated =>
      'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'ವಿಷಯ ಪ್ರಕಾರವನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'ನಿಧಾನ ಪ್ರತಿಕ್ರಿಯೆ ಮಿತಿ (ಮಿಸೆ)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'ನಿಧಾನ ಪ್ರತಿಕ್ರಿಯೆ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get adminGeneralSectionServer => 'ಸರ್ವರ್';

  @override
  String get adminGeneralSectionMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminGeneralSectionPaths => 'ಪಥಗಳು';

  @override
  String get adminGeneralSectionPerformance => 'ಕಾರ್ಯಕ್ಷಮತೆ';

  @override
  String get adminGeneralCachePath => 'ಸಂಗ್ರಹ ಮಾರ್ಗ';

  @override
  String get adminGeneralMetadataPath => 'ಮೆಟಾಡೇಟಾ ಮಾರ್ಗ';

  @override
  String get adminGeneralServerName => 'ಸರ್ವರ್ ಹೆಸರು';

  @override
  String get adminGeneralDisplayLanguage => 'ಆದ್ಯತೆಯ ಪ್ರದರ್ಶನ ಭಾಷೆ';

  @override
  String get adminSettingsLoadFailed =>
      'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get adminDiscover => 'ಅನ್ವೇಷಿಸಿ';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'ಮ್ಯಾಪಿಂಗ್‌ಗಳನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'ಸಮಯ ಮಿತಿ: $duration';
  }

  @override
  String get folders => 'ಫೋಲ್ಡರ್‌ಗಳು';

  @override
  String get libraries => 'ಲೈಬ್ರರಿಗಳು';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get syncPlayDisabledMessage =>
      'ಸಿಂಕ್ರೊನೈಸ್ ಮಾಡಿದ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಬಳಸಲು ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ SyncPlay ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get syncPlayServerUnsupportedTitle => 'ಸರ್ವರ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay ಗೆ Jellyfin ಸರ್ವರ್ ಅಗತ್ಯವಿದೆ. ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಇದನ್ನು ಬೆಂಬಲಿಸುವುದಿಲ್ಲ.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay ಗುಂಪು';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay ಗುಂಪು';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ಭಾಗವಹಿಸುವವರು',
      one: '# ಭಾಗವಹಿಸುವವರು',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'ಕಾಯುವುದನ್ನು ನಿರ್ಲಕ್ಷಿಸಿ';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'ಈ ಸಾಧನವು ಬಫರ್ ಆಗಿರುವಾಗ ಗುಂಪನ್ನು ಹಿಡಿದಿಟ್ಟುಕೊಳ್ಳಬೇಡಿ';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'ನಿಧಾನಗತಿಯ ಸದಸ್ಯರಿಗೆ ಕಾಯದೆ ಸ್ಥಳೀಯವಾಗಿ ಮುಂದುವರಿಯಿರಿ';

  @override
  String get syncPlayRepeat => 'ಪುನರಾವರ್ತಿಸಿ';

  @override
  String get syncPlayRepeatOne => 'ಒಂದು';

  @override
  String get syncPlayShuffleModeShuffled => 'ಷಫಲ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get syncPlayShuffleModeSorted => 'ವಿಂಗಡಿಸಲಾಗಿದೆ';

  @override
  String get syncPlaySyncCurrentQueue =>
      'ಪ್ರಸ್ತುತ ಪ್ಲೇಬ್ಯಾಕ್ ಕ್ಯೂ ಅನ್ನು ಸಿಂಕ್ ಮಾಡಿ';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'ಗುಂಪಿನ ಸರದಿಯನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಪ್ಲೇ ಮಾಡುವುದರೊಂದಿಗೆ ಬದಲಾಯಿಸಿ';

  @override
  String get syncPlayLeaveGroup => 'ಗುಂಪನ್ನು ತೊರೆಯಿರಿ';

  @override
  String get syncPlayGroupQueue => 'ಗುಂಪು ಸರದಿ';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'ಐಟಂ $index';
  }

  @override
  String get syncPlayPlayNow => 'ಈಗ ಆಟವಾಡಿ';

  @override
  String get syncPlayCreateNewGroup => 'ಹೊಸ ಗುಂಪನ್ನು ರಚಿಸಿ';

  @override
  String get syncPlayGroupName => 'ಗುಂಪಿನ ಹೆಸರು';

  @override
  String get syncPlayDefaultGroupName => 'ನನ್ನ SyncPlay ಗುಂಪು';

  @override
  String get syncPlayCreateGroup => 'ಗುಂಪನ್ನು ರಚಿಸಿ';

  @override
  String get syncPlayAvailableGroups => 'ಲಭ್ಯವಿರುವ ಗುಂಪುಗಳು';

  @override
  String get syncPlayNoGroupsAvailable => 'ಯಾವುದೇ ಗುಂಪುಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay ಗುಂಪಿಗೆ ಸೇರುವುದೇ?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay ಗುಂಪಿಗೆ ಸೇರುವುದರಿಂದ ನಿಮ್ಮ ಪ್ರಸ್ತುತ ಪ್ಲೇಬ್ಯಾಕ್ ಸರದಿಯನ್ನು ಬದಲಾಯಿಸಬಹುದು. ಮುಂದುವರಿಸುವುದೇ?';

  @override
  String get syncPlayJoin => 'ಸೇರಿಕೊಳ್ಳಿ';

  @override
  String get syncPlayStateIdle => 'ಐಡಲ್';

  @override
  String get syncPlayStateWaiting => 'ಕಾಯುತ್ತಿದೆ';

  @override
  String get syncPlayStatePaused => 'ವಿರಾಮಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get syncPlayStatePlaying => 'ನುಡಿಸುತ್ತಿದೆ';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay ಗುಂಪಿಗೆ ಸೇರಿದರು';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay ಗುಂಪಿನಿಂದ ಹೊರಟರು';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay ಪ್ರವೇಶವನ್ನು ನಿರಾಕರಿಸಲಾಗಿದೆ';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ಈ SyncPlay ಗುಂಪಿನಲ್ಲಿ ನೀವು ಒಂದು ಅಥವಾ ಹೆಚ್ಚಿನ ಐಟಂಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಹೊಂದಿಲ್ಲ. ಲೈಬ್ರರಿ ಅನುಮತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಲು ಅಥವಾ ಬೇರೆ ಸರತಿಯನ್ನು ಆಯ್ಕೆ ಮಾಡಲು ಗುಂಪಿನ ಮಾಲೀಕರನ್ನು ಕೇಳಿ.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName ಗೆ ಪ್ಲೇಬ್ಯಾಕ್ ಸಿಂಕ್ ಮಾಡಲಾಗುತ್ತಿದೆ';
  }

  @override
  String get voiceSearchUnavailable => 'ಧ್ವನಿ ಹುಡುಕಾಟ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision ಡೈರೆಕ್ಟ್ ಪ್ಲೇ ವಿಫಲವಾಗಿದೆ';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'ಈ Dolby Vision ಸ್ಟ್ರೀಮ್‌ಗಾಗಿ ನೇರವಾದ ಪ್ಲೇ ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗಿದೆ. ಸರ್ವರ್ ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಬಳಸಿ ಮರುಪ್ರಯತ್ನಿಸುವುದೇ?';

  @override
  String get retryWithTranscode => 'ಟ್ರಾನ್ಸ್‌ಕೋಡ್‌ನೊಂದಿಗೆ ಮರುಪ್ರಯತ್ನಿಸಿ';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision ಬೆಂಬಲಿತವಾಗಿಲ್ಲ';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'ಈ ಸಾಧನವು ನೇರವಾಗಿ Dolby Vision ವಿಷಯವನ್ನು ಡಿಕೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ. HDR10 ಫಾಲ್‌ಬ್ಯಾಕ್ ಬಳಸಿ ಅಥವಾ ಸರ್ವರ್ ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಅನ್ನು ವಿನಂತಿಸಿ.';

  @override
  String get rememberMyChoice => 'ನನ್ನ ಆಯ್ಕೆಯನ್ನು ನೆನಪಿಡಿ';

  @override
  String get playHdr10Fallback => 'HDR10 ಫಾಲ್ಬ್ಯಾಕ್ ಅನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get requestTranscode => 'ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಅನ್ನು ವಿನಂತಿಸಿ';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ಸಾಲುಗಳು ಪತ್ತೆಯಾಗಿವೆ',
      one: '# ಸಾಲು ಪತ್ತೆಯಾಗಿದೆ',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'ಎಲ್ಲವನ್ನೂ ನೋಡಿ';

  @override
  String get noItems => 'ಯಾವುದೇ ಐಟಂಗಳಿಲ್ಲ';

  @override
  String get switchUser => 'ಬಳಕೆದಾರರನ್ನು ಬದಲಿಸಿ';

  @override
  String get remoteControl => 'ರಿಮೋಟ್ ಕಂಟ್ರೋಲ್';

  @override
  String get mediaBarLoading => 'ಮೀಡಿಯಾ ಬಾರ್ ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get mediaBarError => 'ಮೀಡಿಯಾ ಬಾರ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get offlineServerUnavailable =>
      'ಇಂಟರ್ನೆಟ್‌ಗೆ ಸಂಪರ್ಕಗೊಂಡಿದೆ, ಆದರೆ ಪ್ರಸ್ತುತ ಸರ್ವರ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get offlineNoInternet =>
      'ನೀವು ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿರುವಿರಿ. ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ವಿಷಯ ಮಾತ್ರ ಲಭ್ಯವಿದೆ.';

  @override
  String get offlineFileNotAvailable => 'ಫೈಲ್ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get offlineSwitchServer => 'ಸರ್ವರ್ ಬದಲಿಸಿ';

  @override
  String get offlineSavedMedia => 'ಉಳಿಸಿದ ಮಾಧ್ಯಮ';

  @override
  String get offlineBannerTitle => 'ನೀವು ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿದ್ದೀರಿ';

  @override
  String get offlineBannerSubtitle => 'ನಿಮ್ಮ ಡೌನ್‌ಲೋಡ್‌ಗಳನ್ನು ತೋರಿಸಲಾಗುತ್ತಿದೆ';

  @override
  String get offlineBannerAction => 'ಡೌನ್‌ಲೋಡ್‌ಗಳು';

  @override
  String get serverUnreachableBannerTitle =>
      'ನಿಮ್ಮ ಸರ್ವರ್ ಅನ್ನು ತಲುಪಲು ಸಾಧ್ಯವಾಗುತ್ತಿಲ್ಲ';

  @override
  String get serverUnreachableBannerSubtitle =>
      'ಅದು ಮರಳುವವರೆಗೆ ಡೌನ್‌ಲೋಡ್‌ಗಳಿಂದ ಪ್ಲೇ ಮಾಡಲಾಗುತ್ತಿದೆ';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್';

  @override
  String castControlFailed(String error) {
    return 'ಕಾಸ್ಟ್ ನಿಯಂತ್ರಣ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind ನಿಯಂತ್ರಣಗಳು';
  }

  @override
  String get castDeviceVolume => 'ಸಾಧನದ ಪರಿಮಾಣ';

  @override
  String get castVolumeUnavailable => 'ಲಭ್ಯವಿಲ್ಲ';

  @override
  String castStopKind(String kind) {
    return '$kind ನಿಲ್ಲಿಸಿ';
  }

  @override
  String get audioLabel => 'ಆಡಿಯೋ';

  @override
  String get subtitlesLabel => 'ಉಪಶೀರ್ಷಿಕೆಗಳು';

  @override
  String get pinConfirmTitle => 'ಪಿನ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get pinSetTitle => 'ಪಿನ್ ಹೊಂದಿಸಿ';

  @override
  String get pinEnterTitle => 'ಪಿನ್ ನಮೂದಿಸಿ';

  @override
  String get pinReenterToConfirm => 'ಖಚಿತಪಡಿಸಲು ನಿಮ್ಮ ಪಿನ್ ಅನ್ನು ಮರು-ನಮೂದಿಸಿ';

  @override
  String pinEnterNDigit(int length) {
    return '$length-ಅಂಕಿಯ PIN ನಮೂದಿಸಿ';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'ನಿಮ್ಮ $length-ಅಂಕಿಯ PIN ನಮೂದಿಸಿ';
  }

  @override
  String get pinIncorrect => 'ತಪ್ಪಾದ ಪಿನ್';

  @override
  String get pinMismatch => 'ಪಿನ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ';

  @override
  String get pinForgot => 'ಪಿನ್ ಮರೆತಿರುವಿರಾ?';

  @override
  String get pinClear => 'ತೆರವುಗೊಳಿಸಿ';

  @override
  String get pinBackspace => 'ಬ್ಯಾಕ್‌ಸ್ಪೇಸ್';

  @override
  String get quickConnectAuthorized =>
      'Quick Connect ವಿನಂತಿಯನ್ನು ಅಧಿಕೃತಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect ಕೋಡ್ ಅಮಾನ್ಯವಾಗಿದೆ ಅಥವಾ ಅವಧಿ ಮೀರಿದೆ.';

  @override
  String get quickConnectNotSupported =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ Quick Connect ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect ಕೋಡ್ ಅನ್ನು ಅಧಿಕೃತಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get quickConnectDisabled =>
      'ಈ ಸರ್ವರ್‌ನಲ್ಲಿ Quick Connect ನಿಷ್ಕ್ರಿಯಗೊಂಡಿದೆ.';

  @override
  String get quickConnectForbidden =>
      'ನಿಮ್ಮ ಖಾತೆಯು ಈ Quick Connect ವಿನಂತಿಯನ್ನು ಅಧಿಕೃತಗೊಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect ಕೋಡ್ ಕಂಡುಬಂದಿಲ್ಲ. ಹೊಸ ಕೋಡ್ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect ವಿಫಲವಾಗಿದೆ: $message';
  }

  @override
  String get quickConnectEnterCode => 'ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get quickConnectAuthorize => 'ಅಧಿಕಾರ ನೀಡಿ';

  @override
  String remoteCommandFailed(String error) {
    return 'ಆದೇಶ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get remoteControlTitle => 'ರಿಮೋಟ್ ಕಂಟ್ರೋಲ್';

  @override
  String get remoteFailedToLoadSessions => 'ಸೆಶನ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get remoteNoSessions => 'ನಿಯಂತ್ರಿಸಬಹುದಾದ ಸೆಷನ್‌ಗಳಿಲ್ಲ';

  @override
  String get remoteStartPlayback => 'ಮತ್ತೊಂದು ಸಾಧನದಲ್ಲಿ ಪ್ಲೇಬ್ಯಾಕ್ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get unknownUser => 'ಅಜ್ಞಾತ';

  @override
  String get unknownItem => 'ಅಜ್ಞಾತ';

  @override
  String get remoteNothingPlaying => 'ಈ ಅಧಿವೇಶನದಲ್ಲಿ ಏನೂ ಪ್ಲೇ ಆಗುತ್ತಿಲ್ಲ';

  @override
  String get castingStarted =>
      'ಆಯ್ಕೆಮಾಡಿದ ಸಾಧನದಲ್ಲಿ ಬಿತ್ತರಿಸುವಿಕೆ ಪ್ರಾರಂಭವಾಗಿದೆ';

  @override
  String castingFailed(String error) {
    return 'ಕಾಸ್ಟಿಂಗ್ ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get noRemoteDevices => 'ಯಾವುದೇ ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್ ಸಾಧನಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get noRemoteDevicesIos =>
      'ಯಾವುದೇ ರಿಮೋಟ್ ಪ್ಲೇಬ್ಯಾಕ್ ಸಾಧನಗಳು ಲಭ್ಯವಿಲ್ಲ.\n\niOS ನಲ್ಲಿ, AirPlay ಗುರಿಗಳು ಸಿಮ್ಯುಲೇಟರ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲದಿರಬಹುದು.';

  @override
  String get trackActionPlayNext => 'ಮುಂದೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get trackActionAddToQueue => 'ಕ್ಯೂಗೆ ಸೇರಿಸಿ';

  @override
  String get trackActionAddToPlaylist => 'ಪ್ಲೇಪಟ್ಟಿಗೆ ಸೇರಿಸಿ';

  @override
  String get trackActionCancelDownload => 'ಡೌನ್‌ಲೋಡ್ ರದ್ದುಮಾಡಿ';

  @override
  String get trackActionDeleteFromPlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯಿಂದ ಅಳಿಸಿ';

  @override
  String get trackActionMoveUp => 'ಮೇಲಕ್ಕೆ ಸರಿಸಿ';

  @override
  String get trackActionMoveDown => 'ಕೆಳಗೆ ಸರಿಸಿ';

  @override
  String get trackActionRemoveFromFavorites => 'ಮೆಚ್ಚಿನವುಗಳಿಂದ ತೆಗೆದುಹಾಕಿ';

  @override
  String get trackActionAddToFavorites => 'ಮೆಚ್ಚಿನವುಗಳಿಗೆ ಸೇರಿಸಿ';

  @override
  String get trackActionGoToAlbum => 'ಆಲ್ಬಮ್‌ಗೆ ಹೋಗಿ';

  @override
  String get trackActionGoToArtist => 'ಕಲಾವಿದರ ಬಳಿಗೆ ಹೋಗಿ';

  @override
  String trackActionDownloading(String name) {
    return '$name ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ...';
  }

  @override
  String get trackActionDeletedFile => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್ ಅನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get trackActionDeleteFileFailed =>
      'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಫೈಲ್ ಅನ್ನು ಅಳಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get shuffleBy => 'ಷಫಲ್ ಮೂಲಕ';

  @override
  String get shuffleSelectLibrary => 'ಲೈಬ್ರರಿ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get shuffleSelectGenre => 'ಪ್ರಕಾರವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get shuffleLibrary => 'ಲೈಬ್ರರಿ';

  @override
  String get shuffleGenre => 'ಪ್ರಕಾರ';

  @override
  String get shuffleNoLibraries => 'ಯಾವುದೇ ಹೊಂದಾಣಿಕೆಯ ಗ್ರಂಥಾಲಯಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get shuffleNoGenres => 'ಈ ಷಫಲ್ ಮೋಡ್‌ಗೆ ಯಾವುದೇ ಪ್ರಕಾರಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get posterDisplayTitle => 'ಪ್ರದರ್ಶನ';

  @override
  String get posterImageType => 'ಚಿತ್ರದ ಪ್ರಕಾರ';

  @override
  String get imageTypePoster => 'ಪೋಸ್ಟರ್';

  @override
  String get imageTypeThumbnail => 'ಥಂಬ್‌ನೇಲ್';

  @override
  String get imageTypeBanner => 'ಬ್ಯಾನರ್';

  @override
  String get playlistAddFailed => 'ಪ್ಲೇಪಟ್ಟಿಗೆ ಸೇರಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get playlistCreateFailed => 'ಪ್ಲೇಪಟ್ಟಿ ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get playlistNew => 'ಹೊಸ ಪ್ಲೇಪಟ್ಟಿ';

  @override
  String get playlistCreate => 'ರಚಿಸಿ';

  @override
  String get playlistCreateNew => 'ಹೊಸ ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ರಚಿಸಿ';

  @override
  String get playlistNoneFound => 'ಯಾವುದೇ ಪ್ಲೇಪಟ್ಟಿಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get addToPlaylist => 'ಪ್ಲೇಪಟ್ಟಿಗೆ ಸೇರಿಸಿ';

  @override
  String get lyricsNotAvailable => 'ಯಾವುದೇ ಸಾಹಿತ್ಯ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get upNext => 'ಮುಂದೆ';

  @override
  String get playNext => 'ಮುಂದೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get stillWatchingContent =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ವಿರಾಮಗೊಳಿಸಲಾಗಿದೆ. ನೀವು ಇನ್ನೂ ನೋಡುತ್ತಿದ್ದೀರಾ?';

  @override
  String get stillWatchingStop => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get stillWatchingContinue => 'ಮುಂದುವರಿಸಿ';

  @override
  String skipSegment(String segment) {
    return '$segment ಬಿಟ್ಟುಬಿಡಿ';
  }

  @override
  String get liveTv => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get continueWatchingAndNextUp =>
      'ನೋಡುವುದನ್ನು ಮುಂದುವರಿಸಿ ಮತ್ತು ಮುಂದಿನದು';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$current/$total ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName ಡೌನ್‌ಲೋಡ್ ಆಗುತ್ತಿದೆ';
  }

  @override
  String get nextEpisode => 'ಮುಂದಿನ ಸಂಚಿಕೆ';

  @override
  String get moreFromThisSeason => 'ಈ ಸೀಸನ್‌ನಿಂದ ಇನ್ನಷ್ಟು';

  @override
  String get playerTooltipPlaybackSpeed => 'ಪ್ಲೇಬ್ಯಾಕ್ ವೇಗ';

  @override
  String get playerTooltipCastControls => 'ಎರಕಹೊಯ್ದ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get playerTooltipPlaybackQuality => 'ಬಿಟ್ರೇಟ್';

  @override
  String get playerTooltipEnterFullscreen => 'ಪೂರ್ಣಪರದೆಯನ್ನು ನಮೂದಿಸಿ';

  @override
  String get playerTooltipExitFullscreen => 'ಪೂರ್ಣಪರದೆಯಿಂದ ನಿರ್ಗಮಿಸಿ';

  @override
  String get playerTooltipFloatOnTop => 'ಮೇಲೆ ತೇಲುತ್ತದೆ';

  @override
  String get playerTooltipExitFloatOnTop =>
      'ಮೇಲ್ಭಾಗದಲ್ಲಿ ಫ್ಲೋಟ್ ಅನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get playerTooltipLockLandscape => 'ಭೂದೃಶ್ಯವನ್ನು ಲಾಕ್ ಮಾಡಿ';

  @override
  String get playerTooltipUnlockOrientation => 'ತಿರುಗುವಿಕೆಯನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get playerTooltipPrevious => 'ಹಿಂದಿನದು';

  @override
  String get playerTooltipSeekBack => 'ಹಿಂತಿರುಗಿ ನೋಡಿ';

  @override
  String get playerTooltipSeekForward => 'ಮುಂದೆ ಹುಡುಕು';

  @override
  String get contextMenuMarkWatched => 'ವೀಕ್ಷಿಸಲಾಗಿದೆ ಎಂದು ಗುರುತಿಸಿ';

  @override
  String get contextMenuMarkUnwatched => 'ವೀಕ್ಷಿಸಲಾಗಿಲ್ಲ ಎಂದು ಗುರುತಿಸಿ';

  @override
  String get contextMenuAddToFavorites => 'ಮೆಚ್ಚಿನವುಗಳಿಗೆ ಸೇರಿಸಿ';

  @override
  String get contextMenuRemoveFromFavorites => 'ಮೆಚ್ಚಿನವುಗಳಿಂದ ತೆಗೆದುಹಾಕಿ';

  @override
  String get contextMenuGoToSeries => 'ಸರಣಿಗೆ ಹೋಗಿ';

  @override
  String get contextMenuHideFromContinueWatching =>
      '\"ನೋಡುವುದನ್ನು ಮುಂದುವರಿಸಿ\" ವಿಭಾಗದಿಂದ ಮರೆಮಾಡಿ';

  @override
  String get contextMenuHideFromNextUp => '\"ಮುಂದಿನದು\" ವಿಭಾಗದಿಂದ ಮರೆಮಾಡಿ';

  @override
  String get contextMenuAddToCollection => 'ಸಂಗ್ರಹಣೆಗೆ ಸೇರಿಸಿ';

  @override
  String get settingsAdministrationSubtitle =>
      'ಸರ್ವರ್ ಆಡಳಿತ ಫಲಕವನ್ನು ಪ್ರವೇಶಿಸಿ';

  @override
  String get settingsAccountSecurity => 'ಖಾತೆ ಮತ್ತು ಭದ್ರತೆ';

  @override
  String get settingsAccountSecuritySubtitle =>
      'ದೃಢೀಕರಣ, ಪಿನ್ ಕೋಡ್ ಮತ್ತು ಪೋಷಕರ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get settingsPersonalization => 'ವೈಯಕ್ತೀಕರಣ';

  @override
  String get settingsPersonalizationSubtitle =>
      'ಥೀಮ್, ನ್ಯಾವಿಗೇಷನ್, ಹೋಮ್ ಸಾಲುಗಳು ಮತ್ತು ಲೈಬ್ರರಿ ಗೋಚರತೆ';

  @override
  String get settingsDynamicContent => 'ಡೈನಾಮಿಕ್ ವಿಷಯ';

  @override
  String get settingsDynamicContentSubtitle =>
      'ಮೀಡಿಯಾ ಬಾರ್ ಮತ್ತು ದೃಶ್ಯ ಮೇಲ್ಪದರಗಳು';

  @override
  String get settingsPlaybackSyncplay => 'ಪ್ಲೇಬ್ಯಾಕ್ ಮತ್ತು SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'ಆಡಿಯೋ/ವೀಡಿಯೋ ಸೆಟ್ಟಿಂಗ್‌ಗಳು, ಉಪಶೀರ್ಷಿಕೆಗಳು, ಡೌನ್‌ಲೋಡ್‌ಗಳು ಮತ್ತು SyncPlay ನಿಯಂತ್ರಣಗಳು';

  @override
  String get settingsIntegrationsSubtitle =>
      'ಪ್ಲಗಿನ್ ಸಿಂಕ್, Seerr, ರೇಟಿಂಗ್‌ಗಳು ಮತ್ತು ಇನ್ನಷ್ಟು';

  @override
  String get settingsAboutSubtitle =>
      'ಅಪ್ಲಿಕೇಶನ್ ಆವೃತ್ತಿ, ಕಾನೂನು ಮಾಹಿತಿ ಮತ್ತು ಕ್ರೆಡಿಟ್‌ಗಳು';

  @override
  String get settingsAuthenticationSection => 'ದೃಢೀಕರಣ';

  @override
  String get settingsSortServersBy => 'ಮೂಲಕ ಸರ್ವರ್‌ಗಳನ್ನು ವಿಂಗಡಿಸಿ';

  @override
  String get settingsLastUsed => 'ಕೊನೆಯದಾಗಿ ಬಳಸಲಾಗಿದೆ';

  @override
  String get settingsAlphabetical => 'ವರ್ಣಮಾಲೆಯ';

  @override
  String get settingsConnectionSection => 'ಸಂಪರ್ಕ';

  @override
  String get settingsAllowSelfSignedCerts =>
      'ಸ್ವಯಂ-ಸಹಿ ಮಾಡಿದ ಪ್ರಮಾಣಪತ್ರಗಳನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'ಸ್ವಯಂ-ಸಹಿ ಮಾಡಿದ ಅಥವಾ ಖಾಸಗಿ-CA TLS ಪ್ರಮಾಣಪತ್ರಗಳನ್ನು ಬಳಸುವ ಸರ್ವರ್‌ಗಳನ್ನು ನಂಬಿರಿ. ನೀವು ನಿಯಂತ್ರಿಸುವ ಸರ್ವರ್‌ಗಳಿಗೆ ಮಾತ್ರ ಸಕ್ರಿಯಗೊಳಿಸಿ. ಇದು ಎಲ್ಲಾ ಸಂಪರ್ಕಗಳಿಗೆ ಪ್ರಮಾಣಪತ್ರ ಮೌಲ್ಯೀಕರಣವನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುತ್ತದೆ.';

  @override
  String get settingsPrivacyAndSafetySection => 'ಗೌಪ್ಯತೆ ಮತ್ತು ಸುರಕ್ಷತೆ';

  @override
  String get settingsBlockedRatings => 'ನಿರ್ಬಂಧಿಸಿದ ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get settingsGeneralStyle => 'ಸಾಮಾನ್ಯ ಶೈಲಿ';

  @override
  String get settingsGeneralStyleSubtitle =>
      'ಥೀಮ್ ಉಚ್ಚಾರಣೆಗಳು, ಬ್ಯಾಕ್‌ಡ್ರಾಪ್‌ಗಳು, ವೀಕ್ಷಿಸಿದ ಸೂಚಕಗಳು ಮತ್ತು ಥೀಮ್ ಸಂಗೀತ';

  @override
  String get settingsDetailsScreen => 'ವಿವರ ಪರದೆ';

  @override
  String get settingsDetailsScreenSubtitle =>
      'ಶೈಲಿ, ಹಿನ್ನೆಲೆ ಬ್ಲರ್ ಮತ್ತು ಟ್ಯಾಬ್ ವರ್ತನೆ';

  @override
  String get settingsHomePage => 'ಮುಖಪುಟ';

  @override
  String get settingsHomePageSubtitle =>
      'ವಿಭಾಗಗಳು, ಚಿತ್ರದ ಪ್ರಕಾರಗಳು, ಓವರ್‌ಲೇಗಳು ಮತ್ತು ಮಾಧ್ಯಮ ಪೂರ್ವವೀಕ್ಷಣೆಗಳು';

  @override
  String get settingsLibrariesSubtitle =>
      'ಲೈಬ್ರರಿ ಗೋಚರತೆ, ಫೋಲ್ಡರ್ ವೀಕ್ಷಣೆ ಮತ್ತು ಬಹು-ಸರ್ವರ್ ನಡವಳಿಕೆ';

  @override
  String get settingsTwentyFourHourClock => '24-ಗಂಟೆಯ ಗಡಿಯಾರ';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'ಗಡಿಯಾರವನ್ನು ತೋರಿಸಿರುವಲ್ಲೆಲ್ಲಾ 24-ಗಂಟೆಗಳ ಸಮಯದ ಫಾರ್ಮ್ಯಾಟಿಂಗ್ ಅನ್ನು ಬಳಸಿ';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಷನ್ ಬಾರ್‌ನಲ್ಲಿ ಷಫಲ್ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಷನ್ ಬಾರ್‌ನಲ್ಲಿ ಪ್ರಕಾರಗಳ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ ಮೆಚ್ಚಿನವುಗಳ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ ಲೈಬ್ರರೀಸ್ ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ Seerr ಬಟನ್ ತೋರಿಸಿ';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'ಮೇಲಿನ ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ ಪಠ್ಯ ಲೇಬಲ್‌ಗಳನ್ನು ಯಾವಾಗಲೂ ತೋರಿಸಿ';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'ಪ್ರತಿ ಲೈಬ್ರರಿಗೆ ಮುಖಪುಟದ ಗೋಚರತೆಯನ್ನು ಟಾಗಲ್ ಮಾಡಿ. ಬದಲಾವಣೆಗಳು ಕಾರ್ಯರೂಪಕ್ಕೆ ಬರಲು Moonfin ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'ಮೀಡಿಯಾ ಬಾರ್ ಮತ್ತು ಸ್ಥಳೀಯ ಪೂರ್ವವೀಕ್ಷಣೆಗಳು';

  @override
  String get settingsVisualOverlays => 'ದೃಶ್ಯ ಮೇಲ್ಪದರಗಳು';

  @override
  String get settingsSeasonalSurprise => 'ಕಾಲೋಚಿತ ಆಶ್ಚರ್ಯ';

  @override
  String get settingsMetadataAndRatings => 'ಮೆಟಾಡೇಟಾ ಮತ್ತು ರೇಟಿಂಗ್‌ಗಳು';

  @override
  String get settingsPluginScreenDescription =>
      'ಹೆಚ್ಚುವರಿ ರೇಟಿಂಗ್ ಮೂಲಗಳು, Seerr ವಿನಂತಿಗಳು ಮತ್ತು ಸಿಂಕ್ ಮಾಡಿದ ಆದ್ಯತೆಗಳು ಸೇರಿದಂತೆ ಸರ್ವರ್-ಸೈಡ್ ಸಂಯೋಜನೆಗಳಿಗೆ Moonbase ಶಕ್ತಿ ನೀಡುತ್ತದೆ.';

  @override
  String get settingsOfflineDownloads => 'ಆಫ್‌ಲೈನ್ ಡೌನ್‌ಲೋಡ್‌ಗಳು';

  @override
  String get settingsHigh => 'ಹೆಚ್ಚು';

  @override
  String get settingsLow => 'ಕಡಿಮೆ';

  @override
  String get settingsCustomPath => 'ಕಸ್ಟಮ್ ಮಾರ್ಗ';

  @override
  String get settingsEnterDownloadFolderPath =>
      'ಡೌನ್‌ಲೋಡ್ ಫೋಲ್ಡರ್ ಮಾರ್ಗವನ್ನು ನಮೂದಿಸಿ';

  @override
  String get settingsConcurrentDownloads => 'ಏಕಕಾಲಿಕ ಡೌನ್‌ಲೋಡ್‌ಗಳು';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'ಒಮ್ಮೆ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ಗರಿಷ್ಠ ಸಂಖ್ಯೆಯ ಐಟಂಗಳು.';

  @override
  String get settingsAppInfo => 'ಅಪ್ಲಿಕೇಶನ್ ಮಾಹಿತಿ';

  @override
  String get settingsReportAnIssue => 'ಸಮಸ್ಯೆಯನ್ನು ವರದಿ ಮಾಡಿ';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub ನಲ್ಲಿ ಸಮಸ್ಯೆ ಟ್ರ್ಯಾಕರ್ ತೆರೆಯಿರಿ';

  @override
  String get settingsJoinDiscord => 'Discord ಸೇರಿ';

  @override
  String get settingsJoinDiscordSubtitle => 'ಸಮುದಾಯದೊಂದಿಗೆ ಚಾಟ್ ಮಾಡಿ';

  @override
  String get settingsJoinTheDiscord => 'Discord ಸೇರಿ';

  @override
  String get settingsSupportMoonfin => 'ಬೆಂಬಲ Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'ಡೆವಲಪರ್‌ಗೆ ಒಂದು ಕಾಫಿ ದಾನ ಮಾಡಿ';

  @override
  String get settingsLegal => 'ಕಾನೂನುಬದ್ಧ';

  @override
  String get settingsLicenses => 'ಪರವಾನಗಿಗಳು';

  @override
  String get settingsOpenSourceLicenseNotices => 'ಓಪನ್ ಸೋರ್ಸ್ ಪರವಾನಗಿ ಸೂಚನೆಗಳು';

  @override
  String get settingsPrivacyPolicy => 'ಗೌಪ್ಯತೆ ನೀತಿ';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin ನಿಮ್ಮ ಡೇಟಾವನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸುತ್ತದೆ';

  @override
  String get settingsCheckForUpdates => 'ನವೀಕರಣಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'ಇತ್ತೀಚಿನ Moonfin ಬಿಡುಗಡೆಗಾಗಿ ಪರಿಶೀಲಿಸಿ';

  @override
  String get settingsPoweredByFlutter => 'Flutter ನಿಂದ ನಡೆಸಲ್ಪಡುತ್ತಿದೆ';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ಪರವಾನಗಿ ಸೂಚನೆಗಳು',
      one: '# ಪರವಾನಗಿ ಸೂಚನೆ',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'ಎರಡೂ';

  @override
  String get settingsShuffleContentTypeFilter => 'ಷಫಲ್ ವಿಷಯದ ಪ್ರಕಾರದ ಫಿಲ್ಟರ್';

  @override
  String get settingsVideoPlaybackPreferences => 'ವೀಡಿಯೊ ಪ್ಲೇಬ್ಯಾಕ್ ಆದ್ಯತೆಗಳು';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'ಕೋರ್ ವೀಡಿಯೊ ಎಂಜಿನ್ ಮತ್ತು ಸ್ಟ್ರೀಮಿಂಗ್ ಗುಣಮಟ್ಟದ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get settingsAudioPreferences => 'ಆಡಿಯೋ ಪ್ರಾಶಸ್ತ್ಯಗಳು';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್‌ಗಳು, ಸಂಸ್ಕರಣೆ ಮತ್ತು ಪಾಸ್‌ಥ್ರೂ ಆಯ್ಕೆಗಳು';

  @override
  String get settingsAutomationAndQueue => 'ಆಟೊಮೇಷನ್ ಮತ್ತು ಕ್ಯೂ';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'ಸ್ವಯಂಚಾಲಿತ ಪ್ಲೇಬ್ಯಾಕ್ ಮತ್ತು ಅನುಕ್ರಮ';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'ಡೌನ್‌ಲೋಡ್ ಗುಣಮಟ್ಟ, ಸಂಗ್ರಹಣೆ ಮಿತಿಗಳು ಮತ್ತು ಸರತಿ ಗಾತ್ರ';

  @override
  String get settingsSyncplaySubtitle =>
      'ಗುಂಪು ಅವಧಿಗಳಿಗಾಗಿ ಸಿಂಕ್ರೊನೈಸೇಶನ್ ಲಾಜಿಕ್';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'ವಿಶೇಷ ಆಟಗಾರರ ವೈಶಿಷ್ಟ್ಯಗಳು. ಕೆಲವು ಆಯ್ಕೆಗಳು ಪ್ಲೇಬ್ಯಾಕ್ ಸಮಸ್ಯೆಗಳನ್ನು ಉಂಟುಮಾಡಬಹುದು, ಎಚ್ಚರಿಕೆಯಿಂದ ಬಳಸಿ';

  @override
  String get settingsSkipIntrosAndOutros =>
      'ಪರಿಚಯಗಳು ಮತ್ತು ಔಟ್ರೊಗಳನ್ನು ಬಿಟ್ಟುಬಿಡುವುದೇ?';

  @override
  String get settingsMediaSegmentCountdown => 'ಮಾಧ್ಯಮ ವಿಭಾಗ ಕೌಂಟ್‌ಡೌನ್';

  @override
  String get settingsProgressBar => 'ಪ್ರಗತಿ ಪಟ್ಟಿ';

  @override
  String get settingsTimer => 'ಟೈಮರ್';

  @override
  String get settingsNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get settingsPromptUser => 'ಪ್ರಾಂಪ್ಟ್ ಬಳಕೆದಾರ';

  @override
  String get settingsSkip => 'ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get settingsDoNothing => 'ಏನೂ ಮಾಡಬೇಡಿ';

  @override
  String get settingsMaxBitrateDescription =>
      'ಸ್ಟ್ರೀಮಿಂಗ್ ಬಿಟ್ರೇಟ್ ಅನ್ನು ಕ್ಯಾಪ್ ಮಾಡಿ. ಈ ಮಿತಿಯ ಮೇಲಿರುವ ವಿಷಯವನ್ನು ಸರಿಹೊಂದುವಂತೆ ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಮಾಡಲಾಗುತ್ತದೆ.';

  @override
  String get settingsMaxResolutionDescription =>
      'ಆಟಗಾರನು ವಿನಂತಿಸುವ ಗರಿಷ್ಠ ರೆಸಲ್ಯೂಶನ್ ಅನ್ನು ಮಿತಿಗೊಳಿಸಿ. ಹೆಚ್ಚಿನ ರೆಸಲ್ಯೂಶನ್ ವಿಷಯವನ್ನು ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಡೌನ್ ಮಾಡಲಾಗುತ್ತದೆ.';

  @override
  String get settingsPlayerZoomDescription =>
      'ಪರದೆಗೆ ಸರಿಹೊಂದುವಂತೆ ವೀಡಿಯೊವನ್ನು ಹೇಗೆ ಅಳೆಯಬೇಕು.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಎಂಜಿನ್ (ಆಂಡ್ರಾಯ್ಡ್ ಟಿವಿ)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV ಸಾಧನಗಳಲ್ಲಿ ಡೀಫಾಲ್ಟ್ ಪ್ಲೇಬ್ಯಾಕ್ ಎಂಜಿನ್ ಆಯ್ಕೆಮಾಡಿ. ಬದಲಾವಣೆಗಳು ಮುಂದಿನ ಪ್ಲೇಬ್ಯಾಕ್ ಸೆಶನ್‌ಗೆ ಅನ್ವಯಿಸುತ್ತವೆ.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (ಲೆಗಸಿ)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (ಪರಂಪರೆ)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision ಫಾಲ್‌ಬ್ಯಾಕ್';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision ಡಿಕೋಡಿಂಗ್ ಇಲ್ಲದ ಸಾಧನಗಳಲ್ಲಿ Dolby Vision ಶೀರ್ಷಿಕೆಗಳ ವರ್ತನೆ.';

  @override
  String get settingsAskEachTime => 'ಪ್ರತಿ ಬಾರಿಯೂ ಕೇಳಿ';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 ಫಾಲ್ಬ್ಯಾಕ್ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get settingsPreferServerTranscode =>
      'ಸರ್ವರ್ ಟ್ರಾನ್ಸ್‌ಕೋಡ್‌ಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision ಪ್ರೊಫೈಲ್ 7 ಡೈರೆಕ್ಟ್ ಪ್ಲೇ';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision ಪ್ರೊಫೈಲ್ 7 ವರ್ಧನೆ-ಪದರದ ಸ್ಟ್ರೀಮ್‌ಗಳು ನೇರವಾಗಿ ಪ್ಲೇ ಮಾಡಬೇಕೆ ಎಂಬುದನ್ನು ನಿಯಂತ್ರಿಸುತ್ತದೆ.';

  @override
  String get settingsAutoAftkrtEnabled => 'ಸ್ವಯಂ (AFTKRT ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ)';

  @override
  String get settingsEnabledOnThisDevice => 'ಈ ಸಾಧನದಲ್ಲಿ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get settingsDisabledPreferTranscode =>
      'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ (ಟ್ರಾನ್ಸ್‌ಕೋಡ್‌ಗೆ ಆದ್ಯತೆ)';

  @override
  String get settingsResumeRewindDescription =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಪುನರಾರಂಭಿಸುವಾಗ (ವೀಕ್ಷಿಸುವುದನ್ನು ಮುಂದುವರಿಸಿ ಅಥವಾ ಮಾಧ್ಯಮ ಐಟಂ ಪುಟದಿಂದ), ಎಷ್ಟು ಸೆಕೆಂಡುಗಳು ರಿವೈಂಡ್ ಮಾಡಬೇಕು?';

  @override
  String get settingsUnpauseRewindDescription =>
      'ವಿರಾಮ ಬಟನ್ ಒತ್ತಿದ ನಂತರ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಪುನರಾರಂಭಿಸುವಾಗ, ಎಷ್ಟು ಸೆಕೆಂಡುಗಳು ರಿವೈಂಡ್ ಮಾಡಬೇಕು?';

  @override
  String get settingsSkipBackLengthDescription =>
      'ರಿವೈಂಡ್ ಬಟನ್ ಒತ್ತಿದ ನಂತರ ಎಷ್ಟು ಸೆಕೆಂಡುಗಳು ಹಿಂದಕ್ಕೆ ಹೋಗಬೇಕು.';

  @override
  String get settingsOneSecond => '1 ಸೆಕೆಂಡ್';

  @override
  String get settingsThreeSeconds => '3 ಸೆಕೆಂಡುಗಳು';

  @override
  String get settingsFortyFiveSeconds => '45 ಸೆಕೆಂಡುಗಳು';

  @override
  String get settingsSixtySeconds => '60 ಸೆಕೆಂಡುಗಳು';

  @override
  String get settingsSkipForwardLengthDescription =>
      'ಫಾಸ್ಟ್ ಫಾರ್ವರ್ಡ್ ಬಟನ್ ಒತ್ತಿದ ನಂತರ ಎಷ್ಟು ಸೆಕೆಂಡುಗಳು ಮುಂದಕ್ಕೆ ಹೋಗಬೇಕು.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'ಬಿಟ್‌ಸ್ಟ್ರೀಮ್ AC3 ಬಾಹ್ಯ ಡಿಕೋಡರ್‌ಗೆ';

  @override
  String get settingsCinemaMode => 'ಸಿನಿಮಾ ಮೋಡ್';

  @override
  String get settingsCinemaModeSubtitle =>
      'ಮುಖ್ಯ ವೈಶಿಷ್ಟ್ಯದ ಮೊದಲು ಟ್ರೇಲರ್‌ಗಳು/ಪ್ರಿರೋಲ್‌ಗಳನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get settingsNextUpDisplayDescription =>
      'ವಿಸ್ತೃತವು ಸಂಚಿಕೆ ಕಲಾಕೃತಿ ಮತ್ತು ವಿವರಣೆಯೊಂದಿಗೆ ಪೂರ್ಣ ಕಾರ್ಡ್ ಅನ್ನು ತೋರಿಸುತ್ತದೆ. ಮಿನಿಮಲ್ ಕಾಂಪ್ಯಾಕ್ಟ್ ಕೌಂಟ್‌ಡೌನ್ ಓವರ್‌ಲೇ ಅನ್ನು ತೋರಿಸುತ್ತದೆ. ನಿಷ್ಕ್ರಿಯಗೊಳಿಸುವಿಕೆಯು ಪ್ರಾಂಪ್ಟ್ ಅನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಮರೆಮಾಡುತ್ತದೆ.';

  @override
  String get settingsShort => 'ಚಿಕ್ಕದು';

  @override
  String get settingsLong => 'ಉದ್ದ';

  @override
  String get settingsVeryLong => 'ಬಹಳ ಉದ್ದವಾಗಿದೆ';

  @override
  String get settingsVideoStartDelay => 'ವೀಡಿಯೊ ಪ್ರಾರಂಭ ವಿಳಂಬ';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'ಲೈವ್ ಟಿವಿ ನೇರ';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'ಲೈವ್ ಟಿವಿಗಾಗಿ ನೇರ ಪ್ಲೇ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get settingsOpenGroups => 'ಗುಂಪುಗಳನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay ಗುಂಪುಗಳನ್ನು ರಚಿಸಿ, ಸೇರಿಕೊಳ್ಳಿ ಅಥವಾ ನಿರ್ವಹಿಸಿ';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'ಗುಂಪು ವೀಕ್ಷಣೆ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get settingsSyncplayButton => 'SyncPlay ಬಟನ್';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'ನ್ಯಾವಿಗೇಶನ್ ಬಾರ್‌ನಲ್ಲಿ SyncPlay ಬಟನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsSyncplayAdvancedCorrection => 'ಸುಧಾರಿತ ತಿದ್ದುಪಡಿ';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'ಸೂಕ್ಷ್ಮವಾದ ಸಿಂಕ್ ಲಾಜಿಕ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get settingsSyncplaySyncCorrection => 'ಸಿಂಕ್ ತಿದ್ದುಪಡಿ';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'ಸಿಂಕ್‌ನಲ್ಲಿ ಉಳಿಯಲು ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಹೊಂದಿಸಿ';

  @override
  String get settingsSyncplaySpeedToSync => 'ಸಿಂಕ್ ಮಾಡಲು ವೇಗ';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'ಸಿಂಕ್ ಮಾಡಲು ಪ್ಲೇಬ್ಯಾಕ್ ವೇಗ ಹೊಂದಾಣಿಕೆಯನ್ನು ಬಳಸಿ';

  @override
  String get settingsSyncplaySkipToSync => 'ಸಿಂಕ್‌ಗೆ ತೆರಳಿ';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'ಸಿಂಕ್ ಮಾಡಲು ಹುಡುಕುವುದನ್ನು ಬಳಸಿ';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'ಕನಿಷ್ಠ ವೇಗ ವಿಳಂಬ';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'ಗರಿಷ್ಠ ವೇಗ ವಿಳಂಬ';

  @override
  String get settingsSyncplaySpeedDuration => 'ವೇಗದ ಅವಧಿ';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'ಕನಿಷ್ಠ ಸ್ಕಿಪ್ ವಿಳಂಬ';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay ಹೆಚ್ಚುವರಿ ಆಫ್‌ಸೆಟ್';

  @override
  String get onNow => 'ಈಗ';

  @override
  String get collections => 'ಸಂಗ್ರಹಣೆಗಳು';

  @override
  String get lastPlayed => 'ಕೊನೆಯದಾಗಿ ಆಡಿದ್ದು';

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
    return 'ಇತ್ತೀಚೆಗೆ ಬಿಡುಗಡೆಯಾದ $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'ಮುಂದಿನ ಸಂಚಿಕೆಯನ್ನು ಸ್ವಯಂ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'ಲಭ್ಯವಿದ್ದಾಗ ಮುಂದಿನ ಸಂಚಿಕೆಯನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಪ್ಲೇ ಮಾಡಿ.';

  @override
  String get skipSilenceTitle => 'ಮೌನವನ್ನು ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get skipSilenceSubtitle =>
      'ಸ್ಟ್ರೀಮ್ ಬೆಂಬಲಿಸಿದಾಗ ಮೌನ ಆಡಿಯೋ ವಿಭಾಗಗಳನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಬಿಟ್ಟುಬಿಡಿ.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'ಬಾಹ್ಯ ಆಡಿಯೋ ಪರಿಣಾಮಗಳನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'ಈಕ್ವಲೈಜರ್ ಮತ್ತು ಪರಿಣಾಮಗಳ ಆ್ಯಪ್‌ಗಳು (ಉದಾ. Wavelet) Media3 ಪ್ಲೇಬ್ಯಾಕ್ ಸೆಷನ್‌ಗಳಿಗೆ ಲಗತ್ತಿಸಲು ಅನುಮತಿಸಿ.';

  @override
  String get disableTunnelingTitle => 'ಟನೆಲಿಂಗ್ ಅನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get disableTunnelingSubtitle =>
      'ಟನೆಲ್ ಮಾಡದ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಒತ್ತಾಯಿಸಿ. ಟನೆಲಿಂಗ್ ಆಡಿಯೋ/ವಿಡಿಯೋ ಅಸಂಗತತೆ ಇರುವ ಸಾಧನಗಳಲ್ಲಿ ಉಪಯುಕ್ತ.';

  @override
  String get enableTunnelingTitle => 'ಟನೆಲಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get enableTunnelingSubtitle =>
      'ಸುಧಾರಿತ. ಆಡಿಯೋ ಮತ್ತು ವಿಡಿಯೋವನ್ನು ಜೋಡಿಸಿದ ಹಾರ್ಡ್‌ವೇರ್ ಮಾರ್ಗದ ಮೂಲಕ ರೂಟ್ ಮಾಡುತ್ತದೆ. ಕೆಲವು ಸಾಧನಗಳಲ್ಲಿ ಆಡಿಯೋ/ವಿಡಿಯೋ ಡ್ರಾಪ್‌ಔಟ್‌ಗಳಿಗೆ ಕಾರಣವಾಗುವುದರಿಂದ ಪೂರ್ವನಿಯೋಜಿತವಾಗಿ ಆಫ್ ಆಗಿದೆ.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision ಪ್ರೊಫೈಲ್ 7 ಅನ್ನು HEVC ಗೆ ಮ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'DV ಅಲ್ಲದ ಸಾಧನಗಳಲ್ಲಿ Dolby Vision ಪ್ರೊಫೈಲ್ 7 ಸ್ಟ್ರೀಮ್‌ಗಳನ್ನು HDR10-ಹೊಂದಾಣಿಕೆಯ HEVC ಆಗಿ ಪ್ಲೇ ಮಾಡಿ.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'ಎಂಬೆಡೆಡ್ ಉಪಶೀರ್ಷಿಕೆ ಶೈಲಿಗಳನ್ನು ಬಳಸಿ';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್‌ನಲ್ಲಿ ಎಂಬೆಡ್ ಮಾಡಿದ ಬಣ್ಣಗಳು, ಫಾಂಟ್‌ಗಳು ಮತ್ತು ಸ್ಥಾನೀಕರಣವನ್ನು ಅನ್ವಯಿಸಿ. ಬದಲಿಗೆ ನಿಮ್ಮ ಶೀರ್ಷಿಕೆ ಶೈಲಿ ಆದ್ಯತೆಗಳನ್ನು ಬಳಸಲು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'ಎಂಬೆಡೆಡ್ ಉಪಶೀರ್ಷಿಕೆ ಫಾಂಟ್ ಗಾತ್ರಗಳನ್ನು ಬಳಸಿ';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್‌ನಲ್ಲಿ ಎಂಬೆಡ್ ಮಾಡಿದ ಫಾಂಟ್-ಗಾತ್ರ ಸೂಚನೆಗಳನ್ನು ಅನ್ವಯಿಸಿ. ನಿಮ್ಮ ಶೈಲಿ ಆದ್ಯತೆಗಳಿಂದ ಉಪಶೀರ್ಷಿಕೆ ಗಾತ್ರವನ್ನು ಬಳಸಲು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get showMediaDetailsOnLibraryPage => 'ಮಾಧ್ಯಮ ವಿವರಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'ಲೈಬ್ರರಿ ಪುಟಗಳ ಮೇಲ್ಭಾಗದಲ್ಲಿ ಆಯ್ಕೆಮಾಡಿದ ಐಟಂನ ವಿವರಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get hideBackdropsInLibraries =>
      'ಬ್ರೌಸ್ ಮಾಡುವಾಗ ಬ್ಯಾಕ್‌ಡ್ರಾಪ್‌ಗಳನ್ನು ಮರೆಮಾಡುವುದೇ?';

  @override
  String get useDetailedSubHeadings => 'ವಿವರವಾದ ಉಪ-ಶೀರ್ಷಿಕೆಗಳನ್ನು ಬಳಸಿ';

  @override
  String get useDetailedSubHeadingsDescription =>
      'ಲೈಬ್ರರಿ ಪುಟಗಳಲ್ಲಿ ವಿವರವಾದ ಅಥವಾ ಕನಿಷ್ಠ ಉಪಸಾಲನ್ನು ತೋರಿಸಿ.';

  @override
  String get savedThemesDeleteDialogTitle => 'ಉಳಿಸಿದ ಥೀಮ್ ಅನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'ಈ ಸಾಧನ ಕ್ಯಾಶ್‌ನಿಂದ \"$themeName\" ಅನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';
  }

  @override
  String get themeStore => 'ಥೀಮ್ ಸ್ಟೋರ್';

  @override
  String get themeStoreSubtitle => 'ಸಮುದಾಯ ಥೀಮ್‌ಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ ಮತ್ತು ಉಳಿಸಿ';

  @override
  String get themeStoreDescription =>
      'ನಿಮ್ಮ ಇತರ ಉಳಿಸಿದ ಥೀಮ್‌ಗಳಂತೆ ಬಳಸಲು ಥೀಮ್ ಅನ್ನು ಉಳಿಸಿ.';

  @override
  String get themeStoreEmpty => 'ಸದ್ಯಕ್ಕೆ ಯಾವುದೇ ಥೀಮ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get themeStoreLoadFailed =>
      'ಥೀಮ್ ಸ್ಟೋರ್ ಅನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ನಿಮ್ಮ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get themeStoreSave => 'ಉಳಿಸಿ';

  @override
  String get themeStoreSaveAndApply => 'ಉಳಿಸಿ ಮತ್ತು ಅನ್ವಯಿಸಿ';

  @override
  String get themeStoreSaved => 'ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get themeStoreInvalidMessage =>
      'ಈ ಥೀಮ್ ಅನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" ಉಳಿಸಲಾಗಿದೆ.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'ಈ ಸಾಧನದಿಂದ \"$themeName\" ಅಳಿಸಲಾಗಿದೆ.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" ಅನ್ನು ಅಳಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';
  }

  @override
  String get savedThemesTitle => 'ಉಳಿಸಿದ ಥೀಮ್‌ಗಳು';

  @override
  String get savedThemesDescription =>
      'ಇವು ಪ್ರಸ್ತುತ ಸರ್ವರ್‌ಗಾಗಿ Moonfin ಪ್ಲಗಿನ್‌ನಿಂದ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಥೀಮ್‌ಗಳು. ಅಳಿಸುವಿಕೆಯು ಈ ಸ್ಥಳೀಯ ಪ್ರತಿಯನ್ನು ಮಾತ್ರ ತೆಗೆದುಹಾಕುತ್ತದೆ.';

  @override
  String get savedThemesEmpty =>
      'ಈ ಸರ್ವರ್‌ಗಾಗಿ ಯಾವುದೇ ಉಳಿಸಿದ ಥೀಮ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • ಪ್ರಸ್ತುತ ಸಕ್ರಿಯ';
  }

  @override
  String get savedThemesDeleteTooltip => 'ಉಳಿಸಿದ ಥೀಮ್ ಅನ್ನು ಅಳಿಸಿ';

  @override
  String get savedThemesManageSubtitle =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಪ್ಲಗಿನ್ ಥೀಮ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸಿ';

  @override
  String get themeEditor => 'ಥೀಮ್ ಎಡಿಟರ್';

  @override
  String get themeEditorSubtitle =>
      'ನಿಮ್ಮ ಬ್ರೌಸರ್‌ನಲ್ಲಿ Moonfin ಥೀಮ್ ಎಡಿಟರ್ ತೆರೆಯಿರಿ';

  @override
  String get homeScreen => 'ಹೋಮ್ ಪರದೆ';

  @override
  String get bottomBar => 'ಕೆಳಗಿನ ಪಟ್ಟಿ';

  @override
  String get homeRowsStyleClassic => 'ಕ್ಲಾಸಿಕ್';

  @override
  String get homeRowsStyleModern => 'ಮಾಡರ್ನ್';

  @override
  String get homeRowsSection => 'ಹೋಮ್ ಸಾಲುಗಳು';

  @override
  String get homeRowDisplay => 'ಹೋಮ್ ಸಾಲಿನ ಪ್ರದರ್ಶನ';

  @override
  String get homeRowSections => 'ಹೋಮ್ ಸಾಲಿನ ವಿಭಾಗಗಳು';

  @override
  String get homeRowToggles => 'ಹೋಮ್ ಸಾಲಿನ ಟಾಗಲ್‌ಗಳು';

  @override
  String get homeRowTogglesSubtitle =>
      'ಲೈಬ್ರರಿ ಆಧಾರಿತ ಹೋಮ್ ಸಾಲಿನ ವರ್ಗಗಳನ್ನು ಸಕ್ರಿಯ ಅಥವಾ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get homeRowTogglesDescription =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಸಾಲುಗಳನ್ನು ಪ್ರದರ್ಶಿಸಲು ಈ ಕೆಳಗಿನ ಟಾಗಲ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'ಕ್ಲಾಸಿಕ್ ಪ್ರತಿ-ಸಾಲಿನ ಚಿತ್ರ ಪ್ರಕಾರ ಮತ್ತು ಮಾಹಿತಿ ಓವರ್‌ಲೇ ಅನ್ನು ಉಳಿಸಿಕೊಳ್ಳುತ್ತದೆ. ಮಾಡರ್ನ್ ಪೋರ್ಟ್ರೇಟ್-ನಿಂದ-ಬ್ಯಾಕ್‌ಡ್ರಾಪ್ ಸಾಲುಗಳನ್ನು ಬಳಸುತ್ತದೆ.';

  @override
  String get displayFavoritesRows => 'ಮೆಚ್ಚಿನವುಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayFavoritesRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಮೆಚ್ಚಿನ ಚಲನಚಿತ್ರಗಳು, ಸರಣಿ ಮತ್ತು ಇತರ ಮೆಚ್ಚಿನ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get favoritesRowSorting => 'ಮೆಚ್ಚಿನವುಗಳ ಸಾಲಿನ ವಿಂಗಡಣೆ';

  @override
  String get favoritesRowSortingDescription =>
      'ಮೆಚ್ಚಿನವುಗಳ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get displayCollectionsRows => 'ಸಂಗ್ರಹಣೆಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayCollectionsRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಸಂಗ್ರಹಣೆಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get collectionsRowSorting => 'ಸಂಗ್ರಹಣೆಗಳ ಸಾಲಿನ ವಿಂಗಡಣೆ';

  @override
  String get collectionsRowSortingDescription =>
      'ಸಂಗ್ರಹಣೆಗಳ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get displayGenresRows => 'ಪ್ರಕಾರಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayGenresRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಪ್ರಕಾರಗಳ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get genresRowSorting => 'ಪ್ರಕಾರಗಳ ಸಾಲಿನ ವಿಂಗಡಣೆ';

  @override
  String get genresRowSortingDescription =>
      'ಪ್ರಕಾರಗಳ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get genresRowItems => 'ಪ್ರಕಾರಗಳ ಸಾಲಿನ ಐಟಂಗಳು';

  @override
  String get genresRowItemsDescription =>
      'ಪ್ರಕಾರಗಳ ಸಾಲುಗಳಲ್ಲಿ ಚಲನಚಿತ್ರಗಳು, ಸರಣಿ ಅಥವಾ ಎರಡನ್ನೂ ತೋರಿಸಿ.';

  @override
  String get displayPlaylistsRows => 'ಪ್ಲೇಪಟ್ಟಿ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಪ್ಲೇಪಟ್ಟಿ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get playlistsRowSorting => 'ಪ್ಲೇಪಟ್ಟಿ ಸಾಲಿನ ವಿಂಗಡಣೆ';

  @override
  String get playlistsRowSortingDescription =>
      'ಪ್ಲೇಪಟ್ಟಿ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get displayAudioRows => 'ಆಡಿಯೋ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get displayAudioRowsSubtitle =>
      'ಹೋಮ್ ವಿಭಾಗಗಳಲ್ಲಿ ಆಡಿಯೋ ಸಾಲುಗಳನ್ನು ತೋರಿಸಿ.';

  @override
  String get audioRowsSorting => 'ಆಡಿಯೋ ಸಾಲುಗಳ ವಿಂಗಡಣೆ';

  @override
  String get audioRowsSortingDescription =>
      'ಆಡಿಯೋ ಸಾಲುಗಳನ್ನು ಸೇರಿಸಿದ ದಿನಾಂಕ, ಬಿಡುಗಡೆ ದಿನಾಂಕ, ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ ಮತ್ತು ಇನ್ನಷ್ಟು ವಿಂಗಡಿಸಿ.';

  @override
  String get audioPlaylists => 'ಆಡಿಯೋ ಪ್ಲೇಪಟ್ಟಿಗಳು';

  @override
  String get appearance => 'ಗೋಚರತೆ';

  @override
  String get layout => 'ವಿನ್ಯಾಸ';

  @override
  String get theme => 'ಥೀಮ್';

  @override
  String get keyboard => 'ಕೀಬೋರ್ಡ್';

  @override
  String get navButtons => 'ಬಟನ್‌ಗಳು';

  @override
  String get rendering => 'ರೆಂಡರಿಂಗ್';

  @override
  String get mpvConfiguration => 'MPV ಕಾನ್ಫಿಗರೇಶನ್';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'ಬಾಹ್ಯ ಪ್ಲೇಯರ್ ಆ್ಯಪ್';

  @override
  String get externalPlayerAppDescription =>
      'ದೀರ್ಘ-ಒತ್ತಿ ಪ್ಲೇ ಆಯ್ಕೆಯನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲು ಬಾಹ್ಯ ಪ್ಲೇಯರ್ ಅನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ಪ್ರಾರಂಭವಾದಾಗ ಆ್ಯಪ್ ಆಯ್ಕೆದಾರವನ್ನು ತೋರಿಸಿ.';

  @override
  String get loadingInstalledPlayers =>
      'ಸ್ಥಾಪಿಸಿದ ಪ್ಲೇಯರ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get connection => 'ಸಂಪರ್ಕ';

  @override
  String get audioTranscodeTarget => 'ಆಡಿಯೋ ಟ್ರಾನ್ಸ್‌ಕೋಡ್ ಗುರಿ';

  @override
  String get passthrough => 'ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get supportedOnThisDevice => 'ಈ ಸಾಧನದಲ್ಲಿ ಬೆಂಬಲಿತ';

  @override
  String get notSupportedOnThisDevice => 'ಈ ಸಾಧನದಲ್ಲಿ ಬೆಂಬಲಿತವಿಲ್ಲ';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) ಅನ್ನು ಬಾಹ್ಯ ಡಿಕೋಡರ್‌ಗೆ ಬಿಟ್‌ಸ್ಟ್ರೀಮ್ ಮಾಡಿ.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Atmos (JOC) ನೊಂದಿಗೆ TrueHD ಪಾಸ್‌ಥ್ರೂ';

  @override
  String get mediaPlayerBehavior => 'ಮೀಡಿಯಾ ಪ್ಲೇಯರ್ ವರ್ತನೆ';

  @override
  String get playbackEnhancements => 'ಪ್ಲೇಬ್ಯಾಕ್ ವರ್ಧನೆಗಳು';

  @override
  String get alwaysOn => 'ಯಾವಾಗಲೂ ಆನ್.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'ಸ್ಕಿಪ್ ಔಟ್ರೊ ಬದಲಿಗೆ ಮುಂದಿನದು ಪ್ರದರ್ಶನ';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'ಸ್ಕಿಪ್ ಔಟ್ರೊ ಬಟನ್ ಬದಲಿಗೆ ಮುಂದಿನದು ಓವರ್‌ಲೇ ತೋರಿಸಿ.';

  @override
  String get playerRouting => 'ಪ್ಲೇಯರ್ ರೂಟಿಂಗ್';

  @override
  String get preferSoftwareDecoders => 'ಸಾಫ್ಟ್‌ವೇರ್ ಡಿಕೋಡರ್‌ಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'ಹಾರ್ಡ್‌ವೇರ್ ಡಿಕೋಡರ್‌ಗಳಿಗಿಂತ ಮೊದಲು FFmpeg (ಆಡಿಯೋ) ಮತ್ತು libgav1 (AV1) ಬಳಸಿ. HDMI ಆಡಿಯೋ ಪಾಸ್‌ಥ್ರೂ ಮುರಿದರೆ ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV ನಲ್ಲಿ ನೀವು ಆಯ್ಕೆಮಾಡಿದ ಬಾಹ್ಯ ಆ್ಯಪ್‌ನಲ್ಲಿ ವಿಡಿಯೋ ಪ್ಲೇಬ್ಯಾಕ್ ತೆರೆಯಿರಿ.';

  @override
  String get automaticQueuing => 'ಸ್ವಯಂಚಾಲಿತ ಕ್ಯೂಯಿಂಗ್';

  @override
  String get preferSdhSubtitles => 'SDH ಉಪಶೀರ್ಷಿಕೆಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'ಸ್ವಯಂ-ಆಯ್ಕೆ ಮಾಡುವಾಗ SDH/CC ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್‌ಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡಿ.';

  @override
  String get webDiagnostics => 'ವೆಬ್ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್';

  @override
  String get webDiagnosticsTitle => 'Moonfin ವೆಬ್ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್';

  @override
  String get webDiagnosticsIntro =>
      'ಬ್ರೌಸರ್ ಸಂಪರ್ಕ ಸಮಸ್ಯೆಗಳನ್ನು (CORS, ಮಿಶ್ರ ವಿಷಯ ಮತ್ತು ಅನ್ವೇಷಣಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳು) ಪತ್ತೆಹಚ್ಚಲು ಈ ಪುಟವನ್ನು ಬಳಸಿ.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'ಮಿಶ್ರ-ವಿಷಯ ವೈಫಲ್ಯ ಪತ್ತೆಯಾಗಿದೆ';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight ವೈಫಲ್ಯ ಪತ್ತೆಯಾಗಿದೆ';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'HTTPS ಪುಟವು HTTP ಸರ್ವರ್ URL ಅನ್ನು ಕರೆಯಲು ಪ್ರಯತ್ನಿಸುತ್ತಿರುವುದನ್ನು Moonfin ಪತ್ತೆ ಮಾಡಿದೆ. ಬ್ರೌಸರ್‌ಗಳು ಈ ವಿನಂತಿಯನ್ನು ನಿಮ್ಮ ಸರ್ವರ್ ತಲುಪುವ ಮೊದಲೇ ನಿರ್ಬಂಧಿಸುತ್ತವೆ.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'ಮಾಧ್ಯಮ ಸರ್ವರ್‌ನಲ್ಲಿ CORS ಅಥವಾ preflight ಹೆಡರ್‌ಗಳ ಕೊರತೆಯಿಂದ ಸಾಮಾನ್ಯವಾಗಿ ಉಂಟಾಗುವ ಬ್ರೌಸರ್-ಮಟ್ಟದ ವಿನಂತಿ ವೈಫಲ್ಯವನ್ನು Moonfin ಪತ್ತೆ ಮಾಡಿದೆ.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'ಗುರಿ URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'ವಿವರ: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'ಪ್ರಸ್ತುತ ರನ್‌ಟೈಮ್ ಸಂದರ್ಭ';

  @override
  String get webDiagnosticsOrigin => 'ಮೂಲ';

  @override
  String get webDiagnosticsScheme => 'ಸ್ಕೀಮ್';

  @override
  String get webDiagnosticsPluginMode => 'ಪ್ಲಗಿನ್ ಮೋಡ್';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC ಸ್ಕ್ಯಾನ್';

  @override
  String get webDiagnosticsForcedServerUrl => 'ಒತ್ತಾಯಿಸಿದ ಸರ್ವರ್ URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'ಡೀಫಾಲ್ಟ್ ಸರ್ವರ್ URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'ಅನ್ವೇಷಣಾ ಪ್ರಾಕ್ಸಿ URL';

  @override
  String get notConfigured => 'ಕಾನ್ಫಿಗರ್ ಮಾಡಿಲ್ಲ';

  @override
  String get webDiagnosticsMixedContent => 'ಮಿಶ್ರ ವಿಷಯ';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'ಈ ಪುಟವನ್ನು HTTPS ಮೂಲಕ ಲೋಡ್ ಮಾಡಲಾಗಿದೆ, ಆದರೆ ಕಾನ್ಫಿಗರ್ ಮಾಡಿದ ಒಂದು ಅಥವಾ ಹೆಚ್ಚು URL ಗಳು HTTP ಆಗಿವೆ. ಬ್ರೌಸರ್‌ಗಳು HTTPS ಪುಟಗಳು HTTP API ಗಳನ್ನು ಕರೆಯುವುದನ್ನು ನಿರ್ಬಂಧಿಸುತ್ತವೆ.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'ಪರಿಹಾರ: ನಿಮ್ಮ ಮಾಧ್ಯಮ ಸರ್ವರ್ ಅಥವಾ ಪ್ರಾಕ್ಸಿ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಅನ್ನು HTTPS ಮೂಲಕ ಒದಗಿಸಿ, ಅಥವಾ ವಿಶ್ವಾಸಾರ್ಹ ಸ್ಥಳೀಯ ನೆಟ್‌ವರ್ಕ್‌ಗಳಲ್ಲಿ ಮಾತ್ರ HTTP ಮೂಲಕ Moonfin ಲೋಡ್ ಮಾಡಿ.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'ಪ್ರಸ್ತುತ ರನ್‌ಟೈಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಂದ ಯಾವುದೇ ಸ್ಪಷ್ಟ ಮಿಶ್ರ-ವಿಷಯ ಕಾನ್ಫಿಗರೇಶನ್ ಪತ್ತೆಯಾಗಿಲ್ಲ.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS ಪರಿಶೀಲನಾ ಪಟ್ಟಿ';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin ನಲ್ಲಿ ಬ್ರೌಸರ್ ಮೂಲವನ್ನು ಅನುಮತಿಸಿ.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers ನಲ್ಲಿ Authorization, X-Emby-Authorization ಮತ್ತು X-Emby-Token ಅನ್ನು ಸೇರಿಸಿ.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• ಸ್ಟ್ರೀಮಿಂಗ್ ಮತ್ತು ಸೀಕ್ ವರ್ತನೆಗಾಗಿ Content-Range ಮತ್ತು Accept-Ranges ಅನ್ನು ಬಹಿರಂಗಪಡಿಸಿ.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight ವಿನಂತಿಗಳಿಗೆ 204 ಅನ್ನು ಹಿಂತಿರುಗಿಸಿ.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'ಉದಾಹರಣೆ ಹೆಡರ್ ಸ್ನಿಪೆಟ್ (nginx-ಶೈಲಿ)';

  @override
  String get note => 'ಗಮನಿಸಿ';

  @override
  String get webDiagnosticsNonWebNote =>
      'ಈ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್ ಮಾರ್ಗವು ವೆಬ್ ಬಿಲ್ಡ್‌ಗಳಿಗಾಗಿ ಉದ್ದೇಶಿಸಲಾಗಿದೆ. ನೀವು ಇದನ್ನು ಬೇರೆ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ನೋಡುತ್ತಿದ್ದರೆ, ಈ ಪರಿಶೀಲನೆಗಳು ಅನ್ವಯಿಸದೇ ಇರಬಹುದು.';

  @override
  String get backToServerSelect => 'ಸರ್ವರ್ ಆಯ್ಕೆಗೆ ಹಿಂತಿರುಗಿ';

  @override
  String get signOutAllUsers => 'ಎಲ್ಲಾ ಬಳಕೆದಾರರನ್ನು ಸೈನ್ ಔಟ್ ಮಾಡಿ';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'ಮೈಕ್ರೊಫೋನ್ ಅನುಮತಿ ಶಾಶ್ವತವಾಗಿ ನಿರಾಕರಿಸಲಾಗಿದೆ. ಸಿಸ್ಟಂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಇದನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get voiceSearchPermissionRequired =>
      'ಧ್ವನಿ ಹುಡುಕಾಟಕ್ಕೆ ಮೈಕ್ರೊಫೋನ್ ಅನುಮತಿ ಅಗತ್ಯವಿದೆ.';

  @override
  String get voiceSearchNoMatch => 'ಅದು ಅರ್ಥವಾಗಲಿಲ್ಲ. ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get voiceSearchNoSpeechDetected => 'ಯಾವುದೇ ಮಾತು ಪತ್ತೆಯಾಗಿಲ್ಲ.';

  @override
  String get voiceSearchMicrophoneError => 'ಮೈಕ್ರೊಫೋನ್ ದೋಷ.';

  @override
  String get voiceSearchNeedsInternet =>
      'ಧ್ವನಿ ಹುಡುಕಾಟಕ್ಕೆ ಇಂಟರ್ನೆಟ್ ಅಗತ್ಯವಿದೆ.';

  @override
  String get voiceSearchServiceBusy =>
      'ಧ್ವನಿ ಸೇವೆ ಕಾರ್ಯನಿರತವಾಗಿದೆ. ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'ಮೈಕ್ರೊಫೋನ್ ಅನುಮತಿ ಶಾಶ್ವತವಾಗಿ ನಿರಾಕರಿಸಲಾಗಿದೆ.';

  @override
  String get microphonePermissionDenied => 'ಮೈಕ್ರೊಫೋನ್ ಅನುಮತಿ ನಿರಾಕರಿಸಲಾಗಿದೆ.';

  @override
  String get speechRecognitionUnavailable =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಮಾತು ಗುರುತಿಸುವಿಕೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get openIosRoutePicker => 'iOS ಮಾರ್ಗ ಆಯ್ಕೆದಾರವನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get airPlayRoutePickerUnavailable =>
      'ಈ ಸಾಧನದಲ್ಲಿ AirPlay ಮಾರ್ಗ ಆಯ್ಕೆದಾರ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get videos => 'ವಿಡಿಯೋಗಳು';

  @override
  String get programs => 'ಪ್ರೋಗ್ರಾಂಗಳು';

  @override
  String get songs => 'ಹಾಡುಗಳು';

  @override
  String get photoAlbums => 'ಫೋಟೋ ಆಲ್ಬಮ್‌ಗಳು';

  @override
  String get photos => 'ಫೋಟೋಗಳು';

  @override
  String get people => 'ಜನರು';

  @override
  String get recentlyReleasedEpisodes => 'ಇತ್ತೀಚೆಗೆ ಬಿಡುಗಡೆಯಾದ ಸಂಚಿಕೆಗಳು';

  @override
  String get watchAgain => 'ಮತ್ತೆ ವೀಕ್ಷಿಸಿ';

  @override
  String get guestAppearances => 'ಅತಿಥಿ ಪಾತ್ರಗಳು';

  @override
  String get appearancesSeerr => 'ಪಾತ್ರಗಳು (Seerr)';

  @override
  String get crewContributionsSeerr => 'ಸಿಬ್ಬಂದಿ ಕೊಡುಗೆಗಳು (Seerr)';

  @override
  String get watchWithGroup => 'ಗುಂಪಿನೊಂದಿಗೆ ವೀಕ್ಷಿಸಿ';

  @override
  String get errors => 'ದೋಷಗಳು';

  @override
  String get warnings => 'ಎಚ್ಚರಿಕೆಗಳು';

  @override
  String get disk => 'ಡಿಸ್ಕ್';

  @override
  String get openInBrowser => 'ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯಿರಿ';

  @override
  String get embeddedBrowserNotAvailable =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ ಎಂಬೆಡೆಡ್ ಬ್ರೌಸರ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminRestartServerConfirmation =>
      'ಸರ್ವರ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';

  @override
  String get adminShutdownServerConfirmation =>
      'ಸರ್ವರ್ ಅನ್ನು ಸ್ಥಗಿತಗೊಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ? ನೀವು ಅದನ್ನು ಹಸ್ತಚಾಲಿತವಾಗಿ ಮರುಪ್ರಾರಂಭಿಸಬೇಕಾಗುತ್ತದೆ.';

  @override
  String get internal => 'ಆಂತರಿಕ';

  @override
  String get idle => 'ನಿಷ್ಕ್ರಿಯ';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'ಯಾವುದೇ ಬಳಕೆದಾರರು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminNoUsersMatchSearch =>
      'ನಿಮ್ಮ ಹುಡುಕಾಟಕ್ಕೆ ಯಾವುದೇ ಬಳಕೆದಾರರು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get adminNoDevicesFound => 'ಯಾವುದೇ ಸಾಧನಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'ಪ್ರಸ್ತುತ ಫಿಲ್ಟರ್‌ಗಳಿಗೆ ಯಾವುದೇ ಸಾಧನಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get passwordSet => 'ಪಾಸ್‌ವರ್ಡ್ ಹೊಂದಿಸಲಾಗಿದೆ';

  @override
  String get noPasswordConfigured => 'ಯಾವುದೇ ಪಾಸ್‌ವರ್ಡ್ ಕಾನ್ಫಿಗರ್ ಮಾಡಿಲ್ಲ';

  @override
  String get remoteAccess => 'ರಿಮೋಟ್ ಪ್ರವೇಶ';

  @override
  String get localOnly => 'ಸ್ಥಳೀಯ ಮಾತ್ರ';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'ಮಾಧ್ಯಮ ವಿಶ್ಲೇಷಣೆಯನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'ಎಲ್ಲಾ ಮಾಧ್ಯಮ ಲೈಬ್ರರಿಗಳ ಸಂಯೋಜಿತ ವಿಶ್ಲೇಷಣೆ.';

  @override
  String get analyticsTopArtists => 'ಪ್ರಮುಖ ಕಲಾವಿದರು';

  @override
  String get analyticsTopAuthors => 'ಪ್ರಮುಖ ಲೇಖಕರು';

  @override
  String get analyticsTopContributors => 'ಪ್ರಮುಖ ಕೊಡುಗೆದಾರರು';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಲೈಬ್ರರಿಗಳು',
      one: '1 ಲೈಬ್ರರಿ',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'ಈ ಆಯ್ಕೆಗಾಗಿ ಇನ್ನೂ ಯಾವುದೇ ಇಂಡೆಕ್ಸ್ ಮಾಡಿದ ಮಾಧ್ಯಮ ಒಟ್ಟುಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get analyticsLibraryDetails => 'ಲೈಬ್ರರಿ ವಿವರಗಳು';

  @override
  String get analyticsLibraryBreakdown => 'ಲೈಬ್ರರಿ ವಿಭಜನೆ';

  @override
  String get analyticsNoLibrariesAvailable => 'ಯಾವುದೇ ಲೈಬ್ರರಿಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get adminServerAdministrationTitle => 'ಸರ್ವರ್ ಆಡಳಿತ';

  @override
  String get adminServerPathData => 'ಡೇಟಾ';

  @override
  String get adminServerPathImageCache => 'ಚಿತ್ರ ಕ್ಯಾಶ್';

  @override
  String get adminServerPathCache => 'ಕ್ಯಾಶ್';

  @override
  String get adminServerPathLogs => 'ಲಾಗ್‌ಗಳು';

  @override
  String get adminServerPathMetadata => 'ಮೆಟಾಡೇಟಾ';

  @override
  String get adminServerPathTranscode => 'ಟ್ರಾನ್ಸ್‌ಕೋಡ್';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'ಈ ಸರ್ವರ್ ಯಾವುದೇ ಸರ್ವರ್ ಪಥಗಳನ್ನು ಹಿಂತಿರುಗಿಸಲಿಲ್ಲ.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ಬಳಸಲಾಗಿದೆ';
  }

  @override
  String get userActivity => 'ಬಳಕೆದಾರ ಚಟುವಟಿಕೆ';

  @override
  String get systemEvents => 'ಸಿಸ್ಟಂ ಈವೆಂಟ್‌ಗಳು';

  @override
  String get needsAttention => 'ಗಮನ ಅಗತ್ಯವಿದೆ';

  @override
  String get adminDrawerSectionServer => 'ಸರ್ವರ್';

  @override
  String get adminDrawerSectionPlayback => 'ಪ್ಲೇಬ್ಯಾಕ್';

  @override
  String get adminDrawerSectionDevices => 'ಸಾಧನಗಳು';

  @override
  String get adminDrawerSectionAdvanced => 'ಸುಧಾರಿತ';

  @override
  String get adminDrawerSectionPlugins => 'ಪ್ಲಗಿನ್‌ಗಳು';

  @override
  String get adminDrawerSectionLiveTv => 'ಲೈವ್ ಟಿವಿ';

  @override
  String get homeVideos => 'ಹೋಮ್ ವಿಡಿಯೋಗಳು';

  @override
  String get mixedContent => 'ಮಿಶ್ರ ವಿಷಯ';

  @override
  String get homeVideosAndPhotos => 'ಹೋಮ್ ವಿಡಿಯೋಗಳು ಮತ್ತು ಫೋಟೋಗಳು';

  @override
  String get mixedMoviesAndShows => 'ಮಿಶ್ರ ಚಲನಚಿತ್ರಗಳು ಮತ್ತು ಶೋಗಳು';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'ಯಾವುದೇ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension ಆರ್ಕೈವ್ ಒಳಗೆ ಯಾವುದೇ ಚಿತ್ರ ಪುಟಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'ಎಂಬೆಡೆಡ್ ರೆಂಡರರ್ ವಿಫಲವಾಗಿದೆ ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB ರೆಂಡರರ್ ವಿಫಲವಾಗಿದೆ ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'ರೀಡರ್‌ಗೆ ಸ್ಥಳೀಯ ಫೈಲ್ ಕಾಣೆಯಾಗಿದೆ: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri ನಿಂದ ಪುಸ್ತಕ ಡೇಟಾ ತೆರೆಯುವಾಗ HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'ಯಾವುದೇ ಓದಬಹುದಾದ ಪುಸ್ತಕ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'ಬೆಂಬಲಿಸದ ಕಾಮಿಕ್ ಆರ್ಕೈವ್ ಸ್ವರೂಪ: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ CBR ಹೊರತೆಗೆಯುವಿಕೆ ಪ್ಲಗಿನ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr ಆರ್ಕೈವ್ ಅನ್ನು ಹೊರತೆಗೆಯಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get cb7ExtractionUnavailable =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ CB7 ಹೊರತೆಗೆಯುವಿಕೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'ಈ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ನಲ್ಲಿ CB7 ಹೊರತೆಗೆಯುವಿಕೆ ಪ್ಲಗಿನ್ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get closeGenrePanel => 'ಪ್ರಕಾರ ಫಲಕವನ್ನು ಮುಚ್ಚಿ';

  @override
  String get loadingShuffle => 'ಷಫಲ್ ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get libraryShuffleLabel => 'ಲೈಬ್ರರಿ ಷಫಲ್';

  @override
  String get randomShuffleLabel => 'ಯಾದೃಚ್ಛಿಕ ಷಫಲ್';

  @override
  String get genresShuffleLabel => 'ಪ್ರಕಾರಗಳ ಷಫಲ್';

  @override
  String get autoHdrSwitching => 'ಸ್ವಯಂ HDR ಬದಲಾವಣೆ';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR ವಿಡಿಯೋ ಪ್ಲೇಬ್ಯಾಕ್‌ಗಾಗಿ HDR ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಕ್ರಿಯಗೊಳಿಸಿ ಮತ್ತು ನಿರ್ಗಮಿಸಿದಾಗ ಪ್ರದರ್ಶನ ಮೋಡ್ ಅನ್ನು ಮರುಸ್ಥಾಪಿಸಿ.';

  @override
  String get whenFullscreen => 'ಪೂರ್ಣಪರದೆಯಲ್ಲಿದ್ದಾಗ';

  @override
  String get changeArtwork => 'ಕಲಾಕೃತಿಯನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get missing => 'ಕಾಣೆಯಾಗಿದೆ';

  @override
  String get transcodingLimits => 'ಟ್ರಾನ್ಸ್‌ಕೋಡಿಂಗ್ ಮಿತಿಗಳು';

  @override
  String get clearAllArtworkButton => 'ಎಲ್ಲಾ ಕಲಾಕೃತಿಯನ್ನು ತೆರವುಗೊಳಿಸುವುದೇ?';

  @override
  String get clearAllArtworkWarning =>
      'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿದ ಎಲ್ಲಾ ಕಲಾಕೃತಿಯನ್ನು ತೆರವುಗೊಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';

  @override
  String get confirmClear => 'ತೆರವುಗೊಳಿಸುವಿಕೆಯನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String confirmClearMessage(String itemType) {
    return 'ಈ $itemType ಅನ್ನು ತೆರವುಗೊಳಿಸಲು ನಿಮಗೆ ಖಚಿತವೇ?';
  }

  @override
  String get uploadButton => 'ಅಪ್‌ಲೋಡ್ ಮಾಡುವುದೇ?';

  @override
  String get resolutionLabel => 'ರೆಸಲ್ಯೂಶನ್: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'ಇಂಟರ್‌ಫೇಸ್ ಭಾಷೆಯಲ್ಲಿ ಮಾತ್ರ ಕಲಾಕೃತಿಯನ್ನು ತೋರಿಸಿ';

  @override
  String get confirmClearAll => 'ಎಲ್ಲವನ್ನೂ ತೆರವುಗೊಳಿಸುವುದನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get imageUploadSuccess => 'ಚಿತ್ರವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ!';

  @override
  String imageUploadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಹೊಂದಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'ಚಿತ್ರವನ್ನು ಅಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'ಎಲ್ಲಾ ಕಲಾಕೃತಿಯನ್ನು ತೆರವುಗೊಳಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get yes => 'ಹೌದು';

  @override
  String get posterCategory => 'ಪೋಸ್ಟರ್';

  @override
  String get backdropsCategory => 'ಬ್ಯಾಕ್‌ಡ್ರಾಪ್‌ಗಳು';

  @override
  String get bannerCategory => 'ಬ್ಯಾನರ್';

  @override
  String get logoCategory => 'ಲೋಗೋ';

  @override
  String get thumbnailCategory => 'ಥಂಬ್‌ನೇಲ್';

  @override
  String get artCategory => 'ಆರ್ಟ್';

  @override
  String get discArtCategory => 'ಡಿಸ್ಕ್ ಆರ್ಟ್';

  @override
  String get screenshotCategory => 'ಸ್ಕ್ರೀನ್‌ಶಾಟ್';

  @override
  String get boxCoverCategory => 'ಬಾಕ್ಸ್ ಕವರ್';

  @override
  String get boxRearCoverCategory => 'ಬಾಕ್ಸ್ ಹಿಂಬದಿ ಕವರ್';

  @override
  String get menuArtCategory => 'ಮೆನು ಆರ್ಟ್';

  @override
  String get confirmItemPoster => 'ಪೋಸ್ಟರ್';

  @override
  String get confirmItemBackdrop => 'ಬ್ಯಾಕ್‌ಡ್ರಾಪ್';

  @override
  String get confirmItemBanner => 'ಬ್ಯಾನರ್';

  @override
  String get confirmItemLogo => 'ಲೋಗೋ';

  @override
  String get confirmItemThumbnail => 'ಥಂಬ್‌ನೇಲ್';

  @override
  String get confirmItemArt => 'ಆರ್ಟ್';

  @override
  String get confirmItemDiscArt => 'ಡಿಸ್ಕ್ ಆರ್ಟ್';

  @override
  String get confirmItemScreenshot => 'ಸ್ಕ್ರೀನ್‌ಶಾಟ್';

  @override
  String get confirmItemBoxCover => 'ಬಾಕ್ಸ್ ಕವರ್';

  @override
  String get confirmItemBoxRearCover => 'ಬಾಕ್ಸ್ ಹಿಂಬದಿ ಕವರ್';

  @override
  String get confirmItemMenuArt => 'ಮೆನು ಆರ್ಟ್';

  @override
  String get resolutionAll => 'ಎಲ್ಲಾ';

  @override
  String get resolutionHigh => 'ಹೆಚ್ಚು (1080p+)';

  @override
  String get resolutionMedium => 'ಮಧ್ಯಮ (720p)';

  @override
  String get resolutionLow => 'ಕಡಿಮೆ (<720p)';

  @override
  String get sources => 'ಮೂಲಗಳು';

  @override
  String get audiobookChapters => 'ಅಧ್ಯಾಯಗಳು';

  @override
  String get audiobookBookmarks => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳು';

  @override
  String get audiobookNotes => 'ಟಿಪ್ಪಣಿಗಳು';

  @override
  String get audiobookQueue => 'ಸರತಿ';

  @override
  String get audiobookTimeline => 'ಟೈಮ್‌ಲೈನ್';

  @override
  String get audiobookTimelineEmpty => 'ಟೈಮ್‌ಲೈನ್ ಖಾಲಿಯಾಗಿದೆ';

  @override
  String get audiobookWholeBook => 'ಸಂಪೂರ್ಣ ಪುಸ್ತಕ';

  @override
  String get audiobookFocusedTimeline => 'ಕೇಂದ್ರೀಕೃತ ಟೈಮ್‌ಲೈನ್';

  @override
  String get audiobookExportBookmarks => 'ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳನ್ನು ರಫ್ತು ಮಾಡಿ';

  @override
  String get audiobookExportNotes => 'ಟಿಪ್ಪಣಿಗಳನ್ನು ರಫ್ತು ಮಾಡಿ';

  @override
  String get audiobookExportAll => 'ಎಲ್ಲವನ್ನೂ ರಫ್ತು ಮಾಡಿ';

  @override
  String audiobookExportSuccess(String path) {
    return '$path ಗೆ ರಫ್ತು ಮಾಡಲಾಗಿದೆ';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'ರಫ್ತು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get audiobookLyrics => 'ಸಾಹಿತ್ಯ';

  @override
  String get audiobookAddBookmark => 'ಬುಕ್‌ಮಾರ್ಕ್ ಸೇರಿಸಿ';

  @override
  String get audiobookAddNote => 'ಟಿಪ್ಪಣಿ ಸೇರಿಸಿ';

  @override
  String get audiobookEditNote => 'ಟಿಪ್ಪಣಿ ಸಂಪಾದಿಸಿ';

  @override
  String get audiobookNoteHint => 'ಈ ಕ್ಷಣಕ್ಕಾಗಿ ಟಿಪ್ಪಣಿ ಬರೆಯಿರಿ';

  @override
  String get audiobookSleepTimer => 'ಸ್ಲೀಪ್ ಟೈಮರ್';

  @override
  String get audiobookSleepOff => 'ಆಫ್';

  @override
  String get audiobookSleepEndOfChapter => 'ಅಧ್ಯಾಯದ ಕೊನೆ';

  @override
  String get audiobookSleepCustom => 'ಕಸ್ಟಮ್';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining ಬಾಕಿ';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ನಿಮಿ',
      one: '1 ನಿಮಿ',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'ಪ್ಲೇಬ್ಯಾಕ್ ವೇಗ';

  @override
  String get audiobookRemainingTime => 'ಬಾಕಿ';

  @override
  String get audiobookElapsedTime => 'ಕಳೆದದ್ದು';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$secondsಸೆ ಹಿಂದೆ';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$secondsಸೆ ಮುಂದೆ';
  }

  @override
  String get audiobookPreviousChapter => 'ಹಿಂದಿನ ಅಧ್ಯಾಯ';

  @override
  String get audiobookNextChapter => 'ಮುಂದಿನ ಅಧ್ಯಾಯ';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$total ರಲ್ಲಿ ಅಧ್ಯಾಯ $current';
  }

  @override
  String get audiobookNoChapters => 'ಯಾವುದೇ ಅಧ್ಯಾಯಗಳಿಲ್ಲ';

  @override
  String get audiobookNoBookmarks => 'ಇನ್ನೂ ಯಾವುದೇ ಬುಕ್‌ಮಾರ್ಕ್‌ಗಳಿಲ್ಲ';

  @override
  String get audiobookNoNotes => 'ಇನ್ನೂ ಯಾವುದೇ ಟಿಪ್ಪಣಿಗಳಿಲ್ಲ';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position ನಲ್ಲಿ ಬುಕ್‌ಮಾರ್ಕ್ ಸೇರಿಸಲಾಗಿದೆ';
  }

  @override
  String get audiobookSpeedReset => '1.0x ಗೆ ಮರುಹೊಂದಿಸಿ';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'ಉಳಿಸಿ';

  @override
  String get audiobookCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get audiobookDelete => 'ಅಳಿಸಿ';

  @override
  String get subtitlePreferences => 'ಉಪಶೀರ್ಷಿಕೆ ಆದ್ಯತೆಗಳು';

  @override
  String get subtitlePreferencesDescription =>
      'ಉಪಶೀರ್ಷಿಕೆ ಮೋಡ್‌ಗಳು, ಡೀಫಾಲ್ಟ್ ಭಾಷೆಗಳು, ಗೋಚರತೆ ಮತ್ತು ರೆಂಡರಿಂಗ್ ಆಯ್ಕೆಗಳನ್ನು ಬದಲಾಯಿಸಿ.';

  @override
  String get subtitleRendering => 'ಉಪಶೀರ್ಷಿಕೆ ರೆಂಡರಿಂಗ್';

  @override
  String get displayOptions => 'ಪ್ರದರ್ಶನ ಆಯ್ಕೆಗಳು';

  @override
  String get releaseDateAscending => 'ಬಿಡುಗಡೆ ದಿನಾಂಕ (ಆರೋಹಣ)';

  @override
  String get releaseDateDescending => 'ಬಿಡುಗಡೆ ದಿನಾಂಕ (ಅವರೋಹಣ)';

  @override
  String get groupContributions => 'ಕೊಡುಗೆಗಳನ್ನು ಗುಂಪು ಮಾಡಿ';

  @override
  String get groupMultipleRoles => 'ಬಹು ಪಾತ್ರಗಳನ್ನು ಗುಂಪು ಮಾಡಿ';

  @override
  String get libraryWriteAccessWarningTitle => 'ಲೈಬ್ರರಿ ಬರೆಯುವ ಪ್ರವೇಶ ಎಚ್ಚರಿಕೆ';

  @override
  String get libraryWriteAccessHowToFix => 'ಇದನ್ನು ಸರಿಪಡಿಸುವುದು ಹೇಗೆ:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. ಸರ್ವರ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಮಾಧ್ಯಮ ಲೈಬ್ರರಿ ಫೋಲ್ಡರ್‌ಗಳಿಗಾಗಿ Jellyfin ಸೇವಾ ಬಳಕೆದಾರರಿಗೆ (ಉದಾ. jellyfin ಅಥವಾ Docker PUID/PGID) ಬರೆಯುವ ಅನುಮತಿಗಳನ್ನು ನೀಡಿ.\n\n2. ಅಥವಾ, ನಿಮ್ಮ Jellyfin ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ -> Libraries ಗೆ ಹೋಗಿ, ಈ ಲೈಬ್ರರಿಯನ್ನು ಸಂಪಾದಿಸಿ, ಮತ್ತು Jellyfin ನ ಆಂತರಿಕ ಡೇಟಾಬೇಸ್‌ನಲ್ಲಿ ಕಲಾಕೃತಿಯನ್ನು ಸಂಗ್ರಹಿಸಲು \'Save artwork into media folders\' ಅನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get dismiss => 'ವಜಾಗೊಳಿಸಿ';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'ನಿಮ್ಮ \'$libraryName\' ಲೈಬ್ರರಿಯನ್ನು ಕಲಾಕೃತಿಯನ್ನು ನೇರವಾಗಿ ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಲು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ (\'Save artwork into media folders\' ಸಕ್ರಿಯಗೊಂಡಿದೆ). ಆದಾಗ್ಯೂ, Jellyfin ಬರೆಯುವ ಪ್ರವೇಶವನ್ನು ಪರೀಕ್ಷಿಸಿದೆ ಮತ್ತು ಈ ಡೈರೆಕ್ಟರಿಗೆ ಫೈಲ್‌ಗಳನ್ನು ಬರೆಯಲು ಅನುಮತಿ ಇಲ್ಲ:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin ಕಲಾಕೃತಿಯನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾದಂತೆ ಕಾಣುತ್ತದೆ. ನಿಮ್ಮ ಲೈಬ್ರರಿಯನ್ನು ಕಲಾಕೃತಿಯನ್ನು ನೇರವಾಗಿ ಮಾಧ್ಯಮ ಫೋಲ್ಡರ್‌ಗಳಲ್ಲಿ ಉಳಿಸಲು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ (\'Save artwork into media folders\' ಸಕ್ರಿಯಗೊಂಡಿದೆ). Jellyfin ಸರ್ವರ್ ಪ್ರಕ್ರಿಯೆಗೆ ನಿಮ್ಮ ಮಾಧ್ಯಮ ಡೈರೆಕ್ಟರಿಗಳಿಗೆ ಫೈಲ್‌ಗಳನ್ನು ಬರೆಯಲು ಅನುಮತಿ ಇಲ್ಲದಿದ್ದಾಗ ಈ ದೋಷ ಸಾಮಾನ್ಯವಾಗಿ ಸಂಭವಿಸುತ್ತದೆ.';

  @override
  String get externalLists => 'ಬಾಹ್ಯ ಪಟ್ಟಿಗಳು';

  @override
  String get replay => 'ಮತ್ತೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get fileInformation => 'ಫೈಲ್ ಮಾಹಿತಿ';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'ಗಾತ್ರ: $size  •  ಸ್ವರೂಪ: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'ಎಲ್ಲಾ ($count) ಆಡಿಯೋ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ತೋರಿಸಿ';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'ಎಲ್ಲಾ ($count) ಉಪಶೀರ್ಷಿಕೆ ಟ್ರ್ಯಾಕ್‌ಗಳನ್ನು ತೋರಿಸಿ';
  }

  @override
  String get checkingDirectPlay =>
      'ಡೈರೆಕ್ಟ್ ಪ್ಲೇ ಸಾಮರ್ಥ್ಯವನ್ನು ಪರಿಶೀಲಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get directPlayCapabilityLabel => 'ಡೈರೆಕ್ಟ್ ಪ್ಲೇ ಸಾಮರ್ಥ್ಯ: ';

  @override
  String get forced => 'ಫೋರ್ಸ್ಡ್';

  @override
  String get transcodeContainerNotSupported =>
      'ಕಂಟೇನರ್ ಸ್ವರೂಪವನ್ನು ಪ್ಲೇಯರ್ ಬೆಂಬಲಿಸುವುದಿಲ್ಲ.';

  @override
  String get transcodeVideoCodecNotSupported => 'ವಿಡಿಯೋ ಕೊಡೆಕ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeAudioCodecNotSupported => 'ಆಡಿಯೋ ಕೊಡೆಕ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'ಉಪಶೀರ್ಷಿಕೆ ಸ್ವರೂಪ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ (ಬರ್ನಿಂಗ್ ಅಗತ್ಯವಿದೆ).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'ಆಡಿಯೋ ಪ್ರೊಫೈಲ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'ವಿಡಿಯೋ ಪ್ರೊಫೈಲ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoLevelNotSupported => 'ವಿಡಿಯೋ ಲೆವೆಲ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'ಈ ಸಾಧನದಲ್ಲಿ ವಿಡಿಯೋ ರೆಸಲ್ಯೂಶನ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'ವಿಡಿಯೋ ಬಿಟ್ ಆಳ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'ವಿಡಿಯೋ ಫ್ರೇಮ್‌ರೇಟ್ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'ಫೈಲ್ ಬಿಟ್‌ರೇಟ್ ಪ್ಲೇಯರ್ ಸ್ಟ್ರೀಮಿಂಗ್ ಮಿತಿಯನ್ನು ಮೀರಿದೆ.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'ವಿಡಿಯೋ ಬಿಟ್‌ರೇಟ್ ಸ್ಟ್ರೀಮಿಂಗ್ ಮಿತಿಯನ್ನು ಮೀರಿದೆ.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'ಆಡಿಯೋ ಬಿಟ್‌ರೇಟ್ ಸ್ಟ್ರೀಮಿಂಗ್ ಮಿತಿಯನ್ನು ಮೀರಿದೆ.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'ಆಡಿಯೋ ಚಾನೆಲ್‌ಗಳ ಸಂಖ್ಯೆ ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String get sortAlphabetical => 'ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ';

  @override
  String get sortReleaseAscending => 'ಬಿಡುಗಡೆ ಕ್ರಮ (ಆರೋಹಣ)';

  @override
  String get sortReleaseDescending => 'ಬಿಡುಗಡೆ ಕ್ರಮ (ಅವರೋಹಣ)';

  @override
  String get sortCustomDragDrop => 'ಕಸ್ಟಮ್ (ಎಳೆದು-ಬಿಡಿ)';

  @override
  String get playlistSortOptions => 'ಪ್ಲೇಪಟ್ಟಿ ವಿಂಗಡಣೆ ಆಯ್ಕೆಗಳು';

  @override
  String get resetSort => 'ವಿಂಗಡಣೆಯನ್ನು ಮರುಹೊಂದಿಸಿ';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode ಅನ್ನು ಮತ್ತೆ ವೀಕ್ಷಿಸಿ';
  }

  @override
  String get rewatchPlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ಮತ್ತೆ ವೀಕ್ಷಿಸಿ';

  @override
  String get noSubtitlesFound => 'ಯಾವುದೇ ಉಪಶೀರ್ಷಿಕೆಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get adminControls => 'ನಿರ್ವಾಹಕ ನಿಯಂತ್ರಣಗಳು';

  @override
  String get impellerRendering => 'ರೆಂಡರಿಂಗ್ ಎಂಜಿನ್ (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller ಎಂಬುದು ಸುಗಮ ಅನಿಮೇಶನ್‌ಗಳು ಮತ್ತು ಕಡಿಮೆ ಸ್ಟಟರ್‌ಗಾಗಿ Flutter ನ ಆಧುನಿಕ GPU ರೆಂಡರರ್. ಕೆಲವು TV ಬಾಕ್ಸ್‌ಗಳು ಮತ್ತು ಹಳೆಯ GPU ಗಳಲ್ಲಿ ಇದು ಗ್ಲಿಚ್‌ಗಳು ಅಥವಾ ಕಪ್ಪು ವಿಡಿಯೋಗೆ ಕಾರಣವಾಗಬಹುದು; ಅವು ಕಂಡುಬಂದರೆ ಇದನ್ನು ಆಫ್ ಮಾಡಿ. ಸ್ವಯಂಚಾಲಿತವು ನಿಮ್ಮ ಸಾಧನಕ್ಕೆ ಅತ್ಯುತ್ತಮ ಡೀಫಾಲ್ಟ್ ಆಯ್ಕೆಮಾಡುತ್ತದೆ. ಅನ್ವಯಿಸಲು Moonfin ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get impellerAuto => 'ಸ್ವಯಂಚಾಲಿತ';

  @override
  String get impellerOn => 'ಆನ್';

  @override
  String get impellerOff => 'ಆಫ್';

  @override
  String get impellerRestartTitle => 'ಮರುಪ್ರಾರಂಭ ಅಗತ್ಯವಿದೆ';

  @override
  String get impellerRestartMessage =>
      'ರೆಂಡರಿಂಗ್ ಎಂಜಿನ್ ಬದಲಾಯಿಸಲು Moonfin ಮರುಪ್ರಾರಂಭಿಸಬೇಕಾಗಿದೆ. ಈಗ ಆ್ಯಪ್ ಮುಚ್ಚಿ, ನಂತರ ಅನ್ವಯಿಸಲು ಅದನ್ನು ಮತ್ತೆ ತೆರೆಯಿರಿ.';

  @override
  String get impellerCloseNow => 'ಈಗ ಆ್ಯಪ್ ಮುಚ್ಚಿ';

  @override
  String get adminRefreshLibrary => 'ಲೈಬ್ರರಿಯನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get adminRefreshAllLibraries => 'ಎಲ್ಲಾ ಲೈಬ್ರರಿಗಳನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get adminRepoSortDateOldest => 'ಸೇರಿಸಿದ ದಿನಾಂಕ (ಹಳೆಯದು ಮೊದಲು)';

  @override
  String get adminRepoSortDateNewest => 'ಸೇರಿಸಿದ ದಿನಾಂಕ (ಹೊಸದು ಮೊದಲು)';

  @override
  String get adminRepoSortNameAsc => 'ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ (A ಇಂದ Z)';

  @override
  String get adminRepoSortNameDesc => 'ವರ್ಣಮಾಲೆಯ ಪ್ರಕಾರ (Z ಇಂದ A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'ಸರ್ವರ್ ವಿಶ್ಲೇಷಣೆ ಲೋಡ್ ಆಗುತ್ತಿದೆ... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'ಮೂಲಕ್ಕೆ ಹೊಂದಿಸಿ';

  @override
  String get imdbTop250Movies => 'IMDb ಟಾಪ್ 250 ಚಲನಚಿತ್ರಗಳು';

  @override
  String get imdbTop250TvShows => 'IMDb ಟಾಪ್ 250 ಟಿವಿ ಶೋಗಳು';

  @override
  String get imdbMostPopularMovies => 'IMDb ಅತ್ಯಂತ ಜನಪ್ರಿಯ ಚಲನಚಿತ್ರಗಳು';

  @override
  String get imdbMostPopularTvShows => 'IMDb ಅತ್ಯಂತ ಜನಪ್ರಿಯ ಟಿವಿ ಶೋಗಳು';

  @override
  String get imdbLowestRatedMovies =>
      'IMDb ಅತ್ಯಂತ ಕಡಿಮೆ ರೇಟ್ ಮಾಡಿದ ಚಲನಚಿತ್ರಗಳು';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb ಅತ್ಯುತ್ತಮ ರೇಟ್ ಮಾಡಿದ ಇಂಗ್ಲಿಷ್ ಚಲನಚಿತ್ರಗಳು';
}
