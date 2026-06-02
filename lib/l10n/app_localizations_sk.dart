// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get signIn => 'Prihlásiť sa';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Rýchle pripojenie';

  @override
  String get password => 'heslo';

  @override
  String get username => 'Používateľské meno';

  @override
  String get email => 'Email';

  @override
  String get quickConnectInstruction =>
      'Zadajte tento kód na webovom paneli servera:';

  @override
  String get waitingForAuthorization => 'Čaká sa na autorizáciu...';

  @override
  String get back => 'Späť';

  @override
  String get serverUnavailable => 'Server je nedostupný';

  @override
  String get loginFailed => 'Prihlásenie zlyhalo';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'kto sa pozerá?';

  @override
  String get addUser => 'Pridať používateľa';

  @override
  String get selectServer => 'Vyberte Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Uložené servery';

  @override
  String get discoveredServers => 'Objavené servery';

  @override
  String get noneFound => 'Nenašli sa žiadne';

  @override
  String get unableToConnectToServer => 'Nedá sa pripojiť k serveru';

  @override
  String get addServer => 'Pridať server';

  @override
  String get embyConnect => 'Emby Pripojte sa';

  @override
  String get removeServer => 'Odstrániť server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Zrušiť';

  @override
  String get remove => 'Odstrániť';

  @override
  String get connectToServer => 'Pripojte sa k serveru';

  @override
  String get serverAddress => 'Adresa servera';

  @override
  String get serverAddressHint => 'https://vas-server.example.com';

  @override
  String get connect => 'Pripojte sa';

  @override
  String get secureStorageUnavailable =>
      'Zabezpečené úložisko nie je k dispozícii';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nemá prístup k vášmu systémovému zväzku kľúčov. Prihlasovanie môže pokračovať, ale bezpečné úložisko tokenov môže byť nedostupné, kým sa kľúčenka neodomkne.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Téma aplikácie';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Prepínajte medzi Moonfin a Neon Pulse bez reštartovania aplikácie';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Aktuálny vzhľad Moonfin, ktorý ste si všetci obľúbili';

  @override
  String get themeNeonPulse => 'Neónový pulz';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave štýl s purpurovou žiarou, azúrovým textom a silnejším chrómovým kontrastom';

  @override
  String get embyConnectSignInSubtitle =>
      'Prihláste sa pomocou svojho účtu Emby Connect';

  @override
  String get emailOrUsername => 'Email alebo Používateľské meno';

  @override
  String get selectAServer => 'Vyberte server';

  @override
  String get tryAgain => 'Skúste znova';

  @override
  String get noLinkedServers =>
      'S týmto účtom Emby Connect nie sú prepojené žiadne servery';

  @override
  String get invalidEmbyConnectCredentials => 'Neplatné poverenia Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Neplatné používateľské meno alebo heslo Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Server nepodporuje výmenu Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Chyba siete pri kontaktovaní Emby Connect alebo vybraného servera';

  @override
  String get loadingLinkedServers => 'Načítavam prepojené servery...';

  @override
  String get connectingToServerEllipsis => 'Pripája sa k serveru...';

  @override
  String get noReachableAddress => 'Nebola poskytnutá žiadna dostupná adresa';

  @override
  String get invalidServerExchangeResponse =>
      'Neplatná odpoveď z koncového bodu servera Exchange';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Odísť z Moonfin?';

  @override
  String get exitAppConfirmation => 'Naozaj chcete skončiť?';

  @override
  String get exit => 'VÝCHOD';

  @override
  String get noHomeRowsLoaded => 'Nepodarilo sa načítať žiadne domáce riadky';

  @override
  String get noHomeRowsHint =>
      'Skúste obnoviť alebo zredukovať aktívne domáce sekcie.';

  @override
  String get retryHomeRows => 'Opakovať domáce riadky';

  @override
  String get guide => 'Sprievodca';

  @override
  String get recordings => 'Nahrávky';

  @override
  String get schedule => 'Rozvrh';

  @override
  String get series => 'séria';

  @override
  String get noItemsFound => 'Nenašli sa žiadne položky';

  @override
  String get home => 'Domov';

  @override
  String get browseAll => 'Prehľadávať všetko';

  @override
  String get genres => 'Žánre';

  @override
  String get collectionPlaceholder => 'Tu sa zobrazia zbierkové predmety';

  @override
  String get browseByLetter => 'Prehľadávať podľa písmen';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Tu sa zobrazí abecedné prehľadávanie';

  @override
  String get suggestions => 'Návrhy';

  @override
  String get suggestionsPlaceholder => 'Tu sa zobrazia navrhované položky';

  @override
  String get failedToLoadLibraries => 'Nepodarilo sa načítať knižnice';

  @override
  String get noLibrariesFound => 'Nenašli sa žiadne knižnice';

  @override
  String get library => 'Knižnica';

  @override
  String get displaySettings => 'Nastavenia displeja';

  @override
  String get allGenres => 'Všetky žánre';

  @override
  String get noGenresFound => 'Nenašli sa žiadne žánre';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Tento priečinok je prázdny';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Obľúbené sa nepodarilo načítať';

  @override
  String get retry => 'Skúste to znova';

  @override
  String get noFavoritesYet => 'Zatiaľ žiadne obľúbené';

  @override
  String get favorites => 'Obľúbené';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Pokračovanie';

  @override
  String get ended => 'Ukončené';

  @override
  String get sortAndFilter => 'Triediť a filtrovať';

  @override
  String get type => 'Typ';

  @override
  String get sortBy => 'Zoradiť podľa';

  @override
  String get display => 'Displej';

  @override
  String get imageType => 'Typ obrázka';

  @override
  String get posterSize => 'Veľkosť plagátu';

  @override
  String get small => 'Malý';

  @override
  String get medium => 'Stredná';

  @override
  String get large => 'Veľký';

  @override
  String get extraLarge => 'Extra veľké';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Zobrazenia';

  @override
  String get albums => 'Albumy';

  @override
  String get albumArtists => 'Umelci albumov';

  @override
  String get artists => 'Umelci';

  @override
  String get bookmarks => 'Záložky';

  @override
  String get noSavedBookmarks =>
      'Pre tento titul zatiaľ nie sú uložené žiadne záložky.';

  @override
  String get openBook => 'Otvorená kniha';

  @override
  String get chapter => 'kapitola';

  @override
  String get page => 'Stránka';

  @override
  String get bookmark => 'Záložka';

  @override
  String get justNow => 'Práve teraz';

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
  String get discoverySubjects => 'Predmety objavovania';

  @override
  String get pickDiscoverySubjects =>
      'Vyberte, ktoré informačné kanály predmetov sa majú zobraziť v kanáli Objaviť.';

  @override
  String get apply => 'Použiť';

  @override
  String get openLink => 'Otvorte odkaz';

  @override
  String get scanWithYourPhone => 'Skenujte pomocou telefónu';

  @override
  String get audiobookGenres => 'Žánre audiokníh';

  @override
  String get pickAudiobookGenres =>
      'Vyberte žánre, ktoré sa majú zobraziť v Audioknihe Objaviť.';

  @override
  String get discoverAudiobooks => 'Objavte audioknihy';

  @override
  String get librivoxDescription =>
      'Populárne tituly vo verejnej doméne od LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Prejdite doľava';

  @override
  String get scrollRight => 'Prejdite doprava';

  @override
  String get couldNotLoadGenre =>
      'Tento žáner sa momentálne nepodarilo načítať.';

  @override
  String get continueReading => 'Pokračovať v čítaní';

  @override
  String get savedHighlights => 'Uložené zvýraznenia';

  @override
  String get continueListening => 'Pokračovať v počúvaní';

  @override
  String get listen => 'Počúvaj';

  @override
  String get resume => 'Obnoviť';

  @override
  String get failedToLoadLibrary => 'Nepodarilo sa načítať knižnicu';

  @override
  String get popularNow => 'Populárne teraz';

  @override
  String get savedForLater => 'Uložené na neskôr';

  @override
  String get topListens => 'Top Listens';

  @override
  String get unreadDiscoveries => 'Neprečítané objavy';

  @override
  String get pickUpAgain => 'Vyzdvihnúť znova';

  @override
  String get bookHighlightsDescription =>
      'Vaše knihy s najlepšími, obľúbenými alebo pokrokmi v čítaní.';

  @override
  String get handPickedFromLibrary => 'Ručne vybrané z vašej knižnice.';

  @override
  String get handPickedFromListeningQueue =>
      'Ručne vybrané z frontu na počúvanie.';

  @override
  String get booksWithHighlights =>
      'Knihy s najdôležitejšími bodmi, obľúbenými položkami alebo pokrokom v čítaní.';

  @override
  String get jumpBackNarration =>
      'Skočte späť do rozprávania bez toho, aby ste hľadali svoje miesto.';

  @override
  String get unreadBooksReady =>
      'Neprečítané knihy pripravené na ďalšiu pokojnú hodinu.';

  @override
  String get quickAccessFavorites =>
      'Rýchly prístup ku knihám, ku ktorým sa stále vraciate.';

  @override
  String get searchAudiobooks => 'Vyhľadajte audioknihy';

  @override
  String get searchYourLibrary => 'Vyhľadajte svoju knižnicu';

  @override
  String get pickUpStory => 'Pokračujte v príbehu tam, kde ste skončili';

  @override
  String get savedPlacesChapters =>
      'Vaše uložené miesta a nedokončené kapitoly';

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
  String get readyWhenYouAre => 'Pripravený, keď budeš';

  @override
  String get details => 'Podrobnosti';

  @override
  String get listeningRoom => 'Miestnosť na počúvanie';

  @override
  String get bookmarksAndProgress => 'Záložky a pokrok';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Tituly';

  @override
  String get allTitles => 'Všetky tituly';

  @override
  String get authors => 'Autori';

  @override
  String get browseByAuthor => 'Prehľadávať podľa autora';

  @override
  String get browseByGenre => 'Prehľadávať podľa žánru';

  @override
  String get discover => 'Objavte';

  @override
  String get trendingTitlesOpenLibrary =>
      'Populárne tituly podľa témy od Open Library.';

  @override
  String get noBookmarkedItems => 'Zatiaľ žiadne záložky';

  @override
  String get nothingMatchesSection =>
      'Tejto sekcii zatiaľ nič nezodpovedá. Skúste inú kartu alebo sa vráťte po dokončení synchronizácie knižnice.';

  @override
  String get audiobooks => 'Audioknihy';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Priečinok';

  @override
  String get filters => 'Filtre';

  @override
  String get readingStatus => 'Stav čítania';

  @override
  String get playedStatus => 'Stav hrania';

  @override
  String get readStatus => 'Prečítajte si';

  @override
  String get watched => 'Sledované';

  @override
  String get unread => 'Neprečítané';

  @override
  String get unwatched => 'Nepozerané';

  @override
  String get seriesStatus => 'Stav série';

  @override
  String get allLibraries => 'Všetky knižnice';

  @override
  String get books => 'knihy';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Neznámy autor';

  @override
  String get uncategorized => 'Nezaradené do kategórie';

  @override
  String get overview => 'Prehľad';

  @override
  String get noLibrivoxDescription =>
      'LibriVox zatiaľ pre tento titul neposkytol žiadny popis.';

  @override
  String get readers => 'Čitatelia';

  @override
  String get openLinks => 'Otvorte Odkazy';

  @override
  String get librivoxPage => 'Stránka LibriVox';

  @override
  String get internetArchive => 'Internetový archív';

  @override
  String get rssFeed => 'RSS kanál';

  @override
  String get downloadZip => 'Stiahnite si Zip';

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
      'Pre tento titul zatiaľ nie je k dispozícii žiadny prehľad od Open Library.';

  @override
  String get subjects => 'Predmety';

  @override
  String get all => 'Všetky';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Túto tému sa momentálne nepodarilo načítať.';

  @override
  String get audiobookDetails => 'Podrobnosti o audioknihe';

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
  String get trackList => 'Zoznam skladieb';

  @override
  String get itemListPlaceholder => 'Tu sa zobrazí zoznam položiek';

  @override
  String get favoriteTracksPlaceholder => 'Tu sa zobrazia obľúbené skladby';

  @override
  String get failedToLoad => 'Načítanie zlyhalo';

  @override
  String get delete => 'Odstrániť';

  @override
  String get save => 'Uložiť';

  @override
  String get moreLikeThis => 'Viac podobných';

  @override
  String get castAndCrew => 'Obsadenie a štáb';

  @override
  String get collection => 'Zbierka';

  @override
  String get episodes => 'Epizódy';

  @override
  String get nextUp => 'Ďalej nahor';

  @override
  String get seasons => 'Ročné obdobia';

  @override
  String get chapters => 'kapitoly';

  @override
  String get features => 'Vlastnosti';

  @override
  String get movies => 'Filmy';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Iné';

  @override
  String get discography => 'Diskografia';

  @override
  String get similarArtists => 'Podobní umelci';

  @override
  String get tableOfContents => 'Obsah';

  @override
  String get tracklist => 'Tracklist';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Životopis';

  @override
  String get authorDetails => 'Podrobnosti o autorovi';

  @override
  String get noOverviewAvailable =>
      'Pre tento titul zatiaľ nie je k dispozícii žiadny prehľad.';

  @override
  String get noBiographyAvailable =>
      'Pre tohto autora nie je k dispozícii žiadna biografia.';

  @override
  String get noBooksFound => 'Pre tohto autora sa nenašli žiadne knihy.';

  @override
  String get unableToLoadAuthorDetails =>
      'Momentálne nie je možné načítať podrobnosti o autorovi.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Dátum vydania neznámy';

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
  String get view => 'Zobraziť';

  @override
  String get resumeReading => 'Pokračovať v čítaní';

  @override
  String get read => 'Prečítajte si';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Hrať';

  @override
  String get startOver => 'Začať odznova';

  @override
  String get restart => 'Reštartujte';

  @override
  String get readOffline => 'Čítať offline';

  @override
  String get playOffline => 'Hrať offline';

  @override
  String get audio => 'Zvuk';

  @override
  String get subtitles => 'titulky';

  @override
  String get version => 'Verzia';

  @override
  String get cast => 'Obsadenie';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Dokončené';

  @override
  String get favorited => 'Obľúbené';

  @override
  String get favorite => 'Obľúbené';

  @override
  String get playlist => 'Zoznam skladieb';

  @override
  String get downloaded => 'Stiahnuté';

  @override
  String get downloadAll => 'Stiahnuť všetko';

  @override
  String get download => 'Stiahnuť';

  @override
  String get deleteDownloaded => 'Odstrániť stiahnuté';

  @override
  String get goToSeries => 'Prejdite na Séria';

  @override
  String get editMetadata => 'Upraviť metadáta';

  @override
  String get less => 'Menej';

  @override
  String get more => 'Viac';

  @override
  String get deleteItem => 'Odstrániť položku';

  @override
  String get deletePlaylist => 'Odstrániť zoznam skladieb';

  @override
  String get deletePlaylistMessage =>
      'Odstrániť tento zoznam skladieb zo servera?';

  @override
  String get deleteItemMessage => 'Odstrániť túto položku zo servera?';

  @override
  String get failedToDeletePlaylist =>
      'Zoznam skladieb sa nepodarilo odstrániť';

  @override
  String get failedToDeleteItem => 'Položku sa nepodarilo odstrániť';

  @override
  String get renamePlaylist => 'Premenovať zoznam skladieb';

  @override
  String get playlistName => 'Názov zoznamu skladieb';

  @override
  String get deleteDownloadedAlbum => 'Odstrániť stiahnutý album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Stiahnuté skladby boli odstránené';

  @override
  String get downloadedTracksDeleteFailed =>
      'Niektoré stiahnuté skladby nebolo možné odstrániť';

  @override
  String get noTracksLoaded => 'Nie sú načítané žiadne stopy';

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
  String get itemDeleted => 'Položka bola odstránená';

  @override
  String get noPlayableTrailerFound => 'Nenašla sa žiadna hrateľná upútavka.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Zvuková stopa';

  @override
  String get subtitleTrack => 'Titulková stopa';

  @override
  String get none => 'žiadne';

  @override
  String get downloadSubtitlesLabel => 'Stiahnite si titulky...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Hľadajte pomocou doplnku OpenSubtitles';

  @override
  String get downloadSubtitles => 'Stiahnite si titulky';

  @override
  String get selectedSubtitleInvalid => 'Vybraté titulky sú neplatné.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Titulky stiahnuté. Kým Jellyfin obnoví položku, môže chvíľu trvať, kým sa objaví.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Vyberte Verzia';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Stiahnuť všetko – kvalita';

  @override
  String get downloadQuality => 'Kvalita sťahovania';

  @override
  String get originalFileNoReencoding => 'Pôvodný súbor, žiadne prekódovanie';

  @override
  String get originalFilesNoReencoding => 'Pôvodné súbory, žiadne prekódovanie';

  @override
  String get noEpisodesLoaded => 'Neboli načítané žiadne epizódy';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Odstrániť stiahnuté súbory';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Stiahnuté súbory boli odstránené';

  @override
  String get failedToDeleteFiles => 'Súbory sa nepodarilo odstrániť';

  @override
  String get deleteFiles => 'Odstrániť súbory';

  @override
  String get director => 'RIADITEĽ';

  @override
  String get writers => 'SPISOVATELIA';

  @override
  String get studio => 'ŠTÚDIO';

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
  String get showLess => 'Zobraziť menej';

  @override
  String get readMore => 'Prečítajte si viac';

  @override
  String get shuffle => 'Zamiešať';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Perfektná zhoda';

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
  String get deleteSeasonFiles => 'všetky stiahnuté epizódy v tejto sezóne';

  @override
  String get stillWatching => 'Stále pozeráte?';

  @override
  String get unableToLoadTrailerStream =>
      'Nie je možné načítať stream upútavky.';

  @override
  String get trailerTimedOut =>
      'Časový limit upútavky vypršal počas načítavania.';

  @override
  String get playbackFailedForTrailer => 'Prehrávanie tejto upútavky zlyhalo.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Prenášanie nie je počas prehrávania offline k dispozícii.';

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
  String get deviceVolume => 'Hlasitosť zariadenia';

  @override
  String get unavailable => 'nedostupné';

  @override
  String get pause => 'Pauza';

  @override
  String get syncPosition => 'Synchronizovať pozíciu';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Poradie je prázdne';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Prehrávanie na diaľku';

  @override
  String get castingToGoogleCast => 'Prenáša sa do služby Google Cast';

  @override
  String get castingViaAirPlay => 'Prenášanie cez AirPlay';

  @override
  String get castingViaDlna => 'Casting cez DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Dlhým stlačením odomknete';

  @override
  String get off => 'Vypnuté';

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
  String get bitrateOverride => 'Prepísanie bitovej rýchlosti';

  @override
  String get audioDelay => 'Oneskorenie zvuku';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Oneskorenie titulkov';

  @override
  String get reset => 'Resetovať';

  @override
  String get unknown => 'Neznámy';

  @override
  String get playbackInformation => 'Informácie o prehrávaní';

  @override
  String get playback => 'Prehrávanie';

  @override
  String get playMethod => 'Play Method';

  @override
  String get directPlay => 'Priame prehrávanie';

  @override
  String get directStream => 'Priamy stream';

  @override
  String get transcoding => 'Prekódovanie';

  @override
  String get transcodeReasons => 'Dôvody transkódovania';

  @override
  String get player => 'Hráč';

  @override
  String get container => 'Kontajner';

  @override
  String get bitrate => 'Bitová rýchlosť';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Rozlíšenie';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'kodek';

  @override
  String get videoBitrate => 'Bitová rýchlosť videa';

  @override
  String get track => 'Sledovať';

  @override
  String get channels => 'Kanály';

  @override
  String get audioBitrate => 'Bitová rýchlosť zvuku';

  @override
  String get sampleRate => 'Vzorkovacia frekvencia';

  @override
  String get format => 'Formátovať';

  @override
  String get external => 'Vonkajšie';

  @override
  String get embedded => 'Vložené';

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
      'Vykresľovanie EPUB v aplikácii zatiaľ nie je na tejto platforme dostupné.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Na tejto platforme nie je k dispozícii vykresľovanie vstavaných dokumentov.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nepodarilo sa otvoriť externý prehliadač.';

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
      'Zatiaľ žiadne záložky.\nKlepnutím na ikonu záložky počas čítania uložíte svoju pozíciu.';

  @override
  String get noTableOfContentsAvailable => 'Nie je k dispozícii žiadny obsah';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'pozícia';

  @override
  String get bookReader => 'Čítačka kníh';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Aktualizuje sa...';

  @override
  String get markUnread => 'Označiť ako neprečítané';

  @override
  String get markAsRead => 'Označiť ako prečítané';

  @override
  String get reloadReader => 'Znova načítať čítačku';

  @override
  String get noPagesFound => 'Nenašli sa žiadne stránky.';

  @override
  String get failedToDecodePageImage =>
      'Nepodarilo sa dekódovať obrázok stránky.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Jedna strana';

  @override
  String get twoPageSpread => 'Rozšírenie na dve strany';

  @override
  String get addBookmark => 'Pridať záložku';

  @override
  String get bookmarksEllipsis => 'Záložky...';

  @override
  String get markedAsRead => 'Označené ako prečítané';

  @override
  String get markedAsUnread => 'Označené ako neprečítané';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Téma: Systém';

  @override
  String get themeLight => 'Téma: Svetlo';

  @override
  String get themeDark => 'Téma: Tmavá';

  @override
  String get themeSepia => 'Téma: Sépia';

  @override
  String get invertColorsFixedLayout => 'Invertovať farby (pevné rozloženie)';

  @override
  String get invertColorsPdf => 'Invertovať farby (PDF)';

  @override
  String get preparingInAppReader => 'Pripravuje sa čítačka v aplikácii...';

  @override
  String get pdfDataNotAvailable => 'Údaje PDF nie sú k dispozícii.';

  @override
  String get readerFallbackModeActive => 'Záložný režim čítačky je aktívny';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Po prepnutí na podporovanú cieľovú platformu použite Reload Reader (Android, iOS, macOS).';

  @override
  String get openExternally => 'Otvoriť externe';

  @override
  String get noEpubChaptersFound => 'Nenašli sa žiadne kapitoly EPUB.';

  @override
  String get readerNotReady => 'Čitateľ nie je pripravený.';

  @override
  String get seriesRecordings => 'Nahrávky série';

  @override
  String get now => 'Teraz';

  @override
  String get sports => 'Šport';

  @override
  String get news => 'Správy';

  @override
  String get kids => 'deti';

  @override
  String get premiere => 'Premiéra';

  @override
  String get guideTimeline => 'Časová os sprievodcu';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Nenašli sa žiadne kanály';

  @override
  String get liveBadge => 'NAŽIVO';

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Odstránené z obľúbených kanálov';

  @override
  String get addedToFavoriteChannels => 'Pridané medzi obľúbené kanály';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Aktualizácia obľúbeného kanála zlyhala';

  @override
  String get unfavoriteChannel => 'Neobľúbený kanál';

  @override
  String get favoriteChannel => 'Obľúbený kanál';

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
  String get watch => 'Sledujte';

  @override
  String get close => 'Zavrieť';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Nepodarilo sa načítať nahrávky';

  @override
  String get scheduledInNext24Hours => 'Naplánované na nasledujúcich 24 hodín';

  @override
  String get recentRecordings => 'Nedávne nahrávky';

  @override
  String get tvSeries => 'TV seriál';

  @override
  String get failedToLoadSchedule => 'Plán sa nepodarilo načítať';

  @override
  String get noScheduledRecordings => 'Žiadne plánované nahrávky';

  @override
  String get cancelRecording => 'Zrušiť nahrávanie?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Nie';

  @override
  String get yesCancel => 'Áno, zrušiť';

  @override
  String get failedToCancelRecording => 'Nepodarilo sa zrušiť nahrávanie';

  @override
  String get failedToLoadSeriesRecordings =>
      'Nepodarilo sa načítať nahrávky série';

  @override
  String get noSeriesRecordings => 'Žiadne nahrávky série';

  @override
  String get cancelSeriesRecording => 'Zrušiť nahrávanie série';

  @override
  String get cancelSeriesRecordingQuestion => 'Zrušiť nahrávanie seriálu?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nepodarilo sa zrušiť nahrávanie série';

  @override
  String get searchThisLibrary => 'Hľadať v tejto knižnici...';

  @override
  String get searchEllipsis => 'Hľadať...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Serr';

  @override
  String get seerrAccountType => 'Typ účtu Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Miestne';

  @override
  String get savedMedia => 'Uložené médiá';

  @override
  String get tvShows => 'Televízne relácie';

  @override
  String get music => 'Hudba';

  @override
  String get musicAlbums => 'Hudobné albumy';

  @override
  String get noMediaInFilter => 'V tomto filtri nie sú žiadne médiá';

  @override
  String get noDownloadedMediaYet => 'Zatiaľ žiadne stiahnuté médiá';

  @override
  String get browseLibrary => 'Prehľadávať knižnicu';

  @override
  String get deleteDownload => 'Odstrániť stiahnutie';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'album';

  @override
  String get playAlbum => 'Prehrať album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Sezóna';

  @override
  String get errorLoadingEpisodes => 'Chyba pri načítavaní epizód';

  @override
  String get noDownloadedEpisodes => 'Žiadne stiahnuté epizódy';

  @override
  String get deleteEpisode => 'Odstrániť epizódu';

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
  String get seriesNotFound => 'Séria sa nenašla';

  @override
  String get errorLoadingSeries => 'Chyba pri načítavaní série';

  @override
  String get downloadedEpisodes => 'Stiahnuté epizódy';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Špeciálne ponuky';

  @override
  String get deleteSeason => 'Odstrániť sezónu';

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
  String get storageManagement => 'Správa úložiska';

  @override
  String get storageBreakdown => 'Rozdelenie úložiska';

  @override
  String get downloadedItems => 'Stiahnuté položky';

  @override
  String get storageLimit => 'Limit úložiska';

  @override
  String get noLimit => 'Bez obmedzenia';

  @override
  String get deleteAllDownloads => 'Odstrániť všetky stiahnuté súbory';

  @override
  String get deleteAllDownloadsWarning =>
      'Týmto sa odstránia všetky stiahnuté mediálne súbory a nemožno to vrátiť späť.';

  @override
  String get deleteAll => 'Odstrániť všetko';

  @override
  String get deleteSelected => 'Odstrániť vybraté';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Hudba a audioknihy';

  @override
  String get images => 'Obrázky';

  @override
  String get database => 'Databáza';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Nastavenia';

  @override
  String get authentication => 'Autentifikácia';

  @override
  String get autoLoginServerManagement =>
      'Automatické prihlásenie, správa servera';

  @override
  String get pinCode => 'PIN kód';

  @override
  String get setUpPinCodeProtection => 'Nastavte ochranu PIN kódom';

  @override
  String get parentalControls => 'Rodičovská kontrola';

  @override
  String get contentRatingRestrictions => 'Obmedzenia hodnotenia obsahu';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, rozlíšenie, správanie';

  @override
  String get languageSizeAppearance => 'Jazyk, veľkosť, vzhľad';

  @override
  String get qualityStorage => 'Kvalita, skladnosť';

  @override
  String get serverSyncAndPluginStatus =>
      'Synchronizácia servera a stav pluginu';

  @override
  String get mediaRequestIntegration => 'Integrácia mediálnych požiadaviek';

  @override
  String get switchServer => 'Prepnúť server';

  @override
  String get signOut => 'Odhlásiť sa';

  @override
  String get versionLicenses => 'Verzia, licencie';

  @override
  String get account => 'účtu';

  @override
  String get signInAndSecurity => 'Prihlásenie a zabezpečenie';

  @override
  String get administration => 'Administrácia';

  @override
  String get serverSettingsUsersLibraries =>
      'Nastavenia servera, používatelia, knižnice';

  @override
  String get customization => 'Prispôsobenie';

  @override
  String get themeAndLayout => 'Téma a rozloženie';

  @override
  String get videoAndSubtitles => 'Video a titulky';

  @override
  String get integrations => 'integrácií';

  @override
  String get pluginAndRequests => 'Plugin a požiadavky';

  @override
  String get customizeAccountPlaybackInterface =>
      'Prispôsobte si účet, prehrávanie a správanie rozhrania';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Téma a vzhľad';

  @override
  String get focusBorderColor => 'Farba okraja zaostrenia';

  @override
  String get watchedIndicators => 'Sledované indikátory';

  @override
  String get always => 'Vždy';

  @override
  String get hideUnwatched => 'Skryť nepozerané';

  @override
  String get episodesOnly => 'Iba epizódy';

  @override
  String get never => 'Nikdy';

  @override
  String get focusExpansionAnimation => 'Animácia rozšírenia zaostrenia';

  @override
  String get desktopUiScale => 'Desktop UI Scale';

  @override
  String get scaleFocusedCards =>
      'Mierka zaostrených alebo vznášajúcich sa kariet a dlaždíc';

  @override
  String get backgroundBackdrops => 'Pozadie pozadia';

  @override
  String get showBackdropImages => 'Zobraziť obrázky pozadia za obsahom';

  @override
  String get seriesThumbnails => 'Miniatúry série';

  @override
  String get seriesThumbnailsDescription =>
      'Iba epizódy: použite kresbu série, ktorá sa zhoduje s každým typom obrázka v riadku';

  @override
  String get homeRowInfoOverlay => 'Prekrytie informácií o domovskom riadku';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Zobrazovať názov a metadáta pri prehliadaní domovských riadkov';

  @override
  String get clockDisplay => 'Zobrazenie hodín';

  @override
  String get inMenus => 'V Ponukách';

  @override
  String get inVideo => 'Vo videu';

  @override
  String get seasonalEffects => 'Sezónne efekty';

  @override
  String get seasonalEffectsDescription =>
      'Vizuálne efekty a sezónne dekorácie';

  @override
  String get snow => 'Sneh';

  @override
  String get fireworks => 'Ohňostroje';

  @override
  String get confetti => 'konfety';

  @override
  String get fallingLeaves => 'Padajúce lístie';

  @override
  String get themeMusic => 'Téma Hudba';

  @override
  String get playThemeMusicOnDetailPages =>
      'Prehrávajte tematickú hudbu na stránkach s podrobnosťami';

  @override
  String get themeMusicVolume => 'Hlasitosť témy hudby';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Téma Hudba na Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Prehrať pri prehliadaní domovskej obrazovky';

  @override
  String get detailsBackgroundBlur => 'Podrobnosti rozostrenie pozadia';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Rozmazanie pozadia pri prehliadaní';

  @override
  String get maxStreamingBitrate => 'Maximálna prenosová rýchlosť streamovania';

  @override
  String get maxResolution => 'Maximálne rozlíšenie';

  @override
  String get playerZoomMode => 'Režim priblíženia prehrávača';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Automatické orezanie';

  @override
  String get stretch => 'Natiahnuť';

  @override
  String get refreshRateSwitching => 'Prepínanie obnovovacej frekvencie';

  @override
  String get disabled => 'Zakázané';

  @override
  String get scaleOnTv => 'Mierka v televízii';

  @override
  String get scaleOnDevice => 'Mierka na zariadení';

  @override
  String get trickPlay => 'Triková hra';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Pri vyhľadávaní zobraziť miniatúry ukážky';

  @override
  String get showDescriptionOnPause => 'Zobraziť popis pri pozastavení';

  @override
  String get dimVideoShowOverview =>
      'Stlmiť video a počas pozastavenia zobraziť text prehľadu';

  @override
  String get osdLockButton => 'Tlačidlo uzamknutia OSD';

  @override
  String get osdLockButtonDescription =>
      'Ukážte tlačidlo zámku, ktoré blokuje dotykový vstup, kým ho dlho nestlačíte';

  @override
  String get audioBehavior => 'Zvukové správanie';

  @override
  String get downmixToStereo => 'Downmix do Stereo';

  @override
  String get defaultAudioLanguage => 'Predvolený jazyk zvuku';

  @override
  String get autoServerDefault => 'Auto (predvolené nastavenie servera)';

  @override
  String get english => 'angličtina';

  @override
  String get spanish => 'španielčina';

  @override
  String get french => 'francúzsky';

  @override
  String get german => 'nemecký';

  @override
  String get italian => 'taliansky';

  @override
  String get portuguese => 'portugalčina';

  @override
  String get japanese => 'japončina';

  @override
  String get korean => 'kórejský';

  @override
  String get chinese => 'čínsky';

  @override
  String get russian => 'ruský';

  @override
  String get arabic => 'arabčina';

  @override
  String get hindi => 'hindčina';

  @override
  String get dutch => 'holandský';

  @override
  String get swedish => 'švédsky';

  @override
  String get norwegian => 'nórsky';

  @override
  String get danish => 'dánčina';

  @override
  String get finnish => 'fínsky';

  @override
  String get polish => 'poľský';

  @override
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'Priechod DTS';

  @override
  String get trueHdSupport => 'Podpora TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS audio len do AVR; vyžaduje podporu prijímača a zdrojovú stopu DTS';

  @override
  String get enableTrueHdAudio =>
      'Povoliť zvuk TrueHD (nemusí fungovať na všetkých platformách)';

  @override
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

  @override
  String get settingsAudioFallbackAacStereo => 'AAC Stereo';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

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
  String get nightMode => 'Nočný režim';

  @override
  String get compressDynamicRange => 'Komprimujte dynamický rozsah';

  @override
  String get advancedMpv => 'Pokročilé mpv';

  @override
  String get enableCustomMpvConf => 'Povoliť Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Pred spustením prehrávania použite súbor mpv.conf určený používateľom';

  @override
  String get unsafeAdvancedMpvOptions => 'Nebezpečné pokročilé možnosti mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Povoliť širšiu sadu možností mpv. Môže narušiť správanie prehrávania.';

  @override
  String get hardwareDecoding => 'Hardvérové ​​dekódovanie';

  @override
  String get hardwareDecodingSubtitle =>
      'Môže zlepšiť výkon, ale na niektorých zariadeniach môže spôsobiť problémy s prehrávaním.';

  @override
  String get nextUpAndQueuing => 'Ďalej a zaraďovanie do poradia';

  @override
  String get nextUpDisplay => 'Ďalej nahor Zobrazenie';

  @override
  String get extended => 'Rozšírené';

  @override
  String get minimal => 'Minimálne';

  @override
  String get nextUpTimeout => 'Časový limit nabudúce';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Poradie médií';

  @override
  String get autoQueueNextEpisodes =>
      'Automaticky zaradiť ďalšie epizódy do poradia';

  @override
  String get stillWatchingPrompt => 'Výzva stále sleduje';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Obnoviť a preskočiť';

  @override
  String get resumeRewind => 'Resume Rewind';

  @override
  String get unpauseRewind => 'Zrušiť pretáčanie dozadu';

  @override
  String get fiveSeconds => '5 sekúnd';

  @override
  String get tenSeconds => '10 sekúnd';

  @override
  String get fifteenSeconds => '15 sekúnd';

  @override
  String get thirtySeconds => '30 sekúnd';

  @override
  String get skipBackLength => 'Preskočiť späť dĺžku';

  @override
  String get skipForwardLength => 'Preskočiť dĺžku dopredu';

  @override
  String get customMpvConfPath => 'Vlastná cesta mpv.conf';

  @override
  String get notSetMpvConf =>
      'Nie je nastavené. Moonfin vyskúša predvolený súbor mpv.conf v priečinkoch aplikácií/údajov.';

  @override
  String get selectMpvConf => 'Vyberte mpv.conf';

  @override
  String get pathToMpvConf => '/cesta/k/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Nastavenia štýlu (veľkosť, farba, posun) platia pre textové titulky (SRT, VTT, TTML). Titulky ASS/SSA používajú svoj vlastný vložený štýl, pokiaľ nie je vypnuté „priame prehrávanie ASS/SSA“. Bitmapové titulky (PGS, DVB, VobSub) nie je možné preštylizovať.';

  @override
  String get defaultSubtitleLanguage => 'Predvolený jazyk titulkov';

  @override
  String get defaultToNoSubtitles => 'Predvolene sú žiadne titulky';

  @override
  String get turnOffSubtitlesByDefault => 'Predvolene vypnúť titulky';

  @override
  String get subtitleSize => 'Veľkosť titulkov';

  @override
  String get textFillColor => 'Farba výplne textu';

  @override
  String get backgroundColor => 'Farba pozadia';

  @override
  String get textStrokeColor => 'Farba ťahu textu';

  @override
  String get subtitleCustomization => 'Prispôsobenie titulkov';

  @override
  String get subtitleCustomizationDescription => 'Prispôsobte vzhľad titulkov';

  @override
  String get subtitlePreviewText => 'Rýchla hnedá líška preskočí lenivého psa';

  @override
  String get verticalOffset => 'Vertikálny posun';

  @override
  String get pgsDirectPlay => 'Priame prehrávanie PGS';

  @override
  String get directPlayPgsSubtitles => 'Priame prehrávanie titulkov PGS';

  @override
  String get assSsaDirectPlay => 'Priame prehrávanie ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles => 'Priame prehrávanie titulkov ASS/SSA';

  @override
  String get white => 'Biela';

  @override
  String get black => 'Čierna';

  @override
  String get yellow => 'Žltá';

  @override
  String get green => 'Zelená';

  @override
  String get cyan => 'azúrová';

  @override
  String get red => 'Červená';

  @override
  String get transparent => 'Transparentné';

  @override
  String get semiTransparentBlack => 'Čierna polopriehľadná';

  @override
  String get global => 'globálne';

  @override
  String get desktop => 'Desktop';

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
  String get customizationProfile => 'Profil prispôsobenia';

  @override
  String get customizationProfileDescription =>
      'Vyberte profil, ktorý chcete načítať, upraviť a synchronizovať. Globálne platí všade, pokiaľ ho neprepíše profil zariadenia. Zelená bodka označuje váš aktuálny profil zariadenia.';

  @override
  String get loadProfile => 'Načítať profil';

  @override
  String get syncing => 'Prebieha synchronizácia...';

  @override
  String get syncToProfile => 'Synchronizovať s profilom';

  @override
  String get profileSyncHidden => 'Synchronizácia profilu je skrytá';

  @override
  String get enablePluginSyncDescription =>
      'Povoľte synchronizáciu doplnku servera v nastaveniach doplnku, aby sa tu zobrazovali ovládacie prvky profilu.';

  @override
  String get quality => 'Kvalita';

  @override
  String get defaultDownloadQuality => 'Predvolená kvalita sťahovania';

  @override
  String get network => 'sieť';

  @override
  String get wifiOnlyDownloads => 'Sťahovanie iba cez WiFi';

  @override
  String get onlyDownloadOnWifi => 'Sťahujte iba pri pripojení k sieti Wi-Fi';

  @override
  String get storage => 'Skladovanie';

  @override
  String get storageUsed => 'Použité úložisko';

  @override
  String get manage => 'Spravovať';

  @override
  String get calculating => 'Prebieha výpočet...';

  @override
  String get downloadLocation => 'Miesto sťahovania';

  @override
  String get defaultLabel => 'Predvolené';

  @override
  String get saveToDownloadsFolder => 'Uložiť do priečinka Stiahnuté súbory';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin — viditeľné pre ostatné aplikácie';

  @override
  String get dangerZone => 'Nebezpečná zóna';

  @override
  String get clearAllDownloads => 'Vymazať všetky stiahnuté súbory';

  @override
  String get original => 'Originál';

  @override
  String get changeDownloadLocation => 'Zmeniť umiestnenie sťahovania';

  @override
  String get changeDownloadLocationDescription =>
      'Nové stiahnuté súbory sa uložia do vybratého priečinka. Existujúce stiahnuté súbory zostanú na svojom aktuálnom mieste a možno ich spravovať v nastaveniach úložiska.';

  @override
  String get confirm => 'Potvrďte';

  @override
  String get cannotWriteToFolder =>
      'Nedá sa zapisovať do vybratého priečinka. Vyberte iné umiestnenie alebo udeľte povolenia na ukladanie.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Uložiť do priečinka Stiahnuté súbory?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Stiahnuté médiá sa uložia do priečinka Downloads/Moonfin na vašom zariadení. Tieto súbory budú viditeľné pre iné aplikácie, ako je vaša galéria alebo hudobný prehrávač.\n\nExistujúce stiahnuté súbory zostanú na svojom aktuálnom mieste.';

  @override
  String get enable => 'Povoliť';

  @override
  String get clearAllDownloadsWarning =>
      'Týmto sa odstránia všetky stiahnuté médiá a nemožno to vrátiť späť.';

  @override
  String get clearAll => 'Vymazať všetko';

  @override
  String get navigationStyle => 'Štýl navigácie';

  @override
  String get topBar => 'Horná lišta';

  @override
  String get leftSidebar => 'Ľavý bočný panel';

  @override
  String get showShuffleButton => 'Zobraziť tlačidlo Shuffle';

  @override
  String get showGenresButton => 'Zobraziť tlačidlo žánrov';

  @override
  String get showFavoritesButton => 'Zobraziť tlačidlo Obľúbené';

  @override
  String get showLibrariesInToolbar =>
      'Zobraziť knižnice na paneli s nástrojmi';

  @override
  String get navbarOpacity => 'Nepriehľadnosť navigačnej lišty';

  @override
  String get navbarColor => 'Farba navigačného panela';

  @override
  String get gray => 'Šedá';

  @override
  String get darkBlue => 'Tmavomodrá';

  @override
  String get purple => 'Fialová';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'námorníctvo';

  @override
  String get charcoal => 'Drevené uhlie';

  @override
  String get brown => 'Hnedá';

  @override
  String get darkRed => 'Tmavo červená';

  @override
  String get darkGreen => 'Tmavo zelená';

  @override
  String get slate => 'Bridlica';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Zobrazenie knižnice';

  @override
  String get posterLabel => 'plagát';

  @override
  String get thumbnailLabel => 'Miniatúra';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings =>
      'Prepísať nastavenia jednotlivých knižníc';

  @override
  String get applyImageTypeToAllLibraries =>
      'Použiť typ obrázka na všetky knižnice';

  @override
  String get multiServerLibraries => 'Multiserverové knižnice';

  @override
  String get showLibrariesFromAllServers =>
      'Zobraziť knižnice zo všetkých pripojených serverov';

  @override
  String get enableFolderView => 'Povoliť zobrazenie priečinka';

  @override
  String get showFolderBrowsingOption =>
      'Zobraziť možnosť prehliadania priečinkov';

  @override
  String get libraryVisibility => 'Viditeľnosť knižnice';

  @override
  String get libraryVisibilityDescription =>
      'Prepnúť viditeľnosť domovskej stránky podľa knižnice. Reštartujte Moonfin, aby sa zmeny prejavili.';

  @override
  String get showInNavigation => 'Zobraziť v navigácii';

  @override
  String get showInLatestMedia => 'Zobraziť v najnovších médiách';

  @override
  String get sourceLibraries => 'Zdrojové knižnice';

  @override
  String get sourceCollections => 'Zdrojové zbierky';

  @override
  String get excludedGenres => 'Vylúčené žánre';

  @override
  String get selectAll => 'Vyberte možnosť Všetky';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Panel médií';

  @override
  String get mediaSources => 'Zdroje médií';

  @override
  String get behavior => 'Správanie';

  @override
  String get seconds => 'sekúnd';

  @override
  String get localPreviews => 'Miestne ukážky';

  @override
  String get localPreviewsDescription =>
      'Nakonfigurujte ukážky upútavky, médií a zvuku.';

  @override
  String get mediaBarMode => 'Štýl mediálneho panela';

  @override
  String get mediaBarModeDescription =>
      'Vyberte si medzi Moonfin, MakD alebo vypnite panel médií';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Vypnuté';

  @override
  String get enableMediaBar => 'Povoliť panel médií';

  @override
  String get showFeaturedContentSlideshow =>
      'Zobraziť prezentáciu odporúčaného obsahu doma';

  @override
  String get contentType => 'Typ obsahu';

  @override
  String get moviesAndTvShows => 'Filmy a televízne relácie';

  @override
  String get moviesOnly => 'Iba filmy';

  @override
  String get tvShowsOnly => 'Len televízne relácie';

  @override
  String get itemCount => 'Počet položiek';

  @override
  String get noneSelected => 'Nie je vybratá žiadna';

  @override
  String get noneExcluded => 'Žiadne vylúčené';

  @override
  String get autoAdvance => 'Auto Advance';

  @override
  String get autoAdvanceSlides => 'Automaticky prejsť na ďalšiu snímku';

  @override
  String get autoAdvanceInterval => 'Interval automatického posunu';

  @override
  String get trailerPreview => 'Ukážka upútavky';

  @override
  String get autoPlayTrailers =>
      'Automatické prehrávanie upútavok na paneli médií po 3 sekundách';

  @override
  String get episodePreview => 'Ukážka epizódy';

  @override
  String get mediaPreview => 'Ukážka médií';

  @override
  String get episodePreviewDescription =>
      'Zahrajte si 30-sekundovú ukážku na zaostrených, položených alebo dlho stlačených kartách';

  @override
  String get mediaPreviewDescription =>
      'Zahrajte si 30-sekundovú ukážku na zaostrených, položených alebo dlho stlačených kartách';

  @override
  String get previewAudio => 'Ukážka zvuku';

  @override
  String get enablePreviewAudio => 'Povoliť zvuk pre ukážky upútavky a epizódy';

  @override
  String get latestMedia => 'Najnovšie médiá';

  @override
  String get recentlyReleased => 'Nedávno vydané';

  @override
  String get myMedia => 'Moje médiá';

  @override
  String get myMediaSmall => 'Moje médiá (malé)';

  @override
  String get continueWatching => 'Pokračovať v sledovaní';

  @override
  String get resumeAudio => 'Obnoviť zvuk';

  @override
  String get resumeBooks => 'Resume Books';

  @override
  String get activeRecordings => 'Aktívne nahrávky';

  @override
  String get playlists => 'Zoznamy skladieb';

  @override
  String get liveTV => 'Živá televízia';

  @override
  String get homeSections => 'Domáce Sekcie';

  @override
  String get resetToDefaults => 'Obnoviť predvolené nastavenia';

  @override
  String get homeRowPosterSize => 'Veľkosť plagátu Home Row';

  @override
  String get perRowImageTypeSelection => 'Výber typu obrázka na riadok';

  @override
  String get configureImageTypeForEachRow =>
      'Nakonfigurujte typ obrázka pre každý povolený domovský riadok';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Zlúčiť Pokračovať v pozeraní a Ďalej';

  @override
  String get combineBothRows =>
      'Skombinujte oba riadky do jednej domácej sekcie';

  @override
  String get perRowImageType => 'Typ obrázka na riadok';

  @override
  String get perRowSettings => 'Nastavenia po riadkoch';

  @override
  String get autoLogin => 'Automatické prihlásenie';

  @override
  String get lastUser => 'Posledný používateľ';

  @override
  String get specificUser => 'Konkrétny používateľ';

  @override
  String get alwaysAuthenticate => 'Vždy overiť';

  @override
  String get requirePasswordWithToken =>
      'Vyžadovať heslo aj s uloženým tokenom';

  @override
  String get confirmExit => 'Potvrďte Koniec';

  @override
  String get showConfirmationBeforeExiting =>
      'Pred opustením ukážte potvrdenie';

  @override
  String get blockContentWithRatings =>
      'Blokovať obsah s nasledujúcimi hodnoteniami:';

  @override
  String get noContentRatingsFound =>
      'Na tomto serveri sa zatiaľ nenašli žiadne hodnotenia obsahu.';

  @override
  String get couldNotLoadServerRatings =>
      'Hodnotenia servera sa nepodarilo načítať. Zobrazujú sa iba uložené hodnotenia.';

  @override
  String get couldNotRefreshRatings =>
      'Nepodarilo sa obnoviť hodnotenia zo servera. Zobrazujú sa uložené hodnotenia.';

  @override
  String get enablePinCode => 'Povoliť PIN kód';

  @override
  String get requirePinToAccess => 'Požadovať PIN na prístup k vášmu účtu';

  @override
  String get changePin => 'Zmeniť PIN';

  @override
  String get setNewPinCode => 'Nastavte nový PIN kód';

  @override
  String get removePin => 'Odstráňte PIN';

  @override
  String get removePinProtection => 'Odstráňte ochranu PIN kódom';

  @override
  String get screensaver => 'Šetrič obrazovky';

  @override
  String get inAppScreensaver => 'Šetrič obrazovky v aplikácii';

  @override
  String get enableBuiltInScreensaver => 'Povoliť vstavaný šetrič obrazovky';

  @override
  String get mode => 'Režim';

  @override
  String get libraryArt => 'Knižnica umenie';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Hodiny';

  @override
  String get timeout => 'Časový limit';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Úroveň stmievania';

  @override
  String get maxAgeRating => 'Maximálne vekové hodnotenie';

  @override
  String get any => 'Akékoľvek';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Vyžadovať vekové hodnotenie';

  @override
  String get onlyShowRatedContent => 'Zobraziť iba hodnotený obsah';

  @override
  String get showClock => 'Zobraziť hodiny';

  @override
  String get displayClockDuringScreensaver =>
      'Zobrazenie hodín počas šetriča obrazovky';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Kritici)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (publikum)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritický';

  @override
  String get metacriticUser => 'Metacritic (používateľ)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Hodnotenie komunity';

  @override
  String get ratings => 'hodnotenia';

  @override
  String get additionalRatings => 'Ďalšie hodnotenia';

  @override
  String get showMdbListAndTmdbRatings => 'Zobraziť hodnotenia MDBList a TMDB';

  @override
  String get ratingLabels => 'Hodnotiace štítky';

  @override
  String get showLabelsNextToIcons => 'Zobraziť štítky vedľa ikon hodnotenia';

  @override
  String get ratingBadges => 'Hodnotiace odznaky';

  @override
  String get showDecorativeBadges =>
      'Zobraziť dekoratívne odznaky za hodnoteniami';

  @override
  String get episodeRatings => 'Hodnotenie epizód';

  @override
  String get showRatingsOnEpisodes => 'Zobraziť hodnotenia jednotlivých epizód';

  @override
  String get ratingSources => 'Zdroje hodnotenia';

  @override
  String get ratingSourcesDescription =>
      'Povoľte a zmeňte poradie zdrojov hodnotení zobrazovaných v aplikácii';

  @override
  String get pluginLabel => 'Plugin';

  @override
  String get pluginDetected => 'Plugin zistený';

  @override
  String get pluginNotDetected => 'Plugin nebol zistený';

  @override
  String get pluginDetectedDescription =>
      'Zistil sa doplnok servera. Synchronizácia sa aktivuje automaticky pri prvom nájdení doplnku.';

  @override
  String get pluginNotDetectedDescription =>
      'Serverový plugin momentálne nie je zistený. Miestne nastavenia stále používajú svoje uložené hodnoty alebo vstavané predvolené hodnoty.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Dostupné služby';

  @override
  String get serverPluginSync => 'Server Plugin Sync';

  @override
  String get syncSettingsWithPlugin =>
      'Synchronizujte nastavenia s doplnkom servera';

  @override
  String get whatSyncControls => 'Čo ovláda synchronizáciu';

  @override
  String get syncControlsDescription =>
      'Synchronizácia kontroluje iba to, či sa nastavenia podporované doplnkami prenášajú na server a sťahujú zo servera. Výber profilu a akcie synchronizácie profilu sú v nastaveniach prispôsobenia, keď je povolená synchronizácia doplnkov.';

  @override
  String get recentRequests => 'Nedávne žiadosti';

  @override
  String get recentlyAdded => 'Nedávno pridané';

  @override
  String get trending => 'Trendy';

  @override
  String get popularMovies => 'Populárne filmy';

  @override
  String get movieGenres => 'Filmové žánre';

  @override
  String get upcomingMovies => 'Pripravované filmy';

  @override
  String get studios => 'Štúdiá';

  @override
  String get popularSeries => 'Populárna séria';

  @override
  String get seriesGenres => 'Žánre seriálov';

  @override
  String get upcomingSeries => 'Pripravovaná séria';

  @override
  String get networks => 'siete';

  @override
  String get resetRowsToDefaults => 'Obnovte predvolené hodnoty riadkov';

  @override
  String get enableSeerr => 'Povoliť Serr';

  @override
  String get showSeerrInNavigation =>
      'Zobraziť Seerr v navigácii (vyžaduje doplnok servera)';

  @override
  String get seerrUnavailable =>
      'Nedostupné, pretože podpora serverového doplnku Seerr je zakázaná.';

  @override
  String get nsfwFilter => 'Filter NSFW';

  @override
  String get hideAdultContent => 'Skryť obsah pre dospelých vo výsledkoch';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Objavte riadky';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Presunutím zmeníte poradie. Povoliť alebo zakázať riadky. Povolená synchronizácia poradia riadkov s doplnkom Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Presunutím zmeníte poradie. Povoliť alebo zakázať riadky.';

  @override
  String get enabled => 'Povolené';

  @override
  String get hidden => 'Skryté';

  @override
  String get aboutTitle => 'O';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Licencie otvoreného zdroja';

  @override
  String get sourceCode => 'Zdrojový kód';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Skontrolujte aktualizácie';

  @override
  String get checksLatestDesktopRelease =>
      'Skontroluje najnovšie vydanie pre túto platformu pre počítače';

  @override
  String get youAreUpToDate => 'Ste aktuálny.';

  @override
  String get couldNotCheckForUpdates =>
      'Momentálne nie je možné skontrolovať aktualizácie.';

  @override
  String get noCompatibleUpdate =>
      'Pre túto platformu sa nenašiel žiadny kompatibilný aktualizačný balík.';

  @override
  String get updateChecksNotSupported =>
      'Na tejto platforme nie sú podporované kontroly aktualizácií.';

  @override
  String get updateNotificationsDisabled =>
      'Upozornenia na aktualizácie sú zakázané.';

  @override
  String get pleaseWaitBeforeChecking => 'Pred opätovnou kontrolou počkajte.';

  @override
  String get latestUpdateAlreadyShown =>
      'Najnovšia aktualizácia už bola zobrazená.';

  @override
  String get updateAvailable => 'K dispozícii je aktualizácia.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Aktualizovať upozornenia';

  @override
  String get showWhenUpdatesAvailable =>
      'Zobraziť, kedy sú dostupné aktualizácie';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Prečítajte si poznámky k vydaniu';

  @override
  String get downloadingUpdate => 'Sťahuje sa aktualizácia...';

  @override
  String get updateDownloadFailed =>
      'Sťahovanie aktualizácie zlyhalo. Skúste to znova.';

  @override
  String get openReleasesPage => 'Otvorte stránku vydaní';

  @override
  String get navigation => 'Navigácia';

  @override
  String get watchedIndicatorsBackdrops => 'Sledované ukazovatele, kulisy';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Farba zaostrenia, sledované indikátory, pozadia';

  @override
  String get navbarStyleToolbarAppearance =>
      'Štýl navigačného panela, tlačidlá na paneli nástrojov, vzhľad';

  @override
  String get reorderToggleHomeRows =>
      'Zmeňte poradie a prepínajte domovské riadky';

  @override
  String get featuredContentAppearance => 'Odporúčaný obsah, vzhľad';

  @override
  String get posterSizeImageTypeFolderView =>
      'Veľkosť plagátu, typ obrázka, zobrazenie priečinka';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB a zdroje hodnotenia';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Jasné';

  @override
  String get browse => 'Prehľadávať';

  @override
  String get noResults => 'Žiadne výsledky';

  @override
  String get seerrAvailableStatus => 'Dostupné';

  @override
  String get seerrRequestedStatus => 'Požadované';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Nastavenia Seerr';

  @override
  String get requestMore => 'Vyžiadajte si viac';

  @override
  String get request => 'Žiadosť';

  @override
  String get cancelRequest => 'Zrušiť žiadosť';

  @override
  String get playInMoonfin => 'Hrajte v Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'schváliť';

  @override
  String get declineAction => 'Odmietnuť';

  @override
  String get similar => 'Podobné';

  @override
  String get recommendations => 'Odporúčania';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Udržujte';

  @override
  String get itemNotFoundInLibrary =>
      'Položka sa nenašla vo vašej knižnici Moonfin';

  @override
  String get errorSearchingLibrary => 'Chyba pri vyhľadávaní knižnice';

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
  String get submitRequest => 'Odoslať žiadosť';

  @override
  String get allSeasons => 'Všetky ročné obdobia';

  @override
  String get advancedOptions => 'Rozšírené možnosti';

  @override
  String get noServiceServersConfigured =>
      'Nie sú nakonfigurované žiadne servisné servery';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Profil kvality';

  @override
  String get rootFolder => 'Koreňový priečinok';

  @override
  String get showMore => 'Zobraziť viac';

  @override
  String get appearances => 'Vystúpenia';

  @override
  String get crewSection => 'Posádka';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Žiadne žiadosti';

  @override
  String get pendingStatus => 'Čaká na spracovanie';

  @override
  String get declinedStatus => 'Odmietnuté';

  @override
  String get partiallyAvailable => 'Čiastočne k dispozícii';

  @override
  String get downloadingStatus => 'Sťahovanie';

  @override
  String get approvedStatus => 'Schválené';

  @override
  String get notRequestedStatus => 'Nevyžiadané';

  @override
  String get blocklistedStatus => 'Blokované';

  @override
  String get deletedStatus => 'Odstránené';

  @override
  String get tmdbScore => 'Skóre TMDB';

  @override
  String get releaseDateLabel => 'Dátum vydania';

  @override
  String get firstAirDateLabel => 'Dátum prvého vysielania';

  @override
  String get revenueLabel => 'Výnosy';

  @override
  String get runtimeLabel => 'Runtime';

  @override
  String get budgetLabel => 'Rozpočet';

  @override
  String get originalLanguageLabel => 'Pôvodný jazyk';

  @override
  String get seasonsLabel => 'Ročné obdobia';

  @override
  String get episodesLabel => 'Epizódy';

  @override
  String get access => 'Prístup';

  @override
  String get add => 'Pridať';

  @override
  String get address => 'Adresa';

  @override
  String get analytics => 'Analytics';

  @override
  String get catalog => 'Katalóg';

  @override
  String get content => 'Obsah';

  @override
  String get copy => 'Kopírovať';

  @override
  String get create => 'Vytvorte';

  @override
  String get disable => 'Zakázať';

  @override
  String get done => 'Hotovo';

  @override
  String get edit => 'Upraviť';

  @override
  String get encoding => 'Kódovanie';

  @override
  String get error => 'Chyba';

  @override
  String get forward => 'Vpred';

  @override
  String get general => 'generál';

  @override
  String get go => 'Choď';

  @override
  String get install => 'Inštalovať';

  @override
  String get installed => 'Nainštalované';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Meno';

  @override
  String get networking => 'vytváranie sietí';

  @override
  String get next => 'Ďalej';

  @override
  String get path => 'Cesta';

  @override
  String get paused => 'Pozastavené';

  @override
  String get permissions => 'Povolenia';

  @override
  String get processing => 'Spracovanie';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Poskytovateľ';

  @override
  String get refresh => 'Obnoviť';

  @override
  String get remote => 'Diaľkové ovládanie';

  @override
  String get rename => 'Premenovať';

  @override
  String get revoke => 'Odvolať';

  @override
  String get role => 'Role';

  @override
  String get root => 'Root';

  @override
  String get run => 'Bežať';

  @override
  String get search => 'Hľadať';

  @override
  String get select => 'Vyberte';

  @override
  String get send => 'Odoslať';

  @override
  String get sessions => 'Relácie';

  @override
  String get set => 'Set';

  @override
  String get status => 'Stav';

  @override
  String get stop => 'Stop';

  @override
  String get streaming => 'Streamovanie';

  @override
  String get time => 'Čas';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Odinštalovať';

  @override
  String get up => 'Hore';

  @override
  String get update => 'Aktualizovať';

  @override
  String get upload => 'Nahrať';

  @override
  String get unmute => 'Zapnúť zvuk';

  @override
  String get mute => 'Stlmiť';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Dashboard';

  @override
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'Nastavenia';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Používatelia';

  @override
  String get adminDrawerLibraries => 'Knižnice';

  @override
  String get adminDrawerTranscoding => 'Prekódovanie';

  @override
  String get adminDrawerResume => 'Obnoviť';

  @override
  String get adminDrawerStreaming => 'Streamovanie';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Zariadenia';

  @override
  String get adminDrawerActivity => 'Aktivita';

  @override
  String get adminDrawerNetworking => 'vytváranie sietí';

  @override
  String get adminDrawerApiKeys => 'API kľúče';

  @override
  String get adminDrawerBackups => 'Zálohy';

  @override
  String get adminDrawerLogs => 'Denníky';

  @override
  String get adminDrawerScheduledTasks => 'Naplánované úlohy';

  @override
  String get adminDrawerPlugins => 'Pluginy';

  @override
  String get adminDrawerRepositories => 'úložiská';

  @override
  String get adminDrawerLiveTv => 'Živá televízia';

  @override
  String get adminExitTooltip => 'Ukončiť správcu';

  @override
  String get adminDashboardLoadFailed =>
      'Nepodarilo sa načítať informačný panel';

  @override
  String get adminMediaOverview => 'Prehľad médií';

  @override
  String get adminMediaTotalsError =>
      'Nepodarilo sa načítať súčty médií servera.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Rýchle čítanie o tom, koľko obsahu je na tomto serveri.';

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
  String get analyticsMediaDistribution => 'Distribúcia médií';

  @override
  String get analyticsVideoCodecs => 'Video kodeky';

  @override
  String get analyticsAudioCodecs => 'Audio kodeky';

  @override
  String get analyticsContainers => 'Kontajnery';

  @override
  String get analyticsTopGenres => 'Najlepšie žánre';

  @override
  String get analyticsReleaseYears => 'Roky vydania';

  @override
  String get analyticsContentRatings => 'Hodnotenia obsahu';

  @override
  String get analyticsRuntimeBuckets => 'Runtime buckety';

  @override
  String get analyticsFileFormats => 'Formáty súborov';

  @override
  String get analyticsNoData => 'Nie sú k dispozícii žiadne údaje.';

  @override
  String get adminServerInfo => 'Informácie o serveri';

  @override
  String get adminRestartPending => 'Čaká sa na reštart';

  @override
  String get adminServerPaths => 'Serverové cesty';

  @override
  String get adminServerActions => 'Akcie servera';

  @override
  String get adminRestartServer => 'Reštartujte server';

  @override
  String get adminShutdownServer => 'Vypnutie servera';

  @override
  String get adminScanLibraries => 'Skenovať knižnice';

  @override
  String get adminLibraryScanStarted => 'Spustilo sa skenovanie knižnice';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Prebieha reštart servera';

  @override
  String get adminServerRebootMessage =>
      'Prebieha reštart servera, reštartujte prosím Moonfin';

  @override
  String get adminActiveSessions => 'Aktívne relácie';

  @override
  String get adminSessionsLoadFailed => 'Nepodarilo sa načítať relácie';

  @override
  String get adminNoActiveSessions => 'Žiadne aktívne relácie';

  @override
  String get adminRecentActivity => 'Nedávna aktivita';

  @override
  String get adminNoRecentActivity => 'Žiadna nedávna aktivita';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Odoslať správu';

  @override
  String get adminMessageTextHint => 'Text správy';

  @override
  String get adminSetVolume => 'Nastavte hlasitosť';

  @override
  String get sessionPrev => 'Predch';

  @override
  String get sessionRewind => 'Pretočiť späť';

  @override
  String get sessionForward => 'Vpred';

  @override
  String get sessionNext => 'Ďalej';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Prehráva sa';

  @override
  String get volume => 'Objem';

  @override
  String get actions => 'Akcie';

  @override
  String get videoCodec => 'Video kodek';

  @override
  String get audioCodec => 'Audio kodek';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Dokončenie';

  @override
  String get direct => 'Priame';

  @override
  String get adminDisconnect => 'Odpojiť';

  @override
  String get adminClearDates => 'Vymazať dátumy';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Žiadne záznamy aktivity';

  @override
  String get adminEditDeviceName => 'Upravte názov zariadenia';

  @override
  String get adminCustomName => 'Vlastný názov';

  @override
  String get adminDeviceNameUpdated => 'Názov zariadenia bol aktualizovaný';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Odstrániť zariadenie';

  @override
  String get adminDeviceDeleted => 'Zariadenie bolo odstránené';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Nepodarilo sa načítať zariadenia';

  @override
  String get adminSearchDevices => 'Vyhľadajte zariadenia';

  @override
  String get adminThisDevice => 'Toto zariadenie';

  @override
  String get adminEditName => 'Upraviť meno';

  @override
  String get adminLibrariesLoadFailed => 'Nepodarilo sa načítať knižnice';

  @override
  String get adminNoLibraries => 'Nie sú nakonfigurované žiadne knižnice';

  @override
  String get adminScanAllLibraries => 'Skenovať všetky knižnice';

  @override
  String get adminAddLibrary => 'Pridať knižnicu';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Premenovať knižnicu';

  @override
  String get adminNewName => 'Nové meno';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Odstrániť knižnicu';

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
  String get adminRemovePath => 'Odstrániť cestu';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Možnosti knižnice boli uložené';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nepodarilo sa načítať knižnicu';

  @override
  String get adminNoMediaPaths => 'Nie sú nakonfigurované žiadne cesty médií';

  @override
  String get adminAddPath => 'Pridať cestu';

  @override
  String get adminBrowseFilesystem => 'Prehľadávať súborový systém servera:';

  @override
  String get adminSaveOptions => 'Možnosti uloženia';

  @override
  String get adminPreferredMetadataLanguage => 'Preferovaný jazyk metadát';

  @override
  String get adminMetadataLanguageHint => 'napr. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Kód krajiny metadát';

  @override
  String get adminMetadataCountryHint => 'napr. USA, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Vyžaduje sa názov knižnice';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Názov knižnice';

  @override
  String get adminSelectedPaths => 'Vybrané cesty:';

  @override
  String get adminNoPathsAdded =>
      'Nie sú pridané žiadne cesty (možno pridať neskôr)';

  @override
  String get adminCreateLibrary => 'Vytvoriť knižnicu';

  @override
  String get paths => 'Cesty:';

  @override
  String get adminDisableUser => 'Zakázať používateľa';

  @override
  String get adminEnableUser => 'Povoliť používateľa';

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
  String get adminUsersLoadFailed => 'Používateľov sa nepodarilo načítať';

  @override
  String get adminSearchUsers => 'Vyhľadajte používateľov';

  @override
  String get adminEditUser => 'Upraviť používateľa';

  @override
  String get adminAddUser => 'Pridať používateľa';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Vytvoriť používateľa';

  @override
  String get adminPasswordOptional => 'Heslo (voliteľné)';

  @override
  String get adminUsernameRequired => 'Používateľské meno nemôže byť prázdne';

  @override
  String get adminNoProfileChanges => 'Žiadne zmeny profilu na uloženie';

  @override
  String get adminProfileSaved => 'Profil bol uložený';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Povolenia boli uložené';

  @override
  String get adminPasswordsMismatch => 'Heslá sa nezhodujú';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Používateľa sa nepodarilo načítať';

  @override
  String get adminBackToUsers => 'Späť na Používateľov';

  @override
  String get adminSaveProfile => 'Uložiť profil';

  @override
  String get adminDeleteUser => 'Odstrániť používateľa';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Administrátori majú úplný prístup k serveru. Udeľujte opatrne.';

  @override
  String get administrator => 'správca';

  @override
  String get adminHiddenUser => 'Skrytý používateľ';

  @override
  String get adminAllowMediaPlayback => 'Povoliť prehrávanie médií';

  @override
  String get adminAllowAudioTranscoding => 'Povoliť prekódovanie zvuku';

  @override
  String get adminAllowVideoTranscoding => 'Povoliť prekódovanie videa';

  @override
  String get adminAllowRemuxing => 'Povoliť remuxovanie';

  @override
  String get adminForceRemoteTranscoding =>
      'Vynútiť prekódovanie vzdialeného zdroja';

  @override
  String get adminAllowContentDeletion => 'Povoliť odstraňovanie obsahu';

  @override
  String get adminAllowContentDownloading => 'Povoliť sťahovanie obsahu';

  @override
  String get adminAllowPublicSharing => 'Povoliť verejné zdieľanie';

  @override
  String get adminAllowRemoteControl =>
      'Povoliť diaľkové ovládanie iných používateľov';

  @override
  String get adminAllowSharedDeviceControl =>
      'Povoliť ovládanie zdieľaného zariadenia';

  @override
  String get adminAllowRemoteAccess => 'Povoliť vzdialený prístup';

  @override
  String get adminRemoteBitrateLimit =>
      'Limit bitovej rýchlosti vzdialeného klienta (b/s)';

  @override
  String get adminLeaveEmptyNoLimit => 'Nechajte prázdne bez obmedzenia';

  @override
  String get adminMaxActiveSessions => 'Maximálny počet aktívnych relácií';

  @override
  String get adminAllowLiveTvAccess => 'Povoliť prístup k živej televízii';

  @override
  String get adminAllowLiveTvManagement =>
      'Povoliť správu živého televízneho vysielania';

  @override
  String get adminAllowCollectionManagement => 'Povoliť správu zbierky';

  @override
  String get adminAllowSubtitleManagement => 'Povoliť správu titulkov';

  @override
  String get adminAllowLyricManagement => 'Povoliť správu textov';

  @override
  String get adminSavePermissions => 'Uložiť povolenia';

  @override
  String get adminEnableAllLibraryAccess =>
      'Povoliť prístup do všetkých knižníc';

  @override
  String get adminSaveAccess => 'Uložiť prístup';

  @override
  String get adminChangePassword => 'Zmeniť heslo';

  @override
  String get adminNewPassword => 'Nové heslo';

  @override
  String get adminConfirmPassword => 'Potvrďte heslo';

  @override
  String get adminSetPassword => 'Nastaviť heslo';

  @override
  String get adminResetPassword => 'Obnoviť heslo';

  @override
  String get adminPasswordReset => 'Obnovenie hesla';

  @override
  String get adminPasswordUpdated => 'Heslo bolo aktualizované';

  @override
  String get adminUserSettings => 'Používateľské nastavenia';

  @override
  String get adminLibraryAccess => 'Prístup do knižnice';

  @override
  String get adminDeviceAndChannelAccess => 'Prístup k zariadeniam a kanálom';

  @override
  String get adminEnableAllDevices => 'Povoliť prístup ku všetkým zariadeniam';

  @override
  String get adminEnableAllChannels => 'Povoliť prístup ku všetkým kanálom';

  @override
  String get adminResetPasswordWarning =>
      'Týmto sa heslo odstráni. Používateľ sa bude môcť prihlásiť bez hesla.';

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
  String get adminCreateApiKey => 'Vytvorte kľúč API';

  @override
  String get adminAppName => 'Názov aplikácie';

  @override
  String get adminApiKeyCreated => 'Kľúč API bol vytvorený';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Kľúč bol úspešne vytvorený. Server nevrátil token. Skontrolujte kľúče API servera.';

  @override
  String get adminKeyCopied => 'Kľúč bol skopírovaný do schránky';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'V odpovedi servera chýba kľúčový token';

  @override
  String get adminRevokeApiKey => 'Odvolať kľúč API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Kľúč API bol odvolaný';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Nepodarilo sa načítať kľúče API';

  @override
  String get adminApiKeysTitle => 'API kľúče';

  @override
  String get adminCreateKey => 'Vytvoriť kľúč';

  @override
  String get adminNoApiKeys => 'Nenašli sa žiadne kľúče API';

  @override
  String get adminUnknownApp => 'Neznáma aplikácia';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Vytvára sa záloha...';

  @override
  String get adminBackupCreated => 'Záloha bola úspešne vytvorená';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'V odpovedi servera chýba záložná cesta';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Potvrďte obnovenie';

  @override
  String get adminRestoringBackup => 'Obnovuje sa záloha...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Nepodarilo sa načítať zálohy';

  @override
  String get adminCreateBackup => 'Vytvoriť zálohu';

  @override
  String get adminNoBackups => 'Nenašli sa žiadne zálohy';

  @override
  String get adminViewDetails => 'Zobraziť podrobnosti';

  @override
  String get restore => 'Obnoviť';

  @override
  String get adminLogsLoadFailed => 'Nepodarilo sa načítať denníky servera';

  @override
  String get adminNoLogFiles => 'Nenašli sa žiadne protokolové súbory';

  @override
  String get adminLogCopied => 'Denník bol skopírovaný do schránky';

  @override
  String get adminSaveLogFile => 'Uložiť súbor denníka';

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
  String get adminSearchInLog => 'Hľadaj v denníku';

  @override
  String get adminNoMatchingLines => 'Žiadne zodpovedajúce riadky';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nenašli sa žiadne naplánované úlohy';

  @override
  String get adminNoTasksMatchFilter =>
      'Aktuálnemu filtru nezodpovedajú žiadne úlohy';

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
  String get adminRunNow => 'Spustiť teraz';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Posledná poprava';

  @override
  String get adminTriggers => 'Spúšťače';

  @override
  String get adminAddTrigger => 'Pridať spúšťač';

  @override
  String get adminNoTriggers => 'Nie sú nakonfigurované žiadne spúšťače';

  @override
  String get adminTriggerType => 'Typ spúšťača';

  @override
  String get adminTimeLimit => 'Časový limit (voliteľné)';

  @override
  String get adminNoLimit => 'Bez obmedzenia';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Deň v týždni';

  @override
  String get adminSearchPlugins => 'Hľadať doplnky...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Odinštalovať doplnok';

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
      'Vášmu vyhľadávaniu nezodpovedajú žiadne doplnky';

  @override
  String get adminNoPluginsInstalled => 'Nie sú nainštalované žiadne doplnky';

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
      'Vášmu vyhľadávaniu nezodpovedajú žiadne balíky';

  @override
  String get adminNoPackagesAvailable => 'Nie sú k dispozícii žiadne balíčky';

  @override
  String get adminExperimentalIntegration => 'Experimentálna integrácia';

  @override
  String get adminExperimentalWarning =>
      'Integrácia nastavení pluginu je stále experimentálna. Niektoré stránky s nastaveniami sa nemusia vykresliť správne.';

  @override
  String get continueAction => 'Pokračovať';

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
      'Nie je možné otvoriť nastavenia: chýba autorizačný token.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Doplnok sa nenašiel';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Povoliť doplnok';

  @override
  String get adminPluginSettingsPage => 'Stránka s nastaveniami pluginu';

  @override
  String get adminRevisionHistory => 'História revízií';

  @override
  String get adminNoChangelog => 'Nie je k dispozícii žiadny zoznam zmien.';

  @override
  String get adminRemoveRepository => 'Odstrániť úložisko';

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
  String get adminRepositoryNameHint => 'napr. Jellyfin Stabilné';

  @override
  String get adminRepositoryUrl => 'Adresa URL úložiska';

  @override
  String get adminAddEntry => 'Pridať záznam';

  @override
  String get adminInvalidUrl => 'Neplatná adresa URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Otvoriť v prehliadači';

  @override
  String get adminOpenExternally => 'Otvorte zvonka';

  @override
  String get adminGeneralSettings => 'Všeobecné nastavenia';

  @override
  String get adminServerName => 'Názov servera';

  @override
  String get adminPreferredMetadataCountry => 'Preferovaná krajina metadát';

  @override
  String get adminCachePath => 'Cesta vyrovnávacej pamäte';

  @override
  String get adminMetadataPath => 'Cesta metadát';

  @override
  String get adminLibraryScanConcurrency => 'Súbežnosť skenovania knižnice';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limit paralelného kódovania obrázkov';

  @override
  String get adminSlowResponseThreshold => 'Prah pomalej odozvy (ms)';

  @override
  String get adminBrandingSaved => 'Nastavenia budovania značky boli uložené';

  @override
  String get adminBrandingLoadFailed =>
      'Nepodarilo sa načítať nastavenia značky';

  @override
  String get adminLoginDisclaimer => 'Vylúčenie zodpovednosti pri prihlásení';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML zobrazené pod prihlasovacím formulárom';

  @override
  String get adminCustomCss => 'Vlastné CSS';

  @override
  String get adminCustomCssHint => 'Vlastné CSS aplikované na webové rozhranie';

  @override
  String get adminEnableSplashScreen => 'Povoliť úvodnú obrazovku';

  @override
  String get adminStreamingSaved => 'Nastavenia streamovania boli uložené';

  @override
  String get adminStreamingLoadFailed =>
      'Nepodarilo sa načítať nastavenia streamovania';

  @override
  String get adminStreamingDescription =>
      'Nastavte globálne limity prenosovej rýchlosti pre vzdialené pripojenia.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limit bitovej rýchlosti vzdialeného klienta (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Nechajte prázdne alebo 0 pre neobmedzené';

  @override
  String get adminPlaybackSaved => 'Nastavenia prehrávania boli uložené';

  @override
  String get adminPlaybackLoadFailed =>
      'Nepodarilo sa načítať nastavenia prehrávania';

  @override
  String get adminPlaybackTranscoding => 'Prehrávanie / prekódovanie';

  @override
  String get adminHardwareAcceleration => 'Hardvérová akcelerácia';

  @override
  String get adminVaapiDevice => 'VA-API zariadenie';

  @override
  String get adminEnableHardwareEncoding => 'Povoliť hardvérové ​​kódovanie';

  @override
  String get adminEnableHardwareDecoding =>
      'Povoliť hardvérové ​​dekódovanie pre:';

  @override
  String get adminEncodingThreads => 'Kódovanie vlákien';

  @override
  String get adminAutomatic => '0 = automaticky';

  @override
  String get adminTranscodingTempPath => 'Tempová cesta prekódovania';

  @override
  String get adminEnableFallbackFont => 'Povoliť záložné písmo';

  @override
  String get adminFallbackFontPath => 'Cesta náhradného písma';

  @override
  String get adminAllowSegmentDeletion => 'Povoliť vymazanie segmentu';

  @override
  String get adminSegmentKeepSeconds => 'Zachovanie segmentu (v sekundách)';

  @override
  String get adminThrottleBuffering => 'Tlmenie škrtiacej klapky';

  @override
  String get adminTrickplaySaved => 'Nastavenia Trickplay boli uložené';

  @override
  String get adminTrickplayLoadFailed =>
      'Nepodarilo sa načítať nastavenia trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Povoliť hardvérovú akceleráciu';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Povoliť iba extrakciu kľúčového rámca';

  @override
  String get adminKeyFrameSubtitle => 'Rýchlejšie, ale s nižšou presnosťou';

  @override
  String get adminScanBehavior => 'Správanie pri skenovaní';

  @override
  String get adminProcessPriority => 'Priorita procesu';

  @override
  String get adminImageSettings => 'Nastavenia obrazu';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Ako často snímať snímky';

  @override
  String get adminWidthResolutions => 'Rozlíšenia šírky';

  @override
  String get adminTileWidth => 'Šírka dlaždice';

  @override
  String get adminTileHeight => 'Výška dlaždice';

  @override
  String get adminQualitySubtitle =>
      'Nižšie hodnoty = lepšia kvalita, väčšie súbory';

  @override
  String get adminProcessThreads => 'Procesné vlákna';

  @override
  String get adminResumeSaved => 'Obnoviť uložené nastavenia';

  @override
  String get adminResumeLoadFailed =>
      'Nepodarilo sa načítať nastavenia obnovenia';

  @override
  String get adminResumeDescription =>
      'Nakonfigurujte, kedy má byť obsah označený ako čiastočne prehratý alebo úplne prehraný.';

  @override
  String get adminMinResumePercentage => 'Minimálne percento obnovenia';

  @override
  String get adminMinResumeSubtitle =>
      'Ak chcete uložiť postup, obsah sa musí prehrať po tomto percente';

  @override
  String get adminMaxResumePercentage => 'Maximálne percento obnovenia';

  @override
  String get adminMaxResumeSubtitle =>
      'Po tomto percente sa obsah považuje za úplne prehratý';

  @override
  String get adminMinResumeDuration => 'Minimálne trvanie obnovenia (sekundy)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Položky kratšie ako toto nie je možné obnoviť';

  @override
  String get adminMinAudiobookResume =>
      'Minimálne percento obnovenia audioknihy';

  @override
  String get adminMaxAudiobookResume =>
      'Maximálne percento obnovenia audioknihy';

  @override
  String get adminNetworkingSaved =>
      'Nastavenia siete boli uložené. Môže sa vyžadovať reštart servera.';

  @override
  String get adminNetworkingLoadFailed =>
      'Nepodarilo sa načítať nastavenia siete';

  @override
  String get adminNetworkingWarning =>
      'Zmeny nastavení siete môžu vyžadovať reštart servera.';

  @override
  String get adminEnableRemoteAccess => 'Povoliť vzdialený prístup';

  @override
  String get ports => 'Porty';

  @override
  String get adminHttpPort => 'HTTP port';

  @override
  String get adminHttpsPort => 'HTTPS port';

  @override
  String get adminPublicHttpsPort => 'Verejný port HTTPS';

  @override
  String get adminBaseUrl => 'Základná adresa URL';

  @override
  String get adminBaseUrlHint => 'napr. /medúza';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Povoliť HTTPS';

  @override
  String get adminLocalNetwork => 'Lokálna sieť';

  @override
  String get adminLocalNetworkAddresses => 'Lokálne sieťové adresy';

  @override
  String get adminKnownProxies => 'Známe proxy';

  @override
  String get adminRemoteIpFilter => 'Vzdialený filter IP';

  @override
  String get adminRemoteIpFilterEntries => 'Vzdialený IP filter';

  @override
  String get adminCertificatePath => 'Cesta k certifikátu';

  @override
  String get whitelist => 'Whitelist';

  @override
  String get blacklist => 'Čierna listina';

  @override
  String get notSet => 'Nie je nastavené';

  @override
  String get adminMetadataSaved => 'Metadáta boli uložené';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Obnoviť metadáta';

  @override
  String get recursive => 'Rekurzívne';

  @override
  String get adminReplaceAllMetadata => 'Nahradiť všetky metadáta';

  @override
  String get adminReplaceAllImages => 'Nahradiť všetky obrázky';

  @override
  String get adminMetadataRefreshRequested => 'Požaduje sa obnovenie metadát';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Vyhľadajte vzdialenú osobu';

  @override
  String get adminNoRemoteMatches => 'Nenašli sa žiadne vzdialené zhody';

  @override
  String get adminRemoteResults => 'Vzdialené výsledky';

  @override
  String get adminRemoteMetadataApplied => 'Použili sa vzdialené metadáta';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Aktualizovať typ obsahu';

  @override
  String get adminContentType => 'Typ obsahu';

  @override
  String get adminContentTypeUpdated => 'Typ obsahu bol aktualizovaný';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nepodarilo sa načítať editor metadát';

  @override
  String get adminNoPeopleEntries => 'Žiadne záznamy ľudí';

  @override
  String get adminNoExternalIds =>
      'Nie sú k dispozícii žiadne externé identifikátory';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nepodporovaný formát obrázka';

  @override
  String get adminImageReadFailed => 'Nepodarilo sa prečítať vybratý obrázok';

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
  String get adminAllProviders => 'Všetci poskytovatelia';

  @override
  String get adminNoRemoteImages => 'Nenašli sa žiadne vzdialené obrázky';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Pridať tuner';

  @override
  String get adminTunerType => 'Typ tunera';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, iné';

  @override
  String get adminUrlPath => 'URL / cesta';

  @override
  String get adminNameOptional => 'Meno (voliteľné)';

  @override
  String get adminTunerAdded => 'Tuner dodal';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Pridať poskytovateľa sprievodcov';

  @override
  String get adminProviderType => 'Typ poskytovateľa';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect alebo XMLTV';

  @override
  String get adminUsernameOptional => 'Používateľské meno (voliteľné)';

  @override
  String get adminRefreshInterval => 'Interval obnovenia (hodiny)';

  @override
  String get adminProviderAdded => 'Poskytovateľ bol pridaný';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Vyžiadaný reset tunera';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Nastavenia nahrávania';

  @override
  String get adminPrePadding => 'Predvyplnenie (minúty)';

  @override
  String get adminPostPadding => 'Po odsadení (minúty)';

  @override
  String get adminRecordingPath => 'Cesta záznamu';

  @override
  String get adminSeriesRecordingPath => 'Cesta záznamu série';

  @override
  String get adminRecordingSettingsSaved =>
      'Nastavenia nahrávania boli uložené';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Nastavte mapovania kanálov';

  @override
  String get adminMappingJson => 'Mapovanie JSON';

  @override
  String get adminMappingJsonHint =>
      'Príklad: užitočné zaťaženie mapovania JSON';

  @override
  String get adminChannelMappingsUpdated =>
      'Mapovania kanálov boli aktualizované';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'Nepodarilo sa načítať správu Live TV';

  @override
  String get adminTunerDevices => 'Tunerové zariadenia';

  @override
  String get adminNoTunerHosts =>
      'Nie sú nakonfigurovaní žiadni hostitelia tunera';

  @override
  String get adminGuideProviders => 'Poskytovatelia sprievodcov';

  @override
  String get adminAddProvider => 'Pridať poskytovateľa';

  @override
  String get adminNoListingProviders =>
      'Nie sú nakonfigurovaní žiadni poskytovatelia záznamov';

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
  String get adminChannelMappings => 'Mapovania kanálov';

  @override
  String get adminNoDiscoveredTuners => 'Zatiaľ žiadne objavené tunery';

  @override
  String get adminSettingsSaved => 'Nastavenia boli uložené';

  @override
  String get adminBackupsNotAvailable =>
      'Na tejto zostave servera nie sú k dispozícii zálohy.';

  @override
  String get adminRestoreWarning1 =>
      'Obnovenie nahradí VŠETKY aktuálne údaje servera záložnými údajmi.';

  @override
  String get adminRestoreWarning2 =>
      'Aktuálne nastavenia servera, používatelia a údaje knižnice budú prepísané.';

  @override
  String get adminRestoreWarning3 => 'Server sa po obnovení reštartuje.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Požadované obnovenie. Reštartovanie servera môže túto reláciu prerušiť.';

  @override
  String get adminBackupsTitle => 'Zálohy';

  @override
  String get adminUnknownDate => 'Neznámy dátum';

  @override
  String get adminUnnamedBackup => 'Nepomenovaná záloha';

  @override
  String get adminLiveTvNotAvailable =>
      'Správa živého televízneho vysielania nie je na tejto zostave servera dostupná.';

  @override
  String get adminLiveTvTitle => 'Správa živej televízie';

  @override
  String get adminApply => 'Použiť';

  @override
  String get adminNotSet => 'Nie je nastavené';

  @override
  String get adminReset => 'Resetovať';

  @override
  String get adminLogsTitle => 'Denníky servera';

  @override
  String get adminLogsNewestFirst => 'Najnovšie prvé';

  @override
  String get adminLogsOldestFirst => 'Najstaršia prvá';

  @override
  String get adminLogsJustNow => 'Práve teraz';

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
  String get adminLogViewerNoMatches => 'Žiadne zodpovedajúce riadky';

  @override
  String get adminMetadataEditorTitle => 'Editor metadát';

  @override
  String get adminMetadataRemote => 'Diaľkové ovládanie';

  @override
  String get adminMetadataType => 'Typ';

  @override
  String get adminMetadataDetails => 'Podrobnosti';

  @override
  String get adminMetadataExternalIds => 'Externé ID';

  @override
  String get adminMetadataImages => 'Obrázky';

  @override
  String get adminMetadataFieldTitle => 'Názov';

  @override
  String get adminMetadataFieldSortTitle => 'Zoradiť názov';

  @override
  String get adminMetadataFieldOriginalTitle => 'Pôvodný názov';

  @override
  String get adminMetadataFieldPremiereDate => 'Dátum premiéry (RRRR-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Dátum ukončenia (RRRR-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Rok výroby';

  @override
  String get adminMetadataFieldOfficialRating => 'Oficiálne hodnotenie';

  @override
  String get adminMetadataFieldCommunityRating => 'Hodnotenie komunity';

  @override
  String get adminMetadataFieldCriticRating => 'Kritické hodnotenie';

  @override
  String get adminMetadataFieldTagline => 'slogan';

  @override
  String get adminMetadataFieldOverview => 'Prehľad';

  @override
  String get adminMetadataGenres => 'Žánre';

  @override
  String get adminMetadataTags => 'Tagy';

  @override
  String get adminMetadataStudios => 'Štúdiá';

  @override
  String get adminMetadataPeople => 'Ľudia';

  @override
  String get adminMetadataAddGenre => 'Pridajte žáner';

  @override
  String get adminMetadataAddTag => 'Pridať značku';

  @override
  String get adminMetadataAddStudio => 'Pridať štúdio';

  @override
  String get adminMetadataAddPerson => 'Pridať osobu';

  @override
  String get adminMetadataEditPerson => 'Upraviť osobu';

  @override
  String get adminMetadataRole => 'Role';

  @override
  String get adminMetadataImagePrimary => 'Primárne';

  @override
  String get adminMetadataImageBackdrop => 'Pozadie';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Palec';

  @override
  String get adminMetadataRecursive => 'Rekurzívne';

  @override
  String get adminMetadataProvider => 'Poskytovateľ';

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
      'Nepodarilo sa prečítať vybratý obrázok';

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
      'Týmto sa z položky odstráni aktuálny obrázok.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Nahrať';

  @override
  String get adminMetadataUpdate => 'Aktualizovať';

  @override
  String get adminMetadataRemoteImage => 'Vzdialený obraz';

  @override
  String get adminPluginsInstalled => 'Nainštalované';

  @override
  String get adminPluginsCatalog => 'Katalóg';

  @override
  String get adminPluginsActive => 'Aktívne';

  @override
  String get adminPluginsRestart => 'Reštartujte';

  @override
  String get adminPluginsNoSearchResults =>
      'Vášmu vyhľadávaniu nezodpovedajú žiadne doplnky';

  @override
  String get adminPluginsNoneInstalled => 'Nie sú nainštalované žiadne doplnky';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric =>
      'K dispozícii je aktualizácia';

  @override
  String get adminPluginsPendingRemoval => 'Čaká sa na odstránenie po reštarte';

  @override
  String get adminPluginsChangesPending => 'Zmeny čakajúce na reštart';

  @override
  String get adminPluginsEnable => 'Povoliť';

  @override
  String get adminPluginsDisable => 'Zakázať';

  @override
  String get adminPluginsInstallUpdate => 'Nainštalujte aktualizáciu';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Vášmu vyhľadávaniu nezodpovedajú žiadne balíky';

  @override
  String get adminPluginsCatalogEmpty => 'Nie sú k dispozícii žiadne balíčky';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Experimentálna integrácia';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integrácia nastavení pluginu je stále experimentálna. Niektoré polia alebo rozloženia sa ešte nemusia správne vykresliť.';

  @override
  String get adminPluginDetailToggle404 =>
      'Doplnok sa nepodarilo prepnúť. Server nemohol nájsť túto verziu doplnku. Skúste obnoviť doplnky a potom to skúste znova.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Doplnok sa nepodarilo prepnúť. Podrobnosti nájdete v protokoloch servera.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Podrobnosti';

  @override
  String get adminPluginDetailDeveloper => 'Vývojár';

  @override
  String get adminPluginDetailRepository => 'Úložisko';

  @override
  String get adminPluginDetailBundled => 'Zbalený';

  @override
  String get adminPluginDetailEnablePlugin => 'Povoliť doplnok';

  @override
  String get adminPluginDetailRestartRequired =>
      'Aby sa zmeny prejavili, je potrebný reštart servera.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Tento plugin bude odstránený po reštarte servera.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Tento doplnok nefunguje správne a nemusí fungovať správne.';

  @override
  String get adminPluginDetailNotSupported =>
      'Tento plugin nie je podporovaný aktuálnou verziou servera.';

  @override
  String get adminPluginDetailSuperseded =>
      'Tento doplnok bol nahradený novšou verziou.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Odstrániť úložisko';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Odstrániť';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Nie sú nakonfigurované žiadne úložiská';

  @override
  String get adminReposEmptySubtitle =>
      'Pridajte úložisko na prehliadanie dostupných doplnkov';

  @override
  String get adminReposUnnamed => '(bez názvu)';

  @override
  String get adminReposEditTitle => 'Upraviť úložisko';

  @override
  String get adminReposAddTitle => 'Pridať úložisko';

  @override
  String get adminReposUrl => 'Adresa URL úložiska';

  @override
  String get adminReposNameHint => 'napr. Jellyfin Stabilné';

  @override
  String get adminPluginSettingsInvalidUrl => 'Neplatná adresa URL';

  @override
  String get adminGeneralSettingsTitle => 'Všeobecné nastavenia';

  @override
  String get adminGeneralMetadataLanguage => 'Preferovaný jazyk metadát';

  @override
  String get adminGeneralMetadataLanguageHint => 'napr. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Preferovaná krajina metadát';

  @override
  String get adminGeneralMetadataCountryHint => 'napr. USA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Súbežnosť skenovania knižnice';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limit paralelného kódovania obrázkov';

  @override
  String get adminUnknownError => 'Neznáma chyba';

  @override
  String get adminBrowse => 'Prehľadávať';

  @override
  String get adminCloseBrowser => 'Zatvorte prehliadač';

  @override
  String get adminNetworkingTitle => 'vytváranie sietí';

  @override
  String get adminNetworkingRestartWarning =>
      'Zmeny nastavení siete môžu vyžadovať reštart servera.';

  @override
  String get adminNetworkingRemoteAccess => 'Povoliť vzdialený prístup';

  @override
  String get adminNetworkingPorts => 'Porty';

  @override
  String get adminNetworkingHttpPort => 'HTTP port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS port';

  @override
  String get adminNetworkingEnableHttps => 'Povoliť HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Lokálna sieť';

  @override
  String get adminNetworkingLocalAddresses => 'Lokálne sieťové adresy';

  @override
  String get adminNetworkingAddressHint => 'napr. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Známe proxy';

  @override
  String get adminNetworkingProxyHint => 'napr. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Whitelist';

  @override
  String get adminNetworkingBlacklist => 'Čierna listina';

  @override
  String get adminNetworkingAddEntry => 'Pridať záznam';

  @override
  String get adminBrandingTitle => 'Branding';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Vylúčenie zodpovednosti pri prihlásení';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML zobrazené pod prihlasovacím formulárom';

  @override
  String get adminBrandingCustomCss => 'Vlastné CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Vlastné CSS aplikované na webové rozhranie';

  @override
  String get adminBrandingEnableSplash => 'Povoliť úvodnú obrazovku';

  @override
  String get adminPlaybackHwAccel => 'Hardvérová akcelerácia';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardvérová akcelerácia';

  @override
  String get adminPlaybackEnableHwEncoding => 'Povoliť hardvérové ​​kódovanie';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Povoliť hardvérové ​​dekódovanie pre:';

  @override
  String get adminPlaybackEncoding => 'Kódovanie';

  @override
  String get adminPlaybackEncodingThreads => 'Kódovanie vlákien';

  @override
  String get adminPlaybackFallbackFont => 'Povoliť záložné písmo';

  @override
  String get adminPlaybackFallbackFontPath => 'Cesta náhradného písma';

  @override
  String get adminPlaybackStreaming => 'Streamovanie';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Audioknihy';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimálne percento obnovenia audioknihy';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maximálne percento obnovenia audioknihy';

  @override
  String get adminStreamingBitrateLimit =>
      'Limit bitovej rýchlosti vzdialeného klienta (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Nechajte prázdne alebo 0 pre neobmedzené';

  @override
  String get adminTrickplayHwAccel => 'Povoliť hardvérovú akceleráciu';

  @override
  String get adminTrickplayHwEncoding => 'Povoliť hardvérové ​​kódovanie';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Povoliť iba extrakciu kľúčového rámca';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Rýchlejšie, ale s nižšou presnosťou';

  @override
  String get adminTrickplayNonBlocking => 'Neblokovanie';

  @override
  String get adminTrickplayBlocking => 'Blokovanie';

  @override
  String get adminTrickplayPriorityHigh => 'Vysoká';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Nad normálom';

  @override
  String get adminTrickplayPriorityNormal => 'Normálne';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Pod normálnou hodnotou';

  @override
  String get adminTrickplayPriorityIdle => 'Nečinný';

  @override
  String get adminTrickplayImageSettings => 'Nastavenia obrazu';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Ako často snímať snímky';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Šírka pixelov oddelená čiarkami (napr. 320)';

  @override
  String get adminTrickplayQuality => 'Kvalita';

  @override
  String get adminTrickplayQScale => 'Stupnica kvality';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Nižšie hodnoty = lepšia kvalita, väčšie súbory';

  @override
  String get adminTrickplayJpegQuality => 'kvalita JPEG';

  @override
  String get adminTrickplayProcessing => 'Spracovanie';

  @override
  String get adminTasksEmpty => 'Nenašli sa žiadne naplánované úlohy';

  @override
  String get adminTasksNoFilterMatch =>
      'Aktuálnemu filtru nezodpovedajú žiadne úlohy';

  @override
  String get adminTaskCancelling => 'Prebieha rušenie...';

  @override
  String get adminTaskRunning => 'Beží...';

  @override
  String get adminTaskNeverRun => 'Nikdy neutekaj';

  @override
  String get adminTaskStop => 'Stop';

  @override
  String get adminTaskRun => 'Bežať';

  @override
  String get adminTaskDetailLastExecution => 'Posledná poprava';

  @override
  String get adminTaskDetailStarted => 'Začaté';

  @override
  String get adminTaskDetailEnded => 'Ukončené';

  @override
  String get adminTaskDetailDuration => 'Trvanie';

  @override
  String get adminTaskDetailErrorLabel => 'Chyba:';

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
  String get adminTaskTriggerStartup => 'Pri spustení aplikácie';

  @override
  String get adminTaskTriggerTypeDaily => 'Denne';

  @override
  String get adminTaskTriggerTypeWeekly => 'Týždenne';

  @override
  String get adminTaskTriggerTypeInterval => 'V intervale';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

  @override
  String get adminTaskTriggerEveryHour => 'Každú hodinu';

  @override
  String get adminTaskTriggerEvery6Hours => 'Každých 6 hodín';

  @override
  String get adminTaskTriggerEvery12Hours => 'Každých 12 hodín';

  @override
  String get adminTaskTriggerEvery24Hours => 'Každých 24 hodín';

  @override
  String get adminTaskTriggerEvery2Days => 'Každé 2 dni';

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
  String get adminTaskTriggerNoLimit => 'Bez obmedzenia';

  @override
  String get adminActivityJustNow => 'Práve teraz';

  @override
  String get adminActivityLastHour => 'Posledná hodina';

  @override
  String get adminActivityToday => 'Dnes';

  @override
  String get adminActivityYesterday => 'včera';

  @override
  String get adminActivityOlder => 'Starší';

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
  String get adminActivityNow => 'teraz';

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
      'Nakonfigurujte generovanie trickplay obrázkov pre vyhľadávanie náhľadov miniatúr.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Verejný port HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Základná adresa URL';

  @override
  String get adminNetworkingBaseUrlHint => 'napr. /medúza';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Cesta k certifikátu';

  @override
  String get adminNetworkingRemoteIpFilter => 'Vzdialený filter IP';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Vzdialený IP filter';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API zariadenie';

  @override
  String get adminPlaybackAutomatic => '0 = automaticky';

  @override
  String get adminPlaybackTranscodeTempPath => 'Tempová cesta prekódovania';

  @override
  String get adminPlaybackSegmentDeletion => 'Povoliť vymazanie segmentu';

  @override
  String get adminPlaybackSegmentKeep => 'Zachovanie segmentu (v sekundách)';

  @override
  String get adminPlaybackThrottleBuffering => 'Tlmenie škrtiacej klapky';

  @override
  String get adminResumeMinPct => 'Minimálne percento obnovenia';

  @override
  String get adminResumeMinPctSubtitle =>
      'Ak chcete uložiť postup, obsah sa musí prehrať po tomto percente';

  @override
  String get adminResumeMaxPct => 'Maximálne percento obnovenia';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Po tomto percente sa obsah považuje za úplne prehratý';

  @override
  String get adminResumeMinDuration => 'Minimálne trvanie obnovenia (sekundy)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Položky kratšie ako toto nie je možné obnoviť';

  @override
  String get adminTrickplayScanBehavior => 'Správanie pri skenovaní';

  @override
  String get adminTrickplayProcessPriority => 'Priorita procesu';

  @override
  String get adminTrickplayTileWidth => 'Šírka dlaždice';

  @override
  String get adminTrickplayTileHeight => 'Výška dlaždice';

  @override
  String get adminTrickplayProcessThreads => 'Procesné vlákna';

  @override
  String get adminTrickplayWidthResolutions => 'Rozlíšenia šírky';

  @override
  String get adminMetadataDefault => 'Predvolené';

  @override
  String get adminMetadataContentTypeUpdated => 'Typ obsahu bol aktualizovaný';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Prah pomalej odozvy (ms)';

  @override
  String get adminGeneralCachePath => 'Cesta vyrovnávacej pamäte';

  @override
  String get adminGeneralMetadataPath => 'Cesta metadát';

  @override
  String get adminGeneralServerName => 'Názov servera';

  @override
  String get adminSettingsLoadFailed => 'Nepodarilo sa načítať nastavenia';

  @override
  String get adminDiscover => 'Objavte';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Priečinky';

  @override
  String get libraries => 'Knižnice';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay je vypnuté';

  @override
  String get syncPlayDisabledMessage =>
      'Ak chcete používať synchronizované prehrávanie, povoľte v Nastaveniach SyncPlay.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Server nie je podporovaný';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay vyžaduje server Jellyfin. Aktuálny server to nepodporuje.';

  @override
  String get syncPlayGroupFallbackName => 'Skupina SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'skupina SyncPlay';

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
  String get syncPlayIgnoreWait => 'Ignorovať čakanie';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Nezdržiavajte skupinu, kým sa toto zariadenie načítava do vyrovnávacej pamäte';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Pokračujte lokálne bez čakania na pomalých členov';

  @override
  String get syncPlayRepeat => 'Opakujte';

  @override
  String get syncPlayRepeatOne => 'Jeden';

  @override
  String get syncPlayShuffleModeShuffled => 'Zamiešané';

  @override
  String get syncPlayShuffleModeSorted => 'Zoradené';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Synchronizácia aktuálneho poradia prehrávania';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Nahraďte skupinový front tým, čo sa prehráva lokálne';

  @override
  String get syncPlayLeaveGroup => 'Opustiť skupinu';

  @override
  String get syncPlayGroupQueue => 'Skupinový rad';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Hrajte teraz';

  @override
  String get syncPlayCreateNewGroup => 'Vytvorte novú skupinu';

  @override
  String get syncPlayGroupName => 'Názov skupiny';

  @override
  String get syncPlayDefaultGroupName => 'Moja skupina SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Vytvoriť skupinu';

  @override
  String get syncPlayAvailableGroups => 'Dostupné skupiny';

  @override
  String get syncPlayNoGroupsAvailable => 'Nie sú dostupné žiadne skupiny';

  @override
  String get syncPlayJoinGroupQuestion => 'Pripojiť sa k skupine SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Pripojenie sa k skupine SyncPlay môže nahradiť váš aktuálny zoznam prehrávania. Pokračovať?';

  @override
  String get syncPlayJoin => 'Pripojte sa';

  @override
  String get syncPlayStateIdle => 'Nečinný';

  @override
  String get syncPlayStateWaiting => 'Čakanie';

  @override
  String get syncPlayStatePaused => 'Pozastavené';

  @override
  String get syncPlayStatePlaying => 'Prehrávanie';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle =>
      'Prístup k službe SyncPlay bol odmietnutý';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nemáte prístup k jednej alebo viacerým položkám v tejto skupine SyncPlay. Požiadajte vlastníka skupiny, aby overil povolenia knižnice alebo si vybral iné poradie.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable =>
      'Hlasové vyhľadávanie nie je k dispozícii.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Priame prehrávanie Dolby Vision zlyhalo';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Pri tomto streame Dolby Vision sa nepodarilo spustiť priame prehrávanie. Skúsiť znova pomocou prekódovania servera?';

  @override
  String get retryWithTranscode => 'Skúste to znova s ​​prekódovaním';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision nie je podporované';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Toto zariadenie nedokáže priamo dekódovať obsah Dolby Vision. Použite záložný kód HDR10 alebo požiadajte o prekódovanie servera.';

  @override
  String get rememberMyChoice => 'Zapamätaj si moju voľbu';

  @override
  String get playHdr10Fallback => 'Prehrajte si záložnú verziu HDR10';

  @override
  String get requestTranscode => 'Vyžiadať prekódovanie';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Zistiť riadky odhalené zásuvným modulom „Sekcie domovskej obrazovky“ IAmParadox27. Nižšie je možné povoliť a zmeniť poradie riadkov.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Doplnok zatiaľ nenahlásili žiadne servery Jellyfin.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Zistiť riadky nakonfigurované prostredníctvom doplnku „KefinTweaks“ ranaldsgift. Vlastné sekcie, nedávno vydané, pozerané znova, sezónne a nedávno pridané do knižnice, sa zrkadlia z konfigurácie KefinTweaks na každom serveri Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Zatiaľ žiadne servery Jellyfin nehlásia KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Otvorte sekcie Domov';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Povoliť, zakázať a zmeniť poradie riadkov';

  @override
  String get integrationInstalledButDisabled => 'Nainštalované, ale vypnuté';

  @override
  String get integrationNotInstalled => 'Nie je nainštalované';

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
  String get seeAll => 'Zobraziť všetko';

  @override
  String get noItems => 'Žiadne položky';

  @override
  String get switchUser => 'Prepnúť používateľa';

  @override
  String get remoteControl => 'Diaľkové ovládanie';

  @override
  String get mediaBarLoading => 'Načítava sa panel médií...';

  @override
  String get mediaBarError => 'Panel médií sa nepodarilo načítať';

  @override
  String get offlineServerUnavailable =>
      'Pripojené k internetu, ale aktuálny server je nedostupný.';

  @override
  String get offlineNoInternet =>
      'Ste offline. K dispozícii je iba stiahnutý obsah.';

  @override
  String get offlineFileNotAvailable => 'Súbor nie je k dispozícii';

  @override
  String get offlineSwitchServer => 'Prepnúť server';

  @override
  String get offlineSavedMedia => 'Uložené médiá';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Prehrávanie na diaľku';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Hlasitosť zariadenia';

  @override
  String get castVolumeUnavailable => 'nedostupné';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Zvuk';

  @override
  String get subtitlesLabel => 'titulky';

  @override
  String get pinConfirmTitle => 'Potvrďte PIN';

  @override
  String get pinSetTitle => 'Nastavte PIN';

  @override
  String get pinEnterTitle => 'Zadajte PIN';

  @override
  String get pinReenterToConfirm => 'Znova zadajte svoj PIN na potvrdenie';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Nesprávny PIN';

  @override
  String get pinMismatch => 'Kódy PIN sa nezhodujú';

  @override
  String get pinForgot => 'Zabudli ste PIN?';

  @override
  String get pinClear => 'Jasné';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Žiadosť o rýchle pripojenie bola schválená.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kód rýchleho pripojenia je neplatný alebo jeho platnosť vypršala.';

  @override
  String get quickConnectNotSupported =>
      'Rýchle pripojenie nie je na tomto serveri podporované.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Nepodarilo sa autorizovať kód Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Rýchle pripojenie je na tomto serveri zakázané.';

  @override
  String get quickConnectForbidden =>
      'Váš účet nemôže autorizovať túto žiadosť o rýchle pripojenie.';

  @override
  String get quickConnectNotFound =>
      'Kód rýchleho pripojenia sa nenašiel. Skúste nový kód.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Zadajte kód';

  @override
  String get quickConnectAuthorize => 'Autorizovať';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Diaľkové ovládanie';

  @override
  String get remoteFailedToLoadSessions => 'Nepodarilo sa načítať relácie';

  @override
  String get remoteNoSessions => 'Žiadne kontrolovateľné relácie';

  @override
  String get remoteStartPlayback => 'Spustite prehrávanie na inom zariadení';

  @override
  String get unknownUser => 'Neznámy';

  @override
  String get unknownItem => 'Neznámy';

  @override
  String get remoteNothingPlaying => 'V tejto relácii sa nič nehrá';

  @override
  String get castingStarted => 'Prenášanie sa začalo na vybranom zariadení';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nie sú k dispozícii žiadne zariadenia na vzdialené prehrávanie.';

  @override
  String get noRemoteDevicesIos =>
      'Nie sú k dispozícii žiadne zariadenia na vzdialené prehrávanie.\n\nV systéme iOS môžu byť ciele AirPlay v simulátore nedostupné.';

  @override
  String get trackActionPlayNext => 'Play Next';

  @override
  String get trackActionAddToQueue => 'Pridať do poradia';

  @override
  String get trackActionAddToPlaylist => 'Pridať do zoznamu skladieb';

  @override
  String get trackActionCancelDownload => 'Zrušiť sťahovanie';

  @override
  String get trackActionDeleteFromPlaylist => 'Odstrániť zo zoznamu skladieb';

  @override
  String get trackActionMoveUp => 'Move Up';

  @override
  String get trackActionMoveDown => 'Posunúť nadol';

  @override
  String get trackActionRemoveFromFavorites => 'Odstrániť z obľúbených';

  @override
  String get trackActionAddToFavorites => 'Pridať k obľúbeným';

  @override
  String get trackActionGoToAlbum => 'Prejdite do albumu';

  @override
  String get trackActionGoToArtist => 'Prejdite na položku Umelec';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Stiahnutý súbor bol odstránený';

  @override
  String get trackActionDeleteFileFailed =>
      'Nepodarilo sa odstrániť stiahnutý súbor';

  @override
  String get shuffleBy => 'Shuffle By';

  @override
  String get shuffleSelectLibrary => 'Vyberte možnosť Knižnica';

  @override
  String get shuffleSelectGenre => 'Vyberte položku Žáner';

  @override
  String get shuffleLibrary => 'Knižnica';

  @override
  String get shuffleGenre => 'Žáner';

  @override
  String get shuffleNoLibraries =>
      'Nie sú k dispozícii žiadne kompatibilné knižnice.';

  @override
  String get shuffleNoGenres =>
      'Pre tento režim náhodného výberu sa nenašli žiadne žánre.';

  @override
  String get posterDisplayTitle => 'Displej';

  @override
  String get posterImageType => 'Typ obrázka';

  @override
  String get imageTypePoster => 'plagát';

  @override
  String get imageTypeThumbnail => 'Miniatúra';

  @override
  String get imageTypeBanner => 'Banner';

  @override
  String get playlistAddFailed => 'Pridanie do zoznamu videí zlyhalo';

  @override
  String get playlistCreateFailed => 'Nepodarilo sa vytvoriť zoznam skladieb';

  @override
  String get playlistNew => 'Nový zoznam skladieb';

  @override
  String get playlistCreate => 'Vytvorte';

  @override
  String get playlistCreateNew => 'Vytvoriť nový zoznam skladieb';

  @override
  String get playlistNoneFound => 'Nenašli sa žiadne zoznamy skladieb';

  @override
  String get addToPlaylist => 'Pridať do zoznamu skladieb';

  @override
  String get lyricsNotAvailable => 'Nie sú k dispozícii žiadne texty';

  @override
  String get upNext => 'Ďalej';

  @override
  String get playNext => 'Play Next';

  @override
  String get stillWatchingContent =>
      'Prehrávanie bolo pozastavené. ešte stále pozeráš?';

  @override
  String get stillWatchingStop => 'Stop';

  @override
  String get stillWatchingContinue => 'Pokračovať';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Živá televízia';

  @override
  String get continueWatchingAndNextUp => 'Pokračovať v sledovaní a ďalej';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Ďalšia epizóda';

  @override
  String get moreFromThisSeason => 'Viac z tejto sezóny';

  @override
  String get playerTooltipPlaybackSpeed => 'Rýchlosť prehrávania';

  @override
  String get playerTooltipCastControls => 'Ovládacie prvky Cast';

  @override
  String get playerTooltipPlaybackQuality => 'Bitová rýchlosť';

  @override
  String get playerTooltipEnterFullscreen => 'Vstúpiť na celú obrazovku';

  @override
  String get playerTooltipExitFullscreen => 'Ukončiť celú obrazovku';

  @override
  String get playerTooltipFloatOnTop => 'Plávať na vrchu';

  @override
  String get playerTooltipExitFloatOnTop => 'Zakázať plavák na vrchu';

  @override
  String get playerTooltipLockLandscape => 'Uzamknúť krajinu';

  @override
  String get playerTooltipUnlockOrientation => 'Povoliť otáčanie';

  @override
  String get playerTooltipPrevious => 'Predchádzajúce';

  @override
  String get playerTooltipSeekBack => 'Hľadajte späť';

  @override
  String get playerTooltipSeekForward => 'Hľadajte dopredu';

  @override
  String get contextMenuMarkWatched => 'Označiť ako sledované';

  @override
  String get contextMenuMarkUnwatched => 'Označiť ako nepozerané';

  @override
  String get contextMenuAddToFavorites => 'Pridať k obľúbeným';

  @override
  String get contextMenuRemoveFromFavorites => 'Odstrániť z obľúbených';

  @override
  String get contextMenuGoToSeries => 'Prejdite na Séria';

  @override
  String get settingsAdministrationSubtitle =>
      'Prejdite na panel správy servera';

  @override
  String get settingsAccountSecurity => 'Účet a bezpečnosť';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentifikácia, PIN kód a rodičovská kontrola';

  @override
  String get settingsPersonalization => 'Personalizácia';

  @override
  String get settingsPersonalizationSubtitle =>
      'Téma, navigácia, domovské riadky a viditeľnosť knižnice';

  @override
  String get settingsDynamicContent => 'Dynamický obsah';

  @override
  String get settingsDynamicContentSubtitle =>
      'Panel médií a vizuálne prekrytia';

  @override
  String get settingsPlaybackSyncplay => 'Prehrávanie a SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Nastavenia zvuku/videa, titulky, sťahovanie a ovládacie prvky SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Synchronizácia doplnku, Seerr, hodnotenia a ďalšie';

  @override
  String get settingsAboutSubtitle =>
      'Verzia aplikácie, právne informácie a kredity';

  @override
  String get settingsAuthenticationSection => 'AUTENTIKÁCIA';

  @override
  String get settingsSortServersBy => 'Zoradiť servery podľa';

  @override
  String get settingsLastUsed => 'Naposledy použité';

  @override
  String get settingsAlphabetical => 'Abecedne';

  @override
  String get settingsPrivacyAndSafetySection => 'SÚKROMIE A BEZPEČNOSŤ';

  @override
  String get settingsBlockedRatings => 'Blokované hodnotenia';

  @override
  String get settingsGeneralStyle => 'Všeobecný štýl';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Akcenty tém, pozadia, ukazovatele sledovanosti a hudba tém';

  @override
  String get settingsHomePage => 'Domovská stránka';

  @override
  String get settingsHomePageSubtitle =>
      'Sekcie, typy obrázkov, prekrytia a ukážky médií';

  @override
  String get settingsLibrariesSubtitle =>
      'Viditeľnosť knižnice, zobrazenie priečinkov a správanie na viacerých serveroch';

  @override
  String get settingsTwentyFourHourClock => '24-hodinové hodiny';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Používajte 24-hodinové formátovanie času všade tam, kde sú zobrazené hodiny';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Zobrazte tlačidlo náhodného výberu na navigačnom paneli';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Zobraziť tlačidlo žánrov na navigačnom paneli';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Zobraziť tlačidlo obľúbených na navigačnom paneli';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Zobraziť tlačidlo knižnice na navigačnom paneli';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Prepnúť viditeľnosť domovskej stránky podľa knižnice. Reštartujte Moonfin, aby sa zmeny prejavili.';

  @override
  String get settingsMediaBarAndLocalPreviews => 'Panel médií a miestne ukážky';

  @override
  String get settingsVisualOverlays => 'Vizuálne prekrytia';

  @override
  String get settingsSeasonalSurprise => 'Sezónne prekvapenie';

  @override
  String get settingsMetadataAndRatings => 'Metadáta a hodnotenia';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase poháňa integrácie na strane servera vrátane dodatočných zdrojov hodnotenia, požiadaviek Seerr a synchronizovaných preferencií.';

  @override
  String get settingsOfflineDownloads => 'Sťahovanie offline';

  @override
  String get settingsHigh => 'Vysoká';

  @override
  String get settingsLow => 'Nízka';

  @override
  String get settingsCustomPath => 'Vlastná cesta';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Zadajte cestu k priečinku na stiahnutie';

  @override
  String get settingsConcurrentDownloads => 'Súbežné sťahovanie';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maximálny počet položiek na stiahnutie naraz.';

  @override
  String get settingsAppInfo => 'INFO O APLIKÁCII';

  @override
  String get settingsReportAnIssue => 'Nahlásiť problém';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Otvorte nástroj na sledovanie problémov na GitHub';

  @override
  String get settingsJoinDiscord => 'Pripojte sa k Discordu';

  @override
  String get settingsJoinDiscordSubtitle => 'Chatujte s komunitou';

  @override
  String get settingsJoinTheDiscord => 'Pripojte sa k Discordu';

  @override
  String get settingsSupportMoonfin => 'Podporte Moonfina';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Spustite projekt na GitHub alebo prispejte';

  @override
  String get settingsLegal => 'PRÁVNE';

  @override
  String get settingsLicenses => 'Licencie';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Oznámenia o licencii s otvoreným zdrojom';

  @override
  String get settingsPrivacyPolicy => 'Zásady ochrany osobných údajov';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Ako Moonfin narába s vašimi údajmi';

  @override
  String get settingsCheckForUpdates => 'Skontrolujte aktualizácie';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Pozrite si najnovšie vydanie Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Beží na Flutter';

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
  String get settingsBoth => 'Obaja';

  @override
  String get settingsShuffleContentTypeFilter => 'Premiešať filter typu obsahu';

  @override
  String get settingsVideoPlaybackPreferences => 'Predvoľby prehrávania videa';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Základné video engine a nastavenia kvality streamovania';

  @override
  String get settingsAudioPreferences => 'Predvoľby zvuku';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Zvukové stopy, možnosti spracovania a prechodu';

  @override
  String get settingsAutomationAndQueue => 'Automatizácia a fronty';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatické prehrávanie a sekvenovanie';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Kvalita sťahovania, limity úložiska a veľkosť frontu';

  @override
  String get settingsSyncplaySubtitle =>
      'Logika synchronizácie pre skupinové relácie';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Špecializované funkcie prehrávača. Používajte opatrne, pretože niektoré možnosti môžu spôsobiť problémy s prehrávaním';

  @override
  String get settingsSkipIntrosAndOutros => 'Preskočiť úvody a závery?';

  @override
  String get settingsPromptUser => 'Vyzvať používateľa';

  @override
  String get settingsSkip => 'Preskočiť';

  @override
  String get settingsDoNothing => 'Nerobte nič';

  @override
  String get settingsMaxBitrateDescription =>
      'Obmedzte bitovú rýchlosť streamovania. Obsah nad touto hranicou bude prekódovaný tak, aby sa zmestil.';

  @override
  String get settingsMaxResolutionDescription =>
      'Obmedzte maximálne rozlíšenie, ktoré bude prehrávač požadovať. Obsah vo vyššom rozlíšení bude prekódovaný.';

  @override
  String get settingsPlayerZoomDescription =>
      'Ako by sa malo video upraviť, aby sa zmestilo na obrazovku.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Vyberte predvolený mechanizmus prehrávania na zariadeniach Android TV. Zmeny sa aplikujú na nasledujúcu reláciu prehrávania.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (odporúčané)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (staršie)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Záložná';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Správanie pre tituly Dolby Vision na zariadeniach bez dekódovania Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Pýtajte sa zakaždým';

  @override
  String get settingsPreferHdr10Fallback =>
      'Uprednostnite záložnú verziu HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Uprednostňujte prekódovanie servera';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Priame prehrávanie Dolby Vision Profile 7';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Určuje, či by streamy vrstvy vylepšenia Dolby Vision profilu 7 mali riadiť prehrávanie.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFTKRT povolené)';

  @override
  String get settingsEnabledOnThisDevice => 'Povolené na tomto zariadení';

  @override
  String get settingsDisabledPreferTranscode =>
      'Zakázané (preferujem prekódovanie)';

  @override
  String get settingsResumeRewindDescription =>
      'Koľko sekúnd by sa malo pretočiť späť pri obnovení prehrávania (zo stránky Pokračovať v pozeraní alebo zo stránky mediálnej položky)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Pri obnovení prehrávania po stlačení tlačidla pauzy, koľko sekúnd by sa malo previnúť späť?';

  @override
  String get settingsSkipBackLengthDescription =>
      'O koľko sekúnd skočiť späť po stlačení tlačidla prevíjania dozadu.';

  @override
  String get settingsOneSecond => '1 sekunda';

  @override
  String get settingsThreeSeconds => '3 sekundy';

  @override
  String get settingsFortyFiveSeconds => '45 sekúnd';

  @override
  String get settingsSixtySeconds => '60 sekúnd';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Koľko sekúnd preskočiť dopredu po stlačení tlačidla rýchleho posunu dopredu.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 do externého dekodéra';

  @override
  String get settingsCinemaMode => 'Režim Kino';

  @override
  String get settingsCinemaModeSubtitle =>
      'Prehrajte si upútavky/prerolly pred hlavnou funkciou';

  @override
  String get settingsNextUpDisplayDescription =>
      'Rozšírené zobrazuje celú kartu s obrázkom epizódy a popisom. Minimal zobrazuje kompaktné prekrytie odpočítavania. Zakázané úplne skryje výzvu.';

  @override
  String get settingsShort => 'Krátke';

  @override
  String get settingsLong => 'Dlhé';

  @override
  String get settingsVeryLong => 'Veľmi dlhé';

  @override
  String get settingsVideoStartDelay => 'Oneskorenie spustenia videa';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Live TV Direct';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Povoliť priame prehrávanie pre živé televízne vysielanie';

  @override
  String get settingsOpenGroups => 'Otvoriť Skupiny';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Vytvárajte, pripájajte sa alebo spravujte skupiny SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay povolené';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Povoliť funkcie skupinového sledovania';

  @override
  String get settingsSyncplayButton => 'Tlačidlo SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Zobrazte tlačidlo SyncPlay na navigačnom paneli';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Pokročilá korekcia';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Povoliť jemnozrnnú logiku synchronizácie';

  @override
  String get settingsSyncplaySyncCorrection => 'Korekcia synchronizácie';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Automaticky upravte prehrávanie, aby zostalo synchronizované';

  @override
  String get settingsSyncplaySpeedToSync => 'Rýchlosť synchronizácie';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Na synchronizáciu použite nastavenie rýchlosti prehrávania';

  @override
  String get settingsSyncplaySkipToSync => 'Preskočiť na synchronizáciu';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Na synchronizáciu použite vyhľadávanie';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Oneskorenie minimálnej rýchlosti';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Oneskorenie maximálnej rýchlosti';

  @override
  String get settingsSyncplaySpeedDuration => 'Rýchlosť Trvanie';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minimálne oneskorenie preskočenia';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Extra posun';

  @override
  String get onNow => 'Teraz';

  @override
  String get collections => 'zbierky';

  @override
  String get lastPlayed => 'Naposledy hrané';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Latest $libraryName';
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
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Home Screen Sections';

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
  String get appearance => 'Appearance';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

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
  String get transcodingLimits => 'Transcoding Limits';
}
