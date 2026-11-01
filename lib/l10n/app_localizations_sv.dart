// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

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
  String get interfaceLanguage => 'Gränssnittsspråk';

  @override
  String get systemLanguageDefault => 'Systemstandard';

  @override
  String get signIn => 'Logga in';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Tom';

  @override
  String connectingToServer(String serverName) {
    return 'Ansluter till $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Lösenord';

  @override
  String get username => 'Användarnamn';

  @override
  String get email => 'E-post';

  @override
  String get quickConnectInstruction =>
      'Ange den här koden på din servers webbinstrumentpanel:';

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
  String get waitingForAuthorization => 'Väntar pa auktorisering…';

  @override
  String get back => 'Tillbaka';

  @override
  String get serverUnavailable => 'Servern är inte tillgänglig';

  @override
  String get loginFailed => 'Inloggningen misslyckades';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect är inte tillgängligt: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect är inte tillgängligt ($status): $detail';
  }

  @override
  String get whosWatching => 'Vem tittar?';

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
  String get addUser => 'Lägg till användare';

  @override
  String get selectServer => 'Välj Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Sparade servrar';

  @override
  String get discoveredServers => 'Upptäckta servrar';

  @override
  String get noneFound => 'Ingen hittades';

  @override
  String get unableToConnectToServer => 'Det går inte att ansluta till servern';

  @override
  String get addServer => 'Lägg till server';

  @override
  String get embyConnect => 'Emby Anslut';

  @override
  String get removeServer => 'Ta bort server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Ta bort \"$serverName\" från dina servrar?';
  }

  @override
  String get cancel => 'Avbryt';

  @override
  String get remove => 'Ta bort';

  @override
  String get connectToServer => 'Anslut till server';

  @override
  String get serverAddress => 'Serveradress';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Ansluta';

  @override
  String get secureStorageUnavailable => 'Säker lagring är inte tillgänglig';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin kunde inte komma åt din systemnyckelring. Inloggningen kan fortsätta, men säker tokenlagring kan vara otillgänglig förrän nyckelringen är upplåst.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'App-tema';

  @override
  String get detailScreenStyle => 'Stil för detaljsida';

  @override
  String get detailScreenStyleSubtitle =>
      'Klassisk är Moonfins ursprungliga centrerade layout. Modern är en responsiv, filmisk layout.';

  @override
  String get detailScreenStyleMoonfin => 'Klassisk';

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
  String get expandedTabs => 'Expanderade flikar';

  @override
  String get expandedTabsSubtitle =>
      'Visa flikinnehåll automatiskt när du bläddrar bland flikarna. Stäng av för att öppna och stänga varje flik manuellt.';

  @override
  String get showTechnicalDetails => 'Visa tekniska detaljer?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Visa codec, upplösning och streaminformation i bannersammanfattningen';

  @override
  String get recommendationSystem => 'Rekommendationssystem';

  @override
  String get recommendationSystemSubtitle =>
      'Använd Moonfin Recommends lokala biblioteksalgoritm eller TMDb:s likhetsmått online. Obs: Onlinerekommendationer kräver Seerr-integration.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb-likhet';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Begränsa efter åldersgräns?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Begränsa förslag från Moonfin Recommends efter målmediets åldersgräns';

  @override
  String get interfaceStyle => 'Gränssnittsstil';

  @override
  String get interfaceStyleSubtitle =>
      'Automatiskt matchar din enhet. Välj Apple eller Material för att framtvinga ett utseende.';

  @override
  String get interfaceStyleAutomatic => 'Automatiskt';

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
  String get glassQuality => 'Glaskvalitet';

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
      'Auto väljer den bästa glaseffekten för den här enheten. Full framtvingar äkta oskärpa; Reducerad använder ett lättviktigt glas som sparar GPU-kraft.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Full';

  @override
  String get glassQualityReduced => 'Reducerad';

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
      'Växla mellan Moonfin och Neon Pulse utan att starta om appen';

  @override
  String get customThemeTitle => 'Anpassat tema';

  @override
  String get customThemeSubtitle =>
      'Anpassade teman ändrar visuella element i hela Moonfin. Välj ett av alternativen som passar din stil.';

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
      'Nuvarande Moonfin look som ni alla har börjat älska';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-styling med magenta glöd, cyan text och starkare kromkontrast';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Liquid glass-stil med drivande gradientbakgrund, frostade ytor och Apple-blå accentfärg';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixelkonst med kraftig palett, blockiga kanter, hårda skuggor och pixelteckensnitt';

  @override
  String get embyConnectSignInSubtitle =>
      'Logga in med ditt Emby Connect-konto';

  @override
  String get emailOrUsername => 'E-post eller användarnamn';

  @override
  String get selectAServer => 'Välj en server';

  @override
  String get tryAgain => 'Försök igen';

  @override
  String get noLinkedServers =>
      'Inga servrar länkade till detta Emby Connect-konto';

  @override
  String get invalidEmbyConnectCredentials => 'Ogiltiga Emby Connect-uppgifter';

  @override
  String get invalidEmbyConnectLogin =>
      'Ogiltigt användarnamn eller lösenord för Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Servern stöder inte Emby Connect-utbyte';

  @override
  String get embyConnectNetworkError =>
      'Nätverksfel vid kontakt med Emby Connect eller den valda servern';

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
  String get loadingLinkedServers => 'Laddar länkade servrar...';

  @override
  String get connectingToServerEllipsis => 'Ansluter till server...';

  @override
  String get noReachableAddress => 'Ingen nåbar adress har angetts';

  @override
  String get invalidServerExchangeResponse =>
      'Ogiltigt svar från serverutbytesslutpunkt';

  @override
  String unableToConnectTo(String target) {
    return 'Kan inte ansluta till $target';
  }

  @override
  String get exitApp => 'Vill du avsluta Moonfin?';

  @override
  String get exitAppConfirmation => 'Är du säker på att du vill avsluta?';

  @override
  String get exit => 'Avsluta';

  @override
  String get gameMenu => 'Meny';

  @override
  String get gamePaused => 'Pausad';

  @override
  String get gameSaveState => 'Spara tillstånd';

  @override
  String get games => 'Spel';

  @override
  String get gameLoadState => 'Ladda tillstånd';

  @override
  String get gameFastForward => 'Snabbspolning framåt';

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
  String get gameEmulatorSettings => 'Emulatorinställningar';

  @override
  String get gameNoCoreOptions =>
      'Den här kärnan har inga justerbara alternativ.';

  @override
  String get gameHoldToOpenMenu => 'Håll in för att öppna menyn';

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
      'Spel stöds inte på den här enheten än.';

  @override
  String get noHomeRowsLoaded => 'Inga hemmarader kunde laddas';

  @override
  String get noHomeRowsHint =>
      'Försök att uppdatera eller minska aktiva hemsektioner.';

  @override
  String get retryHomeRows => 'Försök Hemrader igen';

  @override
  String get guide => 'Tablå';

  @override
  String get recordings => 'Inspelningar';

  @override
  String get schedule => 'Schema';

  @override
  String get series => 'Serier';

  @override
  String get noItemsFound => 'Inga föremål hittades';

  @override
  String get home => 'Hem';

  @override
  String get browseAll => 'Bläddra bland alla';

  @override
  String get genres => 'Genrer';

  @override
  String get collectionPlaceholder => 'Samlingsobjekt kommer att visas här';

  @override
  String get browseByLetter => 'Bläddra efter bokstav';

  @override
  String get alphabeticalBrowsePlaceholder => 'Alfabetisk bläddring visas här';

  @override
  String get suggestions => 'Förslag';

  @override
  String get suggestionsPlaceholder => 'Föreslagna objekt visas här';

  @override
  String get failedToLoadLibraries => 'Det gick inte att läsa in bibliotek';

  @override
  String get noLibrariesFound => 'Inga bibliotek hittades';

  @override
  String get library => 'Bibliotek';

  @override
  String get displaySettings => 'Displayinställningar';

  @override
  String get allGenres => 'Alla genrer';

  @override
  String get noGenresFound => 'Inga genrer hittades';

  @override
  String failedToLoadFolderError(String error) {
    return 'Kunde inte läsa in mappen: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Den här mappen är tom';

  @override
  String itemCountLabel(int count) {
    return '$count objekt';
  }

  @override
  String get failedToLoadFavorites => 'Det gick inte att läsa in favoriter';

  @override
  String get retry => 'Forsok igen';

  @override
  String get noFavoritesYet => 'Inga favoriter än';

  @override
  String get favorites => 'Favoriter';

  @override
  String totalCountItems(int count) {
    return '$count objekt';
  }

  @override
  String get continuing => 'Fortlöpande';

  @override
  String get ended => 'Avslutade';

  @override
  String get sortAndFilter => 'Sortera & Filtrera';

  @override
  String get type => 'Typ';

  @override
  String get sortBy => 'Sortera efter';

  @override
  String get display => 'Visa';

  @override
  String get imageType => 'Bildtyp';

  @override
  String get posterSize => 'Affischstorlek';

  @override
  String get small => 'Små';

  @override
  String get medium => 'Mellan';

  @override
  String get large => 'Stor';

  @override
  String get extraLarge => 'Extra large';

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
    return '$name — Genrer';
  }

  @override
  String get views => 'Visningar';

  @override
  String get albums => 'Album';

  @override
  String get albumArtists => 'Albumartister';

  @override
  String get artists => 'Artister';

  @override
  String get bookmarks => 'Bokmärken';

  @override
  String get noSavedBookmarks => 'Inga sparade bokmärken för denna titel ännu.';

  @override
  String get openBook => 'Öppna boken';

  @override
  String get chapter => 'Kapitel';

  @override
  String get page => 'Sida';

  @override
  String get bookmark => 'Bokmärke';

  @override
  String get justNow => 'Just nu';

  @override
  String minutesAgo(int count) {
    return '$count min sedan';
  }

  @override
  String hoursAgo(int count) {
    return '$count tim sedan';
  }

  @override
  String daysAgo(int count) {
    return '$count d sedan';
  }

  @override
  String get discoverySubjects => 'Upptäcktsämnen';

  @override
  String get apply => 'Tillämpa';

  @override
  String get openLink => 'Öppna länken';

  @override
  String get scanWithYourPhone => 'Skanna med din telefon';

  @override
  String get audiobookGenres => 'Ljudbok genrer';

  @override
  String get scrollLeft => 'Bläddra åt vänster';

  @override
  String get scrollRight => 'Bläddra åt höger';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre =>
      'Det gick inte att ladda den här genren just nu.';

  @override
  String get continueReading => 'Fortsätt läsa';

  @override
  String get savedHighlights => 'Sparade höjdpunkter';

  @override
  String get continueListening => 'Fortsätt lyssna';

  @override
  String get listen => 'Lyssna';

  @override
  String get resume => 'Återuppta';

  @override
  String get failedToLoadLibrary => 'Det gick inte att läsa in biblioteket';

  @override
  String get popularNow => 'Populär nu';

  @override
  String get savedForLater => 'Sparad för senare';

  @override
  String get topListens => 'Topplyssnar';

  @override
  String get unreadDiscoveries => 'Olästa upptäckter';

  @override
  String get pickUpAgain => 'Plocka upp igen';

  @override
  String get bookHighlightsDescription =>
      'Dina böcker med höjdpunkter, favoriter eller läsframsteg.';

  @override
  String get handPickedFromLibrary => 'Handplockat från ditt bibliotek.';

  @override
  String get handPickedFromListeningQueue =>
      'Handplockat från din lyssningskö.';

  @override
  String get booksWithHighlights =>
      'Böcker med höjdpunkter, favoriter eller läsframsteg.';

  @override
  String get jumpBackNarration =>
      'Hoppa tillbaka till berättandet utan att leta efter din plats.';

  @override
  String get unreadBooksReady => 'Olästa böcker redo för nästa tysta timme.';

  @override
  String get quickAccessFavorites =>
      'Snabb tillgång till böckerna du återkommer till.';

  @override
  String get searchAudiobooks => 'Sök ljudböcker';

  @override
  String get searchYourLibrary => 'Sök i ditt bibliotek';

  @override
  String get pickUpStory => 'Fortsätt berättelsen där du slutade';

  @override
  String get savedPlacesChapters =>
      'Dina sparade platser och oavslutade kapitel';

  @override
  String authorsCount(int count) {
    return '$count författare';
  }

  @override
  String genresCount(int count) {
    return '$count genrer';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% klart';
  }

  @override
  String get readyWhenYouAre => 'Klar när du är';

  @override
  String get details => 'Detaljer';

  @override
  String get listeningRoom => 'Lyssningsrum';

  @override
  String get bookmarksAndProgress => 'Bokmärken och framsteg';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titlar ordnade för läsvänlig bläddring.';
  }

  @override
  String get titles => 'Titlar';

  @override
  String get allTitles => 'Alla titlar';

  @override
  String get authors => 'Författare';

  @override
  String get browseByAuthor => 'Bläddra efter författare';

  @override
  String get browseByGenre => 'Bläddra efter genre';

  @override
  String get discover => 'Upptäcka';

  @override
  String get noBookmarkedItems => 'Inga bokmärkta objekt ännu';

  @override
  String get nothingMatchesSection =>
      'Inget matchar det här avsnittet ännu. Försök med en annan flik eller kom tillbaka efter att bibliotekssynkroniseringen är klar.';

  @override
  String get audiobooks => 'Ljudböcker';

  @override
  String noLabelFound(String label) {
    return 'Inga $label hittades';
  }

  @override
  String get folder => 'Mapp';

  @override
  String get filters => 'Filter';

  @override
  String get readingStatus => 'Lässtatus';

  @override
  String get playedStatus => 'Spelad status';

  @override
  String get readStatus => 'Läsa';

  @override
  String get watched => 'Sedda';

  @override
  String get unread => 'Oläst';

  @override
  String get unwatched => 'Osedda';

  @override
  String get seriesStatus => 'Seriestatus';

  @override
  String get allLibraries => 'Alla bibliotek';

  @override
  String get books => 'Böcker';

  @override
  String get latestBooks => 'Senaste böckerna';

  @override
  String get latestAudiobooks => 'Senaste ljudböckerna';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count böcker',
      one: '1 bok',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Bok';

  @override
  String get bookFormatAudiobook => 'Ljudbok';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Inga böcker hittades för denna författare.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% läst';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time kvar';
  }

  @override
  String get bookHeroRead => 'Läs';

  @override
  String get bookHeroListen => 'Lyssna';

  @override
  String get author => 'Författare';

  @override
  String get unknownAuthor => 'Okänd författare';

  @override
  String get uncategorized => 'Okategoriserad';

  @override
  String get overview => 'Översikt';

  @override
  String get noLibrivoxDescription =>
      'Ingen beskrivning tillhandahållen av LibriVox för denna titel ännu.';

  @override
  String get readers => 'Läsare';

  @override
  String get openLinks => 'Öppna länkar';

  @override
  String get librivoxPage => 'LibriVox Sida';

  @override
  String get internetArchive => 'Internetarkiv';

  @override
  String get rssFeed => 'RSS-flöde';

  @override
  String get downloadZip => 'Ladda ner Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count delar';
  }

  @override
  String firstPublished(int year) {
    return 'Först utgiven $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Ingen översikt tillgänglig från Open Library för denna titel ännu.';

  @override
  String get subjects => 'Ämnen';

  @override
  String get all => 'Alla';

  @override
  String booksCount(int count) {
    return '$count böcker';
  }

  @override
  String get couldNotLoadSubject =>
      'Det gick inte att ladda detta ämne just nu.';

  @override
  String get audiobookDetails => 'Ljudbok detaljer';

  @override
  String authorsCountTitle(int count) {
    return '$count författare';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ljudböcker',
      one: '1 ljudbok',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Låtlista';

  @override
  String get itemListPlaceholder => 'Objektlistan kommer att visas här';

  @override
  String get failedToLoad => 'Det gick inte att ladda';

  @override
  String get delete => 'Radera';

  @override
  String get save => 'Spara';

  @override
  String get moreLikeThis => 'Mer sånt här';

  @override
  String get castAndCrew => 'Skådespelare & team';

  @override
  String get collection => 'Samling';

  @override
  String get episodes => 'Avsnitt';

  @override
  String get nextUp => 'Nästa upp';

  @override
  String get seasons => 'Säsonger';

  @override
  String get chapters => 'Kapitel';

  @override
  String get features => 'Drag';

  @override
  String get movies => 'Filmer';

  @override
  String get musicVideos => 'Musikvideor';

  @override
  String get other => 'Andra';

  @override
  String get discography => 'Diskografi';

  @override
  String get similarArtists => 'Liknande artister';

  @override
  String get tableOfContents => 'Innehållsförteckning';

  @override
  String get tracklist => 'Låtlista';

  @override
  String discNumber(int number) {
    return 'Skiva $number';
  }

  @override
  String get biography => 'Biografi';

  @override
  String get authorDetails => 'Författarinformation';

  @override
  String get noOverviewAvailable =>
      'Ingen översikt tillgänglig för denna titel ännu.';

  @override
  String get noBiographyAvailable =>
      'Ingen biografi tillgänglig för denna författare.';

  @override
  String get unableToLoadAuthorDetails =>
      'Det går inte att ladda författarinformation just nu.';

  @override
  String published(int year) {
    return 'Utgiven $year';
  }

  @override
  String get publicationDateUnknown => 'Publiceringsdatum okänt';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count säsonger',
      one: '1 säsong',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Slutar $time';
  }

  @override
  String get items => 'Objekt';

  @override
  String get extras => 'Extramaterial';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Bakom kulisserna';

  @override
  String get deletedScenes => 'Borttagna scener';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Intervjuer';

  @override
  String get scenes => 'Scener';

  @override
  String get shorts => 'Kortfilmer';

  @override
  String get trailers => 'Trailers';

  @override
  String timeRemaining(String time) {
    return '$time kvar';
  }

  @override
  String endsIn(String time) {
    return 'Slutar om $time';
  }

  @override
  String get view => 'Se';

  @override
  String get resumeReading => 'Återuppta läsning';

  @override
  String get read => 'Läsa';

  @override
  String resumeFrom(String position) {
    return 'Återuppta från $position';
  }

  @override
  String get play => 'Spela upp';

  @override
  String get startOver => 'Börja om från början';

  @override
  String get restart => 'Starta om';

  @override
  String get readOffline => 'Läs offline';

  @override
  String get playOffline => 'Spela offline';

  @override
  String get audio => 'Ljud';

  @override
  String get subtitles => 'Undertexter';

  @override
  String get version => 'Version';

  @override
  String get cast => 'Casta';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Färdig';

  @override
  String get favorited => 'Favoritmarkerad';

  @override
  String get favorite => 'Favorit';

  @override
  String get playlist => 'Spellista';

  @override
  String get downloaded => 'Nedladdat';

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
  String get downloadAll => 'Ladda ner alla';

  @override
  String get download => 'Ladda ner';

  @override
  String get deleteDownloaded => 'Ta bort nedladdade';

  @override
  String get goToSeries => 'Gå till serien';

  @override
  String get editMetadata => 'Redigera metadata';

  @override
  String get less => 'Mindre';

  @override
  String get more => 'Mer';

  @override
  String get deleteItem => 'Ta bort objekt';

  @override
  String get deletePlaylist => 'Ta bort spellista';

  @override
  String get deletePlaylistMessage =>
      'Ta bort den här spellistan från servern?';

  @override
  String get deleteItemMessage => 'Ta bort det här objektet från servern?';

  @override
  String get failedToDeletePlaylist => 'Det gick inte att ta bort spellistan';

  @override
  String get failedToDeleteItem => 'Det gick inte att ta bort objektet';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Byt namn på spellistan';

  @override
  String get playlistName => 'Spellistans namn';

  @override
  String get deleteDownloadedAlbum => 'Ta bort nedladdat album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Ta bort nedladdade spår för \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Nedladdade spår raderade';

  @override
  String get downloadedTracksDeleteFailed =>
      'Vissa nedladdade spår kunde inte raderas';

  @override
  String get noTracksLoaded => 'Inga spår laddade';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Inga $itemLabel har lästs in';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Laddar ner $title ($count objekt)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Är du säker på att du vill ta bort \"$name\" från servern? Åtgärden kan inte ångras.';
  }

  @override
  String get itemDeleted => 'Objekt raderade';

  @override
  String get noPlayableTrailerFound => 'Ingen spelbar trailer hittades.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Bokformatet stöds inte: .$extension';
  }

  @override
  String get audioTrack => 'Ljudspår';

  @override
  String get subtitleTrack => 'Undertextspår';

  @override
  String get none => 'Ingen';

  @override
  String get downloadSubtitlesLabel => 'Ladda ner undertexter...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Sök med insticksprogrammet OpenSubtitles';

  @override
  String get downloadSubtitles => 'Ladda ner undertexter';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid => 'Den valda undertexten är ogiltig.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Undertext nedladdad och vald: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Undertext nedladdad. Det kan ta en stund innan Jellyfin uppdaterar objektet.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Inga fjärrundertexter hittades för $language.';
  }

  @override
  String get selectVersion => 'Välj Version';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Ladda ner alla — kvalitet';

  @override
  String get downloadQuality => 'Ladda ner kvalitet';

  @override
  String get originalFileNoReencoding => 'Originalfil, ingen omkodning';

  @override
  String get originalFilesNoReencoding => 'Originalfiler, ingen omkodning';

  @override
  String get noEpisodesLoaded => 'Inga avsnitt laddade';

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
    return 'Laddar ner $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Ta bort nedladdade filer';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Ta bort lokala filer för $typeLabel?\n\nDet frigör lagringsutrymme. Du kan ladda ner dem igen senare.';
  }

  @override
  String get downloadedFilesDeleted => 'Nedladdade filer raderade';

  @override
  String get failedToDeleteFiles => 'Det gick inte att radera filer';

  @override
  String get deleteFiles => 'Ta bort filer';

  @override
  String get director => 'DIREKTÖR';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'REGISSÖRER';

  @override
  String get writer => 'MANUSFÖRFATTARE';

  @override
  String get writers => 'MANUSFÖRFATTARE';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count till';
  }

  @override
  String totalEpisodes(int count) {
    return '$count avsnitt';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Avsnitt $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Kapitel $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spår',
      one: '1 spår',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kapitel',
      one: '1 kapitel',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Född $date';
  }

  @override
  String died(String date) {
    return 'Död $date';
  }

  @override
  String age(int age) {
    return 'Ålder $age';
  }

  @override
  String get showLess => 'Visa mindre';

  @override
  String get readMore => 'Läs mer';

  @override
  String get shuffle => 'Blanda';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Blanda all musik';

  @override
  String get carSignInPrompt => 'Logga in på Moonfin i din telefon';

  @override
  String get carServerUnreachable => 'Kan inte nå din server';

  @override
  String downloadsCount(int count) {
    return '$count nedladdningar';
  }

  @override
  String get perfectMatch => 'Perfekt matchning';

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
    return 'Fjärrundertext $action kräver Jellyfin-behörigheten för undertexthantering för den här användaren.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Objektet kunde inte hittas på servern för fjärrundertext $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Fjärrundertext $action misslyckades: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Fjärrundertext $action misslyckades (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Kunde inte $action fjärrundertexter.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'alla nedladdade avsnitt för \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'alla nedladdade avsnitt under den här säsongen';

  @override
  String get stillWatching => 'Tittar du fortfarande?';

  @override
  String get unableToLoadTrailerStream =>
      'Det gick inte att ladda trailerström.';

  @override
  String get trailerTimedOut => 'Trailern tog timeout under lastning.';

  @override
  String get playbackFailedForTrailer =>
      'Uppspelningen misslyckades för den här trailern.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Casting är inte tillgängligt under offlineuppspelning.';

  @override
  String castActionFailed(String label, String error) {
    return '$label-åtgärden misslyckades: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Kunde inte ställa in volymen för cast: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label-kontroller';
  }

  @override
  String get deviceVolume => 'Enhetsvolym';

  @override
  String get unavailable => 'Inte tillgänglig';

  @override
  String get pause => 'Pausa';

  @override
  String get syncPosition => 'Synkronisera position';

  @override
  String stopCast(String label) {
    return 'Stoppa $label';
  }

  @override
  String get queueIsEmpty => 'Kön är tom';

  @override
  String trackNumber(int number) {
    return 'Spår $number';
  }

  @override
  String get remotePlayback => 'Fjärruppspelning';

  @override
  String get castingToGoogleCast => 'Castar till Google Cast';

  @override
  String get castingViaAirPlay => 'Casta via AirPlay';

  @override
  String get castingViaDlna => 'Casta via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String get longPressToUnlock => 'Långt tryck för att låsa upp';

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
  String get audioDelay => 'Ljudfördröjning';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Undertextfördröjning';

  @override
  String get reset => 'Återställ';

  @override
  String get unknown => 'Okänd';

  @override
  String get playbackInformation => 'Uppspelningsinformation';

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
  String get playback => 'Uppspelning';

  @override
  String get playMethod => 'Spelmetod';

  @override
  String get directPlay => 'Direktspel';

  @override
  String get directStream => 'Direktström';

  @override
  String get transcoding => 'Omkodning';

  @override
  String get transcodeReasons => 'Omkodningsskäl';

  @override
  String get player => 'Spelare';

  @override
  String get container => 'Behållare';

  @override
  String get bitrate => 'Bithastighet';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Upplösning';

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
  String get track => 'Spår';

  @override
  String get channels => 'Kanaler';

  @override
  String get format => 'Formatera';

  @override
  String get external => 'Extern';

  @override
  String get embedded => 'Inbäddad';

  @override
  String castSessionError(String protocol) {
    return '$protocol-sessionsfel';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Kunde inte läsa in bokinformation: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-rendering i appen är inte tillgänglig på den här plattformen ännu.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Det här formatet (.$extension) kan inte visas i appen än.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Inbäddad dokumentrendering är inte tillgänglig på den här plattformen.';

  @override
  String get couldNotOpenExternalViewer =>
      'Det gick inte att öppna extern visningsprogram.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Kunde inte öppna läsaren i appen: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Bokmärket är redan sparat vid $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Bokmärke tillagt: $label';
  }

  @override
  String get noBookmarksYet =>
      'Inga bokmärken än.\nTryck på bokmärkesikonen medan du läser för att spara din position.';

  @override
  String get noTableOfContentsAvailable =>
      'Ingen innehållsförteckning tillgänglig';

  @override
  String pageLabel(int number) {
    return 'Sida $number';
  }

  @override
  String get position => 'Placera';

  @override
  String get bookReader => 'Bokläsare';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% läst';
  }

  @override
  String get updating => 'Uppdaterar...';

  @override
  String get markUnread => 'Markera oläst';

  @override
  String get markAsRead => 'Markera som läst';

  @override
  String get reloadReader => 'Ladda om Reader';

  @override
  String get noPagesFound => 'Inga sidor hittades.';

  @override
  String get failedToDecodePageImage => 'Det gick inte att avkoda sidbilden.';

  @override
  String resetZoom(String zoom) {
    return 'Återställ zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Enstaka sida';

  @override
  String get twoPageSpread => 'Uppslag på två sidor';

  @override
  String get addBookmark => 'Lägg till bokmärke';

  @override
  String get bookmarksEllipsis => 'Bokmärken...';

  @override
  String get markedAsRead => 'Markerad som läst';

  @override
  String get markedAsUnread => 'Markerad som oläst';

  @override
  String failedToUpdateReadState(String error) {
    return 'Kunde inte uppdatera lässtatus: $error';
  }

  @override
  String get themeSystem => 'Tema: System';

  @override
  String get themeLight => 'Tema: Ljus';

  @override
  String get themeDark => 'Tema: Mörkt';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Invertera färger (fast layout)';

  @override
  String get invertColorsPdf => 'Invertera färger (PDF)';

  @override
  String get preparingInAppReader => 'Förbereder läsare i appen...';

  @override
  String get pdfDataNotAvailable => 'PDF-data är inte tillgängliga.';

  @override
  String get readerFallbackModeActive => 'Reservläge för läsare är aktivt';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Den här plattformen kan inte köra den inbyggda dokumentmotorn för $extension-filer.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Använd Reload Reader efter att du har bytt till ett plattformsmål som stöds (Android, iOS, macOS).';

  @override
  String get openExternally => 'Öppna Externt';

  @override
  String get noEpubChaptersFound => 'Inga EPUB-kapitel hittades.';

  @override
  String get readerNotReady => 'Läsaren är inte redo.';

  @override
  String get seriesRecordings => 'Serieinspelningar';

  @override
  String get now => 'Nu';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Nyheter';

  @override
  String get kids => 'Barn';

  @override
  String get premiere => 'Premiär';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Guide Tidslinje';

  @override
  String failedToLoadGuide(String error) {
    return 'Kunde inte läsa in tablån: $error';
  }

  @override
  String get noChannelsFound => 'Inga kanaler hittades';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'BO';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Nästa: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes min kvar';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours tim kvar';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours tim $minutes min kvar';
  }

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Borttagen från favoritkanaler';

  @override
  String get addedToFavoriteChannels => 'Tillagd till favoritkanaler';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Det gick inte att uppdatera favoritkanalen';

  @override
  String get unfavoriteChannel => 'Ofavoritkanal';

  @override
  String get favoriteChannel => 'Favoritkanal';

  @override
  String get record => 'Spela in';

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
  String get cancelRecordingAction => 'Avbryt inspelning';

  @override
  String get programSetToRecord => 'Programmet är inställt för inspelning';

  @override
  String get recordingCancelled => 'Inspelningen avbröts';

  @override
  String get unableToCreateRecording => 'Kunde inte skapa inspelning';

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
  String get watch => 'Titta';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Stäng';

  @override
  String failedToPlayChannel(String name) {
    return 'Kunde inte spela upp $name';
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
  String get failedToLoadRecordings => 'Det gick inte att ladda inspelningar';

  @override
  String get scheduledInNext24Hours =>
      'Schemalagt under de kommande 24 timmarna';

  @override
  String get recentRecordings => 'Senaste inspelningar';

  @override
  String get tvSeries => 'TV-serie';

  @override
  String get failedToLoadSchedule => 'Det gick inte att läsa in schemat';

  @override
  String get noScheduledRecordings => 'Inga schemalagda inspelningar';

  @override
  String get cancelRecording => 'Vill du avbryta inspelningen?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Avbryta schemalagd inspelning av \"$name\"?';
  }

  @override
  String get no => 'Nej';

  @override
  String get yesCancel => 'Ja, avbryt';

  @override
  String get failedToCancelRecording =>
      'Det gick inte att avbryta inspelningen';

  @override
  String get failedToLoadSeriesRecordings =>
      'Det gick inte att ladda serieinspelningar';

  @override
  String get noSeriesRecordings => 'Inga serieinspelningar';

  @override
  String get cancelSeriesRecording => 'Avbryt serieinspelning';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Vill du avbryta serieinspelning?';

  @override
  String stopRecordingName(String name) {
    return 'Sluta spela in \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Det gick inte att avbryta serieinspelning';

  @override
  String get searchThisLibrary => 'Sök i det här biblioteket...';

  @override
  String get searchEllipsis => 'Söka...';

  @override
  String noResultsForQuery(String query) {
    return 'Inga resultat för \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Sökningen misslyckades: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr kontotyp';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokal';

  @override
  String get savedMedia => 'Sparade media';

  @override
  String get tvShows => 'TV-program';

  @override
  String get music => 'Musik';

  @override
  String get musicAlbums => 'Musikalbum';

  @override
  String get noMediaInFilter => 'Inget media i detta filter';

  @override
  String get noDownloadedMediaYet => 'Inga nedladdade media ännu';

  @override
  String get browseLibrary => 'Bläddra i biblioteket';

  @override
  String get deleteDownload => 'Ta bort nedladdning';

  @override
  String removeItemAndFiles(String name) {
    return 'Ta bort \"$name\" och dess filer?';
  }

  @override
  String tracksCount(int count) {
    return '$count spår';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Spela album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Kunde inte läsa in albumet: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Inga nedladdade spår hittades för $name.';
  }

  @override
  String get season => 'Säsong';

  @override
  String get errorLoadingEpisodes => 'Det gick inte att läsa in avsnitt';

  @override
  String get noDownloadedEpisodes => 'Inga nedladdade avsnitt';

  @override
  String get deleteEpisode => 'Ta bort avsnitt';

  @override
  String removeName(String name) {
    return 'Ta bort \"$name\"?';
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
    return 'Avsnitt $number';
  }

  @override
  String get seriesNotFound => 'Serien hittades inte';

  @override
  String get errorLoadingSeries => 'Det gick inte att ladda serien';

  @override
  String get downloadedEpisodes => 'Nedladdade avsnitt';

  @override
  String seasonNumber(int number) {
    return 'Säsong $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Specialerbjudanden';

  @override
  String get deleteSeason => 'Ta bort säsong';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Ta bort alla nedladdade avsnitt i $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count avsnitt',
      one: '1 avsnitt',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Lagringshantering';

  @override
  String get storageBreakdown => 'Lagringsuppdelning';

  @override
  String get downloadedItems => 'Nedladdade objekt';

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
  String get storageLimit => 'Lagringsgräns';

  @override
  String get noLimit => 'Ingen gräns';

  @override
  String get deleteAllDownloads => 'Ta bort alla nedladdningar';

  @override
  String get deleteAllDownloadsWarning =>
      'Detta tar bort alla nedladdade mediefiler och kan inte ångras.';

  @override
  String get deleteAll => 'Ta bort alla';

  @override
  String get deleteSelected => 'Ta bort markerade';

  @override
  String deleteSelectedCount(int count) {
    return 'Ta bort $count nedladdade objekt?';
  }

  @override
  String get musicAndAudiobooks => 'Musik & ljudböcker';

  @override
  String get images => 'Bilder';

  @override
  String get database => 'Databas';

  @override
  String ofStorageLimit(String limit) {
    return 'av gränsen $limit';
  }

  @override
  String get settings => 'Installningar';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Autentisering';

  @override
  String get autoLoginServerManagement =>
      'Automatisk inloggning, serverhantering';

  @override
  String get pinCode => 'PIN-kod';

  @override
  String get setUpPinCodeProtection => 'Ställ in PIN-kodsskydd';

  @override
  String get parentalControls => 'Föräldrakontroll';

  @override
  String get contentRatingRestrictions =>
      'Begränsningar för innehållsklassificering';

  @override
  String get bitRateResolutionBehavior => 'Bithastighet, upplösning, beteende';

  @override
  String get languageSizeAppearance => 'Språk, storlek, utseende';

  @override
  String get qualityStorage => 'Kvalitet, förvaring';

  @override
  String get mediaRequestIntegration => 'Integration av mediaförfrågningar';

  @override
  String get switchServer => 'Byt server';

  @override
  String get signOut => 'Logga ut';

  @override
  String get versionLicenses => 'Version, licenser';

  @override
  String get account => 'Konto';

  @override
  String get signInAndSecurity => 'Inloggning och säkerhet';

  @override
  String get administration => 'Administration';

  @override
  String get serverSettingsUsersLibraries =>
      'Serverinställningar, användare, bibliotek';

  @override
  String get customization => 'Anpassning';

  @override
  String get themeAndLayout => 'Tema och layout';

  @override
  String get videoAndSubtitles => 'Video och undertexter';

  @override
  String get pluginAndRequests => 'Plugin och förfrågningar';

  @override
  String get customizeAccountPlaybackInterface =>
      'Anpassa konto, uppspelning och gränssnittsbeteende';

  @override
  String optionsCount(int count) {
    return '$count alternativ';
  }

  @override
  String get themeAndAppearance => 'Tema & Utseende';

  @override
  String get focusBorderColor => 'Fokus kantfärg';

  @override
  String get watchedIndicators => 'Bevakade indikatorer';

  @override
  String get always => 'Alltid';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Dölj obevakad';

  @override
  String get episodesOnly => 'Endast avsnitt';

  @override
  String get never => 'Aldrig';

  @override
  String get focusExpansionAnimation => 'Animering vid fokusexpansion';

  @override
  String get desktopUiScale => 'Desktop UI-skala';

  @override
  String get scaleFocusedCards =>
      'Skala fokuserade eller svävade kort och brickor';

  @override
  String get seriesThumbnails => 'Serieminiatyrer';

  @override
  String get seriesThumbnailsDescription =>
      'Endast avsnitt: använd seriebilder som matchar varje radbildstyp';

  @override
  String get homeRowInfoOverlay => 'Hemrad infoöverlägg';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Visa titel och metadata när du bläddrar i hemrader';

  @override
  String get clockDisplay => 'Klockdisplay';

  @override
  String get inMenus => 'I menyer';

  @override
  String get inVideo => 'I video';

  @override
  String get seasonalEffects => 'Säsongseffekter';

  @override
  String get seasonalEffectsDescription =>
      'Visuella effekter och säsongsbetonade dekorationer';

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
  String get snow => 'Snö';

  @override
  String get fireworks => 'Fyrverkeri';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Fallande löv';

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
  String get themeMusic => 'Tema musik';

  @override
  String get playThemeMusicOnDetailPages => 'Spela temamusik på detaljsidor';

  @override
  String get themeMusicVolume => 'Tema musikvolym';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Temamusik på Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Spela när du surfar på startskärmen';

  @override
  String get loopThemeMusic => 'Loopa temamusik';

  @override
  String get loopThemeMusicSubtitle =>
      'Upprepa spåret i stället för att spela det en gång';

  @override
  String get detailsBackgroundBlur => 'Detaljer Bakgrundsskärpa';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Bläddrar bakgrundsoskärpa';

  @override
  String get maxStreamingBitrate => 'Max strömningsbithastighet';

  @override
  String get maxResolution => 'Max upplösning';

  @override
  String get playerZoomMode => 'Spelarens zoomläge';

  @override
  String get settingsScrollWheelAction => 'Mushjul';

  @override
  String get settingsScrollWheelActionDescription =>
      'Välj vad som händer när du rullar med mushjulet över videon under uppspelning.';

  @override
  String get scrollWheelActionOff => 'Av';

  @override
  String get scrollWheelActionSeek => 'Spola (framåt/bakåt)';

  @override
  String get scrollWheelActionVolume => 'Volym';

  @override
  String get playerTooltipVolume => 'Volym';

  @override
  String get fit => 'Färdig';

  @override
  String get autoCrop => 'Autobeskärning';

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
  String get stretch => 'Sträcka';

  @override
  String get refreshRateSwitching => 'Byte av uppdateringsfrekvens';

  @override
  String get disabled => 'Inaktiverad';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Skala på TV';

  @override
  String get scaleOnDevice => 'Skala på enheten';

  @override
  String get trickPlay => 'Trickspel';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Visa förhandsgranskningsminiatyrer när du söker';

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
  String get showDescriptionOnPause => 'Visa beskrivning på paus';

  @override
  String get dimVideoShowOverview =>
      'Dimma videon och visa översiktstext medan den är pausad';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'OSD-låsknapp';

  @override
  String get osdLockButtonDescription =>
      'Visa en låsknapp som blockerar beröringsinmatning tills den trycks ner länge';

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
  String get audioBehavior => 'Ljudbeteende';

  @override
  String get downmixToStereo => 'Downmix till stereo';

  @override
  String get defaultAudioLanguage => 'Standardljudspråk';

  @override
  String get fallbackAudioLanguage => 'Reservspråk för ljud';

  @override
  String get preferDefaultAudioTrack => 'Föredra standardljudspår';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Föredra originalljudspåret framför lokaliserad dubbning.';

  @override
  String get preferAudioDescription => 'Föredra syntolkningsspår';

  @override
  String get preferAudioDescriptionDescription =>
      'Föredra syntolkningsspår framför vanliga spår.';

  @override
  String get autoServerDefault => 'Auto (serverstandard)';

  @override
  String get english => 'engelska';

  @override
  String get spanish => 'spanska';

  @override
  String get french => 'franska';

  @override
  String get german => 'tyska';

  @override
  String get italian => 'italienska';

  @override
  String get portuguese => 'portugisiska';

  @override
  String get japanese => 'japanska';

  @override
  String get korean => 'koreanska';

  @override
  String get chinese => 'kinesiska';

  @override
  String get russian => 'ryska';

  @override
  String get arabic => 'arabiska';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'holländska';

  @override
  String get swedish => 'svenska';

  @override
  String get norwegian => 'norska';

  @override
  String get danish => 'danska';

  @override
  String get finnish => 'finska';

  @override
  String get polish => 'polska';

  @override
  String get ac3Passthrough => 'AC3-genomföring';

  @override
  String get dtsPassthrough => 'DTS-genomföring';

  @override
  String get trueHdSupport => 'TrueHD-stöd';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS-ljud endast till AVR; kräver stöd för mottagare och DTS-källspår';

  @override
  String get settingsAudioFallbackCodec => 'Reservcodec för ljud';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Välj målformatet för omkodning av flerkanaligt ljud när källströmmen inte kan direktspelas eller skickas vidare.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Identifiera automatiskt\n(Rekommenderas)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Standard)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Endast stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Effektiv)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Förlustfritt)';

  @override
  String get settingsMaxAudioChannels => 'Max antal ljudkanaler';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Ställ in det maximala antalet kanaler för din ljudanläggning. Flerkanalsströmmar som överskrider gränsen nedmixas eller omkodas.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Identifiera automatiskt\n(Hårdvarustandard)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadrofoni';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (avancerat)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec-passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Aktivera endast format som din AVR eller HDMI-mottagare stöder.';

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
  String get settingsDetectedAudioCapabilities =>
      'Identifierade ljudfunktioner';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Ingen ögonblicksbild av körtidsfunktioner finns än.';

  @override
  String get settingsAudioRouteLabel => 'Ljudväg';

  @override
  String get settingsAudioDecodeLabel => 'Avkodning';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD-ljudväg';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Högtalare';

  @override
  String get settingsAudioRouteHeadphones => 'Hörlurar';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kanaler PCM';
  }

  @override
  String get nightMode => 'Nattläge';

  @override
  String get compressDynamicRange => 'Komprimera dynamiskt område';

  @override
  String get advancedMpv => 'Avancerat mpv';

  @override
  String get enableCustomMpvConf => 'Aktivera anpassad mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Använd en användarspecificerad mpv.conf innan uppspelningen startar';

  @override
  String get unsafeAdvancedMpvOptions => 'Osäkra avancerade mpv-alternativ';

  @override
  String get unsafeMpvOptionsDescription =>
      'Tillåt en bredare uppsättning mpv-alternativ. Kan bryta uppspelningsbeteendet.';

  @override
  String get hardwareDecoding => 'Hårdvaruavkodning';

  @override
  String get hardwareDecodingSubtitle =>
      'Kan förbättra prestandan men kan orsaka uppspelningsproblem på vissa enheter.';

  @override
  String get nextUpAndQueuing => 'Nästa Upp & Kö';

  @override
  String get nextUpDisplay => 'Next Up Beteende';

  @override
  String get extended => 'Förlängd';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Tidsgräns för Näst på tur';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Mediaköer';

  @override
  String get autoQueueNextEpisodes => 'Autokö nästa avsnitt';

  @override
  String get stillWatchingPrompt => 'Tittar fortfarande på Prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Efter $episodes avsnitt / $hours tim';
  }

  @override
  String get resumeAndSkip => 'Återuppta & Hoppa över';

  @override
  String get resumeRewind => 'Fortsätt spola tillbaka';

  @override
  String get unpauseRewind => 'Avbryt spola tillbaka';

  @override
  String get fiveSeconds => '5 sekunder';

  @override
  String get tenSeconds => '10 sekunder';

  @override
  String get fifteenSeconds => '15 sekunder';

  @override
  String get thirtySeconds => '30 sekunder';

  @override
  String get skipBackLength => 'Hoppa tillbaka Längd';

  @override
  String get skipForwardLength => 'Hoppa framåt Längd';

  @override
  String get customMpvConfPath => 'Anpassad mpv.conf sökväg';

  @override
  String get notSetMpvConf =>
      'Inte inställt. Moonfin kommer att prova en standard mpv.conf i app-/datamappar.';

  @override
  String get selectMpvConf => 'Välj mpv.conf';

  @override
  String get pathToMpvConf => '/sökväg/till/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stilinställningar (storlek, färg, offset) gäller för textbaserad undertext (SRT, VTT, TTML). ASS/SSA-undertexter använder sin egen inbäddade stil om inte \"ASS/SSA Direct Play\" är avstängd. Bitmappsundertexter (PGS, DVB, VobSub) kan inte ändras.';

  @override
  String get defaultSubtitleLanguage => 'Standardspråk för textning';

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
  String get defaultToNoSubtitles => 'Standard är Inga undertexter';

  @override
  String get turnOffSubtitlesByDefault => 'Stäng av undertexter som standard';

  @override
  String get subtitleSize => 'Undertextstorlek';

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
  String get textFillColor => 'Text fyllningsfärg';

  @override
  String get backgroundColor => 'Bakgrundsfärg';

  @override
  String get textStrokeColor => 'Text Stroke Färg';

  @override
  String get subtitleCustomization => 'Anpassning av undertexter';

  @override
  String get subtitleCustomizationDescription =>
      'Anpassa undertexternas utseende';

  @override
  String get subtitleMode => 'Undertextläge';

  @override
  String get subtitleModeFlagged => 'Flaggade';

  @override
  String get subtitleModeAlways => 'Alltid';

  @override
  String get subtitleModeForeign => 'Främmande språk';

  @override
  String get subtitleModeForced => 'Tvingade';

  @override
  String get subtitleModeFlaggedDescription =>
      'Spelar spår som internt är flaggade som \"default\" eller \"forced\" i mediefilens metadata.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Läser automatiskt in och visar undertexter varje gång en video startar.';

  @override
  String get subtitleModeForeignDescription =>
      'Slår automatiskt på undertexter om standardljudspåret är på ett främmande språk.';

  @override
  String get subtitleModeForcedDescription =>
      'Läser bara in undertexter som uttryckligen är märkta med flaggan forced.';

  @override
  String get subtitleModeNoneDescription =>
      'Inaktiverar automatisk inläsning av undertexter helt.';

  @override
  String get fallbackSubtitleLanguage => 'Reservspråk för undertexter';

  @override
  String get subtitleStream => 'Undertextström';

  @override
  String get subtitlePreviewText =>
      'Den kvicka bruna räven hoppar över den lata hunden';

  @override
  String get verticalOffset => 'Vertikal offset';

  @override
  String get pgsDirectPlay => 'PGS direktspel';

  @override
  String get directPlayPgsSubtitles => 'Spela PGS-undertexter direkt';

  @override
  String get assSsaDirectPlay => 'ASS/SSA direktspel';

  @override
  String get directPlayAssSsaSubtitles => 'Spela ASS/SSA undertexter direkt';

  @override
  String get white => 'Vit';

  @override
  String get black => 'Svart';

  @override
  String get yellow => 'Gul';

  @override
  String get green => 'Grön';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'Röd';

  @override
  String get transparent => 'Transparent';

  @override
  String get semiTransparentBlack => 'Halvtransparent Svart';

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
  String get desktop => 'Skrivbord';

  @override
  String get mobile => 'Mobil';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Inställningar för profilen $profile har lästs in.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Kunde inte läsa in inställningar för profilen $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Lokala inställningar har synkats till profilen $profile.';
  }

  @override
  String get syncing => 'Synkroniseras...';

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
  String get profileSyncHidden => 'Profilsynkronisering dold';

  @override
  String get enablePluginSyncDescription =>
      'Aktivera Server Plugin Sync i Plugin-inställningarna för att visa profilkontroller här.';

  @override
  String get quality => 'Kvalitet';

  @override
  String get defaultDownloadQuality => 'Standard nedladdningskvalitet';

  @override
  String get network => 'Nätverk';

  @override
  String get wifiOnlyDownloads => 'Endast WiFi-nedladdningar';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Visa nedladdningar på servern';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Låt serveradministratören se dina omkodade nedladdningar i kontrollpanelen';

  @override
  String get onlyDownloadOnWifi =>
      'Ladda bara ned när du är ansluten till WiFi';

  @override
  String get storage => 'Lagring';

  @override
  String get storageUsed => 'Förvaring används';

  @override
  String get manage => 'Hantera';

  @override
  String get calculating => 'Beräknande...';

  @override
  String get downloadLocation => 'Nedladdningsplats';

  @override
  String get defaultLabel => 'Standard';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Spara i mappen Nedladdningar';

  @override
  String get downloadsVisibleToOtherApps =>
      'Nedladdningar/Moonfin — synlig för andra appar';

  @override
  String get dangerZone => 'Riskzon';

  @override
  String get clearAllDownloads => 'Rensa alla nedladdningar';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Ändra nedladdningsplats';

  @override
  String get changeDownloadLocationDescription =>
      'Nya nedladdningar sparas i den valda mappen. Befintliga nedladdningar kommer att finnas kvar på sin nuvarande plats och kan hanteras från lagringsinställningarna.';

  @override
  String get confirm => 'Bekräfta';

  @override
  String get cannotWriteToFolder =>
      'Det går inte att skriva till den valda mappen. Välj en annan plats eller ge lagringsbehörigheter.';

  @override
  String get saveToDownloadsFolderQuestion => 'Spara i mappen Nedladdningar?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Nedladdade media kommer att sparas till Downloads/Moonfin på din enhet. Dessa filer kommer att vara synliga för andra appar som ditt galleri eller din musikspelare.\n\nBefintliga nedladdningar kommer att finnas kvar på sin nuvarande plats.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Aktivera';

  @override
  String get clearAllDownloadsWarning =>
      'Detta kommer att radera alla nedladdade media och kan inte ångras.';

  @override
  String get clearAll => 'Rensa alla';

  @override
  String get navigationStyle => 'Navigationsstil';

  @override
  String get topBar => 'Övre fält';

  @override
  String get leftSidebar => 'Vänster sidofält';

  @override
  String get showShuffleButton => 'Visa Shuffle-knappen';

  @override
  String get showGenresButton => 'Knappen Visa genrer';

  @override
  String get showFavoritesButton => 'Knappen Visa favoriter';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Visa bibliotek i verktygsfältet';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'Visa alltid etiketter i navigeringsfältet';

  @override
  String get showSeerrButton => 'Visa Seerr-knapp';

  @override
  String get navbarOpacity => 'Navbar Opacitet';

  @override
  String get navbarColor => 'Navbar färg';

  @override
  String get gray => 'Grå';

  @override
  String get darkBlue => 'Mörkblå';

  @override
  String get purple => 'Purpur';

  @override
  String get teal => 'Kricka';

  @override
  String get navy => 'Marin';

  @override
  String get charcoal => 'Kol';

  @override
  String get brown => 'Brun';

  @override
  String get darkRed => 'Mörkröd';

  @override
  String get darkGreen => 'Mörkgrön';

  @override
  String get slate => 'Skiffer';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Biblioteksvisning';

  @override
  String get posterLabel => 'Affisch';

  @override
  String get thumbnailLabel => 'Miniatyrbild';

  @override
  String get bannerLabel => 'Baner';

  @override
  String get overridePerLibrarySettings =>
      'Åsidosätt inställningarna per bibliotek';

  @override
  String get applyImageTypeToAllLibraries =>
      'Tillämpa bildtyp på alla bibliotek';

  @override
  String get multiServerLibraries => 'Bibliotek med flera servrar';

  @override
  String get showLibrariesFromAllServers =>
      'Visa bibliotek från alla anslutna servrar';

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
  String get groupItemsIntoCollections => 'Gruppera objekt i samlingar';

  @override
  String get hideCollectionAssociatedItems =>
      'Dölj biblioteksobjekt som hör till en samling när du bläddrar i bibliotek';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'Om biblioteksgruppering';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'För att kunna använda den här inställningen måste biblioteksinställningarna \"Group movies into collections\" och/eller \"Group shows into collections\" vara aktiverade under bibliotekets visningsinställningar på din Jellyfin- eller Emby-server.';

  @override
  String get libraryVisibility => 'Bibliotekets synlighet';

  @override
  String get libraryVisibilityDescription =>
      'Växla hemsidans synlighet per bibliotek. Starta om Moonfin för att ändringarna ska träda i kraft.';

  @override
  String get showInNavigation => 'Visa i navigering';

  @override
  String get showInLatestMedia => 'Visa i senaste media';

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
  String get sourceLibraries => 'Källbibliotek';

  @override
  String get sourceCollections => 'Källsamlingar';

  @override
  String get excludedGenres => 'Exkluderade genrer';

  @override
  String get selectAll => 'Välj Alla';

  @override
  String itemsSelected(int count) {
    return '$count valda';
  }

  @override
  String get mediaBar => 'Mediefält';

  @override
  String get mediaSources => 'Mediekällor';

  @override
  String get behavior => 'Beteende';

  @override
  String get seconds => 'sekunder';

  @override
  String get mediaBarMode => 'Mediefaltsstil';

  @override
  String get mediaBarModeDescription =>
      'Välj mellan olika mediefältsstilar eller stäng av mediefältet';

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
  String get enableMediaBar => 'Aktivera Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Visa bildspel med utvalt innehåll hemma';

  @override
  String get contentType => 'Innehållstyp';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Filmer och TV-program';

  @override
  String get moviesOnly => 'Endast filmer';

  @override
  String get tvShowsOnly => 'Endast TV-program';

  @override
  String get itemCount => 'Antal föremål';

  @override
  String get noneSelected => 'Ingen vald';

  @override
  String get noneExcluded => 'Ingen utesluten';

  @override
  String get autoAdvance => 'Automatisk förflyttning';

  @override
  String get autoAdvanceSlides => 'Gå automatiskt vidare till nästa bild';

  @override
  String get autoAdvanceInterval => 'Autoavanceringsintervall';

  @override
  String get trailerPreview => 'Förhandsvisning av trailer';

  @override
  String get autoPlayTrailers =>
      'Spela upp trailers automatiskt i mediafältet efter 3 sekunder';

  @override
  String get trailerAudio => 'Trailerljud';

  @override
  String get enableTrailerAudio => 'Aktivera ljud för trailers i mediefältet';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Förhandsvisning av avsnitt';

  @override
  String get mediaPreview => 'Medieforhandsvisning';

  @override
  String get episodePreviewDescription =>
      'Spela en 30-sekunders inline-förhandsvisning på fokuserade, svävade eller långtryckta kort';

  @override
  String get mediaPreviewDescription =>
      'Spela en 30-sekunders inline-förhandsvisning på fokuserade, svävade eller långtryckta kort';

  @override
  String get previewAudio => 'Förhandsgranska ljud';

  @override
  String get enablePreviewAudio =>
      'Aktivera ljud för förhandsvisningar av trailer och avsnitt';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Senaste media';

  @override
  String get recentlyReleased => 'Nyligen släppt';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Mina media';

  @override
  String get myMediaSmall => 'Mina media (liten)';

  @override
  String get continueWatching => 'Fortsätt titta';

  @override
  String get resumeAudio => 'Återuppta ljud';

  @override
  String get resumeBooks => 'CV Böcker';

  @override
  String get activeRecordings => 'Aktiva inspelningar';

  @override
  String get playlists => 'Spellistor';

  @override
  String get liveTV => 'Direktsänd TV';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Återställ till standardinställningar';

  @override
  String get homeRowPosterSize => 'Hemrad affischstorlek';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurera bildtyp för varje aktiverad hemrad';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Slå samman Fortsätt titta och Nästa';

  @override
  String get combineBothRows =>
      'Kombinera båda raderna till en enda hemsektion';

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
  String get fullScreenRows => 'Expanderade hemrader';

  @override
  String get fullScreenRowsDescription =>
      'Begränsa hemrader till 1 rad per skärm';

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
  String get perRowSettings => 'Inställningar per rad';

  @override
  String get autoLogin => 'Automatisk inloggning';

  @override
  String get lastUser => 'Senaste användare';

  @override
  String get currentUser => 'Nuvarande användare';

  @override
  String get alwaysAuthenticate => 'Autentisera alltid';

  @override
  String get requirePasswordWithToken => 'Kräv lösenord även med lagrad token';

  @override
  String get confirmExit => 'Bekräfta utgång';

  @override
  String get showConfirmationBeforeExiting =>
      'Visa bekräftelse innan du avslutar';

  @override
  String get blockContentWithRatings => 'Blockera innehåll med följande betyg:';

  @override
  String get noContentRatingsFound =>
      'Inga innehållsklassificeringar har hittats på den här servern ännu.';

  @override
  String get couldNotLoadServerRatings =>
      'Kunde inte läsa in serverklassificeringar. Visar endast sparade betyg.';

  @override
  String get couldNotRefreshRatings =>
      'Det gick inte att uppdatera betyg från servern. Visar sparade betyg.';

  @override
  String get enablePinCode => 'Aktivera PIN-kod';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess =>
      'Kräv en PIN-kod för att komma åt ditt konto';

  @override
  String get changePin => 'Ändra PIN-kod';

  @override
  String get setNewPinCode => 'Ställ in en ny PIN-kod';

  @override
  String get removePin => 'Ta bort PIN-koden';

  @override
  String get removePinProtection => 'Ta bort PIN-kodsskyddet';

  @override
  String get screensaver => 'Skärmsläckare';

  @override
  String get inAppScreensaver => 'Skärmsläckare i appen';

  @override
  String get enableBuiltInScreensaver => 'Aktivera den inbyggda skärmsläckaren';

  @override
  String get mode => 'Läge';

  @override
  String get libraryArt => 'Bibliotekskonst';

  @override
  String get logo => 'Logotyp';

  @override
  String get clock => 'Klocka';

  @override
  String get timeout => 'Tidsgräns';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Dimningsnivå';

  @override
  String get maxAgeRating => 'Max åldersbetyg';

  @override
  String get any => 'Några';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Kräv åldersklassificering';

  @override
  String get onlyShowRatedContent => 'Visa endast betygsatt innehåll';

  @override
  String get displayClockDuringScreensaver =>
      'Visa klockan under skärmsläckare';

  @override
  String get clockModeStatic => 'Statisk';

  @override
  String get clockModeBouncing => 'Studsande';

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
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Kritiker)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (publik)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritisk';

  @override
  String get metacriticUser => 'Metacritic (användare)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Gemenskapsbetyg';

  @override
  String get ratings => 'Betyg';

  @override
  String get additionalRatings => 'Ytterligare betyg';

  @override
  String get showMdbListAndTmdbRatings => 'Visa MDBList- och TMDB-betyg';

  @override
  String get ratingLabels => 'Betygsetiketter';

  @override
  String get showLabelsNextToIcons => 'Visa etiketter bredvid betygsikoner';

  @override
  String get ratingBadges => 'Betygsmärken';

  @override
  String get showDecorativeBadges => 'Visa dekorativa märken bakom betyg';

  @override
  String get episodeRatings => 'Avsnittsbetyg';

  @override
  String get showRatingsOnEpisodes => 'Visa betyg på enskilda avsnitt';

  @override
  String get ratingSources => 'Betygskällor';

  @override
  String get ratingSourcesDescription =>
      'Aktivera och ändra ordning på betygskällorna som visas i appen';

  @override
  String get pluginDetected => 'Plugin upptäckt';

  @override
  String get pluginNotDetected => 'Plugin inte upptäckt';

  @override
  String get pluginNotDetectedDescription =>
      'Serverplugin identifieras för närvarande inte. Lokala inställningar använder fortfarande sina sparade värden eller inbyggda standardvärden.';

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
  String get recentRequests => 'Senaste förfrågningar';

  @override
  String get recentlyAdded => 'Nyligen tillagd';

  @override
  String get trending => 'Trendigt';

  @override
  String get popularMovies => 'Populära filmer';

  @override
  String get movieGenres => 'Filmgenrer';

  @override
  String get upcomingMovies => 'Kommande filmer';

  @override
  String get studios => 'Studior';

  @override
  String get popularSeries => 'Populär serie';

  @override
  String get seriesGenres => 'Seriegenrer';

  @override
  String get upcomingSeries => 'Kommande serie';

  @override
  String get networks => 'Nätverk';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Seerr-upptäcktsrader';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults => 'Återställ rader till standardvärden';

  @override
  String get enableSeerr => 'Aktivera Seerr';

  @override
  String get showSeerrInNavigation =>
      'Visa Seerr i navigering (kräver serverplugin)';

  @override
  String get seerrUnavailable =>
      'Ej tillgänglig eftersom serverplugin Seerr-stöd är inaktiverat.';

  @override
  String get nsfwFilter => 'NSFW-filter';

  @override
  String get hideAdultContent => 'Dölj barnförbjudet innehåll i resultaten';

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
  String get seerrNotificationsSection => 'Aviseringar';

  @override
  String get seerrNotifyNewRequestsTitle => 'Aviseringar om nya förfrågningar';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Meddela mig när någon skickar en förfrågan';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Uppdateringar om förfrågningar';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Godkända, nekade och tillagda i ditt bibliotek';

  @override
  String get seerrNotifyIssuesTitle => 'Uppdateringar om problem';

  @override
  String get seerrNotifyIssuesSubtitle => 'Nya problem, svar och lösningar';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Inloggad som: $username';
  }

  @override
  String get discoverRows => 'Seerr-upptäcktssida';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Aktivera raderna du vill se på Seerrs startsida. Dra för att ändra ordning. Den anpassade ordningen synkroniseras med Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Aktivera raderna du vill se på Seerrs startsida. Dra för att ändra ordning. Den anpassade ordningen synkroniseras med Moonbase.';

  @override
  String get enabled => 'Aktiverad';

  @override
  String get hidden => 'Dold';

  @override
  String get aboutTitle => 'Om';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Open Source-licenser';

  @override
  String get sourceCode => 'Källkod';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Sök efter uppdateringar nu';

  @override
  String get checksLatestDesktopRelease =>
      'Kontrollerar senaste skrivbordsversionen för den här plattformen';

  @override
  String get youAreUpToDate => 'Du är uppdaterad.';

  @override
  String get couldNotCheckForUpdates =>
      'Det gick inte att söka efter uppdateringar just nu.';

  @override
  String get noCompatibleUpdate =>
      'Inget kompatibelt uppdateringspaket hittades för den här plattformen.';

  @override
  String get updateChecksNotSupported =>
      'Uppdateringskontroller stöds inte på den här plattformen.';

  @override
  String get updateNotificationsDisabled =>
      'Uppdateringsmeddelanden är inaktiverade.';

  @override
  String get pleaseWaitBeforeChecking => 'Vänta innan du kontrollerar igen.';

  @override
  String get latestUpdateAlreadyShown => 'Senaste uppdateringen visades redan.';

  @override
  String get updateAvailable => 'Uppdatering tillgänglig.';

  @override
  String updateAvailableVersion(String version) {
    return 'Uppdatering tillgänglig: v$version';
  }

  @override
  String get updateNotifications => 'Uppdatera aviseringar';

  @override
  String get showWhenUpdatesAvailable =>
      'Visa när uppdateringar är tillgängliga';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version finns tillgänglig';
  }

  @override
  String get readReleaseNotes => 'Läs Release Notes';

  @override
  String get downloadingUpdate => 'Laddar ned uppdatering...';

  @override
  String get updateDownloadFailed =>
      'Uppdateringsnedladdningen misslyckades. Försök igen.';

  @override
  String get openReleasesPage => 'Öppna versionssidan';

  @override
  String get navigation => 'Navigering';

  @override
  String get watchedIndicatorsBackdrops => 'Bevakade indikatorer, bakgrunder';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokusfärg, bevakade indikatorer, bakgrunder';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar stil, verktygsfältsknappar, utseende';

  @override
  String get featuredContentAppearance => 'Utvalt innehåll, utseende';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Gräns för bildcache';

  @override
  String get clearImageCache => 'Rensa bildcache';

  @override
  String get imageCacheCleared => 'Bildcachen har rensats';

  @override
  String get clear => 'Rensa';

  @override
  String get browse => 'Bläddra';

  @override
  String get noResults => 'Inga resultat';

  @override
  String get seerrAvailableStatus => 'Tillgänglig';

  @override
  String get seerrRequestedStatus => 'Begärde';

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
    return 'Laddar ner · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importerar';

  @override
  String itemsCount(int count) {
    return '$count objekt';
  }

  @override
  String get seerrSettings => 'Seerr-inställningar';

  @override
  String get requestMore => 'Begär mer';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Begäran';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Avbryt begäran';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Spela i Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Efterfrågad av $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Godkänna';

  @override
  String get declineAction => 'Nedgång';

  @override
  String get similar => 'Liknande';

  @override
  String get recommendations => 'Rekommendationer';

  @override
  String cancelRequestForTitle(String title) {
    return 'Avbryta förfrågan om \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Avbryta $count förfrågningar om \"$title\"?';
  }

  @override
  String get keep => 'Hålla';

  @override
  String get itemNotFoundInLibrary =>
      'Objektet hittades inte i ditt Moonfin-bibliotek';

  @override
  String get errorSearchingLibrary => 'Det gick inte att söka i biblioteket';

  @override
  String budgetAmount(String amount) {
    return 'Budget: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Intäkter: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Efterfråga $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Skicka in förfrågan';

  @override
  String get allSeasons => 'Alla årstider';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Avancerade alternativ';

  @override
  String get noServiceServersConfigured =>
      'Inga tjänstservrar har konfigurerats';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Kvalitetsprofil';

  @override
  String get rootFolder => 'Rotmapp';

  @override
  String get showMore => 'Visa mer';

  @override
  String get appearances => 'Medverkan';

  @override
  String get crewSection => 'Besättning';

  @override
  String ageValue(int age) {
    return 'ålder $age';
  }

  @override
  String get noRequests => 'Inga förfrågningar';

  @override
  String get pendingStatus => 'I avvaktan på';

  @override
  String get declinedStatus => 'Avböjde';

  @override
  String get partiallyAvailable => 'Delvis tillgänglig';

  @override
  String get downloadingStatus => 'Laddar ner';

  @override
  String get approvedStatus => 'Godkänd';

  @override
  String get notRequestedStatus => 'Ej efterfrågad';

  @override
  String get blocklistedStatus => 'Blockerad';

  @override
  String get deletedStatus => 'Raderad';

  @override
  String get failedStatus => 'Misslyckades';

  @override
  String get processingStatus => 'Bearbetas';

  @override
  String modifiedByName(String name) {
    return 'Ändrad av $name';
  }

  @override
  String get completedStatus => 'Slutförd';

  @override
  String get requestErrorDuplicate => 'Titeln har redan efterfrågats';

  @override
  String get requestErrorQuota => 'Gränsen för förfrågningar har nåtts';

  @override
  String get requestErrorBlocklisted => 'Titeln är blockerad';

  @override
  String get requestErrorNoSeasons => 'Inga säsonger kvar att efterfråga';

  @override
  String get requestErrorPermission =>
      'Du har inte behörighet att göra den här förfrågan';

  @override
  String get seerrRequestsTitle => 'Förfrågningar';

  @override
  String get seerrIssuesTitle => 'Problem';

  @override
  String get sortNewest => 'Nyast';

  @override
  String get sortLastModified => 'Senast ändrad';

  @override
  String get noIssues => 'Inga problem';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining av $limit filmförfrågningar kvar';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining av $limit säsongsförfrågningar kvar';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Del av $name';
  }

  @override
  String get viewCollection => 'Visa samling';

  @override
  String get requestCollection => 'Efterfråga samling';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmer · $available tillgängliga';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Efterfråga $count filmer';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Efterfrågar $current av $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Efterfrågade $count filmer';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Efterfrågade $ok av $total filmer';
  }

  @override
  String get collectionAllRequested =>
      'Alla filmer är redan tillgängliga eller efterfrågade';

  @override
  String get reportIssue => 'Rapportera problem';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Ljud';

  @override
  String get whatsWrong => 'Vad är fel?';

  @override
  String get allEpisodes => 'Alla avsnitt';

  @override
  String get episode => 'Avsnitt';

  @override
  String get openStatus => 'Öppen';

  @override
  String get resolvedStatus => 'Löst';

  @override
  String get resolveAction => 'Lös';

  @override
  String get reopenAction => 'Öppna igen';

  @override
  String reportedByName(String name) {
    return 'Rapporterat av $name';
  }

  @override
  String commentsCount(int count) {
    return '$count kommentarer';
  }

  @override
  String get addComment => 'Lägg till en kommentar';

  @override
  String get deleteIssueConfirm => 'Ta bort det här problemet?';

  @override
  String get submitReport => 'Skicka rapport';

  @override
  String get tmdbScore => 'TMDB-poäng';

  @override
  String get releaseDateLabel => 'Releasedatum';

  @override
  String get firstAirDateLabel => 'Första sändningsdatum';

  @override
  String get revenueLabel => 'Inkomst';

  @override
  String get runtimeLabel => 'Körning';

  @override
  String get budgetLabel => 'Budget';

  @override
  String get originalLanguageLabel => 'Originalspråk';

  @override
  String get seasonsLabel => 'Säsonger';

  @override
  String get episodesLabel => 'Avsnitt';

  @override
  String get access => 'Tillträde';

  @override
  String get add => 'Lägg till';

  @override
  String get address => 'Adress';

  @override
  String get analytics => 'Analys';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Innehåll';

  @override
  String get copy => 'Kopiera';

  @override
  String get create => 'Skapa';

  @override
  String get disable => 'Inaktivera';

  @override
  String get done => 'Klar';

  @override
  String get edit => 'Redigera';

  @override
  String get encoding => 'Kodning';

  @override
  String get error => 'Fel';

  @override
  String get forward => 'Framåt';

  @override
  String get general => 'Allmänt';

  @override
  String get go => 'Gå';

  @override
  String get install => 'Installera';

  @override
  String get installed => 'Installerad';

  @override
  String get interval => 'Intervall';

  @override
  String get name => 'Namn';

  @override
  String get networking => 'Nätverk';

  @override
  String get next => 'Nästa';

  @override
  String get path => 'Väg';

  @override
  String get paused => 'Pausad';

  @override
  String get permissions => 'Behörigheter';

  @override
  String get processing => 'Bearbetning';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Leverantör';

  @override
  String get refresh => 'Uppdatera';

  @override
  String get remote => 'Fjärrkontroll';

  @override
  String get rename => 'Döpa om';

  @override
  String get revoke => 'Återkalla';

  @override
  String get role => 'Roll';

  @override
  String get root => 'Rot';

  @override
  String get run => 'Sikt';

  @override
  String get search => 'Sök';

  @override
  String get select => 'Välja';

  @override
  String get send => 'Skicka';

  @override
  String get sessions => 'Sessioner';

  @override
  String get set => 'Uppsättning';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Stoppa';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Tid';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Avinstallera';

  @override
  String get up => 'Upp';

  @override
  String get update => 'Uppdatera';

  @override
  String get upload => 'Ladda upp';

  @override
  String get unmute => 'Slå på ljudet';

  @override
  String get mute => 'Ljud av';

  @override
  String get branding => 'Varumärke';

  @override
  String get adminDrawerDashboard => 'Instrumentpanel';

  @override
  String get adminDrawerAnalytics => 'Analys';

  @override
  String get adminDrawerSettings => 'Inställningar';

  @override
  String get adminDrawerBranding => 'Varumärke';

  @override
  String get adminDrawerUsers => 'Användare';

  @override
  String get adminDrawerLibraries => 'Bibliotek';

  @override
  String get adminDrawerDisplay => 'Visning';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO-inställningar';

  @override
  String get adminDrawerTranscoding => 'Omkodning';

  @override
  String get adminDrawerResume => 'Återuppta';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Enheter';

  @override
  String get adminDrawerActivity => 'Aktivitet';

  @override
  String get adminDrawerNetworking => 'Nätverk';

  @override
  String get adminDrawerApiKeys => 'API-nycklar';

  @override
  String get adminDrawerBackups => 'Säkerhetskopieringar';

  @override
  String get adminDrawerLogs => 'Loggar';

  @override
  String get adminDrawerScheduledTasks => 'Schemalagda uppgifter';

  @override
  String get adminDrawerPlugins => 'Plugins';

  @override
  String get adminDrawerRepositories => 'Förvar';

  @override
  String get adminDrawerLiveTv => 'Direktsänd TV';

  @override
  String get adminExitTooltip => 'Avsluta Admin';

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
      'Det gick inte att läsa in instrumentpanelen';

  @override
  String get adminMediaOverview => 'Mediaöversikt';

  @override
  String get adminMediaTotalsError =>
      'Det gick inte att ladda serverns mediatotal.';

  @override
  String get adminMediaOverviewSubtitle =>
      'En snabb läsning om hur mycket innehåll som finns på denna server.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Pluginuppdateringar tillgängliga: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins som kräver omstart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Misslyckade schemalagda uppgifter: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Mediedistribution';

  @override
  String get analyticsVideoCodecs => 'Videocodec';

  @override
  String get analyticsAudioCodecs => 'Ljudkodekar';

  @override
  String get analyticsContainers => 'Behållare';

  @override
  String get analyticsTopGenres => 'Toppgenrer';

  @override
  String get analyticsReleaseYears => 'Utgivningsår';

  @override
  String get analyticsContentRatings => 'Innehållsklassificeringar';

  @override
  String get analyticsRuntimeBuckets => 'Speltidsintervall';

  @override
  String get analyticsFileFormats => 'Filformat';

  @override
  String get analyticsNoData => 'Ingen data tillgänglig.';

  @override
  String get adminServerInfo => 'Serverinfo';

  @override
  String get adminRestartPending => 'Omstart väntar';

  @override
  String get adminServerPaths => 'Servervägar';

  @override
  String get adminServerActions => 'Serveråtgärder';

  @override
  String get adminRestartServer => 'Starta om servern';

  @override
  String get adminShutdownServer => 'Stäng av server';

  @override
  String get adminLibraryScanStarted => 'Biblioteksskanning startade';

  @override
  String errorGeneric(String error) {
    return 'Fel: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Serverns omstart pågår';

  @override
  String get adminServerRebootMessage =>
      'Serverns omstart pågår, starta om Moonfin';

  @override
  String get adminActiveSessions => 'Aktiva sessioner';

  @override
  String get adminSessionsLoadFailed => 'Det gick inte att läsa in sessioner';

  @override
  String get adminNoActiveSessions => 'Inga aktiva sessioner';

  @override
  String get adminRecentActivity => 'Senaste aktivitet';

  @override
  String get adminNoRecentActivity => 'Ingen senaste aktivitet';

  @override
  String adminCommandFailed(String error) {
    return 'Kommandot misslyckades: $error';
  }

  @override
  String get adminSendMessage => 'Skicka meddelande';

  @override
  String get adminMessageTextHint => 'Meddelandetext';

  @override
  String get adminSetVolume => 'Ställ in volym';

  @override
  String get sessionPrev => 'Föreg';

  @override
  String get sessionRewind => 'Spola tillbaka';

  @override
  String get sessionForward => 'Framåt';

  @override
  String get sessionNext => 'Nästa';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Spelar nu';

  @override
  String get volume => 'Volym';

  @override
  String get actions => 'Åtgärder';

  @override
  String get videoCodec => 'Videocodec';

  @override
  String get audioCodec => 'Ljudcodec';

  @override
  String get hwAccel => 'HW-accel';

  @override
  String get completion => 'Komplettering';

  @override
  String get adminClearDates => 'Klara datum';

  @override
  String get adminActivitySeverityAll => 'Alla allvarlighetsgrader';

  @override
  String get adminActivityDateRange => 'Datumintervall';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Kunde inte läsa in aktivitetsloggen: $error';
  }

  @override
  String get adminNoActivityEntries => 'Inga aktivitetsposter';

  @override
  String get adminEditDeviceName => 'Redigera enhetsnamn';

  @override
  String get adminCustomName => 'Anpassat namn';

  @override
  String get adminDeviceNameUpdated => 'Enhetsnamnet har uppdaterats';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Kunde inte uppdatera enheten: $error';
  }

  @override
  String get adminDeleteDevice => 'Ta bort enhet';

  @override
  String get adminDeviceDeleted => 'Enheten har tagits bort';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Kunde inte ta bort enheten: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Ta bort enheten \'$name\'? Användaren måste logga in igen på den här enheten.';
  }

  @override
  String get adminDeleteAllDevices => 'Ta bort alla enheter';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Ta bort $count enheter? Berörda användare måste logga in igen. Din nuvarande enhet påverkas inte.';
  }

  @override
  String get adminDevicesDeletedAll => 'Enheterna har tagits bort';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Vissa enheter togs bort; $count kunde inte tas bort.';
  }

  @override
  String get adminDevicesLoadFailed => 'Det gick inte att läsa in enheter';

  @override
  String get adminSearchDevices => 'Sök enheter';

  @override
  String get adminThisDevice => 'Denna enhet';

  @override
  String get adminEditName => 'Redigera namn';

  @override
  String get adminLibrariesLoadFailed => 'Det gick inte att läsa in bibliotek';

  @override
  String get adminNoLibraries => 'Inga bibliotek har konfigurerats';

  @override
  String get adminScanAllLibraries => 'Skanna alla bibliotek';

  @override
  String get adminAddLibrary => 'Lägg till bibliotek';

  @override
  String adminScanFailed(String error) {
    return 'Kunde inte starta genomsökningen: $error';
  }

  @override
  String get adminRenameLibrary => 'Byt namn på bibliotek';

  @override
  String get adminNewName => 'Nytt namn';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteket har bytt namn till \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Kunde inte byta namn: $error';
  }

  @override
  String get adminDeleteLibrary => 'Ta bort bibliotek';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteket \"$name\" har tagits bort';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Kunde inte ta bort biblioteket: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Kunde inte lägga till sökvägen: $error';
  }

  @override
  String get adminRemovePath => 'Ta bort sökväg';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Ta bort \"$path\" från det här biblioteket?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Kunde inte ta bort sökvägen: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Det gick inte att läsa in biblioteket';

  @override
  String get adminNoMediaPaths => 'Inga mediasökvägar har konfigurerats';

  @override
  String get adminAddPath => 'Lägg till sökväg';

  @override
  String get adminBrowseFilesystem => 'Bläddra i serverns filsystem:';

  @override
  String get adminPreferredMetadataLanguage => 'Önskat metadataspråk';

  @override
  String get adminMetadataLanguageHint => 'till exempel sv, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadata landskod';

  @override
  String get adminMetadataCountryHint => 'till exempel USA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Sökvägar';

  @override
  String get adminLibraryTabOptions => 'Alternativ';

  @override
  String get adminLibraryTabDownloaders => 'Nedladdare';

  @override
  String get adminLibMetadataSavers => 'Metadatasparare';

  @override
  String get adminLibSubtitleDownloaders => 'Undertextnedladdare';

  @override
  String get adminLibLyricDownloaders => 'Låttextnedladdare';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadatanedladdare: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Bildhämtare: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Servern erbjuder inga nedladdare för den här bibliotekstypen.';

  @override
  String get adminLibrarySectionGeneral => 'Allmänt';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Inbäddad information';

  @override
  String get adminLibrarySectionSubtitles => 'Undertexter';

  @override
  String get adminLibrarySectionImages => 'Bilder';

  @override
  String get adminLibrarySectionSeries => 'Serier';

  @override
  String get adminLibrarySectionMusic => 'Musik';

  @override
  String get adminLibrarySectionMovies => 'Filmer';

  @override
  String get adminLibRealtimeMonitor => 'Aktivera realtidsövervakning';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Upptäck filändringar och behandla dem automatiskt.';

  @override
  String get adminLibEnablePhotos => 'Visa foton';

  @override
  String get adminLibSaveLocalMetadata => 'Spara omslagsbilder i mediemapparna';

  @override
  String get adminLibRefreshInterval => 'Automatisk uppdatering av metadata';

  @override
  String get adminLibRefreshNever => 'Aldrig';

  @override
  String get adminLibDefault => 'Standard';

  @override
  String get adminLibDisplayTitle => 'Visning';

  @override
  String get adminLibDisplaySection => 'Biblioteksvisning';

  @override
  String get adminLibFolderView => 'Visa en mappvy för vanliga mediemappar';

  @override
  String get adminLibSpecialsInSeasons =>
      'Visa specialavsnitt i den säsong de sändes';

  @override
  String get adminLibGroupMovies => 'Gruppera filmer i samlingar';

  @override
  String get adminLibGroupShows => 'Gruppera serier i samlingar';

  @override
  String get adminLibExternalSuggestions =>
      'Visa externt innehåll bland förslagen';

  @override
  String get adminLibDateAddedSection => 'Beteende för tillagt datum';

  @override
  String get adminLibDateAddedLabel => 'Hämta tillagt datum från';

  @override
  String get adminLibDateAddedImport =>
      'Datum då filen skannades in i biblioteket';

  @override
  String get adminLibDateAddedFile => 'Datum då filen skapades';

  @override
  String get adminLibMetadataTitle => 'Metadata och bilder';

  @override
  String get adminLibMetadataLangSection => 'Föredraget metadataspråk';

  @override
  String get adminLibChaptersSection => 'Kapitel';

  @override
  String get adminLibDummyChapterDuration =>
      'Längd på genererade kapitel (sekunder)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Längden på kapitel som genereras för media som saknar kapitel. Ange 0 för att inaktivera.';

  @override
  String get adminLibChapterImageResolution => 'Upplösning för kapitelbilder';

  @override
  String get adminLibNfoTitle => 'NFO-inställningar';

  @override
  String get adminLibNfoHelp =>
      'NFO-metadata är kompatibel med Kodi och liknande klienter. Inställningarna gäller alla bibliotek som sparar NFO-metadata.';

  @override
  String get adminLibKodiUser =>
      'Användare vars visningsdata sparas i NFO-filer';

  @override
  String get adminLibSaveImagePaths => 'Spara bildsökvägar i NFO-filer';

  @override
  String get adminLibPathSubstitution =>
      'Aktivera sökvägsersättning för bildsökvägar i NFO';

  @override
  String get adminLibExtraThumbs =>
      'Kopiera extrafanart-bilder till en extrathumbs-mapp';

  @override
  String get adminLibNone => 'Ingen';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dagar';
  }

  @override
  String get adminLibEmbeddedTitles => 'Använd inbäddade titlar';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Använd inbäddade titlar för extramaterial';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Använd inbäddad avsnittsinformation';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Tillåt inbäddade undertexter';

  @override
  String get adminLibEmbeddedAllowAll => 'Tillåt alla';

  @override
  String get adminLibEmbeddedAllowText => 'Endast text';

  @override
  String get adminLibEmbeddedAllowImage => 'Endast bild';

  @override
  String get adminLibEmbeddedAllowNone => 'Ingen';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Hoppa över nedladdning om inbäddade undertexter finns';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Hoppa över nedladdning om ljudspåret matchar nedladdningsspråket';

  @override
  String get adminLibRequirePerfectMatch =>
      'Kräv en perfekt undertextmatchning';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Spara undertexter i mediemapparna';

  @override
  String get adminLibChapterImageExtraction => 'Extrahera kapitelbilder';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extrahera kapitelbilder under biblioteksgenomsökningen';

  @override
  String get adminLibTrickplayExtraction =>
      'Aktivera extrahering av trickplay-bilder';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extrahera trickplay-bilder under biblioteksgenomsökningen';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Spara trickplay-bilder i mediemapparna';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Slå automatiskt ihop serier som är utspridda över flera mappar';

  @override
  String get adminLibSeasonZeroName => 'Visningsnamn för säsong noll';

  @override
  String get adminLibLufsScan =>
      'Aktivera LUFS-genomsökning för ljudnormalisering';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Föredra icke-standardtaggen för artister';

  @override
  String get adminLibAutoAddToCollection =>
      'Lägg automatiskt till filmer i samlingar';

  @override
  String get adminLibraryNameRequired => 'Bibliotekets namn krävs';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Kunde inte skapa biblioteket: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotekets namn';

  @override
  String get adminSelectedPaths => 'Valda vägar:';

  @override
  String get adminCreateLibrary => 'Skapa bibliotek';

  @override
  String get paths => 'Sökvägar:';

  @override
  String get adminDisableUser => 'Inaktivera användare';

  @override
  String get adminEnableUser => 'Aktivera användare';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Inaktivera $name? Användaren kommer inte att kunna logga in.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Aktivera $name? Användaren kommer att kunna logga in igen.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Användaren \"$name\" har inaktiverats';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Användaren \"$name\" har aktiverats';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Kunde inte uppdatera användarpolicyn: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Det gick inte att läsa in användare';

  @override
  String get adminSearchUsers => 'Sök användare';

  @override
  String get adminEditUser => 'Redigera användare';

  @override
  String get adminAddUser => 'Lägg till användare';

  @override
  String adminUserCreateFailed(String error) {
    return 'Kunde inte skapa användaren: $error';
  }

  @override
  String get adminCreateUser => 'Skapa användare';

  @override
  String get adminPasswordOptional => 'Lösenord (valfritt)';

  @override
  String get adminUsernameRequired => 'Användarnamnet får inte vara tomt';

  @override
  String adminSaveFailed(String error) {
    return 'Kunde inte spara: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Lösenord stämmer inte överens';

  @override
  String adminFailed(String error) {
    return 'Misslyckades: $error';
  }

  @override
  String get adminUserLoadFailed => 'Det gick inte att läsa in användaren';

  @override
  String get adminDeleteUser => 'Ta bort användare';

  @override
  String get admin => 'Administration';

  @override
  String get adminFullAccessWarning =>
      'Administratörer har fullständig åtkomst till servern. Bevilja med försiktighet.';

  @override
  String get administrator => 'Administratör';

  @override
  String get adminHiddenUser => 'Dold användare';

  @override
  String get adminAllowMediaPlayback => 'Tillåt mediauppspelning';

  @override
  String get adminAllowAudioTranscoding => 'Tillåt omkodning av ljud';

  @override
  String get adminAllowVideoTranscoding => 'Tillåt videoomkodning';

  @override
  String get adminAllowRemuxing => 'Tillåt återmixning';

  @override
  String get adminForceRemoteTranscoding => 'Tvinga omkodning av fjärrkälla';

  @override
  String get adminAllowContentDownloading => 'Tillåt nedladdning av innehåll';

  @override
  String get adminAllowPublicSharing => 'Tillåt offentlig delning';

  @override
  String get adminAllowRemoteControl =>
      'Tillåt fjärrkontroll av andra användare';

  @override
  String get adminAllowSharedDeviceControl => 'Tillåt delad enhetskontroll';

  @override
  String get adminAllowRemoteAccess => 'Tillåt fjärråtkomst';

  @override
  String get adminLeaveEmptyNoLimit => 'Lämna tomt utan gräns';

  @override
  String get adminMaxActiveSessions => 'Max aktiva sessioner';

  @override
  String get adminAllowLiveTvAccess => 'Tillåt live-TV-åtkomst';

  @override
  String get adminAllowLiveTvManagement => 'Tillåt direktsänd TV-hantering';

  @override
  String get adminAllowCollectionManagement => 'Tillåt samlingshantering';

  @override
  String get adminAllowSubtitleManagement => 'Tillåt undertexthantering';

  @override
  String get adminAllowLyricManagement => 'Tillåt texthantering';

  @override
  String get adminEnableAllLibraryAccess =>
      'Aktivera åtkomst till alla bibliotek';

  @override
  String get adminChangePassword => 'Ändra lösenord';

  @override
  String get adminNewPassword => 'Nytt lösenord';

  @override
  String get adminConfirmPassword => 'Bekräfta lösenord';

  @override
  String get adminSetPassword => 'Ange lösenord';

  @override
  String get adminResetPassword => 'Återställ lösenord';

  @override
  String get adminPasswordReset => 'Lösenordsåterställning';

  @override
  String get adminPasswordUpdated => 'Lösenordet uppdaterat';

  @override
  String get adminUserSettings => 'Användarinställningar';

  @override
  String get adminLibraryAccess => 'Tillgång till bibliotek';

  @override
  String get adminEnableAllDevices => 'Aktivera åtkomst till alla enheter';

  @override
  String get adminEnableAllChannels => 'Aktivera åtkomst till alla kanaler';

  @override
  String get adminParentalControl => 'Föräldrakontroll';

  @override
  String get adminMaxParentalRating => 'Högsta tillåtna åldersgräns';

  @override
  String get adminMaxParentalRatingHint =>
      'Innehåll med en högre åldersgräns döljs för den här användaren.';

  @override
  String get adminParentalRatingNone => 'Ingen';

  @override
  String get adminBlockUnratedItems =>
      'Blockera objekt utan eller med okänd åldersgräns';

  @override
  String get adminUnratedBook => 'Böcker';

  @override
  String get adminUnratedChannelContent => 'Kanaler';

  @override
  String get adminUnratedLiveTvChannel => 'Live-TV';

  @override
  String get adminUnratedMovie => 'Filmer';

  @override
  String get adminUnratedMusic => 'Musik';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Serier';

  @override
  String get adminAccessSchedules => 'Åtkomstscheman';

  @override
  String get adminAccessSchedulesHint =>
      'Tillåt åtkomst endast under de schemalagda tiderna nedan. Åtkomst tillåts hela dygnet när inget schema är angett.';

  @override
  String get adminAddSchedule => 'Lägg till schema';

  @override
  String get adminScheduleDay => 'Dag';

  @override
  String get adminScheduleStart => 'Start';

  @override
  String get adminScheduleEnd => 'Slut';

  @override
  String get adminDayEveryday => 'Varje dag';

  @override
  String get adminDayWeekday => 'Vardag';

  @override
  String get adminDayWeekend => 'Helg';

  @override
  String get adminDaySunday => 'Söndag';

  @override
  String get adminDayMonday => 'Måndag';

  @override
  String get adminDayTuesday => 'Tisdag';

  @override
  String get adminDayWednesday => 'Onsdag';

  @override
  String get adminDayThursday => 'Torsdag';

  @override
  String get adminDayFriday => 'Fredag';

  @override
  String get adminDaySaturday => 'Lördag';

  @override
  String get adminAllowedTags => 'Tillåtna taggar';

  @override
  String get adminAllowedTagsHint =>
      'Endast innehåll med dessa taggar visas. Lämna tomt för att tillåta allt.';

  @override
  String get adminBlockedTags => 'Blockerade taggar';

  @override
  String get adminBlockedTagsHint =>
      'Innehåll med dessa taggar döljs för den här användaren.';

  @override
  String get adminAddTag => 'Lägg till tagg';

  @override
  String get adminAuthProvider => 'Autentiseringsleverantör';

  @override
  String get adminPasswordResetProvider =>
      'Leverantör för lösenordsåterställning';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Högsta antal misslyckade inloggningsförsök före utelåsning';

  @override
  String get adminLoginAttemptsHint =>
      'Ange 0 för standardvärdet, eller -1 för att inaktivera utelåsning.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay-åtkomst';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Tillåt att skapa och gå med i grupper';

  @override
  String get adminSyncPlayJoin => 'Tillåt att gå med i grupper';

  @override
  String get adminSyncPlayNone => 'Ingen åtkomst';

  @override
  String get adminContentDeletionFolders =>
      'Tillåt borttagning av innehåll från';

  @override
  String get adminResetPasswordWarning =>
      'Detta tar bort lösenordet. Användaren kommer att kunna logga in utan lösenord.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Servern svarade med HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Är du säker på att du vill ta bort $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Användaren \"$name\" har tagits bort';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Kunde inte ta bort användaren: $error';
  }

  @override
  String get adminCreateApiKey => 'Skapa API-nyckel';

  @override
  String get adminAppName => 'Appens namn';

  @override
  String get adminApiKeyCreated => 'API-nyckel skapad';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Nyckel skapad framgångsrikt. Servern returnerade inte token. Kontrollera serverns API-nycklar.';

  @override
  String get adminKeyCopied => 'Nyckel kopierad till urklipp';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Kunde inte skapa nyckeln: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Nyckeltoken saknas från serversvaret';

  @override
  String get adminRevokeApiKey => 'Återkalla API-nyckel';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Återkalla nyckeln för $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-nyckel återkallad';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Kunde inte återkalla nyckeln: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Det gick inte att läsa in API-nycklar';

  @override
  String get adminApiKeysTitle => 'API-nycklar';

  @override
  String get adminCreateKey => 'Skapa nyckel';

  @override
  String get adminNoApiKeys => 'Inga API-nycklar hittades';

  @override
  String get adminUnknownApp => 'Okänd app';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nSkapad: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Skapa säkerhetskopia';

  @override
  String get adminBackupDatabase => 'Databas';

  @override
  String get adminBackupDatabaseAlways => 'Ingår alltid';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Undertexter';

  @override
  String get adminBackupTrickplay => 'Trickplay-bilder';

  @override
  String get adminCreatingBackup => 'Skapar säkerhetskopia...';

  @override
  String get adminBackupCreated => 'Säkerhetskopieringen har skapats';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Kunde inte skapa säkerhetskopian: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Säkerhetskopieringsväg saknas i serversvar';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Kunde inte läsa in manifestet: $error';
  }

  @override
  String get adminConfirmRestore => 'Bekräfta återställning';

  @override
  String get adminRestoringBackup => 'Återställer säkerhetskopian...';

  @override
  String adminRestoreFailed(String error) {
    return 'Kunde inte återställa säkerhetskopian: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'Det gick inte att läsa in säkerhetskopior';

  @override
  String get adminCreateBackup => 'Skapa säkerhetskopia';

  @override
  String get adminNoBackups => 'Inga säkerhetskopior hittades';

  @override
  String get adminViewDetails => 'Visa detaljer';

  @override
  String get restore => 'Återställa';

  @override
  String get adminLogsLoadFailed => 'Det gick inte att läsa in serverloggar';

  @override
  String get adminNoLogFiles => 'Inga loggfiler hittades';

  @override
  String get adminLogCopied => 'Loggen har kopierats till urklipp';

  @override
  String get adminSaveLogFile => 'Spara loggfil';

  @override
  String adminSavedTo(String path) {
    return 'Sparad till $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Kunde inte spara filen: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Kunde inte läsa in $fileName';
  }

  @override
  String get adminSearchInLog => 'Sök i logg';

  @override
  String get adminNoMatchingLines => 'Inga matchande linjer';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Kunde inte läsa in uppgifterna: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Inga schemalagda uppgifter hittades';

  @override
  String get adminNoTasksMatchFilter =>
      'Inga uppgifter matchar det aktuella filtret';

  @override
  String adminTaskStartFailed(String error) {
    return 'Kunde inte starta uppgiften: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Kunde inte stoppa uppgiften: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Kunde inte läsa in uppgiften: $error';
  }

  @override
  String get adminRunNow => 'Kör nu';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Kunde inte ta bort utlösaren: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Kunde inte lägga till utlösaren: $error';
  }

  @override
  String get adminLastExecution => 'Senaste avrättningen';

  @override
  String get adminTriggers => 'Utlösare';

  @override
  String get adminAddTrigger => 'Lägg till trigger';

  @override
  String get adminNoTriggers => 'Inga utlösare har konfigurerats';

  @override
  String get adminTriggerType => 'Triggertyp';

  @override
  String get adminNoLimit => 'Ingen gräns';

  @override
  String adminHours(String hours) {
    return '$hours timme/timmar';
  }

  @override
  String get adminDayOfWeek => 'Veckodag';

  @override
  String get adminSearchPlugins => 'Sök plugins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Kunde inte växla pluginet: $error';
  }

  @override
  String get adminUninstallPlugin => 'Avinstallera plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Är du säker på att du vill avinstallera \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Kunde inte avinstallera pluginet: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Kunde inte installera paketet: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Kunde inte installera uppdateringen: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Kunde inte läsa in plugins: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => 'Inga plugins matchar din sökning';

  @override
  String get adminNoPluginsInstalled => 'Inga plugins installerade';

  @override
  String adminInstallUpdate(String version) {
    return 'Installera uppdatering (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Kunde inte läsa in katalogen: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'Inga paket matchar din sökning';

  @override
  String get adminNoPackagesAvailable => 'Inga paket tillgängliga';

  @override
  String get adminExperimentalIntegration => 'Experimentell integration';

  @override
  String get adminExperimentalWarning =>
      'Integrering av plugininställningar är fortfarande experimentell. Vissa inställningssidor kanske inte återges korrekt.';

  @override
  String get continueAction => 'Fortsätta';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" tas bort efter att servern startats om';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Kunde inte avinstallera: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Uppdaterar \"$name\" till v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Kunde inte läsa in pluginet: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin hittades inte';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Aktivera plugin';

  @override
  String get adminPluginSettingsPage => 'Inställningssida för plugin';

  @override
  String get adminRevisionHistory => 'Revisionshistorik';

  @override
  String get adminNoChangelog => 'Ingen ändringslogg tillgänglig.';

  @override
  String get adminRemoveRepository => 'Ta bort repository';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Är du säker på att du vill ta bort \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Kunde inte spara arkiven: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Kunde inte läsa in arkiven: $error';
  }

  @override
  String get adminRepositoryNameHint => 'till exempel Jellyfin Stabil';

  @override
  String get adminRepositoryUrl => 'Arkivets URL';

  @override
  String get adminAddEntry => 'Lägg till post';

  @override
  String get adminInvalidUrl => 'Ogiltig URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Kunde inte läsa in plugininställningarna: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Kunde inte öppna $uri';
  }

  @override
  String get adminOpenInBrowser => 'Öppna i webbläsare';

  @override
  String get adminOpenExternally => 'Öppna externt';

  @override
  String get adminGeneralSettings => 'Allmänna inställningar';

  @override
  String get adminServerName => 'Servernamn';

  @override
  String get adminPreferredMetadataCountry => 'Önskat land för metadata';

  @override
  String get adminCachePath => 'Cache-väg';

  @override
  String get adminMetadataPath => 'Metadatasökväg';

  @override
  String get adminLibraryScanConcurrency => 'Biblioteksskanning samtidigt';

  @override
  String get adminParallelImageEncodingLimit =>
      'Gräns ​​för kodning av parallella bilder';

  @override
  String get adminSlowResponseThreshold => 'Tröskel för långsamt svar (ms)';

  @override
  String get adminBrandingLoadFailed =>
      'Det gick inte att läsa in varumärkesinställningar';

  @override
  String get adminLoginDisclaimer => 'Ansvarsfriskrivning för inloggning';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML visas under inloggningsformuläret';

  @override
  String get adminCustomCss => 'Anpassad CSS';

  @override
  String get adminCustomCssHint => 'Anpassad CSS tillämpas på webbgränssnittet';

  @override
  String get adminEnableSplashScreen => 'Aktivera startskärm';

  @override
  String get adminStreamingLoadFailed =>
      'Det gick inte att läsa in streaminginställningar';

  @override
  String get adminStreamingDescription =>
      'Ställ in globala bithastighetsgränser för streaming för fjärranslutningar.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Fjärrklientbithastighetsgräns (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Lämna tomt eller 0 för obegränsat';

  @override
  String get adminPlaybackLoadFailed =>
      'Det gick inte att ladda uppspelningsinställningarna';

  @override
  String get adminHardwareAcceleration => 'Hårdvaruacceleration';

  @override
  String get adminVaapiDevice => 'VA-API-enhet';

  @override
  String get adminEnableHardwareEncoding => 'Aktivera hårdvarukodning';

  @override
  String get adminEnableHardwareDecoding => 'Aktivera hårdvaruavkodning för:';

  @override
  String get adminEncodingThreads => 'Kodning av trådar';

  @override
  String get adminAutomatic => '0 = automatisk';

  @override
  String get adminTranscodingTempPath => 'Omkodning av temp sökväg';

  @override
  String get adminEnableFallbackFont => 'Aktivera reservteckensnitt';

  @override
  String get adminFallbackFontPath => 'Alternativ teckensnittssökväg';

  @override
  String get adminAllowSegmentDeletion => 'Tillåt radering av segment';

  @override
  String get adminSegmentKeepSeconds => 'Segmentbehåll (sekunder)';

  @override
  String get adminThrottleBuffering => 'Gasspjällsbuffring';

  @override
  String get adminTrickplayLoadFailed =>
      'Det gick inte att läsa in trickplay-inställningar';

  @override
  String get adminEnableHardwareAcceleration => 'Aktivera hårdvaruacceleration';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Aktivera extrahering av endast nyckelram';

  @override
  String get adminKeyFrameSubtitle => 'Snabbare men lägre noggrannhet';

  @override
  String get adminScanBehavior => 'Skanna beteende';

  @override
  String get adminProcessPriority => 'Processprioritet';

  @override
  String get adminImageSettings => 'Bildinställningar';

  @override
  String get adminIntervalMs => 'Intervall (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Hur ofta ska man fånga ramar';

  @override
  String get adminWidthResolutions => 'Breddupplösningar';

  @override
  String get adminTileWidth => 'Kakel bredd';

  @override
  String get adminTileHeight => 'Kakelhöjd';

  @override
  String get adminQualitySubtitle =>
      'Lägre värden = bättre kvalitet, större filer';

  @override
  String get adminProcessThreads => 'Bearbeta trådar';

  @override
  String get adminResumeLoadFailed =>
      'Det gick inte att läsa in inställningarna för återuppta';

  @override
  String get adminResumeDescription =>
      'Konfigurera när innehåll ska markeras som delvis uppspelat eller helt uppspelat.';

  @override
  String get adminMinResumePercentage => 'Minsta CV procentsats';

  @override
  String get adminMinResumeSubtitle =>
      'Innehåll måste spelas förbi denna procentsats för att spara framsteg';

  @override
  String get adminMaxResumePercentage => 'Maximal återuppta procent';

  @override
  String get adminMaxResumeSubtitle =>
      'Innehållet anses vara fullt uppspelat efter denna procentandel';

  @override
  String get adminMinResumeDuration =>
      'Minsta återuppta varaktighet (sekunder)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Objekt som är kortare än detta går inte att återuppta';

  @override
  String get adminMinAudiobookResume =>
      'Minsta procentsats för återuppta ljudbok';

  @override
  String get adminMaxAudiobookResume =>
      'Maximal procentandel för återuppta ljudbok';

  @override
  String get adminNetworkingLoadFailed =>
      'Det gick inte att läsa in nätverksinställningar';

  @override
  String get adminNetworkingWarning =>
      'Ändringar av nätverksinställningar kan kräva omstart av servern.';

  @override
  String get adminEnableRemoteAccess => 'Aktivera fjärråtkomst';

  @override
  String get ports => 'Hamnar';

  @override
  String get adminHttpPort => 'HTTP-port';

  @override
  String get adminHttpsPort => 'HTTPS-port';

  @override
  String get adminPublicHttpsPort => 'Offentlig HTTPS-port';

  @override
  String get adminBaseUrl => 'Bas-URL';

  @override
  String get adminBaseUrlHint => 'till exempel /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Aktivera HTTPS';

  @override
  String get adminLocalNetwork => 'Lokalt nätverk';

  @override
  String get adminLocalNetworkAddresses => 'Lokala nätverksadresser';

  @override
  String get adminKnownProxies => 'Kända ombud';

  @override
  String get adminRemoteIpFilter => 'Fjärr IP-filter';

  @override
  String get adminRemoteIpFilterEntries => 'Fjärrstyrt IP-filter';

  @override
  String get adminCertificatePath => 'Certifikatsökväg';

  @override
  String get whitelist => 'Vitlista';

  @override
  String get blacklist => 'Svartlista';

  @override
  String get notSet => 'Inte inställt';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Kunde inte läsa in metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Uppdatera metadata';

  @override
  String get recursive => 'Rekursiv';

  @override
  String get adminReplaceAllMetadata => 'Ersätt all metadata';

  @override
  String get adminMetadataRefreshRequested => 'Metadatauppdatering har begärts';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Kunde inte uppdatera metadata: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Inga fjärrmatchningar hittades';

  @override
  String get adminRemoteResults => 'Fjärrresultat';

  @override
  String get adminRemoteMetadataApplied => 'Fjärrmetadata tillämpas';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Fjärrsökningen misslyckades: $error';
  }

  @override
  String get adminUpdateContentType => 'Uppdatera innehållstyp';

  @override
  String get adminContentType => 'Innehållstyp';

  @override
  String get adminContentTypeUpdated => 'Innehållstyp uppdaterad';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Kunde inte uppdatera innehållstypen: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Det gick inte att läsa in metadataredigeraren';

  @override
  String get adminNoPeopleEntries => 'Inga personer inlägg';

  @override
  String get adminNoExternalIds => 'Inga externa ID:n är tillgängliga';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType-bilden har uppdaterats';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Kunde inte ladda ner bilden: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Bildformat som inte stöds';

  @override
  String get adminImageReadFailed => 'Det gick inte att läsa den valda bilden';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType-bilden har laddats upp';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Kunde inte ladda upp bilden: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Ta bort $imageType-bilden';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType-bilden har tagits bort';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Kunde inte ta bort bilden: $error';
  }

  @override
  String get adminAllProviders => 'Alla leverantörer';

  @override
  String get adminNoRemoteImages => 'Inga fjärrbilder hittades';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Sökningen efter tuners misslyckades: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U-tuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Fil eller URL';

  @override
  String get adminTunerIpAddress => 'Tunerns IP-adress';

  @override
  String get adminTunerFriendlyName => 'Visningsnamn';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Gräns för samtidiga anslutningar';

  @override
  String get adminTunerCountHelp =>
      'Det största antal strömmar som tunern tillåter samtidigt. Ange 0 för obegränsat.';

  @override
  String get adminTunerFallbackBitrate =>
      'Reservgräns för strömmens bithastighet';

  @override
  String get adminTunerImportFavoritesOnly => 'Importera endast favoritkanaler';

  @override
  String get adminTunerAllowHwTranscoding => 'Tillåt hårdvaruomkodning';

  @override
  String get adminTunerAllowFmp4 => 'Tillåt fMP4 som omkodningscontainer';

  @override
  String get adminTunerAllowStreamSharing => 'Tillåt delning av strömmar';

  @override
  String get adminTunerEnableStreamLooping => 'Aktivera loopning av strömmar';

  @override
  String get adminTunerIgnoreDts => 'Ignorera DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Läs indata med ursprunglig bildfrekvens';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Fil eller URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmprefix';

  @override
  String get adminXmltvMovieCategories => 'Filmkategorier';

  @override
  String get adminXmltvCategoriesHelp =>
      'Separera flera kategorier med ett lodstreck.';

  @override
  String get adminXmltvKidsCategories => 'Barnkategorier';

  @override
  String get adminXmltvNewsCategories => 'Nyhetskategorier';

  @override
  String get adminXmltvSportsCategories => 'Sportkategorier';

  @override
  String get adminSdUsername => 'Användarnamn';

  @override
  String get adminSdPassword => 'Lösenord';

  @override
  String get adminSdCountry => 'Land';

  @override
  String get adminSdCountrySelect => 'Välj ett land';

  @override
  String get adminSdPostalCode => 'Postnummer';

  @override
  String get adminEnableAllTuners => 'Aktivera alla tuners';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Kunde inte ta bort tunern: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Kunde inte ta bort leverantören: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Serieinspelningsväg';

  @override
  String get adminMovieRecordingPath => 'Sökväg för filminspelningar';

  @override
  String get adminGuideDaysAuto => 'Automatiskt';

  @override
  String get adminRecordingPostProcessor =>
      'Sökväg till efterbehandlingsprogram';

  @override
  String get adminRecordingPostProcessorArgs => 'Argument för efterbehandling';

  @override
  String get adminSaveRecordingNfo => 'Spara NFO-metadata för inspelningar';

  @override
  String get adminSaveRecordingImages => 'Spara bilder för inspelningar';

  @override
  String get adminLiveTvSectionPaths => 'Inspelningssökvägar';

  @override
  String get adminLiveTvSectionPostProcessing => 'Efterbehandling';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Kunde inte spara inställningarna: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Det gick inte att läsa in Live TV-administration';

  @override
  String get adminTunerDevices => 'Tuner-enheter';

  @override
  String get adminNoTunerHosts => 'Inga tunervärdar har konfigurerats';

  @override
  String get adminGuideProviders => 'Guide leverantörer';

  @override
  String get adminGuideRefreshStarted => 'Uppdatering av tablådata har startat';

  @override
  String get adminGuideRefreshUnavailable =>
      'Uppgiften för tablåuppdatering är inte tillgänglig på den här servern.';

  @override
  String get adminNoListingProviders =>
      'Inga listningsleverantörer har konfigurerats';

  @override
  String get adminSettingsSaved => 'Inställningar sparade';

  @override
  String get adminBackupsNotAvailable =>
      'Säkerhetskopieringar är inte tillgängliga på denna serverbyggnad.';

  @override
  String get adminRestoreWarning1 =>
      'Återställning kommer att ersätta ALLA aktuella serverdata med backupdata.';

  @override
  String get adminRestoreWarning2 =>
      'Aktuella serverinställningar, användare och biblioteksdata kommer att skrivas över.';

  @override
  String get adminRestoreWarning3 =>
      'Servern kommer att starta om efter återställning.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Återställa säkerhetskopian $name nu?';
  }

  @override
  String get adminBackupsTitle => 'Säkerhetskopieringar';

  @override
  String get adminUnknownDate => 'Okänt datum';

  @override
  String get adminUnnamedBackup => 'Namnlösa: Säkerhetskopiering';

  @override
  String get adminApply => 'Tillämpa';

  @override
  String get adminLogsTitle => 'Serverloggar';

  @override
  String get adminLogsNewestFirst => 'Nyaste först';

  @override
  String get adminLogsOldestFirst => 'Äldst först';

  @override
  String get adminLogsJustNow => 'Just nu';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes min sedan';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours tim sedan';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days d sedan';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Kunde inte läsa in $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count träffar';
  }

  @override
  String get adminLogViewerNoMatches => 'Inga matchande linjer';

  @override
  String get adminMetadataEditorTitle => 'Metadataredigerare';

  @override
  String get adminMetadataIdentify => 'Identifiera';

  @override
  String get adminMetadataType => 'Typ';

  @override
  String get adminMetadataDetails => 'Detaljer';

  @override
  String get adminMetadataExternalIds => 'Externa ID:n';

  @override
  String get adminMetadataImages => 'Bilder';

  @override
  String get adminMetadataFieldTitle => 'Titel';

  @override
  String get adminMetadataFieldSortTitle => 'Sortera titel';

  @override
  String get adminMetadataFieldOriginalTitle => 'Originaltitel';

  @override
  String get adminMetadataFieldPremiereDate => 'Premiärdatum (ÅÅÅÅ-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Slutdatum (ÅÅÅÅ-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Produktionsår';

  @override
  String get adminMetadataFieldOfficialRating => 'Officiellt betyg';

  @override
  String get adminMetadataFieldCommunityRating => 'Samhällsbetyg';

  @override
  String get adminMetadataFieldCriticRating => 'Kritikerbetyg';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Översikt';

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
  String get adminMetadataGenres => 'Genrer';

  @override
  String get adminMetadataTags => 'Taggar';

  @override
  String get adminMetadataStudios => 'Studior';

  @override
  String get adminMetadataPeople => 'Personer';

  @override
  String get adminMetadataAddGenre => 'Lägg till genre';

  @override
  String get adminMetadataAddTag => 'Lägg till tagg';

  @override
  String get adminMetadataAddStudio => 'Lägg till studio';

  @override
  String get adminMetadataAddPerson => 'Lägg till person';

  @override
  String get adminMetadataEditPerson => 'Redigera person';

  @override
  String get adminMetadataRole => 'Roll';

  @override
  String get adminMetadataImagePrimary => 'Primär';

  @override
  String get adminMetadataImageBackdrop => 'Bakgrund';

  @override
  String get adminMetadataImageLogo => 'Logotyp';

  @override
  String get adminMetadataImageBanner => 'Baner';

  @override
  String get adminMetadataImageThumb => 'Tumme';

  @override
  String get adminMetadataProvider => 'Leverantör';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType-bilden har uppdaterats';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType-bilden har laddats upp';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType-bilden har tagits bort';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Kunde inte ladda ner bilden: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Det gick inte att läsa den valda bilden';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Kunde inte ladda upp bilden: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Ta bort $imageType-bilden';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Detta tar bort den aktuella bilden från objektet.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Kunde inte ta bort bilden: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Välj $imageType-bild';
  }

  @override
  String get adminMetadataUpload => 'Ladda upp';

  @override
  String get adminMetadataUpdate => 'Uppdatera';

  @override
  String get adminMetadataRemoteImage => 'Fjärrbild';

  @override
  String get adminPluginsInstalled => 'Installerad';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktiv';

  @override
  String get adminPluginsRestart => 'Starta om';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults => 'Inga plugins matchar din sökning';

  @override
  String get adminPluginsNoneInstalled => 'Inga plugins installerade';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Uppdatering tillgänglig: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Uppdatering tillgänglig';

  @override
  String get adminPluginsPendingRemoval =>
      'Väntar på borttagning efter omstart';

  @override
  String get adminPluginsChangesPending => 'Ändringar väntar på omstart';

  @override
  String get adminPluginsEnable => 'Aktivera';

  @override
  String get adminPluginsDisable => 'Inaktivera';

  @override
  String get adminPluginsInstallUpdate => 'Installera uppdatering';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Installera uppdatering (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Inga paket matchar din sökning';

  @override
  String get adminPluginsCatalogEmpty => 'Inga paket tillgängliga';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" installeras...';
  }

  @override
  String get adminPluginDetailExperimental => 'Experimentell integration';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integrering av plugininställningar är fortfarande experimentell. Vissa fält eller layouter kanske inte återges korrekt ännu.';

  @override
  String get adminPluginDetailToggle404 =>
      'Det gick inte att växla plugin. Servern kunde inte hitta denna plugin-version. Prova att uppdatera plugins och försök sedan igen.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Det gick inte att växla plugin. Kontrollera serverloggarna för detaljer.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Inställningar för $name';
  }

  @override
  String get adminPluginDetailDetails => 'Detaljer';

  @override
  String get adminPluginDetailDeveloper => 'Framkallare';

  @override
  String get adminPluginDetailRepository => 'Förvar';

  @override
  String get adminPluginDetailBundled => 'Bundet';

  @override
  String get adminPluginDetailEnablePlugin => 'Aktivera plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'En omstart av servern krävs för att ändringarna ska träda i kraft.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Denna plugin kommer att tas bort efter omstart av servern.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Denna plugin har inte fungerat och kanske inte fungerar korrekt.';

  @override
  String get adminPluginDetailNotSupported =>
      'Denna plugin stöds inte av den aktuella serverversionen.';

  @override
  String get adminPluginDetailSuperseded =>
      'Detta plugin har ersatts av en nyare version.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Kunde inte läsa in arkiven: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Ta bort repository';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Är du säker på att du vill ta bort \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Ta bort';

  @override
  String adminReposSaveFailed(String error) {
    return 'Kunde inte spara arkiven: $error';
  }

  @override
  String get adminReposEmpty => 'Inga förråd har konfigurerats';

  @override
  String get adminReposEmptySubtitle =>
      'Lägg till ett arkiv för att bläddra bland tillgängliga plugins';

  @override
  String get adminReposUnnamed => '(namnlös)';

  @override
  String get adminReposEditTitle => 'Redigera förråd';

  @override
  String get adminReposAddTitle => 'Lägg till arkiv';

  @override
  String get adminReposUrl => 'Arkivets URL';

  @override
  String get adminReposNameHint => 'till exempel Jellyfin Stabil';

  @override
  String get adminPluginSettingsInvalidUrl => 'Ogiltig URL';

  @override
  String get adminGeneralSettingsTitle => 'Allmänna inställningar';

  @override
  String get adminGeneralMetadataLanguage => 'Önskat metadataspråk';

  @override
  String get adminGeneralMetadataLanguageHint => 'till exempel sv, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Önskat land för metadata';

  @override
  String get adminGeneralMetadataCountryHint => 'till exempel USA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Biblioteksskanning samtidigt';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Gräns ​​för kodning av parallella bilder';

  @override
  String get adminUnknownError => 'Okänt fel';

  @override
  String get adminBrowse => 'Bläddra';

  @override
  String get adminCloseBrowser => 'Stäng webbläsaren';

  @override
  String get adminNetworkingTitle => 'Nätverk';

  @override
  String get adminNetworkingRestartWarning =>
      'Ändringar av nätverksinställningar kan kräva omstart av servern.';

  @override
  String get adminNetworkingEnableHttps => 'Aktivera HTTPS';

  @override
  String get adminNetworkingAddressHint => 'till exempel 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Kända ombud';

  @override
  String get adminNetworkingProxyHint => 'till exempel 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Vitlista';

  @override
  String get adminNetworkingBlacklist => 'Svartlista';

  @override
  String get adminNetworkingAddEntry => 'Lägg till post';

  @override
  String get adminBrandingTitle => 'Varumärke';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Ansvarsfriskrivning för inloggning';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML visas under inloggningsformuläret';

  @override
  String get adminBrandingCustomCss => 'Anpassad CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Anpassad CSS tillämpas på webbgränssnittet';

  @override
  String get adminBrandingEnableSplash => 'Aktivera startskärm';

  @override
  String get adminBrandingSplashUpload => 'Ladda upp bild';

  @override
  String get adminBrandingSplashUploaded => 'Startskärmen har uppdaterats';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Kunde inte ladda upp startskärmen';

  @override
  String get adminBrandingSplashDeleted => 'Startskärmen har tagits bort';

  @override
  String get adminBrandingNoSplash => 'Ingen anpassad startskärm';

  @override
  String get adminPlaybackHwAccel => 'Hårdvaruacceleration';

  @override
  String get adminPlaybackHwAccelLabel => 'Hårdvaruacceleration';

  @override
  String get adminPlaybackEnableHwEncoding => 'Aktivera hårdvarukodning';

  @override
  String get adminPlaybackQsvDevice => 'QSV-enhet';

  @override
  String get adminPlaybackEnhancedNvdec => 'Aktivera förbättrad NVDEC-avkodare';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Föredra systemets inbyggda hårdvaruavkodare';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bitars HEVC-avkodning';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bitars VP9-avkodning';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bitars avkodning';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12-bitars avkodning';

  @override
  String get adminPlaybackHwEncodingSection => 'Hårdvarukodning';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Tillåt HEVC-kodning';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Tillåt AV1-kodning';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Aktivera Intels lågeffekts-H.264-kodare';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Aktivera Intels lågeffekts-HEVC-kodare';

  @override
  String get adminPlaybackToneMapping => 'Tonmappning';

  @override
  String get adminPlaybackEnableTonemapping => 'Aktivera tonmappning';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Aktivera VPP-tonmappning';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Aktivera VideoToolbox-tonmappning';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algoritm för tonmappning';

  @override
  String get adminPlaybackTonemappingMode => 'Läge för tonmappning';

  @override
  String get adminPlaybackTonemappingRange => 'Omfång för tonmappning';

  @override
  String get adminPlaybackTonemappingDesat => 'Avmättnad vid tonmappning';

  @override
  String get adminPlaybackTonemappingPeak => 'Topp för tonmappning';

  @override
  String get adminPlaybackTonemappingParam => 'Parameter för tonmappning';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Ljusstyrka för VPP-tonmappning';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Kontrast för VPP-tonmappning';

  @override
  String get adminPlaybackEncoderPreset => 'Förinställning för kodare';

  @override
  String get adminPlaybackH264Crf => 'CRF för H.264-kodning';

  @override
  String get adminPlaybackH265Crf => 'CRF för H.265 (HEVC)-kodning';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Avflätningsmetod';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Fördubbla bildfrekvensen vid avflätning';

  @override
  String get adminPlaybackAudioSection => 'Ljud';

  @override
  String get adminPlaybackEnableAudioVbr => 'Aktivera VBR-kodning för ljud';

  @override
  String get adminPlaybackDownmixBoost => 'Förstärkning vid nedmixning av ljud';

  @override
  String get adminPlaybackDownmixAlgorithm =>
      'Algoritm för nedmixning till stereo';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Max storlek på muxningskön';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Kodning';

  @override
  String get adminPlaybackEncodingThreads => 'Kodning av trådar';

  @override
  String get adminPlaybackFallbackFont => 'Aktivera reservteckensnitt';

  @override
  String get adminPlaybackFallbackFontPath => 'Alternativ teckensnittssökväg';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Ljudböcker';

  @override
  String get adminStreamingBitrateLimit =>
      'Fjärrklientbithastighetsgräns (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Lämna tomt eller 0 för obegränsat';

  @override
  String get adminTrickplayHwAccel => 'Aktivera hårdvaruacceleration';

  @override
  String get adminTrickplayHwEncoding => 'Aktivera hårdvarukodning';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Aktivera extrahering av endast nyckelram';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Snabbare men lägre noggrannhet';

  @override
  String get adminTrickplayNonBlocking => 'Icke-blockerande';

  @override
  String get adminTrickplayBlocking => 'Blockering';

  @override
  String get adminTrickplayPriorityHigh => 'Hög';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Över Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Under normal';

  @override
  String get adminTrickplayPriorityIdle => 'På tomgång';

  @override
  String get adminTrickplayImageSettings => 'Bildinställningar';

  @override
  String get adminTrickplayInterval => 'Intervall (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Hur ofta ska man fånga ramar';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Kommaseparerade pixelbredder (t.ex. 320)';

  @override
  String get adminTrickplayQuality => 'Kvalitet';

  @override
  String get adminTrickplayQScale => 'Kvalitetsskala';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Lägre värden = bättre kvalitet, större filer';

  @override
  String get adminTrickplayJpegQuality => 'JPEG-kvalitet';

  @override
  String get adminTrickplayProcessing => 'Bearbetning';

  @override
  String get adminTasksEmpty => 'Inga schemalagda uppgifter hittades';

  @override
  String get adminTasksNoFilterMatch =>
      'Inga uppgifter matchar det aktuella filtret';

  @override
  String get adminTaskCancelling => 'Inställande...';

  @override
  String get adminTaskRunning => 'Spring...';

  @override
  String get adminTaskNeverRun => 'Spring aldrig';

  @override
  String get adminTaskStop => 'Stoppa';

  @override
  String get adminRunningTasks => 'Pågående uppgifter';

  @override
  String get adminTaskRun => 'Sikt';

  @override
  String get adminTaskDetailLastExecution => 'Senaste avrättningen';

  @override
  String get adminTaskDetailStarted => 'Startade';

  @override
  String get adminTaskDetailEnded => 'Avslutade';

  @override
  String get adminTaskDetailDuration => 'Varaktighet';

  @override
  String get adminTaskDetailErrorLabel => 'Fel:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Dagligen kl. $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Varje $day kl. $time';
  }

  @override
  String get adminTaskTriggerStartup => 'Vid applikationsstart';

  @override
  String get adminTaskTriggerTypeDaily => 'Dagligen';

  @override
  String get adminTaskTriggerTypeWeekly => 'Varje vecka';

  @override
  String get adminTaskTriggerTypeInterval => 'På ett intervall';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervall';

  @override
  String get adminTaskTriggerEveryHour => 'Varje timme';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count timmar',
      one: '1 timme',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Tid';

  @override
  String get adminActivityJustNow => 'Just nu';

  @override
  String get adminActivityLastHour => 'Sista timmen';

  @override
  String get adminActivityToday => 'I dag';

  @override
  String get adminActivityYesterday => 'I går';

  @override
  String get adminActivityOlder => 'Äldre';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days d sedan';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours tim sedan';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes min sedan';
  }

  @override
  String get adminActivityNow => 'nu';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours tim';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days d';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigurera trickplay-bildgenerering för sökförhandsvisningsminiatyrer.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Offentlig HTTPS-port';

  @override
  String get adminNetworkingBaseUrl => 'Bas-URL';

  @override
  String get adminNetworkingBaseUrlHint => 'till exempel /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Publik HTTP-port';

  @override
  String get adminNetworkingRequireHttps => 'Kräv HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Omdirigera alla fjärranslutningar till HTTPS. Har ingen effekt om servern saknar ett giltigt certifikat.';

  @override
  String get adminNetworkingCertPassword => 'Certifikatlösenord';

  @override
  String get adminNetworkingEnableIpv4 => 'Aktivera IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Aktivera IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'LAN-nätverk';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Fjärrstyrt IP-filter';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API-enhet';

  @override
  String get adminPlaybackAutomatic => '0 = automatisk';

  @override
  String get adminPlaybackTranscodeTempPath => 'Omkodning av temp sökväg';

  @override
  String get adminPlaybackSegmentDeletion => 'Tillåt radering av segment';

  @override
  String get adminPlaybackSegmentKeep => 'Segmentbehåll (sekunder)';

  @override
  String get adminPlaybackThrottleBuffering => 'Gasspjällsbuffring';

  @override
  String get adminPlaybackThrottleDelay =>
      'Fördröjning för strypning (sekunder)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Tillåt extrahering av undertexter i realtid';

  @override
  String get adminResumeMinPct => 'Minsta CV procentsats';

  @override
  String get adminResumeMinPctSubtitle =>
      'Innehåll måste spelas förbi denna procentsats för att spara framsteg';

  @override
  String get adminResumeMaxPct => 'Maximal återuppta procent';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Innehållet anses vara fullt uppspelat efter denna procentandel';

  @override
  String get adminResumeMinDuration =>
      'Minsta återuppta varaktighet (sekunder)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Objekt som är kortare än detta går inte att återuppta';

  @override
  String get adminTrickplayScanBehavior => 'Skanna beteende';

  @override
  String get adminTrickplayProcessPriority => 'Processprioritet';

  @override
  String get adminTrickplayTileWidth => 'Kakel bredd';

  @override
  String get adminTrickplayTileHeight => 'Kakelhöjd';

  @override
  String get adminTrickplayProcessThreads => 'Bearbeta trådar';

  @override
  String get adminTrickplayWidthResolutions => 'Breddupplösningar';

  @override
  String get adminMetadataDefault => 'Standard';

  @override
  String get adminMetadataContentTypeUpdated => 'Innehållstyp uppdaterad';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Kunde inte uppdatera innehållstypen: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Tröskel för långsamt svar (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Aktivera varningar om långsamma svar';

  @override
  String get adminGeneralQuickConnect => 'Aktivera Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Sökvägar';

  @override
  String get adminGeneralSectionPerformance => 'Prestanda';

  @override
  String get adminGeneralCachePath => 'Cache-väg';

  @override
  String get adminGeneralMetadataPath => 'Metadatasökväg';

  @override
  String get adminGeneralServerName => 'Servernamn';

  @override
  String get adminGeneralDisplayLanguage => 'Föredraget visningsspråk';

  @override
  String get adminSettingsLoadFailed =>
      'Det gick inte att läsa in inställningarna';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Kunde inte uppdatera mappningarna: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Tidsgräns: $duration';
  }

  @override
  String get folders => 'Mappar';

  @override
  String get libraries => 'Bibliotek';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay inaktiverad';

  @override
  String get syncPlayDisabledMessage =>
      'Aktivera SyncPlay i Inställningar för att använda synkroniserad uppspelning.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Servern stöds inte';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay kräver en Jellyfin-server. Den aktuella servern stöder inte det.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Grupp';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay grupp';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# deltagare',
      one: '# deltagare',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignorera vänta';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Håll inte upp gruppen medan den här enheten buffrar';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Fortsätt lokalt utan att vänta på långsamma medlemmar';

  @override
  String get syncPlayRepeat => 'Upprepa';

  @override
  String get syncPlayRepeatOne => 'En';

  @override
  String get syncPlayShuffleModeShuffled => 'Blandade';

  @override
  String get syncPlayShuffleModeSorted => 'Sorterad';

  @override
  String get syncPlaySyncCurrentQueue => 'Synkronisera aktuell uppspelningskö';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Byt ut gruppkön med det som spelas lokalt';

  @override
  String get syncPlayLeaveGroup => 'Lämna gruppen';

  @override
  String get syncPlayGroupQueue => 'Gruppkö';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Objekt $index';
  }

  @override
  String get syncPlayPlayNow => 'Spela nu';

  @override
  String get syncPlayCreateNewGroup => 'Skapa en ny grupp';

  @override
  String get syncPlayGroupName => 'Gruppnamn';

  @override
  String get syncPlayDefaultGroupName => 'Min SyncPlay grupp';

  @override
  String get syncPlayCreateGroup => 'Skapa grupp';

  @override
  String get syncPlayAvailableGroups => 'Tillgängliga grupper';

  @override
  String get syncPlayNoGroupsAvailable => 'Inga grupper tillgängliga';

  @override
  String get syncPlayJoinGroupQuestion => 'Gå med i gruppen SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Att gå med i en SyncPlay-grupp kan ersätta din nuvarande uppspelningskö. Fortsätta?';

  @override
  String get syncPlayJoin => 'Ansluta sig till';

  @override
  String get syncPlayStateIdle => 'På tomgång';

  @override
  String get syncPlayStateWaiting => 'Väntan';

  @override
  String get syncPlayStatePaused => 'Pausad';

  @override
  String get syncPlayStatePlaying => 'Spelar';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName gick med i SyncPlay-gruppen';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName lämnade SyncPlay-gruppen';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay åtkomst nekad';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Du har inte åtkomst till ett eller flera objekt i den här gruppen SyncPlay. Be gruppägaren att verifiera biblioteksbehörigheter eller välja en annan kö.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synkar uppspelningen till $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Röstsökning är inte tillgänglig.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direktuppspelning misslyckades';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Direktuppspelning kunde inte starta för denna Dolby Vision-ström. Försök att använda serveromkodning igen?';

  @override
  String get retryWithTranscode => 'Försök igen med omkodning';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Stöds inte';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Den här enheten kan inte avkoda Dolby Vision innehåll direkt. Använd HDR10 reserv eller begär serveromkodning.';

  @override
  String get rememberMyChoice => 'Kom ihåg mitt val';

  @override
  String get playHdr10Fallback => 'Spela HDR10 reserv';

  @override
  String get requestTranscode => 'Begär omkodning';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# rader hittade',
      one: '# rad hittad',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Se alla';

  @override
  String get noItems => 'Inga föremål';

  @override
  String get switchUser => 'Byt användare';

  @override
  String get remoteControl => 'Fjärrkontroll';

  @override
  String get mediaBarLoading => 'Laddar mediafältet...';

  @override
  String get mediaBarError => 'Mediafältet kunde inte laddas';

  @override
  String get offlineServerUnavailable =>
      'Ansluten till internet, men den aktuella servern är inte tillgänglig.';

  @override
  String get offlineNoInternet =>
      'Du är offline. Endast nedladdat innehåll är tillgängligt.';

  @override
  String get offlineFileNotAvailable => 'Filen är inte tillgänglig';

  @override
  String get offlineSwitchServer => 'Byt server';

  @override
  String get offlineSavedMedia => 'Sparade media';

  @override
  String get offlineBannerTitle => 'Du är offline';

  @override
  String get offlineBannerSubtitle => 'Visar dina nedladdningar';

  @override
  String get serverUnreachableBannerTitle => 'Kan inte nå din server';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Spelar från nedladdningar tills den är tillbaka';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Fjärruppspelning';

  @override
  String castControlFailed(String error) {
    return 'Cast-kontrollen misslyckades: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind-kontroller';
  }

  @override
  String get castDeviceVolume => 'Enhetsvolym';

  @override
  String get castVolumeUnavailable => 'Inte tillgänglig';

  @override
  String castStopKind(String kind) {
    return 'Stoppa $kind';
  }

  @override
  String get audioLabel => 'Ljud';

  @override
  String get subtitlesLabel => 'Undertexter';

  @override
  String get pinConfirmTitle => 'Bekräfta PIN-koden';

  @override
  String get pinSetTitle => 'Ställ in PIN-kod';

  @override
  String get pinEnterTitle => 'Ange PIN-kod';

  @override
  String get pinReenterToConfirm => 'Ange din PIN-kod igen för att bekräfta';

  @override
  String pinEnterNDigit(int length) {
    return 'Ange en $length-siffrig PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Ange din $length-siffriga PIN';
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
  String get pinIncorrect => 'Felaktig PIN-kod';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'PIN-koderna stämmer inte överens';

  @override
  String get pinForgot => 'Glömt PIN-koden?';

  @override
  String get pinClear => 'Rensa';

  @override
  String get pinBackspace => 'Backsteg';

  @override
  String get quickConnectAuthorized => 'Quick Connect-begäran godkänd.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect-koden är ogiltig eller har löpt ut.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect stöds inte på den här servern.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Det gick inte att auktorisera Quick Connect-koden.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect är inaktiverat på den här servern.';

  @override
  String get quickConnectForbidden =>
      'Ditt konto kan inte godkänna denna Quick Connect-begäran.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect-koden hittades inte. Prova en ny kod.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect misslyckades: $message';
  }

  @override
  String get quickConnectEnterCode => 'Ange kod';

  @override
  String get quickConnectAuthorize => 'Godkänna';

  @override
  String remoteCommandFailed(String error) {
    return 'Kommandot misslyckades: $error';
  }

  @override
  String get remoteControlTitle => 'Fjärrkontroll';

  @override
  String get remoteFailedToLoadSessions =>
      'Det gick inte att läsa in sessioner';

  @override
  String get remoteNoSessions => 'Inga kontrollerbara sessioner';

  @override
  String get remoteStartPlayback => 'Starta uppspelning på en annan enhet';

  @override
  String get unknownUser => 'Okänd';

  @override
  String get unknownItem => 'Okänd';

  @override
  String get remoteNothingPlaying => 'Ingenting spelas på den här sessionen';

  @override
  String get castingStarted => 'Castningen startade på den valda enheten';

  @override
  String castingFailed(String error) {
    return 'Kunde inte starta cast: $error';
  }

  @override
  String get noRemoteDevices => 'Inga fjärruppspelningsenheter tillgängliga.';

  @override
  String get noRemoteDevicesIos =>
      'Inga fjärruppspelningsenheter tillgängliga.\n\nPå iOS kan AirPlay-mål vara otillgängliga i simulatorn.';

  @override
  String get trackActionPlayNext => 'Spela Nästa';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Lägg till i kö';

  @override
  String get trackActionAddToPlaylist => 'Lägg till i spellista';

  @override
  String get trackActionCancelDownload => 'Avbryt nedladdning';

  @override
  String get trackActionDeleteFromPlaylist => 'Ta bort från spellistan';

  @override
  String get trackActionMoveUp => 'Flytta upp';

  @override
  String get trackActionMoveDown => 'Flytta ner';

  @override
  String get trackActionRemoveFromFavorites => 'Ta bort från favoriter';

  @override
  String get trackActionAddToFavorites => 'Lägg till i Favoriter';

  @override
  String get trackActionGoToAlbum => 'Gå till Album';

  @override
  String get trackActionGoToArtist => 'Gå till Artist';

  @override
  String trackActionDownloading(String name) {
    return 'Laddar ner $name...';
  }

  @override
  String get trackActionDeletedFile => 'Raderad nedladdad fil';

  @override
  String get trackActionDeleteFileFailed =>
      'Det gick inte att ta bort den nedladdade filen';

  @override
  String get shuffleBy => 'Blanda av';

  @override
  String get shuffleSelectLibrary => 'Välj Bibliotek';

  @override
  String get shuffleSelectGenre => 'Välj Genre';

  @override
  String get shuffleLibrary => 'Bibliotek';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Inga kompatibla bibliotek tillgängliga.';

  @override
  String get shuffleNoGenres => 'Inga genrer hittades för detta shuffle-läge.';

  @override
  String get posterDisplayTitle => 'Visa';

  @override
  String get posterImageType => 'Bildtyp';

  @override
  String get imageTypePoster => 'Affisch';

  @override
  String get imageTypeThumbnail => 'Miniatyrbild';

  @override
  String get imageTypeBanner => 'Baner';

  @override
  String get playlistAddFailed => 'Det gick inte att lägga till spellistan';

  @override
  String get playlistCreateFailed => 'Det gick inte att skapa spellista';

  @override
  String get playlistNew => 'Ny spellista';

  @override
  String get playlistCreate => 'Skapa';

  @override
  String get playlistCreateNew => 'Skapa ny spellista';

  @override
  String get playlistNoneFound => 'Inga spellistor hittades';

  @override
  String get addToPlaylist => 'Lägg till i spellista';

  @override
  String get lyricsNotAvailable => 'Inga texter tillgängliga';

  @override
  String get upNext => 'Upp Nästa';

  @override
  String get playNext => 'Spela Nästa';

  @override
  String get stillWatchingContent =>
      'Uppspelningen har pausats. Tittar du fortfarande?';

  @override
  String get stillWatchingStop => 'Stoppa';

  @override
  String get stillWatchingContinue => 'Fortsätta';

  @override
  String skipSegment(String segment) {
    return 'Hoppa över $segment';
  }

  @override
  String get liveTv => 'Direktsänd TV';

  @override
  String get continueWatchingAndNextUp => 'Fortsätt titta och nästa';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Laddar ner $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Laddar ner $fileName';
  }

  @override
  String get nextEpisode => 'Nästa avsnitt';

  @override
  String get moreFromThisSeason => 'Mer från den här säsongen';

  @override
  String get playerTooltipPlaybackSpeed => 'Uppspelningshastighet';

  @override
  String get playerTooltipCastControls => 'Cast-kontroller';

  @override
  String get playerTooltipPlaybackQuality => 'Bithastighet';

  @override
  String get playerTooltipEnterFullscreen => 'Öppna helskärm';

  @override
  String get playerTooltipExitFullscreen => 'Avsluta helskärm';

  @override
  String get playerTooltipFloatOnTop => 'Flyt på toppen';

  @override
  String get playerTooltipExitFloatOnTop => 'Inaktivera flytande på toppen';

  @override
  String get playerTooltipLockLandscape => 'Lås landskap';

  @override
  String get playerTooltipUnlockOrientation => 'Tillåt rotation';

  @override
  String get playerTooltipPrevious => 'Föregående';

  @override
  String get playerTooltipSeekBack => 'Sök tillbaka';

  @override
  String get playerTooltipSeekForward => 'Sök framåt';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Markera som sedd';

  @override
  String get contextMenuMarkUnwatched => 'Markera som ej sedd';

  @override
  String get contextMenuAddToFavorites => 'Lägg till i favoriter';

  @override
  String get contextMenuRemoveFromFavorites => 'Ta bort från favoriter';

  @override
  String get contextMenuGoToSeries => 'Gå till serien';

  @override
  String get contextMenuHideFromContinueWatching => 'Dölj från Fortsätt titta';

  @override
  String get contextMenuHideFromNextUp => 'Dölj från Näst på tur';

  @override
  String get contextMenuAddToCollection => 'Lägg till i samling';

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
      'Öppna serveradministrationspanelen';

  @override
  String get settingsDynamicContent => 'Dynamiskt innehåll';

  @override
  String get settingsDynamicContentSubtitle =>
      'Media Bar och visuella överlägg';

  @override
  String get settingsAboutSubtitle =>
      'Appversion, juridisk information och krediter';

  @override
  String get settingsSortServersBy => 'Sortera servrar efter';

  @override
  String get settingsLastUsed => 'Senast använd';

  @override
  String get settingsAlphabetical => 'Alfabetisk';

  @override
  String get settingsAllowSelfSignedCerts => 'Tillåt självsignerade certifikat';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Lita på servrar som använder självsignerade TLS-certifikat eller certifikat från en privat CA. Aktivera bara för servrar du själv styr. Det här inaktiverar certifikatvalidering för alla anslutningar.';

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
  String get settingsHomePage => 'Hemsida';

  @override
  String get settingsTwentyFourHourClock => '24-timmarsklocka';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Använd 24-timmars tidsformatering varhelst klockan visas';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Visa blandningsknappen i navigeringsfältet';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Visa genreknappen i navigeringsfältet';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Visa favoritknappen i navigeringsfältet';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Visa biblioteksknappen i navigeringsfältet';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Visa Seerr-knappen i navigeringsfältet';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Visa alltid textetiketter i det övre navigeringsfältet';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Växla hemsidans synlighet per bibliotek. Starta om Moonfin för att ändringarna ska träda i kraft.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Mediabar och lokala förhandsvisningar';

  @override
  String get settingsVisualOverlays => 'Visuella överlägg';

  @override
  String get settingsSeasonalSurprise => 'Säsongsbetonad överraskning';

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
  String get settingsHigh => 'Hög';

  @override
  String get settingsLow => 'Låg';

  @override
  String get settingsCustomPath => 'Anpassad sökväg';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Ange sökväg för nedladdningsmapp';

  @override
  String get settingsConcurrentDownloads => 'Samtidiga nedladdningar';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maximalt antal objekt att ladda ner på en gång.';

  @override
  String get settingsAppInfo => 'APPINFO';

  @override
  String get settingsReportAnIssue => 'Rapportera ett problem';

  @override
  String get settingsReportAnIssueSubtitle => 'Öppna problemspåraren på GitHub';

  @override
  String get settingsJoinDiscord => 'Gå med i Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Chatta med samhället';

  @override
  String get settingsJoinTheDiscord => 'Gå med i Discord';

  @override
  String get settingsSupportMoonfin => 'Stöd Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Bjud utvecklaren på en kaffe';

  @override
  String get settingsLegal => 'RÄTTSLIG';

  @override
  String get settingsLicenses => 'Licenser';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Licensmeddelanden med öppen källkod';

  @override
  String get settingsPrivacyPolicy => 'Sekretesspolicy';

  @override
  String get settingsPrivacyPolicySubtitle => 'Hur Moonfin hanterar dina data';

  @override
  String get settingsCheckForUpdates => 'Sök efter uppdateringar';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Sök efter den senaste versionen av Moonfin';

  @override
  String get settingsBoth => 'Både';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Blanda filter för innehållstyp';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Alternativ för ljudspår, bearbetning och passthrough';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatiserad uppspelning och sekvensering';

  @override
  String get settingsSyncplaySubtitle =>
      'Synkroniseringslogik för gruppsessioner';

  @override
  String get settingsSkipIntrosAndOutros => 'Hoppa över Intros och Outros?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Nedräkning för mediesegment';

  @override
  String get settingsProgressBar => 'Förloppsindikator';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'Ingen';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Fråga användare';

  @override
  String get settingsSkip => 'Hoppa';

  @override
  String get settingsDoNothing => 'Gör ingenting';

  @override
  String get settingsMaxBitrateDescription =>
      'Begränsa strömningsbithastigheten. Innehåll över denna tröskel kommer att omkodas för att passa.';

  @override
  String get settingsMaxResolutionDescription =>
      'Begränsa den maximala upplösningen som spelaren kommer att begära. Innehåll med högre upplösning kommer att omkodas ned.';

  @override
  String get settingsPlayerZoomDescription =>
      'Hur video ska skalas för att passa skärmen.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Uppspelningsmotor (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Välj standarduppspelningsmotorn på Android TV-enheter. Ändringar gäller för nästa uppspelningssession.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (rekommenderas)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (äldre)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision Reserv';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Beteende för Dolby Vision-titlar på enheter utan Dolby Vision-avkodning.';

  @override
  String get settingsAskEachTime => 'Fråga varje gång';

  @override
  String get settingsPreferHdr10Fallback => 'Föredrar HDR10 reserv';

  @override
  String get settingsPreferServerTranscode => 'Föredrar serveromkodning';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profil 7 Direktspel';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Styr om Dolby Vision profil 7 förbättringslager strömmar ska styra uppspelning.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFKTKRT aktiverat)';

  @override
  String get settingsEnabledOnThisDevice => 'Aktiverad på den här enheten';

  @override
  String get settingsDisabledPreferTranscode =>
      'Inaktiverad (föredrar omkodning)';

  @override
  String get settingsResumeRewindDescription =>
      'När du återupptar uppspelningen (från Fortsätt titta eller en sida med medieobjekt), hur många sekunder ska du spola tillbaka?';

  @override
  String get settingsUnpauseRewindDescription =>
      'När du återupptar uppspelningen efter att du tryckt på pausknappen, hur många sekunder ska du spola tillbaka?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Hur många sekunder att hoppa tillbaka efter att ha tryckt på tillbakaspolningsknappen.';

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
      'Hur många sekunder att hoppa framåt efter att ha tryckt på snabbspolningsknappen.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitström AC3 till extern dekoder';

  @override
  String get settingsCinemaMode => 'Bioläge';

  @override
  String get settingsCinemaModeSubtitle =>
      'Spela trailers/prerolls före en huvudfunktion';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'Utökad visar ett helt kort med avsnittsbilder och beskrivning. Minimal visar en kompakt nedräkningsöverlagring. Inaktiverad döljer uppmaningen helt.';

  @override
  String get settingsShort => 'Kort';

  @override
  String get settingsLong => 'Lång';

  @override
  String get settingsVeryLong => 'Mycket lång';

  @override
  String get settingsVideoStartDelay => 'Videostartfördröjning';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Direktsänd TV';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Aktivera direktuppspelning för live-tv';

  @override
  String get settingsOpenGroups => 'Öppna grupper';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Skapa, gå med i eller hantera SyncPlay grupper';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Aktiverad';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Aktivera funktioner för gruppvisning';

  @override
  String get settingsSyncplayButton => 'SyncPlay-knapp';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Visa knappen SyncPlay i navigeringsfältet';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Avancerad korrigering';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Aktivera finkornig synkroniseringslogik';

  @override
  String get settingsSyncplaySyncCorrection => 'Synkroniseringskorrigering';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Justera uppspelningen automatiskt för att förbli synkroniserad';

  @override
  String get settingsSyncplaySpeedToSync => 'Hastighet att synkronisera';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Använd uppspelningshastighetsjustering för att synkronisera';

  @override
  String get settingsSyncplaySkipToSync => 'Hoppa till Sync';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Använd söka för att synkronisera';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Minsta hastighetsfördröjning';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Maximal hastighetsfördröjning';

  @override
  String get settingsSyncplaySpeedDuration => 'Hastighet Varaktighet';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minsta överhoppningsfördröjning';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Extra offset';

  @override
  String get onNow => 'På nu';

  @override
  String get collections => 'Samlingar';

  @override
  String get lastPlayed => 'Senast spelade';

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
    return 'Nyligen släppt i $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Spela nästa avsnitt automatiskt';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Spela automatiskt nästa avsnitt när det finns tillgängligt.';

  @override
  String get skipSilenceTitle => 'Hoppa över tystnad';

  @override
  String get skipSilenceSubtitle =>
      'Hoppa automatiskt över tysta ljudavsnitt när strömmen stöder det.';

  @override
  String get allowExternalAudioEffectsTitle => 'Tillåt externa ljudeffekter';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Låt equalizer- och effektappar (t.ex. Wavelet) koppla in sig på Media3-uppspelningssessioner.';

  @override
  String get disableTunnelingTitle => 'Inaktivera tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Framtvinga uppspelning utan tunneling. Användbart på enheter med ljud-/videoavbrott vid tunneling.';

  @override
  String get enableTunnelingTitle => 'Aktivera tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Avancerat. Skickar ljud och video via en kopplad hårdvaruväg. Avstängt som standard eftersom det orsakar ljud-/videobortfall på vissa enheter.';

  @override
  String get mapDolbyVisionP7Title => 'Mappa Dolby Vision-profil 7 till HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Spela upp strömmar med Dolby Vision-profil 7 som HDR10-kompatibel HEVC på enheter utan DV-stöd.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Använd inbäddade undertextstilar';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Använd färger, teckensnitt och positionering som är inbäddade i undertextspåret. Inaktivera för att använda dina egna stilinställningar i stället.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Använd inbäddade teckenstorlekar för undertexter';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Använd de teckenstorlekar som är inbäddade i undertextspåret. Inaktivera för att använda undertextstorleken från dina stilinställningar.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Visa mediedetaljer';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Visa detaljer om det valda objektet högst upp på bibliotekssidorna.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Använd detaljerade underrubriker';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Visa en detaljerad eller minimal underrad på bibliotekssidorna.';

  @override
  String get savedThemesDeleteDialogTitle => 'Ta bort sparat tema?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Ta bort \"$themeName\" från den här enhetens cache?';
  }

  @override
  String get themeStore => 'Temabutik';

  @override
  String get themeStoreSubtitle =>
      'Bläddra bland och spara teman från communityn';

  @override
  String get themeStoreDescription =>
      'Spara ett tema för att använda det som dina andra sparade teman.';

  @override
  String get themeStoreEmpty => 'Inga teman är tillgängliga just nu.';

  @override
  String get themeStoreLoadFailed =>
      'Kunde inte läsa in Temabutiken. Kontrollera anslutningen och försök igen.';

  @override
  String get themeStoreSave => 'Spara';

  @override
  String get themeStoreSaveAndApply => 'Spara och använd';

  @override
  String get themeStoreSaved => 'Sparat';

  @override
  String get themeStoreInvalidMessage => 'Det här temat kunde inte läsas in.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" har sparats.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" har tagits bort från den här enheten.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Kunde inte ta bort \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Sparade teman';

  @override
  String get savedThemesDescription =>
      'Det här är teman som laddats ner från Moonfin-pluginet för den aktuella servern. Borttagning tar endast bort den lokala kopian.';

  @override
  String get savedThemesEmpty =>
      'Inga sparade teman hittades för den här servern.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Används nu';
  }

  @override
  String get savedThemesDeleteTooltip => 'Ta bort sparat tema';

  @override
  String get savedThemesManageSubtitle =>
      'Hantera nedladdade plugin-teman på den här enheten';

  @override
  String get themeEditor => 'Temaredigerare';

  @override
  String get themeEditorSubtitle =>
      'Öppna Moonfins temaredigerare i webbläsaren';

  @override
  String get homeScreen => 'Hemskärm';

  @override
  String get bottomBar => 'Nedre fält';

  @override
  String get homeRowsStyleClassic => 'Klassisk';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Hemrader';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klassisk behåller bildtyp per rad och infoöverlägg. Modern använder rader som går från stående format till bakgrundsbild.';

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
  String get displayFavoritesRows => 'Visa favoritrader';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Visa favoritfilmer, favoritserier och andra favoritrader i hemsektionerna.';

  @override
  String get favoritesRowSorting => 'Sortering av favoritrader';

  @override
  String get favoritesRowSortingDescription =>
      'Sortera favoritrader efter tillagt datum, releasedatum, alfabetiskt och mer.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Visa samlingsrader';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Visa samlingsrader i hemsektionerna.';

  @override
  String get collectionsRowSorting => 'Sortering av samlingsrader';

  @override
  String get collectionsRowSortingDescription =>
      'Sortera samlingsrader efter tillagt datum, releasedatum, alfabetiskt och mer.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Visa genrerader';

  @override
  String get displayGenresRowsSubtitle => 'Visa genrerader i hemsektionerna.';

  @override
  String get genresRowSorting => 'Sortering av genrerader';

  @override
  String get genresRowSortingDescription =>
      'Sortera genrerader efter tillagt datum, releasedatum, alfabetiskt och mer.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Objekt på genrerader';

  @override
  String get genresRowItemsDescription =>
      'Visa filmer, serier eller båda på genrerader.';

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
  String get displayPlaylistsRows => 'Visa spellisterader';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Visa spellisterader i hemsektionerna.';

  @override
  String get playlistsRowSorting => 'Sortering av spellisterader';

  @override
  String get playlistsRowSortingDescription =>
      'Sortera spellisterader efter tillagt datum, releasedatum, alfabetiskt och mer.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Visa ljudrader';

  @override
  String get displayAudioRowsSubtitle => 'Visa ljudrader i hemsektionerna.';

  @override
  String get audioRowsSorting => 'Sortering av ljudrader';

  @override
  String get audioRowsSortingDescription =>
      'Sortera ljudrader efter tillagt datum, releasedatum, alfabetiskt och mer.';

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
  String get audioPlaylists => 'Ljudspellistor';

  @override
  String get appearance => 'Utseende';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Tangentbord';

  @override
  String get navButtons => 'Knappar';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'MPV-konfiguration';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Extern spelarapp';

  @override
  String get externalPlayerAppDescription =>
      'Ange en extern spelare för att aktivera uppspelning vid långtryck';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Visa appväljaren när uppspelningen startar.';

  @override
  String get loadingInstalledPlayers => 'Läser in installerade spelare...';

  @override
  String get connection => 'Anslutning';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Stöds på den här enheten';

  @override
  String get notSupportedOnThisDevice => 'Stöds inte på den här enheten';

  @override
  String get mediaPlayerBehavior => 'Mediespelarens beteende';

  @override
  String get playbackEnhancements => 'Uppspelningsförbättringar';

  @override
  String get alwaysOn => 'Alltid på.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Ersätt Hoppa över outro med Näst på tur';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Visa överlägget Näst på tur i stället för knappen Hoppa över outro.';

  @override
  String get playerRouting => 'Spelardirigering';

  @override
  String get preferSoftwareDecoders => 'Föredra mjukvaruavkodare';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Använd FFmpeg (ljud) och libgav1 (AV1) före hårdvaruavkodare. Inaktivera om HDMI-ljudpassthrough slutar fungera.';

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
      'Öppna videouppspelning i din valda externa app på Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Automatisk kö';

  @override
  String get preferSdhSubtitles => 'Föredra SDH-undertexter';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritera SDH-/CC-undertextspår vid automatiskt val.';

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
  String get webDiagnostics => 'Webbdiagnostik';

  @override
  String get webDiagnosticsTitle => 'Moonfin webbdiagnostik';

  @override
  String get webDiagnosticsIntro =>
      'Använd den här sidan för att felsöka anslutningsproblem i webbläsaren (CORS, blandat innehåll och identifieringsinställningar).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Fel med blandat innehåll upptäckt';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS-/preflight-fel upptäckt';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin upptäckte att en HTTPS-sida försöker anropa en server-URL över HTTP. Webbläsare blockerar sådana anrop innan de når din server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin upptäckte ett anropsfel på webbläsarnivå som vanligtvis beror på att CORS- eller preflight-huvuden saknas på mediaservern.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Mål-URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detaljer: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Aktuell körtidskontext';

  @override
  String get webDiagnosticsOrigin => 'Ursprung';

  @override
  String get webDiagnosticsScheme => 'Schema';

  @override
  String get webDiagnosticsPluginMode => 'Pluginläge';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC-genomsökning';

  @override
  String get webDiagnosticsForcedServerUrl => 'Framtvingad server-URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Standard-URL för server';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL till identifieringsproxy';

  @override
  String get notConfigured => 'inte konfigurerad';

  @override
  String get webDiagnosticsMixedContent => 'Blandat innehåll';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Den här sidan läses in över HTTPS, men en eller flera konfigurerade URL:er använder HTTP. Webbläsare blockerar HTTPS-sidor från att anropa HTTP-API:er.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Åtgärd: publicera din mediaserver eller proxyslutpunkt via HTTPS, eller läs in Moonfin över HTTP endast på betrodda lokala nätverk.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Ingen uppenbar konfiguration med blandat innehåll upptäcktes utifrån de aktuella körtidsinställningarna.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS-checklista';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Tillåt webbläsarens ursprung i Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Inkludera Authorization, X-Emby-Authorization och X-Emby-Token i Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Exponera Content-Range och Accept-Ranges för streaming och spolning.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Svara med 204 på OPTIONS-preflight-förfrågningar.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Exempel på headerkod (nginx-stil)';

  @override
  String get note => 'Obs';

  @override
  String get webDiagnosticsNonWebNote =>
      'Den här diagnostiksidan är avsedd för webbversioner. Om du ser den på en annan plattform kanske kontrollerna inte är relevanta.';

  @override
  String get backToServerSelect => 'Tillbaka till serverval';

  @override
  String get signOutAllUsers => 'Logga ut alla användare';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Behörighet till mikrofonen är permanent nekad. Aktivera den i systeminställningarna.';

  @override
  String get voiceSearchPermissionRequired =>
      'Behörighet till mikrofonen krävs för röstsökning.';

  @override
  String get voiceSearchNoMatch => 'Uppfattade inte det. Försök igen.';

  @override
  String get voiceSearchNoSpeechDetected => 'Inget tal upptäcktes.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofonfel.';

  @override
  String get voiceSearchNeedsInternet => 'Röstsökning kräver internet.';

  @override
  String get voiceSearchServiceBusy => 'Rösttjänsten är upptagen. Försök igen.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Behörighet till mikrofonen är permanent nekad.';

  @override
  String get microphonePermissionDenied =>
      'Behörighet till mikrofonen är nekad.';

  @override
  String get speechRecognitionUnavailable =>
      'Taligenkänning är inte tillgänglig på den här enheten.';

  @override
  String get openIosRoutePicker => 'Öppna iOS-utgångsväljaren';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay-utgångsväljaren är inte tillgänglig på den här enheten.';

  @override
  String get videos => 'Videor';

  @override
  String get programs => 'Program';

  @override
  String get songs => 'Låtar';

  @override
  String get photoAlbums => 'Fotoalbum';

  @override
  String get photos => 'Foton';

  @override
  String get people => 'Personer';

  @override
  String get recentlyReleasedEpisodes => 'Nyligen släppta avsnitt';

  @override
  String get watchAgain => 'Se igen';

  @override
  String get guestAppearances => 'Gästframträdanden';

  @override
  String get appearancesSeerr => 'Framträdanden (Seerr)';

  @override
  String get crewContributionsSeerr => 'Bidrag från teamet (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Titta med grupp';

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
  String get openInBrowser => 'Öppna i webbläsaren';

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
      'Den inbyggda webbläsaren är inte tillgänglig på den här plattformen.';

  @override
  String get adminRestartServerConfirmation =>
      'Är du säker på att du vill starta om servern?';

  @override
  String get adminShutdownServerConfirmation =>
      'Är du säker på att du vill stänga av servern? Du måste starta den manuellt igen.';

  @override
  String get internal => 'Intern';

  @override
  String get idle => 'Inaktiv';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Inga användare hittades';

  @override
  String get adminNoUsersMatchSearch => 'Inga användare matchar din sökning';

  @override
  String get adminNoDevicesFound => 'Inga enheter hittades';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Inga enheter matchar de aktuella filtren';

  @override
  String get remoteAccess => 'Fjärråtkomst';

  @override
  String get localOnly => 'Endast lokalt';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Kunde inte läsa in mediaanalysen';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Sammanslagen analys för alla mediebibliotek.';

  @override
  String get analyticsTopArtists => 'Toppartister';

  @override
  String get analyticsTopAuthors => 'Toppförfattare';

  @override
  String get analyticsTopContributors => 'Främsta bidragsgivare';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bibliotek',
      one: '1 bibliotek',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Inga indexerade mediesummor är tillgängliga för det här valet än.';

  @override
  String get analyticsLibraryDetails => 'Biblioteksdetaljer';

  @override
  String get analyticsLibraryBreakdown => 'Fördelning per bibliotek';

  @override
  String get analyticsNoLibrariesAvailable => 'Inga bibliotek är tillgängliga.';

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
  String get adminServerAdministrationTitle => 'Serveradministration';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Bildcache';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Loggar';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Omkodning';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned => 'Servern returnerade inga sökvägar.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% använt';
  }

  @override
  String get userActivity => 'Användaraktivitet';

  @override
  String get systemEvents => 'Systemhändelser';

  @override
  String get needsAttention => 'Kräver åtgärd';

  @override
  String get homeVideos => 'Hemvideor';

  @override
  String get mixedContent => 'Blandat innehåll';

  @override
  String get homeVideosAndPhotos => 'Hemvideor och foton';

  @override
  String get mixedMoviesAndShows => 'Blandade filmer och serier';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Inga inspelningar hittades';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Inga bildsidor hittades i .$extension-arkivet.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Den inbyggda renderaren misslyckades ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB-renderaren misslyckades ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Lokal fil saknas för läsaren: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status när bokdata skulle öppnas från $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Ingen läsbar bokslutpunkt tillgänglig';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Serietidningsarkivet stöds inte: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Pluginet för CBR-extrahering är inte tillgängligt på den här plattformen.';

  @override
  String get failedToExtractCbrArchive => 'Kunde inte extrahera .cbr-arkivet.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7-extrahering är inte tillgänglig på den här plattformen.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Pluginet för CB7-extrahering är inte tillgängligt på den här plattformen.';

  @override
  String get loadingShuffle => 'Läser in blandning...';

  @override
  String get libraryShuffleLabel => 'BIBLIOTEKSBLANDNING';

  @override
  String get randomShuffleLabel => 'SLUMPMÄSSIG BLANDNING';

  @override
  String get genresShuffleLabel => 'GENREBLANDNING';

  @override
  String get autoHdrSwitching => 'Automatisk HDR-växling';

  @override
  String get autoHdrSwitchingDescription =>
      'Aktivera HDR automatiskt vid uppspelning av HDR-video och återställ visningsläget när du avslutar.';

  @override
  String get whenFullscreen => 'I helskärm';

  @override
  String get changeArtwork => 'Byt omslagsbild';

  @override
  String get missing => 'Saknas';

  @override
  String get clearAllArtworkButton => 'Rensa alla omslagsbilder?';

  @override
  String get clearAllArtworkWarning =>
      'Är du säker på att du vill rensa alla nedladdade omslagsbilder?';

  @override
  String get confirmClear => 'Bekräfta rensning';

  @override
  String confirmClearMessage(String itemType) {
    return 'Är du säker på att du vill rensa $itemType?';
  }

  @override
  String get uploadButton => 'Ladda upp?';

  @override
  String get resolutionLabel => 'Upplösning: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Visa endast omslagsbilder på gränssnittsspråket';

  @override
  String get confirmClearAll => 'Bekräfta rensa alla';

  @override
  String get imageUploadSuccess => 'Bilden har laddats upp!';

  @override
  String imageUploadFailed(String error) {
    return 'Kunde inte ladda upp bilden: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Kunde inte ange bilden: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Kunde inte ta bort bilden: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Kunde inte rensa alla omslagsbilder: $error';
  }

  @override
  String get yes => 'Ja';

  @override
  String get posterCategory => 'Affisch';

  @override
  String get backdropsCategory => 'Bakgrundsbilder';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logotyp';

  @override
  String get thumbnailCategory => 'Miniatyrbild';

  @override
  String get artCategory => 'Grafik';

  @override
  String get discArtCategory => 'Skivgrafik';

  @override
  String get screenshotCategory => 'Skärmbild';

  @override
  String get boxCoverCategory => 'Omslag';

  @override
  String get boxRearCoverCategory => 'Baksidesomslag';

  @override
  String get menuArtCategory => 'Menygrafik';

  @override
  String get confirmItemPoster => 'affischen';

  @override
  String get confirmItemBackdrop => 'bakgrundsbilden';

  @override
  String get confirmItemBanner => 'bannern';

  @override
  String get confirmItemLogo => 'logotypen';

  @override
  String get confirmItemThumbnail => 'miniatyrbilden';

  @override
  String get confirmItemArt => 'grafiken';

  @override
  String get confirmItemDiscArt => 'skivgrafiken';

  @override
  String get confirmItemScreenshot => 'skärmbilden';

  @override
  String get confirmItemBoxCover => 'omslaget';

  @override
  String get confirmItemBoxRearCover => 'baksidesomslaget';

  @override
  String get confirmItemMenuArt => 'menygrafiken';

  @override
  String get resolutionAll => 'Alla';

  @override
  String get resolutionHigh => 'Hög (1080p+)';

  @override
  String get resolutionMedium => 'Mellan (720p)';

  @override
  String get resolutionLow => 'Låg (<720p)';

  @override
  String get sources => 'Källor';

  @override
  String get audiobookChapters => 'Kapitel';

  @override
  String get audiobookBookmarks => 'Bokmärken';

  @override
  String get audiobookNotes => 'Anteckningar';

  @override
  String get audiobookQueue => 'Kö';

  @override
  String get audiobookTimeline => 'Tidslinje';

  @override
  String get audiobookTimelineEmpty => 'Tidslinjen är tom';

  @override
  String get audiobookFocusedTimeline => 'Fokuserad tidslinje';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Exportera bokmärken';

  @override
  String get audiobookExportNotes => 'Exportera anteckningar';

  @override
  String get audiobookExportAll => 'Exportera allt';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exporterat till $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Exporten misslyckades: $error';
  }

  @override
  String get audiobookLyrics => 'Låttexter';

  @override
  String get audiobookAddBookmark => 'Lägg till bokmärke';

  @override
  String get audiobookAddNote => 'Lägg till anteckning';

  @override
  String get audiobookEditNote => 'Redigera anteckning';

  @override
  String get audiobookNoteHint => 'Skriv en anteckning för det här stället';

  @override
  String get audiobookSleepTimer => 'Insomningstimer';

  @override
  String get audiobookSleepOff => 'Av';

  @override
  String get audiobookSleepEndOfChapter => 'Slutet av kapitlet';

  @override
  String get audiobookSleepCustom => 'Anpassad';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining kvar';
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
  String get audiobookPlaybackSpeed => 'Uppspelningshastighet';

  @override
  String get audiobookRemainingTime => 'Återstår';

  @override
  String get audiobookElapsedTime => 'Förfluten tid';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Bakåt ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Framåt ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Föregående kapitel';

  @override
  String get audiobookNextChapter => 'Nästa kapitel';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Kapitel $current av $total';
  }

  @override
  String get audiobookNoChapters => 'Inga kapitel';

  @override
  String get audiobookNoBookmarks => 'Inga bokmärken än';

  @override
  String get audiobookNoNotes => 'Inga anteckningar än';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Bokmärke tillagt vid $position';
  }

  @override
  String get audiobookSpeedReset => 'Återställ till 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Spara';

  @override
  String get audiobookCancel => 'Avbryt';

  @override
  String get audiobookDelete => 'Radera';

  @override
  String get subtitlePreferencesDescription =>
      'Ändra undertextlägen, standardspråk, utseende och renderingsalternativ.';

  @override
  String get subtitleRendering => 'Undertextrendering';

  @override
  String get displayOptions => 'Visningsalternativ';

  @override
  String get releaseDateAscending => 'Releasedatum (stigande)';

  @override
  String get releaseDateDescending => 'Releasedatum (fallande)';

  @override
  String get groupContributions => 'Gruppera bidrag';

  @override
  String get groupMultipleRoles => 'Gruppera flera roller';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Varning om skrivåtkomst till biblioteket';

  @override
  String get libraryWriteAccessHowToFix => 'Så här åtgärdar du det:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Ge Jellyfins tjänsteanvändare (t.ex. jellyfin eller Docker PUID/PGID) skrivbehörighet till ditt mediebiblioteks mappar på servern.\n\n2. Eller gå till Jellyfins kontrollpanel -> Bibliotek, redigera det här biblioteket och inaktivera \'Save artwork into media folders\' för att i stället lagra omslagsbilder i Jellyfins interna databas.';

  @override
  String get dismiss => 'Stäng';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Ditt bibliotek \'$libraryName\' är konfigurerat att spara omslagsbilder direkt i mediemapparna (\'Save artwork into media folders\' är aktiverat). Jellyfin har dock testat skrivåtkomsten och saknar behörighet att skriva filer till den här katalogen:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Det verkar som att Jellyfin inte kunde uppdatera omslagsbilden. Ditt bibliotek är konfigurerat att spara omslagsbilder direkt i mediemapparna (\'Save artwork into media folders\' är aktiverat). Felet uppstår vanligtvis när Jellyfins serverprocess saknar behörighet att skriva filer till dina mediekataloger.';

  @override
  String get replay => 'Spela upp igen';

  @override
  String get fileInformation => 'Filinformation';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Storlek: $size  •  Format: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Visa alla ($count) ljudspår';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Visa alla ($count) undertextspår';
  }

  @override
  String get checkingDirectPlay => 'Kontrollerar stöd för direktuppspelning...';

  @override
  String get directPlayCapabilityLabel => 'Stöd för direktuppspelning: ';

  @override
  String get forced => 'Tvingad';

  @override
  String get transcodeContainerNotSupported =>
      'Containerformatet stöds inte av spelaren.';

  @override
  String get transcodeVideoCodecNotSupported => 'Videocodec stöds inte.';

  @override
  String get transcodeAudioCodecNotSupported => 'Ljudcodec stöds inte.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Undertextformatet stöds inte (kräver inbränning).';

  @override
  String get transcodeAudioProfileNotSupported => 'Ljudprofilen stöds inte.';

  @override
  String get transcodeVideoProfileNotSupported => 'Videoprofilen stöds inte.';

  @override
  String get transcodeVideoLevelNotSupported => 'Videonivån stöds inte.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Videoupplösningen stöds inte av den här enheten.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Videons bitdjup stöds inte.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Videons bildfrekvens stöds inte.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Filens bithastighet överskrider spelarens streaminggräns.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Videons bithastighet överskrider streaminggränsen.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Ljudets bithastighet överskrider streaminggränsen.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Antalet ljudkanaler stöds inte.';

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
  String get sortReleaseAscending => 'Releaseordning (stigande)';

  @override
  String get sortReleaseDescending => 'Releaseordning (fallande)';

  @override
  String get sortCustomDragDrop => 'Anpassad (dra och släpp)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Sorteringsalternativ för spellistor';

  @override
  String get resetSort => 'Återställ sortering';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Se om S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Se om spellistan';

  @override
  String get noSubtitlesFound => 'Inga undertexter hittades.';

  @override
  String get adminControls => 'Administratörskontroller';

  @override
  String get impellerRendering => 'Renderingsmotor (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller är Flutters moderna GPU-renderare som ger mjukare animationer och mindre hackande. På vissa TV-boxar och äldre GPU:er kan den orsaka grafikfel eller svart video – stäng av den om du ser sådant. Automatiskt väljer det bästa standardvärdet för din enhet. Starta om Moonfin för att tillämpa ändringen.';

  @override
  String get impellerAuto => 'Automatiskt';

  @override
  String get impellerOn => 'På';

  @override
  String get impellerOff => 'Av';

  @override
  String get impellerRestartTitle => 'Omstart krävs';

  @override
  String get impellerRestartMessage =>
      'Moonfin måste startas om för att byta renderingsmotor. Stäng appen nu och öppna den igen för att tillämpa ändringen.';

  @override
  String get impellerCloseNow => 'Stäng appen nu';

  @override
  String get adminRefreshLibrary => 'Uppdatera bibliotek';

  @override
  String get adminRefreshAllLibraries => 'Uppdatera alla bibliotek';

  @override
  String get adminRepoSortDateOldest => 'Tillagt datum (äldsta först)';

  @override
  String get adminRepoSortDateNewest => 'Tillagt datum (nyaste först)';

  @override
  String get adminRepoSortNameAsc => 'Alfabetisk (A till Ö)';

  @override
  String get adminRepoSortNameDesc => 'Alfabetisk (Ö till A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Läser in serveranalys... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Matcha källan';

  @override
  String get imdbTop250Movies => 'IMDb Topp 250 filmer';

  @override
  String get imdbTop250TvShows => 'IMDb Topp 250 TV-serier';

  @override
  String get imdbMostPopularMovies => 'IMDb Populäraste filmerna';

  @override
  String get imdbMostPopularTvShows => 'IMDb Populäraste TV-serierna';

  @override
  String get imdbLowestRatedMovies => 'IMDb Lägst betygsatta filmer';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb Högst betygsatta engelskspråkiga filmer';

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
  String get grouping => 'Gruppering';

  @override
  String get groupByType => 'Gruppera efter typ';

  @override
  String get playlistTypes => 'Typer av spellistor';

  @override
  String get playlistTypeVideo => 'Video';

  @override
  String get playlistTypeMusicVideo => 'Music Video';

  @override
  String get playlistTypeAudio => 'Audio';

  @override
  String get playlistTypeAudiobook => 'Ljudbok';

  @override
  String get playlistTypeBook => 'Bok';

  @override
  String get playlistTypePhoto => 'Foto';

  @override
  String get playlistTypeMixed => 'Mixat';

  @override
  String get videoPlaylistsSection => 'Spellistor (video)';

  @override
  String get musicVideoPlaylistsSection => 'Music Video Playlists';

  @override
  String get audioPlaylistsSection => 'Spellistor (audio)';

  @override
  String get audiobookPlaylistsSection => 'Spellistor (ljudböcker)';

  @override
  String get bookPlaylistsSection => 'Spellistor (böcker)';

  @override
  String get photoPlaylistsSection => 'Spellistor (foton)';

  @override
  String get mixedPlaylistsSection => 'Spellistor (blandat)';

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
  String get like => 'Gilla';

  @override
  String get dislike => 'Ogilla';

  @override
  String get personalRatingClear => 'Clear rating';

  @override
  String get personalRatingRated => 'Rated';

  @override
  String get personalRatingMine => 'My Rating';

  @override
  String get personalRatingSaveFailed => 'Could not save rating';

  @override
  String get increase => 'Öka';

  @override
  String get decrease => 'Minska';

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
  String get integrations => 'Integrationer';

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
