// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

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
  String get interfaceLanguage => 'Sąsajos kalba';

  @override
  String get systemLanguageDefault => 'Sistemos numatytoji';

  @override
  String get signIn => 'Prisijunkite';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Tuščia';

  @override
  String connectingToServer(String serverName) {
    return 'Jungiamasi prie $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Slaptažodis';

  @override
  String get username => 'Vartotojo vardas';

  @override
  String get email => 'El. paštas';

  @override
  String get quickConnectInstruction =>
      'Įveskite šį kodą savo serverio žiniatinklio informacijos suvestinėje:';

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
  String get waitingForAuthorization => 'Laukiama įgaliojimo...';

  @override
  String get back => 'Atgal';

  @override
  String get serverUnavailable => 'Serveris nepasiekiamas';

  @override
  String get loginFailed => 'Prisijungti nepavyko';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect nepasiekiamas: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nepasiekiamas ($status): $detail';
  }

  @override
  String get whosWatching => 'Kas žiūri?';

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
  String get addUser => 'Pridėti naudotoją';

  @override
  String get selectServer => 'Pasirinkite Serveris';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versija $version';
  }

  @override
  String get savedServers => 'Išsaugoti serveriai';

  @override
  String get discoveredServers => 'Atrasti serveriai';

  @override
  String get noneFound => 'Nerasta';

  @override
  String get unableToConnectToServer => 'Nepavyko prisijungti prie serverio';

  @override
  String get addServer => 'Pridėti serverį';

  @override
  String get embyConnect => 'Emby Prisijunkite';

  @override
  String get removeServer => 'Pašalinti serverį';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Pašalinti „$serverName“ iš jūsų serverių?';
  }

  @override
  String get cancel => 'Atšaukti';

  @override
  String get remove => 'Pašalinti';

  @override
  String get connectToServer => 'Prisijunkite prie serverio';

  @override
  String get serverAddress => 'Serverio adresas';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Prisijunkite';

  @override
  String get secureStorageUnavailable => 'Saugi saugykla nepasiekiama';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin negalėjo pasiekti jūsų sistemos raktų pakabuko. Prisijungimas gali būti tęsiamas, tačiau saugi žetonų saugykla gali būti nepasiekiama, kol nebus atrakintas raktų pakabukas.';

  @override
  String get ok => 'Gerai';

  @override
  String get settingsAppearanceTheme => 'Programos tema';

  @override
  String get detailScreenStyle => 'Detalių ekrano stilius';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasikinis – originalus centruotas Moonfin išdėstymas. Modernus – prisitaikantis kinematografinis išdėstymas.';

  @override
  String get detailScreenStyleMoonfin => 'Klasikinis';

  @override
  String get detailScreenStyleModern => 'Modernus';

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
  String get expandedTabs => 'Išskleisti skirtukai';

  @override
  String get expandedTabsSubtitle =>
      'Automatiškai rodyti skirtuko turinį naršant skirtukus. Išjunkite, kad kiekvieną skirtuką atidarytumėte ir uždarytumėte rankiniu būdu.';

  @override
  String get showTechnicalDetails => 'Rodyti techninę informaciją?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Rodyti kodeko, raiškos ir srauto informaciją antraštės santraukoje';

  @override
  String get recommendationSystem => 'Rekomendacijų sistema';

  @override
  String get recommendationSystemSubtitle =>
      'Naudokite Moonfin Recommends vietinės bibliotekos algoritmą arba internetinius TMDB panašumo rodiklius. Pastaba: internetinėms rekomendacijoms reikia Seerr integracijos.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb panašumas';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Taikyti amžiaus cenzo ribą?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Riboti Moonfin Recommends pasiūlymus pagal pasirinktos medijos amžiaus cenzą';

  @override
  String get interfaceStyle => 'Sąsajos stilius';

  @override
  String get interfaceStyleSubtitle =>
      'Automatinis prisitaiko prie jūsų įrenginio. Pasirinkite Apple arba Material, kad nustatytumėte konkrečią išvaizdą.';

  @override
  String get interfaceStyleAutomatic => 'Automatinis';

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
  String get glassQuality => 'Stiklo kokybė';

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
      'Automatinis parenka geriausią stiklo efektą šiam įrenginiui. Visas įjungia tikrą suliejimą; Sumažintas naudoja lengvą stiklą, taupantį GPU energiją.';

  @override
  String get glassQualityAuto => 'Automatinis';

  @override
  String get glassQualityFull => 'Visas';

  @override
  String get glassQualityReduced => 'Sumažintas';

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
      'Perjunkite „Moonfin“ ir „Neon Pulse“ iš naujo nepaleidę programos';

  @override
  String get customThemeTitle => 'Pasirinktinė tema';

  @override
  String get customThemeSubtitle =>
      'Pasirinktinės temos keičia vaizdo elementus visoje Moonfin programoje. Pasirinkite vieną iš šių parinkčių pagal savo stilių.';

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
      'Dabartinė Moonfin išvaizda, kurią jūs visi pamėgote';

  @override
  String get themeNeonPulse => 'Neoninis pulsas';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stilius su purpuriniu švytėjimu, žalsvai mėlynu tekstu ir stipresniu chromo kontrastu';

  @override
  String get themeGlass => 'Stiklas';

  @override
  String get themeGlassSubtitle =>
      'Skysto stiklo stilius su slenkančiu gradiento fonu, matiniais paviršiais ir Apple mėlynu akcentu';

  @override
  String get theme8BitHero => '8 bitų herojus';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pikselių meno stilius su stambia palete, blokiniais rėmeliais, ryškiais šešėliais ir pikselių šriftu';

  @override
  String get embyConnectSignInSubtitle =>
      'Prisijunkite naudodami savo Emby Connect paskyrą';

  @override
  String get emailOrUsername => 'Paštas arba vartotojo vardas';

  @override
  String get selectAServer => 'Pasirinkite serverį';

  @override
  String get tryAgain => 'Bandyk dar kartą';

  @override
  String get noLinkedServers =>
      'Nėra serverių, susietų su šia Emby Connect paskyra';

  @override
  String get invalidEmbyConnectCredentials =>
      'Netinkami „Emby Connect“ kredencialai';

  @override
  String get invalidEmbyConnectLogin =>
      'Neteisingas Emby Connect vartotojo vardas arba slaptažodis';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serveris nepalaiko Emby Connect mainų';

  @override
  String get embyConnectNetworkError =>
      'Tinklo klaida susisiekiant su Emby Connect arba pasirinktu serveriu';

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
  String get loadingLinkedServers => 'Įkeliami susieti serveriai...';

  @override
  String get connectingToServerEllipsis => 'Prisijungiama prie serverio...';

  @override
  String get noReachableAddress => 'Nepateiktas pasiekiamas adresas';

  @override
  String get invalidServerExchangeResponse =>
      'Netinkamas atsakymas iš serverio mainų galutinio taško';

  @override
  String unableToConnectTo(String target) {
    return 'Nepavyko prisijungti prie $target';
  }

  @override
  String get exitApp => 'Išeiti iš Moonfin?';

  @override
  String get exitAppConfirmation => 'Ar tikrai norite išeiti?';

  @override
  String get exit => 'Išeiti';

  @override
  String get gameMenu => 'Meniu';

  @override
  String get gamePaused => 'Pristabdyta';

  @override
  String get gameSaveState => 'Įrašyti būseną';

  @override
  String get games => 'Žaidimai';

  @override
  String get gameLoadState => 'Įkelti būseną';

  @override
  String get gameFastForward => 'Pagreitinti';

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
  String get gameEmulatorSettings => 'Emuliatoriaus nustatymai';

  @override
  String get gameNoCoreOptions => 'Šis branduolys neturi keičiamų parinkčių.';

  @override
  String get gameHoldToOpenMenu => 'Palaikykite, kad atidarytumėte meniu';

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
      'Žaidimai šiame įrenginyje kol kas nepalaikomi.';

  @override
  String get noHomeRowsLoaded => 'Nepavyko įkelti jokių pradinių eilučių';

  @override
  String get noHomeRowsHint =>
      'Pabandykite atnaujinti arba sumažinti aktyvias namų dalis.';

  @override
  String get retryHomeRows => 'Iš naujo bandykite pagrindines eilutes';

  @override
  String get guide => 'Vadovas';

  @override
  String get recordings => 'Įrašai';

  @override
  String get schedule => 'Tvarkaraštis';

  @override
  String get series => 'Serialai';

  @override
  String get noItemsFound => 'Elementų nerasta';

  @override
  String get home => 'Pradžia';

  @override
  String get browseAll => 'Naršyti viską';

  @override
  String get genres => 'Žanrai';

  @override
  String get collectionPlaceholder => 'Kolekcijos elementai bus rodomi čia';

  @override
  String get browseByLetter => 'Naršyti pagal raidę';

  @override
  String get alphabeticalBrowsePlaceholder => 'Čia bus rodomas abėcėlės tvarka';

  @override
  String get suggestions => 'Pasiūlymai';

  @override
  String get suggestionsPlaceholder => 'Siūlomi elementai bus rodomi čia';

  @override
  String get failedToLoadLibraries => 'Nepavyko įkelti bibliotekų';

  @override
  String get noLibrariesFound => 'Bibliotekų nerasta';

  @override
  String get library => 'Biblioteka';

  @override
  String get displaySettings => 'Ekrano nustatymai';

  @override
  String get allGenres => 'Visi žanrai';

  @override
  String get noGenresFound => 'Žanrų nerasta';

  @override
  String failedToLoadFolderError(String error) {
    return 'Nepavyko įkelti aplanko: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Šis aplankas tuščias';

  @override
  String itemCountLabel(int count) {
    return 'Elementų: $count';
  }

  @override
  String get failedToLoadFavorites => 'Nepavyko įkelti mėgstamiausių';

  @override
  String get retry => 'Bandykite dar kartą';

  @override
  String get noFavoritesYet => 'Mėgstamiausių dar nėra';

  @override
  String get favorites => 'Mėgstamiausi';

  @override
  String totalCountItems(int count) {
    return 'Elementų: $count';
  }

  @override
  String get continuing => 'Tęsinys';

  @override
  String get ended => 'Baigėsi';

  @override
  String get sortAndFilter => 'Rūšiuoti ir filtruoti';

  @override
  String get type => 'Tipas';

  @override
  String get sortBy => 'Rūšiuoti pagal';

  @override
  String get display => 'Ekranas';

  @override
  String get imageType => 'Vaizdo tipas';

  @override
  String get posterSize => 'Plakato dydis';

  @override
  String get small => 'Mažas';

  @override
  String get medium => 'Vidutinis';

  @override
  String get large => 'Didelis';

  @override
  String get extraLarge => 'Itin didelis';

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
    return '$name — žanrai';
  }

  @override
  String get views => 'Peržiūros';

  @override
  String get albums => 'Albumai';

  @override
  String get albumArtists => 'Albumo menininkai';

  @override
  String get artists => 'Atlikėjai';

  @override
  String get bookmarks => 'Žymės';

  @override
  String get noSavedBookmarks => 'Dar nėra išsaugotų šio pavadinimo žymių.';

  @override
  String get openBook => 'Atidarykite knygą';

  @override
  String get chapter => 'skyrius';

  @override
  String get page => 'Puslapis';

  @override
  String get bookmark => 'Žymė';

  @override
  String get justNow => 'Tik dabar';

  @override
  String minutesAgo(int count) {
    return 'prieš $count min.';
  }

  @override
  String hoursAgo(int count) {
    return 'prieš $count val.';
  }

  @override
  String daysAgo(int count) {
    return 'prieš $count d.';
  }

  @override
  String get discoverySubjects => 'Atradimų dalykai';

  @override
  String get apply => 'Taikyti';

  @override
  String get openLink => 'Atidaryti nuorodą';

  @override
  String get scanWithYourPhone => 'Nuskaitykite telefonu';

  @override
  String get audiobookGenres => 'Garsinių knygų žanrai';

  @override
  String get scrollLeft => 'Slinkite kairėn';

  @override
  String get scrollRight => 'Slinkite dešinėn';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre => 'Šiuo metu nepavyko įkelti šio žanro.';

  @override
  String get continueReading => 'Skaityti toliau';

  @override
  String get savedHighlights => 'Išsaugoti akcentai';

  @override
  String get continueListening => 'Klausyti toliau';

  @override
  String get listen => 'Klausyk';

  @override
  String get resume => 'Tęsti';

  @override
  String get failedToLoadLibrary => 'Nepavyko įkelti bibliotekos';

  @override
  String get popularNow => 'Populiaru dabar';

  @override
  String get savedForLater => 'Išsaugota Vėliau';

  @override
  String get topListens => 'Populiariausi klausymai';

  @override
  String get unreadDiscoveries => 'Neskaityti atradimai';

  @override
  String get pickUpAgain => 'Paimk dar kartą';

  @override
  String get bookHighlightsDescription =>
      'Jūsų knygos su svarbiausiomis akimirkomis, mėgstamiausiomis ar skaitymo eiga.';

  @override
  String get handPickedFromLibrary => 'Pasirinkta iš jūsų bibliotekos.';

  @override
  String get handPickedFromListeningQueue =>
      'Pasirinkta iš jūsų klausymosi eilės.';

  @override
  String get booksWithHighlights =>
      'Knygos su svarbiausiais momentais, mėgstamiausiais ar skaitymo pažanga.';

  @override
  String get jumpBackNarration =>
      'Grįžkite į pasakojimą neieškodami savo vietos.';

  @override
  String get unreadBooksReady =>
      'Neskaitytos knygos, paruoštos kitai ramiai valandai.';

  @override
  String get quickAccessFavorites =>
      'Greita prieiga prie knygų, prie kurių vis sugrįžtate.';

  @override
  String get searchAudiobooks => 'Ieškokite garso knygų';

  @override
  String get searchYourLibrary => 'Ieškokite savo bibliotekoje';

  @override
  String get pickUpStory => 'Tęskite istoriją ten, kur baigėte';

  @override
  String get savedPlacesChapters =>
      'Jūsų išsaugotos vietos ir nebaigti skyriai';

  @override
  String authorsCount(int count) {
    return 'Autorių: $count';
  }

  @override
  String genresCount(int count) {
    return 'Žanrų: $count';
  }

  @override
  String percentCompleted(int percent) {
    return 'Užbaigta $percent%';
  }

  @override
  String get readyWhenYouAre => 'Pasiruošę, kai būsite';

  @override
  String get details => 'Detalės';

  @override
  String get listeningRoom => 'Pasiklausymo kambarys';

  @override
  String get bookmarksAndProgress => 'Žymės ir pažanga';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Pavadinimų: $count. Išdėstyta patogiam skaitymui.';
  }

  @override
  String get titles => 'Pavadinimai';

  @override
  String get allTitles => 'Visi titulai';

  @override
  String get authors => 'Autoriai';

  @override
  String get browseByAuthor => 'Naršyti pagal autorių';

  @override
  String get browseByGenre => 'Naršyti pagal žanrą';

  @override
  String get discover => 'Atrask';

  @override
  String get noBookmarkedItems => 'Dar nėra pažymėtų elementų';

  @override
  String get nothingMatchesSection =>
      'Kol kas niekas neatitinka šios skilties. Išbandykite kitą skirtuką arba grįžkite, kai baigsis bibliotekos sinchronizavimas.';

  @override
  String get audiobooks => 'Garsinės knygos';

  @override
  String noLabelFound(String label) {
    return '$label nerasta';
  }

  @override
  String get folder => 'Aplankas';

  @override
  String get filters => 'Filtrai';

  @override
  String get readingStatus => 'Skaitymo būsena';

  @override
  String get playedStatus => 'Žaidžiama būsena';

  @override
  String get readStatus => 'Skaityti';

  @override
  String get watched => 'Žiūrėta';

  @override
  String get unread => 'Neskaityta';

  @override
  String get unwatched => 'Nežiūrėta';

  @override
  String get seriesStatus => 'Serijos būsena';

  @override
  String get allLibraries => 'Visos bibliotekos';

  @override
  String get books => 'Knygos';

  @override
  String get latestBooks => 'Naujausios knygos';

  @override
  String get latestAudiobooks => 'Naujausios garso knygos';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knygų',
      many: '$count knygos',
      few: '$count knygos',
      one: '$count knyga',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Knyga';

  @override
  String get bookFormatAudiobook => 'Garso knyga';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Nerasta šio autoriaus knygų.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return 'Perskaityta $percent%';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Liko $time';
  }

  @override
  String get bookHeroRead => 'Skaityti';

  @override
  String get bookHeroListen => 'Klausyti';

  @override
  String get author => 'Autorius';

  @override
  String get unknownAuthor => 'Nežinomas autorius';

  @override
  String get uncategorized => 'Neįtraukta į kategorijas';

  @override
  String get overview => 'Apžvalga';

  @override
  String get noLibrivoxDescription =>
      'LibriVox dar nepateikė šio pavadinimo aprašymo.';

  @override
  String get readers => 'Skaitytojai';

  @override
  String get openLinks => 'Atidarykite nuorodas';

  @override
  String get librivoxPage => '„LibriVox“ puslapis';

  @override
  String get internetArchive => 'Interneto archyvas';

  @override
  String get rssFeed => 'RSS tiekimas';

  @override
  String get downloadZip => 'Parsisiųsti Zip';

  @override
  String sectionCountLabel(int count) {
    return 'Skyrių: $count';
  }

  @override
  String firstPublished(int year) {
    return 'Pirmą kartą išleista $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Iš Open Library kol kas nėra šio pavadinimo apžvalgos.';

  @override
  String get subjects => 'Dalykai';

  @override
  String get all => 'Visi';

  @override
  String booksCount(int count) {
    return 'Knygų: $count';
  }

  @override
  String get couldNotLoadSubject => 'Šiuo metu nepavyko įkelti šios temos.';

  @override
  String get audiobookDetails => 'Garsinės knygos detalės';

  @override
  String authorsCountTitle(int count) {
    return 'Autorių: $count';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count garso knygų',
      many: '$count garso knygos',
      few: '$count garso knygos',
      one: '$count garso knyga',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Takelių sąrašas';

  @override
  String get itemListPlaceholder => 'Čia pasirodys prekių sąrašas';

  @override
  String get failedToLoad => 'Nepavyko įkelti';

  @override
  String get delete => 'Ištrinti';

  @override
  String get save => 'Išsaugoti';

  @override
  String get moreLikeThis => 'Daugiau panašaus';

  @override
  String get castAndCrew => 'Aktoriai ir įgula';

  @override
  String get collection => 'Kolekcija';

  @override
  String get episodes => 'Epizodai';

  @override
  String get nextUp => 'Kitas';

  @override
  String get seasons => 'Sezonai';

  @override
  String get chapters => 'Skyriai';

  @override
  String get features => 'Savybės';

  @override
  String get movies => 'Filmai';

  @override
  String get musicVideos => 'Muzikiniai vaizdo klipai';

  @override
  String get other => 'Kita';

  @override
  String get discography => 'Diskografija';

  @override
  String get similarArtists => 'Panašūs menininkai';

  @override
  String get tableOfContents => 'Turinys';

  @override
  String get tracklist => 'Takelių sąrašas';

  @override
  String discNumber(int number) {
    return '$number diskas';
  }

  @override
  String get biography => 'Biografija';

  @override
  String get authorDetails => 'Išsami informacija apie autorių';

  @override
  String get noOverviewAvailable => 'Dar nėra šio pavadinimo apžvalgos.';

  @override
  String get noBiographyAvailable => 'Nėra šio autoriaus biografijos.';

  @override
  String get unableToLoadAuthorDetails =>
      'Šiuo metu nepavyko įkelti išsamios autoriaus informacijos.';

  @override
  String published(int year) {
    return 'Išleista $year';
  }

  @override
  String get publicationDateUnknown => 'Išleidimo data nežinoma';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sezonų',
      many: '$count sezono',
      few: '$count sezonai',
      one: '$count sezonas',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Baigsis $time';
  }

  @override
  String get items => 'Elementai';

  @override
  String get extras => 'Priedai';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Užkulisiai';

  @override
  String get deletedScenes => 'Iškirptos scenos';

  @override
  String get featurettes => 'Apžvalginiai filmukai';

  @override
  String get interviews => 'Interviu';

  @override
  String get scenes => 'Scenos';

  @override
  String get shorts => 'Trumpametražiai filmai';

  @override
  String get trailers => 'Anonsai';

  @override
  String timeRemaining(String time) {
    return 'Liko $time';
  }

  @override
  String endsIn(String time) {
    return 'Baigsis po $time';
  }

  @override
  String get view => 'Žiūrėti';

  @override
  String get resumeReading => 'Tęsti skaitymą';

  @override
  String get read => 'Skaityti';

  @override
  String resumeFrom(String position) {
    return 'Tęsti nuo $position';
  }

  @override
  String get play => 'Leisti';

  @override
  String get startOver => 'Pradėti iš naujo';

  @override
  String get restart => 'Paleisti iš naujo';

  @override
  String get readOffline => 'Skaitykite neprisijungę';

  @override
  String get playOffline => 'Žaisti neprisijungus';

  @override
  String get audio => 'Garsas';

  @override
  String get subtitles => 'Subtitrai';

  @override
  String get version => 'Versija';

  @override
  String get cast => 'Transliuoti';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Anonsas';

  @override
  String get finished => 'Baigta';

  @override
  String get favorited => 'Į adresyną';

  @override
  String get favorite => 'Mėgstamiausias';

  @override
  String get playlist => 'Grojaraštis';

  @override
  String get downloaded => 'Atsisiųsta';

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
  String get downloadAll => 'Atsisiųsti viską';

  @override
  String get download => 'Atsisiųsti';

  @override
  String get deleteDownloaded => 'Ištrinti atsisiųstas';

  @override
  String get goToSeries => 'Eikite į seriją';

  @override
  String get editMetadata => 'Redaguoti metaduomenis';

  @override
  String get less => 'Mažiau';

  @override
  String get more => 'Daugiau';

  @override
  String get deleteItem => 'Ištrinti elementą';

  @override
  String get deletePlaylist => 'Ištrinti grojaraštį';

  @override
  String get deletePlaylistMessage => 'Ištrinti šį grojaraštį iš serverio?';

  @override
  String get deleteItemMessage => 'Ištrinti šį elementą iš serverio?';

  @override
  String get failedToDeletePlaylist => 'Nepavyko ištrinti grojaraščio';

  @override
  String get failedToDeleteItem => 'Nepavyko ištrinti elemento';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Pervardyti grojaraštį';

  @override
  String get playlistName => 'Grojaraščio pavadinimas';

  @override
  String get deleteDownloadedAlbum => 'Ištrinti atsisiųstą albumą';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Ištrinti atsisiųstus „$title“ takelius?';
  }

  @override
  String get downloadedTracksDeleted => 'Atsisiųsti takeliai ištrinti';

  @override
  String get downloadedTracksDeleteFailed =>
      'Kai kurių atsisiųstų takelių nepavyko ištrinti';

  @override
  String get noTracksLoaded => 'Nėra įkeltų takelių';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel neįkelta';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Atsisiunčiama $title ($count elem.)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Ar tikrai norite ištrinti „$name“ iš serverio? Šio veiksmo anuliuoti nepavyks.';
  }

  @override
  String get itemDeleted => 'Elementas ištrintas';

  @override
  String get noPlayableTrailerFound => 'Nerastas leistinas anonsas.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Nepalaikomas knygos formatas: .$extension';
  }

  @override
  String get audioTrack => 'Garso takelis';

  @override
  String get subtitleTrack => 'Subtitrų takelis';

  @override
  String get none => 'Nėra';

  @override
  String get downloadSubtitlesLabel => 'Parsisiųsti subtitrus...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Ieškokite naudodami „OpenSubtitles“ papildinį';

  @override
  String get downloadSubtitles => 'Atsisiųsti subtitrus';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'Pasirinkti subtitrai netinkami.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitrai atsisiųsti ir pasirinkti: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitrai atsisiųsta. Gali užtrukti, kol jis pasirodys, kol Jellyfin atnaujins elementą.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nuotolinių subtitrų ($language) nerasta.';
  }

  @override
  String get selectVersion => 'Pasirinkite Versija';

  @override
  String versionNumber(int number) {
    return '$number versija';
  }

  @override
  String get downloadAllQuality => 'Atsisiųsti viską – kokybė';

  @override
  String get downloadQuality => 'Atsisiuntimo kokybė';

  @override
  String get originalFileNoReencoding => 'Originalus failas, be perkodavimo';

  @override
  String get originalFilesNoReencoding => 'Originalūs failai, be perkodavimo';

  @override
  String get noEpisodesLoaded => 'Neįkelta jokių serijų';

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
    return 'Atsisiunčiama $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Ištrinkite atsisiųstus failus';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Ištrinti vietinius failus: $typeLabel?\n\nTaip atlaisvinsite vietos saugykloje. Vėliau galėsite atsisiųsti iš naujo.';
  }

  @override
  String get downloadedFilesDeleted => 'Atsisiųsti failai ištrinti';

  @override
  String get failedToDeleteFiles => 'Nepavyko ištrinti failų';

  @override
  String get deleteFiles => 'Ištrinti failus';

  @override
  String get director => 'DIREKTORIAUS';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'REŽISIERIAI';

  @override
  String get writer => 'SCENARISTAS';

  @override
  String get writers => 'SCENARISTAI';

  @override
  String get studio => 'STUDIJA';

  @override
  String studioMoreCount(int count) {
    return '+$count daugiau';
  }

  @override
  String totalEpisodes(int count) {
    return 'Serijų: $count';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '$number serija';
  }

  @override
  String chapterNumber(int number) {
    return '$number skyrius';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count takelių',
      many: '$count takelio',
      few: '$count takeliai',
      one: '$count takelis',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skyrių',
      many: '$count skyriaus',
      few: '$count skyriai',
      one: '$count skyrius',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Gimė $date';
  }

  @override
  String died(String date) {
    return 'Mirė $date';
  }

  @override
  String age(int age) {
    return 'Amžius: $age';
  }

  @override
  String get showLess => 'Rodyti mažiau';

  @override
  String get readMore => 'Skaityti Daugiau';

  @override
  String get shuffle => 'Maišyti';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Maišyti visą muziką';

  @override
  String get carSignInPrompt => 'Prisijunkite prie Moonfin telefone';

  @override
  String get carServerUnreachable => 'Nepavyksta pasiekti serverio';

  @override
  String downloadsCount(int count) {
    return 'Atsisiuntimų: $count';
  }

  @override
  String get perfectMatch => 'Tobulas atitikimas';

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
    return 'Nuotolinių subtitrų veiksmui „$action“ šiam naudotojui reikia Jellyfin subtitrų valdymo teisės.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Šio elemento serveryje rasti nepavyko, todėl nuotolinių subtitrų veiksmas „$action“ neįmanomas.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Nuotolinių subtitrų veiksmas „$action“ nepavyko: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Nuotolinių subtitrų veiksmas „$action“ nepavyko (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Nepavyko atlikti nuotolinių subtitrų veiksmo „$action“.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'visos atsisiųstos „$name“ serijos';
  }

  @override
  String get deleteSeasonFiles => 'visos atsisiųstos šio sezono serijos';

  @override
  String get stillWatching => 'Vis dar žiūrite?';

  @override
  String get unableToLoadTrailerStream => 'Nepavyko įkelti anonso srauto.';

  @override
  String get trailerTimedOut => 'Pakrovimo metu baigėsi priekabos laikas.';

  @override
  String get playbackFailedForTrailer => 'Nepavyko atkurti šio anonso.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Perdavimas nepasiekiamas atkuriant neprisijungus.';

  @override
  String castActionFailed(String label, String error) {
    return '$label veiksmas nepavyko: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Nepavyko nustatyti transliavimo garsumo: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label valdikliai';
  }

  @override
  String get deviceVolume => 'Įrenginio garsumas';

  @override
  String get unavailable => 'Nepasiekiamas';

  @override
  String get pause => 'Pauzė';

  @override
  String get syncPosition => 'Sinchronizavimo padėtis';

  @override
  String stopCast(String label) {
    return 'Sustabdyti $label';
  }

  @override
  String get queueIsEmpty => 'Eilė tuščia';

  @override
  String trackNumber(int number) {
    return '$number takelis';
  }

  @override
  String get remotePlayback => 'Nuotolinis atkūrimas';

  @override
  String get castingToGoogleCast => 'Perduodama į „Google Cast“.';

  @override
  String get castingViaAirPlay => 'Perdavimas per AirPlay';

  @override
  String get castingViaDlna => 'Perdavimas per DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sek.';
  }

  @override
  String get longPressToUnlock => 'Norėdami atrakinti, ilgai paspauskite';

  @override
  String get off => 'Išjungta';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automatinis';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get audioDelay => 'Garso uždelsimas';

  @override
  String delayMinusMs(int value) {
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
  }

  @override
  String get subtitleDelay => 'Subtitrų vėlavimas';

  @override
  String get reset => 'Atstatyti';

  @override
  String get unknown => 'Nežinoma';

  @override
  String get playbackInformation => 'Atkūrimo informacija';

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
  String get playback => 'Atkūrimas';

  @override
  String get playMethod => 'Žaidimo metodas';

  @override
  String get directPlay => 'Tiesioginis žaidimas';

  @override
  String get directStream => 'Tiesioginis srautas';

  @override
  String get transcoding => 'Perkodavimas';

  @override
  String get transcodeReasons => 'Perkodavimo priežastys';

  @override
  String get player => 'Grotuvas';

  @override
  String get container => 'Konteineris';

  @override
  String get bitrate => 'Bitų sparta';

  @override
  String get video => 'Vaizdo įrašas';

  @override
  String get resolution => 'Rezoliucija';

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
  String get track => 'Takelis';

  @override
  String get channels => 'Kanalai';

  @override
  String get format => 'Formatas';

  @override
  String get external => 'Išorinis';

  @override
  String get embedded => 'Įdėta';

  @override
  String castSessionError(String protocol) {
    return '$protocol seanso klaida';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Nepavyko įkelti knygos informacijos: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB pateikimas programoje šioje platformoje dar nepasiekiamas.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Šis formatas (.$extension) programoje kol kas nerodomas.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Įterptasis dokumentų atvaizdavimas šioje platformoje nepasiekiamas.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nepavyko atidaryti išorinės peržiūros priemonės.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Nepavyko atidaryti programos skaityklės: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Žymė ties $label jau išsaugota.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Žymė pridėta: $label';
  }

  @override
  String get noBookmarksYet =>
      'Žymių dar nėra.\nSkaitydami bakstelėkite žymės piktogramą, kad išsaugotumėte savo poziciją.';

  @override
  String get noTableOfContentsAvailable => 'Nėra turinio';

  @override
  String pageLabel(int number) {
    return '$number psl.';
  }

  @override
  String get position => 'Padėtis';

  @override
  String get bookReader => 'Knygų skaitytuvas';

  @override
  String formatExtension(String extension) {
    return 'Formatas: .$extension';
  }

  @override
  String percentRead(String percent) {
    return 'Perskaityta $percent%';
  }

  @override
  String get updating => 'Atnaujinama...';

  @override
  String get markUnread => 'Pažymėti kaip neskaitytą';

  @override
  String get markAsRead => 'Pažymėti kaip skaitytą';

  @override
  String get reloadReader => 'Iš naujo įkelkite skaitytuvą';

  @override
  String get noPagesFound => 'Puslapių nerasta.';

  @override
  String get failedToDecodePageImage => 'Nepavyko iššifruoti puslapio vaizdo.';

  @override
  String resetZoom(String zoom) {
    return 'Atstatyti mastelį (${zoom}x)';
  }

  @override
  String get singlePage => 'Vienas puslapis';

  @override
  String get twoPageSpread => 'Dviejų puslapių sklaida';

  @override
  String get addBookmark => 'Pridėti žymę';

  @override
  String get bookmarksEllipsis => 'Žymės...';

  @override
  String get markedAsRead => 'Pažymėta kaip skaityta';

  @override
  String get markedAsUnread => 'Pažymėta kaip neskaityta';

  @override
  String failedToUpdateReadState(String error) {
    return 'Nepavyko atnaujinti skaitymo būsenos: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistema';

  @override
  String get themeLight => 'Tema: Šviesa';

  @override
  String get themeDark => 'Tema: Tamsus';

  @override
  String get themeSepia => 'Tema: Sepija';

  @override
  String get invertColorsFixedLayout =>
      'Invertuoti spalvas (fiksuotas išdėstymas)';

  @override
  String get invertColorsPdf => 'Invertuoti spalvas (PDF)';

  @override
  String get preparingInAppReader => 'Ruošiamas skaitytuvas programoje...';

  @override
  String get pdfDataNotAvailable => 'PDF duomenų nėra.';

  @override
  String get readerFallbackModeActive =>
      'Skaitytojo atsarginis režimas aktyvus';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ši platforma negali paleisti integruoto $extension failų dokumentų variklio.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Perjungę į palaikomą tikslinę platformą („Android“, „iOS“, „macOS“), naudokite „Reload Reader“.';

  @override
  String get openExternally => 'Atidaryti išoriškai';

  @override
  String get noEpubChaptersFound => 'EPUB skyrių nerasta.';

  @override
  String get readerNotReady => 'Skaitytojas nepasiruošęs.';

  @override
  String get seriesRecordings => 'Serialo įrašai';

  @override
  String get now => 'Dabar';

  @override
  String get sports => 'Sportas';

  @override
  String get news => 'Naujienos';

  @override
  String get kids => 'Vaikai';

  @override
  String get premiere => 'Premjera';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Vadovo laiko juosta';

  @override
  String failedToLoadGuide(String error) {
    return 'Nepavyko įkelti programų gido: $error';
  }

  @override
  String get noChannelsFound => 'Nerasta jokių kanalų';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'GYVAI';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Toliau: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Liko $minutes min.';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Liko $hours val.';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Liko $hours val. $minutes min.';
  }

  @override
  String get movie => 'Filmas';

  @override
  String get removedFromFavoriteChannels => 'Pašalinta iš mėgstamiausių kanalų';

  @override
  String get addedToFavoriteChannels => 'Pridėta prie mėgstamiausių kanalų';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Nepavyko atnaujinti mėgstamo kanalo';

  @override
  String get unfavoriteChannel => 'Nemėgstamas kanalas';

  @override
  String get favoriteChannel => 'Mėgstamiausias kanalas';

  @override
  String get record => 'Įrašyti';

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
  String get cancelRecordingAction => 'Atšaukti įrašymą';

  @override
  String get programSetToRecord => 'Laida suplanuota įrašyti';

  @override
  String get recordingCancelled => 'Įrašymas atšauktas';

  @override
  String get unableToCreateRecording => 'Nepavyko sukurti įrašo';

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
  String get watch => 'Žiūrėti';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Uždaryti';

  @override
  String failedToPlayChannel(String name) {
    return 'Nepavyko paleisti $name';
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
  String get failedToLoadRecordings => 'Nepavyko įkelti įrašų';

  @override
  String get scheduledInNext24Hours => 'Suplanuota per kitas 24 valandas';

  @override
  String get recentRecordings => 'Naujausi įrašai';

  @override
  String get tvSeries => 'TV serialas';

  @override
  String get failedToLoadSchedule => 'Nepavyko įkelti tvarkaraščio';

  @override
  String get noScheduledRecordings => 'Nėra suplanuotų įrašų';

  @override
  String get cancelRecording => 'Atšaukti įrašymą?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Atšaukti suplanuotą „$name“ įrašymą?';
  }

  @override
  String get no => 'Ne';

  @override
  String get yesCancel => 'Taip, atšaukti';

  @override
  String get failedToCancelRecording => 'Nepavyko atšaukti įrašymo';

  @override
  String get failedToLoadSeriesRecordings => 'Nepavyko įkelti serijų įrašų';

  @override
  String get noSeriesRecordings => 'Nėra serialų įrašų';

  @override
  String get cancelSeriesRecording => 'Atšaukti serijos įrašymą';

  @override
  String get cancelSeriesRecordingQuestion => 'Atšaukti serijos įrašymą?';

  @override
  String stopRecordingName(String name) {
    return 'Nutraukti „$name“ įrašymą?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nepavyko atšaukti serijos įrašymo';

  @override
  String get searchThisLibrary => 'Ieškoti šioje bibliotekoje...';

  @override
  String get searchEllipsis => 'Ieškoti...';

  @override
  String noResultsForQuery(String query) {
    return 'Nieko nerasta pagal „$query“';
  }

  @override
  String searchFailedError(String error) {
    return 'Paieška nepavyko: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr paskyros tipas';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Vietinis';

  @override
  String get savedMedia => 'Išsaugota laikmena';

  @override
  String get tvShows => 'TV laidos';

  @override
  String get music => 'Muzika';

  @override
  String get musicAlbums => 'Muzikos albumai';

  @override
  String get noMediaInFilter => 'Šiame filtre nėra medijos';

  @override
  String get noDownloadedMediaYet => 'Dar nėra atsisiųstų medijų';

  @override
  String get browseLibrary => 'Naršyti biblioteką';

  @override
  String get deleteDownload => 'Ištrinti atsisiuntimą';

  @override
  String removeItemAndFiles(String name) {
    return 'Pašalinti „$name“ ir susijusius failus?';
  }

  @override
  String tracksCount(int count) {
    return 'Takelių: $count';
  }

  @override
  String get album => 'Albumas';

  @override
  String get playAlbum => 'Leisti albumą';

  @override
  String failedToLoadAlbum(String error) {
    return 'Nepavyko įkelti albumo: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Atsisiųstų „$name“ takelių nerasta.';
  }

  @override
  String get season => 'Sezonas';

  @override
  String get errorLoadingEpisodes => 'Įkeliant serijas įvyko klaida';

  @override
  String get noDownloadedEpisodes => 'Nėra atsisiųstų serijų';

  @override
  String get deleteEpisode => 'Ištrinti seriją';

  @override
  String removeName(String name) {
    return 'Pašalinti „$name“?';
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
    return '$number serija';
  }

  @override
  String get seriesNotFound => 'Serija nerasta';

  @override
  String get errorLoadingSeries => 'Įkeliant seriją įvyko klaida';

  @override
  String get downloadedEpisodes => 'Atsisiųstos serijos';

  @override
  String seasonNumber(int number) {
    return '$number sezonas';
  }

  @override
  String seasonChip(int number) {
    return '$number sez.';
  }

  @override
  String get specials => 'Specialūs pasiūlymai';

  @override
  String get deleteSeason => 'Ištrinti sezoną';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Ištrinti visas atsisiųstas $season serijas?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serijų',
      many: '$count serijos',
      few: '$count serijos',
      one: '$count serija',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Sandėliavimo valdymas';

  @override
  String get storageBreakdown => 'Sandėliavimo suskirstymas';

  @override
  String get downloadedItems => 'Atsisiųstos prekės';

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
  String get storageLimit => 'Saugojimo limitas';

  @override
  String get noLimit => 'Nėra limito';

  @override
  String get deleteAllDownloads => 'Ištrinti visus atsisiuntimus';

  @override
  String get deleteAllDownloadsWarning =>
      'Tai pašalins visus atsisiųstus medijos failus ir veiksmo anuliuoti nebus galima.';

  @override
  String get deleteAll => 'Ištrinti viską';

  @override
  String get deleteSelected => 'Ištrinti pasirinktus';

  @override
  String deleteSelectedCount(int count) {
    return 'Ištrinti atsisiųstus elementus ($count)?';
  }

  @override
  String get musicAndAudiobooks => 'Muzika ir garso knygos';

  @override
  String get images => 'Vaizdai';

  @override
  String get database => 'Duomenų bazė';

  @override
  String ofStorageLimit(String limit) {
    return 'iš $limit limito';
  }

  @override
  String get settings => 'Nustatymai';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Autentifikavimas';

  @override
  String get autoLoginServerManagement =>
      'Automatinis prisijungimas, serverio valdymas';

  @override
  String get pinCode => 'PIN kodas';

  @override
  String get setUpPinCodeProtection => 'Nustatykite PIN kodo apsaugą';

  @override
  String get parentalControls => 'Tėvų kontrolė';

  @override
  String get contentRatingRestrictions => 'Turinio įvertinimo apribojimai';

  @override
  String get bitRateResolutionBehavior =>
      'Bitų sparta, skiriamoji geba, elgesys';

  @override
  String get languageSizeAppearance => 'Kalba, dydis, išvaizda';

  @override
  String get qualityStorage => 'Kokybė, sandėliavimas';

  @override
  String get mediaRequestIntegration => 'Žiniasklaidos užklausų integravimas';

  @override
  String get switchServer => 'Perjungti serverį';

  @override
  String get signOut => 'Atsijungti';

  @override
  String get versionLicenses => 'Versija, licencijos';

  @override
  String get account => 'sąskaita';

  @override
  String get signInAndSecurity => 'Prisijungimas ir sauga';

  @override
  String get administration => 'Administravimas';

  @override
  String get serverSettingsUsersLibraries =>
      'Serverio nustatymai, vartotojai, bibliotekos';

  @override
  String get customization => 'Tinkinimas';

  @override
  String get themeAndLayout => 'Tema ir išdėstymas';

  @override
  String get videoAndSubtitles => 'Video ir subtitrai';

  @override
  String get pluginAndRequests => 'Papildinys ir užklausos';

  @override
  String get customizeAccountPlaybackInterface =>
      'Tinkinkite paskyros, atkūrimo ir sąsajos elgseną';

  @override
  String optionsCount(int count) {
    return 'Parinkčių: $count';
  }

  @override
  String get themeAndAppearance => 'Tema ir išvaizda';

  @override
  String get focusBorderColor => 'Fokusavimo kraštinės spalva';

  @override
  String get watchedIndicators => 'Stebimi rodikliai';

  @override
  String get always => 'Visada';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Slėpti nežiūrėtus';

  @override
  String get episodesOnly => 'Tik epizodai';

  @override
  String get never => 'Niekada';

  @override
  String get focusExpansionAnimation => 'Fokuso išplėtimo animacija';

  @override
  String get desktopUiScale => 'Darbalaukio vartotojo sąsajos skalė';

  @override
  String get scaleFocusedCards =>
      'Pakeiskite sufokusuotų arba užvedančių kortelių ir plytelių mastelį';

  @override
  String get seriesThumbnails => 'Serijos miniatiūros';

  @override
  String get seriesThumbnailsDescription =>
      'Tik serijos: naudokite serijos iliustraciją, atitinkančią kiekvienos eilutės vaizdo tipą';

  @override
  String get homeRowInfoOverlay => 'Pradžios eilutės informacijos perdanga';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Rodyti pavadinimą ir metaduomenis naršant pagrindines eilutes';

  @override
  String get clockDisplay => 'Laikrodžio ekranas';

  @override
  String get inMenus => 'Meniu';

  @override
  String get inVideo => 'Vaizdo įraše';

  @override
  String get seasonalEffects => 'Sezoniniai efektai';

  @override
  String get seasonalEffectsDescription =>
      'Vizualiniai efektai ir sezoninės dekoracijos';

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
  String get snow => 'Sniegas';

  @override
  String get fireworks => 'Fejerverkai';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Krintantys lapai';

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
  String get themeMusic => 'Tema muzika';

  @override
  String get playThemeMusicOnDetailPages =>
      'Leiskite teminę muziką išsamios informacijos puslapiuose';

  @override
  String get themeMusicVolume => 'Tema Muzikos tomas';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Teminė muzika „Home Rows“.';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Leisti naršant pagrindiniame ekrane';

  @override
  String get loopThemeMusic => 'Kartoti temos muziką';

  @override
  String get loopThemeMusicSubtitle =>
      'Kartoti takelį, o ne paleisti jį vieną kartą';

  @override
  String get detailsBackgroundBlur => 'Išsami informacija Fono suliejimas';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value px';
  }

  @override
  String get browsingBackgroundBlur => 'Naršymo fono suliejimas';

  @override
  String get maxStreamingBitrate => 'Maksimalus srauto pralaidumas';

  @override
  String get maxResolution => 'Maksimali raiška';

  @override
  String get playerZoomMode => 'Grotuvo mastelio keitimo režimas';

  @override
  String get settingsScrollWheelAction => 'Pelės slinkties ratukas';

  @override
  String get settingsScrollWheelActionDescription =>
      'Pasirinkite, ką atlieka pelės ratuko sukimas virš vaizdo įrašo atkūrimo metu.';

  @override
  String get scrollWheelActionOff => 'Išjungta';

  @override
  String get scrollWheelActionSeek => 'Peršokti (pirmyn / atgal)';

  @override
  String get scrollWheelActionVolume => 'Garsumas';

  @override
  String get playerTooltipVolume => 'Garsumas';

  @override
  String get fit => 'Tinka';

  @override
  String get autoCrop => 'Automatinis apkarpymas';

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
  String get stretch => 'Ištempti';

  @override
  String get refreshRateSwitching => 'Atnaujinimo dažnio perjungimas';

  @override
  String get disabled => 'Išjungta';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Mastelis televizoriuje';

  @override
  String get scaleOnDevice => 'Įrenginio mastelis';

  @override
  String get trickPlay => 'Triukų žaidimas';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Ieškant rodyti peržiūros miniatiūras';

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
  String get showDescriptionOnPause => 'Rodyti aprašą pauzėje';

  @override
  String get dimVideoShowOverview =>
      'Pristabdydami pritemdykite vaizdo įrašą ir rodykite apžvalgos tekstą';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD užrakinimo mygtukas';

  @override
  String get osdLockButtonDescription =>
      'Rodyti užrakto mygtuką, kuris blokuoja liečiamą įvestį, kol ilgai paspaudžiamas';

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
  String get audioBehavior => 'Garso elgsena';

  @override
  String get downmixToStereo => 'Sumaišykite iki stereo';

  @override
  String get defaultAudioLanguage => 'Numatytoji garso kalba';

  @override
  String get fallbackAudioLanguage => 'Atsarginė garso takelio kalba';

  @override
  String get preferDefaultAudioTrack => 'Pirmenybė numatytajam garso takeliui';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Teikti pirmenybę originaliam garso takeliui, o ne lokalizuotam įgarsinimui.';

  @override
  String get preferAudioDescription =>
      'Pirmenybė garsinio vaizdavimo takeliams';

  @override
  String get preferAudioDescriptionDescription =>
      'Teikti pirmenybę garsinio vaizdavimo takeliams, o ne įprastiems.';

  @override
  String get autoServerDefault => 'Automatinis (numatytasis serveris)';

  @override
  String get english => 'anglų kalba';

  @override
  String get spanish => 'ispanų';

  @override
  String get french => 'prancūzų';

  @override
  String get german => 'vokiečių kalba';

  @override
  String get italian => 'italų';

  @override
  String get portuguese => 'portugalų';

  @override
  String get japanese => 'japonų';

  @override
  String get korean => 'korėjiečių';

  @override
  String get chinese => 'kinų';

  @override
  String get russian => 'rusų';

  @override
  String get arabic => 'arabų';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'olandų';

  @override
  String get swedish => 'švedų';

  @override
  String get norwegian => 'norvegų';

  @override
  String get danish => 'danų';

  @override
  String get finnish => 'suomių';

  @override
  String get polish => 'lenkų';

  @override
  String get ac3Passthrough => 'AC3 perėjimas';

  @override
  String get dtsPassthrough => 'DTS praėjimas';

  @override
  String get trueHdSupport => 'TrueHD palaikymas';

  @override
  String get enableDtsPassthrough =>
      'DTS garso bitų srautas tik į AVR; reikalingas imtuvo palaikymas ir DTS šaltinio takelis';

  @override
  String get settingsAudioFallbackCodec => 'Atsarginis garso kodekas';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Pasirinkite formatą, į kurį bus perkoduojamas daugiakanalis garsas, kai šaltinio srauto negalima paleisti tiesiogiai ar perduoti be pakeitimų.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Aptikti automatiškai\n(rekomenduojama)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(numatytasis)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(tik stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(efektyvus)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(be nuostolių)';

  @override
  String get settingsMaxAudioChannels => 'Daugiausia garso kanalų';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Nurodykite didžiausią garso sistemos kanalų skaičių. Šią ribą viršijantys daugiakanaliai srautai bus sumaišyti arba perkoduoti.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Aptikti automatiškai\n(įrangos numatytasis)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 erdvinis';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 kvadrofoninis';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 erdvinis';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 erdvinis';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 erdvinis';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 erdvinis';

  @override
  String get settingsAudioPassthroughAdvanced =>
      'Tiesioginis perdavimas (išplėstiniai)';

  @override
  String get settingsAudioCodecPassthrough => 'Kodekų tiesioginis perdavimas';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Įjunkite tik tuos formatus, kuriuos palaiko jūsų AVR arba HDMI imtuvas.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 tiesioginis perdavimas';

  @override
  String get settingsAudioDtsCorePassthrough =>
      'DTS Core tiesioginis perdavimas';

  @override
  String get settingsAudioDtsHdPassthrough =>
      'DTS-HD MA tiesioginis perdavimas';

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
  String get settingsAudioTrueHdPassthrough => 'TrueHD tiesioginis perdavimas';

  @override
  String get settingsDetectedAudioCapabilities => 'Aptiktos garso galimybės';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Vykdymo aplinkos galimybių momentinė kopija dar nepasiekiama.';

  @override
  String get settingsAudioRouteLabel => 'Maršrutas';

  @override
  String get settingsAudioDecodeLabel => 'Dekodavimas';

  @override
  String get settingsAudioPassthroughLabel => 'Tiesioginis perdavimas';

  @override
  String get settingsAudioHdRoute => 'HD garso maršrutas';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Garsiakalbis';

  @override
  String get settingsAudioRouteHeadphones => 'Ausinės';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get nightMode => 'Naktinis režimas';

  @override
  String get compressDynamicRange => 'Suspausti dinaminį diapazoną';

  @override
  String get advancedMpv => 'Išplėstinė mpv';

  @override
  String get enableCustomMpvConf => 'Įgalinti tinkintą mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Prieš pradėdami atkūrimą, pritaikykite vartotojo nurodytą mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => 'Nesaugios išplėstinės mpv parinktys';

  @override
  String get unsafeMpvOptionsDescription =>
      'Leisti platesnį mpv parinkčių rinkinį. Gali sutrikdyti atkūrimo elgesį.';

  @override
  String get hardwareDecoding => 'Aparatinės įrangos dekodavimas';

  @override
  String get hardwareDecodingSubtitle =>
      'Gali pagerinti našumą, bet kai kuriuose įrenginiuose gali kilti atkūrimo problemų.';

  @override
  String get nextUpAndQueuing => 'Kitas ir eilėje';

  @override
  String get nextUpDisplay => 'Kitas ekranas';

  @override
  String get extended => 'Prailgintas';

  @override
  String get minimal => 'Minimalus';

  @override
  String get nextUpTimeout => 'Kitas skirtasis laikas';

  @override
  String secondsValue(int value) {
    return '$value s';
  }

  @override
  String get mediaQueuing => 'Medijos eilė';

  @override
  String get autoQueueNextEpisodes => 'Automatiškai įrašyti kitų serijų eilę';

  @override
  String get stillWatchingPrompt => 'Vis dar žiūriu raginimą';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Po $episodes serijų / $hours val.';
  }

  @override
  String get resumeAndSkip => 'Tęsti ir praleisti';

  @override
  String get resumeRewind => 'Tęsti atsukimą';

  @override
  String get unpauseRewind => 'Atšaukti atsukimo pristabdymą';

  @override
  String get fiveSeconds => '5 sekundes';

  @override
  String get tenSeconds => '10 sekundžių';

  @override
  String get fifteenSeconds => '15 sekundžių';

  @override
  String get thirtySeconds => '30 sekundžių';

  @override
  String get skipBackLength => 'Praleisti atgal ilgį';

  @override
  String get skipForwardLength => 'Praleisti ilgį pirmyn';

  @override
  String get customMpvConfPath => 'Pasirinktinis mpv.conf kelias';

  @override
  String get notSetMpvConf =>
      'Nenustatyta. „Moonfin“ išbandys numatytąjį mpv.conf failą programų / duomenų aplankuose.';

  @override
  String get selectMpvConf => 'Pasirinkite mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stiliaus nustatymai (dydis, spalva, poslinkis) taikomi tekstiniams subtitrams (SRT, VTT, TTML). ASS / SSA subtitrai naudoja savo įterptą stilių, nebent „ASS/SSA Direct Play“ išjungtas. Bitmap subtitrų (PGS, DVB, VobSub) pakeisti negalima.';

  @override
  String get defaultSubtitleLanguage => 'Numatytoji subtitrų kalba';

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
  String get defaultToNoSubtitles =>
      'Pagal numatytuosius nustatymus subtitrų nėra';

  @override
  String get turnOffSubtitlesByDefault =>
      'Išjunkite subtitrus pagal numatytuosius nustatymus';

  @override
  String get subtitleSize => 'Subtitrų dydis';

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
  String get textFillColor => 'Teksto užpildymo spalva';

  @override
  String get backgroundColor => 'Fono spalva';

  @override
  String get textStrokeColor => 'Teksto potėpio spalva';

  @override
  String get subtitleCustomization => 'Subtitrų pritaikymas';

  @override
  String get subtitleCustomizationDescription => 'Tinkinkite subtitrų išvaizdą';

  @override
  String get subtitleMode => 'Subtitrų režimas';

  @override
  String get subtitleModeFlagged => 'Pažymėti';

  @override
  String get subtitleModeAlways => 'Visada';

  @override
  String get subtitleModeForeign => 'Užsienio kalba';

  @override
  String get subtitleModeForced => 'Priverstiniai';

  @override
  String get subtitleModeFlaggedDescription =>
      'Rodo takelius, kurie medijos failo metaduomenyse pažymėti kaip „default“ arba „forced“.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Automatiškai įkelia ir rodo subtitrus kaskart, kai pradedamas vaizdo įrašas.';

  @override
  String get subtitleModeForeignDescription =>
      'Automatiškai įjungia subtitrus, jei numatytasis garso takelis yra užsienio kalba.';

  @override
  String get subtitleModeForcedDescription =>
      'Įkelia tik subtitrus, aiškiai pažymėtus „forced“ metaduomenų žyme.';

  @override
  String get subtitleModeNoneDescription =>
      'Visiškai išjungia automatinį subtitrų įkėlimą.';

  @override
  String get fallbackSubtitleLanguage => 'Atsarginė subtitrų kalba';

  @override
  String get subtitleStream => 'Subtitrų srautas';

  @override
  String get subtitlePreviewText =>
      'Greita rudoji lapė peršoka per tinginį šunį';

  @override
  String get verticalOffset => 'Vertikalus poslinkis';

  @override
  String get pgsDirectPlay => 'PGS tiesioginis žaidimas';

  @override
  String get directPlayPgsSubtitles => 'Tiesioginis PGS subtitrai';

  @override
  String get assSsaDirectPlay => 'ASS/SSA tiesioginis paleidimas';

  @override
  String get directPlayAssSsaSubtitles =>
      'Tiesioginis ASS/SSA subtitrų paleidimas';

  @override
  String get white => 'Baltas';

  @override
  String get black => 'Juoda';

  @override
  String get yellow => 'Geltona';

  @override
  String get green => 'Žalia';

  @override
  String get cyan => 'Žydra spalva';

  @override
  String get red => 'Raudona';

  @override
  String get transparent => 'Skaidrus';

  @override
  String get semiTransparentBlack => 'Pusiau permatomas juodas';

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
  String get global => 'Pasaulinis';

  @override
  String get desktop => 'Darbalaukis';

  @override
  String get mobile => 'Mobilusis';

  @override
  String get tv => 'televizorius';

  @override
  String loadedProfileSettings(String profile) {
    return 'Įkelti $profile profilio nustatymai.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nepavyko įkelti $profile profilio nustatymų.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Vietiniai nustatymai sinchronizuoti su $profile profiliu.';
  }

  @override
  String get syncing => 'Sinchronizuojama...';

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
  String get profileSyncHidden => 'Profilio sinchronizavimas paslėptas';

  @override
  String get enablePluginSyncDescription =>
      'Papildinio nustatymuose įgalinkite serverio papildinio sinchronizavimą, kad čia būtų rodomi profilio valdikliai.';

  @override
  String get quality => 'Kokybė';

  @override
  String get defaultDownloadQuality => 'Numatytoji atsisiuntimo kokybė';

  @override
  String get network => 'Tinklas';

  @override
  String get wifiOnlyDownloads => 'Atsisiuntimai tik per WiFi';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Rodyti atsisiuntimus serveryje';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Leisti serverio administratoriui matyti jūsų perkoduotus atsisiuntimus valdymo skydelyje';

  @override
  String get onlyDownloadOnWifi => 'Atsisiųskite tik prisijungę prie „WiFi“.';

  @override
  String get storage => 'Sandėliavimas';

  @override
  String get storageUsed => 'Naudota saugykla';

  @override
  String get manage => 'Tvarkyti';

  @override
  String get calculating => 'Skaičiuojama...';

  @override
  String get downloadLocation => 'Atsisiuntimo vieta';

  @override
  String get defaultLabel => 'Numatytoji';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Išsaugoti atsisiuntimų aplanke';

  @override
  String get downloadsVisibleToOtherApps =>
      'Atsisiuntimai / Moonfin – matoma kitoms programoms';

  @override
  String get dangerZone => 'Pavojaus zona';

  @override
  String get clearAllDownloads => 'Išvalyti visus atsisiuntimus';

  @override
  String get original => 'Originalus';

  @override
  String get changeDownloadLocation => 'Keisti atsisiuntimo vietą';

  @override
  String get changeDownloadLocationDescription =>
      'Nauji atsisiuntimai bus išsaugoti pasirinktame aplanke. Esami atsisiuntimai liks dabartinėje vietoje ir gali būti tvarkomi iš saugyklos nustatymų.';

  @override
  String get confirm => 'Patvirtinti';

  @override
  String get cannotWriteToFolder =>
      'Neįmanoma įrašyti į pasirinktą aplanką. Pasirinkite kitą vietą arba suteikite saugyklos leidimus.';

  @override
  String get saveToDownloadsFolderQuestion => 'Išsaugoti atsisiuntimų aplanke?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Atsisiųsta medija bus išsaugota jūsų įrenginio aplanke „Atsisiuntimai/Moonfin“. Šiuos failus matys kitos programos, pvz., galerija ar muzikos grotuvas.\n\nEsami atsisiuntimai liks dabartinėje vietoje.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Įgalinti';

  @override
  String get clearAllDownloadsWarning =>
      'Taip bus ištrinta visa atsisiųsta medija ir veiksmo anuliuoti negalima.';

  @override
  String get clearAll => 'Išvalyti viską';

  @override
  String get navigationStyle => 'Navigacijos stilius';

  @override
  String get topBar => 'Viršutinė juosta';

  @override
  String get leftSidebar => 'Kairioji šoninė juosta';

  @override
  String get showShuffleButton => 'Rodyti maišymo mygtuką';

  @override
  String get showGenresButton => 'Mygtukas Rodyti žanrus';

  @override
  String get showFavoritesButton => 'Rodyti mėgstamiausių mygtuką';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Rodyti bibliotekas įrankių juostoje';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'Visada rodyti naršymo juostos pavadinimus';

  @override
  String get showSeerrButton => 'Rodyti Seerr mygtuką';

  @override
  String get navbarOpacity => 'Navigacijos juostos neskaidrumas';

  @override
  String get navbarColor => 'Navigacijos juostos spalva';

  @override
  String get gray => 'Pilka';

  @override
  String get darkBlue => 'Tamsiai Mėlyna';

  @override
  String get purple => 'Violetinė';

  @override
  String get teal => 'žalsvai mėlyna';

  @override
  String get navy => 'Tamsiai mėlyna';

  @override
  String get charcoal => 'Anglis';

  @override
  String get brown => 'Ruda';

  @override
  String get darkRed => 'Tamsiai Raudona';

  @override
  String get darkGreen => 'Tamsiai žalia';

  @override
  String get slate => 'Šiferis';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Bibliotekos ekranas';

  @override
  String get posterLabel => 'Plakatas';

  @override
  String get thumbnailLabel => 'Miniatiūra';

  @override
  String get bannerLabel => 'Reklamjuostė';

  @override
  String get overridePerLibrarySettings => 'Nepaisyti bibliotekos nustatymų';

  @override
  String get applyImageTypeToAllLibraries =>
      'Taikyti vaizdo tipą visoms bibliotekoms';

  @override
  String get multiServerLibraries => 'Kelių serverių bibliotekos';

  @override
  String get showLibrariesFromAllServers =>
      'Rodyti visų prijungtų serverių bibliotekas';

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
  String get groupItemsIntoCollections => 'Grupuoti elementus į rinkinius';

  @override
  String get hideCollectionAssociatedItems =>
      'Naršant bibliotekas slėpti su rinkiniais susietus bibliotekos elementus';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Pranešimas apie bibliotekos grupavimą';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Kad galėtumėte naudoti šį nustatymą, savo Jellyfin arba Emby serveryje, bibliotekos rodymo nustatymuose, įjunkite bibliotekos parinktį „Grupuoti filmus į rinkinius“ ir (arba) „Grupuoti serialus į rinkinius“.';

  @override
  String get libraryVisibility => 'Bibliotekos matomumas';

  @override
  String get libraryVisibilityDescription =>
      'Perjungti pagrindinio puslapio matomumą pagal biblioteką. Iš naujo paleiskite „Moonfin“, kad pakeitimai įsigaliotų.';

  @override
  String get showInNavigation => 'Rodyti navigacijoje';

  @override
  String get showInLatestMedia => 'Rodyti naujausioje žiniasklaidoje';

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
  String get sourceLibraries => 'Šaltinių bibliotekos';

  @override
  String get sourceCollections => 'Šaltinių rinkiniai';

  @override
  String get excludedGenres => 'Išskirti žanrai';

  @override
  String get selectAll => 'Pasirinkite Viskas';

  @override
  String itemsSelected(int count) {
    return 'Pasirinkta: $count';
  }

  @override
  String get mediaBar => 'Medijos juosta';

  @override
  String get mediaSources => 'Žiniasklaidos šaltiniai';

  @override
  String get behavior => 'Elgesys';

  @override
  String get seconds => 'sekundžių';

  @override
  String get mediaBarMode => 'Medijos juostos stilius';

  @override
  String get mediaBarModeDescription =>
      'Pasirinkite iš įvairių medijos juostos stilių arba išjunkite medijos juostą';

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
  String get mediaBarModeOff => 'Išjungta';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Įgalinti medijos juostą';

  @override
  String get showFeaturedContentSlideshow =>
      'Rodyti siūlomo turinio skaidrių demonstraciją pagrindiniame puslapyje';

  @override
  String get contentType => 'Turinio tipas';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Filmai ir TV laidos';

  @override
  String get moviesOnly => 'Tik filmai';

  @override
  String get tvShowsOnly => 'Tik televizijos laidos';

  @override
  String get itemCount => 'Prekių skaičius';

  @override
  String get noneSelected => 'Nepasirinkta nė vieno';

  @override
  String get noneExcluded => 'Nė vienas neįtrauktas';

  @override
  String get autoAdvance => 'Automatinis perėjimas';

  @override
  String get autoAdvanceSlides => 'Automatiškai pereiti prie kitos skaidrės';

  @override
  String get autoAdvanceInterval => 'Automatinio perėjimo intervalas';

  @override
  String get trailerPreview => 'Anonso peržiūra';

  @override
  String get autoPlayTrailers =>
      'Automatiškai paleiskite anonsus medijos juostoje po 3 sekundžių';

  @override
  String get trailerAudio => 'Anonsų garsas';

  @override
  String get enableTrailerAudio => 'Įjungti anonsų garsą medijos juostoje';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Epizodo peržiūra';

  @override
  String get mediaPreview => 'Medijos peržiūra';

  @override
  String get episodePreviewDescription =>
      'Žaiskite 30 sekundžių eilutę sufokusuotomis, užvedus pelės žymeklį arba ilgai paspaustomis kortomis';

  @override
  String get mediaPreviewDescription =>
      'Žaiskite 30 sekundžių eilutę sufokusuotomis, užvedus pelės žymeklį arba ilgai paspaustomis kortomis';

  @override
  String get previewAudio => 'Garso peržiūra';

  @override
  String get enablePreviewAudio => 'Įgalinti anonso ir serijos peržiūrų garsą';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Naujausia žiniasklaida';

  @override
  String get recentlyReleased => 'Neseniai Išleistas';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Mano žiniasklaida';

  @override
  String get myMediaSmall => 'Mano laikmena (maža)';

  @override
  String get continueWatching => 'Žiūrėti toliau';

  @override
  String get resumeAudio => 'Tęsti garsą';

  @override
  String get resumeBooks => 'Tęsti knygas';

  @override
  String get activeRecordings => 'Aktyvūs įrašai';

  @override
  String get playlists => 'Grojaraščiai';

  @override
  String get liveTV => 'Tiesioginė televizija';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Atstatyti į numatytuosius nustatymus';

  @override
  String get homeRowPosterSize => 'Namų eilutės plakato dydis';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigūruokite vaizdo tipą kiekvienai įgalintai pagrindinei eilutei';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Sujunkite Tęsti žiūrėjimą ir Kitas';

  @override
  String get combineBothRows => 'Sujunkite abi eilutes į vieną namų skyrių';

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
  String get fullScreenRows => 'Išplėstos pradžios ekrano eilutės';

  @override
  String get fullScreenRowsDescription =>
      'Rodyti tik po vieną pradžios ekrano eilutę';

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
  String get perRowSettings => 'Eilučių nustatymai';

  @override
  String get autoLogin => 'Automatinis prisijungimas';

  @override
  String get lastUser => 'Paskutinis vartotojas';

  @override
  String get currentUser => 'Dabartinis naudotojas';

  @override
  String get alwaysAuthenticate => 'Visada autentifikuoti';

  @override
  String get requirePasswordWithToken =>
      'Reikalauti slaptažodžio, net jei yra išsaugotas prieigos raktas';

  @override
  String get confirmExit => 'Patvirtinkite išėjimą';

  @override
  String get showConfirmationBeforeExiting =>
      'Prieš išeidami parodykite patvirtinimą';

  @override
  String get blockContentWithRatings =>
      'Blokuoti turinį su šiais įvertinimais:';

  @override
  String get noContentRatingsFound =>
      'Šiame serveryje dar nerasta jokių turinio įvertinimų.';

  @override
  String get couldNotLoadServerRatings =>
      'Nepavyko įkelti serverio įvertinimų. Rodomi tik išsaugoti įvertinimai.';

  @override
  String get couldNotRefreshRatings =>
      'Nepavyko atnaujinti įvertinimų iš serverio. Rodomi išsaugoti įvertinimai.';

  @override
  String get enablePinCode => 'Įjungti PIN kodą';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess =>
      'Reikalauti PIN kodo, kad galėtumėte pasiekti paskyrą';

  @override
  String get changePin => 'Pakeiskite PIN kodą';

  @override
  String get setNewPinCode => 'Nustatykite naują PIN kodą';

  @override
  String get removePin => 'Pašalinti PIN kodą';

  @override
  String get removePinProtection => 'Pašalinkite PIN kodo apsaugą';

  @override
  String get screensaver => 'Ekrano užsklanda';

  @override
  String get inAppScreensaver => 'Ekrano užsklanda programoje';

  @override
  String get enableBuiltInScreensaver => 'Įjunkite įmontuotą ekrano užsklandą';

  @override
  String get mode => 'Režimas';

  @override
  String get libraryArt => 'Bibliotekos str';

  @override
  String get logo => 'Logotipas';

  @override
  String get clock => 'Laikrodis';

  @override
  String get timeout => 'Skirtasis laikas';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Pritemdymo lygis';

  @override
  String get maxAgeRating => 'Maksimalus amžiaus įvertinimas';

  @override
  String get any => 'Bet koks';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Reikalauti amžiaus cenzo';

  @override
  String get onlyShowRatedContent => 'Rodyti tik įvertintą turinį';

  @override
  String get displayClockDuringScreensaver =>
      'Rodyti laikrodį ekrano užsklandos metu';

  @override
  String get clockModeStatic => 'Statiškas';

  @override
  String get clockModeBouncing => 'Šokinėjantis';

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
  String get rottenTomatoesCritics => 'Supuvę pomidorai (kritikai)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (auditorija)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritiškas';

  @override
  String get metacriticUser => 'Metacritic (vartotojas)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Pašto dėžutė';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Bendruomenės įvertinimas';

  @override
  String get ratings => 'Įvertinimai';

  @override
  String get additionalRatings => 'Papildomi įvertinimai';

  @override
  String get showMdbListAndTmdbRatings => 'Rodyti MDBList ir TMDB įvertinimus';

  @override
  String get ratingLabels => 'Įvertinimo etiketės';

  @override
  String get showLabelsNextToIcons =>
      'Rodyti etiketes šalia įvertinimo piktogramų';

  @override
  String get ratingBadges => 'Įvertinimo ženkleliai';

  @override
  String get showDecorativeBadges =>
      'Rodyti dekoratyvinius ženklelius už įvertinimų';

  @override
  String get episodeRatings => 'Epizodų įvertinimai';

  @override
  String get showRatingsOnEpisodes => 'Rodyti atskirų serijų įvertinimus';

  @override
  String get ratingSources => 'Įvertinimo šaltiniai';

  @override
  String get ratingSourcesDescription =>
      'Įgalinkite ir pertvarkykite įvertinimo šaltinius, rodomus visoje programoje';

  @override
  String get pluginDetected => 'Papildinys aptiktas';

  @override
  String get pluginNotDetected => 'Papildinys neaptiktas';

  @override
  String get pluginNotDetectedDescription =>
      'Serverio papildinys šiuo metu neaptiktas. Vietiniai nustatymai vis tiek naudoja išsaugotas vertes arba įtaisytuosius numatytuosius nustatymus.';

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
  String get recentRequests => 'Naujausi prašymai';

  @override
  String get recentlyAdded => 'Neseniai pridėta';

  @override
  String get trending => 'Tendencijos';

  @override
  String get popularMovies => 'Populiarūs filmai';

  @override
  String get movieGenres => 'Filmų žanrai';

  @override
  String get upcomingMovies => 'Būsimi filmai';

  @override
  String get studios => 'Studijos';

  @override
  String get popularSeries => 'Populiari serija';

  @override
  String get seriesGenres => 'Serialo žanrai';

  @override
  String get upcomingSeries => 'Būsimas serialas';

  @override
  String get networks => 'Tinklai';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Seerr atradimų eilutės';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults =>
      'Iš naujo nustatyti eilutes į numatytuosius nustatymus';

  @override
  String get enableSeerr => 'Įgalinti Seerr';

  @override
  String get showSeerrInNavigation =>
      'Rodyti Seerr navigacijoje (reikalingas serverio papildinys)';

  @override
  String get seerrUnavailable =>
      'Nepasiekiamas, nes serverio papildinio Seerr palaikymas išjungtas.';

  @override
  String get nsfwFilter => 'NSFW filtras';

  @override
  String get hideAdultContent =>
      'Slėpti suaugusiesiems skirtą turinį rezultatuose';

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
  String get seerrNotificationsSection => 'Pranešimai';

  @override
  String get seerrNotifyNewRequestsTitle => 'Pranešimai apie naujas užklausas';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Pranešti, kai kas nors pateikia užklausą';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Užklausų naujienos';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Patvirtinta, atmesta ir įtraukta į jūsų biblioteką';

  @override
  String get seerrNotifyIssuesTitle => 'Problemų naujienos';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Naujos problemos, atsakymai ir sprendimai';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Prisijungta kaip: $username';
  }

  @override
  String get discoverRows => 'Seerr atradimų puslapis';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Įjunkite eilutes, kurias norite matyti Seerr pagrindiniame puslapyje. Vilkite, kad pertvarkytumėte. Pasirinktinė tvarka sinchronizuojama su Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Įjunkite eilutes, kurias norite matyti Seerr pagrindiniame puslapyje. Vilkite, kad pertvarkytumėte. Pasirinktinė tvarka sinchronizuojama su Moonbase.';

  @override
  String get enabled => 'Įjungta';

  @override
  String get hidden => 'Paslėpta';

  @override
  String get aboutTitle => 'Apie';

  @override
  String versionValue(String version) {
    return '$version versija';
  }

  @override
  String get openSourceLicenses => 'Atvirojo kodo licencijos';

  @override
  String get sourceCode => 'Šaltinio kodas';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Patikrinkite, ar nėra atnaujinimų dabar';

  @override
  String get checksLatestDesktopRelease =>
      'Tikrina naujausią šios platformos darbalaukio leidimą';

  @override
  String get youAreUpToDate => 'Jūs esate atnaujintas.';

  @override
  String get couldNotCheckForUpdates =>
      'Šiuo metu nepavyko patikrinti, ar yra naujinimų.';

  @override
  String get noCompatibleUpdate =>
      'Nerasta šiai platformai suderinamo naujinimo paketo.';

  @override
  String get updateChecksNotSupported =>
      'Atnaujinimo patikrinimai šioje platformoje nepalaikomi.';

  @override
  String get updateNotificationsDisabled =>
      'Pranešimai apie atnaujinimus išjungti.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Palaukite prieš tikrindami dar kartą.';

  @override
  String get latestUpdateAlreadyShown =>
      'Paskutinis atnaujinimas jau buvo parodytas.';

  @override
  String get updateAvailable => 'Galimas atnaujinimas.';

  @override
  String updateAvailableVersion(String version) {
    return 'Galimas naujinys: v$version';
  }

  @override
  String get updateNotifications => 'Atnaujinti pranešimus';

  @override
  String get showWhenUpdatesAvailable => 'Rodyti, kada yra naujinių';

  @override
  String updateAvailableTitle(String version) {
    return 'Galima v$version';
  }

  @override
  String get readReleaseNotes => 'Perskaitykite leidimo pastabas';

  @override
  String get downloadingUpdate => 'Atsisiunčiamas naujinys...';

  @override
  String get updateDownloadFailed =>
      'Nepavyko atsisiųsti naujinimo. Bandykite dar kartą.';

  @override
  String get openReleasesPage => 'Atidarykite leidimų puslapį';

  @override
  String get navigation => 'Navigacija';

  @override
  String get watchedIndicatorsBackdrops => 'Stebėti indikatoriai, fonai';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokusavimo spalva, stebimi indikatoriai, fonai';

  @override
  String get navbarStyleToolbarAppearance =>
      'Naršymo juostos stilius, įrankių juostos mygtukai, išvaizda';

  @override
  String get featuredContentAppearance => 'Teminis turinys, išvaizda';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Vaizdų talpyklos limitas';

  @override
  String get clearImageCache => 'Išvalyti vaizdų talpyklą';

  @override
  String get imageCacheCleared => 'Vaizdų talpykla išvalyta';

  @override
  String get clear => 'Išvalyti';

  @override
  String get browse => 'Naršyti';

  @override
  String get noResults => 'Jokių rezultatų';

  @override
  String get seerrAvailableStatus => 'Galima';

  @override
  String get seerrRequestedStatus => 'Paprašyta';

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
    return 'Atsisiunčiama · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importuojama';

  @override
  String itemsCount(int count) {
    return 'Elementų: $count';
  }

  @override
  String get seerrSettings => 'Seerr nustatymai';

  @override
  String get requestMore => 'Prašyti daugiau';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Prašymas';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Atšaukti užklausą';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Žaisk „Moonfin“.';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Užklausą pateikė $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Patvirtinti';

  @override
  String get declineAction => 'Atmesti';

  @override
  String get similar => 'Panašus';

  @override
  String get recommendations => 'Rekomendacijos';

  @override
  String cancelRequestForTitle(String title) {
    return 'Atšaukti „$title“ užklausą?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Atšaukti „$title“ užklausas ($count)?';
  }

  @override
  String get keep => 'Laikyti';

  @override
  String get itemNotFoundInLibrary =>
      'Elementas nerastas jūsų Moonfin bibliotekoje';

  @override
  String get errorSearchingLibrary => 'Klaida ieškant bibliotekoje';

  @override
  String budgetAmount(String amount) {
    return 'Biudžetas: $amount \$';
  }

  @override
  String revenueAmount(String amount) {
    return 'Pajamos: $amount \$';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Pateikti $type užklausą';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Pateikti užklausą';

  @override
  String get allSeasons => 'Visi sezonai';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Išplėstinės parinktys';

  @override
  String get noServiceServersConfigured =>
      'Paslaugų serveriai nesukonfigūruoti';

  @override
  String get server => 'Serveris';

  @override
  String get qualityProfile => 'Kokybės profilis';

  @override
  String get rootFolder => 'Šakninis aplankas';

  @override
  String get showMore => 'Rodyti daugiau';

  @override
  String get appearances => 'Filmografija';

  @override
  String get crewSection => 'Įgula';

  @override
  String ageValue(int age) {
    return 'amžius $age';
  }

  @override
  String get noRequests => 'Jokių prašymų';

  @override
  String get pendingStatus => 'Laukiama';

  @override
  String get declinedStatus => 'Atmesta';

  @override
  String get partiallyAvailable => 'Iš dalies prieinamas';

  @override
  String get downloadingStatus => 'Atsisiunčiama';

  @override
  String get approvedStatus => 'Patvirtinta';

  @override
  String get notRequestedStatus => 'Neprašoma';

  @override
  String get blocklistedStatus => 'Įtrauktas į blokų sąrašą';

  @override
  String get deletedStatus => 'Ištrinta';

  @override
  String get failedStatus => 'Nepavyko';

  @override
  String get processingStatus => 'Apdorojama';

  @override
  String modifiedByName(String name) {
    return 'Pakeitė $name';
  }

  @override
  String get completedStatus => 'Užbaigta';

  @override
  String get requestErrorDuplicate => 'Šio pavadinimo užklausa jau pateikta';

  @override
  String get requestErrorQuota => 'Pasiektas užklausų limitas';

  @override
  String get requestErrorBlocklisted =>
      'Šis pavadinimas įtrauktas į blokuojamųjų sąrašą';

  @override
  String get requestErrorNoSeasons =>
      'Nebeliko sezonų, kuriems būtų galima pateikti užklausą';

  @override
  String get requestErrorPermission =>
      'Neturite teisės pateikti šios užklausos';

  @override
  String get seerrRequestsTitle => 'Užklausos';

  @override
  String get seerrIssuesTitle => 'Problemos';

  @override
  String get sortNewest => 'Naujausi';

  @override
  String get sortLastModified => 'Paskutinį kartą keista';

  @override
  String get noIssues => 'Problemų nėra';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Liko $remaining iš $limit filmų užklausų';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Liko $remaining iš $limit sezonų užklausų';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Priklauso rinkiniui $name';
  }

  @override
  String get viewCollection => 'Peržiūrėti rinkinį';

  @override
  String get requestCollection => 'Pateikti rinkinio užklausą';

  @override
  String collectionMoviesSummary(int total, int available) {
    return 'Filmų: $total · pasiekiama: $available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Pateikti užklausą dėl $count filmų';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Pateikiama $current iš $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Pateikta užklausų dėl $count filmų';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Pateikta $ok iš $total filmų užklausų';
  }

  @override
  String get collectionAllRequested =>
      'Visi filmai jau pasiekiami arba jų užklausos pateiktos';

  @override
  String get reportIssue => 'Pranešti apie problemą';

  @override
  String get issueTypeVideo => 'Vaizdas';

  @override
  String get issueTypeAudio => 'Garsas';

  @override
  String get whatsWrong => 'Kas negerai?';

  @override
  String get allEpisodes => 'Visos serijos';

  @override
  String get episode => 'Serija';

  @override
  String get openStatus => 'Atvira';

  @override
  String get resolvedStatus => 'Išspręsta';

  @override
  String get resolveAction => 'Išspręsti';

  @override
  String get reopenAction => 'Atidaryti iš naujo';

  @override
  String reportedByName(String name) {
    return 'Pranešė $name';
  }

  @override
  String commentsCount(int count) {
    return 'Komentarų: $count';
  }

  @override
  String get addComment => 'Pridėti komentarą';

  @override
  String get deleteIssueConfirm => 'Ištrinti šią problemą?';

  @override
  String get submitReport => 'Pateikti pranešimą';

  @override
  String get tmdbScore => 'TMDB balas';

  @override
  String get releaseDateLabel => 'Išleidimo data';

  @override
  String get firstAirDateLabel => 'Pirmasis eterio pasimatymas';

  @override
  String get revenueLabel => 'Pajamos';

  @override
  String get runtimeLabel => 'Vykdymo laikas';

  @override
  String get budgetLabel => 'Biudžetas';

  @override
  String get originalLanguageLabel => 'Originalo kalba';

  @override
  String get seasonsLabel => 'Sezonai';

  @override
  String get episodesLabel => 'Epizodai';

  @override
  String get access => 'Prieiga';

  @override
  String get add => 'Pridėti';

  @override
  String get address => 'Adresas';

  @override
  String get analytics => 'Analizė';

  @override
  String get catalog => 'Katalogas';

  @override
  String get content => 'Turinys';

  @override
  String get copy => 'Kopijuoti';

  @override
  String get create => 'Sukurti';

  @override
  String get disable => 'Išjungti';

  @override
  String get done => 'Atlikta';

  @override
  String get edit => 'Redaguoti';

  @override
  String get encoding => 'Kodavimas';

  @override
  String get error => 'Klaida';

  @override
  String get forward => 'Pirmyn';

  @override
  String get general => 'Bendra';

  @override
  String get go => 'Eik';

  @override
  String get install => 'Įdiegti';

  @override
  String get installed => 'Įdiegta';

  @override
  String get interval => 'Intervalas';

  @override
  String get name => 'Vardas';

  @override
  String get networking => 'Tinklo kūrimas';

  @override
  String get next => 'Kitas';

  @override
  String get path => 'Kelias';

  @override
  String get paused => 'Pristabdyta';

  @override
  String get permissions => 'Leidimai';

  @override
  String get processing => 'Apdorojimas';

  @override
  String get profile => 'Profilis';

  @override
  String get provider => 'Teikėjas';

  @override
  String get refresh => 'Atnaujinti';

  @override
  String get remote => 'Nuotolinis';

  @override
  String get rename => 'Pervardyti';

  @override
  String get revoke => 'Atšaukti';

  @override
  String get role => 'Vaidmuo';

  @override
  String get root => 'Šaknis';

  @override
  String get run => 'Bėk';

  @override
  String get search => 'Ieškoti';

  @override
  String get select => 'Pasirinkite';

  @override
  String get send => 'Siųsti';

  @override
  String get sessions => 'Sesijos';

  @override
  String get set => 'Nustatyti';

  @override
  String get status => 'Būsena';

  @override
  String get stop => 'Stabdyti';

  @override
  String get streaming => 'Srautinis perdavimas';

  @override
  String get time => 'Laikas';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Pašalinkite';

  @override
  String get up => 'Aukštyn';

  @override
  String get update => 'Atnaujinti';

  @override
  String get upload => 'Įkelti';

  @override
  String get unmute => 'Įjungti garsą';

  @override
  String get mute => 'Nutildyti';

  @override
  String get branding => 'Prekės ženklas';

  @override
  String get adminDrawerDashboard => 'Prietaisų skydelis';

  @override
  String get adminDrawerAnalytics => 'Analizė';

  @override
  String get adminDrawerSettings => 'Nustatymai';

  @override
  String get adminDrawerBranding => 'Prekės ženklas';

  @override
  String get adminDrawerUsers => 'Vartotojai';

  @override
  String get adminDrawerLibraries => 'Bibliotekos';

  @override
  String get adminDrawerDisplay => 'Rodymas';

  @override
  String get adminDrawerMetadata => 'Metaduomenys';

  @override
  String get adminDrawerNfo => 'NFO nustatymai';

  @override
  String get adminDrawerTranscoding => 'Perkodavimas';

  @override
  String get adminDrawerResume => 'Tęsti';

  @override
  String get adminDrawerStreaming => 'Srautinis perdavimas';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Prietaisai';

  @override
  String get adminDrawerActivity => 'Veikla';

  @override
  String get adminDrawerNetworking => 'Tinklo kūrimas';

  @override
  String get adminDrawerApiKeys => 'API raktai';

  @override
  String get adminDrawerBackups => 'Atsarginės kopijos';

  @override
  String get adminDrawerLogs => 'Rąstai';

  @override
  String get adminDrawerScheduledTasks => 'Suplanuotos užduotys';

  @override
  String get adminDrawerPlugins => 'Papildiniai';

  @override
  String get adminDrawerRepositories => 'Saugyklos';

  @override
  String get adminDrawerLiveTv => 'Tiesioginė televizija';

  @override
  String get adminExitTooltip => 'Išeiti iš administratoriaus';

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
  String get adminDashboardLoadFailed => 'Nepavyko įkelti prietaisų skydelio';

  @override
  String get adminMediaOverview => 'Žiniasklaidos apžvalga';

  @override
  String get adminMediaTotalsError => 'Nepavyko įkelti serverio medijos sumų.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Greitai perskaitykite, kiek turinio yra šiame serveryje.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Galimi papildinio atnaujinimai: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Papildiniai, kuriuos reikia paleisti iš naujo: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Nepavyko suplanuotos užduotys: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Žiniasklaidos platinimas';

  @override
  String get analyticsVideoCodecs => 'Vaizdo kodekai';

  @override
  String get analyticsAudioCodecs => 'Garso kodekai';

  @override
  String get analyticsContainers => 'Konteineriai';

  @override
  String get analyticsTopGenres => 'Populiariausi žanrai';

  @override
  String get analyticsReleaseYears => 'Išleidimo metai';

  @override
  String get analyticsContentRatings => 'Turinio įvertinimai';

  @override
  String get analyticsRuntimeBuckets => 'Vykdymo laiko segmentai';

  @override
  String get analyticsFileFormats => 'Failų formatai';

  @override
  String get analyticsNoData => 'Duomenų nėra.';

  @override
  String get adminServerInfo => 'Serverio informacija';

  @override
  String get adminRestartPending => 'Laukiama iš naujo';

  @override
  String get adminServerPaths => 'Serverio keliai';

  @override
  String get adminServerActions => 'Serverio veiksmai';

  @override
  String get adminRestartServer => 'Iš naujo paleiskite serverį';

  @override
  String get adminShutdownServer => 'Serverio išjungimas';

  @override
  String get adminLibraryScanStarted => 'Pradėtas bibliotekos skenavimas';

  @override
  String errorGeneric(String error) {
    return 'Klaida: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Vyksta serverio perkrovimas';

  @override
  String get adminServerRebootMessage =>
      'Serveris perkraunamas, iš naujo paleiskite „Moonfin“.';

  @override
  String get adminActiveSessions => 'Aktyvūs užsiėmimai';

  @override
  String get adminSessionsLoadFailed => 'Nepavyko įkelti seansų';

  @override
  String get adminNoActiveSessions => 'Nėra aktyvių seansų';

  @override
  String get adminRecentActivity => 'Naujausia veikla';

  @override
  String get adminNoRecentActivity => 'Nėra pastarojo meto veiklos';

  @override
  String adminCommandFailed(String error) {
    return 'Komanda nepavyko: $error';
  }

  @override
  String get adminSendMessage => 'Siųsti žinutę';

  @override
  String get adminMessageTextHint => 'Pranešimo tekstas';

  @override
  String get adminSetVolume => 'Nustatykite garsumą';

  @override
  String get sessionPrev => 'Ankst';

  @override
  String get sessionRewind => 'Atsukti atgal';

  @override
  String get sessionForward => 'Prasukti pirmyn';

  @override
  String get sessionNext => 'Kitas';

  @override
  String get sessionVolumeDown => 'tomas –';

  @override
  String get sessionVolumeUp => 'Gars. +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Dabar žaidžiama';

  @override
  String get volume => 'Garsumas';

  @override
  String get actions => 'Veiksmai';

  @override
  String get videoCodec => 'Vaizdo įrašų kodekas';

  @override
  String get audioCodec => 'Garso kodekas';

  @override
  String get hwAccel => 'Aparat. spartinimas';

  @override
  String get completion => 'Užbaigimas';

  @override
  String get adminClearDates => 'Aiškios datos';

  @override
  String get adminActivitySeverityAll => 'Visi svarbumo lygiai';

  @override
  String get adminActivityDateRange => 'Datų intervalas';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Nepavyko įkelti veiklos žurnalo: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nėra veiklos įrašų';

  @override
  String get adminEditDeviceName => 'Redaguoti įrenginio pavadinimą';

  @override
  String get adminCustomName => 'Pasirinktinis pavadinimas';

  @override
  String get adminDeviceNameUpdated => 'Įrenginio pavadinimas atnaujintas';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Nepavyko atnaujinti įrenginio: $error';
  }

  @override
  String get adminDeleteDevice => 'Ištrinti įrenginį';

  @override
  String get adminDeviceDeleted => 'Įrenginys ištrintas';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Nepavyko ištrinti įrenginio: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Pašalinti įrenginį „$name“? Naudotojui reikės iš naujo prisijungti šiame įrenginyje.';
  }

  @override
  String get adminDeleteAllDevices => 'Ištrinti visus įrenginius';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Pašalinti įrenginius ($count)? Paveiktiems naudotojams reikės prisijungti iš naujo. Jūsų dabartinis įrenginys nebus paveiktas.';
  }

  @override
  String get adminDevicesDeletedAll => 'Įrenginiai pašalinti';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Kai kurie įrenginiai pašalinti; $count pašalinti nepavyko.';
  }

  @override
  String get adminDevicesLoadFailed => 'Nepavyko įkelti įrenginių';

  @override
  String get adminSearchDevices => 'Ieškokite įrenginių';

  @override
  String get adminThisDevice => 'Šis Įrenginys';

  @override
  String get adminEditName => 'Redaguoti vardą';

  @override
  String get adminLibrariesLoadFailed => 'Nepavyko įkelti bibliotekų';

  @override
  String get adminNoLibraries => 'Nėra sukonfigūruotų bibliotekų';

  @override
  String get adminScanAllLibraries => 'Nuskaityti visas bibliotekas';

  @override
  String get adminAddLibrary => 'Pridėti biblioteką';

  @override
  String adminScanFailed(String error) {
    return 'Nepavyko pradėti nuskaitymo: $error';
  }

  @override
  String get adminRenameLibrary => 'Pervardyti biblioteką';

  @override
  String get adminNewName => 'Naujas vardas';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteka pervadinta į „$name“';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Nepavyko pervardyti: $error';
  }

  @override
  String get adminDeleteLibrary => 'Ištrinti biblioteką';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteka „$name“ ištrinta';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Nepavyko ištrinti bibliotekos: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Nepavyko pridėti kelio: $error';
  }

  @override
  String get adminRemovePath => 'Pašalinti kelią';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Pašalinti „$path“ iš šios bibliotekos?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Nepavyko pašalinti kelio: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nepavyko įkelti bibliotekos';

  @override
  String get adminNoMediaPaths => 'Nesukonfigūruota medijos kelių';

  @override
  String get adminAddPath => 'Pridėti kelią';

  @override
  String get adminBrowseFilesystem => 'Naršyti serverio failų sistemą:';

  @override
  String get adminPreferredMetadataLanguage => 'Pageidautina metaduomenų kalba';

  @override
  String get adminMetadataLanguageHint => 'pvz. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metaduomenų šalies kodas';

  @override
  String get adminMetadataCountryHint => 'pvz. JAV, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Keliai';

  @override
  String get adminLibraryTabOptions => 'Parinktys';

  @override
  String get adminLibraryTabDownloaders => 'Atsisiuntimo šaltiniai';

  @override
  String get adminLibMetadataSavers => 'Metaduomenų saugotojai';

  @override
  String get adminLibSubtitleDownloaders => 'Subtitrų atsisiuntimo šaltiniai';

  @override
  String get adminLibLyricDownloaders => 'Dainų tekstų atsisiuntimo šaltiniai';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metaduomenų atsisiuntimo šaltiniai: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Vaizdų šaltiniai: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Šis serveris nesiūlo atsisiuntimo šaltinių šio tipo bibliotekai.';

  @override
  String get adminLibrarySectionGeneral => 'Bendra';

  @override
  String get adminLibrarySectionMetadata => 'Metaduomenys';

  @override
  String get adminLibrarySectionEmbedded => 'Įterptoji informacija';

  @override
  String get adminLibrarySectionSubtitles => 'Subtitrai';

  @override
  String get adminLibrarySectionImages => 'Vaizdai';

  @override
  String get adminLibrarySectionSeries => 'Serialai';

  @override
  String get adminLibrarySectionMusic => 'Muzika';

  @override
  String get adminLibrarySectionMovies => 'Filmai';

  @override
  String get adminLibRealtimeMonitor => 'Įjungti stebėjimą realiuoju laiku';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Aptikti failų pakeitimus ir apdoroti juos automatiškai.';

  @override
  String get adminLibEnablePhotos => 'Rodyti nuotraukas';

  @override
  String get adminLibSaveLocalMetadata =>
      'Įrašyti viršelius į medijos aplankus';

  @override
  String get adminLibRefreshInterval => 'Automatinis metaduomenų atnaujinimas';

  @override
  String get adminLibRefreshNever => 'Niekada';

  @override
  String get adminLibDefault => 'Numatytasis';

  @override
  String get adminLibDisplayTitle => 'Rodymas';

  @override
  String get adminLibDisplaySection => 'Bibliotekos rodymas';

  @override
  String get adminLibFolderView =>
      'Rodyti aplankų rodinį su paprastais medijos aplankais';

  @override
  String get adminLibSpecialsInSeasons =>
      'Rodyti specialiąsias serijas tuose sezonuose, kuriuose jos buvo rodomos';

  @override
  String get adminLibGroupMovies => 'Grupuoti filmus į rinkinius';

  @override
  String get adminLibGroupShows => 'Grupuoti serialus į rinkinius';

  @override
  String get adminLibExternalSuggestions =>
      'Rodyti išorinį turinį pasiūlymuose';

  @override
  String get adminLibDateAddedSection => 'Pridėjimo datos veikimas';

  @override
  String get adminLibDateAddedLabel => 'Pridėjimo datą imti iš';

  @override
  String get adminLibDateAddedImport => 'Nuskaitymo į biblioteką data';

  @override
  String get adminLibDateAddedFile => 'Failo sukūrimo data';

  @override
  String get adminLibMetadataTitle => 'Metaduomenys ir vaizdai';

  @override
  String get adminLibMetadataLangSection => 'Pageidaujama metaduomenų kalba';

  @override
  String get adminLibChaptersSection => 'Skyriai';

  @override
  String get adminLibDummyChapterDuration =>
      'Fiktyvių skyrių trukmė (sekundėmis)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Skyrių, sugeneruotų medijai, kuri jų neturi, trukmė. Nustatykite 0, kad išjungtumėte.';

  @override
  String get adminLibChapterImageResolution => 'Skyrių vaizdų raiška';

  @override
  String get adminLibNfoTitle => 'NFO nustatymai';

  @override
  String get adminLibNfoHelp =>
      'NFO metaduomenys suderinami su Kodi ir panašiomis programomis. Nustatymai taikomi visoms bibliotekoms, kurios įrašo NFO metaduomenis.';

  @override
  String get adminLibKodiUser =>
      'Naudotojas, kurio žiūrėjimo duomenys bus įrašomi į NFO failus';

  @override
  String get adminLibSaveImagePaths => 'Įrašyti vaizdų kelius į NFO failus';

  @override
  String get adminLibPathSubstitution => 'Įjungti NFO vaizdų kelių pakeitimą';

  @override
  String get adminLibExtraThumbs =>
      'Kopijuoti extrafanart vaizdus į extrathumbs aplanką';

  @override
  String get adminLibNone => 'Nėra';

  @override
  String adminLibRefreshDays(int days) {
    return '$days d.';
  }

  @override
  String get adminLibEmbeddedTitles => 'Naudoti įterptuosius pavadinimus';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Naudoti įterptuosius priedų pavadinimus';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Naudoti įterptąją serijų informaciją';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Leisti įterptuosius subtitrus';

  @override
  String get adminLibEmbeddedAllowAll => 'Leisti visus';

  @override
  String get adminLibEmbeddedAllowText => 'Tik tekstinius';

  @override
  String get adminLibEmbeddedAllowImage => 'Tik vaizdinius';

  @override
  String get adminLibEmbeddedAllowNone => 'Nėra';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Praleisti atsisiuntimą, jei yra įterptųjų subtitrų';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Praleisti atsisiuntimą, jei garso takelio kalba sutampa su atsisiuntimo kalba';

  @override
  String get adminLibRequirePerfectMatch =>
      'Reikalauti tikslaus subtitrų atitikmens';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Įrašyti subtitrus į medijos aplankus';

  @override
  String get adminLibChapterImageExtraction => 'Išgauti skyrių vaizdus';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Išgauti skyrių vaizdus nuskaitant biblioteką';

  @override
  String get adminLibTrickplayExtraction => 'Įjungti Trickplay vaizdų išgavimą';

  @override
  String get adminLibTrickplayDuringScan =>
      'Išgauti Trickplay vaizdus nuskaitant biblioteką';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Įrašyti Trickplay vaizdus į medijos aplankus';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automatiškai sujungti serialus, išsklaidytus keliuose aplankuose';

  @override
  String get adminLibSeasonZeroName => 'Nulinio sezono rodomas pavadinimas';

  @override
  String get adminLibLufsScan => 'Įjungti LUFS nuskaitymą garsui normalizuoti';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Teikti pirmenybę nestandartinei atlikėjų žymai';

  @override
  String get adminLibAutoAddToCollection =>
      'Automatiškai pridėti filmus į rinkinius';

  @override
  String get adminLibraryNameRequired => 'Būtinas bibliotekos pavadinimas';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Nepavyko sukurti bibliotekos: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotekos pavadinimas';

  @override
  String get adminSelectedPaths => 'Pasirinkti keliai:';

  @override
  String get adminCreateLibrary => 'Sukurti biblioteką';

  @override
  String get paths => 'Keliai:';

  @override
  String get adminDisableUser => 'Išjungti vartotoją';

  @override
  String get adminEnableUser => 'Įgalinti vartotoją';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Išjungti $name? Jie negalės prisijungti.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Įgalinti $name? Jie vėl galės prisijungti.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Naudotojas „$name“ išjungtas';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Vartotojas „$name“ įjungtas';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Nepavyko atnaujinti naudotojo politikos: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Nepavyko įkelti naudotojų';

  @override
  String get adminSearchUsers => 'Ieškoti vartotojų';

  @override
  String get adminEditUser => 'Redaguoti vartotoją';

  @override
  String get adminAddUser => 'Pridėti naudotoją';

  @override
  String adminUserCreateFailed(String error) {
    return 'Nepavyko sukurti vartotojo: $error';
  }

  @override
  String get adminCreateUser => 'Sukurti vartotoją';

  @override
  String get adminPasswordOptional => 'Slaptažodis (neprivaloma)';

  @override
  String get adminUsernameRequired =>
      'Vartotojo vardo laukas negali būti tuščias';

  @override
  String adminSaveFailed(String error) {
    return 'Nepavyko išsaugoti: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Slaptažodžiai nesutampa';

  @override
  String adminFailed(String error) {
    return 'Nepavyko: $error';
  }

  @override
  String get adminUserLoadFailed => 'Nepavyko įkelti vartotojo';

  @override
  String get adminDeleteUser => 'Ištrinti vartotoją';

  @override
  String get admin => 'Administravimas';

  @override
  String get adminFullAccessWarning =>
      'Administratoriai turi visišką prieigą prie serverio. Suteikite atsargiai.';

  @override
  String get administrator => 'Administratorius';

  @override
  String get adminHiddenUser => 'Paslėptas vartotojas';

  @override
  String get adminAllowMediaPlayback => 'Leisti medijos atkūrimą';

  @override
  String get adminAllowAudioTranscoding => 'Leisti garso perkodavimą';

  @override
  String get adminAllowVideoTranscoding => 'Leisti vaizdo įrašo perkodavimą';

  @override
  String get adminAllowRemuxing => 'Leiskite maišyti';

  @override
  String get adminForceRemoteTranscoding =>
      'Priverstinis nuotolinio šaltinio perkodavimas';

  @override
  String get adminAllowContentDownloading => 'Leisti atsisiųsti turinį';

  @override
  String get adminAllowPublicSharing => 'Leisti viešai bendrinti';

  @override
  String get adminAllowRemoteControl =>
      'Leisti nuotoliniu būdu valdyti kitus vartotojus';

  @override
  String get adminAllowSharedDeviceControl =>
      'Leisti bendrinamą įrenginio valdymą';

  @override
  String get adminAllowRemoteAccess => 'Leisti nuotolinę prieigą';

  @override
  String get adminLeaveEmptyNoLimit => 'Palikite tuščią be jokių apribojimų';

  @override
  String get adminMaxActiveSessions => 'Maksimalus aktyvių seansų skaičius';

  @override
  String get adminAllowLiveTvAccess => 'Leisti tiesioginę TV prieigą';

  @override
  String get adminAllowLiveTvManagement =>
      'Leisti tiesioginės televizijos tvarkymą';

  @override
  String get adminAllowCollectionManagement => 'Leisti tvarkyti rinkinį';

  @override
  String get adminAllowSubtitleManagement => 'Leisti tvarkyti subtitrus';

  @override
  String get adminAllowLyricManagement => 'Leisti tvarkyti dainų tekstą';

  @override
  String get adminEnableAllLibraryAccess =>
      'Įgalinti prieigą prie visų bibliotekų';

  @override
  String get adminChangePassword => 'Keisti slaptažodį';

  @override
  String get adminNewPassword => 'Naujas slaptažodis';

  @override
  String get adminConfirmPassword => 'Patvirtinkite slaptažodį';

  @override
  String get adminSetPassword => 'Nustatyti slaptažodį';

  @override
  String get adminResetPassword => 'Iš naujo nustatyti slaptažodį';

  @override
  String get adminPasswordReset => 'Slaptažodžio nustatymas iš naujo';

  @override
  String get adminPasswordUpdated => 'Slaptažodis atnaujintas';

  @override
  String get adminUserSettings => 'Vartotojo nustatymai';

  @override
  String get adminLibraryAccess => 'Prieiga prie bibliotekos';

  @override
  String get adminEnableAllDevices => 'Įgalinkite prieigą prie visų įrenginių';

  @override
  String get adminEnableAllChannels => 'Įgalinti prieigą prie visų kanalų';

  @override
  String get adminParentalControl => 'Tėvų kontrolė';

  @override
  String get adminMaxParentalRating => 'Didžiausias leidžiamas amžiaus cenzas';

  @override
  String get adminMaxParentalRatingHint =>
      'Aukštesnio cenzo turinys šiam naudotojui bus paslėptas.';

  @override
  String get adminParentalRatingNone => 'Nėra';

  @override
  String get adminBlockUnratedItems =>
      'Blokuoti elementus be cenzo informacijos arba su neatpažinta informacija';

  @override
  String get adminUnratedBook => 'Knygos';

  @override
  String get adminUnratedChannelContent => 'Kanalai';

  @override
  String get adminUnratedLiveTvChannel => 'Tiesioginė TV';

  @override
  String get adminUnratedMovie => 'Filmai';

  @override
  String get adminUnratedMusic => 'Muzika';

  @override
  String get adminUnratedTrailer => 'Anonsai';

  @override
  String get adminUnratedSeries => 'Serialai';

  @override
  String get adminAccessSchedules => 'Prieigos tvarkaraščiai';

  @override
  String get adminAccessSchedulesHint =>
      'Leisti prieigą tik toliau nurodytu tvarkaraščio laiku. Kai tvarkaraštis nenustatytas, prieiga leidžiama visą parą.';

  @override
  String get adminAddSchedule => 'Pridėti tvarkaraštį';

  @override
  String get adminScheduleDay => 'Diena';

  @override
  String get adminScheduleStart => 'Pradžia';

  @override
  String get adminScheduleEnd => 'Pabaiga';

  @override
  String get adminDayEveryday => 'Kasdien';

  @override
  String get adminDayWeekday => 'Darbo diena';

  @override
  String get adminDayWeekend => 'Savaitgalis';

  @override
  String get adminDaySunday => 'Sekmadienis';

  @override
  String get adminDayMonday => 'Pirmadienis';

  @override
  String get adminDayTuesday => 'Antradienis';

  @override
  String get adminDayWednesday => 'Trečiadienis';

  @override
  String get adminDayThursday => 'Ketvirtadienis';

  @override
  String get adminDayFriday => 'Penktadienis';

  @override
  String get adminDaySaturday => 'Šeštadienis';

  @override
  String get adminAllowedTags => 'Leidžiamos žymos';

  @override
  String get adminAllowedTagsHint =>
      'Rodomas tik turinys su šiomis žymomis. Palikite tuščią, kad būtų leidžiama viskas.';

  @override
  String get adminBlockedTags => 'Blokuojamos žymos';

  @override
  String get adminBlockedTagsHint =>
      'Turinys su šiomis žymomis šiam naudotojui bus paslėptas.';

  @override
  String get adminAddTag => 'Pridėti žymą';

  @override
  String get adminAuthProvider => 'Tapatybės nustatymo tiekėjas';

  @override
  String get adminPasswordResetProvider => 'Slaptažodžio atkūrimo tiekėjas';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Didžiausias nepavykusių prisijungimų skaičius iki užrakinimo';

  @override
  String get adminLoginAttemptsHint =>
      'Nustatykite 0 numatytajai reikšmei arba -1, kad išjungtumėte užrakinimą.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay prieiga';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Leisti kurti grupes ir prie jų prisijungti';

  @override
  String get adminSyncPlayJoin => 'Leisti prisijungti prie grupių';

  @override
  String get adminSyncPlayNone => 'Prieigos nėra';

  @override
  String get adminContentDeletionFolders => 'Leisti trinti turinį iš';

  @override
  String get adminResetPasswordWarning =>
      'Tai pašalins slaptažodį. Vartotojas galės prisijungti be slaptažodžio.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Serveris grąžino HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Ar tikrai norite ištrinti $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Naudotojas „$name“ ištrintas';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Nepavyko ištrinti vartotojo: $error';
  }

  @override
  String get adminCreateApiKey => 'Sukurkite API raktą';

  @override
  String get adminAppName => 'Programos pavadinimas';

  @override
  String get adminApiKeyCreated => 'API raktas sukurtas';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Raktas sėkmingai sukurtas. Serveris žetono negrąžino. Patikrinkite serverio API raktus.';

  @override
  String get adminKeyCopied => 'Raktas nukopijuotas į mainų sritį';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Nepavyko sukurti rakto: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Serverio atsakyme trūksta rakto prieigos rakto';

  @override
  String get adminRevokeApiKey => 'Atšaukti API raktą';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Atšaukti $name raktą?';
  }

  @override
  String get adminApiKeyRevoked => 'API raktas atšauktas';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nepavyko atšaukti rakto: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Nepavyko įkelti API raktų';

  @override
  String get adminApiKeysTitle => 'API raktai';

  @override
  String get adminCreateKey => 'Sukurti raktą';

  @override
  String get adminNoApiKeys => 'API raktų nerasta';

  @override
  String get adminUnknownApp => 'Nežinoma programa';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Žetonas: $token\\nSukurta: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Kurti atsarginę kopiją';

  @override
  String get adminBackupDatabase => 'Duomenų bazė';

  @override
  String get adminBackupDatabaseAlways => 'Įtraukiama visada';

  @override
  String get adminBackupMetadata => 'Metaduomenys';

  @override
  String get adminBackupSubtitles => 'Subtitrai';

  @override
  String get adminBackupTrickplay => 'Trickplay vaizdai';

  @override
  String get adminCreatingBackup => 'Kuriama atsarginė kopija...';

  @override
  String get adminBackupCreated => 'Atsarginė kopija sukurta sėkmingai';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Nepavyko sukurti atsarginės kopijos: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Serverio atsakyme trūksta atsarginio kelio';

  @override
  String adminBackupManifest(String name) {
    return 'Manifestas: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Nepavyko įkelti aprašo: $error';
  }

  @override
  String get adminConfirmRestore => 'Patvirtinkite atkūrimą';

  @override
  String get adminRestoringBackup => 'Atkuriama atsarginė kopija...';

  @override
  String adminRestoreFailed(String error) {
    return 'Nepavyko atkurti atsarginės kopijos: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Nepavyko įkelti atsarginių kopijų';

  @override
  String get adminCreateBackup => 'Sukurti atsarginę kopiją';

  @override
  String get adminNoBackups => 'Atsarginių kopijų nerasta';

  @override
  String get adminViewDetails => 'Peržiūrėti išsamią informaciją';

  @override
  String get restore => 'Atkurti';

  @override
  String get adminLogsLoadFailed => 'Nepavyko įkelti serverio žurnalų';

  @override
  String get adminNoLogFiles => 'Žurnalo failų nerasta';

  @override
  String get adminLogCopied => 'Žurnalas nukopijuotas į mainų sritį';

  @override
  String get adminSaveLogFile => 'Išsaugoti žurnalo failą';

  @override
  String adminSavedTo(String path) {
    return 'Išsaugota $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Nepavyko išsaugoti failo: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Nepavyko įkelti $fileName';
  }

  @override
  String get adminSearchInLog => 'Ieškoti žurnale';

  @override
  String get adminNoMatchingLines => 'Nėra atitinkančių eilučių';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Nepavyko įkelti užduočių: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Suplanuotų užduočių nerasta';

  @override
  String get adminNoTasksMatchFilter =>
      'Nėra užduočių, atitinkančių dabartinį filtrą';

  @override
  String adminTaskStartFailed(String error) {
    return 'Nepavyko pradėti užduoties: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Nepavyko sustabdyti užduoties: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Nepavyko įkelti užduoties: $error';
  }

  @override
  String get adminRunNow => 'Paleisti dabar';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Nepavyko pašalinti aktyviklio: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Nepavyko pridėti aktyviklio: $error';
  }

  @override
  String get adminLastExecution => 'Paskutinis vykdymas';

  @override
  String get adminTriggers => 'Trigeriai';

  @override
  String get adminAddTrigger => 'Pridėti trigerį';

  @override
  String get adminNoTriggers => 'Nėra sukonfigūruotų aktyviklių';

  @override
  String get adminTriggerType => 'Trigerio tipas';

  @override
  String get adminNoLimit => 'Nėra limito';

  @override
  String adminHours(String hours) {
    return '$hours valanda(s)';
  }

  @override
  String get adminDayOfWeek => 'Savaitės diena';

  @override
  String get adminSearchPlugins => 'Ieškoti papildinių...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Nepavyko perjungti papildinio: $error';
  }

  @override
  String get adminUninstallPlugin => 'Pašalinkite papildinį';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Ar tikrai norite pašalinti „$name“?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Nepavyko pašalinti papildinio: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Nepavyko įdiegti paketo: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Nepavyko įdiegti naujinimo: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Nepavyko įkelti papildinių: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Nėra jūsų paiešką atitinkančių papildinių';

  @override
  String get adminNoPluginsInstalled => 'Įskiepių nėra įdiegta';

  @override
  String adminInstallUpdate(String version) {
    return 'Įdiekite naujinimą (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Nepavyko įkelti katalogo: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Nėra jūsų paiešką atitinkančių paketų';

  @override
  String get adminNoPackagesAvailable => 'Nėra jokių paketų';

  @override
  String get adminExperimentalIntegration => 'Eksperimentinė integracija';

  @override
  String get adminExperimentalWarning =>
      'Papildinių nustatymų integravimas vis dar yra eksperimentinis. Kai kurie nustatymų puslapiai gali būti rodomi netinkamai.';

  @override
  String get continueAction => 'Tęsti';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '„$name“ bus pašalintas paleidus serverį iš naujo';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Nepavyko pašalinti: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '„$name“ atnaujinama į v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Nepavyko įkelti papildinio: $error';
  }

  @override
  String get adminPluginNotFound => 'Papildinys nerastas';

  @override
  String adminPluginVersion(String version) {
    return 'Versija $version';
  }

  @override
  String get adminEnablePlugin => 'Įjungti papildinį';

  @override
  String get adminPluginSettingsPage => 'Papildinio nustatymų puslapis';

  @override
  String get adminRevisionHistory => 'Revizijos istorija';

  @override
  String get adminNoChangelog => 'Nėra pakeitimų žurnalo.';

  @override
  String get adminRemoveRepository => 'Pašalinti saugyklą';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Ar tikrai norite pašalinti „$name“?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Nepavyko išsaugoti saugyklų: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Nepavyko įkelti saugyklų: $error';
  }

  @override
  String get adminRepositoryNameHint => 'pvz. Jellyfin stabilus';

  @override
  String get adminRepositoryUrl => 'Saugyklos URL';

  @override
  String get adminAddEntry => 'Pridėti įrašą';

  @override
  String get adminInvalidUrl => 'Netinkamas URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Nepavyko įkelti papildinio nustatymų: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nepavyko atidaryti $uri';
  }

  @override
  String get adminOpenInBrowser => 'Atidaryti naršyklėje';

  @override
  String get adminOpenExternally => 'Atidaryti išoriškai';

  @override
  String get adminGeneralSettings => 'Bendrieji nustatymai';

  @override
  String get adminServerName => 'Serverio pavadinimas';

  @override
  String get adminPreferredMetadataCountry => 'Pageidaujama metaduomenų šalis';

  @override
  String get adminCachePath => 'Talpyklos kelias';

  @override
  String get adminMetadataPath => 'Metaduomenų kelias';

  @override
  String get adminLibraryScanConcurrency =>
      'Bibliotekos nuskaitymas vienu metu';

  @override
  String get adminParallelImageEncodingLimit =>
      'Lygiagrečios vaizdo kodavimo riba';

  @override
  String get adminSlowResponseThreshold => 'Lėto atsako slenkstis (ms)';

  @override
  String get adminBrandingLoadFailed =>
      'Nepavyko įkelti prekės ženklo nustatymų';

  @override
  String get adminLoginDisclaimer => 'Prisijungimo atsisakymas';

  @override
  String get adminLoginDisclaimerHint => 'HTML rodomas po prisijungimo forma';

  @override
  String get adminCustomCss => 'Tinkintas CSS';

  @override
  String get adminCustomCssHint =>
      'Tinkintas CSS, pritaikytas žiniatinklio sąsajai';

  @override
  String get adminEnableSplashScreen => 'Įgalinti prisilietimo ekraną';

  @override
  String get adminStreamingLoadFailed =>
      'Nepavyko įkelti srautinio perdavimo nustatymų';

  @override
  String get adminStreamingDescription =>
      'Nustatykite visuotinius nuotolinio ryšio srautinio perdavimo pralaidumo apribojimus.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Nuotolinio kliento pralaidumo riba (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Palikite tuščią arba 0 neribotam';

  @override
  String get adminPlaybackLoadFailed => 'Nepavyko įkelti atkūrimo nustatymų';

  @override
  String get adminHardwareAcceleration => 'Aparatinis pagreitis';

  @override
  String get adminVaapiDevice => 'VA-API įrenginys';

  @override
  String get adminEnableHardwareEncoding =>
      'Įgalinti aparatinės įrangos kodavimą';

  @override
  String get adminEnableHardwareDecoding =>
      'Įgalinti aparatinės įrangos dekodavimą:';

  @override
  String get adminEncodingThreads => 'Kodavimo gijos';

  @override
  String get adminAutomatic => '0 = automatinis';

  @override
  String get adminTranscodingTempPath => 'Perkodavimo temp kelias';

  @override
  String get adminEnableFallbackFont => 'Įgalinti atsarginį šriftą';

  @override
  String get adminFallbackFontPath => 'Atsarginis šrifto kelias';

  @override
  String get adminAllowSegmentDeletion => 'Leisti ištrinti segmentą';

  @override
  String get adminSegmentKeepSeconds => 'Segmento išlaikymas (sekundėmis)';

  @override
  String get adminThrottleBuffering => 'Droselio buferis';

  @override
  String get adminTrickplayLoadFailed => 'Nepavyko įkelti Trickplay nustatymų';

  @override
  String get adminEnableHardwareAcceleration =>
      'Įgalinti aparatinės įrangos pagreitį';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Įgalinti tik rakto rėmelio ištraukimą';

  @override
  String get adminKeyFrameSubtitle => 'Greitesnis, bet mažesnis tikslumas';

  @override
  String get adminScanBehavior => 'Nuskaitymo elgsena';

  @override
  String get adminProcessPriority => 'Proceso prioritetas';

  @override
  String get adminImageSettings => 'Vaizdo nustatymai';

  @override
  String get adminIntervalMs => 'Intervalas (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Kaip dažnai fiksuoti kadrus';

  @override
  String get adminWidthResolutions => 'Pločio raiškos';

  @override
  String get adminTileWidth => 'Plytelių plotis';

  @override
  String get adminTileHeight => 'Plytelių aukštis';

  @override
  String get adminQualitySubtitle =>
      'Mažesnės reikšmės = geresnė kokybė, didesni failai';

  @override
  String get adminProcessThreads => 'Apdoroti gijas';

  @override
  String get adminResumeLoadFailed => 'Nepavyko įkelti atnaujinimo nustatymų';

  @override
  String get adminResumeDescription =>
      'Konfigūruokite, kada turinys turėtų būti pažymėtas kaip iš dalies arba visiškai paleistas.';

  @override
  String get adminMinResumePercentage => 'Minimalus atnaujinimo procentas';

  @override
  String get adminMinResumeSubtitle =>
      'Turinys turi būti paleistas ilgiau nei šis procentas, kad būtų išsaugota pažanga';

  @override
  String get adminMaxResumePercentage => 'Maksimalus atnaujinimo procentas';

  @override
  String get adminMaxResumeSubtitle =>
      'Turinys laikomas visiškai paleistas po šio procento';

  @override
  String get adminMinResumeDuration =>
      'Minimali gyvenimo aprašymo trukmė (sekundėmis)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Prekės, trumpesnės nei ši, nėra atnaujinamos';

  @override
  String get adminMinAudiobookResume =>
      'Minimalus garso knygos atnaujinimo procentas';

  @override
  String get adminMaxAudiobookResume =>
      'Didžiausias garso knygos atnaujinimo procentas';

  @override
  String get adminNetworkingLoadFailed => 'Nepavyko įkelti tinklo nustatymų';

  @override
  String get adminNetworkingWarning =>
      'Dėl tinklo nustatymų pakeitimų gali tekti iš naujo paleisti serverį.';

  @override
  String get adminEnableRemoteAccess => 'Įgalinti nuotolinę prieigą';

  @override
  String get ports => 'Uostai';

  @override
  String get adminHttpPort => 'HTTP prievadas';

  @override
  String get adminHttpsPort => 'HTTPS prievadas';

  @override
  String get adminPublicHttpsPort => 'Viešas HTTPS prievadas';

  @override
  String get adminBaseUrl => 'Bazinis URL';

  @override
  String get adminBaseUrlHint => 'pvz. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Įgalinti HTTPS';

  @override
  String get adminLocalNetwork => 'Vietinis tinklas';

  @override
  String get adminLocalNetworkAddresses => 'Vietinio tinklo adresai';

  @override
  String get adminKnownProxies => 'Žinomi įgaliotieji serveriai';

  @override
  String get adminRemoteIpFilter => 'Nuotolinis IP filtras';

  @override
  String get adminRemoteIpFilterEntries => 'Nuotolinis IP filtras';

  @override
  String get adminCertificatePath => 'Sertifikato kelias';

  @override
  String get whitelist => 'Baltasis sąrašas';

  @override
  String get blacklist => 'Juodasis sąrašas';

  @override
  String get notSet => 'Nenustatyta';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Nepavyko įkelti metaduomenų: $error';
  }

  @override
  String get adminRefreshMetadata => 'Atnaujinkite metaduomenis';

  @override
  String get recursive => 'Rekursyvus';

  @override
  String get adminReplaceAllMetadata => 'Pakeiskite visus metaduomenis';

  @override
  String get adminMetadataRefreshRequested =>
      'Pateikta metaduomenų atnaujinimo užklausa';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Nepavyko atnaujinti metaduomenų: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Nuotolinių atitikmenų nerasta';

  @override
  String get adminRemoteResults => 'Nuotoliniai rezultatai';

  @override
  String get adminRemoteMetadataApplied => 'Taikyti nuotoliniai metaduomenys';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Nuotolinė paieška nepavyko: $error';
  }

  @override
  String get adminUpdateContentType => 'Atnaujinti turinio tipą';

  @override
  String get adminContentType => 'Turinio tipas';

  @override
  String get adminContentTypeUpdated => 'Turinio tipas atnaujintas';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nepavyko atnaujinti turinio tipo: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nepavyko įkelti metaduomenų rengyklės';

  @override
  String get adminNoPeopleEntries => 'Nėra žmonių įrašų';

  @override
  String get adminNoExternalIds => 'Nėra išorinių ID';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType vaizdas atnaujintas';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Nepavyko atsisiųsti vaizdo: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nepalaikomas vaizdo formatas';

  @override
  String get adminImageReadFailed => 'Nepavyko nuskaityti pasirinkto vaizdo';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType vaizdas įkeltas';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Nepavyko įkelti vaizdo: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Ištrinti $imageType vaizdą';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType vaizdas ištrintas';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Nepavyko ištrinti vaizdo: $error';
  }

  @override
  String get adminAllProviders => 'Visi tiekėjai';

  @override
  String get adminNoRemoteImages => 'Nuotolinių vaizdų nerasta';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Derintuvo aptikimas nepavyko: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U imtuvas';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Failas arba URL';

  @override
  String get adminTunerIpAddress => 'Imtuvo IP adresas';

  @override
  String get adminTunerFriendlyName => 'Patogus pavadinimas';

  @override
  String get adminTunerUserAgent => 'Naudotojo agentas';

  @override
  String get adminTunerCount => 'Vienalaikių ryšių limitas';

  @override
  String get adminTunerCountHelp =>
      'Didžiausias srautų skaičius, kurį imtuvas leidžia vienu metu. Nustatykite 0, kad būtų neribota.';

  @override
  String get adminTunerFallbackBitrate =>
      'Atsarginė didžiausia transliavimo bitų sparta';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Importuoti tik mėgstamiausius kanalus';

  @override
  String get adminTunerAllowHwTranscoding => 'Leisti aparatinį perkodavimą';

  @override
  String get adminTunerAllowFmp4 => 'Leisti fMP4 perkodavimo konteinerį';

  @override
  String get adminTunerAllowStreamSharing => 'Leisti bendrinti srautą';

  @override
  String get adminTunerEnableStreamLooping => 'Įjungti srauto kartojimą';

  @override
  String get adminTunerIgnoreDts => 'Nepaisyti DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Skaityti įvestį natūraliu kadrų dažniu';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Failas arba URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmų prefiksas';

  @override
  String get adminXmltvMovieCategories => 'Filmų kategorijos';

  @override
  String get adminXmltvCategoriesHelp =>
      'Kelias kategorijas atskirkite vertikaliu brūkšniu.';

  @override
  String get adminXmltvKidsCategories => 'Vaikų kategorijos';

  @override
  String get adminXmltvNewsCategories => 'Naujienų kategorijos';

  @override
  String get adminXmltvSportsCategories => 'Sporto kategorijos';

  @override
  String get adminSdUsername => 'Naudotojo vardas';

  @override
  String get adminSdPassword => 'Slaptažodis';

  @override
  String get adminSdCountry => 'Šalis';

  @override
  String get adminSdCountrySelect => 'Pasirinkite šalį';

  @override
  String get adminSdPostalCode => 'Pašto kodas';

  @override
  String get adminEnableAllTuners => 'Įjungti visus imtuvus';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Nepavyko pašalinti imtuvo: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Nepavyko pašalinti teikėjo: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Serijos įrašymo kelias';

  @override
  String get adminMovieRecordingPath => 'Filmų įrašymo kelias';

  @override
  String get adminGuideDaysAuto => 'Automatiškai';

  @override
  String get adminRecordingPostProcessor =>
      'Papildomo apdorojimo programos kelias';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Papildomo apdorojimo argumentai';

  @override
  String get adminSaveRecordingNfo => 'Įrašyti įrašų NFO metaduomenis';

  @override
  String get adminSaveRecordingImages => 'Įrašyti įrašų vaizdus';

  @override
  String get adminLiveTvSectionPaths => 'Įrašymo keliai';

  @override
  String get adminLiveTvSectionPostProcessing => 'Papildomas apdorojimas';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nepavyko išsaugoti nustatymų: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nepavyko įkelti tiesioginės TV administravimo';

  @override
  String get adminTunerDevices => 'Tuner įrenginiai';

  @override
  String get adminNoTunerHosts => 'Nekonfigūruota derintuvo priegloba';

  @override
  String get adminGuideProviders => 'Vadovų teikėjai';

  @override
  String get adminGuideRefreshStarted => 'Pradėtas gido duomenų atnaujinimas';

  @override
  String get adminGuideRefreshUnavailable =>
      'Gido atnaujinimo užduotis šiame serveryje nepasiekiama.';

  @override
  String get adminNoListingProviders => 'Nėra sukonfigūruotų sąrašų teikėjų';

  @override
  String get adminSettingsSaved => 'Nustatymai išsaugoti';

  @override
  String get adminBackupsNotAvailable =>
      'Šioje serverio versijoje atsarginės kopijos nepasiekiamos.';

  @override
  String get adminRestoreWarning1 =>
      'Atkūrus VISUS esamus serverio duomenis pakeis atsarginės kopijos duomenys.';

  @override
  String get adminRestoreWarning2 =>
      'Esami serverio nustatymai, vartotojai ir bibliotekos duomenys bus perrašyti.';

  @override
  String get adminRestoreWarning3 =>
      'Po atkūrimo serveris bus paleistas iš naujo.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Atkurti atsarginę kopiją $name dabar?';
  }

  @override
  String get adminBackupsTitle => 'Atsarginės kopijos';

  @override
  String get adminUnknownDate => 'Nežinoma data';

  @override
  String get adminUnnamedBackup => 'Nepavadinta atsarginė kopija';

  @override
  String get adminApply => 'Taikyti';

  @override
  String get adminLogsTitle => 'Serverio žurnalai';

  @override
  String get adminLogsNewestFirst => 'Naujausi pirmiausia';

  @override
  String get adminLogsOldestFirst => 'Seniausi Pirma';

  @override
  String get adminLogsJustNow => 'Tik dabar';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes@min';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours@h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d prieš';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Nepavyko įkelti $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count atitinka';
  }

  @override
  String get adminLogViewerNoMatches => 'Nėra atitinkančių eilučių';

  @override
  String get adminMetadataEditorTitle => 'Metaduomenų redaktorius';

  @override
  String get adminMetadataIdentify => 'Identifikuoti';

  @override
  String get adminMetadataType => 'Tipas';

  @override
  String get adminMetadataDetails => 'Detalės';

  @override
  String get adminMetadataExternalIds => 'Išoriniai ID';

  @override
  String get adminMetadataImages => 'Vaizdai';

  @override
  String get adminMetadataFieldTitle => 'Pavadinimas';

  @override
  String get adminMetadataFieldSortTitle => 'Rūšiuoti pavadinimą';

  @override
  String get adminMetadataFieldOriginalTitle => 'Originalus pavadinimas';

  @override
  String get adminMetadataFieldPremiereDate => 'Premjeros data (MMMM-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Pabaigos data (MMMM-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Gamybos metai';

  @override
  String get adminMetadataFieldOfficialRating => 'Oficialus įvertinimas';

  @override
  String get adminMetadataFieldCommunityRating => 'Bendrijos reitingas';

  @override
  String get adminMetadataFieldCriticRating => 'Kritikų įvertinimas';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Žymės eilutė';

  @override
  String get adminMetadataFieldOverview => 'Apžvalga';

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
  String get adminMetadataGenres => 'Žanrai';

  @override
  String get adminMetadataTags => 'Žymos';

  @override
  String get adminMetadataStudios => 'Studijos';

  @override
  String get adminMetadataPeople => 'Žmonės';

  @override
  String get adminMetadataAddGenre => 'Pridėti žanrą';

  @override
  String get adminMetadataAddTag => 'Pridėti žymą';

  @override
  String get adminMetadataAddStudio => 'Pridėti studiją';

  @override
  String get adminMetadataAddPerson => 'Pridėti asmenį';

  @override
  String get adminMetadataEditPerson => 'Redaguoti asmenį';

  @override
  String get adminMetadataRole => 'Vaidmuo';

  @override
  String get adminMetadataImagePrimary => 'Pirminis';

  @override
  String get adminMetadataImageBackdrop => 'Fonas';

  @override
  String get adminMetadataImageLogo => 'Logotipas';

  @override
  String get adminMetadataImageBanner => 'Reklamjuostė';

  @override
  String get adminMetadataImageThumb => 'Nykštys';

  @override
  String get adminMetadataProvider => 'Teikėjas';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType vaizdas atnaujintas';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType vaizdas įkeltas';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType vaizdas ištrintas';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Nepavyko atsisiųsti vaizdo: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Nepavyko nuskaityti pasirinkto vaizdo';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Nepavyko įkelti vaizdo: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Ištrinti $imageType vaizdą';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Taip iš elemento pašalinamas dabartinis vaizdas.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nepavyko ištrinti vaizdo: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Pasirinkite $imageType vaizdą';
  }

  @override
  String get adminMetadataUpload => 'Įkelti';

  @override
  String get adminMetadataUpdate => 'Atnaujinti';

  @override
  String get adminMetadataRemoteImage => 'Nuotolinis vaizdas';

  @override
  String get adminPluginsInstalled => 'Įdiegta';

  @override
  String get adminPluginsCatalog => 'Katalogas';

  @override
  String get adminPluginsActive => 'Aktyvus';

  @override
  String get adminPluginsRestart => 'Paleisti iš naujo';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Nėra jūsų paiešką atitinkančių papildinių';

  @override
  String get adminPluginsNoneInstalled => 'Įskiepių nėra įdiegta';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Galimas atnaujinimas: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Galimas atnaujinimas';

  @override
  String get adminPluginsPendingRemoval =>
      'Laukiama pašalinimo po paleidimo iš naujo';

  @override
  String get adminPluginsChangesPending => 'Pakeitimai laukia iš naujo';

  @override
  String get adminPluginsEnable => 'Įgalinti';

  @override
  String get adminPluginsDisable => 'Išjungti';

  @override
  String get adminPluginsInstallUpdate => 'Įdiekite naujinimą';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Įdiekite naujinimą (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nėra jūsų paiešką atitinkančių paketų';

  @override
  String get adminPluginsCatalogEmpty => 'Nėra jokių paketų';

  @override
  String adminPluginsInstalling(String name) {
    return '„$name“ diegiamas...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentinė integracija';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Papildinių nustatymų integravimas vis dar yra eksperimentinis. Kai kurie laukai arba maketai dar gali būti netinkamai pateikti.';

  @override
  String get adminPluginDetailToggle404 =>
      'Nepavyko perjungti papildinio. Serveriui nepavyko rasti šios papildinio versijos. Pabandykite atnaujinti papildinius, tada bandykite dar kartą.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Nepavyko perjungti papildinio. Norėdami gauti daugiau informacijos, patikrinkite serverio žurnalus.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Nustatymai';
  }

  @override
  String get adminPluginDetailDetails => 'Detalės';

  @override
  String get adminPluginDetailDeveloper => 'Kūrėjas';

  @override
  String get adminPluginDetailRepository => 'Saugykla';

  @override
  String get adminPluginDetailBundled => 'Supakuota';

  @override
  String get adminPluginDetailEnablePlugin => 'Įjungti papildinį';

  @override
  String get adminPluginDetailRestartRequired =>
      'Kad pakeitimai įsigaliotų, reikia iš naujo paleisti serverį.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Šis papildinys bus pašalintas iš naujo paleidus serverį.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Šis papildinys sugedo ir gali neveikti tinkamai.';

  @override
  String get adminPluginDetailNotSupported =>
      'Dabartinė serverio versija šio papildinio nepalaiko.';

  @override
  String get adminPluginDetailSuperseded =>
      'Šis papildinys buvo pakeistas naujesne versija.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Nepavyko įkelti saugyklų: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Pašalinti saugyklą';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Ar tikrai norite pašalinti „$name“?';
  }

  @override
  String get adminReposRemove => 'Pašalinti';

  @override
  String adminReposSaveFailed(String error) {
    return 'Nepavyko išsaugoti saugyklų: $error';
  }

  @override
  String get adminReposEmpty => 'Nėra sukonfigūruotų saugyklų';

  @override
  String get adminReposEmptySubtitle =>
      'Pridėkite saugyklą, kad galėtumėte naršyti galimus papildinius';

  @override
  String get adminReposUnnamed => '(be vardo)';

  @override
  String get adminReposEditTitle => 'Redaguoti saugyklą';

  @override
  String get adminReposAddTitle => 'Pridėti saugyklą';

  @override
  String get adminReposUrl => 'Saugyklos URL';

  @override
  String get adminReposNameHint => 'pvz. Jellyfin stabilus';

  @override
  String get adminPluginSettingsInvalidUrl => 'Netinkamas URL';

  @override
  String get adminGeneralSettingsTitle => 'Bendrieji nustatymai';

  @override
  String get adminGeneralMetadataLanguage => 'Pageidautina metaduomenų kalba';

  @override
  String get adminGeneralMetadataLanguageHint => 'pvz. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Pageidaujama metaduomenų šalis';

  @override
  String get adminGeneralMetadataCountryHint => 'pvz. JAV, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Bibliotekos nuskaitymas vienu metu';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Lygiagrečios vaizdo kodavimo riba';

  @override
  String get adminUnknownError => 'Nežinoma klaida';

  @override
  String get adminBrowse => 'Naršyti';

  @override
  String get adminCloseBrowser => 'Uždaryti naršyklę';

  @override
  String get adminNetworkingTitle => 'Tinklo kūrimas';

  @override
  String get adminNetworkingRestartWarning =>
      'Dėl tinklo nustatymų pakeitimų gali tekti iš naujo paleisti serverį.';

  @override
  String get adminNetworkingEnableHttps => 'Įgalinti HTTPS';

  @override
  String get adminNetworkingAddressHint => 'pvz. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Žinomi įgaliotieji serveriai';

  @override
  String get adminNetworkingProxyHint => 'pvz. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Baltasis sąrašas';

  @override
  String get adminNetworkingBlacklist => 'Juodasis sąrašas';

  @override
  String get adminNetworkingAddEntry => 'Pridėti įrašą';

  @override
  String get adminBrandingTitle => 'Prekės ženklas';

  @override
  String get adminBrandingLoginDisclaimer => 'Prisijungimo atsisakymas';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML rodomas po prisijungimo forma';

  @override
  String get adminBrandingCustomCss => 'Tinkintas CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Tinkintas CSS, pritaikytas žiniatinklio sąsajai';

  @override
  String get adminBrandingEnableSplash => 'Įgalinti prisilietimo ekraną';

  @override
  String get adminBrandingSplashUpload => 'Įkelti vaizdą';

  @override
  String get adminBrandingSplashUploaded => 'Pasveikinimo ekranas atnaujintas';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Nepavyko įkelti pasveikinimo ekrano';

  @override
  String get adminBrandingSplashDeleted => 'Pasveikinimo ekranas pašalintas';

  @override
  String get adminBrandingNoSplash => 'Pasirinktinio pasveikinimo ekrano nėra';

  @override
  String get adminPlaybackHwAccel => 'Aparatinės įrangos pagreitis';

  @override
  String get adminPlaybackHwAccelLabel => 'Aparatinis pagreitis';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Įgalinti aparatinės įrangos kodavimą';

  @override
  String get adminPlaybackQsvDevice => 'QSV įrenginys';

  @override
  String get adminPlaybackEnhancedNvdec => 'Įjungti patobulintą NVDEC dekoderį';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Teikti pirmenybę sistemos aparatiniam dekoderiui';

  @override
  String get adminPlaybackColorDepth10Hevc => '10 bitų HEVC dekodavimas';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10 bitų VP9 dekodavimas';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10 bitų dekodavimas';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12 bitų dekodavimas';

  @override
  String get adminPlaybackHwEncodingSection => 'Aparatinis kodavimas';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Leisti HEVC kodavimą';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Leisti AV1 kodavimą';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Įjungti Intel mažos galios H.264 koduotuvą';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Įjungti Intel mažos galios HEVC koduotuvą';

  @override
  String get adminPlaybackToneMapping => 'Tonų atvaizdavimas';

  @override
  String get adminPlaybackEnableTonemapping => 'Įjungti tonų atvaizdavimą';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Įjungti VPP tonų atvaizdavimą';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Įjungti VideoToolbox tonų atvaizdavimą';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Tonų atvaizdavimo algoritmas';

  @override
  String get adminPlaybackTonemappingMode => 'Tonų atvaizdavimo režimas';

  @override
  String get adminPlaybackTonemappingRange => 'Tonų atvaizdavimo diapazonas';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Tonų atvaizdavimo sodrumo mažinimas';

  @override
  String get adminPlaybackTonemappingPeak => 'Tonų atvaizdavimo pikas';

  @override
  String get adminPlaybackTonemappingParam => 'Tonų atvaizdavimo parametras';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP tonų atvaizdavimo ryškumas';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP tonų atvaizdavimo kontrastas';

  @override
  String get adminPlaybackEncoderPreset => 'Koduotuvo šablonas';

  @override
  String get adminPlaybackH264Crf => 'H.264 kodavimo CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) kodavimo CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Eilučių išpynimo metodas';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Dvigubinti kadrų dažnį išpinant eilutes';

  @override
  String get adminPlaybackAudioSection => 'Garsas';

  @override
  String get adminPlaybackEnableAudioVbr => 'Įjungti garso VBR kodavimą';

  @override
  String get adminPlaybackDownmixBoost => 'Garso sumaišymo stiprinimas';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo sumaišymo algoritmas';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Didžiausias multipleksavimo eilės dydis';

  @override
  String get adminPlaybackAutoOption => 'Automatiškai';

  @override
  String get adminPlaybackEncoding => 'Kodavimas';

  @override
  String get adminPlaybackEncodingThreads => 'Kodavimo gijos';

  @override
  String get adminPlaybackFallbackFont => 'Įgalinti atsarginį šriftą';

  @override
  String get adminPlaybackFallbackFontPath => 'Atsarginis šrifto kelias';

  @override
  String get adminPlaybackStreaming => 'Srautinis perdavimas';

  @override
  String get adminResumeVideo => 'Vaizdo įrašas';

  @override
  String get adminResumeAudiobooks => 'Garsinės knygos';

  @override
  String get adminStreamingBitrateLimit =>
      'Nuotolinio kliento pralaidumo riba (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Palikite tuščią arba 0 neribotam';

  @override
  String get adminTrickplayHwAccel => 'Įgalinti aparatinės įrangos pagreitį';

  @override
  String get adminTrickplayHwEncoding => 'Įgalinti aparatinės įrangos kodavimą';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Įgalinti tik rakto rėmelio ištraukimą';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Greitesnis, bet mažesnis tikslumas';

  @override
  String get adminTrickplayNonBlocking => 'Neblokuojantis';

  @override
  String get adminTrickplayBlocking => 'Blokavimas';

  @override
  String get adminTrickplayPriorityHigh => 'Aukštas';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Virš normalaus';

  @override
  String get adminTrickplayPriorityNormal => 'Normalus';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Žemiau įprastos';

  @override
  String get adminTrickplayPriorityIdle => 'Tuščia eiga';

  @override
  String get adminTrickplayImageSettings => 'Vaizdo nustatymai';

  @override
  String get adminTrickplayInterval => 'Intervalas (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Kaip dažnai fiksuoti kadrus';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Kableliais atskirtų taškų plotis (pvz., 320)';

  @override
  String get adminTrickplayQuality => 'Kokybė';

  @override
  String get adminTrickplayQScale => 'Kokybės skalė';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Mažesnės reikšmės = geresnė kokybė, didesni failai';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kokybė';

  @override
  String get adminTrickplayProcessing => 'Apdorojimas';

  @override
  String get adminTasksEmpty => 'Suplanuotų užduočių nerasta';

  @override
  String get adminTasksNoFilterMatch =>
      'Nėra užduočių, atitinkančių dabartinį filtrą';

  @override
  String get adminTaskCancelling => 'Atšaukiama...';

  @override
  String get adminTaskRunning => 'Bėga...';

  @override
  String get adminTaskNeverRun => 'Niekada nebėgioti';

  @override
  String get adminTaskStop => 'Stabdyti';

  @override
  String get adminRunningTasks => 'Vykdomos užduotys';

  @override
  String get adminTaskRun => 'Bėk';

  @override
  String get adminTaskDetailLastExecution => 'Paskutinis vykdymas';

  @override
  String get adminTaskDetailStarted => 'Prasidėjo';

  @override
  String get adminTaskDetailEnded => 'Baigėsi';

  @override
  String get adminTaskDetailDuration => 'Trukmė';

  @override
  String get adminTaskDetailErrorLabel => 'Klaida:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Kasdien $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Kiekvieną $day $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Paleidus programą';

  @override
  String get adminTaskTriggerTypeDaily => 'Kasdien';

  @override
  String get adminTaskTriggerTypeWeekly => 'Kas savaitę';

  @override
  String get adminTaskTriggerTypeInterval => 'Per intervalą';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervalas';

  @override
  String get adminTaskTriggerEveryHour => 'Kas valandą';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valandų',
      many: '$count valandos',
      few: '$count valandos',
      one: '$count valanda',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Laikas';

  @override
  String get adminActivityJustNow => 'Tik dabar';

  @override
  String get adminActivityLastHour => 'Paskutinė valanda';

  @override
  String get adminActivityToday => 'Šiandien';

  @override
  String get adminActivityYesterday => 'vakar';

  @override
  String get adminActivityOlder => 'Vyresni';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d prieš';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours@h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes@min';
  }

  @override
  String get adminActivityNow => 'dabar';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min.';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours val.';
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
      'Konfigūruokite „Trickplay“ vaizdo generavimą, kad galėtumėte peržiūrėti peržiūros miniatiūras.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Viešas HTTPS prievadas';

  @override
  String get adminNetworkingBaseUrl => 'Bazinis URL';

  @override
  String get adminNetworkingBaseUrlHint => 'pvz. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Viešasis HTTP prievadas';

  @override
  String get adminNetworkingRequireHttps => 'Reikalauti HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Nukreipti visas nuotolines užklausas į HTTPS. Neveikia, jei serveris neturi galiojančio sertifikato.';

  @override
  String get adminNetworkingCertPassword => 'Sertifikato slaptažodis';

  @override
  String get adminNetworkingEnableIpv4 => 'Įjungti IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Įjungti IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'LAN tinklai';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Nuotolinis IP filtras';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API įrenginys';

  @override
  String get adminPlaybackAutomatic => '0 = automatinis';

  @override
  String get adminPlaybackTranscodeTempPath => 'Perkodavimo temp kelias';

  @override
  String get adminPlaybackSegmentDeletion => 'Leisti ištrinti segmentą';

  @override
  String get adminPlaybackSegmentKeep => 'Segmento išlaikymas (sekundėmis)';

  @override
  String get adminPlaybackThrottleBuffering => 'Droselio buferis';

  @override
  String get adminPlaybackThrottleDelay => 'Ribojimo delsa (sekundėmis)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Leisti išgauti subtitrus realiuoju laiku';

  @override
  String get adminResumeMinPct => 'Minimalus atnaujinimo procentas';

  @override
  String get adminResumeMinPctSubtitle =>
      'Turinys turi būti paleistas ilgiau nei šis procentas, kad būtų išsaugota pažanga';

  @override
  String get adminResumeMaxPct => 'Maksimalus atnaujinimo procentas';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Turinys laikomas visiškai paleistas po šio procento';

  @override
  String get adminResumeMinDuration =>
      'Minimali gyvenimo aprašymo trukmė (sekundėmis)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Prekės, trumpesnės nei ši, nėra atnaujinamos';

  @override
  String get adminTrickplayScanBehavior => 'Nuskaitymo elgsena';

  @override
  String get adminTrickplayProcessPriority => 'Proceso prioritetas';

  @override
  String get adminTrickplayTileWidth => 'Plytelių plotis';

  @override
  String get adminTrickplayTileHeight => 'Plytelių aukštis';

  @override
  String get adminTrickplayProcessThreads => 'Apdoroti gijas';

  @override
  String get adminTrickplayWidthResolutions => 'Pločio raiškos';

  @override
  String get adminMetadataDefault => 'Numatytoji';

  @override
  String get adminMetadataContentTypeUpdated => 'Turinio tipas atnaujintas';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Nepavyko atnaujinti turinio tipo: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Lėto atsako slenkstis (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Įjungti įspėjimus apie lėtą atsaką';

  @override
  String get adminGeneralQuickConnect => 'Įjungti Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Serveris';

  @override
  String get adminGeneralSectionMetadata => 'Metaduomenys';

  @override
  String get adminGeneralSectionPaths => 'Keliai';

  @override
  String get adminGeneralSectionPerformance => 'Našumas';

  @override
  String get adminGeneralCachePath => 'Talpyklos kelias';

  @override
  String get adminGeneralMetadataPath => 'Metaduomenų kelias';

  @override
  String get adminGeneralServerName => 'Serverio pavadinimas';

  @override
  String get adminGeneralDisplayLanguage => 'Pageidaujama rodymo kalba';

  @override
  String get adminSettingsLoadFailed => 'Nepavyko įkelti nustatymų';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Nepavyko atnaujinti atvaizdų: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Laiko limitas: $duration';
  }

  @override
  String get folders => 'Aplankai';

  @override
  String get libraries => 'Bibliotekos';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay išjungtas';

  @override
  String get syncPlayDisabledMessage =>
      'Nustatymuose įgalinkite „SyncPlay“, kad galėtumėte naudoti sinchronizuotą atkūrimą.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Serveris nepalaikomas';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay reikalingas Jellyfin serveris. Dabartinis serveris jo nepalaiko.';

  @override
  String get syncPlayGroupFallbackName => '„SyncPlay“ grupė';

  @override
  String get syncPlayGroupTooltip => '„SyncPlay“ grupė';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# dalyvių',
      many: '# dalyvio',
      few: '# dalyviai',
      one: '# dalyvis',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignoruoti laukimą';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Nelaikykite grupės iškeltos, kol šis įrenginys veikia buferyje';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Tęskite vietoje, nelaukdami lėtų narių';

  @override
  String get syncPlayRepeat => 'Pakartokite';

  @override
  String get syncPlayRepeatOne => 'Vienas';

  @override
  String get syncPlayShuffleModeShuffled => 'Sumaišytas';

  @override
  String get syncPlayShuffleModeSorted => 'Surūšiuota';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sinchronizuoti dabartinę atkūrimo eilę';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Pakeiskite grupės eilę tuo, kas leidžiama vietoje';

  @override
  String get syncPlayLeaveGroup => 'Išeiti iš grupės';

  @override
  String get syncPlayGroupQueue => 'Grupės eilė';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Elementas $index';
  }

  @override
  String get syncPlayPlayNow => 'Žaisti dabar';

  @override
  String get syncPlayCreateNewGroup => 'Sukurti naują grupę';

  @override
  String get syncPlayGroupName => 'Grupės pavadinimas';

  @override
  String get syncPlayDefaultGroupName => 'Mano „SyncPlay“ grupė';

  @override
  String get syncPlayCreateGroup => 'Sukurti grupę';

  @override
  String get syncPlayAvailableGroups => 'Galimos grupės';

  @override
  String get syncPlayNoGroupsAvailable => 'Nėra pasiekiamų grupių';

  @override
  String get syncPlayJoinGroupQuestion => 'Prisijungti prie SyncPlay grupės?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Prisijungimas prie „SyncPlay“ grupės gali pakeisti dabartinę atkūrimo eilę. Tęsti?';

  @override
  String get syncPlayJoin => 'Prisijunk';

  @override
  String get syncPlayStateIdle => 'Tuščia eiga';

  @override
  String get syncPlayStateWaiting => 'Laukia';

  @override
  String get syncPlayStatePaused => 'Pristabdyta';

  @override
  String get syncPlayStatePlaying => 'Žaidžia';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName prisijungė prie SyncPlay grupės';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName paliko SyncPlay grupę';
  }

  @override
  String get syncPlayAccessDeniedTitle => '„SyncPlay“ prieiga uždrausta';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Neturite prieigos prie vieno ar daugiau elementų šioje „SyncPlay“ grupėje. Paprašykite grupės savininko patvirtinti bibliotekos leidimus arba pasirinkti kitą eilę.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sinchronizuojamas atkūrimas su $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Paieška balsu nepasiekiama.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      '„Dolby Vision Direct Play“ nepavyko';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Nepavyko pradėti tiesioginio šio „Dolby Vision“ srauto atkūrimo. Bandyti dar kartą naudoti serverio perkodavimą?';

  @override
  String get retryWithTranscode => 'Bandykite dar kartą naudodami perkodavimą';

  @override
  String get dolbyVisionNotSupportedTitle => '„Dolby Vision“ nepalaikoma';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Šis įrenginys negali tiesiogiai iššifruoti „Dolby Vision“ turinio. Naudokite atsarginį HDR10 arba paprašykite serverio perkodavimo.';

  @override
  String get rememberMyChoice => 'Prisimink mano pasirinkimą';

  @override
  String get playHdr10Fallback => 'Leiskite atsarginę HDR10 versiją';

  @override
  String get requestTranscode => 'Prašyti perkoduoti';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'rasta # eilučių',
      many: 'rasta # eilutės',
      few: 'rastos # eilutės',
      one: 'rasta # eilutė',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Žiūrėti viską';

  @override
  String get noItems => 'Nėra elementų';

  @override
  String get switchUser => 'Perjungti vartotoją';

  @override
  String get remoteControl => 'Nuotolinio valdymo pultas';

  @override
  String get mediaBarLoading => 'Įkeliama medijos juosta...';

  @override
  String get mediaBarError => 'Medijos juostos nepavyko įkelti';

  @override
  String get offlineServerUnavailable =>
      'Prisijungta prie interneto, bet dabartinis serveris nepasiekiamas.';

  @override
  String get offlineNoInternet =>
      'Esate neprisijungęs. Galimas tik atsisiųstas turinys.';

  @override
  String get offlineFileNotAvailable => 'Failas nepasiekiamas';

  @override
  String get offlineSwitchServer => 'Perjungti serverį';

  @override
  String get offlineSavedMedia => 'Išsaugota laikmena';

  @override
  String get offlineBannerTitle => 'Esate neprisijungę';

  @override
  String get offlineBannerSubtitle => 'Rodomi jūsų atsisiuntimai';

  @override
  String get serverUnreachableBannerTitle => 'Nepavyksta pasiekti serverio';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Kol serveris neveikia, leidžiama iš atsisiuntimų';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Nuotolinis atkūrimas';

  @override
  String castControlFailed(String error) {
    return 'Nepavyko valdyti perdavimo: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Valdikliai';
  }

  @override
  String get castDeviceVolume => 'Įrenginio garsumas';

  @override
  String get castVolumeUnavailable => 'Nepasiekiamas';

  @override
  String castStopKind(String kind) {
    return 'Sustabdyti $kind';
  }

  @override
  String get audioLabel => 'Garsas';

  @override
  String get subtitlesLabel => 'Subtitrai';

  @override
  String get pinConfirmTitle => 'Patvirtinkite PIN kodą';

  @override
  String get pinSetTitle => 'Nustatyti PIN kodą';

  @override
  String get pinEnterTitle => 'Įveskite PIN kodą';

  @override
  String get pinReenterToConfirm =>
      'Dar kartą įveskite PIN kodą, kad patvirtintumėte';

  @override
  String pinEnterNDigit(int length) {
    return 'Įveskite $length skaitmenų PIN kodą';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Įveskite $length skaitmenų PIN kodą';
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
  String get pinIncorrect => 'Neteisingas PIN kodas';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN kodai nesutampa';

  @override
  String get pinForgot => 'Pamiršote PIN kodą?';

  @override
  String get pinClear => 'Išvalyti';

  @override
  String get pinBackspace => 'Naikinti';

  @override
  String get quickConnectAuthorized => 'Quick Connect užklausa patvirtinta.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect kodas neteisingas arba nebegalioja.';

  @override
  String get quickConnectNotSupported =>
      'Šis serveris nepalaiko Quick Connect.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Nepavyko patvirtinti Quick Connect kodo.';

  @override
  String get quickConnectDisabled => 'Šiame serveryje Quick Connect išjungtas.';

  @override
  String get quickConnectForbidden =>
      'Jūsų paskyra negali patvirtinti šios Quick Connect užklausos.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect kodas nerastas. Pabandykite naują kodą.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect nepavyko: $message';
  }

  @override
  String get quickConnectEnterCode => 'Įveskite kodą';

  @override
  String get quickConnectAuthorize => 'Įgalioti';

  @override
  String remoteCommandFailed(String error) {
    return 'Komanda nepavyko: $error';
  }

  @override
  String get remoteControlTitle => 'Nuotolinio valdymo pultas';

  @override
  String get remoteFailedToLoadSessions => 'Nepavyko įkelti seansų';

  @override
  String get remoteNoSessions => 'Jokių kontroliuojamų seansų';

  @override
  String get remoteStartPlayback => 'Pradėkite atkūrimą kitame įrenginyje';

  @override
  String get unknownUser => 'Nežinoma';

  @override
  String get unknownItem => 'Nežinoma';

  @override
  String get remoteNothingPlaying => 'Šioje sesijoje nieko negroja';

  @override
  String get castingStarted => 'Perdavimas pradėtas pasirinktame įrenginyje';

  @override
  String castingFailed(String error) {
    return 'Nepavyko pradėti perdavimo: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nėra pasiekiamų nuotolinio atkūrimo įrenginių.';

  @override
  String get noRemoteDevicesIos =>
      'Nėra pasiekiamų nuotolinio atkūrimo įrenginių.\n\nJei naudojate „iOS“, „AirPlay“ taikiniai simuliatoriuje gali būti nepasiekiami.';

  @override
  String get trackActionPlayNext => 'Žaisti toliau';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Pridėti į eilę';

  @override
  String get trackActionAddToPlaylist => 'Pridėti prie grojaraščio';

  @override
  String get trackActionCancelDownload => 'Atšaukti atsisiuntimą';

  @override
  String get trackActionDeleteFromPlaylist => 'Ištrinti iš grojaraščio';

  @override
  String get trackActionMoveUp => 'Judėti aukštyn';

  @override
  String get trackActionMoveDown => 'Judėti žemyn';

  @override
  String get trackActionRemoveFromFavorites => 'Pašalinti iš parankinių';

  @override
  String get trackActionAddToFavorites => 'Pridėti prie mėgstamiausių';

  @override
  String get trackActionGoToAlbum => 'Eiti į albumą';

  @override
  String get trackActionGoToArtist => 'Eikite į atlikėją';

  @override
  String trackActionDownloading(String name) {
    return 'Atsisiunčiama $name...';
  }

  @override
  String get trackActionDeletedFile => 'Ištrintas atsisiųstas failas';

  @override
  String get trackActionDeleteFileFailed =>
      'Nepavyko ištrinti atsisiųsto failo';

  @override
  String get shuffleBy => 'Maišyti pagal';

  @override
  String get shuffleSelectLibrary => 'Pasirinkite Biblioteka';

  @override
  String get shuffleSelectGenre => 'Pasirinkite Žanras';

  @override
  String get shuffleLibrary => 'Biblioteka';

  @override
  String get shuffleGenre => 'Žanras';

  @override
  String get shuffleNoLibraries => 'Nėra suderinamų bibliotekų.';

  @override
  String get shuffleNoGenres => 'Šiam maišymo režimui nerasta jokių žanrų.';

  @override
  String get posterDisplayTitle => 'Ekranas';

  @override
  String get posterImageType => 'Vaizdo tipas';

  @override
  String get imageTypePoster => 'Plakatas';

  @override
  String get imageTypeThumbnail => 'Miniatiūra';

  @override
  String get imageTypeBanner => 'Reklamjuostė';

  @override
  String get playlistAddFailed => 'Nepavyko pridėti prie grojaraščio';

  @override
  String get playlistCreateFailed => 'Nepavyko sukurti grojaraščio';

  @override
  String get playlistNew => 'Naujas grojaraštis';

  @override
  String get playlistCreate => 'Sukurti';

  @override
  String get playlistCreateNew => 'Sukurti naują grojaraštį';

  @override
  String get playlistNoneFound => 'Nerasta jokių grojaraščių';

  @override
  String get addToPlaylist => 'Pridėti prie grojaraščio';

  @override
  String get lyricsNotAvailable => 'Dainų žodžių nėra';

  @override
  String get upNext => 'Aukštyn Kitas';

  @override
  String get playNext => 'Žaisti toliau';

  @override
  String get stillWatchingContent =>
      'Atkūrimas buvo pristabdytas. Ar vis dar žiūrite?';

  @override
  String get stillWatchingStop => 'Stabdyti';

  @override
  String get stillWatchingContinue => 'Tęsti';

  @override
  String skipSegment(String segment) {
    return 'Praleisti $segment';
  }

  @override
  String get liveTv => 'Tiesioginė televizija';

  @override
  String get continueWatchingAndNextUp => 'Žiūrėti toliau ir toliau';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Atsisiunčiama $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Atsisiunčiama $fileName';
  }

  @override
  String get nextEpisode => 'Kitas Epizodas';

  @override
  String get moreFromThisSeason => 'Daugiau iš šio sezono';

  @override
  String get playerTooltipPlaybackSpeed => 'Atkūrimo greitis';

  @override
  String get playerTooltipCastControls => 'Cast valdikliai';

  @override
  String get playerTooltipPlaybackQuality => 'Bitų sparta';

  @override
  String get playerTooltipEnterFullscreen => 'Įeikite per visą ekraną';

  @override
  String get playerTooltipExitFullscreen => 'Išeikite per visą ekraną';

  @override
  String get playerTooltipFloatOnTop => 'Plūduriuoti ant viršaus';

  @override
  String get playerTooltipExitFloatOnTop => 'Išjungti plūdę viršuje';

  @override
  String get playerTooltipLockLandscape => 'Užrakinti kraštovaizdį';

  @override
  String get playerTooltipUnlockOrientation => 'Leisti suktis';

  @override
  String get playerTooltipPrevious => 'Ankstesnis';

  @override
  String get playerTooltipSeekBack => 'Ieškok atgal';

  @override
  String get playerTooltipSeekForward => 'Siekite pirmyn';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Pažymėti kaip žiūrėtą';

  @override
  String get contextMenuMarkUnwatched => 'Pažymėti kaip nežiūrėtą';

  @override
  String get contextMenuAddToFavorites => 'Pridėti prie mėgstamiausių';

  @override
  String get contextMenuRemoveFromFavorites => 'Pašalinti iš parankinių';

  @override
  String get contextMenuGoToSeries => 'Eikite į seriją';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Slėpti iš „Tęsti žiūrėjimą“';

  @override
  String get contextMenuHideFromNextUp => 'Slėpti iš „Toliau“';

  @override
  String get contextMenuAddToCollection => 'Pridėti į rinkinį';

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
      'Prisijunkite prie serverio administravimo skydelio';

  @override
  String get settingsDynamicContent => 'Dinaminis turinys';

  @override
  String get settingsDynamicContentSubtitle =>
      'Medijos juosta ir vaizdinės perdangos';

  @override
  String get settingsAboutSubtitle =>
      'Programos versija, teisinė informacija ir kreditai';

  @override
  String get settingsSortServersBy => 'Rūšiuoti serverius pagal';

  @override
  String get settingsLastUsed => 'Paskutinį kartą naudotas';

  @override
  String get settingsAlphabetical => 'Abėcėlinis';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Leisti savarankiškai pasirašytus sertifikatus';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Pasitikėti serveriais, naudojančiais savarankiškai pasirašytus arba privačios CA TLS sertifikatus. Įjunkite tik savo valdomiems serveriams. Tai išjungia sertifikatų tikrinimą visiems ryšiams.';

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
  String get settingsHomePage => 'Pagrindinis puslapis';

  @override
  String get settingsTwentyFourHourClock => '24 valandų laikrodis';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Visur, kur rodomas laikrodis, naudokite 24 valandų laiko formatavimą';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Rodyti maišymo mygtuką naršymo juostoje';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Rodyti žanrų mygtuką naršymo juostoje';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Rodyti parankinių mygtuką naršymo juostoje';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Rodyti bibliotekų mygtuką naršymo juostoje';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Rodyti Seerr mygtuką naršymo juostoje';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Visada rodyti tekstinius pavadinimus viršutinėje naršymo juostoje';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Perjungti pagrindinio puslapio matomumą pagal biblioteką. Iš naujo paleiskite „Moonfin“, kad pakeitimai įsigaliotų.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Medijos juosta ir vietinės peržiūros';

  @override
  String get settingsVisualOverlays => 'Vaizdinės perdangos';

  @override
  String get settingsSeasonalSurprise => 'Sezoninė staigmena';

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
  String get settingsHigh => 'Aukštas';

  @override
  String get settingsLow => 'Žemas';

  @override
  String get settingsCustomPath => 'Pasirinktinis kelias';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Įveskite atsisiuntimo aplanko kelią';

  @override
  String get settingsConcurrentDownloads =>
      'Vienu metu vykstantys atsisiuntimai';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Didžiausias vienu metu atsisiunčiamų elementų skaičius.';

  @override
  String get settingsAppInfo => 'PROGRAMOS INFORMACIJA';

  @override
  String get settingsReportAnIssue => 'Pranešti apie problemą';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Atidarykite problemų stebėjimo priemonę „GitHub“.';

  @override
  String get settingsJoinDiscord => 'Prisijunkite prie „Discord“.';

  @override
  String get settingsJoinDiscordSubtitle => 'Kalbėkitės su bendruomene';

  @override
  String get settingsJoinTheDiscord => 'Prisijunkite prie Discord';

  @override
  String get settingsSupportMoonfin => 'Palaikykite Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Pavaišinkite kūrėją kava';

  @override
  String get settingsLegal => 'TEISINĖ';

  @override
  String get settingsLicenses => 'Licencijos';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Atvirojo kodo licencijos pranešimai';

  @override
  String get settingsPrivacyPolicy => 'Privatumo politika';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Kaip Moonfin tvarko jūsų duomenis';

  @override
  String get settingsCheckForUpdates => 'Patikrinkite, ar nėra atnaujinimų';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Patikrinkite naujausią „Moonfin“ leidimą';

  @override
  String get settingsBoth => 'Abu';

  @override
  String get settingsShuffleContentTypeFilter => 'Maišyti turinio tipo filtras';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Garso takeliai, apdorojimas ir perdavimo parinktys';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatizuotas atkūrimas ir seka';

  @override
  String get settingsSyncplaySubtitle =>
      'Grupinių užsiėmimų sinchronizavimo logika';

  @override
  String get settingsSkipIntrosAndOutros => 'Praleisti įžangas ir pabaigas?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown =>
      'Medijos segmento atgalinis skaičiavimas';

  @override
  String get settingsProgressBar => 'Eigos juosta';

  @override
  String get settingsTimer => 'Laikmatis';

  @override
  String get settingsNone => 'Nėra';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Raginti vartotoją';

  @override
  String get settingsSkip => 'Praleisti';

  @override
  String get settingsDoNothing => 'Nieko nedaryti';

  @override
  String get settingsMaxBitrateDescription =>
      'Apribokite srautinio perdavimo pralaidumą. Turinys, viršijantis šį slenkstį, bus perkoduotas, kad tilptų.';

  @override
  String get settingsMaxResolutionDescription =>
      'Apribokite maksimalią raišką, kurios žaidėjas paprašys. Didesnės raiškos turinys bus perkoduotas žemyn.';

  @override
  String get settingsPlayerZoomDescription =>
      'Kaip vaizdo įrašas turėtų būti pakeistas, kad tilptų ekrane.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Atkūrimo variklis („Android TV“)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Pasirinkite numatytąjį atkūrimo variklį „Android TV“ įrenginiuose. Pakeitimai taikomi kitai atkūrimo sesijai.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (rekomenduojama)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (palikimas)';

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
  String get settingsDolbyVisionFallback =>
      '„Dolby Vision“ atsarginis variantas';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision pavadinimų elgsena įrenginiuose be Dolby Vision dekodavimo.';

  @override
  String get settingsAskEachTime => 'Klauskite kiekvieną kartą';

  @override
  String get settingsPreferHdr10Fallback =>
      'Pirmenybę teikite atsarginiam HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Pirmenybė teikiama serverio perkodavimui';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      '„Dolby Vision Profile 7“ tiesioginis paleidimas';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Valdo, ar „Dolby Vision“ profilio 7 patobulinimo sluoksnio srautai turi nukreipti grojimą.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automatinis (AFTKRT įjungtas)';

  @override
  String get settingsEnabledOnThisDevice => 'Įjungta šiame įrenginyje';

  @override
  String get settingsDisabledPreferTranscode =>
      'Išjungta (pageidautina perkoduoti)';

  @override
  String get settingsResumeRewindDescription =>
      'Kiek sekundžių reikia atsukti atkūrimą tęsiant (iš „Continue Watching“ arba iš medijos elemento puslapio)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Kiek sekundžių reikia atsukti atkūrimą paspaudus pauzės mygtuką?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Kiek sekundžių reikia grįžti atgal paspaudus atsukimo mygtuką.';

  @override
  String get settingsOneSecond => '1 sekundė';

  @override
  String get settingsThreeSeconds => '3 sekundes';

  @override
  String get settingsFortyFiveSeconds => '45 sekundes';

  @override
  String get settingsSixtySeconds => '60 sekundžių';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Kiek sekundžių reikia šokti pirmyn paspaudus greito pirmyn mygtuką.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitų srautas AC3 į išorinį dekoderį';

  @override
  String get settingsCinemaMode => 'Kino režimas';

  @override
  String get settingsCinemaModeSubtitle =>
      'Žaiskite anonsus / išankstinius įrašus prieš pagrindinę funkciją';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Išplėstoje rodoma visa kortelė su epizodo iliustracija ir aprašu. Minimalus rodo kompaktišką atgalinės atskaitos perdangą. Išjungta visiškai paslepia raginimą.';

  @override
  String get settingsShort => 'Trumpas';

  @override
  String get settingsLong => 'Ilgas';

  @override
  String get settingsVeryLong => 'Labai Ilgas';

  @override
  String get settingsVideoStartDelay => 'Vaizdo įrašo pradžios delsa';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Tiesioginė TV tiesioginė';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Įgalinti tiesioginį tiesioginės televizijos atkūrimą';

  @override
  String get settingsOpenGroups => 'Atidarykite grupes';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Kurkite, prisijunkite arba tvarkykite „SyncPlay“ grupes';

  @override
  String get settingsSyncplayEnabled => '„SyncPlay“ įjungta';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Įgalinti grupės stebėjimo funkcijas';

  @override
  String get settingsSyncplayButton => 'SyncPlay mygtukas';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Naršymo juostoje parodykite mygtuką SyncPlay';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Išplėstinė korekcija';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Įgalinti tikslią sinchronizavimo logiką';

  @override
  String get settingsSyncplaySyncCorrection => 'Sinchronizavimo taisymas';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Automatiškai koreguokite atkūrimą, kad jis būtų sinchronizuotas';

  @override
  String get settingsSyncplaySpeedToSync => 'Sinchronizavimo greitis';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Norėdami sinchronizuoti, naudokite atkūrimo greičio reguliavimą';

  @override
  String get settingsSyncplaySkipToSync => 'Pereiti prie sinchronizavimo';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Naudokite iešką sinchronizuoti';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Minimalus greičio delsimas';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Maksimalaus greičio delsa';

  @override
  String get settingsSyncplaySpeedDuration => 'Greičio trukmė';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimali praleidimo delsa';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Papildomas poslinkis';

  @override
  String get onNow => 'Dabar';

  @override
  String get collections => 'Kolekcijos';

  @override
  String get lastPlayed => 'Paskutinį kartą žaidė';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Naujausias $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Neseniai išleista: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Automatiškai paleisti kitą seriją';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automatiškai paleisti kitą seriją, kai ji pasiekiama.';

  @override
  String get skipSilenceTitle => 'Praleisti tylą';

  @override
  String get skipSilenceSubtitle =>
      'Automatiškai praleiskite tylius garso segmentus, kai juos palaiko srautas.';

  @override
  String get allowExternalAudioEffectsTitle => 'Leisti išorinius garso efektus';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Leisti ekvalaizerio ir efektų programoms (pvz., „Wavelet“) prisijungti prie Media3 atkūrimo seansų.';

  @override
  String get disableTunnelingTitle => 'Išjungti tuneliavimą';

  @override
  String get disableTunnelingSubtitle =>
      'Priverstinis netunelinis atkūrimas. Naudinga įrenginiuose su tuneliavimo garso / vaizdo pertrūkiais.';

  @override
  String get enableTunnelingTitle => 'Įjungti tuneliavimą';

  @override
  String get enableTunnelingSubtitle =>
      'Išplėstinis. Nukreipia garsą ir vaizdą per susietą aparatinį kelią. Pagal numatytuosius nustatymus išjungta, nes kai kuriuose įrenginiuose sukelia garso ir vaizdo trikdžius.';

  @override
  String get mapDolbyVisionP7Title => 'Susieti Dolby Vision profilį 7 su HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Leiskite Dolby Vision profilio 7 srautus kaip su HDR10 suderinamą HEVC ne DV įrenginiuose.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Naudokite įterptus subtitrų stilius';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Taikykite spalvas, šriftus ir padėtį, įterptą į subtitrų takelį. Išjunkite, kad galėtumėte naudoti antraščių stiliaus nuostatas.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Naudokite įterptųjų subtitrų šrifto dydžius';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Taikykite šrifto dydžio užuominas, įterptas į subtitrų takelį. Neleiskite naudoti subtitrų dydžio pagal savo stiliaus nuostatas.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Rodyti medijos informaciją';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Rodyti pasirinkto elemento informaciją bibliotekos puslapių viršuje.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Naudokite išsamias antraštes';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Bibliotekos puslapiuose rodyti išsamią arba minimalią eilutę.';

  @override
  String get savedThemesDeleteDialogTitle => 'Ištrinti išsaugotą temą?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Pašalinti „$themeName“ iš šio įrenginio talpyklos?';
  }

  @override
  String get themeStore => 'Temų parduotuvė';

  @override
  String get themeStoreSubtitle =>
      'Naršykite ir išsaugokite bendruomenės temas';

  @override
  String get themeStoreDescription =>
      'Išsaugokite temą, kad galėtumėte ją naudoti kaip ir kitas išsaugotas temas.';

  @override
  String get themeStoreEmpty => 'Šiuo metu temų nėra.';

  @override
  String get themeStoreLoadFailed =>
      'Nepavyko įkelti temų parduotuvės. Patikrinkite ryšį ir bandykite dar kartą.';

  @override
  String get themeStoreSave => 'Išsaugoti';

  @override
  String get themeStoreSaveAndApply => 'Išsaugoti ir taikyti';

  @override
  String get themeStoreSaved => 'Išsaugota';

  @override
  String get themeStoreInvalidMessage => 'Šios temos įkelti nepavyko.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Išsaugota „$themeName“.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Ištrinta „$themeName“ iš šio įrenginio.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Nepavyko ištrinti „$themeName“.';
  }

  @override
  String get savedThemesTitle => 'Išsaugotos temos';

  @override
  String get savedThemesDescription =>
      'Tai temos, atsisiųstos iš Moonfin įskiepio dabartiniam serveriui. Ištrynus pašalinama tik ši vietinė kopija.';

  @override
  String get savedThemesEmpty => 'Šiam serveriui išsaugotų temų nerasta.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Šiuo metu aktyvus';
  }

  @override
  String get savedThemesDeleteTooltip => 'Ištrinti išsaugotą temą';

  @override
  String get savedThemesManageSubtitle =>
      'Tvarkykite atsisiųstų papildinių temas šiame įrenginyje';

  @override
  String get themeEditor => 'Temos redaktorius';

  @override
  String get themeEditorSubtitle =>
      'Naršyklėje atidarykite Moonfin temų rengyklę';

  @override
  String get homeScreen => 'Pagrindinis ekranas';

  @override
  String get bottomBar => 'Apatinė juosta';

  @override
  String get homeRowsStyleClassic => 'Klasikinis';

  @override
  String get homeRowsStyleModern => 'Modernus';

  @override
  String get homeRowsSection => 'Pradžios eilutės';

  @override
  String get rowsType => 'Eilučių tipas';

  @override
  String get rowsTypeDescription =>
      '„Classic“ išlaiko kiekvienos eilutės vaizdo tipą ir informacijos perdangą. Modernus naudoja portreto ir fono eilutes.';

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
  String get displayFavoritesRows => 'Rodyti mėgstamiausių eilutes';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Rodyti mėgstamiausius filmus, serialus ir kitas mėgstamiausias eilutes pagrindinio puslapio skiltyse.';

  @override
  String get favoritesRowSorting => 'Parankinių eilučių rūšiavimas';

  @override
  String get favoritesRowSortingDescription =>
      'Rūšiuoti parankinių eilutes pagal pridėjimo datą, išleidimo datą, abėcėlės tvarka ir kt.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Rodyti kolekcijų eilutes';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Rodyti kolekcijų eilutes pagrindinio puslapio skiltyse.';

  @override
  String get collectionsRowSorting => 'Rinkinių eilučių rūšiavimas';

  @override
  String get collectionsRowSortingDescription =>
      'Rūšiuoti kolekcijų eilutes pagal pridėjimo datą, išleidimo datą, abėcėlės tvarka ir kt.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Rodyti žanrų eilutes';

  @override
  String get displayGenresRowsSubtitle =>
      'Rodyti žanrų eilutes pagrindiniuose skyriuose.';

  @override
  String get genresRowSorting => 'Žanrai Eilučių rūšiavimas';

  @override
  String get genresRowSortingDescription =>
      'Rūšiuoti žanrų eilutes pagal pridėjimo datą, išleidimo datą, abėcėlės tvarka ir kt.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Žanrai Eilutės elementai';

  @override
  String get genresRowItemsDescription =>
      'Rodyti filmus, serialus arba abu žanrų eilutėse.';

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
  String get displayPlaylistsRows => 'Rodyti grojaraščių eilutes';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Rodyti grojaraščių eilutes pradžios ekrano skiltyse.';

  @override
  String get playlistsRowSorting => 'Grojaraščių eilučių rikiavimas';

  @override
  String get playlistsRowSortingDescription =>
      'Rikiuokite grojaraščių eilutes pagal pridėjimo datą, išleidimo datą, abėcėlę ir kitus kriterijus.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Rodyti garso eilutes';

  @override
  String get displayAudioRowsSubtitle =>
      'Rodyti garso eilutes pradžios ekrano skiltyse.';

  @override
  String get audioRowsSorting => 'Garso eilučių rikiavimas';

  @override
  String get audioRowsSortingDescription =>
      'Rikiuokite garso eilutes pagal pridėjimo datą, išleidimo datą, abėcėlę ir kitus kriterijus.';

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
  String get audioPlaylists => 'Garso grojaraščiai';

  @override
  String get appearance => 'Išvaizda';

  @override
  String get layout => 'Išdėstymas';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Klaviatūra';

  @override
  String get navButtons => 'Mygtukai';

  @override
  String get rendering => 'Atvaizdavimas';

  @override
  String get mpvConfiguration => 'MPV konfigūracija';

  @override
  String get cardSize => 'Kortelės dydis';

  @override
  String get externalPlayerApp => 'Išorinio grotuvo programa';

  @override
  String get externalPlayerAppDescription =>
      'Nustatykite išorinę leistuvę, kad įjungtumėte paleidimą ilgai spaudžiant';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Rodyti programos parinkiklį, kai prasideda atkūrimas.';

  @override
  String get loadingInstalledPlayers => 'Įkeliami įdiegti grotuvai...';

  @override
  String get connection => 'Ryšys';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Praėjimas';

  @override
  String get supportedOnThisDevice => 'Palaikomas šiame įrenginyje';

  @override
  String get notSupportedOnThisDevice => 'Nepalaikomas šiame įrenginyje';

  @override
  String get mediaPlayerBehavior => 'Media Player elgesys';

  @override
  String get playbackEnhancements => 'Atkūrimo patobulinimai';

  @override
  String get alwaysOn => 'Visada įjungta.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Pakeiskite Skip Outro į kitą ekraną';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Vietoj mygtuko Skip Outro rodyti perdangą Next Up.';

  @override
  String get playerRouting => 'Žaidėjų maršrutas';

  @override
  String get preferSoftwareDecoders =>
      'Pirmenybę teikite programiniams dekoderiams';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Prieš aparatūros dekoderius naudokite FFmpeg (garso) ir libgav1 (AV1). Išjungti, jei nutrūksta HDMI garso perdavimas.';

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
  String get useExternalPlayer => 'Naudokite išorinį grotuvą';

  @override
  String get useExternalPlayerSubtitle =>
      'Atidarykite vaizdo įrašų atkūrimą pasirinktoje išorinėje programoje „Android TV“.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Automatinis eilių sudarymas';

  @override
  String get preferSdhSubtitles => 'Pirmenybė teikiama SDH subtitrams';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Automatinio pasirinkimo metu pirmenybę teikite SDH/CC subtitrų takeliams.';

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
  String get webDiagnostics => 'Interneto diagnostika';

  @override
  String get webDiagnosticsTitle => 'Moonfin Žiniatinklio diagnostika';

  @override
  String get webDiagnosticsIntro =>
      'Naudokite šį puslapį norėdami diagnozuoti naršyklės ryšio problemas (CORS, mišraus turinio ir atradimo nustatymus).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Aptiktas mišraus turinio gedimas';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Aptiktas CORS / išankstinio skrydžio gedimas';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin aptiko HTTPS puslapį, bandantį iškviesti HTTP serverio URL. Naršyklės blokuoja šią užklausą, kol ji pasiekia jūsų serverį.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin aptiko naršyklės lygio užklausos gedimą, kurį dažniausiai sukelia trūkstamos CORS arba išankstinio patikrinimo antraštės medijos serveryje.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Tikslinis URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Išsami informacija: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Dabartinis vykdymo kontekstas';

  @override
  String get webDiagnosticsOrigin => 'Kilmė';

  @override
  String get webDiagnosticsScheme => 'Schema';

  @override
  String get webDiagnosticsPluginMode => 'Papildinio režimas';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC nuskaitymas';

  @override
  String get webDiagnosticsForcedServerUrl => 'Priverstinis serverio URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Numatytasis serverio URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'Atradimo tarpinio serverio URL';

  @override
  String get notConfigured => 'nesukonfigūruotas';

  @override
  String get webDiagnosticsMixedContent => 'Mišrus turinys';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Šis puslapis įkeltas per HTTPS, bet vienas ar daugiau sukonfigūruotų URL yra HTTP. Naršyklės blokuoja HTTPS puslapius, kad jie negalėtų iškviesti HTTP API.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Pataisymas: aptarnaukite medijos serverį arba tarpinį serverį per HTTPS arba įkelkite Moonfin per HTTP tik patikimuose vietiniuose tinkluose.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Iš dabartinių vykdymo laiko nustatymų neaptikta jokios akivaizdžios mišraus turinio konfigūracijos.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS kontrolinis sąrašas';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Leisti naršyklės kilmę Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Įtraukite įgaliojimą, X-Emby-Authorization ir X-Emby-Token į Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Atskleisti turinio diapazoną ir priimti diapazoną, kad galėtumėte perduoti srautą ir ieškoti elgsenos.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Grąžinkite 204 į OPTIONS išankstinio patikrinimo užklausas.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Antraštės fragmento pavyzdys (nginx stiliaus)';

  @override
  String get note => 'Pastaba';

  @override
  String get webDiagnosticsNonWebNote =>
      'Šis diagnostikos maršrutas skirtas žiniatinklio kūrimui. Jei tai matote kitoje platformoje, šie patikrinimai gali būti netaikomi.';

  @override
  String get backToServerSelect => 'Atgal į serverį Pasirinkite';

  @override
  String get signOutAllUsers => 'Atsijungti nuo visų vartotojų';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofono leidimas visam laikui atmestas. Įjunkite jį sistemos nustatymuose.';

  @override
  String get voiceSearchPermissionRequired =>
      'Norint atlikti paiešką balsu, reikalingas mikrofono leidimas.';

  @override
  String get voiceSearchNoMatch => 'Nepagavo to. Bandykite dar kartą.';

  @override
  String get voiceSearchNoSpeechDetected => 'Kalbos neaptikta.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofono klaida.';

  @override
  String get voiceSearchNeedsInternet => 'Balso paieškai reikia interneto.';

  @override
  String get voiceSearchServiceBusy =>
      'Balso paslauga užimta. Bandykite dar kartą.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofono leidimas visam laikui atmestas.';

  @override
  String get microphonePermissionDenied => 'Mikrofono leidimas atmestas.';

  @override
  String get speechRecognitionUnavailable =>
      'Kalbos atpažinimo funkcija šiame įrenginyje nepasiekiama.';

  @override
  String get openIosRoutePicker => 'Atidarykite „iOS“ maršruto parinkiklį';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay maršruto parinkiklis nepasiekiamas šiame įrenginyje.';

  @override
  String get videos => 'Vaizdo įrašai';

  @override
  String get programs => 'Programos';

  @override
  String get songs => 'Dainos';

  @override
  String get photoAlbums => 'Nuotraukų albumai';

  @override
  String get photos => 'Nuotraukos';

  @override
  String get people => 'Žmonės';

  @override
  String get recentlyReleasedEpisodes => 'Neseniai išleisti epizodai';

  @override
  String get watchAgain => 'Žiūrėti dar kartą';

  @override
  String get guestAppearances => 'Svečių pasirodymai';

  @override
  String get appearancesSeerr => 'Pasirodymai (Seerr)';

  @override
  String get crewContributionsSeerr => 'Kūrybinės grupės darbai (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Žiūrėkite su grupe';

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
  String get disk => 'Diskas';

  @override
  String get openInBrowser => 'Atidaryti naršyklėje';

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
      'Įterptoji naršyklė šioje platformoje nepasiekiama.';

  @override
  String get adminRestartServerConfirmation =>
      'Ar tikrai norite iš naujo paleisti serverį?';

  @override
  String get adminShutdownServerConfirmation =>
      'Ar tikrai norite išjungti serverį? Turėsite jį iš naujo paleisti rankiniu būdu.';

  @override
  String get internal => 'Vidinis';

  @override
  String get idle => 'Tuščia eiga';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nerasta jokių vartotojų';

  @override
  String get adminNoUsersMatchSearch =>
      'Jūsų paiešką atitinkančių naudotojų nėra';

  @override
  String get adminNoDevicesFound => 'Nerasta jokių įrenginių';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nė vienas įrenginys neatitinka dabartinių filtrų';

  @override
  String get remoteAccess => 'Nuotolinė prieiga';

  @override
  String get localOnly => 'Tik vietinis';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Nepavyko įkelti medijos analizės';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Kombinuota analizė visose medijos bibliotekose.';

  @override
  String get analyticsTopArtists => 'Geriausi atlikėjai';

  @override
  String get analyticsTopAuthors => 'Geriausi autoriai';

  @override
  String get analyticsTopContributors => 'Geriausi bendradarbiai';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bibliotekų',
      many: '$count bibliotekos',
      few: '$count bibliotekos',
      one: '$count biblioteka',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Šiam pasirinkimui dar nėra jokių indeksuotų medijos sumų.';

  @override
  String get analyticsLibraryDetails => 'Bibliotekos informacija';

  @override
  String get analyticsLibraryBreakdown => 'Bibliotekos suskirstymas';

  @override
  String get analyticsNoLibrariesAvailable => 'Bibliotekų nėra.';

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
  String get adminServerAdministrationTitle => 'Serverio administravimas';

  @override
  String get adminServerPathData => 'Duomenys';

  @override
  String get adminServerPathImageCache => 'Vaizdo talpykla';

  @override
  String get adminServerPathCache => 'Talpykla';

  @override
  String get adminServerPathLogs => 'Rąstai';

  @override
  String get adminServerPathMetadata => 'Metaduomenys';

  @override
  String get adminServerPathTranscode => 'Perkoduoti';

  @override
  String get adminServerPathWeb => 'Žiniatinklis';

  @override
  String get adminNoServerPathsReturned =>
      'Šis serveris nepateikė jokių serverio kelių.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% panaudota';
  }

  @override
  String get userActivity => 'Vartotojo veikla';

  @override
  String get systemEvents => 'Sistemos įvykiai';

  @override
  String get needsAttention => 'Reikia dėmesio';

  @override
  String get homeVideos => 'Namų vaizdo įrašai';

  @override
  String get mixedContent => 'Mišrus turinys';

  @override
  String get homeVideosAndPhotos => 'Namų vaizdo įrašai ir nuotraukos';

  @override
  String get mixedMoviesAndShows => 'Mišrūs filmai ir laidos';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Įrašų nerasta';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension archyve vaizdų puslapių nerasta.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Įterptasis atvaizdavimo įrenginys nepavyko ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Nepavyko pateikti EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Trūksta vietinio skaitytuvo failo: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status atidarant knygos duomenis iš $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nėra skaitomos knygos galutinio taško';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nepalaikomas komiksų archyvo formatas: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR ištraukimo papildinio šioje platformoje nėra.';

  @override
  String get failedToExtractCbrArchive => 'Nepavyko išskleisti .cbr archyvo.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 ištraukimas šioje platformoje negalimas.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 ištraukimo įskiepis nepasiekiamas šioje platformoje.';

  @override
  String get loadingShuffle => 'Įkeliamas maišymas...';

  @override
  String get libraryShuffleLabel => 'BIBLIOTEKOS MAIŠYMAS';

  @override
  String get randomShuffleLabel => 'ATSITIKTINIS MAIŠYMAS';

  @override
  String get genresShuffleLabel => 'ŽANRŲ MAIŠYMAS';

  @override
  String get autoHdrSwitching => 'Automatinis HDR perjungimas';

  @override
  String get autoHdrSwitchingDescription =>
      'Automatiškai įgalinkite HDR HDR vaizdo įrašams atkurti ir atkurkite rodymo režimą išėjus.';

  @override
  String get whenFullscreen => 'Kai per visą ekraną';

  @override
  String get changeArtwork => 'Keisti viršelį';

  @override
  String get missing => 'Trūksta';

  @override
  String get clearAllArtworkButton => 'Išvalyti visus viršelius?';

  @override
  String get clearAllArtworkWarning =>
      'Ar tikrai norite išvalyti visus atsisiųstus viršelius?';

  @override
  String get confirmClear => 'Patvirtinti išvalymą';

  @override
  String confirmClearMessage(String itemType) {
    return 'Ar tikrai norite išvalyti šį elementą: $itemType?';
  }

  @override
  String get uploadButton => 'Įkelti?';

  @override
  String get resolutionLabel => 'Raiška: ';

  @override
  String get onlyShowInterfaceLanguage => 'Rodyti tik sąsajos kalbos viršelius';

  @override
  String get confirmClearAll => 'Patvirtinti visų išvalymą';

  @override
  String get imageUploadSuccess => 'Vaizdas sėkmingai įkeltas!';

  @override
  String imageUploadFailed(String error) {
    return 'Nepavyko įkelti vaizdo: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Nepavyko nustatyti vaizdo: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Nepavyko ištrinti vaizdo: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Nepavyko išvalyti visų viršelių: $error';
  }

  @override
  String get yes => 'Taip';

  @override
  String get posterCategory => 'Plakatas';

  @override
  String get backdropsCategory => 'Fono vaizdai';

  @override
  String get bannerCategory => 'Reklamjuostė';

  @override
  String get logoCategory => 'Logotipas';

  @override
  String get thumbnailCategory => 'Miniatiūra';

  @override
  String get artCategory => 'Grafika';

  @override
  String get discArtCategory => 'Disko grafika';

  @override
  String get screenshotCategory => 'Ekrano kopija';

  @override
  String get boxCoverCategory => 'Dėžutės viršelis';

  @override
  String get boxRearCoverCategory => 'Dėžutės galinis viršelis';

  @override
  String get menuArtCategory => 'Meniu grafika';

  @override
  String get confirmItemPoster => 'plakatas';

  @override
  String get confirmItemBackdrop => 'fono vaizdas';

  @override
  String get confirmItemBanner => 'reklamjuostė';

  @override
  String get confirmItemLogo => 'logotipas';

  @override
  String get confirmItemThumbnail => 'miniatiūra';

  @override
  String get confirmItemArt => 'grafika';

  @override
  String get confirmItemDiscArt => 'disko grafika';

  @override
  String get confirmItemScreenshot => 'ekrano kopija';

  @override
  String get confirmItemBoxCover => 'dėžutės viršelis';

  @override
  String get confirmItemBoxRearCover => 'dėžutės galinis viršelis';

  @override
  String get confirmItemMenuArt => 'meniu grafika';

  @override
  String get resolutionAll => 'Visos';

  @override
  String get resolutionHigh => 'Aukšta (1080p+)';

  @override
  String get resolutionMedium => 'Vidutinė (720p)';

  @override
  String get resolutionLow => 'Žema (<720p)';

  @override
  String get sources => 'Šaltiniai';

  @override
  String get audiobookChapters => 'Skyriai';

  @override
  String get audiobookBookmarks => 'Žymės';

  @override
  String get audiobookNotes => 'Pastabos';

  @override
  String get audiobookQueue => 'Eilė';

  @override
  String get audiobookTimeline => 'Laiko juosta';

  @override
  String get audiobookTimelineEmpty => 'Laiko juosta tuščia';

  @override
  String get audiobookFocusedTimeline => 'Sutelkta laiko juosta';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Eksportuoti žymes';

  @override
  String get audiobookExportNotes => 'Eksportuoti pastabas';

  @override
  String get audiobookExportAll => 'Eksportuoti viską';

  @override
  String audiobookExportSuccess(String path) {
    return 'Eksportuota į $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Eksportuoti nepavyko: $error';
  }

  @override
  String get audiobookLyrics => 'Dainų tekstai';

  @override
  String get audiobookAddBookmark => 'Pridėti žymę';

  @override
  String get audiobookAddNote => 'Pridėti pastabą';

  @override
  String get audiobookEditNote => 'Redaguoti pastabą';

  @override
  String get audiobookNoteHint => 'Parašykite pastabą šiai akimirkai';

  @override
  String get audiobookSleepTimer => 'Miego laikmatis';

  @override
  String get audiobookSleepOff => 'Išjungta';

  @override
  String get audiobookSleepEndOfChapter => 'Skyriaus pabaigoje';

  @override
  String get audiobookSleepCustom => 'Pasirinktinis';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Liko $remaining';
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
  String get audiobookPlaybackSpeed => 'Atkūrimo greitis';

  @override
  String get audiobookRemainingTime => 'Liko';

  @override
  String get audiobookElapsedTime => 'Praėjo';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Atgal $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Pirmyn $seconds s';
  }

  @override
  String get audiobookPreviousChapter => 'Ankstesnis skyrius';

  @override
  String get audiobookNextChapter => 'Kitas skyrius';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$current skyrius iš $total';
  }

  @override
  String get audiobookNoChapters => 'Skyrių nėra';

  @override
  String get audiobookNoBookmarks => 'Žymių dar nėra';

  @override
  String get audiobookNoNotes => 'Pastabų dar nėra';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Žymė pridėta ties $position';
  }

  @override
  String get audiobookSpeedReset => 'Atstatyti į 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Išsaugoti';

  @override
  String get audiobookCancel => 'Atšaukti';

  @override
  String get audiobookDelete => 'Ištrinti';

  @override
  String get subtitlePreferencesDescription =>
      'Keiskite subtitrų režimus, numatytąsias kalbas, išvaizdą ir atvaizdavimo parinktis.';

  @override
  String get subtitleRendering => 'Subtitrų atvaizdavimas';

  @override
  String get displayOptions => 'Rodymo parinktys';

  @override
  String get releaseDateAscending => 'Išleidimo data (didėjančiai)';

  @override
  String get releaseDateDescending => 'Išleidimo data (mažėjančiai)';

  @override
  String get groupContributions => 'Grupuoti darbus';

  @override
  String get groupMultipleRoles => 'Grupuoti kelis vaidmenis';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Įspėjimas apie bibliotekos rašymo teises';

  @override
  String get libraryWriteAccessHowToFix => 'Kaip tai ištaisyti:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Suteikite Jellyfin tarnybos naudotojui (pvz., jellyfin arba Docker PUID/PGID) rašymo teises į serveryje esančius medijos bibliotekos aplankus.\n\n2. Arba eikite į Jellyfin valdymo skydelį -> Bibliotekos, redaguokite šią biblioteką ir išjunkite parinktį „Įrašyti viršelius į medijos aplankus“, kad viršeliai būtų saugomi vidinėje Jellyfin duomenų bazėje.';

  @override
  String get dismiss => 'Atmesti';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Jūsų biblioteka „$libraryName“ sukonfigūruota įrašyti viršelius tiesiai į medijos aplankus (įjungta parinktis „Įrašyti viršelius į medijos aplankus“). Tačiau Jellyfin patikrino rašymo teises ir neturi leidimo įrašyti failų į šį katalogą:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Panašu, kad Jellyfin nepavyko atnaujinti viršelio. Jūsų biblioteka sukonfigūruota įrašyti viršelius tiesiai į medijos aplankus (įjungta parinktis „Įrašyti viršelius į medijos aplankus“). Ši klaida paprastai atsiranda, kai Jellyfin serverio procesas neturi leidimo įrašyti failų į jūsų medijos katalogus.';

  @override
  String get replay => 'Paleisti iš naujo';

  @override
  String get fileInformation => 'Failo informacija';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Dydis: $size  •  Formatas: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Rodyti visus garso takelius ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Rodyti visus subtitrų takelius ($count)';
  }

  @override
  String get checkingDirectPlay => 'Tikrinama tiesioginio atkūrimo galimybė...';

  @override
  String get directPlayCapabilityLabel => 'Tiesioginio atkūrimo galimybė: ';

  @override
  String get forced => 'Priverstiniai';

  @override
  String get transcodeContainerNotSupported =>
      'Leistuvė nepalaiko konteinerio formato.';

  @override
  String get transcodeVideoCodecNotSupported => 'Vaizdo kodekas nepalaikomas.';

  @override
  String get transcodeAudioCodecNotSupported => 'Garso kodekas nepalaikomas.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Subtitrų formatas nepalaikomas (reikia įdeginti).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Garso profilis nepalaikomas.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Vaizdo profilis nepalaikomas.';

  @override
  String get transcodeVideoLevelNotSupported => 'Vaizdo lygis nepalaikomas.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Šis įrenginys nepalaiko vaizdo raiškos.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Vaizdo bitų gylis nepalaikomas.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Vaizdo kadrų dažnis nepalaikomas.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Failo bitų sparta viršija leistuvės transliavimo limitą.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Vaizdo bitų sparta viršija transliavimo limitą.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Garso bitų sparta viršija transliavimo limitą.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Garso kanalų skaičius nepalaikomas.';

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
  String get sortAlphabetical => 'Pagal abėcėlę';

  @override
  String get sortReleaseAscending => 'Išleidimo tvarka (didėjančiai)';

  @override
  String get sortReleaseDescending => 'Išleidimo tvarka (mažėjančiai)';

  @override
  String get sortCustomDragDrop => 'Pasirinktinė (vilkimu)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Grojaraščio rikiavimo parinktys';

  @override
  String get resetSort => 'Atstatyti rikiavimą';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Žiūrėti iš naujo S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Žiūrėti grojaraštį iš naujo';

  @override
  String get noSubtitlesFound => 'Subtitrų nerasta.';

  @override
  String get adminControls => 'Administratoriaus valdikliai';

  @override
  String get impellerRendering => 'Atvaizdavimo variklis (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller – modernus Flutter GPU atvaizdavimo variklis, užtikrinantis sklandesnes animacijas ir mažiau trūkčiojimų. Kai kuriuose TV priedėliuose ir senesniuose GPU jis gali sukelti trikdžius ar juodą vaizdą; tokiu atveju jį išjunkite. „Automatinis“ parenka geriausią numatytąjį variantą jūsų įrenginiui. Kad pakeitimai įsigaliotų, paleiskite Moonfin iš naujo.';

  @override
  String get impellerAuto => 'Automatinis';

  @override
  String get impellerOn => 'Įjungta';

  @override
  String get impellerOff => 'Išjungta';

  @override
  String get impellerRestartTitle => 'Reikia paleisti iš naujo';

  @override
  String get impellerRestartMessage =>
      'Kad būtų pakeistas atvaizdavimo variklis, Moonfin reikia paleisti iš naujo. Uždarykite programą dabar ir vėl ją atidarykite.';

  @override
  String get impellerCloseNow => 'Uždaryti programą dabar';

  @override
  String get adminRefreshLibrary => 'Atnaujinti biblioteką';

  @override
  String get adminRefreshAllLibraries => 'Atnaujinti visas bibliotekas';

  @override
  String get adminRepoSortDateOldest => 'Pridėjimo data (nuo seniausių)';

  @override
  String get adminRepoSortDateNewest => 'Pridėjimo data (nuo naujausių)';

  @override
  String get adminRepoSortNameAsc => 'Pagal abėcėlę (A–Z)';

  @override
  String get adminRepoSortNameDesc => 'Pagal abėcėlę (Z–A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Įkeliama serverio analitika... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Kaip šaltinio';

  @override
  String get imdbTop250Movies => 'IMDb 250 geriausių filmų';

  @override
  String get imdbTop250TvShows => 'IMDb 250 geriausių serialų';

  @override
  String get imdbMostPopularMovies => 'IMDb populiariausi filmai';

  @override
  String get imdbMostPopularTvShows => 'IMDb populiariausi serialai';

  @override
  String get imdbLowestRatedMovies => 'IMDb prasčiausiai vertinami filmai';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb geriausiai vertinami filmai anglų kalba';

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
  String get integrations => 'Integracijos';

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
