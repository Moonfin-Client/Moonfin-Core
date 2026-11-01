// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class AppLocalizationsCy extends AppLocalizations {
  AppLocalizationsCy([String locale = 'cy']) : super(locale);

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
  String get interfaceLanguage => 'Iaith y Rhyngwyneb';

  @override
  String get systemLanguageDefault => 'Rhagosodiad y System';

  @override
  String get signIn => 'Mewngofnodwch';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Gwag';

  @override
  String connectingToServer(String serverName) {
    return 'Yn cysylltu â $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Cyfrinair';

  @override
  String get username => 'Enw defnyddiwr';

  @override
  String get email => 'Ebost';

  @override
  String get quickConnectInstruction =>
      'Rhowch y cod hwn ar ddangosfwrdd gwe eich gweinydd:';

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
  String get waitingForAuthorization => 'Aros am awdurdodiad…';

  @override
  String get back => 'Yn ôl';

  @override
  String get serverUnavailable => 'Nid yw\'r gweinydd ar gael';

  @override
  String get loginFailed => 'Methodd mewngofnodi';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Nid yw QuickConnect ar gael: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Nid yw QuickConnect ar gael ($status): $detail';
  }

  @override
  String get whosWatching => 'Pwy sy\'n gwylio?';

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
  String get addUser => 'Ychwanegu Defnyddiwr';

  @override
  String get selectServer => 'Dewiswch Gweinydd';

  @override
  String appVersionFooter(String version) {
    return 'fersiwn Moonfin $version';
  }

  @override
  String get savedServers => 'Gweinyddion Cadwedig';

  @override
  String get discoveredServers => 'Gweinyddion a Ddarganfyddwyd';

  @override
  String get noneFound => 'Dim wedi\'i ganfod';

  @override
  String get unableToConnectToServer => 'Methu cysylltu â\'r gweinydd';

  @override
  String get addServer => 'Ychwanegu Gweinydd';

  @override
  String get embyConnect => 'Cyswllt Emby';

  @override
  String get removeServer => 'Dileu Gweinydd';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Tynnu \"$serverName\" o\'ch gweinyddwyr?';
  }

  @override
  String get cancel => 'Canslo';

  @override
  String get remove => 'Tynnu';

  @override
  String get connectToServer => 'Cysylltwch â\'r Gweinydd';

  @override
  String get serverAddress => 'Cyfeiriad y Gweinydd';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Cyswllt';

  @override
  String get secureStorageUnavailable => 'Storfa Ddiogel Ddim ar gael';

  @override
  String get secureStorageUnavailableMessage =>
      'Ni allai Moonfin gyrchu cylch allweddi eich system. Gall mewngofnodi barhau, ond mae\'n bosibl na fydd storfa docynnau ddiogel ar gael nes bod y cylch allweddi wedi\'i ddatgloi.';

  @override
  String get ok => 'iawn';

  @override
  String get settingsAppearanceTheme => 'Thema Ap';

  @override
  String get detailScreenStyle => 'Arddull y sgrin fanylion';

  @override
  String get detailScreenStyleSubtitle =>
      'Clasurol yw cynllun canolog gwreiddiol Moonfin. Modern yw cynllun sinematig ymatebol.';

  @override
  String get detailScreenStyleMoonfin => 'Clasurol';

  @override
  String get detailScreenStyleModern => 'Modern';

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
  String get expandedTabs => 'Tabiau Estynedig';

  @override
  String get expandedTabsSubtitle =>
      'Dangos cynnwys tab yn awtomatig wrth bori drwy\'r tabiau. Diffoddwch hyn i agor a chau pob tab â llaw.';

  @override
  String get showTechnicalDetails => 'Dangos Manylion Technegol?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Dangos gwybodaeth am y codec, y cydraniad a\'r ffrwd yng nghrynodeb y faner';

  @override
  String get recommendationSystem => 'System Argymell';

  @override
  String get recommendationSystemSubtitle =>
      'Defnyddiwch algorithm llyfrgell leol Moonfin Recommends neu Fetrigau Tebygrwydd ar-lein TMDb. Sylwer: mae angen integreiddio Seerr ar gyfer argymhellion ar-lein.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Tebygrwydd TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Cyfyngu yn ôl y dosbarthiad oedran?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Cyfyngu awgrymiadau Moonfin Recommends yn ôl dosbarthiad oedran y cyfrwng targed';

  @override
  String get interfaceStyle => 'Arddull y Rhyngwyneb';

  @override
  String get interfaceStyleSubtitle =>
      'Mae Awtomatig yn cydweddu â\'ch dyfais. Dewiswch Apple neu Material i orfodi golwg benodol.';

  @override
  String get interfaceStyleAutomatic => 'Awtomatig';

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
  String get glassQuality => 'Ansawdd y Gwydr';

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
      'Mae Awto yn dewis yr effaith wydr orau ar gyfer y ddyfais hon. Mae Llawn yn gorfodi pylu go iawn; mae Gostyngedig yn defnyddio gwydr ysgafn sy\'n arbed pŵer y GPU.';

  @override
  String get glassQualityAuto => 'Awto';

  @override
  String get glassQualityFull => 'Llawn';

  @override
  String get glassQualityReduced => 'Gostyngedig';

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
      'Newid rhwng Moonfin a Neon Pulse heb ailgychwyn yr app';

  @override
  String get customThemeTitle => 'Thema Bersonol';

  @override
  String get customThemeSubtitle =>
      'Mae themâu personol yn newid elfennau gweledol ar draws Moonfin. Dewiswch un o\'r opsiynau hyn i weddu i\'ch arddull.';

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
  String get themeMoonfinSubtitle =>
      'Golwg gyfredol Moonfin rydych chi i gyd wedi dod i garu';

  @override
  String get themeNeonPulse => 'Pwls Neon';

  @override
  String get themeNeonPulseSubtitle =>
      'Arddull tonnau synth gyda llewyrch magenta, testun cyan, a chyferbyniad crôm cryfach';

  @override
  String get themeGlass => 'Gwydr';

  @override
  String get themeGlassSubtitle =>
      'Arddull gwydr hylifol gyda chefndir graddliw symudol, arwynebau barugog, ac acen glas Apple';

  @override
  String get theme8BitHero => 'Arwr 8-did';

  @override
  String get theme8BitHeroSubtitle =>
      'Arddull celf picsel retro gyda phalet trwchus, borderi bloclyd, cysgodion caled, a ffont picsel';

  @override
  String get embyConnectSignInSubtitle =>
      'Mewngofnodwch gyda\'ch cyfrif Emby Connect';

  @override
  String get emailOrUsername => 'E-bost neu Enw Defnyddiwr';

  @override
  String get selectAServer => 'Dewiswch Weinydd';

  @override
  String get tryAgain => 'Ceisiwch Eto';

  @override
  String get noLinkedServers =>
      'Dim gweinyddwyr sy\'n gysylltiedig â\'r cyfrif Emby Connect hwn';

  @override
  String get invalidEmbyConnectCredentials => 'Manylion annilys Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Enw defnyddiwr neu gyfrinair Emby Connect annilys';

  @override
  String get embyConnectExchangeNotSupported =>
      'Nid yw\'r gweinydd yn cefnogi cyfnewidfa Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Gwall rhwydwaith wrth gysylltu ag Emby Connect neu\'r gweinydd a ddewiswyd';

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
  String get loadingLinkedServers =>
      'Wrthi\'n llwytho gweinyddion cysylltiedig…';

  @override
  String get connectingToServerEllipsis => 'Wrthi\'n cysylltu â\'r gweinydd…';

  @override
  String get noReachableAddress => 'Ni ddarparwyd cyfeiriad cyraeddadwy';

  @override
  String get invalidServerExchangeResponse =>
      'Ymateb annilys o bwynt terfyn cyfnewid gweinydd';

  @override
  String unableToConnectTo(String target) {
    return 'Methu cysylltu â $target';
  }

  @override
  String get exitApp => 'Gadael Moonfin?';

  @override
  String get exitAppConfirmation => 'Ydych chi\'n siŵr eich bod am adael?';

  @override
  String get exit => 'Ymadael';

  @override
  String get gameMenu => 'Dewislen';

  @override
  String get gamePaused => 'Wedi oedi';

  @override
  String get gameSaveState => 'Arbed cyflwr';

  @override
  String get games => 'Gemau';

  @override
  String get gameLoadState => 'Llwytho cyflwr';

  @override
  String get gameFastForward => 'Chwarae ymlaen';

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
  String get gameEmulatorSettings => 'Gosodiadau\'r efelychydd';

  @override
  String get gameNoCoreOptions =>
      'Nid oes gan y craidd hwn unrhyw opsiynau addasadwy.';

  @override
  String get gameHoldToOpenMenu => 'Daliwch i agor y ddewislen';

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
      'Nid yw chwarae gemau\'n cael ei gefnogi ar y ddyfais hon eto.';

  @override
  String get noHomeRowsLoaded => 'Nid oedd modd llwytho unrhyw resi cartref';

  @override
  String get noHomeRowsHint =>
      'Ceisiwch adnewyddu neu leihau adrannau cartref gweithredol.';

  @override
  String get retryHomeRows => 'Ailgynnig Rhesi Cartref';

  @override
  String get guide => 'Tywysydd';

  @override
  String get recordings => 'Recordiadau';

  @override
  String get schedule => 'Atodlen';

  @override
  String get series => 'Cyfresi';

  @override
  String get noItemsFound => 'Ni chanfuwyd unrhyw eitemau';

  @override
  String get home => 'Hafan';

  @override
  String get browseAll => 'Pori Pawb';

  @override
  String get genres => 'Genres';

  @override
  String get collectionPlaceholder => 'Bydd eitemau casglu yn ymddangos yma';

  @override
  String get browseByLetter => 'Pori trwy Lythyr';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Bydd pori yn nhrefn yr wyddor yn ymddangos yma';

  @override
  String get suggestions => 'Awgrymiadau';

  @override
  String get suggestionsPlaceholder =>
      'Bydd eitemau a awgrymir yn ymddangos yma';

  @override
  String get failedToLoadLibraries => 'Wedi methu llwytho llyfrgelloedd';

  @override
  String get noLibrariesFound => 'Ni ddaethpwyd o hyd i lyfrgelloedd';

  @override
  String get library => 'Llyfrgell';

  @override
  String get displaySettings => 'Gosodiadau Arddangos';

  @override
  String get allGenres => 'Pob Genres';

  @override
  String get noGenresFound => 'Heb ganfod genres';

  @override
  String failedToLoadFolderError(String error) {
    return 'Wedi methu llwytho ffolder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Mae\'r ffolder hon yn wag';

  @override
  String itemCountLabel(int count) {
    return '$count eitem';
  }

  @override
  String get failedToLoadFavorites => 'Wedi methu llwytho ffefrynnau';

  @override
  String get retry => 'Ceisiwch eto';

  @override
  String get noFavoritesYet => 'Dim ffefrynnau eto';

  @override
  String get favorites => 'Ffefrynnau';

  @override
  String totalCountItems(int count) {
    return '$count Eitemau';
  }

  @override
  String get continuing => 'Yn parhau';

  @override
  String get ended => 'Wedi dod i ben';

  @override
  String get sortAndFilter => 'Trefnu a Hidlo';

  @override
  String get type => 'Math';

  @override
  String get sortBy => 'Trefnu Yn ôl';

  @override
  String get display => 'Arddangos';

  @override
  String get imageType => 'Math o Ddelwedd';

  @override
  String get posterSize => 'Maint Poster';

  @override
  String get small => 'Bach';

  @override
  String get medium => 'Canolig';

  @override
  String get large => 'Mawr';

  @override
  String get extraLarge => 'Mawr Ychwanegol';

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
    return '$name — Genres';
  }

  @override
  String get views => 'Golygfeydd';

  @override
  String get albums => 'Albymau';

  @override
  String get albumArtists => 'Artistiaid Albwm';

  @override
  String get artists => 'Artistiaid';

  @override
  String get bookmarks => 'Llyfrnodau';

  @override
  String get noSavedBookmarks =>
      'Dim nodau tudalen ar gyfer y teitl hwn wedi\'u cadw eto.';

  @override
  String get openBook => 'Llyfr Agored';

  @override
  String get chapter => 'Pennod';

  @override
  String get page => 'Tudalen';

  @override
  String get bookmark => 'Llyfrnod';

  @override
  String get justNow => 'Dim ond nawr';

  @override
  String minutesAgo(int count) {
    return '${count}m yn ôl';
  }

  @override
  String hoursAgo(int count) {
    return '${count}awr yn ôl';
  }

  @override
  String daysAgo(int count) {
    return '${count}d yn ôl';
  }

  @override
  String get discoverySubjects => 'Pynciau Darganfod';

  @override
  String get apply => 'Gweithredu';

  @override
  String get openLink => 'Agor Dolen';

  @override
  String get scanWithYourPhone => 'Sganiwch gyda\'ch ffôn';

  @override
  String get audiobookGenres => 'Genres Llyfrau Llafar';

  @override
  String get scrollLeft => 'Sgroliwch i\'r chwith';

  @override
  String get scrollRight => 'Sgroliwch i\'r dde';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre => 'Methu llwytho\'r genre hwn ar hyn o bryd.';

  @override
  String get continueReading => 'Parhau i Ddarllen';

  @override
  String get savedHighlights => 'Uchafbwyntiau wedi\'u Cadw';

  @override
  String get continueListening => 'Parhewch i Wrando';

  @override
  String get listen => 'Gwrandewch';

  @override
  String get resume => 'Parhau';

  @override
  String get failedToLoadLibrary => 'Wedi methu llwytho\'r llyfrgell';

  @override
  String get popularNow => 'Poblogaidd Nawr';

  @override
  String get savedForLater => 'Wedi\'i Gadw Ar Gyfer Yn Ddiweddarach';

  @override
  String get topListens => 'Top Yn gwrando';

  @override
  String get unreadDiscoveries => 'Darganfyddiadau Heb eu Darllen';

  @override
  String get pickUpAgain => 'Codwch Eto';

  @override
  String get bookHighlightsDescription =>
      'Eich llyfrau gydag uchafbwyntiau, ffefrynnau, neu gynnydd darllen.';

  @override
  String get handPickedFromLibrary => 'Wedi\'i ddewis â llaw o\'ch llyfrgell.';

  @override
  String get handPickedFromListeningQueue =>
      'Wedi\'i ddewis â llaw o\'ch ciw gwrando.';

  @override
  String get booksWithHighlights =>
      'Llyfrau gydag uchafbwyntiau, ffefrynnau, neu gynnydd darllen.';

  @override
  String get jumpBackNarration =>
      'Neidiwch yn ôl i\'r naratif heb hela am eich lle.';

  @override
  String get unreadBooksReady =>
      'Llyfrau heb eu darllen yn barod ar gyfer yr awr dawel nesaf.';

  @override
  String get quickAccessFavorites =>
      'Mynediad cyflym i\'r llyfrau rydych chi\'n dod yn ôl atynt o hyd.';

  @override
  String get searchAudiobooks => 'Chwilio llyfrau sain';

  @override
  String get searchYourLibrary => 'Chwiliwch eich llyfrgell';

  @override
  String get pickUpStory => 'Codwch y stori lle gwnaethoch chi adael';

  @override
  String get savedPlacesChapters =>
      'Eich lleoedd sydd wedi\'u cadw a\'ch penodau anorffenedig';

  @override
  String authorsCount(int count) {
    return '$count awduron';
  }

  @override
  String genresCount(int count) {
    return '$count genre';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% wedi\'i gwblhau';
  }

  @override
  String get readyWhenYouAre => 'Yn barod pan fyddwch chi';

  @override
  String get details => 'Manylion';

  @override
  String get listeningRoom => 'Ystafell Wrando';

  @override
  String get bookmarksAndProgress => 'Llyfrnodau a Chynnydd';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Teitlau $count wedi\'u trefnu i\'w darllen - pori yn gyntaf.';
  }

  @override
  String get titles => 'Teitlau';

  @override
  String get allTitles => 'Pob Teitl';

  @override
  String get authors => 'Awduron';

  @override
  String get browseByAuthor => 'Pori Yn ôl Awdur';

  @override
  String get browseByGenre => 'Pori Yn ôl Genre';

  @override
  String get discover => 'Darganfod';

  @override
  String get noBookmarkedItems => 'Dim eitemau wedi\'u nod tudalen eto';

  @override
  String get nothingMatchesSection =>
      'Nid oes dim yn cyfateb i\'r adran hon eto. Rhowch gynnig ar dab arall neu dewch yn ôl ar ôl i gysoni\'r llyfrgell ddod i ben.';

  @override
  String get audiobooks => 'Llyfrau llafar';

  @override
  String noLabelFound(String label) {
    return 'Ni chanfuwyd $label';
  }

  @override
  String get folder => 'Ffolder';

  @override
  String get filters => 'Hidlau';

  @override
  String get readingStatus => 'Statws Darllen';

  @override
  String get playedStatus => 'Statws chwarae';

  @override
  String get readStatus => 'Darllen';

  @override
  String get watched => 'Gwyliwyd';

  @override
  String get unread => 'Heb ei ddarllen';

  @override
  String get unwatched => 'Heb ei wylio';

  @override
  String get seriesStatus => 'Statws y Gyfres';

  @override
  String get allLibraries => 'Pob Llyfrgell';

  @override
  String get books => 'Llyfrau';

  @override
  String get latestBooks => 'Llyfrau Diweddaraf';

  @override
  String get latestAudiobooks => 'Llyfrau Sain Diweddaraf';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count llyfr',
      two: '$count lyfr',
      zero: '$count o lyfrau',
      one: '1 llyfr',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Llyfr';

  @override
  String get bookFormatAudiobook => 'Llyfr sain';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Ni chafwyd hyd i lyfrau ar gyfer yr awdur hwn.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% wedi\'i ddarllen';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time ar ôl';
  }

  @override
  String get bookHeroRead => 'Darllen';

  @override
  String get bookHeroListen => 'Gwrando';

  @override
  String get author => 'Awdur';

  @override
  String get unknownAuthor => 'Awdur Anhysbys';

  @override
  String get uncategorized => 'Heb gategori';

  @override
  String get overview => 'Trosolwg';

  @override
  String get noLibrivoxDescription =>
      'Ni ddarparwyd disgrifiad gan LibriVox ar gyfer y teitl hwn eto.';

  @override
  String get readers => 'Darllenwyr';

  @override
  String get openLinks => 'Agor Dolenni';

  @override
  String get librivoxPage => 'Tudalen LibriVox';

  @override
  String get internetArchive => 'Archif Rhyngrwyd';

  @override
  String get rssFeed => 'Porthiant RSS';

  @override
  String get downloadZip => 'Lawrlwythwch Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count adrannau';
  }

  @override
  String firstPublished(int year) {
    return 'Cyhoeddwyd gyntaf $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Dim trosolwg ar gael gan Open Library ar gyfer y teitl hwn eto.';

  @override
  String get subjects => 'Pynciau';

  @override
  String get all => 'Pawb';

  @override
  String booksCount(int count) {
    return '$count llyfrau';
  }

  @override
  String get couldNotLoadSubject => 'Methu llwytho\'r pwnc hwn ar hyn o bryd.';

  @override
  String get audiobookDetails => 'Manylion Llyfrau Llafar';

  @override
  String authorsCountTitle(int count) {
    return '$count Awduron';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count llyfr sain',
      two: '$count lyfr sain',
      zero: '$count o lyfrau sain',
      one: '1 llyfr sain',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Rhestr Traciau';

  @override
  String get itemListPlaceholder => 'Bydd rhestr o eitemau yn ymddangos yma';

  @override
  String get failedToLoad => 'Wedi methu llwytho';

  @override
  String get delete => 'Dileu';

  @override
  String get save => 'Cadw';

  @override
  String get moreLikeThis => 'Mwy Fel Hyn';

  @override
  String get castAndCrew => 'Cast a Chriw';

  @override
  String get collection => 'Casgliad';

  @override
  String get episodes => 'Penodau';

  @override
  String get nextUp => 'Nesaf Up';

  @override
  String get seasons => 'Tymhorau';

  @override
  String get chapters => 'Penodau';

  @override
  String get features => 'Nodweddion';

  @override
  String get movies => 'Ffilmiau';

  @override
  String get musicVideos => 'Fideos Cerddoriaeth';

  @override
  String get other => 'Arall';

  @override
  String get discography => 'Disgograffi';

  @override
  String get similarArtists => 'Artistiaid tebyg';

  @override
  String get tableOfContents => 'Tabl Cynnwys';

  @override
  String get tracklist => 'Rhestr traciau';

  @override
  String discNumber(int number) {
    return 'Disg $number';
  }

  @override
  String get biography => 'Bywgraffiad Biography I thank Mr';

  @override
  String get authorDetails => 'Manylion Awdur';

  @override
  String get noOverviewAvailable =>
      'Nid oes trosolwg ar gael ar gyfer y teitl hwn eto.';

  @override
  String get noBiographyAvailable =>
      'Nid oes bywgraffiad ar gael i\'r awdur hwn.';

  @override
  String get unableToLoadAuthorDetails =>
      'Methu llwytho manylion yr awdur ar hyn o bryd.';

  @override
  String published(int year) {
    return 'Wedi cyhoeddi $year';
  }

  @override
  String get publicationDateUnknown => 'Dyddiad cyhoeddi yn anhysbys';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tymhorau',
      one: '1 Tymor',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Yn gorffen yn $time';
  }

  @override
  String get items => 'Eitemau';

  @override
  String get extras => 'Ychwanegion';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Y Tu Ôl i\'r Llenni';

  @override
  String get deletedScenes => 'Golygfeydd wedi\'u Dileu';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Cyfweliadau';

  @override
  String get scenes => 'Golygfeydd';

  @override
  String get shorts => 'Ffilmiau Byrion';

  @override
  String get trailers => 'Rhaghysbysebion';

  @override
  String timeRemaining(String time) {
    return '$time ar ôl';
  }

  @override
  String endsIn(String time) {
    return 'Yn gorffen ymhen $time';
  }

  @override
  String get view => 'Golwg';

  @override
  String get resumeReading => 'Ail-ddechrau Darllen';

  @override
  String get read => 'Darllen';

  @override
  String resumeFrom(String position) {
    return 'Ail-ddechrau o $position';
  }

  @override
  String get play => 'Chwarae';

  @override
  String get startOver => 'Cychwyn Drosodd';

  @override
  String get restart => 'Ailgychwyn';

  @override
  String get readOffline => 'Darllenwch All-lein';

  @override
  String get playOffline => 'Chwarae All-lein';

  @override
  String get audio => 'Sain';

  @override
  String get subtitles => 'Isdeitlau';

  @override
  String get version => 'Fersiwn';

  @override
  String get cast => 'Castio';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Rhaghysbyseb';

  @override
  String get finished => 'Wedi gorffen';

  @override
  String get favorited => 'Ffafrio';

  @override
  String get favorite => 'Hoff';

  @override
  String get playlist => 'Rhestr chwarae';

  @override
  String get downloaded => 'Wedi\'i lawrlwytho';

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
  String get downloadAll => 'Lawrlwythwch Pawb';

  @override
  String get download => 'Lawrlwythwch';

  @override
  String get deleteDownloaded => 'Dileu Wedi\'i Lawrlwytho';

  @override
  String get goToSeries => 'Ewch i Gyfres';

  @override
  String get editMetadata => 'Golygu Metadata';

  @override
  String get less => 'Llai';

  @override
  String get more => 'Mwy';

  @override
  String get deleteItem => 'Dileu Eitem';

  @override
  String get deletePlaylist => 'Dileu Rhestr Chwarae';

  @override
  String get deletePlaylistMessage =>
      'Dileu\'r rhestr chwarae hon o\'r gweinydd?';

  @override
  String get deleteItemMessage => 'Dileu\'r eitem hon o\'r gweinydd?';

  @override
  String get failedToDeletePlaylist => 'Wedi methu dileu rhestr chwarae';

  @override
  String get failedToDeleteItem => 'Wedi methu dileu\'r eitem';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Ailenwi Rhestr Chwarae';

  @override
  String get playlistName => 'Enw rhestr chwarae';

  @override
  String get deleteDownloadedAlbum => 'Dileu Albwm Wedi\'i Lawrlwytho';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Dileu traciau wedi\'u llwytho i lawr ar gyfer \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted =>
      'Traciau wedi\'u llwytho i lawr wedi\'u dileu';

  @override
  String get downloadedTracksDeleteFailed =>
      'Nid oedd modd dileu rhai traciau a lawrlwythwyd';

  @override
  String get noTracksLoaded => 'Dim traciau wedi\'u llwytho';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Na $itemLabel wedi\'i lwytho';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Wrthi\'n llwytho i lawr $title ($count items)…';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddileu \"$name\" o\'r gweinydd? Ni ellir dadwneud y weithred hon.';
  }

  @override
  String get itemDeleted => 'Eitem wedi\'i dileu';

  @override
  String get noPlayableTrailerFound => 'Ni chanfuwyd trelar chwaraeadwy.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Fformat llyfr heb ei gefnogi: .$extension';
  }

  @override
  String get audioTrack => 'Trac Sain';

  @override
  String get subtitleTrack => 'Trac Isdeitl';

  @override
  String get none => 'Dim';

  @override
  String get downloadSubtitlesLabel => 'Lawrlwythwch isdeitlau…';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Chwiliwch gan ddefnyddio\'r ategyn OpenSubtitles';

  @override
  String get downloadSubtitles => 'Lawrlwythwch Isdeitlau';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid =>
      'Mae\'r is-deitl a ddewiswyd yn annilys.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Isdeitl wedi\'i lawrlwytho a\'i ddewis: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Isdeitl wedi\'i lawrlwytho. Gall gymryd eiliad i ymddangos tra bod Jellyfin yn adnewyddu\'r eitem.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Ni chanfuwyd unrhyw is-deitlau o bell ar gyfer $language.';
  }

  @override
  String get selectVersion => 'Dewiswch Fersiwn';

  @override
  String versionNumber(int number) {
    return 'Fersiwn $number';
  }

  @override
  String get downloadAllQuality => 'Lawrlwythwch Pawb - Ansawdd';

  @override
  String get downloadQuality => 'Ansawdd Lawrlwytho';

  @override
  String get originalFileNoReencoding => 'Ffeil wreiddiol, dim ail-godio';

  @override
  String get originalFilesNoReencoding => 'Ffeiliau gwreiddiol, dim ail-godio';

  @override
  String get noEpisodesLoaded => 'Dim penodau wedi\'u llwytho';

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
    return 'Wrthi\'n lawrlwytho $name ($quality)…';
  }

  @override
  String get deleteDownloadedFiles => 'Dileu Ffeiliau Wedi\'u Lawrlwytho';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Dileu ffeiliau lleol ar gyfer $typeLabel?\n\nBydd hyn yn rhyddhau lle storio. Gallwch ail-lwytho i lawr yn ddiweddarach.';
  }

  @override
  String get downloadedFilesDeleted =>
      'Ffeiliau wedi\'u llwytho i lawr wedi\'u dileu';

  @override
  String get failedToDeleteFiles => 'Wedi methu dileu ffeiliau';

  @override
  String get deleteFiles => 'Dileu Ffeiliau';

  @override
  String get director => 'CYFARWYDDWR';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'CYFARWYDDWYR';

  @override
  String get writer => 'AWDUR';

  @override
  String get writers => 'SGRIPTWYR';

  @override
  String get studio => 'STIWDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count mwy';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Penodau';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Pennod $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Pennod $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trac',
      many: '$count thrac',
      few: '$count thrac',
      two: '$count drac',
      zero: '$count o draciau',
      one: '1 trac',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pennod',
      many: '$count phennod',
      few: '$count pennod',
      two: '$count bennod',
      zero: '$count o benodau',
      one: '1 bennod',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Ganwyd $date';
  }

  @override
  String died(String date) {
    return 'Bu farw $date';
  }

  @override
  String age(int age) {
    return 'Oedran $age';
  }

  @override
  String get showLess => 'Dangos Llai';

  @override
  String get readMore => 'Darllen Mwy';

  @override
  String get shuffle => 'Cymysgu';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Hapchwarae\'r holl gerddoriaeth';

  @override
  String get carSignInPrompt => 'Mewngofnodwch i Moonfin ar eich ffôn';

  @override
  String get carServerUnreachable => 'Methu cyrraedd eich gweinydd';

  @override
  String downloadsCount(int count) {
    return '$count lawrlwythiadau';
  }

  @override
  String get perfectMatch => 'Cydweddiad perffaith';

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
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Mae angen caniatâd rheoli isdeitl Jellyfin ar gyfer y defnyddiwr hwn ar gyfer is-deitl o bell $action.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Nid oedd modd dod o hyd i\'r eitem hon ar y gweinydd ar gyfer is-deitl o bell $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Is-deitl o bell $action methu: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Methodd yr is-deitl o bell $action (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Wedi methu $action isdeitlau o bell.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'pob pennod wedi\'i lawrlwytho ar gyfer \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'pob pennod wedi\'i lawrlwytho yn y tymor hwn';

  @override
  String get stillWatching => 'Dal i Wylio?';

  @override
  String get unableToLoadTrailerStream => 'Methu llwytho ffrwd trelar.';

  @override
  String get trailerTimedOut => 'Trelar wedi dod i ben wrth lwytho.';

  @override
  String get playbackFailedForTrailer =>
      'Methodd chwarae ar gyfer y trelar hwn.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Nid yw castio ar gael yn ystod chwarae all-lein.';

  @override
  String castActionFailed(String label, String error) {
    return '$label methodd y weithred: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Wedi methu gosod cyfaint y cast: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Rheolaethau';
  }

  @override
  String get deviceVolume => 'Cyfrol Dyfais';

  @override
  String get unavailable => 'Ddim ar gael';

  @override
  String get pause => 'Oedi';

  @override
  String get syncPosition => 'Safle Cysoni';

  @override
  String stopCast(String label) {
    return 'Stopiwch $label';
  }

  @override
  String get queueIsEmpty => 'Mae\'r ciw yn wag';

  @override
  String trackNumber(int number) {
    return 'Traciwch $number';
  }

  @override
  String get remotePlayback => 'Chwarae o Bell';

  @override
  String get castingToGoogleCast => 'Castio i Google Cast';

  @override
  String get castingViaAirPlay => 'Castio trwy AirPlay';

  @override
  String get castingViaDlna => 'Castio trwy DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds eiliadau';
  }

  @override
  String get longPressToUnlock => 'Pwyswch hir i ddatgloi';

  @override
  String get off => 'I ffwrdd';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Awto';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get audioDelay => 'Oedi Sain';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Oedi Isdeitl';

  @override
  String get reset => 'Ailosod';

  @override
  String get unknown => 'Anhysbys';

  @override
  String get playbackInformation => 'Gwybodaeth Chwarae';

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
  String get playback => 'Chwarae yn ôl';

  @override
  String get playMethod => 'Dull Chwarae';

  @override
  String get directPlay => 'Chwarae Uniongyrchol';

  @override
  String get directStream => 'Ffrwd Uniongyrchol';

  @override
  String get transcoding => 'Trawsgodio';

  @override
  String get transcodeReasons => 'Rhesymau Trawsgodio';

  @override
  String get player => 'Chwaraewr';

  @override
  String get container => 'Cynhwysydd';

  @override
  String get bitrate => 'Cyfradd didau';

  @override
  String get video => 'Fideo';

  @override
  String get resolution => 'Datrysiad';

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
  String get track => 'Trac';

  @override
  String get channels => 'Sianeli';

  @override
  String get format => 'Fformat';

  @override
  String get external => 'Allanol';

  @override
  String get embedded => 'Gwreiddio';

  @override
  String castSessionError(String protocol) {
    return '$protocol gwall sesiwn';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Wedi methu llwytho manylion y llyfr: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Nid yw mewn-app rendro EPUB ar gael ar y platfform hwn eto.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Ni all y fformat hwn (.$extension) gael ei rendro yn yr ap eto.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Nid yw rendrad dogfen wedi\'i fewnosod ar gael ar y platfform hwn.';

  @override
  String get couldNotOpenExternalViewer => 'Methu agor gwyliwr allanol.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Wedi methu ag agor darllenydd mewn-app: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Mae nod tudalen eisoes wedi\'i gadw yn $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Ychwanegwyd nod tudalen: $label';
  }

  @override
  String get noBookmarksYet =>
      'Dim nodau tudalen eto.\nTapiwch yr eicon nod tudalen wrth ddarllen i arbed eich safle.';

  @override
  String get noTableOfContentsAvailable => 'Dim tabl cynnwys ar gael';

  @override
  String pageLabel(int number) {
    return 'Tudalen $number';
  }

  @override
  String get position => 'Swydd';

  @override
  String get bookReader => 'Darllenydd Llyfrau';

  @override
  String formatExtension(String extension) {
    return 'Fformat: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent % darllen';
  }

  @override
  String get updating => 'Wrthi\'n diweddaru…';

  @override
  String get markUnread => 'Marcio Heb ei Ddarllen';

  @override
  String get markAsRead => 'Marciwch fel Darllen';

  @override
  String get reloadReader => 'Ail-lwytho Darllenydd';

  @override
  String get noPagesFound => 'Heb ganfod tudalennau.';

  @override
  String get failedToDecodePageImage =>
      'Wedi methu â dadgodio delwedd tudalen.';

  @override
  String resetZoom(String zoom) {
    return 'Ailosod Chwyddo (${zoom}x)';
  }

  @override
  String get singlePage => 'Tudalen Sengl';

  @override
  String get twoPageSpread => 'Lledaeniad Dwy Dudalen';

  @override
  String get addBookmark => 'Ychwanegu Nod tudalen';

  @override
  String get bookmarksEllipsis => 'Llyfrnodau…';

  @override
  String get markedAsRead => 'Wedi ei nodi fel wedi ei ddarllen';

  @override
  String get markedAsUnread => 'Wedi\'i farcio fel heb ei ddarllen';

  @override
  String failedToUpdateReadState(String error) {
    return 'Wedi methu â diweddaru cyflwr darllen: $error';
  }

  @override
  String get themeSystem => 'Thema: System';

  @override
  String get themeLight => 'Thema: Golau';

  @override
  String get themeDark => 'Thema: Tywyll';

  @override
  String get themeSepia => 'Thema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Lliwiau Gwrthdro (cynllun sefydlog)';

  @override
  String get invertColorsPdf => 'Lliwiau Gwrthdro (PDF)';

  @override
  String get preparingInAppReader => 'Wrthi\'n paratoi darllenydd mewn-app…';

  @override
  String get pdfDataNotAvailable => 'Data PDF ddim ar gael.';

  @override
  String get readerFallbackModeActive =>
      'Modd wrth gefn darllenydd yn weithredol';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ni all y platfform hwn gynnal y peiriant dogfennau wedi\'i fewnosod ar gyfer ffeiliau $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Defnyddiwch Reload Reader ar ôl newid i darged platfform â chymorth (Android, iOS, macOS).';

  @override
  String get openExternally => 'Agor yn Allanol';

  @override
  String get noEpubChaptersFound => 'Ni chafwyd hyd i benodau EPUB.';

  @override
  String get readerNotReady => 'Darllenydd ddim yn barod.';

  @override
  String get seriesRecordings => 'Recordiadau Cyfres';

  @override
  String get now => 'Yn awr';

  @override
  String get sports => 'Chwaraeon';

  @override
  String get news => 'Newyddion';

  @override
  String get kids => 'Plant';

  @override
  String get premiere => 'Première';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Llinell Amser Canllaw';

  @override
  String failedToLoadGuide(String error) {
    return 'Wedi methu llwytho\'r canllaw: $error';
  }

  @override
  String get noChannelsFound => 'Heb ganfod sianeli';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'BYW';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Nesaf: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m ar ôl';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h ar ôl';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m ar ôl';
  }

  @override
  String get movie => 'Ffilm';

  @override
  String get removedFromFavoriteChannels => 'Wedi\'i dynnu o hoff sianeli';

  @override
  String get addedToFavoriteChannels => 'Ychwanegwyd at hoff sianeli';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Wedi methu diweddaru hoff sianel';

  @override
  String get unfavoriteChannel => 'Sianel anffafriol';

  @override
  String get favoriteChannel => 'Hoff Sianel';

  @override
  String get record => 'Recordio';

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
  String get cancelRecordingAction => 'Canslo Recordio';

  @override
  String get programSetToRecord => 'Rhaglen wedi\'i gosod i gofnodi';

  @override
  String get recordingCancelled => 'Canslo\'r recordiad';

  @override
  String get unableToCreateRecording => 'Methu creu recordiad';

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
  String get watch => 'Gwylio';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Cau';

  @override
  String failedToPlayChannel(String name) {
    return 'Wedi methu chwarae $name';
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
  String get failedToLoadRecordings => 'Wedi methu llwytho recordiadau';

  @override
  String get scheduledInNext24Hours => 'Wedi\'i amserlennu yn y 24 awr nesaf';

  @override
  String get recentRecordings => 'Recordiadau Diweddar';

  @override
  String get tvSeries => 'Cyfres Deledu';

  @override
  String get failedToLoadSchedule => 'Wedi methu llwytho\'r amserlen';

  @override
  String get noScheduledRecordings => 'Dim recordiadau wedi\'u hamserlennu';

  @override
  String get cancelRecording => 'Canslo Recordio?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Canslo recordiad wedi\'i amserlennu o \"$name\"?';
  }

  @override
  String get no => 'Na';

  @override
  String get yesCancel => 'Ydw, Diddymu';

  @override
  String get failedToCancelRecording => 'Wedi methu canslo recordiad';

  @override
  String get failedToLoadSeriesRecordings =>
      'Wedi methu llwytho recordiadau cyfres';

  @override
  String get noSeriesRecordings => 'Dim recordiadau cyfres';

  @override
  String get cancelSeriesRecording => 'Canslo Recordio Cyfres';

  @override
  String get cancelSeriesRecordingQuestion => 'Canslo Recordio Cyfres?';

  @override
  String stopRecordingName(String name) {
    return 'Stopio recordio \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Wedi methu canslo recordiad cyfres';

  @override
  String get searchThisLibrary => 'Chwiliwch y llyfrgell hon…';

  @override
  String get searchEllipsis => 'Chwilio…';

  @override
  String noResultsForQuery(String query) {
    return 'Dim canlyniadau ar gyfer \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Methodd y chwiliad: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Math o Gyfrif Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lleol';

  @override
  String get savedMedia => 'Cyfryngau wedi\'u Cadw';

  @override
  String get tvShows => 'Sioeau Teledu';

  @override
  String get music => 'Cerddoriaeth';

  @override
  String get musicAlbums => 'Albymau Cerddoriaeth';

  @override
  String get noMediaInFilter => 'Dim cyfrwng yn yr hidlydd hwn';

  @override
  String get noDownloadedMediaYet => 'Dim cyfryngau wedi\'u llwytho i lawr eto';

  @override
  String get browseLibrary => 'Pori\'r Llyfrgell';

  @override
  String get deleteDownload => 'Dileu Dadlwythiad';

  @override
  String removeItemAndFiles(String name) {
    return 'Tynnu \"$name\" a\'i ffeiliau?';
  }

  @override
  String tracksCount(int count) {
    return '$count traciau';
  }

  @override
  String get album => 'Albwm';

  @override
  String get playAlbum => 'Chwarae Albwm';

  @override
  String failedToLoadAlbum(String error) {
    return 'Wedi methu llwytho albwm: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Ni chanfuwyd unrhyw draciau wedi\'u lawrlwytho ar gyfer $name.';
  }

  @override
  String get season => 'Tymor';

  @override
  String get errorLoadingEpisodes => 'Gwall wrth lwytho penodau';

  @override
  String get noDownloadedEpisodes => 'Dim penodau wedi\'u llwytho i lawr';

  @override
  String get deleteEpisode => 'Dileu Pennod';

  @override
  String removeName(String name) {
    return 'Tynnu \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes mun';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'T$season P$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Pennod $number';
  }

  @override
  String get seriesNotFound => 'Cyfres heb ei chanfod';

  @override
  String get errorLoadingSeries => 'Gwall wrth lwytho\'r gyfres';

  @override
  String get downloadedEpisodes => 'Penodau wedi\'u Lawrlwytho';

  @override
  String seasonNumber(int number) {
    return 'Tymor $number';
  }

  @override
  String seasonChip(int number) {
    return 'T$number';
  }

  @override
  String get specials => 'Cwnstabliaid arbennig';

  @override
  String get deleteSeason => 'Dileu Tymor';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Dileu pob pennod sydd wedi\'i lawrlwytho yn $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pennod',
      many: '$count phennod',
      few: '$count pennod',
      two: '$count bennod',
      zero: '$count o benodau',
      one: '1 bennod',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Rheoli Storio';

  @override
  String get storageBreakdown => 'Chwalfa Storio';

  @override
  String get downloadedItems => 'Eitemau wedi\'u Lawrlwytho';

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
  String get storageLimit => 'Terfyn Storio';

  @override
  String get noLimit => 'Dim terfyn';

  @override
  String get deleteAllDownloads => 'Dileu Pob Lawrlwythiad';

  @override
  String get deleteAllDownloadsWarning =>
      'Bydd hyn yn cael gwared ar yr holl ffeiliau cyfryngau wedi\'u llwytho i lawr ac ni ellir eu dadwneud.';

  @override
  String get deleteAll => 'Dileu Pawb';

  @override
  String get deleteSelected => 'Dileu Wedi\'i Ddewis';

  @override
  String deleteSelectedCount(int count) {
    return 'Dileu eitemau wedi\'u llwytho i lawr $count?';
  }

  @override
  String get musicAndAudiobooks => 'Cerddoriaeth a Llyfrau Llafar';

  @override
  String get images => 'Delweddau';

  @override
  String get database => 'Cronfa Ddata';

  @override
  String ofStorageLimit(String limit) {
    return 'o derfyn $limit';
  }

  @override
  String get settings => 'Gosodiadau';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Dilysu';

  @override
  String get autoLoginServerManagement =>
      'Mewngofnodi awtomatig, rheoli gweinydd';

  @override
  String get pinCode => 'Cod PIN';

  @override
  String get setUpPinCodeProtection => 'Sefydlu amddiffyniad cod PIN';

  @override
  String get parentalControls => 'Rheolaethau Rhieni';

  @override
  String get contentRatingRestrictions => 'Cyfyngiadau graddio cynnwys';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, datrys, ymddygiad';

  @override
  String get languageSizeAppearance => 'Iaith, maint, ymddangosiad';

  @override
  String get qualityStorage => 'Ansawdd, storio';

  @override
  String get mediaRequestIntegration => 'Integreiddio ceisiadau cyfryngau';

  @override
  String get switchServer => 'Newid Gweinydd';

  @override
  String get signOut => 'Arwyddo Allan';

  @override
  String get versionLicenses => 'Fersiwn, trwyddedau';

  @override
  String get account => 'Cyfrif';

  @override
  String get signInAndSecurity => 'Mewngofnodi a diogelwch';

  @override
  String get administration => 'Gweinyddiaeth';

  @override
  String get serverSettingsUsersLibraries =>
      'Gosodiadau gweinydd, defnyddwyr, llyfrgelloedd';

  @override
  String get customization => 'Addasu';

  @override
  String get themeAndLayout => 'Thema a gosodiad';

  @override
  String get videoAndSubtitles => 'Fideo ac isdeitlau';

  @override
  String get pluginAndRequests => 'Ategyn a cheisiadau';

  @override
  String get customizeAccountPlaybackInterface =>
      'Addasu cyfrif, chwarae, ac ymddygiad rhyngwyneb';

  @override
  String optionsCount(int count) {
    return 'opsiynau $count';
  }

  @override
  String get themeAndAppearance => 'Thema ac Ymddangosiad';

  @override
  String get focusBorderColor => 'Lliw Ffin Ffocws';

  @override
  String get watchedIndicators => 'Dangosyddion Gwylio';

  @override
  String get always => 'Bob amser';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Cuddio Heb ei wylio';

  @override
  String get episodesOnly => 'Penodau yn Unig';

  @override
  String get never => 'Byth';

  @override
  String get focusExpansionAnimation => 'Animeiddiad Ehangu Ffocws';

  @override
  String get desktopUiScale => 'Graddfa UI bwrdd gwaith';

  @override
  String get scaleFocusedCards =>
      'Cardiau a theils â ffocws ar raddfa neu hofran';

  @override
  String get seriesThumbnails => 'Mân-luniau Cyfres';

  @override
  String get seriesThumbnailsDescription =>
      'Penodau yn unig: defnyddiwch waith celf cyfres sy\'n cyfateb i bob math o ddelwedd rhes';

  @override
  String get homeRowInfoOverlay => 'Troshaen Gwybodaeth Rhes Gartref';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Dangos teitl a metadata wrth bori rhesi cartref';

  @override
  String get clockDisplay => 'Arddangosfa Cloc';

  @override
  String get inMenus => 'Mewn Bwydlenni';

  @override
  String get inVideo => 'Mewn Fideo';

  @override
  String get seasonalEffects => 'Effeithiau Tymhorol';

  @override
  String get seasonalEffectsDescription =>
      'Effeithiau gweledol ac addurniadau tymhorol';

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
  String get snow => 'Eira';

  @override
  String get fireworks => 'Tân gwyllt';

  @override
  String get confetti => 'Conffeti';

  @override
  String get fallingLeaves => 'Dail yn Cwympo';

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
  String get themeMusic => 'Cerddoriaeth Thema';

  @override
  String get playThemeMusicOnDetailPages =>
      'Chwarae cerddoriaeth thema ar dudalennau manylion';

  @override
  String get themeMusicVolume => 'Cyfrol Cerddoriaeth Thema';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Cerddoriaeth Thema ar Rhesi Cartref';

  @override
  String get playWhenBrowsingHomeScreen => 'Chwarae wrth bori\'r sgrin gartref';

  @override
  String get loopThemeMusic => 'Dolennu\'r Gerddoriaeth Thema';

  @override
  String get loopThemeMusicSubtitle =>
      'Ailadrodd y trac yn hytrach na\'i chwarae unwaith';

  @override
  String get detailsBackgroundBlur => 'Manylion Blur Cefndir';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Blur Cefndir Pori';

  @override
  String get maxStreamingBitrate => 'Bitrate Ffrydio Uchaf';

  @override
  String get maxResolution => 'Cydraniad Uchaf';

  @override
  String get playerZoomMode => 'Modd Chwyddo Chwaraewr';

  @override
  String get settingsScrollWheelAction => 'Olwyn sgrolio\'r llygoden';

  @override
  String get settingsScrollWheelActionDescription =>
      'Dewiswch beth mae sgrolio olwyn y llygoden dros y fideo yn ei wneud wrth chwarae.';

  @override
  String get scrollWheelActionOff => 'I ffwrdd';

  @override
  String get scrollWheelActionSeek => 'Symud (ymlaen / yn ôl)';

  @override
  String get scrollWheelActionVolume => 'Lefel sain';

  @override
  String get playerTooltipVolume => 'Lefel sain';

  @override
  String get fit => 'Ffit';

  @override
  String get autoCrop => 'Cnwd Auto';

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
  String get stretch => 'Ymestyn';

  @override
  String get refreshRateSwitching => 'Newid Cyfradd Adnewyddu';

  @override
  String get disabled => 'Wedi\'i analluogi';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Graddfa ar y teledu';

  @override
  String get scaleOnDevice => 'Graddfa ar Ddychymyg';

  @override
  String get trickPlay => 'Chwarae Trick';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Dangos mân-luniau rhagolwg wrth geisio';

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
  String get showDescriptionOnPause => 'Dangos Disgrifiad ar Saib';

  @override
  String get dimVideoShowOverview =>
      'Pylu\'r fideo a dangos testun trosolwg wrth oedi';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'Botwm Clo OSD';

  @override
  String get osdLockButtonDescription =>
      'Dangoswch fotwm clo sy\'n rhwystro mewnbwn cyffwrdd nes ei fod wedi\'i wasgu\'n hir';

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
  String get audioBehavior => 'Ymddygiad Clywedol';

  @override
  String get downmixToStereo => 'Downmix i Stereo';

  @override
  String get defaultAudioLanguage => 'Iaith Sain Ragosodedig';

  @override
  String get fallbackAudioLanguage => 'Iaith Sain Wrth Gefn';

  @override
  String get preferDefaultAudioTrack => 'Ffafrio\'r Trac Sain Rhagosodedig';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Ffafrio\'r trac sain gwreiddiol yn hytrach na throsleisio wedi\'i leoleiddio.';

  @override
  String get preferAudioDescription => 'Ffafrio Traciau Disgrifiad Sain';

  @override
  String get preferAudioDescriptionDescription =>
      'Ffafrio traciau disgrifiad sain yn hytrach na thraciau arferol.';

  @override
  String get autoServerDefault => 'Awto (Diofyn Gweinydd)';

  @override
  String get english => 'Saesneg';

  @override
  String get spanish => 'Sbaeneg';

  @override
  String get french => 'Ffrangeg';

  @override
  String get german => 'Almaeneg';

  @override
  String get italian => 'Eidaleg';

  @override
  String get portuguese => 'Portiwgaleg';

  @override
  String get japanese => 'Japaneaidd';

  @override
  String get korean => 'Corëeg';

  @override
  String get chinese => 'Tsieineaidd';

  @override
  String get russian => 'Rwsiaidd';

  @override
  String get arabic => 'Arabeg';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'Iseldireg';

  @override
  String get swedish => 'Swedeg';

  @override
  String get norwegian => 'Norwyaidd';

  @override
  String get danish => 'Daneg';

  @override
  String get finnish => 'Ffinneg';

  @override
  String get polish => 'Pwyleg';

  @override
  String get ac3Passthrough => 'Llwybr trwodd AC3';

  @override
  String get dtsPassthrough => 'Llwybr DTS';

  @override
  String get trueHdSupport => 'Cefnogaeth TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Sain Bitstream DTS i AVR yn unig; angen cefnogaeth derbynnydd a thrac ffynhonnell DTS';

  @override
  String get settingsAudioFallbackCodec => 'Codec Sain Wrth Gefn';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Dewiswch y fformat targed ar gyfer trawsgodio sain aml-sianel pan na ellir chwarae\'r ffrwd ffynhonnell yn uniongyrchol na\'i throsglwyddo.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Canfod yn Awtomatig\n(Argymhellir)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Rhagosodedig)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Stereo yn Unig)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Effeithlon)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Di-golled)';

  @override
  String get settingsMaxAudioChannels => 'Uchafswm Sianeli Sain';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Ffurfweddwch uchafswm sianeli eich gosodiad sain. Bydd ffrydiau aml-sianel sy\'n uwch na\'r terfyn hwn yn cael eu cymysgu i lawr neu eu trawsgodio.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Canfod yn Awtomatig\n(Rhagosodiad Caledwedd)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Amgylchynol';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Cwadroffonig';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Amgylchynol';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Amgylchynol';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Amgylchynol';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Amgylchynol';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Uwch)';

  @override
  String get settingsAudioCodecPassthrough => 'Trosglwyddo Codec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Galluogi dim ond fformatau y mae eich sinc AVR neu HDMI yn eu cefnogi.';

  @override
  String get settingsAudioEac3Passthrough => 'Llwybr EAC3';

  @override
  String get settingsAudioDtsCorePassthrough => 'Llwybr Craidd DTS';

  @override
  String get settingsAudioDtsHdPassthrough => 'Llwybr drwodd MA DTS-HD';

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
  String get settingsAudioTrueHdPassthrough => 'Trosglwyddo TrueHD';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Galluoedd Sain Wedi\'u Canfod';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Dim ciplun gallu runtime ar gael eto.';

  @override
  String get settingsAudioRouteLabel => 'Llwybr';

  @override
  String get settingsAudioDecodeLabel => 'Dadgodio';

  @override
  String get settingsAudioPassthroughLabel => 'Trosglwyddo';

  @override
  String get settingsAudioHdRoute => 'Llwybr sain HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Llefarydd';

  @override
  String get settingsAudioRouteHeadphones => 'Clustffonau';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get nightMode => 'Modd Nos';

  @override
  String get compressDynamicRange => 'Cywasgu ystod ddeinamig';

  @override
  String get advancedMpv => 'mpv uwch';

  @override
  String get enableCustomMpvConf => 'Galluogi Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Defnyddiwch mpv.conf a bennir gan y defnyddiwr cyn dechrau chwarae';

  @override
  String get unsafeAdvancedMpvOptions => 'Opsiynau mpv Uwch Anniogel';

  @override
  String get unsafeMpvOptionsDescription =>
      'Caniatáu set ehangach o opsiynau mpv. Gall dorri ymddygiad chwarae yn ôl.';

  @override
  String get hardwareDecoding => 'Datgodio caledwedd';

  @override
  String get hardwareDecodingSubtitle =>
      'Gall wella perfformiad ond gall achosi problemau chwarae ar rai dyfeisiau.';

  @override
  String get nextUpAndQueuing => 'Nesaf Up & Ciwio';

  @override
  String get nextUpDisplay => 'Arddangosfa Nesaf Up';

  @override
  String get extended => 'Estynedig';

  @override
  String get minimal => 'Lleiaf';

  @override
  String get nextUpTimeout => 'Goramser Nesaf Up';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Ciwio Cyfryngau';

  @override
  String get autoQueueNextEpisodes => 'Awto-ciwio penodau nesaf';

  @override
  String get stillWatchingPrompt => 'Dal i Gwylio\'n Brydlon';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Ar ôl episodau $episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Ail-ddechrau a Sgipio';

  @override
  String get resumeRewind => 'Ail-ddechrau Ailddirwyn';

  @override
  String get unpauseRewind => 'Unpause Ailddirwyn';

  @override
  String get fiveSeconds => '5 eiliad';

  @override
  String get tenSeconds => '10 eiliad';

  @override
  String get fifteenSeconds => '15 eiliad';

  @override
  String get thirtySeconds => '30 eiliad';

  @override
  String get skipBackLength => 'Nôl Hyd';

  @override
  String get skipForwardLength => 'Hepgor Hyd Ymlaen';

  @override
  String get customMpvConfPath => 'Llwybr mpv.conf Custom';

  @override
  String get notSetMpvConf =>
      'Heb ei osod. Bydd Moonfin yn ceisio mpv.conf rhagosodedig mewn ffolderi app/data.';

  @override
  String get selectMpvConf => 'Dewiswch mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Mae gosodiadau arddull (maint, lliw, gwrthbwyso) yn berthnasol i is-deitlau testun (SRT, VTT, TTML). Mae is-deitlau ASS/SSA yn defnyddio eu steilio wedi\'i fewnosod eu hunain oni bai bod \"ASS/SSA Direct Play\" wedi\'i ddiffodd. Ni ellir ail-steilio is-deitlau didfap (PGS, DVB, VobSub).';

  @override
  String get defaultSubtitleLanguage => 'Iaith Isdeitl Diofyn';

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
  String get defaultToNoSubtitles => 'Rhagosodedig i Dim Is-deitlau';

  @override
  String get turnOffSubtitlesByDefault => 'Diffoddwch isdeitlau yn ddiofyn';

  @override
  String get subtitleSize => 'Maint Isdeitl';

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
  String get textFillColor => 'Lliw Llenwch Testun';

  @override
  String get backgroundColor => 'Lliw Cefndir';

  @override
  String get textStrokeColor => 'Lliw Strôc Testun';

  @override
  String get subtitleCustomization => 'Addasu Is-deitl';

  @override
  String get subtitleCustomizationDescription => 'Addasu ymddangosiad is-deitl';

  @override
  String get subtitleMode => 'Modd Isdeitlau';

  @override
  String get subtitleModeFlagged => 'Wedi\'u Fflagio';

  @override
  String get subtitleModeAlways => 'Bob amser';

  @override
  String get subtitleModeForeign => 'Tramor';

  @override
  String get subtitleModeForced => 'Gorfodol';

  @override
  String get subtitleModeFlaggedDescription =>
      'Yn chwarae traciau sydd wedi\'u fflagio\'n fewnol ym metadata\'r ffeil gyfrwng fel \"default\" neu \"forced\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Yn llwytho ac yn dangos isdeitlau\'n awtomatig bob tro y bydd fideo\'n dechrau.';

  @override
  String get subtitleModeForeignDescription =>
      'Yn troi isdeitlau ymlaen yn awtomatig os yw\'r trac sain rhagosodedig mewn iaith dramor.';

  @override
  String get subtitleModeForcedDescription =>
      'Yn llwytho isdeitlau sydd wedi\'u tagio\'n benodol â\'r fflag metadata \"forced\" yn unig.';

  @override
  String get subtitleModeNoneDescription =>
      'Yn analluogi llwytho isdeitlau\'n awtomatig yn llwyr.';

  @override
  String get fallbackSubtitleLanguage => 'Iaith Isdeitlau Wrth Gefn';

  @override
  String get subtitleStream => 'Ffrwd Isdeitlau';

  @override
  String get subtitlePreviewText =>
      'Mae\'r llwynog brown cyflym yn neidio dros y ci diog';

  @override
  String get verticalOffset => 'Gwrthbwyso Fertigol';

  @override
  String get pgsDirectPlay => 'Chwarae Uniongyrchol PGS';

  @override
  String get directPlayPgsSubtitles => 'Isdeitlau PGS chwarae uniongyrchol';

  @override
  String get assSsaDirectPlay => 'Chwarae Uniongyrchol ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Chwarae uniongyrchol Isdeitlau ASS/SSA';

  @override
  String get white => 'Gwyn';

  @override
  String get black => 'Du';

  @override
  String get yellow => 'Melyn';

  @override
  String get green => 'Gwyrdd';

  @override
  String get cyan => 'Gwyrddlas';

  @override
  String get red => 'Coch';

  @override
  String get transparent => 'Tryloyw';

  @override
  String get semiTransparentBlack => 'Du lled-dryloyw';

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
  String get global => 'Byd-eang';

  @override
  String get desktop => 'Penbwrdd';

  @override
  String get mobile => 'Symudol';

  @override
  String get tv => 'teledu';

  @override
  String loadedProfileSettings(String profile) {
    return 'Wedi llwytho gosodiadau proffil $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Wedi methu llwytho gosodiadau proffil $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Wedi cysoni gosodiadau lleol i broffil $profile.';
  }

  @override
  String get syncing => 'Wrthi\'n cysoni…';

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
  String get profileSyncHidden => 'Proffil Cysoni Cudd';

  @override
  String get enablePluginSyncDescription =>
      'Galluogi Cysoni Ategion Gweinydd mewn gosodiadau Ategyn i ddangos rheolyddion proffil yma.';

  @override
  String get quality => 'Ansawdd';

  @override
  String get defaultDownloadQuality => 'Ansawdd Llwytho i Lawr Rhagosodedig';

  @override
  String get network => 'Rhwydwaith';

  @override
  String get wifiOnlyDownloads => 'Dadlwythiadau WiFi yn Unig';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Dangos lawrlwythiadau ar y gweinydd';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Gadael i weinyddwr y gweinydd weld eich lawrlwythiadau wedi\'u trawsgodio yn y dangosfwrdd';

  @override
  String get onlyDownloadOnWifi =>
      'Dim ond pan fyddwch wedi cysylltu â WiFi y gallwch chi lawrlwytho';

  @override
  String get storage => 'Storio';

  @override
  String get storageUsed => 'Storio a Ddefnyddir';

  @override
  String get manage => 'Rheoli';

  @override
  String get calculating => 'Wrthi\'n cyfrifo…';

  @override
  String get downloadLocation => 'Lleoliad Lawrlwytho';

  @override
  String get defaultLabel => 'Diofyn';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Cadw i ffolder Lawrlwythiadau';

  @override
  String get downloadsVisibleToOtherApps =>
      'Lawrlwythiadau / Moonfin - yn weladwy i apiau eraill';

  @override
  String get dangerZone => 'Parth Perygl';

  @override
  String get clearAllDownloads => 'Clirio Pob Lawrlwythiad';

  @override
  String get original => 'Gwreiddiol';

  @override
  String get changeDownloadLocation => 'Newid Lleoliad Lawrlwytho';

  @override
  String get changeDownloadLocationDescription =>
      'Bydd lawrlwythiadau newydd yn cael eu cadw i\'r ffolder a ddewiswyd. Bydd lawrlwythiadau presennol yn aros yn eu lleoliad presennol a gellir eu rheoli o osodiadau Storio.';

  @override
  String get confirm => 'Cadarnhau';

  @override
  String get cannotWriteToFolder =>
      'Methu ysgrifennu i\'r ffolder a ddewiswyd. Dewiswch leoliad gwahanol neu rhowch ganiatâd storio.';

  @override
  String get saveToDownloadsFolderQuestion => 'Cadw i ffolder Lawrlwythiadau?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Bydd cyfryngau wedi\'u lawrlwytho yn cael eu cadw i Lawrlwythiadau / Moonfin ar eich dyfais. Bydd y ffeiliau hyn yn weladwy i apiau eraill fel eich oriel neu chwaraewr cerddoriaeth.\n\nBydd lawrlwythiadau presennol yn aros yn eu lleoliad presennol.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Galluogi';

  @override
  String get clearAllDownloadsWarning =>
      'Bydd hyn yn dileu\'r holl gyfryngau sydd wedi\'u llwytho i lawr ac ni ellir eu dadwneud.';

  @override
  String get clearAll => 'Clirio Pawb';

  @override
  String get navigationStyle => 'Arddull Llywio';

  @override
  String get topBar => 'Bar Uchaf';

  @override
  String get leftSidebar => 'Bar Ochr Chwith';

  @override
  String get showShuffleButton => 'Dangos y Botwm Shuffle';

  @override
  String get showGenresButton => 'Botwm Dangos Genres';

  @override
  String get showFavoritesButton => 'Dangos y Botwm Ffefrynnau';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Dangos Llyfrgelloedd yn y Bar Offer';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'Dangos Labeli\'r Bar Llywio Bob Amser';

  @override
  String get showSeerrButton => 'Dangos Botwm Seerr';

  @override
  String get navbarOpacity => 'Anhryloywder Navbar';

  @override
  String get navbarColor => 'Lliw Navbar';

  @override
  String get gray => 'Llwyd';

  @override
  String get darkBlue => 'Glas Tywyll';

  @override
  String get purple => 'Porffor';

  @override
  String get teal => 'Corhwyaid';

  @override
  String get navy => 'Llynges';

  @override
  String get charcoal => 'Golosg';

  @override
  String get brown => 'Brown';

  @override
  String get darkRed => 'Coch Tywyll';

  @override
  String get darkGreen => 'Gwyrdd Tywyll';

  @override
  String get slate => 'Llechen';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Arddangosfa Llyfrgell';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Mân-lun';

  @override
  String get bannerLabel => 'Baner';

  @override
  String get overridePerLibrarySettings =>
      'Diystyru Gosodiadau Fesul Llyfrgell';

  @override
  String get applyImageTypeToAllLibraries =>
      'Cymhwyso math o ddelwedd i bob llyfrgell';

  @override
  String get multiServerLibraries => 'Llyfrgelloedd Aml-Gweinydd';

  @override
  String get showLibrariesFromAllServers =>
      'Dangos llyfrgelloedd o bob gweinydd cysylltiedig';

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
  String get groupItemsIntoCollections => 'Grwpio Eitemau\'n Gasgliadau';

  @override
  String get hideCollectionAssociatedItems =>
      'Cuddio eitemau llyfrgell sy\'n perthyn i gasgliad wrth bori drwy lyfrgelloedd';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Hysbysiad Grwpio Llyfrgell';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'I ddefnyddio\'r gosodiad hwn, gwnewch yn siŵr bod gosodiadau Llyfrgell \"Grwpio ffilmiau\'n gasgliadau\" a/neu \"Grwpio sioeau\'n gasgliadau\" wedi\'u galluogi o dan osodiadau Dangos eich llyfrgell ar eich gweinydd Jellyfin neu Emby.';

  @override
  String get libraryVisibility => 'Gwelededd Llyfrgell';

  @override
  String get libraryVisibilityDescription =>
      'Toglo gwelededd tudalen gartref fesul llyfrgell. Ailgychwyn Moonfin i newidiadau ddod i rym.';

  @override
  String get showInNavigation => 'Dangos yn llywio';

  @override
  String get showInLatestMedia => 'Dangoswch yn y cyfryngau diweddaraf';

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
  String get sourceLibraries => 'Llyfrgelloedd Ffynhonnell';

  @override
  String get sourceCollections => 'Casgliadau Ffynonellau';

  @override
  String get excludedGenres => 'Genres Eithriedig';

  @override
  String get selectAll => 'Dewiswch Pawb';

  @override
  String itemsSelected(int count) {
    return '$count wedi\'i ddewis';
  }

  @override
  String get mediaBar => 'Bar Cyfryngau';

  @override
  String get mediaSources => 'Ffynonellau Cyfryngau';

  @override
  String get behavior => 'Ymddygiad';

  @override
  String get seconds => 'eiliadau';

  @override
  String get mediaBarMode => 'Arddull Bar Cyfryngau';

  @override
  String get mediaBarModeDescription =>
      'Dewiswch rhwng gwahanol arddulliau bar cyfryngau, neu diffoddwch y bar cyfryngau';

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
  String get mediaBarModeOff => 'I ffwrdd';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Galluogi Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Dangos sioe sleidiau cynnwys dan sylw ar y cartref';

  @override
  String get contentType => 'Math o Gynnwys';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Ffilmiau a Sioeau Teledu';

  @override
  String get moviesOnly => 'Ffilmiau yn Unig';

  @override
  String get tvShowsOnly => 'Sioeau Teledu yn Unig';

  @override
  String get itemCount => 'Cyfrif Eitem';

  @override
  String get noneSelected => 'Dim wedi\'i ddewis';

  @override
  String get noneExcluded => 'Dim wedi\'u heithrio';

  @override
  String get autoAdvance => 'Auto Ymlaen';

  @override
  String get autoAdvanceSlides => 'Symud ymlaen yn awtomatig i\'r sleid nesaf';

  @override
  String get autoAdvanceInterval => 'Cyfwng Ymlaen Llaw';

  @override
  String get trailerPreview => 'Rhagolwg Trelar';

  @override
  String get autoPlayTrailers =>
      'Trelars chwarae\'n awtomatig yn y bar cyfryngau ar ôl 3 eiliad';

  @override
  String get trailerAudio => 'Sain Rhaghysbysebion';

  @override
  String get enableTrailerAudio =>
      'Galluogi sain ar gyfer rhaghysbysebion yn y bar cyfryngau';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Rhagolwg o Bennod';

  @override
  String get mediaPreview => 'Rhagolwg Cyfryngau';

  @override
  String get episodePreviewDescription =>
      'Chwaraewch ragolwg mewn-lein 30 eiliad ar gardiau â ffocws, hofran neu bwysau hir';

  @override
  String get mediaPreviewDescription =>
      'Chwaraewch ragolwg mewn-lein 30 eiliad ar gardiau â ffocws, hofran neu bwysau hir';

  @override
  String get previewAudio => 'Rhagolwg Sain';

  @override
  String get enablePreviewAudio =>
      'Galluogi sain ar gyfer rhagolygiadau rhaghysbysebion a rhaghysbysebion';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Cyfryngau Diweddaraf';

  @override
  String get recentlyReleased => 'Rhyddhawyd yn Ddiweddar';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Fy Cyfryngau';

  @override
  String get myMediaSmall => 'Fy Nghyfryngau (Bach)';

  @override
  String get continueWatching => 'Parhewch i Wylio';

  @override
  String get resumeAudio => 'Ail-ddechrau Sain';

  @override
  String get resumeBooks => 'Ail-ddechrau Llyfrau';

  @override
  String get activeRecordings => 'Recordiadau Gweithredol';

  @override
  String get playlists => 'Rhestrau chwarae';

  @override
  String get liveTV => 'Teledu byw';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Ailosod i ragosodiadau';

  @override
  String get homeRowPosterSize => 'Maint Poster Rhes Gartref';

  @override
  String get configureImageTypeForEachRow =>
      'Ffurfweddu math o ddelwedd ar gyfer pob rhes gartref sydd wedi\'i galluogi';

  @override
  String get mergeContinueWatchingAndNextUp => 'Uno Parhau i Gwylio a Nesaf Up';

  @override
  String get combineBothRows => 'Cyfunwch y ddwy res yn un adran gartref';

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
  String get fullScreenRows => 'Rhesi Cartref Estynedig';

  @override
  String get fullScreenRowsDescription =>
      'Cyfyngu rhesi cartref i 1 rhes fesul sgrin';

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
  String get perRowSettings => 'Gosodiadau Fesul Rhes';

  @override
  String get autoLogin => 'Mewngofnodi Awtomatig';

  @override
  String get lastUser => 'Defnyddiwr Diwethaf';

  @override
  String get currentUser => 'Defnyddiwr Cyfredol';

  @override
  String get alwaysAuthenticate => 'Dilysu bob amser';

  @override
  String get requirePasswordWithToken =>
      'Angen cyfrinair hyd yn oed gyda tocyn storio';

  @override
  String get confirmExit => 'Cadarnhau Ymadael';

  @override
  String get showConfirmationBeforeExiting => 'Dangos cadarnhad cyn gadael';

  @override
  String get blockContentWithRatings =>
      'Rhwystro cynnwys gyda\'r graddfeydd canlynol:';

  @override
  String get noContentRatingsFound =>
      'Ni chanfuwyd graddfeydd cynnwys ar y gweinydd hwn eto.';

  @override
  String get couldNotLoadServerRatings =>
      'Methu llwytho graddfeydd gweinydd. Yn dangos graddfeydd sydd wedi\'u cadw yn unig.';

  @override
  String get couldNotRefreshRatings =>
      'Methu ag adnewyddu graddfeydd o\'r gweinydd. Yn dangos graddfeydd sydd wedi\'u cadw.';

  @override
  String get enablePinCode => 'Galluogi Cod PIN';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess => 'Mae angen PIN i gael mynediad i\'ch cyfrif';

  @override
  String get changePin => 'Newid PIN';

  @override
  String get setNewPinCode => 'Gosod cod PIN newydd';

  @override
  String get removePin => 'Dileu PIN';

  @override
  String get removePinProtection => 'Dileu amddiffyniad cod PIN';

  @override
  String get screensaver => 'Arbedwr sgrin';

  @override
  String get inAppScreensaver => 'Arbedwr Sgrin Mewn-App';

  @override
  String get enableBuiltInScreensaver => 'Galluogi\'r arbedwr sgrin adeiledig';

  @override
  String get mode => 'Modd';

  @override
  String get libraryArt => 'Celf Llyfrgell';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Cloc';

  @override
  String get timeout => 'Goramser';

  @override
  String minutesShort(int minutes) {
    return '$minutes mun';
  }

  @override
  String get dimmingLevel => 'Lefel pylu';

  @override
  String get maxAgeRating => 'Sgôr Oed Uchaf';

  @override
  String get any => 'Unrhyw';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Angen Sgôr Oedran';

  @override
  String get onlyShowRatedContent => 'Dangos cynnwys sydd â sgôr yn unig';

  @override
  String get displayClockDuringScreensaver =>
      'Arddangos cloc yn ystod arbedwr sgrin';

  @override
  String get clockModeStatic => 'Statig';

  @override
  String get clockModeBouncing => 'Yn bownsio';

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
  String get rottenTomatoesCritics => 'Tomatos pwdr (beirniaid)';

  @override
  String get rottenTomatoesAudience => 'Tomatos pwdr (Cynulleidfa)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritig';

  @override
  String get metacriticUser => 'Metacritig (Defnyddiwr)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Blwch llythyrau';

  @override
  String get myAnimeList => 'FyRhestr Anime';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Ardrethu Cymunedol';

  @override
  String get ratings => 'Graddfeydd';

  @override
  String get additionalRatings => 'Graddfeydd Ychwanegol';

  @override
  String get showMdbListAndTmdbRatings => 'Dangos graddfeydd MDBList a TMDB';

  @override
  String get ratingLabels => 'Labeli Graddio';

  @override
  String get showLabelsNextToIcons => 'Dangos labeli wrth ymyl eiconau graddio';

  @override
  String get ratingBadges => 'Bathodynnau Graddio';

  @override
  String get showDecorativeBadges =>
      'Dangos bathodynnau addurniadol y tu ôl i\'r sgôr';

  @override
  String get episodeRatings => 'Graddau Pennod';

  @override
  String get showRatingsOnEpisodes => 'Dangos graddfeydd ar benodau unigol';

  @override
  String get ratingSources => 'Ffynonellau Graddio';

  @override
  String get ratingSourcesDescription =>
      'Galluogi ac aildrefnu\'r ffynonellau graddio a ddangosir trwy\'r ap';

  @override
  String get pluginDetected => 'Ategyn Wedi\'i Ganfod';

  @override
  String get pluginNotDetected => 'Ategyn Heb ei Ganfod';

  @override
  String get pluginNotDetectedDescription =>
      'Nid yw ategyn gweinydd wedi\'i ganfod ar hyn o bryd. Mae gosodiadau lleol yn dal i ddefnyddio eu gwerthoedd sydd wedi\'u cadw neu eu rhagosodiadau adeiledig.';

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
  String get recentRequests => 'Ceisiadau Diweddar';

  @override
  String get recentlyAdded => 'Ychwanegwyd yn Ddiweddar';

  @override
  String get trending => 'Tueddu';

  @override
  String get popularMovies => 'Ffilmiau Poblogaidd';

  @override
  String get movieGenres => 'Genres Ffilm';

  @override
  String get upcomingMovies => 'Ffilmiau i ddod';

  @override
  String get studios => 'Stiwdios';

  @override
  String get popularSeries => 'Cyfres Boblogaidd';

  @override
  String get seriesGenres => 'Genres Cyfres';

  @override
  String get upcomingSeries => 'Cyfres i ddod';

  @override
  String get networks => 'Rhwydweithiau';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Rhesi Darganfod Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'Ailosod rhesi i ragosodiadau';

  @override
  String get enableSeerr => 'Galluogi Seerr';

  @override
  String get showSeerrInNavigation =>
      'Dangos Seerr wrth lywio (angen ategyn gweinydd)';

  @override
  String get seerrUnavailable =>
      'Ddim ar gael oherwydd bod cefnogaeth ategyn gweinydd Seerr wedi\'i analluogi.';

  @override
  String get nsfwFilter => 'Hidlydd NSFW';

  @override
  String get hideAdultContent => 'Cuddio cynnwys oedolion yn y canlyniadau';

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
  String get seerrNotificationsSection => 'Hysbysiadau';

  @override
  String get seerrNotifyNewRequestsTitle => 'Hysbysiadau cais newydd';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Rhoi gwybod i mi pan fydd rhywun yn cyflwyno cais';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Diweddariadau ceisiadau';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Wedi\'i gymeradwyo, ei wrthod, a\'i ychwanegu at eich llyfrgell';

  @override
  String get seerrNotifyIssuesTitle => 'Diweddariadau materion';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Materion newydd, atebion a datrysiadau';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Wedi mewngofnodi fel: $username';
  }

  @override
  String get discoverRows => 'Tudalen Ddarganfod Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Galluogwch resi i\'w gweld ar brif dudalen Seerr. Llusgwch i aildrefnu. Mae\'r drefn bersonol yn cydweddu â Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Galluogwch resi i\'w gweld ar brif dudalen Seerr. Llusgwch i aildrefnu. Mae\'r drefn bersonol yn cydweddu â Moonbase.';

  @override
  String get enabled => 'Wedi\'i alluogi';

  @override
  String get hidden => 'Cudd';

  @override
  String get aboutTitle => 'Ynghylch';

  @override
  String versionValue(String version) {
    return 'Fersiwn $version';
  }

  @override
  String get openSourceLicenses => 'Trwyddedau Ffynhonnell Agored';

  @override
  String get sourceCode => 'Cod Ffynhonnell';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Gwiriwch am Ddiweddariadau Nawr';

  @override
  String get checksLatestDesktopRelease =>
      'Yn gwirio\'r datganiad bwrdd gwaith diweddaraf ar gyfer y platfform hwn';

  @override
  String get youAreUpToDate => 'Rydych chi\'n gyfoes.';

  @override
  String get couldNotCheckForUpdates =>
      'Methu gwirio am ddiweddariadau ar hyn o bryd.';

  @override
  String get noCompatibleUpdate =>
      'Ni chanfuwyd pecyn diweddaru cydnaws ar gyfer y platfform hwn.';

  @override
  String get updateChecksNotSupported =>
      'Ni chefnogir gwiriadau diweddaru ar y platfform hwn.';

  @override
  String get updateNotificationsDisabled =>
      'Mae hysbysiadau diweddaru wedi\'u hanalluogi.';

  @override
  String get pleaseWaitBeforeChecking => 'Arhoswch cyn gwirio eto.';

  @override
  String get latestUpdateAlreadyShown =>
      'Mae\'r diweddariad diweddaraf eisoes wedi\'i ddangos.';

  @override
  String get updateAvailable => 'Diweddariad ar gael.';

  @override
  String updateAvailableVersion(String version) {
    return 'Diweddariad ar gael: v$version';
  }

  @override
  String get updateNotifications => 'Diweddaru Hysbysiadau';

  @override
  String get showWhenUpdatesAvailable =>
      'Dangos pryd mae diweddariadau ar gael';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Ar gael';
  }

  @override
  String get readReleaseNotes => 'Darllenwch Nodiadau Rhyddhau';

  @override
  String get downloadingUpdate => 'Wrthi\'n lawrlwytho diweddariad…';

  @override
  String get updateDownloadFailed =>
      'Wedi methu lawrlwytho\'r diweddariad. Ceisiwch eto.';

  @override
  String get openReleasesPage => 'Tudalen Rhyddhau Agored';

  @override
  String get navigation => 'Mordwyo';

  @override
  String get watchedIndicatorsBackdrops => 'Dangosyddion gwylio, cefndiroedd';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Lliw ffocws, dangosyddion gwylio, cefndiroedd';

  @override
  String get navbarStyleToolbarAppearance =>
      'Arddull bar llywio, botymau bar offer, ymddangosiad';

  @override
  String get featuredContentAppearance => 'Cynnwys dan sylw, ymddangosiad';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Terfyn storfa ddelweddau';

  @override
  String get clearImageCache => 'Clirio\'r storfa ddelweddau';

  @override
  String get imageCacheCleared => 'Storfa ddelweddau wedi\'i chlirio';

  @override
  String get clear => 'Clirio';

  @override
  String get browse => 'Pori';

  @override
  String get noResults => 'Dim canlyniadau';

  @override
  String get seerrAvailableStatus => 'Ar gael';

  @override
  String get seerrRequestedStatus => 'Gofynwyd';

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
    return 'Wrthi\'n lawrlwytho · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Wrthi\'n mewnforio';

  @override
  String itemsCount(int count) {
    return '$count Eitemau';
  }

  @override
  String get seerrSettings => 'Gosodiadau Seerr';

  @override
  String get requestMore => 'Cais Mwy';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Cais';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Canslo Cais';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Chwarae yn Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Cais gan $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Cymeradwyo';

  @override
  String get declineAction => 'Dirywiad';

  @override
  String get similar => 'Tebyg';

  @override
  String get recommendations => 'Argymhellion';

  @override
  String cancelRequestForTitle(String title) {
    return 'Canslo cais am \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Canslo ceisiadau $count am \"$title\"?';
  }

  @override
  String get keep => 'Cadw';

  @override
  String get itemNotFoundInLibrary =>
      'Ni chanfuwyd yr eitem yn eich llyfrgell Moonfin';

  @override
  String get errorSearchingLibrary => 'Gwall wrth chwilio\'r llyfrgell';

  @override
  String budgetAmount(String amount) {
    return 'Cyllideb: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Refeniw: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Cais $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Cyflwyno Cais';

  @override
  String get allSeasons => 'Pob Tymhorau';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Dewisiadau Uwch';

  @override
  String get noServiceServersConfigured =>
      'Dim gweinyddion gwasanaeth wedi\'u ffurfweddu';

  @override
  String get server => 'Gweinydd';

  @override
  String get qualityProfile => 'Proffil Ansawdd';

  @override
  String get rootFolder => 'Ffolder Gwraidd';

  @override
  String get showMore => 'Dangos Mwy';

  @override
  String get appearances => 'Ymddangosiadau';

  @override
  String get crewSection => 'Criw';

  @override
  String ageValue(int age) {
    return 'oed $age';
  }

  @override
  String get noRequests => 'Dim ceisiadau';

  @override
  String get pendingStatus => 'Arfaeth';

  @override
  String get declinedStatus => 'Gwrthod';

  @override
  String get partiallyAvailable => 'Ar Gael yn Rhannol';

  @override
  String get downloadingStatus => 'Wrthi\'n llwytho i lawr';

  @override
  String get approvedStatus => 'Cymeradwy';

  @override
  String get notRequestedStatus => 'Heb ei Ofyn';

  @override
  String get blocklistedStatus => 'Wedi\'i rwystro';

  @override
  String get deletedStatus => 'Wedi\'i ddileu';

  @override
  String get failedStatus => 'Wedi methu';

  @override
  String get processingStatus => 'Wrthi\'n prosesu';

  @override
  String modifiedByName(String name) {
    return 'Wedi\'i addasu gan $name';
  }

  @override
  String get completedStatus => 'Wedi\'i gwblhau';

  @override
  String get requestErrorDuplicate => 'Gwnaethpwyd cais am y teitl hwn eisoes';

  @override
  String get requestErrorQuota => 'Wedi cyrraedd y terfyn ceisiadau';

  @override
  String get requestErrorBlocklisted => 'Mae\'r teitl hwn ar y rhestr rwystro';

  @override
  String get requestErrorNoSeasons =>
      'Does dim tymhorau ar ôl i wneud cais amdanynt';

  @override
  String get requestErrorPermission =>
      'Does gennych chi ddim caniatâd i wneud y cais hwn';

  @override
  String get seerrRequestsTitle => 'Ceisiadau';

  @override
  String get seerrIssuesTitle => 'Materion';

  @override
  String get sortNewest => 'Diweddaraf';

  @override
  String get sortLastModified => 'Wedi\'i Addasu Ddiwethaf';

  @override
  String get noIssues => 'Dim materion';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining o $limit cais am ffilm ar ôl';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining o $limit cais am dymor ar ôl';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Rhan o $name';
  }

  @override
  String get viewCollection => 'Gweld y Casgliad';

  @override
  String get requestCollection => 'Gwneud Cais am y Casgliad';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total ffilm · $available ar gael';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Gwneud cais am $count ffilm';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Wrthi\'n gwneud cais am $current o $total…';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Wedi gwneud cais am $count ffilm';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Wedi gwneud cais am $ok o $total ffilm';
  }

  @override
  String get collectionAllRequested =>
      'Mae pob ffilm ar gael neu wedi\'i cheisio eisoes';

  @override
  String get reportIssue => 'Adrodd Mater';

  @override
  String get issueTypeVideo => 'Fideo';

  @override
  String get issueTypeAudio => 'Sain';

  @override
  String get whatsWrong => 'Beth sy\'n bod?';

  @override
  String get allEpisodes => 'Pob Pennod';

  @override
  String get episode => 'Pennod';

  @override
  String get openStatus => 'Ar agor';

  @override
  String get resolvedStatus => 'Wedi\'i ddatrys';

  @override
  String get resolveAction => 'Datrys';

  @override
  String get reopenAction => 'Ailagor';

  @override
  String reportedByName(String name) {
    return 'Wedi\'i adrodd gan $name';
  }

  @override
  String commentsCount(int count) {
    return '$count sylw';
  }

  @override
  String get addComment => 'Ychwanegu sylw';

  @override
  String get deleteIssueConfirm => 'Dileu\'r mater hwn?';

  @override
  String get submitReport => 'Cyflwyno\'r Adroddiad';

  @override
  String get tmdbScore => 'Sgôr TMDB';

  @override
  String get releaseDateLabel => 'Dyddiad Rhyddhau';

  @override
  String get firstAirDateLabel => 'Dyddiad Awyr Cyntaf';

  @override
  String get revenueLabel => 'Refeniw';

  @override
  String get runtimeLabel => 'Amser rhedeg';

  @override
  String get budgetLabel => 'Cyllideb';

  @override
  String get originalLanguageLabel => 'Iaith Wreiddiol';

  @override
  String get seasonsLabel => 'Tymhorau';

  @override
  String get episodesLabel => 'Penodau';

  @override
  String get access => 'Mynediad';

  @override
  String get add => 'Ychwanegu';

  @override
  String get address => 'Cyfeiriad';

  @override
  String get analytics => 'Dadansoddeg';

  @override
  String get catalog => 'Catalog';

  @override
  String get content => 'Cynnwys';

  @override
  String get copy => 'Copi';

  @override
  String get create => 'Creu';

  @override
  String get disable => 'Analluogi';

  @override
  String get done => 'Gorffen';

  @override
  String get edit => 'Golygu';

  @override
  String get encoding => 'Amgodio';

  @override
  String get error => 'Gwall';

  @override
  String get forward => 'Ymlaen';

  @override
  String get general => 'Cyffredinol';

  @override
  String get go => 'Ewch';

  @override
  String get install => 'Gosod';

  @override
  String get installed => 'Wedi\'i osod';

  @override
  String get interval => 'Cyfwng';

  @override
  String get name => 'Enw';

  @override
  String get networking => 'Rhwydweithio';

  @override
  String get next => 'Nesaf';

  @override
  String get path => 'Llwybr';

  @override
  String get paused => 'Wedi seibio';

  @override
  String get permissions => 'Caniatadau';

  @override
  String get processing => 'Prosesu';

  @override
  String get profile => 'Proffil';

  @override
  String get provider => 'Darparwr';

  @override
  String get refresh => 'Adnewyddu';

  @override
  String get remote => 'Rheolydd pell';

  @override
  String get rename => 'Ailenwi';

  @override
  String get revoke => 'Dirymu';

  @override
  String get role => 'Rôl';

  @override
  String get root => 'Gwraidd';

  @override
  String get run => 'Rhedeg';

  @override
  String get search => 'Chwilio';

  @override
  String get select => 'Dewiswch';

  @override
  String get send => 'Anfon';

  @override
  String get sessions => 'Sesiynau';

  @override
  String get set => 'Gosod';

  @override
  String get status => 'Statws';

  @override
  String get stop => 'Stopio';

  @override
  String get streaming => 'Ffrydio';

  @override
  String get time => 'Amser';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Dadosod';

  @override
  String get up => 'I fyny';

  @override
  String get update => 'Diweddariad';

  @override
  String get upload => 'Llwytho i fyny';

  @override
  String get unmute => 'Dad-dewi';

  @override
  String get mute => 'Distewi';

  @override
  String get branding => 'Brandio';

  @override
  String get adminDrawerDashboard => 'Dangosfwrdd';

  @override
  String get adminDrawerAnalytics => 'Dadansoddeg';

  @override
  String get adminDrawerSettings => 'Gosodiadau';

  @override
  String get adminDrawerBranding => 'Brandio';

  @override
  String get adminDrawerUsers => 'Defnyddwyr';

  @override
  String get adminDrawerLibraries => 'Llyfrgelloedd';

  @override
  String get adminDrawerDisplay => 'Dangos';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'Gosodiadau NFO';

  @override
  String get adminDrawerTranscoding => 'Trawsgodio';

  @override
  String get adminDrawerResume => 'Parhau';

  @override
  String get adminDrawerStreaming => 'Ffrydio';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Dyfeisiau';

  @override
  String get adminDrawerActivity => 'Gweithgaredd';

  @override
  String get adminDrawerNetworking => 'Rhwydweithio';

  @override
  String get adminDrawerApiKeys => 'Allweddi API';

  @override
  String get adminDrawerBackups => 'Copïau wrth gefn';

  @override
  String get adminDrawerLogs => 'Logiau';

  @override
  String get adminDrawerScheduledTasks => 'Tasgau wedi\'u Trefnu';

  @override
  String get adminDrawerPlugins => 'Ategion';

  @override
  String get adminDrawerRepositories => 'Storfeydd';

  @override
  String get adminDrawerLiveTv => 'Teledu byw';

  @override
  String get adminExitTooltip => 'Gadael Gweinyddol';

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
  String get adminDashboardLoadFailed => 'Wedi methu llwytho dangosfwrdd';

  @override
  String get adminMediaOverview => 'Trosolwg o\'r Cyfryngau';

  @override
  String get adminMediaTotalsError =>
      'Methu llwytho cyfansymiau cyfryngau gweinydd.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Darlleniad cyflym ar faint o gynnwys sydd ar y gweinydd hwn.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Diweddariadau ategyn ar gael: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Ategion sydd angen ailgychwyn: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Tasgau a drefnwyd wedi methu: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Dosbarthu Cyfryngau';

  @override
  String get analyticsVideoCodecs => 'Codecs Fideo';

  @override
  String get analyticsAudioCodecs => 'Codecs Sain';

  @override
  String get analyticsContainers => 'Cynwysyddion';

  @override
  String get analyticsTopGenres => 'Genres Uchaf';

  @override
  String get analyticsReleaseYears => 'Blynyddoedd Rhyddhau';

  @override
  String get analyticsContentRatings => 'Sgôr Cynnwys';

  @override
  String get analyticsRuntimeBuckets => 'Bwcedi Amser Rhedeg';

  @override
  String get analyticsFileFormats => 'Fformatau Ffeil';

  @override
  String get analyticsNoData => 'Dim Data ar Gael.';

  @override
  String get adminServerInfo => 'Gwybodaeth Gweinydd';

  @override
  String get adminRestartPending => 'Ailgychwyn Arfaeth';

  @override
  String get adminServerPaths => 'Llwybrau Gweinydd';

  @override
  String get adminServerActions => 'Gweithredoedd Gweinydd';

  @override
  String get adminRestartServer => 'Ailgychwyn Gweinydd';

  @override
  String get adminShutdownServer => 'Gweinydd Diffodd';

  @override
  String get adminLibraryScanStarted => 'Sgan llyfrgell wedi dechrau';

  @override
  String errorGeneric(String error) {
    return 'Gwall: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Mae ailgychwyn gweinydd ar y gweill';

  @override
  String get adminServerRebootMessage =>
      'Ailgychwyn gweinydd ar y gweill, ailgychwynwch Moonfin';

  @override
  String get adminActiveSessions => 'Sesiynau Gweithredol';

  @override
  String get adminSessionsLoadFailed => 'Wedi methu llwytho sesiynau';

  @override
  String get adminNoActiveSessions => 'Dim sesiynau gweithredol';

  @override
  String get adminRecentActivity => 'Gweithgarwch Diweddar';

  @override
  String get adminNoRecentActivity => 'Dim gweithgaredd diweddar';

  @override
  String adminCommandFailed(String error) {
    return 'Methodd y gorchymyn: $error';
  }

  @override
  String get adminSendMessage => 'Anfon Neges';

  @override
  String get adminMessageTextHint => 'Neges testun';

  @override
  String get adminSetVolume => 'Gosod Cyfrol';

  @override
  String get sessionPrev => 'Cynt';

  @override
  String get sessionRewind => 'Ailddirwyn';

  @override
  String get sessionForward => 'Ymlaen';

  @override
  String get sessionNext => 'Nesaf';

  @override
  String get sessionVolumeDown => 'Vol -';

  @override
  String get sessionVolumeUp => 'Sain +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Yn Chwarae Nawr';

  @override
  String get volume => 'Lefel sain';

  @override
  String get actions => 'Gweithredoedd';

  @override
  String get videoCodec => 'Codec Fideo';

  @override
  String get audioCodec => 'Codec Sain';

  @override
  String get hwAccel => 'Cyflymu Caledwedd';

  @override
  String get completion => 'Cwblhau';

  @override
  String get adminClearDates => 'Dyddiadau clir';

  @override
  String get adminActivitySeverityAll => 'Pob difrifoldeb';

  @override
  String get adminActivityDateRange => 'Ystod dyddiadau';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Wedi methu llwytho\'r log gweithgarwch: $error';
  }

  @override
  String get adminNoActivityEntries => 'Dim cofnodion gweithgaredd';

  @override
  String get adminEditDeviceName => 'Golygu Enw\'r Dyfais';

  @override
  String get adminCustomName => 'Enw Personol';

  @override
  String get adminDeviceNameUpdated => 'Enw dyfais wedi\'i ddiweddaru';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Wedi methu diweddaru dyfais: $error';
  }

  @override
  String get adminDeleteDevice => 'Dileu Dyfais';

  @override
  String get adminDeviceDeleted => 'Dyfais wedi\'i dileu';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Wedi methu dileu dyfais: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Tynnu\'r ddyfais \'$name\'? Bydd angen i\'r defnyddiwr fewngofnodi eto ar y ddyfais hon.';
  }

  @override
  String get adminDeleteAllDevices => 'Dileu pob dyfais';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Tynnu $count dyfais? Bydd angen i\'r defnyddwyr yr effeithir arnynt fewngofnodi eto. Nid effeithir ar eich dyfais bresennol.';
  }

  @override
  String get adminDevicesDeletedAll => 'Dyfeisiau wedi\'u tynnu';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Tynnwyd rhai dyfeisiau; nid oedd modd tynnu $count.';
  }

  @override
  String get adminDevicesLoadFailed => 'Wedi methu llwytho dyfeisiau';

  @override
  String get adminSearchDevices => 'Chwilio dyfeisiau';

  @override
  String get adminThisDevice => 'Mae\'r Dyfais hon';

  @override
  String get adminEditName => 'Golygu Enw';

  @override
  String get adminLibrariesLoadFailed => 'Wedi methu llwytho llyfrgelloedd';

  @override
  String get adminNoLibraries => 'Dim llyfrgelloedd wedi\'u ffurfweddu';

  @override
  String get adminScanAllLibraries => 'Sganio Pob Llyfrgell';

  @override
  String get adminAddLibrary => 'Ychwanegu Llyfrgell';

  @override
  String adminScanFailed(String error) {
    return 'Wedi methu cychwyn y sgan: $error';
  }

  @override
  String get adminRenameLibrary => 'Ailenwi Llyfrgell';

  @override
  String get adminNewName => 'Enw newydd';

  @override
  String adminLibraryRenamed(String name) {
    return 'Ailenwyd y llyfrgell yn \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Wedi methu ag ailenwi: $error';
  }

  @override
  String get adminDeleteLibrary => 'Dileu Llyfrgell';

  @override
  String adminLibraryDeleted(String name) {
    return 'Llyfrgell \"$name\" wedi\'i dileu';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Wedi methu dileu\'r llyfrgell: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Wedi methu ag ychwanegu llwybr: $error';
  }

  @override
  String get adminRemovePath => 'Dileu Llwybr';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Tynnu \"$path\" o\'r llyfrgell hon?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Wedi methu tynnu\'r llwybr: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Wedi methu llwytho\'r llyfrgell';

  @override
  String get adminNoMediaPaths => 'Dim llwybrau cyfryngau wedi\'u ffurfweddu';

  @override
  String get adminAddPath => 'Ychwanegu Llwybr';

  @override
  String get adminBrowseFilesystem => 'Pori system ffeiliau gweinydd:';

  @override
  String get adminPreferredMetadataLanguage => 'Dewis iaith metadata';

  @override
  String get adminMetadataLanguageHint => 'e.e. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadata cod gwlad';

  @override
  String get adminMetadataCountryHint => 'e.e. Unol Daleithiau, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Llwybrau';

  @override
  String get adminLibraryTabOptions => 'Opsiynau';

  @override
  String get adminLibraryTabDownloaders => 'Lawrlwythwyr';

  @override
  String get adminLibMetadataSavers => 'Cadwyr metadata';

  @override
  String get adminLibSubtitleDownloaders => 'Lawrlwythwyr isdeitlau';

  @override
  String get adminLibLyricDownloaders => 'Lawrlwythwyr geiriau caneuon';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Lawrlwythwyr metadata: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Estynwyr delweddau: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Nid yw\'r gweinydd hwn yn cynnig lawrlwythwyr ar gyfer y math hwn o lyfrgell.';

  @override
  String get adminLibrarySectionGeneral => 'Cyffredinol';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Gwybodaeth Fewnblanedig';

  @override
  String get adminLibrarySectionSubtitles => 'Isdeitlau';

  @override
  String get adminLibrarySectionImages => 'Delweddau';

  @override
  String get adminLibrarySectionSeries => 'Cyfresi';

  @override
  String get adminLibrarySectionMusic => 'Cerddoriaeth';

  @override
  String get adminLibrarySectionMovies => 'Ffilmiau';

  @override
  String get adminLibRealtimeMonitor => 'Galluogi monitro amser real';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Canfod newidiadau i ffeiliau a\'u prosesu\'n awtomatig.';

  @override
  String get adminLibEnablePhotos => 'Dangos lluniau';

  @override
  String get adminLibSaveLocalMetadata =>
      'Cadw gwaith celf yn y ffolderi cyfryngau';

  @override
  String get adminLibRefreshInterval => 'Adnewyddu metadata\'n awtomatig';

  @override
  String get adminLibRefreshNever => 'Byth';

  @override
  String get adminLibDefault => 'Rhagosodedig';

  @override
  String get adminLibDisplayTitle => 'Dangos';

  @override
  String get adminLibDisplaySection => 'Dangos y llyfrgell';

  @override
  String get adminLibFolderView =>
      'Dangos golwg ffolder i ddangos ffolderi cyfryngau plaen';

  @override
  String get adminLibSpecialsInSeasons =>
      'Dangos penodau arbennig o fewn y tymhorau y cawsant eu darlledu ynddynt';

  @override
  String get adminLibGroupMovies => 'Grwpio ffilmiau\'n gasgliadau';

  @override
  String get adminLibGroupShows => 'Grwpio sioeau\'n gasgliadau';

  @override
  String get adminLibExternalSuggestions =>
      'Dangos cynnwys allanol mewn awgrymiadau';

  @override
  String get adminLibDateAddedSection => 'Ymddygiad y dyddiad ychwanegu';

  @override
  String get adminLibDateAddedLabel => 'Defnyddio\'r dyddiad ychwanegu o';

  @override
  String get adminLibDateAddedImport =>
      'Y dyddiad y\'i sganiwyd i\'r llyfrgell';

  @override
  String get adminLibDateAddedFile => 'Y dyddiad y crëwyd y ffeil';

  @override
  String get adminLibMetadataTitle => 'Metadata a Delweddau';

  @override
  String get adminLibMetadataLangSection => 'Iaith fetadata ddewisol';

  @override
  String get adminLibChaptersSection => 'Penodau';

  @override
  String get adminLibDummyChapterDuration => 'Hyd penodau ffug (eiliadau)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Hyd y penodau a gynhyrchir ar gyfer cyfryngau heb rai. Gosodwch i 0 i\'w analluogi.';

  @override
  String get adminLibChapterImageResolution => 'Cydraniad delweddau penodau';

  @override
  String get adminLibNfoTitle => 'Gosodiadau NFO';

  @override
  String get adminLibNfoHelp =>
      'Mae metadata NFO yn gydnaws â Kodi a chleientiaid tebyg. Mae\'r gosodiadau\'n berthnasol i bob llyfrgell sy\'n cadw metadata NFO.';

  @override
  String get adminLibKodiUser =>
      'Y defnyddiwr y cedwir data gwylio ar ei gyfer mewn ffeiliau NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Cadw llwybrau delweddau o fewn ffeiliau NFO';

  @override
  String get adminLibPathSubstitution =>
      'Galluogi amnewid llwybrau ar gyfer llwybrau delweddau NFO';

  @override
  String get adminLibExtraThumbs =>
      'Copïo delweddau extrafanart i ffolder extrathumbs';

  @override
  String get adminLibNone => 'Dim';

  @override
  String adminLibRefreshDays(int days) {
    return '$days diwrnod';
  }

  @override
  String get adminLibEmbeddedTitles => 'Defnyddio teitlau mewnblanedig';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Defnyddio teitlau mewnblanedig ar gyfer ychwanegion';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Defnyddio gwybodaeth fewnblanedig am benodau';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Caniatáu isdeitlau mewnblanedig';

  @override
  String get adminLibEmbeddedAllowAll => 'Caniatáu pob un';

  @override
  String get adminLibEmbeddedAllowText => 'Testun yn unig';

  @override
  String get adminLibEmbeddedAllowImage => 'Delwedd yn unig';

  @override
  String get adminLibEmbeddedAllowNone => 'Dim';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Hepgor y lawrlwythiad os oes isdeitlau mewnblanedig yn bresennol';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Hepgor y lawrlwythiad os yw\'r trac sain yn cyfateb i iaith y lawrlwythiad';

  @override
  String get adminLibRequirePerfectMatch =>
      'Mynnu bod yr isdeitlau\'n cyfateb yn berffaith';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Cadw isdeitlau yn y ffolderi cyfryngau';

  @override
  String get adminLibChapterImageExtraction => 'Echdynnu delweddau penodau';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Echdynnu delweddau penodau yn ystod sgan y llyfrgell';

  @override
  String get adminLibTrickplayExtraction =>
      'Galluogi echdynnu delweddau Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Echdynnu delweddau Trickplay yn ystod sgan y llyfrgell';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Cadw delweddau Trickplay yn y ffolderi cyfryngau';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Uno cyfresi sydd wedi\'u gwasgaru ar draws sawl ffolder yn awtomatig';

  @override
  String get adminLibSeasonZeroName => 'Enw dangos tymor sero';

  @override
  String get adminLibLufsScan =>
      'Galluogi sgan LUFS ar gyfer normaleiddio sain';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Ffafrio\'r tag artistiaid ansafonol';

  @override
  String get adminLibAutoAddToCollection =>
      'Ychwanegu ffilmiau at gasgliadau\'n awtomatig';

  @override
  String get adminLibraryNameRequired => 'Mae angen enw\'r llyfrgell';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Wedi methu creu llyfrgell: $error';
  }

  @override
  String get adminLibraryName => 'Enw\'r Llyfrgell';

  @override
  String get adminSelectedPaths => 'Llwybrau a Ddewiswyd:';

  @override
  String get adminCreateLibrary => 'Creu Llyfrgell';

  @override
  String get paths => 'Llwybrau:';

  @override
  String get adminDisableUser => 'Analluogi Defnyddiwr';

  @override
  String get adminEnableUser => 'Galluogi Defnyddiwr';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Analluogi $name? Ni fyddant yn gallu mewngofnodi.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Galluogi $name? Byddant yn gallu mewngofnodi eto.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Defnyddiwr \"$name\" wedi\'i analluogi';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Defnyddiwr \"$name\" wedi\'i alluogi';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Wedi methu diweddaru polisi defnyddwyr: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Wedi methu llwytho defnyddwyr';

  @override
  String get adminSearchUsers => 'Chwilio defnyddwyr';

  @override
  String get adminEditUser => 'Golygu Defnyddiwr';

  @override
  String get adminAddUser => 'Ychwanegu Defnyddiwr';

  @override
  String adminUserCreateFailed(String error) {
    return 'Wedi methu â chreu defnyddiwr: $error';
  }

  @override
  String get adminCreateUser => 'Creu Defnyddiwr';

  @override
  String get adminPasswordOptional => 'Cyfrinair (dewisol)';

  @override
  String get adminUsernameRequired => 'Ni all enw defnyddiwr fod yn wag';

  @override
  String adminSaveFailed(String error) {
    return 'Wedi methu cadw: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Nid yw cyfrineiriau yn cyfateb';

  @override
  String adminFailed(String error) {
    return 'Wedi methu: $error';
  }

  @override
  String get adminUserLoadFailed => 'Wedi methu llwytho defnyddiwr';

  @override
  String get adminDeleteUser => 'Dileu Defnyddiwr';

  @override
  String get admin => 'Gweinyddol';

  @override
  String get adminFullAccessWarning =>
      'Mae gan weinyddwyr fynediad cyflawn i\'r gweinydd. Caniatâ gyda gofal.';

  @override
  String get administrator => 'Gweinyddwr';

  @override
  String get adminHiddenUser => 'Defnyddiwr cudd';

  @override
  String get adminAllowMediaPlayback => 'Caniatáu chwarae cyfryngau yn ôl';

  @override
  String get adminAllowAudioTranscoding => 'Caniatáu trawsgodio sain';

  @override
  String get adminAllowVideoTranscoding => 'Caniatáu trawsgodio fideo';

  @override
  String get adminAllowRemuxing => 'Caniatáu remuxing';

  @override
  String get adminForceRemoteTranscoding =>
      'Gorfodi trawsgodio ffynhonnell bell';

  @override
  String get adminAllowContentDownloading => 'Caniatáu lawrlwytho cynnwys';

  @override
  String get adminAllowPublicSharing => 'Caniatáu rhannu cyhoeddus';

  @override
  String get adminAllowRemoteControl =>
      'Caniatáu rheoli o bell o ddefnyddwyr eraill';

  @override
  String get adminAllowSharedDeviceControl => 'Caniatáu rheoli dyfais a rennir';

  @override
  String get adminAllowRemoteAccess => 'Caniatáu mynediad o bell';

  @override
  String get adminLeaveEmptyNoLimit => 'Gadael yn wag am ddim terfyn';

  @override
  String get adminMaxActiveSessions => 'Uchafswm sesiynau gweithredol';

  @override
  String get adminAllowLiveTvAccess => 'Caniatáu mynediad Live TV';

  @override
  String get adminAllowLiveTvManagement => 'Caniatáu rheoli Teledu Byw';

  @override
  String get adminAllowCollectionManagement => 'Caniatáu rheoli casgliadau';

  @override
  String get adminAllowSubtitleManagement => 'Caniatáu rheoli is-deitlau';

  @override
  String get adminAllowLyricManagement => 'Caniatáu rheoli telynegion';

  @override
  String get adminEnableAllLibraryAccess => 'Galluogi mynediad i bob llyfrgell';

  @override
  String get adminChangePassword => 'Newid Cyfrinair';

  @override
  String get adminNewPassword => 'Cyfrinair Newydd';

  @override
  String get adminConfirmPassword => 'Cadarnhau Cyfrinair';

  @override
  String get adminSetPassword => 'Gosod Cyfrinair';

  @override
  String get adminResetPassword => 'Ailosod Cyfrinair';

  @override
  String get adminPasswordReset => 'Ailosod cyfrinair';

  @override
  String get adminPasswordUpdated => 'Cyfrinair wedi\'i ddiweddaru';

  @override
  String get adminUserSettings => 'Gosodiadau Defnyddiwr';

  @override
  String get adminLibraryAccess => 'Mynediad Llyfrgell';

  @override
  String get adminEnableAllDevices => 'Galluogi mynediad i bob dyfais';

  @override
  String get adminEnableAllChannels => 'Galluogi mynediad i bob sianel';

  @override
  String get adminParentalControl => 'Rheolaeth Rieni';

  @override
  String get adminMaxParentalRating =>
      'Uchafswm y dosbarthiad oedran a ganiateir';

  @override
  String get adminMaxParentalRatingHint =>
      'Bydd cynnwys â dosbarthiad uwch yn cael ei guddio rhag y defnyddiwr hwn.';

  @override
  String get adminParentalRatingNone => 'Dim';

  @override
  String get adminBlockUnratedItems =>
      'Rhwystro eitemau heb wybodaeth ddosbarthu, neu â gwybodaeth annealladwy';

  @override
  String get adminUnratedBook => 'Llyfrau';

  @override
  String get adminUnratedChannelContent => 'Sianeli';

  @override
  String get adminUnratedLiveTvChannel => 'Teledu byw';

  @override
  String get adminUnratedMovie => 'Ffilmiau';

  @override
  String get adminUnratedMusic => 'Cerddoriaeth';

  @override
  String get adminUnratedTrailer => 'Rhaghysbysebion';

  @override
  String get adminUnratedSeries => 'Sioeau';

  @override
  String get adminAccessSchedules => 'Amserlenni Mynediad';

  @override
  String get adminAccessSchedulesHint =>
      'Caniatáu mynediad yn ystod yr amserau a drefnwyd isod yn unig. Caniateir mynediad drwy\'r dydd pan na fydd amserlen wedi\'i gosod.';

  @override
  String get adminAddSchedule => 'Ychwanegu Amserlen';

  @override
  String get adminScheduleDay => 'Diwrnod';

  @override
  String get adminScheduleStart => 'Dechrau';

  @override
  String get adminScheduleEnd => 'Diwedd';

  @override
  String get adminDayEveryday => 'Bob dydd';

  @override
  String get adminDayWeekday => 'Diwrnod gwaith';

  @override
  String get adminDayWeekend => 'Penwythnos';

  @override
  String get adminDaySunday => 'Dydd Sul';

  @override
  String get adminDayMonday => 'Dydd Llun';

  @override
  String get adminDayTuesday => 'Dydd Mawrth';

  @override
  String get adminDayWednesday => 'Dydd Mercher';

  @override
  String get adminDayThursday => 'Dydd Iau';

  @override
  String get adminDayFriday => 'Dydd Gwener';

  @override
  String get adminDaySaturday => 'Dydd Sadwrn';

  @override
  String get adminAllowedTags => 'Tagiau a ganiateir';

  @override
  String get adminAllowedTagsHint =>
      'Dim ond cynnwys â\'r tagiau hyn a ddangosir. Gadewch yn wag i ganiatáu pob un.';

  @override
  String get adminBlockedTags => 'Tagiau wedi\'u rhwystro';

  @override
  String get adminBlockedTagsHint =>
      'Mae cynnwys â\'r tagiau hyn yn cael ei guddio rhag y defnyddiwr hwn.';

  @override
  String get adminAddTag => 'Ychwanegu tag';

  @override
  String get adminAuthProvider => 'Darparwr dilysu';

  @override
  String get adminPasswordResetProvider => 'Darparwr ailosod cyfrinair';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Uchafswm y ceisiadau mewngofnodi aflwyddiannus cyn cloi allan';

  @override
  String get adminLoginAttemptsHint =>
      'Gosodwch i 0 ar gyfer y rhagosodiad, neu -1 i analluogi cloi allan.';

  @override
  String get adminSyncPlayAccess => 'Mynediad SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Caniatáu creu grwpiau ac ymuno â nhw';

  @override
  String get adminSyncPlayJoin => 'Caniatáu ymuno â grwpiau';

  @override
  String get adminSyncPlayNone => 'Dim mynediad';

  @override
  String get adminContentDeletionFolders => 'Caniatáu dileu cynnwys o';

  @override
  String get adminResetPasswordWarning =>
      'Bydd hyn yn dileu\'r cyfrinair. Bydd y defnyddiwr yn gallu mewngofnodi heb gyfrinair.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Dychwelodd y gweinydd HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddileu $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Defnyddiwr \"$name\" wedi\'i ddileu';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Wedi methu dileu defnyddiwr: $error';
  }

  @override
  String get adminCreateApiKey => 'Creu Allwedd API';

  @override
  String get adminAppName => 'Enw ap';

  @override
  String get adminApiKeyCreated => 'Allwedd API wedi\'i chreu';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Allwedd wedi\'i chreu\'n llwyddiannus. Ni ddychwelodd y gweinydd y tocyn. Gwiriwch allweddi API gweinydd.';

  @override
  String get adminKeyCopied => 'Copïwyd yr allwedd i\'r clipfwrdd';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Wedi methu creu allwedd: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Tocyn allwedd ar goll o ymateb y gweinydd';

  @override
  String get adminRevokeApiKey => 'Diddymu Allwedd API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Diddymu allwedd ar gyfer $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Allwedd API wedi\'i dirymu';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Wedi methu â dirymu\'r allwedd: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Wedi methu llwytho allweddi API';

  @override
  String get adminApiKeysTitle => 'Allweddi API';

  @override
  String get adminCreateKey => 'Creu Allwedd';

  @override
  String get adminNoApiKeys => 'Ni chanfuwyd allweddi API';

  @override
  String get adminUnknownApp => 'Ap Anhysbys';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Tocyn: $token\\nCrëwyd: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Creu Copi Wrth Gefn';

  @override
  String get adminBackupDatabase => 'Cronfa ddata';

  @override
  String get adminBackupDatabaseAlways => 'Wedi\'i gynnwys bob amser';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Isdeitlau';

  @override
  String get adminBackupTrickplay => 'Delweddau Trickplay';

  @override
  String get adminCreatingBackup => 'Wrthi\'n creu copi wrth gefn…';

  @override
  String get adminBackupCreated => 'Crëwyd copi wrth gefn yn llwyddiannus';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Wedi methu creu copi wrth gefn: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Llwybr wrth gefn ar goll yn ymateb y gweinydd';

  @override
  String adminBackupManifest(String name) {
    return 'Maniffest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Wedi methu llwytho maniffest: $error';
  }

  @override
  String get adminConfirmRestore => 'Cadarnhau Adfer';

  @override
  String get adminRestoringBackup => 'Wrthi\'n adfer copi wrth gefn…';

  @override
  String adminRestoreFailed(String error) {
    return 'Wedi methu ag adfer copi wrth gefn: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Wedi methu llwytho copïau wrth gefn';

  @override
  String get adminCreateBackup => 'Creu copi wrth gefn';

  @override
  String get adminNoBackups => 'Heb ganfod copïau wrth gefn';

  @override
  String get adminViewDetails => 'Gweld Manylion';

  @override
  String get restore => 'Adfer';

  @override
  String get adminLogsLoadFailed => 'Wedi methu llwytho logiau gweinydd';

  @override
  String get adminNoLogFiles => 'Heb ganfod ffeiliau log';

  @override
  String get adminLogCopied => 'Copïwyd y log i\'r clipfwrdd';

  @override
  String get adminSaveLogFile => 'Cadw ffeil log';

  @override
  String adminSavedTo(String path) {
    return 'Wedi\'i gadw i $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Wedi methu cadw\'r ffeil: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Wedi methu llwytho $fileName';
  }

  @override
  String get adminSearchInLog => 'Chwilio mewn log';

  @override
  String get adminNoMatchingLines => 'Dim llinellau cyfatebol';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Wedi methu llwytho tasgau: $error';
  }

  @override
  String get adminNoScheduledTasks =>
      'Ni chanfuwyd unrhyw dasgau wedi\'u hamserlennu';

  @override
  String get adminNoTasksMatchFilter =>
      'Nid oes unrhyw dasgau yn cyfateb i\'r hidlydd cyfredol';

  @override
  String adminTaskStartFailed(String error) {
    return 'Wedi methu cychwyn tasg: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Wedi methu ag atal y dasg: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Wedi methu llwytho tasg: $error';
  }

  @override
  String get adminRunNow => 'Rhedwch Nawr';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Wedi methu cael gwared ar y sbardun: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Wedi methu ag ychwanegu sbardun: $error';
  }

  @override
  String get adminLastExecution => 'Dienyddiad Diweddaf';

  @override
  String get adminTriggers => 'Sbardunau';

  @override
  String get adminAddTrigger => 'Ychwanegu Sbardun';

  @override
  String get adminNoTriggers => 'Dim sbardunau wedi\'u ffurfweddu';

  @override
  String get adminTriggerType => 'Math Sbardun';

  @override
  String get adminNoLimit => 'Dim terfyn';

  @override
  String adminHours(String hours) {
    return '$hours awr(au)';
  }

  @override
  String get adminDayOfWeek => 'Diwrnod yr wythnos';

  @override
  String get adminSearchPlugins => 'Chwilio ategion…';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Wedi methu toglo ategyn: $error';
  }

  @override
  String get adminUninstallPlugin => 'Dadosod Ategyn';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddadosod \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Wedi methu dadosod yr ategyn: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Wedi methu gosod pecyn: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Wedi methu gosod diweddariad: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Wedi methu llwytho ategion: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Nid oes unrhyw ategion yn cyfateb i\'ch chwiliad';

  @override
  String get adminNoPluginsInstalled => 'Dim ategion wedi\'u gosod';

  @override
  String adminInstallUpdate(String version) {
    return 'Gosod diweddariad (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Wedi methu llwytho\'r catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Nid oes unrhyw becynnau yn cyfateb i\'ch chwiliad';

  @override
  String get adminNoPackagesAvailable => 'Dim pecynnau ar gael';

  @override
  String get adminExperimentalIntegration => 'Integreiddio Arbrofol';

  @override
  String get adminExperimentalWarning =>
      'Mae integreiddio gosodiadau ategyn yn dal i fod yn arbrofol. Mae\'n bosibl na fydd rhai tudalennau gosodiadau yn gywir.';

  @override
  String get continueAction => 'Parhewch';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'Bydd \"$name\" yn cael ei ddileu ar ôl ailgychwyn y gweinydd';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Wedi methu â dadosod: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Wrthi\'n diweddaru \"$name\" i v$version…';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Wedi methu llwytho ategyn: $error';
  }

  @override
  String get adminPluginNotFound => 'Heb ganfod yr ategyn';

  @override
  String adminPluginVersion(String version) {
    return 'Fersiwn $version';
  }

  @override
  String get adminEnablePlugin => 'Galluogi Ategyn';

  @override
  String get adminPluginSettingsPage => 'Tudalen gosodiadau ategyn';

  @override
  String get adminRevisionHistory => 'Hanes Adolygu';

  @override
  String get adminNoChangelog => 'Dim changelog ar gael.';

  @override
  String get adminRemoveRepository => 'Dileu Cadwrfa';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddileu \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Wedi methu cadw ystorfeydd: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Wedi methu llwytho storfeydd: $error';
  }

  @override
  String get adminRepositoryNameHint => 'e.e. Stabl Jellyfin';

  @override
  String get adminRepositoryUrl => 'URL y storfa';

  @override
  String get adminAddEntry => 'Ychwanegu cofnod';

  @override
  String get adminInvalidUrl => 'URL annilys';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Methu llwytho gosodiadau\'r ategyn: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Methu agor $uri';
  }

  @override
  String get adminOpenInBrowser => 'Agor yn Porwr';

  @override
  String get adminOpenExternally => 'Agor yn allanol';

  @override
  String get adminGeneralSettings => 'Gosodiadau Cyffredinol';

  @override
  String get adminServerName => 'Enw gweinydd';

  @override
  String get adminPreferredMetadataCountry => 'Y wlad metadata a ffefrir';

  @override
  String get adminCachePath => 'Llwybr storfa';

  @override
  String get adminMetadataPath => 'Llwybr metadata';

  @override
  String get adminLibraryScanConcurrency => 'Llyfrgell sgan arian cyfred';

  @override
  String get adminParallelImageEncodingLimit =>
      'Terfyn amgodio delwedd gyfochrog';

  @override
  String get adminSlowResponseThreshold => 'Trothwy ymateb araf (ms)';

  @override
  String get adminBrandingLoadFailed => 'Wedi methu llwytho gosodiadau brandio';

  @override
  String get adminLoginDisclaimer => 'Ymwadiad mewngofnodi';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML wedi\'i arddangos o dan y ffurflen mewngofnodi';

  @override
  String get adminCustomCss => 'CSS personol';

  @override
  String get adminCustomCssHint =>
      'Cymhwyswyd CSS personol i\'r rhyngwyneb gwe';

  @override
  String get adminEnableSplashScreen => 'Galluogi sgrin sblash';

  @override
  String get adminStreamingLoadFailed =>
      'Wedi methu llwytho gosodiadau ffrydio';

  @override
  String get adminStreamingDescription =>
      'Gosod terfynau cyfradd didau ffrydio byd-eang ar gyfer cysylltiadau o bell.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Terfyn cyfradd didau cleient o bell (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Gadael yn wag neu 0 am anghyfyngedig';

  @override
  String get adminPlaybackLoadFailed =>
      'Wedi methu llwytho gosodiadau chwarae yn ôl';

  @override
  String get adminHardwareAcceleration => 'Cyflymiad caledwedd';

  @override
  String get adminVaapiDevice => 'dyfais VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Galluogi amgodio caledwedd';

  @override
  String get adminEnableHardwareDecoding =>
      'Galluogi dadgodio caledwedd ar gyfer:';

  @override
  String get adminEncodingThreads => 'Edau amgodio';

  @override
  String get adminAutomatic => '0 = awtomatig';

  @override
  String get adminTranscodingTempPath => 'Trawsgodio llwybr dros dro';

  @override
  String get adminEnableFallbackFont => 'Galluogi ffont wrth gefn';

  @override
  String get adminFallbackFontPath => 'Llwybr ffont wrth gefn';

  @override
  String get adminAllowSegmentDeletion => 'Caniatáu dileu segment';

  @override
  String get adminSegmentKeepSeconds => 'Cadw segment (eiliadau)';

  @override
  String get adminThrottleBuffering => 'Byffro throttle';

  @override
  String get adminTrickplayLoadFailed =>
      'Wedi methu llwytho gosodiadau trickplay';

  @override
  String get adminEnableHardwareAcceleration => 'Galluogi cyflymiad caledwedd';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Galluogi echdynnu ffrâm allweddol yn unig';

  @override
  String get adminKeyFrameSubtitle => 'Cywirdeb cyflymach ond is';

  @override
  String get adminScanBehavior => 'Sganio ymddygiad';

  @override
  String get adminProcessPriority => 'Blaenoriaeth proses';

  @override
  String get adminImageSettings => 'Gosodiadau Delwedd';

  @override
  String get adminIntervalMs => 'cyfwng (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Pa mor aml i ddal fframiau';

  @override
  String get adminWidthResolutions => 'Datrysiadau lled';

  @override
  String get adminTileWidth => 'Lled teils';

  @override
  String get adminTileHeight => 'Uchder teils';

  @override
  String get adminQualitySubtitle =>
      'Gwerthoedd is = ansawdd gwell, ffeiliau mwy';

  @override
  String get adminProcessThreads => 'edafedd proses';

  @override
  String get adminResumeLoadFailed =>
      'Wedi methu llwytho gosodiadau ailddechrau';

  @override
  String get adminResumeDescription =>
      'Ffurfweddu pryd y dylid marcio cynnwys wedi\'i chwarae\'n rhannol neu wedi\'i chwarae\'n llawn.';

  @override
  String get adminMinResumePercentage => 'Isafswm canran ailddechrau';

  @override
  String get adminMinResumeSubtitle =>
      'Rhaid chwarae cynnwys y tu hwnt i\'r ganran hon i arbed cynnydd';

  @override
  String get adminMaxResumePercentage => 'Canran ailddechrau uchaf';

  @override
  String get adminMaxResumeSubtitle =>
      'Ystyrir bod y cynnwys wedi\'i chwarae\'n llawn ar ôl y ganran hon';

  @override
  String get adminMinResumeDuration => 'Hyd ailddechrau lleiaf (eiliadau)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Ni ellir ailgodi eitemau sy\'n fyrrach na hyn';

  @override
  String get adminMinAudiobookResume =>
      'Isafswm canran ailddechrau llyfrau sain';

  @override
  String get adminMaxAudiobookResume =>
      'Uchafswm canran ailddechrau llyfrau sain';

  @override
  String get adminNetworkingLoadFailed =>
      'Wedi methu llwytho gosodiadau rhwydweithio';

  @override
  String get adminNetworkingWarning =>
      'Mae\'n bosibl y bydd angen ailgychwyn gweinydd ar gyfer newidiadau i osodiadau rhwydweithio.';

  @override
  String get adminEnableRemoteAccess => 'Galluogi mynediad o bell';

  @override
  String get ports => 'Porthladdoedd';

  @override
  String get adminHttpPort => 'Porth HTTP';

  @override
  String get adminHttpsPort => 'Porth HTTPS';

  @override
  String get adminPublicHttpsPort => 'Porthladd HTTPS cyhoeddus';

  @override
  String get adminBaseUrl => 'URL sylfaen';

  @override
  String get adminBaseUrlHint => 'e.e. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Galluogi HTTPS';

  @override
  String get adminLocalNetwork => 'Rhwydwaith Lleol';

  @override
  String get adminLocalNetworkAddresses => 'Cyfeiriadau rhwydwaith lleol';

  @override
  String get adminKnownProxies => 'Dirprwyon hysbys';

  @override
  String get adminRemoteIpFilter => 'Hidlo IP o Bell';

  @override
  String get adminRemoteIpFilterEntries => 'Hidlydd IP o bell';

  @override
  String get adminCertificatePath => 'Llwybr tystysgrif';

  @override
  String get whitelist => 'Rhestr wen';

  @override
  String get blacklist => 'Rhestr ddu';

  @override
  String get notSet => 'Heb ei osod';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Wedi methu llwytho metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Adnewyddu Metadata';

  @override
  String get recursive => 'Atgyrchol';

  @override
  String get adminReplaceAllMetadata => 'Disodli\'r holl fetadata';

  @override
  String get adminMetadataRefreshRequested => 'Gofynnwyd am adnewyddu metadata';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Wedi methu ag adnewyddu metadata: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Ni chanfuwyd unrhyw barau o bell';

  @override
  String get adminRemoteResults => 'Canlyniadau o Bell';

  @override
  String get adminRemoteMetadataApplied => 'Cymhwyswyd metadata o bell';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Methodd chwiliad o bell: $error';
  }

  @override
  String get adminUpdateContentType => 'Diweddaru Math o Gynnwys';

  @override
  String get adminContentType => 'Math o gynnwys';

  @override
  String get adminContentTypeUpdated => 'Math o gynnwys wedi\'i ddiweddaru';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Wedi methu diweddaru\'r math o gynnwys: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Wedi methu llwytho golygydd metadata';

  @override
  String get adminNoPeopleEntries => 'Dim cofnodion pobl';

  @override
  String get adminNoExternalIds => 'Dim IDau allanol ar gael';

  @override
  String adminImageUpdated(String imageType) {
    return 'delwedd $imageType wedi\'i diweddaru';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Wedi methu llwytho delwedd: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Fformat delwedd heb ei gefnogi';

  @override
  String get adminImageReadFailed =>
      'Wedi methu darllen y ddelwedd a ddewiswyd';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType delwedd wedi\'i huwchlwytho';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Wedi methu uwchlwytho delwedd: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Dileu delwedd $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'delwedd $imageType wedi\'i dileu';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Wedi methu dileu delwedd: $error';
  }

  @override
  String get adminAllProviders => 'Pob darparwr';

  @override
  String get adminNoRemoteImages => 'Heb ganfod delweddau o bell';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Methwyd darganfod tiwniwr: $error';
  }

  @override
  String get adminTunerTypeM3u => 'Tiwniwr M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Ffeil neu URL';

  @override
  String get adminTunerIpAddress => 'Cyfeiriad IP y tiwniwr';

  @override
  String get adminTunerFriendlyName => 'Enw cyfeillgar';

  @override
  String get adminTunerUserAgent => 'Asiant defnyddiwr';

  @override
  String get adminTunerCount => 'Terfyn cysylltiadau ar yr un pryd';

  @override
  String get adminTunerCountHelp =>
      'Yr uchafswm o ffrydiau y mae\'r tiwniwr yn eu caniatáu ar yr un pryd. Gosodwch i 0 ar gyfer diderfyn.';

  @override
  String get adminTunerFallbackBitrate =>
      'Uchafswm cyfradd didau ffrydio wrth gefn';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Mewnforio sianeli ffefryn yn unig';

  @override
  String get adminTunerAllowHwTranscoding => 'Caniatáu trawsgodio caledwedd';

  @override
  String get adminTunerAllowFmp4 => 'Caniatáu\'r cynhwysydd trawsgodio fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Caniatáu rhannu ffrydiau';

  @override
  String get adminTunerEnableStreamLooping => 'Galluogi dolennu ffrydiau';

  @override
  String get adminTunerIgnoreDts => 'Anwybyddu DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Darllen y mewnbwn ar y gyfradd fframiau frodorol';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Ffeil neu URL';

  @override
  String get adminXmltvMoviePrefix => 'Rhagddodiad ffilmiau';

  @override
  String get adminXmltvMovieCategories => 'Categorïau ffilmiau';

  @override
  String get adminXmltvCategoriesHelp =>
      'Gwahanwch sawl categori â bar fertigol.';

  @override
  String get adminXmltvKidsCategories => 'Categorïau plant';

  @override
  String get adminXmltvNewsCategories => 'Categorïau newyddion';

  @override
  String get adminXmltvSportsCategories => 'Categorïau chwaraeon';

  @override
  String get adminSdUsername => 'Enw defnyddiwr';

  @override
  String get adminSdPassword => 'Cyfrinair';

  @override
  String get adminSdCountry => 'Gwlad';

  @override
  String get adminSdCountrySelect => 'Dewiswch wlad';

  @override
  String get adminSdPostalCode => 'Cod post';

  @override
  String get adminEnableAllTuners => 'Galluogi pob tiwniwr';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Wedi methu tynnu\'r tiwniwr: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Wedi methu dileu darparwr: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Llwybr recordio cyfres';

  @override
  String get adminMovieRecordingPath => 'Llwybr recordio ffilmiau';

  @override
  String get adminGuideDaysAuto => 'Awtomatig';

  @override
  String get adminRecordingPostProcessor => 'Llwybr y rhaglen ôl-brosesu';

  @override
  String get adminRecordingPostProcessorArgs => 'Ymresymiadau\'r ôl-broseswr';

  @override
  String get adminSaveRecordingNfo => 'Cadw metadata NFO recordiadau';

  @override
  String get adminSaveRecordingImages => 'Cadw delweddau recordiadau';

  @override
  String get adminLiveTvSectionPaths => 'Llwybrau recordio';

  @override
  String get adminLiveTvSectionPostProcessing => 'Ôl-brosesu';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Wedi methu cadw gosodiadau: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Wedi methu llwytho gweinyddiaeth Live TV';

  @override
  String get adminTunerDevices => 'Dyfeisiau Tiwniwr';

  @override
  String get adminNoTunerHosts => 'Dim gwesteiwr tiwniwr wedi\'i ffurfweddu';

  @override
  String get adminGuideProviders => 'Darparwyr Arweinwyr';

  @override
  String get adminGuideRefreshStarted => 'Dechreuwyd adnewyddu data\'r canllaw';

  @override
  String get adminGuideRefreshUnavailable =>
      'Nid yw\'r dasg adnewyddu\'r canllaw ar gael ar y gweinydd hwn.';

  @override
  String get adminNoListingProviders =>
      'Dim darparwyr rhestru wedi\'u ffurfweddu';

  @override
  String get adminSettingsSaved => 'Gosodiadau wedi\'u cadw';

  @override
  String get adminBackupsNotAvailable =>
      'Nid oes copïau wrth gefn ar gael ar y gosodiad gweinydd hwn.';

  @override
  String get adminRestoreWarning1 =>
      'Bydd adfer yn disodli POB data gweinydd presennol gyda\'r data wrth gefn.';

  @override
  String get adminRestoreWarning2 =>
      'Bydd gosodiadau gweinydd presennol, defnyddwyr, a data llyfrgell yn cael eu trosysgrifo.';

  @override
  String get adminRestoreWarning3 =>
      'Bydd y gweinydd yn ailgychwyn ar ôl ei adfer.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Adfer copi wrth gefn $name nawr?';
  }

  @override
  String get adminBackupsTitle => 'Copïau wrth gefn';

  @override
  String get adminUnknownDate => 'Dyddiad anhysbys';

  @override
  String get adminUnnamedBackup => 'Copi Wrth Gefn Dienw';

  @override
  String get adminApply => 'Gweithredu';

  @override
  String get adminLogsTitle => 'Logiau Gweinydd';

  @override
  String get adminLogsNewestFirst => 'Diweddaraf yn Gyntaf';

  @override
  String get adminLogsOldestFirst => 'Hynaf yn Gyntaf';

  @override
  String get adminLogsJustNow => 'Dim ond nawr';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m yn ôl';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h yn ôl';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d yn ôl';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Wedi methu llwytho $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count yn cyfateb';
  }

  @override
  String get adminLogViewerNoMatches => 'Dim llinellau cyfatebol';

  @override
  String get adminMetadataEditorTitle => 'Golygydd Metadata';

  @override
  String get adminMetadataIdentify => 'Adnabod';

  @override
  String get adminMetadataType => 'Math';

  @override
  String get adminMetadataDetails => 'Manylion';

  @override
  String get adminMetadataExternalIds => 'IDau allanol';

  @override
  String get adminMetadataImages => 'Delweddau';

  @override
  String get adminMetadataFieldTitle => 'Teitl';

  @override
  String get adminMetadataFieldSortTitle => 'Teitl didoli';

  @override
  String get adminMetadataFieldOriginalTitle => 'Teitl gwreiddiol';

  @override
  String get adminMetadataFieldPremiereDate => 'Dyddiad premiere (BBBB-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Dyddiad gorffen (BBBB-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Blwyddyn gynhyrchu';

  @override
  String get adminMetadataFieldOfficialRating => 'Sgôr swyddogol';

  @override
  String get adminMetadataFieldCommunityRating => 'Sgôr gymunedol';

  @override
  String get adminMetadataFieldCriticRating => 'Gradd feirniadol';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Trosolwg';

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
  String get adminMetadataGenres => 'Genres';

  @override
  String get adminMetadataTags => 'Tagiau';

  @override
  String get adminMetadataStudios => 'Stiwdios';

  @override
  String get adminMetadataPeople => 'Pobl';

  @override
  String get adminMetadataAddGenre => 'Ychwanegu genre';

  @override
  String get adminMetadataAddTag => 'Ychwanegu tag';

  @override
  String get adminMetadataAddStudio => 'Ychwanegu stiwdio';

  @override
  String get adminMetadataAddPerson => 'Ychwanegu Person';

  @override
  String get adminMetadataEditPerson => 'Golygu Person';

  @override
  String get adminMetadataRole => 'Rôl';

  @override
  String get adminMetadataImagePrimary => 'Cynradd';

  @override
  String get adminMetadataImageBackdrop => 'Cefndir';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Baner';

  @override
  String get adminMetadataImageThumb => 'Bawd';

  @override
  String get adminMetadataProvider => 'Darparwr';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'delwedd $imageType wedi\'i diweddaru';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType delwedd wedi\'i huwchlwytho';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'delwedd $imageType wedi\'i dileu';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Wedi methu llwytho delwedd: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Wedi methu darllen y ddelwedd a ddewiswyd';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Wedi methu uwchlwytho delwedd: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Dileu delwedd $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Mae hyn yn tynnu\'r ddelwedd gyfredol o\'r eitem.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Wedi methu dileu delwedd: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Dewiswch ddelwedd $imageType';
  }

  @override
  String get adminMetadataUpload => 'Llwytho i fyny';

  @override
  String get adminMetadataUpdate => 'Diweddariad';

  @override
  String get adminMetadataRemoteImage => 'Delwedd o bell';

  @override
  String get adminPluginsInstalled => 'Wedi\'i osod';

  @override
  String get adminPluginsCatalog => 'Catalog';

  @override
  String get adminPluginsActive => 'Actif';

  @override
  String get adminPluginsRestart => 'Ailgychwyn';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Nid oes unrhyw ategion yn cyfateb i\'ch chwiliad';

  @override
  String get adminPluginsNoneInstalled => 'Dim ategion wedi\'u gosod';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Diweddariad ar gael: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Diweddariad ar gael';

  @override
  String get adminPluginsPendingRemoval =>
      'Yn aros i gael ei dynnu ar ôl ailgychwyn';

  @override
  String get adminPluginsChangesPending => 'Newidiadau wrth aros am ailgychwyn';

  @override
  String get adminPluginsEnable => 'Galluogi';

  @override
  String get adminPluginsDisable => 'Analluogi';

  @override
  String get adminPluginsInstallUpdate => 'Gosod diweddariad';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Gosod diweddariad (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nid oes unrhyw becynnau yn cyfateb i\'ch chwiliad';

  @override
  String get adminPluginsCatalogEmpty => 'Dim pecynnau ar gael';

  @override
  String adminPluginsInstalling(String name) {
    return 'Mae \"$name\" yn cael ei osod…';
  }

  @override
  String get adminPluginDetailExperimental => 'Integreiddio Arbrofol';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Mae integreiddio gosodiadau ategyn yn dal i fod yn arbrofol. Mae\'n bosibl na fydd rhai meysydd neu gynlluniau yn gywir eto.';

  @override
  String get adminPluginDetailToggle404 =>
      'Wedi methu toglo ategyn. Ni allai\'r gweinydd ddod o hyd i\'r fersiwn ategyn hwn. Ceisiwch adnewyddu ategion, yna ceisiwch eto.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Wedi methu toglo ategyn. Gwiriwch logiau gweinyddwyr am fanylion.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Gosodiadau';
  }

  @override
  String get adminPluginDetailDetails => 'Manylion';

  @override
  String get adminPluginDetailDeveloper => 'Datblygwr';

  @override
  String get adminPluginDetailRepository => 'Ystorfa';

  @override
  String get adminPluginDetailBundled => 'Wedi\'i bwndelu';

  @override
  String get adminPluginDetailEnablePlugin => 'Galluogi Ategyn';

  @override
  String get adminPluginDetailRestartRequired =>
      'Mae angen ailgychwyn gweinydd er mwyn i\'r newidiadau ddod i rym.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Bydd yr ategyn hwn yn cael ei dynnu ar ôl ailgychwyn y gweinydd.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Mae\'r ategyn hwn wedi camweithio ac efallai na fydd yn gweithio\'n gywir.';

  @override
  String get adminPluginDetailNotSupported =>
      'Nid yw fersiwn cyfredol y gweinydd yn cefnogi\'r ategyn hwn.';

  @override
  String get adminPluginDetailSuperseded =>
      'Mae\'r ategyn hwn wedi\'i ddisodli gan fersiwn mwy diweddar.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Wedi methu llwytho storfeydd: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Dileu Cadwrfa';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddileu \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Tynnu';

  @override
  String adminReposSaveFailed(String error) {
    return 'Wedi methu cadw ystorfeydd: $error';
  }

  @override
  String get adminReposEmpty => 'Dim cadwrfeydd wedi\'u ffurfweddu';

  @override
  String get adminReposEmptySubtitle =>
      'Ychwanegu ystorfa i bori\'r ategion sydd ar gael';

  @override
  String get adminReposUnnamed => '(dienw)';

  @override
  String get adminReposEditTitle => 'Golygu Cadwrfa';

  @override
  String get adminReposAddTitle => 'Ychwanegu Cadwrfa';

  @override
  String get adminReposUrl => 'URL y storfa';

  @override
  String get adminReposNameHint => 'e.e. Stabl Jellyfin';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL annilys';

  @override
  String get adminGeneralSettingsTitle => 'Gosodiadau Cyffredinol';

  @override
  String get adminGeneralMetadataLanguage => 'Dewis iaith metadata';

  @override
  String get adminGeneralMetadataLanguageHint => 'e.e. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Y wlad metadata a ffefrir';

  @override
  String get adminGeneralMetadataCountryHint => 'e.e. Unol Daleithiau, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Llyfrgell sgan arian cyfred';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Terfyn amgodio delwedd gyfochrog';

  @override
  String get adminUnknownError => 'Gwall anhysbys';

  @override
  String get adminBrowse => 'Pori';

  @override
  String get adminCloseBrowser => 'Cau porwr';

  @override
  String get adminNetworkingTitle => 'Rhwydweithio';

  @override
  String get adminNetworkingRestartWarning =>
      'Mae\'n bosibl y bydd angen ailgychwyn gweinydd ar gyfer newidiadau i osodiadau rhwydweithio.';

  @override
  String get adminNetworkingEnableHttps => 'Galluogi HTTPS';

  @override
  String get adminNetworkingAddressHint => 'e.e. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Dirprwyon hysbys';

  @override
  String get adminNetworkingProxyHint => 'e.e. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Rhestr wen';

  @override
  String get adminNetworkingBlacklist => 'Rhestr ddu';

  @override
  String get adminNetworkingAddEntry => 'Ychwanegu cofnod';

  @override
  String get adminBrandingTitle => 'Brandio';

  @override
  String get adminBrandingLoginDisclaimer => 'Ymwadiad mewngofnodi';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML wedi\'i arddangos o dan y ffurflen mewngofnodi';

  @override
  String get adminBrandingCustomCss => 'CSS personol';

  @override
  String get adminBrandingCustomCssHint =>
      'Cymhwyswyd CSS personol i\'r rhyngwyneb gwe';

  @override
  String get adminBrandingEnableSplash => 'Galluogi sgrin sblash';

  @override
  String get adminBrandingSplashUpload => 'Uwchlwytho delwedd';

  @override
  String get adminBrandingSplashUploaded => 'Sgrin gychwyn wedi\'i diweddaru';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Wedi methu uwchlwytho\'r sgrin gychwyn';

  @override
  String get adminBrandingSplashDeleted => 'Sgrin gychwyn wedi\'i thynnu';

  @override
  String get adminBrandingNoSplash => 'Dim sgrin gychwyn bersonol';

  @override
  String get adminPlaybackHwAccel => 'Cyflymiad Caledwedd';

  @override
  String get adminPlaybackHwAccelLabel => 'Cyflymiad caledwedd';

  @override
  String get adminPlaybackEnableHwEncoding => 'Galluogi amgodio caledwedd';

  @override
  String get adminPlaybackQsvDevice => 'Dyfais QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Galluogi\'r dadgodiwr NVDEC gwell';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Ffafrio dadgodiwr caledwedd brodorol y system';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Dadgodio HEVC 10-did';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Dadgodio VP9 10-did';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'Dadgodio HEVC RExt 8/10-did';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'Dadgodio HEVC RExt 12-did';

  @override
  String get adminPlaybackHwEncodingSection => 'Amgodio caledwedd';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Caniatáu amgodio HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Caniatáu amgodio AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Galluogi amgodiwr H.264 pŵer isel Intel';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Galluogi amgodiwr HEVC pŵer isel Intel';

  @override
  String get adminPlaybackToneMapping => 'Mapio Tôn';

  @override
  String get adminPlaybackEnableTonemapping => 'Galluogi mapio tôn';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Galluogi mapio tôn VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Galluogi mapio tôn VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algorithm mapio tôn';

  @override
  String get adminPlaybackTonemappingMode => 'Modd mapio tôn';

  @override
  String get adminPlaybackTonemappingRange => 'Ystod mapio tôn';

  @override
  String get adminPlaybackTonemappingDesat => 'Dadddirlawnder mapio tôn';

  @override
  String get adminPlaybackTonemappingPeak => 'Brig mapio tôn';

  @override
  String get adminPlaybackTonemappingParam => 'Paramedr mapio tôn';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Disgleirdeb mapio tôn VPP';

  @override
  String get adminPlaybackVppTonemappingContrast => 'Cyferbyniad mapio tôn VPP';

  @override
  String get adminPlaybackEncoderPreset => 'Rhagosodiad yr amgodiwr';

  @override
  String get adminPlaybackH264Crf => 'CRF amgodio H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF amgodio H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Dull dadgydblethu';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Dyblu\'r gyfradd fframiau wrth ddadgydblethu';

  @override
  String get adminPlaybackAudioSection => 'Sain';

  @override
  String get adminPlaybackEnableAudioVbr =>
      'Galluogi amgodio VBR ar gyfer sain';

  @override
  String get adminPlaybackDownmixBoost => 'Hwb cymysgu sain i lawr';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algorithm cymysgu stereo i lawr';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Uchafswm maint y ciw muxio';

  @override
  String get adminPlaybackAutoOption => 'Awto';

  @override
  String get adminPlaybackEncoding => 'Amgodio';

  @override
  String get adminPlaybackEncodingThreads => 'Edau amgodio';

  @override
  String get adminPlaybackFallbackFont => 'Galluogi ffont wrth gefn';

  @override
  String get adminPlaybackFallbackFontPath => 'Llwybr ffont wrth gefn';

  @override
  String get adminPlaybackStreaming => 'Ffrydio';

  @override
  String get adminResumeVideo => 'Fideo';

  @override
  String get adminResumeAudiobooks => 'Llyfrau llafar';

  @override
  String get adminStreamingBitrateLimit =>
      'Terfyn cyfradd didau cleient o bell (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Gadael yn wag neu 0 am anghyfyngedig';

  @override
  String get adminTrickplayHwAccel => 'Galluogi cyflymiad caledwedd';

  @override
  String get adminTrickplayHwEncoding => 'Galluogi amgodio caledwedd';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Galluogi echdynnu ffrâm allweddol yn unig';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'Cywirdeb cyflymach ond is';

  @override
  String get adminTrickplayNonBlocking => 'Di-rwystro';

  @override
  String get adminTrickplayBlocking => 'Blocio';

  @override
  String get adminTrickplayPriorityHigh => 'Uchel';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Uwchben Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Arferol';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Islaw Normal';

  @override
  String get adminTrickplayPriorityIdle => 'Segur';

  @override
  String get adminTrickplayImageSettings => 'Gosodiadau Delwedd';

  @override
  String get adminTrickplayInterval => 'cyfwng (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Pa mor aml i ddal fframiau';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Lled picsel wedi\'u gwahanu gan goma (e.e. 320)';

  @override
  String get adminTrickplayQuality => 'Ansawdd';

  @override
  String get adminTrickplayQScale => 'Graddfa ansawdd';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Gwerthoedd is = ansawdd gwell, ffeiliau mwy';

  @override
  String get adminTrickplayJpegQuality => 'Ansawdd JPEG';

  @override
  String get adminTrickplayProcessing => 'Prosesu';

  @override
  String get adminTasksEmpty =>
      'Ni chanfuwyd unrhyw dasgau wedi\'u hamserlennu';

  @override
  String get adminTasksNoFilterMatch =>
      'Nid oes unrhyw dasgau yn cyfateb i\'r hidlydd cyfredol';

  @override
  String get adminTaskCancelling => 'Wrthi\'n canslo…';

  @override
  String get adminTaskRunning => 'Yn rhedeg…';

  @override
  String get adminTaskNeverRun => 'Peidiwch byth â rhedeg';

  @override
  String get adminTaskStop => 'Stopio';

  @override
  String get adminRunningTasks => 'Tasgau\'n Rhedeg';

  @override
  String get adminTaskRun => 'Rhedeg';

  @override
  String get adminTaskDetailLastExecution => 'Dienyddiad Diweddaf';

  @override
  String get adminTaskDetailStarted => 'Dechreuwyd';

  @override
  String get adminTaskDetailEnded => 'Wedi dod i ben';

  @override
  String get adminTaskDetailDuration => 'Hyd';

  @override
  String get adminTaskDetailErrorLabel => 'Gwall:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Bob dydd yn $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Pob $day yn $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Wrth gychwyn cais';

  @override
  String get adminTaskTriggerTypeDaily => 'Dyddiol';

  @override
  String get adminTaskTriggerTypeWeekly => 'Wythnosol';

  @override
  String get adminTaskTriggerTypeInterval => 'Ar egwyl';

  @override
  String get adminTaskTriggerIntervalLabel => 'Cyfwng';

  @override
  String get adminTaskTriggerEveryHour => 'Bob awr';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count awr',
      zero: '$count o oriau',
      one: '1 awr',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Amser';

  @override
  String get adminActivityJustNow => 'Dim ond nawr';

  @override
  String get adminActivityLastHour => 'Awr olaf';

  @override
  String get adminActivityToday => 'Heddiw';

  @override
  String get adminActivityYesterday => 'Ddoe';

  @override
  String get adminActivityOlder => 'Hynach';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d yn ôl';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h yn ôl';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m yn ôl';
  }

  @override
  String get adminActivityNow => 'yn awr';

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
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Ffurfweddu cynhyrchu delwedd trickplay ar gyfer ceisio rhagolwg mân-luniau.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porthladd HTTPS cyhoeddus';

  @override
  String get adminNetworkingBaseUrl => 'URL sylfaen';

  @override
  String get adminNetworkingBaseUrlHint => 'e.e. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Porth HTTP cyhoeddus';

  @override
  String get adminNetworkingRequireHttps => 'Mynnu HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Ailgyfeirio pob cais o bell i HTTPS. Nid yw\'n cael unrhyw effaith os nad oes gan y gweinydd dystysgrif ddilys.';

  @override
  String get adminNetworkingCertPassword => 'Cyfrinair y dystysgrif';

  @override
  String get adminNetworkingEnableIpv4 => 'Galluogi IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Galluogi IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'Rhwydweithiau LAN';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Hidlydd IP o bell';

  @override
  String get adminPlaybackVaapiDevice => 'dyfais VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = awtomatig';

  @override
  String get adminPlaybackTranscodeTempPath => 'Trawsgodio llwybr dros dro';

  @override
  String get adminPlaybackSegmentDeletion => 'Caniatáu dileu segment';

  @override
  String get adminPlaybackSegmentKeep => 'Cadw segment (eiliadau)';

  @override
  String get adminPlaybackThrottleBuffering => 'Byffro throttle';

  @override
  String get adminPlaybackThrottleDelay => 'Oedi cyn cyfyngu (eiliadau)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Caniatáu echdynnu isdeitlau ar y pryd';

  @override
  String get adminResumeMinPct => 'Isafswm canran ailddechrau';

  @override
  String get adminResumeMinPctSubtitle =>
      'Rhaid chwarae cynnwys y tu hwnt i\'r ganran hon i arbed cynnydd';

  @override
  String get adminResumeMaxPct => 'Canran ailddechrau uchaf';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Ystyrir bod y cynnwys wedi\'i chwarae\'n llawn ar ôl y ganran hon';

  @override
  String get adminResumeMinDuration => 'Hyd ailddechrau lleiaf (eiliadau)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Ni ellir ailgodi eitemau sy\'n fyrrach na hyn';

  @override
  String get adminTrickplayScanBehavior => 'Sganio ymddygiad';

  @override
  String get adminTrickplayProcessPriority => 'Blaenoriaeth proses';

  @override
  String get adminTrickplayTileWidth => 'Lled teils';

  @override
  String get adminTrickplayTileHeight => 'Uchder teils';

  @override
  String get adminTrickplayProcessThreads => 'edafedd proses';

  @override
  String get adminTrickplayWidthResolutions => 'Datrysiadau lled';

  @override
  String get adminMetadataDefault => 'Diofyn';

  @override
  String get adminMetadataContentTypeUpdated =>
      'Math o gynnwys wedi\'i ddiweddaru';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Wedi methu diweddaru\'r math o gynnwys: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Trothwy ymateb araf (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Galluogi rhybuddion ymateb araf';

  @override
  String get adminGeneralQuickConnect => 'Galluogi Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Gweinydd';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Llwybrau';

  @override
  String get adminGeneralSectionPerformance => 'Perfformiad';

  @override
  String get adminGeneralCachePath => 'Llwybr storfa';

  @override
  String get adminGeneralMetadataPath => 'Llwybr metadata';

  @override
  String get adminGeneralServerName => 'Enw gweinydd';

  @override
  String get adminGeneralDisplayLanguage => 'Iaith ddangos ddewisol';

  @override
  String get adminSettingsLoadFailed => 'Wedi methu llwytho gosodiadau';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Wedi methu diweddaru mapiau: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Terfyn amser: $duration';
  }

  @override
  String get folders => 'Ffolderi';

  @override
  String get libraries => 'Llyfrgelloedd';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'Analluogwyd SyncPlay';

  @override
  String get syncPlayDisabledMessage =>
      'Galluogi SyncPlay mewn Gosodiadau i ddefnyddio chwarae cydamserol.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Gweinydd heb ei gefnogi';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'Mae angen gweinydd Jellyfin ar SyncPlay. Nid yw\'r gweinydd presennol yn ei gefnogi.';

  @override
  String get syncPlayGroupFallbackName => 'Grŵp SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Grŵp SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# cyfranogwr',
      many: '# chyfranogwr',
      few: '# chyfranogwr',
      two: '# gyfranogwr',
      zero: '# o gyfranogwyr',
      one: '# cyfranogwr',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Anwybyddu aros';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Peidiwch â dal y grŵp i fyny tra bod y ddyfais hon yn clustogi';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Parhau yn lleol heb aros am aelodau araf';

  @override
  String get syncPlayRepeat => 'Ailadrodd';

  @override
  String get syncPlayRepeatOne => 'Un';

  @override
  String get syncPlayShuffleModeShuffled => 'Wedi\'i gymysgu';

  @override
  String get syncPlayShuffleModeSorted => 'Wedi\'i drefnu';

  @override
  String get syncPlaySyncCurrentQueue => 'Cysoni ciw chwarae cyfredol';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Gosodwch yr hyn sy\'n chwarae\'n lleol yn lle\'r ciw grŵp';

  @override
  String get syncPlayLeaveGroup => 'Gadael y grŵp';

  @override
  String get syncPlayGroupQueue => 'Ciw grŵp';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Eitem $index';
  }

  @override
  String get syncPlayPlayNow => 'Chwarae nawr';

  @override
  String get syncPlayCreateNewGroup => 'Creu grŵp newydd';

  @override
  String get syncPlayGroupName => 'Enw grŵp';

  @override
  String get syncPlayDefaultGroupName => 'Fy Ngrŵp SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Creu grŵp';

  @override
  String get syncPlayAvailableGroups => 'Grwpiau sydd ar gael';

  @override
  String get syncPlayNoGroupsAvailable => 'Dim grwpiau ar gael';

  @override
  String get syncPlayJoinGroupQuestion => 'Ymuno â grŵp SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Mae\'n bosibl y bydd ymuno â grŵp SyncPlay yn disodli eich ciw chwarae presennol. Parhau?';

  @override
  String get syncPlayJoin => 'Ymuno';

  @override
  String get syncPlayStateIdle => 'Segur';

  @override
  String get syncPlayStateWaiting => 'Aros';

  @override
  String get syncPlayStatePaused => 'Wedi seibio';

  @override
  String get syncPlayStatePlaying => 'Chwarae';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return 'Ymunodd $userName â grŵp SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return 'Gadawodd $userName grŵp SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Gwrthodwyd mynediad SyncPlay';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nid oes gennych fynediad i un neu fwy o eitemau yn y grŵp SyncPlay hwn. Gofynnwch i berchennog y grŵp wirio caniatadau llyfrgell neu ddewis ciw gwahanol.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Wrthi\'n cysoni chwarae yn ôl i $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Nid yw chwiliad llais ar gael.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Methiant Chwarae Uniongyrchol Dolby Vision';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Methodd chwarae uniongyrchol â dechrau ar gyfer y ffrwd Dolby Vision hon. Ailgeisio defnyddio trawsgôd gweinydd?';

  @override
  String get retryWithTranscode => 'Rhowch gynnig arall arni gyda thrawsgod';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Heb ei Gefnogi';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Ni all y ddyfais hon ddadgodio cynnwys Dolby Vision yn uniongyrchol. Defnyddiwch HDR10 wrth gefn neu gofynnwch am drawsgodio gweinydd.';

  @override
  String get rememberMyChoice => 'Cofiwch fy newis';

  @override
  String get playHdr10Fallback => 'Chwarae HDR10 wrth gefn';

  @override
  String get requestTranscode => 'Gofyn am drawsgod';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# rhes wedi\'u darganfod',
      two: '# res wedi\'u darganfod',
      zero: '# o resi wedi\'u darganfod',
      one: '# rhes wedi\'i darganfod',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Gwel Pawb';

  @override
  String get noItems => 'Dim eitemau';

  @override
  String get switchUser => 'Newid Defnyddiwr';

  @override
  String get remoteControl => 'Rheolaeth Anghysbell';

  @override
  String get mediaBarLoading => 'Wrthi\'n llwytho bar cyfryngau…';

  @override
  String get mediaBarError => 'Methodd bar cyfryngau llwytho';

  @override
  String get offlineServerUnavailable =>
      'Wedi\'i gysylltu â\'r rhyngrwyd, ond nid yw\'r gweinydd presennol ar gael.';

  @override
  String get offlineNoInternet =>
      'Rydych chi all-lein. Dim ond cynnwys wedi\'i lawrlwytho sydd ar gael.';

  @override
  String get offlineFileNotAvailable => 'Ffeil ddim ar gael';

  @override
  String get offlineSwitchServer => 'Newid Gweinydd';

  @override
  String get offlineSavedMedia => 'Cyfryngau wedi\'u Cadw';

  @override
  String get offlineBannerTitle => 'Rydych chi all-lein';

  @override
  String get offlineBannerSubtitle => 'Yn dangos eich lawrlwythiadau';

  @override
  String get serverUnreachableBannerTitle => 'Methu cyrraedd eich gweinydd';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Yn chwarae o\'ch lawrlwythiadau nes iddo ddod yn ôl';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => '_ARB_TERM_0__';

  @override
  String get castRemotePlayback => 'Chwarae o Bell';

  @override
  String castControlFailed(String error) {
    return 'Methodd rheolaeth cast: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Rheolaethau';
  }

  @override
  String get castDeviceVolume => 'Cyfrol Dyfais';

  @override
  String get castVolumeUnavailable => 'Ddim ar gael';

  @override
  String castStopKind(String kind) {
    return 'Stopiwch $kind';
  }

  @override
  String get audioLabel => 'Sain';

  @override
  String get subtitlesLabel => 'Isdeitlau';

  @override
  String get pinConfirmTitle => 'Cadarnhau PIN';

  @override
  String get pinSetTitle => 'Gosod PIN';

  @override
  String get pinEnterTitle => 'Rhowch PIN';

  @override
  String get pinReenterToConfirm => 'Rhowch eich PIN eto i gadarnhau';

  @override
  String pinEnterNDigit(int length) {
    return 'Rhowch PIN $length-digid';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Rhowch eich PIN $length-digid';
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
  String get pinIncorrect => 'PIN anghywir';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'Nid yw PINs yn cyfateb';

  @override
  String get pinForgot => 'Wedi anghofio PIN?';

  @override
  String get pinClear => 'Clirio';

  @override
  String get pinBackspace => 'Gofod cefn';

  @override
  String get quickConnectAuthorized => 'Awdurdodwyd y cais Quick Connect.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Mae cod Quick Connect yn annilys neu wedi dod i ben.';

  @override
  String get quickConnectNotSupported =>
      'Nid yw Quick Connect yn cael ei gefnogi ar y gweinydd hwn.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Wedi methu ag awdurdodi cod Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Mae Quick Connect wedi\'i analluogi ar y gweinydd hwn.';

  @override
  String get quickConnectForbidden =>
      'Ni all eich cyfrif awdurdodi\'r cais Quick Connect hwn.';

  @override
  String get quickConnectNotFound =>
      'Ni chanfuwyd cod Quick Connect. Rhowch gynnig ar god newydd.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Methodd Quick Connect: $message';
  }

  @override
  String get quickConnectEnterCode => 'Rhowch god';

  @override
  String get quickConnectAuthorize => 'Awdurdodi';

  @override
  String remoteCommandFailed(String error) {
    return 'Methodd y gorchymyn: $error';
  }

  @override
  String get remoteControlTitle => 'Rheolaeth Anghysbell';

  @override
  String get remoteFailedToLoadSessions => 'Wedi methu llwytho sesiynau';

  @override
  String get remoteNoSessions => 'Dim sesiynau y gellir eu rheoli';

  @override
  String get remoteStartPlayback => 'Dechreuwch chwarae ar ddyfais arall';

  @override
  String get unknownUser => 'Anhysbys';

  @override
  String get unknownItem => 'Anhysbys';

  @override
  String get remoteNothingPlaying => 'Dim byd yn chwarae ar y sesiwn yma';

  @override
  String get castingStarted => 'Dechreuodd y castio ar ddyfais a ddewiswyd';

  @override
  String castingFailed(String error) {
    return 'Wedi methu dechrau castio: $error';
  }

  @override
  String get noRemoteDevices => 'Dim dyfeisiau chwarae o bell ar gael.';

  @override
  String get noRemoteDevicesIos =>
      'Dim dyfeisiau chwarae o bell ar gael.\n\nAr iOS, efallai na fydd targedau AirPlay ar gael yn yr efelychydd.';

  @override
  String get trackActionPlayNext => 'Chwarae Nesaf';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Ychwanegu at Ciw';

  @override
  String get trackActionAddToPlaylist => 'Ychwanegu at y Rhestr Chwarae';

  @override
  String get trackActionCancelDownload => 'Canslo Lawrlwytho';

  @override
  String get trackActionDeleteFromPlaylist => 'Dileu o\'r Rhestr Chwarae';

  @override
  String get trackActionMoveUp => 'Symud i Fyny';

  @override
  String get trackActionMoveDown => 'Symud i Lawr';

  @override
  String get trackActionRemoveFromFavorites => 'Tynnu o Ffefrynnau';

  @override
  String get trackActionAddToFavorites => 'Ychwanegu at Ffefrynnau';

  @override
  String get trackActionGoToAlbum => 'Ewch i Albwm';

  @override
  String get trackActionGoToArtist => 'Ewch i Artist';

  @override
  String trackActionDownloading(String name) {
    return 'Wrthi\'n llwytho i lawr $name…';
  }

  @override
  String get trackActionDeletedFile => 'Ffeil wedi\'i lawrlwytho wedi\'i dileu';

  @override
  String get trackActionDeleteFileFailed =>
      'Methu dileu ffeil wedi\'i lawrlwytho';

  @override
  String get shuffleBy => 'Shuffle Erbyn';

  @override
  String get shuffleSelectLibrary => 'Dewiswch Llyfrgell';

  @override
  String get shuffleSelectGenre => 'Dewiswch Genre';

  @override
  String get shuffleLibrary => 'Llyfrgell';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Dim llyfrgelloedd cydnaws ar gael.';

  @override
  String get shuffleNoGenres =>
      'Ni chanfuwyd genres ar gyfer y modd siffrwd hwn.';

  @override
  String get posterDisplayTitle => 'Arddangos';

  @override
  String get posterImageType => 'Math o Ddelwedd';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Mân-lun';

  @override
  String get imageTypeBanner => 'Baner';

  @override
  String get playlistAddFailed => 'Wedi methu ag ychwanegu at y rhestr chwarae';

  @override
  String get playlistCreateFailed => 'Wedi methu creu rhestr chwarae';

  @override
  String get playlistNew => 'Rhestr Chwarae Newydd';

  @override
  String get playlistCreate => 'Creu';

  @override
  String get playlistCreateNew => 'Creu Rhestr Chwarae Newydd';

  @override
  String get playlistNoneFound => 'Heb ganfod rhestri chwarae';

  @override
  String get addToPlaylist => 'Ychwanegu at y Rhestr Chwarae';

  @override
  String get lyricsNotAvailable => 'Dim geiriau ar gael';

  @override
  String get upNext => 'Up Nesaf';

  @override
  String get playNext => 'Chwarae Nesaf';

  @override
  String get stillWatchingContent =>
      'Mae chwarae wedi\'i oedi. Ydych chi\'n dal i wylio?';

  @override
  String get stillWatchingStop => 'Stopio';

  @override
  String get stillWatchingContinue => 'Parhewch';

  @override
  String skipSegment(String segment) {
    return 'Hepiwch $segment';
  }

  @override
  String get liveTv => 'Teledu byw';

  @override
  String get continueWatchingAndNextUp => 'Parhewch i Gwylio a Nesaf';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Lawrlwytho $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Lawrlwytho $fileName';
  }

  @override
  String get nextEpisode => 'Pennod nesaf';

  @override
  String get moreFromThisSeason => 'Mwy o\'r Tymor Hwn';

  @override
  String get playerTooltipPlaybackSpeed => 'Cyflymder chwarae';

  @override
  String get playerTooltipCastControls => 'Rheolaethau cast';

  @override
  String get playerTooltipPlaybackQuality => 'Cyfradd didau';

  @override
  String get playerTooltipEnterFullscreen => 'Rhowch sgrin lawn';

  @override
  String get playerTooltipExitFullscreen => 'Gadael sgrin lawn';

  @override
  String get playerTooltipFloatOnTop => 'Arnofio ar ei ben';

  @override
  String get playerTooltipExitFloatOnTop => 'Analluogi fflôt ar ei ben';

  @override
  String get playerTooltipLockLandscape => 'Tirwedd clo';

  @override
  String get playerTooltipUnlockOrientation => 'Caniatáu cylchdroi';

  @override
  String get playerTooltipPrevious => 'Blaenorol';

  @override
  String get playerTooltipSeekBack => 'Ceisio yn ôl';

  @override
  String get playerTooltipSeekForward => 'Ceisio ymlaen';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Marciwch fel y\'i Gwyliwyd';

  @override
  String get contextMenuMarkUnwatched => 'Marciwch fel Heb ei wylio';

  @override
  String get contextMenuAddToFavorites => 'Ychwanegu at Ffefrynnau';

  @override
  String get contextMenuRemoveFromFavorites => 'Tynnu o Ffefrynnau';

  @override
  String get contextMenuGoToSeries => 'Ewch i Gyfres';

  @override
  String get contextMenuHideFromContinueWatching => 'Cuddio o Parhewch i Wylio';

  @override
  String get contextMenuHideFromNextUp => 'Cuddio o Nesaf';

  @override
  String get contextMenuAddToCollection => 'Ychwanegu at Gasgliad';

  @override
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

  @override
  String get settingsAdministrationSubtitle =>
      'Cyrchwch banel gweinyddu\'r gweinydd';

  @override
  String get settingsDynamicContent => 'Cynnwys Dynamig';

  @override
  String get settingsDynamicContentSubtitle =>
      'Bar Cyfryngau a throshaenau gweledol';

  @override
  String get settingsAboutSubtitle =>
      'Fersiwn ap, gwybodaeth gyfreithiol, a chredydau';

  @override
  String get settingsSortServersBy => 'Trefnu Gweinyddwyr Yn ôl';

  @override
  String get settingsLastUsed => 'Defnyddiwyd ddiwethaf';

  @override
  String get settingsAlphabetical => 'Yn nhrefn yr wyddor';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Caniatáu tystysgrifau hunanlofnodedig';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Ymddiried mewn gweinyddion sy\'n defnyddio tystysgrifau TLS hunanlofnodedig neu rai o CA preifat. Galluogwch hyn ar gyfer gweinyddion rydych chi\'n eu rheoli yn unig. Mae hyn yn analluogi dilysu tystysgrifau ar gyfer pob cysylltiad.';

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
  String get settingsHomePage => 'Tudalen Gartref';

  @override
  String get settingsTwentyFourHourClock => 'Cloc 24-Awr';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Defnyddiwch fformatio amser 24 awr lle bynnag y dangosir y cloc';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Dangoswch y botwm siffrwd yn y bar llywio';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Dangoswch y botwm genres yn y bar llywio';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Dangoswch y botwm ffefrynnau yn y bar llywio';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Dangoswch y botwm llyfrgelloedd yn y bar llywio';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Dangos botwm Seerr yn y bar llywio';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Dangos labeli testun yn y bar llywio uchaf bob amser';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Toglo gwelededd tudalen gartref fesul llyfrgell. Ailgychwyn Moonfin i newidiadau ddod i rym.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Bar Cyfryngau a Rhagolygon Lleol';

  @override
  String get settingsVisualOverlays => 'Troshaenau Gweledol';

  @override
  String get settingsSeasonalSurprise => 'Syndod Tymhorol';

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
  String get settingsHigh => 'Uchel';

  @override
  String get settingsLow => 'Isel';

  @override
  String get settingsCustomPath => 'Llwybr Personol';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Rhowch lwybr ffolder lawrlwytho';

  @override
  String get settingsConcurrentDownloads => 'Lawrlwythiadau Cydamserol';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Uchafswm nifer yr eitemau i\'w llwytho i lawr ar unwaith.';

  @override
  String get settingsAppInfo => 'GWYBODAETH APP';

  @override
  String get settingsReportAnIssue => 'Rhoi gwybod am Fater';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Agorwch y traciwr materion ar GitHub';

  @override
  String get settingsJoinDiscord => 'Ymunwch â Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Sgwrsio gyda\'r gymuned';

  @override
  String get settingsJoinTheDiscord => 'Ymunwch â\'r Discord';

  @override
  String get settingsSupportMoonfin => 'Cefnogwch Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Rhowch goffi i\'r datblygwr';

  @override
  String get settingsLegal => 'CYFREITHIOL';

  @override
  String get settingsLicenses => 'Trwyddedau';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Hysbysiadau trwydded ffynhonnell agored';

  @override
  String get settingsPrivacyPolicy => 'Polisi Preifatrwydd';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Sut mae Moonfin yn trin eich data';

  @override
  String get settingsCheckForUpdates => 'Gwiriwch am Ddiweddariadau';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Gwiriwch am y datganiad Moonfin diweddaraf';

  @override
  String get settingsBoth => 'Y ddau';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Cymysgwch Hidlydd Math Cynnwys';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Traciau sain, prosesu, ac opsiynau pasio drwodd';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Chwarae a dilyniannu awtomataidd';

  @override
  String get settingsSyncplaySubtitle =>
      'Rhesymeg cydamseru ar gyfer sesiynau grŵp';

  @override
  String get settingsSkipIntrosAndOutros => 'Hepgor Intros a Outros?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Cyfrif i Lawr Segment Cyfryngau';

  @override
  String get settingsProgressBar => 'Bar Cynnydd';

  @override
  String get settingsTimer => 'Amserydd';

  @override
  String get settingsNone => 'Dim';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Defnyddiwr Prydlon';

  @override
  String get settingsSkip => 'Sgipio';

  @override
  String get settingsDoNothing => 'Gwneud Dim';

  @override
  String get settingsMaxBitrateDescription =>
      'Capio\'r gyfradd didau ffrydio. Bydd cynnwys uwchlaw\'r trothwy hwn yn cael ei drawsgodio i ffitio.';

  @override
  String get settingsMaxResolutionDescription =>
      'Cyfyngu ar y datrysiad mwyaf y bydd y chwaraewr yn gofyn amdano. Bydd cynnwys cydraniad uwch yn cael ei drawsgodio i lawr.';

  @override
  String get settingsPlayerZoomDescription =>
      'Sut y dylid graddio fideo i ffitio\'r sgrin.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Peiriant Chwarae (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Dewiswch yr injan chwarae ddiofyn ar ddyfeisiau Android TV. Mae newidiadau yn berthnasol i\'r sesiwn chwarae nesaf.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (argymhellir)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (etifeddiaeth)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision wrth gefn';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Ymddygiad ar gyfer teitlau Dolby Vision ar ddyfeisiau heb ddatgodio Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Gofynnwch bob tro';

  @override
  String get settingsPreferHdr10Fallback =>
      'Mae\'n well gennyf HDR10 wrth gefn';

  @override
  String get settingsPreferServerTranscode =>
      'Mae\'n well gennyf drawsgod gweinydd';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Proffil Dolby Vision 7 Chwarae Uniongyrchol';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Yn rheoli a ddylai ffrydiau haen gwella proffil Dolby Vision 7 gyfeirio chwarae.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto';

  @override
  String get settingsEnabledOnThisDevice => 'Wedi\'i alluogi ar y ddyfais hon';

  @override
  String get settingsDisabledPreferTranscode =>
      'Anabl (mae\'n well gennym drawsgod)';

  @override
  String get settingsResumeRewindDescription =>
      'Wrth ailddechrau chwarae (o Parhau i Gwylio neu dudalen eitem cyfryngau), sawl eiliad y dylid ei hailddirwyn?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Wrth ailddechrau chwarae ar ôl pwyso\'r botwm saib, sawl eiliad y dylid ei ail-ddirwyn?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Sawl eiliad i neidio yn ôl ar ôl pwyso\'r botwm ailddirwyn.';

  @override
  String get settingsOneSecond => '1 eiliad';

  @override
  String get settingsThreeSeconds => '3 eiliad';

  @override
  String get settingsFortyFiveSeconds => '45 eiliad';

  @override
  String get settingsSixtySeconds => '60 eiliad';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Sawl eiliad i neidio ymlaen ar ôl pwyso\'r botwm cyflym ymlaen.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 i ddatgodiwr allanol';

  @override
  String get settingsCinemaMode => 'Modd Sinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Chwarae trelars/rhaglenni cyn prif nodwedd';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Mae Estynedig yn dangos cerdyn llawn gyda gwaith celf pennod a disgrifiad. Mae lleiafswm yn dangos troshaen cyfrif i lawr cryno. Mae\'r anabl yn cuddio\'r anogwr yn gyfan gwbl.';

  @override
  String get settingsShort => 'Byr';

  @override
  String get settingsLong => 'Hir';

  @override
  String get settingsVeryLong => 'Hir iawn';

  @override
  String get settingsVideoStartDelay => 'Oedi Cychwyn Fideo';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Teledu Uniongyrchol byw';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Galluogi chwarae uniongyrchol ar gyfer Teledu Byw';

  @override
  String get settingsOpenGroups => 'Grwpiau Agored';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Creu, ymuno, neu reoli grwpiau SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'Wedi galluogi SyncPlay';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Galluogi nodweddion gwylio grŵp';

  @override
  String get settingsSyncplayButton => 'Botwm SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Dangoswch y botwm SyncPlay ar y bar llywio';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Cywiriad Uwch';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Galluogi rhesymeg cysoni manwl';

  @override
  String get settingsSyncplaySyncCorrection => 'Cywiriad Cysoni';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Addasu chwarae yn awtomatig i aros mewn cydamseriad';

  @override
  String get settingsSyncplaySpeedToSync => 'Cyflymder Cysoni';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Defnyddiwch addasiad cyflymder chwarae i gysoni';

  @override
  String get settingsSyncplaySkipToSync => 'Neidio i Sync';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => 'Defnyddio ceisio cysoni';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Isafswm Oedi Cyflymder';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Oedi Cyflymder Uchaf';

  @override
  String get settingsSyncplaySpeedDuration => 'Cyflymder Hyd';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Oedi Sgipio Lleiaf';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Gwrthbwyso Ychwanegol';

  @override
  String get onNow => 'Ar Nawr';

  @override
  String get collections => 'Casgliadau';

  @override
  String get lastPlayed => 'Chwaraewyd ddiwethaf';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Diweddaraf $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '$libraryName a Ryddhawyd yn Ddiweddar';
  }

  @override
  String get autoplayNextEpisode => 'Awtochwarae\'r bennod nesaf';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Chwaraewch y bennod nesaf yn awtomatig pan fydd ar gael.';

  @override
  String get skipSilenceTitle => 'Hepgor distawrwydd';

  @override
  String get skipSilenceSubtitle =>
      'Sgipiwch segmentau sain tawel yn awtomatig pan fydd y ffrwd yn eu cefnogi.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Caniatáu effeithiau sain allanol';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Caniatáu i apiau cyfartalwr ac effeithiau (e.e. Wavelet) atodi i sesiynau chwarae Media3.';

  @override
  String get disableTunnelingTitle => 'Analluogi twnelu';

  @override
  String get disableTunnelingSubtitle =>
      'Gorfodi chwarae di-dwnnel. Defnyddiol ar ddyfeisiadau gyda diffyg parhad sain/fideo twnelu.';

  @override
  String get enableTunnelingTitle => 'Galluogi twnelu';

  @override
  String get enableTunnelingSubtitle =>
      'Uwch. Yn llwybro sain a fideo drwy lwybr caledwedd cyplysedig. I ffwrdd yn ddiofyn am ei fod yn achosi i sain/fideo dorri ar rai dyfeisiau.';

  @override
  String get mapDolbyVisionP7Title => 'Mapiwch Dolby Vision proffil 7 i HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Chwarae Dolby Vision proffil 7 ffrwd fel HDR10-compatible HEVC ar ddyfeisiau nad ydynt yn DV.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Defnyddiwch arddulliau is-deitl wedi\'u mewnosod';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Cymhwyso lliwiau, ffontiau a lleoliad sydd wedi\'u hymgorffori yn y trac is-deitl. Analluoga i ddefnyddio eich dewisiadau arddull capsiwn yn lle hynny.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Defnyddiwch feintiau ffontiau is-deitl wedi\'u mewnosod';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Cymhwyso awgrymiadau maint ffont sydd wedi\'u hymgorffori yn y trac is-deitl. Analluogi defnyddio maint yr is-deitl o\'ch dewisiadau arddull.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Dangos Manylion y Cyfrwng';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Dangos manylion yr eitem a ddewiswyd ar frig tudalennau\'r Llyfrgell.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Defnyddiwch Is-benawdau Manwl';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Dangos subrow manwl neu fach iawn ar dudalennau\'r Llyfrgell.';

  @override
  String get savedThemesDeleteDialogTitle => 'Dileu thema sydd wedi\'i chadw?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Tynnu \"$themeName\" o storfa\'r ddyfais hon?';
  }

  @override
  String get themeStore => 'Siop Themâu';

  @override
  String get themeStoreSubtitle => 'Pori a chadw themâu\'r gymuned';

  @override
  String get themeStoreDescription =>
      'Arbedwch thema i\'w defnyddio fel eich themâu eraill sydd wedi\'u harbed.';

  @override
  String get themeStoreEmpty => 'Does dim themâu ar gael ar hyn o bryd.';

  @override
  String get themeStoreLoadFailed =>
      'Methwyd â llwytho\'r Siop Themâu. Gwiriwch eich cysylltiad a rhowch gynnig arall arni.';

  @override
  String get themeStoreSave => 'Cadw';

  @override
  String get themeStoreSaveAndApply => 'Arbed a gosod';

  @override
  String get themeStoreSaved => 'Wedi\'i arbed';

  @override
  String get themeStoreInvalidMessage => 'Methwyd â llwytho\'r thema hon.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Wedi arbed \"$themeName\".';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Wedi dileu \"$themeName\" o\'r ddyfais hon.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Methu dileu \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Themâu wedi\'u cadw';

  @override
  String get savedThemesDescription =>
      'Mae\'r rhain yn themâu wedi\'u llwytho i lawr o\'r ategyn Moonfin ar gyfer y gweinydd presennol. Mae dileu yn dileu\'r copi lleol hwn yn unig.';

  @override
  String get savedThemesEmpty =>
      'Ni chanfuwyd unrhyw themâu sydd wedi\'u cadw ar gyfer y gweinydd hwn.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Yn weithredol ar hyn o bryd';
  }

  @override
  String get savedThemesDeleteTooltip => 'Dileu thema sydd wedi\'i chadw';

  @override
  String get savedThemesManageSubtitle =>
      'Rheoli themâu ategyn wedi\'u lawrlwytho ar y ddyfais hon';

  @override
  String get themeEditor => 'Golygydd Thema';

  @override
  String get themeEditorSubtitle =>
      'Agorwch y Golygydd Thema Moonfin yn eich porwr';

  @override
  String get homeScreen => 'Sgrin Cartref';

  @override
  String get bottomBar => 'Bar Gwaelod';

  @override
  String get homeRowsStyleClassic => 'Clasurol';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Rhesi Cartref';

  @override
  String get rowsType => 'Math Rhesi';

  @override
  String get rowsTypeDescription =>
      'Mae Classic yn cadw\'r math o ddelwedd fesul rhes a throshaen gwybodaeth. Mae Modern yn defnyddio rhesi portread-i-gefndir.';

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
  String get displayFavoritesRows => 'Dangos Rhesi Ffefrynnau';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Dangoswch Hoff Ffilmiau, Cyfres, a hoff resi eraill yn yr Adrannau Cartref.';

  @override
  String get favoritesRowSorting => 'Ffefrynnau Didoli Rhes';

  @override
  String get favoritesRowSortingDescription =>
      'Trefnu rhesi Ffefrynnau yn ôl dyddiad a ychwanegwyd, dyddiad rhyddhau, yn nhrefn yr wyddor, a mwy.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Rhesi Casgliadau Arddangos';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Dangos rhesi Casgliadau yn yr Adrannau Cartref.';

  @override
  String get collectionsRowSorting => 'Didoli Rhes Casgliadau';

  @override
  String get collectionsRowSortingDescription =>
      'Trefnu rhesi Casgliadau yn ôl dyddiad a ychwanegwyd, dyddiad rhyddhau, yn nhrefn yr wyddor, a mwy.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Rhesi Genres Arddangos';

  @override
  String get displayGenresRowsSubtitle =>
      'Dangos rhesi Genres yn Adrannau Cartref.';

  @override
  String get genresRowSorting => 'Didoli Rhes Genres';

  @override
  String get genresRowSortingDescription =>
      'Trefnu rhesi Genres yn ôl dyddiad a ychwanegwyd, dyddiad rhyddhau, yn nhrefn yr wyddor, a mwy.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Eitemau Rhes Genres';

  @override
  String get genresRowItemsDescription =>
      'Dangos Ffilmiau, Cyfresi, neu\'r ddau yn rhesi Genres.';

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
  String get displayPlaylistsRows => 'Dangos Rhesi Rhestrau Chwarae';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Dangos rhesi Rhestrau Chwarae yn yr Adrannau Cartref.';

  @override
  String get playlistsRowSorting => 'Trefnu Rhesi\'r Rhestrau Chwarae';

  @override
  String get playlistsRowSortingDescription =>
      'Trefnu rhesi\'r Rhestrau Chwarae yn ôl y dyddiad ychwanegu, y dyddiad rhyddhau, yn nhrefn yr wyddor, a mwy.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Dangos Rhesi Sain';

  @override
  String get displayAudioRowsSubtitle =>
      'Dangos rhesi Sain yn yr Adrannau Cartref.';

  @override
  String get audioRowsSorting => 'Trefnu\'r Rhesi Sain';

  @override
  String get audioRowsSortingDescription =>
      'Trefnu rhesi Sain yn ôl y dyddiad ychwanegu, y dyddiad rhyddhau, yn nhrefn yr wyddor, a mwy.';

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
  String get audioPlaylists => 'Rhestrau Chwarae Sain';

  @override
  String get appearance => 'Gwedd';

  @override
  String get layout => 'Cynllun';

  @override
  String get theme => 'Thema';

  @override
  String get keyboard => 'Bysellfwrdd';

  @override
  String get navButtons => 'Botymau';

  @override
  String get rendering => 'Rendro';

  @override
  String get mpvConfiguration => 'Ffurfweddiad MPV';

  @override
  String get cardSize => 'Maint Cerdyn';

  @override
  String get externalPlayerApp => 'Ap chwaraewr allanol';

  @override
  String get externalPlayerAppDescription =>
      'Gosodwch chwaraewr allanol i alluogi\'r opsiwn chwarae gwasg-hir';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Dangos dewisydd ap pan fydd chwarae yn dechrau.';

  @override
  String get loadingInstalledPlayers =>
      'Wrthi\'n llwytho chwaraewyr sydd wedi\'u gosod…';

  @override
  String get connection => 'Cysylltiad';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Trosglwyddo';

  @override
  String get supportedOnThisDevice => 'Cefnogir ar y ddyfais hon';

  @override
  String get notSupportedOnThisDevice => 'Heb ei gefnogi ar y ddyfais hon';

  @override
  String get mediaPlayerBehavior => 'Ymddygiad Chwaraewr Cyfryngau';

  @override
  String get playbackEnhancements => 'Gwelliannau Chwarae';

  @override
  String get alwaysOn => 'Bob amser ymlaen.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Disodli Skip Outro gyda Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Dangoswch y troshaen Next Up yn lle\'r botwm Skip Outro.';

  @override
  String get playerRouting => 'Llwybro Chwaraewr';

  @override
  String get preferSoftwareDecoders => 'Gwell datgodyddion meddalwedd';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Defnyddiwch FFmpeg (sain) a libgav1 (AV1) cyn datgodyddion caledwedd. Analluoga os yw passthrough sain HDMI yn torri.';

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
  String get useExternalPlayer => 'Defnyddiwch chwaraewr allanol';

  @override
  String get useExternalPlayerSubtitle =>
      'Agorwch chwarae fideo yn eich ap allanol dethol ar Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Ciwio Awtomatig';

  @override
  String get preferSdhSubtitles => 'Gwell isdeitlau SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Blaenoriaethu traciau is-deitl SDH/CC wrth ddewis yn awtomatig.';

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
  String get webDiagnostics => 'Diagnosteg gwe';

  @override
  String get webDiagnosticsTitle => 'Moonfin Diagnosteg Gwe';

  @override
  String get webDiagnosticsIntro =>
      'Defnyddiwch y dudalen hon i wneud diagnosis o broblemau cysylltedd porwr (CORS, cynnwys cymysg, a gosodiadau darganfod).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Canfod Methiant Cynnwys Cymysg';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Wedi canfod CORS/Methiant Rhag Hedfan';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Canfu Moonfin dudalen HTTPS yn ceisio galw URL gweinydd HTTP. Mae porwyr yn rhwystro\'r cais hwn cyn iddo gyrraedd eich gweinydd.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Canfu Moonfin fethiant cais ar lefel porwr a achosir yn aml gan fod penawdau CORS neu rag-hedfan ar goll ar y gweinydd cyfryngau.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL targed: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Manylion: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Cyd-destun Amser Rhedeg Presennol';

  @override
  String get webDiagnosticsOrigin => 'Tarddiad';

  @override
  String get webDiagnosticsScheme => 'Cynllun';

  @override
  String get webDiagnosticsPluginMode => 'Modd Ategyn';

  @override
  String get webDiagnosticsWebRtcScan => 'Sgan WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL Gweinydd dan Orfod';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL Gweinydd Diofyn';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL Dirprwy Darganfod';

  @override
  String get notConfigured => 'heb ei ffurfweddu';

  @override
  String get webDiagnosticsMixedContent => 'Cynnwys Cymysg';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Mae\'r dudalen hon wedi\'i llwytho dros HTTPS, ond mae un neu fwy o URLau wedi\'u ffurfweddu yn HTTP. Mae porwyr yn rhwystro tudalennau HTTPS rhag galw APIs HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Trwsio: gwasanaethwch eich gweinydd cyfryngau neu bwynt terfyn dirprwy trwy HTTPS, neu llwythwch Moonfin dros HTTP ar rwydweithiau lleol dibynadwy yn unig.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Dim ffurfweddiad cynnwys cymysg amlwg wedi\'i ganfod o\'r gosodiadau amser rhedeg cyfredol.';

  @override
  String get webDiagnosticsCorsChecklist => 'Rhestr Wirio CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Caniatáu tarddiad y porwr yn Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Cynnwys Awdurdodi, X-Emby-Authorization, a X-Emby-Token yn Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Amrediad Cynnwys-Ystod a Derbyn-Ystod ar gyfer ffrydio a cheisio ymddygiad.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Dychwelwch 204 i geisiadau rhag-hedfan OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Darn Pennawd Enghreifftiol (arddull nginx)';

  @override
  String get note => 'Nodyn';

  @override
  String get webDiagnosticsNonWebNote =>
      'Mae\'r llwybr diagnosteg hwn wedi\'i fwriadu ar gyfer adeiladu gwe. Os ydych chi\'n gweld hwn ar lwyfan arall, efallai na fydd y gwiriadau hyn yn berthnasol.';

  @override
  String get backToServerSelect => 'Yn ôl i Dewis Gweinydd';

  @override
  String get signOutAllUsers => 'Allgofnodi Pob Defnyddiwr';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Gwrthodir caniatâd meicroffon yn barhaol. Ei alluogi mewn gosodiadau system.';

  @override
  String get voiceSearchPermissionRequired =>
      'Mae angen caniatâd meicroffon ar gyfer chwiliad llais.';

  @override
  String get voiceSearchNoMatch => 'Heb ddal hynny. Ceisiwch eto.';

  @override
  String get voiceSearchNoSpeechDetected => 'Dim lleferydd wedi\'i ganfod.';

  @override
  String get voiceSearchMicrophoneError => 'Gwall meicroffon.';

  @override
  String get voiceSearchNeedsInternet =>
      'Mae angen rhyngrwyd ar gyfer chwiliad llais.';

  @override
  String get voiceSearchServiceBusy =>
      'Mae gwasanaeth llais yn brysur. Ceisiwch eto.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Gwrthodir caniatâd meicroffon yn barhaol.';

  @override
  String get microphonePermissionDenied => 'Gwrthodir caniatâd meicroffon.';

  @override
  String get speechRecognitionUnavailable =>
      'Nid yw system adnabod llais ar gael ar y ddyfais hon.';

  @override
  String get openIosRoutePicker => 'Agor codwr llwybr iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Nid yw dewiswr llwybr AirPlay ar gael ar y ddyfais hon.';

  @override
  String get videos => 'Fideos';

  @override
  String get programs => 'Rhaglenni';

  @override
  String get songs => 'Caneuon';

  @override
  String get photoAlbums => 'Albymau Lluniau';

  @override
  String get photos => 'Lluniau';

  @override
  String get people => 'Pobl';

  @override
  String get recentlyReleasedEpisodes => 'Pennodau a Ryddhawyd yn Ddiweddar';

  @override
  String get watchAgain => 'Gwyliwch Eto';

  @override
  String get guestAppearances => 'Ymddangosiadau Gwesteion';

  @override
  String get appearancesSeerr => 'Ymddangosiadau (Seerr)';

  @override
  String get crewContributionsSeerr => 'Cyfraniadau\'r Criw (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Gwyliwch gyda\'r grŵp';

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
  String get disk => 'Disg';

  @override
  String get openInBrowser => 'Agor yn Porwr';

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
      'Nid yw porwr wedi\'i fewnosod ar gael ar y platfform hwn.';

  @override
  String get adminRestartServerConfirmation =>
      'Ydych chi\'n siŵr eich bod am ailgychwyn y gweinydd?';

  @override
  String get adminShutdownServerConfirmation =>
      'Ydych chi\'n siŵr eich bod am gau\'r gweinydd? Bydd angen i chi ei ailgychwyn â llaw.';

  @override
  String get internal => 'Mewnol';

  @override
  String get idle => 'Segur';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Ni chanfuwyd unrhyw ddefnyddwyr';

  @override
  String get adminNoUsersMatchSearch =>
      'Nid oes unrhyw ddefnyddwyr yn cyfateb i\'ch chwiliad';

  @override
  String get adminNoDevicesFound => 'Heb ganfod dyfeisiau';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nid oes unrhyw ddyfeisiau yn cyfateb i\'r hidlyddion cyfredol';

  @override
  String get remoteAccess => 'Mynediad o Bell';

  @override
  String get localOnly => 'Lleol yn Unig';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Wedi methu llwytho dadansoddeg cyfryngau';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Dadansoddeg gyfunol ar draws holl lyfrgelloedd y cyfryngau.';

  @override
  String get analyticsTopArtists => 'Artistiaid Gorau';

  @override
  String get analyticsTopAuthors => 'Prif Awduron';

  @override
  String get analyticsTopContributors => 'Cyfranwyr Gorau';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Llyfrgell',
      two: '$count Lyfrgell',
      zero: '$count o Lyfrgelloedd',
      one: '1 Llyfrgell',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Nid oes cyfansymiau cyfryngau mynegedig ar gael ar gyfer y detholiad hwn eto.';

  @override
  String get analyticsLibraryDetails => 'Manylion y Llyfrgell';

  @override
  String get analyticsLibraryBreakdown => 'Chwalfa Llyfrgell';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Nid oes unrhyw lyfrgelloedd ar gael.';

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
  String get adminServerAdministrationTitle => 'Gweinyddu Gweinydd';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Cache Delwedd';

  @override
  String get adminServerPathCache => 'Storfa';

  @override
  String get adminServerPathLogs => 'Logiau';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Trawsgod';

  @override
  String get adminServerPathWeb => 'Gwe';

  @override
  String get adminNoServerPathsReturned =>
      'Ni ddychwelwyd unrhyw lwybrau gweinydd gan y gweinydd hwn.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% wedi\'i ddefnyddio';
  }

  @override
  String get userActivity => 'Gweithgaredd Defnyddiwr';

  @override
  String get systemEvents => 'Digwyddiadau System';

  @override
  String get needsAttention => 'Angen Sylw';

  @override
  String get homeVideos => 'Fideos Cartref';

  @override
  String get mixedContent => 'Cynnwys Cymysg';

  @override
  String get homeVideosAndPhotos => 'Fideos Cartref a Lluniau';

  @override
  String get mixedMoviesAndShows => 'Ffilmiau a Sioeau Cymysg';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Ni chanfuwyd unrhyw recordiadau';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Dim tudalennau delwedd wedi\'u canfod y tu mewn i .$extension archive.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Methodd rendr wedi\'i fewnosod ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Methodd rendr EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Ffeil leol ar goll ar gyfer darllenydd: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status wrth agor data llyfrau o $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Dim pwynt gorffen llyfr darllenadwy ar gael';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Fformat archif comic heb ei gefnogi: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Nid yw ategyn echdynnu CBR ar gael ar y platfform hwn.';

  @override
  String get failedToExtractCbrArchive => 'Wedi methu ag echdynnu archif .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Nid yw echdynnu CB7 ar gael ar y platfform hwn.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Nid yw ategyn echdynnu CB7 ar gael ar y platfform hwn.';

  @override
  String get loadingShuffle => 'Wrthi\'n llwytho siffrwd…';

  @override
  String get libraryShuffleLabel => 'HAPCHWARAE\'R LLYFRGELL';

  @override
  String get randomShuffleLabel => 'HAPCHWARAE AR HAP';

  @override
  String get genresShuffleLabel => 'HAPCHWARAE GENRES';

  @override
  String get autoHdrSwitching => 'Newid HDR Auto';

  @override
  String get autoHdrSwitchingDescription =>
      'Galluogi HDR yn awtomatig ar gyfer chwarae fideo HDR ac adfer modd arddangos wrth ymadael.';

  @override
  String get whenFullscreen => 'Pan fydd sgrin lawn';

  @override
  String get changeArtwork => 'Newid y Gwaith Celf';

  @override
  String get missing => 'Ar goll';

  @override
  String get clearAllArtworkButton => 'Clirio\'r holl waith celf?';

  @override
  String get clearAllArtworkWarning =>
      'Ydych chi\'n siŵr eich bod am glirio\'r holl waith celf a lawrlwythwyd?';

  @override
  String get confirmClear => 'Cadarnhau\'r Clirio';

  @override
  String confirmClearMessage(String itemType) {
    return 'Ydych chi\'n siŵr eich bod am glirio\'r $itemType hwn?';
  }

  @override
  String get uploadButton => 'Uwchlwytho?';

  @override
  String get resolutionLabel => 'Cydraniad: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Dangos gwaith celf yn iaith y rhyngwyneb yn unig';

  @override
  String get confirmClearAll => 'Cadarnhau Clirio\'r Cyfan';

  @override
  String get imageUploadSuccess => 'Uwchlwythwyd y ddelwedd yn llwyddiannus!';

  @override
  String imageUploadFailed(String error) {
    return 'Wedi methu uwchlwytho\'r ddelwedd: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Wedi methu gosod y ddelwedd: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Wedi methu dileu\'r ddelwedd: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Wedi methu clirio\'r holl waith celf: $error';
  }

  @override
  String get yes => 'Ie';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Cefndiroedd';

  @override
  String get bannerCategory => 'Baner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Mân-lun';

  @override
  String get artCategory => 'Celf';

  @override
  String get discArtCategory => 'Celf y Ddisg';

  @override
  String get screenshotCategory => 'Sgrinlun';

  @override
  String get boxCoverCategory => 'Clawr y Blwch';

  @override
  String get boxRearCoverCategory => 'Clawr Cefn y Blwch';

  @override
  String get menuArtCategory => 'Celf y Ddewislen';

  @override
  String get confirmItemPoster => 'poster';

  @override
  String get confirmItemBackdrop => 'cefndir';

  @override
  String get confirmItemBanner => 'baner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'mân-lun';

  @override
  String get confirmItemArt => 'celf';

  @override
  String get confirmItemDiscArt => 'celf disg';

  @override
  String get confirmItemScreenshot => 'sgrinlun';

  @override
  String get confirmItemBoxCover => 'clawr blwch';

  @override
  String get confirmItemBoxRearCover => 'clawr cefn blwch';

  @override
  String get confirmItemMenuArt => 'celf dewislen';

  @override
  String get resolutionAll => 'Pob un';

  @override
  String get resolutionHigh => 'Uchel (1080p+)';

  @override
  String get resolutionMedium => 'Canolig (720p)';

  @override
  String get resolutionLow => 'Isel (<720p)';

  @override
  String get sources => 'Ffynonellau';

  @override
  String get audiobookChapters => 'Penodau';

  @override
  String get audiobookBookmarks => 'Nodau tudalen';

  @override
  String get audiobookNotes => 'Nodiadau';

  @override
  String get audiobookQueue => 'Ciw';

  @override
  String get audiobookTimeline => 'Llinell amser';

  @override
  String get audiobookTimelineEmpty => 'Mae\'r llinell amser yn wag';

  @override
  String get audiobookFocusedTimeline => 'Llinell Amser â Ffocws';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Allforio\'r Nodau Tudalen';

  @override
  String get audiobookExportNotes => 'Allforio\'r Nodiadau';

  @override
  String get audiobookExportAll => 'Allforio\'r Cyfan';

  @override
  String audiobookExportSuccess(String path) {
    return 'Wedi\'i allforio i $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Methodd yr allforio: $error';
  }

  @override
  String get audiobookLyrics => 'Geiriau';

  @override
  String get audiobookAddBookmark => 'Ychwanegu nod tudalen';

  @override
  String get audiobookAddNote => 'Ychwanegu nodiad';

  @override
  String get audiobookEditNote => 'Golygu\'r nodiad';

  @override
  String get audiobookNoteHint => 'Ysgrifennwch nodiad ar gyfer y foment hon';

  @override
  String get audiobookSleepTimer => 'Amserydd cysgu';

  @override
  String get audiobookSleepOff => 'I ffwrdd';

  @override
  String get audiobookSleepEndOfChapter => 'Diwedd y bennod';

  @override
  String get audiobookSleepCustom => 'Personol';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining ar ôl';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mun',
      one: '1 mun',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Cyflymder chwarae';

  @override
  String get audiobookRemainingTime => 'Ar ôl';

  @override
  String get audiobookElapsedTime => 'Wedi mynd heibio';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Yn ôl ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Ymlaen ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Y bennod flaenorol';

  @override
  String get audiobookNextChapter => 'Y bennod nesaf';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Pennod $current o $total';
  }

  @override
  String get audiobookNoChapters => 'Dim penodau';

  @override
  String get audiobookNoBookmarks => 'Dim nodau tudalen eto';

  @override
  String get audiobookNoNotes => 'Dim nodiadau eto';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Ychwanegwyd nod tudalen ar $position';
  }

  @override
  String get audiobookSpeedReset => 'Ailosod i 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Cadw';

  @override
  String get audiobookCancel => 'Canslo';

  @override
  String get audiobookDelete => 'Dileu';

  @override
  String get subtitlePreferencesDescription =>
      'Newid moddau isdeitlau, ieithoedd rhagosodedig, golwg, ac opsiynau rendro.';

  @override
  String get subtitleRendering => 'Rendro Isdeitlau';

  @override
  String get displayOptions => 'Opsiynau Dangos';

  @override
  String get releaseDateAscending => 'Dyddiad Rhyddhau (Esgyn)';

  @override
  String get releaseDateDescending => 'Dyddiad Rhyddhau (Disgyn)';

  @override
  String get groupContributions => 'Grwpio Cyfraniadau';

  @override
  String get groupMultipleRoles => 'Grwpio sawl rôl';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Rhybudd Mynediad Ysgrifennu i\'r Llyfrgell';

  @override
  String get libraryWriteAccessHowToFix => 'Sut i drwsio hyn:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Rhowch ganiatâd ysgrifennu i ddefnyddiwr gwasanaeth Jellyfin (e.e. jellyfin neu PUID/PGID Docker) ar gyfer ffolderi eich llyfrgell gyfryngau ar y gweinydd.\n\n2. Neu, ewch i\'ch Dangosfwrdd Jellyfin -> Llyfrgelloedd, golygwch y llyfrgell hon, ac analluogwch \'Cadw gwaith celf yn y ffolderi cyfryngau\' i storio gwaith celf yng nghronfa ddata fewnol Jellyfin.';

  @override
  String get dismiss => 'Diystyru';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Mae eich llyfrgell \'$libraryName\' wedi\'i ffurfweddu i gadw gwaith celf yn uniongyrchol yn y ffolderi cyfryngau (mae \'Cadw gwaith celf yn y ffolderi cyfryngau\' wedi\'i alluogi). Fodd bynnag, mae Jellyfin wedi profi mynediad ysgrifennu ac nid oes ganddo ganiatâd i ysgrifennu ffeiliau i\'r cyfeiriadur hwn:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Mae\'n ymddangos bod Jellyfin wedi methu â diweddaru\'r gwaith celf. Mae eich llyfrgell wedi\'i ffurfweddu i gadw gwaith celf yn uniongyrchol yn y ffolderi cyfryngau (mae \'Cadw gwaith celf yn y ffolderi cyfryngau\' wedi\'i alluogi). Mae\'r gwall hwn fel arfer yn digwydd pan nad oes gan broses gweinydd Jellyfin ganiatâd i ysgrifennu ffeiliau i\'ch cyfeiriaduron cyfryngau.';

  @override
  String get replay => 'Ailchwarae';

  @override
  String get fileInformation => 'Gwybodaeth am y Ffeil';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Maint: $size  •  Fformat: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Dangos Pob Trac Sain ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Dangos Pob Trac Isdeitlau ($count)';
  }

  @override
  String get checkingDirectPlay => 'Yn gwirio\'r gallu Direct Play…';

  @override
  String get directPlayCapabilityLabel => 'Gallu Direct Play: ';

  @override
  String get forced => 'Gorfodol';

  @override
  String get transcodeContainerNotSupported =>
      'Nid yw\'r chwaraewr yn cefnogi fformat y cynhwysydd.';

  @override
  String get transcodeVideoCodecNotSupported => 'Ni chefnogir y codec fideo.';

  @override
  String get transcodeAudioCodecNotSupported => 'Ni chefnogir y codec sain.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Ni chefnogir fformat yr isdeitlau (mae angen eu llosgi i mewn).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Ni chefnogir y proffil sain.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Ni chefnogir y proffil fideo.';

  @override
  String get transcodeVideoLevelNotSupported => 'Ni chefnogir lefel y fideo.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Nid yw\'r ddyfais hon yn cefnogi cydraniad y fideo.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Ni chefnogir dyfnder didau\'r fideo.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Ni chefnogir cyfradd fframiau\'r fideo.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Mae cyfradd didau\'r ffeil yn uwch na therfyn ffrydio\'r chwaraewr.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Mae cyfradd didau\'r fideo yn uwch na\'r terfyn ffrydio.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Mae cyfradd didau\'r sain yn uwch na\'r terfyn ffrydio.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Ni chefnogir nifer y sianeli sain.';

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
  String get sortAlphabetical => 'Yn nhrefn yr wyddor';

  @override
  String get sortReleaseAscending => 'Trefn Rhyddhau (Esgyn)';

  @override
  String get sortReleaseDescending => 'Trefn Rhyddhau (Disgyn)';

  @override
  String get sortCustomDragDrop => 'Personol (Llusgo a Gollwng)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Opsiynau Trefnu\'r Rhestr Chwarae';

  @override
  String get resetSort => 'Ailosod y Drefn';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Ailwylio T$season:P$episode';
  }

  @override
  String get rewatchPlaylist => 'Ailwylio\'r Rhestr Chwarae';

  @override
  String get noSubtitlesFound => 'Ni chanfuwyd unrhyw isdeitlau.';

  @override
  String get adminControls => 'Rheolyddion Gweinyddu';

  @override
  String get impellerRendering => 'Injan rendro (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller yw rendrwr GPU modern Flutter, ar gyfer animeiddiadau llyfnach a llai o hercian. Ar rai bocsys teledu a GPUau hŷn gall achosi namau neu fideo du; diffoddwch ef os gwelwch chi\'r rheini. Mae Awtomatig yn dewis y rhagosodiad gorau ar gyfer eich dyfais. Ailgychwynnwch Moonfin i\'w osod.';

  @override
  String get impellerAuto => 'Awtomatig';

  @override
  String get impellerOn => 'Ymlaen';

  @override
  String get impellerOff => 'I ffwrdd';

  @override
  String get impellerRestartTitle => 'Mae angen ailgychwyn';

  @override
  String get impellerRestartMessage =>
      'Mae angen i Moonfin ailgychwyn i newid yr injan rendro. Caewch yr ap nawr, yna ei ailagor i osod y newid.';

  @override
  String get impellerCloseNow => 'Cau\'r ap nawr';

  @override
  String get adminRefreshLibrary => 'Adnewyddu\'r Llyfrgell';

  @override
  String get adminRefreshAllLibraries => 'Adnewyddu Pob Llyfrgell';

  @override
  String get adminRepoSortDateOldest => 'Dyddiad Ychwanegu (Hynaf yn Gyntaf)';

  @override
  String get adminRepoSortDateNewest =>
      'Dyddiad Ychwanegu (Diweddaraf yn Gyntaf)';

  @override
  String get adminRepoSortNameAsc => 'Yn nhrefn yr wyddor (A i Z)';

  @override
  String get adminRepoSortNameDesc => 'Yn nhrefn yr wyddor (Z i A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Yn llwytho Dadansoddeg y Gweinydd... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource =>
      'Cydweddu â\'r ffynhonnell';

  @override
  String get imdbTop250Movies => '250 Ffilm Orau IMDb';

  @override
  String get imdbTop250TvShows => '250 Cyfres Deledu Orau IMDb';

  @override
  String get imdbMostPopularMovies => 'Ffilmiau Mwyaf Poblogaidd IMDb';

  @override
  String get imdbMostPopularTvShows => 'Cyfresi Teledu Mwyaf Poblogaidd IMDb';

  @override
  String get imdbLowestRatedMovies => 'Ffilmiau â\'r Sgôr Isaf ar IMDb';

  @override
  String get imdbTopEnglishMovies => 'Ffilmiau Saesneg â\'r Sgôr Uchaf ar IMDb';

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
  String get integrations => 'Integreiddiadau';

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
