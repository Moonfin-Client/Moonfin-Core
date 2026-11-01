// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

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
  String get interfaceLanguage => 'Grensesnittspråk';

  @override
  String get systemLanguageDefault => 'Systemstandard';

  @override
  String get signIn => 'Logg på';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Tom';

  @override
  String connectingToServer(String serverName) {
    return 'Kobler til $serverName';
  }

  @override
  String get quickConnect => 'Hurtigkobling';

  @override
  String get password => 'Passord';

  @override
  String get username => 'Brukernavn';

  @override
  String get email => 'E-post';

  @override
  String get quickConnectInstruction =>
      'Skriv inn denne koden på serverens nettdashbord:';

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
  String get waitingForAuthorization => 'Venter på autorisasjon...';

  @override
  String get back => 'Tilbake';

  @override
  String get serverUnavailable => 'Serveren er utilgjengelig';

  @override
  String get loginFailed => 'Innlogging mislyktes';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Hurtigkobling er utilgjengelig: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Hurtigkobling er utilgjengelig ($status): $detail';
  }

  @override
  String get whosWatching => 'Hvem ser på?';

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
  String get addUser => 'Legg til bruker';

  @override
  String get selectServer => 'Velg Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versjon $version';
  }

  @override
  String get savedServers => 'Lagrede servere';

  @override
  String get discoveredServers => 'Oppdaget servere';

  @override
  String get noneFound => 'Ingen funnet';

  @override
  String get unableToConnectToServer => 'Kan ikke koble til serveren';

  @override
  String get addServer => 'Legg til server';

  @override
  String get embyConnect => 'Emby Koble til';

  @override
  String get removeServer => 'Fjern server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Vil du fjerne «$serverName» fra serverne dine?';
  }

  @override
  String get cancel => 'Kanseller';

  @override
  String get remove => 'Fjern';

  @override
  String get connectToServer => 'Koble til server';

  @override
  String get serverAddress => 'Serveradresse';

  @override
  String get serverAddressHint => 'https://din-server.example.com';

  @override
  String get connect => 'Koble til';

  @override
  String get secureStorageUnavailable => 'Sikker lagring er ikke tilgjengelig';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin fikk ikke tilgang til systemets nøkkelring. Påloggingen kan fortsette, men sikker tokenlagring kan være utilgjengelig før nøkkelringen er låst opp.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'App-tema';

  @override
  String get detailScreenStyle => 'Stil for detaljskjerm';

  @override
  String get detailScreenStyleSubtitle =>
      'Klassisk er den opprinnelige, midtstilte Moonfin-layouten. Moderne er en responsiv, filmatisk layout.';

  @override
  String get detailScreenStyleMoonfin => 'Klassisk';

  @override
  String get detailScreenStyleModern => 'Moderne';

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
  String get expandedTabs => 'Utvidede faner';

  @override
  String get expandedTabsSubtitle =>
      'Vis faneinnhold automatisk mens du blar gjennom faner. Slå av for å åpne og lukke hver fane manuelt.';

  @override
  String get showTechnicalDetails => 'Vis tekniske detaljer?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Vis informasjon om kodek, oppløsning og strøm i bannersammendraget';

  @override
  String get recommendationSystem => 'Anbefalingssystem';

  @override
  String get recommendationSystemSubtitle =>
      'Bruk den lokale bibliotekalgoritmen Moonfin anbefaler, eller TMDb-likhetsmålinger på nett. Merk: Anbefalinger på nett krever Seerr-integrasjon.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin anbefaler';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb-likhet';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Begrens etter aldersgrense?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Begrens forslag fra Moonfin anbefaler etter aldersgrensen til det aktuelle innholdet';

  @override
  String get interfaceStyle => 'Grensesnittstil';

  @override
  String get interfaceStyleSubtitle =>
      'Automatisk følger enheten din. Velg Apple eller Material for å tvinge fram et bestemt utseende.';

  @override
  String get interfaceStyleAutomatic => 'Automatisk';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Grensesnittoppsett';

  @override
  String get interfaceLayoutSubtitle =>
      'Overstyr oppsettet dersom enheten gjenkjennes feil. Start Moonfin på nytt for å ta i bruk endringene.';

  @override
  String get interfaceLayoutAutomatic => 'Automatisk';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Skrivebord';

  @override
  String get interfaceLayoutPhone => 'Telefon';

  @override
  String get glassQuality => 'Glasskvalitet';

  @override
  String get oledMode => 'OLED modus';

  @override
  String get oledModeSubtitle =>
      'Forsterk sortnivå og farger. Best egnet for OLED skjermer.';

  @override
  String get oledModeSubtle => 'Dempet';

  @override
  String get oledModeVivid => 'Livlig';

  @override
  String get glassQualitySubtitle =>
      'Auto velger den beste glasseffekten for denne enheten. Full tvinger fram ekte uskarphet, mens Redusert bruker et lett glass som sparer GPU-strøm.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Full';

  @override
  String get glassQualityReduced => 'Redusert';

  @override
  String get performanceMode => 'Ytelse';

  @override
  String get performanceModeSubtitle =>
      'Justerer seg automatisk etter enhetens minne. Færre bilder lagres i minnet, og trailere vises som stillbilder. Trer i kraft ved neste oppstart.';

  @override
  String get performanceModeAuto => 'Auto';

  @override
  String get performanceModeStandard => 'Standard';

  @override
  String get performanceModeReduced => 'Redusert';

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
      'Av fordi Ytelse er satt til Redusert for denne enheten';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Bruk et fullstendig tilpasset tema, og bytt mellom et Apple- eller Material-inspirert brukergrensesnitt.';

  @override
  String get customThemeTitle => 'Egendefinert tema';

  @override
  String get customThemeSubtitle =>
      'Egendefinerte temaer endrer visuelle elementer i hele Moonfin. Velg et av disse alternativene som passer din stil.';

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
  String get controller => 'Kontroller';

  @override
  String get gamepadNavigation => 'Navigasjon med spillkontroll';

  @override
  String get gamepadNavigationDescription =>
      'La tilkoblet spillkontroll flytte markør og velge elementer';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Det originale og stilrene Moonfin-standarden.';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-styling med magenta glød, cyan tekst og sterkere kromkontrast';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Flytende glass-styling med drivende gradientbakgrunn, frostede flater og Apple-blå aksentfarge';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pikselkunst-styling med grov palett, blokkete kanter, harde slagskygger og pikselfont';

  @override
  String get embyConnectSignInSubtitle =>
      'Logg på med Emby Connect-kontoen din';

  @override
  String get emailOrUsername => 'E-post eller brukernavn';

  @override
  String get selectAServer => 'Velg en server';

  @override
  String get tryAgain => 'Prøv igjen';

  @override
  String get noLinkedServers =>
      'Ingen servere knyttet til denne Emby Connect-kontoen';

  @override
  String get invalidEmbyConnectCredentials =>
      'Ugyldig Emby Connect-legitimasjon';

  @override
  String get invalidEmbyConnectLogin =>
      'Ugyldig Emby Connect brukernavn eller passord';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serveren støtter ikke Emby Connect-utveksling';

  @override
  String get embyConnectNetworkError =>
      'Nettverksfeil under kontakt med Emby Connect eller den valgte serveren';

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
  String get loadingLinkedServers => 'Laster tilknyttede servere...';

  @override
  String get connectingToServerEllipsis => 'Kobler til server...';

  @override
  String get noReachableAddress => 'Ingen tilgjengelig adresse oppgitt';

  @override
  String get invalidServerExchangeResponse =>
      'Ugyldig svar fra serverutvekslingsendepunkt';

  @override
  String unableToConnectTo(String target) {
    return 'Kan ikke koble til $target';
  }

  @override
  String get exitApp => 'Vil du avslutte Moonfin?';

  @override
  String get exitAppConfirmation => 'Er du sikker på at du vil avslutte?';

  @override
  String get exit => 'Avslutt';

  @override
  String get gameMenu => 'Meny';

  @override
  String get gamePaused => 'Satt på pause';

  @override
  String get gameSaveState => 'Lagre tilstand';

  @override
  String get games => 'Spill';

  @override
  String get gameLoadState => 'Last inn tilstand';

  @override
  String get gameFastForward => 'Spol framover';

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
  String get gameEmulatorSettings => 'Emulatorinnstillinger';

  @override
  String get gameNoCoreOptions =>
      'Denne kjernen har ingen justerbare alternativer.';

  @override
  String get gameHoldToOpenMenu => 'Hold inne for å åpne menyen';

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
      'Spillavspilling støttes ikke på denne enheten ennå.';

  @override
  String get noHomeRowsLoaded => 'Ingen hjemmerader kunne lastes';

  @override
  String get noHomeRowsHint =>
      'Prøv å oppdatere eller redusere aktive hjemmeseksjoner.';

  @override
  String get retryHomeRows => 'Prøv Hjemrader på nytt';

  @override
  String get guide => 'TV-Guide';

  @override
  String get recordings => 'Opptak';

  @override
  String get schedule => 'Sendeskjema';

  @override
  String get series => 'Serier';

  @override
  String get noItemsFound => 'Ingen elementer funnet';

  @override
  String get home => 'Hjem';

  @override
  String get browseAll => 'Bla gjennom alle';

  @override
  String get genres => 'Sjangere';

  @override
  String get collectionPlaceholder => 'Samlingsartikler vil vises her';

  @override
  String get browseByLetter => 'Bla etter bokstav';

  @override
  String get alphabeticalBrowsePlaceholder => 'Alfabetisk bla vil vises her';

  @override
  String get suggestions => 'Forslag';

  @override
  String get suggestionsPlaceholder => 'Foreslåtte elementer vises her';

  @override
  String get failedToLoadLibraries => 'Kunne ikke laste inn bibliotekene';

  @override
  String get noLibrariesFound => 'Ingen biblioteker funnet';

  @override
  String get library => 'Bibliotek';

  @override
  String get displaySettings => 'Skjerminnstillinger';

  @override
  String get allGenres => 'Alle sjangere';

  @override
  String get noGenresFound => 'Ingen sjangere funnet';

  @override
  String failedToLoadFolderError(String error) {
    return 'Kunne ikke laste inn mappen: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Denne mappen er tom';

  @override
  String itemCountLabel(int count) {
    return '$count elementer';
  }

  @override
  String get failedToLoadFavorites => 'Kunne ikke laste inn favoritter';

  @override
  String get retry => 'Prøv på nytt';

  @override
  String get noFavoritesYet => 'Ingen favoritter ennå';

  @override
  String get favorites => 'Favoritter';

  @override
  String totalCountItems(int count) {
    return '$count elementer';
  }

  @override
  String get continuing => 'Fortsetter';

  @override
  String get ended => 'Avsluttet';

  @override
  String get sortAndFilter => 'Sorter og filtrer';

  @override
  String get type => 'Type';

  @override
  String get sortBy => 'Sorter etter';

  @override
  String get display => 'Utstilling';

  @override
  String get imageType => 'Bildetype';

  @override
  String get posterSize => 'Plakatstørrelse';

  @override
  String get small => 'Liten';

  @override
  String get medium => 'Middels';

  @override
  String get large => 'Stor';

  @override
  String get extraLarge => 'Ekstra stor';

  @override
  String get uiScaleGrandparents => 'Grandparents';

  @override
  String get uiScaleGreatGrandparents => 'Great-Grandparents';

  @override
  String get scrollDirection => 'Rulleretning';

  @override
  String get scrollDirectionVertical => 'Vertikal';

  @override
  String get scrollDirectionHorizontal => 'Horisontal';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Sjangere';
  }

  @override
  String get views => 'Visninger';

  @override
  String get albums => 'Album';

  @override
  String get albumArtists => 'Albumartister';

  @override
  String get artists => 'Artister';

  @override
  String get bookmarks => 'Bokmerker';

  @override
  String get noSavedBookmarks =>
      'Ingen lagrede bokmerker for denne tittelen ennå.';

  @override
  String get openBook => 'Åpne bok';

  @override
  String get chapter => 'Kapittel';

  @override
  String get page => 'Side';

  @override
  String get bookmark => 'Bokmerke';

  @override
  String get justNow => 'Akkurat nå';

  @override
  String minutesAgo(int count) {
    return '$count min siden';
  }

  @override
  String hoursAgo(int count) {
    return '$count t siden';
  }

  @override
  String daysAgo(int count) {
    return '$count d siden';
  }

  @override
  String get discoverySubjects => 'Oppdagelsesemner';

  @override
  String get apply => 'Bruk';

  @override
  String get openLink => 'Åpne Link';

  @override
  String get scanWithYourPhone => 'Skann med telefonen';

  @override
  String get audiobookGenres => 'Lydbok sjangere';

  @override
  String get scrollLeft => 'Rull til venstre';

  @override
  String get scrollRight => 'Rull til høyre';

  @override
  String get scrollToTop => 'Gå til toppen';

  @override
  String get couldNotLoadGenre =>
      'Kunne ikke laste inn denne sjangeren akkurat nå.';

  @override
  String get continueReading => 'Fortsett å lese';

  @override
  String get savedHighlights => 'Lagrede høydepunkter';

  @override
  String get continueListening => 'Fortsett å lytte';

  @override
  String get listen => 'Lytte';

  @override
  String get resume => 'Fortsett';

  @override
  String get failedToLoadLibrary => 'Kunne ikke laste inn biblioteket';

  @override
  String get popularNow => 'Populær nå';

  @override
  String get savedForLater => 'Lagret til senere';

  @override
  String get topListens => 'Topplytter';

  @override
  String get unreadDiscoveries => 'Uleste oppdagelser';

  @override
  String get pickUpAgain => 'Plukk opp igjen';

  @override
  String get bookHighlightsDescription =>
      'Bøkene dine med høydepunkter, favoritter eller lesefremgang.';

  @override
  String get handPickedFromLibrary => 'Håndplukket fra biblioteket ditt.';

  @override
  String get handPickedFromListeningQueue => 'Håndplukket fra lyttekøen din.';

  @override
  String get booksWithHighlights =>
      'Bøker med høydepunkter, favoritter eller lesefremgang.';

  @override
  String get jumpBackNarration =>
      'Hopp tilbake til fortellingen uten å lete etter plassen din.';

  @override
  String get unreadBooksReady => 'Uleste bøker klare for neste stille time.';

  @override
  String get quickAccessFavorites =>
      'Rask tilgang til bøkene du stadig vender tilbake til.';

  @override
  String get searchAudiobooks => 'Søk etter lydbøker';

  @override
  String get searchYourLibrary => 'Søk i biblioteket ditt';

  @override
  String get pickUpStory => 'Fortsett historien der du slapp';

  @override
  String get savedPlacesChapters => 'Dine lagrede steder og uferdige kapitler';

  @override
  String authorsCount(int count) {
    return '$count forfattere';
  }

  @override
  String genresCount(int count) {
    return '$count sjangere';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent % fullført';
  }

  @override
  String get readyWhenYouAre => 'Klar når du er';

  @override
  String get details => 'Detaljer';

  @override
  String get listeningRoom => 'Lytterom';

  @override
  String get bookmarksAndProgress => 'Bokmerker og fremgang';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titler organisert for lesing først.';
  }

  @override
  String get titles => 'Titler';

  @override
  String get allTitles => 'Alle titler';

  @override
  String get authors => 'Forfattere';

  @override
  String get browseByAuthor => 'Bla etter forfatter';

  @override
  String get browseByGenre => 'Bla etter sjanger';

  @override
  String get discover => 'Oppdage';

  @override
  String get noBookmarkedItems => 'Ingen bokmerkede elementer ennå';

  @override
  String get nothingMatchesSection =>
      'Ingenting samsvarer med denne delen ennå. Prøv en annen fane eller kom tilbake etter at biblioteksynkroniseringen er ferdig.';

  @override
  String get audiobooks => 'Lydbøker';

  @override
  String noLabelFound(String label) {
    return 'Fant ingen $label';
  }

  @override
  String get folder => 'Mappe';

  @override
  String get filters => 'Filtre';

  @override
  String get readingStatus => 'Lesestatus';

  @override
  String get playedStatus => 'Spillt status';

  @override
  String get readStatus => 'Lese';

  @override
  String get watched => 'Sett';

  @override
  String get unread => 'Ulest';

  @override
  String get unwatched => 'Usett';

  @override
  String get seriesStatus => 'Seriestatus';

  @override
  String get allLibraries => 'Alle biblioteker';

  @override
  String get books => 'Bøker';

  @override
  String get latestBooks => 'Nyeste bøker';

  @override
  String get latestAudiobooks => 'Nyeste lydbøker';

  @override
  String get latestComics => 'Siste Tegneserier';

  @override
  String get comics => 'Tegneserier';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bøker',
      one: '1 bok',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Bok';

  @override
  String get bookFormatAudiobook => 'Lydbok';

  @override
  String get bookFormatComic => 'Tegneserie';

  @override
  String get noBooksFound => 'Fant ingen bøker for denne forfatteren.';

  @override
  String get noBooksFoundDescription =>
      'Dette biblioteket inneholder ingen bøker, lydbøker eller tegneserier.';

  @override
  String bookPercentRead(int percent) {
    return '$percent % lest';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time igjen';
  }

  @override
  String get bookHeroRead => 'Les';

  @override
  String get bookHeroListen => 'Lytt';

  @override
  String get author => 'Forfatter';

  @override
  String get unknownAuthor => 'Ukjent forfatter';

  @override
  String get uncategorized => 'Ukategorisert';

  @override
  String get overview => 'Oversikt';

  @override
  String get noLibrivoxDescription =>
      'Ingen beskrivelse gitt av LibriVox for denne tittelen ennå.';

  @override
  String get readers => 'Lesere';

  @override
  String get openLinks => 'Åpne lenker';

  @override
  String get librivoxPage => 'LibriVox-side';

  @override
  String get internetArchive => 'Internett-arkiv';

  @override
  String get rssFeed => 'RSS-feed';

  @override
  String get downloadZip => 'Last ned zip';

  @override
  String sectionCountLabel(int count) {
    return '$count deler';
  }

  @override
  String firstPublished(int year) {
    return 'Først utgitt $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Ingen oversikt tilgjengelig fra Open Library for denne tittelen ennå.';

  @override
  String get subjects => 'Emner';

  @override
  String get all => 'Alle';

  @override
  String booksCount(int count) {
    return '$count bøker';
  }

  @override
  String get couldNotLoadSubject =>
      'Kunne ikke laste inn dette emnet akkurat nå.';

  @override
  String get audiobookDetails => 'Lydbokdetaljer';

  @override
  String authorsCountTitle(int count) {
    return '$count forfattere';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lydbøker',
      one: '1 lydbok',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Sporliste';

  @override
  String get itemListPlaceholder => 'Vareliste vil vises her';

  @override
  String get failedToLoad => 'Kunne ikke laste inn';

  @override
  String get delete => 'Slett';

  @override
  String get save => 'Lagre';

  @override
  String get moreLikeThis => 'Mer som dette';

  @override
  String get castAndCrew => 'Skuespillere og team';

  @override
  String get collection => 'Samling';

  @override
  String get episodes => 'Episoder';

  @override
  String get nextUp => 'Neste opp';

  @override
  String get seasons => 'Sesonger';

  @override
  String get chapters => 'Kapitler';

  @override
  String get features => 'Funksjoner';

  @override
  String get movies => 'Filmer';

  @override
  String get musicVideos => 'Musikkvideoer';

  @override
  String get other => 'Annen';

  @override
  String get discography => 'Diskografi';

  @override
  String get similarArtists => 'Lignende artister';

  @override
  String get tableOfContents => 'Innholdsfortegnelse';

  @override
  String get tracklist => 'Sporliste';

  @override
  String discNumber(int number) {
    return 'Plate $number';
  }

  @override
  String get biography => 'Biografi';

  @override
  String get authorDetails => 'Forfatterdetaljer';

  @override
  String get noOverviewAvailable =>
      'Ingen oversikt tilgjengelig for denne tittelen ennå.';

  @override
  String get noBiographyAvailable =>
      'Ingen biografi tilgjengelig for denne forfatteren.';

  @override
  String get unableToLoadAuthorDetails =>
      'Kan ikke laste inn forfatterdetaljer akkurat nå.';

  @override
  String published(int year) {
    return 'Utgitt $year';
  }

  @override
  String get publicationDateUnknown => 'Utgivelsesdato ukjent';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sesonger',
      one: '1 sesong',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Slutter kl. $time';
  }

  @override
  String get items => 'Elementer';

  @override
  String get extras => 'Ekstramateriale';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Bak kulissene';

  @override
  String get deletedScenes => 'Slettede scener';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Intervjuer';

  @override
  String get scenes => 'Scener';

  @override
  String get shorts => 'Kortfilmer';

  @override
  String get trailers => 'Trailere';

  @override
  String timeRemaining(String time) {
    return '$time igjen';
  }

  @override
  String endsIn(String time) {
    return 'Slutter om $time';
  }

  @override
  String get view => 'Utsikt';

  @override
  String get resumeReading => 'Fortsett lesing';

  @override
  String get read => 'Lese';

  @override
  String resumeFrom(String position) {
    return 'Fortsett fra $position';
  }

  @override
  String get play => 'Spill av';

  @override
  String get startOver => 'Start på nytt';

  @override
  String get restart => 'Start på nytt';

  @override
  String get readOffline => 'Les frakoblet';

  @override
  String get playOffline => 'Spill frakoblet';

  @override
  String get audio => 'Lyd';

  @override
  String get subtitles => 'Undertekster';

  @override
  String get version => 'Versjon';

  @override
  String get cast => 'Cast';

  @override
  String get castMembers => 'Medvirkende';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Ferdig';

  @override
  String get favorited => 'Favoritt';

  @override
  String get favorite => 'Favoritt';

  @override
  String get playlist => 'Spilleliste';

  @override
  String get downloaded => 'Lastet ned';

  @override
  String get finalizingDownload => 'Fullfører…';

  @override
  String get queuedDownload => 'I Kø';

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
  String get downloadAll => 'Last ned alle';

  @override
  String get download => 'Last ned';

  @override
  String get deleteDownloaded => 'Slett nedlastede';

  @override
  String get goToSeries => 'Gå til serien';

  @override
  String get editMetadata => 'Rediger metadata';

  @override
  String get less => 'Mindre';

  @override
  String get more => 'Flere';

  @override
  String get deleteItem => 'Slett element';

  @override
  String get deletePlaylist => 'Slett spilleliste';

  @override
  String get deletePlaylistMessage =>
      'Vil du slette denne spillelisten fra serveren?';

  @override
  String get deleteItemMessage => 'Vil du slette dette elementet fra serveren?';

  @override
  String get failedToDeletePlaylist => 'Kunne ikke slette spillelisten';

  @override
  String get failedToDeleteItem => 'Kunne ikke slette elementet';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Slettingen mislyktes med følgende feil: $error';
  }

  @override
  String get renamePlaylist => 'Gi nytt navn til spilleliste';

  @override
  String get playlistName => 'Spillelistenavn';

  @override
  String get deleteDownloadedAlbum => 'Slett nedlastet album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Vil du slette nedlastede spor for «$title»?';
  }

  @override
  String get downloadedTracksDeleted => 'Nedlastede spor slettet';

  @override
  String get downloadedTracksDeleteFailed =>
      'Noen nedlastede spor kunne ikke slettes';

  @override
  String get noTracksLoaded => 'Ingen spor lastet';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Ingen $itemLabel lastet inn';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Laster ned $title ($count elementer)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Er du sikker på at du vil slette «$name» fra serveren? Denne handlingen kan ikke angres.';
  }

  @override
  String get itemDeleted => 'Element slettet';

  @override
  String get noPlayableTrailerFound => 'Fant ingen spillbar trailer.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Bokformatet støttes ikke: .$extension';
  }

  @override
  String get audioTrack => 'Lydspor';

  @override
  String get subtitleTrack => 'Undertekstspor';

  @override
  String get none => 'Ingen';

  @override
  String get downloadSubtitlesLabel => 'Last ned undertekster...';

  @override
  String get searchOpenSubtitlesPlugin => 'Søk med OpenSubtitles-plugin';

  @override
  String get downloadSubtitles => 'Last ned undertekster';

  @override
  String get searchingSubtitles => 'Søkker etter undertekster…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'Den valgte underteksten er ugyldig.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Undertekst lastet ned og valgt: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Undertekst lastet ned. Det kan ta et øyeblikk å vises mens Jellyfin oppdaterer elementet.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Fant ingen eksterne undertekster for $language.';
  }

  @override
  String get selectVersion => 'Velg Versjon';

  @override
  String versionNumber(int number) {
    return 'Versjon $number';
  }

  @override
  String get downloadAllQuality => 'Last ned alle — kvalitet';

  @override
  String get downloadQuality => 'Last ned kvalitet';

  @override
  String get originalFileNoReencoding => 'Originalfil, ingen omkoding';

  @override
  String get originalFilesNoReencoding => 'Originalfiler, ingen omkoding';

  @override
  String get noEpisodesLoaded => 'Ingen episoder er lastet inn';

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
    return 'Laster ned $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Slett nedlastede filer';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Vil du slette lokale filer for $typeLabel?\n\nDette frigjør lagringsplass. Du kan laste dem ned igjen senere.';
  }

  @override
  String get downloadedFilesDeleted => 'Nedlastede filer slettet';

  @override
  String get failedToDeleteFiles => 'Kunne ikke slette filer';

  @override
  String get deleteFiles => 'Slett filer';

  @override
  String get director => 'DIREKTØR';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'REGISSØRER';

  @override
  String get writer => 'MANUSFORFATTER';

  @override
  String get writers => 'MANUSFORFATTERE';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count til';
  }

  @override
  String totalEpisodes(int count) {
    return '$count episoder';
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
    return 'Kapittel $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spor',
      one: '1 spor',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kapitler',
      one: '1 kapittel',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Født $date';
  }

  @override
  String died(String date) {
    return 'Død $date';
  }

  @override
  String age(int age) {
    return 'Alder $age';
  }

  @override
  String get showLess => 'Vis mindre';

  @override
  String get readMore => 'Les mer';

  @override
  String get shuffle => 'Tilfeldig';

  @override
  String get shuffleAll => 'Bland alle';

  @override
  String get shuffleAllMusic => 'Spill all musikk i tilfeldig rekkefølge';

  @override
  String get carSignInPrompt => 'Logg på Moonfin på telefonen';

  @override
  String get carServerUnreachable => 'Får ikke kontakt med serveren';

  @override
  String downloadsCount(int count) {
    return '$count nedlastinger';
  }

  @override
  String get perfectMatch => 'Perfekt match';

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
    return 'Ekstern undertekst $action krever Jellyfin-tillatelsen for undertekstadministrasjon for denne brukeren.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Dette elementet ble ikke funnet på serveren for ekstern undertekst $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Ekstern undertekst $action mislyktes: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Ekstern undertekst $action mislyktes (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Kunne ikke $action eksterne undertekster.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'alle nedlastede episoder for «$name»';
  }

  @override
  String get deleteSeasonFiles => 'alle nedlastede episoder i denne sesongen';

  @override
  String get stillWatching => 'Ser du fortsatt?';

  @override
  String get unableToLoadTrailerStream => 'Kan ikke laste trailerstrømmen.';

  @override
  String get trailerTimedOut => 'Traileren ble tidsavbrutt under lasting.';

  @override
  String get playbackFailedForTrailer =>
      'Avspilling mislyktes for denne traileren.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Casting er utilgjengelig under avspilling uten nett.';

  @override
  String castActionFailed(String label, String error) {
    return '$label-handlingen mislyktes: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Kunne ikke angi cast-volum: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label-kontroller';
  }

  @override
  String get deviceVolume => 'Enhetsvolum';

  @override
  String get unavailable => 'Utilgjengelig';

  @override
  String get pause => 'Pause';

  @override
  String get syncPosition => 'Synkroniseringsposisjon';

  @override
  String stopCast(String label) {
    return 'Stopp $label';
  }

  @override
  String get queueIsEmpty => 'Køen er tom';

  @override
  String trackNumber(int number) {
    return 'Spor $number';
  }

  @override
  String get remotePlayback => 'Fjernavspilling';

  @override
  String get castingToGoogleCast => 'Caster til Google Cast';

  @override
  String get castingViaAirPlay => 'Caster via AirPlay';

  @override
  String get castingViaDlna => 'Caster via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String get longPressToUnlock => 'Langt trykk for å låse opp';

  @override
  String get off => 'Av';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Auto';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get audioDelay => 'Lydforsinkelse';

  @override
  String delayMinusMs(int value) {
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
  }

  @override
  String get subtitleDelay => 'Undertekstforsinkelse';

  @override
  String get reset => 'Tilbakestill';

  @override
  String get unknown => 'Ukjent';

  @override
  String get playbackInformation => 'Avspillingsinformasjon';

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
  String get playback => 'Avspilling';

  @override
  String get playMethod => 'Spillemetode';

  @override
  String get directPlay => 'Direkte spill';

  @override
  String get directStream => 'Direktestrøm';

  @override
  String get transcoding => 'Omkoding';

  @override
  String get transcodeReasons => 'Årsaker til omkoding';

  @override
  String get player => 'Avspiller';

  @override
  String get container => 'Container';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Oppløsning';

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
  String get track => 'Spor';

  @override
  String get channels => 'Kanaler';

  @override
  String get format => 'Format';

  @override
  String get external => 'Utvendig';

  @override
  String get embedded => 'Innebygd';

  @override
  String castSessionError(String protocol) {
    return 'Øktfeil for $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Kunne ikke laste inn bokdetaljer: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-gjengivelse i appen er ikke tilgjengelig på denne plattformen ennå.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Dette formatet (.$extension) kan ikke vises i appen ennå.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Innebygd dokumentgjengivelse er utilgjengelig på denne plattformen.';

  @override
  String get couldNotOpenExternalViewer => 'Kunne ikke åpne ekstern viewer.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Kunne ikke åpne leseren i appen: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Bokmerket er allerede lagret ved $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Bokmerke lagt til: $label';
  }

  @override
  String get noBookmarksYet =>
      'Ingen bokmerker ennå.\nTrykk på bokmerkeikonet mens du leser for å lagre posisjonen din.';

  @override
  String get noTableOfContentsAvailable =>
      'Ingen innholdsfortegnelse tilgjengelig';

  @override
  String pageLabel(int number) {
    return 'Side $number';
  }

  @override
  String get position => 'Posisjon';

  @override
  String get bookReader => 'Bokleser';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent % lest';
  }

  @override
  String get updating => 'Oppdaterer...';

  @override
  String get markUnread => 'Merk som ulest';

  @override
  String get markAsRead => 'Merk som lest';

  @override
  String get reloadReader => 'Last inn leseren på nytt';

  @override
  String get noPagesFound => 'Ingen sider funnet.';

  @override
  String get failedToDecodePageImage => 'Kunne ikke dekode sidebildet.';

  @override
  String resetZoom(String zoom) {
    return 'Tilbakestill zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Enkeltside';

  @override
  String get twoPageSpread => 'Oppslag på to sider';

  @override
  String get addBookmark => 'Legg til bokmerke';

  @override
  String get bookmarksEllipsis => 'Bokmerker...';

  @override
  String get markedAsRead => 'Merket som lest';

  @override
  String get markedAsUnread => 'Merket som ulest';

  @override
  String failedToUpdateReadState(String error) {
    return 'Kunne ikke oppdatere lesestatus: $error';
  }

  @override
  String get themeSystem => 'Tema: System';

  @override
  String get themeLight => 'Tema: Lys';

  @override
  String get themeDark => 'Tema: Mørkt';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Inverter farger (fast layout)';

  @override
  String get invertColorsPdf => 'Inverter farger (PDF)';

  @override
  String get preparingInAppReader => 'Forbereder leser i appen ...';

  @override
  String get pdfDataNotAvailable => 'PDF-data ikke tilgjengelig.';

  @override
  String get readerFallbackModeActive => 'Leser-reservemodus er aktiv';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Denne plattformen kan ikke kjøre den innebygde dokumentmotoren for $extension-filer.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Bruk Reload Reader etter at du har byttet til et støttet plattformmål (Android, iOS, macOS).';

  @override
  String get openExternally => 'Åpne eksternt';

  @override
  String get noEpubChaptersFound => 'Ingen EPUB-kapitler funnet.';

  @override
  String get readerNotReady => 'Leseren er ikke klar.';

  @override
  String get seriesRecordings => 'Serieopptak';

  @override
  String get now => 'Nå';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Nyheter';

  @override
  String get kids => 'Barn';

  @override
  String get premiere => 'Premiere';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Guide Tidslinje';

  @override
  String failedToLoadGuide(String error) {
    return 'Kunne ikke laste inn guiden: $error';
  }

  @override
  String get noChannelsFound => 'Ingen kanaler funnet';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'BO';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Neste: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes min igjen';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours t igjen';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours t $minutes min igjen';
  }

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Fjernet fra favorittkanaler';

  @override
  String get addedToFavoriteChannels => 'Lagt til favorittkanaler';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Kunne ikke oppdatere favorittkanalen';

  @override
  String get unfavoriteChannel => 'Kanal som ikke er favoritt';

  @override
  String get favoriteChannel => 'Favoritt kanal';

  @override
  String get record => 'Ta opp';

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
  String get cancelRecordingAction => 'Avbryt opptak';

  @override
  String get programSetToRecord => 'Programmet er satt opp for opptak';

  @override
  String get recordingCancelled => 'Opptaket er avbrutt';

  @override
  String get unableToCreateRecording => 'Kan ikke opprette opptak';

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
  String get watch => 'Se på';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Lukk';

  @override
  String failedToPlayChannel(String name) {
    return 'Kunne ikke spille av $name';
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
  String get failedToLoadRecordings => 'Kunne ikke laste inn opptak';

  @override
  String get scheduledInNext24Hours => 'Planlagt i neste 24 timer';

  @override
  String get recentRecordings => 'Nylige opptak';

  @override
  String get tvSeries => 'TV-serier';

  @override
  String get failedToLoadSchedule => 'Kunne ikke laste inn tidsplanen';

  @override
  String get noScheduledRecordings => 'Ingen planlagte opptak';

  @override
  String get cancelRecording => 'Vil du avbryte opptaket?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Vil du avbryte det planlagte opptaket av «$name»?';
  }

  @override
  String get no => 'Nei';

  @override
  String get yesCancel => 'Ja, avbryt';

  @override
  String get failedToCancelRecording => 'Kunne ikke avbryte opptaket';

  @override
  String get failedToLoadSeriesRecordings => 'Kunne ikke laste inn serieopptak';

  @override
  String get noSeriesRecordings => 'Ingen serieopptak';

  @override
  String get cancelSeriesRecording => 'Avbryt serieopptak';

  @override
  String get cancelSeriesRecordingQuestion => 'Vil du avbryte serieopptak?';

  @override
  String stopRecordingName(String name) {
    return 'Vil du stoppe opptaket av «$name»?';
  }

  @override
  String get failedToCancelSeriesRecording => 'Kunne ikke avbryte serieopptak';

  @override
  String get searchThisLibrary => 'Søk i dette biblioteket...';

  @override
  String get searchEllipsis => 'Søk...';

  @override
  String noResultsForQuery(String query) {
    return 'Ingen resultater for «$query»';
  }

  @override
  String searchFailedError(String error) {
    return 'Søket mislyktes: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr-kontotype';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokalt';

  @override
  String get savedMedia => 'Lagrede medier';

  @override
  String get tvShows => 'TV-programmer';

  @override
  String get music => 'Musikk';

  @override
  String get musicAlbums => 'Musikkalbum';

  @override
  String get noMediaInFilter => 'Ingen media i dette filteret';

  @override
  String get noDownloadedMediaYet => 'Ingen nedlastede medier ennå';

  @override
  String get browseLibrary => 'Bla gjennom biblioteket';

  @override
  String get deleteDownload => 'Slett nedlasting';

  @override
  String removeItemAndFiles(String name) {
    return 'Vil du fjerne «$name» og filene?';
  }

  @override
  String tracksCount(int count) {
    return '$count spor';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Spill album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Kunne ikke laste inn albumet: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Fant ingen nedlastede spor for $name.';
  }

  @override
  String get season => 'Sesong';

  @override
  String get errorLoadingEpisodes => 'Feil ved innlasting av episoder';

  @override
  String get noDownloadedEpisodes => 'Ingen nedlastede episoder';

  @override
  String get deleteEpisode => 'Slett episode';

  @override
  String removeName(String name) {
    return 'Vil du fjerne «$name»?';
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
  String get seriesNotFound => 'Finner ikke serien';

  @override
  String get errorLoadingSeries => 'Feil ved innlasting av serien';

  @override
  String get downloadedEpisodes => 'Nedlastede episoder';

  @override
  String seasonNumber(int number) {
    return 'Sesong $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Spesialtilbud';

  @override
  String get deleteSeason => 'Slett sesong';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Vil du slette alle nedlastede episoder i $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episoder',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Lagringshåndtering';

  @override
  String get storageBreakdown => 'Lagringssammenbrudd';

  @override
  String get downloadedItems => 'Nedlastede elementer';

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
  String get storageLimit => 'Lagringsgrense';

  @override
  String get noLimit => 'Ingen grense';

  @override
  String get deleteAllDownloads => 'Slett alle nedlastinger';

  @override
  String get deleteAllDownloadsWarning =>
      'Dette vil fjerne alle nedlastede mediefiler og kan ikke angres.';

  @override
  String get deleteAll => 'Slett alle';

  @override
  String get deleteSelected => 'Slett valgte';

  @override
  String deleteSelectedCount(int count) {
    return 'Vil du slette $count nedlastede elementer?';
  }

  @override
  String get musicAndAudiobooks => 'Musikk og lydbøker';

  @override
  String get images => 'Bilder';

  @override
  String get database => 'Database';

  @override
  String ofStorageLimit(String limit) {
    return 'av grensen på $limit';
  }

  @override
  String get settings => 'Innstillinger';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Autentisering';

  @override
  String get autoLoginServerManagement =>
      'Automatisk pålogging, serveradministrasjon';

  @override
  String get pinCode => 'PIN-kode';

  @override
  String get setUpPinCodeProtection => 'Sett opp PIN-kodebeskyttelse';

  @override
  String get parentalControls => 'Foreldrekontroll';

  @override
  String get contentRatingRestrictions => 'Begrensninger for innholdsvurdering';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, oppløsning, oppførsel';

  @override
  String get languageSizeAppearance => 'Språk, størrelse, utseende';

  @override
  String get qualityStorage => 'Kvalitet, lagring';

  @override
  String get mediaRequestIntegration => 'Integrasjon av mediaforespørsel';

  @override
  String get switchServer => 'Bytt server';

  @override
  String get signOut => 'Logg ut';

  @override
  String get versionLicenses => 'Versjon, lisenser';

  @override
  String get account => 'Konto';

  @override
  String get signInAndSecurity => 'Innlogging og sikkerhet';

  @override
  String get administration => 'Administrasjon';

  @override
  String get serverSettingsUsersLibraries =>
      'Serverinnstillinger, brukere, biblioteker';

  @override
  String get customization => 'Tilpasning';

  @override
  String get themeAndLayout => 'Tema og layout';

  @override
  String get videoAndSubtitles => 'Video og undertekster';

  @override
  String get pluginAndRequests => 'Plugin og forespørsler';

  @override
  String get customizeAccountPlaybackInterface =>
      'Tilpass konto, avspilling og grensesnittadferd';

  @override
  String optionsCount(int count) {
    return '$count alternativer';
  }

  @override
  String get themeAndAppearance => 'Tema og utseende';

  @override
  String get focusBorderColor => 'Fokuser kantfarge';

  @override
  String get watchedIndicators => 'Sette indikatorer';

  @override
  String get always => 'Alltid';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Skjul uovervåket';

  @override
  String get episodesOnly => 'Kun episoder';

  @override
  String get never => 'Aldri';

  @override
  String get focusExpansionAnimation => 'Fokus utvidelsesanimasjon';

  @override
  String get desktopUiScale => 'Desktop UI-skala';

  @override
  String get scaleFocusedCards =>
      'Skaler fokuserte eller svevende kort og fliser';

  @override
  String get seriesThumbnails => 'Serieminiatyrbilder';

  @override
  String get seriesThumbnailsDescription =>
      'Bare episoder: bruk seriegrafikk som samsvarer med hver radbildetype.';

  @override
  String get homeRowInfoOverlay => 'Hjem Rad Info Overlay';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Vis tittel og metadata når du blar gjennom hjemmerader';

  @override
  String get clockDisplay => 'Klokkevisning';

  @override
  String get inMenus => 'I Menyer';

  @override
  String get inVideo => 'I video';

  @override
  String get seasonalEffects => 'Sesongeffekter';

  @override
  String get seasonalEffectsDescription =>
      'Visuelle effekter og sesongmessige dekorasjoner';

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
  String get snow => 'Snø';

  @override
  String get fireworks => 'Fyrverkeri';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Fallende blader';

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
  String get themeMusic => 'Temamusikk';

  @override
  String get playThemeMusicOnDetailPages =>
      'Spill av temamusikk på detaljsidene';

  @override
  String get themeMusicVolume => 'Temamusikkvolum';

  @override
  String percentValue(int value) {
    return '$value %';
  }

  @override
  String get themeMusicOnHomeRows => 'Temamusikk på Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Spill når du surfer på startskjermen';

  @override
  String get loopThemeMusic => 'Gjenta temamusikk';

  @override
  String get loopThemeMusicSubtitle =>
      'Gjenta sporet i stedet for å spille det én gang';

  @override
  String get detailsBackgroundBlur => 'Detaljer Bakgrunnsuskarphet';

  @override
  String get detailsBackgroundOpacity => 'Gjennomsiktighet for detaljbakgrunn';

  @override
  String pixelValue(int value) {
    return '$value px';
  }

  @override
  String get browsingBackgroundBlur => 'Bla gjennom bakgrunnsuskarphet';

  @override
  String get maxStreamingBitrate => 'Maks streaming bitrate';

  @override
  String get maxResolution => 'Maks oppløsning';

  @override
  String get playerZoomMode => 'Spillerzoommodus';

  @override
  String get settingsScrollWheelAction => 'Musehjul';

  @override
  String get settingsScrollWheelActionDescription =>
      'Velg hva rulling med musehjulet over videoen gjør under avspilling.';

  @override
  String get scrollWheelActionOff => 'Av';

  @override
  String get scrollWheelActionSeek => 'Spol (fram / tilbake)';

  @override
  String get scrollWheelActionVolume => 'Volum';

  @override
  String get playerTooltipVolume => 'Volum';

  @override
  String get fit => 'Passe';

  @override
  String get autoCrop => 'Automatisk beskjæring';

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
  String get stretch => 'Strekke';

  @override
  String get refreshRateSwitching => 'Bytte av oppdateringsfrekvens';

  @override
  String get disabled => 'Deaktivert';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Skala på TV';

  @override
  String get scaleOnDevice => 'Skala på enheten';

  @override
  String get trickPlay => 'Trikselek';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Vis forhåndsvisningsminiatyrer når du søker';

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
  String get showDescriptionOnPause => 'Vis beskrivelse på pause';

  @override
  String get dimVideoShowOverview =>
      'Demp video og vis oversiktstekst mens den er satt på pause';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD-låseknapp';

  @override
  String get osdLockButtonDescription =>
      'Vis en låseknapp som blokkerer berøringsinndata inntil den trykkes lenge';

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
  String get audioBehavior => 'Lydoppførsel';

  @override
  String get downmixToStereo => 'Nedmiks til stereo';

  @override
  String get defaultAudioLanguage => 'Standard lydspråk';

  @override
  String get fallbackAudioLanguage => 'Reservespråk for lyd';

  @override
  String get preferDefaultAudioTrack => 'Foretrekk standard lydspor';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Foretrekk originalt lydspor framfor lokalisert dubbing.';

  @override
  String get preferAudioDescription => 'Foretrekk synstolkingsspor';

  @override
  String get preferAudioDescriptionDescription =>
      'Foretrekk synstolkingsspor framfor vanlige spor.';

  @override
  String get autoServerDefault => 'Auto (serverstandard)';

  @override
  String get english => 'engelsk';

  @override
  String get spanish => 'spansk';

  @override
  String get french => 'fransk';

  @override
  String get german => 'tysk';

  @override
  String get italian => 'italiensk';

  @override
  String get portuguese => 'portugisisk';

  @override
  String get japanese => 'japansk';

  @override
  String get korean => 'koreansk';

  @override
  String get chinese => 'kinesisk';

  @override
  String get russian => 'russisk';

  @override
  String get arabic => 'arabisk';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'nederlandsk';

  @override
  String get swedish => 'svensk';

  @override
  String get norwegian => 'norsk';

  @override
  String get danish => 'dansk';

  @override
  String get finnish => 'finsk';

  @override
  String get polish => 'Pusse';

  @override
  String get ac3Passthrough => 'AC3-gjennomgang';

  @override
  String get dtsPassthrough => 'DTS-gjennomgang';

  @override
  String get trueHdSupport => 'TrueHD-støtte';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS-lyd kun til AVR; krever mottakerstøtte og DTS-kildespor';

  @override
  String get settingsAudioFallbackCodec => 'Reservekodek for lyd';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Velg målformatet for omkoding av flerkanalslyd når kildestrømmen ikke kan spilles direkte eller sendes gjennom.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Oppdag automatisk\n(anbefalt)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(standard)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(kun stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(effektiv)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(tapsfri)';

  @override
  String get settingsMaxAudioChannels => 'Maks antall lydkanaler';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Angi maksimalt antall kanaler i lydoppsettet ditt. Flerkanalsstrømmer som overskrider denne grensen, blir nedmikset eller omkodet.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Oppdag automatisk\n(maskinvarestandard)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Kvadrofonisk';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (avansert)';

  @override
  String get settingsAudioCodecPassthrough => 'Kodek-passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Aktiver bare formater som AVR-en eller HDMI-mottakeren din støtter.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3-passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core-passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA-passthrough';

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
  String get settingsAudioTrueHdPassthrough => 'TrueHD-passthrough';

  @override
  String get settingsDetectedAudioCapabilities => 'Oppdagede lydfunksjoner';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Ingen øyeblikksbilde av kjøretidsfunksjoner er tilgjengelig ennå.';

  @override
  String get settingsAudioRouteLabel => 'Rute';

  @override
  String get settingsAudioDecodeLabel => 'Dekoding';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD-lydrute';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Høyttaler';

  @override
  String get settingsAudioRouteHeadphones => 'Hodetelefoner';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get nightMode => 'Nattmodus';

  @override
  String get compressDynamicRange => 'Komprimer dynamisk område';

  @override
  String get advancedMpv => 'Avansert mpv';

  @override
  String get enableCustomMpvConf => 'Aktiver tilpasset mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Bruk en brukerspesifisert mpv.conf før avspillingen starter';

  @override
  String get unsafeAdvancedMpvOptions => 'Usikre avanserte mpv-alternativer';

  @override
  String get unsafeMpvOptionsDescription =>
      'Tillat et bredere sett med mpv-alternativer. Kan bryte avspillingsadferd.';

  @override
  String get hardwareDecoding => 'Maskinvaredekoding';

  @override
  String get hardwareDecodingSubtitle =>
      'Kan forbedre ytelsen, men kan forårsake avspillingsproblemer på enkelte enheter.';

  @override
  String get nextUpAndQueuing => 'Neste opp og kø';

  @override
  String get nextUpDisplay => 'Visning av Neste opp';

  @override
  String get extended => 'Utvidet';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Neste Tidsavbrudd';

  @override
  String secondsValue(int value) {
    return '$value s';
  }

  @override
  String get mediaQueuing => 'Mediakø';

  @override
  String get autoQueueNextEpisodes => 'Auto-kø neste episoder';

  @override
  String get stillWatchingPrompt => 'Ser fortsatt på prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Etter $episodes episoder / $hours t';
  }

  @override
  String get resumeAndSkip => 'Fortsett og hopp over';

  @override
  String get resumeRewind => 'Fortsett tilbakespoling';

  @override
  String get unpauseRewind => 'Slå på pause';

  @override
  String get fiveSeconds => '5 sekunder';

  @override
  String get tenSeconds => '10 sekunder';

  @override
  String get fifteenSeconds => '15 sekunder';

  @override
  String get thirtySeconds => '30 sekunder';

  @override
  String get skipBackLength => 'Hopp tilbake Lengde';

  @override
  String get skipForwardLength => 'Hopp fremover lengde';

  @override
  String get customMpvConfPath => 'Egendefinert mpv.conf-bane';

  @override
  String get notSetMpvConf =>
      'Ikke satt. Moonfin vil prøve en standard mpv.conf i app/data-mapper.';

  @override
  String get selectMpvConf => 'Velg mpv.conf';

  @override
  String get pathToMpvConf => '/bane/til/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stilinnstillinger (størrelse, farge, offset) gjelder for tekstbaserte undertekster (SRT, VTT, TTML). ASS/SSA-undertekster bruker sin egen innebygde stil med mindre \"ASS/SSA Direct Play\" er slått av. Bitmap-undertekster (PGS, DVB, VobSub) kan ikke endres.';

  @override
  String get defaultSubtitleLanguage => 'Standard undertekstspråk';

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
  String get defaultToNoSubtitles => 'Standard til Ingen undertekster';

  @override
  String get turnOffSubtitlesByDefault => 'Slå av undertekster som standard';

  @override
  String get subtitleSize => 'Undertekststørrelse';

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
  String get textFillColor => 'Tekstfyllfarge';

  @override
  String get backgroundColor => 'Bakgrunnsfarge';

  @override
  String get textStrokeColor => 'Tekst Strekfarge';

  @override
  String get subtitleCustomization => 'Tilpasning av undertekster';

  @override
  String get subtitleCustomizationDescription =>
      'Tilpass undertekstens utseende';

  @override
  String get subtitleMode => 'Undertekstmodus';

  @override
  String get subtitleModeFlagged => 'Flagget';

  @override
  String get subtitleModeAlways => 'Alltid';

  @override
  String get subtitleModeForeign => 'Fremmedspråk';

  @override
  String get subtitleModeForced => 'Tvunget';

  @override
  String get subtitleModeFlaggedDescription =>
      'Spiller spor som internt er merket som «default» eller «forced» i mediefilens metadata.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Laster inn og viser undertekster automatisk hver gang en video starter.';

  @override
  String get subtitleModeForeignDescription =>
      'Slår automatisk på undertekster hvis standard lydspor er på et fremmed språk.';

  @override
  String get subtitleModeForcedDescription =>
      'Laster bare inn undertekster som er eksplisitt merket med forced-flagget.';

  @override
  String get subtitleModeNoneDescription =>
      'Deaktiverer automatisk innlasting av undertekster helt.';

  @override
  String get fallbackSubtitleLanguage => 'Reservespråk for undertekster';

  @override
  String get subtitleStream => 'Undertekststrøm';

  @override
  String get subtitlePreviewText =>
      'Den raske brunreven hopper over den late hunden';

  @override
  String get verticalOffset => 'Vertikal offset';

  @override
  String get pgsDirectPlay => 'PGS direktespill';

  @override
  String get directPlayPgsSubtitles => 'Direkte spill PGS undertekster';

  @override
  String get assSsaDirectPlay => 'ASS/SSA-direkteavspilling';

  @override
  String get directPlayAssSsaSubtitles => 'Direkte spill ASS/SSA undertekster';

  @override
  String get white => 'Hvit';

  @override
  String get black => 'Svart';

  @override
  String get yellow => 'Gul';

  @override
  String get green => 'Grønn';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'Rød';

  @override
  String get transparent => 'Gjennomsiktig';

  @override
  String get semiTransparentBlack => 'Semi-transparent svart';

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
  String get global => 'Global';

  @override
  String get desktop => 'Skrivebord';

  @override
  String get mobile => 'Mobil';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Lastet inn profilinnstillinger for $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Kunne ikke laste inn profilinnstillinger for $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Synkroniserte lokale innstillinger til $profile-profilen.';
  }

  @override
  String get syncing => 'Synkroniserer...';

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
  String get profileSyncHidden => 'Profilsynkronisering skjult';

  @override
  String get enablePluginSyncDescription =>
      'Aktiver Server Plugin Sync i Plugin-innstillingene for å vise profilkontroller her.';

  @override
  String get quality => 'Kvalitet';

  @override
  String get defaultDownloadQuality => 'Standard nedlastingskvalitet';

  @override
  String get network => 'Nettverk';

  @override
  String get wifiOnlyDownloads => 'Kun WiFi-nedlastinger';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Vis nedlastinger på serveren';

  @override
  String get reportDownloadsActivitySubtitle =>
      'La serveradministratoren se dine omkodede nedlastinger i dashbordet';

  @override
  String get onlyDownloadOnWifi => 'Last ned kun når du er koblet til WiFi';

  @override
  String get storage => 'Lagring';

  @override
  String get storageUsed => 'Lagring brukt';

  @override
  String get manage => 'Administrer';

  @override
  String get calculating => 'Beregner...';

  @override
  String get downloadLocation => 'Last ned plassering';

  @override
  String get defaultLabel => 'Misligholde';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Lagre i nedlastingsmappen';

  @override
  String get downloadsVisibleToOtherApps =>
      'Nedlastinger/Moonfin — synlig for andre apper';

  @override
  String get dangerZone => 'Faresone';

  @override
  String get clearAllDownloads => 'Fjern alle nedlastinger';

  @override
  String get original => 'Opprinnelig';

  @override
  String get changeDownloadLocation => 'Endre nedlastingssted';

  @override
  String get changeDownloadLocationDescription =>
      'Nye nedlastinger vil bli lagret i den valgte mappen. Eksisterende nedlastinger forblir på gjeldende plassering og kan administreres fra lagringsinnstillingene.';

  @override
  String get confirm => 'Bekrefte';

  @override
  String get cannotWriteToFolder =>
      'Kan ikke skrive til valgt mappe. Velg et annet sted eller gi lagringstillatelser.';

  @override
  String get saveToDownloadsFolderQuestion => 'Lagre i nedlastingsmappen?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Nedlastede medier vil bli lagret i Nedlastinger/Moonfin på enheten din. Disse filene vil være synlige for andre apper som galleriet eller musikkspilleren.\n\nEksisterende nedlastinger forblir på deres nåværende plassering.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Omkoding: Gjenstående tid er utilgjengelig';

  @override
  String get enable => 'Aktiver';

  @override
  String get clearAllDownloadsWarning =>
      'Dette vil slette alle nedlastede medier og kan ikke angres.';

  @override
  String get clearAll => 'Fjern alle';

  @override
  String get navigationStyle => 'Navigasjonsstil';

  @override
  String get topBar => 'Toppbar';

  @override
  String get leftSidebar => 'Venstre sidefelt';

  @override
  String get showShuffleButton => 'Vis Shuffle-knappen';

  @override
  String get showGenresButton => 'Vis sjangre-knapp';

  @override
  String get showFavoritesButton => 'Vis favoritter-knappen';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Vis biblioteker i verktøylinjen';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => 'Vis alltid etiketter i navigasjonslinjen';

  @override
  String get showSeerrButton => 'Vis Seerr-knapp';

  @override
  String get navbarOpacity => 'Navbar opasitet';

  @override
  String get navbarColor => 'Navbar farge';

  @override
  String get gray => 'Grå';

  @override
  String get darkBlue => 'Mørkeblått';

  @override
  String get purple => 'Lilla';

  @override
  String get teal => 'Blågrønn';

  @override
  String get navy => 'Marine';

  @override
  String get charcoal => 'Kull';

  @override
  String get brown => 'Brun';

  @override
  String get darkRed => 'Mørk rød';

  @override
  String get darkGreen => 'Mørkegrønn';

  @override
  String get slate => 'Skifer';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Bibliotekvisning';

  @override
  String get posterLabel => 'Plakat';

  @override
  String get thumbnailLabel => 'Miniatyrbilde';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings =>
      'Overstyr innstillinger per bibliotek';

  @override
  String get applyImageTypeToAllLibraries =>
      'Bruk bildetype på alle biblioteker';

  @override
  String get multiServerLibraries => 'Multi-server biblioteker';

  @override
  String get showLibrariesFromAllServers =>
      'Vis biblioteker fra alle tilkoblede servere';

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
  String get groupItemsIntoCollections => 'Grupper elementer i samlinger';

  @override
  String get hideCollectionAssociatedItems =>
      'Skjul bibliotekelementer som tilhører en samling, når du blar i bibliotekene';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Merknad om bibliotekgruppering';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'For å bruke denne innstillingen må du sørge for at bibliotekinnstillingene «Group movies into collections» og/eller «Group shows into collections» er aktivert under bibliotekets visningsinnstillinger på Jellyfin- eller Emby-serveren.';

  @override
  String get libraryVisibility => 'Bibliotekets synlighet';

  @override
  String get libraryVisibilityDescription =>
      'Slå av og på hjemmesidens synlighet per bibliotek. Start Moonfin på nytt for at endringer skal tre i kraft.';

  @override
  String get showInNavigation => 'Vis i navigasjon';

  @override
  String get showInLatestMedia => 'Vis under nylig lagt til/utgitt media';

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
  String get sourceLibraries => 'Kildebiblioteker';

  @override
  String get sourceCollections => 'Kildesamlinger';

  @override
  String get excludedGenres => 'Ekskluderte sjangere';

  @override
  String get selectAll => 'Velg alle';

  @override
  String itemsSelected(int count) {
    return '$count valgt';
  }

  @override
  String get mediaBar => 'Media Bar';

  @override
  String get mediaSources => 'Mediekilder';

  @override
  String get behavior => 'Oppførsel';

  @override
  String get seconds => 'sekunder';

  @override
  String get mediaBarMode => 'Media Bar stil';

  @override
  String get mediaBarModeDescription =>
      'Velg mellom ulike mediefeltstiler, eller slå av mediefeltet';

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
  String get mediaBarModeOff => 'Av';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Aktiver Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Vis lysbildefremvisning av fremhevet innhold hjemme';

  @override
  String get contentType => 'Innholdstype';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Filmer og TV-serier';

  @override
  String get moviesOnly => 'Kun filmer';

  @override
  String get tvShowsOnly => 'Kun TV-serier';

  @override
  String get itemCount => 'Vareantall';

  @override
  String get noneSelected => 'Ingen valgt';

  @override
  String get noneExcluded => 'Ingen ekskludert';

  @override
  String get autoAdvance => 'Automatisk fremføring';

  @override
  String get autoAdvanceSlides => 'Gå automatisk videre til neste lysbilde';

  @override
  String get autoAdvanceInterval => 'Automatisk fremføringsintervall';

  @override
  String get trailerPreview => 'Forhåndsvisning av trailer';

  @override
  String get autoPlayTrailers =>
      'Spill av trailere automatisk i mediefeltet etter 3 sekunder';

  @override
  String get trailerAudio => 'Trailerlyd';

  @override
  String get enableTrailerAudio => 'Aktiver lyd for trailere i Media Bar';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Undertekster for trailere';

  @override
  String get trailerCaptionsDescription =>
      'Vis undertekster på YouTube-trailere i mediefeltet';

  @override
  String get episodePreview => 'Forhåndsvisning av episode';

  @override
  String get mediaPreview => 'Medieforhåndsvisning';

  @override
  String get episodePreviewDescription =>
      'Spill en 30-sekunders innebygd forhåndsvisning på fokuserte, svevende eller lenge trykket kort';

  @override
  String get mediaPreviewDescription =>
      'Spill en 30-sekunders innebygd forhåndsvisning på fokuserte, svevende eller lenge trykket kort';

  @override
  String get previewAudio => 'Forhåndsvis lyd';

  @override
  String get enablePreviewAudio => 'Aktiver lyd for medieforhåndsvisninger';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Nylig lagt til';

  @override
  String get recentlyReleased => 'Nylig utgitt';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Mine medier';

  @override
  String get myMediaSmall => 'Mine medier (liten)';

  @override
  String get continueWatching => 'Fortsett å se';

  @override
  String get resumeAudio => 'Gjenoppta lyd';

  @override
  String get resumeBooks => 'Gjenoppta bøker';

  @override
  String get activeRecordings => 'Aktive opptak';

  @override
  String get playlists => 'Spillelister';

  @override
  String get liveTV => 'Direktesendt TV';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Tilbakestill til standard';

  @override
  String get homeRowPosterSize => 'Hjemmerads plakatstørrelse';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurer bildetype for hver aktiverte startrad';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Slå sammen Fortsett å se og neste opp';

  @override
  String get combineBothRows =>
      'Kombiner begge radene til en enkelt hjemmeseksjon';

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
  String get fullScreenRows => 'Utvidede hjem-rader';

  @override
  String get fullScreenRowsDescription =>
      'Begrens hjem-rader til én rad per skjerm';

  @override
  String get homeRowsPadding => 'Vertikal avstand mellom rader på startsiden';

  @override
  String get homeRowsPaddingDescription =>
      'Tilpass den vertikale avstanden mellom radene på startsiden';

  @override
  String get homeRowsGenresAndStudios => 'Genres and Studios';

  @override
  String get homeRowsExternalLists => 'External Lists';

  @override
  String get perRowSettings => 'Innstillinger per rad';

  @override
  String get autoLogin => 'Automatisk pålogging';

  @override
  String get lastUser => 'Siste bruker';

  @override
  String get currentUser => 'Gjeldende bruker';

  @override
  String get alwaysAuthenticate => 'Autentiser alltid';

  @override
  String get requirePasswordWithToken => 'Krev passord selv med lagret token';

  @override
  String get confirmExit => 'Bekreft Avslutt';

  @override
  String get showConfirmationBeforeExiting => 'Vis bekreftelse før du går ut';

  @override
  String get blockContentWithRatings =>
      'Blokker innhold med følgende vurderinger:';

  @override
  String get noContentRatingsFound =>
      'Ingen innholdsvurderinger ble funnet på denne serveren ennå.';

  @override
  String get couldNotLoadServerRatings =>
      'Kunne ikke laste inn servervurderinger. Viser kun lagrede vurderinger.';

  @override
  String get couldNotRefreshRatings =>
      'Kunne ikke oppdatere vurderinger fra serveren. Viser lagrede vurderinger.';

  @override
  String get enablePinCode => 'Aktiver PIN-kode';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess =>
      'Krev en PIN-kode for å få tilgang til kontoen din';

  @override
  String get changePin => 'Endre PIN';

  @override
  String get setNewPinCode => 'Angi en ny PIN-kode';

  @override
  String get removePin => 'Fjern PIN-koden';

  @override
  String get removePinProtection => 'Fjern PIN-kodebeskyttelsen';

  @override
  String get screensaver => 'Skjermsparer';

  @override
  String get inAppScreensaver => 'Skjermsparer i appen';

  @override
  String get enableBuiltInScreensaver => 'Aktiver den innebygde skjermspareren';

  @override
  String get mode => 'Modus';

  @override
  String get libraryArt => 'Bibliotekskunst';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Klokke';

  @override
  String get timeout => 'Tidsavbrudd';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Dimmenivå';

  @override
  String get maxAgeRating => 'Maks aldersvurdering';

  @override
  String get any => 'Noen';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Krev aldersgrense';

  @override
  String get onlyShowRatedContent => 'Vis kun vurdert innhold';

  @override
  String get displayClockDuringScreensaver => 'Vis klokke under skjermsparer';

  @override
  String get clockModeStatic => 'Statisk';

  @override
  String get clockModeBouncing => 'Sprettende';

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
  String get rottenTomatoesCritics => 'Råtne tomater (kritikere)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (publikum)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritisk';

  @override
  String get metacriticUser => 'Metacritic (bruker)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Fellesskapsvurdering';

  @override
  String get ratings => 'Vurderinger';

  @override
  String get additionalRatings => 'Ytterligere vurderinger';

  @override
  String get showMdbListAndTmdbRatings => 'Vis MDBList- og TMDB-vurderinger';

  @override
  String get ratingLabels => 'Vurderingsetiketter';

  @override
  String get showLabelsNextToIcons =>
      'Vis etiketter ved siden av rangeringsikoner';

  @override
  String get ratingBadges => 'Vurderingsmerker';

  @override
  String get showDecorativeBadges => 'Vis dekorative merker bak vurderinger';

  @override
  String get episodeRatings => 'Episodevurderinger';

  @override
  String get showRatingsOnEpisodes =>
      'Vis vurderinger på individuelle episoder';

  @override
  String get ratingSources => 'Rangeringskilder';

  @override
  String get ratingSourcesDescription =>
      'Aktiver og omorganiser vurderingskildene som vises i hele appen';

  @override
  String get pluginDetected => 'Plugin oppdaget';

  @override
  String get pluginNotDetected => 'Plugin ikke oppdaget';

  @override
  String get pluginNotDetectedDescription =>
      'Serverplugin er for øyeblikket ikke oppdaget. Lokale innstillinger bruker fortsatt de lagrede verdiene eller innebygde standardinnstillingene.';

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
  String get recentRequests => 'Nylige forespørsler';

  @override
  String get recentlyAdded => 'Nylig lagt til';

  @override
  String get trending => 'På vei opp';

  @override
  String get popularMovies => 'Populære filmer';

  @override
  String get movieGenres => 'Filmsjangre';

  @override
  String get upcomingMovies => 'Kommende filmer';

  @override
  String get studios => 'Studioer';

  @override
  String get popularSeries => 'Populær serie';

  @override
  String get seriesGenres => 'Seriesjangre';

  @override
  String get upcomingSeries => 'Kommende serie';

  @override
  String get networks => 'Nettverk';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Seerr-oppdagelsesrader';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Din visningsliste';

  @override
  String get resetRowsToDefaults => 'Tilbakestill rader til standardverdier';

  @override
  String get enableSeerr => 'Aktiver Seerr';

  @override
  String get showSeerrInNavigation =>
      'Vis Seerr i navigasjon (krever serverplugin)';

  @override
  String get seerrUnavailable =>
      'Utilgjengelig fordi serverplugin Seerr-støtte er deaktivert.';

  @override
  String get nsfwFilter => 'NSFW-filter';

  @override
  String get hideAdultContent => 'Skjul voksent innhold i resultater';

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
  String get seerrNotificationsSection => 'Varsler';

  @override
  String get seerrNotifyNewRequestsTitle => 'Varsler om nye forespørsler';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Varsle meg når noen sender inn en forespørsel';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Oppdateringer om forespørsler';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Godkjent, avslått og lagt til i biblioteket ditt';

  @override
  String get seerrNotifyIssuesTitle => 'Oppdateringer om saker';

  @override
  String get seerrNotifyIssuesSubtitle => 'Nye saker, svar og løsninger';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Logget inn som: $username';
  }

  @override
  String get discoverRows => 'Seerr-oppdagelsesside';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Aktiver radene du vil se på Seerr-hovedsiden. Dra for å endre rekkefølge. Egendefinert rekkefølge synkroniseres med Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Aktiver radene du vil se på Seerr-hovedsiden. Dra for å endre rekkefølge. Egendefinert rekkefølge synkroniseres med Moonbase.';

  @override
  String get enabled => 'Aktivert';

  @override
  String get hidden => 'Skjult';

  @override
  String get aboutTitle => 'Om';

  @override
  String versionValue(String version) {
    return 'Versjon $version';
  }

  @override
  String get openSourceLicenses => 'Åpen kildekode-lisenser';

  @override
  String get sourceCode => 'Kildekode';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Se etter oppdateringer nå';

  @override
  String get checksLatestDesktopRelease =>
      'Sjekker siste desktop-utgivelse for denne plattformen';

  @override
  String get youAreUpToDate => 'Du er oppdatert.';

  @override
  String get couldNotCheckForUpdates =>
      'Kunne ikke se etter oppdateringer akkurat nå.';

  @override
  String get noCompatibleUpdate =>
      'Finner ingen kompatibel oppdateringspakke for denne plattformen.';

  @override
  String get updateChecksNotSupported =>
      'Oppdateringssjekker støttes ikke på denne plattformen.';

  @override
  String get updateNotificationsDisabled =>
      'Oppdateringsvarsler er deaktivert.';

  @override
  String get pleaseWaitBeforeChecking => 'Vent før du sjekker igjen.';

  @override
  String get latestUpdateAlreadyShown => 'Siste oppdatering ble allerede vist.';

  @override
  String get updateAvailable => 'Oppdatering tilgjengelig.';

  @override
  String updateAvailableVersion(String version) {
    return 'Oppdatering tilgjengelig: v$version';
  }

  @override
  String get updateNotifications => 'Oppdater varsler';

  @override
  String get showWhenUpdatesAvailable =>
      'Vis når oppdateringer er tilgjengelige';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version er tilgjengelig';
  }

  @override
  String get readReleaseNotes => 'Les versjonsmerknader';

  @override
  String get downloadingUpdate => 'Laster ned oppdatering...';

  @override
  String get updateDownloadFailed =>
      'Nedlasting av oppdatering mislyktes. Vennligst prøv igjen.';

  @override
  String get openReleasesPage => 'Åpne utgivelsessiden';

  @override
  String get navigation => 'Navigasjon';

  @override
  String get watchedIndicatorsBackdrops => 'Sette indikatorer, bakgrunner';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokusfarge, overvåkede indikatorer, bakgrunner';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar stil, verktøylinjeknapper, utseende';

  @override
  String get featuredContentAppearance => 'Fremhevet innhold, utseende';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Grense for bildebuffer';

  @override
  String get clearImageCache => 'Tøm bildebuffer';

  @override
  String get imageCacheCleared => 'Bildebufferen er tømt';

  @override
  String get clear => 'Tøm';

  @override
  String get browse => 'Bla gjennom';

  @override
  String get noResults => 'Ingen resultater';

  @override
  String get seerrAvailableStatus => 'Tilgjengelig';

  @override
  String get seerrRequestedStatus => 'Forespurt';

  @override
  String get seerrDownloading => 'Laster ned';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Laster ned · $done / $total';
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
    return 'Laster ned · $percent %';
  }

  @override
  String get seerrImportingStatus => 'Importerer';

  @override
  String itemsCount(int count) {
    return '$count elementer';
  }

  @override
  String get seerrSettings => 'Seerr-innstillinger';

  @override
  String get requestMore => 'Be om mer';

  @override
  String get requestMore4k => 'Be om mer i 4K';

  @override
  String get request => 'Forespør';

  @override
  String get request4k => 'Forespør i 4K';

  @override
  String get requested4k => '4K Forespurt';

  @override
  String get cancelRequest => 'Avbryt forespørsel';

  @override
  String get cancelRequest4k => 'Avbryt 4K Foresørsel';

  @override
  String get playInMoonfin => 'Spill i Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Forespurt av $name';
  }

  @override
  String get manageRequests => 'Administrer Forespørsler';

  @override
  String get watchlist => 'Skal sjå liste';

  @override
  String get onWatchlist => 'På Skal Sjå lista';

  @override
  String get approve => 'Vedta';

  @override
  String get declineAction => 'Avslå';

  @override
  String get similar => 'Lignende';

  @override
  String get recommendations => 'Anbefalinger';

  @override
  String cancelRequestForTitle(String title) {
    return 'Vil du avbryte forespørselen for «$title»?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Vil du avbryte $count forespørsler for «$title»?';
  }

  @override
  String get keep => 'Beholde';

  @override
  String get itemNotFoundInLibrary =>
      'Elementet ble ikke funnet i Moonfin-biblioteket';

  @override
  String get errorSearchingLibrary => 'Feil ved søk i bibliotek';

  @override
  String budgetAmount(String amount) {
    return 'Budsjett: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Inntekter: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Be om $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Forespør i 4K $type';
  }

  @override
  String get submitRequest => 'Send inn forespørsel';

  @override
  String get allSeasons => 'Alle sesonger';

  @override
  String get seerrSeriesContinuing =>
      'Serien fortsetter · Kommende sesonger kan bli forespurt';

  @override
  String get advancedOptions => 'Avanserte alternativer';

  @override
  String get noServiceServersConfigured =>
      'Ingen tjenesteservere er konfigurert';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Kvalitetsprofil';

  @override
  String get rootFolder => 'Rotmappe';

  @override
  String get showMore => 'Vis mer';

  @override
  String get appearances => 'Opptredener';

  @override
  String get crewSection => 'Mannskap';

  @override
  String ageValue(int age) {
    return 'alder $age';
  }

  @override
  String get noRequests => 'Ingen forespørsler';

  @override
  String get pendingStatus => 'I påvente av';

  @override
  String get declinedStatus => 'Avslått';

  @override
  String get partiallyAvailable => 'Delvis tilgjengelig';

  @override
  String get downloadingStatus => 'Laster ned';

  @override
  String get approvedStatus => 'Godkjent';

  @override
  String get notRequestedStatus => 'Ikke forespurt';

  @override
  String get blocklistedStatus => 'Blokklistet';

  @override
  String get deletedStatus => 'Slettet';

  @override
  String get failedStatus => 'Mislyktes';

  @override
  String get processingStatus => 'Behandles';

  @override
  String modifiedByName(String name) {
    return 'Endret av $name';
  }

  @override
  String get completedStatus => 'Fullført';

  @override
  String get requestErrorDuplicate => 'Denne tittelen er allerede forespurt';

  @override
  String get requestErrorQuota => 'Forespørselsgrensen er nådd';

  @override
  String get requestErrorBlocklisted => 'Denne tittelen er blokkert';

  @override
  String get requestErrorNoSeasons => 'Ingen sesonger igjen å be om';

  @override
  String get requestErrorPermission =>
      'Du har ikke tillatelse til å sende denne forespørselen';

  @override
  String get seerrRequestsTitle => 'Forespørsler';

  @override
  String get seerrIssuesTitle => 'Saker';

  @override
  String get sortNewest => 'Nyeste';

  @override
  String get sortLastModified => 'Sist endret';

  @override
  String get noIssues => 'Ingen saker';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining av $limit filmforespørsler igjen';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining av $limit sesongforespørsler igjen';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Del av $name';
  }

  @override
  String get viewCollection => 'Vis samling';

  @override
  String get requestCollection => 'Be om samling';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmer · $available tilgjengelige';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Be om $count filmer';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Ber om $current av $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count filmer forespurt';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$ok av $total filmer forespurt';
  }

  @override
  String get collectionAllRequested =>
      'Alle filmer er allerede tilgjengelige eller forespurt';

  @override
  String get reportIssue => 'Rapporter sak';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Lyd';

  @override
  String get whatsWrong => 'Hva er galt?';

  @override
  String get allEpisodes => 'Alle episoder';

  @override
  String get episode => 'Episode';

  @override
  String get openStatus => 'Åpen';

  @override
  String get resolvedStatus => 'Løst';

  @override
  String get resolveAction => 'Løs';

  @override
  String get reopenAction => 'Gjenåpne';

  @override
  String reportedByName(String name) {
    return 'Rapportert av $name';
  }

  @override
  String commentsCount(int count) {
    return '$count kommentarer';
  }

  @override
  String get addComment => 'Legg til en kommentar';

  @override
  String get deleteIssueConfirm => 'Vil du slette denne saken?';

  @override
  String get submitReport => 'Send inn rapport';

  @override
  String get tmdbScore => 'TMDB-poengsum';

  @override
  String get releaseDateLabel => 'Utgivelsesdato';

  @override
  String get firstAirDateLabel => 'Første luftdato';

  @override
  String get revenueLabel => 'Inntekter';

  @override
  String get runtimeLabel => 'Kjøretid';

  @override
  String get budgetLabel => 'Budsjett';

  @override
  String get originalLanguageLabel => 'Originalspråk';

  @override
  String get seasonsLabel => 'Sesonger';

  @override
  String get episodesLabel => 'Episoder';

  @override
  String get access => 'Adgang';

  @override
  String get add => 'Legg til';

  @override
  String get address => 'Adresse';

  @override
  String get analytics => 'Analyse';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Innhold';

  @override
  String get copy => 'Kopiere';

  @override
  String get create => 'Skape';

  @override
  String get disable => 'Deaktiver';

  @override
  String get done => 'Ferdig';

  @override
  String get edit => 'Rediger';

  @override
  String get encoding => 'Koding';

  @override
  String get error => 'Feil';

  @override
  String get forward => 'Fremover';

  @override
  String get general => 'Generelt';

  @override
  String get go => 'Gå';

  @override
  String get install => 'Installer';

  @override
  String get installed => 'Installert';

  @override
  String get interval => 'Intervall';

  @override
  String get name => 'Navn';

  @override
  String get networking => 'Nettverk';

  @override
  String get next => 'Neste';

  @override
  String get path => 'Sti';

  @override
  String get paused => 'Pause';

  @override
  String get permissions => 'Tillatelser';

  @override
  String get processing => 'Behandling';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Leverandør';

  @override
  String get refresh => 'Forfriske';

  @override
  String get remote => 'Fjernkontroll';

  @override
  String get rename => 'Gi nytt navn';

  @override
  String get revoke => 'Oppheve';

  @override
  String get role => 'Rolle';

  @override
  String get root => 'Rot';

  @override
  String get run => 'Løp';

  @override
  String get search => 'Søk';

  @override
  String get select => 'Velge';

  @override
  String get send => 'Sende';

  @override
  String get sessions => 'Økter';

  @override
  String get set => 'Sett';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Stopp';

  @override
  String get streaming => 'Strømming';

  @override
  String get time => 'Tid';

  @override
  String get trickplay => 'Miniatyrbilder ved spoling';

  @override
  String get uninstall => 'Avinstaller';

  @override
  String get up => 'Opp';

  @override
  String get update => 'Oppdater';

  @override
  String get upload => 'Last opp';

  @override
  String get unmute => 'Slå på lyden';

  @override
  String get mute => 'Demp';

  @override
  String get branding => 'Merkevarebygging';

  @override
  String get adminDrawerDashboard => 'Dashbord';

  @override
  String get adminDrawerAnalytics => 'Analyse';

  @override
  String get adminDrawerSettings => 'Innstillinger';

  @override
  String get adminDrawerBranding => 'Merkevarebygging';

  @override
  String get adminDrawerUsers => 'Brukere';

  @override
  String get adminDrawerLibraries => 'Biblioteker';

  @override
  String get adminDrawerDisplay => 'Visning';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO-innstillinger';

  @override
  String get adminDrawerTranscoding => 'Omkoding';

  @override
  String get adminDrawerResume => 'Fortsett';

  @override
  String get adminDrawerStreaming => 'Strømming';

  @override
  String get adminDrawerTrickplay => 'Miniatyrbilder ved spoling';

  @override
  String get adminDrawerDevices => 'Enheter';

  @override
  String get adminDrawerActivity => 'Aktivitet';

  @override
  String get adminDrawerNetworking => 'Nettverk';

  @override
  String get adminDrawerApiKeys => 'API-nøkler';

  @override
  String get adminDrawerBackups => 'Sikkerhetskopier';

  @override
  String get adminDrawerLogs => 'Logger';

  @override
  String get adminDrawerScheduledTasks => 'Planlagte oppgaver';

  @override
  String get adminDrawerPlugins => 'Tillegg';

  @override
  String get adminDrawerRepositories => 'Lagre';

  @override
  String get adminDrawerLiveTv => 'Direktesendt TV';

  @override
  String get adminExitTooltip => 'Avslutt Admin';

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
  String get adminDashboardLoadFailed => 'Kunne ikke laste dashbordet';

  @override
  String get adminMediaOverview => 'Medieoversikt';

  @override
  String get adminMediaTotalsError =>
      'Kunne ikke laste inn servermedietotaler.';

  @override
  String get adminMediaOverviewSubtitle =>
      'En rask lesning om hvor mye innhold som er på denne serveren.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Tilgjengelige tilleggsoppdateringer: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Tillegg som krever omstart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Mislykkede planlagte oppgaver: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Mediedistribusjon';

  @override
  String get analyticsVideoCodecs => 'Videokodeker';

  @override
  String get analyticsAudioCodecs => 'Lydkodeker';

  @override
  String get analyticsContainers => 'Containere';

  @override
  String get analyticsTopGenres => 'Topp sjangere';

  @override
  String get analyticsReleaseYears => 'Utgivelsesår';

  @override
  String get analyticsContentRatings => 'Innholdsvurderinger';

  @override
  String get analyticsRuntimeBuckets => 'Runtime Bøtter';

  @override
  String get analyticsFileFormats => 'Filformater';

  @override
  String get analyticsNoData => 'Ingen data tilgjengelig.';

  @override
  String get adminServerInfo => 'Serverinfo';

  @override
  String get adminRestartPending => 'Venter på nytt';

  @override
  String get adminServerPaths => 'Serverbaner';

  @override
  String get adminServerActions => 'Serverhandlinger';

  @override
  String get adminRestartServer => 'Start server på nytt';

  @override
  String get adminShutdownServer => 'Slå av server';

  @override
  String get adminLibraryScanStarted => 'Bibliotekskanning startet';

  @override
  String errorGeneric(String error) {
    return 'Feil: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Server omstart pågår';

  @override
  String get adminServerRebootMessage =>
      'Server omstart pågår, vennligst start Moonfin på nytt';

  @override
  String get adminActiveSessions => 'Aktive økter';

  @override
  String get adminSessionsLoadFailed => 'Kunne ikke laste inn økter';

  @override
  String get adminNoActiveSessions => 'Ingen aktive økter';

  @override
  String get adminRecentActivity => 'Nylig aktivitet';

  @override
  String get adminNoRecentActivity => 'Ingen nylig aktivitet';

  @override
  String adminCommandFailed(String error) {
    return 'Kommandoen mislyktes: $error';
  }

  @override
  String get adminSendMessage => 'Send melding';

  @override
  String get adminMessageTextHint => 'Meldingstekst';

  @override
  String get adminSetVolume => 'Still inn volum';

  @override
  String get sessionPrev => 'Forrige';

  @override
  String get sessionRewind => 'Spole';

  @override
  String get sessionForward => 'Fremover';

  @override
  String get sessionNext => 'Neste';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Spiller nå';

  @override
  String get volume => 'Volum';

  @override
  String get actions => 'Handlinger';

  @override
  String get videoCodec => 'Videokodek';

  @override
  String get audioCodec => 'Lydkodek';

  @override
  String get hwAccel => 'HW-akselerasjon';

  @override
  String get completion => 'Fullføring';

  @override
  String get adminClearDates => 'Klare datoer';

  @override
  String get adminActivitySeverityAll => 'Alle alvorlighetsgrader';

  @override
  String get adminActivityDateRange => 'Datoområde';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Kunne ikke laste inn aktivitetsloggen: $error';
  }

  @override
  String get adminNoActivityEntries => 'Ingen aktivitetsoppføringer';

  @override
  String get adminEditDeviceName => 'Rediger enhetsnavn';

  @override
  String get adminCustomName => 'Egendefinert navn';

  @override
  String get adminDeviceNameUpdated => 'Enhetsnavnet er oppdatert';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Kunne ikke oppdatere enheten: $error';
  }

  @override
  String get adminDeleteDevice => 'Slett enhet';

  @override
  String get adminDeviceDeleted => 'Enheten er slettet';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Kunne ikke slette enheten: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Vil du fjerne enheten \'$name\'? Brukeren må logge på igjen på denne enheten.';
  }

  @override
  String get adminDeleteAllDevices => 'Slett alle enheter';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Vil du fjerne $count enheter? Berørte brukere må logge på igjen. Din nåværende enhet påvirkes ikke.';
  }

  @override
  String get adminDevicesDeletedAll => 'Enhetene er fjernet';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Noen enheter ble fjernet, men $count kunne ikke fjernes.';
  }

  @override
  String get adminDevicesLoadFailed => 'Kunne ikke laste inn enheter';

  @override
  String get adminSearchDevices => 'Søk etter enheter';

  @override
  String get adminThisDevice => 'Denne enheten';

  @override
  String get adminEditName => 'Rediger navn';

  @override
  String get adminLibrariesLoadFailed => 'Kunne ikke laste inn bibliotekene';

  @override
  String get adminNoLibraries => 'Ingen biblioteker er konfigurert';

  @override
  String get adminScanAllLibraries => 'Skann alle biblioteker';

  @override
  String get adminAddLibrary => 'Legg til bibliotek';

  @override
  String adminScanFailed(String error) {
    return 'Kunne ikke starte skanningen: $error';
  }

  @override
  String get adminRenameLibrary => 'Gi nytt navn til biblioteket';

  @override
  String get adminNewName => 'Nytt navn';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteket er omdøpt til «$name»';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Kunne ikke gi nytt navn: $error';
  }

  @override
  String get adminDeleteLibrary => 'Slett bibliotek';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteket «$name» er slettet';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Kunne ikke slette biblioteket: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Kunne ikke legge til banen: $error';
  }

  @override
  String get adminRemovePath => 'Fjern bane';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Vil du fjerne «$path» fra dette biblioteket?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Kunne ikke fjerne banen: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Kunne ikke laste inn biblioteket';

  @override
  String get adminNoMediaPaths => 'Ingen mediebaner er konfigurert';

  @override
  String get adminAddPath => 'Legg til bane';

  @override
  String get adminBrowseFilesystem => 'Bla gjennom serverfilsystemet:';

  @override
  String get adminPreferredMetadataLanguage => 'Foretrukket metadataspråk';

  @override
  String get adminMetadataLanguageHint => 'f.eks. no, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadata landskode';

  @override
  String get adminMetadataCountryHint => 'f.eks. USA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Baner';

  @override
  String get adminLibraryTabOptions => 'Alternativer';

  @override
  String get adminLibraryTabDownloaders => 'Nedlastere';

  @override
  String get adminLibMetadataSavers => 'Metadatalagrere';

  @override
  String get adminLibSubtitleDownloaders => 'Undertekstnedlastere';

  @override
  String get adminLibLyricDownloaders => 'Sangtekstnedlastere';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadatanedlastere: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Bildehentere: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Denne serveren tilbyr ingen nedlastere for denne bibliotektypen.';

  @override
  String get adminLibrarySectionGeneral => 'Generelt';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Innebygd informasjon';

  @override
  String get adminLibrarySectionSubtitles => 'Undertekster';

  @override
  String get adminLibrarySectionImages => 'Bilder';

  @override
  String get adminLibrarySectionSeries => 'Serier';

  @override
  String get adminLibrarySectionMusic => 'Musikk';

  @override
  String get adminLibrarySectionMovies => 'Filmer';

  @override
  String get adminLibRealtimeMonitor => 'Aktiver sanntidsovervåking';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Oppdag filendringer og behandle dem automatisk.';

  @override
  String get adminLibEnablePhotos => 'Vis bilder';

  @override
  String get adminLibSaveLocalMetadata => 'Lagre bildemateriell i mediemappene';

  @override
  String get adminLibRefreshInterval => 'Automatisk oppdatering av metadata';

  @override
  String get adminLibRefreshNever => 'Aldri';

  @override
  String get adminLibDefault => 'Standard';

  @override
  String get adminLibDisplayTitle => 'Visning';

  @override
  String get adminLibDisplaySection => 'Bibliotekvisning';

  @override
  String get adminLibFolderView =>
      'Vis en mappevisning for å vise vanlige mediemapper';

  @override
  String get adminLibSpecialsInSeasons =>
      'Vis spesialepisoder i sesongene de ble sendt i';

  @override
  String get adminLibGroupMovies => 'Grupper filmer i samlinger';

  @override
  String get adminLibGroupShows => 'Grupper serier i samlinger';

  @override
  String get adminLibExternalSuggestions => 'Vis eksternt innhold i forslag';

  @override
  String get adminLibDateAddedSection => 'Virkemåte for lagt til-dato';

  @override
  String get adminLibDateAddedLabel => 'Bruk lagt til-dato fra';

  @override
  String get adminLibDateAddedImport =>
      'Datoen filen ble skannet inn i biblioteket';

  @override
  String get adminLibDateAddedFile => 'Datoen filen ble opprettet';

  @override
  String get adminLibMetadataTitle => 'Metadata og bilder';

  @override
  String get adminLibMetadataLangSection => 'Foretrukket metadataspråk';

  @override
  String get adminLibChaptersSection => 'Kapitler';

  @override
  String get adminLibDummyChapterDuration =>
      'Varighet for genererte kapitler (sekunder)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Lengden på kapitler som genereres for medier uten kapitler. Sett til 0 for å deaktivere.';

  @override
  String get adminLibChapterImageResolution => 'Oppløsning for kapittelbilder';

  @override
  String get adminLibNfoTitle => 'NFO-innstillinger';

  @override
  String get adminLibNfoHelp =>
      'NFO-metadata er kompatible med Kodi og lignende klienter. Innstillingene gjelder alle biblioteker som lagrer NFO-metadata.';

  @override
  String get adminLibKodiUser =>
      'Bruker det skal lagres visningsdata for i NFO-filer';

  @override
  String get adminLibSaveImagePaths => 'Lagre bildebaner i NFO-filer';

  @override
  String get adminLibPathSubstitution =>
      'Aktiver baneerstatning for NFO-bildebaner';

  @override
  String get adminLibExtraThumbs =>
      'Kopier extrafanart-bilder til en extrathumbs-mappe';

  @override
  String get adminLibNone => 'Ingen';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dager';
  }

  @override
  String get adminLibEmbeddedTitles => 'Bruk innebygde titler';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Bruk innebygde titler for ekstramateriale';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Bruk innebygd episodeinformasjon';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Tillat innebygde undertekster';

  @override
  String get adminLibEmbeddedAllowAll => 'Tillat alle';

  @override
  String get adminLibEmbeddedAllowText => 'Kun tekst';

  @override
  String get adminLibEmbeddedAllowImage => 'Kun bilde';

  @override
  String get adminLibEmbeddedAllowNone => 'Ingen';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Hopp over nedlasting hvis innebygde undertekster finnes';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Hopp over nedlasting hvis lydsporet samsvarer med nedlastingsspråket';

  @override
  String get adminLibRequirePerfectMatch => 'Krev perfekt undertekstsamsvar';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Lagre undertekster i mediemappene';

  @override
  String get adminLibChapterImageExtraction => 'Trekk ut kapittelbilder';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Trekk ut kapittelbilder under bibliotekskanningen';

  @override
  String get adminLibTrickplayExtraction =>
      'Aktiver uttrekking av trickplay-bilder';

  @override
  String get adminLibTrickplayDuringScan =>
      'Trekk ut trickplay-bilder under bibliotekskanningen';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Lagre trickplay-bilder i mediemappene';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Slå automatisk sammen serier som er spredt over flere mapper';

  @override
  String get adminLibSeasonZeroName => 'Visningsnavn for sesong null';

  @override
  String get adminLibLufsScan => 'Aktiver LUFS-skanning for lydnormalisering';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Foretrekk ikke-standard artisttagg';

  @override
  String get adminLibAutoAddToCollection =>
      'Legg filmer automatisk til i samlinger';

  @override
  String get adminLibraryNameRequired => 'Biblioteknavn er obligatorisk';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Kunne ikke opprette biblioteket: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotekets navn';

  @override
  String get adminSelectedPaths => 'Valgte stier:';

  @override
  String get adminCreateLibrary => 'Opprett bibliotek';

  @override
  String get paths => 'Baner:';

  @override
  String get adminDisableUser => 'Deaktiver bruker';

  @override
  String get adminEnableUser => 'Aktiver bruker';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Vil du deaktivere $name? Brukeren vil ikke kunne logge på.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Vil du aktivere $name? Brukeren vil kunne logge på igjen.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Brukeren «$name» er deaktivert';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Brukeren «$name» er aktivert';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Kunne ikke oppdatere brukerpolicyen: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Kunne ikke laste inn brukere';

  @override
  String get adminSearchUsers => 'Søk etter brukere';

  @override
  String get adminEditUser => 'Rediger bruker';

  @override
  String get adminAddUser => 'Legg til bruker';

  @override
  String adminUserCreateFailed(String error) {
    return 'Kunne ikke opprette brukeren: $error';
  }

  @override
  String get adminCreateUser => 'Opprett bruker';

  @override
  String get adminPasswordOptional => 'Passord (valgfritt)';

  @override
  String get adminUsernameRequired => 'Brukernavnet kan ikke være tomt';

  @override
  String adminSaveFailed(String error) {
    return 'Kunne ikke lagre: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Passord stemmer ikke';

  @override
  String adminFailed(String error) {
    return 'Mislyktes: $error';
  }

  @override
  String get adminUserLoadFailed => 'Kunne ikke laste brukeren';

  @override
  String get adminDeleteUser => 'Slett bruker';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Administratorer har full tilgang til serveren. Gi med forsiktighet.';

  @override
  String get administrator => 'Administrator';

  @override
  String get adminHiddenUser => 'Skjult bruker';

  @override
  String get adminAllowMediaPlayback => 'Tillat medieavspilling';

  @override
  String get adminAllowAudioTranscoding => 'Tillat lydomkoding';

  @override
  String get adminAllowVideoTranscoding => 'Tillat videoomkoding';

  @override
  String get adminAllowRemuxing => 'Tillat remiksing';

  @override
  String get adminForceRemoteTranscoding => 'Tving omkoding av ekstern kilde';

  @override
  String get adminAllowContentDownloading => 'Tillat nedlasting av innhold';

  @override
  String get adminAllowPublicSharing => 'Tillat offentlig deling';

  @override
  String get adminAllowRemoteControl => 'Tillat fjernkontroll av andre brukere';

  @override
  String get adminAllowSharedDeviceControl => 'Tillat delt enhetskontroll';

  @override
  String get adminAllowRemoteAccess => 'Tillat ekstern tilgang';

  @override
  String get adminLeaveEmptyNoLimit => 'La stå tomt uten grense';

  @override
  String get adminMaxActiveSessions => 'Maks aktive økter';

  @override
  String get adminAllowLiveTvAccess => 'Tillat direkte TV-tilgang';

  @override
  String get adminAllowLiveTvManagement => 'Tillat direkte-TV-administrasjon';

  @override
  String get adminAllowCollectionManagement => 'Tillat samlingshåndtering';

  @override
  String get adminAllowSubtitleManagement => 'Tillat undertekstbehandling';

  @override
  String get adminAllowLyricManagement => 'Tillat tekstbehandling';

  @override
  String get adminEnableAllLibraryAccess =>
      'Aktiver tilgang til alle biblioteker';

  @override
  String get adminChangePassword => 'Endre passord';

  @override
  String get adminNewPassword => 'Nytt passord';

  @override
  String get adminConfirmPassword => 'Bekreft passord';

  @override
  String get adminSetPassword => 'Angi passord';

  @override
  String get adminResetPassword => 'Tilbakestill passord';

  @override
  String get adminPasswordReset => 'Tilbakestill passord';

  @override
  String get adminPasswordUpdated => 'Passord oppdatert';

  @override
  String get adminUserSettings => 'Brukerinnstillinger';

  @override
  String get adminLibraryAccess => 'Bibliotektilgang';

  @override
  String get adminEnableAllDevices => 'Aktiver tilgang til alle enheter';

  @override
  String get adminEnableAllChannels => 'Aktiver tilgang til alle kanaler';

  @override
  String get adminParentalControl => 'Foreldrekontroll';

  @override
  String get adminMaxParentalRating => 'Maksimal tillatt aldersgrense';

  @override
  String get adminMaxParentalRatingHint =>
      'Innhold med høyere aldersgrense skjules for denne brukeren.';

  @override
  String get adminParentalRatingNone => 'Ingen';

  @override
  String get adminBlockUnratedItems =>
      'Blokker elementer uten eller med ukjent aldersgrense';

  @override
  String get adminUnratedBook => 'Bøker';

  @override
  String get adminUnratedChannelContent => 'Kanaler';

  @override
  String get adminUnratedLiveTvChannel => 'Direktesendt TV';

  @override
  String get adminUnratedMovie => 'Filmer';

  @override
  String get adminUnratedMusic => 'Musikk';

  @override
  String get adminUnratedTrailer => 'Trailere';

  @override
  String get adminUnratedSeries => 'Serier';

  @override
  String get adminAccessSchedules => 'Tilgangstidsplaner';

  @override
  String get adminAccessSchedulesHint =>
      'Tillat tilgang bare i tidsrommene nedenfor. Tilgang er tillatt hele døgnet når ingen tidsplan er angitt.';

  @override
  String get adminAddSchedule => 'Legg til tidsplan';

  @override
  String get adminScheduleDay => 'Dag';

  @override
  String get adminScheduleStart => 'Start';

  @override
  String get adminScheduleEnd => 'Slutt';

  @override
  String get adminDayEveryday => 'Hver dag';

  @override
  String get adminDayWeekday => 'Ukedag';

  @override
  String get adminDayWeekend => 'Helg';

  @override
  String get adminDaySunday => 'Søndag';

  @override
  String get adminDayMonday => 'Mandag';

  @override
  String get adminDayTuesday => 'Tirsdag';

  @override
  String get adminDayWednesday => 'Onsdag';

  @override
  String get adminDayThursday => 'Torsdag';

  @override
  String get adminDayFriday => 'Fredag';

  @override
  String get adminDaySaturday => 'Lørdag';

  @override
  String get adminAllowedTags => 'Tillatte tagger';

  @override
  String get adminAllowedTagsHint =>
      'Bare innhold med disse taggene vises. La stå tomt for å tillate alt.';

  @override
  String get adminBlockedTags => 'Blokkerte tagger';

  @override
  String get adminBlockedTagsHint =>
      'Innhold med disse taggene skjules for denne brukeren.';

  @override
  String get adminAddTag => 'Legg til tagg';

  @override
  String get adminAuthProvider => 'Autentiseringsleverandør';

  @override
  String get adminPasswordResetProvider =>
      'Leverandør for tilbakestilling av passord';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maksimalt antall mislykkede påloggingsforsøk før utestenging';

  @override
  String get adminLoginAttemptsHint =>
      'Sett til 0 for standardverdien, eller -1 for å deaktivere utestenging.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay-tilgang';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Tillat å opprette og bli med i grupper';

  @override
  String get adminSyncPlayJoin => 'Tillat å bli med i grupper';

  @override
  String get adminSyncPlayNone => 'Ingen tilgang';

  @override
  String get adminContentDeletionFolders => 'Tillat sletting av innhold fra';

  @override
  String get adminResetPasswordWarning =>
      'Dette vil fjerne passordet. Brukeren vil kunne logge inn uten passord.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Serveren returnerte HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Er du sikker på at du vil slette $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Brukeren «$name» er slettet';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Kunne ikke slette brukeren: $error';
  }

  @override
  String get adminCreateApiKey => 'Opprett API-nøkkel';

  @override
  String get adminAppName => 'Appnavn';

  @override
  String get adminApiKeyCreated => 'API-nøkkel opprettet';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Nøkkelen ble opprettet. Serveren returnerte ikke tokenet. Sjekk server API-nøkler.';

  @override
  String get adminKeyCopied => 'Nøkkel kopiert til utklippstavlen';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Kunne ikke opprette nøkkelen: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Nøkkeltoken mangler fra serversvar';

  @override
  String get adminRevokeApiKey => 'Tilbakekall API-nøkkel';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Vil du oppheve nøkkelen for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-nøkkel er opphevet';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Kunne ikke oppheve nøkkelen: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Kunne ikke laste inn API-nøkler';

  @override
  String get adminApiKeysTitle => 'API-nøkler';

  @override
  String get adminCreateKey => 'Opprett nøkkel';

  @override
  String get adminNoApiKeys => 'Ingen API-nøkler funnet';

  @override
  String get adminUnknownApp => 'Ukjent app';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nOpprettet: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Opprett sikkerhetskopi';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Alltid inkludert';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Undertekster';

  @override
  String get adminBackupTrickplay => 'Trickplay-bilder';

  @override
  String get adminCreatingBackup => 'Oppretter sikkerhetskopi...';

  @override
  String get adminBackupCreated => 'Sikkerhetskopien ble opprettet';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Kunne ikke opprette sikkerhetskopien: $error';
  }

  @override
  String get adminBackupPathMissing => 'Backup-bane mangler i serversvar';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Kunne ikke laste inn manifestet: $error';
  }

  @override
  String get adminConfirmRestore => 'Bekreft gjenoppretting';

  @override
  String get adminRestoringBackup => 'Gjenoppretter sikkerhetskopien ...';

  @override
  String adminRestoreFailed(String error) {
    return 'Kunne ikke gjenopprette sikkerhetskopien: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Kunne ikke laste inn sikkerhetskopier';

  @override
  String get adminCreateBackup => 'Lag sikkerhetskopi';

  @override
  String get adminNoBackups => 'Ingen sikkerhetskopier funnet';

  @override
  String get adminViewDetails => 'Se detaljer';

  @override
  String get restore => 'Restaurere';

  @override
  String get adminLogsLoadFailed => 'Kunne ikke laste inn serverlogger';

  @override
  String get adminNoLogFiles => 'Ingen loggfiler funnet';

  @override
  String get adminLogCopied => 'Logg kopiert til utklippstavlen';

  @override
  String get adminSaveLogFile => 'Lagre loggfil';

  @override
  String adminSavedTo(String path) {
    return 'Lagret til $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Kunne ikke lagre filen: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Kunne ikke laste inn $fileName';
  }

  @override
  String get adminSearchInLog => 'Søk i logg';

  @override
  String get adminNoMatchingLines => 'Ingen samsvarende linjer';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Kunne ikke laste inn oppgavene: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Fant ingen planlagte oppgaver';

  @override
  String get adminNoTasksMatchFilter =>
      'Ingen oppgaver samsvarer med gjeldende filter';

  @override
  String adminTaskStartFailed(String error) {
    return 'Kunne ikke starte oppgaven: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Kunne ikke stoppe oppgaven: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Kunne ikke laste inn oppgaven: $error';
  }

  @override
  String get adminRunNow => 'Kjør nå';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Kunne ikke fjerne utløseren: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Kunne ikke legge til utløseren: $error';
  }

  @override
  String get adminLastExecution => 'Siste utførelse';

  @override
  String get adminTriggers => 'Utløsere';

  @override
  String get adminAddTrigger => 'Legg til trigger';

  @override
  String get adminNoTriggers => 'Ingen utløsere er konfigurert';

  @override
  String get adminTriggerType => 'Utløsertype';

  @override
  String get adminNoLimit => 'Ingen grense';

  @override
  String adminHours(String hours) {
    return '$hours time(r)';
  }

  @override
  String get adminDayOfWeek => 'ukedag';

  @override
  String get adminSearchPlugins => 'Søk i plugins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Kunne ikke slå tillegget av/på: $error';
  }

  @override
  String get adminUninstallPlugin => 'Avinstaller plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Er du sikker på at du vil avinstallere «$name»?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Kunne ikke avinstallere tillegget: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Kunne ikke installere pakken: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Kunne ikke installere oppdateringen: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Kunne ikke laste inn tilleggene: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Ingen plugins samsvarer med søket ditt';

  @override
  String get adminNoPluginsInstalled => 'Ingen plugins installert';

  @override
  String adminInstallUpdate(String version) {
    return 'Installer oppdatering (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Kunne ikke laste inn katalogen: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Ingen pakker samsvarer med søket ditt';

  @override
  String get adminNoPackagesAvailable => 'Ingen tilgjengelige pakker';

  @override
  String get adminExperimentalIntegration => 'Eksperimentell integrasjon';

  @override
  String get adminExperimentalWarning =>
      'Integrasjon av plugin-innstillinger er fortsatt eksperimentell. Det kan hende at enkelte innstillingssider ikke blir riktig gjengitt.';

  @override
  String get continueAction => 'Fortsette';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '«$name» fjernes etter at serveren startes på nytt';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Kunne ikke avinstallere: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Oppdaterer «$name» til v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Kunne ikke laste inn tillegget: $error';
  }

  @override
  String get adminPluginNotFound => 'Finner ikke plugin';

  @override
  String adminPluginVersion(String version) {
    return 'Versjon $version';
  }

  @override
  String get adminEnablePlugin => 'Aktiver plugin';

  @override
  String get adminPluginSettingsPage => 'Innstillingssiden for plugin';

  @override
  String get adminRevisionHistory => 'Revisjonshistorie';

  @override
  String get adminNoChangelog => 'Ingen endringslogg tilgjengelig.';

  @override
  String get adminRemoveRepository => 'Fjern repository';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Er du sikker på at du vil fjerne «$name»?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Kunne ikke lagre repositoriene: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Kunne ikke laste inn repositoriene: $error';
  }

  @override
  String get adminRepositoryNameHint => 'f.eks. Jellyfin Stall';

  @override
  String get adminRepositoryUrl => 'Repositorie-URL';

  @override
  String get adminAddEntry => 'Legg til oppføring';

  @override
  String get adminInvalidUrl => 'Ugyldig URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Kan ikke laste inn tilleggsinnstillingene: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Kunne ikke åpne $uri';
  }

  @override
  String get adminOpenInBrowser => 'Åpne i nettleseren';

  @override
  String get adminOpenExternally => 'Åpne eksternt';

  @override
  String get adminGeneralSettings => 'Generelle innstillinger';

  @override
  String get adminServerName => 'Servernavn';

  @override
  String get adminPreferredMetadataCountry => 'Foretrukket metadataland';

  @override
  String get adminCachePath => 'Bufferbane';

  @override
  String get adminMetadataPath => 'Metadatabane';

  @override
  String get adminLibraryScanConcurrency => 'Bibliotekskanning samtidig';

  @override
  String get adminParallelImageEncodingLimit =>
      'Grensen for koding av parallelle bilder';

  @override
  String get adminSlowResponseThreshold => 'Langsom responsterskel (ms)';

  @override
  String get adminBrandingLoadFailed =>
      'Kunne ikke laste inn merkevareinnstillinger';

  @override
  String get adminLoginDisclaimer => 'Ansvarsfraskrivelse for pålogging';

  @override
  String get adminLoginDisclaimerHint => 'HTML vist under påloggingsskjemaet';

  @override
  String get adminCustomCss => 'Egendefinert CSS';

  @override
  String get adminCustomCssHint =>
      'Egendefinert CSS brukt på nettgrensesnittet';

  @override
  String get adminEnableSplashScreen => 'Aktiver velkomstskjerm';

  @override
  String get adminStreamingLoadFailed =>
      'Kunne ikke laste inn strømmeinnstillinger';

  @override
  String get adminStreamingDescription =>
      'Angi globale bithastighetsgrenser for strømming for eksterne tilkoblinger.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ekstern klientbithastighetsgrense (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'La stå tomt eller 0 for ubegrenset';

  @override
  String get adminPlaybackLoadFailed =>
      'Kunne ikke laste inn avspillingsinnstillinger';

  @override
  String get adminHardwareAcceleration => 'Maskinvareakselerasjon';

  @override
  String get adminVaapiDevice => 'VA-API-enhet';

  @override
  String get adminEnableHardwareEncoding => 'Aktiver maskinvarekoding';

  @override
  String get adminEnableHardwareDecoding => 'Aktiver maskinvaredekoding for:';

  @override
  String get adminEncodingThreads => 'Koding av tråder';

  @override
  String get adminAutomatic => '0 = automatisk';

  @override
  String get adminTranscodingTempPath => 'Transkoding temp bane';

  @override
  String get adminEnableFallbackFont => 'Aktiver reservefont';

  @override
  String get adminFallbackFontPath => 'Reserve skriftbane';

  @override
  String get adminAllowSegmentDeletion => 'Tillat sletting av segmenter';

  @override
  String get adminSegmentKeepSeconds => 'Segmenthold (sekunder)';

  @override
  String get adminThrottleBuffering => 'Gassbuffring';

  @override
  String get adminTrickplayLoadFailed =>
      'Kunne ikke laste inn trickplay-innstillinger';

  @override
  String get adminEnableHardwareAcceleration =>
      'Aktiver maskinvareakselerasjon';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Aktiver uttrekking av kun nøkkelramme';

  @override
  String get adminKeyFrameSubtitle => 'Raskere, men lavere nøyaktighet';

  @override
  String get adminScanBehavior => 'Skanneadferd';

  @override
  String get adminProcessPriority => 'Prosessprioritet';

  @override
  String get adminImageSettings => 'Bildeinnstillinger';

  @override
  String get adminIntervalMs => 'Intervall (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Hvor ofte du skal ta bilder';

  @override
  String get adminWidthResolutions => 'Breddeoppløsninger';

  @override
  String get adminTileWidth => 'Flisbredde';

  @override
  String get adminTileHeight => 'Flishøyde';

  @override
  String get adminQualitySubtitle =>
      'Lavere verdier = bedre kvalitet, større filer';

  @override
  String get adminProcessThreads => 'Behandle tråder';

  @override
  String get adminResumeLoadFailed => 'Kunne ikke laste inn CV-innstillingene';

  @override
  String get adminResumeDescription =>
      'Konfigurer når innhold skal merkes som delvis avspilt eller fullstendig avspilt.';

  @override
  String get adminMinResumePercentage => 'Minste CV-prosent';

  @override
  String get adminMinResumeSubtitle =>
      'Innhold må spilles over denne prosentandelen for å lagre fremdrift';

  @override
  String get adminMaxResumePercentage => 'Maksimal gjenoppta prosentandel';

  @override
  String get adminMaxResumeSubtitle =>
      'Innhold anses som fullt spilt etter denne prosentandelen';

  @override
  String get adminMinResumeDuration => 'Minimum gjenoppta varighet (sekunder)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Elementer som er kortere enn dette kan ikke gjenopptas';

  @override
  String get adminMinAudiobookResume =>
      'Minimumsprosent for gjenopptakelse av lydbok';

  @override
  String get adminMaxAudiobookResume =>
      'Maksimal gjenopptakelsesprosent for lydbok';

  @override
  String get adminNetworkingLoadFailed =>
      'Kunne ikke laste inn nettverksinnstillinger';

  @override
  String get adminNetworkingWarning =>
      'Endringer i nettverksinnstillinger kan kreve omstart av serveren.';

  @override
  String get adminEnableRemoteAccess => 'Aktiver ekstern tilgang';

  @override
  String get ports => 'Havner';

  @override
  String get adminHttpPort => 'HTTP-port';

  @override
  String get adminHttpsPort => 'HTTPS-port';

  @override
  String get adminPublicHttpsPort => 'Offentlig HTTPS-port';

  @override
  String get adminBaseUrl => 'Base-URL';

  @override
  String get adminBaseUrlHint => 'f.eks. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Aktiver HTTPS';

  @override
  String get adminLocalNetwork => 'Lokalt nettverk';

  @override
  String get adminLocalNetworkAddresses => 'Lokale nettverksadresser';

  @override
  String get adminKnownProxies => 'Kjente fullmektiger';

  @override
  String get adminRemoteIpFilter => 'Eksternt IP-filter';

  @override
  String get adminRemoteIpFilterEntries => 'Eksternt IP-filter';

  @override
  String get adminCertificatePath => 'Sertifikatbane';

  @override
  String get whitelist => 'Hviteliste';

  @override
  String get blacklist => 'Svarteliste';

  @override
  String get notSet => 'Ikke satt';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Kunne ikke laste inn metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Oppdater metadata';

  @override
  String get recursive => 'Rekursivt';

  @override
  String get adminReplaceAllMetadata => 'Erstatt alle metadata';

  @override
  String get adminMetadataRefreshRequested =>
      'Forespørsel om oppdatering av metadata';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Kunne ikke oppdatere metadata: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Ingen eksterne treff funnet';

  @override
  String get adminRemoteResults => 'Eksterne resultater';

  @override
  String get adminRemoteMetadataApplied => 'Eksterne metadata er brukt';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Eksternt søk mislyktes: $error';
  }

  @override
  String get adminUpdateContentType => 'Oppdater innholdstype';

  @override
  String get adminContentType => 'Innholdstype';

  @override
  String get adminContentTypeUpdated => 'Innholdstype oppdatert';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Kunne ikke oppdatere innholdstypen: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Kunne ikke laste inn metadataredigering';

  @override
  String get adminNoPeopleEntries => 'Ingen personer oppføringer';

  @override
  String get adminNoExternalIds => 'Ingen eksterne ID-er tilgjengelig';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType-bildet er oppdatert';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Kunne ikke laste ned bildet: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Bildeformat som ikke støttes';

  @override
  String get adminImageReadFailed => 'Kunne ikke lese det valgte bildet';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType-bildet er lastet opp';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Kunne ikke laste opp bildet: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Slett $imageType-bildet';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType-bildet er slettet';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Kunne ikke slette bildet: $error';
  }

  @override
  String get adminAllProviders => 'Alle tilbydere';

  @override
  String get adminNoRemoteImages => 'Ingen eksterne bilder funnet';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Søk etter tunere mislyktes: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U-tuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Fil eller URL';

  @override
  String get adminTunerIpAddress => 'Tunerens IP-adresse';

  @override
  String get adminTunerFriendlyName => 'Visningsnavn';

  @override
  String get adminTunerUserAgent => 'Brukeragent';

  @override
  String get adminTunerCount => 'Grense for samtidige tilkoblinger';

  @override
  String get adminTunerCountHelp =>
      'Maksimalt antall strømmer tuneren tillater samtidig. Sett til 0 for ubegrenset.';

  @override
  String get adminTunerFallbackBitrate => 'Reserve for maks strømmebitrate';

  @override
  String get adminTunerImportFavoritesOnly => 'Importer bare favorittkanaler';

  @override
  String get adminTunerAllowHwTranscoding => 'Tillat maskinvareomkoding';

  @override
  String get adminTunerAllowFmp4 => 'Tillat fMP4-omkodingscontainer';

  @override
  String get adminTunerAllowStreamSharing => 'Tillat strømdeling';

  @override
  String get adminTunerEnableStreamLooping => 'Aktiver strømsløyfe';

  @override
  String get adminTunerIgnoreDts => 'Ignorer DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Les inndata med opprinnelig bildefrekvens';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Fil eller URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmprefiks';

  @override
  String get adminXmltvMovieCategories => 'Filmkategorier';

  @override
  String get adminXmltvCategoriesHelp =>
      'Skill flere kategorier med en loddrett strek.';

  @override
  String get adminXmltvKidsCategories => 'Barnekategorier';

  @override
  String get adminXmltvNewsCategories => 'Nyhetskategorier';

  @override
  String get adminXmltvSportsCategories => 'Sportskategorier';

  @override
  String get adminSdUsername => 'Brukernavn';

  @override
  String get adminSdPassword => 'Passord';

  @override
  String get adminSdCountry => 'Land';

  @override
  String get adminSdCountrySelect => 'Velg et land';

  @override
  String get adminSdPostalCode => 'Postnummer';

  @override
  String get adminEnableAllTuners => 'Aktiver alle tunere';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Kunne ikke fjerne tuneren: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Kunne ikke fjerne leverandøren: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Serieopptaksbane';

  @override
  String get adminMovieRecordingPath => 'Bane for filmopptak';

  @override
  String get adminGuideDaysAuto => 'Automatisk';

  @override
  String get adminRecordingPostProcessor => 'Bane til etterbehandlingsprogram';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumenter for etterbehandler';

  @override
  String get adminSaveRecordingNfo => 'Lagre NFO-metadata for opptak';

  @override
  String get adminSaveRecordingImages => 'Lagre bilder for opptak';

  @override
  String get adminLiveTvSectionPaths => 'Opptaksbaner';

  @override
  String get adminLiveTvSectionPostProcessing => 'Etterbehandling';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Kunne ikke lagre innstillingene: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Kunne ikke laste direkte TV-administrasjon';

  @override
  String get adminTunerDevices => 'Tuner-enheter';

  @override
  String get adminNoTunerHosts => 'Ingen tuner-verter konfigurert';

  @override
  String get adminGuideProviders => 'Veiledningsleverandører';

  @override
  String get adminGuideRefreshStarted => 'Oppdatering av guidedata er startet';

  @override
  String get adminGuideRefreshUnavailable =>
      'Oppgaven for oppdatering av guiden er ikke tilgjengelig på denne serveren.';

  @override
  String get adminNoListingProviders =>
      'Ingen oppføringsleverandører er konfigurert';

  @override
  String get adminSettingsSaved => 'Innstillinger lagret';

  @override
  String get adminBackupsNotAvailable =>
      'Sikkerhetskopier er ikke tilgjengelig på denne serverbyggingen.';

  @override
  String get adminRestoreWarning1 =>
      'Gjenoppretting vil erstatte ALLE gjeldende serverdata med sikkerhetskopidataene.';

  @override
  String get adminRestoreWarning2 =>
      'Gjeldende serverinnstillinger, brukere og bibliotekdata vil bli overskrevet.';

  @override
  String get adminRestoreWarning3 =>
      'Serveren vil starte på nytt etter gjenoppretting.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Vil du gjenopprette sikkerhetskopien $name nå?';
  }

  @override
  String get adminBackupsTitle => 'Sikkerhetskopier';

  @override
  String get adminUnknownDate => 'Ukjent dato';

  @override
  String get adminUnnamedBackup => 'Sikkerhetskopiering uten navn';

  @override
  String get adminApply => 'Bruk';

  @override
  String get adminLogsTitle => 'Serverlogger';

  @override
  String get adminLogsNewestFirst => 'Nyeste først';

  @override
  String get adminLogsOldestFirst => 'Eldste først';

  @override
  String get adminLogsJustNow => 'Akkurat nå';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes min siden';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours t siden';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days d siden';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Kunne ikke laste inn $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count treff';
  }

  @override
  String get adminLogViewerNoMatches => 'Ingen samsvarende linjer';

  @override
  String get adminMetadataEditorTitle => 'Metadataredigerer';

  @override
  String get adminMetadataIdentify => 'Identifiser';

  @override
  String get adminMetadataType => 'Type';

  @override
  String get adminMetadataDetails => 'Detaljer';

  @override
  String get adminMetadataExternalIds => 'Eksterne IDer';

  @override
  String get adminMetadataImages => 'Bilder';

  @override
  String get adminMetadataFieldTitle => 'Tittel';

  @override
  String get adminMetadataFieldSortTitle => 'Sorter tittel';

  @override
  String get adminMetadataFieldOriginalTitle => 'Originaltittel';

  @override
  String get adminMetadataFieldPremiereDate => 'Premieredato (ÅÅÅÅ-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Sluttdato (ÅÅÅÅ-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Produksjonsår';

  @override
  String get adminMetadataFieldOfficialRating => 'Offisiell vurdering';

  @override
  String get adminMetadataFieldCommunityRating => 'Samfunnsvurdering';

  @override
  String get adminMetadataFieldCriticRating => 'Kritikervurdering';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Slagord';

  @override
  String get adminMetadataFieldOverview => 'Oversikt';

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
  String get adminMetadataGenres => 'Sjangere';

  @override
  String get adminMetadataTags => 'Tagger';

  @override
  String get adminMetadataStudios => 'Studioer';

  @override
  String get adminMetadataPeople => 'Mennesker';

  @override
  String get adminMetadataAddGenre => 'Legg til sjanger';

  @override
  String get adminMetadataAddTag => 'Legg til tag';

  @override
  String get adminMetadataAddStudio => 'Legg til studio';

  @override
  String get adminMetadataAddPerson => 'Legg til person';

  @override
  String get adminMetadataEditPerson => 'Rediger person';

  @override
  String get adminMetadataRole => 'Rolle';

  @override
  String get adminMetadataImagePrimary => 'Primær';

  @override
  String get adminMetadataImageBackdrop => 'Bakteppe';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Tommel';

  @override
  String get adminMetadataProvider => 'Leverandør';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType-bildet er oppdatert';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType-bildet er lastet opp';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType-bildet er slettet';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Kunne ikke laste ned bildet: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Kunne ikke lese det valgte bildet';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Kunne ikke laste opp bildet: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Slett $imageType-bildet';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Dette fjerner det gjeldende bildet fra elementet.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Kunne ikke slette bildet: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Velg $imageType-bilde';
  }

  @override
  String get adminMetadataUpload => 'Last opp';

  @override
  String get adminMetadataUpdate => 'Oppdater';

  @override
  String get adminMetadataRemoteImage => 'Eksternt bilde';

  @override
  String get adminPluginsInstalled => 'Installert';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktiv';

  @override
  String get adminPluginsRestart => 'Start på nytt';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Ingen plugins samsvarer med søket ditt';

  @override
  String get adminPluginsNoneInstalled => 'Ingen plugins installert';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Oppdatering tilgjengelig: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Oppdatering tilgjengelig';

  @override
  String get adminPluginsPendingRemoval => 'Venter på fjerning etter omstart';

  @override
  String get adminPluginsChangesPending => 'Endringer som venter på omstart';

  @override
  String get adminPluginsEnable => 'Aktiver';

  @override
  String get adminPluginsDisable => 'Deaktiver';

  @override
  String get adminPluginsInstallUpdate => 'Installer oppdatering';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Installer oppdatering (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ingen pakker samsvarer med søket ditt';

  @override
  String get adminPluginsCatalogEmpty => 'Ingen tilgjengelige pakker';

  @override
  String adminPluginsInstalling(String name) {
    return '«$name» installeres...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentell integrasjon';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integrasjon av plugin-innstillinger er fortsatt eksperimentell. Noen felt eller oppsett kan ikke gjengis riktig ennå.';

  @override
  String get adminPluginDetailToggle404 =>
      'Kunne ikke bytte plugin. Serveren kunne ikke finne denne plugin-versjonen. Prøv å oppdatere plugins, og prøv deretter på nytt.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Kunne ikke bytte plugin. Vennligst sjekk serverloggene for detaljer.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name-innstillinger';
  }

  @override
  String get adminPluginDetailDetails => 'Detaljer';

  @override
  String get adminPluginDetailDeveloper => 'Utvikler';

  @override
  String get adminPluginDetailRepository => 'Depot';

  @override
  String get adminPluginDetailBundled => 'Buntet';

  @override
  String get adminPluginDetailEnablePlugin => 'Aktiver plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'En omstart av serveren er nødvendig for at endringer skal tre i kraft.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Denne plugin-en vil bli fjernet etter omstart av serveren.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Denne plugin-en har fungert feil og fungerer kanskje ikke som den skal.';

  @override
  String get adminPluginDetailNotSupported =>
      'Denne plugin-modulen støttes ikke av den gjeldende serverversjonen.';

  @override
  String get adminPluginDetailSuperseded =>
      'Denne plugin-en har blitt erstattet av en nyere versjon.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Kunne ikke laste inn repositoriene: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Fjern repository';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Er du sikker på at du vil fjerne «$name»?';
  }

  @override
  String get adminReposRemove => 'Fjern';

  @override
  String adminReposSaveFailed(String error) {
    return 'Kunne ikke lagre repositoriene: $error';
  }

  @override
  String get adminReposEmpty => 'Ingen repositories konfigurert';

  @override
  String get adminReposEmptySubtitle =>
      'Legg til et depot for å bla gjennom tilgjengelige plugins';

  @override
  String get adminReposUnnamed => '(uten navn)';

  @override
  String get adminReposEditTitle => 'Rediger depot';

  @override
  String get adminReposAddTitle => 'Legg til arkiv';

  @override
  String get adminReposUrl => 'Repositorie-URL';

  @override
  String get adminReposNameHint => 'f.eks. Jellyfin Stall';

  @override
  String get adminPluginSettingsInvalidUrl => 'Ugyldig URL';

  @override
  String get adminGeneralSettingsTitle => 'Generelle innstillinger';

  @override
  String get adminGeneralMetadataLanguage => 'Foretrukket metadataspråk';

  @override
  String get adminGeneralMetadataLanguageHint => 'f.eks. no, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Foretrukket metadataland';

  @override
  String get adminGeneralMetadataCountryHint => 'f.eks. USA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => 'Bibliotekskanning samtidig';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Grensen for koding av parallelle bilder';

  @override
  String get adminUnknownError => 'Ukjent feil';

  @override
  String get adminBrowse => 'Bla gjennom';

  @override
  String get adminCloseBrowser => 'Lukk nettleseren';

  @override
  String get adminNetworkingTitle => 'Nettverk';

  @override
  String get adminNetworkingRestartWarning =>
      'Endringer i nettverksinnstillinger kan kreve omstart av serveren.';

  @override
  String get adminNetworkingEnableHttps => 'Aktiver HTTPS';

  @override
  String get adminNetworkingAddressHint => 'f.eks. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Kjente fullmektiger';

  @override
  String get adminNetworkingProxyHint => 'f.eks. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Hviteliste';

  @override
  String get adminNetworkingBlacklist => 'Svarteliste';

  @override
  String get adminNetworkingAddEntry => 'Legg til oppføring';

  @override
  String get adminBrandingTitle => 'Merkevarebygging';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Ansvarsfraskrivelse for pålogging';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML vist under påloggingsskjemaet';

  @override
  String get adminBrandingCustomCss => 'Egendefinert CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Egendefinert CSS brukt på nettgrensesnittet';

  @override
  String get adminBrandingEnableSplash => 'Aktiver velkomstskjerm';

  @override
  String get adminBrandingSplashUpload => 'Last opp bilde';

  @override
  String get adminBrandingSplashUploaded => 'Velkomstskjermen er oppdatert';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Kunne ikke laste opp velkomstskjermen';

  @override
  String get adminBrandingSplashDeleted => 'Velkomstskjermen er fjernet';

  @override
  String get adminBrandingNoSplash => 'Ingen egendefinert velkomstskjerm';

  @override
  String get adminPlaybackHwAccel => 'Maskinvareakselerasjon';

  @override
  String get adminPlaybackHwAccelLabel => 'Maskinvareakselerasjon';

  @override
  String get adminPlaybackEnableHwEncoding => 'Aktiver maskinvarekoding';

  @override
  String get adminPlaybackQsvDevice => 'QSV-enhet';

  @override
  String get adminPlaybackEnhancedNvdec => 'Aktiver forbedret NVDEC-dekoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Foretrekk systemets egen maskinvaredekoder';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bits HEVC-dekoding';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bits VP9-dekoding';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bits dekoding';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bits dekoding';

  @override
  String get adminPlaybackHwEncodingSection => 'Maskinvarekoding';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Tillat HEVC-koding';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Tillat AV1-koding';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Aktiver Intels lavenergi-H.264-koder';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Aktiver Intels lavenergi-HEVC-koder';

  @override
  String get adminPlaybackToneMapping => 'Tone mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Aktiver tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Aktiver VPP tone mapping';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Aktiver VideoToolbox tone mapping';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algoritme for tone mapping';

  @override
  String get adminPlaybackTonemappingMode => 'Modus for tone mapping';

  @override
  String get adminPlaybackTonemappingRange => 'Område for tone mapping';

  @override
  String get adminPlaybackTonemappingDesat => 'Avmetning for tone mapping';

  @override
  String get adminPlaybackTonemappingPeak => 'Topp for tone mapping';

  @override
  String get adminPlaybackTonemappingParam => 'Parameter for tone mapping';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Lysstyrke for VPP tone mapping';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Kontrast for VPP tone mapping';

  @override
  String get adminPlaybackEncoderPreset => 'Forhåndsinnstilling for koder';

  @override
  String get adminPlaybackH264Crf => 'CRF for H.264-koding';

  @override
  String get adminPlaybackH265Crf => 'CRF for H.265-koding (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deinterlace-metode';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Doble bildefrekvensen ved deinterlacing';

  @override
  String get adminPlaybackAudioSection => 'Lyd';

  @override
  String get adminPlaybackEnableAudioVbr => 'Aktiver VBR-koding for lyd';

  @override
  String get adminPlaybackDownmixBoost => 'Forsterkning ved nedmiksing av lyd';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritme for stereonedmiksing';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Maks størrelse på muxekøen';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Koding';

  @override
  String get adminPlaybackEncodingThreads => 'Koding av tråder';

  @override
  String get adminPlaybackFallbackFont => 'Aktiver reservefont';

  @override
  String get adminPlaybackFallbackFontPath => 'Reserve skriftbane';

  @override
  String get adminPlaybackStreaming => 'Strømming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Lydbøker';

  @override
  String get adminStreamingBitrateLimit =>
      'Ekstern klientbithastighetsgrense (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'La stå tomt eller 0 for ubegrenset';

  @override
  String get adminTrickplayHwAccel => 'Aktiver maskinvareakselerasjon';

  @override
  String get adminTrickplayHwEncoding => 'Aktiver maskinvarekoding';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Aktiver uttrekking av kun nøkkelramme';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Raskere, men lavere nøyaktighet';

  @override
  String get adminTrickplayNonBlocking => 'Ikke-blokkerende';

  @override
  String get adminTrickplayBlocking => 'Blokkering';

  @override
  String get adminTrickplayPriorityHigh => 'Høy';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Over Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Under Normal';

  @override
  String get adminTrickplayPriorityIdle => 'Uvirksom';

  @override
  String get adminTrickplayImageSettings => 'Bildeinnstillinger';

  @override
  String get adminTrickplayInterval => 'Intervall (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Hvor ofte du skal ta bilder';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Kommaseparerte pikselbredder (f.eks. 320)';

  @override
  String get adminTrickplayQuality => 'Kvalitet';

  @override
  String get adminTrickplayQScale => 'Kvalitetsskala';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Lavere verdier = bedre kvalitet, større filer';

  @override
  String get adminTrickplayJpegQuality => 'JPEG-kvalitet';

  @override
  String get adminTrickplayProcessing => 'Behandling';

  @override
  String get adminTasksEmpty => 'Fant ingen planlagte oppgaver';

  @override
  String get adminTasksNoFilterMatch =>
      'Ingen oppgaver samsvarer med gjeldende filter';

  @override
  String get adminTaskCancelling => 'Avbryter …';

  @override
  String get adminTaskRunning => 'Kjører...';

  @override
  String get adminTaskNeverRun => 'Aldri løp';

  @override
  String get adminTaskStop => 'Stopp';

  @override
  String get adminRunningTasks => 'Oppgaver som kjører';

  @override
  String get adminTaskRun => 'Løp';

  @override
  String get adminTaskDetailLastExecution => 'Siste utførelse';

  @override
  String get adminTaskDetailStarted => 'Startet';

  @override
  String get adminTaskDetailEnded => 'Avsluttet';

  @override
  String get adminTaskDetailDuration => 'Varighet';

  @override
  String get adminTaskDetailErrorLabel => 'Feil:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Daglig kl. $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Hver $day kl. $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Ved oppstart av applikasjon';

  @override
  String get adminTaskTriggerTypeDaily => 'Daglig';

  @override
  String get adminTaskTriggerTypeWeekly => 'Ukentlig';

  @override
  String get adminTaskTriggerTypeInterval => 'På et intervall';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervall';

  @override
  String get adminTaskTriggerEveryHour => 'Hver time';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count timer',
      one: '1 time',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Tid';

  @override
  String get adminActivityJustNow => 'Akkurat nå';

  @override
  String get adminActivityLastHour => 'Siste time';

  @override
  String get adminActivityToday => 'I dag';

  @override
  String get adminActivityYesterday => 'I går';

  @override
  String get adminActivityOlder => 'Eldre';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days d siden';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours t siden';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes min siden';
  }

  @override
  String get adminActivityNow => 'nå';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours t';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days d';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigurer trickplay-bildegenerering for forhåndsvisningsminiatyrbilder.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Offentlig HTTPS-port';

  @override
  String get adminNetworkingBaseUrl => 'Base-URL';

  @override
  String get adminNetworkingBaseUrlHint => 'f.eks. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Offentlig HTTP-port';

  @override
  String get adminNetworkingRequireHttps => 'Krev HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Omdiriger alle eksterne forespørsler til HTTPS. Har ingen effekt hvis serveren ikke har et gyldig sertifikat.';

  @override
  String get adminNetworkingCertPassword => 'Sertifikatpassord';

  @override
  String get adminNetworkingEnableIpv4 => 'Aktiver IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Aktiver IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'LAN-nettverk';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Eksternt IP-filter';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API-enhet';

  @override
  String get adminPlaybackAutomatic => '0 = automatisk';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transkoding temp bane';

  @override
  String get adminPlaybackSegmentDeletion => 'Tillat sletting av segmenter';

  @override
  String get adminPlaybackSegmentKeep => 'Segmenthold (sekunder)';

  @override
  String get adminPlaybackThrottleBuffering => 'Gassbuffring';

  @override
  String get adminPlaybackThrottleDelay =>
      'Forsinkelse for struping (sekunder)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Tillat uttrekking av undertekster underveis';

  @override
  String get adminResumeMinPct => 'Minste CV-prosent';

  @override
  String get adminResumeMinPctSubtitle =>
      'Innhold må spilles over denne prosentandelen for å lagre fremdrift';

  @override
  String get adminResumeMaxPct => 'Maksimal gjenoppta prosentandel';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Innhold anses som fullt spilt etter denne prosentandelen';

  @override
  String get adminResumeMinDuration => 'Minimum gjenoppta varighet (sekunder)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Elementer som er kortere enn dette kan ikke gjenopptas';

  @override
  String get adminTrickplayScanBehavior => 'Skanneadferd';

  @override
  String get adminTrickplayProcessPriority => 'Prosessprioritet';

  @override
  String get adminTrickplayTileWidth => 'Flisbredde';

  @override
  String get adminTrickplayTileHeight => 'Flishøyde';

  @override
  String get adminTrickplayProcessThreads => 'Behandle tråder';

  @override
  String get adminTrickplayWidthResolutions => 'Breddeoppløsninger';

  @override
  String get adminMetadataDefault => 'Misligholde';

  @override
  String get adminMetadataContentTypeUpdated => 'Innholdstype oppdatert';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Kunne ikke oppdatere innholdstypen: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Langsom responsterskel (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Aktiver advarsler om trege svar';

  @override
  String get adminGeneralQuickConnect => 'Aktiver hurtigkobling';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Baner';

  @override
  String get adminGeneralSectionPerformance => 'Ytelse';

  @override
  String get adminGeneralCachePath => 'Bufferbane';

  @override
  String get adminGeneralMetadataPath => 'Metadatabane';

  @override
  String get adminGeneralServerName => 'Servernavn';

  @override
  String get adminGeneralDisplayLanguage => 'Foretrukket visningsspråk';

  @override
  String get adminSettingsLoadFailed => 'Kunne ikke laste inn innstillingene';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Kunne ikke oppdatere tilordningene: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Tidsgrense: $duration';
  }

  @override
  String get folders => 'Mapper';

  @override
  String get libraries => 'Biblioteker';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay deaktivert';

  @override
  String get syncPlayDisabledMessage =>
      'Aktiver SyncPlay i Innstillinger for å bruke synkronisert avspilling.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Server støttes ikke';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay krever en Jellyfin-server. Den gjeldende serveren støtter det ikke.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay-gruppe';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay-gruppe';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# deltakere',
      one: '# deltaker',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignorer vent';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Ikke hold gruppen oppe mens denne enheten bufrer';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Fortsett lokalt uten å vente på trege medlemmer';

  @override
  String get syncPlayRepeat => 'Gjenta';

  @override
  String get syncPlayRepeatOne => 'En';

  @override
  String get syncPlayShuffleModeShuffled => 'Blandet';

  @override
  String get syncPlayShuffleModeSorted => 'Sortert';

  @override
  String get syncPlaySyncCurrentQueue => 'Synkroniser gjeldende avspillingskø';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Bytt ut gruppekøen med det som spilles lokalt';

  @override
  String get syncPlayLeaveGroup => 'Forlat gruppen';

  @override
  String get syncPlayGroupQueue => 'Gruppekø';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Element $index';
  }

  @override
  String get syncPlayPlayNow => 'Spill nå';

  @override
  String get syncPlayCreateNewGroup => 'Opprett en ny gruppe';

  @override
  String get syncPlayGroupName => 'Gruppenavn';

  @override
  String get syncPlayDefaultGroupName => 'Min SyncPlay-gruppe';

  @override
  String get syncPlayCreateGroup => 'Opprett gruppe';

  @override
  String get syncPlayAvailableGroups => 'Tilgjengelige grupper';

  @override
  String get syncPlayNoGroupsAvailable => 'Ingen grupper tilgjengelig';

  @override
  String get syncPlayJoinGroupQuestion => 'Bli med i SyncPlay-gruppen?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Å bli med i en SyncPlay-gruppe kan erstatte gjeldende avspillingskø. Fortsette?';

  @override
  String get syncPlayJoin => 'Bli med';

  @override
  String get syncPlayStateIdle => 'Uvirksom';

  @override
  String get syncPlayStateWaiting => 'Venter';

  @override
  String get syncPlayStatePaused => 'Pause';

  @override
  String get syncPlayStatePlaying => 'Spiller';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName ble med i SyncPlay-gruppen';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName forlot SyncPlay-gruppen';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-tilgang nektet';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Du har ikke tilgang til ett eller flere elementer i denne SyncPlay-gruppen. Be gruppeeieren om å bekrefte bibliotektillatelser eller velge en annen kø.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synkroniserer avspilling til $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Talesøk er utilgjengelig.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct-avspilling mislyktes';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Direkte avspilling kunne ikke starte for denne Dolby Vision-strømmen. Prøve å bruke servertranscode på nytt?';

  @override
  String get retryWithTranscode => 'Prøv på nytt med transkoding';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision støttes ikke';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Denne enheten kan ikke dekode Dolby Vision-innhold direkte. Bruk HDR10 reserve- eller be om serveromkoding.';

  @override
  String get rememberMyChoice => 'Husk valget mitt';

  @override
  String get playHdr10Fallback => 'Spill HDR10 reserve';

  @override
  String get requestTranscode => 'Be om omkoding';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# rader oppdaget',
      one: '# rad oppdaget',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Se alle';

  @override
  String get noItems => 'Ingen varer';

  @override
  String get switchUser => 'Bytt bruker';

  @override
  String get remoteControl => 'Fjernkontroll';

  @override
  String get mediaBarLoading => 'Laster medielinje ...';

  @override
  String get mediaBarError => 'Mediefeltet kunne ikke lastes inn';

  @override
  String get offlineServerUnavailable =>
      'Koblet til internett, men gjeldende server er utilgjengelig.';

  @override
  String get offlineNoInternet =>
      'Du er frakoblet. Kun nedlastet innhold er tilgjengelig.';

  @override
  String get offlineFileNotAvailable => 'Filen er ikke tilgjengelig';

  @override
  String get offlineSwitchServer => 'Bytt server';

  @override
  String get offlineSavedMedia => 'Lagrede medier';

  @override
  String get offlineBannerTitle => 'Du er frakoblet';

  @override
  String get offlineBannerSubtitle => 'Viser nedlastingene dine';

  @override
  String get serverUnreachableBannerTitle => 'Får ikke kontakt med serveren';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Spiller av fra nedlastinger til den er tilbake';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Fjernavspilling';

  @override
  String castControlFailed(String error) {
    return 'Cast-kontrollen mislyktes: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind-kontroller';
  }

  @override
  String get castDeviceVolume => 'Enhetsvolum';

  @override
  String get castVolumeUnavailable => 'Utilgjengelig';

  @override
  String castStopKind(String kind) {
    return 'Stopp $kind';
  }

  @override
  String get audioLabel => 'Lyd';

  @override
  String get subtitlesLabel => 'Undertekster';

  @override
  String get pinConfirmTitle => 'Bekreft PIN';

  @override
  String get pinSetTitle => 'Angi PIN-kode';

  @override
  String get pinEnterTitle => 'Skriv inn PIN';

  @override
  String get pinReenterToConfirm =>
      'Skriv inn PIN-koden på nytt for å bekrefte';

  @override
  String pinEnterNDigit(int length) {
    return 'Angi en $length-sifret PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Angi din $length-sifrede PIN';
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
  String get pinIncorrect => 'Feil PIN-kode';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN-kodene stemmer ikke overens';

  @override
  String get pinForgot => 'Glemt PIN-koden?';

  @override
  String get pinClear => 'Tøm';

  @override
  String get pinBackspace => 'Tilbake';

  @override
  String get quickConnectAuthorized =>
      'Hurtigkoblingsforespørselen er autorisert.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Hurtigkoblingskoden er ugyldig eller utløpt.';

  @override
  String get quickConnectNotSupported =>
      'Hurtigkobling støttes ikke på denne serveren.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Kunne ikke autorisere hurtigkoblingskoden.';

  @override
  String get quickConnectDisabled =>
      'Hurtigkobling er deaktivert på denne serveren.';

  @override
  String get quickConnectForbidden =>
      'Kontoen din kan ikke autorisere denne hurtigkoblingsforespørselen.';

  @override
  String get quickConnectNotFound =>
      'Hurtigkoblingskoden ble ikke funnet. Prøv en ny kode.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Hurtigkobling mislyktes: $message';
  }

  @override
  String get quickConnectEnterCode => 'Skriv inn kode';

  @override
  String get quickConnectAuthorize => 'Autorisere';

  @override
  String remoteCommandFailed(String error) {
    return 'Kommandoen mislyktes: $error';
  }

  @override
  String get remoteControlTitle => 'Fjernkontroll';

  @override
  String get remoteFailedToLoadSessions => 'Kunne ikke laste inn økter';

  @override
  String get remoteNoSessions => 'Ingen kontrollerbare økter';

  @override
  String get remoteStartPlayback => 'Start avspilling på en annen enhet';

  @override
  String get unknownUser => 'Ukjent';

  @override
  String get unknownItem => 'Ukjent';

  @override
  String get remoteNothingPlaying => 'Ingenting spiller på denne økten';

  @override
  String get castingStarted => 'Casting startet på valgt enhet';

  @override
  String castingFailed(String error) {
    return 'Kunne ikke starte casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Ingen eksterne avspillingsenheter tilgjengelig.';

  @override
  String get noRemoteDevicesIos =>
      'Ingen eksterne avspillingsenheter tilgjengelig.\n\nPå iOS kan AirPlay-mål være utilgjengelige i simulatoren.';

  @override
  String get trackActionPlayNext => 'Spill Neste';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Legg til i kø';

  @override
  String get trackActionAddToPlaylist => 'Legg til spilleliste';

  @override
  String get trackActionCancelDownload => 'Avbryt nedlasting';

  @override
  String get trackActionDeleteFromPlaylist => 'Slett fra spilleliste';

  @override
  String get trackActionMoveUp => 'Flytt opp';

  @override
  String get trackActionMoveDown => 'Flytt ned';

  @override
  String get trackActionRemoveFromFavorites => 'Fjern fra favoritter';

  @override
  String get trackActionAddToFavorites => 'Legg til i favoritter';

  @override
  String get trackActionGoToAlbum => 'Gå til Album';

  @override
  String get trackActionGoToArtist => 'Gå til artist';

  @override
  String trackActionDownloading(String name) {
    return 'Laster ned $name...';
  }

  @override
  String get trackActionDeletedFile => 'Slettet nedlastet fil';

  @override
  String get trackActionDeleteFileFailed => 'Kunne ikke slette nedlastet fil';

  @override
  String get shuffleBy => 'Bland av';

  @override
  String get shuffleSelectLibrary => 'Velg Bibliotek';

  @override
  String get shuffleSelectGenre => 'Velg sjanger';

  @override
  String get shuffleLibrary => 'Bibliotek';

  @override
  String get shuffleGenre => 'Sjanger';

  @override
  String get shuffleNoLibraries => 'Ingen kompatible biblioteker tilgjengelig.';

  @override
  String get shuffleNoGenres =>
      'Fant ingen sjangere for denne tilfeldige modusen.';

  @override
  String get posterDisplayTitle => 'Utstilling';

  @override
  String get posterImageType => 'Bildetype';

  @override
  String get imageTypePoster => 'Plakat';

  @override
  String get imageTypeThumbnail => 'Miniatyrbilde';

  @override
  String get imageTypeBanner => 'Banner';

  @override
  String get playlistAddFailed => 'Kunne ikke legge til spillelisten';

  @override
  String get playlistCreateFailed => 'Kunne ikke opprette spilleliste';

  @override
  String get playlistNew => 'Ny spilleliste';

  @override
  String get playlistCreate => 'Skape';

  @override
  String get playlistCreateNew => 'Opprett ny spilleliste';

  @override
  String get playlistNoneFound => 'Fant ingen spillelister';

  @override
  String get addToPlaylist => 'Legg til spilleliste';

  @override
  String get lyricsNotAvailable => 'Ingen tekster tilgjengelig';

  @override
  String get upNext => 'Opp Neste';

  @override
  String get playNext => 'Spill Neste';

  @override
  String get stillWatchingContent =>
      'Avspillingen er satt på pause. Ser du fortsatt på?';

  @override
  String get stillWatchingStop => 'Stopp';

  @override
  String get stillWatchingContinue => 'Fortsette';

  @override
  String skipSegment(String segment) {
    return 'Hopp over $segment';
  }

  @override
  String get liveTv => 'Direktesendt TV';

  @override
  String get continueWatchingAndNextUp => 'Fortsett å se og neste opp';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Laster ned $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Laster ned $fileName';
  }

  @override
  String get nextEpisode => 'Neste episode';

  @override
  String get moreFromThisSeason => 'Mer fra denne sesongen';

  @override
  String get playerTooltipPlaybackSpeed => 'Avspillingshastighet';

  @override
  String get playerTooltipCastControls => 'Cast-kontroller';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Gå inn i fullskjerm';

  @override
  String get playerTooltipExitFullscreen => 'Avslutt fullskjerm';

  @override
  String get playerTooltipFloatOnTop => 'Flyt på toppen';

  @override
  String get playerTooltipExitFloatOnTop => 'Deaktiver flyte på toppen';

  @override
  String get playerTooltipLockLandscape => 'Lås landskap';

  @override
  String get playerTooltipUnlockOrientation => 'Tillat rotasjon';

  @override
  String get playerTooltipPrevious => 'Forrige';

  @override
  String get playerTooltipSeekBack => 'Søk tilbake';

  @override
  String get playerTooltipSeekForward => 'Søk fremover';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Merk som sett';

  @override
  String get contextMenuMarkUnwatched => 'Merk som usett';

  @override
  String get contextMenuAddToFavorites => 'Legg til i favoritter';

  @override
  String get contextMenuRemoveFromFavorites => 'Fjern fra favoritter';

  @override
  String get contextMenuGoToSeries => 'Gå til serien';

  @override
  String get contextMenuHideFromContinueWatching => 'Skjul fra Fortsett å se';

  @override
  String get contextMenuHideFromNextUp => 'Skjul fra Neste opp';

  @override
  String get contextMenuAddToCollection => 'Legg til i samling';

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
      'Få tilgang til serveradministrasjonspanelet';

  @override
  String get settingsDynamicContent => 'Dynamisk innhold';

  @override
  String get settingsDynamicContentSubtitle => 'Media Bar og visuelle overlegg';

  @override
  String get settingsAboutSubtitle =>
      'Appversjon, juridisk informasjon og kreditter';

  @override
  String get settingsSortServersBy => 'Sorter servere etter';

  @override
  String get settingsLastUsed => 'Sist brukt';

  @override
  String get settingsAlphabetical => 'Alfabetisk';

  @override
  String get settingsAllowSelfSignedCerts => 'Tillat selvsignerte sertifikater';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Stol på servere som bruker selvsignerte TLS-sertifikater eller sertifikater fra en privat CA. Aktiver bare for servere du selv kontrollerer. Dette deaktiverer sertifikatvalidering for alle tilkoblinger.';

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
  String get settingsHomePage => 'Hjemmeside';

  @override
  String get settingsTwentyFourHourClock => '24-timers klokke';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Bruk 24-timers tidsformatering uansett hvor klokken vises';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Vis tilfeldig rekkefølge-knappen i navigasjonslinjen';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Vis sjangerknappen i navigasjonslinjen';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Vis favorittknappen i navigasjonslinjen';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Vis bibliotek-knappen i navigasjonslinjen';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Vis Seerr-knappen i navigasjonslinjen';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Vis alltid tekstetiketter i den øverste navigasjonslinjen';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Slå av og på hjemmesidens synlighet per bibliotek. Start Moonfin på nytt for at endringer skal tre i kraft.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Media Bar og lokale forhåndsvisninger';

  @override
  String get settingsVisualOverlays => 'Visuelle overlegg';

  @override
  String get settingsSeasonalSurprise => 'Sesongmessig overraskelse';

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
  String get emulatorCoreDownloading => 'Laster ned';

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
  String get downloadedGames => 'Nedlastede spill';

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
  String get settingsHigh => 'Høy';

  @override
  String get settingsLow => 'Lav';

  @override
  String get settingsCustomPath => 'Egendefinert bane';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Angi banen for nedlastingsmappe';

  @override
  String get settingsConcurrentDownloads => 'Samtidige nedlastinger';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maksimalt antall elementer å laste ned samtidig.';

  @override
  String get settingsAppInfo => 'APPINFO';

  @override
  String get settingsReportAnIssue => 'Rapporter et problem';

  @override
  String get settingsReportAnIssueSubtitle => 'Åpne problemsporingen på GitHub';

  @override
  String get settingsJoinDiscord => 'Bli med i Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Chat med fellesskapet';

  @override
  String get settingsJoinTheDiscord => 'Bli med i Discord';

  @override
  String get settingsSupportMoonfin => 'Støtt Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Spander en kaffe på utvikleren';

  @override
  String get settingsLegal => 'LOVLIG';

  @override
  String get settingsLicenses => 'Lisenser';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Lisensmerknader for åpen kildekode';

  @override
  String get settingsPrivacyPolicy => 'Personvernerklæring';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Hvordan Moonfin håndterer dataene dine';

  @override
  String get settingsCheckForUpdates => 'Se etter oppdateringer';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Se etter den siste Moonfin-utgivelsen';

  @override
  String get settingsBoth => 'Både';

  @override
  String get settingsShuffleContentTypeFilter => 'Bland innholdstypefilter';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Alternativer for lydspor, prosessering og passthrough';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatisert avspilling og sekvensering';

  @override
  String get settingsSyncplaySubtitle =>
      'Synkroniseringslogikk for gruppeøkter';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Vil du hoppe over introer og outroer?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Nedtelling for mediesegment';

  @override
  String get settingsProgressBar => 'Fremdriftslinje';

  @override
  String get settingsTimer => 'Tidtaker';

  @override
  String get settingsNone => 'Ingen';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Spør bruker';

  @override
  String get settingsSkip => 'Hopp over';

  @override
  String get settingsDoNothing => 'Gjør ingenting';

  @override
  String get settingsMaxBitrateDescription =>
      'Sett tak for strømmingsbithastigheten. Innhold over denne terskelen vil bli omkodet for å passe.';

  @override
  String get settingsMaxResolutionDescription =>
      'Begrens den maksimale oppløsningen spilleren vil be om. Innhold med høyere oppløsning vil bli omkodet ned.';

  @override
  String get settingsPlayerZoomDescription =>
      'Hvordan video skal skaleres for å passe til skjermen.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Avspillingsmotor (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Velg standard avspillingsmotor på Android TV-enheter. Endringer gjelder for neste avspillingsøkt.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (anbefalt)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (eldre)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision Reserve';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Atferd for Dolby Vision-titler på enheter uten Dolby Vision-dekoding.';

  @override
  String get settingsAskEachTime => 'Spør hver gang';

  @override
  String get settingsPreferHdr10Fallback => 'Foretrekker HDR10 reserve';

  @override
  String get settingsPreferServerTranscode => 'Foretrekk servertranscode';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profil 7 Direkte spill';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Styrer om Dolby Vision-profil 7-strømmer med forbedringslag skal styre avspilling.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFTKRT aktivert)';

  @override
  String get settingsEnabledOnThisDevice => 'Aktivert på denne enheten';

  @override
  String get settingsDisabledPreferTranscode =>
      'Deaktivert (foretrekker omkode)';

  @override
  String get settingsResumeRewindDescription =>
      'Når du fortsetter avspillingen (fra Fortsett å se eller en side med medieelementer), hvor mange sekunder skal du spole tilbake?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Når du fortsetter avspillingen etter å ha trykket på pauseknappen, hvor mange sekunder skal du spole tilbake?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Hvor mange sekunder å hoppe tilbake etter å ha trykket på tilbakespolingsknappen.';

  @override
  String get settingsOneSecond => '1 sekund';

  @override
  String get settingsThreeSeconds => '3 sekunder';

  @override
  String get settingsFortyFiveSeconds => '45 sekunder';

  @override
  String get settingsSixtySeconds => '60 sekunder';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Hvor mange sekunder å hoppe fremover etter å ha trykket på spole fremover-knappen.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 til ekstern dekoder';

  @override
  String get settingsCinemaMode => 'Kinomodus';

  @override
  String get settingsCinemaModeSubtitle =>
      'Spill trailere/prerolls før en hovedfunksjon';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Utvidet viser et fullstendig kort med episodegrafikk og beskrivelse. Minimal viser et kompakt nedtellingsoverlegg. Deaktivert skjuler ledeteksten helt.';

  @override
  String get settingsShort => 'Kort';

  @override
  String get settingsLong => 'Lang';

  @override
  String get settingsVeryLong => 'Veldig lang';

  @override
  String get settingsVideoStartDelay => 'Videostartforsinkelse';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Direkte TV direkte';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Aktiver direkteavspilling for direktesendt TV';

  @override
  String get settingsOpenGroups => 'Åpne grupper';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Opprett, bli med i eller administrer SyncPlay-grupper';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay aktivert';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Aktiver gruppevisningsfunksjoner';

  @override
  String get settingsSyncplayButton => 'SyncPlay-knapp';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Vis SyncPlay-knappen på navigasjonslinjen';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Avansert korrigering';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Aktiver finkornet synkroniseringslogikk';

  @override
  String get settingsSyncplaySyncCorrection => 'Synkroniseringskorreksjon';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Juster avspillingen automatisk for å forbli synkronisert';

  @override
  String get settingsSyncplaySpeedToSync => 'Hastighet til synkronisering';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Bruk avspillingshastighetsjustering for å synkronisere';

  @override
  String get settingsSyncplaySkipToSync => 'Hopp til synkronisering';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Bruk søker for å synkronisere';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Minimum hastighetsforsinkelse';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Maksimal hastighetsforsinkelse';

  @override
  String get settingsSyncplaySpeedDuration => 'Hastighet Varighet';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimum hoppforsinkelse';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Ekstra forskyvning';

  @override
  String get onNow => 'På nå';

  @override
  String get collections => 'Samlinger';

  @override
  String get lastPlayed => 'Sist spilt';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Nylig lagt til i $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Nylig utgitt i $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Spill av neste episode automatisk';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Spill av neste episode automatisk når den er tilgjengelig.';

  @override
  String get skipSilenceTitle => 'Hopp over stillhet';

  @override
  String get skipSilenceSubtitle =>
      'Hopp automatisk over stille lydsegmenter når strømmen støtter det.';

  @override
  String get allowExternalAudioEffectsTitle => 'Tillat eksterne lydeffekter';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'La equalizer- og effektapper (f.eks. Wavelet) koble seg til Media3-avspillingsøkter.';

  @override
  String get disableTunnelingTitle => 'Deaktiver tunnelering';

  @override
  String get disableTunnelingSubtitle =>
      'Tving avspilling uten tunnelering. Nyttig på enheter med lyd-/videobrudd ved tunnelering.';

  @override
  String get enableTunnelingTitle => 'Aktiver tunnelering';

  @override
  String get enableTunnelingSubtitle =>
      'Avansert. Ruter lyd og video gjennom en koblet maskinvarebane. Av som standard fordi det gir lyd-/videobrudd på enkelte enheter.';

  @override
  String get mapDolbyVisionP7Title => 'Tilordne Dolby Vision-profil 7 til HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Spill av Dolby Vision profil 7-strømmer som HDR10-kompatibel HEVC på enheter uten DV-støtte.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Bruk innebygde undertekststiler';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Bruk farger, skrifter og plassering som er innebygd i undertekstsporet. Deaktiver for å bruke dine egne stilinnstillinger i stedet.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Bruk innebygde skriftstørrelser for undertekster';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Bruk hint om skriftstørrelse som er innebygd i undertekstsporet. Deaktiver for å bruke undertekststørrelsen fra stilinnstillingene dine.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Vis mediedetaljer';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Vis detaljer om det valgte elementet øverst på bibliotekssidene.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Bruk detaljerte underoverskrifter';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Vis en detaljert eller minimal underrad på bibliotekssidene.';

  @override
  String get savedThemesDeleteDialogTitle =>
      'Vil du slette det lagrede temaet?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Vil du fjerne «$themeName» fra bufferen på denne enheten?';
  }

  @override
  String get themeStore => 'Temabutikk';

  @override
  String get themeStoreSubtitle =>
      'Bla gjennom og lagre temaer fra fellesskapet';

  @override
  String get themeStoreDescription =>
      'Lagre et tema for å bruke det som de andre lagrede temaene dine.';

  @override
  String get themeStoreEmpty => 'Ingen temaer er tilgjengelige akkurat nå.';

  @override
  String get themeStoreLoadFailed =>
      'Kunne ikke laste inn Temabutikken. Sjekk tilkoblingen og prøv igjen.';

  @override
  String get themeStoreSave => 'Lagre';

  @override
  String get themeStoreSaveAndApply => 'Lagre og bruk';

  @override
  String get themeStoreSaved => 'Lagret';

  @override
  String get themeStoreInvalidMessage => 'Dette temaet kunne ikke lastes inn.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Lagret «$themeName».';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Slettet «$themeName» fra denne enheten.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Kunne ikke slette «$themeName».';
  }

  @override
  String get savedThemesTitle => 'Lagrede temaer';

  @override
  String get savedThemesDescription =>
      'Dette er temaer som er lastet ned fra Moonfin-tillegget for den gjeldende serveren. Sletting fjerner bare denne lokale kopien.';

  @override
  String get savedThemesEmpty =>
      'Fant ingen lagrede temaer for denne serveren.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Aktiv nå';
  }

  @override
  String get savedThemesDeleteTooltip => 'Slett lagret tema';

  @override
  String get savedThemesManageSubtitle =>
      'Administrer nedlastede tilleggstemaer på denne enheten';

  @override
  String get themeEditor => 'Temaredigering';

  @override
  String get themeEditorSubtitle =>
      'Åpne temaredigering for Moonfin i nettleseren';

  @override
  String get homeScreen => 'Startskjerm';

  @override
  String get bottomBar => 'Bunnlinje';

  @override
  String get homeRowsStyleClassic => 'Klassisk';

  @override
  String get homeRowsStyleModern => 'Moderne';

  @override
  String get homeRowsSection => 'Hjem-rader';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klassisk beholder bildetype og infooverlegg per rad. Moderne bruker rader fra portrett til bakgrunnsbilde.';

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
  String get displayFavoritesRows => 'Vis favorittrader';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Vis rader med favorittfilmer, -serier og andre favoritter i Hjem-seksjonene.';

  @override
  String get favoritesRowSorting => 'Sortering av favorittrader';

  @override
  String get favoritesRowSortingDescription =>
      'Sorter favorittrader etter lagt til-dato, utgivelsesdato, alfabetisk og mer.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Vis samlingsrader';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Vis samlingsrader i Hjem-seksjonene.';

  @override
  String get collectionsRowSorting => 'Sortering av samlingsrader';

  @override
  String get collectionsRowSortingDescription =>
      'Sorter samlingsrader etter lagt til-dato, utgivelsesdato, alfabetisk og mer.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Vis sjangerrader';

  @override
  String get displayGenresRowsSubtitle => 'Vis sjangerrader i Hjem-seksjonene.';

  @override
  String get genresRowSorting => 'Sortering av sjangerrader';

  @override
  String get genresRowSortingDescription =>
      'Sorter sjangerrader etter lagt til-dato, utgivelsesdato, alfabetisk og mer.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Elementer i sjangerrader';

  @override
  String get genresRowItemsDescription =>
      'Vis filmer, serier eller begge deler i sjangerrader.';

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
  String get displayPlaylistsRows => 'Vis spillelisterader';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Vis spillelisterader i Hjem-seksjonene.';

  @override
  String get playlistsRowSorting => 'Sortering av spillelisterader';

  @override
  String get playlistsRowSortingDescription =>
      'Sorter spillelisterader etter lagt til-dato, utgivelsesdato, alfabetisk og mer.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Vis lydrader';

  @override
  String get displayAudioRowsSubtitle => 'Vis lydrader i Hjem-seksjonene.';

  @override
  String get audioRowsSorting => 'Sortering av lydrader';

  @override
  String get audioRowsSortingDescription =>
      'Sorter lydrader etter lagt til-dato, utgivelsesdato, alfabetisk og mer.';

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
  String get audioPlaylists => 'Lydspillelister';

  @override
  String get appearance => 'Utseende';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Tastatur';

  @override
  String get navButtons => 'Knapper';

  @override
  String get rendering => 'Gjengivelse';

  @override
  String get mpvConfiguration => 'MPV-konfigurasjon';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Ekstern spillerapp';

  @override
  String get externalPlayerAppDescription =>
      'Angi en ekstern spiller for å aktivere avspilling ved langt trykk';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Vis appvelgeren når avspillingen starter.';

  @override
  String get loadingInstalledPlayers => 'Laster inn installerte spillere...';

  @override
  String get connection => 'Tilkobling';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Støttes på denne enheten';

  @override
  String get notSupportedOnThisDevice => 'Støttes ikke på denne enheten';

  @override
  String get mediaPlayerBehavior => 'Virkemåte for mediespiller';

  @override
  String get playbackEnhancements => 'Avspillingsforbedringer';

  @override
  String get alwaysOn => 'Alltid på.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Erstatt Hopp over outro med Neste opp-visning';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Vis Neste opp-overlegget i stedet for Hopp over outro-knappen.';

  @override
  String get playerRouting => 'Spillerruting';

  @override
  String get preferSoftwareDecoders => 'Foretrekk programvaredekodere';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Bruk FFmpeg (lyd) og libgav1 (AV1) før maskinvaredekodere. Deaktiver hvis HDMI-lydpassthrough slutter å virke.';

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
      'Åpne videoavspilling i den valgte eksterne appen på Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Automatisk køing';

  @override
  String get preferSdhSubtitles => 'Foretrekk SDH-undertekster';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioriter SDH-/CC-undertekstspor ved automatisk valg.';

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
  String get webDiagnostics => 'Nettdiagnostikk';

  @override
  String get webDiagnosticsTitle => 'Moonfin nettdiagnostikk';

  @override
  String get webDiagnosticsIntro =>
      'Bruk denne siden til å diagnostisere tilkoblingsproblemer i nettleseren (CORS, blandet innhold og oppdagelsesinnstillinger).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Oppdaget feil med blandet innhold';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Oppdaget CORS-/preflight-feil';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin oppdaget en HTTPS-side som prøver å kalle en HTTP-server-URL. Nettlesere blokkerer denne forespørselen før den når serveren din.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin oppdaget en forespørselsfeil på nettlesernivå som vanligvis skyldes manglende CORS- eller preflight-hoder på medieserveren.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Mål-URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detalj: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Gjeldende kjøretidskontekst';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Protokoll';

  @override
  String get webDiagnosticsPluginMode => 'Tilleggsmodus';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC-skanning';

  @override
  String get webDiagnosticsForcedServerUrl => 'Tvunget server-URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Standard server-URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL for oppdagelsesproxy';

  @override
  String get notConfigured => 'ikke konfigurert';

  @override
  String get webDiagnosticsMixedContent => 'Blandet innhold';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Denne siden lastes over HTTPS, men én eller flere konfigurerte URL-er bruker HTTP. Nettlesere blokkerer HTTPS-sider fra å kalle HTTP-API-er.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Løsning: server medieserveren eller proxy-endepunktet via HTTPS, eller last Moonfin over HTTP bare på klarerte lokale nettverk.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Ingen åpenbar konfigurasjon med blandet innhold ble oppdaget ut fra gjeldende kjøretidsinnstillinger.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS-sjekkliste';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Tillat nettleserens origin i Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Inkluder Authorization, X-Emby-Authorization og X-Emby-Token i Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Eksponer Content-Range og Accept-Ranges for strømming og spoling.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Returner 204 på OPTIONS-preflight-forespørsler.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Eksempel på header-utdrag (nginx-stil)';

  @override
  String get note => 'Merk';

  @override
  String get webDiagnosticsNonWebNote =>
      'Denne diagnostikkruten er ment for nettbygg. Hvis du ser dette på en annen plattform, gjelder kanskje ikke disse kontrollene.';

  @override
  String get backToServerSelect => 'Tilbake til servervalg';

  @override
  String get signOutAllUsers => 'Logg av alle brukere';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofontillatelsen er permanent avslått. Aktiver den i systeminnstillingene.';

  @override
  String get voiceSearchPermissionRequired =>
      'Mikrofontillatelse kreves for talesøk.';

  @override
  String get voiceSearchNoMatch => 'Fikk ikke med meg det. Prøv igjen.';

  @override
  String get voiceSearchNoSpeechDetected => 'Ingen tale ble oppdaget.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofonfeil.';

  @override
  String get voiceSearchNeedsInternet => 'Talesøk krever internett.';

  @override
  String get voiceSearchServiceBusy => 'Taletjenesten er opptatt. Prøv igjen.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofontillatelsen er permanent avslått.';

  @override
  String get microphonePermissionDenied => 'Mikrofontillatelsen er avslått.';

  @override
  String get speechRecognitionUnavailable =>
      'Talegjenkjenning er ikke tilgjengelig på denne enheten.';

  @override
  String get openIosRoutePicker => 'Åpne iOS-rutevelgeren';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay-rutevelgeren er ikke tilgjengelig på denne enheten.';

  @override
  String get videos => 'Videoer';

  @override
  String get programs => 'Programmer';

  @override
  String get songs => 'Sanger';

  @override
  String get photoAlbums => 'Fotoalbum';

  @override
  String get photos => 'Bilder';

  @override
  String get people => 'Personer';

  @override
  String get recentlyReleasedEpisodes => 'Nylig utgitte episoder';

  @override
  String get watchAgain => 'Se igjen';

  @override
  String get guestAppearances => 'Gjesteopptredener';

  @override
  String get appearancesSeerr => 'Opptredener (Seerr)';

  @override
  String get crewContributionsSeerr => 'Bidrag fra teamet (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Se med gruppe';

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
  String get openInBrowser => 'Åpne i nettleser';

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
      'Innebygd nettleser er ikke tilgjengelig på denne plattformen.';

  @override
  String get adminRestartServerConfirmation =>
      'Er du sikker på at du vil starte serveren på nytt?';

  @override
  String get adminShutdownServerConfirmation =>
      'Er du sikker på at du vil slå av serveren? Du må starte den manuelt igjen.';

  @override
  String get internal => 'Intern';

  @override
  String get idle => 'Inaktiv';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Fant ingen brukere';

  @override
  String get adminNoUsersMatchSearch => 'Ingen brukere samsvarer med søket';

  @override
  String get adminNoDevicesFound => 'Fant ingen enheter';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Ingen enheter samsvarer med gjeldende filtre';

  @override
  String get remoteAccess => 'Ekstern tilgang';

  @override
  String get localOnly => 'Kun lokalt';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Kunne ikke laste inn medieanalysen';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Samlet analyse på tvers av alle mediebiblioteker.';

  @override
  String get analyticsTopArtists => 'Toppartister';

  @override
  String get analyticsTopAuthors => 'Toppforfattere';

  @override
  String get analyticsTopContributors => 'Toppbidragsytere';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count biblioteker',
      one: '1 bibliotek',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Ingen indekserte medietotaler er tilgjengelige for dette utvalget ennå.';

  @override
  String get analyticsLibraryDetails => 'Bibliotekdetaljer';

  @override
  String get analyticsLibraryBreakdown => 'Bibliotekfordeling';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Ingen biblioteker er tilgjengelige.';

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
  String get adminServerAdministrationTitle => 'Serveradministrasjon';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Bildebuffer';

  @override
  String get adminServerPathCache => 'Buffer';

  @override
  String get adminServerPathLogs => 'Logger';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Omkoding';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Denne serveren returnerte ingen serverbaner.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent % brukt';
  }

  @override
  String get userActivity => 'Brukeraktivitet';

  @override
  String get systemEvents => 'Systemhendelser';

  @override
  String get needsAttention => 'Krever oppmerksomhet';

  @override
  String get homeVideos => 'Hjemmevideoer';

  @override
  String get mixedContent => 'Blandet innhold';

  @override
  String get homeVideosAndPhotos => 'Hjemmevideoer og bilder';

  @override
  String get mixedMoviesAndShows => 'Blandede filmer og serier';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Fant ingen opptak';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Fant ingen bildesider i .$extension-arkivet.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Innebygd gjengiver mislyktes ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB-gjengiver mislyktes ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Mangler lokal fil for leseren: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status ved åpning av bokdata fra $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Ingen lesbart bokendepunkt er tilgjengelig';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Tegneseriearkivformatet støttes ikke: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Tillegget for CBR-utpakking er ikke tilgjengelig på denne plattformen.';

  @override
  String get failedToExtractCbrArchive => 'Kunne ikke pakke ut .cbr-arkivet.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7-utpakking er ikke tilgjengelig på denne plattformen.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Tillegget for CB7-utpakking er ikke tilgjengelig på denne plattformen.';

  @override
  String get loadingShuffle => 'Laster inn tilfeldig rekkefølge...';

  @override
  String get libraryShuffleLabel => 'TILFELDIG FRA BIBLIOTEK';

  @override
  String get randomShuffleLabel => 'TILFELDIG UTVALG';

  @override
  String get genresShuffleLabel => 'TILFELDIG FRA SJANGRE';

  @override
  String get autoHdrSwitching => 'Automatisk HDR-bytte';

  @override
  String get autoHdrSwitchingDescription =>
      'Aktiver HDR automatisk ved avspilling av HDR-video, og gjenopprett visningsmodus ved avslutning.';

  @override
  String get whenFullscreen => 'Ved fullskjerm';

  @override
  String get changeArtwork => 'Endre bildemateriell';

  @override
  String get missing => 'Mangler';

  @override
  String get clearAllArtworkButton => 'Vil du fjerne alt bildemateriell?';

  @override
  String get clearAllArtworkWarning =>
      'Er du sikker på at du vil fjerne alt nedlastet bildemateriell?';

  @override
  String get confirmClear => 'Bekreft fjerning';

  @override
  String confirmClearMessage(String itemType) {
    return 'Er du sikker på at du vil fjerne følgende: $itemType?';
  }

  @override
  String get uploadButton => 'Vil du laste opp?';

  @override
  String get resolutionLabel => 'Oppløsning: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Vis bare bildemateriell på grensesnittspråket';

  @override
  String get confirmClearAll => 'Bekreft fjerning av alt';

  @override
  String get imageUploadSuccess => 'Bildet ble lastet opp!';

  @override
  String imageUploadFailed(String error) {
    return 'Kunne ikke laste opp bildet: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Kunne ikke angi bildet: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Kunne ikke slette bildet: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Kunne ikke fjerne alt bildemateriell: $error';
  }

  @override
  String get yes => 'Ja';

  @override
  String get posterCategory => 'Plakat';

  @override
  String get backdropsCategory => 'Bakgrunnsbilder';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniatyrbilde';

  @override
  String get artCategory => 'Grafikk';

  @override
  String get discArtCategory => 'Plategrafikk';

  @override
  String get screenshotCategory => 'Skjermbilde';

  @override
  String get boxCoverCategory => 'Boksomslag';

  @override
  String get boxRearCoverCategory => 'Boksomslag bak';

  @override
  String get menuArtCategory => 'Menygrafikk';

  @override
  String get confirmItemPoster => 'plakat';

  @override
  String get confirmItemBackdrop => 'bakgrunnsbilde';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniatyrbilde';

  @override
  String get confirmItemArt => 'grafikk';

  @override
  String get confirmItemDiscArt => 'plategrafikk';

  @override
  String get confirmItemScreenshot => 'skjermbilde';

  @override
  String get confirmItemBoxCover => 'boksomslag';

  @override
  String get confirmItemBoxRearCover => 'boksomslag bak';

  @override
  String get confirmItemMenuArt => 'menygrafikk';

  @override
  String get resolutionAll => 'Alle';

  @override
  String get resolutionHigh => 'Høy (1080p+)';

  @override
  String get resolutionMedium => 'Middels (720p)';

  @override
  String get resolutionLow => 'Lav (<720p)';

  @override
  String get sources => 'Kilder';

  @override
  String get audiobookChapters => 'Kapitler';

  @override
  String get audiobookBookmarks => 'Bokmerker';

  @override
  String get audiobookNotes => 'Notater';

  @override
  String get audiobookQueue => 'Kø';

  @override
  String get audiobookTimeline => 'Tidslinje';

  @override
  String get audiobookTimelineEmpty => 'Tidslinjen er tom';

  @override
  String get audiobookFocusedTimeline => 'Fokusert tidslinje';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Eksporter bokmerker';

  @override
  String get audiobookExportNotes => 'Eksporter notater';

  @override
  String get audiobookExportAll => 'Eksporter alt';

  @override
  String audiobookExportSuccess(String path) {
    return 'Eksportert til $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Eksporten mislyktes: $error';
  }

  @override
  String get audiobookLyrics => 'Sangtekster';

  @override
  String get audiobookAddBookmark => 'Legg til bokmerke';

  @override
  String get audiobookAddNote => 'Legg til notat';

  @override
  String get audiobookEditNote => 'Rediger notat';

  @override
  String get audiobookNoteHint => 'Skriv et notat for dette øyeblikket';

  @override
  String get audiobookSleepTimer => 'Sovetidtaker';

  @override
  String get audiobookSleepOff => 'Av';

  @override
  String get audiobookSleepEndOfChapter => 'Slutten av kapitlet';

  @override
  String get audiobookSleepCustom => 'Egendefinert';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining igjen';
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
  String get audiobookPlaybackSpeed => 'Avspillingshastighet';

  @override
  String get audiobookRemainingTime => 'Gjenstår';

  @override
  String get audiobookElapsedTime => 'Forløpt';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Tilbake $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Fram $seconds s';
  }

  @override
  String get audiobookPreviousChapter => 'Forrige kapittel';

  @override
  String get audiobookNextChapter => 'Neste kapittel';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Kapittel $current av $total';
  }

  @override
  String get audiobookNoChapters => 'Ingen kapitler';

  @override
  String get audiobookNoBookmarks => 'Ingen bokmerker ennå';

  @override
  String get audiobookNoNotes => 'Ingen notater ennå';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Bokmerke lagt til ved $position';
  }

  @override
  String get audiobookSpeedReset => 'Tilbakestill til 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Lagre';

  @override
  String get audiobookCancel => 'Avbryt';

  @override
  String get audiobookDelete => 'Slett';

  @override
  String get subtitlePreferencesDescription =>
      'Endre undertekstmoduser, standardspråk, utseende og gjengivelsesalternativer.';

  @override
  String get subtitleRendering => 'Undertekstgjengivelse';

  @override
  String get displayOptions => 'Visningsalternativer';

  @override
  String get releaseDateAscending => 'Utgivelsesdato (stigende)';

  @override
  String get releaseDateDescending => 'Utgivelsesdato (synkende)';

  @override
  String get groupContributions => 'Grupper bidrag';

  @override
  String get groupMultipleRoles => 'Grupper flere roller';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Advarsel om skrivetilgang til biblioteket';

  @override
  String get libraryWriteAccessHowToFix => 'Slik løser du dette:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Gi skrivetillatelser til Jellyfin-tjenestebrukeren (f.eks. jellyfin eller Docker PUID/PGID) for mediebibliotekmappene på serveren.\n\n2. Eller gå til Jellyfin-dashbordet -> Biblioteker, rediger dette biblioteket og deaktiver «Save artwork into media folders» for å lagre bildemateriell i Jellyfins interne database.';

  @override
  String get dismiss => 'Lukk';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Biblioteket \'$libraryName\' er konfigurert til å lagre bildemateriell direkte i mediemappene (\'Save artwork into media folders\' er aktivert). Jellyfin har imidlertid testet skrivetilgangen og har ikke tillatelse til å skrive filer til denne katalogen:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Det ser ut til at Jellyfin ikke klarte å oppdatere bildematerialet. Biblioteket ditt er konfigurert til å lagre bildemateriell direkte i mediemappene («Save artwork into media folders» er aktivert). Denne feilen oppstår vanligvis når Jellyfin-serverprosessen ikke har tillatelse til å skrive filer til mediekatalogene dine.';

  @override
  String get replay => 'Spill av på nytt';

  @override
  String get fileInformation => 'Filinformasjon';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Størrelse: $size  •  Format: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Vis alle ($count) lydspor';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Vis alle ($count) undertekstspor';
  }

  @override
  String get checkingDirectPlay => 'Kontrollerer Direct Play-kapasitet...';

  @override
  String get directPlayCapabilityLabel => 'Direct Play-kapasitet: ';

  @override
  String get forced => 'Tvunget';

  @override
  String get transcodeContainerNotSupported =>
      'Containerformatet støttes ikke av spilleren.';

  @override
  String get transcodeVideoCodecNotSupported => 'Videokodeken støttes ikke.';

  @override
  String get transcodeAudioCodecNotSupported => 'Lydkodeken støttes ikke.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Undertekstformatet støttes ikke (må brennes inn).';

  @override
  String get transcodeAudioProfileNotSupported => 'Lydprofilen støttes ikke.';

  @override
  String get transcodeVideoProfileNotSupported => 'Videoprofilen støttes ikke.';

  @override
  String get transcodeVideoLevelNotSupported => 'Videonivået støttes ikke.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Videooppløsningen støttes ikke av denne enheten.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Videoens bitdybde støttes ikke.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Videoens bildefrekvens støttes ikke.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Filens bitrate overskrider spillerens strømmegrense.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Videoens bitrate overskrider strømmegrensen.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Lydens bitrate overskrider strømmegrensen.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Antall lydkanaler støttes ikke.';

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
  String get sortAlphabetical => 'Alfabetisk';

  @override
  String get sortReleaseAscending => 'Utgivelsesrekkefølge (stigende)';

  @override
  String get sortReleaseDescending => 'Utgivelsesrekkefølge (synkende)';

  @override
  String get sortCustomDragDrop => 'Egendefinert (dra og slipp)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Sorteringsalternativer for spilleliste';

  @override
  String get resetSort => 'Tilbakestill sortering';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Se S$season:E$episode på nytt';
  }

  @override
  String get rewatchPlaylist => 'Se spillelisten på nytt';

  @override
  String get noSubtitlesFound => 'Fant ingen undertekster.';

  @override
  String get adminControls => 'Adminkontroller';

  @override
  String get impellerRendering => 'Gjengivelsesmotor (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller er Flutters moderne GPU-gjengiver som gir jevnere animasjoner og mindre hakking. På enkelte TV-bokser og eldre GPU-er kan den forårsake feil eller svart video – slå den av hvis du opplever det. Automatisk velger den beste standardinnstillingen for enheten din. Start Moonfin på nytt for å ta i bruk endringen.';

  @override
  String get impellerAuto => 'Automatisk';

  @override
  String get impellerOn => 'På';

  @override
  String get impellerOff => 'Av';

  @override
  String get impellerRestartTitle => 'Omstart kreves';

  @override
  String get impellerRestartMessage =>
      'Moonfin må startes på nytt for å endre gjengivelsesmotoren. Lukk appen nå, og åpne den igjen for å ta i bruk endringen.';

  @override
  String get impellerCloseNow => 'Lukk appen nå';

  @override
  String get adminRefreshLibrary => 'Oppdater bibliotek';

  @override
  String get adminRefreshAllLibraries => 'Oppdater alle biblioteker';

  @override
  String get adminRepoSortDateOldest => 'Lagt til (eldste først)';

  @override
  String get adminRepoSortDateNewest => 'Lagt til (nyeste først)';

  @override
  String get adminRepoSortNameAsc => 'Alfabetisk (A til Å)';

  @override
  String get adminRepoSortNameDesc => 'Alfabetisk (Å til A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Laster inn serveranalyse... $percentage %';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Samme som kilden';

  @override
  String get imdbTop250Movies => 'IMDb topp 250 filmer';

  @override
  String get imdbTop250TvShows => 'IMDb topp 250 TV-serier';

  @override
  String get imdbMostPopularMovies => 'IMDb mest populære filmer';

  @override
  String get imdbMostPopularTvShows => 'IMDb mest populære TV-serier';

  @override
  String get imdbLowestRatedMovies => 'IMDb lavest rangerte filmer';

  @override
  String get imdbTopEnglishMovies => 'IMDb topprangerte engelske filmer';

  @override
  String get addToWatchlist => 'Legg til i visningslisten';

  @override
  String get removeFromWatchlist => 'Fjern fra visningslisten';

  @override
  String get watchlistUpdateFailed => 'Kunne ikke oppdatere visningslisten';

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
  String get integrations => 'Integrasjoner';

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
