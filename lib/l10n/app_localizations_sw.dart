// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

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
  String get interfaceLanguage => 'Lugha ya Kiolesura';

  @override
  String get systemLanguageDefault => 'Chaguo-msingi la Mfumo';

  @override
  String get signIn => 'Ingia';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Tupu';

  @override
  String connectingToServer(String serverName) {
    return 'Inaunganisha kwenye $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Nenosiri';

  @override
  String get username => 'Jina la mtumiaji';

  @override
  String get email => 'Barua pepe';

  @override
  String get quickConnectInstruction =>
      'Ingiza msimbo huu kwenye dashibodi ya wavuti ya seva yako:';

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
  String get waitingForAuthorization => 'Inasubiri idhini...';

  @override
  String get back => 'Nyuma';

  @override
  String get serverUnavailable => 'Seva haipatikani';

  @override
  String get loginFailed => 'Kuingia kumeshindwa';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect haipatikani: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect haipatikani ($status): $detail';
  }

  @override
  String get whosWatching => 'Nani anatazama?';

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
  String get addUser => 'Ongeza Mtumiaji';

  @override
  String get selectServer => 'Chagua Seva';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin toleo $version';
  }

  @override
  String get savedServers => 'Seva Zilizohifadhiwa';

  @override
  String get discoveredServers => 'Seva Zilizogunduliwa';

  @override
  String get noneFound => 'Hakuna iliyopatikana';

  @override
  String get unableToConnectToServer => 'Imeshindwa kuunganisha kwenye seva';

  @override
  String get addServer => 'Ongeza Seva';

  @override
  String get embyConnect => 'Emby Unganisha';

  @override
  String get removeServer => 'Ondoa Seva';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Ondoa \"$serverName\" kutoka kwa seva zako?';
  }

  @override
  String get cancel => 'Ghairi';

  @override
  String get remove => 'Ondoa';

  @override
  String get connectToServer => 'Unganisha kwa Seva';

  @override
  String get serverAddress => 'Anwani ya Seva';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Unganisha';

  @override
  String get secureStorageUnavailable => 'Hifadhi Salama Haipatikani';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin haikuweza kufikia ufunguo wa mfumo wako. Kuingia kunaweza kuendelea, lakini hifadhi salama ya tokeni huenda isipatikane hadi ufunguo ufunguliwe.';

  @override
  String get ok => 'Sawa';

  @override
  String get settingsAppearanceTheme => 'Mandhari ya Programu';

  @override
  String get detailScreenStyle => 'Mtindo wa skrini ya maelezo';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasiki ni mpangilio asili wa Moonfin ulio katikati. Kisasa ni mpangilio wa kisinema unaojirekebisha.';

  @override
  String get detailScreenStyleMoonfin => 'Klasiki';

  @override
  String get detailScreenStyleModern => 'Kisasa';

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
  String get expandedTabs => 'Vichupo Vilivyopanuliwa';

  @override
  String get expandedTabsSubtitle =>
      'Onyesha maudhui ya kichupo kiotomatiki unapovinjari vichupo. Zima ili kufungua na kufunga kila kichupo mwenyewe.';

  @override
  String get showTechnicalDetails => 'Onyesha Maelezo ya Kiufundi?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Onyesha maelezo ya kodeki, mwonekano, na mtiririko katika muhtasari wa bango';

  @override
  String get recommendationSystem => 'Mfumo wa Mapendekezo';

  @override
  String get recommendationSystemSubtitle =>
      'Tumia algoriti ya maktaba ya ndani ya Moonfin Recommends au Vipimo vya Ufanano vya TMDb mtandaoni. Kumbuka: Mapendekezo ya mtandaoni yanahitaji muunganisho wa Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Ufanano wa TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Tumia Kikomo cha Ukadiriaji wa Wazazi?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Punguza mapendekezo ya Moonfin Recommends kulingana na ukadiriaji wa wazazi wa maudhui lengwa';

  @override
  String get interfaceStyle => 'Mtindo wa Kiolesura';

  @override
  String get interfaceStyleSubtitle =>
      'Kiotomatiki hulingana na kifaa chako. Chagua Apple au Material ili kulazimisha muonekano.';

  @override
  String get interfaceStyleAutomatic => 'Kiotomatiki';

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
  String get glassQuality => 'Ubora wa Glass';

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
      'Otomatiki huchagua athari bora ya glass kwa kifaa hiki. Kamili hulazimisha ukungu halisi; Iliyopunguzwa hutumia glass nyepesi inayookoa nguvu ya GPU.';

  @override
  String get glassQualityAuto => 'Otomatiki';

  @override
  String get glassQualityFull => 'Kamili';

  @override
  String get glassQualityReduced => 'Iliyopunguzwa';

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
      'Badili kati ya Moonfin na Neon Pulse bila kuanzisha upya programu';

  @override
  String get customThemeTitle => 'Mandhari Maalum';

  @override
  String get customThemeSubtitle =>
      'Mandhari maalum hubadilisha vipengele vya kuonekana katika Moonfin nzima. Chagua mojawapo ya chaguo hizi ili kuendana na mtindo wako.';

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
      'Mwonekano wa sasa wa Moonfin nyote mmependa';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Mtindo wa Synthwave wenye mng\'ao wa magenta, maandishi ya samawati na utofautishaji thabiti wa chrome';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Mtindo wa glasi-tiririka wenye mandharinyuma ya rangi inayosogea, nyuso zenye ukungu, na rangi ya samawati ya Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Mtindo wa sanaa ya pikseli wa zamani wenye rangi nzito, mipaka ya vitalu, vivuli vikali, na fonti ya pikseli';

  @override
  String get embyConnectSignInSubtitle =>
      'Ingia ukitumia akaunti yako ya Emby Connect';

  @override
  String get emailOrUsername => 'Barua pepe au Jina la mtumiaji';

  @override
  String get selectAServer => 'Chagua Seva';

  @override
  String get tryAgain => 'Jaribu Tena';

  @override
  String get noLinkedServers =>
      'Hakuna seva zilizounganishwa kwenye akaunti hii ya Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Kitambulisho batili cha Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Emby batili Unganisha jina la mtumiaji au nenosiri';

  @override
  String get embyConnectExchangeNotSupported =>
      'Seva haitumii ubadilishaji wa Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Hitilafu ya mtandao wakati unawasiliana na Emby Connect au seva iliyochaguliwa';

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
  String get loadingLinkedServers => 'Inapakia seva zilizounganishwa...';

  @override
  String get connectingToServerEllipsis => 'Inaunganisha kwenye seva...';

  @override
  String get noReachableAddress =>
      'Hakuna anwani inayoweza kufikiwa iliyotolewa';

  @override
  String get invalidServerExchangeResponse =>
      'Jibu batili kutoka kwa sehemu ya mwisho ya ubadilishaji wa seva';

  @override
  String unableToConnectTo(String target) {
    return 'Imeshindwa kuunganisha kwenye $target';
  }

  @override
  String get exitApp => 'Ungependa kufunga Moonfin?';

  @override
  String get exitAppConfirmation => 'Je, una uhakika unataka kuondoka?';

  @override
  String get exit => 'Utgång';

  @override
  String get gameMenu => 'Menyu';

  @override
  String get gamePaused => 'Imesitishwa';

  @override
  String get gameSaveState => 'Hifadhi hali';

  @override
  String get games => 'Michezo';

  @override
  String get gameLoadState => 'Pakia hali';

  @override
  String get gameFastForward => 'Sogeza mbele haraka';

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
  String get gameEmulatorSettings => 'Mipangilio ya emulator';

  @override
  String get gameNoCoreOptions =>
      'Kiini hiki hakina chaguo zinazoweza kurekebishwa.';

  @override
  String get gameHoldToOpenMenu => 'Shikilia ili kufungua menyu';

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
      'Kucheza michezo hakutumiki kwenye kifaa hiki bado.';

  @override
  String get noHomeRowsLoaded =>
      'Hakuna safu mlalo za mwanzo zilizoweza kupakiwa';

  @override
  String get noHomeRowsHint =>
      'Jaribu kuonyesha upya au kupunguza sehemu za nyumbani zinazotumika.';

  @override
  String get retryHomeRows => 'Jaribu tena Safu Mlalo za Nyumbani';

  @override
  String get guide => 'Mwongozo';

  @override
  String get recordings => 'Rekodi';

  @override
  String get schedule => 'Ratiba';

  @override
  String get series => 'Mifululizo';

  @override
  String get noItemsFound => 'Hakuna vipengee vilivyopatikana';

  @override
  String get home => 'Mwanzo';

  @override
  String get browseAll => 'Vinjari Vyote';

  @override
  String get genres => 'Aina';

  @override
  String get collectionPlaceholder =>
      'Vipengee vya mkusanyiko vitaonekana hapa';

  @override
  String get browseByLetter => 'Vinjari kwa Barua';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Kuvinjari kwa alfabeti kutaonekana hapa';

  @override
  String get suggestions => 'Mapendekezo';

  @override
  String get suggestionsPlaceholder =>
      'Vipengee vilivyopendekezwa vitaonekana hapa';

  @override
  String get failedToLoadLibraries => 'Imeshindwa kupakia maktaba';

  @override
  String get noLibrariesFound => 'Hakuna maktaba zilizopatikana';

  @override
  String get library => 'Maktaba';

  @override
  String get displaySettings => 'Mipangilio ya Maonyesho';

  @override
  String get allGenres => 'Aina Zote';

  @override
  String get noGenresFound => 'Hakuna aina zilizopatikana';

  @override
  String failedToLoadFolderError(String error) {
    return 'Imeshindwa kupakia folda: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Folda hii haina chochote';

  @override
  String itemCountLabel(int count) {
    return 'vipengee $count';
  }

  @override
  String get failedToLoadFavorites => 'Imeshindwa kupakia vipendwa';

  @override
  String get retry => 'Jaribu tena';

  @override
  String get noFavoritesYet => 'Bado hakuna vipendwa';

  @override
  String get favorites => 'Vipendwa';

  @override
  String totalCountItems(int count) {
    return 'Vipengee $count';
  }

  @override
  String get continuing => 'Kuendelea';

  @override
  String get ended => 'Imeisha';

  @override
  String get sortAndFilter => 'Panga & Chuja';

  @override
  String get type => 'Aina';

  @override
  String get sortBy => 'Panga Kwa';

  @override
  String get display => 'Onyesho';

  @override
  String get imageType => 'Aina ya Picha';

  @override
  String get posterSize => 'Ukubwa wa Bango';

  @override
  String get small => 'Ndogo';

  @override
  String get medium => 'Kati';

  @override
  String get large => 'Kubwa';

  @override
  String get extraLarge => 'Kubwa Zaidi';

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
    return '$name — Aina';
  }

  @override
  String get views => 'Maoni';

  @override
  String get albums => 'Albamu';

  @override
  String get albumArtists => 'Wasanii wa Albamu';

  @override
  String get artists => 'Wasanii';

  @override
  String get bookmarks => 'Alamisho';

  @override
  String get noSavedBookmarks =>
      'Bado hakuna alamisho zilizohifadhiwa za kichwa hiki.';

  @override
  String get openBook => 'Fungua Kitabu';

  @override
  String get chapter => 'Sura';

  @override
  String get page => 'Ukurasa';

  @override
  String get bookmark => 'Alamisho';

  @override
  String get justNow => 'Sasa hivi';

  @override
  String minutesAgo(int count) {
    return 'dk $count zilizopita';
  }

  @override
  String hoursAgo(int count) {
    return 'saa $count zilizopita';
  }

  @override
  String daysAgo(int count) {
    return 'siku $count zilizopita';
  }

  @override
  String get discoverySubjects => 'Masomo ya Ugunduzi';

  @override
  String get apply => 'Tumia';

  @override
  String get openLink => 'Fungua Kiungo';

  @override
  String get scanWithYourPhone => 'Changanua kwa simu yako';

  @override
  String get audiobookGenres => 'Aina za vitabu vya sauti';

  @override
  String get scrollLeft => 'Sogeza kushoto';

  @override
  String get scrollRight => 'Sogeza kulia';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre => 'Haikuweza kupakia aina hii kwa sasa.';

  @override
  String get continueReading => 'Endelea Kusoma';

  @override
  String get savedHighlights => 'Vivutio Vilivyohifadhiwa';

  @override
  String get continueListening => 'Endelea Kusikiliza';

  @override
  String get listen => 'Sikiliza';

  @override
  String get resume => 'Endelea';

  @override
  String get failedToLoadLibrary => 'Imeshindwa kupakia maktaba';

  @override
  String get popularNow => 'Maarufu Sasa';

  @override
  String get savedForLater => 'Imehifadhiwa Baadaye';

  @override
  String get topListens => 'Usikilizaji wa Juu';

  @override
  String get unreadDiscoveries => 'Uvumbuzi ambao haujasomwa';

  @override
  String get pickUpAgain => 'Chukua Tena';

  @override
  String get bookHighlightsDescription =>
      'Vitabu vyako vilivyo na vivutio, vipendwa au maendeleo ya usomaji.';

  @override
  String get handPickedFromLibrary =>
      'Imechaguliwa kwa mkono kutoka kwa maktaba yako.';

  @override
  String get handPickedFromListeningQueue =>
      'Imechaguliwa kwa mkono kutoka kwenye foleni yako ya kusikiliza.';

  @override
  String get booksWithHighlights =>
      'Vitabu vilivyo na vivutio, vipendwa au maendeleo ya usomaji.';

  @override
  String get jumpBackNarration =>
      'Rudi kwenye simulizi bila kuwinda eneo lako.';

  @override
  String get unreadBooksReady =>
      'Vitabu ambavyo havijasomwa tayari kwa saa inayofuata ya utulivu.';

  @override
  String get quickAccessFavorites =>
      'Ufikiaji wa haraka wa vitabu unavyoendelea kurejea.';

  @override
  String get searchAudiobooks => 'Tafuta vitabu vya sauti';

  @override
  String get searchYourLibrary => 'Tafuta maktaba yako';

  @override
  String get pickUpStory => 'Endelea hadithi pale ulipoishia';

  @override
  String get savedPlacesChapters =>
      'Maeneo uliyohifadhi na sura ambazo hazijakamilika';

  @override
  String authorsCount(int count) {
    return 'waandishi $count';
  }

  @override
  String genresCount(int count) {
    return 'aina $count';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% imekamilika';
  }

  @override
  String get readyWhenYouAre => 'Tayari wakati wewe ni';

  @override
  String get details => 'Maelezo';

  @override
  String get listeningRoom => 'Chumba cha Kusikiliza';

  @override
  String get bookmarksAndProgress => 'Alamisho na Maendeleo';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Vichwa $count vimepangwa kwa uvinjari unaotanguliza usomaji.';
  }

  @override
  String get titles => 'Vichwa';

  @override
  String get allTitles => 'Majina Yote';

  @override
  String get authors => 'Waandishi';

  @override
  String get browseByAuthor => 'Vinjari Kwa Mwandishi';

  @override
  String get browseByGenre => 'Vinjari Kwa Aina';

  @override
  String get discover => 'Gundua';

  @override
  String get noBookmarkedItems => 'Bado hakuna vipengee vilivyoalamishwa';

  @override
  String get nothingMatchesSection =>
      'Bado hakuna kinacholingana na sehemu hii. Jaribu kichupo kingine au urudi baada ya kusawazisha maktaba kukamilika.';

  @override
  String get audiobooks => 'Vitabu vya sauti';

  @override
  String noLabelFound(String label) {
    return 'Hakuna $label';
  }

  @override
  String get folder => 'Folda';

  @override
  String get filters => 'Vichujio';

  @override
  String get readingStatus => 'Hali ya Kusoma';

  @override
  String get playedStatus => 'Hali Iliyochezwa';

  @override
  String get readStatus => 'Soma';

  @override
  String get watched => 'Zilizotazamwa';

  @override
  String get unread => 'Haijasomwa';

  @override
  String get unwatched => 'Zisizotazamwa';

  @override
  String get seriesStatus => 'Hali ya Mfululizo';

  @override
  String get allLibraries => 'Maktaba Zote';

  @override
  String get books => 'Vitabu';

  @override
  String get latestBooks => 'Vitabu vya Hivi Punde';

  @override
  String get latestAudiobooks => 'Vitabu vya Sauti vya Hivi Punde';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vitabu $count',
      one: 'kitabu 1',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Kitabu';

  @override
  String get bookFormatAudiobook => 'Kitabu cha Sauti';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound =>
      'Hakuna vitabu vilivyopatikana vya mwandishi huyu.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% kimesomwa';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time zimesalia';
  }

  @override
  String get bookHeroRead => 'Soma';

  @override
  String get bookHeroListen => 'Sikiliza';

  @override
  String get author => 'Mwandishi';

  @override
  String get unknownAuthor => 'Mwandishi asiyejulikana';

  @override
  String get uncategorized => 'Isiyowekwa katika kundi';

  @override
  String get overview => 'Muhtasari';

  @override
  String get noLibrivoxDescription =>
      'Bado hakuna maelezo yaliyotolewa na LibriVox kwa jina hili.';

  @override
  String get readers => 'Wasomaji';

  @override
  String get openLinks => 'Fungua Viungo';

  @override
  String get librivoxPage => 'Ukurasa wa LibriVox';

  @override
  String get internetArchive => 'Hifadhi ya Mtandao';

  @override
  String get rssFeed => 'Mlisho wa RSS';

  @override
  String get downloadZip => 'Pakua Zip';

  @override
  String sectionCountLabel(int count) {
    return 'sehemu $count';
  }

  @override
  String firstPublished(int year) {
    return 'Ilichapishwa kwa mara ya kwanza $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Bado hakuna muhtasari unaopatikana kutoka Open Library wa mada hii.';

  @override
  String get subjects => 'Masomo';

  @override
  String get all => 'Wote';

  @override
  String booksCount(int count) {
    return 'vitabu $count';
  }

  @override
  String get couldNotLoadSubject => 'Haikuweza kupakia mada hii sasa hivi.';

  @override
  String get audiobookDetails => 'Maelezo ya Kitabu cha Sauti';

  @override
  String authorsCountTitle(int count) {
    return 'Waandishi $count';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vitabu $count vya sauti',
      one: 'kitabu 1 cha sauti',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Orodha ya Orodha';

  @override
  String get itemListPlaceholder => 'Orodha ya bidhaa itaonekana hapa';

  @override
  String get failedToLoad => 'Imeshindwa kupakia';

  @override
  String get delete => 'Futa';

  @override
  String get save => 'Hifadhi';

  @override
  String get moreLikeThis => 'Zaidi Kama Hii';

  @override
  String get castAndCrew => 'Waigizaji na Wafanyakazi';

  @override
  String get collection => 'Mkusanyiko';

  @override
  String get episodes => 'Vipindi';

  @override
  String get nextUp => 'Inayofuata';

  @override
  String get seasons => 'Misimu';

  @override
  String get chapters => 'Sura';

  @override
  String get features => 'Vipengele';

  @override
  String get movies => 'Filamu';

  @override
  String get musicVideos => 'Video za Muziki';

  @override
  String get other => 'Nyingine';

  @override
  String get discography => 'Diskografia';

  @override
  String get similarArtists => 'Wasanii Wanaofanana';

  @override
  String get tableOfContents => 'Jedwali la Yaliyomo';

  @override
  String get tracklist => 'Orodha ya nyimbo';

  @override
  String discNumber(int number) {
    return 'Diski $number';
  }

  @override
  String get biography => 'Wasifu';

  @override
  String get authorDetails => 'Maelezo ya Mwandishi';

  @override
  String get noOverviewAvailable => 'Bado hakuna muhtasari wa mada hii.';

  @override
  String get noBiographyAvailable =>
      'Hakuna wasifu unaopatikana kwa mwandishi huyu.';

  @override
  String get unableToLoadAuthorDetails =>
      'Imeshindwa kupakia maelezo ya mwandishi kwa sasa.';

  @override
  String published(int year) {
    return 'Ilichapishwa $year';
  }

  @override
  String get publicationDateUnknown => 'Tarehe ya kuchapishwa haijulikani';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Misimu $count',
      one: 'Msimu 1',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Inaisha $time';
  }

  @override
  String get items => 'Vipengee';

  @override
  String get extras => 'Nyongeza';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Nyuma ya Pazia';

  @override
  String get deletedScenes => 'Matukio Yaliyofutwa';

  @override
  String get featurettes => 'Vipengele Vifupi';

  @override
  String get interviews => 'Mahojiano';

  @override
  String get scenes => 'Matukio';

  @override
  String get shorts => 'Filamu Fupi';

  @override
  String get trailers => 'Trela';

  @override
  String timeRemaining(String time) {
    return '$time zimesalia';
  }

  @override
  String endsIn(String time) {
    return 'Inaisha baada ya $time';
  }

  @override
  String get view => 'Tazama';

  @override
  String get resumeReading => 'Endelea Kusoma';

  @override
  String get read => 'Soma';

  @override
  String resumeFrom(String position) {
    return 'Endelea kutoka $position';
  }

  @override
  String get play => 'Cheza';

  @override
  String get startOver => 'Anza upya';

  @override
  String get restart => 'Anzisha upya';

  @override
  String get readOffline => 'Soma Nje ya Mtandao';

  @override
  String get playOffline => 'Cheza Nje ya Mtandao';

  @override
  String get audio => 'Sauti';

  @override
  String get subtitles => 'Manukuu';

  @override
  String get version => 'Toleo';

  @override
  String get cast => 'Tuma';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Trela';

  @override
  String get finished => 'Imekamilika';

  @override
  String get favorited => 'Imependekezwa';

  @override
  String get favorite => 'Kipendwa';

  @override
  String get playlist => 'Orodha ya kucheza';

  @override
  String get downloaded => 'Imepakuliwa';

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
  String get downloadAll => 'Pakua Zote';

  @override
  String get download => 'Pakua';

  @override
  String get deleteDownloaded => 'Futa Iliyopakuliwa';

  @override
  String get goToSeries => 'Nenda kwenye Series';

  @override
  String get editMetadata => 'Hariri Metadata';

  @override
  String get less => 'Chini';

  @override
  String get more => 'Zaidi';

  @override
  String get deleteItem => 'Futa Kipengee';

  @override
  String get deletePlaylist => 'Futa Orodha ya Kucheza';

  @override
  String get deletePlaylistMessage =>
      'Je, ungependa kufuta orodha hii ya kucheza kutoka kwa seva?';

  @override
  String get deleteItemMessage =>
      'Ungependa kufuta kipengee hiki kutoka kwa seva?';

  @override
  String get failedToDeletePlaylist => 'Imeshindwa kufuta orodha ya kucheza';

  @override
  String get failedToDeleteItem => 'Imeshindwa kufuta kipengee';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Badilisha Jina la Orodha ya Kucheza';

  @override
  String get playlistName => 'Jina la orodha ya kucheza';

  @override
  String get deleteDownloadedAlbum => 'Futa Albamu Iliyopakuliwa';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Futa nyimbo zilizopakuliwa za \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Nyimbo zilizopakuliwa zimefutwa';

  @override
  String get downloadedTracksDeleteFailed =>
      'Baadhi ya nyimbo zilizopakuliwa hazikuweza kufutwa';

  @override
  String get noTracksLoaded => 'Hakuna nyimbo zilizopakiwa';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Hakuna $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Inapakua $title (vipengee $count)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Una uhakika unataka kufuta \"$name\" kutoka kwa seva? Kitendo hiki hakiwezi kutenduliwa.';
  }

  @override
  String get itemDeleted => 'Kipengee kimefutwa';

  @override
  String get noPlayableTrailerFound =>
      'Hakuna trela inayoweza kucheza iliyopatikana.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Muundo wa kitabu hauhimiliwi: .$extension';
  }

  @override
  String get audioTrack => 'Wimbo wa Sauti';

  @override
  String get subtitleTrack => 'Wimbo wa Manukuu';

  @override
  String get none => 'Hakuna';

  @override
  String get downloadSubtitlesLabel => 'Pakua manukuu...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Tafuta kwa kutumia programu-jalizi ya OpenSubtitles';

  @override
  String get downloadSubtitles => 'Pakua Manukuu';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'Manukuu yaliyochaguliwa ni batili.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Manukuu yamepakuliwa na kuchaguliwa: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Manukuu yamepakuliwa. Inaweza kuchukua muda kuonekana Jellyfin inapoonyesha upya kipengee.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Hakuna manukuu ya mbali yaliyopatikana kwa $language.';
  }

  @override
  String get selectVersion => 'Chagua Toleo';

  @override
  String versionNumber(int number) {
    return 'Toleo $number';
  }

  @override
  String get downloadAllQuality => 'Pakua Zote - Ubora';

  @override
  String get downloadQuality => 'Ubora wa Kupakua';

  @override
  String get originalFileNoReencoding => 'Faili asili, hakuna usimbaji upya';

  @override
  String get originalFilesNoReencoding => 'Faili asili, hakuna usimbaji upya';

  @override
  String get noEpisodesLoaded => 'Hakuna vipindi vilivyopakiwa';

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
    return 'Inapakua $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Futa Faili Zilizopakuliwa';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Futa faili za ndani za $typeLabel?\n\nHii itaachilia nafasi ya hifadhi. Unaweza kupakua tena baadaye.';
  }

  @override
  String get downloadedFilesDeleted => 'Faili zilizopakuliwa zimefutwa';

  @override
  String get failedToDeleteFiles => 'Imeshindwa kufuta faili';

  @override
  String get deleteFiles => 'Futa Faili';

  @override
  String get director => 'MKURUGENZI';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'WAKURUGENZI';

  @override
  String get writer => 'MWANDISHI';

  @override
  String get writers => 'WAANDISHI';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count zaidi';
  }

  @override
  String totalEpisodes(int count) {
    return 'Vipindi $count';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Kipindi $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Sura $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'nyimbo $count',
      one: 'wimbo 1',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sura $count',
      one: 'sura 1',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Alizaliwa $date';
  }

  @override
  String died(String date) {
    return 'Alifariki $date';
  }

  @override
  String age(int age) {
    return 'Umri $age';
  }

  @override
  String get showLess => 'Onyesha Chini';

  @override
  String get readMore => 'Soma Zaidi';

  @override
  String get shuffle => 'Changanya';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Changanya muziki wote';

  @override
  String get carSignInPrompt => 'Ingia kwenye Moonfin kwenye simu yako';

  @override
  String get carServerUnreachable => 'Haiwezi kufikia seva yako';

  @override
  String downloadsCount(int count) {
    return 'vipakuliwa $count';
  }

  @override
  String get perfectMatch => 'Mechi kamili';

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
    return '$action ya manukuu ya mbali inahitaji ruhusa ya usimamizi wa manukuu ya Jellyfin kwa mtumiaji huyu.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Kipengee hiki hakikupatikana kwenye seva kwa $action ya manukuu ya mbali.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '$action ya manukuu ya mbali imeshindwa: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '$action ya manukuu ya mbali imeshindwa (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Imeshindwa kufanya $action ya manukuu ya mbali.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'vipindi vyote vilivyopakuliwa vya \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'vipindi vyote vilivyopakuliwa katika msimu huu';

  @override
  String get stillWatching => 'Bado Unatazama?';

  @override
  String get unableToLoadTrailerStream =>
      'Imeshindwa kupakia mtiririko wa trela.';

  @override
  String get trailerTimedOut => 'Muda wa trela umeisha wakati wa kupakia.';

  @override
  String get playbackFailedForTrailer => 'Uchezaji haujafaulu kwa trela hii.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Kutuma hakupatikani wakati wa kucheza nje ya mtandao.';

  @override
  String castActionFailed(String label, String error) {
    return 'Kitendo cha $label kimeshindwa: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Imeshindwa kuweka sauti ya utumaji: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Vidhibiti vya $label';
  }

  @override
  String get deviceVolume => 'Kiasi cha Kifaa';

  @override
  String get unavailable => 'Haipatikani';

  @override
  String get pause => 'Sitisha';

  @override
  String get syncPosition => 'Nafasi ya Usawazishaji';

  @override
  String stopCast(String label) {
    return 'Simamisha $label';
  }

  @override
  String get queueIsEmpty => 'Foleni ni tupu';

  @override
  String trackNumber(int number) {
    return 'Wimbo $number';
  }

  @override
  String get remotePlayback => 'Uchezaji wa Mbali';

  @override
  String get castingToGoogleCast => 'Inatuma kwenye Google Cast';

  @override
  String get castingViaAirPlay => 'Inatuma kupitia AirPlay';

  @override
  String get castingViaDlna => 'Inatuma kupitia DLNA';

  @override
  String secondsCount(int seconds) {
    return 'sekunde $seconds';
  }

  @override
  String get longPressToUnlock => 'Bonyeza kwa muda mrefu ili kufungua';

  @override
  String get off => 'Imezimwa';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Otomatiki';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get audioDelay => 'Kuchelewa kwa Sauti';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Ucheleweshaji wa Manukuu';

  @override
  String get reset => 'Weka upya';

  @override
  String get unknown => 'Haijulikani';

  @override
  String get playbackInformation => 'Maelezo ya Uchezaji';

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
  String get playback => 'Uchezaji';

  @override
  String get playMethod => 'Mbinu ya Kucheza';

  @override
  String get directPlay => 'Kucheza moja kwa moja';

  @override
  String get directStream => 'Mtiririko wa moja kwa moja';

  @override
  String get transcoding => 'Kubadilisha msimbo';

  @override
  String get transcodeReasons => 'Sababu za Transcode';

  @override
  String get player => 'Kichezaji';

  @override
  String get container => 'Chombo';

  @override
  String get bitrate => 'Kasi ya biti';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Azimio';

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
  String get track => 'Wimbo';

  @override
  String get channels => 'Vituo';

  @override
  String get format => 'Umbizo';

  @override
  String get external => 'Nje';

  @override
  String get embedded => 'Imepachikwa';

  @override
  String castSessionError(String protocol) {
    return 'Hitilafu ya kipindi cha $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Imeshindwa kupakia maelezo ya kitabu: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Utoaji wa EPUB ndani ya programu bado haupatikani kwenye mfumo huu.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Muundo huu (.$extension) hauwezi kuonyeshwa ndani ya programu bado.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Utoaji wa hati iliyopachikwa haupatikani kwenye jukwaa hili.';

  @override
  String get couldNotOpenExternalViewer =>
      'Haikuweza kufungua kitazamaji cha nje.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Imeshindwa kufungua kisomaji cha ndani ya programu: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Alamisho tayari limehifadhiwa kwenye $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Alamisho limeongezwa: $label';
  }

  @override
  String get noBookmarksYet =>
      'Bado hakuna alamisho.\nGusa aikoni ya alamisho unaposoma ili kuhifadhi nafasi yako.';

  @override
  String get noTableOfContentsAvailable =>
      'Hakuna jedwali la yaliyomo linalopatikana';

  @override
  String pageLabel(int number) {
    return 'Ukurasa $number';
  }

  @override
  String get position => 'Nafasi';

  @override
  String get bookReader => 'Msomaji wa Kitabu';

  @override
  String formatExtension(String extension) {
    return 'Muundo: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% kimesomwa';
  }

  @override
  String get updating => 'Inasasisha...';

  @override
  String get markUnread => 'Weka alama kuwa haijasomwa';

  @override
  String get markAsRead => 'Weka alama kama Imesomwa';

  @override
  String get reloadReader => 'Pakia upya Kisomaji';

  @override
  String get noPagesFound => 'Hakuna kurasa zilizopatikana.';

  @override
  String get failedToDecodePageImage => 'Imeshindwa kusimbua picha ya ukurasa.';

  @override
  String resetZoom(String zoom) {
    return 'Weka Upya Ukuzaji (${zoom}x)';
  }

  @override
  String get singlePage => 'Ukurasa Mmoja';

  @override
  String get twoPageSpread => 'Kuenea kwa Kurasa Mbili';

  @override
  String get addBookmark => 'Ongeza Alamisho';

  @override
  String get bookmarksEllipsis => 'Alamisho...';

  @override
  String get markedAsRead => 'Imetiwa alama kuwa imesomwa';

  @override
  String get markedAsUnread => 'Imetiwa alama kuwa haijasomwa';

  @override
  String failedToUpdateReadState(String error) {
    return 'Imeshindwa kusasisha hali ya kusoma: $error';
  }

  @override
  String get themeSystem => 'Mada: Mfumo';

  @override
  String get themeLight => 'Mandhari: Mwanga';

  @override
  String get themeDark => 'Mandhari: Giza';

  @override
  String get themeSepia => 'Mandhari: Sepia';

  @override
  String get invertColorsFixedLayout => 'Geuza Rangi (mpangilio thabiti)';

  @override
  String get invertColorsPdf => 'Geuza Rangi (PDF)';

  @override
  String get preparingInAppReader =>
      'Inatayarisha kisomaji cha ndani ya programu...';

  @override
  String get pdfDataNotAvailable => 'Data ya PDF haipatikani.';

  @override
  String get readerFallbackModeActive => 'Hali mbadala ya kisomaji imewashwa';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Jukwaa hili haliwezi kuendesha injini ya hati iliyopachikwa kwa faili za $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Tumia Kisomaji Upya baada ya kuhamia lengwa la jukwaa linalotumika (Android, iOS, macOS).';

  @override
  String get openExternally => 'Fungua Nje';

  @override
  String get noEpubChaptersFound => 'Hakuna sura za EPUB zilizopatikana.';

  @override
  String get readerNotReady => 'Msomaji hayuko tayari.';

  @override
  String get seriesRecordings => 'Rekodi za Mfululizo';

  @override
  String get now => 'Sasa';

  @override
  String get sports => 'Michezo';

  @override
  String get news => 'Habari';

  @override
  String get kids => 'Watoto';

  @override
  String get premiere => 'Onyesho la kwanza';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Mwongozo wa kalenda';

  @override
  String failedToLoadGuide(String error) {
    return 'Imeshindwa kupakia mwongozo: $error';
  }

  @override
  String get noChannelsFound => 'Hakuna vituo vilivyopatikana';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'MUBASHARA';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Inayofuata: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'dk $minutes zimesalia';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'saa $hours zimesalia';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'saa $hours dk $minutes zimesalia';
  }

  @override
  String get movie => 'Filamu';

  @override
  String get removedFromFavoriteChannels =>
      'Imeondolewa kwenye vituo unavyopenda';

  @override
  String get addedToFavoriteChannels => 'Imeongezwa kwa vituo unavyopenda';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Imeshindwa kusasisha kituo unachokipenda';

  @override
  String get unfavoriteChannel => 'Chaneli Usiyoipenda';

  @override
  String get favoriteChannel => 'Idhaa Unayoipenda';

  @override
  String get record => 'Rekodi';

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
  String get cancelRecordingAction => 'Ghairi Kurekodi';

  @override
  String get programSetToRecord => 'Kipindi kimewekwa kurekodiwa';

  @override
  String get recordingCancelled => 'Kurekodi kumeghairiwa';

  @override
  String get unableToCreateRecording => 'Imeshindwa kuunda rekodi';

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
  String get watch => 'Tazama';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Funga';

  @override
  String failedToPlayChannel(String name) {
    return 'Imeshindwa kucheza $name';
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
  String get failedToLoadRecordings => 'Imeshindwa kupakia rekodi';

  @override
  String get scheduledInNext24Hours => 'Imepangwa katika Saa 24 Zinazofuata';

  @override
  String get recentRecordings => 'Rekodi za Hivi Punde';

  @override
  String get tvSeries => 'Mfululizo wa TV';

  @override
  String get failedToLoadSchedule => 'Imeshindwa kupakia ratiba';

  @override
  String get noScheduledRecordings => 'Hakuna rekodi zilizoratibiwa';

  @override
  String get cancelRecording => 'Ungependa Kughairi Kurekodi?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Ghairi kurekodi kulikopangwa kwa \"$name\"?';
  }

  @override
  String get no => 'Hapana';

  @override
  String get yesCancel => 'Ndiyo, Ghairi';

  @override
  String get failedToCancelRecording => 'Imeshindwa kughairi kurekodi';

  @override
  String get failedToLoadSeriesRecordings =>
      'Imeshindwa kupakia rekodi za mfululizo';

  @override
  String get noSeriesRecordings => 'Hakuna rekodi za mfululizo';

  @override
  String get cancelSeriesRecording => 'Ghairi Kurekodi Mfululizo';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Ungependa Kughairi Kurekodi Mfululizo?';

  @override
  String stopRecordingName(String name) {
    return 'Simamisha kurekodi \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Imeshindwa kughairi kurekodi mfululizo';

  @override
  String get searchThisLibrary => 'Tafuta maktaba hii...';

  @override
  String get searchEllipsis => 'Tafuta...';

  @override
  String noResultsForQuery(String query) {
    return 'Hakuna matokeo ya \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Utafutaji umeshindwa: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Aina ya Akaunti ya Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Ndani';

  @override
  String get savedMedia => 'Media Iliyohifadhiwa';

  @override
  String get tvShows => 'Vipindi vya Televisheni';

  @override
  String get music => 'Muziki';

  @override
  String get musicAlbums => 'Albamu za Muziki';

  @override
  String get noMediaInFilter => 'Hakuna midia katika kichujio hiki';

  @override
  String get noDownloadedMediaYet => 'Bado hakuna media iliyopakuliwa';

  @override
  String get browseLibrary => 'Vinjari Maktaba';

  @override
  String get deleteDownload => 'Futa Upakuaji';

  @override
  String removeItemAndFiles(String name) {
    return 'Ondoa \"$name\" na faili zake?';
  }

  @override
  String tracksCount(int count) {
    return 'nyimbo $count';
  }

  @override
  String get album => 'Albamu';

  @override
  String get playAlbum => 'Cheza Albamu';

  @override
  String failedToLoadAlbum(String error) {
    return 'Imeshindwa kupakia albamu: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Hakuna nyimbo zilizopakuliwa zilizopatikana za $name.';
  }

  @override
  String get season => 'Msimu';

  @override
  String get errorLoadingEpisodes => 'Hitilafu katika kupakia vipindi';

  @override
  String get noDownloadedEpisodes => 'Hakuna vipindi vilivyopakuliwa';

  @override
  String get deleteEpisode => 'Futa Kipindi';

  @override
  String removeName(String name) {
    return 'Ondoa \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return 'dk $minutes';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'M$season K$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Kipindi $number';
  }

  @override
  String get seriesNotFound => 'Mfululizo haujapatikana';

  @override
  String get errorLoadingSeries => 'Hitilafu katika kupakia mfululizo';

  @override
  String get downloadedEpisodes => 'Vipindi Vilivyopakuliwa';

  @override
  String seasonNumber(int number) {
    return 'Msimu $number';
  }

  @override
  String seasonChip(int number) {
    return 'M$number';
  }

  @override
  String get specials => 'Maalum';

  @override
  String get deleteSeason => 'Futa Msimu';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Futa vipindi vyote vilivyopakuliwa katika $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vipindi $count',
      one: 'kipindi 1',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Usimamizi wa Hifadhi';

  @override
  String get storageBreakdown => 'Uchanganuzi wa Hifadhi';

  @override
  String get downloadedItems => 'Vipengee Vilivyopakuliwa';

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
  String get storageLimit => 'Kikomo cha Hifadhi';

  @override
  String get noLimit => 'Hakuna kikomo';

  @override
  String get deleteAllDownloads => 'Futa Vipakuliwa Vyote';

  @override
  String get deleteAllDownloadsWarning =>
      'Hii itaondoa faili zote za midia zilizopakuliwa na haiwezi kutenduliwa.';

  @override
  String get deleteAll => 'Futa Zote';

  @override
  String get deleteSelected => 'Futa Uliochaguliwa';

  @override
  String deleteSelectedCount(int count) {
    return 'Futa vipengee $count vilivyopakuliwa?';
  }

  @override
  String get musicAndAudiobooks => 'Vitabu vya Muziki na Sikizi';

  @override
  String get images => 'Picha';

  @override
  String get database => 'Hifadhidata';

  @override
  String ofStorageLimit(String limit) {
    return 'kati ya kikomo cha $limit';
  }

  @override
  String get settings => 'Mipangilio';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Uthibitishaji';

  @override
  String get autoLoginServerManagement =>
      'Kuingia kiotomatiki, usimamizi wa seva';

  @override
  String get pinCode => 'Msimbo wa PIN';

  @override
  String get setUpPinCodeProtection => 'Weka ulinzi wa msimbo wa PIN';

  @override
  String get parentalControls => 'Udhibiti wa Wazazi';

  @override
  String get contentRatingRestrictions => 'Vikwazo vya ukadiriaji wa maudhui';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, azimio, tabia';

  @override
  String get languageSizeAppearance => 'Lugha, ukubwa, muonekano';

  @override
  String get qualityStorage => 'Ubora, uhifadhi';

  @override
  String get mediaRequestIntegration => 'Ujumuishaji wa ombi la media';

  @override
  String get switchServer => 'Badilisha Seva';

  @override
  String get signOut => 'Ondoka';

  @override
  String get versionLicenses => 'Toleo, leseni';

  @override
  String get account => 'Akaunti';

  @override
  String get signInAndSecurity => 'Ingia na usalama';

  @override
  String get administration => 'Utawala';

  @override
  String get serverSettingsUsersLibraries =>
      'Mipangilio ya seva, watumiaji, maktaba';

  @override
  String get customization => 'Kubinafsisha';

  @override
  String get themeAndLayout => 'Mandhari na mpangilio';

  @override
  String get videoAndSubtitles => 'Video na manukuu';

  @override
  String get pluginAndRequests => 'Programu-jalizi na maombi';

  @override
  String get customizeAccountPlaybackInterface =>
      'Geuza kukufaa akaunti, uchezaji na tabia ya kiolesura';

  @override
  String optionsCount(int count) {
    return 'chaguo $count';
  }

  @override
  String get themeAndAppearance => 'Mandhari na Mwonekano';

  @override
  String get focusBorderColor => 'Lenga Rangi ya Mpaka';

  @override
  String get watchedIndicators => 'Viashiria Vilivyotazamwa';

  @override
  String get always => 'Daima';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Ficha Isiyotazamwa';

  @override
  String get episodesOnly => 'Vipindi Pekee';

  @override
  String get never => 'Kamwe';

  @override
  String get focusExpansionAnimation => 'Lenga Upanuzi Uhuishaji';

  @override
  String get desktopUiScale => 'Kiwango cha UI cha Kompyuta ya Mezani';

  @override
  String get scaleFocusedCards => 'Kadi na vigae vilivyolengwa au kuelea juu';

  @override
  String get seriesThumbnails => 'Vijipicha vya mfululizo';

  @override
  String get seriesThumbnailsDescription =>
      'Vipindi pekee: tumia mchoro wa mfululizo unaolingana na kila aina ya picha ya safu mlalo';

  @override
  String get homeRowInfoOverlay => 'Uwekeleaji wa Taarifa za Safu ya Nyumbani';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Onyesha kichwa na metadata unapovinjari safu mlalo za mwanzo';

  @override
  String get clockDisplay => 'Onyesho la Saa';

  @override
  String get inMenus => 'Katika Menyu';

  @override
  String get inVideo => 'Katika Video';

  @override
  String get seasonalEffects => 'Athari za Msimu';

  @override
  String get seasonalEffectsDescription =>
      'Athari za kuona na mapambo ya msimu';

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
  String get snow => 'Theluji';

  @override
  String get fireworks => 'Fataki';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Kuanguka Majani';

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
  String get themeMusic => 'Muziki wa Mandhari';

  @override
  String get playThemeMusicOnDetailPages =>
      'Cheza muziki wa mandhari kwenye kurasa za maelezo';

  @override
  String get themeMusicVolume => 'Sauti ya Muziki wa Mandhari';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows =>
      'Muziki wa Mandhari kwenye Safu Mlalo za Nyumbani';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Cheza unapovinjari skrini ya nyumbani';

  @override
  String get loopThemeMusic => 'Rudia Muziki wa Mandhari';

  @override
  String get loopThemeMusicSubtitle =>
      'Rudia wimbo badala ya kuucheza mara moja';

  @override
  String get detailsBackgroundBlur => 'Ukungu wa Mandharinyuma ya Maelezo';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Ukungu wa Mandharinyuma ya Kuvinjari';

  @override
  String get maxStreamingBitrate => 'Upeo wa Bitrate ya Utiririshaji';

  @override
  String get maxResolution => 'Azimio la Juu';

  @override
  String get playerZoomMode => 'Modi ya Kukuza Mchezaji';

  @override
  String get settingsScrollWheelAction => 'Gurudumu la kusogeza la kipanya';

  @override
  String get settingsScrollWheelActionDescription =>
      'Chagua kitendo cha kusogeza gurudumu la kipanya juu ya video wakati wa uchezaji.';

  @override
  String get scrollWheelActionOff => 'Imezimwa';

  @override
  String get scrollWheelActionSeek => 'Sogeza (mbele / nyuma)';

  @override
  String get scrollWheelActionVolume => 'Sauti';

  @override
  String get playerTooltipVolume => 'Sauti';

  @override
  String get fit => 'Inafaa';

  @override
  String get autoCrop => 'Mazao ya Kiotomatiki';

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
  String get stretch => 'Nyosha';

  @override
  String get refreshRateSwitching => 'Onyesha upya Kiwango cha Kubadilisha';

  @override
  String get disabled => 'Imezimwa';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Kiwango kwenye TV';

  @override
  String get scaleOnDevice => 'Kupima kwenye Kifaa';

  @override
  String get trickPlay => 'Mchezo wa hila';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Onyesha vijipicha vya kukagua unapotafuta';

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
  String get showDescriptionOnPause => 'Onyesha Maelezo kuhusu Kusitisha';

  @override
  String get dimVideoShowOverview =>
      'Fifisha video na uonyeshe maandishi ya muhtasari huku umesitishwa';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'Kitufe cha Kufunga OSD';

  @override
  String get osdLockButtonDescription =>
      'Onyesha kitufe cha kufunga kinachozuia ingizo la mguso hadi kibonyezwe kwa muda mrefu';

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
  String get audioBehavior => 'Tabia ya Sauti';

  @override
  String get downmixToStereo => 'Mchanganyiko wa chini hadi Stereo';

  @override
  String get defaultAudioLanguage => 'Lugha Chaguomsingi ya Sauti';

  @override
  String get fallbackAudioLanguage => 'Lugha Mbadala ya Sauti';

  @override
  String get preferDefaultAudioTrack =>
      'Pendelea Mkondo Chaguo-msingi wa Sauti';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Pendelea mkondo asili wa sauti kuliko udubu uliotafsiriwa.';

  @override
  String get preferAudioDescription => 'Pendelea Mikondo ya Maelezo ya Sauti';

  @override
  String get preferAudioDescriptionDescription =>
      'Pendelea mikondo ya maelezo ya sauti kuliko mikondo ya kawaida.';

  @override
  String get autoServerDefault => 'Otomatiki (Chaguomsingi ya Seva)';

  @override
  String get english => 'Kiingereza';

  @override
  String get spanish => 'Kihispania';

  @override
  String get french => 'Kifaransa';

  @override
  String get german => 'Kijerumani';

  @override
  String get italian => 'Kiitaliano';

  @override
  String get portuguese => 'Kireno';

  @override
  String get japanese => 'Kijapani';

  @override
  String get korean => 'Kikorea';

  @override
  String get chinese => 'Kichina';

  @override
  String get russian => 'Kirusi';

  @override
  String get arabic => 'Kiarabu';

  @override
  String get hindi => 'Kihindi';

  @override
  String get dutch => 'Kiholanzi';

  @override
  String get swedish => 'Kiswidi';

  @override
  String get norwegian => 'Kinorwe';

  @override
  String get danish => 'Kideni';

  @override
  String get finnish => 'Kifini';

  @override
  String get polish => 'Kipolandi';

  @override
  String get ac3Passthrough => 'Njia ya AC3';

  @override
  String get dtsPassthrough => 'Njia ya DTS';

  @override
  String get trueHdSupport => 'Msaada wa TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Sauti ya Bitstream DTS kwa AVR pekee; inahitaji usaidizi wa mpokeaji na wimbo wa chanzo wa DTS';

  @override
  String get settingsAudioFallbackCodec => 'Kodeki Mbadala ya Sauti';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Chagua muundo lengwa wa kubadilisha msimbo wa sauti ya chaneli nyingi wakati mkondo asili hauwezi kuchezwa moja kwa moja au kupitishwa.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Tambua Kiotomatiki\n(Inapendekezwa)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Chaguo-msingi)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Stereo Pekee)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Yenye Ufanisi)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Bila Hasara)';

  @override
  String get settingsMaxAudioChannels => 'Chaneli za Juu za Sauti';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Sanidi idadi ya juu ya chaneli za mfumo wako wa sauti. Mikondo ya chaneli nyingi inayozidi kikomo hiki itapunguzwa au kubadilishwa msimbo.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Tambua Kiotomatiki\n(Chaguo-msingi la Maunzi)';

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
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Ya Kina)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough ya Kodeki';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Washa miundo ambayo AVR au kifaa chako cha HDMI kinaunga mkono pekee.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 Passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA Passthrough';

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
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Uwezo wa Sauti Uliotambuliwa';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Hakuna muhtasari wa uwezo wa wakati wa utekelezaji unaopatikana bado.';

  @override
  String get settingsAudioRouteLabel => 'Njia';

  @override
  String get settingsAudioDecodeLabel => 'Usimbuaji';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Njia ya sauti ya HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Spika';

  @override
  String get settingsAudioRouteHeadphones => 'Vipokea sauti';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get nightMode => 'Hali ya Usiku';

  @override
  String get compressDynamicRange => 'Finyaza masafa yanayobadilika';

  @override
  String get advancedMpv => 'mpv ya hali ya juu';

  @override
  String get enableCustomMpvConf => 'Washa Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Tumia mpv.conf iliyoainishwa na mtumiaji kabla ya uchezaji kuanza';

  @override
  String get unsafeAdvancedMpvOptions => 'Chaguo za Kina za mpv zisizo salama';

  @override
  String get unsafeMpvOptionsDescription =>
      'Ruhusu seti pana ya chaguzi za mpv. Inaweza kuvunja tabia ya kucheza tena.';

  @override
  String get hardwareDecoding => 'Usimbuaji wa maunzi';

  @override
  String get hardwareDecodingSubtitle =>
      'Inaweza kuboresha utendakazi lakini inaweza kusababisha matatizo ya kucheza kwenye baadhi ya vifaa.';

  @override
  String get nextUpAndQueuing => 'Inayofuata na Kuweka Foleni';

  @override
  String get nextUpDisplay => 'Onyesho linalofuata';

  @override
  String get extended => 'Imepanuliwa';

  @override
  String get minimal => 'Ndogo';

  @override
  String get nextUpTimeout => 'Muda Unaofuata Umekwisha';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Kuweka Foleni kwa Vyombo vya Habari';

  @override
  String get autoQueueNextEpisodes => 'Panga vipindi vifuatavyo';

  @override
  String get stillWatchingPrompt => 'Bado Unatazama Uhakika';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Baada ya vipindi $episodes / saa $hours';
  }

  @override
  String get resumeAndSkip => 'Endelea na Uruke';

  @override
  String get resumeRewind => 'Endelea Kurudisha nyuma';

  @override
  String get unpauseRewind => 'Acha Kurejesha nyuma';

  @override
  String get fiveSeconds => '5 sekunde';

  @override
  String get tenSeconds => 'Sekunde 10';

  @override
  String get fifteenSeconds => 'Sekunde 15';

  @override
  String get thirtySeconds => 'Sekunde 30';

  @override
  String get skipBackLength => 'Ruka Urefu wa Nyuma';

  @override
  String get skipForwardLength => 'Ruka Urefu wa Mbele';

  @override
  String get customMpvConfPath => 'Njia maalum ya mpv.conf';

  @override
  String get notSetMpvConf =>
      'Haijawekwa. Moonfin itajaribu mpv.conf chaguo-msingi katika folda za programu/data.';

  @override
  String get selectMpvConf => 'Chagua mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Mipangilio ya mtindo (ukubwa, rangi, mkato) inatumika kwa manukuu yanayotegemea maandishi (SRT, VTT, TTML). Manukuu ya ASS/SSA hutumia mtindo wao wenyewe uliopachikwa isipokuwa \"ASS/SSA Direct Play\" imezimwa. Manukuu ya Bitmap (PGS, DVB, VobSub) hayawezi kubadilishwa mtindo.';

  @override
  String get defaultSubtitleLanguage => 'Lugha Chaguomsingi ya Manukuu';

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
  String get defaultToNoSubtitles => 'Chaguomsingi kwa Hakuna Manukuu';

  @override
  String get turnOffSubtitlesByDefault => 'Zima manukuu kwa chaguomsingi';

  @override
  String get subtitleSize => 'Ukubwa wa Manukuu';

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
  String get textFillColor => 'Rangi ya Kujaza Maandishi';

  @override
  String get backgroundColor => 'Rangi ya Mandharinyuma';

  @override
  String get textStrokeColor => 'Rangi ya Kiharusi cha Maandishi';

  @override
  String get subtitleCustomization => 'Kubinafsisha Manukuu';

  @override
  String get subtitleCustomizationDescription =>
      'Badilisha mwonekano wa manukuu kukufaa';

  @override
  String get subtitleMode => 'Modi ya Manukuu';

  @override
  String get subtitleModeFlagged => 'Yaliyoalamishwa';

  @override
  String get subtitleModeAlways => 'Kila Wakati';

  @override
  String get subtitleModeForeign => 'Lugha ya Kigeni';

  @override
  String get subtitleModeForced => 'Yaliyolazimishwa';

  @override
  String get subtitleModeFlaggedDescription =>
      'Hucheza mikondo iliyoalamishwa katika metadata ya faili la maudhui kama \"default\" au \"forced\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Hupakia na kuonyesha manukuu kiotomatiki kila video inapoanza.';

  @override
  String get subtitleModeForeignDescription =>
      'Huwasha manukuu kiotomatiki ikiwa mkondo chaguo-msingi wa sauti uko katika lugha ya kigeni.';

  @override
  String get subtitleModeForcedDescription =>
      'Hupakia manukuu yaliyowekwa alama ya \"forced\" pekee.';

  @override
  String get subtitleModeNoneDescription =>
      'Huzima kabisa upakiaji wa manukuu wa kiotomatiki.';

  @override
  String get fallbackSubtitleLanguage => 'Lugha Mbadala ya Manukuu';

  @override
  String get subtitleStream => 'Mkondo wa Manukuu';

  @override
  String get subtitlePreviewText =>
      'Mbweha wa kahawia haraka anaruka juu ya mbwa mvivu';

  @override
  String get verticalOffset => 'Wima Offset';

  @override
  String get pgsDirectPlay => 'Uchezaji wa moja kwa moja wa PGS';

  @override
  String get directPlayPgsSubtitles => 'Cheza manukuu ya PGS moja kwa moja';

  @override
  String get assSsaDirectPlay => 'Uchezaji wa moja kwa moja wa ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Cheza manukuu ya ASS/SSA moja kwa moja';

  @override
  String get white => 'Nyeupe';

  @override
  String get black => 'Nyeusi';

  @override
  String get yellow => 'Njano';

  @override
  String get green => 'Kijani';

  @override
  String get cyan => 'Samawati';

  @override
  String get red => 'Nyekundu';

  @override
  String get transparent => 'Uwazi';

  @override
  String get semiTransparentBlack => 'Nusu-wazi Nyeusi';

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
  String get global => 'Ulimwenguni';

  @override
  String get desktop => 'Eneo-kazi';

  @override
  String get mobile => 'Simu ya Mkononi';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Mipangilio ya wasifu wa $profile imepakiwa.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Imeshindwa kupakia mipangilio ya wasifu wa $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Mipangilio ya ndani imesawazishwa na wasifu wa $profile.';
  }

  @override
  String get syncing => 'Inasawazisha...';

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
  String get profileSyncHidden => 'Usawazishaji wa Wasifu Umefichwa';

  @override
  String get enablePluginSyncDescription =>
      'Washa Usawazishaji wa Programu-jalizi ya Seva katika mipangilio ya Programu-jalizi ili kuonyesha vidhibiti vya wasifu hapa.';

  @override
  String get quality => 'Ubora';

  @override
  String get defaultDownloadQuality => 'Ubora Chaguomsingi wa Upakuaji';

  @override
  String get network => 'Mtandao';

  @override
  String get wifiOnlyDownloads => 'Vipakuliwa vya WiFi Pekee';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Onyesha vipakuliwa kwenye seva';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Ruhusu msimamizi wa seva aone vipakuliwa vyako vilivyobadilishwa msimbo kwenye dashibodi';

  @override
  String get onlyDownloadOnWifi => 'Pakua tu wakati umeunganishwa kwenye WiFi';

  @override
  String get storage => 'Hifadhi';

  @override
  String get storageUsed => 'Hifadhi Imetumika';

  @override
  String get manage => 'Dhibiti';

  @override
  String get calculating => 'Inakokotoa...';

  @override
  String get downloadLocation => 'Pakua Mahali';

  @override
  String get defaultLabel => 'Chaguomsingi';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Hifadhi kwenye folda ya Vipakuliwa';

  @override
  String get downloadsVisibleToOtherApps =>
      'Vipakuliwa/Moonfin — inaonekana kwa programu zingine';

  @override
  String get dangerZone => 'Eneo la Hatari';

  @override
  String get clearAllDownloads => 'Futa Vipakuliwa Vyote';

  @override
  String get original => 'Asili';

  @override
  String get changeDownloadLocation => 'Badilisha Mahali pa Kupakua';

  @override
  String get changeDownloadLocationDescription =>
      'Vipakuliwa vipya vitahifadhiwa kwenye folda iliyochaguliwa. Vipakuliwa vilivyopo vitasalia katika eneo vilipo sasa na vinaweza kudhibitiwa kutoka kwa mipangilio ya Hifadhi.';

  @override
  String get confirm => 'Thibitisha';

  @override
  String get cannotWriteToFolder =>
      'Haiwezi kuandika kwa folda iliyochaguliwa. Tafadhali chagua eneo tofauti au toa vibali vya kuhifadhi.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Ungependa kuhifadhi kwenye folda ya Vipakuliwa?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Midia iliyopakuliwa itahifadhiwa kwenye Vipakuliwa/Moonfin kwenye kifaa chako. Faili hizi zitaonekana kwa programu zingine kama vile ghala yako au kicheza muziki.\n\nVipakuliwa vilivyopo vitasalia katika eneo vilipo sasa.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Wezesha';

  @override
  String get clearAllDownloadsWarning =>
      'Hii itafuta midia yote iliyopakuliwa na haiwezi kutenduliwa.';

  @override
  String get clearAll => 'Futa Zote';

  @override
  String get navigationStyle => 'Mtindo wa Urambazaji';

  @override
  String get topBar => 'Upau wa Juu';

  @override
  String get leftSidebar => 'Utepe wa Kushoto';

  @override
  String get showShuffleButton => 'Onyesha Kitufe cha Changanya';

  @override
  String get showGenresButton => 'Onyesha Kitufe cha Aina';

  @override
  String get showFavoritesButton => 'Onyesha Kitufe cha Vipendwa';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Onyesha Maktaba kwenye Upauzana';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'Panua Lebo za Upau wa Urambazaji Kila Wakati';

  @override
  String get showSeerrButton => 'Onyesha Kitufe cha Seerr';

  @override
  String get navbarOpacity => 'Uwazi wa Upau wa Urambazaji';

  @override
  String get navbarColor => 'Rangi ya Upau wa Urambazaji';

  @override
  String get gray => 'Kijivu';

  @override
  String get darkBlue => 'Bluu iliyokolea';

  @override
  String get purple => 'Zambarau';

  @override
  String get teal => 'Kijani-buluu';

  @override
  String get navy => 'Buluu Nyeusi';

  @override
  String get charcoal => 'Mkaa';

  @override
  String get brown => 'Kahawia';

  @override
  String get darkRed => 'Nyekundu Iliyokolea';

  @override
  String get darkGreen => 'Kijani Kijani';

  @override
  String get slate => 'Kijivu-buluu';

  @override
  String get indigo => 'Kihindi';

  @override
  String get libraryDisplay => 'Onyesho la Maktaba';

  @override
  String get posterLabel => 'Bango';

  @override
  String get thumbnailLabel => 'Kijipicha';

  @override
  String get bannerLabel => 'Bango';

  @override
  String get overridePerLibrarySettings =>
      'Batilisha Mipangilio ya Kila Maktaba';

  @override
  String get applyImageTypeToAllLibraries =>
      'Tumia aina ya picha kwenye maktaba zote';

  @override
  String get multiServerLibraries => 'Maktaba za Seva nyingi';

  @override
  String get showLibrariesFromAllServers =>
      'Onyesha maktaba kutoka kwa seva zote zilizounganishwa';

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
  String get groupItemsIntoCollections => 'Panga Vipengee katika Makusanyo';

  @override
  String get hideCollectionAssociatedItems =>
      'Ficha vipengee vya maktaba vinavyohusiana na Mkusanyo unapovinjari maktaba';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'Ilani ya Kupanga Maktaba';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Ili kutumia mpangilio huu, tafadhali hakikisha mipangilio ya maktaba ya \"Panga filamu katika makusanyo\" na/au \"Panga vipindi katika makusanyo\" imewashwa chini ya mipangilio ya Onyesho ya maktaba yako kwenye seva yako ya Jellyfin au Emby.';

  @override
  String get libraryVisibility => 'Mwonekano wa Maktaba';

  @override
  String get libraryVisibilityDescription =>
      'Geuza mwonekano wa ukurasa wa nyumbani kwa kila maktaba. Anzisha tena Moonfin ili mabadiliko yaanze kutumika.';

  @override
  String get showInNavigation => 'Onyesha katika urambazaji';

  @override
  String get showInLatestMedia => 'Onyesha kwenye media za hivi punde';

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
  String get sourceLibraries => 'Maktaba za Chanzo';

  @override
  String get sourceCollections => 'Makusanyo ya Chanzo';

  @override
  String get excludedGenres => 'Aina Zisizojumuishwa';

  @override
  String get selectAll => 'Chagua Zote';

  @override
  String itemsSelected(int count) {
    return '$count vimechaguliwa';
  }

  @override
  String get mediaBar => 'Upau wa Vyombo vya habari';

  @override
  String get mediaSources => 'Vyanzo vya Vyombo vya Habari';

  @override
  String get behavior => 'Tabia';

  @override
  String get seconds => 'sekunde';

  @override
  String get mediaBarMode => 'Mtindo wa Baa ya Vyombo vya habari';

  @override
  String get mediaBarModeDescription =>
      'Chagua kati ya mitindo mbalimbali ya upau wa midia, au zima upau wa midia';

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
  String get mediaBarModeOff => 'Imezimwa';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Washa Upau wa Midia';

  @override
  String get showFeaturedContentSlideshow =>
      'Onyesha onyesho la slaidi la maudhui yaliyoangaziwa nyumbani';

  @override
  String get contentType => 'Aina ya Maudhui';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Filamu na Vipindi vya Televisheni';

  @override
  String get moviesOnly => 'Filamu Pekee';

  @override
  String get tvShowsOnly => 'Vipindi vya Televisheni Pekee';

  @override
  String get itemCount => 'Hesabu ya Bidhaa';

  @override
  String get noneSelected => 'Hakuna iliyochaguliwa';

  @override
  String get noneExcluded => 'Hakuna iliyotengwa';

  @override
  String get autoAdvance => 'Maendeleo ya Kiotomatiki';

  @override
  String get autoAdvanceSlides =>
      'Sogeza kiotomatiki hadi kwenye slaidi inayofuata';

  @override
  String get autoAdvanceInterval => 'Muda wa Mapema Otomatiki';

  @override
  String get trailerPreview => 'Onyesho la Kuchungulia Trela';

  @override
  String get autoPlayTrailers =>
      'Cheza trela kiotomatiki kwenye upau wa midia baada ya sekunde 3';

  @override
  String get trailerAudio => 'Sauti ya Trela';

  @override
  String get enableTrailerAudio =>
      'Washa sauti ya trela kwenye upau wa maudhui';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Muhtasari wa Kipindi';

  @override
  String get mediaPreview => 'Hakiki ya Vyombo vya Habari';

  @override
  String get episodePreviewDescription =>
      'Cheza onyesho la kuchungulia la ndani la sekunde 30 kwenye kadi zilizolengwa, zinazoelea au zilizobonyezwa kwa muda mrefu';

  @override
  String get mediaPreviewDescription =>
      'Cheza onyesho la kuchungulia la ndani la sekunde 30 kwenye kadi zilizolengwa, zinazoelea au zilizobonyezwa kwa muda mrefu';

  @override
  String get previewAudio => 'Hakiki Sauti';

  @override
  String get enablePreviewAudio =>
      'Washa sauti kwa maonyesho ya trela na vipindi';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Vyombo vya Habari vya Hivi Punde';

  @override
  String get recentlyReleased => 'Iliyotolewa Hivi Karibuni';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Vyombo vya Habari Vyangu';

  @override
  String get myMediaSmall => 'Vyombo vya Habari Vyangu (Ndogo)';

  @override
  String get continueWatching => 'Endelea Kutazama';

  @override
  String get resumeAudio => 'Rejesha Sauti';

  @override
  String get resumeBooks => 'Rejesha Vitabu';

  @override
  String get activeRecordings => 'Rekodi Zinazotumika';

  @override
  String get playlists => 'Orodha za kucheza';

  @override
  String get liveTV => 'TV ya moja kwa moja';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Weka upya kwa chaguomsingi';

  @override
  String get homeRowPosterSize => 'Ukubwa wa Bango la Safu ya Nyumbani';

  @override
  String get configureImageTypeForEachRow =>
      'Sanidi aina ya picha kwa kila safu mlalo ya nyumbani iliyowezeshwa';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Unganisha Endelea Kutazama na Inayofuata';

  @override
  String get combineBothRows =>
      'Changanya safu zote mbili kwenye sehemu moja ya nyumbani';

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
  String get fullScreenRows => 'Safu za Nyumbani Zilizopanuliwa';

  @override
  String get fullScreenRowsDescription =>
      'Punguza safu za nyumbani hadi safu 1 kwa kila skrini';

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
  String get perRowSettings => 'Mipangilio ya Kila Safu';

  @override
  String get autoLogin => 'Ingia kiotomatiki';

  @override
  String get lastUser => 'Mtumiaji wa Mwisho';

  @override
  String get currentUser => 'Mtumiaji wa Sasa';

  @override
  String get alwaysAuthenticate => 'Thibitisha kila wakati';

  @override
  String get requirePasswordWithToken =>
      'Inahitaji nenosiri hata kwa tokeni iliyohifadhiwa';

  @override
  String get confirmExit => 'Thibitisha Toka';

  @override
  String get showConfirmationBeforeExiting =>
      'Onyesha uthibitisho kabla ya kuondoka';

  @override
  String get blockContentWithRatings => 'Zuia maudhui kwa ukadiriaji ufuatao:';

  @override
  String get noContentRatingsFound =>
      'Bado hakuna ukadiriaji wa maudhui uliopatikana kwenye seva hii.';

  @override
  String get couldNotLoadServerRatings =>
      'Haikuweza kupakia ukadiriaji wa seva. Inaonyesha ukadiriaji uliohifadhiwa pekee.';

  @override
  String get couldNotRefreshRatings =>
      'Haikuweza kuonyesha upya ukadiriaji kutoka kwa seva. Inaonyesha ukadiriaji uliohifadhiwa.';

  @override
  String get enablePinCode => 'Washa Msimbo wa PIN';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess => 'Inahitaji PIN ili kufikia akaunti yako';

  @override
  String get changePin => 'Badilisha PIN';

  @override
  String get setNewPinCode => 'Weka msimbo mpya wa PIN';

  @override
  String get removePin => 'Ondoa PIN';

  @override
  String get removePinProtection => 'Ondoa ulinzi wa msimbo wa PIN';

  @override
  String get screensaver => 'Bongo';

  @override
  String get inAppScreensaver => 'Kiokoa skrini cha Ndani ya Programu';

  @override
  String get enableBuiltInScreensaver =>
      'Washa kihifadhi skrini kilichojengewa ndani';

  @override
  String get mode => 'Modi';

  @override
  String get libraryArt => 'Sanaa ya Maktaba';

  @override
  String get logo => 'Nembo';

  @override
  String get clock => 'Saa';

  @override
  String get timeout => 'Muda umekwisha';

  @override
  String minutesShort(int minutes) {
    return 'dk $minutes';
  }

  @override
  String get dimmingLevel => 'Kiwango cha Kufifia';

  @override
  String get maxAgeRating => 'Ukadiriaji wa Umri wa Juu';

  @override
  String get any => 'Yoyote';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Inahitaji Ukadiriaji wa Umri';

  @override
  String get onlyShowRatedContent => 'Onyesha maudhui yaliyokadiriwa pekee';

  @override
  String get displayClockDuringScreensaver => 'Onyesha saa wakati wa skrini';

  @override
  String get clockModeStatic => 'Tuli';

  @override
  String get clockModeBouncing => 'Inayoruka';

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
  String get rottenTomatoesCritics => 'Nyanya zilizooza (Wakosoaji)';

  @override
  String get rottenTomatoesAudience => 'Nyanya zilizooza (Hadhira)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (Mtumiaji)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Ukadiriaji wa Jumuiya';

  @override
  String get ratings => 'Ukadiriaji';

  @override
  String get additionalRatings => 'Ukadiriaji wa Ziada';

  @override
  String get showMdbListAndTmdbRatings =>
      'Onyesha ukadiriaji wa MDBList na TMDB';

  @override
  String get ratingLabels => 'Lebo za Ukadiriaji';

  @override
  String get showLabelsNextToIcons =>
      'Onyesha lebo karibu na aikoni za ukadiriaji';

  @override
  String get ratingBadges => 'Beji za Ukadiriaji';

  @override
  String get showDecorativeBadges =>
      'Onyesha beji za mapambo nyuma ya ukadiriaji';

  @override
  String get episodeRatings => 'Ukadiriaji wa Vipindi';

  @override
  String get showRatingsOnEpisodes =>
      'Onyesha ukadiriaji kwenye vipindi mahususi';

  @override
  String get ratingSources => 'Vyanzo vya Ukadiriaji';

  @override
  String get ratingSourcesDescription =>
      'Washa na upange upya vyanzo vya ukadiriaji vinavyoonyeshwa kwenye programu nzima';

  @override
  String get pluginDetected => 'Programu-jalizi Imegunduliwa';

  @override
  String get pluginNotDetected => 'Programu-jalizi Haijagunduliwa';

  @override
  String get pluginNotDetectedDescription =>
      'Programu-jalizi ya seva haijatambuliwa kwa sasa. Mipangilio ya ndani bado inatumia thamani zilizohifadhiwa au chaguomsingi zilizojumuishwa.';

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
  String get recentRequests => 'Maombi ya Hivi Karibuni';

  @override
  String get recentlyAdded => 'Iliyoongezwa Hivi Karibuni';

  @override
  String get trending => 'Zinazovuma';

  @override
  String get popularMovies => 'Filamu Maarufu';

  @override
  String get movieGenres => 'Aina za Filamu';

  @override
  String get upcomingMovies => 'Filamu Zinazokuja';

  @override
  String get studios => 'Studio';

  @override
  String get popularSeries => 'Mfululizo Maarufu';

  @override
  String get seriesGenres => 'Aina za Msururu';

  @override
  String get upcomingSeries => 'Msururu Ujao';

  @override
  String get networks => 'Mitandao';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Safu za Ugunduzi za Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'Weka upya safu mlalo ziwe chaguomsingi';

  @override
  String get enableSeerr => 'Washa Seerr';

  @override
  String get showSeerrInNavigation =>
      'Onyesha Seerr katika urambazaji (inahitaji programu-jalizi ya seva)';

  @override
  String get seerrUnavailable =>
      'Haipatikani kwa sababu utumizi wa programu-jalizi ya seva ya Seerr umezimwa.';

  @override
  String get nsfwFilter => 'Kichujio cha NSFW';

  @override
  String get hideAdultContent => 'Ficha maudhui ya watu wazima katika matokeo';

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
  String get seerrNotificationsSection => 'Arifa';

  @override
  String get seerrNotifyNewRequestsTitle => 'Arifa za maombi mapya';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Nijulishe mtu anapowasilisha ombi';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Masasisho ya maombi';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Yaliyoidhinishwa, yaliyokataliwa, na yaliyoongezwa kwenye maktaba yako';

  @override
  String get seerrNotifyIssuesTitle => 'Masasisho ya matatizo';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Matatizo mapya, majibu, na masuluhisho';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Umeingia kama: $username';
  }

  @override
  String get discoverRows => 'Ukurasa wa Ugunduzi wa Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Washa safu za kuonyesha kwenye ukurasa mkuu wa Seerr. Buruta ili kupanga upya. Mpangilio maalum husawazishwa na Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Washa safu za kuonyesha kwenye ukurasa mkuu wa Seerr. Buruta ili kupanga upya. Mpangilio maalum husawazishwa na Moonbase.';

  @override
  String get enabled => 'Imewashwa';

  @override
  String get hidden => 'Imefichwa';

  @override
  String get aboutTitle => 'Kuhusu';

  @override
  String versionValue(String version) {
    return 'Toleo $version';
  }

  @override
  String get openSourceLicenses => 'Leseni za Chanzo Huria';

  @override
  String get sourceCode => 'Msimbo wa Chanzo';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Angalia Sasisho Sasa';

  @override
  String get checksLatestDesktopRelease =>
      'Huangalia toleo jipya zaidi la eneo-kazi la jukwaa hili';

  @override
  String get youAreUpToDate => 'Umesasishwa.';

  @override
  String get couldNotCheckForUpdates =>
      'Haikuweza kuangalia masasisho kwa sasa.';

  @override
  String get noCompatibleUpdate =>
      'Hakuna kifurushi kinachooana cha sasisho kilichopatikana kwa mfumo huu.';

  @override
  String get updateChecksNotSupported =>
      'Ukaguzi wa sasisho hautumiki kwenye mfumo huu.';

  @override
  String get updateNotificationsDisabled => 'Arifa za sasisho zimezimwa.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Tafadhali subiri kabla ya kuangalia tena.';

  @override
  String get latestUpdateAlreadyShown =>
      'Sasisho la hivi punde tayari limeonyeshwa.';

  @override
  String get updateAvailable => 'Sasisho linapatikana.';

  @override
  String updateAvailableVersion(String version) {
    return 'Sasisho linapatikana: v$version';
  }

  @override
  String get updateNotifications => 'Sasisha Arifa';

  @override
  String get showWhenUpdatesAvailable =>
      'Onyesha wakati masasisho yanapatikana';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Inapatikana';
  }

  @override
  String get readReleaseNotes => 'Soma Vidokezo vya Kutolewa';

  @override
  String get downloadingUpdate => 'Inapakua sasisho...';

  @override
  String get updateDownloadFailed =>
      'Imeshindwa kupakua. Tafadhali jaribu tena.';

  @override
  String get openReleasesPage => 'Fungua Ukurasa wa Matoleo';

  @override
  String get navigation => 'Urambazaji';

  @override
  String get watchedIndicatorsBackdrops => 'Viashiria vilivyotazamwa, mandhari';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Rangi ya kuzingatia, viashiria vilivyotazamwa, mandhari';

  @override
  String get navbarStyleToolbarAppearance =>
      'Mtindo wa Upau wa Uelekezaji, vifungo vya upau wa vidhibiti, mwonekano';

  @override
  String get featuredContentAppearance => 'Maudhui yaliyoangaziwa, mwonekano';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Kikomo cha akiba ya picha';

  @override
  String get clearImageCache => 'Futa akiba ya picha';

  @override
  String get imageCacheCleared => 'Akiba ya picha imefutwa';

  @override
  String get clear => 'Futa';

  @override
  String get browse => 'Vinjari';

  @override
  String get noResults => 'Hakuna matokeo';

  @override
  String get seerrAvailableStatus => 'Inapatikana';

  @override
  String get seerrRequestedStatus => 'Umeomba';

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
    return 'Inapakua · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Inaingiza';

  @override
  String itemsCount(int count) {
    return 'Vipengee $count';
  }

  @override
  String get seerrSettings => 'Mipangilio ya Seerr';

  @override
  String get requestMore => 'Omba Zaidi';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Ombi';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Ghairi Ombi';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Cheza katika Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Imeombwa na $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Idhinisha';

  @override
  String get declineAction => 'Kataa';

  @override
  String get similar => 'Sawa';

  @override
  String get recommendations => 'Mapendekezo';

  @override
  String cancelRequestForTitle(String title) {
    return 'Ghairi ombi la \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Ghairi maombi $count ya \"$title\"?';
  }

  @override
  String get keep => 'Weka';

  @override
  String get itemNotFoundInLibrary =>
      'Kipengee hakipatikani kwenye maktaba yako ya Moonfin';

  @override
  String get errorSearchingLibrary => 'Hitilafu katika kutafuta maktaba';

  @override
  String budgetAmount(String amount) {
    return 'Bajeti: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Mapato: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$label $count';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Omba $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Wasilisha Ombi';

  @override
  String get allSeasons => 'Misimu Yote';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Chaguzi za Juu';

  @override
  String get noServiceServersConfigured =>
      'Hakuna seva za huduma zilizosanidiwa';

  @override
  String get server => 'Seva';

  @override
  String get qualityProfile => 'Wasifu wa Ubora';

  @override
  String get rootFolder => 'Folda ya Mizizi';

  @override
  String get showMore => 'Onyesha Zaidi';

  @override
  String get appearances => 'Mionekano';

  @override
  String get crewSection => 'Wafanyakazi';

  @override
  String ageValue(int age) {
    return 'umri $age';
  }

  @override
  String get noRequests => 'Hakuna maombi';

  @override
  String get pendingStatus => 'Inasubiri';

  @override
  String get declinedStatus => 'Imekataliwa';

  @override
  String get partiallyAvailable => 'Inapatikana kwa Kiasi';

  @override
  String get downloadingStatus => 'Inapakua';

  @override
  String get approvedStatus => 'Imeidhinishwa';

  @override
  String get notRequestedStatus => 'Haijaombwa';

  @override
  String get blocklistedStatus => 'Imezuiwa';

  @override
  String get deletedStatus => 'Imefutwa';

  @override
  String get failedStatus => 'Imeshindwa';

  @override
  String get processingStatus => 'Inachakatwa';

  @override
  String modifiedByName(String name) {
    return 'Imebadilishwa na $name';
  }

  @override
  String get completedStatus => 'Imekamilika';

  @override
  String get requestErrorDuplicate => 'Kichwa hiki tayari kimeombwa';

  @override
  String get requestErrorQuota => 'Umefikia kikomo cha maombi';

  @override
  String get requestErrorBlocklisted => 'Kichwa hiki kimezuiwa';

  @override
  String get requestErrorNoSeasons => 'Hakuna misimu iliyosalia ya kuomba';

  @override
  String get requestErrorPermission => 'Huna ruhusa ya kufanya ombi hili';

  @override
  String get seerrRequestsTitle => 'Maombi';

  @override
  String get seerrIssuesTitle => 'Matatizo';

  @override
  String get sortNewest => 'Mapya Zaidi';

  @override
  String get sortLastModified => 'Yaliyobadilishwa Mwisho';

  @override
  String get noIssues => 'Hakuna matatizo';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Maombi $remaining kati ya $limit ya filamu yamesalia';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Maombi $remaining kati ya $limit ya misimu yamesalia';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Sehemu ya $name';
  }

  @override
  String get viewCollection => 'Angalia Mkusanyo';

  @override
  String get requestCollection => 'Omba Mkusanyo';

  @override
  String collectionMoviesSummary(int total, int available) {
    return 'Filamu $total · $available zinapatikana';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Omba filamu $count';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Inaomba $current kati ya $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Filamu $count zimeombwa';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Filamu $ok kati ya $total zimeombwa';
  }

  @override
  String get collectionAllRequested =>
      'Filamu zote tayari zinapatikana au zimeombwa';

  @override
  String get reportIssue => 'Ripoti Tatizo';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Sauti';

  @override
  String get whatsWrong => 'Kuna tatizo gani?';

  @override
  String get allEpisodes => 'Vipindi Vyote';

  @override
  String get episode => 'Kipindi';

  @override
  String get openStatus => 'Imefunguliwa';

  @override
  String get resolvedStatus => 'Limetatuliwa';

  @override
  String get resolveAction => 'Tatua';

  @override
  String get reopenAction => 'Fungua Tena';

  @override
  String reportedByName(String name) {
    return 'Imeripotiwa na $name';
  }

  @override
  String commentsCount(int count) {
    return 'maoni $count';
  }

  @override
  String get addComment => 'Ongeza maoni';

  @override
  String get deleteIssueConfirm => 'Futa tatizo hili?';

  @override
  String get submitReport => 'Wasilisha Ripoti';

  @override
  String get tmdbScore => 'Alama ya TMDB';

  @override
  String get releaseDateLabel => 'Tarehe ya Kutolewa';

  @override
  String get firstAirDateLabel => 'Tarehe ya Kwanza ya Hewa';

  @override
  String get revenueLabel => 'Mapato';

  @override
  String get runtimeLabel => 'Muda wa kukimbia';

  @override
  String get budgetLabel => 'Bajeti';

  @override
  String get originalLanguageLabel => 'Lugha Asilia';

  @override
  String get seasonsLabel => 'Misimu';

  @override
  String get episodesLabel => 'Vipindi';

  @override
  String get access => 'Ufikiaji';

  @override
  String get add => 'Ongeza';

  @override
  String get address => 'Anwani';

  @override
  String get analytics => 'Uchanganuzi';

  @override
  String get catalog => 'Katalogi';

  @override
  String get content => 'Maudhui';

  @override
  String get copy => 'Nakili';

  @override
  String get create => 'Unda';

  @override
  String get disable => 'Zima';

  @override
  String get done => 'Imekamilika';

  @override
  String get edit => 'Hariri';

  @override
  String get encoding => 'Usimbaji';

  @override
  String get error => 'Hitilafu';

  @override
  String get forward => 'Mbele';

  @override
  String get general => 'Jumla';

  @override
  String get go => 'Nenda';

  @override
  String get install => 'Sakinisha';

  @override
  String get installed => 'Imesakinishwa';

  @override
  String get interval => 'Muda';

  @override
  String get name => 'Jina';

  @override
  String get networking => 'Mtandao';

  @override
  String get next => 'Inayofuata';

  @override
  String get path => 'Njia';

  @override
  String get paused => 'Imesitishwa';

  @override
  String get permissions => 'Ruhusa';

  @override
  String get processing => 'Inachakata';

  @override
  String get profile => 'Wasifu';

  @override
  String get provider => 'Mtoa huduma';

  @override
  String get refresh => 'Onyesha upya';

  @override
  String get remote => 'Rimoti';

  @override
  String get rename => 'Badilisha jina';

  @override
  String get revoke => 'Batilisha';

  @override
  String get role => 'Jukumu';

  @override
  String get root => 'Mzizi';

  @override
  String get run => 'Kimbia';

  @override
  String get search => 'Tafuta';

  @override
  String get select => 'Chagua';

  @override
  String get send => 'Tuma';

  @override
  String get sessions => 'Vikao';

  @override
  String get set => 'Weka';

  @override
  String get status => 'Hali';

  @override
  String get stop => 'Simamisha';

  @override
  String get streaming => 'Kutiririsha';

  @override
  String get time => 'Muda';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Sanidua';

  @override
  String get up => 'Juu';

  @override
  String get update => 'Sasisha';

  @override
  String get upload => 'Pakia';

  @override
  String get unmute => 'Rejesha sauti';

  @override
  String get mute => 'Zima sauti';

  @override
  String get branding => 'Kuweka chapa';

  @override
  String get adminDrawerDashboard => 'Dashibodi';

  @override
  String get adminDrawerAnalytics => 'Uchanganuzi';

  @override
  String get adminDrawerSettings => 'Mipangilio';

  @override
  String get adminDrawerBranding => 'Kuweka chapa';

  @override
  String get adminDrawerUsers => 'Watumiaji';

  @override
  String get adminDrawerLibraries => 'Maktaba';

  @override
  String get adminDrawerDisplay => 'Onyesho';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'Mipangilio ya NFO';

  @override
  String get adminDrawerTranscoding => 'Kubadilisha msimbo';

  @override
  String get adminDrawerResume => 'Endelea';

  @override
  String get adminDrawerStreaming => 'Kutiririsha';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Vifaa';

  @override
  String get adminDrawerActivity => 'Shughuli';

  @override
  String get adminDrawerNetworking => 'Mtandao';

  @override
  String get adminDrawerApiKeys => 'Vifunguo vya API';

  @override
  String get adminDrawerBackups => 'Hifadhi rudufu';

  @override
  String get adminDrawerLogs => 'Kumbukumbu';

  @override
  String get adminDrawerScheduledTasks => 'Kazi Zilizoratibiwa';

  @override
  String get adminDrawerPlugins => 'Programu-jalizi';

  @override
  String get adminDrawerRepositories => 'hazina';

  @override
  String get adminDrawerLiveTv => 'TV ya moja kwa moja';

  @override
  String get adminExitTooltip => 'Ondoka kwa Msimamizi';

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
  String get adminDashboardLoadFailed => 'Imeshindwa kupakia dashibodi';

  @override
  String get adminMediaOverview => 'Muhtasari wa Vyombo vya Habari';

  @override
  String get adminMediaTotalsError =>
      'Haikuweza kupakia jumla ya midia ya seva.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Usomaji wa haraka wa ni kiasi gani cha maudhui kwenye seva hii.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Masasisho ya programu-jalizi yanayopatikana: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Programu-jalizi zinazohitaji kuanzishwa upya: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Kazi zilizoratibiwa zilizoshindwa: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Usambazaji wa Vyombo vya Habari';

  @override
  String get analyticsVideoCodecs => 'Codecs za Video';

  @override
  String get analyticsAudioCodecs => 'Kodeki za Sauti';

  @override
  String get analyticsContainers => 'Vyombo';

  @override
  String get analyticsTopGenres => 'Aina za Juu';

  @override
  String get analyticsReleaseYears => 'Miaka ya Kutolewa';

  @override
  String get analyticsContentRatings => 'Ukadiriaji wa Maudhui';

  @override
  String get analyticsRuntimeBuckets => 'Ndoo za Runtime';

  @override
  String get analyticsFileFormats => 'Miundo ya Faili';

  @override
  String get analyticsNoData => 'Hakuna Data Inayopatikana.';

  @override
  String get adminServerInfo => 'Taarifa za Seva';

  @override
  String get adminRestartPending => 'Anzisha tena Inasubiri';

  @override
  String get adminServerPaths => 'Njia za seva';

  @override
  String get adminServerActions => 'Vitendo vya Seva';

  @override
  String get adminRestartServer => 'Anzisha tena Seva';

  @override
  String get adminShutdownServer => 'Zima Seva';

  @override
  String get adminLibraryScanStarted => 'Uchanganuzi wa maktaba umeanza';

  @override
  String errorGeneric(String error) {
    return 'Hitilafu: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Kuwasha upya seva kunaendelea';

  @override
  String get adminServerRebootMessage =>
      'Kuwasha upya seva kunaendelea, tafadhali anzisha upya Moonfin';

  @override
  String get adminActiveSessions => 'Vipindi Amilifu';

  @override
  String get adminSessionsLoadFailed => 'Imeshindwa kupakia vipindi';

  @override
  String get adminNoActiveSessions => 'Hakuna vipindi vinavyotumika';

  @override
  String get adminRecentActivity => 'Shughuli ya Hivi Karibuni';

  @override
  String get adminNoRecentActivity => 'Hakuna shughuli za hivi majuzi';

  @override
  String adminCommandFailed(String error) {
    return 'Amri imeshindwa: $error';
  }

  @override
  String get adminSendMessage => 'Tuma Ujumbe';

  @override
  String get adminMessageTextHint => 'Nakala ya ujumbe';

  @override
  String get adminSetVolume => 'Weka Kiasi';

  @override
  String get sessionPrev => 'Iliyotangulia';

  @override
  String get sessionRewind => 'Rudisha nyuma';

  @override
  String get sessionForward => 'Mbele';

  @override
  String get sessionNext => 'Inayofuata';

  @override
  String get sessionVolumeDown => 'Volu -';

  @override
  String get sessionVolumeUp => 'Juzuu +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Sasa Inacheza';

  @override
  String get volume => 'Sauti';

  @override
  String get actions => 'Vitendo';

  @override
  String get videoCodec => 'Kodeki ya Video';

  @override
  String get audioCodec => 'Kodeki ya Sauti';

  @override
  String get hwAccel => 'Kasi ya Maunzi';

  @override
  String get completion => 'Kukamilika';

  @override
  String get adminClearDates => 'Tarehe wazi';

  @override
  String get adminActivitySeverityAll => 'Viwango vyote vya ukali';

  @override
  String get adminActivityDateRange => 'Kipindi cha tarehe';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Imeshindwa kupakia kumbukumbu ya shughuli: $error';
  }

  @override
  String get adminNoActivityEntries => 'Hakuna maingizo ya shughuli';

  @override
  String get adminEditDeviceName => 'Hariri Jina la Kifaa';

  @override
  String get adminCustomName => 'Jina Maalum';

  @override
  String get adminDeviceNameUpdated => 'Jina la kifaa limesasishwa';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Imeshindwa kusasisha kifaa: $error';
  }

  @override
  String get adminDeleteDevice => 'Futa Kifaa';

  @override
  String get adminDeviceDeleted => 'Kifaa kimefutwa';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Imeshindwa kufuta kifaa: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Ondoa kifaa \'$name\'? Mtumiaji atahitaji kuingia tena kwenye kifaa hiki.';
  }

  @override
  String get adminDeleteAllDevices => 'Futa vifaa vyote';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Ondoa vifaa $count? Watumiaji walioathirika watahitaji kuingia tena. Kifaa chako cha sasa hakiathiriwi.';
  }

  @override
  String get adminDevicesDeletedAll => 'Vifaa vimeondolewa';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Baadhi ya vifaa vimeondolewa; $count havikuweza kuondolewa.';
  }

  @override
  String get adminDevicesLoadFailed => 'Imeshindwa kupakia vifaa';

  @override
  String get adminSearchDevices => 'Tafuta vifaa';

  @override
  String get adminThisDevice => 'Kifaa hiki';

  @override
  String get adminEditName => 'Hariri Jina';

  @override
  String get adminLibrariesLoadFailed => 'Imeshindwa kupakia maktaba';

  @override
  String get adminNoLibraries => 'Hakuna maktaba zilizosanidiwa';

  @override
  String get adminScanAllLibraries => 'Changanua Maktaba Zote';

  @override
  String get adminAddLibrary => 'Ongeza Maktaba';

  @override
  String adminScanFailed(String error) {
    return 'Imeshindwa kuanza kuchanganua: $error';
  }

  @override
  String get adminRenameLibrary => 'Badilisha jina la Maktaba';

  @override
  String get adminNewName => 'Jina jipya';

  @override
  String adminLibraryRenamed(String name) {
    return 'Maktaba imepewa jina jipya \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Imeshindwa kubadilisha jina: $error';
  }

  @override
  String get adminDeleteLibrary => 'Futa Maktaba';

  @override
  String adminLibraryDeleted(String name) {
    return 'Maktaba \"$name\" imefutwa';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Imeshindwa kufuta maktaba: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Imeshindwa kuongeza njia: $error';
  }

  @override
  String get adminRemovePath => 'Ondoa Njia';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Ondoa \"$path\" kutoka kwa maktaba hii?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Imeshindwa kuondoa njia: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Imeshindwa kupakia maktaba';

  @override
  String get adminNoMediaPaths => 'Hakuna njia za midia zilizosanidiwa';

  @override
  String get adminAddPath => 'Ongeza Njia';

  @override
  String get adminBrowseFilesystem => 'Vinjari mfumo wa faili wa seva:';

  @override
  String get adminPreferredMetadataLanguage =>
      'Lugha ya metadata inayopendekezwa';

  @override
  String get adminMetadataLanguageHint => 'k.m. sw, de, fr';

  @override
  String get adminMetadataCountryCode => 'Msimbo wa nchi wa metadata';

  @override
  String get adminMetadataCountryHint => 'k.m. Marekani, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Njia';

  @override
  String get adminLibraryTabOptions => 'Chaguo';

  @override
  String get adminLibraryTabDownloaders => 'Vipakuzi';

  @override
  String get adminLibMetadataSavers => 'Vihifadhi vya metadata';

  @override
  String get adminLibSubtitleDownloaders => 'Vipakuzi vya manukuu';

  @override
  String get adminLibLyricDownloaders => 'Vipakuzi vya maneno ya nyimbo';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Vipakuzi vya metadata: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Vichukuzi vya picha: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Seva hii haitoi vipakuzi vyovyote kwa aina hii ya maktaba.';

  @override
  String get adminLibrarySectionGeneral => 'Jumla';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Maelezo Yaliyopachikwa';

  @override
  String get adminLibrarySectionSubtitles => 'Manukuu';

  @override
  String get adminLibrarySectionImages => 'Picha';

  @override
  String get adminLibrarySectionSeries => 'Mifululizo';

  @override
  String get adminLibrarySectionMusic => 'Muziki';

  @override
  String get adminLibrarySectionMovies => 'Filamu';

  @override
  String get adminLibRealtimeMonitor => 'Washa ufuatiliaji wa wakati halisi';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Tambua mabadiliko ya faili na uyachakate kiotomatiki.';

  @override
  String get adminLibEnablePhotos => 'Onyesha picha';

  @override
  String get adminLibSaveLocalMetadata =>
      'Hifadhi sanaa katika folda za maudhui';

  @override
  String get adminLibRefreshInterval => 'Kuonyesha upya metadata kiotomatiki';

  @override
  String get adminLibRefreshNever => 'Kamwe';

  @override
  String get adminLibDefault => 'Chaguo-msingi';

  @override
  String get adminLibDisplayTitle => 'Onyesho';

  @override
  String get adminLibDisplaySection => 'Onyesho la maktaba';

  @override
  String get adminLibFolderView =>
      'Onyesha mwonekano wa folda ili kuonyesha folda za maudhui za kawaida';

  @override
  String get adminLibSpecialsInSeasons =>
      'Onyesha vipindi maalum ndani ya misimu vilivyorushwa';

  @override
  String get adminLibGroupMovies => 'Panga filamu katika makusanyo';

  @override
  String get adminLibGroupShows => 'Panga vipindi katika makusanyo';

  @override
  String get adminLibExternalSuggestions =>
      'Onyesha maudhui ya nje katika mapendekezo';

  @override
  String get adminLibDateAddedSection => 'Tabia ya tarehe ya kuongezwa';

  @override
  String get adminLibDateAddedLabel => 'Tumia tarehe ya kuongezwa kutoka';

  @override
  String get adminLibDateAddedImport =>
      'Tarehe iliyochanganuliwa kwenye maktaba';

  @override
  String get adminLibDateAddedFile => 'Tarehe faili lilipoundwa';

  @override
  String get adminLibMetadataTitle => 'Metadata na Picha';

  @override
  String get adminLibMetadataLangSection => 'Lugha inayopendelewa ya metadata';

  @override
  String get adminLibChaptersSection => 'Sura';

  @override
  String get adminLibDummyChapterDuration => 'Muda wa sura bandia (sekunde)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Urefu wa sura zinazotengenezwa kwa maudhui yasiyo na sura. Weka 0 ili kuzima.';

  @override
  String get adminLibChapterImageResolution => 'Mwonekano wa picha za sura';

  @override
  String get adminLibNfoTitle => 'Mipangilio ya NFO';

  @override
  String get adminLibNfoHelp =>
      'Metadata ya NFO inaoana na Kodi na programu-mteja zinazofanana. Mipangilio hutumika kwa maktaba zote zinazohifadhi metadata ya NFO.';

  @override
  String get adminLibKodiUser =>
      'Mtumiaji wa kuhifadhia data ya utazamaji katika faili za NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Hifadhi njia za picha ndani ya faili za NFO';

  @override
  String get adminLibPathSubstitution =>
      'Washa ubadilishaji wa njia kwa njia za picha za NFO';

  @override
  String get adminLibExtraThumbs =>
      'Nakili picha za extrafanart kwenye folda ya extrathumbs';

  @override
  String get adminLibNone => 'Hakuna';

  @override
  String adminLibRefreshDays(int days) {
    return 'siku $days';
  }

  @override
  String get adminLibEmbeddedTitles => 'Tumia vichwa vilivyopachikwa';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Tumia vichwa vilivyopachikwa kwa nyongeza';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Tumia maelezo ya kipindi yaliyopachikwa';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Ruhusu manukuu yaliyopachikwa';

  @override
  String get adminLibEmbeddedAllowAll => 'Ruhusu yote';

  @override
  String get adminLibEmbeddedAllowText => 'Maandishi pekee';

  @override
  String get adminLibEmbeddedAllowImage => 'Picha pekee';

  @override
  String get adminLibEmbeddedAllowNone => 'Hakuna';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Ruka upakuaji ikiwa manukuu yaliyopachikwa yapo';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Ruka upakuaji ikiwa mkondo wa sauti unalingana na lugha ya upakuaji';

  @override
  String get adminLibRequirePerfectMatch =>
      'Hitaji ulinganifu kamili wa manukuu';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Hifadhi manukuu katika folda za maudhui';

  @override
  String get adminLibChapterImageExtraction => 'Toa picha za sura';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Toa picha za sura wakati wa kuchanganua maktaba';

  @override
  String get adminLibTrickplayExtraction =>
      'Washa utoaji wa picha za Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Toa picha za Trickplay wakati wa kuchanganua maktaba';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Hifadhi picha za Trickplay katika folda za maudhui';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Unganisha kiotomatiki mifululizo iliyosambaa katika folda nyingi';

  @override
  String get adminLibSeasonZeroName => 'Jina la kuonyesha la msimu sifuri';

  @override
  String get adminLibLufsScan =>
      'Washa uchanganuzi wa LUFS kwa usawazishaji wa sauti';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Pendelea lebo isiyo ya kawaida ya wasanii';

  @override
  String get adminLibAutoAddToCollection =>
      'Ongeza filamu kwenye makusanyo kiotomatiki';

  @override
  String get adminLibraryNameRequired => 'Jina la maktaba linahitajika';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Imeshindwa kuunda maktaba: $error';
  }

  @override
  String get adminLibraryName => 'Jina la Maktaba';

  @override
  String get adminSelectedPaths => 'Njia Zilizochaguliwa:';

  @override
  String get adminCreateLibrary => 'Unda Maktaba';

  @override
  String get paths => 'Njia:';

  @override
  String get adminDisableUser => 'Zima Mtumiaji';

  @override
  String get adminEnableUser => 'Wezesha Mtumiaji';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Zima $name? Hataweza kuingia.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Washa $name? Ataweza kuingia tena.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Mtumiaji \"$name\" amezimwa';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Mtumiaji \"$name\" amewashwa';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Imeshindwa kusasisha sera ya mtumiaji: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Imeshindwa kupakia watumiaji';

  @override
  String get adminSearchUsers => 'Tafuta watumiaji';

  @override
  String get adminEditUser => 'Badilisha Mtumiaji';

  @override
  String get adminAddUser => 'Ongeza Mtumiaji';

  @override
  String adminUserCreateFailed(String error) {
    return 'Imeshindwa kuunda mtumiaji: $error';
  }

  @override
  String get adminCreateUser => 'Unda Mtumiaji';

  @override
  String get adminPasswordOptional => 'Nenosiri (si lazima)';

  @override
  String get adminUsernameRequired => 'Jina la mtumiaji haliwezi kuwa tupu';

  @override
  String adminSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Manenosiri hayalingani';

  @override
  String adminFailed(String error) {
    return 'Imeshindwa: $error';
  }

  @override
  String get adminUserLoadFailed => 'Imeshindwa kupakia mtumiaji';

  @override
  String get adminDeleteUser => 'Futa Mtumiaji';

  @override
  String get admin => 'Msimamizi';

  @override
  String get adminFullAccessWarning =>
      'Wasimamizi wana ufikiaji kamili kwa seva. Toa kwa tahadhari.';

  @override
  String get administrator => 'Msimamizi';

  @override
  String get adminHiddenUser => 'Mtumiaji aliyefichwa';

  @override
  String get adminAllowMediaPlayback => 'Ruhusu uchezaji wa maudhui';

  @override
  String get adminAllowAudioTranscoding => 'Ruhusu upitishaji wa sauti';

  @override
  String get adminAllowVideoTranscoding => 'Ruhusu upitishaji msimbo wa video';

  @override
  String get adminAllowRemuxing => 'Ruhusu remuxing';

  @override
  String get adminForceRemoteTranscoding =>
      'Lazimisha upitishaji wa chanzo cha mbali';

  @override
  String get adminAllowContentDownloading => 'Ruhusu upakuaji wa maudhui';

  @override
  String get adminAllowPublicSharing => 'Ruhusu kushiriki kwa umma';

  @override
  String get adminAllowRemoteControl =>
      'Ruhusu udhibiti wa mbali wa watumiaji wengine';

  @override
  String get adminAllowSharedDeviceControl =>
      'Ruhusu udhibiti wa kifaa kilichoshirikiwa';

  @override
  String get adminAllowRemoteAccess => 'Ruhusu ufikiaji wa mbali';

  @override
  String get adminLeaveEmptyNoLimit => 'Acha tupu bila kikomo';

  @override
  String get adminMaxActiveSessions => 'Upeo wa vipindi vinavyotumika';

  @override
  String get adminAllowLiveTvAccess => 'Ruhusu ufikiaji wa TV ya Moja kwa Moja';

  @override
  String get adminAllowLiveTvManagement =>
      'Ruhusu udhibiti wa TV ya Moja kwa Moja';

  @override
  String get adminAllowCollectionManagement => 'Ruhusu usimamizi wa mkusanyiko';

  @override
  String get adminAllowSubtitleManagement => 'Ruhusu usimamizi wa manukuu';

  @override
  String get adminAllowLyricManagement => 'Ruhusu usimamizi wa sauti';

  @override
  String get adminEnableAllLibraryAccess => 'Washa ufikiaji wa maktaba zote';

  @override
  String get adminChangePassword => 'Badilisha Nenosiri';

  @override
  String get adminNewPassword => 'Nenosiri Mpya';

  @override
  String get adminConfirmPassword => 'Thibitisha Nenosiri';

  @override
  String get adminSetPassword => 'Weka Nenosiri';

  @override
  String get adminResetPassword => 'Weka upya Nenosiri';

  @override
  String get adminPasswordReset => 'Weka upya nenosiri';

  @override
  String get adminPasswordUpdated => 'Nenosiri limesasishwa';

  @override
  String get adminUserSettings => 'Mipangilio ya Mtumiaji';

  @override
  String get adminLibraryAccess => 'Ufikiaji wa Maktaba';

  @override
  String get adminEnableAllDevices => 'Washa ufikiaji wa vifaa vyote';

  @override
  String get adminEnableAllChannels => 'Washa ufikiaji wa vituo vyote';

  @override
  String get adminParentalControl => 'Udhibiti wa Wazazi';

  @override
  String get adminMaxParentalRating =>
      'Ukadiriaji wa juu wa wazazi unaoruhusiwa';

  @override
  String get adminMaxParentalRatingHint =>
      'Maudhui yenye ukadiriaji wa juu zaidi yatafichwa kwa mtumiaji huyu.';

  @override
  String get adminParentalRatingNone => 'Hakuna';

  @override
  String get adminBlockUnratedItems =>
      'Zuia vipengee visivyo na maelezo ya ukadiriaji au visivyotambulika';

  @override
  String get adminUnratedBook => 'Vitabu';

  @override
  String get adminUnratedChannelContent => 'Chaneli';

  @override
  String get adminUnratedLiveTvChannel => 'TV ya moja kwa moja';

  @override
  String get adminUnratedMovie => 'Filamu';

  @override
  String get adminUnratedMusic => 'Muziki';

  @override
  String get adminUnratedTrailer => 'Trela';

  @override
  String get adminUnratedSeries => 'Vipindi';

  @override
  String get adminAccessSchedules => 'Ratiba za Ufikiaji';

  @override
  String get adminAccessSchedulesHint =>
      'Ruhusu ufikiaji wakati wa nyakati zilizoratibiwa hapa chini pekee. Ufikiaji unaruhusiwa siku nzima wakati hakuna ratiba iliyowekwa.';

  @override
  String get adminAddSchedule => 'Ongeza Ratiba';

  @override
  String get adminScheduleDay => 'Siku';

  @override
  String get adminScheduleStart => 'Mwanzo';

  @override
  String get adminScheduleEnd => 'Mwisho';

  @override
  String get adminDayEveryday => 'Kila siku';

  @override
  String get adminDayWeekday => 'Siku ya kazi';

  @override
  String get adminDayWeekend => 'Wikendi';

  @override
  String get adminDaySunday => 'Jumapili';

  @override
  String get adminDayMonday => 'Jumatatu';

  @override
  String get adminDayTuesday => 'Jumanne';

  @override
  String get adminDayWednesday => 'Jumatano';

  @override
  String get adminDayThursday => 'Alhamisi';

  @override
  String get adminDayFriday => 'Ijumaa';

  @override
  String get adminDaySaturday => 'Jumamosi';

  @override
  String get adminAllowedTags => 'Lebo zinazoruhusiwa';

  @override
  String get adminAllowedTagsHint =>
      'Maudhui yenye lebo hizi pekee ndiyo yanaonyeshwa. Acha wazi ili kuruhusu yote.';

  @override
  String get adminBlockedTags => 'Lebo zilizozuiwa';

  @override
  String get adminBlockedTagsHint =>
      'Maudhui yenye lebo hizi yamefichwa kwa mtumiaji huyu.';

  @override
  String get adminAddTag => 'Ongeza lebo';

  @override
  String get adminAuthProvider => 'Mtoa huduma wa uthibitishaji';

  @override
  String get adminPasswordResetProvider =>
      'Mtoa huduma wa kuweka upya nenosiri';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Idadi ya juu ya majaribio ya kuingia yaliyoshindwa kabla ya kufungiwa';

  @override
  String get adminLoginAttemptsHint =>
      'Weka 0 kwa chaguo-msingi, au -1 ili kuzima kufungiwa.';

  @override
  String get adminSyncPlayAccess => 'Ufikiaji wa SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Ruhusu kuunda na kujiunga na vikundi';

  @override
  String get adminSyncPlayJoin => 'Ruhusu kujiunga na vikundi';

  @override
  String get adminSyncPlayNone => 'Hakuna ufikiaji';

  @override
  String get adminContentDeletionFolders => 'Ruhusu kufuta maudhui kutoka';

  @override
  String get adminResetPasswordWarning =>
      'Hii itaondoa nenosiri. Mtumiaji ataweza kuingia bila nenosiri.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Seva imerudisha HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Una uhakika unataka kufuta $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Mtumiaji \"$name\" amefutwa';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Imeshindwa kufuta mtumiaji: $error';
  }

  @override
  String get adminCreateApiKey => 'Unda Ufunguo wa API';

  @override
  String get adminAppName => 'Jina la programu';

  @override
  String get adminApiKeyCreated => 'Ufunguo wa API Umeundwa';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Ufunguo umeundwa. Seva haikurudisha tokeni. Angalia funguo za API za seva.';

  @override
  String get adminKeyCopied => 'Ufunguo umenakiliwa kwenye ubao wa kunakili';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Imeshindwa kuunda ufunguo: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Tokeni muhimu haipo kwenye jibu la seva';

  @override
  String get adminRevokeApiKey => 'Batilisha Ufunguo wa API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Batilisha ufunguo wa $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Kitufe cha API kimebatilishwa';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Imeshindwa kubatilisha ufunguo: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Imeshindwa kupakia vitufe vya API';

  @override
  String get adminApiKeysTitle => 'Vifunguo vya API';

  @override
  String get adminCreateKey => 'Unda Ufunguo';

  @override
  String get adminNoApiKeys => 'Hakuna funguo za API zilizopatikana';

  @override
  String get adminUnknownApp => 'Programu Isiyojulikana';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Tokeni: $token\\nImeundwa: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Unda Nakala Rudufu';

  @override
  String get adminBackupDatabase => 'Hifadhidata';

  @override
  String get adminBackupDatabaseAlways => 'Hujumuishwa kila wakati';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Manukuu';

  @override
  String get adminBackupTrickplay => 'Picha za Trickplay';

  @override
  String get adminCreatingBackup => 'Inaunda nakala rudufu...';

  @override
  String get adminBackupCreated => 'Hifadhi rudufu imeundwa';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Imeshindwa kuunda nakala rudufu: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Njia mbadala haipo katika majibu ya seva';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesti: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Imeshindwa kupakia manifesti: $error';
  }

  @override
  String get adminConfirmRestore => 'Thibitisha Kurejesha';

  @override
  String get adminRestoringBackup => 'Inarejesha nakala rudufu...';

  @override
  String adminRestoreFailed(String error) {
    return 'Imeshindwa kurejesha nakala rudufu: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Imeshindwa kupakia nakala rudufu';

  @override
  String get adminCreateBackup => 'Unda Hifadhi Nakala';

  @override
  String get adminNoBackups => 'Hakuna chelezo zilizopatikana';

  @override
  String get adminViewDetails => 'Tazama Maelezo';

  @override
  String get restore => 'Rejesha';

  @override
  String get adminLogsLoadFailed => 'Imeshindwa kupakia kumbukumbu za seva';

  @override
  String get adminNoLogFiles => 'Hakuna faili za kumbukumbu zilizopatikana';

  @override
  String get adminLogCopied => 'Kumbukumbu imenakiliwa kwenye ubao wa kunakili';

  @override
  String get adminSaveLogFile => 'Hifadhi faili ya kumbukumbu';

  @override
  String adminSavedTo(String path) {
    return 'Imehifadhiwa kwenye $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi faili: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Imeshindwa kupakia $fileName';
  }

  @override
  String get adminSearchInLog => 'Tafuta kwenye logi';

  @override
  String get adminNoMatchingLines => 'Hakuna mistari inayolingana';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Imeshindwa kupakia kazi: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Hakuna kazi zilizoratibiwa kupatikana';

  @override
  String get adminNoTasksMatchFilter =>
      'Hakuna kazi zinazolingana na kichujio cha sasa';

  @override
  String adminTaskStartFailed(String error) {
    return 'Imeshindwa kuanzisha kazi: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Imeshindwa kusimamisha kazi: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Imeshindwa kupakia kazi: $error';
  }

  @override
  String get adminRunNow => 'Endesha Sasa';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Imeshindwa kuondoa kichochezi: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Imeshindwa kuongeza kichochezi: $error';
  }

  @override
  String get adminLastExecution => 'Utekelezaji wa Mwisho';

  @override
  String get adminTriggers => 'Vichochezi';

  @override
  String get adminAddTrigger => 'Ongeza Kichochezi';

  @override
  String get adminNoTriggers => 'Hakuna vichochezi vilivyosanidiwa';

  @override
  String get adminTriggerType => 'Anzisha Aina';

  @override
  String get adminNoLimit => 'Hakuna kikomo';

  @override
  String adminHours(String hours) {
    return 'saa $hours';
  }

  @override
  String get adminDayOfWeek => 'Siku ya wiki';

  @override
  String get adminSearchPlugins => 'Tafuta programu jalizi...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Imeshindwa kubadilisha programu-jalizi: $error';
  }

  @override
  String get adminUninstallPlugin => 'Sanidua programu-jalizi';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Una uhakika unataka kuondoa \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Imeshindwa kuondoa programu-jalizi: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Imeshindwa kusakinisha kifurushi: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Imeshindwa kusakinisha sasisho: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Imeshindwa kupakia programu-jalizi: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Hakuna programu-jalizi zinazolingana na utafutaji wako';

  @override
  String get adminNoPluginsInstalled =>
      'Hakuna programu-jalizi zilizosakinishwa';

  @override
  String adminInstallUpdate(String version) {
    return 'Sakinisha sasisho (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Imeshindwa kupakia katalogi: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Hakuna vifurushi vinavyolingana na utafutaji wako';

  @override
  String get adminNoPackagesAvailable => 'Hakuna vifurushi vinavyopatikana';

  @override
  String get adminExperimentalIntegration => 'Ujumuishaji wa Majaribio';

  @override
  String get adminExperimentalWarning =>
      'Muunganisho wa mipangilio ya programu-jalizi bado ni wa majaribio. Baadhi ya kurasa za mipangilio haziwezi kutoa ipasavyo.';

  @override
  String get continueAction => 'Endelea';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" itaondolewa baada ya seva kuanzishwa upya';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Imeshindwa kuondoa: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Inasasisha \"$name\" hadi v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Imeshindwa kupakia programu-jalizi: $error';
  }

  @override
  String get adminPluginNotFound => 'Programu-jalizi haijapatikana';

  @override
  String adminPluginVersion(String version) {
    return 'Toleo $version';
  }

  @override
  String get adminEnablePlugin => 'Washa Programu-jalizi';

  @override
  String get adminPluginSettingsPage =>
      'Ukurasa wa mipangilio ya programu-jalizi';

  @override
  String get adminRevisionHistory => 'Historia ya Marekebisho';

  @override
  String get adminNoChangelog => 'Hakuna logi inayopatikana.';

  @override
  String get adminRemoveRepository => 'Ondoa Hifadhi';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Una uhakika unataka kuondoa \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi hazina: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Imeshindwa kupakia hazina: $error';
  }

  @override
  String get adminRepositoryNameHint => 'k.m. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL ya hifadhi';

  @override
  String get adminAddEntry => 'Ongeza kiingilio';

  @override
  String get adminInvalidUrl => 'URL batili';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Imeshindwa kupakia mipangilio ya programu-jalizi: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Imeshindwa kufungua $uri';
  }

  @override
  String get adminOpenInBrowser => 'Fungua katika Kivinjari';

  @override
  String get adminOpenExternally => 'Fungua nje';

  @override
  String get adminGeneralSettings => 'Mipangilio ya Jumla';

  @override
  String get adminServerName => 'Jina la seva';

  @override
  String get adminPreferredMetadataCountry => 'Nchi ya metadata inayopendelewa';

  @override
  String get adminCachePath => 'Njia ya akiba';

  @override
  String get adminMetadataPath => 'Njia ya metadata';

  @override
  String get adminLibraryScanConcurrency => 'Uchanganuzi wa sarafu ya maktaba';

  @override
  String get adminParallelImageEncodingLimit =>
      'Kikomo cha usimbaji wa picha sambamba';

  @override
  String get adminSlowResponseThreshold => 'Kiwango cha chini cha majibu (ms)';

  @override
  String get adminBrandingLoadFailed =>
      'Imeshindwa kupakia mipangilio ya chapa';

  @override
  String get adminLoginDisclaimer => 'Kanusho la kuingia';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML iliyoonyeshwa chini ya fomu ya kuingia';

  @override
  String get adminCustomCss => 'CSS maalum';

  @override
  String get adminCustomCssHint =>
      'CSS maalum inatumika kwenye kiolesura cha wavuti';

  @override
  String get adminEnableSplashScreen => 'Washa skrini ya Splash';

  @override
  String get adminStreamingLoadFailed =>
      'Imeshindwa kupakia mipangilio ya utiririshaji';

  @override
  String get adminStreamingDescription =>
      'Weka vikomo vya kasi biti ya utiririshaji ulimwenguni kwa miunganisho ya mbali.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Kikomo cha kasi ya biti ya mteja wa mbali (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Acha tupu au 0 kwa ukomo';

  @override
  String get adminPlaybackLoadFailed =>
      'Imeshindwa kupakia mipangilio ya kucheza tena';

  @override
  String get adminHardwareAcceleration => 'Kuongeza kasi ya vifaa';

  @override
  String get adminVaapiDevice => 'Kifaa cha VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Washa usimbaji maunzi';

  @override
  String get adminEnableHardwareDecoding => 'Washa usimbaji maunzi kwa:';

  @override
  String get adminEncodingThreads => 'Usimbaji nyuzi';

  @override
  String get adminAutomatic => '0 = moja kwa moja';

  @override
  String get adminTranscodingTempPath => 'Njia ya joto ya kubadilisha msimbo';

  @override
  String get adminEnableFallbackFont => 'Washa fonti mbadala';

  @override
  String get adminFallbackFontPath => 'Njia ya fonti ya kurudi nyuma';

  @override
  String get adminAllowSegmentDeletion => 'Ruhusu kufutwa kwa sehemu';

  @override
  String get adminSegmentKeepSeconds => 'Weka sehemu (sekunde)';

  @override
  String get adminThrottleBuffering => 'Kuakibisha kaba';

  @override
  String get adminTrickplayLoadFailed =>
      'Imeshindwa kupakia mipangilio ya Trickplay';

  @override
  String get adminEnableHardwareAcceleration => 'Washa kuongeza kasi ya maunzi';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Washa uchimbaji wa fremu muhimu pekee';

  @override
  String get adminKeyFrameSubtitle => 'Usahihi wa haraka lakini wa chini';

  @override
  String get adminScanBehavior => 'Skena tabia';

  @override
  String get adminProcessPriority => 'Kipaumbele cha mchakato';

  @override
  String get adminImageSettings => 'Mipangilio ya Picha';

  @override
  String get adminIntervalMs => 'Muda (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Ni mara ngapi kunasa fremu';

  @override
  String get adminWidthResolutions => 'Maamuzi ya upana';

  @override
  String get adminTileWidth => 'Upana wa tile';

  @override
  String get adminTileHeight => 'Urefu wa tile';

  @override
  String get adminQualitySubtitle =>
      'Thamani za chini = ubora bora, faili kubwa';

  @override
  String get adminProcessThreads => 'Mchakato wa nyuzi';

  @override
  String get adminResumeLoadFailed =>
      'Imeshindwa kupakia mipangilio ya kuendelea';

  @override
  String get adminResumeDescription =>
      'Sanidi wakati maudhui yanapaswa kutiwa alama kuwa yamechezwa kwa kiasi au kuchezwa kikamilifu.';

  @override
  String get adminMinResumePercentage => 'Asilimia ya chini ya wasifu';

  @override
  String get adminMinResumeSubtitle =>
      'Ni lazima maudhui yachezwe kupita asilimia hii ili kuokoa maendeleo';

  @override
  String get adminMaxResumePercentage => 'Asilimia ya juu zaidi ya wasifu';

  @override
  String get adminMaxResumeSubtitle =>
      'Maudhui yanazingatiwa kuchezwa kikamilifu baada ya asilimia hii';

  @override
  String get adminMinResumeDuration => 'Muda wa chini wa kuendelea (sekunde)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Vipengee vifupi kuliko hivi havitumiki tena';

  @override
  String get adminMinAudiobookResume =>
      'Asilimia ya chini ya urejeshaji wa kitabu cha kusikiliza';

  @override
  String get adminMaxAudiobookResume =>
      'Upeo wa asilimia ya urejeshaji wa kitabu cha kusikiliza';

  @override
  String get adminNetworkingLoadFailed =>
      'Imeshindwa kupakia mipangilio ya mtandao';

  @override
  String get adminNetworkingWarning =>
      'Mabadiliko ya mipangilio ya mtandao yanaweza kuhitaji kuanzishwa upya kwa seva.';

  @override
  String get adminEnableRemoteAccess => 'Washa ufikiaji wa mbali';

  @override
  String get ports => 'Bandari';

  @override
  String get adminHttpPort => 'Mlango wa HTTP';

  @override
  String get adminHttpsPort => 'Mlango wa HTTPS';

  @override
  String get adminPublicHttpsPort => 'Mlango wa HTTPS wa umma';

  @override
  String get adminBaseUrl => 'URL ya msingi';

  @override
  String get adminBaseUrlHint => 'k.m. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Washa HTTPS';

  @override
  String get adminLocalNetwork => 'Mtandao wa Ndani';

  @override
  String get adminLocalNetworkAddresses => 'Anwani za mtandao wa ndani';

  @override
  String get adminKnownProxies => 'Wawakilishi wanaojulikana';

  @override
  String get adminRemoteIpFilter => 'Kichujio cha IP cha mbali';

  @override
  String get adminRemoteIpFilterEntries => 'Kichujio cha IP cha mbali';

  @override
  String get adminCertificatePath => 'Njia ya cheti';

  @override
  String get whitelist => 'Orodha iliyoidhinishwa';

  @override
  String get blacklist => 'Orodha nyeusi';

  @override
  String get notSet => 'Haijawekwa';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Imeshindwa kupakia metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Onyesha upya Metadata';

  @override
  String get recursive => 'Inajirudia';

  @override
  String get adminReplaceAllMetadata => 'Badilisha metadata zote';

  @override
  String get adminMetadataRefreshRequested => 'Ombi la kuonyesha upya metadata';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Imeshindwa kuonyesha upya metadata: $error';
  }

  @override
  String get adminNoRemoteMatches =>
      'Hakuna zinazolingana za mbali zilizopatikana';

  @override
  String get adminRemoteResults => 'Matokeo ya Mbali';

  @override
  String get adminRemoteMetadataApplied => 'Metadata ya mbali imetumika';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Utafutaji wa mbali umeshindwa: $error';
  }

  @override
  String get adminUpdateContentType => 'Sasisha Aina ya Maudhui';

  @override
  String get adminContentType => 'Aina ya maudhui';

  @override
  String get adminContentTypeUpdated => 'Aina ya maudhui imesasishwa';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Imeshindwa kusasisha aina ya maudhui: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Imeshindwa kupakia kihariri cha metadata';

  @override
  String get adminNoPeopleEntries => 'Hakuna maingizo ya watu';

  @override
  String get adminNoExternalIds =>
      'Hakuna vitambulisho vya nje vinavyopatikana';

  @override
  String adminImageUpdated(String imageType) {
    return 'Picha ya $imageType imesasishwa';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Imeshindwa kupakua picha: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Umbizo la picha lisilotumika';

  @override
  String get adminImageReadFailed => 'Imeshindwa kusoma picha iliyochaguliwa';

  @override
  String adminImageUploaded(String imageType) {
    return 'Picha ya $imageType imepakiwa';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Imeshindwa kupakia picha: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Futa picha ya $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Picha ya $imageType imefutwa';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Imeshindwa kufuta picha: $error';
  }

  @override
  String get adminAllProviders => 'Watoa huduma wote';

  @override
  String get adminNoRemoteImages => 'Hakuna picha za mbali zilizopatikana';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Ugunduzi wa Tuner umeshindwa: $error';
  }

  @override
  String get adminTunerTypeM3u => 'Tuner ya M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Faili au URL';

  @override
  String get adminTunerIpAddress => 'Anwani ya IP ya Tuner';

  @override
  String get adminTunerFriendlyName => 'Jina rafiki';

  @override
  String get adminTunerUserAgent => 'Wakala wa mtumiaji';

  @override
  String get adminTunerCount => 'Kikomo cha miunganisho ya wakati mmoja';

  @override
  String get adminTunerCountHelp =>
      'Idadi ya juu ya mitiririko ambayo Tuner huruhusu kwa wakati mmoja. Weka 0 kwa isiyo na kikomo.';

  @override
  String get adminTunerFallbackBitrate =>
      'Kasi ya juu mbadala ya biti ya utiririshaji';

  @override
  String get adminTunerImportFavoritesOnly => 'Ingiza chaneli vipendwa pekee';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Ruhusu kubadilisha msimbo kwa maunzi';

  @override
  String get adminTunerAllowFmp4 =>
      'Ruhusu kontena la kubadilisha msimbo la fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Ruhusu kushiriki mtiririko';

  @override
  String get adminTunerEnableStreamLooping => 'Washa kurudia mtiririko';

  @override
  String get adminTunerIgnoreDts => 'Puuza DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Soma ingizo kwa kasi asili ya fremu';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Faili au URL';

  @override
  String get adminXmltvMoviePrefix => 'Kiambishi awali cha filamu';

  @override
  String get adminXmltvMovieCategories => 'Kategoria za filamu';

  @override
  String get adminXmltvCategoriesHelp =>
      'Tenganisha kategoria nyingi kwa mstari wima.';

  @override
  String get adminXmltvKidsCategories => 'Kategoria za watoto';

  @override
  String get adminXmltvNewsCategories => 'Kategoria za habari';

  @override
  String get adminXmltvSportsCategories => 'Kategoria za michezo';

  @override
  String get adminSdUsername => 'Jina la mtumiaji';

  @override
  String get adminSdPassword => 'Nenosiri';

  @override
  String get adminSdCountry => 'Nchi';

  @override
  String get adminSdCountrySelect => 'Chagua nchi';

  @override
  String get adminSdPostalCode => 'Msimbo wa posta';

  @override
  String get adminEnableAllTuners => 'Washa Tuner zote';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Imeshindwa kuondoa Tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Imeshindwa kuondoa mtoa huduma: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Njia ya kurekodi mfululizo';

  @override
  String get adminMovieRecordingPath => 'Njia ya kurekodi filamu';

  @override
  String get adminGuideDaysAuto => 'Kiotomatiki';

  @override
  String get adminRecordingPostProcessor =>
      'Njia ya programu ya uchakataji-baadaye';

  @override
  String get adminRecordingPostProcessorArgs => 'Hoja za kichakataji-baadaye';

  @override
  String get adminSaveRecordingNfo => 'Hifadhi metadata ya NFO ya rekodi';

  @override
  String get adminSaveRecordingImages => 'Hifadhi picha za rekodi';

  @override
  String get adminLiveTvSectionPaths => 'Njia za kurekodi';

  @override
  String get adminLiveTvSectionPostProcessing => 'Uchakataji-baadaye';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi mipangilio: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Imeshindwa kupakia usimamizi wa TV ya Moja kwa Moja';

  @override
  String get adminTunerDevices => 'Vifaa vya Kitafuta sauti';

  @override
  String get adminNoTunerHosts =>
      'Hakuna seva pangishi za kitafuta njia zilizosanidiwa';

  @override
  String get adminGuideProviders => 'Watoa Mwongozo';

  @override
  String get adminGuideRefreshStarted =>
      'Kuonyesha upya data ya mwongozo kumeanza';

  @override
  String get adminGuideRefreshUnavailable =>
      'Kazi ya kuonyesha upya mwongozo haipatikani kwenye seva hii.';

  @override
  String get adminNoListingProviders =>
      'Hakuna watoa huduma za uorodheshaji waliosanidiwa';

  @override
  String get adminSettingsSaved => 'Mipangilio imehifadhiwa';

  @override
  String get adminBackupsNotAvailable =>
      'Hifadhi rudufu hazipatikani kwenye muundo huu wa seva.';

  @override
  String get adminRestoreWarning1 =>
      'Kurejesha kutabadilisha data YOTE ya sasa ya seva na data mbadala.';

  @override
  String get adminRestoreWarning2 =>
      'Mipangilio ya sasa ya seva, watumiaji, na data ya maktaba itafutwa.';

  @override
  String get adminRestoreWarning3 => 'Seva itaanza upya baada ya kurejeshwa.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Rejesha nakala rudufu $name sasa?';
  }

  @override
  String get adminBackupsTitle => 'Hifadhi rudufu';

  @override
  String get adminUnknownDate => 'Tarehe isiyojulikana';

  @override
  String get adminUnnamedBackup => 'Hifadhi Nakala Isiyo na Jina';

  @override
  String get adminApply => 'Tumia';

  @override
  String get adminLogsTitle => 'Kumbukumbu za Seva';

  @override
  String get adminLogsNewestFirst => 'Mpya Zaidi Kwanza';

  @override
  String get adminLogsOldestFirst => 'Mzee Kwanza';

  @override
  String get adminLogsJustNow => 'Sasa hivi';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'dk $minutes zilizopita';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'saa $hours zilizopita';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'siku $days zilizopita';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Imeshindwa kupakia $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return 'matokeo $count';
  }

  @override
  String get adminLogViewerNoMatches => 'Hakuna mistari inayolingana';

  @override
  String get adminMetadataEditorTitle => 'Mhariri wa Metadata';

  @override
  String get adminMetadataIdentify => 'Tambua';

  @override
  String get adminMetadataType => 'Aina';

  @override
  String get adminMetadataDetails => 'Maelezo';

  @override
  String get adminMetadataExternalIds => 'Vitambulisho vya nje';

  @override
  String get adminMetadataImages => 'Picha';

  @override
  String get adminMetadataFieldTitle => 'Kichwa';

  @override
  String get adminMetadataFieldSortTitle => 'Panga kichwa';

  @override
  String get adminMetadataFieldOriginalTitle => 'Kichwa asili';

  @override
  String get adminMetadataFieldPremiereDate =>
      'Tarehe ya onyesho la kwanza (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Tarehe ya mwisho (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Mwaka wa uzalishaji';

  @override
  String get adminMetadataFieldOfficialRating => 'Ukadiriaji rasmi';

  @override
  String get adminMetadataFieldCommunityRating => 'Ukadiriaji wa jumuiya';

  @override
  String get adminMetadataFieldCriticRating => 'Ukadiriaji mkosoaji';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Mstari wa tagi';

  @override
  String get adminMetadataFieldOverview => 'Muhtasari';

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
  String get adminMetadataGenres => 'Aina';

  @override
  String get adminMetadataTags => 'Lebo';

  @override
  String get adminMetadataStudios => 'Studio';

  @override
  String get adminMetadataPeople => 'Watu';

  @override
  String get adminMetadataAddGenre => 'Ongeza aina';

  @override
  String get adminMetadataAddTag => 'Ongeza lebo';

  @override
  String get adminMetadataAddStudio => 'Ongeza studio';

  @override
  String get adminMetadataAddPerson => 'Ongeza Mtu';

  @override
  String get adminMetadataEditPerson => 'Hariri Mtu';

  @override
  String get adminMetadataRole => 'Jukumu';

  @override
  String get adminMetadataImagePrimary => 'Msingi';

  @override
  String get adminMetadataImageBackdrop => 'Mandhari';

  @override
  String get adminMetadataImageLogo => 'Nembo';

  @override
  String get adminMetadataImageBanner => 'Bango';

  @override
  String get adminMetadataImageThumb => 'Kidole gumba';

  @override
  String get adminMetadataProvider => 'Mtoa huduma';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Picha ya $imageType imesasishwa';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Picha ya $imageType imepakiwa';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Picha ya $imageType imefutwa';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Imeshindwa kupakua picha: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Imeshindwa kusoma picha iliyochaguliwa';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Imeshindwa kupakia picha: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Futa picha ya $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Hii huondoa picha ya sasa kutoka kwa kipengee.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Imeshindwa kufuta picha: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Chagua picha ya $imageType';
  }

  @override
  String get adminMetadataUpload => 'Pakia';

  @override
  String get adminMetadataUpdate => 'Sasisha';

  @override
  String get adminMetadataRemoteImage => 'Picha ya mbali';

  @override
  String get adminPluginsInstalled => 'Imesakinishwa';

  @override
  String get adminPluginsCatalog => 'Katalogi';

  @override
  String get adminPluginsActive => 'Inayotumika';

  @override
  String get adminPluginsRestart => 'Anzisha upya';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Hakuna programu-jalizi zinazolingana na utafutaji wako';

  @override
  String get adminPluginsNoneInstalled =>
      'Hakuna programu-jalizi zilizosakinishwa';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Sasisho linapatikana: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Sasisho linapatikana';

  @override
  String get adminPluginsPendingRemoval =>
      'Inasubiri kuondolewa baada ya kuanza upya';

  @override
  String get adminPluginsChangesPending =>
      'Mabadiliko yanasubiri kuanzishwa upya';

  @override
  String get adminPluginsEnable => 'Wezesha';

  @override
  String get adminPluginsDisable => 'Zima';

  @override
  String get adminPluginsInstallUpdate => 'Sakinisha sasisho';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Sakinisha sasisho (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Hakuna vifurushi vinavyolingana na utafutaji wako';

  @override
  String get adminPluginsCatalogEmpty => 'Hakuna vifurushi vinavyopatikana';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" inasakinishwa...';
  }

  @override
  String get adminPluginDetailExperimental => 'Ujumuishaji wa Majaribio';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Muunganisho wa mipangilio ya programu-jalizi bado ni wa majaribio. Baadhi ya sehemu au miundo huenda isitoe ipasavyo bado.';

  @override
  String get adminPluginDetailToggle404 =>
      'Imeshindwa kugeuza programu-jalizi. Seva haikuweza kupata toleo hili la programu-jalizi. Jaribu kuonyesha upya programu-jalizi, kisha ujaribu tena.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Imeshindwa kugeuza programu-jalizi. Tafadhali angalia kumbukumbu za seva kwa maelezo.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Mipangilio ya $name';
  }

  @override
  String get adminPluginDetailDetails => 'Maelezo';

  @override
  String get adminPluginDetailDeveloper => 'Msanidi';

  @override
  String get adminPluginDetailRepository => 'Hifadhi';

  @override
  String get adminPluginDetailBundled => 'Imeunganishwa';

  @override
  String get adminPluginDetailEnablePlugin => 'Washa Programu-jalizi';

  @override
  String get adminPluginDetailRestartRequired =>
      'Kuanzisha upya seva kunahitajika ili mabadiliko yaanze kutumika.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Programu-jalizi hii itaondolewa baada ya seva kuwasha upya.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Programu-jalizi hii imeharibika na huenda isifanye kazi ipasavyo.';

  @override
  String get adminPluginDetailNotSupported =>
      'Programu-jalizi hii haitumiki na toleo la sasa la seva.';

  @override
  String get adminPluginDetailSuperseded =>
      'Programu-jalizi hii imebadilishwa na toleo jipya zaidi.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Imeshindwa kupakia hazina: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Ondoa Hifadhi';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Una uhakika unataka kuondoa \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Ondoa';

  @override
  String adminReposSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi hazina: $error';
  }

  @override
  String get adminReposEmpty => 'Hakuna hazina zilizosanidiwa';

  @override
  String get adminReposEmptySubtitle =>
      'Ongeza hazina ili kuvinjari programu-jalizi zinazopatikana';

  @override
  String get adminReposUnnamed => '(bila jina)';

  @override
  String get adminReposEditTitle => 'Hariri Hifadhi';

  @override
  String get adminReposAddTitle => 'Ongeza Hifadhi';

  @override
  String get adminReposUrl => 'URL ya hifadhi';

  @override
  String get adminReposNameHint => 'k.m. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL batili';

  @override
  String get adminGeneralSettingsTitle => 'Mipangilio ya Jumla';

  @override
  String get adminGeneralMetadataLanguage =>
      'Lugha ya metadata inayopendekezwa';

  @override
  String get adminGeneralMetadataLanguageHint => 'k.m. sw, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Nchi ya metadata inayopendelewa';

  @override
  String get adminGeneralMetadataCountryHint => 'k.m. Marekani, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Uchanganuzi wa sarafu ya maktaba';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Kikomo cha usimbaji wa picha sambamba';

  @override
  String get adminUnknownError => 'Hitilafu isiyojulikana';

  @override
  String get adminBrowse => 'Vinjari';

  @override
  String get adminCloseBrowser => 'Funga kivinjari';

  @override
  String get adminNetworkingTitle => 'Mtandao';

  @override
  String get adminNetworkingRestartWarning =>
      'Mabadiliko ya mipangilio ya mtandao yanaweza kuhitaji kuanzisha upya seva.';

  @override
  String get adminNetworkingEnableHttps => 'Washa HTTPS';

  @override
  String get adminNetworkingAddressHint => 'k.m. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Wawakilishi wanaojulikana';

  @override
  String get adminNetworkingProxyHint => 'k.m. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Orodha iliyoidhinishwa';

  @override
  String get adminNetworkingBlacklist => 'Orodha nyeusi';

  @override
  String get adminNetworkingAddEntry => 'Ongeza kiingilio';

  @override
  String get adminBrandingTitle => 'Kuweka chapa';

  @override
  String get adminBrandingLoginDisclaimer => 'Kanusho la kuingia';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML iliyoonyeshwa chini ya fomu ya kuingia';

  @override
  String get adminBrandingCustomCss => 'CSS maalum';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS maalum inatumika kwenye kiolesura cha wavuti';

  @override
  String get adminBrandingEnableSplash => 'Washa skrini ya Splash';

  @override
  String get adminBrandingSplashUpload => 'Pakia picha';

  @override
  String get adminBrandingSplashUploaded => 'Skrini ya utangulizi imesasishwa';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Imeshindwa kupakia skrini ya utangulizi';

  @override
  String get adminBrandingSplashDeleted => 'Skrini ya utangulizi imeondolewa';

  @override
  String get adminBrandingNoSplash => 'Hakuna skrini maalum ya utangulizi';

  @override
  String get adminPlaybackHwAccel => 'Kuongeza kasi ya vifaa';

  @override
  String get adminPlaybackHwAccelLabel => 'Kuongeza kasi ya vifaa';

  @override
  String get adminPlaybackEnableHwEncoding => 'Washa usimbaji maunzi';

  @override
  String get adminPlaybackQsvDevice => 'Kifaa cha QSV';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Washa kisimbuzi cha NVDEC kilichoboreshwa';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Pendelea kisimbuzi asili cha maunzi cha mfumo';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Usimbuaji wa HEVC wa biti 10';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Usimbuaji wa VP9 wa biti 10';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Usimbuaji wa HEVC RExt wa biti 8/10';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Usimbuaji wa HEVC RExt wa biti 12';

  @override
  String get adminPlaybackHwEncodingSection => 'Usimbaji wa maunzi';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Ruhusu usimbaji wa HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Ruhusu usimbaji wa AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Washa kisimbaji cha Intel cha nguvu ndogo cha H.264';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Washa kisimbaji cha Intel cha nguvu ndogo cha HEVC';

  @override
  String get adminPlaybackToneMapping => 'Uchoraji wa Toni';

  @override
  String get adminPlaybackEnableTonemapping => 'Washa uchoraji wa toni';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Washa uchoraji wa toni wa VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Washa uchoraji wa toni wa VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Algoriti ya uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingMode => 'Modi ya uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingRange => 'Masafa ya uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Upunguzaji wa ukolezi wa uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingPeak => 'Kilele cha uchoraji wa toni';

  @override
  String get adminPlaybackTonemappingParam => 'Kigezo cha uchoraji wa toni';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Mwangaza wa uchoraji wa toni wa VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Utofautishaji wa uchoraji wa toni wa VPP';

  @override
  String get adminPlaybackEncoderPreset => 'Mpangilio wa awali wa kisimbaji';

  @override
  String get adminPlaybackH264Crf => 'CRF ya usimbaji wa H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF ya usimbaji wa H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Mbinu ya kuondoa mwingiliano';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Maradufu kasi ya fremu wakati wa kuondoa mwingiliano';

  @override
  String get adminPlaybackAudioSection => 'Sauti';

  @override
  String get adminPlaybackEnableAudioVbr => 'Washa usimbaji wa VBR wa sauti';

  @override
  String get adminPlaybackDownmixBoost =>
      'Nyongeza ya upunguzaji wa chaneli za sauti';

  @override
  String get adminPlaybackDownmixAlgorithm =>
      'Algoriti ya upunguzaji hadi stereo';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Ukubwa wa juu wa foleni ya muxing';

  @override
  String get adminPlaybackAutoOption => 'Otomatiki';

  @override
  String get adminPlaybackEncoding => 'Usimbaji';

  @override
  String get adminPlaybackEncodingThreads => 'Usimbaji nyuzi';

  @override
  String get adminPlaybackFallbackFont => 'Washa fonti mbadala';

  @override
  String get adminPlaybackFallbackFontPath => 'Njia ya fonti ya kurudi nyuma';

  @override
  String get adminPlaybackStreaming => 'Kutiririsha';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Vitabu vya sauti';

  @override
  String get adminStreamingBitrateLimit =>
      'Kikomo cha kasi ya biti ya mteja wa mbali (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'Acha tupu au 0 kwa ukomo';

  @override
  String get adminTrickplayHwAccel => 'Washa kuongeza kasi ya maunzi';

  @override
  String get adminTrickplayHwEncoding => 'Washa usimbaji maunzi';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Washa uchimbaji wa fremu muhimu pekee';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Usahihi wa haraka lakini wa chini';

  @override
  String get adminTrickplayNonBlocking => 'Isiyo ya Kuzuia';

  @override
  String get adminTrickplayBlocking => 'Kuzuia';

  @override
  String get adminTrickplayPriorityHigh => 'Juu';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Juu ya Kawaida';

  @override
  String get adminTrickplayPriorityNormal => 'Kawaida';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Chini ya Kawaida';

  @override
  String get adminTrickplayPriorityIdle => 'Bila kufanya kitu';

  @override
  String get adminTrickplayImageSettings => 'Mipangilio ya Picha';

  @override
  String get adminTrickplayInterval => 'Muda (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Ni mara ngapi kunasa fremu';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Upana wa pikseli uliotenganishwa kwa koma (k.m. 320)';

  @override
  String get adminTrickplayQuality => 'Ubora';

  @override
  String get adminTrickplayQScale => 'Kiwango cha ubora';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Thamani za chini = ubora bora, faili kubwa';

  @override
  String get adminTrickplayJpegQuality => 'Ubora wa JPEG';

  @override
  String get adminTrickplayProcessing => 'Inachakata';

  @override
  String get adminTasksEmpty => 'Hakuna kazi zilizoratibiwa kupatikana';

  @override
  String get adminTasksNoFilterMatch =>
      'Hakuna kazi zinazolingana na kichujio cha sasa';

  @override
  String get adminTaskCancelling => 'Inaghairi...';

  @override
  String get adminTaskRunning => 'Inakimbia...';

  @override
  String get adminTaskNeverRun => 'Usiwahi kukimbia';

  @override
  String get adminTaskStop => 'Simamisha';

  @override
  String get adminRunningTasks => 'Kazi Zinazoendelea';

  @override
  String get adminTaskRun => 'Kimbia';

  @override
  String get adminTaskDetailLastExecution => 'Utekelezaji wa Mwisho';

  @override
  String get adminTaskDetailStarted => 'Imeanza';

  @override
  String get adminTaskDetailEnded => 'Imeisha';

  @override
  String get adminTaskDetailDuration => 'Muda';

  @override
  String get adminTaskDetailErrorLabel => 'Hitilafu:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Kila siku saa $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Kila $day saa $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Wakati wa kuanza maombi';

  @override
  String get adminTaskTriggerTypeDaily => 'Kila siku';

  @override
  String get adminTaskTriggerTypeWeekly => 'Kila wiki';

  @override
  String get adminTaskTriggerTypeInterval => 'Kwa muda';

  @override
  String get adminTaskTriggerIntervalLabel => 'Muda';

  @override
  String get adminTaskTriggerEveryHour => 'Kila saa';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'saa $count',
      one: 'saa 1',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Muda';

  @override
  String get adminActivityJustNow => 'Sasa hivi';

  @override
  String get adminActivityLastHour => 'Saa iliyopita';

  @override
  String get adminActivityToday => 'Leo';

  @override
  String get adminActivityYesterday => 'Jana';

  @override
  String get adminActivityOlder => 'Mzee';

  @override
  String adminActivityDaysAgo(int days) {
    return 'siku $days zilizopita';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'saa $hours zilizopita';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'dk $minutes zilizopita';
  }

  @override
  String get adminActivityNow => 'sasa';

  @override
  String adminActivityMinutesShort(int minutes) {
    return 'dk $minutes';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return 'saa $hours';
  }

  @override
  String adminActivityDaysShort(int days) {
    return 'siku $days';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Sanidi utengenezaji wa picha za Trickplay kwa vijipicha vya onyesho la kutafuta.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Mlango wa HTTPS wa umma';

  @override
  String get adminNetworkingBaseUrl => 'URL ya msingi';

  @override
  String get adminNetworkingBaseUrlHint => 'k.m. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Mlango wa umma wa HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Hitaji HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Elekeza maombi yote ya mbali kwa HTTPS. Haina athari ikiwa seva haina cheti halali.';

  @override
  String get adminNetworkingCertPassword => 'Nenosiri la cheti';

  @override
  String get adminNetworkingEnableIpv4 => 'Washa IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Washa IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'Mitandao ya LAN';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Kichujio cha IP cha mbali';

  @override
  String get adminPlaybackVaapiDevice => 'Kifaa cha VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = moja kwa moja';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Njia ya joto ya kubadilisha msimbo';

  @override
  String get adminPlaybackSegmentDeletion => 'Ruhusu kufutwa kwa sehemu';

  @override
  String get adminPlaybackSegmentKeep => 'Weka sehemu (sekunde)';

  @override
  String get adminPlaybackThrottleBuffering => 'Kuakibisha kaba';

  @override
  String get adminPlaybackThrottleDelay =>
      'Ucheleweshaji wa kupunguza kasi (sekunde)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Ruhusu utoaji wa manukuu papo hapo';

  @override
  String get adminResumeMinPct => 'Asilimia ya chini ya wasifu';

  @override
  String get adminResumeMinPctSubtitle =>
      'Ni lazima maudhui yachezwe kupita asilimia hii ili kuokoa maendeleo';

  @override
  String get adminResumeMaxPct => 'Asilimia ya juu zaidi ya wasifu';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Maudhui yanazingatiwa kuchezwa kikamilifu baada ya asilimia hii';

  @override
  String get adminResumeMinDuration => 'Muda wa chini wa kuendelea (sekunde)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Vipengee vifupi kuliko hivi havitumiki tena';

  @override
  String get adminTrickplayScanBehavior => 'Skena tabia';

  @override
  String get adminTrickplayProcessPriority => 'Kipaumbele cha mchakato';

  @override
  String get adminTrickplayTileWidth => 'Upana wa tile';

  @override
  String get adminTrickplayTileHeight => 'Urefu wa tile';

  @override
  String get adminTrickplayProcessThreads => 'Mchakato wa nyuzi';

  @override
  String get adminTrickplayWidthResolutions => 'Maamuzi ya upana';

  @override
  String get adminMetadataDefault => 'Chaguomsingi';

  @override
  String get adminMetadataContentTypeUpdated => 'Aina ya maudhui imesasishwa';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Imeshindwa kusasisha aina ya maudhui: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Kiwango cha chini cha majibu (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Washa maonyo ya majibu ya polepole';

  @override
  String get adminGeneralQuickConnect => 'Washa Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Seva';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Njia';

  @override
  String get adminGeneralSectionPerformance => 'Utendaji';

  @override
  String get adminGeneralCachePath => 'Njia ya akiba';

  @override
  String get adminGeneralMetadataPath => 'Njia ya metadata';

  @override
  String get adminGeneralServerName => 'Jina la seva';

  @override
  String get adminGeneralDisplayLanguage => 'Lugha inayopendelewa ya kuonyesha';

  @override
  String get adminSettingsLoadFailed => 'Imeshindwa kupakia mipangilio';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Imeshindwa kusasisha ulinganishaji: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Kikomo cha muda: $duration';
  }

  @override
  String get folders => 'Folda';

  @override
  String get libraries => 'Maktaba';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay imezimwa';

  @override
  String get syncPlayDisabledMessage =>
      'Washa SyncPlay katika Mipangilio ili kutumia uchezaji uliosawazishwa.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Seva haitumiki';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay inahitaji seva ya Jellyfin. Seva ya sasa haiauni.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Kikundi';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay kikundi';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'washiriki #',
      one: 'mshiriki #',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Puuza kusubiri';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Usisimamishe kikundi wakati kifaa hiki kinaakibishwa';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Endelea ndani ya nchi bila kusubiri wanachama wa polepole';

  @override
  String get syncPlayRepeat => 'Rudia';

  @override
  String get syncPlayRepeatOne => 'Moja';

  @override
  String get syncPlayShuffleModeShuffled => 'Imechanganyikiwa';

  @override
  String get syncPlayShuffleModeSorted => 'Imepangwa';

  @override
  String get syncPlaySyncCurrentQueue => 'Sawazisha foleni ya kucheza ya sasa';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Badilisha foleni ya kikundi na kile kinachocheza ndani ya nchi';

  @override
  String get syncPlayLeaveGroup => 'Ondoka kwenye kikundi';

  @override
  String get syncPlayGroupQueue => 'Foleni ya kikundi';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Kipengee $index';
  }

  @override
  String get syncPlayPlayNow => 'Cheza sasa';

  @override
  String get syncPlayCreateNewGroup => 'Unda kikundi kipya';

  @override
  String get syncPlayGroupName => 'Jina la kikundi';

  @override
  String get syncPlayDefaultGroupName => 'Kikundi changu cha SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Unda kikundi';

  @override
  String get syncPlayAvailableGroups => 'Vikundi vinavyopatikana';

  @override
  String get syncPlayNoGroupsAvailable => 'Hakuna vikundi vinavyopatikana';

  @override
  String get syncPlayJoinGroupQuestion =>
      'Je, ungependa kujiunga na kikundi cha SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Kujiunga na kikundi cha SyncPlay kunaweza kuchukua nafasi ya foleni yako ya uchezaji ya sasa. Ungependa kuendelea?';

  @override
  String get syncPlayJoin => 'Jiunge';

  @override
  String get syncPlayStateIdle => 'Bila kufanya kitu';

  @override
  String get syncPlayStateWaiting => 'Kusubiri';

  @override
  String get syncPlayStatePaused => 'Imesitishwa';

  @override
  String get syncPlayStatePlaying => 'Inacheza';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName amejiunga na kikundi cha SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName ameondoka kwenye kikundi cha SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Ufikiaji wa SyncPlay umekataliwa';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Huna ufikiaji wa kipengee kimoja au zaidi katika kikundi hiki cha SyncPlay. Uliza mmiliki wa kikundi athibitishe ruhusa za maktaba au achague foleni tofauti.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Inasawazisha uchezaji na $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Utafutaji wa sauti haupatikani.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Kucheza kwa Moja kwa Moja kwa Dolby Vision Imeshindwa';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Uchezaji wa moja kwa moja umeshindwa kuanza kwa mtiririko huu wa Dolby Vision. Ungependa kujaribu tena kutumia msimbo wa kusambaza seva?';

  @override
  String get retryWithTranscode => 'Jaribu tena kwa kutumia msimbo';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Haitumiki';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Kifaa hiki hakiwezi kusimbua maudhui ya Dolby Vision moja kwa moja. Tumia njia mbadala ya HDR10 au uombe upitishaji wa msimbo wa seva.';

  @override
  String get rememberMyChoice => 'Kumbuka chaguo langu';

  @override
  String get playHdr10Fallback => 'Cheza njia mbadala ya HDR10';

  @override
  String get requestTranscode => 'Omba transcode';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'safu # zimegunduliwa',
      one: 'safu # imegunduliwa',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Tazama Yote';

  @override
  String get noItems => 'Hakuna vitu';

  @override
  String get switchUser => 'Badilisha Mtumiaji';

  @override
  String get remoteControl => 'Udhibiti wa Kijijini';

  @override
  String get mediaBarLoading => 'Inapakia upau wa midia...';

  @override
  String get mediaBarError => 'Upau wa midia imeshindwa kupakia';

  @override
  String get offlineServerUnavailable =>
      'Imeunganishwa kwenye mtandao, lakini seva ya sasa haipatikani.';

  @override
  String get offlineNoInternet =>
      'Hauko mtandaoni. Maudhui yaliyopakuliwa pekee yanapatikana.';

  @override
  String get offlineFileNotAvailable => 'Faili haipatikani';

  @override
  String get offlineSwitchServer => 'Badilisha Seva';

  @override
  String get offlineSavedMedia => 'Media Iliyohifadhiwa';

  @override
  String get offlineBannerTitle => 'Uko nje ya mtandao';

  @override
  String get offlineBannerSubtitle => 'Inaonyesha vipakuliwa vyako';

  @override
  String get serverUnreachableBannerTitle => 'Haiwezi kufikia seva yako';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Inacheza kutoka kwa vipakuliwa hadi itakaporejea';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Uchezaji wa Mbali';

  @override
  String castControlFailed(String error) {
    return 'Udhibiti wa utumaji umeshindwa: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Vidhibiti vya $kind';
  }

  @override
  String get castDeviceVolume => 'Kiasi cha Kifaa';

  @override
  String get castVolumeUnavailable => 'Haipatikani';

  @override
  String castStopKind(String kind) {
    return 'Simamisha $kind';
  }

  @override
  String get audioLabel => 'Sauti';

  @override
  String get subtitlesLabel => 'Manukuu';

  @override
  String get pinConfirmTitle => 'Thibitisha PIN';

  @override
  String get pinSetTitle => 'Weka PIN';

  @override
  String get pinEnterTitle => 'Weka PIN';

  @override
  String get pinReenterToConfirm => 'Weka tena PIN yako ili kuthibitisha';

  @override
  String pinEnterNDigit(int length) {
    return 'Weka PIN ya tarakimu $length';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Weka PIN yako ya tarakimu $length';
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
  String get pinIncorrect => 'PIN si sahihi';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN hazilingani';

  @override
  String get pinForgot => 'Je, umesahau PIN?';

  @override
  String get pinClear => 'Futa';

  @override
  String get pinBackspace => 'Futa nyuma';

  @override
  String get quickConnectAuthorized => 'Ombi la Quick Connect limeidhinishwa.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Msimbo wa Quick Connect ni batili au muda wake umeisha.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect haitumiki kwenye seva hii.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Imeshindwa kuidhinisha msimbo wa Quick Connect.';

  @override
  String get quickConnectDisabled => 'Quick Connect imezimwa kwenye seva hii.';

  @override
  String get quickConnectForbidden =>
      'Akaunti yako haiwezi kuidhinisha ombi hili la Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Msimbo wa Quick Connect haukupatikana. Jaribu nambari mpya ya kuthibitisha.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect imeshindwa: $message';
  }

  @override
  String get quickConnectEnterCode => 'Weka msimbo';

  @override
  String get quickConnectAuthorize => 'Kuidhinisha';

  @override
  String remoteCommandFailed(String error) {
    return 'Amri imeshindwa: $error';
  }

  @override
  String get remoteControlTitle => 'Udhibiti wa Kijijini';

  @override
  String get remoteFailedToLoadSessions => 'Imeshindwa kupakia vipindi';

  @override
  String get remoteNoSessions => 'Hakuna vipindi vinavyoweza kudhibitiwa';

  @override
  String get remoteStartPlayback => 'Anza kucheza kwenye kifaa kingine';

  @override
  String get unknownUser => 'Haijulikani';

  @override
  String get unknownItem => 'Haijulikani';

  @override
  String get remoteNothingPlaying => 'Hakuna kinachocheza kwenye kipindi hiki';

  @override
  String get castingStarted => 'Utumaji umeanza kwenye kifaa ulichochagua';

  @override
  String castingFailed(String error) {
    return 'Imeshindwa kuanza kutuma: $error';
  }

  @override
  String get noRemoteDevices =>
      'Hakuna vifaa vya kucheza kwa mbali vinavyopatikana.';

  @override
  String get noRemoteDevicesIos =>
      'Hakuna vifaa vya kucheza kwa mbali vinavyopatikana.\n\nKwenye iOS, malengo ya AirPlay yanaweza yasipatikane kwenye kiigaji.';

  @override
  String get trackActionPlayNext => 'Cheza Inayofuata';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Ongeza kwenye Foleni';

  @override
  String get trackActionAddToPlaylist => 'Ongeza kwenye Orodha ya kucheza';

  @override
  String get trackActionCancelDownload => 'Ghairi Upakuaji';

  @override
  String get trackActionDeleteFromPlaylist => 'Futa kwenye Orodha ya kucheza';

  @override
  String get trackActionMoveUp => 'Sogeza Juu';

  @override
  String get trackActionMoveDown => 'Sogeza Chini';

  @override
  String get trackActionRemoveFromFavorites => 'Ondoa kutoka kwa Vipendwa';

  @override
  String get trackActionAddToFavorites => 'Ongeza kwa Vipendwa';

  @override
  String get trackActionGoToAlbum => 'Nenda kwa Albamu';

  @override
  String get trackActionGoToArtist => 'Nenda kwa Msanii';

  @override
  String trackActionDownloading(String name) {
    return 'Inapakua $name...';
  }

  @override
  String get trackActionDeletedFile => 'Faili iliyopakuliwa imefutwa';

  @override
  String get trackActionDeleteFileFailed =>
      'Haikuweza kufuta faili iliyopakuliwa';

  @override
  String get shuffleBy => 'Changanya Kwa';

  @override
  String get shuffleSelectLibrary => 'Chagua Maktaba';

  @override
  String get shuffleSelectGenre => 'Chagua Aina';

  @override
  String get shuffleLibrary => 'Maktaba';

  @override
  String get shuffleGenre => 'Aina';

  @override
  String get shuffleNoLibraries => 'Hakuna maktaba sambamba zinazopatikana.';

  @override
  String get shuffleNoGenres =>
      'Hakuna aina zilizopatikana kwa modi hii ya kuchanganua.';

  @override
  String get posterDisplayTitle => 'Onyesho';

  @override
  String get posterImageType => 'Aina ya Picha';

  @override
  String get imageTypePoster => 'Bango';

  @override
  String get imageTypeThumbnail => 'Kijipicha';

  @override
  String get imageTypeBanner => 'Bango';

  @override
  String get playlistAddFailed =>
      'Imeshindwa kuongeza kwenye orodha ya kucheza';

  @override
  String get playlistCreateFailed => 'Imeshindwa kuunda orodha ya kucheza';

  @override
  String get playlistNew => 'Orodha Mpya ya Kucheza';

  @override
  String get playlistCreate => 'Unda';

  @override
  String get playlistCreateNew => 'Unda Orodha Mpya ya Kucheza';

  @override
  String get playlistNoneFound => 'Hakuna orodha za kucheza zilizopatikana';

  @override
  String get addToPlaylist => 'Ongeza kwenye Orodha ya kucheza';

  @override
  String get lyricsNotAvailable => 'Hakuna maneno yanayopatikana';

  @override
  String get upNext => 'Juu Inayofuata';

  @override
  String get playNext => 'Cheza Inayofuata';

  @override
  String get stillWatchingContent =>
      'Uchezaji umesitishwa. Je, bado unatazama?';

  @override
  String get stillWatchingStop => 'Simamisha';

  @override
  String get stillWatchingContinue => 'Endelea';

  @override
  String skipSegment(String segment) {
    return 'Ruka $segment';
  }

  @override
  String get liveTv => 'TV ya moja kwa moja';

  @override
  String get continueWatchingAndNextUp => 'Endelea Kutazama & Inayofuata';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Inapakua $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Inapakua $fileName';
  }

  @override
  String get nextEpisode => 'Kipindi Kinachofuata';

  @override
  String get moreFromThisSeason => 'Zaidi Kutoka Msimu Huu';

  @override
  String get playerTooltipPlaybackSpeed => 'Kasi ya uchezaji';

  @override
  String get playerTooltipCastControls => 'Vidhibiti vya kutuma';

  @override
  String get playerTooltipPlaybackQuality => 'Kasi ya biti';

  @override
  String get playerTooltipEnterFullscreen => 'Ingiza skrini nzima';

  @override
  String get playerTooltipExitFullscreen => 'Ondoka kwenye skrini nzima';

  @override
  String get playerTooltipFloatOnTop => 'Kuelea juu';

  @override
  String get playerTooltipExitFloatOnTop => 'Lemaza kuelea juu';

  @override
  String get playerTooltipLockLandscape => 'Funga mandhari';

  @override
  String get playerTooltipUnlockOrientation => 'Ruhusu mzunguko';

  @override
  String get playerTooltipPrevious => 'Iliyotangulia';

  @override
  String get playerTooltipSeekBack => 'Tafuta nyuma';

  @override
  String get playerTooltipSeekForward => 'Tafuta mbele';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Weka alama kama Imetazamwa';

  @override
  String get contextMenuMarkUnwatched => 'Weka alama kuwa haijatazamwa';

  @override
  String get contextMenuAddToFavorites => 'Ongeza kwa Vipendwa';

  @override
  String get contextMenuRemoveFromFavorites => 'Ondoa kutoka kwa Vipendwa';

  @override
  String get contextMenuGoToSeries => 'Nenda kwenye Series';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Ficha kutoka Endelea Kutazama';

  @override
  String get contextMenuHideFromNextUp => 'Ficha kutoka Inayofuata';

  @override
  String get contextMenuAddToCollection => 'Ongeza kwenye Mkusanyo';

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
      'Fikia paneli ya usimamizi wa seva';

  @override
  String get settingsDynamicContent => 'Maudhui Yanayobadilika';

  @override
  String get settingsDynamicContentSubtitle =>
      'Upau wa Midia na viwekeleo vya kuona';

  @override
  String get settingsAboutSubtitle =>
      'Toleo la programu, maelezo ya kisheria na mikopo';

  @override
  String get settingsSortServersBy => 'Panga Seva Kwa';

  @override
  String get settingsLastUsed => 'Iliyotumika Mwisho';

  @override
  String get settingsAlphabetical => 'Kialfabeti';

  @override
  String get settingsAllowSelfSignedCerts => 'Ruhusu vyeti vilivyojitia saini';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Amini seva zinazotumia vyeti vya TLS vilivyojitia saini au vya CA binafsi. Washa kwa seva unazodhibiti pekee. Hii huzima uthibitishaji wa vyeti kwa miunganisho yote.';

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
  String get settingsHomePage => 'Ukurasa wa Nyumbani';

  @override
  String get settingsTwentyFourHourClock => 'Saa ya Saa 24';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Tumia uumbizaji wa muda wa saa 24 popote saa inapoonyeshwa';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Onyesha kitufe cha kuchanganya kwenye upau wa kusogeza';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Onyesha kitufe cha aina kwenye upau wa kusogeza';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Onyesha kitufe cha vipendwa kwenye upau wa kusogeza';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Onyesha kitufe cha maktaba kwenye upau wa kusogeza';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Onyesha kitufe cha Seerr kwenye upau wa urambazaji';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Onyesha lebo za maandishi kwenye upau wa juu wa urambazaji kila wakati';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Geuza mwonekano wa ukurasa wa nyumbani kwa kila maktaba. Anzisha tena Moonfin ili mabadiliko yaanze kutumika.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Upau wa Midia na Uhakiki wa Karibu Nawe';

  @override
  String get settingsVisualOverlays => 'Viwekeleo vya Kuonekana';

  @override
  String get settingsSeasonalSurprise => 'Mshangao wa Msimu';

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
  String get settingsHigh => 'Juu';

  @override
  String get settingsLow => 'Chini';

  @override
  String get settingsCustomPath => 'Njia Maalum';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Ingiza njia ya folda ya kupakua';

  @override
  String get settingsConcurrentDownloads => 'Vipakuliwa kwa Pamoja';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Idadi ya juu zaidi ya vipengee vya kupakua mara moja.';

  @override
  String get settingsAppInfo => 'MAELEZO YA APP';

  @override
  String get settingsReportAnIssue => 'Ripoti Tatizo';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Fungua tracker ya suala kwenye GitHub';

  @override
  String get settingsJoinDiscord => 'Jiunge na Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Piga gumzo na jumuiya';

  @override
  String get settingsJoinTheDiscord => 'Jiunge na Discord';

  @override
  String get settingsSupportMoonfin => 'Msaada Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Mchangie msanidi kahawa';

  @override
  String get settingsLegal => 'KISHERIA';

  @override
  String get settingsLicenses => 'Leseni';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Notisi za leseni ya chanzo huria';

  @override
  String get settingsPrivacyPolicy => 'Sera ya Faragha';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Jinsi Moonfin hushughulikia data yako';

  @override
  String get settingsCheckForUpdates => 'Angalia Usasisho';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Angalia toleo jipya zaidi la Moonfin';

  @override
  String get settingsBoth => 'Zote mbili';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Changanya Kichujio cha Aina ya Maudhui';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Nyimbo za sauti, kuchakata na chaguzi za upitishaji';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Uchezaji na mpangilio wa kiotomatiki';

  @override
  String get settingsSyncplaySubtitle =>
      'Mantiki ya ulandanishi kwa vikao vya kikundi';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Ungependa Kuruka Utambulisho na Outros?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown =>
      'Hesabu ya Kurudi Nyuma ya Sehemu ya Maudhui';

  @override
  String get settingsProgressBar => 'Upau wa Maendeleo';

  @override
  String get settingsTimer => 'Kipima Muda';

  @override
  String get settingsNone => 'Hakuna';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Mtumiaji wa haraka';

  @override
  String get settingsSkip => 'Ruka';

  @override
  String get settingsDoNothing => 'Usifanye Chochote';

  @override
  String get settingsMaxBitrateDescription =>
      'Zuia kasi ya utiririshaji. Maudhui yaliyo juu ya kiwango hiki yatabadilishwa ili yatoshee.';

  @override
  String get settingsMaxResolutionDescription =>
      'Weka kiwango cha juu cha azimio ambacho mchezaji ataomba. Maudhui ya ubora wa juu yatapitishwa chini.';

  @override
  String get settingsPlayerZoomDescription =>
      'Jinsi video inapaswa kuongezwa ili kutoshea skrini.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Injini ya Uchezaji (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Chagua injini chaguo-msingi ya kucheza kwenye vifaa vya Android TV. Mabadiliko yatatumika kwa kipindi kijacho cha kucheza tena.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (inapendekezwa)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (urithi)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision Njia mbadala';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Tabia ya mada za Dolby Vision kwenye vifaa visivyo na usimbaji wa Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Uliza kila wakati';

  @override
  String get settingsPreferHdr10Fallback => 'Pendelea njia mbadala ya HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Pendelea msimbo wa kupitisha seva';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Wasifu 7 Uchezaji wa Moja kwa Moja';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Hudhibiti ikiwa mitiririko ya safu 7 ya uboreshaji wa wasifu wa Dolby Vision inapaswa kuelekeza kucheza.';

  @override
  String get settingsAutoAftkrtEnabled => 'Otomatiki (AFTKRT imewezeshwa)';

  @override
  String get settingsEnabledOnThisDevice => 'Imewashwa kwenye kifaa hiki';

  @override
  String get settingsDisabledPreferTranscode => 'Imezimwa (pendelea transcode)';

  @override
  String get settingsResumeRewindDescription =>
      'Unaporejesha uchezaji (kutoka Endelea Kutazama au ukurasa wa kipengee cha maudhui), ni sekunde ngapi zinapaswa kurejeshwa?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Unapoanza kucheza tena baada ya kubofya kitufe cha kusitisha, ni sekunde ngapi zinapaswa kurejeshwa?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Sekunde ngapi za kuruka nyuma baada ya kubonyeza kitufe cha kurejesha nyuma.';

  @override
  String get settingsOneSecond => 'Sekunde 1';

  @override
  String get settingsThreeSeconds => '3 sekunde';

  @override
  String get settingsFortyFiveSeconds => 'Sekunde 45';

  @override
  String get settingsSixtySeconds => 'Sekunde 60';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Sekunde ngapi za kuruka mbele baada ya kubonyeza kitufe cha kusonga mbele kwa haraka.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 hadi avkodare ya nje';

  @override
  String get settingsCinemaMode => 'Njia ya Sinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Cheza vionjo/vionjo kabla ya kipengele kikuu';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Iliyopanuliwa inaonyesha kadi kamili iliyo na mchoro wa kipindi na maelezo. Ndogo inaonyesha kuwekelea kwa kuhesabu kurudi nyuma. Imezimwa huficha kidokezo kabisa.';

  @override
  String get settingsShort => 'Mfupi';

  @override
  String get settingsLong => 'Muda mrefu';

  @override
  String get settingsVeryLong => 'Mrefu Sana';

  @override
  String get settingsVideoStartDelay => 'Kuchelewa Kuanza kwa Video';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV ya moja kwa moja';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Washa uchezaji wa moja kwa moja kwa Live TV';

  @override
  String get settingsOpenGroups => 'Fungua Vikundi';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Unda, jiunge au udhibiti vikundi vya SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Imewashwa';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Washa vipengele vya kutazama kikundi';

  @override
  String get settingsSyncplayButton => 'Kitufe cha SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Onyesha kitufe cha SyncPlay kwenye upau wa kusogeza';

  @override
  String get settingsSyncplayAdvancedCorrection =>
      'Urekebishaji wa hali ya juu';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Washa mantiki ya usawazishaji iliyoboreshwa';

  @override
  String get settingsSyncplaySyncCorrection => 'Usahihishaji wa Usawazishaji';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Rekebisha uchezaji kiotomatiki ili uendelee kusawazisha';

  @override
  String get settingsSyncplaySpeedToSync => 'Kasi ya Kusawazisha';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Tumia marekebisho ya kasi ya uchezaji kusawazisha';

  @override
  String get settingsSyncplaySkipToSync => 'Ruka hadi Usawazishaji';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => 'Tumia kutafuta kusawazisha';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Kiwango cha Chini cha Kuchelewa kwa Kasi';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Ucheleweshaji wa Kasi ya Juu';

  @override
  String get settingsSyncplaySpeedDuration => 'Muda wa Kasi';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Kiwango cha Chini cha Kuchelewa Kuruka';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Upungufu wa Ziada';

  @override
  String get onNow => 'Ipo Sasa';

  @override
  String get collections => 'Mikusanyiko';

  @override
  String get lastPlayed => 'Iliyochezwa Mwisho';

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
    return 'Zilizotolewa Hivi Karibuni katika $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Cheza Kipindi Kinachofuata Kiotomatiki';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Cheza kipindi kinachofuata kiotomatiki kinapopatikana.';

  @override
  String get skipSilenceTitle => 'Ruka ukimya';

  @override
  String get skipSilenceSubtitle =>
      'Ruka kiotomatiki sehemu za sauti zenye ukimya inapotumika na mtiririko.';

  @override
  String get allowExternalAudioEffectsTitle => 'Ruhusu athari za sauti za nje';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Ruhusu programu za kisawazishi na athari (k.m. Wavelet) zijiunganishe na vipindi vya uchezaji vya Media3.';

  @override
  String get disableTunnelingTitle => 'Zima tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Lazimisha uchezaji usio wa tunneling. Ni muhimu kwenye vifaa vyenye mikatizo ya sauti/video ya tunneling.';

  @override
  String get enableTunnelingTitle => 'Washa tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Ya kina. Huelekeza sauti na video kupitia njia ya maunzi iliyounganishwa. Imezimwa kwa chaguo-msingi kwa sababu husababisha mikatizo ya sauti/video kwenye baadhi ya vifaa.';

  @override
  String get mapDolbyVisionP7Title => 'Unganisha Dolby Vision wasifu 7 na HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Cheza mitiririko ya Dolby Vision wasifu 7 kama HEVC inayooana na HDR10 kwenye vifaa visivyo vya DV.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Tumia mitindo ya manukuu iliyopachikwa';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Tumia rangi, fonti, na uwekaji vilivyopachikwa katika mkondo wa manukuu. Zima ili kutumia mapendeleo yako ya mtindo wa manukuu badala yake.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Tumia saizi za fonti za manukuu zilizopachikwa';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Tumia vidokezo vya saizi ya fonti vilivyopachikwa katika mkondo wa manukuu. Zima ili kutumia saizi ya manukuu kutoka kwa mapendeleo yako ya mtindo.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Onyesha Maelezo ya Maudhui';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Onyesha maelezo ya kipengee kilichochaguliwa juu ya kurasa za Maktaba.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Tumia Vichwa Vidogo vya Kina';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Onyesha safu ndogo ya kina au ya kawaida kwenye kurasa za Maktaba.';

  @override
  String get savedThemesDeleteDialogTitle => 'Futa mandhari iliyohifadhiwa?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Ondoa \"$themeName\" kutoka kwa akiba ya kifaa hiki?';
  }

  @override
  String get themeStore => 'Duka la Mandhari';

  @override
  String get themeStoreSubtitle => 'Vinjari na uhifadhi mandhari za jamii';

  @override
  String get themeStoreDescription =>
      'Hifadhi mandhari ili kuitumia kama mandhari zako nyingine zilizohifadhiwa.';

  @override
  String get themeStoreEmpty => 'Hakuna mandhari zinazopatikana kwa sasa.';

  @override
  String get themeStoreLoadFailed =>
      'Imeshindwa kupakia Duka la Mandhari. Angalia muunganisho wako na ujaribu tena.';

  @override
  String get themeStoreSave => 'Hifadhi';

  @override
  String get themeStoreSaveAndApply => 'Hifadhi na utumie';

  @override
  String get themeStoreSaved => 'Imehifadhiwa';

  @override
  String get themeStoreInvalidMessage => 'Mandhari hii haikuweza kupakiwa.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" imehifadhiwa.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" imefutwa kutoka kwa kifaa hiki.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Imeshindwa kufuta \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Mandhari zilizohifadhiwa';

  @override
  String get savedThemesDescription =>
      'Hizi ni mandhari zilizopakuliwa kutoka kwa programu-jalizi ya Moonfin kwa seva ya sasa. Kufuta huondoa nakala hii ya ndani pekee.';

  @override
  String get savedThemesEmpty =>
      'Hakuna mandhari zilizohifadhiwa zilizopatikana kwa seva hii.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Inatumika sasa';
  }

  @override
  String get savedThemesDeleteTooltip => 'Futa mandhari iliyohifadhiwa';

  @override
  String get savedThemesManageSubtitle =>
      'Dhibiti mandhari za programu-jalizi zilizopakuliwa kwenye kifaa hiki';

  @override
  String get themeEditor => 'Kihariri cha Mandhari';

  @override
  String get themeEditorSubtitle =>
      'Fungua Kihariri cha Mandhari cha Moonfin kwenye kivinjari chako';

  @override
  String get homeScreen => 'Skrini ya Nyumbani';

  @override
  String get bottomBar => 'Upau wa Chini';

  @override
  String get homeRowsStyleClassic => 'Klasiki';

  @override
  String get homeRowsStyleModern => 'Kisasa';

  @override
  String get homeRowsSection => 'Safu za Nyumbani';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klasiki huhifadhi aina ya picha ya kila safu na kifuniko cha maelezo. Kisasa hutumia safu za wima hadi mandharinyuma.';

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
  String get displayFavoritesRows => 'Onyesha Safu za Vipendwa';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Onyesha Filamu Vipendwa, Mifululizo, na safu nyingine za vipendwa katika Sehemu za Nyumbani.';

  @override
  String get favoritesRowSorting => 'Upangaji wa Safu za Vipendwa';

  @override
  String get favoritesRowSortingDescription =>
      'Panga safu za Vipendwa kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Onyesha Safu za Makusanyo';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Onyesha safu za Makusanyo katika Sehemu za Nyumbani.';

  @override
  String get collectionsRowSorting => 'Upangaji wa Safu za Makusanyo';

  @override
  String get collectionsRowSortingDescription =>
      'Panga safu za Makusanyo kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Onyesha Safu za Aina';

  @override
  String get displayGenresRowsSubtitle =>
      'Onyesha safu za Aina katika Sehemu za Nyumbani.';

  @override
  String get genresRowSorting => 'Upangaji wa Safu za Aina';

  @override
  String get genresRowSortingDescription =>
      'Panga safu za Aina kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Vipengee vya Safu za Aina';

  @override
  String get genresRowItemsDescription =>
      'Onyesha Filamu, Mifululizo, au vyote viwili katika safu za Aina.';

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
  String get displayPlaylistsRows => 'Onyesha Safu za Orodha za Kucheza';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Onyesha safu za Orodha za Kucheza katika Sehemu za Nyumbani.';

  @override
  String get playlistsRowSorting => 'Upangaji wa Safu za Orodha za Kucheza';

  @override
  String get playlistsRowSortingDescription =>
      'Panga safu za Orodha za Kucheza kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Onyesha Safu za Sauti';

  @override
  String get displayAudioRowsSubtitle =>
      'Onyesha safu za Sauti katika Sehemu za Nyumbani.';

  @override
  String get audioRowsSorting => 'Upangaji wa Safu za Sauti';

  @override
  String get audioRowsSortingDescription =>
      'Panga safu za Sauti kwa tarehe ya kuongezwa, tarehe ya kutolewa, kialfabeti, na zaidi.';

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
  String get audioPlaylists => 'Orodha za Kucheza za Sauti';

  @override
  String get appearance => 'Mwonekano';

  @override
  String get layout => 'Mpangilio';

  @override
  String get theme => 'Mandhari';

  @override
  String get keyboard => 'Kibodi';

  @override
  String get navButtons => 'Vitufe';

  @override
  String get rendering => 'Uonyeshaji';

  @override
  String get mpvConfiguration => 'Usanidi wa MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Programu ya kicheza cha nje';

  @override
  String get externalPlayerAppDescription =>
      'Weka kicheza cha nje ili kuwezesha chaguo la kucheza kwa kubonyeza kwa muda mrefu';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Onyesha kichagua programu uchezaji unapoanza.';

  @override
  String get loadingInstalledPlayers => 'Inapakia vicheza vilivyosakinishwa...';

  @override
  String get connection => 'Muunganisho';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Inatumika kwenye kifaa hiki';

  @override
  String get notSupportedOnThisDevice => 'Haitumiki kwenye kifaa hiki';

  @override
  String get mediaPlayerBehavior => 'Tabia ya Kicheza Maudhui';

  @override
  String get playbackEnhancements => 'Maboresho ya Uchezaji';

  @override
  String get alwaysOn => 'Imewashwa kila wakati.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Badilisha Ruka Hitimisho na Onyesho la Inayofuata';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Onyesha kifuniko cha Inayofuata badala ya kitufe cha Ruka Hitimisho.';

  @override
  String get playerRouting => 'Uelekezaji wa Kicheza';

  @override
  String get preferSoftwareDecoders => 'Pendelea visimbuzi vya programu';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Tumia FFmpeg (sauti) na libgav1 (AV1) kabla ya visimbuzi vya maunzi. Zima ikiwa passthrough ya sauti ya HDMI inaharibika.';

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
      'Fungua uchezaji wa video katika programu ya nje uliyochagua kwenye Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Upangaji Foleni wa Kiotomatiki';

  @override
  String get preferSdhSubtitles => 'Pendelea manukuu ya SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Tanguliza mikondo ya manukuu ya SDH/CC wakati wa kuchagua kiotomatiki.';

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
  String get webDiagnostics => 'Uchunguzi wa wavuti';

  @override
  String get webDiagnosticsTitle => 'Uchunguzi wa Wavuti wa Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Tumia ukurasa huu kuchunguza matatizo ya muunganisho wa kivinjari (CORS, maudhui mchanganyiko, na mipangilio ya ugunduzi).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Hitilafu ya Maudhui Mchanganyiko Imetambuliwa';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Hitilafu ya CORS/Preflight Imetambuliwa';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin imetambua ukurasa wa HTTPS unaojaribu kupiga simu kwa URL ya seva ya HTTP. Vivinjari huzuia ombi hili kabla halijafika kwenye seva yako.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin imetambua hitilafu ya ombi katika kiwango cha kivinjari ambayo mara nyingi husababishwa na vichwa vya CORS au preflight vinavyokosekana kwenye seva ya maudhui.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL lengwa: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Maelezo: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Muktadha wa Sasa wa Utekelezaji';

  @override
  String get webDiagnosticsOrigin => 'Asili';

  @override
  String get webDiagnosticsScheme => 'Skimu';

  @override
  String get webDiagnosticsPluginMode => 'Modi ya Programu-jalizi';

  @override
  String get webDiagnosticsWebRtcScan => 'Uchanganuzi wa WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL ya Seva Iliyolazimishwa';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL Chaguo-msingi ya Seva';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL ya Proksi ya Ugunduzi';

  @override
  String get notConfigured => 'haijasanidiwa';

  @override
  String get webDiagnosticsMixedContent => 'Maudhui Mchanganyiko';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ukurasa huu umepakiwa kupitia HTTPS, lakini URL moja au zaidi zilizosanidiwa ni za HTTP. Vivinjari huzuia kurasa za HTTPS kupiga simu kwa API za HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Suluhisho: toa seva yako ya maudhui au ncha ya proksi kupitia HTTPS, au pakia Moonfin kupitia HTTP kwenye mitandao ya ndani inayoaminika pekee.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Hakuna usanidi dhahiri wa maudhui mchanganyiko uliotambuliwa kutoka kwa mipangilio ya sasa ya utekelezaji.';

  @override
  String get webDiagnosticsCorsChecklist => 'Orodha ya Kukagua ya CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Ruhusu asili ya kivinjari katika Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Jumuisha Authorization, X-Emby-Authorization, na X-Emby-Token katika Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Fichua Content-Range na Accept-Ranges kwa utiririshaji na tabia ya kutafuta.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Rudisha 204 kwa maombi ya preflight ya OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Mfano wa Kijisehemu cha Kichwa (mtindo wa nginx)';

  @override
  String get note => 'Kumbuka';

  @override
  String get webDiagnosticsNonWebNote =>
      'Njia hii ya uchunguzi imekusudiwa kwa ujenzi wa wavuti. Ikiwa unaiona kwenye jukwaa lingine, ukaguzi huu huenda usitumike.';

  @override
  String get backToServerSelect => 'Rudi kwa Uteuzi wa Seva';

  @override
  String get signOutAllUsers => 'Toa Watumiaji Wote';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Ruhusa ya maikrofoni imekataliwa kabisa. Iwashe katika mipangilio ya mfumo.';

  @override
  String get voiceSearchPermissionRequired =>
      'Ruhusa ya maikrofoni inahitajika kwa utafutaji wa sauti.';

  @override
  String get voiceSearchNoMatch => 'Sikuelewa. Jaribu tena.';

  @override
  String get voiceSearchNoSpeechDetected => 'Hakuna usemi uliotambuliwa.';

  @override
  String get voiceSearchMicrophoneError => 'Hitilafu ya maikrofoni.';

  @override
  String get voiceSearchNeedsInternet =>
      'Utafutaji wa sauti unahitaji intaneti.';

  @override
  String get voiceSearchServiceBusy =>
      'Huduma ya sauti ina shughuli nyingi. Jaribu tena.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Ruhusa ya maikrofoni imekataliwa kabisa.';

  @override
  String get microphonePermissionDenied => 'Ruhusa ya maikrofoni imekataliwa.';

  @override
  String get speechRecognitionUnavailable =>
      'Utambuzi wa usemi haupatikani kwenye kifaa hiki.';

  @override
  String get openIosRoutePicker => 'Fungua kichagua njia cha iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Kichagua njia cha AirPlay hakipatikani kwenye kifaa hiki.';

  @override
  String get videos => 'Video';

  @override
  String get programs => 'Vipindi';

  @override
  String get songs => 'Nyimbo';

  @override
  String get photoAlbums => 'Albamu za Picha';

  @override
  String get photos => 'Picha';

  @override
  String get people => 'Watu';

  @override
  String get recentlyReleasedEpisodes => 'Vipindi Vilivyotolewa Hivi Karibuni';

  @override
  String get watchAgain => 'Tazama Tena';

  @override
  String get guestAppearances => 'Kujitokeza kwa Wageni';

  @override
  String get appearancesSeerr => 'Kujitokeza (Seerr)';

  @override
  String get crewContributionsSeerr => 'Michango ya Wafanyakazi (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Tazama na kikundi';

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
  String get disk => 'Diski';

  @override
  String get openInBrowser => 'Fungua kwenye Kivinjari';

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
      'Kivinjari kilichopachikwa hakipatikani kwenye jukwaa hili.';

  @override
  String get adminRestartServerConfirmation =>
      'Una uhakika unataka kuanzisha upya seva?';

  @override
  String get adminShutdownServerConfirmation =>
      'Una uhakika unataka kuzima seva? Utahitaji kuianzisha upya mwenyewe.';

  @override
  String get internal => 'Ya ndani';

  @override
  String get idle => 'Haifanyi kazi';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Hakuna watumiaji waliopatikana';

  @override
  String get adminNoUsersMatchSearch =>
      'Hakuna watumiaji wanaolingana na utafutaji wako';

  @override
  String get adminNoDevicesFound => 'Hakuna vifaa vilivyopatikana';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Hakuna vifaa vinavyolingana na vichujio vya sasa';

  @override
  String get remoteAccess => 'Ufikiaji wa Mbali';

  @override
  String get localOnly => 'Ya Ndani Pekee';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Imeshindwa kupakia takwimu za maudhui';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Takwimu zilizounganishwa katika maktaba zote za maudhui.';

  @override
  String get analyticsTopArtists => 'Wasanii Bora';

  @override
  String get analyticsTopAuthors => 'Waandishi Bora';

  @override
  String get analyticsTopContributors => 'Wachangiaji Bora';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Maktaba $count',
      one: 'Maktaba 1',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Hakuna jumla za maudhui yaliyoorodheshwa zinazopatikana kwa uteuzi huu bado.';

  @override
  String get analyticsLibraryDetails => 'Maelezo ya Maktaba';

  @override
  String get analyticsLibraryBreakdown => 'Mchanganuo wa Maktaba';

  @override
  String get analyticsNoLibrariesAvailable => 'Hakuna maktaba zinazopatikana.';

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
  String get adminServerAdministrationTitle => 'Usimamizi wa Seva';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Akiba ya Picha';

  @override
  String get adminServerPathCache => 'Akiba';

  @override
  String get adminServerPathLogs => 'Kumbukumbu';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Kubadilisha Msimbo';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Hakuna njia za seva zilizorudishwa na seva hii.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% imetumika';
  }

  @override
  String get userActivity => 'Shughuli za Mtumiaji';

  @override
  String get systemEvents => 'Matukio ya Mfumo';

  @override
  String get needsAttention => 'Inahitaji Uangalizi';

  @override
  String get homeVideos => 'Video za Nyumbani';

  @override
  String get mixedContent => 'Maudhui Mchanganyiko';

  @override
  String get homeVideosAndPhotos => 'Video na Picha za Nyumbani';

  @override
  String get mixedMoviesAndShows => 'Filamu na Vipindi Mchanganyiko';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Hakuna rekodi zilizopatikana';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Hakuna kurasa za picha zilizopatikana ndani ya kumbukumbu ya .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Kionyeshi kilichopachikwa kimeshindwa ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Kionyeshi cha EPUB kimeshindwa ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Faili la ndani la kisomaji halipo: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status wakati wa kufungua data ya kitabu kutoka $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Hakuna ncha ya kitabu inayoweza kusomwa inayopatikana';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Muundo wa kumbukumbu ya katuni hauhimiliwi: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Programu-jalizi ya kutoa CBR haipatikani kwenye jukwaa hili.';

  @override
  String get failedToExtractCbrArchive =>
      'Imeshindwa kutoa kumbukumbu ya .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Utoaji wa CB7 haupatikani kwenye jukwaa hili.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Programu-jalizi ya kutoa CB7 haipatikani kwenye jukwaa hili.';

  @override
  String get loadingShuffle => 'Inapakia mchanganyiko...';

  @override
  String get libraryShuffleLabel => 'MCHANGANYIKO WA MAKTABA';

  @override
  String get randomShuffleLabel => 'MCHANGANYIKO NASIBU';

  @override
  String get genresShuffleLabel => 'MCHANGANYIKO WA AINA';

  @override
  String get autoHdrSwitching => 'Kubadilisha HDR Kiotomatiki';

  @override
  String get autoHdrSwitchingDescription =>
      'Washa HDR kiotomatiki kwa uchezaji wa video ya HDR na urejeshe modi ya onyesho unapotoka.';

  @override
  String get whenFullscreen => 'Wakati wa skrini nzima';

  @override
  String get changeArtwork => 'Badilisha Sanaa';

  @override
  String get missing => 'Haipo';

  @override
  String get clearAllArtworkButton => 'Futa sanaa yote?';

  @override
  String get clearAllArtworkWarning =>
      'Una uhakika unataka kufuta sanaa yote iliyopakuliwa?';

  @override
  String get confirmClear => 'Thibitisha Kufuta';

  @override
  String confirmClearMessage(String itemType) {
    return 'Una uhakika ungependa kufuta $itemType?';
  }

  @override
  String get uploadButton => 'Pakia?';

  @override
  String get resolutionLabel => 'Mwonekano: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Onyesha sanaa katika lugha ya kiolesura pekee';

  @override
  String get confirmClearAll => 'Thibitisha Kufuta Yote';

  @override
  String get imageUploadSuccess => 'Picha imepakiwa kwa mafanikio!';

  @override
  String imageUploadFailed(String error) {
    return 'Imeshindwa kupakia picha: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Imeshindwa kuweka picha: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Imeshindwa kufuta picha: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Imeshindwa kufuta sanaa yote: $error';
  }

  @override
  String get yes => 'Ndiyo';

  @override
  String get posterCategory => 'Bango';

  @override
  String get backdropsCategory => 'Mandharinyuma';

  @override
  String get bannerCategory => 'Utepe';

  @override
  String get logoCategory => 'Nembo';

  @override
  String get thumbnailCategory => 'Kijipicha';

  @override
  String get artCategory => 'Sanaa';

  @override
  String get discArtCategory => 'Sanaa ya Diski';

  @override
  String get screenshotCategory => 'Picha ya Skrini';

  @override
  String get boxCoverCategory => 'Jalada la Kisanduku';

  @override
  String get boxRearCoverCategory => 'Jalada la Nyuma la Kisanduku';

  @override
  String get menuArtCategory => 'Sanaa ya Menyu';

  @override
  String get confirmItemPoster => 'bango';

  @override
  String get confirmItemBackdrop => 'mandharinyuma';

  @override
  String get confirmItemBanner => 'utepe';

  @override
  String get confirmItemLogo => 'nembo';

  @override
  String get confirmItemThumbnail => 'kijipicha';

  @override
  String get confirmItemArt => 'sanaa';

  @override
  String get confirmItemDiscArt => 'sanaa ya diski';

  @override
  String get confirmItemScreenshot => 'picha ya skrini';

  @override
  String get confirmItemBoxCover => 'jalada la kisanduku';

  @override
  String get confirmItemBoxRearCover => 'jalada la nyuma la kisanduku';

  @override
  String get confirmItemMenuArt => 'sanaa ya menyu';

  @override
  String get resolutionAll => 'Zote';

  @override
  String get resolutionHigh => 'Juu (1080p+)';

  @override
  String get resolutionMedium => 'Wastani (720p)';

  @override
  String get resolutionLow => 'Chini (<720p)';

  @override
  String get sources => 'Vyanzo';

  @override
  String get audiobookChapters => 'Sura';

  @override
  String get audiobookBookmarks => 'Alamisho';

  @override
  String get audiobookNotes => 'Vidokezo';

  @override
  String get audiobookQueue => 'Foleni';

  @override
  String get audiobookTimeline => 'Ratiba ya Muda';

  @override
  String get audiobookTimelineEmpty => 'Ratiba ya muda ni tupu';

  @override
  String get audiobookFocusedTimeline => 'Ratiba ya Muda Iliyolengwa';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Hamisha Alamisho';

  @override
  String get audiobookExportNotes => 'Hamisha Vidokezo';

  @override
  String get audiobookExportAll => 'Hamisha Yote';

  @override
  String audiobookExportSuccess(String path) {
    return 'Imehamishiwa $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Kuhamisha kumeshindwa: $error';
  }

  @override
  String get audiobookLyrics => 'Maneno ya Wimbo';

  @override
  String get audiobookAddBookmark => 'Ongeza alamisho';

  @override
  String get audiobookAddNote => 'Ongeza kidokezo';

  @override
  String get audiobookEditNote => 'Hariri kidokezo';

  @override
  String get audiobookNoteHint => 'Andika kidokezo cha wakati huu';

  @override
  String get audiobookSleepTimer => 'Kipima muda cha kulala';

  @override
  String get audiobookSleepOff => 'Imezimwa';

  @override
  String get audiobookSleepEndOfChapter => 'Mwisho wa sura';

  @override
  String get audiobookSleepCustom => 'Maalum';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining zimesalia';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dk $count',
      one: 'dk 1',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Kasi ya uchezaji';

  @override
  String get audiobookRemainingTime => 'Zilizosalia';

  @override
  String get audiobookElapsedTime => 'Zilizopita';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Nyuma ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Mbele ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Sura iliyotangulia';

  @override
  String get audiobookNextChapter => 'Sura inayofuata';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Sura $current kati ya $total';
  }

  @override
  String get audiobookNoChapters => 'Hakuna sura';

  @override
  String get audiobookNoBookmarks => 'Hakuna alamisho bado';

  @override
  String get audiobookNoNotes => 'Hakuna vidokezo bado';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Alamisho limeongezwa kwenye $position';
  }

  @override
  String get audiobookSpeedReset => 'Weka upya hadi 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Hifadhi';

  @override
  String get audiobookCancel => 'Ghairi';

  @override
  String get audiobookDelete => 'Futa';

  @override
  String get subtitlePreferencesDescription =>
      'Badilisha modi za manukuu, lugha chaguo-msingi, muonekano, na chaguo za uonyeshaji.';

  @override
  String get subtitleRendering => 'Uonyeshaji wa Manukuu';

  @override
  String get displayOptions => 'Chaguo za Onyesho';

  @override
  String get releaseDateAscending => 'Tarehe ya Kutolewa (Kupanda)';

  @override
  String get releaseDateDescending => 'Tarehe ya Kutolewa (Kushuka)';

  @override
  String get groupContributions => 'Panga Michango';

  @override
  String get groupMultipleRoles => 'Panga majukumu mengi pamoja';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Onyo la Ufikiaji wa Kuandika kwenye Maktaba';

  @override
  String get libraryWriteAccessHowToFix => 'Jinsi ya kurekebisha hili:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Mpe mtumiaji wa huduma ya Jellyfin (k.m. jellyfin au PUID/PGID ya Docker) ruhusa za kuandika kwenye folda za maktaba yako ya maudhui kwenye seva.\n\n2. Au, nenda kwenye Dashibodi yako ya Jellyfin -> Maktaba, hariri maktaba hii, na uzime \'Hifadhi sanaa katika folda za maudhui\' ili kuhifadhi sanaa katika hifadhidata ya ndani ya Jellyfin.';

  @override
  String get dismiss => 'Ondoa';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Maktaba yako ya \'$libraryName\' imesanidiwa kuhifadhi sanaa moja kwa moja katika folda za maudhui (\'Hifadhi sanaa katika folda za maudhui\' imewashwa). Hata hivyo, Jellyfin imejaribu ufikiaji wa kuandika na haina ruhusa ya kuandika faili katika saraka hii:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Inaonekana Jellyfin imeshindwa kusasisha sanaa. Maktaba yako imesanidiwa kuhifadhi sanaa moja kwa moja katika folda za maudhui (\'Hifadhi sanaa katika folda za maudhui\' imewashwa). Hitilafu hii hutokea mara nyingi wakati mchakato wa seva ya Jellyfin hauna ruhusa ya kuandika faili katika saraka zako za maudhui.';

  @override
  String get replay => 'Cheza Tena';

  @override
  String get fileInformation => 'Maelezo ya Faili';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Ukubwa: $size  •  Muundo: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Onyesha Mikondo Yote ($count) ya Sauti';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Onyesha Mikondo Yote ($count) ya Manukuu';
  }

  @override
  String get checkingDirectPlay =>
      'Inakagua uwezo wa Uchezaji wa Moja kwa Moja...';

  @override
  String get directPlayCapabilityLabel =>
      'Uwezo wa Uchezaji wa Moja kwa Moja: ';

  @override
  String get forced => 'Yaliyolazimishwa';

  @override
  String get transcodeContainerNotSupported =>
      'Muundo wa kontena hauhimiliwi na kicheza.';

  @override
  String get transcodeVideoCodecNotSupported => 'Kodeki ya video haihimiliwi.';

  @override
  String get transcodeAudioCodecNotSupported => 'Kodeki ya sauti haihimiliwi.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Muundo wa manukuu hauhimiliwi (unahitaji kuchomwa).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Wasifu wa sauti hauhimiliwi.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Wasifu wa video hauhimiliwi.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Kiwango cha video hakihimiliwi.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Mwonekano wa video hauhimiliwi na kifaa hiki.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Kina cha biti cha video hakihimiliwi.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Kasi ya fremu ya video haihimiliwi.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Kasi ya biti ya faili inazidi kikomo cha utiririshaji cha kicheza.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Kasi ya biti ya video inazidi kikomo cha utiririshaji.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Kasi ya biti ya sauti inazidi kikomo cha utiririshaji.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Idadi ya chaneli za sauti haihimiliwi.';

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
  String get sortAlphabetical => 'Kialfabeti';

  @override
  String get sortReleaseAscending => 'Mpangilio wa Kutolewa (Kupanda)';

  @override
  String get sortReleaseDescending => 'Mpangilio wa Kutolewa (Kushuka)';

  @override
  String get sortCustomDragDrop => 'Maalum (Buruta-na-Dondosha)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Chaguo za Kupanga Orodha ya Kucheza';

  @override
  String get resetSort => 'Weka Upya Upangaji';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Tazama Tena M$season:K$episode';
  }

  @override
  String get rewatchPlaylist => 'Tazama Tena Orodha ya Kucheza';

  @override
  String get noSubtitlesFound => 'Hakuna manukuu yaliyopatikana.';

  @override
  String get adminControls => 'Vidhibiti vya Msimamizi';

  @override
  String get impellerRendering => 'Injini ya uonyeshaji (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller ni kionyeshi cha kisasa cha GPU cha Flutter kwa uhuishaji laini na mkwaruzo mdogo. Kwenye baadhi ya visanduku vya TV na GPU za zamani inaweza kusababisha hitilafu au video nyeusi; izime ikiwa unaona hayo. Kiotomatiki huchagua chaguo-msingi bora kwa kifaa chako. Anzisha upya Moonfin ili kutumia.';

  @override
  String get impellerAuto => 'Kiotomatiki';

  @override
  String get impellerOn => 'Imewashwa';

  @override
  String get impellerOff => 'Imezimwa';

  @override
  String get impellerRestartTitle => 'Kuanzisha upya kunahitajika';

  @override
  String get impellerRestartMessage =>
      'Moonfin inahitaji kuanzishwa upya ili kubadilisha injini ya uonyeshaji. Funga programu sasa, kisha uifungue tena ili kutumia.';

  @override
  String get impellerCloseNow => 'Funga programu sasa';

  @override
  String get adminRefreshLibrary => 'Onyesha Upya Maktaba';

  @override
  String get adminRefreshAllLibraries => 'Onyesha Upya Maktaba Zote';

  @override
  String get adminRepoSortDateOldest =>
      'Tarehe ya Kuongezwa (Za Zamani Kwanza)';

  @override
  String get adminRepoSortDateNewest => 'Tarehe ya Kuongezwa (Mpya Kwanza)';

  @override
  String get adminRepoSortNameAsc => 'Kialfabeti (A hadi Z)';

  @override
  String get adminRepoSortNameDesc => 'Kialfabeti (Z hadi A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Inapakia Takwimu za Seva... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource =>
      'Linganisha na chanzo';

  @override
  String get imdbTop250Movies => 'Filamu 250 Bora za IMDb';

  @override
  String get imdbTop250TvShows => 'Vipindi 250 Bora vya TV vya IMDb';

  @override
  String get imdbMostPopularMovies => 'Filamu Maarufu Zaidi za IMDb';

  @override
  String get imdbMostPopularTvShows => 'Vipindi Maarufu Zaidi vya TV vya IMDb';

  @override
  String get imdbLowestRatedMovies =>
      'Filamu Zenye Ukadiriaji wa Chini Zaidi za IMDb';

  @override
  String get imdbTopEnglishMovies => 'Filamu Bora za Kiingereza za IMDb';

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
  String get integrations => 'Ushirikiano';

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
