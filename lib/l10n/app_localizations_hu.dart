// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'Fiókbeállítások';

  @override
  String get interfaceLanguage => 'Felület nyelve';

  @override
  String get systemLanguageDefault => 'Alapértelmezett';

  @override
  String get signIn => 'Bejelentkezés';

  @override
  String get empty => 'Üres';

  @override
  String connectingToServer(String serverName) {
    return 'Csatlakozás $serverName-hez';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Jelszó';

  @override
  String get username => 'Felhasználónév';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Írd be ezt a kódot a szervered webes irányítópultján:';

  @override
  String get waitingForAuthorization => 'Várakozás az engedélyezésre...';

  @override
  String get back => 'Vissza';

  @override
  String get serverUnavailable => 'A szerver nem elérhető';

  @override
  String get loginFailed => 'Nem sikerült bejelentkezni';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect nem érhető el: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nem érhető el ($status): $detail';
  }

  @override
  String get whosWatching => 'Ki nézi?';

  @override
  String get addUser => 'Felhasználó hozzáadása';

  @override
  String get selectServer => 'Szerver kiválasztása';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin verzió $version';
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
  String get embyConnect => 'Emby Connect';

  @override
  String get removeServer => 'Szerver eltávolítása';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Eltávolítod a(z) „$serverName” szervert a szervereid közül?';
  }

  @override
  String get cancel => 'Mégse';

  @override
  String get remove => 'Eltávolítás';

  @override
  String get connectToServer => 'Csatlakozás a szerverhez';

  @override
  String get serverAddress => 'Szerver címe';

  @override
  String get serverAddressHint => 'https://te-szervered.pelda.com';

  @override
  String get connect => 'Csatlakozás';

  @override
  String get secureStorageUnavailable => 'Biztonságos tárhely nem érhető el';

  @override
  String get secureStorageUnavailableMessage =>
      'A Moonfin nem tudott hozzáférni a rendszer kulcstartójához. A bejelentkezés folytatódhat, de előfordulhat, hogy a biztonságos tokentároló nem érhető el, amíg a kulcstartót fel nem oldják.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Alkalmazástéma';

  @override
  String get detailScreenStyle => 'Részletképernyő stílusa';

  @override
  String get detailScreenStyleSubtitle =>
      'A klasszikus az eredeti, középre igazított Moonfin elrendezés. A modern egy reszponzív, moziszerű elrendezés.';

  @override
  String get detailScreenStyleMoonfin => 'Klasszikus';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get expandedTabs => 'Kibontott lapok';

  @override
  String get expandedTabsSubtitle =>
      'Lapok tartalmának automatikus megjelenítése a lapok böngészése közben. Kapcsold ki az egyes lapok kézi megnyitásához és bezárásához.';

  @override
  String get showTechnicalDetails => 'Megjelenjenek a technikai részletek?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Kodek-, felbontás- és stream-információk megjelenítése a banner-összefoglalóban';

  @override
  String get recommendationSystem => 'Ajánlórendszer';

  @override
  String get recommendationSystemSubtitle =>
      'Használd a Moonfin ajánlásai helyi könyvtári algoritmust vagy az online TMDb hasonlósági mutatóit. Megjegyzés: Az online ajánlásokhoz Seerr-integráció szükséges.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin ajánlásai';

  @override
  String get recommendationSystemTmdb => 'TMDb hasonlóság';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Alkalmazod a szülői korhatár-korlátot?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Korlátozd a „Moonfin ajánlásai” javaslatait a célmédia szülői korhatár-besorolása alapján';

  @override
  String get interfaceStyle => 'Felület stílusa';

  @override
  String get interfaceStyleSubtitle =>
      'Az automatikus igazodik az eszközödhöz. Válaszd az Apple vagy a Material stílust a kinézet rögzítéséhez.';

  @override
  String get interfaceStyleAutomatic => 'Automatikus';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Üveghatás minősége';

  @override
  String get glassQualitySubtitle =>
      'Az Automatikus opció kiválasztja a legjobb üveghatást ehhez az eszközhöz. A Teljes opció valódi elmosódást kényszerít ki, a Csökkentett pedig egy könnyű üveget használ, amivel GPU-teljesítményt takaríthatsz meg.';

  @override
  String get glassQualityAuto => 'Automatikus';

  @override
  String get glassQualityFull => 'Teljes';

  @override
  String get glassQualityReduced => 'Csökkentett';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Alkalmazz egy teljesen egyedi témát, és válts az Apple vagy a Material által ihletett felhasználói felületre.';

  @override
  String get customThemeTitle => 'Egyedi téma';

  @override
  String get customThemeSubtitle =>
      'Az egyedi témák módosítják a Moonfin vizuális elemeit. Válassz egyet a stílusodhoz illő lehetőségek közül.';

  @override
  String get keyboardPreferSystemIme =>
      'Rendszerbillentyűzet előnyben részesítése';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Használd alapértelmezetten az eszközöd beviteli módját a szövegbevitelhez';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Az eredeti, letisztult Moonfin alapértelmezés.';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stílus bíbor fénnyel, ciánkék szöveggel és erősebb króm kontraszttal';

  @override
  String get themeGlass => 'Üveg';

  @override
  String get themeGlassSubtitle =>
      'Folyékony üveg stílus színátmenetes háttérrel, jeges felülettel és Apple-kék kiemelő színnel';

  @override
  String get theme8BitHero => '8-bites hős';

  @override
  String get theme8BitHeroSubtitle =>
      'Retró pixel-art stílus egyedi színpalettával, szögletes szegélyekkel, éles vetett árnyékokkal és pixel betűtípussal';

  @override
  String get embyConnectSignInSubtitle =>
      'Jelentkezz be az Emby Connect fiókoddal';

  @override
  String get emailOrUsername => 'E-mail-cím vagy felhasználónév';

  @override
  String get selectAServer => 'Válassz ki egy szervert';

  @override
  String get tryAgain => 'Próbáld újra';

  @override
  String get noLinkedServers =>
      'Nincsenek szerverek társítva ehhez az Emby Connect fiókhoz';

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
      'Hálózati hiba az Emby Connecttel vagy a kiválasztott szerverrel való kapcsolatfelvétel során';

  @override
  String get loadingLinkedServers => 'Összekapcsolt szerverek betöltése...';

  @override
  String get connectingToServerEllipsis => 'Csatlakozás a szerverhez...';

  @override
  String get noReachableAddress => 'Nincs megadva elérhető cím';

  @override
  String get invalidServerExchangeResponse =>
      'Érvénytelen válasz a szervercsere-végponttól';

  @override
  String unableToConnectTo(String target) {
    return 'Nem sikerült csatlakozni a következőhöz: $target';
  }

  @override
  String get exitApp => 'Kilépsz a Moonfinből?';

  @override
  String get exitAppConfirmation => 'Biztosan ki szeretnél lépni?';

  @override
  String get exit => 'Kilépés';

  @override
  String get gameMenu => 'Menü';

  @override
  String get gamePaused => 'Szüneteltetve';

  @override
  String get gameSaveState => 'Állás mentése';

  @override
  String get games => 'Játékok';

  @override
  String get gameLoadState => 'Állás betöltése';

  @override
  String get gameFastForward => 'Gyorstekerés';

  @override
  String get gameEmulatorSettings => 'Emulátor-beállítások';

  @override
  String get gameNoCoreOptions =>
      'Ez a mag nem rendelkezik módosítható beállításokkal.';

  @override
  String get gameHoldToOpenMenu => 'Tartsd lenyomva a menü megnyitásához';

  @override
  String get gamePlaybackUnsupported =>
      'A játékok lejátszása még nem támogatott ezen az eszközön.';

  @override
  String get noHomeRowsLoaded => 'Nem sikerült betölteni a kezdősorokat';

  @override
  String get noHomeRowsHint =>
      'Próbáld meg frissíteni vagy csökkenteni az aktív kezdőképernyő-szakaszokat.';

  @override
  String get retryHomeRows => 'Kezdősorok újrapróbálása';

  @override
  String get guide => 'Műsorújság';

  @override
  String get recordings => 'Felvételek';

  @override
  String get schedule => 'Ütemezés';

  @override
  String get series => 'Sorozatok';

  @override
  String get noItemsFound => 'Nem találhatók elemek';

  @override
  String get home => 'Kezdőlap';

  @override
  String get browseAll => 'Összes böngészése';

  @override
  String get genres => 'Műfajok';

  @override
  String get collectionPlaceholder => 'Itt jelennek meg a gyűjtemény elemei';

  @override
  String get browseByLetter => 'Böngészés betű szerint';

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
    return 'Nem sikerült betölteni a mappát: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ez a mappa üres';

  @override
  String itemCountLabel(int count) {
    return '$count elem';
  }

  @override
  String get failedToLoadFavorites => 'Nem sikerült betölteni a kedvenceket';

  @override
  String get retry => 'Próbáld újra';

  @override
  String get noFavoritesYet => 'Még nincs kedvenc';

  @override
  String get favorites => 'Kedvencek';

  @override
  String totalCountItems(int count) {
    return '$count elem';
  }

  @override
  String get continuing => 'Folyamatban';

  @override
  String get ended => 'Véget ért';

  @override
  String get sortAndFilter => 'Rendezés és szűrés';

  @override
  String get type => 'Típus';

  @override
  String get sortBy => 'Rendezés';

  @override
  String get display => 'Megjelenítés';

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
    return '$name — műfajok';
  }

  @override
  String get views => 'Nézetek';

  @override
  String get albums => 'Albumok';

  @override
  String get albumArtists => 'Album előadói';

  @override
  String get artists => 'Előadók';

  @override
  String get bookmarks => 'Könyvjelzők';

  @override
  String get noSavedBookmarks =>
      'Ehhez a címhez még nincsenek mentett könyvjelzők.';

  @override
  String get openBook => 'Könyv megnyitása';

  @override
  String get chapter => 'Fejezet';

  @override
  String get page => 'Oldal';

  @override
  String get bookmark => 'Könyvjelző';

  @override
  String get justNow => 'Éppen most';

  @override
  String minutesAgo(int count) {
    return '$count perce';
  }

  @override
  String hoursAgo(int count) {
    return '$count órája';
  }

  @override
  String daysAgo(int count) {
    return '$count napja';
  }

  @override
  String get discoverySubjects => 'Felfedezési témakörök';

  @override
  String get pickDiscoverySubjects =>
      'Válaszd ki, mely témacsatornák jelenjenek meg a Felfedezésben.';

  @override
  String get apply => 'Alkalmaz';

  @override
  String get openLink => 'Hivatkozás megnyitása';

  @override
  String get scanWithYourPhone => 'Olvasd be a telefonoddal';

  @override
  String get audiobookGenres => 'Hangoskönyv műfajok';

  @override
  String get pickAudiobookGenres =>
      'Válaszd ki, mely műfajokat szeretnéd megjeleníteni a Hangoskönyv-felfedezésben.';

  @override
  String get discoverAudiobooks => 'Fedezd fel a hangoskönyveket';

  @override
  String get librivoxDescription =>
      'Népszerű, szabadon hozzáférhető művek a LibriVoxtól.';

  @override
  String titlesCount(int count) {
    return '$count cím';
  }

  @override
  String get scrollLeft => 'Görgess balra';

  @override
  String get scrollRight => 'Görgess jobbra';

  @override
  String get couldNotLoadGenre =>
      'Jelenleg nem sikerült betölteni ezt a műfajt.';

  @override
  String get continueReading => 'Olvasás folytatása';

  @override
  String get savedHighlights => 'Mentett kiemelések';

  @override
  String get continueListening => 'Hallgatás folytatása';

  @override
  String get listen => 'Hallgatás';

  @override
  String get resume => 'Folytatás';

  @override
  String get failedToLoadLibrary => 'Nem sikerült betölteni a könyvtárat';

  @override
  String get popularNow => 'Most népszerű';

  @override
  String get savedForLater => 'Későbbre mentve';

  @override
  String get topListens => 'Legtöbbet hallgatott';

  @override
  String get unreadDiscoveries => 'Olvasatlan felfedezések';

  @override
  String get pickUpAgain => 'Vedd fel újra';

  @override
  String get bookHighlightsDescription =>
      'Könyveid kiemelésekkel, kedvencekkel vagy olvasási folyamattal.';

  @override
  String get handPickedFromLibrary => 'Kézzel válogatott a könyvtáradból.';

  @override
  String get handPickedFromListeningQueue =>
      'Kézzel válogatott a hallgatási sorodból.';

  @override
  String get booksWithHighlights =>
      'Könyvek kiemelésekkel, kedvencekkel vagy olvasási folyamattal.';

  @override
  String get jumpBackNarration =>
      'Ugorj vissza a narrációba anélkül, hogy keresgélnéd a helyed.';

  @override
  String get unreadBooksReady =>
      'Olvasatlan könyvek készen állnak a következő csendes órára.';

  @override
  String get quickAccessFavorites =>
      'Gyors hozzáférés a könyvekhez, amelyekhez folyamatosan visszatérsz.';

  @override
  String get searchAudiobooks => 'Hangoskönyvek keresése';

  @override
  String get searchYourLibrary => 'Keresés a könyvtáradban';

  @override
  String get pickUpStory => 'Folytasd a történetet ott, ahol abbahagytad';

  @override
  String get savedPlacesChapters =>
      'Mentett helyeid és befejezetlen fejezeteid';

  @override
  String authorsCount(int count) {
    return '$count szerző';
  }

  @override
  String genresCount(int count) {
    return '$count műfaj';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% kész';
  }

  @override
  String get readyWhenYouAre => 'Készen áll, ha te is.';

  @override
  String get details => 'Részletek';

  @override
  String get listeningRoom => 'Hallgatószoba';

  @override
  String get bookmarksAndProgress => 'Könyvjelzők és folyamat';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count cím olvasás-központú böngészésre rendezve.';
  }

  @override
  String get titles => 'Címek';

  @override
  String get allTitles => 'Minden cím';

  @override
  String get authors => 'Szerzők';

  @override
  String get browseByAuthor => 'Böngészés szerző szerint';

  @override
  String get browseByGenre => 'Böngészés műfaj szerint';

  @override
  String get discover => 'Felfedezés';

  @override
  String get trendingTitlesOpenLibrary =>
      'Felkapott címek témakör szerint az Open Libraryből.';

  @override
  String get noBookmarkedItems =>
      'Még nincsenek könyvjelzővel ellátott tételek';

  @override
  String get nothingMatchesSection =>
      'Ebben a szakaszban még nem szerepel semmi. Próbálj ki egy másik lapot, vagy térj vissza, miután befejeződött a könyvtár szinkronizálása.';

  @override
  String get audiobooks => 'Hangoskönyvek';

  @override
  String noLabelFound(String label) {
    return 'Nem található $label';
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
  String get readStatus => 'Olvasott';

  @override
  String get watched => 'Megtekintett';

  @override
  String get unread => 'Olvasatlan';

  @override
  String get unwatched => 'Nézetlen';

  @override
  String get seriesStatus => 'Sorozat állapota';

  @override
  String get allLibraries => 'Minden könyvtár';

  @override
  String get books => 'Könyvek';

  @override
  String get latestBooks => 'Legújabb könyvek';

  @override
  String get latestAudiobooks => 'Legújabb hangoskönyvek';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count könyv',
      one: '1 könyv',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Könyv';

  @override
  String get bookFormatAudiobook => 'Hangoskönyv';

  @override
  String bookPercentRead(int percent) {
    return '$percent% elolvasva';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time van hátra';
  }

  @override
  String get bookHeroRead => 'Olvasás';

  @override
  String get bookHeroListen => 'Hallgatás';

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
      'Ehhez a műhöz még nincs leírás a LibriVoxtól.';

  @override
  String get readers => 'Felolvasók';

  @override
  String get openLinks => 'Hivatkozások megnyitása';

  @override
  String get librivoxPage => 'LibriVox oldal';

  @override
  String get internetArchive => 'Internet Archive';

  @override
  String get rssFeed => 'RSS-csatorna';

  @override
  String get downloadZip => 'ZIP letöltése';

  @override
  String sectionCountLabel(int count) {
    return '$count szakasz';
  }

  @override
  String firstPublished(int year) {
    return 'Első megjelenés: $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Ehhez a címhez még nem áll rendelkezésre áttekintés az Open Library-től.';

  @override
  String get subjects => 'Témakörök';

  @override
  String get all => 'Minden';

  @override
  String booksCount(int count) {
    return '$count könyv';
  }

  @override
  String get couldNotLoadSubject => 'Ez a téma jelenleg nem tölthető be.';

  @override
  String get audiobookDetails => 'Hangoskönyv részletei';

  @override
  String authorsCountTitle(int count) {
    return '$count szerző';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hangoskönyv',
      one: '1 hangoskönyv',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Dallista';

  @override
  String get itemListPlaceholder => 'Itt fog megjelenni a tétellista';

  @override
  String get failedToLoad => 'Nem sikerült betölteni';

  @override
  String get delete => 'Törlés';

  @override
  String get save => 'Mentés';

  @override
  String get moreLikeThis => 'Még több ilyen';

  @override
  String get castAndCrew => 'Szereplők és stáb';

  @override
  String get collection => 'Gyűjtemény';

  @override
  String get episodes => 'Epizódok';

  @override
  String get nextUp => 'Következő';

  @override
  String get seasons => 'Évadok';

  @override
  String get chapters => 'Fejezetek';

  @override
  String get features => 'Különlegességek';

  @override
  String get movies => 'Filmek';

  @override
  String get musicVideos => 'Zenei videók';

  @override
  String get other => 'Egyéb';

  @override
  String get discography => 'Diszkográfia';

  @override
  String get similarArtists => 'Hasonló előadók';

  @override
  String get tableOfContents => 'Tartalomjegyzék';

  @override
  String get tracklist => 'Dallista';

  @override
  String discNumber(int number) {
    return '$number. lemez';
  }

  @override
  String get biography => 'Életrajz';

  @override
  String get authorDetails => 'Szerző adatai';

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
    return 'Megjelent: $year';
  }

  @override
  String get publicationDateUnknown => 'A megjelenés dátuma ismeretlen';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count évad',
      one: '1 évad',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Befejezés: $time';
  }

  @override
  String get items => 'Elemek';

  @override
  String get extras => 'Extrák';

  @override
  String get behindTheScenes => 'Kulisszák mögött';

  @override
  String get deletedScenes => 'Kivágott jelenetek';

  @override
  String get featurettes => 'Kisfilmek';

  @override
  String get interviews => 'Interjúk';

  @override
  String get scenes => 'Jelenetek';

  @override
  String get shorts => 'Rövidfilmek';

  @override
  String get trailers => 'Előzetesek';

  @override
  String timeRemaining(String time) {
    return '$time van hátra';
  }

  @override
  String endsIn(String time) {
    return 'Befejezés $time múlva';
  }

  @override
  String get view => 'Megtekintés';

  @override
  String get resumeReading => 'Olvasás folytatása';

  @override
  String get read => 'Olvasás';

  @override
  String resumeFrom(String position) {
    return 'Folytatás innen: $position';
  }

  @override
  String get play => 'Lejátszás';

  @override
  String get startOver => 'Kezdés elölről';

  @override
  String get restart => 'Újraindítás';

  @override
  String get readOffline => 'Offline olvasás';

  @override
  String get playOffline => 'Lejátszás offline';

  @override
  String get audio => 'Hangsáv';

  @override
  String get subtitles => 'Feliratok';

  @override
  String get version => 'Változat';

  @override
  String get cast => 'Átküldés';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Előzetes';

  @override
  String get finished => 'Befejezve';

  @override
  String get favorited => 'Kedvenc';

  @override
  String get favorite => 'Kedvenc';

  @override
  String get playlist => 'Lejátszási listához adás';

  @override
  String get downloaded => 'Letöltve';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get downloadAll => 'Az összes letöltése';

  @override
  String get download => 'Letöltés';

  @override
  String get deleteDownloaded => 'Letöltöttek törlése';

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
      'Törlöd ezt a lejátszási listát a szerverről?';

  @override
  String get deleteItemMessage => 'Törlöd ezt az elemet a szerverről?';

  @override
  String get failedToDeletePlaylist =>
      'Nem sikerült törölni a lejátszási listát';

  @override
  String get failedToDeleteItem => 'Nem sikerült törölni az elemet';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Lejátszási lista átnevezése';

  @override
  String get playlistName => 'Lejátszási lista neve';

  @override
  String get deleteDownloadedAlbum => 'Letöltött album törlése';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Törlöd a(z) „$title” letöltött számait?';
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
    return 'Nincs betöltött $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title letöltése ($count elem)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Biztosan törlöd a(z) „$name” elemet a szerverről? Ez a művelet nem vonható vissza.';
  }

  @override
  String get itemDeleted => 'Elem törölve';

  @override
  String get noPlayableTrailerFound => 'Nem található lejátszható előzetes.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Nem támogatott könyvformátum: .$extension';
  }

  @override
  String get audioTrack => 'Hangsáv';

  @override
  String get subtitleTrack => 'Feliratsáv';

  @override
  String get none => 'Nincs';

  @override
  String get downloadSubtitlesLabel => 'Feliratok letöltése...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Keresés az OpenSubtitles beépülő modul használatával';

  @override
  String get downloadSubtitles => 'Feliratok letöltése';

  @override
  String get selectedSubtitleInvalid => 'A kiválasztott felirat érvénytelen.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Felirat letöltve és kiválasztva: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Felirat letöltve. A megjelenése eltarthat egy kis ideig, amíg a Jellyfin frissíti az elemet.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nem találhatók távoli feliratok a(z) $language nyelvhez.';
  }

  @override
  String get selectVersion => 'Verzió kiválasztása';

  @override
  String versionNumber(int number) {
    return 'Verzió: $number';
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
    return '$name letöltése ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Letöltött fájlok törlése';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Törlöd a(z) $typeLabel helyben tárolt fájljait?\n\nEzzel tárhelyet szabadítasz fel. Később újra letöltheted.';
  }

  @override
  String get downloadedFilesDeleted => 'A letöltött fájlok törölve';

  @override
  String get failedToDeleteFiles => 'Nem sikerült törölni a fájlokat';

  @override
  String get deleteFiles => 'Fájlok törlése';

  @override
  String get director => 'RENDEZŐ';

  @override
  String get directors => 'RENDEZŐK';

  @override
  String get writer => 'ÍRÓ';

  @override
  String get writers => 'ÍRÓK';

  @override
  String get studio => 'STÚDIÓ';

  @override
  String studioMoreCount(int count) {
    return '+$count további';
  }

  @override
  String totalEpisodes(int count) {
    return '$count epizód';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '$number. epizód';
  }

  @override
  String chapterNumber(int number) {
    return '$number. fejezet';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zeneszám',
      one: '1 zeneszám',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fejezet',
      one: '1 fejezet',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Született: $date';
  }

  @override
  String died(String date) {
    return 'Elhunyt: $date';
  }

  @override
  String age(int age) {
    return 'Életkor: $age';
  }

  @override
  String get showLess => 'Mutass kevesebbet';

  @override
  String get readMore => 'Olvass tovább';

  @override
  String get shuffle => 'Keverés';

  @override
  String get shuffleAllMusic => 'Összes zene keverése';

  @override
  String get carSignInPrompt => 'Jelentkezz be a Moonfinbe a telefonodon';

  @override
  String get carServerUnreachable => 'A szervered nem érhető el';

  @override
  String downloadsCount(int count) {
    return '$count letöltés';
  }

  @override
  String get perfectMatch => 'Tökéletes párosítás';

  @override
  String channelsCount(int count) {
    return '$count csatorna';
  }

  @override
  String get mono => 'Monó';

  @override
  String get stereo => 'Sztereó';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'A távoli felirat $action műveletéhez a felhasználónak Jellyfin feliratkezelési jogosultságra van szüksége.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Ez az elem nem található a szerveren a távoli felirat $action műveletéhez.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Nem sikerült a távoli felirat $action művelete: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Nem sikerült a távoli felirat $action művelete (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Nem sikerült a távoli feliratok $action.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'a(z) „$name” összes letöltött epizódja';
  }

  @override
  String get deleteSeasonFiles => 'az összes letöltött epizód ebben az évadban';

  @override
  String get stillWatching => 'Még mindig nézed?';

  @override
  String get unableToLoadTrailerStream =>
      'Nem sikerült betölteni az előzetes adatfolyamot.';

  @override
  String get trailerTimedOut =>
      'Az előzetes betöltése közben időtúllépés történt.';

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
    return 'Nem sikerült a(z) $label művelet: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Nem sikerült beállítani az átküldés hangerejét: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label vezérlése';
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
    return '$label leállítása';
  }

  @override
  String get queueIsEmpty => 'A sor üres';

  @override
  String trackNumber(int number) {
    return '$number. szám';
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
    return '$seconds másodperc';
  }

  @override
  String get longPressToUnlock => 'Tartsd nyomva hosszan a feloldáshoz';

  @override
  String get off => 'Ki';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automatikus';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Bitráta felülírása';

  @override
  String get audioDelay => 'Hangkésleltetés';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Feliratkésleltetés';

  @override
  String get reset => 'Visszaállítás';

  @override
  String get unknown => 'Ismeretlen';

  @override
  String get playbackInformation => 'Lejátszási információk';

  @override
  String get playback => 'Lejátszás';

  @override
  String get playMethod => 'Lejátszás módja';

  @override
  String get directPlay => 'Közvetlen lejátszás';

  @override
  String get directStream => 'Közvetlen adatfolyam';

  @override
  String get transcoding => 'Átkódolás';

  @override
  String get transcodeReasons => 'Átkódolási okok';

  @override
  String get player => 'Lejátszó';

  @override
  String get container => 'Konténer';

  @override
  String get bitrate => 'Bitráta';

  @override
  String get video => 'Videó';

  @override
  String get resolution => 'Felbontás';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodek';

  @override
  String get videoBitrate => 'Videó bitráta';

  @override
  String get track => 'Sáv';

  @override
  String get channels => 'Csatornák';

  @override
  String get audioBitrate => 'Audió bitráta';

  @override
  String get sampleRate => 'Mintavételi gyakoriság';

  @override
  String get format => 'Formátum';

  @override
  String get external => 'Külső';

  @override
  String get embedded => 'Beágyazott';

  @override
  String castSessionError(String protocol) {
    return '$protocol munkamenet-hiba';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Nem sikerült betölteni a könyv részleteit: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Az alkalmazáson belüli EPUB-megjelenítés még nem érhető el ezen a platformon.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Ez a formátum (.$extension) még nem jeleníthető meg az alkalmazáson belül.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'A beágyazott dokumentum-megjelenítés nem érhető el ezen a platformon.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nem sikerült megnyitni a külső megjelenítőt.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Nem sikerült megnyitni az alkalmazáson belüli olvasót: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Már van mentett könyvjelző a következő helyen: $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Könyvjelző hozzáadva: $label';
  }

  @override
  String get noBookmarksYet =>
      'Még nincsenek könyvjelzők.\nÉrintsd meg a könyvjelző ikont olvasás közben a pozíció mentéséhez.';

  @override
  String get noTableOfContentsAvailable => 'Nincs elérhető tartalomjegyzék';

  @override
  String pageLabel(int number) {
    return '$number. oldal';
  }

  @override
  String get position => 'Pozíció';

  @override
  String get bookReader => 'Könyvolvasó';

  @override
  String formatExtension(String extension) {
    return 'Formátum: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% elolvasva';
  }

  @override
  String get updating => 'Frissítés...';

  @override
  String get markUnread => 'Megjelölés olvasatlanként';

  @override
  String get markAsRead => 'Megjelölés olvasottként';

  @override
  String get reloadReader => 'Olvasó újratöltése';

  @override
  String get noPagesFound => 'Nem található oldal.';

  @override
  String get failedToDecodePageImage =>
      'Nem sikerült dekódolni az oldal képét.';

  @override
  String resetZoom(String zoom) {
    return 'Nagyítás alaphelyzetbe (${zoom}x)';
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
    return 'Nem sikerült frissíteni az olvasási állapotot: $error';
  }

  @override
  String get themeSystem => 'Téma: Rendszer';

  @override
  String get themeLight => 'Téma: Világos';

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
  String get pdfDataNotAvailable => 'PDF-adatok nem állnak rendelkezésre.';

  @override
  String get readerFallbackModeActive => 'Az olvasó tartalék üzemmódja aktív';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ez a platform nem tudja futtatni a beágyazott dokumentum-megjelenítőt a(z) $extension fájlokhoz.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Használd az Olvasó újratöltése opciót, miután támogatott célplatformra váltottál (Android, iOS, macOS).';

  @override
  String get openExternally => 'Megnyitás külső alkalmazással';

  @override
  String get noEpubChaptersFound => 'Nem található EPUB-fejezet.';

  @override
  String get readerNotReady => 'Az olvasó nem áll készen.';

  @override
  String get seriesRecordings => 'Sorozatfelvételek';

  @override
  String get now => 'Most';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Hírek';

  @override
  String get kids => 'Gyerekek';

  @override
  String get premiere => 'Bemutató';

  @override
  String get guideTimeline => 'Műsorújság idővonala';

  @override
  String failedToLoadGuide(String error) {
    return 'Nem sikerült betölteni a műsorújságot: $error';
  }

  @override
  String get noChannelsFound => 'Nem található csatorna';

  @override
  String get liveBadge => 'ÉLŐ';

  @override
  String guideNextProgram(String time, String title) {
    return 'Következő: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes perc van hátra';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours óra van hátra';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours óra $minutes perc van hátra';
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
  String get unfavoriteChannel => 'Kedvenc eltávolítása';

  @override
  String get favoriteChannel => 'Kedvenc csatorna';

  @override
  String get record => 'Felvétel';

  @override
  String get cancelRecordingAction => 'Felvétel megszakítása';

  @override
  String get programSetToRecord => 'Műsor felvételre beállítva';

  @override
  String get recordingCancelled => 'Felvétel megszakítva';

  @override
  String get unableToCreateRecording => 'Nem sikerült létrehozni a felvételt';

  @override
  String get watch => 'Megtekintés';

  @override
  String get close => 'Bezárás';

  @override
  String failedToPlayChannel(String name) {
    return 'Nem sikerült lejátszani: $name';
  }

  @override
  String get failedToLoadRecordings => 'Nem sikerült betölteni a felvételeket';

  @override
  String get scheduledInNext24Hours => 'Ütemezett a következő 24 órában';

  @override
  String get recentRecordings => 'Legutóbbi felvételek';

  @override
  String get tvSeries => 'TV-sorozat';

  @override
  String get failedToLoadSchedule => 'Nem sikerült betölteni az ütemezést';

  @override
  String get noScheduledRecordings => 'Nincsenek ütemezett felvételek';

  @override
  String get cancelRecording => 'Megszakítod a felvételt?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Megszakítod a(z) „$name” ütemezett felvételét?';
  }

  @override
  String get no => 'Nem';

  @override
  String get yesCancel => 'Igen, megszakítom';

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
  String get cancelSeriesRecordingQuestion => 'Megszakítod a sorozatfelvételt?';

  @override
  String stopRecordingName(String name) {
    return 'Leállítod a(z) „$name” felvételét?';
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
    return 'Nincs találat a következőre: „$query”';
  }

  @override
  String searchFailedError(String error) {
    return 'A keresés sikertelen: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr-fiók típusa';

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
  String get noMediaInFilter => 'Nincs média ebben a szűrőben';

  @override
  String get noDownloadedMediaYet => 'Még nincs letöltött média';

  @override
  String get browseLibrary => 'Böngészés a könyvtárban';

  @override
  String get deleteDownload => 'Letöltés törlése';

  @override
  String removeItemAndFiles(String name) {
    return 'Eltávolítod a(z) „$name” elemet és a fájljait?';
  }

  @override
  String tracksCount(int count) {
    return '$count zeneszám';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Album lejátszása';

  @override
  String failedToLoadAlbum(String error) {
    return 'Nem sikerült betölteni az albumot: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Nem találhatók letöltött zeneszámok a(z) $name albumhoz.';
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
    return 'Eltávolítod a(z) „$name” elemet?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes perc';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return '$number. epizód';
  }

  @override
  String get seriesNotFound => 'A sorozat nem található';

  @override
  String get errorLoadingSeries => 'Hiba a sorozat betöltésekor';

  @override
  String get downloadedEpisodes => 'Letöltött epizódok';

  @override
  String seasonNumber(int number) {
    return '$number. évad';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Különlegességek';

  @override
  String get deleteSeason => 'Évad törlése';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Törlöd a(z) $season összes letöltött epizódját?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count epizód',
      one: '1 epizód',
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
      'Ez eltávolítja az összes letöltött médiafájlt, és a művelet nem vonható vissza.';

  @override
  String get deleteAll => 'Összes törlése';

  @override
  String get deleteSelected => 'Kijelölt törlése';

  @override
  String deleteSelectedCount(int count) {
    return 'Törlöd a(z) $count letöltött elemet?';
  }

  @override
  String get musicAndAudiobooks => 'Zene és hangoskönyvek';

  @override
  String get images => 'Képek';

  @override
  String get database => 'Adatbázis';

  @override
  String ofStorageLimit(String limit) {
    return 'a(z) $limit limitből';
  }

  @override
  String get settings => 'Beállítások';

  @override
  String get authentication => 'Hitelesítés';

  @override
  String get autoLoginServerManagement =>
      'Automatikus bejelentkezés, szerverkezelés';

  @override
  String get pinCode => 'PIN-kód';

  @override
  String get setUpPinCodeProtection => 'Állítsd be a PIN-kódos védelmet';

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
  String get mediaRequestIntegration => 'Médiakérelem-integráció';

  @override
  String get switchServer => 'Szerver váltása';

  @override
  String get signOut => 'Kijelentkezés';

  @override
  String get versionLicenses => 'Verzió, licencek';

  @override
  String get account => 'Fiók';

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
  String get pluginAndRequests => 'Beépülő modulok és kérések';

  @override
  String get customizeAccountPlaybackInterface =>
      'A fiók, a lejátszás és a felület viselkedésének testreszabása';

  @override
  String optionsCount(int count) {
    return '$count opció';
  }

  @override
  String get themeAndAppearance => 'Téma és megjelenés';

  @override
  String get focusBorderColor => 'Fókuszkeret színe';

  @override
  String get watchedIndicators => 'Megtekintési jelölők';

  @override
  String get always => 'Mindig';

  @override
  String get hideUnwatched => 'Nem megtekintettek elrejtése';

  @override
  String get episodesOnly => 'Csak epizódok';

  @override
  String get never => 'Soha';

  @override
  String get focusExpansionAnimation => 'Fókuszkiemelési animáció';

  @override
  String get desktopUiScale => 'Felület méretezése';

  @override
  String get scaleFocusedCards =>
      'Fókuszált vagy lebegtetett kártyák és lapkák skálázása';

  @override
  String get backgroundBackdrops => 'Háttérképek';

  @override
  String get showBackdropImages =>
      'Háttérképek megjelenítése a tartalom mögött';

  @override
  String get seriesThumbnails => 'Sorozatminiatűrök';

  @override
  String get seriesThumbnailsDescription =>
      'TV-sorozatok esetén használd a fő sorozatképet az epizód miniatűrje helyett.';

  @override
  String get homeRowInfoOverlay => 'Kezdősori információs fedvény';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Cím és metaadatok megjelenítése a kezdősorok böngészésekor';

  @override
  String get clockDisplay => 'Órakijelzés';

  @override
  String get inMenus => 'Menükben';

  @override
  String get inVideo => 'Videóban';

  @override
  String get seasonalEffects => 'Szezonális effektusok';

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
  String get themeMusic => 'Témazene';

  @override
  String get playThemeMusicOnDetailPages =>
      'Témazene lejátszása a részletező oldalakon';

  @override
  String get themeMusicVolume => 'Témazene hangereje';

  @override
  String get themeMusicSettingsSubtitle =>
      'Részletező oldalak, kezdőképernyő-sorok és hangerő';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Témazene a kezdősorokon';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Lejátszás a kezdőképernyő böngészése közben';

  @override
  String get loopThemeMusic => 'Témazene ismétlése';

  @override
  String get loopThemeMusicSubtitle =>
      'A zeneszám ismétlése az egyszeri lejátszás helyett';

  @override
  String get detailsBackgroundBlur => 'Részletek hátterének elmosása';

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
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Böngészőnézet háttérelmosása';

  @override
  String get maxStreamingBitrate => 'Maximális streamelési bitráta';

  @override
  String get maxResolution => 'Maximális felbontás';

  @override
  String get playerZoomMode => 'Lejátszó zoommódja';

  @override
  String get settingsScrollWheelAction => 'Egérgörgő';

  @override
  String get settingsScrollWheelActionDescription =>
      'Válaszd ki, mit tegyen az egér görgetése a videó lejátszása közben.';

  @override
  String get scrollWheelActionOff => 'Ki';

  @override
  String get scrollWheelActionSeek => 'Pörgetés (előre / hátra)';

  @override
  String get scrollWheelActionVolume => 'Hangerő';

  @override
  String get playerTooltipVolume => 'Hangerő';

  @override
  String get fit => 'Illesztés';

  @override
  String get autoCrop => 'Automatikus kivágás';

  @override
  String get stretch => 'Nyújtás';

  @override
  String get refreshRateSwitching => 'Frissítési gyakoriság váltása';

  @override
  String get disabled => 'Letiltva';

  @override
  String get scaleOnTv => 'Skálázás a tévén';

  @override
  String get scaleOnDevice => 'Skálázás az eszközön';

  @override
  String get trickPlay => 'Trick Play';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Az előnézeti bélyegképek megjelenítése kereséskor';

  @override
  String get showDescriptionOnPause => 'Leírás megjelenítése szüneteltetéskor';

  @override
  String get dimVideoShowOverview =>
      'A videó halványítása és az áttekintő szöveg megjelenítése szüneteltetés közben';

  @override
  String get osdLockButton => 'OSD-zárgomb';

  @override
  String get osdLockButtonDescription =>
      'Egy olyan zárgomb megjelenítése, amely hosszan nyomva tartásig blokkolja az érintéses bevitelt.';

  @override
  String get audioBehavior => 'Hangviselkedés';

  @override
  String get downmixToStereo => 'Lekeverés sztereóra';

  @override
  String get defaultAudioLanguage => 'Alapértelmezett hangnyelv';

  @override
  String get fallbackAudioLanguage => 'Tartalék hangnyelv';

  @override
  String get preferDefaultAudioTrack =>
      'Alapértelmezett hangsáv előnyben részesítése';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Eredeti hangsáv előnyben részesítése a szinkron helyett.';

  @override
  String get preferAudioDescription =>
      'Audionarrációs sávok előnyben részesítése';

  @override
  String get preferAudioDescriptionDescription =>
      'Az audionarrációs sávok előnyben részesítése a normál sávokkal szemben.';

  @override
  String get transcodingAudio => 'Átkódolás (hang)';

  @override
  String get directStreamRemux => 'Közvetlen adatfolyam (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Átkódolás (bitráta vagy felbontás)';

  @override
  String get transcodingVideoAndAudio => 'Átkódolás (videó és hang)';

  @override
  String get transcodingVideo => 'Átkódolás (videó)';

  @override
  String get autoServerDefault => 'Automatikus (szerver-alapértelmezés)';

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
  String get ac3Passthrough => 'AC3-átengedés';

  @override
  String get dtsPassthrough => 'DTS-átengedés';

  @override
  String get trueHdSupport => 'TrueHD támogatás';

  @override
  String get enableDtsPassthrough =>
      'DTS hang közvetlen átvitele az erősítőnek (bitstream); erősítő-támogatást és DTS hangsávot igényel';

  @override
  String get enableTrueHdAudio =>
      'Engedélyezd a TrueHD hangot (lehet, hogy nem működik minden platformon)';

  @override
  String get settingsAudioOutputMode => 'Hangkimeneti mód';

  @override
  String get settingsAudioOutputModeDescription =>
      'Válaszd ki a hang dekódolásának módját. Az AVR-átengedés nyers Dolby/DTS adatfolyamokat küld az erősítőnek; az Automatikus vagy a Downmix helyben dekódol.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR-átengedés';

  @override
  String get settingsAudioFallbackCodec => 'Tartalék hangkodek';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Válaszd ki a célformátumot a többcsatornás hang átkódolásához, ha a forrás-adatfolyam nem játszható le közvetlen lejátszással, vagy nem engedhető át.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Automatikus észlelés\n(Ajánlott)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Alapértelmezett)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Veszteségmentes)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Csak sztereó)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Hatékony)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Veszteségmentes)';

  @override
  String get settingsMaxAudioChannels => 'Maximális hangcsatornák';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Állítsd be a hangrendszered maximális csatornaszámát. Az ezt a limitet meghaladó többcsatornás adatfolyamok lekeverésre vagy átkódolásra kerülnek.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Automatikus észlelés\n(Hardveres alapértelmezés)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 sztereó';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 térhangzás';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 kvadrofón';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 térhangzás';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 térhangzás';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 térhangzás';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 térhangzás';

  @override
  String get settingsAudioPassthroughAdvanced => 'Hangátengedés (speciális)';

  @override
  String get settingsAudioCodecPassthrough => 'Kodek-átengedés';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Csak azokat a formátumokat engedélyezd, amelyeket az AVR-ed vagy a HDMI-fogadód támogat.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3-átengedés';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos)-átengedés';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core-átengedés';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA-átengedés';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD-átengedés';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos-átengedés';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) bitfolyam küldése külső dekóderre.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Dolby Atmos EAC3 (JOC) feletti bitfolyam küldése külső dekóderre.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA (DTS maggal) bitfolyam küldése külső dekóderre.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Dolby TrueHD bitfolyam küldése Atmos metaadatokkal külső dekóderre.';

  @override
  String get settingsDetectedAudioCapabilities => 'Észlelt hangképességek';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Még nem érhető el futásidejű képességpillanatkép.';

  @override
  String get settingsAudioRouteLabel => 'Hangútvonal';

  @override
  String get settingsAudioDecodeLabel => 'Dekódolás';

  @override
  String get settingsAudioPassthroughLabel => 'Hangátengedés';

  @override
  String get settingsAudioHdRoute => 'HD hangútvonal';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Hangszóró';

  @override
  String get settingsAudioRouteHeadphones => 'Fejhallgató';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count csatornás PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnosztika';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Videószint';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Videótartomány';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Feliratkodek';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Engedélyezett hangkodekek';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS hangkodekek';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 hangkodekek';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif átengedés';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Aktív hangútvonal';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Audioútvonal HD-audiotámogatása';

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
      'A felhasználó által megadott mpv.conf fájl alkalmazása a lejátszás megkezdése előtt';

  @override
  String get unsafeAdvancedMpvOptions =>
      'Nem biztonságos, speciális mpv-opciók';

  @override
  String get unsafeMpvOptionsDescription =>
      'Az mpv-opciók szélesebb körének engedélyezése. Megzavarhatja a lejátszás működését.';

  @override
  String get hardwareDecoding => 'Hardveres dekódolás';

  @override
  String get hardwareDecodingSubtitle =>
      'Javíthatja a teljesítményt, de bizonyos eszközökön lejátszási problémákat okozhat.';

  @override
  String get nextUpAndQueuing => 'Következő és sorba állítás';

  @override
  String get nextUpDisplay => '„Következő” megjelenítése';

  @override
  String get extended => 'Kiterjedt';

  @override
  String get minimal => 'Minimális';

  @override
  String get nextUpTimeout => '„Következő” időkorlátja';

  @override
  String secondsValue(int value) {
    return '$value mp';
  }

  @override
  String get mediaQueuing => 'Média sorba állítása';

  @override
  String get autoQueueNextEpisodes =>
      'A következő epizódok automatikus sorba állítása';

  @override
  String get stillWatchingPrompt => '„Még mindig nézed?” kérdés';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes epizód / $hours óra után';
  }

  @override
  String get resumeAndSkip => 'Folytatás és kihagyás';

  @override
  String get resumeRewind => 'Visszatekerés folytatáskor';

  @override
  String get unpauseRewind => 'Szünet utáni visszatekerés';

  @override
  String get fiveSeconds => '5 másodperc';

  @override
  String get tenSeconds => '10 másodperc';

  @override
  String get fifteenSeconds => '15 másodperc';

  @override
  String get thirtySeconds => '30 másodperc';

  @override
  String get skipBackLength => 'Visszaugrás hossza';

  @override
  String get skipForwardLength => 'Előreugrás hossza';

  @override
  String get customMpvConfPath => 'Egyéni mpv.conf elérési út';

  @override
  String get notSetMpvConf =>
      'Nincs beállítva. A Moonfin megpróbálja az alapértelmezett mpv.conf fájlt az alkalmazás/adat mappákban.';

  @override
  String get selectMpvConf => 'mpv.conf kiválasztása';

  @override
  String get pathToMpvConf => '/elérési/út/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'A stílusbeállítások (méret, szín, eltolás) a szöveges feliratokra vonatkoznak (SRT, VTT, TTML). Az ASS/SSA feliratok saját beágyazott stílusukat használják, kivéve, ha az „ASS/SSA Direct Play” ki van kapcsolva. A bittérképes feliratok (PGS, DVB, VobSub) stílusa nem módosítható.';

  @override
  String get defaultSubtitleLanguage => 'Alapértelmezett feliratnyelv';

  @override
  String get defaultToNoSubtitles => 'Alapértelmezés szerint nincs felirat';

  @override
  String get turnOffSubtitlesByDefault =>
      'Feliratok kikapcsolása alapértelmezés szerint';

  @override
  String get subtitleSize => 'Felirat mérete';

  @override
  String get textFillColor => 'Szöveg kitöltési színe';

  @override
  String get backgroundColor => 'Háttérszín';

  @override
  String get textStrokeColor => 'Szöveg körvonalszíne';

  @override
  String get subtitleCustomization => 'Felirat testreszabása';

  @override
  String get subtitleCustomizationDescription =>
      'A felirat megjelenésének testreszabása';

  @override
  String get subtitleMode => 'Feliratmód';

  @override
  String get subtitleModeFlagged => 'Megjelölt';

  @override
  String get subtitleModeAlways => 'Mindig';

  @override
  String get subtitleModeForeign => 'Idegen nyelvű';

  @override
  String get subtitleModeForced => 'Kényszerített';

  @override
  String get subtitleModeFlaggedDescription =>
      'Lejátssza a médiafájl metaadataiban belsőleg \"default\" (alapértelmezett) vagy \"forced\" (kényszerített) jelöléssel ellátott sávokat.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Automatikusan betölti és megjeleníti a feliratokat minden videó indításakor.';

  @override
  String get subtitleModeForeignDescription =>
      'Automatikusan bekapcsolja a feliratokat, ha az alapértelmezett hangsáv idegen nyelvű.';

  @override
  String get subtitleModeForcedDescription =>
      'Csak azokat a feliratokat tölti be, amelyek kifejezetten a kényszerített (forced) metaadat-jelölővel vannak ellátva.';

  @override
  String get subtitleModeNoneDescription =>
      'Teljesen letiltja az automatikus feliratbetöltést.';

  @override
  String get fallbackSubtitleLanguage => 'Tartalék feliratnyelv';

  @override
  String get subtitleStream => 'Felirat-adatfolyam';

  @override
  String get subtitlePreviewText => 'A gyors barna róka átugrik a lusta kutyán';

  @override
  String get verticalOffset => 'Függőleges eltolás';

  @override
  String get pgsDirectPlay => 'PGS közvetlen lejátszás';

  @override
  String get directPlayPgsSubtitles => 'PGS-feliratok közvetlen lejátszása';

  @override
  String get assSsaDirectPlay => 'ASS/SSA közvetlen lejátszás';

  @override
  String get directPlayAssSsaSubtitles =>
      'ASS/SSA-feliratok közvetlen lejátszása';

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
  String get mobile => 'Mobil';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'A(z) $profile profil beállításai betöltve.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nem sikerült betölteni a(z) $profile profil beállításait.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Helyi beállítások szinkronizálva a(z) $profile profillal.';
  }

  @override
  String get customizationProfile => 'Testreszabási profil';

  @override
  String get customizationProfileDescription =>
      'Válaszd ki a betölteni, szerkeszteni és szinkronizálni kívánt profilt. A globális mindenhol érvényes, hacsak egy eszközprofil felül nem írja. A zöld pont az aktuális eszközprofilodat jelöli.';

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
      'A profilvezérlők megjelenítéséhez engedélyezd a szerver beépülőmodul-szinkronizálását a beépülő modulok beállításaiban.';

  @override
  String get quality => 'Minőség';

  @override
  String get defaultDownloadQuality => 'Alapértelmezett letöltési minőség';

  @override
  String get network => 'Hálózat';

  @override
  String get wifiOnlyDownloads => 'Csak WiFi letöltések';

  @override
  String get reportDownloadsActivity => 'Letöltések megjelenítése a szerveren';

  @override
  String get reportDownloadsActivitySubtitle =>
      'A szerver adminisztrátora láthatja az átkódolt letöltéseidet az irányítópulton';

  @override
  String get onlyDownloadOnWifi => 'Csak Wi-Fi-hálózaton töltsd le';

  @override
  String get storage => 'Tárhely';

  @override
  String get storageUsed => 'Használt tárhely';

  @override
  String get manage => 'Kezelés';

  @override
  String get calculating => 'Számítás...';

  @override
  String get downloadLocation => 'Letöltés helye';

  @override
  String get defaultLabel => 'Alapértelmezett';

  @override
  String get saveToDownloadsFolder => 'Mentés a Letöltések mappába';

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
  String get confirm => 'Megerősítés';

  @override
  String get cannotWriteToFolder =>
      'Nem lehet írni a kiválasztott mappába. Kérlek, válassz másik helyet, vagy adj tárhely-engedélyeket.';

  @override
  String get saveToDownloadsFolderQuestion => 'Mentés a Letöltések mappába?';

  @override
  String get saveToDownloadsFolderDescription =>
      'A letöltött médiát a rendszer a Letöltések/Moonfin mappába menti az eszközödön. Ezeket a fájlokat más alkalmazások is láthatják, például a galéria vagy a zenelejátszó.\n\nA meglévő letöltések a jelenlegi helyükön maradnak.';

  @override
  String get enable => 'Engedélyezés';

  @override
  String get clearAllDownloadsWarning =>
      'Ezzel törlöd az összes letöltött médiát, és a művelet nem vonható vissza.';

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
  String get showGenresButton => 'Műfajok gomb megjelenítése';

  @override
  String get showFavoritesButton => 'Kedvencek gomb megjelenítése';

  @override
  String get showLibrariesInToolbar =>
      'Könyvtárak megjelenítése az eszköztárban';

  @override
  String get navbarAlwaysExpanded =>
      'Navigációs sáv címkéinek folyamatos kibontása';

  @override
  String get showSeerrButton => 'Seerr gomb megjelenítése';

  @override
  String get navbarOpacity => 'Navigációs sáv átlátszósága';

  @override
  String get navbarColor => 'Navigációs sáv színe';

  @override
  String get gray => 'Szürke';

  @override
  String get darkBlue => 'Sötétkék';

  @override
  String get purple => 'Lila';

  @override
  String get teal => 'Kékeszöld';

  @override
  String get navy => 'Tengerészkék';

  @override
  String get charcoal => 'Grafitszürke';

  @override
  String get brown => 'Barna';

  @override
  String get darkRed => 'Sötétvörös';

  @override
  String get darkGreen => 'Sötétzöld';

  @override
  String get slate => 'Palaszürke';

  @override
  String get indigo => 'Indigó';

  @override
  String get libraryDisplay => 'Könyvtári megjelenítés';

  @override
  String get posterLabel => 'Poszter';

  @override
  String get thumbnailLabel => 'Miniatűr';

  @override
  String get bannerLabel => 'Bannerkép';

  @override
  String get overridePerLibrarySettings =>
      'Könyvtáronkénti beállítások felülbírálása';

  @override
  String get applyImageTypeToAllLibraries =>
      'Képtípus alkalmazása az összes könyvtárra';

  @override
  String get multiServerLibraries => 'Többszerveres könyvtárak';

  @override
  String get showLibrariesFromAllServers =>
      'Az összes csatlakoztatott szerver könyvtárainak megjelenítése';

  @override
  String get enableFolderView => 'Mappanézet engedélyezése';

  @override
  String get showFolderBrowsingOption => 'Mappaböngészési opció megjelenítése';

  @override
  String get groupItemsIntoCollections =>
      'Elemek csoportosítása gyűjteményekbe';

  @override
  String get hideCollectionAssociatedItems =>
      'Gyűjteményekhez társított könyvtári elemek elrejtése a könyvtárak böngészése közben';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Könyvtárcsoportosítási értesítés';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'A beállítás használatához győződj meg róla, hogy a „Filmek csoportosítása gyűjteményekbe” és/vagy „Sorozatok csoportosítása gyűjteményekbe” könyvtári beállítások engedélyezve vannak a könyvtárad megjelenítési beállításai között a Jellyfin vagy Emby szervereden.';

  @override
  String get libraryVisibility => 'Könyvtár láthatósága';

  @override
  String get libraryVisibilityDescription =>
      'A kezdőlap láthatóságának váltása könyvtáronként. A módosítások életbe lépéséhez indítsd újra a Moonfin alkalmazást.';

  @override
  String get showInNavigation => 'Megjelenítés a navigációban';

  @override
  String get showInLatestMedia =>
      'Megjelenítés a legutóbb hozzáadott/megjelent médiában';

  @override
  String get sourceLibraries => 'Forráskönyvtárak';

  @override
  String get sourceCollections => 'Forrásgyűjtemények';

  @override
  String get excludedGenres => 'Kizárt műfajok';

  @override
  String get selectAll => 'Összes kijelölése';

  @override
  String itemsSelected(int count) {
    return '$count kiválasztva';
  }

  @override
  String get mediaBar => 'Médiasáv';

  @override
  String get mediaSources => 'Médiaforrások';

  @override
  String get behavior => 'Viselkedés';

  @override
  String get seconds => 'másodperc';

  @override
  String get localPreviews => 'Helyi előnézetek';

  @override
  String get localPreviewsDescription =>
      'Előzetes-, média- és hangelőnézetek konfigurálása.';

  @override
  String get mediaBarMode => 'Médiasáv stílusa';

  @override
  String get mediaBarModeDescription =>
      'Válassz a különböző médiasáv-stílusok közül, vagy kapcsold ki a médiasávot';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Ki';

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
  String get autoAdvanceInterval => 'Automatikus előrelépés időköze';

  @override
  String get trailerPreview => 'Előzetes előnézet';

  @override
  String get autoPlayTrailers =>
      'Előzetesek automatikus lejátszása a médiasávon 3 másodperc után';

  @override
  String get trailerAudio => 'Előzetesek hangja';

  @override
  String get enableTrailerAudio =>
      'Előzetesek hangjának engedélyezése a médiasávban';

  @override
  String get episodePreview => 'Epizód-előnézet';

  @override
  String get mediaPreview => 'Média előnézet';

  @override
  String get episodePreviewDescription =>
      'Játssz le egy 30 másodperces beágyazott előnézetet fókuszált, lebegtetett vagy hosszan lenyomott kártyákon';

  @override
  String get mediaPreviewDescription =>
      'Játssz le egy 30 másodperces beágyazott előnézetet fókuszált, lebegtetett vagy hosszan lenyomott kártyákon';

  @override
  String get previewAudio => 'Hang előnézete';

  @override
  String get enablePreviewAudio =>
      'Hang engedélyezése az előzetes és az epizód előnézetéhez';

  @override
  String get latestMedia => 'Legutóbb hozzáadott média';

  @override
  String get recentlyReleased => 'Nemrég megjelent';

  @override
  String get myMedia => 'Saját médiám';

  @override
  String get myMediaSmall => 'Saját médiám (kicsi)';

  @override
  String get continueWatching => 'Folytatás';

  @override
  String get resumeAudio => 'Hang folytatása';

  @override
  String get resumeBooks => 'Könyvek folytatása';

  @override
  String get activeRecordings => 'Aktív felvételek';

  @override
  String get playlists => 'Lejátszási listák';

  @override
  String get liveTV => 'Élő TV';

  @override
  String get homeSections => 'Kezdőlapszakaszok';

  @override
  String get resetToDefaults => 'Alapértelmezett értékek visszaállítása';

  @override
  String get homeRowPosterSize => 'Kezdősor posztermérete';

  @override
  String get perRowImageTypeSelection => 'Soronkénti képtípus kiválasztása';

  @override
  String get configureImageTypeForEachRow =>
      'Állítsd be a képtípust minden engedélyezett kezdősorhoz';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'A „Folytatás” és a „Következő” egyesítése';

  @override
  String get combineBothRows =>
      'Mindkét sor egyesítése egyetlen kezdőlapszakaszba';

  @override
  String get fullScreenRows => 'Kibontott kezdőképernyő-sorok';

  @override
  String get fullScreenRowsDescription =>
      'Korlátozd a kezdőképernyő sorait képernyőnként 1 sorra';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Soronkénti képtípus';

  @override
  String get perRowSettings => 'Soronkénti beállítások';

  @override
  String get autoLogin => 'Automatikus bejelentkezés';

  @override
  String get lastUser => 'Utolsó felhasználó';

  @override
  String get currentUser => 'Jelenlegi felhasználó';

  @override
  String get alwaysAuthenticate => 'Hitelesítés megkövetelése mindig';

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
      'Nem sikerült betölteni a szerver értékeléseit. Csak a mentett értékelések megjelenítése.';

  @override
  String get couldNotRefreshRatings =>
      'Nem sikerült frissíteni az értékeléseket a szerverről. Mentett értékelések megjelenítése.';

  @override
  String get enablePinCode => 'PIN-kód engedélyezése';

  @override
  String get requirePinToAccess => 'A fiók eléréséhez PIN-kód szükséges';

  @override
  String get changePin => 'PIN módosítása';

  @override
  String get setNewPinCode => 'Új PIN-kód beállítása';

  @override
  String get removePin => 'PIN-kód eltávolítása';

  @override
  String get removePinProtection => 'PIN-kódos védelem eltávolítása';

  @override
  String get screensaver => 'Képernyővédő';

  @override
  String get inAppScreensaver => 'Alkalmazáson belüli képernyővédő';

  @override
  String get enableBuiltInScreensaver =>
      'Engedélyezd a beépített képernyővédőt';

  @override
  String get mode => 'Mód';

  @override
  String get libraryArt => 'Könyvtári borítóképek';

  @override
  String get logo => 'Logó';

  @override
  String get clock => 'Óra';

  @override
  String get timeout => 'Időtúllépés';

  @override
  String minutesShort(int minutes) {
    return '$minutes perc';
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
      'Csak a besorolással rendelkező tartalmak megjelenítése';

  @override
  String get showClock => 'Óra megjelenítése';

  @override
  String get displayClockDuringScreensaver =>
      'Óra megjelenítése képernyővédő közben';

  @override
  String get clockModeStatic => 'Statikus';

  @override
  String get clockModeBouncing => 'Pattogó';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (kritikusok)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (közönség)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

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
  String get pluginLabel => 'Moonbase beépülő modul';

  @override
  String get pluginDetected => 'Beépülő modul észlelve';

  @override
  String get pluginNotDetected => 'Beépülő modul nem észlelhető';

  @override
  String get pluginDetectedDescription =>
      'Szerver beépülő modul észlelve. A szinkronizálás automatikusan engedélyezve van a beépülő modul első megtalálásakor.';

  @override
  String get pluginNotDetectedDescription =>
      'A szerver beépülő modul jelenleg nem észlelhető. A helyi beállítások továbbra is a mentett értékeket vagy a beépített alapértelmezett értékeket használják.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVerzió: $version';
  }

  @override
  String get availableServices => 'Elérhető szolgáltatások';

  @override
  String get serverPluginSync => 'Szerver beépülő modul szinkronizálása';

  @override
  String get syncSettingsWithPlugin =>
      'Beállítások szinkronizálása a szerver beépülő modullal';

  @override
  String get whatSyncControls => 'Mit szabályoz a szinkronizálás?';

  @override
  String get syncControlsDescription =>
      'A szinkronizálás csak azt szabályozza, hogy a beépülő modulok által támogatott beállítások elküldésre kerülnek-e a szerverre, illetve lekérhetők-e onnan. A profil kiválasztása és a profilszinkronizálási műveletek a testreszabási beállításokban találhatók, ha a beépülő modul szinkronizálása engedélyezett.';

  @override
  String get recentRequests => 'Legutóbbi kérések';

  @override
  String get recentlyAdded => 'Nemrég hozzáadva';

  @override
  String get trending => 'Felkapott';

  @override
  String get popularMovies => 'Népszerű filmek';

  @override
  String get movieGenres => 'Filmműfajok';

  @override
  String get upcomingMovies => 'Közelgő filmek';

  @override
  String get studios => 'Stúdiók';

  @override
  String get popularSeries => 'Népszerű sorozatok';

  @override
  String get seriesGenres => 'Sorozatműfajok';

  @override
  String get upcomingSeries => 'Közelgő sorozatok';

  @override
  String get networks => 'Tévéadók';

  @override
  String get seerrDiscoveryRows => 'Seerr felfedezési sorok';

  @override
  String get resetRowsToDefaults =>
      'A sorok visszaállítása az alapértelmezett értékekre';

  @override
  String get enableSeerr => 'Seerr engedélyezése';

  @override
  String get showSeerrInNavigation =>
      'Seerr megjelenítése a navigációban (szerver beépülő modul szükséges)';

  @override
  String get seerrUnavailable =>
      'Nem érhető el, mert a szerver beépülő modul Seerr-támogatása le van tiltva.';

  @override
  String get nsfwFilter => 'NSFW-szűrő';

  @override
  String get hideAdultContent =>
      'A felnőtteknek szánt tartalom elrejtése a találatok között';

  @override
  String get seerrNotificationsSection => 'Értesítések';

  @override
  String get seerrNotifyNewRequestsTitle => 'Értesítések új kérésekről';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Értesíts, ha valaki kérést küld be';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Kérések frissítései';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Jóváhagyva, elutasítva és hozzáadva a könyvtáradhoz';

  @override
  String get seerrNotifyIssuesTitle => 'Problémafrissítések';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Új problémák, válaszok és megoldások';

  @override
  String loggedInAs(String username) {
    return 'Bejelentkezve mint: $username';
  }

  @override
  String get discoverRows => 'Seerr felfedezési oldal';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Engedélyezd a Seerr főoldalán megjelenő sorokat. Húzd őket az átrendezéshez. Az egyedi sorrend szinkronizálódik a Moonbase-zel.';

  @override
  String get discoverRowsDescription =>
      'Engedélyezd a Seerr főoldalán megjelenő sorokat. Húzd őket az átrendezéshez. Az egyedi sorrend szinkronizálódik a Moonbase-zel.';

  @override
  String get enabled => 'Engedélyezve';

  @override
  String get hidden => 'Rejtett';

  @override
  String get aboutTitle => 'Névjegy';

  @override
  String versionValue(String version) {
    return 'Verzió $version';
  }

  @override
  String get openSourceLicenses => 'Nyílt forráskódú licencek';

  @override
  String get sourceCode => 'Forráskód';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Frissítések keresése most';

  @override
  String get checksLatestDesktopRelease =>
      'Ellenőrzi a platform legújabb asztali kiadását';

  @override
  String get youAreUpToDate => 'Naprakész vagy.';

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
      'Kérlek, várj, mielőtt újra ellenőriznéd.';

  @override
  String get latestUpdateAlreadyShown => 'A legutóbbi frissítés már megjelent.';

  @override
  String get updateAvailable => 'Frissítés elérhető.';

  @override
  String updateAvailableVersion(String version) {
    return 'Frissítés érhető el: v$version';
  }

  @override
  String get updateNotifications => 'Frissítési értesítések';

  @override
  String get showWhenUpdatesAvailable =>
      'Megjelenítés, ha van elérhető frissítés';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version elérhető';
  }

  @override
  String get readReleaseNotes => 'Kiadási megjegyzések megtekintése';

  @override
  String get downloadingUpdate => 'Frissítés letöltése...';

  @override
  String get updateDownloadFailed =>
      'Nem sikerült letölteni a frissítést. Kérlek, próbáld újra.';

  @override
  String get openReleasesPage => 'Kiadások oldalának megnyitása';

  @override
  String get navigation => 'Navigáció';

  @override
  String get watchedIndicatorsBackdrops => 'Megtekintett jelzők, hátterek';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fókuszszín, megtekintett jelzők, hátterek';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navigációs stílus, eszköztár gombjai, megjelenés';

  @override
  String get reorderToggleHomeRows =>
      'Rendezd át és kapcsold ki-be mind a könyvtári, mind a külső alapú kezdőképernyő-sorokat';

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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Képgyorsítótár korlátja';

  @override
  String get clearImageCache => 'Képgyorsítótár törlése';

  @override
  String get imageCacheCleared => 'Képgyorsítótár törölve';

  @override
  String get clear => 'Törlés';

  @override
  String get browse => 'Tallózás';

  @override
  String get noResults => 'Nincs eredmény';

  @override
  String get seerrAvailableStatus => 'Elérhető';

  @override
  String get seerrRequestedStatus => 'Kért';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Letöltés · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importálás';

  @override
  String itemsCount(int count) {
    return '$count elem';
  }

  @override
  String get seerrSettings => 'Seerr-beállítások';

  @override
  String get requestMore => 'Továbbiak igénylése';

  @override
  String get request => 'Igénylés';

  @override
  String get cancelRequest => 'Igénylés visszavonása';

  @override
  String get playInMoonfin => 'Lejátszás a Moonfinben';

  @override
  String requestedByName(String name) {
    return 'Igényelte: $name';
  }

  @override
  String get approve => 'Jóváhagyás';

  @override
  String get declineAction => 'Elutasítás';

  @override
  String get similar => 'Hasonló';

  @override
  String get recommendations => 'Ajánlások';

  @override
  String cancelRequestForTitle(String title) {
    return 'Visszavonod a(z) „$title” igénylését?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Visszavonod a(z) „$title” $count igénylését?';
  }

  @override
  String get keep => 'Megtartás';

  @override
  String get itemNotFoundInLibrary =>
      'Az elem nem található a Moonfin-könyvtáradban';

  @override
  String get errorSearchingLibrary => 'Hiba a könyvtár keresése közben';

  @override
  String budgetAmount(String amount) {
    return 'Költségvetés: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Bevétel: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type igénylése';
  }

  @override
  String get submitRequest => 'Igénylés elküldése';

  @override
  String get allSeasons => 'Minden évad';

  @override
  String get advancedOptions => 'Speciális beállítások';

  @override
  String get noServiceServersConfigured =>
      'Nincsenek konfigurálva szervizszerverek';

  @override
  String get server => 'Szerver';

  @override
  String get qualityProfile => 'Minőségi profil';

  @override
  String get rootFolder => 'Gyökérmappa';

  @override
  String get showMore => 'Továbbiak megjelenítése';

  @override
  String get appearances => 'Szereplések';

  @override
  String get crewSection => 'Stáb';

  @override
  String ageValue(int age) {
    return '$age éves';
  }

  @override
  String get noRequests => 'Nincsenek kérések';

  @override
  String get pendingStatus => 'Függőben lévő';

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
  String get failedStatus => 'Sikertelen';

  @override
  String get processingStatus => 'Feldolgozás';

  @override
  String modifiedByName(String name) {
    return 'Módosította: $name';
  }

  @override
  String get completedStatus => 'Elkészült';

  @override
  String get requestErrorDuplicate => 'Ezt a címet már igényelték';

  @override
  String get requestErrorQuota => 'Elérted az igénylési korlátot';

  @override
  String get requestErrorBlocklisted => 'Ez a cím tiltólistás';

  @override
  String get requestErrorNoSeasons => 'Nem maradt igényelhető évad';

  @override
  String get requestErrorPermission =>
      'Nincs jogosultságod ehhez az igényléshez';

  @override
  String get seerrRequestsTitle => 'Igénylések';

  @override
  String get seerrIssuesTitle => 'Problémák';

  @override
  String get sortNewest => 'Legújabb';

  @override
  String get sortLastModified => 'Legutóbbi módosítás';

  @override
  String get noIssues => 'Nincsenek problémák';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Még $remaining filmigénylés maradt a(z) $limit-ből';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Még $remaining évadigénylés maradt a(z) $limit-ből';
  }

  @override
  String partOfCollectionName(String name) {
    return 'A(z) $name része';
  }

  @override
  String get viewCollection => 'Gyűjtemény megtekintése';

  @override
  String get requestCollection => 'Gyűjtemény igénylése';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total film · $available elérhető';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count film igénylése';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$current / $total igénylése...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Sikeresen igényeltél $count filmet';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Sikeresen igényeltél $ok filmet a(z) $total-ből';
  }

  @override
  String get collectionAllRequested =>
      'Minden film elérhető vagy igényelve van már';

  @override
  String get reportIssue => 'Probléma bejelentése';

  @override
  String get issueTypeVideo => 'Videó';

  @override
  String get issueTypeAudio => 'Hang';

  @override
  String get whatsWrong => 'Mi a probléma?';

  @override
  String get allEpisodes => 'Összes epizód';

  @override
  String get episode => 'Epizód';

  @override
  String get openStatus => 'Nyitott';

  @override
  String get resolvedStatus => 'Megoldott';

  @override
  String get resolveAction => 'Megoldás';

  @override
  String get reopenAction => 'Újranyitás';

  @override
  String reportedByName(String name) {
    return 'Bejelentette: $name';
  }

  @override
  String commentsCount(int count) {
    return '$count hozzászólás';
  }

  @override
  String get addComment => 'Hozzászólás hozzáadása';

  @override
  String get deleteIssueConfirm => 'Törlöd ezt a problémát?';

  @override
  String get submitReport => 'Jelentés elküldése';

  @override
  String get tmdbScore => 'TMDB pontszám';

  @override
  String get releaseDateLabel => 'Megjelenés dátuma';

  @override
  String get firstAirDateLabel => 'Első adás';

  @override
  String get revenueLabel => 'Bevétel';

  @override
  String get runtimeLabel => 'Futásidő';

  @override
  String get budgetLabel => 'Költségvetés';

  @override
  String get originalLanguageLabel => 'Eredeti nyelv';

  @override
  String get seasonsLabel => 'Évadok';

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
  String get copy => 'Másolás';

  @override
  String get create => 'Létrehozás';

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
  String get go => 'Mehet';

  @override
  String get install => 'Telepítés';

  @override
  String get installed => 'Telepítve';

  @override
  String get interval => 'Intervallum';

  @override
  String get name => 'Név';

  @override
  String get networking => 'Hálózat';

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
  String get run => 'Futtatás';

  @override
  String get search => 'Keresés';

  @override
  String get select => 'Kiválasztás';

  @override
  String get send => 'Elküld';

  @override
  String get sessions => 'Munkamenetek';

  @override
  String get set => 'Készlet';

  @override
  String get status => 'Állapot';

  @override
  String get stop => 'Leállítás';

  @override
  String get streaming => 'Streamelés';

  @override
  String get time => 'Idő';

  @override
  String get trickplay => 'Trickplay';

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
  String get mute => 'Némítás';

  @override
  String get branding => 'Arculat';

  @override
  String get adminDrawerDashboard => 'Irányítópult';

  @override
  String get adminDrawerAnalytics => 'Analitika';

  @override
  String get adminDrawerSettings => 'Beállítások';

  @override
  String get adminDrawerBranding => 'Arculat';

  @override
  String get adminDrawerUsers => 'Felhasználók';

  @override
  String get adminDrawerLibraries => 'Könyvtárak';

  @override
  String get adminDrawerDisplay => 'Megjelenítés';

  @override
  String get adminDrawerMetadata => 'Metaadatok';

  @override
  String get adminDrawerNfo => 'NFO-beállítások';

  @override
  String get adminDrawerTranscoding => 'Átkódolás';

  @override
  String get adminDrawerResume => 'Folytatás';

  @override
  String get adminDrawerStreaming => 'Streamelés';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Eszközök';

  @override
  String get adminDrawerActivity => 'Tevékenység';

  @override
  String get adminDrawerNetworking => 'Hálózat';

  @override
  String get adminDrawerApiKeys => 'API-kulcsok';

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
  String get adminExitTooltip => 'Kilépés az adminisztrációból';

  @override
  String get adminDashboardLoadFailed =>
      'Nem sikerült betölteni az irányítópultot';

  @override
  String get adminMediaOverview => 'Média áttekintése';

  @override
  String get adminMediaTotalsError =>
      'Nem sikerült betölteni a szerver média-összesítéseit.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Gyors áttekintés arról, hogy mennyi tartalom van ezen a szerveren.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Elérhető beépülőmodul-frissítések: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Újraindítást igénylő beépülő modulok: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Sikertelen ütemezett feladatok: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Legutóbbi figyelmeztetés- és hibabejegyzések: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Média megoszlása';

  @override
  String get analyticsVideoCodecs => 'Videókodekek';

  @override
  String get analyticsAudioCodecs => 'Audiokodekek';

  @override
  String get analyticsContainers => 'Konténerek';

  @override
  String get analyticsTopGenres => 'Legjobb műfajok';

  @override
  String get analyticsReleaseYears => 'Kiadási évek';

  @override
  String get analyticsContentRatings => 'Tartalomértékelések';

  @override
  String get analyticsRuntimeBuckets => 'Futásidő-tartományok';

  @override
  String get analyticsFileFormats => 'Fájlformátumok';

  @override
  String get analyticsNoData => 'Nincs elérhető adat.';

  @override
  String get adminServerInfo => 'Szerverinfó';

  @override
  String get adminRestartPending => 'Újraindítás függőben';

  @override
  String get adminServerPaths => 'Szerver útvonalai';

  @override
  String get adminServerActions => 'Szerverműveletek';

  @override
  String get adminRestartServer => 'Szerver újraindítása';

  @override
  String get adminShutdownServer => 'Szerver leállítása';

  @override
  String get adminScanLibraries => 'Könyvtárak beolvasása';

  @override
  String get adminLibraryScanStarted => 'Könyvtárbeolvasás elindult';

  @override
  String errorGeneric(String error) {
    return 'Hiba: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'A szerver újraindítása folyamatban van';

  @override
  String get adminServerRebootMessage =>
      'A szerver újraindítása folyamatban van, kérlek, indítsd újra a Moonfint';

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
  String get adminNoRecentActivity => 'Nincs legutóbbi tevékenység';

  @override
  String adminCommandFailed(String error) {
    return 'A parancs nem sikerült: $error';
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
  String get sessionForward => 'Előretekerés';

  @override
  String get sessionNext => 'Következő';

  @override
  String get sessionVolumeDown => 'Hangerő –';

  @override
  String get sessionVolumeUp => 'Hangerő +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Most játszott';

  @override
  String get volume => 'Hangerő';

  @override
  String get actions => 'Műveletek';

  @override
  String get videoCodec => 'Videókodek';

  @override
  String get audioCodec => 'Audiokodek';

  @override
  String get hwAccel => 'Hardveres gyorsítás';

  @override
  String get completion => 'Befejezés';

  @override
  String get direct => 'Közvetlen';

  @override
  String get adminDisconnect => 'Kapcsolat bontása';

  @override
  String get adminClearDates => 'Dátumok törlése';

  @override
  String get adminActivitySeverityAll => 'Minden súlyosság';

  @override
  String get adminActivityDateRange => 'Dátumtartomány';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Nem sikerült betölteni a tevékenységnaplót: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nincsenek tevékenységbejegyzések';

  @override
  String get adminEditDeviceName => 'Eszköznév szerkesztése';

  @override
  String get adminCustomName => 'Egyéni név';

  @override
  String get adminDeviceNameUpdated => 'Az eszköz neve frissítve';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Nem sikerült frissíteni az eszközt: $error';
  }

  @override
  String get adminDeleteDevice => 'Eszköz törlése';

  @override
  String get adminDeviceDeleted => 'Eszköz törölve';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Nem sikerült törölni az eszközt: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Eltávolítod a(z) „$name” eszközt? A felhasználónak újra be kell majd jelentkeznie ezen az eszközön.';
  }

  @override
  String get adminDeleteAllDevices => 'Minden eszköz törlése';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Eltávolítasz $count eszközt? Az érintett felhasználóknak újra be kell majd jelentkezniük. A jelenlegi eszközödet ez nem érinti.';
  }

  @override
  String get adminDevicesDeletedAll => 'Eszközök eltávolítva';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Néhány eszköz eltávolítva; $count eszközt nem sikerült eltávolítani.';
  }

  @override
  String get adminDevicesLoadFailed => 'Nem sikerült betölteni az eszközöket';

  @override
  String get adminSearchDevices => 'Eszközök keresése';

  @override
  String get adminThisDevice => 'Ez az eszköz';

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
  String get adminAddLibrary => 'Könyvtár hozzáadása';

  @override
  String adminScanFailed(String error) {
    return 'Nem sikerült elindítani a beolvasást: $error';
  }

  @override
  String get adminRenameLibrary => 'Könyvtár átnevezése';

  @override
  String get adminNewName => 'Új név';

  @override
  String adminLibraryRenamed(String name) {
    return 'A könyvtár átnevezve erre: „$name”';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Nem sikerült az átnevezés: $error';
  }

  @override
  String get adminDeleteLibrary => 'Könyvtár törlése';

  @override
  String adminLibraryDeleted(String name) {
    return 'A(z) „$name” könyvtár törölve';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Nem sikerült törölni a könyvtárat: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Nem sikerült hozzáadni az elérési utat: $error';
  }

  @override
  String get adminRemovePath => 'Elérési út eltávolítása';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Eltávolítod a(z) „$path” elérési utat ebből a könyvtárból?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Nem sikerült eltávolítani az elérési utat: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Könyvtár beállításai elmentve';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Nem sikerült menteni a beállításokat: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nem sikerült betölteni a könyvtárat';

  @override
  String get adminNoMediaPaths => 'Nincsenek konfigurálva médiaútvonalak';

  @override
  String get adminAddPath => 'Elérési út hozzáadása';

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
  String get adminMetadataCountryCode => 'Metaadatok országkódja';

  @override
  String get adminMetadataCountryHint => 'pl. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Elérési utak';

  @override
  String get adminLibraryTabOptions => 'Opciók';

  @override
  String get adminLibraryTabDownloaders => 'Letöltők';

  @override
  String get adminLibMetadataSavers => 'Metaadat-mentők';

  @override
  String get adminLibSubtitleDownloaders => 'Feliratletöltők';

  @override
  String get adminLibLyricDownloaders => 'Dalszövegletöltők';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metaadat-letöltők: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Képletöltők: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Ez a szerver nem kínál letöltőket ehhez a könyvtártípushoz.';

  @override
  String get adminLibrarySectionGeneral => 'Általános';

  @override
  String get adminLibrarySectionMetadata => 'Metaadatok';

  @override
  String get adminLibrarySectionEmbedded => 'Beágyazott információk';

  @override
  String get adminLibrarySectionSubtitles => 'Feliratok';

  @override
  String get adminLibrarySectionImages => 'Képek';

  @override
  String get adminLibrarySectionSeries => 'Sorozatok';

  @override
  String get adminLibrarySectionMusic => 'Zene';

  @override
  String get adminLibrarySectionMovies => 'Filmek';

  @override
  String get adminLibRealtimeMonitor => 'Valós idejű megfigyelés engedélyezése';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Fájlváltozások észlelése és automatikus feldolgozása.';

  @override
  String get adminLibArchiveMediaFiles => 'Archívumok kezelése médiafájlként';

  @override
  String get adminLibEnablePhotos => 'Fotók megjelenítése';

  @override
  String get adminLibSaveLocalMetadata => 'Borítóképek mentése a médiamappákba';

  @override
  String get adminLibRefreshInterval => 'Automatikus metaadat-frissítés';

  @override
  String get adminLibRefreshNever => 'Soha';

  @override
  String get adminLibDefault => 'Alapértelmezett';

  @override
  String get adminLibDisplayTitle => 'Megjelenítés';

  @override
  String get adminLibDisplaySection => 'Könyvtár megjelenítése';

  @override
  String get adminLibFolderView =>
      'Mappanézet megjelenítése az egyszerű médiamappákhoz';

  @override
  String get adminLibSpecialsInSeasons =>
      'Különleges epizódok megjelenítése a sugárzásuknak megfelelő évadokban';

  @override
  String get adminLibGroupMovies => 'Filmek csoportosítása gyűjteményekbe';

  @override
  String get adminLibGroupShows => 'Sorozatok csoportosítása gyűjteményekbe';

  @override
  String get adminLibExternalSuggestions =>
      'Külső tartalom megjelenítése a javaslatokban';

  @override
  String get adminLibDateAddedSection => 'Hozzáadás dátumának viselkedése';

  @override
  String get adminLibDateAddedLabel => 'Hozzáadás dátuma innen';

  @override
  String get adminLibDateAddedImport => 'A könyvtárba való beolvasás dátuma';

  @override
  String get adminLibDateAddedFile => 'A fájl létrehozásának dátuma';

  @override
  String get adminLibMetadataTitle => 'Metaadatok és képek';

  @override
  String get adminLibMetadataLangSection =>
      'Előnyben részesített metaadat-nyelv';

  @override
  String get adminLibChaptersSection => 'Fejezetek';

  @override
  String get adminLibDummyChapterDuration =>
      'Helykitöltő fejezetek hossza (másodperc)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'A fejezetek nélküli médiákhoz generált fejezetek hossza. Állítsd 0-ra a letiltáshoz.';

  @override
  String get adminLibChapterImageResolution => 'Fejezetképek felbontása';

  @override
  String get adminLibNfoTitle => 'NFO-beállítások';

  @override
  String get adminLibNfoHelp =>
      'Az NFO-metaadatok kompatibilisek a Kodi és hasonló kliensekkel. A beállítások minden olyan könyvtárra érvényesek, amely NFO-metaadatokat ment.';

  @override
  String get adminLibKodiUser =>
      'Felhasználó, akinek a megtekintési adatait az NFO-fájlokba menti';

  @override
  String get adminLibSaveImagePaths => 'Képútvonalak mentése az NFO-fájlokba';

  @override
  String get adminLibPathSubstitution =>
      'Útvonal-helyettesítés engedélyezése az NFO-képútvonalakhoz';

  @override
  String get adminLibExtraThumbs =>
      'Extrafanart képek másolása egy extrathumbs mappába';

  @override
  String get adminLibNone => 'Nincs';

  @override
  String adminLibRefreshDays(int days) {
    return '$days nap';
  }

  @override
  String get adminLibEmbeddedTitles => 'Beágyazott címek használata';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Beágyazott címek használata az extrákhoz';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Beágyazott epizódinformációk használata';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Beágyazott feliratok engedélyezése';

  @override
  String get adminLibEmbeddedAllowAll => 'Összes engedélyezése';

  @override
  String get adminLibEmbeddedAllowText => 'Csak szöveg';

  @override
  String get adminLibEmbeddedAllowImage => 'Csak kép';

  @override
  String get adminLibEmbeddedAllowNone => 'Nincs';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Letöltés kihagyása, ha vannak beágyazott feliratok';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Letöltés kihagyása, ha a hangsáv megegyezik a letöltési nyelvvel';

  @override
  String get adminLibRequirePerfectMatch =>
      'Pontos felirat-egyezőség megkövetelése';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Feliratok mentése a médiamappákba';

  @override
  String get adminLibChapterImageExtraction => 'Fejezetképek kinyerése';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Fejezetképek kinyerése a könyvtár beolvasása közben';

  @override
  String get adminLibTrickplayExtraction =>
      'Trickplay-képek kinyerésének engedélyezése';

  @override
  String get adminLibTrickplayDuringScan =>
      'Trickplay-képek kinyerése a könyvtár beolvasása közben';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay-képek mentése a médiamappákba';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Több mappában elszórt sorozatok automatikus összevonása';

  @override
  String get adminLibSeasonZeroName => 'Nulladik évad megjelenített neve';

  @override
  String get adminLibLufsScan =>
      'LUFS-beolvasás engedélyezése a hangnormalizáláshoz';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Nem szabványos előadócímkék előnyben részesítése';

  @override
  String get adminLibAutoAddToCollection =>
      'Filmek automatikus hozzáadása a gyűjteményekhez';

  @override
  String get adminLibraryNameRequired => 'A könyvtár neve kötelező';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Nem sikerült létrehozni a könyvtárat: $error';
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
  String get paths => 'Elérési utak:';

  @override
  String get adminDisableUser => 'Felhasználó letiltása';

  @override
  String get adminEnableUser => 'Felhasználó engedélyezése';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Letiltod $name felhasználót? Nem fog tudni bejelentkezni.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Engedélyezed $name felhasználót? Újra be fog tudni jelentkezni.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'A(z) „$name” felhasználó letiltva';
  }

  @override
  String adminUserEnabled(String name) {
    return 'A(z) „$name” felhasználó engedélyezve';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Nem sikerült frissíteni a felhasználói szabályzatot: $error';
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
    return 'Nem sikerült létrehozni a felhasználót: $error';
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
    return 'Nem sikerült menteni: $error';
  }

  @override
  String get adminPermissionsSaved => 'Engedélyek elmentve';

  @override
  String get adminPasswordsMismatch => 'A jelszavak nem egyeznek';

  @override
  String adminFailed(String error) {
    return 'Sikertelen: $error';
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
      'A rendszergazdák teljes hozzáféréssel rendelkeznek a szerverhez. Óvatosan add meg a hozzáférést.';

  @override
  String get administrator => 'Adminisztrátor';

  @override
  String get adminHiddenUser => 'Rejtett felhasználó';

  @override
  String get adminAllowMediaPlayback => 'Médialejátszás engedélyezése';

  @override
  String get adminAllowAudioTranscoding => 'Hangsáv-átkódolás engedélyezése';

  @override
  String get adminAllowVideoTranscoding => 'Videó-átkódolás engedélyezése';

  @override
  String get adminAllowRemuxing => 'Újrakeverés engedélyezése';

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
  String get adminRemoteBitrateLimit => 'Távoli kliens bitráta-korlátja (bps)';

  @override
  String get adminLeaveEmptyNoLimit =>
      'Hagyd üresen, ha nem szeretnél korlátozást';

  @override
  String get adminMaxActiveSessions => 'Maximális aktív munkamenet';

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
  String get adminPasswordReset => 'Jelszó-visszaállítás';

  @override
  String get adminPasswordUpdated => 'Jelszó frissítve';

  @override
  String get adminUserSettings => 'Felhasználói beállítások';

  @override
  String get adminLibraryAccess => 'Könyvtár-hozzáférés';

  @override
  String get adminDeviceAndChannelAccess => 'Eszköz- és csatornahozzáférés';

  @override
  String get adminEnableAllDevices =>
      'Hozzáférés engedélyezése az összes eszközhöz';

  @override
  String get adminEnableAllChannels =>
      'Hozzáférés engedélyezése az összes csatornához';

  @override
  String get adminParentalControl => 'Szülői felügyelet';

  @override
  String get adminMaxParentalRating =>
      'Maximálisan engedélyezett szülői értékelés';

  @override
  String get adminMaxParentalRatingHint =>
      'Az ennél magasabb szülői értékelésű tartalmak el lesznek rejtve a felhasználó elől.';

  @override
  String get adminParentalRatingNone => 'Nincs';

  @override
  String get adminBlockUnratedItems =>
      'Értékelés nélküli vagy ismeretlen értékelésű elemek blokkolása';

  @override
  String get adminUnratedBook => 'Könyvek';

  @override
  String get adminUnratedChannelContent => 'Csatornák';

  @override
  String get adminUnratedLiveTvChannel => 'Élő TV';

  @override
  String get adminUnratedMovie => 'Filmek';

  @override
  String get adminUnratedMusic => 'Zene';

  @override
  String get adminUnratedTrailer => 'Előzetesek';

  @override
  String get adminUnratedSeries => 'Sorozatok';

  @override
  String get adminAccessSchedules => 'Hozzáférési ütemezések';

  @override
  String get adminAccessSchedulesHint =>
      'A hozzáférés csak az alábbi ütemezett időszakokban engedélyezett. Ha nincs beállítva ütemezés, a hozzáférés egész nap megengedett.';

  @override
  String get adminAddSchedule => 'Ütemezés hozzáadása';

  @override
  String get adminScheduleDay => 'Nap';

  @override
  String get adminScheduleStart => 'Kezdés';

  @override
  String get adminScheduleEnd => 'Vége';

  @override
  String get adminDayEveryday => 'Minden nap';

  @override
  String get adminDayWeekday => 'Hétköznap';

  @override
  String get adminDayWeekend => 'Hétvége';

  @override
  String get adminDaySunday => 'Vasárnap';

  @override
  String get adminDayMonday => 'Hétfő';

  @override
  String get adminDayTuesday => 'Kedd';

  @override
  String get adminDayWednesday => 'Szerda';

  @override
  String get adminDayThursday => 'Csütörtök';

  @override
  String get adminDayFriday => 'Péntek';

  @override
  String get adminDaySaturday => 'Szombat';

  @override
  String get adminAllowedTags => 'Engedélyezett címkék';

  @override
  String get adminAllowedTagsHint =>
      'Csak az ezekkel a címkékkel rendelkező tartalom jelenik meg. Hagyd üresen az összes engedélyezéséhez.';

  @override
  String get adminBlockedTags => 'Tiltott címkék';

  @override
  String get adminBlockedTagsHint =>
      'Az ilyen címkékkel rendelkező tartalmak el lesznek rejtve a felhasználó elől.';

  @override
  String get adminAddTag => 'Címke hozzáadása';

  @override
  String get adminEnabledDevices => 'Engedélyezett eszközök';

  @override
  String get adminEnabledChannels => 'Engedélyezett csatornák';

  @override
  String get adminAuthProvider => 'Hitelesítési szolgáltató';

  @override
  String get adminPasswordResetProvider => 'Jelszó-visszaállítási szolgáltató';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Sikertelen bejelentkezési kísérletek maximális száma a kizárás előtt';

  @override
  String get adminLoginAttemptsHint =>
      'Állítsd 0-ra az alapértelmezetthez, vagy -1-re a kizárás letiltásához.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay-hozzáférés';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Csoportok létrehozásának és az azokhoz való csatlakozásnak az engedélyezése';

  @override
  String get adminSyncPlayJoin => 'Csoportokhoz való csatlakozás engedélyezése';

  @override
  String get adminSyncPlayNone => 'Nincs hozzáférés';

  @override
  String get adminContentDeletionFolders =>
      'Tartalomtörlés engedélyezése innen';

  @override
  String get adminResetPasswordWarning =>
      'Ez eltávolítja a jelszót. A felhasználó jelszó nélkül is be tud majd jelentkezni.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'A szerver HTTP $status kódot adott vissza';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Biztosan törölni szeretnéd $name felhasználót?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'A(z) „$name” felhasználó törölve';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Nem sikerült törölni a felhasználót: $error';
  }

  @override
  String get adminCreateApiKey => 'API-kulcs létrehozása';

  @override
  String get adminAppName => 'Alkalmazás neve';

  @override
  String get adminApiKeyCreated => 'API-kulcs létrehozva';

  @override
  String get adminApiKeyCreatedNoToken =>
      'A kulcs sikeresen létrehozva. A szerver nem küldte vissza a tokent. Ellenőrizd a szerver API-kulcsait.';

  @override
  String get adminKeyCopied => 'A kulcs vágólapra másolva';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Nem sikerült létrehozni a kulcsot: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'A kulcstoken hiányzik a szerver válaszából';

  @override
  String get adminRevokeApiKey => 'API-kulcs visszavonása';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Visszavonod $name kulcsát?';
  }

  @override
  String get adminApiKeyRevoked => 'API-kulcs visszavonva';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nem sikerült visszavonni a kulcsot: $error';
  }

  @override
  String get adminApiKeysLoadFailed =>
      'Nem sikerült betölteni az API-kulcsokat';

  @override
  String get adminApiKeysTitle => 'API-kulcsok';

  @override
  String get adminCreateKey => 'Kulcs létrehozása';

  @override
  String get adminNoApiKeys => 'Nem található API-kulcs';

  @override
  String get adminUnknownApp => 'Ismeretlen alkalmazás';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nLétrehozva: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Biztonsági mentés készítése';

  @override
  String get adminBackupInclude =>
      'Válaszd ki, hogy mit tartalmazzon a biztonsági mentés.';

  @override
  String get adminBackupDatabase => 'Adatbázis';

  @override
  String get adminBackupDatabaseAlways => 'Mindig a mentés része';

  @override
  String get adminBackupMetadata => 'Metaadatok';

  @override
  String get adminBackupSubtitles => 'Feliratok';

  @override
  String get adminBackupTrickplay => 'Trickplay-képek';

  @override
  String get adminCreatingBackup => 'Biztonsági mentés készítése...';

  @override
  String get adminBackupCreated => 'Biztonsági mentés sikeresen létrehozva';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Nem sikerült létrehozni a biztonsági mentést: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'A szerver válaszában hiányzik a biztonsági mentési útvonal';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesztum: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Nem sikerült betölteni a manifesztumot: $error';
  }

  @override
  String get adminConfirmRestore => 'Visszaállítás megerősítése';

  @override
  String get adminRestoringBackup => 'Biztonsági mentés visszaállítása...';

  @override
  String adminRestoreFailed(String error) {
    return 'Nem sikerült visszaállítani a biztonsági mentést: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'Nem sikerült betölteni a biztonsági mentéseket';

  @override
  String get adminCreateBackup => 'Biztonsági mentés készítése';

  @override
  String get adminNoBackups => 'Nem található biztonsági mentés';

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
  String get adminSaveLogFile => 'Naplófájl mentése';

  @override
  String adminSavedTo(String path) {
    return 'Mentve ide: $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Nem sikerült menteni a fájlt: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Nem sikerült betölteni a(z) $fileName fájlt';
  }

  @override
  String get adminSearchInLog => 'Keresés a naplóban';

  @override
  String get adminNoMatchingLines => 'Nincsenek egyező sorok';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Nem sikerült betölteni a feladatokat: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nem található ütemezett feladat';

  @override
  String get adminNoTasksMatchFilter =>
      'Egyetlen feladat sem felel meg az aktuális szűrőnek';

  @override
  String adminTaskStartFailed(String error) {
    return 'Nem sikerült elindítani a feladatot: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Nem sikerült leállítani a feladatot: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Nem sikerült betölteni a feladatot: $error';
  }

  @override
  String get adminRunNow => 'Futtatás most';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Nem sikerült eltávolítani az indítót: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Nem sikerült hozzáadni az indítót: $error';
  }

  @override
  String get adminLastExecution => 'Legutóbbi futtatás';

  @override
  String get adminTriggers => 'Indítók';

  @override
  String get adminAddTrigger => 'Indító hozzáadása';

  @override
  String get adminNoTriggers => 'Nincsenek konfigurálva indítók';

  @override
  String get adminTriggerType => 'Indító típusa';

  @override
  String get adminTimeLimit => 'Időkorlát (nem kötelező)';

  @override
  String get adminNoLimit => 'Nincs korlátozás';

  @override
  String adminHours(String hours) {
    return '$hours óra';
  }

  @override
  String get adminDayOfWeek => 'A hét napja';

  @override
  String get adminSearchPlugins => 'Beépülő modulok keresése...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Nem sikerült átváltani a beépülő modult: $error';
  }

  @override
  String get adminUninstallPlugin => 'Beépülő modul eltávolítása';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Biztosan el szeretnéd távolítani a(z) „$name” beépülő modult?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Nem sikerült eltávolítani a beépülő modult: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Nem sikerült telepíteni a csomagot: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Nem sikerült telepíteni a frissítést: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Nem sikerült betölteni a beépülő modulokat: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Egyetlen beépülő modul sem felel meg a keresésnek';

  @override
  String get adminNoPluginsInstalled => 'Nincsenek telepítve beépülő modulok';

  @override
  String adminInstallUpdate(String version) {
    return 'Frissítés telepítése (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Nem sikerült betölteni a katalógust: $error';
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
      'A beépülő modulok beállításainak integrációja még kísérleti fázisban van. Előfordulhat, hogy egyes beállítási oldalak nem jelennek meg megfelelően.';

  @override
  String get continueAction => 'Folytatás';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'A(z) „$name” a szerver újraindítása után lesz eltávolítva';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Nem sikerült az eltávolítás: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'A(z) „$name” frissítése a(z) v$version verzióra...';
  }

  @override
  String get adminMissingAuthToken =>
      'Nem lehet megnyitni a beállításokat: hiányzik a hitelesítési token.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Nem sikerült betölteni a beépülő modult: $error';
  }

  @override
  String get adminPluginNotFound => 'A beépülő modul nem található';

  @override
  String adminPluginVersion(String version) {
    return 'Verzió: $version';
  }

  @override
  String get adminEnablePlugin => 'Beépülő modul engedélyezése';

  @override
  String get adminPluginSettingsPage => 'Beépülő modul beállítási oldala';

  @override
  String get adminRevisionHistory => 'Revíziótörténet';

  @override
  String get adminNoChangelog => 'Nem érhető el változásnapló.';

  @override
  String get adminRemoveRepository => 'Adattár eltávolítása';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Biztosan el szeretnéd távolítani a(z) „$name” adattárat?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Nem sikerült menteni az adattárakat: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Nem sikerült betölteni az adattárakat: $error';
  }

  @override
  String get adminRepositoryNameHint => 'például Jellyfin stabil';

  @override
  String get adminRepositoryUrl => 'Adattár URL-je';

  @override
  String get adminAddEntry => 'Bejegyzés hozzáadása';

  @override
  String get adminInvalidUrl => 'Érvénytelen URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Nem sikerült betölteni a beépülő modul beállításait: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nem sikerült megnyitni a(z) $uri címet';
  }

  @override
  String get adminOpenInBrowser => 'Megnyitás böngészőben';

  @override
  String get adminOpenExternally => 'Megnyitás külső lejátszóval';

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
  String get adminMetadataPath => 'Metaadatok elérési útja';

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
  String get adminCustomCssHint => 'A webes felületre alkalmazott egyedi CSS';

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
      'Távoli kliens bitráta-korlátja (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Hagyd üresen, vagy adj meg 0-t a korlátlanhoz';

  @override
  String get adminPlaybackSaved => 'A lejátszási beállítások elmentve';

  @override
  String get adminPlaybackLoadFailed =>
      'Nem sikerült betölteni a lejátszási beállításokat';

  @override
  String get adminPlaybackTranscoding => 'Lejátszás / átkódolás';

  @override
  String get adminHardwareAcceleration => 'Hardveres gyorsítás';

  @override
  String get adminVaapiDevice => 'VA-API eszköz';

  @override
  String get adminEnableHardwareEncoding => 'Hardveres kódolás engedélyezése';

  @override
  String get adminEnableHardwareDecoding =>
      'Hardveres dekódolás engedélyezése:';

  @override
  String get adminEncodingThreads => 'Kódolási szálak';

  @override
  String get adminAutomatic => '0 = automatikus';

  @override
  String get adminTranscodingTempPath => 'Ideiglenes átkódolási útvonal';

  @override
  String get adminEnableFallbackFont => 'Tartalék betűtípus engedélyezése';

  @override
  String get adminFallbackFontPath => 'Tartalék betűtípus elérési útja';

  @override
  String get adminAllowSegmentDeletion => 'Szegmens törlésének engedélyezése';

  @override
  String get adminSegmentKeepSeconds => 'Szegmens megtartása (másodperc)';

  @override
  String get adminThrottleBuffering => 'Pufferelés korlátozása';

  @override
  String get adminTrickplaySaved => 'A Trickplay-beállítások elmentve';

  @override
  String get adminTrickplayLoadFailed =>
      'Nem sikerült betölteni a Trickplay-beállításokat';

  @override
  String get adminEnableHardwareAcceleration =>
      'Hardveres gyorsítás engedélyezése';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Csak a kulcskockák kinyerésének engedélyezése';

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
  String get adminCaptureFrameSubtitle => 'Képkockák rögzítésének gyakorisága';

  @override
  String get adminWidthResolutions => 'Szélességi felbontások';

  @override
  String get adminTileWidth => 'Csempe szélessége';

  @override
  String get adminTileHeight => 'Csempe magassága';

  @override
  String get adminQualitySubtitle =>
      'Alacsonyabb érték = jobb minőség, nagyobb fájlok';

  @override
  String get adminProcessThreads => 'Folyamatszálak';

  @override
  String get adminResumeSaved => 'Folytatási beállítások mentve';

  @override
  String get adminResumeLoadFailed =>
      'Nem sikerült betölteni a folytatási beállításokat';

  @override
  String get adminResumeDescription =>
      'Konfiguráld, hogy a tartalom mikor legyen részben vagy teljesen lejátszottként megjelölve.';

  @override
  String get adminMinResumePercentage => 'Minimális folytatási százalék';

  @override
  String get adminMinResumeSubtitle =>
      'A haladás mentéséhez a tartalmat ezen a százalékon túl kell lejátszani';

  @override
  String get adminMaxResumePercentage => 'Maximális folytatási százalék';

  @override
  String get adminMaxResumeSubtitle =>
      'A tartalom e százalék után teljesen lejátszottnak minősül';

  @override
  String get adminMinResumeDuration =>
      'Minimális folytatási időtartam (másodperc)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Az ennél rövidebb elemek lejátszása nem folytatható';

  @override
  String get adminMinAudiobookResume =>
      'A hangoskönyv-folytatás minimális százaléka';

  @override
  String get adminMaxAudiobookResume =>
      'A hangoskönyv-folytatás maximális százaléka';

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
  String get adminHttpPort => 'HTTP-port';

  @override
  String get adminHttpsPort => 'HTTPS-port';

  @override
  String get adminPublicHttpsPort => 'Nyilvános HTTPS-port';

  @override
  String get adminBaseUrl => 'Alap URL';

  @override
  String get adminBaseUrlHint => 'például /jellyfin';

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
  String get adminRemoteIpFilterEntries => 'Távoli IP-szűrő';

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
    return 'Nem sikerült betölteni a metaadatokat: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Nem sikerült menteni a metaadatokat: $error';
  }

  @override
  String get adminRefreshMetadata => 'Metaadatok frissítése';

  @override
  String get recursive => 'Rekurzív';

  @override
  String get adminReplaceAllMetadata => 'Összes metaadat cseréje';

  @override
  String get adminReplaceAllImages => 'Összes kép cseréje';

  @override
  String get adminMetadataRefreshRequested => 'Metaadatok frissítése kérve';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Nem sikerült frissíteni a metaadatokat: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Nem található távoli egyezés';

  @override
  String get adminRemoteResults => 'Távoli eredmények';

  @override
  String get adminRemoteMetadataApplied => 'Távoli metaadatok alkalmazva';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Távoli keresés sikertelen: $error';
  }

  @override
  String get adminUpdateContentType => 'Tartalomtípus frissítése';

  @override
  String get adminContentType => 'Tartalomtípus';

  @override
  String get adminContentTypeUpdated => 'Tartalomtípus frissítve';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nem sikerült frissíteni a tartalomtípust: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nem sikerült betölteni a metaadatszerkesztőt';

  @override
  String get adminNoPeopleEntries => 'Nincsenek személybejegyzések';

  @override
  String get adminNoExternalIds => 'Nem állnak rendelkezésre külső azonosítók';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType kép frissítve';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Nem sikerült letölteni a képet: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nem támogatott képformátum';

  @override
  String get adminImageReadFailed =>
      'Nem sikerült beolvasni a kiválasztott képet';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType kép feltöltve';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Nem sikerült feltölteni a képet: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType kép törlése';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType kép törölve';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Nem sikerült törölni a képet: $error';
  }

  @override
  String get adminAllProviders => 'Minden szolgáltató';

  @override
  String get adminNoRemoteImages => 'Nem találhatók távoli képek';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner felderítése sikertelen: $error';
  }

  @override
  String get adminAddTuner => 'Hangoló hozzáadása';

  @override
  String get adminEditTuner => 'Tuner szerkesztése';

  @override
  String get adminTunerTypeM3u => 'M3U-tuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Fájl vagy URL';

  @override
  String get adminTunerIpAddress => 'Tuner IP-címe';

  @override
  String get adminTunerFriendlyName => 'Barátságos név';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Egyidejű kapcsolatok korlátja';

  @override
  String get adminTunerCountHelp =>
      'A tuner által egyidejűleg engedélyezett streamek maximális száma. Állítsd 0-ra a korlátlanhoz.';

  @override
  String get adminTunerFallbackBitrate =>
      'Tartalék maximális streamelési bitráta';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Csak a kedvenc csatornák importálása';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Hardveres átkódolás engedélyezése';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 átkódolási konténer engedélyezése';

  @override
  String get adminTunerAllowStreamSharing => 'Streammegosztás engedélyezése';

  @override
  String get adminTunerEnableStreamLooping => 'Streamismétlés engedélyezése';

  @override
  String get adminTunerIgnoreDts => 'DTS figyelmen kívül hagyása';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Bemenet olvasása natív képsebességgel';

  @override
  String get adminEditProvider => 'Szolgáltató szerkesztése';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Fájl vagy URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmelőtag';

  @override
  String get adminXmltvMovieCategories => 'Filmkategóriák';

  @override
  String get adminXmltvCategoriesHelp =>
      'Több kategória elválasztásához használj függőleges vonalat.';

  @override
  String get adminXmltvKidsCategories => 'Gyerekkategóriák';

  @override
  String get adminXmltvNewsCategories => 'Hírkategóriák';

  @override
  String get adminXmltvSportsCategories => 'Sportkategóriák';

  @override
  String get adminSdUsername => 'Felhasználónév';

  @override
  String get adminSdPassword => 'Jelszó';

  @override
  String get adminSdCountry => 'Ország';

  @override
  String get adminSdCountrySelect => 'Válassz országot';

  @override
  String get adminSdPostalCode => 'Irányítószám';

  @override
  String get adminSdGetListings => 'Műsorlisták lekérése';

  @override
  String get adminSdListings => 'Műsorlisták';

  @override
  String get adminEnableAllTuners => 'Összes tuner engedélyezése';

  @override
  String get adminTunerType => 'Tuner típusa';

  @override
  String get adminTunerAdded => 'Tuner hozzáadva';

  @override
  String adminTunerAddFailed(String error) {
    return 'Nem sikerült hozzáadni a tunert: $error';
  }

  @override
  String get adminAddGuideProvider => 'Műsorújság-szolgáltató hozzáadása';

  @override
  String get adminProviderType => 'Szolgáltató típusa';

  @override
  String get adminProviderAdded => 'Szolgáltató hozzáadva';

  @override
  String adminProviderAddFailed(String error) {
    return 'Nem sikerült hozzáadni a szolgáltatót: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Nem sikerült eltávolítani a tunert: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tuner alaphelyzetbe állítása kérve';

  @override
  String adminTunerResetFailed(String error) {
    return 'Nem sikerült alaphelyzetbe állítani a tunert: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Ez a tunertípus nem támogatja az alaphelyzetbe állítást.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Nem sikerült eltávolítani a szolgáltatót: $error';
  }

  @override
  String get adminRecordingSettings => 'Felvételi beállítások';

  @override
  String get adminPrePadding => 'Felvétel előtti ráhagyás (perc)';

  @override
  String get adminPostPadding => 'Felvétel utáni ráhagyás (perc)';

  @override
  String get adminRecordingPath => 'Felvételi útvonal';

  @override
  String get adminSeriesRecordingPath => 'Sorozatok felvételi útvonala';

  @override
  String get adminMovieRecordingPath => 'Filmek felvételi útvonala';

  @override
  String get adminGuideDays => 'Műsorújság-adatok napjai';

  @override
  String get adminGuideDaysAuto => 'Automatikus';

  @override
  String adminGuideDaysValue(int days) {
    return '$days nap';
  }

  @override
  String get adminRecordingPostProcessor => 'Utófeldolgozó alkalmazás útvonala';

  @override
  String get adminRecordingPostProcessorArgs => 'Utófeldolgozó argumentumai';

  @override
  String get adminSaveRecordingNfo => 'Felvétel NFO-metaadatainak mentése';

  @override
  String get adminSaveRecordingImages => 'Felvétel képeinek mentése';

  @override
  String get adminLiveTvSectionTiming => 'Időzítés';

  @override
  String get adminLiveTvSectionPaths => 'Felvételi útvonalak';

  @override
  String get adminLiveTvSectionPostProcessing => 'Utófeldolgozás';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Műsorújság-adatok: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'A felvételi beállítások elmentve';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nem sikerült menteni a beállításokat: $error';
  }

  @override
  String get adminSetChannelMappings => 'Csatornaleképezések beállítása';

  @override
  String get adminMappingJson => 'Leképezési JSON';

  @override
  String get adminMappingJsonHint => 'Példa: leképezési JSON-adatok';

  @override
  String get adminChannelMappingsUpdated => 'A csatornaleképezések frissítve';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Nem sikerült frissíteni a leképezéseket: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nem sikerült betölteni az élő tévéadás adminisztrációját';

  @override
  String get adminTunerDevices => 'Tuner eszközök';

  @override
  String get adminNoTunerHosts => 'Nincs beállítva tunergazda';

  @override
  String get adminGuideProviders => 'Műsorújság-szolgáltatók';

  @override
  String get adminRefreshGuideData => 'Műsorújság-adatok frissítése';

  @override
  String get adminGuideRefreshStarted =>
      'Műsorújság-adatok frissítése elindult';

  @override
  String get adminGuideRefreshUnavailable =>
      'A műsorújság-frissítési feladat nem érhető el ezen a szerveren.';

  @override
  String get adminAddProvider => 'Szolgáltató hozzáadása';

  @override
  String get adminNoListingProviders =>
      'Nincsenek beállítva műsorújság-szolgáltatók';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Felvételi útvonal: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Sorozat útvonala: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Felvétel előtti ráhagyás: $minutes perc';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Felvétel utáni ráhagyás: $minutes perc';
  }

  @override
  String get adminTunerDiscovery => 'Tuner felderítése';

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
    return 'Visszaállítod a(z) $name biztonsági mentést most?';
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
  String get adminApply => 'Alkalmaz';

  @override
  String get adminNotSet => 'Nincs beállítva';

  @override
  String get adminReset => 'Visszaállítás';

  @override
  String get adminLogsTitle => 'Szervernaplók';

  @override
  String get adminLogsNewestFirst => 'Legújabb első';

  @override
  String get adminLogsOldestFirst => 'Legrégebbi első';

  @override
  String get adminLogsJustNow => 'Éppen most';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes perce';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours órája';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days napja';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Nem sikerült betölteni a(z) $fileName fájlt';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count találat';
  }

  @override
  String get adminLogViewerNoMatches => 'Nincsenek egyező sorok';

  @override
  String get adminMetadataEditorTitle => 'Metaadat-szerkesztő';

  @override
  String get adminMetadataIdentify => 'Azonosítás';

  @override
  String get adminMetadataType => 'Típus';

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
  String get adminMetadataImageBanner => 'Bannerkép';

  @override
  String get adminMetadataImageThumb => 'Bélyegkép';

  @override
  String get adminMetadataRecursive => 'Rekurzív';

  @override
  String get adminMetadataProvider => 'Szolgáltató';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType kép frissítve';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType kép feltöltve';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType kép törölve';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Nem sikerült letölteni a képet: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Nem sikerült beolvasni a kiválasztott képet';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Nem sikerült feltölteni a képet: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType kép törlése';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Ezzel eltávolítod az aktuális képet az elemből.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nem sikerült törölni a képet: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Válassz $imageType képet';
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
  String get adminPluginsRestart => 'Újraindítás';

  @override
  String get adminPluginsNoSearchResults =>
      'Egyetlen beépülő modul sem felel meg a keresésnek';

  @override
  String get adminPluginsNoneInstalled => 'Nincs telepítve beépülő modul';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Frissítés érhető el: v$version';
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
    return 'Frissítés telepítése (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nincs a keresésnek megfelelő csomag';

  @override
  String get adminPluginsCatalogEmpty => 'Nincsenek elérhető csomagok';

  @override
  String adminPluginsInstalling(String name) {
    return 'A(z) „$name” telepítése folyamatban van...';
  }

  @override
  String get adminPluginDetailExperimental => 'Kísérleti integráció';

  @override
  String get adminPluginDetailExperimentalContent =>
      'A beépülő modulok beállításainak integrációja még csak kísérleti jellegű. Előfordulhat, hogy egyes mezők vagy elrendezések még nem jelennek meg megfelelően.';

  @override
  String get adminPluginDetailToggle404 =>
      'Nem sikerült átkapcsolni a beépülő modult. A szerver nem találta a beépülő modul ezen verzióját. Próbáld meg frissíteni a beépülő modulokat, majd próbáld újra.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Nem sikerült átkapcsolni a beépülő modult. Kérlek, ellenőrizd a szervernaplókat a részletekért.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name beállítások';
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
      'Ez a beépülő modul meghibásodott, és előfordulhat, hogy nem működik megfelelően.';

  @override
  String get adminPluginDetailNotSupported =>
      'Ezt a beépülő modult a jelenlegi szerververzió nem támogatja.';

  @override
  String get adminPluginDetailSuperseded =>
      'Ezt a beépülő modult egy újabb verzió váltotta fel.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Nem sikerült betölteni a tárolókat: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Adattár eltávolítása';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Biztosan el akarod távolítani a(z) „$name” elemet?';
  }

  @override
  String get adminReposRemove => 'Eltávolítás';

  @override
  String adminReposSaveFailed(String error) {
    return 'Nem sikerült menteni a tárolókat: $error';
  }

  @override
  String get adminReposEmpty => 'Nincsenek beállítva tárolók';

  @override
  String get adminReposEmptySubtitle =>
      'Adj hozzá egy adattárat az elérhető beépülő modulok böngészéséhez';

  @override
  String get adminReposUnnamed => '(névtelen)';

  @override
  String get adminReposEditTitle => 'Adattár szerkesztése';

  @override
  String get adminReposAddTitle => 'Adattár hozzáadása';

  @override
  String get adminReposUrl => 'Adattár URL-je';

  @override
  String get adminReposNameHint => 'például Jellyfin stabil';

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
      'A könyvtár-beolvasás párhuzamossága';

  @override
  String get adminGeneralImageEncodingLimit => 'Párhuzamos képkódolási korlát';

  @override
  String get adminUnknownError => 'Ismeretlen hiba';

  @override
  String get adminBrowse => 'Tallózás';

  @override
  String get adminCloseBrowser => 'Böngésző bezárása';

  @override
  String get adminNetworkingTitle => 'Hálózat';

  @override
  String get adminNetworkingRestartWarning =>
      'A hálózati beállítások módosítása a szerver újraindítását teheti szükségessé.';

  @override
  String get adminNetworkingRemoteAccess => 'Távoli hozzáférés engedélyezése';

  @override
  String get adminNetworkingPorts => 'Portok';

  @override
  String get adminNetworkingHttpPort => 'HTTP-port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-port';

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
      'A bejelentkezési űrlap alatt megjelenő HTML';

  @override
  String get adminBrandingCustomCss => 'Egyedi CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'A webes felületre alkalmazott egyedi CSS';

  @override
  String get adminBrandingEnableSplash => 'Indítóképernyő engedélyezése';

  @override
  String get adminBrandingSplashUpload => 'Kép feltöltése';

  @override
  String get adminBrandingSplashUploaded => 'Indítóképernyő frissítve';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Nem sikerült feltölteni az indítóképernyőt';

  @override
  String get adminBrandingSplashDeleted => 'Indítóképernyő eltávolítva';

  @override
  String get adminBrandingNoSplash => 'Nincs egyéni indítóképernyő';

  @override
  String get adminPlaybackHwAccel => 'Hardveres gyorsítás';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardveres gyorsítás';

  @override
  String get adminPlaybackEnableHwEncoding => 'Hardveres kódolás engedélyezése';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Hardveres dekódolás engedélyezése:';

  @override
  String get adminPlaybackQsvDevice => 'QSV-eszköz';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Speciális NVDEC dekóder engedélyezése';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'A rendszer saját hardveres dekóderének előnyben részesítése';

  @override
  String get adminPlaybackColorDepth => 'Hardveres dekódolás színmélysége';

  @override
  String get adminPlaybackColorDepth10Hevc => '10 bites HEVC dekódolás';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10 bites VP9 dekódolás';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10 bites dekódolás';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12 bites dekódolás';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardveres kódolás';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC kódolás engedélyezése';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 kódolás engedélyezése';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Alacsony fogyasztású Intel H.264 kódoló engedélyezése';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Alacsony fogyasztású Intel HEVC kódoló engedélyezése';

  @override
  String get adminPlaybackToneMapping => 'Tónusleképezés';

  @override
  String get adminPlaybackEnableTonemapping => 'Tónusleképezés engedélyezése';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'VPP tónusleképezés engedélyezése';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox tónusleképezés engedélyezése';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Tónusleképezési algoritmus';

  @override
  String get adminPlaybackTonemappingMode => 'Tónusleképezési mód';

  @override
  String get adminPlaybackTonemappingRange => 'Tónusleképezési tartomány';

  @override
  String get adminPlaybackTonemappingDesat => 'Tónusleképezési deszaturáció';

  @override
  String get adminPlaybackTonemappingPeak => 'Tónusleképezési csúcsérték';

  @override
  String get adminPlaybackTonemappingParam => 'Tónusleképezési paraméter';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP-tónusleképezés fényereje';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP-tónusleképezés kontrasztja';

  @override
  String get adminPlaybackPresetsQuality => 'Előbeállítások és minőség';

  @override
  String get adminPlaybackEncoderPreset => 'Kódoló előbeállítása';

  @override
  String get adminPlaybackH264Crf => 'H.264 kódolás CRF értéke';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) kódolás CRF értéke';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deinterlace-eljárás';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Képsebesség duplázása váltottsorosság megszüntetésekor';

  @override
  String get adminPlaybackAudioSection => 'Hang';

  @override
  String get adminPlaybackEnableAudioVbr =>
      'Változó bitsebességű (VBR) hangkódolás engedélyezése';

  @override
  String get adminPlaybackDownmixBoost => 'Hanglekeverés erősítése';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Sztereó lekeverési algoritmus';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Maximális muxolási sor mérete';

  @override
  String get adminPlaybackAutoOption => 'Automatikus';

  @override
  String get adminPlaybackEncoding => 'Kódolás';

  @override
  String get adminPlaybackEncodingThreads => 'Kódolási szálak';

  @override
  String get adminPlaybackFallbackFont => 'Tartalék betűtípus engedélyezése';

  @override
  String get adminPlaybackFallbackFontPath => 'Tartalék betűtípus elérési útja';

  @override
  String get adminPlaybackStreaming => 'Streamelés';

  @override
  String get adminResumeVideo => 'Videó';

  @override
  String get adminResumeAudiobooks => 'Hangoskönyvek';

  @override
  String get adminResumeMinAudiobookPct =>
      'A hangoskönyv-folytatás minimális százaléka';

  @override
  String get adminResumeMaxAudiobookPct =>
      'A hangoskönyv-folytatás maximális százaléka';

  @override
  String get adminStreamingBitrateLimit =>
      'Távoli kliens bitsebesség-korlátja (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Hagyd üresen, vagy adj meg 0-t a korlátlanhoz';

  @override
  String get adminTrickplayHwAccel => 'Hardveres gyorsítás engedélyezése';

  @override
  String get adminTrickplayHwEncoding => 'Hardveres kódolás engedélyezése';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Csak kulcskockák kinyerésének engedélyezése';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Gyorsabb, de kisebb pontosság';

  @override
  String get adminTrickplayNonBlocking => 'Nem blokkoló';

  @override
  String get adminTrickplayBlocking => 'Blokkoló';

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
      'Alacsonyabb értékek = jobb minőség, nagyobb fájlok';

  @override
  String get adminTrickplayJpegQuality => 'JPEG-minőség';

  @override
  String get adminTrickplayProcessing => 'Feldolgozás';

  @override
  String get adminTasksEmpty => 'Nem található ütemezett feladat';

  @override
  String get adminTasksNoFilterMatch =>
      'Egyetlen feladat sem felel meg az aktuális szűrőnek';

  @override
  String get adminTaskCancelling => 'Megszakítás...';

  @override
  String get adminTaskRunning => 'Fut...';

  @override
  String get adminTaskNeverRun => 'Soha nem futott';

  @override
  String get adminTaskStop => 'Leállítás';

  @override
  String get adminRunningTasks => 'Futó feladatok';

  @override
  String get adminTaskRun => 'Futtatás';

  @override
  String get adminTaskDetailLastExecution => 'Legutóbbi futtatás';

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
    return 'Naponta $time-kor';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Minden $day $time-kor';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Minden $duration';
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
      other: '$count óra',
      one: '1 óra',
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
  String get adminActivityLastHour => 'Elmúlt óra';

  @override
  String get adminActivityToday => 'Ma';

  @override
  String get adminActivityYesterday => 'Tegnap';

  @override
  String get adminActivityOlder => 'Régebbi';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days napja';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours órája';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes perce';
  }

  @override
  String get adminActivityNow => 'most';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes p';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours ó';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days n';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month. $day.';
  }

  @override
  String get adminTrickplayDescription =>
      'Állítsd be a gyorstekerési (trickplay) képek generálását az előnézeti képekhez.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Nyilvános HTTPS-port';

  @override
  String get adminNetworkingBaseUrl => 'Alap URL';

  @override
  String get adminNetworkingBaseUrlHint => 'például /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Nyilvános HTTP-port';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS megkövetelése';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Minden távoli kérést irányíts át HTTPS-re. Nincs hatása, ha a szervernek nincs érvényes tanúsítványa.';

  @override
  String get adminNetworkingCertPassword => 'Tanúsítvány jelszava';

  @override
  String get adminNetworkingIpSettings => 'IP-beállítások';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 engedélyezése';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 engedélyezése';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Automatikus portleképzés engedélyezése';

  @override
  String get adminNetworkingLocalSubnets => 'Helyi hálózatok (LAN)';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Helyi hálózatnak tekintett IP-címek vagy CIDR-alhálózatok vesszővel vagy új sorral elválasztott listája.';

  @override
  String get adminNetworkingPublishedUris => 'Közzétett szerver-URI-k';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Alhálózat vagy cím hozzárendelése egy közzétett URL-hez, pl. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Tanúsítvány elérési útja';

  @override
  String get adminNetworkingRemoteIpFilter => 'Távoli IP-szűrő';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Távoli IP-szűrő';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API eszköz';

  @override
  String get adminPlaybackAutomatic => '0 = automatikus';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Átkódolás ideiglenes elérési útja';

  @override
  String get adminPlaybackSegmentDeletion =>
      'Szegmensek törlésének engedélyezése';

  @override
  String get adminPlaybackSegmentKeep => 'Szegmensek megőrzése (másodperc)';

  @override
  String get adminPlaybackThrottleBuffering => 'Pufferelés korlátozása';

  @override
  String get adminPlaybackThrottleDelay =>
      'Visszafogási késleltetés (másodperc)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Feliratok menet közbeni kinyerésének engedélyezése';

  @override
  String get adminResumeMinPct => 'Minimális folytatási százalék';

  @override
  String get adminResumeMinPctSubtitle =>
      'A haladás mentéséhez a tartalmat ezen a százalékon túl kell lejátszani';

  @override
  String get adminResumeMaxPct => 'Maximális folytatási százalék';

  @override
  String get adminResumeMaxPctSubtitle =>
      'A tartalom e százalék után teljesen lejátszottnak minősül';

  @override
  String get adminResumeMinDuration =>
      'Folytatás minimális időtartama (másodperc)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Az ennél rövidebb elemek lejátszása nem folytatható';

  @override
  String get adminTrickplayScanBehavior => 'Szkennelési viselkedés';

  @override
  String get adminTrickplayProcessPriority => 'Folyamat prioritása';

  @override
  String get adminTrickplayTileWidth => 'Csempe szélessége';

  @override
  String get adminTrickplayTileHeight => 'Csempe magassága';

  @override
  String get adminTrickplayProcessThreads => 'Feldolgozási szálak';

  @override
  String get adminTrickplayWidthResolutions => 'Szélességi felbontások';

  @override
  String get adminMetadataDefault => 'Alapértelmezett';

  @override
  String get adminMetadataContentTypeUpdated => 'Tartalomtípus frissítve';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Nem sikerült frissíteni a tartalomtípust: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Lassú válaszküszöb (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Lassú válaszokra vonatkozó figyelmeztetések engedélyezése';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect engedélyezése';

  @override
  String get adminGeneralSectionServer => 'Szerver';

  @override
  String get adminGeneralSectionMetadata => 'Metaadatok';

  @override
  String get adminGeneralSectionPaths => 'Útvonalak';

  @override
  String get adminGeneralSectionPerformance => 'Teljesítmény';

  @override
  String get adminGeneralCachePath => 'Gyorsítótár elérési útja';

  @override
  String get adminGeneralMetadataPath => 'Metaadatok elérési útja';

  @override
  String get adminGeneralServerName => 'Szerver neve';

  @override
  String get adminGeneralDisplayLanguage =>
      'Előnyben részesített megjelenítési nyelv';

  @override
  String get adminSettingsLoadFailed =>
      'Nem sikerült betölteni a beállításokat';

  @override
  String get adminDiscover => 'Felfedezés';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Nem sikerült frissíteni a leképezéseket: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Időkorlát: $duration';
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
      'A szinkronizált lejátszás használatához engedélyezd a SyncPlay-t a Beállításokban.';

  @override
  String get syncPlayServerUnsupportedTitle => 'A szerver nem támogatott';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'A SyncPlay Jellyfin-szervert igényel. A jelenlegi szerver nem támogatja.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay-csoport';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay-csoport';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# résztvevő',
      one: '# résztvevő',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Várakozás figyelmen kívül hagyása';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Ne tartsd fel a csoportot, amíg ez az eszköz pufferel';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Folytasd helyben, anélkül, hogy a lassú tagokra várnál';

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
      'Cseréld le a csoport lejátszási sorát a helyben lejátszottra';

  @override
  String get syncPlayLeaveGroup => 'Csoport elhagyása';

  @override
  String get syncPlayGroupQueue => 'Csoportos lejátszási sor';

  @override
  String syncPlayQueueItemFallback(int index) {
    return '$index. elem';
  }

  @override
  String get syncPlayPlayNow => 'Lejátszás most';

  @override
  String get syncPlayCreateNewGroup => 'Új csoport létrehozása';

  @override
  String get syncPlayGroupName => 'Csoport neve';

  @override
  String get syncPlayDefaultGroupName => 'Saját SyncPlay-csoportom';

  @override
  String get syncPlayCreateGroup => 'Csoport létrehozása';

  @override
  String get syncPlayAvailableGroups => 'Elérhető csoportok';

  @override
  String get syncPlayNoGroupsAvailable => 'Nincsenek elérhető csoportok';

  @override
  String get syncPlayJoinGroupQuestion => 'Csatlakozol a SyncPlay-csoporthoz?';

  @override
  String get syncPlayJoinGroupWarning =>
      'A SyncPlay-csoporthoz való csatlakozás lecserélheti a jelenlegi lejátszási sorodat. Folytatod?';

  @override
  String get syncPlayJoin => 'Csatlakozás';

  @override
  String get syncPlayStateIdle => 'Tétlen';

  @override
  String get syncPlayStateWaiting => 'Várakozás';

  @override
  String get syncPlayStatePaused => 'Szüneteltetve';

  @override
  String get syncPlayStatePlaying => 'Lejátszás';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName csatlakozott a SyncPlay-csoporthoz';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName elhagyta a SyncPlay-csoportot';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-hozzáférés megtagadva';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nincs hozzáférésed egy vagy több elemhez ebben a SyncPlay-csoportban. Kérd meg a csoport tulajdonosát, hogy ellenőrizze a könyvtárengedélyeket, vagy válassz másik lejátszási sort.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Lejátszás szinkronizálása a(z) $groupName csoporttal';
  }

  @override
  String get voiceSearchUnavailable => 'A hangalapú keresés nem érhető el.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'A Dolby Vision közvetlen lejátszása nem sikerült';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Nem sikerült elindítani a közvetlen lejátszást ehhez a Dolby Vision-streamhez. Újrapróbálod szerveroldali átkódolással?';

  @override
  String get retryWithTranscode => 'Újrapróbálás átkódolással';

  @override
  String get dolbyVisionNotSupportedTitle => 'A Dolby Vision nem támogatott';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Ez az eszköz nem képes közvetlenül dekódolni a Dolby Vision tartalmakat. Használd a HDR10-tartalékot, vagy kérj szerveroldali átkódolást.';

  @override
  String get rememberMyChoice => 'Választás megjegyzése';

  @override
  String get playHdr10Fallback => 'HDR10-tartalék lejátszása';

  @override
  String get requestTranscode => 'Átkódolás kérése';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# felfedezett sor',
      one: '# felfedezett sor',
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
      'Offline vagy. Csak a letöltött tartalom érhető el.';

  @override
  String get offlineFileNotAvailable => 'A fájl nem érhető el';

  @override
  String get offlineSwitchServer => 'Szerverváltás';

  @override
  String get offlineSavedMedia => 'Mentett média';

  @override
  String get offlineBannerTitle => 'Offline vagy';

  @override
  String get offlineBannerSubtitle => 'A letöltéseid megjelenítése';

  @override
  String get offlineBannerAction => 'Letöltések';

  @override
  String get serverUnreachableBannerTitle => 'A szervered nem érhető el';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Lejátszás a letöltésekből, amíg újra elérhető nem lesz';

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
    return 'Nem sikerült az átküldés vezérlése: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind vezérlők';
  }

  @override
  String get castDeviceVolume => 'Eszköz hangereje';

  @override
  String get castVolumeUnavailable => 'Nem elérhető';

  @override
  String castStopKind(String kind) {
    return '$kind leállítása';
  }

  @override
  String get audioLabel => 'Hang';

  @override
  String get subtitlesLabel => 'Feliratok';

  @override
  String get pinConfirmTitle => 'Erősítsd meg a PIN-kódot';

  @override
  String get pinSetTitle => 'PIN-kód beállítása';

  @override
  String get pinEnterTitle => 'Írd be a PIN-kódot';

  @override
  String get pinReenterToConfirm => 'A megerősítéshez add meg újra a PIN-kódot';

  @override
  String pinEnterNDigit(int length) {
    return 'Adj meg egy $length jegyű PIN-kódot';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Add meg a(z) $length jegyű PIN-kódodat';
  }

  @override
  String get pinIncorrect => 'Helytelen PIN-kód';

  @override
  String get pinMismatch => 'A PIN-kódok nem egyeznek';

  @override
  String get pinForgot => 'Elfelejtetted a PIN-kódot?';

  @override
  String get pinClear => 'Törlés';

  @override
  String get pinBackspace => 'Visszatörlés';

  @override
  String get quickConnectAuthorized => 'A Quick Connect-kérés jóváhagyva.';

  @override
  String get quickConnectInvalidOrExpired =>
      'A Quick Connect-kód érvénytelen vagy lejárt.';

  @override
  String get quickConnectNotSupported =>
      'A Quick Connect nem támogatott ezen a szerveren.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Nem sikerült jóváhagyni a Quick Connect-kódot.';

  @override
  String get quickConnectDisabled =>
      'A Quick Connect le van tiltva ezen a szerveren.';

  @override
  String get quickConnectForbidden =>
      'A fiókod nem tudja jóváhagyni ezt a Quick Connect-kérést.';

  @override
  String get quickConnectNotFound =>
      'A Quick Connect-kód nem található. Próbálj ki egy új kódot.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'A Quick Connect sikertelen: $message';
  }

  @override
  String get quickConnectEnterCode => 'Írd be a kódot';

  @override
  String get quickConnectAuthorize => 'Jóváhagyás';

  @override
  String remoteCommandFailed(String error) {
    return 'Nem sikerült a parancs: $error';
  }

  @override
  String get remoteControlTitle => 'Távirányító';

  @override
  String get remoteFailedToLoadSessions =>
      'Nem sikerült betölteni a munkameneteket';

  @override
  String get remoteNoSessions => 'Nincsenek vezérelhető munkamenetek';

  @override
  String get remoteStartPlayback => 'Lejátszás indítása egy másik eszközön';

  @override
  String get unknownUser => 'Ismeretlen';

  @override
  String get unknownItem => 'Ismeretlen';

  @override
  String get remoteNothingPlaying => 'Nincs lejátszás ezen a munkameneten';

  @override
  String get castingStarted =>
      'Az átküldés megkezdődött a kiválasztott eszközön';

  @override
  String castingFailed(String error) {
    return 'Nem sikerült elindítani az átküldést: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nem állnak rendelkezésre távoli lejátszóeszközök.';

  @override
  String get noRemoteDevicesIos =>
      'Nem állnak rendelkezésre távoli lejátszóeszközök.\n\niOS rendszeren előfordulhat, hogy az AirPlay-célpontok nem érhetők el a szimulátorban.';

  @override
  String get trackActionPlayNext => 'Lejátszás következőként';

  @override
  String get trackActionAddToQueue => 'Hozzáadás a lejátszási sorhoz';

  @override
  String get trackActionAddToPlaylist => 'Lejátszási listához adás';

  @override
  String get trackActionCancelDownload => 'Letöltés megszakítása';

  @override
  String get trackActionDeleteFromPlaylist =>
      'Eltávolítás a lejátszási listáról';

  @override
  String get trackActionMoveUp => 'Mozgatás fel';

  @override
  String get trackActionMoveDown => 'Mozgatás le';

  @override
  String get trackActionRemoveFromFavorites => 'Eltávolítás a kedvencekből';

  @override
  String get trackActionAddToFavorites => 'Hozzáadás a kedvencekhez';

  @override
  String get trackActionGoToAlbum => 'Ugrás az albumhoz';

  @override
  String get trackActionGoToArtist => 'Ugrás az előadóhoz';

  @override
  String trackActionDownloading(String name) {
    return '$name letöltése...';
  }

  @override
  String get trackActionDeletedFile => 'A letöltött fájl törölve';

  @override
  String get trackActionDeleteFileFailed =>
      'Nem sikerült törölni a letöltött fájlt';

  @override
  String get shuffleBy => 'Keverés alapja';

  @override
  String get shuffleSelectLibrary => 'Könyvtár kiválasztása';

  @override
  String get shuffleSelectGenre => 'Műfaj kiválasztása';

  @override
  String get shuffleLibrary => 'Könyvtár';

  @override
  String get shuffleGenre => 'Műfaj';

  @override
  String get shuffleNoLibraries =>
      'Nem állnak rendelkezésre kompatibilis könyvtárak.';

  @override
  String get shuffleNoGenres =>
      'Nem találhatók műfajok ehhez a keverési módhoz.';

  @override
  String get posterDisplayTitle => 'Megjelenítés';

  @override
  String get posterImageType => 'Képtípus';

  @override
  String get imageTypePoster => 'Poszter';

  @override
  String get imageTypeThumbnail => 'Miniatűr';

  @override
  String get imageTypeBanner => 'Bannerkép';

  @override
  String get playlistAddFailed =>
      'Nem sikerült hozzáadni a lejátszási listához';

  @override
  String get playlistCreateFailed =>
      'Nem sikerült létrehozni a lejátszási listát';

  @override
  String get playlistNew => 'Új lejátszási lista';

  @override
  String get playlistCreate => 'Létrehozás';

  @override
  String get playlistCreateNew => 'Új lejátszási lista létrehozása';

  @override
  String get playlistNoneFound => 'Nem található lejátszási lista';

  @override
  String get addToPlaylist => 'Lejátszási listához adás';

  @override
  String get lyricsNotAvailable => 'Nincs elérhető dalszöveg';

  @override
  String get upNext => 'Következő';

  @override
  String get playNext => 'Lejátszás következőként';

  @override
  String get stillWatchingContent => 'A lejátszás szünetel. Még mindig nézed?';

  @override
  String get stillWatchingStop => 'Leállítás';

  @override
  String get stillWatchingContinue => 'Folytatás';

  @override
  String skipSegment(String segment) {
    return '$segment kihagyása';
  }

  @override
  String get liveTv => 'Élő TV';

  @override
  String get continueWatchingAndNextUp => 'Megtekintés folytatása és következő';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$current/$total letöltése — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName letöltése';
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
  String get playerTooltipEnterFullscreen => 'Belépés teljes képernyőre';

  @override
  String get playerTooltipExitFullscreen => 'Kilépés teljes képernyőből';

  @override
  String get playerTooltipFloatOnTop => 'Lebegtetés felül';

  @override
  String get playerTooltipExitFloatOnTop => 'Lebegtetés felül kikapcsolása';

  @override
  String get playerTooltipLockLandscape => 'Fekvő tájolás rögzítése';

  @override
  String get playerTooltipUnlockOrientation => 'Forgatás engedélyezése';

  @override
  String get playerTooltipPrevious => 'Előző';

  @override
  String get playerTooltipSeekBack => 'Visszatekerés';

  @override
  String get playerTooltipSeekForward => 'Előretekerés';

  @override
  String get contextMenuMarkWatched => 'Megjelölés megtekintettként';

  @override
  String get contextMenuMarkUnwatched => 'Megjelölés megtekintetlenként';

  @override
  String get contextMenuAddToFavorites => 'Hozzáadás a kedvencekhez';

  @override
  String get contextMenuRemoveFromFavorites => 'Eltávolítás a kedvencek közül';

  @override
  String get contextMenuGoToSeries => 'Ugrás a sorozathoz';

  @override
  String get contextMenuHideFromContinueWatching => 'Elrejtés a Folytatásból';

  @override
  String get contextMenuHideFromNextUp => 'Elrejtés a Következőből';

  @override
  String get contextMenuAddToCollection => 'Hozzáadás gyűjteményhez';

  @override
  String get settingsAdministrationSubtitle =>
      'A szerveradminisztrációs panel megnyitása';

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
      'Az alkalmazás verziója, jogi információk és közreműködők';

  @override
  String get settingsAuthenticationSection => 'HITELESÍTÉS';

  @override
  String get settingsSortServersBy => 'Szerverek rendezése szerint';

  @override
  String get settingsLastUsed => 'Utoljára használt';

  @override
  String get settingsAlphabetical => 'Betűrendes';

  @override
  String get settingsConnectionSection => 'KAPCSOLAT';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Önaláírt tanúsítványok engedélyezése';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Bízz meg az önaláírt vagy privát hitelesítésszolgáltatótól (CA) származó TLS-tanúsítványokat használó szerverekben. Csak az általad felügyelt szervereknél engedélyezd. Ez letiltja a tanúsítványok ellenőrzését minden kapcsolatnál.';

  @override
  String get settingsPrivacyAndSafetySection => 'ADATVÉDELEM ÉS BIZTONSÁG';

  @override
  String get settingsBlockedRatings => 'Blokkolt értékelések';

  @override
  String get settingsGeneralStyle => 'Általános stílus';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Témaszínek, hátterek, megtekintettség-jelzők és témazene';

  @override
  String get settingsDetailsScreen => 'Részletképernyő';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Stílus, háttérelmosás és lapok viselkedése';

  @override
  String get settingsHomePage => 'Kezdőképernyő';

  @override
  String get settingsHomePageSubtitle =>
      'Szakaszok, képtípusok, fedvények és média-előnézetek';

  @override
  String get settingsLibrariesSubtitle =>
      'Könyvtár láthatósága, mappanézet és többszerveres viselkedés';

  @override
  String get settingsTwentyFourHourClock => '24 órás formátum';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      '24 órás időformátum használata, ahol az óra látható';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Keverés gomb megjelenítése a navigációs sávban';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Műfajok gomb megjelenítése a navigációs sávban';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Kedvencek gomb megjelenítése a navigációs sávban';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Könyvtárak gomb megjelenítése a navigációs sávban';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Seerr gomb megjelenítése a navigációs sávban';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Mindig jelenjenek meg a szöveges címkék a felső navigációs sávban';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'A kezdőlap láthatóságának váltása könyvtáronként. Indítsd újra a Moonfin alkalmazást, hogy a változtatások életbe lépjenek.';

  @override
  String get settingsMediaBarAndLocalPreviews => 'Médiasáv és helyi előnézetek';

  @override
  String get settingsVisualOverlays => 'Vizuális fedvények';

  @override
  String get settingsSeasonalSurprise => 'Szezonális meglepetés';

  @override
  String get settingsMetadataAndRatings => 'Metaadatok és értékelések';

  @override
  String get settingsPluginScreenDescription =>
      'A Moonbase a szerveroldali integrációkat segíti elő, beleértve a további értékelési forrásokat, a Seerr-kéréseket és a szinkronizált beállításokat.';

  @override
  String get settingsOfflineDownloads => 'Offline letöltések';

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
  String get settingsHigh => 'Magas';

  @override
  String get settingsLow => 'Alacsony';

  @override
  String get settingsCustomPath => 'Egyéni elérési út';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Add meg a letöltési mappa elérési útját';

  @override
  String get settingsConcurrentDownloads => 'Egyidejű letöltések';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Az egyszerre letölthető elemek maximális száma.';

  @override
  String get settingsAppInfo => 'ALKALMAZÁS-INFORMÁCIÓ';

  @override
  String get settingsReportAnIssue => 'Probléma bejelentése';

  @override
  String get settingsReportAnIssueSubtitle =>
      'A GitHub problémakövető megnyitása';

  @override
  String get settingsJoinDiscord => 'Csatlakozz a Discordhoz';

  @override
  String get settingsJoinDiscordSubtitle => 'Csevegés a közösséggel';

  @override
  String get settingsJoinTheDiscord => 'Csatlakozz a Discordhoz';

  @override
  String get settingsSupportMoonfin => 'Moonfin támogatása';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Hívd meg a fejlesztőt egy kávéra';

  @override
  String get settingsLegal => 'JOGI';

  @override
  String get settingsLicenses => 'Licencek';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Nyílt forráskódú licencnyilatkozatok';

  @override
  String get settingsPrivacyPolicy => 'Adatvédelmi szabályzat';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Hogyan kezeli a Moonfin az adataidat';

  @override
  String get settingsCheckForUpdates => 'Frissítések ellenőrzése';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'A legújabb Moonfin kiadás ellenőrzése';

  @override
  String get settingsPoweredByFlutter => 'Flutterrel készült';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# licencnyilatkozat',
      one: '# licencnyilatkozat',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Mindkettő';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Véletlenszerű tartalomtípus-szűrő';

  @override
  String get settingsVideoPlaybackPreferences => 'Videólejátszási beállítások';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Alapvető videómotor és streamelési minőségbeállítások';

  @override
  String get settingsAudioPreferences => 'Hangbeállítások';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Hangsávok, feldolgozás és átengedési lehetőségek';

  @override
  String get settingsAutomationAndQueue => 'Automatizálás és sor';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatikus lejátszás és szekvenálás';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Letöltési minőség, tárhelykorlátok és a letöltési sor mérete';

  @override
  String get settingsSyncplaySubtitle =>
      'Szinkronizálási logika a csoportos munkamenetekhez';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Speciális lejátszófunkciók. Óvatosan használd, mivel egyes beállítások lejátszási problémákat okozhatnak';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Kihagyod a bevezetőket és a stáblistákat?';

  @override
  String get settingsMediaSegmentCountdown => 'Médiaszegmens visszaszámlálása';

  @override
  String get settingsProgressBar => 'Folyamatjelző sáv';

  @override
  String get settingsTimer => 'Időzítő';

  @override
  String get settingsNone => 'Nincs';

  @override
  String get settingsPromptUser => 'Felhasználó megkérdezése';

  @override
  String get settingsSkip => 'Kihagyás';

  @override
  String get settingsDoNothing => 'Nincs művelet';

  @override
  String get settingsMaxBitrateDescription =>
      'A streamelési bitráta korlátozása. A küszöbérték feletti tartalmat a szerver átkódolja, hogy lejátszható legyen.';

  @override
  String get settingsMaxResolutionDescription =>
      'A lejátszó által kért maximális felbontás korlátozása. A nagyobb felbontású tartalom átkódolásra kerül.';

  @override
  String get settingsPlayerZoomDescription =>
      'Hogyan kell a videót a képernyőhöz igazítani.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Lejátszómotor (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Válaszd ki az alapértelmezett lejátszási motort Android TV-eszközökön. A változtatások a következő lejátszási munkamenetre vonatkoznak.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (ajánlott)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (korábbi)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (korábbi)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (ajánlott)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision-tartalék';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'A Dolby Vision-tartalmak lejátszási viselkedése olyan eszközökön, amelyek nem támogatják a Dolby Vision dekódolást.';

  @override
  String get settingsAskEachTime => 'Kérdezd meg minden alkalommal';

  @override
  String get settingsPreferHdr10Fallback =>
      'HDR10-tartalék előnyben részesítése';

  @override
  String get settingsPreferServerTranscode =>
      'Szerveroldali átkódolás előnyben részesítése';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision 7. profil közvetlen lejátszás';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Azt szabályozza, hogy a Dolby Vision 7. profil bővítőrétegű adatfolyamai közvetlenül lejátszhatók-e.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automatikus (AFTKRT engedélyezve)';

  @override
  String get settingsEnabledOnThisDevice => 'Engedélyezve ezen az eszközön';

  @override
  String get settingsDisabledPreferTranscode => 'Letiltva (inkább átkódolás)';

  @override
  String get settingsResumeRewindDescription =>
      'A lejátszás folytatásakor (a „Megtekintés folytatása” szakaszból vagy egy médiaelem oldaláról) hány másodpercet tekerjen vissza a lejátszó?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Hány másodperccel tekerjen vissza a rendszer a szüneteltetés feloldásakor?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Hány másodpercet ugorjon vissza a lejátszó a visszatekerés gomb megnyomása után.';

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
      'Hány másodpercet ugorjon előre a lejátszó a gyors előretekerés gomb megnyomása után.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'AC3-bitfolyam külső dekóderre';

  @override
  String get settingsCinemaMode => 'Mozi mód';

  @override
  String get settingsCinemaModeSubtitle =>
      'Előzetesek és bevezetők lejátszása a főfilm előtt';

  @override
  String get settingsNextUpDisplayDescription =>
      'A „Bővített” egy teljes kártyát jelenít meg az epizód képével és leírásával. A „Minimális” egy kompakt visszaszámláló fedvényt mutat. A „Letiltva” teljesen elrejti a panelt.';

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
  String get settingsOpenGroups => 'Csoportok megnyitása';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay csoport létrehozása, csatlakozás vagy kezelés';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay engedélyezve';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Csoportos megtekintési funkciók engedélyezése';

  @override
  String get settingsSyncplayButton => 'SyncPlay gomb';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'SyncPlay gomb megjelenítése a navigációs sávban';

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
      'A szinkronizáláshoz használd a lejátszási sebesség beállítását';

  @override
  String get settingsSyncplaySkipToSync => 'Ugrás a szinkronizáláshoz';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Használd a tekerést a szinkronizáláshoz';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Minimális sebességkésleltetés';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Maximális sebességkésleltetés';

  @override
  String get settingsSyncplaySpeedDuration => 'Sebesség időtartama';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minimális kihagyási késleltetés';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay extra eltolás';

  @override
  String get onNow => 'Most műsoron';

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
    return 'Legutóbb hozzáadott $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Legutóbb megjelent $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Következő epizód automatikus lejátszása';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'A következő epizód automatikus lejátszása, ha elérhető.';

  @override
  String get skipSilenceTitle => 'Csend átugrása';

  @override
  String get skipSilenceSubtitle =>
      'A csendes hangrészletek automatikus átugrása, ha a stream támogatja.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Külső hangeffektusok engedélyezése';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Hangszínszabályzó és effektusalkalmazások (pl. Wavelet) engedélyezése a Media3 lejátszási munkamenetekhez való kapcsolódásra.';

  @override
  String get disableTunnelingTitle => 'Alagútkezelés letiltása';

  @override
  String get disableTunnelingSubtitle =>
      'Nem alagútkezelt lejátszás kényszerítése. Olyan eszközökön hasznos, ahol az alagútkezelt hang/videó szétesik.';

  @override
  String get enableTunnelingTitle => 'Alagútkezelés engedélyezése';

  @override
  String get enableTunnelingSubtitle =>
      'Speciális. A hangot és a videót egy összekapcsolt hardveres útvonalon keresztül irányítja. Alapértelmezés szerint ki van kapcsolva, mivel egyes eszközökön hang- vagy videókiesést okoz.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision 7-es profil leképezése HEVC-re';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Dolby Vision profile 7 streamek lejátszása HDR10-kompatibilis HEVC-ként a Dolby Visiont nem támogató eszközökön.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Beágyazott feliratstílusok használata';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'A feliratsávba beágyazott színek, betűtípusok és elhelyezések alkalmazása. Tiltsd le, ha inkább a saját feliratstílus-beállításaidat használnád.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Beágyazott felirat-betűméretek használata';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'A feliratsávba beágyazott betűméret-javaslatok alkalmazása. Tiltsd le, ha a saját stílusbeállításaid szerinti feliratméretet használnád.';

  @override
  String get showMediaDetailsOnLibraryPage =>
      'Média részleteinek megjelenítése';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'A kijelölt elem részleteinek megjelenítése a könyvtároldalak tetején.';

  @override
  String get hideBackdropsInLibraries =>
      'Elrejted a háttérképeket böngészés közben?';

  @override
  String get useDetailedSubHeadings => 'Részletes alcímek használata';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Részletes vagy minimális alsó sor megjelenítése a könyvtároldalakon.';

  @override
  String get savedThemesDeleteDialogTitle => 'Mentett téma törlése?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Eltávolítod a(z) „$themeName” témát az eszköz gyorsítótárából?';
  }

  @override
  String get themeStore => 'Témaáruház';

  @override
  String get themeStoreSubtitle => 'Közösségi témák böngészése és mentése';

  @override
  String get themeStoreDescription =>
      'Ments el egy témát, hogy úgy használhasd, mint a többi elmentett témádat.';

  @override
  String get themeStoreEmpty => 'Jelenleg nem érhetők el témák.';

  @override
  String get themeStoreLoadFailed =>
      'Nem sikerült betölteni a témaáruházat. Ellenőrizd a kapcsolatot, és próbáld újra.';

  @override
  String get themeStoreSave => 'Mentés';

  @override
  String get themeStoreSaveAndApply => 'Mentés és alkalmazás';

  @override
  String get themeStoreSaved => 'Mentve';

  @override
  String get themeStoreInvalidMessage => 'Nem sikerült betölteni ezt a témát.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '„$themeName” mentve.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'A(z) „$themeName” törölve erről az eszközről.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Nem sikerült törölni a(z) „$themeName” témát.';
  }

  @override
  String get savedThemesTitle => 'Mentett témák';

  @override
  String get savedThemesDescription =>
      'Ezek a jelenlegi szerverhez a Moonfin beépülő modulból letöltött témák. A törlés csak ezt a helyi másolatot távolítja el.';

  @override
  String get savedThemesEmpty =>
      'Nem találhatók mentett témák ehhez a szerverhez.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Jelenleg aktív';
  }

  @override
  String get savedThemesDeleteTooltip => 'Mentett téma törlése';

  @override
  String get savedThemesManageSubtitle =>
      'A letöltött beépülőmodul-témák kezelése ezen az eszközön';

  @override
  String get themeEditor => 'Témaszerkesztő';

  @override
  String get themeEditorSubtitle =>
      'Nyisd meg a Moonfin témaszerkesztőt a böngésződben';

  @override
  String get homeScreen => 'Kezdőképernyő';

  @override
  String get bottomBar => 'Alsó sáv';

  @override
  String get homeRowsStyleClassic => 'Klasszikus';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Kezdőképernyő sorai';

  @override
  String get homeRowDisplay => 'Kezdőképernyő sorainak megjelenítése';

  @override
  String get homeRowSections => 'Kezdőképernyő sorainak szakaszai';

  @override
  String get homeRowToggles => 'Kezdőképernyő sorainak kapcsolói';

  @override
  String get homeRowTogglesSubtitle =>
      'Könyvtáralapú kezdőképernyő-kategóriák engedélyezése vagy letiltása';

  @override
  String get homeRowTogglesDescription =>
      'Engedélyezd a következő kapcsolókat a sorok megjelenítéséhez a kezdőképernyő szakaszaiban.';

  @override
  String get rowsType => 'Sor típusa';

  @override
  String get rowsTypeDescription =>
      'A klasszikus megtartja a soronkénti képtípust és az információs fedvényt. A modern állóképről háttérképre váltó sorokat használ.';

  @override
  String get displayFavoritesRows => 'Kedvencek sorainak megjelenítése';

  @override
  String get displayFavoritesRowsSubtitle =>
      'A kedvenc filmek, sorozatok és más kedvenc sorok megjelenítése a kezdőképernyő szakaszaiban.';

  @override
  String get favoritesRowSorting => 'Kedvencek sorainak rendezése';

  @override
  String get favoritesRowSortingDescription =>
      'A kedvencek sorainak rendezése a hozzáadás dátuma, a megjelenés dátuma, ábécérend vagy egyebek szerint.';

  @override
  String get displayCollectionsRows => 'Gyűjtemények sorainak megjelenítése';

  @override
  String get displayCollectionsRowsSubtitle =>
      'A gyűjtemények sorainak megjelenítése a kezdőképernyő szakaszaiban.';

  @override
  String get collectionsRowSorting => 'Gyűjtemények sorainak rendezése';

  @override
  String get collectionsRowSortingDescription =>
      'A gyűjtemények sorainak rendezése a hozzáadás dátuma, a megjelenés dátuma, ábécérend vagy egyebek szerint.';

  @override
  String get displayGenresRows => 'Műfajok sorainak megjelenítése';

  @override
  String get displayGenresRowsSubtitle =>
      'A műfajok sorainak megjelenítése a kezdőképernyő szakaszaiban.';

  @override
  String get genresRowSorting => 'Műfajok sorainak rendezése';

  @override
  String get genresRowSortingDescription =>
      'A műfajok sorainak rendezése a hozzáadás dátuma, a megjelenés dátuma, ábécérend vagy egyebek szerint.';

  @override
  String get genresRowItems => 'Műfajsorok elemei';

  @override
  String get genresRowItemsDescription =>
      'Filmek, sorozatok vagy mindkettő megjelenítése a műfajsorokban.';

  @override
  String get displayPlaylistsRows => 'Lejátszási listák sorainak megjelenítése';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Lejátszási listák sorainak megjelenítése a kezdőképernyő szakaszaiban.';

  @override
  String get playlistsRowSorting => 'Lejátszási listák sorainak rendezése';

  @override
  String get playlistsRowSortingDescription =>
      'Lejátszási listák sorainak rendezése a hozzáadás dátuma, a megjelenés dátuma, ábécérend vagy egyéb szempontok szerint.';

  @override
  String get displayAudioRows => 'Audiósorok megjelenítése';

  @override
  String get displayAudioRowsSubtitle =>
      'Audiósorok megjelenítése a kezdőképernyő szakaszaiban.';

  @override
  String get audioRowsSorting => 'Audiósorok rendezése';

  @override
  String get audioRowsSortingDescription =>
      'Audiósorok rendezése a hozzáadás dátuma, a megjelenés dátuma, ábécérend vagy egyéb szempontok szerint.';

  @override
  String get audioPlaylists => 'Audió lejátszási listák';

  @override
  String get appearance => 'Megjelenés';

  @override
  String get layout => 'Elrendezés';

  @override
  String get theme => 'Téma';

  @override
  String get keyboard => 'Billentyűzet';

  @override
  String get navButtons => 'Gombok';

  @override
  String get rendering => 'Renderelés';

  @override
  String get mpvConfiguration => 'MPV-konfiguráció';

  @override
  String get cardSize => 'Kártyaméret a kezdőképernyő sorain';

  @override
  String get externalPlayerApp => 'Külső lejátszóalkalmazás';

  @override
  String get externalPlayerAppDescription =>
      'Állíts be külső lejátszót a hosszan történő lenyomásra aktiválódó lejátszás opció engedélyezéséhez';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Alkalmazásválasztó megjelenítése a lejátszás indításakor.';

  @override
  String get loadingInstalledPlayers => 'Telepített lejátszók betöltése...';

  @override
  String get connection => 'Kapcsolat';

  @override
  String get audioTranscodeTarget => 'Audió-átkódolás célja';

  @override
  String get passthrough => 'Átengedés';

  @override
  String get supportedOnThisDevice => 'Támogatott ezen az eszközön';

  @override
  String get notSupportedOnThisDevice => 'Nem támogatott ezen az eszközön';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) átengedés';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) bitfolyam külső dekóderre.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD Atmos (JOC) átengedés';

  @override
  String get mediaPlayerBehavior => 'Médialejátszó viselkedése';

  @override
  String get playbackEnhancements => 'Lejátszási fejlesztések';

  @override
  String get alwaysOn => 'Mindig bekapcsolva.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Stáblista kihagyása gomb lecserélése a Következő elem megjelenítésére';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'A Következő elem fedvény megjelenítése a Stáblista kihagyása gomb helyett.';

  @override
  String get playerRouting => 'Lejátszó-útvonalválasztás';

  @override
  String get preferSoftwareDecoders =>
      'Szoftveres dekódolók előnyben részesítése';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Használd az FFmpeg-et (audió) és a libgav1-et (AV1) a hardveres dekódolók előtt. Tiltsd le, ha a HDMI-hangátengedés elromlik.';

  @override
  String get useExternalPlayer => 'Mindig külső lejátszó használata';

  @override
  String get useExternalPlayerSubtitle =>
      'Nyisd meg a videólejátszást a kiválasztott külső alkalmazásban Android TV-n.';

  @override
  String get automaticQueuing => 'Automatikus sorba állítás';

  @override
  String get preferSdhSubtitles => 'SDH feliratok előnyben részesítése';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Sorold előre az SDH/CC feliratsávokat az automatikus kiválasztás során.';

  @override
  String get webDiagnostics => 'Webes diagnosztika';

  @override
  String get webDiagnosticsTitle => 'Moonfin webes diagnosztika';

  @override
  String get webDiagnosticsIntro =>
      'Használd ezt az oldalt a böngésző csatlakozási problémáinak diagnosztizálására (CORS, vegyes tartalom és felderítési beállítások).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Vegyes tartalom miatti hiba észlelve';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight hiba észlelve';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'A Moonfin észlelte, hogy egy HTTPS-oldal próbál hívni egy HTTP-szerver URL-t. A böngészők blokkolják ezt a kérést, mielőtt az elérné a szerveredet.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'A Moonfin böngészőszintű kéréshibát észlelt, amelyet általában a CORS- vagy preflight-fejlécek hiánya okoz a médiaszerveren.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Cél-URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Részletek: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Jelenlegi futtatókörnyezet';

  @override
  String get webDiagnosticsOrigin => 'Eredet';

  @override
  String get webDiagnosticsScheme => 'Séma';

  @override
  String get webDiagnosticsPluginMode => 'Beépülő modul mód';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC-vizsgálat';

  @override
  String get webDiagnosticsForcedServerUrl => 'Kényszerített szerver-URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Alapértelmezett szerver-URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Felderítési proxy-URL';

  @override
  String get notConfigured => 'nincs beállítva';

  @override
  String get webDiagnosticsMixedContent => 'Vegyes tartalom';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ez az oldal HTTPS-en keresztül van betöltve, de egy vagy több beállított URL HTTP-s. A böngészők blokkolják a HTTPS-oldalakról indított HTTP API-hívásokat.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Megoldás: szolgáld ki a médiaszerveredet vagy a proxyvégpontodat HTTPS-en keresztül, vagy a Moonfint csak megbízható helyi hálózatokon töltsd be HTTP-n.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'A jelenlegi futási beállítások alapján nem észlelhető egyértelmű vegyes tartalmú konfiguráció.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS-ellenőrzőlista';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Engedélyezd a böngésző eredetét (origin) az Access-Control-Allow-Origin fejlécben.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Vedd fel az Authorization, X-Emby-Authorization és X-Emby-Token fejléceket az Access-Control-Allow-Headers listába.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Tedd elérhetővé (expose) a Content-Range és Accept-Ranges fejléceket a streameléshez és a tekeréshez.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Adj vissza 204-es kódot az OPTIONS preflight kérésekre.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Példa fejlécrészlet (nginx-stílusú)';

  @override
  String get note => 'Megjegyzés';

  @override
  String get webDiagnosticsNonWebNote =>
      'Ez a diagnosztikai útvonal webes buildekhez készült. Ha ezt egy másik platformon látod, előfordulhat, hogy ezek az ellenőrzések nem érvényesek.';

  @override
  String get backToServerSelect => 'Vissza a szerverválasztáshoz';

  @override
  String get signOutAllUsers => 'Minden felhasználó kijelentkeztetése';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'A mikrofon-hozzáférés véglegesen meg van tagadva. Engedélyezd a rendszerbeállításokban.';

  @override
  String get voiceSearchPermissionRequired =>
      'A hangalapú kereséshez mikrofon-hozzáférés szükséges.';

  @override
  String get voiceSearchNoMatch => 'Nem értettem. Próbáld újra.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nem észlelhető beszéd.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofonhiba.';

  @override
  String get voiceSearchNeedsInternet =>
      'A hangalapú kereséshez internetkapcsolat szükséges.';

  @override
  String get voiceSearchServiceBusy =>
      'A hangalapú szolgáltatás elfoglalt. Próbáld újra.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'A mikrofon-hozzáférés véglegesen meg van tagadva.';

  @override
  String get microphonePermissionDenied =>
      'A mikrofon-hozzáférés meg van tagadva.';

  @override
  String get speechRecognitionUnavailable =>
      'A beszédfelismerés nem érhető el ezen az eszközön.';

  @override
  String get openIosRoutePicker => 'iOS útvonalválasztó megnyitása';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Az AirPlay útvonalválasztó nem érhető el ezen az eszközön.';

  @override
  String get videos => 'Videók';

  @override
  String get programs => 'Programok';

  @override
  String get songs => 'Dalok';

  @override
  String get photoAlbums => 'Fotóalbumok';

  @override
  String get photos => 'Fotók';

  @override
  String get people => 'Személyek';

  @override
  String get recentlyReleasedEpisodes => 'Nemrég megjelent epizódok';

  @override
  String get watchAgain => 'Nézd újra';

  @override
  String get guestAppearances => 'Vendégszereplések';

  @override
  String get appearancesSeerr => 'Szereplések (Seerr)';

  @override
  String get crewContributionsSeerr => 'Stábtag közreműködések (Seerr)';

  @override
  String get watchWithGroup => 'Nézés csoporttal';

  @override
  String get errors => 'Hibák';

  @override
  String get warnings => 'Figyelmeztetések';

  @override
  String get disk => 'Lemez';

  @override
  String get openInBrowser => 'Megnyitás böngészőben';

  @override
  String get embeddedBrowserNotAvailable =>
      'A beágyazott böngésző nem érhető el ezen a platformon.';

  @override
  String get adminRestartServerConfirmation =>
      'Biztosan újra akarod indítani a szervert?';

  @override
  String get adminShutdownServerConfirmation =>
      'Biztosan le akarod állítani a szervert? Manuálisan kell majd újraindítanod.';

  @override
  String get internal => 'Belső';

  @override
  String get idle => 'Tétlen';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nem találhatók felhasználók';

  @override
  String get adminNoUsersMatchSearch =>
      'Nincs a keresésednek megfelelő felhasználó';

  @override
  String get adminNoDevicesFound => 'Nem találhatók eszközök';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nincs a jelenlegi szűrőknek megfelelő eszköz';

  @override
  String get passwordSet => 'Jelszó beállítva';

  @override
  String get noPasswordConfigured => 'Nincs jelszó beállítva';

  @override
  String get remoteAccess => 'Távoli hozzáférés';

  @override
  String get localOnly => 'Csak helyi';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Nem sikerült betölteni a médiaelemzéseket';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Kombinált elemzések az összes médiakönyvtárra vonatkozóan.';

  @override
  String get analyticsTopArtists => 'Legnépszerűbb előadók';

  @override
  String get analyticsTopAuthors => 'Legnépszerűbb szerzők';

  @override
  String get analyticsTopContributors => 'Legaktívabb közreműködők';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count könyvtár',
      one: '1 könyvtár',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Ehhez a kiválasztáshoz még nem érhetők el indexelt médiaösszesítések.';

  @override
  String get analyticsLibraryDetails => 'Könyvtár részletei';

  @override
  String get analyticsLibraryBreakdown => 'Könyvtár részletezése';

  @override
  String get analyticsNoLibrariesAvailable => 'Nem érhetők el könyvtárak.';

  @override
  String get adminServerAdministrationTitle => 'Szerveradminisztráció';

  @override
  String get adminServerPathData => 'Adat';

  @override
  String get adminServerPathImageCache => 'Képgyorsítótár';

  @override
  String get adminServerPathCache => 'Gyorsítótár';

  @override
  String get adminServerPathLogs => 'Naplók';

  @override
  String get adminServerPathMetadata => 'Metaadatok';

  @override
  String get adminServerPathTranscode => 'Átkódolás';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Ez a szerver nem adott vissza szerverútvonalakat.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% használatban';
  }

  @override
  String get userActivity => 'Felhasználói tevékenység';

  @override
  String get systemEvents => 'Rendszeresemények';

  @override
  String get needsAttention => 'Figyelmet igényel';

  @override
  String get adminDrawerSectionServer => 'Szerver';

  @override
  String get adminDrawerSectionPlayback => 'Lejátszás';

  @override
  String get adminDrawerSectionDevices => 'Eszközök';

  @override
  String get adminDrawerSectionAdvanced => 'Speciális';

  @override
  String get adminDrawerSectionPlugins => 'Beépülő modulok';

  @override
  String get adminDrawerSectionLiveTv => 'Élő TV';

  @override
  String get homeVideos => 'Saját videók';

  @override
  String get mixedContent => 'Vegyes tartalom';

  @override
  String get homeVideosAndPhotos => 'Saját videók és fotók';

  @override
  String get mixedMoviesAndShows => 'Vegyes filmek és sorozatok';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nem találhatók felvételek';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Nem találhatók képoldalak a(z) .$extension archívumban.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'A beágyazott renderelő meghibásodott ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Az EPUB renderelő meghibásodott ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Hiányzó helyi fájl az olvasóhoz: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status a könyvadatok megnyitásakor innen: $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nincs elérhető olvasható könyv-végpont';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nem támogatott képregény-archívum formátum: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'A CBR-kicsomagoló beépülő modul nem érhető el ezen a platformon.';

  @override
  String get failedToExtractCbrArchive =>
      'Nem sikerült kicsomagolni a .cbr archívumot.';

  @override
  String get cb7ExtractionUnavailable =>
      'A CB7-kicsomagolás nem érhető el ezen a platformon.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'A CB7-kicsomagoló beépülő modul nem érhető el ezen a platformon.';

  @override
  String get closeGenrePanel => 'Műfajpanel bezárása';

  @override
  String get loadingShuffle => 'Keverés betöltése...';

  @override
  String get libraryShuffleLabel => 'Könyvtár keverése';

  @override
  String get randomShuffleLabel => 'Véletlenszerű keverés';

  @override
  String get genresShuffleLabel => 'Műfajok keverése';

  @override
  String get autoHdrSwitching => 'Automatikus HDR-váltás';

  @override
  String get autoHdrSwitchingDescription =>
      'Automatikusan engedélyezd a HDR-t HDR-videó lejátszásakor, és állítsd vissza a megjelenítési módot kilépéskor.';

  @override
  String get whenFullscreen => 'Teljes képernyőn';

  @override
  String get changeArtwork => 'Borítókép módosítása';

  @override
  String get missing => 'Hiányzik';

  @override
  String get transcodingLimits => 'Átkódolási korlátok';

  @override
  String get clearAllArtworkButton => 'Törlöd az összes borítóképet?';

  @override
  String get clearAllArtworkWarning =>
      'Biztosan törölni szeretnéd az összes letöltött borítóképet?';

  @override
  String get confirmClear => 'Törlés megerősítése';

  @override
  String confirmClearMessage(String itemType) {
    return 'Biztosan törölni szeretnéd ezt a(z) $itemType elemet?';
  }

  @override
  String get uploadButton => 'Feltöltés?';

  @override
  String get resolutionLabel => 'Felbontás: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Borítóképek megjelenítése csak a felület nyelvén';

  @override
  String get confirmClearAll => 'Összes törlésének megerősítése';

  @override
  String get imageUploadSuccess => 'Kép sikeresen feltöltve!';

  @override
  String imageUploadFailed(String error) {
    return 'Nem sikerült a kép feltöltése: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Nem sikerült a kép beállítása: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Nem sikerült a kép törlése: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Nem sikerült az összes borítókép törlése: $error';
  }

  @override
  String get yes => 'Igen';

  @override
  String get posterCategory => 'Plakát';

  @override
  String get backdropsCategory => 'Háttérképek';

  @override
  String get bannerCategory => 'Bannerkép';

  @override
  String get logoCategory => 'Logó';

  @override
  String get thumbnailCategory => 'Bélyegkép';

  @override
  String get artCategory => 'Illusztráció';

  @override
  String get discArtCategory => 'Lemezkép';

  @override
  String get screenshotCategory => 'Képernyőkép';

  @override
  String get boxCoverCategory => 'Dobozborító';

  @override
  String get boxRearCoverCategory => 'Hátoldali dobozborító';

  @override
  String get menuArtCategory => 'Menüháttér';

  @override
  String get confirmItemPoster => 'plakát';

  @override
  String get confirmItemBackdrop => 'háttérkép';

  @override
  String get confirmItemBanner => 'bannerkép';

  @override
  String get confirmItemLogo => 'logó';

  @override
  String get confirmItemThumbnail => 'bélyegkép';

  @override
  String get confirmItemArt => 'illusztráció';

  @override
  String get confirmItemDiscArt => 'lemezkép';

  @override
  String get confirmItemScreenshot => 'képernyőkép';

  @override
  String get confirmItemBoxCover => 'dobozborító';

  @override
  String get confirmItemBoxRearCover => 'hátoldali dobozborító';

  @override
  String get confirmItemMenuArt => 'menüháttér';

  @override
  String get resolutionAll => 'Összes';

  @override
  String get resolutionHigh => 'Magas (1080p+)';

  @override
  String get resolutionMedium => 'Közepes (720p)';

  @override
  String get resolutionLow => 'Alacsony (<720p)';

  @override
  String get sources => 'Források';

  @override
  String get audiobookChapters => 'Fejezetek';

  @override
  String get audiobookBookmarks => 'Könyvjelzők';

  @override
  String get audiobookNotes => 'Jegyzetek';

  @override
  String get audiobookQueue => 'Sor';

  @override
  String get audiobookTimeline => 'Idővonal';

  @override
  String get audiobookTimelineEmpty => 'Az idővonal üres';

  @override
  String get audiobookWholeBook => 'Teljes könyv';

  @override
  String get audiobookFocusedTimeline => 'Fókuszált idővonal';

  @override
  String get audiobookExportBookmarks => 'Könyvjelzők exportálása';

  @override
  String get audiobookExportNotes => 'Jegyzetek exportálása';

  @override
  String get audiobookExportAll => 'Összes exportálása';

  @override
  String audiobookExportSuccess(String path) {
    return 'Sikeresen exportálva ide: $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Az exportálás sikertelen: $error';
  }

  @override
  String get audiobookLyrics => 'Dalszöveg';

  @override
  String get audiobookAddBookmark => 'Könyvjelző hozzáadása';

  @override
  String get audiobookAddNote => 'Jegyzet hozzáadása';

  @override
  String get audiobookEditNote => 'Jegyzet szerkesztése';

  @override
  String get audiobookNoteHint => 'Írj jegyzetet ehhez a pillanathoz';

  @override
  String get audiobookSleepTimer => 'Elalváskapcsoló';

  @override
  String get audiobookSleepOff => 'Ki';

  @override
  String get audiobookSleepEndOfChapter => 'Fejezet vége';

  @override
  String get audiobookSleepCustom => 'Egyéni';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining van hátra';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perc',
      one: '1 perc',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Lejátszási sebesség';

  @override
  String get audiobookRemainingTime => 'Hátralévő';

  @override
  String get audiobookElapsedTime => 'Eltelt';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Vissza $seconds mp';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Előre $seconds mp';
  }

  @override
  String get audiobookPreviousChapter => 'Előző fejezet';

  @override
  String get audiobookNextChapter => 'Következő fejezet';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$current / $total. fejezet';
  }

  @override
  String get audiobookNoChapters => 'Nincsenek fejezetek';

  @override
  String get audiobookNoBookmarks => 'Még nincsenek könyvjelzők';

  @override
  String get audiobookNoNotes => 'Még nincsenek jegyzetek';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Könyvjelző hozzáadva itt: $position';
  }

  @override
  String get audiobookSpeedReset => 'Visszaállítás 1.0x-re';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Mentés';

  @override
  String get audiobookCancel => 'Mégse';

  @override
  String get audiobookDelete => 'Törlés';

  @override
  String get subtitlePreferences => 'Feliratbeállítások';

  @override
  String get subtitlePreferencesDescription =>
      'Módosítsd a feliratmódokat, az alapértelmezett nyelveket, a megjelenést és a renderelési opciókat.';

  @override
  String get subtitleRendering => 'Feliratrenderelés';

  @override
  String get displayOptions => 'Megjelenítési beállítások';

  @override
  String get releaseDateAscending => 'Megjelenési dátum (növekvő)';

  @override
  String get releaseDateDescending => 'Megjelenési dátum (csökkenő)';

  @override
  String get groupContributions => 'Közreműködések csoportosítása';

  @override
  String get groupMultipleRoles => 'Több szerepkör csoportosítása';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Figyelmeztetés a könyvtár írási jogosultságára';

  @override
  String get libraryWriteAccessHowToFix => 'Hogyan javíthatod ezt:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Adj írási jogosultságot a Jellyfin szolgáltatásfelhasználónak (pl. jellyfin vagy Docker PUID/PGID) a szerveren lévő médiakönyvtár-mappáidhoz.\n\n2. Vagy lépj a Jellyfin irányítópult -> Könyvtárak lapra, szerkeszd ezt a könyvtárat, és tiltsd le a „Borítóképek mentése a médiamappákba” opciót, hogy a borítóképek a Jellyfin belső adatbázisába kerüljenek.';

  @override
  String get dismiss => 'Elvetés';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'A(z) „$libraryName” könyvtárad úgy van konfigurálva, hogy a borítóképeket közvetlenül a médiamappákba mentse (a „Borítóképek mentése a médiamappákba” opció engedélyezve van). A Jellyfin azonban tesztelte az írási hozzáférést, és nincs jogosultsága fájlokat írni ebbe a mappába:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Úgy tűnik, a Jellyfinnek nem sikerült frissítenie a borítóképeket. A könyvtárad úgy van konfigurálva, hogy a borítóképeket közvetlenül a médiamappákba mentse (a „Borítóképek mentése a médiamappákba” opció engedélyezve van). Ez a hiba általában akkor fordul elő, ha a Jellyfin szerverfolyamatnak nincs jogosultsága fájlokat írni a médiamappáidba.';

  @override
  String get externalLists => 'Külső listák';

  @override
  String get replay => 'Újrajátszás';

  @override
  String get fileInformation => 'Fájlinformációk';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Méret: $size  •  Formátum: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Összes ($count) hangsáv megjelenítése';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Összes ($count) feliratsáv megjelenítése';
  }

  @override
  String get checkingDirectPlay =>
      'Közvetlen lejátszási képesség ellenőrzése...';

  @override
  String get directPlayCapabilityLabel => 'Közvetlen lejátszási képesség: ';

  @override
  String get forced => 'Kényszerített';

  @override
  String get transcodeContainerNotSupported =>
      'A lejátszó nem támogatja a konténerformátumot.';

  @override
  String get transcodeVideoCodecNotSupported => 'A videókodek nem támogatott.';

  @override
  String get transcodeAudioCodecNotSupported => 'A hangkodek nem támogatott.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'A feliratformátum nem támogatott (beégetést igényel).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'A hangprofil nem támogatott.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'A videoprofil nem támogatott.';

  @override
  String get transcodeVideoLevelNotSupported => 'A videószint nem támogatott.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Ez az eszköz nem támogatja a videófelbontást.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'A videó színmélysége nem támogatott.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'A videó képkockasebessége nem támogatott.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'A fájl bitsebessége meghaladja a lejátszó adatfolyam-korlátját.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'A videó bitsebessége meghaladja az adatfolyam-korlátot.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'A hang bitsebessége meghaladja az adatfolyam-korlátot.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'A hangcsatornák száma nem támogatott.';

  @override
  String get sortAlphabetical => 'Betűrendben';

  @override
  String get sortReleaseAscending => 'Megjelenés sorrendje (növekvő)';

  @override
  String get sortReleaseDescending => 'Megjelenés sorrendje (csökkenő)';

  @override
  String get sortCustomDragDrop => 'Egyéni (fogd és vidd)';

  @override
  String get playlistSortOptions => 'Lejátszási lista rendezési opciói';

  @override
  String get resetSort => 'Rendezés visszaállítása';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode újranézése';
  }

  @override
  String get rewatchPlaylist => 'Lejátszási lista újranézése';

  @override
  String get noSubtitlesFound => 'Nem találhatók feliratok.';

  @override
  String get adminControls => 'Adminisztrátori vezérlők';

  @override
  String get impellerRendering => 'Megjelenítő motor (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Az Impeller a Flutter modern GPU-megjelenítője a simább animációkért és a kevesebb akadozásért. Néhány TV-boxon és régebbi GPU-n képhibákat vagy fekete videót okozhat; ha ezeket tapasztalod, kapcsold ki. Az Automatikus a legmegfelelőbb alapértelmezést választja ki az eszközödhöz. Indítsd újra a Moonfint a beállítások érvényesítéséhez.';

  @override
  String get impellerAuto => 'Automatikus';

  @override
  String get impellerOn => 'Be';

  @override
  String get impellerOff => 'Ki';

  @override
  String get impellerRestartTitle => 'Újraindítás szükséges';

  @override
  String get impellerRestartMessage =>
      'A Moonfinnek újra kell indulnia a megjelenítő motor megváltoztatásához. Zárd be most az alkalmazást, majd nyisd meg újra a beállítások érvényesítéséhez.';

  @override
  String get impellerCloseNow => 'Alkalmazás bezárása most';

  @override
  String get adminRefreshLibrary => 'Könyvtár frissítése';

  @override
  String get adminRefreshAllLibraries => 'Összes könyvtár frissítése';

  @override
  String get adminRepoSortDateOldest => 'Hozzáadás dátuma (legrégebbi elöl)';

  @override
  String get adminRepoSortDateNewest => 'Hozzáadás dátuma (legújabb elöl)';

  @override
  String get adminRepoSortNameAsc => 'Betűrendben (A-tól Z-ig)';

  @override
  String get adminRepoSortNameDesc => 'Betűrendben (Z-től A-ig)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Szerveranalitika betöltése... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Forrással megegyező';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 film';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 sorozat';

  @override
  String get imdbMostPopularMovies => 'IMDb legnépszerűbb filmek';

  @override
  String get imdbMostPopularTvShows => 'IMDb legnépszerűbb sorozatok';

  @override
  String get imdbLowestRatedMovies => 'IMDb legalacsonyabb értékelésű filmek';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb legjobb értékelésű angol nyelvű filmek';
}
