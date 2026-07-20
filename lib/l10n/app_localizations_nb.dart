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
  String get accountPreferences => 'KONTOINNSTILLINGER';

  @override
  String get interfaceLanguage => 'Grensesnittspråk';

  @override
  String get systemLanguageDefault => 'Systemstandard';

  @override
  String get signIn => 'Logg på';

  @override
  String get empty => 'Tom';

  @override
  String connectingToServer(String serverName) {
    return 'Kobler til $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get waitingForAuthorization => 'Venter på autorisasjon...';

  @override
  String get back => 'Tilbake';

  @override
  String get serverUnavailable => 'Serveren er utilgjengelig';

  @override
  String get loginFailed => 'Innlogging mislyktes';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect er utilgjengelig: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect er utilgjengelig ($status): $detail';
  }

  @override
  String get whosWatching => 'Hvem ser på?';

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
  String get glassQuality => 'Glasskvalitet';

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
  String get settingsAppearanceThemeSubtitle =>
      'Bytt mellom Moonfin og Neon Pulse uten å starte appen på nytt';

  @override
  String get customThemeTitle => 'Egendefinert tema';

  @override
  String get customThemeSubtitle =>
      'Egendefinerte temaer endrer visuelle elementer i hele Moonfin. Velg et av disse alternativene som passer din stil.';

  @override
  String get keyboardPreferSystemIme => 'Foretrekk systemtastatur';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Bruk enhetens inndatametode som standard for tekstinnskriving';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Nåværende Moonfin-utseende du alle har blitt glad i';

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
  String get gameEmulatorSettings => 'Emulatorinnstillinger';

  @override
  String get gameNoCoreOptions =>
      'Denne kjernen har ingen justerbare alternativer.';

  @override
  String get gameHoldToOpenMenu => 'Hold inne for å åpne menyen';

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
  String get pickDiscoverySubjects =>
      'Velg hvilke emnestrømmer som skal vises i Discover.';

  @override
  String get apply => 'Bruk';

  @override
  String get openLink => 'Åpne Link';

  @override
  String get scanWithYourPhone => 'Skann med telefonen';

  @override
  String get audiobookGenres => 'Lydbok sjangere';

  @override
  String get pickAudiobookGenres =>
      'Velg hvilke sjangre som skal vises i Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Oppdag lydbøker';

  @override
  String get librivoxDescription =>
      'Populære public domain-titler fra LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titler';
  }

  @override
  String get scrollLeft => 'Rull til venstre';

  @override
  String get scrollRight => 'Rull til høyre';

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
  String get trendingTitlesOpenLibrary =>
      'Populære titler etter emne fra Open Library.';

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
  String get noBooksFound => 'Fant ingen bøker for denne forfatteren.';

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
    return 'Deletion operation failed with the following error: $error';
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
  String channelsCount(int count) {
    return '${count}ch';
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
  String get bitrateOverride => 'Bitrate-overstyring';

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
  String get codec => 'Kodek';

  @override
  String get videoBitrate => 'Video bitrate';

  @override
  String get track => 'Spor';

  @override
  String get channels => 'Kanaler';

  @override
  String get audioBitrate => 'Lydbithastighet';

  @override
  String get sampleRate => 'Samplingsfrekvens';

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
  String get guideTimeline => 'Guide Tidslinje';

  @override
  String failedToLoadGuide(String error) {
    return 'Kunne ikke laste inn guiden: $error';
  }

  @override
  String get noChannelsFound => 'Ingen kanaler funnet';

  @override
  String get liveBadge => 'BO';

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
  String get cancelRecordingAction => 'Avbryt opptak';

  @override
  String get programSetToRecord => 'Programmet er satt opp for opptak';

  @override
  String get recordingCancelled => 'Opptaket er avbrutt';

  @override
  String get unableToCreateRecording => 'Kan ikke opprette opptak';

  @override
  String get watch => 'Se på';

  @override
  String get close => 'Lukk';

  @override
  String failedToPlayChannel(String name) {
    return 'Kunne ikke spille av $name';
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
  String get serverSyncAndPluginStatus =>
      'Serversynkronisering og plugin-status';

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
  String get integrations => 'Integrasjoner';

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
  String get backgroundBackdrops => 'Bakgrunn Bakgrunner';

  @override
  String get showBackdropImages => 'Vis bakteppebilder bak innhold';

  @override
  String get seriesThumbnails => 'Serieminiatyrbilder';

  @override
  String get seriesThumbnailsDescription =>
      'Bare episoder: bruk seriegrafikk som samsvarer med hver radbildetype';

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
  String get snow => 'Snø';

  @override
  String get fireworks => 'Fyrverkeri';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Fallende blader';

  @override
  String get themeMusic => 'Temamusikk';

  @override
  String get playThemeMusicOnDetailPages =>
      'Spill av temamusikk på detaljsidene';

  @override
  String get themeMusicVolume => 'Temamusikkvolum';

  @override
  String get themeMusicSettingsSubtitle => 'Detaljsider, hjem-rader og volum';

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
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String get detailsBackgroundOpacitySubtitle =>
      'Adjust amount of opacity on modern detail pages from light to dark.';

  @override
  String get opacityLightest => 'Lightest';

  @override
  String get opacityLight => 'Light';

  @override
  String get opacityMedium => 'Medium';

  @override
  String get opacityDark => 'Dark';

  @override
  String get opacityDarkest => 'Darkest';

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
  String get stretch => 'Strekke';

  @override
  String get refreshRateSwitching => 'Bytte av oppdateringsfrekvens';

  @override
  String get disabled => 'Deaktivert';

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
  String get showDescriptionOnPause => 'Vis beskrivelse på pause';

  @override
  String get dimVideoShowOverview =>
      'Demp video og vis oversiktstekst mens den er satt på pause';

  @override
  String get osdLockButton => 'OSD-låseknapp';

  @override
  String get osdLockButtonDescription =>
      'Vis en låseknapp som blokkerer berøringsinndata inntil den trykkes lenge';

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
  String get transcodingAudio => 'Omkoding (lyd)';

  @override
  String get directStreamRemux => 'Direktestrøm (remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Omkoding (bitrate eller oppløsning)';

  @override
  String get transcodingVideoAndAudio => 'Omkoding (video og lyd)';

  @override
  String get transcodingVideo => 'Omkoding (video)';

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
  String get enableTrueHdAudio =>
      'Aktiver TrueHD-lyd (fungerer kanskje ikke på alle plattformer)';

  @override
  String get settingsAudioOutputMode => 'Lydutgangsmodus';

  @override
  String get settingsAudioOutputModeDescription =>
      'Velg hvordan lyd dekodes. AVR Passthrough sender rå Dolby-/DTS-strømmer til receiveren, mens Auto eller Nedmiks dekoder lokalt.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Reservekodek for lyd';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Velg målformatet for omkoding av flerkanalslyd når kildestrømmen ikke kan spilles direkte eller sendes gjennom.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Oppdag automatisk\n(anbefalt)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(standard)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(tapsfri)';

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
      'Send Dolby Digital Plus (EAC3) som bitstrøm til ekstern dekoder.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Send Dolby Atmos over EAC3 (JOC) som bitstrøm til ekstern dekoder.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Send DTS-HD MA (inkludert DTS Core) som bitstrøm til ekstern dekoder.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Send Dolby TrueHD med Atmos-metadata som bitstrøm til ekstern dekoder.';

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
  String get settingsAudioDiagnostics => 'Diagnostikk';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Videonivå';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Videoområde';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Undertekstkodek';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Tillatte lydkodeker';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS-lydkodeker';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4-lydkodeker';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif-passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Aktiv lydrute';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'HD-lydstøtte for ruten';

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
  String get defaultToNoSubtitles => 'Standard til Ingen undertekster';

  @override
  String get turnOffSubtitlesByDefault => 'Slå av undertekster som standard';

  @override
  String get subtitleSize => 'Undertekststørrelse';

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
  String get customizationProfile => 'Tilpasningsprofil';

  @override
  String get customizationProfileDescription =>
      'Velg profilen som skal lastes inn, redigeres og synkroniseres. Global gjelder overalt med mindre en enhetsprofil overstyrer den. Den grønne prikken markerer din nåværende enhetsprofil.';

  @override
  String get loadProfile => 'Last inn profil';

  @override
  String get syncing => 'Synkroniserer...';

  @override
  String get syncToProfile => 'Synkroniser til profil';

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
  String get showLibrariesInToolbar => 'Vis biblioteker i verktøylinjen';

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
  String get enableFolderView => 'Aktiver mappevisning';

  @override
  String get showFolderBrowsingOption => 'Vis alternativ for mappelesing';

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
  String get showInLatestMedia => 'Vis i siste media';

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
  String get localPreviews => 'Lokale forhåndsvisninger';

  @override
  String get localPreviewsDescription =>
      'Konfigurer forhåndsvisninger av trailer, media og lyd.';

  @override
  String get mediaBarMode => 'Media Bar stil';

  @override
  String get mediaBarModeDescription =>
      'Velg mellom ulike mediefeltstiler, eller slå av mediefeltet';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Av';

  @override
  String get enableMediaBar => 'Aktiver Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Vis lysbildefremvisning av fremhevet innhold hjemme';

  @override
  String get contentType => 'Innholdstype';

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
  String get enablePreviewAudio =>
      'Aktiver lyd for forhåndsvisninger av trailer og episode';

  @override
  String get latestMedia => 'Siste media';

  @override
  String get recentlyReleased => 'Nylig utgitt';

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
  String get homeSections => 'Hjem Seksjoner';

  @override
  String get resetToDefaults => 'Tilbakestill til standard';

  @override
  String get homeRowPosterSize => 'Hjemmerads plakatstørrelse';

  @override
  String get perRowImageTypeSelection => 'Valg av bildetype per rad';

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
  String get fullScreenRows => 'Utvidede hjem-rader';

  @override
  String get fullScreenRowsDescription =>
      'Begrens hjem-rader til én rad per skjerm';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Bildetype per rad';

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
  String get showClock => 'Vis klokke';

  @override
  String get displayClockDuringScreensaver => 'Vis klokke under skjermsparer';

  @override
  String get clockModeStatic => 'Statisk';

  @override
  String get clockModeBouncing => 'Sprettende';

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
  String get pluginLabel => 'Moonbase-plugin';

  @override
  String get pluginDetected => 'Plugin oppdaget';

  @override
  String get pluginNotDetected => 'Plugin ikke oppdaget';

  @override
  String get pluginDetectedDescription =>
      'Serverplugin oppdaget. Synkronisering aktiveres automatisk første gang plugin-en blir funnet.';

  @override
  String get pluginNotDetectedDescription =>
      'Serverplugin er for øyeblikket ikke oppdaget. Lokale innstillinger bruker fortsatt de lagrede verdiene eller innebygde standardinnstillingene.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersjon: $version';
  }

  @override
  String get availableServices => 'Tilgjengelige tjenester';

  @override
  String get serverPluginSync => 'Synkronisering av servertillegg';

  @override
  String get syncSettingsWithPlugin =>
      'Synkroniser innstillinger med serverplugin';

  @override
  String get whatSyncControls => 'Hva synkronisering kontrollerer';

  @override
  String get syncControlsDescription =>
      'Synkronisering kontrollerer bare om plugin-støttede innstillinger skyves til og trekkes fra serveren. Profilvalg og profilsynkroniseringshandlinger er i tilpasningsinnstillingene når plugin-synkronisering er aktivert.';

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
  String get seerrDiscoveryRows => 'Seerr-oppdagelsesrader';

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
  String get reorderToggleHomeRows => 'Omorganiser og bytt hjem rader';

  @override
  String get featuredContentAppearance => 'Fremhevet innhold, utseende';

  @override
  String get posterSizeImageTypeFolderView =>
      'Plakatstørrelse, bildetype, mappevisning';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB og vurderingskilder';

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
  String get request => 'Forespørsel';

  @override
  String get cancelRequest => 'Avbryt forespørsel';

  @override
  String get playInMoonfin => 'Spill i Moonfin';

  @override
  String requestedByName(String name) {
    return 'Forespurt av $name';
  }

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
  String get submitRequest => 'Send inn forespørsel';

  @override
  String get allSeasons => 'Alle årstider';

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
  String get trickplay => 'Trickplay';

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
  String get adminDrawerTrickplay => 'Trickplay';

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
  String adminRecentAlertEntries(int count) {
    return 'Nylige advarsler/feil: $count';
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
  String get adminScanLibraries => 'Skann biblioteker';

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
  String get direct => 'Direkte';

  @override
  String get adminDisconnect => 'Frakople';

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
    return 'Vil du fjerne enheten «$name»? Brukeren må logge på igjen på denne enheten.';
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
  String get adminLibraryOptionsSaved => 'Bibliotekalternativer lagret';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Kunne ikke lagre alternativene: $error';
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
  String get adminSaveOptions => 'Lagre alternativer';

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
  String get adminLibArchiveMediaFiles => 'Behandle arkiver som mediefiler';

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
  String get adminNoPathsAdded =>
      'Ingen baner lagt til (kan legges til senere)';

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
  String get adminNoProfileChanges => 'Ingen profilendringer å lagre';

  @override
  String get adminProfileSaved => 'Profilen er lagret';

  @override
  String adminSaveFailed(String error) {
    return 'Kunne ikke lagre: $error';
  }

  @override
  String get adminPermissionsSaved => 'Tillatelser lagret';

  @override
  String get adminPasswordsMismatch => 'Passord stemmer ikke';

  @override
  String adminFailed(String error) {
    return 'Mislyktes: $error';
  }

  @override
  String get adminUserLoadFailed => 'Kunne ikke laste brukeren';

  @override
  String get adminBackToUsers => 'Tilbake til Brukere';

  @override
  String get adminSaveProfile => 'Lagre profil';

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
  String get adminAllowContentDeletion => 'Tillat sletting av innhold';

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
  String get adminRemoteBitrateLimit =>
      'Ekstern klientbithastighetsgrense (bps)';

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
  String get adminSavePermissions => 'Lagre tillatelser';

  @override
  String get adminEnableAllLibraryAccess =>
      'Aktiver tilgang til alle biblioteker';

  @override
  String get adminSaveAccess => 'Lagre tilgang';

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
  String get adminDeviceAndChannelAccess => 'Enhets- og kanaltilgang';

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
  String get adminEnabledDevices => 'Aktiverte enheter';

  @override
  String get adminEnabledChannels => 'Aktiverte kanaler';

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
  String get adminBackupInclude =>
      'Velg hva som skal inkluderes i sikkerhetskopien.';

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
  String get adminTimeLimit => 'Tidsbegrensning (valgfritt)';

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
  String get adminMissingAuthToken =>
      'Kan ikke åpne innstillingene: mangler auth token.';

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
  String get adminBrandingSaved =>
      'Innstillinger for merkevarebygging er lagret';

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
  String get adminStreamingSaved => 'Strømmeinnstillinger lagret';

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
  String get adminPlaybackSaved => 'Avspillingsinnstillinger lagret';

  @override
  String get adminPlaybackLoadFailed =>
      'Kunne ikke laste inn avspillingsinnstillinger';

  @override
  String get adminPlaybackTranscoding => 'Avspilling / omkoding';

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
  String get adminTrickplaySaved => 'Trickplay-innstillinger lagret';

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
  String get adminResumeSaved => 'Gjenoppta innstillinger lagret';

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
  String get adminNetworkingSaved =>
      'Nettverksinnstillinger lagret. En omstart av serveren kan være nødvendig.';

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
  String get adminMetadataSaved => 'Metadata er lagret';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Kunne ikke laste inn metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Kunne ikke lagre metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Oppdater metadata';

  @override
  String get recursive => 'Rekursivt';

  @override
  String get adminReplaceAllMetadata => 'Erstatt alle metadata';

  @override
  String get adminReplaceAllImages => 'Bytt ut alle bilder';

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
  String get adminAddTuner => 'Legg til tuner';

  @override
  String get adminEditTuner => 'Rediger tuner';

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
  String get adminEditProvider => 'Rediger leverandør';

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
  String get adminSdGetListings => 'Hent oppføringer';

  @override
  String get adminSdListings => 'Oppføringer';

  @override
  String get adminEnableAllTuners => 'Aktiver alle tunere';

  @override
  String get adminTunerType => 'Tunertype';

  @override
  String get adminTunerAdded => 'Tuner lagt til';

  @override
  String adminTunerAddFailed(String error) {
    return 'Kunne ikke legge til tuneren: $error';
  }

  @override
  String get adminAddGuideProvider => 'Legg til guideleverandør';

  @override
  String get adminProviderType => 'Leverandørtype';

  @override
  String get adminProviderAdded => 'Leverandør lagt til';

  @override
  String adminProviderAddFailed(String error) {
    return 'Kunne ikke legge til leverandøren: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Kunne ikke fjerne tuneren: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tuner tilbakestilling forespurt';

  @override
  String adminTunerResetFailed(String error) {
    return 'Kunne ikke tilbakestille tuneren: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Denne tunertypen støtter ikke tilbakestilling.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Kunne ikke fjerne leverandøren: $error';
  }

  @override
  String get adminRecordingSettings => 'Opptaksinnstillinger';

  @override
  String get adminPrePadding => 'Forfylling (minutter)';

  @override
  String get adminPostPadding => 'Etterfylling (minutter)';

  @override
  String get adminRecordingPath => 'Opptaksbane';

  @override
  String get adminSeriesRecordingPath => 'Serieopptaksbane';

  @override
  String get adminMovieRecordingPath => 'Bane for filmopptak';

  @override
  String get adminGuideDays => 'Antall dager med guidedata';

  @override
  String get adminGuideDaysAuto => 'Automatisk';

  @override
  String adminGuideDaysValue(int days) {
    return '$days dager';
  }

  @override
  String get adminRecordingPostProcessor => 'Bane til etterbehandlingsprogram';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumenter for etterbehandler';

  @override
  String get adminSaveRecordingNfo => 'Lagre NFO-metadata for opptak';

  @override
  String get adminSaveRecordingImages => 'Lagre bilder for opptak';

  @override
  String get adminLiveTvSectionTiming => 'Tidsstyring';

  @override
  String get adminLiveTvSectionPaths => 'Opptaksbaner';

  @override
  String get adminLiveTvSectionPostProcessing => 'Etterbehandling';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Guidedata: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Opptaksinnstillinger lagret';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Kunne ikke lagre innstillingene: $error';
  }

  @override
  String get adminSetChannelMappings => 'Angi kanaltilordninger';

  @override
  String get adminMappingJson => 'Kartlegging av JSON';

  @override
  String get adminMappingJsonHint => 'Eksempel: tilordninger JSON-nyttelast';

  @override
  String get adminChannelMappingsUpdated => 'Kanaltilordninger oppdatert';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Kunne ikke oppdatere tilordningene: $error';
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
  String get adminRefreshGuideData => 'Oppdater guidedata';

  @override
  String get adminGuideRefreshStarted => 'Oppdatering av guidedata er startet';

  @override
  String get adminGuideRefreshUnavailable =>
      'Oppgaven for oppdatering av guiden er ikke tilgjengelig på denne serveren.';

  @override
  String get adminAddProvider => 'Legg til leverandør';

  @override
  String get adminNoListingProviders =>
      'Ingen oppføringsleverandører er konfigurert';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Opptaksbane: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Seriebane: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Tid før start: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Tid etter slutt: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Tunersøk';

  @override
  String get adminChannelMappings => 'Kanalkartlegginger';

  @override
  String get adminNoDiscoveredTuners => 'Ingen oppdagede tunere ennå';

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
  String get adminRestoreRequested =>
      'Gjenoppretting forespurt. Omstart av server kan koble fra denne økten.';

  @override
  String get adminBackupsTitle => 'Sikkerhetskopier';

  @override
  String get adminUnknownDate => 'Ukjent dato';

  @override
  String get adminUnnamedBackup => 'Sikkerhetskopiering uten navn';

  @override
  String get adminLiveTvNotAvailable =>
      'Direkte TV-administrasjon er ikke tilgjengelig på denne serverbyggingen.';

  @override
  String get adminLiveTvTitle => 'Direkte TV-administrasjon';

  @override
  String get adminApply => 'Bruk';

  @override
  String get adminNotSet => 'Ikke satt';

  @override
  String get adminReset => 'Tilbakestill';

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
  String get adminMetadataFieldTagline => 'Slagord';

  @override
  String get adminMetadataFieldOverview => 'Oversikt';

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
  String get adminMetadataRecursive => 'Rekursivt';

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
  String get adminPluginsNoSearchResults =>
      'Ingen plugins samsvarer med søket ditt';

  @override
  String get adminPluginsNoneInstalled => 'Ingen plugins installert';

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
  String get adminNetworkingRemoteAccess => 'Aktiver ekstern tilgang';

  @override
  String get adminNetworkingPorts => 'Havner';

  @override
  String get adminNetworkingHttpPort => 'HTTP-port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-port';

  @override
  String get adminNetworkingEnableHttps => 'Aktiver HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Lokalt nettverk';

  @override
  String get adminNetworkingLocalAddresses => 'Lokale nettverksadresser';

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
  String get adminPlaybackEnableHwDecoding => 'Aktiver maskinvaredekoding for:';

  @override
  String get adminPlaybackQsvDevice => 'QSV-enhet';

  @override
  String get adminPlaybackEnhancedNvdec => 'Aktiver forbedret NVDEC-dekoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Foretrekk systemets egen maskinvaredekoder';

  @override
  String get adminPlaybackColorDepth => 'Fargedybde for maskinvaredekoding';

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
  String get adminPlaybackPresetsQuality => 'Forhåndsinnstillinger og kvalitet';

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
  String get adminResumeMinAudiobookPct =>
      'Minimumsprosent for gjenopptakelse av lydbok';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maksimal gjenopptakelsesprosent for lydbok';

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
  String adminTaskTriggerInterval(String duration) {
    return 'Hver $duration';
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
  String get adminTaskTriggerEvery6Hours => 'Hver 6. time';

  @override
  String get adminTaskTriggerEvery12Hours => 'Hver 12. time';

  @override
  String get adminTaskTriggerEvery24Hours => 'Hver 24. time';

  @override
  String get adminTaskTriggerEvery2Days => 'Hver 2. dag';

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
  String get adminTaskTriggerNoLimit => 'Ingen grense';

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
  String get adminNetworkingHttps => 'HTTPS';

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
  String get adminNetworkingIpSettings => 'IP-innstillinger';

  @override
  String get adminNetworkingEnableIpv4 => 'Aktiver IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Aktiver IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Aktiver automatisk porttilordning';

  @override
  String get adminNetworkingLocalSubnets => 'LAN-nettverk';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Komma- eller linjeseparert liste over IP-adresser eller CIDR-subnett som behandles som en del av det lokale nettverket.';

  @override
  String get adminNetworkingPublishedUris => 'Publiserte server-URI-er';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Tilordne et subnett eller en adresse til en publisert URL, f.eks. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Sertifikatbane';

  @override
  String get adminNetworkingRemoteIpFilter => 'Eksternt IP-filter';

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
  String get adminGeneralQuickConnect => 'Aktiver Quick Connect';

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
  String get adminDiscover => 'Oppdage';

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
  String get offlineBannerAction => 'Nedlastinger';

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
  String get pinIncorrect => 'Feil PIN-kode';

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
      'Quick Connect-forespørselen er autorisert.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect-koden er ugyldig eller utløpt.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect støttes ikke på denne serveren.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Kunne ikke autorisere Quick Connect-koden.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect er deaktivert på denne serveren.';

  @override
  String get quickConnectForbidden =>
      'Kontoen din kan ikke godkjenne denne Quick Connect-forespørselen.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect-koden ble ikke funnet. Prøv en ny kode.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect mislyktes: $message';
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
  String get settingsAdministrationSubtitle =>
      'Få tilgang til serveradministrasjonspanelet';

  @override
  String get settingsAccountSecurity => 'Konto og sikkerhet';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentisering, PIN-kode og foreldrekontroll';

  @override
  String get settingsPersonalization => 'Personalisering';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigasjon, startrader og biblioteksynlighet';

  @override
  String get settingsDynamicContent => 'Dynamisk innhold';

  @override
  String get settingsDynamicContentSubtitle => 'Media Bar og visuelle overlegg';

  @override
  String get settingsPlaybackSyncplay => 'Avspilling og SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Lyd/videoinnstillinger, undertekster, nedlastinger og SyncPlay-kontroller';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plugin-synkronisering, Seerr, vurderinger og mer';

  @override
  String get settingsAboutSubtitle =>
      'Appversjon, juridisk informasjon og kreditter';

  @override
  String get settingsAuthenticationSection => 'AUTENTISERING';

  @override
  String get settingsSortServersBy => 'Sorter servere etter';

  @override
  String get settingsLastUsed => 'Sist brukt';

  @override
  String get settingsAlphabetical => 'Alfabetisk';

  @override
  String get settingsConnectionSection => 'TILKOBLING';

  @override
  String get settingsAllowSelfSignedCerts => 'Tillat selvsignerte sertifikater';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Stol på servere som bruker selvsignerte TLS-sertifikater eller sertifikater fra en privat CA. Aktiver bare for servere du selv kontrollerer. Dette deaktiverer sertifikatvalidering for alle tilkoblinger.';

  @override
  String get settingsPrivacyAndSafetySection => 'PERSONVERN OG SIKKERHET';

  @override
  String get settingsBlockedRatings => 'Blokkerte vurderinger';

  @override
  String get settingsGeneralStyle => 'Generell stil';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Temaaksenter, bakgrunner, sett-indikatorer og temamusikk';

  @override
  String get settingsDetailsScreen => 'Detaljskjerm';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Stil, bakgrunnsuskarphet og fanevirkemåte';

  @override
  String get settingsHomePage => 'Hjemmeside';

  @override
  String get settingsHomePageSubtitle =>
      'Seksjoner, bildetyper, overlegg og medieforhåndsvisninger';

  @override
  String get settingsLibrariesSubtitle =>
      'Biblioteksynlighet, mappevisning og adferd på flere servere';

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
  String get settingsMetadataAndRatings => 'Metadata og vurderinger';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase driver integrasjoner på serversiden, inkludert ytterligere vurderingskilder, Seerr-forespørsler og synkroniserte preferanser.';

  @override
  String get settingsOfflineDownloads => 'Frakoblede nedlastinger';

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
  String get settingsPoweredByFlutter => 'Drevet av Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# lisensmerknader',
      one: '# lisensmerknad',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Både';

  @override
  String get settingsShuffleContentTypeFilter => 'Bland innholdstypefilter';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Innstillinger for videoavspilling';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Innstillinger for kjernevideomotor og streamingkvalitet';

  @override
  String get settingsAudioPreferences => 'Lydinnstillinger';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Alternativer for lydspor, prosessering og passthrough';

  @override
  String get settingsAutomationAndQueue => 'Automatisering og kø';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatisert avspilling og sekvensering';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Nedlastingskvalitet, lagringsgrenser og køstørrelse';

  @override
  String get settingsSyncplaySubtitle =>
      'Synkroniseringslogikk for gruppeøkter';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Spesialiserte spillerfunksjoner. Bruk med forsiktighet, siden noen alternativer kan forårsake avspillingsproblemer';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Vil du hoppe over introer og outroer?';

  @override
  String get settingsMediaSegmentCountdown => 'Nedtelling for mediesegment';

  @override
  String get settingsProgressBar => 'Fremdriftslinje';

  @override
  String get settingsTimer => 'Tidtaker';

  @override
  String get settingsNone => 'Ingen';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (eldre)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (eldre)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (anbefalt)';

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
    return 'Latest $libraryName';
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
  String get hideBackdropsInLibraries => 'Skjul bakgrunnsbilder mens du blar?';

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
  String get homeRowDisplay => 'Visning av hjem-rader';

  @override
  String get homeRowSections => 'Hjem-radseksjoner';

  @override
  String get homeRowToggles => 'Brytere for hjem-rader';

  @override
  String get homeRowTogglesSubtitle =>
      'Aktiver eller deaktiver bibliotekbaserte kategorier for hjem-rader';

  @override
  String get homeRowTogglesDescription =>
      'Aktiver bryterne nedenfor for å vise radene i Hjem-seksjonene.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klassisk beholder bildetype og infooverlegg per rad. Moderne bruker rader fra portrett til bakgrunnsbilde.';

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
  String get displayGenresRows => 'Vis sjangerrader';

  @override
  String get displayGenresRowsSubtitle => 'Vis sjangerrader i Hjem-seksjonene.';

  @override
  String get genresRowSorting => 'Sortering av sjangerrader';

  @override
  String get genresRowSortingDescription =>
      'Sorter sjangerrader etter lagt til-dato, utgivelsesdato, alfabetisk og mer.';

  @override
  String get genresRowItems => 'Elementer i sjangerrader';

  @override
  String get genresRowItemsDescription =>
      'Vis filmer, serier eller begge deler i sjangerrader.';

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
  String get displayAudioRows => 'Vis lydrader';

  @override
  String get displayAudioRowsSubtitle => 'Vis lydrader i Hjem-seksjonene.';

  @override
  String get audioRowsSorting => 'Sortering av lydrader';

  @override
  String get audioRowsSortingDescription =>
      'Sorter lydrader etter lagt til-dato, utgivelsesdato, alfabetisk og mer.';

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
  String get audioTranscodeTarget => 'Mål for lydomkoding';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Støttes på denne enheten';

  @override
  String get notSupportedOnThisDevice => 'Støttes ikke på denne enheten';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD)-passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Send DTS:X (DTS UHD) som bitstrøm til ekstern dekoder.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD med Atmos (JOC)-passthrough';

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
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Åpne videoavspilling i den valgte eksterne appen på Android TV.';

  @override
  String get automaticQueuing => 'Automatisk køing';

  @override
  String get preferSdhSubtitles => 'Foretrekk SDH-undertekster';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioriter SDH-/CC-undertekstspor ved automatisk valg.';

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
  String get watchWithGroup => 'Se med gruppe';

  @override
  String get errors => 'Feil';

  @override
  String get warnings => 'Advarsler';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Åpne i nettleser';

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
  String get passwordSet => 'Passord angitt';

  @override
  String get noPasswordConfigured => 'Ingen passord konfigurert';

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
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Avspilling';

  @override
  String get adminDrawerSectionDevices => 'Enheter';

  @override
  String get adminDrawerSectionAdvanced => 'Avansert';

  @override
  String get adminDrawerSectionPlugins => 'Tillegg';

  @override
  String get adminDrawerSectionLiveTv => 'Direktesendt TV';

  @override
  String get homeVideos => 'Hjemmevideoer';

  @override
  String get mixedContent => 'Blandet innhold';

  @override
  String get homeVideosAndPhotos => 'Hjemmevideoer og bilder';

  @override
  String get mixedMoviesAndShows => 'Blandede filmer og serier';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

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
  String get closeGenrePanel => 'Lukk sjangerpanelet';

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
  String get transcodingLimits => 'Omkodingsgrenser';

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
  String get audiobookWholeBook => 'Hele boken';

  @override
  String get audiobookFocusedTimeline => 'Fokusert tidslinje';

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
  String get subtitlePreferences => 'Undertekstinnstillinger';

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
    return 'Biblioteket «$libraryName» er konfigurert til å lagre bildemateriell direkte i mediemappene («Save artwork into media folders» er aktivert). Jellyfin har imidlertid testet skrivetilgangen og har ikke tillatelse til å skrive filer til denne katalogen:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Det ser ut til at Jellyfin ikke klarte å oppdatere bildematerialet. Biblioteket ditt er konfigurert til å lagre bildemateriell direkte i mediemappene («Save artwork into media folders» er aktivert). Denne feilen oppstår vanligvis når Jellyfin-serverprosessen ikke har tillatelse til å skrive filer til mediekatalogene dine.';

  @override
  String get externalLists => 'Eksterne lister';

  @override
  String get replay => 'Spill av på nytt';

  @override
  String get fileInformation => 'Filinformasjon';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Størrelse: $size  •  Format: $format';
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
  String get sortAlphabetical => 'Alfabetisk';

  @override
  String get sortReleaseAscending => 'Utgivelsesrekkefølge (stigende)';

  @override
  String get sortReleaseDescending => 'Utgivelsesrekkefølge (synkende)';

  @override
  String get sortCustomDragDrop => 'Egendefinert (dra og slipp)';

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
}
