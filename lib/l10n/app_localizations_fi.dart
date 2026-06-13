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
  String get accountPreferences => 'ACCOUNT PREFERENCES';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'Kirjaudu sisään';

  @override
  String get empty => 'Empty';

  @override
  String connectingToServer(String serverName) {
    return 'Yhdistetään kohteeseen $serverName';
  }

  @override
  String get quickConnect => 'Pikayhteys';

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
  String get remove => 'Poistaa';

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
  String get settingsAppearanceThemeSubtitle =>
      'Vaihda Moonfin ja Neon Pulse välillä käynnistämättä sovellusta uudelleen';

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
  String get series => 'Sarja';

  @override
  String get noItemsFound => 'Kohteita ei löytynyt';

  @override
  String get home => 'Kotiin';

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
  String get artists => 'Taiteilijat';

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
  String get resume => 'Jatkaa';

  @override
  String get failedToLoadLibrary => 'Kirjaston lataaminen epäonnistui';

  @override
  String get popularNow => 'Suosittu nyt';

  @override
  String get savedForLater => 'Tallennettu myöhempää käyttöä varten';

  @override
  String get topListens => 'Top Listens';

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
  String get titles => 'Otsikot';

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
  String get watched => 'Katsottu';

  @override
  String get unread => 'Lukematon';

  @override
  String get unwatched => 'Katsomaton';

  @override
  String get seriesStatus => 'Sarjan tila';

  @override
  String get allLibraries => 'Kaikki kirjastot';

  @override
  String get books => 'Kirjat';

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
      other: '$count audiobooks',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Kappaleluettelo';

  @override
  String get itemListPlaceholder => 'Tuoteluettelo tulee näkyviin tähän';

  @override
  String get favoriteTracksPlaceholder => 'Suosikkikappaleet näkyvät täällä';

  @override
  String get failedToLoad => 'Lataus epäonnistui';

  @override
  String get delete => 'Poistaa';

  @override
  String get save => 'Tallentaa';

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
  String get seasons => 'Vuodenajat';

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
      other: '$count Seasons',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Päättyy $time';
  }

  @override
  String endsIn(String time) {
    return 'Ends in $time';
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
  String get play => 'Pelata';

  @override
  String get startOver => 'Aloita alusta';

  @override
  String get restart => 'Käynnistä uudelleen';

  @override
  String get readOffline => 'Lue offline-tilassa';

  @override
  String get playOffline => 'Pelaa offline-tilassa';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Tekstitykset';

  @override
  String get version => 'Versio';

  @override
  String get cast => 'Heittää';

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
  String get writers => 'KIRJOITTAJAT';

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
  String downloadsCount(int count) {
    return '$count lataukset';
  }

  @override
  String get perfectMatch => 'Täydellinen ottelu';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereot';

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
  String get pause => 'Tauko';

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
  String get auto => 'Auto';

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
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
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
  String get player => 'Pelaaja';

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
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Videon bittinopeus';

  @override
  String get track => 'Seurata';

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
  String get record => 'Tallentaa';

  @override
  String get cancelRecordingAction => 'Peruuta tallennus';

  @override
  String get programSetToRecord => 'Ohjelma asetettu tallentamaan';

  @override
  String get recordingCancelled => 'Tallennus peruutettu';

  @override
  String get unableToCreateRecording => 'Tallennusta ei voi luoda';

  @override
  String get watch => 'Katsella';

  @override
  String get close => 'Lähellä';

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
  String get seerr => 'Näkijä';

  @override
  String get seerrAccountType => 'Näkijätilin tyyppi';

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
    return 'S$season E$episode';
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
    return 'S$number';
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
      other: '$count episodes',
      one: '1 episode',
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Teemamusiikki kotiriveillä';

  @override
  String get playWhenBrowsingHomeScreen => 'Toista aloitusnäyttöä selatessasi';

  @override
  String get detailsBackgroundBlur => 'Tiedot taustan sumennus';

  @override
  String pixelValue(int value) {
    return '${value}px';
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
  String get settingsScrollWheelAction => 'Mouse scroll wheel';

  @override
  String get settingsScrollWheelActionDescription =>
      'Choose what scrolling the mouse wheel over the video does during playback.';

  @override
  String get scrollWheelActionOff => 'Off';

  @override
  String get scrollWheelActionSeek => 'Seek (forward / back)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

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
  String get trickPlay => 'Trick Play';

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
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

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
      'Choose how audio is decoded. AVR Passthrough sends raw Dolby/DTS streams to your receiver; Auto or Downmix decodes locally.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audion varakoodekki';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Select the target format to transcode multi-channel audio when the source stream cannot be direct-played or passed through.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Auto Detect\n(Recommended)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Default)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Lossless)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Stereo Only)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efficient)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Lossless)';

  @override
  String get settingsMaxAudioChannels => 'Max Audio Channels';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configure the maximum channels of your audio setup. Multichannel streams exceeding this limit will downmix or transcode.';

  @override
  String get settingsMaxAudioChannelsAuto => 'Auto Detect\n(Hardware Default)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadraphonic';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Läpivienti (edistynyt)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Ota käyttöön vain muodot, joita AVR- tai HDMI-allas tukee.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 Passthrough';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) Läpivienti';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA -läpivienti';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos Passthrough';

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
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
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
      'Route HD Audio Support';

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
    return '${value}s';
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
  String get subtitlePreviewText =>
      'Nopea ruskea kettu hyppää laiskan koiran yli';

  @override
  String get verticalOffset => 'Pystysuuntainen siirtymä';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles => 'Suoratoisto PGS-tekstitykset';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

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
  String get showSeerrButton => 'Show Seerr Button';

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
  String get autoAdvanceInterval => 'Auto Advance Interval';

  @override
  String get trailerPreview => 'Trailerin esikatselu';

  @override
  String get autoPlayTrailers =>
      'Toista trailerit automaattisesti mediapalkissa 3 sekunnin kuluttua';

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
  String get fullScreenRows => 'Expanded Home Rows';

  @override
  String get fullScreenRowsDescription => 'Limit home rows to 1 row per screen';

  @override
  String get perRowImageType => 'Rivikuvatyypin mukaan';

  @override
  String get perRowSettings => 'Rivikohtaiset asetukset';

  @override
  String get autoLogin => 'Automaattinen sisäänkirjautuminen';

  @override
  String get lastUser => 'Viimeinen käyttäjä';

  @override
  String get currentUser => 'Current User';

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
  String get mode => 'tila';

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
  String get clockModeStatic => 'Static';

  @override
  String get clockModeBouncing => 'Bouncing';

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
  String get pluginLabel => 'Plugin';

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
  String get seerrDiscoveryRows => 'Seerr Discovery Rows';

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
  String loggedInAs(String username) {
    return 'Kirjautunut sisään nimellä: $username';
  }

  @override
  String get discoverRows => 'Tutustu riviin';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Järjestä uudelleen vetämällä. Ota rivit käyttöön tai poista ne käytöstä. Käytössä oleva rivijärjestys synkronoituu Moonfin-laajennuksen kanssa.';

  @override
  String get discoverRowsDescription =>
      'Järjestä uudelleen vetämällä. Ota rivit käyttöön tai poista ne käytöstä.';

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
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
  String get clear => 'Selkeä';

  @override
  String get browse => 'Selaa';

  @override
  String get noResults => 'Ei tuloksia';

  @override
  String get seerrAvailableStatus => 'Saatavilla';

  @override
  String get seerrRequestedStatus => 'Pyydetty';

  @override
  String itemsCount(int count) {
    return '$count Kohteet';
  }

  @override
  String get seerrSettings => 'Näkijän asetukset';

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
  String get appearances => 'Ulkonäkö';

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
  String get seasonsLabel => 'Vuodenajat';

  @override
  String get episodesLabel => 'Jaksot';

  @override
  String get access => 'Pääsy';

  @override
  String get add => 'Lisätä';

  @override
  String get address => 'Osoite';

  @override
  String get analytics => 'Analytics';

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
  String get done => 'Tehty';

  @override
  String get edit => 'Muokata';

  @override
  String get encoding => 'Koodaus';

  @override
  String get error => 'Virhe';

  @override
  String get forward => 'Eteenpäin';

  @override
  String get general => 'Kenraali';

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
  String get next => 'Seuraavaksi';

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
  String get remote => 'Kauko';

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
  String get status => 'Status';

  @override
  String get stop => 'Stop';

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
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'Asetukset';

  @override
  String get adminDrawerBranding => 'Brändäys';

  @override
  String get adminDrawerUsers => 'Käyttäjät';

  @override
  String get adminDrawerLibraries => 'Kirjastot';

  @override
  String get adminDrawerTranscoding => 'Transkoodaus';

  @override
  String get adminDrawerResume => 'Jatkaa';

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
  String get adminDrawerPlugins => 'Plugins';

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
  String get sessionNext => 'Seuraavaksi';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Nyt pelaa';

  @override
  String get volume => 'Äänenvoimakkuus';

  @override
  String get actions => 'Toiminnot';

  @override
  String get videoCodec => 'Video Codec';

  @override
  String get audioCodec => 'Äänikoodekki';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Valmistuminen';

  @override
  String get direct => 'Suoraan';

  @override
  String get adminDisconnect => 'Katkaise yhteys';

  @override
  String get adminClearDates => 'Selkeät päivämäärät';

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
  String get admin => 'Admin';

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
  String get adminSearchRemotePerson => 'Etsi etähenkilö';

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
  String get adminTunerType => 'Virittimen tyyppi';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, muu';

  @override
  String get adminUrlPath => 'URL / polku';

  @override
  String get adminNameOptional => 'Nimi (valinnainen)';

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
  String get adminProviderTypeHint => 'SchedulesDirect tai XMLTV';

  @override
  String get adminUsernameOptional => 'Käyttäjätunnus (valinnainen)';

  @override
  String get adminRefreshInterval => 'Päivitysväli (tunteja)';

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
  String get adminMetadataRemote => 'Kauko';

  @override
  String get adminMetadataType => 'Tyyppi';

  @override
  String get adminMetadataDetails => 'Yksityiskohdat';

  @override
  String get adminMetadataExternalIds => 'Ulkoiset tunnukset';

  @override
  String get adminMetadataImages => 'Kuvat';

  @override
  String get adminMetadataFieldTitle => 'Otsikko';

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
  String get adminReposRemove => 'Poistaa';

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
  String get adminPlaybackHwAccel => 'Laitteistokiihdytys';

  @override
  String get adminPlaybackHwAccelLabel => 'Laitteistokiihdytys';

  @override
  String get adminPlaybackEnableHwEncoding => 'Ota käyttöön laitteistokoodaus';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Ota laitteiston dekoodaus käyttöön:';

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
  String get adminTaskStop => 'Stop';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminGeneralCachePath => 'Välimuistin polku';

  @override
  String get adminGeneralMetadataPath => 'Metatietojen polku';

  @override
  String get adminGeneralServerName => 'Palvelimen nimi';

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
      other: '# participants',
      one: '# participant',
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
  String get homeScreenSectionsIntegrationDescription =>
      'Tunnista IAmParadox27:n \"Home Screen Sections\" -laajennuksen paljastamat rivit. Rivit voidaan ottaa käyttöön ja järjestää uudelleen alla.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Yksikään Jellyfin-palvelin ei ole vielä ilmoittanut laajennuksesta.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Tunnista ranaldsgiftin KefinTweaks-laajennuksen kautta määritetyt rivit. Äskettäin julkaistut mukautetut osiot, katso uudelleen, kausiluonteiset ja äskettäin kirjastoon lisätyt osiot peilataan jokaisen Jellyfin-palvelimen KefinTweaks-kokoonpanosta.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Yksikään Jellyfin-palvelin ei raportoi vielä KefinTweaksista.';

  @override
  String get integrationOpenHomeSections => 'Avaa Koti-osiot';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Ota rivejä käyttöön, poista se käytöstä ja järjestä uudelleen';

  @override
  String get integrationInstalledButDisabled =>
      'Asennettu mutta poistettu käytöstä';

  @override
  String get integrationNotInstalled => 'Ei asennettu';

  @override
  String integrationSectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# sections',
      one: '# section',
    );
    return '$_temp0';
  }

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
  String get jellyseerr => 'Jellyseerr';

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
  String get audioLabel => 'Audio';

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
  String get pinClear => 'Selkeä';

  @override
  String get pinBackspace => 'Askelpalautin';

  @override
  String get quickConnectAuthorized => 'Pikayhteyspyyntö hyväksytty.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Pikayhteyskoodi on virheellinen tai vanhentunut.';

  @override
  String get quickConnectNotSupported =>
      'Pikayhteyttä ei tueta tällä palvelimella.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Pikayhteyskoodin valtuuttaminen epäonnistui.';

  @override
  String get quickConnectDisabled =>
      'Pikayhteys on poistettu käytöstä tällä palvelimella.';

  @override
  String get quickConnectForbidden =>
      'Tilisi ei voi valtuuttaa tätä pikayhteyspyyntöä.';

  @override
  String get quickConnectNotFound =>
      'Pikayhteyskoodia ei löytynyt. Kokeile uutta koodia.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Pikayhteys epäonnistui: $message';
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
  String get shuffleBy => 'Shuffle By';

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
  String get stillWatchingStop => 'Stop';

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
      'Show the Seerr button in the navigation bar';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

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
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

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
  String get enableTunnelingTitle => 'Enable tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Advanced. Routes audio and video through a coupled hardware path. Off by default because it causes audio/video dropouts on some devices.';

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
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Aloitusnäytön osiot';

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
  String get homeRowDisplay => 'Home Row Display';

  @override
  String get homeRowSections => 'Home Row Sections';

  @override
  String get homeRowToggles => 'Home Row Toggles';

  @override
  String get homeRowTogglesSubtitle =>
      'Enable or disable different home row categories';

  @override
  String get homeRowTogglesDescription =>
      'Enable the following toggles to display the rows in Home Sections.';

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
      'Show Collections rows in Home Sections.';

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
  String get displayPlaylistsRows => 'Display Playlist Rows';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Show Playlist rows in Home Sections.';

  @override
  String get playlistsRowSorting => 'Playlist Row Sorting';

  @override
  String get playlistsRowSortingDescription =>
      'Sort Playlist rows by date added, release date, alphabetically, and more.';

  @override
  String get displaySeerrRows => 'Display Seerr Discovery Rows';

  @override
  String get displaySeerrRowsSubtitle =>
      'Show Seerr discovery rows in Home Sections.';

  @override
  String get appearance => 'Ulkonäkö';

  @override
  String get cardSize => 'Kortin koko';

  @override
  String get externalPlayerApp => 'Ulkoinen soitinsovellus';

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
  String get trailers => 'Perävaunut';

  @override
  String get programs => 'Ohjelmat';

  @override
  String get songs => 'Songs';

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
  String get appearancesSeerr => 'Ulkonäkö (näkijä)';

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
      other: '$count Libraries',
      one: '1 Library',
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
  String get adminDrawerSectionPlugins => 'Plugins';

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
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Automaattinen HDR-vaihto';

  @override
  String get autoHdrSwitchingDescription =>
      'Ota HDR automaattisesti käyttöön HDR-videon toistoa varten ja palauta näyttötila poistuessasi.';

  @override
  String get whenFullscreen => 'Kun koko näyttö';

  @override
  String get transcodingLimits => 'Transkoodausrajat';
}
