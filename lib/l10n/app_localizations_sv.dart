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
  String get accountPreferences => 'KONTOINSTÄLLNINGAR';

  @override
  String get interfaceLanguage => 'Gränssnittsspråk';

  @override
  String get systemLanguageDefault => 'Systemstandard';

  @override
  String get signIn => 'Logga in';

  @override
  String get empty => 'Tom';

  @override
  String connectingToServer(String serverName) {
    return 'Ansluter till $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Losenord';

  @override
  String get username => 'Anvandarnamn';

  @override
  String get email => 'E-post';

  @override
  String get quickConnectInstruction =>
      'Ange den här koden på din servers webbinstrumentpanel:';

  @override
  String get waitingForAuthorization => 'Vantar pa auktorisering...';

  @override
  String get back => 'Tillbaka';

  @override
  String get serverUnavailable => 'Servern är inte tillgänglig';

  @override
  String get loginFailed => 'Inloggningen misslyckades';

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
  String get glassQuality => 'Glaskvalitet';

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
  String get settingsAppearanceThemeSubtitle =>
      'Växla mellan Moonfin och Neon Pulse utan att starta om appen';

  @override
  String get customThemeTitle => 'Anpassat tema';

  @override
  String get customThemeSubtitle =>
      'Anpassade teman ändrar visuella element i hela Moonfin. Välj ett av alternativen som passar din stil.';

  @override
  String get keyboardPreferSystemIme => 'Föredra systemtangentbord';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Använd enhetens inmatningsmetod som standard för textinmatning';

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
  String get exit => 'Utgång';

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
  String get gameEmulatorSettings => 'Emulatorinställningar';

  @override
  String get gameNoCoreOptions =>
      'Den här kärnan har inga justerbara alternativ.';

  @override
  String get gameHoldToOpenMenu => 'Håll in för att öppna menyn';

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
  String get pickDiscoverySubjects =>
      'Välj vilka ämnesflöden som ska visas i Discover.';

  @override
  String get apply => 'Tillämpa';

  @override
  String get openLink => 'Öppna länken';

  @override
  String get scanWithYourPhone => 'Skanna med din telefon';

  @override
  String get audiobookGenres => 'Ljudbok genrer';

  @override
  String get pickAudiobookGenres =>
      'Välj vilka genrer som ska visas i Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Upptäck ljudböcker';

  @override
  String get librivoxDescription => 'Populära publika titlar från LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titlar';
  }

  @override
  String get scrollLeft => 'Bläddra åt vänster';

  @override
  String get scrollRight => 'Bläddra åt höger';

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
  String get trendingTitlesOpenLibrary =>
      'Populära titlar efter ämne från Open Library.';

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
  String get noBooksFound => 'Inga böcker hittades för denna författare.';

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
  String channelsCount(int count) {
    return '$count kanaler';
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
  String get auto => 'Bil';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Bithastighetsöverstyrning';

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
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Video bithastighet';

  @override
  String get track => 'Spår';

  @override
  String get channels => 'Kanaler';

  @override
  String get audioBitrate => 'Ljudbithastighet';

  @override
  String get sampleRate => 'Samplingsfrekvens';

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
  String get guideTimeline => 'Guide Tidslinje';

  @override
  String failedToLoadGuide(String error) {
    return 'Kunde inte läsa in tablån: $error';
  }

  @override
  String get noChannelsFound => 'Inga kanaler hittades';

  @override
  String get liveBadge => 'BO';

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
  String get cancelRecordingAction => 'Avbryt inspelning';

  @override
  String get programSetToRecord => 'Programmet är inställt för inspelning';

  @override
  String get recordingCancelled => 'Inspelningen avbröts';

  @override
  String get unableToCreateRecording => 'Kunde inte skapa inspelning';

  @override
  String get watch => 'Titta';

  @override
  String get close => 'Stäng';

  @override
  String failedToPlayChannel(String name) {
    return 'Kunde inte spela upp $name';
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
  String get serverSyncAndPluginStatus =>
      'Serversynkronisering och pluginstatus';

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
  String get integrations => 'Integrationer';

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
  String get backgroundBackdrops => 'Bakgrund Bakgrunder';

  @override
  String get showBackdropImages => 'Visa bakgrundsbilder bakom innehåll';

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
  String get snow => 'Snö';

  @override
  String get fireworks => 'Fyrverkeri';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Fallande löv';

  @override
  String get themeMusic => 'Tema musik';

  @override
  String get playThemeMusicOnDetailPages => 'Spela temamusik på detaljsidor';

  @override
  String get themeMusicVolume => 'Tema musikvolym';

  @override
  String get themeMusicSettingsSubtitle => 'Detaljsidor, hemrader och volym';

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
  String get stretch => 'Sträcka';

  @override
  String get refreshRateSwitching => 'Byte av uppdateringsfrekvens';

  @override
  String get disabled => 'Inaktiverad';

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
  String get showDescriptionOnPause => 'Visa beskrivning på paus';

  @override
  String get dimVideoShowOverview =>
      'Dimma videon och visa översiktstext medan den är pausad';

  @override
  String get osdLockButton => 'OSD-låsknapp';

  @override
  String get osdLockButtonDescription =>
      'Visa en låsknapp som blockerar beröringsinmatning tills den trycks ner länge';

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
  String get transcodingAudio => 'Omkodning (ljud)';

  @override
  String get directStreamRemux => 'Direktström (remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Omkodning (bithastighet eller upplösning)';

  @override
  String get transcodingVideoAndAudio => 'Omkodning (video och ljud)';

  @override
  String get transcodingVideo => 'Omkodning (video)';

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
  String get enableTrueHdAudio =>
      'Aktivera TrueHD-ljud (fungerar kanske inte på alla plattformar)';

  @override
  String get settingsAudioOutputMode => 'Ljudutgångsläge';

  @override
  String get settingsAudioOutputModeDescription =>
      'Välj hur ljudet avkodas. AVR Passthrough skickar råa Dolby-/DTS-strömmar till din receiver; Auto eller Nedmixning avkodar lokalt.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Reservcodec för ljud';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Välj målformatet för omkodning av flerkanaligt ljud när källströmmen inte kan direktspelas eller skickas vidare.';

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
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Förlustfritt)';

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
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos)-passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core-passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA-passthrough';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD-passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos-passthrough';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Skicka Dolby Digital Plus (EAC3) som bitström till extern avkodare.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Skicka Dolby Atmos över EAC3 (JOC) som bitström till extern avkodare.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Skicka DTS-HD MA (inklusive DTS core) som bitström till extern avkodare.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Skicka Dolby TrueHD med Atmos-metadata som bitström till extern avkodare.';

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
  String get settingsAudioDiagnostics => 'Diagnostik';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Videonivå';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Videoomfång';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Undertextcodec';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs => 'Tillåtna ljudcodec';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS-ljudcodec';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs => 'HLS fMP4-ljudcodec';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Aktiv ljudväg';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'HD-ljudstöd för ljudvägen';

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
  String get defaultToNoSubtitles => 'Standard är Inga undertexter';

  @override
  String get turnOffSubtitlesByDefault => 'Stäng av undertexter som standard';

  @override
  String get subtitleSize => 'Undertextstorlek';

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
  String get customizationProfile => 'Anpassningsprofil';

  @override
  String get customizationProfileDescription =>
      'Välj profilen som ska läsas in, redigeras och synkroniseras. Global gäller överallt om inte en enhetsprofil åsidosätter den. Den gröna pricken markerar din nuvarande enhetsprofil.';

  @override
  String get loadProfile => 'Ladda profil';

  @override
  String get syncing => 'Synkroniseras...';

  @override
  String get syncToProfile => 'Synkronisera till profil';

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
  String get showLibrariesInToolbar => 'Visa bibliotek i verktygsfältet';

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
  String get enableFolderView => 'Aktivera mappvy';

  @override
  String get showFolderBrowsingOption => 'Visa mappsökningsalternativ';

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
  String get localPreviews => 'Lokala förhandsvisningar';

  @override
  String get localPreviewsDescription =>
      'Konfigurera förhandsvisningar av trailer, media och ljud.';

  @override
  String get mediaBarMode => 'Mediefaltsstil';

  @override
  String get mediaBarModeDescription =>
      'Välj mellan olika mediefältsstilar eller stäng av mediefältet';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Av';

  @override
  String get enableMediaBar => 'Aktivera Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Visa bildspel med utvalt innehåll hemma';

  @override
  String get contentType => 'Innehållstyp';

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
  String get latestMedia => 'Senaste media';

  @override
  String get recentlyReleased => 'Nyligen släppt';

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
  String get homeSections => 'Hemsektioner';

  @override
  String get resetToDefaults => 'Återställ till standardinställningar';

  @override
  String get homeRowPosterSize => 'Hemrad affischstorlek';

  @override
  String get perRowImageTypeSelection => 'Val av bildtyp per rad';

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
  String get fullScreenRows => 'Expanderade hemrader';

  @override
  String get fullScreenRowsDescription =>
      'Begränsa hemrader till 1 rad per skärm';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Bildtyp per rad';

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
  String get showClock => 'Visa klocka';

  @override
  String get displayClockDuringScreensaver =>
      'Visa klockan under skärmsläckare';

  @override
  String get clockModeStatic => 'Statisk';

  @override
  String get clockModeBouncing => 'Studsande';

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
  String get pluginLabel => 'Moonbase-plugin';

  @override
  String get pluginDetected => 'Plugin upptäckt';

  @override
  String get pluginNotDetected => 'Plugin inte upptäckt';

  @override
  String get pluginDetectedDescription =>
      'Serverplugin upptäcktes. Synkronisering aktiveras automatiskt första gången plugin-programmet hittas.';

  @override
  String get pluginNotDetectedDescription =>
      'Serverplugin identifieras för närvarande inte. Lokala inställningar använder fortfarande sina sparade värden eller inbyggda standardvärden.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Tillgängliga tjänster';

  @override
  String get serverPluginSync => 'Synkning av serverplugin';

  @override
  String get syncSettingsWithPlugin =>
      'Synkronisera inställningar med serverplugin';

  @override
  String get whatSyncControls => 'Vad synkronisering styr';

  @override
  String get syncControlsDescription =>
      'Synkronisering styr bara om plugin-stödda inställningar skjuts till och dras från servern. Profilval och profilsynkroniseringsåtgärder finns i anpassningsinställningarna när pluginsynkronisering är aktiverad.';

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
  String get seerrDiscoveryRows => 'Seerr-upptäcktsrader';

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
  String get reorderToggleHomeRows => 'Ändra ordning och växla hemrader';

  @override
  String get featuredContentAppearance => 'Utvalt innehåll, utseende';

  @override
  String get posterSizeImageTypeFolderView => 'Affischstorlek, bildtyp, mappvy';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB och betygskällor';

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
  String get request => 'Begäran';

  @override
  String get cancelRequest => 'Avbryt begäran';

  @override
  String get playInMoonfin => 'Spela i Moonfin';

  @override
  String requestedByName(String name) {
    return 'Efterfrågad av $name';
  }

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
  String get submitRequest => 'Skicka in förfrågan';

  @override
  String get allSeasons => 'Alla årstider';

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
  String adminRecentAlertEntries(int count) {
    return 'Senaste varnings-/felposter: $count';
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
  String get adminScanLibraries => 'Skanna bibliotek';

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
  String get direct => 'Direkt';

  @override
  String get adminDisconnect => 'Koppla från';

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
  String get adminLibraryOptionsSaved => 'Biblioteksalternativ har sparats';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Kunde inte spara alternativen: $error';
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
  String get adminSaveOptions => 'Spara alternativ';

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
  String get adminLibArchiveMediaFiles => 'Behandla arkiv som mediefiler';

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
  String get adminNoPathsAdded =>
      'Inga sökvägar har lagts till (kan läggas till senare)';

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
  String get adminNoProfileChanges => 'Inga profiländringar att spara';

  @override
  String get adminProfileSaved => 'Profilen har sparats';

  @override
  String adminSaveFailed(String error) {
    return 'Kunde inte spara: $error';
  }

  @override
  String get adminPermissionsSaved => 'Behörigheterna har sparats';

  @override
  String get adminPasswordsMismatch => 'Lösenord stämmer inte överens';

  @override
  String adminFailed(String error) {
    return 'Misslyckades: $error';
  }

  @override
  String get adminUserLoadFailed => 'Det gick inte att läsa in användaren';

  @override
  String get adminBackToUsers => 'Tillbaka till Användare';

  @override
  String get adminSaveProfile => 'Spara profil';

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
  String get adminAllowContentDeletion => 'Tillåt radering av innehåll';

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
  String get adminRemoteBitrateLimit => 'Fjärrklientbithastighetsgräns (bps)';

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
  String get adminSavePermissions => 'Spara behörigheter';

  @override
  String get adminEnableAllLibraryAccess =>
      'Aktivera åtkomst till alla bibliotek';

  @override
  String get adminSaveAccess => 'Spara åtkomst';

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
  String get adminDeviceAndChannelAccess => 'Enhets- och kanalåtkomst';

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
  String get adminEnabledDevices => 'Aktiverade enheter';

  @override
  String get adminEnabledChannels => 'Aktiverade kanaler';

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
  String get adminBackupInclude => 'Välj vad som ska ingå i säkerhetskopian.';

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
  String get adminTimeLimit => 'Tidsgräns (valfritt)';

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
  String get adminMissingAuthToken =>
      'Det gick inte att öppna inställningarna: autentiseringstoken saknas.';

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
  String get adminBrandingSaved => 'Varumärkesinställningar har sparats';

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
  String get adminStreamingSaved => 'Streaminginställningar sparade';

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
  String get adminPlaybackSaved => 'Uppspelningsinställningar sparade';

  @override
  String get adminPlaybackLoadFailed =>
      'Det gick inte att ladda uppspelningsinställningarna';

  @override
  String get adminPlaybackTranscoding => 'Uppspelning / omkodning';

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
  String get adminTrickplaySaved => 'Trickplay-inställningar sparade';

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
  String get adminResumeSaved => 'Återuppta inställningarna sparade';

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
  String get adminNetworkingSaved =>
      'Nätverksinställningar sparade. En omstart av servern kan krävas.';

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
  String get adminMetadataSaved => 'Metadata har sparats';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Kunde inte läsa in metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Kunde inte spara metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Uppdatera metadata';

  @override
  String get recursive => 'Rekursiv';

  @override
  String get adminReplaceAllMetadata => 'Ersätt all metadata';

  @override
  String get adminReplaceAllImages => 'Byt ut alla bilder';

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
  String get adminAddTuner => 'Lägg till tuner';

  @override
  String get adminEditTuner => 'Redigera tuner';

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
  String get adminEditProvider => 'Redigera leverantör';

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
  String get adminSdGetListings => 'Hämta tablåer';

  @override
  String get adminSdListings => 'Tablåer';

  @override
  String get adminEnableAllTuners => 'Aktivera alla tuners';

  @override
  String get adminTunerType => 'Tuner typ';

  @override
  String get adminTunerAdded => 'Tuner tillagd';

  @override
  String adminTunerAddFailed(String error) {
    return 'Kunde inte lägga till tunern: $error';
  }

  @override
  String get adminAddGuideProvider => 'Lägg till guideleverantör';

  @override
  String get adminProviderType => 'Typ av leverantör';

  @override
  String get adminProviderAdded => 'Leverantör har lagts till';

  @override
  String adminProviderAddFailed(String error) {
    return 'Kunde inte lägga till leverantören: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Kunde inte ta bort tunern: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tuneråterställning begärd';

  @override
  String adminTunerResetFailed(String error) {
    return 'Kunde inte återställa tunern: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Den här tunertypen stöder inte återställning.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Kunde inte ta bort leverantören: $error';
  }

  @override
  String get adminRecordingSettings => 'Inspelningsinställningar';

  @override
  String get adminPrePadding => 'Förutfyllnad (minuter)';

  @override
  String get adminPostPadding => 'Efterfyllning (minuter)';

  @override
  String get adminRecordingPath => 'Inspelningsväg';

  @override
  String get adminSeriesRecordingPath => 'Serieinspelningsväg';

  @override
  String get adminMovieRecordingPath => 'Sökväg för filminspelningar';

  @override
  String get adminGuideDays => 'Antal dagar med tablådata';

  @override
  String get adminGuideDaysAuto => 'Automatiskt';

  @override
  String adminGuideDaysValue(int days) {
    return '$days dagar';
  }

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
  String get adminLiveTvSectionTiming => 'Tidsinställning';

  @override
  String get adminLiveTvSectionPaths => 'Inspelningssökvägar';

  @override
  String get adminLiveTvSectionPostProcessing => 'Efterbehandling';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Tablådata: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Inspelningsinställningar sparade';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Kunde inte spara inställningarna: $error';
  }

  @override
  String get adminSetChannelMappings => 'Ställ in kanalmappningar';

  @override
  String get adminMappingJson => 'Kartläggning av JSON';

  @override
  String get adminMappingJsonHint => 'Exempel: mappar JSON nyttolast';

  @override
  String get adminChannelMappingsUpdated => 'Kanalmappningar har uppdaterats';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Kunde inte uppdatera mappningarna: $error';
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
  String get adminRefreshGuideData => 'Uppdatera tablådata';

  @override
  String get adminGuideRefreshStarted => 'Uppdatering av tablådata har startat';

  @override
  String get adminGuideRefreshUnavailable =>
      'Uppgiften för tablåuppdatering är inte tillgänglig på den här servern.';

  @override
  String get adminAddProvider => 'Lägg till leverantör';

  @override
  String get adminNoListingProviders =>
      'Inga listningsleverantörer har konfigurerats';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Inspelningssökväg: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Seriesökväg: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Marginal före: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Marginal efter: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Sök efter tuners';

  @override
  String get adminChannelMappings => 'Kanalmappningar';

  @override
  String get adminNoDiscoveredTuners => 'Inga upptäckta tuners ännu';

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
  String get adminRestoreRequested =>
      'Återställning begärd. Serverns omstart kan koppla bort den här sessionen.';

  @override
  String get adminBackupsTitle => 'Säkerhetskopieringar';

  @override
  String get adminUnknownDate => 'Okänt datum';

  @override
  String get adminUnnamedBackup => 'Namnlösa: Säkerhetskopiering';

  @override
  String get adminLiveTvNotAvailable =>
      'Direktsänd TV-administration är inte tillgänglig på denna serverbyggnad.';

  @override
  String get adminLiveTvTitle => 'Direktsänd TV-administration';

  @override
  String get adminApply => 'Tillämpa';

  @override
  String get adminNotSet => 'Inte inställt';

  @override
  String get adminReset => 'Återställ';

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
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Översikt';

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
  String get adminMetadataRecursive => 'Rekursiv';

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
  String get adminPluginsNoSearchResults => 'Inga plugins matchar din sökning';

  @override
  String get adminPluginsNoneInstalled => 'Inga plugins installerade';

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
  String get adminNetworkingRemoteAccess => 'Aktivera fjärråtkomst';

  @override
  String get adminNetworkingPorts => 'Hamnar';

  @override
  String get adminNetworkingHttpPort => 'HTTP-port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-port';

  @override
  String get adminNetworkingEnableHttps => 'Aktivera HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Lokalt nätverk';

  @override
  String get adminNetworkingLocalAddresses => 'Lokala nätverksadresser';

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
  String get adminPlaybackEnableHwDecoding => 'Aktivera hårdvaruavkodning för:';

  @override
  String get adminPlaybackQsvDevice => 'QSV-enhet';

  @override
  String get adminPlaybackEnhancedNvdec => 'Aktivera förbättrad NVDEC-avkodare';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Föredra systemets inbyggda hårdvaruavkodare';

  @override
  String get adminPlaybackColorDepth => 'Färgdjup vid hårdvaruavkodning';

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
  String get adminPlaybackPresetsQuality => 'Förinställningar och kvalitet';

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
  String get adminResumeMinAudiobookPct =>
      'Minsta procentsats för återuppta ljudbok';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maximal procentandel för återuppta ljudbok';

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
  String adminTaskTriggerInterval(String duration) {
    return 'Var $duration';
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
  String get adminTaskTriggerEvery6Hours => 'Var 6:e ​​timme';

  @override
  String get adminTaskTriggerEvery12Hours => 'Var 12:e timme';

  @override
  String get adminTaskTriggerEvery24Hours => 'Var 24:e timme';

  @override
  String get adminTaskTriggerEvery2Days => 'Varannan dag';

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
  String get adminTaskTriggerNoLimit => 'Ingen gräns';

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
  String get adminNetworkingHttps => 'HTTPS';

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
  String get adminNetworkingIpSettings => 'IP-inställningar';

  @override
  String get adminNetworkingEnableIpv4 => 'Aktivera IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Aktivera IPv6';

  @override
  String get adminNetworkingAutoDiscovery => 'Aktivera automatisk portmappning';

  @override
  String get adminNetworkingLocalSubnets => 'LAN-nätverk';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Komma- eller radseparerad lista med IP-adresser eller CIDR-subnät som räknas som lokalt nätverk.';

  @override
  String get adminNetworkingPublishedUris => 'Publicerade server-URI:er';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Mappa ett subnät eller en adress till en publicerad URL, t.ex. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Certifikatsökväg';

  @override
  String get adminNetworkingRemoteIpFilter => 'Fjärr IP-filter';

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
  String get adminDiscover => 'Upptäcka';

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
  String get offlineBannerAction => 'Nedladdningar';

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
  String get pinIncorrect => 'Felaktig PIN-kod';

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
  String get settingsAdministrationSubtitle =>
      'Öppna serveradministrationspanelen';

  @override
  String get settingsAccountSecurity => 'Konto & Säkerhet';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentisering, PIN-kod och föräldrakontroll';

  @override
  String get settingsPersonalization => 'Personalisering';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigering, hemrader och bibliotekssynlighet';

  @override
  String get settingsDynamicContent => 'Dynamiskt innehåll';

  @override
  String get settingsDynamicContentSubtitle =>
      'Media Bar och visuella överlägg';

  @override
  String get settingsPlaybackSyncplay => 'Uppspelning och SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Ljud-/videoinställningar, undertexter, nedladdningar och SyncPlay-kontroller';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plugin-synkronisering, Seerr, betyg och mer';

  @override
  String get settingsAboutSubtitle =>
      'Appversion, juridisk information och krediter';

  @override
  String get settingsAuthenticationSection => 'AUTENTICERING';

  @override
  String get settingsSortServersBy => 'Sortera servrar efter';

  @override
  String get settingsLastUsed => 'Senast använd';

  @override
  String get settingsAlphabetical => 'Alfabetisk';

  @override
  String get settingsConnectionSection => 'ANSLUTNING';

  @override
  String get settingsAllowSelfSignedCerts => 'Tillåt självsignerade certifikat';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Lita på servrar som använder självsignerade TLS-certifikat eller certifikat från en privat CA. Aktivera bara för servrar du själv styr. Det här inaktiverar certifikatvalidering för alla anslutningar.';

  @override
  String get settingsPrivacyAndSafetySection => 'SEKRETESS OCH SÄKERHET';

  @override
  String get settingsBlockedRatings => 'Blockerade betyg';

  @override
  String get settingsGeneralStyle => 'Allmän stil';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Temaaccenter, bakgrunder, bevakade indikatorer och temamusik';

  @override
  String get settingsDetailsScreen => 'Detaljsida';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Stil, bakgrundsoskärpa och flikbeteende';

  @override
  String get settingsHomePage => 'Hemsida';

  @override
  String get settingsHomePageSubtitle =>
      'Sektioner, bildtyper, överlägg och mediaförhandsvisningar';

  @override
  String get settingsLibrariesSubtitle =>
      'Bibliotekets synlighet, mappvy och beteende på flera servrar';

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
  String get settingsMetadataAndRatings => 'Metadata och betyg';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase driver integrationer på serversidan inklusive ytterligare klassificeringskällor, Seerr-förfrågningar och synkroniserade inställningar.';

  @override
  String get settingsOfflineDownloads => 'Offlinenedladdningar';

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
  String get settingsPoweredByFlutter => 'Drivs av Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# licensmeddelanden',
      one: '# licensmeddelande',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Både';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Blanda filter för innehållstyp';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Videouppspelningsinställningar';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Kärnvideomotor och inställningar för streamingkvalitet';

  @override
  String get settingsAudioPreferences => 'Ljudinställningar';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Alternativ för ljudspår, bearbetning och passthrough';

  @override
  String get settingsAutomationAndQueue => 'Automation & kö';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatiserad uppspelning och sekvensering';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Nedladdningskvalitet, lagringsgränser och köstorlek';

  @override
  String get settingsSyncplaySubtitle =>
      'Synkroniseringslogik för gruppsessioner';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Specialiserade spelarfunktioner. Använd med försiktighet, eftersom vissa alternativ kan orsaka uppspelningsproblem';

  @override
  String get settingsSkipIntrosAndOutros => 'Hoppa över Intros och Outros?';

  @override
  String get settingsMediaSegmentCountdown => 'Nedräkning för mediesegment';

  @override
  String get settingsProgressBar => 'Förloppsindikator';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'Ingen';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (äldre)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (äldre)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (rekommenderas)';

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
  String get hideBackdropsInLibraries =>
      'Dölj bakgrundsbilder när du bläddrar?';

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
  String get homeRowDisplay => 'Visning av hemrader';

  @override
  String get homeRowSections => 'Sektioner för hemrader';

  @override
  String get homeRowToggles => 'Reglage för hemrader';

  @override
  String get homeRowTogglesSubtitle =>
      'Aktivera eller inaktivera bibliotekbaserade kategorier på hemraderna';

  @override
  String get homeRowTogglesDescription =>
      'Aktivera reglagen nedan för att visa raderna i hemsektionerna.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klassisk behåller bildtyp per rad och infoöverlägg. Modern använder rader som går från stående format till bakgrundsbild.';

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
  String get displayGenresRows => 'Visa genrerader';

  @override
  String get displayGenresRowsSubtitle => 'Visa genrerader i hemsektionerna.';

  @override
  String get genresRowSorting => 'Sortering av genrerader';

  @override
  String get genresRowSortingDescription =>
      'Sortera genrerader efter tillagt datum, releasedatum, alfabetiskt och mer.';

  @override
  String get genresRowItems => 'Objekt på genrerader';

  @override
  String get genresRowItemsDescription =>
      'Visa filmer, serier eller båda på genrerader.';

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
  String get displayAudioRows => 'Visa ljudrader';

  @override
  String get displayAudioRowsSubtitle => 'Visa ljudrader i hemsektionerna.';

  @override
  String get audioRowsSorting => 'Sortering av ljudrader';

  @override
  String get audioRowsSortingDescription =>
      'Sortera ljudrader efter tillagt datum, releasedatum, alfabetiskt och mer.';

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
  String get audioTranscodeTarget => 'Målformat för ljudomkodning';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Stöds på den här enheten';

  @override
  String get notSupportedOnThisDevice => 'Stöds inte på den här enheten';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD)-passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Skicka DTS:X (DTS UHD) som bitström till extern avkodare.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD med Atmos (JOC)-passthrough';

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
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Öppna videouppspelning i din valda externa app på Android TV.';

  @override
  String get automaticQueuing => 'Automatisk kö';

  @override
  String get preferSdhSubtitles => 'Föredra SDH-undertexter';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritera SDH-/CC-undertextspår vid automatiskt val.';

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
  String get watchWithGroup => 'Titta med grupp';

  @override
  String get errors => 'Fel';

  @override
  String get warnings => 'Varningar';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Öppna i webbläsaren';

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
  String get passwordSet => 'Lösenord angett';

  @override
  String get noPasswordConfigured => 'Inget lösenord konfigurerat';

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
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Uppspelning';

  @override
  String get adminDrawerSectionDevices => 'Enheter';

  @override
  String get adminDrawerSectionAdvanced => 'Avancerat';

  @override
  String get adminDrawerSectionPlugins => 'Plugins';

  @override
  String get adminDrawerSectionLiveTv => 'Live-TV';

  @override
  String get homeVideos => 'Hemvideor';

  @override
  String get mixedContent => 'Blandat innehåll';

  @override
  String get homeVideosAndPhotos => 'Hemvideor och foton';

  @override
  String get mixedMoviesAndShows => 'Blandade filmer och serier';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

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
  String get closeGenrePanel => 'Stäng genrepanelen';

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
  String get transcodingLimits => 'Omkodningsgränser';

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
  String get audiobookWholeBook => 'Hela boken';

  @override
  String get audiobookFocusedTimeline => 'Fokuserad tidslinje';

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
  String get subtitlePreferences => 'Undertextinställningar';

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
  String get externalLists => 'Externa listor';

  @override
  String get replay => 'Spela upp igen';

  @override
  String get fileInformation => 'Filinformation';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Storlek: $size  •  Format: $format';
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
  String get sortAlphabetical => 'Alfabetisk';

  @override
  String get sortReleaseAscending => 'Releaseordning (stigande)';

  @override
  String get sortReleaseDescending => 'Releaseordning (fallande)';

  @override
  String get sortCustomDragDrop => 'Anpassad (dra och släpp)';

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
}
