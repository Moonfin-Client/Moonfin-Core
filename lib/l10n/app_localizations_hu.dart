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
  String get animeMarkerFiller => 'Filler';

  @override
  String get animeMarkerMixed => 'Vegyes';

  @override
  String get animeMarkerAnimeCanon => 'Anime kánon';

  @override
  String get animeMarkerMangaCanon => 'Manga kánon';

  @override
  String get animeMarkerSubbed => 'Feliratos';

  @override
  String get animeMarkerDubbed => 'Szinkronos';

  @override
  String get animeMarkerSubbedAndDubbed => 'Feliratos/Szinkronos';

  @override
  String get animeMarkerSubbedShort => 'Sub';

  @override
  String get animeMarkerDubbedShort => 'Dub';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Sub/Dub';

  @override
  String get animeMarkerPending => 'Függő';

  @override
  String get animeMarkerRecap => 'Összefoglaló';

  @override
  String get interfaceLanguage => 'Felület nyelve';

  @override
  String get systemLanguageDefault => 'Alapértelmezett';

  @override
  String get signIn => 'Bejelentkezés';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Üres';

  @override
  String connectingToServer(String serverName) {
    return 'Csatlakozás folyamatban: $serverName';
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
  String get waitingForAuthorization => 'Várakozás az engedélyezésre...';

  @override
  String get back => 'Vissza';

  @override
  String get serverUnavailable => 'A szerver nem elérhető';

  @override
  String get loginFailed => 'Nem sikerült bejelentkezni';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

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
      'A Klasszikus az eredeti, középre igazított Moonfin elrendezés. A Modern egy reszponzív, moziszerű elrendezés. A Kiemelt egy tartalomközpontú elrendezés felugró tartalomkártyákkal. Az Újszerű egy teljesképernyős elrendezés, egymás alá rendezett szekciókkal. A Minimalista csak a borítóképet, lejátszási gombot és epizódlistát tartalmaz.';

  @override
  String get detailScreenStyleMoonfin => 'Klasszikus';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get detailScreenStyleSpotlight => 'Kiemelt';

  @override
  String get spotlightMoreActions => 'További lehetőségek';

  @override
  String get spotlightCastCrewStudios => 'Szereplők, stáb és stúdiók';

  @override
  String get spotlightChaptersExtras => 'Fejezetek és további tartalmak';

  @override
  String get spotlightFileDetails => 'Fájl részletek';

  @override
  String get spotlightSimilarRecommendations => 'Hasonló és javaslatok';

  @override
  String get spotlightSeasonsEpisodes => 'Évadok és epizódok';

  @override
  String get spotlightMoreEpisodes => 'További epizódok';

  @override
  String get spotlightFilmography => 'Filmográfia';

  @override
  String get spotlightCollectionsCard => 'Gyűjtemények';

  @override
  String get spotlightPlaylistOrder => 'Lejátszási lista sorrend';

  @override
  String get spotlightMoviesAndShows => 'Filmek & Sorozatok';

  @override
  String get spotlightSimilarSeerr => 'Hasonló (Seerr)';

  @override
  String get spotlightRecommendationsSeerr => 'Ajánlások (Seerr)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count személy',
      one: '1 személy',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tény',
      one: '1 tény',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count címke',
      one: '1 címke',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stúdió',
      one: '1 stúdió',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fejezet',
      one: '1 fejezet',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kiegészítő',
      one: '1 kiegészítő',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count évad',
      one: '1 évad',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count epizód',
      one: '1 epizód',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count film',
      one: '1 film',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sorozat',
      one: '1 sorozat',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sáv',
      one: '1 sáv',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elem',
      one: '1 elem',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count album',
      one: '1 album',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gyűjtemény',
      one: '1 gyűjtemény',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cím',
      one: '1 cím',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Újszerű';

  @override
  String get detailScreenStyleMinimalist => 'Minimalista';

  @override
  String get expandedTabs => 'Kibontott lapok';

  @override
  String get expandedTabsSubtitle =>
      'Lapok tartalmának automatikus megjelenítése a lapok böngészése közben. Kapcsold ki az egyes lapok kézi megnyitásához és bezárásához.';

  @override
  String get showTechnicalDetails => 'Technikai részletek megjelenítése';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Kodek-, felbontás- és stream-információk megjelenítése a banner-összefoglalóban';

  @override
  String get recommendationSystem => 'Ajánlórendszer';

  @override
  String get recommendationSystemSubtitle =>
      'Használd a Moonfin helyi könyvtárhoz készült ajánlóalgoritmusát, a Jellyfin ajánlóalgoritmusát vagy a TMDb online hasonlósági mutatóit. Megjegyzés: Az online ajánlásokhoz Seerr-integráció szükséges.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin ajánlásai';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Ajánlások';

  @override
  String get recommendationSystemTmdb => 'TMDb hasonlóság';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Értékelési limit alkalmazása a Javaslatokra';

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
  String get interfaceLayout => 'Felület elrendezése';

  @override
  String get interfaceLayoutSubtitle =>
      'Írd felül az észlelt elrendezést, ha az eszközt a rendszer hibásan ismeri fel. A módosítások érvénybe lépéséhez indítsd újra a Moonfint.';

  @override
  String get interfaceLayoutAutomatic => 'Automatikus';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Asztali';

  @override
  String get interfaceLayoutPhone => 'Mobil';

  @override
  String get glassQuality => 'Üveghatás minősége';

  @override
  String get oledMode => 'OLED mód';

  @override
  String get oledModeSubtitle =>
      'Mélyebb feketék és élénkebb vizuális megjelenés. OLED kijelzőkhöz ideális.';

  @override
  String get oledModeSubtle => 'Visszafogott';

  @override
  String get oledModeVivid => 'Élénk';

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
  String get performanceMode => 'Teljesítmény';

  @override
  String get performanceModeSubtitle =>
      'Az Automatikus mód az eszköz memóriájához igazítja a működést. Kevés memória esetén kevesebb képet tart betöltve, az előzeteseket pedig állóképként jeleníti meg. A beállítás a következő indításkor lép teljesen érvénybe.';

  @override
  String get performanceModeAuto => 'Automatikus';

  @override
  String get performanceModeStandard => 'Normál';

  @override
  String get performanceModeReduced => 'Csökkentett';

  @override
  String get rendererMode => 'Megjelenítő';

  @override
  String get rendererModeSubtitle =>
      'Az automatikus beállítás az Impellert használja azokon az eszközökön, amelyeken megfelelően működnek a grafikák, mindenhol máshol pedig a Skiát. Ha az animációk vagy videók nem megfelelően jelennek meg, válaszd a Skiát. A módosítás a következő indításkor lép érvénybe.';

  @override
  String get rendererModeAuto => 'Auto';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack =>
      'Kikapcsolva, mert ezen az eszközön a Csökkentett teljesítmény van beállítva';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Alkalmazz egy teljesen egyedi témát, és válts az Apple vagy a Material által ihletett felhasználói felületre.';

  @override
  String get customThemeTitle => 'Egyedi téma';

  @override
  String get customThemeSubtitle =>
      'Az egyedi témák módosítják a Moonfin vizuális elemeit. Válassz egyet a stílusodhoz illő lehetőségek közül.';

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
  String get gamepadNavigation => 'Kontrolleres navigáció';

  @override
  String get gamepadNavigationDescription =>
      'Engedélyezi, hogy a csatlakoztatott kontrollerrel mozgasd a kijelölést és kiválaszd az elemeket';

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
  String get gameOrientation => 'Játék tájolás';

  @override
  String get gameOrientationSubtitle => 'Képernyőtájolás játék közben';

  @override
  String get landscape => 'Fekvő';

  @override
  String get portrait => 'Álló';

  @override
  String get gameEmulatorSettings => 'Emulátor-beállítások';

  @override
  String get gameNoCoreOptions =>
      'Ez a mag nem rendelkezik módosítható beállításokkal.';

  @override
  String get gameHoldToOpenMenu => 'Tartsd lenyomva a menü megnyitásához';

  @override
  String get gameKeepPlaying => 'Játék folytatása';

  @override
  String get gameSaveAndExit => 'Mentés és kilépés';

  @override
  String get gameExitGame => 'Kilépés a játékból';

  @override
  String get gameSavingBeforeExit => 'Mentés…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Mentés nem sikerült. Játék folytatása.';

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
  String get uiScaleGrandparents => 'Óriási';

  @override
  String get uiScaleGreatGrandparents => 'Gigantikus';

  @override
  String get scrollDirection => 'Görgetés iránya';

  @override
  String get scrollDirectionVertical => 'Függőleges';

  @override
  String get scrollDirectionHorizontal => 'Vízszintes';

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
  String get apply => 'Alkalmaz';

  @override
  String get openLink => 'Hivatkozás megnyitása';

  @override
  String get scanWithYourPhone => 'Olvasd be a telefonoddal';

  @override
  String get audiobookGenres => 'Hangoskönyv műfajok';

  @override
  String get scrollLeft => 'Görgess balra';

  @override
  String get scrollRight => 'Görgess jobbra';

  @override
  String get scrollToTop => 'Görgetés a tetejére';

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
  String get latestComics => 'Legutóbbi Képregények';

  @override
  String get comics => 'Képregények';

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
  String get bookFormatComic => 'Képregény';

  @override
  String get noBooksFound => 'Nem található könyv ehhez a szerzőhöz.';

  @override
  String get noBooksFoundDescription =>
      'Ebben a könyvtárban még nincs könyv, hangoskönyv vagy képregény.';

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
  String get additionalParts => 'További részek';

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
  String get castMembers => 'Szereplők';

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
  String get finalizingDownload => 'Befejezés…';

  @override
  String get queuedDownload => 'Várólistán';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Még $count várakozik',
      one: 'Még 1 várakozik',
    );
    return '$_temp0';
  }

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
    return 'A törlés sikertelen volt a következő hiba miatt: $error';
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
  String get searchingSubtitles => 'Feliratok keresése…';

  @override
  String get fetchingSubtitles => 'Feliratok keresése';

  @override
  String get downloadingSubtitle => 'Felirat letöltése…';

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
  String get downloadScopeTitle => 'Letöltés tartalma';

  @override
  String get downloadAllEpisodes => 'Minden epizód';

  @override
  String get downloadUnwatchedEpisodes => 'Összes megtekintetlen epizód';

  @override
  String get downloadAllMovies => 'Minden film';

  @override
  String get downloadUnwatchedMovies => 'Összes megtekintetlen film';

  @override
  String get downloadScopeLoading => 'Elemek betöltése...';

  @override
  String get downloadScopeLoadFailed =>
      'Nem sikerült betölteni a letöltésre váró elemeket';

  @override
  String downloadEstimateTotal(String size) {
    return 'Összesen ~$size';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received / $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return 'Összesen $size';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count ismeretlen';
  }

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
  String get starring => 'Főszerepben';

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
  String get shuffleAll => 'Összes keverése';

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
  String get aiTranslated => 'MI által fordított';

  @override
  String get machineTranslated => 'Gépi fordítás';

  @override
  String get hearingImpaired => 'Hallássérülteknek';

  @override
  String framerateFps(String rate) {
    return 'Képkockasebesség $rate';
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
  String get showMpvStats => 'mpv statisztikák mutatása (Shift+I)';

  @override
  String get hideMpvStats => 'mpv statisztikák elrejtése (Shift+I)';

  @override
  String get keyboardShortcutsTitle => 'Gyorsbillentyűk';

  @override
  String get keyboardShortcutsSubtitle =>
      'Gyorsbillentyű az alkalmazáshoz, videólejátszóhoz és olvasóhoz';

  @override
  String get keyboardShortcutsPlayerHint =>
      'A ? vagy F1 gomb lenyomásával megtekinteheted a listát a lejátszó elhagyása nélkül.';

  @override
  String get keyboardShortcutsSectionApp => 'Mindenhol';

  @override
  String get keyboardShortcutsSectionAppScope => 'Bármely oldalon';

  @override
  String get keyboardShortcutsSectionPlayer => 'Videólejátszó';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'Amikor egy videó megtekintés alatt áll vagy szüneteltetett';

  @override
  String get keyboardShortcutsSectionReader => 'Könyv és képregény olvasó';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'Amikor olvasol egy könyvet vagy képregényt';

  @override
  String get keyNameArrowKeys => 'Nyilak';

  @override
  String get keyNameSpace => 'Szóköz';

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
  String get keyNameScrollWheel => 'Görgetés';

  @override
  String get shortcutMoveFocus => 'Elemek közötti mozgás';

  @override
  String get shortcutActivate => 'Kiválasztott elem megnyitása';

  @override
  String get shortcutGoBack => 'Visszalépés';

  @override
  String get shortcutToggleFullscreen => 'Teljesképernyő be- vagy kikapcsolása';

  @override
  String get shortcutQuit => 'Kilépés a Moonfinből';

  @override
  String get shortcutPlayPause => 'Lejátszás vagy szüneteltetés';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Irányítópanel megjelenítése vagy lejátszás/szüneteltetés ha már látható';

  @override
  String get shortcutSeekBack =>
      'Visszaugrás (hosszan nyomva nagyobb ugrásokkal)';

  @override
  String get shortcutSeekForward =>
      'Előreugrás (hosszan nyomva nagyobb ugrásokkal)';

  @override
  String get shortcutVolumeUp => 'Hangerő fel';

  @override
  String get shortcutVolumeDown => 'Hangerő le';

  @override
  String get shortcutMute => 'Némítás vagy némítás megszüntetése';

  @override
  String get shortcutToggleSubtitles => 'Feliratok be- vagy kikapcsolása';

  @override
  String get shortcutSlower => 'Lelassítás';

  @override
  String get shortcutFaster => 'Felgyorsítás';

  @override
  String get shortcutPlaybackInfo => 'Lejátszási információ megjelenítése';

  @override
  String get shortcutMpvStats => 'mpv statisztikák be- vagy kikapcsolása';

  @override
  String get shortcutRecropBlackBars => 'Fekete sávok eltüntetése';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Teljesképernyő kikapcsolása vagy megállítás, ha teljesképernyős mód aktív';

  @override
  String get shortcutHideControls => 'Hide controls';

  @override
  String get shortcutStopPlayback => 'Lejátszás megállítása';

  @override
  String get shortcutNextItem => 'Következő elem';

  @override
  String get shortcutPreviousItem => 'Előző elem';

  @override
  String get shortcutSkipSegment =>
      'Bevezető vagy stáblista átugrása, ha elérhető';

  @override
  String get shortcutShowShortcuts => 'Mutasd ezt a listát';

  @override
  String get shortcutNextPage => 'Következő oldal';

  @override
  String get shortcutPreviousPage => 'Előző oldal';

  @override
  String get shortcutScrollPage => 'Oldal görgetése (ebookok esetén)';

  @override
  String get shortcutFirstPage => 'Első oldal vagy fejezet kezdete';

  @override
  String get shortcutLastPage => 'Utolsó oldal vagy fejezet vége';

  @override
  String get shortcutZoom => 'Be- vagy kizoomolás (képregények esetén)';

  @override
  String get shortcutResetZoom => 'Zoom visszaállítása (képregények esetén)';

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
  String get videoRenderer => 'Videómegjelenítő';

  @override
  String get videoRendererDescription =>
      'A natív ablak biztosítja a legfolyamatosabb mozgásmegjelenítést, és a HDR-tartalmat módosítás nélkül továbbítja a kijelzőre. Ha problémát tapasztalsz a videólejátszás során, próbálj ki egy másik beállítást.';

  @override
  String get videoRendererNativeWindow => 'Natív ablak (ajánlott)';

  @override
  String get videoRendererNativeHdrOnly =>
      'Natív ablak csak a HDR tartalmaknál';

  @override
  String get videoRendererInApp => 'Alkalmazásbeli (hagyományos)';

  @override
  String get track => 'Sáv';

  @override
  String get channels => 'Csatornák';

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
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

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
  String get guideRepeatBadge => 'Ismétlés';

  @override
  String get guideTimeline => 'Műsorújság idővonala';

  @override
  String failedToLoadGuide(String error) {
    return 'Nem sikerült betölteni a műsorújságot: $error';
  }

  @override
  String get noChannelsFound => 'Nem található csatorna';

  @override
  String get noProgramData => 'Nincs műsoradat';

  @override
  String get liveBadge => 'ÉLŐ';

  @override
  String get liveTvJumpToLive => 'Ugrás az Élőhöz';

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
  String nextSeriesRecording(String dateTime) {
    return 'A sorozat következő felvétele: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'A sorozat felvétele be van ütemezve, de a műsorújságban nem szerepelnek közelgő epizódok';

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
  String get recordCurrentEpisode => 'Epizód felvétele';

  @override
  String get recordCurrentProgram => 'Műsor felvétele';

  @override
  String get cancelCurrentRecording => 'Felvétel visszavonása';

  @override
  String get cancelRecordingAction => 'Felvétel megszakítása';

  @override
  String get programSetToRecord => 'Műsor felvételre beállítva';

  @override
  String get recordingCancelled => 'Felvétel megszakítva';

  @override
  String get unableToCreateRecording => 'Nem sikerült létrehozni a felvételt';

  @override
  String get recordSeries => 'Sorozat felvétele';

  @override
  String get seriesSetToRecord => 'Sorozatfelvétel beütemezve';

  @override
  String get seriesRecordingCancelled => 'Sorozatfelvétel visszavonva';

  @override
  String get unableToCreateSeriesRecording =>
      'Sorozatfelvétel létrehozása nem sikerült';

  @override
  String get watch => 'Megtekintés';

  @override
  String get watchChannelLive => 'Csatorna nézése élőben';

  @override
  String get close => 'Bezárás';

  @override
  String failedToPlayChannel(String name) {
    return 'Nem sikerült lejátszani: $name';
  }

  @override
  String get playbackStreamLost =>
      'A lejátszás leállt, és nem sikerült helyreállítani.';

  @override
  String get playbackVideoUnsupported =>
      'Ez az eszköz nem támogatja ezt a videóformátumot. Próbáld meg külső lejátszóval.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Újracsatlakozás... ($attempt of $total)';
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
  String get savedMedia => 'Letöltések';

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
  String get activeDownloads => 'Aktív letöltések';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elem',
      one: '1 elem',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return 'Felhasználva: $used / $limit';
  }

  @override
  String get savedMediaSelectItems => 'Elemek kiválasztása';

  @override
  String get savedMediaNoDownloads => 'Még nincs mentett elem';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Az elindított letöltések itt jelennek meg, és internetkapcsolat nélkül is lejátszhatók.';

  @override
  String get savedMediaNoActiveDownloads => 'Jelenleg nincs letöltés';

  @override
  String get savedMediaNoResults => 'Nincs a keresésnek megfelelő letöltés';

  @override
  String get savedMediaPlayFromStart => 'Lejátszás az elejétől';

  @override
  String get savedMediaGoToDetails => 'Részletek megjelenítése';

  @override
  String get savedMediaDeleteDownload => 'Letöltés törlése';

  @override
  String savedMediaDeleteSeason(String season) {
    return '$season törlése';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count epizód törlése',
      one: '1 epizód törlése',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Sorozat megnyitása';

  @override
  String get savedMediaPlayNextUnwatched =>
      'Következő megtekintetlen epizód lejátszása';

  @override
  String get savedMediaRead => 'Olvasás';

  @override
  String get savedMediaCancelDownload => 'Letöltés visszavonása';

  @override
  String get sortBySize => 'Méret';

  @override
  String get sortByName => 'Név';

  @override
  String get sortByDateAdded => 'Hozzáadás dátuma';

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
  String get settingsSearchHint => 'Keresés a beállításokban';

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
  String get mixedRowsOnly => 'Csak vegyes sorok';

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
  String get loadingAnimation => 'Betöltési animáció';

  @override
  String get loadingAnimationDescription =>
      'A Moonfin alkalmazásban használt betöltési animációk testreszabása';

  @override
  String get loadingAnimationConfiguration => 'Betöltési animáció beállítások';

  @override
  String get loadingAnimationImage => 'Kép';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Moonfin logo';

  @override
  String get loadingAnimationImageSpinner => 'Forgó betöltésjelző';

  @override
  String get loadingAnimationImageRunner => 'Futó';

  @override
  String get loadingAnimationImageMoonPhases => 'Holdfázisok';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Moonfin fázisok';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Neonfin fázisok';

  @override
  String get loadingAnimationSize => 'Animáció mérete';

  @override
  String get loadingAnimationSizeThumbnail => 'Bélyegkép';

  @override
  String get loadingAnimationSizeSmall => 'Kicsi';

  @override
  String get loadingAnimationSizeMedium => 'Közepes';

  @override
  String get loadingAnimationSizeLarge => 'Nagy';

  @override
  String get loadingAnimationPosition => 'Animáció elhelyezkedése';

  @override
  String get loadingAnimationPositionTopLeft => 'Bal felül';

  @override
  String get loadingAnimationPositionTopCenter => 'Középen felül';

  @override
  String get loadingAnimationPositionTopRight => 'Jobb felül';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Bal középen';

  @override
  String get loadingAnimationPositionMiddle => 'Középen';

  @override
  String get loadingAnimationPositionMiddleRight => 'Jobb középen';

  @override
  String get loadingAnimationPositionBottomLeft => 'Bal alul';

  @override
  String get loadingAnimationPositionBottomCenter => 'Középen alul';

  @override
  String get loadingAnimationPositionBottomRight => 'Jobb alul';

  @override
  String get loadingAnimationPositionBouncing => 'Ugráló DVD';

  @override
  String get loadingAnimationSpeed => 'Animáció sebessége';

  @override
  String get loadingAnimationSpeedSlow => 'Lassú';

  @override
  String get loadingAnimationSpeedModerate => 'Mérsékelt';

  @override
  String get loadingAnimationSpeedFast => 'Gyors';

  @override
  String get loadingAnimationSpeedUltra => 'Nagyon gyors';

  @override
  String get showLoadingAnimationText => 'Szöveg megjelenítése';

  @override
  String get loadingAnimationPreview => 'Előnézet';

  @override
  String get snow => 'Hó';

  @override
  String get fireworks => 'Tűzijáték';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Lehulló levelek';

  @override
  String get seasonalChristmas => 'Karácsony';

  @override
  String get seasonalPetals => 'Tavaszi szirmok';

  @override
  String get seasonalFireflies => 'Szentjánosbogarak';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Mennyiség';

  @override
  String get seasonalDensityLight => 'Kevés';

  @override
  String get seasonalDensityNormal => 'Normál';

  @override
  String get seasonalDensityHeavy => 'Sok';

  @override
  String get seasonalFollower => 'Focus Follower';

  @override
  String get seasonalFollowerDescription =>
      'A holiday piece, like Halloween\'s planchette, follows what you select on Home';

  @override
  String get seasonalFollowerPointerDescription =>
      'A holiday piece, like Halloween\'s planchette, replaces the mouse pointer on Home';

  @override
  String get seasonalRow => 'Ünnepi sor';

  @override
  String get seasonalRowDescription =>
      'Ünnepi filmek megjelenítése egy sorban a médiatáradból, kiegészítve a Seerr ajánlásaival, ha elérhetők.';

  @override
  String get seasonalRowSubtitle => 'Ünnepi';

  @override
  String get seasonalRowCountry => 'Ország';

  @override
  String get seasonalRowCountryAuto => 'Auto';

  @override
  String get countryUnitedStates => 'Egyesült Államok';

  @override
  String get countryCanada => 'Kanada';

  @override
  String get seasonalRowCountryOther => 'Egyéb';

  @override
  String get seasonalRowHolidays => 'Ünnepek';

  @override
  String get seasonalRowHolidaysHint =>
      'Vedd ki a pipát az ünnep mellől a hozzá tartozó sor elrejtéséhez.';

  @override
  String get holidayNewYear => 'Újév';

  @override
  String get holidayValentines => 'Valentin nap';

  @override
  String get holidayEaster => 'Húsvét';

  @override
  String get holidayPride => 'Pride';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Hálaadás';

  @override
  String get holidayChristmas => 'Karácsonyi filmek';

  @override
  String get holidayLunarNewYear => 'Holdújév';

  @override
  String get holidayDiwali => 'Diváli';

  @override
  String get themeMusic => 'Témazene';

  @override
  String get playThemeMusicOnDetailPages =>
      'Témazene lejátszása a részletező oldalakon';

  @override
  String get themeMusicVolume => 'Témazene hangereje';

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
  String get detailsBackgroundBlur => 'Háttér elmosása';

  @override
  String get detailsBackgroundOpacity => 'Háttér áttetszősége';

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
  String get autoCrop => 'Zoomolás kitöltéshez';

  @override
  String get cropBlackBars => 'Fekete sávok levágása';

  @override
  String get settingsCropBlackBarsDescription =>
      'A lejátszás megkezdése után felismeri és levágja a videóba kódolt fekete sávokat, majd kitölti a képernyőt. A levágás a lejátszó zoomgombjával megismételhető.';

  @override
  String get cropBlackBarsRecropInterval => 'Újravágás időköze';

  @override
  String get cropBlackBarsOnce => 'Indításkor egyszer';

  @override
  String get cropBlackBarsEverySecond => 'Minden másodpercben';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'A képarány változásainak követése lejátszás közben.';

  @override
  String get playerRecroppingBlackBars => 'Fekete sávok újravágása';

  @override
  String get stretch => 'Nyújtás';

  @override
  String get refreshRateSwitching => 'Frissítési gyakoriság váltása';

  @override
  String get disabled => 'Letiltva';

  @override
  String get manual => 'Kézi';

  @override
  String get autoDetect => 'Automatikus felismerés';

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
  String get trickplayDisplayStyleSingle => 'Egyetlen bélyegkép';

  @override
  String get trickplayDisplayStyleStrip => 'Filmszalag';

  @override
  String get trickplayModeFull => 'Teljesképernyő';

  @override
  String get trickplaySettingsPreviewHint =>
      'Húzd el a csúszkát a tekerés előnézetének megtekintéséhez';

  @override
  String get trickplayPreviewScale => 'Előnézet mérete';

  @override
  String get trickplayVerticalOffset => 'Távolság a tekerősávtól';

  @override
  String get trickplayFollowScrubPosition => 'Tekerési pozíció követése';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Az előnézet tekerés közben a tekerősáv mentén mozog, ahelyett, hogy középen maradna';

  @override
  String get trickplayPauseWhileScrubbing =>
      'Lejátszás szüneteltetése tekerés közben';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Tekerés közben a lejátszás szünetel, és a lejátszás gomb megnyomásakor folytatódik. Kapcsold ki ezt a beállítást, ha azt szeretnéd, hogy a lejátszás ne álljon meg, hanem azonnal a kiválasztott pontra ugorjon';

  @override
  String get showDescriptionOnPause => 'Leírás megjelenítése szüneteltetéskor';

  @override
  String get dimVideoShowOverview =>
      'A videó halványítása és az áttekintő szöveg megjelenítése szüneteltetés közben';

  @override
  String get showChapterMarkers => 'Fejezetjelölők';

  @override
  String get showChapterMarkersDescription =>
      'A fejezetek kezdőpontjainak megjelölése a tekerősávon';

  @override
  String get osdLockButton => 'OSD-zárgomb';

  @override
  String get osdLockButtonDescription =>
      'Egy olyan zárgomb megjelenítése, amely hosszan nyomva tartásig blokkolja az érintéses bevitelt.';

  @override
  String get playerSwipeGestures =>
      'Hangerő és fényerő szabályozása ujjmozdulatokkal';

  @override
  String get playerSwipeGesturesDescription =>
      'Húzd az ujjad felfelé vagy lefelé a lejátszó bal oldalán a fényerő, a jobb oldalán pedig a hangerő szabályozásához';

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
  String get osdButtons => 'Lejátszó gombok';

  @override
  String get osdButtonsDescription =>
      'Válaszd ki, mely gombok jelenjenek meg a lejátszóban';

  @override
  String get osdButtonsSectionDescription =>
      'A lejátszásvezérlő gombok mindig láthatók. Az alábbi gombok megjelenítése szabadon beállítható, és minden eszköztípushoz külön beállítások tartoznak.';

  @override
  String get detailButtons => 'Műveletgombok';

  @override
  String get detailButtonsDescription =>
      'A részletképernyőn megjelenő gombok kiválasztása';

  @override
  String get detailButtonsSectionDescription =>
      'A lejátszás gombja mindig az első helyen szerepel, a zárolt gombok pedig mindig láthatók. A többi gomb megjelenítése szabadon beállítható, és minden eszköztípushoz külön beállítások tartoznak.';

  @override
  String get actionButtonsOnScreen => 'Képernyőn megjelenő műveletgombok száma';

  @override
  String get actionButtonsOnScreenDescription =>
      'Beállítható, hogy hány műveletgomb jelenjen meg közvetlenül a képernyőn, mielőtt a többi a „További műveletek” menübe kerülne.';

  @override
  String get actionButtonsOnScreenAuto => 'Auto (Téma alapbeállítás)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (Csak lejátszás)';

  @override
  String get actionButtonsOnScreenAll => 'Mind (Vízszintes görgetés)';

  @override
  String get detailMetadata => 'Metaadat sor';

  @override
  String get detailMetadataDescription =>
      'A részletképernyőn megjelenő metaadatok kiválasztása és sorrendjük módosítása';

  @override
  String get detailMetadataSectionDescription =>
      'A metaadatok megjelenítése ki- és bekapcsolható, valamint a részletképernyőn megjelenő sorrendjük is módosítható. Minden eszköztípushoz külön beállítások tartoznak.';

  @override
  String get detailMetadataYear => 'Megjelenés éve';

  @override
  String get detailMetadataParentalRating => 'Korhatárbesorolás';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Játékidő és évadok';

  @override
  String get detailMetadataStatus => 'Sorozat állapota';

  @override
  String get detailMetadataStatusSubtitle =>
      'Megjeleníti, hogy a sorozat folytatódik, véget ért, vagy új évaddal tér vissza';

  @override
  String get detailMetadataGenres => 'Műfajok';

  @override
  String get detailMetadataSeerrAvailability => 'Seerr elérhetőség';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Megjeleníti a Seerrből származó igénylések állapotát és a médiatartalmak elérhetőségét';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Közelgő epizódok';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'A Sonarr és a TMDB adatai alapján megjeleníti a közelgő megjelenési dátumokat';

  @override
  String get detailSections => 'Szakaszok';

  @override
  String get detailSectionsDescription =>
      'A részletképernyőn megjelenő szakaszok kiválasztása';

  @override
  String get detailSectionsScreenDescription =>
      'Csak az aktuális részletképernyő-stílusban megjeleníthető szakaszok szerepelnek a listában. Egy szakasz elrejtése minden olyan stílusra érvényes, amely tartalmazza azt.';

  @override
  String get detailSectionGroupHeader => 'Fejléc';

  @override
  String get detailSectionGroupSections => 'Szakaszok';

  @override
  String get detailSectionGroupPerson => 'Személyek adatlapjai';

  @override
  String get detailSectionGroupCollection => 'Gyűjtemények adatlapjai';

  @override
  String get detailSectionGroupOther => 'Egyéb';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle =>
      'Cím megjelenítése szövegként, ha a logo szakasz ki van kapcsolva';

  @override
  String get detailSectionTagline => 'Jelmondat';

  @override
  String get detailSectionPoster => 'Poszter';

  @override
  String get detailSectionVersionBadge => 'Verzió jelvény';

  @override
  String get detailSectionUpNext => 'Következik';

  @override
  String get detailSectionLyrics => 'Dalszöveg';

  @override
  String get detailSectionCast => 'Szereplők';

  @override
  String get detailSectionCastSubtitle => 'Gyűjtemények adatlapjain is';

  @override
  String get detailSectionCrew => 'Rendezők és írók';

  @override
  String get detailSectionStudios => 'Stúdiók';

  @override
  String get detailSectionChapters => 'Fejezetek';

  @override
  String get detailSectionExtras => 'Extrák';

  @override
  String get detailSectionCollections => 'Gyűjtemények';

  @override
  String get detailSectionMoreLikeThis => 'Hasonlók';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Hasonló albumok és előadók is';

  @override
  String get detailSectionMoreEpisodes => 'További epizódok';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'Epizódok oldalain';

  @override
  String get detailSectionMediaInfo => 'Média infó';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'Fájl, stream és közvetlen lejátszás ellenőrzése';

  @override
  String get detailSectionSeerrGenresTags => 'Műfajok és címkék';

  @override
  String get detailSectionSeerrStats => 'Statisztikák';

  @override
  String get detailSectionSeerrStreaming => 'Streaming services';

  @override
  String get seerrStreamingOn => 'Streaming on';

  @override
  String get detailSectionSeerrRecommendations => 'Ajánlások';

  @override
  String get detailSectionSeerrSimilar => 'Hasonló címek';

  @override
  String get detailSectionSeerrCollection => 'Gyűjtemény borítókép';

  @override
  String get detailSectionSeerrPersonAppearances => 'Szereplések';

  @override
  String get detailSectionSeerrPersonCrew => 'Stábtagként végzett munkák';

  @override
  String get detailSectionPersonPagesSubtitle => 'Személyek adatlapjain';

  @override
  String get detailSectionBiography => 'Életrajz';

  @override
  String get detailSectionBirthplace => 'Születési hely';

  @override
  String get detailSectionPersonLinks => 'Links';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB and social media';

  @override
  String get detailSectionGuestAppearances => 'Vendégszereplések';

  @override
  String get detailSectionMusicVideos => 'Videóklippek';

  @override
  String get detailSectionPlaylistOrder => 'Lejátszási lista sorrend';

  @override
  String get detailSectionBookGenres => 'Könyvműfajok';

  @override
  String get detailSectionPhotoExif => 'Fényképrészletek';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Következő: $date ($season. évad, $episode. epizód)';
  }

  @override
  String get upcomingEpisodeToday => 'Ma';

  @override
  String get upcomingEpisodeTomorrow => 'Holnap';

  @override
  String get moveUp => 'Feljebb';

  @override
  String get moveDown => 'Lejjebb';

  @override
  String get buttonOrderHint =>
      'A sorrend a nyilakkal módosítható. Távirányító használatakor a bal és jobb nyílgombokkal mozgatható a kijelölt gomb. Egy gomb kikapcsolásakor az a lista végére kerül.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Csak SyncPlay-csoporthoz csatlakozva jelenik meg';

  @override
  String get orientationLock => 'Tájolás zár';

  @override
  String get fullscreen => 'Teljesképernyő';

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
  String get settingsAudioFallbackCodec => 'Tartalék hangkodek';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Válaszd ki a célformátumot a többcsatornás hang átkódolásához, ha a forrás-adatfolyam nem játszható le közvetlen lejátszással, vagy nem engedhető át.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

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
  String get settingsAudioDtsCorePassthrough => 'DTS Core-átengedés';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA-átengedés';

  @override
  String get settingsAudioPassthroughMode => 'Továbbítás';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'A tömörített térhatású hang televízióra vagy vevőegységre történő továbbításának módja.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Kikapcsolva (a dekódolás mindig ezen az eszközön történik)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Automatikus (az észlelt eszköz támogatásához igazítva)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Kézi (az alábbi formátumok kiválasztásával)';

  @override
  String get settingsAudioPassthroughOutput => 'Hangtovábbítás kimenete';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'A HDMI-kapcsolaton továbbított bitfolyamok csomagolásának módja. Ha a hangtovábbítás nem működik megfelelően, vagy a hang akadozik, érdemes az alkalmazás saját csomagolóját használni.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Automatikus, rendszerszintű csomagolás (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec =>
      'Alkalmazásszintű csomagolás (AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'Alkalmazás (IEC)';

  @override
  String get settingsDownmixToStereoDescription =>
      'Az összes dekódolt hang két csatornára keverése.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'E-AC-3 bitfolyam továbbítása, beleértve a Dolby Atmos (JOC) hangot is.';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'DTS-HD bitfolyam továbbítása, beleértve a DTS:X hangot is.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'TrueHD bitfolyam továbbítása, beleértve a Dolby Atmos hangot is.';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD-átengedés';

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
  String get subtitleDownloadLanguages => 'Feliratletöltések nyelve';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'A feliratok letöltésekor keresett nyelvek, legfeljebb 5. Automatikus módban a keresés a feliratok alapértelmezett nyelve vagy a videó alapján kiválasztott egyetlen nyelven történik.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Előnyben részesített másodlagos feliratnyelv';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Show a second subtitle track at the same time. The subtitle menu then asks for the primary or secondary track first';

  @override
  String get defaultToNoSubtitles => 'Alapértelmezés szerint nincs felirat';

  @override
  String get turnOffSubtitlesByDefault =>
      'Feliratok kikapcsolása alapértelmezés szerint';

  @override
  String get subtitleSize => 'Felirat mérete';

  @override
  String get primarySubtitleSlot => 'Elsődleges';

  @override
  String get secondarySubtitleSlot => 'Másodlagos';

  @override
  String get secondarySubtitleTrack => 'Másodlagos feliratsáv';

  @override
  String get secondaryDelayAdjustment => 'Secondary Delay Adjustment';

  @override
  String decreaseValue(String setting) {
    return '$setting csökkentése';
  }

  @override
  String increaseValue(String setting) {
    return '$setting növelése';
  }

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
  String get semiTransparentWhite => 'Félig áttetsző fehér';

  @override
  String get lightGray => 'Világosszürke';

  @override
  String get darkGray => 'Sötétszürke';

  @override
  String get blue => 'Kék';

  @override
  String get magenta => 'Magenta';

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
  String get syncing => 'Szinkronizálás...';

  @override
  String resetProfileTitle(String profile) {
    return '$profile visszaállítása?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Ez törli $profile profilját a szerverről, és visszaállítja az összes szinkronizált beállítást az alapértelmezett értékére ezen az eszközön.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Ez törli az összes mentett profilt a szerverről, és visszaállítja az összes szinkronizált beállítást az alapértelmezett értékére ezen az eszközön.';

  @override
  String profileReset(String profile) {
    return '$profile profiljának visszaállítása az alapértelmezett beállításokra.';
  }

  @override
  String get resetRatingsTitle => 'Értékelések visszaállítása?';

  @override
  String get resetRatingsDescription =>
      'Ez visszaállítja az értékelések összes beállítását az alapértelmezett értékére, beleértve a megjelenített forrásokat és azok sorrendjét is.';

  @override
  String get ratingsReset => 'Reset ratings to defaults.';

  @override
  String failedToResetProfile(String profile) {
    return 'Failed to reset $profile profile.';
  }

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
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

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
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar =>
      'Könyvtárak megjelenítése az eszköztárban';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

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
  String get mediaBarMode => 'Médiasáv stílusa';

  @override
  String get mediaBarModeDescription =>
      'Válassz a különböző médiasáv-stílusok közül, vagy kapcsold ki a médiasávot';

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
  String get mediaBarModeOff => 'Ki';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Médiasáv engedélyezése';

  @override
  String get showFeaturedContentSlideshow =>
      'Kiemelt tartalom diavetítésének megjelenítése a kezdőlapon';

  @override
  String get contentType => 'Tartalom típusa';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

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
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

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
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Legutóbb hozzáadott média';

  @override
  String get recentlyReleased => 'Nemrég megjelent';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

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
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Alapértelmezett értékek visszaállítása';

  @override
  String get homeRowPosterSize => 'Kezdősor posztermérete';

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
  String get fullScreenRows => 'Kibontott kezdőképernyő-sorok';

  @override
  String get fullScreenRowsDescription =>
      'Korlátozd a kezdőképernyő sorait képernyőnként 1 sorra';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get displayClockDuringScreensaver =>
      'Óra megjelenítése képernyővédő közben';

  @override
  String get clockModeStatic => 'Statikus';

  @override
  String get clockModeBouncing => 'Pattogó';

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
  String get pluginDetected => 'Beépülő modul észlelve';

  @override
  String get pluginNotDetected => 'Beépülő modul nem észlelhető';

  @override
  String get pluginNotDetectedDescription =>
      'A szerver beépülő modul jelenleg nem észlelhető. A helyi beállítások továbbra is a mentett értékeket vagy a beépített alapértelmezett értékeket használják.';

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
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Seerr felfedezési sorok';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

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
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

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
  String get featuredContentAppearance => 'Kiemelt tartalom, megjelenés';

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
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Igénylés';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Igénylés visszavonása';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Lejátszás a Moonfinben';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Igényelte: $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

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
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Igénylés elküldése';

  @override
  String get allSeasons => 'Minden évad';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

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
  String get adminLibraryLoadFailed => 'Nem sikerült betölteni a könyvtárat';

  @override
  String get adminNoMediaPaths => 'Nincsenek konfigurálva médiaútvonalak';

  @override
  String get adminAddPath => 'Elérési út hozzáadása';

  @override
  String get adminBrowseFilesystem => 'Tallózás a szerver fájlrendszerében:';

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
  String adminSaveFailed(String error) {
    return 'Nem sikerült menteni: $error';
  }

  @override
  String get adminPasswordsMismatch => 'A jelszavak nem egyeznek';

  @override
  String adminFailed(String error) {
    return 'Sikertelen: $error';
  }

  @override
  String get adminUserLoadFailed => 'Nem sikerült betölteni a felhasználót';

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
  String get adminEnableAllLibraryAccess =>
      'Hozzáférés engedélyezése az összes könyvtárhoz';

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
  String get adminPlaybackLoadFailed =>
      'Nem sikerült betölteni a lejátszási beállításokat';

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
  String adminMetadataLoadFailed(String error) {
    return 'Nem sikerült betölteni a metaadatokat: $error';
  }

  @override
  String get adminRefreshMetadata => 'Metaadatok frissítése';

  @override
  String get recursive => 'Rekurzív';

  @override
  String get adminReplaceAllMetadata => 'Összes metaadat cseréje';

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
  String get adminEnableAllTuners => 'Összes tuner engedélyezése';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Nem sikerült eltávolítani a tunert: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Nem sikerült eltávolítani a szolgáltatót: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Sorozatok felvételi útvonala';

  @override
  String get adminMovieRecordingPath => 'Filmek felvételi útvonala';

  @override
  String get adminGuideDaysAuto => 'Automatikus';

  @override
  String get adminRecordingPostProcessor => 'Utófeldolgozó alkalmazás útvonala';

  @override
  String get adminRecordingPostProcessorArgs => 'Utófeldolgozó argumentumai';

  @override
  String get adminSaveRecordingNfo => 'Felvétel NFO-metaadatainak mentése';

  @override
  String get adminSaveRecordingImages => 'Felvétel képeinek mentése';

  @override
  String get adminLiveTvSectionPaths => 'Felvételi útvonalak';

  @override
  String get adminLiveTvSectionPostProcessing => 'Utófeldolgozás';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nem sikerült menteni a beállításokat: $error';
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
  String get adminGuideRefreshStarted =>
      'Műsorújság-adatok frissítése elindult';

  @override
  String get adminGuideRefreshUnavailable =>
      'A műsorújság-frissítési feladat nem érhető el ezen a szerveren.';

  @override
  String get adminNoListingProviders =>
      'Nincsenek beállítva műsorújság-szolgáltatók';

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
  String get adminBackupsTitle => 'Biztonsági mentések';

  @override
  String get adminUnknownDate => 'Ismeretlen dátum';

  @override
  String get adminUnnamedBackup => 'Névtelen biztonsági mentés';

  @override
  String get adminApply => 'Alkalmaz';

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
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Címsor';

  @override
  String get adminMetadataFieldOverview => 'Áttekintés';

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
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Egyetlen beépülő modul sem felel meg a keresésnek';

  @override
  String get adminPluginsNoneInstalled => 'Nincs telepítve beépülő modul';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

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
  String get adminNetworkingEnableHttps => 'HTTPS engedélyezése';

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
  String get adminPlaybackQsvDevice => 'QSV-eszköz';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Speciális NVDEC dekóder engedélyezése';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'A rendszer saját hardveres dekóderének előnyben részesítése';

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
  String get adminNetworkingPublicHttpPort => 'Nyilvános HTTP-port';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS megkövetelése';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Minden távoli kérést irányíts át HTTPS-re. Nincs hatása, ha a szervernek nincs érvényes tanúsítványa.';

  @override
  String get adminNetworkingCertPassword => 'Tanúsítvány jelszava';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 engedélyezése';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 engedélyezése';

  @override
  String get adminNetworkingLocalSubnets => 'Helyi hálózatok (LAN)';

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
  String get kidsMode => 'Kids Mode';

  @override
  String get kidsModeSubtitle =>
      'Simplify the app and lock the way out with a PIN';

  @override
  String get kidsModeExit => 'Exit Kids Mode';

  @override
  String get kidsModeExitSubtitle => 'Enter your PIN to restore the full app';

  @override
  String get pinIncorrect => 'Helytelen PIN-kód';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

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
  String get trackActionViewDetails => 'View Details';

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
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

  @override
  String get settingsAdministrationSubtitle =>
      'A szerveradminisztrációs panel megnyitása';

  @override
  String get settingsDynamicContent => 'Dinamikus tartalom';

  @override
  String get settingsDynamicContentSubtitle => 'Médiasáv és vizuális fedvények';

  @override
  String get settingsAboutSubtitle =>
      'Az alkalmazás verziója, jogi információk és közreműködők';

  @override
  String get settingsSortServersBy => 'Szerverek rendezése szerint';

  @override
  String get settingsLastUsed => 'Utoljára használt';

  @override
  String get settingsAlphabetical => 'Betűrendes';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Önaláírt tanúsítványok engedélyezése';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Bízz meg az önaláírt vagy privát hitelesítésszolgáltatótól (CA) származó TLS-tanúsítványokat használó szerverekben. Csak az általad felügyelt szervereknél engedélyezd. Ez letiltja a tanúsítványok ellenőrzését minden kapcsolatnál.';

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
  String get settingsHomePage => 'Kezdőképernyő';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

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
  String get settingsBoth => 'Mindkettő';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Véletlenszerű tartalomtípus-szűrő';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Hangsávok, feldolgozás és átengedési lehetőségek';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatikus lejátszás és szekvenálás';

  @override
  String get settingsSyncplaySubtitle =>
      'Szinkronizálási logika a csoportos munkamenetekhez';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Kihagyod a bevezetőket és a stáblistákat?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Médiaszegmens visszaszámlálása';

  @override
  String get settingsProgressBar => 'Folyamatjelző sáv';

  @override
  String get settingsTimer => 'Időzítő';

  @override
  String get settingsNone => 'Nincs';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv (korábbi)';

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
  String get settingsAutoAftkrtEnabled => 'Automatikus';

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
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

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
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

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
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

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
  String get rowsType => 'Sor típusa';

  @override
  String get rowsTypeDescription =>
      'A klasszikus megtartja a soronkénti képtípust és az információs fedvényt. A modern állóképről háttérképre váltó sorokat használ.';

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
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

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
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Műfajsorok elemei';

  @override
  String get genresRowItemsDescription =>
      'Filmek, sorozatok vagy mindkettő megjelenítése a műfajsorokban.';

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
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

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
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Átengedés';

  @override
  String get supportedOnThisDevice => 'Támogatott ezen az eszközön';

  @override
  String get notSupportedOnThisDevice => 'Nem támogatott ezen az eszközön';

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
  String get useExternalPlayer => 'Mindig külső lejátszó használata';

  @override
  String get useExternalPlayerSubtitle =>
      'Nyisd meg a videólejátszást a kiválasztott külső alkalmazásban Android TV-n.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Automatikus sorba állítás';

  @override
  String get preferSdhSubtitles => 'SDH feliratok előnyben részesítése';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Sorold előre az SDH/CC feliratsávokat az automatikus kiválasztás során.';

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
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Nézés csoporttal';

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
  String get disk => 'Lemez';

  @override
  String get openInBrowser => 'Megnyitás böngészőben';

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
  String get homeVideos => 'Saját videók';

  @override
  String get mixedContent => 'Vegyes tartalom';

  @override
  String get homeVideosAndPhotos => 'Saját videók és fotók';

  @override
  String get mixedMoviesAndShows => 'Vegyes filmek és sorozatok';

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
  String get audiobookFocusedTimeline => 'Fókuszált idővonal';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

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
  String get replay => 'Újrajátszás';

  @override
  String get fileInformation => 'Fájlinformációk';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Méret: $size  •  Formátum: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
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
  String get sortAlphabetical => 'Betűrendben';

  @override
  String get sortReleaseAscending => 'Megjelenés sorrendje (növekvő)';

  @override
  String get sortReleaseDescending => 'Megjelenés sorrendje (csökkenő)';

  @override
  String get sortCustomDragDrop => 'Egyéni (fogd és vidd)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

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
  String get setupStyleNouveau => 'Újszerű';

  @override
  String get setupDetailNouveauHint =>
      'Teljesképernyő, fülek helyett rendezett szekciókkal.';

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
  String get integrations => 'Integrációk';

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
