// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Mjesečeva peraja';

  @override
  String get signIn => 'Prijavite se';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Brzo povezivanje';

  @override
  String get password => 'Lozinka';

  @override
  String get username => 'Korisničko ime';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Unesite ovaj kod na web nadzornu ploču vašeg poslužitelja:';

  @override
  String get waitingForAuthorization => 'Čeka se autorizacija...';

  @override
  String get back => 'Nazad';

  @override
  String get serverUnavailable => 'Poslužitelj je nedostupan';

  @override
  String get loginFailed => 'Prijava nije uspjela';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Tko gleda?';

  @override
  String get addUser => 'Dodaj korisnika';

  @override
  String get selectServer => 'Odaberite poslužitelj';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Spremljeni poslužitelji';

  @override
  String get discoveredServers => 'Otkriveni poslužitelji';

  @override
  String get noneFound => 'Nijedan nije pronađen';

  @override
  String get unableToConnectToServer => 'Nije moguće spojiti se na poslužitelj';

  @override
  String get addServer => 'Dodaj poslužitelj';

  @override
  String get embyConnect => 'Emby Povežite se';

  @override
  String get removeServer => 'Ukloni poslužitelj';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Otkazati';

  @override
  String get remove => 'Ukloniti';

  @override
  String get connectToServer => 'Spojite se na poslužitelj';

  @override
  String get serverAddress => 'Adresa poslužitelja';

  @override
  String get serverAddressHint => 'https://vaš-poslužitelj.primjer.com';

  @override
  String get connect => 'Poveži se';

  @override
  String get secureStorageUnavailable => 'Sigurna pohrana nije dostupna';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nije mogao pristupiti privjesku za ključeve vašeg sustava. Prijava se može nastaviti, ali sigurna pohrana tokena može biti nedostupna dok se privjesak za ključeve ne otključa.';

  @override
  String get ok => 'U REDU';

  @override
  String get settingsAppearanceTheme => 'Tema aplikacije';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Prebacite se između Moonfin i Neon Pulse bez ponovnog pokretanja aplikacije';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Mjesečeva peraja';

  @override
  String get themeMoonfinSubtitle =>
      'Trenutačni Moonfin izgled koji ste svi zavoljeli';

  @override
  String get themeNeonPulse => 'Neonski puls';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stil s magenta sjajem, cijan tekstom i jačim kromiranim kontrastom';

  @override
  String get embyConnectSignInSubtitle =>
      'Prijavite se svojim Emby Connect računom';

  @override
  String get emailOrUsername => 'Email ili korisničko ime';

  @override
  String get selectAServer => 'Odaberite poslužitelj';

  @override
  String get tryAgain => 'Pokušajte ponovno';

  @override
  String get noLinkedServers =>
      'Nema poslužitelja povezanih s ovim Emby Connect računom';

  @override
  String get invalidEmbyConnectCredentials =>
      'Nevažeće vjerodajnice za Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Nevažeće korisničko ime ili lozinka za Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Poslužitelj ne podržava Emby Connect razmjenu';

  @override
  String get embyConnectNetworkError =>
      'Mrežna pogreška prilikom kontaktiranja Emby Connecta ili odabranog poslužitelja';

  @override
  String get loadingLinkedServers => 'Učitavanje povezanih poslužitelja...';

  @override
  String get connectingToServerEllipsis => 'Spajanje na poslužitelj...';

  @override
  String get noReachableAddress => 'Nije navedena dostupna adresa';

  @override
  String get invalidServerExchangeResponse =>
      'Nevažeći odgovor krajnje točke razmjene poslužitelja';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Napustiti Moonfin?';

  @override
  String get exitAppConfirmation => 'Jeste li sigurni da želite izaći?';

  @override
  String get exit => 'Izlaz';

  @override
  String get noHomeRowsLoaded => 'Nije moguće učitati nijedan početni redak';

  @override
  String get noHomeRowsHint =>
      'Pokušajte osvježiti ili smanjiti aktivne početne odjeljke.';

  @override
  String get retryHomeRows => 'Ponovo pokušajte s početnim redovima';

  @override
  String get guide => 'Vodič';

  @override
  String get recordings => 'Snimke';

  @override
  String get schedule => 'Raspored';

  @override
  String get series => 'Niz';

  @override
  String get noItemsFound => 'Nema pronađenih stavki';

  @override
  String get home => 'Dom';

  @override
  String get browseAll => 'Pregledaj sve';

  @override
  String get genres => 'Žanrovi';

  @override
  String get collectionPlaceholder => 'Ovdje će se pojaviti stavke zbirke';

  @override
  String get browseByLetter => 'Pregledaj po slovu';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Ovdje će se pojaviti abecedno pretraživanje';

  @override
  String get suggestions => 'Prijedlozi';

  @override
  String get suggestionsPlaceholder => 'Ovdje će se pojaviti predložene stavke';

  @override
  String get failedToLoadLibraries => 'Učitavanje biblioteka nije uspjelo';

  @override
  String get noLibrariesFound => 'Nisu pronađene knjižnice';

  @override
  String get library => 'Knjižnica';

  @override
  String get displaySettings => 'Postavke zaslona';

  @override
  String get allGenres => 'Svi žanrovi';

  @override
  String get noGenresFound => 'Nema pronađenih žanrova';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ova mapa je prazna';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Učitavanje favorita nije uspjelo';

  @override
  String get retry => 'Pokušaj ponovo';

  @override
  String get noFavoritesYet => 'Još nema favorita';

  @override
  String get favorites => 'Favoriti';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Nastavljajući';

  @override
  String get ended => 'Završeno';

  @override
  String get sortAndFilter => 'Poredaj i filtriraj';

  @override
  String get type => 'Tip';

  @override
  String get sortBy => 'Poredaj po';

  @override
  String get display => 'Prikaz';

  @override
  String get imageType => 'Vrsta slike';

  @override
  String get posterSize => 'Veličina postera';

  @override
  String get small => 'Mali';

  @override
  String get medium => 'srednje';

  @override
  String get large => 'velika';

  @override
  String get extraLarge => 'Iznimno velik';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Pogledi';

  @override
  String get albums => 'Albumi';

  @override
  String get albumArtists => 'Izvođači albuma';

  @override
  String get artists => 'Umjetnici';

  @override
  String get bookmarks => 'Knjižne oznake';

  @override
  String get noSavedBookmarks => 'Još nema spremljenih oznaka za ovaj naslov.';

  @override
  String get openBook => 'Otvorena knjiga';

  @override
  String get chapter => 'Poglavlje';

  @override
  String get page => 'Stranica';

  @override
  String get bookmark => 'Knjižna oznaka';

  @override
  String get justNow => 'Upravo sada';

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
  String get discoverySubjects => 'Predmeti otkrića';

  @override
  String get pickDiscoverySubjects =>
      'Odaberite koji će se feedovi tema prikazati u Discoveru.';

  @override
  String get apply => 'primijeniti';

  @override
  String get openLink => 'Otvori vezu';

  @override
  String get scanWithYourPhone => 'Skenirajte svojim telefonom';

  @override
  String get audiobookGenres => 'Žanrovi audio knjiga';

  @override
  String get pickAudiobookGenres =>
      'Odaberite žanrove za prikaz u Discoveru audioknjiga.';

  @override
  String get discoverAudiobooks => 'Otkrijte audio knjige';

  @override
  String get librivoxDescription =>
      'Popularni naslovi javne domene iz LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Pomaknite se lijevo';

  @override
  String get scrollRight => 'Pomaknite se desno';

  @override
  String get couldNotLoadGenre => 'Trenutačno nije moguće učitati ovaj žanr.';

  @override
  String get continueReading => 'Nastavite čitati';

  @override
  String get savedHighlights => 'Spremljene istaknute stavke';

  @override
  String get continueListening => 'Nastavite sa slušanjem';

  @override
  String get listen => 'Slušati';

  @override
  String get resume => 'Nastavi';

  @override
  String get failedToLoadLibrary => 'Učitavanje biblioteke nije uspjelo';

  @override
  String get popularNow => 'Popularno sada';

  @override
  String get savedForLater => 'Sačuvano za kasnije';

  @override
  String get topListens => 'Najbolja slušanja';

  @override
  String get unreadDiscoveries => 'Nepročitana otkrića';

  @override
  String get pickUpAgain => 'Javi se ponovno';

  @override
  String get bookHighlightsDescription =>
      'Vaše knjige s istaknutim točkama, favoritima ili napretkom čitanja.';

  @override
  String get handPickedFromLibrary => 'Ručno odabrano iz vaše knjižnice.';

  @override
  String get handPickedFromListeningQueue =>
      'Ručno odabrano iz vašeg reda slušanja.';

  @override
  String get booksWithHighlights =>
      'Knjige s istaknutim točkama, favoritima ili napretkom čitanja.';

  @override
  String get jumpBackNarration =>
      'Vratite se u naraciju bez traženja svog mjesta.';

  @override
  String get unreadBooksReady =>
      'Nepročitane knjige spremne za sljedeći mirni sat.';

  @override
  String get quickAccessFavorites =>
      'Brzi pristup knjigama kojima se stalno vraćate.';

  @override
  String get searchAudiobooks => 'Pretraživanje audioknjiga';

  @override
  String get searchYourLibrary => 'Pretražite svoju knjižnicu';

  @override
  String get pickUpStory => 'Nastavite priču tamo gdje ste stali';

  @override
  String get savedPlacesChapters =>
      'Vaša spremljena mjesta i nedovršena poglavlja';

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
  String get readyWhenYouAre => 'Spreman kad i ti';

  @override
  String get details => 'pojedinosti';

  @override
  String get listeningRoom => 'Slušaonica';

  @override
  String get bookmarksAndProgress => 'Oznake i napredak';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Naslovi';

  @override
  String get allTitles => 'Svi naslovi';

  @override
  String get authors => 'Autori';

  @override
  String get browseByAuthor => 'Pregledaj po autoru';

  @override
  String get browseByGenre => 'Pregledaj po žanru';

  @override
  String get discover => 'Otkriti';

  @override
  String get trendingTitlesOpenLibrary =>
      'Naslovi u trendu po predmetu iz Open Library.';

  @override
  String get noBookmarkedItems => 'Još nema označenih stavki';

  @override
  String get nothingMatchesSection =>
      'Još ništa ne odgovara ovom odjeljku. Pokušajte s drugom karticom ili se vratite nakon završetka sinkronizacije knjižnice.';

  @override
  String get audiobooks => 'audio knjige';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Mapa';

  @override
  String get filters => 'Filteri';

  @override
  String get readingStatus => 'Status čitanja';

  @override
  String get playedStatus => 'Igrano stanje';

  @override
  String get readStatus => 'čitati';

  @override
  String get watched => 'Gledao';

  @override
  String get unread => 'Nepročitano';

  @override
  String get unwatched => 'Negledan';

  @override
  String get seriesStatus => 'Status serije';

  @override
  String get allLibraries => 'Sve knjižnice';

  @override
  String get books => 'knjige';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Nepoznati autor';

  @override
  String get uncategorized => 'Nekategorizirano';

  @override
  String get overview => 'Pregled';

  @override
  String get noLibrivoxDescription => 'LibriVox još nema opisa za ovaj naslov.';

  @override
  String get readers => 'Čitatelji';

  @override
  String get openLinks => 'Otvori veze';

  @override
  String get librivoxPage => 'LibriVox Stranica';

  @override
  String get internetArchive => 'Internetska arhiva';

  @override
  String get rssFeed => 'RSS feed';

  @override
  String get downloadZip => 'Preuzmite Zip';

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
      'Za ovaj naslov još nema dostupnog pregleda iz Open Library.';

  @override
  String get subjects => 'Predmeti';

  @override
  String get all => 'Sve';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Trenutačno ne mogu učitati ovu temu.';

  @override
  String get audiobookDetails => 'Pojedinosti o audioknjigi';

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
  String get trackList => 'Popis pjesama';

  @override
  String get itemListPlaceholder => 'Ovdje će se pojaviti popis stavki';

  @override
  String get favoriteTracksPlaceholder =>
      'Ovdje će se pojaviti omiljene pjesme';

  @override
  String get failedToLoad => 'Učitavanje nije uspjelo';

  @override
  String get delete => 'Izbrisati';

  @override
  String get save => 'Uštedjeti';

  @override
  String get moreLikeThis => 'Više poput ovoga';

  @override
  String get castAndCrew => 'Glumci i ekipa';

  @override
  String get collection => 'Kolekcija';

  @override
  String get episodes => 'Epizode';

  @override
  String get nextUp => 'Sljedeći';

  @override
  String get seasons => 'Godišnja doba';

  @override
  String get chapters => 'poglavlja';

  @override
  String get features => 'Značajke';

  @override
  String get movies => 'Filmovi';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'ostalo';

  @override
  String get discography => 'Diskografija';

  @override
  String get similarArtists => 'Slični umjetnici';

  @override
  String get tableOfContents => 'Sadržaj';

  @override
  String get tracklist => 'Popis pjesama';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biografija';

  @override
  String get authorDetails => 'Podaci o autoru';

  @override
  String get noOverviewAvailable =>
      'Još nema dostupnog pregleda za ovaj naslov.';

  @override
  String get noBiographyAvailable => 'Nema dostupne biografije ovog autora.';

  @override
  String get noBooksFound => 'Nema pronađenih knjiga za ovog autora.';

  @override
  String get unableToLoadAuthorDetails =>
      'Trenutačno nije moguće učitati podatke o autoru.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Datum objave nepoznat';

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
  String get view => 'Pogled';

  @override
  String get resumeReading => 'Nastavite s čitanjem';

  @override
  String get read => 'čitati';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Igrati';

  @override
  String get startOver => 'Počni ispočetka';

  @override
  String get restart => 'Ponovno pokretanje';

  @override
  String get readOffline => 'Čitajte izvan mreže';

  @override
  String get playOffline => 'Igrajte izvan mreže';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'titlovi';

  @override
  String get version => 'Verzija';

  @override
  String get cast => 'Cast';

  @override
  String get trailer => 'Prikolica';

  @override
  String get finished => 'Gotovo';

  @override
  String get favorited => 'Omiljeno';

  @override
  String get favorite => 'omiljena';

  @override
  String get playlist => 'Popis pjesama';

  @override
  String get downloaded => 'Preuzeto';

  @override
  String get downloadAll => 'Preuzmi sve';

  @override
  String get download => 'preuzimanje';

  @override
  String get deleteDownloaded => 'Izbriši preuzeto';

  @override
  String get goToSeries => 'Idite na Serije';

  @override
  String get editMetadata => 'Uredi metapodatke';

  @override
  String get less => 'Manje';

  @override
  String get more => 'Više';

  @override
  String get deleteItem => 'Izbriši stavku';

  @override
  String get deletePlaylist => 'Izbriši popis za reprodukciju';

  @override
  String get deletePlaylistMessage =>
      'Izbrisati ovaj popis za reprodukciju s poslužitelja?';

  @override
  String get deleteItemMessage => 'Izbrisati ovu stavku s poslužitelja?';

  @override
  String get failedToDeletePlaylist =>
      'Brisanje popisa za reprodukciju nije uspjelo';

  @override
  String get failedToDeleteItem => 'Brisanje stavke nije uspjelo';

  @override
  String get renamePlaylist => 'Preimenuj popis pjesama';

  @override
  String get playlistName => 'Naziv popisa za reprodukciju';

  @override
  String get deleteDownloadedAlbum => 'Izbriši preuzeti album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Preuzete pjesme izbrisane';

  @override
  String get downloadedTracksDeleteFailed =>
      'Neke preuzete pjesme nije bilo moguće izbrisati';

  @override
  String get noTracksLoaded => 'Nisu učitane staze';

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
  String get itemDeleted => 'Stavka izbrisana';

  @override
  String get noPlayableTrailerFound => 'Nije pronađena najava za reprodukciju.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Audio zapis';

  @override
  String get subtitleTrack => 'Zapis titlova';

  @override
  String get none => 'Nijedan';

  @override
  String get downloadSubtitlesLabel => 'Preuzmi titlove...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Pretražujte pomoću dodatka OpenSubtitles';

  @override
  String get downloadSubtitles => 'Preuzmite titlove';

  @override
  String get selectedSubtitleInvalid => 'Odabrani podnaslov je nevažeći.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Podnaslov je preuzet. Može proći neko vrijeme da se pojavi dok Jellyfin ne osvježi stavku.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Odaberite verziju';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Preuzmite sve — kvaliteta';

  @override
  String get downloadQuality => 'Kvaliteta preuzimanja';

  @override
  String get originalFileNoReencoding =>
      'Izvorna datoteka, bez ponovnog kodiranja';

  @override
  String get originalFilesNoReencoding =>
      'Izvorne datoteke, bez ponovnog kodiranja';

  @override
  String get noEpisodesLoaded => 'Nema učitanih epizoda';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Brisanje preuzetih datoteka';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Preuzete datoteke izbrisane';

  @override
  String get failedToDeleteFiles => 'Brisanje datoteka nije uspjelo';

  @override
  String get deleteFiles => 'Brisanje datoteka';

  @override
  String get director => 'DIREKTOR';

  @override
  String get writers => 'KNJIŽEVNICI';

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
  String get showLess => 'Prikaži manje';

  @override
  String get readMore => 'Pročitajte više';

  @override
  String get shuffle => 'Promiješaj';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Savršen spoj';

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
  String get deleteSeasonFiles => 'sve preuzete epizode u ovoj sezoni';

  @override
  String get stillWatching => 'Još uvijek gledate?';

  @override
  String get unableToLoadTrailerStream => 'Nije moguće učitati stream najave.';

  @override
  String get trailerTimedOut => 'Najava je istekla tijekom učitavanja.';

  @override
  String get playbackFailedForTrailer =>
      'Reprodukcija ove najave nije uspjela.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Emitiranje nije dostupno tijekom izvanmrežne reprodukcije.';

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
  String get deviceVolume => 'Glasnoća uređaja';

  @override
  String get unavailable => 'Nedostupan';

  @override
  String get pause => 'Pauza';

  @override
  String get syncPosition => 'Položaj sinkronizacije';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Red čekanja je prazan';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Remote Playback';

  @override
  String get castingToGoogleCast => 'Emitiranje na Google Cast';

  @override
  String get castingViaAirPlay => 'Emitiranje putem AirPlay';

  @override
  String get castingViaDlna => 'Emitiranje putem DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Dugo pritisnite za otključavanje';

  @override
  String get off => 'Isključeno';

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
  String get bitrateOverride => 'Nadjačavanje brzine prijenosa';

  @override
  String get audioDelay => 'Kašnjenje zvuka';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Odgoda titla';

  @override
  String get reset => 'Resetiraj';

  @override
  String get unknown => 'Nepoznato';

  @override
  String get playbackInformation => 'Informacije o reprodukciji';

  @override
  String get playback => 'Reprodukcija';

  @override
  String get playMethod => 'Metoda igranja';

  @override
  String get directPlay => 'Izravna igra';

  @override
  String get directStream => 'Izravni tok';

  @override
  String get transcoding => 'Transkodiranje';

  @override
  String get transcodeReasons => 'Razlozi transkodiranja';

  @override
  String get player => 'Igrač';

  @override
  String get container => 'Kontejner';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Rezolucija';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'kodek';

  @override
  String get videoBitrate => 'Brzina prijenosa videozapisa';

  @override
  String get track => 'Staza';

  @override
  String get channels => 'Kanali';

  @override
  String get audioBitrate => 'Brzina prijenosa zvuka';

  @override
  String get sampleRate => 'Brzina uzorkovanja';

  @override
  String get format => 'Format';

  @override
  String get external => 'Vanjski';

  @override
  String get embedded => 'Ugrađen';

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
      'EPUB renderiranje u aplikaciji još nije dostupno na ovoj platformi.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Ugrađeno iscrtavanje dokumenata nije dostupno na ovoj platformi.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nije moguće otvoriti vanjski preglednik.';

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
      'Još nema oznaka.\nDodirnite ikonu oznake dok čitate da biste spremili svoju poziciju.';

  @override
  String get noTableOfContentsAvailable => 'Nema dostupnog sadržaja';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Položaj';

  @override
  String get bookReader => 'Čitač knjiga';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Ažuriranje...';

  @override
  String get markUnread => 'Označi kao nepročitano';

  @override
  String get markAsRead => 'Označi kao pročitano';

  @override
  String get reloadReader => 'Ponovno učitaj čitač';

  @override
  String get noPagesFound => 'Nema pronađenih stranica.';

  @override
  String get failedToDecodePageImage =>
      'Dekodiranje slike stranice nije uspjelo.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Jedna stranica';

  @override
  String get twoPageSpread => 'Spread na dvije stranice';

  @override
  String get addBookmark => 'Dodaj oznaku';

  @override
  String get bookmarksEllipsis => 'Oznake...';

  @override
  String get markedAsRead => 'Označeno kao pročitano';

  @override
  String get markedAsUnread => 'Označeno kao nepročitano';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Tema: Sustav';

  @override
  String get themeLight => 'Tema: Svjetlo';

  @override
  String get themeDark => 'Tema: tamno';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Invertiraj boje (fiksni izgled)';

  @override
  String get invertColorsPdf => 'Invertiraj boje (PDF)';

  @override
  String get preparingInAppReader => 'Priprema čitača unutar aplikacije...';

  @override
  String get pdfDataNotAvailable => 'PDF podaci nisu dostupni.';

  @override
  String get readerFallbackModeActive => 'Aktivan rezervni način čitača';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Upotrijebite Reload Reader nakon prebacivanja na podržanu ciljnu platformu (Android, iOS, macOS).';

  @override
  String get openExternally => 'Otvoreno izvana';

  @override
  String get noEpubChaptersFound => 'Nema pronađenih EPUB poglavlja.';

  @override
  String get readerNotReady => 'Čitatelj nije spreman.';

  @override
  String get seriesRecordings => 'Snimke serije';

  @override
  String get now => 'Sada';

  @override
  String get sports => 'Sportski';

  @override
  String get news => 'Vijesti';

  @override
  String get kids => 'djeca';

  @override
  String get premiere => 'Premijera';

  @override
  String get guideTimeline => 'Vremenska crta vodiča';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Nema pronađenih kanala';

  @override
  String get liveBadge => 'ŽIVJETI';

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Uklonjeno s omiljenih kanala';

  @override
  String get addedToFavoriteChannels => 'Dodano omiljenim kanalima';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Ažuriranje omiljenog kanala nije uspjelo';

  @override
  String get unfavoriteChannel => 'Neomiljeni kanal';

  @override
  String get favoriteChannel => 'Omiljeni kanal';

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
  String get watch => 'Gledati';

  @override
  String get close => 'Zatvoriti';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Učitavanje snimaka nije uspjelo';

  @override
  String get scheduledInNext24Hours => 'Zakazano za sljedeća 24 sata';

  @override
  String get recentRecordings => 'Nedavne snimke';

  @override
  String get tvSeries => 'TV serija';

  @override
  String get failedToLoadSchedule => 'Učitavanje rasporeda nije uspjelo';

  @override
  String get noScheduledRecordings => 'Nema zakazanih snimanja';

  @override
  String get cancelRecording => 'Otkazati snimanje?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Ne';

  @override
  String get yesCancel => 'Da, odustani';

  @override
  String get failedToCancelRecording => 'Otkazivanje snimanja nije uspjelo';

  @override
  String get failedToLoadSeriesRecordings =>
      'Učitavanje snimaka serije nije uspjelo';

  @override
  String get noSeriesRecordings => 'Nema snimanja serije';

  @override
  String get cancelSeriesRecording => 'Otkaži snimanje serije';

  @override
  String get cancelSeriesRecordingQuestion => 'Otkazati snimanje serije?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Otkazivanje snimanja serije nije uspjelo';

  @override
  String get searchThisLibrary => 'Pretraži ovu knjižnicu...';

  @override
  String get searchEllipsis => 'Pretraživanje...';

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
  String get savedMedia => 'Spremljeni mediji';

  @override
  String get tvShows => 'TV emisije';

  @override
  String get music => 'Glazba';

  @override
  String get musicAlbums => 'Glazbeni albumi';

  @override
  String get noMediaInFilter => 'Nema medija u ovom filtru';

  @override
  String get noDownloadedMediaYet => 'Još nema preuzetih medija';

  @override
  String get browseLibrary => 'Pregledajte biblioteku';

  @override
  String get deleteDownload => 'Izbriši preuzimanje';

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
  String get playAlbum => 'Reproduciraj album';

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
  String get errorLoadingEpisodes => 'Pogreška pri učitavanju epizoda';

  @override
  String get noDownloadedEpisodes => 'Nema preuzetih epizoda';

  @override
  String get deleteEpisode => 'Izbriši epizodu';

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
  String get seriesNotFound => 'Serija nije pronađena';

  @override
  String get errorLoadingSeries => 'Pogreška pri učitavanju serije';

  @override
  String get downloadedEpisodes => 'Preuzete epizode';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Posebne ponude';

  @override
  String get deleteSeason => 'Izbriši sezonu';

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
  String get storageManagement => 'Upravljanje pohranom';

  @override
  String get storageBreakdown => 'Raspad pohrane';

  @override
  String get downloadedItems => 'Preuzete stavke';

  @override
  String get storageLimit => 'Ograničenje pohrane';

  @override
  String get noLimit => 'Bez ograničenja';

  @override
  String get deleteAllDownloads => 'Izbriši sva preuzimanja';

  @override
  String get deleteAllDownloadsWarning =>
      'Ovo će ukloniti sve preuzete medijske datoteke i ne može se poništiti.';

  @override
  String get deleteAll => 'Obriši sve';

  @override
  String get deleteSelected => 'Izbriši odabrano';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Glazba i audio knjige';

  @override
  String get images => 'Slike';

  @override
  String get database => 'Baza podataka';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'postavke';

  @override
  String get authentication => 'Autentifikacija';

  @override
  String get autoLoginServerManagement =>
      'Automatska prijava, upravljanje poslužiteljem';

  @override
  String get pinCode => 'PIN kod';

  @override
  String get setUpPinCodeProtection => 'Postavite zaštitu PIN kodom';

  @override
  String get parentalControls => 'Roditeljski nadzor';

  @override
  String get contentRatingRestrictions => 'Ograničenja ocjenjivanja sadržaja';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, rezolucija, ponašanje';

  @override
  String get languageSizeAppearance => 'Jezik, veličina, izgled';

  @override
  String get qualityStorage => 'Kvaliteta, skladištenje';

  @override
  String get serverSyncAndPluginStatus =>
      'Sinkronizacija poslužitelja i status dodatka';

  @override
  String get mediaRequestIntegration => 'Integracija medijskih zahtjeva';

  @override
  String get switchServer => 'Promjena poslužitelja';

  @override
  String get signOut => 'Odjavi se';

  @override
  String get versionLicenses => 'Verzija, licence';

  @override
  String get account => 'Račun';

  @override
  String get signInAndSecurity => 'Prijava i sigurnost';

  @override
  String get administration => 'administracija';

  @override
  String get serverSettingsUsersLibraries =>
      'Postavke poslužitelja, korisnici, biblioteke';

  @override
  String get customization => 'Prilagodba';

  @override
  String get themeAndLayout => 'Tema i izgled';

  @override
  String get videoAndSubtitles => 'Video i titlovi';

  @override
  String get integrations => 'Integracije';

  @override
  String get pluginAndRequests => 'Dodatak i zahtjevi';

  @override
  String get customizeAccountPlaybackInterface =>
      'Prilagodite račun, reprodukciju i ponašanje sučelja';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Tema i izgled';

  @override
  String get focusBorderColor => 'Boja obruba fokusa';

  @override
  String get watchedIndicators => 'Gledani indikatori';

  @override
  String get always => 'Uvijek';

  @override
  String get hideUnwatched => 'Sakrij negledano';

  @override
  String get episodesOnly => 'Samo epizode';

  @override
  String get never => 'Nikada';

  @override
  String get focusExpansionAnimation => 'Animacija proširenja fokusa';

  @override
  String get desktopUiScale => 'Mjerilo korisničkog sučelja stolnog računala';

  @override
  String get scaleFocusedCards =>
      'Skalirajte fokusirane ili lebdeće kartice i pločice';

  @override
  String get backgroundBackdrops => 'Pozadinske pozadine';

  @override
  String get showBackdropImages => 'Prikaži slike pozadine iza sadržaja';

  @override
  String get seriesThumbnails => 'Sličice serije';

  @override
  String get seriesThumbnailsDescription =>
      'Samo epizode: koristite sliku serije koja odgovara vrsti slike svakog retka';

  @override
  String get homeRowInfoOverlay => 'Prekrivanje informacija o početnom redu';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Prikaži naslov i metapodatke prilikom pregledavanja početnih redaka';

  @override
  String get clockDisplay => 'Prikaz sata';

  @override
  String get inMenus => 'U izbornicima';

  @override
  String get inVideo => 'U videu';

  @override
  String get seasonalEffects => 'Sezonski učinci';

  @override
  String get seasonalEffectsDescription => 'Vizualni efekti i sezonski ukrasi';

  @override
  String get snow => 'Snijeg';

  @override
  String get fireworks => 'Vatromet';

  @override
  String get confetti => 'Konfete';

  @override
  String get fallingLeaves => 'Padajuće lišće';

  @override
  String get themeMusic => 'Tematska glazba';

  @override
  String get playThemeMusicOnDetailPages =>
      'Pustite tematsku glazbu na stranicama s detaljima';

  @override
  String get themeMusicVolume => 'Glasnoća tematske glazbe';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Glazbena tema na Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Igrajte dok pregledavate početni zaslon';

  @override
  String get detailsBackgroundBlur => 'Zamućenje pozadine detalja';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Pregledavanje zamućenja pozadine';

  @override
  String get maxStreamingBitrate => 'Maksimalna brzina prijenosa';

  @override
  String get maxResolution => 'Maksimalna razlučivost';

  @override
  String get playerZoomMode => 'Način zumiranja igrača';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Automatsko obrezivanje';

  @override
  String get stretch => 'Istegnite se';

  @override
  String get refreshRateSwitching => 'Promjena brzine osvježavanja';

  @override
  String get disabled => 'Onesposobljeno';

  @override
  String get scaleOnTv => 'Skala na TV-u';

  @override
  String get scaleOnDevice => 'Mjerilo na uređaju';

  @override
  String get trickPlay => 'Igra trikova';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Prikaži sličice pregleda prilikom traženja';

  @override
  String get showDescriptionOnPause => 'Prikaži opis na pauzi';

  @override
  String get dimVideoShowOverview =>
      'Zatamnite video i prikažite tekst pregleda dok je pauziran';

  @override
  String get osdLockButton => 'Gumb za zaključavanje OSD-a';

  @override
  String get osdLockButtonDescription =>
      'Prikaži gumb za zaključavanje koji blokira unos dodirom dok se ne pritisne dugo';

  @override
  String get audioBehavior => 'Ponašanje zvuka';

  @override
  String get downmixToStereo => 'Smanjivanje u stereo';

  @override
  String get defaultAudioLanguage => 'Zadani audio jezik';

  @override
  String get autoServerDefault => 'Automatski (zadano za poslužitelj)';

  @override
  String get english => 'engleski';

  @override
  String get spanish => 'španjolski';

  @override
  String get french => 'francuski';

  @override
  String get german => 'njemački';

  @override
  String get italian => 'talijanski';

  @override
  String get portuguese => 'portugalski';

  @override
  String get japanese => 'japanski';

  @override
  String get korean => 'korejski';

  @override
  String get chinese => 'kineski';

  @override
  String get russian => 'ruski';

  @override
  String get arabic => 'arapski';

  @override
  String get hindi => 'hindski';

  @override
  String get dutch => 'nizozemski';

  @override
  String get swedish => 'švedski';

  @override
  String get norwegian => 'norveški';

  @override
  String get danish => 'danski';

  @override
  String get finnish => 'finski';

  @override
  String get polish => 'Polirati';

  @override
  String get ac3Passthrough => 'AC3 prolaz';

  @override
  String get dtsPassthrough => 'DTS prolaz';

  @override
  String get trueHdSupport => 'Podrška za TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS audio samo na AVR; zahtijeva podršku prijemnika i DTS izvorni trag';

  @override
  String get enableTrueHdAudio =>
      'Omogući TrueHD audio (možda neće raditi na svim platformama)';

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
  String get nightMode => 'Noćni način rada';

  @override
  String get compressDynamicRange => 'Sažimanje dinamičkog raspona';

  @override
  String get advancedMpv => 'Napredno mpv';

  @override
  String get enableCustomMpvConf => 'Omogući prilagođeni mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Prije početka reprodukcije primijenite korisnički naveden mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => 'Nesigurne napredne mpv opcije';

  @override
  String get unsafeMpvOptionsDescription =>
      'Dopusti širi skup opcija mpv. Može prekinuti reprodukciju.';

  @override
  String get hardwareDecoding => 'Hardversko dekodiranje';

  @override
  String get hardwareDecodingSubtitle =>
      'Može poboljšati performanse, ali može uzrokovati probleme s reprodukcijom na nekim uređajima.';

  @override
  String get nextUpAndQueuing => 'Sljedeće i čekanje';

  @override
  String get nextUpDisplay => 'Sljedeći zaslon';

  @override
  String get extended => 'Prošireno';

  @override
  String get minimal => 'Minimalno';

  @override
  String get nextUpTimeout => 'Sljedeće Istek';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Red čekanja medija';

  @override
  String get autoQueueNextEpisodes =>
      'Automatsko stavljanje sljedećih epizoda u red čekanja';

  @override
  String get stillWatchingPrompt => 'Još uvijek gledam upit';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Nastavi i preskoči';

  @override
  String get resumeRewind => 'Nastavi premotavanje unatrag';

  @override
  String get unpauseRewind => 'Poništavanje pauze premotavanje unatrag';

  @override
  String get fiveSeconds => '5 sekundi';

  @override
  String get tenSeconds => '10 sekundi';

  @override
  String get fifteenSeconds => '15 sekundi';

  @override
  String get thirtySeconds => '30 sekundi';

  @override
  String get skipBackLength => 'Skip Back Length';

  @override
  String get skipForwardLength => 'Duljina preskakanja unaprijed';

  @override
  String get customMpvConfPath => 'Prilagođeni mpv.conf put';

  @override
  String get notSetMpvConf =>
      'Nije postavljeno. Moonfin će pokušati sa zadanim mpv.conf u mapama app/data.';

  @override
  String get selectMpvConf => 'Odaberite mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Postavke stila (veličina, boja, pomak) primjenjuju se na tekstualne titlove (SRT, VTT, TTML). ASS/SSA titlovi koriste vlastiti ugrađeni stil osim ako je \"ASS/SSA Direct Play\" isključen. Bitmap titlovi (PGS, DVB, VobSub) ne mogu se mijenjati.';

  @override
  String get defaultSubtitleLanguage => 'Zadani jezik titlova';

  @override
  String get defaultToNoSubtitles => 'Zadano je Bez titlova';

  @override
  String get turnOffSubtitlesByDefault =>
      'Isključite titlove prema zadanim postavkama';

  @override
  String get subtitleSize => 'Veličina podnaslova';

  @override
  String get textFillColor => 'Boja ispune teksta';

  @override
  String get backgroundColor => 'Boja pozadine';

  @override
  String get textStrokeColor => 'Boja poteza teksta';

  @override
  String get subtitleCustomization => 'Prilagodba titlova';

  @override
  String get subtitleCustomizationDescription =>
      'Prilagodite izgled podnaslova';

  @override
  String get subtitlePreviewText => 'Brza smeđa lisica preskače lijenog psa';

  @override
  String get verticalOffset => 'Vertikalni pomak';

  @override
  String get pgsDirectPlay => 'PGS izravna igra';

  @override
  String get directPlayPgsSubtitles => 'Izravna reprodukcija PGS titlova';

  @override
  String get assSsaDirectPlay => 'ASS/SSA izravna igra';

  @override
  String get directPlayAssSsaSubtitles =>
      'Izravna reprodukcija ASS/SSA titlova';

  @override
  String get white => 'Bijela';

  @override
  String get black => 'Crna';

  @override
  String get yellow => 'Žuta boja';

  @override
  String get green => 'zelena';

  @override
  String get cyan => 'cijan';

  @override
  String get red => 'crvena';

  @override
  String get transparent => 'Transparentan';

  @override
  String get semiTransparentBlack => 'Poluprozirna crna';

  @override
  String get global => 'Globalno';

  @override
  String get desktop => 'Radna površina';

  @override
  String get mobile => 'Mobilni';

  @override
  String get tv => 'televizor';

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
  String get customizationProfile => 'Profil prilagodbe';

  @override
  String get customizationProfileDescription =>
      'Odaberite profil za učitavanje, uređivanje i sinkronizaciju. Globalno se primjenjuje posvuda osim ako ga profil uređaja ne poništi. Zelena točka označava vaš trenutni profil uređaja.';

  @override
  String get loadProfile => 'Učitaj profil';

  @override
  String get syncing => 'Sinkronizacija...';

  @override
  String get syncToProfile => 'Sinkronizacija s profilom';

  @override
  String get profileSyncHidden => 'Sinkronizacija profila skrivena';

  @override
  String get enablePluginSyncDescription =>
      'Omogućite sinkronizaciju dodatka poslužitelja u postavkama dodatka da biste ovdje prikazali kontrole profila.';

  @override
  String get quality => 'Kvaliteta';

  @override
  String get defaultDownloadQuality => 'Zadana kvaliteta preuzimanja';

  @override
  String get network => 'Mreža';

  @override
  String get wifiOnlyDownloads => 'Preuzimanja samo za WiFi';

  @override
  String get onlyDownloadOnWifi => 'Preuzimajte samo kada ste povezani na WiFi';

  @override
  String get storage => 'Skladištenje';

  @override
  String get storageUsed => 'Korištena pohrana';

  @override
  String get manage => 'Upravljati';

  @override
  String get calculating => 'Izračunavanje...';

  @override
  String get downloadLocation => 'Lokacija preuzimanja';

  @override
  String get defaultLabel => 'Zadano';

  @override
  String get saveToDownloadsFolder => 'Spremi u mapu Preuzimanja';

  @override
  String get downloadsVisibleToOtherApps =>
      'Preuzimanja/Moonfin — vidljivo drugim aplikacijama';

  @override
  String get dangerZone => 'Opasna zona';

  @override
  String get clearAllDownloads => 'Obriši sva preuzimanja';

  @override
  String get original => 'Izvornik';

  @override
  String get changeDownloadLocation => 'Promjena lokacije preuzimanja';

  @override
  String get changeDownloadLocationDescription =>
      'Nova preuzimanja bit će spremljena u odabranu mapu. Postojeća preuzimanja ostat će na svojoj trenutnoj lokaciji i njima se može upravljati u postavkama pohrane.';

  @override
  String get confirm => 'Potvrdi';

  @override
  String get cannotWriteToFolder =>
      'Nije moguće pisati u odabranu mapu. Odaberite drugu lokaciju ili dajte dozvole za pohranu.';

  @override
  String get saveToDownloadsFolderQuestion => 'Spremiti u mapu Preuzimanja?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Preuzeti mediji bit će spremljeni u Preuzimanja/Moonfin na vašem uređaju. Ove će datoteke biti vidljive drugim aplikacijama poput vaše galerije ili glazbenog playera.\n\nPostojeća preuzimanja ostat će na svojoj trenutnoj lokaciji.';

  @override
  String get enable => 'Omogućiti';

  @override
  String get clearAllDownloadsWarning =>
      'Ovo će izbrisati sve preuzete medije i ne može se poništiti.';

  @override
  String get clearAll => 'Obriši sve';

  @override
  String get navigationStyle => 'Stil navigacije';

  @override
  String get topBar => 'Gornja traka';

  @override
  String get leftSidebar => 'Lijeva bočna traka';

  @override
  String get showShuffleButton => 'Prikaži gumb za nasumičnu reprodukciju';

  @override
  String get showGenresButton => 'Prikaži gumb Žanrovi';

  @override
  String get showFavoritesButton => 'Prikaži gumb Favoriti';

  @override
  String get showLibrariesInToolbar => 'Prikaži biblioteke na alatnoj traci';

  @override
  String get navbarOpacity => 'Neprozirnost navigacijske trake';

  @override
  String get navbarColor => 'Boja navigacijske trake';

  @override
  String get gray => 'Sivo';

  @override
  String get darkBlue => 'Tamnoplava';

  @override
  String get purple => 'Ljubičasta';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'Mornarica';

  @override
  String get charcoal => 'Drveni ugljen';

  @override
  String get brown => 'Smeđa';

  @override
  String get darkRed => 'Tamno crvena';

  @override
  String get darkGreen => 'Tamno zelena';

  @override
  String get slate => 'Škriljevac';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Prikaz knjižnice';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Sličica';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings => 'Nadjačaj postavke po knjižnici';

  @override
  String get applyImageTypeToAllLibraries =>
      'Primijeni vrstu slike na sve biblioteke';

  @override
  String get multiServerLibraries => 'Knjižnice s više poslužitelja';

  @override
  String get showLibrariesFromAllServers =>
      'Prikaži biblioteke sa svih povezanih poslužitelja';

  @override
  String get enableFolderView => 'Omogući prikaz mape';

  @override
  String get showFolderBrowsingOption => 'Prikaži opciju pregledavanja mape';

  @override
  String get libraryVisibility => 'Vidljivost knjižnice';

  @override
  String get libraryVisibilityDescription =>
      'Promjena vidljivosti početne stranice po knjižnici. Ponovno pokrenite Moonfin kako bi promjene stupile na snagu.';

  @override
  String get showInNavigation => 'Prikaži u navigaciji';

  @override
  String get showInLatestMedia => 'Prikaži u najnovijim medijima';

  @override
  String get sourceLibraries => 'Knjižnice izvora';

  @override
  String get sourceCollections => 'Zbirke izvora';

  @override
  String get excludedGenres => 'Isključeni žanrovi';

  @override
  String get selectAll => 'Odaberite sve';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Medijska traka';

  @override
  String get mediaSources => 'Medijski izvori';

  @override
  String get behavior => 'Ponašanje';

  @override
  String get seconds => 'sekundi';

  @override
  String get localPreviews => 'Lokalni pregledi';

  @override
  String get localPreviewsDescription =>
      'Konfigurirajte najavu, medije i audio preglede.';

  @override
  String get mediaBarMode => 'Stil medijske trake';

  @override
  String get mediaBarModeDescription =>
      'Odaberite između Moonfin, MakD ili isključite medijsku traku';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Isključeno';

  @override
  String get enableMediaBar => 'Omogući medijsku traku';

  @override
  String get showFeaturedContentSlideshow =>
      'Prikaži slajdove istaknutog sadržaja na početnoj stranici';

  @override
  String get contentType => 'Vrsta sadržaja';

  @override
  String get moviesAndTvShows => 'Filmovi i TV emisije';

  @override
  String get moviesOnly => 'Samo filmovi';

  @override
  String get tvShowsOnly => 'Samo TV emisije';

  @override
  String get itemCount => 'Broj stavki';

  @override
  String get noneSelected => 'Ništa odabrano';

  @override
  String get noneExcluded => 'Ništa nije isključeno';

  @override
  String get autoAdvance => 'Automatski unaprijed';

  @override
  String get autoAdvanceSlides => 'Automatski prijeđi na sljedeći slajd';

  @override
  String get autoAdvanceInterval => 'Automatski interval unaprijed';

  @override
  String get trailerPreview => 'Pregled najave';

  @override
  String get autoPlayTrailers =>
      'Automatski reproduciraj najave na medijskoj traci nakon 3 sekunde';

  @override
  String get episodePreview => 'Pregled epizode';

  @override
  String get mediaPreview => 'Pregled medija';

  @override
  String get episodePreviewDescription =>
      'Reproducirajte umetnuti pregled od 30 sekundi na fokusiranim karticama, karticama koje lebde ili su dugo pritisnute';

  @override
  String get mediaPreviewDescription =>
      'Reproducirajte umetnuti pregled od 30 sekundi na fokusiranim karticama, karticama koje lebde ili su dugo pritisnute';

  @override
  String get previewAudio => 'Audio pregled';

  @override
  String get enablePreviewAudio => 'Omogući zvuk za najavu i preglede epizoda';

  @override
  String get latestMedia => 'Najnoviji mediji';

  @override
  String get recentlyReleased => 'Nedavno objavljeno';

  @override
  String get myMedia => 'Moji mediji';

  @override
  String get myMediaSmall => 'Moji mediji (mali)';

  @override
  String get continueWatching => 'Nastavite s gledanjem';

  @override
  String get resumeAudio => 'Nastavi zvuk';

  @override
  String get resumeBooks => 'Životopis Knjige';

  @override
  String get activeRecordings => 'Aktivne snimke';

  @override
  String get playlists => 'Popisi pjesama';

  @override
  String get liveTV => 'TV uživo';

  @override
  String get homeSections => 'Početna Odjeljci';

  @override
  String get resetToDefaults => 'Vrati na zadane postavke';

  @override
  String get homeRowPosterSize => 'Veličina plakata u kućnom redu';

  @override
  String get perRowImageTypeSelection => 'Odabir vrste slike po redu';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurirajte vrstu slike za svaki omogućeni početni red';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Spoji Nastavi gledati i Sljedeće';

  @override
  String get combineBothRows =>
      'Kombinirajte oba reda u jedan početni odjeljak';

  @override
  String get perRowImageType => 'Vrsta slike po redu';

  @override
  String get perRowSettings => 'Postavke po retku';

  @override
  String get autoLogin => 'Automatska prijava';

  @override
  String get lastUser => 'Zadnji korisnik';

  @override
  String get specificUser => 'Određeni korisnik';

  @override
  String get alwaysAuthenticate => 'Uvijek provjeri autentičnost';

  @override
  String get requirePasswordWithToken =>
      'Zahtijeva lozinku čak i s pohranjenim tokenom';

  @override
  String get confirmExit => 'Potvrdite Izlaz';

  @override
  String get showConfirmationBeforeExiting => 'Prikaži potvrdu prije izlaska';

  @override
  String get blockContentWithRatings =>
      'Blokiraj sadržaj sa sljedećim ocjenama:';

  @override
  String get noContentRatingsFound =>
      'Na ovom poslužitelju još nisu pronađene ocjene sadržaja.';

  @override
  String get couldNotLoadServerRatings =>
      'Nije moguće učitati ocjene poslužitelja. Prikazuju se samo spremljene ocjene.';

  @override
  String get couldNotRefreshRatings =>
      'Nije moguće osvježiti ocjene s poslužitelja. Prikaz spremljenih ocjena.';

  @override
  String get enablePinCode => 'Omogući PIN kod';

  @override
  String get requirePinToAccess => 'Zahtijevaj PIN za pristup svom računu';

  @override
  String get changePin => 'Promjena PIN-a';

  @override
  String get setNewPinCode => 'Postavite novi PIN kod';

  @override
  String get removePin => 'Ukloni PIN';

  @override
  String get removePinProtection => 'Uklonite zaštitu PIN kodom';

  @override
  String get screensaver => 'Čuvar zaslona';

  @override
  String get inAppScreensaver => 'Čuvar zaslona unutar aplikacije';

  @override
  String get enableBuiltInScreensaver => 'Omogućite ugrađeni čuvar zaslona';

  @override
  String get mode => 'Način rada';

  @override
  String get libraryArt => 'Knjižnica čl';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Sat';

  @override
  String get timeout => 'Istek vremena';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Razina zatamnjenja';

  @override
  String get maxAgeRating => 'Maksimalna dobna ocjena';

  @override
  String get any => 'Bilo koje';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Zahtijeva dobnu ocjenu';

  @override
  String get onlyShowRatedContent => 'Prikaži samo ocijenjeni sadržaj';

  @override
  String get showClock => 'Prikaži sat';

  @override
  String get displayClockDuringScreensaver =>
      'Prikaz sata tijekom čuvara zaslona';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Kritičari)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (publika)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritičan';

  @override
  String get metacriticUser => 'Metacritic (korisnik)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Ocjena zajednice';

  @override
  String get ratings => 'Ocjene';

  @override
  String get additionalRatings => 'Dodatne ocjene';

  @override
  String get showMdbListAndTmdbRatings => 'Prikaži MDBList i TMDB ocjene';

  @override
  String get ratingLabels => 'Oznake ocjena';

  @override
  String get showLabelsNextToIcons => 'Prikaži oznake pored ikona ocjenjivanja';

  @override
  String get ratingBadges => 'Oznake ocjena';

  @override
  String get showDecorativeBadges => 'Prikaži ukrasne značke iza ocjena';

  @override
  String get episodeRatings => 'Ocjene epizoda';

  @override
  String get showRatingsOnEpisodes => 'Prikaži ocjene pojedinačnih epizoda';

  @override
  String get ratingSources => 'Izvori ocjena';

  @override
  String get ratingSourcesDescription =>
      'Omogućite i promijenite redoslijed izvora ocjenjivanja prikazanih u cijeloj aplikaciji';

  @override
  String get pluginLabel => 'Dodatak';

  @override
  String get pluginDetected => 'Dodatak otkriven';

  @override
  String get pluginNotDetected => 'Dodatak nije otkriven';

  @override
  String get pluginDetectedDescription =>
      'Otkriven je dodatak poslužitelja. Sinkronizacija se automatski uključuje prvi put kada se dodatak pronađe.';

  @override
  String get pluginNotDetectedDescription =>
      'Dodatak poslužitelja trenutno nije otkriven. Lokalne postavke i dalje koriste svoje spremljene vrijednosti ili ugrađene zadane postavke.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Dostupne usluge';

  @override
  String get serverPluginSync => 'Sinkronizacija dodataka poslužitelja';

  @override
  String get syncSettingsWithPlugin =>
      'Sinkronizirajte postavke s dodatkom poslužitelja';

  @override
  String get whatSyncControls => 'Koje kontrole sinkronizacije';

  @override
  String get syncControlsDescription =>
      'Sinkronizacija samo kontrolira hoće li se postavke podržane dodatkom gurnuti na poslužitelj i povući s njega. Radnje odabira profila i sinkronizacije profila nalaze se u postavkama prilagodbe kada je omogućena sinkronizacija dodataka.';

  @override
  String get recentRequests => 'Nedavni zahtjevi';

  @override
  String get recentlyAdded => 'Nedavno dodano';

  @override
  String get trending => 'U trendu';

  @override
  String get popularMovies => 'Popularni filmovi';

  @override
  String get movieGenres => 'Filmski žanrovi';

  @override
  String get upcomingMovies => 'Nadolazeći filmovi';

  @override
  String get studios => 'Studiji';

  @override
  String get popularSeries => 'Popularna serija';

  @override
  String get seriesGenres => 'Žanrovi serije';

  @override
  String get upcomingSeries => 'Nadolazeće serije';

  @override
  String get networks => 'mreže';

  @override
  String get resetRowsToDefaults => 'Vrati retke na zadane vrijednosti';

  @override
  String get enableSeerr => 'Omogući Seerr';

  @override
  String get showSeerrInNavigation =>
      'Prikaži Seerr u navigaciji (zahtijeva dodatak za poslužitelj)';

  @override
  String get seerrUnavailable =>
      'Nije dostupno jer je podrška za dodatak poslužitelja Seerr onemogućena.';

  @override
  String get nsfwFilter => 'NSFW filter';

  @override
  String get hideAdultContent => 'Sakrij sadržaj za odrasle u rezultatima';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Otkrijte redove';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Povucite za promjenu redoslijeda. Omogućite ili onemogućite retke. Omogućeni redoslijed sinkronizira se s dodatkom Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Povucite za promjenu redoslijeda. Omogućite ili onemogućite retke.';

  @override
  String get enabled => 'Omogućeno';

  @override
  String get hidden => 'Skriven';

  @override
  String get aboutTitle => 'Oko';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Licence otvorenog koda';

  @override
  String get sourceCode => 'Izvorni kod';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Provjerite sada ažuriranja';

  @override
  String get checksLatestDesktopRelease =>
      'Provjerava najnovije izdanje za stolna računala za ovu platformu';

  @override
  String get youAreUpToDate => 'U toku ste.';

  @override
  String get couldNotCheckForUpdates =>
      'Trenutno ne mogu provjeriti ima li ažuriranja.';

  @override
  String get noCompatibleUpdate =>
      'Za ovu platformu nije pronađen kompatibilan paket ažuriranja.';

  @override
  String get updateChecksNotSupported =>
      'Provjere ažuriranja nisu podržane na ovoj platformi.';

  @override
  String get updateNotificationsDisabled =>
      'Obavijesti o ažuriranju su onemogućene.';

  @override
  String get pleaseWaitBeforeChecking => 'Pričekajte prije ponovne provjere.';

  @override
  String get latestUpdateAlreadyShown =>
      'Najnovije ažuriranje već je prikazano.';

  @override
  String get updateAvailable => 'Ažuriranje dostupno.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Obavijesti o ažuriranju';

  @override
  String get showWhenUpdatesAvailable => 'Prikaži kada su dostupna ažuriranja';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Pročitajte napomene o izdanju';

  @override
  String get downloadingUpdate => 'Preuzimanje ažuriranja...';

  @override
  String get updateDownloadFailed =>
      'Preuzimanje ažuriranja nije uspjelo. Molimo pokušajte ponovo.';

  @override
  String get openReleasesPage => 'Otvori stranicu s izdanjima';

  @override
  String get navigation => 'Navigacija';

  @override
  String get watchedIndicatorsBackdrops => 'Gledani indikatori, kulise';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Boja fokusa, indikatori praćenja, pozadine';

  @override
  String get navbarStyleToolbarAppearance =>
      'Stil navigacijske trake, gumbi alatne trake, izgled';

  @override
  String get reorderToggleHomeRows =>
      'Promjena redoslijeda i prebacivanje početnih redaka';

  @override
  String get featuredContentAppearance => 'Istaknuti sadržaj, izgled';

  @override
  String get posterSizeImageTypeFolderView =>
      'Veličina postera, vrsta slike, prikaz mape';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB i izvori ocjena';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Jasan';

  @override
  String get browse => 'Pregledaj';

  @override
  String get noResults => 'Nema rezultata';

  @override
  String get seerrAvailableStatus => 'na raspolaganju';

  @override
  String get seerrRequestedStatus => 'Zatraženo';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Seerr postavke';

  @override
  String get requestMore => 'Zatražite više';

  @override
  String get request => 'Zahtjev';

  @override
  String get cancelRequest => 'Otkaži zahtjev';

  @override
  String get playInMoonfin => 'Igrajte u Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Odobriti';

  @override
  String get declineAction => 'Pad';

  @override
  String get similar => 'Sličan';

  @override
  String get recommendations => 'Preporuke';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Zadržati';

  @override
  String get itemNotFoundInLibrary =>
      'Stavka nije pronađena u vašoj biblioteci Moonfin';

  @override
  String get errorSearchingLibrary => 'Pogreška pri pretraživanju knjižnice';

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
  String get submitRequest => 'Pošalji zahtjev';

  @override
  String get allSeasons => 'Sva godišnja doba';

  @override
  String get advancedOptions => 'Napredne opcije';

  @override
  String get noServiceServersConfigured =>
      'Nema konfiguriranih poslužitelja usluga';

  @override
  String get server => 'poslužitelj';

  @override
  String get qualityProfile => 'Profil kvalitete';

  @override
  String get rootFolder => 'Korijenska mapa';

  @override
  String get showMore => 'Prikaži više';

  @override
  String get appearances => 'Pojave';

  @override
  String get crewSection => 'Posada';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Nema zahtjeva';

  @override
  String get pendingStatus => 'Na čekanju';

  @override
  String get declinedStatus => 'Odbijeno';

  @override
  String get partiallyAvailable => 'Djelomično dostupno';

  @override
  String get downloadingStatus => 'Preuzimanje';

  @override
  String get approvedStatus => 'Odobreno';

  @override
  String get notRequestedStatus => 'Nije traženo';

  @override
  String get blocklistedStatus => 'Na popisu blokiranih';

  @override
  String get deletedStatus => 'Izbrisano';

  @override
  String get tmdbScore => 'TMDB rezultat';

  @override
  String get releaseDateLabel => 'Datum izlaska';

  @override
  String get firstAirDateLabel => 'Prvi datum emitiranja';

  @override
  String get revenueLabel => 'Prihod';

  @override
  String get runtimeLabel => 'Runtime';

  @override
  String get budgetLabel => 'Proračun';

  @override
  String get originalLanguageLabel => 'Izvorni jezik';

  @override
  String get seasonsLabel => 'Godišnja doba';

  @override
  String get episodesLabel => 'Epizode';

  @override
  String get access => 'Pristup';

  @override
  String get add => 'Dodati';

  @override
  String get address => 'Adresa';

  @override
  String get analytics => 'Analitika';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Sadržaj';

  @override
  String get copy => 'Kopirati';

  @override
  String get create => 'Stvoriti';

  @override
  String get disable => 'Onemogući';

  @override
  String get done => 'Gotovo';

  @override
  String get edit => 'Uredi';

  @override
  String get encoding => 'Kodiranje';

  @override
  String get error => 'Greška';

  @override
  String get forward => 'Naprijed';

  @override
  String get general => 'General';

  @override
  String get go => 'Ići';

  @override
  String get install => 'Instalirati';

  @override
  String get installed => 'instalirano';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Ime';

  @override
  String get networking => 'umrežavanje';

  @override
  String get next => 'Sljedeći';

  @override
  String get path => 'Put';

  @override
  String get paused => 'Pauzirano';

  @override
  String get permissions => 'Dozvole';

  @override
  String get processing => 'Obrada';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Davatelj';

  @override
  String get refresh => 'Osvježiti';

  @override
  String get remote => 'Daljinski';

  @override
  String get rename => 'Preimenovati';

  @override
  String get revoke => 'Opozvati';

  @override
  String get role => 'Uloga';

  @override
  String get root => 'Korijen';

  @override
  String get run => 'Trčanje';

  @override
  String get search => 'Pretraživanje';

  @override
  String get select => 'Odaberite';

  @override
  String get send => 'Poslati';

  @override
  String get sessions => 'Sjednice';

  @override
  String get set => 'Set';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Stop';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Vrijeme';

  @override
  String get trickplay => 'Trik igra';

  @override
  String get uninstall => 'Deinstaliraj';

  @override
  String get up => 'Gore';

  @override
  String get update => 'Ažurirati';

  @override
  String get upload => 'Upload';

  @override
  String get unmute => 'Uključi zvuk';

  @override
  String get mute => 'Isključi zvuk';

  @override
  String get branding => 'Brendiranje';

  @override
  String get adminDrawerDashboard => 'Nadzorna ploča';

  @override
  String get adminDrawerAnalytics => 'Analitika';

  @override
  String get adminDrawerSettings => 'postavke';

  @override
  String get adminDrawerBranding => 'Brendiranje';

  @override
  String get adminDrawerUsers => 'Korisnici';

  @override
  String get adminDrawerLibraries => 'Knjižnice';

  @override
  String get adminDrawerTranscoding => 'Transkodiranje';

  @override
  String get adminDrawerResume => 'Nastavi';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trik igra';

  @override
  String get adminDrawerDevices => 'Uređaji';

  @override
  String get adminDrawerActivity => 'Aktivnost';

  @override
  String get adminDrawerNetworking => 'umrežavanje';

  @override
  String get adminDrawerApiKeys => 'API ključevi';

  @override
  String get adminDrawerBackups => 'Sigurnosne kopije';

  @override
  String get adminDrawerLogs => 'Dnevnici';

  @override
  String get adminDrawerScheduledTasks => 'Planirani zadaci';

  @override
  String get adminDrawerPlugins => 'Dodaci';

  @override
  String get adminDrawerRepositories => 'Spremišta';

  @override
  String get adminDrawerLiveTv => 'TV uživo';

  @override
  String get adminExitTooltip => 'Izlaz iz administratora';

  @override
  String get adminDashboardLoadFailed =>
      'Učitavanje nadzorne ploče nije uspjelo';

  @override
  String get adminMediaOverview => 'Pregled medija';

  @override
  String get adminMediaTotalsError =>
      'Nije moguće učitati ukupne medije poslužitelja.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Brzo čitanje o tome koliko sadržaja ima na ovom poslužitelju.';

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
  String get analyticsMediaDistribution => 'Distribucija medija';

  @override
  String get analyticsVideoCodecs => 'Video kodeci';

  @override
  String get analyticsAudioCodecs => 'Audio kodeci';

  @override
  String get analyticsContainers => 'Kontejneri';

  @override
  String get analyticsTopGenres => 'Najbolji žanrovi';

  @override
  String get analyticsReleaseYears => 'Godine izdanja';

  @override
  String get analyticsContentRatings => 'Ocjene sadržaja';

  @override
  String get analyticsRuntimeBuckets => 'Kante za vrijeme izvođenja';

  @override
  String get analyticsFileFormats => 'Formati datoteka';

  @override
  String get analyticsNoData => 'Nema dostupnih podataka.';

  @override
  String get adminServerInfo => 'Informacije o poslužitelju';

  @override
  String get adminRestartPending => 'Ponovno pokretanje na čekanju';

  @override
  String get adminServerPaths => 'Putovi poslužitelja';

  @override
  String get adminServerActions => 'Akcije poslužitelja';

  @override
  String get adminRestartServer => 'Ponovno pokrenite poslužitelj';

  @override
  String get adminShutdownServer => 'Isključi poslužitelj';

  @override
  String get adminScanLibraries => 'Skenirajte knjižnice';

  @override
  String get adminLibraryScanStarted => 'Počelo je skeniranje knjižnice';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Ponovno pokretanje poslužitelja u tijeku';

  @override
  String get adminServerRebootMessage =>
      'Ponovno pokretanje poslužitelja u tijeku, ponovno pokrenite Moonfin';

  @override
  String get adminActiveSessions => 'Aktivne sesije';

  @override
  String get adminSessionsLoadFailed => 'Učitavanje sesija nije uspjelo';

  @override
  String get adminNoActiveSessions => 'Nema aktivnih sesija';

  @override
  String get adminRecentActivity => 'Nedavna aktivnost';

  @override
  String get adminNoRecentActivity => 'Nema nedavnih aktivnosti';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Pošalji poruku';

  @override
  String get adminMessageTextHint => 'Tekst poruke';

  @override
  String get adminSetVolume => 'Postavite glasnoću';

  @override
  String get sessionPrev => 'Pret';

  @override
  String get sessionRewind => 'Premotati';

  @override
  String get sessionForward => 'Naprijed';

  @override
  String get sessionNext => 'Sljedeći';

  @override
  String get sessionVolumeDown => 'svezak –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Sada svira';

  @override
  String get volume => 'Volumen';

  @override
  String get actions => 'Radnje';

  @override
  String get videoCodec => 'Video kodek';

  @override
  String get audioCodec => 'Audio kodek';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Završetak';

  @override
  String get direct => 'Izravno';

  @override
  String get adminDisconnect => 'Prekini vezu';

  @override
  String get adminClearDates => 'Jasni datumi';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nema unosa aktivnosti';

  @override
  String get adminEditDeviceName => 'Uredi naziv uređaja';

  @override
  String get adminCustomName => 'Prilagođeno ime';

  @override
  String get adminDeviceNameUpdated => 'Naziv uređaja ažuriran';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Izbriši uređaj';

  @override
  String get adminDeviceDeleted => 'Uređaj izbrisan';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Učitavanje uređaja nije uspjelo';

  @override
  String get adminSearchDevices => 'Pretražite uređaje';

  @override
  String get adminThisDevice => 'Ovaj uređaj';

  @override
  String get adminEditName => 'Uredi ime';

  @override
  String get adminLibrariesLoadFailed => 'Učitavanje biblioteka nije uspjelo';

  @override
  String get adminNoLibraries => 'Nema konfiguriranih biblioteka';

  @override
  String get adminScanAllLibraries => 'Skeniraj sve biblioteke';

  @override
  String get adminAddLibrary => 'Dodaj biblioteku';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Preimenuj biblioteku';

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
  String get adminDeleteLibrary => 'Izbriši biblioteku';

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
  String get adminRemovePath => 'Ukloni put';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opcije biblioteke spremljene';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Učitavanje biblioteke nije uspjelo';

  @override
  String get adminNoMediaPaths => 'Nisu konfigurirane staze medija';

  @override
  String get adminAddPath => 'Dodaj put';

  @override
  String get adminBrowseFilesystem =>
      'Pregledaj datotečni sustav poslužitelja:';

  @override
  String get adminSaveOptions => 'Spremi opcije';

  @override
  String get adminPreferredMetadataLanguage => 'Preferirani jezik metapodataka';

  @override
  String get adminMetadataLanguageHint => 'npr. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Šifra države metapodataka';

  @override
  String get adminMetadataCountryHint => 'npr. SAD, Njemačka, Francuska';

  @override
  String get adminLibraryNameRequired => 'Potreban je naziv biblioteke';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Naziv knjižnice';

  @override
  String get adminSelectedPaths => 'Odabrane staze:';

  @override
  String get adminNoPathsAdded => 'Nisu dodane staze (mogu se dodati kasnije)';

  @override
  String get adminCreateLibrary => 'Stvori biblioteku';

  @override
  String get paths => 'Putovi:';

  @override
  String get adminDisableUser => 'Onemogući korisnika';

  @override
  String get adminEnableUser => 'Omogući korisnika';

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
  String get adminUsersLoadFailed => 'Učitavanje korisnika nije uspjelo';

  @override
  String get adminSearchUsers => 'Pretražite korisnike';

  @override
  String get adminEditUser => 'Uredi korisnika';

  @override
  String get adminAddUser => 'Dodaj korisnika';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Stvori korisnika';

  @override
  String get adminPasswordOptional => 'Lozinka (nije obavezno)';

  @override
  String get adminUsernameRequired => 'Korisničko ime ne može biti prazno';

  @override
  String get adminNoProfileChanges => 'Nema promjena profila za spremanje';

  @override
  String get adminProfileSaved => 'Profil je spremljen';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Dopuštenja su spremljena';

  @override
  String get adminPasswordsMismatch => 'Lozinke se ne podudaraju';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Učitavanje korisnika nije uspjelo';

  @override
  String get adminBackToUsers => 'Povratak na korisnike';

  @override
  String get adminSaveProfile => 'Spremi profil';

  @override
  String get adminDeleteUser => 'Izbriši korisnika';

  @override
  String get admin => 'Administrator';

  @override
  String get adminFullAccessWarning =>
      'Administratori imaju potpuni pristup poslužitelju. Dajte s oprezom.';

  @override
  String get administrator => 'Administrator';

  @override
  String get adminHiddenUser => 'Skriveni korisnik';

  @override
  String get adminAllowMediaPlayback => 'Dopusti reprodukciju medija';

  @override
  String get adminAllowAudioTranscoding => 'Dopusti audio transkodiranje';

  @override
  String get adminAllowVideoTranscoding => 'Dopusti video transkodiranje';

  @override
  String get adminAllowRemuxing => 'Dopusti ponovno muksiranje';

  @override
  String get adminForceRemoteTranscoding =>
      'Prisilno transkodiranje udaljenog izvora';

  @override
  String get adminAllowContentDeletion => 'Dopusti brisanje sadržaja';

  @override
  String get adminAllowContentDownloading => 'Dopusti preuzimanje sadržaja';

  @override
  String get adminAllowPublicSharing => 'Dopusti javno dijeljenje';

  @override
  String get adminAllowRemoteControl =>
      'Dopusti daljinsko upravljanje drugim korisnicima';

  @override
  String get adminAllowSharedDeviceControl =>
      'Dopusti dijeljenu kontrolu uređaja';

  @override
  String get adminAllowRemoteAccess => 'Dopusti daljinski pristup';

  @override
  String get adminRemoteBitrateLimit =>
      'Ograničenje brzine prijenosa udaljenog klijenta (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Ostavite prazno ako nema ograničenja';

  @override
  String get adminMaxActiveSessions => 'Maks. aktivne sesije';

  @override
  String get adminAllowLiveTvAccess => 'Dopusti pristup TV-u uživo';

  @override
  String get adminAllowLiveTvManagement => 'Dopusti upravljanje TV-om uživo';

  @override
  String get adminAllowCollectionManagement => 'Dopusti upravljanje zbirkom';

  @override
  String get adminAllowSubtitleManagement => 'Dopusti upravljanje titlovima';

  @override
  String get adminAllowLyricManagement => 'Dopusti upravljanje stihovima';

  @override
  String get adminSavePermissions => 'Spremi dopuštenja';

  @override
  String get adminEnableAllLibraryAccess => 'Omogući pristup svim knjižnicama';

  @override
  String get adminSaveAccess => 'Spremi pristup';

  @override
  String get adminChangePassword => 'Promjena lozinke';

  @override
  String get adminNewPassword => 'Nova lozinka';

  @override
  String get adminConfirmPassword => 'Potvrdite lozinku';

  @override
  String get adminSetPassword => 'Postavi lozinku';

  @override
  String get adminResetPassword => 'Ponovno postavljanje lozinke';

  @override
  String get adminPasswordReset => 'Ponovno postavljanje lozinke';

  @override
  String get adminPasswordUpdated => 'Lozinka ažurirana';

  @override
  String get adminUserSettings => 'Korisničke postavke';

  @override
  String get adminLibraryAccess => 'Pristup knjižnici';

  @override
  String get adminDeviceAndChannelAccess => 'Pristup uređaju i kanalu';

  @override
  String get adminEnableAllDevices => 'Omogućite pristup svim uređajima';

  @override
  String get adminEnableAllChannels => 'Omogući pristup svim kanalima';

  @override
  String get adminResetPasswordWarning =>
      'Ovo će ukloniti lozinku. Korisnik će se moći prijaviti bez lozinke.';

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
  String get adminCreateApiKey => 'Stvorite API ključ';

  @override
  String get adminAppName => 'Naziv aplikacije';

  @override
  String get adminApiKeyCreated => 'API ključ stvoren';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Ključ je uspješno kreiran. Poslužitelj nije vratio token. Provjerite API ključeve poslužitelja.';

  @override
  String get adminKeyCopied => 'Ključ je kopiran u međuspremnik';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Token ključa nedostaje u odgovoru poslužitelja';

  @override
  String get adminRevokeApiKey => 'Opozovi API ključ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API ključ opozvan';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Učitavanje API ključeva nije uspjelo';

  @override
  String get adminApiKeysTitle => 'API ključevi';

  @override
  String get adminCreateKey => 'Kreiraj ključ';

  @override
  String get adminNoApiKeys => 'Nema pronađenih API ključeva';

  @override
  String get adminUnknownApp => 'Nepoznata aplikacija';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Izrada sigurnosne kopije...';

  @override
  String get adminBackupCreated => 'Sigurnosna kopija je uspješno stvorena';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Puta rezervne kopije nedostaje u odgovoru poslužitelja';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Potvrdite vraćanje';

  @override
  String get adminRestoringBackup => 'Vraćanje sigurnosne kopije...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'Učitavanje sigurnosnih kopija nije uspjelo';

  @override
  String get adminCreateBackup => 'Napravi sigurnosnu kopiju';

  @override
  String get adminNoBackups => 'Nisu pronađene sigurnosne kopije';

  @override
  String get adminViewDetails => 'Prikaži pojedinosti';

  @override
  String get restore => 'Vratiti';

  @override
  String get adminLogsLoadFailed =>
      'Nije uspjelo učitavanje zapisnika poslužitelja';

  @override
  String get adminNoLogFiles => 'Nisu pronađene datoteke dnevnika';

  @override
  String get adminLogCopied => 'Dnevnik kopiran u međuspremnik';

  @override
  String get adminSaveLogFile => 'Spremi datoteku dnevnika';

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
  String get adminSearchInLog => 'Traži u dnevniku';

  @override
  String get adminNoMatchingLines => 'Nema odgovarajućih linija';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nisu pronađeni zakazani zadaci';

  @override
  String get adminNoTasksMatchFilter =>
      'Nijedan zadatak ne odgovara trenutnom filtru';

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
  String get adminRunNow => 'Trči sada';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Posljednja egzekucija';

  @override
  String get adminTriggers => 'Okidači';

  @override
  String get adminAddTrigger => 'Dodaj okidač';

  @override
  String get adminNoTriggers => 'Nema konfiguriranih okidača';

  @override
  String get adminTriggerType => 'Vrsta okidača';

  @override
  String get adminTimeLimit => 'Vremensko ograničenje (nije obavezno)';

  @override
  String get adminNoLimit => 'Bez ograničenja';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Dan u tjednu';

  @override
  String get adminSearchPlugins => 'Pretraži dodatke...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Deinstaliraj dodatak';

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
      'Nijedan dodatak ne odgovara vašem pretraživanju';

  @override
  String get adminNoPluginsInstalled => 'Nema instaliranih dodataka';

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
      'Nijedan paket ne odgovara vašoj pretrazi';

  @override
  String get adminNoPackagesAvailable => 'Nema dostupnih paketa';

  @override
  String get adminExperimentalIntegration => 'Eksperimentalna integracija';

  @override
  String get adminExperimentalWarning =>
      'Integracija postavki dodataka još uvijek je eksperimentalna. Neke stranice postavki možda se neće ispravno prikazati.';

  @override
  String get continueAction => 'Nastaviti';

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
      'Nije moguće otvoriti postavke: nedostaje token autentifikacije.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Dodatak nije pronađen';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Omogući dodatak';

  @override
  String get adminPluginSettingsPage => 'Stranica postavki dodatka';

  @override
  String get adminRevisionHistory => 'Povijest revizija';

  @override
  String get adminNoChangelog => 'Nema dostupnog dnevnika promjena.';

  @override
  String get adminRemoveRepository => 'Ukloni spremište';

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
  String get adminRepositoryNameHint => 'npr. Jellyfin Stabilan';

  @override
  String get adminRepositoryUrl => 'URL spremišta';

  @override
  String get adminAddEntry => 'Dodaj unos';

  @override
  String get adminInvalidUrl => 'Nevažeći URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Otvori u pregledniku';

  @override
  String get adminOpenExternally => 'Otvoren izvana';

  @override
  String get adminGeneralSettings => 'Opće postavke';

  @override
  String get adminServerName => 'Naziv poslužitelja';

  @override
  String get adminPreferredMetadataCountry => 'Preferirana zemlja metapodataka';

  @override
  String get adminCachePath => 'Put predmemorije';

  @override
  String get adminMetadataPath => 'Put metapodataka';

  @override
  String get adminLibraryScanConcurrency =>
      'Konkurentnost skeniranja knjižnice';

  @override
  String get adminParallelImageEncodingLimit =>
      'Ograničenje paralelnog kodiranja slike';

  @override
  String get adminSlowResponseThreshold => 'Prag sporog odgovora (ms)';

  @override
  String get adminBrandingSaved => 'Postavke robne marke spremljene';

  @override
  String get adminBrandingLoadFailed =>
      'Učitavanje postavki marke nije uspjelo';

  @override
  String get adminLoginDisclaimer => 'Odricanje od odgovornosti za prijavu';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML prikazan ispod obrasca za prijavu';

  @override
  String get adminCustomCss => 'Prilagođeni CSS';

  @override
  String get adminCustomCssHint => 'Prilagođeni CSS primijenjen na web sučelje';

  @override
  String get adminEnableSplashScreen => 'Omogući početni zaslon';

  @override
  String get adminStreamingSaved => 'Postavke strujanja spremljene';

  @override
  String get adminStreamingLoadFailed =>
      'Učitavanje postavki strujanja nije uspjelo';

  @override
  String get adminStreamingDescription =>
      'Postavite globalna ograničenja brzine protoka za udaljene veze.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Ograničenje brzine prijenosa udaljenog klijenta (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Ostavite prazno ili 0 za neograničeno';

  @override
  String get adminPlaybackSaved => 'Postavke reprodukcije spremljene';

  @override
  String get adminPlaybackLoadFailed =>
      'Učitavanje postavki reprodukcije nije uspjelo';

  @override
  String get adminPlaybackTranscoding => 'Reprodukcija / Transkodiranje';

  @override
  String get adminHardwareAcceleration => 'Hardversko ubrzanje';

  @override
  String get adminVaapiDevice => 'VA-API uređaj';

  @override
  String get adminEnableHardwareEncoding => 'Omogući hardversko kodiranje';

  @override
  String get adminEnableHardwareDecoding =>
      'Omogući hardversko dekodiranje za:';

  @override
  String get adminEncodingThreads => 'Kodiranje niti';

  @override
  String get adminAutomatic => '0 = automatski';

  @override
  String get adminTranscodingTempPath => 'Privremeni put transkodiranja';

  @override
  String get adminEnableFallbackFont => 'Omogući rezervni font';

  @override
  String get adminFallbackFontPath => 'Putanja zamjenskog fonta';

  @override
  String get adminAllowSegmentDeletion => 'Dopusti brisanje segmenta';

  @override
  String get adminSegmentKeepSeconds => 'Zadržavanje segmenta (sekunde)';

  @override
  String get adminThrottleBuffering => 'Prigušni međuspremnik';

  @override
  String get adminTrickplaySaved => 'Postavke Trickplaya spremljene';

  @override
  String get adminTrickplayLoadFailed =>
      'Učitavanje postavki trickplaya nije uspjelo';

  @override
  String get adminEnableHardwareAcceleration => 'Omogući hardversko ubrzanje';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Omogući ekstrakciju samo ključnih okvira';

  @override
  String get adminKeyFrameSubtitle => 'Brže, ali niže točnosti';

  @override
  String get adminScanBehavior => 'Ponašanje skeniranja';

  @override
  String get adminProcessPriority => 'Prioritet procesa';

  @override
  String get adminImageSettings => 'Postavke slike';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Koliko često snimati okvire';

  @override
  String get adminWidthResolutions => 'Razlučivost širine';

  @override
  String get adminTileWidth => 'Širina pločice';

  @override
  String get adminTileHeight => 'Visina pločice';

  @override
  String get adminQualitySubtitle =>
      'Niže vrijednosti = bolja kvaliteta, veće datoteke';

  @override
  String get adminProcessThreads => 'Procesne niti';

  @override
  String get adminResumeSaved => 'Postavke za nastavak spremljene';

  @override
  String get adminResumeLoadFailed =>
      'Učitavanje postavki za nastavak nije uspjelo';

  @override
  String get adminResumeDescription =>
      'Konfigurirajte kada sadržaj treba biti označen kao djelomično reproduciran ili potpuno reproduciran.';

  @override
  String get adminMinResumePercentage => 'Minimalni postotak životopisa';

  @override
  String get adminMinResumeSubtitle =>
      'Sadržaj se mora reproducirati iznad ovog postotka da bi se sačuvao napredak';

  @override
  String get adminMaxResumePercentage => 'Maksimalni postotak životopisa';

  @override
  String get adminMaxResumeSubtitle =>
      'Nakon tog postotka sadržaj se smatra potpuno reproduciranim';

  @override
  String get adminMinResumeDuration => 'Minimalno trajanje nastavka (sekunde)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Stavke kraće od ovoga ne mogu se nastaviti';

  @override
  String get adminMinAudiobookResume =>
      'Minimalni postotak nastavka audioknjige';

  @override
  String get adminMaxAudiobookResume =>
      'Maksimalni postotak nastavka audioknjige';

  @override
  String get adminNetworkingSaved =>
      'Postavke mreže su spremljene. Možda će biti potrebno ponovno pokretanje poslužitelja.';

  @override
  String get adminNetworkingLoadFailed =>
      'Učitavanje mrežnih postavki nije uspjelo';

  @override
  String get adminNetworkingWarning =>
      'Promjene mrežnih postavki mogu zahtijevati ponovno pokretanje poslužitelja.';

  @override
  String get adminEnableRemoteAccess => 'Omogući daljinski pristup';

  @override
  String get ports => 'luke';

  @override
  String get adminHttpPort => 'HTTP priključak';

  @override
  String get adminHttpsPort => 'HTTPS priključak';

  @override
  String get adminPublicHttpsPort => 'Javni HTTPS priključak';

  @override
  String get adminBaseUrl => 'Osnovni URL';

  @override
  String get adminBaseUrlHint => 'npr. /želefina';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Omogući HTTPS';

  @override
  String get adminLocalNetwork => 'Lokalna mreža';

  @override
  String get adminLocalNetworkAddresses => 'Adrese lokalne mreže';

  @override
  String get adminKnownProxies => 'Poznati proxyji';

  @override
  String get adminRemoteIpFilter => 'Udaljeni IP filtar';

  @override
  String get adminRemoteIpFilterEntries => 'Udaljeni IP filter';

  @override
  String get adminCertificatePath => 'Put potvrde';

  @override
  String get whitelist => 'Bijela lista';

  @override
  String get blacklist => 'Crna lista';

  @override
  String get notSet => 'Nije postavljeno';

  @override
  String get adminMetadataSaved => 'Metapodaci spremljeni';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Osvježi metapodatke';

  @override
  String get recursive => 'Rekurzivno';

  @override
  String get adminReplaceAllMetadata => 'Zamijeni sve metapodatke';

  @override
  String get adminReplaceAllImages => 'Zamijeni sve slike';

  @override
  String get adminMetadataRefreshRequested =>
      'Zatraženo je osvježavanje metapodataka';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Traži udaljenu osobu';

  @override
  String get adminNoRemoteMatches => 'Nije pronađeno udaljeno podudaranje';

  @override
  String get adminRemoteResults => 'Rezultati na daljinu';

  @override
  String get adminRemoteMetadataApplied => 'Primijenjeni udaljeni metapodaci';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Ažuriraj vrstu sadržaja';

  @override
  String get adminContentType => 'Vrsta sadržaja';

  @override
  String get adminContentTypeUpdated => 'Vrsta sadržaja ažurirana';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Učitavanje uređivača metapodataka nije uspjelo';

  @override
  String get adminNoPeopleEntries => 'Nema unosa ljudi';

  @override
  String get adminNoExternalIds => 'Nema dostupnih vanjskih ID-ova';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nepodržani format slike';

  @override
  String get adminImageReadFailed => 'Čitanje odabrane slike nije uspjelo';

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
  String get adminAllProviders => 'Svi pružatelji usluga';

  @override
  String get adminNoRemoteImages => 'Nije pronađena udaljena slika';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Dodaj tuner';

  @override
  String get adminTunerType => 'Vrsta tunera';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, ostalo';

  @override
  String get adminUrlPath => 'URL / Put';

  @override
  String get adminNameOptional => 'Ime (nije obavezno)';

  @override
  String get adminTunerAdded => 'Tuner dodan';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Dodaj pružatelja vodiča';

  @override
  String get adminProviderType => 'Vrsta pružatelja usluga';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect ili XMLTV';

  @override
  String get adminUsernameOptional => 'korisničko ime (nije obavezno)';

  @override
  String get adminRefreshInterval => 'Interval osvježavanja (sati)';

  @override
  String get adminProviderAdded => 'Pružatelj je dodan';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Zatraženo resetiranje tunera';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Postavke snimanja';

  @override
  String get adminPrePadding => 'Prethodno punjenje (minute)';

  @override
  String get adminPostPadding => 'Post-padding (minute)';

  @override
  String get adminRecordingPath => 'Putanja snimanja';

  @override
  String get adminSeriesRecordingPath => 'Put snimanja serije';

  @override
  String get adminRecordingSettingsSaved => 'Postavke snimanja su spremljene';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Postavite preslikavanja kanala';

  @override
  String get adminMappingJson => 'Mapiranje JSON';

  @override
  String get adminMappingJsonHint => 'Primjer: preslikavanje JSON nosivosti';

  @override
  String get adminChannelMappingsUpdated => 'Ažurirana mapiranja kanala';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nije uspjelo učitavanje administracije TV-a uživo';

  @override
  String get adminTunerDevices => 'Tuner uređaji';

  @override
  String get adminNoTunerHosts => 'Nema konfiguriranih hostova tunera';

  @override
  String get adminGuideProviders => 'Pružatelji vodiča';

  @override
  String get adminAddProvider => 'Dodaj davatelja usluga';

  @override
  String get adminNoListingProviders => 'Nema konfiguriranih pružatelja popisa';

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
  String get adminChannelMappings => 'Preslikavanja kanala';

  @override
  String get adminNoDiscoveredTuners => 'Još nema otkrivenih tunera';

  @override
  String get adminSettingsSaved => 'Postavke su spremljene';

  @override
  String get adminBackupsNotAvailable =>
      'Sigurnosne kopije nisu dostupne na ovoj verziji poslužitelja.';

  @override
  String get adminRestoreWarning1 =>
      'Vraćanje će zamijeniti SVE trenutne podatke poslužitelja s podacima sigurnosne kopije.';

  @override
  String get adminRestoreWarning2 =>
      'Trenutačne postavke poslužitelja, korisnici i podaci knjižnice bit će prebrisani.';

  @override
  String get adminRestoreWarning3 =>
      'Poslužitelj će se ponovno pokrenuti nakon obnove.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Zatraženo vraćanje. Ponovno pokretanje poslužitelja može prekinuti ovu sesiju.';

  @override
  String get adminBackupsTitle => 'Sigurnosne kopije';

  @override
  String get adminUnknownDate => 'Nepoznat datum';

  @override
  String get adminUnnamedBackup => 'Neimenovana sigurnosna kopija';

  @override
  String get adminLiveTvNotAvailable =>
      'Administracija TV-a uživo nije dostupna na ovoj verziji poslužitelja.';

  @override
  String get adminLiveTvTitle => 'TV administracija uživo';

  @override
  String get adminApply => 'primijeniti';

  @override
  String get adminNotSet => 'Nije postavljeno';

  @override
  String get adminReset => 'Resetiraj';

  @override
  String get adminLogsTitle => 'Dnevnici poslužitelja';

  @override
  String get adminLogsNewestFirst => 'Prvo najnovije';

  @override
  String get adminLogsOldestFirst => 'Prvo najstariji';

  @override
  String get adminLogsJustNow => 'Upravo sada';

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
  String get adminLogViewerNoMatches => 'Nema odgovarajućih linija';

  @override
  String get adminMetadataEditorTitle => 'Uređivač metapodataka';

  @override
  String get adminMetadataRemote => 'Daljinski';

  @override
  String get adminMetadataType => 'Tip';

  @override
  String get adminMetadataDetails => 'pojedinosti';

  @override
  String get adminMetadataExternalIds => 'Vanjski ID-ovi';

  @override
  String get adminMetadataImages => 'Slike';

  @override
  String get adminMetadataFieldTitle => 'Titula';

  @override
  String get adminMetadataFieldSortTitle => 'Naslov sortiranja';

  @override
  String get adminMetadataFieldOriginalTitle => 'Izvorni naslov';

  @override
  String get adminMetadataFieldPremiereDate => 'Datum premijere (GGGG-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Datum završetka (GGGG-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Godina proizvodnje';

  @override
  String get adminMetadataFieldOfficialRating => 'Službena ocjena';

  @override
  String get adminMetadataFieldCommunityRating => 'Ocjena zajednice';

  @override
  String get adminMetadataFieldCriticRating => 'Ocjena kritičara';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Pregled';

  @override
  String get adminMetadataGenres => 'Žanrovi';

  @override
  String get adminMetadataTags => 'oznake';

  @override
  String get adminMetadataStudios => 'Studiji';

  @override
  String get adminMetadataPeople => 'Ljudi';

  @override
  String get adminMetadataAddGenre => 'Dodajte žanr';

  @override
  String get adminMetadataAddTag => 'Dodaj oznaku';

  @override
  String get adminMetadataAddStudio => 'Dodaj studio';

  @override
  String get adminMetadataAddPerson => 'Dodaj osobu';

  @override
  String get adminMetadataEditPerson => 'Uredi osobu';

  @override
  String get adminMetadataRole => 'Uloga';

  @override
  String get adminMetadataImagePrimary => 'Primarni';

  @override
  String get adminMetadataImageBackdrop => 'Pozadina';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Palac';

  @override
  String get adminMetadataRecursive => 'Rekurzivno';

  @override
  String get adminMetadataProvider => 'Davatelj';

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
      'Čitanje odabrane slike nije uspjelo';

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
      'Ovo uklanja trenutnu sliku iz stavke.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Upload';

  @override
  String get adminMetadataUpdate => 'Ažurirati';

  @override
  String get adminMetadataRemoteImage => 'Udaljena slika';

  @override
  String get adminPluginsInstalled => 'instalirano';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktivan';

  @override
  String get adminPluginsRestart => 'Ponovno pokretanje';

  @override
  String get adminPluginsNoSearchResults =>
      'Nijedan dodatak ne odgovara vašem pretraživanju';

  @override
  String get adminPluginsNoneInstalled => 'Nema instaliranih dodataka';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Ažuriranje dostupno';

  @override
  String get adminPluginsPendingRemoval =>
      'Čeka se uklanjanje nakon ponovnog pokretanja';

  @override
  String get adminPluginsChangesPending => 'Promjene čekaju ponovno pokretanje';

  @override
  String get adminPluginsEnable => 'Omogućiti';

  @override
  String get adminPluginsDisable => 'Onemogući';

  @override
  String get adminPluginsInstallUpdate => 'Instalirajte ažuriranje';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nijedan paket ne odgovara vašoj pretrazi';

  @override
  String get adminPluginsCatalogEmpty => 'Nema dostupnih paketa';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentalna integracija';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integracija postavki dodataka još uvijek je eksperimentalna. Neka polja ili izgledi možda se još ne prikazuju ispravno.';

  @override
  String get adminPluginDetailToggle404 =>
      'Promjena dodatka nije uspjela. Poslužitelj nije mogao pronaći ovu verziju dodatka. Pokušajte osvježiti dodatke, a zatim pokušajte ponovno.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Promjena dodatka nije uspjela. Za detalje provjerite zapisnike poslužitelja.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'pojedinosti';

  @override
  String get adminPluginDetailDeveloper => 'Developer';

  @override
  String get adminPluginDetailRepository => 'Spremište';

  @override
  String get adminPluginDetailBundled => 'U paketu';

  @override
  String get adminPluginDetailEnablePlugin => 'Omogući dodatak';

  @override
  String get adminPluginDetailRestartRequired =>
      'Potrebno je ponovno pokretanje poslužitelja kako bi promjene stupile na snagu.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Ovaj će dodatak biti uklonjen nakon ponovnog pokretanja poslužitelja.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Ovaj dodatak je neispravan i možda neće raditi ispravno.';

  @override
  String get adminPluginDetailNotSupported =>
      'Trenutna verzija poslužitelja ne podržava ovaj dodatak.';

  @override
  String get adminPluginDetailSuperseded =>
      'Ovaj dodatak je zamijenjen novijom verzijom.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Ukloni spremište';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Ukloniti';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Nema konfiguriranih spremišta';

  @override
  String get adminReposEmptySubtitle =>
      'Dodajte spremište za pregledavanje dostupnih dodataka';

  @override
  String get adminReposUnnamed => '(neimenovano)';

  @override
  String get adminReposEditTitle => 'Uredi spremište';

  @override
  String get adminReposAddTitle => 'Dodaj spremište';

  @override
  String get adminReposUrl => 'URL spremišta';

  @override
  String get adminReposNameHint => 'npr. Jellyfin Stabilan';

  @override
  String get adminPluginSettingsInvalidUrl => 'Nevažeći URL';

  @override
  String get adminGeneralSettingsTitle => 'Opće postavke';

  @override
  String get adminGeneralMetadataLanguage => 'Preferirani jezik metapodataka';

  @override
  String get adminGeneralMetadataLanguageHint => 'npr. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Preferirana zemlja metapodataka';

  @override
  String get adminGeneralMetadataCountryHint => 'npr. SAD, Njemačka, Francuska';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Konkurentnost skeniranja knjižnice';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Ograničenje paralelnog kodiranja slike';

  @override
  String get adminUnknownError => 'Nepoznata greška';

  @override
  String get adminBrowse => 'Pregledaj';

  @override
  String get adminCloseBrowser => 'Zatvori preglednik';

  @override
  String get adminNetworkingTitle => 'umrežavanje';

  @override
  String get adminNetworkingRestartWarning =>
      'Promjene mrežnih postavki mogu zahtijevati ponovno pokretanje poslužitelja.';

  @override
  String get adminNetworkingRemoteAccess => 'Omogući daljinski pristup';

  @override
  String get adminNetworkingPorts => 'luke';

  @override
  String get adminNetworkingHttpPort => 'HTTP priključak';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS priključak';

  @override
  String get adminNetworkingEnableHttps => 'Omogući HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Lokalna mreža';

  @override
  String get adminNetworkingLocalAddresses => 'Adrese lokalne mreže';

  @override
  String get adminNetworkingAddressHint => 'npr. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Poznati proxyji';

  @override
  String get adminNetworkingProxyHint => 'npr. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Bijela lista';

  @override
  String get adminNetworkingBlacklist => 'Crna lista';

  @override
  String get adminNetworkingAddEntry => 'Dodaj unos';

  @override
  String get adminBrandingTitle => 'Brendiranje';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Odricanje od odgovornosti za prijavu';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML prikazan ispod obrasca za prijavu';

  @override
  String get adminBrandingCustomCss => 'Prilagođeni CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Prilagođeni CSS primijenjen na web sučelje';

  @override
  String get adminBrandingEnableSplash => 'Omogući početni zaslon';

  @override
  String get adminPlaybackHwAccel => 'Hardversko ubrzanje';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardversko ubrzanje';

  @override
  String get adminPlaybackEnableHwEncoding => 'Omogući hardversko kodiranje';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Omogući hardversko dekodiranje za:';

  @override
  String get adminPlaybackEncoding => 'Kodiranje';

  @override
  String get adminPlaybackEncodingThreads => 'Kodiranje niti';

  @override
  String get adminPlaybackFallbackFont => 'Omogući rezervni font';

  @override
  String get adminPlaybackFallbackFontPath => 'Putanja zamjenskog fonta';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'audio knjige';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimalni postotak nastavka audioknjige';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maksimalni postotak nastavka audioknjige';

  @override
  String get adminStreamingBitrateLimit =>
      'Ograničenje brzine prijenosa udaljenog klijenta (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Ostavite prazno ili 0 za neograničeno';

  @override
  String get adminTrickplayHwAccel => 'Omogući hardversko ubrzanje';

  @override
  String get adminTrickplayHwEncoding => 'Omogući hardversko kodiranje';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Omogući ekstrakciju samo ključnih okvira';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'Brže, ali niže točnosti';

  @override
  String get adminTrickplayNonBlocking => 'Neblokiranje';

  @override
  String get adminTrickplayBlocking => 'Blokiranje';

  @override
  String get adminTrickplayPriorityHigh => 'visoko';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Iznad normale';

  @override
  String get adminTrickplayPriorityNormal => 'Normalan';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Ispod normale';

  @override
  String get adminTrickplayPriorityIdle => 'besposlen';

  @override
  String get adminTrickplayImageSettings => 'Postavke slike';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Koliko često snimati okvire';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Širine piksela odvojene zarezima (npr. 320)';

  @override
  String get adminTrickplayQuality => 'Kvaliteta';

  @override
  String get adminTrickplayQScale => 'Ljestvica kvalitete';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Niže vrijednosti = bolja kvaliteta, veće datoteke';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kvaliteta';

  @override
  String get adminTrickplayProcessing => 'Obrada';

  @override
  String get adminTasksEmpty => 'Nisu pronađeni zakazani zadaci';

  @override
  String get adminTasksNoFilterMatch =>
      'Nijedan zadatak ne odgovara trenutnom filtru';

  @override
  String get adminTaskCancelling => 'Otkazivanje...';

  @override
  String get adminTaskRunning => 'Trčanje...';

  @override
  String get adminTaskNeverRun => 'Nikad ne trči';

  @override
  String get adminTaskStop => 'Stop';

  @override
  String get adminTaskRun => 'Trčanje';

  @override
  String get adminTaskDetailLastExecution => 'Posljednja egzekucija';

  @override
  String get adminTaskDetailStarted => 'Započelo';

  @override
  String get adminTaskDetailEnded => 'Završeno';

  @override
  String get adminTaskDetailDuration => 'Trajanje';

  @override
  String get adminTaskDetailErrorLabel => 'Greška:';

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
  String get adminTaskTriggerStartup => 'Prilikom pokretanja aplikacije';

  @override
  String get adminTaskTriggerTypeDaily => 'Dnevno';

  @override
  String get adminTaskTriggerTypeWeekly => 'Tjedni';

  @override
  String get adminTaskTriggerTypeInterval => 'U intervalu';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

  @override
  String get adminTaskTriggerEveryHour => 'Svaki sat';

  @override
  String get adminTaskTriggerEvery6Hours => 'Svakih 6 sati';

  @override
  String get adminTaskTriggerEvery12Hours => 'Svakih 12 sati';

  @override
  String get adminTaskTriggerEvery24Hours => 'Svaka 24 sata';

  @override
  String get adminTaskTriggerEvery2Days => 'Svaka 2 dana';

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
  String get adminTaskTriggerTime => 'Vrijeme';

  @override
  String get adminTaskTriggerNoLimit => 'Bez ograničenja';

  @override
  String get adminActivityJustNow => 'Upravo sada';

  @override
  String get adminActivityLastHour => 'Zadnji sat';

  @override
  String get adminActivityToday => 'Danas';

  @override
  String get adminActivityYesterday => 'Jučer';

  @override
  String get adminActivityOlder => 'Starije';

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
  String get adminActivityNow => 'sada';

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
      'Konfigurirajte generiranje trickplay slike za pretpregled sličica pretraživanja.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Javni HTTPS priključak';

  @override
  String get adminNetworkingBaseUrl => 'Osnovni URL';

  @override
  String get adminNetworkingBaseUrlHint => 'npr. /želefina';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Put potvrde';

  @override
  String get adminNetworkingRemoteIpFilter => 'Udaljeni IP filtar';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Udaljeni IP filter';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API uređaj';

  @override
  String get adminPlaybackAutomatic => '0 = automatski';

  @override
  String get adminPlaybackTranscodeTempPath => 'Privremeni put transkodiranja';

  @override
  String get adminPlaybackSegmentDeletion => 'Dopusti brisanje segmenta';

  @override
  String get adminPlaybackSegmentKeep => 'Zadržavanje segmenta (sekunde)';

  @override
  String get adminPlaybackThrottleBuffering => 'Prigušni međuspremnik';

  @override
  String get adminResumeMinPct => 'Minimalni postotak životopisa';

  @override
  String get adminResumeMinPctSubtitle =>
      'Sadržaj se mora reproducirati iznad ovog postotka da bi se sačuvao napredak';

  @override
  String get adminResumeMaxPct => 'Maksimalni postotak životopisa';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Nakon tog postotka sadržaj se smatra potpuno reproduciranim';

  @override
  String get adminResumeMinDuration => 'Minimalno trajanje nastavka (sekunde)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Stavke kraće od ovoga ne mogu se nastaviti';

  @override
  String get adminTrickplayScanBehavior => 'Ponašanje skeniranja';

  @override
  String get adminTrickplayProcessPriority => 'Prioritet procesa';

  @override
  String get adminTrickplayTileWidth => 'Širina pločice';

  @override
  String get adminTrickplayTileHeight => 'Visina pločice';

  @override
  String get adminTrickplayProcessThreads => 'Procesne niti';

  @override
  String get adminTrickplayWidthResolutions => 'Razlučivost širine';

  @override
  String get adminMetadataDefault => 'Zadano';

  @override
  String get adminMetadataContentTypeUpdated => 'Vrsta sadržaja ažurirana';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Prag sporog odgovora (ms)';

  @override
  String get adminGeneralCachePath => 'Put predmemorije';

  @override
  String get adminGeneralMetadataPath => 'Put metapodataka';

  @override
  String get adminGeneralServerName => 'Naziv poslužitelja';

  @override
  String get adminSettingsLoadFailed => 'Učitavanje postavki nije uspjelo';

  @override
  String get adminDiscover => 'Otkriti';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'mape';

  @override
  String get libraries => 'Knjižnice';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay onemogućeno';

  @override
  String get syncPlayDisabledMessage =>
      'Omogućite SyncPlay u postavkama za korištenje sinkronizirane reprodukcije.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Poslužitelj nije podržan';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay zahtijeva Jellyfin poslužitelj. Trenutačni poslužitelj to ne podržava.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Grupa';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay grupa';

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
  String get syncPlayIgnoreWait => 'Zanemarite čekanje';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Nemojte zadržavati grupu dok ovaj uređaj radi međuspremnik';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Nastavite lokalno bez čekanja sporih članova';

  @override
  String get syncPlayRepeat => 'Ponoviti';

  @override
  String get syncPlayRepeatOne => 'Jedan';

  @override
  String get syncPlayShuffleModeShuffled => 'Promiješano';

  @override
  String get syncPlayShuffleModeSorted => 'Poredano';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sinkroniziraj trenutni red čekanja za reprodukciju';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Zamijenite grupni red čekanja onim što se reproducira lokalno';

  @override
  String get syncPlayLeaveGroup => 'Napusti grupu';

  @override
  String get syncPlayGroupQueue => 'Skupni red';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Igrajte sada';

  @override
  String get syncPlayCreateNewGroup => 'Stvorite novu grupu';

  @override
  String get syncPlayGroupName => 'Naziv grupe';

  @override
  String get syncPlayDefaultGroupName => 'Moja SyncPlay grupa';

  @override
  String get syncPlayCreateGroup => 'Stvori grupu';

  @override
  String get syncPlayAvailableGroups => 'Dostupne grupe';

  @override
  String get syncPlayNoGroupsAvailable => 'Nema dostupnih grupa';

  @override
  String get syncPlayJoinGroupQuestion => 'Pridružite se grupi SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Pridruživanje grupi SyncPlay može zamijeniti vaš trenutni red reprodukcije. Nastaviti?';

  @override
  String get syncPlayJoin => 'Pridruži se';

  @override
  String get syncPlayStateIdle => 'besposlen';

  @override
  String get syncPlayStateWaiting => 'Čekanje';

  @override
  String get syncPlayStatePaused => 'Pauzirano';

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
  String get syncPlayAccessDeniedTitle => 'SyncPlay pristup odbijen';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nemate pristup jednoj ili više stavki u ovoj SyncPlay grupi. Zamolite vlasnika grupe da potvrdi dopuštenja knjižnice ili odabere drugi red čekanja.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Glasovno pretraživanje nije dostupno.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Izravna igra nije uspjela';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Nije uspjelo pokretanje izravne reprodukcije za ovaj stream Dolby Vision. Pokušati ponovno pomoću transkodiranja poslužitelja?';

  @override
  String get retryWithTranscode => 'Pokušajte ponovo s transkodiranjem';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Nije podržano';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Ovaj uređaj ne može izravno dekodirati sadržaj Dolby Vision. Upotrijebite rezervni HDR10 ili zatražite transkodiranje poslužitelja.';

  @override
  String get rememberMyChoice => 'Upamti moj izbor';

  @override
  String get playHdr10Fallback => 'Igrajte HDR10 zamjenu';

  @override
  String get requestTranscode => 'Zahtjev za prekodiranje';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Otkrijte retke koje otkriva IAmParadox27 dodatak \"Odjeljci početnog zaslona\". Redovi se mogu omogućiti i promijeniti redoslijed ispod.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Još nijedan Jellyfin poslužitelj nije prijavio dodatak.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Otkrij retke konfigurirane putem dodatka \"KefinTweaks\" tvrtke ranaldsgift. Prilagođeni odjeljci, nedavno objavljeni, ponovno gledajte, sezonski i nedavno dodani u biblioteku odražavaju se iz KefinTweaks konfiguracije na svakom poslužitelju Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Još nijedan Jellyfin poslužitelj ne prijavljuje KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Otvorite početne odjeljke';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Omogućite, onemogućite i promijenite redoslijed redaka';

  @override
  String get integrationInstalledButDisabled => 'Instalirano, ali onemogućeno';

  @override
  String get integrationNotInstalled => 'Nije instaliran';

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
  String get seeAll => 'Vidi sve';

  @override
  String get noItems => 'Nema predmeta';

  @override
  String get switchUser => 'Promjena korisnika';

  @override
  String get remoteControl => 'Daljinski upravljač';

  @override
  String get mediaBarLoading => 'Učitavanje medijske trake...';

  @override
  String get mediaBarError => 'Medijska traka nije se uspjela učitati';

  @override
  String get offlineServerUnavailable =>
      'Povezan na internet, ali trenutni poslužitelj nije dostupan.';

  @override
  String get offlineNoInternet =>
      'Vi ste izvan mreže. Dostupan je samo preuzeti sadržaj.';

  @override
  String get offlineFileNotAvailable => 'Datoteka nije dostupna';

  @override
  String get offlineSwitchServer => 'Promjena poslužitelja';

  @override
  String get offlineSavedMedia => 'Spremljeni mediji';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Remote Playback';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Glasnoća uređaja';

  @override
  String get castVolumeUnavailable => 'Nedostupan';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'titlovi';

  @override
  String get pinConfirmTitle => 'Potvrdite PIN';

  @override
  String get pinSetTitle => 'Postavite PIN';

  @override
  String get pinEnterTitle => 'Unesite PIN';

  @override
  String get pinReenterToConfirm => 'Ponovno unesite svoj PIN za potvrdu';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Netočan PIN';

  @override
  String get pinMismatch => 'PIN-ovi se ne podudaraju';

  @override
  String get pinForgot => 'Zaboravili ste PIN?';

  @override
  String get pinClear => 'Jasan';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Zahtjev za brzo povezivanje odobren.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kôd za brzo povezivanje nije valjan ili je istekao.';

  @override
  String get quickConnectNotSupported =>
      'Brzo povezivanje nije podržano na ovom poslužitelju.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Autorizacija koda za brzo povezivanje nije uspjela.';

  @override
  String get quickConnectDisabled =>
      'Brzo povezivanje je onemogućeno na ovom poslužitelju.';

  @override
  String get quickConnectForbidden =>
      'Vaš račun ne može odobriti ovaj zahtjev za brzo povezivanje.';

  @override
  String get quickConnectNotFound =>
      'Kôd za brzo povezivanje nije pronađen. Pokušajte s novim kodom.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Unesite šifru';

  @override
  String get quickConnectAuthorize => 'Ovlastiti';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Daljinski upravljač';

  @override
  String get remoteFailedToLoadSessions => 'Učitavanje sesija nije uspjelo';

  @override
  String get remoteNoSessions => 'Nema kontroliranih sesija';

  @override
  String get remoteStartPlayback => 'Pokrenite reprodukciju na drugom uređaju';

  @override
  String get unknownUser => 'Nepoznato';

  @override
  String get unknownItem => 'Nepoznato';

  @override
  String get remoteNothingPlaying => 'Ništa se ne reproducira na ovoj sesiji';

  @override
  String get castingStarted => 'Emitiranje je započelo na odabranom uređaju';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nema dostupnih daljinskih uređaja za reprodukciju.';

  @override
  String get noRemoteDevicesIos =>
      'Nema dostupnih daljinskih uređaja za reprodukciju.\n\nNa iOS-u ciljevi AirPlay mogu biti nedostupni u simulatoru.';

  @override
  String get trackActionPlayNext => 'Igraj dalje';

  @override
  String get trackActionAddToQueue => 'Dodaj u red čekanja';

  @override
  String get trackActionAddToPlaylist => 'Dodaj na popis za reprodukciju';

  @override
  String get trackActionCancelDownload => 'Odustani od preuzimanja';

  @override
  String get trackActionDeleteFromPlaylist =>
      'Izbriši s popisa za reprodukciju';

  @override
  String get trackActionMoveUp => 'Pomakni se gore';

  @override
  String get trackActionMoveDown => 'Pomakni dolje';

  @override
  String get trackActionRemoveFromFavorites => 'Ukloni iz Favorita';

  @override
  String get trackActionAddToFavorites => 'Dodaj u favorite';

  @override
  String get trackActionGoToAlbum => 'Idite na Album';

  @override
  String get trackActionGoToArtist => 'Idite na Umjetnik';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Izbrisana preuzeta datoteka';

  @override
  String get trackActionDeleteFileFailed =>
      'Nije moguće izbrisati preuzetu datoteku';

  @override
  String get shuffleBy => 'Nasumično po';

  @override
  String get shuffleSelectLibrary => 'Odaberite Knjižnica';

  @override
  String get shuffleSelectGenre => 'Odaberite žanr';

  @override
  String get shuffleLibrary => 'Knjižnica';

  @override
  String get shuffleGenre => 'Žanr';

  @override
  String get shuffleNoLibraries => 'Nema dostupnih kompatibilnih biblioteka.';

  @override
  String get shuffleNoGenres =>
      'Nema pronađenih žanrova za ovaj način nasumične reprodukcije.';

  @override
  String get posterDisplayTitle => 'Prikaz';

  @override
  String get posterImageType => 'Vrsta slike';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Sličica';

  @override
  String get imageTypeBanner => 'Banner';

  @override
  String get playlistAddFailed =>
      'Dodavanje na popis za reprodukciju nije uspjelo';

  @override
  String get playlistCreateFailed =>
      'Izrada popisa za reprodukciju nije uspjela';

  @override
  String get playlistNew => 'Novi popis za reprodukciju';

  @override
  String get playlistCreate => 'Stvoriti';

  @override
  String get playlistCreateNew => 'Stvori novi popis za reprodukciju';

  @override
  String get playlistNoneFound => 'Nema pronađenih popisa za reprodukciju';

  @override
  String get addToPlaylist => 'Dodaj na popis za reprodukciju';

  @override
  String get lyricsNotAvailable => 'Nema dostupnih pjesama';

  @override
  String get upNext => 'Sljedeće';

  @override
  String get playNext => 'Igraj dalje';

  @override
  String get stillWatchingContent => 'Reprodukcija je pauzirana. Još gledaš?';

  @override
  String get stillWatchingStop => 'Stop';

  @override
  String get stillWatchingContinue => 'Nastaviti';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'TV uživo';

  @override
  String get continueWatchingAndNextUp => 'Nastavite s gledanjem i sljedeće';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Sljedeća epizoda';

  @override
  String get moreFromThisSeason => 'Više iz ove sezone';

  @override
  String get playerTooltipPlaybackSpeed => 'Brzina reprodukcije';

  @override
  String get playerTooltipCastControls => 'Kontrole cast';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Otvori cijeli zaslon';

  @override
  String get playerTooltipExitFullscreen => 'Izađi iz cijelog zaslona';

  @override
  String get playerTooltipFloatOnTop => 'Lebdi na vrhu';

  @override
  String get playerTooltipExitFloatOnTop => 'Onemogući plutanje na vrhu';

  @override
  String get playerTooltipLockLandscape => 'Zaključaj pejzaž';

  @override
  String get playerTooltipUnlockOrientation => 'Dopusti rotaciju';

  @override
  String get playerTooltipPrevious => 'Prethodno';

  @override
  String get playerTooltipSeekBack => 'Traži natrag';

  @override
  String get playerTooltipSeekForward => 'Traži naprijed';

  @override
  String get contextMenuMarkWatched => 'Označi kao gledano';

  @override
  String get contextMenuMarkUnwatched => 'Označi kao negledano';

  @override
  String get contextMenuAddToFavorites => 'Dodaj u favorite';

  @override
  String get contextMenuRemoveFromFavorites => 'Ukloni iz Favorita';

  @override
  String get contextMenuGoToSeries => 'Idite na Serije';

  @override
  String get settingsAdministrationSubtitle =>
      'Pristupite administracijskoj ploči poslužitelja';

  @override
  String get settingsAccountSecurity => 'Račun i sigurnost';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentifikacija, PIN kod i roditeljski nadzor';

  @override
  String get settingsPersonalization => 'Personalizacija';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigacija, početni redovi i vidljivost knjižnice';

  @override
  String get settingsDynamicContent => 'Dinamički sadržaj';

  @override
  String get settingsDynamicContentSubtitle =>
      'Medijska traka i vizualni slojevi';

  @override
  String get settingsPlaybackSyncplay => 'Reprodukcija i SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Audio/video postavke, titlovi, preuzimanja i SyncPlay kontrole';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sinkronizacija dodataka, Seerr, ocjene i više';

  @override
  String get settingsAboutSubtitle =>
      'Verzija aplikacije, pravne informacije i krediti';

  @override
  String get settingsAuthenticationSection => 'AVENTIFIKACIJA';

  @override
  String get settingsSortServersBy => 'Poredaj poslužitelje po';

  @override
  String get settingsLastUsed => 'Zadnje korišteno';

  @override
  String get settingsAlphabetical => 'Abecedno';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVATNOST I SIGURNOST';

  @override
  String get settingsBlockedRatings => 'Blokirane ocjene';

  @override
  String get settingsGeneralStyle => 'Opći stil';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Tematski naglasci, pozadine, indikatori praćenja i tematska glazba';

  @override
  String get settingsHomePage => 'Početna stranica';

  @override
  String get settingsHomePageSubtitle =>
      'Sekcije, vrste slika, preklapanja i pregledi medija';

  @override
  String get settingsLibrariesSubtitle =>
      'Vidljivost knjižnice, prikaz mape i ponašanje na više poslužitelja';

  @override
  String get settingsTwentyFourHourClock => '24-satni sat';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Koristite 24-satno formatiranje vremena gdje god se prikazuje sat';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Prikaži gumb za nasumično odabiranje na navigacijskoj traci';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Prikaži gumb žanrova u navigacijskoj traci';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Prikaži gumb favorita na navigacijskoj traci';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Prikaži gumb knjižnica na navigacijskoj traci';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Promjena vidljivosti početne stranice po knjižnici. Ponovno pokrenite Moonfin kako bi promjene stupile na snagu.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Medijska traka i lokalni pregledi';

  @override
  String get settingsVisualOverlays => 'Vizualni slojevi';

  @override
  String get settingsSeasonalSurprise => 'Sezonsko iznenađenje';

  @override
  String get settingsMetadataAndRatings => 'Metapodaci i ocjene';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase omogućuje integracije na strani poslužitelja uključujući dodatne izvore ocjenjivanja, Seerr zahtjeve i sinkronizirane postavke.';

  @override
  String get settingsOfflineDownloads => 'Izvanmrežna preuzimanja';

  @override
  String get settingsHigh => 'visoko';

  @override
  String get settingsLow => 'Niska';

  @override
  String get settingsCustomPath => 'Prilagođeni put';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Unesite putanju mape za preuzimanje';

  @override
  String get settingsConcurrentDownloads => 'Istodobna preuzimanja';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maksimalan broj stavki za preuzimanje odjednom.';

  @override
  String get settingsAppInfo => 'INFORMACIJE O APLIKACIJI';

  @override
  String get settingsReportAnIssue => 'Prijavite problem';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Otvorite alat za praćenje problema na GitHub';

  @override
  String get settingsJoinDiscord => 'Pridružite se Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Razgovarajte sa zajednicom';

  @override
  String get settingsJoinTheDiscord => 'Pridružite se Discord';

  @override
  String get settingsSupportMoonfin => 'Podrška Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Označite projekt zvjezdicom na GitHub ili doprinesite';

  @override
  String get settingsLegal => 'PRAVNO';

  @override
  String get settingsLicenses => 'Licence';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Obavijesti o licenci otvorenog koda';

  @override
  String get settingsPrivacyPolicy => 'Politika privatnosti';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Kako Moonfin rukuje vašim podacima';

  @override
  String get settingsCheckForUpdates => 'Provjerite ima li ažuriranja';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Provjerite najnovije izdanje Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Pokreće Flutter';

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
      'Nasumično filtar vrste sadržaja';

  @override
  String get settingsVideoPlaybackPreferences => 'Postavke video reprodukcije';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Osnovni video mehanizam i postavke kvalitete strujanja';

  @override
  String get settingsAudioPreferences => 'Postavke zvuka';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Audio zapisi, obrada i opcije prolaza';

  @override
  String get settingsAutomationAndQueue => 'Automatizacija i čekanje';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatizirana reprodukcija i sekvenciranje';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Kvaliteta preuzimanja, ograničenja pohrane i veličina čekanja';

  @override
  String get settingsSyncplaySubtitle =>
      'Logika sinkronizacije za grupne sesije';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Specijalizirane značajke igrača. Koristite s oprezom jer neke opcije mogu uzrokovati probleme s reprodukcijom';

  @override
  String get settingsSkipIntrosAndOutros => 'Preskočiti Intros i Outros?';

  @override
  String get settingsPromptUser => 'Brzi korisnik';

  @override
  String get settingsSkip => 'Preskočiti';

  @override
  String get settingsDoNothing => 'Ne čini ništa';

  @override
  String get settingsMaxBitrateDescription =>
      'Ograničite brzinu protoka. Sadržaj iznad ovog praga bit će transkodiran kako bi odgovarao.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ograničite maksimalnu rezoluciju koju će igrač zahtijevati. Sadržaj više razlučivosti bit će transkodiran.';

  @override
  String get settingsPlayerZoomDescription =>
      'Kako bi video trebao biti skaliran da odgovara zaslonu.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Mehanizam za reprodukciju (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Odaberite zadani mehanizam za reprodukciju na Android TV uređajima. Promjene se primjenjuju na sljedeću sesiju reprodukcije.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (preporučeno)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (nasljeđe)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Zamjena';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Ponašanje za Dolby Vision naslove na uređajima bez Dolby Vision dekodiranja.';

  @override
  String get settingsAskEachTime => 'Pitajte svaki put';

  @override
  String get settingsPreferHdr10Fallback => 'Radije HDR10 rezervni';

  @override
  String get settingsPreferServerTranscode =>
      'Preferiraj transkodiranje poslužitelja';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profil 7 Izravna igra';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Kontrolira hoće li Dolby Vision streamovi sloja poboljšanja profila 7 usmjeravati reprodukciju.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automatski (AFTKRT omogućen)';

  @override
  String get settingsEnabledOnThisDevice => 'Omogućeno na ovom uređaju';

  @override
  String get settingsDisabledPreferTranscode =>
      'Onemogućeno (radije transkodiranje)';

  @override
  String get settingsResumeRewindDescription =>
      'Prilikom nastavka reprodukcije (od Nastavi gledanja ili stranice s medijskom stavkom), koliko sekundi treba premotati unatrag?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Kada nastavljate reprodukciju nakon pritiska na gumb za pauzu, koliko sekundi treba premotati unatrag?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Koliko sekundi za skok unatrag nakon pritiska tipke za premotavanje unatrag.';

  @override
  String get settingsOneSecond => '1 sekunda';

  @override
  String get settingsThreeSeconds => '3 sekunde';

  @override
  String get settingsFortyFiveSeconds => '45 sekundi';

  @override
  String get settingsSixtySeconds => '60 sekundi';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Za koliko sekundi skočiti unaprijed nakon pritiska na gumb za brzo premotavanje.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 na vanjski dekoder';

  @override
  String get settingsCinemaMode => 'Cinema Mode';

  @override
  String get settingsCinemaModeSubtitle =>
      'Reproducirajte najave/prijave prije glavne značajke';

  @override
  String get settingsNextUpDisplayDescription =>
      'Prošireno prikazuje punu karticu sa slikom i opisom epizode. Minimalno prikazuje kompaktni sloj odbrojavanja. Onemogućeno u potpunosti skriva upit.';

  @override
  String get settingsShort => 'Kratak';

  @override
  String get settingsLong => 'dugo';

  @override
  String get settingsVeryLong => 'Vrlo dugo';

  @override
  String get settingsVideoStartDelay => 'Odgoda početka videa';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV uživo uživo';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Omogućite izravnu reprodukciju za TV uživo';

  @override
  String get settingsOpenGroups => 'Otvori Grupe';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Stvorite, pridružite se ili upravljajte SyncPlay grupama';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Omogućeno';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Omogući značajke grupnog gledanja';

  @override
  String get settingsSyncplayButton => 'SyncPlay Gumb';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Prikaži gumb SyncPlay na navigacijskoj traci';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Napredna korekcija';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Omogući preciznu logiku sinkronizacije';

  @override
  String get settingsSyncplaySyncCorrection => 'Ispravak sinkronizacije';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Automatski prilagodi reprodukciju kako bi ostala sinkronizirana';

  @override
  String get settingsSyncplaySpeedToSync => 'Brzina sinkronizacije';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Koristite podešavanje brzine reprodukcije za sinkronizaciju';

  @override
  String get settingsSyncplaySkipToSync => 'Preskoči na sinkronizaciju';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Koristite traženje za sinkronizaciju';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Minimalna brzina kašnjenja';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Odgoda maksimalne brzine';

  @override
  String get settingsSyncplaySpeedDuration => 'Brzina Trajanje';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minimalno kašnjenje preskakanja';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Dodatni pomak';

  @override
  String get onNow => 'Sada uključeno';

  @override
  String get collections => 'Zbirke';

  @override
  String get lastPlayed => 'Zadnje igrano';

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
