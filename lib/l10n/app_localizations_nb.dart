// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Månefinne';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'Logg på';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
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
  String get waitingForAuthorization => 'Venter på autorisasjon...';

  @override
  String get back => 'Tilbake';

  @override
  String get serverUnavailable => 'Serveren er utilgjengelig';

  @override
  String get loginFailed => 'Innlogging mislyktes';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Hvem ser på?';

  @override
  String get addUser => 'Legg til bruker';

  @override
  String get selectServer => 'Velg Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Kansellere';

  @override
  String get remove => 'Fjerne';

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
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Moonfin is the classic layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Moonfin';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get interfaceStyle => '';

  @override
  String get interfaceStyleSubtitle => '';

  @override
  String get interfaceStyleAutomatic => '';

  @override
  String get interfaceStyleApple => '';

  @override
  String get interfaceStyleMaterial => '';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Bytt mellom Moonfin og Neon Pulse uten å starte appen på nytt';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Månefinne';

  @override
  String get themeMoonfinSubtitle =>
      'Nåværende Moonfin-utseende du alle har blitt glad i';

  @override
  String get themeNeonPulse => 'Neonpuls';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-styling med magenta glød, cyan tekst og sterkere kromkontrast';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Vil du avslutte Moonfin?';

  @override
  String get exitAppConfirmation => 'Er du sikker på at du vil avslutte?';

  @override
  String get exit => 'Gå';

  @override
  String get noHomeRowsLoaded => 'Ingen hjemmerader kunne lastes';

  @override
  String get noHomeRowsHint =>
      'Prøv å oppdatere eller redusere aktive hjemmeseksjoner.';

  @override
  String get retryHomeRows => 'Prøv Hjem-rader på nytt';

  @override
  String get guide => 'Guide';

  @override
  String get recordings => 'Opptak';

  @override
  String get schedule => 'Rute';

  @override
  String get series => 'Serie';

  @override
  String get noItemsFound => 'Ingen varer funnet';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Denne mappen er tom';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
  String get medium => 'Medium';

  @override
  String get large => 'Stor';

  @override
  String get extraLarge => 'Ekstra stor';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Visninger';

  @override
  String get albums => 'Album';

  @override
  String get albumArtists => 'Albumartister';

  @override
  String get artists => 'Kunstnere';

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
    return '${count}m ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String daysAgo(int count) {
    return '${count}d ago';
  }

  @override
  String get discoverySubjects => 'Oppdagelsesemner';

  @override
  String get pickDiscoverySubjects =>
      'Velg hvilke emnestrømmer som skal vises i Discover.';

  @override
  String get apply => 'Søke';

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
    return '$count titles';
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
  String get resume => 'Gjenoppta';

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
    return '$count authors';
  }

  @override
  String genresCount(int count) {
    return '$count genres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% completed';
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
    return '$count titles arranged for reading-first browsing.';
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
    return 'No $label found';
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
  String get watched => 'Så på';

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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Kunne ikke laste inn dette emnet akkurat nå.';

  @override
  String get audiobookDetails => 'Lydbokdetaljer';

  @override
  String authorsCountTitle(int count) {
    return '$count Authors';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiobooks',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Sporliste';

  @override
  String get itemListPlaceholder => 'Vareliste vil vises her';

  @override
  String get favoriteTracksPlaceholder => 'Favorittspor vises her';

  @override
  String get failedToLoad => 'Kunne ikke laste inn';

  @override
  String get delete => 'Slett';

  @override
  String get save => 'Spare';

  @override
  String get moreLikeThis => 'Mer som dette';

  @override
  String get castAndCrew => 'Cast & Crew';

  @override
  String get collection => 'Samling';

  @override
  String get episodes => 'Episoder';

  @override
  String get nextUp => 'Neste opp';

  @override
  String get seasons => 'Årstider';

  @override
  String get chapters => 'Kapitler';

  @override
  String get features => 'Funksjoner';

  @override
  String get movies => 'Filmer';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Utgivelsesdato ukjent';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seasons',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Ends at $time';
  }

  @override
  String get items => 'Items';

  @override
  String get extras => 'Extras';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
  }

  @override
  String get view => 'Utsikt';

  @override
  String get resumeReading => 'Fortsett lesing';

  @override
  String get read => 'Lese';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Spille';

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
  String get trailer => 'Tilhenger';

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
  String get renamePlaylist => 'Gi nytt navn til spilleliste';

  @override
  String get playlistName => 'Spillelistenavn';

  @override
  String get deleteDownloadedAlbum => 'Slett nedlastet album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
    return 'No $itemLabel loaded';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Downloading $title ($count items)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Are you sure you want to delete \"$name\" from the server? This action cannot be undone.';
  }

  @override
  String get itemDeleted => 'Element slettet';

  @override
  String get noPlayableTrailerFound => 'Fant ingen spillbar trailer.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Undertekst lastet ned. Det kan ta et øyeblikk å vises mens Jellyfin oppdaterer elementet.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Velg Versjon';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Slett nedlastede filer';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'FORRETTER';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count more';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episodes';
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
    return 'Chapter $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tracks',
      one: '1 track',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapters',
      one: '1 chapter',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Born $date';
  }

  @override
  String died(String date) {
    return 'Died $date';
  }

  @override
  String age(int age) {
    return 'Age $age';
  }

  @override
  String get showLess => 'Vis mindre';

  @override
  String get readMore => 'Les mer';

  @override
  String get shuffle => 'Bland';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
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
    return 'Remote subtitle $action requires the Jellyfin subtitle management permission for this user.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'This item could not be found on the server for remote subtitle $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Remote subtitle $action failed: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Remote subtitle $action failed (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Failed to $action remote subtitles.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'all downloaded episodes for \"$name\"';
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
    return '$label action failed: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Failed to set cast volume: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Controls';
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
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Køen er tom';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Fjernavspilling';

  @override
  String get castingToGoogleCast => 'Caster til Google Cast';

  @override
  String get castingViaAirPlay => 'Casting via AirPlay';

  @override
  String get castingViaDlna => 'Casting via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
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
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
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
  String get player => 'Spiller';

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
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Video bitrate';

  @override
  String get track => 'Spor';

  @override
  String get channels => 'Kanaler';

  @override
  String get audioBitrate => 'Lydbithastighet';

  @override
  String get sampleRate => 'Sample Rate';

  @override
  String get format => 'Format';

  @override
  String get external => 'Utvendig';

  @override
  String get embedded => 'Innebygd';

  @override
  String castSessionError(String protocol) {
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-gjengivelse i appen er ikke tilgjengelig på denne plattformen ennå.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Innebygd dokumentgjengivelse er utilgjengelig på denne plattformen.';

  @override
  String get couldNotOpenExternalViewer => 'Kunne ikke åpne ekstern viewer.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Failed to open in-app reader: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Bookmark already saved at $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Bookmark added: $label';
  }

  @override
  String get noBookmarksYet =>
      'Ingen bokmerker ennå.\nTrykk på bokmerkeikonet mens du leser for å lagre posisjonen din.';

  @override
  String get noTableOfContentsAvailable =>
      'Ingen innholdsfortegnelse tilgjengelig';

  @override
  String pageLabel(int number) {
    return 'Page $number';
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
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Ingen kanaler funnet';

  @override
  String get liveBadge => 'BO';

  @override
  String guideNextProgram(String time, String title) {
    return 'Next: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m left';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h left';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m left';
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
  String get record => 'Record';

  @override
  String get cancelRecordingAction => 'Cancel Recording';

  @override
  String get programSetToRecord => 'Program set to record';

  @override
  String get recordingCancelled => 'Recording cancelled';

  @override
  String get unableToCreateRecording => 'Unable to create recording';

  @override
  String get watch => 'Klokke';

  @override
  String get close => 'Lukke';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Ingen';

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
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'Kunne ikke avbryte serieopptak';

  @override
  String get searchThisLibrary => 'Søk i dette biblioteket...';

  @override
  String get searchEllipsis => 'Søk...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Spill album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Årstid';

  @override
  String get errorLoadingEpisodes => 'Feil ved innlasting av episoder';

  @override
  String get noDownloadedEpisodes => 'Ingen nedlastede episoder';

  @override
  String get deleteEpisode => 'Slett episode';

  @override
  String removeName(String name) {
    return 'Remove \"$name\"?';
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
    return 'Season $number';
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
    return 'Delete all downloaded episodes in $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Musikk og lydbøker';

  @override
  String get images => 'Bilder';

  @override
  String get database => 'Database';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Temamusikk på Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Spill når du surfer på startskjermen';

  @override
  String get detailsBackgroundBlur => 'Detaljer Bakgrunnsuskarphet';

  @override
  String pixelValue(int value) {
    return '${value}px';
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
  String get settingsScrollWheelAction => '';

  @override
  String get settingsScrollWheelActionDescription => '';

  @override
  String get scrollWheelActionOff => '';

  @override
  String get scrollWheelActionSeek => '';

  @override
  String get scrollWheelActionVolume => '';

  @override
  String get playerTooltipVolume => '';

  @override
  String get fit => 'Passe';

  @override
  String get autoCrop => 'Automatisk beskjæring';

  @override
  String get stretch => 'Strekke';

  @override
  String get refreshRateSwitching => 'Bytte av oppdateringsfrekvens';

  @override
  String get disabled => 'Funksjonshemmet';

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
  String get fallbackAudioLanguage => '';

  @override
  String get preferDefaultAudioTrack => '';

  @override
  String get preferDefaultAudioTrackDescription => '';

  @override
  String get preferAudioDescription => '';

  @override
  String get preferAudioDescriptionDescription => '';

  @override
  String get transcodingAudio => '';

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
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

  @override
  String get settingsAudioFallbackCodecDescription => '';

  @override
  String get settingsAudioFallbackCodecAuto => '';

  @override
  String get settingsAudioFallbackCodecAac => '';

  @override
  String get settingsAudioFallbackCodecAc3 => '';

  @override
  String get settingsAudioFallbackCodecEac3 => '';

  @override
  String get settingsAudioFallbackCodecTrueHd => '';

  @override
  String get settingsAudioFallbackCodecMp3 => '';

  @override
  String get settingsAudioFallbackCodecOpus => '';

  @override
  String get settingsAudioFallbackCodecFlac => '';

  @override
  String get settingsMaxAudioChannels => '';

  @override
  String get settingsMaxAudioChannelsDescription => '';

  @override
  String get settingsMaxAudioChannelsAuto => '';

  @override
  String get settingsMaxAudioChannelsMono => '';

  @override
  String get settingsMaxAudioChannelsStereo => '';

  @override
  String get settingsMaxAudioChannels3_0 => '';

  @override
  String get settingsMaxAudioChannels4_0 => '';

  @override
  String get settingsMaxAudioChannels5_0 => '';

  @override
  String get settingsMaxAudioChannels5_1 => '';

  @override
  String get settingsMaxAudioChannels6_1 => '';

  @override
  String get settingsMaxAudioChannels7_1 => '';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Advanced)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Enable only formats your AVR or HDMI sink supports.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 Passthrough';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) Passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA Passthrough';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos Passthrough';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) to external decoder.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos over EAC3 (JOC) to external decoder.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (includes DTS core) to external decoder.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD with Atmos metadata to external decoder.';

  @override
  String get settingsDetectedAudioCapabilities => 'Detected Audio Capabilities';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'No runtime capability snapshot available yet.';

  @override
  String get settingsAudioRouteLabel => 'Route';

  @override
  String get settingsAudioDecodeLabel => 'Decode';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD audio route';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Speaker';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostics';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Video Level';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Video Range';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Subtitle Codec';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Allowed Audio Codecs';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS Audio Codecs';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 Audio Codecs';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Active Audio Route';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Route HD Audio Support';

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
  String get nextUpAndQueuing => 'Next Up & Queuing';

  @override
  String get nextUpDisplay => 'Next Up Display';

  @override
  String get extended => 'Utvidet';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Neste Tidsavbrudd';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Mediakø';

  @override
  String get autoQueueNextEpisodes => 'Auto-kø neste episoder';

  @override
  String get stillWatchingPrompt => 'Ser fortsatt på prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
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
  String get pathToMpvConf => '/path/to/mpv.conf';

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
  String get subtitleMode => '';

  @override
  String get subtitleModeFlagged => '';

  @override
  String get subtitleModeAlways => '';

  @override
  String get subtitleModeForeign => '';

  @override
  String get subtitleModeForced => '';

  @override
  String get subtitleModeFlaggedDescription => '';

  @override
  String get subtitleModeAlwaysDescription => '';

  @override
  String get subtitleModeForeignDescription => '';

  @override
  String get subtitleModeForcedDescription => '';

  @override
  String get subtitleModeNoneDescription => '';

  @override
  String get fallbackSubtitleLanguage => '';

  @override
  String get subtitleStream => '';

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
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

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
    return 'Loaded $profile profile settings.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Failed to load $profile profile settings.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Synced local settings to $profile profile.';
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
  String get showSeerrButton => '';

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
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

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
    return '$count selected';
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
  String get mediaBarModeMoonfin => 'Månefinne';

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
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'Bildetype per rad';

  @override
  String get perRowSettings => 'Innstillinger per rad';

  @override
  String get autoLogin => 'Automatisk pålogging';

  @override
  String get lastUser => 'Siste bruker';

  @override
  String get currentUser => '';

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
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

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
  String get pluginLabel => 'Plugin';

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
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Tilgjengelige tjenester';

  @override
  String get serverPluginSync => 'Server Plugin Sync';

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
  String get studios => 'Studios';

  @override
  String get popularSeries => 'Populær serie';

  @override
  String get seriesGenres => 'Seriesjangre';

  @override
  String get upcomingSeries => 'Kommende serie';

  @override
  String get networks => 'Nettverk';

  @override
  String get seerrDiscoveryRows => '';

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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Oppdag rader';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Dra for å omorganisere. Aktiver eller deaktiver rader. Aktivert radrekkefølge synkroniseres med Moonfin-plugin.';

  @override
  String get discoverRowsDescription =>
      'Dra for å omorganisere. Aktiver eller deaktiver rader.';

  @override
  String get enabled => 'Aktivert';

  @override
  String get hidden => 'Skjult';

  @override
  String get aboutTitle => 'Om';

  @override
  String versionValue(String version) {
    return 'Version $version';
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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Oppdater varsler';

  @override
  String get showWhenUpdatesAvailable =>
      'Vis når oppdateringer er tilgjengelige';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get clear => 'Klar';

  @override
  String get browse => 'Bla gjennom';

  @override
  String get noResults => 'Ingen resultater';

  @override
  String get seerrAvailableStatus => 'Tilgjengelig';

  @override
  String get seerrRequestedStatus => 'Forespurt';

  @override
  String itemsCount(int count) {
    return '$count Items';
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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
    return 'Budget: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Revenue: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Request $type';
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
    return 'age $age';
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
  String get seasonsLabel => 'Årstider';

  @override
  String get episodesLabel => 'Episoder';

  @override
  String get access => 'Adgang';

  @override
  String get add => 'Legge til';

  @override
  String get address => 'Adresse';

  @override
  String get analytics => 'Analytics';

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
  String get edit => 'Redigere';

  @override
  String get encoding => 'Koding';

  @override
  String get error => 'Feil';

  @override
  String get forward => 'Framover';

  @override
  String get general => 'General';

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
  String get stop => 'Stoppe';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Tid';

  @override
  String get trickplay => 'Triksing';

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
  String get mute => 'Stum';

  @override
  String get branding => 'Merkevarebygging';

  @override
  String get adminDrawerDashboard => 'Dashbord';

  @override
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'Innstillinger';

  @override
  String get adminDrawerBranding => 'Merkevarebygging';

  @override
  String get adminDrawerUsers => 'Brukere';

  @override
  String get adminDrawerLibraries => 'Biblioteker';

  @override
  String get adminDrawerTranscoding => 'Omkoding';

  @override
  String get adminDrawerResume => 'Gjenoppta';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Triksing';

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
  String get adminDrawerPlugins => 'Plugins';

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
    return 'Plugin updates available: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins requiring restart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Failed scheduled tasks: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Recent warning/error entries: $count';
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
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get sessionForward => 'Framover';

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
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Fullføring';

  @override
  String get direct => 'Direkte';

  @override
  String get adminDisconnect => 'Frakople';

  @override
  String get adminClearDates => 'Klare datoer';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Slett enhet';

  @override
  String get adminDeviceDeleted => 'Enheten er slettet';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Gi nytt navn til biblioteket';

  @override
  String get adminNewName => 'Nytt navn';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Slett bibliotek';

  @override
  String adminLibraryDeleted(String name) {
    return 'Library \"$name\" deleted';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Failed to delete library: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Failed to add path: $error';
  }

  @override
  String get adminRemovePath => 'Fjern bane';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Bibliotekalternativer lagret';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'Biblioteknavn er obligatorisk';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
    return 'Disable $name? They will not be able to sign in.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Enable $name? They will be able to sign in again.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'User \"$name\" disabled';
  }

  @override
  String adminUserEnabled(String name) {
    return 'User \"$name\" enabled';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Failed to update user policy: $error';
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
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Tillatelser lagret';

  @override
  String get adminPasswordsMismatch => 'Passord stemmer ikke';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get adminResetPasswordWarning =>
      'Dette vil fjerne passordet. Brukeren vil kunne logge inn uten passord.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server returned HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'User \"$name\" deleted';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Failed to delete user: $error';
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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Nøkkeltoken mangler fra serversvar';

  @override
  String get adminRevokeApiKey => 'Tilbakekall API-nøkkel';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-nøkkel er opphevet';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Oppretter sikkerhetskopi...';

  @override
  String get adminBackupCreated => 'Sikkerhetskopien ble opprettet';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'Backup-bane mangler i serversvar';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Bekreft gjenoppretting';

  @override
  String get adminRestoringBackup => 'Gjenoppretter sikkerhetskopien ...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
    return 'Saved to $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Failed to save file: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Failed to load $fileName';
  }

  @override
  String get adminSearchInLog => 'Søk i logg';

  @override
  String get adminNoMatchingLines => 'Ingen samsvarende linjer';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Fant ingen planlagte oppgaver';

  @override
  String get adminNoTasksMatchFilter =>
      'Ingen oppgaver samsvarer med gjeldende filter';

  @override
  String adminTaskStartFailed(String error) {
    return 'Failed to start task: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Failed to stop task: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Failed to load task: $error';
  }

  @override
  String get adminRunNow => 'Kjør nå';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
  String get adminTriggerType => 'Trigger Type';

  @override
  String get adminTimeLimit => 'Tidsbegrensning (valgfritt)';

  @override
  String get adminNoLimit => 'Ingen grense';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'ukedag';

  @override
  String get adminSearchPlugins => 'Søk i plugins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Avinstaller plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Are you sure you want to uninstall \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Failed to uninstall plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Failed to install package: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Failed to install update: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Failed to load plugins: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Ingen plugins samsvarer med søket ditt';

  @override
  String get adminNoPluginsInstalled => 'Ingen plugins installert';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
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
    return '\"$name\" will be removed after server restart';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Failed to uninstall: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Updating \"$name\" to v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Kan ikke åpne innstillingene: mangler auth token.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Finner ikke plugin';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminRepositoryNameHint => 'f.eks. Jellyfin Stall';

  @override
  String get adminRepositoryUrl => 'Repository URL';

  @override
  String get adminAddEntry => 'Legg til oppføring';

  @override
  String get adminInvalidUrl => 'Ugyldig URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminBaseUrl => 'Base URL';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Søk etter ekstern person';

  @override
  String get adminNoRemoteMatches => 'Ingen eksterne treff funnet';

  @override
  String get adminRemoteResults => 'Eksterne resultater';

  @override
  String get adminRemoteMetadataApplied => 'Eksterne metadata er brukt';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Oppdater innholdstype';

  @override
  String get adminContentType => 'Innholdstype';

  @override
  String get adminContentTypeUpdated => 'Innholdstype oppdatert';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Bildeformat som ikke støttes';

  @override
  String get adminImageReadFailed => 'Kunne ikke lese det valgte bildet';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType image uploaded';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType image deleted';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String get adminAllProviders => 'Alle tilbydere';

  @override
  String get adminNoRemoteImages => 'Ingen eksterne bilder funnet';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Legg til tuner';

  @override
  String get adminTunerType => 'Tuner Type';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Annet';

  @override
  String get adminUrlPath => 'URL / bane';

  @override
  String get adminNameOptional => 'Navn (valgfritt)';

  @override
  String get adminTunerAdded => 'Tuner lagt til';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Legg til guideleverandør';

  @override
  String get adminProviderType => 'Leverandørtype';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect eller XMLTV';

  @override
  String get adminUsernameOptional => 'Brukernavn (valgfritt)';

  @override
  String get adminRefreshInterval => 'Oppdateringsintervall (timer)';

  @override
  String get adminProviderAdded => 'Leverandør lagt til';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tuner tilbakestilling forespurt';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved => 'Opptaksinnstillinger lagret';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Legg til leverandør';

  @override
  String get adminNoListingProviders =>
      'Ingen oppføringsleverandører er konfigurert';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Recording path: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Series path: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Pre-padding: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Post-padding: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Tuner Discovery';

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
    return 'Restore backup $name now?';
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
  String get adminApply => 'Søke';

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
    return '${minutes}m ago';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d ago';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Failed to load $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count matches';
  }

  @override
  String get adminLogViewerNoMatches => 'Ingen samsvarende linjer';

  @override
  String get adminMetadataEditorTitle => 'Metadataredigerer';

  @override
  String get adminMetadataRemote => 'Fjernkontroll';

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
  String get adminMetadataFieldTagline => 'Tagline';

  @override
  String get adminMetadataFieldOverview => 'Oversikt';

  @override
  String get adminMetadataGenres => 'Sjangere';

  @override
  String get adminMetadataTags => 'Tagger';

  @override
  String get adminMetadataStudios => 'Studios';

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
    return '$imageType image updated';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType image uploaded';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType image deleted';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Kunne ikke lese det valgte bildet';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Dette fjerner det gjeldende bildet fra elementet.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ingen pakker samsvarer med søket ditt';

  @override
  String get adminPluginsCatalogEmpty => 'Ingen tilgjengelige pakker';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Fjern repository';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Fjerne';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminReposUrl => 'Repository URL';

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
  String get adminPlaybackHwAccel => 'Maskinvareakselerasjon';

  @override
  String get adminPlaybackHwAccelLabel => 'Maskinvareakselerasjon';

  @override
  String get adminPlaybackEnableHwEncoding => 'Aktiver maskinvarekoding';

  @override
  String get adminPlaybackEnableHwDecoding => 'Aktiver maskinvaredekoding for:';

  @override
  String get adminPlaybackEncoding => 'Koding';

  @override
  String get adminPlaybackEncodingThreads => 'Koding av tråder';

  @override
  String get adminPlaybackFallbackFont => 'Aktiver reservefont';

  @override
  String get adminPlaybackFallbackFontPath => 'Reserve skriftbane';

  @override
  String get adminPlaybackStreaming => 'Streaming';

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
  String get adminTaskStop => 'Stoppe';

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
    return 'Daily at $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Every $day at $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Every $duration';
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
      other: '$count hours',
      one: '1 hour',
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
    return '${days}d ago';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m ago';
  }

  @override
  String get adminActivityNow => 'nå';

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
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigurer trickplay-bildegenerering for forhåndsvisningsminiatyrbilder.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Offentlig HTTPS-port';

  @override
  String get adminNetworkingBaseUrl => 'Base URL';

  @override
  String get adminNetworkingBaseUrlHint => 'f.eks. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Langsom responsterskel (ms)';

  @override
  String get adminGeneralCachePath => 'Bufferbane';

  @override
  String get adminGeneralMetadataPath => 'Metadatabane';

  @override
  String get adminGeneralServerName => 'Servernavn';

  @override
  String get adminSettingsLoadFailed => 'Kunne ikke laste inn innstillingene';

  @override
  String get adminDiscover => 'Oppdage';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-tilgang nektet';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Du har ikke tilgang til ett eller flere elementer i denne SyncPlay-gruppen. Be gruppeeieren om å bekrefte bibliotektillatelser eller velge en annen kø.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
      other: '# rows discovered',
      one: '# row discovered',
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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Fjernavspilling';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Enhetsvolum';

  @override
  String get castVolumeUnavailable => 'Utilgjengelig';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Feil PIN-kode';

  @override
  String get pinMismatch => 'PIN-kodene stemmer ikke overens';

  @override
  String get pinForgot => 'Glemt PIN-koden?';

  @override
  String get pinClear => 'Klar';

  @override
  String get pinBackspace => 'Tilbake';

  @override
  String get quickConnectAuthorized => 'Hurtigkoblingsforespørsel autorisert.';

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
      'Kontoen din kan ikke godkjenne denne hurtigkoblingsforespørselen.';

  @override
  String get quickConnectNotFound =>
      'Hurtigkoblingskoden ble ikke funnet. Prøv en ny kode.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Skriv inn kode';

  @override
  String get quickConnectAuthorize => 'Autorisere';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
  String get stillWatchingStop => 'Stoppe';

  @override
  String get stillWatchingContinue => 'Fortsette';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Direktesendt TV';

  @override
  String get continueWatchingAndNextUp => 'Fortsett å se og neste opp';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get playerTooltipPrevious => 'Tidligere';

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
  String get settingsPrivacyAndSafetySection => 'PERSONVERN OG SIKKERHET';

  @override
  String get settingsBlockedRatings => 'Blokkerte vurderinger';

  @override
  String get settingsGeneralStyle => 'Generell stil';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Temaaksenter, bakgrunner, sett-indikatorer og temamusikk';

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
  String get settingsShowSeerrButtonInNavigation => '';

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
  String get settingsAppInfo => 'APP INFO';

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
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

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
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Velg standard avspillingsmotor på Android TV-enheter. Endringer gjelder for neste avspillingsøkt.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (anbefalt)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (eldre)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
    return '';
  }

  @override
  String get autoplayNextEpisode => 'Autoplay Next Episode';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automatically play the next episode when available.';

  @override
  String get skipSilenceTitle => 'Skip silence';

  @override
  String get skipSilenceSubtitle =>
      'Automatically skip silent audio segments when supported by the stream.';

  @override
  String get allowExternalAudioEffectsTitle => 'Allow external audio effects';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Allow equalizer and effects apps (e.g. Wavelet) to attach to Media3 playback sessions.';

  @override
  String get disableTunnelingTitle => 'Disable tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Force non-tunneled playback. Useful on devices with tunneling audio/video discontinuities.';

  @override
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

  @override
  String get mapDolbyVisionP7Title => 'Map Dolby Vision profile 7 to HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Play Dolby Vision profile 7 streams as HDR10-compatible HEVC on non-DV devices.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Use embedded subtitle styles';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Apply colours, fonts, and positioning embedded in the subtitle track. Disable to use your caption style preferences instead.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Use embedded subtitle font sizes';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Apply font-size hints embedded in the subtitle track. Disable to use the subtitle size from your style preferences.';

  @override
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

  @override
  String get useDetailedSubHeadings => 'Use Detailed Sub-Headings';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Show detailed or minimal subrow on Library pages.';

  @override
  String get savedThemesDeleteDialogTitle => 'Delete saved theme?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Remove \"$themeName\" from this device cache?';
  }

  @override
  String get themeStore => '';

  @override
  String get themeStoreSubtitle => '';

  @override
  String get themeStoreDescription => '';

  @override
  String get themeStoreEmpty => '';

  @override
  String get themeStoreLoadFailed => '';

  @override
  String get themeStoreSave => '';

  @override
  String get themeStoreSaveAndApply => '';

  @override
  String get themeStoreSaved => '';

  @override
  String get themeStoreInvalidMessage => '';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Deleted \"$themeName\" from this device.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Could not delete \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Saved themes';

  @override
  String get savedThemesDescription =>
      'These are themes downloaded from the Moonfin plugin for the current server. Deleting removes only this local copy.';

  @override
  String get savedThemesEmpty => 'No saved themes were found for this server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Currently active';
  }

  @override
  String get savedThemesDeleteTooltip => 'Delete saved theme';

  @override
  String get savedThemesManageSubtitle =>
      'Manage downloaded plugin themes on this device';

  @override
  String get themeEditor => 'Theme Editor';

  @override
  String get themeEditorSubtitle =>
      'Open the Moonfin Theme Editor in your browser';

  @override
  String get homeScreen => 'Home Screen';

  @override
  String get bottomBar => 'Bottom Bar';

  @override
  String get homeRowsStyleClassic => 'Classic';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Home Rows';

  @override
  String get homeRowDisplay => '';

  @override
  String get homeRowSections => '';

  @override
  String get homeRowToggles => '';

  @override
  String get homeRowTogglesSubtitle => '';

  @override
  String get homeRowTogglesDescription => '';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Classic keeps per-row image type and info overlay. Modern uses portrait-to-backdrop rows.';

  @override
  String get displayFavoritesRows => 'Display Favorites Rows';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Show Favorite Movies, Series, and other favorite rows in Home Sections.';

  @override
  String get favoritesRowSorting => 'Favorites Row Sorting';

  @override
  String get favoritesRowSortingDescription =>
      'Sort Favorites rows by date added, release date, alphabetically, and more.';

  @override
  String get displayCollectionsRows => 'Display Collections Rows';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Show Collections rows in Home Sections.';

  @override
  String get collectionsRowSorting => 'Collections Row Sorting';

  @override
  String get collectionsRowSortingDescription =>
      'Sort Collections rows by date added, release date, alphabetically, and more.';

  @override
  String get displayGenresRows => 'Display Genres Rows';

  @override
  String get displayGenresRowsSubtitle => 'Show Genres rows in Home Sections.';

  @override
  String get genresRowSorting => 'Genres Row Sorting';

  @override
  String get genresRowSortingDescription =>
      'Sort Genres rows by date added, release date, alphabetically, and more.';

  @override
  String get genresRowItems => 'Genres Row Items';

  @override
  String get genresRowItemsDescription =>
      'Show Movies, Series, or both in Genres rows.';

  @override
  String get displayPlaylistsRows => '';

  @override
  String get displayPlaylistsRowsSubtitle => '';

  @override
  String get playlistsRowSorting => '';

  @override
  String get playlistsRowSortingDescription => '';

  @override
  String get displayAudioRows => '';

  @override
  String get displayAudioRowsSubtitle => '';

  @override
  String get audioRowsSorting => '';

  @override
  String get audioRowsSortingDescription => '';

  @override
  String get audioPlaylists => '';

  @override
  String get appearance => 'Appearance';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

  @override
  String get externalPlayerAppDescription => '';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Show app chooser when playback starts.';

  @override
  String get loadingInstalledPlayers => 'Loading installed players...';

  @override
  String get connection => 'Connection';

  @override
  String get audioTranscodeTarget => 'Audio Transcode Target';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Supported on this device';

  @override
  String get notSupportedOnThisDevice => 'Not Supported on this device';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) to external decoder.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD with Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Media Player Behavior';

  @override
  String get playbackEnhancements => 'Playback Enhancements';

  @override
  String get alwaysOn => 'Always on.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Replace Skip Outro with Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Show the Next Up overlay instead of the Skip Outro button.';

  @override
  String get playerRouting => 'Player Routing';

  @override
  String get preferSoftwareDecoders => 'Prefer software decoders';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Use FFmpeg (audio) and libgav1 (AV1) before hardware decoders. Disable if HDMI audio passthrough breaks.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Open video playback in your selected external app on Android TV.';

  @override
  String get automaticQueuing => 'Automatic Queuing';

  @override
  String get preferSdhSubtitles => 'Prefer SDH subtitles';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritize SDH/CC subtitle tracks when auto-selecting.';

  @override
  String get webDiagnostics => 'Web diagnostics';

  @override
  String get webDiagnosticsTitle => 'Moonfin Web Diagnostics';

  @override
  String get webDiagnosticsIntro =>
      'Use this page to diagnose browser connectivity issues (CORS, mixed content, and discovery settings).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Detected Mixed-Content Failure';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Detected CORS/Preflight Failure';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin detected an HTTPS page trying to call an HTTP server URL. Browsers block this request before it reaches your server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin detected a browser-level request failure that is commonly caused by missing CORS or preflight headers on the media server.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Target URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detail: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Current Runtime Context';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Scheme';

  @override
  String get webDiagnosticsPluginMode => 'Plugin Mode';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC Scan';

  @override
  String get webDiagnosticsForcedServerUrl => 'Forced Server URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Default Server URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Discovery Proxy URL';

  @override
  String get notConfigured => 'not configured';

  @override
  String get webDiagnosticsMixedContent => 'Mixed Content';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'This page is loaded over HTTPS, but one or more configured URLs are HTTP. Browsers block HTTPS pages from calling HTTP APIs.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Fix: serve your media server or proxy endpoint via HTTPS, or load Moonfin over HTTP on trusted local networks only.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'No obvious mixed-content configuration detected from current runtime settings.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS Checklist';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Allow the browser origin in Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Include Authorization, X-Emby-Authorization, and X-Emby-Token in Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Expose Content-Range and Accept-Ranges for streaming and seek behavior.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Return 204 to OPTIONS preflight requests.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Example Header Snippet (nginx-style)';

  @override
  String get note => 'Note';

  @override
  String get webDiagnosticsNonWebNote =>
      'This diagnostics route is intended for web builds. If you are seeing this on another platform, these checks may not apply.';

  @override
  String get backToServerSelect => 'Back To Server Select';

  @override
  String get signOutAllUsers => 'Sign Out All Users';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Microphone permission is permanently denied. Enable it in system settings.';

  @override
  String get voiceSearchPermissionRequired =>
      'Microphone permission is required for voice search.';

  @override
  String get voiceSearchNoMatch => 'Did not catch that. Try again.';

  @override
  String get voiceSearchNoSpeechDetected => 'No speech detected.';

  @override
  String get voiceSearchMicrophoneError => 'Microphone error.';

  @override
  String get voiceSearchNeedsInternet => 'Voice search needs internet.';

  @override
  String get voiceSearchServiceBusy => 'Voice service is busy. Try again.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Microphone permission is permanently denied.';

  @override
  String get microphonePermissionDenied => 'Microphone permission is denied.';

  @override
  String get speechRecognitionUnavailable =>
      'Speech recognition is unavailable on this device.';

  @override
  String get openIosRoutePicker => 'Open iOS route picker';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay route picker is unavailable on this device.';

  @override
  String get videos => 'Videos';

  @override
  String get trailers => 'Trailers';

  @override
  String get programs => 'Programs';

  @override
  String get songs => 'Songs';

  @override
  String get photoAlbums => 'Photo Albums';

  @override
  String get photos => 'Photos';

  @override
  String get people => 'People';

  @override
  String get recentlyReleasedEpisodes => 'Recently Released Episodes';

  @override
  String get watchAgain => 'Watch Again';

  @override
  String get guestAppearances => 'Guest Appearances';

  @override
  String get appearancesSeerr => 'Appearances (Seerr)';

  @override
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'Watch with group';

  @override
  String get errors => 'Errors';

  @override
  String get warnings => 'Warnings';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Open in Browser';

  @override
  String get embeddedBrowserNotAvailable =>
      'Embedded browser is not available on this platform.';

  @override
  String get adminRestartServerConfirmation =>
      'Are you sure you want to restart the server?';

  @override
  String get adminShutdownServerConfirmation =>
      'Are you sure you want to shut down the server? You will need to restart it manually.';

  @override
  String get internal => 'Internal';

  @override
  String get idle => 'Idle';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'No users found';

  @override
  String get adminNoUsersMatchSearch => 'No users match your search';

  @override
  String get adminNoDevicesFound => 'No devices found';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'No devices match the current filters';

  @override
  String get passwordSet => 'Password set';

  @override
  String get noPasswordConfigured => 'No password configured';

  @override
  String get remoteAccess => 'Remote Access';

  @override
  String get localOnly => 'Local Only';

  @override
  String get adminMediaAnalyticsLoadFailed => 'Failed to load media analytics';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Combined analytics across all media libraries.';

  @override
  String get analyticsTopArtists => 'Top Artists';

  @override
  String get analyticsTopAuthors => 'Top Authors';

  @override
  String get analyticsTopContributors => 'Top Contributors';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Libraries',
      one: '1 Library',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'No indexed media totals are available for this selection yet.';

  @override
  String get analyticsLibraryDetails => 'Library Details';

  @override
  String get analyticsLibraryBreakdown => 'Library Breakdown';

  @override
  String get analyticsNoLibrariesAvailable => 'No libraries are available.';

  @override
  String get adminServerAdministrationTitle => 'Server Administration';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Image Cache';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Logs';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Transcode';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'No server paths returned by this server.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% used';
  }

  @override
  String get userActivity => 'User Activity';

  @override
  String get systemEvents => 'System Events';

  @override
  String get needsAttention => 'Needs Attention';

  @override
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Playback';

  @override
  String get adminDrawerSectionDevices => 'Devices';

  @override
  String get adminDrawerSectionAdvanced => 'Advanced';

  @override
  String get adminDrawerSectionPlugins => 'Plugins';

  @override
  String get adminDrawerSectionLiveTv => 'Live TV';

  @override
  String get homeVideos => 'Home Videos';

  @override
  String get mixedContent => 'Mixed Content';

  @override
  String get homeVideosAndPhotos => 'Home Videos & Photos';

  @override
  String get mixedMoviesAndShows => 'Mixed Movies & Shows';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'No recordings found';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'No image pages found inside .$extension archive.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Embedded renderer failed ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB renderer failed ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Missing local file for reader: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status while opening book data from $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'No readable book endpoint available';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Unsupported comic archive format: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR extraction plugin is not available on this platform.';

  @override
  String get failedToExtractCbrArchive => 'Failed to extract .cbr archive.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 extraction is not available on this platform.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 extraction plugin is not available on this platform.';

  @override
  String get closeGenrePanel => 'Close genre panel';

  @override
  String get loadingShuffle => 'Loading shuffle...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Auto HDR Switching';

  @override
  String get autoHdrSwitchingDescription =>
      'Automatically enable HDR for HDR video playback and restore display mode on exit.';

  @override
  String get whenFullscreen => 'When fullscreen';

  @override
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'Transcoding Limits';

  @override
  String get clearAllArtworkButton => '';

  @override
  String get clearAllArtworkWarning => '';

  @override
  String get confirmClear => '';

  @override
  String confirmClearMessage(String itemType) {
    return '';
  }

  @override
  String get uploadButton => '';

  @override
  String get resolutionLabel => '';

  @override
  String get onlyShowInterfaceLanguage => '';

  @override
  String get confirmClearAll => '';

  @override
  String get imageUploadSuccess => '';

  @override
  String imageUploadFailed(String error) {
    return '';
  }

  @override
  String imageDownloadFailed(String error) {
    return '';
  }

  @override
  String imageDeleteFailed(String error) {
    return '';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return '';
  }

  @override
  String get yes => '';

  @override
  String get posterCategory => '';

  @override
  String get backdropsCategory => '';

  @override
  String get bannerCategory => '';

  @override
  String get logoCategory => '';

  @override
  String get thumbnailCategory => '';

  @override
  String get artCategory => '';

  @override
  String get discArtCategory => '';

  @override
  String get screenshotCategory => '';

  @override
  String get boxCoverCategory => '';

  @override
  String get boxRearCoverCategory => '';

  @override
  String get menuArtCategory => '';

  @override
  String get confirmItemPoster => '';

  @override
  String get confirmItemBackdrop => '';

  @override
  String get confirmItemBanner => '';

  @override
  String get confirmItemLogo => '';

  @override
  String get confirmItemThumbnail => '';

  @override
  String get confirmItemArt => '';

  @override
  String get confirmItemDiscArt => '';

  @override
  String get confirmItemScreenshot => '';

  @override
  String get confirmItemBoxCover => '';

  @override
  String get confirmItemBoxRearCover => '';

  @override
  String get confirmItemMenuArt => '';

  @override
  String get resolutionAll => '';

  @override
  String get resolutionHigh => '';

  @override
  String get resolutionMedium => '';

  @override
  String get resolutionLow => '';

  @override
  String get sources => '';

  @override
  String get subtitlePreferences => '';

  @override
  String get subtitlePreferencesDescription => '';

  @override
  String get subtitleRendering => '';

  @override
  String get displayOptions => '';

  @override
  String get releaseDateAscending => '';

  @override
  String get releaseDateDescending => '';

  @override
  String get groupContributions => '';

  @override
  String get groupMultipleRoles => '';

  @override
  String get libraryWriteAccessWarningTitle => '';

  @override
  String get libraryWriteAccessHowToFix => '';

  @override
  String get libraryWriteAccessFixSteps => '';

  @override
  String get dismiss => '';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '';
  }

  @override
  String get libraryWriteAccessReactiveBody => '';

  @override
  String get externalLists => 'External Home Row Lists';

  @override
  String get replay => 'Replay';

  @override
  String get fileInformation => 'File Information';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Size: $size  •  Format: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Show All ($count) Audio Tracks';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Show All ($count) Subtitle Tracks';
  }

  @override
  String get checkingDirectPlay => 'Checking Direct Play capability...';

  @override
  String get directPlayCapabilityLabel => 'Direct Play Capability: ';

  @override
  String get forced => 'Forced';

  @override
  String get transcodeContainerNotSupported =>
      'Container format is not supported by the player.';

  @override
  String get transcodeVideoCodecNotSupported => 'Video codec is not supported.';

  @override
  String get transcodeAudioCodecNotSupported => 'Audio codec is not supported.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Subtitle format is not supported (requires burning).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Audio profile is not supported.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Video profile is not supported.';

  @override
  String get transcodeVideoLevelNotSupported => 'Video level is not supported.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Video resolution is not supported by this device.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Video bit depth is not supported.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Video framerate is not supported.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'File bitrate exceeds player streaming limit.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Video bitrate exceeds streaming limit.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Audio bitrate exceeds streaming limit.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Number of audio channels is not supported.';

  @override
  String get sortAlphabetical => 'Alphabetical';

  @override
  String get sortReleaseAscending => 'Release Order (Ascending)';

  @override
  String get sortReleaseDescending => 'Release Order (Descending)';

  @override
  String get sortCustomDragDrop => 'Custom (Drag-and-Drop)';

  @override
  String get playlistSortOptions => 'Playlist Sort Options';

  @override
  String get resetSort => 'Reset Sort';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Rewatch S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Rewatch Playlist';

  @override
  String get noSubtitlesFound => 'No subtitles found.';

  @override
  String get adminControls => 'Admin Controls';
}
