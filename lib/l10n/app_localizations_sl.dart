// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

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
  String get interfaceLanguage => 'Jezik vmesnika';

  @override
  String get systemLanguageDefault => 'Privzeto sistemsko';

  @override
  String get signIn => 'Prijavite se';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Prazno';

  @override
  String connectingToServer(String serverName) {
    return 'Povezovanje s strežnikom $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Geslo';

  @override
  String get username => 'Uporabniško ime';

  @override
  String get email => 'E-pošta';

  @override
  String get quickConnectInstruction =>
      'Vnesite to kodo na spletno nadzorno ploščo vašega strežnika:';

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
  String get waitingForAuthorization => 'Čakanje na avtorizacijo ...';

  @override
  String get back => 'Nazaj';

  @override
  String get serverUnavailable => 'Strežnik ni na voljo';

  @override
  String get loginFailed => 'Prijava ni uspela';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect ni na voljo: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect ni na voljo ($status): $detail';
  }

  @override
  String get whosWatching => 'Kdo gleda?';

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
  String get addUser => 'Dodaj uporabnika';

  @override
  String get selectServer => 'Izberite Strežnik';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin različica $version';
  }

  @override
  String get savedServers => 'Shranjeni strežniki';

  @override
  String get discoveredServers => 'Odkriti strežniki';

  @override
  String get noneFound => 'Noben najden';

  @override
  String get unableToConnectToServer =>
      'Ni mogoče vzpostaviti povezave s strežnikom';

  @override
  String get addServer => 'Dodaj strežnik';

  @override
  String get embyConnect => 'Emby Povežite se';

  @override
  String get removeServer => 'Odstrani strežnik';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Ali želite odstraniti »$serverName« s seznama strežnikov?';
  }

  @override
  String get cancel => 'Prekliči';

  @override
  String get remove => 'Odstrani';

  @override
  String get connectToServer => 'Povežite se s strežnikom';

  @override
  String get serverAddress => 'Naslov strežnika';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Povežite se';

  @override
  String get secureStorageUnavailable => 'Varna shramba ni na voljo';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin ni mogel dostopati do vašega sistemskega obeska za ključe. Prijava se lahko nadaljuje, vendar varno shranjevanje žetonov morda ne bo na voljo, dokler se obesek za ključe ne odklene.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema aplikacije';

  @override
  String get detailScreenStyle => 'Slog zaslona s podrobnostmi';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasični je izvirna sredinska postavitev Moonfin. Sodobni je odzivna filmska postavitev.';

  @override
  String get detailScreenStyleMoonfin => 'Klasični';

  @override
  String get detailScreenStyleModern => 'Sodobni';

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
  String get expandedTabs => 'Razširjeni zavihki';

  @override
  String get expandedTabsSubtitle =>
      'Samodejno prikaži vsebino zavihka med brskanjem po zavihkih. Izklopite, če želite zavihke odpirati in zapirati ročno.';

  @override
  String get showTechnicalDetails => 'Prikaz tehničnih podrobnosti?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Prikaži kodek, ločljivost in podatke o pretoku v povzetku pasice';

  @override
  String get recommendationSystem => 'Sistem priporočil';

  @override
  String get recommendationSystemSubtitle =>
      'Uporabite algoritem Moonfin priporoča za lokalno knjižnico ali spletne metrike podobnosti TMDb. Opomba: spletna priporočila zahtevajo integracijo Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin priporoča';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Podobnost TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Uporaba omejitve starševske ocene?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Omeji predloge funkcije Moonfin priporoča glede na starševsko oceno ciljne vsebine';

  @override
  String get interfaceStyle => 'Slog vmesnika';

  @override
  String get interfaceStyleSubtitle =>
      'Samodejni se prilagodi vaši napravi. Izberite Apple ali Material, če želite vsiliti videz.';

  @override
  String get interfaceStyleAutomatic => 'Samodejni';

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
  String get glassQuality => 'Kakovost stekla';

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
      'Samodejna izbere najboljši učinek stekla za to napravo. Polna vsili pravo zabrisanost, Zmanjšana uporabi lahko steklo, ki varčuje z močjo GPU.';

  @override
  String get glassQualityAuto => 'Samodejna';

  @override
  String get glassQualityFull => 'Polna';

  @override
  String get glassQualityReduced => 'Zmanjšana';

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
      'Preklapljajte med Moonfin in Neon Pulse brez ponovnega zagona aplikacije';

  @override
  String get customThemeTitle => 'Tema po meri';

  @override
  String get customThemeSubtitle =>
      'Teme po meri spremenijo vizualne elemente po celotnem Moonfinu. Izberite možnost, ki ustreza vašemu slogu.';

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
      'Trenutni videz Moonfin, ki ste ga vsi vzljubili';

  @override
  String get themeNeonPulse => 'Neonski utrip';

  @override
  String get themeNeonPulseSubtitle =>
      'Oblikovanje Synthwave z magenta sijajem, cian besedilom in močnejšim kromiranim kontrastom';

  @override
  String get themeGlass => 'Steklo';

  @override
  String get themeGlassSubtitle =>
      'Slog tekočega stekla z drsečim gradientnim ozadjem, motnimi površinami in modrim poudarkom Apple';

  @override
  String get theme8BitHero => '8-bitni junak';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro slog pikselske grafike z izrazito paleto, oglatimi robovi, ostrimi sencami in pikselsko pisavo';

  @override
  String get embyConnectSignInSubtitle =>
      'Prijavite se s svojim računom Emby Connect';

  @override
  String get emailOrUsername => 'E-pošta ali uporabniško ime';

  @override
  String get selectAServer => 'Izberite strežnik';

  @override
  String get tryAgain => 'Poskusi znova';

  @override
  String get noLinkedServers =>
      'S tem računom Emby Connect ni povezan noben strežnik';

  @override
  String get invalidEmbyConnectCredentials =>
      'Neveljavne poverilnice Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Neveljavno uporabniško ime ali geslo Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Strežnik ne podpira izmenjave Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Omrežna napaka med vzpostavljanjem stika z Emby Connect ali izbranim strežnikom';

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
  String get loadingLinkedServers => 'Nalaganje povezanih strežnikov ...';

  @override
  String get connectingToServerEllipsis => 'Povezovanje s strežnikom ...';

  @override
  String get noReachableAddress => 'Ni dosegljivega naslova';

  @override
  String get invalidServerExchangeResponse =>
      'Neveljaven odgovor končne točke izmenjave strežnika';

  @override
  String unableToConnectTo(String target) {
    return 'Povezava z $target ni mogoča';
  }

  @override
  String get exitApp => 'Želite zapustiti Moonfin?';

  @override
  String get exitAppConfirmation => 'Ste prepričani, da želite zapustiti?';

  @override
  String get exit => 'Izhod';

  @override
  String get gameMenu => 'Meni';

  @override
  String get gamePaused => 'Zaustavljeno';

  @override
  String get gameSaveState => 'Shrani stanje';

  @override
  String get games => 'Igre';

  @override
  String get gameLoadState => 'Naloži stanje';

  @override
  String get gameFastForward => 'Hitro naprej';

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
  String get gameEmulatorSettings => 'Nastavitve emulatorja';

  @override
  String get gameNoCoreOptions => 'To jedro nima nastavljivih možnosti.';

  @override
  String get gameHoldToOpenMenu => 'Pridržite za odpiranje menija';

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
      'Igranje iger na tej napravi še ni podprto.';

  @override
  String get noHomeRowsLoaded =>
      'Nobene domače vrstice ni bilo mogoče naložiti';

  @override
  String get noHomeRowsHint =>
      'Poskusite osvežiti ali zmanjšati aktivne domače razdelke.';

  @override
  String get retryHomeRows => 'Poskusite znova domače vrstice';

  @override
  String get guide => 'Vodnik';

  @override
  String get recordings => 'Posnetki';

  @override
  String get schedule => 'Urnik';

  @override
  String get series => 'Serije';

  @override
  String get noItemsFound => 'Ni elementov';

  @override
  String get home => 'Domov';

  @override
  String get browseAll => 'Prebrskaj vse';

  @override
  String get genres => 'Žanri';

  @override
  String get collectionPlaceholder => 'Tukaj bodo prikazani elementi zbirke';

  @override
  String get browseByLetter => 'Prebrskaj po črki';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Tukaj se prikaže abecedno brskanje';

  @override
  String get suggestions => 'Predlogi';

  @override
  String get suggestionsPlaceholder =>
      'Predlagani elementi bodo prikazani tukaj';

  @override
  String get failedToLoadLibraries => 'Nalaganje knjižnic ni uspelo';

  @override
  String get noLibrariesFound => 'Ni knjižnic';

  @override
  String get library => 'Knjižnica';

  @override
  String get displaySettings => 'Nastavitve zaslona';

  @override
  String get allGenres => 'Vsi žanri';

  @override
  String get noGenresFound => 'Ni najdenih žanrov';

  @override
  String failedToLoadFolderError(String error) {
    return 'Mape ni bilo mogoče naložiti: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ta mapa je prazna';

  @override
  String itemCountLabel(int count) {
    return '$count elementov';
  }

  @override
  String get failedToLoadFavorites => 'Nalaganje priljubljenih ni uspelo';

  @override
  String get retry => 'Poskusite znova';

  @override
  String get noFavoritesYet => 'Ni še priljubljenih';

  @override
  String get favorites => 'Priljubljene';

  @override
  String totalCountItems(int count) {
    return '$count elementov';
  }

  @override
  String get continuing => 'Nadaljevanje';

  @override
  String get ended => 'Končano';

  @override
  String get sortAndFilter => 'Razvrsti in filtriraj';

  @override
  String get type => 'Vrsta';

  @override
  String get sortBy => 'Razvrsti po';

  @override
  String get display => 'Zaslon';

  @override
  String get imageType => 'Vrsta slike';

  @override
  String get posterSize => 'Velikost plakata';

  @override
  String get small => 'majhna';

  @override
  String get medium => 'Srednje';

  @override
  String get large => 'Velik';

  @override
  String get extraLarge => 'Zelo velik';

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
  String get views => 'Pogledi';

  @override
  String get albums => 'Albumi';

  @override
  String get albumArtists => 'Izvajalci albuma';

  @override
  String get artists => 'Izvajalci';

  @override
  String get bookmarks => 'Zaznamki';

  @override
  String get noSavedBookmarks => 'Za ta naslov še ni shranjenih zaznamkov.';

  @override
  String get openBook => 'Odpri knjigo';

  @override
  String get chapter => 'poglavje';

  @override
  String get page => 'Stran';

  @override
  String get bookmark => 'Zaznamek';

  @override
  String get justNow => 'Pravkar';

  @override
  String minutesAgo(int count) {
    return 'pred $count min';
  }

  @override
  String hoursAgo(int count) {
    return 'pred $count h';
  }

  @override
  String daysAgo(int count) {
    return 'pred $count d';
  }

  @override
  String get discoverySubjects => 'Predmeti odkrivanja';

  @override
  String get apply => 'Uporabi';

  @override
  String get openLink => 'Odprite povezavo';

  @override
  String get scanWithYourPhone => 'Skenirajte s telefonom';

  @override
  String get audiobookGenres => 'Zvrsti zvočnih knjig';

  @override
  String get scrollLeft => 'Pomaknite se levo';

  @override
  String get scrollRight => 'Pomaknite se desno';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre => 'Te zvrsti trenutno ni bilo mogoče naložiti.';

  @override
  String get continueReading => 'Nadaljujte z branjem';

  @override
  String get savedHighlights => 'Shranjeni poudarki';

  @override
  String get continueListening => 'Nadaljujte s poslušanjem';

  @override
  String get listen => 'poslušaj';

  @override
  String get resume => 'Nadaljuj';

  @override
  String get failedToLoadLibrary => 'Nalaganje knjižnice ni uspelo';

  @override
  String get popularNow => 'Priljubljeno zdaj';

  @override
  String get savedForLater => 'Shranjeno za pozneje';

  @override
  String get topListens => 'Najboljše poslušanje';

  @override
  String get unreadDiscoveries => 'Neprebrana odkritja';

  @override
  String get pickUpAgain => 'Poberi znova';

  @override
  String get bookHighlightsDescription =>
      'Vaše knjige z vrhunci, priljubljenimi ali napredkom pri branju.';

  @override
  String get handPickedFromLibrary => 'Ročno izbrano iz vaše knjižnice.';

  @override
  String get handPickedFromListeningQueue =>
      'Ročno izbrano iz vaše čakalne vrste za poslušanje.';

  @override
  String get booksWithHighlights =>
      'Knjige z vrhunci, priljubljenimi ali napredkom pri branju.';

  @override
  String get jumpBackNarration =>
      'Skočite nazaj v pripoved, ne da bi iskali svoje mesto.';

  @override
  String get unreadBooksReady =>
      'Neprebrane knjige pripravljene za naslednjo tiho uro.';

  @override
  String get quickAccessFavorites =>
      'Hiter dostop do knjig, h katerim se vedno znova vračate.';

  @override
  String get searchAudiobooks => 'Iskanje zvočnih knjig';

  @override
  String get searchYourLibrary => 'Poiščite svojo knjižnico';

  @override
  String get pickUpStory => 'Nadaljujte zgodbo tam, kjer ste jo končali';

  @override
  String get savedPlacesChapters =>
      'Vaša shranjena mesta in nedokončana poglavja';

  @override
  String authorsCount(int count) {
    return '$count avtorjev';
  }

  @override
  String genresCount(int count) {
    return '$count žanrov';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent % dokončano';
  }

  @override
  String get readyWhenYouAre => 'Pripravljeni, ko ste';

  @override
  String get details => 'Podrobnosti';

  @override
  String get listeningRoom => 'Soba za poslušanje';

  @override
  String get bookmarksAndProgress => 'Zaznamki in napredek';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count naslovov, urejenih za brskanje s poudarkom na branju.';
  }

  @override
  String get titles => 'Naslovi';

  @override
  String get allTitles => 'Vsi naslovi';

  @override
  String get authors => 'Avtorji';

  @override
  String get browseByAuthor => 'Brskaj po avtorju';

  @override
  String get browseByGenre => 'Brskanje po zvrsti';

  @override
  String get discover => 'Odkrij';

  @override
  String get noBookmarkedItems => 'Zaznamkov še ni';

  @override
  String get nothingMatchesSection =>
      'Nič se še ne ujema s tem razdelkom. Poskusite z drugim zavihkom ali se vrnite, ko se sinhronizacija knjižnice konča.';

  @override
  String get audiobooks => 'Zvočne knjige';

  @override
  String noLabelFound(String label) {
    return 'Ni rezultatov: $label';
  }

  @override
  String get folder => 'Mapa';

  @override
  String get filters => 'Filtri';

  @override
  String get readingStatus => 'Stanje branja';

  @override
  String get playedStatus => 'Igrano stanje';

  @override
  String get readStatus => 'Preberi';

  @override
  String get watched => 'Ogledano';

  @override
  String get unread => 'Neprebrano';

  @override
  String get unwatched => 'Neogledano';

  @override
  String get seriesStatus => 'Stanje serije';

  @override
  String get allLibraries => 'Vse knjižnice';

  @override
  String get books => 'knjige';

  @override
  String get latestBooks => 'Najnovejše knjige';

  @override
  String get latestAudiobooks => 'Najnovejše zvočne knjige';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knjig',
      few: '$count knjige',
      two: '$count knjigi',
      one: '1 knjiga',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Knjiga';

  @override
  String get bookFormatAudiobook => 'Zvočna knjiga';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Za tega avtorja ni bilo najdenih knjig.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent % prebrano';
  }

  @override
  String bookTimeLeft(String time) {
    return 'še $time';
  }

  @override
  String get bookHeroRead => 'Beri';

  @override
  String get bookHeroListen => 'Poslušaj';

  @override
  String get author => 'Avtor';

  @override
  String get unknownAuthor => 'Neznani avtor';

  @override
  String get uncategorized => 'Nekategorizirano';

  @override
  String get overview => 'Pregled';

  @override
  String get noLibrivoxDescription =>
      'LibriVox še ni zagotovil opisa za ta naslov.';

  @override
  String get readers => 'Bralci';

  @override
  String get openLinks => 'Odprite povezave';

  @override
  String get librivoxPage => 'Stran LibriVox';

  @override
  String get internetArchive => 'Internetni arhiv';

  @override
  String get rssFeed => 'Vir RSS';

  @override
  String get downloadZip => 'Prenesite Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count razdelkov';
  }

  @override
  String firstPublished(int year) {
    return 'Prva izdaja $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Za ta naslov v Open Library še ni na voljo pregleda.';

  @override
  String get subjects => 'Predmeti';

  @override
  String get all => 'Vse';

  @override
  String booksCount(int count) {
    return '$count knjig';
  }

  @override
  String get couldNotLoadSubject => 'Te teme trenutno ni bilo mogoče naložiti.';

  @override
  String get audiobookDetails => 'Podrobnosti zvočne knjige';

  @override
  String authorsCountTitle(int count) {
    return '$count avtorjev';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zvočnih knjig',
      few: '$count zvočne knjige',
      two: '$count zvočni knjigi',
      one: '1 zvočna knjiga',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Seznam skladb';

  @override
  String get itemListPlaceholder => 'Tukaj se prikaže seznam predmetov';

  @override
  String get failedToLoad => 'Nalaganje ni uspelo';

  @override
  String get delete => 'Izbriši';

  @override
  String get save => 'Shrani';

  @override
  String get moreLikeThis => 'Več podobnih';

  @override
  String get castAndCrew => 'Igralci in ekipa';

  @override
  String get collection => 'Zbirka';

  @override
  String get episodes => 'Epizode';

  @override
  String get nextUp => 'Naprej';

  @override
  String get seasons => 'Sezone';

  @override
  String get chapters => 'Poglavja';

  @override
  String get features => 'Lastnosti';

  @override
  String get movies => 'Filmi';

  @override
  String get musicVideos => 'Glasbeni videi';

  @override
  String get other => 'drugo';

  @override
  String get discography => 'Diskografija';

  @override
  String get similarArtists => 'Podobni izvajalci';

  @override
  String get tableOfContents => 'Kazalo';

  @override
  String get tracklist => 'Seznam skladb';

  @override
  String discNumber(int number) {
    return 'Disk $number';
  }

  @override
  String get biography => 'Biografija';

  @override
  String get authorDetails => 'Podrobnosti avtorja';

  @override
  String get noOverviewAvailable => 'Za ta naslov še ni na voljo pregleda.';

  @override
  String get noBiographyAvailable => 'Za tega avtorja ni na voljo biografije.';

  @override
  String get unableToLoadAuthorDetails =>
      'Podatkov o avtorju trenutno ni mogoče naložiti.';

  @override
  String published(int year) {
    return 'Izdano $year';
  }

  @override
  String get publicationDateUnknown => 'Datum objave neznan';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sezon',
      few: '$count sezone',
      two: '$count sezoni',
      one: '1 sezona',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Konec ob $time';
  }

  @override
  String get items => 'Elementi';

  @override
  String get extras => 'Dodatki';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Izza kulis';

  @override
  String get deletedScenes => 'Izbrisani prizori';

  @override
  String get featurettes => 'Kratki dokumentarci';

  @override
  String get interviews => 'Intervjuji';

  @override
  String get scenes => 'Prizori';

  @override
  String get shorts => 'Kratki filmi';

  @override
  String get trailers => 'Napovedniki';

  @override
  String timeRemaining(String time) {
    return 'še $time';
  }

  @override
  String endsIn(String time) {
    return 'Konec čez $time';
  }

  @override
  String get view => 'Pogled';

  @override
  String get resumeReading => 'Nadaljujte z branjem';

  @override
  String get read => 'Preberi';

  @override
  String resumeFrom(String position) {
    return 'Nadaljuj od $position';
  }

  @override
  String get play => 'Predvajaj';

  @override
  String get startOver => 'Začni znova';

  @override
  String get restart => 'Znova zaženite';

  @override
  String get readOffline => 'Preberite brez povezave';

  @override
  String get playOffline => 'Igrajte brez povezave';

  @override
  String get audio => 'Avdio';

  @override
  String get subtitles => 'Podnapisi';

  @override
  String get version => 'Različica';

  @override
  String get cast => 'Predvajaj v napravi';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Napovednik';

  @override
  String get finished => 'Končano';

  @override
  String get favorited => 'Med priljubljene';

  @override
  String get favorite => 'Najljubša';

  @override
  String get playlist => 'Seznam predvajanja';

  @override
  String get downloaded => 'Preneseno';

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
  String get downloadAll => 'Prenesi vse';

  @override
  String get download => 'Prenos';

  @override
  String get deleteDownloaded => 'Izbriši preneseno';

  @override
  String get goToSeries => 'Pojdite na Serije';

  @override
  String get editMetadata => 'Uredi metapodatke';

  @override
  String get less => 'Manj';

  @override
  String get more => 'več';

  @override
  String get deleteItem => 'Izbriši predmet';

  @override
  String get deletePlaylist => 'Izbriši seznam predvajanja';

  @override
  String get deletePlaylistMessage =>
      'Želite ta seznam predvajanja izbrisati iz strežnika?';

  @override
  String get deleteItemMessage => 'Želite izbrisati ta element iz strežnika?';

  @override
  String get failedToDeletePlaylist =>
      'Seznama predvajanja ni bilo mogoče izbrisati';

  @override
  String get failedToDeleteItem => 'Elementa ni bilo mogoče izbrisati';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Preimenuj seznam predvajanja';

  @override
  String get playlistName => 'Ime seznama predvajanja';

  @override
  String get deleteDownloadedAlbum => 'Izbriši preneseni album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Ali želite izbrisati prenesene skladbe za »$title«?';
  }

  @override
  String get downloadedTracksDeleted => 'Prenesene skladbe izbrisane';

  @override
  String get downloadedTracksDeleteFailed =>
      'Nekaterih prenesenih skladb ni bilo mogoče izbrisati';

  @override
  String get noTracksLoaded => 'Ni naloženih skladb';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Ni naloženih elementov: $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Prenašanje $title ($count elementov)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Ali ste prepričani, da želite izbrisati »$name« s strežnika? Tega dejanja ni mogoče razveljaviti.';
  }

  @override
  String get itemDeleted => 'Element izbrisan';

  @override
  String get noPlayableTrailerFound => 'Najden ni bil predvajan napovednik.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Nepodprta oblika knjige: .$extension';
  }

  @override
  String get audioTrack => 'Zvočni posnetek';

  @override
  String get subtitleTrack => 'Skladba s podnapisi';

  @override
  String get none => 'Brez';

  @override
  String get downloadSubtitlesLabel => 'Prenesi podnapise ...';

  @override
  String get searchOpenSubtitlesPlugin => 'Iščite z vtičnikom OpenSubtitles';

  @override
  String get downloadSubtitles => 'Prenesi podnapise';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'Izbrani podnaslov je neveljaven.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Podnapisi preneseni in izbrani: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Podnaslov prenesen. Morda bo trajalo nekaj trenutkov, da se prikaže, medtem ko Jellyfin osveži element.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Za jezik $language ni najdenih oddaljenih podnapisov.';
  }

  @override
  String get selectVersion => 'Izberite različico';

  @override
  String versionNumber(int number) {
    return 'Različica $number';
  }

  @override
  String get downloadAllQuality => 'Prenesite vse — kakovost';

  @override
  String get downloadQuality => 'Kakovost prenosa';

  @override
  String get originalFileNoReencoding =>
      'Izvirna datoteka, brez ponovnega kodiranja';

  @override
  String get originalFilesNoReencoding =>
      'Izvirne datoteke, brez ponovnega kodiranja';

  @override
  String get noEpisodesLoaded => 'Ni naloženih epizod';

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
    return 'Prenašanje $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Izbriši prenesene datoteke';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Ali želite izbrisati lokalne datoteke za $typeLabel?\n\nS tem boste sprostili prostor v shrambi. Pozneje jih lahko znova prenesete.';
  }

  @override
  String get downloadedFilesDeleted => 'Prenesene datoteke izbrisane';

  @override
  String get failedToDeleteFiles => 'Brisanje datotek ni uspelo';

  @override
  String get deleteFiles => 'Izbriši datoteke';

  @override
  String get director => 'DIREKTOR';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'REŽISERJI';

  @override
  String get writer => 'SCENARIST';

  @override
  String get writers => 'SCENARISTI';

  @override
  String get studio => 'GARSONJERA';

  @override
  String studioMoreCount(int count) {
    return '+$count več';
  }

  @override
  String totalEpisodes(int count) {
    return '$count epizod';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Epizoda $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Poglavje $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skladb',
      few: '$count skladbe',
      two: '$count skladbi',
      one: '1 skladba',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poglavij',
      few: '$count poglavja',
      two: '$count poglavji',
      one: '1 poglavje',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Rojstvo $date';
  }

  @override
  String died(String date) {
    return 'Smrt $date';
  }

  @override
  String age(int age) {
    return 'Starost $age';
  }

  @override
  String get showLess => 'Pokaži manj';

  @override
  String get readMore => 'Preberi več';

  @override
  String get shuffle => 'Naključno';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Naključno predvajaj vso glasbo';

  @override
  String get carSignInPrompt => 'Prijavite se v Moonfin na telefonu';

  @override
  String get carServerUnreachable => 'Strežnik ni dosegljiv';

  @override
  String downloadsCount(int count) {
    return '$count prenosov';
  }

  @override
  String get perfectMatch => 'Popolno ujemanje';

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
    return 'Dejanje oddaljenih podnapisov ($action) za tega uporabnika zahteva dovoljenje Jellyfin za upravljanje podnapisov.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Tega elementa ni bilo mogoče najti na strežniku za dejanje oddaljenih podnapisov ($action).';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Dejanje oddaljenih podnapisov ($action) ni uspelo: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Dejanje oddaljenih podnapisov ($action) ni uspelo (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Dejanja $action za oddaljene podnapise ni bilo mogoče izvesti.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'vse prenesene epizode za »$name«';
  }

  @override
  String get deleteSeasonFiles => 'vse prenesene epizode v tej sezoni';

  @override
  String get stillWatching => 'Še gledate?';

  @override
  String get unableToLoadTrailerStream =>
      'Ni mogoče naložiti toka napovednika.';

  @override
  String get trailerTimedOut =>
      'Časovna omejitev napovednika med nalaganjem je potekla.';

  @override
  String get playbackFailedForTrailer =>
      'Predvajanje tega napovednika ni uspelo.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Predvajanje med predvajanjem brez povezave ni na voljo.';

  @override
  String castActionFailed(String label, String error) {
    return 'Dejanje $label ni uspelo: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Glasnosti predvajanja na napravi ni bilo mogoče nastaviti: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Upravljanje $label';
  }

  @override
  String get deviceVolume => 'Glasnost naprave';

  @override
  String get unavailable => 'Ni na voljo';

  @override
  String get pause => 'Premor';

  @override
  String get syncPosition => 'Položaj sinhronizacije';

  @override
  String stopCast(String label) {
    return 'Ustavi $label';
  }

  @override
  String get queueIsEmpty => 'Čakalna vrsta je prazna';

  @override
  String trackNumber(int number) {
    return 'Skladba $number';
  }

  @override
  String get remotePlayback => 'Oddaljeno predvajanje';

  @override
  String get castingToGoogleCast => 'Predvajanje v Google Cast';

  @override
  String get castingViaAirPlay => 'Predvajanje prek AirPlay';

  @override
  String get castingViaDlna => 'Predvajanje prek DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekund';
  }

  @override
  String get longPressToUnlock => 'Dolgo pritisnite za odklepanje';

  @override
  String get off => 'Izklopljeno';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Avto';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mb/s';
  }

  @override
  String get audioDelay => 'Zakasnitev zvoka';

  @override
  String delayMinusMs(int value) {
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
  }

  @override
  String get subtitleDelay => 'Zakasnitev podnapisov';

  @override
  String get reset => 'Ponastavi';

  @override
  String get unknown => 'Neznano';

  @override
  String get playbackInformation => 'Informacije o predvajanju';

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
  String get playback => 'Predvajanje';

  @override
  String get playMethod => 'Igralna metoda';

  @override
  String get directPlay => 'Neposredno predvajanje';

  @override
  String get directStream => 'Neposredni tok';

  @override
  String get transcoding => 'Prekodiranje';

  @override
  String get transcodeReasons => 'Razlogi za prekodiranje';

  @override
  String get player => 'Predvajalnik';

  @override
  String get container => 'Posoda';

  @override
  String get bitrate => 'Bitna hitrost';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Resolucija';

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
  String get track => 'Skladba';

  @override
  String get channels => 'Kanali';

  @override
  String get format => 'Oblika';

  @override
  String get external => 'Zunanji';

  @override
  String get embedded => 'Vdelano';

  @override
  String castSessionError(String protocol) {
    return 'Napaka seje $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Podrobnosti knjige ni bilo mogoče naložiti: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Upodabljanje EPUB v aplikaciji še ni na voljo na tej platformi.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Te oblike (.$extension) še ni mogoče prikazati v aplikaciji.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Vdelano upodabljanje dokumentov na tej platformi ni na voljo.';

  @override
  String get couldNotOpenExternalViewer =>
      'Zunanjega pregledovalnika ni bilo mogoče odpreti.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Bralnika v aplikaciji ni bilo mogoče odpreti: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Zaznamek je na mestu $label že shranjen.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Zaznamek dodan: $label';
  }

  @override
  String get noBookmarksYet =>
      'Zaznamkov še ni.\nMed branjem tapnite ikono zaznamka, da shranite svoj položaj.';

  @override
  String get noTableOfContentsAvailable => 'Kazalo ni na voljo';

  @override
  String pageLabel(int number) {
    return 'Stran $number';
  }

  @override
  String get position => 'Položaj';

  @override
  String get bookReader => 'Bralec knjig';

  @override
  String formatExtension(String extension) {
    return 'Oblika: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent % prebrano';
  }

  @override
  String get updating => 'Posodabljanje ...';

  @override
  String get markUnread => 'Označi neprebrano';

  @override
  String get markAsRead => 'Označi kot prebrano';

  @override
  String get reloadReader => 'Ponovno naloži bralnik';

  @override
  String get noPagesFound => 'Ni najdenih strani.';

  @override
  String get failedToDecodePageImage => 'Dekodiranje slike strani ni uspelo.';

  @override
  String resetZoom(String zoom) {
    return 'Ponastavi povečavo (${zoom}x)';
  }

  @override
  String get singlePage => 'Ena stran';

  @override
  String get twoPageSpread => 'Dvostranski razpon';

  @override
  String get addBookmark => 'Dodaj zaznamek';

  @override
  String get bookmarksEllipsis => 'Zaznamki ...';

  @override
  String get markedAsRead => 'Označeno kot prebrano';

  @override
  String get markedAsUnread => 'Označeno kot neprebrano';

  @override
  String failedToUpdateReadState(String error) {
    return 'Stanja branja ni bilo mogoče posodobiti: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistem';

  @override
  String get themeLight => 'Tema: Svetloba';

  @override
  String get themeDark => 'Tema: temno';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Obrni barve (fiksna postavitev)';

  @override
  String get invertColorsPdf => 'Obrni barve (PDF)';

  @override
  String get preparingInAppReader => 'Priprava bralnika v aplikaciji ...';

  @override
  String get pdfDataNotAvailable => 'Podatki PDF niso na voljo.';

  @override
  String get readerFallbackModeActive => 'Nadomestni način bralnika je aktiven';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ta platforma ne podpira vgrajenega pogona za dokumente za datoteke $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Uporabite Reload Reader po preklopu na podprto ciljno platformo (Android, iOS, macOS).';

  @override
  String get openExternally => 'Odprto navzven';

  @override
  String get noEpubChaptersFound => 'Ni poglavij EPUB.';

  @override
  String get readerNotReady => 'Bralec ni pripravljen.';

  @override
  String get seriesRecordings => 'Posnetki serije';

  @override
  String get now => 'zdaj';

  @override
  String get sports => 'Šport';

  @override
  String get news => 'Novice';

  @override
  String get kids => 'Otroci';

  @override
  String get premiere => 'Premiera';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Vodnik Časovnica';

  @override
  String failedToLoadGuide(String error) {
    return 'Sporeda ni bilo mogoče naložiti: $error';
  }

  @override
  String get noChannelsFound => 'Ni kanalov';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'V ŽIVO';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Sledi: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'še $minutes min';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'še $hours h';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'še $hours h $minutes min';
  }

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels =>
      'Odstranjeno iz priljubljenih kanalov';

  @override
  String get addedToFavoriteChannels => 'Dodano med priljubljene kanale';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Priljubljenega kanala ni bilo mogoče posodobiti';

  @override
  String get unfavoriteChannel => 'Nepriljubljeni kanal';

  @override
  String get favoriteChannel => 'Najljubši kanal';

  @override
  String get record => 'Snemaj';

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
  String get cancelRecordingAction => 'Prekliči snemanje';

  @override
  String get programSetToRecord => 'Snemanje oddaje je načrtovano';

  @override
  String get recordingCancelled => 'Snemanje preklicano';

  @override
  String get unableToCreateRecording => 'Posnetka ni mogoče ustvariti';

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
  String get watch => 'Glej';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Zapri';

  @override
  String failedToPlayChannel(String name) {
    return 'Predvajanje $name ni uspelo';
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
  String get failedToLoadRecordings => 'Nalaganje posnetkov ni uspelo';

  @override
  String get scheduledInNext24Hours => 'Načrtovano v naslednjih 24 urah';

  @override
  String get recentRecordings => 'Nedavni posnetki';

  @override
  String get tvSeries => 'TV serija';

  @override
  String get failedToLoadSchedule => 'Razporeda ni bilo mogoče naložiti';

  @override
  String get noScheduledRecordings => 'Ni predvidenih snemanj';

  @override
  String get cancelRecording => 'Preklic snemanja?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Ali želite preklicati načrtovano snemanje »$name«?';
  }

  @override
  String get no => 'Ne';

  @override
  String get yesCancel => 'Da, Prekliči';

  @override
  String get failedToCancelRecording => 'Snemanja ni bilo mogoče preklicati';

  @override
  String get failedToLoadSeriesRecordings =>
      'Posnetkov serije ni bilo mogoče naložiti';

  @override
  String get noSeriesRecordings => 'Ni posnetkov serije';

  @override
  String get cancelSeriesRecording => 'Prekliči snemanje serije';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Želite preklicati snemanje serije?';

  @override
  String stopRecordingName(String name) {
    return 'Ali želite ustaviti snemanje »$name«?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Snemanja serije ni bilo mogoče preklicati';

  @override
  String get searchThisLibrary => 'Išči v tej knjižnici ...';

  @override
  String get searchEllipsis => 'Iskanje ...';

  @override
  String noResultsForQuery(String query) {
    return 'Ni rezultatov za »$query«';
  }

  @override
  String searchFailedError(String error) {
    return 'Iskanje ni uspelo: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Vrsta računa Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokalno';

  @override
  String get savedMedia => 'Shranjeni mediji';

  @override
  String get tvShows => 'TV oddaje';

  @override
  String get music => 'Glasba';

  @override
  String get musicAlbums => 'Glasbeni albumi';

  @override
  String get noMediaInFilter => 'V tem filtru ni medijev';

  @override
  String get noDownloadedMediaYet => 'Prenesenih medijev še ni';

  @override
  String get browseLibrary => 'Brskanje po knjižnici';

  @override
  String get deleteDownload => 'Izbriši prenos';

  @override
  String removeItemAndFiles(String name) {
    return 'Ali želite odstraniti »$name« in pripadajoče datoteke?';
  }

  @override
  String tracksCount(int count) {
    return '$count skladb';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Predvajaj album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Albuma ni bilo mogoče naložiti: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Za album $name ni najdenih prenesenih skladb.';
  }

  @override
  String get season => 'Sezona';

  @override
  String get errorLoadingEpisodes => 'Napaka pri nalaganju epizod';

  @override
  String get noDownloadedEpisodes => 'Ni prenesenih epizod';

  @override
  String get deleteEpisode => 'Izbriši epizodo';

  @override
  String removeName(String name) {
    return 'Ali želite odstraniti »$name«?';
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
    return 'Epizoda $number';
  }

  @override
  String get seriesNotFound => 'Serije ni mogoče najti';

  @override
  String get errorLoadingSeries => 'Napaka pri nalaganju serije';

  @override
  String get downloadedEpisodes => 'Prenesene epizode';

  @override
  String seasonNumber(int number) {
    return 'Sezona $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Posebne ponudbe';

  @override
  String get deleteSeason => 'Izbriši sezono';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Ali želite izbrisati vse prenesene epizode v $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count epizod',
      few: '$count epizode',
      two: '$count epizodi',
      one: '1 epizoda',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Upravljanje shranjevanja';

  @override
  String get storageBreakdown => 'Razčlenitev shranjevanja';

  @override
  String get downloadedItems => 'Preneseni predmeti';

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
  String get storageLimit => 'Omejitev shranjevanja';

  @override
  String get noLimit => 'Brez omejitev';

  @override
  String get deleteAllDownloads => 'Izbriši vse prenose';

  @override
  String get deleteAllDownloadsWarning =>
      'S tem boste odstranili vse prenesene medijske datoteke in tega ni mogoče razveljaviti.';

  @override
  String get deleteAll => 'Izbriši vse';

  @override
  String get deleteSelected => 'Izbriši izbrano';

  @override
  String deleteSelectedCount(int count) {
    return 'Ali želite izbrisati $count prenesenih elementov?';
  }

  @override
  String get musicAndAudiobooks => 'Glasba in zvočne knjige';

  @override
  String get images => 'Slike';

  @override
  String get database => 'Baza podatkov';

  @override
  String ofStorageLimit(String limit) {
    return 'od omejitve $limit';
  }

  @override
  String get settings => 'nastavitve';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Preverjanje pristnosti';

  @override
  String get autoLoginServerManagement =>
      'Samodejna prijava, upravljanje strežnika';

  @override
  String get pinCode => 'koda PIN';

  @override
  String get setUpPinCodeProtection => 'Nastavite zaščito s PIN kodo';

  @override
  String get parentalControls => 'Starševski nadzor';

  @override
  String get contentRatingRestrictions => 'Omejitve ocenjevanja vsebine';

  @override
  String get bitRateResolutionBehavior =>
      'Bitna hitrost, ločljivost, obnašanje';

  @override
  String get languageSizeAppearance => 'Jezik, velikost, videz';

  @override
  String get qualityStorage => 'Kakovost, skladiščenje';

  @override
  String get mediaRequestIntegration => 'Integracija medijske zahteve';

  @override
  String get switchServer => 'Zamenjaj strežnik';

  @override
  String get signOut => 'Odjava';

  @override
  String get versionLicenses => 'Različica, licence';

  @override
  String get account => 'Račun';

  @override
  String get signInAndSecurity => 'Prijava in varnost';

  @override
  String get administration => 'Administracija';

  @override
  String get serverSettingsUsersLibraries =>
      'Nastavitve strežnika, uporabniki, knjižnice';

  @override
  String get customization => 'Prilagajanje';

  @override
  String get themeAndLayout => 'Tema in postavitev';

  @override
  String get videoAndSubtitles => 'Video in podnapisi';

  @override
  String get pluginAndRequests => 'Vtičnik in zahteve';

  @override
  String get customizeAccountPlaybackInterface =>
      'Prilagodite račun, predvajanje in vedenje vmesnika';

  @override
  String optionsCount(int count) {
    return '$count možnosti';
  }

  @override
  String get themeAndAppearance => 'Tema in videz';

  @override
  String get focusBorderColor => 'Barva obrobe fokusa';

  @override
  String get watchedIndicators => 'Gledani kazalniki';

  @override
  String get always => 'Vedno';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Skrij neogledano';

  @override
  String get episodesOnly => 'Samo epizode';

  @override
  String get never => 'Nikoli';

  @override
  String get focusExpansionAnimation => 'Animacija za razširitev fokusa';

  @override
  String get desktopUiScale => 'Lestvica uporabniškega vmesnika namizja';

  @override
  String get scaleFocusedCards =>
      'Prilagodite fokusirane ali lebdeče kartice in ploščice';

  @override
  String get seriesThumbnails => 'Sličice serije';

  @override
  String get seriesThumbnailsDescription =>
      'Samo epizode: uporabite sliko serije, ki se ujema z vsako vrsto slike vrstice';

  @override
  String get homeRowInfoOverlay => 'Prekrivanje informacij domače vrstice';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Pokaži naslov in metapodatke med brskanjem po domačih vrsticah';

  @override
  String get clockDisplay => 'Zaslon ure';

  @override
  String get inMenus => 'V menijih';

  @override
  String get inVideo => 'V videu';

  @override
  String get seasonalEffects => 'Sezonski učinki';

  @override
  String get seasonalEffectsDescription =>
      'Vizualni učinki in sezonski okraski';

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
  String get snow => 'sneg';

  @override
  String get fireworks => 'Ognjemet';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Padajoče listje';

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
  String get themeMusic => 'Tematska glasba';

  @override
  String get playThemeMusicOnDetailPages =>
      'Predvajajte tematsko glasbo na straneh s podrobnostmi';

  @override
  String get themeMusicVolume => 'Glasnost tematske glasbe';

  @override
  String percentValue(int value) {
    return '$value %';
  }

  @override
  String get themeMusicOnHomeRows => 'Tematska glasba na Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Igrajte med brskanjem po začetnem zaslonu';

  @override
  String get loopThemeMusic => 'Ponavljaj tematsko glasbo';

  @override
  String get loopThemeMusicSubtitle =>
      'Skladbo predvajaj v zanki namesto enkrat';

  @override
  String get detailsBackgroundBlur => 'Zameglitev ozadja podrobnosti';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value px';
  }

  @override
  String get browsingBackgroundBlur => 'Brskanje po zameglitvi ozadja';

  @override
  String get maxStreamingBitrate => 'Največja bitna hitrost pretakanja';

  @override
  String get maxResolution => 'Največja ločljivost';

  @override
  String get playerZoomMode => 'Način povečave predvajalnika';

  @override
  String get settingsScrollWheelAction => 'Kolesce miške';

  @override
  String get settingsScrollWheelActionDescription =>
      'Izberite, kaj se zgodi ob drsenju s kolescem miške nad videom med predvajanjem.';

  @override
  String get scrollWheelActionOff => 'Izklopljeno';

  @override
  String get scrollWheelActionSeek => 'Iskanje (naprej/nazaj)';

  @override
  String get scrollWheelActionVolume => 'Glasnost';

  @override
  String get playerTooltipVolume => 'Glasnost';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Samodejno obrezovanje';

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
  String get stretch => 'Raztegni';

  @override
  String get refreshRateSwitching => 'Preklop hitrosti osveževanja';

  @override
  String get disabled => 'Onemogočeno';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Lestvica na TV';

  @override
  String get scaleOnDevice => 'Merilo na napravi';

  @override
  String get trickPlay => 'Igra trikov';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Pri iskanju prikaži predogled sličic';

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
  String get showDescriptionOnPause => 'Prikaži opis ob premoru';

  @override
  String get dimVideoShowOverview =>
      'Zatemni videoposnetek in prikaži besedilo pregleda med začasno ustavitvijo';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'Gumb za zaklepanje OSD';

  @override
  String get osdLockButtonDescription =>
      'Prikaži gumb za zaklepanje, ki blokira vnos na dotik, dokler ga ne pritisnete dolgo';

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
  String get audioBehavior => 'Zvočno vedenje';

  @override
  String get downmixToStereo => 'Pretvori v stereo';

  @override
  String get defaultAudioLanguage => 'Privzeti jezik zvoka';

  @override
  String get fallbackAudioLanguage => 'Nadomestni jezik zvoka';

  @override
  String get preferDefaultAudioTrack =>
      'Prednostno uporabi privzeto zvočno sled';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Prednostno uporabi izvirno zvočno sled namesto lokalizirane sinhronizacije.';

  @override
  String get preferAudioDescription =>
      'Prednostno uporabi sledi z zvočnim opisom';

  @override
  String get preferAudioDescriptionDescription =>
      'Prednostno uporabi sledi z zvočnim opisom namesto običajnih sledi.';

  @override
  String get autoServerDefault => 'Samodejno (privzeto za strežnik)';

  @override
  String get english => 'angleščina';

  @override
  String get spanish => 'španščina';

  @override
  String get french => 'francosko';

  @override
  String get german => 'nemški';

  @override
  String get italian => 'italijanščina';

  @override
  String get portuguese => 'portugalščina';

  @override
  String get japanese => 'japonska';

  @override
  String get korean => 'korejščina';

  @override
  String get chinese => 'kitajski';

  @override
  String get russian => 'ruski';

  @override
  String get arabic => 'arabščina';

  @override
  String get hindi => 'Hindijščina';

  @override
  String get dutch => 'nizozemščina';

  @override
  String get swedish => 'švedščina';

  @override
  String get norwegian => 'norveški';

  @override
  String get danish => 'danščina';

  @override
  String get finnish => 'finščina';

  @override
  String get polish => 'poljski';

  @override
  String get ac3Passthrough => 'Prehod AC3';

  @override
  String get dtsPassthrough => 'Prehod DTS';

  @override
  String get trueHdSupport => 'Podpora za TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS zvok samo v AVR; zahteva podporo za sprejemnik in izvorno sled DTS';

  @override
  String get settingsAudioFallbackCodec => 'Nadomestni zvočni kodek';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Izberite ciljno obliko za prekodiranje večkanalnega zvoka, kadar izvornega pretoka ni mogoče predvajati neposredno ali posredovati naprej.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Samodejno zaznaj\n(priporočeno)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(privzeto)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(samo stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(učinkovit)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(brez izgub)';

  @override
  String get settingsMaxAudioChannels => 'Največje število zvočnih kanalov';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Nastavite največje število kanalov vaše zvočne postavitve. Večkanalni pretoki, ki presegajo to omejitev, bodo zmiksani ali prekodirani.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Samodejno zaznaj\n(privzeto za strojno opremo)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Kvadrofonija';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (napredno)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough kodekov';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Omogočite samo oblike, ki jih podpira vaš AVR ali naprava HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Passthrough EAC3';

  @override
  String get settingsAudioDtsCorePassthrough => 'Passthrough DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'Passthrough DTS-HD MA';

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
  String get settingsAudioTrueHdPassthrough => 'Passthrough TrueHD';

  @override
  String get settingsDetectedAudioCapabilities => 'Zaznane zvočne zmožnosti';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Posnetek zmožnosti med izvajanjem še ni na voljo.';

  @override
  String get settingsAudioRouteLabel => 'Pot';

  @override
  String get settingsAudioDecodeLabel => 'Dekodiranje';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Pot za zvok HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Zvočnik';

  @override
  String get settingsAudioRouteHeadphones => 'Slušalke';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get nightMode => 'Nočni način';

  @override
  String get compressDynamicRange => 'Stisnite dinamični razpon';

  @override
  String get advancedMpv => 'Napredni mpv';

  @override
  String get enableCustomMpvConf => 'Omogoči Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Uporabite uporabniško določen mpv.conf pred začetkom predvajanja';

  @override
  String get unsafeAdvancedMpvOptions => 'Nevarne napredne mpv možnosti';

  @override
  String get unsafeMpvOptionsDescription =>
      'Dovolite širši nabor možnosti mpv. Lahko prekine vedenje predvajanja.';

  @override
  String get hardwareDecoding => 'Strojno dekodiranje';

  @override
  String get hardwareDecodingSubtitle =>
      'Lahko izboljša delovanje, vendar lahko povzroči težave pri predvajanju v nekaterih napravah.';

  @override
  String get nextUpAndQueuing => 'Naprej in čakalna vrsta';

  @override
  String get nextUpDisplay => 'Naslednji zaslon';

  @override
  String get extended => 'Razširjeno';

  @override
  String get minimal => 'Minimalno';

  @override
  String get nextUpTimeout => 'Časovna omejitev Next Up';

  @override
  String secondsValue(int value) {
    return '$value s';
  }

  @override
  String get mediaQueuing => 'Medijska čakalna vrsta';

  @override
  String get autoQueueNextEpisodes =>
      'Samodejno postavi v čakalno vrsto naslednje epizode';

  @override
  String get stillWatchingPrompt => 'Še vedno gledam poziv';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Po $episodes epizodah / $hours h';
  }

  @override
  String get resumeAndSkip => 'Nadaljuj in preskoči';

  @override
  String get resumeRewind => 'Nadaljuj Previjanje nazaj';

  @override
  String get unpauseRewind => 'Prekliči previjanje nazaj';

  @override
  String get fiveSeconds => '5 sekund';

  @override
  String get tenSeconds => '10 sekund';

  @override
  String get fifteenSeconds => '15 sekund';

  @override
  String get thirtySeconds => '30 sekund';

  @override
  String get skipBackLength => 'Preskoči nazaj dolžino';

  @override
  String get skipForwardLength => 'Preskoči dolžino naprej';

  @override
  String get customMpvConfPath => 'Pot po meri mpv.conf';

  @override
  String get notSetMpvConf =>
      'Ni nastavljeno. Moonfin bo poskusil privzeti mpv.conf v mapah app/data.';

  @override
  String get selectMpvConf => 'Izberite mpv.conf';

  @override
  String get pathToMpvConf => '/pot/do/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Nastavitve sloga (velikost, barva, odmik) veljajo za besedilne podnapise (SRT, VTT, TTML). Podnapisi ASS/SSA uporabljajo lasten vdelan slog, razen če je \"ASS/SSA Direct Play\" izklopljen. Bitnih podnapisov (PGS, DVB, VobSub) ni mogoče spremeniti.';

  @override
  String get defaultSubtitleLanguage => 'Privzeti jezik podnapisov';

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
  String get defaultToNoSubtitles => 'Privzeto je Brez podnapisov';

  @override
  String get turnOffSubtitlesByDefault => 'Privzeto izklopite podnapise';

  @override
  String get subtitleSize => 'Velikost podnapisov';

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
  String get textFillColor => 'Barva polnila besedila';

  @override
  String get backgroundColor => 'Barva ozadja';

  @override
  String get textStrokeColor => 'Barva črte besedila';

  @override
  String get subtitleCustomization => 'Prilagajanje podnapisov';

  @override
  String get subtitleCustomizationDescription => 'Prilagodite videz podnapisov';

  @override
  String get subtitleMode => 'Način podnapisov';

  @override
  String get subtitleModeFlagged => 'Označeni';

  @override
  String get subtitleModeAlways => 'Vedno';

  @override
  String get subtitleModeForeign => 'Tujejezični';

  @override
  String get subtitleModeForced => 'Vsiljeni';

  @override
  String get subtitleModeFlaggedDescription =>
      'Predvaja sledi, ki so v metapodatkih predstavnostne datoteke interno označene kot »default« ali »forced«.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Samodejno naloži in prikaže podnapise ob vsakem zagonu videa.';

  @override
  String get subtitleModeForeignDescription =>
      'Samodejno vklopi podnapise, če je privzeta zvočna sled v tujem jeziku.';

  @override
  String get subtitleModeForcedDescription =>
      'Naloži samo podnapise, ki so izrecno označeni z zastavico »forced«.';

  @override
  String get subtitleModeNoneDescription =>
      'Popolnoma onemogoči samodejno nalaganje podnapisov.';

  @override
  String get fallbackSubtitleLanguage => 'Nadomestni jezik podnapisov';

  @override
  String get subtitleStream => 'Pretok podnapisov';

  @override
  String get subtitlePreviewText => 'Hitra rjava lisica skoči čez lenega psa';

  @override
  String get verticalOffset => 'Navpični odmik';

  @override
  String get pgsDirectPlay => 'Neposredna igra PGS';

  @override
  String get directPlayPgsSubtitles => 'Neposredno predvajanje podnapisov PGS';

  @override
  String get assSsaDirectPlay => 'Neposredna igra ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Neposredno predvajanje podnapisov ASS/SSA';

  @override
  String get white => 'Bela';

  @override
  String get black => 'Črna';

  @override
  String get yellow => 'Rumena';

  @override
  String get green => 'zelena';

  @override
  String get cyan => 'Cian';

  @override
  String get red => 'Rdeča';

  @override
  String get transparent => 'Transparentna';

  @override
  String get semiTransparentBlack => 'Polprozorna črna';

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
  String get global => 'Globalno';

  @override
  String get desktop => 'Namizje';

  @override
  String get mobile => 'Mobilni';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Nastavitve profila $profile so naložene.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nastavitev profila $profile ni bilo mogoče naložiti.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Lokalne nastavitve so sinhronizirane s profilom $profile.';
  }

  @override
  String get syncing => 'Sinhronizacija ...';

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
  String get profileSyncHidden => 'Sinhronizacija profila je skrita';

  @override
  String get enablePluginSyncDescription =>
      'Omogočite strežniško sinhronizacijo vtičnika v nastavitvah vtičnika, da tukaj prikažete kontrolnike profila.';

  @override
  String get quality => 'Kakovost';

  @override
  String get defaultDownloadQuality => 'Privzeta kakovost prenosa';

  @override
  String get network => 'Omrežje';

  @override
  String get wifiOnlyDownloads => 'Prenosi samo za WiFi';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Prikaži prenose na strežniku';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Skrbniku strežnika omogoči, da v nadzorni plošči vidi vaše prekodirane prenose';

  @override
  String get onlyDownloadOnWifi => 'Prenesite samo, ko ste povezani z WiFi';

  @override
  String get storage => 'Shranjevanje';

  @override
  String get storageUsed => 'Uporabljen prostor za shranjevanje';

  @override
  String get manage => 'Upravljaj';

  @override
  String get calculating => 'Izračun ...';

  @override
  String get downloadLocation => 'Lokacija prenosa';

  @override
  String get defaultLabel => 'Privzeto';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Shrani v mapo Prenosi';

  @override
  String get downloadsVisibleToOtherApps =>
      'Prenosi/Moonfin — vidno drugim aplikacijam';

  @override
  String get dangerZone => 'Nevarno območje';

  @override
  String get clearAllDownloads => 'Počisti vse prenose';

  @override
  String get original => 'Izvirna';

  @override
  String get changeDownloadLocation => 'Spremenite lokacijo prenosa';

  @override
  String get changeDownloadLocationDescription =>
      'Novi prenosi bodo shranjeni v izbrano mapo. Obstoječi prenosi bodo ostali na trenutni lokaciji in jih je mogoče upravljati v nastavitvah za shranjevanje.';

  @override
  String get confirm => 'Potrdi';

  @override
  String get cannotWriteToFolder =>
      'V izbrano mapo ni mogoče pisati. Izberite drugo lokacijo ali podelite dovoljenja za shranjevanje.';

  @override
  String get saveToDownloadsFolderQuestion => 'Shrani v mapo Prenosi?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Prenesena predstavnost bo shranjena v Prenosi/Moonfin v vaši napravi. Te datoteke bodo vidne drugim aplikacijam, kot je vaša galerija ali predvajalnik glasbe.\n\nObstoječi prenosi bodo ostali na trenutni lokaciji.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Omogoči';

  @override
  String get clearAllDownloadsWarning =>
      'S tem boste izbrisali vse prenesene medije in tega ni mogoče razveljaviti.';

  @override
  String get clearAll => 'Počisti vse';

  @override
  String get navigationStyle => 'Slog krmarjenja';

  @override
  String get topBar => 'Zgornja vrstica';

  @override
  String get leftSidebar => 'Leva stranska vrstica';

  @override
  String get showShuffleButton => 'Pokaži gumb za naključno predvajanje';

  @override
  String get showGenresButton => 'Pokaži gumb zvrsti';

  @override
  String get showFavoritesButton => 'Prikaži gumb za priljubljene';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Prikaži knjižnice v orodni vrstici';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'Vedno prikaži oznake v navigacijski vrstici';

  @override
  String get showSeerrButton => 'Prikaži gumb Seerr';

  @override
  String get navbarOpacity => 'Neprosojnost krmarne vrstice';

  @override
  String get navbarColor => 'Barva navigacijske vrstice';

  @override
  String get gray => 'siva';

  @override
  String get darkBlue => 'Temno modra';

  @override
  String get purple => 'Vijolična';

  @override
  String get teal => 'Modrozelena';

  @override
  String get navy => 'Mornarica';

  @override
  String get charcoal => 'Oglje';

  @override
  String get brown => 'Rjava';

  @override
  String get darkRed => 'Temno rdeča';

  @override
  String get darkGreen => 'Temno zelena';

  @override
  String get slate => 'Skrilavec';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Prikaz knjižnice';

  @override
  String get posterLabel => 'Plakat';

  @override
  String get thumbnailLabel => 'Sličica';

  @override
  String get bannerLabel => 'Pasica';

  @override
  String get overridePerLibrarySettings =>
      'Preglasi nastavitve posamezne knjižnice';

  @override
  String get applyImageTypeToAllLibraries =>
      'Uporabi vrsto slike za vse knjižnice';

  @override
  String get multiServerLibraries => 'Večstrežniške knjižnice';

  @override
  String get showLibrariesFromAllServers =>
      'Prikaži knjižnice iz vseh povezanih strežnikov';

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
  String get groupItemsIntoCollections => 'Združi elemente v zbirke';

  @override
  String get hideCollectionAssociatedItems =>
      'Med brskanjem po knjižnicah skrij elemente, ki pripadajo zbirki';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Obvestilo o združevanju knjižnice';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Za uporabo te nastavitve poskrbite, da sta v nastavitvah prikaza vaše knjižnice na strežniku Jellyfin ali Emby omogočeni možnosti »Group movies into collections« in/ali »Group shows into collections«.';

  @override
  String get libraryVisibility => 'Vidnost knjižnice';

  @override
  String get libraryVisibilityDescription =>
      'Preklopi vidnost domače strani na knjižnico. Znova zaženite Moonfin, da spremembe začnejo veljati.';

  @override
  String get showInNavigation => 'Prikaži v navigaciji';

  @override
  String get showInLatestMedia => 'Prikaži v najnovejših medijih';

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
  String get sourceLibraries => 'Izvorne knjižnice';

  @override
  String get sourceCollections => 'Izvorne zbirke';

  @override
  String get excludedGenres => 'Izključeni žanri';

  @override
  String get selectAll => 'Izberite Vse';

  @override
  String itemsSelected(int count) {
    return '$count izbranih';
  }

  @override
  String get mediaBar => 'Medijska vrstica';

  @override
  String get mediaSources => 'Medijski viri';

  @override
  String get behavior => 'Vedenje';

  @override
  String get seconds => 'sekund';

  @override
  String get mediaBarMode => 'Slog medijske vrstice';

  @override
  String get mediaBarModeDescription =>
      'Izbirajte med različnimi slogi medijske vrstice ali pa medijsko vrstico izklopite';

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
  String get mediaBarModeOff => 'Izklopljeno';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Omogoči vrstico z mediji';

  @override
  String get showFeaturedContentSlideshow =>
      'Prikaži diaprojekcijo predstavljene vsebine na domači strani';

  @override
  String get contentType => 'Vrsta vsebine';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Filmi in TV-oddaje';

  @override
  String get moviesOnly => 'Samo filmi';

  @override
  String get tvShowsOnly => 'Samo TV oddaje';

  @override
  String get itemCount => 'Število predmetov';

  @override
  String get noneSelected => 'Noben izbran';

  @override
  String get noneExcluded => 'Nobena ni izključena';

  @override
  String get autoAdvance => 'Samodejni napredek';

  @override
  String get autoAdvanceSlides =>
      'Samodejno napredovanje na naslednji diapozitiv';

  @override
  String get autoAdvanceInterval => 'Interval samodejnega napredovanja';

  @override
  String get trailerPreview => 'Predogled napovednika';

  @override
  String get autoPlayTrailers =>
      'Samodejno predvajanje napovednikov v medijski vrstici po 3 sekundah';

  @override
  String get trailerAudio => 'Zvok napovednikov';

  @override
  String get enableTrailerAudio =>
      'Omogoči zvok napovednikov v predstavnostni vrstici';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Predogled epizode';

  @override
  String get mediaPreview => 'Predogled medijev';

  @override
  String get episodePreviewDescription =>
      'Predvajanje 30-sekundnega vgrajenega predogleda na karticah, ki so v fokusu, na katerih lebdi lebdeč ali dolgo pritisnete';

  @override
  String get mediaPreviewDescription =>
      'Predvajanje 30-sekundnega vgrajenega predogleda na karticah, ki so v fokusu, na katerih lebdi lebdeč ali dolgo pritisnete';

  @override
  String get previewAudio => 'Predogled zvoka';

  @override
  String get enablePreviewAudio =>
      'Omogoči zvok za napovednike in predoglede epizod';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Najnovejši mediji';

  @override
  String get recentlyReleased => 'Pred kratkim izdano';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Moji mediji';

  @override
  String get myMediaSmall => 'Moji mediji (majhen)';

  @override
  String get continueWatching => 'Nadaljujte z gledanjem';

  @override
  String get resumeAudio => 'Nadaljevanje zvoka';

  @override
  String get resumeBooks => 'Življenjepis knjig';

  @override
  String get activeRecordings => 'Aktivni posnetki';

  @override
  String get playlists => 'Seznami predvajanja';

  @override
  String get liveTV => 'TV v živo';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Ponastavi na privzete nastavitve';

  @override
  String get homeRowPosterSize => 'Velikost plakata domače vrste';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurirajte vrsto slike za vsako omogočeno domačo vrstico';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Združi Nadaljuj z gledanjem in Naprej';

  @override
  String get combineBothRows => 'Združite obe vrstici v en sam domači del';

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
  String get fullScreenRows => 'Razširjene vrstice na domači strani';

  @override
  String get fullScreenRowsDescription =>
      'Omeji domačo stran na 1 vrstico naenkrat';

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
  String get perRowSettings => 'Nastavitve po vrsticah';

  @override
  String get autoLogin => 'Samodejna prijava';

  @override
  String get lastUser => 'Zadnji uporabnik';

  @override
  String get currentUser => 'Trenutni uporabnik';

  @override
  String get alwaysAuthenticate => 'Vedno preveri pristnost';

  @override
  String get requirePasswordWithToken =>
      'Zahtevaj geslo tudi s shranjenim žetonom';

  @override
  String get confirmExit => 'Potrdite izhod';

  @override
  String get showConfirmationBeforeExiting => 'Prikaži potrditev pred izhodom';

  @override
  String get blockContentWithRatings =>
      'Blokiraj vsebino z naslednjimi ocenami:';

  @override
  String get noContentRatingsFound =>
      'Na tem strežniku še ni bilo najdenih ocen vsebine.';

  @override
  String get couldNotLoadServerRatings =>
      'Ni bilo mogoče naložiti ocen strežnika. Prikazane so samo shranjene ocene.';

  @override
  String get couldNotRefreshRatings =>
      'Ni bilo mogoče osvežiti ocen s strežnika. Prikaz shranjenih ocen.';

  @override
  String get enablePinCode => 'Omogoči kodo PIN';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess => 'Za dostop do računa zahtevajte PIN';

  @override
  String get changePin => 'Spremeni PIN';

  @override
  String get setNewPinCode => 'Nastavite novo kodo PIN';

  @override
  String get removePin => 'Odstrani PIN';

  @override
  String get removePinProtection => 'Odstranite zaščito s PIN kodo';

  @override
  String get screensaver => 'Ohranjevalnik zaslona';

  @override
  String get inAppScreensaver => 'Ohranjevalnik zaslona v aplikaciji';

  @override
  String get enableBuiltInScreensaver =>
      'Omogoči vgrajeni ohranjevalnik zaslona';

  @override
  String get mode => 'Način';

  @override
  String get libraryArt => 'Knjižnična umetnost';

  @override
  String get logo => 'Logotip';

  @override
  String get clock => 'Ura';

  @override
  String get timeout => 'Časovna omejitev';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Stopnja zatemnitve';

  @override
  String get maxAgeRating => 'Največja starostna ocena';

  @override
  String get any => 'katera koli';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Zahtevaj starostno oceno';

  @override
  String get onlyShowRatedContent => 'Pokaži samo ocenjeno vsebino';

  @override
  String get displayClockDuringScreensaver =>
      'Prikaz ure med ohranjevalnikom zaslona';

  @override
  String get clockModeStatic => 'Statična';

  @override
  String get clockModeBouncing => 'Odbijajoča se';

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
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Kritiki)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Občinstvo)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritično';

  @override
  String get metacriticUser => 'Metacritic (uporabnik)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Ocena skupnosti';

  @override
  String get ratings => 'Ocene';

  @override
  String get additionalRatings => 'Dodatne ocene';

  @override
  String get showMdbListAndTmdbRatings => 'Prikaži ocene MDBList in TMDB';

  @override
  String get ratingLabels => 'Ocenjevalne oznake';

  @override
  String get showLabelsNextToIcons => 'Pokaži oznake poleg ikon za ocenjevanje';

  @override
  String get ratingBadges => 'Ocenjevalne značke';

  @override
  String get showDecorativeBadges => 'Pokaži okrasne značke za ocenami';

  @override
  String get episodeRatings => 'Ocene epizod';

  @override
  String get showRatingsOnEpisodes => 'Prikaži ocene posameznih epizod';

  @override
  String get ratingSources => 'Viri ocen';

  @override
  String get ratingSourcesDescription =>
      'Omogočite in preuredite vire ocen, prikazane v celotni aplikaciji';

  @override
  String get pluginDetected => 'Vtičnik zaznan';

  @override
  String get pluginNotDetected => 'Vtičnik ni zaznan';

  @override
  String get pluginNotDetectedDescription =>
      'Strežniški vtičnik trenutno ni zaznan. Lokalne nastavitve še vedno uporabljajo svoje shranjene vrednosti ali vgrajene privzete nastavitve.';

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
  String get recentRequests => 'Nedavne zahteve';

  @override
  String get recentlyAdded => 'Nedavno dodano';

  @override
  String get trending => 'V trendu';

  @override
  String get popularMovies => 'Priljubljeni filmi';

  @override
  String get movieGenres => 'Filmski žanri';

  @override
  String get upcomingMovies => 'Prihajajoči filmi';

  @override
  String get studios => 'Garsonjere';

  @override
  String get popularSeries => 'Priljubljene serije';

  @override
  String get seriesGenres => 'Zvrsti serij';

  @override
  String get upcomingSeries => 'Prihajajoče serije';

  @override
  String get networks => 'Omrežja';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Vrstice za odkrivanje Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'Ponastavi vrstice na privzete';

  @override
  String get enableSeerr => 'Omogoči Seerr';

  @override
  String get showSeerrInNavigation =>
      'Prikaži Seerr v navigaciji (zahteva strežniški vtičnik)';

  @override
  String get seerrUnavailable =>
      'Ni na voljo, ker je podpora za strežniški vtičnik Seerr onemogočena.';

  @override
  String get nsfwFilter => 'Filter NSFW';

  @override
  String get hideAdultContent => 'Skrij vsebino za odrasle v rezultatih';

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
  String get seerrNotificationsSection => 'Obvestila';

  @override
  String get seerrNotifyNewRequestsTitle => 'Obvestila o novih zahtevah';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Obvesti me, ko nekdo odda zahtevo';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Posodobitve zahtev';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Odobreno, zavrnjeno in dodano v vašo knjižnico';

  @override
  String get seerrNotifyIssuesTitle => 'Posodobitve težav';

  @override
  String get seerrNotifyIssuesSubtitle => 'Nove težave, odgovori in rešitve';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Prijavljeni kot: $username';
  }

  @override
  String get discoverRows => 'Stran za odkrivanje Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Omogočite vrstice, ki jih želite videti na glavni strani Seerr. Povlecite za prerazporeditev. Prilagojeni vrstni red se sinhronizira z vtičnikom Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Omogočite vrstice, ki jih želite videti na glavni strani Seerr. Povlecite za prerazporeditev. Prilagojeni vrstni red se sinhronizira z vtičnikom Moonbase.';

  @override
  String get enabled => 'Omogočeno';

  @override
  String get hidden => 'Skrito';

  @override
  String get aboutTitle => 'O tem';

  @override
  String versionValue(String version) {
    return 'Različica $version';
  }

  @override
  String get openSourceLicenses => 'Odprtokodne licence';

  @override
  String get sourceCode => 'Izvorna koda';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Preverite posodobitve zdaj';

  @override
  String get checksLatestDesktopRelease =>
      'Preveri najnovejšo izdajo namizja za to platformo';

  @override
  String get youAreUpToDate => 'Ste na tekočem.';

  @override
  String get couldNotCheckForUpdates =>
      'Trenutno ni bilo mogoče preveriti posodobitev.';

  @override
  String get noCompatibleUpdate =>
      'Za to platformo ni bil najden združljiv paket posodobitev.';

  @override
  String get updateChecksNotSupported =>
      'Preverjanja posodobitev na tej platformi niso podprta.';

  @override
  String get updateNotificationsDisabled =>
      'Obvestila o posodobitvah so onemogočena.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Pred ponovnim preverjanjem počakajte.';

  @override
  String get latestUpdateAlreadyShown =>
      'Zadnja posodobitev je bila že prikazana.';

  @override
  String get updateAvailable => 'Na voljo je posodobitev.';

  @override
  String updateAvailableVersion(String version) {
    return 'Na voljo je posodobitev: v$version';
  }

  @override
  String get updateNotifications => 'Posodobite obvestila';

  @override
  String get showWhenUpdatesAvailable =>
      'Prikaži, kdaj so na voljo posodobitve';

  @override
  String updateAvailableTitle(String version) {
    return 'Različica v$version je na voljo';
  }

  @override
  String get readReleaseNotes => 'Preberite opombe ob izdaji';

  @override
  String get downloadingUpdate => 'Prenos posodobitve ...';

  @override
  String get updateDownloadFailed =>
      'Prenos posodobitve ni uspel. prosim poskusite znova';

  @override
  String get openReleasesPage => 'Odpri stran z izdajami';

  @override
  String get navigation => 'Navigacija';

  @override
  String get watchedIndicatorsBackdrops => 'Gledani indikatorji, kulise';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Barva izostritve, opazovani indikatorji, ozadja';

  @override
  String get navbarStyleToolbarAppearance =>
      'Slog vrstice za krmarjenje, gumbi orodne vrstice, videz';

  @override
  String get featuredContentAppearance => 'Predstavljena vsebina, videz';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Omejitev predpomnilnika slik';

  @override
  String get clearImageCache => 'Počisti predpomnilnik slik';

  @override
  String get imageCacheCleared => 'Predpomnilnik slik je počiščen';

  @override
  String get clear => 'Počisti';

  @override
  String get browse => 'Prebrskaj';

  @override
  String get noResults => 'Brez rezultatov';

  @override
  String get seerrAvailableStatus => 'Na voljo';

  @override
  String get seerrRequestedStatus => 'Zahtevano';

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
    return 'Prenašanje · $percent %';
  }

  @override
  String get seerrImportingStatus => 'Uvažanje';

  @override
  String itemsCount(int count) {
    return '$count elementov';
  }

  @override
  String get seerrSettings => 'Nastavitve Seerr';

  @override
  String get requestMore => 'Zahtevaj več';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Zahteva';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Prekliči zahtevo';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Igrajte v Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Zahteval $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'odobri';

  @override
  String get declineAction => 'Zavrni';

  @override
  String get similar => 'Podobno';

  @override
  String get recommendations => 'Priporočila';

  @override
  String cancelRequestForTitle(String title) {
    return 'Ali želite preklicati zahtevo za »$title«?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Ali želite preklicati $count zahtev za »$title«?';
  }

  @override
  String get keep => 'obdrži';

  @override
  String get itemNotFoundInLibrary =>
      'Predmeta ni bilo mogoče najti v vaši knjižnici Moonfin';

  @override
  String get errorSearchingLibrary => 'Napaka pri iskanju knjižnice';

  @override
  String budgetAmount(String amount) {
    return 'Proračun: $amount \$';
  }

  @override
  String revenueAmount(String amount) {
    return 'Prihodek: $amount \$';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Zahtevaj $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Oddaj zahtevo';

  @override
  String get allSeasons => 'Vsi letni časi';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Napredne možnosti';

  @override
  String get noServiceServersConfigured =>
      'Konfiguriran ni noben servisni strežnik';

  @override
  String get server => 'Strežnik';

  @override
  String get qualityProfile => 'Profil kakovosti';

  @override
  String get rootFolder => 'Korenska mapa';

  @override
  String get showMore => 'Pokaži več';

  @override
  String get appearances => 'Nastopi';

  @override
  String get crewSection => 'Posadka';

  @override
  String ageValue(int age) {
    return 'starost $age';
  }

  @override
  String get noRequests => 'Brez zahtev';

  @override
  String get pendingStatus => 'V teku';

  @override
  String get declinedStatus => 'Zavrnjeno';

  @override
  String get partiallyAvailable => 'Delno na voljo';

  @override
  String get downloadingStatus => 'Prenašanje';

  @override
  String get approvedStatus => 'Odobreno';

  @override
  String get notRequestedStatus => 'Ni zahtevano';

  @override
  String get blocklistedStatus => 'Na seznamu blokiranih';

  @override
  String get deletedStatus => 'Izbrisano';

  @override
  String get failedStatus => 'Neuspešno';

  @override
  String get processingStatus => 'V obdelavi';

  @override
  String modifiedByName(String name) {
    return 'Spremenil $name';
  }

  @override
  String get completedStatus => 'Zaključeno';

  @override
  String get requestErrorDuplicate => 'Ta naslov je bil že zahtevan';

  @override
  String get requestErrorQuota => 'Dosežena je omejitev zahtev';

  @override
  String get requestErrorBlocklisted => 'Ta naslov je na seznamu blokiranih';

  @override
  String get requestErrorNoSeasons => 'Ni več sezon, ki bi jih lahko zahtevali';

  @override
  String get requestErrorPermission => 'Nimate dovoljenja za to zahtevo';

  @override
  String get seerrRequestsTitle => 'Zahteve';

  @override
  String get seerrIssuesTitle => 'Težave';

  @override
  String get sortNewest => 'Najnovejše';

  @override
  String get sortLastModified => 'Nazadnje spremenjeno';

  @override
  String get noIssues => 'Ni težav';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Na voljo je še $remaining od $limit zahtev za filme';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Na voljo je še $remaining od $limit zahtev za sezone';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Del zbirke $name';
  }

  @override
  String get viewCollection => 'Prikaži zbirko';

  @override
  String get requestCollection => 'Zahtevaj zbirko';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmov · $available na voljo';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Zahtevaj $count filmov';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Pošiljanje zahteve $current od $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Zahtevanih $count filmov';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Zahtevanih $ok od $total filmov';
  }

  @override
  String get collectionAllRequested => 'Vsi filmi so že na voljo ali zahtevani';

  @override
  String get reportIssue => 'Prijavi težavo';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Zvok';

  @override
  String get whatsWrong => 'V čem je težava?';

  @override
  String get allEpisodes => 'Vse epizode';

  @override
  String get episode => 'Epizoda';

  @override
  String get openStatus => 'Odprto';

  @override
  String get resolvedStatus => 'Rešeno';

  @override
  String get resolveAction => 'Reši';

  @override
  String get reopenAction => 'Znova odpri';

  @override
  String reportedByName(String name) {
    return 'Prijavil $name';
  }

  @override
  String commentsCount(int count) {
    return '$count komentarjev';
  }

  @override
  String get addComment => 'Dodaj komentar';

  @override
  String get deleteIssueConfirm => 'Ali želite izbrisati to težavo?';

  @override
  String get submitReport => 'Pošlji prijavo';

  @override
  String get tmdbScore => 'Rezultat TMDB';

  @override
  String get releaseDateLabel => 'Datum izdaje';

  @override
  String get firstAirDateLabel => 'Datum prvega predvajanja';

  @override
  String get revenueLabel => 'Prihodki';

  @override
  String get runtimeLabel => 'Trajanje';

  @override
  String get budgetLabel => 'Proračun';

  @override
  String get originalLanguageLabel => 'Izvirni jezik';

  @override
  String get seasonsLabel => 'Sezone';

  @override
  String get episodesLabel => 'Epizode';

  @override
  String get access => 'Dostop';

  @override
  String get add => 'Dodaj';

  @override
  String get address => 'Naslov';

  @override
  String get analytics => 'analitika';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Vsebina';

  @override
  String get copy => 'Kopiraj';

  @override
  String get create => 'Ustvari';

  @override
  String get disable => 'Onemogoči';

  @override
  String get done => 'Končano';

  @override
  String get edit => 'Uredi';

  @override
  String get encoding => 'Kodiranje';

  @override
  String get error => 'Napaka';

  @override
  String get forward => 'Naprej';

  @override
  String get general => 'Splošno';

  @override
  String get go => 'pojdi';

  @override
  String get install => 'Namestite';

  @override
  String get installed => 'Nameščeno';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Ime';

  @override
  String get networking => 'Mreženje';

  @override
  String get next => 'Naslednji';

  @override
  String get path => 'Pot';

  @override
  String get paused => 'Zaustavljeno';

  @override
  String get permissions => 'Dovoljenja';

  @override
  String get processing => 'Obdelava';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Ponudnik';

  @override
  String get refresh => 'Osveži';

  @override
  String get remote => 'Daljinski upravljalnik';

  @override
  String get rename => 'Preimenuj';

  @override
  String get revoke => 'Prekliči';

  @override
  String get role => 'Vloga';

  @override
  String get root => 'Koren';

  @override
  String get run => 'Teči';

  @override
  String get search => 'Išči';

  @override
  String get select => 'Izberite';

  @override
  String get send => 'Pošlji';

  @override
  String get sessions => 'Seje';

  @override
  String get set => 'Set';

  @override
  String get status => 'Stanje';

  @override
  String get stop => 'Ustavi';

  @override
  String get streaming => 'Pretakanje';

  @override
  String get time => 'Čas';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Odstrani';

  @override
  String get up => 'Gor';

  @override
  String get update => 'posodobitev';

  @override
  String get upload => 'Naloži';

  @override
  String get unmute => 'Vklop zvoka';

  @override
  String get mute => 'Izklopi zvok';

  @override
  String get branding => 'Znamčenje';

  @override
  String get adminDrawerDashboard => 'Nadzorna plošča';

  @override
  String get adminDrawerAnalytics => 'analitika';

  @override
  String get adminDrawerSettings => 'nastavitve';

  @override
  String get adminDrawerBranding => 'Znamčenje';

  @override
  String get adminDrawerUsers => 'Uporabniki';

  @override
  String get adminDrawerLibraries => 'Knjižnice';

  @override
  String get adminDrawerDisplay => 'Prikaz';

  @override
  String get adminDrawerMetadata => 'Metapodatki';

  @override
  String get adminDrawerNfo => 'Nastavitve NFO';

  @override
  String get adminDrawerTranscoding => 'Prekodiranje';

  @override
  String get adminDrawerResume => 'Nadaljuj';

  @override
  String get adminDrawerStreaming => 'Pretakanje';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Naprave';

  @override
  String get adminDrawerActivity => 'dejavnost';

  @override
  String get adminDrawerNetworking => 'Mreženje';

  @override
  String get adminDrawerApiKeys => 'API ključi';

  @override
  String get adminDrawerBackups => 'Varnostne kopije';

  @override
  String get adminDrawerLogs => 'Dnevniki';

  @override
  String get adminDrawerScheduledTasks => 'Načrtovana opravila';

  @override
  String get adminDrawerPlugins => 'Vtičniki';

  @override
  String get adminDrawerRepositories => 'Repozitoriji';

  @override
  String get adminDrawerLiveTv => 'TV v živo';

  @override
  String get adminExitTooltip => 'Izhod iz skrbnika';

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
      'Nadzorne plošče ni bilo mogoče naložiti';

  @override
  String get adminMediaOverview => 'Pregled medijev';

  @override
  String get adminMediaTotalsError =>
      'Skupnih vrednosti predstavnosti strežnika ni bilo mogoče naložiti.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Hitro branje o tem, koliko vsebine je na tem strežniku.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Na voljo posodobitve vtičnikov: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Vtičniki, ki zahtevajo ponovni zagon: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Neuspešna načrtovana opravila: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distribucija medijev';

  @override
  String get analyticsVideoCodecs => 'Video kodeki';

  @override
  String get analyticsAudioCodecs => 'Avdio kodeki';

  @override
  String get analyticsContainers => 'Zabojniki';

  @override
  String get analyticsTopGenres => 'Najboljši žanri';

  @override
  String get analyticsReleaseYears => 'Leta izdaje';

  @override
  String get analyticsContentRatings => 'Ocene vsebine';

  @override
  String get analyticsRuntimeBuckets => 'Vedra izvajalnega časa';

  @override
  String get analyticsFileFormats => 'Formati datotek';

  @override
  String get analyticsNoData => 'Podatki niso na voljo.';

  @override
  String get adminServerInfo => 'Informacije o strežniku';

  @override
  String get adminRestartPending => 'Ponovni zagon čaka';

  @override
  String get adminServerPaths => 'Poti strežnika';

  @override
  String get adminServerActions => 'Dejanja strežnika';

  @override
  String get adminRestartServer => 'Ponovno zaženite strežnik';

  @override
  String get adminShutdownServer => 'Zaustavitev strežnika';

  @override
  String get adminLibraryScanStarted => 'Skeniranje knjižnice se je začelo';

  @override
  String errorGeneric(String error) {
    return 'Napaka: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Poteka ponovni zagon strežnika';

  @override
  String get adminServerRebootMessage =>
      'Poteka ponovni zagon strežnika, znova zaženite Moonfin';

  @override
  String get adminActiveSessions => 'Aktivne seje';

  @override
  String get adminSessionsLoadFailed => 'Nalaganje sej ni uspelo';

  @override
  String get adminNoActiveSessions => 'Ni aktivnih sej';

  @override
  String get adminRecentActivity => 'Nedavna dejavnost';

  @override
  String get adminNoRecentActivity => 'Ni nedavne dejavnosti';

  @override
  String adminCommandFailed(String error) {
    return 'Ukaz ni uspel: $error';
  }

  @override
  String get adminSendMessage => 'Pošlji sporočilo';

  @override
  String get adminMessageTextHint => 'Besedilo sporočila';

  @override
  String get adminSetVolume => 'Nastavite glasnost';

  @override
  String get sessionPrev => 'Prejšnji';

  @override
  String get sessionRewind => 'Previjanje nazaj';

  @override
  String get sessionForward => 'Naprej';

  @override
  String get sessionNext => 'Naslednji';

  @override
  String get sessionVolumeDown => 'Glas. –';

  @override
  String get sessionVolumeUp => 'Glas. +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Zdaj se predvaja';

  @override
  String get volume => 'Glasnost';

  @override
  String get actions => 'Dejanja';

  @override
  String get videoCodec => 'Video kodek';

  @override
  String get audioCodec => 'Avdio kodek';

  @override
  String get hwAccel => 'Strojno pospeševanje';

  @override
  String get completion => 'Dokončanje';

  @override
  String get adminClearDates => 'Jasni datumi';

  @override
  String get adminActivitySeverityAll => 'Vse stopnje resnosti';

  @override
  String get adminActivityDateRange => 'Časovno obdobje';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Dnevnika dejavnosti ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminNoActivityEntries => 'Ni vnosov dejavnosti';

  @override
  String get adminEditDeviceName => 'Uredi ime naprave';

  @override
  String get adminCustomName => 'Ime po meri';

  @override
  String get adminDeviceNameUpdated => 'Ime naprave posodobljeno';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Naprave ni bilo mogoče posodobiti: $error';
  }

  @override
  String get adminDeleteDevice => 'Izbriši napravo';

  @override
  String get adminDeviceDeleted => 'Naprava izbrisana';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Naprave ni bilo mogoče izbrisati: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Ali želite odstraniti napravo »$name«? Uporabnik se bo moral na tej napravi znova prijaviti.';
  }

  @override
  String get adminDeleteAllDevices => 'Izbriši vse naprave';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Ali želite odstraniti $count naprav? Prizadeti uporabniki se bodo morali znova prijaviti. To ne vpliva na vašo trenutno napravo.';
  }

  @override
  String get adminDevicesDeletedAll => 'Naprave odstranjene';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Nekatere naprave so odstranjene, $count jih ni bilo mogoče odstraniti.';
  }

  @override
  String get adminDevicesLoadFailed => 'Nalaganje naprav ni uspelo';

  @override
  String get adminSearchDevices => 'Iskanje naprav';

  @override
  String get adminThisDevice => 'Ta naprava';

  @override
  String get adminEditName => 'Uredi ime';

  @override
  String get adminLibrariesLoadFailed => 'Nalaganje knjižnic ni uspelo';

  @override
  String get adminNoLibraries => 'Nobena knjižnica ni konfigurirana';

  @override
  String get adminScanAllLibraries => 'Preglej vse knjižnice';

  @override
  String get adminAddLibrary => 'Dodaj knjižnico';

  @override
  String adminScanFailed(String error) {
    return 'Pregleda ni bilo mogoče zagnati: $error';
  }

  @override
  String get adminRenameLibrary => 'Preimenuj knjižnico';

  @override
  String get adminNewName => 'Novo ime';

  @override
  String adminLibraryRenamed(String name) {
    return 'Knjižnica je preimenovana v »$name«';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Preimenovanje ni uspelo: $error';
  }

  @override
  String get adminDeleteLibrary => 'Izbriši knjižnico';

  @override
  String adminLibraryDeleted(String name) {
    return 'Knjižnica »$name« je izbrisana';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Knjižnice ni bilo mogoče izbrisati: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Poti ni bilo mogoče dodati: $error';
  }

  @override
  String get adminRemovePath => 'Odstrani pot';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Ali želite odstraniti »$path« iz te knjižnice?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Poti ni bilo mogoče odstraniti: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nalaganje knjižnice ni uspelo';

  @override
  String get adminNoMediaPaths => 'Nobena konfigurirana pot medija';

  @override
  String get adminAddPath => 'Dodaj pot';

  @override
  String get adminBrowseFilesystem =>
      'Brskanje po datotečnem sistemu strežnika:';

  @override
  String get adminPreferredMetadataLanguage => 'Prednostni jezik metapodatkov';

  @override
  String get adminMetadataLanguageHint => 'npr. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Koda države metapodatkov';

  @override
  String get adminMetadataCountryHint => 'npr. ZDA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Poti';

  @override
  String get adminLibraryTabOptions => 'Možnosti';

  @override
  String get adminLibraryTabDownloaders => 'Prenosniki';

  @override
  String get adminLibMetadataSavers => 'Shranjevalniki metapodatkov';

  @override
  String get adminLibSubtitleDownloaders => 'Prenosniki podnapisov';

  @override
  String get adminLibLyricDownloaders => 'Prenosniki besedil';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Prenosniki metapodatkov: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Pridobivalniki slik: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Ta strežnik za to vrsto knjižnice ne ponuja nobenih prenosnikov.';

  @override
  String get adminLibrarySectionGeneral => 'Splošno';

  @override
  String get adminLibrarySectionMetadata => 'Metapodatki';

  @override
  String get adminLibrarySectionEmbedded => 'Vgrajeni podatki';

  @override
  String get adminLibrarySectionSubtitles => 'Podnapisi';

  @override
  String get adminLibrarySectionImages => 'Slike';

  @override
  String get adminLibrarySectionSeries => 'Serije';

  @override
  String get adminLibrarySectionMusic => 'Glasba';

  @override
  String get adminLibrarySectionMovies => 'Filmi';

  @override
  String get adminLibRealtimeMonitor => 'Omogoči spremljanje v realnem času';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Zaznaj spremembe datotek in jih samodejno obdelaj.';

  @override
  String get adminLibEnablePhotos => 'Prikaži fotografije';

  @override
  String get adminLibSaveLocalMetadata =>
      'Shrani slikovno gradivo v predstavnostne mape';

  @override
  String get adminLibRefreshInterval => 'Samodejno osveževanje metapodatkov';

  @override
  String get adminLibRefreshNever => 'Nikoli';

  @override
  String get adminLibDefault => 'Privzeto';

  @override
  String get adminLibDisplayTitle => 'Prikaz';

  @override
  String get adminLibDisplaySection => 'Prikaz knjižnice';

  @override
  String get adminLibFolderView =>
      'Prikaži pogled map z navadnimi predstavnostnimi mapami';

  @override
  String get adminLibSpecialsInSeasons =>
      'Prikaži posebne epizode v sezonah, v katerih so bile predvajane';

  @override
  String get adminLibGroupMovies => 'Združi filme v zbirke';

  @override
  String get adminLibGroupShows => 'Združi serije v zbirke';

  @override
  String get adminLibExternalSuggestions =>
      'Prikaži zunanjo vsebino med predlogi';

  @override
  String get adminLibDateAddedSection => 'Ravnanje z datumom dodajanja';

  @override
  String get adminLibDateAddedLabel => 'Uporabi datum dodajanja iz';

  @override
  String get adminLibDateAddedImport => 'Datum pregleda v knjižnico';

  @override
  String get adminLibDateAddedFile => 'Datum nastanka datoteke';

  @override
  String get adminLibMetadataTitle => 'Metapodatki in slike';

  @override
  String get adminLibMetadataLangSection => 'Prednostni jezik metapodatkov';

  @override
  String get adminLibChaptersSection => 'Poglavja';

  @override
  String get adminLibDummyChapterDuration =>
      'Trajanje nadomestnih poglavij (sekunde)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Dolžina poglavij, ustvarjenih za vsebine, ki jih nimajo. Nastavite na 0, da to onemogočite.';

  @override
  String get adminLibChapterImageResolution => 'Ločljivost slik poglavij';

  @override
  String get adminLibNfoTitle => 'Nastavitve NFO';

  @override
  String get adminLibNfoHelp =>
      'Metapodatki NFO so združljivi s Kodi in podobnimi odjemalci. Nastavitve veljajo za vse knjižnice, ki shranjujejo metapodatke NFO.';

  @override
  String get adminLibKodiUser =>
      'Uporabnik, za katerega se v datotekah NFO shranjujejo podatki o gledanju';

  @override
  String get adminLibSaveImagePaths => 'Shrani poti do slik v datoteke NFO';

  @override
  String get adminLibPathSubstitution =>
      'Omogoči zamenjavo poti za poti do slik v NFO';

  @override
  String get adminLibExtraThumbs =>
      'Kopiraj slike extrafanart v mapo extrathumbs';

  @override
  String get adminLibNone => 'Brez';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dni';
  }

  @override
  String get adminLibEmbeddedTitles => 'Uporabi vgrajene naslove';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Uporabi vgrajene naslove za dodatke';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Uporabi vgrajene podatke o epizodah';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Dovoli vgrajene podnapise';

  @override
  String get adminLibEmbeddedAllowAll => 'Dovoli vse';

  @override
  String get adminLibEmbeddedAllowText => 'Samo besedilne';

  @override
  String get adminLibEmbeddedAllowImage => 'Samo slikovne';

  @override
  String get adminLibEmbeddedAllowNone => 'Brez';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Preskoči prenos, če so prisotni vgrajeni podnapisi';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Preskoči prenos, če se zvočna sled ujema z jezikom prenosa';

  @override
  String get adminLibRequirePerfectMatch =>
      'Zahtevaj popolno ujemanje podnapisov';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Shrani podnapise v predstavnostne mape';

  @override
  String get adminLibChapterImageExtraction => 'Izlušči slike poglavij';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Izlušči slike poglavij med pregledom knjižnice';

  @override
  String get adminLibTrickplayExtraction => 'Omogoči luščenje slik trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Izlušči slike trickplay med pregledom knjižnice';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Shrani slike trickplay v predstavnostne mape';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Samodejno združi serije, ki so razpršene po več mapah';

  @override
  String get adminLibSeasonZeroName => 'Prikazano ime ničte sezone';

  @override
  String get adminLibLufsScan =>
      'Omogoči pregled LUFS za normalizacijo glasnosti';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Prednostno uporabi nestandardno oznako izvajalcev';

  @override
  String get adminLibAutoAddToCollection => 'Samodejno dodajaj filme v zbirke';

  @override
  String get adminLibraryNameRequired => 'Zahtevano je ime knjižnice';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Knjižnice ni bilo mogoče ustvariti: $error';
  }

  @override
  String get adminLibraryName => 'Ime knjižnice';

  @override
  String get adminSelectedPaths => 'Izbrane poti:';

  @override
  String get adminCreateLibrary => 'Ustvari knjižnico';

  @override
  String get paths => 'Poti:';

  @override
  String get adminDisableUser => 'Onemogoči uporabnika';

  @override
  String get adminEnableUser => 'Omogoči uporabnika';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Ali želite onemogočiti uporabnika $name? Ne bo se mogel prijaviti.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Ali želite omogočiti uporabnika $name? Znova se bo lahko prijavil.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Uporabnik »$name« je onemogočen';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Uporabnik »$name« je omogočen';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Pravilnika uporabnika ni bilo mogoče posodobiti: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Uporabnikov ni bilo mogoče naložiti';

  @override
  String get adminSearchUsers => 'Iskanje uporabnikov';

  @override
  String get adminEditUser => 'Uredi uporabnika';

  @override
  String get adminAddUser => 'Dodaj uporabnika';

  @override
  String adminUserCreateFailed(String error) {
    return 'Uporabnika ni bilo mogoče ustvariti: $error';
  }

  @override
  String get adminCreateUser => 'Ustvari uporabnika';

  @override
  String get adminPasswordOptional => 'Geslo (neobvezno)';

  @override
  String get adminUsernameRequired => 'Uporabniško ime ne sme biti prazno';

  @override
  String adminSaveFailed(String error) {
    return 'Shranjevanje ni uspelo: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Gesli se ne ujemata';

  @override
  String adminFailed(String error) {
    return 'Ni uspelo: $error';
  }

  @override
  String get adminUserLoadFailed => 'Uporabnika ni bilo mogoče naložiti';

  @override
  String get adminDeleteUser => 'Izbriši uporabnika';

  @override
  String get admin => 'skrbnik';

  @override
  String get adminFullAccessWarning =>
      'Administratorji imajo popoln dostop do strežnika. Dodelite previdno.';

  @override
  String get administrator => 'Skrbnik';

  @override
  String get adminHiddenUser => 'Skrit uporabnik';

  @override
  String get adminAllowMediaPlayback => 'Dovoli predvajanje medijev';

  @override
  String get adminAllowAudioTranscoding => 'Dovoli prekodiranje zvoka';

  @override
  String get adminAllowVideoTranscoding => 'Dovoli video prekodiranje';

  @override
  String get adminAllowRemuxing => 'Dovoli ponovno muksiranje';

  @override
  String get adminForceRemoteTranscoding =>
      'Vsili prekodiranje oddaljenega vira';

  @override
  String get adminAllowContentDownloading => 'Dovoli prenos vsebine';

  @override
  String get adminAllowPublicSharing => 'Dovoli javno skupno rabo';

  @override
  String get adminAllowRemoteControl =>
      'Dovoli daljinsko upravljanje drugih uporabnikov';

  @override
  String get adminAllowSharedDeviceControl => 'Dovoli skupni nadzor naprave';

  @override
  String get adminAllowRemoteAccess => 'Dovoli oddaljeni dostop';

  @override
  String get adminLeaveEmptyNoLimit => 'Pustite prazno, če ni omejitve';

  @override
  String get adminMaxActiveSessions => 'Največ aktivnih sej';

  @override
  String get adminAllowLiveTvAccess => 'Dovoli dostop do TV v živo';

  @override
  String get adminAllowLiveTvManagement => 'Dovoli upravljanje TV v živo';

  @override
  String get adminAllowCollectionManagement => 'Dovoli upravljanje zbirke';

  @override
  String get adminAllowSubtitleManagement => 'Dovoli upravljanje podnapisov';

  @override
  String get adminAllowLyricManagement => 'Dovoli upravljanje besedil';

  @override
  String get adminEnableAllLibraryAccess => 'Omogoči dostop do vseh knjižnic';

  @override
  String get adminChangePassword => 'Spremeni geslo';

  @override
  String get adminNewPassword => 'Novo geslo';

  @override
  String get adminConfirmPassword => 'Potrdite geslo';

  @override
  String get adminSetPassword => 'Nastavite geslo';

  @override
  String get adminResetPassword => 'Ponastavi geslo';

  @override
  String get adminPasswordReset => 'Ponastavitev gesla';

  @override
  String get adminPasswordUpdated => 'Geslo posodobljeno';

  @override
  String get adminUserSettings => 'Uporabniške nastavitve';

  @override
  String get adminLibraryAccess => 'Dostop do knjižnice';

  @override
  String get adminEnableAllDevices => 'Omogoči dostop do vseh naprav';

  @override
  String get adminEnableAllChannels => 'Omogoči dostop do vseh kanalov';

  @override
  String get adminParentalControl => 'Starševski nadzor';

  @override
  String get adminMaxParentalRating => 'Najvišja dovoljena starševska ocena';

  @override
  String get adminMaxParentalRatingHint =>
      'Vsebina z višjo oceno bo temu uporabniku skrita.';

  @override
  String get adminParentalRatingNone => 'Brez';

  @override
  String get adminBlockUnratedItems =>
      'Blokiraj elemente brez ocene ali z neprepoznano oceno';

  @override
  String get adminUnratedBook => 'Knjige';

  @override
  String get adminUnratedChannelContent => 'Kanali';

  @override
  String get adminUnratedLiveTvChannel => 'TV v živo';

  @override
  String get adminUnratedMovie => 'Filmi';

  @override
  String get adminUnratedMusic => 'Glasba';

  @override
  String get adminUnratedTrailer => 'Napovedniki';

  @override
  String get adminUnratedSeries => 'Serije';

  @override
  String get adminAccessSchedules => 'Urniki dostopa';

  @override
  String get adminAccessSchedulesHint =>
      'Dovoli dostop samo med spodaj načrtovanimi časi. Če urnik ni nastavljen, je dostop dovoljen ves dan.';

  @override
  String get adminAddSchedule => 'Dodaj urnik';

  @override
  String get adminScheduleDay => 'Dan';

  @override
  String get adminScheduleStart => 'Začetek';

  @override
  String get adminScheduleEnd => 'Konec';

  @override
  String get adminDayEveryday => 'Vsak dan';

  @override
  String get adminDayWeekday => 'Delovnik';

  @override
  String get adminDayWeekend => 'Vikend';

  @override
  String get adminDaySunday => 'Nedelja';

  @override
  String get adminDayMonday => 'Ponedeljek';

  @override
  String get adminDayTuesday => 'Torek';

  @override
  String get adminDayWednesday => 'Sreda';

  @override
  String get adminDayThursday => 'Četrtek';

  @override
  String get adminDayFriday => 'Petek';

  @override
  String get adminDaySaturday => 'Sobota';

  @override
  String get adminAllowedTags => 'Dovoljene oznake';

  @override
  String get adminAllowedTagsHint =>
      'Prikazana je samo vsebina s temi oznakami. Pustite prazno, če želite dovoliti vse.';

  @override
  String get adminBlockedTags => 'Blokirane oznake';

  @override
  String get adminBlockedTagsHint =>
      'Vsebina s temi oznakami bo temu uporabniku skrita.';

  @override
  String get adminAddTag => 'Dodaj oznako';

  @override
  String get adminAuthProvider => 'Ponudnik overjanja';

  @override
  String get adminPasswordResetProvider => 'Ponudnik ponastavitve gesla';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Največje število neuspelih prijav pred zaklepom';

  @override
  String get adminLoginAttemptsHint =>
      'Nastavite 0 za privzeto vrednost ali -1, da zaklep onemogočite.';

  @override
  String get adminSyncPlayAccess => 'Dostop do SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Dovoli ustvarjanje skupin in pridruževanje';

  @override
  String get adminSyncPlayJoin => 'Dovoli pridruževanje skupinam';

  @override
  String get adminSyncPlayNone => 'Brez dostopa';

  @override
  String get adminContentDeletionFolders => 'Dovoli brisanje vsebine iz';

  @override
  String get adminResetPasswordWarning =>
      'To bo odstranilo geslo. Uporabnik se bo lahko prijavil brez gesla.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Strežnik je vrnil HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Ali ste prepričani, da želite izbrisati uporabnika $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Uporabnik »$name« je izbrisan';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Uporabnika ni bilo mogoče izbrisati: $error';
  }

  @override
  String get adminCreateApiKey => 'Ustvari ključ API';

  @override
  String get adminAppName => 'Ime aplikacije';

  @override
  String get adminApiKeyCreated => 'API ključ ustvarjen';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Ključ je bil uspešno ustvarjen. Strežnik ni vrnil žetona. Preverite ključe API strežnika.';

  @override
  String get adminKeyCopied => 'Ključ je kopiran v odložišče';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Ključa ni bilo mogoče ustvariti: $error';
  }

  @override
  String get adminKeyTokenMissing => 'V odgovoru strežnika manjka žeton ključa';

  @override
  String get adminRevokeApiKey => 'Prekliči ključ API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Ali želite preklicati ključ za $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Ključ API preklican';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Ključa ni bilo mogoče preklicati: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Ključev API ni bilo mogoče naložiti';

  @override
  String get adminApiKeysTitle => 'API ključi';

  @override
  String get adminCreateKey => 'Ustvari ključ';

  @override
  String get adminNoApiKeys => 'Ni ključev API-ja';

  @override
  String get adminUnknownApp => 'Neznana aplikacija';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Žeton: $token\\nUstvarjeno: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Ustvari varnostno kopijo';

  @override
  String get adminBackupDatabase => 'Zbirka podatkov';

  @override
  String get adminBackupDatabaseAlways => 'Vedno vključeno';

  @override
  String get adminBackupMetadata => 'Metapodatki';

  @override
  String get adminBackupSubtitles => 'Podnapisi';

  @override
  String get adminBackupTrickplay => 'Slike trickplay';

  @override
  String get adminCreatingBackup => 'Ustvarjanje varnostne kopije ...';

  @override
  String get adminBackupCreated =>
      'Varnostna kopija je bila uspešno ustvarjena';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Varnostne kopije ni bilo mogoče ustvariti: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'V odgovoru strežnika manjka varnostna pot';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Manifesta ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminConfirmRestore => 'Potrdite obnovitev';

  @override
  String get adminRestoringBackup => 'Obnavljanje varnostne kopije ...';

  @override
  String adminRestoreFailed(String error) {
    return 'Varnostne kopije ni bilo mogoče obnoviti: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Nalaganje varnostnih kopij ni uspelo';

  @override
  String get adminCreateBackup => 'Ustvari varnostno kopijo';

  @override
  String get adminNoBackups => 'Ni varnostnih kopij';

  @override
  String get adminViewDetails => 'Poglej podrobnosti';

  @override
  String get restore => 'Obnovi';

  @override
  String get adminLogsLoadFailed =>
      'Dnevnikov strežnika ni bilo mogoče naložiti';

  @override
  String get adminNoLogFiles => 'Ni najdenih dnevniških datotek';

  @override
  String get adminLogCopied => 'Dnevnik kopiran v odložišče';

  @override
  String get adminSaveLogFile => 'Shrani dnevniško datoteko';

  @override
  String adminSavedTo(String path) {
    return 'Shranjeno v $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Datoteke ni bilo mogoče shraniti: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Ni bilo mogoče naložiti $fileName';
  }

  @override
  String get adminSearchInLog => 'Iskanje v dnevniku';

  @override
  String get adminNoMatchingLines => 'Ni ustreznih vrstic';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Opravil ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Ni načrtovanih opravil';

  @override
  String get adminNoTasksMatchFilter =>
      'Nobeno opravilo se ne ujema s trenutnim filtrom';

  @override
  String adminTaskStartFailed(String error) {
    return 'Opravila ni bilo mogoče zagnati: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Opravila ni bilo mogoče ustaviti: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Opravila ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminRunNow => 'Zaženi zdaj';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Sprožilca ni bilo mogoče odstraniti: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Sprožilca ni bilo mogoče dodati: $error';
  }

  @override
  String get adminLastExecution => 'Zadnja usmrtitev';

  @override
  String get adminTriggers => 'Sprožilci';

  @override
  String get adminAddTrigger => 'Dodaj sprožilec';

  @override
  String get adminNoTriggers => 'Ni konfiguriranih sprožilcev';

  @override
  String get adminTriggerType => 'Vrsta sprožilca';

  @override
  String get adminNoLimit => 'Brez omejitev';

  @override
  String adminHours(String hours) {
    return '$hours ur';
  }

  @override
  String get adminDayOfWeek => 'Dan v tednu';

  @override
  String get adminSearchPlugins => 'Iskanje vtičnikov ...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Vtičnika ni bilo mogoče preklopiti: $error';
  }

  @override
  String get adminUninstallPlugin => 'Odstrani vtičnik';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Ali ste prepričani, da želite odstraniti »$name«?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Vtičnika ni bilo mogoče odstraniti: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Paketa ni bilo mogoče namestiti: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Posodobitve ni bilo mogoče namestiti: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Vtičnikov ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Noben vtičnik ne ustreza vašemu iskanju';

  @override
  String get adminNoPluginsInstalled => 'Ni nameščenih vtičnikov';

  @override
  String adminInstallUpdate(String version) {
    return 'Namesti posodobitev (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Kataloga ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Noben paket ne ustreza vašemu iskanju';

  @override
  String get adminNoPackagesAvailable => 'Na voljo ni nobenih paketov';

  @override
  String get adminExperimentalIntegration => 'Eksperimentalna integracija';

  @override
  String get adminExperimentalWarning =>
      'Integracija nastavitev vtičnika je še poskusna. Nekatere strani z nastavitvami morda ne bodo pravilno upodobljene.';

  @override
  String get continueAction => 'Nadaljuj';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '»$name« bo odstranjen po ponovnem zagonu strežnika';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Odstranitev ni uspela: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Posodabljanje »$name« na v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Vtičnika ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminPluginNotFound => 'Vtičnika ni bilo mogoče najti';

  @override
  String adminPluginVersion(String version) {
    return 'Različica $version';
  }

  @override
  String get adminEnablePlugin => 'Omogoči vtičnik';

  @override
  String get adminPluginSettingsPage => 'Stran z nastavitvami vtičnika';

  @override
  String get adminRevisionHistory => 'Zgodovina revizij';

  @override
  String get adminNoChangelog => 'Dnevnik sprememb ni na voljo.';

  @override
  String get adminRemoveRepository => 'Odstrani repozitorij';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Ali ste prepričani, da želite odstraniti »$name«?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Repozitorijev ni bilo mogoče shraniti: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Repozitorijev ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminRepositoryNameHint => 'npr. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL skladišča';

  @override
  String get adminAddEntry => 'Dodaj vnos';

  @override
  String get adminInvalidUrl => 'Neveljaven URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Nastavitev vtičnika ni mogoče naložiti: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Ni bilo mogoče odpreti $uri';
  }

  @override
  String get adminOpenInBrowser => 'Odpri v brskalniku';

  @override
  String get adminOpenExternally => 'Odprto navzven';

  @override
  String get adminGeneralSettings => 'Splošne nastavitve';

  @override
  String get adminServerName => 'Ime strežnika';

  @override
  String get adminPreferredMetadataCountry => 'Prednostna država metapodatkov';

  @override
  String get adminCachePath => 'Pot predpomnilnika';

  @override
  String get adminMetadataPath => 'Pot do metapodatkov';

  @override
  String get adminLibraryScanConcurrency => 'Sočasnost skeniranja knjižnice';

  @override
  String get adminParallelImageEncodingLimit =>
      'Omejitev vzporednega kodiranja slike';

  @override
  String get adminSlowResponseThreshold => 'Prag počasnega odziva (ms)';

  @override
  String get adminBrandingLoadFailed =>
      'Nastavitev blagovne znamke ni bilo mogoče naložiti';

  @override
  String get adminLoginDisclaimer => 'Zavrnitev odgovornosti za prijavo';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML prikazan pod obrazcem za prijavo';

  @override
  String get adminCustomCss => 'CSS po meri';

  @override
  String get adminCustomCssHint => 'CSS po meri, uporabljen za spletni vmesnik';

  @override
  String get adminEnableSplashScreen => 'Omogoči začetni zaslon';

  @override
  String get adminStreamingLoadFailed =>
      'Nastavitev pretakanja ni bilo mogoče naložiti';

  @override
  String get adminStreamingDescription =>
      'Nastavite globalne omejitve bitne hitrosti pretakanja za oddaljene povezave.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Omejitev bitne hitrosti oddaljenega odjemalca (Mb/s)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Pustite prazno ali 0 za neomejeno';

  @override
  String get adminPlaybackLoadFailed =>
      'Nalaganje nastavitev predvajanja ni uspelo';

  @override
  String get adminHardwareAcceleration => 'Strojno pospeševanje';

  @override
  String get adminVaapiDevice => 'Naprava VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Omogoči strojno kodiranje';

  @override
  String get adminEnableHardwareDecoding =>
      'Omogoči dekodiranje strojne opreme za:';

  @override
  String get adminEncodingThreads => 'Kodiranje niti';

  @override
  String get adminAutomatic => '0 = samodejno';

  @override
  String get adminTranscodingTempPath => 'Začasna pot prekodiranja';

  @override
  String get adminEnableFallbackFont => 'Omogoči nadomestno pisavo';

  @override
  String get adminFallbackFontPath => 'Nadomestna pot pisave';

  @override
  String get adminAllowSegmentDeletion => 'Dovoli brisanje segmenta';

  @override
  String get adminSegmentKeepSeconds => 'Ohranjanje segmenta (sekunde)';

  @override
  String get adminThrottleBuffering => 'Medpomnilnik plina';

  @override
  String get adminTrickplayLoadFailed =>
      'Nastavitev trickplaya ni bilo mogoče naložiti';

  @override
  String get adminEnableHardwareAcceleration => 'Omogoči strojno pospeševanje';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Omogoči ekstrakcijo samo ključnih okvirjev';

  @override
  String get adminKeyFrameSubtitle => 'Hitrejši, vendar nižja natančnost';

  @override
  String get adminScanBehavior => 'Vedenje skeniranja';

  @override
  String get adminProcessPriority => 'Prednost postopka';

  @override
  String get adminImageSettings => 'Nastavitve slike';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Kako pogosto zajemati okvirje';

  @override
  String get adminWidthResolutions => 'Ločljivosti širine';

  @override
  String get adminTileWidth => 'Širina ploščice';

  @override
  String get adminTileHeight => 'Višina ploščice';

  @override
  String get adminQualitySubtitle =>
      'Nižje vrednosti = boljša kakovost, večje datoteke';

  @override
  String get adminProcessThreads => 'Obdelajte niti';

  @override
  String get adminResumeLoadFailed =>
      'Nalaganje nastavitev nadaljevanja ni uspelo';

  @override
  String get adminResumeDescription =>
      'Konfigurirajte, kdaj naj bo vsebina označena kot delno ali v celoti predvajana.';

  @override
  String get adminMinResumePercentage => 'Najmanjši odstotek nadaljevanja';

  @override
  String get adminMinResumeSubtitle =>
      'Vsebino je treba predvajati nad tem odstotkom, da shranite napredek';

  @override
  String get adminMaxResumePercentage => 'Največji odstotek nadaljevanja';

  @override
  String get adminMaxResumeSubtitle =>
      'Vsebina se po tem odstotku šteje za v celoti predvajano';

  @override
  String get adminMinResumeDuration =>
      'Minimalno trajanje nadaljevanja (sekunde)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Elementov, krajših od tega, ni mogoče nadaljevati';

  @override
  String get adminMinAudiobookResume =>
      'Najmanjši odstotek nadaljevanja zvočne knjige';

  @override
  String get adminMaxAudiobookResume =>
      'Največji odstotek nadaljevanja zvočne knjige';

  @override
  String get adminNetworkingLoadFailed =>
      'Omrežnih nastavitev ni bilo mogoče naložiti';

  @override
  String get adminNetworkingWarning =>
      'Spremembe omrežnih nastavitev bodo morda zahtevale ponovni zagon strežnika.';

  @override
  String get adminEnableRemoteAccess => 'Omogoči oddaljeni dostop';

  @override
  String get ports => 'Pristanišča';

  @override
  String get adminHttpPort => 'HTTP vrata';

  @override
  String get adminHttpsPort => 'vrata HTTPS';

  @override
  String get adminPublicHttpsPort => 'Javna vrata HTTPS';

  @override
  String get adminBaseUrl => 'Osnovni URL';

  @override
  String get adminBaseUrlHint => 'npr. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Omogoči HTTPS';

  @override
  String get adminLocalNetwork => 'Lokalno omrežje';

  @override
  String get adminLocalNetworkAddresses => 'Naslovi lokalnega omrežja';

  @override
  String get adminKnownProxies => 'Znani posredniki';

  @override
  String get adminRemoteIpFilter => 'Oddaljeni IP filter';

  @override
  String get adminRemoteIpFilterEntries => 'Oddaljeni IP filter';

  @override
  String get adminCertificatePath => 'Pot potrdila';

  @override
  String get whitelist => 'Seznam dovoljenih';

  @override
  String get blacklist => 'Črni seznam';

  @override
  String get notSet => 'Ni nastavljeno';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Metapodatkov ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminRefreshMetadata => 'Osveži metapodatke';

  @override
  String get recursive => 'Rekurzivno';

  @override
  String get adminReplaceAllMetadata => 'Zamenjaj vse metapodatke';

  @override
  String get adminMetadataRefreshRequested =>
      'Zahtevana je osvežitev metapodatkov';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Metapodatkov ni bilo mogoče osvežiti: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Ni oddaljenih ujemanj';

  @override
  String get adminRemoteResults => 'Rezultati na daljavo';

  @override
  String get adminRemoteMetadataApplied =>
      'Uporabljeni so oddaljeni metapodatki';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Oddaljeno iskanje ni uspelo: $error';
  }

  @override
  String get adminUpdateContentType => 'Posodobi vrsto vsebine';

  @override
  String get adminContentType => 'Vrsta vsebine';

  @override
  String get adminContentTypeUpdated => 'Vrsta vsebine posodobljena';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Vrste vsebine ni bilo mogoče posodobiti: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Urejevalnika metapodatkov ni bilo mogoče naložiti';

  @override
  String get adminNoPeopleEntries => 'Ni vnosov oseb';

  @override
  String get adminNoExternalIds => 'Zunanji ID-ji niso na voljo';

  @override
  String adminImageUpdated(String imageType) {
    return 'Slika $imageType je posodobljena';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Slike ni bilo mogoče prenesti: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nepodprt format slike';

  @override
  String get adminImageReadFailed => 'Izbrane slike ni bilo mogoče prebrati';

  @override
  String adminImageUploaded(String imageType) {
    return 'Slika $imageType je naložena';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Slike ni bilo mogoče naložiti: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Izbriši sliko $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Slika $imageType je izbrisana';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Slike ni bilo mogoče izbrisati: $error';
  }

  @override
  String get adminAllProviders => 'Vsi ponudniki';

  @override
  String get adminNoRemoteImages => 'Ni oddaljenih slik';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Iskanje sprejemnikov ni uspelo: $error';
  }

  @override
  String get adminTunerTypeM3u => 'Sprejemnik M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Datoteka ali URL';

  @override
  String get adminTunerIpAddress => 'IP naslov sprejemnika';

  @override
  String get adminTunerFriendlyName => 'Razumljivo ime';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Omejitev hkratnih povezav';

  @override
  String get adminTunerCountHelp =>
      'Največje število pretokov, ki jih sprejemnik dovoli hkrati. Nastavite na 0 za neomejeno.';

  @override
  String get adminTunerFallbackBitrate =>
      'Nadomestna največja bitna hitrost pretakanja';

  @override
  String get adminTunerImportFavoritesOnly => 'Uvozi samo priljubljene kanale';

  @override
  String get adminTunerAllowHwTranscoding => 'Dovoli strojno prekodiranje';

  @override
  String get adminTunerAllowFmp4 => 'Dovoli vsebnik za prekodiranje fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Dovoli deljenje pretokov';

  @override
  String get adminTunerEnableStreamLooping => 'Omogoči ponavljanje pretoka';

  @override
  String get adminTunerIgnoreDts => 'Prezri DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Beri vhod z izvorno hitrostjo sličic';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Datoteka ali URL';

  @override
  String get adminXmltvMoviePrefix => 'Predpona filmov';

  @override
  String get adminXmltvMovieCategories => 'Kategorije filmov';

  @override
  String get adminXmltvCategoriesHelp => 'Več kategorij ločite z navpičnico.';

  @override
  String get adminXmltvKidsCategories => 'Kategorije za otroke';

  @override
  String get adminXmltvNewsCategories => 'Kategorije novic';

  @override
  String get adminXmltvSportsCategories => 'Kategorije športa';

  @override
  String get adminSdUsername => 'Uporabniško ime';

  @override
  String get adminSdPassword => 'Geslo';

  @override
  String get adminSdCountry => 'Država';

  @override
  String get adminSdCountrySelect => 'Izberite državo';

  @override
  String get adminSdPostalCode => 'Poštna številka';

  @override
  String get adminEnableAllTuners => 'Omogoči vse sprejemnike';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Sprejemnika ni bilo mogoče odstraniti: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Ponudnika ni bilo mogoče odstraniti: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Pot snemanja serije';

  @override
  String get adminMovieRecordingPath => 'Pot za snemanje filmov';

  @override
  String get adminGuideDaysAuto => 'Samodejno';

  @override
  String get adminRecordingPostProcessor =>
      'Pot do aplikacije za naknadno obdelavo';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumenti naknadne obdelave';

  @override
  String get adminSaveRecordingNfo => 'Shrani metapodatke NFO posnetkov';

  @override
  String get adminSaveRecordingImages => 'Shrani slike posnetkov';

  @override
  String get adminLiveTvSectionPaths => 'Poti posnetkov';

  @override
  String get adminLiveTvSectionPostProcessing => 'Naknadna obdelava';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nastavitev ni bilo mogoče shraniti: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nalaganje administracije TV v živo ni uspelo';

  @override
  String get adminTunerDevices => 'Uglaševalne naprave';

  @override
  String get adminNoTunerHosts => 'Konfiguriran ni noben sprejemnik';

  @override
  String get adminGuideProviders => 'Ponudniki vodnikov';

  @override
  String get adminGuideRefreshStarted =>
      'Osveževanje podatkov sporeda se je začelo';

  @override
  String get adminGuideRefreshUnavailable =>
      'Opravilo za osveževanje sporeda na tem strežniku ni na voljo.';

  @override
  String get adminNoListingProviders => 'Konfiguriran ni noben ponudnik vnosov';

  @override
  String get adminSettingsSaved => 'Nastavitve shranjene';

  @override
  String get adminBackupsNotAvailable =>
      'Varnostne kopije niso na voljo v tej različici strežnika.';

  @override
  String get adminRestoreWarning1 =>
      'Obnovitev bo zamenjala VSE trenutne podatke strežnika s podatki varnostne kopije.';

  @override
  String get adminRestoreWarning2 =>
      'Trenutne nastavitve strežnika, uporabniki in podatki knjižnice bodo prepisani.';

  @override
  String get adminRestoreWarning3 =>
      'Strežnik se bo po obnovitvi znova zagnal.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Ali želite zdaj obnoviti varnostno kopijo $name?';
  }

  @override
  String get adminBackupsTitle => 'Varnostne kopije';

  @override
  String get adminUnknownDate => 'Neznan datum';

  @override
  String get adminUnnamedBackup => 'Neimenovana varnostna kopija';

  @override
  String get adminApply => 'Uporabi';

  @override
  String get adminLogsTitle => 'Dnevniki strežnika';

  @override
  String get adminLogsNewestFirst => 'Najprej najnovejše';

  @override
  String get adminLogsOldestFirst => 'Najprej najstarejši';

  @override
  String get adminLogsJustNow => 'Pravkar';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'pred $minutes min';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'pred $hours h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'pred $days d';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Ni bilo mogoče naložiti $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count zadetkov';
  }

  @override
  String get adminLogViewerNoMatches => 'Ni ustreznih vrstic';

  @override
  String get adminMetadataEditorTitle => 'Urejevalnik metapodatkov';

  @override
  String get adminMetadataIdentify => 'Prepoznaj';

  @override
  String get adminMetadataType => 'Vrsta';

  @override
  String get adminMetadataDetails => 'Podrobnosti';

  @override
  String get adminMetadataExternalIds => 'Zunanji ID-ji';

  @override
  String get adminMetadataImages => 'Slike';

  @override
  String get adminMetadataFieldTitle => 'Naslov';

  @override
  String get adminMetadataFieldSortTitle => 'Razvrsti naslov';

  @override
  String get adminMetadataFieldOriginalTitle => 'Izvirni naslov';

  @override
  String get adminMetadataFieldPremiereDate => 'Datum premiere (LLLL-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Končni datum (LLLL-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Leto proizvodnje';

  @override
  String get adminMetadataFieldOfficialRating => 'Uradna ocena';

  @override
  String get adminMetadataFieldCommunityRating => 'Ocena skupnosti';

  @override
  String get adminMetadataFieldCriticRating => 'Kritična ocena';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Pregled';

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
  String get adminMetadataTags => 'Oznake';

  @override
  String get adminMetadataStudios => 'Garsonjere';

  @override
  String get adminMetadataPeople => 'Ljudje';

  @override
  String get adminMetadataAddGenre => 'Dodajte zvrst';

  @override
  String get adminMetadataAddTag => 'Dodaj oznako';

  @override
  String get adminMetadataAddStudio => 'Dodaj studio';

  @override
  String get adminMetadataAddPerson => 'Dodaj osebo';

  @override
  String get adminMetadataEditPerson => 'Uredi osebo';

  @override
  String get adminMetadataRole => 'Vloga';

  @override
  String get adminMetadataImagePrimary => 'Primarni';

  @override
  String get adminMetadataImageBackdrop => 'Ozadje';

  @override
  String get adminMetadataImageLogo => 'Logotip';

  @override
  String get adminMetadataImageBanner => 'Pasica';

  @override
  String get adminMetadataImageThumb => 'Palec';

  @override
  String get adminMetadataProvider => 'Ponudnik';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Slika $imageType je posodobljena';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Slika $imageType je naložena';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Slika $imageType je izbrisana';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Slike ni bilo mogoče prenesti: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Izbrane slike ni bilo mogoče prebrati';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Slike ni bilo mogoče naložiti: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Izbriši sliko $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'S tem odstranite trenutno sliko iz predmeta.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Slike ni bilo mogoče izbrisati: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Izberi sliko $imageType';
  }

  @override
  String get adminMetadataUpload => 'Naloži';

  @override
  String get adminMetadataUpdate => 'posodobitev';

  @override
  String get adminMetadataRemoteImage => 'Slika na daljavo';

  @override
  String get adminPluginsInstalled => 'Nameščeno';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktiven';

  @override
  String get adminPluginsRestart => 'Znova zaženite';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Noben vtičnik ne ustreza vašemu iskanju';

  @override
  String get adminPluginsNoneInstalled => 'Ni nameščenih vtičnikov';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Na voljo je posodobitev: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Na voljo je posodobitev';

  @override
  String get adminPluginsPendingRemoval =>
      'Čaka na odstranitev po ponovnem zagonu';

  @override
  String get adminPluginsChangesPending => 'Spremembe čakajo na ponovni zagon';

  @override
  String get adminPluginsEnable => 'Omogoči';

  @override
  String get adminPluginsDisable => 'Onemogoči';

  @override
  String get adminPluginsInstallUpdate => 'Namestite posodobitev';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Namesti posodobitev (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Noben paket ne ustreza vašemu iskanju';

  @override
  String get adminPluginsCatalogEmpty => 'Na voljo ni nobenih paketov';

  @override
  String adminPluginsInstalling(String name) {
    return '»$name« se namešča...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentalna integracija';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integracija nastavitev vtičnika je še poskusna. Nekatera polja ali postavitve morda še niso pravilno upodobljene.';

  @override
  String get adminPluginDetailToggle404 =>
      'Vtičnika ni bilo mogoče preklopiti. Strežnik ni mogel najti te različice vtičnika. Poskusite osvežiti vtičnike in poskusite znova.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Vtičnika ni bilo mogoče preklopiti. Za podrobnosti preverite dnevnike strežnika.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Nastavitve $name';
  }

  @override
  String get adminPluginDetailDetails => 'Podrobnosti';

  @override
  String get adminPluginDetailDeveloper => 'Razvijalec';

  @override
  String get adminPluginDetailRepository => 'Repozitorij';

  @override
  String get adminPluginDetailBundled => 'V paketu';

  @override
  String get adminPluginDetailEnablePlugin => 'Omogoči vtičnik';

  @override
  String get adminPluginDetailRestartRequired =>
      'Za uveljavitev sprememb je potreben ponovni zagon strežnika.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Ta vtičnik bo odstranjen po ponovnem zagonu strežnika.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Ta vtičnik ni deloval pravilno in morda ne bo deloval pravilno.';

  @override
  String get adminPluginDetailNotSupported =>
      'Trenutna različica strežnika ne podpira tega vtičnika.';

  @override
  String get adminPluginDetailSuperseded =>
      'Ta vtičnik je nadomestila novejša različica.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Repozitorijev ni bilo mogoče naložiti: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Odstrani repozitorij';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Ali ste prepričani, da želite odstraniti »$name«?';
  }

  @override
  String get adminReposRemove => 'Odstrani';

  @override
  String adminReposSaveFailed(String error) {
    return 'Repozitorijev ni bilo mogoče shraniti: $error';
  }

  @override
  String get adminReposEmpty => 'Ni konfiguriranih repozitorijev';

  @override
  String get adminReposEmptySubtitle =>
      'Dodajte repozitorij za brskanje po razpoložljivih vtičnikih';

  @override
  String get adminReposUnnamed => '(neimenovano)';

  @override
  String get adminReposEditTitle => 'Uredi repozitorij';

  @override
  String get adminReposAddTitle => 'Dodaj repozitorij';

  @override
  String get adminReposUrl => 'URL skladišča';

  @override
  String get adminReposNameHint => 'npr. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Neveljaven URL';

  @override
  String get adminGeneralSettingsTitle => 'Splošne nastavitve';

  @override
  String get adminGeneralMetadataLanguage => 'Prednostni jezik metapodatkov';

  @override
  String get adminGeneralMetadataLanguageHint => 'npr. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Prednostna država metapodatkov';

  @override
  String get adminGeneralMetadataCountryHint => 'npr. ZDA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Sočasnost skeniranja knjižnice';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Omejitev vzporednega kodiranja slike';

  @override
  String get adminUnknownError => 'Neznana napaka';

  @override
  String get adminBrowse => 'Prebrskaj';

  @override
  String get adminCloseBrowser => 'Zapri brskalnik';

  @override
  String get adminNetworkingTitle => 'Mreženje';

  @override
  String get adminNetworkingRestartWarning =>
      'Spremembe omrežnih nastavitev bodo morda zahtevale ponovni zagon strežnika.';

  @override
  String get adminNetworkingEnableHttps => 'Omogoči HTTPS';

  @override
  String get adminNetworkingAddressHint => 'npr. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Znani posredniki';

  @override
  String get adminNetworkingProxyHint => 'npr. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Seznam dovoljenih';

  @override
  String get adminNetworkingBlacklist => 'Črni seznam';

  @override
  String get adminNetworkingAddEntry => 'Dodaj vnos';

  @override
  String get adminBrandingTitle => 'Znamčenje';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Zavrnitev odgovornosti za prijavo';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML prikazan pod obrazcem za prijavo';

  @override
  String get adminBrandingCustomCss => 'CSS po meri';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS po meri, uporabljen za spletni vmesnik';

  @override
  String get adminBrandingEnableSplash => 'Omogoči začetni zaslon';

  @override
  String get adminBrandingSplashUpload => 'Naloži sliko';

  @override
  String get adminBrandingSplashUploaded => 'Uvodni zaslon je posodobljen';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Uvodnega zaslona ni bilo mogoče naložiti';

  @override
  String get adminBrandingSplashDeleted => 'Uvodni zaslon je odstranjen';

  @override
  String get adminBrandingNoSplash => 'Ni uvodnega zaslona po meri';

  @override
  String get adminPlaybackHwAccel => 'Strojni pospešek';

  @override
  String get adminPlaybackHwAccelLabel => 'Strojno pospeševanje';

  @override
  String get adminPlaybackEnableHwEncoding => 'Omogoči strojno kodiranje';

  @override
  String get adminPlaybackQsvDevice => 'Naprava QSV';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Omogoči izboljšani dekodirnik NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Prednostno uporabi izvorni sistemski strojni dekodirnik';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bitno dekodiranje HEVC';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bitno dekodiranje VP9';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      '8/10-bitno dekodiranje HEVC RExt';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      '12-bitno dekodiranje HEVC RExt';

  @override
  String get adminPlaybackHwEncodingSection => 'Strojno kodiranje';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Dovoli kodiranje HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Dovoli kodiranje AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Omogoči Intelov nizkoenergijski kodirnik H.264';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Omogoči Intelov nizkoenergijski kodirnik HEVC';

  @override
  String get adminPlaybackToneMapping => 'Preslikava tonov';

  @override
  String get adminPlaybackEnableTonemapping => 'Omogoči preslikavo tonov';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Omogoči preslikavo tonov VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Omogoči preslikavo tonov VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algoritem preslikave tonov';

  @override
  String get adminPlaybackTonemappingMode => 'Način preslikave tonov';

  @override
  String get adminPlaybackTonemappingRange => 'Obseg preslikave tonov';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Zmanjšanje nasičenosti pri preslikavi tonov';

  @override
  String get adminPlaybackTonemappingPeak => 'Vrh preslikave tonov';

  @override
  String get adminPlaybackTonemappingParam => 'Parameter preslikave tonov';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Svetlost preslikave tonov VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Kontrast preslikave tonov VPP';

  @override
  String get adminPlaybackEncoderPreset => 'Prednastavitev kodirnika';

  @override
  String get adminPlaybackH264Crf => 'CRF kodiranja H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF kodiranja H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Način razpletanja';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Podvoji hitrost sličic pri razpletanju';

  @override
  String get adminPlaybackAudioSection => 'Zvok';

  @override
  String get adminPlaybackEnableAudioVbr => 'Omogoči zvočno kodiranje VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Ojačitev zmiksanega zvoka';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritem zmiksanja v stereo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Največja velikost vrste za multipleksiranje';

  @override
  String get adminPlaybackAutoOption => 'Samodejno';

  @override
  String get adminPlaybackEncoding => 'Kodiranje';

  @override
  String get adminPlaybackEncodingThreads => 'Kodiranje niti';

  @override
  String get adminPlaybackFallbackFont => 'Omogoči nadomestno pisavo';

  @override
  String get adminPlaybackFallbackFontPath => 'Nadomestna pot pisave';

  @override
  String get adminPlaybackStreaming => 'Pretakanje';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Zvočne knjige';

  @override
  String get adminStreamingBitrateLimit =>
      'Omejitev bitne hitrosti oddaljenega odjemalca (Mb/s)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Pustite prazno ali 0 za neomejeno';

  @override
  String get adminTrickplayHwAccel => 'Omogoči strojno pospeševanje';

  @override
  String get adminTrickplayHwEncoding => 'Omogoči strojno kodiranje';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Omogoči ekstrakcijo samo ključnih okvirjev';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Hitrejši, vendar nižja natančnost';

  @override
  String get adminTrickplayNonBlocking => 'Brez blokiranja';

  @override
  String get adminTrickplayBlocking => 'Blokiranje';

  @override
  String get adminTrickplayPriorityHigh => 'visoko';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Nad normalno';

  @override
  String get adminTrickplayPriorityNormal => 'normalno';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Pod normalno';

  @override
  String get adminTrickplayPriorityIdle => 'nedejaven';

  @override
  String get adminTrickplayImageSettings => 'Nastavitve slike';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Kako pogosto zajemati okvirje';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Širine slikovnih pik, ločenih z vejico (npr. 320)';

  @override
  String get adminTrickplayQuality => 'Kakovost';

  @override
  String get adminTrickplayQScale => 'Lestvica kakovosti';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Nižje vrednosti = boljša kakovost, večje datoteke';

  @override
  String get adminTrickplayJpegQuality => 'Kakovost JPEG';

  @override
  String get adminTrickplayProcessing => 'Obdelava';

  @override
  String get adminTasksEmpty => 'Ni načrtovanih opravil';

  @override
  String get adminTasksNoFilterMatch =>
      'Nobeno opravilo se ne ujema s trenutnim filtrom';

  @override
  String get adminTaskCancelling => 'Preklic...';

  @override
  String get adminTaskRunning => 'Teče ...';

  @override
  String get adminTaskNeverRun => 'Nikoli ne teci';

  @override
  String get adminTaskStop => 'Ustavi';

  @override
  String get adminRunningTasks => 'Opravila v teku';

  @override
  String get adminTaskRun => 'Teči';

  @override
  String get adminTaskDetailLastExecution => 'Zadnja usmrtitev';

  @override
  String get adminTaskDetailStarted => 'Začelo';

  @override
  String get adminTaskDetailEnded => 'Končano';

  @override
  String get adminTaskDetailDuration => 'Trajanje';

  @override
  String get adminTaskDetailErrorLabel => 'Napaka:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Dnevno ob $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Vsak $day ob $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Ob zagonu aplikacije';

  @override
  String get adminTaskTriggerTypeDaily => 'Dnevno';

  @override
  String get adminTaskTriggerTypeWeekly => 'Tedensko';

  @override
  String get adminTaskTriggerTypeInterval => 'V intervalu';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

  @override
  String get adminTaskTriggerEveryHour => 'Vsako uro';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ur',
      few: '$count ure',
      two: '$count uri',
      one: '1 ura',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Čas';

  @override
  String get adminActivityJustNow => 'Pravkar';

  @override
  String get adminActivityLastHour => 'Zadnja ura';

  @override
  String get adminActivityToday => 'Danes';

  @override
  String get adminActivityYesterday => 'včeraj';

  @override
  String get adminActivityOlder => 'Starejši';

  @override
  String adminActivityDaysAgo(int days) {
    return 'pred $days d';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'pred $hours h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'pred $minutes min';
  }

  @override
  String get adminActivityNow => 'zdaj';

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
    return '$days d';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day. $month.';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigurirajte generiranje slike trickplay za sličice predogleda iskanja.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Javna vrata HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Osnovni URL';

  @override
  String get adminNetworkingBaseUrlHint => 'npr. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Javna vrata HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Zahtevaj HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Preusmeri vse oddaljene zahteve na HTTPS. Nima učinka, če strežnik nima veljavnega potrdila.';

  @override
  String get adminNetworkingCertPassword => 'Geslo potrdila';

  @override
  String get adminNetworkingEnableIpv4 => 'Omogoči IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Omogoči IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'Omrežja LAN';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Oddaljeni IP filter';

  @override
  String get adminPlaybackVaapiDevice => 'Naprava VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = samodejno';

  @override
  String get adminPlaybackTranscodeTempPath => 'Začasna pot prekodiranja';

  @override
  String get adminPlaybackSegmentDeletion => 'Dovoli brisanje segmenta';

  @override
  String get adminPlaybackSegmentKeep => 'Ohranjanje segmenta (sekunde)';

  @override
  String get adminPlaybackThrottleBuffering => 'Medpomnilnik plina';

  @override
  String get adminPlaybackThrottleDelay => 'Zakasnitev omejevanja (sekunde)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Dovoli sprotno luščenje podnapisov';

  @override
  String get adminResumeMinPct => 'Najmanjši odstotek nadaljevanja';

  @override
  String get adminResumeMinPctSubtitle =>
      'Vsebino je treba predvajati nad tem odstotkom, da shranite napredek';

  @override
  String get adminResumeMaxPct => 'Največji odstotek nadaljevanja';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Vsebina se po tem odstotku šteje za v celoti predvajano';

  @override
  String get adminResumeMinDuration =>
      'Minimalno trajanje nadaljevanja (sekunde)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Elementov, krajših od tega, ni mogoče nadaljevati';

  @override
  String get adminTrickplayScanBehavior => 'Vedenje skeniranja';

  @override
  String get adminTrickplayProcessPriority => 'Prednost postopka';

  @override
  String get adminTrickplayTileWidth => 'Širina ploščice';

  @override
  String get adminTrickplayTileHeight => 'Višina ploščice';

  @override
  String get adminTrickplayProcessThreads => 'Obdelajte niti';

  @override
  String get adminTrickplayWidthResolutions => 'Ločljivosti širine';

  @override
  String get adminMetadataDefault => 'Privzeto';

  @override
  String get adminMetadataContentTypeUpdated => 'Vrsta vsebine posodobljena';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Vrste vsebine ni bilo mogoče posodobiti: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Prag počasnega odziva (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Omogoči opozorila o počasnem odzivu';

  @override
  String get adminGeneralQuickConnect => 'Omogoči Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Strežnik';

  @override
  String get adminGeneralSectionMetadata => 'Metapodatki';

  @override
  String get adminGeneralSectionPaths => 'Poti';

  @override
  String get adminGeneralSectionPerformance => 'Zmogljivost';

  @override
  String get adminGeneralCachePath => 'Pot predpomnilnika';

  @override
  String get adminGeneralMetadataPath => 'Pot do metapodatkov';

  @override
  String get adminGeneralServerName => 'Ime strežnika';

  @override
  String get adminGeneralDisplayLanguage => 'Prednostni jezik prikaza';

  @override
  String get adminSettingsLoadFailed => 'Nastavitev ni bilo mogoče naložiti';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Preslikav ni bilo mogoče posodobiti: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Časovna omejitev: $duration';
  }

  @override
  String get folders => 'Mape';

  @override
  String get libraries => 'Knjižnice';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay onemogočen';

  @override
  String get syncPlayDisabledMessage =>
      'Omogočite SyncPlay v nastavitvah za uporabo sinhroniziranega predvajanja.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Strežnik ni podprt';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay zahteva strežnik Jellyfin. Trenutni strežnik tega ne podpira.';

  @override
  String get syncPlayGroupFallbackName => 'Skupina SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Skupina SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# udeležencev',
      few: '# udeleženci',
      two: '# udeleženca',
      one: '# udeleženec',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignoriraj čakanje';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Ne zadržujte skupine, medtem ko ta naprava medpomnilnik';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Nadaljujte lokalno, ne da bi čakali na počasne člane';

  @override
  String get syncPlayRepeat => 'ponovi';

  @override
  String get syncPlayRepeatOne => 'ena';

  @override
  String get syncPlayShuffleModeShuffled => 'Premešano';

  @override
  String get syncPlayShuffleModeSorted => 'Razvrščeno';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sinhroniziraj trenutno čakalno vrsto predvajanja';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Zamenjajte skupinsko čakalno vrsto s tem, kar se predvaja lokalno';

  @override
  String get syncPlayLeaveGroup => 'Zapusti skupino';

  @override
  String get syncPlayGroupQueue => 'Skupinska čakalna vrsta';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Element $index';
  }

  @override
  String get syncPlayPlayNow => 'Igraj zdaj';

  @override
  String get syncPlayCreateNewGroup => 'Ustvarite novo skupino';

  @override
  String get syncPlayGroupName => 'Ime skupine';

  @override
  String get syncPlayDefaultGroupName => 'Moja skupina SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Ustvari skupino';

  @override
  String get syncPlayAvailableGroups => 'Razpoložljive skupine';

  @override
  String get syncPlayNoGroupsAvailable => 'Ni na voljo nobene skupine';

  @override
  String get syncPlayJoinGroupQuestion => 'Se pridružite skupini SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Če se pridružite skupini SyncPlay, lahko zamenjate trenutno čakalno vrsto predvajanja. Nadaljevati?';

  @override
  String get syncPlayJoin => 'Pridruži se';

  @override
  String get syncPlayStateIdle => 'nedejaven';

  @override
  String get syncPlayStateWaiting => 'Čakanje';

  @override
  String get syncPlayStatePaused => 'Zaustavljeno';

  @override
  String get syncPlayStatePlaying => 'Igranje';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName se je pridružil skupini SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName je zapustil skupino SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Dostop do SyncPlay zavrnjen';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nimate dostopa do enega ali več elementov v tej skupini SyncPlay. Prosite lastnika skupine, da preveri dovoljenja za knjižnico, ali izberite drugo čakalno vrsto.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sinhroniziranje predvajanja s skupino $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Glasovno iskanje ni na voljo.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Neposredno predvajanje Dolby Vision ni uspelo';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Začetek neposrednega predvajanja tega toka Dolby Vision se ni uspel. Znova poskusiti uporabiti prekodiranje strežnika?';

  @override
  String get retryWithTranscode => 'Poskusite znova s ​​prekodiranjem';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision ni podprt';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Ta naprava ne more neposredno dekodirati vsebine Dolby Vision. Uporabite nadomestni HDR10 ali zahtevajte prekodiranje strežnika.';

  @override
  String get rememberMyChoice => 'Zapomni si mojo izbiro';

  @override
  String get playHdr10Fallback => 'Predvajajte nadomestni HDR10';

  @override
  String get requestTranscode => 'Zahtevaj prekodiranje';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'odkritih # vrstic',
      few: 'odkrite # vrstice',
      two: 'odkriti # vrstici',
      one: 'odkrita # vrstica',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Poglej vse';

  @override
  String get noItems => 'Ni predmetov';

  @override
  String get switchUser => 'Preklopi uporabnika';

  @override
  String get remoteControl => 'Daljinski upravljalnik';

  @override
  String get mediaBarLoading => 'Nalaganje medijske vrstice ...';

  @override
  String get mediaBarError => 'Medijske vrstice ni bilo mogoče naložiti';

  @override
  String get offlineServerUnavailable =>
      'Povezan z internetom, vendar trenutni strežnik ni na voljo.';

  @override
  String get offlineNoInternet =>
      'Ste brez povezave. Na voljo je samo prenesena vsebina.';

  @override
  String get offlineFileNotAvailable => 'Datoteka ni na voljo';

  @override
  String get offlineSwitchServer => 'Zamenjaj strežnik';

  @override
  String get offlineSavedMedia => 'Shranjeni mediji';

  @override
  String get offlineBannerTitle => 'Niste povezani';

  @override
  String get offlineBannerSubtitle => 'Prikazani so vaši prenosi';

  @override
  String get serverUnreachableBannerTitle => 'Strežnik ni dosegljiv';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Predvajanje iz prenosov, dokler se ne vrne';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Oddaljeno predvajanje';

  @override
  String castControlFailed(String error) {
    return 'Upravljanje predvajanja na napravi ni uspelo: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Upravljanje $kind';
  }

  @override
  String get castDeviceVolume => 'Glasnost naprave';

  @override
  String get castVolumeUnavailable => 'Ni na voljo';

  @override
  String castStopKind(String kind) {
    return 'Ustavi $kind';
  }

  @override
  String get audioLabel => 'Avdio';

  @override
  String get subtitlesLabel => 'Podnapisi';

  @override
  String get pinConfirmTitle => 'Potrdite PIN';

  @override
  String get pinSetTitle => 'Nastavite PIN';

  @override
  String get pinEnterTitle => 'Vnesite PIN';

  @override
  String get pinReenterToConfirm => 'Za potrditev znova vnesite PIN';

  @override
  String pinEnterNDigit(int length) {
    return 'Vnesite $length-mestno kodo PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Vnesite svojo $length-mestno kodo PIN';
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
  String get pinIncorrect => 'Napačen PIN';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN-a se ne ujemata';

  @override
  String get pinForgot => 'Ste pozabili PIN?';

  @override
  String get pinClear => 'Počisti';

  @override
  String get pinBackspace => 'vračalka';

  @override
  String get quickConnectAuthorized => 'Zahteva Quick Connect je odobrena.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Koda Quick Connect je neveljavna ali potekla.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect ni podprt na tem strežniku.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Kode Quick Connect ni bilo mogoče avtorizirati.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect je na tem strežniku onemogočen.';

  @override
  String get quickConnectForbidden =>
      'Vaš račun ne more odobriti te zahteve Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Kode Quick Connect ni bilo mogoče najti. Poskusite z novo kodo.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect ni uspel: $message';
  }

  @override
  String get quickConnectEnterCode => 'Vnesite kodo';

  @override
  String get quickConnectAuthorize => 'Pooblasti';

  @override
  String remoteCommandFailed(String error) {
    return 'Ukaz ni uspel: $error';
  }

  @override
  String get remoteControlTitle => 'Daljinski upravljalnik';

  @override
  String get remoteFailedToLoadSessions => 'Nalaganje sej ni uspelo';

  @override
  String get remoteNoSessions => 'Ni nadzorovanih sej';

  @override
  String get remoteStartPlayback => 'Začnite predvajanje na drugi napravi';

  @override
  String get unknownUser => 'Neznano';

  @override
  String get unknownItem => 'Neznano';

  @override
  String get remoteNothingPlaying => 'Na tej seji se nič ne predvaja';

  @override
  String get castingStarted => 'Predvajanje se je začelo v izbrani napravi';

  @override
  String castingFailed(String error) {
    return 'Predvajanja na napravi ni bilo mogoče začeti: $error';
  }

  @override
  String get noRemoteDevices =>
      'Na voljo ni nobena naprava za oddaljeno predvajanje.';

  @override
  String get noRemoteDevicesIos =>
      'Na voljo ni nobena naprava za oddaljeno predvajanje.\n\nV sistemu iOS cilji AirPlay morda niso na voljo v simulatorju.';

  @override
  String get trackActionPlayNext => 'Predvajaj naprej';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Dodaj v čakalno vrsto';

  @override
  String get trackActionAddToPlaylist => 'Dodaj na seznam predvajanja';

  @override
  String get trackActionCancelDownload => 'Prekliči prenos';

  @override
  String get trackActionDeleteFromPlaylist => 'Izbriši s seznama predvajanja';

  @override
  String get trackActionMoveUp => 'Premakni gor';

  @override
  String get trackActionMoveDown => 'Premakni navzdol';

  @override
  String get trackActionRemoveFromFavorites => 'Odstrani iz priljubljenih';

  @override
  String get trackActionAddToFavorites => 'Dodaj med priljubljene';

  @override
  String get trackActionGoToAlbum => 'Pojdite na Album';

  @override
  String get trackActionGoToArtist => 'Pojdite na Umetnik';

  @override
  String trackActionDownloading(String name) {
    return 'Prenašanje $name...';
  }

  @override
  String get trackActionDeletedFile => 'Izbrisana prenesena datoteka';

  @override
  String get trackActionDeleteFileFailed =>
      'Prenesene datoteke ni bilo mogoče izbrisati';

  @override
  String get shuffleBy => 'Premešaj po';

  @override
  String get shuffleSelectLibrary => 'Izberite Knjižnica';

  @override
  String get shuffleSelectGenre => 'Izberite žanr';

  @override
  String get shuffleLibrary => 'Knjižnica';

  @override
  String get shuffleGenre => 'Žanr';

  @override
  String get shuffleNoLibraries => 'Na voljo ni združljivih knjižnic.';

  @override
  String get shuffleNoGenres =>
      'Za ta način naključnega predvajanja ni bilo mogoče najti zvrsti.';

  @override
  String get posterDisplayTitle => 'Zaslon';

  @override
  String get posterImageType => 'Vrsta slike';

  @override
  String get imageTypePoster => 'Plakat';

  @override
  String get imageTypeThumbnail => 'Sličica';

  @override
  String get imageTypeBanner => 'Pasica';

  @override
  String get playlistAddFailed => 'Ni bilo mogoče dodati na seznam predvajanja';

  @override
  String get playlistCreateFailed =>
      'Seznama predvajanja ni bilo mogoče ustvariti';

  @override
  String get playlistNew => 'Nov seznam predvajanja';

  @override
  String get playlistCreate => 'Ustvari';

  @override
  String get playlistCreateNew => 'Ustvari nov seznam predvajanja';

  @override
  String get playlistNoneFound => 'Ni seznamov predvajanja';

  @override
  String get addToPlaylist => 'Dodaj na seznam predvajanja';

  @override
  String get lyricsNotAvailable => 'Na voljo ni nobenega besedila';

  @override
  String get upNext => 'Naprej';

  @override
  String get playNext => 'Predvajaj naprej';

  @override
  String get stillWatchingContent => 'Predvajanje je zaustavljeno. še gledaš?';

  @override
  String get stillWatchingStop => 'Ustavi';

  @override
  String get stillWatchingContinue => 'Nadaljuj';

  @override
  String skipSegment(String segment) {
    return 'Preskoči $segment';
  }

  @override
  String get liveTv => 'TV v živo';

  @override
  String get continueWatchingAndNextUp => 'Nadaljuj z ogledom in naprej';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Prenašanje $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Prenašanje $fileName';
  }

  @override
  String get nextEpisode => 'Naslednja epizoda';

  @override
  String get moreFromThisSeason => 'Več iz te sezone';

  @override
  String get playerTooltipPlaybackSpeed => 'Hitrost predvajanja';

  @override
  String get playerTooltipCastControls => 'Cast kontrole';

  @override
  String get playerTooltipPlaybackQuality => 'Bitna hitrost';

  @override
  String get playerTooltipEnterFullscreen => 'Vnesite celozaslonski način';

  @override
  String get playerTooltipExitFullscreen => 'Izhod iz celozaslonskega načina';

  @override
  String get playerTooltipFloatOnTop => 'Lebdi na vrhu';

  @override
  String get playerTooltipExitFloatOnTop => 'Onemogoči lebdenje na vrhu';

  @override
  String get playerTooltipLockLandscape => 'Zakleni pokrajino';

  @override
  String get playerTooltipUnlockOrientation => 'Dovoli vrtenje';

  @override
  String get playerTooltipPrevious => 'Prejšnji';

  @override
  String get playerTooltipSeekBack => 'Išči nazaj';

  @override
  String get playerTooltipSeekForward => 'Išči naprej';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Označi kot gledano';

  @override
  String get contextMenuMarkUnwatched => 'Označi kot neogledano';

  @override
  String get contextMenuAddToFavorites => 'Dodaj med priljubljene';

  @override
  String get contextMenuRemoveFromFavorites => 'Odstrani iz priljubljenih';

  @override
  String get contextMenuGoToSeries => 'Pojdite na Serije';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Skrij iz Nadaljuj z gledanjem';

  @override
  String get contextMenuHideFromNextUp => 'Skrij iz Sledi';

  @override
  String get contextMenuAddToCollection => 'Dodaj v zbirko';

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
      'Dostop do skrbniške plošče strežnika';

  @override
  String get settingsDynamicContent => 'Dinamična vsebina';

  @override
  String get settingsDynamicContentSubtitle =>
      'Medijska vrstica in vizualni prekrivki';

  @override
  String get settingsAboutSubtitle =>
      'Različica aplikacije, pravne informacije in krediti';

  @override
  String get settingsSortServersBy => 'Razvrsti strežnike po';

  @override
  String get settingsLastUsed => 'Nazadnje uporabljeno';

  @override
  String get settingsAlphabetical => 'Abecedno';

  @override
  String get settingsAllowSelfSignedCerts => 'Dovoli samopodpisana potrdila';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Zaupaj strežnikom s samopodpisanimi potrdili TLS ali potrdili zasebnega overitelja. Omogočite samo za strežnike, ki jih upravljate sami. S tem onemogočite preverjanje potrdil za vse povezave.';

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
  String get settingsHomePage => 'Domača stran';

  @override
  String get settingsTwentyFourHourClock => '24-urna ura';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Uporabite 24-urno oblikovanje časa, kjer koli je prikazana ura';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Pokaži gumb za naključno predvajanje v navigacijski vrstici';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Pokaži gumb zvrsti v navigacijski vrstici';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Pokažite gumb priljubljenih v navigacijski vrstici';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Prikažite gumb za knjižnice v navigacijski vrstici';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Prikaži gumb Seerr v navigacijski vrstici';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Vedno prikaži besedilne oznake v zgornji navigacijski vrstici';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Preklopi vidnost domače strani na knjižnico. Znova zaženite Moonfin, da spremembe začnejo veljati.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Medijska vrstica in lokalni predogledi';

  @override
  String get settingsVisualOverlays => 'Vizualne prekrivke';

  @override
  String get settingsSeasonalSurprise => 'Sezonsko presenečenje';

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
  String get settingsHigh => 'visoko';

  @override
  String get settingsLow => 'Nizka';

  @override
  String get settingsCustomPath => 'Pot po meri';

  @override
  String get settingsEnterDownloadFolderPath => 'Vnesite pot do mape za prenos';

  @override
  String get settingsConcurrentDownloads => 'Sočasni prenosi';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Največje število elementov za prenos hkrati.';

  @override
  String get settingsAppInfo => 'INFORMACIJE O APLIKACIJI';

  @override
  String get settingsReportAnIssue => 'Prijavite težavo';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Odprite sledilnik težav na GitHubu';

  @override
  String get settingsJoinDiscord => 'Pridružite se Discordu';

  @override
  String get settingsJoinDiscordSubtitle => 'Klepetajte s skupnostjo';

  @override
  String get settingsJoinTheDiscord => 'Pridružite se Discordu';

  @override
  String get settingsSupportMoonfin => 'Podprite Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Kupite razvijalcu kavo';

  @override
  String get settingsLegal => 'PRAVNO';

  @override
  String get settingsLicenses => 'Licence';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Obvestila o odprtokodnih licencah';

  @override
  String get settingsPrivacyPolicy => 'Politika zasebnosti';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Kako Moonfin ravna z vašimi podatki';

  @override
  String get settingsCheckForUpdates => 'Preverite posodobitve';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Preverite najnovejšo izdajo Moonfin';

  @override
  String get settingsBoth => 'Oba';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Filter vrste vsebine naključno';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Možnosti zvočnih posnetkov, obdelave in prehoda';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Avtomatizirano predvajanje in zaporedje';

  @override
  String get settingsSyncplaySubtitle =>
      'Logika sinhronizacije za skupinske seje';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Preskočiti uvodne in končne elemente?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown =>
      'Odštevanje predstavnostnih odsekov';

  @override
  String get settingsProgressBar => 'Vrstica napredka';

  @override
  String get settingsTimer => 'Časovnik';

  @override
  String get settingsNone => 'Brez';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Poziv uporabniku';

  @override
  String get settingsSkip => 'Preskoči';

  @override
  String get settingsDoNothing => 'Naredi nič';

  @override
  String get settingsMaxBitrateDescription =>
      'Omejite bitno hitrost pretakanja. Vsebina nad tem pragom bo prekodirana, da bo ustrezala.';

  @override
  String get settingsMaxResolutionDescription =>
      'Omejite največjo ločljivost, ki jo zahteva igralec. Vsebina višje ločljivosti bo prekodirana navzdol.';

  @override
  String get settingsPlayerZoomDescription =>
      'Kako naj se videoposnetek prilagodi velikosti zaslona.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Mehanizem predvajanja (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Izberite privzeti mehanizem predvajanja v napravah Android TV. Spremembe veljajo za naslednjo sejo predvajanja.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (priporočeno)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (podedovano)';

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
  String get settingsDolbyVisionFallback => 'Nadomestni Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Obnašanje naslovov Dolby Vision v napravah brez dekodiranja Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Vsakič vprašaj';

  @override
  String get settingsPreferHdr10Fallback => 'Raje nadomestni HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Prednostno prekodiranje strežnika';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profil 7 Neposredna igra';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Nadzira, ali naj tokovi sloja izboljšave profila Dolby Vision 7 usmerjajo predvajanje.';

  @override
  String get settingsAutoAftkrtEnabled => 'Samodejno (omogočeno AFTKRT)';

  @override
  String get settingsEnabledOnThisDevice => 'Omogočeno v tej napravi';

  @override
  String get settingsDisabledPreferTranscode => 'Onemogočeno (raje prekodiraj)';

  @override
  String get settingsResumeRewindDescription =>
      'Za koliko sekund je treba previti nazaj pri nadaljevanju predvajanja (iz možnosti Nadaljuj z gledanjem ali strani z medijskim elementom)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Za koliko sekund je treba previti nazaj, ko nadaljujete s predvajanjem po pritisku na gumb za premor?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Koliko sekund za skok nazaj po pritisku gumba za previjanje nazaj.';

  @override
  String get settingsOneSecond => '1 sekundo';

  @override
  String get settingsThreeSeconds => '3 sekunde';

  @override
  String get settingsFortyFiveSeconds => '45 sekund';

  @override
  String get settingsSixtySeconds => '60 sekund';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Za koliko sekund skočiti naprej po pritisku gumba za hitro premikanje naprej.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 na zunanji dekoder';

  @override
  String get settingsCinemaMode => 'Kinodvorana';

  @override
  String get settingsCinemaModeSubtitle =>
      'Predvajajte napovednike/predstave pred glavno funkcijo';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Razširjeno prikazuje celotno kartico z ilustracijo in opisom epizode. Minimalno prikazuje kompaktno prekrivno odštevanje. Onemogočeno v celoti skrije poziv.';

  @override
  String get settingsShort => 'Kratek';

  @override
  String get settingsLong => 'dolgo';

  @override
  String get settingsVeryLong => 'Zelo dolgo';

  @override
  String get settingsVideoStartDelay => 'Zakasnitev začetka videa';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV v živo neposredno';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Omogoči neposredno predvajanje za TV v živo';

  @override
  String get settingsOpenGroups => 'Odprite Skupine';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Ustvarite, pridružite se ali upravljajte skupine SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay omogočen';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Omogoči funkcije skupinskega gledanja';

  @override
  String get settingsSyncplayButton => 'Gumb SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Pokažite gumb SyncPlay v navigacijski vrstici';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Napredni popravek';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Omogoči natančno logiko sinhronizacije';

  @override
  String get settingsSyncplaySyncCorrection => 'Popravek sinhronizacije';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Samodejno prilagodite predvajanje, da ostanete sinhronizirani';

  @override
  String get settingsSyncplaySpeedToSync => 'Hitrost sinhronizacije';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Za sinhronizacijo uporabite prilagoditev hitrosti predvajanja';

  @override
  String get settingsSyncplaySkipToSync => 'Preskoči na sinhronizacijo';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Za sinhronizacijo uporabite iskanje';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Najmanjša zakasnitev hitrosti';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Zakasnitev največje hitrosti';

  @override
  String get settingsSyncplaySpeedDuration => 'Hitrost Trajanje';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Najmanjša zakasnitev preskoka';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Dodatni odmik';

  @override
  String get onNow => 'Vklopljeno zdaj';

  @override
  String get collections => 'Zbirke';

  @override
  String get lastPlayed => 'Nazadnje predvajano';

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
    return 'Nedavno izdano – $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Samodejno predvajaj naslednjo epizodo';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Samodejno predvajaj naslednjo epizodo, ko je na voljo.';

  @override
  String get skipSilenceTitle => 'Preskakuj tišino';

  @override
  String get skipSilenceSubtitle =>
      'Samodejno preskoči tihe zvočne odseke, kadar to pretok podpira.';

  @override
  String get allowExternalAudioEffectsTitle => 'Dovoli zunanje zvočne učinke';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Aplikacijam z izenačevalnikom in učinki (npr. Wavelet) dovoli povezavo s predvajalnimi sejami Media3.';

  @override
  String get disableTunnelingTitle => 'Onemogoči tuneliranje';

  @override
  String get disableTunnelingSubtitle =>
      'Vsili predvajanje brez tuneliranja. Uporabno na napravah s prekinitvami zvoka in slike pri tuneliranju.';

  @override
  String get enableTunnelingTitle => 'Omogoči tuneliranje';

  @override
  String get enableTunnelingSubtitle =>
      'Napredno. Zvok in sliko usmeri po povezani strojni poti. Privzeto izklopljeno, ker na nekaterih napravah povzroča izpade zvoka in slike.';

  @override
  String get mapDolbyVisionP7Title => 'Preslikaj Dolby Vision profil 7 v HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Pretoke Dolby Vision profil 7 predvajaj kot HEVC, združljiv s HDR10, na napravah brez podpore za Dolby Vision.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Uporabi vgrajene sloge podnapisov';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Uporabi barve, pisave in postavitev, vgrajene v sled podnapisov. Onemogočite, če želite uporabiti svoje nastavitve sloga podnapisov.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Uporabi vgrajene velikosti pisave podnapisov';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Uporabi namige o velikosti pisave, vgrajene v sled podnapisov. Onemogočite, če želite uporabiti velikost podnapisov iz svojih nastavitev sloga.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Prikaži podrobnosti vsebine';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Prikaži podrobnosti izbranega elementa na vrhu strani knjižnice.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Uporabi podrobne podnaslove';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Prikaži podrobno ali minimalno podvrstico na straneh knjižnice.';

  @override
  String get savedThemesDeleteDialogTitle =>
      'Ali želite izbrisati shranjeno temo?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Ali želite odstraniti »$themeName« iz predpomnilnika te naprave?';
  }

  @override
  String get themeStore => 'Trgovina s temami';

  @override
  String get themeStoreSubtitle =>
      'Brskajte po temah skupnosti in jih shranjujte';

  @override
  String get themeStoreDescription =>
      'Shranite temo, da jo boste lahko uporabljali kot druge shranjene teme.';

  @override
  String get themeStoreEmpty => 'Trenutno ni na voljo nobene teme.';

  @override
  String get themeStoreLoadFailed =>
      'Trgovine s temami ni bilo mogoče naložiti. Preverite povezavo in poskusite znova.';

  @override
  String get themeStoreSave => 'Shrani';

  @override
  String get themeStoreSaveAndApply => 'Shrani in uporabi';

  @override
  String get themeStoreSaved => 'Shranjeno';

  @override
  String get themeStoreInvalidMessage => 'Te teme ni bilo mogoče naložiti.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Tema »$themeName« je shranjena.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Tema »$themeName« je izbrisana iz te naprave.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Teme »$themeName« ni bilo mogoče izbrisati.';
  }

  @override
  String get savedThemesTitle => 'Shranjene teme';

  @override
  String get savedThemesDescription =>
      'To so teme, prenesene iz vtičnika Moonfin za trenutni strežnik. Z brisanjem odstranite samo to lokalno kopijo.';

  @override
  String get savedThemesEmpty =>
      'Za ta strežnik ni bilo najdenih shranjenih tem.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Trenutno aktivna';
  }

  @override
  String get savedThemesDeleteTooltip => 'Izbriši shranjeno temo';

  @override
  String get savedThemesManageSubtitle =>
      'Upravljajte prenesene teme vtičnika na tej napravi';

  @override
  String get themeEditor => 'Urejevalnik tem';

  @override
  String get themeEditorSubtitle =>
      'Odprite urejevalnik tem Moonfin v brskalniku';

  @override
  String get homeScreen => 'Domači zaslon';

  @override
  String get bottomBar => 'Spodnja vrstica';

  @override
  String get homeRowsStyleClassic => 'Klasični';

  @override
  String get homeRowsStyleModern => 'Sodobni';

  @override
  String get homeRowsSection => 'Vrstice na domači strani';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klasični ohrani vrsto slike in informacijsko prekrivko za vsako vrstico. Sodobni uporablja vrstice s prehodom iz pokončne slike v ozadje.';

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
  String get displayFavoritesRows => 'Prikaži vrstice priljubljenih';

  @override
  String get displayFavoritesRowsSubtitle =>
      'V razdelkih domače strani prikaži vrstice Priljubljeni filmi, Priljubljene serije in druge priljubljene.';

  @override
  String get favoritesRowSorting => 'Razvrščanje vrstic priljubljenih';

  @override
  String get favoritesRowSortingDescription =>
      'Vrstice priljubljenih razvrstite po datumu dodajanja, datumu izida, po abecedi in drugih merilih.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Prikaži vrstice zbirk';

  @override
  String get displayCollectionsRowsSubtitle =>
      'V razdelkih domače strani prikaži vrstice zbirk.';

  @override
  String get collectionsRowSorting => 'Razvrščanje vrstic zbirk';

  @override
  String get collectionsRowSortingDescription =>
      'Vrstice zbirk razvrstite po datumu dodajanja, datumu izida, po abecedi in drugih merilih.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Prikaži vrstice žanrov';

  @override
  String get displayGenresRowsSubtitle =>
      'V razdelkih domače strani prikaži vrstice žanrov.';

  @override
  String get genresRowSorting => 'Razvrščanje vrstic žanrov';

  @override
  String get genresRowSortingDescription =>
      'Vrstice žanrov razvrstite po datumu dodajanja, datumu izida, po abecedi in drugih merilih.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Elementi v vrsticah žanrov';

  @override
  String get genresRowItemsDescription =>
      'V vrsticah žanrov prikaži filme, serije ali oboje.';

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
  String get displayPlaylistsRows => 'Prikaži vrstice seznamov predvajanja';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'V razdelkih domače strani prikaži vrstice seznamov predvajanja.';

  @override
  String get playlistsRowSorting => 'Razvrščanje vrstic seznamov predvajanja';

  @override
  String get playlistsRowSortingDescription =>
      'Vrstice seznamov predvajanja razvrstite po datumu dodajanja, datumu izida, po abecedi in drugih merilih.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Prikaži zvočne vrstice';

  @override
  String get displayAudioRowsSubtitle =>
      'V razdelkih domače strani prikaži zvočne vrstice.';

  @override
  String get audioRowsSorting => 'Razvrščanje zvočnih vrstic';

  @override
  String get audioRowsSortingDescription =>
      'Zvočne vrstice razvrstite po datumu dodajanja, datumu izida, po abecedi in drugih merilih.';

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
  String get audioPlaylists => 'Zvočni seznami predvajanja';

  @override
  String get appearance => 'Videz';

  @override
  String get layout => 'Postavitev';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Tipkovnica';

  @override
  String get navButtons => 'Gumbi';

  @override
  String get rendering => 'Izrisovanje';

  @override
  String get mpvConfiguration => 'Konfiguracija MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Zunanja aplikacija za predvajanje';

  @override
  String get externalPlayerAppDescription =>
      'Nastavite zunanji predvajalnik, da omogočite možnost predvajanja z dolgim pritiskom';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Ob začetku predvajanja prikaži izbirnik aplikacij.';

  @override
  String get loadingInstalledPlayers =>
      'Nalaganje nameščenih predvajalnikov...';

  @override
  String get connection => 'Povezava';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Podprto na tej napravi';

  @override
  String get notSupportedOnThisDevice => 'Ni podprto na tej napravi';

  @override
  String get mediaPlayerBehavior => 'Vedenje predvajalnika';

  @override
  String get playbackEnhancements => 'Izboljšave predvajanja';

  @override
  String get alwaysOn => 'Vedno vklopljeno.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Zamenjaj gumb Preskoči odjavno špico s prikazom Sledi';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Namesto gumba Preskoči odjavno špico prikaži prekrivko Sledi.';

  @override
  String get playerRouting => 'Usmerjanje predvajalnika';

  @override
  String get preferSoftwareDecoders =>
      'Prednostno uporabi programske dekodirnike';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Uporabi FFmpeg (zvok) in libgav1 (AV1) pred strojnimi dekodirniki. Onemogočite, če preneha delovati zvočni passthrough prek HDMI.';

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
      'Predvajanje videa odpri v izbrani zunanji aplikaciji na Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Samodejno uvrščanje v vrsto';

  @override
  String get preferSdhSubtitles => 'Prednostno uporabi podnapise SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Pri samodejni izbiri daj prednost sledem podnapisov SDH/CC.';

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
  String get webDiagnostics => 'Spletna diagnostika';

  @override
  String get webDiagnosticsTitle => 'Spletna diagnostika Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Na tej strani lahko diagnosticirate težave s povezljivostjo v brskalniku (CORS, mešana vsebina in nastavitve odkrivanja).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Zaznana napaka zaradi mešane vsebine';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Zaznana napaka CORS/preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin je zaznal, da stran HTTPS poskuša klicati URL strežnika prek HTTP. Brskalniki to zahtevo blokirajo, preden doseže vaš strežnik.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin je zaznal napako zahteve na ravni brskalnika, ki jo običajno povzročijo manjkajoče glave CORS ali preflight na predstavnostnem strežniku.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Ciljni URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Podrobnosti: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Trenutni kontekst izvajanja';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Shema';

  @override
  String get webDiagnosticsPluginMode => 'Način vtičnika';

  @override
  String get webDiagnosticsWebRtcScan => 'Pregled WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'Vsiljeni URL strežnika';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Privzeti URL strežnika';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'URL posredniškega strežnika za odkrivanje';

  @override
  String get notConfigured => 'ni nastavljeno';

  @override
  String get webDiagnosticsMixedContent => 'Mešana vsebina';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ta stran je naložena prek HTTPS, vendar en ali več nastavljenih URL-jev uporablja HTTP. Brskalniki stranem HTTPS preprečujejo klice na vmesnike API prek HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Rešitev: predstavnostni strežnik ali posredniško končno točko ponudite prek HTTPS ali pa Moonfin nalagajte prek HTTP samo v zaupanja vrednih lokalnih omrežjih.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'V trenutnih nastavitvah izvajanja ni zaznane očitne konfiguracije z mešano vsebino.';

  @override
  String get webDiagnosticsCorsChecklist => 'Kontrolni seznam CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Dovolite origin brskalnika v Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• V Access-Control-Allow-Headers vključite Authorization, X-Emby-Authorization in X-Emby-Token.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Izpostavite Content-Range in Accept-Ranges za pretakanje in iskanje po posnetku.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Na zahteve OPTIONS preflight odgovarjajte s 204.';

  @override
  String get webDiagnosticsHeaderSnippetTitle => 'Primer glav (slog nginx)';

  @override
  String get note => 'Opomba';

  @override
  String get webDiagnosticsNonWebNote =>
      'Ta diagnostična pot je namenjena spletnim gradnjam. Če to vidite na drugi platformi, ta preverjanja morda ne veljajo.';

  @override
  String get backToServerSelect => 'Nazaj na izbiro strežnika';

  @override
  String get signOutAllUsers => 'Odjavi vse uporabnike';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Dovoljenje za mikrofon je trajno zavrnjeno. Omogočite ga v sistemskih nastavitvah.';

  @override
  String get voiceSearchPermissionRequired =>
      'Glasovno iskanje zahteva dovoljenje za mikrofon.';

  @override
  String get voiceSearchNoMatch => 'Nismo razumeli. Poskusite znova.';

  @override
  String get voiceSearchNoSpeechDetected =>
      'Zaznanega ni bilo nobenega govora.';

  @override
  String get voiceSearchMicrophoneError => 'Napaka mikrofona.';

  @override
  String get voiceSearchNeedsInternet => 'Glasovno iskanje potrebuje internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Glasovna storitev je zasedena. Poskusite znova.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Dovoljenje za mikrofon je trajno zavrnjeno.';

  @override
  String get microphonePermissionDenied =>
      'Dovoljenje za mikrofon je zavrnjeno.';

  @override
  String get speechRecognitionUnavailable =>
      'Prepoznavanje govora na tej napravi ni na voljo.';

  @override
  String get openIosRoutePicker => 'Odpri izbirnik izhoda iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Izbirnik izhoda AirPlay na tej napravi ni na voljo.';

  @override
  String get videos => 'Videi';

  @override
  String get programs => 'Oddaje';

  @override
  String get songs => 'Skladbe';

  @override
  String get photoAlbums => 'Foto albumi';

  @override
  String get photos => 'Fotografije';

  @override
  String get people => 'Osebe';

  @override
  String get recentlyReleasedEpisodes => 'Nedavno izdane epizode';

  @override
  String get watchAgain => 'Poglej znova';

  @override
  String get guestAppearances => 'Gostujoči nastopi';

  @override
  String get appearancesSeerr => 'Nastopi (Seerr)';

  @override
  String get crewContributionsSeerr => 'Prispevki ekipe (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Glej s skupino';

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
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Odpri v brskalniku';

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
      'Vgrajeni brskalnik na tej platformi ni na voljo.';

  @override
  String get adminRestartServerConfirmation =>
      'Ali ste prepričani, da želite znova zagnati strežnik?';

  @override
  String get adminShutdownServerConfirmation =>
      'Ali ste prepričani, da želite zaustaviti strežnik? Znova ga boste morali zagnati ročno.';

  @override
  String get internal => 'Notranje';

  @override
  String get idle => 'Nedejavno';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Ni najdenih uporabnikov';

  @override
  String get adminNoUsersMatchSearch =>
      'Vašemu iskanju ne ustreza noben uporabnik';

  @override
  String get adminNoDevicesFound => 'Ni najdenih naprav';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Trenutnim filtrom ne ustreza nobena naprava';

  @override
  String get remoteAccess => 'Oddaljeni dostop';

  @override
  String get localOnly => 'Samo lokalno';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Analitike vsebin ni bilo mogoče naložiti';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Združena analitika po vseh predstavnostnih knjižnicah.';

  @override
  String get analyticsTopArtists => 'Najboljši izvajalci';

  @override
  String get analyticsTopAuthors => 'Najboljši avtorji';

  @override
  String get analyticsTopContributors => 'Najboljši sodelujoči';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knjižnic',
      few: '$count knjižnice',
      two: '$count knjižnici',
      one: '1 knjižnica',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Za to izbiro še ni na voljo nobenih seštevkov indeksiranih vsebin.';

  @override
  String get analyticsLibraryDetails => 'Podrobnosti knjižnice';

  @override
  String get analyticsLibraryBreakdown => 'Razčlenitev knjižnic';

  @override
  String get analyticsNoLibrariesAvailable => 'Na voljo ni nobene knjižnice.';

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
  String get adminServerAdministrationTitle => 'Upravljanje strežnika';

  @override
  String get adminServerPathData => 'Podatki';

  @override
  String get adminServerPathImageCache => 'Predpomnilnik slik';

  @override
  String get adminServerPathCache => 'Predpomnilnik';

  @override
  String get adminServerPathLogs => 'Dnevniki';

  @override
  String get adminServerPathMetadata => 'Metapodatki';

  @override
  String get adminServerPathTranscode => 'Prekodiranje';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned => 'Ta strežnik ni vrnil nobenih poti.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent % porabljeno';
  }

  @override
  String get userActivity => 'Dejavnost uporabnikov';

  @override
  String get systemEvents => 'Sistemski dogodki';

  @override
  String get needsAttention => 'Zahteva pozornost';

  @override
  String get homeVideos => 'Domači videi';

  @override
  String get mixedContent => 'Mešana vsebina';

  @override
  String get homeVideosAndPhotos => 'Domači videi in fotografije';

  @override
  String get mixedMoviesAndShows => 'Mešani filmi in serije';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Ni najdenih posnetkov';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'V arhivu .$extension ni najdenih slikovnih strani.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Vgrajeno izrisovanje ni uspelo ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Izrisovanje EPUB ni uspelo ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Manjka lokalna datoteka za bralnik: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status pri odpiranju podatkov knjige iz $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Na voljo ni nobene berljive končne točke knjige';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nepodprta oblika stripovskega arhiva: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Vtičnik za razširjanje CBR na tej platformi ni na voljo.';

  @override
  String get failedToExtractCbrArchive =>
      'Arhiva .cbr ni bilo mogoče razširiti.';

  @override
  String get cb7ExtractionUnavailable =>
      'Razširjanje CB7 na tej platformi ni na voljo.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Vtičnik za razširjanje CB7 na tej platformi ni na voljo.';

  @override
  String get loadingShuffle => 'Nalaganje naključnega izbora...';

  @override
  String get libraryShuffleLabel => 'NAKLJUČNO IZ KNJIŽNICE';

  @override
  String get randomShuffleLabel => 'NAKLJUČNI IZBOR';

  @override
  String get genresShuffleLabel => 'NAKLJUČNO PO ŽANRU';

  @override
  String get autoHdrSwitching => 'Samodejno preklapljanje HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Samodejno omogoči HDR pri predvajanju videa HDR in ob izhodu obnovi način prikaza.';

  @override
  String get whenFullscreen => 'Na celotnem zaslonu';

  @override
  String get changeArtwork => 'Zamenjaj slikovno gradivo';

  @override
  String get missing => 'Manjka';

  @override
  String get clearAllArtworkButton =>
      'Ali želite počistiti vse slikovno gradivo?';

  @override
  String get clearAllArtworkWarning =>
      'Ali ste prepričani, da želite počistiti vse preneseno slikovno gradivo?';

  @override
  String get confirmClear => 'Potrdi čiščenje';

  @override
  String confirmClearMessage(String itemType) {
    return 'Ali ste prepričani, da želite počistiti element »$itemType«?';
  }

  @override
  String get uploadButton => 'Naložiti?';

  @override
  String get resolutionLabel => 'Ločljivost: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Prikaži samo slikovno gradivo v jeziku vmesnika';

  @override
  String get confirmClearAll => 'Potrdi čiščenje vsega';

  @override
  String get imageUploadSuccess => 'Slika je bila uspešno naložena!';

  @override
  String imageUploadFailed(String error) {
    return 'Slike ni bilo mogoče naložiti: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Slike ni bilo mogoče nastaviti: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Slike ni bilo mogoče izbrisati: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Vsega slikovnega gradiva ni bilo mogoče počistiti: $error';
  }

  @override
  String get yes => 'Da';

  @override
  String get posterCategory => 'Plakat';

  @override
  String get backdropsCategory => 'Ozadja';

  @override
  String get bannerCategory => 'Pasica';

  @override
  String get logoCategory => 'Logotip';

  @override
  String get thumbnailCategory => 'Sličica';

  @override
  String get artCategory => 'Grafika';

  @override
  String get discArtCategory => 'Grafika diska';

  @override
  String get screenshotCategory => 'Zaslonska slika';

  @override
  String get boxCoverCategory => 'Sprednja stran ovitka';

  @override
  String get boxRearCoverCategory => 'Zadnja stran ovitka';

  @override
  String get menuArtCategory => 'Grafika menija';

  @override
  String get confirmItemPoster => 'plakat';

  @override
  String get confirmItemBackdrop => 'ozadje';

  @override
  String get confirmItemBanner => 'pasica';

  @override
  String get confirmItemLogo => 'logotip';

  @override
  String get confirmItemThumbnail => 'sličica';

  @override
  String get confirmItemArt => 'grafika';

  @override
  String get confirmItemDiscArt => 'grafika diska';

  @override
  String get confirmItemScreenshot => 'zaslonska slika';

  @override
  String get confirmItemBoxCover => 'sprednja stran ovitka';

  @override
  String get confirmItemBoxRearCover => 'zadnja stran ovitka';

  @override
  String get confirmItemMenuArt => 'grafika menija';

  @override
  String get resolutionAll => 'Vse';

  @override
  String get resolutionHigh => 'Visoka (1080p+)';

  @override
  String get resolutionMedium => 'Srednja (720p)';

  @override
  String get resolutionLow => 'Nizka (<720p)';

  @override
  String get sources => 'Viri';

  @override
  String get audiobookChapters => 'Poglavja';

  @override
  String get audiobookBookmarks => 'Zaznamki';

  @override
  String get audiobookNotes => 'Zapiski';

  @override
  String get audiobookQueue => 'Vrsta';

  @override
  String get audiobookTimeline => 'Časovnica';

  @override
  String get audiobookTimelineEmpty => 'Časovnica je prazna';

  @override
  String get audiobookFocusedTimeline => 'Osredotočena časovnica';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Izvozi zaznamke';

  @override
  String get audiobookExportNotes => 'Izvozi zapiske';

  @override
  String get audiobookExportAll => 'Izvozi vse';

  @override
  String audiobookExportSuccess(String path) {
    return 'Izvoženo v $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Izvoz ni uspel: $error';
  }

  @override
  String get audiobookLyrics => 'Besedilo';

  @override
  String get audiobookAddBookmark => 'Dodaj zaznamek';

  @override
  String get audiobookAddNote => 'Dodaj zapisek';

  @override
  String get audiobookEditNote => 'Uredi zapisek';

  @override
  String get audiobookNoteHint => 'Zapišite zapisek za ta trenutek';

  @override
  String get audiobookSleepTimer => 'Časovnik spanja';

  @override
  String get audiobookSleepOff => 'Izklopljeno';

  @override
  String get audiobookSleepEndOfChapter => 'Konec poglavja';

  @override
  String get audiobookSleepCustom => 'Po meri';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'še $remaining';
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
  String get audiobookPlaybackSpeed => 'Hitrost predvajanja';

  @override
  String get audiobookRemainingTime => 'Preostalo';

  @override
  String get audiobookElapsedTime => 'Preteklo';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Nazaj za $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Naprej za $seconds s';
  }

  @override
  String get audiobookPreviousChapter => 'Prejšnje poglavje';

  @override
  String get audiobookNextChapter => 'Naslednje poglavje';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Poglavje $current od $total';
  }

  @override
  String get audiobookNoChapters => 'Ni poglavij';

  @override
  String get audiobookNoBookmarks => 'Zaenkrat ni zaznamkov';

  @override
  String get audiobookNoNotes => 'Zaenkrat ni zapiskov';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Zaznamek dodan na $position';
  }

  @override
  String get audiobookSpeedReset => 'Ponastavi na 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Shrani';

  @override
  String get audiobookCancel => 'Prekliči';

  @override
  String get audiobookDelete => 'Izbriši';

  @override
  String get subtitlePreferencesDescription =>
      'Spremenite načine podnapisov, privzete jezike, videz in možnosti izrisovanja.';

  @override
  String get subtitleRendering => 'Izrisovanje podnapisov';

  @override
  String get displayOptions => 'Možnosti prikaza';

  @override
  String get releaseDateAscending => 'Datum izida (naraščajoče)';

  @override
  String get releaseDateDescending => 'Datum izida (padajoče)';

  @override
  String get groupContributions => 'Združi prispevke';

  @override
  String get groupMultipleRoles => 'Združi več vlog';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Opozorilo o pisalnem dostopu do knjižnice';

  @override
  String get libraryWriteAccessHowToFix => 'Kako to odpraviti:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Storitvenemu uporabniku Jellyfin (npr. jellyfin ali Docker PUID/PGID) dodelite pravice za pisanje v mape vaše predstavnostne knjižnice na strežniku.\n\n2. Ali pa v nadzorni plošči Jellyfin pojdite v razdelek Libraries, uredite to knjižnico in onemogočite možnost »Save artwork into media folders«, da se slikovno gradivo shranjuje v notranjo zbirko podatkov Jellyfin.';

  @override
  String get dismiss => 'Opusti';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Vaša knjižnica »$libraryName« je nastavljena tako, da shranjuje slikovno gradivo neposredno v predstavnostne mape (možnost »Save artwork into media folders« je omogočena). Vendar je Jellyfin preizkusil pisalni dostop in nima dovoljenja za pisanje datotek v ta imenik:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Videti je, da Jellyfin ni uspel posodobiti slikovnega gradiva. Vaša knjižnica je nastavljena tako, da shranjuje slikovno gradivo neposredno v predstavnostne mape (možnost »Save artwork into media folders« je omogočena). Ta napaka se običajno pojavi, kadar strežniški proces Jellyfin nima dovoljenja za pisanje datotek v vaše predstavnostne imenike.';

  @override
  String get replay => 'Predvajaj znova';

  @override
  String get fileInformation => 'Podatki o datoteki';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Velikost: $size  •  Oblika: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Prikaži vse zvočne sledi ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Prikaži vse sledi podnapisov ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Preverjanje zmožnosti neposrednega predvajanja...';

  @override
  String get directPlayCapabilityLabel => 'Zmožnost neposrednega predvajanja: ';

  @override
  String get forced => 'Vsiljeno';

  @override
  String get transcodeContainerNotSupported =>
      'Predvajalnik ne podpira oblike vsebnika.';

  @override
  String get transcodeVideoCodecNotSupported => 'Video kodek ni podprt.';

  @override
  String get transcodeAudioCodecNotSupported => 'Zvočni kodek ni podprt.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Oblika podnapisov ni podprta (zahteva vžig v sliko).';

  @override
  String get transcodeAudioProfileNotSupported => 'Zvočni profil ni podprt.';

  @override
  String get transcodeVideoProfileNotSupported => 'Video profil ni podprt.';

  @override
  String get transcodeVideoLevelNotSupported => 'Raven videa ni podprta.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Ta naprava ne podpira ločljivosti videa.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Bitna globina videa ni podprta.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Hitrost sličic videa ni podprta.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Bitna hitrost datoteke presega omejitev pretakanja predvajalnika.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Bitna hitrost videa presega omejitev pretakanja.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Bitna hitrost zvoka presega omejitev pretakanja.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Število zvočnih kanalov ni podprto.';

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
  String get sortAlphabetical => 'Po abecedi';

  @override
  String get sortReleaseAscending => 'Vrstni red izida (naraščajoče)';

  @override
  String get sortReleaseDescending => 'Vrstni red izida (padajoče)';

  @override
  String get sortCustomDragDrop => 'Po meri (povleci in spusti)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Možnosti razvrščanja seznama predvajanja';

  @override
  String get resetSort => 'Ponastavi razvrščanje';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Poglej znova S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Znova predvajaj seznam predvajanja';

  @override
  String get noSubtitlesFound => 'Ni najdenih podnapisov.';

  @override
  String get adminControls => 'Skrbniško upravljanje';

  @override
  String get impellerRendering => 'Pogon za izrisovanje (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller je sodobni GPU-izrisovalnik Flutterja za tekočejše animacije in manj zatikanja. Na nekaterih TV-škatlah in starejših grafičnih karticah lahko povzroči napake v prikazu ali črno sliko; v tem primeru ga izklopite. Samodejno izbere najboljšo privzeto nastavitev za vašo napravo. Za uveljavitev znova zaženite Moonfin.';

  @override
  String get impellerAuto => 'Samodejno';

  @override
  String get impellerOn => 'Vklopljeno';

  @override
  String get impellerOff => 'Izklopljeno';

  @override
  String get impellerRestartTitle => 'Zahtevan je ponovni zagon';

  @override
  String get impellerRestartMessage =>
      'Moonfin se mora znova zagnati, da spremeni pogon za izrisovanje. Zaprite aplikacijo in jo znova odprite.';

  @override
  String get impellerCloseNow => 'Zapri aplikacijo';

  @override
  String get adminRefreshLibrary => 'Osveži knjižnico';

  @override
  String get adminRefreshAllLibraries => 'Osveži vse knjižnice';

  @override
  String get adminRepoSortDateOldest => 'Datum dodajanja (najprej najstarejši)';

  @override
  String get adminRepoSortDateNewest => 'Datum dodajanja (najprej najnovejši)';

  @override
  String get adminRepoSortNameAsc => 'Po abecedi (A do Ž)';

  @override
  String get adminRepoSortNameDesc => 'Po abecedi (Ž do A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Nalaganje analitike strežnika... $percentage %';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Ujemaj z virom';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 filmov';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 serij';

  @override
  String get imdbMostPopularMovies => 'Najbolj priljubljeni filmi na IMDb';

  @override
  String get imdbMostPopularTvShows => 'Najbolj priljubljene serije na IMDb';

  @override
  String get imdbLowestRatedMovies => 'Najslabše ocenjeni filmi na IMDb';

  @override
  String get imdbTopEnglishMovies => 'Najbolje ocenjeni angleški filmi na IMDb';

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
  String get integrations => 'Integracije';

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
