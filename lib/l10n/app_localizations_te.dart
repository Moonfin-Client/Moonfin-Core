// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'ఖాతా ప్రాధాన్యతలు';

  @override
  String get interfaceLanguage => 'ఇంటర్‌ఫేస్ భాష';

  @override
  String get systemLanguageDefault => 'సిస్టమ్ డిఫాల్ట్';

  @override
  String get signIn => 'సైన్ ఇన్ చేయండి';

  @override
  String get empty => 'ఖాళీ';

  @override
  String connectingToServer(String serverName) {
    return '$serverNameకి కనెక్ట్ అవుతోంది';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'పాస్వర్డ్';

  @override
  String get username => 'వినియోగదారు పేరు';

  @override
  String get email => 'ఇమెయిల్';

  @override
  String get quickConnectInstruction =>
      'మీ సర్వర్ వెబ్ డ్యాష్‌బోర్డ్‌లో ఈ కోడ్‌ని నమోదు చేయండి:';

  @override
  String get waitingForAuthorization => 'అధికారం కోసం వేచి ఉంది...';

  @override
  String get back => 'వెనుకకు';

  @override
  String get serverUnavailable => 'సర్వర్ అందుబాటులో లేదు';

  @override
  String get loginFailed => 'లాగిన్ విఫలమైంది';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect అందుబాటులో లేదు: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect అందుబాటులో లేదు ($status): $detail';
  }

  @override
  String get whosWatching => 'ఎవరు చూస్తున్నారు?';

  @override
  String get addUser => 'వినియోగదారుని జోడించండి';

  @override
  String get selectServer => 'సర్వర్‌ని ఎంచుకోండి';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin వెర్షన్ $version';
  }

  @override
  String get savedServers => 'సేవ్ చేసిన సర్వర్లు';

  @override
  String get discoveredServers => 'సర్వర్‌లను కనుగొన్నారు';

  @override
  String get noneFound => 'ఏదీ కనుగొనబడలేదు';

  @override
  String get unableToConnectToServer => 'సర్వర్‌కి కనెక్ట్ చేయడం సాధ్యపడలేదు';

  @override
  String get addServer => 'సర్వర్‌ని జోడించండి';

  @override
  String get embyConnect => 'Emby కనెక్ట్ చేయండి';

  @override
  String get removeServer => 'సర్వర్‌ని తీసివేయండి';

  @override
  String removeServerConfirmation(String serverName) {
    return 'మీ సర్వర్‌ల నుండి \"$serverName\"ని తీసివేయాలా?';
  }

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get remove => 'తీసివేయండి';

  @override
  String get connectToServer => 'సర్వర్‌కి కనెక్ట్ చేయండి';

  @override
  String get serverAddress => 'సర్వర్ చిరునామా';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'కనెక్ట్ చేయండి';

  @override
  String get secureStorageUnavailable => 'సురక్షిత నిల్వ అందుబాటులో లేదు';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin మీ సిస్టమ్ కీరింగ్‌ని యాక్సెస్ చేయలేకపోయింది. లాగిన్ కొనసాగవచ్చు, కానీ కీరింగ్ అన్‌లాక్ చేయబడే వరకు సురక్షిత టోకెన్ నిల్వ అందుబాటులో ఉండకపోవచ్చు.';

  @override
  String get ok => 'సరే';

  @override
  String get settingsAppearanceTheme => 'యాప్ థీమ్';

  @override
  String get detailScreenStyle => 'వివరాల స్క్రీన్ శైలి';

  @override
  String get detailScreenStyleSubtitle =>
      'క్లాసిక్ అనేది Moonfin అసలైన మధ్యస్థ లేఅవుట్. మోడర్న్ అనేది స్క్రీన్‌కు అనుగుణంగా మారే సినిమాటిక్ లేఅవుట్.';

  @override
  String get detailScreenStyleMoonfin => 'క్లాసిక్';

  @override
  String get detailScreenStyleModern => 'మోడర్న్';

  @override
  String get expandedTabs => 'విస్తరించిన ట్యాబ్‌లు';

  @override
  String get expandedTabsSubtitle =>
      'ట్యాబ్‌లను బ్రౌజ్ చేస్తున్నప్పుడు వాటి కంటెంట్‌ను స్వయంచాలకంగా చూపుతుంది. ప్రతి ట్యాబ్‌ను మాన్యువల్‌గా తెరవడానికి, మూసివేయడానికి దీన్ని ఆఫ్ చేయండి.';

  @override
  String get showTechnicalDetails => 'సాంకేతిక వివరాలను చూపించాలా?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'బ్యానర్ సారాంశంలో కోడెక్, రిజల్యూషన్, స్ట్రీమ్ సమాచారాన్ని చూపుతుంది';

  @override
  String get recommendationSystem => 'సిఫార్సు వ్యవస్థ';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin సిఫార్సులు అనే స్థానిక-లైబ్రరీ అల్గారిథమ్‌ను లేదా ఆన్‌లైన్ TMDb సారూప్య కొలమానాలను ఉపయోగించండి. గమనిక: ఆన్‌లైన్ సిఫార్సులకు Seerr ఇంటిగ్రేషన్ అవసరం.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin సిఫార్సులు';

  @override
  String get recommendationSystemTmdb => 'TMDb సారూప్యత';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'పేరెంటల్ రేటింగ్ పరిమితిని వర్తింపజేయాలా?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'లక్ష్య మీడియా పేరెంటల్ రేటింగ్ ఆధారంగా Moonfin సిఫార్సులను పరిమితం చేస్తుంది';

  @override
  String get interfaceStyle => 'ఇంటర్‌ఫేస్ శైలి';

  @override
  String get interfaceStyleSubtitle =>
      'ఆటోమేటిక్ మీ పరికరానికి సరిపోతుంది. ఒక రూపాన్ని బలవంతంగా అమలు చేయడానికి Apple లేదా Materialను ఎంచుకోండి.';

  @override
  String get interfaceStyleAutomatic => 'ఆటోమేటిక్';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'గ్లాస్ నాణ్యత';

  @override
  String get glassQualitySubtitle =>
      'ఆటో ఈ పరికరానికి ఉత్తమ గ్లాస్ ప్రభావాన్ని ఎంచుకుంటుంది. ఫుల్ నిజమైన బ్లర్‌ను బలవంతంగా అమలు చేస్తుంది; రిడ్యూస్డ్ GPU శక్తిని ఆదా చేసే తేలికపాటి గ్లాస్‌ను ఉపయోగిస్తుంది.';

  @override
  String get glassQualityAuto => 'ఆటో';

  @override
  String get glassQualityFull => 'ఫుల్';

  @override
  String get glassQualityReduced => 'రిడ్యూస్డ్';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'యాప్‌ని పునఃప్రారంభించకుండానే Moonfin మరియు Neon Pulse మధ్య మారండి';

  @override
  String get customThemeTitle => 'అనుకూల థీమ్';

  @override
  String get customThemeSubtitle =>
      'అనుకూల థీమ్‌లు Moonfin అంతటా దృశ్య అంశాలను మారుస్తాయి. మీ శైలికి సరిపోయేలా వీటిలో ఒకదాన్ని ఎంచుకోండి.';

  @override
  String get keyboardPreferSystemIme =>
      'సిస్టమ్ కీబోర్డ్‌కు ప్రాధాన్యం ఇవ్వండి';

  @override
  String get keyboardPreferSystemImeDescription =>
      'టెక్స్ట్ ఎంట్రీ కోసం డిఫాల్ట్‌గా మీ పరికర ఇన్‌పుట్ పద్ధతిని ఉపయోగించండి';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'ప్రస్తుత Moonfin లుక్ మీరందరూ ఇష్టపడుతున్నారు';

  @override
  String get themeNeonPulse => 'నియాన్ పల్స్';

  @override
  String get themeNeonPulseSubtitle =>
      'మెజెంటా గ్లో, సియాన్ టెక్స్ట్ మరియు బలమైన క్రోమ్ కాంట్రాస్ట్‌తో సింథ్‌వేవ్ స్టైలింగ్';

  @override
  String get themeGlass => 'గ్లాస్';

  @override
  String get themeGlassSubtitle =>
      'కదిలే గ్రేడియంట్ నేపథ్యం, మంచు లాంటి ఉపరితలాలు, Apple-నీలం యాక్సెంట్‌తో లిక్విడ్-గ్లాస్ శైలి';

  @override
  String get theme8BitHero => '8-బిట్ హీరో';

  @override
  String get theme8BitHeroSubtitle =>
      'దట్టమైన రంగుల ప్యాలెట్, చతురస్రాకార అంచులు, గట్టి నీడలు, పిక్సెల్ ఫాంట్‌తో రెట్రో పిక్సెల్-ఆర్ట్ శైలి';

  @override
  String get embyConnectSignInSubtitle =>
      'మీ Emby Connect ఖాతాతో సైన్ ఇన్ చేయండి';

  @override
  String get emailOrUsername => 'ఇమెయిల్ లేదా వినియోగదారు పేరు';

  @override
  String get selectAServer => 'సర్వర్‌ని ఎంచుకోండి';

  @override
  String get tryAgain => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get noLinkedServers =>
      'ఈ Emby Connect ఖాతాకు సర్వర్‌లు ఏవీ లింక్ చేయబడలేదు';

  @override
  String get invalidEmbyConnectCredentials => 'చెల్లని Emby Connect ఆధారాలు';

  @override
  String get invalidEmbyConnectLogin =>
      'చెల్లని Emby Connect వినియోగదారు పేరు లేదా పాస్‌వర్డ్';

  @override
  String get embyConnectExchangeNotSupported =>
      'సర్వర్ Emby Connect మార్పిడికి మద్దతు ఇవ్వదు';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect లేదా ఎంచుకున్న సర్వర్‌ని సంప్రదిస్తున్నప్పుడు నెట్‌వర్క్ లోపం';

  @override
  String get loadingLinkedServers => 'లింక్ చేసిన సర్వర్‌లను లోడ్ చేస్తోంది...';

  @override
  String get connectingToServerEllipsis => 'సర్వర్‌కి కనెక్ట్ చేస్తోంది...';

  @override
  String get noReachableAddress => 'చేరుకోగల చిరునామా ఏదీ అందించబడలేదు';

  @override
  String get invalidServerExchangeResponse =>
      'సర్వర్ ఎక్స్ఛేంజ్ ఎండ్ పాయింట్ నుండి చెల్లని ప్రతిస్పందన';

  @override
  String unableToConnectTo(String target) {
    return '$targetకి కనెక్ట్ చేయడం సాధ్యపడలేదు';
  }

  @override
  String get exitApp => 'Moonfin నుండి నిష్క్రమించాలా?';

  @override
  String get exitAppConfirmation =>
      'మీరు ఖచ్చితంగా నిష్క్రమించాలనుకుంటున్నారా?';

  @override
  String get exit => 'నిష్క్రమించు';

  @override
  String get gameMenu => 'మెను';

  @override
  String get gamePaused => 'పాజ్ చేయబడింది';

  @override
  String get gameSaveState => 'స్థితిని సేవ్ చేయండి';

  @override
  String get games => 'గేమ్‌లు';

  @override
  String get gameLoadState => 'స్థితిని లోడ్ చేయండి';

  @override
  String get gameFastForward => 'ఫాస్ట్-ఫార్వర్డ్';

  @override
  String get gameEmulatorSettings => 'ఎమ్యులేటర్ సెట్టింగ్‌లు';

  @override
  String get gameNoCoreOptions => 'ఈ కోర్‌కు సర్దుబాటు చేయగల ఎంపికలు లేవు.';

  @override
  String get gameHoldToOpenMenu => 'మెనును తెరవడానికి నొక్కి పట్టుకోండి';

  @override
  String get gamePlaybackUnsupported =>
      'ఈ పరికరంలో గేమ్‌లను ఆడటం ఇంకా మద్దతు లేదు.';

  @override
  String get noHomeRowsLoaded => 'హోమ్ వరుసలు ఏవీ లోడ్ చేయబడలేదు';

  @override
  String get noHomeRowsHint =>
      'యాక్టివ్ హోమ్ విభాగాలను రిఫ్రెష్ చేయడానికి లేదా తగ్గించడానికి ప్రయత్నించండి.';

  @override
  String get retryHomeRows => 'హోమ్ వరుసలను మళ్లీ ప్రయత్నించండి';

  @override
  String get guide => 'గైడ్';

  @override
  String get recordings => 'రికార్డింగ్‌లు';

  @override
  String get schedule => 'షెడ్యూల్';

  @override
  String get series => 'సిరీస్';

  @override
  String get noItemsFound => 'అంశాలు ఏవీ కనుగొనబడలేదు';

  @override
  String get home => 'హోమ్';

  @override
  String get browseAll => 'అన్నీ బ్రౌజ్ చేయండి';

  @override
  String get genres => 'శైలులు';

  @override
  String get collectionPlaceholder => 'సేకరణ అంశాలు ఇక్కడ కనిపిస్తాయి';

  @override
  String get browseByLetter => 'అక్షరం ద్వారా బ్రౌజ్ చేయండి';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'ఆల్ఫాబెటిక్ బ్రౌజ్ ఇక్కడ కనిపిస్తుంది';

  @override
  String get suggestions => 'సూచనలు';

  @override
  String get suggestionsPlaceholder => 'సూచించబడిన అంశాలు ఇక్కడ కనిపిస్తాయి';

  @override
  String get failedToLoadLibraries => 'లైబ్రరీలను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get noLibrariesFound => 'లైబ్రరీలు ఏవీ కనుగొనబడలేదు';

  @override
  String get library => 'లైబ్రరీ';

  @override
  String get displaySettings => 'ప్రదర్శన సెట్టింగ్‌లు';

  @override
  String get allGenres => 'అన్ని శైలులు';

  @override
  String get noGenresFound => 'జానర్‌లు ఏవీ కనుగొనబడలేదు';

  @override
  String failedToLoadFolderError(String error) {
    return 'ఫోల్డర్‌ను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get thisFolderIsEmpty => 'ఈ ఫోల్డర్ ఖాళీగా ఉంది';

  @override
  String itemCountLabel(int count) {
    return '$count అంశాలు';
  }

  @override
  String get failedToLoadFavorites => 'ఇష్టమైన వాటిని లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get retry => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get noFavoritesYet => 'ఇంకా ఇష్టమైనవి లేవు';

  @override
  String get favorites => 'ఇష్టమైనవి';

  @override
  String totalCountItems(int count) {
    return '$count అంశాలు';
  }

  @override
  String get continuing => 'కొనసాగుతోంది';

  @override
  String get ended => 'ముగిసింది';

  @override
  String get sortAndFilter => 'క్రమబద్ధీకరించు & ఫిల్టర్';

  @override
  String get type => 'టైప్ చేయండి';

  @override
  String get sortBy => 'క్రమబద్ధీకరించు';

  @override
  String get display => 'ప్రదర్శించు';

  @override
  String get imageType => 'చిత్రం రకం';

  @override
  String get posterSize => 'పోస్టర్ పరిమాణం';

  @override
  String get small => 'చిన్నది';

  @override
  String get medium => 'మధ్యస్థం';

  @override
  String get large => 'పెద్దది';

  @override
  String get extraLarge => 'అదనపు పెద్దది';

  @override
  String libraryGenresTitle(String name) {
    return '$name — శైలులు';
  }

  @override
  String get views => 'వీక్షణలు';

  @override
  String get albums => 'ఆల్బమ్‌లు';

  @override
  String get albumArtists => 'ఆల్బమ్ కళాకారులు';

  @override
  String get artists => 'కళాకారులు';

  @override
  String get bookmarks => 'బుక్‌మార్క్‌లు';

  @override
  String get noSavedBookmarks =>
      'ఈ శీర్షిక కోసం ఇంకా సేవ్ చేయబడిన బుక్‌మార్క్‌లు లేవు.';

  @override
  String get openBook => 'ఓపెన్ బుక్';

  @override
  String get chapter => 'అధ్యాయం';

  @override
  String get page => 'పేజీ';

  @override
  String get bookmark => 'బుక్మార్క్';

  @override
  String get justNow => 'ఇప్పుడే';

  @override
  String minutesAgo(int count) {
    return '$countని క్రితం';
  }

  @override
  String hoursAgo(int count) {
    return '$countగం క్రితం';
  }

  @override
  String daysAgo(int count) {
    return '$countరో క్రితం';
  }

  @override
  String get discoverySubjects => 'డిస్కవరీ సబ్జెక్ట్‌లు';

  @override
  String get pickDiscoverySubjects =>
      'Discoverలో ఏ సబ్జెక్ట్ ఫీడ్‌లను చూపించాలో ఎంచుకోండి.';

  @override
  String get apply => 'వర్తింపజేయండి';

  @override
  String get openLink => 'లింక్ తెరవండి';

  @override
  String get scanWithYourPhone => 'మీ ఫోన్‌తో స్కాన్ చేయండి';

  @override
  String get audiobookGenres => 'ఆడియోబుక్ శైలులు';

  @override
  String get pickAudiobookGenres =>
      'ఆడియోబుక్ డిస్కవర్‌లో ఏ జానర్‌లను చూపించాలో ఎంచుకోండి.';

  @override
  String get discoverAudiobooks => 'ఆడియోబుక్‌లను కనుగొనండి';

  @override
  String get librivoxDescription =>
      'LibriVox నుండి ప్రసిద్ధ పబ్లిక్ డొమైన్ శీర్షికలు.';

  @override
  String titlesCount(int count) {
    return '$count శీర్షికలు';
  }

  @override
  String get scrollLeft => 'ఎడమవైపు స్క్రోల్ చేయండి';

  @override
  String get scrollRight => 'కుడివైపు స్క్రోల్ చేయండి';

  @override
  String get couldNotLoadGenre => 'ప్రస్తుతం ఈ శైలిని లోడ్ చేయడం సాధ్యపడలేదు.';

  @override
  String get continueReading => 'చదవడం కొనసాగించు';

  @override
  String get savedHighlights => 'సేవ్ చేసిన ముఖ్యాంశాలు';

  @override
  String get continueListening => 'వినడం కొనసాగించండి';

  @override
  String get listen => 'వినండి';

  @override
  String get resume => 'కొనసాగించండి';

  @override
  String get failedToLoadLibrary => 'లైబ్రరీని లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get popularNow => 'ఇప్పుడు జనాదరణ పొందింది';

  @override
  String get savedForLater => 'తర్వాత కోసం సేవ్ చేయబడింది';

  @override
  String get topListens => 'అగ్రశ్రేణి శ్రోతలు';

  @override
  String get unreadDiscoveries => 'చదవని ఆవిష్కరణలు';

  @override
  String get pickUpAgain => 'మళ్లీ పికప్ చేయండి';

  @override
  String get bookHighlightsDescription =>
      'హైలైట్‌లు, ఇష్టమైనవి లేదా రీడింగ్ ప్రోగ్రెస్‌తో కూడిన మీ పుస్తకాలు.';

  @override
  String get handPickedFromLibrary =>
      'మీ లైబ్రరీ నుండి చేతితో ఎంపిక చేయబడింది.';

  @override
  String get handPickedFromListeningQueue =>
      'మీ శ్రవణ క్యూ నుండి చేతితో ఎంపిక చేయబడింది.';

  @override
  String get booksWithHighlights =>
      'ముఖ్యాంశాలు, ఇష్టమైనవి లేదా పఠన పురోగతితో పుస్తకాలు.';

  @override
  String get jumpBackNarration =>
      'మీ స్థలం కోసం వేటాడకుండా కథనంలోకి తిరిగి వెళ్లండి.';

  @override
  String get unreadBooksReady =>
      'తదుపరి నిశ్శబ్ద గంట కోసం చదవని పుస్తకాలు సిద్ధంగా ఉన్నాయి.';

  @override
  String get quickAccessFavorites =>
      'మీరు తిరిగి వస్తున్న పుస్తకాలకు త్వరిత ప్రాప్యత.';

  @override
  String get searchAudiobooks => 'ఆడియోబుక్‌లను శోధించండి';

  @override
  String get searchYourLibrary => 'మీ లైబ్రరీని శోధించండి';

  @override
  String get pickUpStory => 'మీరు ఆపివేసిన కథను తీయండి';

  @override
  String get savedPlacesChapters =>
      'మీరు సేవ్ చేసిన స్థలాలు మరియు అసంపూర్తిగా ఉన్న అధ్యాయాలు';

  @override
  String authorsCount(int count) {
    return '$count రచయితలు';
  }

  @override
  String genresCount(int count) {
    return '$count శైలులు';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% పూర్తయింది';
  }

  @override
  String get readyWhenYouAre => 'మీరు ఉన్నప్పుడు సిద్ధంగా ఉండండి';

  @override
  String get details => 'వివరాలు';

  @override
  String get listeningRoom => 'వినే గది';

  @override
  String get bookmarksAndProgress => 'బుక్‌మార్క్‌లు & పురోగతి';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'చదవడానికి-ప్రాధాన్యత ఇచ్చే బ్రౌజింగ్ కోసం $count శీర్షికలు అమర్చబడ్డాయి.';
  }

  @override
  String get titles => 'శీర్షికలు';

  @override
  String get allTitles => 'అన్ని శీర్షికలు';

  @override
  String get authors => 'రచయితలు';

  @override
  String get browseByAuthor => 'రచయిత ద్వారా బ్రౌజ్ చేయండి';

  @override
  String get browseByGenre => 'జానర్ ద్వారా బ్రౌజ్ చేయండి';

  @override
  String get discover => 'కనుగొనండి';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library నుండి విషయం వారీగా ట్రెండింగ్ శీర్షికలు.';

  @override
  String get noBookmarkedItems => 'ఇంకా బుక్‌మార్క్ చేయబడిన అంశాలు ఏవీ లేవు';

  @override
  String get nothingMatchesSection =>
      'ఈ విభాగానికి ఇంకా ఏదీ సరిపోలలేదు. మరొక ట్యాబ్‌ని ప్రయత్నించండి లేదా లైబ్రరీ సమకాలీకరణ పూర్తయిన తర్వాత తిరిగి రండి.';

  @override
  String get audiobooks => 'ఆడియోబుక్స్';

  @override
  String noLabelFound(String label) {
    return '$label ఏదీ కనుగొనబడలేదు';
  }

  @override
  String get folder => 'ఫోల్డర్';

  @override
  String get filters => 'ఫిల్టర్లు';

  @override
  String get readingStatus => 'పఠన స్థితి';

  @override
  String get playedStatus => 'ప్లేడ్ స్టేటస్';

  @override
  String get readStatus => 'చదవండి';

  @override
  String get watched => 'వీక్షించినవి';

  @override
  String get unread => 'చదవలేదు';

  @override
  String get unwatched => 'వీక్షించనివి';

  @override
  String get seriesStatus => 'సిరీస్ స్థితి';

  @override
  String get allLibraries => 'అన్ని లైబ్రరీలు';

  @override
  String get books => 'పుస్తకాలు';

  @override
  String get latestBooks => 'సరికొత్త పుస్తకాలు';

  @override
  String get latestAudiobooks => 'సరికొత్త ఆడియోబుక్‌లు';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count పుస్తకాలు',
      one: '1 పుస్తకం',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'పుస్తకం';

  @override
  String get bookFormatAudiobook => 'ఆడియోబుక్';

  @override
  String bookPercentRead(int percent) {
    return '$percent% చదివారు';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time మిగిలి ఉంది';
  }

  @override
  String get bookHeroRead => 'చదవండి';

  @override
  String get bookHeroListen => 'వినండి';

  @override
  String get author => 'రచయిత';

  @override
  String get unknownAuthor => 'తెలియని రచయిత';

  @override
  String get uncategorized => 'వర్గీకరించబడలేదు';

  @override
  String get overview => 'అవలోకనం';

  @override
  String get noLibrivoxDescription =>
      'ఈ శీర్షిక కోసం LibriVox ద్వారా ఇంకా ఎలాంటి వివరణ అందించబడలేదు.';

  @override
  String get readers => 'పాఠకులు';

  @override
  String get openLinks => 'లింక్‌లను తెరవండి';

  @override
  String get librivoxPage => 'LibriVox పేజీ';

  @override
  String get internetArchive => 'ఇంటర్నెట్ ఆర్కైవ్';

  @override
  String get rssFeed => 'RSS ఫీడ్';

  @override
  String get downloadZip => 'జిప్ డౌన్‌లోడ్ చేయండి';

  @override
  String sectionCountLabel(int count) {
    return '$count విభాగాలు';
  }

  @override
  String firstPublished(int year) {
    return 'మొదట ప్రచురించబడింది $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'ఈ శీర్షిక కోసం ఇంకా Open Library నుండి స్థూలదృష్టి అందుబాటులో లేదు.';

  @override
  String get subjects => 'సబ్జెక్టులు';

  @override
  String get all => 'అన్నీ';

  @override
  String booksCount(int count) {
    return '$count పుస్తకాలు';
  }

  @override
  String get couldNotLoadSubject =>
      'ప్రస్తుతం ఈ విషయాన్ని లోడ్ చేయడం సాధ్యపడలేదు.';

  @override
  String get audiobookDetails => 'ఆడియోబుక్ వివరాలు';

  @override
  String authorsCountTitle(int count) {
    return '$count రచయితలు';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ఆడియోబుక్‌లు',
      one: '1 ఆడియోబుక్',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'ట్రాక్ జాబితా';

  @override
  String get itemListPlaceholder => 'అంశం జాబితా ఇక్కడ కనిపిస్తుంది';

  @override
  String get failedToLoad => 'లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get delete => 'తొలగించండి';

  @override
  String get save => 'సేవ్ చేయండి';

  @override
  String get moreLikeThis => 'ఇలాంటివి మరిన్ని';

  @override
  String get castAndCrew => 'తారాగణం & సిబ్బంది';

  @override
  String get collection => 'సేకరణ';

  @override
  String get episodes => 'ఎపిసోడ్‌లు';

  @override
  String get nextUp => 'తదుపరి';

  @override
  String get seasons => 'సీజన్‌లు';

  @override
  String get chapters => 'అధ్యాయాలు';

  @override
  String get features => 'ఫీచర్లు';

  @override
  String get movies => 'సినిమాలు';

  @override
  String get musicVideos => 'మ్యూజిక్ వీడియోలు';

  @override
  String get other => 'ఇతర';

  @override
  String get discography => 'డిస్కోగ్రఫీ';

  @override
  String get similarArtists => 'ఇలాంటి కళాకారులు';

  @override
  String get tableOfContents => 'విషయ సూచిక';

  @override
  String get tracklist => 'ట్రాక్‌లిస్ట్';

  @override
  String discNumber(int number) {
    return 'డిస్క్ $number';
  }

  @override
  String get biography => 'జీవిత చరిత్ర';

  @override
  String get authorDetails => 'రచయిత వివరాలు';

  @override
  String get noOverviewAvailable =>
      'ఈ శీర్షిక కోసం ఇంకా స్థూలదృష్టి అందుబాటులో లేదు.';

  @override
  String get noBiographyAvailable => 'ఈ రచయితకు జీవిత చరిత్ర అందుబాటులో లేదు.';

  @override
  String get noBooksFound => 'ఈ రచయిత కోసం పుస్తకాలు ఏవీ కనుగొనబడలేదు.';

  @override
  String get unableToLoadAuthorDetails =>
      'ప్రస్తుతం రచయిత వివరాలను లోడ్ చేయడం సాధ్యపడలేదు.';

  @override
  String published(int year) {
    return 'ప్రచురించబడింది $year';
  }

  @override
  String get publicationDateUnknown => 'ప్రచురణ తేదీ తెలియదు';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count సీజన్‌లు',
      one: '1 సీజన్',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$timeకి ముగుస్తుంది';
  }

  @override
  String get items => 'అంశాలు';

  @override
  String get extras => 'అదనపు అంశాలు';

  @override
  String get behindTheScenes => 'తెర వెనుక';

  @override
  String get deletedScenes => 'తొలగించిన సన్నివేశాలు';

  @override
  String get featurettes => 'ఫీచరెట్‌లు';

  @override
  String get interviews => 'ఇంటర్వ్యూలు';

  @override
  String get scenes => 'సన్నివేశాలు';

  @override
  String get shorts => 'షార్ట్స్';

  @override
  String get trailers => 'ట్రైలర్‌లు';

  @override
  String timeRemaining(String time) {
    return '$time మిగిలి ఉంది';
  }

  @override
  String endsIn(String time) {
    return '$timeలో ముగుస్తుంది';
  }

  @override
  String get view => 'చూడండి';

  @override
  String get resumeReading => 'పఠనం పునఃప్రారంభించండి';

  @override
  String get read => 'చదవండి';

  @override
  String resumeFrom(String position) {
    return '$position నుండి కొనసాగించండి';
  }

  @override
  String get play => 'ప్లే చేయండి';

  @override
  String get startOver => 'ప్రారంభించండి';

  @override
  String get restart => 'పునఃప్రారంభించండి';

  @override
  String get readOffline => 'ఆఫ్‌లైన్‌లో చదవండి';

  @override
  String get playOffline => 'ఆఫ్‌లైన్‌లో ప్లే చేయండి';

  @override
  String get audio => 'ఆడియో';

  @override
  String get subtitles => 'ఉపశీర్షికలు';

  @override
  String get version => 'వెర్షన్';

  @override
  String get cast => 'కాస్ట్ చేయండి';

  @override
  String get trailer => 'ట్రైలర్';

  @override
  String get finished => 'పూర్తయింది';

  @override
  String get favorited => 'ఇష్టమైనవి';

  @override
  String get favorite => 'ఇష్టమైనది';

  @override
  String get playlist => 'ప్లేజాబితా';

  @override
  String get downloaded => 'డౌన్‌లోడ్ చేయబడింది';

  @override
  String get downloadAll => 'అన్నీ డౌన్‌లోడ్ చేయండి';

  @override
  String get download => 'డౌన్‌లోడ్ చేయండి';

  @override
  String get deleteDownloaded => 'డౌన్‌లోడ్ చేసిన వాటిని తొలగించండి';

  @override
  String get goToSeries => 'సిరీస్‌కి వెళ్లండి';

  @override
  String get editMetadata => 'మెటాడేటాను సవరించండి';

  @override
  String get less => 'తక్కువ';

  @override
  String get more => 'మరిన్ని';

  @override
  String get deleteItem => 'అంశాన్ని తొలగించండి';

  @override
  String get deletePlaylist => 'ప్లేజాబితాను తొలగించండి';

  @override
  String get deletePlaylistMessage => 'సర్వర్ నుండి ఈ ప్లేజాబితాను తొలగించాలా?';

  @override
  String get deleteItemMessage => 'సర్వర్ నుండి ఈ అంశాన్ని తొలగించాలా?';

  @override
  String get failedToDeletePlaylist => 'ప్లేజాబితాను తొలగించడంలో విఫలమైంది';

  @override
  String get failedToDeleteItem => 'అంశాన్ని తొలగించడంలో విఫలమైంది';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'ప్లేజాబితా పేరు మార్చండి';

  @override
  String get playlistName => 'ప్లేజాబితా పేరు';

  @override
  String get deleteDownloadedAlbum => 'డౌన్‌లోడ్ చేసిన ఆల్బమ్‌ను తొలగించండి';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\" కోసం డౌన్‌లోడ్ చేసిన ట్రాక్‌లను తొలగించాలా?';
  }

  @override
  String get downloadedTracksDeleted =>
      'డౌన్‌లోడ్ చేసిన ట్రాక్‌లు తొలగించబడ్డాయి';

  @override
  String get downloadedTracksDeleteFailed =>
      'డౌన్‌లోడ్ చేసిన కొన్ని ట్రాక్‌లను తొలగించడం సాధ్యపడలేదు';

  @override
  String get noTracksLoaded => 'ట్రాక్‌లు ఏవీ లోడ్ చేయబడలేదు';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel ఏదీ లోడ్ కాలేదు';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title డౌన్‌లోడ్ అవుతోంది ($count అంశాలు)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'సర్వర్ నుండి \"$name\"ని ఖచ్చితంగా తొలగించాలా? ఈ చర్యను రద్దు చేయలేరు.';
  }

  @override
  String get itemDeleted => 'అంశం తొలగించబడింది';

  @override
  String get noPlayableTrailerFound => 'ప్లే చేయగల ట్రైలర్ ఏదీ కనుగొనబడలేదు.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'మద్దతు లేని పుస్తక ఫార్మాట్: .$extension';
  }

  @override
  String get audioTrack => 'ఆడియో ట్రాక్';

  @override
  String get subtitleTrack => 'ఉపశీర్షిక ట్రాక్';

  @override
  String get none => 'ఏదీ లేదు';

  @override
  String get downloadSubtitlesLabel => 'ఉపశీర్షికలను డౌన్‌లోడ్ చేయండి...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles ప్లగ్ఇన్ ఉపయోగించి శోధించండి';

  @override
  String get downloadSubtitles => 'ఉపశీర్షికలను డౌన్‌లోడ్ చేయండి';

  @override
  String get selectedSubtitleInvalid => 'ఎంచుకున్న ఉపశీర్షిక చెల్లదు.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'సబ్‌టైటిల్ డౌన్‌లోడ్ చేయబడి ఎంపిక చేయబడింది: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'ఉపశీర్షిక డౌన్‌లోడ్ చేయబడింది. Jellyfin అంశాన్ని రిఫ్రెష్ చేస్తున్నప్పుడు కనిపించడానికి కొంత సమయం పట్టవచ్చు.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language కోసం రిమోట్ సబ్‌టైటిల్‌లు ఏవీ కనుగొనబడలేదు.';
  }

  @override
  String get selectVersion => 'సంస్కరణను ఎంచుకోండి';

  @override
  String versionNumber(int number) {
    return 'వెర్షన్ $number';
  }

  @override
  String get downloadAllQuality => 'అన్నీ డౌన్‌లోడ్ చేసుకోండి — నాణ్యత';

  @override
  String get downloadQuality => 'డౌన్‌లోడ్ నాణ్యత';

  @override
  String get originalFileNoReencoding => 'అసలు ఫైల్, రీ-ఎన్‌కోడింగ్ లేదు';

  @override
  String get originalFilesNoReencoding => 'అసలు ఫైల్‌లు, రీ-ఎన్‌కోడింగ్ లేదు';

  @override
  String get noEpisodesLoaded => 'ఎపిసోడ్‌లు ఏవీ లోడ్ చేయబడలేదు';

  @override
  String downloadingItem(String name, String quality) {
    return '$name డౌన్‌లోడ్ అవుతోంది ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'డౌన్‌లోడ్ చేసిన ఫైల్‌లను తొలగించండి';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel కోసం స్థానిక ఫైల్‌లను తొలగించాలా?\n\nఇది నిల్వ స్థలాన్ని ఖాళీ చేస్తుంది. మీరు తర్వాత మళ్లీ డౌన్‌లోడ్ చేసుకోవచ్చు.';
  }

  @override
  String get downloadedFilesDeleted => 'డౌన్‌లోడ్ చేసిన ఫైల్‌లు తొలగించబడ్డాయి';

  @override
  String get failedToDeleteFiles => 'ఫైల్‌లను తొలగించడంలో విఫలమైంది';

  @override
  String get deleteFiles => 'ఫైల్‌లను తొలగించండి';

  @override
  String get director => 'దర్శకుడు';

  @override
  String get directors => 'దర్శకులు';

  @override
  String get writer => 'రచయిత';

  @override
  String get writers => 'రచయితలు';

  @override
  String get studio => 'స్టూడియో';

  @override
  String studioMoreCount(int count) {
    return '+$count మరిన్ని';
  }

  @override
  String totalEpisodes(int count) {
    return '$count ఎపిసోడ్‌లు';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'ఎపిసోడ్ $number';
  }

  @override
  String chapterNumber(int number) {
    return 'అధ్యాయం $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ట్రాక్‌లు',
      one: '1 ట్రాక్',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count అధ్యాయాలు',
      one: '1 అధ్యాయం',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'జననం $date';
  }

  @override
  String died(String date) {
    return 'మరణం $date';
  }

  @override
  String age(int age) {
    return 'వయస్సు $age';
  }

  @override
  String get showLess => 'తక్కువ చూపించు';

  @override
  String get readMore => 'మరింత చదవండి';

  @override
  String get shuffle => 'షఫుల్ చేయండి';

  @override
  String get shuffleAllMusic => 'మొత్తం సంగీతాన్ని షఫుల్ చేయండి';

  @override
  String get carSignInPrompt => 'మీ ఫోన్‌లో Moonfinకి సైన్ ఇన్ చేయండి';

  @override
  String get carServerUnreachable => 'మీ సర్వర్‌ను చేరుకోలేకపోతోంది';

  @override
  String downloadsCount(int count) {
    return '$count డౌన్‌లోడ్‌లు';
  }

  @override
  String get perfectMatch => 'పర్ఫెక్ట్ మ్యాచ్';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'మోనో';

  @override
  String get stereo => 'స్టీరియో';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'రిమోట్ సబ్‌టైటిల్ $action కోసం ఈ వినియోగదారుకు Jellyfin సబ్‌టైటిల్ నిర్వహణ అనుమతి అవసరం.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'రిమోట్ సబ్‌టైటిల్ $action కోసం ఈ అంశం సర్వర్‌లో కనుగొనబడలేదు.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'రిమోట్ సబ్‌టైటిల్ $action విఫలమైంది: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'రిమోట్ సబ్‌టైటిల్ $action విఫలమైంది (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'రిమోట్ సబ్‌టైటిల్‌లను $action చేయడం విఫలమైంది.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\" కోసం డౌన్‌లోడ్ చేసిన అన్ని ఎపిసోడ్‌లు';
  }

  @override
  String get deleteSeasonFiles =>
      'ఈ సీజన్‌లో డౌన్‌లోడ్ చేయబడిన అన్ని ఎపిసోడ్‌లు';

  @override
  String get stillWatching => 'ఇంకా చూస్తున్నారా?';

  @override
  String get unableToLoadTrailerStream =>
      'ట్రైలర్ స్ట్రీమ్‌ను లోడ్ చేయడం సాధ్యపడలేదు.';

  @override
  String get trailerTimedOut => 'లోడ్ అవుతున్నప్పుడు ట్రైలర్ సమయం ముగిసింది.';

  @override
  String get playbackFailedForTrailer => 'ఈ ట్రైలర్ కోసం ప్లేబ్యాక్ విఫలమైంది.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'ఆఫ్‌లైన్ ప్లేబ్యాక్ సమయంలో కాస్టింగ్ అందుబాటులో ఉండదు.';

  @override
  String castActionFailed(String label, String error) {
    return '$label చర్య విఫలమైంది: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'కాస్ట్ వాల్యూమ్‌ను సెట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label నియంత్రణలు';
  }

  @override
  String get deviceVolume => 'పరికర వాల్యూమ్';

  @override
  String get unavailable => 'అందుబాటులో లేదు';

  @override
  String get pause => 'పాజ్ చేయండి';

  @override
  String get syncPosition => 'సమకాలీకరణ స్థానం';

  @override
  String stopCast(String label) {
    return '$labelని ఆపండి';
  }

  @override
  String get queueIsEmpty => 'క్యూ ఖాళీగా ఉంది';

  @override
  String trackNumber(int number) {
    return 'ట్రాక్ $number';
  }

  @override
  String get remotePlayback => 'రిమోట్ ప్లేబ్యాక్';

  @override
  String get castingToGoogleCast => 'Google Castకి ప్రసారం చేస్తోంది';

  @override
  String get castingViaAirPlay => 'AirPlay ద్వారా ప్రసారం చేయడం';

  @override
  String get castingViaDlna => 'DLNA ద్వారా ప్రసారం';

  @override
  String secondsCount(int seconds) {
    return '$seconds సెకన్లు';
  }

  @override
  String get longPressToUnlock => 'అన్‌లాక్ చేయడానికి ఎక్కువసేపు నొక్కండి';

  @override
  String get off => 'ఆఫ్';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'ఆటో';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'బిట్రేట్ ఓవర్‌రైడ్';

  @override
  String get audioDelay => 'ఆడియో ఆలస్యం';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'ఉపశీర్షిక ఆలస్యం';

  @override
  String get reset => 'రీసెట్ చేయండి';

  @override
  String get unknown => 'తెలియదు';

  @override
  String get playbackInformation => 'ప్లేబ్యాక్ సమాచారం';

  @override
  String get playback => 'ప్లేబ్యాక్';

  @override
  String get playMethod => 'ప్లే మెథడ్';

  @override
  String get directPlay => 'డైరెక్ట్ ప్లే';

  @override
  String get directStream => 'డైరెక్ట్ స్ట్రీమ్';

  @override
  String get transcoding => 'ట్రాన్స్‌కోడింగ్';

  @override
  String get transcodeReasons => 'ట్రాన్స్‌కోడ్ కారణాలు';

  @override
  String get player => 'ప్లేయర్';

  @override
  String get container => 'కంటైనర్';

  @override
  String get bitrate => 'బిట్రేట్';

  @override
  String get video => 'వీడియో';

  @override
  String get resolution => 'రిజల్యూషన్';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'కోడెక్';

  @override
  String get videoBitrate => 'వీడియో బిట్రేట్';

  @override
  String get track => 'ట్రాక్';

  @override
  String get channels => 'ఛానెల్‌లు';

  @override
  String get audioBitrate => 'ఆడియో బిట్రేట్';

  @override
  String get sampleRate => 'నమూనా రేటు';

  @override
  String get format => 'ఫార్మాట్';

  @override
  String get external => 'బాహ్య';

  @override
  String get embedded => 'పొందుపరిచారు';

  @override
  String castSessionError(String protocol) {
    return '$protocol సెషన్ లోపం';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'పుస్తక వివరాలను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'యాప్‌లో EPUB రెండరింగ్ ఇంకా ఈ ప్లాట్‌ఫారమ్‌లో అందుబాటులో లేదు.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'ఈ ఫార్మాట్ (.$extension)ను యాప్‌లో ఇంకా రెండర్ చేయలేరు.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'ఎంబెడెడ్ డాక్యుమెంట్ రెండరింగ్ ఈ ప్లాట్‌ఫారమ్‌లో అందుబాటులో లేదు.';

  @override
  String get couldNotOpenExternalViewer =>
      'బాహ్య వీక్షకుడిని తెరవడం సాధ్యపడలేదు.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'యాప్ రీడర్‌ను తెరవడం విఫలమైంది: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label వద్ద బుక్‌మార్క్ ఇప్పటికే సేవ్ చేయబడింది.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'బుక్‌మార్క్ జోడించబడింది: $label';
  }

  @override
  String get noBookmarksYet =>
      'ఇంకా బుక్‌మార్క్‌లు లేవు.\nమీ స్థానాన్ని సేవ్ చేయడానికి చదివేటప్పుడు బుక్‌మార్క్ చిహ్నాన్ని నొక్కండి.';

  @override
  String get noTableOfContentsAvailable => 'విషయాల పట్టిక అందుబాటులో లేదు';

  @override
  String pageLabel(int number) {
    return 'పేజీ $number';
  }

  @override
  String get position => 'స్థానం';

  @override
  String get bookReader => 'బుక్ రీడర్';

  @override
  String formatExtension(String extension) {
    return 'ఫార్మాట్: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% చదివారు';
  }

  @override
  String get updating => 'నవీకరిస్తోంది...';

  @override
  String get markUnread => 'చదవనిదిగా గుర్తించండి';

  @override
  String get markAsRead => 'చదివినట్లు గుర్తు పెట్టండి';

  @override
  String get reloadReader => 'రీడర్‌ని రీలోడ్ చేయండి';

  @override
  String get noPagesFound => 'పేజీలు ఏవీ కనుగొనబడలేదు.';

  @override
  String get failedToDecodePageImage =>
      'పేజీ చిత్రాన్ని డీకోడ్ చేయడంలో విఫలమైంది.';

  @override
  String resetZoom(String zoom) {
    return 'జూమ్‌ను రీసెట్ చేయండి (${zoom}x)';
  }

  @override
  String get singlePage => 'ఒకే పేజీ';

  @override
  String get twoPageSpread => 'రెండు పేజీల వ్యాప్తి';

  @override
  String get addBookmark => 'బుక్‌మార్క్‌ని జోడించండి';

  @override
  String get bookmarksEllipsis => 'బుక్‌మార్క్‌లు...';

  @override
  String get markedAsRead => 'చదివినట్లు గుర్తు పెట్టబడింది';

  @override
  String get markedAsUnread => 'చదవనిదిగా గుర్తు పెట్టబడింది';

  @override
  String failedToUpdateReadState(String error) {
    return 'చదివిన స్థితిని అప్‌డేట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get themeSystem => 'థీమ్: సిస్టమ్';

  @override
  String get themeLight => 'థీమ్: కాంతి';

  @override
  String get themeDark => 'థీమ్: చీకటి';

  @override
  String get themeSepia => 'థీమ్: సెపియా';

  @override
  String get invertColorsFixedLayout => 'విలోమ రంగులు (స్థిరమైన లేఅవుట్)';

  @override
  String get invertColorsPdf => 'విలోమ రంగులు (PDF)';

  @override
  String get preparingInAppReader => 'యాప్‌లో రీడర్‌ని సిద్ధం చేస్తోంది...';

  @override
  String get pdfDataNotAvailable => 'PDF డేటా అందుబాటులో లేదు.';

  @override
  String get readerFallbackModeActive =>
      'రీడర్ ఫాల్‌బ్యాక్ మోడ్ సక్రియంగా ఉంది';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return '$extension ఫైల్‌ల కోసం ఎంబెడెడ్ డాక్యుమెంట్ ఇంజిన్‌ను ఈ ప్లాట్‌ఫారమ్ హోస్ట్ చేయలేదు.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'మద్దతు ఉన్న ప్లాట్‌ఫారమ్ లక్ష్యానికి (Android, iOS, macOS) మారిన తర్వాత రీలోడ్ రీడర్‌ని ఉపయోగించండి.';

  @override
  String get openExternally => 'బాహ్యంగా తెరవండి';

  @override
  String get noEpubChaptersFound => 'EPUB అధ్యాయాలు ఏవీ కనుగొనబడలేదు.';

  @override
  String get readerNotReady => 'రీడర్ సిద్ధంగా లేరు.';

  @override
  String get seriesRecordings => 'సిరీస్ రికార్డింగ్‌లు';

  @override
  String get now => 'ఇప్పుడు';

  @override
  String get sports => 'క్రీడలు';

  @override
  String get news => 'వార్తలు';

  @override
  String get kids => 'పిల్లలు';

  @override
  String get premiere => 'ప్రీమియర్';

  @override
  String get guideTimeline => 'గైడ్ టైమ్‌లైన్';

  @override
  String failedToLoadGuide(String error) {
    return 'గైడ్‌ను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get noChannelsFound => 'ఛానెల్‌లు ఏవీ కనుగొనబడలేదు';

  @override
  String get liveBadge => 'ప్రత్యక్ష ప్రసారం';

  @override
  String guideNextProgram(String time, String title) {
    return 'తదుపరి: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutesని మిగిలి ఉంది';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hoursగం మిగిలి ఉంది';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hoursగం $minutesని మిగిలి ఉంది';
  }

  @override
  String get movie => 'సినిమా';

  @override
  String get removedFromFavoriteChannels =>
      'ఇష్టమైన ఛానెల్‌ల నుండి తీసివేయబడింది';

  @override
  String get addedToFavoriteChannels => 'ఇష్టమైన ఛానెల్‌లకు జోడించబడింది';

  @override
  String get failedToUpdateFavoriteChannel =>
      'ఇష్టమైన ఛానెల్‌ని నవీకరించడంలో విఫలమైంది';

  @override
  String get unfavoriteChannel => 'నచ్చని ఛానెల్';

  @override
  String get favoriteChannel => 'ఇష్టమైన ఛానెల్';

  @override
  String get record => 'రికార్డ్ చేయండి';

  @override
  String get cancelRecordingAction => 'రికార్డింగ్‌ను రద్దు చేయండి';

  @override
  String get programSetToRecord =>
      'ప్రోగ్రామ్ రికార్డ్ చేయడానికి సెట్ చేయబడింది';

  @override
  String get recordingCancelled => 'రికార్డింగ్ రద్దు చేయబడింది';

  @override
  String get unableToCreateRecording => 'రికార్డింగ్‌ను సృష్టించడం సాధ్యపడలేదు';

  @override
  String get watch => 'చూడండి';

  @override
  String get close => 'మూసివేయండి';

  @override
  String failedToPlayChannel(String name) {
    return '$nameను ప్లే చేయడం విఫలమైంది';
  }

  @override
  String get failedToLoadRecordings => 'రికార్డింగ్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get scheduledInNext24Hours => 'తదుపరి 24 గంటల్లో షెడ్యూల్ చేయబడింది';

  @override
  String get recentRecordings => 'ఇటీవలి రికార్డింగ్‌లు';

  @override
  String get tvSeries => 'TV సిరీస్';

  @override
  String get failedToLoadSchedule => 'షెడ్యూల్‌ను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get noScheduledRecordings => 'షెడ్యూల్ చేయబడిన రికార్డింగ్‌లు లేవు';

  @override
  String get cancelRecording => 'రికార్డింగ్‌ని రద్దు చేయాలా?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '\"$name\" షెడ్యూల్ చేసిన రికార్డింగ్‌ను రద్దు చేయాలా?';
  }

  @override
  String get no => 'కాదు';

  @override
  String get yesCancel => 'అవును, రద్దు చేయి';

  @override
  String get failedToCancelRecording =>
      'రికార్డింగ్‌ని రద్దు చేయడంలో విఫలమైంది';

  @override
  String get failedToLoadSeriesRecordings =>
      'సిరీస్ రికార్డింగ్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get noSeriesRecordings => 'సిరీస్ రికార్డింగ్‌లు లేవు';

  @override
  String get cancelSeriesRecording => 'సిరీస్ రికార్డింగ్‌ని రద్దు చేయండి';

  @override
  String get cancelSeriesRecordingQuestion =>
      'సిరీస్ రికార్డింగ్‌ని రద్దు చేయాలా?';

  @override
  String stopRecordingName(String name) {
    return '\"$name\" రికార్డింగ్‌ను ఆపాలా?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'సిరీస్ రికార్డింగ్‌ను రద్దు చేయడంలో విఫలమైంది';

  @override
  String get searchThisLibrary => 'ఈ లైబ్రరీని వెతకండి...';

  @override
  String get searchEllipsis => 'శోధన...';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\" కోసం ఫలితాలు లేవు';
  }

  @override
  String searchFailedError(String error) {
    return 'శోధన విఫలమైంది: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr ఖాతా రకం';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'స్థానిక';

  @override
  String get savedMedia => 'సేవ్ చేయబడిన మీడియా';

  @override
  String get tvShows => 'టీవీ కార్యక్రమాలు';

  @override
  String get music => 'సంగీతం';

  @override
  String get musicAlbums => 'సంగీత ఆల్బమ్‌లు';

  @override
  String get noMediaInFilter => 'ఈ ఫిల్టర్‌లో మీడియా లేదు';

  @override
  String get noDownloadedMediaYet => 'ఇంకా డౌన్‌లోడ్ చేయబడిన మీడియా లేదు';

  @override
  String get browseLibrary => 'లైబ్రరీని బ్రౌజ్ చేయండి';

  @override
  String get deleteDownload => 'డౌన్‌లోడ్‌ను తొలగించండి';

  @override
  String removeItemAndFiles(String name) {
    return '\"$name\"ని, దాని ఫైల్‌లను తీసివేయాలా?';
  }

  @override
  String tracksCount(int count) {
    return '$count ట్రాక్‌లు';
  }

  @override
  String get album => 'ఆల్బమ్';

  @override
  String get playAlbum => 'ఆల్బమ్ ప్లే చేయండి';

  @override
  String failedToLoadAlbum(String error) {
    return 'ఆల్బమ్‌ను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name కోసం డౌన్‌లోడ్ చేసిన ట్రాక్‌లు ఏవీ లేవు.';
  }

  @override
  String get season => 'సీజన్';

  @override
  String get errorLoadingEpisodes => 'ఎపిసోడ్‌లను లోడ్ చేయడంలో లోపం';

  @override
  String get noDownloadedEpisodes => 'డౌన్‌లోడ్ చేయబడిన ఎపిసోడ్‌లు లేవు';

  @override
  String get deleteEpisode => 'ఎపిసోడ్‌ను తొలగించండి';

  @override
  String removeName(String name) {
    return '\"$name\"ని తీసివేయాలా?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes ని';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'ఎపిసోడ్ $number';
  }

  @override
  String get seriesNotFound => 'సిరీస్ కనుగొనబడలేదు';

  @override
  String get errorLoadingSeries => 'సిరీస్‌ను లోడ్ చేయడంలో లోపం';

  @override
  String get downloadedEpisodes => 'డౌన్‌లోడ్ చేసిన ఎపిసోడ్‌లు';

  @override
  String seasonNumber(int number) {
    return 'సీజన్ $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'ప్రత్యేకతలు';

  @override
  String get deleteSeason => 'సీజన్‌ని తొలగించండి';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '$seasonలో డౌన్‌లోడ్ చేసిన అన్ని ఎపిసోడ్‌లను తొలగించాలా?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ఎపిసోడ్‌లు',
      one: '1 ఎపిసోడ్',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'నిల్వ నిర్వహణ';

  @override
  String get storageBreakdown => 'నిల్వ విచ్ఛిన్నం';

  @override
  String get downloadedItems => 'డౌన్‌లోడ్ చేసిన అంశాలు';

  @override
  String get storageLimit => 'నిల్వ పరిమితి';

  @override
  String get noLimit => 'పరిమితి లేదు';

  @override
  String get deleteAllDownloads => 'అన్ని డౌన్‌లోడ్‌లను తొలగించండి';

  @override
  String get deleteAllDownloadsWarning =>
      'ఇది డౌన్‌లోడ్ చేయబడిన అన్ని మీడియా ఫైల్‌లను తీసివేస్తుంది మరియు రద్దు చేయబడదు.';

  @override
  String get deleteAll => 'అన్నింటినీ తొలగించండి';

  @override
  String get deleteSelected => 'ఎంచుకున్న వాటిని తొలగించండి';

  @override
  String deleteSelectedCount(int count) {
    return 'డౌన్‌లోడ్ చేసిన $count అంశాలను తొలగించాలా?';
  }

  @override
  String get musicAndAudiobooks => 'సంగీతం & ఆడియోబుక్స్';

  @override
  String get images => 'చిత్రాలు';

  @override
  String get database => 'డేటాబేస్';

  @override
  String ofStorageLimit(String limit) {
    return '$limit పరిమితిలో';
  }

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get authentication => 'ప్రమాణీకరణ';

  @override
  String get autoLoginServerManagement => 'ఆటో లాగిన్, సర్వర్ నిర్వహణ';

  @override
  String get pinCode => 'పిన్ కోడ్';

  @override
  String get setUpPinCodeProtection => 'పిన్ కోడ్ రక్షణను సెటప్ చేయండి';

  @override
  String get parentalControls => 'తల్లిదండ్రుల నియంత్రణలు';

  @override
  String get contentRatingRestrictions => 'కంటెంట్ రేటింగ్ పరిమితులు';

  @override
  String get bitRateResolutionBehavior => 'బిట్రేట్, రిజల్యూషన్, ప్రవర్తన';

  @override
  String get languageSizeAppearance => 'భాష, పరిమాణం, స్వరూపం';

  @override
  String get qualityStorage => 'నాణ్యత, నిల్వ';

  @override
  String get serverSyncAndPluginStatus =>
      'సర్వర్ సమకాలీకరణ మరియు ప్లగిన్ స్థితి';

  @override
  String get mediaRequestIntegration => 'మీడియా అభ్యర్థన ఏకీకరణ';

  @override
  String get switchServer => 'సర్వర్ మారండి';

  @override
  String get signOut => 'సైన్ అవుట్ చేయండి';

  @override
  String get versionLicenses => 'వెర్షన్, లైసెన్సులు';

  @override
  String get account => 'ఖాతా';

  @override
  String get signInAndSecurity => 'సైన్-ఇన్ మరియు భద్రత';

  @override
  String get administration => 'పరిపాలన';

  @override
  String get serverSettingsUsersLibraries =>
      'సర్వర్ సెట్టింగ్‌లు, వినియోగదారులు, లైబ్రరీలు';

  @override
  String get customization => 'అనుకూలీకరణ';

  @override
  String get themeAndLayout => 'థీమ్ మరియు లేఅవుట్';

  @override
  String get videoAndSubtitles => 'వీడియో మరియు ఉపశీర్షికలు';

  @override
  String get integrations => 'ఇంటిగ్రేషన్లు';

  @override
  String get pluginAndRequests => 'ప్లగిన్ మరియు అభ్యర్థనలు';

  @override
  String get customizeAccountPlaybackInterface =>
      'ఖాతా, ప్లేబ్యాక్ మరియు ఇంటర్‌ఫేస్ ప్రవర్తనను అనుకూలీకరించండి';

  @override
  String optionsCount(int count) {
    return '$count ఎంపికలు';
  }

  @override
  String get themeAndAppearance => 'థీమ్ & స్వరూపం';

  @override
  String get focusBorderColor => 'ఫోకస్ అంచు రంగు';

  @override
  String get watchedIndicators => 'సూచికలను వీక్షించారు';

  @override
  String get always => 'ఎల్లప్పుడూ';

  @override
  String get hideUnwatched => 'చూడనివి దాచు';

  @override
  String get episodesOnly => 'ఎపిసోడ్‌లు మాత్రమే';

  @override
  String get never => 'ఎప్పుడూ';

  @override
  String get focusExpansionAnimation => 'ఫోకస్ విస్తరణ యానిమేషన్';

  @override
  String get desktopUiScale => 'డెస్క్‌టాప్ UI స్కేల్';

  @override
  String get scaleFocusedCards =>
      'స్కేల్ ఫోకస్డ్ లేదా హోవర్డ్ కార్డ్‌లు మరియు టైల్స్';

  @override
  String get backgroundBackdrops => 'నేపథ్య నేపథ్యాలు';

  @override
  String get showBackdropImages =>
      'కంటెంట్ వెనుక బ్యాక్‌డ్రాప్ చిత్రాలను చూపండి';

  @override
  String get seriesThumbnails => 'సిరీస్ సూక్ష్మచిత్రాలు';

  @override
  String get seriesThumbnailsDescription =>
      'ఎపిసోడ్‌లు మాత్రమే: ప్రతి అడ్డు వరుస చిత్ర రకానికి సరిపోయే సిరీస్ ఆర్ట్‌వర్క్‌ని ఉపయోగించండి';

  @override
  String get homeRowInfoOverlay => 'హోమ్ వరుస సమాచార అతివ్యాప్తి';

  @override
  String get showTitleMetadataOnHomeRows =>
      'హోమ్ అడ్డు వరుసలను బ్రౌజ్ చేస్తున్నప్పుడు శీర్షిక మరియు మెటాడేటాను చూపండి';

  @override
  String get clockDisplay => 'గడియార ప్రదర్శన';

  @override
  String get inMenus => 'మెనూలలో';

  @override
  String get inVideo => 'వీడియోలో';

  @override
  String get seasonalEffects => 'కాలానుగుణ ప్రభావాలు';

  @override
  String get seasonalEffectsDescription =>
      'విజువల్ ఎఫెక్ట్స్ మరియు కాలానుగుణ అలంకరణలు';

  @override
  String get snow => 'మంచు';

  @override
  String get fireworks => 'బాణసంచా';

  @override
  String get confetti => 'కాన్ఫెట్టి';

  @override
  String get fallingLeaves => 'ఫాలింగ్ లీవ్స్';

  @override
  String get themeMusic => 'థీమ్ సంగీతం';

  @override
  String get playThemeMusicOnDetailPages =>
      'వివరాల పేజీలలో థీమ్ సంగీతాన్ని ప్లే చేయండి';

  @override
  String get themeMusicVolume => 'థీమ్ మ్యూజిక్ వాల్యూమ్';

  @override
  String get themeMusicSettingsSubtitle =>
      'వివరాల పేజీలు, హోమ్ వరుసలు, వాల్యూమ్';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'హోమ్ వరుసలలో థీమ్ సంగీతం';

  @override
  String get playWhenBrowsingHomeScreen =>
      'హోమ్ స్క్రీన్‌ని బ్రౌజ్ చేస్తున్నప్పుడు ప్లే చేయండి';

  @override
  String get loopThemeMusic => 'థీమ్ మ్యూజిక్‌ను లూప్ చేయండి';

  @override
  String get loopThemeMusicSubtitle =>
      'ట్రాక్‌ను ఒకసారి ప్లే చేయడానికి బదులుగా పునరావృతం చేయండి';

  @override
  String get detailsBackgroundBlur => 'వివరాలు బ్యాక్‌గ్రౌండ్ బ్లర్';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'బ్రౌజింగ్ బ్యాక్‌గ్రౌండ్ బ్లర్';

  @override
  String get maxStreamingBitrate => 'గరిష్ట స్ట్రీమింగ్ బిట్రేట్';

  @override
  String get maxResolution => 'గరిష్ట రిజల్యూషన్';

  @override
  String get playerZoomMode => 'ప్లేయర్ జూమ్ మోడ్';

  @override
  String get settingsScrollWheelAction => 'మౌస్ స్క్రోల్ వీల్';

  @override
  String get settingsScrollWheelActionDescription =>
      'ప్లేబ్యాక్ సమయంలో వీడియోపై మౌస్ వీల్‌ను స్క్రోల్ చేస్తే ఏమి జరగాలో ఎంచుకోండి.';

  @override
  String get scrollWheelActionOff => 'ఆఫ్';

  @override
  String get scrollWheelActionSeek => 'సీక్ (ముందుకు / వెనుకకు)';

  @override
  String get scrollWheelActionVolume => 'వాల్యూమ్';

  @override
  String get playerTooltipVolume => 'వాల్యూమ్';

  @override
  String get fit => 'ఫిట్';

  @override
  String get autoCrop => 'ఆటో క్రాప్';

  @override
  String get stretch => 'సాగదీయండి';

  @override
  String get refreshRateSwitching => 'రిఫ్రెష్ రేట్ స్విచింగ్';

  @override
  String get disabled => 'నిలిపివేయబడింది';

  @override
  String get scaleOnTv => 'టీవీలో స్కేల్';

  @override
  String get scaleOnDevice => 'పరికరంలో స్కేల్';

  @override
  String get trickPlay => 'ట్రిక్ ప్లే';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'కోరుతున్నప్పుడు ప్రివ్యూ థంబ్‌నెయిల్‌లను చూపండి';

  @override
  String get showDescriptionOnPause => 'పాజ్‌లో వివరణను చూపు';

  @override
  String get dimVideoShowOverview =>
      'వీడియోను మసకబారండి మరియు పాజ్ చేయబడినప్పుడు స్థూలదృష్టి వచనాన్ని చూపండి';

  @override
  String get osdLockButton => 'OSD లాక్ బటన్';

  @override
  String get osdLockButtonDescription =>
      'ఎక్కువసేపు నొక్కినంత వరకు టచ్ ఇన్‌పుట్‌ను నిరోధించే లాక్ బటన్‌ను చూపండి';

  @override
  String get audioBehavior => 'ఆడియో ప్రవర్తన';

  @override
  String get downmixToStereo => 'స్టీరియోకి డౌన్‌మిక్స్ చేయండి';

  @override
  String get defaultAudioLanguage => 'డిఫాల్ట్ ఆడియో భాష';

  @override
  String get fallbackAudioLanguage => 'ప్రత్యామ్నాయ ఆడియో భాష';

  @override
  String get preferDefaultAudioTrack =>
      'డిఫాల్ట్ ఆడియో ట్రాక్‌కు ప్రాధాన్యం ఇవ్వండి';

  @override
  String get preferDefaultAudioTrackDescription =>
      'స్థానికీకరించిన డబ్ కంటే అసలైన ఆడియో ట్రాక్‌కు ప్రాధాన్యం ఇవ్వండి.';

  @override
  String get preferAudioDescription =>
      'ఆడియో వివరణ ట్రాక్‌లకు ప్రాధాన్యం ఇవ్వండి';

  @override
  String get preferAudioDescriptionDescription =>
      'సాధారణ ట్రాక్‌ల కంటే ఆడియో వివరణ ట్రాక్‌లకు ప్రాధాన్యం ఇవ్వండి.';

  @override
  String get transcodingAudio => 'ట్రాన్స్‌కోడింగ్ (ఆడియో)';

  @override
  String get directStreamRemux => 'డైరెక్ట్ స్ట్రీమ్ (రీమక్స్)';

  @override
  String get transcodingBitrateOrResolution =>
      'ట్రాన్స్‌కోడింగ్ (బిట్‌రేట్ లేదా రిజల్యూషన్)';

  @override
  String get transcodingVideoAndAudio => 'ట్రాన్స్‌కోడింగ్ (వీడియో & ఆడియో)';

  @override
  String get transcodingVideo => 'ట్రాన్స్‌కోడింగ్ (వీడియో)';

  @override
  String get autoServerDefault => 'ఆటో (సర్వర్ డిఫాల్ట్)';

  @override
  String get english => 'ఇంగ్లీష్';

  @override
  String get spanish => 'స్పానిష్';

  @override
  String get french => 'ఫ్రెంచ్';

  @override
  String get german => 'జర్మన్';

  @override
  String get italian => 'ఇటాలియన్';

  @override
  String get portuguese => 'పోర్చుగీస్';

  @override
  String get japanese => 'జపనీస్';

  @override
  String get korean => 'కొరియన్';

  @override
  String get chinese => 'చైనీస్';

  @override
  String get russian => 'రష్యన్';

  @override
  String get arabic => 'అరబిక్';

  @override
  String get hindi => 'హిందీ';

  @override
  String get dutch => 'డచ్';

  @override
  String get swedish => 'స్వీడిష్';

  @override
  String get norwegian => 'నార్వేజియన్';

  @override
  String get danish => 'డానిష్';

  @override
  String get finnish => 'ఫిన్నిష్';

  @override
  String get polish => 'పోలిష్';

  @override
  String get ac3Passthrough => 'AC3 పాస్‌త్రూ';

  @override
  String get dtsPassthrough => 'DTS పాస్‌త్రూ';

  @override
  String get trueHdSupport => 'TrueHD మద్దతు';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS ఆడియో AVRకి మాత్రమే; రిసీవర్ మద్దతు మరియు DTS సోర్స్ ట్రాక్ అవసరం';

  @override
  String get enableTrueHdAudio =>
      'TrueHD ఆడియోను ప్రారంభించండి (అన్ని ప్లాట్‌ఫారమ్‌లలో పని చేయకపోవచ్చు)';

  @override
  String get settingsAudioOutputMode => 'ఆడియో అవుట్‌పుట్ మోడ్';

  @override
  String get settingsAudioOutputModeDescription =>
      'ఆడియో ఎలా డీకోడ్ చేయబడాలో ఎంచుకోండి. AVR పాస్‌త్రూ ముడి Dolby/DTS స్ట్రీమ్‌లను మీ రిసీవర్‌కు పంపుతుంది; ఆటో లేదా డౌన్‌మిక్స్ స్థానికంగా డీకోడ్ చేస్తుంది.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR పాస్‌త్రూ';

  @override
  String get settingsAudioFallbackCodec => 'ఆడియో ప్రత్యామ్నాయ కోడెక్';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'మూల స్ట్రీమ్‌ను నేరుగా ప్లే చేయలేని లేదా పాస్‌త్రూ చేయలేని సందర్భంలో మల్టీ-ఛానల్ ఆడియోను ట్రాన్స్‌కోడ్ చేయడానికి లక్ష్య ఫార్మాట్‌ను ఎంచుకోండి.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'ఆటో డిటెక్ట్\n(సిఫార్సు చేయబడింది)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(డిఫాల్ట్)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(నష్టం లేని)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(స్టీరియో మాత్రమే)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(సమర్థవంతమైన)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(నష్టం లేని)';

  @override
  String get settingsMaxAudioChannels => 'గరిష్ఠ ఆడియో ఛానెల్‌లు';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'మీ ఆడియో సెటప్ గరిష్ఠ ఛానెల్‌లను కాన్ఫిగర్ చేయండి. ఈ పరిమితిని మించిన మల్టీఛానల్ స్ట్రీమ్‌లు డౌన్‌మిక్స్ లేదా ట్రాన్స్‌కోడ్ అవుతాయి.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'ఆటో డిటెక్ట్\n(హార్డ్‌వేర్ డిఫాల్ట్)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 మోనో';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 స్టీరియో';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 సరౌండ్';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 క్వాడ్రాఫోనిక్';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 సరౌండ్';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 సరౌండ్';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 సరౌండ్';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 సరౌండ్';

  @override
  String get settingsAudioPassthroughAdvanced => 'పాస్‌త్రూ (అధునాతన)';

  @override
  String get settingsAudioCodecPassthrough => 'కోడెక్ పాస్‌త్రూ';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'మీ AVR లేదా HDMI సింక్ మద్దతిచ్చే ఫార్మాట్‌లను మాత్రమే ప్రారంభించండి.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 పాస్‌త్రూ';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) పాస్‌త్రూ';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core పాస్‌త్రూ';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA పాస్‌త్రూ';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD పాస్‌త్రూ';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos పాస్‌త్రూ';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3)ను బాహ్య డీకోడర్‌కు బిట్‌స్ట్రీమ్ చేస్తుంది.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) ద్వారా Dolby Atmosను బాహ్య డీకోడర్‌కు బిట్‌స్ట్రీమ్ చేస్తుంది.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS core కలిపి)ను బాహ్య డీకోడర్‌కు బిట్‌స్ట్రీమ్ చేస్తుంది.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos మెటాడేటాతో Dolby TrueHDను బాహ్య డీకోడర్‌కు బిట్‌స్ట్రీమ్ చేస్తుంది.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'గుర్తించిన ఆడియో సామర్థ్యాలు';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'రన్‌టైమ్ సామర్థ్య స్నాప్‌షాట్ ఇంకా అందుబాటులో లేదు.';

  @override
  String get settingsAudioRouteLabel => 'మార్గం';

  @override
  String get settingsAudioDecodeLabel => 'డీకోడ్';

  @override
  String get settingsAudioPassthroughLabel => 'పాస్‌త్రూ';

  @override
  String get settingsAudioHdRoute => 'HD ఆడియో మార్గం';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'స్పీకర్';

  @override
  String get settingsAudioRouteHeadphones => 'హెడ్‌ఫోన్‌లు';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'డయాగ్నోస్టిక్స్';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'వీడియో లెవల్';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'వీడియో పరిధి';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'సబ్‌టైటిల్ కోడెక్';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'అనుమతించిన ఆడియో కోడెక్‌లు';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS ఆడియో కోడెక్‌లు';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 ఆడియో కోడెక్‌లు';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif పాస్‌త్రూ';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'సక్రియ ఆడియో మార్గం';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'మార్గం HD ఆడియో మద్దతు';

  @override
  String get nightMode => 'రాత్రి మోడ్';

  @override
  String get compressDynamicRange => 'డైనమిక్ పరిధిని కుదించండి';

  @override
  String get advancedMpv => 'అధునాతన mpv';

  @override
  String get enableCustomMpvConf => 'అనుకూల mpv.confను ప్రారంభించండి';

  @override
  String get applyMpvConfBeforePlayback =>
      'ప్లేబ్యాక్ ప్రారంభం కావడానికి ముందు వినియోగదారు పేర్కొన్న mpv.confని వర్తింపజేయండి';

  @override
  String get unsafeAdvancedMpvOptions => 'అసురక్షిత అధునాతన mpv ఎంపికలు';

  @override
  String get unsafeMpvOptionsDescription =>
      'విస్తృతమైన mpv ఎంపికలను అనుమతించండి. ప్లేబ్యాక్ ప్రవర్తనను విచ్ఛిన్నం చేయవచ్చు.';

  @override
  String get hardwareDecoding => 'హార్డ్‌వేర్ డీకోడింగ్';

  @override
  String get hardwareDecodingSubtitle =>
      'పనితీరును మెరుగుపరచవచ్చు కానీ కొన్ని పరికరాలలో ప్లేబ్యాక్ సమస్యలను కలిగిస్తుంది.';

  @override
  String get nextUpAndQueuing => 'తదుపరి & క్యూయింగ్';

  @override
  String get nextUpDisplay => 'తదుపరి ప్రదర్శన';

  @override
  String get extended => 'పొడిగించబడింది';

  @override
  String get minimal => 'కనిష్టమైనది';

  @override
  String get nextUpTimeout => 'తదుపరి సమయం ముగిసింది';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'మీడియా క్యూలో ఉంది';

  @override
  String get autoQueueNextEpisodes => 'తదుపరి ఎపిసోడ్‌లను ఆటో-క్యూలో ఉంచండి';

  @override
  String get stillWatchingPrompt => 'ఇంకా ప్రాంప్ట్‌ని చూస్తున్నారు';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes ఎపిసోడ్‌లు / $hoursగం తర్వాత';
  }

  @override
  String get resumeAndSkip => 'రెజ్యూమ్ & స్కిప్';

  @override
  String get resumeRewind => 'రివైండ్‌ని పునఃప్రారంభించండి';

  @override
  String get unpauseRewind => 'రివైండ్‌ని నిలిపివేయండి';

  @override
  String get fiveSeconds => '5 సెకన్లు';

  @override
  String get tenSeconds => '10 సెకన్లు';

  @override
  String get fifteenSeconds => '15 సెకన్లు';

  @override
  String get thirtySeconds => '30 సెకన్లు';

  @override
  String get skipBackLength => 'స్కిప్ బ్యాక్ లెంగ్త్';

  @override
  String get skipForwardLength => 'ఫార్వర్డ్ లెంగ్త్ దాటవేయి';

  @override
  String get customMpvConfPath => 'అనుకూల mpv.conf మార్గం';

  @override
  String get notSetMpvConf =>
      'సెట్ కాలేదు. Moonfin యాప్/డేటా ఫోల్డర్‌లలో డిఫాల్ట్ mpv.confని ప్రయత్నిస్తుంది.';

  @override
  String get selectMpvConf => 'mpv.confని ఎంచుకోండి';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'శైలి సెట్టింగ్‌లు (పరిమాణం, రంగు, ఆఫ్‌సెట్) టెక్స్ట్-ఆధారిత ఉపశీర్షికలకు (SRT, VTT, TTML) వర్తిస్తాయి. \"ASS/SSA డైరెక్ట్ ప్లే\" ఆఫ్ చేయబడితే మినహా ASS/SSA ఉపశీర్షికలు వాటి స్వంత ఎంబెడెడ్ స్టైలింగ్‌ని ఉపయోగిస్తాయి. బిట్‌మ్యాప్ ఉపశీర్షికలను (PGS, DVB, VobSub) రీస్టైల్ చేయడం సాధ్యం కాదు.';

  @override
  String get defaultSubtitleLanguage => 'డిఫాల్ట్ ఉపశీర్షిక భాష';

  @override
  String get defaultToNoSubtitles => 'ఉపశీర్షికలు లేవు డిఫాల్ట్';

  @override
  String get turnOffSubtitlesByDefault => 'ఉపశీర్షికలను డిఫాల్ట్‌గా ఆఫ్ చేయండి';

  @override
  String get subtitleSize => 'ఉపశీర్షిక పరిమాణం';

  @override
  String get textFillColor => 'టెక్స్ట్ ఫిల్ కలర్';

  @override
  String get backgroundColor => 'నేపథ్య రంగు';

  @override
  String get textStrokeColor => 'టెక్స్ట్ స్ట్రోక్ రంగు';

  @override
  String get subtitleCustomization => 'ఉపశీర్షిక అనుకూలీకరణ';

  @override
  String get subtitleCustomizationDescription =>
      'ఉపశీర్షిక రూపాన్ని అనుకూలీకరించండి';

  @override
  String get subtitleMode => 'సబ్‌టైటిల్ మోడ్';

  @override
  String get subtitleModeFlagged => 'ఫ్లాగ్ చేయబడింది';

  @override
  String get subtitleModeAlways => 'ఎల్లప్పుడూ';

  @override
  String get subtitleModeForeign => 'విదేశీ';

  @override
  String get subtitleModeForced => 'బలవంతం';

  @override
  String get subtitleModeFlaggedDescription =>
      'మీడియా ఫైల్ మెటాడేటాలో అంతర్గతంగా \"default\" లేదా \"forced\"గా ఫ్లాగ్ చేయబడిన ట్రాక్‌లను ప్లే చేస్తుంది.';

  @override
  String get subtitleModeAlwaysDescription =>
      'వీడియో ప్రారంభమయ్యే ప్రతిసారీ సబ్‌టైటిల్‌లను స్వయంచాలకంగా లోడ్ చేసి ప్రదర్శిస్తుంది.';

  @override
  String get subtitleModeForeignDescription =>
      'డిఫాల్ట్ ఆడియో ట్రాక్ విదేశీ భాషలో ఉంటే సబ్‌టైటిల్‌లను స్వయంచాలకంగా ఆన్ చేస్తుంది.';

  @override
  String get subtitleModeForcedDescription =>
      'forced మెటాడేటా ఫ్లాగ్‌తో స్పష్టంగా ట్యాగ్ చేయబడిన సబ్‌టైటిల్‌లను మాత్రమే లోడ్ చేస్తుంది.';

  @override
  String get subtitleModeNoneDescription =>
      'స్వయంచాలక సబ్‌టైటిల్ లోడింగ్‌ను పూర్తిగా నిలిపివేస్తుంది.';

  @override
  String get fallbackSubtitleLanguage => 'ప్రత్యామ్నాయ సబ్‌టైటిల్ భాష';

  @override
  String get subtitleStream => 'సబ్‌టైటిల్ స్ట్రీమ్';

  @override
  String get subtitlePreviewText =>
      'త్వరిత గోధుమ నక్క సోమరి కుక్కపైకి దూకుతుంది';

  @override
  String get verticalOffset => 'నిలువు ఆఫ్‌సెట్';

  @override
  String get pgsDirectPlay => 'PGS డైరెక్ట్ ప్లే';

  @override
  String get directPlayPgsSubtitles => 'డైరెక్ట్ ప్లే PGS ఉపశీర్షికలు';

  @override
  String get assSsaDirectPlay => 'ASS/SSA డైరెక్ట్ ప్లే';

  @override
  String get directPlayAssSsaSubtitles =>
      'ASS/SSA ఉపశీర్షికలను నేరుగా ప్లే చేయండి';

  @override
  String get white => 'తెలుపు';

  @override
  String get black => 'నలుపు';

  @override
  String get yellow => 'పసుపు';

  @override
  String get green => 'ఆకుపచ్చ';

  @override
  String get cyan => 'నీలవర్ణం';

  @override
  String get red => 'ఎరుపు';

  @override
  String get transparent => 'పారదర్శకం';

  @override
  String get semiTransparentBlack => 'సెమీ పారదర్శక నలుపు';

  @override
  String get global => 'గ్లోబల్';

  @override
  String get desktop => 'డెస్క్‌టాప్';

  @override
  String get mobile => 'మొబైల్';

  @override
  String get tv => 'టీవీ';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile ప్రొఫైల్ సెట్టింగ్‌లు లోడ్ చేయబడ్డాయి.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile ప్రొఫైల్ సెట్టింగ్‌లను లోడ్ చేయడం విఫలమైంది.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'స్థానిక సెట్టింగ్‌లు $profile ప్రొఫైల్‌కు సింక్ చేయబడ్డాయి.';
  }

  @override
  String get customizationProfile => 'అనుకూలీకరణ ప్రొఫైల్';

  @override
  String get customizationProfileDescription =>
      'లోడ్ చేయడానికి, సవరించడానికి మరియు సమకాలీకరించడానికి ప్రొఫైల్‌ను ఎంచుకోండి. పరికర ప్రొఫైల్ దానిని భర్తీ చేయకపోతే గ్లోబల్ ప్రతిచోటా వర్తిస్తుంది. ఆకుపచ్చ చుక్క మీ ప్రస్తుత పరికర ప్రొఫైల్‌ను సూచిస్తుంది.';

  @override
  String get loadProfile => 'ప్రొఫైల్‌ను లోడ్ చేయండి';

  @override
  String get syncing => 'సమకాలీకరిస్తోంది...';

  @override
  String get syncToProfile => 'ప్రొఫైల్‌కు సమకాలీకరించండి';

  @override
  String get profileSyncHidden => 'ప్రొఫైల్ సమకాలీకరణ దాచబడింది';

  @override
  String get enablePluginSyncDescription =>
      'ప్రొఫైల్ నియంత్రణలను ఇక్కడ చూపడానికి ప్లగిన్ సెట్టింగ్‌లలో సర్వర్ ప్లగిన్ సమకాలీకరణను ప్రారంభించండి.';

  @override
  String get quality => 'నాణ్యత';

  @override
  String get defaultDownloadQuality => 'డిఫాల్ట్ డౌన్‌లోడ్ నాణ్యత';

  @override
  String get network => 'నెట్‌వర్క్';

  @override
  String get wifiOnlyDownloads => 'WiFi-మాత్రమే డౌన్‌లోడ్‌లు';

  @override
  String get reportDownloadsActivity => 'సర్వర్‌లో డౌన్‌లోడ్‌లను చూపించండి';

  @override
  String get reportDownloadsActivitySubtitle =>
      'మీ ట్రాన్స్‌కోడ్ చేసిన డౌన్‌లోడ్‌లను డాష్‌బోర్డ్‌లో సర్వర్ అడ్మిన్ చూసేందుకు అనుమతించండి';

  @override
  String get onlyDownloadOnWifi =>
      'వైఫైకి కనెక్ట్ చేసినప్పుడు మాత్రమే డౌన్‌లోడ్ చేయండి';

  @override
  String get storage => 'నిల్వ';

  @override
  String get storageUsed => 'వాడిన నిల్వ';

  @override
  String get manage => 'నిర్వహించండి';

  @override
  String get calculating => 'లెక్కిస్తోంది...';

  @override
  String get downloadLocation => 'స్థానాన్ని డౌన్‌లోడ్ చేయండి';

  @override
  String get defaultLabel => 'డిఫాల్ట్';

  @override
  String get saveToDownloadsFolder => 'డౌన్‌లోడ్‌ల ఫోల్డర్‌లో సేవ్ చేయండి';

  @override
  String get downloadsVisibleToOtherApps =>
      'డౌన్‌లోడ్‌లు/Moonfin — ఇతర యాప్‌లకు కనిపిస్తుంది';

  @override
  String get dangerZone => 'డేంజర్ జోన్';

  @override
  String get clearAllDownloads => 'అన్ని డౌన్‌లోడ్‌లను క్లియర్ చేయండి';

  @override
  String get original => 'అసలైనది';

  @override
  String get changeDownloadLocation => 'డౌన్‌లోడ్ స్థానాన్ని మార్చండి';

  @override
  String get changeDownloadLocationDescription =>
      'కొత్త డౌన్‌లోడ్‌లు ఎంచుకున్న ఫోల్డర్‌లో సేవ్ చేయబడతాయి. ఇప్పటికే ఉన్న డౌన్‌లోడ్‌లు వాటి ప్రస్తుత స్థానంలోనే ఉంటాయి మరియు నిల్వ సెట్టింగ్‌ల నుండి నిర్వహించబడతాయి.';

  @override
  String get confirm => 'నిర్ధారించండి';

  @override
  String get cannotWriteToFolder =>
      'ఎంచుకున్న ఫోల్డర్‌కి వ్రాయలేరు. దయచేసి వేరే స్థానాన్ని ఎంచుకోండి లేదా నిల్వ అనుమతులను మంజూరు చేయండి.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'డౌన్‌లోడ్‌ల ఫోల్డర్‌లో సేవ్ చేయాలా?';

  @override
  String get saveToDownloadsFolderDescription =>
      'డౌన్‌లోడ్ చేయబడిన మీడియా మీ పరికరంలో డౌన్‌లోడ్‌లు/Moonfinకి సేవ్ చేయబడుతుంది. ఈ ఫైల్‌లు మీ గ్యాలరీ లేదా మ్యూజిక్ ప్లేయర్ వంటి ఇతర యాప్‌లకు కనిపిస్తాయి.\n\nఇప్పటికే ఉన్న డౌన్‌లోడ్‌లు వాటి ప్రస్తుత స్థానంలోనే ఉంటాయి.';

  @override
  String get enable => 'ప్రారంభించు';

  @override
  String get clearAllDownloadsWarning =>
      'ఇది డౌన్‌లోడ్ చేయబడిన అన్ని మీడియాలను తొలగిస్తుంది మరియు రద్దు చేయబడదు.';

  @override
  String get clearAll => 'అన్నీ క్లియర్ చేయండి';

  @override
  String get navigationStyle => 'నావిగేషన్ శైలి';

  @override
  String get topBar => 'టాప్ బార్';

  @override
  String get leftSidebar => 'ఎడమ సైడ్‌బార్';

  @override
  String get showShuffleButton => 'షఫుల్ బటన్‌ని చూపించు';

  @override
  String get showGenresButton => 'జనర్స్ బటన్‌ని చూపించు';

  @override
  String get showFavoritesButton => 'ఇష్టమైనవి బటన్‌ను చూపించు';

  @override
  String get showLibrariesInToolbar => 'టూల్‌బార్‌లో లైబ్రరీలను చూపండి';

  @override
  String get navbarAlwaysExpanded =>
      'నావ్‌బార్ లేబుల్‌లను ఎల్లప్పుడూ విస్తరించండి';

  @override
  String get showSeerrButton => 'Seerr బటన్‌ను చూపించండి';

  @override
  String get navbarOpacity => 'నవబార్ అస్పష్టత';

  @override
  String get navbarColor => 'నవబార్ రంగు';

  @override
  String get gray => 'బూడిద రంగు';

  @override
  String get darkBlue => 'ముదురు నీలం';

  @override
  String get purple => 'ఊదా రంగు';

  @override
  String get teal => 'టీల్';

  @override
  String get navy => 'నౌకాదళం';

  @override
  String get charcoal => 'బొగ్గు';

  @override
  String get brown => 'గోధుమ రంగు';

  @override
  String get darkRed => 'ముదురు ఎరుపు';

  @override
  String get darkGreen => 'ముదురు ఆకుపచ్చ';

  @override
  String get slate => 'స్లేట్';

  @override
  String get indigo => 'నీలిమందు';

  @override
  String get libraryDisplay => 'లైబ్రరీ ప్రదర్శన';

  @override
  String get posterLabel => 'పోస్టర్';

  @override
  String get thumbnailLabel => 'సూక్ష్మచిత్రం';

  @override
  String get bannerLabel => 'బ్యానర్';

  @override
  String get overridePerLibrarySettings =>
      'ప్రతి-లైబ్రరీ సెట్టింగ్‌లను భర్తీ చేయండి';

  @override
  String get applyImageTypeToAllLibraries =>
      'అన్ని లైబ్రరీలకు చిత్ర రకాన్ని వర్తింపజేయండి';

  @override
  String get multiServerLibraries => 'బహుళ-సర్వర్ లైబ్రరీలు';

  @override
  String get showLibrariesFromAllServers =>
      'కనెక్ట్ చేయబడిన అన్ని సర్వర్‌ల నుండి లైబ్రరీలను చూపండి';

  @override
  String get enableFolderView => 'ఫోల్డర్ వీక్షణను ప్రారంభించండి';

  @override
  String get showFolderBrowsingOption => 'ఫోల్డర్ బ్రౌజింగ్ ఎంపికను చూపు';

  @override
  String get groupItemsIntoCollections => 'అంశాలను సేకరణలుగా సమూహపరచండి';

  @override
  String get hideCollectionAssociatedItems =>
      'లైబ్రరీలను బ్రౌజ్ చేస్తున్నప్పుడు సేకరణతో అనుబంధించిన లైబ్రరీ అంశాలను దాచండి';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'లైబ్రరీ సమూహపరిచే గమనిక';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'ఈ సెట్టింగ్‌ను ఉపయోగించడానికి, మీ Jellyfin లేదా Emby సర్వర్‌లో మీ లైబ్రరీ Display సెట్టింగ్‌ల కింద \"Group movies into collections\" మరియు/లేదా \"Group shows into collections\" లైబ్రరీ సెట్టింగ్‌లు ప్రారంభించబడ్డాయని నిర్ధారించుకోండి.';

  @override
  String get libraryVisibility => 'లైబ్రరీ దృశ్యమానత';

  @override
  String get libraryVisibilityDescription =>
      'లైబ్రరీకి హోమ్ పేజీ విజిబిలిటీని టోగుల్ చేయండి. మార్పులు అమలులోకి రావడానికి Moonfinని పునఃప్రారంభించండి.';

  @override
  String get showInNavigation => 'నావిగేషన్‌లో చూపించు';

  @override
  String get showInLatestMedia => 'తాజా మీడియాలో చూపించు';

  @override
  String get sourceLibraries => 'మూల గ్రంథాలయాలు';

  @override
  String get sourceCollections => 'మూల సేకరణలు';

  @override
  String get excludedGenres => 'మినహాయించబడిన శైలులు';

  @override
  String get selectAll => 'అన్నీ ఎంచుకోండి';

  @override
  String itemsSelected(int count) {
    return '$count ఎంపిక చేయబడ్డాయి';
  }

  @override
  String get mediaBar => 'మీడియా బార్';

  @override
  String get mediaSources => 'మీడియా మూలాలు';

  @override
  String get behavior => 'ప్రవర్తన';

  @override
  String get seconds => 'సెకన్లు';

  @override
  String get localPreviews => 'స్థానిక ప్రివ్యూలు';

  @override
  String get localPreviewsDescription =>
      'ట్రైలర్, మీడియా మరియు ఆడియో ప్రివ్యూలను కాన్ఫిగర్ చేయండి.';

  @override
  String get mediaBarMode => 'మీడియా బార్ శైలి';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD మధ్య ఎంచుకోండి లేదా మీడియా బార్‌ను ఆఫ్ చేయండి';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'ఆఫ్';

  @override
  String get enableMediaBar => 'మీడియా బార్‌ని ప్రారంభించండి';

  @override
  String get showFeaturedContentSlideshow =>
      'హోమ్‌లో ఫీచర్ చేసిన కంటెంట్ స్లైడ్‌షోను చూపించు';

  @override
  String get contentType => 'కంటెంట్ రకం';

  @override
  String get moviesAndTvShows => 'సినిమాలు & టీవీ షోలు';

  @override
  String get moviesOnly => 'సినిమాలు మాత్రమే';

  @override
  String get tvShowsOnly => 'టీవీ షోలు మాత్రమే';

  @override
  String get itemCount => 'వస్తువుల సంఖ్య';

  @override
  String get noneSelected => 'ఏదీ ఎంచుకోబడలేదు';

  @override
  String get noneExcluded => 'ఏదీ మినహాయించబడలేదు';

  @override
  String get autoAdvance => 'ఆటో అడ్వాన్స్';

  @override
  String get autoAdvanceSlides => 'స్వయంచాలకంగా తదుపరి స్లయిడ్‌కు వెళ్లండి';

  @override
  String get autoAdvanceInterval => 'ఆటో అడ్వాన్స్ ఇంటర్వెల్';

  @override
  String get trailerPreview => 'ట్రైలర్ ప్రివ్యూ';

  @override
  String get autoPlayTrailers =>
      '3 సెకన్ల తర్వాత మీడియా బార్‌లో ట్రైలర్‌లను ఆటో-ప్లే చేయండి';

  @override
  String get trailerAudio => 'ట్రైలర్ ఆడియో';

  @override
  String get enableTrailerAudio =>
      'మీడియా బార్‌లో ట్రైలర్‌ల కోసం ఆడియోను ప్రారంభించండి';

  @override
  String get episodePreview => 'ఎపిసోడ్ ప్రివ్యూ';

  @override
  String get mediaPreview => 'మీడియా ప్రివ్యూ';

  @override
  String get episodePreviewDescription =>
      'ఫోకస్ చేయబడిన, హోవర్ చేయబడిన లేదా ఎక్కువసేపు నొక్కిన కార్డ్‌లపై 30-సెకన్ల ఇన్‌లైన్ ప్రివ్యూని ప్లే చేయండి';

  @override
  String get mediaPreviewDescription =>
      'ఫోకస్ చేయబడిన, హోవర్ చేయబడిన లేదా ఎక్కువసేపు నొక్కిన కార్డ్‌లపై 30-సెకన్ల ఇన్‌లైన్ ప్రివ్యూని ప్లే చేయండి';

  @override
  String get previewAudio => 'ప్రివ్యూ ఆడియో';

  @override
  String get enablePreviewAudio =>
      'ట్రైలర్ మరియు ఎపిసోడ్ ప్రివ్యూల కోసం ఆడియోను ప్రారంభించండి';

  @override
  String get latestMedia => 'తాజా మీడియా';

  @override
  String get recentlyReleased => 'ఇటీవలే విడుదలైంది';

  @override
  String get myMedia => 'నా మీడియా';

  @override
  String get myMediaSmall => 'నా మీడియా (చిన్న)';

  @override
  String get continueWatching => 'చూడటం కొనసాగించండి';

  @override
  String get resumeAudio => 'ఆడియోను పునఃప్రారంభించండి';

  @override
  String get resumeBooks => 'పుస్తకాలను పునఃప్రారంభించండి';

  @override
  String get activeRecordings => 'యాక్టివ్ రికార్డింగ్‌లు';

  @override
  String get playlists => 'ప్లేజాబితాలు';

  @override
  String get liveTV => 'ప్రత్యక్ష TV';

  @override
  String get homeSections => 'హోమ్ విభాగాలు';

  @override
  String get resetToDefaults => 'డిఫాల్ట్‌లకు రీసెట్ చేయండి';

  @override
  String get homeRowPosterSize => 'హోమ్ రో పోస్టర్ పరిమాణం';

  @override
  String get perRowImageTypeSelection => 'ప్రతి వరుస చిత్రం రకం ఎంపిక';

  @override
  String get configureImageTypeForEachRow =>
      'ప్రారంభించబడిన ప్రతి హోమ్ అడ్డు వరుస కోసం చిత్ర రకాన్ని కాన్ఫిగర్ చేయండి';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'చూడటం కొనసాగించు మరియు తదుపరిది విలీనం చేయండి';

  @override
  String get combineBothRows => 'రెండు అడ్డు వరుసలను ఒకే హోమ్ విభాగంలో కలపండి';

  @override
  String get fullScreenRows => 'విస్తరించిన హోమ్ వరుసలు';

  @override
  String get fullScreenRowsDescription =>
      'హోమ్ వరుసలను స్క్రీన్‌కు 1 వరుసకు పరిమితం చేయండి';

  @override
  String get modernHomeRowsPadding => 'Home Row Padding';

  @override
  String get modernHomeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'ప్రతి వరుస చిత్రం రకం';

  @override
  String get perRowSettings => 'ప్రతి-వరుస సెట్టింగ్‌లు';

  @override
  String get autoLogin => 'ఆటో లాగిన్';

  @override
  String get lastUser => 'చివరి వినియోగదారు';

  @override
  String get currentUser => 'ప్రస్తుత వినియోగదారు';

  @override
  String get alwaysAuthenticate => 'ఎల్లప్పుడూ ప్రమాణీకరించండి';

  @override
  String get requirePasswordWithToken =>
      'నిల్వ చేసిన టోకెన్‌తో కూడా పాస్‌వర్డ్ అవసరం';

  @override
  String get confirmExit => 'నిష్క్రమణను నిర్ధారించండి';

  @override
  String get showConfirmationBeforeExiting =>
      'నిష్క్రమించే ముందు నిర్ధారణను చూపించు';

  @override
  String get blockContentWithRatings =>
      'కింది రేటింగ్‌లతో కంటెంట్‌ను బ్లాక్ చేయండి:';

  @override
  String get noContentRatingsFound =>
      'ఈ సర్వర్‌లో ఇంకా కంటెంట్ రేటింగ్‌లు ఏవీ కనుగొనబడలేదు.';

  @override
  String get couldNotLoadServerRatings =>
      'సర్వర్ రేటింగ్‌లను లోడ్ చేయడం సాధ్యపడలేదు. సేవ్ చేయబడిన రేటింగ్‌లను మాత్రమే చూపుతోంది.';

  @override
  String get couldNotRefreshRatings =>
      'సర్వర్ నుండి రేటింగ్‌లను రిఫ్రెష్ చేయడం సాధ్యపడలేదు. సేవ్ చేయబడిన రేటింగ్‌లను చూపుతోంది.';

  @override
  String get enablePinCode => 'పిన్ కోడ్‌ని ప్రారంభించండి';

  @override
  String get requirePinToAccess => 'మీ ఖాతాను యాక్సెస్ చేయడానికి పిన్ అవసరం';

  @override
  String get changePin => 'పిన్ మార్చండి';

  @override
  String get setNewPinCode => 'కొత్త PIN కోడ్‌ని సెట్ చేయండి';

  @override
  String get removePin => 'PINని తీసివేయండి';

  @override
  String get removePinProtection => 'PIN కోడ్ రక్షణను తీసివేయండి';

  @override
  String get screensaver => 'స్క్రీన్సేవర్';

  @override
  String get inAppScreensaver => 'యాప్‌లో స్క్రీన్‌సేవర్';

  @override
  String get enableBuiltInScreensaver =>
      'అంతర్నిర్మిత స్క్రీన్‌సేవర్‌ని ప్రారంభించండి';

  @override
  String get mode => 'మోడ్';

  @override
  String get libraryArt => 'లైబ్రరీ ఆర్ట్';

  @override
  String get logo => 'లోగో';

  @override
  String get clock => 'గడియారం';

  @override
  String get timeout => 'గడువు ముగిసింది';

  @override
  String minutesShort(int minutes) {
    return '$minutes ని';
  }

  @override
  String get dimmingLevel => 'మసకబారిన స్థాయి';

  @override
  String get maxAgeRating => 'గరిష్ట వయస్సు రేటింగ్';

  @override
  String get any => 'ఏదైనా';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'వయస్సు రేటింగ్ అవసరం';

  @override
  String get onlyShowRatedContent => 'రేట్ చేయబడిన కంటెంట్‌ను మాత్రమే చూపండి';

  @override
  String get showClock => 'గడియారాన్ని చూపించు';

  @override
  String get displayClockDuringScreensaver =>
      'స్క్రీన్‌సేవర్ సమయంలో గడియారాన్ని ప్రదర్శించండి';

  @override
  String get clockModeStatic => 'స్థిరం';

  @override
  String get clockModeBouncing => 'బౌన్సింగ్';

  @override
  String get rottenTomatoesCritics => 'రాటెన్ టొమాటోస్ (విమర్శకులు)';

  @override
  String get rottenTomatoesAudience => 'రాటెన్ టొమాటోస్ (ప్రేక్షకులు)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'మెటాక్రిటిక్';

  @override
  String get metacriticUser => 'మెటాక్రిటిక్ (వినియోగదారు)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'లెటర్‌బాక్స్డ్';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'అనిలిస్ట్';

  @override
  String get communityRating => 'కమ్యూనిటీ రేటింగ్';

  @override
  String get ratings => 'రేటింగ్‌లు';

  @override
  String get additionalRatings => 'అదనపు రేటింగ్‌లు';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList మరియు TMDB రేటింగ్‌లను చూపించు';

  @override
  String get ratingLabels => 'రేటింగ్ లేబుల్స్';

  @override
  String get showLabelsNextToIcons => 'రేటింగ్ చిహ్నాల పక్కన లేబుల్‌లను చూపండి';

  @override
  String get ratingBadges => 'రేటింగ్ బ్యాడ్జ్‌లు';

  @override
  String get showDecorativeBadges =>
      'రేటింగ్‌ల వెనుక అలంకార బ్యాడ్జ్‌లను చూపండి';

  @override
  String get episodeRatings => 'ఎపిసోడ్ రేటింగ్‌లు';

  @override
  String get showRatingsOnEpisodes =>
      'వ్యక్తిగత ఎపిసోడ్‌లపై రేటింగ్‌లను చూపండి';

  @override
  String get ratingSources => 'రేటింగ్ మూలాలు';

  @override
  String get ratingSourcesDescription =>
      'యాప్ అంతటా చూపబడిన రేటింగ్ మూలాలను ప్రారంభించండి మరియు క్రమాన్ని మార్చండి';

  @override
  String get pluginLabel => 'Moonbase ప్లగిన్';

  @override
  String get pluginDetected => 'ప్లగిన్ కనుగొనబడింది';

  @override
  String get pluginNotDetected => 'ప్లగిన్ కనుగొనబడలేదు';

  @override
  String get pluginDetectedDescription =>
      'సర్వర్ ప్లగ్ఇన్ కనుగొనబడింది. మొదటిసారి ప్లగిన్ కనుగొనబడినప్పుడు సమకాలీకరణ స్వయంచాలకంగా ప్రారంభించబడుతుంది.';

  @override
  String get pluginNotDetectedDescription =>
      'సర్వర్ ప్లగిన్ ప్రస్తుతం కనుగొనబడలేదు. స్థానిక సెట్టింగ్‌లు ఇప్పటికీ వాటి సేవ్ చేసిన విలువలను లేదా అంతర్నిర్మిత డిఫాల్ట్‌లను ఉపయోగిస్తాయి.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nవెర్షన్: $version';
  }

  @override
  String get availableServices => 'అందుబాటులో ఉన్న సేవలు';

  @override
  String get serverPluginSync => 'సర్వర్ ప్లగిన్ సమకాలీకరణ';

  @override
  String get syncSettingsWithPlugin =>
      'సర్వర్ ప్లగిన్‌తో సెట్టింగ్‌లను సమకాలీకరించండి';

  @override
  String get whatSyncControls => 'ఏ సమకాలీకరణ నియంత్రణలు';

  @override
  String get syncControlsDescription =>
      'సమకాలీకరణ మాత్రమే ప్లగిన్-మద్దతు గల సెట్టింగ్‌లు సర్వర్‌కు నెట్టబడతాయా లేదా తీసివేయబడతాయో లేదో నియంత్రిస్తుంది. ప్లగిన్ సమకాలీకరణ ప్రారంభించబడినప్పుడు ప్రొఫైల్ ఎంపిక మరియు ప్రొఫైల్ సమకాలీకరణ చర్యలు అనుకూలీకరణ సెట్టింగ్‌లలో ఉంటాయి.';

  @override
  String get recentRequests => 'ఇటీవలి అభ్యర్థనలు';

  @override
  String get recentlyAdded => 'ఇటీవల జోడించబడింది';

  @override
  String get trending => 'ట్రెండింగ్';

  @override
  String get popularMovies => 'జనాదరణ పొందిన చలనచిత్రాలు';

  @override
  String get movieGenres => 'సినిమా శైలులు';

  @override
  String get upcomingMovies => 'రాబోయే సినిమాలు';

  @override
  String get studios => 'స్టూడియోలు';

  @override
  String get popularSeries => 'జనాదరణ పొందిన సిరీస్';

  @override
  String get seriesGenres => 'సిరీస్ శైలులు';

  @override
  String get upcomingSeries => 'రాబోయే సిరీస్';

  @override
  String get networks => 'నెట్‌వర్క్‌లు';

  @override
  String get seerrDiscoveryRows => 'Seerr డిస్కవరీ వరుసలు';

  @override
  String get resetRowsToDefaults => 'అడ్డు వరుసలను డిఫాల్ట్‌లకు రీసెట్ చేయండి';

  @override
  String get enableSeerr => 'Seerrని ప్రారంభించండి';

  @override
  String get showSeerrInNavigation =>
      'నావిగేషన్‌లో Seerrను చూపించండి (సర్వర్ ప్లగిన్ అవసరం)';

  @override
  String get seerrUnavailable =>
      'సర్వర్ ప్లగిన్ Seerr మద్దతు నిలిపివేయబడినందున అందుబాటులో లేదు.';

  @override
  String get nsfwFilter => 'NSFW ఫిల్టర్';

  @override
  String get hideAdultContent => 'ఫలితాల్లో పెద్దల కంటెంట్‌ను దాచండి';

  @override
  String get seerrNotificationsSection => 'నోటిఫికేషన్‌లు';

  @override
  String get seerrNotifyNewRequestsTitle => 'కొత్త అభ్యర్థన నోటిఫికేషన్‌లు';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'ఎవరైనా అభ్యర్థన సమర్పించినప్పుడు నాకు తెలియజేయండి';

  @override
  String get seerrNotifyLibraryAddedTitle => 'అభ్యర్థన అప్‌డేట్‌లు';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'ఆమోదించబడింది, తిరస్కరించబడింది, మీ లైబ్రరీకి జోడించబడింది';

  @override
  String get seerrNotifyIssuesTitle => 'సమస్య అప్‌డేట్‌లు';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'కొత్త సమస్యలు, ప్రత్యుత్తరాలు, పరిష్కారాలు';

  @override
  String loggedInAs(String username) {
    return 'లాగిన్ అయినవారు: $username';
  }

  @override
  String get discoverRows => 'Seerr డిస్కవరీ పేజీ';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr మెయిన్‌పేజీలో చూడటానికి వరుసలను ప్రారంభించండి. క్రమాన్ని మార్చడానికి లాగండి. అనుకూల క్రమం Moonbaseతో సింక్ అవుతుంది.';

  @override
  String get discoverRowsDescription =>
      'Seerr మెయిన్‌పేజీలో చూడటానికి వరుసలను ప్రారంభించండి. క్రమాన్ని మార్చడానికి లాగండి. అనుకూల క్రమం Moonbaseతో సింక్ అవుతుంది.';

  @override
  String get enabled => 'ప్రారంభించబడింది';

  @override
  String get hidden => 'దాచబడింది';

  @override
  String get aboutTitle => 'గురించి';

  @override
  String versionValue(String version) {
    return 'వెర్షన్ $version';
  }

  @override
  String get openSourceLicenses => 'ఓపెన్ సోర్స్ లైసెన్స్‌లు';

  @override
  String get sourceCode => 'సోర్స్ కోడ్';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'ఇప్పుడే నవీకరణల కోసం తనిఖీ చేయండి';

  @override
  String get checksLatestDesktopRelease =>
      'ఈ ప్లాట్‌ఫారమ్ కోసం తాజా డెస్క్‌టాప్ విడుదలను తనిఖీ చేస్తుంది';

  @override
  String get youAreUpToDate => 'మీరు తాజాగా ఉన్నారు.';

  @override
  String get couldNotCheckForUpdates =>
      'ప్రస్తుతం అప్‌డేట్‌ల కోసం తనిఖీ చేయడం సాధ్యపడలేదు.';

  @override
  String get noCompatibleUpdate =>
      'ఈ ప్లాట్‌ఫారమ్ కోసం అనుకూలమైన నవీకరణ ప్యాకేజీ ఏదీ కనుగొనబడలేదు.';

  @override
  String get updateChecksNotSupported =>
      'ఈ ప్లాట్‌ఫారమ్‌లో అప్‌డేట్ తనిఖీలకు మద్దతు లేదు.';

  @override
  String get updateNotificationsDisabled =>
      'నవీకరణ నోటిఫికేషన్‌లు నిలిపివేయబడ్డాయి.';

  @override
  String get pleaseWaitBeforeChecking =>
      'దయచేసి మళ్లీ తనిఖీ చేయడానికి ముందు వేచి ఉండండి.';

  @override
  String get latestUpdateAlreadyShown => 'తాజా నవీకరణ ఇప్పటికే చూపబడింది.';

  @override
  String get updateAvailable => 'అప్‌డేట్ అందుబాటులో ఉంది.';

  @override
  String updateAvailableVersion(String version) {
    return 'అప్‌డేట్ అందుబాటులో ఉంది: v$version';
  }

  @override
  String get updateNotifications => 'నోటిఫికేషన్‌లను నవీకరించండి';

  @override
  String get showWhenUpdatesAvailable =>
      'నవీకరణలు అందుబాటులో ఉన్నప్పుడు చూపించు';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version అందుబాటులో ఉంది';
  }

  @override
  String get readReleaseNotes => 'విడుదల గమనికలను చదవండి';

  @override
  String get downloadingUpdate => 'నవీకరణను డౌన్‌లోడ్ చేస్తోంది...';

  @override
  String get updateDownloadFailed =>
      'అప్‌డేట్ డౌన్‌లోడ్ విఫలమైంది. దయచేసి మళ్లీ ప్రయత్నించండి.';

  @override
  String get openReleasesPage => 'విడుదలల పేజీని తెరవండి';

  @override
  String get navigation => 'నావిగేషన్';

  @override
  String get watchedIndicatorsBackdrops =>
      'సూచికలు, బ్యాక్‌డ్రాప్‌లను వీక్షించారు';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'దృష్టి రంగు, వీక్షించిన సూచికలు, బ్యాక్‌డ్రాప్‌లు';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar శైలి, టూల్‌బార్ బటన్‌లు, ప్రదర్శన';

  @override
  String get reorderToggleHomeRows =>
      'హోమ్ వరుసలను క్రమాన్ని మార్చండి మరియు టోగుల్ చేయండి';

  @override
  String get featuredContentAppearance => 'ఫీచర్ చేయబడిన కంటెంట్, ప్రదర్శన';

  @override
  String get posterSizeImageTypeFolderView =>
      'పోస్టర్ పరిమాణం, చిత్రం రకం, ఫోల్డర్ వీక్షణ';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB మరియు రేటింగ్ మూలాలు';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'ఇమేజ్ కాష్ పరిమితి';

  @override
  String get clearImageCache => 'ఇమేజ్ కాష్‌ను క్లియర్ చేయండి';

  @override
  String get imageCacheCleared => 'ఇమేజ్ కాష్ క్లియర్ చేయబడింది';

  @override
  String get clear => 'క్లియర్ చేయండి';

  @override
  String get browse => 'బ్రౌజ్ చేయండి';

  @override
  String get noResults => 'ఫలితాలు లేవు';

  @override
  String get seerrAvailableStatus => 'అందుబాటులో ఉంది';

  @override
  String get seerrRequestedStatus => 'అభ్యర్థించారు';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'డౌన్‌లోడ్ అవుతోంది · $percent%';
  }

  @override
  String get seerrImportingStatus => 'దిగుమతి అవుతోంది';

  @override
  String itemsCount(int count) {
    return '$count అంశాలు';
  }

  @override
  String get seerrSettings => 'Seerr సెట్టింగ్‌లు';

  @override
  String get requestMore => 'మరింత అభ్యర్థించండి';

  @override
  String get request => 'అభ్యర్థన';

  @override
  String get cancelRequest => 'అభ్యర్థనను రద్దు చేయండి';

  @override
  String get playInMoonfin => 'Moonfinలో ఆడండి';

  @override
  String requestedByName(String name) {
    return '$name అభ్యర్థించారు';
  }

  @override
  String get approve => 'ఆమోదించండి';

  @override
  String get declineAction => 'తిరస్కరించు';

  @override
  String get similar => 'ఇలాంటి';

  @override
  String get recommendations => 'సిఫార్సులు';

  @override
  String cancelRequestForTitle(String title) {
    return '\"$title\" కోసం అభ్యర్థనను రద్దు చేయాలా?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" కోసం $count అభ్యర్థనలను రద్దు చేయాలా?';
  }

  @override
  String get keep => 'ఉంచండి';

  @override
  String get itemNotFoundInLibrary => 'మీ Moonfin లైబ్రరీలో అంశం కనుగొనబడలేదు';

  @override
  String get errorSearchingLibrary => 'లైబ్రరీని శోధించడంలో లోపం';

  @override
  String budgetAmount(String amount) {
    return 'బడ్జెట్: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'ఆదాయం: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$typeని అభ్యర్థించండి';
  }

  @override
  String get submitRequest => 'అభ్యర్థనను సమర్పించండి';

  @override
  String get allSeasons => 'అన్ని సీజన్లు';

  @override
  String get advancedOptions => 'అధునాతన ఎంపికలు';

  @override
  String get noServiceServersConfigured =>
      'సేవా సర్వర్లు ఏవీ కాన్ఫిగర్ చేయబడలేదు';

  @override
  String get server => 'సర్వర్';

  @override
  String get qualityProfile => 'నాణ్యమైన ప్రొఫైల్';

  @override
  String get rootFolder => 'రూట్ ఫోల్డర్';

  @override
  String get showMore => 'మరిన్ని చూపించు';

  @override
  String get appearances => 'నటించినవి';

  @override
  String get crewSection => 'సిబ్బంది';

  @override
  String ageValue(int age) {
    return 'వయస్సు $age';
  }

  @override
  String get noRequests => 'అభ్యర్థనలు లేవు';

  @override
  String get pendingStatus => 'పెండింగ్‌లో ఉంది';

  @override
  String get declinedStatus => 'తిరస్కరించబడింది';

  @override
  String get partiallyAvailable => 'పాక్షికంగా అందుబాటులో ఉంది';

  @override
  String get downloadingStatus => 'డౌన్‌లోడ్ చేస్తోంది';

  @override
  String get approvedStatus => 'ఆమోదించబడింది';

  @override
  String get notRequestedStatus => 'అభ్యర్థించబడలేదు';

  @override
  String get blocklistedStatus => 'బ్లాక్ లిస్ట్ చేయబడింది';

  @override
  String get deletedStatus => 'తొలగించబడింది';

  @override
  String get failedStatus => 'విఫలమైంది';

  @override
  String get processingStatus => 'ప్రాసెస్ అవుతోంది';

  @override
  String modifiedByName(String name) {
    return '$name మార్చారు';
  }

  @override
  String get completedStatus => 'పూర్తయింది';

  @override
  String get requestErrorDuplicate => 'ఈ శీర్షిక ఇప్పటికే అభ్యర్థించబడింది';

  @override
  String get requestErrorQuota => 'అభ్యర్థన పరిమితి చేరుకుంది';

  @override
  String get requestErrorBlocklisted => 'ఈ శీర్షిక బ్లాక్‌లిస్ట్ చేయబడింది';

  @override
  String get requestErrorNoSeasons => 'అభ్యర్థించడానికి సీజన్‌లు ఏవీ మిగలలేదు';

  @override
  String get requestErrorPermission => 'ఈ అభ్యర్థన చేయడానికి మీకు అనుమతి లేదు';

  @override
  String get seerrRequestsTitle => 'అభ్యర్థనలు';

  @override
  String get seerrIssuesTitle => 'సమస్యలు';

  @override
  String get sortNewest => 'సరికొత్తవి';

  @override
  String get sortLastModified => 'చివరిగా మార్చినవి';

  @override
  String get noIssues => 'సమస్యలు లేవు';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit సినిమా అభ్యర్థనలలో $remaining మిగిలి ఉన్నాయి';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit సీజన్ అభ్యర్థనలలో $remaining మిగిలి ఉన్నాయి';
  }

  @override
  String partOfCollectionName(String name) {
    return '$nameలో భాగం';
  }

  @override
  String get viewCollection => 'సేకరణను చూడండి';

  @override
  String get requestCollection => 'సేకరణను అభ్యర్థించండి';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total సినిమాలు · $available అందుబాటులో ఉన్నాయి';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count సినిమాలను అభ్యర్థించండి';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$totalలో $current అభ్యర్థిస్తోంది...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count సినిమాలు అభ్యర్థించబడ్డాయి';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total సినిమాలలో $ok అభ్యర్థించబడ్డాయి';
  }

  @override
  String get collectionAllRequested =>
      'అన్ని సినిమాలు ఇప్పటికే అందుబాటులో ఉన్నాయి లేదా అభ్యర్థించబడ్డాయి';

  @override
  String get reportIssue => 'సమస్యను నివేదించండి';

  @override
  String get issueTypeVideo => 'వీడియో';

  @override
  String get issueTypeAudio => 'ఆడియో';

  @override
  String get whatsWrong => 'ఏమి తప్పు?';

  @override
  String get allEpisodes => 'అన్ని ఎపిసోడ్‌లు';

  @override
  String get episode => 'ఎపిసోడ్';

  @override
  String get openStatus => 'తెరిచి ఉంది';

  @override
  String get resolvedStatus => 'పరిష్కరించబడింది';

  @override
  String get resolveAction => 'పరిష్కరించండి';

  @override
  String get reopenAction => 'మళ్లీ తెరవండి';

  @override
  String reportedByName(String name) {
    return '$name నివేదించారు';
  }

  @override
  String commentsCount(int count) {
    return '$count వ్యాఖ్యలు';
  }

  @override
  String get addComment => 'వ్యాఖ్యను జోడించండి';

  @override
  String get deleteIssueConfirm => 'ఈ సమస్యను తొలగించాలా?';

  @override
  String get submitReport => 'నివేదికను సమర్పించండి';

  @override
  String get tmdbScore => 'TMDB స్కోరు';

  @override
  String get releaseDateLabel => 'విడుదల తేదీ';

  @override
  String get firstAirDateLabel => 'మొదటి ప్రసార తేదీ';

  @override
  String get revenueLabel => 'రాబడి';

  @override
  String get runtimeLabel => 'రన్‌టైమ్';

  @override
  String get budgetLabel => 'బడ్జెట్';

  @override
  String get originalLanguageLabel => 'అసలు భాష';

  @override
  String get seasonsLabel => 'సీజన్‌లు';

  @override
  String get episodesLabel => 'ఎపిసోడ్‌లు';

  @override
  String get access => 'యాక్సెస్';

  @override
  String get add => 'జోడించండి';

  @override
  String get address => 'చిరునామా';

  @override
  String get analytics => 'విశ్లేషణలు';

  @override
  String get catalog => 'కేటలాగ్';

  @override
  String get content => 'కంటెంట్';

  @override
  String get copy => 'కాపీ చేయండి';

  @override
  String get create => 'సృష్టించు';

  @override
  String get disable => 'ఆపివేయి';

  @override
  String get done => 'పూర్తయింది';

  @override
  String get edit => 'సవరించండి';

  @override
  String get encoding => 'ఎన్కోడింగ్';

  @override
  String get error => 'లోపం';

  @override
  String get forward => 'ముందుకు';

  @override
  String get general => 'సాధారణం';

  @override
  String get go => 'వెళ్ళు';

  @override
  String get install => 'ఇన్‌స్టాల్ చేయండి';

  @override
  String get installed => 'ఇన్‌స్టాల్ చేయబడింది';

  @override
  String get interval => 'ఇంటర్వెల్';

  @override
  String get name => 'పేరు';

  @override
  String get networking => 'నెట్వర్కింగ్';

  @override
  String get next => 'తర్వాత';

  @override
  String get path => 'మార్గం';

  @override
  String get paused => 'పాజ్ చేయబడింది';

  @override
  String get permissions => 'అనుమతులు';

  @override
  String get processing => 'ప్రాసెసింగ్';

  @override
  String get profile => 'ప్రొఫైల్';

  @override
  String get provider => 'ప్రొవైడర్';

  @override
  String get refresh => 'రిఫ్రెష్ చేయండి';

  @override
  String get remote => 'రిమోట్';

  @override
  String get rename => 'పేరు మార్చండి';

  @override
  String get revoke => 'ఉపసంహరించుకోండి';

  @override
  String get role => 'పాత్ర';

  @override
  String get root => 'రూట్';

  @override
  String get run => 'పరుగు';

  @override
  String get search => 'శోధించండి';

  @override
  String get select => 'ఎంచుకోండి';

  @override
  String get send => 'పంపండి';

  @override
  String get sessions => 'సెషన్స్';

  @override
  String get set => 'సెట్';

  @override
  String get status => 'స్థితి';

  @override
  String get stop => 'ఆపండి';

  @override
  String get streaming => 'స్ట్రీమింగ్';

  @override
  String get time => 'సమయం';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'అన్‌ఇన్‌స్టాల్ చేయండి';

  @override
  String get up => 'పైకి';

  @override
  String get update => 'నవీకరించు';

  @override
  String get upload => 'అప్‌లోడ్ చేయండి';

  @override
  String get unmute => 'అన్‌మ్యూట్ చేయండి';

  @override
  String get mute => 'మ్యూట్ చేయండి';

  @override
  String get branding => 'బ్రాండింగ్';

  @override
  String get adminDrawerDashboard => 'డాష్‌బోర్డ్';

  @override
  String get adminDrawerAnalytics => 'విశ్లేషణలు';

  @override
  String get adminDrawerSettings => 'సెట్టింగ్‌లు';

  @override
  String get adminDrawerBranding => 'బ్రాండింగ్';

  @override
  String get adminDrawerUsers => 'వినియోగదారులు';

  @override
  String get adminDrawerLibraries => 'లైబ్రరీలు';

  @override
  String get adminDrawerDisplay => 'డిస్‌ప్లే';

  @override
  String get adminDrawerMetadata => 'మెటాడేటా';

  @override
  String get adminDrawerNfo => 'NFO సెట్టింగ్‌లు';

  @override
  String get adminDrawerTranscoding => 'ట్రాన్స్‌కోడింగ్';

  @override
  String get adminDrawerResume => 'కొనసాగింపు';

  @override
  String get adminDrawerStreaming => 'స్ట్రీమింగ్';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'పరికరాలు';

  @override
  String get adminDrawerActivity => 'కార్యాచరణ';

  @override
  String get adminDrawerNetworking => 'నెట్వర్కింగ్';

  @override
  String get adminDrawerApiKeys => 'API కీలు';

  @override
  String get adminDrawerBackups => 'బ్యాకప్‌లు';

  @override
  String get adminDrawerLogs => 'లాగ్‌లు';

  @override
  String get adminDrawerScheduledTasks => 'షెడ్యూల్డ్ పనులు';

  @override
  String get adminDrawerPlugins => 'ప్లగిన్లు';

  @override
  String get adminDrawerRepositories => 'రిపోజిటరీలు';

  @override
  String get adminDrawerLiveTv => 'ప్రత్యక్ష TV';

  @override
  String get adminExitTooltip => 'అడ్మిన్ నుండి నిష్క్రమించండి';

  @override
  String get adminDashboardLoadFailed =>
      'డ్యాష్‌బోర్డ్‌ను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminMediaOverview => 'మీడియా అవలోకనం';

  @override
  String get adminMediaTotalsError =>
      'సర్వర్ మీడియా మొత్తాలను లోడ్ చేయడం సాధ్యపడలేదు.';

  @override
  String get adminMediaOverviewSubtitle =>
      'ఈ సర్వర్‌లో ఎంత కంటెంట్ ఉందో త్వరగా చదవండి.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'ప్లగిన్ అప్‌డేట్‌లు అందుబాటులో ఉన్నాయి: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'పునఃప్రారంభం అవసరమైన ప్లగిన్‌లు: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'విఫలమైన షెడ్యూల్డ్ టాస్క్‌లు: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'ఇటీవలి హెచ్చరిక/లోపం ఎంట్రీలు: $count';
  }

  @override
  String get analyticsMediaDistribution => 'మీడియా పంపిణీ';

  @override
  String get analyticsVideoCodecs => 'వీడియో కోడెక్‌లు';

  @override
  String get analyticsAudioCodecs => 'ఆడియో కోడెక్స్';

  @override
  String get analyticsContainers => 'కంటైనర్లు';

  @override
  String get analyticsTopGenres => 'అగ్ర శైలులు';

  @override
  String get analyticsReleaseYears => 'విడుదల సంవత్సరాలు';

  @override
  String get analyticsContentRatings => 'కంటెంట్ రేటింగ్‌లు';

  @override
  String get analyticsRuntimeBuckets => 'రన్‌టైమ్ బకెట్‌లు';

  @override
  String get analyticsFileFormats => 'ఫైల్ ఫార్మాట్‌లు';

  @override
  String get analyticsNoData => 'డేటా అందుబాటులో లేదు.';

  @override
  String get adminServerInfo => 'సర్వర్ సమాచారం';

  @override
  String get adminRestartPending => 'పునఃప్రారంభం పెండింగ్‌లో ఉంది';

  @override
  String get adminServerPaths => 'సర్వర్ మార్గాలు';

  @override
  String get adminServerActions => 'సర్వర్ చర్యలు';

  @override
  String get adminRestartServer => 'సర్వర్ పునఃప్రారంభించండి';

  @override
  String get adminShutdownServer => 'షట్డౌన్ సర్వర్';

  @override
  String get adminScanLibraries => 'లైబ్రరీలను స్కాన్ చేయండి';

  @override
  String get adminLibraryScanStarted => 'లైబ్రరీ స్కాన్ ప్రారంభించబడింది';

  @override
  String errorGeneric(String error) {
    return 'లోపం: $error';
  }

  @override
  String get adminServerRebootInProgress => 'సర్వర్ రీబూట్ ప్రోగ్రెస్‌లో ఉంది';

  @override
  String get adminServerRebootMessage =>
      'సర్వర్ రీబూట్ ప్రోగ్రెస్‌లో ఉంది, దయచేసి Moonfinని పునఃప్రారంభించండి';

  @override
  String get adminActiveSessions => 'క్రియాశీల సెషన్లు';

  @override
  String get adminSessionsLoadFailed => 'సెషన్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminNoActiveSessions => 'సక్రియ సెషన్‌లు లేవు';

  @override
  String get adminRecentActivity => 'ఇటీవలి కార్యాచరణ';

  @override
  String get adminNoRecentActivity => 'ఇటీవలి కార్యాచరణ లేదు';

  @override
  String adminCommandFailed(String error) {
    return 'కమాండ్ విఫలమైంది: $error';
  }

  @override
  String get adminSendMessage => 'సందేశం పంపండి';

  @override
  String get adminMessageTextHint => 'సందేశ వచనం';

  @override
  String get adminSetVolume => 'వాల్యూమ్ సెట్ చేయండి';

  @override
  String get sessionPrev => 'మునుపటి';

  @override
  String get sessionRewind => 'రివైండ్ చేయండి';

  @override
  String get sessionForward => 'ముందుకు';

  @override
  String get sessionNext => 'తర్వాత';

  @override
  String get sessionVolumeDown => 'వాల్యూమ్ -';

  @override
  String get sessionVolumeUp => 'వాల్యూమ్ +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'ఇప్పుడు ప్లే అవుతోంది';

  @override
  String get volume => 'వాల్యూమ్';

  @override
  String get actions => 'చర్యలు';

  @override
  String get videoCodec => 'వీడియో కోడెక్';

  @override
  String get audioCodec => 'ఆడియో కోడెక్';

  @override
  String get hwAccel => 'HW యాక్సెల్';

  @override
  String get completion => 'పూర్తి';

  @override
  String get direct => 'డైరెక్ట్';

  @override
  String get adminDisconnect => 'డిస్‌కనెక్ట్ చేయండి';

  @override
  String get adminClearDates => 'తేదీలను క్లియర్ చేయండి';

  @override
  String get adminActivitySeverityAll => 'అన్ని తీవ్రతలు';

  @override
  String get adminActivityDateRange => 'తేదీ పరిధి';

  @override
  String adminActivityLoadFailed(String error) {
    return 'కార్యకలాప లాగ్‌ను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminNoActivityEntries => 'కార్యాచరణ నమోదులు లేవు';

  @override
  String get adminEditDeviceName => 'పరికరం పేరును సవరించండి';

  @override
  String get adminCustomName => 'అనుకూల పేరు';

  @override
  String get adminDeviceNameUpdated => 'పరికరం పేరు నవీకరించబడింది';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'పరికరాన్ని అప్‌డేట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminDeleteDevice => 'పరికరాన్ని తొలగించండి';

  @override
  String get adminDeviceDeleted => 'పరికరం తొలగించబడింది';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'పరికరాన్ని తొలగించడం విఫలమైంది: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '\'$name\' పరికరాన్ని తీసివేయాలా? ఈ పరికరంలో వినియోగదారు మళ్లీ సైన్ ఇన్ చేయాల్సి ఉంటుంది.';
  }

  @override
  String get adminDeleteAllDevices => 'అన్ని పరికరాలను తొలగించండి';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count పరికరాలను తీసివేయాలా? ప్రభావితమైన వినియోగదారులు మళ్లీ సైన్ ఇన్ చేయాల్సి ఉంటుంది. మీ ప్రస్తుత పరికరం ప్రభావితం కాదు.';
  }

  @override
  String get adminDevicesDeletedAll => 'పరికరాలు తీసివేయబడ్డాయి';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'కొన్ని పరికరాలు తీసివేయబడ్డాయి; $countని తీసివేయడం సాధ్యపడలేదు.';
  }

  @override
  String get adminDevicesLoadFailed => 'పరికరాలను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminSearchDevices => 'శోధన పరికరాలు';

  @override
  String get adminThisDevice => 'ఈ పరికరం';

  @override
  String get adminEditName => 'పేరును సవరించండి';

  @override
  String get adminLibrariesLoadFailed => 'లైబ్రరీలను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminNoLibraries => 'లైబ్రరీలు ఏవీ కాన్ఫిగర్ చేయబడలేదు';

  @override
  String get adminScanAllLibraries => 'అన్ని లైబ్రరీలను స్కాన్ చేయండి';

  @override
  String get adminAddLibrary => 'లైబ్రరీని జోడించండి';

  @override
  String adminScanFailed(String error) {
    return 'స్కాన్‌ను ప్రారంభించడం విఫలమైంది: $error';
  }

  @override
  String get adminRenameLibrary => 'లైబ్రరీ పేరు మార్చండి';

  @override
  String get adminNewName => 'కొత్త పేరు';

  @override
  String adminLibraryRenamed(String name) {
    return 'లైబ్రరీ పేరు \"$name\"గా మార్చబడింది';
  }

  @override
  String adminRenameFailed(String error) {
    return 'పేరు మార్చడం విఫలమైంది: $error';
  }

  @override
  String get adminDeleteLibrary => 'లైబ్రరీని తొలగించండి';

  @override
  String adminLibraryDeleted(String name) {
    return '\"$name\" లైబ్రరీ తొలగించబడింది';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'లైబ్రరీని తొలగించడం విఫలమైంది: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'పాత్‌ను జోడించడం విఫలమైంది: $error';
  }

  @override
  String get adminRemovePath => 'మార్గాన్ని తీసివేయండి';

  @override
  String adminRemovePathConfirm(String path) {
    return 'ఈ లైబ్రరీ నుండి \"$path\"ని తీసివేయాలా?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'పాత్‌ను తీసివేయడం విఫలమైంది: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'లైబ్రరీ ఎంపికలు సేవ్ చేయబడ్డాయి';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'ఎంపికలను సేవ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'లైబ్రరీని లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminNoMediaPaths => 'మీడియా మార్గాలు ఏవీ కాన్ఫిగర్ చేయబడలేదు';

  @override
  String get adminAddPath => 'మార్గాన్ని జోడించండి';

  @override
  String get adminBrowseFilesystem => 'సర్వర్ ఫైల్ సిస్టమ్‌ను బ్రౌజ్ చేయండి:';

  @override
  String get adminSaveOptions => 'ఎంపికలను సేవ్ చేయండి';

  @override
  String get adminPreferredMetadataLanguage => 'ప్రాధాన్య మెటాడేటా భాష';

  @override
  String get adminMetadataLanguageHint => 'ఉదా en, de, fr';

  @override
  String get adminMetadataCountryCode => 'మెటాడేటా దేశం కోడ్';

  @override
  String get adminMetadataCountryHint => 'ఉదా US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'పాత్‌లు';

  @override
  String get adminLibraryTabOptions => 'ఎంపికలు';

  @override
  String get adminLibraryTabDownloaders => 'డౌన్‌లోడర్‌లు';

  @override
  String get adminLibMetadataSavers => 'మెటాడేటా సేవర్‌లు';

  @override
  String get adminLibSubtitleDownloaders => 'సబ్‌టైటిల్ డౌన్‌లోడర్‌లు';

  @override
  String get adminLibLyricDownloaders => 'సాహిత్య డౌన్‌లోడర్‌లు';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'మెటాడేటా డౌన్‌లోడర్‌లు: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'ఇమేజ్ ఫెచర్‌లు: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'ఈ లైబ్రరీ రకం కోసం ఈ సర్వర్ ఏ డౌన్‌లోడర్‌లను అందించదు.';

  @override
  String get adminLibrarySectionGeneral => 'సాధారణం';

  @override
  String get adminLibrarySectionMetadata => 'మెటాడేటా';

  @override
  String get adminLibrarySectionEmbedded => 'ఎంబెడెడ్ సమాచారం';

  @override
  String get adminLibrarySectionSubtitles => 'సబ్‌టైటిల్‌లు';

  @override
  String get adminLibrarySectionImages => 'ఇమేజ్‌లు';

  @override
  String get adminLibrarySectionSeries => 'సిరీస్';

  @override
  String get adminLibrarySectionMusic => 'సంగీతం';

  @override
  String get adminLibrarySectionMovies => 'సినిమాలు';

  @override
  String get adminLibRealtimeMonitor =>
      'రియల్-టైమ్ మానిటరింగ్‌ను ప్రారంభించండి';

  @override
  String get adminLibRealtimeMonitorHint =>
      'ఫైల్ మార్పులను గుర్తించి వాటిని స్వయంచాలకంగా ప్రాసెస్ చేస్తుంది.';

  @override
  String get adminLibArchiveMediaFiles =>
      'ఆర్కైవ్‌లను మీడియా ఫైల్‌లుగా పరిగణించండి';

  @override
  String get adminLibEnablePhotos => 'ఫోటోలను ప్రదర్శించండి';

  @override
  String get adminLibSaveLocalMetadata =>
      'ఆర్ట్‌వర్క్‌ను మీడియా ఫోల్డర్‌లలో సేవ్ చేయండి';

  @override
  String get adminLibRefreshInterval => 'స్వయంచాలక మెటాడేటా రిఫ్రెష్';

  @override
  String get adminLibRefreshNever => 'ఎప్పటికీ కాదు';

  @override
  String get adminLibDefault => 'డిఫాల్ట్';

  @override
  String get adminLibDisplayTitle => 'డిస్‌ప్లే';

  @override
  String get adminLibDisplaySection => 'లైబ్రరీ డిస్‌ప్లే';

  @override
  String get adminLibFolderView =>
      'సాధారణ మీడియా ఫోల్డర్‌లను చూపడానికి ఫోల్డర్ వీక్షణను ప్రదర్శించండి';

  @override
  String get adminLibSpecialsInSeasons =>
      'ప్రసారమైన సీజన్‌లలోనే స్పెషల్‌లను ప్రదర్శించండి';

  @override
  String get adminLibGroupMovies => 'సినిమాలను సేకరణలుగా సమూహపరచండి';

  @override
  String get adminLibGroupShows => 'షోలను సేకరణలుగా సమూహపరచండి';

  @override
  String get adminLibExternalSuggestions =>
      'సూచనలలో బాహ్య కంటెంట్‌ను చూపించండి';

  @override
  String get adminLibDateAddedSection => 'జోడించిన తేదీ ప్రవర్తన';

  @override
  String get adminLibDateAddedLabel => 'జోడించిన తేదీని దీని నుండి ఉపయోగించండి';

  @override
  String get adminLibDateAddedImport => 'లైబ్రరీలోకి స్కాన్ చేసిన తేదీ';

  @override
  String get adminLibDateAddedFile => 'ఫైల్ సృష్టించబడిన తేదీ';

  @override
  String get adminLibMetadataTitle => 'మెటాడేటా మరియు ఇమేజ్‌లు';

  @override
  String get adminLibMetadataLangSection => 'ప్రాధాన్య మెటాడేటా భాష';

  @override
  String get adminLibChaptersSection => 'అధ్యాయాలు';

  @override
  String get adminLibDummyChapterDuration => 'డమ్మీ అధ్యాయ నిడివి (సెకన్లు)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'అధ్యాయాలు లేని మీడియా కోసం రూపొందించే అధ్యాయాల నిడివి. నిలిపివేయడానికి 0కి సెట్ చేయండి.';

  @override
  String get adminLibChapterImageResolution => 'అధ్యాయ ఇమేజ్ రిజల్యూషన్';

  @override
  String get adminLibNfoTitle => 'NFO సెట్టింగ్‌లు';

  @override
  String get adminLibNfoHelp =>
      'NFO మెటాడేటా Kodi మరియు సారూప్య క్లయింట్‌లతో అనుకూలంగా ఉంటుంది. NFO మెటాడేటాను సేవ్ చేసే అన్ని లైబ్రరీలకు సెట్టింగ్‌లు వర్తిస్తాయి.';

  @override
  String get adminLibKodiUser =>
      'NFO ఫైల్‌లలో వీక్షణ డేటాను నిల్వ చేయవలసిన వినియోగదారు';

  @override
  String get adminLibSaveImagePaths =>
      'NFO ఫైల్‌లలో ఇమేజ్ పాత్‌లను సేవ్ చేయండి';

  @override
  String get adminLibPathSubstitution =>
      'NFO ఇమేజ్ పాత్‌ల కోసం పాత్ ప్రత్యామ్నాయాన్ని ప్రారంభించండి';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart ఇమేజ్‌లను extrathumbs ఫోల్డర్‌లోకి కాపీ చేయండి';

  @override
  String get adminLibNone => 'ఏదీ లేదు';

  @override
  String adminLibRefreshDays(int days) {
    return '$days రోజులు';
  }

  @override
  String get adminLibEmbeddedTitles => 'ఎంబెడెడ్ శీర్షికలను ఉపయోగించండి';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'అదనపు అంశాల కోసం ఎంబెడెడ్ శీర్షికలను ఉపయోగించండి';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'ఎంబెడెడ్ ఎపిసోడ్ సమాచారాన్ని ఉపయోగించండి';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'ఎంబెడెడ్ సబ్‌టైటిల్‌లను అనుమతించండి';

  @override
  String get adminLibEmbeddedAllowAll => 'అన్నింటిని అనుమతించండి';

  @override
  String get adminLibEmbeddedAllowText => 'టెక్స్ట్ మాత్రమే';

  @override
  String get adminLibEmbeddedAllowImage => 'ఇమేజ్ మాత్రమే';

  @override
  String get adminLibEmbeddedAllowNone => 'ఏదీ లేదు';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'ఎంబెడెడ్ సబ్‌టైటిల్‌లు ఉంటే డౌన్‌లోడ్‌ను దాటవేయండి';

  @override
  String get adminLibSkipIfAudioMatches =>
      'ఆడియో ట్రాక్ డౌన్‌లోడ్ భాషతో సరిపోతే డౌన్‌లోడ్‌ను దాటవేయండి';

  @override
  String get adminLibRequirePerfectMatch =>
      'పరిపూర్ణ సబ్‌టైటిల్ సరిపోలిక అవసరం';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'సబ్‌టైటిల్‌లను మీడియా ఫోల్డర్‌లలో సేవ్ చేయండి';

  @override
  String get adminLibChapterImageExtraction => 'అధ్యాయ ఇమేజ్‌లను వెలికితీయండి';

  @override
  String get adminLibChapterImagesDuringScan =>
      'లైబ్రరీ స్కాన్ సమయంలో అధ్యాయ ఇమేజ్‌లను వెలికితీయండి';

  @override
  String get adminLibTrickplayExtraction =>
      'Trickplay ఇమేజ్ వెలికితీతను ప్రారంభించండి';

  @override
  String get adminLibTrickplayDuringScan =>
      'లైబ్రరీ స్కాన్ సమయంలో Trickplay ఇమేజ్‌లను వెలికితీయండి';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay ఇమేజ్‌లను మీడియా ఫోల్డర్‌లలో సేవ్ చేయండి';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'బహుళ ఫోల్డర్‌లలో విస్తరించిన సిరీస్‌ను స్వయంచాలకంగా విలీనం చేయండి';

  @override
  String get adminLibSeasonZeroName => 'సీజన్ జీరో డిస్‌ప్లే పేరు';

  @override
  String get adminLibLufsScan =>
      'ఆడియో నార్మలైజేషన్ కోసం LUFS స్కాన్‌ను ప్రారంభించండి';

  @override
  String get adminLibPreferNonstandardArtist =>
      'నాన్-స్టాండర్డ్ ఆర్టిస్ట్‌ల ట్యాగ్‌కు ప్రాధాన్యం ఇవ్వండి';

  @override
  String get adminLibAutoAddToCollection =>
      'సినిమాలను సేకరణలకు స్వయంచాలకంగా జోడించండి';

  @override
  String get adminLibraryNameRequired => 'లైబ్రరీ పేరు అవసరం';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'లైబ్రరీని సృష్టించడం విఫలమైంది: $error';
  }

  @override
  String get adminLibraryName => 'లైబ్రరీ పేరు';

  @override
  String get adminSelectedPaths => 'ఎంచుకున్న మార్గాలు:';

  @override
  String get adminNoPathsAdded =>
      'మార్గాలు ఏవీ జోడించబడలేదు (తర్వాత జోడించబడతాయి)';

  @override
  String get adminCreateLibrary => 'లైబ్రరీని సృష్టించండి';

  @override
  String get paths => 'మార్గాలు:';

  @override
  String get adminDisableUser => 'వినియోగదారుని నిలిపివేయండి';

  @override
  String get adminEnableUser => 'వినియోగదారుని ప్రారంభించండి';

  @override
  String adminDisableUserConfirm(String name) {
    return '$nameని నిలిపివేయాలా? వారు సైన్ ఇన్ చేయలేరు.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$nameని ప్రారంభించాలా? వారు మళ్లీ సైన్ ఇన్ చేయగలరు.';
  }

  @override
  String adminUserDisabled(String name) {
    return '\"$name\" వినియోగదారు నిలిపివేయబడ్డారు';
  }

  @override
  String adminUserEnabled(String name) {
    return '\"$name\" వినియోగదారు ప్రారంభించబడ్డారు';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'వినియోగదారు విధానాన్ని అప్‌డేట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminUsersLoadFailed => 'వినియోగదారులను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminSearchUsers => 'వినియోగదారులను శోధించండి';

  @override
  String get adminEditUser => 'వినియోగదారుని సవరించండి';

  @override
  String get adminAddUser => 'వినియోగదారుని జోడించండి';

  @override
  String adminUserCreateFailed(String error) {
    return 'వినియోగదారుని సృష్టించడం విఫలమైంది: $error';
  }

  @override
  String get adminCreateUser => 'వినియోగదారుని సృష్టించండి';

  @override
  String get adminPasswordOptional => 'పాస్‌వర్డ్ (ఐచ్ఛికం)';

  @override
  String get adminUsernameRequired => 'వినియోగదారు పేరు ఖాళీగా ఉండకూడదు';

  @override
  String get adminNoProfileChanges => 'సేవ్ చేయడానికి ప్రొఫైల్ మార్పులు లేవు';

  @override
  String get adminProfileSaved => 'ప్రొఫైల్ సేవ్ చేయబడింది';

  @override
  String adminSaveFailed(String error) {
    return 'సేవ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminPermissionsSaved => 'అనుమతులు సేవ్ చేయబడ్డాయి';

  @override
  String get adminPasswordsMismatch => 'పాస్‌వర్డ్‌లు సరిపోలడం లేదు';

  @override
  String adminFailed(String error) {
    return 'విఫలమైంది: $error';
  }

  @override
  String get adminUserLoadFailed => 'వినియోగదారుని లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminBackToUsers => 'వినియోగదారులకు తిరిగి వెళ్ళు';

  @override
  String get adminSaveProfile => 'ప్రొఫైల్‌ను సేవ్ చేయండి';

  @override
  String get adminDeleteUser => 'వినియోగదారుని తొలగించండి';

  @override
  String get admin => 'అడ్మిన్';

  @override
  String get adminFullAccessWarning =>
      'నిర్వాహకులు సర్వర్‌కు పూర్తి ప్రాప్యతను కలిగి ఉన్నారు. జాగ్రత్తగా మంజూరు చేయండి.';

  @override
  String get administrator => 'నిర్వాహకుడు';

  @override
  String get adminHiddenUser => 'దాచిన వినియోగదారు';

  @override
  String get adminAllowMediaPlayback => 'మీడియా ప్లేబ్యాక్‌ని అనుమతించండి';

  @override
  String get adminAllowAudioTranscoding =>
      'ఆడియో ట్రాన్స్‌కోడింగ్‌ని అనుమతించండి';

  @override
  String get adminAllowVideoTranscoding =>
      'వీడియో ట్రాన్స్‌కోడింగ్‌ని అనుమతించండి';

  @override
  String get adminAllowRemuxing => 'రీమక్సింగ్‌ని అనుమతించండి';

  @override
  String get adminForceRemoteTranscoding =>
      'రిమోట్ సోర్స్ ట్రాన్స్‌కోడింగ్‌ను బలవంతం చేయండి';

  @override
  String get adminAllowContentDeletion => 'కంటెంట్ తొలగింపును అనుమతించండి';

  @override
  String get adminAllowContentDownloading => 'కంటెంట్ డౌన్‌లోడ్‌ను అనుమతించండి';

  @override
  String get adminAllowPublicSharing => 'పబ్లిక్ షేరింగ్‌ని అనుమతించండి';

  @override
  String get adminAllowRemoteControl =>
      'ఇతర వినియోగదారుల రిమోట్ కంట్రోల్‌ని అనుమతించండి';

  @override
  String get adminAllowSharedDeviceControl =>
      'భాగస్వామ్య పరికర నియంత్రణను అనుమతించండి';

  @override
  String get adminAllowRemoteAccess => 'రిమోట్ యాక్సెస్‌ను అనుమతించండి';

  @override
  String get adminRemoteBitrateLimit =>
      'రిమోట్ క్లయింట్ బిట్రేట్ పరిమితి (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'పరిమితి లేకుండా ఖాళీగా వదిలివేయండి';

  @override
  String get adminMaxActiveSessions => 'గరిష్ట క్రియాశీల సెషన్‌లు';

  @override
  String get adminAllowLiveTvAccess => 'లైవ్ టీవీ యాక్సెస్‌ని అనుమతించండి';

  @override
  String get adminAllowLiveTvManagement =>
      'ప్రత్యక్ష ప్రసార టీవీ నిర్వహణను అనుమతించండి';

  @override
  String get adminAllowCollectionManagement => 'సేకరణ నిర్వహణను అనుమతించండి';

  @override
  String get adminAllowSubtitleManagement => 'ఉపశీర్షిక నిర్వహణను అనుమతించండి';

  @override
  String get adminAllowLyricManagement => 'గీత నిర్వహణను అనుమతించండి';

  @override
  String get adminSavePermissions => 'అనుమతులను సేవ్ చేయండి';

  @override
  String get adminEnableAllLibraryAccess =>
      'అన్ని లైబ్రరీలకు యాక్సెస్‌ని ప్రారంభించండి';

  @override
  String get adminSaveAccess => 'యాక్సెస్‌ని సేవ్ చేయండి';

  @override
  String get adminChangePassword => 'పాస్‌వర్డ్ మార్చండి';

  @override
  String get adminNewPassword => 'కొత్త పాస్‌వర్డ్';

  @override
  String get adminConfirmPassword => 'పాస్‌వర్డ్‌ని నిర్ధారించండి';

  @override
  String get adminSetPassword => 'పాస్‌వర్డ్‌ని సెట్ చేయండి';

  @override
  String get adminResetPassword => 'పాస్‌వర్డ్‌ని రీసెట్ చేయండి';

  @override
  String get adminPasswordReset => 'పాస్‌వర్డ్ రీసెట్';

  @override
  String get adminPasswordUpdated => 'పాస్‌వర్డ్ నవీకరించబడింది';

  @override
  String get adminUserSettings => 'వినియోగదారు సెట్టింగ్‌లు';

  @override
  String get adminLibraryAccess => 'లైబ్రరీ యాక్సెస్';

  @override
  String get adminDeviceAndChannelAccess => 'పరికరం & ఛానెల్ యాక్సెస్';

  @override
  String get adminEnableAllDevices =>
      'అన్ని పరికరాలకు ప్రాప్యతను ప్రారంభించండి';

  @override
  String get adminEnableAllChannels =>
      'అన్ని ఛానెల్‌లకు ప్రాప్యతను ప్రారంభించండి';

  @override
  String get adminParentalControl => 'పేరెంటల్ కంట్రోల్';

  @override
  String get adminMaxParentalRating => 'అనుమతించిన గరిష్ఠ పేరెంటల్ రేటింగ్';

  @override
  String get adminMaxParentalRatingHint =>
      'అధిక రేటింగ్ ఉన్న కంటెంట్ ఈ వినియోగదారు నుండి దాచబడుతుంది.';

  @override
  String get adminParentalRatingNone => 'ఏదీ లేదు';

  @override
  String get adminBlockUnratedItems =>
      'రేటింగ్ సమాచారం లేని లేదా గుర్తించని అంశాలను నిరోధించండి';

  @override
  String get adminUnratedBook => 'పుస్తకాలు';

  @override
  String get adminUnratedChannelContent => 'ఛానెల్‌లు';

  @override
  String get adminUnratedLiveTvChannel => 'లైవ్ TV';

  @override
  String get adminUnratedMovie => 'సినిమాలు';

  @override
  String get adminUnratedMusic => 'సంగీతం';

  @override
  String get adminUnratedTrailer => 'ట్రైలర్‌లు';

  @override
  String get adminUnratedSeries => 'షోలు';

  @override
  String get adminAccessSchedules => 'యాక్సెస్ షెడ్యూల్‌లు';

  @override
  String get adminAccessSchedulesHint =>
      'దిగువన ఉన్న షెడ్యూల్ చేసిన సమయాల్లో మాత్రమే యాక్సెస్‌ను అనుమతించండి. షెడ్యూల్ సెట్ చేయనప్పుడు రోజంతా యాక్సెస్ అనుమతించబడుతుంది.';

  @override
  String get adminAddSchedule => 'షెడ్యూల్‌ను జోడించండి';

  @override
  String get adminScheduleDay => 'రోజు';

  @override
  String get adminScheduleStart => 'ప్రారంభం';

  @override
  String get adminScheduleEnd => 'ముగింపు';

  @override
  String get adminDayEveryday => 'ప్రతిరోజూ';

  @override
  String get adminDayWeekday => 'వారంలో పనిదినం';

  @override
  String get adminDayWeekend => 'వారాంతం';

  @override
  String get adminDaySunday => 'ఆదివారం';

  @override
  String get adminDayMonday => 'సోమవారం';

  @override
  String get adminDayTuesday => 'మంగళవారం';

  @override
  String get adminDayWednesday => 'బుధవారం';

  @override
  String get adminDayThursday => 'గురువారం';

  @override
  String get adminDayFriday => 'శుక్రవారం';

  @override
  String get adminDaySaturday => 'శనివారం';

  @override
  String get adminAllowedTags => 'అనుమతించిన ట్యాగ్‌లు';

  @override
  String get adminAllowedTagsHint =>
      'ఈ ట్యాగ్‌లు ఉన్న కంటెంట్ మాత్రమే చూపబడుతుంది. అన్నింటిని అనుమతించడానికి ఖాళీగా ఉంచండి.';

  @override
  String get adminBlockedTags => 'నిరోధించిన ట్యాగ్‌లు';

  @override
  String get adminBlockedTagsHint =>
      'ఈ ట్యాగ్‌లు ఉన్న కంటెంట్ ఈ వినియోగదారు నుండి దాచబడుతుంది.';

  @override
  String get adminAddTag => 'ట్యాగ్‌ను జోడించండి';

  @override
  String get adminEnabledDevices => 'ప్రారంభించిన పరికరాలు';

  @override
  String get adminEnabledChannels => 'ప్రారంభించిన ఛానెల్‌లు';

  @override
  String get adminAuthProvider => 'ప్రామాణీకరణ ప్రొవైడర్';

  @override
  String get adminPasswordResetProvider => 'పాస్‌వర్డ్ రీసెట్ ప్రొవైడర్';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'లాక్‌అవుట్‌కు ముందు గరిష్ఠ విఫల లాగిన్ ప్రయత్నాలు';

  @override
  String get adminLoginAttemptsHint =>
      'డిఫాల్ట్ కోసం 0కి, లేదా లాక్‌అవుట్‌ను నిలిపివేయడానికి -1కి సెట్ చేయండి.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay యాక్సెస్';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'గ్రూప్‌లను సృష్టించడం, చేరడం అనుమతించండి';

  @override
  String get adminSyncPlayJoin => 'గ్రూప్‌లలో చేరడం అనుమతించండి';

  @override
  String get adminSyncPlayNone => 'యాక్సెస్ లేదు';

  @override
  String get adminContentDeletionFolders =>
      'దీని నుండి కంటెంట్ తొలగింపును అనుమతించండి';

  @override
  String get adminResetPasswordWarning =>
      'ఇది పాస్వర్డ్ను తొలగిస్తుంది. వినియోగదారు పాస్‌వర్డ్ లేకుండా లాగిన్ చేయగలరు.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'సర్వర్ HTTP $statusను తిరిగి ఇచ్చింది';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$nameని ఖచ్చితంగా తొలగించాలా?';
  }

  @override
  String adminUserDeleted(String name) {
    return '\"$name\" వినియోగదారు తొలగించబడ్డారు';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'వినియోగదారుని తొలగించడం విఫలమైంది: $error';
  }

  @override
  String get adminCreateApiKey => 'API కీని సృష్టించండి';

  @override
  String get adminAppName => 'యాప్ పేరు';

  @override
  String get adminApiKeyCreated => 'API కీ సృష్టించబడింది';

  @override
  String get adminApiKeyCreatedNoToken =>
      'కీ విజయవంతంగా సృష్టించబడింది. సర్వర్ టోకెన్‌ను తిరిగి ఇవ్వలేదు. సర్వర్ API కీలను తనిఖీ చేయండి.';

  @override
  String get adminKeyCopied => 'కీ క్లిప్‌బోర్డ్‌కి కాపీ చేయబడింది';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'కీని సృష్టించడం విఫలమైంది: $error';
  }

  @override
  String get adminKeyTokenMissing => 'సర్వర్ ప్రతిస్పందన నుండి కీ టోకెన్ లేదు';

  @override
  String get adminRevokeApiKey => 'API కీని ఉపసంహరించుకోండి';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name కోసం కీని ఉపసంహరించాలా?';
  }

  @override
  String get adminApiKeyRevoked => 'API కీ ఉపసంహరించబడింది';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'కీని ఉపసంహరించడం విఫలమైంది: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API కీలను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminApiKeysTitle => 'API కీలు';

  @override
  String get adminCreateKey => 'కీని సృష్టించండి';

  @override
  String get adminNoApiKeys => 'API కీలు ఏవీ కనుగొనబడలేదు';

  @override
  String get adminUnknownApp => 'తెలియని యాప్';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'టోకెన్: $token\\nసృష్టించబడింది: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'బ్యాకప్ సృష్టించండి';

  @override
  String get adminBackupInclude => 'బ్యాకప్‌లో దేనిని చేర్చాలో ఎంచుకోండి.';

  @override
  String get adminBackupDatabase => 'డేటాబేస్';

  @override
  String get adminBackupDatabaseAlways => 'ఎల్లప్పుడూ చేర్చబడుతుంది';

  @override
  String get adminBackupMetadata => 'మెటాడేటా';

  @override
  String get adminBackupSubtitles => 'సబ్‌టైటిల్‌లు';

  @override
  String get adminBackupTrickplay => 'Trickplay ఇమేజ్‌లు';

  @override
  String get adminCreatingBackup => 'బ్యాకప్ సృష్టిస్తోంది...';

  @override
  String get adminBackupCreated => 'బ్యాకప్ విజయవంతంగా సృష్టించబడింది';

  @override
  String adminBackupCreateFailed(String error) {
    return 'బ్యాకప్‌ను సృష్టించడం విఫలమైంది: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'సర్వర్ ప్రతిస్పందనలో బ్యాకప్ మార్గం లేదు';

  @override
  String adminBackupManifest(String name) {
    return 'మేనిఫెస్ట్: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'మేనిఫెస్ట్‌ను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminConfirmRestore => 'పునరుద్ధరించడాన్ని నిర్ధారించండి';

  @override
  String get adminRestoringBackup => 'బ్యాకప్‌ని పునరుద్ధరిస్తోంది...';

  @override
  String adminRestoreFailed(String error) {
    return 'బ్యాకప్‌ను పునరుద్ధరించడం విఫలమైంది: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'బ్యాకప్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminCreateBackup => 'బ్యాకప్ సృష్టించండి';

  @override
  String get adminNoBackups => 'బ్యాకప్‌లు ఏవీ కనుగొనబడలేదు';

  @override
  String get adminViewDetails => 'వివరాలను వీక్షించండి';

  @override
  String get restore => 'పునరుద్ధరించు';

  @override
  String get adminLogsLoadFailed => 'సర్వర్ లాగ్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminNoLogFiles => 'లాగ్ ఫైల్‌లు ఏవీ కనుగొనబడలేదు';

  @override
  String get adminLogCopied => 'లాగ్ క్లిప్‌బోర్డ్‌కి కాపీ చేయబడింది';

  @override
  String get adminSaveLogFile => 'లాగ్ ఫైల్‌ను సేవ్ చేయండి';

  @override
  String adminSavedTo(String path) {
    return '$pathకి సేవ్ చేయబడింది';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ఫైల్‌ను సేవ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileNameను లోడ్ చేయడం విఫలమైంది';
  }

  @override
  String get adminSearchInLog => 'లాగ్‌లో శోధించండి';

  @override
  String get adminNoMatchingLines => 'సరిపోలే పంక్తులు లేవు';

  @override
  String adminTasksLoadFailed(String error) {
    return 'టాస్క్‌లను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminNoScheduledTasks =>
      'షెడ్యూల్ చేయబడిన టాస్క్‌లు ఏవీ కనుగొనబడలేదు';

  @override
  String get adminNoTasksMatchFilter =>
      'ప్రస్తుత ఫిల్టర్‌తో టాస్క్‌లు ఏవీ సరిపోలలేదు';

  @override
  String adminTaskStartFailed(String error) {
    return 'టాస్క్‌ను ప్రారంభించడం విఫలమైంది: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'టాస్క్‌ను ఆపడం విఫలమైంది: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'టాస్క్‌ను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminRunNow => 'ఇప్పుడు అమలు చేయండి';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ట్రిగ్గర్‌ను తీసివేయడం విఫలమైంది: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ట్రిగ్గర్‌ను జోడించడం విఫలమైంది: $error';
  }

  @override
  String get adminLastExecution => 'చివరి అమలు';

  @override
  String get adminTriggers => 'ట్రిగ్గర్స్';

  @override
  String get adminAddTrigger => 'ట్రిగ్గర్‌ని జోడించండి';

  @override
  String get adminNoTriggers => 'ట్రిగ్గర్‌లు ఏవీ కాన్ఫిగర్ చేయబడలేదు';

  @override
  String get adminTriggerType => 'ట్రిగ్గర్ రకం';

  @override
  String get adminTimeLimit => 'సమయ పరిమితి (ఐచ్ఛికం)';

  @override
  String get adminNoLimit => 'పరిమితి లేదు';

  @override
  String adminHours(String hours) {
    return '$hours గంట(లు)';
  }

  @override
  String get adminDayOfWeek => 'వారం రోజు';

  @override
  String get adminSearchPlugins => 'ప్లగిన్‌లను శోధించండి...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'ప్లగిన్‌ను టోగుల్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminUninstallPlugin => 'ప్లగిన్‌ని అన్‌ఇన్‌స్టాల్ చేయండి';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '\"$name\"ని ఖచ్చితంగా అన్‌ఇన్‌స్టాల్ చేయాలా?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'ప్లగిన్‌ను అన్‌ఇన్‌స్టాల్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'ప్యాకేజీని ఇన్‌స్టాల్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'అప్‌డేట్‌ను ఇన్‌స్టాల్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'ప్లగిన్‌లను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => 'మీ శోధనకు సరిపోలే ప్లగిన్‌లు లేవు';

  @override
  String get adminNoPluginsInstalled => 'ప్లగిన్‌లు ఏవీ ఇన్‌స్టాల్ చేయబడలేదు';

  @override
  String adminInstallUpdate(String version) {
    return 'అప్‌డేట్‌ను ఇన్‌స్టాల్ చేయండి (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'క్యాటలాగ్‌ను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'మీ శోధనకు సరిపోలే ప్యాకేజీలు ఏవీ లేవు';

  @override
  String get adminNoPackagesAvailable => 'ప్యాకేజీలు అందుబాటులో లేవు';

  @override
  String get adminExperimentalIntegration => 'ప్రయోగాత్మక ఏకీకరణ';

  @override
  String get adminExperimentalWarning =>
      'ప్లగిన్ సెట్టింగ్‌ల ఏకీకరణ ఇప్పటికీ ప్రయోగాత్మకంగా ఉంది. కొన్ని సెట్టింగ్‌ల పేజీలు సరిగ్గా రెండర్ కాకపోవచ్చు.';

  @override
  String get continueAction => 'కొనసాగించు';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'సర్వర్ పునఃప్రారంభం తర్వాత \"$name\" తీసివేయబడుతుంది';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'అన్‌ఇన్‌స్టాల్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\"ని v$versionకి అప్‌డేట్ చేస్తోంది...';
  }

  @override
  String get adminMissingAuthToken =>
      'సెట్టింగ్‌లను తెరవడం సాధ్యం కాలేదు: ప్రామాణీకరణ టోకెన్ లేదు.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'ప్లగిన్‌ను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminPluginNotFound => 'ప్లగిన్ కనుగొనబడలేదు';

  @override
  String adminPluginVersion(String version) {
    return 'వెర్షన్ $version';
  }

  @override
  String get adminEnablePlugin => 'ప్లగిన్‌ని ప్రారంభించండి';

  @override
  String get adminPluginSettingsPage => 'ప్లగిన్ సెట్టింగ్‌ల పేజీ';

  @override
  String get adminRevisionHistory => 'పునర్విమర్శ చరిత్ర';

  @override
  String get adminNoChangelog => 'చేంజ్లాగ్ అందుబాటులో లేదు.';

  @override
  String get adminRemoveRepository => 'రిపోజిటరీని తీసివేయండి';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return '\"$name\"ని ఖచ్చితంగా తీసివేయాలా?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'రిపోజిటరీలను సేవ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'రిపోజిటరీలను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminRepositoryNameHint => 'ఉదా Jellyfin స్థిరంగా';

  @override
  String get adminRepositoryUrl => 'రిపోజిటరీ URL';

  @override
  String get adminAddEntry => 'ఎంట్రీని జోడించండి';

  @override
  String get adminInvalidUrl => 'చెల్లని URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'ప్లగిన్ సెట్టింగ్‌లను లోడ్ చేయడం సాధ్యపడలేదు: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uriను తెరవడం సాధ్యపడలేదు';
  }

  @override
  String get adminOpenInBrowser => 'బ్రౌజర్‌లో తెరవండి';

  @override
  String get adminOpenExternally => 'బాహ్యంగా తెరవండి';

  @override
  String get adminGeneralSettings => 'సాధారణ సెట్టింగులు';

  @override
  String get adminServerName => 'సర్వర్ పేరు';

  @override
  String get adminPreferredMetadataCountry => 'ప్రాధాన్య మెటాడేటా దేశం';

  @override
  String get adminCachePath => 'కాష్ మార్గం';

  @override
  String get adminMetadataPath => 'మెటాడేటా మార్గం';

  @override
  String get adminLibraryScanConcurrency => 'లైబ్రరీ స్కాన్ కాన్కరెన్సీ';

  @override
  String get adminParallelImageEncodingLimit =>
      'సమాంతర ఇమేజ్ ఎన్‌కోడింగ్ పరిమితి';

  @override
  String get adminSlowResponseThreshold => 'స్లో రెస్పాన్స్ థ్రెషోల్డ్ (మిసె)';

  @override
  String get adminBrandingSaved => 'బ్రాండింగ్ సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి';

  @override
  String get adminBrandingLoadFailed =>
      'బ్రాండింగ్ సెట్టింగ్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminLoginDisclaimer => 'లాగిన్ నిరాకరణ';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML లాగిన్ ఫారమ్ క్రింద ప్రదర్శించబడుతుంది';

  @override
  String get adminCustomCss => 'అనుకూల CSS';

  @override
  String get adminCustomCssHint =>
      'వెబ్ ఇంటర్‌ఫేస్‌కు అనుకూల CSS వర్తింపజేయబడింది';

  @override
  String get adminEnableSplashScreen => 'స్ప్లాష్ స్క్రీన్‌ని ప్రారంభించండి';

  @override
  String get adminStreamingSaved => 'స్ట్రీమింగ్ సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి';

  @override
  String get adminStreamingLoadFailed =>
      'స్ట్రీమింగ్ సెట్టింగ్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminStreamingDescription =>
      'రిమోట్ కనెక్షన్‌ల కోసం గ్లోబల్ స్ట్రీమింగ్ బిట్‌రేట్ పరిమితులను సెట్ చేయండి.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'రిమోట్ క్లయింట్ బిట్రేట్ పరిమితి (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'అపరిమిత కోసం ఖాళీగా లేదా 0ని వదిలివేయండి';

  @override
  String get adminPlaybackSaved => 'ప్లేబ్యాక్ సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి';

  @override
  String get adminPlaybackLoadFailed =>
      'ప్లేబ్యాక్ సెట్టింగ్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminPlaybackTranscoding => 'ప్లేబ్యాక్ / ట్రాన్స్‌కోడింగ్';

  @override
  String get adminHardwareAcceleration => 'హార్డ్వేర్ త్వరణం';

  @override
  String get adminVaapiDevice => 'VA-API పరికరం';

  @override
  String get adminEnableHardwareEncoding =>
      'హార్డ్‌వేర్ ఎన్‌కోడింగ్‌ని ప్రారంభించండి';

  @override
  String get adminEnableHardwareDecoding =>
      'దీని కోసం హార్డ్‌వేర్ డీకోడింగ్‌ని ప్రారంభించండి:';

  @override
  String get adminEncodingThreads => 'ఎన్‌కోడింగ్ థ్రెడ్‌లు';

  @override
  String get adminAutomatic => '0 = ఆటోమేటిక్';

  @override
  String get adminTranscodingTempPath => 'ట్రాన్స్‌కోడింగ్ టెంప్ పాత్';

  @override
  String get adminEnableFallbackFont => 'ఫాల్‌బ్యాక్ ఫాంట్‌ను ప్రారంభించండి';

  @override
  String get adminFallbackFontPath => 'ఫాల్‌బ్యాక్ ఫాంట్ మార్గం';

  @override
  String get adminAllowSegmentDeletion => 'సెగ్మెంట్ తొలగింపును అనుమతించండి';

  @override
  String get adminSegmentKeepSeconds => 'సెగ్మెంట్ కీప్ (సెకన్లు)';

  @override
  String get adminThrottleBuffering => 'థొరెటల్ బఫరింగ్';

  @override
  String get adminTrickplaySaved => 'Trickplay సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి';

  @override
  String get adminTrickplayLoadFailed =>
      'Trickplay సెట్టింగ్‌లను లోడ్ చేయడం విఫలమైంది';

  @override
  String get adminEnableHardwareAcceleration =>
      'హార్డ్‌వేర్ త్వరణాన్ని ప్రారంభించండి';

  @override
  String get adminEnableKeyFrameExtraction =>
      'కీ ఫ్రేమ్ మాత్రమే సంగ్రహణను ప్రారంభించండి';

  @override
  String get adminKeyFrameSubtitle => 'వేగంగా కానీ తక్కువ ఖచ్చితత్వం';

  @override
  String get adminScanBehavior => 'ప్రవర్తనను స్కాన్ చేయండి';

  @override
  String get adminProcessPriority => 'ప్రాసెస్ ప్రాధాన్యత';

  @override
  String get adminImageSettings => 'చిత్రం సెట్టింగ్‌లు';

  @override
  String get adminIntervalMs => 'విరామం (మిసె)';

  @override
  String get adminCaptureFrameSubtitle => 'ఫ్రేమ్‌లను ఎంత తరచుగా సంగ్రహించాలి';

  @override
  String get adminWidthResolutions => 'వెడల్పు తీర్మానాలు';

  @override
  String get adminTileWidth => 'టైల్ వెడల్పు';

  @override
  String get adminTileHeight => 'టైల్ ఎత్తు';

  @override
  String get adminQualitySubtitle =>
      'తక్కువ విలువలు = మెరుగైన నాణ్యత, పెద్ద ఫైల్‌లు';

  @override
  String get adminProcessThreads => 'థ్రెడ్లను ప్రాసెస్ చేయండి';

  @override
  String get adminResumeSaved => 'రెస్యూమ్ సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి';

  @override
  String get adminResumeLoadFailed =>
      'రెజ్యూమ్ సెట్టింగ్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminResumeDescription =>
      'కంటెంట్ పాక్షికంగా ప్లే చేయబడినట్లు లేదా పూర్తిగా ప్లే చేయబడినట్లు ఎప్పుడు గుర్తించబడాలో కాన్ఫిగర్ చేయండి.';

  @override
  String get adminMinResumePercentage => 'కనిష్ట రెజ్యూమ్ శాతం';

  @override
  String get adminMinResumeSubtitle =>
      'ప్రోగ్రెస్‌ని ఆదా చేయడానికి ఈ శాతాన్ని దాటి కంటెంట్ ప్లే చేయాలి';

  @override
  String get adminMaxResumePercentage => 'గరిష్ట రెజ్యూమ్ శాతం';

  @override
  String get adminMaxResumeSubtitle =>
      'ఈ శాతం తర్వాత కంటెంట్ పూర్తిగా ప్లే చేయబడినట్లు పరిగణించబడుతుంది';

  @override
  String get adminMinResumeDuration => 'కనీస రెజ్యూమ్ వ్యవధి (సెకన్లు)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'దీని కంటే చిన్న వస్తువులు పునఃప్రారంభించబడవు';

  @override
  String get adminMinAudiobookResume => 'కనీస ఆడియోబుక్ రెజ్యూమ్ శాతం';

  @override
  String get adminMaxAudiobookResume => 'గరిష్ట ఆడియోబుక్ రెజ్యూమ్ శాతం';

  @override
  String get adminNetworkingSaved =>
      'నెట్‌వర్కింగ్ సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి. సర్వర్ పునఃప్రారంభం అవసరం కావచ్చు.';

  @override
  String get adminNetworkingLoadFailed =>
      'నెట్‌వర్కింగ్ సెట్టింగ్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminNetworkingWarning =>
      'నెట్‌వర్కింగ్ సెట్టింగ్‌లకు మార్పులకు సర్వర్ పునఃప్రారంభం అవసరం కావచ్చు.';

  @override
  String get adminEnableRemoteAccess => 'రిమోట్ యాక్సెస్‌ని ప్రారంభించండి';

  @override
  String get ports => 'ఓడరేవులు';

  @override
  String get adminHttpPort => 'HTTP పోర్ట్';

  @override
  String get adminHttpsPort => 'HTTPS పోర్ట్';

  @override
  String get adminPublicHttpsPort => 'పబ్లిక్ HTTPS పోర్ట్';

  @override
  String get adminBaseUrl => 'బేస్ URL';

  @override
  String get adminBaseUrlHint => 'ఉదా. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPSని ప్రారంభించండి';

  @override
  String get adminLocalNetwork => 'స్థానిక నెట్‌వర్క్';

  @override
  String get adminLocalNetworkAddresses => 'స్థానిక నెట్‌వర్క్ చిరునామాలు';

  @override
  String get adminKnownProxies => 'తెలిసిన ప్రాక్సీలు';

  @override
  String get adminRemoteIpFilter => 'రిమోట్ IP ఫిల్టర్';

  @override
  String get adminRemoteIpFilterEntries => 'రిమోట్ IP ఫిల్టర్';

  @override
  String get adminCertificatePath => 'సర్టిఫికేట్ మార్గం';

  @override
  String get whitelist => 'వైట్‌లిస్ట్';

  @override
  String get blacklist => 'బ్లాక్లిస్ట్';

  @override
  String get notSet => 'సెట్ కాలేదు';

  @override
  String get adminMetadataSaved => 'మెటాడేటా సేవ్ చేయబడింది';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'మెటాడేటాను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'మెటాడేటాను సేవ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminRefreshMetadata => 'మెటాడేటాను రిఫ్రెష్ చేయండి';

  @override
  String get recursive => 'పునరావృతం';

  @override
  String get adminReplaceAllMetadata => 'మొత్తం మెటాడేటాను భర్తీ చేయండి';

  @override
  String get adminReplaceAllImages => 'అన్ని చిత్రాలను భర్తీ చేయండి';

  @override
  String get adminMetadataRefreshRequested =>
      'మెటాడేటా రిఫ్రెష్ అభ్యర్థించబడింది';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'మెటాడేటాను రిఫ్రెష్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminNoRemoteMatches => 'రిమోట్ సరిపోలికలు ఏవీ కనుగొనబడలేదు';

  @override
  String get adminRemoteResults => 'రిమోట్ ఫలితాలు';

  @override
  String get adminRemoteMetadataApplied => 'రిమోట్ మెటాడేటా వర్తింపజేయబడింది';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'రిమోట్ శోధన విఫలమైంది: $error';
  }

  @override
  String get adminUpdateContentType => 'కంటెంట్ రకాన్ని నవీకరించండి';

  @override
  String get adminContentType => 'కంటెంట్ రకం';

  @override
  String get adminContentTypeUpdated => 'కంటెంట్ రకం నవీకరించబడింది';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'కంటెంట్ రకాన్ని అప్‌డేట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'మెటాడేటా ఎడిటర్‌ను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminNoPeopleEntries => 'వ్యక్తుల ఎంట్రీలు లేవు';

  @override
  String get adminNoExternalIds => 'బాహ్య IDలు ఏవీ అందుబాటులో లేవు';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType ఇమేజ్ అప్‌డేట్ చేయబడింది';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'ఇమేజ్‌ను డౌన్‌లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'చిత్రం ఆకృతికి మద్దతు లేదు';

  @override
  String get adminImageReadFailed => 'ఎంచుకున్న చిత్రాన్ని చదవడంలో విఫలమైంది';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType ఇమేజ్ అప్‌లోడ్ చేయబడింది';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'ఇమేజ్‌ను అప్‌లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType ఇమేజ్‌ను తొలగించండి';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType ఇమేజ్ తొలగించబడింది';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'ఇమేజ్‌ను తొలగించడం విఫలమైంది: $error';
  }

  @override
  String get adminAllProviders => 'అందరు ప్రొవైడర్లు';

  @override
  String get adminNoRemoteImages => 'రిమోట్ చిత్రాలు ఏవీ కనుగొనబడలేదు';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'ట్యూనర్ డిస్కవరీ విఫలమైంది: $error';
  }

  @override
  String get adminAddTuner => 'ట్యూనర్‌ని జోడించండి';

  @override
  String get adminEditTuner => 'ట్యూనర్‌ను సవరించండి';

  @override
  String get adminTunerTypeM3u => 'M3U ట్యూనర్';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'ఫైల్ లేదా URL';

  @override
  String get adminTunerIpAddress => 'ట్యూనర్ IP చిరునామా';

  @override
  String get adminTunerFriendlyName => 'సులభ పేరు';

  @override
  String get adminTunerUserAgent => 'యూజర్ ఏజెంట్';

  @override
  String get adminTunerCount => 'ఏకకాల కనెక్షన్ పరిమితి';

  @override
  String get adminTunerCountHelp =>
      'ట్యూనర్ ఒకేసారి అనుమతించే గరిష్ఠ స్ట్రీమ్‌ల సంఖ్య. అపరిమితం కోసం 0కి సెట్ చేయండి.';

  @override
  String get adminTunerFallbackBitrate =>
      'ప్రత్యామ్నాయ గరిష్ఠ స్ట్రీమింగ్ బిట్‌రేట్';

  @override
  String get adminTunerImportFavoritesOnly =>
      'ఇష్టమైన ఛానెల్‌లను మాత్రమే దిగుమతి చేయండి';

  @override
  String get adminTunerAllowHwTranscoding =>
      'హార్డ్‌వేర్ ట్రాన్స్‌కోడింగ్‌ను అనుమతించండి';

  @override
  String get adminTunerAllowFmp4 =>
      'fMP4 ట్రాన్స్‌కోడింగ్ కంటైనర్‌ను అనుమతించండి';

  @override
  String get adminTunerAllowStreamSharing => 'స్ట్రీమ్ షేరింగ్‌ను అనుమతించండి';

  @override
  String get adminTunerEnableStreamLooping =>
      'స్ట్రీమ్ లూపింగ్‌ను ప్రారంభించండి';

  @override
  String get adminTunerIgnoreDts => 'DTSను విస్మరించండి';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'ఇన్‌పుట్‌ను నేటివ్ ఫ్రేమ్ రేట్‌లో చదవండి';

  @override
  String get adminEditProvider => 'ప్రొవైడర్‌ను సవరించండి';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'ఫైల్ లేదా URL';

  @override
  String get adminXmltvMoviePrefix => 'సినిమా ప్రిఫిక్స్';

  @override
  String get adminXmltvMovieCategories => 'సినిమా వర్గాలు';

  @override
  String get adminXmltvCategoriesHelp =>
      'బహుళ వర్గాలను నిలువు గీతతో వేరు చేయండి.';

  @override
  String get adminXmltvKidsCategories => 'పిల్లల వర్గాలు';

  @override
  String get adminXmltvNewsCategories => 'వార్తల వర్గాలు';

  @override
  String get adminXmltvSportsCategories => 'క్రీడల వర్గాలు';

  @override
  String get adminSdUsername => 'వినియోగదారు పేరు';

  @override
  String get adminSdPassword => 'పాస్‌వర్డ్';

  @override
  String get adminSdCountry => 'దేశం';

  @override
  String get adminSdCountrySelect => 'ఒక దేశాన్ని ఎంచుకోండి';

  @override
  String get adminSdPostalCode => 'పోస్టల్ కోడ్';

  @override
  String get adminSdGetListings => 'జాబితాలను పొందండి';

  @override
  String get adminSdListings => 'జాబితాలు';

  @override
  String get adminEnableAllTuners => 'అన్ని ట్యూనర్‌లను ప్రారంభించండి';

  @override
  String get adminTunerType => 'ట్యూనర్ రకం';

  @override
  String get adminTunerAdded => 'ట్యూనర్ జోడించబడింది';

  @override
  String adminTunerAddFailed(String error) {
    return 'ట్యూనర్‌ను జోడించడం విఫలమైంది: $error';
  }

  @override
  String get adminAddGuideProvider => 'గైడ్ ప్రొవైడర్‌ని జోడించండి';

  @override
  String get adminProviderType => 'ప్రొవైడర్ రకం';

  @override
  String get adminProviderAdded => 'ప్రొవైడర్ జోడించబడింది';

  @override
  String adminProviderAddFailed(String error) {
    return 'ప్రొవైడర్‌ను జోడించడం విఫలమైంది: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'ట్యూనర్‌ను తీసివేయడం విఫలమైంది: $error';
  }

  @override
  String get adminTunerResetRequested => 'ట్యూనర్ రీసెట్ అభ్యర్థించబడింది';

  @override
  String adminTunerResetFailed(String error) {
    return 'ట్యూనర్‌ను రీసెట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'ఈ ట్యూనర్ రకం రీసెట్ చేయడానికి మద్దతివ్వదు.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'ప్రొవైడర్‌ను తీసివేయడం విఫలమైంది: $error';
  }

  @override
  String get adminRecordingSettings => 'రికార్డింగ్ సెట్టింగ్‌లు';

  @override
  String get adminPrePadding => 'ప్రీ-ప్యాడింగ్ (నిమిషాలు)';

  @override
  String get adminPostPadding => 'పోస్ట్-పాడింగ్ (నిమిషాలు)';

  @override
  String get adminRecordingPath => 'రికార్డింగ్ మార్గం';

  @override
  String get adminSeriesRecordingPath => 'సిరీస్ రికార్డింగ్ మార్గం';

  @override
  String get adminMovieRecordingPath => 'సినిమా రికార్డింగ్ పాత్';

  @override
  String get adminGuideDays => 'గైడ్ డేటా రోజులు';

  @override
  String get adminGuideDaysAuto => 'ఆటోమేటిక్';

  @override
  String adminGuideDaysValue(int days) {
    return '$days రోజులు';
  }

  @override
  String get adminRecordingPostProcessor =>
      'పోస్ట్-ప్రాసెసింగ్ అప్లికేషన్ పాత్';

  @override
  String get adminRecordingPostProcessorArgs =>
      'పోస్ట్-ప్రాసెసర్ ఆర్గ్యుమెంట్‌లు';

  @override
  String get adminSaveRecordingNfo => 'రికార్డింగ్ NFO మెటాడేటాను సేవ్ చేయండి';

  @override
  String get adminSaveRecordingImages => 'రికార్డింగ్ ఇమేజ్‌లను సేవ్ చేయండి';

  @override
  String get adminLiveTvSectionTiming => 'సమయం';

  @override
  String get adminLiveTvSectionPaths => 'రికార్డింగ్ పాత్‌లు';

  @override
  String get adminLiveTvSectionPostProcessing => 'పోస్ట్-ప్రాసెసింగ్';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'గైడ్ డేటా: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'రికార్డింగ్ సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'సెట్టింగ్‌లను సేవ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminSetChannelMappings => 'ఛానెల్ మ్యాపింగ్‌లను సెట్ చేయండి';

  @override
  String get adminMappingJson => 'JSON మ్యాపింగ్';

  @override
  String get adminMappingJsonHint => 'ఉదాహరణ: మ్యాపింగ్‌లు JSON పేలోడ్';

  @override
  String get adminChannelMappingsUpdated =>
      'ఛానెల్ మ్యాపింగ్‌లు నవీకరించబడ్డాయి';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'మ్యాపింగ్‌లను అప్‌డేట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'ప్రత్యక్ష ప్రసార టీవీ నిర్వహణను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminTunerDevices => 'ట్యూనర్ పరికరాలు';

  @override
  String get adminNoTunerHosts => 'ట్యూనర్ హోస్ట్‌లు ఏవీ కాన్ఫిగర్ చేయబడలేదు';

  @override
  String get adminGuideProviders => 'గైడ్ ప్రొవైడర్లు';

  @override
  String get adminRefreshGuideData => 'గైడ్ డేటాను రిఫ్రెష్ చేయండి';

  @override
  String get adminGuideRefreshStarted => 'గైడ్ డేటా రిఫ్రెష్ ప్రారంభమైంది';

  @override
  String get adminGuideRefreshUnavailable =>
      'ఈ సర్వర్‌లో గైడ్ రిఫ్రెష్ టాస్క్ అందుబాటులో లేదు.';

  @override
  String get adminAddProvider => 'ప్రదాతని జోడించండి';

  @override
  String get adminNoListingProviders =>
      'లిస్టింగ్ ప్రొవైడర్లు ఏవీ కాన్ఫిగర్ చేయబడలేదు';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'రికార్డింగ్ పాత్: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'సిరీస్ పాత్: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'ప్రీ-ప్యాడింగ్: $minutes ని';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'పోస్ట్-ప్యాడింగ్: $minutes ని';
  }

  @override
  String get adminTunerDiscovery => 'ట్యూనర్ ఆవిష్కరణ';

  @override
  String get adminChannelMappings => 'ఛానెల్ మ్యాపింగ్‌లు';

  @override
  String get adminNoDiscoveredTuners => 'ట్యూనర్‌లు ఇంకా కనుగొనబడలేదు';

  @override
  String get adminSettingsSaved => 'సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి';

  @override
  String get adminBackupsNotAvailable =>
      'ఈ సర్వర్ బిల్డ్‌లో బ్యాకప్‌లు అందుబాటులో లేవు.';

  @override
  String get adminRestoreWarning1 =>
      'పునరుద్ధరణ మొత్తం ప్రస్తుత సర్వర్ డేటాను బ్యాకప్ డేటాతో భర్తీ చేస్తుంది.';

  @override
  String get adminRestoreWarning2 =>
      'ప్రస్తుత సర్వర్ సెట్టింగ్‌లు, వినియోగదారులు మరియు లైబ్రరీ డేటా ఓవర్‌రైట్ చేయబడతాయి.';

  @override
  String get adminRestoreWarning3 =>
      'పునరుద్ధరణ తర్వాత సర్వర్ పునఃప్రారంభించబడుతుంది.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '$name బ్యాకప్‌ను ఇప్పుడు పునరుద్ధరించాలా?';
  }

  @override
  String get adminRestoreRequested =>
      'పునరుద్ధరించమని అభ్యర్థించారు. సర్వర్ పునఃప్రారంభం ఈ సెషన్‌ను డిస్‌కనెక్ట్ చేయవచ్చు.';

  @override
  String get adminBackupsTitle => 'బ్యాకప్‌లు';

  @override
  String get adminUnknownDate => 'తెలియని తేదీ';

  @override
  String get adminUnnamedBackup => 'పేరులేని బ్యాకప్';

  @override
  String get adminLiveTvNotAvailable =>
      'ఈ సర్వర్ బిల్డ్‌లో లైవ్ టీవీ అడ్మినిస్ట్రేషన్ అందుబాటులో లేదు.';

  @override
  String get adminLiveTvTitle => 'లైవ్ టీవీ అడ్మినిస్ట్రేషన్';

  @override
  String get adminApply => 'వర్తింపజేయండి';

  @override
  String get adminNotSet => 'సెట్ కాలేదు';

  @override
  String get adminReset => 'రీసెట్ చేయండి';

  @override
  String get adminLogsTitle => 'సర్వర్ లాగ్‌లు';

  @override
  String get adminLogsNewestFirst => 'సరికొత్త మొదటిది';

  @override
  String get adminLogsOldestFirst => 'పురాతన మొదటి';

  @override
  String get adminLogsJustNow => 'ఇప్పుడే';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutesని క్రితం';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hoursగం క్రితం';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$daysరో క్రితం';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileNameను లోడ్ చేయడం విఫలమైంది';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count సరిపోలికలు';
  }

  @override
  String get adminLogViewerNoMatches => 'సరిపోలే పంక్తులు లేవు';

  @override
  String get adminMetadataEditorTitle => 'మెటాడేటా ఎడిటర్';

  @override
  String get adminMetadataIdentify => 'గుర్తించండి';

  @override
  String get adminMetadataType => 'టైప్ చేయండి';

  @override
  String get adminMetadataDetails => 'వివరాలు';

  @override
  String get adminMetadataExternalIds => 'బాహ్య IDలు';

  @override
  String get adminMetadataImages => 'చిత్రాలు';

  @override
  String get adminMetadataFieldTitle => 'శీర్షిక';

  @override
  String get adminMetadataFieldSortTitle => 'శీర్షికను క్రమబద్ధీకరించండి';

  @override
  String get adminMetadataFieldOriginalTitle => 'అసలు శీర్షిక';

  @override
  String get adminMetadataFieldPremiereDate => 'ప్రీమియర్ తేదీ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'ముగింపు తేదీ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'ఉత్పత్తి సంవత్సరం';

  @override
  String get adminMetadataFieldOfficialRating => 'అధికారిక రేటింగ్';

  @override
  String get adminMetadataFieldCommunityRating => 'సంఘం రేటింగ్';

  @override
  String get adminMetadataFieldCriticRating => 'విమర్శకుల రేటింగ్';

  @override
  String get adminMetadataFieldTagline => 'ట్యాగ్‌లైన్';

  @override
  String get adminMetadataFieldOverview => 'అవలోకనం';

  @override
  String get adminMetadataGenres => 'శైలులు';

  @override
  String get adminMetadataTags => 'ట్యాగ్‌లు';

  @override
  String get adminMetadataStudios => 'స్టూడియోలు';

  @override
  String get adminMetadataPeople => 'ప్రజలు';

  @override
  String get adminMetadataAddGenre => 'శైలిని జోడించండి';

  @override
  String get adminMetadataAddTag => 'ట్యాగ్ జోడించండి';

  @override
  String get adminMetadataAddStudio => 'స్టూడియోని జోడించండి';

  @override
  String get adminMetadataAddPerson => 'వ్యక్తిని జోడించండి';

  @override
  String get adminMetadataEditPerson => 'వ్యక్తిని సవరించండి';

  @override
  String get adminMetadataRole => 'పాత్ర';

  @override
  String get adminMetadataImagePrimary => 'ప్రాథమిక';

  @override
  String get adminMetadataImageBackdrop => 'బ్యాక్‌డ్రాప్';

  @override
  String get adminMetadataImageLogo => 'లోగో';

  @override
  String get adminMetadataImageBanner => 'బ్యానర్';

  @override
  String get adminMetadataImageThumb => 'బొటనవేలు';

  @override
  String get adminMetadataRecursive => 'పునరావృతం';

  @override
  String get adminMetadataProvider => 'ప్రొవైడర్';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType ఇమేజ్ అప్‌డేట్ చేయబడింది';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType ఇమేజ్ అప్‌లోడ్ చేయబడింది';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType ఇమేజ్ తొలగించబడింది';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'ఇమేజ్‌ను డౌన్‌లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'ఎంచుకున్న చిత్రాన్ని చదవడంలో విఫలమైంది';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'ఇమేజ్‌ను అప్‌లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType ఇమేజ్‌ను తొలగించండి';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'ఇది అంశం నుండి ప్రస్తుత చిత్రాన్ని తీసివేస్తుంది.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'ఇమేజ్‌ను తొలగించడం విఫలమైంది: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType ఇమేజ్‌ను ఎంచుకోండి';
  }

  @override
  String get adminMetadataUpload => 'అప్‌లోడ్ చేయండి';

  @override
  String get adminMetadataUpdate => 'నవీకరించు';

  @override
  String get adminMetadataRemoteImage => 'రిమోట్ చిత్రం';

  @override
  String get adminPluginsInstalled => 'ఇన్‌స్టాల్ చేయబడింది';

  @override
  String get adminPluginsCatalog => 'కేటలాగ్';

  @override
  String get adminPluginsActive => 'చురుకుగా';

  @override
  String get adminPluginsRestart => 'పునఃప్రారంభించండి';

  @override
  String get adminPluginsNoSearchResults => 'మీ శోధనకు సరిపోలే ప్లగిన్‌లు లేవు';

  @override
  String get adminPluginsNoneInstalled => 'ప్లగిన్‌లు ఏవీ ఇన్‌స్టాల్ చేయబడలేదు';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'అప్‌డేట్ అందుబాటులో ఉంది: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'అప్‌డేట్ అందుబాటులో ఉంది';

  @override
  String get adminPluginsPendingRemoval =>
      'పునఃప్రారంభించిన తర్వాత తొలగింపు పెండింగ్‌లో ఉంది';

  @override
  String get adminPluginsChangesPending =>
      'పెండింగ్‌లో ఉన్న మార్పులు పునఃప్రారంభించబడ్డాయి';

  @override
  String get adminPluginsEnable => 'ప్రారంభించు';

  @override
  String get adminPluginsDisable => 'ఆపివేయి';

  @override
  String get adminPluginsInstallUpdate => 'నవీకరణను ఇన్‌స్టాల్ చేయండి';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'అప్‌డేట్‌ను ఇన్‌స్టాల్ చేయండి (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'మీ శోధనకు సరిపోలే ప్యాకేజీలు ఏవీ లేవు';

  @override
  String get adminPluginsCatalogEmpty => 'ప్యాకేజీలు అందుబాటులో లేవు';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" ఇన్‌స్టాల్ అవుతోంది...';
  }

  @override
  String get adminPluginDetailExperimental => 'ప్రయోగాత్మక ఏకీకరణ';

  @override
  String get adminPluginDetailExperimentalContent =>
      'ప్లగిన్ సెట్టింగ్‌ల ఏకీకరణ ఇప్పటికీ ప్రయోగాత్మకంగా ఉంది. కొన్ని ఫీల్డ్‌లు లేదా లేఅవుట్‌లు ఇంకా సరిగ్గా రెండర్ కాకపోవచ్చు.';

  @override
  String get adminPluginDetailToggle404 =>
      'ప్లగిన్‌ని టోగుల్ చేయడంలో విఫలమైంది. సర్వర్ ఈ ప్లగ్ఇన్ సంస్కరణను కనుగొనలేకపోయింది. ప్లగిన్‌లను రిఫ్రెష్ చేయడానికి ప్రయత్నించండి, ఆపై మళ్లీ ప్రయత్నించండి.';

  @override
  String get adminPluginDetailToggleDioError =>
      'ప్లగిన్‌ని టోగుల్ చేయడంలో విఫలమైంది. వివరాల కోసం దయచేసి సర్వర్ లాగ్‌లను తనిఖీ చేయండి.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name సెట్టింగ్‌లు';
  }

  @override
  String get adminPluginDetailDetails => 'వివరాలు';

  @override
  String get adminPluginDetailDeveloper => 'డెవలపర్';

  @override
  String get adminPluginDetailRepository => 'రిపోజిటరీ';

  @override
  String get adminPluginDetailBundled => 'బండిల్ చేయబడింది';

  @override
  String get adminPluginDetailEnablePlugin => 'ప్లగిన్‌ని ప్రారంభించండి';

  @override
  String get adminPluginDetailRestartRequired =>
      'మార్పులు అమలులోకి రావడానికి సర్వర్ పునఃప్రారంభం అవసరం.';

  @override
  String get adminPluginDetailRemovalPending =>
      'సర్వర్ పునఃప్రారంభించిన తర్వాత ఈ ప్లగ్ఇన్ తీసివేయబడుతుంది.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'ఈ ప్లగ్ఇన్ తప్పుగా పని చేసింది మరియు సరిగ్గా పని చేయకపోవచ్చు.';

  @override
  String get adminPluginDetailNotSupported =>
      'ఈ ప్లగ్‌ఇన్‌కు ప్రస్తుత సర్వర్ వెర్షన్ మద్దతు లేదు.';

  @override
  String get adminPluginDetailSuperseded =>
      'ఈ ప్లగ్ఇన్ కొత్త వెర్షన్ ద్వారా భర్తీ చేయబడింది.';

  @override
  String adminReposLoadFailed(String error) {
    return 'రిపోజిటరీలను లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminReposRemoveTitle => 'రిపోజిటరీని తీసివేయండి';

  @override
  String adminReposRemoveConfirm(String name) {
    return '\"$name\"ని ఖచ్చితంగా తీసివేయాలా?';
  }

  @override
  String get adminReposRemove => 'తీసివేయండి';

  @override
  String adminReposSaveFailed(String error) {
    return 'రిపోజిటరీలను సేవ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminReposEmpty => 'రిపోజిటరీలు ఏవీ కాన్ఫిగర్ చేయబడలేదు';

  @override
  String get adminReposEmptySubtitle =>
      'అందుబాటులో ఉన్న ప్లగిన్‌లను బ్రౌజ్ చేయడానికి రిపోజిటరీని జోడించండి';

  @override
  String get adminReposUnnamed => '(పేరు లేనిది)';

  @override
  String get adminReposEditTitle => 'రిపోజిటరీని సవరించండి';

  @override
  String get adminReposAddTitle => 'రిపోజిటరీని జోడించండి';

  @override
  String get adminReposUrl => 'రిపోజిటరీ URL';

  @override
  String get adminReposNameHint => 'ఉదా Jellyfin స్థిరంగా';

  @override
  String get adminPluginSettingsInvalidUrl => 'చెల్లని URL';

  @override
  String get adminGeneralSettingsTitle => 'సాధారణ సెట్టింగులు';

  @override
  String get adminGeneralMetadataLanguage => 'ప్రాధాన్య మెటాడేటా భాష';

  @override
  String get adminGeneralMetadataLanguageHint => 'ఉదా en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'ప్రాధాన్య మెటాడేటా దేశం';

  @override
  String get adminGeneralMetadataCountryHint => 'ఉదా US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'లైబ్రరీ స్కాన్ కాన్కరెన్సీ';

  @override
  String get adminGeneralImageEncodingLimit =>
      'సమాంతర ఇమేజ్ ఎన్‌కోడింగ్ పరిమితి';

  @override
  String get adminUnknownError => 'తెలియని లోపం';

  @override
  String get adminBrowse => 'బ్రౌజ్ చేయండి';

  @override
  String get adminCloseBrowser => 'బ్రౌజర్‌ని మూసివేయండి';

  @override
  String get adminNetworkingTitle => 'నెట్వర్కింగ్';

  @override
  String get adminNetworkingRestartWarning =>
      'నెట్‌వర్కింగ్ సెట్టింగ్‌లకు మార్పులకు సర్వర్ పునఃప్రారంభం అవసరం కావచ్చు.';

  @override
  String get adminNetworkingRemoteAccess => 'రిమోట్ యాక్సెస్‌ని ప్రారంభించండి';

  @override
  String get adminNetworkingPorts => 'ఓడరేవులు';

  @override
  String get adminNetworkingHttpPort => 'HTTP పోర్ట్';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS పోర్ట్';

  @override
  String get adminNetworkingEnableHttps => 'HTTPSని ప్రారంభించండి';

  @override
  String get adminNetworkingLocalNetwork => 'స్థానిక నెట్‌వర్క్';

  @override
  String get adminNetworkingLocalAddresses => 'స్థానిక నెట్‌వర్క్ చిరునామాలు';

  @override
  String get adminNetworkingAddressHint => 'ఉదా 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'తెలిసిన ప్రాక్సీలు';

  @override
  String get adminNetworkingProxyHint => 'ఉదా 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'వైట్‌లిస్ట్';

  @override
  String get adminNetworkingBlacklist => 'బ్లాక్లిస్ట్';

  @override
  String get adminNetworkingAddEntry => 'ఎంట్రీని జోడించండి';

  @override
  String get adminBrandingTitle => 'బ్రాండింగ్';

  @override
  String get adminBrandingLoginDisclaimer => 'లాగిన్ నిరాకరణ';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML లాగిన్ ఫారమ్ క్రింద ప్రదర్శించబడుతుంది';

  @override
  String get adminBrandingCustomCss => 'అనుకూల CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'వెబ్ ఇంటర్‌ఫేస్‌కు అనుకూల CSS వర్తింపజేయబడింది';

  @override
  String get adminBrandingEnableSplash => 'స్ప్లాష్ స్క్రీన్‌ని ప్రారంభించండి';

  @override
  String get adminBrandingSplashUpload => 'ఇమేజ్‌ను అప్‌లోడ్ చేయండి';

  @override
  String get adminBrandingSplashUploaded =>
      'స్ప్లాష్‌స్క్రీన్ అప్‌డేట్ చేయబడింది';

  @override
  String get adminBrandingSplashUploadFailed =>
      'స్ప్లాష్‌స్క్రీన్‌ను అప్‌లోడ్ చేయడం విఫలమైంది';

  @override
  String get adminBrandingSplashDeleted => 'స్ప్లాష్‌స్క్రీన్ తీసివేయబడింది';

  @override
  String get adminBrandingNoSplash => 'అనుకూల స్ప్లాష్‌స్క్రీన్ లేదు';

  @override
  String get adminPlaybackHwAccel => 'హార్డ్‌వేర్ త్వరణం';

  @override
  String get adminPlaybackHwAccelLabel => 'హార్డ్వేర్ త్వరణం';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'హార్డ్‌వేర్ ఎన్‌కోడింగ్‌ని ప్రారంభించండి';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'దీని కోసం హార్డ్‌వేర్ డీకోడింగ్‌ని ప్రారంభించండి:';

  @override
  String get adminPlaybackQsvDevice => 'QSV పరికరం';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'మెరుగైన NVDEC డీకోడర్‌ను ప్రారంభించండి';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'సిస్టమ్ నేటివ్ హార్డ్‌వేర్ డీకోడర్‌కు ప్రాధాన్యం ఇవ్వండి';

  @override
  String get adminPlaybackColorDepth => 'హార్డ్‌వేర్ డీకోడింగ్ కలర్ డెప్త్';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-బిట్ HEVC డీకోడింగ్';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-బిట్ VP9 డీకోడింగ్';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-బిట్ డీకోడింగ్';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-బిట్ డీకోడింగ్';

  @override
  String get adminPlaybackHwEncodingSection => 'హార్డ్‌వేర్ ఎన్‌కోడింగ్';

  @override
  String get adminPlaybackAllowHevcEncoding =>
      'HEVC ఎన్‌కోడింగ్‌ను అనుమతించండి';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 ఎన్‌కోడింగ్‌ను అనుమతించండి';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel లో-పవర్ H.264 ఎన్‌కోడర్‌ను ప్రారంభించండి';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel లో-పవర్ HEVC ఎన్‌కోడర్‌ను ప్రారంభించండి';

  @override
  String get adminPlaybackToneMapping => 'టోన్ మ్యాపింగ్';

  @override
  String get adminPlaybackEnableTonemapping =>
      'టోన్ మ్యాపింగ్‌ను ప్రారంభించండి';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'VPP టోన్ మ్యాపింగ్‌ను ప్రారంభించండి';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox టోన్ మ్యాపింగ్‌ను ప్రారంభించండి';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'టోన్ మ్యాపింగ్ అల్గారిథమ్';

  @override
  String get adminPlaybackTonemappingMode => 'టోన్ మ్యాపింగ్ మోడ్';

  @override
  String get adminPlaybackTonemappingRange => 'టోన్ మ్యాపింగ్ పరిధి';

  @override
  String get adminPlaybackTonemappingDesat => 'టోన్ మ్యాపింగ్ డీశాచురేషన్';

  @override
  String get adminPlaybackTonemappingPeak => 'టోన్ మ్యాపింగ్ పీక్';

  @override
  String get adminPlaybackTonemappingParam => 'టోన్ మ్యాపింగ్ పరామితి';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP టోన్ మ్యాపింగ్ ప్రకాశం';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP టోన్ మ్యాపింగ్ కాంట్రాస్ట్';

  @override
  String get adminPlaybackPresetsQuality => 'ప్రీసెట్‌లు & నాణ్యత';

  @override
  String get adminPlaybackEncoderPreset => 'ఎన్‌కోడర్ ప్రీసెట్';

  @override
  String get adminPlaybackH264Crf => 'H.264 ఎన్‌కోడింగ్ CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) ఎన్‌కోడింగ్ CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'డీఇంటర్‌లేస్ పద్ధతి';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'డీఇంటర్‌లేస్ చేసేటప్పుడు ఫ్రేమ్ రేట్‌ను రెట్టింపు చేయండి';

  @override
  String get adminPlaybackAudioSection => 'ఆడియో';

  @override
  String get adminPlaybackEnableAudioVbr =>
      'ఆడియో VBR ఎన్‌కోడింగ్‌ను ప్రారంభించండి';

  @override
  String get adminPlaybackDownmixBoost => 'ఆడియో డౌన్‌మిక్స్ బూస్ట్';

  @override
  String get adminPlaybackDownmixAlgorithm => 'స్టీరియో డౌన్‌మిక్స్ అల్గారిథమ్';

  @override
  String get adminPlaybackMaxMuxingQueue => 'గరిష్ఠ మక్సింగ్ క్యూ పరిమాణం';

  @override
  String get adminPlaybackAutoOption => 'ఆటో';

  @override
  String get adminPlaybackEncoding => 'ఎన్కోడింగ్';

  @override
  String get adminPlaybackEncodingThreads => 'ఎన్‌కోడింగ్ థ్రెడ్‌లు';

  @override
  String get adminPlaybackFallbackFont => 'ఫాల్‌బ్యాక్ ఫాంట్‌ను ప్రారంభించండి';

  @override
  String get adminPlaybackFallbackFontPath => 'ఫాల్‌బ్యాక్ ఫాంట్ మార్గం';

  @override
  String get adminPlaybackStreaming => 'స్ట్రీమింగ్';

  @override
  String get adminResumeVideo => 'వీడియో';

  @override
  String get adminResumeAudiobooks => 'ఆడియోబుక్స్';

  @override
  String get adminResumeMinAudiobookPct => 'కనీస ఆడియోబుక్ రెజ్యూమ్ శాతం';

  @override
  String get adminResumeMaxAudiobookPct => 'గరిష్ట ఆడియోబుక్ రెజ్యూమ్ శాతం';

  @override
  String get adminStreamingBitrateLimit =>
      'రిమోట్ క్లయింట్ బిట్రేట్ పరిమితి (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'అపరిమిత కోసం ఖాళీగా లేదా 0ని వదిలివేయండి';

  @override
  String get adminTrickplayHwAccel => 'హార్డ్‌వేర్ త్వరణాన్ని ప్రారంభించండి';

  @override
  String get adminTrickplayHwEncoding =>
      'హార్డ్‌వేర్ ఎన్‌కోడింగ్‌ని ప్రారంభించండి';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'కీ ఫ్రేమ్ మాత్రమే సంగ్రహణను ప్రారంభించండి';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'వేగంగా కానీ తక్కువ ఖచ్చితత్వం';

  @override
  String get adminTrickplayNonBlocking => 'నాన్-బ్లాకింగ్';

  @override
  String get adminTrickplayBlocking => 'నిరోధించడం';

  @override
  String get adminTrickplayPriorityHigh => 'అధిక';

  @override
  String get adminTrickplayPriorityAboveNormal => 'సాధారణం కంటే ఎక్కువ';

  @override
  String get adminTrickplayPriorityNormal => 'సాధారణ';

  @override
  String get adminTrickplayPriorityBelowNormal => 'సాధారణం క్రింద';

  @override
  String get adminTrickplayPriorityIdle => 'పనిలేకుండా';

  @override
  String get adminTrickplayImageSettings => 'చిత్రం సెట్టింగ్‌లు';

  @override
  String get adminTrickplayInterval => 'విరామం (మిసె)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'ఫ్రేమ్‌లను ఎంత తరచుగా సంగ్రహించాలి';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'కామాతో వేరు చేయబడిన పిక్సెల్ వెడల్పులు (ఉదా. 320)';

  @override
  String get adminTrickplayQuality => 'నాణ్యత';

  @override
  String get adminTrickplayQScale => 'నాణ్యత స్థాయి';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'తక్కువ విలువలు = మెరుగైన నాణ్యత, పెద్ద ఫైల్‌లు';

  @override
  String get adminTrickplayJpegQuality => 'JPEG నాణ్యత';

  @override
  String get adminTrickplayProcessing => 'ప్రాసెసింగ్';

  @override
  String get adminTasksEmpty => 'షెడ్యూల్ చేయబడిన టాస్క్‌లు ఏవీ కనుగొనబడలేదు';

  @override
  String get adminTasksNoFilterMatch =>
      'ప్రస్తుత ఫిల్టర్‌తో టాస్క్‌లు ఏవీ సరిపోలలేదు';

  @override
  String get adminTaskCancelling => 'రద్దు చేస్తోంది...';

  @override
  String get adminTaskRunning => 'నడుస్తోంది...';

  @override
  String get adminTaskNeverRun => 'ఎప్పుడూ పరుగెత్తకండి';

  @override
  String get adminTaskStop => 'ఆపండి';

  @override
  String get adminRunningTasks => 'నడుస్తున్న టాస్క్‌లు';

  @override
  String get adminTaskRun => 'పరుగు';

  @override
  String get adminTaskDetailLastExecution => 'చివరి అమలు';

  @override
  String get adminTaskDetailStarted => 'ప్రారంభించారు';

  @override
  String get adminTaskDetailEnded => 'ముగిసింది';

  @override
  String get adminTaskDetailDuration => 'వ్యవధి';

  @override
  String get adminTaskDetailErrorLabel => 'లోపం:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'ప్రతిరోజూ $timeకి';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'ప్రతి $day $timeకి';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'ప్రతి $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'అప్లికేషన్ ప్రారంభంలో';

  @override
  String get adminTaskTriggerTypeDaily => 'రోజువారీ';

  @override
  String get adminTaskTriggerTypeWeekly => 'వారానికోసారి';

  @override
  String get adminTaskTriggerTypeInterval => 'ఒక విరామంలో';

  @override
  String get adminTaskTriggerIntervalLabel => 'ఇంటర్వెల్';

  @override
  String get adminTaskTriggerEveryHour => 'ప్రతి గంట';

  @override
  String get adminTaskTriggerEvery6Hours => 'ప్రతి 6 గంటలు';

  @override
  String get adminTaskTriggerEvery12Hours => 'ప్రతి 12 గంటలు';

  @override
  String get adminTaskTriggerEvery24Hours => 'ప్రతి 24 గంటలు';

  @override
  String get adminTaskTriggerEvery2Days => 'ప్రతి 2 రోజులు';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count గంటలు',
      one: '1 గంట',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'సమయం';

  @override
  String get adminTaskTriggerNoLimit => 'పరిమితి లేదు';

  @override
  String get adminActivityJustNow => 'ఇప్పుడే';

  @override
  String get adminActivityLastHour => 'చివరి గంట';

  @override
  String get adminActivityToday => 'ఈరోజు';

  @override
  String get adminActivityYesterday => 'నిన్న';

  @override
  String get adminActivityOlder => 'పాతది';

  @override
  String adminActivityDaysAgo(int days) {
    return '$daysరో క్రితం';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hoursగం క్రితం';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutesని క్రితం';
  }

  @override
  String get adminActivityNow => 'ఇప్పుడు';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutesని';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hoursగం';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$daysరో';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'సీక్ ప్రివ్యూ థంబ్‌నెయిల్‌ల కోసం Trickplay ఇమేజ్ ఉత్పత్తిని కాన్ఫిగర్ చేయండి.';

  @override
  String get adminNetworkingPublicHttpsPort => 'పబ్లిక్ HTTPS పోర్ట్';

  @override
  String get adminNetworkingBaseUrl => 'బేస్ URL';

  @override
  String get adminNetworkingBaseUrlHint => 'ఉదా. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'పబ్లిక్ HTTP పోర్ట్';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS అవసరం';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'అన్ని రిమోట్ అభ్యర్థనలను HTTPSకి రీడైరెక్ట్ చేస్తుంది. సర్వర్‌కు చెల్లుబాటు అయ్యే సర్టిఫికేట్ లేకపోతే ప్రభావం ఉండదు.';

  @override
  String get adminNetworkingCertPassword => 'సర్టిఫికేట్ పాస్‌వర్డ్';

  @override
  String get adminNetworkingIpSettings => 'IP సెట్టింగ్‌లు';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4ను ప్రారంభించండి';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6ను ప్రారంభించండి';

  @override
  String get adminNetworkingAutoDiscovery =>
      'స్వయంచాలక పోర్ట్ మ్యాపింగ్‌ను ప్రారంభించండి';

  @override
  String get adminNetworkingLocalSubnets => 'LAN నెట్‌వర్క్‌లు';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'స్థానిక నెట్‌వర్క్‌లో ఉన్నట్లుగా పరిగణించే IP చిరునామాలు లేదా CIDR సబ్‌నెట్‌ల జాబితా, కామా లేదా లైన్ ద్వారా వేరు చేయబడింది.';

  @override
  String get adminNetworkingPublishedUris => 'ప్రచురించిన సర్వర్ URIలు';

  @override
  String get adminNetworkingPublishedUriHint =>
      'సబ్‌నెట్ లేదా చిరునామాను ప్రచురించిన URLకి మ్యాప్ చేయండి, ఉదా. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'సర్టిఫికేట్ మార్గం';

  @override
  String get adminNetworkingRemoteIpFilter => 'రిమోట్ IP ఫిల్టర్';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'రిమోట్ IP ఫిల్టర్';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API పరికరం';

  @override
  String get adminPlaybackAutomatic => '0 = ఆటోమేటిక్';

  @override
  String get adminPlaybackTranscodeTempPath => 'ట్రాన్స్‌కోడింగ్ టెంప్ పాత్';

  @override
  String get adminPlaybackSegmentDeletion => 'సెగ్మెంట్ తొలగింపును అనుమతించండి';

  @override
  String get adminPlaybackSegmentKeep => 'సెగ్మెంట్ కీప్ (సెకన్లు)';

  @override
  String get adminPlaybackThrottleBuffering => 'థొరెటల్ బఫరింగ్';

  @override
  String get adminPlaybackThrottleDelay => 'థ్రొటిల్ ఆలస్యం (సెకన్లు)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'వెంటనే సబ్‌టైటిల్ వెలికితీతను అనుమతించండి';

  @override
  String get adminResumeMinPct => 'కనిష్ట రెజ్యూమ్ శాతం';

  @override
  String get adminResumeMinPctSubtitle =>
      'ప్రోగ్రెస్‌ని ఆదా చేయడానికి ఈ శాతాన్ని దాటి కంటెంట్ ప్లే చేయాలి';

  @override
  String get adminResumeMaxPct => 'గరిష్ట రెజ్యూమ్ శాతం';

  @override
  String get adminResumeMaxPctSubtitle =>
      'ఈ శాతం తర్వాత కంటెంట్ పూర్తిగా ప్లే చేయబడినట్లు పరిగణించబడుతుంది';

  @override
  String get adminResumeMinDuration => 'కనీస రెజ్యూమ్ వ్యవధి (సెకన్లు)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'దీని కంటే చిన్న వస్తువులు పునఃప్రారంభించబడవు';

  @override
  String get adminTrickplayScanBehavior => 'ప్రవర్తనను స్కాన్ చేయండి';

  @override
  String get adminTrickplayProcessPriority => 'ప్రాసెస్ ప్రాధాన్యత';

  @override
  String get adminTrickplayTileWidth => 'టైల్ వెడల్పు';

  @override
  String get adminTrickplayTileHeight => 'టైల్ ఎత్తు';

  @override
  String get adminTrickplayProcessThreads => 'థ్రెడ్లను ప్రాసెస్ చేయండి';

  @override
  String get adminTrickplayWidthResolutions => 'వెడల్పు తీర్మానాలు';

  @override
  String get adminMetadataDefault => 'డిఫాల్ట్';

  @override
  String get adminMetadataContentTypeUpdated => 'కంటెంట్ రకం నవీకరించబడింది';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'కంటెంట్ రకాన్ని అప్‌డేట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'స్లో రెస్పాన్స్ థ్రెషోల్డ్ (మిసె)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'నెమ్మది ప్రతిస్పందన హెచ్చరికలను ప్రారంభించండి';

  @override
  String get adminGeneralQuickConnect => 'Quick Connectను ప్రారంభించండి';

  @override
  String get adminGeneralSectionServer => 'సర్వర్';

  @override
  String get adminGeneralSectionMetadata => 'మెటాడేటా';

  @override
  String get adminGeneralSectionPaths => 'పాత్‌లు';

  @override
  String get adminGeneralSectionPerformance => 'పనితీరు';

  @override
  String get adminGeneralCachePath => 'కాష్ మార్గం';

  @override
  String get adminGeneralMetadataPath => 'మెటాడేటా మార్గం';

  @override
  String get adminGeneralServerName => 'సర్వర్ పేరు';

  @override
  String get adminGeneralDisplayLanguage => 'ప్రాధాన్య డిస్‌ప్లే భాష';

  @override
  String get adminSettingsLoadFailed => 'సెట్టింగ్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get adminDiscover => 'కనుగొనండి';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'మ్యాపింగ్‌లను అప్‌డేట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'సమయ పరిమితి: $duration';
  }

  @override
  String get folders => 'ఫోల్డర్లు';

  @override
  String get libraries => 'లైబ్రరీలు';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay నిలిపివేయబడింది';

  @override
  String get syncPlayDisabledMessage =>
      'సమకాలీకరించబడిన ప్లేబ్యాక్‌ని ఉపయోగించడానికి సెట్టింగ్‌లలో SyncPlayని ప్రారంభించండి.';

  @override
  String get syncPlayServerUnsupportedTitle => 'సర్వర్‌కు మద్దతు లేదు';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlayకి Jellyfin సర్వర్ అవసరం. ప్రస్తుత సర్వర్ దీనికి మద్దతు ఇవ్వదు.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay గ్రూప్';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay సమూహం';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# పాల్గొనేవారు',
      one: '# పాల్గొనేవారు',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'వేచి ఉండడాన్ని విస్మరించండి';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'ఈ పరికరం బఫర్ అవుతున్నప్పుడు సమూహాన్ని పట్టుకోవద్దు';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'నెమ్మదిగా సభ్యుల కోసం వేచి ఉండకుండా స్థానికంగా కొనసాగించండి';

  @override
  String get syncPlayRepeat => 'పునరావృతం చేయండి';

  @override
  String get syncPlayRepeatOne => 'ఒకటి';

  @override
  String get syncPlayShuffleModeShuffled => 'షఫుల్ చేయబడింది';

  @override
  String get syncPlayShuffleModeSorted => 'క్రమబద్ధీకరించబడింది';

  @override
  String get syncPlaySyncCurrentQueue =>
      'ప్రస్తుత ప్లేబ్యాక్ క్యూను సమకాలీకరించండి';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'సమూహ క్యూను స్థానికంగా ప్లే చేస్తున్న వాటితో భర్తీ చేయండి';

  @override
  String get syncPlayLeaveGroup => 'సమూహం నుండి నిష్క్రమించండి';

  @override
  String get syncPlayGroupQueue => 'సమూహం క్యూ';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'అంశం $index';
  }

  @override
  String get syncPlayPlayNow => 'ఇప్పుడే ఆడండి';

  @override
  String get syncPlayCreateNewGroup => 'కొత్త సమూహాన్ని సృష్టించండి';

  @override
  String get syncPlayGroupName => 'సమూహం పేరు';

  @override
  String get syncPlayDefaultGroupName => 'నా SyncPlay సమూహం';

  @override
  String get syncPlayCreateGroup => 'సమూహాన్ని సృష్టించండి';

  @override
  String get syncPlayAvailableGroups => 'అందుబాటులో ఉన్న సమూహాలు';

  @override
  String get syncPlayNoGroupsAvailable => 'సమూహాలు అందుబాటులో లేవు';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay సమూహంలో చేరాలా?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay సమూహంలో చేరడం వలన మీ ప్రస్తుత ప్లేబ్యాక్ క్యూను భర్తీ చేయవచ్చు. కొనసాగించాలా?';

  @override
  String get syncPlayJoin => 'చేరండి';

  @override
  String get syncPlayStateIdle => 'పనిలేకుండా';

  @override
  String get syncPlayStateWaiting => 'వేచి ఉంది';

  @override
  String get syncPlayStatePaused => 'పాజ్ చేయబడింది';

  @override
  String get syncPlayStatePlaying => 'ఆడుతున్నారు';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay గ్రూప్‌లో చేరారు';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay గ్రూప్ నుండి నిష్క్రమించారు';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay యాక్సెస్ నిరాకరించబడింది';

  @override
  String get syncPlayAccessDeniedMessage =>
      'ఈ SyncPlay సమూహంలోని ఒకటి లేదా అంతకంటే ఎక్కువ అంశాలకు మీకు యాక్సెస్ లేదు. లైబ్రరీ అనుమతులను ధృవీకరించమని లేదా వేరొక వరుసను ఎంచుకోమని గుంపు యజమానిని అడగండి.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupNameకి ప్లేబ్యాక్‌ను సింక్ చేస్తోంది';
  }

  @override
  String get voiceSearchUnavailable => 'వాయిస్ శోధన అందుబాటులో లేదు.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision డైరెక్ట్ ప్లే విఫలమైంది';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'ఈ Dolby Vision స్ట్రీమ్ కోసం డైరెక్ట్ ప్లే ప్రారంభించడంలో విఫలమైంది. సర్వర్ ట్రాన్స్‌కోడ్‌ని ఉపయోగించి మళ్లీ ప్రయత్నించాలా?';

  @override
  String get retryWithTranscode => 'ట్రాన్స్‌కోడ్‌తో మళ్లీ ప్రయత్నించండి';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision మద్దతు లేదు';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'ఈ పరికరం నేరుగా Dolby Vision కంటెంట్‌ని డీకోడ్ చేయలేదు. HDR10 ఫాల్‌బ్యాక్‌ని ఉపయోగించండి లేదా సర్వర్ ట్రాన్స్‌కోడింగ్‌ను అభ్యర్థించండి.';

  @override
  String get rememberMyChoice => 'నా ఎంపికను గుర్తుంచుకో';

  @override
  String get playHdr10Fallback => 'HDR10 ఫాల్‌బ్యాక్‌ని ప్లే చేయండి';

  @override
  String get requestTranscode => 'ట్రాన్స్‌కోడ్‌ని అభ్యర్థించండి';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# వరుసలు కనుగొనబడ్డాయి',
      one: '# వరుస కనుగొనబడింది',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'అన్నీ చూడండి';

  @override
  String get noItems => 'అంశాలు లేవు';

  @override
  String get switchUser => 'వినియోగదారుని మార్చండి';

  @override
  String get remoteControl => 'రిమోట్ కంట్రోల్';

  @override
  String get mediaBarLoading => 'మీడియా బార్ లోడ్ అవుతోంది...';

  @override
  String get mediaBarError => 'మీడియా బార్ లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get offlineServerUnavailable =>
      'ఇంటర్నెట్‌కి కనెక్ట్ చేయబడింది, కానీ ప్రస్తుత సర్వర్ అందుబాటులో లేదు.';

  @override
  String get offlineNoInternet =>
      'మీరు ఆఫ్‌లైన్‌లో ఉన్నారు. డౌన్‌లోడ్ చేసిన కంటెంట్ మాత్రమే అందుబాటులో ఉంది.';

  @override
  String get offlineFileNotAvailable => 'ఫైల్ అందుబాటులో లేదు';

  @override
  String get offlineSwitchServer => 'సర్వర్ మారండి';

  @override
  String get offlineSavedMedia => 'సేవ్ చేయబడిన మీడియా';

  @override
  String get offlineBannerTitle => 'మీరు ఆఫ్‌లైన్‌లో ఉన్నారు';

  @override
  String get offlineBannerSubtitle => 'మీ డౌన్‌లోడ్‌లను చూపుతోంది';

  @override
  String get offlineBannerAction => 'డౌన్‌లోడ్‌లు';

  @override
  String get serverUnreachableBannerTitle => 'మీ సర్వర్‌ను చేరుకోలేకపోతోంది';

  @override
  String get serverUnreachableBannerSubtitle =>
      'అది తిరిగి వచ్చే వరకు డౌన్‌లోడ్‌ల నుండి ప్లే చేస్తోంది';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'రిమోట్ ప్లేబ్యాక్';

  @override
  String castControlFailed(String error) {
    return 'కాస్ట్ నియంత్రణ విఫలమైంది: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind నియంత్రణలు';
  }

  @override
  String get castDeviceVolume => 'పరికర వాల్యూమ్';

  @override
  String get castVolumeUnavailable => 'అందుబాటులో లేదు';

  @override
  String castStopKind(String kind) {
    return '$kindని ఆపండి';
  }

  @override
  String get audioLabel => 'ఆడియో';

  @override
  String get subtitlesLabel => 'ఉపశీర్షికలు';

  @override
  String get pinConfirmTitle => 'PINని నిర్ధారించండి';

  @override
  String get pinSetTitle => 'PINని సెట్ చేయండి';

  @override
  String get pinEnterTitle => 'PINని నమోదు చేయండి';

  @override
  String get pinReenterToConfirm =>
      'నిర్ధారించడానికి మీ PINని మళ్లీ నమోదు చేయండి';

  @override
  String pinEnterNDigit(int length) {
    return '$length-అంకెల PINను నమోదు చేయండి';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'మీ $length-అంకెల PINను నమోదు చేయండి';
  }

  @override
  String get pinIncorrect => 'తప్పు పిన్';

  @override
  String get pinMismatch => 'పిన్‌లు సరిపోలడం లేదు';

  @override
  String get pinForgot => 'పిన్ మర్చిపోయారా?';

  @override
  String get pinClear => 'క్లియర్ చేయండి';

  @override
  String get pinBackspace => 'బ్యాక్‌స్పేస్';

  @override
  String get quickConnectAuthorized =>
      'Quick Connect అభ్యర్థన అధీకృతం చేయబడింది.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect కోడ్ చెల్లదు లేదా గడువు ముగిసింది.';

  @override
  String get quickConnectNotSupported =>
      'ఈ సర్వర్‌లో Quick Connectకు మద్దతు లేదు.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect కోడ్‌ను అధీకృతం చేయడం విఫలమైంది.';

  @override
  String get quickConnectDisabled =>
      'ఈ సర్వర్‌లో Quick Connect నిలిపివేయబడింది.';

  @override
  String get quickConnectForbidden =>
      'మీ ఖాతా ఈ Quick Connect అభ్యర్థనను అధీకృతం చేయలేదు.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect కోడ్ కనుగొనబడలేదు. కొత్త కోడ్‌ను ప్రయత్నించండి.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect విఫలమైంది: $message';
  }

  @override
  String get quickConnectEnterCode => 'కోడ్‌ని నమోదు చేయండి';

  @override
  String get quickConnectAuthorize => 'అధికారం ఇవ్వండి';

  @override
  String remoteCommandFailed(String error) {
    return 'కమాండ్ విఫలమైంది: $error';
  }

  @override
  String get remoteControlTitle => 'రిమోట్ కంట్రోల్';

  @override
  String get remoteFailedToLoadSessions => 'సెషన్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get remoteNoSessions => 'నియంత్రించదగిన సెషన్‌లు లేవు';

  @override
  String get remoteStartPlayback => 'మరొక పరికరంలో ప్లేబ్యాక్ ప్రారంభించండి';

  @override
  String get unknownUser => 'తెలియదు';

  @override
  String get unknownItem => 'తెలియదు';

  @override
  String get remoteNothingPlaying => 'ఈ సెషన్‌లో ఏదీ ప్లే కావడం లేదు';

  @override
  String get castingStarted => 'ఎంచుకున్న పరికరంలో ప్రసారం ప్రారంభించబడింది';

  @override
  String castingFailed(String error) {
    return 'కాస్టింగ్‌ను ప్రారంభించడం విఫలమైంది: $error';
  }

  @override
  String get noRemoteDevices => 'రిమోట్ ప్లేబ్యాక్ పరికరాలు అందుబాటులో లేవు.';

  @override
  String get noRemoteDevicesIos =>
      'రిమోట్ ప్లేబ్యాక్ పరికరాలు అందుబాటులో లేవు.\n\niOSలో, సిమ్యులేటర్‌లో AirPlay లక్ష్యాలు అందుబాటులో ఉండకపోవచ్చు.';

  @override
  String get trackActionPlayNext => 'తదుపరి ప్లే చేయండి';

  @override
  String get trackActionAddToQueue => 'క్యూకి జోడించండి';

  @override
  String get trackActionAddToPlaylist => 'ప్లేజాబితాకు జోడించండి';

  @override
  String get trackActionCancelDownload => 'డౌన్‌లోడ్ రద్దు చేయండి';

  @override
  String get trackActionDeleteFromPlaylist => 'ప్లేజాబితా నుండి తొలగించండి';

  @override
  String get trackActionMoveUp => 'పైకి తరలించు';

  @override
  String get trackActionMoveDown => 'క్రిందికి తరలించు';

  @override
  String get trackActionRemoveFromFavorites => 'ఇష్టమైన వాటి నుండి తీసివేయండి';

  @override
  String get trackActionAddToFavorites => 'ఇష్టమైన వాటికి జోడించండి';

  @override
  String get trackActionGoToAlbum => 'ఆల్బమ్‌కి వెళ్లండి';

  @override
  String get trackActionGoToArtist => 'ఆర్టిస్ట్‌కి వెళ్లండి';

  @override
  String trackActionDownloading(String name) {
    return '$name డౌన్‌లోడ్ అవుతోంది...';
  }

  @override
  String get trackActionDeletedFile => 'డౌన్‌లోడ్ చేసిన ఫైల్ తొలగించబడింది';

  @override
  String get trackActionDeleteFileFailed =>
      'డౌన్‌లోడ్ చేసిన ఫైల్‌ను తొలగించడం సాధ్యపడలేదు';

  @override
  String get shuffleBy => 'షఫుల్ ద్వారా';

  @override
  String get shuffleSelectLibrary => 'లైబ్రరీని ఎంచుకోండి';

  @override
  String get shuffleSelectGenre => 'జానర్‌ని ఎంచుకోండి';

  @override
  String get shuffleLibrary => 'లైబ్రరీ';

  @override
  String get shuffleGenre => 'శైలి';

  @override
  String get shuffleNoLibraries => 'అనుకూల లైబ్రరీలు అందుబాటులో లేవు.';

  @override
  String get shuffleNoGenres => 'ఈ షఫుల్ మోడ్ కోసం శైలులు ఏవీ కనుగొనబడలేదు.';

  @override
  String get posterDisplayTitle => 'ప్రదర్శించు';

  @override
  String get posterImageType => 'చిత్రం రకం';

  @override
  String get imageTypePoster => 'పోస్టర్';

  @override
  String get imageTypeThumbnail => 'సూక్ష్మచిత్రం';

  @override
  String get imageTypeBanner => 'బ్యానర్';

  @override
  String get playlistAddFailed => 'ప్లేజాబితాకు జోడించడంలో విఫలమైంది';

  @override
  String get playlistCreateFailed => 'ప్లేజాబితాను సృష్టించడం విఫలమైంది';

  @override
  String get playlistNew => 'కొత్త ప్లేజాబితా';

  @override
  String get playlistCreate => 'సృష్టించు';

  @override
  String get playlistCreateNew => 'కొత్త ప్లేజాబితాని సృష్టించండి';

  @override
  String get playlistNoneFound => 'ప్లేజాబితాలు ఏవీ కనుగొనబడలేదు';

  @override
  String get addToPlaylist => 'ప్లేజాబితాకు జోడించండి';

  @override
  String get lyricsNotAvailable => 'సాహిత్యం అందుబాటులో లేదు';

  @override
  String get upNext => 'తదుపరి';

  @override
  String get playNext => 'తదుపరి ప్లే చేయండి';

  @override
  String get stillWatchingContent =>
      'ప్లేబ్యాక్ పాజ్ చేయబడింది. మీరు ఇంకా చూస్తున్నారా?';

  @override
  String get stillWatchingStop => 'ఆపండి';

  @override
  String get stillWatchingContinue => 'కొనసాగించు';

  @override
  String skipSegment(String segment) {
    return '$segmentను దాటవేయండి';
  }

  @override
  String get liveTv => 'ప్రత్యక్ష TV';

  @override
  String get continueWatchingAndNextUp => 'చూడటం కొనసాగించు & తదుపరి';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$current/$total డౌన్‌లోడ్ అవుతోంది — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName డౌన్‌లోడ్ అవుతోంది';
  }

  @override
  String get nextEpisode => 'తదుపరి ఎపిసోడ్';

  @override
  String get moreFromThisSeason => 'ఈ సీజన్ నుండి మరిన్ని';

  @override
  String get playerTooltipPlaybackSpeed => 'ప్లేబ్యాక్ వేగం';

  @override
  String get playerTooltipCastControls => 'తారాగణం నియంత్రణలు';

  @override
  String get playerTooltipPlaybackQuality => 'బిట్రేట్';

  @override
  String get playerTooltipEnterFullscreen =>
      'పూర్తి స్క్రీన్‌లోకి ప్రవేశించండి';

  @override
  String get playerTooltipExitFullscreen =>
      'పూర్తి స్క్రీన్ నుండి నిష్క్రమించండి';

  @override
  String get playerTooltipFloatOnTop => 'పైన తేలుతుంది';

  @override
  String get playerTooltipExitFloatOnTop => 'పైన ఫ్లోట్‌ను నిలిపివేయండి';

  @override
  String get playerTooltipLockLandscape => 'ప్రకృతి దృశ్యాన్ని లాక్ చేయండి';

  @override
  String get playerTooltipUnlockOrientation => 'భ్రమణాన్ని అనుమతించండి';

  @override
  String get playerTooltipPrevious => 'మునుపటి';

  @override
  String get playerTooltipSeekBack => 'వెనక్కు వెతకండి';

  @override
  String get playerTooltipSeekForward => 'ముందుకు వెతుకుము';

  @override
  String get contextMenuMarkWatched => 'వీక్షించినట్లు గుర్తు పెట్టండి';

  @override
  String get contextMenuMarkUnwatched => 'చూడనివిగా గుర్తించండి';

  @override
  String get contextMenuAddToFavorites => 'ఇష్టమైన వాటికి జోడించండి';

  @override
  String get contextMenuRemoveFromFavorites => 'ఇష్టమైన వాటి నుండి తీసివేయండి';

  @override
  String get contextMenuGoToSeries => 'సిరీస్‌కి వెళ్లండి';

  @override
  String get contextMenuHideFromContinueWatching =>
      'చూడటం కొనసాగించండి నుండి దాచండి';

  @override
  String get contextMenuHideFromNextUp => 'తదుపరి నుండి దాచండి';

  @override
  String get contextMenuAddToCollection => 'సేకరణకు జోడించండి';

  @override
  String get settingsAdministrationSubtitle =>
      'సర్వర్ అడ్మినిస్ట్రేషన్ ప్యానెల్‌ను యాక్సెస్ చేయండి';

  @override
  String get settingsAccountSecurity => 'ఖాతా & భద్రత';

  @override
  String get settingsAccountSecuritySubtitle =>
      'ప్రమాణీకరణ, పిన్ కోడ్ మరియు తల్లిదండ్రుల నియంత్రణలు';

  @override
  String get settingsPersonalization => 'వ్యక్తిగతీకరణ';

  @override
  String get settingsPersonalizationSubtitle =>
      'థీమ్, నావిగేషన్, ఇంటి అడ్డు వరుసలు మరియు లైబ్రరీ విజిబిలిటీ';

  @override
  String get settingsDynamicContent => 'డైనమిక్ కంటెంట్';

  @override
  String get settingsDynamicContentSubtitle =>
      'మీడియా బార్ మరియు విజువల్ ఓవర్‌లేలు';

  @override
  String get settingsPlaybackSyncplay => 'ప్లేబ్యాక్ & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'ఆడియో/వీడియో సెట్టింగ్‌లు, ఉపశీర్షికలు, డౌన్‌లోడ్‌లు మరియు SyncPlay నియంత్రణలు';

  @override
  String get settingsIntegrationsSubtitle =>
      'ప్లగిన్ సింక్, Seerr, రేటింగ్‌లు మరియు మరిన్ని';

  @override
  String get settingsAboutSubtitle =>
      'యాప్ వెర్షన్, చట్టపరమైన సమాచారం మరియు క్రెడిట్‌లు';

  @override
  String get settingsAuthenticationSection => 'ప్రమాణీకరణ';

  @override
  String get settingsSortServersBy => 'సర్వర్‌లను క్రమబద్ధీకరించండి';

  @override
  String get settingsLastUsed => 'చివరిగా ఉపయోగించబడింది';

  @override
  String get settingsAlphabetical => 'అక్షరక్రమం';

  @override
  String get settingsConnectionSection => 'కనెక్షన్';

  @override
  String get settingsAllowSelfSignedCerts =>
      'సెల్ఫ్-సైన్డ్ సర్టిఫికేట్‌లను అనుమతించండి';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'సెల్ఫ్-సైన్డ్ లేదా ప్రైవేట్-CA TLS సర్టిఫికేట్‌లను ఉపయోగించే సర్వర్‌లను విశ్వసించండి. మీరు నియంత్రించే సర్వర్‌లకు మాత్రమే ప్రారంభించండి. ఇది అన్ని కనెక్షన్‌లకు సర్టిఫికేట్ ధ్రువీకరణను నిలిపివేస్తుంది.';

  @override
  String get settingsPrivacyAndSafetySection => 'గోప్యత & భద్రత';

  @override
  String get settingsBlockedRatings => 'బ్లాక్ చేయబడిన రేటింగ్‌లు';

  @override
  String get settingsGeneralStyle => 'సాధారణ శైలి';

  @override
  String get settingsGeneralStyleSubtitle =>
      'థీమ్ స్వరాలు, బ్యాక్‌డ్రాప్‌లు, వీక్షించిన సూచికలు మరియు థీమ్ సంగీతం';

  @override
  String get settingsDetailsScreen => 'వివరాల స్క్రీన్';

  @override
  String get settingsDetailsScreenSubtitle =>
      'శైలి, నేపథ్య బ్లర్, ట్యాబ్ ప్రవర్తన';

  @override
  String get settingsHomePage => 'హోమ్ పేజీ';

  @override
  String get settingsHomePageSubtitle =>
      'విభాగాలు, చిత్ర రకాలు, అతివ్యాప్తులు మరియు మీడియా ప్రివ్యూలు';

  @override
  String get settingsLibrariesSubtitle =>
      'లైబ్రరీ దృశ్యమానత, ఫోల్డర్ వీక్షణ మరియు బహుళ-సర్వర్ ప్రవర్తన';

  @override
  String get settingsTwentyFourHourClock => '24-గంటల గడియారం';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'గడియారం ఎక్కడ చూపబడుతుందో అక్కడ 24-గంటల సమయ ఫార్మాటింగ్‌ని ఉపయోగించండి';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'నావిగేషన్ బార్‌లో షఫుల్ బటన్‌ను చూపండి';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'నావిగేషన్ బార్‌లో కళా ప్రక్రియల బటన్‌ను చూపండి';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'నావిగేషన్ బార్‌లో ఇష్టమైనవి బటన్‌ను చూపండి';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'నావిగేషన్ బార్‌లో లైబ్రరీల బటన్‌ను చూపండి';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'నావిగేషన్ బార్‌లో Seerr బటన్‌ను చూపించండి';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'టాప్ నావిగేషన్ బార్‌లో టెక్స్ట్ లేబుల్‌లను ఎల్లప్పుడూ చూపించండి';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'లైబ్రరీకి హోమ్ పేజీ విజిబిలిటీని టోగుల్ చేయండి. మార్పులు అమలులోకి రావడానికి Moonfinని పునఃప్రారంభించండి.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'మీడియా బార్ & స్థానిక ప్రివ్యూలు';

  @override
  String get settingsVisualOverlays => 'విజువల్ ఓవర్లేస్';

  @override
  String get settingsSeasonalSurprise => 'కాలానుగుణ ఆశ్చర్యం';

  @override
  String get settingsMetadataAndRatings => 'మెటాడేటా & రేటింగ్‌లు';

  @override
  String get settingsPluginScreenDescription =>
      'అదనపు రేటింగ్ మూలాలు, Seerr అభ్యర్థనలు, సింక్ చేసిన ప్రాధాన్యతలతో సహా సర్వర్-వైపు ఇంటిగ్రేషన్‌లను Moonbase శక్తివంతం చేస్తుంది.';

  @override
  String get settingsOfflineDownloads => 'ఆఫ్‌లైన్ డౌన్‌లోడ్‌లు';

  @override
  String get settingsHigh => 'అధిక';

  @override
  String get settingsLow => 'తక్కువ';

  @override
  String get settingsCustomPath => 'అనుకూల మార్గం';

  @override
  String get settingsEnterDownloadFolderPath =>
      'డౌన్‌లోడ్ ఫోల్డర్ మార్గాన్ని నమోదు చేయండి';

  @override
  String get settingsConcurrentDownloads => 'ఏకకాల డౌన్‌లోడ్‌లు';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'ఒకేసారి డౌన్‌లోడ్ చేయడానికి గరిష్ట సంఖ్యలో ఐటెమ్‌లు.';

  @override
  String get settingsAppInfo => 'యాప్ సమాచారం';

  @override
  String get settingsReportAnIssue => 'ఒక సమస్యను నివేదించండి';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHubలో ఇష్యూ ట్రాకర్‌ని తెరవండి';

  @override
  String get settingsJoinDiscord => 'Discordలో చేరండి';

  @override
  String get settingsJoinDiscordSubtitle => 'సంఘంతో చాట్ చేయండి';

  @override
  String get settingsJoinTheDiscord => 'Discordలో చేరండి';

  @override
  String get settingsSupportMoonfin => 'మద్దతు Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'డెవలపర్‌కు ఒక కాఫీని దానం చేయండి';

  @override
  String get settingsLegal => 'చట్టపరమైన';

  @override
  String get settingsLicenses => 'లైసెన్స్‌లు';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'ఓపెన్ సోర్స్ లైసెన్స్ నోటీసులు';

  @override
  String get settingsPrivacyPolicy => 'గోప్యతా విధానం';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin మీ డేటాను ఎలా నిర్వహిస్తుంది';

  @override
  String get settingsCheckForUpdates => 'నవీకరణల కోసం తనిఖీ చేయండి';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'తాజా Moonfin విడుదల కోసం తనిఖీ చేయండి';

  @override
  String get settingsPoweredByFlutter => 'Flutter ద్వారా ఆధారితం';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# లైసెన్స్ నోటీసులు',
      one: '# లైసెన్స్ నోటీసు',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'రెండూ';

  @override
  String get settingsShuffleContentTypeFilter => 'షఫుల్ కంటెంట్ టైప్ ఫిల్టర్';

  @override
  String get settingsVideoPlaybackPreferences =>
      'వీడియో ప్లేబ్యాక్ ప్రాధాన్యతలు';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'కోర్ వీడియో ఇంజిన్ మరియు స్ట్రీమింగ్ నాణ్యత సెట్టింగ్‌లు';

  @override
  String get settingsAudioPreferences => 'ఆడియో ప్రాధాన్యతలు';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'ఆడియో ట్రాక్‌లు, ప్రాసెసింగ్ మరియు పాస్‌త్రూ ఎంపికలు';

  @override
  String get settingsAutomationAndQueue => 'ఆటోమేషన్ & క్యూ';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'స్వయంచాలక ప్లేబ్యాక్ మరియు సీక్వెన్సింగ్';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'డౌన్‌లోడ్ నాణ్యత, నిల్వ పరిమితులు మరియు క్యూ పరిమాణం';

  @override
  String get settingsSyncplaySubtitle =>
      'సమూహ సెషన్‌ల కోసం సింక్రొనైజేషన్ లాజిక్';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'ప్రత్యేక ప్లేయర్ ఫీచర్లు. కొన్ని ఎంపికలు ప్లేబ్యాక్ సమస్యలను కలిగించవచ్చు కాబట్టి జాగ్రత్తగా ఉపయోగించండి';

  @override
  String get settingsSkipIntrosAndOutros =>
      'పరిచయాలు మరియు అవుట్‌రోలను దాటవేయాలా?';

  @override
  String get settingsMediaSegmentCountdown => 'మీడియా సెగ్మెంట్ కౌంట్‌డౌన్';

  @override
  String get settingsProgressBar => 'ప్రోగ్రెస్ బార్';

  @override
  String get settingsTimer => 'టైమర్';

  @override
  String get settingsNone => 'ఏదీ లేదు';

  @override
  String get settingsPromptUser => 'ప్రాంప్ట్ యూజర్';

  @override
  String get settingsSkip => 'దాటవేయి';

  @override
  String get settingsDoNothing => 'ఏమీ చేయవద్దు';

  @override
  String get settingsMaxBitrateDescription =>
      'స్ట్రీమింగ్ బిట్‌రేట్‌ను క్యాప్ చేయండి. ఈ థ్రెషోల్డ్ పైన ఉన్న కంటెంట్ సరిపోయేలా ట్రాన్స్‌కోడ్ చేయబడుతుంది.';

  @override
  String get settingsMaxResolutionDescription =>
      'ప్లేయర్ అభ్యర్థించే గరిష్ట రిజల్యూషన్‌ను పరిమితం చేయండి. అధిక-రిజల్యూషన్ కంటెంట్ ట్రాన్స్‌కోడ్ డౌన్ చేయబడుతుంది.';

  @override
  String get settingsPlayerZoomDescription =>
      'స్క్రీన్‌కు సరిపోయేలా వీడియోను ఎలా స్కేల్ చేయాలి.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'ప్లేబ్యాక్ ఇంజిన్ (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV పరికరాలలో డిఫాల్ట్ ప్లేబ్యాక్ ఇంజిన్‌ను ఎంచుకోండి. తదుపరి ప్లేబ్యాక్ సెషన్‌కు మార్పులు వర్తిస్తాయి.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (సిఫార్సు చేయబడింది)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (లెగసీ)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (లెగసీ)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (సిఫార్సు చేయబడింది)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision ఫాల్‌బ్యాక్';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision డీకోడింగ్ లేకుండా పరికరాలలో Dolby Vision శీర్షికల కోసం ప్రవర్తన.';

  @override
  String get settingsAskEachTime => 'ప్రతిసారీ అడగండి';

  @override
  String get settingsPreferHdr10Fallback =>
      'HDR10 ఫాల్‌బ్యాక్‌కు ప్రాధాన్యత ఇవ్వండి';

  @override
  String get settingsPreferServerTranscode =>
      'సర్వర్ ట్రాన్స్‌కోడ్‌కు ప్రాధాన్యత ఇవ్వండి';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision ప్రొఫైల్ 7 డైరెక్ట్ ప్లే';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision ప్రొఫైల్ 7 మెరుగుదల-లేయర్ స్ట్రీమ్‌లు డైరెక్ట్ ప్లే చేయాలా వద్దా అనేది నియంత్రిస్తుంది.';

  @override
  String get settingsAutoAftkrtEnabled => 'ఆటో (AFTKRT ప్రారంభించబడింది)';

  @override
  String get settingsEnabledOnThisDevice => 'ఈ పరికరంలో ప్రారంభించబడింది';

  @override
  String get settingsDisabledPreferTranscode =>
      'డిసేబుల్ చేయబడింది (ట్రాన్స్‌కోడ్‌కు ప్రాధాన్యత ఇవ్వండి)';

  @override
  String get settingsResumeRewindDescription =>
      'ప్లేబ్యాక్‌ని పునఃప్రారంభిస్తున్నప్పుడు (చూడడం కొనసాగించు లేదా మీడియా ఐటెమ్ పేజీ నుండి), ఎన్ని సెకన్లు రీవైండ్ చేయాలి?';

  @override
  String get settingsUnpauseRewindDescription =>
      'పాజ్ బటన్‌ను నొక్కిన తర్వాత ప్లేబ్యాక్‌ని పునఃప్రారంభిస్తున్నప్పుడు, ఎన్ని సెకన్లు రీవైండ్ చేయాలి?';

  @override
  String get settingsSkipBackLengthDescription =>
      'రివైండ్ బటన్‌ను నొక్కిన తర్వాత ఎన్ని సెకన్లు వెనక్కి దూకాలి.';

  @override
  String get settingsOneSecond => '1 సెకను';

  @override
  String get settingsThreeSeconds => '3 సెకన్లు';

  @override
  String get settingsFortyFiveSeconds => '45 సెకన్లు';

  @override
  String get settingsSixtySeconds => '60 సెకన్లు';

  @override
  String get settingsSkipForwardLengthDescription =>
      'ఫాస్ట్ ఫార్వర్డ్ బటన్‌ను నొక్కిన తర్వాత ఎన్ని సెకన్లు ముందుకు దూకాలి.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'బాహ్య డీకోడర్‌కు బిట్‌స్ట్రీమ్ AC3';

  @override
  String get settingsCinemaMode => 'సినిమా మోడ్';

  @override
  String get settingsCinemaModeSubtitle =>
      'ప్రధాన ఫీచర్‌కు ముందు ట్రైలర్‌లు/ప్రీరోల్‌లను ప్లే చేయండి';

  @override
  String get settingsNextUpDisplayDescription =>
      'ఎపిసోడ్ ఆర్ట్‌వర్క్ మరియు వివరణతో కూడిన పూర్తి కార్డ్‌ని ఎక్స్‌టెండెడ్ చూపుతుంది. మినిమల్ కాంపాక్ట్ కౌంట్‌డౌన్ ఓవర్‌లేని చూపుతుంది. డిసేబుల్ ప్రాంప్ట్‌ను పూర్తిగా దాచిపెడుతుంది.';

  @override
  String get settingsShort => 'పొట్టి';

  @override
  String get settingsLong => 'పొడవు';

  @override
  String get settingsVeryLong => 'చాలా లాంగ్';

  @override
  String get settingsVideoStartDelay => 'వీడియో ప్రారంభం ఆలస్యం';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'ప్రత్యక్ష ప్రసార TV';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'ప్రత్యక్ష ప్రసార టీవీ కోసం నేరుగా ప్లే చేయడాన్ని ప్రారంభించండి';

  @override
  String get settingsOpenGroups => 'గుంపులను తెరవండి';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay సమూహాలను సృష్టించండి, చేరండి లేదా నిర్వహించండి';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay ప్రారంభించబడింది';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'సమూహ వీక్షణ లక్షణాలను ప్రారంభించండి';

  @override
  String get settingsSyncplayButton => 'SyncPlay బటన్';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'నావిగేషన్ బార్‌లో SyncPlay బటన్‌ను చూపండి';

  @override
  String get settingsSyncplayAdvancedCorrection => 'అధునాతన దిద్దుబాటు';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'ఫైన్-గ్రెయిన్డ్ సింక్ లాజిక్‌ని ఎనేబుల్ చేయండి';

  @override
  String get settingsSyncplaySyncCorrection => 'సమకాలీకరణ దిద్దుబాటు';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'సమకాలీకరణలో ఉండటానికి ప్లేబ్యాక్‌ని స్వయంచాలకంగా సర్దుబాటు చేయండి';

  @override
  String get settingsSyncplaySpeedToSync => 'సమకాలీకరణకు వేగం';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'సమకాలీకరించడానికి ప్లేబ్యాక్ వేగం సర్దుబాటుని ఉపయోగించండి';

  @override
  String get settingsSyncplaySkipToSync => 'సమకాలీకరణకు దాటవేయి';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'సమకాలీకరించడానికి సీకింగ్ ఉపయోగించండి';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'కనిష్ట వేగం ఆలస్యం';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'గరిష్ట వేగం ఆలస్యం';

  @override
  String get settingsSyncplaySpeedDuration => 'వేగం వ్యవధి';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'కనిష్ట స్కిప్ ఆలస్యం';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay అదనపు ఆఫ్‌సెట్';

  @override
  String get onNow => 'ఇప్పుడు';

  @override
  String get collections => 'సేకరణలు';

  @override
  String get lastPlayed => 'చివరిగా ఆడింది';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'తాజా $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'ఇటీవల విడుదలైన $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'తదుపరి ఎపిసోడ్‌ను ఆటోప్లే చేయండి';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'అందుబాటులో ఉన్నప్పుడు తదుపరి ఎపిసోడ్‌ని స్వయంచాలకంగా ప్లే చేయండి.';

  @override
  String get skipSilenceTitle => 'నిశ్శబ్దాన్ని దాటవేయి';

  @override
  String get skipSilenceSubtitle =>
      'స్ట్రీమ్ మద్దతు ఇచ్చినప్పుడు స్వయంచాలకంగా నిశ్శబ్ద ఆడియో విభాగాలను దాటవేయండి.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'బాహ్య ఆడియో ప్రభావాలను అనుమతించండి';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Media3 ప్లేబ్యాక్ సెషన్‌లకు జోడించడానికి ఈక్వలైజర్ మరియు ఎఫెక్ట్స్ యాప్‌లను (ఉదా. వేవ్‌లెట్) అనుమతించండి.';

  @override
  String get disableTunnelingTitle => 'టన్నెలింగ్‌ని నిలిపివేయండి';

  @override
  String get disableTunnelingSubtitle =>
      'ఫోర్స్ నాన్-టన్నల్ ప్లేబ్యాక్. టన్నెలింగ్ ఆడియో/వీడియో నిలిపివేతలు ఉన్న పరికరాలలో ఉపయోగకరంగా ఉంటుంది.';

  @override
  String get enableTunnelingTitle => 'టన్నెలింగ్‌ను ప్రారంభించండి';

  @override
  String get enableTunnelingSubtitle =>
      'అధునాతన. ఆడియో మరియు వీడియోను కపుల్డ్ హార్డ్‌వేర్ పాత్ ద్వారా పంపుతుంది. కొన్ని పరికరాల్లో ఆడియో/వీడియో డ్రాప్‌అవుట్‌లను కలిగిస్తుంది కాబట్టి డిఫాల్ట్‌గా ఆఫ్‌లో ఉంటుంది.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision ప్రొఫైల్ 7 నుండి HEVCకి మ్యాప్ చేయండి';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'DV యేతర పరికరాలలో Dolby Vision ప్రొఫైల్ 7 స్ట్రీమ్‌లను HDR10-అనుకూలమైన HEVCగా ప్లే చేయండి.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'పొందుపరిచిన ఉపశీర్షిక శైలులను ఉపయోగించండి';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'ఉపశీర్షిక ట్రాక్‌లో పొందుపరిచిన రంగులు, ఫాంట్‌లు మరియు స్థానాలను వర్తింపజేయండి. బదులుగా మీ శీర్షిక శైలి ప్రాధాన్యతలను ఉపయోగించడాన్ని నిలిపివేయండి.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'పొందుపరిచిన ఉపశీర్షిక ఫాంట్ పరిమాణాలను ఉపయోగించండి';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'ఉపశీర్షిక ట్రాక్‌లో పొందుపరిచిన ఫాంట్-పరిమాణ సూచనలను వర్తింపజేయండి. మీ శైలి ప్రాధాన్యతల నుండి ఉపశీర్షిక పరిమాణాన్ని ఉపయోగించడాన్ని నిలిపివేయండి.';

  @override
  String get showMediaDetailsOnLibraryPage => 'మీడియా వివరాలను చూపించండి';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'లైబ్రరీ పేజీల ఎగువన ఎంచుకున్న అంశం వివరాలను చూపుతుంది.';

  @override
  String get hideBackdropsInLibraries =>
      'బ్రౌజ్ చేస్తున్నప్పుడు బ్యాక్‌డ్రాప్‌లను దాచాలా?';

  @override
  String get useDetailedSubHeadings => 'వివరణాత్మక ఉపశీర్షికలను ఉపయోగించండి';

  @override
  String get useDetailedSubHeadingsDescription =>
      'లైబ్రరీ పేజీలలో వివరణాత్మక లేదా కనిష్ట సబ్‌రోను చూపండి.';

  @override
  String get savedThemesDeleteDialogTitle => 'సేవ్ చేసిన థీమ్‌ను తొలగించాలా?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'ఈ పరికర కాష్ నుండి \"$themeName\"ని తీసివేయాలా?';
  }

  @override
  String get themeStore => 'థీమ్ స్టోర్';

  @override
  String get themeStoreSubtitle => 'కమ్యూనిటీ థీమ్‌లను బ్రౌజ్ చేసి సేవ్ చేయండి';

  @override
  String get themeStoreDescription =>
      'మీ ఇతర సేవ్ చేసిన థీమ్‌ల వలె దాన్ని ఉపయోగించడానికి ఒక థీమ్‌ను సేవ్ చేయండి.';

  @override
  String get themeStoreEmpty => 'ప్రస్తుతం థీమ్‌లు ఏవీ అందుబాటులో లేవు.';

  @override
  String get themeStoreLoadFailed =>
      'థీమ్ స్టోర్‌ను లోడ్ చేయడం సాధ్యపడలేదు. మీ కనెక్షన్‌ను తనిఖీ చేసి మళ్లీ ప్రయత్నించండి.';

  @override
  String get themeStoreSave => 'సేవ్ చేయండి';

  @override
  String get themeStoreSaveAndApply => 'సేవ్ చేసి వర్తింపజేయండి';

  @override
  String get themeStoreSaved => 'సేవ్ చేయబడింది';

  @override
  String get themeStoreInvalidMessage => 'ఈ థీమ్‌ను లోడ్ చేయడం సాధ్యపడలేదు.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" సేవ్ చేయబడింది.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'ఈ పరికరం నుండి \"$themeName\" తొలగించబడింది.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\"ని తొలగించడం సాధ్యపడలేదు.';
  }

  @override
  String get savedThemesTitle => 'సేవ్ చేసిన థీమ్‌లు';

  @override
  String get savedThemesDescription =>
      'ఇవి ప్రస్తుత సర్వర్ కోసం Moonfin ప్లగిన్ నుండి డౌన్‌లోడ్ చేయబడిన థీమ్‌లు. తొలగించడం వలన ఈ స్థానిక కాపీ మాత్రమే తీసివేయబడుతుంది.';

  @override
  String get savedThemesEmpty =>
      'ఈ సర్వర్ కోసం సేవ్ చేయబడిన థీమ్‌లు ఏవీ కనుగొనబడలేదు.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • ప్రస్తుతం సక్రియంగా ఉంది';
  }

  @override
  String get savedThemesDeleteTooltip => 'సేవ్ చేసిన థీమ్‌ను తొలగించండి';

  @override
  String get savedThemesManageSubtitle =>
      'ఈ పరికరంలో డౌన్‌లోడ్ చేయబడిన ప్లగిన్ థీమ్‌లను నిర్వహించండి';

  @override
  String get themeEditor => 'థీమ్ ఎడిటర్';

  @override
  String get themeEditorSubtitle =>
      'మీ బ్రౌజర్‌లో Moonfin థీమ్ ఎడిటర్‌ను తెరవండి';

  @override
  String get homeScreen => 'హోమ్ స్క్రీన్';

  @override
  String get bottomBar => 'దిగువ బార్';

  @override
  String get homeRowsStyleClassic => 'క్లాసిక్';

  @override
  String get homeRowsStyleModern => 'ఆధునిక';

  @override
  String get homeRowsSection => 'హోమ్ వరుసలు';

  @override
  String get homeRowDisplay => 'హోమ్ వరుస డిస్‌ప్లే';

  @override
  String get homeRowSections => 'హోమ్ వరుస విభాగాలు';

  @override
  String get homeRowToggles => 'హోమ్ వరుస టోగుల్‌లు';

  @override
  String get homeRowTogglesSubtitle =>
      'లైబ్రరీ-ఆధారిత హోమ్ వరుస వర్గాలను ప్రారంభించండి లేదా నిలిపివేయండి';

  @override
  String get homeRowTogglesDescription =>
      'హోమ్ విభాగాలలో వరుసలను ప్రదర్శించడానికి కింది టోగుల్‌లను ప్రారంభించండి.';

  @override
  String get rowsType => 'అడ్డు వరుసల రకం';

  @override
  String get rowsTypeDescription =>
      'క్లాసిక్ ప్రతి వరుస చిత్ర రకాన్ని మరియు సమాచార అతివ్యాప్తిని ఉంచుతుంది. ఆధునిక పోర్ట్రెయిట్-టు-బ్యాక్‌డ్రాప్ అడ్డు వరుసలను ఉపయోగిస్తుంది.';

  @override
  String get displayFavoritesRows => 'ఇష్టమైన వరుసలను ప్రదర్శించు';

  @override
  String get displayFavoritesRowsSubtitle =>
      'హోమ్ విభాగాలలో ఇష్టమైన సినిమాలు, సిరీస్ మరియు ఇతర ఇష్టమైన అడ్డు వరుసలను చూపండి.';

  @override
  String get favoritesRowSorting => 'ఇష్టమైనవి వరుస క్రమబద్ధీకరణ';

  @override
  String get favoritesRowSortingDescription =>
      'జోడించిన తేదీ, విడుదల తేదీ, అక్షర క్రమంలో మరియు మరిన్నింటి ద్వారా ఇష్టమైన వరుసలను క్రమబద్ధీకరించండి.';

  @override
  String get displayCollectionsRows => 'సేకరణల వరుసలను ప్రదర్శించు';

  @override
  String get displayCollectionsRowsSubtitle =>
      'హోమ్ విభాగాలలో సేకరణల అడ్డు వరుసలను చూపండి.';

  @override
  String get collectionsRowSorting => 'సేకరణల వరుస క్రమబద్ధీకరణ';

  @override
  String get collectionsRowSortingDescription =>
      'జోడించిన తేదీ, విడుదల తేదీ, అక్షర క్రమంలో మరియు మరిన్నింటి ఆధారంగా సేకరణల వరుసలను క్రమబద్ధీకరించండి.';

  @override
  String get displayGenresRows => 'ప్రదర్శన శైలుల వరుసలు';

  @override
  String get displayGenresRowsSubtitle =>
      'హోమ్ విభాగాలలో జెనర్‌ల అడ్డు వరుసలను చూపండి.';

  @override
  String get genresRowSorting => 'శైలుల వరుస క్రమబద్ధీకరణ';

  @override
  String get genresRowSortingDescription =>
      'జోడించిన తేదీ, విడుదల తేదీ, అక్షరక్రమం మరియు మరిన్నింటి ఆధారంగా జెనర్‌ల అడ్డు వరుసలను క్రమబద్ధీకరించండి.';

  @override
  String get genresRowItems => 'జానర్స్ వరుస అంశాలు';

  @override
  String get genresRowItemsDescription =>
      'చలన చిత్రాలను, సిరీస్‌లను లేదా రెండింటినీ జెనర్‌ల వరుసలలో చూపండి.';

  @override
  String get displayPlaylistsRows => 'ప్లేజాబితా వరుసలను చూపించండి';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'హోమ్ విభాగాలలో ప్లేజాబితా వరుసలను చూపుతుంది.';

  @override
  String get playlistsRowSorting => 'ప్లేజాబితా వరుస క్రమబద్ధీకరణ';

  @override
  String get playlistsRowSortingDescription =>
      'ప్లేజాబితా వరుసలను జోడించిన తేదీ, విడుదల తేదీ, అక్షర క్రమం మరియు మరిన్నింటి ప్రకారం క్రమబద్ధీకరించండి.';

  @override
  String get displayAudioRows => 'ఆడియో వరుసలను చూపించండి';

  @override
  String get displayAudioRowsSubtitle =>
      'హోమ్ విభాగాలలో ఆడియో వరుసలను చూపుతుంది.';

  @override
  String get audioRowsSorting => 'ఆడియో వరుసల క్రమబద్ధీకరణ';

  @override
  String get audioRowsSortingDescription =>
      'ఆడియో వరుసలను జోడించిన తేదీ, విడుదల తేదీ, అక్షర క్రమం మరియు మరిన్నింటి ప్రకారం క్రమబద్ధీకరించండి.';

  @override
  String get audioPlaylists => 'ఆడియో ప్లేజాబితాలు';

  @override
  String get appearance => 'స్వరూపం';

  @override
  String get layout => 'లేఅవుట్';

  @override
  String get theme => 'థీమ్';

  @override
  String get keyboard => 'కీబోర్డ్';

  @override
  String get navButtons => 'బటన్‌లు';

  @override
  String get rendering => 'రెండరింగ్';

  @override
  String get mpvConfiguration => 'MPV కాన్ఫిగరేషన్';

  @override
  String get cardSize => 'కార్డ్ పరిమాణం';

  @override
  String get externalPlayerApp => 'బాహ్య ప్లేయర్ యాప్';

  @override
  String get externalPlayerAppDescription =>
      'లాంగ్-ప్రెస్ ప్లే ఎంపికను ప్రారంభించడానికి బాహ్య ప్లేయర్‌ను సెట్ చేయండి';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'ప్లేబ్యాక్ ప్రారంభమైనప్పుడు యాప్ ఎంపికను చూపండి.';

  @override
  String get loadingInstalledPlayers =>
      'ఇన్‌స్టాల్ చేయబడిన ప్లేయర్‌లను లోడ్ చేస్తోంది...';

  @override
  String get connection => 'కనెక్షన్';

  @override
  String get audioTranscodeTarget => 'ఆడియో ట్రాన్స్‌కోడ్ లక్ష్యం';

  @override
  String get passthrough => 'పాస్త్రూ';

  @override
  String get supportedOnThisDevice => 'ఈ పరికరంలో మద్దతు ఉంది';

  @override
  String get notSupportedOnThisDevice => 'ఈ పరికరంలో మద్దతు లేదు';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) పాస్‌త్రూ';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'బాహ్య డీకోడర్‌కు బిట్‌స్ట్రీమ్ DTS:X (DTS UHD).';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Atmos (JOC) పాస్‌త్రూతో TrueHD';

  @override
  String get mediaPlayerBehavior => 'మీడియా ప్లేయర్ ప్రవర్తన';

  @override
  String get playbackEnhancements => 'ప్లేబ్యాక్ మెరుగుదలలు';

  @override
  String get alwaysOn => 'ఎల్లప్పుడూ ఆన్‌లో ఉంటుంది.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'తదుపరి ప్రదర్శనతో స్కిప్ అవుట్రోను భర్తీ చేయండి';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'స్కిప్ అవుట్‌రో బటన్‌కు బదులుగా తదుపరి పైకి అతివ్యాప్తిని చూపండి.';

  @override
  String get playerRouting => 'ప్లేయర్ రూటింగ్';

  @override
  String get preferSoftwareDecoders => 'సాఫ్ట్‌వేర్ డీకోడర్‌లను ఇష్టపడండి';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'హార్డ్‌వేర్ డీకోడర్‌ల ముందు FFmpeg (ఆడియో) మరియు libgav1 (AV1) ఉపయోగించండి. HDMI ఆడియో పాస్‌త్రూ విచ్ఛిన్నమైతే నిలిపివేయండి.';

  @override
  String get useExternalPlayer => 'బాహ్య ప్లేయర్ ఉపయోగించండి';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TVలో మీరు ఎంచుకున్న బాహ్య యాప్‌లో వీడియో ప్లేబ్యాక్‌ని తెరవండి.';

  @override
  String get automaticQueuing => 'ఆటోమేటిక్ క్యూయింగ్';

  @override
  String get preferSdhSubtitles => 'SDH ఉపశీర్షికలకు ప్రాధాన్యత ఇవ్వండి';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'స్వీయ-ఎంపిక చేసేటప్పుడు SDH/CC ఉపశీర్షిక ట్రాక్‌లకు ప్రాధాన్యత ఇవ్వండి.';

  @override
  String get webDiagnostics => 'వెబ్ డయాగ్నస్టిక్స్';

  @override
  String get webDiagnosticsTitle => 'Moonfin వెబ్ డయాగ్నోస్టిక్స్';

  @override
  String get webDiagnosticsIntro =>
      'బ్రౌజర్ కనెక్టివిటీ సమస్యలను (CORS, మిశ్రమ కంటెంట్ మరియు ఆవిష్కరణ సెట్టింగ్‌లు) నిర్ధారించడానికి ఈ పేజీని ఉపయోగించండి.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'మిశ్రమ-కంటెంట్ వైఫల్యం గుర్తించబడింది';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/ప్రీఫ్లైట్ వైఫల్యం గుర్తించబడింది';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin HTTP సర్వర్ URLకి కాల్ చేయడానికి ప్రయత్నిస్తున్న HTTPS పేజీని గుర్తించింది. ఈ అభ్యర్థన మీ సర్వర్‌ను చేరుకోవడానికి ముందే బ్రౌజర్‌లు బ్లాక్ చేస్తాయి.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin మీడియా సర్వర్‌లో CORS లేదా ప్రీఫ్లైట్ హెడర్‌లు మిస్ కావడం వల్ల సాధారణంగా సంభవించే బ్రౌజర్-స్థాయి అభ్యర్థన వైఫల్యాన్ని గుర్తించింది.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'లక్ష్య URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'వివరాలు: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'ప్రస్తుత రన్‌టైమ్ సందర్భం';

  @override
  String get webDiagnosticsOrigin => 'మూలం';

  @override
  String get webDiagnosticsScheme => 'పథకం';

  @override
  String get webDiagnosticsPluginMode => 'ప్లగిన్ మోడ్';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC స్కాన్';

  @override
  String get webDiagnosticsForcedServerUrl => 'నిర్బంధ సర్వర్ URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'డిఫాల్ట్ సర్వర్ URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'డిస్కవరీ ప్రాక్సీ URL';

  @override
  String get notConfigured => 'కాన్ఫిగర్ చేయబడలేదు';

  @override
  String get webDiagnosticsMixedContent => 'మిశ్రమ కంటెంట్';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'ఈ పేజీ HTTPS ద్వారా లోడ్ చేయబడింది, కానీ ఒకటి లేదా అంతకంటే ఎక్కువ కాన్ఫిగర్ చేయబడిన URLలు HTTP. HTTP APIలకు కాల్ చేయకుండా బ్రౌజర్‌లు HTTPS పేజీలను బ్లాక్ చేస్తాయి.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'పరిష్కరించండి: HTTPS ద్వారా మీ మీడియా సర్వర్ లేదా ప్రాక్సీ ఎండ్‌పాయింట్‌ను అందించండి లేదా విశ్వసనీయ స్థానిక నెట్‌వర్క్‌లలో మాత్రమే HTTP ద్వారా Moonfinని లోడ్ చేయండి.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'ప్రస్తుత రన్‌టైమ్ సెట్టింగ్‌ల నుండి స్పష్టమైన మిశ్రమ-కంటెంట్ కాన్ఫిగరేషన్ కనుగొనబడలేదు.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS చెక్‌లిస్ట్';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Originలో బ్రౌజర్ మూలాన్ని అనుమతించండి.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headersలో ఆథరైజేషన్, X-Emby-ఆథరైజేషన్ మరియు X-Emby-టోకెన్‌ని చేర్చండి.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• స్ట్రీమింగ్ కోసం కంటెంట్-రేంజ్ మరియు యాక్సెప్ట్-రేంజ్‌లను బహిర్గతం చేయండి మరియు ప్రవర్తనను కోరుకోండి.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS ప్రీఫ్లైట్ అభ్యర్థనలకు 204ని తిరిగి ఇవ్వండి.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'ఉదాహరణ హెడర్ స్నిప్పెట్ (nginx-శైలి)';

  @override
  String get note => 'గమనిక';

  @override
  String get webDiagnosticsNonWebNote =>
      'ఈ డయాగ్నస్టిక్స్ మార్గం వెబ్ బిల్డ్‌ల కోసం ఉద్దేశించబడింది. మీరు దీన్ని మరొక ప్లాట్‌ఫారమ్‌లో చూస్తున్నట్లయితే, ఈ తనిఖీలు వర్తించకపోవచ్చు.';

  @override
  String get backToServerSelect => 'సర్వర్‌కి తిరిగి వెళ్లు ఎంచుకోండి';

  @override
  String get signOutAllUsers => 'వినియోగదారులందరినీ సైన్ అవుట్ చేయండి';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'మైక్రోఫోన్ అనుమతి శాశ్వతంగా తిరస్కరించబడింది. సిస్టమ్ సెట్టింగ్‌లలో దీన్ని ప్రారంభించండి.';

  @override
  String get voiceSearchPermissionRequired =>
      'వాయిస్ శోధన కోసం మైక్రోఫోన్ అనుమతి అవసరం.';

  @override
  String get voiceSearchNoMatch => 'అది పట్టలేదు. మళ్లీ ప్రయత్నించండి.';

  @override
  String get voiceSearchNoSpeechDetected => 'ప్రసంగం కనుగొనబడలేదు.';

  @override
  String get voiceSearchMicrophoneError => 'మైక్రోఫోన్ లోపం.';

  @override
  String get voiceSearchNeedsInternet => 'వాయిస్ శోధనకు ఇంటర్నెట్ అవసరం.';

  @override
  String get voiceSearchServiceBusy =>
      'వాయిస్ సర్వీస్ బిజీగా ఉంది. మళ్లీ ప్రయత్నించండి.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'మైక్రోఫోన్ అనుమతి శాశ్వతంగా తిరస్కరించబడింది.';

  @override
  String get microphonePermissionDenied => 'మైక్రోఫోన్ అనుమతి నిరాకరించబడింది.';

  @override
  String get speechRecognitionUnavailable =>
      'ఈ పరికరంలో స్పీచ్ రికగ్నిషన్ అందుబాటులో లేదు.';

  @override
  String get openIosRoutePicker => 'iOS రూట్ పికర్‌ని తెరవండి';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay రూట్ పికర్ ఈ పరికరంలో అందుబాటులో లేదు.';

  @override
  String get videos => 'వీడియోలు';

  @override
  String get programs => 'కార్యక్రమాలు';

  @override
  String get songs => 'పాటలు';

  @override
  String get photoAlbums => 'ఫోటో ఆల్బమ్‌లు';

  @override
  String get photos => 'ఫోటోలు';

  @override
  String get people => 'ప్రజలు';

  @override
  String get recentlyReleasedEpisodes => 'ఇటీవల విడుదలైన ఎపిసోడ్స్';

  @override
  String get watchAgain => 'మళ్ళీ చూడండి';

  @override
  String get guestAppearances => 'అతిథి ప్రదర్శనలు';

  @override
  String get appearancesSeerr => 'కనిపించినవి (Seerr)';

  @override
  String get crewContributionsSeerr => 'సిబ్బంది సహకారాలు (Seerr)';

  @override
  String get watchWithGroup => 'సమూహంతో చూడండి';

  @override
  String get errors => 'లోపాలు';

  @override
  String get warnings => 'హెచ్చరికలు';

  @override
  String get disk => 'డిస్క్';

  @override
  String get openInBrowser => 'బ్రౌజర్‌లో తెరవండి';

  @override
  String get embeddedBrowserNotAvailable =>
      'ఈ ప్లాట్‌ఫారమ్‌లో పొందుపరిచిన బ్రౌజర్ అందుబాటులో లేదు.';

  @override
  String get adminRestartServerConfirmation =>
      'మీరు ఖచ్చితంగా సర్వర్‌ని పునఃప్రారంభించాలనుకుంటున్నారా?';

  @override
  String get adminShutdownServerConfirmation =>
      'మీరు ఖచ్చితంగా సర్వర్‌ని షట్ డౌన్ చేయాలనుకుంటున్నారా? మీరు దీన్ని మాన్యువల్‌గా రీస్టార్ట్ చేయాలి.';

  @override
  String get internal => 'అంతర్గత';

  @override
  String get idle => 'పనిలేకుండా';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'వినియోగదారులు కనుగొనబడలేదు';

  @override
  String get adminNoUsersMatchSearch =>
      'మీ శోధనకు సరిపోలే వినియోగదారులు ఎవరూ లేరు';

  @override
  String get adminNoDevicesFound => 'పరికరాలు ఏవీ కనుగొనబడలేదు';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'ప్రస్తుత ఫిల్టర్‌లకు ఏ పరికరాలు సరిపోలడం లేదు';

  @override
  String get passwordSet => 'పాస్వర్డ్ సెట్';

  @override
  String get noPasswordConfigured => 'పాస్‌వర్డ్ కాన్ఫిగర్ చేయబడలేదు';

  @override
  String get remoteAccess => 'రిమోట్ యాక్సెస్';

  @override
  String get localOnly => 'స్థానికంగా మాత్రమే';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'మీడియా విశ్లేషణలను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'అన్ని మీడియా లైబ్రరీలలో కలిపి విశ్లేషణలు.';

  @override
  String get analyticsTopArtists => 'అగ్ర కళాకారులు';

  @override
  String get analyticsTopAuthors => 'అగ్ర రచయితలు';

  @override
  String get analyticsTopContributors => 'అగ్ర సహకారులు';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count లైబ్రరీలు',
      one: '1 లైబ్రరీ',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'ఈ ఎంపిక కోసం ఇంకా ఇండెక్స్ చేయబడిన మీడియా మొత్తాలు ఏవీ అందుబాటులో లేవు.';

  @override
  String get analyticsLibraryDetails => 'లైబ్రరీ వివరాలు';

  @override
  String get analyticsLibraryBreakdown => 'లైబ్రరీ విచ్ఛిన్నం';

  @override
  String get analyticsNoLibrariesAvailable => 'లైబ్రరీలు అందుబాటులో లేవు.';

  @override
  String get adminServerAdministrationTitle => 'సర్వర్ అడ్మినిస్ట్రేషన్';

  @override
  String get adminServerPathData => 'డేటా';

  @override
  String get adminServerPathImageCache => 'చిత్రం కాష్';

  @override
  String get adminServerPathCache => 'కాష్';

  @override
  String get adminServerPathLogs => 'లాగ్‌లు';

  @override
  String get adminServerPathMetadata => 'మెటాడేటా';

  @override
  String get adminServerPathTranscode => 'ట్రాన్స్‌కోడ్';

  @override
  String get adminServerPathWeb => 'వెబ్';

  @override
  String get adminNoServerPathsReturned =>
      'ఈ సర్వర్ ద్వారా అందించబడిన సర్వర్ మార్గాలు ఏవీ లేవు.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ఉపయోగించబడింది';
  }

  @override
  String get userActivity => 'వినియోగదారు కార్యాచరణ';

  @override
  String get systemEvents => 'సిస్టమ్ ఈవెంట్‌లు';

  @override
  String get needsAttention => 'శ్రద్ధ అవసరం';

  @override
  String get adminDrawerSectionServer => 'సర్వర్';

  @override
  String get adminDrawerSectionPlayback => 'ప్లేబ్యాక్';

  @override
  String get adminDrawerSectionDevices => 'పరికరాలు';

  @override
  String get adminDrawerSectionAdvanced => 'అధునాతనమైనది';

  @override
  String get adminDrawerSectionPlugins => 'ప్లగిన్లు';

  @override
  String get adminDrawerSectionLiveTv => 'ప్రత్యక్ష TV';

  @override
  String get homeVideos => 'హోమ్ వీడియోలు';

  @override
  String get mixedContent => 'మిశ్రమ కంటెంట్';

  @override
  String get homeVideosAndPhotos => 'హోమ్ వీడియోలు & ఫోటోలు';

  @override
  String get mixedMoviesAndShows => 'మిశ్రమ చలనచిత్రాలు & ప్రదర్శనలు';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'రాక్‌చిప్ MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'రికార్డింగ్‌లు ఏవీ కనుగొనబడలేదు';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension ఆర్కైవ్ లోపల చిత్ర పేజీలు ఏవీ కనుగొనబడలేదు.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'పొందుపరిచిన రెండరర్ విఫలమైంది ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB రెండరర్ విఫలమైంది ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'రీడర్ కోసం స్థానిక ఫైల్ లేదు: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri నుండి బుక్ డేటాను తెరిచేటప్పుడు HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'చదవగలిగే పుస్తక ముగింపు స్థానం అందుబాటులో లేదు';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'మద్దతు లేని కామిక్ ఆర్కైవ్ ఫార్మాట్: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'ఈ ప్లాట్‌ఫారమ్‌లో CBR వెలికితీత ప్లగ్ఇన్ అందుబాటులో లేదు.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr ఆర్కైవ్‌ని సంగ్రహించడంలో విఫలమైంది.';

  @override
  String get cb7ExtractionUnavailable =>
      'ఈ ప్లాట్‌ఫారమ్‌లో CB7 వెలికితీత అందుబాటులో లేదు.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'ఈ ప్లాట్‌ఫారమ్‌లో CB7 వెలికితీత ప్లగ్ఇన్ అందుబాటులో లేదు.';

  @override
  String get closeGenrePanel => 'కళా ప్రక్రియ ప్యానెల్‌ను మూసివేయండి';

  @override
  String get loadingShuffle => 'షఫుల్ లోడ్ అవుతోంది...';

  @override
  String get libraryShuffleLabel => 'లైబ్రరీ షఫుల్';

  @override
  String get randomShuffleLabel => 'యాదృచ్ఛిక షఫుల్';

  @override
  String get genresShuffleLabel => 'శైలుల షఫుల్';

  @override
  String get autoHdrSwitching => 'ఆటో HDR స్విచింగ్';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR వీడియో ప్లేబ్యాక్ కోసం HDRని స్వయంచాలకంగా ప్రారంభించండి మరియు నిష్క్రమణలో ప్రదర్శన మోడ్‌ని పునరుద్ధరించండి.';

  @override
  String get whenFullscreen => 'పూర్తి స్క్రీన్‌లో ఉన్నప్పుడు';

  @override
  String get changeArtwork => 'ఆర్ట్‌వర్క్‌ను మార్చండి';

  @override
  String get missing => 'తప్పిపోయింది';

  @override
  String get transcodingLimits => 'ట్రాన్స్‌కోడింగ్ పరిమితులు';

  @override
  String get clearAllArtworkButton => 'మొత్తం ఆర్ట్‌వర్క్‌ను క్లియర్ చేయాలా?';

  @override
  String get clearAllArtworkWarning =>
      'డౌన్‌లోడ్ చేసిన మొత్తం ఆర్ట్‌వర్క్‌ను ఖచ్చితంగా క్లియర్ చేయాలా?';

  @override
  String get confirmClear => 'క్లియర్‌ను నిర్ధారించండి';

  @override
  String confirmClearMessage(String itemType) {
    return 'ఈ $itemTypeను ఖచ్చితంగా క్లియర్ చేయాలా?';
  }

  @override
  String get uploadButton => 'అప్‌లోడ్ చేయాలా?';

  @override
  String get resolutionLabel => 'రిజల్యూషన్: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'ఇంటర్‌ఫేస్ భాషలో మాత్రమే ఆర్ట్‌వర్క్‌ను చూపించండి';

  @override
  String get confirmClearAll => 'అన్నింటిని క్లియర్ చేయడాన్ని నిర్ధారించండి';

  @override
  String get imageUploadSuccess => 'ఇమేజ్ విజయవంతంగా అప్‌లోడ్ చేయబడింది!';

  @override
  String imageUploadFailed(String error) {
    return 'ఇమేజ్‌ను అప్‌లోడ్ చేయడం విఫలమైంది: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'ఇమేజ్‌ను సెట్ చేయడం విఫలమైంది: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'ఇమేజ్‌ను తొలగించడం విఫలమైంది: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'మొత్తం ఆర్ట్‌వర్క్‌ను క్లియర్ చేయడం విఫలమైంది: $error';
  }

  @override
  String get yes => 'అవును';

  @override
  String get posterCategory => 'పోస్టర్';

  @override
  String get backdropsCategory => 'బ్యాక్‌డ్రాప్‌లు';

  @override
  String get bannerCategory => 'బ్యానర్';

  @override
  String get logoCategory => 'లోగో';

  @override
  String get thumbnailCategory => 'థంబ్‌నెయిల్';

  @override
  String get artCategory => 'ఆర్ట్';

  @override
  String get discArtCategory => 'డిస్క్ ఆర్ట్';

  @override
  String get screenshotCategory => 'స్క్రీన్‌షాట్';

  @override
  String get boxCoverCategory => 'బాక్స్ కవర్';

  @override
  String get boxRearCoverCategory => 'బాక్స్ వెనుక కవర్';

  @override
  String get menuArtCategory => 'మెను ఆర్ట్';

  @override
  String get confirmItemPoster => 'పోస్టర్';

  @override
  String get confirmItemBackdrop => 'బ్యాక్‌డ్రాప్';

  @override
  String get confirmItemBanner => 'బ్యానర్';

  @override
  String get confirmItemLogo => 'లోగో';

  @override
  String get confirmItemThumbnail => 'థంబ్‌నెయిల్';

  @override
  String get confirmItemArt => 'ఆర్ట్';

  @override
  String get confirmItemDiscArt => 'డిస్క్ ఆర్ట్';

  @override
  String get confirmItemScreenshot => 'స్క్రీన్‌షాట్';

  @override
  String get confirmItemBoxCover => 'బాక్స్ కవర్';

  @override
  String get confirmItemBoxRearCover => 'బాక్స్ వెనుక కవర్';

  @override
  String get confirmItemMenuArt => 'మెను ఆర్ట్';

  @override
  String get resolutionAll => 'అన్నీ';

  @override
  String get resolutionHigh => 'అధిక (1080p+)';

  @override
  String get resolutionMedium => 'మధ్యస్థ (720p)';

  @override
  String get resolutionLow => 'తక్కువ (<720p)';

  @override
  String get sources => 'మూలాలు';

  @override
  String get audiobookChapters => 'అధ్యాయాలు';

  @override
  String get audiobookBookmarks => 'బుక్‌మార్క్‌లు';

  @override
  String get audiobookNotes => 'గమనికలు';

  @override
  String get audiobookQueue => 'క్యూ';

  @override
  String get audiobookTimeline => 'టైమ్‌లైన్';

  @override
  String get audiobookTimelineEmpty => 'టైమ్‌లైన్ ఖాళీగా ఉంది';

  @override
  String get audiobookWholeBook => 'మొత్తం పుస్తకం';

  @override
  String get audiobookFocusedTimeline => 'కేంద్రీకృత టైమ్‌లైన్';

  @override
  String get audiobookExportBookmarks => 'బుక్‌మార్క్‌లను ఎగుమతి చేయండి';

  @override
  String get audiobookExportNotes => 'గమనికలను ఎగుమతి చేయండి';

  @override
  String get audiobookExportAll => 'అన్నింటిని ఎగుమతి చేయండి';

  @override
  String audiobookExportSuccess(String path) {
    return '$pathకి ఎగుమతి చేయబడింది';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'ఎగుమతి విఫలమైంది: $error';
  }

  @override
  String get audiobookLyrics => 'సాహిత్యం';

  @override
  String get audiobookAddBookmark => 'బుక్‌మార్క్‌ను జోడించండి';

  @override
  String get audiobookAddNote => 'గమనికను జోడించండి';

  @override
  String get audiobookEditNote => 'గమనికను సవరించండి';

  @override
  String get audiobookNoteHint => 'ఈ క్షణం కోసం ఒక గమనిక రాయండి';

  @override
  String get audiobookSleepTimer => 'స్లీప్ టైమర్';

  @override
  String get audiobookSleepOff => 'ఆఫ్';

  @override
  String get audiobookSleepEndOfChapter => 'అధ్యాయం ముగింపు';

  @override
  String get audiobookSleepCustom => 'అనుకూలం';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining మిగిలి ఉంది';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ని',
      one: '1 ని',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'ప్లేబ్యాక్ వేగం';

  @override
  String get audiobookRemainingTime => 'మిగిలి ఉంది';

  @override
  String get audiobookElapsedTime => 'గడిచింది';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'వెనుకకు ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'ముందుకు ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'మునుపటి అధ్యాయం';

  @override
  String get audiobookNextChapter => 'తదుపరి అధ్యాయం';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'అధ్యాయం $current / $total';
  }

  @override
  String get audiobookNoChapters => 'అధ్యాయాలు లేవు';

  @override
  String get audiobookNoBookmarks => 'ఇంకా బుక్‌మార్క్‌లు లేవు';

  @override
  String get audiobookNoNotes => 'ఇంకా గమనికలు లేవు';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position వద్ద బుక్‌మార్క్ జోడించబడింది';
  }

  @override
  String get audiobookSpeedReset => '1.0xకి రీసెట్ చేయండి';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'సేవ్ చేయండి';

  @override
  String get audiobookCancel => 'రద్దు చేయండి';

  @override
  String get audiobookDelete => 'తొలగించండి';

  @override
  String get subtitlePreferences => 'సబ్‌టైటిల్ ప్రాధాన్యతలు';

  @override
  String get subtitlePreferencesDescription =>
      'సబ్‌టైటిల్ మోడ్‌లు, డిఫాల్ట్ భాషలు, రూపం, రెండరింగ్ ఎంపికలను మార్చండి.';

  @override
  String get subtitleRendering => 'సబ్‌టైటిల్ రెండరింగ్';

  @override
  String get displayOptions => 'డిస్‌ప్లే ఎంపికలు';

  @override
  String get releaseDateAscending => 'విడుదల తేదీ (ఆరోహణ)';

  @override
  String get releaseDateDescending => 'విడుదల తేదీ (అవరోహణ)';

  @override
  String get groupContributions => 'సహకారాలను సమూహపరచండి';

  @override
  String get groupMultipleRoles => 'బహుళ పాత్రలను సమూహపరచండి';

  @override
  String get libraryWriteAccessWarningTitle => 'లైబ్రరీ రైట్ యాక్సెస్ హెచ్చరిక';

  @override
  String get libraryWriteAccessHowToFix => 'దీన్ని ఎలా సరిచేయాలి:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. సర్వర్‌లో మీ మీడియా లైబ్రరీ ఫోల్డర్‌ల కోసం Jellyfin సర్వీస్ వినియోగదారుకు (ఉదా. jellyfin లేదా Docker PUID/PGID) రైట్ అనుమతులను మంజూరు చేయండి.\n\n2. లేదా, మీ Jellyfin Dashboard -> Librariesకి వెళ్లి, ఈ లైబ్రరీని సవరించి, ఆర్ట్‌వర్క్‌ను Jellyfin అంతర్గత డేటాబేస్‌లో నిల్వ చేయడానికి \'Save artwork into media folders\'ను నిలిపివేయండి.';

  @override
  String get dismiss => 'కొట్టివేయండి';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'మీ \'$libraryName\' లైబ్రరీ ఆర్ట్‌వర్క్‌ను నేరుగా మీడియా ఫోల్డర్‌లలో సేవ్ చేయడానికి కాన్ఫిగర్ చేయబడింది (\'Save artwork into media folders\' ప్రారంభించబడింది). అయితే, Jellyfin రైట్ యాక్సెస్‌ను పరీక్షించింది మరియు ఈ డైరెక్టరీలో ఫైల్‌లను రాయడానికి అనుమతి లేదు:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin ఆర్ట్‌వర్క్‌ను అప్‌డేట్ చేయడంలో విఫలమైనట్లు కనిపిస్తోంది. మీ లైబ్రరీ ఆర్ట్‌వర్క్‌ను నేరుగా మీడియా ఫోల్డర్‌లలో సేవ్ చేయడానికి కాన్ఫిగర్ చేయబడింది (\'Save artwork into media folders\' ప్రారంభించబడింది). Jellyfin సర్వర్ ప్రాసెస్‌కు మీ మీడియా డైరెక్టరీలలో ఫైల్‌లను రాయడానికి అనుమతి లేనప్పుడు ఈ లోపం సాధారణంగా సంభవిస్తుంది.';

  @override
  String get externalLists => 'బాహ్య జాబితాలు';

  @override
  String get replay => 'మళ్లీ ప్లే చేయండి';

  @override
  String get fileInformation => 'ఫైల్ సమాచారం';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'పరిమాణం: $size  •  ఫార్మాట్: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'అన్ని ($count) ఆడియో ట్రాక్‌లను చూపించండి';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'అన్ని ($count) సబ్‌టైటిల్ ట్రాక్‌లను చూపించండి';
  }

  @override
  String get checkingDirectPlay =>
      'డైరెక్ట్ ప్లే సామర్థ్యాన్ని తనిఖీ చేస్తోంది...';

  @override
  String get directPlayCapabilityLabel => 'డైరెక్ట్ ప్లే సామర్థ్యం: ';

  @override
  String get forced => 'బలవంతం';

  @override
  String get transcodeContainerNotSupported =>
      'కంటైనర్ ఫార్మాట్‌కు ప్లేయర్ మద్దతివ్వదు.';

  @override
  String get transcodeVideoCodecNotSupported => 'వీడియో కోడెక్‌కు మద్దతు లేదు.';

  @override
  String get transcodeAudioCodecNotSupported => 'ఆడియో కోడెక్‌కు మద్దతు లేదు.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'సబ్‌టైటిల్ ఫార్మాట్‌కు మద్దతు లేదు (బర్నింగ్ అవసరం).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'ఆడియో ప్రొఫైల్‌కు మద్దతు లేదు.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'వీడియో ప్రొఫైల్‌కు మద్దతు లేదు.';

  @override
  String get transcodeVideoLevelNotSupported => 'వీడియో లెవల్‌కు మద్దతు లేదు.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'ఈ పరికరం వీడియో రిజల్యూషన్‌కు మద్దతివ్వదు.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'వీడియో బిట్ డెప్త్‌కు మద్దతు లేదు.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'వీడియో ఫ్రేమ్‌రేట్‌కు మద్దతు లేదు.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'ఫైల్ బిట్‌రేట్ ప్లేయర్ స్ట్రీమింగ్ పరిమితిని మించింది.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'వీడియో బిట్‌రేట్ స్ట్రీమింగ్ పరిమితిని మించింది.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'ఆడియో బిట్‌రేట్ స్ట్రీమింగ్ పరిమితిని మించింది.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'ఆడియో ఛానెల్‌ల సంఖ్యకు మద్దతు లేదు.';

  @override
  String get sortAlphabetical => 'అక్షర క్రమం';

  @override
  String get sortReleaseAscending => 'విడుదల క్రమం (ఆరోహణ)';

  @override
  String get sortReleaseDescending => 'విడుదల క్రమం (అవరోహణ)';

  @override
  String get sortCustomDragDrop => 'అనుకూలం (డ్రాగ్-అండ్-డ్రాప్)';

  @override
  String get playlistSortOptions => 'ప్లేజాబితా క్రమబద్ధీకరణ ఎంపికలు';

  @override
  String get resetSort => 'క్రమబద్ధీకరణను రీసెట్ చేయండి';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episodeను మళ్లీ చూడండి';
  }

  @override
  String get rewatchPlaylist => 'ప్లేజాబితాను మళ్లీ చూడండి';

  @override
  String get noSubtitlesFound => 'సబ్‌టైటిల్‌లు ఏవీ కనుగొనబడలేదు.';

  @override
  String get adminControls => 'అడ్మిన్ నియంత్రణలు';

  @override
  String get impellerRendering => 'రెండరింగ్ ఇంజిన్ (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller అనేది సున్నితమైన యానిమేషన్‌లు మరియు తక్కువ స్టటర్ కోసం Flutter ఆధునిక GPU రెండరర్. కొన్ని TV బాక్స్‌లు మరియు పాత GPUలలో ఇది గ్లిచ్‌లు లేదా బ్లాక్ వీడియోను కలిగిస్తుంది; అవి కనిపిస్తే దీన్ని ఆఫ్ చేయండి. ఆటోమేటిక్ మీ పరికరానికి ఉత్తమ డిఫాల్ట్‌ను ఎంచుకుంటుంది. వర్తింపజేయడానికి Moonfinను పునఃప్రారంభించండి.';

  @override
  String get impellerAuto => 'ఆటోమేటిక్';

  @override
  String get impellerOn => 'ఆన్';

  @override
  String get impellerOff => 'ఆఫ్';

  @override
  String get impellerRestartTitle => 'పునఃప్రారంభం అవసరం';

  @override
  String get impellerRestartMessage =>
      'రెండరింగ్ ఇంజిన్‌ను మార్చడానికి Moonfin పునఃప్రారంభం కావాలి. ఇప్పుడు యాప్‌ను మూసివేసి, వర్తింపజేయడానికి మళ్లీ తెరవండి.';

  @override
  String get impellerCloseNow => 'ఇప్పుడు యాప్‌ను మూసివేయండి';

  @override
  String get adminRefreshLibrary => 'లైబ్రరీని రిఫ్రెష్ చేయండి';

  @override
  String get adminRefreshAllLibraries => 'అన్ని లైబ్రరీలను రిఫ్రెష్ చేయండి';

  @override
  String get adminRepoSortDateOldest => 'జోడించిన తేదీ (పాతవి ముందుగా)';

  @override
  String get adminRepoSortDateNewest => 'జోడించిన తేదీ (కొత్తవి ముందుగా)';

  @override
  String get adminRepoSortNameAsc => 'అక్షర క్రమం (A నుండి Z)';

  @override
  String get adminRepoSortNameDesc => 'అక్షర క్రమం (Z నుండి A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'సర్వర్ అనలిటిక్స్ లోడ్ అవుతోంది... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'మూలంతో సరిపోల్చండి';

  @override
  String get imdbTop250Movies => 'IMDb టాప్ 250 సినిమాలు';

  @override
  String get imdbTop250TvShows => 'IMDb టాప్ 250 TV షోలు';

  @override
  String get imdbMostPopularMovies => 'IMDb అత్యంత జనాదరణ పొందిన సినిమాలు';

  @override
  String get imdbMostPopularTvShows => 'IMDb అత్యంత జనాదరణ పొందిన TV షోలు';

  @override
  String get imdbLowestRatedMovies => 'IMDb అత్యల్ప రేటింగ్ సినిమాలు';

  @override
  String get imdbTopEnglishMovies => 'IMDb టాప్ రేటెడ్ ఇంగ్లీష్ సినిమాలు';
}
