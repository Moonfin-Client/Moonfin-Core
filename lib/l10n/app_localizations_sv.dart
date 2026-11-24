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
  String get animeMarkerFiller => 'Fyllmedel';

  @override
  String get animeMarkerMixed => 'Mixat';

  @override
  String get animeMarkerAnimeCanon => 'Anime Canon';

  @override
  String get animeMarkerMangaCanon => 'Manga Canon';

  @override
  String get animeMarkerSubbed => 'Undertextad';

  @override
  String get animeMarkerDubbed => 'Dubbad';

  @override
  String get animeMarkerSubbedAndDubbed => 'Undertextad/dubbad';

  @override
  String get animeMarkerSubbedShort => 'Sub';

  @override
  String get animeMarkerDubbedShort => 'Dub';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Sub/Dub';

  @override
  String get animeMarkerPending => 'I avvaktan på';

  @override
  String get animeMarkerRecap => 'Sammanfattning';

  @override
  String get interfaceLanguage => 'Gränssnittsspråk';

  @override
  String get systemLanguageDefault => 'Systemstandard';

  @override
  String get signIn => 'Logga in';

  @override
  String get signingIn => 'Loggar in...';

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
      'Eller skanna den här koden med en telefon som är inloggad på din server';

  @override
  String get quickConnectTapOrScanHint =>
      'Tryck för att godkänna i din webbläsare, eller skanna den här koden med en annan enhet';

  @override
  String get timesUpTitle => 'Tiden är ute';

  @override
  String get timesUpMessage => 'Det här kontot är inte tillgängligt just nu.';

  @override
  String timesUpResumesToday(String time) {
    return 'Du kan använda den igen idag kl. $time.';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'Du kan använda den igen i morgon kl. $time.';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return 'Du kan använda den igen på $day at $time.';
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
      'Det går inte att logga in med det här kontot just nu. Det kan bero på att det är utanför de tillåtna tiderna, att kontot är spärrat eller inaktiverat. Försök igen senare eller kontakta en administratör.';

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
  String get signedInOnThisDevice => 'Inloggad på den här enheten';

  @override
  String get pinRequired => 'PIN-kod krävs';

  @override
  String get passwordRequired => 'Lösenord krävs';

  @override
  String continueAsUser(String name) {
    return 'Fortsätt som $name';
  }

  @override
  String switchToUser(String name) {
    return 'Byt till $name';
  }

  @override
  String signedInAsOnServer(String user, String server) {
    return 'Inloggad som $user på $server';
  }

  @override
  String get accountActive => 'Aktiv';

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
      'Hur en film eller serie ser ut när man öppnar den.';

  @override
  String get detailScreenStyleMoonfin => 'Klassisk';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get detailScreenStyleSpotlight => 'Spotlight';

  @override
  String get spotlightMoreActions => 'Fler åtgärder';

  @override
  String get spotlightCastCrewStudios =>
      'Skådespelare, filmteam och produktionsbolag';

  @override
  String get spotlightChaptersExtras => 'Kapitel och extramaterial';

  @override
  String get spotlightFileDetails => 'Filinformation';

  @override
  String get spotlightSimilarRecommendations => 'Liknande och rekommendationer';

  @override
  String get spotlightSeasonsEpisodes => 'Säsonger och avsnitt';

  @override
  String get spotlightMoreEpisodes => 'Fler avsnitt';

  @override
  String get spotlightFilmography => 'Filmografi';

  @override
  String get spotlightCollectionsCard => 'Samlingar';

  @override
  String get spotlightPlaylistOrder => 'Spellistans ordning';

  @override
  String get spotlightMoviesAndShows => 'Filmer och serier';

  @override
  String get spotlightSimilarSeerr => 'Liknande (Seerr)';

  @override
  String get spotlightRecommendationsSeerr => 'Rekommendationer (Seerr)';

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
  String get detailScreenStyleMinimalist => 'Minimalistisk';

  @override
  String get detailScreenStyleStage => 'Stage';

  @override
  String get detailScreenStylePremiere => 'Premiär';

  @override
  String get detailScreenStyleQuickLook => 'Översikt';

  @override
  String get detailScreenStyleFrost => 'Frost';

  @override
  String get quickLookOpenFullPage => 'Öppna helsida';

  @override
  String get quickLookBackToClose => 'Tillbaka till stängning';

  @override
  String quickLookSeasonPlayed(int played, int total) {
    return '$played of $total';
  }

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
  String get detailShowFullDate => 'Show Full Date';

  @override
  String get detailShowFullDateSubtitle =>
      'Show the full release or air date instead of only the year on details pages';

  @override
  String get recommendationSystem => 'Rekommendationssystem';

  @override
  String get recommendationSystemSubtitle =>
      'Använd algoritmen ”Moonfin Recommends” för lokala bibliotek, ”Server Recommends” från din mediaserver eller likhetsmått från TMDb online. Obs! Online-rekommendationer kräver integration med Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Serverens rekommendationer';

  @override
  String get recommendationSystemTmdb => 'TMDb-likhet';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Tillämpa betygsgräns på rekommendationer';

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
  String get interfaceLayout => 'Gränssnittets utformning';

  @override
  String get interfaceLayoutSubtitle =>
      'Åsidosätt den upptäckta layouten om enheten avläses felaktigt. Starta om Moonfin för att ändringarna ska träda i kraft.';

  @override
  String get interfaceLayoutAutomatic => 'Automatiskt';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Skrivbord';

  @override
  String get interfaceLayoutPhone => 'Telefon';

  @override
  String get glassQuality => 'Glaskvalitet';

  @override
  String get oledMode => 'OLED-läge';

  @override
  String get oledModeSubtitle =>
      'Förstärk svarta nyanser och ge bilderna mer djup. Fungerar bäst på OLED-skärmar.';

  @override
  String get oledModeSubtle => 'Subtil';

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
  String get performanceMode => 'Prestanda';

  @override
  String get performanceModeSubtitle =>
      'Funktionen mäter automatiskt enheten och begränsar användningen på enheter med begränsat minne, vilket innebär att färre bilder sparas i minnet och att trailrar sparas som stillbilder. Ändringen träder i kraft vid nästa start.';

  @override
  String get performanceModeAuto => 'Auto';

  @override
  String get performanceModeStandard => 'Standard';

  @override
  String get performanceModeReduced => 'Nedsatt';

  @override
  String get rendererMode => 'Renderare';

  @override
  String get rendererModeSubtitle =>
      'Auto använder Impeller på enheter där grafiken körs smidigt och Skia på alla andra enheter. Välj Skia om animationer eller video ser fel ut. Träder i kraft vid nästa start.';

  @override
  String get rendererModeAuto => 'Auto';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack =>
      'Avstängd eftersom prestandan är inställd på ”Reducerad” för den här enheten';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Använd ett helt anpassat tema och växla mellan ett användargränssnitt inspirerat av Apple eller Material.';

  @override
  String get customThemeTitle => 'Anpassat tema';

  @override
  String get customThemeSubtitle =>
      'Anpassade teman ändrar visuella element i hela Moonfin. Välj ett av alternativen som passar din stil.';

  @override
  String get keyboardStyle => 'Tangentbordsstil';

  @override
  String get keyboardStyleDescription =>
      'I läget ”Native” används TV:ns eget tangentbord. ”Classic” är det ursprungliga Moonfin-tangentbordet. ”Glass” är en frostat panel med större tangenter. I läget ”Docked” fyller tangentbordet hela skärmens nedre del och visar vad du skriver ovanför tangenterna.';

  @override
  String get keyboardStyleNative => 'Native';

  @override
  String get keyboardStyleClassic => 'Klassisk';

  @override
  String get keyboardStyleGlass => 'Glass';

  @override
  String get keyboardStyleDocked => 'I docka';

  @override
  String get keyboardSpace => 'mellanslag';

  @override
  String get keyboardHoldForAccents => 'lämna utrymme för accenter';

  @override
  String get keyboardClose => 'stäng';

  @override
  String get controller => 'Styrenhet';

  @override
  String get gamepadNavigation => 'Navigering med spelkontroll';

  @override
  String get gamepadNavigationDescription =>
      'Låt en ansluten spelkontroll flytta fokus och välja objekt';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Den ursprungliga, rena standardversionen av Moonfin.';

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
  String get signInWithPlex => 'Logga in med Plex';

  @override
  String get plexLinkInstructions =>
      'Gå till plex.tv/link på valfri enhet och ange den här koden';

  @override
  String get plexOpenLink => 'Öppna plex.tv/link';

  @override
  String get plexWaitingForApproval => 'Väntar på att du ska godkänna koden...';

  @override
  String get plexSignInWithPassword => 'Logga in med lösenord';

  @override
  String get plexVerificationCode => 'Bekräftelsekod';

  @override
  String get plexNoServers => 'Inga Plex-servrar hittades för detta konto';

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
  String get gameOrientation => 'Spelets inriktning';

  @override
  String get gameOrientationSubtitle => 'Skärmens orientering vid spelande';

  @override
  String get landscape => 'Landskap';

  @override
  String get portrait => 'Porträtt';

  @override
  String get gameEmulatorSettings => 'Emulatorinställningar';

  @override
  String get gameNoCoreOptions =>
      'Den här kärnan har inga justerbara alternativ.';

  @override
  String get gameHoldToOpenMenu => 'Håll in för att öppna menyn';

  @override
  String get gameKeepPlaying => 'Fortsätt spela';

  @override
  String get gameSaveAndExit => 'Spara och avsluta';

  @override
  String get gameExitGame => 'Avsluta spelet';

  @override
  String get gameSavingBeforeExit => 'Sparar…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Det gick inte att spara speltillståndet. Spelet pågår fortfarande.';

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
  String get uiScaleGrandparents => 'Far- och morföräldrar';

  @override
  String get uiScaleGreatGrandparents => 'Farfar- och farmorföräldrar';

  @override
  String get scrollDirection => 'Rullningsriktning';

  @override
  String get scrollDirectionVertical => 'Vertikal';

  @override
  String get scrollDirectionHorizontal => 'Horisontellt';

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
  String get scrollToTop => 'Bläddra till toppen';

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
  String get watched => 'Visad';

  @override
  String get unread => 'Oläst';

  @override
  String get unwatched => 'Inte spelad';

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
  String get latestComics => 'Senaste serierna';

  @override
  String get comics => 'Serier';

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
  String get bookFormatComic => 'Serietidning';

  @override
  String get noBooksFound => 'Inga böcker hittades för denna författare.';

  @override
  String get noBooksFoundDescription =>
      'Det här biblioteket innehåller ännu inga böcker, ljudböcker eller serietidningar.';

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
  String get features => 'Innehåll';

  @override
  String get movies => 'Filmer';

  @override
  String get musicVideos => 'Musikvideor';

  @override
  String get other => 'Övrigt';

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
  String get additionalParts => 'Tilläggsdelar';

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
  String get castMembers => 'Medverkande';

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
  String get finalizingDownload => 'Slutför…';

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
    return 'Borttagningen misslyckades med följande fel: $error';
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
  String get noOtherAudioTracks => 'Inga andra ljudspår';

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
  String get searchingSubtitles => 'Söker efter undertexter…';

  @override
  String get fetchingSubtitles => 'Hämta undertexter';

  @override
  String get downloadingSubtitle => 'Hämtar undertexter…';

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
  String get downloadScopeTitle => 'Vad ska man ladda ner?';

  @override
  String get downloadAllEpisodes => 'Alla avsnitt';

  @override
  String get downloadUnwatchedEpisodes => 'Alla avsnitt som jag inte har sett';

  @override
  String get downloadAllMovies => 'Alla filmer';

  @override
  String get downloadUnwatchedMovies => 'Alla filmer jag inte har sett';

  @override
  String get downloadScopeLoading => 'Laddar objekt...';

  @override
  String get downloadScopeLoadFailed => 'Det gick inte att ladda ner filerna';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size totalt';
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
    return '$size totalt';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count okänt';
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
  String get starring => 'MED';

  @override
  String get directors => 'REGISSÖRER';

  @override
  String get writer => 'MANUSFÖRFATTARE';

  @override
  String get writers => 'MANUSFÖRFATTARE';

  @override
  String get episodeDirector => 'Avsnittsregissör';

  @override
  String episodeDirectorWithRole(String role) {
    return '$role (Avsnitt Direktör)';
  }

  @override
  String get episodeWriter => 'Manusförfattare för avsnittet';

  @override
  String episodeWriterWithRole(String role) {
    return '$role (Manusförfattare)';
  }

  @override
  String get guestStar => 'Gästskådespelare';

  @override
  String guestStarWithRole(String role) {
    return '$role (Gästroll)';
  }

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
  String get shuffleAll => 'Slumpa Alla';

  @override
  String get shuffleAllMusic => 'Blanda all musik';

  @override
  String get carSignInPrompt => 'Logga in på Moonfin i din telefon';

  @override
  String get carServerUnreachable => 'Kan inte nå din server';

  @override
  String get carListenNow => 'Lyssna nu';

  @override
  String get carRecentlyPlayed => 'Senast spelade';

  @override
  String get carInstantMix => 'Instant Mix';

  @override
  String downloadsCount(int count) {
    return '$count nedladdningar';
  }

  @override
  String get perfectMatch => 'Perfekt matchning';

  @override
  String get aiTranslated => 'Översatt med AI';

  @override
  String get machineTranslated => 'Maskinöversatt';

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
  String get showMpvStats => 'Visa mpv-statistik (Skift+I)';

  @override
  String get hideMpvStats => 'Dölj mpv-statistik (Shift+I)';

  @override
  String get showPlaybackStats => 'Show Playback Stats';

  @override
  String get hidePlaybackStats => 'Hide Playback Stats';

  @override
  String get playbackStatsNetworkActivity => 'Network Activity';

  @override
  String get playbackStatsBufferHealth => 'Buffer Health';

  @override
  String get playbackStatsBufferMemory => 'Buffer Memory';

  @override
  String get playbackStatsRebuffers => 'Rebuffers';

  @override
  String get keyboardShortcutsTitle => 'Tangentbordsgenvägar';

  @override
  String get keyboardShortcutsSubtitle =>
      'Tangenter för appen, videospelaren och läsaren';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Tangenter för appen, videospelaren och läsaren';

  @override
  String get keyboardShortcutsSectionApp => 'Överallt';

  @override
  String get keyboardShortcutsSectionAppScope => 'På vilken skärm som helst';

  @override
  String get keyboardShortcutsSectionPlayer => 'Videospelare';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'När en video är öppen, spelas upp eller är pausad';

  @override
  String get keyboardShortcutsSectionReader => 'Bok- och serieläsare';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'När man läser en bok eller en serietidning';

  @override
  String get keyNameArrowKeys => 'Piltangenterna';

  @override
  String get keyNameSpace => 'Rymden';

  @override
  String get keyNameEnter => 'Tryck på Enter';

  @override
  String get keyNameEsc => 'Esc';

  @override
  String get keyNameBackspace => 'Backspace';

  @override
  String get keyNameDelete => 'Radera';

  @override
  String get keyNamePageUp => 'Sidan upp';

  @override
  String get keyNamePageDown => 'Sida nedåt';

  @override
  String get keyNameHome => 'Hem';

  @override
  String get keyNameEnd => 'Slut';

  @override
  String get keyNameShift => 'Skift';

  @override
  String get keyNameCtrl => 'Ctrl';

  @override
  String get keyNameAlt => 'Alt';

  @override
  String get keyNameScrollWheel => 'Rullhjul';

  @override
  String get shortcutMoveFocus => 'Bläddra mellan objekten';

  @override
  String get shortcutActivate => 'Öppna det markerade objektet';

  @override
  String get shortcutGoBack => 'Gå tillbaka';

  @override
  String get shortcutToggleFullscreen =>
      'Aktivera eller inaktivera helskärmsläge';

  @override
  String get shortcutQuit => 'Avsluta Moonfin';

  @override
  String get shortcutPlayPause => 'Spela upp eller pausa';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Visa kontrollerna, eller uppspelning/paus om de visas';

  @override
  String get shortcutSeekBack => 'Sök bakåt (håll ned för större hopp)';

  @override
  String get shortcutSeekForward => 'Titta framåt (håll kvar för större hopp)';

  @override
  String get shortcutVolumeUp => 'Höj volymen';

  @override
  String get shortcutVolumeDown => 'Sänk volymen';

  @override
  String get shortcutMute => 'Stäng av eller slå på ljudet';

  @override
  String get shortcutToggleSubtitles => 'Slå på eller stäng av undertexter';

  @override
  String get shortcutSlower => 'Ta det lugnt';

  @override
  String get shortcutFaster => 'Snabba upp';

  @override
  String get shortcutPlaybackInfo => 'Visa uppspelningsinformation';

  @override
  String get shortcutMpvStats => 'Aktivera eller inaktivera MPV-statistik';

  @override
  String get shortcutRecropBlackBars => 'Beskär svarta fält';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Avsluta helskärmsläget, eller avbryt om det inte är helskärmsläge';

  @override
  String get shortcutHideControls => 'Dölj kontrollerna';

  @override
  String get shortcutStopPlayback => 'Avbryt uppspelningen';

  @override
  String get shortcutNextItem => 'Nästa punkt';

  @override
  String get shortcutPreviousItem => 'Föregående post';

  @override
  String get shortcutSkipSegment =>
      'Hoppa över intro eller eftertexter när det erbjuds';

  @override
  String get shortcutShowShortcuts => 'Visa den här listan';

  @override
  String get shortcutNextPage => 'Nästa sida';

  @override
  String get shortcutPreviousPage => 'Föregående sida';

  @override
  String get shortcutScrollPage => 'Bläddra på sidan (e-böcker)';

  @override
  String get shortcutFirstPage => 'Första sidan eller början av kapitlet';

  @override
  String get shortcutLastPage => 'Sista sidan eller slutet av kapitlet';

  @override
  String get shortcutZoom => 'Zooma in eller ut (serier)';

  @override
  String get shortcutResetZoom => 'Återställ zoom (serier)';

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
  String get videoRenderer => 'Videorenderare';

  @override
  String get videoRendererDescription =>
      'I ”Native”-fönstret får du den jämnaste rörelsen och HDR-bilden skickas vidare till skärmen utan att bearbetas. Prova ett annat alternativ om videon inte fungerar som den ska.';

  @override
  String get videoRendererNativeWindow => 'Inbyggt fönster (rekommenderas)';

  @override
  String get videoRendererNativeHdrOnly => 'Eget fönster endast för HDR';

  @override
  String get videoRendererInApp => 'I appen (äldre version)';

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
  String get bookReadingUnavailableTitle =>
      'Man kan inte läsa böcker på Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Öppna den i Moonfin på en mobil, surfplatta eller dator för att läsa den. Ljudböckerna kan fortfarande spelas upp här.';

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
  String get guideRepeatBadge => 'Upprepa';

  @override
  String get guideTimeline => 'Guide Tidslinje';

  @override
  String failedToLoadGuide(String error) {
    return 'Kunde inte läsa in tablån: $error';
  }

  @override
  String get noChannelsFound => 'Inga kanaler hittades';

  @override
  String get noProgramData => 'Inga programuppgifter';

  @override
  String get liveBadge => 'BO';

  @override
  String get liveTvJumpToLive => 'Gå till Live';

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
    return 'Nästa inspelning av serien: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'Serien är schemalagd för inspelning, men i programguiden finns inga kommande avsnitt';

  @override
  String get seriesRecordingSkipsShowing =>
      'Serien kommer att hoppa över detta avsnitt vid inspelningen';

  @override
  String get seriesRecordingEpisodesQuestion => 'Vilka avsnitt bör spelas in?';

  @override
  String get seriesRecordingAllEpisodes => 'Alla avsnitt';

  @override
  String get seriesRecordingAllEpisodesDescription =>
      'Varje sändning, inklusive repriser';

  @override
  String get seriesRecordingNotRecordedEpisodes =>
      'Avsnitt som ännu inte har spelats in';

  @override
  String get seriesRecordingNotRecordedEpisodesDescription =>
      'Hoppar över avsnitt som redan finns i ditt bibliotek och spelar in varje avsnitt en gång';

  @override
  String get seriesRecordingNewEpisodesOnly => 'Endast nya avsnitt';

  @override
  String get seriesRecordingNewEpisodesOnlyDescription =>
      'Endast första sändningar, inga repriser';

  @override
  String get seriesRecordingSettings => 'Serieinställningar';

  @override
  String get seriesRecordingUpdated => 'Uppdatering av serieinspelningarna';

  @override
  String get failedToUpdateSeriesRecording =>
      'Det går inte att uppdatera serieinspelningen';

  @override
  String get recordCurrentEpisode => 'Spela in det här avsnittet';

  @override
  String get recordCurrentProgram => 'Spela in det här programmet';

  @override
  String get cancelCurrentRecording => 'Avbryt denna inspelning';

  @override
  String get cancelRecordingAction => 'Avbryt inspelning';

  @override
  String get programSetToRecord => 'Programmet är inställt för inspelning';

  @override
  String get recordingCancelled => 'Inspelningen avbröts';

  @override
  String get unableToCreateRecording => 'Kunde inte skapa inspelning';

  @override
  String get recordSeries => 'Rekordserie';

  @override
  String get seriesSetToRecord => 'Serien är redo att slå rekord';

  @override
  String get seriesRecordingCancelled => 'Serieinspelningen har ställts in';

  @override
  String get unableToCreateSeriesRecording =>
      'Det går inte att skapa en serieinspelning';

  @override
  String get watch => 'Titta';

  @override
  String get watchChannelLive => 'Se kanalen live';

  @override
  String get close => 'Stäng';

  @override
  String failedToPlayChannel(String name) {
    return 'Kunde inte spela upp $name';
  }

  @override
  String get playbackStreamLost =>
      'Uppspelningen avbröts och kunde inte återupptas.';

  @override
  String get playbackVideoUnsupported =>
      'Den här enheten kan inte spela upp den här videon på grund av formatet. Prova med en extern spelare.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Återansluter… ($attempt of $total)';
  }

  @override
  String playerMatchingDisplayRate(String fps) {
    return 'Anpassa skärmen till $fps fps…';
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
  String get savedMedia => 'Nedladdningar';

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
  String get activeDownloads => 'Aktiva nedladdningar';

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
  String get savedMediaSelectItems => 'Välj artiklar';

  @override
  String get savedMediaNoDownloads => 'Inget har sparats ännu';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Nedladdningar som du startar visas här och kan spelas upp utan internetanslutning.';

  @override
  String get savedMediaNoActiveDownloads =>
      'Det pågår ingen nedladdning just nu';

  @override
  String get savedMediaNoResults =>
      'Inga nedladdningar stämmer överens med den sökningen';

  @override
  String get savedMediaPlayFromStart => 'Spela från början';

  @override
  String get savedMediaGoToDetails => 'Gå till detaljer';

  @override
  String get savedMediaDeleteDownload => 'Ta bort nedladdning';

  @override
  String savedMediaDeleteSeason(String season) {
    return 'Ta bort $season';
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
  String get savedMediaOpenShow => 'Öppen utställning';

  @override
  String get savedMediaPlayNextUnwatched =>
      'Spela upp nästa som du inte har sett';

  @override
  String get savedMediaRead => 'Läsa';

  @override
  String get savedMediaCancelDownload => 'Avbryt nedladdningen';

  @override
  String get sortBySize => 'Storlek';

  @override
  String get sortByName => 'Namn';

  @override
  String get sortByDateAdded => 'Datum för tillägg';

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
  String get settings => 'Inställningar';

  @override
  String get settingsSearchHint => 'Sökinställning';

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
  String get showPosterLabels => 'Etiketter för affischer';

  @override
  String get showPosterLabelsSubtitle =>
      'Visa märkningarna på affischerna, till exempel 4K eller HDR.';

  @override
  String get always => 'Alltid';

  @override
  String get mixedRowsOnly => 'Endast blandade rader';

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
  String get loadingAnimation => 'Laddningsanimation';

  @override
  String get loadingAnimationDescription =>
      'Anpassa de laddningsanimationer som används i hela Moonfin';

  @override
  String get loadingAnimationConfiguration =>
      'Konfiguration av laddningsanimation';

  @override
  String get loadingAnimationImage => 'Bild';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Moonfin logotypen';

  @override
  String get loadingAnimationImageSpinner => 'Spinner';

  @override
  String get loadingAnimationImageRunner => 'Löpare';

  @override
  String get loadingAnimationImageMoonPhases => 'Månfaser';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Moonfin-faser';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Neonfins faser';

  @override
  String get loadingAnimationSize => 'Animationens storlek';

  @override
  String get loadingAnimationSizeThumbnail => 'Miniatyrbild';

  @override
  String get loadingAnimationSizeSmall => 'Små';

  @override
  String get loadingAnimationSizeMedium => 'Mellan';

  @override
  String get loadingAnimationSizeLarge => 'Stor';

  @override
  String get loadingAnimationPosition => 'Animationsposition';

  @override
  String get loadingAnimationPositionTopLeft => 'Övre vänstra hörnet';

  @override
  String get loadingAnimationPositionTopCenter => 'Övre mitten';

  @override
  String get loadingAnimationPositionTopRight => 'Övre högra hörnet';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Mitten-vänster';

  @override
  String get loadingAnimationPositionMiddle => 'Mitten';

  @override
  String get loadingAnimationPositionMiddleRight => 'Mitten-höger';

  @override
  String get loadingAnimationPositionBottomLeft => 'Nederst till vänster';

  @override
  String get loadingAnimationPositionBottomCenter => 'Längst ner i mitten';

  @override
  String get loadingAnimationPositionBottomRight => 'Nederst till höger';

  @override
  String get loadingAnimationPositionBouncing => 'Studsande';

  @override
  String get loadingAnimationSpeed => 'Animationshastighet';

  @override
  String get loadingAnimationSpeedSlow => 'Långsamt';

  @override
  String get loadingAnimationSpeedModerate => 'Måttlig';

  @override
  String get loadingAnimationSpeedFast => 'Snabbt';

  @override
  String get loadingAnimationSpeedUltra => 'Ultra';

  @override
  String get showLoadingAnimationText => 'Visa text';

  @override
  String get loadingAnimationPreview => 'Förhandsgranskning';

  @override
  String get snow => 'Snö';

  @override
  String get fireworks => 'Fyrverkeri';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Fallande löv';

  @override
  String get seasonalChristmas => 'Jul';

  @override
  String get seasonalPetals => 'Vårens blomblad';

  @override
  String get seasonalFireflies => 'Tulikärpäset';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Densitet';

  @override
  String get seasonalDensityLight => 'Ljus';

  @override
  String get seasonalDensityNormal => 'Normal';

  @override
  String get seasonalDensityHeavy => 'Tung';

  @override
  String get seasonalFollower => 'Focus Follower';

  @override
  String get seasonalFollowerDescription =>
      'Ett högtidsinslag, som planchettan till Halloween, följer det du väljer på startsidan';

  @override
  String get seasonalFollowerPointerDescription =>
      'Ett högtidssymbol, till exempel en planchette till Halloween, ersätter muspekaren på startsidan';

  @override
  String get seasonalRow => 'Säsongsrad';

  @override
  String get seasonalRowDescription =>
      'Visa en rad julfilmer från ditt bibliotek, med förslag från Seerr om sådana finns.';

  @override
  String get seasonalRowSubtitle => 'Säsongsbetonat';

  @override
  String get seasonalRowCountry => 'Land';

  @override
  String get seasonalRowCountryAuto => 'Automatiskt';

  @override
  String get countryUnitedStates => 'Förenta staterna';

  @override
  String get countryCanada => 'Kanada';

  @override
  String get seasonalRowCountryOther => 'Andra';

  @override
  String get seasonalRowHolidays => 'Helgdagar';

  @override
  String get seasonalRowHolidaysHint =>
      'Avmarkera en helgdag för att dölja raden med den.';

  @override
  String get seasonalRowAllYear => 'Visa hela året';

  @override
  String get seasonalRowAllYearDescription =>
      'Visa en rad med helgdagar även utanför helgdagarna, med en annan markerad helgdag för varje dag.';

  @override
  String get holidayNewYear => 'Nyår';

  @override
  String get holidayValentines => 'Alla hjärtans dag';

  @override
  String get holidayEaster => 'Påsk';

  @override
  String get holidayPride => 'Stolthet';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Tacksägelsedagen';

  @override
  String get holidayChristmas => 'Julfilmer';

  @override
  String get holidayLunarNewYear => 'Det kinesiska nyåret';

  @override
  String get holidayDiwali => 'Ljusfestivalen';

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
  String get detailsBackgroundOpacity => 'Bakgrundsopacitet för detaljvy';

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
  String get cropBlackBars => 'Beskär svarta fält';

  @override
  String get settingsCropBlackBarsDescription =>
      'Identifiera kodade letterbox-ränder efter att uppspelningen har startat, beskär dem och fyll sedan skärmen. Beskär på nytt med hjälp av spelarens zoomknapp.';

  @override
  String get cropBlackBarsRecropInterval => 'Intervall mellan skördar';

  @override
  String get cropBlackBarsOnce => 'När man väl är vid start';

  @override
  String get cropBlackBarsEverySecond => 'Varje sekund';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Följ förändringar i bildförhållandet under uppspelningen.';

  @override
  String get playerRecroppingBlackBars => 'Ombeskärning av svarta fält';

  @override
  String get playerBlackBarsCropped => 'Svarta fält har beskärts';

  @override
  String get playerNoBlackBarsFound => 'Inga svarta fält hittades';

  @override
  String get playerBlackBarsNotDetected =>
      'Det gick inte att upptäcka svarta fält. Försök igen i en ljusare scen';

  @override
  String get stretch => 'Sträcka';

  @override
  String get refreshRateSwitching => 'Byte av uppdateringsfrekvens';

  @override
  String get disabled => 'Inaktiverad';

  @override
  String get manual => 'Handbok';

  @override
  String get autoDetect => 'Automatisk detektering';

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
  String get trickplayDisplayStyleSingle => 'Enstaka miniatyrbild';

  @override
  String get trickplayDisplayStyleStrip => 'Filmremsa';

  @override
  String get trickplayModeFull => 'Helskärm';

  @override
  String get trickplaySettingsPreviewHint =>
      'Dra i skjutreglaget för att förhandsgranska skrubbningen';

  @override
  String get trickplayPreviewScale => 'Förhandsgranskningsstorlek';

  @override
  String get trickplayVerticalOffset => 'Avstånd från sökfältet';

  @override
  String get trickplayFollowScrubPosition => 'Följ skrubbpositionen';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Förhandsgranska bilderna längs sökreglaget när du drar med fingret, istället för att de förblir centrerade';

  @override
  String get trickplayPauseWhileScrubbing => 'Paus under skrubbning';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Uppspelningen pausas medan du söker och återupptas när du trycker på uppspelningsknappen. Stäng av den här funktionen för att fortsätta uppspelningen och hoppa direkt till den nya platsen';

  @override
  String get showDescriptionOnPause => 'Visa beskrivning på paus';

  @override
  String get dimVideoShowOverview =>
      'Dimma videon och visa översiktstext medan den är pausad';

  @override
  String get showChapterMarkers => 'Kapitelmarkeringar';

  @override
  String get showChapterMarkersDescription =>
      'Markera var varje kapitel börjar på sökreglaget';

  @override
  String get osdLockButton => 'OSD-låsknapp';

  @override
  String get osdLockButtonDescription =>
      'Visa en låsknapp som blockerar beröringsinmatning tills den trycks ner länge';

  @override
  String get playerSwipeGestures =>
      'Markera var varje kapitel börjar på sökreglaget';

  @override
  String get playerSwipeGesturesDescription =>
      'Dra uppåt eller nedåt på spelaren för att justera ljusstyrkan till vänster och volymen till höger';

  @override
  String get invertGestureIndicators => 'Vänd gestindikatorer';

  @override
  String get invertGestureIndicatorsDescription =>
      'Placera de visuella indikatorerna för ljusstyrka och volym på samma sida eller på motsatt sida av skärmen i förhållande till svepningen';

  @override
  String get gestureIndicatorSame => 'Samma';

  @override
  String get gestureIndicatorInverted => 'Upp och ned';

  @override
  String get osdButtons => 'Spelarknappar';

  @override
  String get osdButtonsDescription => 'Välj vilka knappar spelaren visar';

  @override
  String get osdButtonsSectionDescription =>
      'Uppspelningskontrollerna visas alltid. Allt nedanför är upp till dig, och varje typ av enhet sparar sin egen lista.';

  @override
  String get detailButtons => 'Åtgärdsknappar';

  @override
  String get detailButtonsDescription =>
      'Välj vilka knappar som ska visas i detaljvyn';

  @override
  String get detailButtonsSectionDescription =>
      '\"Spela upp\" visas alltid först och låsta knappar visas alltid. Allt annat är upp till dig, och varje typ av enhet sparar sin egen lista.';

  @override
  String get actionButtonsOnScreen => 'Åtgärdsknappar på skärmen';

  @override
  String get actionButtonsOnScreenDescription =>
      'Anpassa hur många åtgärdsknappar som ska visas innan de döljs i menyn ”Fler åtgärder”.';

  @override
  String get actionButtonsOnScreenAuto =>
      'Auto (standardinställning för temat)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (Endast uppspelning)';

  @override
  String get actionButtonsOnScreenAll => 'Alla (horisontell rullning)';

  @override
  String get detailMetadata => 'Metadata-rad';

  @override
  String get detailMetadataDescription =>
      'Välj och ändra ordningen på vilka metadata som ska visas på informationsskärmen';

  @override
  String get detailMetadataSectionDescription =>
      'Aktivera eller inaktivera metadataobjekt och ange i vilken ordning de ska visas på detaljskärmen. Varje typ av enhet har sin egen lista.';

  @override
  String get detailMetadataYear => 'Utgivningsår';

  @override
  String get detailMetadataParentalRating => 'Åldersgräns';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Sändningstid & säsonger';

  @override
  String get detailMetadataStatus => 'Seriestatus';

  @override
  String get detailMetadataStatusSubtitle =>
      'Visar om serien pågår, har avslutats eller kommer tillbaka';

  @override
  String get detailMetadataGenres => 'Genrer';

  @override
  String get detailMetadataSeerrAvailability => 'Seerrs tillgänglighet';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Visar status för förfrågningar och medietillgänglighet från Seerr';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Kommande avsnitt';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Använder Sonarr och TMDB för att visa kommande releasedatum';

  @override
  String get detailSections => 'Avsnitt';

  @override
  String get detailSectionsDescription =>
      'Välj vilka delar av skärmen ”Detaljer” som ska visas';

  @override
  String get detailSectionsScreenDescription =>
      'Endast de avsnitt som kan visas i den aktuella utformningen av detaljskärmen visas i listan. Om du döljer ett avsnitt döljs det i alla utformningar där det förekommer.';

  @override
  String get detailSectionGroupHeader => 'Rubrik';

  @override
  String get detailSectionGroupSections => 'Avsnitt';

  @override
  String get detailSectionGroupPerson => 'Personsidor';

  @override
  String get detailSectionGroupCollection => 'Samlingssidor';

  @override
  String get detailSectionGroupOther => 'Övrigt';

  @override
  String get detailSectionLogo => 'Logotyp';

  @override
  String get detailSectionLogoSubtitle =>
      'Visar titeln som text när den är avstängd';

  @override
  String get detailSectionTagline => 'Slogan';

  @override
  String get detailSectionPoster => 'Affisch';

  @override
  String get detailSectionVersionBadge => 'Versionsmärkning';

  @override
  String get detailSectionUpNext => 'Nästa avsnitt';

  @override
  String get detailSectionLyrics => 'Låttexter';

  @override
  String get detailSectionCast => 'Rollista';

  @override
  String get detailSectionCastSubtitle => 'Även på samlingssidorna';

  @override
  String get detailSectionCrew => 'Regissörer & manusförfattare';

  @override
  String get detailSectionStudios => 'Studior';

  @override
  String get detailSectionChapters => 'Kapitel';

  @override
  String get detailSectionExtras => 'Extramaterial';

  @override
  String get detailSectionCollections => 'Samlingar';

  @override
  String get detailSectionMoreLikeThis => 'Mer sånt här';

  @override
  String get detailSectionMoreLikeThisSubtitle => 'Liknande album och artister';

  @override
  String get detailSectionMoreEpisodes => 'More episodes';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'På avsnittssidorna';

  @override
  String get detailSectionMediaInfo => 'Medieinformation';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'Kontroll av filer, strömmar och Direct Play';

  @override
  String get detailSectionSeerrGenresTags => 'Genrer & taggar';

  @override
  String get detailSectionSeerrStats => 'Statistik';

  @override
  String get detailSectionSeerrStreaming => 'Streamingtjänster';

  @override
  String get seerrStreamingOn => 'Streaming på';

  @override
  String get detailSectionSeerrRecommendations => 'Rekommendationer';

  @override
  String get detailSectionSeerrSimilar => 'Liknande titlar';

  @override
  String get detailSectionSeerrCollection => 'Samlingsbanner';

  @override
  String get detailSectionSeerrPersonAppearances => 'Medverkan';

  @override
  String get detailSectionSeerrPersonCrew => 'Medverkande';

  @override
  String get detailSectionPersonPagesSubtitle => 'På personsidor';

  @override
  String get detailSectionBiography => 'Biografi';

  @override
  String get detailSectionBirthplace => 'Födelseort';

  @override
  String get detailSectionPersonLinks => 'Länkar';

  @override
  String get detailSectionPersonLinksSubtitle =>
      'IMDb, TMDB och sociala medier';

  @override
  String get detailSectionGuestAppearances => 'Gästframträdanden';

  @override
  String get detailSectionMusicVideos => 'Musikvideor';

  @override
  String get detailSectionPlaylistOrder => 'Spellistans ordning';

  @override
  String get detailSectionBookGenres => 'Bokgenrer';

  @override
  String get detailSectionPhotoExif => 'Bildinformation';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Nästa: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'I dag';

  @override
  String get upcomingEpisodeTomorrow => 'I morgon';

  @override
  String get radarrCalendarRow => 'Kommande filmer (Radarr)';

  @override
  String get sonarrCalendarRow => 'Kommande TV-program (Sonarr)';

  @override
  String get mergedCalendarRow => 'Kommande utgåvor';

  @override
  String get arrCalendarsRowSubtitle => 'Radarr- och Sonarr-kalendrar';

  @override
  String get radarrCalendarRowSubtitle => 'Radarr kalendern';

  @override
  String get sonarrCalendarRowSubtitle => 'Sonarr Kalendern';

  @override
  String calendarReleaseIn(int days, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'In $days days',
      one: 'Tomorrow',
      zero: 'Today',
    );
    return '$_temp0 ($date)';
  }

  @override
  String get calendarReleaseCinema => 'Bio';

  @override
  String get calendarReleaseDigital => 'Digitalt';

  @override
  String get calendarReleasePhysical => 'Fysisk';

  @override
  String get upcomingCalendars => 'Kommande evenemang';

  @override
  String get upcomingCalendarsDescription =>
      'Välj vad som ska visas i Radarr- och Sonarr-raderna.';

  @override
  String get radarrCalendarShowCinema => 'Visa kommande biopremiärer';

  @override
  String get radarrCalendarShowDigital => 'Visa kommande digitala utgåvor';

  @override
  String get radarrCalendarShowPhysical => 'Visa kommande fysiska utgåvor';

  @override
  String get calendarShowReleaseDate => 'Visa utgivningsdatum på startskärmen';

  @override
  String get radarrCalendarHideDownloaded =>
      'Dölj filmer som redan finns på servern';

  @override
  String get sonarrCalendarShowEpisodeInfo => 'Visa information om avsnittet';

  @override
  String get sonarrCalendarHideDownloaded =>
      'Dölj avsnitt som redan finns på servern';

  @override
  String get mergeRadarrSonarrCalendars =>
      'Slå ihop Sonarr- och Radarr-kalendrarna';

  @override
  String get moveUp => 'Flytta upp';

  @override
  String get moveDown => 'Flytta ned';

  @override
  String get buttonOrderHint =>
      'Använd pilarna för att ändra ordningen. På en fjärrkontroll flyttar vänster och höger den markerade knappen. Om du inaktiverar en knapp hamnar den under de övriga.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Visas endast när du deltar i en tittarfest';

  @override
  String get orientationLock => 'Skärmorienteringslås';

  @override
  String get fullscreen => 'Helskärm';

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
  String get transcodeAudioCodecs => 'Omkodning av ljudkodekar';

  @override
  String get transcodeAudioCodecsDescription =>
      'Servern omvandlar ljud i dessa format istället för att skicka det som det är.';

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
      'Hur komprimerat surroundljud når din TV eller din receiver.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Inaktiverat (avkoda alltid på den här enheten)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Auto (stöd för enheter som identifierats automatiskt)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Handbok (välj format nedan)';

  @override
  String get settingsAudioPassthroughOutput => 'Genomgångsutgång';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'Den som packar bitströmmar för HDMI-anslutningen. Prova appen Packer om passthrough inte fungerar eller krånglar på den här enheten.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Automatisk systempackare (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec =>
      'App-packare (AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'App (IEC)';

  @override
  String get settingsAudioPassthroughFallback => 'Decode Silent Passthrough';

  @override
  String get settingsAudioPassthroughFallbackDescription =>
      'If the output can\'t play a passthrough track and stays silent, decode it on this device instead.';

  @override
  String get settingsDownmixToStereoDescription =>
      'Mixa ner allt avkodat ljud till två kanaler.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Bitstream E-AC-3, inklusive Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'Bitstream DTS-HD, inklusive DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Bitstream TrueHD, inklusive Dolby Atmos.';

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
  String get subtitleDownloadLanguages =>
      'Språk för nedladdning av undertexter';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'Språk att söka efter vid nedladdning av undertexter, upp till 5. Systemet söker automatiskt efter ett språk som väljs utifrån ditt standardspråk för undertexter eller videon.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Önskat språk för undertexter (alternativ)';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Visa ett andra undertextspår samtidigt. I undertextmenyn frågas man då först vilket spår som ska vara det primära och vilket det sekundära.';

  @override
  String get defaultToNoSubtitles => 'Standard är Inga undertexter';

  @override
  String get turnOffSubtitlesByDefault => 'Stäng av undertexter som standard';

  @override
  String get subtitleSize => 'Undertextstorlek';

  @override
  String get primarySubtitleSlot => 'Grundspår';

  @override
  String get secondarySubtitleSlot => 'Andra spåret';

  @override
  String get secondarySubtitleTrack => 'Sekundära undertexter';

  @override
  String get secondaryDelayAdjustment => 'Justering av sekundärfördröjning';

  @override
  String decreaseValue(String setting) {
    return 'Minskning $setting';
  }

  @override
  String increaseValue(String setting) {
    return 'Öka $setting';
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
  String get semiTransparentWhite => 'Halvgenomskinligt vitt';

  @override
  String get lightGray => 'Ljusgrå';

  @override
  String get darkGray => 'Mörkgrå';

  @override
  String get blue => 'Blå';

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
    return 'Återställ $profile?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Detta raderar profilen $profile från servern och återställer alla synkroniserade inställningar på den här enheten till standard.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Detta raderar alla sparade profiler från servern och återställer alla synkroniserade inställningar på den här enheten till standard.';

  @override
  String profileReset(String profile) {
    return 'Återställde profilen $profile till standard.';
  }

  @override
  String get resetRatingsTitle => 'Återställ betyg?';

  @override
  String get resetRatingsDescription =>
      'Detta återställer alla betygssinställningar till standard, inklusive vilka källor som visas och i vilken ordning de visas.';

  @override
  String get ratingsReset => 'Återställde alla betyg till standard.';

  @override
  String failedToResetProfile(String profile) {
    return 'Misslyckades med att återställa profilen $profile.';
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
  String get tvOfflineDownloads => 'Aktivera nedladdningar offline';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Visa nedladdningsalternativ på artikelsidorna';

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
  String get sdCard => 'SD-kort';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android tillåter endast Moonfin att skriva till de mappar som appen äger, och den här enheten har inget utbytbart lagringsutrymme. Aktivera alternativet ”Spara i mappen Nedladdningar” ovan för att spara nedladdningar på en plats som andra appar kan komma åt.';

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
      'Omkodning: Återstående tid ej tillgänglig';

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
  String get showLiveTvButton => 'Knappen ”Visa direktsänd TV”';

  @override
  String get showDownloadsButton => 'Visa knappen Hämta';

  @override
  String get showLibrariesInToolbar => 'Visa bibliotek i verktygsfältet';

  @override
  String get showLibrariesIndividually => 'Visa bibliotek ett i taget';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Visa varje bibliotek som en egen knapp i navigeringsfältet istället för i menyn ”Bibliotek”';

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
  String get mergeLibrariesByType => 'Slå ihop film- och TV-seriebiblioteken';

  @override
  String get mergeLibrariesByTypeDescription =>
      'När bibliotek med flera servrar är aktiverat visas ett filmbibliotek och ett TV-seriebibliotek för alla servrar. En titel som finns på flera servrar listas endast en gång.';

  @override
  String mergedServerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'On $count servers',
    );
    return '$_temp0';
  }

  @override
  String mergedCopiesNotChanged(String servers) {
    return 'Har inte ändrats den $servers';
  }

  @override
  String get recentlyAddedAndReleased => 'Nyligen tillagda och släppta';

  @override
  String get hideWatchedInRecentRows => 'Dölj visade';

  @override
  String get hideWatchedInRecentRowsDescription =>
      'Dölj visat innehåll från raderna Nyligen tillagda och Nyligen släppta på startsidan.';

  @override
  String get mergeRecentRowsByType => 'Slå ihop de senaste raderna efter typ';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Slå ihop separata bibliotek av samma typ för raderna Nyligen tillagda och Nyligen släppta på startsidan.';

  @override
  String get libraryView => 'Biblioteksvy';

  @override
  String get libraryStyle => 'Stil för videobiblioteket';

  @override
  String get libraryStyleDescription =>
      '”Classic” är den ursprungliga rubriken med ikonknappar. ”Modern” samlar sökfunktionen samt märkta knappar för sortering, gruppering och filtrering i en enda rad. ”Docked” flyttar kontrollerna och bokstäverna till en sidopanel.';

  @override
  String get libraryStyleDescriptionPhone =>
      '”Classic” är den ursprungliga rubriken med ikonknappar. ”Modern” lägger till etiketterade sorterings-, grupperings- och filterrutor under sökfältet. ”Docked” placerar kontrollerna i en rad längst ned på skärmen.';

  @override
  String get libraryStyleClassic => 'Klassisk';

  @override
  String get libraryStyleModern => 'Modern';

  @override
  String get libraryStyleDocked => 'I docka';

  @override
  String get bookLibraryStyle => 'Bokbibliotekets stil';

  @override
  String get bookLibraryStyleDescription =>
      '”Classic” visar de ursprungliga hyllorna under en utvald titel. ”Reading Room” visar det du läser just nu på stora kort. ”Bookstore” låter dig bläddra igenom hela biblioteket i ett rutnät.';

  @override
  String get bookLibraryStyleClassic => 'Klassisk';

  @override
  String get bookLibraryStyleReadingRoom => 'Läsesalen';

  @override
  String get bookLibraryStyleBookstore => 'Bokhandel';

  @override
  String get musicLibraryStyle => 'Musikbibliotekets stil';

  @override
  String get musicLibraryStyleDescription =>
      '”Classic” visar de ursprungliga raderna under ett ”Jump Back In”-kort. ”Quick Access” inleds med ett rutnät med dina senaste album och spellistor. ”Immersive” inleds med det album du lyssnar på just nu.';

  @override
  String get musicLibraryStyleClassic => 'Klassisk';

  @override
  String get musicLibraryStyleQuickAccess => 'Snabbtillgång';

  @override
  String get musicLibraryStyleImmersive => 'Fängslande';

  @override
  String get jumpBackIn => 'Kom tillbaka';

  @override
  String get yourPlaylists => 'Dina spellistor';

  @override
  String get fromThisAlbum => 'Från detta album';

  @override
  String get searchMusic => 'Sök efter musik';

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
    return '$count pågår';
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
  String get searchBooks => 'Sök efter böcker';

  @override
  String get libraryShowLabel => 'Visa';

  @override
  String get libraryAToZ => 'A till Z';

  @override
  String get libraryJumpToLetter => 'Gå till bokstaven';

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
  String get libraryOrder => 'Biblioteksbeställning';

  @override
  String get libraryOrderSubtitle =>
      'Välj i vilken ordning dina bibliotek ska visas';

  @override
  String get libraryOrderDescription =>
      'Dina bibliotek visas i den här ordningen på ”Mina medier”, i raderna med nyligen tillagda objekt och i navigeringsfältet. Ordningen sparas på ditt serverkonto, så andra appar som du loggar in på använder den också.';

  @override
  String get libraryOrderTvHint =>
      'Tryck åt vänster eller höger för att flytta det markerade biblioteket.';

  @override
  String get libraryOrderSaveFailed =>
      'Det gick inte att spara biblioteksbeställningen';

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
  String get peekHomeRows => 'Peek-startsidor';

  @override
  String get peekHomeRowsDescription =>
      'Visa den övre halvan av den första raden längst ner på mediefältet';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Av';

  @override
  String get mediaBarModeBookshelf => 'Bokhylla';

  @override
  String get mediaBarModeGallery => 'Galleri';

  @override
  String get mediaBarModeBanner => 'Baner';

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
  String get mediaBarSourceType => 'Källa';

  @override
  String get mediaBarSourceRandom => 'Slumpmässigt';

  @override
  String get mediaBarNewReleaseBanner => 'Banner för ny release';

  @override
  String get mediaBarNewReleaseDaysDescription =>
      'Hur länge efter att ett avsnitt har sänts räknas det fortfarande som nytt?';

  @override
  String get mediaBarNewSeries => 'Ny serie';

  @override
  String get mediaBarNewSeason => 'Ny säsong';

  @override
  String get mediaBarNewEpisodes => 'Nya avsnitt';

  @override
  String get mediaBarNewMovie => 'Ny film';

  @override
  String get mediaBarNewReleasesSection => 'Nya utgåvor';

  @override
  String get mediaBarSourceNewReleasesAll => 'Nya utgåvor';

  @override
  String get mediaBarNewReleaseBannerAllDescription =>
      'Markera nya serier, säsonger, avsnitt och filmer.';

  @override
  String get mediaBarNewReleaseKinds => 'Etiketter';

  @override
  String get mediaBarNewEpisodeDays => 'Fönster för nytt avsnitt';

  @override
  String get mediaBarNewMovieDays => 'Nytt filmfönster';

  @override
  String get mediaBarNewMovieDaysDescription =>
      'Hur länge en film förblir ny efter premiären. Biofilmer läggs ofta upp på servrarna en tid efter premiären, så räkna med en längre tid än för tv-avsnitt.';

  @override
  String get mediaBarNewMovieDetail => 'Visa slogan';

  @override
  String get mediaBarNewMovieDetailDescription =>
      'Under ”Ny film” visas filmens slogan. Om det inte finns någon slogan visas endast rubriken.';

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
  String get trailerVolume => 'Trailerns volym';

  @override
  String get trailerVolumeDescription =>
      'Hur högt mediebarstrailers spelas upp';

  @override
  String get trailerCaptions => 'Undertexter till trailern';

  @override
  String get trailerCaptionsDescription =>
      'Visa undertexter i YouTube-trailers';

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
  String get previewVolume => 'Förhandsgranska volym';

  @override
  String get previewVolumeDescription =>
      'Hur högt spelas medieförhandsvisningar på korten';

  @override
  String get latestMedia => 'Senaste media';

  @override
  String get recentlyReleased => 'Nyligen släppt';

  @override
  String get recentlyReleasedSeriesType =>
      'Nyligen släppta serier – sortera efter';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sortera de senaste serierna på startsidan efter serie, senaste säsong eller sändningsdatum för det senaste avsnittet';

  @override
  String get myMedia => 'Min media';

  @override
  String get myMediaSmall => 'Min media (liten)';

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
  String get favoriteChannels => 'Favoritkanaler';

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
  String get continueWatchingDefaultAction => 'Standardåtgärd';

  @override
  String get continueWatchingDefaultActionDescription =>
      'Vad som händer när man väljer ett alternativ under ”Fortsätt titta” eller ”Nästa”';

  @override
  String get goToDetailsScreen => 'Gå till detaljer';

  @override
  String get playImmediately => 'Spela direkt';

  @override
  String get nextUpMaxDays => 'Max antal dagar i ”Next Up”';

  @override
  String get nextUpMaxDaysDescription =>
      'Hur länge ett program finns kvar i Next Up efter att du senast tittade på det';

  @override
  String daysValue(int days) {
    return '$days dagar';
  }

  @override
  String get fullScreenRows => 'Expanderade hemrader';

  @override
  String get fullScreenRowsDescription =>
      'Begränsa hemrader till 1 rad per skärm';

  @override
  String get homeRowsPadding => 'Radavstånd';

  @override
  String get homeRowsPaddingDescription =>
      'Anpassa avståndet mellan hemraderna';

  @override
  String get homeRowsGenresAndStudios => 'Genrer och studior';

  @override
  String get homeRowsExternalLists => 'Externa listor';

  @override
  String get homeRowsStreamingServices => 'Streamingtjänster';

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
  String get pinSynced => 'PIN-kod synkroniserad';

  @override
  String get pinResetFailed =>
      'PIN-koden på servern kunde inte raderas. Om den fortfarande är inställd, be en serveradministratör att ta bort den.';

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
  String get screensaverDuringAudio => 'Visa under musik och ljudböcker';

  @override
  String get screensaverDuringAudioDescription =>
      'Låt skärmsläckaren starta medan ljudet spelas upp, så att skivomslaget inte ligger kvar på skärmen i timmar.';

  @override
  String get sleepAfterIdle => 'Låt TV:n stängas av efter';

  @override
  String get sleepAfterIdleDescriptionAndroid =>
      'Stäng Moonfin efter en så lång tid utan att du tryckt på någon knapp, så att TV:ns egen skärmsläckare och vilolägesinställning kan ta över. Allt som är pausat avbryts först, så att återupptagningspunkten bevaras.';

  @override
  String get sleepAfterIdleDescriptionAppleTv =>
      'Efter en längre tid utan att du tryckt på någon knapp återgår skärmen till Apple TV:s egen skärmsläckare och viloläge. Moonfin förblir öppet, så du kan fortsätta precis där du slutade.';

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
  String get screensaverGeneralSettings => 'Allmänna inställningar';

  @override
  String get screensaverVisualComponents => 'Visuella komponenter';

  @override
  String get screensaverLibraryContent => 'Bibliotekets innehåll';

  @override
  String get screensaverBackdrop => 'Bakgrund';

  @override
  String get screensaverBackdropBlack => 'Svart';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => 'Calm';

  @override
  String get screensaverBackdropNeonPulse => 'Neon Pulse';

  @override
  String get screensaverBackdropAurora => 'Aurora';

  @override
  String get screensaverAdditionalComponent => 'Tilläggskomponent';

  @override
  String get screensaverComponentMoonfinLogo => 'Moonfin logotypen';

  @override
  String get screensaverComponentRunner => 'Löpare';

  @override
  String get screensaverComponentMovement => 'Komponentens rörelse';

  @override
  String get screensaverComponentPosition => 'Komponentens placering';

  @override
  String get screensaverComponentSize => 'Komponentstorlek';

  @override
  String get screensaverSourceLibrariesDefault => 'Alla (standard)';

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
  String get mdblistWatchingNow => 'Tittar på MDBList';

  @override
  String watchingNowWatchersCount(int count) {
    return '$count tittar på';
  }

  @override
  String watchingNowLiveSummary(String users, String movies, String shows) {
    return '$users tittar just nu · $movies filmer · $shows shows';
  }

  @override
  String watchingNowLiveSummaryToday(
    String users,
    String movies,
    String shows,
  ) {
    return '$users såg idag · $movies filmer · $shows shows';
  }

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
  String get moonbaseAddress => 'Adress till Moonbase';

  @override
  String get pluginConnected => 'Ansluten';

  @override
  String pluginConnectedVersion(String version) {
    return 'Ansluten, version $version';
  }

  @override
  String get pluginSyncOn => 'Synkronisera på';

  @override
  String get pluginSyncOff => 'Synkronisering avstängd';

  @override
  String get syncProfileDescription =>
      'Den här enheten synkroniseras med den profil du väljer tills du väljer en annan.';

  @override
  String get profileAppliesEverywhere => 'Gäller överallt';

  @override
  String get profileOverridesGlobal => 'Åsidosätter globala inställningar';

  @override
  String get profileThisDevice => 'Denna enhet';

  @override
  String get profileLoad => 'Ladda';

  @override
  String get profileLoadSubtitle => 'Server till den här enheten';

  @override
  String get profileSaveSubtitle => 'Denna enhet till servern';

  @override
  String resetNamedProfile(String profile) {
    return 'Återställ $profile Profil';
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
  String get tags => 'Taggar';

  @override
  String get genresAndTags => 'Genrer och taggar';

  @override
  String get seerrDiscoveryRows => 'Seerr-upptäcktsrader';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover reglage';

  @override
  String get yourWatchlist => 'Din bevakningslista';

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
  String get showMissingCollectionItems => 'Visa saknade objekt i samlingen';

  @override
  String get showMissingCollectionItemsDesc =>
      'Lägg till saknade artiklar på samlingssidorna';

  @override
  String get showSeerrAvailabilityBadges => 'Visa Seerrs tillgänglighetsmärken';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Visa Seerr-statusen på affischer och säsonger i hela appen';

  @override
  String get seerrBadgeStyle => 'Emblemstil';

  @override
  String get seerrBadgeStyleDescription =>
      'Badgen placerar Seerrs prick i ett hörn. Bannern visar statusen längs affischens överkant.';

  @override
  String get seerrBadgeStyleBadge => 'Märke';

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
  String get seerrNotifyNewMediaTitle => 'Nya medier har lagts till';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Har något nytt lagts till i serverbiblioteket?';

  @override
  String get seerrTestNotification => 'Skicka testmeddelande';

  @override
  String get seerrTestNotificationDesc =>
      'Kontrollera leveransen av push-meddelanden i appen och i bakgrunden';

  @override
  String seerrTestNotificationSentBody(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString devices',
      one: '1 device',
    );
    return 'Skickat till $_temp0.';
  }

  @override
  String get seerrTestNotificationPushDisabled =>
      'En avisering har skickats via appen. Serverpush är inte aktiverat.';

  @override
  String get seerrTestNotificationFailed =>
      'Det gick inte att skicka testmeddelandet';

  @override
  String get seerrPushServerStatus => 'Server Push';

  @override
  String get seerrPushDeviceStatus => 'Push-meddelande från enheten';

  @override
  String get seerrPushDeviceRegistered => 'Registrerad';

  @override
  String get seerrPushDeviceNotRegistered => 'Inte registrerad';

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
  String get seerrDownloading => 'Laddar ner';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Hämtar · $done / $total';
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
  String get seerrWaitingForImport => 'Hämtad, väntar på import';

  @override
  String get seerrDownloadStalled => 'Fastnat';

  @override
  String get seerrDownloadFailed => 'Nedladdningen misslyckades';

  @override
  String get seerrImportBlocked => 'Importen har blockerats';

  @override
  String get seerrNotFoundYet => 'Har inte hittats ännu';

  @override
  String get seerrSearchingIndexers => 'Sökindexerare';

  @override
  String seerrNotFoundYetSearched(String when) {
    return 'Har inte hittats än · har sökts efter $when';
  }

  @override
  String get seerrNotAvailableYet => 'Finns inte ännu';

  @override
  String seerrAvailableOn(String date) {
    return 'Finns tillgängligt $date';
  }

  @override
  String seerrNextEpisodeOn(String date) {
    return 'Nästa avsnitt $date';
  }

  @override
  String get seerrGetDifferentRelease => 'Hämta en annan version';

  @override
  String seerrGetDifferentReleaseConfirm(String service, String release) {
    return '$service kommer att ta bort $release från nedladdningsklienten, blockera den så att den inte hämtas igen och söka efter en annan version.';
  }

  @override
  String seerrGetDifferentReleaseDone(String service) {
    return 'Borttagen. $service letar efter ytterligare en utgåva.';
  }

  @override
  String get seerrGetDifferentReleaseFailed =>
      'Det gick inte att ta bort nedladdningen';

  @override
  String itemsCount(int count) {
    return '$count objekt';
  }

  @override
  String get seerrSettings => 'Seerr-inställningar';

  @override
  String get requestMore => 'Begär mer';

  @override
  String get requestMore4k => 'Begär mer i 4K';

  @override
  String get request => 'Begäran';

  @override
  String get request4k => 'Begär 4K';

  @override
  String get requested4k => '4K begärt';

  @override
  String get cancelRequest => 'Avbryt begäran';

  @override
  String get cancelRequest4k => 'Avbryt 4K-begäran';

  @override
  String get playInMoonfin => 'Spela i Moonfin';

  @override
  String get requestedByLabel => 'På begäran av';

  @override
  String requestedByName(String name) {
    return 'Efterfrågad av $name';
  }

  @override
  String get manageRequests => 'Hantera förfrågningar';

  @override
  String get watchlist => 'Bevakningslista';

  @override
  String get onWatchlist => 'På bevakningslistan';

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
  String get removeRequest => 'Remove Request';

  @override
  String removeFailedRequestForTitle(String title) {
    return 'Your failed request for \"$title\" will be deleted. You can request it again later.';
  }

  @override
  String get removeFailedRequestRefused =>
      'The request wasn\'t removed. It was retried, or part of it arrived.';

  @override
  String removeOthersFailedRequestForTitle(String title, String name) {
    return 'The failed request for \"$title\" by $name will be deleted. They can request it again later.';
  }

  @override
  String get removeFailedRequestError =>
      'Couldn\'t remove the request. Try again.';

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
    return 'Begär 4K $type';
  }

  @override
  String get submitRequest => 'Skicka in förfrågan';

  @override
  String get allSeasons => 'Alla årstider';

  @override
  String get seerrSeriesContinuing =>
      'Serien fortsätter · Framtida säsonger kan beställas';

  @override
  String get seerrSeriesMatchDescription =>
      'Vi kunde inte matcha den här serien automatiskt. Välj rätt alternativ nedan.';

  @override
  String get seerrSeriesNoMatch =>
      'Vi kunde inte hitta någon matchning för den här serien, så den går inte att beställa.';

  @override
  String get seerrSeriesMatchFailed =>
      'Sonarr kunde inte hitta någon träff för den här serien, eller gick inte att nå. Försök igen, eller kolla serien på Seerr.';

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
  String get crewSection => 'Filmteam';

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
      'För att kunna se direktsänd TV krävs Emby Premiere. Utan det importerar servern varken kanaler eller spelar in något.';

  @override
  String get adminPremiereNoteBackups =>
      'Funktionen ”Säkerhetskopiering och återställning” kräver Emby Premiere när provperioden löper ut.';

  @override
  String get adminGeneralRunAtStartup => 'Starta servern vid uppstart';

  @override
  String get adminGeneralLaunchWebApp =>
      'Öppna webbappen i en webbläsare när servern startar';

  @override
  String get adminGeneralBannerText => 'Text i bannern på startsidan';

  @override
  String get adminGeneralBannerTextHelp =>
      'Visas för alla användare på deras startskärm';

  @override
  String get adminGeneralSectionMaintenance => 'Underhållsläge';

  @override
  String get adminGeneralMaintenanceMode => 'Sätt servern i underhållsläge';

  @override
  String get adminGeneralMaintenanceModeHelp =>
      'Användarna ser endast underhållsmeddelandet.';

  @override
  String get adminGeneralMaintenanceMessage => 'Underhållsmeddelande';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      'Lämna fältet tomt om du vill visa ett allmänt meddelande på varje användares språk.';

  @override
  String get adminGeneralSectionUpdates => 'Automatiska uppdateringar';

  @override
  String get adminGeneralAutoUpdate => 'Uppdatera servern automatiskt';

  @override
  String get adminGeneralAutoRestart =>
      'Starta om automatiskt för att installera uppdateringarna';

  @override
  String get adminGeneralAutoRestartHelp =>
      'Servern startas om endast när inga användare är aktiva.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return 'Efter en systemhändelse ($event)';
  }

  @override
  String get adminPluginNeedsPremiere =>
      'Kräver Emby Premiere efter en 14-dagars gratis provperiod';

  @override
  String get adminEmbyBackupsHelp =>
      'Emby säkerhetskopierar via tillägget ”Backup & Restore”.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      'Tillägget ”Backup & Restore” är inte installerat. Installera det från tilläggskatalogen för att säkerhetskopiera den här servern.';

  @override
  String get adminEmbyBackupNow => 'Säkerhetskopiera nu';

  @override
  String get adminEmbyFullBackup => 'Fullständig säkerhetskopiering';

  @override
  String get adminEmbyLightBackups => 'Databasbackuper';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return 'Återställ $name? Den ersätter serverns bibliotek, inställningar, användare och lösenord, och servern stängs av när processen är klar. Du kan behöva starta om den själv.';
  }

  @override
  String get adminEmbyRestoreServerId => 'Återställ servern ID';

  @override
  String get adminEmbyRestoreServerIdHelp =>
      'Stäng av den här funktionen när du återställer samma säkerhetskopia på fler än en server.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      'Återställningen är klar och servern stängs av. Starta den igen om den inte startar om av sig själv.';

  @override
  String get adminHiddenRemotely =>
      'Dölj inloggningsskärmarna vid fjärranslutning';

  @override
  String get adminHiddenFromUnusedDevices =>
      'Dölj inloggningsskärmarna på enheter där de aldrig har loggat in';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      'Begränsar hur många videoklipp den här användaren kan spela upp samtidigt.';

  @override
  String get adminUnlimited => 'Obegränsat';

  @override
  String get adminAutoRemoteQuality =>
      'Automatisk fjärrstyrningskvalitet (Mbps)';

  @override
  String get adminAutoRemoteQualityHelp =>
      'Used remotely when the player is set to auto quality. Leave empty to detect it.';

  @override
  String get adminAllowCameraUpload => 'Tillåt uppladdning via kamera';

  @override
  String get adminAllowSubtitleDownloading =>
      'Tillåt nedladdning av undertexter';

  @override
  String get adminAllowMediaConversion => 'Tillåt mediekonvertering';

  @override
  String get adminAllowSyncTranscoding =>
      'Tillåt nedladdningar som kräver omkodning';

  @override
  String get adminAllowSharingPersonalItems =>
      'Tillåt delning av spellistor med andra användare';

  @override
  String get adminAllowPreferenceAccess =>
      'Tillåt användarna att ändra sitt eget lösenord och sin profilbild';

  @override
  String get adminTagMode => 'Dagsläge';

  @override
  String get adminEmbyConnect => 'Emby Anslut';

  @override
  String get adminEmbyConnectUser =>
      'Användarnamn eller e-postadress för Emby Connect';

  @override
  String get adminEmbyConnectHelp =>
      'Gör det möjligt för den här användaren att logga in från vilken Emby-app som helst utan att känna till serveradressen.';

  @override
  String get adminEmbyConnectLink => 'Länk';

  @override
  String get adminEmbyConnectUnlink => 'Ta bort länken';

  @override
  String get adminEmbyConnectLinked => 'Kopplat till Emby Connect';

  @override
  String get adminEmbyConnectPending =>
      'Inbjudan har skickats. Länken aktiveras så snart de accepterar den.';

  @override
  String get adminEmbyConnectUnlinked =>
      'Länken till Emby Connect har tagits bort';

  @override
  String get adminEmbyConnectNotFound =>
      'Det finns inget Emby Connect-konto med det användarnamnet eller den e-postadressen.';

  @override
  String get adminLibImportPlaylists => 'Importera spellistfiler';

  @override
  String get adminLibExcludeFromSearch => 'Uteslut från den globala sökningen';

  @override
  String get adminLibForcedSubtitlesOnly =>
      'Ladda endast ner tvingade undertexter';

  @override
  String get adminLibImportCollections =>
      'Importera samlingar från metadata-nedladdare';

  @override
  String get adminLibThumbnailInterval =>
      'Intervall för förhandsgranskningsminiatyrer';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return 'Varje $count sekunder';
  }

  @override
  String get adminLibThumbnailAtChapters => 'Vid kapitelmarkeringarna';

  @override
  String get adminLibSaveThumbnailsWithMedia =>
      'Spara förhandsgranskningsminiatyrer i mediemappar';

  @override
  String get adminLibrarySectionMarkers => 'Inledningsmarkörer';

  @override
  String get adminLibIntroDetection => 'Upptäck intro';

  @override
  String get adminLibIntroDetectionDuringScan =>
      'Upptäck introer under genomsökningen av biblioteket';

  @override
  String get adminProviderEmbyGuide => 'Emby Guide Data';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      'Välj ett programutbud. Om inga visas, kontrollera postnumret. Programutbud kräver Emby Premiere.';

  @override
  String get adminLiveTvWakeServer => 'Väck servern för inspelningar';

  @override
  String get adminDrawerLiveTvChannels => 'Live-TV-kanaler';

  @override
  String get adminPageDescLiveTvChannels =>
      'Slå på och stänga av kanaler samt ställa in deras ordning';

  @override
  String get adminLiveTvChannelsEmpty =>
      'Det finns inga kanaler ännu. De visas här så snart en tuner har konfigurerats och servern har importerat sina kanaler.';

  @override
  String get adminTranscodingHwaAdvanced => 'Avancerat';

  @override
  String get adminTranscodingHwaHelp =>
      'Med alternativet ”Avancerat” kan du välja och ordna hårdvarukodekerna.';

  @override
  String get adminTranscodingHwDecoders => 'Rekommenderade hårdvarudekodare';

  @override
  String get adminTranscodingHwEncoders =>
      'Rekommenderade hårdvarubaserade kodare';

  @override
  String get adminTranscodingTempPathHelp =>
      'Var transkodaren sparar sina arbetsfiler. Lämna fältet tomt för att använda serverns datamapp.';

  @override
  String get adminTranscodingThrottleHelp =>
      'Saktar ner omkodningen när tillräckligt mycket har buffrats, för att minska CPU-användningen.';

  @override
  String get adminTranscodingDownmixHelp =>
      'Höjer volymen när ljudet nedmixas. 1 behåller den ursprungliga volymen.';

  @override
  String get adminTranscodingFontExtraction =>
      'Tillåt utdragning av teckensnitt i realtid';

  @override
  String get adminTranscodingMaxResolution =>
      'Högsta upplösning vid transkodning';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      'En gräns för varje omkodning, oavsett vilken kvalitet appen begär.';

  @override
  String get adminTranscodingToneMapSoftware =>
      'Tonmappning vid programvarubaserad omkodning';

  @override
  String get adminTranscodingToneMapHardware =>
      'Tonmappning vid hårdvarubaserad omkodning';

  @override
  String get adminTranscodingToneMapHelp =>
      'Förhindrar att HDR-video ser mörk och blek ut när den omkodas.';

  @override
  String get adminNetworkingLocalAddress => 'Lokal IP-adress';

  @override
  String get adminNetworkingLocalAddressHelp =>
      'Den lokala adressen som servern tilldelar apparna. Lämna fältet tomt för att den ska upptäckas automatiskt.';

  @override
  String get adminNetworkingBehindProxy => 'HTTPS hanteras av en omvänd proxy';

  @override
  String get adminNetworkingExternalDomain => 'Extern domän';

  @override
  String get adminNetworkingExternalDomainHelp =>
      'En domän eller ett dynamiskt DNS-namn för fjärranslutningar, utan angivande av protokoll eller port. Ett anpassat certifikat kräver detta.';

  @override
  String get adminNetworkingUpnp => 'Aktivera automatisk portmappning';

  @override
  String get adminNetworkingUpnpHelp =>
      'Försöker koppla den offentliga porten till den lokala porten med hjälp av UPnP. Vissa routrar stöder inte detta.';

  @override
  String get adminNetworkingProxyHeaders =>
      'Läs proxy-rubrikerna för klientadresserna';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'Använder rubriker som X-Forwarded-For för att hitta varje klients adress. Aktivera endast denna funktion bakom en omvänd proxy.';

  @override
  String get adminNetworkingProxyHeadersRemote =>
      'Endast när de har fjärradresser';

  @override
  String get adminNetworkingIpv4Only =>
      'Använd IPv4 för utgående förfrågningar';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      'När metadataleverantörer och andra tjänster inte kan nås via IPv6.';

  @override
  String get adminOnePerLine => 'En per rad';

  @override
  String get adminStreamingStreamLimit =>
      'Maximalt antal samtidiga videoströmmar';

  @override
  String get adminStreamingStreamLimitHelp =>
      'Hur många videoklipp som kan spelas upp samtidigt på servern. 0 betyder att det inte finns någon begränsning.';

  @override
  String get adminSyncJobsConversions => 'Konverteringsuppdrag';

  @override
  String get adminSyncJobsDownloads => 'Ladda ner jobb';

  @override
  String get adminSyncJobsEmpty => 'Inga lediga tjänster';

  @override
  String get adminSyncJobCancel => 'Avbryt uppdraget';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return 'Avbryt $name och ta bort den från listan?';
  }

  @override
  String get adminSyncJobConverting => 'Konvertering';

  @override
  String get adminSyncJobReady => 'Redo för överföring';

  @override
  String get adminSyncJobTransferring => 'Överföring';

  @override
  String get adminSyncJobCompletedWithError => 'Slutfört med fel';

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
  String get adminDrawerDatabase => 'Databas';

  @override
  String get adminPageDescDatabase => 'Cache-storlek och underhåll';

  @override
  String get adminDatabaseWarning =>
      'Detta är avancerade inställningar. Låt dem vara på standardinställningarna om du inte har någon anledning att ändra dem.';

  @override
  String get adminDatabaseCacheSize => 'Databasens cacheminne (MB)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      'Hur stor del av varje databasfil som servern lagrar i minnet. En högre värde kan göra servern snabbare. Träder i kraft efter en omstart.';

  @override
  String get adminDatabaseOptimize =>
      'Optimera databasen när servern stängs av';

  @override
  String get adminDatabaseOptimizeHelp =>
      'Vanligtvis händer ingenting, men då och då körs en analys som underlättar serverns sökningar. Avstängningen kan ta längre tid.';

  @override
  String get adminDatabaseAnalysisLimit => 'Analys av radbegränsning';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      'Ungefär hur många rader av varje index som optimeringssteget läser in. Fler rader ger bättre resultat men kan göra avstängningarna långsammare.';

  @override
  String get adminDatabaseVacuum => 'Rensa databasen vid nästa uppstart';

  @override
  String get adminDatabaseVacuumHelp =>
      'Återuppbygger databasfilen så att den tar upp så lite utrymme som möjligt, vilket kan förbättra prestandan. Servern kan inte användas medan processen pågår och ingen förloppsindikator visas, så stäng inte ner den med våld. Den stängs av automatiskt efter den här uppstarten.';

  @override
  String get adminDrawerCinemaIntros => 'Filmintroduktioner';

  @override
  String get adminPageDescCinemaIntros =>
      'Trailers och introklipp före uppspelning';

  @override
  String get adminCinemaIntrosPlayBefore => 'Spela upp intron innan';

  @override
  String get adminCinemaIntrosUpcoming =>
      'Ta med trailrar från nya och kommande filmer';

  @override
  String get adminCinemaIntrosOlder => 'Ta med trailrar från äldre filmer';

  @override
  String get adminCinemaIntrosLibrary =>
      'Lägg till filmtrailers i mina bibliotek';

  @override
  String get adminCinemaIntrosLibraryHelp => 'Det behövs lokala släpvagnar.';

  @override
  String get adminCinemaIntrosCount => 'Antal trailrar som ska spelas upp';

  @override
  String get adminCinemaIntrosParental => 'Smart föräldrakontroll';

  @override
  String get adminCinemaIntrosParentalHelp =>
      'Väljer endast trailrar som har fått samma eller lägre betyg än den film som just nu visas.';

  @override
  String get adminCinemaIntrosUnwatchedOnly =>
      'Spela endast upp inledningssekvenser före innehåll som inte har visats tidigare';

  @override
  String get adminCinemaIntrosSimilarOnly =>
      'Visa endast trailrar som liknar det som just nu visas';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      'Baserat på gemensamma genrer, taggar, studior och så vidare.';

  @override
  String get adminCinemaIntrosCustom => 'Anpassade intron';

  @override
  String get adminCinemaIntrosCustomPath => 'Mapp för anpassade intron';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      'En mapp med videoklipp. Ett av dem väljs slumpmässigt och spelas upp efter trailrarna.';

  @override
  String get adminCinemaIntrosCodecPath => 'Mappen ”Codec intros”';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      'En mapp med videoklipp. Ett videoklipp vars filnamn stämmer överens med videokodeken, ljudkodeken, ljudprofilen eller en tagg spelas upp före huvudfilmen.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => 'Play To och DLNA-servern';

  @override
  String get adminDlnaPlayTo => 'Aktivera DLNA Play To';

  @override
  String get adminDlnaPlayToHelp =>
      'Emby kan upptäcka enheter i ditt nätverk och styra dem på distans.';

  @override
  String get adminDlnaServer => 'Aktivera DLNA-servern';

  @override
  String get adminDlnaServerHelp =>
      'Gör det möjligt för servern att strömma media till DLNA-enheter.';

  @override
  String get adminDlnaDefaultUser => 'Standard användare';

  @override
  String get adminDlnaDefaultUserHelp =>
      'Vilka bibliotek de anslutna enheterna ser. En enhetsprofil kan åsidosätta detta.';

  @override
  String get adminDlnaDebugLog => 'Aktivera DLNA-felsökningsloggning';

  @override
  String get adminDlnaDebugLogHelp =>
      'Skapar stora loggfiler. Aktivera endast funktionen vid felsökning.';

  @override
  String get adminDrawerCameraUpload => 'Kameraöverföring';

  @override
  String get adminPageDescCameraUpload =>
      'Var bilder från mobiltelefoner sparas';

  @override
  String get adminCameraUploadPath => 'Mapp för bilduppladdning';

  @override
  String get adminCameraUploadPathHelp =>
      'Lämna fältet tomt för att använda standardmappen. En anpassad mapp måste också läggas till som ett bibliotek.';

  @override
  String get adminCameraUploadSubfolders =>
      'Skapa en undermapp för varje enhet';

  @override
  String get adminDrawerConversions => 'Konverteringar';

  @override
  String get adminPageDescConversions =>
      'Konverterade mediefiler och nedladdningar';

  @override
  String get adminConversionsTempPath => 'Mapp för tillfälliga filer';

  @override
  String get adminConversionsTempPathHelp =>
      'Var lagras mediefilerna under konverteringen?';

  @override
  String get adminConversionsFullSpeed => 'Konvertera i full fart';

  @override
  String get adminConversionsFullSpeedHelp =>
      'Konverteringar körs som standard i långsam takt för att minska belastningen.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => 'Licensstatus och nyckel';

  @override
  String get adminPremiereActive => 'Premiere är aktivt på den här servern.';

  @override
  String get adminPremiereInactive =>
      'Den här servern har ingen Premiere-nyckel.';

  @override
  String get adminPremiereKeyInvalid =>
      'En nyckel har angetts men är inte aktiv. Den kan vara felaktigt angiven eller ha gått ut.';

  @override
  String get adminPremiereCurrentKey => 'Aktuell nyckel';

  @override
  String get adminPremiereNewKey => 'Ny nyckel';

  @override
  String get adminPremiereNewKeyHint =>
      'Klistra in nyckeln från ditt e-postmeddelande från Emby Premiere.';

  @override
  String get adminPremiereSaveKey => 'Spara-tangenten';

  @override
  String get adminPremiereRemoveKey => 'Ta bort nyckel';

  @override
  String get adminPremiereKeyRejected =>
      'Emby sparade nyckeln men godkände den inte.';

  @override
  String get adminPremiereLoadFailed =>
      'Det gick inte att ladda statusen för Premiere';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere krävs';

  @override
  String get embyPremiereRequiredBody =>
      'Detta kräver ett aktivt Emby Premiere-abonnemang på servern.';

  @override
  String get embyPremiereRequiredSaveBody =>
      'Detta kräver ett aktivt Emby Premiere-abonnemang. Emby sparar inställningen men använder den inte förrän Premiere är aktivt.';

  @override
  String get embyPremiereLearnMore => 'Läs mer';

  @override
  String get embyPremiereSaveAnyway => 'Spara ändå';

  @override
  String get embyPremiereEnterKey => 'Enter-tangenten';

  @override
  String get adminPremiereNote =>
      'Kräver Emby Premiere. Servern sparar denna inställning men använder den inte förrän Premiere är aktivt.';

  @override
  String adminExternalIdLabel(String name) {
    return '$name Id';
  }

  @override
  String get adminExternalIdTypePerson => 'Person';

  @override
  String get adminExternalIdTypeArtist => 'Konstnär';

  @override
  String get adminExternalIdTypeAlbumArtist => 'Album Artist';

  @override
  String get adminExternalIdTypeOtherArtist => 'Andra artister';

  @override
  String get adminExternalIdTypeReleaseGroup => 'Utgivningsgrupp';

  @override
  String get adminExternalIdTypeBook => 'Bok';

  @override
  String get adminPlaybackHwAccelWarning =>
      'Hårdvaruacceleration kan vara instabil på vissa system. Se till att operativsystemet och grafikkortsdrivrutinerna är uppdaterade, och ställ in detta till ”Ingen” om videon slutar spelas upp.';

  @override
  String get adminLibMetadataChangeHelp =>
      'Ändringar av metadatainställningarna gäller för nytt innehåll. För att uppdatera befintligt innehåll kan du uppdatera det från dess detaljsida eller uppdatera biblioteket.';

  @override
  String get adminLibFetcherSettings => 'Inställningar för Fetcher';

  @override
  String adminLibImageOptionsTitle(String type) {
    return 'Bildinställningar för $type';
  }

  @override
  String get adminLibFetchImages => 'Hämta bilder';

  @override
  String get adminLibMaxBackdrops => 'Högsta antal bakgrunder per artikel';

  @override
  String get adminLibMinBackdropWidth =>
      'Minsta bredd för nedladdad bakgrundsbild';

  @override
  String get adminImageTypeArt => 'Clearart';

  @override
  String get adminImageTypeBox => 'Låda';

  @override
  String get adminImageTypeBoxRear => 'Låda (baksida)';

  @override
  String get adminImageTypeDisc => 'Skiva';

  @override
  String get adminImageTypeMenu => 'Meny';

  @override
  String get adminActivityMediaDetails => 'Medieuppgifter';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      't.ex. 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => 'Originalspråk';

  @override
  String get adminMetadataFieldDateAdded => 'Datum för tillägg';

  @override
  String get adminMetadataFieldArtists => 'Artister';

  @override
  String get adminMetadataFieldAlbumArtists => 'Artister på albumet';

  @override
  String get adminMetadataFieldAlbum => 'Album';

  @override
  String get adminMetadataFieldSeriesName => 'Seriens namn';

  @override
  String get adminMetadataFieldEpisodeNumber => 'Avsnittsnummer';

  @override
  String get adminMetadataFieldSeasonNumber => 'Säsongsnummer';

  @override
  String get adminMetadataFieldTrackNumber => 'Spårnummer';

  @override
  String get adminMetadataFieldDiscNumber => 'Skivnummer';

  @override
  String get adminMetadataFieldAirTime => 'Sändningstid';

  @override
  String get adminMetadataFieldRuntime => 'Körtid i minuter';

  @override
  String get adminMetadataFieldPlaceOfBirth => 'Födelseort';

  @override
  String get adminMetadataFieldBirthDate => 'Födelsedatum';

  @override
  String get adminMetadataFieldBirthYear => 'Födelseår';

  @override
  String get adminMetadataFieldDeathDate => 'Dödsdatum';

  @override
  String get adminMetadataFieldAspectRatio => 'Ursprungligt bildförhållande';

  @override
  String get adminMetadataFieldAirsBeforeSeason => 'Sänds före säsongen';

  @override
  String get adminMetadataFieldAirsAfterSeason => 'Sänds efter säsongen';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => 'Sänds före avsnittet';

  @override
  String get adminMetadataNamesHelp => 'Avskilj flera namn med semikolon.';

  @override
  String get adminMetadataSectionRatings => 'Betyg';

  @override
  String get adminMetadataItemLocked =>
      'Metadata för denna post är låsta. Lås upp dem innan du identifierar posten.';

  @override
  String get adminMetadataNameOrIdRequired =>
      'Ange ett namn eller ett externt ID.';

  @override
  String get adminLibMetadataReaders => 'Metadatalesare';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return 'Leverantörer av liknande produkter: $type';
  }

  @override
  String get adminLibMediaSegmentProviders =>
      'Leverantörer inom mediesegmentet';

  @override
  String get adminLibEnableLibrary => 'Aktivera biblioteket';

  @override
  String get adminLibEnableLibraryHelp =>
      'Om du inaktiverar biblioteket döljs det från alla användarvyer.';

  @override
  String get adminLibSaveLyricsWithMedia => 'Spara låttexter i mediemappar';

  @override
  String get adminLibUseCustomTagDelimiters => 'Använd anpassad taggavgränsare';

  @override
  String get adminLibCustomTagDelimiters => 'Anpassad taggavgränsare';

  @override
  String get adminLibCustomTagDelimitersHelp =>
      'Tecken som ska betraktas som avgränsare mellan taggar.';

  @override
  String get adminLibDelimiterWhitelist => 'Vitlista för avgränsningstecken';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      'Objekt som ska uteslutas vid taggdelning, ett per rad.';

  @override
  String get adminLibDownloadLanguages => 'Ladda ner språk';

  @override
  String get adminLibraryFolderRequired =>
      'Lägg till minst en mapp i det här biblioteket.';

  @override
  String get adminRenameLibraryWarning =>
      'Om du byter namn på ett bibliotek går all dess metadata förlorad. Var försiktig.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return 'Ta bort biblioteket \"$name\"? Filerna på disken raderas inte.';
  }

  @override
  String get adminDeleteLibraryLocations =>
      'Följande mediefiler kommer att tas bort från biblioteket:';

  @override
  String get adminRefreshMode => 'Uppdateringsläge';

  @override
  String get adminRefreshModeScan => 'Sök efter nya och uppdaterade filer';

  @override
  String get adminRefreshModeMissing => 'Sök efter saknade metadata';

  @override
  String get adminReplaceTrickplayImages =>
      'Ersätt befintliga bilder i trickplay-sekvenserna';

  @override
  String get adminRefreshDialogHelp =>
      'Metadata uppdateras utifrån de inställningar och internettjänster som är aktiverade i kontrollpanelen.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown of $total';
  }

  @override
  String get adminLiveTvTabSources => 'Stämapparater och guide';

  @override
  String get adminLiveTvTabRecordings => 'Inspelningar';

  @override
  String get adminLiveTvAddTuner => 'Lägg till en tuner';

  @override
  String get adminLiveTvEditTuner => 'Redigera tunerenheten';

  @override
  String get adminLiveTvTunerType => 'Typ av tuner';

  @override
  String get adminLiveTvDetectDevices => 'Hitta mina enheter';

  @override
  String get adminLiveTvNoNewDevices => 'Inga nya enheter hittades';

  @override
  String get adminLiveTvDrmNote => 'Kanaler med DRM importeras inte.';

  @override
  String get adminLiveTvTunerSaved => 'Tuner sparad';

  @override
  String get adminLiveTvDeleteTuner => 'ete tuner enhet';

  @override
  String get adminLiveTvDeleteTunerConfirm =>
      'Är du säker på att du vill ta bort den här tunern?';

  @override
  String get adminLiveTvDeleteProvider => 'Ta bort guide-leverantör';

  @override
  String get adminLiveTvDeleteProviderConfirm =>
      'Är du säker på att du vill ta bort den här guide-leverantören?';

  @override
  String get adminLiveTvProviderSaved => 'Leverantör av reseguider sparad';

  @override
  String get adminLiveTvAddProvider => 'Lägg till leverantör';

  @override
  String get adminLiveTvRefreshGuide => 'Uppdatera guidens data';

  @override
  String get adminLiveTvMapChannels => 'Kartkanaler';

  @override
  String get adminLiveTvNoTunerChannels => 'Inga TV-kanaler hittades';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'En sökväg eller URL till en XMLTV-fil. Servern läser filen och kontrollerar om det finns uppdateringar. Det är du som ansvarar för att skapa och uppdatera filen.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return 'Skapa ett konto på $url';
  }

  @override
  String get adminLiveTvSdSignIn => 'Logga in';

  @override
  String get adminLiveTvSdLineup => 'Spelarlista';

  @override
  String get adminLiveTvSdSelectLineup =>
      'Välj ett programutbud. Om inga alternativ visas, kontrollera ditt användarnamn, lösenord och postnummer.';

  @override
  String get adminLiveTvGuideDays =>
      'Antal dagar med guidedata som ska laddas ner';

  @override
  String get adminLiveTvGuideDaysHelp =>
      'Ju fler dagar du väljer, desto längre fram i tiden kan du planera och se fler program, men nedladdningen tar längre tid. Funktionen ”Automatisk” väljer ett värde utifrån antalet kanaler.';

  @override
  String get adminLiveTvRecordingPath => 'ding-banan';

  @override
  String get adminLiveTvRecordingPathHelp =>
      'Där inspelningarna sparas. Om fältet är tomt används serverns programdatamapp.';

  @override
  String get adminLiveTvStartWhenPossible => 'Börja så snart det går';

  @override
  String get adminLiveTvStopWhenPossible => 'Stanna när det är möjligt';

  @override
  String get adminLiveTvMinutesBefore => 'minuter före';

  @override
  String get adminLiveTvMinutesAfter => 'några minuter efter';

  @override
  String get adminLiveTvSectionGuide => 'Guidedata';

  @override
  String get adminLiveTvSectionDefaultRecording =>
      'Standardinställningar för inspelning';

  @override
  String get adminLiveTvSectionMetadata => 'Registrering av metadata';

  @override
  String adminUserLastActivity(String time) {
    return 'Senaste aktivitet $time';
  }

  @override
  String get adminCurrentPassword => 'Nuvarande lösenord';

  @override
  String get adminChannelAccess => 'Tillgång till kanalen';

  @override
  String get adminDeviceAccess => 'Enhetsåtkomst';

  @override
  String get adminDeleteFromAllLibraries => 'Alla bibliotek';

  @override
  String get adminUserDisabledBanner =>
      'Den här användaren är inaktiverad. Avmarkera alternativet ”Inaktiverad” under ”Behörigheter” för att låta användaren logga in igen.';

  @override
  String get adminNewPasswordEmpty => 'Det nya lösenordet får inte vara tomt';

  @override
  String get adminScheduleStartBeforeEnd =>
      'Starttiden måste ligga före sluttiden';

  @override
  String get adminDashboardAlerts => 'Varningar';

  @override
  String get adminSessionGoHome => 'Gå till startskärmen';

  @override
  String get adminPlayMethodRemux => 'Remuxning';

  @override
  String get adminPlayMethodDirectStream => 'Direktsändning';

  @override
  String get adminPlayMethodDirectPlay => 'Direktuppspelning';

  @override
  String get adminLogLevelTrace => 'Spår';

  @override
  String get adminLogLevelDebug => 'Felsökning';

  @override
  String get adminLogLevelInformation => 'Information';

  @override
  String get adminLogLevelWarning => 'Varning';

  @override
  String get adminLogLevelError => 'Fel';

  @override
  String get adminLogLevelCritical => 'Kritisk';

  @override
  String get adminLogLevelNone => 'Ingen';

  @override
  String get adminActivityAllUsers => 'Alla användare';

  @override
  String adminTaskLastRan(String time, String duration) {
    return 'Senast kördes $time, att ta $duration.';
  }

  @override
  String get adminTaskResultFailed => 'Misslyckades';

  @override
  String get adminTaskResultCancelled => 'Inställt';

  @override
  String get adminTaskResultAborted =>
      'Avbrutet på grund av att servern stängdes av';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '${seconds}s';
  }

  @override
  String get adminDeleteTaskTrigger => 'Ta bort utlösare för uppgift';

  @override
  String get adminDeleteTaskTriggerConfirm =>
      'Är du säker på att du vill ta bort den här uppgiftsutlösaren?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return 'Varje $minutes minuter';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return 'Varje $hours timmar';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes minuter';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours timmar';
  }

  @override
  String get adminTimeLimitHours => 'Tidsfrist (hours)';

  @override
  String get adminTranscodingDecodingFor => 'Aktivera hårdvaruavkodning för';

  @override
  String get adminTranscodingThreadCountHelp =>
      'Det maximala antalet trådar som en omkodning kan använda. Färre trådar minskar CPU-användningen men kan göra uppspelningen för långsam för att fungera smidigt.';

  @override
  String get adminTranscodingThreadMax => 'Max';

  @override
  String get adminTranscodingFfmpegPath => 'FFmpeg-sökväg';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      'Den version av FFmpeg som servern kör. Den konfigureras på servern, inte här.';

  @override
  String get adminTranscodingAudioSeek => 'Strategi för ljudsökning';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'Hur servern hanterar ljudet när du hoppar framåt eller bakåt i en HLS-ström.';

  @override
  String get adminTranscodingTrimCopiedAudio => 'Klippa det kopierade ljudet';

  @override
  String get adminTranscodingTranscodeAudio => 'Omkoda ljud';

  @override
  String get adminResumeMinAudiobookMinutes =>
      'Minsta längd för en ljudboks sammanfattning (minuter)';

  @override
  String get adminResumeMinAudiobookHelp =>
      'Ljudböcker som avbröts före denna tidpunkt räknas som ospelade.';

  @override
  String get adminResumeAudiobookRemaining =>
      'Återstående tid för ljudboken innan den fortsätter';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      'Ljudböcker som avbryts när det återstår färre minuter än detta räknas som spelade.';

  @override
  String get adminBrandingSplashSection => 'Startskärm';

  @override
  String get adminBrandingSectionWebClient => 'Webbklient';

  @override
  String get adminBrandingSplashSizeHint =>
      'Anpassade bilder ska ha bildförhållandet 16:9 och en minsta storlek på 1920x1080.';

  @override
  String get adminNetworkingSectionServerAddress =>
      'Inställningar för serveradress';

  @override
  String get adminNetworkingSectionHttps => 'HTTPS-inställningar';

  @override
  String get adminNetworkingSectionRemoteAccess =>
      'Inställningar för fjärråtkomst';

  @override
  String get adminNetworkingSectionIpProtocols => 'IP-protokoll';

  @override
  String get adminNetworkingSectionDiscovery => 'Nätverksupptäckt';

  @override
  String get adminNetworkingSectionFirewall =>
      'Brandväggs- och proxyinställningar';

  @override
  String get adminNetworkingLocalHttpPort => 'Lokalt HTTP-portnummerr';

  @override
  String get adminNetworkingLocalHttpPortHelp =>
      'TCP-portnumret för HTTP-servern.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'Lyssna på HTTPS-porten. Ett giltigt certifikat måste också konfigureras för att detta ska träda i kraft.';

  @override
  String get adminNetworkingLocalHttpsPort => 'Lokalt HTTPS-portnummer';

  @override
  String get adminNetworkingLocalHttpsPortHelp =>
      'TCP-portnumret för HTTPS-servern.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      'Lägger till en underkatalog i serverns URL, till exempel https://example.com/jellyfin.';

  @override
  String get adminNetworkingBindAddress =>
      'Koppla till en lokal nätverksadress';

  @override
  String get adminNetworkingBindAddressHelp =>
      'Åsidosätter HTTP-serverns lokala IP-adress. Lämna fältet tomt för att binda till alla adresser. En ändring kräver omstart.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      'IP-adresser eller IP-/nätmaskposter för nätverk som betraktas som lokala när det gäller bandbredds- och fjärråtkomstbegränsningar. Lämna fältet tomt för att betrakta alla RFC1918-adresser som lokala.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      'IP-adresser eller värdnamn för proxyservrarna som ligger framför denna server. Krävs för att kunna läsa X-Forwarded-For-rubriker. En ändring kräver omstart.';

  @override
  String get adminNetworkingCustomCertPath =>
      'Anpassad sökväg till SSL-certifikat';

  @override
  String get adminNetworkingCertPathHelp =>
      'Sökväg till en PKCS #12-fil med ett certifikat och en privat nyckel, för TLS på en anpassad domän.';

  @override
  String get adminNetworkingCertPasswordHelp =>
      'Ange lösenordet om ditt certifikat kräver ett sådant.';

  @override
  String get adminNetworkingAllowRemote =>
      'Tillåt fjärranslutningar till denna server';

  @override
  String get adminNetworkingAllowRemoteHelp =>
      'När funktionen är avstängd blockeras alla fjärranslutningar.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      'IP-adresser eller IP-/nätmaskposter för fjärrnätverk. Lämna fältet tomt för att tillåta alla fjärradresser.';

  @override
  String get adminNetworkingRemoteIpFilterMode =>
      'Filterläge för fjärr-IP-adresser';

  @override
  String get adminNetworkingPublicHttpPortHelp =>
      'Den offentliga porten är kopplad till den lokala HTTP-porten.';

  @override
  String get adminNetworkingPublicHttpsPortHelp =>
      'Den offentliga porten är kopplad till den lokala HTTPS-porten.';

  @override
  String get adminNetworkingAutoDiscoveryLabel =>
      'Aktivera automatisk upptäckt';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      'Låter apparna hitta den här servern på UDP-port 7359.';

  @override
  String get adminNetworkingSamePublishedUri =>
      'Använd samma publicerade server-URI för både intern och extern åtkomst';

  @override
  String get adminNetworkingPublishedUri => 'Publicerad server-URI';

  @override
  String get adminNetworkingPublishedUriHelp =>
      'Åsidosätter den URI som servern skickar ut, beroende på gränssnittet eller klientens IP-adress.';

  @override
  String get adminNetworkingInternalUri => 'Intern URI';

  @override
  String get adminNetworkingInternalUriHelp =>
      'Publicerad server-URI för intern åtkomst.';

  @override
  String get adminNetworkingExternalUri => 'Extern URI';

  @override
  String get adminNetworkingExternalUriHelp =>
      'Publicerad server-URI för extern åtkomst.';

  @override
  String get adminNetworkingOtherPublishedUris => 'Andra publicerade URI:er';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      'URI:er för ett subnät eller gränssnitt, skrivna i formatet subnät=URI.';

  @override
  String get adminBackupsHelp =>
      'Skapa och återställ ögonblicksbilder av din server. De kan omfatta databasen, metadata, undertexter och trickplay-bilder.';

  @override
  String get adminBackupDisclaimer =>
      'Beroende på hur stort ditt bibliotek är kan säkerhetskopieringen ta en stund.';

  @override
  String get adminBackupTasksWarningTitle => 'Schemalagda uppgifter körs';

  @override
  String get adminBackupTasksWarning =>
      'Avbryt dessa uppgifter eller vänta tills de är klara innan du skapar en säkerhetskopia.';

  @override
  String get adminBackupArchiveNotFound =>
      'Servern kunde inte hitta detta säkerhetskopieringsarkiv.';

  @override
  String get adminRestoreInProgress => 'Återställning pågår';

  @override
  String get adminRestoreWaitingForServer =>
      'Väntar på att servern ska komma igång igen.';

  @override
  String get adminRestoreSucceeded => 'Återställningen är klar';

  @override
  String get adminLogWatch => 'Titta';

  @override
  String get adminLogStopWatching => 'Sluta titta';

  @override
  String get adminPluginInstallConfirmTitle =>
      'Bekräfta installationen av tillägget';

  @override
  String get adminPluginInstallDisclaimer =>
      'Att installera ett plugin från tredje part medför risker. Det kan innehålla instabil eller skadlig kod och kan ändras när som helst. Installera endast plugins från utvecklare du litar på, och se till att du vet vad de kan göra, till exempel att göra förfrågningar till externa tjänster, bromsa bibliotekssökningar eller lägga till bakgrundsprocesser.';

  @override
  String get adminGroupOverview => 'Översikt';

  @override
  String get adminGroupLibrary => 'Bibliotek';

  @override
  String get adminGroupPlayback => 'Uppspelning';

  @override
  String get adminGroupPeople => 'Personer';

  @override
  String get adminGroupSystem => 'System';

  @override
  String get adminAreasLabel => 'Administratörsområden';

  @override
  String get adminPagesLabel => 'Sidor';

  @override
  String get adminPageDescDashboard =>
      'Serverns status, sessioner och senaste aktivitet';

  @override
  String get adminPageDescAnalytics =>
      'Bibliotekens storlek, kodekar och format';

  @override
  String get adminPageDescActivity => 'Allt som hände på servern';

  @override
  String get adminPageDescTasks =>
      'Skanningar, rensningar och vad som utlöser dem';

  @override
  String get adminPageDescLibraries =>
      'Mappar, skannrar och verktyg för hämtning av metadata';

  @override
  String get adminPageDescDisplay => 'Hur biblioteken visar sig för användarna';

  @override
  String get adminPageDescMetadata => 'Standard språk, land och bilder';

  @override
  String get adminPageDescNfo => 'Läsa och spara NFO-filer i Kodi';

  @override
  String get adminPageDescLiveTv =>
      'Tuners, programinformation och inspelningar';

  @override
  String get adminPageDescTranscoding =>
      'Hårdvaruacceleration, kodare, tonmappning';

  @override
  String get adminPageDescResume =>
      'När objekt räknas som påbörjade eller spelade';

  @override
  String get adminPageDescStreaming =>
      'Begränsning av bithastigheten vid fjärranslutning';

  @override
  String get adminPageDescTrickplay =>
      'Sök efter förhandsgranskningsminiatyrer';

  @override
  String get adminPageDescUsers => 'Konton, åtkomst och föräldrakontroll';

  @override
  String get adminPageDescDevices => 'Inloggade enheter och deras namn';

  @override
  String get adminPageDescApiKeys => 'Nycklar för appar och skript';

  @override
  String get adminPageDescSettings => 'Servernamn, språk, sökvägar, prestanda';

  @override
  String get adminPageDescBranding =>
      'Inloggningsmeddelande, anpassad CSS, startskärm';

  @override
  String get adminPageDescNetworking => 'Portar, HTTPS, LAN och fjärråtkomst';

  @override
  String get adminPageDescPlugins => 'Installerade tillägg och katalogen';

  @override
  String get adminPageDescRepositories => 'Varifrån kommer tillägg?';

  @override
  String get adminPageDescBackups =>
      'Skapa och återställa säkerhetskopior av servern';

  @override
  String get adminPageDescLogs => 'Serverloggfiler';

  @override
  String adminSearchSettingsHint(int count) {
    return 'Sök $count inställningar';
  }

  @override
  String get adminSearchNoResults => 'Inga inställningar stämmer överens';

  @override
  String get adminSearchClear => 'Rensa sökningen';

  @override
  String get adminUnsavedChanges => 'Osparade ändringar';

  @override
  String get adminDiscard => 'Kasta';

  @override
  String get adminLeaveTitle => 'Vill du avbryta de osparade ändringarna?';

  @override
  String get adminLeaveMessage =>
      'Ändringarna på den här sidan har inte sparats än.';

  @override
  String get adminKeepEditing => 'Fortsätt redigera';

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
    return 'Ta bort enheten \"$name\"? Användaren måste logga in igen på den här enheten.';
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
      'Tillåt fjärrstyrning av andra användare';

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
  String get adminMetadataFieldCustomRating => 'Anpassad betygsättning';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Översikt';

  @override
  String get adminMetadataFieldDisplayOrder => 'Visningsordning';

  @override
  String get adminMetadataDisplayOrderAired => 'Sändes';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate =>
      'Första sändningsdatum';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Absolut';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Digitalt';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Handlingsbåge';

  @override
  String get adminMetadataDisplayOrderProduction => 'Produktion';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternate';

  @override
  String get adminMetadataDisplayOrderRegional => 'Regionalt';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'Alternativ DVD';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Ändringsdatum';

  @override
  String get adminMetadataDisplayOrderSortName => 'Sorteringsnamn';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Utgivningsdatum';

  @override
  String get adminMetadataSettings => 'Inställningar för metadata';

  @override
  String get adminMetadataDownloadLanguage => 'Önskat språk för nedladdning';

  @override
  String get adminMetadataCountryRegion => 'Land/Region';

  @override
  String get adminMetadataInheritHelp =>
      'Låt detta stå på Standard för att ärva inställningen från ett överordnat objekt eller från serverns standardinställning.';

  @override
  String get adminMetadataField3DFormat => '3D-format';

  @override
  String get adminMetadataPersonKindActor => 'Skådespelare';

  @override
  String get adminMetadataPersonKindDirector => 'Regissör';

  @override
  String get adminMetadataPersonKindComposer => 'Kompositör';

  @override
  String get adminMetadataPersonKindWriter => 'Författare';

  @override
  String get adminMetadataPersonKindGuestStar => 'Gästskådespelare';

  @override
  String get adminMetadataPersonKindProducer => 'Producent';

  @override
  String get adminMetadataPersonKindConductor => 'Förare';

  @override
  String get adminMetadataPersonKindLyricist => 'Textförfattare';

  @override
  String get adminMetadataPersonKindArranger => 'Arrangör';

  @override
  String get adminMetadataPersonKindEngineer => 'Ingenjör';

  @override
  String get adminMetadataPersonKindMixer => 'Mixer';

  @override
  String get adminMetadataPersonKindRemixer => 'Remixa';

  @override
  String get adminMetadataPersonKindCreator => 'Skapare';

  @override
  String get adminMetadataPersonKindArtist => 'Konstnär';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Albumets artist';

  @override
  String get adminMetadataPersonKindAuthor => 'Författare';

  @override
  String get adminMetadataPersonKindIllustrator => 'Illustratör';

  @override
  String get adminMetadataPersonKindPenciller => 'Tecknare';

  @override
  String get adminMetadataPersonKindInker => 'Tuschare';

  @override
  String get adminMetadataPersonKindColorist => 'Färgläggare';

  @override
  String get adminMetadataPersonKindLetterer => 'Brev';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Omslagsillustratör';

  @override
  String get adminMetadataPersonKindEditor => 'Redaktör';

  @override
  String get adminMetadataPersonKindTranslator => 'Översättare';

  @override
  String get adminMetadataPersonKindNarrator => 'Berättare';

  @override
  String get adminMetadataAirDays => 'Sändningsdagar';

  @override
  String get adminMetadataLockItem =>
      'Lås den här posten för att förhindra framtida ändringar av metadata';

  @override
  String get adminMetadataEnabledFields => 'Aktiverade fält';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Avmarkera ett fält för att låsa det och förhindra att uppgifterna i det ändras.';

  @override
  String get adminMetadataLockFieldName => 'Namn';

  @override
  String get adminMetadataLockFieldOverview => 'Översikt';

  @override
  String get adminMetadataLockFieldGenres => 'Genrer';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Åldersgräns';

  @override
  String get adminMetadataLockFieldCast => 'Personer';

  @override
  String get adminMetadataLockFieldProductionLocations =>
      'Produktionsanläggningar';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Födelseort';

  @override
  String get adminMetadataLockFieldRuntime => 'Speltid';

  @override
  String get adminMetadataLockFieldStudios => 'Studior';

  @override
  String get adminMetadataLockFieldTags => 'Taggar';

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
  String get adminPluginsRestartRequired => 'Omstart krävs';

  @override
  String get adminPluginsNoSearchResults => 'Inga plugins matchar din sökning';

  @override
  String get adminPluginsNoneInstalled => 'Inga plugins installerade';

  @override
  String get adminPluginsNoneActive => 'Inga aktiva tillägg';

  @override
  String get adminPluginsNoneRequireRestart =>
      'Inga tillägg kräver att servern startas om';

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
  String get syncPlayRepeatSubtitle => 'Spela upp ett objekt eller hela kön';

  @override
  String get syncPlayRepeatOne => 'En';

  @override
  String get syncPlayShuffleSubtitle =>
      'Spela låtarna i kö i ordning eller i slumpmässig ordning';

  @override
  String get syncPlayShuffleModeShuffled => 'Blandade';

  @override
  String get syncPlayShuffleModeSorted => 'Sorterad';

  @override
  String get syncPlayParticipantYou => 'Du';

  @override
  String syncPlayGroupSubtitle(String participants, String detail) {
    return '$participants · $detail';
  }

  @override
  String get syncPlayNothingQueued => 'Inget i kön ännu';

  @override
  String get syncPlayOthersCanJoinHint =>
      'Andra kan ansluta sig via sin SyncPlay-skärm så länge gruppen finns kvar.';

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
  String get syncPlayCreateGroupSubtitle =>
      'Watch together tillsammans med alla som ansluter sig';

  @override
  String get syncPlayGroupName => 'Gruppnamn';

  @override
  String get syncPlayDefaultGroupName => 'Min SyncPlay grupp';

  @override
  String get syncPlayCreateGroup => 'Skapa grupp';

  @override
  String get syncPlayAvailableGroups => 'Tillgängliga grupper';

  @override
  String syncPlayAvailableGroupsCount(int count) {
    return 'Tillgängliga grupper · $count';
  }

  @override
  String get syncPlayNoGroupsAvailable => 'Inga grupper tillgängliga';

  @override
  String get syncPlayNoGroupsAvailableHint =>
      'Grupper som andra personer skapar på den här servern kommer att visas här.';

  @override
  String get syncPlayJoinGroupQuestion => 'Gå med i gruppen SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Att gå med i en SyncPlay-grupp kan ersätta din nuvarande uppspelningskö. Fortsätta?';

  @override
  String get syncPlayJoinReplacesQueueNote =>
      'Om du går med i en grupp kan det hända att din nuvarande uppspelningskö ersätts.';

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
  String get kidsMode => 'Barnläge';

  @override
  String get kidsModeSubtitle =>
      'Förenkla appen och lås utgången med en PIN-kod';

  @override
  String get kidsModeExit => 'Avsluta barnläget';

  @override
  String get kidsModeExitSubtitle =>
      'Ange din PIN-kod för att återställa hela appen';

  @override
  String kidsModePinToSwitchUser(String name) {
    return 'Ange PIN-koden för barnläget för att växla till $name';
  }

  @override
  String get pinIncorrect => 'Felaktig PIN-kod';

  @override
  String pinTryAgainIn(String wait) {
    return 'För många försök. Försök igen om $wait.';
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
  String get trackActionViewDetails => 'Visa detaljer';

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
  String get removeFromPlaylist => 'Ta bort från spellistan';

  @override
  String removeFromPlaylistConfirm(String item, String playlist) {
    return 'Ta bort $item från $playlist?';
  }

  @override
  String get removeFromPlaylistFailed =>
      'Det gick inte att ta bort från spellistan';

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
  String get playerTooltipPictureInPicture => 'Bild-i-bild';

  @override
  String get playerTooltipExitPictureInPicture => 'Avsluta bild-i-bild-läget';

  @override
  String get playerPlayingInPictureInPicture => 'Spela upp i bild-i-bild-läge';

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
  String get playerTooltipMinimize => 'Minimera spelaren';

  @override
  String get miniPlayerOpenPlayer => 'Öppna spelaren';

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
  String get contextMenuRemoveFromCollection => 'Ta bort från samlingen';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Ta bort $item från $collection? Objektet finns kvar i ditt bibliotek.';
  }

  @override
  String get removeFromCollectionFailed =>
      'Det gick inte att ta bort från samlingen';

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
      'Den här serverns certifikat är inte betrott. Om det är din egen server och den använder ett självsignerat eller privat certifikat kan du godkänna det här.';

  @override
  String get clientCertTitle => 'Klientcertifikat';

  @override
  String clientCertHost(String host) {
    return 'Intyg för $host';
  }

  @override
  String get clientCertChooseFile => 'Välj fil';

  @override
  String get clientCertPassword => 'Lösenord för certifikatet';

  @override
  String get clientCertStartUpload => 'Skicka från telefonen';

  @override
  String get clientCertUploadHint =>
      'Skanna den här koden med din mobil, eller öppna adressen i webbläsaren, välj sedan filen och ange lösenordet.';

  @override
  String get clientCertStopUpload => 'Sluta vänta';

  @override
  String get clientCertNoFileData =>
      'Det gick inte att läsa filen. Försök igen.';

  @override
  String get clientCertPickFailed => 'Det gick inte att öppna filväljaren.';

  @override
  String get clientCertUploadFailed =>
      'Det gick inte att öppna uppladdningssidan. Försök igen.';

  @override
  String get clientCertNoSecureStorage =>
      'Den här enheten har inget säkert lagringsutrymme, så certifikatet kan inte sparas. Under Linux ska du installera libsecret och försöka igen.';

  @override
  String get clientCertDecodeFailed =>
      'Det gick inte att läsa den filen som ett certifikat. Se till att den har filändelsen .p12 eller .pfx.';

  @override
  String get clientCertWrongPassword =>
      'Det lösenordet låser inte upp det här certifikatet.';

  @override
  String get clientCertRequired =>
      'Den här servern kräver ett klientcertifikat (mTLS). Lägg till ett för den här värden för att fortsätta.';

  @override
  String clientCertExpired(String date) {
    return 'Certifikatet för denna server löpte ut den $date. Byt ut det för att kunna fortsätta.';
  }

  @override
  String get clientCertAddButton => 'Lägg till klientcertifikat';

  @override
  String get settingsClientCertificates => 'Klientcertifikat';

  @override
  String get settingsClientCertificatesSubtitle =>
      'Certifikat som den här appen visar upp för servrar som kräver ett sådant (mTLS)';

  @override
  String get clientCertSubject => 'Ämne';

  @override
  String clientCertExpires(String date) {
    return 'Giltighetstid $date';
  }

  @override
  String get clientCertReplace => 'Ersätt';

  @override
  String get clientCertAdd => 'Lägg till certifikat';

  @override
  String get clientCertAddHostPrompt =>
      'Vilken serverleverantör behöver ett certifikat?';

  @override
  String get itemBlockedByParentalControls => 'Det här finns inte tillgängligt';

  @override
  String get blockedRatingsCeilingHint =>
      'Om man blockerar ett betyg blockeras även alla betyg som är högre än det.';

  @override
  String get blockedRatingsUnrankedSection => 'Blockerar endast sig själv';

  @override
  String get settingsHomePage => 'Hemsida';

  @override
  String get settingsTwentyFourHourClock => '24-timmarsklocka';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Använd 24-timmars tidsformatering varhelst klockan visas';

  @override
  String get settingsDateFormat => 'Datumformat';

  @override
  String get settingsDateFormatDescription =>
      'Välj mellan månad-dag, dag-månad eller lokala standardinställningar för kalender- och utgivningsdatum';

  @override
  String get dateFormatSystem => 'Standardinställning för språk';

  @override
  String get dateFormatMonthDay => 'Månad / Dag (10 nov)';

  @override
  String get dateFormatDayMonth => 'Dag / Månad (10 nov)';

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
      'Visa knappen ”Live-TV” i navigeringsfältet när servern har ett Live-TV-bibliotek';

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
  String get useNativeEmulator => 'Inbyggd emulering';

  @override
  String get useNativeEmulatorSubtitle =>
      'Spela spel med inbyggda kärnor istället för webbspelaren EmulatorJS';

  @override
  String get emulatorCores => 'Emulatorkärnor';

  @override
  String get emulatorCoresSubtitle =>
      'Ladda ner system för att spela spel direkt';

  @override
  String get emulatorCoresDescription =>
      'Välj vilka system du vill installera. Kärnorna tillhandahålls av Libretro-projektet och gör det möjligt att köra spel direkt istället för i en webbläsarvy.';

  @override
  String get emulatorCoreDownloading => 'Laddar ner';

  @override
  String get emulatorCoreUnavailable => 'Finns inte för den här enheten';

  @override
  String get emulatorCoreDownloadFailed =>
      'Det gick inte att ladda ner kärnan. Kontrollera din anslutning och försök igen.';

  @override
  String emulatorCoreResetSettings(String system) {
    return 'Återställ $system återställa inställningarna till standardvärdena';
  }

  @override
  String get emulatorCoreSettingsReset =>
      'Inställningarna har återställts till standardvärdena.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Det gick inte att återställa inställningarna. Kontrollera din anslutning och försök igen.';

  @override
  String get downloadedGames => 'Nedladdade spel';

  @override
  String get downloadedGamesSubtitle =>
      'Frigör utrymme som upptas av spelfiler';

  @override
  String get downloadedGamesDescription =>
      'Spelen kopieras till den här enheten innan de spelas. Ta bort de spel du har spelat klart för att frigöra utrymme. Spelstatusen sparas på servern och raderas inte.';

  @override
  String get downloadedGamesEmpty =>
      'Inga spel har laddats ner till den här enheten än.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count spel, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Ta bort alla';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Ta bort $title från den här enheten? Den kommer att laddas ner igen nästa gång du spelar den.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Vill du ta bort alla nedladdade spel från den här enheten? De kommer att laddas ner igen nästa gång du spelar dem.';

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
    return '$segment Segment';
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
  String get settingsSkipButtonAutoHide =>
      'Dölj knappen ”Hoppa över” automatiskt';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Dölj automatiskt knappen för att hoppa över intro och outro efter några sekunder.';

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
  String get settingsRedetectDisplay => 'Visning av återdetektering';

  @override
  String get settingsRedetectDisplayDescription =>
      'Fråga TV:n igen vilka HDR-format den stöder. Använd detta om titlar i Dolby Vision eller HDR10 omkodas efter att TV:n eller mottagaren har slagits på sent.';

  @override
  String get settingsDisplayIsSdr => 'Min TV har inte HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Sluta marknadsföra HDR-stöd för den här skärmen. Använd den här funktionen endast om detekteringen hela tiden visar att det finns HDR som din TV egentligen inte kan återge.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Skärmen har upptäckts på nytt: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'Inga HDR-format har upptäckts';

  @override
  String get settingsDisplayMarkedSdr => 'Visas som SDR';

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
  String get settingsAutoAftkrtEnabled => 'Auto';

  @override
  String get settingsEnabledOnThisDevice => 'Aktiverad';

  @override
  String get settingsDisabledPreferTranscode => 'Av';

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
  String get settingsHideControlsAfter => 'Dölj kontrollerna efter';

  @override
  String get settingsHideControlsAfterDescription =>
      'Hur länge spelkontrollerna visas på skärmen efter att du senast tryckt på en knapp, pekat eller rört musen.';

  @override
  String get settingsHdrControlsDimming => 'Dimningsreglage i HDR';

  @override
  String get settingsHdrControlsDimmingDescription =>
      'Vitt framstår som betydligt ljusare jämfört med HDR-video, så spelaren dämpar ljusstyrkan med just så mycket under uppspelningen.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitström AC3 till extern dekoder';

  @override
  String get settingsCinemaMode => 'Bioläge';

  @override
  String get settingsCinemaModeSubtitle =>
      'Spela trailers/prerolls före en huvudfunktion';

  @override
  String get settingsCinemaModeEpisodes => 'Biografläge för avsnitt';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Spela även prerolls innan TV-avsnitten';

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
  String get settingsSyncplayEnabled => 'Watch Parties';

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
    return 'Nyligen tillagt $libraryName';
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
      'Spela upp Dolby Vision med HDR10+ som HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Ta bort Dolby Vision-lagret från videor som även har HDR10+. Aktivera den här inställningen om dessa videor spelas upp med ljud men med svart skärm.';

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
  String get libraryCardTitles => 'Rubriker under affischer';

  @override
  String get libraryCardTitlesDescription =>
      'Visa varje objekts titel och information under dess omslagsbild i bibliotekets rutnät.';

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
  String get homeRowsStyleCarousel => 'Carousel';

  @override
  String get homeRowsSection => 'Hemrader';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klassisk behåller bildtyp per rad och infoöverlägg. Modern använder rader som går från stående format till bakgrundsbild.';

  @override
  String get modernCardsOnMyMediaRow => 'Moderna kort i raden ”Mina medier”';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Visa anpassningsbara affischer som fördjupar fokusområdet. Inaktivera för att alltid visa miniatyrbilder i liggande format.';

  @override
  String get sortOrder => 'Sorteringsordning';

  @override
  String get ascending => 'Stigande';

  @override
  String get descending => 'Fallande';

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
      'Sortera raderna i Favoriter i stigande eller fallande ordning.';

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
      'Sortera raderna i samlingarna i stigande eller fallande ordning.';

  @override
  String get collectionsRowShowEpisodes => 'Visa enskilda avsnitt';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Visa TV-serier i utökat läge för att visa varje avsnitt separat.';

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
      'Sortera raderna efter genre i stigande eller fallande ordning.';

  @override
  String get genresRowItems => 'Objekt på genrerader';

  @override
  String get genresRowItemsDescription =>
      'Visa filmer, serier eller båda på genrerader.';

  @override
  String get displayStudiosRows => 'Display Studio-rad';

  @override
  String get displayStudiosRowsSubtitle =>
      'Visa raden ”Studio” under ”Hem”-avsnitten.';

  @override
  String get sinceYouWatched => 'Eftersom du tittade på';

  @override
  String get sinceYouWatchedRowTitle => 'Eftersom du tittade på';

  @override
  String sinceYouWatchedItemRowTitle(String title) {
    return 'Eftersom du tittade på \"$title\"';
  }

  @override
  String sinceYouWatchedRowNumber(int number) {
    return 'Sedan du tittade på raden $number';
  }

  @override
  String get displaySinceYouWatchedRows =>
      'Visa antalet rader sedan du tittade';

  @override
  String get displaySinceYouWatchedRowsSubtitle =>
      'Visa och anpassa raderna ”Sedan du tittade på” i avsnitten på startsidan.';

  @override
  String get sinceYouWatchedSource => 'Källa till rekommendationen';

  @override
  String get sinceYouWatchedSourceDescription =>
      'Välj rekommendationskälla (Moonfin Recommends – anpassad lokal algoritm, Server Recommends från din mediaserver eller TMDb:s likhetsmått. Obs! Online-rekommendationer kräver Seerr-integration).';

  @override
  String get sinceYouWatchedSourceLocal => 'Moonfin Recommends';

  @override
  String get sinceYouWatchedSourceServer => 'Serverens rekommendationer';

  @override
  String get sinceYouWatchedSourceOnline => 'TMDb-likhet';

  @override
  String get sinceYouWatchedSourceType => 'Källtyp';

  @override
  String get sinceYouWatchedSourceTypeDescription =>
      'Välj vilken typ av artiklar som ska rekommenderas';

  @override
  String get sinceYouWatchedSourceItem => 'Källobjekt';

  @override
  String get sinceYouWatchedSourceItemDescription =>
      'Välj vilket källobjekt rekommendationerna ska baseras på';

  @override
  String get sinceYouWatchedRecentlyWatched => 'Senast visade';

  @override
  String get sinceYouWatchedNumRows => 'Antal rader som ska läggas till';

  @override
  String get sinceYouWatchedNumRowsDescription =>
      'Välj hur många rader från ”Sedan du tittade på” som ska visas (1–5)';

  @override
  String get sinceYouWatchedIncludeWatched => 'Inkludera tidigare visade';

  @override
  String get sinceYouWatchedIncludeWatchedSubtitle =>
      'Inkludera titlar som du har sett i rekommendationerna';

  @override
  String get studiosRowSorting => 'Sortering av Studio Row';

  @override
  String get studiosRowSortingDescription =>
      'Studio-raden efter namn, nyligen tillagda och mer.';

  @override
  String get studiosRowSortOrderDescription =>
      'Välj sorteringsordning: stigande eller fallande.';

  @override
  String get selectStudiosToInclude => 'Välj vilka studior som ska ingå';

  @override
  String get selectStudiosToIncludeDescription =>
      'Välj vilka studior som ska visas på startsidan.';

  @override
  String get selectAllStudios => 'Välj Alla';

  @override
  String get deselectAllStudios => 'Avmarkera alla';

  @override
  String get tvStudiosFilter => 'TV-studior';

  @override
  String get movieStudiosFilter => 'Filmstudior';

  @override
  String get selectedStudiosFilter => 'Utvalda studior';

  @override
  String get unselectedStudiosFilter => 'Unselected Studios';

  @override
  String get filtersHeader => 'Filter';

  @override
  String get showHeader => 'Visa';

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
      'Sortera raderna i spellistan i stigande eller fallande ordning.';

  @override
  String get playlistsRowShowEpisodes => 'Visa enskilda avsnitt';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Visa TV-serier i utvidgad vy för att visa varje avsnitt separat.';

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
      'Sortera ljudraderna i stigande eller fallande ordning.';

  @override
  String get sorting => 'Sortering';

  @override
  String get imdbRowsSorting => 'Sortering av rader på IMDb';

  @override
  String get imdbRowsSortingDescription =>
      'Sortera raderna på IMDb efter namn, utgivningsdatum, betyg och annat.';

  @override
  String get imdbRowsSortOrderDescription =>
      'Sortera IMDb-raderna i stigande eller fallande ordning.';

  @override
  String get tmdbRowsSorting => 'Sortering av rader i TMDB';

  @override
  String get tmdbRowsSortingDescription =>
      'Sortera TMDB-rader efter namn, utgivningsdatum, betyg och mer.';

  @override
  String get tmdbRowsSortOrderDescription =>
      'Sortera TMDB-raderna i stigande eller fallande ordning.';

  @override
  String get seerrRowsSorting => 'Seerr-radsortering';

  @override
  String get seerrRowsSortingDescription =>
      'Sortera raderna i Seerr efter namn, utgivningsdatum, betyg och mer.';

  @override
  String get seerrRowsSortOrderDescription =>
      'Sortera Seerr-raderna i stigande eller fallande ordning.';

  @override
  String get externalRowSortDefault => 'Standard (lista)';

  @override
  String get externalRowSortName => 'Namn';

  @override
  String get externalRowSortReleaseDate => 'Utgivningsdatum';

  @override
  String get externalRowSortRating => 'Betyg';

  @override
  String get externalRowSortPopularity => 'Popularitet';

  @override
  String get externalRowSortShuffle => 'Blanda';

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
  String get locallyDecodedCodecs => 'Lokalt avkodade kodekar';

  @override
  String get transcodeTargetCodecs => 'Målkodekar för omkodning';

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
  String get hevcSoftwareDirectPlay =>
      'Direktuppspelning av HEVC (mjukvaruavkodning)';

  @override
  String get hevcSoftwareDirectPlaySubtitle =>
      'Spela upp HEVC i upp till 1080p direkt från originalfilen istället för att be servern att omkoda den. Denna Apple TV avkodar filen programvarumässigt, vilket innebär att tunga 10-bitarsfiler eller filer med hög bithastighet kan hacka.';

  @override
  String get av1SoftwareUhdDirectPlay =>
      'Direktuppspelning av 4K AV1 (programvaruavkodning)';

  @override
  String get av1SoftwareUhdDirectPlaySubtitle =>
      'Spela upp AV1 i upplösning över 1080p, inklusive HDR10, direkt från originalfilen istället för att be servern att omkoda den. Den här enheten avkodar AV1 programvarumässigt, vilket innebär att tunga 4K-filer eller filer med hög bithastighet kan hacka.';

  @override
  String get cadenceSlowdown => 'Jämn bild med 24 fps på en 60 Hz-TV';

  @override
  String get cadenceSlowdownSubtitle =>
      'När funktionen ”Match Frame Rate” är avstängd spelas videon med 24 fps upp 0,1 % långsammare så att den passar TV:n utan att bildrutor går förlorade. Används inte när ljudet skickas vidare till en receiver.';

  @override
  String get cadenceTipTitle => 'Aktivera anpassning till bildfrekvens';

  @override
  String get cadenceTipMessage =>
      'Den här videon kan inte spelas upp smidigt med din TV:s nuvarande uppdateringsfrekvens. Öppna Inställningar > Video och ljud > Anpassa innehåll på din Apple TV och aktivera Anpassa bildfrekvens.';

  @override
  String get cadenceTipSlowdownHint =>
      'Eller aktivera ”Smooth 24 fps” på en 60 Hz-TV i Moonfin under Uppspelning > Kvalitet och avkodning.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Öppna videouppspelning i din valda externa app på Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Endast direktsänd TV';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Använd den externa spelaren för direktsänd TV och behåll allt annat i den inbyggda spelaren.';

  @override
  String get automaticQueuing => 'Automatisk kö';

  @override
  String get preferSdhSubtitles => 'Föredra SDH-undertexter';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritera SDH-/CC-undertextspår vid automatiskt val.';

  @override
  String get preferTextSubtitles => 'Föredrar textundertexter';

  @override
  String get preferTextSubtitlesSubtitle =>
      'Prioritera textbaserade undertexter (SRT, VTT) framför bildbaserade format (PGS, VobSub).';

  @override
  String get preferExternalSubtitles => 'Föredrar externa undertexter';

  @override
  String get preferExternalSubtitlesSubtitle =>
      'Prioritera externa undertextfiler framför inbäddade spår.';

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
  String get appearancesSeerr => 'Medverkanden (Seerr)';

  @override
  String get crewContributionsSeerr => 'Produktionsmedverkan (Seerr)';

  @override
  String get personWebsite => 'Officiell webbplats';

  @override
  String get watchWithGroup => 'Titta med grupp';

  @override
  String get watchPartyGroupSubtitles => 'Undertexter för alla';

  @override
  String get watchPartyOwnSubtitles => 'Varje persons val';

  @override
  String get watchPartyLobby => 'I foajén';

  @override
  String get watchPartyUpNextLabel => 'Nästa';

  @override
  String get watchPartyRoomSettings => 'Rumsinställningar';

  @override
  String get watchPartyCodeOrLink => 'Rumskod eller inbjudningslänk';

  @override
  String get watchPartyCopyInvite => 'Kopiera inbjudningslänken';

  @override
  String get watchPartyInviteCopied => 'Inbjudningslänken har kopierats';

  @override
  String get watchPartyLetEveryoneVote => 'Låt alla rösta om filmer';

  @override
  String get watchPartyVoteHelp =>
      'Lägg till filmer som alla kan rösta på, och spela sedan upp den du vill se. TV-avsnitt väljer du fortfarande själv.';

  @override
  String get watchPartyGuestVoteHelp =>
      'Rösta på det du vill se. Programledaren spelar upp ett av dem.';

  @override
  String get watchPartySearchMovies => 'Sök efter filmer';

  @override
  String get watchPartyNoSuggestions =>
      'Det finns inga filmer att rösta på än.';

  @override
  String get watchPartySuggested => 'Lagt till i omröstningen för Watch Party';

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
  String get watchPartyUnavailable =>
      'Den här servern erbjuder inte Watch Party.';

  @override
  String get watchPartyRoomCode => 'Rumskod';

  @override
  String get watchPartyStart => 'Starta en watch party';

  @override
  String get watchPartyPickTitle =>
      'Öppna en titel och välj ”Titta tillsammans med gruppen” för att bestämma vad alla ska titta på.';

  @override
  String get watchPartyWaitingForHost =>
      'Väntar på att värden ska välja något.';

  @override
  String get watchPartyShareCode =>
      'Andra ansluter sig med den här koden från sina Watch Party skärm.';

  @override
  String get watchPartyReconnecting => 'Återansluter...';

  @override
  String get watchPartyOffline => 'offline';

  @override
  String get watchPartyStartForEveryone => 'Start för alla';

  @override
  String watchPartyResumeAt(String time) {
    return 'CV på $time';
  }

  @override
  String get watchPartyStartFromBeginning => 'Börja från början';

  @override
  String watchPartyResumeWhere(String name) {
    return 'Var $name där vi slutade, vilket är det tidigaste någon här har nått.';
  }

  @override
  String get watchPartyResumeEarliest =>
      'Den tidigaste tidpunkten som någon här har nått.';

  @override
  String get watchPartyResumeYours => 'Där du slutade. Alla börjar där.';

  @override
  String watchPartyResumeNotStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people haven\'t started it yet.',
      one: '1 person hasn\'t started it yet.',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyBackToLobby => 'Tillbaka till lobbyn';

  @override
  String get watchPartyGuestsCanPause => 'Gästerna kan spela upp och pausa';

  @override
  String get watchPartyEnd => 'Slut för alla';

  @override
  String get watchPartyEnded => 'Watch Party har avslutats.';

  @override
  String get watchPartyStaged => 'Utvald till Watch Party';

  @override
  String watchPartyUpNext(String title) {
    return 'Nästa: $title';
  }

  @override
  String get watchParties => 'Watch Parties';

  @override
  String get watchPartyStartWith => 'Inled festerna med';

  @override
  String get watchPartyServiceMoonbaseHint =>
      'Chatt, reaktioner och omröstningar. Drivs på Moonbase.';

  @override
  String get watchPartyServiceSyncPlayHint =>
      'Jellyfins egen. Vänner som använder andra Jellyfin-appar kan gå med.';

  @override
  String get watchPartyServiceNote =>
      'Du kan gå med i båda typerna av rum. Det här avgör endast vilket du startar.';

  @override
  String get watchPartyDuringParty => 'Under en fest';

  @override
  String get watchPartyChatOverlay => 'Visa chatten över videon';

  @override
  String get watchPartyChatOverlaySubtitle =>
      'Nya meddelanden visas i några sekunder';

  @override
  String get watchPartyAlerts => 'Partivarningar';

  @override
  String get watchPartyAlertsSubtitle =>
      'Säg till när någon på den här servern startar en';

  @override
  String get watchPartyJoinWithCode => 'Join with a code';

  @override
  String get watchPartyOnThisServer => 'On this server';

  @override
  String watchPartyCountOnServer(int count) {
    return '$count on this server';
  }

  @override
  String get watchPartyRoomsHint =>
      'You need access to the item to join. A room closes when its last person leaves.';

  @override
  String get watchPartyRoomsEmpty =>
      'Parties you can watch show up here. Got a code from someone? Pick Join with a code.';

  @override
  String get watchPartyPasteHint =>
      'Pasting an invite link here works too. On a phone, the link opens Moonfin straight into the party.';

  @override
  String watchPartyWatchingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count watching',
      one: '$count watching',
    );
    return '$_temp0';
  }

  @override
  String watchPartyHostsParty(String name) {
    return '$name\'s party';
  }

  @override
  String get watchPartyEveryoneControlsShort => 'Everyone controls';

  @override
  String get watchPartyVotingNow => 'Voting on what to watch';

  @override
  String get watchPartyNeedsMoonbase =>
      'Watch Parties need Moonbase on this server';

  @override
  String get watchPartyNeedsMoonbaseHint =>
      'Ask whoever runs the server to install the Moonbase plugin. On Jellyfin, SyncPlay still works without it.';

  @override
  String get watchPartyWrongPin => 'That PIN didn\'t work. Try again.';

  @override
  String get watchPartyTooManyTries => 'Too many tries. Wait a minute.';

  @override
  String get watchPartyFull => 'This party is full.';

  @override
  String get watchPartyNoSuchCode => 'No room has that code.';

  @override
  String get watchPartyNoAccess =>
      'You don\'t have access to what they\'re watching.';

  @override
  String get watchPartyRemoved => 'The host removed you from the party.';

  @override
  String get watchPartyYours => 'Your watch party';

  @override
  String get watchPartyInviteHint =>
      'Paste it in any chat. It opens a page on this server with an Open in Moonfin button.';

  @override
  String get watchPartySendInvite => 'Send the invite';

  @override
  String get watchPartyScanInvite =>
      'Scan with your phone to get the invite link, then send it from there. Or just share the code.';

  @override
  String get watchPartyStartsTogether =>
      'Play waits for everyone\'s player, 10 seconds at most, then counts down 3, 2, 1.';

  @override
  String get watchPartyStatusInSync => 'In sync';

  @override
  String get watchPartyStatusCatchingUp => 'Catching up';

  @override
  String get watchPartyStatusBuffering => 'Buffering';

  @override
  String get watchPartyStatusNotWatching => 'Not watching';

  @override
  String get watchPartyStatusReady => 'Ready';

  @override
  String get watchPartyStatusJoining => 'Joining';

  @override
  String get watchPartyHost => 'Host';

  @override
  String watchPartyWaitingFor(String name) {
    return 'Waiting for $name\'s player';
  }

  @override
  String watchPartyWaitingForCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Waiting for $count players',
      one: 'Waiting for $count player',
    );
    return '$_temp0';
  }

  @override
  String watchPartyStartingAnyway(int seconds) {
    return 'Starting anyway in $seconds s';
  }

  @override
  String get watchPartyStartingTogether => 'Starting together';

  @override
  String watchPartyToastPaused(String name) {
    return '$name paused';
  }

  @override
  String watchPartyToastResumed(String name) {
    return '$name resumed';
  }

  @override
  String watchPartyToastSkipped(String name, String time) {
    return '$name skipped to $time';
  }

  @override
  String watchPartyToastJoined(String name) {
    return '$name joined';
  }

  @override
  String watchPartyToastLeft(String name) {
    return '$name left';
  }

  @override
  String watchPartyToastSwitched(String name, String title) {
    return '$name switched to $title';
  }

  @override
  String get watchPartyToastYouAreHost => 'You\'re the host now';

  @override
  String watchPartyToastNewHost(String name) {
    return '$name is the host now';
  }

  @override
  String get watchPartyToastEveryoneControls =>
      'Everyone can control playback now';

  @override
  String get watchPartyToastHostControls =>
      'Only the host controls playback now';

  @override
  String get watchPartyOnlyHostControls =>
      'Only the host can control playback.';

  @override
  String get watchPartyToastReconnecting => 'Reconnecting to the party...';

  @override
  String get watchPartyToastReconnected => 'Back in the party';

  @override
  String watchPartyToastEnded(String name) {
    return '$name ended the party';
  }

  @override
  String get watchPartyChat => 'Chat';

  @override
  String get watchPartySendToParty => 'Send to the party';

  @override
  String get watchPartyBackToClose => 'Tillbaka till stängning';

  @override
  String get watchPartyType => 'Typ';

  @override
  String get watchPartyReplyHaha => 'Haha';

  @override
  String get watchPartyReplyNoWay => 'No way';

  @override
  String get watchPartyReplyPausePlease => 'Pause please';

  @override
  String get watchPartyReplyBrb => 'Brb';

  @override
  String get watchPartyReplyAgain => 'Again!';

  @override
  String get watchPartyReactionLove => 'Love';

  @override
  String get watchPartyReactionHaha => 'Haha';

  @override
  String get watchPartyReactionWow => 'Wow';

  @override
  String get watchPartyReactionSad => 'Sad';

  @override
  String get watchPartyReactionFire => 'Fire';

  @override
  String get watchPartyReactionPopcorn => 'Popcorn';

  @override
  String get watchPartyMakeHost => 'Make host';

  @override
  String get watchPartyEveryoneControls => 'Everyone can control playback';

  @override
  String get watchPartyEveryoneControlsHint =>
      'Anyone can play, pause and skip';

  @override
  String get watchPartyRoomPin => 'Room PIN';

  @override
  String get watchPartyRoomPinHint => 'Ask for a PIN before anyone joins';

  @override
  String get watchPartyPinDigits => '4 to 8 digits';

  @override
  String get watchPartyLeave => 'Leave';

  @override
  String watchPartyLeaveHandsOver(String name) {
    return 'Leave · $name hosts';
  }

  @override
  String watchPartyStartedBy(String name) {
    return '$name started a watch party';
  }

  @override
  String watchPartyInLobbyCount(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$title · $count in the lobby',
      one: '$title · $count in the lobby',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyFirstOnHome => 'It\'s first in Watch Parties on Home';

  @override
  String watchPartyAddServerQuestion(String address) {
    return 'This invite is for a server you have not added yet, $address. Add it and sign in to join.';
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
    return '+$count till';
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
  String get achievementsRecap => 'Sammanfattning';

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
  String get achievementsDailyQuests => 'Dagligen';

  @override
  String get achievementsWeeklyQuests => 'Varje vecka';

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
  String get achievementsAppearance => 'Utseende';

  @override
  String get achievementsAppearanceSubtitle =>
      'The avatar and title on your profile';

  @override
  String get achievementsAvatars => 'Avatars';

  @override
  String get achievementsTitles => 'Titlar';

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
  String get achievementsStats => 'Statistik';

  @override
  String get achievementsStatsSubtitle =>
      'Your records and how the server is doing';

  @override
  String get achievementsStatsWatched => 'Visad';

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
  String get achievementsStatUsers => 'Användare';

  @override
  String get achievementsStatBadgesUnlocked => 'Badges unlocked';

  @override
  String get achievementsStatScoreEarned => 'Score earned';

  @override
  String get achievementsStatCommonBadge => 'Most common badge';

  @override
  String get achievementsActivity => 'Aktivitet';

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
  String get friendsDecline => 'Nedgång';

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
  String get chatYou => 'Du';

  @override
  String chatYouSaid(String text) {
    return 'You: $text';
  }

  @override
  String get chatPhoto => 'Foto';

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
  String get chatGroupName => 'Gruppnamn';

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
  String get chatAdmin => 'Administration';

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
  String get chatLeave => 'Lämna gruppen';

  @override
  String get chatLeaveBody =>
      'Leave this group? Someone will have to add you back to rejoin.';

  @override
  String get chatCreate => 'Skapa grupp';

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
    return 'Ditt bibliotek \"$libraryName\" är konfigurerat att spara omslagsbilder direkt i mediemapparna (\'Save artwork into media folders\' är aktiverat). Jellyfin har dock testat skrivåtkomsten och saknar behörighet att skriva filer till den här katalogen:\n\n$failedPath';
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
  String get groupByDecade => 'Årtionde';

  @override
  String get groupByParentalRating => 'Åldersgräns';

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
  String get personalRatingStars => '5 stjärnor';

  @override
  String get personalRatingNumeric => 'Numeric score out of 10';

  @override
  String get personalRatingIntervals => 'Rating Intervals';

  @override
  String get personalRatingIntervalWhole => 'Whole (1)';

  @override
  String get personalRatingIntervalHalf => 'Half (0.5)';

  @override
  String get personalRatingIntervalQuarter => 'Quarter (0.25)';

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
  String get personalRatingMine => 'Mitt betyg';

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
  String get filterExtras => 'Extramaterial';

  @override
  String get filterThemeSongs => 'Theme Songs';

  @override
  String get filterThemeVideos => 'Theme Videos';

  @override
  String get source => 'Källa';

  @override
  String get years => 'Årtal';

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
  String get seerrOriginalLanguage => 'Originalspråk';

  @override
  String get seerrRuntime => 'Speltid';

  @override
  String get subtitleHdrSeparate => 'Separate HDR Style';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'White is much brighter in HDR than in SDR, so a dimmer style here avoids the glare';

  @override
  String get subtitleBold => 'Bold Text';

  @override
  String get subtitleStrokeWidth => 'Text Stroke Width';

  @override
  String get subtitleFont => 'Font';

  @override
  String get subtitleFontDescription =>
      'Fonts are downloaded from Google Fonts the first time you pick them';

  @override
  String subtitleFontDownloadFailed(String font) {
    return 'Couldn\'t download $font';
  }

  @override
  String get subtitleShadow => 'Text Shadow';

  @override
  String get subtitleShadowIntensity => 'Shadow Intensity';

  @override
  String get subtitleShadowOffset => 'Shadow Offset';

  @override
  String get subtitleShadowBlur => 'Shadow Blur';

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
  String get setupStyleClassic => 'Klassisk';

  @override
  String get setupStyleModern => 'Modern';

  @override
  String get setupRowsClassicHint => 'Compact. More rows on screen at once.';

  @override
  String get setupRowsModernHint => 'Larger cards with titles underneath.';

  @override
  String get setupRowsCarouselHint =>
      'Posters with a large details panel underneath.';

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
  String get setupStyleMinimalist => 'Minimalistisk';

  @override
  String get setupDetailMinimalistHint =>
      'Artwork, one play button and the episodes.';

  @override
  String get setupStyleStage => 'Stage';

  @override
  String get setupDetailStageHint =>
      'The poster up front, with play under it and the details beside it.';

  @override
  String get setupStylePremiere => 'Premiär';

  @override
  String get setupDetailPremiereHint =>
      'The title centered over a full screen backdrop, with everything else down the page.';

  @override
  String get setupStyleQuickLook => 'Översikt';

  @override
  String get setupDetailQuickLookHint =>
      'A drawer over the screen you were on, with play and the basics, and the full page a press away.';

  @override
  String get setupStyleFrost => 'Frost';

  @override
  String get setupDetailFrostHint =>
      'The title in a glass window over its blurred art, with tabs under the buttons.';

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
  String get setupMoonbaseTitle => 'Add Moonbase to your server';

  @override
  String get setupMoonbaseHint =>
      'A free server plugin that unlocks more of Moonfin';

  @override
  String get setupMoonbaseIntro =>
      'Moonbase is free and runs on your server. With it, Moonfin gets:';

  @override
  String get setupMoonbaseAskAdmin =>
      'Only a server admin can install it. Send them this link.';

  @override
  String get setupMoonbaseManualSteps =>
      'It takes a few steps on your server to install. They\'re all at this link.';

  @override
  String get setupMoonbaseInstalling => 'Installing Moonbase...';

  @override
  String get setupMoonbaseInstalled =>
      'Moonbase is installed. It turns on when the server restarts, which stops anything playing right now.';

  @override
  String get setupMoonbaseRestarting =>
      'The server is restarting. Moonbase turns on once it\'s back.';

  @override
  String get moonbaseFeatureSync => 'Settings synced across your devices';

  @override
  String get moonbaseFeatureRatings => 'Extra ratings and TMDB reviews';

  @override
  String get moonbaseFeatureRows => 'Custom rows from your favorite lists';

  @override
  String get moonbaseFeatureGames => 'Retro games with synced saves';

  @override
  String get moonbaseFeatureCalendar => 'A calendar of what\'s coming up';

  @override
  String get moonbaseFeatureCollections => 'Your own order for each collection';

  @override
  String get moonbaseFeatureMessages => 'Messages from your server admin';

  @override
  String setupMoonbaseInstallFailed(String error) {
    return 'Moonbase couldn\'t be installed. $error';
  }

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
  String get bookFoldersAsSeries => 'Treat book folders as series';

  @override
  String get bookFoldersAsSeriesDescription =>
      'Treat folders containing books as series instead of relying on the individual books\' metadata';

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
  String get autoDownloadKeepAll => 'Alla';

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
  String get removeWatchedAsk => 'Ask me';

  @override
  String get deleteFinishedDownloadTitle => 'Delete this download?';

  @override
  String deleteFinishedDownloadMessage(String title) {
    return 'You finished $title. Delete its download to free up space, or keep it and stop asking.';
  }

  @override
  String get notNow => 'Not Now';

  @override
  String get keepDownloaded => 'Keep Downloaded';

  @override
  String get keepDownloadedSubtitle =>
      'Never remove this automatically after watching';

  @override
  String get autoDownloadDeleteNever => 'Aldrig';

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
  String get downloadNotificationRunning => 'Laddar ner';

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
  String get downloadNotificationFailedTitle => 'Nedladdningen misslyckades';

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
  String get animationSpeedSlow => 'Långsamt';

  @override
  String get animationSpeedMedium => 'Mellan';

  @override
  String get animationSpeedFast => 'Snabbt';

  @override
  String get animationSpeedOff => 'Av';

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
  String get bottomNavbarTabsAutomatic => 'Automatiskt';

  @override
  String get bottomNavbarTabsPinned => 'Pinned';

  @override
  String get bottomNavbarTabsAvailable => 'Tillgänglig';

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
  String get navYou => 'Du';

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
      'Player, quality, audio, subtitles, skipping, and watch parties';

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
  String get settingsWatchTogetherSection => 'Watch Parties';

  @override
  String get settingsAdvancedSection => 'Avancerat';

  @override
  String get settingsDecodingAndRenderingSection => 'Decoding & Rendering';

  @override
  String get settingsAudioStreamSection => 'Audio Stream';

  @override
  String get settingsAudioOutputSection => 'Audio Output';

  @override
  String get settingsPassthroughSettingsSection => 'Passthrough Settings';

  @override
  String get settingsSeerrHomePageRowsSection => 'Seerr Home Page Rows';

  @override
  String get settingsSavedCustomHomeRowsSection => 'Saved Custom Home Rows';

  @override
  String get settingsRewatchSection => 'Rewatch';

  @override
  String get favoritesSwitchViewSection => 'Switch View';

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
  String get playlistSortReleaseDate => 'Utgivningsdatum';

  @override
  String get playlistSortCriticRating => 'Kritikerbetyg';

  @override
  String get playlistSortRuntime => 'Speltid';

  @override
  String get playlistSortLastPlayed => 'Senast spelade';

  @override
  String get playlistSortPlayCount => 'Antal uppspelningar';

  @override
  String get playlistSortRandom => 'Slumpmässigt';

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
  String get librarySortPlaylistOrder => 'Spellistans ordning';

  @override
  String get librarySortDateAdded => 'Datum Tillagt';

  @override
  String get librarySortDateEpisodeAdded => 'Datum avsnitt lades till';

  @override
  String get librarySortParentalRating => 'Åldersgräns';

  @override
  String get librarySortMyRating => 'Mitt betyg';

  @override
  String get librarySortAlbumArtist => 'Album Artist';

  @override
  String get librarySortAlbum => 'Album';

  @override
  String get librarySortArtist => 'Konstnär';

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
  String get homeScreenBackdropFullScreen => 'Helskärm';

  @override
  String get homeScreenBackdropCorner => 'Corner';

  @override
  String get homeScreenBackdropTop => 'Top';

  @override
  String get detailsScreenBackdrop => 'Details Screen Backdrop';

  @override
  String get detailsBackdropSize => 'Backdrop Size';

  @override
  String get detailsBackdropFullScreen => 'Helskärm';

  @override
  String get detailsBackdropFit => 'Färdig';

  @override
  String get libraryBackdrops => 'Library Backdrops';

  @override
  String get playbackInfoChannel => 'Channel';

  @override
  String get playbackInfoProgram => 'Program';

  @override
  String get playbackInfoWhy => 'Why';

  @override
  String get playbackInfoServerCompatibilityCheck =>
      'Server compatibility check';

  @override
  String get playbackInfoBitrateUnavailable => 'Bitrate unavailable';

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
  String get playbackInfoNoteLiveRelay =>
      'The server is relaying the channel without converting it.';

  @override
  String playbackInfoFrameRateFrom(String rate, String source) {
    return '$rate fps ($source)';
  }

  @override
  String get playbackInfoRateSourceHeader => 'stream header';

  @override
  String get playbackInfoRateSourceMeasured => 'measured';

  @override
  String get playbackInfoRateSourceServer => 'server';

  @override
  String get playbackInfoServerFrameRate => 'Server Frame Rate';

  @override
  String get playbackInfoScan => 'Scan';

  @override
  String get playbackInfoProgressive => 'Progressive';

  @override
  String get playbackInfoInterlaced => 'Interlaced';

  @override
  String get playbackInfoRepeatedFields => 'Telecined (repeated fields)';

  @override
  String get playbackInfoHdmiOutput => 'HDMI Output';

  @override
  String playbackInfoDisplayMode(String width, String height, String rate) {
    return '$width×$height @ $rate Hz';
  }

  @override
  String get playbackInfoRateCorrections => 'Rate Corrections';

  @override
  String get playbackInfoAudioOutput => 'Output';

  @override
  String playbackInfoPassthroughOf(String codec) {
    return 'Passthrough ($codec)';
  }

  @override
  String playbackInfoDecodedTo(String channels) {
    return 'Decoded ($channels)';
  }

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
  String playbackInfoWhyVideoProfileUnknown(String codec) {
    return 'The server couldn\'t verify this stream\'s $codec profile.';
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
  String get playerTransportDocked => 'I docka';

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
  String get recordPromptNow => 'Nu';

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
  String get recordPromptTomorrow => 'I morgon';

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
  String get siloApproveSignInApprove => 'Godkänna';

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
    return 'För många försök. Försök igen om $wait.';
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
  String get siloPinRemember => 'Remember PIN on this device';

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
  String get rommUnlink => 'Ta bort länken';

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
  String get reviews => 'Omdömen';

  @override
  String get detailSectionReviews => 'Omdömen';

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
  String settingsPreviewAudioRowsOffInHomeRows(String group, String disabled) {
    return 'Albums, Artists and Audio Playlists are all turned off. To show one, go to Rows, open $group under $disabled, and turn it on.';
  }

  @override
  String settingsPreviewAudioRowsOffInHomeRowsSwitchOff(
    String setting,
    String group,
    String disabled,
  ) {
    return 'To see Albums, Artists or Audio Playlists on Home, first turn on $setting. Then go to Rows, open $group under $disabled, and turn one on.';
  }

  @override
  String settingsPreviewCollectionsOffInHomeRows(
    String group,
    String disabled,
  ) {
    return 'The Collections row is turned off. To show it, go to Rows, open $group under $disabled, and turn it on.';
  }

  @override
  String settingsPreviewCollectionsOffInHomeRowsSwitchOff(
    String setting,
    String group,
    String disabled,
  ) {
    return 'To see the Collections row on Home, first turn on $setting. Then go to Rows, open $group under $disabled, and turn it on.';
  }

  @override
  String get settingsPreviewRowsOffInKidsMode =>
      'Kids Mode keeps these rows off Home, so these settings don\'t change it.';

  @override
  String settingsPreviewNeedsRowInRows(String disabled) {
    return 'Turn on a row in Rows, under $disabled';
  }

  @override
  String settingsPreviewNeedsSwitchAndRow(String setting) {
    return 'Turn on $setting, then turn on a row in Rows';
  }

  @override
  String get settingsPreviewKeptOffByKidsMode =>
      'Kids Mode keeps this off Home';

  @override
  String get settingsPreviewAudioRowsEmpty =>
      'There\'s no music to show, so Home leaves these rows out.';

  @override
  String get settingsPreviewRowsEmpty =>
      'There\'s nothing to show in these rows, so Home leaves them out.';

  @override
  String get settingsPreviewCollectionsEmpty =>
      'There are no collections to show, so Home leaves this row out.';

  @override
  String get settingsPreviewShowEpisodesNote =>
      'This only changes rows for a single collection added in Rows. The Collections row looks the same.';

  @override
  String get settingsPreviewSaved => 'Sparat';

  @override
  String get smartSearch => 'Smart Search';

  @override
  String smartSearchOnSeerr(String seerr) {
    return 'Smart Search on $seerr';
  }

  @override
  String get calendar => 'Calendar';

  @override
  String get showCalendarButton => 'Show Calendar Button';

  @override
  String get showCalendarButtonSubtitle =>
      'Show the calendar of upcoming episodes and movies in the navigation bar';

  @override
  String get calendarFullCalendar => 'Full calendar';

  @override
  String get calendarUpcoming => 'Upcoming';

  @override
  String get calendarRecentlyAired => 'Recently aired';

  @override
  String get calendarRemindMe => 'Remind me';

  @override
  String get calendarReminderSet => 'Reminder set';

  @override
  String get calendarReminderFailed => 'Couldn\'t save the reminder';

  @override
  String get calendarReadyToWatch => 'Ready to watch';

  @override
  String get calendarComingUpThisWeek => 'Coming up this week';

  @override
  String get calendarNothingUpcoming => 'Nothing coming up';

  @override
  String get calendarNothingRecent => 'Nothing aired recently';

  @override
  String get calendarEmptyDay => 'Nothing on this day';

  @override
  String get calendarStartsIn => 'Starts in';

  @override
  String get calendarUnitDays => 'days';

  @override
  String get calendarUnitHours => 'hr';

  @override
  String get calendarUnitMinutes => 'min';

  @override
  String calendarDayAtTime(String day, String time) {
    return '$day at $time';
  }

  @override
  String get calendarAllDay => 'All day';

  @override
  String get calendarBadgeSeriesPremiere => 'Series premiere';

  @override
  String get calendarBadgeSeasonPremiere => 'New season';

  @override
  String get calendarBadgeSeasonFinale => 'Finale';

  @override
  String get calendarBadgeMidseasonFinale => 'Midseason finale';

  @override
  String get calendarBadgeSeriesFinale => 'Series finale';

  @override
  String get calendarBadgeNew => 'NEW';

  @override
  String get calendarStatusInLibrary => 'In library';

  @override
  String get calendarNotMonitored => 'Not monitored';

  @override
  String get calendarMovieDetails => 'Movie details';

  @override
  String get calendarProblemAdminsOnly =>
      'The calendar is limited to admins on this server.';

  @override
  String get calendarProblemNeedsSeerr =>
      'An admin needs to sign in to Seerr in Moonfin before the calendar can load.';

  @override
  String get calendarProblemNotConfigured =>
      'No Sonarr or Radarr server is linked yet.';

  @override
  String get calendarProblemFailed => 'Couldn\'t load the calendar.';

  @override
  String get calendarSettingsSubtitle =>
      'Style, filters and actions for the calendar';

  @override
  String get calendarSettingsView => 'Se';

  @override
  String get calendarSettingsStyle => 'Calendar style';

  @override
  String get calendarSettingsStyleDescription =>
      'What the Calendar button opens. The full month is one button away in both.';

  @override
  String get calendarSettingsStyleAgenda => 'Agenda';

  @override
  String get calendarSettingsStyleCountdown => 'Countdown';

  @override
  String get calendarSettingsWeekStart => 'Week starts on';

  @override
  String get calendarSettingsWhatShows => 'What shows';

  @override
  String get calendarSettingsScope => 'Visa';

  @override
  String get calendarSettingsScopeDescription =>
      'My shows keeps the series you favorited or started watching';

  @override
  String get calendarSettingsScopeEverything => 'Everything';

  @override
  String get calendarSettingsScopeMyShows => 'My shows';

  @override
  String get calendarSettingsUnmonitored => 'Include unmonitored';

  @override
  String get calendarSettingsUnmonitoredSubtitle =>
      'Also list episodes and movies Sonarr and Radarr aren\'t set to download';

  @override
  String get calendarSettingsSpecials => 'Specialerbjudanden';

  @override
  String get calendarSettingsSpecialsSubtitle =>
      'Season 0 episodes, like extras and holiday specials';

  @override
  String get calendarSettingsBadges => 'Premiere and finale tags';

  @override
  String get calendarSettingsBadgesSubtitle =>
      'Mark premieres, finales and new seasons';

  @override
  String get calendarSettingsColorBy => 'Color by';

  @override
  String get calendarSettingsColorByDescription =>
      'Type tells episodes from movies. Status shows what\'s in your library, coming up or missing.';

  @override
  String get calendarSettingsColorByType => 'Typ';

  @override
  String get calendarSettingsImageType => 'Card image';

  @override
  String get calendarSettingsImageTypeDescription =>
      'The artwork on the Countdown rows';

  @override
  String get calendarSettingsSpoilerSafe => 'Spoiler safe';

  @override
  String get calendarSettingsSpoilerSafeSubtitle =>
      'Hide episode titles and stills for shows you\'re behind on';

  @override
  String get calendarSettingsActions => 'Åtgärder';

  @override
  String get calendarSettingsSelectAction => 'Selecting an item';

  @override
  String get calendarSettingsSelectActionDescription =>
      'What OK or a tap does on something that\'s already in your library';

  @override
  String get calendarSettingsSelectDetails => 'Open details';

  @override
  String get calendarSettingsSelectPlay => 'Play when in library';

  @override
  String get calendarSettingsRequestButton => 'Request button';

  @override
  String get calendarSettingsRequestButtonSubtitle =>
      'Show the Seerr request button on missing movies and seasons';

  @override
  String get calendarSettingsReminders => 'Reminders';

  @override
  String get calendarSettingsRemindersSubtitle =>
      'Show Remind me, which sends a notification when a title lands in your library';

  @override
  String get calendarRowSeeAll => 'See All card';

  @override
  String get calendarRowSeeAllSubtitle =>
      'End the upcoming rows with a card that opens the calendar';

  @override
  String get showNextAirDate => 'Next air date at the end';

  @override
  String get showNextAirDateSubtitle =>
      'When the next episode isn\'t in your library yet, the end of episode card says when it airs';

  @override
  String get afterHoursTitle => 'After Hours';

  @override
  String get afterHoursUnlocked => 'After Hours unlocked';

  @override
  String afterHoursPressesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more presses',
      one: '1 more press',
    );
    return '$_temp0';
  }

  @override
  String afterHoursTapsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more taps',
      one: '1 more tap',
    );
    return '$_temp0';
  }

  @override
  String get afterHoursPlay => 'Spela upp';

  @override
  String get afterHoursLeaderboards => 'Leaderboards';

  @override
  String get afterHoursTop3 => 'Top 3';

  @override
  String afterHoursScoresFrom(String server) {
    return 'Scores from $server';
  }

  @override
  String get afterHoursScoresOnDevice => 'Scores on this device';

  @override
  String get afterHoursGameOver => 'Game over';

  @override
  String afterHoursNewRank(int rank) {
    return 'New #$rank on the board';
  }

  @override
  String get afterHoursPlayAgain => 'Play again';

  @override
  String get afterHoursBackToArcade => 'Back to the arcade';

  @override
  String get afterHoursArcade => 'Arcade';

  @override
  String get afterHoursLandscapeNote => 'Turns to landscape while you play';

  @override
  String get afterHoursTouch => 'Touch';

  @override
  String get afterHoursNewTag => 'NEW';

  @override
  String get afterHoursNoScores => 'No scores yet';

  @override
  String get afterHoursPerfect => 'PERFECT';

  @override
  String get afterHoursBoxSet => 'BOX SET';

  @override
  String get afterHoursBufferRun => 'Buffer Run';

  @override
  String get afterHoursBufferRunGenre => 'Endless runner with a gravity flip';

  @override
  String get afterHoursBufferRunPitch =>
      'The runner from the loading screen finally gets somewhere to go. Double jump and gravity flips it onto the ceiling.';

  @override
  String get afterHoursBufferRunRemote =>
      'OK jumps, again mid-air to flip sides. Down slides. On the ceiling Up and Down swap.';

  @override
  String get afterHoursBufferRunTouch =>
      'Tap to jump, and tap again in the air to flip. Swipe toward the side you\'re running on to slide.';

  @override
  String get afterHoursFastForward => 'Fast Forward';

  @override
  String get afterHoursFastForwardGenre => 'Three-lane runner';

  @override
  String get afterHoursFastForwardPitch =>
      'A sprint down three lobby aisles. Hop the low stuff, and remember the popcorn carts don\'t move for anyone.';

  @override
  String get afterHoursFastForwardRemote =>
      'Up and Down change lanes. OK jumps.';

  @override
  String get afterHoursFastForwardTouch =>
      'Swipe up or down to change lanes. Tap to jump.';

  @override
  String get afterHoursCableCrawl => 'Cable Crawl';

  @override
  String get afterHoursCableCrawlGenre => 'Grid crawler';

  @override
  String get afterHoursCableCrawlPitch =>
      'Steer an HDMI cable around the back of the TV cabinet and plug into signal. Every bar makes it longer.';

  @override
  String get afterHoursCableCrawlRemote =>
      'Arrows turn. The cable never stops.';

  @override
  String get afterHoursCableCrawlTouch => 'Swipe to turn.';

  @override
  String get afterHoursCaseStack => 'Case Stack';

  @override
  String get afterHoursCaseStackGenre => 'One-button stacker';

  @override
  String get afterHoursCaseStackPitch =>
      'Build a shelf-high tower of Blu-ray cases, each one a title from your own library. Whatever hangs over the edge gets trimmed off, so land them dead on.';

  @override
  String get afterHoursCaseStackRemote => 'OK drops the case.';

  @override
  String get afterHoursCaseStackTouch => 'Tap anywhere to drop.';

  @override
  String get afterHoursPixelPurge => 'Pixel Purge';

  @override
  String get afterHoursPixelPurgeGenre => 'Paddle breaker';

  @override
  String get afterHoursPixelPurgePitch =>
      'A bad encode left the picture full of blocky artifacts, and they creep down a little every second. Bounce the play button off the seek bar to clear them before they reach it.';

  @override
  String get afterHoursPixelPurgeRemote =>
      'Left and Right slide the scrubber. The ball launches on its own.';

  @override
  String get afterHoursPixelPurgeTouch => 'Drag to slide the scrubber.';

  @override
  String get afterHoursHowToPlay => 'How to play';

  @override
  String get afterHoursStart => 'Start';

  @override
  String get afterHoursBackToGame => 'Back to the game';

  @override
  String get afterHoursEnemies => 'Enemies';

  @override
  String get afterHoursObstacles => 'Obstacles';

  @override
  String get afterHoursPowerups => 'Powerups';

  @override
  String get afterHoursCastShieldLine => 'A shield that takes one hit.';

  @override
  String get afterHoursCastPointsLine => '25 points a piece.';

  @override
  String get afterHoursCastLagBat => 'Lag Bat';

  @override
  String get afterHoursCastLagBatLine =>
      'Swoops in at head height. Slide under it.';

  @override
  String get afterHoursCastGremlin => 'Static Gremlin';

  @override
  String get afterHoursCastGremlinLine =>
      'Hops along the floor or the ceiling toward you. Jump it.';

  @override
  String get afterHoursCastCable => 'Cable Coil';

  @override
  String get afterHoursCastCableLine =>
      'Low on the floor or the ceiling. Jump it.';

  @override
  String get afterHoursCastBanner => 'Buffering Banner';

  @override
  String get afterHoursCastBannerLine =>
      'Slide under the sign. Its pole is a wall on the other side.';

  @override
  String get afterHoursCastSkipIntro => 'Skip Intro';

  @override
  String get afterHoursCastSkipIntroLine =>
      'Three seconds of dash that smashes anything.';

  @override
  String get afterHoursCastPopcorn => 'Popcorn';

  @override
  String get afterHoursCastRollingReel => 'Loose Reel';

  @override
  String get afterHoursCastRollingReelLine =>
      'Rolls down your lane faster than you run. Jump it.';

  @override
  String get afterHoursCastUsher => 'Usher';

  @override
  String get afterHoursCastUsherLine =>
      'Walks toward you and changes lanes once.';

  @override
  String get afterHoursCastVelvetRope => 'Velvet Rope';

  @override
  String get afterHoursCastVelvetRopeLine => 'Low. Jump it or change lanes.';

  @override
  String get afterHoursCastPopcornCart => 'Popcorn Cart';

  @override
  String get afterHoursCastPopcornCartLine => 'Too tall to jump. Change lanes.';

  @override
  String get afterHoursCastFrontRowPass => 'Front Row Pass';

  @override
  String get afterHoursCastMagnet => 'Magnet';

  @override
  String get afterHoursCastMagnetLine =>
      'Pulls in tickets from every lane for eight seconds.';

  @override
  String get afterHoursCastTicket => 'Ticket';

  @override
  String get afterHoursCastBug => 'Interference Bug';

  @override
  String get afterHoursCastBugLine => 'Wanders at random.';

  @override
  String get afterHoursCastTangle => 'Tangle';

  @override
  String get afterHoursCastTangleLine => 'Slowly chases your plug.';

  @override
  String get afterHoursCastStatic => 'Statisk';

  @override
  String get afterHoursCastStaticLine =>
      'A dead cell. One appears every third signal.';

  @override
  String get afterHoursCastBrick => 'Power Brick';

  @override
  String get afterHoursCastBrickLine => 'A 2 by 2 block every fifth signal.';

  @override
  String get afterHoursCastGhost => 'Ghost';

  @override
  String get afterHoursCastGhostLine =>
      'Five seconds of passing through everything but the edge.';

  @override
  String get afterHoursCastSnip => 'Snip';

  @override
  String get afterHoursCastSnipLine =>
      'Cuts the cable in half for bonus points.';

  @override
  String get afterHoursCastSignal => 'Signal';

  @override
  String get afterHoursCastSignalLine => 'Points, and two more segments.';

  @override
  String get afterHoursCastShelfCat => 'Shelf Cat';

  @override
  String get afterHoursCastShelfCatLine =>
      'Bats a case as it comes in, so that one slides faster.';

  @override
  String get afterHoursCastBluCase => 'Blu-ray Case';

  @override
  String get afterHoursCastBluCaseLine =>
      'A title from your library. The overhang gets trimmed off.';

  @override
  String get afterHoursCastSteelbook => 'Steelbook';

  @override
  String get afterHoursCastSteelbookLine =>
      'Every tenth case. Slides much faster.';

  @override
  String get afterHoursCastPerfect => 'Perfect Drop';

  @override
  String get afterHoursCastPerfectLine =>
      'Land it dead on and the stack grows a little wider.';

  @override
  String get afterHoursCastBoxSet => 'Box Set';

  @override
  String get afterHoursCastBoxSetLine =>
      'Three perfect drops in a row grow it a lot wider.';

  @override
  String get afterHoursCastDeadPixel => 'Dead Pixel';

  @override
  String get afterHoursCastDeadPixelLine =>
      'Falls from cleared blocks. Catching it shrinks the scrubber.';

  @override
  String get afterHoursCastMacroblock => 'Macroblock';

  @override
  String get afterHoursCastMacroblockLine => 'One hit clears it.';

  @override
  String get afterHoursCastKeyframe => 'Keyframe';

  @override
  String get afterHoursCastKeyframeLine =>
      'Takes three hits and drops a powerup.';

  @override
  String get afterHoursCastHdrLine =>
      'A scrubber twice as wide for eight seconds.';

  @override
  String get afterHoursCastBufferNet => 'Buffer';

  @override
  String get afterHoursCastBufferNetLine =>
      'A net under the scrubber that saves one miss.';

  @override
  String get afterHoursBufferRunCardTouch =>
      'Tap to jump, again mid-air to flip sides. Swipe toward your side to slide.';

  @override
  String get afterHoursPixelPurgeCardRemote =>
      'Left and Right slide the scrubber.';

  @override
  String get remoteMediaNotificationTitle => 'Remote playback notification';

  @override
  String get remoteMediaNotificationSubtitle =>
      'Show system media controls when watching on another device';

  @override
  String get remoteActivityWatching => 'Watching on Moonfin';

  @override
  String get remoteActivityListening => 'Listening on Moonfin';

  @override
  String get clickpadSeeking => 'Allow Clickpad Seeking';

  @override
  String get clickpadSeekingDescription =>
      'When Left, Right and touchpad swipes can seek. Otherwise the first one brings up the controls.';

  @override
  String get clickpadSeekingControlsVisible => 'When controls are showing';

  @override
  String get clickpadSeekingPausedOnly => 'Only while paused';

  @override
  String get topNavbarStyle => 'Top Bar Style';

  @override
  String get topNavbarStyleClassic => 'Klassisk';

  @override
  String get topNavbarStyleTabline => 'Tabline';

  @override
  String get topNavbarStyleAtlas => 'Atlas';

  @override
  String get topNavbarStyleClassicHint => 'The standard bar';

  @override
  String get topNavbarStyleTablineHint =>
      'Text tabs with an underline, no pill';

  @override
  String get topNavbarStyleAtlasHint =>
      'Tabs open a panel with shortcuts and artwork';

  @override
  String get sidebarStyle => 'Sidebar Style';

  @override
  String get sidebarStyleClassic => 'Klassisk';

  @override
  String get sidebarStyleReel => 'Reel';

  @override
  String get sidebarStyleMosaic => 'Mosaic';

  @override
  String get sidebarStyleClassicHint => 'The standard sidebar';

  @override
  String get sidebarStyleReelHint =>
      'A wheel that turns through the destinations';

  @override
  String get sidebarStyleMosaicHint => 'A panel of tiles with library artwork';

  @override
  String navContinueIn(String section) {
    return 'Continue in $section';
  }

  @override
  String navFeatured(String title) {
    return 'Featured: $title';
  }

  @override
  String get navOpenMenu => 'Open menu';

  @override
  String get navReelSwipeHint => 'Swipe to turn it, tap the middle to go';

  @override
  String siloSectionBecauseYouEnjoy(String genres) {
    return 'Because you enjoy $genres';
  }

  @override
  String get siloSectionBecauseYouWatched => 'Because You Watched';

  @override
  String siloSectionBecauseYouWatchedTitle(String title) {
    return 'Because You Watched $title';
  }

  @override
  String get siloSectionForYou => 'For You';

  @override
  String get siloSectionHiddenGems => 'Hidden Gems';

  @override
  String get siloSectionHighlyRatedInLibrary => 'Highly Rated in Your Library';

  @override
  String get siloSectionNextInYourSeries => 'Next in Your Series';

  @override
  String get siloSectionPickedFromYourHistory => 'Picked from your history';

  @override
  String get siloSectionPopularOnServer => 'Popular on This Server';

  @override
  String get siloSectionProfilesLikeYouEnjoyed => 'Profiles Like You Enjoyed';

  @override
  String get siloSectionRandomPicks => 'Random Picks';

  @override
  String get siloSectionRecentlyAddedAudiobooks => 'Recently Added Audiobooks';

  @override
  String get siloSectionRecentlyAddedEbooks => 'Recently Added Ebooks';

  @override
  String siloSectionRecentlyAddedIn(String library) {
    return 'Recently Added in $library';
  }

  @override
  String get siloSectionRecentlyAddedManga => 'Recently Added Manga';

  @override
  String get siloSectionRecentlyAddedMovies => 'Recently Added Movies';

  @override
  String get siloSectionRecentlyAddedTv => 'Recently Added TV';

  @override
  String get siloSectionRecentlyReleasedAudiobooks =>
      'Recently Released Audiobooks';

  @override
  String get siloSectionRecentlyReleasedEbooks => 'Recently Released Ebooks';

  @override
  String siloSectionRecentlyReleasedEpisodesIn(String library) {
    return 'Recently Released Episodes in $library';
  }

  @override
  String siloSectionRecentlyReleasedIn(String library) {
    return 'Recently Released in $library';
  }

  @override
  String get siloSectionRecentlyReleasedManga => 'Recently Released Manga';

  @override
  String get siloSectionRecentlyReleasedMovies => 'Recently Released Movies';

  @override
  String get siloSectionRecommendedForYou => 'Recommended for You';

  @override
  String get siloSectionReturningShows => 'Returning Shows';

  @override
  String get siloSectionSeasonalChristmasClassics => 'Christmas Classics';

  @override
  String get siloSectionSeasonalChristmasComedies => 'Christmas Comedies';

  @override
  String get siloSectionSeasonalChristmasFamily => 'Family Christmas';

  @override
  String get siloSectionSeasonalChristmasFavorites => 'Christmas Favorites';

  @override
  String get siloSectionSeasonalChristmasHallmark => 'Hallmark Christmas';

  @override
  String get siloSectionSeasonalChristmasRomcoms => 'Christmas Rom-Coms';

  @override
  String get siloSectionSeasonalEasterFaith => 'Easter Stories';

  @override
  String get siloSectionSeasonalEasterFamily => 'Easter Movies';

  @override
  String get siloSectionSeasonalFamilyMovieNightFavorites => 'Family Favorites';

  @override
  String get siloSectionSeasonalFamilyMovieNight => 'Family Movie Night';

  @override
  String get siloSectionSeasonalHalloweenAnimated => 'Animated Halloween';

  @override
  String get siloSectionSeasonalHalloweenFamily => 'Family Halloween';

  @override
  String get siloSectionSeasonalHalloweenFavorites => 'Halloween Favorites';

  @override
  String get siloSectionSeasonalHalloweenHorror => 'Halloween Horror';

  @override
  String get siloSectionSeasonalHalloweenTv => 'Halloween TV';

  @override
  String get siloSectionSeasonalNewYearFavorites => 'New Year\'s Movies';

  @override
  String get siloSectionSeasonalSaturdayMorningCartoons =>
      'Saturday Morning Cartoons';

  @override
  String get siloSectionSeasonalSaturdayMorningModern =>
      'Saturday Morning Favorites';

  @override
  String get siloSectionSeasonalSaturdayMorningNineties =>
      '90s Saturday Mornings';

  @override
  String get siloSectionSeasonalStPatricksIrishFilm => 'Irish Film';

  @override
  String get siloSectionSeasonalStPatricksIrishTv => 'Irish TV';

  @override
  String get siloSectionSeasonalSummerBlockbusters => 'Summer Blockbusters';

  @override
  String get siloSectionSeasonalSummerClassicSummer => 'Classic Summer Movies';

  @override
  String get siloSectionSeasonalSummerNostalgia => 'Summer Nostalgia';

  @override
  String get siloSectionSeasonalThanksgivingFavorites => 'Thanksgiving Movies';

  @override
  String get siloSectionSeasonalThanksgivingFeelGood => 'Feel-Good Favorites';

  @override
  String get siloSectionSeasonalValentinesFavorites => 'Valentine\'s Favorites';

  @override
  String get siloSectionSeasonalValentinesLoveStories => 'Classic Love Stories';

  @override
  String get siloSectionSeasonalValentinesRomanticDramas => 'Romantic Dramas';

  @override
  String get siloSectionSeasonalValentinesRomcoms => 'Valentine\'s Rom-Coms';

  @override
  String get siloSectionSeasonalPicks => 'Seasonal Picks';

  @override
  String siloSectionTopGenre(String genre) {
    return 'Top $genre';
  }

  @override
  String get siloSectionTopPicksToday => 'Top Picks Today';

  @override
  String get siloSectionTopRated => 'Top Rated';

  @override
  String get siloSectionTopRatedMovies => 'Top Rated Movies';

  @override
  String get siloSectionTopRatedTv => 'Top Rated TV';

  @override
  String get siloSectionTrendingOnServer => 'Trending on Server';

  @override
  String get siloSectionTrendingThisWeek => 'Trending This Week';
}
