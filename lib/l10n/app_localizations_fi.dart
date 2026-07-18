// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'TILIASETUKSET';

  @override
  String get interfaceLanguage => 'Käyttöliittymän kieli';

  @override
  String get systemLanguageDefault => 'Järjestelmän oletus';

  @override
  String get signIn => 'Kirjaudu sisään';

  @override
  String get empty => 'Tyhjä';

  @override
  String connectingToServer(String serverName) {
    return 'Yhdistetään kohteeseen $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Salasana';

  @override
  String get username => 'Käyttäjätunnus';

  @override
  String get email => 'Sähköposti';

  @override
  String get quickConnectInstruction =>
      'Syötä tämä koodi palvelimesi web-hallintapaneeliin:';

  @override
  String get waitingForAuthorization => 'Odotetaan valtuutusta...';

  @override
  String get back => 'Takaisin';

  @override
  String get serverUnavailable => 'Palvelin ei ole käytettävissä';

  @override
  String get loginFailed => 'Kirjautuminen epäonnistui';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect ei ole käytettävissä: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect ei ole käytettävissä ($status): $detail';
  }

  @override
  String get whosWatching => 'Kuka katsoo?';

  @override
  String get addUser => 'Lisää käyttäjä';

  @override
  String get selectServer => 'Valitse Palvelin';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versio $version';
  }

  @override
  String get savedServers => 'Tallennetut palvelimet';

  @override
  String get discoveredServers => 'Löydetyt palvelimet';

  @override
  String get noneFound => 'Ei löytynyt';

  @override
  String get unableToConnectToServer =>
      'Ei voida muodostaa yhteyttä palvelimeen';

  @override
  String get addServer => 'Lisää palvelin';

  @override
  String get embyConnect => 'Emby Yhdistä';

  @override
  String get removeServer => 'Poista palvelin';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Poistetaanko \"$serverName\" palvelimiltasi?';
  }

  @override
  String get cancel => 'Peruuttaa';

  @override
  String get remove => 'Poista';

  @override
  String get connectToServer => 'Yhdistä palvelimeen';

  @override
  String get serverAddress => 'Palvelimen osoite';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Yhdistä';

  @override
  String get secureStorageUnavailable =>
      'Suojattu tallennustila ei ole käytettävissä';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin ei voinut käyttää järjestelmäavaimenperääsi. Kirjautuminen voi jatkua, mutta suojattu tunnuksen tallennus ei välttämättä ole käytettävissä, ennen kuin avaimenperä on avattu.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Sovelluksen teema';

  @override
  String get detailScreenStyle => 'Tietonäkymän tyyli';

  @override
  String get detailScreenStyleSubtitle =>
      'Klassinen on alkuperäinen keskitetty Moonfin-asettelu. Moderni on mukautuva, elokuvamainen asettelu.';

  @override
  String get detailScreenStyleMoonfin => 'Klassinen';

  @override
  String get detailScreenStyleModern => 'Moderni';

  @override
  String get expandedTabs => 'Laajennetut välilehdet';

  @override
  String get expandedTabsSubtitle =>
      'Näytä välilehden sisältö automaattisesti välilehtiä selatessasi. Poista käytöstä, jos haluat avata ja sulkea jokaisen välilehden itse.';

  @override
  String get showTechnicalDetails => 'Näytetäänkö tekniset tiedot?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Näytä koodekki-, tarkkuus- ja suoratoistotiedot bannerin yhteenvedossa';

  @override
  String get recommendationSystem => 'Suositusjärjestelmä';

  @override
  String get recommendationSystemSubtitle =>
      'Käytä paikalliseen kirjastoon perustuvaa Moonfin suosittelee -algoritmia tai TMDb:n verkossa toimivia samankaltaisuusmittareita. Huomaa: verkkosuositukset vaativat Seerr-integraation.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin suosittelee';

  @override
  String get recommendationSystemTmdb => 'TMDb-samankaltaisuus';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Rajoitetaanko ikärajan mukaan?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Rajoita Moonfin suosittelee -ehdotuksia kohdemedian ikärajan mukaan';

  @override
  String get interfaceStyle => 'Käyttöliittymätyyli';

  @override
  String get interfaceStyleSubtitle =>
      'Automaattinen mukautuu laitteeseesi. Valitse Apple tai Material pakottaaksesi tietyn ulkoasun.';

  @override
  String get interfaceStyleAutomatic => 'Automaattinen';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Lasin laatu';

  @override
  String get glassQualitySubtitle =>
      'Automaattinen valitsee parhaan lasitehosteen tälle laitteelle. Täysi pakottaa aidon sumennuksen, Kevennetty käyttää kevyttä lasia, joka säästää GPU:n tehoa.';

  @override
  String get glassQualityAuto => 'Automaattinen';

  @override
  String get glassQualityFull => 'Täysi';

  @override
  String get glassQualityReduced => 'Kevennetty';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Vaihda Moonfin ja Neon Pulse välillä käynnistämättä sovellusta uudelleen';

  @override
  String get customThemeTitle => 'Mukautettu teema';

  @override
  String get customThemeSubtitle =>
      'Mukautetut teemat muuttavat Moonfinin ulkoasua kauttaaltaan. Valitse tyyliisi sopiva vaihtoehto.';

  @override
  String get keyboardPreferSystemIme => 'Suosi järjestelmän näppäimistöä';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Käytä oletusarvoisesti laitteesi syöttötapaa tekstin syöttämiseen';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Nykyinen Moonfin look, johon olette kaikki rakastuneet';

  @override
  String get themeNeonPulse => 'Neon pulssi';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-tyyli magenta hehkulla, syaanilla tekstillä ja vahvemmalla kromikontrastilla';

  @override
  String get themeGlass => 'Lasi';

  @override
  String get themeGlassSubtitle =>
      'Nestemäisen lasin tyyli, jossa on liukuva liukuväritausta, huurteiset pinnat ja Applen sininen korostusväri';

  @override
  String get theme8BitHero => '8-bittinen sankari';

  @override
  String get theme8BitHeroSubtitle =>
      'Retrohenkinen pikselitaidetyyli, jossa on karkea väripaletti, kulmikkaat reunat, terävät varjot ja pikselifontti';

  @override
  String get embyConnectSignInSubtitle =>
      'Kirjaudu sisään Emby Connect -tililläsi';

  @override
  String get emailOrUsername => 'Sähköposti tai käyttäjätunnus';

  @override
  String get selectAServer => 'Valitse palvelin';

  @override
  String get tryAgain => 'Yritä uudelleen';

  @override
  String get noLinkedServers =>
      'Tähän Emby Connect -tiliin ei ole linkitetty palvelimia';

  @override
  String get invalidEmbyConnectCredentials =>
      'Virheelliset Emby Connect -tunnistetiedot';

  @override
  String get invalidEmbyConnectLogin =>
      'Virheellinen Emby Connect -käyttäjätunnus tai salasana';

  @override
  String get embyConnectExchangeNotSupported =>
      'Palvelin ei tue Emby Connect -vaihtoa';

  @override
  String get embyConnectNetworkError =>
      'Verkkovirhe otettaessa yhteyttä Emby Connectiin tai valittuun palvelimeen';

  @override
  String get loadingLinkedServers => 'Ladataan linkitettyjä palvelimia...';

  @override
  String get connectingToServerEllipsis => 'Yhdistetään palvelimeen...';

  @override
  String get noReachableAddress => 'Yhteysosoitetta ei ole annettu';

  @override
  String get invalidServerExchangeResponse =>
      'Virheellinen vastaus palvelimen vaihdon päätepisteestä';

  @override
  String unableToConnectTo(String target) {
    return 'Ei voida muodostaa yhteyttä $target';
  }

  @override
  String get exitApp => 'Poistutko Moonfinista?';

  @override
  String get exitAppConfirmation => 'Haluatko varmasti poistua?';

  @override
  String get exit => 'Poistu';

  @override
  String get gameMenu => 'Valikko';

  @override
  String get gamePaused => 'Tauolla';

  @override
  String get gameSaveState => 'Tallenna tila';

  @override
  String get games => 'Pelit';

  @override
  String get gameLoadState => 'Lataa tila';

  @override
  String get gameFastForward => 'Pikakelaus';

  @override
  String get gameEmulatorSettings => 'Emulaattorin asetukset';

  @override
  String get gameNoCoreOptions =>
      'Tässä ytimessä ei ole säädettäviä asetuksia.';

  @override
  String get gameHoldToOpenMenu => 'Avaa valikko pitämällä painettuna';

  @override
  String get gamePlaybackUnsupported =>
      'Pelaamista ei vielä tueta tällä laitteella.';

  @override
  String get noHomeRowsLoaded => 'Kotirivejä ei voitu ladata';

  @override
  String get noHomeRowsHint =>
      'Yritä päivittää tai vähentää aktiivisia kotiosioita.';

  @override
  String get retryHomeRows => 'Yritä kotirivejä uudelleen';

  @override
  String get guide => 'Opas';

  @override
  String get recordings => 'Tallenteet';

  @override
  String get schedule => 'Ajoittaa';

  @override
  String get series => 'Sarjat';

  @override
  String get noItemsFound => 'Kohteita ei löytynyt';

  @override
  String get home => 'Koti';

  @override
  String get browseAll => 'Selaa kaikkia';

  @override
  String get genres => 'Genret';

  @override
  String get collectionPlaceholder => 'Kokoelman kohteet näkyvät täällä';

  @override
  String get browseByLetter => 'Selaa kirjeen mukaan';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Aakkosellinen selaus tulee näkyviin tähän';

  @override
  String get suggestions => 'ehdotuksia';

  @override
  String get suggestionsPlaceholder => 'Ehdotetut kohteet näkyvät täällä';

  @override
  String get failedToLoadLibraries => 'Kirjastojen lataaminen epäonnistui';

  @override
  String get noLibrariesFound => 'Kirjastoja ei löytynyt';

  @override
  String get library => 'Kirjasto';

  @override
  String get displaySettings => 'Näyttöasetukset';

  @override
  String get allGenres => 'Kaikki genret';

  @override
  String get noGenresFound => 'Genrejä ei löytynyt';

  @override
  String failedToLoadFolderError(String error) {
    return 'Kansion lataaminen epäonnistui: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Tämä kansio on tyhjä';

  @override
  String itemCountLabel(int count) {
    return '$count kohteita';
  }

  @override
  String get failedToLoadFavorites => 'Suosikkien lataaminen epäonnistui';

  @override
  String get retry => 'Yritä uudelleen';

  @override
  String get noFavoritesYet => 'Ei vielä suosikkeja';

  @override
  String get favorites => 'Suosikit';

  @override
  String totalCountItems(int count) {
    return '$count Kohteet';
  }

  @override
  String get continuing => 'Jatkuu';

  @override
  String get ended => 'Päättyi';

  @override
  String get sortAndFilter => 'Lajittele & Suodata';

  @override
  String get type => 'Tyyppi';

  @override
  String get sortBy => 'Lajitteluperuste';

  @override
  String get display => 'Näyttö';

  @override
  String get imageType => 'Kuvatyyppi';

  @override
  String get posterSize => 'Julisteen koko';

  @override
  String get small => 'Pieni';

  @override
  String get medium => 'Keskikokoinen';

  @override
  String get large => 'Suuri';

  @override
  String get extraLarge => 'Erittäin suuri';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genret';
  }

  @override
  String get views => 'Näkymät';

  @override
  String get albums => 'Albumit';

  @override
  String get albumArtists => 'Albumin artistit';

  @override
  String get artists => 'Artistit';

  @override
  String get bookmarks => 'Kirjanmerkit';

  @override
  String get noSavedBookmarks =>
      'Tälle nimikkeelle ei ole vielä tallennettuja kirjanmerkkejä.';

  @override
  String get openBook => 'Avaa Kirja';

  @override
  String get chapter => 'Luku';

  @override
  String get page => 'Sivu';

  @override
  String get bookmark => 'Kirjanmerkki';

  @override
  String get justNow => 'Juuri nyt';

  @override
  String minutesAgo(int count) {
    return '${count}min sitten';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h sitten';
  }

  @override
  String daysAgo(int count) {
    return '${count}d sitten';
  }

  @override
  String get discoverySubjects => 'Löytöaiheet';

  @override
  String get pickDiscoverySubjects =>
      'Valitse Discoverissa näytettävät aihesyötteet.';

  @override
  String get apply => 'Käytä';

  @override
  String get openLink => 'Avaa linkki';

  @override
  String get scanWithYourPhone => 'Skannaa puhelimellasi';

  @override
  String get audiobookGenres => 'Äänikirjan tyylilajit';

  @override
  String get pickAudiobookGenres =>
      'Valitse äänikirja Discoverissa näytettävät tyylilajit.';

  @override
  String get discoverAudiobooks => 'Tutustu äänikirjoihin';

  @override
  String get librivoxDescription =>
      'LibriVoxin suosittuja julkisia nimikkeitä.';

  @override
  String titlesCount(int count) {
    return '$count otsikoita';
  }

  @override
  String get scrollLeft => 'Vieritä vasemmalle';

  @override
  String get scrollRight => 'Vieritä oikealle';

  @override
  String get couldNotLoadGenre => 'Tätä genreä ei voitu ladata juuri nyt.';

  @override
  String get continueReading => 'Jatka lukemista';

  @override
  String get savedHighlights => 'Tallennetut kohokohdat';

  @override
  String get continueListening => 'Jatka kuuntelua';

  @override
  String get listen => 'Kuunnella';

  @override
  String get resume => 'Jatka';

  @override
  String get failedToLoadLibrary => 'Kirjaston lataaminen epäonnistui';

  @override
  String get popularNow => 'Suosittu nyt';

  @override
  String get savedForLater => 'Tallennettu myöhempää käyttöä varten';

  @override
  String get topListens => 'Kuunnelluimmat';

  @override
  String get unreadDiscoveries => 'Lukemattomat löydöt';

  @override
  String get pickUpAgain => 'Poimi uudelleen';

  @override
  String get bookHighlightsDescription =>
      'Kirjasi kohokohdista, suosikeista tai lukemisen edistymisestä.';

  @override
  String get handPickedFromLibrary => 'Käsin poimittu kirjastostasi.';

  @override
  String get handPickedFromListeningQueue =>
      'Käsin poimittu kuuntelujonostasi.';

  @override
  String get booksWithHighlights =>
      'Kirjat, joissa on kohokohtia, suosikkeja tai lukemisen edistymistä.';

  @override
  String get jumpBackNarration =>
      'Hyppää takaisin selostukseen etsimättä paikkaasi.';

  @override
  String get unreadBooksReady =>
      'Lukemattomat kirjat valmiina seuraavaa hiljaista tuntia varten.';

  @override
  String get quickAccessFavorites =>
      'Nopea pääsy kirjoihin, joihin palaat jatkuvasti.';

  @override
  String get searchAudiobooks => 'Etsi äänikirjoja';

  @override
  String get searchYourLibrary => 'Hae kirjastostasi';

  @override
  String get pickUpStory => 'Jatka tarina siitä mihin jäit';

  @override
  String get savedPlacesChapters => 'Tallennetut paikat ja keskeneräiset luvut';

  @override
  String authorsCount(int count) {
    return '$count kirjoittajat';
  }

  @override
  String genresCount(int count) {
    return '$count genrejä';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% valmis';
  }

  @override
  String get readyWhenYouAre => 'Valmiina kun olet';

  @override
  String get details => 'Yksityiskohdat';

  @override
  String get listeningRoom => 'Kuunteluhuone';

  @override
  String get bookmarksAndProgress => 'Kirjanmerkit ja edistyminen';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count otsikot, jotka on järjestetty luettavaksi ensimmäiseksi selaamiseksi.';
  }

  @override
  String get titles => 'Nimikkeet';

  @override
  String get allTitles => 'Kaikki otsikot';

  @override
  String get authors => 'Tekijät';

  @override
  String get browseByAuthor => 'Selaa tekijän mukaan';

  @override
  String get browseByGenre => 'Selaa genren mukaan';

  @override
  String get discover => 'Tutustu';

  @override
  String get trendingTitlesOpenLibrary =>
      'Nousussa olevat otsikot aiheittain alkaen Open Library.';

  @override
  String get noBookmarkedItems =>
      'Ei vielä kirjanmerkkeihin merkittyjä kohteita';

  @override
  String get nothingMatchesSection =>
      'Mikään ei vielä vastaa tätä osiota. Kokeile toista välilehteä tai palaa kirjaston synkronoinnin päätyttyä.';

  @override
  String get audiobooks => 'Äänikirjat';

  @override
  String noLabelFound(String label) {
    return '$label ei löytynyt';
  }

  @override
  String get folder => 'Kansio';

  @override
  String get filters => 'Suodattimet';

  @override
  String get readingStatus => 'Lukemisen tila';

  @override
  String get playedStatus => 'Pelin tila';

  @override
  String get readStatus => 'Lukea';

  @override
  String get watched => 'Katsotut';

  @override
  String get unread => 'Lukematon';

  @override
  String get unwatched => 'Katsomattomat';

  @override
  String get seriesStatus => 'Sarjan tila';

  @override
  String get allLibraries => 'Kaikki kirjastot';

  @override
  String get books => 'Kirjat';

  @override
  String get latestBooks => 'Uusimmat kirjat';

  @override
  String get latestAudiobooks => 'Uusimmat äänikirjat';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kirjaa',
      one: '1 kirja',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Kirja';

  @override
  String get bookFormatAudiobook => 'Äänikirja';

  @override
  String bookPercentRead(int percent) {
    return '$percent % luettu';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time jäljellä';
  }

  @override
  String get bookHeroRead => 'Lue';

  @override
  String get bookHeroListen => 'Kuuntele';

  @override
  String get author => 'Tekijä';

  @override
  String get unknownAuthor => 'Tuntematon tekijä';

  @override
  String get uncategorized => 'Luokittelematon';

  @override
  String get overview => 'Yleiskatsaus';

  @override
  String get noLibrivoxDescription =>
      'LibriVox ei ole vielä toimittanut kuvausta tälle nimikkeelle.';

  @override
  String get readers => 'Lukijat';

  @override
  String get openLinks => 'Avaa Linkit';

  @override
  String get librivoxPage => 'LibriVox-sivu';

  @override
  String get internetArchive => 'Internet-arkisto';

  @override
  String get rssFeed => 'RSS-syöte';

  @override
  String get downloadZip => 'Lataa Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count osiot';
  }

  @override
  String firstPublished(int year) {
    return 'Ensimmäinen julkaistu $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Open Library ei ole vielä saatavilla yleiskatsausta tälle nimikkeelle.';

  @override
  String get subjects => 'Aiheet';

  @override
  String get all => 'Kaikki';

  @override
  String booksCount(int count) {
    return '$count kirjat';
  }

  @override
  String get couldNotLoadSubject => 'Tätä aihetta ei voitu ladata juuri nyt.';

  @override
  String get audiobookDetails => 'Äänikirjan tiedot';

  @override
  String authorsCountTitle(int count) {
    return '$count Tekijät';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count äänikirjaa',
      one: '1 äänikirja',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Kappaleluettelo';

  @override
  String get itemListPlaceholder => 'Tuoteluettelo tulee näkyviin tähän';

  @override
  String get failedToLoad => 'Lataus epäonnistui';

  @override
  String get delete => 'Poista';

  @override
  String get save => 'Tallenna';

  @override
  String get moreLikeThis => 'Lisää tällaista';

  @override
  String get castAndCrew => 'Näyttelijät ja miehistö';

  @override
  String get collection => 'Kokoelma';

  @override
  String get episodes => 'Jaksot';

  @override
  String get nextUp => 'Seuraavaksi';

  @override
  String get seasons => 'Kaudet';

  @override
  String get chapters => 'Luvut';

  @override
  String get features => 'Ominaisuudet';

  @override
  String get movies => 'Elokuvat';

  @override
  String get musicVideos => 'Musiikkivideot';

  @override
  String get other => 'Muut';

  @override
  String get discography => 'Diskografia';

  @override
  String get similarArtists => 'Samanlaisia ​​taiteilijoita';

  @override
  String get tableOfContents => 'Sisällysluettelo';

  @override
  String get tracklist => 'Kappalelista';

  @override
  String discNumber(int number) {
    return 'Levy $number';
  }

  @override
  String get biography => 'Elämäkerta';

  @override
  String get authorDetails => 'Tekijän tiedot';

  @override
  String get noOverviewAvailable =>
      'Tästä otsikosta ei ole vielä saatavilla yleiskatsausta.';

  @override
  String get noBiographyAvailable =>
      'Tämän kirjoittajan elämäkertaa ei ole saatavilla.';

  @override
  String get noBooksFound => 'Tälle kirjailijalle ei löytynyt kirjoja.';

  @override
  String get unableToLoadAuthorDetails =>
      'Tekijän tietoja ei voi ladata juuri nyt.';

  @override
  String published(int year) {
    return 'Julkaistu $year';
  }

  @override
  String get publicationDateUnknown => 'Julkaisupäivä tuntematon';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kautta',
      one: '1 kausi',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Päättyy $time';
  }

  @override
  String get items => 'Kohteet';

  @override
  String get extras => 'Lisämateriaali';

  @override
  String get behindTheScenes => 'Kulissien takana';

  @override
  String get deletedScenes => 'Poistetut kohtaukset';

  @override
  String get featurettes => 'Lyhytdokumentit';

  @override
  String get interviews => 'Haastattelut';

  @override
  String get scenes => 'Kohtaukset';

  @override
  String get shorts => 'Lyhytelokuvat';

  @override
  String get trailers => 'Trailerit';

  @override
  String timeRemaining(String time) {
    return '$time jäljellä';
  }

  @override
  String endsIn(String time) {
    return 'Päättyy $time kuluttua';
  }

  @override
  String get view => 'Näytä';

  @override
  String get resumeReading => 'Jatka lukemista';

  @override
  String get read => 'Lukea';

  @override
  String resumeFrom(String position) {
    return 'Jatka osoitteesta $position';
  }

  @override
  String get play => 'Toista';

  @override
  String get startOver => 'Aloita alusta';

  @override
  String get restart => 'Käynnistä uudelleen';

  @override
  String get readOffline => 'Lue offline-tilassa';

  @override
  String get playOffline => 'Pelaa offline-tilassa';

  @override
  String get audio => 'Ääni';

  @override
  String get subtitles => 'Tekstitykset';

  @override
  String get version => 'Versio';

  @override
  String get cast => 'Lähetä laitteelle';

  @override
  String get trailer => 'Traileri';

  @override
  String get finished => 'Valmis';

  @override
  String get favorited => 'Suosikkiin';

  @override
  String get favorite => 'Suosikki';

  @override
  String get playlist => 'Soittolista';

  @override
  String get downloaded => 'Ladattu';

  @override
  String get downloadAll => 'Lataa kaikki';

  @override
  String get download => 'Lataa';

  @override
  String get deleteDownloaded => 'Poista ladatut';

  @override
  String get goToSeries => 'Siirry sarjaan';

  @override
  String get editMetadata => 'Muokkaa metatietoja';

  @override
  String get less => 'Vähemmän';

  @override
  String get more => 'Lisää';

  @override
  String get deleteItem => 'Poista kohde';

  @override
  String get deletePlaylist => 'Poista soittolista';

  @override
  String get deletePlaylistMessage =>
      'Poistetaanko tämä soittolista palvelimelta?';

  @override
  String get deleteItemMessage => 'Poistetaanko tämä kohde palvelimelta?';

  @override
  String get failedToDeletePlaylist => 'Soittolistan poistaminen epäonnistui';

  @override
  String get failedToDeleteItem => 'Kohteen poistaminen epäonnistui';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Nimeä soittolista uudelleen';

  @override
  String get playlistName => 'Soittolistan nimi';

  @override
  String get deleteDownloadedAlbum => 'Poista ladattu albumi';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Poistetaanko $title ladatut kappaleet?';
  }

  @override
  String get downloadedTracksDeleted => 'Ladatut kappaleet poistettu';

  @override
  String get downloadedTracksDeleteFailed =>
      'Joitakin ladattuja raitoja ei voitu poistaa';

  @override
  String get noTracksLoaded => 'Ei ladattuja raitoja';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Ei $itemLabel ladattu';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Ladataan $title ($count kohteita)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Haluatko varmasti poistaa \"$name\" palvelimelta? Tätä toimintoa ei voi kumota.';
  }

  @override
  String get itemDeleted => 'Kohde poistettu';

  @override
  String get noPlayableTrailerFound => 'Toistettavaa traileria ei löytynyt.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Kirjamuotoa ei tueta: .$extension';
  }

  @override
  String get audioTrack => 'Ääniraita';

  @override
  String get subtitleTrack => 'Tekstitysraita';

  @override
  String get none => 'Ei mitään';

  @override
  String get downloadSubtitlesLabel => 'Lataa tekstitykset...';

  @override
  String get searchOpenSubtitlesPlugin => 'Hae OpenSubtitles-laajennuksella';

  @override
  String get downloadSubtitles => 'Lataa tekstitykset';

  @override
  String get selectedSubtitleInvalid => 'Valittu tekstitys on virheellinen.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Tekstitys ladattu ja valittu: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Tekstitys ladattu. Saattaa kestää hetken, ennen kuin Jellyfin päivittää kohteen.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Etätekstitystä ei löytynyt haulle $language.';
  }

  @override
  String get selectVersion => 'Valitse Versio';

  @override
  String versionNumber(int number) {
    return 'Versio $number';
  }

  @override
  String get downloadAllQuality => 'Lataa kaikki – Laatu';

  @override
  String get downloadQuality => 'Lataa laatu';

  @override
  String get originalFileNoReencoding =>
      'Alkuperäinen tiedosto, ei uudelleenkoodausta';

  @override
  String get originalFilesNoReencoding =>
      'Alkuperäiset tiedostot, ei uudelleenkoodausta';

  @override
  String get noEpisodesLoaded => 'Ei ladattuja jaksoja';

  @override
  String downloadingItem(String name, String quality) {
    return 'Ladataan $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Poista ladatut tiedostot';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Poistetaanko paikalliset tiedostot $typeLabel?\n\nTämä vapauttaa tallennustilaa. Voit ladata uudelleen myöhemmin.';
  }

  @override
  String get downloadedFilesDeleted => 'Ladatut tiedostot poistettu';

  @override
  String get failedToDeleteFiles => 'Tiedostojen poistaminen epäonnistui';

  @override
  String get deleteFiles => 'Poista tiedostot';

  @override
  String get director => 'JOHTAJA';

  @override
  String get directors => 'OHJAUS';

  @override
  String get writer => 'KÄSIKIRJOITUS';

  @override
  String get writers => 'KÄSIKIRJOITTAJAT';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count lisää';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Jaksot';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Jakso $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Luku $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kappaletta',
      one: '1 kappale',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lukua',
      one: '1 luku',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Syntynyt $date';
  }

  @override
  String died(String date) {
    return 'Kuollut $date';
  }

  @override
  String age(int age) {
    return 'Ikä $age';
  }

  @override
  String get showLess => 'Näytä vähemmän';

  @override
  String get readMore => 'Lue lisää';

  @override
  String get shuffle => 'Sekoita';

  @override
  String get shuffleAllMusic => 'Soita kaikki musiikki satunnaisesti';

  @override
  String get carSignInPrompt => 'Kirjaudu Moonfiniin puhelimellasi';

  @override
  String get carServerUnreachable => 'Palvelimeen ei saada yhteyttä';

  @override
  String downloadsCount(int count) {
    return '$count lataukset';
  }

  @override
  String get perfectMatch => 'Täydellinen ottelu';

  @override
  String channelsCount(int count) {
    return '$count kan.';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Etätekstitys $action vaatii Jellyfin tekstityksen hallintaoikeudet tälle käyttäjälle.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Tätä kohdetta ei löytynyt etätekstityksen $action palvelimelta.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Etätekstitys $action epäonnistui: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Etätekstitys $action epäonnistui (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return '$action etätekstitys epäonnistui.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'kaikki ladatut jaksot \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'kaikki ladatut jaksot tällä kaudella';

  @override
  String get stillWatching => 'Katsotko edelleen?';

  @override
  String get unableToLoadTrailerStream => 'Trailerivirtaa ei voi ladata.';

  @override
  String get trailerTimedOut => 'Traileri aikakatkaistiin latauksen aikana.';

  @override
  String get playbackFailedForTrailer => 'Tämän trailerin toisto epäonnistui.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Suoratoisto ei ole käytettävissä offline-toiston aikana.';

  @override
  String castActionFailed(String label, String error) {
    return '$label toiminto epäonnistui: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Suoratoiston äänenvoimakkuuden asettaminen epäonnistui: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Ohjaimet';
  }

  @override
  String get deviceVolume => 'Laitteen äänenvoimakkuus';

  @override
  String get unavailable => 'Ei saatavilla';

  @override
  String get pause => 'Keskeytä';

  @override
  String get syncPosition => 'Synkronointipaikka';

  @override
  String stopCast(String label) {
    return 'Pysäytä $label';
  }

  @override
  String get queueIsEmpty => 'Jono on tyhjä';

  @override
  String trackNumber(int number) {
    return 'Seuraa $number';
  }

  @override
  String get remotePlayback => 'Kaukotoisto';

  @override
  String get castingToGoogleCast => 'Lähetetään Google Castiin';

  @override
  String get castingViaAirPlay => 'Suoratoisto AirPlayn kautta';

  @override
  String get castingViaDlna => 'Suoratoisto DLNA:n kautta';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekuntia';
  }

  @override
  String get longPressToUnlock => 'Avaa lukitus painamalla pitkään';

  @override
  String get off => 'Pois';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automaattinen';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Bittinopeuden ohitus';

  @override
  String get audioDelay => 'Äänen viive';

  @override
  String delayMinusMs(int value) {
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
  }

  @override
  String get subtitleDelay => 'Tekstityksen viive';

  @override
  String get reset => 'Nollaa';

  @override
  String get unknown => 'Tuntematon';

  @override
  String get playbackInformation => 'Toistotiedot';

  @override
  String get playback => 'Toisto';

  @override
  String get playMethod => 'Pelitapa';

  @override
  String get directPlay => 'Suora peli';

  @override
  String get directStream => 'Suora stream';

  @override
  String get transcoding => 'Transkoodaus';

  @override
  String get transcodeReasons => 'Transkoodauksen syyt';

  @override
  String get player => 'Soitin';

  @override
  String get container => 'Säiliö';

  @override
  String get bitrate => 'Bittinopeus';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Resoluutio';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Koodekki';

  @override
  String get videoBitrate => 'Videon bittinopeus';

  @override
  String get track => 'Raita';

  @override
  String get channels => 'Kanavat';

  @override
  String get audioBitrate => 'Äänen bittinopeus';

  @override
  String get sampleRate => 'Näytetaajuus';

  @override
  String get format => 'Muoto';

  @override
  String get external => 'Ulkoinen';

  @override
  String get embedded => 'Upotettu';

  @override
  String castSessionError(String protocol) {
    return '$protocol istuntovirhe';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Kirjan tietojen lataaminen epäonnistui: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-renderöinti sovelluksen sisällä ei ole vielä saatavilla tällä alustalla.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Tätä muotoa (.$extension) ei voi vielä renderöidä sovelluksen sisällä.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Upotettu asiakirjojen renderöinti ei ole käytettävissä tällä alustalla.';

  @override
  String get couldNotOpenExternalViewer =>
      'Ulkoista katseluohjelmaa ei voitu avata.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Sovelluksen sisäisen lukijan avaaminen epäonnistui: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Kirjanmerkki on jo tallennettu osoitteeseen $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Kirjanmerkki lisätty: $label';
  }

  @override
  String get noBookmarksYet =>
      'Ei vielä kirjanmerkkejä.\nTallenna sijaintisi napauttamalla kirjanmerkkikuvaketta lukiessasi.';

  @override
  String get noTableOfContentsAvailable =>
      'Sisällysluetteloa ei ole saatavilla';

  @override
  String pageLabel(int number) {
    return 'Sivu $number';
  }

  @override
  String get position => 'asema';

  @override
  String get bookReader => 'Kirjan lukija';

  @override
  String formatExtension(String extension) {
    return 'Muoto: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% luettu';
  }

  @override
  String get updating => 'Päivitetään...';

  @override
  String get markUnread => 'Merkitse lukemattomaksi';

  @override
  String get markAsRead => 'Merkitse luetuksi';

  @override
  String get reloadReader => 'Lataa Reader uudelleen';

  @override
  String get noPagesFound => 'Sivuja ei löytynyt.';

  @override
  String get failedToDecodePageImage => 'Sivun kuvan purkaminen epäonnistui.';

  @override
  String resetZoom(String zoom) {
    return 'Palauta zoomaus (${zoom}x)';
  }

  @override
  String get singlePage => 'Yksi sivu';

  @override
  String get twoPageSpread => 'Kaksisivuinen levitys';

  @override
  String get addBookmark => 'Lisää kirjanmerkki';

  @override
  String get bookmarksEllipsis => 'Kirjanmerkit...';

  @override
  String get markedAsRead => 'Merkitty luetuksi';

  @override
  String get markedAsUnread => 'Merkitty lukemattomaksi';

  @override
  String failedToUpdateReadState(String error) {
    return 'Lukutilan päivittäminen epäonnistui: $error';
  }

  @override
  String get themeSystem => 'Teema: Järjestelmä';

  @override
  String get themeLight => 'Teema: Valo';

  @override
  String get themeDark => 'Teema: Tumma';

  @override
  String get themeSepia => 'Teema: Seepia';

  @override
  String get invertColorsFixedLayout => 'Käänteiset värit (kiinteä asettelu)';

  @override
  String get invertColorsPdf => 'Käänteiset värit (PDF)';

  @override
  String get preparingInAppReader =>
      'Valmistellaan sovelluksen sisäistä lukijaa...';

  @override
  String get pdfDataNotAvailable => 'PDF-tietoja ei ole saatavilla.';

  @override
  String get readerFallbackModeActive => 'Lukijan varatila aktiivinen';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Tämä alusta ei voi isännöidä $extension-tiedostojen upotettua asiakirjamoottoria.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Käytä Reload Readeria vaihdettuasi tuettuun alustakohteeseen (Android, iOS, macOS).';

  @override
  String get openExternally => 'Avaa ulkoisesti';

  @override
  String get noEpubChaptersFound => 'EPUB-lukuja ei löytynyt.';

  @override
  String get readerNotReady => 'Lukija ei ole valmis.';

  @override
  String get seriesRecordings => 'Sarjan tallenteet';

  @override
  String get now => 'Nyt';

  @override
  String get sports => 'Urheilu';

  @override
  String get news => 'Uutiset';

  @override
  String get kids => 'Lapset';

  @override
  String get premiere => 'Ensiesitys';

  @override
  String get guideTimeline => 'Opas aikajana';

  @override
  String failedToLoadGuide(String error) {
    return 'Ohjeen lataus epäonnistui: $error';
  }

  @override
  String get noChannelsFound => 'Kanavia ei löytynyt';

  @override
  String get liveBadge => 'ELÄÄ';

  @override
  String guideNextProgram(String time, String title) {
    return 'Seuraavaksi: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes min jäljellä';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours t jäljellä';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours t $minutes min jäljellä';
  }

  @override
  String get movie => 'Elokuva';

  @override
  String get removedFromFavoriteChannels => 'Poistettu suosikkikanavilta';

  @override
  String get addedToFavoriteChannels => 'Lisätty suosikkikanaville';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Suosikkikanavan päivittäminen epäonnistui';

  @override
  String get unfavoriteChannel => 'Suosikki kanava';

  @override
  String get favoriteChannel => 'Suosikki kanava';

  @override
  String get record => 'Tallenna';

  @override
  String get cancelRecordingAction => 'Peruuta tallennus';

  @override
  String get programSetToRecord => 'Ohjelma asetettu tallentamaan';

  @override
  String get recordingCancelled => 'Tallennus peruutettu';

  @override
  String get unableToCreateRecording => 'Tallennusta ei voi luoda';

  @override
  String get watch => 'Katso';

  @override
  String get close => 'Sulje';

  @override
  String failedToPlayChannel(String name) {
    return 'Toistaminen epäonnistui $name';
  }

  @override
  String get failedToLoadRecordings => 'Tallenteiden lataaminen epäonnistui';

  @override
  String get scheduledInNext24Hours => 'Suunniteltu seuraavan 24 tunnin aikana';

  @override
  String get recentRecordings => 'Viimeaikaiset tallenteet';

  @override
  String get tvSeries => 'TV-sarja';

  @override
  String get failedToLoadSchedule => 'Aikataulun lataaminen epäonnistui';

  @override
  String get noScheduledRecordings => 'Ei ajoitettuja tallennuksia';

  @override
  String get cancelRecording => 'Peruutetaanko tallennus?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Perutaanko \"$name\" ajoitettu nauhoitus?';
  }

  @override
  String get no => 'Ei';

  @override
  String get yesCancel => 'Kyllä, peruuta';

  @override
  String get failedToCancelRecording =>
      'Tallennuksen peruuttaminen epäonnistui';

  @override
  String get failedToLoadSeriesRecordings =>
      'Sarjatallenteiden lataaminen epäonnistui';

  @override
  String get noSeriesRecordings => 'Ei sarjatallenteita';

  @override
  String get cancelSeriesRecording => 'Peruuta sarjan tallennus';

  @override
  String get cancelSeriesRecordingQuestion => 'Perutaanko sarjan tallennus?';

  @override
  String stopRecordingName(String name) {
    return 'Lopetetaanko $name tallennus?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Sarjan tallennuksen peruuttaminen epäonnistui';

  @override
  String get searchThisLibrary => 'Hae tästä kirjastosta...';

  @override
  String get searchEllipsis => 'Haku...';

  @override
  String noResultsForQuery(String query) {
    return 'Ei tuloksia haulle \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Haku epäonnistui: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr-tilin tyyppi';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Paikallinen';

  @override
  String get savedMedia => 'Tallennettu media';

  @override
  String get tvShows => 'TV-ohjelmat';

  @override
  String get music => 'Musiikki';

  @override
  String get musicAlbums => 'Musiikki-albumit';

  @override
  String get noMediaInFilter => 'Tässä suodattimessa ei ole mediaa';

  @override
  String get noDownloadedMediaYet => 'Ei vielä ladattua mediaa';

  @override
  String get browseLibrary => 'Selaa kirjastoa';

  @override
  String get deleteDownload => 'Poista lataus';

  @override
  String removeItemAndFiles(String name) {
    return 'Poistetaanko \"$name\" ja sen tiedostot?';
  }

  @override
  String tracksCount(int count) {
    return '$count kappaleita';
  }

  @override
  String get album => 'Albumi';

  @override
  String get playAlbum => 'Toista albumi';

  @override
  String failedToLoadAlbum(String error) {
    return 'Albumin lataaminen epäonnistui: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Ei ladattuja raitoja haulle $name.';
  }

  @override
  String get season => 'Kausi';

  @override
  String get errorLoadingEpisodes => 'Virhe ladattaessa jaksoja';

  @override
  String get noDownloadedEpisodes => 'Ei ladattuja jaksoja';

  @override
  String get deleteEpisode => 'Poista jakso';

  @override
  String removeName(String name) {
    return 'Poistetaanko \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'K$season J$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Jakso $number';
  }

  @override
  String get seriesNotFound => 'Sarjaa ei löydy';

  @override
  String get errorLoadingSeries => 'Virhe ladattaessa sarjaa';

  @override
  String get downloadedEpisodes => 'Ladatut jaksot';

  @override
  String seasonNumber(int number) {
    return 'Kausi $number';
  }

  @override
  String seasonChip(int number) {
    return 'K$number';
  }

  @override
  String get specials => 'Erikoistarjoukset';

  @override
  String get deleteSeason => 'Poista kausi';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Poistetaanko kaikki ladatut jaksot $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jaksoa',
      one: '1 jakso',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Tallennuksen hallinta';

  @override
  String get storageBreakdown => 'Varastoinnin erittely';

  @override
  String get downloadedItems => 'Ladatut kohteet';

  @override
  String get storageLimit => 'Tallennusrajoitus';

  @override
  String get noLimit => 'Ei rajaa';

  @override
  String get deleteAllDownloads => 'Poista kaikki lataukset';

  @override
  String get deleteAllDownloadsWarning =>
      'Tämä poistaa kaikki ladatut mediatiedostot, eikä sitä voi kumota.';

  @override
  String get deleteAll => 'Poista kaikki';

  @override
  String get deleteSelected => 'Poista valitut';

  @override
  String deleteSelectedCount(int count) {
    return 'Poistetaanko $count ladatut kohteet?';
  }

  @override
  String get musicAndAudiobooks => 'Musiikki ja äänikirjat';

  @override
  String get images => 'Kuvat';

  @override
  String get database => 'Tietokanta';

  @override
  String ofStorageLimit(String limit) {
    return '$limit-rajoituksesta';
  }

  @override
  String get settings => 'Asetukset';

  @override
  String get authentication => 'Todennus';

  @override
  String get autoLoginServerManagement =>
      'Automaattinen sisäänkirjautuminen, palvelimen hallinta';

  @override
  String get pinCode => 'PIN-koodi';

  @override
  String get setUpPinCodeProtection => 'Aseta PIN-koodisuojaus';

  @override
  String get parentalControls => 'Lapsilukko';

  @override
  String get contentRatingRestrictions => 'Sisällön ikärajoitukset';

  @override
  String get bitRateResolutionBehavior =>
      'Bittinopeus, resoluutio, käyttäytyminen';

  @override
  String get languageSizeAppearance => 'Kieli, koko, ulkonäkö';

  @override
  String get qualityStorage => 'Laatu, säilytys';

  @override
  String get serverSyncAndPluginStatus =>
      'Palvelimen synkronointi ja laajennuksen tila';

  @override
  String get mediaRequestIntegration => 'Mediapyyntöjen integrointi';

  @override
  String get switchServer => 'Vaihda palvelinta';

  @override
  String get signOut => 'Kirjaudu ulos';

  @override
  String get versionLicenses => 'Versio, lisenssit';

  @override
  String get account => 'Tili';

  @override
  String get signInAndSecurity => 'Sisäänkirjautuminen ja suojaus';

  @override
  String get administration => 'Hallinto';

  @override
  String get serverSettingsUsersLibraries =>
      'Palvelinasetukset, käyttäjät, kirjastot';

  @override
  String get customization => 'Räätälöinti';

  @override
  String get themeAndLayout => 'Teema ja asettelu';

  @override
  String get videoAndSubtitles => 'Video ja tekstitykset';

  @override
  String get integrations => 'Integraatiot';

  @override
  String get pluginAndRequests => 'Plugin ja pyynnöt';

  @override
  String get customizeAccountPlaybackInterface =>
      'Mukauta tiliä, toistoa ja käyttöliittymän toimintaa';

  @override
  String optionsCount(int count) {
    return '$count vaihtoehdot';
  }

  @override
  String get themeAndAppearance => 'Teema ja ulkoasu';

  @override
  String get focusBorderColor => 'Keskitä reunaväri';

  @override
  String get watchedIndicators => 'Katsotut indikaattorit';

  @override
  String get always => 'Aina';

  @override
  String get hideUnwatched => 'Piilota katsomattomat';

  @override
  String get episodesOnly => 'Vain jaksot';

  @override
  String get never => 'Ei koskaan';

  @override
  String get focusExpansionAnimation => 'Focus Expansion Animaatio';

  @override
  String get desktopUiScale => 'Työpöytäkäyttöliittymän asteikko';

  @override
  String get scaleFocusedCards =>
      'Skaalaa kohdennettuja tai leijuvia kortteja ja laattoja';

  @override
  String get backgroundBackdrops => 'Tausta taustat';

  @override
  String get showBackdropImages => 'Näytä taustakuvat sisällön takana';

  @override
  String get seriesThumbnails => 'Sarjan pikkukuvat';

  @override
  String get seriesThumbnailsDescription =>
      'Vain jaksot: käytä sarjakuvia, jotka vastaavat kutakin rivikuvatyyppiä';

  @override
  String get homeRowInfoOverlay => 'Kotirivin tiedot peittokuva';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Näytä otsikko ja metatiedot, kun selaat kotirivejä';

  @override
  String get clockDisplay => 'Kellon näyttö';

  @override
  String get inMenus => 'Valikoissa';

  @override
  String get inVideo => 'Videossa';

  @override
  String get seasonalEffects => 'Kausivaikutuksia';

  @override
  String get seasonalEffectsDescription =>
      'Visuaalisia tehosteita ja vuodenaikojen koristeita';

  @override
  String get snow => 'Lumi';

  @override
  String get fireworks => 'Ilotulitus';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Putoavia lehtiä';

  @override
  String get themeMusic => 'Teema Musiikki';

  @override
  String get playThemeMusicOnDetailPages =>
      'Toista teemamusiikkia tietosivuilla';

  @override
  String get themeMusicVolume => 'Teema Musiikki Volume';

  @override
  String get themeMusicSettingsSubtitle =>
      'Tietosivut, aloitusnäytön rivit ja äänenvoimakkuus';

  @override
  String percentValue(int value) {
    return '$value %';
  }

  @override
  String get themeMusicOnHomeRows => 'Teemamusiikki kotiriveillä';

  @override
  String get playWhenBrowsingHomeScreen => 'Toista aloitusnäyttöä selatessasi';

  @override
  String get loopThemeMusic => 'Toista tunnusmusiikkia jatkuvasti';

  @override
  String get loopThemeMusicSubtitle =>
      'Toista kappaletta jatkuvasti kertatoiston sijaan';

  @override
  String get detailsBackgroundBlur => 'Tiedot taustan sumennus';

  @override
  String pixelValue(int value) {
    return '$value px';
  }

  @override
  String get browsingBackgroundBlur => 'Selailun taustan sumennus';

  @override
  String get maxStreamingBitrate => 'Suurin suoratoiston bittinopeus';

  @override
  String get maxResolution => 'Max resoluutio';

  @override
  String get playerZoomMode => 'Soittimen zoomaustila';

  @override
  String get settingsScrollWheelAction => 'Hiiren rulla';

  @override
  String get settingsScrollWheelActionDescription =>
      'Valitse, mitä hiiren rullan pyörittäminen videon päällä tekee toiston aikana.';

  @override
  String get scrollWheelActionOff => 'Pois';

  @override
  String get scrollWheelActionSeek => 'Kelaus (eteen / taakse)';

  @override
  String get scrollWheelActionVolume => 'Äänenvoimakkuus';

  @override
  String get playerTooltipVolume => 'Äänenvoimakkuus';

  @override
  String get fit => 'Sopiva';

  @override
  String get autoCrop => 'Automaattinen rajaus';

  @override
  String get stretch => 'Venyttää';

  @override
  String get refreshRateSwitching => 'Virkistystaajuuden vaihto';

  @override
  String get disabled => 'Ei käytössä';

  @override
  String get scaleOnTv => 'Asteikko televisiossa';

  @override
  String get scaleOnDevice => 'Skaalaa laitteessa';

  @override
  String get trickPlay => 'Kelauksen esikatselu';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Näytä esikatselupikkukuvat etsiessäsi';

  @override
  String get showDescriptionOnPause => 'Näytä kuvaus tauolla';

  @override
  String get dimVideoShowOverview =>
      'Himmennä video ja näytä yleiskatsausteksti tauon aikana';

  @override
  String get osdLockButton => 'OSD-lukituspainike';

  @override
  String get osdLockButtonDescription =>
      'Näytä lukituspainike, joka estää kosketussyötön, kunnes sitä painetaan pitkään';

  @override
  String get audioBehavior => 'Äänen käyttäytyminen';

  @override
  String get downmixToStereo => 'Alasmiksaus stereoihin';

  @override
  String get defaultAudioLanguage => 'Äänen oletuskieli';

  @override
  String get fallbackAudioLanguage => 'Varaäänen kieli';

  @override
  String get preferDefaultAudioTrack => 'Suosi oletusääniraitaa';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Suosi alkuperäistä ääniraitaa dubatun sijaan.';

  @override
  String get preferAudioDescription => 'Suosi kuvailutulkkausraitoja';

  @override
  String get preferAudioDescriptionDescription =>
      'Suosi kuvailutulkkausraitoja tavallisten raitojen sijaan.';

  @override
  String get transcodingAudio => 'Transkoodaus (ääni)';

  @override
  String get directStreamRemux => 'Suora suoratoisto (remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transkoodaus (bittinopeus tai tarkkuus)';

  @override
  String get transcodingVideoAndAudio => 'Transkoodaus (video ja ääni)';

  @override
  String get transcodingVideo => 'Transkoodaus (video)';

  @override
  String get autoServerDefault => 'Automaattinen (palvelinoletus)';

  @override
  String get english => 'englanti';

  @override
  String get spanish => 'espanja';

  @override
  String get french => 'ranskalainen';

  @override
  String get german => 'saksaksi';

  @override
  String get italian => 'italialainen';

  @override
  String get portuguese => 'portugali';

  @override
  String get japanese => 'japanilainen';

  @override
  String get korean => 'korealainen';

  @override
  String get chinese => 'kiinalainen';

  @override
  String get russian => 'venäjäksi';

  @override
  String get arabic => 'arabia';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'hollantilainen';

  @override
  String get swedish => 'ruotsinkielinen';

  @override
  String get norwegian => 'norjalainen';

  @override
  String get danish => 'tanskalainen';

  @override
  String get finnish => 'suomalainen';

  @override
  String get polish => 'Kiillottaa';

  @override
  String get ac3Passthrough => 'AC3-läpivienti';

  @override
  String get dtsPassthrough => 'DTS-läpivienti';

  @override
  String get trueHdSupport => 'TrueHD-tuki';

  @override
  String get enableDtsPassthrough =>
      'Bittivirta DTS-ääni vain AVR:lle; vaatii vastaanottimen tuen ja DTS-lähderaidan';

  @override
  String get enableTrueHdAudio =>
      'Ota TrueHD-ääni käyttöön (ei välttämättä toimi kaikilla alustoilla)';

  @override
  String get settingsAudioOutputMode => 'Äänilähtötila';

  @override
  String get settingsAudioOutputModeDescription =>
      'Valitse, miten ääni puretaan. AVR-läpivienti lähettää Dolby- ja DTS-raakavirrat vahvistimeen, Automaattinen ja Alasmiksaus purkavat äänen laitteessa.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR-läpivienti';

  @override
  String get settingsAudioFallbackCodec => 'Audion varakoodekki';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Valitse kohdemuoto, johon monikanavaääni transkoodataan, kun lähdevirtaa ei voi toistaa suoraan tai viedä läpi.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Automaattinen tunnistus\n(suositus)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(oletus)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(häviötön)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(vain stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(tehokas)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(häviötön)';

  @override
  String get settingsMaxAudioChannels => 'Äänikanavien enimmäismäärä';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Määritä äänilaitteistosi kanavien enimmäismäärä. Tämän rajan ylittävät monikanavavirrat alasmiksataan tai transkoodataan.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Automaattinen tunnistus\n(laitteiston oletus)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 tilaääni';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 nelikanavaääni';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 tilaääni';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 tilaääni';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 tilaääni';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 tilaääni';

  @override
  String get settingsAudioPassthroughAdvanced => 'Läpivienti (edistynyt)';

  @override
  String get settingsAudioCodecPassthrough => 'Koodekin läpivienti';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Ota käyttöön vain muodot, joita AVR- tai HDMI-allas tukee.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3-läpivienti';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) Läpivienti';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core -läpivienti';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA -läpivienti';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD-läpivienti';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos -läpivienti';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) ulkoiseen dekooderiin.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos EAC3:n (JOC) kautta ulkoiseen dekooderiin.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bittivirta DTS-HD MA (sisältää DTS-ytimen) ulkoiseen dekooderiin.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD Atmos-metadatalla ulkoiseen dekooderiin.';

  @override
  String get settingsDetectedAudioCapabilities => 'Havaitut ääniominaisuudet';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Ajonaikaisten ominaisuuksien tilannekuvaa ei ole vielä saatavilla.';

  @override
  String get settingsAudioRouteLabel => 'Reitti';

  @override
  String get settingsAudioDecodeLabel => 'Dekoodaa';

  @override
  String get settingsAudioPassthroughLabel => 'Läpivienti';

  @override
  String get settingsAudioHdRoute => 'HD-äänen reitti';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Kaiutin';

  @override
  String get settingsAudioRouteHeadphones => 'Kuulokkeet';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostiikka';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Videon taso';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Videoalue';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Tekstityksen koodekki';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Sallitut äänikoodekit';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS -äänikoodekit';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 -äänikoodekit';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif-läpivienti';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Aktiivinen äänireitti';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Reitin HD-äänituki';

  @override
  String get nightMode => 'Yötila';

  @override
  String get compressDynamicRange => 'Pakkaa dynaaminen alue';

  @override
  String get advancedMpv => 'Kehittynyt mpv';

  @override
  String get enableCustomMpvConf => 'Ota mukautettu mpv.conf käyttöön';

  @override
  String get applyMpvConfBeforePlayback =>
      'Käytä käyttäjän määrittämää mpv.conf-tiedostoa ennen toiston alkamista';

  @override
  String get unsafeAdvancedMpvOptions => 'Vaaralliset mpv-lisäasetukset';

  @override
  String get unsafeMpvOptionsDescription =>
      'Salli laajempi joukko mpv-vaihtoehtoja. Saattaa häiritä toistokäyttäytymistä.';

  @override
  String get hardwareDecoding => 'Laitteiston dekoodaus';

  @override
  String get hardwareDecodingSubtitle =>
      'Saattaa parantaa suorituskykyä, mutta voi aiheuttaa toistoongelmia joissakin laitteissa.';

  @override
  String get nextUpAndQueuing => 'Seuraava ylös ja jonotus';

  @override
  String get nextUpDisplay => 'Seuraava näyttö';

  @override
  String get extended => 'Laajennettu';

  @override
  String get minimal => 'Minimaalinen';

  @override
  String get nextUpTimeout => 'Seuraava aikakatkaisu';

  @override
  String secondsValue(int value) {
    return '$value s';
  }

  @override
  String get mediaQueuing => 'Median jonotus';

  @override
  String get autoQueueNextEpisodes =>
      'Aseta seuraavat jaksot automaattisesti jonoon';

  @override
  String get stillWatchingPrompt => 'Katsotaan edelleen kehotetta';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes jaksojen jälkeen / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Jatka & Ohita';

  @override
  String get resumeRewind => 'Jatka taaksepäinkelausta';

  @override
  String get unpauseRewind => 'Peruuta kelaus taaksepäin';

  @override
  String get fiveSeconds => '5 sekuntia';

  @override
  String get tenSeconds => '10 sekuntia';

  @override
  String get fifteenSeconds => '15 sekuntia';

  @override
  String get thirtySeconds => '30 sekuntia';

  @override
  String get skipBackLength => 'Ohita takaosan pituus';

  @override
  String get skipForwardLength => 'Ohita pituus eteenpäin';

  @override
  String get customMpvConfPath => 'Mukautettu mpv.conf-polku';

  @override
  String get notSetMpvConf =>
      'Ei asetettu. Moonfin yrittää oletusarvoista mpv.conf-tiedostoa app/data-kansioissa.';

  @override
  String get selectMpvConf => 'Valitse mpv.conf';

  @override
  String get pathToMpvConf => '/polku/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Tyyliasetukset (koko, väri, offset) koskevat tekstipohjaisia ​​tekstityksiä (SRT, VTT, TTML). ASS/SSA-tekstitykset käyttävät omaa upotettua tyyliään, ellei \"ASS/SSA Direct Play\" ole poistettu käytöstä. Bittikarttatekstitystä (PGS, DVB, VobSub) ei voi muokata uudelleen.';

  @override
  String get defaultSubtitleLanguage => 'Tekstityksen oletuskieli';

  @override
  String get defaultToNoSubtitles => 'Oletuksena Ei tekstityksiä';

  @override
  String get turnOffSubtitlesByDefault =>
      'Poista tekstitykset oletusarvoisesti käytöstä';

  @override
  String get subtitleSize => 'Tekstityksen koko';

  @override
  String get textFillColor => 'Tekstin täyttöväri';

  @override
  String get backgroundColor => 'Taustaväri';

  @override
  String get textStrokeColor => 'Tekstin viivan väri';

  @override
  String get subtitleCustomization => 'Tekstityksen mukauttaminen';

  @override
  String get subtitleCustomizationDescription =>
      'Mukauta tekstityksen ulkoasua';

  @override
  String get subtitleMode => 'Tekstitystila';

  @override
  String get subtitleModeFlagged => 'Merkityt';

  @override
  String get subtitleModeAlways => 'Aina';

  @override
  String get subtitleModeForeign => 'Vieraskieliset';

  @override
  String get subtitleModeForced => 'Pakotetut';

  @override
  String get subtitleModeFlaggedDescription =>
      'Toistaa raidat, jotka on merkitty mediatiedoston metatiedoissa \"oletukseksi\" tai \"pakotetuiksi\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Lataa ja näyttää tekstitykset automaattisesti aina, kun video alkaa.';

  @override
  String get subtitleModeForeignDescription =>
      'Ottaa tekstitykset käyttöön automaattisesti, jos oletusääniraita on vieraskielinen.';

  @override
  String get subtitleModeForcedDescription =>
      'Lataa vain ne tekstitykset, jotka on nimenomaisesti merkitty pakotetuiksi.';

  @override
  String get subtitleModeNoneDescription =>
      'Poistaa tekstitysten automaattisen lataamisen kokonaan käytöstä.';

  @override
  String get fallbackSubtitleLanguage => 'Varatekstityksen kieli';

  @override
  String get subtitleStream => 'Tekstitysvirta';

  @override
  String get subtitlePreviewText =>
      'Nopea ruskea kettu hyppää laiskan koiran yli';

  @override
  String get verticalOffset => 'Pystysuuntainen siirtymä';

  @override
  String get pgsDirectPlay => 'Suora PGS-toisto';

  @override
  String get directPlayPgsSubtitles => 'Suoratoisto PGS-tekstitykset';

  @override
  String get assSsaDirectPlay => 'Suora ASS/SSA-toisto';

  @override
  String get directPlayAssSsaSubtitles => 'Suoratoisto ASS/SSA tekstityksellä';

  @override
  String get white => 'Valkoinen';

  @override
  String get black => 'Musta';

  @override
  String get yellow => 'Keltainen';

  @override
  String get green => 'Vihreä';

  @override
  String get cyan => 'Syaani';

  @override
  String get red => 'Punainen';

  @override
  String get transparent => 'Läpinäkyvä';

  @override
  String get semiTransparentBlack => 'Puoliksi läpinäkyvä musta';

  @override
  String get global => 'Maailmanlaajuinen';

  @override
  String get desktop => 'Työpöytä';

  @override
  String get mobile => 'mobiili';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile profiiliasetukset ladattu.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile profiiliasetusten lataaminen epäonnistui.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Paikalliset asetukset synkronoitu $profile-profiiliin.';
  }

  @override
  String get customizationProfile => 'Räätälöintiprofiili';

  @override
  String get customizationProfileDescription =>
      'Valitse ladattava, muokattava ja synkronoitava profiili. Yleinen koskee kaikkialla, ellei laiteprofiili ohita sitä. Vihreä piste merkitsee nykyistä laiteprofiiliasi.';

  @override
  String get loadProfile => 'Lataa profiili';

  @override
  String get syncing => 'Synkronoidaan...';

  @override
  String get syncToProfile => 'Synkronoi profiiliin';

  @override
  String get profileSyncHidden => 'Profiilin synkronointi piilotettu';

  @override
  String get enablePluginSyncDescription =>
      'Ota Palvelinlaajennuksen synkronointi käyttöön Plugin-asetuksissa, jotta profiiliohjaimet näkyvät tässä.';

  @override
  String get quality => 'Laatu';

  @override
  String get defaultDownloadQuality => 'Latauksen oletuslaatu';

  @override
  String get network => 'Verkko';

  @override
  String get wifiOnlyDownloads => 'Vain WiFi-lataukset';

  @override
  String get reportDownloadsActivity => 'Näytä lataukset palvelimella';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Anna palvelimen ylläpitäjän nähdä transkoodatut lataukset hallintapaneelissa';

  @override
  String get onlyDownloadOnWifi =>
      'Lataa vain WiFi-yhteyden ollessa kytkettynä';

  @override
  String get storage => 'Varastointi';

  @override
  String get storageUsed => 'Säilytys käytetty';

  @override
  String get manage => 'Hallitse';

  @override
  String get calculating => 'Lasketaan...';

  @override
  String get downloadLocation => 'Lataa sijainti';

  @override
  String get defaultLabel => 'Oletus';

  @override
  String get saveToDownloadsFolder => 'Tallenna Lataukset-kansioon';

  @override
  String get downloadsVisibleToOtherApps =>
      'Lataukset/Moonfin – näkyy muille sovelluksille';

  @override
  String get dangerZone => 'Vaaravyöhyke';

  @override
  String get clearAllDownloads => 'Tyhjennä kaikki lataukset';

  @override
  String get original => 'Alkuperäinen';

  @override
  String get changeDownloadLocation => 'Muuta latauspaikkaa';

  @override
  String get changeDownloadLocationDescription =>
      'Uudet lataukset tallennetaan valittuun kansioon. Nykyiset lataukset pysyvät nykyisessä paikassaan, ja niitä voidaan hallita tallennusasetuksista.';

  @override
  String get confirm => 'Vahvistaa';

  @override
  String get cannotWriteToFolder =>
      'Valittuun kansioon ei voi kirjoittaa. Valitse toinen sijainti tai myönnä tallennusoikeudet.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Tallennetaanko Lataukset-kansioon?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Ladattu media tallennetaan laitteesi Downloads/Moonfin-kansioon. Nämä tiedostot näkyvät muille sovelluksille, kuten galleriallesi tai musiikkisoittimellesi.\n\nNykyiset lataukset säilyvät nykyisessä paikassaan.';

  @override
  String get enable => 'Ota käyttöön';

  @override
  String get clearAllDownloadsWarning =>
      'Tämä poistaa kaiken ladatun median, eikä sitä voi kumota.';

  @override
  String get clearAll => 'Tyhjennä kaikki';

  @override
  String get navigationStyle => 'Navigointityyli';

  @override
  String get topBar => 'Yläpalkki';

  @override
  String get leftSidebar => 'Vasen sivupalkki';

  @override
  String get showShuffleButton => 'Näytä satunnaistoistopainike';

  @override
  String get showGenresButton => 'Näytä genret -painike';

  @override
  String get showFavoritesButton => 'Näytä suosikit-painike';

  @override
  String get showLibrariesInToolbar => 'Näytä kirjastot työkalupalkissa';

  @override
  String get navbarAlwaysExpanded => 'Näytä navigointipalkin tekstit aina';

  @override
  String get showSeerrButton => 'Näytä Seerr-painike';

  @override
  String get navbarOpacity => 'Navbarin läpinäkyvyys';

  @override
  String get navbarColor => 'Navipalkin väri';

  @override
  String get gray => 'Harmaa';

  @override
  String get darkBlue => 'Tummansininen';

  @override
  String get purple => 'Violetti';

  @override
  String get teal => 'Sinivihreä';

  @override
  String get navy => 'Laivasto';

  @override
  String get charcoal => 'Puuhiili';

  @override
  String get brown => 'Ruskea';

  @override
  String get darkRed => 'Tummanpunainen';

  @override
  String get darkGreen => 'Tummanvihreä';

  @override
  String get slate => 'Liuskekivi';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Kirjaston näyttö';

  @override
  String get posterLabel => 'Juliste';

  @override
  String get thumbnailLabel => 'Pikkukuva';

  @override
  String get bannerLabel => 'Banneri';

  @override
  String get overridePerLibrarySettings => 'Ohita kirjastokohtaiset asetukset';

  @override
  String get applyImageTypeToAllLibraries =>
      'Käytä kuvatyyppiä kaikissa kirjastoissa';

  @override
  String get multiServerLibraries => 'Usean palvelimen kirjastot';

  @override
  String get showLibrariesFromAllServers =>
      'Näytä kaikkien yhdistettyjen palvelimien kirjastot';

  @override
  String get enableFolderView => 'Ota käyttöön kansionäkymä';

  @override
  String get showFolderBrowsingOption => 'Näytä kansion selausvaihtoehto';

  @override
  String get groupItemsIntoCollections => 'Ryhmittele kohteet kokoelmiin';

  @override
  String get hideCollectionAssociatedItems =>
      'Piilota kokoelmiin kuuluvat kirjastokohteet kirjastoja selatessa';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Kirjaston ryhmittelyn huomautus';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Jotta voit käyttää tätä asetusta, varmista, että kirjaston näyttöasetuksissa Jellyfin- tai Emby-palvelimellasi on käytössä \"Ryhmittele elokuvat kokoelmiin\" ja/tai \"Ryhmittele sarjat kokoelmiin\".';

  @override
  String get libraryVisibility => 'Kirjaston näkyvyys';

  @override
  String get libraryVisibilityDescription =>
      'Vaihda etusivun näkyvyys kirjastoittain. Käynnistä Moonfin uudelleen, jotta muutokset tulevat voimaan.';

  @override
  String get showInNavigation => 'Näytä navigoinnissa';

  @override
  String get showInLatestMedia => 'Näytä uusimmassa mediassa';

  @override
  String get sourceLibraries => 'Lähdekirjastot';

  @override
  String get sourceCollections => 'Lähdekokoelmat';

  @override
  String get excludedGenres => 'Poissuljetut genret';

  @override
  String get selectAll => 'Valitse Kaikki';

  @override
  String itemsSelected(int count) {
    return '$count valittu';
  }

  @override
  String get mediaBar => 'Mediapalkki';

  @override
  String get mediaSources => 'Medialähteet';

  @override
  String get behavior => 'Käyttäytyminen';

  @override
  String get seconds => 'sekuntia';

  @override
  String get localPreviews => 'Paikalliset esikatselut';

  @override
  String get localPreviewsDescription =>
      'Määritä trailerin, median ja äänen esikatselut.';

  @override
  String get mediaBarMode => 'Mediapalkin tyyli';

  @override
  String get mediaBarModeDescription =>
      'Valitse eri mediapalkkityylien välillä tai poista mediapalkki käytöstä';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Pois';

  @override
  String get enableMediaBar => 'Ota Media Bar käyttöön';

  @override
  String get showFeaturedContentSlideshow =>
      'Näytä suositellun sisällön diaesitys kotona';

  @override
  String get contentType => 'Sisältötyyppi';

  @override
  String get moviesAndTvShows => 'Elokuvat ja TV-ohjelmat';

  @override
  String get moviesOnly => 'Vain elokuvat';

  @override
  String get tvShowsOnly => 'Vain TV-ohjelmat';

  @override
  String get itemCount => 'Tuotemäärä';

  @override
  String get noneSelected => 'Ei valittu';

  @override
  String get noneExcluded => 'Ei poissuljettu';

  @override
  String get autoAdvance => 'Automaattinen eteneminen';

  @override
  String get autoAdvanceSlides => 'Siirry automaattisesti seuraavaan diaan';

  @override
  String get autoAdvanceInterval => 'Automaattisen vaihdon väli';

  @override
  String get trailerPreview => 'Trailerin esikatselu';

  @override
  String get autoPlayTrailers =>
      'Toista trailerit automaattisesti mediapalkissa 3 sekunnin kuluttua';

  @override
  String get trailerAudio => 'Trailerin ääni';

  @override
  String get enableTrailerAudio => 'Ota trailerien ääni käyttöön mediapalkissa';

  @override
  String get episodePreview => 'Jakson esikatselu';

  @override
  String get mediaPreview => 'Median esikatselu';

  @override
  String get episodePreviewDescription =>
      'Pelaa 30 sekunnin rivin esikatselu tarkennetuilla, leijutetuilla tai pitkään painetuilla korteilla';

  @override
  String get mediaPreviewDescription =>
      'Pelaa 30 sekunnin rivin esikatselu tarkennetuilla, leijutetuilla tai pitkään painetuilla korteilla';

  @override
  String get previewAudio => 'Äänen esikatselu';

  @override
  String get enablePreviewAudio =>
      'Ota ääni käyttöön trailerien ja jaksojen esikatseluissa';

  @override
  String get latestMedia => 'Uusin Media';

  @override
  String get recentlyReleased => 'Äskettäin julkaistu';

  @override
  String get myMedia => 'Oma Media';

  @override
  String get myMediaSmall => 'Oma media (pieni)';

  @override
  String get continueWatching => 'Jatka katselua';

  @override
  String get resumeAudio => 'Jatka äänentoistoa';

  @override
  String get resumeBooks => 'Jatka Kirjat';

  @override
  String get activeRecordings => 'Aktiiviset tallenteet';

  @override
  String get playlists => 'Soittolistat';

  @override
  String get liveTV => 'Live-TV';

  @override
  String get homeSections => 'Kotisivut';

  @override
  String get resetToDefaults => 'Palauta oletusasetukset';

  @override
  String get homeRowPosterSize => 'Kotirivin julisteen koko';

  @override
  String get perRowImageTypeSelection => 'Rivikohtainen kuvatyypin valinta';

  @override
  String get configureImageTypeForEachRow =>
      'Määritä kuvatyyppi kullekin käytössä olevalle kotiriville';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Yhdistä Jatka katselua ja Seuraava';

  @override
  String get combineBothRows => 'Yhdistä molemmat rivit yhdeksi kotiosioon';

  @override
  String get fullScreenRows => 'Laajennetut aloitusnäytön rivit';

  @override
  String get fullScreenRowsDescription =>
      'Näytä vain yksi aloitusnäytön rivi kerrallaan';

  @override
  String get perRowImageType => 'Rivikuvatyypin mukaan';

  @override
  String get perRowSettings => 'Rivikohtaiset asetukset';

  @override
  String get autoLogin => 'Automaattinen sisäänkirjautuminen';

  @override
  String get lastUser => 'Viimeinen käyttäjä';

  @override
  String get currentUser => 'Nykyinen käyttäjä';

  @override
  String get alwaysAuthenticate => 'Todenna aina';

  @override
  String get requirePasswordWithToken =>
      'Vaadi salasana jopa tallennetun tunnuksen kanssa';

  @override
  String get confirmExit => 'Vahvista poistuminen';

  @override
  String get showConfirmationBeforeExiting =>
      'Näytä vahvistus ennen poistumista';

  @override
  String get blockContentWithRatings =>
      'Estä sisältö seuraavilla luokituksilla:';

  @override
  String get noContentRatingsFound =>
      'Tältä palvelimelta ei ole vielä löytynyt sisällön luokituksia.';

  @override
  String get couldNotLoadServerRatings =>
      'Palvelimen arvioita ei voitu ladata. Näytetään vain tallennetut arviot.';

  @override
  String get couldNotRefreshRatings =>
      'Arvioita ei voitu päivittää palvelimelta. Näytetään tallennetut arviot.';

  @override
  String get enablePinCode => 'Ota PIN-koodi käyttöön';

  @override
  String get requirePinToAccess => 'Vaadi PIN-koodi päästäksesi tilillesi';

  @override
  String get changePin => 'Vaihda PIN';

  @override
  String get setNewPinCode => 'Aseta uusi PIN-koodi';

  @override
  String get removePin => 'Poista PIN';

  @override
  String get removePinProtection => 'Poista PIN-koodisuojaus';

  @override
  String get screensaver => 'Näytönsäästäjä';

  @override
  String get inAppScreensaver => 'Sovelluksen sisäinen näytönsäästäjä';

  @override
  String get enableBuiltInScreensaver =>
      'Ota sisäänrakennettu näytönsäästäjä käyttöön';

  @override
  String get mode => 'Tila';

  @override
  String get libraryArt => 'Kirjasto Art';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Kello';

  @override
  String get timeout => 'Aikakatkaisu';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Himmennystaso';

  @override
  String get maxAgeRating => 'Max ikäluokitus';

  @override
  String get any => 'Mikä tahansa';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Vaadi ikäluokitus';

  @override
  String get onlyShowRatedContent => 'Näytä vain arvioitu sisältö';

  @override
  String get showClock => 'Näytä kello';

  @override
  String get displayClockDuringScreensaver =>
      'Näytä kello näytönsäästäjän aikana';

  @override
  String get clockModeStatic => 'Paikallaan';

  @override
  String get clockModeBouncing => 'Pomppiva';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (kriitikot)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (yleisö)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakriittinen';

  @override
  String get metacriticUser => 'Metacritic (käyttäjä)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Kirjelaatikkod';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Yhteisön luokitus';

  @override
  String get ratings => 'Arviot';

  @override
  String get additionalRatings => 'Lisäluokitukset';

  @override
  String get showMdbListAndTmdbRatings => 'Näytä MDBList- ja TMDB-luokitukset';

  @override
  String get ratingLabels => 'Luokitustarrat';

  @override
  String get showLabelsNextToIcons =>
      'Näytä tunnisteet luokituskuvakkeiden vieressä';

  @override
  String get ratingBadges => 'Arviointimerkit';

  @override
  String get showDecorativeBadges =>
      'Näytä koristeelliset merkit arvioiden takana';

  @override
  String get episodeRatings => 'Jaksojen arviot';

  @override
  String get showRatingsOnEpisodes => 'Näytä yksittäisten jaksojen arviot';

  @override
  String get ratingSources => 'Arviointilähteet';

  @override
  String get ratingSourcesDescription =>
      'Ota käyttöön ja järjestele uudelleen sovelluksessa näkyvät luokituslähteet';

  @override
  String get pluginLabel => 'Moonbase-laajennus';

  @override
  String get pluginDetected => 'Plugin havaittu';

  @override
  String get pluginNotDetected => 'Laajennusta ei havaittu';

  @override
  String get pluginDetectedDescription =>
      'Palvelinlaajennus havaittu. Synkronointi otetaan käyttöön automaattisesti, kun laajennus löydetään ensimmäisen kerran.';

  @override
  String get pluginNotDetectedDescription =>
      'Palvelinlaajennusta ei tällä hetkellä havaita. Paikalliset asetukset käyttävät edelleen tallennettuja arvojaan tai sisäänrakennettuja oletusasetuksia.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersio: $version';
  }

  @override
  String get availableServices => 'Käytettävissä olevat palvelut';

  @override
  String get serverPluginSync => 'Palvelinlaajennuksen synkronointi';

  @override
  String get syncSettingsWithPlugin =>
      'Synkronoi asetukset palvelinlaajennuksen kanssa';

  @override
  String get whatSyncControls => 'Mitä synkronointia ohjataan';

  @override
  String get syncControlsDescription =>
      'Synkronointi hallitsee vain sitä, lähetetäänkö laajennusten tukemat asetukset palvelimelle ja vedetäänkö ne sieltä. Profiilin valinta ja profiilin synkronointitoiminnot ovat mukautusasetuksissa, kun laajennuksen synkronointi on käytössä.';

  @override
  String get recentRequests => 'Viimeaikaiset pyynnöt';

  @override
  String get recentlyAdded => 'Äskettäin lisätty';

  @override
  String get trending => 'Trendaavat';

  @override
  String get popularMovies => 'Suosittuja elokuvia';

  @override
  String get movieGenres => 'Elokuvatyypit';

  @override
  String get upcomingMovies => 'Tulevia elokuvia';

  @override
  String get studios => 'Studiot';

  @override
  String get popularSeries => 'Suosittu sarja';

  @override
  String get seriesGenres => 'Sarjan genret';

  @override
  String get upcomingSeries => 'Tuleva sarja';

  @override
  String get networks => 'Verkot';

  @override
  String get seerrDiscoveryRows => 'Seerr-löytörivit';

  @override
  String get resetRowsToDefaults => 'Palauta rivit oletusarvoihin';

  @override
  String get enableSeerr => 'Ota Seerr käyttöön';

  @override
  String get showSeerrInNavigation =>
      'Näytä Seerr navigoinnissa (vaatii palvelinlaajennuksen)';

  @override
  String get seerrUnavailable =>
      'Ei saatavilla, koska palvelinlaajennuksen Seerr-tuki on poistettu käytöstä.';

  @override
  String get nsfwFilter => 'NSFW suodatin';

  @override
  String get hideAdultContent =>
      'Piilota vain aikuisille suunnattu sisältö tuloksissa';

  @override
  String get seerrNotificationsSection => 'Ilmoitukset';

  @override
  String get seerrNotifyNewRequestsTitle => 'Ilmoitukset uusista pyynnöistä';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Ilmoita minulle, kun joku lähettää pyynnön';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Pyyntöjen päivitykset';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Hyväksytty, hylätty ja lisätty kirjastoosi';

  @override
  String get seerrNotifyIssuesTitle => 'Ongelmien päivitykset';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Uudet ongelmat, vastaukset ja ratkaisut';

  @override
  String loggedInAs(String username) {
    return 'Kirjautunut sisään nimellä: $username';
  }

  @override
  String get discoverRows => 'Seerrin Discover-sivu';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Ota käyttöön rivit, jotka haluat nähdä Seerrin etusivulla. Järjestä uudelleen vetämällä. Mukautettu järjestys synkronoituu Moonbasen kanssa.';

  @override
  String get discoverRowsDescription =>
      'Ota käyttöön rivit, jotka haluat nähdä Seerrin etusivulla. Järjestä uudelleen vetämällä. Mukautettu järjestys synkronoituu Moonbasen kanssa.';

  @override
  String get enabled => 'Käytössä';

  @override
  String get hidden => 'Piilotettu';

  @override
  String get aboutTitle => 'Noin';

  @override
  String versionValue(String version) {
    return 'Versio $version';
  }

  @override
  String get openSourceLicenses => 'Avoimen lähdekoodin lisenssit';

  @override
  String get sourceCode => 'Lähdekoodi';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Tarkista päivitykset nyt';

  @override
  String get checksLatestDesktopRelease =>
      'Tarkistaa tämän alustan uusimman työpöytäjulkaisun';

  @override
  String get youAreUpToDate => 'Olet ajan tasalla.';

  @override
  String get couldNotCheckForUpdates =>
      'Päivityksiä ei voitu tarkistaa juuri nyt.';

  @override
  String get noCompatibleUpdate =>
      'Tälle alustalle ei löytynyt yhteensopivaa päivityspakettia.';

  @override
  String get updateChecksNotSupported =>
      'Päivitystarkistuksia ei tueta tällä alustalla.';

  @override
  String get updateNotificationsDisabled =>
      'Päivitysilmoitukset on poistettu käytöstä.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Odota ennen kuin tarkistat uudelleen.';

  @override
  String get latestUpdateAlreadyShown => 'Viimeisin päivitys näytettiin jo.';

  @override
  String get updateAvailable => 'Päivitys saatavilla.';

  @override
  String updateAvailableVersion(String version) {
    return 'Päivitys saatavilla: v$version';
  }

  @override
  String get updateNotifications => 'Päivitä ilmoitukset';

  @override
  String get showWhenUpdatesAvailable => 'Näytä, kun päivityksiä on saatavilla';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Saatavilla';
  }

  @override
  String get readReleaseNotes => 'Lue julkaisutiedot';

  @override
  String get downloadingUpdate => 'Ladataan päivitystä...';

  @override
  String get updateDownloadFailed =>
      'Päivityksen lataus epäonnistui. Yritä uudelleen.';

  @override
  String get openReleasesPage => 'Avaa Julkaisusivu';

  @override
  String get navigation => 'Navigointi';

  @override
  String get watchedIndicatorsBackdrops => 'Katsotut indikaattorit, taustat';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Tarkennusväri, katsotut indikaattorit, taustat';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navigointipalkin tyyli, työkalupalkin painikkeet, ulkonäkö';

  @override
  String get reorderToggleHomeRows => 'Järjestä ja vaihda kotirivejä uudelleen';

  @override
  String get featuredContentAppearance => 'Suositeltu sisältö, ulkonäkö';

  @override
  String get posterSizeImageTypeFolderView =>
      'Julisteen koko, kuvatyyppi, kansionäkymä';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB ja luokituslähteet';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Kuvavälimuistin raja';

  @override
  String get clearImageCache => 'Tyhjennä kuvavälimuisti';

  @override
  String get imageCacheCleared => 'Kuvavälimuisti tyhjennetty';

  @override
  String get clear => 'Tyhjennä';

  @override
  String get browse => 'Selaa';

  @override
  String get noResults => 'Ei tuloksia';

  @override
  String get seerrAvailableStatus => 'Saatavilla';

  @override
  String get seerrRequestedStatus => 'Pyydetty';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Ladataan · $percent %';
  }

  @override
  String get seerrImportingStatus => 'Tuodaan';

  @override
  String itemsCount(int count) {
    return '$count Kohteet';
  }

  @override
  String get seerrSettings => 'Seerrin asetukset';

  @override
  String get requestMore => 'Pyydä lisää';

  @override
  String get request => 'Pyytää';

  @override
  String get cancelRequest => 'Peruuta pyyntö';

  @override
  String get playInMoonfin => 'Pelaa Moonfinissä';

  @override
  String requestedByName(String name) {
    return 'Pyytäjä $name';
  }

  @override
  String get approve => 'Hyväksyä';

  @override
  String get declineAction => 'Hylkää';

  @override
  String get similar => 'Samanlainen';

  @override
  String get recommendations => 'Suositukset';

  @override
  String cancelRequestForTitle(String title) {
    return 'Perutaanko pyyntö \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Perutaanko $count pyynnöt \"$title\"?';
  }

  @override
  String get keep => 'Pitää';

  @override
  String get itemNotFoundInLibrary => 'Kohdetta ei löydy Moonfin-kirjastostasi';

  @override
  String get errorSearchingLibrary => 'Virhe haettaessa kirjastoa';

  @override
  String budgetAmount(String amount) {
    return 'Budjetti: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Tulot: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Pyyntö $type';
  }

  @override
  String get submitRequest => 'Lähetä pyyntö';

  @override
  String get allSeasons => 'Kaikki vuodenajat';

  @override
  String get advancedOptions => 'Lisäasetukset';

  @override
  String get noServiceServersConfigured =>
      'Palvelupalvelimia ei ole määritetty';

  @override
  String get server => 'Palvelin';

  @override
  String get qualityProfile => 'Laatuprofiili';

  @override
  String get rootFolder => 'Juurikansio';

  @override
  String get showMore => 'Näytä lisää';

  @override
  String get appearances => 'Esiintymiset';

  @override
  String get crewSection => 'Miehistö';

  @override
  String ageValue(int age) {
    return 'ikä $age';
  }

  @override
  String get noRequests => 'Ei pyyntöjä';

  @override
  String get pendingStatus => 'Odottaa';

  @override
  String get declinedStatus => 'Hylätty';

  @override
  String get partiallyAvailable => 'Osittain saatavilla';

  @override
  String get downloadingStatus => 'Ladataan';

  @override
  String get approvedStatus => 'Hyväksytty';

  @override
  String get notRequestedStatus => 'Ei pyydetty';

  @override
  String get blocklistedStatus => 'Estolistalla';

  @override
  String get deletedStatus => 'Poistettu';

  @override
  String get failedStatus => 'Epäonnistui';

  @override
  String get processingStatus => 'Käsitellään';

  @override
  String modifiedByName(String name) {
    return 'Muokkaaja: $name';
  }

  @override
  String get completedStatus => 'Valmis';

  @override
  String get requestErrorDuplicate => 'Tämä nimike on jo pyydetty';

  @override
  String get requestErrorQuota => 'Pyyntöraja saavutettu';

  @override
  String get requestErrorBlocklisted => 'Tämä nimike on estolistalla';

  @override
  String get requestErrorNoSeasons => 'Ei enää pyydettäviä kausia';

  @override
  String get requestErrorPermission =>
      'Sinulla ei ole oikeutta tehdä tätä pyyntöä';

  @override
  String get seerrRequestsTitle => 'Pyynnöt';

  @override
  String get seerrIssuesTitle => 'Ongelmat';

  @override
  String get sortNewest => 'Uusimmat';

  @override
  String get sortLastModified => 'Viimeksi muokattu';

  @override
  String get noIssues => 'Ei ongelmia';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining/$limit elokuvapyyntöä jäljellä';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining/$limit kausipyyntöä jäljellä';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Osa kokoelmaa: $name';
  }

  @override
  String get viewCollection => 'Näytä kokoelma';

  @override
  String get requestCollection => 'Pyydä kokoelma';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total elokuvaa · $available saatavilla';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Pyydä $count elokuvaa';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Pyydetään $current/$total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Pyydettiin $count elokuvaa';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Pyydettiin $ok/$total elokuvasta';
  }

  @override
  String get collectionAllRequested =>
      'Kaikki elokuvat ovat jo saatavilla tai pyydetty';

  @override
  String get reportIssue => 'Ilmoita ongelmasta';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Ääni';

  @override
  String get whatsWrong => 'Mikä on vialla?';

  @override
  String get allEpisodes => 'Kaikki jaksot';

  @override
  String get episode => 'Jakso';

  @override
  String get openStatus => 'Avoin';

  @override
  String get resolvedStatus => 'Ratkaistu';

  @override
  String get resolveAction => 'Merkitse ratkaistuksi';

  @override
  String get reopenAction => 'Avaa uudelleen';

  @override
  String reportedByName(String name) {
    return 'Ilmoittaja: $name';
  }

  @override
  String commentsCount(int count) {
    return '$count kommenttia';
  }

  @override
  String get addComment => 'Lisää kommentti';

  @override
  String get deleteIssueConfirm => 'Poistetaanko tämä ongelma?';

  @override
  String get submitReport => 'Lähetä ilmoitus';

  @override
  String get tmdbScore => 'TMDB-pisteet';

  @override
  String get releaseDateLabel => 'Julkaisupäivä';

  @override
  String get firstAirDateLabel => 'Ensimmäinen lentopäivä';

  @override
  String get revenueLabel => 'Tulot';

  @override
  String get runtimeLabel => 'Suoritusaika';

  @override
  String get budgetLabel => 'Budjetti';

  @override
  String get originalLanguageLabel => 'Alkuperäinen kieli';

  @override
  String get seasonsLabel => 'Kaudet';

  @override
  String get episodesLabel => 'Jaksot';

  @override
  String get access => 'Pääsy';

  @override
  String get add => 'Lisää';

  @override
  String get address => 'Osoite';

  @override
  String get analytics => 'Analytiikka';

  @override
  String get catalog => 'Luettelo';

  @override
  String get content => 'Sisältö';

  @override
  String get copy => 'Kopioida';

  @override
  String get create => 'Luoda';

  @override
  String get disable => 'Poista käytöstä';

  @override
  String get done => 'Valmis';

  @override
  String get edit => 'Muokkaa';

  @override
  String get encoding => 'Koodaus';

  @override
  String get error => 'Virhe';

  @override
  String get forward => 'Eteenpäin';

  @override
  String get general => 'Yleiset';

  @override
  String get go => 'Mennä';

  @override
  String get install => 'Asentaa';

  @override
  String get installed => 'Asennettu';

  @override
  String get interval => 'Intervalli';

  @override
  String get name => 'Nimi';

  @override
  String get networking => 'Verkostoituminen';

  @override
  String get next => 'Seuraava';

  @override
  String get path => 'Polku';

  @override
  String get paused => 'Keskeytetty';

  @override
  String get permissions => 'Käyttöoikeudet';

  @override
  String get processing => 'Käsittely';

  @override
  String get profile => 'Profiili';

  @override
  String get provider => 'Palveluntarjoaja';

  @override
  String get refresh => 'Päivitä';

  @override
  String get remote => 'Kaukosäädin';

  @override
  String get rename => 'Nimeä uudelleen';

  @override
  String get revoke => 'Peruuttaa';

  @override
  String get role => 'Rooli';

  @override
  String get root => 'Juuri';

  @override
  String get run => 'Juokse';

  @override
  String get search => 'Haku';

  @override
  String get select => 'Valitse';

  @override
  String get send => 'Lähetä';

  @override
  String get sessions => 'Istunnot';

  @override
  String get set => 'Sarja';

  @override
  String get status => 'Tila';

  @override
  String get stop => 'Pysäytä';

  @override
  String get streaming => 'Suoratoisto';

  @override
  String get time => 'Aika';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Poista asennus';

  @override
  String get up => 'Ylös';

  @override
  String get update => 'Päivittää';

  @override
  String get upload => 'Lataa';

  @override
  String get unmute => 'Poista mykistys';

  @override
  String get mute => 'Mykistä';

  @override
  String get branding => 'Brändäys';

  @override
  String get adminDrawerDashboard => 'Kojelauta';

  @override
  String get adminDrawerAnalytics => 'Analytiikka';

  @override
  String get adminDrawerSettings => 'Asetukset';

  @override
  String get adminDrawerBranding => 'Brändäys';

  @override
  String get adminDrawerUsers => 'Käyttäjät';

  @override
  String get adminDrawerLibraries => 'Kirjastot';

  @override
  String get adminDrawerDisplay => 'Näyttö';

  @override
  String get adminDrawerMetadata => 'Metatiedot';

  @override
  String get adminDrawerNfo => 'NFO-asetukset';

  @override
  String get adminDrawerTranscoding => 'Transkoodaus';

  @override
  String get adminDrawerResume => 'Jatka';

  @override
  String get adminDrawerStreaming => 'Suoratoisto';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Laitteet';

  @override
  String get adminDrawerActivity => 'Toiminta';

  @override
  String get adminDrawerNetworking => 'Verkostoituminen';

  @override
  String get adminDrawerApiKeys => 'API-avaimet';

  @override
  String get adminDrawerBackups => 'Varmuuskopiot';

  @override
  String get adminDrawerLogs => 'Lokit';

  @override
  String get adminDrawerScheduledTasks => 'Aikataulutetut tehtävät';

  @override
  String get adminDrawerPlugins => 'Laajennukset';

  @override
  String get adminDrawerRepositories => 'Tietovarastot';

  @override
  String get adminDrawerLiveTv => 'Live-TV';

  @override
  String get adminExitTooltip => 'Poistu järjestelmänvalvojasta';

  @override
  String get adminDashboardLoadFailed => 'Kojelaudan lataaminen epäonnistui';

  @override
  String get adminMediaOverview => 'Median yleiskatsaus';

  @override
  String get adminMediaTotalsError =>
      'Palvelimen mediakokonaisuuksia ei voitu ladata.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Nopea luku siitä, kuinka paljon sisältöä tällä palvelimella on.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Lisäosien päivitykset saatavilla: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Uudelleenkäynnistystä vaativat laajennukset: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Epäonnistuneet ajoitetut tehtävät: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Viimeaikaiset varoitus-/virhemerkinnät: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Median jakelu';

  @override
  String get analyticsVideoCodecs => 'Videokoodekit';

  @override
  String get analyticsAudioCodecs => 'Äänikoodekit';

  @override
  String get analyticsContainers => 'Säiliöt';

  @override
  String get analyticsTopGenres => 'Suosituimmat genret';

  @override
  String get analyticsReleaseYears => 'Julkaisuvuodet';

  @override
  String get analyticsContentRatings => 'Sisällön luokitukset';

  @override
  String get analyticsRuntimeBuckets => 'Ajonaikaiset kauhat';

  @override
  String get analyticsFileFormats => 'Tiedostomuodot';

  @override
  String get analyticsNoData => 'Tietoja ei ole saatavilla.';

  @override
  String get adminServerInfo => 'Palvelimen tiedot';

  @override
  String get adminRestartPending => 'Uudelleenkäynnistys Odottaa';

  @override
  String get adminServerPaths => 'Palvelinpolut';

  @override
  String get adminServerActions => 'Palvelimen toiminnot';

  @override
  String get adminRestartServer => 'Käynnistä palvelin uudelleen';

  @override
  String get adminShutdownServer => 'Sammuta palvelin';

  @override
  String get adminScanLibraries => 'Skannaa kirjastot';

  @override
  String get adminLibraryScanStarted => 'Kirjaston skannaus aloitettu';

  @override
  String errorGeneric(String error) {
    return 'Virhe: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Palvelimen uudelleenkäynnistys käynnissä';

  @override
  String get adminServerRebootMessage =>
      'Palvelimen uudelleenkäynnistys käynnissä, käynnistä Moonfin uudelleen';

  @override
  String get adminActiveSessions => 'Aktiiviset istunnot';

  @override
  String get adminSessionsLoadFailed => 'Istuntojen lataaminen epäonnistui';

  @override
  String get adminNoActiveSessions => 'Ei aktiivisia istuntoja';

  @override
  String get adminRecentActivity => 'Viimeaikainen toiminta';

  @override
  String get adminNoRecentActivity => 'Ei viimeaikaista toimintaa';

  @override
  String adminCommandFailed(String error) {
    return 'Komento epäonnistui: $error';
  }

  @override
  String get adminSendMessage => 'Lähetä Viesti';

  @override
  String get adminMessageTextHint => 'Viestin teksti';

  @override
  String get adminSetVolume => 'Aseta äänenvoimakkuus';

  @override
  String get sessionPrev => 'Ed';

  @override
  String get sessionRewind => 'Kelaa taaksepäin';

  @override
  String get sessionForward => 'Eteenpäin';

  @override
  String get sessionNext => 'Seuraava';

  @override
  String get sessionVolumeDown => 'Ääni –';

  @override
  String get sessionVolumeUp => 'Ääni +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Nyt pelaa';

  @override
  String get volume => 'Äänenvoimakkuus';

  @override
  String get actions => 'Toiminnot';

  @override
  String get videoCodec => 'Videokoodekki';

  @override
  String get audioCodec => 'Äänikoodekki';

  @override
  String get hwAccel => 'Laitteistokiihdytys';

  @override
  String get completion => 'Valmistuminen';

  @override
  String get direct => 'Suoraan';

  @override
  String get adminDisconnect => 'Katkaise yhteys';

  @override
  String get adminClearDates => 'Selkeät päivämäärät';

  @override
  String get adminActivitySeverityAll => 'Kaikki vakavuusasteet';

  @override
  String get adminActivityDateRange => 'Aikaväli';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Toimintalokin lataaminen epäonnistui: $error';
  }

  @override
  String get adminNoActivityEntries => 'Ei aktiviteettimerkintöjä';

  @override
  String get adminEditDeviceName => 'Muokkaa laitteen nimeä';

  @override
  String get adminCustomName => 'Mukautettu nimi';

  @override
  String get adminDeviceNameUpdated => 'Laitteen nimi päivitetty';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Laitteen päivittäminen epäonnistui: $error';
  }

  @override
  String get adminDeleteDevice => 'Poista laite';

  @override
  String get adminDeviceDeleted => 'Laite poistettu';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Laitteen poistaminen epäonnistui: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Poistetaanko laite \'$name\'? Käyttäjän on kirjauduttava tällä laitteella uudelleen sisään.';
  }

  @override
  String get adminDeleteAllDevices => 'Poista kaikki laitteet';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Poistetaanko $count laitetta? Kyseisten käyttäjien on kirjauduttava uudelleen sisään. Nykyinen laitteesi ei muutu.';
  }

  @override
  String get adminDevicesDeletedAll => 'Laitteet poistettu';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Osa laitteista poistettiin, $count laitetta ei voitu poistaa.';
  }

  @override
  String get adminDevicesLoadFailed => 'Laitteiden lataaminen epäonnistui';

  @override
  String get adminSearchDevices => 'Etsi laitteita';

  @override
  String get adminThisDevice => 'Tämä laite';

  @override
  String get adminEditName => 'Muokkaa nimeä';

  @override
  String get adminLibrariesLoadFailed => 'Kirjastojen lataaminen epäonnistui';

  @override
  String get adminNoLibraries => 'Ei määritettyjä kirjastoja';

  @override
  String get adminScanAllLibraries => 'Skannaa kaikki kirjastot';

  @override
  String get adminAddLibrary => 'Lisää kirjasto';

  @override
  String adminScanFailed(String error) {
    return 'Skannauksen aloittaminen epäonnistui: $error';
  }

  @override
  String get adminRenameLibrary => 'Nimeä kirjasto uudelleen';

  @override
  String get adminNewName => 'Uusi nimi';

  @override
  String adminLibraryRenamed(String name) {
    return 'Kirjasto nimettiin uudelleen muotoon $name';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Uudelleennimeäminen epäonnistui: $error';
  }

  @override
  String get adminDeleteLibrary => 'Poista kirjasto';

  @override
  String adminLibraryDeleted(String name) {
    return 'Kirjasto \"$name\" poistettu';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Kirjaston poistaminen epäonnistui: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Polun lisääminen epäonnistui: $error';
  }

  @override
  String get adminRemovePath => 'Poista polku';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Poistetaanko \"$path\" tästä kirjastosta?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Polun poistaminen epäonnistui: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Kirjastoasetukset tallennettu';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Vaihtoehtojen tallennus epäonnistui: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Kirjaston lataaminen epäonnistui';

  @override
  String get adminNoMediaPaths => 'Mediapolkuja ei ole määritetty';

  @override
  String get adminAddPath => 'Lisää polku';

  @override
  String get adminBrowseFilesystem => 'Selaa palvelimen tiedostojärjestelmää:';

  @override
  String get adminSaveOptions => 'Tallenna asetukset';

  @override
  String get adminPreferredMetadataLanguage =>
      'Ensisijainen metatietojen kieli';

  @override
  String get adminMetadataLanguageHint => 'esim. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metatietojen maakoodi';

  @override
  String get adminMetadataCountryHint => 'esim. USA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Polut';

  @override
  String get adminLibraryTabOptions => 'Asetukset';

  @override
  String get adminLibraryTabDownloaders => 'Lataajat';

  @override
  String get adminLibMetadataSavers => 'Metatietojen tallentajat';

  @override
  String get adminLibSubtitleDownloaders => 'Tekstitysten lataajat';

  @override
  String get adminLibLyricDownloaders => 'Sanoitusten lataajat';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metatietojen lataajat: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Kuvien hakijat: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Tämä palvelin ei tarjoa lataajia tälle kirjastotyypille.';

  @override
  String get adminLibrarySectionGeneral => 'Yleiset';

  @override
  String get adminLibrarySectionMetadata => 'Metatiedot';

  @override
  String get adminLibrarySectionEmbedded => 'Upotetut tiedot';

  @override
  String get adminLibrarySectionSubtitles => 'Tekstitykset';

  @override
  String get adminLibrarySectionImages => 'Kuvat';

  @override
  String get adminLibrarySectionSeries => 'Sarjat';

  @override
  String get adminLibrarySectionMusic => 'Musiikki';

  @override
  String get adminLibrarySectionMovies => 'Elokuvat';

  @override
  String get adminLibRealtimeMonitor => 'Ota reaaliaikainen valvonta käyttöön';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Tunnista tiedostomuutokset ja käsittele ne automaattisesti.';

  @override
  String get adminLibArchiveMediaFiles => 'Käsittele arkistot mediatiedostoina';

  @override
  String get adminLibEnablePhotos => 'Näytä valokuvat';

  @override
  String get adminLibSaveLocalMetadata => 'Tallenna kuvitus mediakansioihin';

  @override
  String get adminLibRefreshInterval => 'Metatietojen automaattinen päivitys';

  @override
  String get adminLibRefreshNever => 'Ei koskaan';

  @override
  String get adminLibDefault => 'Oletus';

  @override
  String get adminLibDisplayTitle => 'Näyttö';

  @override
  String get adminLibDisplaySection => 'Kirjaston näyttö';

  @override
  String get adminLibFolderView =>
      'Näytä kansionäkymä tavallisille mediakansioille';

  @override
  String get adminLibSpecialsInSeasons =>
      'Näytä erikoisjaksot niiden esityskausien sisällä';

  @override
  String get adminLibGroupMovies => 'Ryhmittele elokuvat kokoelmiin';

  @override
  String get adminLibGroupShows => 'Ryhmittele sarjat kokoelmiin';

  @override
  String get adminLibExternalSuggestions =>
      'Näytä ulkoista sisältöä ehdotuksissa';

  @override
  String get adminLibDateAddedSection => 'Lisäyspäivän toiminta';

  @override
  String get adminLibDateAddedLabel => 'Käytä lisäyspäivänä';

  @override
  String get adminLibDateAddedImport => 'Kirjastoon skannauksen päivämäärä';

  @override
  String get adminLibDateAddedFile => 'Tiedoston luontipäivämäärä';

  @override
  String get adminLibMetadataTitle => 'Metatiedot ja kuvat';

  @override
  String get adminLibMetadataLangSection => 'Ensisijainen metatietojen kieli';

  @override
  String get adminLibChaptersSection => 'Luvut';

  @override
  String get adminLibDummyChapterDuration => 'Korvikelukujen kesto (sekuntia)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Lukujen pituus medialle, jolla ei ole omia lukuja. Poista käytöstä arvolla 0.';

  @override
  String get adminLibChapterImageResolution => 'Lukukuvien tarkkuus';

  @override
  String get adminLibNfoTitle => 'NFO-asetukset';

  @override
  String get adminLibNfoHelp =>
      'NFO-metatiedot ovat yhteensopivia Kodin ja vastaavien sovellusten kanssa. Asetukset koskevat kaikkia kirjastoja, jotka tallentavat NFO-metatietoja.';

  @override
  String get adminLibKodiUser =>
      'Käyttäjä, jonka katselutiedot tallennetaan NFO-tiedostoihin';

  @override
  String get adminLibSaveImagePaths => 'Tallenna kuvapolut NFO-tiedostoihin';

  @override
  String get adminLibPathSubstitution =>
      'Ota polkujen korvaus käyttöön NFO-kuvapoluille';

  @override
  String get adminLibExtraThumbs =>
      'Kopioi extrafanart-kuvat extrathumbs-kansioon';

  @override
  String get adminLibNone => 'Ei mitään';

  @override
  String adminLibRefreshDays(int days) {
    return '$days päivää';
  }

  @override
  String get adminLibEmbeddedTitles => 'Käytä upotettuja nimikkeitä';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Käytä upotettuja nimikkeitä lisämateriaalille';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Käytä upotettuja jaksotietoja';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Salli upotetut tekstitykset';

  @override
  String get adminLibEmbeddedAllowAll => 'Salli kaikki';

  @override
  String get adminLibEmbeddedAllowText => 'Vain teksti';

  @override
  String get adminLibEmbeddedAllowImage => 'Vain kuva';

  @override
  String get adminLibEmbeddedAllowNone => 'Ei mitään';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Ohita lataus, jos upotetut tekstitykset ovat olemassa';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Ohita lataus, jos ääniraita vastaa latauskieltä';

  @override
  String get adminLibRequirePerfectMatch => 'Vaadi täydellinen tekstitysosuma';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Tallenna tekstitykset mediakansioihin';

  @override
  String get adminLibChapterImageExtraction => 'Pura lukukuvat';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Pura lukukuvat kirjastoskannauksen aikana';

  @override
  String get adminLibTrickplayExtraction =>
      'Ota Trickplay-kuvien purku käyttöön';

  @override
  String get adminLibTrickplayDuringScan =>
      'Pura Trickplay-kuvat kirjastoskannauksen aikana';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Tallenna Trickplay-kuvat mediakansioihin';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Yhdistä automaattisesti sarjat, jotka on jaettu useaan kansioon';

  @override
  String get adminLibSeasonZeroName => 'Kauden nolla näyttönimi';

  @override
  String get adminLibLufsScan =>
      'Ota LUFS-skannaus käyttöön äänen normalisointia varten';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Suosi epästandardia artistitunnistetta';

  @override
  String get adminLibAutoAddToCollection =>
      'Lisää elokuvat kokoelmiin automaattisesti';

  @override
  String get adminLibraryNameRequired => 'Kirjaston nimi on pakollinen';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Kirjaston luominen epäonnistui: $error';
  }

  @override
  String get adminLibraryName => 'Kirjaston nimi';

  @override
  String get adminSelectedPaths => 'Valitut polut:';

  @override
  String get adminNoPathsAdded =>
      'Polkuja ei lisätty (voidaan lisätä myöhemmin)';

  @override
  String get adminCreateLibrary => 'Luo kirjasto';

  @override
  String get paths => 'Polut:';

  @override
  String get adminDisableUser => 'Poista käyttäjä käytöstä';

  @override
  String get adminEnableUser => 'Ota käyttäjä käyttöön';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Poistetaanko $name käytöstä? He eivät voi kirjautua sisään.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Otetaanko $name käyttöön? He voivat kirjautua sisään uudelleen.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Käyttäjä \"$name\" poistettu käytöstä';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Käyttäjä \"$name\" käytössä';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Käyttäjäkäytännön päivitys epäonnistui: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Käyttäjien lataaminen epäonnistui';

  @override
  String get adminSearchUsers => 'Etsi käyttäjiä';

  @override
  String get adminEditUser => 'Muokkaa käyttäjää';

  @override
  String get adminAddUser => 'Lisää käyttäjä';

  @override
  String adminUserCreateFailed(String error) {
    return 'Käyttäjän luominen epäonnistui: $error';
  }

  @override
  String get adminCreateUser => 'Luo käyttäjä';

  @override
  String get adminPasswordOptional => 'Salasana (valinnainen)';

  @override
  String get adminUsernameRequired => 'Käyttäjätunnus ei voi olla tyhjä';

  @override
  String get adminNoProfileChanges => 'Ei tallennettavia profiilimuutoksia';

  @override
  String get adminProfileSaved => 'Profiili tallennettu';

  @override
  String adminSaveFailed(String error) {
    return 'Tallennus epäonnistui: $error';
  }

  @override
  String get adminPermissionsSaved => 'Käyttöoikeudet tallennettu';

  @override
  String get adminPasswordsMismatch => 'Salasanat eivät täsmää';

  @override
  String adminFailed(String error) {
    return 'Epäonnistui: $error';
  }

  @override
  String get adminUserLoadFailed => 'Käyttäjän lataaminen epäonnistui';

  @override
  String get adminBackToUsers => 'Takaisin Käyttäjiin';

  @override
  String get adminSaveProfile => 'Tallenna profiili';

  @override
  String get adminDeleteUser => 'Poista käyttäjä';

  @override
  String get admin => 'Ylläpito';

  @override
  String get adminFullAccessWarning =>
      'Järjestelmänvalvojilla on täydellinen pääsy palvelimeen. Myönnä varoen.';

  @override
  String get administrator => 'Järjestelmänvalvoja';

  @override
  String get adminHiddenUser => 'Piilotettu käyttäjä';

  @override
  String get adminAllowMediaPlayback => 'Salli median toisto';

  @override
  String get adminAllowAudioTranscoding => 'Salli äänen transkoodaus';

  @override
  String get adminAllowVideoTranscoding => 'Salli videon transkoodaus';

  @override
  String get adminAllowRemuxing => 'Salli sekoittaminen';

  @override
  String get adminForceRemoteTranscoding => 'Pakota etälähteen transkoodaus';

  @override
  String get adminAllowContentDeletion => 'Salli sisällön poistaminen';

  @override
  String get adminAllowContentDownloading => 'Salli sisällön lataaminen';

  @override
  String get adminAllowPublicSharing => 'Salli julkinen jakaminen';

  @override
  String get adminAllowRemoteControl => 'Salli muiden käyttäjien kauko-ohjaus';

  @override
  String get adminAllowSharedDeviceControl => 'Salli jaettu laitehallinta';

  @override
  String get adminAllowRemoteAccess => 'Salli etäkäyttö';

  @override
  String get adminRemoteBitrateLimit =>
      'Etäasiakkaan bittinopeusrajoitus (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Jätä tyhjäksi ilman rajoituksia';

  @override
  String get adminMaxActiveSessions => 'Aktiivisten istuntojen enimmäismäärä';

  @override
  String get adminAllowLiveTvAccess => 'Salli suoran television käyttö';

  @override
  String get adminAllowLiveTvManagement => 'Salli live-TV:n hallinta';

  @override
  String get adminAllowCollectionManagement => 'Salli kokoelman hallinta';

  @override
  String get adminAllowSubtitleManagement => 'Salli tekstityksen hallinta';

  @override
  String get adminAllowLyricManagement => 'Salli sanoituksen hallinta';

  @override
  String get adminSavePermissions => 'Tallenna käyttöoikeudet';

  @override
  String get adminEnableAllLibraryAccess => 'Salli pääsy kaikkiin kirjastoihin';

  @override
  String get adminSaveAccess => 'Tallenna käyttöoikeus';

  @override
  String get adminChangePassword => 'Vaihda salasana';

  @override
  String get adminNewPassword => 'Uusi salasana';

  @override
  String get adminConfirmPassword => 'Vahvista salasana';

  @override
  String get adminSetPassword => 'Aseta salasana';

  @override
  String get adminResetPassword => 'Palauta salasana';

  @override
  String get adminPasswordReset => 'Salasanan palautus';

  @override
  String get adminPasswordUpdated => 'Salasana päivitetty';

  @override
  String get adminUserSettings => 'Käyttäjäasetukset';

  @override
  String get adminLibraryAccess => 'Kirjaston pääsy';

  @override
  String get adminDeviceAndChannelAccess => 'Laitteen ja kanavan käyttöoikeus';

  @override
  String get adminEnableAllDevices => 'Salli pääsy kaikkiin laitteisiin';

  @override
  String get adminEnableAllChannels => 'Salli pääsy kaikille kanaville';

  @override
  String get adminParentalControl => 'Lapsilukko';

  @override
  String get adminMaxParentalRating => 'Suurin sallittu ikäraja';

  @override
  String get adminMaxParentalRatingHint =>
      'Tätä korkeamman ikärajan sisältö piilotetaan tältä käyttäjältä.';

  @override
  String get adminParentalRatingNone => 'Ei mitään';

  @override
  String get adminBlockUnratedItems =>
      'Estä kohteet, joiden ikärajatieto puuttuu tai on tuntematon';

  @override
  String get adminUnratedBook => 'Kirjat';

  @override
  String get adminUnratedChannelContent => 'Kanavat';

  @override
  String get adminUnratedLiveTvChannel => 'Live-TV';

  @override
  String get adminUnratedMovie => 'Elokuvat';

  @override
  String get adminUnratedMusic => 'Musiikki';

  @override
  String get adminUnratedTrailer => 'Trailerit';

  @override
  String get adminUnratedSeries => 'Sarjat';

  @override
  String get adminAccessSchedules => 'Käyttöaikataulut';

  @override
  String get adminAccessSchedulesHint =>
      'Salli käyttö vain alla määritettyinä aikoina. Ilman aikataulua käyttö on sallittu koko päivän.';

  @override
  String get adminAddSchedule => 'Lisää aikataulu';

  @override
  String get adminScheduleDay => 'Päivä';

  @override
  String get adminScheduleStart => 'Alkaa';

  @override
  String get adminScheduleEnd => 'Päättyy';

  @override
  String get adminDayEveryday => 'Joka päivä';

  @override
  String get adminDayWeekday => 'Arkipäivä';

  @override
  String get adminDayWeekend => 'Viikonloppu';

  @override
  String get adminDaySunday => 'Sunnuntai';

  @override
  String get adminDayMonday => 'Maanantai';

  @override
  String get adminDayTuesday => 'Tiistai';

  @override
  String get adminDayWednesday => 'Keskiviikko';

  @override
  String get adminDayThursday => 'Torstai';

  @override
  String get adminDayFriday => 'Perjantai';

  @override
  String get adminDaySaturday => 'Lauantai';

  @override
  String get adminAllowedTags => 'Sallitut tunnisteet';

  @override
  String get adminAllowedTagsHint =>
      'Vain näillä tunnisteilla merkitty sisältö näytetään. Jätä tyhjäksi salliaksesi kaiken.';

  @override
  String get adminBlockedTags => 'Estetyt tunnisteet';

  @override
  String get adminBlockedTagsHint =>
      'Näillä tunnisteilla merkitty sisältö piilotetaan tältä käyttäjältä.';

  @override
  String get adminAddTag => 'Lisää tunniste';

  @override
  String get adminEnabledDevices => 'Sallitut laitteet';

  @override
  String get adminEnabledChannels => 'Sallitut kanavat';

  @override
  String get adminAuthProvider => 'Todennuksen tarjoaja';

  @override
  String get adminPasswordResetProvider => 'Salasanan palautuksen tarjoaja';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Epäonnistuneiden kirjautumisyritysten enimmäismäärä ennen lukitusta';

  @override
  String get adminLoginAttemptsHint =>
      'Käytä oletusta arvolla 0 tai poista lukitus käytöstä arvolla -1.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay-käyttöoikeus';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Salli ryhmien luominen ja niihin liittyminen';

  @override
  String get adminSyncPlayJoin => 'Salli ryhmiin liittyminen';

  @override
  String get adminSyncPlayNone => 'Ei käyttöoikeutta';

  @override
  String get adminContentDeletionFolders =>
      'Salli sisällön poistaminen kansioista';

  @override
  String get adminResetPasswordWarning =>
      'Tämä poistaa salasanan. Käyttäjä voi kirjautua sisään ilman salasanaa.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Palvelin palautti HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Haluatko varmasti poistaa $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Käyttäjä \"$name\" poistettu';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Käyttäjän poistaminen epäonnistui: $error';
  }

  @override
  String get adminCreateApiKey => 'Luo API-avain';

  @override
  String get adminAppName => 'Sovelluksen nimi';

  @override
  String get adminApiKeyCreated => 'API-avain luotu';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Avain luotu onnistuneesti. Palvelin ei palauttanut merkkiä. Tarkista palvelimen API-avaimet.';

  @override
  String get adminKeyCopied => 'Avain kopioitu leikepöydälle';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Avaimen luominen epäonnistui: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Palvelimen vastauksesta puuttuu avaintunnus';

  @override
  String get adminRevokeApiKey => 'Peruuta API-avain';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Perutaanko avain kohteelle $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-avain peruutettu';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Avaimen peruuttaminen epäonnistui: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API-avaimien lataaminen epäonnistui';

  @override
  String get adminApiKeysTitle => 'API-avaimet';

  @override
  String get adminCreateKey => 'Luo avain';

  @override
  String get adminNoApiKeys => 'API-avaimia ei löytynyt';

  @override
  String get adminUnknownApp => 'Tuntematon sovellus';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Tunnus: $token\\nLuotu: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Luo varmuuskopio';

  @override
  String get adminBackupInclude =>
      'Valitse, mitä varmuuskopioon sisällytetään.';

  @override
  String get adminBackupDatabase => 'Tietokanta';

  @override
  String get adminBackupDatabaseAlways => 'Aina mukana';

  @override
  String get adminBackupMetadata => 'Metatiedot';

  @override
  String get adminBackupSubtitles => 'Tekstitykset';

  @override
  String get adminBackupTrickplay => 'Trickplay-kuvat';

  @override
  String get adminCreatingBackup => 'Luodaan varmuuskopiota...';

  @override
  String get adminBackupCreated => 'Varmuuskopion luominen onnistui';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Varmuuskopion luominen epäonnistui: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Palvelimen vastauksesta puuttuu varmuuskopiopolku';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesti: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Luettelon lataaminen epäonnistui: $error';
  }

  @override
  String get adminConfirmRestore => 'Vahvista palautus';

  @override
  String get adminRestoringBackup => 'Palautetaan varmuuskopiota...';

  @override
  String adminRestoreFailed(String error) {
    return 'Varmuuskopion palauttaminen epäonnistui: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'Varmuuskopioiden lataaminen epäonnistui';

  @override
  String get adminCreateBackup => 'Luo varmuuskopio';

  @override
  String get adminNoBackups => 'Varmuuskopioita ei löytynyt';

  @override
  String get adminViewDetails => 'Näytä tiedot';

  @override
  String get restore => 'Palauttaa';

  @override
  String get adminLogsLoadFailed => 'Palvelinlokien lataaminen epäonnistui';

  @override
  String get adminNoLogFiles => 'Lokitiedostoja ei löytynyt';

  @override
  String get adminLogCopied => 'Loki kopioitu leikepöydälle';

  @override
  String get adminSaveLogFile => 'Tallenna lokitiedosto';

  @override
  String adminSavedTo(String path) {
    return 'Tallennettu osoitteeseen $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Tiedoston tallennus epäonnistui: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName lataus epäonnistui';
  }

  @override
  String get adminSearchInLog => 'Hae lokista';

  @override
  String get adminNoMatchingLines => 'Ei vastaavia rivejä';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Tehtävien lataaminen epäonnistui: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Ajastettuja tehtäviä ei löytynyt';

  @override
  String get adminNoTasksMatchFilter =>
      'Yksikään tehtävä ei vastaa nykyistä suodatinta';

  @override
  String adminTaskStartFailed(String error) {
    return 'Tehtävän aloitus epäonnistui: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Tehtävän pysäyttäminen epäonnistui: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Tehtävän lataaminen epäonnistui: $error';
  }

  @override
  String get adminRunNow => 'Juokse nyt';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Liipaisimen poistaminen epäonnistui: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Liipaisimen lisääminen epäonnistui: $error';
  }

  @override
  String get adminLastExecution => 'Viimeinen teloitus';

  @override
  String get adminTriggers => 'Liipaisimet';

  @override
  String get adminAddTrigger => 'Lisää triggeri';

  @override
  String get adminNoTriggers => 'Liipaimia ei ole määritetty';

  @override
  String get adminTriggerType => 'Liipaisimen tyyppi';

  @override
  String get adminTimeLimit => 'Aikaraja (valinnainen)';

  @override
  String get adminNoLimit => 'Ei rajaa';

  @override
  String adminHours(String hours) {
    return '$hours tunti(a)';
  }

  @override
  String get adminDayOfWeek => 'Viikon päivä';

  @override
  String get adminSearchPlugins => 'Hae laajennuksia...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Liitännäisen vaihto epäonnistui: $error';
  }

  @override
  String get adminUninstallPlugin => 'Poista laajennus';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Haluatko varmasti poistaa \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Laajennuksen poistaminen epäonnistui: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Paketin asennus epäonnistui: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Päivityksen asentaminen epäonnistui: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Laajennusten lataaminen epäonnistui: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => 'Mikään laajennus ei vastaa hakuasi';

  @override
  String get adminNoPluginsInstalled => 'Laajennuksia ei ole asennettu';

  @override
  String adminInstallUpdate(String version) {
    return 'Asenna päivitys (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Katalogin lataaminen epäonnistui: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'Ei hakuasi vastaavia paketteja';

  @override
  String get adminNoPackagesAvailable => 'Paketteja ei ole saatavilla';

  @override
  String get adminExperimentalIntegration => 'Kokeellinen integraatio';

  @override
  String get adminExperimentalWarning =>
      'Plugin-asetusten integrointi on vielä kokeellista. Jotkin asetussivut eivät välttämättä näy oikein.';

  @override
  String get continueAction => 'Jatkaa';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" poistetaan palvelimen uudelleenkäynnistyksen jälkeen';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Asennuksen poistaminen epäonnistui: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Päivitetään \"$name\" muotoon v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Asetuksia ei voi avata: todennustunnus puuttuu.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Liitännäisen lataaminen epäonnistui: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin ei löydy';

  @override
  String adminPluginVersion(String version) {
    return 'Versio $version';
  }

  @override
  String get adminEnablePlugin => 'Ota laajennus käyttöön';

  @override
  String get adminPluginSettingsPage => 'Plugin asetussivu';

  @override
  String get adminRevisionHistory => 'Versiohistoria';

  @override
  String get adminNoChangelog => 'Muutoslokia ei ole saatavilla.';

  @override
  String get adminRemoveRepository => 'Poista arkisto';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Haluatko varmasti poistaa \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Tietovarastojen tallentaminen epäonnistui: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Tietovarastojen lataaminen epäonnistui: $error';
  }

  @override
  String get adminRepositoryNameHint => 'esim. Jellyfin vakaa';

  @override
  String get adminRepositoryUrl => 'Tietovaraston URL-osoite';

  @override
  String get adminAddEntry => 'Lisää merkintä';

  @override
  String get adminInvalidUrl => 'Virheellinen URL-osoite';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Liitännäisen asetuksia ei voi ladata: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Ei voitu avata $uri';
  }

  @override
  String get adminOpenInBrowser => 'Avaa selaimessa';

  @override
  String get adminOpenExternally => 'Avaa ulkoisesti';

  @override
  String get adminGeneralSettings => 'Yleiset asetukset';

  @override
  String get adminServerName => 'Palvelimen nimi';

  @override
  String get adminPreferredMetadataCountry => 'Ensisijainen metatietojen maa';

  @override
  String get adminCachePath => 'Välimuistin polku';

  @override
  String get adminMetadataPath => 'Metatietojen polku';

  @override
  String get adminLibraryScanConcurrency =>
      'Kirjastoskannauksen samanaikaisuus';

  @override
  String get adminParallelImageEncodingLimit =>
      'Rinnakkaiskuvan koodausrajoitus';

  @override
  String get adminSlowResponseThreshold => 'Hitaan vasteen kynnys (ms)';

  @override
  String get adminBrandingSaved => 'Brändäysasetukset tallennettu';

  @override
  String get adminBrandingLoadFailed =>
      'Brändäysasetusten lataaminen epäonnistui';

  @override
  String get adminLoginDisclaimer => 'Kirjautumisen vastuuvapauslauseke';

  @override
  String get adminLoginDisclaimerHint => 'HTML näkyy kirjautumislomakkeen alla';

  @override
  String get adminCustomCss => 'Mukautettu CSS';

  @override
  String get adminCustomCssHint =>
      'Verkkokäyttöliittymään sovellettu mukautettu CSS';

  @override
  String get adminEnableSplashScreen => 'Ota aloitusnäyttö käyttöön';

  @override
  String get adminStreamingSaved => 'Suoratoistoasetukset tallennettu';

  @override
  String get adminStreamingLoadFailed =>
      'Suoratoistoasetusten lataaminen epäonnistui';

  @override
  String get adminStreamingDescription =>
      'Aseta globaalit suoratoiston bittinopeusrajoitukset etäyhteyksille.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Etäasiakkaan bittinopeusrajoitus (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Jätä tyhjäksi tai 0 rajattomasti';

  @override
  String get adminPlaybackSaved => 'Toistoasetukset tallennettu';

  @override
  String get adminPlaybackLoadFailed =>
      'Toistoasetusten lataaminen epäonnistui';

  @override
  String get adminPlaybackTranscoding => 'Toisto / Transkoodaus';

  @override
  String get adminHardwareAcceleration => 'Laitteistokiihdytys';

  @override
  String get adminVaapiDevice => 'VA-API laite';

  @override
  String get adminEnableHardwareEncoding => 'Ota käyttöön laitteistokoodaus';

  @override
  String get adminEnableHardwareDecoding =>
      'Ota laitteiston dekoodaus käyttöön:';

  @override
  String get adminEncodingThreads => 'Säikeiden koodaus';

  @override
  String get adminAutomatic => '0 = automaattinen';

  @override
  String get adminTranscodingTempPath => 'Transkoodaus lämpötilapolku';

  @override
  String get adminEnableFallbackFont => 'Ota varafontti käyttöön';

  @override
  String get adminFallbackFontPath => 'Varafontin polku';

  @override
  String get adminAllowSegmentDeletion => 'Salli segmentin poistaminen';

  @override
  String get adminSegmentKeepSeconds => 'Segmentin säilytys (sekuntia)';

  @override
  String get adminThrottleBuffering => 'Kaasun puskurointi';

  @override
  String get adminTrickplaySaved => 'Trickplay-asetukset tallennettu';

  @override
  String get adminTrickplayLoadFailed =>
      'Trickplay-asetusten lataaminen epäonnistui';

  @override
  String get adminEnableHardwareAcceleration =>
      'Ota käyttöön laitteistokiihdytys';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Ota käyttöön vain avainkehysten purkaminen';

  @override
  String get adminKeyFrameSubtitle => 'Nopeampi mutta pienempi tarkkuus';

  @override
  String get adminScanBehavior => 'Skannauskäyttäytyminen';

  @override
  String get adminProcessPriority => 'Prosessin prioriteetti';

  @override
  String get adminImageSettings => 'Kuva-asetukset';

  @override
  String get adminIntervalMs => 'Aikaväli (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Kuinka usein ottaa kuvia';

  @override
  String get adminWidthResolutions => 'Leveyden resoluutiot';

  @override
  String get adminTileWidth => 'Laattojen leveys';

  @override
  String get adminTileHeight => 'Laattojen korkeus';

  @override
  String get adminQualitySubtitle =>
      'Pienemmät arvot = parempi laatu, suuremmat tiedostot';

  @override
  String get adminProcessThreads => 'Käsittele säikeitä';

  @override
  String get adminResumeSaved => 'Jatka asetukset tallennettu';

  @override
  String get adminResumeLoadFailed =>
      'Jatkamisasetusten lataaminen epäonnistui';

  @override
  String get adminResumeDescription =>
      'Määritä, milloin sisältö merkitään osittain tai kokonaan toistetuksi.';

  @override
  String get adminMinResumePercentage => 'Minimi jatkamisprosentti';

  @override
  String get adminMinResumeSubtitle =>
      'Sisältöä on toistettava tämän prosenttiosuuden yli, jotta edistyminen tallentuu';

  @override
  String get adminMaxResumePercentage => 'Maksimi jatkamisprosentti';

  @override
  String get adminMaxResumeSubtitle =>
      'Sisältö katsotaan kokonaan toistetuksi tämän prosenttiosuuden jälkeen';

  @override
  String get adminMinResumeDuration =>
      'Ansioluettelon vähimmäiskesto (sekuntia)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Tätä lyhyempiä tuotteita ei voida jatkaa';

  @override
  String get adminMinAudiobookResume =>
      'Äänikirjan ansioluettelon vähimmäisprosentti';

  @override
  String get adminMaxAudiobookResume =>
      'Äänikirjan ansioluettelon enimmäisprosentti';

  @override
  String get adminNetworkingSaved =>
      'Verkkoasetukset tallennettu. Palvelin voi olla tarpeen käynnistää uudelleen.';

  @override
  String get adminNetworkingLoadFailed =>
      'Verkkoasetusten lataaminen epäonnistui';

  @override
  String get adminNetworkingWarning =>
      'Verkkoasetusten muutokset voivat vaatia palvelimen uudelleenkäynnistyksen.';

  @override
  String get adminEnableRemoteAccess => 'Ota etäkäyttö käyttöön';

  @override
  String get ports => 'Portit';

  @override
  String get adminHttpPort => 'HTTP-portti';

  @override
  String get adminHttpsPort => 'HTTPS-portti';

  @override
  String get adminPublicHttpsPort => 'Julkinen HTTPS-portti';

  @override
  String get adminBaseUrl => 'Perus-URL-osoite';

  @override
  String get adminBaseUrlHint => 'esim. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Ota HTTPS käyttöön';

  @override
  String get adminLocalNetwork => 'Paikallinen verkko';

  @override
  String get adminLocalNetworkAddresses => 'Paikalliset verkko-osoitteet';

  @override
  String get adminKnownProxies => 'Tunnetut välityspalvelimet';

  @override
  String get adminRemoteIpFilter => 'Etä-IP-suodatin';

  @override
  String get adminRemoteIpFilterEntries => 'Etä-IP-suodatin';

  @override
  String get adminCertificatePath => 'Varmenteen polku';

  @override
  String get whitelist => 'Valkoinen lista';

  @override
  String get blacklist => 'Musta lista';

  @override
  String get notSet => 'Ei asetettu';

  @override
  String get adminMetadataSaved => 'Metatiedot tallennettu';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Metatietojen lataus epäonnistui: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Metatietojen tallennus epäonnistui: $error';
  }

  @override
  String get adminRefreshMetadata => 'Päivitä metatiedot';

  @override
  String get recursive => 'Rekursiivinen';

  @override
  String get adminReplaceAllMetadata => 'Korvaa kaikki metatiedot';

  @override
  String get adminReplaceAllImages => 'Korvaa kaikki kuvat';

  @override
  String get adminMetadataRefreshRequested =>
      'Metatietojen päivitystä pyydetty';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Metatietojen päivittäminen epäonnistui: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Etäosumia ei löytynyt';

  @override
  String get adminRemoteResults => 'Etätulokset';

  @override
  String get adminRemoteMetadataApplied =>
      'Etäsisällönkuvaustiedot otettu käyttöön';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Etähaku epäonnistui: $error';
  }

  @override
  String get adminUpdateContentType => 'Päivitä sisältötyyppi';

  @override
  String get adminContentType => 'Sisällön tyyppi';

  @override
  String get adminContentTypeUpdated => 'Sisältötyyppi päivitetty';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Sisältötyypin päivittäminen epäonnistui: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Metatietoeditorin lataaminen epäonnistui';

  @override
  String get adminNoPeopleEntries => 'Ei henkilömerkintöjä';

  @override
  String get adminNoExternalIds => 'Ulkoisia tunnuksia ei ole saatavilla';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType kuva päivitetty';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Kuvan lataaminen epäonnistui: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Kuvamuotoa ei tueta';

  @override
  String get adminImageReadFailed => 'Valitun kuvan lukeminen epäonnistui';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType kuva ladattu';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Kuvan lataaminen epäonnistui: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Poista $imageType-kuva';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType kuva poistettu';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Kuvan poistaminen epäonnistui: $error';
  }

  @override
  String get adminAllProviders => 'Kaikki palveluntarjoajat';

  @override
  String get adminNoRemoteImages => 'Etäkuvia ei löytynyt';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Virittimen etsintä epäonnistui: $error';
  }

  @override
  String get adminAddTuner => 'Lisää viritin';

  @override
  String get adminEditTuner => 'Muokkaa viritintä';

  @override
  String get adminTunerTypeM3u => 'M3U-viritin';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Tiedosto tai URL';

  @override
  String get adminTunerIpAddress => 'Virittimen IP-osoite';

  @override
  String get adminTunerFriendlyName => 'Näyttönimi';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Samanaikaisten yhteyksien raja';

  @override
  String get adminTunerCountHelp =>
      'Virittimen kerralla sallimien lähetysvirtojen enimmäismäärä. Rajoittamaton arvolla 0.';

  @override
  String get adminTunerFallbackBitrate =>
      'Suoratoiston varabittinopeuden yläraja';

  @override
  String get adminTunerImportFavoritesOnly => 'Tuo vain suosikkikanavat';

  @override
  String get adminTunerAllowHwTranscoding => 'Salli laitteistotranskoodaus';

  @override
  String get adminTunerAllowFmp4 => 'Salli fMP4-transkoodaussäiliö';

  @override
  String get adminTunerAllowStreamSharing => 'Salli lähetysvirran jakaminen';

  @override
  String get adminTunerEnableStreamLooping =>
      'Ota lähetysvirran silmukointi käyttöön';

  @override
  String get adminTunerIgnoreDts => 'Ohita DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Lue syöte natiivilla kuvataajuudella';

  @override
  String get adminEditProvider => 'Muokkaa tarjoajaa';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Tiedosto tai URL';

  @override
  String get adminXmltvMoviePrefix => 'Elokuvien etuliite';

  @override
  String get adminXmltvMovieCategories => 'Elokuvakategoriat';

  @override
  String get adminXmltvCategoriesHelp =>
      'Erota useat kategoriat pystyviivalla.';

  @override
  String get adminXmltvKidsCategories => 'Lastenohjelmien kategoriat';

  @override
  String get adminXmltvNewsCategories => 'Uutiskategoriat';

  @override
  String get adminXmltvSportsCategories => 'Urheilukategoriat';

  @override
  String get adminSdUsername => 'Käyttäjätunnus';

  @override
  String get adminSdPassword => 'Salasana';

  @override
  String get adminSdCountry => 'Maa';

  @override
  String get adminSdCountrySelect => 'Valitse maa';

  @override
  String get adminSdPostalCode => 'Postinumero';

  @override
  String get adminSdGetListings => 'Hae ohjelmatiedot';

  @override
  String get adminSdListings => 'Ohjelmatiedot';

  @override
  String get adminEnableAllTuners => 'Ota kaikki virittimet käyttöön';

  @override
  String get adminTunerType => 'Virittimen tyyppi';

  @override
  String get adminTunerAdded => 'Viritin lisätty';

  @override
  String adminTunerAddFailed(String error) {
    return 'Virittimen lisääminen epäonnistui: $error';
  }

  @override
  String get adminAddGuideProvider => 'Lisää oppaan tarjoaja';

  @override
  String get adminProviderType => 'Palveluntarjoajan tyyppi';

  @override
  String get adminProviderAdded => 'Palveluntarjoaja lisätty';

  @override
  String adminProviderAddFailed(String error) {
    return 'Palveluntarjoajan lisääminen epäonnistui: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Virittimen poistaminen epäonnistui: $error';
  }

  @override
  String get adminTunerResetRequested => 'Virittimen nollauspyyntö';

  @override
  String adminTunerResetFailed(String error) {
    return 'Virittimen nollaus epäonnistui: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Tämä viritintyyppi ei tue nollausta.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Palveluntarjoajan poistaminen epäonnistui: $error';
  }

  @override
  String get adminRecordingSettings => 'Tallennusasetukset';

  @override
  String get adminPrePadding => 'Esitäyttö (minuutteja)';

  @override
  String get adminPostPadding => 'Jälkitäyte (minuutteja)';

  @override
  String get adminRecordingPath => 'Tallennuspolku';

  @override
  String get adminSeriesRecordingPath => 'Sarjan tallennuspolku';

  @override
  String get adminMovieRecordingPath => 'Elokuvatallenteiden polku';

  @override
  String get adminGuideDays => 'Ohjelmaoppaan päivien määrä';

  @override
  String get adminGuideDaysAuto => 'Automaattinen';

  @override
  String adminGuideDaysValue(int days) {
    return '$days päivää';
  }

  @override
  String get adminRecordingPostProcessor => 'Jälkikäsittelysovelluksen polku';

  @override
  String get adminRecordingPostProcessorArgs => 'Jälkikäsittelijän argumentit';

  @override
  String get adminSaveRecordingNfo => 'Tallenna tallenteen NFO-metatiedot';

  @override
  String get adminSaveRecordingImages => 'Tallenna tallenteen kuvat';

  @override
  String get adminLiveTvSectionTiming => 'Ajoitus';

  @override
  String get adminLiveTvSectionPaths => 'Tallennuspolut';

  @override
  String get adminLiveTvSectionPostProcessing => 'Jälkikäsittely';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Ohjelmaopas: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Tallennusasetukset tallennettu';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Asetusten tallentaminen epäonnistui: $error';
  }

  @override
  String get adminSetChannelMappings => 'Aseta kanavakartoitukset';

  @override
  String get adminMappingJson => 'Kartoitus JSON';

  @override
  String get adminMappingJsonHint => 'Esimerkki: kartoittaa JSON-hyötykuorma';

  @override
  String get adminChannelMappingsUpdated => 'Kanavakartoitukset päivitetty';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Kartoitusten päivittäminen epäonnistui: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Live-TV-hallinnan lataaminen epäonnistui';

  @override
  String get adminTunerDevices => 'Viritinlaitteet';

  @override
  String get adminNoTunerHosts => 'Viritinisäntiä ei ole määritetty';

  @override
  String get adminGuideProviders => 'Opaspalveluntarjoajat';

  @override
  String get adminRefreshGuideData => 'Päivitä ohjelmaoppaan tiedot';

  @override
  String get adminGuideRefreshStarted => 'Ohjelmaoppaan päivitys aloitettu';

  @override
  String get adminGuideRefreshUnavailable =>
      'Ohjelmaoppaan päivitystehtävä ei ole käytettävissä tällä palvelimella.';

  @override
  String get adminAddProvider => 'Lisää Palveluntarjoaja';

  @override
  String get adminNoListingProviders => 'Tietojen tarjoajia ei ole määritetty';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Tallennuspolku: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Sarjan polku: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Esitäyttö: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Jälkitäyte: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Virittimen löytö';

  @override
  String get adminChannelMappings => 'Kanavakartoitukset';

  @override
  String get adminNoDiscoveredTuners => 'Ei vielä löydetty virittimiä';

  @override
  String get adminSettingsSaved => 'Asetukset tallennettu';

  @override
  String get adminBackupsNotAvailable =>
      'Varmuuskopiot eivät ole käytettävissä tässä palvelinversiossa.';

  @override
  String get adminRestoreWarning1 =>
      'Palauttaminen korvaa KAIKKI nykyiset palvelintiedot varmuuskopiotiedoilla.';

  @override
  String get adminRestoreWarning2 =>
      'Nykyiset palvelinasetukset, käyttäjät ja kirjastotiedot korvataan.';

  @override
  String get adminRestoreWarning3 =>
      'Palvelin käynnistyy uudelleen palautuksen jälkeen.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Palauta varmuuskopio $name nyt?';
  }

  @override
  String get adminRestoreRequested =>
      'Palautusta pyydetty. Palvelimen uudelleenkäynnistys saattaa katkaista tämän istunnon yhteyden.';

  @override
  String get adminBackupsTitle => 'Varmuuskopiot';

  @override
  String get adminUnknownDate => 'Tuntematon päivämäärä';

  @override
  String get adminUnnamedBackup => 'Nimetön varmuuskopio';

  @override
  String get adminLiveTvNotAvailable =>
      'Live-TV-hallinta ei ole käytettävissä tässä palvelinversiossa.';

  @override
  String get adminLiveTvTitle => 'Live-TV:n hallinto';

  @override
  String get adminApply => 'Käytä';

  @override
  String get adminNotSet => 'Ei asetettu';

  @override
  String get adminReset => 'Nollaa';

  @override
  String get adminLogsTitle => 'Palvelimen lokit';

  @override
  String get adminLogsNewestFirst => 'Uusin ensin';

  @override
  String get adminLogsOldestFirst => 'Vanhin ensin';

  @override
  String get adminLogsJustNow => 'Juuri nyt';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}min sitten';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h sitten';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d sitten';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName lataus epäonnistui';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count vastaa';
  }

  @override
  String get adminLogViewerNoMatches => 'Ei vastaavia rivejä';

  @override
  String get adminMetadataEditorTitle => 'Metatietoeditori';

  @override
  String get adminMetadataIdentify => 'Tunnista';

  @override
  String get adminMetadataType => 'Tyyppi';

  @override
  String get adminMetadataDetails => 'Yksityiskohdat';

  @override
  String get adminMetadataExternalIds => 'Ulkoiset tunnukset';

  @override
  String get adminMetadataImages => 'Kuvat';

  @override
  String get adminMetadataFieldTitle => 'Nimi';

  @override
  String get adminMetadataFieldSortTitle => 'Lajittele otsikko';

  @override
  String get adminMetadataFieldOriginalTitle => 'Alkuperäinen otsikko';

  @override
  String get adminMetadataFieldPremiereDate => 'Ensiesityspäivä (VVVV-KK-PP)';

  @override
  String get adminMetadataFieldEndDate => 'Päättymispäivä (VVVV-KK-PP)';

  @override
  String get adminMetadataFieldProductionYear => 'Tuotantovuosi';

  @override
  String get adminMetadataFieldOfficialRating => 'Virallinen luokitus';

  @override
  String get adminMetadataFieldCommunityRating => 'yhteisön luokitus';

  @override
  String get adminMetadataFieldCriticRating => 'Kriitikoiden luokitus';

  @override
  String get adminMetadataFieldTagline => 'Tunnuslause';

  @override
  String get adminMetadataFieldOverview => 'Yleiskatsaus';

  @override
  String get adminMetadataGenres => 'Genret';

  @override
  String get adminMetadataTags => 'Tunnisteet';

  @override
  String get adminMetadataStudios => 'Studiot';

  @override
  String get adminMetadataPeople => 'Ihmiset';

  @override
  String get adminMetadataAddGenre => 'Lisää genre';

  @override
  String get adminMetadataAddTag => 'Lisää tunniste';

  @override
  String get adminMetadataAddStudio => 'Lisää studio';

  @override
  String get adminMetadataAddPerson => 'Lisää henkilö';

  @override
  String get adminMetadataEditPerson => 'Muokkaa henkilöä';

  @override
  String get adminMetadataRole => 'Rooli';

  @override
  String get adminMetadataImagePrimary => 'Ensisijainen';

  @override
  String get adminMetadataImageBackdrop => 'Tausta';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banneri';

  @override
  String get adminMetadataImageThumb => 'Peukalo';

  @override
  String get adminMetadataRecursive => 'Rekursiivinen';

  @override
  String get adminMetadataProvider => 'Palveluntarjoaja';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType kuva päivitetty';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType kuva ladattu';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType kuva poistettu';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Kuvan lataaminen epäonnistui: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Valitun kuvan lukeminen epäonnistui';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Kuvan lataaminen epäonnistui: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Poista $imageType-kuva';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Tämä poistaa nykyisen kuvan kohteesta.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Kuvan poistaminen epäonnistui: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Valitse $imageType-kuva';
  }

  @override
  String get adminMetadataUpload => 'Lataa';

  @override
  String get adminMetadataUpdate => 'Päivittää';

  @override
  String get adminMetadataRemoteImage => 'Kaukokuva';

  @override
  String get adminPluginsInstalled => 'Asennettu';

  @override
  String get adminPluginsCatalog => 'Luettelo';

  @override
  String get adminPluginsActive => 'Aktiivinen';

  @override
  String get adminPluginsRestart => 'Käynnistä uudelleen';

  @override
  String get adminPluginsNoSearchResults =>
      'Mikään laajennus ei vastaa hakuasi';

  @override
  String get adminPluginsNoneInstalled => 'Laajennuksia ei ole asennettu';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Päivitys saatavilla: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Päivitys saatavilla';

  @override
  String get adminPluginsPendingRemoval =>
      'Odottaa poistamista uudelleenkäynnistyksen jälkeen';

  @override
  String get adminPluginsChangesPending =>
      'Muutokset odottavat uudelleenkäynnistystä';

  @override
  String get adminPluginsEnable => 'Ota käyttöön';

  @override
  String get adminPluginsDisable => 'Poista käytöstä';

  @override
  String get adminPluginsInstallUpdate => 'Asenna päivitys';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Asenna päivitys (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ei hakuasi vastaavia paketteja';

  @override
  String get adminPluginsCatalogEmpty => 'Paketteja ei ole saatavilla';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" asennetaan...';
  }

  @override
  String get adminPluginDetailExperimental => 'Kokeellinen integraatio';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Plugin-asetusten integrointi on vielä kokeellista. Jotkin kentät tai asettelut eivät ehkä vielä näy oikein.';

  @override
  String get adminPluginDetailToggle404 =>
      'Plugin vaihto epäonnistui. Palvelin ei löytänyt tätä laajennusversiota. Yritä päivittää laajennukset ja yritä sitten uudelleen.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Plugin vaihto epäonnistui. Tarkista lisätietoja palvelimen lokeista.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Asetukset';
  }

  @override
  String get adminPluginDetailDetails => 'Yksityiskohdat';

  @override
  String get adminPluginDetailDeveloper => 'Kehittäjä';

  @override
  String get adminPluginDetailRepository => 'Arkisto';

  @override
  String get adminPluginDetailBundled => 'Mukana';

  @override
  String get adminPluginDetailEnablePlugin => 'Ota laajennus käyttöön';

  @override
  String get adminPluginDetailRestartRequired =>
      'Palvelin on käynnistettävä uudelleen, jotta muutokset tulevat voimaan.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Tämä laajennus poistetaan palvelimen uudelleenkäynnistyksen jälkeen.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Tämä laajennus on toiminut väärin, eikä se välttämättä toimi oikein.';

  @override
  String get adminPluginDetailNotSupported =>
      'Nykyinen palvelinversio ei tue tätä laajennusta.';

  @override
  String get adminPluginDetailSuperseded =>
      'Tämä laajennus on korvattu uudemmalla versiolla.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Tietovarastojen lataaminen epäonnistui: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Poista arkisto';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Haluatko varmasti poistaa \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Poista';

  @override
  String adminReposSaveFailed(String error) {
    return 'Tietovarastojen tallentaminen epäonnistui: $error';
  }

  @override
  String get adminReposEmpty => 'Tietovarastoja ei ole määritetty';

  @override
  String get adminReposEmptySubtitle =>
      'Lisää arkisto selataksesi saatavilla olevia laajennuksia';

  @override
  String get adminReposUnnamed => '(nimetön)';

  @override
  String get adminReposEditTitle => 'Muokkaa arkistoa';

  @override
  String get adminReposAddTitle => 'Lisää arkisto';

  @override
  String get adminReposUrl => 'Tietovaraston URL-osoite';

  @override
  String get adminReposNameHint => 'esim. Jellyfin vakaa';

  @override
  String get adminPluginSettingsInvalidUrl => 'Virheellinen URL-osoite';

  @override
  String get adminGeneralSettingsTitle => 'Yleiset asetukset';

  @override
  String get adminGeneralMetadataLanguage => 'Ensisijainen metatietojen kieli';

  @override
  String get adminGeneralMetadataLanguageHint => 'esim. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Ensisijainen metatietojen maa';

  @override
  String get adminGeneralMetadataCountryHint => 'esim. USA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Kirjastoskannauksen samanaikaisuus';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Rinnakkaiskuvan koodausrajoitus';

  @override
  String get adminUnknownError => 'Tuntematon virhe';

  @override
  String get adminBrowse => 'Selaa';

  @override
  String get adminCloseBrowser => 'Sulje selain';

  @override
  String get adminNetworkingTitle => 'Verkostoituminen';

  @override
  String get adminNetworkingRestartWarning =>
      'Verkkoasetusten muutokset voivat vaatia palvelimen uudelleenkäynnistyksen.';

  @override
  String get adminNetworkingRemoteAccess => 'Ota etäkäyttö käyttöön';

  @override
  String get adminNetworkingPorts => 'Portit';

  @override
  String get adminNetworkingHttpPort => 'HTTP-portti';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-portti';

  @override
  String get adminNetworkingEnableHttps => 'Ota HTTPS käyttöön';

  @override
  String get adminNetworkingLocalNetwork => 'Paikallinen verkko';

  @override
  String get adminNetworkingLocalAddresses => 'Paikalliset verkko-osoitteet';

  @override
  String get adminNetworkingAddressHint => 'esim. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Tunnetut välityspalvelimet';

  @override
  String get adminNetworkingProxyHint => 'esim. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Valkoinen lista';

  @override
  String get adminNetworkingBlacklist => 'Musta lista';

  @override
  String get adminNetworkingAddEntry => 'Lisää merkintä';

  @override
  String get adminBrandingTitle => 'Brändäys';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Kirjautumisen vastuuvapauslauseke';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML näkyy kirjautumislomakkeen alla';

  @override
  String get adminBrandingCustomCss => 'Mukautettu CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Verkkokäyttöliittymään sovellettu mukautettu CSS';

  @override
  String get adminBrandingEnableSplash => 'Ota aloitusnäyttö käyttöön';

  @override
  String get adminBrandingSplashUpload => 'Lataa kuva';

  @override
  String get adminBrandingSplashUploaded => 'Aloitusruutu päivitetty';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Aloitusruudun lataaminen epäonnistui';

  @override
  String get adminBrandingSplashDeleted => 'Aloitusruutu poistettu';

  @override
  String get adminBrandingNoSplash => 'Ei mukautettua aloitusruutua';

  @override
  String get adminPlaybackHwAccel => 'Laitteistokiihdytys';

  @override
  String get adminPlaybackHwAccelLabel => 'Laitteistokiihdytys';

  @override
  String get adminPlaybackEnableHwEncoding => 'Ota käyttöön laitteistokoodaus';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Ota laitteiston dekoodaus käyttöön:';

  @override
  String get adminPlaybackQsvDevice => 'QSV-laite';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Ota tehostettu NVDEC-purkaja käyttöön';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Suosi järjestelmän natiivia laitteistopurkajaa';

  @override
  String get adminPlaybackColorDepth => 'Laitteistopurun värisyvyys';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bittinen HEVC-purku';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bittinen VP9-purku';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bittinen purku';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bittinen purku';

  @override
  String get adminPlaybackHwEncodingSection => 'Laitteistokoodaus';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Salli HEVC-koodaus';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Salli AV1-koodaus';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Ota Intelin vähävirtainen H.264-koodain käyttöön';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Ota Intelin vähävirtainen HEVC-koodain käyttöön';

  @override
  String get adminPlaybackToneMapping => 'Sävykartoitus';

  @override
  String get adminPlaybackEnableTonemapping => 'Ota sävykartoitus käyttöön';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Ota VPP-sävykartoitus käyttöön';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Ota VideoToolbox-sävykartoitus käyttöön';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Sävykartoituksen algoritmi';

  @override
  String get adminPlaybackTonemappingMode => 'Sävykartoituksen tila';

  @override
  String get adminPlaybackTonemappingRange => 'Sävykartoituksen alue';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Sävykartoituksen värikylläisyyden vähennys';

  @override
  String get adminPlaybackTonemappingPeak => 'Sävykartoituksen huippuarvo';

  @override
  String get adminPlaybackTonemappingParam => 'Sävykartoituksen parametri';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP-sävykartoituksen kirkkaus';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP-sävykartoituksen kontrasti';

  @override
  String get adminPlaybackPresetsQuality => 'Esiasetukset ja laatu';

  @override
  String get adminPlaybackEncoderPreset => 'Koodaimen esiasetus';

  @override
  String get adminPlaybackH264Crf => 'H.264-koodauksen CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) -koodauksen CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Lomituksenpoiston menetelmä';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Kaksinkertaista kuvataajuus lomitusta poistettaessa';

  @override
  String get adminPlaybackAudioSection => 'Ääni';

  @override
  String get adminPlaybackEnableAudioVbr => 'Ota äänen VBR-koodaus käyttöön';

  @override
  String get adminPlaybackDownmixBoost => 'Äänen alasmiksauksen korostus';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereoalasmiksauksen algoritmi';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Muksausjonon enimmäiskoko';

  @override
  String get adminPlaybackAutoOption => 'Automaattinen';

  @override
  String get adminPlaybackEncoding => 'Koodaus';

  @override
  String get adminPlaybackEncodingThreads => 'Säikeiden koodaus';

  @override
  String get adminPlaybackFallbackFont => 'Ota varafontti käyttöön';

  @override
  String get adminPlaybackFallbackFontPath => 'Varafontin polku';

  @override
  String get adminPlaybackStreaming => 'Suoratoisto';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Äänikirjat';

  @override
  String get adminResumeMinAudiobookPct =>
      'Äänikirjan ansioluettelon vähimmäisprosentti';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Äänikirjan ansioluettelon enimmäisprosentti';

  @override
  String get adminStreamingBitrateLimit =>
      'Etäasiakkaan bittinopeusrajoitus (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Jätä tyhjäksi tai 0 rajattomasti';

  @override
  String get adminTrickplayHwAccel => 'Ota käyttöön laitteistokiihdytys';

  @override
  String get adminTrickplayHwEncoding => 'Ota käyttöön laitteistokoodaus';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Ota käyttöön vain avainkehysten purkaminen';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Nopeampi mutta pienempi tarkkuus';

  @override
  String get adminTrickplayNonBlocking => 'Ei-esto';

  @override
  String get adminTrickplayBlocking => 'Estäminen';

  @override
  String get adminTrickplayPriorityHigh => 'Korkea';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Normaalia korkeampi';

  @override
  String get adminTrickplayPriorityNormal => 'Normaali';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Normaalin alapuolella';

  @override
  String get adminTrickplayPriorityIdle => 'Tyhjäkäynti';

  @override
  String get adminTrickplayImageSettings => 'Kuva-asetukset';

  @override
  String get adminTrickplayInterval => 'Aikaväli (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Kuinka usein ottaa kuvia';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Pilkuilla erotetut pikselien leveydet (esim. 320)';

  @override
  String get adminTrickplayQuality => 'Laatu';

  @override
  String get adminTrickplayQScale => 'Laatuasteikko';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Pienemmät arvot = parempi laatu, suuremmat tiedostot';

  @override
  String get adminTrickplayJpegQuality => 'JPEG laatu';

  @override
  String get adminTrickplayProcessing => 'Käsittely';

  @override
  String get adminTasksEmpty => 'Ajastettuja tehtäviä ei löytynyt';

  @override
  String get adminTasksNoFilterMatch =>
      'Yksikään tehtävä ei vastaa nykyistä suodatinta';

  @override
  String get adminTaskCancelling => 'Peruutetaan...';

  @override
  String get adminTaskRunning => 'Juokse...';

  @override
  String get adminTaskNeverRun => 'Älä koskaan juokse';

  @override
  String get adminTaskStop => 'Pysäytä';

  @override
  String get adminRunningTasks => 'Käynnissä olevat tehtävät';

  @override
  String get adminTaskRun => 'Juokse';

  @override
  String get adminTaskDetailLastExecution => 'Viimeinen teloitus';

  @override
  String get adminTaskDetailStarted => 'Aloitettu';

  @override
  String get adminTaskDetailEnded => 'Päättyi';

  @override
  String get adminTaskDetailDuration => 'Kesto';

  @override
  String get adminTaskDetailErrorLabel => 'Virhe:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Päivittäin osoitteessa $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Joka $day $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Joka $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Sovelluksen käynnistyksen yhteydessä';

  @override
  String get adminTaskTriggerTypeDaily => 'Päivittäin';

  @override
  String get adminTaskTriggerTypeWeekly => 'Viikoittain';

  @override
  String get adminTaskTriggerTypeInterval => 'Välillä';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervalli';

  @override
  String get adminTaskTriggerEveryHour => 'Joka tunti';

  @override
  String get adminTaskTriggerEvery6Hours => '6 tunnin välein';

  @override
  String get adminTaskTriggerEvery12Hours => '12 tunnin välein';

  @override
  String get adminTaskTriggerEvery24Hours => '24 tunnin välein';

  @override
  String get adminTaskTriggerEvery2Days => '2 päivän välein';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tuntia',
      one: '1 tunti',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Aika';

  @override
  String get adminTaskTriggerNoLimit => 'Ei rajaa';

  @override
  String get adminActivityJustNow => 'Juuri nyt';

  @override
  String get adminActivityLastHour => 'Viimeinen tunti';

  @override
  String get adminActivityToday => 'Tänään';

  @override
  String get adminActivityYesterday => 'Eilen';

  @override
  String get adminActivityOlder => 'Vanhempi';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d sitten';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h sitten';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}min sitten';
  }

  @override
  String get adminActivityNow => 'nyt';

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
    return '$days pv';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month.';
  }

  @override
  String get adminTrickplayDescription =>
      'Määritä trickplay-kuvien luominen esikatselun pikkukuvien etsimistä varten.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Julkinen HTTPS-portti';

  @override
  String get adminNetworkingBaseUrl => 'Perus-URL-osoite';

  @override
  String get adminNetworkingBaseUrlHint => 'esim. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Julkinen HTTP-portti';

  @override
  String get adminNetworkingRequireHttps => 'Vaadi HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Ohjaa kaikki etäpyynnöt HTTPS:ään. Ei vaikutusta, jos palvelimella ei ole voimassa olevaa varmennetta.';

  @override
  String get adminNetworkingCertPassword => 'Varmenteen salasana';

  @override
  String get adminNetworkingIpSettings => 'IP-asetukset';

  @override
  String get adminNetworkingEnableIpv4 => 'Ota IPv4 käyttöön';

  @override
  String get adminNetworkingEnableIpv6 => 'Ota IPv6 käyttöön';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Ota automaattinen porttien ohjaus käyttöön';

  @override
  String get adminNetworkingLocalSubnets => 'Lähiverkot';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Pilkulla tai rivinvaihdolla erotettu luettelo IP-osoitteista tai CIDR-aliverkoista, jotka katsotaan lähiverkoksi.';

  @override
  String get adminNetworkingPublishedUris =>
      'Julkaistut palvelimen URI-osoitteet';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Yhdistä aliverkko tai osoite julkaistuun URL-osoitteeseen, esim. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Varmenteen polku';

  @override
  String get adminNetworkingRemoteIpFilter => 'Etä-IP-suodatin';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Etä-IP-suodatin';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API laite';

  @override
  String get adminPlaybackAutomatic => '0 = automaattinen';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transkoodaus lämpötilapolku';

  @override
  String get adminPlaybackSegmentDeletion => 'Salli segmentin poistaminen';

  @override
  String get adminPlaybackSegmentKeep => 'Segmentin säilytys (sekuntia)';

  @override
  String get adminPlaybackThrottleBuffering => 'Kaasun puskurointi';

  @override
  String get adminPlaybackThrottleDelay => 'Kuristuksen viive (sekuntia)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Salli tekstitysten purku lennossa';

  @override
  String get adminResumeMinPct => 'Minimi jatkamisprosentti';

  @override
  String get adminResumeMinPctSubtitle =>
      'Sisältöä on toistettava tämän prosenttiosuuden yli, jotta edistyminen tallentuu';

  @override
  String get adminResumeMaxPct => 'Maksimi jatkamisprosentti';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Sisältö katsotaan kokonaan toistetuksi tämän prosenttiosuuden jälkeen';

  @override
  String get adminResumeMinDuration =>
      'Ansioluettelon vähimmäiskesto (sekuntia)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Tätä lyhyempiä tuotteita ei voida jatkaa';

  @override
  String get adminTrickplayScanBehavior => 'Skannauskäyttäytyminen';

  @override
  String get adminTrickplayProcessPriority => 'Prosessin prioriteetti';

  @override
  String get adminTrickplayTileWidth => 'Laattojen leveys';

  @override
  String get adminTrickplayTileHeight => 'Laattojen korkeus';

  @override
  String get adminTrickplayProcessThreads => 'Käsittele säikeitä';

  @override
  String get adminTrickplayWidthResolutions => 'Leveyden resoluutiot';

  @override
  String get adminMetadataDefault => 'Oletus';

  @override
  String get adminMetadataContentTypeUpdated => 'Sisältötyyppi päivitetty';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Sisältötyypin päivittäminen epäonnistui: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Hitaan vasteen kynnys (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Ota hitaiden vastausten varoitukset käyttöön';

  @override
  String get adminGeneralQuickConnect => 'Ota Quick Connect käyttöön';

  @override
  String get adminGeneralSectionServer => 'Palvelin';

  @override
  String get adminGeneralSectionMetadata => 'Metatiedot';

  @override
  String get adminGeneralSectionPaths => 'Polut';

  @override
  String get adminGeneralSectionPerformance => 'Suorituskyky';

  @override
  String get adminGeneralCachePath => 'Välimuistin polku';

  @override
  String get adminGeneralMetadataPath => 'Metatietojen polku';

  @override
  String get adminGeneralServerName => 'Palvelimen nimi';

  @override
  String get adminGeneralDisplayLanguage => 'Ensisijainen näyttökieli';

  @override
  String get adminSettingsLoadFailed => 'Asetusten lataaminen epäonnistui';

  @override
  String get adminDiscover => 'Tutustu';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Kartoitusten päivittäminen epäonnistui: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Aikaraja: $duration';
  }

  @override
  String get folders => 'Kansiot';

  @override
  String get libraries => 'Kirjastot';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay pois käytöstä';

  @override
  String get syncPlayDisabledMessage =>
      'Ota SyncPlay käyttöön asetuksissa, jos haluat käyttää synkronoitua toistoa.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Palvelinta ei tueta';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay vaatii Jellyfin-palvelimen. Nykyinen palvelin ei tue sitä.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Ryhmä';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay-ryhmä';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# osallistujaa',
      one: '# osallistuja',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ohita odotus';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Älä pidä ryhmää pystyssä, kun tämä laite puskuroi';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Jatka paikallisesti odottamatta hitaita jäseniä';

  @override
  String get syncPlayRepeat => 'Toistaa';

  @override
  String get syncPlayRepeatOne => 'Yksi';

  @override
  String get syncPlayShuffleModeShuffled => 'Sekoitettu';

  @override
  String get syncPlayShuffleModeSorted => 'Lajiteltu';

  @override
  String get syncPlaySyncCurrentQueue => 'Synkronoi nykyinen toistojono';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Korvaa ryhmäjono sillä, mitä soitetaan paikallisesti';

  @override
  String get syncPlayLeaveGroup => 'Poistu ryhmästä';

  @override
  String get syncPlayGroupQueue => 'Ryhmän jono';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Kohde $index';
  }

  @override
  String get syncPlayPlayNow => 'Pelaa nyt';

  @override
  String get syncPlayCreateNewGroup => 'Luo uusi ryhmä';

  @override
  String get syncPlayGroupName => 'Ryhmän nimi';

  @override
  String get syncPlayDefaultGroupName => 'Oma SyncPlay-ryhmä';

  @override
  String get syncPlayCreateGroup => 'Luo ryhmä';

  @override
  String get syncPlayAvailableGroups => 'Saatavilla olevat ryhmät';

  @override
  String get syncPlayNoGroupsAvailable => 'Ryhmiä ei ole saatavilla';

  @override
  String get syncPlayJoinGroupQuestion => 'Liitytkö SyncPlay-ryhmään?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay-ryhmään liittyminen voi korvata nykyisen toistojonosi. Jatkaa?';

  @override
  String get syncPlayJoin => 'Liity';

  @override
  String get syncPlayStateIdle => 'Tyhjäkäynti';

  @override
  String get syncPlayStateWaiting => 'Odottaa';

  @override
  String get syncPlayStatePaused => 'Keskeytetty';

  @override
  String get syncPlayStatePlaying => 'Pelaaminen';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName liittyi SyncPlay ryhmään';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName lähti SyncPlay ryhmästä';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-käyttö estetty';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Sinulla ei ole pääsyä yhteen tai useampaan kohteeseen tässä SyncPlay-ryhmässä. Pyydä ryhmän omistajaa vahvistamaan kirjaston käyttöoikeudet tai valitse toinen jono.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synkronoidaan toistoa $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Puhehaku ei ole käytettävissä.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct Play epäonnistui';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Tämän Dolby Vision -virran suoratoisto epäonnistui. Yritetäänkö palvelimen transkoodaus uudelleen?';

  @override
  String get retryWithTranscode => 'Yritä uudelleen transkoodauksella';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Visionia ei tueta';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Tämä laite ei voi purkaa Dolby Vision -sisältöä suoraan. Käytä HDR10-varaa tai pyydä palvelimen transkoodausta.';

  @override
  String get rememberMyChoice => 'Muista valintani';

  @override
  String get playHdr10Fallback => 'Pelaa HDR10-varaa';

  @override
  String get requestTranscode => 'Pyydä transkoodausta';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# riviä löytyi',
      one: '# rivi löytyi',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Katso kaikki';

  @override
  String get noItems => 'Ei kohteita';

  @override
  String get switchUser => 'Vaihda käyttäjää';

  @override
  String get remoteControl => 'Kaukosäädin';

  @override
  String get mediaBarLoading => 'Ladataan mediapalkkia...';

  @override
  String get mediaBarError => 'Mediapalkin lataaminen epäonnistui';

  @override
  String get offlineServerUnavailable =>
      'Yhteys Internetiin, mutta nykyinen palvelin ei ole käytettävissä.';

  @override
  String get offlineNoInternet =>
      'Olet offline-tilassa. Vain ladattu sisältö on saatavilla.';

  @override
  String get offlineFileNotAvailable => 'Tiedosto ei ole käytettävissä';

  @override
  String get offlineSwitchServer => 'Vaihda palvelinta';

  @override
  String get offlineSavedMedia => 'Tallennettu media';

  @override
  String get offlineBannerTitle => 'Olet offline-tilassa';

  @override
  String get offlineBannerSubtitle => 'Näytetään lataamasi sisältö';

  @override
  String get offlineBannerAction => 'Lataukset';

  @override
  String get serverUnreachableBannerTitle => 'Palvelimeen ei saada yhteyttä';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Toistetaan latauksista, kunnes yhteys palaa';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Kaukotoisto';

  @override
  String castControlFailed(String error) {
    return 'Cast-ohjaus epäonnistui: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Ohjaimet';
  }

  @override
  String get castDeviceVolume => 'Laitteen äänenvoimakkuus';

  @override
  String get castVolumeUnavailable => 'Ei saatavilla';

  @override
  String castStopKind(String kind) {
    return 'Pysäytä $kind';
  }

  @override
  String get audioLabel => 'Ääni';

  @override
  String get subtitlesLabel => 'Tekstitykset';

  @override
  String get pinConfirmTitle => 'Vahvista PIN';

  @override
  String get pinSetTitle => 'Aseta PIN';

  @override
  String get pinEnterTitle => 'Anna PIN-koodi';

  @override
  String get pinReenterToConfirm => 'Vahvista syöttämällä PIN-koodi uudelleen';

  @override
  String pinEnterNDigit(int length) {
    return 'Anna $length-numeroinen PIN-koodi';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Anna $length-numeroinen PIN-koodi';
  }

  @override
  String get pinIncorrect => 'Väärä PIN-koodi';

  @override
  String get pinMismatch => 'PIN-koodit eivät täsmää';

  @override
  String get pinForgot => 'Unohditko PIN-koodin?';

  @override
  String get pinClear => 'Tyhjennä';

  @override
  String get pinBackspace => 'Askelpalautin';

  @override
  String get quickConnectAuthorized => 'Quick Connect -pyyntö hyväksytty.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect -koodi on virheellinen tai vanhentunut.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connectia ei tueta tällä palvelimella.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect -koodin valtuuttaminen epäonnistui.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect on poistettu käytöstä tällä palvelimella.';

  @override
  String get quickConnectForbidden =>
      'Tilisi ei voi valtuuttaa tätä Quick Connect -pyyntöä.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect -koodia ei löytynyt. Kokeile uutta koodia.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect epäonnistui: $message';
  }

  @override
  String get quickConnectEnterCode => 'Syötä koodi';

  @override
  String get quickConnectAuthorize => 'Valtuuta';

  @override
  String remoteCommandFailed(String error) {
    return 'Komento epäonnistui: $error';
  }

  @override
  String get remoteControlTitle => 'Kaukosäädin';

  @override
  String get remoteFailedToLoadSessions => 'Istuntojen lataaminen epäonnistui';

  @override
  String get remoteNoSessions => 'Ei ohjattavia istuntoja';

  @override
  String get remoteStartPlayback => 'Aloita toisto toisella laitteella';

  @override
  String get unknownUser => 'Tuntematon';

  @override
  String get unknownItem => 'Tuntematon';

  @override
  String get remoteNothingPlaying => 'Tässä istunnossa ei toisteta mitään';

  @override
  String get castingStarted => 'Suoratoisto aloitettiin valitulla laitteella';

  @override
  String castingFailed(String error) {
    return 'Suoratoiston aloittaminen epäonnistui: $error';
  }

  @override
  String get noRemoteDevices => 'Etätoistolaitteita ei ole saatavilla.';

  @override
  String get noRemoteDevicesIos =>
      'Etätoistolaitteita ei ole saatavilla.\n\niOS:ssä AirPlay-kohteet eivät ehkä ole käytettävissä simulaattorissa.';

  @override
  String get trackActionPlayNext => 'Pelaa seuraavaksi';

  @override
  String get trackActionAddToQueue => 'Lisää jonoon';

  @override
  String get trackActionAddToPlaylist => 'Lisää soittolistaan';

  @override
  String get trackActionCancelDownload => 'Peruuta lataus';

  @override
  String get trackActionDeleteFromPlaylist => 'Poista soittolistasta';

  @override
  String get trackActionMoveUp => 'Siirrä ylös';

  @override
  String get trackActionMoveDown => 'Siirrä alas';

  @override
  String get trackActionRemoveFromFavorites => 'Poista suosikeista';

  @override
  String get trackActionAddToFavorites => 'Lisää suosikkeihin';

  @override
  String get trackActionGoToAlbum => 'Siirry albumiin';

  @override
  String get trackActionGoToArtist => 'Siirry Artistiin';

  @override
  String trackActionDownloading(String name) {
    return 'Ladataan $name...';
  }

  @override
  String get trackActionDeletedFile => 'Ladattu tiedosto poistettu';

  @override
  String get trackActionDeleteFileFailed =>
      'Ladattua tiedostoa ei voitu poistaa';

  @override
  String get shuffleBy => 'Satunnaistoiston peruste';

  @override
  String get shuffleSelectLibrary => 'Valitse Kirjasto';

  @override
  String get shuffleSelectGenre => 'Valitse Genre';

  @override
  String get shuffleLibrary => 'Kirjasto';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries =>
      'Yhteensopivia kirjastoja ei ole saatavilla.';

  @override
  String get shuffleNoGenres => 'Tälle sekoitustilalle ei löytynyt genrejä.';

  @override
  String get posterDisplayTitle => 'Näyttö';

  @override
  String get posterImageType => 'Kuvatyyppi';

  @override
  String get imageTypePoster => 'Juliste';

  @override
  String get imageTypeThumbnail => 'Pikkukuva';

  @override
  String get imageTypeBanner => 'Banneri';

  @override
  String get playlistAddFailed => 'Lisääminen soittolistaan ​​epäonnistui';

  @override
  String get playlistCreateFailed => 'Soittolistan luominen epäonnistui';

  @override
  String get playlistNew => 'Uusi soittolista';

  @override
  String get playlistCreate => 'Luoda';

  @override
  String get playlistCreateNew => 'Luo uusi soittolista';

  @override
  String get playlistNoneFound => 'Soittolistoja ei löytynyt';

  @override
  String get addToPlaylist => 'Lisää soittolistaan';

  @override
  String get lyricsNotAvailable => 'Sanoja ei ole saatavilla';

  @override
  String get upNext => 'Seuraavaksi ylös';

  @override
  String get playNext => 'Pelaa seuraavaksi';

  @override
  String get stillWatchingContent => 'Toisto on keskeytetty. Katsotko vielä?';

  @override
  String get stillWatchingStop => 'Pysäytä';

  @override
  String get stillWatchingContinue => 'Jatkaa';

  @override
  String skipSegment(String segment) {
    return 'Ohita $segment';
  }

  @override
  String get liveTv => 'Live-TV';

  @override
  String get continueWatchingAndNextUp => 'Jatka katselua ja seuraavaksi';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Ladataan $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Ladataan $fileName';
  }

  @override
  String get nextEpisode => 'Seuraava jakso';

  @override
  String get moreFromThisSeason => 'Lisää tältä kaudelta';

  @override
  String get playerTooltipPlaybackSpeed => 'Toistonopeus';

  @override
  String get playerTooltipCastControls => 'Cast-ohjaimet';

  @override
  String get playerTooltipPlaybackQuality => 'Bittinopeus';

  @override
  String get playerTooltipEnterFullscreen => 'Siirry koko näytön tilaan';

  @override
  String get playerTooltipExitFullscreen => 'Poistu koko näytöstä';

  @override
  String get playerTooltipFloatOnTop => 'Kellu päälle';

  @override
  String get playerTooltipExitFloatOnTop => 'Poista float päällä';

  @override
  String get playerTooltipLockLandscape => 'Lukko maisema';

  @override
  String get playerTooltipUnlockOrientation => 'Salli pyöritys';

  @override
  String get playerTooltipPrevious => 'Edellinen';

  @override
  String get playerTooltipSeekBack => 'Etsi takaisin';

  @override
  String get playerTooltipSeekForward => 'Etsi eteenpäin';

  @override
  String get contextMenuMarkWatched => 'Merkitse katsotuksi';

  @override
  String get contextMenuMarkUnwatched => 'Merkitse katsomattomaksi';

  @override
  String get contextMenuAddToFavorites => 'Lisää suosikkeihin';

  @override
  String get contextMenuRemoveFromFavorites => 'Poista suosikeista';

  @override
  String get contextMenuGoToSeries => 'Siirry sarjaan';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Piilota Jatka katselua -osiosta';

  @override
  String get contextMenuHideFromNextUp => 'Piilota Seuraavaksi-osiosta';

  @override
  String get contextMenuAddToCollection => 'Lisää kokoelmaan';

  @override
  String get settingsAdministrationSubtitle =>
      'Siirry palvelimen hallintapaneeliin';

  @override
  String get settingsAccountSecurity => 'Tili ja suojaus';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Todennus, PIN-koodi ja lapsilukko';

  @override
  String get settingsPersonalization => 'Personointi';

  @override
  String get settingsPersonalizationSubtitle =>
      'Teema, navigointi, kotirivit ja kirjaston näkyvyys';

  @override
  String get settingsDynamicContent => 'Dynaaminen sisältö';

  @override
  String get settingsDynamicContentSubtitle =>
      'Mediapalkki ja visuaaliset peittokuvat';

  @override
  String get settingsPlaybackSyncplay => 'Toisto ja SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Ääni-/videoasetukset, tekstitykset, lataukset ja SyncPlay-ohjaimet';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plugin sync, Seerr, luokitukset ja paljon muuta';

  @override
  String get settingsAboutSubtitle =>
      'Sovelluksen versio, lakitiedot ja krediitit';

  @override
  String get settingsAuthenticationSection => 'TODENNUS';

  @override
  String get settingsSortServersBy => 'Lajittele palvelimet';

  @override
  String get settingsLastUsed => 'Viimeksi käytetty';

  @override
  String get settingsAlphabetical => 'Aakkosellinen';

  @override
  String get settingsConnectionSection => 'YHTEYS';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Salli itse allekirjoitetut varmenteet';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Luota palvelimiin, jotka käyttävät itse allekirjoitettuja tai yksityisen CA:n TLS-varmenteita. Ota käyttöön vain hallitsemillesi palvelimille. Tämä poistaa varmenteiden tarkistuksen kaikista yhteyksistä.';

  @override
  String get settingsPrivacyAndSafetySection =>
      'YKSITYISYYDEN SUOJA JA TURVALLISUUS';

  @override
  String get settingsBlockedRatings => 'Estetyt luokitukset';

  @override
  String get settingsGeneralStyle => 'Yleinen tyyli';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Teeman korostukset, taustat, katsotut indikaattorit ja teemamusiikki';

  @override
  String get settingsDetailsScreen => 'Tietonäkymä';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Tyyli, taustan sumennus ja välilehtien toiminta';

  @override
  String get settingsHomePage => 'Kotisivu';

  @override
  String get settingsHomePageSubtitle =>
      'Osat, kuvatyypit, peittokuvat ja median esikatselut';

  @override
  String get settingsLibrariesSubtitle =>
      'Kirjaston näkyvyys, kansionäkymä ja usean palvelimen toiminta';

  @override
  String get settingsTwentyFourHourClock => '24 tunnin kello';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Käytä 24 tunnin ajan muotoilua kaikkialla, missä kello näkyy';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Näytä sekoituspainike navigointipalkissa';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Näytä genre-painike navigointipalkissa';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Näytä suosikit-painike navigointipalkissa';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Näytä kirjastot-painike navigointipalkissa';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Näytä Seerr-painike navigointipalkissa';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Näytä tekstit aina ylänavigointipalkissa';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Vaihda etusivun näkyvyys kirjastoittain. Käynnistä Moonfin uudelleen, jotta muutokset tulevat voimaan.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Mediapalkki ja paikalliset esikatselut';

  @override
  String get settingsVisualOverlays => 'Visuaaliset peittokuvat';

  @override
  String get settingsSeasonalSurprise => 'Kauden yllätys';

  @override
  String get settingsMetadataAndRatings => 'Metatiedot ja luokitukset';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase tukee palvelinpuolen integraatioita, mukaan lukien lisäluokituslähteet, Seerr-pyynnöt ja synkronoidut asetukset.';

  @override
  String get settingsOfflineDownloads => 'Offline-lataukset';

  @override
  String get settingsHigh => 'Korkea';

  @override
  String get settingsLow => 'Matala';

  @override
  String get settingsCustomPath => 'Mukautettu polku';

  @override
  String get settingsEnterDownloadFolderPath => 'Anna latauskansion polku';

  @override
  String get settingsConcurrentDownloads => 'Samanaikaiset lataukset';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Enimmäismäärä kerralla ladattavia kohteita.';

  @override
  String get settingsAppInfo => 'SOVELLUSTIEDOT';

  @override
  String get settingsReportAnIssue => 'Ilmoita ongelmasta';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Avaa ongelmanseuranta GitHubissa';

  @override
  String get settingsJoinDiscord => 'Liity Discordiin';

  @override
  String get settingsJoinDiscordSubtitle => 'Keskustele yhteisön kanssa';

  @override
  String get settingsJoinTheDiscord => 'Liity Discordiin';

  @override
  String get settingsSupportMoonfin => 'Tue Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Lahjoita kahvi kehittäjälle';

  @override
  String get settingsLegal => 'LAKI';

  @override
  String get settingsLicenses => 'Lisenssit';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Avoimen lähdekoodin lisenssiilmoitukset';

  @override
  String get settingsPrivacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Kuinka Moonfin käsittelee tietojasi';

  @override
  String get settingsCheckForUpdates => 'Tarkista päivitykset';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Tarkista viimeisin Moonfin-julkaisu';

  @override
  String get settingsPoweredByFlutter => 'Voimanlähteenä Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# lisenssi-ilmoitusta',
      one: '# lisenssi-ilmoitus',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Molemmat';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Sekoita sisältötyyppisuodatin';

  @override
  String get settingsVideoPlaybackPreferences => 'Videon toistoasetukset';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Ydinvideomoottori ja suoratoiston laatuasetukset';

  @override
  String get settingsAudioPreferences => 'Ääniasetukset';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Ääniraidat, käsittely ja läpivientivaihtoehdot';

  @override
  String get settingsAutomationAndQueue => 'Automaatio ja jono';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automaattinen toisto ja sekvenssi';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Latausten laatu, tallennusrajat ja jonon koko';

  @override
  String get settingsSyncplaySubtitle =>
      'Synkronointilogiikka ryhmäistunnoille';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Erikoistuneet soittimen ominaisuudet. Käytä varoen, sillä jotkin vaihtoehdot voivat aiheuttaa toistoongelmia';

  @override
  String get settingsSkipIntrosAndOutros => 'Ohitetaanko introt ja loppupalat?';

  @override
  String get settingsMediaSegmentCountdown => 'Mediasegmentin ajastin';

  @override
  String get settingsProgressBar => 'Edistymispalkki';

  @override
  String get settingsTimer => 'Ajastin';

  @override
  String get settingsNone => 'Ei mitään';

  @override
  String get settingsPromptUser => 'Kehota käyttäjää';

  @override
  String get settingsSkip => 'Ohita';

  @override
  String get settingsDoNothing => 'Älä tee mitään';

  @override
  String get settingsMaxBitrateDescription =>
      'Rajoita suoratoiston bittinopeus. Tämän kynnyksen ylittävä sisältö muunnetaan sopivaksi.';

  @override
  String get settingsMaxResolutionDescription =>
      'Rajoita soittimen pyytämää enimmäisresoluutiota. Korkeamman resoluution sisältö transkoodataan alaspäin.';

  @override
  String get settingsPlayerZoomDescription =>
      'Kuinka video tulee skaalata näytölle sopivaksi.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Toistomoottori (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Valitse oletustoistomoottori Android TV -laitteissa. Muutokset koskevat seuraavaa toistokertaa.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (suositus)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (vanha)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (perintö)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (suositus)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Varavaihtoehto';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision -nimikkeiden käyttäytyminen laitteissa, joissa ei ole Dolby Vision -dekoodausta.';

  @override
  String get settingsAskEachTime => 'Kysy joka kerta';

  @override
  String get settingsPreferHdr10Fallback => 'Suosi HDR10-varausvaihtoehtoa';

  @override
  String get settingsPreferServerTranscode => 'Suosi palvelimen transkoodausta';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profiili 7 Suoratoisto';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Ohjaa, ohjataanko Dolby Vision -profiili 7 -parannuskerroksen streameja.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automaattinen (AFTKRT käytössä)';

  @override
  String get settingsEnabledOnThisDevice => 'Käytössä tässä laitteessa';

  @override
  String get settingsDisabledPreferTranscode =>
      'Ei käytössä (ensisijaisesti transkoodaus)';

  @override
  String get settingsResumeRewindDescription =>
      'Kun toistoa jatketaan (Jatka katselua -sivulta tai mediakohdesivulta), kuinka monta sekuntia tulee kelata taaksepäin?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Kun toistoa jatketaan taukopainikkeen painamisen jälkeen, kuinka monta sekuntia tulee kelata taaksepäin?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Kuinka monta sekuntia palataan taaksepäin kelauspainikkeen painamisen jälkeen.';

  @override
  String get settingsOneSecond => '1 sekunti';

  @override
  String get settingsThreeSeconds => '3 sekuntia';

  @override
  String get settingsFortyFiveSeconds => '45 sekuntia';

  @override
  String get settingsSixtySeconds => '60 sekuntia';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Kuinka monta sekuntia hyppää eteenpäin eteenpäinkelauspainikkeen painamisen jälkeen.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bittivirta AC3 ulkoiseen dekooderiin';

  @override
  String get settingsCinemaMode => 'Elokuvatila';

  @override
  String get settingsCinemaModeSubtitle =>
      'Toista trailereita/esivideoita ennen pääominaisuutta';

  @override
  String get settingsNextUpDisplayDescription =>
      'Laajennettu näyttää täyden kortin jakson kuvituksella ja kuvauksella. Minimi näyttää kompaktin lähtölaskentapeittokuvan. Pois käytöstä piilottaa kehotteen kokonaan.';

  @override
  String get settingsShort => 'Lyhyt';

  @override
  String get settingsLong => 'Pitkä';

  @override
  String get settingsVeryLong => 'Erittäin pitkä';

  @override
  String get settingsVideoStartDelay => 'Videon aloitusviive';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Suora TV-lähetys';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Ota suora toisto käyttöön live-TV:ssä';

  @override
  String get settingsOpenGroups => 'Avaa Ryhmät';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Luo SyncPlay-ryhmiä, liity niihin tai hallinnoi niitä';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay käytössä';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Ota ryhmäkatseluominaisuudet käyttöön';

  @override
  String get settingsSyncplayButton => 'SyncPlay-painike';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Näytä SyncPlay-painike navigointipalkissa';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Edistynyt korjaus';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Ota hienorakeinen synkronointilogiikka käyttöön';

  @override
  String get settingsSyncplaySyncCorrection => 'Synkronoinnin korjaus';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Säädä toisto automaattisesti pysyäksesi synkronoituna';

  @override
  String get settingsSyncplaySpeedToSync => 'Synkronointinopeus';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Käytä synkronointiin toistonopeuden säätöä';

  @override
  String get settingsSyncplaySkipToSync => 'Siirry synkronointiin';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Käytä etsintää synkronointiin';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Miniminopeusviive';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Suurin nopeuden viive';

  @override
  String get settingsSyncplaySpeedDuration => 'Nopeuden kesto';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimi ohitusviive';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Ylimääräinen offset';

  @override
  String get onNow => 'Käytössä Nyt';

  @override
  String get collections => 'Kokoelmat';

  @override
  String get lastPlayed => 'Viimeksi pelattu';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Uusin $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Äskettäin julkaistut: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Toista seuraava jakso automaattisesti';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Toista seuraava jakso automaattisesti, kun se on saatavilla.';

  @override
  String get skipSilenceTitle => 'Ohita hiljaisuus';

  @override
  String get skipSilenceSubtitle =>
      'Ohita automaattisesti äänettömät ääniosat, jos suoratoisto tukee sitä.';

  @override
  String get allowExternalAudioEffectsTitle => 'Salli ulkoiset äänitehosteet';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Salli taajuuskorjain- ja tehostesovellusten (esim. Wavelet) liittää Media3-toistoistuntoihin.';

  @override
  String get disableTunnelingTitle => 'Poista tunnelointi käytöstä';

  @override
  String get disableTunnelingSubtitle =>
      'Pakota ei-tunneloitu toisto. Hyödyllinen laitteissa, joissa tunneloidaan audio-/videokatkoksia.';

  @override
  String get enableTunnelingTitle => 'Ota tunnelointi käyttöön';

  @override
  String get enableTunnelingSubtitle =>
      'Lisäasetus. Reitittää äänen ja videon kytketyn laitteistopolun kautta. Oletuksena pois päältä, koska se aiheuttaa ääni- ja kuvakatkoja joillakin laitteilla.';

  @override
  String get mapDolbyVisionP7Title =>
      'Yhdistä Dolby Vision profiili 7 HEVC:hen';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Toista Dolby Vision profiilin 7 suoratoisto HDR10-yhteensopivana HEVC:nä muilla kuin DV-laitteilla.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Käytä upotettuja tekstitystyylejä';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Käytä tekstitysrataan upotettuja värejä, fontteja ja sijoittelua. Poista käytöstä tekstitystyyliasetusten käyttö sen sijaan.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Käytä upotettuja tekstityskirjasinkokoja';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Käytä tekstitysrataan upotettuja kirjasinkokoisia vihjeitä. Poista käytöstä tekstityskoon käyttö tyyliasetuksistasi.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Näytä median tiedot';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Näytä valitun kohteen tiedot kirjastosivujen yläosassa.';

  @override
  String get hideBackdropsInLibraries =>
      'Piilotetaanko taustakuvat selattaessa?';

  @override
  String get useDetailedSubHeadings => 'Käytä yksityiskohtaisia ​​alaotsikoita';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Näytä yksityiskohtainen tai pieni alarivi kirjastosivuilla.';

  @override
  String get savedThemesDeleteDialogTitle => 'Poistetaanko tallennettu teema?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Poistetaanko \"$themeName\" tämän laitteen välimuistista?';
  }

  @override
  String get themeStore => 'Teemakauppa';

  @override
  String get themeStoreSubtitle => 'Selaa ja tallenna yhteisön teemoja';

  @override
  String get themeStoreDescription =>
      'Tallenna teema, niin voit käyttää sitä muiden tallentamiesi teemojen tapaan.';

  @override
  String get themeStoreEmpty => 'Teemoja ei ole juuri nyt saatavilla.';

  @override
  String get themeStoreLoadFailed =>
      'Teemakauppaa ei voitu ladata. Tarkista yhteytesi ja yritä uudelleen.';

  @override
  String get themeStoreSave => 'Tallenna';

  @override
  String get themeStoreSaveAndApply => 'Tallenna ja ota käyttöön';

  @override
  String get themeStoreSaved => 'Tallennettu';

  @override
  String get themeStoreInvalidMessage => 'Tätä teemaa ei voitu ladata.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Teema \"$themeName\" tallennettu.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" poistettiin tältä laitteelta.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Ei voitu poistaa \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Tallennetut teemat';

  @override
  String get savedThemesDescription =>
      'Nämä ovat teemoja, jotka on ladattu nykyisen palvelimen Moonfin-laajennuksesta. Poistaminen poistaa vain tämän paikallisen kopion.';

  @override
  String get savedThemesEmpty =>
      'Tälle palvelimelle ei löytynyt tallennettuja teemoja.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Tällä hetkellä aktiivinen';
  }

  @override
  String get savedThemesDeleteTooltip => 'Poista tallennettu teema';

  @override
  String get savedThemesManageSubtitle =>
      'Hallinnoi ladattuja laajennusteemoja tällä laitteella';

  @override
  String get themeEditor => 'Teeman editori';

  @override
  String get themeEditorSubtitle => 'Avaa Moonfin teemaeditori selaimessasi';

  @override
  String get homeScreen => 'Kotinäyttö';

  @override
  String get bottomBar => 'Alapalkki';

  @override
  String get homeRowsStyleClassic => 'Klassinen';

  @override
  String get homeRowsStyleModern => 'Moderni';

  @override
  String get homeRowsSection => 'Kotirivit';

  @override
  String get homeRowDisplay => 'Aloitusnäytön rivien näyttö';

  @override
  String get homeRowSections => 'Aloitusnäytön riviosiot';

  @override
  String get homeRowToggles => 'Aloitusnäytön rivivalinnat';

  @override
  String get homeRowTogglesSubtitle =>
      'Ota käyttöön tai poista käytöstä kirjastopohjaiset aloitusnäytön riviluokat';

  @override
  String get homeRowTogglesDescription =>
      'Ota alla olevat valinnat käyttöön, niin rivit näkyvät aloitusnäytön osioissa.';

  @override
  String get rowsType => 'Rivien tyyppi';

  @override
  String get rowsTypeDescription =>
      'Classic säilyttää rivikohtaisen kuvatyypin ja tietopeittokuvan. Moderni käyttää muotokuvasta taustaan ​​-rivejä.';

  @override
  String get displayFavoritesRows => 'Näytä suosikkirivit';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Näytä suosikkielokuvat, -sarjat ja muut suosikkirivit Etusivu-osioissa.';

  @override
  String get favoritesRowSorting => 'Suosikkirivien lajittelu';

  @override
  String get favoritesRowSortingDescription =>
      'Lajittele Suosikit-rivit lisäyspäivän, julkaisupäivän, aakkosjärjestyksen ja muiden mukaan.';

  @override
  String get displayCollectionsRows => 'Näytä kokoelmarivit';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Näytä kokoelmarivit aloitusnäytön osioissa.';

  @override
  String get collectionsRowSorting => 'Kokoelmat rivien lajittelu';

  @override
  String get collectionsRowSortingDescription =>
      'Lajittele kokoelmien rivit lisäyspäivän, julkaisupäivän, aakkosjärjestyksen ja muiden mukaan.';

  @override
  String get displayGenresRows => 'Näytä lajityypit rivit';

  @override
  String get displayGenresRowsSubtitle => 'Näytä Genres-rivit Koti-osioissa.';

  @override
  String get genresRowSorting => 'Genret rivilajittelu';

  @override
  String get genresRowSortingDescription =>
      'Lajittele Genres-rivit lisäyspäivän, julkaisupäivän, aakkosjärjestyksen ja muiden mukaan.';

  @override
  String get genresRowItems => 'Genret rivikohdat';

  @override
  String get genresRowItemsDescription =>
      'Näytä elokuvat, sarjat tai molemmat lajityypit-riveillä.';

  @override
  String get displayPlaylistsRows => 'Näytä soittolistarivit';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Näytä soittolistarivit aloitusnäytön osioissa.';

  @override
  String get playlistsRowSorting => 'Soittolistarivien järjestys';

  @override
  String get playlistsRowSortingDescription =>
      'Järjestä soittolistarivit lisäyspäivän, julkaisupäivän, aakkosten ja muiden perusteiden mukaan.';

  @override
  String get displayAudioRows => 'Näytä äänirivit';

  @override
  String get displayAudioRowsSubtitle =>
      'Näytä äänirivit aloitusnäytön osioissa.';

  @override
  String get audioRowsSorting => 'Äänirivien järjestys';

  @override
  String get audioRowsSortingDescription =>
      'Järjestä äänirivit lisäyspäivän, julkaisupäivän, aakkosten ja muiden perusteiden mukaan.';

  @override
  String get audioPlaylists => 'Äänisoittolistat';

  @override
  String get appearance => 'Ulkoasu';

  @override
  String get layout => 'Asettelu';

  @override
  String get theme => 'Teema';

  @override
  String get keyboard => 'Näppäimistö';

  @override
  String get navButtons => 'Painikkeet';

  @override
  String get rendering => 'Renderöinti';

  @override
  String get mpvConfiguration => 'MPV-määritykset';

  @override
  String get cardSize => 'Kortin koko';

  @override
  String get externalPlayerApp => 'Ulkoinen soitinsovellus';

  @override
  String get externalPlayerAppDescription =>
      'Määritä ulkoinen soitin, niin pitkä painallus tarjoaa toistovaihtoehdon';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Näytä sovelluksen valitsin, kun toisto alkaa.';

  @override
  String get loadingInstalledPlayers => 'Ladataan asennettuja soittimia...';

  @override
  String get connection => 'Yhteys';

  @override
  String get audioTranscodeTarget => 'Audio Transcode kohde';

  @override
  String get passthrough => 'Läpivienti';

  @override
  String get supportedOnThisDevice => 'Tuettu tässä laitteessa';

  @override
  String get notSupportedOnThisDevice => 'Ei tueta tässä laitteessa';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) -läpivienti';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bittivirta DTS:X (DTS UHD) ulkoiseen dekooderiin.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD ja Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Mediasoittimen käyttäytyminen';

  @override
  String get playbackEnhancements => 'Toiston parannukset';

  @override
  String get alwaysOn => 'Aina päällä.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Korvaa Skip Outro Next Up -näytöllä';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Näytä Next Up -peittokuva Ohita Outro -painikkeen sijaan.';

  @override
  String get playerRouting => 'Pelaajien reititys';

  @override
  String get preferSoftwareDecoders => 'Suosi ohjelmistodekoodeja';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Käytä FFmpeg (audio) ja libgav1 (AV1) ennen laitteistodekoodeja. Poista käytöstä, jos HDMI-äänen läpivienti katkeaa.';

  @override
  String get useExternalPlayer => 'Käytä ulkoista soitinta';

  @override
  String get useExternalPlayerSubtitle =>
      'Avaa videon toisto valitsemallasi ulkoisella sovelluksella Android TV:ssä.';

  @override
  String get automaticQueuing => 'Automaattinen jonotus';

  @override
  String get preferSdhSubtitles => 'Suosi SDH-tekstitystä';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Priorisoi SDH/CC-tekstitysraidat, kun valitset automaattisen valinnan.';

  @override
  String get webDiagnostics => 'Verkkodiagnostiikka';

  @override
  String get webDiagnosticsTitle => 'Moonfin Verkkodiagnostiikka';

  @override
  String get webDiagnosticsIntro =>
      'Tämän sivun avulla voit diagnosoida selaimen yhteysongelmia (CORS, sekasisältö ja etsintäasetukset).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Havaittu sekasisällön virhe';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Havaittu CORS/Preflight Failure';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin havaitsi HTTPS-sivun, joka yritti kutsua HTTP-palvelimen URL-osoitetta. Selaimet estävät tämän pyynnön ennen kuin se saavuttaa palvelimesi.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin havaitsi selaintason pyyntövirheen, joka johtuu yleensä puuttuvista CORS- tai esitarkastusotsikoista mediapalvelimelta.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Kohde-URL-osoite: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Yksityiskohta: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Nykyinen ajonaikainen konteksti';

  @override
  String get webDiagnosticsOrigin => 'Alkuperä';

  @override
  String get webDiagnosticsScheme => 'Kaavio';

  @override
  String get webDiagnosticsPluginMode => 'Plugin-tila';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC-skannaus';

  @override
  String get webDiagnosticsForcedServerUrl => 'Pakotettu palvelimen URL-osoite';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Oletuspalvelimen URL-osoite';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'Discovery-välityspalvelimen URL-osoite';

  @override
  String get notConfigured => 'ei ole määritetty';

  @override
  String get webDiagnosticsMixedContent => 'Sekoitettu sisältö';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Tämä sivu ladataan HTTPS:n kautta, mutta yksi tai useampi määritetty URL-osoite on HTTP. Selaimet estävät HTTPS-sivuja kutsumasta HTTP API:ita.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Korjaus: palvele mediapalvelinta tai välityspalvelinta HTTPS:n kautta tai lataa Moonfin HTTP:n kautta vain luotetuissa paikallisverkoissa.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Nykyisistä ajonaikaisista asetuksista ei havaittu ilmeisiä sekasisällön määrityksiä.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS-tarkistuslista';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Salli selaimen alkuperä kohdassa Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Sisällytä valtuutus, X-Emby-Authorization ja X-Emby-Token kohtaan Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Näytä sisältöalue ja hyväksyntäalue suoratoistoa ja hakukäyttäytymistä varten.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Palauta numero 204 OPTIONS-esitarkastuspyyntöihin.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Esimerkki otsikkokatkelmasta (nginx-tyylinen)';

  @override
  String get note => 'Huom';

  @override
  String get webDiagnosticsNonWebNote =>
      'Tämä diagnostiikkareitti on tarkoitettu verkkorakennuksiin. Jos näet tämän toisella alustalla, nämä tarkistukset eivät välttämättä päde.';

  @override
  String get backToServerSelect => 'Takaisin palvelimeen Valitse';

  @override
  String get signOutAllUsers => 'Kirjaudu ulos kaikista käyttäjistä';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofonin käyttöoikeus evätään pysyvästi. Ota se käyttöön järjestelmäasetuksissa.';

  @override
  String get voiceSearchPermissionRequired =>
      'Äänihaku vaatii mikrofonin luvan.';

  @override
  String get voiceSearchNoMatch => 'Ei saanut kiinni siitä. Yritä uudelleen.';

  @override
  String get voiceSearchNoSpeechDetected => 'Puhetta ei havaittu.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofonivirhe.';

  @override
  String get voiceSearchNeedsInternet => 'Äänihaku vaatii Internetiä.';

  @override
  String get voiceSearchServiceBusy =>
      'Puhepalvelu on varattu. Yritä uudelleen.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofonin käyttöoikeus evätään pysyvästi.';

  @override
  String get microphonePermissionDenied => 'Mikrofonin käyttöoikeus on evätty.';

  @override
  String get speechRecognitionUnavailable =>
      'Puheentunnistus ei ole käytettävissä tällä laitteella.';

  @override
  String get openIosRoutePicker => 'Avaa iOS-reitinvalitsin';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay reitinvalitsin ei ole käytettävissä tässä laitteessa.';

  @override
  String get videos => 'Videot';

  @override
  String get programs => 'Ohjelmat';

  @override
  String get songs => 'Kappaleet';

  @override
  String get photoAlbums => 'Valokuva-albumit';

  @override
  String get photos => 'Valokuvat';

  @override
  String get people => 'Ihmiset';

  @override
  String get recentlyReleasedEpisodes => 'Äskettäin julkaistut jaksot';

  @override
  String get watchAgain => 'Katso uudelleen';

  @override
  String get guestAppearances => 'Vierasesityksiä';

  @override
  String get appearancesSeerr => 'Esiintymiset (Seerr)';

  @override
  String get crewContributionsSeerr => 'Työryhmän osuudet (Seerr)';

  @override
  String get watchWithGroup => 'Katso ryhmän kanssa';

  @override
  String get errors => 'Virheet';

  @override
  String get warnings => 'Varoitukset';

  @override
  String get disk => 'Levy';

  @override
  String get openInBrowser => 'Avaa selaimessa';

  @override
  String get embeddedBrowserNotAvailable =>
      'Sulautettu selain ei ole saatavilla tällä alustalla.';

  @override
  String get adminRestartServerConfirmation =>
      'Haluatko varmasti käynnistää palvelimen uudelleen?';

  @override
  String get adminShutdownServerConfirmation =>
      'Oletko varma, että haluat sulkea palvelimen? Sinun on käynnistettävä se manuaalisesti.';

  @override
  String get internal => 'Sisäinen';

  @override
  String get idle => 'Tyhjäkäynti';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Käyttäjiä ei löytynyt';

  @override
  String get adminNoUsersMatchSearch => 'Yksikään käyttäjä ei vastaa hakuasi';

  @override
  String get adminNoDevicesFound => 'Laitteita ei löytynyt';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Yksikään laite ei vastaa nykyisiä suodattimia';

  @override
  String get passwordSet => 'Salasana asetettu';

  @override
  String get noPasswordConfigured => 'Salasanaa ei ole määritetty';

  @override
  String get remoteAccess => 'Etäkäyttö';

  @override
  String get localOnly => 'Vain paikallinen';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Media-analyysin lataaminen epäonnistui';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Yhdistetty analytiikka kaikista mediakirjastoista.';

  @override
  String get analyticsTopArtists => 'Huippuartistit';

  @override
  String get analyticsTopAuthors => 'Parhaat kirjoittajat';

  @override
  String get analyticsTopContributors => 'Ahkerat kirjoittajat';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kirjastoa',
      one: '1 kirjasto',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Tälle valinnalle ei ole vielä saatavilla indeksoituja mediakokonaisuuksia.';

  @override
  String get analyticsLibraryDetails => 'Kirjaston tiedot';

  @override
  String get analyticsLibraryBreakdown => 'Kirjaston erittely';

  @override
  String get analyticsNoLibrariesAvailable => 'Kirjastoja ei ole saatavilla.';

  @override
  String get adminServerAdministrationTitle => 'Palvelimen hallinta';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Kuvavälimuisti';

  @override
  String get adminServerPathCache => 'Välimuisti';

  @override
  String get adminServerPathLogs => 'Lokit';

  @override
  String get adminServerPathMetadata => 'Metatiedot';

  @override
  String get adminServerPathTranscode => 'Transkoodaus';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Tämä palvelin ei palauttanut palvelinpolkuja.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% käytetty';
  }

  @override
  String get userActivity => 'Käyttäjän toiminta';

  @override
  String get systemEvents => 'Järjestelmätapahtumat';

  @override
  String get needsAttention => 'Vaatii huomiota';

  @override
  String get adminDrawerSectionServer => 'Palvelin';

  @override
  String get adminDrawerSectionPlayback => 'Toisto';

  @override
  String get adminDrawerSectionDevices => 'Laitteet';

  @override
  String get adminDrawerSectionAdvanced => 'Edistynyt';

  @override
  String get adminDrawerSectionPlugins => 'Laajennukset';

  @override
  String get adminDrawerSectionLiveTv => 'Live-TV';

  @override
  String get homeVideos => 'Kotivideot';

  @override
  String get mixedContent => 'Sekoitettu sisältö';

  @override
  String get homeVideosAndPhotos => 'Kotivideot ja valokuvat';

  @override
  String get mixedMoviesAndShows => 'Sekalaiset elokuvat ja ohjelmat';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Tallenteita ei löytynyt';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Kuvasivuja ei löytynyt .$extension -arkistosta.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Upotettu renderöijä epäonnistui ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB-renderöijä epäonnistui ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Lukijalle puuttuu paikallinen tiedosto: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status avattaessa kirjatietoja osoitteesta $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Ei luettavissa olevan kirjan päätepistettä saatavilla';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Ei tuettu sarjakuva-arkistomuoto: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR-poistolaajennus ei ole saatavilla tällä alustalla.';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr-arkiston purkaminen epäonnistui.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7-poisto ei ole käytettävissä tällä alustalla.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7-poistolaajennus ei ole saatavilla tällä alustalla.';

  @override
  String get closeGenrePanel => 'Sulje genre-paneeli';

  @override
  String get loadingShuffle => 'Ladataan satunnaistoistoa...';

  @override
  String get libraryShuffleLabel => 'KIRJASTON SEKOITUS';

  @override
  String get randomShuffleLabel => 'SATUNNAINEN SEKOITUS';

  @override
  String get genresShuffleLabel => 'GENREJEN SEKOITUS';

  @override
  String get autoHdrSwitching => 'Automaattinen HDR-vaihto';

  @override
  String get autoHdrSwitchingDescription =>
      'Ota HDR automaattisesti käyttöön HDR-videon toistoa varten ja palauta näyttötila poistuessasi.';

  @override
  String get whenFullscreen => 'Kun koko näyttö';

  @override
  String get changeArtwork => 'Vaihda kuvitus';

  @override
  String get missing => 'Puuttuu';

  @override
  String get transcodingLimits => 'Transkoodausrajat';

  @override
  String get clearAllArtworkButton => 'Tyhjennetäänkö kaikki kuvitus?';

  @override
  String get clearAllArtworkWarning =>
      'Haluatko varmasti tyhjentää kaiken ladatun kuvituksen?';

  @override
  String get confirmClear => 'Vahvista tyhjennys';

  @override
  String confirmClearMessage(String itemType) {
    return 'Haluatko varmasti tyhjentää tämän: $itemType?';
  }

  @override
  String get uploadButton => 'Ladataanko?';

  @override
  String get resolutionLabel => 'Tarkkuus: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Näytä vain käyttöliittymän kielinen kuvitus';

  @override
  String get confirmClearAll => 'Vahvista kaikkien tyhjennys';

  @override
  String get imageUploadSuccess => 'Kuvan lataus onnistui!';

  @override
  String imageUploadFailed(String error) {
    return 'Kuvan lataus epäonnistui: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Kuvan asettaminen epäonnistui: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Kuvan poistaminen epäonnistui: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Kaiken kuvituksen tyhjentäminen epäonnistui: $error';
  }

  @override
  String get yes => 'Kyllä';

  @override
  String get posterCategory => 'Juliste';

  @override
  String get backdropsCategory => 'Taustakuvat';

  @override
  String get bannerCategory => 'Banneri';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Pienoiskuva';

  @override
  String get artCategory => 'Kuvitus';

  @override
  String get discArtCategory => 'Levykuvitus';

  @override
  String get screenshotCategory => 'Kuvakaappaus';

  @override
  String get boxCoverCategory => 'Kotelon kansi';

  @override
  String get boxRearCoverCategory => 'Kotelon takakansi';

  @override
  String get menuArtCategory => 'Valikkokuvitus';

  @override
  String get confirmItemPoster => 'juliste';

  @override
  String get confirmItemBackdrop => 'taustakuva';

  @override
  String get confirmItemBanner => 'banneri';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'pienoiskuva';

  @override
  String get confirmItemArt => 'kuvitus';

  @override
  String get confirmItemDiscArt => 'levykuvitus';

  @override
  String get confirmItemScreenshot => 'kuvakaappaus';

  @override
  String get confirmItemBoxCover => 'kotelon kansi';

  @override
  String get confirmItemBoxRearCover => 'kotelon takakansi';

  @override
  String get confirmItemMenuArt => 'valikkokuvitus';

  @override
  String get resolutionAll => 'Kaikki';

  @override
  String get resolutionHigh => 'Korkea (1080p+)';

  @override
  String get resolutionMedium => 'Keskitaso (720p)';

  @override
  String get resolutionLow => 'Matala (<720p)';

  @override
  String get sources => 'Lähteet';

  @override
  String get audiobookChapters => 'Luvut';

  @override
  String get audiobookBookmarks => 'Kirjanmerkit';

  @override
  String get audiobookNotes => 'Muistiinpanot';

  @override
  String get audiobookQueue => 'Jono';

  @override
  String get audiobookTimeline => 'Aikajana';

  @override
  String get audiobookTimelineEmpty => 'Aikajana on tyhjä';

  @override
  String get audiobookWholeBook => 'Koko kirja';

  @override
  String get audiobookFocusedTimeline => 'Rajattu aikajana';

  @override
  String get audiobookExportBookmarks => 'Vie kirjanmerkit';

  @override
  String get audiobookExportNotes => 'Vie muistiinpanot';

  @override
  String get audiobookExportAll => 'Vie kaikki';

  @override
  String audiobookExportSuccess(String path) {
    return 'Viety sijaintiin $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Vienti epäonnistui: $error';
  }

  @override
  String get audiobookLyrics => 'Sanoitukset';

  @override
  String get audiobookAddBookmark => 'Lisää kirjanmerkki';

  @override
  String get audiobookAddNote => 'Lisää muistiinpano';

  @override
  String get audiobookEditNote => 'Muokkaa muistiinpanoa';

  @override
  String get audiobookNoteHint => 'Kirjoita muistiinpano tähän kohtaan';

  @override
  String get audiobookSleepTimer => 'Uniajastin';

  @override
  String get audiobookSleepOff => 'Pois';

  @override
  String get audiobookSleepEndOfChapter => 'Luvun loppu';

  @override
  String get audiobookSleepCustom => 'Mukautettu';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining jäljellä';
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
  String get audiobookPlaybackSpeed => 'Toistonopeus';

  @override
  String get audiobookRemainingTime => 'Jäljellä';

  @override
  String get audiobookElapsedTime => 'Kulunut';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Taakse $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Eteen $seconds s';
  }

  @override
  String get audiobookPreviousChapter => 'Edellinen luku';

  @override
  String get audiobookNextChapter => 'Seuraava luku';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Luku $current/$total';
  }

  @override
  String get audiobookNoChapters => 'Ei lukuja';

  @override
  String get audiobookNoBookmarks => 'Ei vielä kirjanmerkkejä';

  @override
  String get audiobookNoNotes => 'Ei vielä muistiinpanoja';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Kirjanmerkki lisätty kohtaan $position';
  }

  @override
  String get audiobookSpeedReset => 'Palauta nopeuteen 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Tallenna';

  @override
  String get audiobookCancel => 'Peruuta';

  @override
  String get audiobookDelete => 'Poista';

  @override
  String get subtitlePreferences => 'Tekstitysasetukset';

  @override
  String get subtitlePreferencesDescription =>
      'Muuta tekstitystiloja, oletuskieliä, ulkoasua ja renderöintiasetuksia.';

  @override
  String get subtitleRendering => 'Tekstitysten renderöinti';

  @override
  String get displayOptions => 'Näyttöasetukset';

  @override
  String get releaseDateAscending => 'Julkaisupäivä (nouseva)';

  @override
  String get releaseDateDescending => 'Julkaisupäivä (laskeva)';

  @override
  String get groupContributions => 'Ryhmittele osuudet';

  @override
  String get groupMultipleRoles => 'Ryhmittele useat roolit';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Varoitus kirjaston kirjoitusoikeuksista';

  @override
  String get libraryWriteAccessHowToFix => 'Näin korjaat tämän:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Myönnä Jellyfin-palvelun käyttäjälle (esim. jellyfin tai Dockerin PUID/PGID) kirjoitusoikeudet palvelimella oleviin mediakirjastokansioihisi.\n\n2. Tai siirry Jellyfinin hallintapaneeliin -> Kirjastot, muokkaa tätä kirjastoa ja poista käytöstä \'Tallenna kuvitus mediakansioihin\', jolloin kuvitus tallennetaan Jellyfinin sisäiseen tietokantaan.';

  @override
  String get dismiss => 'Sulje';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Kirjastosi \'$libraryName\' on määritetty tallentamaan kuvitus suoraan mediakansioihin (\'Tallenna kuvitus mediakansioihin\' on käytössä). Jellyfin on kuitenkin testannut kirjoitusoikeudet, eikä sillä ole oikeutta kirjoittaa tiedostoja tähän hakemistoon:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin ei ilmeisesti onnistunut päivittämään kuvitusta. Kirjastosi on määritetty tallentamaan kuvitus suoraan mediakansioihin (\'Tallenna kuvitus mediakansioihin\' on käytössä). Tämä virhe johtuu yleensä siitä, ettei Jellyfin-palvelinprosessilla ole oikeutta kirjoittaa tiedostoja mediahakemistoihisi.';

  @override
  String get externalLists => 'Ulkoiset listat';

  @override
  String get replay => 'Toista uudelleen';

  @override
  String get fileInformation => 'Tiedoston tiedot';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Koko: $size  •  Muoto: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Näytä kaikki ($count) ääniraitaa';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Näytä kaikki ($count) tekstitysraitaa';
  }

  @override
  String get checkingDirectPlay => 'Tarkistetaan suoran toiston tukea...';

  @override
  String get directPlayCapabilityLabel => 'Suoran toiston tuki: ';

  @override
  String get forced => 'Pakotettu';

  @override
  String get transcodeContainerNotSupported => 'Soitin ei tue säiliömuotoa.';

  @override
  String get transcodeVideoCodecNotSupported => 'Videokoodekkia ei tueta.';

  @override
  String get transcodeAudioCodecNotSupported => 'Äänikoodekkia ei tueta.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Tekstitysmuotoa ei tueta (vaatii polttamisen kuvaan).';

  @override
  String get transcodeAudioProfileNotSupported => 'Ääniprofiilia ei tueta.';

  @override
  String get transcodeVideoProfileNotSupported => 'Videoprofiilia ei tueta.';

  @override
  String get transcodeVideoLevelNotSupported => 'Videotasoa ei tueta.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Tämä laite ei tue videon tarkkuutta.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Videon bittisyvyyttä ei tueta.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Videon kuvataajuutta ei tueta.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Tiedoston bittinopeus ylittää soittimen suoratoistorajan.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Videon bittinopeus ylittää suoratoistorajan.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Äänen bittinopeus ylittää suoratoistorajan.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Äänikanavien määrää ei tueta.';

  @override
  String get sortAlphabetical => 'Aakkosjärjestys';

  @override
  String get sortReleaseAscending => 'Julkaisujärjestys (nouseva)';

  @override
  String get sortReleaseDescending => 'Julkaisujärjestys (laskeva)';

  @override
  String get sortCustomDragDrop => 'Mukautettu (vedä ja pudota)';

  @override
  String get playlistSortOptions => 'Soittolistan järjestysasetukset';

  @override
  String get resetSort => 'Palauta järjestys';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Katso uudelleen K$season:J$episode';
  }

  @override
  String get rewatchPlaylist => 'Katso soittolista uudelleen';

  @override
  String get noSubtitlesFound => 'Tekstityksiä ei löytynyt.';

  @override
  String get adminControls => 'Ylläpidon hallinta';

  @override
  String get impellerRendering => 'Renderöintimoottori (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller on Flutterin moderni GPU-renderöijä, joka tuo sulavammat animaatiot ja vähemmän nykimistä. Joissakin TV-bokseissa ja vanhemmissa GPU:issa se voi aiheuttaa häiriöitä tai mustan kuvan; valitse silloin Ei käytössä. Automaattinen valitsee laitteellesi parhaan oletuksen. Ota muutos käyttöön käynnistämällä Moonfin uudelleen.';

  @override
  String get impellerAuto => 'Automaattinen';

  @override
  String get impellerOn => 'Käytössä';

  @override
  String get impellerOff => 'Ei käytössä';

  @override
  String get impellerRestartTitle => 'Uudelleenkäynnistys vaaditaan';

  @override
  String get impellerRestartMessage =>
      'Moonfin on käynnistettävä uudelleen renderöintimoottorin vaihtamiseksi. Sulje sovellus nyt ja avaa se uudelleen, niin muutos tulee voimaan.';

  @override
  String get impellerCloseNow => 'Sulje sovellus nyt';

  @override
  String get adminRefreshLibrary => 'Päivitä kirjasto';

  @override
  String get adminRefreshAllLibraries => 'Päivitä kaikki kirjastot';

  @override
  String get adminRepoSortDateOldest => 'Lisäyspäivä (vanhimmat ensin)';

  @override
  String get adminRepoSortDateNewest => 'Lisäyspäivä (uusimmat ensin)';

  @override
  String get adminRepoSortNameAsc => 'Aakkosjärjestys (A–Ö)';

  @override
  String get adminRepoSortNameDesc => 'Aakkosjärjestys (Ö–A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Ladataan palvelimen analytiikkaa... $percentage %';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Sama kuin lähteessä';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 -elokuvat';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 -sarjat';

  @override
  String get imdbMostPopularMovies => 'IMDb:n suosituimmat elokuvat';

  @override
  String get imdbMostPopularTvShows => 'IMDb:n suosituimmat sarjat';

  @override
  String get imdbLowestRatedMovies => 'IMDb:n huonoimmin arvostellut elokuvat';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb:n parhaat englanninkieliset elokuvat';
}
