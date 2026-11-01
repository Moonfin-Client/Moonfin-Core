// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

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
  String get interfaceLanguage => 'Saskarnes valoda';

  @override
  String get systemLanguageDefault => 'Sistēmas noklusējums';

  @override
  String get signIn => 'Pierakstīties';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Tukšs';

  @override
  String connectingToServer(String serverName) {
    return 'Savienojuma izveide ar $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Parole';

  @override
  String get username => 'Lietotājvārds';

  @override
  String get email => 'E-pasts';

  @override
  String get quickConnectInstruction =>
      'Ievadiet šo kodu sava servera tīmekļa informācijas panelī:';

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
  String get waitingForAuthorization => 'Gaida autorizāciju...';

  @override
  String get back => 'Atpakaļ';

  @override
  String get serverUnavailable => 'Serveris nav pieejams';

  @override
  String get loginFailed => 'Pieteikšanās neizdevās';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect nav pieejams: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nav pieejams ($status): $detail';
  }

  @override
  String get whosWatching => 'Kurš skatās?';

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
  String get addUser => 'Pievienot lietotāju';

  @override
  String get selectServer => 'Izvēlieties Serveris';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versija $version';
  }

  @override
  String get savedServers => 'Saglabātie serveri';

  @override
  String get discoveredServers => 'Atklātie serveri';

  @override
  String get noneFound => 'Nav atrasts neviens';

  @override
  String get unableToConnectToServer => 'Nevar izveidot savienojumu ar serveri';

  @override
  String get addServer => 'Pievienot serveri';

  @override
  String get embyConnect => 'Emby Savienot';

  @override
  String get removeServer => 'Noņemt serveri';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Vai noņemt \"$serverName\" no saviem serveriem?';
  }

  @override
  String get cancel => 'Atcelt';

  @override
  String get remove => 'Noņemt';

  @override
  String get connectToServer => 'Izveidojiet savienojumu ar serveri';

  @override
  String get serverAddress => 'Servera adrese';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Savienot';

  @override
  String get secureStorageUnavailable => 'Droša krātuve nav pieejama';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nevarēja piekļūt jūsu sistēmas atslēgu piekariņam. Pieteikšanos var turpināt, taču droša marķiera krātuve var nebūt pieejama, kamēr atslēgu piekariņš nav atbloķēts.';

  @override
  String get ok => 'Labi';

  @override
  String get settingsAppearanceTheme => 'Lietotnes motīvs';

  @override
  String get detailScreenStyle => 'Detaļu ekrāna stils';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasiskais ir oriģinālais centrētais Moonfin izkārtojums. Modernais ir adaptīvs kinematogrāfisks izkārtojums.';

  @override
  String get detailScreenStyleMoonfin => 'Klasiskais';

  @override
  String get detailScreenStyleModern => 'Modernais';

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
  String get expandedTabs => 'Izvērstas cilnes';

  @override
  String get expandedTabsSubtitle =>
      'Automātiski rādīt cilnes saturu, pārlūkojot cilnes. Izslēdziet, lai katru cilni atvērtu un aizvērtu manuāli.';

  @override
  String get showTechnicalDetails => 'Rādīt tehnisko informāciju?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Rādīt kodeka, izšķirtspējas un straumes informāciju bannera kopsavilkumā';

  @override
  String get recommendationSystem => 'Ieteikumu sistēma';

  @override
  String get recommendationSystemSubtitle =>
      'Izmantojiet Moonfin Recommends vietējās bibliotēkas algoritmu vai tiešsaistes TMDB līdzības rādītājus. Piezīme: tiešsaistes ieteikumiem nepieciešama Seerr integrācija.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb līdzība';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Piemērot vecuma ierobežojuma slieksni?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Ierobežot Moonfin Recommends ieteikumus atbilstoši izvēlētā satura vecuma ierobežojumam';

  @override
  String get interfaceStyle => 'Saskarnes stils';

  @override
  String get interfaceStyleSubtitle =>
      'Automātiskais pielāgojas jūsu ierīcei. Izvēlieties Apple vai Material, lai noteiktu konkrētu izskatu.';

  @override
  String get interfaceStyleAutomatic => 'Automātiskais';

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
  String get glassQuality => 'Stikla kvalitāte';

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
      'Automātiskais izvēlas šai ierīcei piemērotāko stikla efektu. Pilnais ieslēdz īstu izplūdumu; Samazinātais izmanto vieglu stiklu, kas taupa GPU jaudu.';

  @override
  String get glassQualityAuto => 'Automātiski';

  @override
  String get glassQualityFull => 'Pilns';

  @override
  String get glassQualityReduced => 'Samazināts';

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
      'Pārslēdzieties starp Moonfin un Neon Pulse, nerestartējot lietotni';

  @override
  String get customThemeTitle => 'Pielāgota tēma';

  @override
  String get customThemeSubtitle =>
      'Pielāgotas tēmas maina vizuālos elementus visā Moonfin lietotnē. Izvēlieties vienu no šīm iespējām atbilstoši savam stilam.';

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
      'Pašreizējais Moonfin izskats, ko jūs visi esat iemīlējuši';

  @override
  String get themeNeonPulse => 'Neona pulss';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stils ar fuksīna mirdzumu, ciāna tekstu un spēcīgāku hroma kontrastu';

  @override
  String get themeGlass => 'Stikls';

  @override
  String get themeGlassSubtitle =>
      'Šķidra stikla stils ar plūstošu gradienta fonu, matētām virsmām un Apple zilo akcentu';

  @override
  String get theme8BitHero => '8 bitu varonis';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pikseļu mākslas stils ar rupju paleti, kvadrātveida apmalēm, asām ēnām un pikseļu fontu';

  @override
  String get embyConnectSignInSubtitle =>
      'Pierakstieties ar savu Emby Connect kontu';

  @override
  String get emailOrUsername => 'E-pasts vai lietotājvārds';

  @override
  String get selectAServer => 'Izvēlieties serveri';

  @override
  String get tryAgain => 'Mēģiniet vēlreiz';

  @override
  String get noLinkedServers =>
      'Ar šo Emby Connect kontu nav saistīts neviens serveris';

  @override
  String get invalidEmbyConnectCredentials =>
      'Nederīgi Emby Connect akreditācijas dati';

  @override
  String get invalidEmbyConnectLogin =>
      'Nederīgs Emby Connect lietotājvārds vai parole';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serveris neatbalsta Emby Connect apmaiņu';

  @override
  String get embyConnectNetworkError =>
      'Tīkla kļūda, sazinoties ar Emby Connect vai atlasīto serveri';

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
  String get loadingLinkedServers => 'Notiek saistīto serveru ielāde...';

  @override
  String get connectingToServerEllipsis =>
      'Notiek savienojuma izveide ar serveri...';

  @override
  String get noReachableAddress => 'Nav norādīta sasniedzama adrese';

  @override
  String get invalidServerExchangeResponse =>
      'Nederīga atbilde no servera apmaiņas galapunkta';

  @override
  String unableToConnectTo(String target) {
    return 'Nevar izveidot savienojumu ar $target';
  }

  @override
  String get exitApp => 'Vai iziet no Moonfin?';

  @override
  String get exitAppConfirmation => 'Vai tiešām vēlaties iziet?';

  @override
  String get exit => 'Iziet';

  @override
  String get gameMenu => 'Izvēlne';

  @override
  String get gamePaused => 'Pauzēts';

  @override
  String get gameSaveState => 'Saglabāt stāvokli';

  @override
  String get games => 'Spēles';

  @override
  String get gameLoadState => 'Ielādēt stāvokli';

  @override
  String get gameFastForward => 'Paātrināt';

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
  String get gameEmulatorSettings => 'Emulatora iestatījumi';

  @override
  String get gameNoCoreOptions => 'Šim kodolam nav pielāgojamu opciju.';

  @override
  String get gameHoldToOpenMenu => 'Turiet, lai atvērtu izvēlni';

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
      'Spēles šajā ierīcē pagaidām netiek atbalstītas.';

  @override
  String get noHomeRowsLoaded => 'Nevarēja ielādēt nevienu sākuma rindu';

  @override
  String get noHomeRowsHint =>
      'Mēģiniet atsvaidzināt vai samazināt aktīvās mājas sadaļas.';

  @override
  String get retryHomeRows => 'Mēģiniet vēlreiz sākuma rindas';

  @override
  String get guide => 'Ceļvedis';

  @override
  String get recordings => 'Ieraksti';

  @override
  String get schedule => 'Grafiks';

  @override
  String get series => 'Seriāli';

  @override
  String get noItemsFound => 'Nav atrasts neviens vienums';

  @override
  String get home => 'Sākums';

  @override
  String get browseAll => 'Pārlūkot visu';

  @override
  String get genres => 'Žanri';

  @override
  String get collectionPlaceholder => 'Šeit parādīsies kolekcijas vienumi';

  @override
  String get browseByLetter => 'Pārlūkot pēc burtiem';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Šeit tiks parādīta alfabētiskā pārlūkošana';

  @override
  String get suggestions => 'Ieteikumi';

  @override
  String get suggestionsPlaceholder => 'Šeit tiks parādīti ieteiktie vienumi';

  @override
  String get failedToLoadLibraries => 'Neizdevās ielādēt bibliotēkas';

  @override
  String get noLibrariesFound => 'Nav atrasta neviena bibliotēka';

  @override
  String get library => 'Bibliotēka';

  @override
  String get displaySettings => 'Displeja iestatījumi';

  @override
  String get allGenres => 'Visi žanri';

  @override
  String get noGenresFound => 'Nav atrasts neviens žanrs';

  @override
  String failedToLoadFolderError(String error) {
    return 'Neizdevās ielādēt mapi: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Šī mape ir tukša';

  @override
  String itemCountLabel(int count) {
    return '$count vienumus';
  }

  @override
  String get failedToLoadFavorites => 'Neizdevās ielādēt izlasi';

  @override
  String get retry => 'Mēģiniet vēlreiz';

  @override
  String get noFavoritesYet => 'Izlases vēl nav';

  @override
  String get favorites => 'Izlase';

  @override
  String totalCountItems(int count) {
    return '$count Vienumi';
  }

  @override
  String get continuing => 'Turpinot';

  @override
  String get ended => 'Beigās';

  @override
  String get sortAndFilter => 'Kārtot un filtrēt';

  @override
  String get type => 'Tips';

  @override
  String get sortBy => 'Kārtot pēc';

  @override
  String get display => 'Displejs';

  @override
  String get imageType => 'Attēla veids';

  @override
  String get posterSize => 'Plakāta izmērs';

  @override
  String get small => 'Mazs';

  @override
  String get medium => 'Vidēja';

  @override
  String get large => 'Liels';

  @override
  String get extraLarge => 'Īpaši liels';

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
    return '$name — Žanri';
  }

  @override
  String get views => 'Skati';

  @override
  String get albums => 'Albumi';

  @override
  String get albumArtists => 'Albuma mākslinieki';

  @override
  String get artists => 'Izpildītāji';

  @override
  String get bookmarks => 'Grāmatzīmes';

  @override
  String get noSavedBookmarks =>
      'Šim nosaukumam vēl nav saglabātu grāmatzīmju.';

  @override
  String get openBook => 'Atvērt grāmatu';

  @override
  String get chapter => 'nodaļa';

  @override
  String get page => 'Lapa';

  @override
  String get bookmark => 'Grāmatzīme';

  @override
  String get justNow => 'Tikai tagad';

  @override
  String minutesAgo(int count) {
    return 'Pirms $count@min';
  }

  @override
  String hoursAgo(int count) {
    return 'Pirms $count@h';
  }

  @override
  String daysAgo(int count) {
    return '${count}d pirms';
  }

  @override
  String get discoverySubjects => 'Atklāšanas priekšmeti';

  @override
  String get apply => 'Lietot';

  @override
  String get openLink => 'Atveriet saiti';

  @override
  String get scanWithYourPhone => 'Skenējiet ar tālruni';

  @override
  String get audiobookGenres => 'Audiogrāmatu žanri';

  @override
  String get scrollLeft => 'Ritiniet pa kreisi';

  @override
  String get scrollRight => 'Ritiniet pa labi';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre => 'Pašlaik nevarēja ielādēt šo žanru.';

  @override
  String get continueReading => 'Turpināt lasīt';

  @override
  String get savedHighlights => 'Saglabātie svarīgākie punkti';

  @override
  String get continueListening => 'Turpināt Klausīties';

  @override
  String get listen => 'Klausies';

  @override
  String get resume => 'Turpināt';

  @override
  String get failedToLoadLibrary => 'Neizdevās ielādēt bibliotēku';

  @override
  String get popularNow => 'Šobrīd populārs';

  @override
  String get savedForLater => 'Saglabāts Vēlāk';

  @override
  String get topListens => 'Populārākie klausījumi';

  @override
  String get unreadDiscoveries => 'Nelasīti atklājumi';

  @override
  String get pickUpAgain => 'Paņemiet vēlreiz';

  @override
  String get bookHighlightsDescription =>
      'Jūsu grāmatas ar svarīgākajām vietām, izlasi vai lasīšanas progresu.';

  @override
  String get handPickedFromLibrary => 'Ar rokām izvēlēta no jūsu bibliotēkas.';

  @override
  String get handPickedFromListeningQueue =>
      'Ar rokām atlasīts no jūsu klausīšanās rindas.';

  @override
  String get booksWithHighlights =>
      'Grāmatas ar svarīgākajām vietām, izlasi vai lasīšanas progresu.';

  @override
  String get jumpBackNarration =>
      'Atgriezieties stāstījumā, nemeklējot savu vietu.';

  @override
  String get unreadBooksReady =>
      'Nelasītas grāmatas gatavas nākamajai klusajai stundai.';

  @override
  String get quickAccessFavorites =>
      'Ātra piekļuve grāmatām, pie kurām atgriežaties.';

  @override
  String get searchAudiobooks => 'Meklēt audiogrāmatas';

  @override
  String get searchYourLibrary => 'Meklējiet savā bibliotēkā';

  @override
  String get pickUpStory => 'Turpiniet stāstu no vietas, kur to pārtraucāt';

  @override
  String get savedPlacesChapters =>
      'Jūsu saglabātās vietas un nepabeigtās nodaļas';

  @override
  String authorsCount(int count) {
    return '$count autori';
  }

  @override
  String genresCount(int count) {
    return '$count žanri';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% pabeigts';
  }

  @override
  String get readyWhenYouAre => 'Gatavs, kad esi';

  @override
  String get details => 'Sīkāka informācija';

  @override
  String get listeningRoom => 'Klausīšanās telpa';

  @override
  String get bookmarksAndProgress => 'Grāmatzīmes un norise';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count virsraksti, kas sakārtoti lasīšanai vispirms.';
  }

  @override
  String get titles => 'Nosaukumi';

  @override
  String get allTitles => 'Visi nosaukumi';

  @override
  String get authors => 'Autori';

  @override
  String get browseByAuthor => 'Pārlūkot pēc autora';

  @override
  String get browseByGenre => 'Pārlūkot pēc žanra';

  @override
  String get discover => 'Atklājiet';

  @override
  String get noBookmarkedItems => 'Vēl nav grāmatzīmēs pievienotu vienumu';

  @override
  String get nothingMatchesSection =>
      'Šai sadaļai vēl nekas neatbilst. Izmēģiniet citu cilni vai atgriezieties pēc bibliotēkas sinhronizācijas pabeigšanas.';

  @override
  String get audiobooks => 'Audiogrāmatas';

  @override
  String noLabelFound(String label) {
    return 'Nav atrasts neviens $label';
  }

  @override
  String get folder => 'Mape';

  @override
  String get filters => 'Filtri';

  @override
  String get readingStatus => 'Lasīšanas statuss';

  @override
  String get playedStatus => 'Spēlēts statuss';

  @override
  String get readStatus => 'Lasīt';

  @override
  String get watched => 'Noskatīts';

  @override
  String get unread => 'Nelasīts';

  @override
  String get unwatched => 'Nenoskatīts';

  @override
  String get seriesStatus => 'Sērijas statuss';

  @override
  String get allLibraries => 'Visas bibliotēkas';

  @override
  String get books => 'Grāmatas';

  @override
  String get latestBooks => 'Jaunākās grāmatas';

  @override
  String get latestAudiobooks => 'Jaunākās audiogrāmatas';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count grāmatas',
      one: '$count grāmata',
      zero: '$count grāmatu',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Grāmata';

  @override
  String get bookFormatAudiobook => 'Audiogrāmata';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Šim autoram nav atrasta neviena grāmata.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return 'Izlasīts $percent%';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Atlicis $time';
  }

  @override
  String get bookHeroRead => 'Lasīt';

  @override
  String get bookHeroListen => 'Klausīties';

  @override
  String get author => 'Autors';

  @override
  String get unknownAuthor => 'Nezināms autors';

  @override
  String get uncategorized => 'Bez kategorijas';

  @override
  String get overview => 'Pārskats';

  @override
  String get noLibrivoxDescription =>
      'LibriVox šim nosaukumam vēl nav sniedzis aprakstu.';

  @override
  String get readers => 'Lasītāji';

  @override
  String get openLinks => 'Atveriet saites';

  @override
  String get librivoxPage => 'LibriVox lapa';

  @override
  String get internetArchive => 'Interneta arhīvs';

  @override
  String get rssFeed => 'RSS plūsma';

  @override
  String get downloadZip => 'Lejupielādēt Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count sadaļas';
  }

  @override
  String firstPublished(int year) {
    return 'Pirmo reizi publicēts $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Par šo nosaukumu vēl nav pieejams pārskats no Open Library.';

  @override
  String get subjects => 'Priekšmeti';

  @override
  String get all => 'Visi';

  @override
  String booksCount(int count) {
    return '$count grāmatas';
  }

  @override
  String get couldNotLoadSubject => 'Pašlaik nevarēja ielādēt šo tēmu.';

  @override
  String get audiobookDetails => 'Sīkāka informācija par audiogrāmatu';

  @override
  String authorsCountTitle(int count) {
    return '$count Autori';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiogrāmatas',
      one: '$count audiogrāmata',
      zero: '$count audiogrāmatu',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Dziesmu saraksts';

  @override
  String get itemListPlaceholder => 'Šeit parādīsies preču saraksts';

  @override
  String get failedToLoad => 'Neizdevās ielādēt';

  @override
  String get delete => 'Dzēst';

  @override
  String get save => 'Saglabāt';

  @override
  String get moreLikeThis => 'Vairāk kā šis';

  @override
  String get castAndCrew => 'Aktieri un komanda';

  @override
  String get collection => 'Kolekcija';

  @override
  String get episodes => 'Epizodes';

  @override
  String get nextUp => 'Nākamais Uz augšu';

  @override
  String get seasons => 'Sezonas';

  @override
  String get chapters => 'Nodaļas';

  @override
  String get features => 'Funkcijas';

  @override
  String get movies => 'Filmas';

  @override
  String get musicVideos => 'Mūzikas video';

  @override
  String get other => 'Cits';

  @override
  String get discography => 'Diskogrāfija';

  @override
  String get similarArtists => 'Līdzīgi mākslinieki';

  @override
  String get tableOfContents => 'Satura rādītājs';

  @override
  String get tracklist => 'Dziesmu saraksts';

  @override
  String discNumber(int number) {
    return 'Disks $number';
  }

  @override
  String get biography => 'Biogrāfija';

  @override
  String get authorDetails => 'Sīkāka informācija par autoru';

  @override
  String get noOverviewAvailable =>
      'Par šo nosaukumu vēl nav pieejams pārskats.';

  @override
  String get noBiographyAvailable => 'Šim autoram nav pieejama biogrāfija.';

  @override
  String get unableToLoadAuthorDetails =>
      'Pašlaik nevar ielādēt autora informāciju.';

  @override
  String published(int year) {
    return 'Publicēts $year';
  }

  @override
  String get publicationDateUnknown => 'Publicēšanas datums nav zināms';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sezonas',
      one: '$count sezona',
      zero: '$count sezonu',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Beidzas $time';
  }

  @override
  String get items => 'Vienumi';

  @override
  String get extras => 'Papildmateriāli';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Aizkulises';

  @override
  String get deletedScenes => 'Izgrieztās ainas';

  @override
  String get featurettes => 'Sižeti par filmu';

  @override
  String get interviews => 'Intervijas';

  @override
  String get scenes => 'Ainas';

  @override
  String get shorts => 'Īsfilmas';

  @override
  String get trailers => 'Treileri';

  @override
  String timeRemaining(String time) {
    return 'Atlicis $time';
  }

  @override
  String endsIn(String time) {
    return 'Beigsies pēc $time';
  }

  @override
  String get view => 'Skatīt';

  @override
  String get resumeReading => 'Atsākt lasīšanu';

  @override
  String get read => 'Lasīt';

  @override
  String resumeFrom(String position) {
    return 'Atsākt no $position';
  }

  @override
  String get play => 'Atskaņot';

  @override
  String get startOver => 'Sāciet no jauna';

  @override
  String get restart => 'Restartēt';

  @override
  String get readOffline => 'Lasiet bezsaistē';

  @override
  String get playOffline => 'Spēlējiet bezsaistē';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtitri';

  @override
  String get version => 'Versija';

  @override
  String get cast => 'Apraidīt';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Treileris';

  @override
  String get finished => 'Pabeigts';

  @override
  String get favorited => 'Pievienots izlasei';

  @override
  String get favorite => 'Mīļākais';

  @override
  String get playlist => 'Atskaņošanas saraksts';

  @override
  String get downloaded => 'Lejupielādēts';

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
  String get downloadAll => 'Lejupielādēt visu';

  @override
  String get download => 'Lejupielādēt';

  @override
  String get deleteDownloaded => 'Dzēst lejupielādēto';

  @override
  String get goToSeries => 'Dodieties uz sēriju';

  @override
  String get editMetadata => 'Rediģēt metadatus';

  @override
  String get less => 'Mazāk';

  @override
  String get more => 'Vairāk';

  @override
  String get deleteItem => 'Dzēst vienumu';

  @override
  String get deletePlaylist => 'Dzēst atskaņošanas sarakstu';

  @override
  String get deletePlaylistMessage =>
      'Vai dzēst šo atskaņošanas sarakstu no servera?';

  @override
  String get deleteItemMessage => 'Vai dzēst šo vienumu no servera?';

  @override
  String get failedToDeletePlaylist =>
      'Neizdevās izdzēst atskaņošanas sarakstu';

  @override
  String get failedToDeleteItem => 'Neizdevās izdzēst vienumu';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Pārdēvēt atskaņošanas sarakstu';

  @override
  String get playlistName => 'Atskaņošanas saraksta nosaukums';

  @override
  String get deleteDownloadedAlbum => 'Dzēst lejupielādēto albumu';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Vai dzēst \"$title\" lejupielādētos ierakstus?';
  }

  @override
  String get downloadedTracksDeleted => 'Lejupielādētie ieraksti ir izdzēsti';

  @override
  String get downloadedTracksDeleteFailed =>
      'Dažus lejupielādētos ierakstus nevarēja izdzēst';

  @override
  String get noTracksLoaded => 'Nav ielādēts neviens ieraksts';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Nav ielādēts neviens $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Notiek $title ($count vienumu) lejupielāde...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Vai tiešām vēlaties dzēst \"$name\" no servera? Šo darbību nevar atsaukt.';
  }

  @override
  String get itemDeleted => 'Vienums izdzēsts';

  @override
  String get noPlayableTrailerFound =>
      'Nav atrasts neviens atskaņojams reklāmkadri.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Neatbalstīts grāmatas formāts: .$extension';
  }

  @override
  String get audioTrack => 'Audio celiņš';

  @override
  String get subtitleTrack => 'Subtitru celiņš';

  @override
  String get none => 'Nav';

  @override
  String get downloadSubtitlesLabel => 'Lejupielādēt subtitrus...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Meklējiet, izmantojot spraudni OpenSubtitles';

  @override
  String get downloadSubtitles => 'Lejupielādēt subtitrus';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'Atlasītie subtitri nav derīgi.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitri lejupielādēti un atlasīti: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitri lejupielādēti. Var paiet kāds brīdis, līdz tas tiks parādīts, kamēr Jellyfin atsvaidzinās vienumu.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nav atrasti attālināti subtitri vaicājumam $language.';
  }

  @override
  String get selectVersion => 'Atlasiet Versija';

  @override
  String versionNumber(int number) {
    return 'Versija $number';
  }

  @override
  String get downloadAllQuality => 'Lejupielādēt visu — kvalitāte';

  @override
  String get downloadQuality => 'Lejupielādes kvalitāte';

  @override
  String get originalFileNoReencoding =>
      'Oriģinālais fails, bez atkārtotas kodēšanas';

  @override
  String get originalFilesNoReencoding =>
      'Oriģinālie faili, bez atkārtotas kodēšanas';

  @override
  String get noEpisodesLoaded => 'Nav ielādēta neviena sērija';

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
    return 'Notiek lejupielāde $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Dzēst lejupielādētos failus';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Vai dzēst vietējos failus $typeLabel?\n\nTas atbrīvos vietu krātuvē. Vēlāk varat atkārtoti lejupielādēt.';
  }

  @override
  String get downloadedFilesDeleted => 'Lejupielādētie faili ir izdzēsti';

  @override
  String get failedToDeleteFiles => 'Neizdevās izdzēst failus';

  @override
  String get deleteFiles => 'Dzēst failus';

  @override
  String get director => 'DIREKTORS';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'REŽISORI';

  @override
  String get writer => 'SCENĀRISTS';

  @override
  String get writers => 'SCENĀRISTI';

  @override
  String get studio => 'STUDIJA';

  @override
  String studioMoreCount(int count) {
    return '+$count vairāk';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Epizodes';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Sērija $number';
  }

  @override
  String chapterNumber(int number) {
    return 'nodaļa $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count celiņi',
      one: '$count celiņš',
      zero: '$count celiņu',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nodaļas',
      one: '$count nodaļa',
      zero: '$count nodaļu',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Dzimis $date';
  }

  @override
  String died(String date) {
    return 'Miris $date';
  }

  @override
  String age(int age) {
    return 'Vecums $age';
  }

  @override
  String get showLess => 'Rādīt mazāk';

  @override
  String get readMore => 'Lasīt vairāk';

  @override
  String get shuffle => 'Jaukt';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Jaukt visu mūziku';

  @override
  String get carSignInPrompt => 'Pierakstieties Moonfin savā tālrunī';

  @override
  String get carServerUnreachable => 'Nevar sasniegt serveri';

  @override
  String downloadsCount(int count) {
    return '$count lejupielādes';
  }

  @override
  String get perfectMatch => 'Perfekta sakritība';

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
    return 'Lai izmantotu attālo apakšvirsrakstu $action, šim lietotājam ir nepieciešama Jellyfin subtitru pārvaldības atļauja.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Šo vienumu nevarēja atrast serverī attālajam apakšvirsrakstam $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Tālvadības apakšvirsraksts $action neizdevās: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Attālais apakšvirsraksts $action neizdevās (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Neizdevās izveidot $action attālos subtitrus.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'visas lejupielādētās sērijas \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'visas šīs sezonas lejupielādētās sērijas';

  @override
  String get stillWatching => 'Vai joprojām skatāties?';

  @override
  String get unableToLoadTrailerStream => 'Nevar ielādēt reklāmkadru straumi.';

  @override
  String get trailerTimedOut => 'Iekraušanas laikā piekabei iestājās noildze.';

  @override
  String get playbackFailedForTrailer =>
      'Šī reklāmkadru atskaņošana neizdevās.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Bezsaistes atskaņošanas laikā apraide nav pieejama.';

  @override
  String castActionFailed(String label, String error) {
    return '$label darbība neizdevās: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Neizdevās iestatīt apraides skaļumu: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label vadīklas';
  }

  @override
  String get deviceVolume => 'Ierīces skaļums';

  @override
  String get unavailable => 'Nav pieejams';

  @override
  String get pause => 'Pauze';

  @override
  String get syncPosition => 'Sinhronizācijas pozīcija';

  @override
  String stopCast(String label) {
    return 'Apturēt $label';
  }

  @override
  String get queueIsEmpty => 'Rinda ir tukša';

  @override
  String trackNumber(int number) {
    return 'Izsekot $number';
  }

  @override
  String get remotePlayback => 'Attālā atskaņošana';

  @override
  String get castingToGoogleCast => 'Notiek apraide uz Google Cast';

  @override
  String get castingViaAirPlay => 'Apraide, izmantojot AirPlay';

  @override
  String get castingViaDlna => 'Apraide, izmantojot DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekundes';
  }

  @override
  String get longPressToUnlock => 'Turiet nospiestu, lai atbloķētu';

  @override
  String get off => 'Izslēgts';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automātiski';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mb/s';
  }

  @override
  String get audioDelay => 'Audio aizkave';

  @override
  String delayMinusMs(int value) {
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
  }

  @override
  String get subtitleDelay => 'Subtitru aizkave';

  @override
  String get reset => 'Atiestatīt';

  @override
  String get unknown => 'Nezināms';

  @override
  String get playbackInformation => 'Atskaņošanas informācija';

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
  String get playback => 'Atskaņošana';

  @override
  String get playMethod => 'Spēlēšanas metode';

  @override
  String get directPlay => 'Tiešā atskaņošana';

  @override
  String get directStream => 'Tiešā straume';

  @override
  String get transcoding => 'Pārkodēšana';

  @override
  String get transcodeReasons => 'Pārkodēšanas iemesli';

  @override
  String get player => 'Atskaņotājs';

  @override
  String get container => 'Konteiners';

  @override
  String get bitrate => 'Bitu pārraides ātrums';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Izšķirtspēja';

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
  String get track => 'Celiņš';

  @override
  String get channels => 'Kanāli';

  @override
  String get format => 'Formāts';

  @override
  String get external => 'Ārējais';

  @override
  String get embedded => 'Iegults';

  @override
  String castSessionError(String protocol) {
    return '$protocol sesijas kļūda';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Neizdevās ielādēt grāmatas informāciju: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB renderēšana lietotnē vēl nav pieejama šajā platformā.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Šo formātu (.$extension) vēl nevar renderēt lietotnē.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Iegultā dokumentu renderēšana šajā platformā nav pieejama.';

  @override
  String get couldNotOpenExternalViewer => 'Nevarēja atvērt ārējo skatītāju.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Neizdevās atvērt lietotnes lasītāju: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Grāmatzīme jau ir saglabāta $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Pievienota grāmatzīme: $label';
  }

  @override
  String get noBookmarksYet =>
      'Vēl nav nevienas grāmatzīmes.\nLasīšanas laikā pieskarieties grāmatzīmes ikonai, lai saglabātu savu pozīciju.';

  @override
  String get noTableOfContentsAvailable => 'Nav pieejams satura rādītājs';

  @override
  String pageLabel(int number) {
    return 'Lapa $number';
  }

  @override
  String get position => 'Pozīcija';

  @override
  String get bookReader => 'Grāmatu lasītājs';

  @override
  String formatExtension(String extension) {
    return 'Formāts: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% lasīts';
  }

  @override
  String get updating => 'Notiek atjaunināšana...';

  @override
  String get markUnread => 'Atzīmēt kā nelasītu';

  @override
  String get markAsRead => 'Atzīmēt kā lasītu';

  @override
  String get reloadReader => 'Pārlādēt lasītāju';

  @override
  String get noPagesFound => 'Nav atrasta neviena lapa.';

  @override
  String get failedToDecodePageImage => 'Neizdevās atšifrēt lapas attēlu.';

  @override
  String resetZoom(String zoom) {
    return 'Atiestatīt tālummaiņu (${zoom}x)';
  }

  @override
  String get singlePage => 'Viena lapa';

  @override
  String get twoPageSpread => 'Divu lappušu izkliede';

  @override
  String get addBookmark => 'Pievienot grāmatzīmi';

  @override
  String get bookmarksEllipsis => 'Grāmatzīmes...';

  @override
  String get markedAsRead => 'Atzīmēts kā izlasīts';

  @override
  String get markedAsUnread => 'Atzīmēts kā nelasīts';

  @override
  String failedToUpdateReadState(String error) {
    return 'Neizdevās atjaunināt lasīšanas stāvokli: $error';
  }

  @override
  String get themeSystem => 'Tēma: Sistēma';

  @override
  String get themeLight => 'Tēma: Gaisma';

  @override
  String get themeDark => 'Tēma: Tumšs';

  @override
  String get themeSepia => 'Tēma: Sēpija';

  @override
  String get invertColorsFixedLayout => 'Invertēt krāsas (fiksēts izkārtojums)';

  @override
  String get invertColorsPdf => 'Invertēt krāsas (PDF)';

  @override
  String get preparingInAppReader =>
      'Notiek lietotnes lasītāja sagatavošana...';

  @override
  String get pdfDataNotAvailable => 'PDF dati nav pieejami.';

  @override
  String get readerFallbackModeActive => 'Aktīvs lasītāja atkāpšanās režīms';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Šī platforma nevar mitināt iegulto dokumentu programmu $extension failiem.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Izmantojiet Reload Reader pēc pārslēgšanās uz atbalstītu platformas mērķi (Android, iOS, macOS).';

  @override
  String get openExternally => 'Atvērt ārēji';

  @override
  String get noEpubChaptersFound => 'Nav atrasta neviena EPUB nodaļa.';

  @override
  String get readerNotReady => 'Lasītājs nav gatavs.';

  @override
  String get seriesRecordings => 'Sērijas ieraksti';

  @override
  String get now => 'Tagad';

  @override
  String get sports => 'Sports';

  @override
  String get news => 'Jaunumi';

  @override
  String get kids => 'Bērni';

  @override
  String get premiere => 'Pirmizrāde';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Ceļvedis laika skala';

  @override
  String failedToLoadGuide(String error) {
    return 'Neizdevās ielādēt rokasgrāmatu: $error';
  }

  @override
  String get noChannelsFound => 'Nav atrasts neviens kanāls';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'TIEŠRAIDĒ';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Nākamā: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Atlicis $minutes min';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Atlicis $hours h';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Atlicis $hours h $minutes min';
  }

  @override
  String get movie => 'Filma';

  @override
  String get removedFromFavoriteChannels =>
      'Noņemts no iecienītākajiem kanāliem';

  @override
  String get addedToFavoriteChannels => 'Pievienots iecienītākajiem kanāliem';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Neizdevās atjaunināt iecienītāko kanālu';

  @override
  String get unfavoriteChannel => 'Neiecienīts kanāls';

  @override
  String get favoriteChannel => 'Mīļākais kanāls';

  @override
  String get record => 'Ierakstīt';

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
  String get cancelRecordingAction => 'Atcelt ierakstīšanu';

  @override
  String get programSetToRecord => 'Programma iestatīta ierakstīšanai';

  @override
  String get recordingCancelled => 'Ieraksts atcelts';

  @override
  String get unableToCreateRecording => 'Nevar izveidot ierakstu';

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
  String get watch => 'Skatīties';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Aizvērt';

  @override
  String failedToPlayChannel(String name) {
    return 'Neizdevās atskaņot $name';
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
  String get failedToLoadRecordings => 'Neizdevās ielādēt ierakstus';

  @override
  String get scheduledInNext24Hours => 'Plānots nākamo 24 stundu laikā';

  @override
  String get recentRecordings => 'Jaunākie ieraksti';

  @override
  String get tvSeries => 'TV seriāls';

  @override
  String get failedToLoadSchedule => 'Neizdevās ielādēt grafiku';

  @override
  String get noScheduledRecordings => 'Nav ieplānotu ierakstu';

  @override
  String get cancelRecording => 'Vai atcelt ierakstīšanu?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Vai atcelt ieplānoto \"$name\" ierakstīšanu?';
  }

  @override
  String get no => 'Nē';

  @override
  String get yesCancel => 'Jā, Atcelt';

  @override
  String get failedToCancelRecording => 'Neizdevās atcelt ierakstīšanu';

  @override
  String get failedToLoadSeriesRecordings =>
      'Neizdevās ielādēt sērijas ierakstus';

  @override
  String get noSeriesRecordings => 'Nav sēriju ierakstu';

  @override
  String get cancelSeriesRecording => 'Atcelt sērijas ierakstīšanu';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Vai atcelt sērijas ierakstīšanu?';

  @override
  String stopRecordingName(String name) {
    return 'Vai pārtraukt ierakstīšanu \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Neizdevās atcelt sērijas ierakstīšanu';

  @override
  String get searchThisLibrary => 'Meklēt šajā bibliotēkā...';

  @override
  String get searchEllipsis => 'Meklēt...';

  @override
  String noResultsForQuery(String query) {
    return 'Nav rezultātu vaicājumam \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Meklēšana neizdevās: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr konta veids';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Vietējais';

  @override
  String get savedMedia => 'Saglabātie multivides līdzekļi';

  @override
  String get tvShows => 'TV šovi';

  @override
  String get music => 'Mūzika';

  @override
  String get musicAlbums => 'Mūzikas albumi';

  @override
  String get noMediaInFilter => 'Šajā filtrā nav multivides';

  @override
  String get noDownloadedMediaYet => 'Vēl nav lejupielādēta multivide';

  @override
  String get browseLibrary => 'Pārlūkot bibliotēku';

  @override
  String get deleteDownload => 'Dzēst lejupielādi';

  @override
  String removeItemAndFiles(String name) {
    return 'Vai noņemt \"$name\" un tā failus?';
  }

  @override
  String tracksCount(int count) {
    return '$count dziesmas';
  }

  @override
  String get album => 'Albums';

  @override
  String get playAlbum => 'Atskaņot albumu';

  @override
  String failedToLoadAlbum(String error) {
    return 'Neizdevās ielādēt albumu: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name nav atrasts neviens lejupielādēts ieraksts.';
  }

  @override
  String get season => 'Sezona';

  @override
  String get errorLoadingEpisodes => 'Ielādējot sērijas, radās kļūda';

  @override
  String get noDownloadedEpisodes => 'Nav lejupielādētu sēriju';

  @override
  String get deleteEpisode => 'Dzēst sēriju';

  @override
  String removeName(String name) {
    return 'Vai noņemt \"$name\"?';
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
    return 'Sērija $number';
  }

  @override
  String get seriesNotFound => 'Sērija nav atrasta';

  @override
  String get errorLoadingSeries => 'Ielādējot sēriju, radās kļūda';

  @override
  String get downloadedEpisodes => 'Lejupielādētās sērijas';

  @override
  String seasonNumber(int number) {
    return 'Sezona $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Īpašie piedāvājumi';

  @override
  String get deleteSeason => 'Dzēst sezonu';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Vai dzēst visas lejupielādētās sērijas $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count epizodes',
      one: '$count epizode',
      zero: '$count epizožu',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Krātuves pārvaldība';

  @override
  String get storageBreakdown => 'Krātuves sadalījums';

  @override
  String get downloadedItems => 'Lejupielādētie vienumi';

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
  String get storageLimit => 'Krātuves ierobežojums';

  @override
  String get noLimit => 'Nav ierobežojumu';

  @override
  String get deleteAllDownloads => 'Dzēst visas lejupielādes';

  @override
  String get deleteAllDownloadsWarning =>
      'Tādējādi tiks noņemti visi lejupielādētie multivides faili, un darbību nevarēs atsaukt.';

  @override
  String get deleteAll => 'Dzēst visu';

  @override
  String get deleteSelected => 'Dzēst atlasītos';

  @override
  String deleteSelectedCount(int count) {
    return 'Vai dzēst $count lejupielādētos vienumus?';
  }

  @override
  String get musicAndAudiobooks => 'Mūzika un audiogrāmatas';

  @override
  String get images => 'Attēli';

  @override
  String get database => 'Datu bāze';

  @override
  String ofStorageLimit(String limit) {
    return 'no $limit ierobežojuma';
  }

  @override
  String get settings => 'Iestatījumi';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Autentifikācija';

  @override
  String get autoLoginServerManagement =>
      'Automātiska pieteikšanās, servera pārvaldība';

  @override
  String get pinCode => 'PIN kods';

  @override
  String get setUpPinCodeProtection => 'Iestatiet PIN koda aizsardzību';

  @override
  String get parentalControls => 'Vecāku kontrole';

  @override
  String get contentRatingRestrictions => 'Satura vērtējuma ierobežojumi';

  @override
  String get bitRateResolutionBehavior =>
      'Bitu pārraides ātrums, izšķirtspēja, uzvedība';

  @override
  String get languageSizeAppearance => 'Valoda, izmērs, izskats';

  @override
  String get qualityStorage => 'Kvalitāte, uzglabāšana';

  @override
  String get mediaRequestIntegration => 'Multivides pieprasījumu integrācija';

  @override
  String get switchServer => 'Pārslēgt serveri';

  @override
  String get signOut => 'Izrakstīties';

  @override
  String get versionLicenses => 'Versija, licences';

  @override
  String get account => 'Konts';

  @override
  String get signInAndSecurity => 'Pierakstīšanās un drošība';

  @override
  String get administration => 'Administrācija';

  @override
  String get serverSettingsUsersLibraries =>
      'Servera iestatījumi, lietotāji, bibliotēkas';

  @override
  String get customization => 'Pielāgošana';

  @override
  String get themeAndLayout => 'Tēma un izkārtojums';

  @override
  String get videoAndSubtitles => 'Video un subtitri';

  @override
  String get pluginAndRequests => 'Spraudnis un pieprasījumi';

  @override
  String get customizeAccountPlaybackInterface =>
      'Pielāgojiet konta, atskaņošanas un saskarnes darbību';

  @override
  String optionsCount(int count) {
    return '$count opcijas';
  }

  @override
  String get themeAndAppearance => 'Tēma un izskats';

  @override
  String get focusBorderColor => 'Fokusa apmales krāsa';

  @override
  String get watchedIndicators => 'Noskatītie rādītāji';

  @override
  String get always => 'Vienmēr';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Paslēpt neskatītos';

  @override
  String get episodesOnly => 'Tikai epizodes';

  @override
  String get never => 'Nekad';

  @override
  String get focusExpansionAnimation => 'Fokusa paplašināšanas animācija';

  @override
  String get desktopUiScale => 'Darbvirsmas lietotāja interfeisa mērogs';

  @override
  String get scaleFocusedCards =>
      'Mērogojiet fokusētas vai kursora kārtis un flīzes';

  @override
  String get seriesThumbnails => 'Sērijas sīktēli';

  @override
  String get seriesThumbnailsDescription =>
      'Tikai epizodes: izmantojiet sērijas mākslas darbus, kas atbilst katram rindu attēla veidam';

  @override
  String get homeRowInfoOverlay => 'Sākuma rindas informācijas pārklājums';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Rādīt nosaukumu un metadatus, pārlūkojot sākuma rindas';

  @override
  String get clockDisplay => 'Pulksteņa displejs';

  @override
  String get inMenus => 'Izvēlnēs';

  @override
  String get inVideo => 'Videoklipā';

  @override
  String get seasonalEffects => 'Sezonas efekti';

  @override
  String get seasonalEffectsDescription =>
      'Vizuālie efekti un sezonas dekorācijas';

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
  String get snow => 'Sniegs';

  @override
  String get fireworks => 'Uguņošana';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Krītošās lapas';

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
  String get themeMusic => 'Tēma Mūzika';

  @override
  String get playThemeMusicOnDetailPages =>
      'Atskaņojiet motīvu mūziku detalizētās informācijas lapās';

  @override
  String get themeMusicVolume => 'Tēma Mūzikas apjoms';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Motīvā mūzika sākuma rindās';

  @override
  String get playWhenBrowsingHomeScreen => 'Atskaņot, pārlūkojot sākuma ekrānu';

  @override
  String get loopThemeMusic => 'Atkārtot tēmas mūziku';

  @override
  String get loopThemeMusicSubtitle =>
      'Atkārtot celiņu, nevis atskaņot to vienu reizi';

  @override
  String get detailsBackgroundBlur => 'Sīkāka informācija Fona aizmiglojums';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value px';
  }

  @override
  String get browsingBackgroundBlur => 'Pārlūkošanas fona aizmiglojums';

  @override
  String get maxStreamingBitrate =>
      'Maksimālais straumēšanas bitu pārraides ātrums';

  @override
  String get maxResolution => 'Maksimālā izšķirtspēja';

  @override
  String get playerZoomMode => 'Spēlētāja tālummaiņas režīms';

  @override
  String get settingsScrollWheelAction => 'Peles ritenītis';

  @override
  String get settingsScrollWheelActionDescription =>
      'Izvēlieties, ko atskaņošanas laikā dara peles ritenīša ritināšana virs video.';

  @override
  String get scrollWheelActionOff => 'Izslēgts';

  @override
  String get scrollWheelActionSeek => 'Pārtīt (uz priekšu / atpakaļ)';

  @override
  String get scrollWheelActionVolume => 'Skaļums';

  @override
  String get playerTooltipVolume => 'Skaļums';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Automātiskā apgriešana';

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
  String get stretch => 'Izstiepties';

  @override
  String get refreshRateSwitching => 'Atsvaidzes intensitātes pārslēgšana';

  @override
  String get disabled => 'Atspējots';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Mērogs televizorā';

  @override
  String get scaleOnDevice => 'Mērogs ierīcē';

  @override
  String get trickPlay => 'Triku spēle';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Rādīt priekšskatījuma sīktēlus, kad meklējat';

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
  String get showDescriptionOnPause => 'Rādīt aprakstu pauzē';

  @override
  String get dimVideoShowOverview =>
      'Aptumšot video un rādīt kopsavilkuma tekstu, kamēr tas ir apturēts';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD bloķēšanas poga';

  @override
  String get osdLockButtonDescription =>
      'Rādīt bloķēšanas pogu, kas bloķē skāriena ievadi, līdz tiek ilgi nospiesta';

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
  String get audioBehavior => 'Audio uzvedība';

  @override
  String get downmixToStereo => 'Samaisa uz stereo';

  @override
  String get defaultAudioLanguage => 'Noklusējuma audio valoda';

  @override
  String get fallbackAudioLanguage => 'Rezerves audio valoda';

  @override
  String get preferDefaultAudioTrack => 'Priekšroka noklusējuma audio celiņam';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Dot priekšroku oriģinālajam audio celiņam, nevis lokalizētam dublējumam.';

  @override
  String get preferAudioDescription => 'Priekšroka audioaprakstu celiņiem';

  @override
  String get preferAudioDescriptionDescription =>
      'Dot priekšroku audioaprakstu celiņiem, nevis parastajiem celiņiem.';

  @override
  String get autoServerDefault => 'Automātiski (servera noklusējums)';

  @override
  String get english => 'angļu valoda';

  @override
  String get spanish => 'spāņu valoda';

  @override
  String get french => 'franču valoda';

  @override
  String get german => 'vācu';

  @override
  String get italian => 'itāļu valoda';

  @override
  String get portuguese => 'portugāļu';

  @override
  String get japanese => 'japāņi';

  @override
  String get korean => 'korejiešu';

  @override
  String get chinese => 'ķīniešu';

  @override
  String get russian => 'krievu valoda';

  @override
  String get arabic => 'arābu';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'holandiešu valoda';

  @override
  String get swedish => 'zviedru';

  @override
  String get norwegian => 'norvēģu';

  @override
  String get danish => 'dāņu';

  @override
  String get finnish => 'somu';

  @override
  String get polish => 'poļu';

  @override
  String get ac3Passthrough => 'AC3 caurlaide';

  @override
  String get dtsPassthrough => 'DTS caurlaide';

  @override
  String get trueHdSupport => 'TrueHD atbalsts';

  @override
  String get enableDtsPassthrough =>
      'Bitu plūsmas DTS audio tikai AVR; nepieciešams uztvērēja atbalsts un DTS avota celiņš';

  @override
  String get settingsAudioFallbackCodec => 'Audio atkāpšanās kodeks';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Izvēlieties formātu, uz kuru pārkodēt daudzkanālu audio, ja avota straumi nevar atskaņot tieši vai pārraidīt bez izmaiņām.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Automātiska noteikšana\n(ieteicams)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(noklusējums)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(tikai stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(efektīvs)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(bez zudumiem)';

  @override
  String get settingsMaxAudioChannels => 'Maksimālais audio kanālu skaits';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Norādiet savas audio sistēmas maksimālo kanālu skaitu. Daudzkanālu straumes, kas pārsniedz šo ierobežojumu, tiks samiksētas vai pārkodētas.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Automātiska noteikšana\n(aparatūras noklusējums)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 telpiskā skaņa';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 kvadrofoniskā';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 telpiskā skaņa';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 telpiskā skaņa';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 telpiskā skaņa';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 telpiskā skaņa';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (papildu)';

  @override
  String get settingsAudioCodecPassthrough => 'Kodeku caurlaide';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Iespējojiet tikai tos formātus, kurus atbalsta jūsu AVR vai HDMI izlietne.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 caurlaide';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core caurlaide';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA caurlaide';

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
  String get settingsAudioTrueHdPassthrough => 'TrueHD caurlaide';

  @override
  String get settingsDetectedAudioCapabilities => 'Atklātas audio iespējas';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Vēl nav pieejams izpildlaika iespēju momentuzņēmums.';

  @override
  String get settingsAudioRouteLabel => 'Maršruts';

  @override
  String get settingsAudioDecodeLabel => 'Atšifrēt';

  @override
  String get settingsAudioPassthroughLabel => 'Caurlaide';

  @override
  String get settingsAudioHdRoute => 'HD audio maršruts';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Skaļrunis';

  @override
  String get settingsAudioRouteHeadphones => 'Austiņas';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get nightMode => 'Nakts režīms';

  @override
  String get compressDynamicRange => 'Saspiest dinamisko diapazonu';

  @override
  String get advancedMpv => 'Uzlabots mpv';

  @override
  String get enableCustomMpvConf => 'Iespējot pielāgoto mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Pirms atskaņošanas sākuma lietojiet lietotāja norādītu mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => 'Nedrošas papildu mpv opcijas';

  @override
  String get unsafeMpvOptionsDescription =>
      'Atļaut plašāku mpv opciju kopu. Var traucēt atskaņošanas darbību.';

  @override
  String get hardwareDecoding => 'Aparatūras dekodēšana';

  @override
  String get hardwareDecodingSubtitle =>
      'Var uzlabot veiktspēju, taču dažās ierīcēs var rasties atskaņošanas problēmas.';

  @override
  String get nextUpAndQueuing => 'Nākamais augšā un rindā';

  @override
  String get nextUpDisplay => 'Nākamais displejs';

  @override
  String get extended => 'Pagarināts';

  @override
  String get minimal => 'Minimāli';

  @override
  String get nextUpTimeout => 'Nākamais Up Timeout';

  @override
  String secondsValue(int value) {
    return '$value s';
  }

  @override
  String get mediaQueuing => 'Multivides rinda';

  @override
  String get autoQueueNextEpisodes => 'Automātiski iestatīt nākamās sērijas';

  @override
  String get stillWatchingPrompt => 'Joprojām skatos uzvedni';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Pēc $episodes epizodēm / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Atsākt un izlaist';

  @override
  String get resumeRewind => 'Atsākt attīšanu';

  @override
  String get unpauseRewind => 'Attīt atpakaļ';

  @override
  String get fiveSeconds => '5 sekundes';

  @override
  String get tenSeconds => '10 sekundes';

  @override
  String get fifteenSeconds => '15 sekundes';

  @override
  String get thirtySeconds => '30 sekundes';

  @override
  String get skipBackLength => 'Izlaist atpakaļ garumu';

  @override
  String get skipForwardLength => 'Izlaist garumu uz priekšu';

  @override
  String get customMpvConfPath => 'Pielāgots mpv.conf ceļš';

  @override
  String get notSetMpvConf =>
      'Nav iestatīts. Moonfin izmēģinās noklusējuma mpv.conf lietotņu/datu mapēs.';

  @override
  String get selectMpvConf => 'Atlasiet mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stila iestatījumi (izmērs, krāsa, nobīde) attiecas uz teksta subtitriem (SRT, VTT, TTML). ASS/SSA subtitriem tiek izmantots savs iegultais stils, ja vien nav izslēgta ASS/SSA tiešā atskaņošana. Bitkartes subtitrus (PGS, DVB, VobSub) nevar pārveidot.';

  @override
  String get defaultSubtitleLanguage => 'Noklusējuma subtitru valoda';

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
  String get defaultToNoSubtitles => 'Pēc noklusējuma nav subtitru';

  @override
  String get turnOffSubtitlesByDefault =>
      'Pēc noklusējuma izslēdziet subtitrus';

  @override
  String get subtitleSize => 'Subtitru lielums';

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
  String get textFillColor => 'Teksta aizpildījuma krāsa';

  @override
  String get backgroundColor => 'Fona krāsa';

  @override
  String get textStrokeColor => 'Teksta gājiena krāsa';

  @override
  String get subtitleCustomization => 'Subtitru pielāgošana';

  @override
  String get subtitleCustomizationDescription => 'Pielāgojiet subtitru izskatu';

  @override
  String get subtitleMode => 'Subtitru režīms';

  @override
  String get subtitleModeFlagged => 'Atzīmētie';

  @override
  String get subtitleModeAlways => 'Vienmēr';

  @override
  String get subtitleModeForeign => 'Svešvaloda';

  @override
  String get subtitleModeForced => 'Piespiedu';

  @override
  String get subtitleModeFlaggedDescription =>
      'Atskaņo celiņus, kas multivides faila metadatos atzīmēti kā „default“ vai „forced“.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Automātiski ielādē un rāda subtitrus katru reizi, kad sākas video.';

  @override
  String get subtitleModeForeignDescription =>
      'Automātiski ieslēdz subtitrus, ja noklusējuma audio celiņš ir svešvalodā.';

  @override
  String get subtitleModeForcedDescription =>
      'Ielādē tikai subtitrus, kas nepārprotami atzīmēti ar „forced“ metadatu karodziņu.';

  @override
  String get subtitleModeNoneDescription =>
      'Pilnībā atspējo automātisku subtitru ielādi.';

  @override
  String get fallbackSubtitleLanguage => 'Rezerves subtitru valoda';

  @override
  String get subtitleStream => 'Subtitru straume';

  @override
  String get subtitlePreviewText => 'Ātrā brūnā lapsa lec pāri slinkajam sunim';

  @override
  String get verticalOffset => 'Vertikālā nobīde';

  @override
  String get pgsDirectPlay => 'PGS tiešā spēle';

  @override
  String get directPlayPgsSubtitles => 'Tiešā atskaņošana PGS subtitriem';

  @override
  String get assSsaDirectPlay => 'ASS/SSA tiešā atskaņošana';

  @override
  String get directPlayAssSsaSubtitles =>
      'Tiešā atskaņošana ASS/SSA subtitriem';

  @override
  String get white => 'Balts';

  @override
  String get black => 'Melns';

  @override
  String get yellow => 'Dzeltens';

  @override
  String get green => 'Zaļš';

  @override
  String get cyan => 'Ciāna';

  @override
  String get red => 'Sarkans';

  @override
  String get transparent => 'Caurspīdīgs';

  @override
  String get semiTransparentBlack => 'Daļēji caurspīdīgs melns';

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
  String get global => 'Globāli';

  @override
  String get desktop => 'Darbvirsma';

  @override
  String get mobile => 'Mobilais';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Ielādēti $profile profila iestatījumi.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Neizdevās ielādēt $profile profila iestatījumus.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Vietējie iestatījumi sinhronizēti ar $profile profilu.';
  }

  @override
  String get syncing => 'Sinhronizē...';

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
  String get profileSyncHidden => 'Profila sinhronizācija ir paslēpta';

  @override
  String get enablePluginSyncDescription =>
      'Iespējojiet servera spraudņa sinhronizāciju spraudņa iestatījumos, lai šeit rādītu profila vadīklas.';

  @override
  String get quality => 'Kvalitāte';

  @override
  String get defaultDownloadQuality => 'Noklusējuma lejupielādes kvalitāte';

  @override
  String get network => 'Tīkls';

  @override
  String get wifiOnlyDownloads => 'Tikai WiFi lejupielādes';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Rādīt lejupielādes serverī';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Ļaut servera administratoram redzēt jūsu pārkodētās lejupielādes vadības panelī';

  @override
  String get onlyDownloadOnWifi =>
      'Lejupielādējiet tikai tad, kad ir izveidots savienojums ar WiFi';

  @override
  String get storage => 'Uzglabāšana';

  @override
  String get storageUsed => 'Uzglabāšana Lietota';

  @override
  String get manage => 'Pārvaldīt';

  @override
  String get calculating => 'Notiek aprēķināšana...';

  @override
  String get downloadLocation => 'Lejupielādes atrašanās vieta';

  @override
  String get defaultLabel => 'Noklusējums';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Saglabāt mapē Lejupielādes';

  @override
  String get downloadsVisibleToOtherApps =>
      'Lejupielādes/Moonfin — redzams citām lietotnēm';

  @override
  String get dangerZone => 'Bīstamā zona';

  @override
  String get clearAllDownloads => 'Notīrīt visas lejupielādes';

  @override
  String get original => 'Oriģināls';

  @override
  String get changeDownloadLocation => 'Mainiet lejupielādes vietu';

  @override
  String get changeDownloadLocationDescription =>
      'Jaunās lejupielādes tiks saglabātas atlasītajā mapē. Esošās lejupielādes paliks to pašreizējā atrašanās vietā, un tās var pārvaldīt krātuves iestatījumos.';

  @override
  String get confirm => 'Apstiprināt';

  @override
  String get cannotWriteToFolder =>
      'Nevar rakstīt atlasītajā mapē. Lūdzu, izvēlieties citu atrašanās vietu vai piešķiriet krātuves atļaujas.';

  @override
  String get saveToDownloadsFolderQuestion => 'Vai saglabāt mapē Lejupielādes?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Lejupielādētie multivide tiks saglabāti jūsu ierīces mapē Lejupielādes/Moonfin. Šie faili būs redzami citām lietotnēm, piemēram, jūsu galerijai vai mūzikas atskaņotājam.\n\nEsošās lejupielādes paliks to pašreizējā atrašanās vietā.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Iespējot';

  @override
  String get clearAllDownloadsWarning =>
      'Tādējādi tiks dzēsti visi lejupielādētie multivides līdzekļi, un darbību nevarēs atsaukt.';

  @override
  String get clearAll => 'Notīrīt visu';

  @override
  String get navigationStyle => 'Navigācijas stils';

  @override
  String get topBar => 'Augšējā josla';

  @override
  String get leftSidebar => 'Kreisā sānjosla';

  @override
  String get showShuffleButton => 'Rādīt jaukšanas pogu';

  @override
  String get showGenresButton => 'Poga Rādīt žanrus';

  @override
  String get showFavoritesButton => 'Rādīt pogu Izlase';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Rādīt bibliotēkas rīkjoslā';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'Vienmēr rādīt navigācijas joslas nosaukumus';

  @override
  String get showSeerrButton => 'Rādīt Seerr pogu';

  @override
  String get navbarOpacity => 'Navigācijas joslas necaurredzamība';

  @override
  String get navbarColor => 'Navigbar Krāsa';

  @override
  String get gray => 'Pelēks';

  @override
  String get darkBlue => 'Tumši zils';

  @override
  String get purple => 'Violeta';

  @override
  String get teal => 'Zilganzaļa';

  @override
  String get navy => 'Tumši zila';

  @override
  String get charcoal => 'Ogles';

  @override
  String get brown => 'Brūns';

  @override
  String get darkRed => 'Tumši Sarkans';

  @override
  String get darkGreen => 'Tumši zaļš';

  @override
  String get slate => 'Šīferis';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Bibliotēkas displejs';

  @override
  String get posterLabel => 'Plakāts';

  @override
  String get thumbnailLabel => 'Sīktēls';

  @override
  String get bannerLabel => 'Reklāmkarogs';

  @override
  String get overridePerLibrarySettings =>
      'Ignorēt katras bibliotēkas iestatījumus';

  @override
  String get applyImageTypeToAllLibraries =>
      'Lietojiet attēla veidu visām bibliotēkām';

  @override
  String get multiServerLibraries => 'Vairāku serveru bibliotēkas';

  @override
  String get showLibrariesFromAllServers =>
      'Rādīt bibliotēkas no visiem pievienotajiem serveriem';

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
  String get groupItemsIntoCollections => 'Grupēt vienumus kolekcijās';

  @override
  String get hideCollectionAssociatedItems =>
      'Pārlūkojot bibliotēkas, slēpt ar kolekcijām saistītos bibliotēkas vienumus';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Paziņojums par bibliotēkas grupēšanu';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Lai izmantotu šo iestatījumu, savā Jellyfin vai Emby serverī bibliotēkas attēlošanas iestatījumos iespējojiet bibliotēkas opciju „Grupēt filmas kolekcijās“ un/vai „Grupēt seriālus kolekcijās“.';

  @override
  String get libraryVisibility => 'Bibliotēkas redzamība';

  @override
  String get libraryVisibilityDescription =>
      'Pārslēgt mājas lapas redzamību katrai bibliotēkai. Restartējiet Moonfin, lai izmaiņas stātos spēkā.';

  @override
  String get showInNavigation => 'Rādīt navigācijā';

  @override
  String get showInLatestMedia => 'Rādīt jaunākajos medijos';

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
  String get sourceLibraries => 'Avotu bibliotēkas';

  @override
  String get sourceCollections => 'Avotu kolekcijas';

  @override
  String get excludedGenres => 'Izslēgtie žanri';

  @override
  String get selectAll => 'Atlasiet visu';

  @override
  String itemsSelected(int count) {
    return '$count atlasīts';
  }

  @override
  String get mediaBar => 'Multivides josla';

  @override
  String get mediaSources => 'Multivides avoti';

  @override
  String get behavior => 'Uzvedība';

  @override
  String get seconds => 'sekundes';

  @override
  String get mediaBarMode => 'Multivides joslas stils';

  @override
  String get mediaBarModeDescription =>
      'Izvēlieties starp dažādiem multivides joslas stiliem vai izslēdziet multivides joslu';

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
  String get mediaBarModeOff => 'Izslēgts';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Iespējot multivides joslu';

  @override
  String get showFeaturedContentSlideshow =>
      'Rādīt piedāvātā satura slaidrādi sākumlapā';

  @override
  String get contentType => 'Satura veids';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Filmas un TV šovi';

  @override
  String get moviesOnly => 'Tikai filmas';

  @override
  String get tvShowsOnly => 'Tikai TV pārraides';

  @override
  String get itemCount => 'Preču skaits';

  @override
  String get noneSelected => 'Nav atlasīts neviens';

  @override
  String get noneExcluded => 'Neviens nav izslēgts';

  @override
  String get autoAdvance => 'Automātiskā pāreja';

  @override
  String get autoAdvanceSlides => 'Automātiski pāriet uz nākamo slaidu';

  @override
  String get autoAdvanceInterval => 'Automātiskās pārejas intervāls';

  @override
  String get trailerPreview => 'Reklāmkadru priekšskatījums';

  @override
  String get autoPlayTrailers =>
      'Automātiski atskaņojiet reklāmkadrus multivides joslā pēc 3 sekundēm';

  @override
  String get trailerAudio => 'Treilera audio';

  @override
  String get enableTrailerAudio => 'Iespējot treileru audio multivides joslā';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Sērijas priekšskatījums';

  @override
  String get mediaPreview => 'Multivides priekšskatījums';

  @override
  String get episodePreviewDescription =>
      'Atskaņojiet 30 sekunžu iekļautu priekšskatījumu fokusētās, kursoru novietotās vai ilgi nospiestās kartēs';

  @override
  String get mediaPreviewDescription =>
      'Atskaņojiet 30 sekunžu iekļauto priekšskatījumu fokusētās, kursoru novietotās vai ilgi nospiestās kartēs';

  @override
  String get previewAudio => 'Audio priekšskatījums';

  @override
  String get enablePreviewAudio =>
      'Iespējot audio reklāmkadru un sēriju priekšskatījumiem';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Jaunākie mediji';

  @override
  String get recentlyReleased => 'Nesen Izlaists';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Mani mediji';

  @override
  String get myMediaSmall => 'Mani multivide (mazi)';

  @override
  String get continueWatching => 'Turpināt skatīties';

  @override
  String get resumeAudio => 'Atsākt audio';

  @override
  String get resumeBooks => 'Atsākt grāmatas';

  @override
  String get activeRecordings => 'Aktīvie ieraksti';

  @override
  String get playlists => 'Atskaņošanas saraksti';

  @override
  String get liveTV => 'TV tiešraide';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Atiestatīt uz noklusējuma iestatījumiem';

  @override
  String get homeRowPosterSize => 'Sākuma rindas plakāta izmērs';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurējiet attēla veidu katrai iespējotajai sākuma rindai';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Apvienojiet Turpināt skatīšanos un Tālāk';

  @override
  String get combineBothRows => 'Apvienojiet abas rindas vienā sākuma sadaļā';

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
  String get fullScreenRows => 'Izvērstas sākuma ekrāna rindas';

  @override
  String get fullScreenRowsDescription =>
      'Rādīt tikai vienu sākuma ekrāna rindu';

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
  String get perRowSettings => 'Iestatījumi katrā rindā';

  @override
  String get autoLogin => 'Automātiska pieteikšanās';

  @override
  String get lastUser => 'Pēdējais lietotājs';

  @override
  String get currentUser => 'Pašreizējais lietotājs';

  @override
  String get alwaysAuthenticate => 'Vienmēr autentificēt';

  @override
  String get requirePasswordWithToken =>
      'Pieprasīt paroli pat ar saglabātu marķieri';

  @override
  String get confirmExit => 'Apstipriniet izeju';

  @override
  String get showConfirmationBeforeExiting =>
      'Rādīt apstiprinājumu pirms iziešanas';

  @override
  String get blockContentWithRatings => 'Bloķēt saturu ar šādiem vērtējumiem:';

  @override
  String get noContentRatingsFound =>
      'Šajā serverī vēl nav atrasts neviens satura vērtējums.';

  @override
  String get couldNotLoadServerRatings =>
      'Nevarēja ielādēt servera vērtējumus. Tiek rādīti tikai saglabātie vērtējumi.';

  @override
  String get couldNotRefreshRatings =>
      'Nevarēja atsvaidzināt vērtējumus no servera. Tiek rādīti saglabātie vērtējumi.';

  @override
  String get enablePinCode => 'Iespējot PIN kodu';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess => 'Pieprasīt PIN, lai piekļūtu savam kontam';

  @override
  String get changePin => 'Mainīt PIN';

  @override
  String get setNewPinCode => 'Iestatiet jaunu PIN kodu';

  @override
  String get removePin => 'Noņemiet PIN';

  @override
  String get removePinProtection => 'Noņemiet PIN koda aizsardzību';

  @override
  String get screensaver => 'Ekrānsaudzētājs';

  @override
  String get inAppScreensaver => 'Lietotnē iebūvēts ekrānsaudzētājs';

  @override
  String get enableBuiltInScreensaver => 'Iespējojiet iebūvēto ekrānsaudzētāju';

  @override
  String get mode => 'Režīms';

  @override
  String get libraryArt => 'Bibliotēka Art';

  @override
  String get logo => 'Logotips';

  @override
  String get clock => 'Pulkstenis';

  @override
  String get timeout => 'Taimauts';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Aptumšošanas līmenis';

  @override
  String get maxAgeRating => 'Maksimālais vecuma ierobežojums';

  @override
  String get any => 'Jebkurš';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Nepieciešams vecuma ierobežojums';

  @override
  String get onlyShowRatedContent => 'Rādīt tikai novērtēto saturu';

  @override
  String get displayClockDuringScreensaver =>
      'Parādīt pulksteni ekrānsaudzētāja laikā';

  @override
  String get clockModeStatic => 'Statisks';

  @override
  String get clockModeBouncing => 'Lecošs';

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
  String get rottenTomatoesCritics => 'Sapuvuši tomāti (kritiķi)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (auditorija)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritisks';

  @override
  String get metacriticUser => 'Metacritic (lietotājs)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Pastkastīte';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Kopienas vērtējums';

  @override
  String get ratings => 'Vērtējumi';

  @override
  String get additionalRatings => 'Papildu vērtējumi';

  @override
  String get showMdbListAndTmdbRatings => 'Rādīt MDBList un TMDB vērtējumus';

  @override
  String get ratingLabels => 'Vērtējuma etiķetes';

  @override
  String get showLabelsNextToIcons => 'Rādīt iezīmes blakus vērtējuma ikonām';

  @override
  String get ratingBadges => 'Vērtējuma nozīmītes';

  @override
  String get showDecorativeBadges =>
      'Parādiet dekoratīvas emblēmas aiz vērtējumiem';

  @override
  String get episodeRatings => 'Sēriju vērtējumi';

  @override
  String get showRatingsOnEpisodes => 'Rādīt vērtējumus atsevišķām sērijām';

  @override
  String get ratingSources => 'Vērtējumu avoti';

  @override
  String get ratingSourcesDescription =>
      'Iespējojiet un pārkārtojiet visā lietotnē rādītos vērtēšanas avotus';

  @override
  String get pluginDetected => 'Spraudnis konstatēts';

  @override
  String get pluginNotDetected => 'Spraudnis nav noteikts';

  @override
  String get pluginNotDetectedDescription =>
      'Servera spraudnis pašlaik nav atklāts. Vietējie iestatījumi joprojām izmanto to saglabātās vērtības vai iebūvētos noklusējuma iestatījumus.';

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
  String get recentRequests => 'Jaunākie pieprasījumi';

  @override
  String get recentlyAdded => 'Nesen pievienots';

  @override
  String get trending => 'Tendences';

  @override
  String get popularMovies => 'Populāras filmas';

  @override
  String get movieGenres => 'Filmu žanri';

  @override
  String get upcomingMovies => 'Gaidāmās filmas';

  @override
  String get studios => 'Studijas';

  @override
  String get popularSeries => 'Populārs seriāls';

  @override
  String get seriesGenres => 'Sērijas žanri';

  @override
  String get upcomingSeries => 'Gaidāmā sērija';

  @override
  String get networks => 'Tīkli';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Seerr atklāšanas rindas';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults =>
      'Atiestatīt rindas uz noklusējuma iestatījumiem';

  @override
  String get enableSeerr => 'Iespējot Seerr';

  @override
  String get showSeerrInNavigation =>
      'Rādīt Seerr navigācijā (nepieciešams servera spraudnis)';

  @override
  String get seerrUnavailable =>
      'Nav pieejams, jo servera spraudņa Seerr atbalsts ir atspējots.';

  @override
  String get nsfwFilter => 'NSFW filtrs';

  @override
  String get hideAdultContent =>
      'Paslēpt rezultātos pieaugušajiem paredzētu saturu';

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
  String get seerrNotificationsSection => 'Paziņojumi';

  @override
  String get seerrNotifyNewRequestsTitle =>
      'Paziņojumi par jauniem pieprasījumiem';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Paziņot, kad kāds iesniedz pieprasījumu';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Pieprasījumu jaunumi';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Apstiprināts, noraidīts un pievienots jūsu bibliotēkai';

  @override
  String get seerrNotifyIssuesTitle => 'Problēmu jaunumi';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Jaunas problēmas, atbildes un risinājumi';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Pieteicies kā: $username';
  }

  @override
  String get discoverRows => 'Seerr atklāšanas lapa';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Iespējojiet rindas, ko rādīt Seerr galvenajā lapā. Velciet, lai pārkārtotu. Pielāgotā kārtība tiek sinhronizēta ar Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Iespējojiet rindas, ko rādīt Seerr galvenajā lapā. Velciet, lai pārkārtotu. Pielāgotā kārtība tiek sinhronizēta ar Moonbase.';

  @override
  String get enabled => 'Iespējots';

  @override
  String get hidden => 'Slēpts';

  @override
  String get aboutTitle => 'Par';

  @override
  String versionValue(String version) {
    return 'Versija $version';
  }

  @override
  String get openSourceLicenses => 'Atvērtā pirmkoda licences';

  @override
  String get sourceCode => 'Avota kods';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Pārbaudiet atjauninājumus tūlīt';

  @override
  String get checksLatestDesktopRelease =>
      'Pārbauda šīs platformas jaunāko darbvirsmas versiju';

  @override
  String get youAreUpToDate => 'Jūs esat lietas kursā.';

  @override
  String get couldNotCheckForUpdates =>
      'Pašlaik nevarēja pārbaudīt atjauninājumus.';

  @override
  String get noCompatibleUpdate =>
      'Šai platformai nav atrasta saderīga atjauninājumu pakotne.';

  @override
  String get updateChecksNotSupported =>
      'Atjauninājumu pārbaudes šajā platformā netiek atbalstītas.';

  @override
  String get updateNotificationsDisabled =>
      'Atjaunināšanas paziņojumi ir atspējoti.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Lūdzu, uzgaidiet pirms atkārtotas pārbaudes.';

  @override
  String get latestUpdateAlreadyShown =>
      'Pēdējais atjauninājums jau tika parādīts.';

  @override
  String get updateAvailable => 'Pieejams atjauninājums.';

  @override
  String updateAvailableVersion(String version) {
    return 'Atjauninājums pieejams: v$version';
  }

  @override
  String get updateNotifications => 'Atjaunināt paziņojumus';

  @override
  String get showWhenUpdatesAvailable => 'Rādīt, kad ir pieejami atjauninājumi';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Pieejams';
  }

  @override
  String get readReleaseNotes => 'Izlasiet izlaiduma piezīmes';

  @override
  String get downloadingUpdate => 'Notiek atjauninājuma lejupielāde...';

  @override
  String get updateDownloadFailed =>
      'Atjaunināšanas lejupielāde neizdevās. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get openReleasesPage => 'Atveriet laidienu lapu';

  @override
  String get navigation => 'Navigācija';

  @override
  String get watchedIndicatorsBackdrops => 'Noskatīti rādītāji, foni';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokusa krāsa, skatītie indikatori, foni';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navigācijas joslas stils, rīkjoslas pogas, izskats';

  @override
  String get featuredContentAppearance => 'Piedāvātais saturs, izskats';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Attēlu kešatmiņas ierobežojums';

  @override
  String get clearImageCache => 'Notīrīt attēlu kešatmiņu';

  @override
  String get imageCacheCleared => 'Attēlu kešatmiņa notīrīta';

  @override
  String get clear => 'Notīrīt';

  @override
  String get browse => 'Pārlūkot';

  @override
  String get noResults => 'Nav rezultātu';

  @override
  String get seerrAvailableStatus => 'Pieejams';

  @override
  String get seerrRequestedStatus => 'Pieprasīts';

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
    return 'Lejupielādē · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importē';

  @override
  String itemsCount(int count) {
    return '$count Vienumi';
  }

  @override
  String get seerrSettings => 'Seerr iestatījumi';

  @override
  String get requestMore => 'Pieprasīt vairāk';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Pieprasīt';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Atcelt pieprasījumu';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Spēlē Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Pieprasīja $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Apstiprināt';

  @override
  String get declineAction => 'Noraidīt';

  @override
  String get similar => 'Līdzīgi';

  @override
  String get recommendations => 'Ieteikumi';

  @override
  String cancelRequestForTitle(String title) {
    return 'Vai atcelt pieprasījumu “$title”?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Vai atcelt $count pieprasījumus par \"$title\"?';
  }

  @override
  String get keep => 'Saglabāt';

  @override
  String get itemNotFoundInLibrary =>
      'Vienums nav atrasts jūsu Moonfin bibliotēkā';

  @override
  String get errorSearchingLibrary => 'Meklējot bibliotēku, radās kļūda';

  @override
  String budgetAmount(String amount) {
    return 'Budžets: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Ieņēmumi: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Pieprasīt $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Iesniedziet pieprasījumu';

  @override
  String get allSeasons => 'Visas sezonas';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Papildu opcijas';

  @override
  String get noServiceServersConfigured =>
      'Nav konfigurēts neviens pakalpojumu serveris';

  @override
  String get server => 'Serveris';

  @override
  String get qualityProfile => 'Kvalitātes profils';

  @override
  String get rootFolder => 'Saknes mape';

  @override
  String get showMore => 'Rādīt vairāk';

  @override
  String get appearances => 'Filmogrāfija';

  @override
  String get crewSection => 'Apkalpe';

  @override
  String ageValue(int age) {
    return 'vecums $age';
  }

  @override
  String get noRequests => 'Nav pieprasījumu';

  @override
  String get pendingStatus => 'Gaida';

  @override
  String get declinedStatus => 'Noraidīts';

  @override
  String get partiallyAvailable => 'Daļēji pieejams';

  @override
  String get downloadingStatus => 'Notiek lejupielāde';

  @override
  String get approvedStatus => 'Apstiprināts';

  @override
  String get notRequestedStatus => 'Nav pieprasīts';

  @override
  String get blocklistedStatus => 'Bloķēts sarakstā';

  @override
  String get deletedStatus => 'Izdzēsts';

  @override
  String get failedStatus => 'Neizdevās';

  @override
  String get processingStatus => 'Apstrādā';

  @override
  String modifiedByName(String name) {
    return 'Mainīja $name';
  }

  @override
  String get completedStatus => 'Pabeigts';

  @override
  String get requestErrorDuplicate => 'Šis nosaukums jau ir pieprasīts';

  @override
  String get requestErrorQuota => 'Sasniegts pieprasījumu ierobežojums';

  @override
  String get requestErrorBlocklisted => 'Šis nosaukums ir bloķēto sarakstā';

  @override
  String get requestErrorNoSeasons =>
      'Nav palikusi neviena sezona, ko pieprasīt';

  @override
  String get requestErrorPermission =>
      'Jums nav atļaujas veikt šo pieprasījumu';

  @override
  String get seerrRequestsTitle => 'Pieprasījumi';

  @override
  String get seerrIssuesTitle => 'Problēmas';

  @override
  String get sortNewest => 'Jaunākie';

  @override
  String get sortLastModified => 'Pēdējoreiz mainīts';

  @override
  String get noIssues => 'Nav problēmu';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Atlikuši $remaining no $limit filmu pieprasījumiem';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Atlikuši $remaining no $limit sezonu pieprasījumiem';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Pieder kolekcijai $name';
  }

  @override
  String get viewCollection => 'Skatīt kolekciju';

  @override
  String get requestCollection => 'Pieprasīt kolekciju';

  @override
  String collectionMoviesSummary(int total, int available) {
    return 'Filmas: $total · pieejamas: $available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Pieprasīt filmas ($count)';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Pieprasa $current no $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Pieprasītas filmas ($count)';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Pieprasītas $ok no $total filmām';
  }

  @override
  String get collectionAllRequested =>
      'Visas filmas jau ir pieejamas vai pieprasītas';

  @override
  String get reportIssue => 'Ziņot par problēmu';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Kas nav kārtībā?';

  @override
  String get allEpisodes => 'Visas epizodes';

  @override
  String get episode => 'Epizode';

  @override
  String get openStatus => 'Atvērta';

  @override
  String get resolvedStatus => 'Atrisināta';

  @override
  String get resolveAction => 'Atrisināt';

  @override
  String get reopenAction => 'Atvērt atkārtoti';

  @override
  String reportedByName(String name) {
    return 'Ziņoja $name';
  }

  @override
  String commentsCount(int count) {
    return 'Komentāri: $count';
  }

  @override
  String get addComment => 'Pievienot komentāru';

  @override
  String get deleteIssueConfirm => 'Dzēst šo problēmu?';

  @override
  String get submitReport => 'Iesniegt ziņojumu';

  @override
  String get tmdbScore => 'TMDB rezultāts';

  @override
  String get releaseDateLabel => 'Izdošanas datums';

  @override
  String get firstAirDateLabel => 'Pirmais ētera datums';

  @override
  String get revenueLabel => 'Ieņēmumi';

  @override
  String get runtimeLabel => 'Izpildes laiks';

  @override
  String get budgetLabel => 'Budžets';

  @override
  String get originalLanguageLabel => 'Oriģinālvaloda';

  @override
  String get seasonsLabel => 'Sezonas';

  @override
  String get episodesLabel => 'Epizodes';

  @override
  String get access => 'Piekļuve';

  @override
  String get add => 'Pievienot';

  @override
  String get address => 'Adrese';

  @override
  String get analytics => 'Analītika';

  @override
  String get catalog => 'Katalogs';

  @override
  String get content => 'Saturs';

  @override
  String get copy => 'Kopēt';

  @override
  String get create => 'Izveidot';

  @override
  String get disable => 'Atspējot';

  @override
  String get done => 'Gatavs';

  @override
  String get edit => 'Rediģēt';

  @override
  String get encoding => 'Kodēšana';

  @override
  String get error => 'Kļūda';

  @override
  String get forward => 'Uz priekšu';

  @override
  String get general => 'Vispārīgi';

  @override
  String get go => 'Aiziet';

  @override
  String get install => 'Instalējiet';

  @override
  String get installed => 'Uzstādīts';

  @override
  String get interval => 'Intervāls';

  @override
  String get name => 'Vārds';

  @override
  String get networking => 'Tīklošana';

  @override
  String get next => 'Tālāk';

  @override
  String get path => 'Ceļš';

  @override
  String get paused => 'Pauzēts';

  @override
  String get permissions => 'Atļaujas';

  @override
  String get processing => 'Apstrāde';

  @override
  String get profile => 'Profils';

  @override
  String get provider => 'Pakalpojumu sniedzējs';

  @override
  String get refresh => 'Atsvaidzināt';

  @override
  String get remote => 'Attālināts';

  @override
  String get rename => 'Pārdēvēt';

  @override
  String get revoke => 'Atsaukt';

  @override
  String get role => 'Loma';

  @override
  String get root => 'Sakne';

  @override
  String get run => 'Skrien';

  @override
  String get search => 'Meklēt';

  @override
  String get select => 'Izvēlieties';

  @override
  String get send => 'Sūtīt';

  @override
  String get sessions => 'Sesijas';

  @override
  String get set => 'Iestatīt';

  @override
  String get status => 'Statuss';

  @override
  String get stop => 'Apturēt';

  @override
  String get streaming => 'Straumēšana';

  @override
  String get time => 'Laiks';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Atinstalēt';

  @override
  String get up => 'Uz augšu';

  @override
  String get update => 'Atjaunināt';

  @override
  String get upload => 'Augšupielādēt';

  @override
  String get unmute => 'Ieslēgt skaņu';

  @override
  String get mute => 'Izslēgt skaņu';

  @override
  String get branding => 'Brendings';

  @override
  String get adminDrawerDashboard => 'Informācijas panelis';

  @override
  String get adminDrawerAnalytics => 'Analītika';

  @override
  String get adminDrawerSettings => 'Iestatījumi';

  @override
  String get adminDrawerBranding => 'Brendings';

  @override
  String get adminDrawerUsers => 'Lietotāji';

  @override
  String get adminDrawerLibraries => 'Bibliotēkas';

  @override
  String get adminDrawerDisplay => 'Attēlošana';

  @override
  String get adminDrawerMetadata => 'Metadati';

  @override
  String get adminDrawerNfo => 'NFO iestatījumi';

  @override
  String get adminDrawerTranscoding => 'Pārkodēšana';

  @override
  String get adminDrawerResume => 'Turpināt';

  @override
  String get adminDrawerStreaming => 'Straumēšana';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Ierīces';

  @override
  String get adminDrawerActivity => 'Aktivitāte';

  @override
  String get adminDrawerNetworking => 'Tīklošana';

  @override
  String get adminDrawerApiKeys => 'API atslēgas';

  @override
  String get adminDrawerBackups => 'Dublējumkopijas';

  @override
  String get adminDrawerLogs => 'Baļķi';

  @override
  String get adminDrawerScheduledTasks => 'Plānotie uzdevumi';

  @override
  String get adminDrawerPlugins => 'Spraudņi';

  @override
  String get adminDrawerRepositories => 'Krātuves';

  @override
  String get adminDrawerLiveTv => 'TV tiešraide';

  @override
  String get adminExitTooltip => 'Iziet no Admin';

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
  String get adminDashboardLoadFailed =>
      'Neizdevās ielādēt informācijas paneli';

  @override
  String get adminMediaOverview => 'Plašsaziņas līdzekļu pārskats';

  @override
  String get adminMediaTotalsError =>
      'Nevarēja ielādēt servera multivides kopsummas.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Īsa informācija par to, cik daudz satura ir šajā serverī.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Pieejami spraudņa atjauninājumi: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Spraudņi, kuriem nepieciešama restartēšana: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Neizdevās ieplānotie uzdevumi: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Mediju izplatīšana';

  @override
  String get analyticsVideoCodecs => 'Video kodeki';

  @override
  String get analyticsAudioCodecs => 'Audio kodeki';

  @override
  String get analyticsContainers => 'Konteineri';

  @override
  String get analyticsTopGenres => 'Populārākie žanri';

  @override
  String get analyticsReleaseYears => 'Izlaiduma gadi';

  @override
  String get analyticsContentRatings => 'Satura vērtējumi';

  @override
  String get analyticsRuntimeBuckets => 'Izpildes laika segmenti';

  @override
  String get analyticsFileFormats => 'Failu formāti';

  @override
  String get analyticsNoData => 'Dati nav pieejami.';

  @override
  String get adminServerInfo => 'Servera informācija';

  @override
  String get adminRestartPending => 'Restartēšana gaida';

  @override
  String get adminServerPaths => 'Servera ceļi';

  @override
  String get adminServerActions => 'Servera darbības';

  @override
  String get adminRestartServer => 'Restartējiet serveri';

  @override
  String get adminShutdownServer => 'Izslēgšanas serveris';

  @override
  String get adminLibraryScanStarted => 'Sākta bibliotēkas skenēšana';

  @override
  String errorGeneric(String error) {
    return 'Kļūda: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Notiek servera atsāknēšana';

  @override
  String get adminServerRebootMessage =>
      'Notiek servera atsāknēšana, lūdzu, restartējiet Moonfin';

  @override
  String get adminActiveSessions => 'Aktīvās sesijas';

  @override
  String get adminSessionsLoadFailed => 'Neizdevās ielādēt sesijas';

  @override
  String get adminNoActiveSessions => 'Nav aktīvu sesiju';

  @override
  String get adminRecentActivity => 'Pēdējā darbība';

  @override
  String get adminNoRecentActivity => 'Nav pēdējo darbību';

  @override
  String adminCommandFailed(String error) {
    return 'Komanda neizdevās: $error';
  }

  @override
  String get adminSendMessage => 'Nosūtīt ziņu';

  @override
  String get adminMessageTextHint => 'Ziņas teksts';

  @override
  String get adminSetVolume => 'Iestatīt skaļumu';

  @override
  String get sessionPrev => 'Iepriekšējā';

  @override
  String get sessionRewind => 'Attīt atpakaļ';

  @override
  String get sessionForward => 'Patīt uz priekšu';

  @override
  String get sessionNext => 'Nākamais';

  @override
  String get sessionVolumeDown => 'Skaļ. –';

  @override
  String get sessionVolumeUp => 'Skaļ. +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Tagad spēlē';

  @override
  String get volume => 'Skaļums';

  @override
  String get actions => 'Darbības';

  @override
  String get videoCodec => 'Video kodeks';

  @override
  String get audioCodec => 'Audio kodeks';

  @override
  String get hwAccel => 'Aparat. paātrin.';

  @override
  String get completion => 'Pabeigšana';

  @override
  String get adminClearDates => 'Skaidri datumi';

  @override
  String get adminActivitySeverityAll => 'Visi nopietnības līmeņi';

  @override
  String get adminActivityDateRange => 'Datumu diapazons';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Neizdevās ielādēt darbību žurnālu: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nav darbību ierakstu';

  @override
  String get adminEditDeviceName => 'Rediģēt ierīces nosaukumu';

  @override
  String get adminCustomName => 'Pielāgots nosaukums';

  @override
  String get adminDeviceNameUpdated => 'Ierīces nosaukums ir atjaunināts';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Neizdevās atjaunināt ierīci: $error';
  }

  @override
  String get adminDeleteDevice => 'Dzēst ierīci';

  @override
  String get adminDeviceDeleted => 'Ierīce izdzēsta';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Neizdevās izdzēst ierīci: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Noņemt ierīci “$name”? Lietotājam būs atkārtoti jāpierakstās šajā ierīcē.';
  }

  @override
  String get adminDeleteAllDevices => 'Dzēst visas ierīces';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Noņemt ierīces ($count)? Skartajiem lietotājiem būs atkārtoti jāpierakstās. Jūsu pašreizējā ierīce netiks skarta.';
  }

  @override
  String get adminDevicesDeletedAll => 'Ierīces noņemtas';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Dažas ierīces noņemtas; $count nevarēja noņemt.';
  }

  @override
  String get adminDevicesLoadFailed => 'Neizdevās ielādēt ierīces';

  @override
  String get adminSearchDevices => 'Meklēt ierīces';

  @override
  String get adminThisDevice => 'Šī Ierīce';

  @override
  String get adminEditName => 'Rediģēt nosaukumu';

  @override
  String get adminLibrariesLoadFailed => 'Neizdevās ielādēt bibliotēkas';

  @override
  String get adminNoLibraries => 'Nav konfigurēta neviena bibliotēka';

  @override
  String get adminScanAllLibraries => 'Skenējiet visas bibliotēkas';

  @override
  String get adminAddLibrary => 'Pievienot bibliotēku';

  @override
  String adminScanFailed(String error) {
    return 'Neizdevās sākt skenēšanu: $error';
  }

  @override
  String get adminRenameLibrary => 'Pārdēvēt bibliotēku';

  @override
  String get adminNewName => 'Jauns nosaukums';

  @override
  String adminLibraryRenamed(String name) {
    return 'Bibliotēka pārdēvēta par $name';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Neizdevās pārdēvēt: $error';
  }

  @override
  String get adminDeleteLibrary => 'Dzēst bibliotēku';

  @override
  String adminLibraryDeleted(String name) {
    return 'Bibliotēka \"$name\" ir izdzēsta';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Neizdevās izdzēst bibliotēku: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Neizdevās pievienot ceļu: $error';
  }

  @override
  String get adminRemovePath => 'Noņemt ceļu';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Vai noņemt \"$path\" no šīs bibliotēkas?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Neizdevās noņemt ceļu: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Neizdevās ielādēt bibliotēku';

  @override
  String get adminNoMediaPaths => 'Nav konfigurēti multivides ceļi';

  @override
  String get adminAddPath => 'Pievienot ceļu';

  @override
  String get adminBrowseFilesystem => 'Pārlūkot servera failu sistēmu:';

  @override
  String get adminPreferredMetadataLanguage => 'Vēlamā metadatu valoda';

  @override
  String get adminMetadataLanguageHint => 'piem. lv, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadatu valsts kods';

  @override
  String get adminMetadataCountryHint => 'piem. ASV, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Ceļi';

  @override
  String get adminLibraryTabOptions => 'Opcijas';

  @override
  String get adminLibraryTabDownloaders => 'Lejupielādes avoti';

  @override
  String get adminLibMetadataSavers => 'Metadatu saglabātāji';

  @override
  String get adminLibSubtitleDownloaders => 'Subtitru lejupielādes avoti';

  @override
  String get adminLibLyricDownloaders => 'Dziesmu tekstu lejupielādes avoti';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadatu lejupielādes avoti: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Attēlu avoti: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Šis serveris nepiedāvā lejupielādes avotus šāda veida bibliotēkai.';

  @override
  String get adminLibrarySectionGeneral => 'Vispārīgi';

  @override
  String get adminLibrarySectionMetadata => 'Metadati';

  @override
  String get adminLibrarySectionEmbedded => 'Iegultā informācija';

  @override
  String get adminLibrarySectionSubtitles => 'Subtitri';

  @override
  String get adminLibrarySectionImages => 'Attēli';

  @override
  String get adminLibrarySectionSeries => 'Seriāli';

  @override
  String get adminLibrarySectionMusic => 'Mūzika';

  @override
  String get adminLibrarySectionMovies => 'Filmas';

  @override
  String get adminLibRealtimeMonitor => 'Iespējot uzraudzību reāllaikā';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Noteikt failu izmaiņas un apstrādāt tās automātiski.';

  @override
  String get adminLibEnablePhotos => 'Rādīt fotoattēlus';

  @override
  String get adminLibSaveLocalMetadata =>
      'Saglabāt vāka attēlus multivides mapēs';

  @override
  String get adminLibRefreshInterval => 'Automātiska metadatu atsvaidzināšana';

  @override
  String get adminLibRefreshNever => 'Nekad';

  @override
  String get adminLibDefault => 'Noklusējums';

  @override
  String get adminLibDisplayTitle => 'Attēlošana';

  @override
  String get adminLibDisplaySection => 'Bibliotēkas attēlošana';

  @override
  String get adminLibFolderView =>
      'Rādīt mapju skatu ar vienkāršām multivides mapēm';

  @override
  String get adminLibSpecialsInSeasons =>
      'Rādīt speciālās epizodes tajās sezonās, kurās tās tika rādītas';

  @override
  String get adminLibGroupMovies => 'Grupēt filmas kolekcijās';

  @override
  String get adminLibGroupShows => 'Grupēt seriālus kolekcijās';

  @override
  String get adminLibExternalSuggestions => 'Rādīt ārējo saturu ieteikumos';

  @override
  String get adminLibDateAddedSection => 'Pievienošanas datuma darbība';

  @override
  String get adminLibDateAddedLabel => 'Pievienošanas datumu ņemt no';

  @override
  String get adminLibDateAddedImport => 'Bibliotēkā skenēšanas datums';

  @override
  String get adminLibDateAddedFile => 'Faila izveides datums';

  @override
  String get adminLibMetadataTitle => 'Metadati un attēli';

  @override
  String get adminLibMetadataLangSection => 'Vēlamā metadatu valoda';

  @override
  String get adminLibChaptersSection => 'Nodaļas';

  @override
  String get adminLibDummyChapterDuration => 'Fiktīvo nodaļu ilgums (sekundēs)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'To nodaļu ilgums, kas ģenerētas multividei bez nodaļām. Iestatiet 0, lai atspējotu.';

  @override
  String get adminLibChapterImageResolution => 'Nodaļu attēlu izšķirtspēja';

  @override
  String get adminLibNfoTitle => 'NFO iestatījumi';

  @override
  String get adminLibNfoHelp =>
      'NFO metadati ir saderīgi ar Kodi un līdzīgām lietotnēm. Iestatījumi attiecas uz visām bibliotēkām, kas saglabā NFO metadatus.';

  @override
  String get adminLibKodiUser =>
      'Lietotājs, kura skatīšanās dati tiks saglabāti NFO failos';

  @override
  String get adminLibSaveImagePaths => 'Saglabāt attēlu ceļus NFO failos';

  @override
  String get adminLibPathSubstitution =>
      'Iespējot ceļu aizstāšanu NFO attēlu ceļiem';

  @override
  String get adminLibExtraThumbs =>
      'Kopēt extrafanart attēlus mapē extrathumbs';

  @override
  String get adminLibNone => 'Nav';

  @override
  String adminLibRefreshDays(int days) {
    return '$days d.';
  }

  @override
  String get adminLibEmbeddedTitles => 'Izmantot iegultos nosaukumus';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Izmantot iegultos papildmateriālu nosaukumus';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Izmantot iegulto epizožu informāciju';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Atļaut iegultos subtitrus';

  @override
  String get adminLibEmbeddedAllowAll => 'Atļaut visus';

  @override
  String get adminLibEmbeddedAllowText => 'Tikai tekstu';

  @override
  String get adminLibEmbeddedAllowImage => 'Tikai attēlus';

  @override
  String get adminLibEmbeddedAllowNone => 'Nav';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Izlaist lejupielādi, ja ir iegultie subtitri';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Izlaist lejupielādi, ja audio celiņa valoda sakrīt ar lejupielādes valodu';

  @override
  String get adminLibRequirePerfectMatch =>
      'Pieprasīt precīzu subtitru atbilstību';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Saglabāt subtitrus multivides mapēs';

  @override
  String get adminLibChapterImageExtraction => 'Iegūt nodaļu attēlus';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Iegūt nodaļu attēlus bibliotēkas skenēšanas laikā';

  @override
  String get adminLibTrickplayExtraction =>
      'Iespējot Trickplay attēlu iegūšanu';

  @override
  String get adminLibTrickplayDuringScan =>
      'Iegūt Trickplay attēlus bibliotēkas skenēšanas laikā';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Saglabāt Trickplay attēlus multivides mapēs';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automātiski apvienot seriālus, kas izvietoti vairākās mapēs';

  @override
  String get adminLibSeasonZeroName => 'Nulltās sezonas attēlojamais nosaukums';

  @override
  String get adminLibLufsScan => 'Iespējot LUFS skenēšanu audio normalizēšanai';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Dot priekšroku nestandarta izpildītāju tagam';

  @override
  String get adminLibAutoAddToCollection =>
      'Automātiski pievienot filmas kolekcijām';

  @override
  String get adminLibraryNameRequired => 'Jānorāda bibliotēkas nosaukums';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Neizdevās izveidot bibliotēku: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotēkas nosaukums';

  @override
  String get adminSelectedPaths => 'Atlasītie ceļi:';

  @override
  String get adminCreateLibrary => 'Izveidot bibliotēku';

  @override
  String get paths => 'Ceļi:';

  @override
  String get adminDisableUser => 'Atspējot lietotāju';

  @override
  String get adminEnableUser => 'Iespējot lietotāju';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Vai atspējot $name? Viņi nevarēs pierakstīties.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Vai iespējot $name? Viņi varēs pierakstīties vēlreiz.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Lietotājs \"$name\" ir atspējots';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Lietotājs \"$name\" ir iespējots';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Neizdevās atjaunināt lietotāja politiku: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Neizdevās ielādēt lietotājus';

  @override
  String get adminSearchUsers => 'Meklēt lietotājus';

  @override
  String get adminEditUser => 'Rediģēt lietotāju';

  @override
  String get adminAddUser => 'Pievienot lietotāju';

  @override
  String adminUserCreateFailed(String error) {
    return 'Neizdevās izveidot lietotāju: $error';
  }

  @override
  String get adminCreateUser => 'Izveidot lietotāju';

  @override
  String get adminPasswordOptional => 'Parole (pēc izvēles)';

  @override
  String get adminUsernameRequired => 'Lietotājvārda lauks nedrīkst būt tukšs';

  @override
  String adminSaveFailed(String error) {
    return 'Neizdevās saglabāt: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Paroles nesakrīt';

  @override
  String adminFailed(String error) {
    return 'Neizdevās: $error';
  }

  @override
  String get adminUserLoadFailed => 'Neizdevās ielādēt lietotāju';

  @override
  String get adminDeleteUser => 'Dzēst lietotāju';

  @override
  String get admin => 'Administrators';

  @override
  String get adminFullAccessWarning =>
      'Administratoriem ir pilnīga piekļuve serverim. Piešķiriet piesardzīgi.';

  @override
  String get administrator => 'Administrators';

  @override
  String get adminHiddenUser => 'Slēpts lietotājs';

  @override
  String get adminAllowMediaPlayback => 'Atļaut multivides atskaņošanu';

  @override
  String get adminAllowAudioTranscoding => 'Atļaut audio pārkodēšanu';

  @override
  String get adminAllowVideoTranscoding => 'Atļaut video pārkodēšanu';

  @override
  String get adminAllowRemuxing => 'Atļaut sajaukšanu';

  @override
  String get adminForceRemoteTranscoding =>
      'Piespiedu attālā avota pārkodēšana';

  @override
  String get adminAllowContentDownloading => 'Atļaut satura lejupielādi';

  @override
  String get adminAllowPublicSharing => 'Atļaut publisku kopīgošanu';

  @override
  String get adminAllowRemoteControl =>
      'Atļaut tālvadības pulti citiem lietotājiem';

  @override
  String get adminAllowSharedDeviceControl =>
      'Atļaut koplietotu ierīces vadību';

  @override
  String get adminAllowRemoteAccess => 'Atļaut attālo piekļuvi';

  @override
  String get adminLeaveEmptyNoLimit => 'Atstājiet tukšu bez ierobežojumiem';

  @override
  String get adminMaxActiveSessions => 'Maksimālais aktīvo sesiju skaits';

  @override
  String get adminAllowLiveTvAccess => 'Atļaut piekļuvi TV tiešraidei';

  @override
  String get adminAllowLiveTvManagement => 'Atļaut tiešraides pārvaldību';

  @override
  String get adminAllowCollectionManagement => 'Atļaut kolekcijas pārvaldību';

  @override
  String get adminAllowSubtitleManagement => 'Atļaut subtitru pārvaldību';

  @override
  String get adminAllowLyricManagement => 'Atļaut dziesmu tekstu pārvaldību';

  @override
  String get adminEnableAllLibraryAccess =>
      'Iespējot piekļuvi visām bibliotēkām';

  @override
  String get adminChangePassword => 'Mainīt paroli';

  @override
  String get adminNewPassword => 'Jauna parole';

  @override
  String get adminConfirmPassword => 'Apstipriniet paroli';

  @override
  String get adminSetPassword => 'Iestatīt paroli';

  @override
  String get adminResetPassword => 'Atiestatīt paroli';

  @override
  String get adminPasswordReset => 'Paroles atiestatīšana';

  @override
  String get adminPasswordUpdated => 'Parole atjaunināta';

  @override
  String get adminUserSettings => 'Lietotāja iestatījumi';

  @override
  String get adminLibraryAccess => 'Piekļuve bibliotēkai';

  @override
  String get adminEnableAllDevices => 'Iespējot piekļuvi visām ierīcēm';

  @override
  String get adminEnableAllChannels => 'Iespējot piekļuvi visiem kanāliem';

  @override
  String get adminParentalControl => 'Vecāku kontrole';

  @override
  String get adminMaxParentalRating =>
      'Maksimālais atļautais vecuma ierobežojums';

  @override
  String get adminMaxParentalRatingHint =>
      'Saturs ar augstāku ierobežojumu šim lietotājam tiks paslēpts.';

  @override
  String get adminParentalRatingNone => 'Nav';

  @override
  String get adminBlockUnratedItems =>
      'Bloķēt vienumus bez vecuma ierobežojuma informācijas vai ar neatpazītu informāciju';

  @override
  String get adminUnratedBook => 'Grāmatas';

  @override
  String get adminUnratedChannelContent => 'Kanāli';

  @override
  String get adminUnratedLiveTvChannel => 'Tiešraides TV';

  @override
  String get adminUnratedMovie => 'Filmas';

  @override
  String get adminUnratedMusic => 'Mūzika';

  @override
  String get adminUnratedTrailer => 'Treileri';

  @override
  String get adminUnratedSeries => 'Seriāli';

  @override
  String get adminAccessSchedules => 'Piekļuves grafiki';

  @override
  String get adminAccessSchedulesHint =>
      'Atļaut piekļuvi tikai turpmāk norādītajos grafika laikos. Ja grafiks nav iestatīts, piekļuve ir atļauta visu diennakti.';

  @override
  String get adminAddSchedule => 'Pievienot grafiku';

  @override
  String get adminScheduleDay => 'Diena';

  @override
  String get adminScheduleStart => 'Sākums';

  @override
  String get adminScheduleEnd => 'Beigas';

  @override
  String get adminDayEveryday => 'Katru dienu';

  @override
  String get adminDayWeekday => 'Darba diena';

  @override
  String get adminDayWeekend => 'Nedēļas nogale';

  @override
  String get adminDaySunday => 'Svētdiena';

  @override
  String get adminDayMonday => 'Pirmdiena';

  @override
  String get adminDayTuesday => 'Otrdiena';

  @override
  String get adminDayWednesday => 'Trešdiena';

  @override
  String get adminDayThursday => 'Ceturtdiena';

  @override
  String get adminDayFriday => 'Piektdiena';

  @override
  String get adminDaySaturday => 'Sestdiena';

  @override
  String get adminAllowedTags => 'Atļautie tagi';

  @override
  String get adminAllowedTagsHint =>
      'Tiek rādīts tikai saturs ar šiem tagiem. Atstājiet tukšu, lai atļautu visu.';

  @override
  String get adminBlockedTags => 'Bloķētie tagi';

  @override
  String get adminBlockedTagsHint =>
      'Saturs ar šiem tagiem šim lietotājam tiek paslēpts.';

  @override
  String get adminAddTag => 'Pievienot tagu';

  @override
  String get adminAuthProvider => 'Autentifikācijas nodrošinātājs';

  @override
  String get adminPasswordResetProvider =>
      'Paroles atiestatīšanas nodrošinātājs';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maksimālais neveiksmīgo pieteikšanās mēģinājumu skaits pirms bloķēšanas';

  @override
  String get adminLoginAttemptsHint =>
      'Iestatiet 0 noklusējuma vērtībai vai -1, lai atspējotu bloķēšanu.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay piekļuve';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Atļaut veidot grupas un tām pievienoties';

  @override
  String get adminSyncPlayJoin => 'Atļaut pievienoties grupām';

  @override
  String get adminSyncPlayNone => 'Nav piekļuves';

  @override
  String get adminContentDeletionFolders => 'Atļaut satura dzēšanu no';

  @override
  String get adminResetPasswordWarning =>
      'Tas noņems paroli. Lietotājs varēs pieteikties bez paroles.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Serveris atgrieza HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Vai tiešām vēlaties dzēst $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Lietotājs \"$name\" ir izdzēsts';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Neizdevās izdzēst lietotāju: $error';
  }

  @override
  String get adminCreateApiKey => 'Izveidojiet API atslēgu';

  @override
  String get adminAppName => 'Lietotnes nosaukums';

  @override
  String get adminApiKeyCreated => 'API atslēga ir izveidota';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Atslēga ir veiksmīgi izveidota. Serveris neatdeva marķieri. Pārbaudiet servera API atslēgas.';

  @override
  String get adminKeyCopied => 'Atslēga ir kopēta starpliktuvē';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Neizdevās izveidot atslēgu: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Servera atbildē trūkst atslēgas marķiera';

  @override
  String get adminRevokeApiKey => 'Atsaukt API atslēgu';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Vai atsaukt $name atslēgu?';
  }

  @override
  String get adminApiKeyRevoked => 'API atslēga atsaukta';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Neizdevās atsaukt atslēgu: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Neizdevās ielādēt API atslēgas';

  @override
  String get adminApiKeysTitle => 'API atslēgas';

  @override
  String get adminCreateKey => 'Izveidot atslēgu';

  @override
  String get adminNoApiKeys => 'Nav atrasta neviena API atslēga';

  @override
  String get adminUnknownApp => 'Nezināma lietotne';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Tokens: $token\\nIzveidots: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Izveidot dublējumu';

  @override
  String get adminBackupDatabase => 'Datubāze';

  @override
  String get adminBackupDatabaseAlways => 'Vienmēr iekļauts';

  @override
  String get adminBackupMetadata => 'Metadati';

  @override
  String get adminBackupSubtitles => 'Subtitri';

  @override
  String get adminBackupTrickplay => 'Trickplay attēli';

  @override
  String get adminCreatingBackup => 'Notiek dublējuma izveide...';

  @override
  String get adminBackupCreated => 'Dublējums ir veiksmīgi izveidots';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Neizdevās izveidot dublējumu: $error';
  }

  @override
  String get adminBackupPathMissing => 'Servera atbildē trūkst rezerves ceļa';

  @override
  String adminBackupManifest(String name) {
    return 'Manifests: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Neizdevās ielādēt manifestu: $error';
  }

  @override
  String get adminConfirmRestore => 'Apstipriniet Atjaunot';

  @override
  String get adminRestoringBackup => 'Notiek dublējuma atjaunošana...';

  @override
  String adminRestoreFailed(String error) {
    return 'Neizdevās atjaunot dublējumu: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Neizdevās ielādēt dublējumus';

  @override
  String get adminCreateBackup => 'Izveidot dublējumu';

  @override
  String get adminNoBackups => 'Dublējumkopijas nav atrastas';

  @override
  String get adminViewDetails => 'Skatīt detaļas';

  @override
  String get restore => 'Atjaunot';

  @override
  String get adminLogsLoadFailed => 'Neizdevās ielādēt servera žurnālus';

  @override
  String get adminNoLogFiles => 'Nav atrasts neviens žurnālfails';

  @override
  String get adminLogCopied => 'Žurnāls ir kopēts starpliktuvē';

  @override
  String get adminSaveLogFile => 'Saglabājiet žurnāla failu';

  @override
  String adminSavedTo(String path) {
    return 'Saglabāts $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Neizdevās saglabāt failu: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Neizdevās ielādēt $fileName';
  }

  @override
  String get adminSearchInLog => 'Meklēt žurnālā';

  @override
  String get adminNoMatchingLines => 'Nav atbilstošu līniju';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Neizdevās ielādēt uzdevumus: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nav atrasts neviens ieplānots uzdevums';

  @override
  String get adminNoTasksMatchFilter =>
      'Neviens uzdevums neatbilst pašreizējam filtram';

  @override
  String adminTaskStartFailed(String error) {
    return 'Neizdevās sākt uzdevumu: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Neizdevās apturēt uzdevumu: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Neizdevās ielādēt uzdevumu: $error';
  }

  @override
  String get adminRunNow => 'Skrien tūlīt';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Neizdevās noņemt aktivizētāju: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Neizdevās pievienot aktivizētāju: $error';
  }

  @override
  String get adminLastExecution => 'Pēdējā izpilde';

  @override
  String get adminTriggers => 'Trigeri';

  @override
  String get adminAddTrigger => 'Pievienot trigeri';

  @override
  String get adminNoTriggers => 'Nav konfigurēts neviens aktivizētājs';

  @override
  String get adminTriggerType => 'Trigera veids';

  @override
  String get adminNoLimit => 'Nav ierobežojumu';

  @override
  String adminHours(String hours) {
    return '$hours stunda(s)';
  }

  @override
  String get adminDayOfWeek => 'Nedēļas diena';

  @override
  String get adminSearchPlugins => 'Meklēt spraudņus...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Neizdevās pārslēgt spraudni: $error';
  }

  @override
  String get adminUninstallPlugin => 'Atinstalējiet spraudni';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Vai tiešām vēlaties atinstalēt \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Neizdevās atinstalēt spraudni: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Neizdevās instalēt pakotni: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Neizdevās instalēt atjauninājumu: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Neizdevās ielādēt spraudņus: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Neviens spraudnis neatbilst jūsu meklēšanas vaicājumam';

  @override
  String get adminNoPluginsInstalled => 'Nav instalēts neviens spraudnis';

  @override
  String adminInstallUpdate(String version) {
    return 'Instalējiet atjauninājumu (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Neizdevās ielādēt katalogu: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Neviena pakotne neatbilst jūsu meklēšanas vaicājumam';

  @override
  String get adminNoPackagesAvailable => 'Paciņas nav pieejamas';

  @override
  String get adminExperimentalIntegration => 'Eksperimentālā integrācija';

  @override
  String get adminExperimentalWarning =>
      'Spraudņa iestatījumu integrācija joprojām ir eksperimentāla. Dažas iestatījumu lapas var netikt renderētas pareizi.';

  @override
  String get continueAction => 'Turpināt';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" tiks noņemts pēc servera restartēšanas';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Neizdevās atinstalēt: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Notiek \"$name\" atjaunināšana uz v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Neizdevās ielādēt spraudni: $error';
  }

  @override
  String get adminPluginNotFound => 'Spraudnis nav atrasts';

  @override
  String adminPluginVersion(String version) {
    return 'Versija $version';
  }

  @override
  String get adminEnablePlugin => 'Iespējot spraudni';

  @override
  String get adminPluginSettingsPage => 'Spraudņa iestatījumu lapa';

  @override
  String get adminRevisionHistory => 'Pārskatīšanas vēsture';

  @override
  String get adminNoChangelog => 'Nav pieejams izmaiņu žurnāls.';

  @override
  String get adminRemoveRepository => 'Noņemt repozitoriju';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Vai tiešām vēlaties noņemt \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Neizdevās saglabāt krātuves: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Neizdevās ielādēt krātuves: $error';
  }

  @override
  String get adminRepositoryNameHint => 'piem. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'Repozitorija URL';

  @override
  String get adminAddEntry => 'Pievienot ierakstu';

  @override
  String get adminInvalidUrl => 'Nederīgs URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Nevar ielādēt spraudņa iestatījumus: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nevarēja atvērt $uri';
  }

  @override
  String get adminOpenInBrowser => 'Atvērt pārlūkprogrammā';

  @override
  String get adminOpenExternally => 'Atvērt ārēji';

  @override
  String get adminGeneralSettings => 'Vispārīgi iestatījumi';

  @override
  String get adminServerName => 'Servera nosaukums';

  @override
  String get adminPreferredMetadataCountry => 'Vēlamā metadatu valsts';

  @override
  String get adminCachePath => 'Kešatmiņas ceļš';

  @override
  String get adminMetadataPath => 'Metadatu ceļš';

  @override
  String get adminLibraryScanConcurrency =>
      'Bibliotēkas skenēšanas vienlaicīgums';

  @override
  String get adminParallelImageEncodingLimit =>
      'Paralēlā attēla kodēšanas ierobežojums';

  @override
  String get adminSlowResponseThreshold => 'Lēnas reakcijas slieksnis (ms)';

  @override
  String get adminBrandingLoadFailed => 'Neizdevās ielādēt zīmola iestatījumus';

  @override
  String get adminLoginDisclaimer => 'Pieteikšanās atruna';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML tiek parādīts zem pieteikšanās veidlapas';

  @override
  String get adminCustomCss => 'Pielāgots CSS';

  @override
  String get adminCustomCssHint =>
      'Pielāgots CSS, kas tiek lietots tīmekļa saskarnē';

  @override
  String get adminEnableSplashScreen => 'Iespējot uzplaiksnījumu ekrānu';

  @override
  String get adminStreamingLoadFailed =>
      'Neizdevās ielādēt straumēšanas iestatījumus';

  @override
  String get adminStreamingDescription =>
      'Iestatiet globālos straumēšanas bitu pārraides ātruma ierobežojumus attāliem savienojumiem.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Attālā klienta bitu pārraides ātruma ierobežojums (Mb/s)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Atstājiet tukšu vai 0, lai neierobežotu';

  @override
  String get adminPlaybackLoadFailed =>
      'Neizdevās ielādēt atskaņošanas iestatījumus';

  @override
  String get adminHardwareAcceleration => 'Aparatūras paātrinājums';

  @override
  String get adminVaapiDevice => 'VA-API ierīce';

  @override
  String get adminEnableHardwareEncoding => 'Iespējot aparatūras kodējumu';

  @override
  String get adminEnableHardwareDecoding => 'Iespējot aparatūras dekodēšanu:';

  @override
  String get adminEncodingThreads => 'Kodēšanas pavedieni';

  @override
  String get adminAutomatic => '0 = automātiski';

  @override
  String get adminTranscodingTempPath => 'Pārkodēšanas temp ceļš';

  @override
  String get adminEnableFallbackFont => 'Iespējot atkāpšanās fontu';

  @override
  String get adminFallbackFontPath => 'Atkāpšanās fonta ceļš';

  @override
  String get adminAllowSegmentDeletion => 'Atļaut segmenta dzēšanu';

  @override
  String get adminSegmentKeepSeconds => 'Segmenta saglabāšana (sekundēs)';

  @override
  String get adminThrottleBuffering => 'Droseles buferizācija';

  @override
  String get adminTrickplayLoadFailed =>
      'Neizdevās ielādēt Trickplay iestatījumus';

  @override
  String get adminEnableHardwareAcceleration =>
      'Iespējot aparatūras paātrinājumu';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Iespējot tikai atslēgas rāmja izvilkšanu';

  @override
  String get adminKeyFrameSubtitle => 'Ātrāka, bet zemāka precizitāte';

  @override
  String get adminScanBehavior => 'Skenēšanas uzvedība';

  @override
  String get adminProcessPriority => 'Procesa prioritāte';

  @override
  String get adminImageSettings => 'Attēla iestatījumi';

  @override
  String get adminIntervalMs => 'Intervāls (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Cik bieži uzņemt kadrus';

  @override
  String get adminWidthResolutions => 'Platuma izšķirtspējas';

  @override
  String get adminTileWidth => 'Flīžu platums';

  @override
  String get adminTileHeight => 'Flīžu augstums';

  @override
  String get adminQualitySubtitle =>
      'Zemākas vērtības = labāka kvalitāte, lielāki faili';

  @override
  String get adminProcessThreads => 'Apstrādājiet pavedienus';

  @override
  String get adminResumeLoadFailed =>
      'Neizdevās ielādēt atsākšanas iestatījumus';

  @override
  String get adminResumeDescription =>
      'Konfigurējiet, kad saturs ir jāatzīmē kā daļēji vai pilnībā atskaņots.';

  @override
  String get adminMinResumePercentage => 'Minimālais atsākšanas procents';

  @override
  String get adminMinResumeSubtitle =>
      'Lai saglabātu progresu, saturs ir jāatskaņo, pārsniedzot šo procentuālo daļu';

  @override
  String get adminMaxResumePercentage => 'Maksimālais atsākšanas procents';

  @override
  String get adminMaxResumeSubtitle =>
      'Pēc šī procentuālā daudzuma saturs tiek uzskatīts par pilnībā atskaņotu';

  @override
  String get adminMinResumeDuration =>
      'Minimālais atsākšanas ilgums (sekundēs)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Vienumus, kas ir īsāki par šo, nevar atsākt';

  @override
  String get adminMinAudiobookResume =>
      'Minimālais audiogrāmatas atsākšanas procents';

  @override
  String get adminMaxAudiobookResume =>
      'Maksimālais audiogrāmatas atsākšanas procents';

  @override
  String get adminNetworkingLoadFailed =>
      'Neizdevās ielādēt tīkla iestatījumus';

  @override
  String get adminNetworkingWarning =>
      'Lai veiktu izmaiņas tīkla iestatījumos, var būt nepieciešama servera restartēšana.';

  @override
  String get adminEnableRemoteAccess => 'Iespējot attālo piekļuvi';

  @override
  String get ports => 'Ostas';

  @override
  String get adminHttpPort => 'HTTP ports';

  @override
  String get adminHttpsPort => 'HTTPS ports';

  @override
  String get adminPublicHttpsPort => 'Publisks HTTPS ports';

  @override
  String get adminBaseUrl => 'Pamata URL';

  @override
  String get adminBaseUrlHint => 'piem. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Iespējot HTTPS';

  @override
  String get adminLocalNetwork => 'Vietējais tīkls';

  @override
  String get adminLocalNetworkAddresses => 'Vietējā tīkla adreses';

  @override
  String get adminKnownProxies => 'Zināmi starpniekserveri';

  @override
  String get adminRemoteIpFilter => 'Attālais IP filtrs';

  @override
  String get adminRemoteIpFilterEntries => 'Attālais IP filtrs';

  @override
  String get adminCertificatePath => 'Sertifikāta ceļš';

  @override
  String get whitelist => 'Baltais saraksts';

  @override
  String get blacklist => 'Melnais saraksts';

  @override
  String get notSet => 'Nav iestatīts';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Neizdevās ielādēt metadatus: $error';
  }

  @override
  String get adminRefreshMetadata => 'Atsvaidziniet metadatus';

  @override
  String get recursive => 'Rekursīvs';

  @override
  String get adminReplaceAllMetadata => 'Aizstāt visus metadatus';

  @override
  String get adminMetadataRefreshRequested =>
      'Pieprasīta metadatu atsvaidzināšana';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Neizdevās atsvaidzināt metadatus: $error';
  }

  @override
  String get adminNoRemoteMatches =>
      'Nav atrasta neviena attālināta atbilstība';

  @override
  String get adminRemoteResults => 'Attālinātie rezultāti';

  @override
  String get adminRemoteMetadataApplied => 'Lietoti attālie metadati';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Attālā meklēšana neizdevās: $error';
  }

  @override
  String get adminUpdateContentType => 'Atjaunināt satura veidu';

  @override
  String get adminContentType => 'Satura veids';

  @override
  String get adminContentTypeUpdated => 'Satura veids atjaunināts';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Neizdevās atjaunināt satura veidu: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Neizdevās ielādēt metadatu redaktoru';

  @override
  String get adminNoPeopleEntries => 'Nav personu ierakstu';

  @override
  String get adminNoExternalIds => 'Ārējie ID nav pieejami';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType attēls ir atjaunināts';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Neizdevās lejupielādēt attēlu: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Neatbalstīts attēla formāts';

  @override
  String get adminImageReadFailed => 'Neizdevās nolasīt atlasīto attēlu';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType attēls ir augšupielādēts';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Neizdevās augšupielādēt attēlu: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Dzēst $imageType attēlu';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType attēls ir izdzēsts';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Neizdevās izdzēst attēlu: $error';
  }

  @override
  String get adminAllProviders => 'Visi pakalpojumu sniedzēji';

  @override
  String get adminNoRemoteImages => 'Nav atrasts neviens attālais attēls';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Uztvērēja atklāšana neizdevās: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U uztvērējs';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Fails vai URL';

  @override
  String get adminTunerIpAddress => 'Uztvērēja IP adrese';

  @override
  String get adminTunerFriendlyName => 'Draudzīgais nosaukums';

  @override
  String get adminTunerUserAgent => 'Lietotāja aģents';

  @override
  String get adminTunerCount => 'Vienlaicīgo savienojumu ierobežojums';

  @override
  String get adminTunerCountHelp =>
      'Maksimālais straumju skaits, ko uztvērējs atļauj vienlaikus. Iestatiet 0, lai būtu neierobežots.';

  @override
  String get adminTunerFallbackBitrate =>
      'Rezerves maksimālais straumēšanas bitu ātrums';

  @override
  String get adminTunerImportFavoritesOnly => 'Importēt tikai izlases kanālus';

  @override
  String get adminTunerAllowHwTranscoding => 'Atļaut aparatūras pārkodēšanu';

  @override
  String get adminTunerAllowFmp4 => 'Atļaut fMP4 pārkodēšanas konteineru';

  @override
  String get adminTunerAllowStreamSharing => 'Atļaut straumes koplietošanu';

  @override
  String get adminTunerEnableStreamLooping => 'Iespējot straumes atkārtošanu';

  @override
  String get adminTunerIgnoreDts => 'Ignorēt DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Nolasīt ievadi ar dabisko kadru nomaiņas ātrumu';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Fails vai URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmu prefikss';

  @override
  String get adminXmltvMovieCategories => 'Filmu kategorijas';

  @override
  String get adminXmltvCategoriesHelp =>
      'Vairākas kategorijas atdaliet ar vertikālu svītru.';

  @override
  String get adminXmltvKidsCategories => 'Bērnu kategorijas';

  @override
  String get adminXmltvNewsCategories => 'Ziņu kategorijas';

  @override
  String get adminXmltvSportsCategories => 'Sporta kategorijas';

  @override
  String get adminSdUsername => 'Lietotājvārds';

  @override
  String get adminSdPassword => 'Parole';

  @override
  String get adminSdCountry => 'Valsts';

  @override
  String get adminSdCountrySelect => 'Izvēlieties valsti';

  @override
  String get adminSdPostalCode => 'Pasta indekss';

  @override
  String get adminEnableAllTuners => 'Iespējot visus uztvērējus';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Neizdevās noņemt uztvērēju: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Neizdevās noņemt pakalpojumu sniedzēju: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Sērijas ierakstīšanas ceļš';

  @override
  String get adminMovieRecordingPath => 'Filmu ierakstīšanas ceļš';

  @override
  String get adminGuideDaysAuto => 'Automātiski';

  @override
  String get adminRecordingPostProcessor =>
      'Pēcapstrādes lietojumprogrammas ceļš';

  @override
  String get adminRecordingPostProcessorArgs => 'Pēcapstrādes argumenti';

  @override
  String get adminSaveRecordingNfo => 'Saglabāt ierakstu NFO metadatus';

  @override
  String get adminSaveRecordingImages => 'Saglabāt ierakstu attēlus';

  @override
  String get adminLiveTvSectionPaths => 'Ierakstīšanas ceļi';

  @override
  String get adminLiveTvSectionPostProcessing => 'Pēcapstrāde';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Neizdevās saglabāt iestatījumus: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Neizdevās ielādēt TV tiešraides administrāciju';

  @override
  String get adminTunerDevices => 'Uztvērēja ierīces';

  @override
  String get adminNoTunerHosts =>
      'Nav konfigurēts neviens uztvērēja saimniekdators';

  @override
  String get adminGuideProviders => 'Ceļvežu sniedzēji';

  @override
  String get adminGuideRefreshStarted =>
      'Uzsākta programmas datu atsvaidzināšana';

  @override
  String get adminGuideRefreshUnavailable =>
      'Programmas atsvaidzināšanas uzdevums šajā serverī nav pieejams.';

  @override
  String get adminNoListingProviders =>
      'Nav konfigurēts neviens ierakstu nodrošinātājs';

  @override
  String get adminSettingsSaved => 'Iestatījumi saglabāti';

  @override
  String get adminBackupsNotAvailable =>
      'Dublējumkopijas šajā servera versijā nav pieejamas.';

  @override
  String get adminRestoreWarning1 =>
      'Atjaunojot, VISI pašreizējie servera dati tiks aizstāti ar rezerves datiem.';

  @override
  String get adminRestoreWarning2 =>
      'Pašreizējie servera iestatījumi, lietotāji un bibliotēkas dati tiks pārrakstīti.';

  @override
  String get adminRestoreWarning3 =>
      'Pēc atjaunošanas serveris tiks restartēts.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Vai atjaunot dublējumu $name tūlīt?';
  }

  @override
  String get adminBackupsTitle => 'Dublējumkopijas';

  @override
  String get adminUnknownDate => 'Nezināms datums';

  @override
  String get adminUnnamedBackup => 'Dublējums bez nosaukuma';

  @override
  String get adminApply => 'Lietot';

  @override
  String get adminLogsTitle => 'Servera žurnāli';

  @override
  String get adminLogsNewestFirst => 'Jaunākie vispirms';

  @override
  String get adminLogsOldestFirst => 'Vecākais pirmais';

  @override
  String get adminLogsJustNow => 'Tikai tagad';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'Pirms $minutes@min';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'Pirms $hours@h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d pirms';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Neizdevās ielādēt $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count atbilst';
  }

  @override
  String get adminLogViewerNoMatches => 'Nav atbilstošu līniju';

  @override
  String get adminMetadataEditorTitle => 'Metadatu redaktors';

  @override
  String get adminMetadataIdentify => 'Identificēt';

  @override
  String get adminMetadataType => 'Tips';

  @override
  String get adminMetadataDetails => 'Sīkāka informācija';

  @override
  String get adminMetadataExternalIds => 'Ārējie ID';

  @override
  String get adminMetadataImages => 'Attēli';

  @override
  String get adminMetadataFieldTitle => 'Nosaukums';

  @override
  String get adminMetadataFieldSortTitle => 'Kārtot virsrakstu';

  @override
  String get adminMetadataFieldOriginalTitle => 'Oriģinālais nosaukums';

  @override
  String get adminMetadataFieldPremiereDate =>
      'Pirmizrādes datums (GGGG-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Beigu datums (GGGG-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Ražošanas gads';

  @override
  String get adminMetadataFieldOfficialRating => 'Oficiālais vērtējums';

  @override
  String get adminMetadataFieldCommunityRating => 'Kopienas vērtējums';

  @override
  String get adminMetadataFieldCriticRating => 'Kritiķu vērtējums';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Sauklis';

  @override
  String get adminMetadataFieldOverview => 'Pārskats';

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
  String get adminMetadataGenres => 'Žanri';

  @override
  String get adminMetadataTags => 'Tagi';

  @override
  String get adminMetadataStudios => 'Studijas';

  @override
  String get adminMetadataPeople => 'Cilvēki';

  @override
  String get adminMetadataAddGenre => 'Pievienojiet žanru';

  @override
  String get adminMetadataAddTag => 'Pievienot tagu';

  @override
  String get adminMetadataAddStudio => 'Pievienojiet studiju';

  @override
  String get adminMetadataAddPerson => 'Pievienot personu';

  @override
  String get adminMetadataEditPerson => 'Rediģēt personu';

  @override
  String get adminMetadataRole => 'Loma';

  @override
  String get adminMetadataImagePrimary => 'Primārais';

  @override
  String get adminMetadataImageBackdrop => 'Fons';

  @override
  String get adminMetadataImageLogo => 'Logotips';

  @override
  String get adminMetadataImageBanner => 'Reklāmkarogs';

  @override
  String get adminMetadataImageThumb => 'Īkšķis';

  @override
  String get adminMetadataProvider => 'Pakalpojumu sniedzējs';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType attēls ir atjaunināts';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType attēls ir augšupielādēts';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType attēls ir izdzēsts';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Neizdevās lejupielādēt attēlu: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Neizdevās nolasīt atlasīto attēlu';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Neizdevās augšupielādēt attēlu: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Dzēst $imageType attēlu';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Tādējādi no vienuma tiek noņemts pašreizējais attēls.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Neizdevās izdzēst attēlu: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Izvēlieties $imageType attēlu';
  }

  @override
  String get adminMetadataUpload => 'Augšupielādēt';

  @override
  String get adminMetadataUpdate => 'Atjaunināt';

  @override
  String get adminMetadataRemoteImage => 'Attālināts attēls';

  @override
  String get adminPluginsInstalled => 'Uzstādīts';

  @override
  String get adminPluginsCatalog => 'Katalogs';

  @override
  String get adminPluginsActive => 'Aktīvs';

  @override
  String get adminPluginsRestart => 'Restartēt';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Neviens spraudnis neatbilst jūsu meklēšanas vaicājumam';

  @override
  String get adminPluginsNoneInstalled => 'Nav instalēts neviens spraudnis';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Atjauninājums pieejams: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Pieejams atjauninājums';

  @override
  String get adminPluginsPendingRemoval => 'Gaida noņemšanu pēc restartēšanas';

  @override
  String get adminPluginsChangesPending => 'Izmaiņas gaida restartēšanu';

  @override
  String get adminPluginsEnable => 'Iespējot';

  @override
  String get adminPluginsDisable => 'Atspējot';

  @override
  String get adminPluginsInstallUpdate => 'Instalējiet atjauninājumu';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instalējiet atjauninājumu (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Neviena pakotne neatbilst jūsu meklēšanas vaicājumam';

  @override
  String get adminPluginsCatalogEmpty => 'Paciņas nav pieejamas';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" tiek instalēts...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentālā integrācija';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Spraudņa iestatījumu integrācija joprojām ir eksperimentāla. Daži lauki vai izkārtojumi vēl var netikt renderēti pareizi.';

  @override
  String get adminPluginDetailToggle404 =>
      'Neizdevās pārslēgt spraudni. Serveris nevarēja atrast šo spraudņa versiju. Mēģiniet atsvaidzināt spraudņus un pēc tam mēģiniet vēlreiz.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Neizdevās pārslēgt spraudni. Lūdzu, pārbaudiet servera žurnālus, lai iegūtu sīkāku informāciju.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Iestatījumi';
  }

  @override
  String get adminPluginDetailDetails => 'Sīkāka informācija';

  @override
  String get adminPluginDetailDeveloper => 'Izstrādātājs';

  @override
  String get adminPluginDetailRepository => 'Repozitorijs';

  @override
  String get adminPluginDetailBundled => 'Komplektā';

  @override
  String get adminPluginDetailEnablePlugin => 'Iespējot spraudni';

  @override
  String get adminPluginDetailRestartRequired =>
      'Lai izmaiņas stātos spēkā, ir jārestartē serveris.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Šis spraudnis tiks noņemts pēc servera restartēšanas.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Šis spraudnis ir nepareizi darbojies un var nedarboties pareizi.';

  @override
  String get adminPluginDetailNotSupported =>
      'Pašreizējā servera versija šo spraudni neatbalsta.';

  @override
  String get adminPluginDetailSuperseded =>
      'Šis spraudnis ir aizstāts ar jaunāku versiju.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Neizdevās ielādēt krātuves: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Noņemt repozitoriju';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Vai tiešām vēlaties noņemt \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Noņemt';

  @override
  String adminReposSaveFailed(String error) {
    return 'Neizdevās saglabāt krātuves: $error';
  }

  @override
  String get adminReposEmpty => 'Nav konfigurētu repozitoriju';

  @override
  String get adminReposEmptySubtitle =>
      'Pievienojiet repozitoriju, lai pārlūkotu pieejamos spraudņus';

  @override
  String get adminReposUnnamed => '(bez nosaukuma)';

  @override
  String get adminReposEditTitle => 'Rediģēt repozitoriju';

  @override
  String get adminReposAddTitle => 'Pievienot repozitoriju';

  @override
  String get adminReposUrl => 'Repozitorija URL';

  @override
  String get adminReposNameHint => 'piem. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Nederīgs URL';

  @override
  String get adminGeneralSettingsTitle => 'Vispārīgi iestatījumi';

  @override
  String get adminGeneralMetadataLanguage => 'Vēlamā metadatu valoda';

  @override
  String get adminGeneralMetadataLanguageHint => 'piem. lv, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Vēlamā metadatu valsts';

  @override
  String get adminGeneralMetadataCountryHint => 'piem. ASV, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Bibliotēkas skenēšanas vienlaicīgums';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Paralēlā attēla kodēšanas ierobežojums';

  @override
  String get adminUnknownError => 'Nezināma kļūda';

  @override
  String get adminBrowse => 'Pārlūkot';

  @override
  String get adminCloseBrowser => 'Aizveriet pārlūkprogrammu';

  @override
  String get adminNetworkingTitle => 'Tīklošana';

  @override
  String get adminNetworkingRestartWarning =>
      'Lai veiktu izmaiņas tīkla iestatījumos, var būt nepieciešama servera restartēšana.';

  @override
  String get adminNetworkingEnableHttps => 'Iespējot HTTPS';

  @override
  String get adminNetworkingAddressHint => 'piem. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Zināmi starpniekserveri';

  @override
  String get adminNetworkingProxyHint => 'piem. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Baltais saraksts';

  @override
  String get adminNetworkingBlacklist => 'Melnais saraksts';

  @override
  String get adminNetworkingAddEntry => 'Pievienot ierakstu';

  @override
  String get adminBrandingTitle => 'Brendings';

  @override
  String get adminBrandingLoginDisclaimer => 'Pieteikšanās atruna';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML tiek parādīts zem pieteikšanās veidlapas';

  @override
  String get adminBrandingCustomCss => 'Pielāgots CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Pielāgots CSS, kas tiek lietots tīmekļa saskarnē';

  @override
  String get adminBrandingEnableSplash => 'Iespējot uzplaiksnījumu ekrānu';

  @override
  String get adminBrandingSplashUpload => 'Augšupielādēt attēlu';

  @override
  String get adminBrandingSplashUploaded => 'Sveiciena ekrāns atjaunināts';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Neizdevās augšupielādēt sveiciena ekrānu';

  @override
  String get adminBrandingSplashDeleted => 'Sveiciena ekrāns noņemts';

  @override
  String get adminBrandingNoSplash => 'Nav pielāgota sveiciena ekrāna';

  @override
  String get adminPlaybackHwAccel => 'Aparatūras paātrinājums';

  @override
  String get adminPlaybackHwAccelLabel => 'Aparatūras paātrinājums';

  @override
  String get adminPlaybackEnableHwEncoding => 'Iespējot aparatūras kodējumu';

  @override
  String get adminPlaybackQsvDevice => 'QSV ierīce';

  @override
  String get adminPlaybackEnhancedNvdec => 'Iespējot uzlaboto NVDEC dekodētāju';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Dot priekšroku sistēmas aparatūras dekodētājam';

  @override
  String get adminPlaybackColorDepth10Hevc => '10 bitu HEVC dekodēšana';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10 bitu VP9 dekodēšana';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10 bitu dekodēšana';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12 bitu dekodēšana';

  @override
  String get adminPlaybackHwEncodingSection => 'Aparatūras kodēšana';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Atļaut HEVC kodēšanu';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Atļaut AV1 kodēšanu';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Iespējot Intel mazjaudas H.264 kodētāju';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Iespējot Intel mazjaudas HEVC kodētāju';

  @override
  String get adminPlaybackToneMapping => 'Toņu kartēšana';

  @override
  String get adminPlaybackEnableTonemapping => 'Iespējot toņu kartēšanu';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Iespējot VPP toņu kartēšanu';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Iespējot VideoToolbox toņu kartēšanu';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Toņu kartēšanas algoritms';

  @override
  String get adminPlaybackTonemappingMode => 'Toņu kartēšanas režīms';

  @override
  String get adminPlaybackTonemappingRange => 'Toņu kartēšanas diapazons';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Toņu kartēšanas piesātinājuma samazināšana';

  @override
  String get adminPlaybackTonemappingPeak => 'Toņu kartēšanas maksimums';

  @override
  String get adminPlaybackTonemappingParam => 'Toņu kartēšanas parametrs';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP toņu kartēšanas spilgtums';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP toņu kartēšanas kontrasts';

  @override
  String get adminPlaybackEncoderPreset => 'Kodētāja sagatave';

  @override
  String get adminPlaybackH264Crf => 'H.264 kodēšanas CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) kodēšanas CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Rindpārlēces novēršanas metode';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Dubultot kadru nomaiņas ātrumu, novēršot rindpārlēci';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Iespējot audio VBR kodēšanu';

  @override
  String get adminPlaybackDownmixBoost => 'Audio samiksēšanas pastiprinājums';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo samiksēšanas algoritms';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Maksimālais multipleksēšanas rindas izmērs';

  @override
  String get adminPlaybackAutoOption => 'Automātiski';

  @override
  String get adminPlaybackEncoding => 'Kodēšana';

  @override
  String get adminPlaybackEncodingThreads => 'Kodēšanas pavedieni';

  @override
  String get adminPlaybackFallbackFont => 'Iespējot atkāpšanās fontu';

  @override
  String get adminPlaybackFallbackFontPath => 'Atkāpšanās fonta ceļš';

  @override
  String get adminPlaybackStreaming => 'Straumēšana';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Audiogrāmatas';

  @override
  String get adminStreamingBitrateLimit =>
      'Attālā klienta bitu pārraides ātruma ierobežojums (Mb/s)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Atstājiet tukšu vai 0, lai neierobežotu';

  @override
  String get adminTrickplayHwAccel => 'Iespējot aparatūras paātrinājumu';

  @override
  String get adminTrickplayHwEncoding => 'Iespējot aparatūras kodējumu';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Iespējot tikai atslēgas rāmja izvilkšanu';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Ātrāka, bet zemāka precizitāte';

  @override
  String get adminTrickplayNonBlocking => 'Nebloķējošs';

  @override
  String get adminTrickplayBlocking => 'Bloķēšana';

  @override
  String get adminTrickplayPriorityHigh => 'Augsts';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Virs parastā';

  @override
  String get adminTrickplayPriorityNormal => 'Normāls';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Zem normas';

  @override
  String get adminTrickplayPriorityIdle => 'Dīkstāvē';

  @override
  String get adminTrickplayImageSettings => 'Attēla iestatījumi';

  @override
  String get adminTrickplayInterval => 'Intervāls (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Cik bieži uzņemt kadrus';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Ar komatu atdalīti pikseļu platumi (piem., 320)';

  @override
  String get adminTrickplayQuality => 'Kvalitāte';

  @override
  String get adminTrickplayQScale => 'Kvalitātes skala';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Zemākas vērtības = labāka kvalitāte, lielāki faili';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kvalitāte';

  @override
  String get adminTrickplayProcessing => 'Apstrāde';

  @override
  String get adminTasksEmpty => 'Nav atrasts neviens ieplānots uzdevums';

  @override
  String get adminTasksNoFilterMatch =>
      'Neviens uzdevums neatbilst pašreizējam filtram';

  @override
  String get adminTaskCancelling => 'Notiek atcelšana...';

  @override
  String get adminTaskRunning => 'Skriešana...';

  @override
  String get adminTaskNeverRun => 'Nekad neskrien';

  @override
  String get adminTaskStop => 'Apturēt';

  @override
  String get adminRunningTasks => 'Aktīvie uzdevumi';

  @override
  String get adminTaskRun => 'Skrien';

  @override
  String get adminTaskDetailLastExecution => 'Pēdējā izpilde';

  @override
  String get adminTaskDetailStarted => 'Sākts';

  @override
  String get adminTaskDetailEnded => 'Beigās';

  @override
  String get adminTaskDetailDuration => 'Ilgums';

  @override
  String get adminTaskDetailErrorLabel => 'Kļūda:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Katru dienu $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Ik pēc $day $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Lietojumprogrammas palaišanas laikā';

  @override
  String get adminTaskTriggerTypeDaily => 'Ikdienas';

  @override
  String get adminTaskTriggerTypeWeekly => 'Iknedēļas';

  @override
  String get adminTaskTriggerTypeInterval => 'Uz intervālu';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervāls';

  @override
  String get adminTaskTriggerEveryHour => 'Katru stundu';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stundas',
      one: '$count stunda',
      zero: '$count stundu',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Laiks';

  @override
  String get adminActivityJustNow => 'Tikai tagad';

  @override
  String get adminActivityLastHour => 'Pēdējā stunda';

  @override
  String get adminActivityToday => 'Šodien';

  @override
  String get adminActivityYesterday => 'vakar';

  @override
  String get adminActivityOlder => 'Vecāks';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d pirms';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'Pirms $hours@h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'Pirms $minutes@min';
  }

  @override
  String get adminActivityNow => 'tagad';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours h';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days d.';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month-$day';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigurējiet Trickplay attēlu ģenerēšanu pārtīšanas priekšskatījuma sīktēliem.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Publisks HTTPS ports';

  @override
  String get adminNetworkingBaseUrl => 'Pamata URL';

  @override
  String get adminNetworkingBaseUrlHint => 'piem. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Publiskais HTTP ports';

  @override
  String get adminNetworkingRequireHttps => 'Pieprasīt HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Novirzīt visus attālinātos pieprasījumus uz HTTPS. Nedarbojas, ja serverim nav derīga sertifikāta.';

  @override
  String get adminNetworkingCertPassword => 'Sertifikāta parole';

  @override
  String get adminNetworkingEnableIpv4 => 'Iespējot IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Iespējot IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'LAN tīkli';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Attālais IP filtrs';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API ierīce';

  @override
  String get adminPlaybackAutomatic => '0 = automātiski';

  @override
  String get adminPlaybackTranscodeTempPath => 'Pārkodēšanas temp ceļš';

  @override
  String get adminPlaybackSegmentDeletion => 'Atļaut segmenta dzēšanu';

  @override
  String get adminPlaybackSegmentKeep => 'Segmenta saglabāšana (sekundēs)';

  @override
  String get adminPlaybackThrottleBuffering => 'Droseles buferizācija';

  @override
  String get adminPlaybackThrottleDelay => 'Ierobežošanas aizture (sekundēs)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Atļaut subtitru iegūšanu reāllaikā';

  @override
  String get adminResumeMinPct => 'Minimālais atsākšanas procents';

  @override
  String get adminResumeMinPctSubtitle =>
      'Lai saglabātu progresu, saturs ir jāatskaņo, pārsniedzot šo procentuālo daļu';

  @override
  String get adminResumeMaxPct => 'Maksimālais atsākšanas procents';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Pēc šī procentuālā daudzuma saturs tiek uzskatīts par pilnībā atskaņotu';

  @override
  String get adminResumeMinDuration =>
      'Minimālais atsākšanas ilgums (sekundēs)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Vienumus, kas ir īsāki par šo, nevar atsākt';

  @override
  String get adminTrickplayScanBehavior => 'Skenēšanas uzvedība';

  @override
  String get adminTrickplayProcessPriority => 'Procesa prioritāte';

  @override
  String get adminTrickplayTileWidth => 'Flīžu platums';

  @override
  String get adminTrickplayTileHeight => 'Flīžu augstums';

  @override
  String get adminTrickplayProcessThreads => 'Apstrādājiet pavedienus';

  @override
  String get adminTrickplayWidthResolutions => 'Platuma izšķirtspējas';

  @override
  String get adminMetadataDefault => 'Noklusējums';

  @override
  String get adminMetadataContentTypeUpdated => 'Satura veids atjaunināts';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Neizdevās atjaunināt satura veidu: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Lēnas reakcijas slieksnis (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Iespējot brīdinājumus par lēnu atbildi';

  @override
  String get adminGeneralQuickConnect => 'Iespējot Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Serveris';

  @override
  String get adminGeneralSectionMetadata => 'Metadati';

  @override
  String get adminGeneralSectionPaths => 'Ceļi';

  @override
  String get adminGeneralSectionPerformance => 'Veiktspēja';

  @override
  String get adminGeneralCachePath => 'Kešatmiņas ceļš';

  @override
  String get adminGeneralMetadataPath => 'Metadatu ceļš';

  @override
  String get adminGeneralServerName => 'Servera nosaukums';

  @override
  String get adminGeneralDisplayLanguage => 'Vēlamā attēlošanas valoda';

  @override
  String get adminSettingsLoadFailed => 'Neizdevās ielādēt iestatījumus';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Neizdevās atjaunināt kartējumus: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Laika ierobežojums: $duration';
  }

  @override
  String get folders => 'Mapes';

  @override
  String get libraries => 'Bibliotēkas';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay ir atspējota';

  @override
  String get syncPlayDisabledMessage =>
      'Iestatījumos iespējojiet SyncPlay, lai izmantotu sinhronizētu atskaņošanu.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Serveris netiek atbalstīts';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay ir nepieciešams Jellyfin serveris. Pašreizējais serveris to neatbalsta.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay grupa';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay grupa';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# dalībnieki',
      one: '# dalībnieks',
      zero: '# dalībnieku',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignorēt gaidīšanu';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Neturiet grupu augšā, kamēr šī ierīce veic buferizāciju';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Turpiniet lokāli, negaidot lēnos dalībniekus';

  @override
  String get syncPlayRepeat => 'Atkārtojiet';

  @override
  String get syncPlayRepeatOne => 'Viens';

  @override
  String get syncPlayShuffleModeShuffled => 'Sajaukts';

  @override
  String get syncPlayShuffleModeSorted => 'Sakārtots';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sinhronizēt pašreizējo atskaņošanas rindu';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Aizstāt grupas rindu ar to, kas tiek atskaņots lokāli';

  @override
  String get syncPlayLeaveGroup => 'Pamest grupu';

  @override
  String get syncPlayGroupQueue => 'Grupas rinda';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Vienums $index';
  }

  @override
  String get syncPlayPlayNow => 'Spēlējiet tagad';

  @override
  String get syncPlayCreateNewGroup => 'Izveidojiet jaunu grupu';

  @override
  String get syncPlayGroupName => 'Grupas nosaukums';

  @override
  String get syncPlayDefaultGroupName => 'Mana SyncPlay grupa';

  @override
  String get syncPlayCreateGroup => 'Izveidot grupu';

  @override
  String get syncPlayAvailableGroups => 'Pieejamās grupas';

  @override
  String get syncPlayNoGroupsAvailable => 'Nav pieejama neviena grupa';

  @override
  String get syncPlayJoinGroupQuestion => 'Vai pievienoties SyncPlay grupai?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Pievienošanās SyncPlay grupai var aizstāt pašreizējo atskaņošanas rindu. Vai turpināt?';

  @override
  String get syncPlayJoin => 'Pievienojieties';

  @override
  String get syncPlayStateIdle => 'Dīkstāvē';

  @override
  String get syncPlayStateWaiting => 'Gaida';

  @override
  String get syncPlayStatePaused => 'Pauzēts';

  @override
  String get syncPlayStatePlaying => 'Spēlē';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName pievienojās SyncPlay grupai';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName pameta SyncPlay grupu';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay piekļuve liegta';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Jums nav piekļuves vienam vai vairākiem šīs SyncPlay grupas vienumiem. Lūdziet grupas īpašniekam pārbaudīt bibliotēkas atļaujas vai izvēlēties citu rindu.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Notiek atskaņošanas sinhronizēšana ar $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Balss meklēšana nav pieejama.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct Play neizdevās';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Neizdevās sākt tiešo atskaņošanu šai Dolby Vision straumei. Vai mēģināt vēlreiz izmantot servera pārkodēšanu?';

  @override
  String get retryWithTranscode => 'Mēģiniet vēlreiz, izmantojot pārkodēšanu';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision netiek atbalstīts';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Šī ierīce nevar tieši atšifrēt Dolby Vision saturu. Izmantojiet HDR10 atkāpšanos vai pieprasiet servera pārkodēšanu.';

  @override
  String get rememberMyChoice => 'Atcerieties manu izvēli';

  @override
  String get playHdr10Fallback => 'Atskaņojiet HDR10 atkāpšanos';

  @override
  String get requestTranscode => 'Pieprasīt pārkodēšanu';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'atrastas # rindas',
      one: 'atrasta # rinda',
      zero: 'atrasts # rindu',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Skatīt visu';

  @override
  String get noItems => 'Nav vienumu';

  @override
  String get switchUser => 'Pārslēgt lietotāju';

  @override
  String get remoteControl => 'Tālvadības pults';

  @override
  String get mediaBarLoading => 'Notiek multivides joslas ielāde...';

  @override
  String get mediaBarError => 'Multivides joslu neizdevās ielādēt';

  @override
  String get offlineServerUnavailable =>
      'Izveidots savienojums ar internetu, bet pašreizējais serveris nav pieejams.';

  @override
  String get offlineNoInternet =>
      'Jūs esat bezsaistē. Ir pieejams tikai lejupielādētais saturs.';

  @override
  String get offlineFileNotAvailable => 'Fails nav pieejams';

  @override
  String get offlineSwitchServer => 'Pārslēgt serveri';

  @override
  String get offlineSavedMedia => 'Saglabātie multivides līdzekļi';

  @override
  String get offlineBannerTitle => 'Jūs esat bezsaistē';

  @override
  String get offlineBannerSubtitle => 'Tiek rādītas jūsu lejupielādes';

  @override
  String get serverUnreachableBannerTitle => 'Nevar sasniegt serveri';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Līdz servera atjaunošanai atskaņo no lejupielādēm';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Attālā atskaņošana';

  @override
  String castControlFailed(String error) {
    return 'Apraides vadība neizdevās: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind vadīklas';
  }

  @override
  String get castDeviceVolume => 'Ierīces skaļums';

  @override
  String get castVolumeUnavailable => 'Nav pieejams';

  @override
  String castStopKind(String kind) {
    return 'Apturēt $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Subtitri';

  @override
  String get pinConfirmTitle => 'Apstipriniet PIN';

  @override
  String get pinSetTitle => 'Iestatiet PIN';

  @override
  String get pinEnterTitle => 'Ievadiet PIN';

  @override
  String get pinReenterToConfirm =>
      'Atkārtoti ievadiet savu PIN, lai apstiprinātu';

  @override
  String pinEnterNDigit(int length) {
    return 'Ievadiet $length ciparu PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Ievadiet savu $length ciparu PIN';
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
  String get pinIncorrect => 'Nepareizs PIN';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN kodi nesakrīt';

  @override
  String get pinForgot => 'Aizmirsāt PIN?';

  @override
  String get pinClear => 'Notīrīt';

  @override
  String get pinBackspace => 'Atpakaļatkāpe';

  @override
  String get quickConnectAuthorized =>
      'Quick Connect pieprasījums apstiprināts.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect kods nav derīgs vai tam beidzies termiņš.';

  @override
  String get quickConnectNotSupported =>
      'Šis serveris neatbalsta Quick Connect.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Neizdevās apstiprināt Quick Connect kodu.';

  @override
  String get quickConnectDisabled => 'Šajā serverī Quick Connect ir atspējots.';

  @override
  String get quickConnectForbidden =>
      'Jūsu konts nevar apstiprināt šo Quick Connect pieprasījumu.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect kods netika atrasts. Mēģiniet jaunu kodu.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect neizdevās: $message';
  }

  @override
  String get quickConnectEnterCode => 'Ievadiet kodu';

  @override
  String get quickConnectAuthorize => 'Autorizēt';

  @override
  String remoteCommandFailed(String error) {
    return 'Komanda neizdevās: $error';
  }

  @override
  String get remoteControlTitle => 'Tālvadības pults';

  @override
  String get remoteFailedToLoadSessions => 'Neizdevās ielādēt sesijas';

  @override
  String get remoteNoSessions => 'Nav kontrolējamu sesiju';

  @override
  String get remoteStartPlayback => 'Sāciet atskaņošanu citā ierīcē';

  @override
  String get unknownUser => 'Nezināms';

  @override
  String get unknownItem => 'Nezināms';

  @override
  String get remoteNothingPlaying => 'Šajā sesijā nekas netiek atskaņots';

  @override
  String get castingStarted => 'Apraide tika sākta atlasītajā ierīcē';

  @override
  String castingFailed(String error) {
    return 'Neizdevās sākt apraidi: $error';
  }

  @override
  String get noRemoteDevices => 'Nav pieejamas attālās atskaņošanas ierīces.';

  @override
  String get noRemoteDevicesIos =>
      'Nav pieejamas attālās atskaņošanas ierīces.\n\nOperētājsistēmā iOS simulatorā AirPlay mērķi var nebūt pieejami.';

  @override
  String get trackActionPlayNext => 'Spēlēt nākamo';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Pievienot rindai';

  @override
  String get trackActionAddToPlaylist => 'Pievienot atskaņošanas sarakstam';

  @override
  String get trackActionCancelDownload => 'Atcelt lejupielādi';

  @override
  String get trackActionDeleteFromPlaylist => 'Dzēst no atskaņošanas saraksta';

  @override
  String get trackActionMoveUp => 'Pārvietot uz augšu';

  @override
  String get trackActionMoveDown => 'Pārvietot uz leju';

  @override
  String get trackActionRemoveFromFavorites => 'Noņemt no izlases';

  @override
  String get trackActionAddToFavorites => 'Pievienot izlasei';

  @override
  String get trackActionGoToAlbum => 'Dodieties uz albumu';

  @override
  String get trackActionGoToArtist => 'Dodieties uz Mākslinieks';

  @override
  String trackActionDownloading(String name) {
    return 'Notiek lejupielāde $name...';
  }

  @override
  String get trackActionDeletedFile => 'Izdzēsts lejupielādētais fails';

  @override
  String get trackActionDeleteFileFailed =>
      'Nevarēja izdzēst lejupielādēto failu';

  @override
  String get shuffleBy => 'Jauktā secībā pēc';

  @override
  String get shuffleSelectLibrary => 'Atlasiet Bibliotēka';

  @override
  String get shuffleSelectGenre => 'Izvēlieties Žanrs';

  @override
  String get shuffleLibrary => 'Bibliotēka';

  @override
  String get shuffleGenre => 'Žanrs';

  @override
  String get shuffleNoLibraries => 'Nav pieejama neviena saderīga bibliotēka.';

  @override
  String get shuffleNoGenres =>
      'Šim jaukšanas režīmam netika atrasts neviens žanrs.';

  @override
  String get posterDisplayTitle => 'Displejs';

  @override
  String get posterImageType => 'Attēla veids';

  @override
  String get imageTypePoster => 'Plakāts';

  @override
  String get imageTypeThumbnail => 'Sīktēls';

  @override
  String get imageTypeBanner => 'Reklāmkarogs';

  @override
  String get playlistAddFailed => 'Neizdevās pievienot atskaņošanas sarakstam';

  @override
  String get playlistCreateFailed => 'Neizdevās izveidot atskaņošanas sarakstu';

  @override
  String get playlistNew => 'Jauns atskaņošanas saraksts';

  @override
  String get playlistCreate => 'Izveidot';

  @override
  String get playlistCreateNew => 'Izveidojiet jaunu atskaņošanas sarakstu';

  @override
  String get playlistNoneFound => 'Nav atrasts neviens atskaņošanas saraksts';

  @override
  String get addToPlaylist => 'Pievienot atskaņošanas sarakstam';

  @override
  String get lyricsNotAvailable => 'Dziesmu vārdi nav pieejami';

  @override
  String get upNext => 'Uz augšu Nākamais';

  @override
  String get playNext => 'Spēlēt nākamo';

  @override
  String get stillWatchingContent =>
      'Atskaņošana ir apturēta. Vai jūs joprojām skatāties?';

  @override
  String get stillWatchingStop => 'Apturēt';

  @override
  String get stillWatchingContinue => 'Turpināt';

  @override
  String skipSegment(String segment) {
    return 'Izlaist $segment';
  }

  @override
  String get liveTv => 'TV tiešraide';

  @override
  String get continueWatchingAndNextUp => 'Turpināt skatīties un nākamais';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Notiek lejupielāde $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Notiek lejupielāde $fileName';
  }

  @override
  String get nextEpisode => 'Nākamā sērija';

  @override
  String get moreFromThisSeason => 'Vairāk no šīs sezonas';

  @override
  String get playerTooltipPlaybackSpeed => 'Atskaņošanas ātrums';

  @override
  String get playerTooltipCastControls => 'Cast vadīklas';

  @override
  String get playerTooltipPlaybackQuality => 'Bitu pārraides ātrums';

  @override
  String get playerTooltipEnterFullscreen => 'Ieiet pilnekrāna režīmā';

  @override
  String get playerTooltipExitFullscreen => 'Iziet pilnekrāna režīmā';

  @override
  String get playerTooltipFloatOnTop => 'Uzpeld virsū';

  @override
  String get playerTooltipExitFloatOnTop => 'Atspējot pludiņu augšpusē';

  @override
  String get playerTooltipLockLandscape => 'Bloķēt ainavu';

  @override
  String get playerTooltipUnlockOrientation => 'Atļaut rotāciju';

  @override
  String get playerTooltipPrevious => 'Iepriekšējais';

  @override
  String get playerTooltipSeekBack => 'Meklējiet atpakaļ';

  @override
  String get playerTooltipSeekForward => 'Meklējiet uz priekšu';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Atzīmēt kā skatītu';

  @override
  String get contextMenuMarkUnwatched => 'Atzīmēt kā neskatītu';

  @override
  String get contextMenuAddToFavorites => 'Pievienot izlasei';

  @override
  String get contextMenuRemoveFromFavorites => 'Noņemt no izlases';

  @override
  String get contextMenuGoToSeries => 'Dodieties uz sēriju';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Slēpt no “Turpināt skatīties”';

  @override
  String get contextMenuHideFromNextUp => 'Slēpt no “Nākamais”';

  @override
  String get contextMenuAddToCollection => 'Pievienot kolekcijai';

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
      'Piekļūstiet servera administrācijas panelim';

  @override
  String get settingsDynamicContent => 'Dinamisks saturs';

  @override
  String get settingsDynamicContentSubtitle =>
      'Multivides josla un vizuālie pārklājumi';

  @override
  String get settingsAboutSubtitle =>
      'Lietotnes versija, juridiskā informācija un kredīti';

  @override
  String get settingsSortServersBy => 'Kārtot serverus pēc';

  @override
  String get settingsLastUsed => 'Pēdējo reizi lietots';

  @override
  String get settingsAlphabetical => 'Alfabētiskā secībā';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Atļaut pašparakstītus sertifikātus';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Uzticēties serveriem, kas izmanto pašparakstītus vai privātas CA TLS sertifikātus. Iespējojiet tikai saviem serveriem. Tas atspējo sertifikātu pārbaudi visiem savienojumiem.';

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
  String get settingsHomePage => 'Mājas lapa';

  @override
  String get settingsTwentyFourHourClock => '24 stundu pulkstenis';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Izmantojiet 24 stundu laika formatējumu visur, kur tiek rādīts pulkstenis';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Parādiet jaukšanas pogu navigācijas joslā';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Rādīt žanru pogu navigācijas joslā';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Parādiet izlases pogu navigācijas joslā';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Parādiet bibliotēkas pogu navigācijas joslā';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Rādīt Seerr pogu navigācijas joslā';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Vienmēr rādīt teksta nosaukumus augšējā navigācijas joslā';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Pārslēgt mājas lapas redzamību katrai bibliotēkai. Restartējiet Moonfin, lai izmaiņas stātos spēkā.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Multivides josla un vietējie priekšskatījumi';

  @override
  String get settingsVisualOverlays => 'Vizuālie pārklājumi';

  @override
  String get settingsSeasonalSurprise => 'Sezonas pārsteigums';

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
  String get settingsHigh => 'Augsts';

  @override
  String get settingsLow => 'Zems';

  @override
  String get settingsCustomPath => 'Pielāgots ceļš';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Ievadiet lejupielādes mapes ceļu';

  @override
  String get settingsConcurrentDownloads => 'Vienlaicīgas lejupielādes';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maksimālais vienlaikus lejupielādējamo vienumu skaits.';

  @override
  String get settingsAppInfo => 'LIETOTNES INFORMĀCIJA';

  @override
  String get settingsReportAnIssue => 'Ziņot par problēmu';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Atveriet problēmu izsekotāju vietnē GitHub';

  @override
  String get settingsJoinDiscord => 'Pievienojieties Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Tērzējiet ar kopienu';

  @override
  String get settingsJoinTheDiscord => 'Pievienojieties Discord';

  @override
  String get settingsSupportMoonfin => 'Atbalstiet Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Uzsauciet izstrādātājam kafiju';

  @override
  String get settingsLegal => 'JURIDISKĀS';

  @override
  String get settingsLicenses => 'Licences';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Atvērtā koda licences paziņojumi';

  @override
  String get settingsPrivacyPolicy => 'Privātuma politika';

  @override
  String get settingsPrivacyPolicySubtitle => 'Kā Moonfin apstrādā jūsu datus';

  @override
  String get settingsCheckForUpdates => 'Pārbaudiet atjauninājumus';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Pārbaudiet jaunāko Moonfin versiju';

  @override
  String get settingsBoth => 'Abi';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Satura tipa filtrs jauktā secībā';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Audio celiņi, apstrāde un caurlaides iespējas';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatizēta atskaņošana un secība';

  @override
  String get settingsSyncplaySubtitle => 'Sinhronizācijas loģika grupu sesijām';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Vai izlaist ievadus un noslēgumus?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown =>
      'Multivides segmenta atpakaļskaitīšana';

  @override
  String get settingsProgressBar => 'Progresa josla';

  @override
  String get settingsTimer => 'Taimeris';

  @override
  String get settingsNone => 'Nav';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Pamudināt lietotāju';

  @override
  String get settingsSkip => 'Izlaist';

  @override
  String get settingsDoNothing => 'Nedariet neko';

  @override
  String get settingsMaxBitrateDescription =>
      'Ierobežojiet straumēšanas bitu pārraides ātrumu. Saturs, kas pārsniedz šo slieksni, tiks pārkodēts, lai tas ietilptu.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ierobežojiet maksimālo izšķirtspēju, ko atskaņotājs pieprasīs. Augstākas izšķirtspējas saturs tiks pārkodēts uz leju.';

  @override
  String get settingsPlayerZoomDescription =>
      'Kā video mērogot, lai tas atbilstu ekrānam.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Izvēlieties noklusējuma atskaņošanas programmu Android TV ierīcēs. Izmaiņas attiecas uz nākamo atskaņošanas sesiju.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (ieteicams)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (mantots)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision atkāpšanās';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision nosaukumu darbība ierīcēs bez Dolby Vision dekodēšanas.';

  @override
  String get settingsAskEachTime => 'Jautājiet katru reizi';

  @override
  String get settingsPreferHdr10Fallback =>
      'Dodiet priekšroku HDR10 atkāpšanās režīmam';

  @override
  String get settingsPreferServerTranscode =>
      'Dod priekšroku servera pārkodēšanai';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 tiešā atskaņošana';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Kontrolē, vai Dolby Vision 7. profila uzlabošanas slāņa straumēm ir jāvirza atskaņošana.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automātiski (AFTKRT iespējots)';

  @override
  String get settingsEnabledOnThisDevice => 'Iespējots šajā ierīcē';

  @override
  String get settingsDisabledPreferTranscode => 'Atspējots (vēlams pārkodēt)';

  @override
  String get settingsResumeRewindDescription =>
      'Cik sekundes vajadzētu attīt, atsākot atskaņošanu (no Turpināt skatīšanos vai multivides vienuma lapas)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Cik sekundes vajadzētu attīt, atsākot atskaņošanu pēc pauzes pogas nospiešanas?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Cik sekundes pāriet atpakaļ pēc attīšanas pogas nospiešanas.';

  @override
  String get settingsOneSecond => '1 sekunde';

  @override
  String get settingsThreeSeconds => '3 sekundes';

  @override
  String get settingsFortyFiveSeconds => '45 sekundes';

  @override
  String get settingsSixtySeconds => '60 sekundes';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Cik sekundes, lai pārietu uz priekšu pēc pārtīšanas pogas nospiešanas.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitu plūsma AC3 ārējam dekodētājam';

  @override
  String get settingsCinemaMode => 'Kino režīms';

  @override
  String get settingsCinemaModeSubtitle =>
      'Pirms galvenās funkcijas atskaņojiet reklāmkadrus/prerolls';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Paplašinātajā versijā tiek rādīta pilna kartīte ar sērijas noformējumu un aprakstu. Minimāls parāda kompaktu atpakaļskaitīšanas pārklājumu. Atspējots, uzvedne tiek paslēpta pilnībā.';

  @override
  String get settingsShort => 'Īss';

  @override
  String get settingsLong => 'Garš';

  @override
  String get settingsVeryLong => 'Ļoti garš';

  @override
  String get settingsVideoStartDelay => 'Video sākuma aizkave';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV tiešraide';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Iespējot tiešo atskaņošanu TV tiešraidei';

  @override
  String get settingsOpenGroups => 'Atveriet Grupas';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Izveidojiet SyncPlay grupas, pievienojieties tām vai pārvaldiet tās';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay iespējots';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Iespējot grupas skatīšanās funkcijas';

  @override
  String get settingsSyncplayButton => 'SyncPlay poga';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Parādiet pogu SyncPlay navigācijas joslā';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Papildu korekcija';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Iespējot precīzas sinhronizācijas loģiku';

  @override
  String get settingsSyncplaySyncCorrection => 'Sinhronizācijas korekcija';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Automātiski pielāgojiet atskaņošanu, lai saglabātu sinhronizāciju';

  @override
  String get settingsSyncplaySpeedToSync => 'Sinhronizācijas ātrums';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Lai sinhronizētu, izmantojiet atskaņošanas ātruma regulēšanu';

  @override
  String get settingsSyncplaySkipToSync => 'Pāriet uz sinhronizāciju';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Izmantojiet meklēšanu, lai sinhronizētu';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Minimālā ātruma aizkave';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Maksimālā ātruma aizkave';

  @override
  String get settingsSyncplaySpeedDuration => 'Ātruma ilgums';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimālā izlaišanas aizkave';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay papildu nobīde';

  @override
  String get onNow => 'Ieslēgts Tagad';

  @override
  String get collections => 'Kolekcijas';

  @override
  String get lastPlayed => 'Pēdējo reizi spēlēts';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Jaunākais $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Nesen izdots: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Automātiski atskaņot nākamo sēriju';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automātiski atskaņot nākamo sēriju, kad tā ir pieejama.';

  @override
  String get skipSilenceTitle => 'Izlaist klusumu';

  @override
  String get skipSilenceSubtitle =>
      'Automātiski izlaist klusos audio segmentus, ja to atbalsta straume.';

  @override
  String get allowExternalAudioEffectsTitle => 'Atļaut ārējos audio efektus';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Atļaut ekvalaizera un efektu lietotnēm (piem., Wavelet) pievienoties Media3 atskaņošanas sesijām.';

  @override
  String get disableTunnelingTitle => 'Atspējot tunelēšanu';

  @override
  String get disableTunnelingSubtitle =>
      'Piespiedu atskaņošana bez tunelēšanas. Noderīga ierīcēm ar tunelēšanas audio/video pārtraukumiem.';

  @override
  String get enableTunnelingTitle => 'Iespējot tunelēšanu';

  @override
  String get enableTunnelingSubtitle =>
      'Paplašināts. Novirza audio un video caur saistītu aparatūras ceļu. Pēc noklusējuma izslēgts, jo dažās ierīcēs tas rada audio un video pārrāvumus.';

  @override
  String get mapDolbyVisionP7Title => 'Kartē Dolby Vision profilu 7 ar HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Atskaņojiet Dolby Vision profila 7 straumes kā ar HDR10 saderīgu HEVC ierīcēs, kas nav DV.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Izmantojiet iegultos subtitru stilus';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Lietojiet subtitru celiņā iegultās krāsas, fontus un novietojumu. Atspējojiet, lai tā vietā izmantotu subtitru stila preferences.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Izmantojiet iegultos subtitru fontu izmērus';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Lietojiet subtitru celiņā iegultos fonta lieluma ieteikumus. Atspējojiet, lai izmantotu subtitru izmēru no jūsu stila preferencēm.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Rādīt multivides informāciju';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Rādīt izvēlētā vienuma informāciju bibliotēkas lapu augšdaļā.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings =>
      'Izmantojiet detalizētus apakšvirsrakstus';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Rādīt detalizētu vai minimālu apakšrindu bibliotēkas lapās.';

  @override
  String get savedThemesDeleteDialogTitle => 'Vai dzēst saglabāto motīvu?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Vai noņemt \"$themeName\" no šīs ierīces kešatmiņas?';
  }

  @override
  String get themeStore => 'Tēmu veikals';

  @override
  String get themeStoreSubtitle => 'Pārlūkojiet un saglabājiet kopienas tēmas';

  @override
  String get themeStoreDescription =>
      'Saglabājiet tēmu, lai to izmantotu tāpat kā citas saglabātās tēmas.';

  @override
  String get themeStoreEmpty => 'Pašlaik nav pieejama neviena tēma.';

  @override
  String get themeStoreLoadFailed =>
      'Neizdevās ielādēt tēmu veikalu. Pārbaudiet savienojumu un mēģiniet vēlreiz.';

  @override
  String get themeStoreSave => 'Saglabāt';

  @override
  String get themeStoreSaveAndApply => 'Saglabāt un lietot';

  @override
  String get themeStoreSaved => 'Saglabāts';

  @override
  String get themeStoreInvalidMessage => 'Šo tēmu neizdevās ielādēt.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Saglabāts “$themeName”.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Izdzēsts \"$themeName\" no šīs ierīces.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Nevarēja izdzēst \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Saglabātie motīvi';

  @override
  String get savedThemesDescription =>
      'Tie ir motīvi, kas lejupielādēti no pašreizējā servera spraudņa Moonfin. Dzēšot, tiek noņemta tikai šī vietējā kopija.';

  @override
  String get savedThemesEmpty =>
      'Šim serverim netika atrasts neviens saglabāts motīvs.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Pašlaik aktīvs';
  }

  @override
  String get savedThemesDeleteTooltip => 'Dzēst saglabāto motīvu';

  @override
  String get savedThemesManageSubtitle =>
      'Pārvaldiet šajā ierīcē lejupielādētos spraudņu motīvus';

  @override
  String get themeEditor => 'Tēmas redaktors';

  @override
  String get themeEditorSubtitle =>
      'Pārlūkprogrammā atveriet Moonfin motīvu redaktoru';

  @override
  String get homeScreen => 'Sākuma ekrāns';

  @override
  String get bottomBar => 'Apakšējā josla';

  @override
  String get homeRowsStyleClassic => 'Klasika';

  @override
  String get homeRowsStyleModern => 'Mūsdienīgs';

  @override
  String get homeRowsSection => 'Sākuma rindas';

  @override
  String get rowsType => 'Rindu veids';

  @override
  String get rowsTypeDescription =>
      'Classic saglabā katras rindas attēla veidu un informācijas pārklājumu. Modern izmanto rindas no portreta uz fonu.';

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
  String get displayFavoritesRows => 'Parādīt izlases rindas';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Rādīt iecienītākās filmas, seriālus un citas iecienītākās rindas sākuma sadaļās.';

  @override
  String get favoritesRowSorting => 'Izlases rindu kārtošana';

  @override
  String get favoritesRowSortingDescription =>
      'Kārtot izlases rindas pēc pievienošanas datuma, izlaišanas datuma, alfabēta un daudz ko citu.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Parādīt kolekciju rindas';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Rādīt kolekciju rindas sākuma sadaļās.';

  @override
  String get collectionsRowSorting => 'Kolekciju rindu šķirošana';

  @override
  String get collectionsRowSortingDescription =>
      'Kārtot kolekciju rindas pēc pievienošanas datuma, izlaišanas datuma, alfabēta un daudz ko citu.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Rādīt žanru rindas';

  @override
  String get displayGenresRowsSubtitle => 'Rādīt Žanru rindas sākuma sadaļās.';

  @override
  String get genresRowSorting => 'Žanri rindu šķirošana';

  @override
  String get genresRowSortingDescription =>
      'Kārtot Žanru rindas pēc pievienošanas datuma, izlaišanas datuma, alfabēta un daudz ko citu.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Žanri Rindas vienumi';

  @override
  String get genresRowItemsDescription =>
      'Rādīt filmas, seriālus vai abus rindās Žanri.';

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
  String get displayPlaylistsRows => 'Rādīt atskaņošanas sarakstu rindas';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Rādīt atskaņošanas sarakstu rindas sākuma ekrāna sadaļās.';

  @override
  String get playlistsRowSorting => 'Atskaņošanas sarakstu rindu kārtošana';

  @override
  String get playlistsRowSortingDescription =>
      'Kārtojiet atskaņošanas sarakstu rindas pēc pievienošanas datuma, izdošanas datuma, alfabēta un citiem kritērijiem.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Rādīt audio rindas';

  @override
  String get displayAudioRowsSubtitle =>
      'Rādīt audio rindas sākuma ekrāna sadaļās.';

  @override
  String get audioRowsSorting => 'Audio rindu kārtošana';

  @override
  String get audioRowsSortingDescription =>
      'Kārtojiet audio rindas pēc pievienošanas datuma, izdošanas datuma, alfabēta un citiem kritērijiem.';

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
  String get audioPlaylists => 'Audio atskaņošanas saraksti';

  @override
  String get appearance => 'Izskats';

  @override
  String get layout => 'Izkārtojums';

  @override
  String get theme => 'Tēma';

  @override
  String get keyboard => 'Tastatūra';

  @override
  String get navButtons => 'Pogas';

  @override
  String get rendering => 'Renderēšana';

  @override
  String get mpvConfiguration => 'MPV konfigurācija';

  @override
  String get cardSize => 'Kartes izmērs';

  @override
  String get externalPlayerApp => 'Ārējā atskaņotāja lietotne';

  @override
  String get externalPlayerAppDescription =>
      'Iestatiet ārējo atskaņotāju, lai iespējotu atskaņošanu ar ilgu piespiešanu';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Rādīt lietotņu atlasītāju, kad sākas atskaņošana.';

  @override
  String get loadingInstalledPlayers =>
      'Notiek instalēto atskaņotāju ielāde...';

  @override
  String get connection => 'Savienojums';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Caurlaide';

  @override
  String get supportedOnThisDevice => 'Atbalstīts šajā ierīcē';

  @override
  String get notSupportedOnThisDevice => 'Netiek atbalstīts šajā ierīcē';

  @override
  String get mediaPlayerBehavior => 'Multivides atskaņotāja uzvedība';

  @override
  String get playbackEnhancements => 'Atskaņošanas uzlabojumi';

  @override
  String get alwaysOn => 'Vienmēr ieslēgts.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Nomainiet Skip Outro ar nākamo displeju';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Rādīt pārklājumu Next Up, nevis pogu Izlaist Outro.';

  @override
  String get playerRouting => 'Spēlētāja maršrutēšana';

  @override
  String get preferSoftwareDecoders =>
      'Dodiet priekšroku programmatūras dekodētājiem';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Pirms aparatūras dekodētājiem izmantojiet FFmpeg (audio) un libgav1 (AV1). Atspējot, ja pārtrūkst HDMI audio caurlaide.';

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
  String get useExternalPlayer => 'Izmantojiet ārējo atskaņotāju';

  @override
  String get useExternalPlayerSubtitle =>
      'Atveriet video atskaņošanu Android TV atlasītajā ārējā lietotnē.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Automātiskā rindā';

  @override
  String get preferSdhSubtitles => 'Dodiet priekšroku SDH subtitriem';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Veicot automātisko atlasi, piešķiriet prioritāti SDH/CC subtitru celiņiem.';

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
  String get webDiagnostics => 'Web diagnostika';

  @override
  String get webDiagnosticsTitle => 'Moonfin Tīmekļa diagnostika';

  @override
  String get webDiagnosticsIntro =>
      'Izmantojiet šo lapu, lai diagnosticētu pārlūkprogrammas savienojamības problēmas (CORS, jaukts saturs un atklāšanas iestatījumi).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Konstatēta jaukta satura kļūme';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Konstatēta CORS/pirmslidojuma kļūme';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin atklāja HTTPS lapu, kas mēģina izsaukt HTTP servera URL. Pārlūkprogrammas bloķē šo pieprasījumu, pirms tas sasniedz jūsu serveri.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin atklāja pārlūkprogrammas līmeņa pieprasījuma kļūmi, ko parasti izraisa trūkstošas ​​CORS vai pirmspārbaudes galvenes multivides serverī.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Mērķa URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detalizēta informācija: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Pašreizējais izpildlaika konteksts';

  @override
  String get webDiagnosticsOrigin => 'Izcelsme';

  @override
  String get webDiagnosticsScheme => 'Shēma';

  @override
  String get webDiagnosticsPluginMode => 'Spraudņa režīms';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC skenēšana';

  @override
  String get webDiagnosticsForcedServerUrl => 'Piespiedu servera URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Noklusējuma servera URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'Atklāšanas starpniekservera URL';

  @override
  String get notConfigured => 'nav konfigurēts';

  @override
  String get webDiagnosticsMixedContent => 'Jaukts saturs';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Šī lapa tiek ielādēta, izmantojot HTTPS, bet viens vai vairāki konfigurētie URL ir HTTP. Pārlūkprogrammas neļauj HTTPS lapām izsaukt HTTP API.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Labojums: apkalpojiet multivides serveri vai starpniekservera galapunktu, izmantojot HTTPS, vai ielādējiet Moonfin, izmantojot HTTP, tikai uzticamos lokālos tīklos.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Pašreizējos izpildlaika iestatījumos nav konstatēta acīmredzama jaukta satura konfigurācija.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS kontrolsaraksts';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Atļaut pārlūkprogrammas izcelsmi sadaļā Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Sadaļā Access-Control-Allow-Headers iekļaujiet autorizāciju, X-Emby-Authorization un X-Emby-Token.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Atklājiet satura diapazonu un akceptēt diapazonus straumēšanai un meklēšanai.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Atgrieziet 204. pie OPTIONS pirmslidojuma pieprasījumiem.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Galvenes fragmenta piemērs (nginx stilā)';

  @override
  String get note => 'Piezīme';

  @override
  String get webDiagnosticsNonWebNote =>
      'Šis diagnostikas maršruts ir paredzēts tīmekļa būvēšanai. Ja to redzat citā platformā, šīs pārbaudes var nebūt spēkā.';

  @override
  String get backToServerSelect => 'Atpakaļ uz serveri Izvēlieties';

  @override
  String get signOutAllUsers => 'Izrakstīties no visiem lietotājiem';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofona atļauja ir neatgriezeniski liegta. Iespējojiet to sistēmas iestatījumos.';

  @override
  String get voiceSearchPermissionRequired =>
      'Balss meklēšanai ir nepieciešama mikrofona atļauja.';

  @override
  String get voiceSearchNoMatch => 'To nesapratu. Mēģiniet vēlreiz.';

  @override
  String get voiceSearchNoSpeechDetected => 'Runa nav konstatēta.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofona kļūda.';

  @override
  String get voiceSearchNeedsInternet =>
      'Balss meklēšanai nepieciešams internets.';

  @override
  String get voiceSearchServiceBusy =>
      'Balss pakalpojums ir aizņemts. Mēģiniet vēlreiz.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofona atļauja ir neatgriezeniski liegta.';

  @override
  String get microphonePermissionDenied => 'Mikrofona atļauja ir liegta.';

  @override
  String get speechRecognitionUnavailable =>
      'Runas atpazīšana šajā ierīcē nav pieejama.';

  @override
  String get openIosRoutePicker => 'Atveriet iOS maršruta atlasītāju';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay maršruta atlasītājs šajā ierīcē nav pieejams.';

  @override
  String get videos => 'Videoklipi';

  @override
  String get programs => 'Programmas';

  @override
  String get songs => 'Dziesmas';

  @override
  String get photoAlbums => 'Fotoalbumi';

  @override
  String get photos => 'Fotogrāfijas';

  @override
  String get people => 'Cilvēki';

  @override
  String get recentlyReleasedEpisodes => 'Nesen iznākušās sērijas';

  @override
  String get watchAgain => 'Skatīties vēlreiz';

  @override
  String get guestAppearances => 'Viesu uzstāšanās';

  @override
  String get appearancesSeerr => 'Parādīšanās (Seerr)';

  @override
  String get crewContributionsSeerr => 'Filmēšanas grupas darbi (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Skatieties kopā ar grupu';

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
  String get disk => 'Disks';

  @override
  String get openInBrowser => 'Atvērt pārlūkprogrammā';

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
      'Iegultā pārlūkprogramma šajā platformā nav pieejama.';

  @override
  String get adminRestartServerConfirmation =>
      'Vai tiešām vēlaties restartēt serveri?';

  @override
  String get adminShutdownServerConfirmation =>
      'Vai tiešām vēlaties izslēgt serveri? Jums tas būs jārestartē manuāli.';

  @override
  String get internal => 'Iekšējā';

  @override
  String get idle => 'Dīkstāvē';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nav atrasts neviens lietotājs';

  @override
  String get adminNoUsersMatchSearch =>
      'Neviens lietotājs neatbilst jūsu meklēšanas vaicājumam';

  @override
  String get adminNoDevicesFound => 'Netika atrasta neviena ierīce';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Neviena ierīce neatbilst pašreizējiem filtriem';

  @override
  String get remoteAccess => 'Attālā piekļuve';

  @override
  String get localOnly => 'Tikai vietējais';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Neizdevās ielādēt multivides analīzi';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Apvienotā analīze visās multivides bibliotēkās.';

  @override
  String get analyticsTopArtists => 'Labākie mākslinieki';

  @override
  String get analyticsTopAuthors => 'Populārākie autori';

  @override
  String get analyticsTopContributors => 'Aktīvākie līdzstrādnieki';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bibliotēkas',
      one: '$count bibliotēka',
      zero: '$count bibliotēku',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Šai atlasei vēl nav pieejama neviena indeksētā multivides kopsumma.';

  @override
  String get analyticsLibraryDetails => 'Bibliotēkas informācija';

  @override
  String get analyticsLibraryBreakdown => 'Bibliotēkas sadalījums';

  @override
  String get analyticsNoLibrariesAvailable => 'Bibliotēkas nav pieejamas.';

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
  String get adminServerAdministrationTitle => 'Servera administrēšana';

  @override
  String get adminServerPathData => 'Dati';

  @override
  String get adminServerPathImageCache => 'Attēlu kešatmiņa';

  @override
  String get adminServerPathCache => 'Kešatmiņa';

  @override
  String get adminServerPathLogs => 'Baļķi';

  @override
  String get adminServerPathMetadata => 'Metadati';

  @override
  String get adminServerPathTranscode => 'Pārkodēt';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Šis serveris neatgrieza nevienu servera ceļu.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% izmantoti';
  }

  @override
  String get userActivity => 'Lietotāja darbība';

  @override
  String get systemEvents => 'Sistēmas notikumi';

  @override
  String get needsAttention => 'Nepieciešama uzmanība';

  @override
  String get homeVideos => 'Mājas video';

  @override
  String get mixedContent => 'Jaukts saturs';

  @override
  String get homeVideosAndPhotos => 'Mājas video un fotoattēli';

  @override
  String get mixedMoviesAndShows => 'Jauktas filmas un seriāli';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Ieraksti nav atrasti';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Arhīvā .$extension nav atrasta neviena attēla lappuse.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Iegultajam renderētājam radās kļūda ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB renderētājam radās kļūda ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Trūkst lokālā faila lasītājam: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status, atverot grāmatas datus no $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nav pieejams neviens lasāms grāmatas galapunkts';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Neatbalstīts komiksu arhīva formāts: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR izpakošanas spraudnis šajā platformā nav pieejams.';

  @override
  String get failedToExtractCbrArchive => 'Neizdevās izpakot .cbr arhīvu.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 izpakošana šajā platformā nav pieejama.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 izpakošanas spraudnis šajā platformā nav pieejams.';

  @override
  String get loadingShuffle => 'Ielādē jaukšanu...';

  @override
  String get libraryShuffleLabel => 'BIBLIOTĒKAS JAUKŠANA';

  @override
  String get randomShuffleLabel => 'NEJAUŠA JAUKŠANA';

  @override
  String get genresShuffleLabel => 'ŽANRU JAUKŠANA';

  @override
  String get autoHdrSwitching => 'Automātiska HDR pārslēgšana';

  @override
  String get autoHdrSwitchingDescription =>
      'Automātiski ieslēgt HDR HDR video atskaņošanai un pēc iziešanas atjaunot ekrāna režīmu.';

  @override
  String get whenFullscreen => 'Pilnekrāna režīmā';

  @override
  String get changeArtwork => 'Mainīt vāka attēlu';

  @override
  String get missing => 'Trūkst';

  @override
  String get clearAllArtworkButton => 'Notīrīt visus vāka attēlus?';

  @override
  String get clearAllArtworkWarning =>
      'Vai tiešām vēlaties notīrīt visus lejupielādētos vāka attēlus?';

  @override
  String get confirmClear => 'Apstiprināt notīrīšanu';

  @override
  String confirmClearMessage(String itemType) {
    return 'Vai tiešām vēlaties notīrīt šo vienumu: $itemType?';
  }

  @override
  String get uploadButton => 'Augšupielādēt?';

  @override
  String get resolutionLabel => 'Izšķirtspēja: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Rādīt tikai saskarnes valodas vāka attēlus';

  @override
  String get confirmClearAll => 'Apstiprināt visu notīrīšanu';

  @override
  String get imageUploadSuccess => 'Attēls veiksmīgi augšupielādēts!';

  @override
  String imageUploadFailed(String error) {
    return 'Neizdevās augšupielādēt attēlu: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Neizdevās iestatīt attēlu: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Neizdevās dzēst attēlu: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Neizdevās notīrīt visus vāka attēlus: $error';
  }

  @override
  String get yes => 'Jā';

  @override
  String get posterCategory => 'Plakāts';

  @override
  String get backdropsCategory => 'Fona attēli';

  @override
  String get bannerCategory => 'Baneris';

  @override
  String get logoCategory => 'Logotips';

  @override
  String get thumbnailCategory => 'Sīktēls';

  @override
  String get artCategory => 'Grafika';

  @override
  String get discArtCategory => 'Diska grafika';

  @override
  String get screenshotCategory => 'Ekrānuzņēmums';

  @override
  String get boxCoverCategory => 'Kastītes vāks';

  @override
  String get boxRearCoverCategory => 'Kastītes aizmugurējais vāks';

  @override
  String get menuArtCategory => 'Izvēlnes grafika';

  @override
  String get confirmItemPoster => 'plakāts';

  @override
  String get confirmItemBackdrop => 'fona attēls';

  @override
  String get confirmItemBanner => 'baneris';

  @override
  String get confirmItemLogo => 'logotips';

  @override
  String get confirmItemThumbnail => 'sīktēls';

  @override
  String get confirmItemArt => 'grafika';

  @override
  String get confirmItemDiscArt => 'diska grafika';

  @override
  String get confirmItemScreenshot => 'ekrānuzņēmums';

  @override
  String get confirmItemBoxCover => 'kastītes vāks';

  @override
  String get confirmItemBoxRearCover => 'kastītes aizmugurējais vāks';

  @override
  String get confirmItemMenuArt => 'izvēlnes grafika';

  @override
  String get resolutionAll => 'Visas';

  @override
  String get resolutionHigh => 'Augsta (1080p+)';

  @override
  String get resolutionMedium => 'Vidēja (720p)';

  @override
  String get resolutionLow => 'Zema (<720p)';

  @override
  String get sources => 'Avoti';

  @override
  String get audiobookChapters => 'Nodaļas';

  @override
  String get audiobookBookmarks => 'Grāmatzīmes';

  @override
  String get audiobookNotes => 'Piezīmes';

  @override
  String get audiobookQueue => 'Rinda';

  @override
  String get audiobookTimeline => 'Laika josla';

  @override
  String get audiobookTimelineEmpty => 'Laika josla ir tukša';

  @override
  String get audiobookFocusedTimeline => 'Fokusētā laika josla';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Eksportēt grāmatzīmes';

  @override
  String get audiobookExportNotes => 'Eksportēt piezīmes';

  @override
  String get audiobookExportAll => 'Eksportēt visu';

  @override
  String audiobookExportSuccess(String path) {
    return 'Eksportēts uz $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Eksportēšana neizdevās: $error';
  }

  @override
  String get audiobookLyrics => 'Dziesmu teksti';

  @override
  String get audiobookAddBookmark => 'Pievienot grāmatzīmi';

  @override
  String get audiobookAddNote => 'Pievienot piezīmi';

  @override
  String get audiobookEditNote => 'Rediģēt piezīmi';

  @override
  String get audiobookNoteHint => 'Uzrakstiet piezīmi šim brīdim';

  @override
  String get audiobookSleepTimer => 'Miega taimeris';

  @override
  String get audiobookSleepOff => 'Izslēgts';

  @override
  String get audiobookSleepEndOfChapter => 'Nodaļas beigās';

  @override
  String get audiobookSleepCustom => 'Pielāgots';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Atlicis $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Atskaņošanas ātrums';

  @override
  String get audiobookRemainingTime => 'Atlicis';

  @override
  String get audiobookElapsedTime => 'Pagājis';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Atpakaļ $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Uz priekšu $seconds s';
  }

  @override
  String get audiobookPreviousChapter => 'Iepriekšējā nodaļa';

  @override
  String get audiobookNextChapter => 'Nākamā nodaļa';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$current. nodaļa no $total';
  }

  @override
  String get audiobookNoChapters => 'Nav nodaļu';

  @override
  String get audiobookNoBookmarks => 'Vēl nav grāmatzīmju';

  @override
  String get audiobookNoNotes => 'Vēl nav piezīmju';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Grāmatzīme pievienota pie $position';
  }

  @override
  String get audiobookSpeedReset => 'Atiestatīt uz 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Saglabāt';

  @override
  String get audiobookCancel => 'Atcelt';

  @override
  String get audiobookDelete => 'Dzēst';

  @override
  String get subtitlePreferencesDescription =>
      'Mainiet subtitru režīmus, noklusējuma valodas, izskatu un renderēšanas opcijas.';

  @override
  String get subtitleRendering => 'Subtitru renderēšana';

  @override
  String get displayOptions => 'Attēlošanas opcijas';

  @override
  String get releaseDateAscending => 'Izdošanas datums (augoši)';

  @override
  String get releaseDateDescending => 'Izdošanas datums (dilstoši)';

  @override
  String get groupContributions => 'Grupēt darbus';

  @override
  String get groupMultipleRoles => 'Grupēt vairākas lomas';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Brīdinājums par bibliotēkas rakstīšanas piekļuvi';

  @override
  String get libraryWriteAccessHowToFix => 'Kā to novērst:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Piešķiriet Jellyfin pakalpojuma lietotājam (piem., jellyfin vai Docker PUID/PGID) rakstīšanas atļaujas serverī esošajām multivides bibliotēkas mapēm.\n\n2. Vai arī dodieties uz Jellyfin vadības paneli -> Bibliotēkas, rediģējiet šo bibliotēku un atspējojiet opciju “Saglabāt vāka attēlus multivides mapēs”, lai vāka attēli tiktu glabāti Jellyfin iekšējā datubāzē.';

  @override
  String get dismiss => 'Noraidīt';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Jūsu bibliotēka “$libraryName” ir konfigurēta saglabāt vāka attēlus tieši multivides mapēs (opcija “Saglabāt vāka attēlus multivides mapēs” ir iespējota). Tomēr Jellyfin pārbaudīja rakstīšanas piekļuvi un tam nav atļaujas rakstīt failus šajā direktorijā:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Šķiet, ka Jellyfin neizdevās atjaunināt vāka attēlu. Jūsu bibliotēka ir konfigurēta saglabāt vāka attēlus tieši multivides mapēs (opcija “Saglabāt vāka attēlus multivides mapēs” ir iespējota). Šī kļūda parasti rodas, kad Jellyfin servera procesam nav atļaujas rakstīt failus jūsu multivides direktorijās.';

  @override
  String get replay => 'Atskaņot no jauna';

  @override
  String get fileInformation => 'Faila informācija';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Izmērs: $size  •  Formāts: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Rādīt visus audio celiņus ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Rādīt visus subtitru celiņus ($count)';
  }

  @override
  String get checkingDirectPlay => 'Pārbauda tiešās atskaņošanas iespēju...';

  @override
  String get directPlayCapabilityLabel => 'Tiešās atskaņošanas iespēja: ';

  @override
  String get forced => 'Piespiedu';

  @override
  String get transcodeContainerNotSupported =>
      'Atskaņotājs neatbalsta konteinera formātu.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Video kodeks netiek atbalstīts.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Audio kodeks netiek atbalstīts.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Subtitru formāts netiek atbalstīts (nepieciešama iededzināšana).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Audio profils netiek atbalstīts.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Video profils netiek atbalstīts.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Video līmenis netiek atbalstīts.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Šī ierīce neatbalsta video izšķirtspēju.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Video bitu dziļums netiek atbalstīts.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Video kadru nomaiņas ātrums netiek atbalstīts.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Faila bitu ātrums pārsniedz atskaņotāja straumēšanas ierobežojumu.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Video bitu ātrums pārsniedz straumēšanas ierobežojumu.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Audio bitu ātrums pārsniedz straumēšanas ierobežojumu.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Audio kanālu skaits netiek atbalstīts.';

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
  String get sortAlphabetical => 'Pēc alfabēta';

  @override
  String get sortReleaseAscending => 'Izdošanas secība (augoši)';

  @override
  String get sortReleaseDescending => 'Izdošanas secība (dilstoši)';

  @override
  String get sortCustomDragDrop => 'Pielāgota (velkot un nometot)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Atskaņošanas saraksta kārtošanas opcijas';

  @override
  String get resetSort => 'Atiestatīt kārtošanu';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Skatīties atkārtoti S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Skatīties atskaņošanas sarakstu atkārtoti';

  @override
  String get noSubtitlesFound => 'Subtitri nav atrasti.';

  @override
  String get adminControls => 'Administratora vadīklas';

  @override
  String get impellerRendering => 'Renderēšanas dzinējs (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller ir Flutter modernais GPU renderētājs, kas nodrošina plūstošākas animācijas un mazāku raustīšanos. Dažās TV pierīcēs un vecākos GPU tas var radīt traucējumus vai melnu attēlu; tādā gadījumā izslēdziet to. “Automātiski” izvēlas jūsu ierīcei piemērotāko noklusējumu. Lai lietotu izmaiņas, restartējiet Moonfin.';

  @override
  String get impellerAuto => 'Automātiski';

  @override
  String get impellerOn => 'Ieslēgts';

  @override
  String get impellerOff => 'Izslēgts';

  @override
  String get impellerRestartTitle => 'Nepieciešams restarts';

  @override
  String get impellerRestartMessage =>
      'Lai mainītu renderēšanas dzinēju, Moonfin ir jārestartē. Aizveriet lietotni tagad un atveriet to no jauna.';

  @override
  String get impellerCloseNow => 'Aizvērt lietotni tagad';

  @override
  String get adminRefreshLibrary => 'Atsvaidzināt bibliotēku';

  @override
  String get adminRefreshAllLibraries => 'Atsvaidzināt visas bibliotēkas';

  @override
  String get adminRepoSortDateOldest =>
      'Pievienošanas datums (vecākie vispirms)';

  @override
  String get adminRepoSortDateNewest =>
      'Pievienošanas datums (jaunākie vispirms)';

  @override
  String get adminRepoSortNameAsc => 'Pēc alfabēta (no A līdz Z)';

  @override
  String get adminRepoSortNameDesc => 'Pēc alfabēta (no Z līdz A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Ielādē servera analītiku... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Kā avotam';

  @override
  String get imdbTop250Movies => 'IMDb 250 labākās filmas';

  @override
  String get imdbTop250TvShows => 'IMDb 250 labākie seriāli';

  @override
  String get imdbMostPopularMovies => 'IMDb populārākās filmas';

  @override
  String get imdbMostPopularTvShows => 'IMDb populārākie seriāli';

  @override
  String get imdbLowestRatedMovies => 'IMDb zemāk novērtētās filmas';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb augstāk novērtētās filmas angļu valodā';

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
  String get integrations => 'Integrācijas';

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
