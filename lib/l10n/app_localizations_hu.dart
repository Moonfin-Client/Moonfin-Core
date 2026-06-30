// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Holdfin';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'Jelentkezzen be';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Gyors csatlakozás';

  @override
  String get password => 'Jelszó';

  @override
  String get username => 'Felhasználónév';

  @override
  String get email => 'Email';

  @override
  String get quickConnectInstruction =>
      'Írja be ezt a kódot szervere webes irányítópultján:';

  @override
  String get waitingForAuthorization => 'Várakozás az engedélyezésre...';

  @override
  String get back => 'Vissza';

  @override
  String get serverUnavailable => 'A szerver nem elérhető';

  @override
  String get loginFailed => 'Sikertelen bejelentkezés';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Ki figyel?';

  @override
  String get addUser => 'Felhasználó hozzáadása';

  @override
  String get selectServer => 'Válassza a Szerver lehetőséget';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Mentett szerverek';

  @override
  String get discoveredServers => 'Felfedezett szerverek';

  @override
  String get noneFound => 'Egyik sem található';

  @override
  String get unableToConnectToServer => 'Nem lehet csatlakozni a szerverhez';

  @override
  String get addServer => 'Szerver hozzáadása';

  @override
  String get embyConnect => 'Emby Csatlakozás';

  @override
  String get removeServer => 'Szerver eltávolítása';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Mégsem';

  @override
  String get remove => 'Távolítsa el';

  @override
  String get connectToServer => 'Csatlakozás a szerverhez';

  @override
  String get serverAddress => 'Szerver címe';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Csatlakozás';

  @override
  String get secureStorageUnavailable => 'Biztonságos tárhely nem érhető el';

  @override
  String get secureStorageUnavailableMessage =>
      'A Moonfin nem tudott hozzáférni a rendszer kulcstartójához. A bejelentkezés folytatódhat, de előfordulhat, hogy a biztonságos tokentároló nem érhető el, amíg a kulcstartót fel nem oldják.';

  @override
  String get ok => 'RENDBEN';

  @override
  String get settingsAppearanceTheme => 'App téma';

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
      'Váltson a Moonfin és a Neon Pulse között az alkalmazás újraindítása nélkül';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Holdfin';

  @override
  String get themeMoonfinSubtitle =>
      'A Moonfin jelenlegi megjelenése, amelyet mindannyian megszerettek';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stílus bíbor fénnyel, ciánkék szöveggel és erősebb króm kontraszttal';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get embyConnectSignInSubtitle =>
      'Jelentkezzen be Emby Connect fiókjával';

  @override
  String get emailOrUsername => 'E-mail vagy Felhasználónév';

  @override
  String get selectAServer => 'Válasszon ki egy szervert';

  @override
  String get tryAgain => 'Próbáld újra';

  @override
  String get noLinkedServers =>
      'Ehhez az Emby Connect fiókhoz nem kapcsolódnak szerverek';

  @override
  String get invalidEmbyConnectCredentials =>
      'Érvénytelen Emby Connect hitelesítési adatok';

  @override
  String get invalidEmbyConnectLogin =>
      'Érvénytelen Emby Connect felhasználónév vagy jelszó';

  @override
  String get embyConnectExchangeNotSupported =>
      'A szerver nem támogatja az Emby Connect cserét';

  @override
  String get embyConnectNetworkError =>
      'Hálózati hiba az Emby Connect vagy a kiválasztott szerver kapcsolatfelvétele közben';

  @override
  String get loadingLinkedServers => 'Összekapcsolt szerverek betöltése...';

  @override
  String get connectingToServerEllipsis => 'Csatlakozás a szerverhez...';

  @override
  String get noReachableAddress => 'Nincs elérhető cím';

  @override
  String get invalidServerExchangeResponse =>
      'Érvénytelen válasz a szervercsere-végponttól';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Kilép a Moonfinből?';

  @override
  String get exitAppConfirmation => 'Biztos, hogy ki akar lépni?';

  @override
  String get exit => 'Kijárat';

  @override
  String get noHomeRowsLoaded => 'Egyetlen kezdősor sem tölthető be';

  @override
  String get noHomeRowsHint =>
      'Próbálja meg frissíteni vagy csökkenteni az aktív otthoni részeket.';

  @override
  String get retryHomeRows => 'Próbálja újra a kezdősorokat';

  @override
  String get guide => 'Útmutató';

  @override
  String get recordings => 'Felvételek';

  @override
  String get schedule => 'Menetrend';

  @override
  String get series => 'Sorozat';

  @override
  String get noItemsFound => 'Nem található elemek';

  @override
  String get home => 'Otthon';

  @override
  String get browseAll => 'Tallózás az összesben';

  @override
  String get genres => 'Műfajok';

  @override
  String get collectionPlaceholder => 'Itt jelennek meg a gyűjtemény elemei';

  @override
  String get browseByLetter => 'Böngésszen betű szerint';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Itt jelenik meg az ábécé szerinti böngészés';

  @override
  String get suggestions => 'Javaslatok';

  @override
  String get suggestionsPlaceholder => 'A javasolt elemek itt jelennek meg';

  @override
  String get failedToLoadLibraries => 'Nem sikerült betölteni a könyvtárakat';

  @override
  String get noLibrariesFound => 'Nem található könyvtár';

  @override
  String get library => 'Könyvtár';

  @override
  String get displaySettings => 'Megjelenítési beállítások';

  @override
  String get allGenres => 'Minden műfaj';

  @override
  String get noGenresFound => 'Nem található műfaj';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ez a mappa üres';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Nem sikerült betölteni a kedvenceket';

  @override
  String get retry => 'Próbálja újra';

  @override
  String get noFavoritesYet => 'Még nincs kedvenc';

  @override
  String get favorites => 'Kedvencek';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Folytatás';

  @override
  String get ended => 'Véget ért';

  @override
  String get sortAndFilter => 'Rendezés és szűrés';

  @override
  String get type => 'Írja be';

  @override
  String get sortBy => 'Rendezés alapja';

  @override
  String get display => 'Kijelző';

  @override
  String get imageType => 'Kép típusa';

  @override
  String get posterSize => 'Poszter mérete';

  @override
  String get small => 'Kicsi';

  @override
  String get medium => 'Közepes';

  @override
  String get large => 'Nagy';

  @override
  String get extraLarge => 'Extra nagy';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Nézetek';

  @override
  String get albums => 'Albumok';

  @override
  String get albumArtists => 'Album előadói';

  @override
  String get artists => 'Művészek';

  @override
  String get bookmarks => 'Könyvjelzők';

  @override
  String get noSavedBookmarks =>
      'Ehhez a címhez még nincsenek mentett könyvjelzők.';

  @override
  String get openBook => 'Nyissa meg a Könyvet';

  @override
  String get chapter => 'Fejezet';

  @override
  String get page => 'oldal';

  @override
  String get bookmark => 'Könyvjelző';

  @override
  String get justNow => 'Éppen most';

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
  String get discoverySubjects => 'Felfedezési alanyok';

  @override
  String get pickDiscoverySubjects =>
      'Válassza ki, hogy mely tárgyhírcsatornák jelenjenek meg a Discoverben.';

  @override
  String get apply => 'Alkalmazni';

  @override
  String get openLink => 'Link megnyitása';

  @override
  String get scanWithYourPhone => 'Szkennelés a telefonnal';

  @override
  String get audiobookGenres => 'Hangoskönyv műfajok';

  @override
  String get pickAudiobookGenres =>
      'Válassza ki, mely műfajokat szeretné megjeleníteni a Hangoskönyv Discoverben.';

  @override
  String get discoverAudiobooks => 'Fedezze fel a hangoskönyveket';

  @override
  String get librivoxDescription =>
      'Népszerű nyilvános címek a következőtől: LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Görgessen balra';

  @override
  String get scrollRight => 'Görgessen jobbra';

  @override
  String get couldNotLoadGenre =>
      'Jelenleg nem sikerült betölteni ezt a műfajt.';

  @override
  String get continueReading => 'Olvasás folytatása';

  @override
  String get savedHighlights => 'Mentett kiemelések';

  @override
  String get continueListening => 'Hallgassa tovább';

  @override
  String get listen => 'Hallgat';

  @override
  String get resume => 'Folytatás';

  @override
  String get failedToLoadLibrary => 'Nem sikerült betölteni a könyvtárat';

  @override
  String get popularNow => 'Most népszerű';

  @override
  String get savedForLater => 'Későbbre mentve';

  @override
  String get topListens => 'Top Listens';

  @override
  String get unreadDiscoveries => 'Olvasatlan felfedezések';

  @override
  String get pickUpAgain => 'Vedd fel újra';

  @override
  String get bookHighlightsDescription =>
      'Könyvei kiemeléseket, kedvenceket vagy olvasási folyamatot.';

  @override
  String get handPickedFromLibrary => 'Kézzel válogatott a könyvtárából.';

  @override
  String get handPickedFromListeningQueue =>
      'Kézzel válogatva a hallgatási sorból.';

  @override
  String get booksWithHighlights =>
      'Könyvek kiemelésekkel, kedvencekkel vagy olvasási folyamattal.';

  @override
  String get jumpBackNarration =>
      'Ugorjon vissza a narrációba anélkül, hogy keresné a helyét.';

  @override
  String get unreadBooksReady =>
      'Olvasatlan könyvek készen állnak a következő csendes órára.';

  @override
  String get quickAccessFavorites =>
      'Gyors hozzáférés a könyvekhez, amelyekhez folyamatosan visszatér.';

  @override
  String get searchAudiobooks => 'Hangoskönyvek keresése';

  @override
  String get searchYourLibrary => 'Keressen a könyvtárában';

  @override
  String get pickUpStory => 'Folytasd a történetet ott, ahol abbahagytad';

  @override
  String get savedPlacesChapters =>
      'Az Ön mentett helyei és befejezetlen fejezetei';

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
  String get readyWhenYouAre => 'Készen állsz, ha vagy';

  @override
  String get details => 'Részletek';

  @override
  String get listeningRoom => 'Hallgatószoba';

  @override
  String get bookmarksAndProgress => 'Könyvjelzők és folyamat';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Címek';

  @override
  String get allTitles => 'Minden cím';

  @override
  String get authors => 'Szerzői';

  @override
  String get browseByAuthor => 'Tallózás szerző szerint';

  @override
  String get browseByGenre => 'Tallózás műfaj szerint';

  @override
  String get discover => 'Fedezze fel';

  @override
  String get trendingTitlesOpenLibrary =>
      'Felkapott címek téma szerint Open Library.';

  @override
  String get noBookmarkedItems =>
      'Még nincsenek könyvjelzővel ellátott tételek';

  @override
  String get nothingMatchesSection =>
      'Ennek a szakasznak még semmi sem egyezik. Próbáljon ki egy másik lapot, vagy térjen vissza a könyvtár szinkronizálása után.';

  @override
  String get audiobooks => 'Hangoskönyvek';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Mappa';

  @override
  String get filters => 'Szűrők';

  @override
  String get readingStatus => 'Olvasási állapot';

  @override
  String get playedStatus => 'Lejátszott állapot';

  @override
  String get readStatus => 'Olvas';

  @override
  String get watched => 'Figyelt';

  @override
  String get unread => 'Nem olvasott';

  @override
  String get unwatched => 'Nézetlen';

  @override
  String get seriesStatus => 'Sorozat állapota';

  @override
  String get allLibraries => 'Minden könyvtár';

  @override
  String get books => 'Könyvek';

  @override
  String get author => 'Szerző';

  @override
  String get unknownAuthor => 'Ismeretlen szerző';

  @override
  String get uncategorized => 'Nincs kategorizálva';

  @override
  String get overview => 'Áttekintés';

  @override
  String get noLibrivoxDescription =>
      'LibriVox még nem adott leírást ehhez a címhez.';

  @override
  String get readers => 'Olvasók';

  @override
  String get openLinks => 'Nyissa meg a hivatkozásokat';

  @override
  String get librivoxPage => 'LibriVox oldal';

  @override
  String get internetArchive => 'Internetes archívum';

  @override
  String get rssFeed => 'RSS Feed';

  @override
  String get downloadZip => 'Letöltés Zip';

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
      'Ehhez a címhez még nem áll rendelkezésre áttekintés a Open Library-tól.';

  @override
  String get subjects => 'Tantárgyak';

  @override
  String get all => 'Minden';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Ez a téma jelenleg nem tölthető be.';

  @override
  String get audiobookDetails => 'Hangoskönyv Részletek';

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
  String get trackList => 'Számlista';

  @override
  String get itemListPlaceholder => 'Itt fog megjelenni a tétellista';

  @override
  String get favoriteTracksPlaceholder => 'A kedvenc számok itt jelennek meg';

  @override
  String get failedToLoad => 'Nem sikerült betölteni';

  @override
  String get delete => 'Töröl';

  @override
  String get save => 'Megtakarítás';

  @override
  String get moreLikeThis => 'Még több ilyen';

  @override
  String get castAndCrew => 'Szereplők és stáb';

  @override
  String get collection => 'Gyűjtemény';

  @override
  String get episodes => 'Epizódok';

  @override
  String get nextUp => 'Következő Fel';

  @override
  String get seasons => 'Évszakok';

  @override
  String get chapters => 'Fejezetek';

  @override
  String get features => 'Jellemzők';

  @override
  String get movies => 'Filmek';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Más';

  @override
  String get discography => 'Diskográfia';

  @override
  String get similarArtists => 'Hasonló művészek';

  @override
  String get tableOfContents => 'Tartalomjegyzék';

  @override
  String get tracklist => 'Tracklist';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Életrajz';

  @override
  String get authorDetails => 'A szerző adatai';

  @override
  String get noOverviewAvailable =>
      'Erről a címről még nem áll rendelkezésre áttekintés.';

  @override
  String get noBiographyAvailable => 'A szerző életrajza nem érhető el.';

  @override
  String get noBooksFound => 'Nem található könyv ehhez a szerzőhöz.';

  @override
  String get unableToLoadAuthorDetails =>
      'Jelenleg nem lehet betölteni a szerző adatait.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'A megjelenés dátuma ismeretlen';

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
  String get view => 'Kilátás';

  @override
  String get resumeReading => 'Olvasás folytatása';

  @override
  String get read => 'Olvas';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Játék';

  @override
  String get startOver => 'Kezdje újra';

  @override
  String get restart => 'Indítsa újra';

  @override
  String get readOffline => 'Offline olvasás';

  @override
  String get playOffline => 'Játssz offline módban';

  @override
  String get audio => 'Hang';

  @override
  String get subtitles => 'Feliratok';

  @override
  String get version => 'Változat';

  @override
  String get cast => 'Öntvény';

  @override
  String get trailer => 'Utánfutó';

  @override
  String get finished => 'Befejezett';

  @override
  String get favorited => 'Kedvenc';

  @override
  String get favorite => 'Kedvenc';

  @override
  String get playlist => 'Lejátszási lista elemre';

  @override
  String get downloaded => 'Letöltve';

  @override
  String get downloadAll => 'Az összes letöltése';

  @override
  String get download => 'Letöltés';

  @override
  String get deleteDownloaded => 'Törlés Letöltött';

  @override
  String get goToSeries => 'Ugrás a sorozathoz';

  @override
  String get editMetadata => 'Metaadatok szerkesztése';

  @override
  String get less => 'Kevesebb';

  @override
  String get more => 'Több';

  @override
  String get deleteItem => 'Elem törlése';

  @override
  String get deletePlaylist => 'Lejátszási lista törlése';

  @override
  String get deletePlaylistMessage =>
      'Törli ezt a lejátszási listát a szerverről?';

  @override
  String get deleteItemMessage => 'Törli ezt az elemet a szerverről?';

  @override
  String get failedToDeletePlaylist =>
      'Nem sikerült törölni a lejátszási listát';

  @override
  String get failedToDeleteItem => 'Nem sikerült törölni az elemet';

  @override
  String get renamePlaylist => 'Lejátszási lista átnevezése';

  @override
  String get playlistName => 'Lejátszási lista neve';

  @override
  String get deleteDownloadedAlbum => 'Letöltött album törlése';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'A letöltött számok törölve';

  @override
  String get downloadedTracksDeleteFailed =>
      'Néhány letöltött zeneszámot nem sikerült törölni';

  @override
  String get noTracksLoaded => 'Nincsenek betöltve számok';

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
  String get itemDeleted => 'Elem törölve';

  @override
  String get noPlayableTrailerFound => 'Nem található lejátszható előzetes.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Hangsáv';

  @override
  String get subtitleTrack => 'Feliratsáv';

  @override
  String get none => 'Egyik sem';

  @override
  String get downloadSubtitlesLabel => 'Feliratok letöltése...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Keresés a OpenSubtitles beépülő modul használatával';

  @override
  String get downloadSubtitles => 'Feliratok letöltése';

  @override
  String get selectedSubtitleInvalid => 'A kiválasztott felirat érvénytelen.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Felirat letöltve. Eltarthat egy ideig, amíg a Jellyfin frissíti az elemet, amíg megjelenik.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Válassza a Verzió lehetőséget';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Az összes letöltése — minőség';

  @override
  String get downloadQuality => 'Letöltés minősége';

  @override
  String get originalFileNoReencoding => 'Eredeti fájl, nincs újrakódolás';

  @override
  String get originalFilesNoReencoding => 'Eredeti fájlok, nincs újrakódolás';

  @override
  String get noEpisodesLoaded => 'Nincsenek betöltve epizódok';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Letöltött fájlok törlése';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'A letöltött fájlok törölve';

  @override
  String get failedToDeleteFiles => 'Nem sikerült törölni a fájlokat';

  @override
  String get deleteFiles => 'Fájlok törlése';

  @override
  String get director => 'IGAZGATÓ';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'ÍRÓK';

  @override
  String get studio => 'STÚDIÓ';

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
  String get showLess => 'Mutass kevesebbet';

  @override
  String get readMore => 'Olvasson tovább';

  @override
  String get shuffle => 'Keverés';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Tökéletes párosítás';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Monó';

  @override
  String get stereo => 'Sztereó';

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
  String get deleteSeasonFiles => 'az összes letöltött epizód ebben az évadban';

  @override
  String get stillWatching => 'Még mindig nézed?';

  @override
  String get unableToLoadTrailerStream =>
      'Nem sikerült betölteni az előzetes adatfolyamot.';

  @override
  String get trailerTimedOut => 'A pótkocsi időtúllépése betöltés közben.';

  @override
  String get playbackFailedForTrailer =>
      'Ennek az előzetesnek a lejátszása nem sikerült.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Az átküldés nem érhető el offline lejátszás közben.';

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
  String get deviceVolume => 'Eszköz hangereje';

  @override
  String get unavailable => 'Nem elérhető';

  @override
  String get pause => 'Szünet';

  @override
  String get syncPosition => 'Szinkronizálási pozíció';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'A sor üres';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Távoli lejátszás';

  @override
  String get castingToGoogleCast => 'Átküldés ide: Google Cast';

  @override
  String get castingViaAirPlay => 'Átküldés a következőn keresztül: AirPlay';

  @override
  String get castingViaDlna => 'Átküldés a következőn keresztül: DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Nyomja meg hosszan a feloldáshoz';

  @override
  String get off => 'Le';

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
  String get bitrateOverride => 'Bitráta felülírása';

  @override
  String get audioDelay => 'Hang késleltetés';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Felirat késleltetése';

  @override
  String get reset => 'Reset';

  @override
  String get unknown => 'Ismeretlen';

  @override
  String get playbackInformation => 'Lejátszási információk';

  @override
  String get playback => 'Lejátszás';

  @override
  String get playMethod => 'Játékmód';

  @override
  String get directPlay => 'Közvetlen lejátszás';

  @override
  String get directStream => 'Közvetlen közvetítés';

  @override
  String get transcoding => 'Átkódolás';

  @override
  String get transcodeReasons => 'Átkódolási okok';

  @override
  String get player => 'Játékos';

  @override
  String get container => 'Tartály';

  @override
  String get bitrate => 'Bitráta';

  @override
  String get video => 'Videó';

  @override
  String get resolution => 'Felbontás';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Videó Bitráta';

  @override
  String get track => 'Pálya';

  @override
  String get channels => 'Csatornák';

  @override
  String get audioBitrate => 'Audio bitráta';

  @override
  String get sampleRate => 'Mintavételi arány';

  @override
  String get format => 'Formátum';

  @override
  String get external => 'Külső';

  @override
  String get embedded => 'Beágyazott';

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
      'Az alkalmazáson belüli EPUB-megjelenítés még nem érhető el ezen a platformon.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'A beágyazott dokumentum-megjelenítés nem érhető el ezen a platformon.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nem sikerült megnyitni a külső megjelenítőt.';

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
      'Még nincsenek könyvjelzők.\nÉrintse meg a könyvjelző ikont olvasás közben a pozíció mentéséhez.';

  @override
  String get noTableOfContentsAvailable => 'Nincs elérhető tartalomjegyzék';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Pozíció';

  @override
  String get bookReader => 'Könyvolvasó';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Frissítés...';

  @override
  String get markUnread => 'Megjelölés olvasatlanként';

  @override
  String get markAsRead => 'Megjelölés olvasottként';

  @override
  String get reloadReader => 'Olvassa újra';

  @override
  String get noPagesFound => 'Nem található oldal.';

  @override
  String get failedToDecodePageImage =>
      'Nem sikerült dekódolni az oldal képét.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Egyoldalas';

  @override
  String get twoPageSpread => 'Kétoldalas terítés';

  @override
  String get addBookmark => 'Könyvjelző hozzáadása';

  @override
  String get bookmarksEllipsis => 'Könyvjelzők...';

  @override
  String get markedAsRead => 'Olvasottként megjelölve';

  @override
  String get markedAsUnread => 'Olvasatlanként megjelölve';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Téma: Rendszer';

  @override
  String get themeLight => 'Téma: Fény';

  @override
  String get themeDark => 'Téma: Sötét';

  @override
  String get themeSepia => 'Téma: Szépia';

  @override
  String get invertColorsFixedLayout =>
      'Színek megfordítása (rögzített elrendezés)';

  @override
  String get invertColorsPdf => 'Színek megfordítása (PDF)';

  @override
  String get preparingInAppReader =>
      'Alkalmazáson belüli olvasó előkészítése...';

  @override
  String get pdfDataNotAvailable => 'PDF adatok nem állnak rendelkezésre.';

  @override
  String get readerFallbackModeActive => 'Az olvasó tartalék üzemmódja aktív';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Használja a Reload Readert, miután támogatott platformcélra váltott (Android, iOS, macOS).';

  @override
  String get openExternally => 'Megnyitás külsőleg';

  @override
  String get noEpubChaptersFound => 'Nem található EPUB fejezet.';

  @override
  String get readerNotReady => 'Az olvasó nem áll készen.';

  @override
  String get seriesRecordings => 'Sorozatfelvételek';

  @override
  String get now => 'Jelenleg';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Hír';

  @override
  String get kids => 'Gyerekek';

  @override
  String get premiere => 'Bemutató';

  @override
  String get guideTimeline => 'Útmutató Idővonal';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Nem található csatorna';

  @override
  String get liveBadge => 'ÉLŐ';

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
      'Eltávolítva a kedvenc csatornák közül';

  @override
  String get addedToFavoriteChannels => 'Hozzáadva a kedvenc csatornákhoz';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Nem sikerült frissíteni a kedvenc csatornát';

  @override
  String get unfavoriteChannel => 'Kedvenc csatorna';

  @override
  String get favoriteChannel => 'Kedvenc Csatorna';

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
  String get watch => 'Óra';

  @override
  String get close => 'Közeli';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Nem sikerült betölteni a felvételeket';

  @override
  String get scheduledInNext24Hours => 'Tervezett a következő 24 órában';

  @override
  String get recentRecordings => 'Legutóbbi felvételek';

  @override
  String get tvSeries => 'TV sorozat';

  @override
  String get failedToLoadSchedule => 'Nem sikerült betölteni az ütemezést';

  @override
  String get noScheduledRecordings => 'Nincsenek ütemezett felvételek';

  @override
  String get cancelRecording => 'Megszakítja a felvételt?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Nem';

  @override
  String get yesCancel => 'Igen, Mégse';

  @override
  String get failedToCancelRecording => 'Nem sikerült megszakítani a felvételt';

  @override
  String get failedToLoadSeriesRecordings =>
      'Nem sikerült betölteni a sorozatfelvételeket';

  @override
  String get noSeriesRecordings => 'Nincsenek sorozatfelvételek';

  @override
  String get cancelSeriesRecording => 'Sorozatfelvétel megszakítása';

  @override
  String get cancelSeriesRecordingQuestion => 'Megszakítja a sorozatfelvételt?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nem sikerült megszakítani a sorozatfelvételt';

  @override
  String get searchThisLibrary => 'Keresés ebben a könyvtárban...';

  @override
  String get searchEllipsis => 'Keresés...';

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
  String get seerrAccountType => 'Látó fiók típusa';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Helyi';

  @override
  String get savedMedia => 'Mentett média';

  @override
  String get tvShows => 'TV-műsorok';

  @override
  String get music => 'Zene';

  @override
  String get musicAlbums => 'Zenei albumok';

  @override
  String get noMediaInFilter => 'Nincs adathordozó ebben a szűrőben';

  @override
  String get noDownloadedMediaYet => 'Még nincs letöltött média';

  @override
  String get browseLibrary => 'Tallózás a könyvtárban';

  @override
  String get deleteDownload => 'Letöltés törlése';

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
  String get playAlbum => 'Album lejátszása';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Évad';

  @override
  String get errorLoadingEpisodes => 'Hiba az epizódok betöltésekor';

  @override
  String get noDownloadedEpisodes => 'Nincsenek letöltött epizódok';

  @override
  String get deleteEpisode => 'Epizód törlése';

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
  String get seriesNotFound => 'A sorozat nem található';

  @override
  String get errorLoadingSeries => 'Hiba a sorozat betöltésekor';

  @override
  String get downloadedEpisodes => 'Letöltött epizódok';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Különlegességek';

  @override
  String get deleteSeason => 'Szezon törlése';

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
  String get storageManagement => 'Tároláskezelés';

  @override
  String get storageBreakdown => 'Tárolási bontás';

  @override
  String get downloadedItems => 'Letöltött elemek';

  @override
  String get storageLimit => 'Tárolási korlát';

  @override
  String get noLimit => 'Nincs korlátozás';

  @override
  String get deleteAllDownloads => 'Az összes letöltés törlése';

  @override
  String get deleteAllDownloadsWarning =>
      'Ezzel eltávolítja az összes letöltött médiafájlt, és nem vonható vissza.';

  @override
  String get deleteAll => 'Összes törlése';

  @override
  String get deleteSelected => 'Kijelölt törlése';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Zene és hangoskönyvek';

  @override
  String get images => 'Képek';

  @override
  String get database => 'Adatbázis';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Beállítások elemre';

  @override
  String get authentication => 'Hitelesítés';

  @override
  String get autoLoginServerManagement =>
      'Automatikus bejelentkezés, szerverkezelés';

  @override
  String get pinCode => 'PIN kód';

  @override
  String get setUpPinCodeProtection => 'Állítsa be a PIN kódos védelmet';

  @override
  String get parentalControls => 'Szülői felügyelet';

  @override
  String get contentRatingRestrictions => 'Tartalombesorolási korlátozások';

  @override
  String get bitRateResolutionBehavior => 'Bitráta, felbontás, viselkedés';

  @override
  String get languageSizeAppearance => 'Nyelv, méret, megjelenés';

  @override
  String get qualityStorage => 'Minőség, tárolás';

  @override
  String get serverSyncAndPluginStatus =>
      'Szerver szinkronizálása és beépülő modul állapota';

  @override
  String get mediaRequestIntegration => 'Médiakérelem integráció';

  @override
  String get switchServer => 'Szerver váltása';

  @override
  String get signOut => 'Jelentkezzen ki';

  @override
  String get versionLicenses => 'Verzió, licencek';

  @override
  String get account => 'fiók';

  @override
  String get signInAndSecurity => 'Bejelentkezés és biztonság';

  @override
  String get administration => 'Adminisztráció';

  @override
  String get serverSettingsUsersLibraries =>
      'Szerverbeállítások, felhasználók, könyvtárak';

  @override
  String get customization => 'Testreszabás';

  @override
  String get themeAndLayout => 'Téma és elrendezés';

  @override
  String get videoAndSubtitles => 'Videó és felirat';

  @override
  String get integrations => 'Integrációk';

  @override
  String get pluginAndRequests => 'Plugin és kérések';

  @override
  String get customizeAccountPlaybackInterface =>
      'A fiók, a lejátszás és a felület viselkedésének testreszabása';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Téma és megjelenés';

  @override
  String get focusBorderColor => 'Fókusz határszín';

  @override
  String get watchedIndicators => 'Figyelt mutatók';

  @override
  String get always => 'Mindig';

  @override
  String get hideUnwatched => 'A Nem figyeltek elrejtése';

  @override
  String get episodesOnly => 'Csak epizódok';

  @override
  String get never => 'Soha';

  @override
  String get focusExpansionAnimation => 'Focus Expansion Animáció';

  @override
  String get desktopUiScale => 'Asztali felhasználói felület skála';

  @override
  String get scaleFocusedCards =>
      'Fókuszált vagy lebegtetett kártyák és lapkák skálázása';

  @override
  String get backgroundBackdrops => 'Háttér hátterek';

  @override
  String get showBackdropImages =>
      'Háttérképek megjelenítése a tartalom mögött';

  @override
  String get seriesThumbnails => 'Sorozat miniatűrök';

  @override
  String get seriesThumbnailsDescription =>
      'Csak epizódok: használjon minden sorképtípusnak megfelelő sorozatgrafikát';

  @override
  String get homeRowInfoOverlay => 'Kezdőlap sor információs fedvény';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Cím és metaadatok megjelenítése a kezdősorok böngészésekor';

  @override
  String get clockDisplay => 'Óra kijelző';

  @override
  String get inMenus => 'Menükben';

  @override
  String get inVideo => 'Videóban';

  @override
  String get seasonalEffects => 'Szezonális hatások';

  @override
  String get seasonalEffectsDescription =>
      'Vizuális effektusok és szezonális dekorációk';

  @override
  String get snow => 'Hó';

  @override
  String get fireworks => 'Tűzijáték';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Lehulló levelek';

  @override
  String get themeMusic => 'Téma Zene';

  @override
  String get playThemeMusicOnDetailPages =>
      'Játssz téma zenét a részletező oldalakon';

  @override
  String get themeMusicVolume => 'Téma Zene kötet';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Témazene a Home Rows-on';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Játssz a kezdőképernyőn való böngészés közben';

  @override
  String get detailsBackgroundBlur => 'Részletek Háttér életlenítés';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Böngészés Háttér életlenítés';

  @override
  String get maxStreamingBitrate => 'Max Streaming Bitráta';

  @override
  String get maxResolution => 'Max felbontás';

  @override
  String get playerZoomMode => 'Játékos zoom mód';

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
  String get autoCrop => 'Automatikus kivágás';

  @override
  String get stretch => 'Nyújtsd';

  @override
  String get refreshRateSwitching => 'Frissítési gyakoriság váltás';

  @override
  String get disabled => 'Letiltva';

  @override
  String get scaleOnTv => 'Skála a tévében';

  @override
  String get scaleOnDevice => 'Méretezés az eszközön';

  @override
  String get trickPlay => 'Trick Play';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Az előnézeti bélyegképek megjelenítése kereséskor';

  @override
  String get showDescriptionOnPause => 'Leírás megjelenítése a Szünetnél';

  @override
  String get dimVideoShowOverview =>
      'A videó halványítása és az áttekintő szöveg megjelenítése szüneteltetés közben';

  @override
  String get osdLockButton => 'OSD zár gomb';

  @override
  String get osdLockButtonDescription =>
      'Mutasson meg egy zárgombot, amely blokkolja az érintéses bevitelt, amíg hosszan meg nem nyomja';

  @override
  String get audioBehavior => 'Hangviselkedés';

  @override
  String get downmixToStereo => 'Lekeverés sztereóra';

  @override
  String get defaultAudioLanguage => 'Alapértelmezett hangnyelv';

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
  String get autoServerDefault => 'Automatikus (alapértelmezett szerver)';

  @override
  String get english => 'angol';

  @override
  String get spanish => 'spanyol';

  @override
  String get french => 'francia';

  @override
  String get german => 'német';

  @override
  String get italian => 'olasz';

  @override
  String get portuguese => 'portugál';

  @override
  String get japanese => 'japán';

  @override
  String get korean => 'koreai';

  @override
  String get chinese => 'kínai';

  @override
  String get russian => 'orosz';

  @override
  String get arabic => 'arab';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'holland';

  @override
  String get swedish => 'svéd';

  @override
  String get norwegian => 'norvég';

  @override
  String get danish => 'dán';

  @override
  String get finnish => 'finn';

  @override
  String get polish => 'lengyel';

  @override
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'TrueHD támogatás';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS audio csak AVR-hez; vevő támogatást és DTS forrássávot igényel';

  @override
  String get enableTrueHdAudio =>
      'Engedélyezze a TrueHD hangot (lehet, hogy nem működik minden platformon)';

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
  String get nightMode => 'Éjszakai mód';

  @override
  String get compressDynamicRange => 'Dinamikus tartomány tömörítése';

  @override
  String get advancedMpv => 'Haladó mpv';

  @override
  String get enableCustomMpvConf => 'Egyéni mpv.conf engedélyezése';

  @override
  String get applyMpvConfBeforePlayback =>
      'Alkalmazza a felhasználó által megadott mpv.conf fájlt a lejátszás megkezdése előtt';

  @override
  String get unsafeAdvancedMpvOptions => 'Nem biztonságos Speciális mpv Opciók';

  @override
  String get unsafeMpvOptionsDescription =>
      'Engedélyezzen az mpv opciók szélesebb készletét. Megzavarhatja a lejátszási viselkedést.';

  @override
  String get hardwareDecoding => 'Hardveres dekódolás';

  @override
  String get hardwareDecodingSubtitle =>
      'Javíthatja a teljesítményt, de bizonyos eszközökön lejátszási problémákat okozhat.';

  @override
  String get nextUpAndQueuing => 'Next Up & Queuing';

  @override
  String get nextUpDisplay => 'Következő képernyő';

  @override
  String get extended => 'Kiterjedt';

  @override
  String get minimal => 'Minimális';

  @override
  String get nextUpTimeout => 'Next Up Timeout';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Media Queuing';

  @override
  String get autoQueueNextEpisodes =>
      'A következő epizódok automatikus sorba állítása';

  @override
  String get stillWatchingPrompt => 'Továbbra is nézi a promptot';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Folytatás és kihagyás';

  @override
  String get resumeRewind => 'Visszatekerés folytatása';

  @override
  String get unpauseRewind => 'Visszatekerés szüneteltetése';

  @override
  String get fiveSeconds => '5 másodperc';

  @override
  String get tenSeconds => '10 másodperc';

  @override
  String get fifteenSeconds => '15 másodperc';

  @override
  String get thirtySeconds => '30 másodperc';

  @override
  String get skipBackLength => 'Ugrás vissza hossza';

  @override
  String get skipForwardLength => 'Ugrás előre hossza';

  @override
  String get customMpvConfPath => 'Egyéni mpv.conf elérési út';

  @override
  String get notSetMpvConf =>
      'Nincs beállítva. A Moonfin megpróbálja az alapértelmezett mpv.conf fájlt az alkalmazás/adat mappákban.';

  @override
  String get selectMpvConf => 'Válassza a mpv.conf lehetőséget';

  @override
  String get pathToMpvConf => '/útvonala/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'A stílusbeállítások (méret, szín, eltolás) a szöveges feliratokra vonatkoznak (SRT, VTT, TTML). Az ASS/SSA feliratok saját beágyazott stílusukat használják, kivéve, ha az „ASS/SSA Direct Play” ki van kapcsolva. A bittérképes feliratok (PGS, DVB, VobSub) nem alakíthatók át.';

  @override
  String get defaultSubtitleLanguage => 'Alapértelmezett feliratnyelv';

  @override
  String get defaultToNoSubtitles => 'Alapértelmezés szerint nincs felirat';

  @override
  String get turnOffSubtitlesByDefault =>
      'Alapértelmezés szerint kapcsolja ki a feliratokat';

  @override
  String get subtitleSize => 'Felirat mérete';

  @override
  String get textFillColor => 'Szöveg kitöltési színe';

  @override
  String get backgroundColor => 'Háttérszín';

  @override
  String get textStrokeColor => 'Szöveg körvonal színe';

  @override
  String get subtitleCustomization => 'Felirat testreszabása';

  @override
  String get subtitleCustomizationDescription =>
      'A felirat megjelenésének testreszabása';

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
  String get subtitlePreviewText => 'A gyors barna róka átugrik a lusta kutyán';

  @override
  String get verticalOffset => 'Függőleges eltolás';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles => 'Közvetlen lejátszású PGS-felirat';

  @override
  String get assSsaDirectPlay => 'ASS/SSA közvetlen lejátszás';

  @override
  String get directPlayAssSsaSubtitles =>
      'Közvetlen lejátszás ASS/SSA felirattal';

  @override
  String get white => 'Fehér';

  @override
  String get black => 'Fekete';

  @override
  String get yellow => 'Sárga';

  @override
  String get green => 'Zöld';

  @override
  String get cyan => 'Cián';

  @override
  String get red => 'Piros';

  @override
  String get transparent => 'Átlátszó';

  @override
  String get semiTransparentBlack => 'Félig átlátszó fekete';

  @override
  String get global => 'Globális';

  @override
  String get desktop => 'Asztali';

  @override
  String get mobile => 'Mozgó';

  @override
  String get tv => 'tv';

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
  String get customizationProfile => 'Testreszabási profil';

  @override
  String get customizationProfileDescription =>
      'Válassza ki a betölteni, szerkeszteni és szinkronizálni kívánt profilt. A globális mindenhol érvényes, hacsak egy eszközprofil nem írja felül. A zöld pont az aktuális eszközprofilját jelöli.';

  @override
  String get loadProfile => 'Profil betöltése';

  @override
  String get syncing => 'Szinkronizálás...';

  @override
  String get syncToProfile => 'Szinkronizálás profillal';

  @override
  String get profileSyncHidden => 'A profilszinkronizálás elrejtve';

  @override
  String get enablePluginSyncDescription =>
      'A profilvezérlők megjelenítéséhez engedélyezze a Szerver beépülő modul szinkronizálását a beépülő modul beállításaiban.';

  @override
  String get quality => 'Minőség';

  @override
  String get defaultDownloadQuality => 'Alapértelmezett letöltési minőség';

  @override
  String get network => 'Hálózat';

  @override
  String get wifiOnlyDownloads => 'Csak WiFi letöltések';

  @override
  String get onlyDownloadOnWifi =>
      'Csak akkor töltse le, ha csatlakozik WiFi-hez';

  @override
  String get storage => 'Tárolás';

  @override
  String get storageUsed => 'Tárolás használt';

  @override
  String get manage => 'Kezelése';

  @override
  String get calculating => 'Számító...';

  @override
  String get downloadLocation => 'Letöltés helye';

  @override
  String get defaultLabel => 'Alapértelmezett';

  @override
  String get saveToDownloadsFolder => 'Mentse a Letöltések mappába';

  @override
  String get downloadsVisibleToOtherApps =>
      'Letöltések/Moonfin – más alkalmazások számára látható';

  @override
  String get dangerZone => 'Veszélyzóna';

  @override
  String get clearAllDownloads => 'Minden letöltés törlése';

  @override
  String get original => 'Eredeti';

  @override
  String get changeDownloadLocation => 'Letöltési hely módosítása';

  @override
  String get changeDownloadLocationDescription =>
      'Az új letöltések a kiválasztott mappába kerülnek. A meglévő letöltések a jelenlegi helyükön maradnak, és a Tárhely beállításai között kezelhetők.';

  @override
  String get confirm => 'Erősítse meg';

  @override
  String get cannotWriteToFolder =>
      'Nem lehet írni a kiválasztott mappába. Kérjük, válasszon másik helyet, vagy adjon tárolási engedélyeket.';

  @override
  String get saveToDownloadsFolderQuestion => 'Menti a Letöltések mappába?';

  @override
  String get saveToDownloadsFolderDescription =>
      'A letöltött médiát a rendszer a Letöltések/Moonfin mappába menti eszközén. Ezeket a fájlokat más alkalmazások is láthatják, például a galéria vagy a zenelejátszó.\n\nA meglévő letöltések a jelenlegi helyükön maradnak.';

  @override
  String get enable => 'Engedélyezés';

  @override
  String get clearAllDownloadsWarning =>
      'Ezzel törli az összes letöltött adathordozót, és nem vonható vissza.';

  @override
  String get clearAll => 'Összes törlése';

  @override
  String get navigationStyle => 'Navigációs stílus';

  @override
  String get topBar => 'Felső sáv';

  @override
  String get leftSidebar => 'Bal oldalsáv';

  @override
  String get showShuffleButton => 'Véletlenszerű lejátszás gomb megjelenítése';

  @override
  String get showGenresButton => 'Műfajok megjelenítése gomb';

  @override
  String get showFavoritesButton => 'Kedvencek gomb megjelenítése';

  @override
  String get showLibrariesInToolbar =>
      'Könyvtárak megjelenítése az Eszköztárban';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => 'Navbar Opacitás';

  @override
  String get navbarColor => 'Navbar Color';

  @override
  String get gray => 'Szürke';

  @override
  String get darkBlue => 'Sötétkék';

  @override
  String get purple => 'Lila';

  @override
  String get teal => 'Böjti réce';

  @override
  String get navy => 'Haditengerészet';

  @override
  String get charcoal => 'Faszén';

  @override
  String get brown => 'Barna';

  @override
  String get darkRed => 'Sötétvörös';

  @override
  String get darkGreen => 'Sötétzöld';

  @override
  String get slate => 'Pala';

  @override
  String get indigo => 'Indigó';

  @override
  String get libraryDisplay => 'Könyvtári megjelenítés';

  @override
  String get posterLabel => 'Poszter';

  @override
  String get thumbnailLabel => 'Miniatűr';

  @override
  String get bannerLabel => 'Transzparens';

  @override
  String get overridePerLibrarySettings =>
      'Könyvtáronkénti beállítások felülbírálása';

  @override
  String get applyImageTypeToAllLibraries =>
      'Képtípus alkalmazása az összes könyvtárra';

  @override
  String get multiServerLibraries => 'Többkiszolgálós könyvtárak';

  @override
  String get showLibrariesFromAllServers =>
      'Az összes csatlakoztatott szerver könyvtárainak megjelenítése';

  @override
  String get enableFolderView => 'Mappanézet engedélyezése';

  @override
  String get showFolderBrowsingOption => 'Mappaböngészési opció megjelenítése';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'Könyvtár láthatósága';

  @override
  String get libraryVisibilityDescription =>
      'A kezdőlap láthatóságának váltása könyvtáronként. A módosítások életbe lépéséhez indítsa újra a Moonfin alkalmazást.';

  @override
  String get showInNavigation => 'Megjelenítés a navigációban';

  @override
  String get showInLatestMedia => 'Megjelenítés a legújabb médiában';

  @override
  String get sourceLibraries => 'Forráskönyvtárak';

  @override
  String get sourceCollections => 'Forrásgyűjtemények';

  @override
  String get excludedGenres => 'Kizárt műfajok';

  @override
  String get selectAll => 'Válassza az Összes lehetőséget';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Media Bar';

  @override
  String get mediaSources => 'Médiaforrások';

  @override
  String get behavior => 'Viselkedés';

  @override
  String get seconds => 'másodpercig';

  @override
  String get localPreviews => 'Helyi előnézetek';

  @override
  String get localPreviewsDescription =>
      'Előzetes, média és audio előnézetek konfigurálása.';

  @override
  String get mediaBarMode => 'Médiasáv stílusa';

  @override
  String get mediaBarModeDescription =>
      'Válasszon a különböző médiasáv-stílusok közül, vagy kapcsolja ki a médiasávot';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Le';

  @override
  String get enableMediaBar => 'Médiasáv engedélyezése';

  @override
  String get showFeaturedContentSlideshow =>
      'Kiemelt tartalom diavetítésének megjelenítése a kezdőlapon';

  @override
  String get contentType => 'Tartalom típusa';

  @override
  String get moviesAndTvShows => 'Filmek és tévéműsorok';

  @override
  String get moviesOnly => 'Csak filmek';

  @override
  String get tvShowsOnly => 'Csak tévéműsorok';

  @override
  String get itemCount => 'Tételszám';

  @override
  String get noneSelected => 'Nincs kiválasztva';

  @override
  String get noneExcluded => 'Egyik sem kizárt';

  @override
  String get autoAdvance => 'Automatikus előrelépés';

  @override
  String get autoAdvanceSlides => 'Automatikus ugrás a következő diára';

  @override
  String get autoAdvanceInterval => 'Auto Advance Interval';

  @override
  String get trailerPreview => 'Előzetes előnézet';

  @override
  String get autoPlayTrailers =>
      'Előzetesek automatikus lejátszása a médiasávon 3 másodperc után';

  @override
  String get episodePreview => 'Epizód előnézete';

  @override
  String get mediaPreview => 'Média előnézet';

  @override
  String get episodePreviewDescription =>
      'Játssz le egy 30 másodperces soros előnézetet fókuszált, lebegtetett vagy hosszan lenyomott kártyákon';

  @override
  String get mediaPreviewDescription =>
      'Játssz le egy 30 másodperces soros előnézetet fókuszált, lebegtetett vagy hosszan lenyomott kártyákon';

  @override
  String get previewAudio => 'Hang előnézete';

  @override
  String get enablePreviewAudio =>
      'Hang engedélyezése az előzetes és az epizód előnézetéhez';

  @override
  String get latestMedia => 'Legújabb média';

  @override
  String get recentlyReleased => 'Nemrég Megjelent';

  @override
  String get myMedia => 'Saját médiám';

  @override
  String get myMediaSmall => 'Saját média (kicsi)';

  @override
  String get continueWatching => 'Folytassa a nézést';

  @override
  String get resumeAudio => 'Hang folytatása';

  @override
  String get resumeBooks => 'Folytatás Könyvek';

  @override
  String get activeRecordings => 'Aktív felvételek';

  @override
  String get playlists => 'Lejátszási listák';

  @override
  String get liveTV => 'Élő TV';

  @override
  String get homeSections => 'Kezdőlap szakaszok';

  @override
  String get resetToDefaults => 'Állítsa vissza az alapértelmezett értékeket';

  @override
  String get homeRowPosterSize => 'Főoldali sor poszter mérete';

  @override
  String get perRowImageTypeSelection => 'Soronkénti képtípus kiválasztása';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurálja a képtípust minden engedélyezett kezdősorhoz';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Egyesítse a Megtekintés folytatása és a Következő elemet';

  @override
  String get combineBothRows =>
      'Kombinálja mindkét sort egyetlen kezdőszakaszba';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'Soronkénti képtípus';

  @override
  String get perRowSettings => 'Soronkénti beállítások';

  @override
  String get autoLogin => 'Automatikus bejelentkezés';

  @override
  String get lastUser => 'Utolsó felhasználó';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => 'Mindig hitelesítsen';

  @override
  String get requirePasswordWithToken => 'Jelszó kérése tárolt token esetén is';

  @override
  String get confirmExit => 'Kilépés megerősítése';

  @override
  String get showConfirmationBeforeExiting =>
      'Megerősítés megjelenítése kilépés előtt';

  @override
  String get blockContentWithRatings =>
      'A következő besorolású tartalom letiltása:';

  @override
  String get noContentRatingsFound =>
      'Ezen a szerveren még nem található tartalombesorolás.';

  @override
  String get couldNotLoadServerRatings =>
      'Nem sikerült betölteni a szerver értékelését. Csak a mentett értékelések megjelenítése.';

  @override
  String get couldNotRefreshRatings =>
      'Nem sikerült frissíteni az értékeléseket a szerverről. Mentett értékelések megjelenítése.';

  @override
  String get enablePinCode => 'PIN kód engedélyezése';

  @override
  String get requirePinToAccess => 'A fiók eléréséhez PIN-kód szükséges';

  @override
  String get changePin => 'PIN módosítása';

  @override
  String get setNewPinCode => 'Állítson be új PIN kódot';

  @override
  String get removePin => 'Távolítsa el a PIN-kódot';

  @override
  String get removePinProtection => 'Távolítsa el a PIN kód védelmet';

  @override
  String get screensaver => 'Képernyővédő';

  @override
  String get inAppScreensaver => 'Alkalmazáson belüli képernyővédő';

  @override
  String get enableBuiltInScreensaver =>
      'Engedélyezze a beépített képernyővédőt';

  @override
  String get mode => 'Mód';

  @override
  String get libraryArt => 'Könyvtár Art';

  @override
  String get logo => 'Logó';

  @override
  String get clock => 'Óra';

  @override
  String get timeout => 'Időtúllépés';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Tompítási szint';

  @override
  String get maxAgeRating => 'Maximális korhatár';

  @override
  String get any => 'Bármilyen';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Korhatár-besorolás szükséges';

  @override
  String get onlyShowRatedContent =>
      'Csak a minősített tartalmat jelenítse meg';

  @override
  String get showClock => 'Óra megjelenítése';

  @override
  String get displayClockDuringScreensaver =>
      'Óra megjelenítése képernyővédő közben';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (kritikusok)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (közönség)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritikus';

  @override
  String get metacriticUser => 'Metacritic (felhasználó)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Közösségi értékelés';

  @override
  String get ratings => 'Értékelések';

  @override
  String get additionalRatings => 'További értékelések';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList és TMDB értékelések megjelenítése';

  @override
  String get ratingLabels => 'Értékelési címkék';

  @override
  String get showLabelsNextToIcons =>
      'Címkék megjelenítése az értékelési ikonok mellett';

  @override
  String get ratingBadges => 'Értékelési jelvények';

  @override
  String get showDecorativeBadges =>
      'Díszítő jelvények megjelenítése az értékelések mögött';

  @override
  String get episodeRatings => 'Az epizódok értékelései';

  @override
  String get showRatingsOnEpisodes =>
      'Az egyes epizódok értékeléseinek megjelenítése';

  @override
  String get ratingSources => 'Értékelési források';

  @override
  String get ratingSourcesDescription =>
      'Az alkalmazásban megjelenő értékelési források engedélyezése és átrendezése';

  @override
  String get pluginLabel => 'Plugin';

  @override
  String get pluginDetected => 'Beépülő modul észlelve';

  @override
  String get pluginNotDetected => 'A beépülő modul nem észlelhető';

  @override
  String get pluginDetectedDescription =>
      'Szerverbővítmény észlelve. A szinkronizálás automatikusan engedélyezve van a bővítmény első megtalálásakor.';

  @override
  String get pluginNotDetectedDescription =>
      'A kiszolgálóbővítmény jelenleg nem észlelhető. A helyi beállítások továbbra is a mentett értékeket vagy a beépített alapértelmezett értékeket használják.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Elérhető szolgáltatások';

  @override
  String get serverPluginSync => 'Szerver beépülő modul szinkronizálása';

  @override
  String get syncSettingsWithPlugin =>
      'Szinkronizálja a beállításokat a szerver beépülő modullal';

  @override
  String get whatSyncControls => 'Milyen szinkronizálást vezérel';

  @override
  String get syncControlsDescription =>
      'A szinkronizálás csak azt szabályozza, hogy a beépülő modulok által támogatott beállítások elküldésre kerülnek-e a kiszolgálóra, illetve lekérhetők-e onnan. A profil kiválasztása és a profilszinkronizálási műveletek a Testreszabási beállításokban találhatók, ha a beépülő modul szinkronizálása engedélyezett.';

  @override
  String get recentRequests => 'Legutóbbi kérések';

  @override
  String get recentlyAdded => 'Nemrég hozzáadva';

  @override
  String get trending => 'Felkapott';

  @override
  String get popularMovies => 'Népszerű filmek';

  @override
  String get movieGenres => 'Film műfajok';

  @override
  String get upcomingMovies => 'Közelgő filmek';

  @override
  String get studios => 'Stúdiók';

  @override
  String get popularSeries => 'Népszerű sorozat';

  @override
  String get seriesGenres => 'Sorozat műfajai';

  @override
  String get upcomingSeries => 'Közelgő sorozat';

  @override
  String get networks => 'Hálózatok';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults =>
      'A sorok visszaállítása az alapértelmezett értékekre';

  @override
  String get enableSeerr => 'Látó engedélyezése';

  @override
  String get showSeerrInNavigation =>
      'Látó megjelenítése a navigációban (szerver beépülő modul szükséges)';

  @override
  String get seerrUnavailable =>
      'Nem érhető el, mert a Seerr szerverbővítmény támogatása le van tiltva.';

  @override
  String get nsfwFilter => 'NSFW szűrő';

  @override
  String get hideAdultContent =>
      'A felnőtteknek szánt tartalom elrejtése a találatok között';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Fedezze fel a sorokat';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Húzza át az átrendezéshez. Sorok engedélyezése vagy letiltása. Az engedélyezett sorsorrend szinkronizálása a Moonfin beépülő modullal.';

  @override
  String get discoverRowsDescription =>
      'Húzza át az átrendezéshez. Sorok engedélyezése vagy letiltása.';

  @override
  String get enabled => 'Engedélyezve';

  @override
  String get hidden => 'Rejtett';

  @override
  String get aboutTitle => 'Körülbelül';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Nyílt forráskódú licencek';

  @override
  String get sourceCode => 'Forráskód';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Keressen frissítéseket most';

  @override
  String get checksLatestDesktopRelease =>
      'Ellenőrzi a platform legújabb asztali kiadását';

  @override
  String get youAreUpToDate => 'Ön naprakész.';

  @override
  String get couldNotCheckForUpdates =>
      'Jelenleg nem sikerült ellenőrizni a frissítéseket.';

  @override
  String get noCompatibleUpdate =>
      'Nem található kompatibilis frissítési csomag ehhez a platformhoz.';

  @override
  String get updateChecksNotSupported =>
      'A frissítések ellenőrzése nem támogatott ezen a platformon.';

  @override
  String get updateNotificationsDisabled =>
      'A frissítési értesítések le vannak tiltva.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Kérjük, várjon, mielőtt újra ellenőrizné.';

  @override
  String get latestUpdateAlreadyShown => 'A legutóbbi frissítés már megjelent.';

  @override
  String get updateAvailable => 'Frissítés elérhető.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Frissítse az értesítéseket';

  @override
  String get showWhenUpdatesAvailable =>
      'Megjeleníti, mikor érhetők el frissítések';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Olvassa el a kiadási megjegyzéseket';

  @override
  String get downloadingUpdate => 'Frissítés letöltése...';

  @override
  String get updateDownloadFailed =>
      'A frissítés letöltése sikertelen. Kérjük, próbálja újra.';

  @override
  String get openReleasesPage => 'Nyissa meg a Kiadások oldalát';

  @override
  String get navigation => 'Navigáció';

  @override
  String get watchedIndicatorsBackdrops => 'Nézett indikátorok, hátterek';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fókuszszín, figyelt indikátorok, hátterek';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navigációs stílus, eszköztár gombjai, megjelenés';

  @override
  String get reorderToggleHomeRows => 'A kezdősorok átrendezése és átváltása';

  @override
  String get featuredContentAppearance => 'Kiemelt tartalom, megjelenés';

  @override
  String get posterSizeImageTypeFolderView =>
      'Poszter mérete, képtípus, mappanézet';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB és értékelési források';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Világos';

  @override
  String get browse => 'Tallózás';

  @override
  String get noResults => 'Nincs eredmény';

  @override
  String get seerrAvailableStatus => 'Elérhető';

  @override
  String get seerrRequestedStatus => 'Kért';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Látó beállításai';

  @override
  String get requestMore => 'Kérjen többet';

  @override
  String get request => 'Kér';

  @override
  String get cancelRequest => 'Kérelem visszavonása';

  @override
  String get playInMoonfin => 'Lejátszás Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Jóváhagyni';

  @override
  String get declineAction => 'Hanyatlás';

  @override
  String get similar => 'Hasonló';

  @override
  String get recommendations => 'Ajánlások';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Tartsa';

  @override
  String get itemNotFoundInLibrary =>
      'Az elem nem található a Moonfin könyvtárában';

  @override
  String get errorSearchingLibrary => 'Hiba a könyvtár keresése közben';

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
  String get submitRequest => 'Kérés benyújtása';

  @override
  String get allSeasons => 'Minden évszak';

  @override
  String get advancedOptions => 'Speciális beállítások';

  @override
  String get noServiceServersConfigured =>
      'Nincsenek konfigurálva szervizkiszolgálók';

  @override
  String get server => 'Szerver';

  @override
  String get qualityProfile => 'Minőségi profil';

  @override
  String get rootFolder => 'Gyökérmappa';

  @override
  String get showMore => 'Továbbiak megjelenítése';

  @override
  String get appearances => 'Megjelenések';

  @override
  String get crewSection => 'Legénység';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Nincsenek kérések';

  @override
  String get pendingStatus => 'Függőben levő';

  @override
  String get declinedStatus => 'Elutasítva';

  @override
  String get partiallyAvailable => 'Részben elérhető';

  @override
  String get downloadingStatus => 'Letöltés';

  @override
  String get approvedStatus => 'Jóváhagyott';

  @override
  String get notRequestedStatus => 'Nem kért';

  @override
  String get blocklistedStatus => 'Blokklistán';

  @override
  String get deletedStatus => 'Törölve';

  @override
  String get tmdbScore => 'TMDB pontszám';

  @override
  String get releaseDateLabel => 'Megjelenés dátuma';

  @override
  String get firstAirDateLabel => 'Első légi dátum';

  @override
  String get revenueLabel => 'Bevétel';

  @override
  String get runtimeLabel => 'Futásidő';

  @override
  String get budgetLabel => 'Költségvetés';

  @override
  String get originalLanguageLabel => 'Eredeti nyelv';

  @override
  String get seasonsLabel => 'Évszakok';

  @override
  String get episodesLabel => 'Epizódok';

  @override
  String get access => 'Hozzáférés';

  @override
  String get add => 'Hozzáadás';

  @override
  String get address => 'Cím';

  @override
  String get analytics => 'Analitika';

  @override
  String get catalog => 'Katalógus';

  @override
  String get content => 'Tartalom';

  @override
  String get copy => 'Másolat';

  @override
  String get create => 'Teremt';

  @override
  String get disable => 'Letiltás';

  @override
  String get done => 'Kész';

  @override
  String get edit => 'Szerkesztés';

  @override
  String get encoding => 'Kódolás';

  @override
  String get error => 'Hiba';

  @override
  String get forward => 'Előre';

  @override
  String get general => 'Általános';

  @override
  String get go => 'Megy';

  @override
  String get install => 'Telepítés';

  @override
  String get installed => 'Telepítve';

  @override
  String get interval => 'Intervallum';

  @override
  String get name => 'Név';

  @override
  String get networking => 'Hálózatépítés';

  @override
  String get next => 'Következő';

  @override
  String get path => 'Útvonal';

  @override
  String get paused => 'Szüneteltetve';

  @override
  String get permissions => 'Engedélyek';

  @override
  String get processing => 'Feldolgozás';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Szolgáltató';

  @override
  String get refresh => 'Frissítés';

  @override
  String get remote => 'Távoli';

  @override
  String get rename => 'Átnevezés';

  @override
  String get revoke => 'Visszavonás';

  @override
  String get role => 'Szerep';

  @override
  String get root => 'Gyökér';

  @override
  String get run => 'Fut';

  @override
  String get search => 'Keresés';

  @override
  String get select => 'Válassza ki';

  @override
  String get send => 'Elküld';

  @override
  String get sessions => 'Munkamenetek';

  @override
  String get set => 'Készlet';

  @override
  String get status => 'Állapot';

  @override
  String get stop => 'Stop';

  @override
  String get streaming => 'Folyó';

  @override
  String get time => 'Idő';

  @override
  String get trickplay => 'Trükkös játék';

  @override
  String get uninstall => 'Eltávolítás';

  @override
  String get up => 'Fel';

  @override
  String get update => 'Frissítés';

  @override
  String get upload => 'Feltöltés';

  @override
  String get unmute => 'Némítás feloldása';

  @override
  String get mute => 'Néma';

  @override
  String get branding => 'Márkaépítés';

  @override
  String get adminDrawerDashboard => 'Műszerfal';

  @override
  String get adminDrawerAnalytics => 'Analitika';

  @override
  String get adminDrawerSettings => 'Beállítások elemre';

  @override
  String get adminDrawerBranding => 'Márkaépítés';

  @override
  String get adminDrawerUsers => 'Felhasználók';

  @override
  String get adminDrawerLibraries => 'Könyvtárak';

  @override
  String get adminDrawerTranscoding => 'Átkódolás';

  @override
  String get adminDrawerResume => 'Folytatás';

  @override
  String get adminDrawerStreaming => 'Folyó';

  @override
  String get adminDrawerTrickplay => 'Trükkös játék';

  @override
  String get adminDrawerDevices => 'Eszközök';

  @override
  String get adminDrawerActivity => 'Tevékenység';

  @override
  String get adminDrawerNetworking => 'Hálózatépítés';

  @override
  String get adminDrawerApiKeys => 'API kulcsok';

  @override
  String get adminDrawerBackups => 'Biztonsági mentések';

  @override
  String get adminDrawerLogs => 'Naplók';

  @override
  String get adminDrawerScheduledTasks => 'Ütemezett feladatok';

  @override
  String get adminDrawerPlugins => 'Beépülő modulok';

  @override
  String get adminDrawerRepositories => 'Adattárak';

  @override
  String get adminDrawerLiveTv => 'Élő TV';

  @override
  String get adminExitTooltip => 'Lépjen ki az Adminisztrátorból';

  @override
  String get adminDashboardLoadFailed =>
      'Nem sikerült betölteni az irányítópultot';

  @override
  String get adminMediaOverview => 'Média áttekintése';

  @override
  String get adminMediaTotalsError =>
      'Nem sikerült betölteni a szerver média összesített adatát.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Gyors olvasmány arról, hogy mennyi tartalom van ezen a szerveren.';

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
  String get analyticsMediaDistribution => 'Médiaterjesztés';

  @override
  String get analyticsVideoCodecs => 'Videó kodekek';

  @override
  String get analyticsAudioCodecs => 'Audio kodekek';

  @override
  String get analyticsContainers => 'Konténerek';

  @override
  String get analyticsTopGenres => 'Legjobb műfajok';

  @override
  String get analyticsReleaseYears => 'Kiadási Évek';

  @override
  String get analyticsContentRatings => 'Tartalomértékelések';

  @override
  String get analyticsRuntimeBuckets => 'Futásidejű gyűjtők';

  @override
  String get analyticsFileFormats => 'Fájlformátumok';

  @override
  String get analyticsNoData => 'Nincs adat.';

  @override
  String get adminServerInfo => 'Szerver Info';

  @override
  String get adminRestartPending => 'Újraindítás függőben';

  @override
  String get adminServerPaths => 'Szerver útvonalak';

  @override
  String get adminServerActions => 'Szerverműveletek';

  @override
  String get adminRestartServer => 'Indítsa újra a szervert';

  @override
  String get adminShutdownServer => 'Szerver leállítása';

  @override
  String get adminScanLibraries => 'Könyvtárak beolvasása';

  @override
  String get adminLibraryScanStarted => 'A könyvtári vizsgálat elindult';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'A szerver újraindítása folyamatban van';

  @override
  String get adminServerRebootMessage =>
      'A szerver újraindítása folyamatban van, kérjük, indítsa újra a Moonfin';

  @override
  String get adminActiveSessions => 'Aktív munkamenetek';

  @override
  String get adminSessionsLoadFailed =>
      'Nem sikerült betölteni a munkameneteket';

  @override
  String get adminNoActiveSessions => 'Nincsenek aktív munkamenetek';

  @override
  String get adminRecentActivity => 'Legutóbbi tevékenység';

  @override
  String get adminNoRecentActivity => 'Nincs közelmúltbeli tevékenység';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Üzenet küldése';

  @override
  String get adminMessageTextHint => 'Üzenet szövege';

  @override
  String get adminSetVolume => 'Hangerő beállítása';

  @override
  String get sessionPrev => 'Előző';

  @override
  String get sessionRewind => 'Visszatekerés';

  @override
  String get sessionForward => 'Előre';

  @override
  String get sessionNext => 'Következő';

  @override
  String get sessionVolumeDown => 'kötet –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Most játszik';

  @override
  String get volume => 'Kötet';

  @override
  String get actions => 'Akciók';

  @override
  String get videoCodec => 'Video Codec';

  @override
  String get audioCodec => 'Audio kodek';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Befejezés';

  @override
  String get direct => 'Közvetlen';

  @override
  String get adminDisconnect => 'Leválasztás';

  @override
  String get adminClearDates => 'Világos dátumok';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nincsenek tevékenységbejegyzések';

  @override
  String get adminEditDeviceName => 'Szerkessze az eszköz nevét';

  @override
  String get adminCustomName => 'Egyéni név';

  @override
  String get adminDeviceNameUpdated => 'Az eszköz neve frissítve';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Eszköz törlése';

  @override
  String get adminDeviceDeleted => 'Eszköz törölve';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Nem sikerült betölteni az eszközöket';

  @override
  String get adminSearchDevices => 'Eszközök keresése';

  @override
  String get adminThisDevice => 'Ez a Készülék';

  @override
  String get adminEditName => 'Név szerkesztése';

  @override
  String get adminLibrariesLoadFailed =>
      'Nem sikerült betölteni a könyvtárakat';

  @override
  String get adminNoLibraries => 'Nincsenek konfigurálva könyvtárak';

  @override
  String get adminScanAllLibraries => 'Az összes könyvtár beolvasása';

  @override
  String get adminAddLibrary => 'Könyvtár hozzáadása elemre';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Könyvtár átnevezése';

  @override
  String get adminNewName => 'Új név';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Könyvtár törlése';

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
  String get adminRemovePath => 'Eltávolítási útvonal';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'A könyvtári beállítások elmentve';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nem sikerült betölteni a könyvtárat';

  @override
  String get adminNoMediaPaths => 'Nincsenek konfigurálva médiaútvonalak';

  @override
  String get adminAddPath => 'Útvonal hozzáadása';

  @override
  String get adminBrowseFilesystem => 'Tallózás a szerver fájlrendszerében:';

  @override
  String get adminSaveOptions => 'Beállítások mentése';

  @override
  String get adminPreferredMetadataLanguage =>
      'Előnyben részesített metaadat-nyelv';

  @override
  String get adminMetadataLanguageHint => 'például en, de, fr';

  @override
  String get adminMetadataCountryCode => 'A metaadatok országkódja';

  @override
  String get adminMetadataCountryHint => 'például USA, DE, FR';

  @override
  String get adminLibraryNameRequired => 'A könyvtár neve kötelező';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Könyvtár neve';

  @override
  String get adminSelectedPaths => 'Kiválasztott útvonalak:';

  @override
  String get adminNoPathsAdded =>
      'Nincsenek hozzáadott útvonalak (később is hozzáadhatók)';

  @override
  String get adminCreateLibrary => 'Könyvtár létrehozása';

  @override
  String get paths => 'Útvonalak:';

  @override
  String get adminDisableUser => 'Felhasználó letiltása';

  @override
  String get adminEnableUser => 'Felhasználó engedélyezése';

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
  String get adminUsersLoadFailed => 'Nem sikerült betölteni a felhasználókat';

  @override
  String get adminSearchUsers => 'Felhasználók keresése';

  @override
  String get adminEditUser => 'Felhasználó szerkesztése';

  @override
  String get adminAddUser => 'Felhasználó hozzáadása';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Felhasználó létrehozása';

  @override
  String get adminPasswordOptional => 'Jelszó (nem kötelező)';

  @override
  String get adminUsernameRequired => 'A felhasználónév nem lehet üres';

  @override
  String get adminNoProfileChanges => 'Nincs mentendő profilmódosítás';

  @override
  String get adminProfileSaved => 'Profil mentve';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Az engedélyek mentve';

  @override
  String get adminPasswordsMismatch => 'A jelszavak nem egyeznek';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Nem sikerült betölteni a felhasználót';

  @override
  String get adminBackToUsers => 'Vissza a felhasználókhoz';

  @override
  String get adminSaveProfile => 'Profil mentése';

  @override
  String get adminDeleteUser => 'Felhasználó törlése';

  @override
  String get admin => 'Adminisztrátor';

  @override
  String get adminFullAccessWarning =>
      'A rendszergazdák teljes hozzáféréssel rendelkeznek a szerverhez. Óvatosan adja meg.';

  @override
  String get administrator => 'Adminisztrátor';

  @override
  String get adminHiddenUser => 'Rejtett felhasználó';

  @override
  String get adminAllowMediaPlayback => 'Médialejátszás engedélyezése';

  @override
  String get adminAllowAudioTranscoding => 'Hang átkódolásának engedélyezése';

  @override
  String get adminAllowVideoTranscoding => 'Engedélyezze a videó átkódolását';

  @override
  String get adminAllowRemuxing => 'Engedje meg az újrakeverést';

  @override
  String get adminForceRemoteTranscoding =>
      'A távoli forrás átkódolásának kényszerítése';

  @override
  String get adminAllowContentDeletion => 'Tartalomtörlés engedélyezése';

  @override
  String get adminAllowContentDownloading =>
      'Tartalom letöltésének engedélyezése';

  @override
  String get adminAllowPublicSharing => 'Nyilvános megosztás engedélyezése';

  @override
  String get adminAllowRemoteControl =>
      'Más felhasználók távvezérlésének engedélyezése';

  @override
  String get adminAllowSharedDeviceControl =>
      'Megosztott eszközvezérlés engedélyezése';

  @override
  String get adminAllowRemoteAccess => 'Távoli hozzáférés engedélyezése';

  @override
  String get adminRemoteBitrateLimit =>
      'Távoli kliens bitsebesség-korlátja (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Hagyja üresen korlátozás nélkül';

  @override
  String get adminMaxActiveSessions => 'Max aktív munkamenetek';

  @override
  String get adminAllowLiveTvAccess => 'Élő TV-hozzáférés engedélyezése';

  @override
  String get adminAllowLiveTvManagement => 'Élő TV-kezelés engedélyezése';

  @override
  String get adminAllowCollectionManagement =>
      'Gyűjteménykezelés engedélyezése';

  @override
  String get adminAllowSubtitleManagement => 'Feliratkezelés engedélyezése';

  @override
  String get adminAllowLyricManagement => 'Dalszövegkezelés engedélyezése';

  @override
  String get adminSavePermissions => 'Engedélyek mentése';

  @override
  String get adminEnableAllLibraryAccess =>
      'Hozzáférés engedélyezése az összes könyvtárhoz';

  @override
  String get adminSaveAccess => 'Hozzáférés mentése';

  @override
  String get adminChangePassword => 'Jelszó módosítása';

  @override
  String get adminNewPassword => 'Új jelszó';

  @override
  String get adminConfirmPassword => 'Jelszó megerősítése';

  @override
  String get adminSetPassword => 'Jelszó beállítása';

  @override
  String get adminResetPassword => 'Jelszó visszaállítása';

  @override
  String get adminPasswordReset => 'Jelszó visszaállítása';

  @override
  String get adminPasswordUpdated => 'Jelszó frissítve';

  @override
  String get adminUserSettings => 'Felhasználói beállítások';

  @override
  String get adminLibraryAccess => 'Hozzáférés a könyvtárhoz';

  @override
  String get adminDeviceAndChannelAccess => 'Eszköz és csatorna hozzáférés';

  @override
  String get adminEnableAllDevices =>
      'Engedélyezze a hozzáférést az összes eszközhöz';

  @override
  String get adminEnableAllChannels =>
      'Az összes csatornához való hozzáférés engedélyezése';

  @override
  String get adminResetPasswordWarning =>
      'Ezzel eltávolítja a jelszót. A felhasználó jelszó nélkül tud majd bejelentkezni.';

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
  String get adminCreateApiKey => 'API-kulcs létrehozása';

  @override
  String get adminAppName => 'Alkalmazás neve';

  @override
  String get adminApiKeyCreated => 'API kulcs létrehozva';

  @override
  String get adminApiKeyCreatedNoToken =>
      'A kulcs sikeresen létrehozva. A szerver nem küldte vissza a tokent. Ellenőrizze a szerver API kulcsait.';

  @override
  String get adminKeyCopied => 'A kulcs a vágólapra másolva';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'A kulcstoken hiányzik a szerver válaszából';

  @override
  String get adminRevokeApiKey => 'API-kulcs visszavonása';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-kulcs visszavonva';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed =>
      'Nem sikerült betölteni az API-kulcsokat';

  @override
  String get adminApiKeysTitle => 'API kulcsok';

  @override
  String get adminCreateKey => 'Kulcs létrehozása';

  @override
  String get adminNoApiKeys => 'Nem található API-kulcs';

  @override
  String get adminUnknownApp => 'Ismeretlen alkalmazás';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Biztonsági másolat létrehozása...';

  @override
  String get adminBackupCreated => 'A biztonsági mentés sikeresen létrehozva';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'A szerver válaszában hiányzik a biztonsági mentési útvonal';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Erősítse meg a visszaállítást';

  @override
  String get adminRestoringBackup => 'Biztonsági mentés visszaállítása...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'Nem sikerült betölteni a biztonsági másolatokat';

  @override
  String get adminCreateBackup => 'Biztonsági másolat létrehozása';

  @override
  String get adminNoBackups => 'Nem található biztonsági másolat';

  @override
  String get adminViewDetails => 'Részletek megtekintése';

  @override
  String get restore => 'Visszaállítás';

  @override
  String get adminLogsLoadFailed => 'Nem sikerült betölteni a szervernaplókat';

  @override
  String get adminNoLogFiles => 'Nem található naplófájl';

  @override
  String get adminLogCopied => 'Napló a vágólapra másolva';

  @override
  String get adminSaveLogFile => 'Mentse a naplófájlt';

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
  String get adminSearchInLog => 'Keresés a naplóban';

  @override
  String get adminNoMatchingLines => 'Nincsenek egyező sorok';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nem található ütemezett feladat';

  @override
  String get adminNoTasksMatchFilter =>
      'Egyetlen feladat sem felel meg az aktuális szűrőnek';

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
  String get adminRunNow => 'Fuss most';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Utolsó Kivégzés';

  @override
  String get adminTriggers => 'Kiváltók';

  @override
  String get adminAddTrigger => 'Trigger hozzáadása';

  @override
  String get adminNoTriggers => 'Nincsenek konfigurálva triggerek';

  @override
  String get adminTriggerType => 'Trigger típusa';

  @override
  String get adminTimeLimit => 'Időkorlát (nem kötelező)';

  @override
  String get adminNoLimit => 'Nincs korlátozás';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'A hét napja';

  @override
  String get adminSearchPlugins => 'Beépülő modulok keresése...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Uninstall Plugin';

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
      'Egyetlen bővítmény sem felel meg a keresésnek';

  @override
  String get adminNoPluginsInstalled => 'Nincs telepítve plugin';

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
      'Nincs a keresésnek megfelelő csomag';

  @override
  String get adminNoPackagesAvailable => 'Nincsenek elérhető csomagok';

  @override
  String get adminExperimentalIntegration => 'Kísérleti integráció';

  @override
  String get adminExperimentalWarning =>
      'A beépülő modul-beállítások integrációja még csak kísérleti jellegű. Előfordulhat, hogy egyes beállítások oldalak nem jelennek meg megfelelően.';

  @override
  String get continueAction => 'Folytatás';

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
      'Nem lehet megnyitni a beállításokat: hiányzik a hitelesítési token.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'A beépülő modul nem található';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Beépülő modul engedélyezése';

  @override
  String get adminPluginSettingsPage => 'Beépülő modul beállítási oldal';

  @override
  String get adminRevisionHistory => 'Revíziótörténet';

  @override
  String get adminNoChangelog => 'Nem érhető el változásnapló.';

  @override
  String get adminRemoveRepository => 'Távolítsa el a tárhelyet';

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
  String get adminRepositoryNameHint => 'például Jellyfin Stabil';

  @override
  String get adminRepositoryUrl => 'Adattár URL-je';

  @override
  String get adminAddEntry => 'Bejegyzés hozzáadása';

  @override
  String get adminInvalidUrl => 'Érvénytelen URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Nyissa meg a böngészőben';

  @override
  String get adminOpenExternally => 'Nyissa meg kívülről';

  @override
  String get adminGeneralSettings => 'Általános beállítások';

  @override
  String get adminServerName => 'Szerver neve';

  @override
  String get adminPreferredMetadataCountry =>
      'Előnyben részesített metaadatok országa';

  @override
  String get adminCachePath => 'Gyorsítótár elérési útja';

  @override
  String get adminMetadataPath => 'Metaadat elérési út';

  @override
  String get adminLibraryScanConcurrency =>
      'A könyvtári szkennelés párhuzamossága';

  @override
  String get adminParallelImageEncodingLimit => 'Párhuzamos képkódolási korlát';

  @override
  String get adminSlowResponseThreshold => 'Lassú válaszküszöb (ms)';

  @override
  String get adminBrandingSaved => 'A márkaépítési beállítások elmentve';

  @override
  String get adminBrandingLoadFailed =>
      'Nem sikerült betölteni a márkaépítési beállításokat';

  @override
  String get adminLoginDisclaimer => 'Bejelentkezési felelősség kizárása';

  @override
  String get adminLoginDisclaimerHint => 'HTML a bejelentkezési űrlap alatt';

  @override
  String get adminCustomCss => 'Egyedi CSS';

  @override
  String get adminCustomCssHint => 'Egyéni CSS alkalmazva a webes felületen';

  @override
  String get adminEnableSplashScreen => 'Indítóképernyő engedélyezése';

  @override
  String get adminStreamingSaved => 'A streamelési beállítások elmentve';

  @override
  String get adminStreamingLoadFailed =>
      'Nem sikerült betölteni a streamelési beállításokat';

  @override
  String get adminStreamingDescription =>
      'Globális adatfolyam-bitráta-korlátok beállítása a távoli kapcsolatokhoz.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Távoli kliens bitsebesség-korlátja (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Hagyja üresen, vagy 0-t a korlátlanul';

  @override
  String get adminPlaybackSaved => 'A lejátszási beállítások elmentve';

  @override
  String get adminPlaybackLoadFailed =>
      'Nem sikerült betölteni a lejátszási beállításokat';

  @override
  String get adminPlaybackTranscoding => 'Lejátszás / Átkódolás';

  @override
  String get adminHardwareAcceleration => 'Hardveres gyorsítás';

  @override
  String get adminVaapiDevice => 'VA-API eszköz';

  @override
  String get adminEnableHardwareEncoding => 'Engedélyezze a hardveres kódolást';

  @override
  String get adminEnableHardwareDecoding =>
      'Hardveres dekódolás engedélyezése:';

  @override
  String get adminEncodingThreads => 'Kódolási szálak';

  @override
  String get adminAutomatic => '0 = automatikus';

  @override
  String get adminTranscodingTempPath => 'Átkódolási hőmérsékleti útvonal';

  @override
  String get adminEnableFallbackFont => 'Tartalék betűtípus engedélyezése';

  @override
  String get adminFallbackFontPath => 'Tartalék betűtípus elérési útja';

  @override
  String get adminAllowSegmentDeletion => 'Szegmens törlésének engedélyezése';

  @override
  String get adminSegmentKeepSeconds => 'Szegmens megtartása (másodperc)';

  @override
  String get adminThrottleBuffering => 'Fojtószelep pufferelés';

  @override
  String get adminTrickplaySaved => 'A trükkjáték beállításai mentve';

  @override
  String get adminTrickplayLoadFailed =>
      'Nem sikerült betölteni a trükkös lejátszási beállításokat';

  @override
  String get adminEnableHardwareAcceleration =>
      'Engedélyezze a hardveres gyorsítást';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Csak kulcskeret kivonat engedélyezése';

  @override
  String get adminKeyFrameSubtitle => 'Gyorsabb, de kisebb pontosság';

  @override
  String get adminScanBehavior => 'Szkennelési viselkedés';

  @override
  String get adminProcessPriority => 'A folyamat prioritása';

  @override
  String get adminImageSettings => 'Képbeállítások';

  @override
  String get adminIntervalMs => 'Időköz (ms)';

  @override
  String get adminCaptureFrameSubtitle =>
      'Milyen gyakran rögzítse a képkockákat';

  @override
  String get adminWidthResolutions => 'Szélesség felbontások';

  @override
  String get adminTileWidth => 'Csempe szélessége';

  @override
  String get adminTileHeight => 'Csempe magassága';

  @override
  String get adminQualitySubtitle =>
      'Alacsonyabb érték = jobb minőség, nagyobb fájlok';

  @override
  String get adminProcessThreads => 'Folyamat szálak';

  @override
  String get adminResumeSaved => 'Folytatási beállítások mentve';

  @override
  String get adminResumeLoadFailed =>
      'Nem sikerült betölteni az önéletrajzi beállításokat';

  @override
  String get adminResumeDescription =>
      'Konfigurálja, hogy mikor jelölje meg a tartalmat részben vagy teljesen lejátszottként.';

  @override
  String get adminMinResumePercentage => 'Minimális önéletrajzi százalék';

  @override
  String get adminMinResumeSubtitle =>
      'A haladás mentéséhez a tartalmat ezen a százalékon túl kell lejátszani';

  @override
  String get adminMaxResumePercentage => 'Maximális önéletrajzi százalék';

  @override
  String get adminMaxResumeSubtitle =>
      'A tartalom e százalék után teljesen lejátszottnak minősül';

  @override
  String get adminMinResumeDuration =>
      'Az önéletrajz minimális időtartama (másodperc)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Az ennél rövidebb tételek nem cserélhetők újra';

  @override
  String get adminMinAudiobookResume =>
      'A hangoskönyv önéletrajzának minimális százaléka';

  @override
  String get adminMaxAudiobookResume =>
      'A hangoskönyv önéletrajzának maximális százaléka';

  @override
  String get adminNetworkingSaved =>
      'A hálózati beállítások elmentve. A szerver újraindítására lehet szükség.';

  @override
  String get adminNetworkingLoadFailed =>
      'Nem sikerült betölteni a hálózati beállításokat';

  @override
  String get adminNetworkingWarning =>
      'A hálózati beállítások módosítása a szerver újraindítását teheti szükségessé.';

  @override
  String get adminEnableRemoteAccess => 'Távoli hozzáférés engedélyezése';

  @override
  String get ports => 'Portok';

  @override
  String get adminHttpPort => 'HTTP port';

  @override
  String get adminHttpsPort => 'HTTPS port';

  @override
  String get adminPublicHttpsPort => 'Nyilvános HTTPS port';

  @override
  String get adminBaseUrl => 'Alap URL';

  @override
  String get adminBaseUrlHint => 'például /zselé';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS engedélyezése';

  @override
  String get adminLocalNetwork => 'Helyi hálózat';

  @override
  String get adminLocalNetworkAddresses => 'Helyi hálózati címek';

  @override
  String get adminKnownProxies => 'Ismert proxyk';

  @override
  String get adminRemoteIpFilter => 'Távoli IP-szűrő';

  @override
  String get adminRemoteIpFilterEntries => 'Távoli IP szűrő';

  @override
  String get adminCertificatePath => 'Tanúsítvány elérési útja';

  @override
  String get whitelist => 'Fehérlista';

  @override
  String get blacklist => 'Feketelista';

  @override
  String get notSet => 'Nincs beállítva';

  @override
  String get adminMetadataSaved => 'A metaadatok mentve';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Frissítse a metaadatokat';

  @override
  String get recursive => 'Rekurzív';

  @override
  String get adminReplaceAllMetadata => 'Cserélje ki az összes metaadatot';

  @override
  String get adminReplaceAllImages => 'Cserélje ki az összes képet';

  @override
  String get adminMetadataRefreshRequested => 'Metaadatok frissítése kérve';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Távoli személy keresése';

  @override
  String get adminNoRemoteMatches => 'Nem található távoli egyezés';

  @override
  String get adminRemoteResults => 'Távoli eredmények';

  @override
  String get adminRemoteMetadataApplied => 'Távoli metaadatok alkalmazva';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Tartalomtípus frissítése';

  @override
  String get adminContentType => 'Tartalom típusa';

  @override
  String get adminContentTypeUpdated => 'Tartalomtípus frissítve';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nem sikerült betölteni a metaadatszerkesztőt';

  @override
  String get adminNoPeopleEntries => 'Nincsenek személyek bejegyzései';

  @override
  String get adminNoExternalIds => 'Nem állnak rendelkezésre külső azonosítók';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nem támogatott képformátum';

  @override
  String get adminImageReadFailed =>
      'Nem sikerült beolvasni a kiválasztott képet';

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
  String get adminAllProviders => 'Minden szolgáltató';

  @override
  String get adminNoRemoteImages => 'Nem találhatók távoli képek';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Hangoló hozzáadása';

  @override
  String get adminTunerType => 'Tuner típusa';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, egyéb';

  @override
  String get adminUrlPath => 'URL / elérési út';

  @override
  String get adminNameOptional => 'Név (nem kötelező)';

  @override
  String get adminTunerAdded => 'Tuner hozzá';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Útmutató-szolgáltató hozzáadása';

  @override
  String get adminProviderType => 'Szolgáltató típusa';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect vagy XMLTV';

  @override
  String get adminUsernameOptional => 'Felhasználónév (nem kötelező)';

  @override
  String get adminRefreshInterval => 'Frissítési időköz (óra)';

  @override
  String get adminProviderAdded => 'A szolgáltató hozzáadva';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tuner reset kérve';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Felvételi beállítások';

  @override
  String get adminPrePadding => 'Előtöltés (perc)';

  @override
  String get adminPostPadding => 'Utólagos kitöltés (perc)';

  @override
  String get adminRecordingPath => 'Felvételi útvonal';

  @override
  String get adminSeriesRecordingPath => 'Sorozat rögzítési útvonala';

  @override
  String get adminRecordingSettingsSaved => 'A rögzítési beállítások elmentve';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Csatornaleképezések beállítása';

  @override
  String get adminMappingJson => 'JSON leképezése';

  @override
  String get adminMappingJsonHint => 'Példa: JSON hasznos terhelés leképezése';

  @override
  String get adminChannelMappingsUpdated => 'A csatornaleképezések frissítve';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nem sikerült betölteni az élő tévéadás adminisztrációját';

  @override
  String get adminTunerDevices => 'Tuner eszközök';

  @override
  String get adminNoTunerHosts => 'Nincs beállítva tunergazda';

  @override
  String get adminGuideProviders => 'Útmutató-szolgáltatók';

  @override
  String get adminAddProvider => 'Szolgáltató hozzáadása';

  @override
  String get adminNoListingProviders =>
      'Nincsenek konfigurálva listaszolgáltatók';

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
  String get adminChannelMappings => 'Csatornaleképezések';

  @override
  String get adminNoDiscoveredTuners => 'Még nincsenek felfedezett tunerek';

  @override
  String get adminSettingsSaved => 'A beállítások elmentve';

  @override
  String get adminBackupsNotAvailable =>
      'Biztonsági másolatok nem érhetők el ezen a szerver builden.';

  @override
  String get adminRestoreWarning1 =>
      'A visszaállítás az ÖSSZES jelenlegi szerveradatot lecseréli a biztonsági mentési adatokra.';

  @override
  String get adminRestoreWarning2 =>
      'A jelenlegi szerverbeállítások, felhasználók és könyvtáradatok felülíródnak.';

  @override
  String get adminRestoreWarning3 =>
      'A szerver a visszaállítás után újraindul.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Visszaállítás kérve. A szerver újraindítása megszakíthatja a munkamenetet.';

  @override
  String get adminBackupsTitle => 'Biztonsági mentések';

  @override
  String get adminUnknownDate => 'Ismeretlen dátum';

  @override
  String get adminUnnamedBackup => 'Névtelen biztonsági mentés';

  @override
  String get adminLiveTvNotAvailable =>
      'Élő TV adminisztráció nem érhető el ezen a szerver builden.';

  @override
  String get adminLiveTvTitle => 'Élő TV adminisztráció';

  @override
  String get adminApply => 'Alkalmazni';

  @override
  String get adminNotSet => 'Nincs beállítva';

  @override
  String get adminReset => 'Reset';

  @override
  String get adminLogsTitle => 'Szervernaplók';

  @override
  String get adminLogsNewestFirst => 'Legújabb első';

  @override
  String get adminLogsOldestFirst => 'A legrégebbi első';

  @override
  String get adminLogsJustNow => 'Éppen most';

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
  String get adminLogViewerNoMatches => 'Nincsenek egyező sorok';

  @override
  String get adminMetadataEditorTitle => 'Metaadat-szerkesztő';

  @override
  String get adminMetadataRemote => 'Távoli';

  @override
  String get adminMetadataType => 'Írja be';

  @override
  String get adminMetadataDetails => 'Részletek';

  @override
  String get adminMetadataExternalIds => 'Külső azonosítók';

  @override
  String get adminMetadataImages => 'Képek';

  @override
  String get adminMetadataFieldTitle => 'Cím';

  @override
  String get adminMetadataFieldSortTitle => 'Rendezési cím';

  @override
  String get adminMetadataFieldOriginalTitle => 'Eredeti cím';

  @override
  String get adminMetadataFieldPremiereDate => 'Premier dátuma (ÉÉÉÉ-HH-NN)';

  @override
  String get adminMetadataFieldEndDate => 'Befejezés dátuma (ÉÉÉÉ-HH-NN)';

  @override
  String get adminMetadataFieldProductionYear => 'Gyártási év';

  @override
  String get adminMetadataFieldOfficialRating => 'Hivatalos minősítés';

  @override
  String get adminMetadataFieldCommunityRating => 'Közösségi minősítés';

  @override
  String get adminMetadataFieldCriticRating => 'Kritikus értékelés';

  @override
  String get adminMetadataFieldTagline => 'Címsor';

  @override
  String get adminMetadataFieldOverview => 'Áttekintés';

  @override
  String get adminMetadataGenres => 'Műfajok';

  @override
  String get adminMetadataTags => 'Címkék';

  @override
  String get adminMetadataStudios => 'Stúdiók';

  @override
  String get adminMetadataPeople => 'Emberek';

  @override
  String get adminMetadataAddGenre => 'Műfaj hozzáadása';

  @override
  String get adminMetadataAddTag => 'Címke hozzáadása';

  @override
  String get adminMetadataAddStudio => 'Stúdió hozzáadása';

  @override
  String get adminMetadataAddPerson => 'Személy hozzáadása';

  @override
  String get adminMetadataEditPerson => 'Személy szerkesztése';

  @override
  String get adminMetadataRole => 'Szerep';

  @override
  String get adminMetadataImagePrimary => 'Elsődleges';

  @override
  String get adminMetadataImageBackdrop => 'Háttér';

  @override
  String get adminMetadataImageLogo => 'Logó';

  @override
  String get adminMetadataImageBanner => 'Transzparens';

  @override
  String get adminMetadataImageThumb => 'Hüvelykujj';

  @override
  String get adminMetadataRecursive => 'Rekurzív';

  @override
  String get adminMetadataProvider => 'Szolgáltató';

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
      'Nem sikerült beolvasni a kiválasztott képet';

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
      'Ezzel eltávolítja az aktuális képet az elemből.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Feltöltés';

  @override
  String get adminMetadataUpdate => 'Frissítés';

  @override
  String get adminMetadataRemoteImage => 'Távoli kép';

  @override
  String get adminPluginsInstalled => 'Telepítve';

  @override
  String get adminPluginsCatalog => 'Katalógus';

  @override
  String get adminPluginsActive => 'Aktív';

  @override
  String get adminPluginsRestart => 'Indítsa újra';

  @override
  String get adminPluginsNoSearchResults =>
      'Egyetlen bővítmény sem felel meg a keresésnek';

  @override
  String get adminPluginsNoneInstalled => 'Nincs telepítve plugin';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Frissítés elérhető';

  @override
  String get adminPluginsPendingRemoval =>
      'Újraindítás utáni eltávolításra vár';

  @override
  String get adminPluginsChangesPending =>
      'A változtatások újraindításra várnak';

  @override
  String get adminPluginsEnable => 'Engedélyezés';

  @override
  String get adminPluginsDisable => 'Letiltás';

  @override
  String get adminPluginsInstallUpdate => 'Frissítés telepítése';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nincs a keresésnek megfelelő csomag';

  @override
  String get adminPluginsCatalogEmpty => 'Nincsenek elérhető csomagok';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Kísérleti integráció';

  @override
  String get adminPluginDetailExperimentalContent =>
      'A beépülő modul-beállítások integrációja még csak kísérleti jellegű. Előfordulhat, hogy egyes mezők vagy elrendezések még nem jelennek meg megfelelően.';

  @override
  String get adminPluginDetailToggle404 =>
      'Nem sikerült átkapcsolni a bővítményt. A szerver nem találta ezt a bővítményverziót. Próbálja meg frissíteni a beépülő modulokat, majd próbálkozzon újra.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Nem sikerült átkapcsolni a bővítményt. Kérjük, ellenőrizze a szervernaplókat a részletekért.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Részletek';

  @override
  String get adminPluginDetailDeveloper => 'Fejlesztő';

  @override
  String get adminPluginDetailRepository => 'Adattár';

  @override
  String get adminPluginDetailBundled => 'Csomagban';

  @override
  String get adminPluginDetailEnablePlugin => 'Beépülő modul engedélyezése';

  @override
  String get adminPluginDetailRestartRequired =>
      'A változtatások életbe léptetéséhez a szerver újraindítása szükséges.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Ez a beépülő modul eltávolításra kerül a szerver újraindítása után.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Ez a bővítmény meghibásodott, és előfordulhat, hogy nem működik megfelelően.';

  @override
  String get adminPluginDetailNotSupported =>
      'Ezt a beépülő modult a jelenlegi szerververzió nem támogatja.';

  @override
  String get adminPluginDetailSuperseded =>
      'Ezt a bővítményt egy újabb verzió váltotta fel.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Távolítsa el a tárhelyet';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Távolítsa el';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Nincsenek beállítva tárolók';

  @override
  String get adminReposEmptySubtitle =>
      'Adjon hozzá egy tárat az elérhető bővítmények böngészéséhez';

  @override
  String get adminReposUnnamed => '(névtelen)';

  @override
  String get adminReposEditTitle => 'Adattár szerkesztése';

  @override
  String get adminReposAddTitle => 'Adattár hozzáadása';

  @override
  String get adminReposUrl => 'Adattár URL-je';

  @override
  String get adminReposNameHint => 'például Jellyfin Stabil';

  @override
  String get adminPluginSettingsInvalidUrl => 'Érvénytelen URL';

  @override
  String get adminGeneralSettingsTitle => 'Általános beállítások';

  @override
  String get adminGeneralMetadataLanguage =>
      'Előnyben részesített metaadat-nyelv';

  @override
  String get adminGeneralMetadataLanguageHint => 'például en, de, fr';

  @override
  String get adminGeneralMetadataCountry =>
      'Előnyben részesített metaadatok országa';

  @override
  String get adminGeneralMetadataCountryHint => 'például USA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'A könyvtári szkennelés párhuzamossága';

  @override
  String get adminGeneralImageEncodingLimit => 'Párhuzamos képkódolási korlát';

  @override
  String get adminUnknownError => 'Ismeretlen hiba';

  @override
  String get adminBrowse => 'Tallózás';

  @override
  String get adminCloseBrowser => 'Zárja be a böngészőt';

  @override
  String get adminNetworkingTitle => 'Hálózatépítés';

  @override
  String get adminNetworkingRestartWarning =>
      'A hálózati beállítások módosítása a szerver újraindítását teheti szükségessé.';

  @override
  String get adminNetworkingRemoteAccess => 'Távoli hozzáférés engedélyezése';

  @override
  String get adminNetworkingPorts => 'Portok';

  @override
  String get adminNetworkingHttpPort => 'HTTP port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS port';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS engedélyezése';

  @override
  String get adminNetworkingLocalNetwork => 'Helyi hálózat';

  @override
  String get adminNetworkingLocalAddresses => 'Helyi hálózati címek';

  @override
  String get adminNetworkingAddressHint => 'például 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Ismert proxyk';

  @override
  String get adminNetworkingProxyHint => 'például 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Fehérlista';

  @override
  String get adminNetworkingBlacklist => 'Feketelista';

  @override
  String get adminNetworkingAddEntry => 'Bejegyzés hozzáadása';

  @override
  String get adminBrandingTitle => 'Márkaépítés';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Bejelentkezési felelősség kizárása';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML a bejelentkezési űrlap alatt';

  @override
  String get adminBrandingCustomCss => 'Egyedi CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Egyéni CSS alkalmazva a webes felületen';

  @override
  String get adminBrandingEnableSplash => 'Indítóképernyő engedélyezése';

  @override
  String get adminPlaybackHwAccel => 'Hardveres gyorsítás';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardveres gyorsítás';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Engedélyezze a hardveres kódolást';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Hardveres dekódolás engedélyezése:';

  @override
  String get adminPlaybackEncoding => 'Kódolás';

  @override
  String get adminPlaybackEncodingThreads => 'Kódolási szálak';

  @override
  String get adminPlaybackFallbackFont => 'Tartalék betűtípus engedélyezése';

  @override
  String get adminPlaybackFallbackFontPath => 'Tartalék betűtípus elérési útja';

  @override
  String get adminPlaybackStreaming => 'Folyó';

  @override
  String get adminResumeVideo => 'Videó';

  @override
  String get adminResumeAudiobooks => 'Hangoskönyvek';

  @override
  String get adminResumeMinAudiobookPct =>
      'A hangoskönyv önéletrajzának minimális százaléka';

  @override
  String get adminResumeMaxAudiobookPct =>
      'A hangoskönyv önéletrajzának maximális százaléka';

  @override
  String get adminStreamingBitrateLimit =>
      'Távoli kliens bitsebesség-korlátja (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Hagyja üresen, vagy 0-t a korlátlanul';

  @override
  String get adminTrickplayHwAccel => 'Engedélyezze a hardveres gyorsítást';

  @override
  String get adminTrickplayHwEncoding => 'Engedélyezze a hardveres kódolást';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Csak kulcskeret kivonat engedélyezése';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Gyorsabb, de kisebb pontosság';

  @override
  String get adminTrickplayNonBlocking => 'Nem blokkoló';

  @override
  String get adminTrickplayBlocking => 'Blokkolás';

  @override
  String get adminTrickplayPriorityHigh => 'Magas';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Normál felett';

  @override
  String get adminTrickplayPriorityNormal => 'Normál';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Normál alatt';

  @override
  String get adminTrickplayPriorityIdle => 'Tétlen';

  @override
  String get adminTrickplayImageSettings => 'Képbeállítások';

  @override
  String get adminTrickplayInterval => 'Időköz (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Milyen gyakran rögzítse a képkockákat';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Vesszővel elválasztott képpontszélességek (pl. 320)';

  @override
  String get adminTrickplayQuality => 'Minőség';

  @override
  String get adminTrickplayQScale => 'Minőségi skála';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Alacsonyabb érték = jobb minőség, nagyobb fájlok';

  @override
  String get adminTrickplayJpegQuality => 'JPEG minőség';

  @override
  String get adminTrickplayProcessing => 'Feldolgozás';

  @override
  String get adminTasksEmpty => 'Nem található ütemezett feladat';

  @override
  String get adminTasksNoFilterMatch =>
      'Egyetlen feladat sem felel meg az aktuális szűrőnek';

  @override
  String get adminTaskCancelling => 'Lemondás...';

  @override
  String get adminTaskRunning => 'Futás...';

  @override
  String get adminTaskNeverRun => 'Soha ne fuss';

  @override
  String get adminTaskStop => 'Stop';

  @override
  String get adminTaskRun => 'Fut';

  @override
  String get adminTaskDetailLastExecution => 'Utolsó Kivégzés';

  @override
  String get adminTaskDetailStarted => 'Elindult';

  @override
  String get adminTaskDetailEnded => 'Véget ért';

  @override
  String get adminTaskDetailDuration => 'Időtartam';

  @override
  String get adminTaskDetailErrorLabel => 'Hiba:';

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
  String get adminTaskTriggerStartup => 'Az alkalmazás indításakor';

  @override
  String get adminTaskTriggerTypeDaily => 'Napi';

  @override
  String get adminTaskTriggerTypeWeekly => 'Heti';

  @override
  String get adminTaskTriggerTypeInterval => 'Időközönként';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervallum';

  @override
  String get adminTaskTriggerEveryHour => 'Minden órában';

  @override
  String get adminTaskTriggerEvery6Hours => '6 óránként';

  @override
  String get adminTaskTriggerEvery12Hours => '12 óránként';

  @override
  String get adminTaskTriggerEvery24Hours => '24 óránként';

  @override
  String get adminTaskTriggerEvery2Days => '2 naponta';

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
  String get adminTaskTriggerTime => 'Idő';

  @override
  String get adminTaskTriggerNoLimit => 'Nincs korlátozás';

  @override
  String get adminActivityJustNow => 'Éppen most';

  @override
  String get adminActivityLastHour => 'Utolsó óra';

  @override
  String get adminActivityToday => 'Ma';

  @override
  String get adminActivityYesterday => 'Tegnap';

  @override
  String get adminActivityOlder => 'Régebbi';

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
  String get adminActivityNow => 'jelenleg';

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
      'Állítsa be a trükkös lejátszás képgenerálását az előnézeti bélyegképek kereséséhez.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Nyilvános HTTPS port';

  @override
  String get adminNetworkingBaseUrl => 'Alap URL';

  @override
  String get adminNetworkingBaseUrlHint => 'például /zselé';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Tanúsítvány elérési útja';

  @override
  String get adminNetworkingRemoteIpFilter => 'Távoli IP-szűrő';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Távoli IP szűrő';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API eszköz';

  @override
  String get adminPlaybackAutomatic => '0 = automatikus';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Átkódolási hőmérsékleti útvonal';

  @override
  String get adminPlaybackSegmentDeletion =>
      'Szegmens törlésének engedélyezése';

  @override
  String get adminPlaybackSegmentKeep => 'Szegmens megtartása (másodperc)';

  @override
  String get adminPlaybackThrottleBuffering => 'Fojtószelep pufferelés';

  @override
  String get adminResumeMinPct => 'Minimális önéletrajzi százalék';

  @override
  String get adminResumeMinPctSubtitle =>
      'A haladás mentéséhez a tartalmat ezen a százalékon túl kell lejátszani';

  @override
  String get adminResumeMaxPct => 'Maximális önéletrajzi százalék';

  @override
  String get adminResumeMaxPctSubtitle =>
      'A tartalom e százalék után teljesen lejátszottnak minősül';

  @override
  String get adminResumeMinDuration =>
      'Az önéletrajz minimális időtartama (másodperc)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Az ennél rövidebb tételek nem cserélhetők újra';

  @override
  String get adminTrickplayScanBehavior => 'Szkennelési viselkedés';

  @override
  String get adminTrickplayProcessPriority => 'A folyamat prioritása';

  @override
  String get adminTrickplayTileWidth => 'Csempe szélessége';

  @override
  String get adminTrickplayTileHeight => 'Csempe magassága';

  @override
  String get adminTrickplayProcessThreads => 'Folyamat szálak';

  @override
  String get adminTrickplayWidthResolutions => 'Szélesség felbontások';

  @override
  String get adminMetadataDefault => 'Alapértelmezett';

  @override
  String get adminMetadataContentTypeUpdated => 'Tartalomtípus frissítve';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Lassú válaszküszöb (ms)';

  @override
  String get adminGeneralCachePath => 'Gyorsítótár elérési útja';

  @override
  String get adminGeneralMetadataPath => 'Metaadat elérési út';

  @override
  String get adminGeneralServerName => 'Szerver neve';

  @override
  String get adminSettingsLoadFailed =>
      'Nem sikerült betölteni a beállításokat';

  @override
  String get adminDiscover => 'Fedezze fel';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Mappák';

  @override
  String get libraries => 'Könyvtárak';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay letiltva';

  @override
  String get syncPlayDisabledMessage =>
      'A szinkronizált lejátszás használatához engedélyezze a SyncPlay beállítást a Beállításokban.';

  @override
  String get syncPlayServerUnsupportedTitle => 'A szerver nem támogatott';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'A SyncPlay Jellyfin szervert igényel. A jelenlegi szerver nem támogatja.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Csoport';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay csoport';

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
  String get syncPlayIgnoreWait => 'Figyelmen kívül hagyja a várakozást';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Ne tartsa fenn a csoportot, amíg az eszköz pufferel';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Folytassa helyben, anélkül, hogy a lassú tagokra várna';

  @override
  String get syncPlayRepeat => 'Ismétlés';

  @override
  String get syncPlayRepeatOne => 'Egy';

  @override
  String get syncPlayShuffleModeShuffled => 'Megkeverve';

  @override
  String get syncPlayShuffleModeSorted => 'Rendezett';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Az aktuális lejátszási sor szinkronizálása';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Cserélje le a csoportos sort a helyileg lejátszottra';

  @override
  String get syncPlayLeaveGroup => 'Kilépés a csoportból';

  @override
  String get syncPlayGroupQueue => 'Csoportos várólista';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Játssz most';

  @override
  String get syncPlayCreateNewGroup => 'Hozzon létre egy új csoportot';

  @override
  String get syncPlayGroupName => 'Csoport neve';

  @override
  String get syncPlayDefaultGroupName => 'Saját SyncPlay csoportom';

  @override
  String get syncPlayCreateGroup => 'Csoport létrehozása';

  @override
  String get syncPlayAvailableGroups => 'Elérhető csoportok';

  @override
  String get syncPlayNoGroupsAvailable => 'Nincsenek elérhető csoportok';

  @override
  String get syncPlayJoinGroupQuestion => 'Csatlakozik a SyncPlay csoporthoz?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Egy SyncPlay csoporthoz való csatlakozás lecserélheti a jelenlegi lejátszási sort. Folytatja?';

  @override
  String get syncPlayJoin => 'Csatlakozik';

  @override
  String get syncPlayStateIdle => 'Tétlen';

  @override
  String get syncPlayStateWaiting => 'Várakozás';

  @override
  String get syncPlayStatePaused => 'Szüneteltetve';

  @override
  String get syncPlayStatePlaying => 'Játék';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay hozzáférés megtagadva';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nincs hozzáférése egy vagy több elemhez ebben a SyncPlay csoportban. Kérje meg a csoport tulajdonosát, hogy ellenőrizze a könyvtári engedélyeket, vagy válasszon másik sort.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'A hangalapú keresés nem érhető el.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision A közvetlen lejátszás nem sikerült';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Nem sikerült elindítani a közvetlen lejátszást ehhez a Dolby Vision adatfolyamhoz. Megpróbálja újra a szerver átkódolását?';

  @override
  String get retryWithTranscode => 'Próbálja újra átkódolással';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Nem támogatott';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Ez az eszköz nem tudja közvetlenül dekódolni a Dolby Vision tartalmat. Használja a HDR10 tartalékot, vagy kérje a szerver átkódolását.';

  @override
  String get rememberMyChoice => 'Emlékezz a választásomra';

  @override
  String get playHdr10Fallback => 'HDR10 tartalék lejátszása';

  @override
  String get requestTranscode => 'Átkódolás kérése';

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
  String get seeAll => 'Összes megtekintése';

  @override
  String get noItems => 'Nincsenek tételek';

  @override
  String get switchUser => 'Felhasználóváltás';

  @override
  String get remoteControl => 'Távirányító';

  @override
  String get mediaBarLoading => 'Médiasáv betöltése...';

  @override
  String get mediaBarError => 'A médiasáv betöltése nem sikerült';

  @override
  String get offlineServerUnavailable =>
      'Csatlakozva az internethez, de a jelenlegi szerver nem elérhető.';

  @override
  String get offlineNoInternet =>
      'Ön offline állapotban van. Csak a letöltött tartalom érhető el.';

  @override
  String get offlineFileNotAvailable => 'A fájl nem érhető el';

  @override
  String get offlineSwitchServer => 'Szerver váltása';

  @override
  String get offlineSavedMedia => 'Mentett média';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Távoli lejátszás';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Eszköz hangereje';

  @override
  String get castVolumeUnavailable => 'Nem elérhető';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Hang';

  @override
  String get subtitlesLabel => 'Feliratok';

  @override
  String get pinConfirmTitle => 'Erősítse meg a PIN kódot';

  @override
  String get pinSetTitle => 'PIN-kód beállítása';

  @override
  String get pinEnterTitle => 'Írja be a PIN-kódot';

  @override
  String get pinReenterToConfirm => 'A megerősítéshez írja be újra a PIN-kódot';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Helytelen PIN-kód';

  @override
  String get pinMismatch => 'A PIN-kódok nem egyeznek';

  @override
  String get pinForgot => 'Elfelejtette a PIN-kódot?';

  @override
  String get pinClear => 'Világos';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'A gyorscsatlakozási kérés engedélyezve.';

  @override
  String get quickConnectInvalidOrExpired =>
      'A gyorscsatlakozási kód érvénytelen vagy lejárt.';

  @override
  String get quickConnectNotSupported =>
      'A gyorscsatlakozás nem támogatott ezen a szerveren.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Nem sikerült engedélyezni a Quick Connect kódot.';

  @override
  String get quickConnectDisabled =>
      'A gyors csatlakozás le van tiltva ezen a szerveren.';

  @override
  String get quickConnectForbidden =>
      'Fiókja nem tudja engedélyezni ezt a gyorscsatlakozási kérést.';

  @override
  String get quickConnectNotFound =>
      'A gyorscsatlakozási kód nem található. Próbáljon ki egy új kódot.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Írja be a kódot';

  @override
  String get quickConnectAuthorize => 'Engedélyezze';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Távirányító';

  @override
  String get remoteFailedToLoadSessions =>
      'Nem sikerült betölteni a munkameneteket';

  @override
  String get remoteNoSessions => 'Nincsenek vezérelhető munkamenetek';

  @override
  String get remoteStartPlayback =>
      'Indítsa el a lejátszást egy másik eszközön';

  @override
  String get unknownUser => 'Ismeretlen';

  @override
  String get unknownItem => 'Ismeretlen';

  @override
  String get remoteNothingPlaying => 'Semmi sem játszik le ezen a munkameneten';

  @override
  String get castingStarted =>
      'Az átküldés megkezdődött a kiválasztott eszközön';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nem állnak rendelkezésre távoli lejátszó eszközök.';

  @override
  String get noRemoteDevicesIos =>
      'Nem állnak rendelkezésre távoli lejátszó eszközök.\n\niOS rendszeren előfordulhat, hogy a AirPlay célpontok nem érhetők el a szimulátorban.';

  @override
  String get trackActionPlayNext => 'Play Next';

  @override
  String get trackActionAddToQueue => 'Hozzáadás a sorhoz';

  @override
  String get trackActionAddToPlaylist => 'Hozzáadás a lejátszási listához';

  @override
  String get trackActionCancelDownload => 'Letöltés megszakítása';

  @override
  String get trackActionDeleteFromPlaylist => 'Törlés a lejátszási listáról';

  @override
  String get trackActionMoveUp => 'Mozgás felfelé';

  @override
  String get trackActionMoveDown => 'Mozgás Le';

  @override
  String get trackActionRemoveFromFavorites => 'Eltávolítás a Kedvencek közül';

  @override
  String get trackActionAddToFavorites => 'Hozzáadás a kedvencekhez';

  @override
  String get trackActionGoToAlbum => 'Ugrás az Albumhoz';

  @override
  String get trackActionGoToArtist => 'Lépjen a Művész oldalra';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'A letöltött fájl törölve';

  @override
  String get trackActionDeleteFileFailed =>
      'Nem sikerült törölni a letöltött fájlt';

  @override
  String get shuffleBy => 'Shuffle By';

  @override
  String get shuffleSelectLibrary => 'Válassza a Könyvtár lehetőséget';

  @override
  String get shuffleSelectGenre => 'Válassza ki a Műfajt';

  @override
  String get shuffleLibrary => 'Könyvtár';

  @override
  String get shuffleGenre => 'Műfaj';

  @override
  String get shuffleNoLibraries =>
      'Nem állnak rendelkezésre kompatibilis könyvtárak.';

  @override
  String get shuffleNoGenres =>
      'Nem található műfaj ehhez a véletlenszerű lejátszási módhoz.';

  @override
  String get posterDisplayTitle => 'Kijelző';

  @override
  String get posterImageType => 'Kép típusa';

  @override
  String get imageTypePoster => 'Poszter';

  @override
  String get imageTypeThumbnail => 'Miniatűr';

  @override
  String get imageTypeBanner => 'Transzparens';

  @override
  String get playlistAddFailed =>
      'Nem sikerült hozzáadni a lejátszási listához';

  @override
  String get playlistCreateFailed =>
      'Nem sikerült létrehozni a lejátszási listát';

  @override
  String get playlistNew => 'Új lejátszási lista';

  @override
  String get playlistCreate => 'Teremt';

  @override
  String get playlistCreateNew => 'Új lejátszási lista létrehozása';

  @override
  String get playlistNoneFound => 'Nem található lejátszási lista';

  @override
  String get addToPlaylist => 'Hozzáadás a lejátszási listához';

  @override
  String get lyricsNotAvailable => 'Nincs elérhető dalszöveg';

  @override
  String get upNext => 'Fel Következő';

  @override
  String get playNext => 'Play Next';

  @override
  String get stillWatchingContent => 'A lejátszás szünetel. Még mindig nézed?';

  @override
  String get stillWatchingStop => 'Stop';

  @override
  String get stillWatchingContinue => 'Folytatás';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Élő TV';

  @override
  String get continueWatchingAndNextUp =>
      'Folytassa a megtekintést és a következőt';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Következő epizód';

  @override
  String get moreFromThisSeason => 'Még több ebből az évadból';

  @override
  String get playerTooltipPlaybackSpeed => 'Lejátszási sebesség';

  @override
  String get playerTooltipCastControls => 'Cast vezérlők';

  @override
  String get playerTooltipPlaybackQuality => 'Bitráta';

  @override
  String get playerTooltipEnterFullscreen => 'Lépjen be a teljes képernyőre';

  @override
  String get playerTooltipExitFullscreen => 'Lépjen ki a teljes képernyőről';

  @override
  String get playerTooltipFloatOnTop => 'Lebegjen a tetején';

  @override
  String get playerTooltipExitFloatOnTop => 'Tiltsa le az úszót a tetején';

  @override
  String get playerTooltipLockLandscape => 'Lock táj';

  @override
  String get playerTooltipUnlockOrientation => 'Forgatás engedélyezése';

  @override
  String get playerTooltipPrevious => 'Előző';

  @override
  String get playerTooltipSeekBack => 'Keress vissza';

  @override
  String get playerTooltipSeekForward => 'Keress előre';

  @override
  String get contextMenuMarkWatched => 'Megjelölés figyeltként';

  @override
  String get contextMenuMarkUnwatched => 'Megjelölés nem figyeltként';

  @override
  String get contextMenuAddToFavorites => 'Hozzáadás a kedvencekhez';

  @override
  String get contextMenuRemoveFromFavorites => 'Eltávolítás a Kedvencek közül';

  @override
  String get contextMenuGoToSeries => 'Ugrás a sorozathoz';

  @override
  String get settingsAdministrationSubtitle =>
      'Nyissa meg a szerveradminisztrációs panelt';

  @override
  String get settingsAccountSecurity => 'Fiók és biztonság';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Hitelesítés, PIN-kód és szülői felügyelet';

  @override
  String get settingsPersonalization => 'Személyre szabás';

  @override
  String get settingsPersonalizationSubtitle =>
      'Téma, navigáció, kezdősorok és könyvtár láthatósága';

  @override
  String get settingsDynamicContent => 'Dinamikus tartalom';

  @override
  String get settingsDynamicContentSubtitle => 'Médiasáv és vizuális fedvények';

  @override
  String get settingsPlaybackSyncplay => 'Lejátszás és SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Audio/video beállítások, feliratok, letöltések és SyncPlay vezérlők';

  @override
  String get settingsIntegrationsSubtitle =>
      'Beépülő modulok szinkronizálása, Seerr, értékelések és egyebek';

  @override
  String get settingsAboutSubtitle =>
      'Az alkalmazás verziója, jogi információk és kreditek';

  @override
  String get settingsAuthenticationSection => 'HITELESÍTÉS';

  @override
  String get settingsSortServersBy => 'Szerverek rendezése szerint';

  @override
  String get settingsLastUsed => 'Utoljára használt';

  @override
  String get settingsAlphabetical => 'Betűrendes';

  @override
  String get settingsPrivacyAndSafetySection => 'ADATVÉDELEM ÉS BIZTONSÁG';

  @override
  String get settingsBlockedRatings => 'Blokkolt értékelések';

  @override
  String get settingsGeneralStyle => 'Általános stílus';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Téma hangsúlyok, hátterek, figyelt indikátorok és témazene';

  @override
  String get settingsHomePage => 'Kezdőlap';

  @override
  String get settingsHomePageSubtitle =>
      'Szakaszok, képtípusok, lefedések és média előnézetek';

  @override
  String get settingsLibrariesSubtitle =>
      'Könyvtár láthatósága, mappanézet és többkiszolgálós viselkedés';

  @override
  String get settingsTwentyFourHourClock => '24 órás óra';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Használja a 24 órás időformátumot, ahol az óra látható';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Jelenítse meg a keverés gombot a navigációs sávban';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'A műfajok gomb megjelenítése a navigációs sávban';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'A kedvencek gomb megjelenítése a navigációs sávban';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Jelenítse meg a könyvtárak gombot a navigációs sávban';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'A kezdőlap láthatóságának váltása könyvtáronként. Indítsa újra a Moonfin alkalmazást, hogy a változtatások életbe lépjenek.';

  @override
  String get settingsMediaBarAndLocalPreviews => 'Médiasáv és helyi előnézetek';

  @override
  String get settingsVisualOverlays => 'Vizuális lefedések';

  @override
  String get settingsSeasonalSurprise => 'Szezonális meglepetés';

  @override
  String get settingsMetadataAndRatings => 'Metaadatok és értékelések';

  @override
  String get settingsPluginScreenDescription =>
      'A Moonbase a szerveroldali integrációt támogatja, beleértve a további minősítési forrásokat, a Seerr kéréseket és a szinkronizált beállításokat.';

  @override
  String get settingsOfflineDownloads => 'Offline letöltések';

  @override
  String get settingsHigh => 'Magas';

  @override
  String get settingsLow => 'Alacsony';

  @override
  String get settingsCustomPath => 'Egyéni elérési út';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Adja meg a letöltési mappa elérési útját';

  @override
  String get settingsConcurrentDownloads => 'Egyidejű letöltések';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Az egyszerre letölthető elemek maximális száma.';

  @override
  String get settingsAppInfo => 'APP INFORMÁCIÓ';

  @override
  String get settingsReportAnIssue => 'Probléma bejelentése';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Nyissa meg a problémakövetőt a következőn: GitHub';

  @override
  String get settingsJoinDiscord => 'Csatlakozás Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Csevegés a közösséggel';

  @override
  String get settingsJoinTheDiscord => 'Csatlakozzon a Discord';

  @override
  String get settingsSupportMoonfin => 'Támogatás Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'JOGI';

  @override
  String get settingsLicenses => 'Licencek';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Nyílt forráskódú licenc megjegyzések';

  @override
  String get settingsPrivacyPolicy => 'Adatvédelmi szabályzat';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Hogyan kezeli a Moonfin az Ön adatait';

  @override
  String get settingsCheckForUpdates => 'Ellenőrizze a frissítéseket';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Ellenőrizze a legújabb Moonfin kiadást';

  @override
  String get settingsPoweredByFlutter => 'Powered by Flutter';

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
  String get settingsBoth => 'Mindkét';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Véletlenszerű tartalomtípus szűrő';

  @override
  String get settingsVideoPlaybackPreferences => 'Videó lejátszási beállítások';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Alapvető videómotor és streaming minőségi beállítások';

  @override
  String get settingsAudioPreferences => 'Hangbeállítások';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Hangsávok, feldolgozás és áthárítási lehetőségek';

  @override
  String get settingsAutomationAndQueue => 'Automatizálás és sor';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatikus lejátszás és szekvenálás';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'A letöltési minőség, a tárolási korlátok és a sor mérete';

  @override
  String get settingsSyncplaySubtitle =>
      'Szinkronizálási logika a csoportos munkamenetekhez';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Speciális lejátszó funkciók. Használja körültekintően, mert egyes opciók lejátszási problémákat okozhatnak';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Kihagyja a bevezetőket és a végeket?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => 'Felhasználó kérése';

  @override
  String get settingsSkip => 'Kihagyás';

  @override
  String get settingsDoNothing => 'Ne csinálj semmit';

  @override
  String get settingsMaxBitrateDescription =>
      'Korlátozza a streaming bitrátát. A küszöbérték feletti tartalmat a rendszer átkódolja, hogy illeszkedjen.';

  @override
  String get settingsMaxResolutionDescription =>
      'Korlátozza a játékos által kért maximális felbontást. A nagyobb felbontású tartalom le lesz kódolva.';

  @override
  String get settingsPlayerZoomDescription =>
      'Hogyan kell a videót a képernyőhöz igazítani.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Válassza ki az alapértelmezett lejátszási motort Android TV-eszközökön. A változtatások a következő lejátszási munkamenetre vonatkoznak.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (ajánlott)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (örökölt)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Tartalék';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Viselkedés a Dolby Vision címekhez Dolby Vision dekódolás nélküli eszközökön.';

  @override
  String get settingsAskEachTime => 'Kérdezd meg minden alkalommal';

  @override
  String get settingsPreferHdr10Fallback => 'Inkább HDR10 tartalék';

  @override
  String get settingsPreferServerTranscode =>
      'Szerver átkódolás előnyben részesítése';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profil 7 Közvetlen lejátszás';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Azt szabályozza, hogy a Dolby Vision 7. profil 7. bővítőrétegű adatfolyamai irányítsák-e a lejátszást.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automatikus (AFTKRT engedélyezve)';

  @override
  String get settingsEnabledOnThisDevice => 'Engedélyezve ezen az eszközön';

  @override
  String get settingsDisabledPreferTranscode => 'Letiltva (inkább átkódolás)';

  @override
  String get settingsResumeRewindDescription =>
      'A lejátszás folytatásakor (a Megtekintés folytatása vagy egy médiaelem oldaláról) hány másodpercet kell visszatekerni?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Ha a szünet gomb megnyomása után folytatja a lejátszást, hány másodpercet kell visszatekerni?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Hány másodpercet kell visszaugrani a visszatekerés gomb megnyomása után.';

  @override
  String get settingsOneSecond => '1 másodperc';

  @override
  String get settingsThreeSeconds => '3 másodperc';

  @override
  String get settingsFortyFiveSeconds => '45 másodperc';

  @override
  String get settingsSixtySeconds => '60 másodperc';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Hány másodpercet kell előre ugrani a gyors előretekerés gomb megnyomása után.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitfolyam AC3 külső dekóderhez';

  @override
  String get settingsCinemaMode => 'Mozi mód';

  @override
  String get settingsCinemaModeSubtitle =>
      'Játssz előzeteseket/prerollokat egy fő funkció előtt';

  @override
  String get settingsNextUpDisplayDescription =>
      'Az Extended egy teljes kártyát jelenít meg az epizód grafikájával és leírásával. A Minimál egy kompakt visszaszámláló fedvényt mutat. A Letiltva teljesen elrejti a promptot.';

  @override
  String get settingsShort => 'Rövid';

  @override
  String get settingsLong => 'Hosszú';

  @override
  String get settingsVeryLong => 'Nagyon hosszú';

  @override
  String get settingsVideoStartDelay => 'Videó indítási késleltetése';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Élő TV közvetlen';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Közvetlen lejátszás engedélyezése az élő tévéadáshoz';

  @override
  String get settingsOpenGroups => 'Nyissa meg a Csoportokat';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay csoport létrehozása, csatlakozása vagy kezelése';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Engedélyezve';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Csoportfigyelő funkciók engedélyezése';

  @override
  String get settingsSyncplayButton => 'SyncPlay Gomb';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Jelenítse meg a SyncPlay gombot a navigációs sávon';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Speciális javítás';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Finomszemcsés szinkronizálási logika engedélyezése';

  @override
  String get settingsSyncplaySyncCorrection => 'Szinkronizálás korrekciója';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'A lejátszás automatikus beállítása, hogy szinkronban maradjon';

  @override
  String get settingsSyncplaySpeedToSync => 'Szinkronizálási sebesség';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'A szinkronizáláshoz használja a lejátszási sebesség beállítását';

  @override
  String get settingsSyncplaySkipToSync => 'Ugrás a Szinkronizáláshoz';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Használja a keresést a szinkronizáláshoz';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Minimális sebesség késleltetés';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Maximális sebesség késleltetés';

  @override
  String get settingsSyncplaySpeedDuration => 'Sebesség időtartama';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minimális kihagyási késleltetés';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Extra eltolás';

  @override
  String get onNow => 'Be Most';

  @override
  String get collections => 'Gyűjtemények';

  @override
  String get lastPlayed => 'Utoljára játszott';

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
