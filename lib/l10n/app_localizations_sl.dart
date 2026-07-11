// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'Mesečeva plavutka';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'Prijavite se';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Hitra povezava';

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
  String get waitingForAuthorization => 'Čakanje na avtorizacijo ...';

  @override
  String get back => 'Nazaj';

  @override
  String get serverUnavailable => 'Strežnik ni na voljo';

  @override
  String get loginFailed => 'Prijava ni uspela';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Kdo gleda?';

  @override
  String get addUser => 'Dodaj uporabnika';

  @override
  String get selectServer => 'Izberite Strežnik';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
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
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Classic is the original centered moonfin layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Classic';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get expandedTabs => 'Expanded Tabs';

  @override
  String get expandedTabsSubtitle =>
      'Automatically show tab content while browsing tabs. Turn off to open and close each tab manually.';

  @override
  String get recommendationSystem => 'Recommendation System';

  @override
  String get recommendationSystemSubtitle =>
      'Use the Moonfin Recommends local-library algorithm or the online TMDb\'s Similarity Metrics. Note: Online recommendations require Seerr integration.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb Similarity';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Apply Parental Rating Cap?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limit Moonfin Recommends suggestions by parental rating of target media';

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
  String get glassQuality => 'Glass Quality';

  @override
  String get glassQualitySubtitle =>
      'Auto picks the best glass effect for this device. Full forces real blur; Reduced uses a lightweight glass that saves GPU power.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Full';

  @override
  String get glassQualityReduced => 'Reduced';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Preklapljajte med Moonfin in Neon Pulse brez ponovnega zagona aplikacije';

  @override
  String get customThemeTitle => 'Custom Theme';

  @override
  String get customThemeSubtitle =>
      'Custom themes alter visual elements across Moonfin. Choose one of these options to suit your style.';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Mesečeva plavutka';

  @override
  String get themeMoonfinSubtitle =>
      'Trenutni videz Moonfin, ki ste ga vsi vzljubili';

  @override
  String get themeNeonPulse => 'Neonski utrip';

  @override
  String get themeNeonPulseSubtitle =>
      'Oblikovanje Synthwave z magenta sijajem, cian besedilom in močnejšim kromiranim kontrastom';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixel-art styling with a chunky palette, blocky borders, hard drop-shadows, and a pixel font';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Želite zapustiti Moonfin?';

  @override
  String get exitAppConfirmation => 'Ste prepričani, da želite zapustiti?';

  @override
  String get exit => 'Izhod';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Paused';

  @override
  String get gameSaveState => 'Save state';

  @override
  String get gameLoadState => 'Load state';

  @override
  String get gameFastForward => 'Fast-forward';

  @override
  String get gameEmulatorSettings => 'Emulator settings';

  @override
  String get gameNoCoreOptions => 'This core has no adjustable options.';

  @override
  String get gameHoldToOpenMenu => 'Hold to open menu';

  @override
  String get gamePlaybackUnsupported =>
      'Game playback is not supported on this device yet.';

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
  String get series => 'serija';

  @override
  String get noItemsFound => 'Ni elementov';

  @override
  String get home => 'domov';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ta mapa je prazna';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Pogledi';

  @override
  String get albums => 'Albumi';

  @override
  String get albumArtists => 'Izvajalci albuma';

  @override
  String get artists => 'Umetniki';

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
  String get discoverySubjects => 'Predmeti odkrivanja';

  @override
  String get pickDiscoverySubjects =>
      'Izberite, katere vsebinske vire želite prikazati v Odkrivanju.';

  @override
  String get apply => 'Prijavite se';

  @override
  String get openLink => 'Odprite povezavo';

  @override
  String get scanWithYourPhone => 'Skenirajte s telefonom';

  @override
  String get audiobookGenres => 'Zvrsti zvočnih knjig';

  @override
  String get pickAudiobookGenres =>
      'Izberite, katere zvrsti želite prikazati v Odkrivanju zvočnih knjig.';

  @override
  String get discoverAudiobooks => 'Odkrijte zvočne knjige';

  @override
  String get librivoxDescription =>
      'Priljubljeni naslovi javne domene LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Pomaknite se levo';

  @override
  String get scrollRight => 'Pomaknite se desno';

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
  String get resume => 'Nadaljevanje';

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
  String get readyWhenYouAre => 'Pripravljeni, ko ste';

  @override
  String get details => 'Podrobnosti';

  @override
  String get listeningRoom => 'Soba za poslušanje';

  @override
  String get bookmarksAndProgress => 'Zaznamki in napredek';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
  String get trendingTitlesOpenLibrary =>
      'Priljubljeni naslovi po temah iz Open Library.';

  @override
  String get noBookmarkedItems => 'Zaznamkov še ni';

  @override
  String get nothingMatchesSection =>
      'Nič se še ne ujema s tem razdelkom. Poskusite z drugim zavihkom ali se vrnite, ko se sinhronizacija knjižnice konča.';

  @override
  String get audiobooks => 'Zvočne knjige';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
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
  String get watched => 'Gledal';

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
  String get latestBooks => 'Latest Books';

  @override
  String get latestAudiobooks => 'Latest Audiobooks';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books',
      one: '1 book',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Book';

  @override
  String get bookFormatAudiobook => 'Audiobook';

  @override
  String bookPercentRead(int percent) {
    return '$percent% read';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time left';
  }

  @override
  String get bookHeroRead => 'Read';

  @override
  String get bookHeroListen => 'Listen';

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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Te teme trenutno ni bilo mogoče naložiti.';

  @override
  String get audiobookDetails => 'Podrobnosti zvočne knjige';

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
  String get trackList => 'Seznam skladb';

  @override
  String get itemListPlaceholder => 'Tukaj se prikaže seznam predmetov';

  @override
  String get favoriteTracksPlaceholder =>
      'Tukaj bodo prikazane priljubljene skladbe';

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
  String get seasons => 'letni časi';

  @override
  String get chapters => 'Poglavja';

  @override
  String get features => 'Lastnosti';

  @override
  String get movies => 'Filmi';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
  String get noBooksFound => 'Za tega avtorja ni bilo najdenih knjig.';

  @override
  String get unableToLoadAuthorDetails =>
      'Podatkov o avtorju trenutno ni mogoče naložiti.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Datum objave neznan';

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
  String get behindTheScenes => 'Behind the Scenes';

  @override
  String get deletedScenes => 'Deleted Scenes';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Interviews';

  @override
  String get scenes => 'Scenes';

  @override
  String get shorts => 'Shorts';

  @override
  String get trailers => 'Trailers';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
  }

  @override
  String get view => 'Pogled';

  @override
  String get resumeReading => 'Nadaljujte z branjem';

  @override
  String get read => 'Preberi';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Igraj';

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
  String get cast => 'Cast';

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
  String get renamePlaylist => 'Preimenuj seznam predvajanja';

  @override
  String get playlistName => 'Ime seznama predvajanja';

  @override
  String get deleteDownloadedAlbum => 'Izbriši preneseni album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Element izbrisan';

  @override
  String get noPlayableTrailerFound => 'Najden ni bil predvajan napovednik.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Zvočni posnetek';

  @override
  String get subtitleTrack => 'Skladba s podnapisi';

  @override
  String get none => 'Noben';

  @override
  String get downloadSubtitlesLabel => 'Prenesi podnapise ...';

  @override
  String get searchOpenSubtitlesPlugin => 'Iščite z vtičnikom OpenSubtitles';

  @override
  String get downloadSubtitles => 'Prenesi podnapise';

  @override
  String get selectedSubtitleInvalid => 'Izbrani podnaslov je neveljaven.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Podnaslov prenesen. Morda bo trajalo nekaj trenutkov, da se prikaže, medtem ko Jellyfin osveži element.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Izberite različico';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Izbriši prenesene datoteke';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'PISATELJICE';

  @override
  String get studio => 'GARSONJERA';

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
  String get showLess => 'Pokaži manj';

  @override
  String get readMore => 'Preberi več';

  @override
  String get shuffle => 'Naključno';

  @override
  String get shuffleAllMusic => 'Shuffle all music';

  @override
  String get carSignInPrompt => 'Sign in to Moonfin on your phone';

  @override
  String get carServerUnreachable => 'Can\'t reach your server';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Popolno ujemanje';

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
  String get deviceVolume => 'Glasnost naprave';

  @override
  String get unavailable => 'Ni na voljo';

  @override
  String get pause => 'Premor';

  @override
  String get syncPosition => 'Položaj sinhronizacije';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Čakalna vrsta je prazna';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Dolgo pritisnite za odklepanje';

  @override
  String get off => 'Izključeno';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Avto';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Preglasitev bitne hitrosti';

  @override
  String get audioDelay => 'Zakasnitev zvoka';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
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
  String get player => 'Igralec';

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
  String get codec => 'Kodek';

  @override
  String get videoBitrate => 'Bitna hitrost videa';

  @override
  String get track => 'Track';

  @override
  String get channels => 'Kanali';

  @override
  String get audioBitrate => 'Zvočna bitna hitrost';

  @override
  String get sampleRate => 'Stopnja vzorčenja';

  @override
  String get format => 'Oblika';

  @override
  String get external => 'Zunanji';

  @override
  String get embedded => 'Vdelano';

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
      'Upodabljanje EPUB v aplikaciji še ni na voljo na tej platformi.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Vdelano upodabljanje dokumentov na tej platformi ni na voljo.';

  @override
  String get couldNotOpenExternalViewer =>
      'Zunanjega pregledovalnika ni bilo mogoče odpreti.';

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
      'Zaznamkov še ni.\nMed branjem tapnite ikono zaznamka, da shranite svoj položaj.';

  @override
  String get noTableOfContentsAvailable => 'Kazalo ni na voljo';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Položaj';

  @override
  String get bookReader => 'Bralec knjig';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
  String get guideTimeline => 'Vodnik Časovnica';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Ni kanalov';

  @override
  String get liveBadge => 'V ŽIVO';

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
  String get watch => 'Pazi';

  @override
  String get close => 'Zapri';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'št';

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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Predvajaj album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'Serije ni mogoče najti';

  @override
  String get errorLoadingSeries => 'Napaka pri nalaganju serije';

  @override
  String get downloadedEpisodes => 'Prenesene epizode';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
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
  String get storageManagement => 'Upravljanje shranjevanja';

  @override
  String get storageBreakdown => 'Razčlenitev shranjevanja';

  @override
  String get downloadedItems => 'Preneseni predmeti';

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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Glasba in zvočne knjige';

  @override
  String get images => 'Slike';

  @override
  String get database => 'Baza podatkov';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'nastavitve';

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
  String get serverSyncAndPluginStatus =>
      'Sinhronizacija strežnika in status vtičnika';

  @override
  String get mediaRequestIntegration => 'Integracija medijske zahteve';

  @override
  String get switchServer => 'Switch Server';

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
  String get integrations => 'Integracije';

  @override
  String get pluginAndRequests => 'Vtičnik in zahteve';

  @override
  String get customizeAccountPlaybackInterface =>
      'Prilagodite račun, predvajanje in vedenje vmesnika';

  @override
  String optionsCount(int count) {
    return '$count options';
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
  String get backgroundBackdrops => 'Ozadja za ozadje';

  @override
  String get showBackdropImages => 'Pokaži slike ozadja za vsebino';

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
  String get snow => 'sneg';

  @override
  String get fireworks => 'Ognjemet';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Padajoče listje';

  @override
  String get themeMusic => 'Tematska glasba';

  @override
  String get playThemeMusicOnDetailPages =>
      'Predvajajte tematsko glasbo na straneh s podrobnostmi';

  @override
  String get themeMusicVolume => 'Glasnost tematske glasbe';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Tematska glasba na Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Igrajte med brskanjem po začetnem zaslonu';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => 'Zameglitev ozadja podrobnosti';

  @override
  String pixelValue(int value) {
    return '${value}px';
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
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Samodejno obrezovanje';

  @override
  String get stretch => 'Stretch';

  @override
  String get refreshRateSwitching => 'Preklop hitrosti osveževanja';

  @override
  String get disabled => 'Onemogočen';

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
  String get showDescriptionOnPause => 'Prikaži opis ob premoru';

  @override
  String get dimVideoShowOverview =>
      'Zatemni videoposnetek in prikaži besedilo pregleda med začasno ustavitvijo';

  @override
  String get osdLockButton => 'Gumb za zaklepanje OSD';

  @override
  String get osdLockButtonDescription =>
      'Prikaži gumb za zaklepanje, ki blokira vnos na dotik, dokler ga ne pritisnete dolgo';

  @override
  String get audioBehavior => 'Zvočno vedenje';

  @override
  String get downmixToStereo => 'Pretvori v stereo';

  @override
  String get defaultAudioLanguage => 'Privzeti jezik zvoka';

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
  String get directStreamRemux => 'Direct Stream (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcoding (Bitrate or Resolution)';

  @override
  String get transcodingVideoAndAudio => 'Transcoding (Video & Audio)';

  @override
  String get transcodingVideo => 'Transcoding (Video)';

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
  String get hindi => 'Hindi';

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
  String get enableTrueHdAudio =>
      'Omogoči zvok TrueHD (morda ne deluje na vseh platformah)';

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
  String get settingsAudioRouteHeadphones => 'Headphones';

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
    return '${value}s';
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
    return 'After $episodes episodes / ${hours}h';
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
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Nastavitve sloga (velikost, barva, odmik) veljajo za besedilne podnapise (SRT, VTT, TTML). Podnapisi ASS/SSA uporabljajo lasten vdelan slog, razen če je \"ASS/SSA Direct Play\" izklopljen. Bitnih podnapisov (PGS, DVB, VobSub) ni mogoče spremeniti.';

  @override
  String get defaultSubtitleLanguage => 'Privzeti jezik podnapisov';

  @override
  String get defaultToNoSubtitles => 'Privzeto je Brez podnapisov';

  @override
  String get turnOffSubtitlesByDefault => 'Privzeto izklopite podnapise';

  @override
  String get subtitleSize => 'Velikost podnapisov';

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
  String get cyan => 'Cyan';

  @override
  String get red => 'Rdeča';

  @override
  String get transparent => 'Transparentna';

  @override
  String get semiTransparentBlack => 'Polprozorna črna';

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
  String get customizationProfile => 'Prilagajanje profila';

  @override
  String get customizationProfileDescription =>
      'Izberite profil za nalaganje, urejanje in sinhronizacijo. Globalno velja povsod, razen če ga preglasi profil naprave. Zelena pika označuje vaš trenutni profil naprave.';

  @override
  String get loadProfile => 'Naloži profil';

  @override
  String get syncing => 'Sinhronizacija ...';

  @override
  String get syncToProfile => 'Sinhroniziraj s profilom';

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
  String get saveToDownloadsFolder => 'Shrani v mapo Prenosi';

  @override
  String get downloadsVisibleToOtherApps =>
      'Prenosi/Moonfin — vidno drugim aplikacijam';

  @override
  String get dangerZone => 'Nevarno območje';

  @override
  String get clearAllDownloads => 'Počisti vse prenose';

  @override
  String get original => 'Original';

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
  String get showLibrariesInToolbar => 'Prikaži knjižnice v orodni vrstici';

  @override
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

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
  String get teal => 'Teal';

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
  String get enableFolderView => 'Omogoči pogled mape';

  @override
  String get showFolderBrowsingOption => 'Pokaži možnost brskanja po mapah';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

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
  String get sourceLibraries => 'Izvorne knjižnice';

  @override
  String get sourceCollections => 'Izvorne zbirke';

  @override
  String get excludedGenres => 'Izključeni žanri';

  @override
  String get selectAll => 'Izberite Vse';

  @override
  String itemsSelected(int count) {
    return '$count selected';
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
  String get localPreviews => 'Lokalni predogledi';

  @override
  String get localPreviewsDescription =>
      'Konfigurirajte predogled napovednika, medijev in zvoka.';

  @override
  String get mediaBarMode => 'Slog medijske vrstice';

  @override
  String get mediaBarModeDescription =>
      'Izbirajte med različnimi slogi medijske vrstice ali pa medijsko vrstico izklopite';

  @override
  String get mediaBarModeMoonfin => 'Mesečeva plavutka';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Izključeno';

  @override
  String get enableMediaBar => 'Omogoči vrstico z mediji';

  @override
  String get showFeaturedContentSlideshow =>
      'Prikaži diaprojekcijo predstavljene vsebine na domači strani';

  @override
  String get contentType => 'Vrsta vsebine';

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
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

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
  String get latestMedia => 'Najnovejši mediji';

  @override
  String get recentlyReleased => 'Pred kratkim izdano';

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
  String get homeSections => 'Domači razdelki';

  @override
  String get resetToDefaults => 'Ponastavi na privzete nastavitve';

  @override
  String get homeRowPosterSize => 'Velikost plakata domače vrste';

  @override
  String get perRowImageTypeSelection => 'Izbira vrste slike na vrstico';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurirajte vrsto slike za vsako omogočeno domačo vrstico';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Združi Nadaljuj z gledanjem in Naprej';

  @override
  String get combineBothRows => 'Združite obe vrstici v en sam domači del';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'Vrsta slike na vrstico';

  @override
  String get perRowSettings => 'Nastavitve po vrsticah';

  @override
  String get autoLogin => 'Samodejna prijava';

  @override
  String get lastUser => 'Zadnji uporabnik';

  @override
  String get currentUser => '';

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
  String get showClock => 'Prikaži uro';

  @override
  String get displayClockDuringScreensaver =>
      'Prikaz ure med ohranjevalnikom zaslona';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

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
  String get pluginLabel => 'Plugin';

  @override
  String get pluginDetected => 'Vtičnik zaznan';

  @override
  String get pluginNotDetected => 'Vtičnik ni zaznan';

  @override
  String get pluginDetectedDescription =>
      'Zaznan strežniški vtičnik. Sinhronizacija se samodejno omogoči, ko je vtičnik prvič najden.';

  @override
  String get pluginNotDetectedDescription =>
      'Strežniški vtičnik trenutno ni zaznan. Lokalne nastavitve še vedno uporabljajo svoje shranjene vrednosti ali vgrajene privzete nastavitve.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Razpoložljive storitve';

  @override
  String get serverPluginSync => 'Sinhronizacija vtičnika strežnika';

  @override
  String get syncSettingsWithPlugin =>
      'Sinhronizirajte nastavitve s strežniškim vtičnikom';

  @override
  String get whatSyncControls => 'Kaj krmili sinhronizacija';

  @override
  String get syncControlsDescription =>
      'Sinhronizacija samo nadzira, ali so nastavitve, podprte z vtičniki, potisnjene v strežnik in potegnjene iz njega. Izbira profila in dejanja sinhronizacije profila so v nastavitvah prilagajanja, ko je omogočena sinhronizacija vtičnika.';

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
  String get seerrDiscoveryRows => '';

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
  String get seerrNotificationsSection => 'Notifications';

  @override
  String get seerrNotifyNewRequestsTitle => 'New request notifications';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Alert me when someone submits a request';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Request updates';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Approved, declined, and added to your library';

  @override
  String get seerrNotifyIssuesTitle => 'Issue updates';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'New issues, replies, and resolutions';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Odkrijte vrstice';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Povlecite za prerazporeditev. Omogoči ali onemogoči vrstice. Omogočen vrstni red se sinhronizira z vtičnikom Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Povlecite za prerazporeditev. Omogoči ali onemogoči vrstice.';

  @override
  String get enabled => 'Omogočeno';

  @override
  String get hidden => 'Skrito';

  @override
  String get aboutTitle => 'O tem';

  @override
  String versionValue(String version) {
    return 'Version $version';
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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Posodobite obvestila';

  @override
  String get showWhenUpdatesAvailable =>
      'Prikaži, kdaj so na voljo posodobitve';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get reorderToggleHomeRows => 'Preurejanje in preklop domačih vrstic';

  @override
  String get featuredContentAppearance => 'Predstavljena vsebina, videz';

  @override
  String get posterSizeImageTypeFolderView =>
      'Velikost plakata, vrsta slike, pogled mape';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB in viri ocen';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'jasno';

  @override
  String get browse => 'Prebrskaj';

  @override
  String get noResults => 'Brez rezultatov';

  @override
  String get seerrAvailableStatus => 'Na voljo';

  @override
  String get seerrRequestedStatus => 'Zahtevano';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Nastavitve Seerr';

  @override
  String get requestMore => 'Zahtevaj več';

  @override
  String get request => 'Zahteva';

  @override
  String get cancelRequest => 'Prekliči zahtevo';

  @override
  String get playInMoonfin => 'Igrajte v Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
  String get submitRequest => 'Oddaj zahtevo';

  @override
  String get allSeasons => 'Vsi letni časi';

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
    return 'age $age';
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
  String get failedStatus => 'Failed';

  @override
  String get processingStatus => 'Processing';

  @override
  String modifiedByName(String name) {
    return 'Modified by $name';
  }

  @override
  String get completedStatus => 'Completed';

  @override
  String get requestErrorDuplicate => 'This title was already requested';

  @override
  String get requestErrorQuota => 'Request limit reached';

  @override
  String get requestErrorBlocklisted => 'This title is blocklisted';

  @override
  String get requestErrorNoSeasons => 'No seasons left to request';

  @override
  String get requestErrorPermission =>
      'You don\'t have permission to make this request';

  @override
  String get seerrRequestsTitle => 'Requests';

  @override
  String get seerrIssuesTitle => 'Issues';

  @override
  String get sortNewest => 'Newest';

  @override
  String get sortLastModified => 'Last Modified';

  @override
  String get noIssues => 'No issues';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit movie requests remaining';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit season requests remaining';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Part of $name';
  }

  @override
  String get viewCollection => 'View Collection';

  @override
  String get requestCollection => 'Request Collection';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total movies · $available available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Request $count movies';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Requesting $current of $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Requested $count movies';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Requested $ok of $total movies';
  }

  @override
  String get collectionAllRequested =>
      'All movies are already available or requested';

  @override
  String get reportIssue => 'Report Issue';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'What\'s wrong?';

  @override
  String get allEpisodes => 'All Episodes';

  @override
  String get episode => 'Episode';

  @override
  String get openStatus => 'Open';

  @override
  String get resolvedStatus => 'Resolved';

  @override
  String get resolveAction => 'Resolve';

  @override
  String get reopenAction => 'Reopen';

  @override
  String reportedByName(String name) {
    return 'Reported by $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comments';
  }

  @override
  String get addComment => 'Add a comment';

  @override
  String get deleteIssueConfirm => 'Delete this issue?';

  @override
  String get submitReport => 'Submit Report';

  @override
  String get tmdbScore => 'Rezultat TMDB';

  @override
  String get releaseDateLabel => 'Datum izdaje';

  @override
  String get firstAirDateLabel => 'Datum prvega predvajanja';

  @override
  String get revenueLabel => 'Prihodki';

  @override
  String get runtimeLabel => 'Runtime';

  @override
  String get budgetLabel => 'Proračun';

  @override
  String get originalLanguageLabel => 'Izvirni jezik';

  @override
  String get seasonsLabel => 'letni časi';

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
  String get next => 'Naprej';

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
  String get remote => 'Daljinsko';

  @override
  String get rename => 'Preimenuj';

  @override
  String get revoke => 'Prekliči';

  @override
  String get role => 'Vloga';

  @override
  String get root => 'Root';

  @override
  String get run => 'Teči';

  @override
  String get search => 'Iskanje';

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
  String get stop => 'Stop';

  @override
  String get streaming => 'Pretakanje';

  @override
  String get time => 'Čas';

  @override
  String get trickplay => 'Prevara';

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
  String get mute => 'Mute';

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
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => 'Prekodiranje';

  @override
  String get adminDrawerResume => 'Nadaljevanje';

  @override
  String get adminDrawerStreaming => 'Pretakanje';

  @override
  String get adminDrawerTrickplay => 'Prevara';

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
  String get adminScanLibraries => 'Skenirajte knjižnice';

  @override
  String get adminLibraryScanStarted => 'Skeniranje knjižnice se je začelo';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get sessionNext => 'Naprej';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

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
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Dokončanje';

  @override
  String get direct => 'Neposredno';

  @override
  String get adminDisconnect => 'Prekini povezavo';

  @override
  String get adminClearDates => 'Jasni datumi';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Izbriši napravo';

  @override
  String get adminDeviceDeleted => 'Naprava izbrisana';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Remove device \'$name\'? The user will need to sign in again on this device.';
  }

  @override
  String get adminDeleteAllDevices => 'Delete all devices';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Remove $count devices? Affected users will need to sign in again. Your current device is not affected.';
  }

  @override
  String get adminDevicesDeletedAll => 'Devices removed';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Removed some devices; $count could not be removed.';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Preimenuj knjižnico';

  @override
  String get adminNewName => 'Novo ime';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Izbriši knjižnico';

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
  String get adminRemovePath => 'Odstrani pot';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Možnosti knjižnice so shranjene';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminSaveOptions => 'Možnosti shranjevanja';

  @override
  String get adminPreferredMetadataLanguage => 'Prednostni jezik metapodatkov';

  @override
  String get adminMetadataLanguageHint => 'npr. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Koda države metapodatkov';

  @override
  String get adminMetadataCountryHint => 'npr. ZDA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Paths';

  @override
  String get adminLibraryTabOptions => 'Options';

  @override
  String get adminLibraryTabDownloaders => 'Downloaders';

  @override
  String get adminLibMetadataSavers => 'Metadata savers';

  @override
  String get adminLibSubtitleDownloaders => 'Subtitle downloaders';

  @override
  String get adminLibLyricDownloaders => 'Lyric downloaders';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadata downloaders: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Image fetchers: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'This server exposes no downloaders for this library type.';

  @override
  String get adminLibrarySectionGeneral => 'General';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Embedded Info';

  @override
  String get adminLibrarySectionSubtitles => 'Subtitles';

  @override
  String get adminLibrarySectionImages => 'Images';

  @override
  String get adminLibrarySectionSeries => 'Series';

  @override
  String get adminLibrarySectionMusic => 'Music';

  @override
  String get adminLibrarySectionMovies => 'Movies';

  @override
  String get adminLibRealtimeMonitor => 'Enable real-time monitoring';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detect file changes and process them automatically.';

  @override
  String get adminLibArchiveMediaFiles => 'Treat archives as media files';

  @override
  String get adminLibEnablePhotos => 'Display photos';

  @override
  String get adminLibSaveLocalMetadata => 'Save artwork into media folders';

  @override
  String get adminLibRefreshInterval => 'Automatic metadata refresh';

  @override
  String get adminLibRefreshNever => 'Never';

  @override
  String get adminLibDefault => 'Default';

  @override
  String get adminLibDisplayTitle => 'Display';

  @override
  String get adminLibDisplaySection => 'Library display';

  @override
  String get adminLibFolderView =>
      'Display a folder view to show plain media folders';

  @override
  String get adminLibSpecialsInSeasons =>
      'Display specials within seasons they aired in';

  @override
  String get adminLibGroupMovies => 'Group movies into collections';

  @override
  String get adminLibGroupShows => 'Group shows into collections';

  @override
  String get adminLibExternalSuggestions =>
      'Show external content in suggestions';

  @override
  String get adminLibDateAddedSection => 'Date added behavior';

  @override
  String get adminLibDateAddedLabel => 'Use date added from';

  @override
  String get adminLibDateAddedImport => 'Date scanned into the library';

  @override
  String get adminLibDateAddedFile => 'Date the file was created';

  @override
  String get adminLibMetadataTitle => 'Metadata and Images';

  @override
  String get adminLibMetadataLangSection => 'Preferred metadata language';

  @override
  String get adminLibChaptersSection => 'Chapters';

  @override
  String get adminLibDummyChapterDuration => 'Dummy chapter duration (seconds)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Length of chapters generated for media that has none. Set to 0 to disable.';

  @override
  String get adminLibChapterImageResolution => 'Chapter image resolution';

  @override
  String get adminLibNfoTitle => 'NFO Settings';

  @override
  String get adminLibNfoHelp =>
      'NFO metadata is compatible with Kodi and similar clients. Settings apply to all libraries that save NFO metadata.';

  @override
  String get adminLibKodiUser => 'User to store watch data for in NFO files';

  @override
  String get adminLibSaveImagePaths => 'Save image paths within NFO files';

  @override
  String get adminLibPathSubstitution =>
      'Enable path substitution for NFO image paths';

  @override
  String get adminLibExtraThumbs =>
      'Copy extrafanart images into an extrathumbs folder';

  @override
  String get adminLibNone => 'None';

  @override
  String adminLibRefreshDays(int days) {
    return '$days days';
  }

  @override
  String get adminLibEmbeddedTitles => 'Use embedded titles';

  @override
  String get adminLibEmbeddedExtrasTitles => 'Use embedded titles for extras';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Use embedded episode information';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Allow embedded subtitles';

  @override
  String get adminLibEmbeddedAllowAll => 'Allow all';

  @override
  String get adminLibEmbeddedAllowText => 'Text only';

  @override
  String get adminLibEmbeddedAllowImage => 'Image only';

  @override
  String get adminLibEmbeddedAllowNone => 'None';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Skip download if embedded subtitles are present';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Skip download if the audio track matches the download language';

  @override
  String get adminLibRequirePerfectMatch => 'Require a perfect subtitle match';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Save subtitles into media folders';

  @override
  String get adminLibChapterImageExtraction => 'Extract chapter images';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extract chapter images during the library scan';

  @override
  String get adminLibTrickplayExtraction => 'Enable trickplay image extraction';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extract trickplay images during the library scan';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Save trickplay images into media folders';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automatically merge series that are spread across multiple folders';

  @override
  String get adminLibSeasonZeroName => 'Season zero display name';

  @override
  String get adminLibLufsScan => 'Enable LUFS scan for audio normalization';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Prefer non-standard artists tag';

  @override
  String get adminLibAutoAddToCollection =>
      'Automatically add movies to collections';

  @override
  String get adminLibraryNameRequired => 'Zahtevano je ime knjižnice';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Ime knjižnice';

  @override
  String get adminSelectedPaths => 'Izbrane poti:';

  @override
  String get adminNoPathsAdded => 'Ni dodanih poti (lahko jih dodate pozneje)';

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
  String get adminUsersLoadFailed => 'Uporabnikov ni bilo mogoče naložiti';

  @override
  String get adminSearchUsers => 'Iskanje uporabnikov';

  @override
  String get adminEditUser => 'Uredi uporabnika';

  @override
  String get adminAddUser => 'Dodaj uporabnika';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Ustvari uporabnika';

  @override
  String get adminPasswordOptional => 'Geslo (neobvezno)';

  @override
  String get adminUsernameRequired => 'Uporabniško ime ne sme biti prazno';

  @override
  String get adminNoProfileChanges => 'Ni sprememb profila za shranjevanje';

  @override
  String get adminProfileSaved => 'Profil shranjen';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Dovoljenja shranjena';

  @override
  String get adminPasswordsMismatch => 'Gesli se ne ujemata';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Uporabnika ni bilo mogoče naložiti';

  @override
  String get adminBackToUsers => 'Nazaj na Uporabniki';

  @override
  String get adminSaveProfile => 'Shrani profil';

  @override
  String get adminDeleteUser => 'Izbriši uporabnika';

  @override
  String get admin => 'skrbnik';

  @override
  String get adminFullAccessWarning =>
      'Administratorji imajo popoln dostop do strežnika. Dodelite previdno.';

  @override
  String get administrator => 'Administrator';

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
  String get adminAllowContentDeletion => 'Dovoli brisanje vsebine';

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
  String get adminRemoteBitrateLimit =>
      'Omejitev bitne hitrosti oddaljenega odjemalca (bps)';

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
  String get adminSavePermissions => 'Shrani dovoljenja';

  @override
  String get adminEnableAllLibraryAccess => 'Omogoči dostop do vseh knjižnic';

  @override
  String get adminSaveAccess => 'Shrani dostop';

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
  String get adminDeviceAndChannelAccess => 'Dostop do naprave in kanala';

  @override
  String get adminEnableAllDevices => 'Omogoči dostop do vseh naprav';

  @override
  String get adminEnableAllChannels => 'Omogoči dostop do vseh kanalov';

  @override
  String get adminParentalControl => 'Parental Control';

  @override
  String get adminMaxParentalRating => 'Maximum allowed parental rating';

  @override
  String get adminMaxParentalRatingHint =>
      'Content with a higher rating will be hidden from this user.';

  @override
  String get adminParentalRatingNone => 'None';

  @override
  String get adminBlockUnratedItems =>
      'Block items with no or unrecognized rating information';

  @override
  String get adminUnratedBook => 'Books';

  @override
  String get adminUnratedChannelContent => 'Channels';

  @override
  String get adminUnratedLiveTvChannel => 'Live TV';

  @override
  String get adminUnratedMovie => 'Movies';

  @override
  String get adminUnratedMusic => 'Music';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Shows';

  @override
  String get adminAccessSchedules => 'Access Schedules';

  @override
  String get adminAccessSchedulesHint =>
      'Allow access only during the scheduled times below. Access is allowed all day when no schedule is set.';

  @override
  String get adminAddSchedule => 'Add Schedule';

  @override
  String get adminScheduleDay => 'Day';

  @override
  String get adminScheduleStart => 'Start';

  @override
  String get adminScheduleEnd => 'End';

  @override
  String get adminDayEveryday => 'Every day';

  @override
  String get adminDayWeekday => 'Weekday';

  @override
  String get adminDayWeekend => 'Weekend';

  @override
  String get adminDaySunday => 'Sunday';

  @override
  String get adminDayMonday => 'Monday';

  @override
  String get adminDayTuesday => 'Tuesday';

  @override
  String get adminDayWednesday => 'Wednesday';

  @override
  String get adminDayThursday => 'Thursday';

  @override
  String get adminDayFriday => 'Friday';

  @override
  String get adminDaySaturday => 'Saturday';

  @override
  String get adminAllowedTags => 'Allowed tags';

  @override
  String get adminAllowedTagsHint =>
      'Only content with these tags is shown. Leave empty to allow all.';

  @override
  String get adminBlockedTags => 'Blocked tags';

  @override
  String get adminBlockedTagsHint =>
      'Content with these tags is hidden from this user.';

  @override
  String get adminAddTag => 'Add tag';

  @override
  String get adminEnabledDevices => 'Enabled devices';

  @override
  String get adminEnabledChannels => 'Enabled channels';

  @override
  String get adminAuthProvider => 'Authentication provider';

  @override
  String get adminPasswordResetProvider => 'Password reset provider';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maximum failed login attempts before lockout';

  @override
  String get adminLoginAttemptsHint =>
      'Set to 0 for the default, or -1 to disable lockout.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay access';

  @override
  String get adminSyncPlayCreateAndJoin => 'Allow creating and joining groups';

  @override
  String get adminSyncPlayJoin => 'Allow joining groups';

  @override
  String get adminSyncPlayNone => 'No access';

  @override
  String get adminContentDeletionFolders => 'Allow content deletion from';

  @override
  String get adminResetPasswordWarning =>
      'To bo odstranilo geslo. Uporabnik se bo lahko prijavil brez gesla.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'V odgovoru strežnika manjka žeton ključa';

  @override
  String get adminRevokeApiKey => 'Prekliči ključ API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Ključ API preklican';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Create Backup';

  @override
  String get adminBackupInclude => 'Choose what to include in the backup.';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Always included';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Subtitles';

  @override
  String get adminBackupTrickplay => 'Trickplay images';

  @override
  String get adminCreatingBackup => 'Ustvarjanje varnostne kopije ...';

  @override
  String get adminBackupCreated =>
      'Varnostna kopija je bila uspešno ustvarjena';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
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
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Potrdite obnovitev';

  @override
  String get adminRestoringBackup => 'Obnavljanje varnostne kopije ...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Iskanje v dnevniku';

  @override
  String get adminNoMatchingLines => 'Ni ustreznih vrstic';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Ni načrtovanih opravil';

  @override
  String get adminNoTasksMatchFilter =>
      'Nobeno opravilo se ne ujema s trenutnim filtrom';

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
  String get adminRunNow => 'Zaženi zdaj';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
  String get adminTimeLimit => 'Časovna omejitev (neobvezno)';

  @override
  String get adminNoLimit => 'Brez omejitev';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Dan v tednu';

  @override
  String get adminSearchPlugins => 'Iskanje vtičnikov ...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Odstrani vtičnik';

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
      'Noben vtičnik ne ustreza vašemu iskanju';

  @override
  String get adminNoPluginsInstalled => 'Ni nameščenih vtičnikov';

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
      'Ni mogoče odpreti nastavitev: manjka žeton za preverjanje avtorizacije.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Vtičnika ni bilo mogoče najti';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'npr. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL skladišča';

  @override
  String get adminAddEntry => 'Dodaj vnos';

  @override
  String get adminInvalidUrl => 'Neveljaven URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminBrandingSaved => 'Nastavitve blagovne znamke so shranjene';

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
  String get adminStreamingSaved => 'Nastavitve pretakanja so shranjene';

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
  String get adminPlaybackSaved => 'Nastavitve predvajanja so shranjene';

  @override
  String get adminPlaybackLoadFailed =>
      'Nalaganje nastavitev predvajanja ni uspelo';

  @override
  String get adminPlaybackTranscoding => 'Predvajanje/prekodiranje';

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
  String get adminTrickplaySaved => 'Nastavitve Trickplay so shranjene';

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
  String get adminResumeSaved => 'Nastavitve nadaljevanja so shranjene';

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
  String get adminNetworkingSaved =>
      'Omrežne nastavitve so shranjene. Morda bo potreben ponovni zagon strežnika.';

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
  String get adminBaseUrlHint => 'npr. /želefina';

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
  String get adminMetadataSaved => 'Metapodatki shranjeni';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Osveži metapodatke';

  @override
  String get recursive => 'Rekurzivno';

  @override
  String get adminReplaceAllMetadata => 'Zamenjaj vse metapodatke';

  @override
  String get adminReplaceAllImages => 'Zamenjaj vse slike';

  @override
  String get adminMetadataRefreshRequested =>
      'Zahtevana je osvežitev metapodatkov';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
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
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Posodobi vrsto vsebine';

  @override
  String get adminContentType => 'Vrsta vsebine';

  @override
  String get adminContentTypeUpdated => 'Vrsta vsebine posodobljena';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nepodprt format slike';

  @override
  String get adminImageReadFailed => 'Izbrane slike ni bilo mogoče prebrati';

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
  String get adminAllProviders => 'Vsi ponudniki';

  @override
  String get adminNoRemoteImages => 'Ni oddaljenih slik';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Dodaj sprejemnik';

  @override
  String get adminTunerType => 'Vrsta sprejemnika';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, drugo';

  @override
  String get adminUrlPath => 'URL/pot';

  @override
  String get adminNameOptional => 'Ime (neobvezno)';

  @override
  String get adminTunerAdded => 'Sprejemnik dodan';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Dodaj ponudnika vodnika';

  @override
  String get adminProviderType => 'Vrsta ponudnika';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect ali XMLTV';

  @override
  String get adminUsernameOptional => 'uporabniško ime (neobvezno)';

  @override
  String get adminRefreshInterval => 'Interval osveževanja (ure)';

  @override
  String get adminProviderAdded => 'Ponudnik dodan';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Zahtevana ponastavitev sprejemnika';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'This tuner type does not support resetting.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Nastavitve snemanja';

  @override
  String get adminPrePadding => 'Predhodno oblazinjenje (minute)';

  @override
  String get adminPostPadding => 'Naknadno polnjenje (minute)';

  @override
  String get adminRecordingPath => 'Snemalna pot';

  @override
  String get adminSeriesRecordingPath => 'Pot snemanja serije';

  @override
  String get adminMovieRecordingPath => 'Movie recording path';

  @override
  String get adminGuideDays => 'Guide data days';

  @override
  String get adminGuideDaysAuto => 'Automatic';

  @override
  String adminGuideDaysValue(int days) {
    return '$days days';
  }

  @override
  String get adminRecordingPostProcessor => 'Post-processing application path';

  @override
  String get adminRecordingPostProcessorArgs => 'Post-processor arguments';

  @override
  String get adminSaveRecordingNfo => 'Save recording NFO metadata';

  @override
  String get adminSaveRecordingImages => 'Save recording images';

  @override
  String get adminLiveTvSectionTiming => 'Timing';

  @override
  String get adminLiveTvSectionPaths => 'Recording paths';

  @override
  String get adminLiveTvSectionPostProcessing => 'Post-processing';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Guide data: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Nastavitve snemanja so shranjene';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Nastavite preslikave kanalov';

  @override
  String get adminMappingJson => 'Preslikava JSON';

  @override
  String get adminMappingJsonHint =>
      'Primer: preslikave koristnega tovora JSON';

  @override
  String get adminChannelMappingsUpdated => 'Preslikave kanalov posodobljene';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
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
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'Dodaj ponudnika';

  @override
  String get adminNoListingProviders => 'Konfiguriran ni noben ponudnik vnosov';

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
  String get adminChannelMappings => 'Preslikave kanalov';

  @override
  String get adminNoDiscoveredTuners => 'Ni še nobenega odkritega sprejemnika';

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
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Zahtevana je obnovitev. Ponovni zagon strežnika lahko prekine to sejo.';

  @override
  String get adminBackupsTitle => 'Varnostne kopije';

  @override
  String get adminUnknownDate => 'Neznan datum';

  @override
  String get adminUnnamedBackup => 'Neimenovana varnostna kopija';

  @override
  String get adminLiveTvNotAvailable =>
      'Skrbništvo TV v živo ni na voljo v tej zgradbi strežnika.';

  @override
  String get adminLiveTvTitle => 'Administracija televizije v živo';

  @override
  String get adminApply => 'Prijavite se';

  @override
  String get adminNotSet => 'Ni nastavljeno';

  @override
  String get adminReset => 'Ponastavi';

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
  String get adminLogViewerNoMatches => 'Ni ustreznih vrstic';

  @override
  String get adminMetadataEditorTitle => 'Urejevalnik metapodatkov';

  @override
  String get adminMetadataIdentify => 'Identify';

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
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Pregled';

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
  String get adminMetadataRecursive => 'Rekurzivno';

  @override
  String get adminMetadataProvider => 'Ponudnik';

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
      'Izbrane slike ni bilo mogoče prebrati';

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
      'S tem odstranite trenutno sliko iz predmeta.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
  String get adminPluginsNoSearchResults =>
      'Noben vtičnik ne ustreza vašemu iskanju';

  @override
  String get adminPluginsNoneInstalled => 'Ni nameščenih vtičnikov';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Noben paket ne ustreza vašemu iskanju';

  @override
  String get adminPluginsCatalogEmpty => 'Na voljo ni nobenih paketov';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Odstrani repozitorij';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Odstrani';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminNetworkingRemoteAccess => 'Omogoči oddaljeni dostop';

  @override
  String get adminNetworkingPorts => 'Pristanišča';

  @override
  String get adminNetworkingHttpPort => 'HTTP vrata';

  @override
  String get adminNetworkingHttpsPort => 'vrata HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Omogoči HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Lokalno omrežje';

  @override
  String get adminNetworkingLocalAddresses => 'Naslovi lokalnega omrežja';

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
  String get adminBrandingSplashUpload => 'Upload image';

  @override
  String get adminBrandingSplashUploaded => 'Splashscreen updated';

  @override
  String get adminBrandingSplashUploadFailed => 'Failed to upload splashscreen';

  @override
  String get adminBrandingSplashDeleted => 'Splashscreen removed';

  @override
  String get adminBrandingNoSplash => 'No custom splashscreen';

  @override
  String get adminPlaybackHwAccel => 'Strojni pospešek';

  @override
  String get adminPlaybackHwAccelLabel => 'Strojno pospeševanje';

  @override
  String get adminPlaybackEnableHwEncoding => 'Omogoči strojno kodiranje';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Omogoči dekodiranje strojne opreme za:';

  @override
  String get adminPlaybackQsvDevice => 'QSV device';

  @override
  String get adminPlaybackEnhancedNvdec => 'Enable enhanced NVDEC decoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Prefer system native hardware decoder';

  @override
  String get adminPlaybackColorDepth => 'Hardware decoding color depth';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC decoding';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 decoding';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-bit decoding';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit decoding';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardware encoding';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Allow HEVC encoding';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Allow AV1 encoding';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Enable Intel low-power H.264 encoder';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Enable Intel low-power HEVC encoder';

  @override
  String get adminPlaybackToneMapping => 'Tone Mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Enable tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Enable VPP tone mapping';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Enable VideoToolbox tone mapping';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Tone mapping algorithm';

  @override
  String get adminPlaybackTonemappingMode => 'Tone mapping mode';

  @override
  String get adminPlaybackTonemappingRange => 'Tone mapping range';

  @override
  String get adminPlaybackTonemappingDesat => 'Tone mapping desaturation';

  @override
  String get adminPlaybackTonemappingPeak => 'Tone mapping peak';

  @override
  String get adminPlaybackTonemappingParam => 'Tone mapping parameter';

  @override
  String get adminPlaybackPresetsQuality => 'Presets & Quality';

  @override
  String get adminPlaybackEncoderPreset => 'Encoder preset';

  @override
  String get adminPlaybackH264Crf => 'H.264 encoding CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) encoding CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deinterlace method';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Enable audio VBR encoding';

  @override
  String get adminPlaybackDownmixBoost => 'Audio downmix boost';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo downmix algorithm';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Max muxing queue size';

  @override
  String get adminPlaybackAutoOption => 'Auto';

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
  String get adminResumeMinAudiobookPct =>
      'Najmanjši odstotek nadaljevanja zvočne knjige';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Največji odstotek nadaljevanja zvočne knjige';

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
  String get adminTaskStop => 'Stop';

  @override
  String get adminRunningTasks => 'Running Tasks';

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
  String get adminTaskTriggerEvery6Hours => 'Vsakih 6 ur';

  @override
  String get adminTaskTriggerEvery12Hours => 'Vsakih 12 ur';

  @override
  String get adminTaskTriggerEvery24Hours => 'Vsakih 24 ur';

  @override
  String get adminTaskTriggerEvery2Days => 'Vsaka 2 dni';

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
  String get adminTaskTriggerTime => 'Čas';

  @override
  String get adminTaskTriggerNoLimit => 'Brez omejitev';

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
  String get adminActivityNow => 'zdaj';

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
      'Konfigurirajte generiranje slike trickplay za sličice predogleda iskanja.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Javna vrata HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Osnovni URL';

  @override
  String get adminNetworkingBaseUrlHint => 'npr. /želefina';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Public HTTP port';

  @override
  String get adminNetworkingRequireHttps => 'Require HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirect all remote requests to HTTPS. Has no effect if the server has no valid certificate.';

  @override
  String get adminNetworkingCertPassword => 'Certificate password';

  @override
  String get adminNetworkingIpSettings => 'IP Settings';

  @override
  String get adminNetworkingEnableIpv4 => 'Enable IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Enable IPv6';

  @override
  String get adminNetworkingAutoDiscovery => 'Enable automatic port mapping';

  @override
  String get adminNetworkingLocalSubnets => 'LAN networks';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Comma or line separated list of IP addresses or CIDR subnets treated as being on the local network.';

  @override
  String get adminNetworkingPublishedUris => 'Published server URIs';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Map a subnet or address to a published URL, e.g. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Pot potrdila';

  @override
  String get adminNetworkingRemoteIpFilter => 'Oddaljeni IP filter';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Prag počasnega odziva (ms)';

  @override
  String get adminGeneralEnableSlowResponse => 'Enable slow response warnings';

  @override
  String get adminGeneralQuickConnect => 'Enable Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Paths';

  @override
  String get adminGeneralSectionPerformance => 'Performance';

  @override
  String get adminGeneralCachePath => 'Pot predpomnilnika';

  @override
  String get adminGeneralMetadataPath => 'Pot do metapodatkov';

  @override
  String get adminGeneralServerName => 'Ime strežnika';

  @override
  String get adminSettingsLoadFailed => 'Nastavitev ni bilo mogoče naložiti';

  @override
  String get adminDiscover => 'Odkrij';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Dostop do SyncPlay zavrnjen';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nimate dostopa do enega ali več elementov v tej skupini SyncPlay. Prosite lastnika skupine, da preveri dovoljenja za knjižnico, ali izberite drugo čakalno vrsto.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
      other: '# rows discovered',
      one: '# row discovered',
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
  String get offlineSwitchServer => 'Switch Server';

  @override
  String get offlineSavedMedia => 'Shranjeni mediji';

  @override
  String get offlineBannerTitle => 'You\'re offline';

  @override
  String get offlineBannerSubtitle => 'Showing your downloads';

  @override
  String get offlineBannerAction => 'Downloads';

  @override
  String get serverUnreachableBannerTitle => 'Can\'t reach your server';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Playing from downloads until it\'s back';

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
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Glasnost naprave';

  @override
  String get castVolumeUnavailable => 'Ni na voljo';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Napačen PIN';

  @override
  String get pinMismatch => 'PIN-a se ne ujemata';

  @override
  String get pinForgot => 'Ste pozabili PIN?';

  @override
  String get pinClear => 'jasno';

  @override
  String get pinBackspace => 'vračalka';

  @override
  String get quickConnectAuthorized => 'Zahteva za hitro povezavo je odobrena.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Koda za hitro povezavo je neveljavna ali potekla.';

  @override
  String get quickConnectNotSupported =>
      'Hitra povezava ni podprta na tem strežniku.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Kode za hitro povezavo ni bilo mogoče avtorizirati.';

  @override
  String get quickConnectDisabled =>
      'Hitra povezava je na tem strežniku onemogočena.';

  @override
  String get quickConnectForbidden =>
      'Vaš račun ne more odobriti te zahteve za hitro povezavo.';

  @override
  String get quickConnectNotFound =>
      'Kode za hitro povezavo ni bilo mogoče najti. Poskusi z novo kodo.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Vnesite kodo';

  @override
  String get quickConnectAuthorize => 'Pooblasti';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
  String get stillWatchingStop => 'Stop';

  @override
  String get stillWatchingContinue => 'Nadaljuj';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'TV v živo';

  @override
  String get continueWatchingAndNextUp => 'Nadaljuj z ogledom in naprej';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get playerTooltipPrevious => 'Prejšnja';

  @override
  String get playerTooltipSeekBack => 'Išči nazaj';

  @override
  String get playerTooltipSeekForward => 'Išči naprej';

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
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

  @override
  String get settingsAdministrationSubtitle =>
      'Dostop do skrbniške plošče strežnika';

  @override
  String get settingsAccountSecurity => 'Račun in varnost';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Preverjanje pristnosti, koda PIN in starševski nadzor';

  @override
  String get settingsPersonalization => 'Personalizacija';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigacija, domače vrstice in vidnost knjižnice';

  @override
  String get settingsDynamicContent => 'Dinamična vsebina';

  @override
  String get settingsDynamicContentSubtitle =>
      'Medijska vrstica in vizualni prekrivki';

  @override
  String get settingsPlaybackSyncplay => 'Predvajanje in SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Avdio/video nastavitve, podnapisi, prenosi in kontrolniki SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sinhronizacija vtičnikov, Seerr, ocene in drugo';

  @override
  String get settingsAboutSubtitle =>
      'Različica aplikacije, pravne informacije in krediti';

  @override
  String get settingsAuthenticationSection => 'AVTENTIKACIJA';

  @override
  String get settingsSortServersBy => 'Razvrsti strežnike po';

  @override
  String get settingsLastUsed => 'Nazadnje uporabljeno';

  @override
  String get settingsAlphabetical => 'Abecedno';

  @override
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => 'ZASEBNOST IN VARNOST';

  @override
  String get settingsBlockedRatings => 'Blokirane ocene';

  @override
  String get settingsGeneralStyle => 'Splošni slog';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Tematski poudarki, ozadja, indikatorji gledanja in tematska glasba';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

  @override
  String get settingsHomePage => 'Domača stran';

  @override
  String get settingsHomePageSubtitle =>
      'Razdelki, vrste slik, prekrivni elementi in predogledi medijev';

  @override
  String get settingsLibrariesSubtitle =>
      'Vidnost knjižnice, pogled mape in večstrežniško delovanje';

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
  String get settingsShowLibrariesButtonInNavigation =>
      'Prikažite gumb za knjižnice v navigacijski vrstici';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

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
  String get settingsMetadataAndRatings => 'Metapodatki in ocene';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase omogoča integracije na strani strežnika, vključno z dodatnimi viri ocen, zahtevami Seerr in sinhroniziranimi nastavitvami.';

  @override
  String get settingsOfflineDownloads => 'Prenosi brez povezave';

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
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

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
  String get settingsPoweredByFlutter => 'Poganja Flutter';

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
  String get settingsBoth => 'Oba';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Filter vrste vsebine naključno';

  @override
  String get settingsVideoPlaybackPreferences => 'Nastavitve predvajanja videa';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Osnovni video motor in nastavitve kakovosti pretakanja';

  @override
  String get settingsAudioPreferences => 'Nastavitve zvoka';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Možnosti zvočnih posnetkov, obdelave in prehoda';

  @override
  String get settingsAutomationAndQueue => 'Avtomatizacija in čakalna vrsta';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Avtomatizirano predvajanje in zaporedje';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Kakovost prenosa, omejitve prostora za shranjevanje in velikost čakalne vrste';

  @override
  String get settingsSyncplaySubtitle =>
      'Logika sinhronizacije za skupinske seje';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Posebne funkcije predvajalnika. Uporabljajte previdno, saj lahko nekatere možnosti povzročijo težave pri predvajanju';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Preskočiti uvodne in končne elemente?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (podedovano)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
  String get settingsCinemaMode => 'Cinema Mode';

  @override
  String get settingsCinemaModeSubtitle =>
      'Predvajajte napovednike/predstave pred glavno funkcijo';

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
  String get layout => 'Layout';

  @override
  String get theme => 'Theme';

  @override
  String get keyboard => 'Keyboard';

  @override
  String get navButtons => 'Buttons';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'MPV configuration';

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
  String get audiobookChapters => 'Chapters';

  @override
  String get audiobookBookmarks => 'Bookmarks';

  @override
  String get audiobookNotes => 'Notes';

  @override
  String get audiobookQueue => 'Queue';

  @override
  String get audiobookTimeline => 'Timeline';

  @override
  String get audiobookTimelineEmpty => 'Timeline is empty';

  @override
  String get audiobookWholeBook => 'Whole Book';

  @override
  String get audiobookFocusedTimeline => 'Focused Timeline';

  @override
  String get audiobookExportBookmarks => 'Export Bookmarks';

  @override
  String get audiobookExportNotes => 'Export Notes';

  @override
  String get audiobookExportAll => 'Export All';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exported to $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String get audiobookLyrics => 'Lyrics';

  @override
  String get audiobookAddBookmark => 'Add bookmark';

  @override
  String get audiobookAddNote => 'Add note';

  @override
  String get audiobookEditNote => 'Edit note';

  @override
  String get audiobookNoteHint => 'Write a note for this moment';

  @override
  String get audiobookSleepTimer => 'Sleep timer';

  @override
  String get audiobookSleepOff => 'Off';

  @override
  String get audiobookSleepEndOfChapter => 'End of chapter';

  @override
  String get audiobookSleepCustom => 'Custom';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining left';
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
  String get audiobookPlaybackSpeed => 'Playback speed';

  @override
  String get audiobookRemainingTime => 'Remaining';

  @override
  String get audiobookElapsedTime => 'Elapsed';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Back ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Forward ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Previous chapter';

  @override
  String get audiobookNextChapter => 'Next chapter';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Chapter $current of $total';
  }

  @override
  String get audiobookNoChapters => 'No chapters';

  @override
  String get audiobookNoBookmarks => 'No bookmarks yet';

  @override
  String get audiobookNoNotes => 'No notes yet';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Bookmark added at $position';
  }

  @override
  String get audiobookSpeedReset => 'Reset to 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Save';

  @override
  String get audiobookCancel => 'Cancel';

  @override
  String get audiobookDelete => 'Delete';

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
  String get externalLists => 'External Lists';

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

  @override
  String get impellerRendering => 'Rendering engine (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller is Flutter\'s modern GPU renderer for smoother animations and less stutter. On some TV boxes and older GPUs it can cause glitches or black video; switch it Off if you see those. Automatic picks the best default for your device. Restart Moonfin to apply.';

  @override
  String get impellerAuto => 'Automatic';

  @override
  String get impellerOn => 'On';

  @override
  String get impellerOff => 'Off';

  @override
  String get impellerRestartTitle => 'Restart required';

  @override
  String get impellerRestartMessage =>
      'Moonfin needs to restart to change the rendering engine. Close the app now, then reopen it to apply.';

  @override
  String get impellerCloseNow => 'Close app now';

  @override
  String get adminRefreshLibrary => 'Refresh Library';

  @override
  String get adminRefreshAllLibraries => 'Refresh All Libraries';

  @override
  String get adminRepoSortDateOldest => 'Date Added (Oldest First)';

  @override
  String get adminRepoSortDateNewest => 'Date Added (Newest First)';

  @override
  String get adminRepoSortNameAsc => 'Alphabetical (A to Z)';

  @override
  String get adminRepoSortNameDesc => 'Alphabetical (Z to A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Loading Server Analytics... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Match source';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 Movies';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 TV Shows';

  @override
  String get imdbMostPopularMovies => 'IMDb Most Popular Movies';

  @override
  String get imdbMostPopularTvShows => 'IMDb Most Popular TV Shows';

  @override
  String get imdbLowestRatedMovies => 'IMDb Lowest Rated Movies';

  @override
  String get imdbTopEnglishMovies => 'IMDb Top Rated English Movies';
}
