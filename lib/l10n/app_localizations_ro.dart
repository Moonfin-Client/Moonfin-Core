// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'ACCOUNT PREFERENCES';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'Conectare';

  @override
  String get empty => 'Empty';

  @override
  String connectingToServer(String serverName) {
    return 'Se conectează la $serverName';
  }

  @override
  String get quickConnect => 'Conectare rapidă';

  @override
  String get password => 'Parolă';

  @override
  String get username => 'Nume de utilizator';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Introduceți acest cod pe tabloul de bord web al serverului dvs.:';

  @override
  String get waitingForAuthorization => 'Se așteaptă autorizația...';

  @override
  String get back => 'Spate';

  @override
  String get serverUnavailable => 'Serverul este indisponibil';

  @override
  String get loginFailed => 'Autentificare eșuată';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect indisponibil: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect indisponibil ($status): $detail';
  }

  @override
  String get whosWatching => 'Cine se uită?';

  @override
  String get addUser => 'Adăugați utilizator';

  @override
  String get selectServer => 'Selectați Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versiunea $version';
  }

  @override
  String get savedServers => 'Servere salvate';

  @override
  String get discoveredServers => 'Servere descoperite';

  @override
  String get noneFound => 'Nu s-a găsit niciunul';

  @override
  String get unableToConnectToServer => 'Nu se poate conecta la server';

  @override
  String get addServer => 'Adăugați server';

  @override
  String get embyConnect => 'Emby Conectați-vă';

  @override
  String get removeServer => 'Eliminați serverul';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Eliminați „$serverName” de pe serverele dvs.?';
  }

  @override
  String get cancel => 'Anula';

  @override
  String get remove => 'Elimina';

  @override
  String get connectToServer => 'Conectați-vă la server';

  @override
  String get serverAddress => 'Adresa serverului';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Conectați-vă';

  @override
  String get secureStorageUnavailable => 'Stocare securizată indisponibilă';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nu a putut accesa breloul de chei de sistem. Conectarea poate continua, dar stocarea securizată a token-ului poate fi indisponibilă până când inelul de chei este deblocat.';

  @override
  String get ok => 'Bine';

  @override
  String get settingsAppearanceTheme => 'Tema aplicației';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Comutați între Moonfin și Neon Pulse fără a reporni aplicația';

  @override
  String get keyboardPreferSystemIme => 'Prefer tastatura de sistem';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Utilizați metoda de introducere a dispozitivului în mod implicit pentru introducerea textului';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Aspectul actual de Moonfin pe care ați ajuns să-l iubești cu toții';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Stil Synthwave cu strălucire magenta, text cyan și contrast cromat mai puternic';

  @override
  String get embyConnectSignInSubtitle => 'Conectați-vă cu contul Emby Connect';

  @override
  String get emailOrUsername => 'E-mail sau Nume de utilizator';

  @override
  String get selectAServer => 'Selectați un server';

  @override
  String get tryAgain => 'Încearcă din nou';

  @override
  String get noLinkedServers =>
      'Nu există servere conectate la acest cont Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Acreditări Emby Connect nevalide';

  @override
  String get invalidEmbyConnectLogin =>
      'Nume de utilizator sau parolă Emby Connect nevalid';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serverul nu acceptă schimbul Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Eroare de rețea la contactarea Emby Connect sau serverul selectat';

  @override
  String get loadingLinkedServers => 'Se încarcă serverele conectate...';

  @override
  String get connectingToServerEllipsis => 'Se conectează la server...';

  @override
  String get noReachableAddress =>
      'Nu a fost furnizată nicio adresă accesibilă';

  @override
  String get invalidServerExchangeResponse =>
      'Răspuns nevalid de la punctul final de schimb de server';

  @override
  String unableToConnectTo(String target) {
    return 'Nu se poate conecta la $target';
  }

  @override
  String get exitApp => 'Ieși din Moonfin?';

  @override
  String get exitAppConfirmation => 'Ești sigur că vrei să ieși?';

  @override
  String get exit => 'Ieșire';

  @override
  String get noHomeRowsLoaded => 'Nu au putut fi încărcate rânduri de acasă';

  @override
  String get noHomeRowsHint =>
      'Încercați să reîmprospătați sau să reduceți secțiunile active de acasă.';

  @override
  String get retryHomeRows => 'Reîncercați rândurile de pornire';

  @override
  String get guide => 'Ghid';

  @override
  String get recordings => 'Înregistrări';

  @override
  String get schedule => 'Programa';

  @override
  String get series => 'Serie';

  @override
  String get noItemsFound => 'Nu s-au găsit articole';

  @override
  String get home => 'Acasă';

  @override
  String get browseAll => 'Răsfoiți toate';

  @override
  String get genres => 'Genuri';

  @override
  String get collectionPlaceholder => 'Elementele de colecție vor apărea aici';

  @override
  String get browseByLetter => 'Răsfoiți după literă';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Răsfoirea alfabetică va apărea aici';

  @override
  String get suggestions => 'Sugestii';

  @override
  String get suggestionsPlaceholder => 'Elementele sugerate vor apărea aici';

  @override
  String get failedToLoadLibraries => 'Nu s-au încărcat bibliotecile';

  @override
  String get noLibrariesFound => 'Nu s-au găsit biblioteci';

  @override
  String get library => 'Bibliotecă';

  @override
  String get displaySettings => 'Setări de afișare';

  @override
  String get allGenres => 'Toate Genurile';

  @override
  String get noGenresFound => 'Nu s-au găsit genuri';

  @override
  String failedToLoadFolderError(String error) {
    return 'Nu s-a putut încărca dosarul: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Acest folder este gol';

  @override
  String itemCountLabel(int count) {
    return '$count articole';
  }

  @override
  String get failedToLoadFavorites => 'Nu s-au încărcat favorite';

  @override
  String get retry => 'Reîncercați';

  @override
  String get noFavoritesYet => 'Încă nu sunt favorite';

  @override
  String get favorites => 'Favorite';

  @override
  String totalCountItems(int count) {
    return '$count Articole';
  }

  @override
  String get continuing => 'Continuând';

  @override
  String get ended => 'Încheiat';

  @override
  String get sortAndFilter => 'Sortare și filtrare';

  @override
  String get type => 'Tip';

  @override
  String get sortBy => 'Filtrează după';

  @override
  String get display => 'Afişa';

  @override
  String get imageType => 'Tip imagine';

  @override
  String get posterSize => 'Dimensiune poster';

  @override
  String get small => 'Mic';

  @override
  String get medium => 'Mediu';

  @override
  String get large => 'Mare';

  @override
  String get extraLarge => 'Extra Large';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genuri';
  }

  @override
  String get views => 'Vizualizări';

  @override
  String get albums => 'Albume';

  @override
  String get albumArtists => 'Artisti de album';

  @override
  String get artists => 'Artiști';

  @override
  String get bookmarks => 'Marcaje';

  @override
  String get noSavedBookmarks =>
      'Încă nu au fost salvate marcaje pentru acest titlu.';

  @override
  String get openBook => 'Carte deschisă';

  @override
  String get chapter => 'Capitol';

  @override
  String get page => 'Pagină';

  @override
  String get bookmark => 'Marcaj';

  @override
  String get justNow => 'Chiar acum';

  @override
  String minutesAgo(int count) {
    return '${count}m în urmă';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h în urmă';
  }

  @override
  String daysAgo(int count) {
    return '${count}d acum';
  }

  @override
  String get discoverySubjects => 'Subiecte de descoperire';

  @override
  String get pickDiscoverySubjects =>
      'Alegeți ce fluxuri de subiecte să afișați în Discover.';

  @override
  String get apply => 'Aplicați';

  @override
  String get openLink => 'Deschide Link';

  @override
  String get scanWithYourPhone => 'Scanează cu telefonul tău';

  @override
  String get audiobookGenres => 'Genuri de cărți audio';

  @override
  String get pickAudiobookGenres =>
      'Alegeți ce genuri să afișați în Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Descoperiți cărți audio';

  @override
  String get librivoxDescription =>
      'Titluri populare de domeniu public de la LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titluri';
  }

  @override
  String get scrollLeft => 'Derulați spre stânga';

  @override
  String get scrollRight => 'Derulați spre dreapta';

  @override
  String get couldNotLoadGenre => 'Nu s-a putut încărca acest gen acum.';

  @override
  String get continueReading => 'Continuă să citești';

  @override
  String get savedHighlights => 'Repere salvate';

  @override
  String get continueListening => 'Ascultați în continuare';

  @override
  String get listen => 'Asculta';

  @override
  String get resume => 'Relua';

  @override
  String get failedToLoadLibrary => 'Nu s-a putut încărca biblioteca';

  @override
  String get popularNow => 'Popular acum';

  @override
  String get savedForLater => 'Salvat pentru mai târziu';

  @override
  String get topListens => 'Top Ascultări';

  @override
  String get unreadDiscoveries => 'Descoperiri necitite';

  @override
  String get pickUpAgain => 'Ridică din nou';

  @override
  String get bookHighlightsDescription =>
      'Cărțile tale cu cele mai importante, favorite sau progresul lecturii.';

  @override
  String get handPickedFromLibrary => 'Alegeți manual din biblioteca dvs.';

  @override
  String get handPickedFromListeningQueue =>
      'Alegeți manual din coada dvs. de ascultare.';

  @override
  String get booksWithHighlights =>
      'Cărți cu momente importante, favorite sau progrese în lectură.';

  @override
  String get jumpBackNarration =>
      'Sari înapoi în narațiune fără a-ți căuta locul.';

  @override
  String get unreadBooksReady =>
      'Cărți necitite gata pentru următoarea oră de liniște.';

  @override
  String get quickAccessFavorites =>
      'Acces rapid la cărțile la care revii mereu.';

  @override
  String get searchAudiobooks => 'Căutați cărți audio';

  @override
  String get searchYourLibrary => 'Căutați în biblioteca dvs';

  @override
  String get pickUpStory => 'Reluați povestea de unde ați rămas';

  @override
  String get savedPlacesChapters =>
      'Locurile tale salvate și capitolele neterminate';

  @override
  String authorsCount(int count) {
    return '$count autori';
  }

  @override
  String genresCount(int count) {
    return '$count genuri';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% finalizat';
  }

  @override
  String get readyWhenYouAre => 'Gata când ești';

  @override
  String get details => 'Detalii';

  @override
  String get listeningRoom => 'Sala de ascultare';

  @override
  String get bookmarksAndProgress => 'Marcaje și progres';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titluri aranjate pentru a le citi mai întâi.';
  }

  @override
  String get titles => 'Titluri';

  @override
  String get allTitles => 'Toate Titlurile';

  @override
  String get authors => 'Autorii';

  @override
  String get browseByAuthor => 'Răsfoiți după autor';

  @override
  String get browseByGenre => 'Răsfoiți după gen';

  @override
  String get discover => 'Descoperi';

  @override
  String get trendingTitlesOpenLibrary =>
      'Titluri populare pe subiecte din Open Library.';

  @override
  String get noBookmarkedItems => 'Niciun element marcat încă';

  @override
  String get nothingMatchesSection =>
      'Nimic nu se potrivește încă cu această secțiune. Încercați o altă filă sau reveniți după ce se termină sincronizarea bibliotecii.';

  @override
  String get audiobooks => 'Cărți audio';

  @override
  String noLabelFound(String label) {
    return 'Nu s-a găsit $label';
  }

  @override
  String get folder => 'Pliant';

  @override
  String get filters => 'Filtre';

  @override
  String get readingStatus => 'Stare de citire';

  @override
  String get playedStatus => 'Stare de joc';

  @override
  String get readStatus => 'Citire';

  @override
  String get watched => 'Privit';

  @override
  String get unread => 'Necitit';

  @override
  String get unwatched => 'Nevizionat';

  @override
  String get seriesStatus => 'Stare serie';

  @override
  String get allLibraries => 'Toate Bibliotecile';

  @override
  String get books => 'Cărți';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Autor necunoscut';

  @override
  String get uncategorized => 'Necategorizat';

  @override
  String get overview => 'Prezentare generală';

  @override
  String get noLibrivoxDescription =>
      'Nu există încă o descriere furnizată de LibriVox pentru acest titlu.';

  @override
  String get readers => 'Cititorii';

  @override
  String get openLinks => 'Deschide Link-uri';

  @override
  String get librivoxPage => 'Pagina LibriVox';

  @override
  String get internetArchive => 'Arhiva Internet';

  @override
  String get rssFeed => 'Flux RSS';

  @override
  String get downloadZip => 'Descărcați Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count secțiuni';
  }

  @override
  String firstPublished(int year) {
    return 'Prima publicat $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Nu există încă o prezentare generală disponibilă din Open Library pentru acest titlu.';

  @override
  String get subjects => 'Subiecte';

  @override
  String get all => 'Toate';

  @override
  String booksCount(int count) {
    return '$count cărți';
  }

  @override
  String get couldNotLoadSubject => 'Nu s-a putut încărca acest subiect acum.';

  @override
  String get audiobookDetails => 'Detalii audiobook';

  @override
  String authorsCountTitle(int count) {
    return '$count Autori';
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
  String get trackList => 'Lista de piese';

  @override
  String get itemListPlaceholder => 'Lista articolelor va apărea aici';

  @override
  String get favoriteTracksPlaceholder => 'Melodiile preferate vor apărea aici';

  @override
  String get failedToLoad => 'Nu s-a putut încărca';

  @override
  String get delete => 'Şterge';

  @override
  String get save => 'Salva';

  @override
  String get moreLikeThis => 'Mai mult ca asta';

  @override
  String get castAndCrew => 'Distribuție și echipaj';

  @override
  String get collection => 'Colectare';

  @override
  String get episodes => 'Episoade';

  @override
  String get nextUp => 'Următorul';

  @override
  String get seasons => 'anotimpuri';

  @override
  String get chapters => 'Capitole';

  @override
  String get features => 'Caracteristici';

  @override
  String get movies => 'Filme';

  @override
  String get musicVideos => 'Videoclipuri muzicale';

  @override
  String get other => 'Alte';

  @override
  String get discography => 'Discografie';

  @override
  String get similarArtists => 'Artiști similari';

  @override
  String get tableOfContents => 'Cuprins';

  @override
  String get tracklist => 'Lista de melodii';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biografie';

  @override
  String get authorDetails => 'Detalii autor';

  @override
  String get noOverviewAvailable =>
      'Nu există încă o prezentare generală disponibilă pentru acest titlu.';

  @override
  String get noBiographyAvailable =>
      'Nicio biografie disponibilă pentru acest autor.';

  @override
  String get noBooksFound => 'Nu s-au găsit cărți pentru acest autor.';

  @override
  String get unableToLoadAuthorDetails =>
      'Nu se pot încărca detaliile autorului în acest moment.';

  @override
  String published(int year) {
    return 'Publicat $year';
  }

  @override
  String get publicationDateUnknown => 'Data publicării necunoscută';

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
    return 'Se termină la $time';
  }

  @override
  String endsIn(String time) {
    return 'Ends in $time';
  }

  @override
  String get view => 'Vedere';

  @override
  String get resumeReading => 'Reluați lectura';

  @override
  String get read => 'Citire';

  @override
  String resumeFrom(String position) {
    return 'Reluați de la $position';
  }

  @override
  String get play => 'Juca';

  @override
  String get startOver => 'Începe de la capăt';

  @override
  String get restart => 'Repornire';

  @override
  String get readOffline => 'Citiți offline';

  @override
  String get playOffline => 'Joacă offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtitrări';

  @override
  String get version => 'Versiune';

  @override
  String get cast => 'Distribuție';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Terminat';

  @override
  String get favorited => 'Favorite';

  @override
  String get favorite => 'Favorit';

  @override
  String get playlist => 'Lista de redare';

  @override
  String get downloaded => 'Descărcat';

  @override
  String get downloadAll => 'Descărcați toate';

  @override
  String get download => 'Descărcați';

  @override
  String get deleteDownloaded => 'Șterge descărcat';

  @override
  String get goToSeries => 'Accesați Seria';

  @override
  String get editMetadata => 'Editați metadatele';

  @override
  String get less => 'Mai puțin';

  @override
  String get more => 'Mai mult';

  @override
  String get deleteItem => 'Ștergeți elementul';

  @override
  String get deletePlaylist => 'Șterge lista de redare';

  @override
  String get deletePlaylistMessage =>
      'Ștergeți această listă de redare de pe server?';

  @override
  String get deleteItemMessage => 'Ștergeți acest articol de pe server?';

  @override
  String get failedToDeletePlaylist => 'Nu s-a șters lista de redare';

  @override
  String get failedToDeleteItem => 'Elementul nu a putut fi șters';

  @override
  String get renamePlaylist => 'Redenumiți lista de redare';

  @override
  String get playlistName => 'Numele listei de redare';

  @override
  String get deleteDownloadedAlbum => 'Ștergeți albumul descărcat';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Ștergeți melodiile descărcate pentru „$title”?';
  }

  @override
  String get downloadedTracksDeleted => 'Melodiile descărcate au fost șterse';

  @override
  String get downloadedTracksDeleteFailed =>
      'Unele piese descărcate nu au putut fi șterse';

  @override
  String get noTracksLoaded => 'Nicio piesă încărcată';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Nu s-a încărcat $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Se descarcă $title ($count articole)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Sigur doriți să ștergeți „$name” de pe server? Această acțiune nu poate fi anulată.';
  }

  @override
  String get itemDeleted => 'Element șters';

  @override
  String get noPlayableTrailerFound =>
      'Nu a fost găsit niciun trailer care poate fi redat.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Format de carte neacceptat: .$extension';
  }

  @override
  String get audioTrack => 'Pista audio';

  @override
  String get subtitleTrack => 'Piesa de subtitrare';

  @override
  String get none => 'Nici unul';

  @override
  String get downloadSubtitlesLabel => 'Descărcați subtitrări...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Căutați folosind pluginul OpenSubtitles';

  @override
  String get downloadSubtitles => 'Descărcați subtitrări';

  @override
  String get selectedSubtitleInvalid => 'Subtitrarea selectată este nevalidă.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitrare descărcată și selectată: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitrare descărcată. Poate dura un moment să apară în timp ce Jellyfin reîmprospătează elementul.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nu s-au găsit subtitrări la distanță pentru $language.';
  }

  @override
  String get selectVersion => 'Selectați versiunea';

  @override
  String versionNumber(int number) {
    return 'Versiunea $number';
  }

  @override
  String get downloadAllQuality => 'Descărcați toate — Calitate';

  @override
  String get downloadQuality => 'Calitate descărcare';

  @override
  String get originalFileNoReencoding => 'Fișier original, fără re-codificare';

  @override
  String get originalFilesNoReencoding =>
      'Fișiere originale, fără recodificare';

  @override
  String get noEpisodesLoaded => 'Niciun episod încărcat';

  @override
  String downloadingItem(String name, String quality) {
    return 'Se descarcă $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Ștergeți fișierele descărcate';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Ștergeți fișierele locale pentru $typeLabel?\n\nAcest lucru va elibera spațiu de stocare. Puteți descărca din nou mai târziu.';
  }

  @override
  String get downloadedFilesDeleted => 'Fișierele descărcate au fost șterse';

  @override
  String get failedToDeleteFiles => 'Nu s-au șters fișierele';

  @override
  String get deleteFiles => 'Ștergeți fișierele';

  @override
  String get director => 'DIRECTOR';

  @override
  String get writers => 'SCRIITORII';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count mai multe';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episoade';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Episodul $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Capitolul $number';
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
    return 'Născut $date';
  }

  @override
  String died(String date) {
    return 'A murit $date';
  }

  @override
  String age(int age) {
    return 'Vârsta $age';
  }

  @override
  String get showLess => 'Arată mai puțin';

  @override
  String get readMore => 'Citeşte mai mult';

  @override
  String get shuffle => 'Amesteca';

  @override
  String downloadsCount(int count) {
    return '$count descărcări';
  }

  @override
  String get perfectMatch => 'Potrivire perfectă';

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
    return 'Subtitrarea la distanță $action necesită permisiunea de gestionare a subtitrarilor Jellyfin pentru acest utilizator.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Acest articol nu a putut fi găsit pe server pentru subtitrarea la distanță $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Subtitrarea la distanță $action a eșuat: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Subtitrarea la distanță $action a eșuat (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Subtitrarea la distanță a $action nu a reușit.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'toate episoadele descărcate pentru „$name”';
  }

  @override
  String get deleteSeasonFiles => 'toate episoadele descărcate din acest sezon';

  @override
  String get stillWatching => 'Încă vizionați?';

  @override
  String get unableToLoadTrailerStream =>
      'Nu se poate încărca fluxul trailerului.';

  @override
  String get trailerTimedOut =>
      'Timpul remorcii a expirat în timpul încărcării.';

  @override
  String get playbackFailedForTrailer =>
      'Redarea a eșuat pentru această trailer.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Proiectarea nu este disponibilă în timpul redării offline.';

  @override
  String castActionFailed(String label, String error) {
    return 'Acțiunea $label a eșuat: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Nu s-a putut seta volumul de difuzare: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Comenzi';
  }

  @override
  String get deviceVolume => 'Volumul dispozitivului';

  @override
  String get unavailable => 'Indisponibil';

  @override
  String get pause => 'Pauză';

  @override
  String get syncPosition => 'Poziție de sincronizare';

  @override
  String stopCast(String label) {
    return 'Opriți $label';
  }

  @override
  String get queueIsEmpty => 'Coada este goală';

  @override
  String trackNumber(int number) {
    return 'Urmăriți $number';
  }

  @override
  String get remotePlayback => 'Redare de la distanță';

  @override
  String get castingToGoogleCast => 'Se proiectează în Google Cast';

  @override
  String get castingViaAirPlay => 'Casting prin AirPlay';

  @override
  String get castingViaDlna => 'Casting prin DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds secunde';
  }

  @override
  String get longPressToUnlock => 'Apăsați lung pentru a debloca';

  @override
  String get off => 'Oprit';

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
  String get bitrateOverride => 'Suprascrierea ratei de biți';

  @override
  String get audioDelay => 'Întârziere audio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Întârziere subtitrare';

  @override
  String get reset => 'Resetați';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get playbackInformation => 'Informații de redare';

  @override
  String get playback => 'Redare';

  @override
  String get playMethod => 'Metoda de joc';

  @override
  String get directPlay => 'Redare directă';

  @override
  String get directStream => 'Direct Stream';

  @override
  String get transcoding => 'Transcodare';

  @override
  String get transcodeReasons => 'Motive pentru transcodare';

  @override
  String get player => 'Player';

  @override
  String get container => 'Container';

  @override
  String get bitrate => 'Rata de biți';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Rezoluţie';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Rata de biți video';

  @override
  String get track => 'Urmări';

  @override
  String get channels => 'Canale';

  @override
  String get audioBitrate => 'Bitrate audio';

  @override
  String get sampleRate => 'Rata de eșantionare';

  @override
  String get format => 'Format';

  @override
  String get external => 'Extern';

  @override
  String get embedded => 'Încorporat';

  @override
  String castSessionError(String protocol) {
    return '$protocol eroare de sesiune';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Nu s-au încărcat detaliile cărții: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Redarea EPUB în aplicație nu este încă disponibilă pe această platformă.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Acest format (.$extension) nu poate fi redat încă în aplicație.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Redarea documentelor încorporate nu este disponibilă pe această platformă.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nu s-a putut deschide vizualizatorul extern.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Nu s-a putut deschide cititorul în aplicație: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Marcaj salvat deja la $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Marcaj adăugat: $label';
  }

  @override
  String get noBookmarksYet =>
      'Încă nu există marcaje.\nAtingeți pictograma marcaj în timp ce citiți pentru a vă salva poziția.';

  @override
  String get noTableOfContentsAvailable => 'Nu este disponibil un cuprins';

  @override
  String pageLabel(int number) {
    return 'Pagina $number';
  }

  @override
  String get position => 'Poziţie';

  @override
  String get bookReader => 'Cititor de carte';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% citit';
  }

  @override
  String get updating => 'Se actualizează...';

  @override
  String get markUnread => 'Marcați ca necitit';

  @override
  String get markAsRead => 'Marcați ca Citit';

  @override
  String get reloadReader => 'Reîncărcați Reader';

  @override
  String get noPagesFound => 'Nu au fost găsite pagini.';

  @override
  String get failedToDecodePageImage => 'Nu s-a putut decoda imaginea paginii.';

  @override
  String resetZoom(String zoom) {
    return 'Resetați zoom-ul (${zoom}x)';
  }

  @override
  String get singlePage => 'O singură pagină';

  @override
  String get twoPageSpread => 'Răspândire pe două pagini';

  @override
  String get addBookmark => 'Adăugați marcaj';

  @override
  String get bookmarksEllipsis => 'Marcaje...';

  @override
  String get markedAsRead => 'Marcat ca citit';

  @override
  String get markedAsUnread => 'Marcat ca necitit';

  @override
  String failedToUpdateReadState(String error) {
    return 'Nu s-a putut actualiza starea de citire: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistem';

  @override
  String get themeLight => 'Tema: Lumina';

  @override
  String get themeDark => 'Tema: Întuneric';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Inversarea culorilor (aspect fix)';

  @override
  String get invertColorsPdf => 'Inversați culorile (PDF)';

  @override
  String get preparingInAppReader => 'Se pregătește cititorul în aplicație...';

  @override
  String get pdfDataNotAvailable => 'Datele PDF nu sunt disponibile.';

  @override
  String get readerFallbackModeActive => 'Modul alternativ cititor activ';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Această platformă nu poate găzdui motorul de documente încorporat pentru fișierele $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Utilizați Reload Reader după trecerea la o platformă țintă acceptată (Android, iOS, macOS).';

  @override
  String get openExternally => 'Deschideți extern';

  @override
  String get noEpubChaptersFound => 'Nu s-au găsit capitole EPUB.';

  @override
  String get readerNotReady => 'Cititorul nu este pregătit.';

  @override
  String get seriesRecordings => 'Înregistrări în serie';

  @override
  String get now => 'Acum';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Ştiri';

  @override
  String get kids => 'Copii';

  @override
  String get premiere => 'Premieră';

  @override
  String get guideTimeline => 'Cronologia ghidului';

  @override
  String failedToLoadGuide(String error) {
    return 'Nu s-a încărcat ghidul: $error';
  }

  @override
  String get noChannelsFound => 'Nu s-au găsit canale';

  @override
  String get liveBadge => 'TRĂI';

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Eliminat din canalele preferate';

  @override
  String get addedToFavoriteChannels => 'Adăugat la canalele favorite';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Nu s-a putut actualiza canalul preferat';

  @override
  String get unfavoriteChannel => 'Canal nefavorit';

  @override
  String get favoriteChannel => 'Canalul preferat';

  @override
  String get record => 'Înregistra';

  @override
  String get cancelRecordingAction => 'Anulează înregistrarea';

  @override
  String get programSetToRecord => 'Program setat pentru înregistrare';

  @override
  String get recordingCancelled => 'Înregistrare anulată';

  @override
  String get unableToCreateRecording => 'Nu se poate crea înregistrarea';

  @override
  String get watch => 'Ceas';

  @override
  String get close => 'Aproape';

  @override
  String failedToPlayChannel(String name) {
    return 'Nu s-a putut juca $name';
  }

  @override
  String get failedToLoadRecordings =>
      'Înregistrările nu au putut fi încărcate';

  @override
  String get scheduledInNext24Hours => 'Programat în următoarele 24 de ore';

  @override
  String get recentRecordings => 'Înregistrări recente';

  @override
  String get tvSeries => 'Seriale TV';

  @override
  String get failedToLoadSchedule => 'Nu s-a încărcat programul';

  @override
  String get noScheduledRecordings => 'Nu există înregistrări programate';

  @override
  String get cancelRecording => 'Anulați înregistrarea?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Anulați înregistrarea programată a „$name”?';
  }

  @override
  String get no => 'Nu';

  @override
  String get yesCancel => 'Da, Anulează';

  @override
  String get failedToCancelRecording => 'Nu s-a anulat înregistrarea';

  @override
  String get failedToLoadSeriesRecordings =>
      'Nu s-au încărcat înregistrările în serie';

  @override
  String get noSeriesRecordings => 'Fără înregistrări în serie';

  @override
  String get cancelSeriesRecording => 'Anulează înregistrarea seriei';

  @override
  String get cancelSeriesRecordingQuestion => 'Anulați înregistrarea seriei?';

  @override
  String stopRecordingName(String name) {
    return 'Opriți înregistrarea „$name”?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nu s-a putut anula înregistrarea seriei';

  @override
  String get searchThisLibrary => 'Căutați această bibliotecă...';

  @override
  String get searchEllipsis => 'Căutare...';

  @override
  String noResultsForQuery(String query) {
    return 'Niciun rezultat pentru „$query”';
  }

  @override
  String searchFailedError(String error) {
    return 'Căutarea eșuată: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Tip de cont Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Local';

  @override
  String get savedMedia => 'Media salvate';

  @override
  String get tvShows => 'Emisiuni TV';

  @override
  String get music => 'Muzică';

  @override
  String get musicAlbums => 'Albume muzicale';

  @override
  String get noMediaInFilter => 'Nu există conținut media în acest filtru';

  @override
  String get noDownloadedMediaYet => 'Niciun conținut media descărcat încă';

  @override
  String get browseLibrary => 'Răsfoiți bibliotecă';

  @override
  String get deleteDownload => 'Șterge descărcarea';

  @override
  String removeItemAndFiles(String name) {
    return 'Eliminați „$name” și fișierele sale?';
  }

  @override
  String tracksCount(int count) {
    return '$count piese';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Redare album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Nu s-a putut încărca albumul: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Nu s-au găsit piese descărcate pentru $name.';
  }

  @override
  String get season => 'Sezon';

  @override
  String get errorLoadingEpisodes => 'Eroare la încărcarea episoadelor';

  @override
  String get noDownloadedEpisodes => 'Niciun episod descărcat';

  @override
  String get deleteEpisode => 'Șterge Episodul';

  @override
  String removeName(String name) {
    return 'Eliminați „$name”?';
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
    return 'Episodul $number';
  }

  @override
  String get seriesNotFound => 'Seria nu a fost găsită';

  @override
  String get errorLoadingSeries => 'Eroare la încărcarea seriei';

  @override
  String get downloadedEpisodes => 'Episoade descărcate';

  @override
  String seasonNumber(int number) {
    return 'Sezon $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Speciale';

  @override
  String get deleteSeason => 'Șterge sezonul';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Ștergeți toate episoadele descărcate din $season?';
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
  String get storageManagement => 'Managementul stocării';

  @override
  String get storageBreakdown => 'Defalcarea stocării';

  @override
  String get downloadedItems => 'Articole descărcate';

  @override
  String get storageLimit => 'Limită de stocare';

  @override
  String get noLimit => 'Fără limită';

  @override
  String get deleteAllDownloads => 'Ștergeți toate descărcările';

  @override
  String get deleteAllDownloadsWarning =>
      'Aceasta va elimina toate fișierele media descărcate și nu poate fi anulată.';

  @override
  String get deleteAll => 'Ștergeți toate';

  @override
  String get deleteSelected => 'Ștergeți selectat';

  @override
  String deleteSelectedCount(int count) {
    return 'Ștergeți $count articolele descărcate?';
  }

  @override
  String get musicAndAudiobooks => 'Muzică și cărți audio';

  @override
  String get images => 'Imagini';

  @override
  String get database => 'Baza de date';

  @override
  String ofStorageLimit(String limit) {
    return 'din limita $limit';
  }

  @override
  String get settings => 'Setări';

  @override
  String get authentication => 'Autentificare';

  @override
  String get autoLoginServerManagement =>
      'Conectare automată, administrare server';

  @override
  String get pinCode => 'Cod PIN';

  @override
  String get setUpPinCodeProtection => 'Configurați protecția prin codul PIN';

  @override
  String get parentalControls => 'Control parental';

  @override
  String get contentRatingRestrictions =>
      'Restricții de evaluare a conținutului';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, rezoluție, comportament';

  @override
  String get languageSizeAppearance => 'Limbă, dimensiune, aspect';

  @override
  String get qualityStorage => 'Calitate, depozitare';

  @override
  String get serverSyncAndPluginStatus =>
      'Sincronizarea serverului și starea pluginului';

  @override
  String get mediaRequestIntegration => 'Integrarea cererilor media';

  @override
  String get switchServer => 'Schimbați serverul';

  @override
  String get signOut => 'Sign out';

  @override
  String get versionLicenses => 'Versiune, licențe';

  @override
  String get account => 'Cont';

  @override
  String get signInAndSecurity => 'Conectare și securitate';

  @override
  String get administration => 'Administrare';

  @override
  String get serverSettingsUsersLibraries =>
      'Setări server, utilizatori, biblioteci';

  @override
  String get customization => 'Personalizare';

  @override
  String get themeAndLayout => 'Tema și aspectul';

  @override
  String get videoAndSubtitles => 'Video și subtitrări';

  @override
  String get integrations => 'Integrari';

  @override
  String get pluginAndRequests => 'Plugin și solicitări';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personalizați contul, redarea și comportamentul interfeței';

  @override
  String optionsCount(int count) {
    return '$count opțiuni';
  }

  @override
  String get themeAndAppearance => 'Temă și aspect';

  @override
  String get focusBorderColor => 'Culoarea chenarului de focalizare';

  @override
  String get watchedIndicators => 'Indicatori urmăriți';

  @override
  String get always => 'Întotdeauna';

  @override
  String get hideUnwatched => 'Ascunde Nevizionat';

  @override
  String get episodesOnly => 'Doar episoade';

  @override
  String get never => 'Nu';

  @override
  String get focusExpansionAnimation => 'Animație de extindere a focalizării';

  @override
  String get desktopUiScale => 'Scala UI pentru desktop';

  @override
  String get scaleFocusedCards =>
      'Scalați cărți și plăci focalizate sau hoverate';

  @override
  String get backgroundBackdrops => 'Fundaluri de fundal';

  @override
  String get showBackdropImages =>
      'Afișați imagini de fundal în spatele conținutului';

  @override
  String get seriesThumbnails => 'Miniaturi ale seriei';

  @override
  String get seriesThumbnailsDescription =>
      'Numai episoade: utilizați ilustrații ale seriei care se potrivesc cu fiecare tip de imagine de rând';

  @override
  String get homeRowInfoOverlay =>
      'Suprapunere de informații pentru rândul principal';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Afișați titlul și metadatele atunci când răsfoiți rândurile de pornire';

  @override
  String get clockDisplay => 'Afișarea ceasului';

  @override
  String get inMenus => 'În Meniuri';

  @override
  String get inVideo => 'În Video';

  @override
  String get seasonalEffects => 'Efecte sezoniere';

  @override
  String get seasonalEffectsDescription =>
      'Efecte vizuale și decorațiuni de sezon';

  @override
  String get snow => 'Zăpadă';

  @override
  String get fireworks => 'Focuri de artificii';

  @override
  String get confetti => 'Confeti';

  @override
  String get fallingLeaves => 'Frunze care cad';

  @override
  String get themeMusic => 'Muzica tematica';

  @override
  String get playThemeMusicOnDetailPages =>
      'Redați muzică tematică pe paginile de detalii';

  @override
  String get themeMusicVolume => 'Volumul muzicii tematice';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Muzică tematică pe rândurile de acasă';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Joacă atunci când navighezi pe ecranul de pornire';

  @override
  String get detailsBackgroundBlur => 'Detalii Blur de fundal';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Încețoșare de fundal de navigare';

  @override
  String get maxStreamingBitrate => 'Rata de biți de streaming maximă';

  @override
  String get maxResolution => 'Rezolutie maxima';

  @override
  String get playerZoomMode => 'Modul Zoom jucător';

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
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Decupare automată';

  @override
  String get stretch => 'Întinde';

  @override
  String get refreshRateSwitching => 'Comutarea ratei de reîmprospătare';

  @override
  String get disabled => 'Dezactivat';

  @override
  String get scaleOnTv => 'Scala la televizor';

  @override
  String get scaleOnDevice => 'Scalare pe dispozitiv';

  @override
  String get trickPlay => 'Trick Play';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Afișați miniaturile de previzualizare când căutați';

  @override
  String get showDescriptionOnPause => 'Afișați descrierea în pauză';

  @override
  String get dimVideoShowOverview =>
      'Întunecă videoclipul și arată textul de prezentare generală când este întrerupt';

  @override
  String get osdLockButton => 'Buton de blocare OSD';

  @override
  String get osdLockButtonDescription =>
      'Afișați un buton de blocare care blochează introducerea tactilă până când este apăsat lung';

  @override
  String get audioBehavior => 'Comportament audio';

  @override
  String get downmixToStereo => 'Downmix la stereo';

  @override
  String get defaultAudioLanguage => 'Limba audio implicită';

  @override
  String get autoServerDefault => 'Auto (Server implicit)';

  @override
  String get english => 'engleză';

  @override
  String get spanish => 'spaniolă';

  @override
  String get french => 'franceză';

  @override
  String get german => 'german';

  @override
  String get italian => 'italian';

  @override
  String get portuguese => 'portugheză';

  @override
  String get japanese => 'japonez';

  @override
  String get korean => 'coreean';

  @override
  String get chinese => 'chinez';

  @override
  String get russian => 'rusă';

  @override
  String get arabic => 'arabic';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'olandeză';

  @override
  String get swedish => 'suedez';

  @override
  String get norwegian => 'norvegian';

  @override
  String get danish => 'danez';

  @override
  String get finnish => 'finlandeză';

  @override
  String get polish => 'Lustrui';

  @override
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'Suport TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream audio DTS numai către AVR; necesită suport pentru receptor și pistă sursă DTS';

  @override
  String get enableTrueHdAudio =>
      'Activați audio TrueHD (s-ar putea să nu funcționeze pe toate platformele)';

  @override
  String get settingsAudioOutputMode => 'Modul de ieșire audio';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Codec de rezervă audio';

  @override
  String get settingsAudioFallbackAacStereo => 'Stereo AAC';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (avansat)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Activați numai formatele pe care le acceptă AVR sau HDMI.';

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
      'Bitstream Dolby Digital Plus (EAC3) către un decodor extern.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos prin EAC3 (JOC) către decodor extern.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (include nucleul DTS) către decodor extern.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD cu metadate Atmos către decodor extern.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Capabilități audio detectate';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Nu este disponibil încă un instantaneu al capacității de rulare.';

  @override
  String get settingsAudioRouteLabel => 'Traseu';

  @override
  String get settingsAudioDecodeLabel => 'Decodați';

  @override
  String get settingsAudioPassthroughLabel => 'trecere';

  @override
  String get settingsAudioHdRoute => 'Traseu audio HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Difuzor';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnosticare';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Nivelul video';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Gama video';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Codec de subtitrare';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Codecuri audio permise';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Codecuri audio HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Codecuri audio HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'trecere audio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Rută audio activă';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Suport audio HD Route';

  @override
  String get nightMode => 'Modul noapte';

  @override
  String get compressDynamicRange => 'Comprimați intervalul dinamic';

  @override
  String get advancedMpv => 'mpv avansat';

  @override
  String get enableCustomMpvConf => 'Activați mpv.conf personalizat';

  @override
  String get applyMpvConfBeforePlayback =>
      'Aplicați un mpv.conf specificat de utilizator înainte de a începe redarea';

  @override
  String get unsafeAdvancedMpvOptions => 'Opțiuni avansate mpv nesigure';

  @override
  String get unsafeMpvOptionsDescription =>
      'Permiteți un set mai larg de opțiuni mpv. Poate întrerupe comportamentul de redare.';

  @override
  String get hardwareDecoding => 'Decodare hardware';

  @override
  String get hardwareDecodingSubtitle =>
      'Poate îmbunătăți performanța, dar poate cauza probleme de redare pe unele dispozitive.';

  @override
  String get nextUpAndQueuing => 'Următorul și așteptarea';

  @override
  String get nextUpDisplay => 'Next Up Display';

  @override
  String get extended => 'Extins';

  @override
  String get minimal => 'Minim';

  @override
  String get nextUpTimeout => 'Următorul timp expirat';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Media Queuing';

  @override
  String get autoQueueNextEpisodes =>
      'Pune automat în coadă episoadele următoare';

  @override
  String get stillWatchingPrompt => 'Încă urmăresc Prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'După episoadele $episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Reluați și omiteți';

  @override
  String get resumeRewind => 'Reluați derularea înapoi';

  @override
  String get unpauseRewind => 'Anulați pauza înapoi';

  @override
  String get fiveSeconds => '5 secunde';

  @override
  String get tenSeconds => '10 secunde';

  @override
  String get fifteenSeconds => '15 secunde';

  @override
  String get thirtySeconds => '30 de secunde';

  @override
  String get skipBackLength => 'Sari peste lungime';

  @override
  String get skipForwardLength => 'Lungimea săriți înainte';

  @override
  String get customMpvConfPath => 'Cale personalizată mpv.conf';

  @override
  String get notSetMpvConf =>
      'Nu setat. Moonfin va încerca un mpv.conf implicit în folderele aplicații/date.';

  @override
  String get selectMpvConf => 'Selectați mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Setările de stil (dimensiune, culoare, offset) se aplică subtitrărilor bazate pe text (SRT, VTT, TTML). Subtitrările ASS/SSA folosesc propriul stil încorporat, cu excepția cazului în care „ASS/SSA Direct Play” este dezactivat. Subtitrările bitmap (PGS, DVB, VobSub) nu pot fi modificate.';

  @override
  String get defaultSubtitleLanguage => 'Limba implicită a subtitrarilor';

  @override
  String get defaultToNoSubtitles => 'Implicit, Fără subtitrări';

  @override
  String get turnOffSubtitlesByDefault =>
      'Dezactivați subtitrările în mod prestabilit';

  @override
  String get subtitleSize => 'Dimensiunea subtitrarilor';

  @override
  String get textFillColor => 'Culoarea umplerii textului';

  @override
  String get backgroundColor => 'Culoare de fundal';

  @override
  String get textStrokeColor => 'Culoarea conturului textului';

  @override
  String get subtitleCustomization => 'Personalizare subtitrare';

  @override
  String get subtitleCustomizationDescription =>
      'Personalizați aspectul subtitrarilor';

  @override
  String get subtitlePreviewText => 'Vulpea maro iute sare peste câinele leneș';

  @override
  String get verticalOffset => 'Offset vertical';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles => 'Redare directă subtitrări PGS';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

  @override
  String get directPlayAssSsaSubtitles => 'Redare directă subtitrări ASS/SSA';

  @override
  String get white => 'Alb';

  @override
  String get black => 'Negru';

  @override
  String get yellow => 'Galben';

  @override
  String get green => 'Verde';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'Roşu';

  @override
  String get transparent => 'Transparent';

  @override
  String get semiTransparentBlack => 'Negru semitransparent';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Mobil';

  @override
  String get tv => 'televizor';

  @override
  String loadedProfileSettings(String profile) {
    return 'Au fost încărcate setările profilului $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nu s-au încărcat setările profilului $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Setări locale sincronizate cu profilul $profile.';
  }

  @override
  String get customizationProfile => 'Profil de personalizare';

  @override
  String get customizationProfileDescription =>
      'Alegeți profilul de încărcat, editat și sincronizat. Global se aplică peste tot, cu excepția cazului în care un profil de dispozitiv îl înlocuiește. Punctul verde marchează profilul actual al dispozitivului.';

  @override
  String get loadProfile => 'Încarcă profilul';

  @override
  String get syncing => 'Se sincronizează...';

  @override
  String get syncToProfile => 'Sincronizare cu profil';

  @override
  String get profileSyncHidden => 'Sincronizarea profilului este ascunsă';

  @override
  String get enablePluginSyncDescription =>
      'Activați Sincronizarea pluginului serverului în setările pluginului pentru a afișa comenzile profilului aici.';

  @override
  String get quality => 'Calitate';

  @override
  String get defaultDownloadQuality => 'Calitate implicită a descărcării';

  @override
  String get network => 'Reţea';

  @override
  String get wifiOnlyDownloads => 'Descărcări numai pentru WiFi';

  @override
  String get onlyDownloadOnWifi =>
      'Descărcați numai când sunteți conectat la WiFi';

  @override
  String get storage => 'Depozitare';

  @override
  String get storageUsed => 'Depozitare folosită';

  @override
  String get manage => 'Gestionează';

  @override
  String get calculating => 'De calculat...';

  @override
  String get downloadLocation => 'Descărcați locația';

  @override
  String get defaultLabel => 'Implicit';

  @override
  String get saveToDownloadsFolder => 'Salvați în dosarul Descărcări';

  @override
  String get downloadsVisibleToOtherApps =>
      'Descărcări/Moonfin — vizibil pentru alte aplicații';

  @override
  String get dangerZone => 'Zona de pericol';

  @override
  String get clearAllDownloads => 'Ștergeți toate descărcările';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Schimbați locația de descărcare';

  @override
  String get changeDownloadLocationDescription =>
      'Descărcările noi vor fi salvate în folderul selectat. Descărcările existente vor rămâne în locația lor actuală și pot fi gestionate din setările de stocare.';

  @override
  String get confirm => 'Confirma';

  @override
  String get cannotWriteToFolder =>
      'Nu se poate scrie în folderul selectat. Alegeți o altă locație sau acordați permisiuni de stocare.';

  @override
  String get saveToDownloadsFolderQuestion => 'Salvați în dosarul Descărcări?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Media descărcate va fi salvat în Descărcări/Moonfin pe dispozitivul dvs. Aceste fișiere vor fi vizibile pentru alte aplicații, cum ar fi galeria sau playerul muzical.\n\nDescărcările existente vor rămâne în locația lor actuală.';

  @override
  String get enable => 'Permite';

  @override
  String get clearAllDownloadsWarning =>
      'Aceasta va șterge toate fișierele media descărcate și nu poate fi anulată.';

  @override
  String get clearAll => 'Ștergeți tot';

  @override
  String get navigationStyle => 'Stil de navigare';

  @override
  String get topBar => 'Bara de sus';

  @override
  String get leftSidebar => 'Bara laterală din stânga';

  @override
  String get showShuffleButton => 'Afișați butonul de amestecare';

  @override
  String get showGenresButton => 'Butonul Afișează Genuri';

  @override
  String get showFavoritesButton => 'Butonul Afișați Favorite';

  @override
  String get showLibrariesInToolbar =>
      'Afișați bibliotecile în bara de instrumente';

  @override
  String get showSeerrButton => 'Show Seerr Button';

  @override
  String get navbarOpacity => 'Opacitatea barei de navigare';

  @override
  String get navbarColor => 'Culoarea barei de navigare';

  @override
  String get gray => 'Gri';

  @override
  String get darkBlue => 'Albastru închis';

  @override
  String get purple => 'Violet';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'Marinei';

  @override
  String get charcoal => 'Cărbune';

  @override
  String get brown => 'Maro';

  @override
  String get darkRed => 'Roșu închis';

  @override
  String get darkGreen => 'Verde închis';

  @override
  String get slate => 'Ardezie';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Afișare bibliotecă';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Miniatură';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings => 'Ignorați setările per bibliotecă';

  @override
  String get applyImageTypeToAllLibraries =>
      'Aplicați tipul de imagine tuturor bibliotecilor';

  @override
  String get multiServerLibraries => 'Biblioteci cu mai multe servere';

  @override
  String get showLibrariesFromAllServers =>
      'Afișați bibliotecile de pe toate serverele conectate';

  @override
  String get enableFolderView => 'Activați vizualizarea folderului';

  @override
  String get showFolderBrowsingOption =>
      'Afișează opțiunea de navigare în folder';

  @override
  String get libraryVisibility => 'Vizibilitatea bibliotecii';

  @override
  String get libraryVisibilityDescription =>
      'Comutați vizibilitatea paginii de pornire pentru fiecare bibliotecă. Reporniți Moonfin pentru ca modificările să intre în vigoare.';

  @override
  String get showInNavigation => 'Afișați în navigare';

  @override
  String get showInLatestMedia => 'Afișați în cele mai recente media';

  @override
  String get sourceLibraries => 'Biblioteci sursă';

  @override
  String get sourceCollections => 'Colecții sursă';

  @override
  String get excludedGenres => 'Genuri excluse';

  @override
  String get selectAll => 'Selectați Toate';

  @override
  String itemsSelected(int count) {
    return '$count selectat';
  }

  @override
  String get mediaBar => 'Media Bar';

  @override
  String get mediaSources => 'Surse media';

  @override
  String get behavior => 'Comportament';

  @override
  String get seconds => 'secunde';

  @override
  String get localPreviews => 'Previzualizări locale';

  @override
  String get localPreviewsDescription =>
      'Configurați previzualizările trailerului, media și audio.';

  @override
  String get mediaBarMode => 'Stil Media Bar';

  @override
  String get mediaBarModeDescription =>
      'Alegeți între diverse stiluri de bară media sau dezactivați bara media';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Oprit';

  @override
  String get enableMediaBar => 'Activați bara media';

  @override
  String get showFeaturedContentSlideshow =>
      'Afișați prezentarea de diapozitive de conținut recomandat pe acasă';

  @override
  String get contentType => 'Tip de conținut';

  @override
  String get moviesAndTvShows => 'Filme și emisiuni TV';

  @override
  String get moviesOnly => 'Numai filme';

  @override
  String get tvShowsOnly => 'Doar emisiuni TV';

  @override
  String get itemCount => 'Număr de articole';

  @override
  String get noneSelected => 'Niciunul selectat';

  @override
  String get noneExcluded => 'Niciunul exclus';

  @override
  String get autoAdvance => 'Avansare automată';

  @override
  String get autoAdvanceSlides => 'Avansați automat la următorul diapozitiv';

  @override
  String get autoAdvanceInterval => 'Interval de avans automat';

  @override
  String get trailerPreview => 'Previzualizare trailer';

  @override
  String get autoPlayTrailers =>
      'Redați automat trailerele în bara media după 3 secunde';

  @override
  String get episodePreview => 'Previzualizarea episodului';

  @override
  String get mediaPreview => 'Previzualizare media';

  @override
  String get episodePreviewDescription =>
      'Jucați o previzualizare în linie de 30 de secunde pe cărți concentrate, plasate cu mouse-ul sau apăsate lung';

  @override
  String get mediaPreviewDescription =>
      'Jucați o previzualizare în linie de 30 de secunde pe cărți concentrate, plasate cu mouse-ul sau apăsate lung';

  @override
  String get previewAudio => 'Previzualizare audio';

  @override
  String get enablePreviewAudio =>
      'Activați audio pentru previzualizările trailerului și ale episoadelor';

  @override
  String get latestMedia => 'Cele mai recente media';

  @override
  String get recentlyReleased => 'Lansat recent';

  @override
  String get myMedia => 'Media mea';

  @override
  String get myMediaSmall => 'Media mea (mică)';

  @override
  String get continueWatching => 'Continuați vizionarea';

  @override
  String get resumeAudio => 'Reluați audio';

  @override
  String get resumeBooks => 'CV-uri Cărți';

  @override
  String get activeRecordings => 'Înregistrări active';

  @override
  String get playlists => 'Liste de redare';

  @override
  String get liveTV => 'TV în direct';

  @override
  String get homeSections => 'Secțiuni de acasă';

  @override
  String get resetToDefaults => 'Resetați la valorile implicite';

  @override
  String get homeRowPosterSize =>
      'Dimensiunea posterului pentru rândul de acasă';

  @override
  String get perRowImageTypeSelection =>
      'Selectarea tipului de imagine pe rând';

  @override
  String get configureImageTypeForEachRow =>
      'Configurați tipul de imagine pentru fiecare rând de acasă activat';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Îmbinați Continuați vizionarea și Următorul';

  @override
  String get combineBothRows =>
      'Combinați ambele rânduri într-o singură secțiune de acasă';

  @override
  String get perRowImageType => 'Tip de imagine pe rând';

  @override
  String get perRowSettings => 'Setări pe rând';

  @override
  String get autoLogin => 'Conectare automată';

  @override
  String get lastUser => 'Ultimul utilizator';

  @override
  String get currentUser => 'Current User';

  @override
  String get alwaysAuthenticate => 'Autentificați-vă întotdeauna';

  @override
  String get requirePasswordWithToken =>
      'Solicitați parola chiar și cu simbolul stocat';

  @override
  String get confirmExit => 'Confirmați Ieșirea';

  @override
  String get showConfirmationBeforeExiting =>
      'Afișați confirmarea înainte de a ieși';

  @override
  String get blockContentWithRatings =>
      'Blocați conținutul cu următoarele evaluări:';

  @override
  String get noContentRatingsFound =>
      'Nu au fost găsite evaluări de conținut pe acest server încă.';

  @override
  String get couldNotLoadServerRatings =>
      'Nu s-au putut încărca evaluările serverului. Se afișează numai evaluările salvate.';

  @override
  String get couldNotRefreshRatings =>
      'Nu s-au putut reîmprospăta evaluările de pe server. Se afișează evaluările salvate.';

  @override
  String get enablePinCode => 'Activați codul PIN';

  @override
  String get requirePinToAccess =>
      'Solicitați un PIN pentru a vă accesa contul';

  @override
  String get changePin => 'Schimbați codul PIN';

  @override
  String get setNewPinCode => 'Setați un nou cod PIN';

  @override
  String get removePin => 'Eliminați codul PIN';

  @override
  String get removePinProtection => 'Eliminați protecția prin codul PIN';

  @override
  String get screensaver => 'Screen saver';

  @override
  String get inAppScreensaver => 'Screensaver în aplicație';

  @override
  String get enableBuiltInScreensaver => 'Activați screensaverul încorporat';

  @override
  String get mode => 'Modul';

  @override
  String get libraryArt => 'Biblioteca Art';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Ceas';

  @override
  String get timeout => 'Pauză';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Nivel de diminuare';

  @override
  String get maxAgeRating => 'Evaluare de vârstă maximă';

  @override
  String get any => 'Orice';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Necesită evaluarea vârstei';

  @override
  String get onlyShowRatedContent => 'Afișați numai conținutul evaluat';

  @override
  String get showClock => 'Arată ceasul';

  @override
  String get displayClockDuringScreensaver =>
      'Afișează ceasul în timpul economizorului de ecran';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (critici)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Public)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (utilizator)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Evaluarea comunității';

  @override
  String get ratings => 'Evaluări';

  @override
  String get additionalRatings => 'Evaluări suplimentare';

  @override
  String get showMdbListAndTmdbRatings => 'Afișați evaluările MDBList și TMDB';

  @override
  String get ratingLabels => 'Etichete de evaluare';

  @override
  String get showLabelsNextToIcons =>
      'Afișați etichetele lângă pictogramele de evaluare';

  @override
  String get ratingBadges => 'Insigne de evaluare';

  @override
  String get showDecorativeBadges =>
      'Afișați insigne decorative în spatele evaluărilor';

  @override
  String get episodeRatings => 'Evaluări ale episoadelor';

  @override
  String get showRatingsOnEpisodes =>
      'Afișați evaluări pentru episoade individuale';

  @override
  String get ratingSources => 'Surse de evaluare';

  @override
  String get ratingSourcesDescription =>
      'Activați și reordonați sursele de evaluare afișate în aplicație';

  @override
  String get pluginLabel => 'Plugin';

  @override
  String get pluginDetected => 'Plugin detectat';

  @override
  String get pluginNotDetected => 'Pluginul nu a fost detectat';

  @override
  String get pluginDetectedDescription =>
      'Plugin de server a fost detectat. Sincronizarea este activată automat prima dată când este găsit pluginul.';

  @override
  String get pluginNotDetectedDescription =>
      'Pluginul de server nu este detectat momentan. Setările locale folosesc în continuare valorile lor salvate sau valorile implicite încorporate.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersiune: $version';
  }

  @override
  String get availableServices => 'Servicii disponibile';

  @override
  String get serverPluginSync => 'Sincronizarea pluginului serverului';

  @override
  String get syncSettingsWithPlugin =>
      'Sincronizați setările cu pluginul serverului';

  @override
  String get whatSyncControls => 'Ce controlează sincronizarea';

  @override
  String get syncControlsDescription =>
      'Sincronizarea controlează doar dacă setările susținute de plugin sunt trimise și extrase de pe server. Selecția profilului și acțiunile de sincronizare a profilului sunt în setările de personalizare când sincronizarea pluginului este activată.';

  @override
  String get recentRequests => 'Cereri recente';

  @override
  String get recentlyAdded => 'Adăugat recent';

  @override
  String get trending => 'Trending';

  @override
  String get popularMovies => 'Filme populare';

  @override
  String get movieGenres => 'Genuri de film';

  @override
  String get upcomingMovies => 'Filme viitoare';

  @override
  String get studios => 'Studiouri';

  @override
  String get popularSeries => 'Seria populară';

  @override
  String get seriesGenres => 'Genuri seriale';

  @override
  String get upcomingSeries => 'Seria viitoare';

  @override
  String get networks => 'Rețele';

  @override
  String get seerrDiscoveryRows => 'Seerr Discovery Rows';

  @override
  String get resetRowsToDefaults => 'Resetați rândurile la valorile implicite';

  @override
  String get enableSeerr => 'Activați Seerr';

  @override
  String get showSeerrInNavigation =>
      'Afișați Seerr în navigare (necesită plugin de server)';

  @override
  String get seerrUnavailable =>
      'Indisponibil deoarece suportul pentru pluginul de server Seerr este dezactivat.';

  @override
  String get nsfwFilter => 'Filtru NSFW';

  @override
  String get hideAdultContent =>
      'Ascunde conținutul pentru adulți în rezultate';

  @override
  String loggedInAs(String username) {
    return 'Conectat ca: $username';
  }

  @override
  String get discoverRows => 'Descoperiți Rânduri';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Trageți pentru a reordona. Activați sau dezactivați rândurile. Sincronizarea comenzii rândurilor este activată cu pluginul Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Trageți pentru a reordona. Activați sau dezactivați rândurile.';

  @override
  String get enabled => 'Activat';

  @override
  String get hidden => 'Ascuns';

  @override
  String get aboutTitle => 'Despre';

  @override
  String versionValue(String version) {
    return 'Versiunea $version';
  }

  @override
  String get openSourceLicenses => 'Licențe Open Source';

  @override
  String get sourceCode => 'Cod sursă';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Verificați actualizările acum';

  @override
  String get checksLatestDesktopRelease =>
      'Verifică cea mai recentă versiune desktop pentru această platformă';

  @override
  String get youAreUpToDate => 'Ești la curent.';

  @override
  String get couldNotCheckForUpdates =>
      'Nu s-au putut verifica actualizări în acest moment.';

  @override
  String get noCompatibleUpdate =>
      'Nu s-a găsit niciun pachet de actualizare compatibil pentru această platformă.';

  @override
  String get updateChecksNotSupported =>
      'Verificările de actualizare nu sunt acceptate pe această platformă.';

  @override
  String get updateNotificationsDisabled =>
      'Notificările de actualizare sunt dezactivate.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Vă rugăm să așteptați înainte de a verifica din nou.';

  @override
  String get latestUpdateAlreadyShown =>
      'Cea mai recentă actualizare a fost deja afișată.';

  @override
  String get updateAvailable => 'Actualizare disponibilă.';

  @override
  String updateAvailableVersion(String version) {
    return 'Actualizare disponibilă: v$version';
  }

  @override
  String get updateNotifications => 'Actualizare notificări';

  @override
  String get showWhenUpdatesAvailable =>
      'Afișați când sunt disponibile actualizări';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Disponibil';
  }

  @override
  String get readReleaseNotes => 'Citiți notele de lansare';

  @override
  String get downloadingUpdate => 'Se descarcă actualizarea...';

  @override
  String get updateDownloadFailed =>
      'Descărcarea actualizării a eșuat. Vă rugăm să încercați din nou.';

  @override
  String get openReleasesPage => 'Deschideți pagina versiuni';

  @override
  String get navigation => 'Navigare';

  @override
  String get watchedIndicatorsBackdrops => 'Indicatori urmăriți, fundaluri';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Culoare focalizată, indicatori urmăriți, fundaluri';

  @override
  String get navbarStyleToolbarAppearance =>
      'Stil bară de navigare, butoane din bara de instrumente, aspect';

  @override
  String get reorderToggleHomeRows =>
      'Reordonează și comută rândurile de acasă';

  @override
  String get featuredContentAppearance => 'Conținut recomandat, aspect';

  @override
  String get posterSizeImageTypeFolderView =>
      'Dimensiunea posterului, tipul imaginii, vizualizarea folderului';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB și surse de rating';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Clar';

  @override
  String get browse => 'Răsfoiește';

  @override
  String get noResults => 'Niciun rezultat';

  @override
  String get seerrAvailableStatus => 'Disponibil';

  @override
  String get seerrRequestedStatus => 'Solicitat';

  @override
  String itemsCount(int count) {
    return '$count Articole';
  }

  @override
  String get seerrSettings => 'Setări Seerr';

  @override
  String get requestMore => 'Solicitați mai multe';

  @override
  String get request => 'Cerere';

  @override
  String get cancelRequest => 'Anulează cererea';

  @override
  String get playInMoonfin => 'Joacă în Moonfin';

  @override
  String requestedByName(String name) {
    return 'Solicitat de $name';
  }

  @override
  String get approve => 'Aproba';

  @override
  String get declineAction => 'Declin';

  @override
  String get similar => 'Similar';

  @override
  String get recommendations => 'Recomandări';

  @override
  String cancelRequestForTitle(String title) {
    return 'Anulați cererea pentru „$title”?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Anulați cererile $count pentru „$title”?';
  }

  @override
  String get keep => 'Păstrează';

  @override
  String get itemNotFoundInLibrary =>
      'Articol nu a fost găsit în biblioteca dvs. Moonfin';

  @override
  String get errorSearchingLibrary => 'Eroare la căutarea în bibliotecă';

  @override
  String budgetAmount(String amount) {
    return 'Buget: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Venituri: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Solicitați $type';
  }

  @override
  String get submitRequest => 'Trimiteți cererea';

  @override
  String get allSeasons => 'Toate anotimpurile';

  @override
  String get advancedOptions => 'Opțiuni avansate';

  @override
  String get noServiceServersConfigured =>
      'Nu au fost configurate servere de servicii';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Profil de calitate';

  @override
  String get rootFolder => 'Folder rădăcină';

  @override
  String get showMore => 'Arată mai mult';

  @override
  String get appearances => 'Apariții';

  @override
  String get crewSection => 'Echipajul';

  @override
  String ageValue(int age) {
    return 'vârsta $age';
  }

  @override
  String get noRequests => 'Fara cereri';

  @override
  String get pendingStatus => 'În așteptare';

  @override
  String get declinedStatus => 'A refuzat';

  @override
  String get partiallyAvailable => 'Disponibil parțial';

  @override
  String get downloadingStatus => 'Descărcarea';

  @override
  String get approvedStatus => 'Aprobat';

  @override
  String get notRequestedStatus => 'Nu este solicitat';

  @override
  String get blocklistedStatus => 'Blocklisted';

  @override
  String get deletedStatus => 'Șters';

  @override
  String get tmdbScore => 'Scorul TMDB';

  @override
  String get releaseDateLabel => 'Data de lansare';

  @override
  String get firstAirDateLabel => 'Prima întâlnire de difuzare';

  @override
  String get revenueLabel => 'Venituri';

  @override
  String get runtimeLabel => 'Timp de rulare';

  @override
  String get budgetLabel => 'Buget';

  @override
  String get originalLanguageLabel => 'Limba originală';

  @override
  String get seasonsLabel => 'anotimpuri';

  @override
  String get episodesLabel => 'Episoade';

  @override
  String get access => 'Acces';

  @override
  String get add => 'Adăuga';

  @override
  String get address => 'Adresa';

  @override
  String get analytics => 'Analytics';

  @override
  String get catalog => 'Catalog';

  @override
  String get content => 'Conţinut';

  @override
  String get copy => 'Copie';

  @override
  String get create => 'Crea';

  @override
  String get disable => 'Dezactivați';

  @override
  String get done => 'Făcut';

  @override
  String get edit => 'Edita';

  @override
  String get encoding => 'Codificare';

  @override
  String get error => 'Eroare';

  @override
  String get forward => 'Redirecţiona';

  @override
  String get general => 'General';

  @override
  String get go => 'Merge';

  @override
  String get install => 'Instala';

  @override
  String get installed => 'Instalat';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Nume';

  @override
  String get networking => 'Rețele';

  @override
  String get next => 'Următorul';

  @override
  String get path => 'Cale';

  @override
  String get paused => 'Întrerupt';

  @override
  String get permissions => 'Permisiuni';

  @override
  String get processing => 'Prelucrare';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Furnizor';

  @override
  String get refresh => 'Reîmprospăta';

  @override
  String get remote => 'Telecomanda';

  @override
  String get rename => 'Redenumiți';

  @override
  String get revoke => 'Revoca';

  @override
  String get role => 'Rol';

  @override
  String get root => 'Rădăcină';

  @override
  String get run => 'Fugi';

  @override
  String get search => 'Căutare';

  @override
  String get select => 'Selecta';

  @override
  String get send => 'Trimite';

  @override
  String get sessions => 'Sesiuni';

  @override
  String get set => 'Set';

  @override
  String get status => 'Stare';

  @override
  String get stop => 'Stop';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Timp';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Dezinstalează';

  @override
  String get up => 'Sus';

  @override
  String get update => 'Actualizare';

  @override
  String get upload => 'Încărcați';

  @override
  String get unmute => 'Activați sunetul';

  @override
  String get mute => 'Mut';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Bord';

  @override
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'Setări';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Utilizatori';

  @override
  String get adminDrawerLibraries => 'Biblioteci';

  @override
  String get adminDrawerTranscoding => 'Transcodare';

  @override
  String get adminDrawerResume => 'Relua';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Dispozitive';

  @override
  String get adminDrawerActivity => 'Activitate';

  @override
  String get adminDrawerNetworking => 'Rețele';

  @override
  String get adminDrawerApiKeys => 'Chei API';

  @override
  String get adminDrawerBackups => 'Backup-uri';

  @override
  String get adminDrawerLogs => 'Bușteni';

  @override
  String get adminDrawerScheduledTasks => 'Sarcini programate';

  @override
  String get adminDrawerPlugins => 'Pluginuri';

  @override
  String get adminDrawerRepositories => 'Depozitele';

  @override
  String get adminDrawerLiveTv => 'TV în direct';

  @override
  String get adminExitTooltip => 'Ieși din Admin';

  @override
  String get adminDashboardLoadFailed => 'Nu s-a încărcat tabloul de bord';

  @override
  String get adminMediaOverview => 'Prezentare generală media';

  @override
  String get adminMediaTotalsError =>
      'Nu s-au putut încărca totalurile media de server.';

  @override
  String get adminMediaOverviewSubtitle =>
      'O citire rapidă despre cât de mult conținut este pe acest server.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Actualizări de plugin disponibile: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Pluginuri care necesită repornire: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Sarcini programate eșuate: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Intrări recente de avertisment/erori: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distributie media';

  @override
  String get analyticsVideoCodecs => 'Codecuri video';

  @override
  String get analyticsAudioCodecs => 'Codecuri audio';

  @override
  String get analyticsContainers => 'Containere';

  @override
  String get analyticsTopGenres => 'Genuri de top';

  @override
  String get analyticsReleaseYears => 'Ani de lansare';

  @override
  String get analyticsContentRatings => 'Evaluări de conținut';

  @override
  String get analyticsRuntimeBuckets => 'Găleți de rulare';

  @override
  String get analyticsFileFormats => 'Formate de fișiere';

  @override
  String get analyticsNoData => 'Nu există date disponibile.';

  @override
  String get adminServerInfo => 'Informații server';

  @override
  String get adminRestartPending => 'Reporniți în așteptare';

  @override
  String get adminServerPaths => 'Căile serverului';

  @override
  String get adminServerActions => 'Acțiuni server';

  @override
  String get adminRestartServer => 'Reporniți serverul';

  @override
  String get adminShutdownServer => 'Închideți serverul';

  @override
  String get adminScanLibraries => 'Scanează biblioteci';

  @override
  String get adminLibraryScanStarted => 'Scanarea bibliotecii a început';

  @override
  String errorGeneric(String error) {
    return 'Eroare: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Repornirea serverului este în curs';

  @override
  String get adminServerRebootMessage =>
      'Repornirea serverului este în curs, vă rugăm să reporniți Moonfin';

  @override
  String get adminActiveSessions => 'Sesiuni active';

  @override
  String get adminSessionsLoadFailed => 'Nu s-au încărcat sesiunile';

  @override
  String get adminNoActiveSessions => 'Fără sesiuni active';

  @override
  String get adminRecentActivity => 'Activitate recentă';

  @override
  String get adminNoRecentActivity => 'Nicio activitate recentă';

  @override
  String adminCommandFailed(String error) {
    return 'Comanda a eșuat: $error';
  }

  @override
  String get adminSendMessage => 'Trimite mesaj';

  @override
  String get adminMessageTextHint => 'Textul mesajului';

  @override
  String get adminSetVolume => 'Setați volumul';

  @override
  String get sessionPrev => 'Prev';

  @override
  String get sessionRewind => 'Derulează înapoi';

  @override
  String get sessionForward => 'Redirecţiona';

  @override
  String get sessionNext => 'Următorul';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Acum se joacă';

  @override
  String get volume => 'Volum';

  @override
  String get actions => 'Acțiuni';

  @override
  String get videoCodec => 'Codec video';

  @override
  String get audioCodec => 'Codec audio';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Finalizare';

  @override
  String get direct => 'Direct';

  @override
  String get adminDisconnect => 'Deconecta';

  @override
  String get adminClearDates => 'Date clare';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Nu s-a încărcat jurnalul de activitate: $error';
  }

  @override
  String get adminNoActivityEntries => 'Fără intrări de activitate';

  @override
  String get adminEditDeviceName => 'Editați numele dispozitivului';

  @override
  String get adminCustomName => 'Nume personalizat';

  @override
  String get adminDeviceNameUpdated =>
      'Numele dispozitivului a fost actualizat';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Nu s-a putut actualiza dispozitivul: $error';
  }

  @override
  String get adminDeleteDevice => 'Ștergeți dispozitivul';

  @override
  String get adminDeviceDeleted => 'Dispozitivul a fost șters';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Dispozitivul nu a fost șters: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Nu s-au încărcat dispozitivele';

  @override
  String get adminSearchDevices => 'Căutați dispozitive';

  @override
  String get adminThisDevice => 'Acest Dispozitiv';

  @override
  String get adminEditName => 'Editați numele';

  @override
  String get adminLibrariesLoadFailed => 'Nu s-au încărcat bibliotecile';

  @override
  String get adminNoLibraries => 'Nu au fost configurate biblioteci';

  @override
  String get adminScanAllLibraries => 'Scanați toate bibliotecile';

  @override
  String get adminAddLibrary => 'Adăugați o bibliotecă';

  @override
  String adminScanFailed(String error) {
    return 'Nu s-a pornit scanarea: $error';
  }

  @override
  String get adminRenameLibrary => 'Redenumiți biblioteca';

  @override
  String get adminNewName => 'Nume nou';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteca redenumită în „$name”';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Nu s-a putut redenumi: $error';
  }

  @override
  String get adminDeleteLibrary => 'Șterge biblioteca';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteca „$name” a fost ștearsă';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Nu s-a șters biblioteca: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Nu s-a putut adăuga calea: $error';
  }

  @override
  String get adminRemovePath => 'Eliminați Calea';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Eliminați „$path” din această bibliotecă?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Nu s-a putut elimina calea: $error';
  }

  @override
  String get adminLibraryOptionsSaved =>
      'Opțiunile bibliotecii au fost salvate';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Opțiunile nu au fost salvate: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nu s-a putut încărca biblioteca';

  @override
  String get adminNoMediaPaths => 'Nu au fost configurate căi media';

  @override
  String get adminAddPath => 'Adăugați o cale';

  @override
  String get adminBrowseFilesystem => 'Răsfoiți sistemul de fișiere pe server:';

  @override
  String get adminSaveOptions => 'Opțiuni de salvare';

  @override
  String get adminPreferredMetadataLanguage =>
      'Limba preferată pentru metadate';

  @override
  String get adminMetadataLanguageHint => 'de ex. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Codul țării metadate';

  @override
  String get adminMetadataCountryHint => 'de ex. SUA, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Numele bibliotecii este obligatoriu';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Nu s-a putut crea biblioteca: $error';
  }

  @override
  String get adminLibraryName => 'Numele bibliotecii';

  @override
  String get adminSelectedPaths => 'Căile selectate:';

  @override
  String get adminNoPathsAdded =>
      'Nu au fost adăugate căi (poate fi adăugate mai târziu)';

  @override
  String get adminCreateLibrary => 'Creați o bibliotecă';

  @override
  String get paths => 'Trasee:';

  @override
  String get adminDisableUser => 'Dezactivați utilizator';

  @override
  String get adminEnableUser => 'Activați utilizator';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Dezactivați $name? Nu se vor putea conecta.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Activați $name? Se vor putea conecta din nou.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Utilizatorul „$name” a fost dezactivat';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Utilizatorul „$name” a fost activat';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Nu s-a putut actualiza politica utilizatorului: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Nu s-au încărcat utilizatorii';

  @override
  String get adminSearchUsers => 'Căutați utilizatori';

  @override
  String get adminEditUser => 'Editați utilizatorul';

  @override
  String get adminAddUser => 'Adăugați utilizator';

  @override
  String adminUserCreateFailed(String error) {
    return 'Nu s-a putut crea utilizatorul: $error';
  }

  @override
  String get adminCreateUser => 'Creați utilizator';

  @override
  String get adminPasswordOptional => 'Parolă (opțional)';

  @override
  String get adminUsernameRequired => 'Numele de utilizator nu poate fi gol';

  @override
  String get adminNoProfileChanges => 'Nicio modificare a profilului de salvat';

  @override
  String get adminProfileSaved => 'Profil salvat';

  @override
  String adminSaveFailed(String error) {
    return 'Salvare eșuată: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permisiunile salvate';

  @override
  String get adminPasswordsMismatch => 'Parolele nu se potrivesc';

  @override
  String adminFailed(String error) {
    return 'Eșuat: $error';
  }

  @override
  String get adminUserLoadFailed => 'Nu s-a putut încărca utilizatorul';

  @override
  String get adminBackToUsers => 'Înapoi la Utilizatori';

  @override
  String get adminSaveProfile => 'Salvați profilul';

  @override
  String get adminDeleteUser => 'Șterge utilizator';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Administratorii au acces complet la server. Acordați cu precauție.';

  @override
  String get administrator => 'Administrator';

  @override
  String get adminHiddenUser => 'Utilizator ascuns';

  @override
  String get adminAllowMediaPlayback => 'Permite redarea media';

  @override
  String get adminAllowAudioTranscoding => 'Permite transcodarea audio';

  @override
  String get adminAllowVideoTranscoding => 'Permite transcodarea video';

  @override
  String get adminAllowRemuxing => 'Permite remixarea';

  @override
  String get adminForceRemoteTranscoding =>
      'Forțați transcodarea sursei de la distanță';

  @override
  String get adminAllowContentDeletion => 'Permite ștergerea conținutului';

  @override
  String get adminAllowContentDownloading => 'Permite descărcarea conținutului';

  @override
  String get adminAllowPublicSharing => 'Permite distribuirea publică';

  @override
  String get adminAllowRemoteControl =>
      'Permite controlul de la distanță al altor utilizatori';

  @override
  String get adminAllowSharedDeviceControl =>
      'Permite controlul partajat al dispozitivului';

  @override
  String get adminAllowRemoteAccess => 'Permiteți accesul de la distanță';

  @override
  String get adminRemoteBitrateLimit =>
      'Limită de bitrate client la distanță (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Lăsați gol fără limită';

  @override
  String get adminMaxActiveSessions => 'Max sesiuni active';

  @override
  String get adminAllowLiveTvAccess => 'Permite accesul la TV în direct';

  @override
  String get adminAllowLiveTvManagement => 'Permite gestionarea Live TV';

  @override
  String get adminAllowCollectionManagement =>
      'Permite gestionarea colecțiilor';

  @override
  String get adminAllowSubtitleManagement =>
      'Permite gestionarea subtitrarilor';

  @override
  String get adminAllowLyricManagement => 'Permite gestionarea versurilor';

  @override
  String get adminSavePermissions => 'Salvare permisiuni';

  @override
  String get adminEnableAllLibraryAccess =>
      'Activați accesul la toate bibliotecile';

  @override
  String get adminSaveAccess => 'Salvare acces';

  @override
  String get adminChangePassword => 'Schimbaţi parola';

  @override
  String get adminNewPassword => 'Parolă Nouă';

  @override
  String get adminConfirmPassword => 'Confirmați parola';

  @override
  String get adminSetPassword => 'Setați parola';

  @override
  String get adminResetPassword => 'Resetează parola';

  @override
  String get adminPasswordReset => 'Resetarea parolei';

  @override
  String get adminPasswordUpdated => 'Parola a fost actualizată';

  @override
  String get adminUserSettings => 'Setări utilizator';

  @override
  String get adminLibraryAccess => 'Acces la bibliotecă';

  @override
  String get adminDeviceAndChannelAccess => 'Acces la dispozitiv și canal';

  @override
  String get adminEnableAllDevices => 'Activați accesul la toate dispozitivele';

  @override
  String get adminEnableAllChannels => 'Activați accesul la toate canalele';

  @override
  String get adminResetPasswordWarning =>
      'Aceasta va elimina parola. Utilizatorul se va putea autentifica fără parolă.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Serverul a returnat HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Sigur doriți să ștergeți $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Utilizatorul „$name” a fost șters';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Nu s-a șters utilizatorul: $error';
  }

  @override
  String get adminCreateApiKey => 'Creați cheia API';

  @override
  String get adminAppName => 'Numele aplicației';

  @override
  String get adminApiKeyCreated => 'Cheia API creată';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Cheie creată cu succes. Serverul nu a returnat jetonul. Verificați cheile API ale serverului.';

  @override
  String get adminKeyCopied => 'Cheie copiată în clipboard';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Nu s-a putut crea cheia: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Tokenul cheie lipsește din răspunsul serverului';

  @override
  String get adminRevokeApiKey => 'Revocați cheia API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revocați cheia pentru $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Cheia API revocată';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nu s-a revocat cheia: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Nu s-au încărcat cheile API';

  @override
  String get adminApiKeysTitle => 'Chei API';

  @override
  String get adminCreateKey => 'Creați cheia';

  @override
  String get adminNoApiKeys => 'Nu s-au găsit chei API';

  @override
  String get adminUnknownApp => 'Aplicație necunoscută';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Indicativ: $token\\nCreat: $created';
  }

  @override
  String get adminCreatingBackup => 'Se creează backup...';

  @override
  String get adminBackupCreated => 'Backup creat cu succes';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Nu s-a putut crea backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Calea de rezervă lipsește în răspunsul serverului';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Nu s-a încărcat manifestul: $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmați restaurarea';

  @override
  String get adminRestoringBackup => 'Se restabilește backupul...';

  @override
  String adminRestoreFailed(String error) {
    return 'Nu s-a restabilit backupul: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Nu s-au încărcat copiile de rezervă';

  @override
  String get adminCreateBackup => 'Creați o copie de rezervă';

  @override
  String get adminNoBackups => 'Nu s-au găsit copii de rezervă';

  @override
  String get adminViewDetails => 'Vedeți detalii';

  @override
  String get restore => 'Restabili';

  @override
  String get adminLogsLoadFailed => 'Nu s-au încărcat jurnalele serverului';

  @override
  String get adminNoLogFiles => 'Nu s-au găsit fișiere jurnal';

  @override
  String get adminLogCopied => 'Jurnalul a fost copiat în clipboard';

  @override
  String get adminSaveLogFile => 'Salvați fișierul jurnal';

  @override
  String adminSavedTo(String path) {
    return 'Salvat în $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Nu s-a putut salva fișierul: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Nu s-a putut încărca $fileName';
  }

  @override
  String get adminSearchInLog => 'Căutați în jurnal';

  @override
  String get adminNoMatchingLines => 'Fără linii care se potrivesc';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Nu s-au încărcat sarcinile: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nu s-au găsit sarcini programate';

  @override
  String get adminNoTasksMatchFilter =>
      'Nicio sarcină nu se potrivește cu filtrul actual';

  @override
  String adminTaskStartFailed(String error) {
    return 'Nu s-a putut porni sarcina: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Sarcina nu s-a oprit: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Sarcina nu s-a încărcat: $error';
  }

  @override
  String get adminRunNow => 'Fugi acum';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Nu s-a putut elimina declanșatorul: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Nu s-a putut adăuga declanșatorul: $error';
  }

  @override
  String get adminLastExecution => 'Ultima Execuție';

  @override
  String get adminTriggers => 'Declanșatoare';

  @override
  String get adminAddTrigger => 'Adăugați Trigger';

  @override
  String get adminNoTriggers => 'Nu au fost configurate declanșatoare';

  @override
  String get adminTriggerType => 'Tip de declanșare';

  @override
  String get adminTimeLimit => 'Limită de timp (opțional)';

  @override
  String get adminNoLimit => 'Fără limită';

  @override
  String adminHours(String hours) {
    return '$hours oră(e)';
  }

  @override
  String get adminDayOfWeek => 'Ziua săptămânii';

  @override
  String get adminSearchPlugins => 'Căutați pluginuri...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Nu s-a putut comuta pluginul: $error';
  }

  @override
  String get adminUninstallPlugin => 'Dezinstalează pluginul';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Sigur doriți să dezinstalați „$name”?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Nu s-a putut dezinstala pluginul: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Pachetul nu s-a instalat: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Nu s-a instalat actualizarea: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Nu s-au încărcat pluginurile: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Niciun plugin nu corespunde căutării tale';

  @override
  String get adminNoPluginsInstalled => 'Nu există pluginuri instalate';

  @override
  String adminInstallUpdate(String version) {
    return 'Instalați actualizarea (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Nu s-a încărcat catalogul: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Niciun pachet nu corespunde căutării dvs';

  @override
  String get adminNoPackagesAvailable => 'Nu există pachete disponibile';

  @override
  String get adminExperimentalIntegration => 'Integrare experimentală';

  @override
  String get adminExperimentalWarning =>
      'Integrarea setărilor de plugin este încă experimentală. Este posibil ca unele pagini de setări să nu fie redate corect.';

  @override
  String get continueAction => 'Continua';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '„$name” va fi eliminat după repornirea serverului';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Dezinstalare eșuată: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Se actualizează „$name” la v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Nu se pot deschide setările: lipsește simbolul de autentificare.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Nu s-a încărcat pluginul: $error';
  }

  @override
  String get adminPluginNotFound => 'Pluginul nu a fost găsit';

  @override
  String adminPluginVersion(String version) {
    return 'Versiunea $version';
  }

  @override
  String get adminEnablePlugin => 'Activați pluginul';

  @override
  String get adminPluginSettingsPage => 'Pagina de setări plugin';

  @override
  String get adminRevisionHistory => 'Istoricul revizuirilor';

  @override
  String get adminNoChangelog => 'Niciun jurnal de modificări disponibil.';

  @override
  String get adminRemoveRepository => 'Eliminați depozitul';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Sigur doriți să eliminați „$name”?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Nu s-au salvat depozitele: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Nu s-a putut încărca depozitele: $error';
  }

  @override
  String get adminRepositoryNameHint => 'de ex. Jellyfin Stabil';

  @override
  String get adminRepositoryUrl => 'Adresa URL a depozitului';

  @override
  String get adminAddEntry => 'Adăugați intrare';

  @override
  String get adminInvalidUrl => 'Adresă URL nevalidă';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Nu se pot încărca setările pluginului: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nu s-a putut deschide $uri';
  }

  @override
  String get adminOpenInBrowser => 'Deschideți în Browser';

  @override
  String get adminOpenExternally => 'Deschide extern';

  @override
  String get adminGeneralSettings => 'Setări generale';

  @override
  String get adminServerName => 'Numele serverului';

  @override
  String get adminPreferredMetadataCountry => 'Țara de metadate preferată';

  @override
  String get adminCachePath => 'Calea cache';

  @override
  String get adminMetadataPath => 'Calea metadatelor';

  @override
  String get adminLibraryScanConcurrency =>
      'Concurență de scanare a bibliotecii';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limită de codificare a imaginilor în paralel';

  @override
  String get adminSlowResponseThreshold => 'Prag de răspuns lent (ms)';

  @override
  String get adminBrandingSaved => 'Setările de branding au fost salvate';

  @override
  String get adminBrandingLoadFailed => 'Nu s-au încărcat setările de branding';

  @override
  String get adminLoginDisclaimer =>
      'Exonerare de responsabilitate pentru conectare';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML afișat sub formularul de conectare';

  @override
  String get adminCustomCss => 'CSS personalizat';

  @override
  String get adminCustomCssHint => 'CSS personalizat aplicat interfeței web';

  @override
  String get adminEnableSplashScreen => 'Activați ecranul de introducere';

  @override
  String get adminStreamingSaved => 'Setările de streaming au fost salvate';

  @override
  String get adminStreamingLoadFailed =>
      'Nu s-au încărcat setările de streaming';

  @override
  String get adminStreamingDescription =>
      'Setați limite globale ale ratei de biți de streaming pentru conexiunile la distanță.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limită de bitrate client la distanță (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Lăsați gol sau 0 pentru nelimitat';

  @override
  String get adminPlaybackSaved => 'Setările de redare au fost salvate';

  @override
  String get adminPlaybackLoadFailed => 'Nu s-au încărcat setările de redare';

  @override
  String get adminPlaybackTranscoding => 'Redare / Transcodare';

  @override
  String get adminHardwareAcceleration => 'Accelerarea hardware';

  @override
  String get adminVaapiDevice => 'Dispozitiv VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Activați codificarea hardware';

  @override
  String get adminEnableHardwareDecoding =>
      'Activați decodarea hardware pentru:';

  @override
  String get adminEncodingThreads => 'Codificarea firelor';

  @override
  String get adminAutomatic => '0 = automat';

  @override
  String get adminTranscodingTempPath => 'Calea temp de transcodare';

  @override
  String get adminEnableFallbackFont => 'Activați fontul alternativ';

  @override
  String get adminFallbackFontPath => 'Calea fontului alternativ';

  @override
  String get adminAllowSegmentDeletion => 'Permite ștergerea segmentului';

  @override
  String get adminSegmentKeepSeconds => 'Păstrarea segmentului (secunde)';

  @override
  String get adminThrottleBuffering => 'Tampon de accelerație';

  @override
  String get adminTrickplaySaved => 'Setările Trickplay au fost salvate';

  @override
  String get adminTrickplayLoadFailed => 'Nu s-au încărcat setările trickplay';

  @override
  String get adminEnableHardwareAcceleration => 'Activați accelerarea hardware';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Activați extragerea numai a cadrelor cheie';

  @override
  String get adminKeyFrameSubtitle => 'Mai rapid, dar precizie mai mică';

  @override
  String get adminScanBehavior => 'Comportamentul de scanare';

  @override
  String get adminProcessPriority => 'Prioritatea procesului';

  @override
  String get adminImageSettings => 'Setări imagine';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Cât de des să captezi cadre';

  @override
  String get adminWidthResolutions => 'Rezoluții de lățime';

  @override
  String get adminTileWidth => 'Lățimea plăcilor';

  @override
  String get adminTileHeight => 'Înălțimea plăcilor';

  @override
  String get adminQualitySubtitle =>
      'Valori mai mici = calitate mai bună, fișiere mai mari';

  @override
  String get adminProcessThreads => 'Procesați firele';

  @override
  String get adminResumeSaved => 'Reluați setările salvate';

  @override
  String get adminResumeLoadFailed => 'Nu s-au încărcat setările de reluare';

  @override
  String get adminResumeDescription =>
      'Configurați când conținutul trebuie marcat ca redat parțial sau redat complet.';

  @override
  String get adminMinResumePercentage => 'Procentul minim de reluare';

  @override
  String get adminMinResumeSubtitle =>
      'Conținutul trebuie redat peste acest procent pentru a salva progresul';

  @override
  String get adminMaxResumePercentage => 'Procentul maxim de reluare';

  @override
  String get adminMaxResumeSubtitle =>
      'Conținutul este considerat redat complet după acest procent';

  @override
  String get adminMinResumeDuration => 'Durata minimă de reluare (secunde)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Elementele mai scurte decât aceasta nu pot fi reluate';

  @override
  String get adminMinAudiobookResume =>
      'Procentul minim de reluare a cărților audio';

  @override
  String get adminMaxAudiobookResume =>
      'Procentul maxim de reluare a cărților audio';

  @override
  String get adminNetworkingSaved =>
      'Setările de rețea au fost salvate. Poate fi necesară o repornire a serverului.';

  @override
  String get adminNetworkingLoadFailed => 'Nu s-au încărcat setările de rețea';

  @override
  String get adminNetworkingWarning =>
      'Modificările la setările de rețea pot necesita repornirea serverului.';

  @override
  String get adminEnableRemoteAccess => 'Activați accesul de la distanță';

  @override
  String get ports => 'Porturi';

  @override
  String get adminHttpPort => 'Port HTTP';

  @override
  String get adminHttpsPort => 'Port HTTPS';

  @override
  String get adminPublicHttpsPort => 'Port HTTPS public';

  @override
  String get adminBaseUrl => 'Adresa URL de bază';

  @override
  String get adminBaseUrlHint => 'de ex. /Jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Activați HTTPS';

  @override
  String get adminLocalNetwork => 'Rețea locală';

  @override
  String get adminLocalNetworkAddresses => 'Adresele rețelei locale';

  @override
  String get adminKnownProxies => 'Proxy cunoscuți';

  @override
  String get adminRemoteIpFilter => 'Filtru IP de la distanță';

  @override
  String get adminRemoteIpFilterEntries => 'Filtru IP de la distanță';

  @override
  String get adminCertificatePath => 'Calea certificatului';

  @override
  String get whitelist => 'Lista albă';

  @override
  String get blacklist => 'Lista neagră';

  @override
  String get notSet => 'Nu setat';

  @override
  String get adminMetadataSaved => 'Metadatele salvate';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Nu s-a putut încărca metadatele: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Nu s-au salvat metadatele: $error';
  }

  @override
  String get adminRefreshMetadata => 'Actualizează metadatele';

  @override
  String get recursive => 'Recursiv';

  @override
  String get adminReplaceAllMetadata => 'Înlocuiți toate metadatele';

  @override
  String get adminReplaceAllImages => 'Înlocuiți toate imaginile';

  @override
  String get adminMetadataRefreshRequested =>
      'S-a solicitat actualizarea metadatelor';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Nu s-au reîmprospătat metadatele: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Căutați Persoană de la distanță';

  @override
  String get adminNoRemoteMatches => 'Nu s-au găsit potriviri la distanță';

  @override
  String get adminRemoteResults => 'Rezultate de la distanță';

  @override
  String get adminRemoteMetadataApplied =>
      'S-au aplicat metadatele de la distanță';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Căutarea de la distanță a eșuat: $error';
  }

  @override
  String get adminUpdateContentType => 'Actualizați tipul de conținut';

  @override
  String get adminContentType => 'Tip de conținut';

  @override
  String get adminContentTypeUpdated => 'Tip de conținut actualizat';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nu s-a putut actualiza tipul de conținut: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nu s-a încărcat editorul de metadate';

  @override
  String get adminNoPeopleEntries => 'Fără intrări de persoane';

  @override
  String get adminNoExternalIds => 'Nu există ID-uri externe disponibile';

  @override
  String adminImageUpdated(String imageType) {
    return 'Imaginea $imageType a fost actualizată';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Nu s-a putut descărca imaginea: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Format de imagine neacceptat';

  @override
  String get adminImageReadFailed => 'Nu s-a putut citi imaginea selectată';

  @override
  String adminImageUploaded(String imageType) {
    return 'Imaginea $imageType a fost încărcată';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Nu s-a putut încărca imaginea: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Șterge $imageType imaginea';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Imaginea $imageType a fost ștearsă';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Nu s-a șters imaginea: $error';
  }

  @override
  String get adminAllProviders => 'Toți furnizorii';

  @override
  String get adminNoRemoteImages => 'Nu s-au găsit imagini la distanță';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Descoperirea tunerului a eșuat: $error';
  }

  @override
  String get adminAddTuner => 'Adăugați tuner';

  @override
  String get adminTunerType => 'Tip tuner';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Altele';

  @override
  String get adminUrlPath => 'URL/Cale';

  @override
  String get adminNameOptional => 'Nume (opțional)';

  @override
  String get adminTunerAdded => 'A adăugat tuner';

  @override
  String adminTunerAddFailed(String error) {
    return 'Nu s-a putut adăuga tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Adăugați furnizorul de ghid';

  @override
  String get adminProviderType => 'Tip de furnizor';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect sau XMLTV';

  @override
  String get adminUsernameOptional => 'Nume de utilizator (opțional)';

  @override
  String get adminRefreshInterval => 'Interval de reîmprospătare (ore)';

  @override
  String get adminProviderAdded => 'Furnizorul a fost adăugat';

  @override
  String adminProviderAddFailed(String error) {
    return 'Nu s-a putut adăuga furnizorul: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Tunerul nu a fost eliminat: $error';
  }

  @override
  String get adminTunerResetRequested =>
      'Resetarea tunerului a fost solicitată';

  @override
  String adminTunerResetFailed(String error) {
    return 'Tunerul nu a fost resetat: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Nu s-a putut elimina furnizorul: $error';
  }

  @override
  String get adminRecordingSettings => 'Setări de înregistrare';

  @override
  String get adminPrePadding => 'Pre-umplutură (minute)';

  @override
  String get adminPostPadding => 'Post-padding (minute)';

  @override
  String get adminRecordingPath => 'Calea de înregistrare';

  @override
  String get adminSeriesRecordingPath => 'Calea de înregistrare în serie';

  @override
  String get adminRecordingSettingsSaved =>
      'Setările de înregistrare au fost salvate';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nu s-au salvat setările: $error';
  }

  @override
  String get adminSetChannelMappings => 'Setați mapările canalelor';

  @override
  String get adminMappingJson => 'Maparea JSON';

  @override
  String get adminMappingJsonHint => 'Exemplu: mapări de sarcină utilă JSON';

  @override
  String get adminChannelMappingsUpdated =>
      'Mapările canalelor au fost actualizate';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Nu s-au actualizat mapările: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'Nu s-a încărcat administrarea Live TV';

  @override
  String get adminTunerDevices => 'Dispozitive de tuner';

  @override
  String get adminNoTunerHosts => 'Nu au fost configurate gazde de tuner';

  @override
  String get adminGuideProviders => 'Furnizori de ghiduri';

  @override
  String get adminAddProvider => 'Adăugați furnizorul';

  @override
  String get adminNoListingProviders =>
      'Nu au fost configurați furnizori de listări';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Cale de înregistrare: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Calea seriei: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Umplutură preliminară: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Post-padding: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Tuner Discovery';

  @override
  String get adminChannelMappings => 'Mapările canalelor';

  @override
  String get adminNoDiscoveredTuners => 'Niciun tuner descoperit încă';

  @override
  String get adminSettingsSaved => 'Setările au fost salvate';

  @override
  String get adminBackupsNotAvailable =>
      'Backup-urile nu sunt disponibile pe această versiune de server.';

  @override
  String get adminRestoreWarning1 =>
      'Restaurarea va înlocui TOATE datele actuale ale serverului cu datele de rezervă.';

  @override
  String get adminRestoreWarning2 =>
      'Setările curente ale serverului, utilizatorii și datele bibliotecii vor fi suprascrise.';

  @override
  String get adminRestoreWarning3 => 'Serverul va reporni după restaurare.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restabiliți backupul $name acum?';
  }

  @override
  String get adminRestoreRequested =>
      'Restaurare solicitată. Repornirea serverului poate deconecta această sesiune.';

  @override
  String get adminBackupsTitle => 'Backup-uri';

  @override
  String get adminUnknownDate => 'Data necunoscuta';

  @override
  String get adminUnnamedBackup => 'Backup fără nume';

  @override
  String get adminLiveTvNotAvailable =>
      'Administrarea TV în direct nu este disponibilă pe această versiune de server.';

  @override
  String get adminLiveTvTitle => 'Administrare TV în direct';

  @override
  String get adminApply => 'Aplicați';

  @override
  String get adminNotSet => 'Nu setat';

  @override
  String get adminReset => 'Resetați';

  @override
  String get adminLogsTitle => 'Jurnalele serverului';

  @override
  String get adminLogsNewestFirst => 'Cel mai nou primul';

  @override
  String get adminLogsOldestFirst => 'Cel mai vechi primul';

  @override
  String get adminLogsJustNow => 'Chiar acum';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m în urmă';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h în urmă';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d acum';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Nu s-a putut încărca $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count se potrivește';
  }

  @override
  String get adminLogViewerNoMatches => 'Fără linii care se potrivesc';

  @override
  String get adminMetadataEditorTitle => 'Editor de metadate';

  @override
  String get adminMetadataRemote => 'Telecomanda';

  @override
  String get adminMetadataType => 'Tip';

  @override
  String get adminMetadataDetails => 'Detalii';

  @override
  String get adminMetadataExternalIds => 'ID-uri externe';

  @override
  String get adminMetadataImages => 'Imagini';

  @override
  String get adminMetadataFieldTitle => 'Titlu';

  @override
  String get adminMetadataFieldSortTitle => 'Sortați titlul';

  @override
  String get adminMetadataFieldOriginalTitle => 'Titlul original';

  @override
  String get adminMetadataFieldPremiereDate => 'Data premierei (AAAA-LL-ZZ)';

  @override
  String get adminMetadataFieldEndDate => 'Data de încheiere (AAAA-LL-ZZ)';

  @override
  String get adminMetadataFieldProductionYear => 'Anul producției';

  @override
  String get adminMetadataFieldOfficialRating => 'Rating oficial';

  @override
  String get adminMetadataFieldCommunityRating => 'Evaluarea comunității';

  @override
  String get adminMetadataFieldCriticRating => 'Evaluarea criticii';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Prezentare generală';

  @override
  String get adminMetadataGenres => 'Genuri';

  @override
  String get adminMetadataTags => 'Etichete';

  @override
  String get adminMetadataStudios => 'Studiouri';

  @override
  String get adminMetadataPeople => 'Oameni';

  @override
  String get adminMetadataAddGenre => 'Adăugați genul';

  @override
  String get adminMetadataAddTag => 'Adăugați etichetă';

  @override
  String get adminMetadataAddStudio => 'Adăugați studio';

  @override
  String get adminMetadataAddPerson => 'Adăugați o persoană';

  @override
  String get adminMetadataEditPerson => 'Editați persoana';

  @override
  String get adminMetadataRole => 'Rol';

  @override
  String get adminMetadataImagePrimary => 'Primar';

  @override
  String get adminMetadataImageBackdrop => 'Pe fundal';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Degetul mare';

  @override
  String get adminMetadataRecursive => 'Recursiv';

  @override
  String get adminMetadataProvider => 'Furnizor';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Imaginea $imageType a fost actualizată';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Imaginea $imageType a fost încărcată';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Imaginea $imageType a fost ștearsă';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Nu s-a putut descărca imaginea: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Nu s-a putut citi imaginea selectată';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Nu s-a putut încărca imaginea: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Șterge $imageType imaginea';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Aceasta elimină imaginea curentă din articol.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nu s-a șters imaginea: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Alege imaginea $imageType';
  }

  @override
  String get adminMetadataUpload => 'Încărcați';

  @override
  String get adminMetadataUpdate => 'Actualizare';

  @override
  String get adminMetadataRemoteImage => 'Imagine de la distanță';

  @override
  String get adminPluginsInstalled => 'Instalat';

  @override
  String get adminPluginsCatalog => 'Catalog';

  @override
  String get adminPluginsActive => 'Activ';

  @override
  String get adminPluginsRestart => 'Repornire';

  @override
  String get adminPluginsNoSearchResults =>
      'Niciun plugin nu corespunde căutării tale';

  @override
  String get adminPluginsNoneInstalled => 'Nu există pluginuri instalate';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Actualizare disponibilă: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Actualizare disponibilă';

  @override
  String get adminPluginsPendingRemoval =>
      'Se așteaptă eliminarea după repornire';

  @override
  String get adminPluginsChangesPending =>
      'Modificări în așteptarea repornirii';

  @override
  String get adminPluginsEnable => 'Permite';

  @override
  String get adminPluginsDisable => 'Dezactivați';

  @override
  String get adminPluginsInstallUpdate => 'Instalați actualizarea';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instalați actualizarea (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Niciun pachet nu corespunde căutării dvs';

  @override
  String get adminPluginsCatalogEmpty => 'Nu există pachete disponibile';

  @override
  String adminPluginsInstalling(String name) {
    return '„$name” este în curs de instalare...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integrare experimentală';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integrarea setărilor de plugin este încă experimentală. Este posibil ca unele câmpuri sau aspecte să nu fie redate corect încă.';

  @override
  String get adminPluginDetailToggle404 =>
      'Nu s-a putut comuta pluginul. Serverul nu a putut găsi această versiune de plugin. Încercați să reîmprospătați pluginurile, apoi reîncercați.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Nu s-a putut comuta pluginul. Vă rugăm să verificați jurnalele serverului pentru detalii.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Setări';
  }

  @override
  String get adminPluginDetailDetails => 'Detalii';

  @override
  String get adminPluginDetailDeveloper => 'Dezvoltator';

  @override
  String get adminPluginDetailRepository => 'Repertoriu';

  @override
  String get adminPluginDetailBundled => 'Pachet';

  @override
  String get adminPluginDetailEnablePlugin => 'Activați pluginul';

  @override
  String get adminPluginDetailRestartRequired =>
      'Este necesară repornirea serverului pentru ca modificările să intre în vigoare.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Acest plugin va fi eliminat după repornirea serverului.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Acest plugin a funcționat defectuos și este posibil să nu funcționeze corect.';

  @override
  String get adminPluginDetailNotSupported =>
      'Acest plugin nu este acceptat de versiunea curentă a serverului.';

  @override
  String get adminPluginDetailSuperseded =>
      'Acest plugin a fost înlocuit de o versiune mai nouă.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Nu s-a putut încărca depozitele: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Eliminați depozitul';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Sigur doriți să eliminați „$name”?';
  }

  @override
  String get adminReposRemove => 'Elimina';

  @override
  String adminReposSaveFailed(String error) {
    return 'Nu s-au salvat depozitele: $error';
  }

  @override
  String get adminReposEmpty => 'Nu au fost configurate depozite';

  @override
  String get adminReposEmptySubtitle =>
      'Adăugați un depozit pentru a răsfoi pluginurile disponibile';

  @override
  String get adminReposUnnamed => '(anonim)';

  @override
  String get adminReposEditTitle => 'Editați depozitul';

  @override
  String get adminReposAddTitle => 'Adăugați un depozit';

  @override
  String get adminReposUrl => 'Adresa URL a depozitului';

  @override
  String get adminReposNameHint => 'de ex. Jellyfin Stabil';

  @override
  String get adminPluginSettingsInvalidUrl => 'Adresă URL nevalidă';

  @override
  String get adminGeneralSettingsTitle => 'Setări generale';

  @override
  String get adminGeneralMetadataLanguage => 'Limba preferată pentru metadate';

  @override
  String get adminGeneralMetadataLanguageHint => 'de ex. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Țara de metadate preferată';

  @override
  String get adminGeneralMetadataCountryHint => 'de ex. SUA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Concurență de scanare a bibliotecii';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limită de codificare a imaginilor în paralel';

  @override
  String get adminUnknownError => 'Eroare necunoscută';

  @override
  String get adminBrowse => 'Răsfoiește';

  @override
  String get adminCloseBrowser => 'Închide browserul';

  @override
  String get adminNetworkingTitle => 'Rețele';

  @override
  String get adminNetworkingRestartWarning =>
      'Modificările la setările de rețea pot necesita repornirea serverului.';

  @override
  String get adminNetworkingRemoteAccess => 'Activați accesul de la distanță';

  @override
  String get adminNetworkingPorts => 'Porturi';

  @override
  String get adminNetworkingHttpPort => 'Port HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Port HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Activați HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Rețea locală';

  @override
  String get adminNetworkingLocalAddresses => 'Adresele rețelei locale';

  @override
  String get adminNetworkingAddressHint => 'de ex. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxy cunoscuți';

  @override
  String get adminNetworkingProxyHint => 'de ex. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Lista albă';

  @override
  String get adminNetworkingBlacklist => 'Lista neagră';

  @override
  String get adminNetworkingAddEntry => 'Adăugați intrare';

  @override
  String get adminBrandingTitle => 'Branding';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Exonerare de responsabilitate pentru conectare';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML afișat sub formularul de conectare';

  @override
  String get adminBrandingCustomCss => 'CSS personalizat';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personalizat aplicat interfeței web';

  @override
  String get adminBrandingEnableSplash => 'Activați ecranul de introducere';

  @override
  String get adminPlaybackHwAccel => 'Accelerație hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Accelerarea hardware';

  @override
  String get adminPlaybackEnableHwEncoding => 'Activați codificarea hardware';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Activați decodarea hardware pentru:';

  @override
  String get adminPlaybackEncoding => 'Codificare';

  @override
  String get adminPlaybackEncodingThreads => 'Codificarea firelor';

  @override
  String get adminPlaybackFallbackFont => 'Activați fontul alternativ';

  @override
  String get adminPlaybackFallbackFontPath => 'Calea fontului alternativ';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Cărți audio';

  @override
  String get adminResumeMinAudiobookPct =>
      'Procentul minim de reluare a cărților audio';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Procentul maxim de reluare a cărților audio';

  @override
  String get adminStreamingBitrateLimit =>
      'Limită de bitrate client la distanță (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Lăsați gol sau 0 pentru nelimitat';

  @override
  String get adminTrickplayHwAccel => 'Activați accelerarea hardware';

  @override
  String get adminTrickplayHwEncoding => 'Activați codificarea hardware';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Activați extragerea numai a cadrelor cheie';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Mai rapid, dar precizie mai mică';

  @override
  String get adminTrickplayNonBlocking => 'Neblocare';

  @override
  String get adminTrickplayBlocking => 'Blocare';

  @override
  String get adminTrickplayPriorityHigh => 'Ridicat';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Peste Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Sub Normal';

  @override
  String get adminTrickplayPriorityIdle => 'Inactiv';

  @override
  String get adminTrickplayImageSettings => 'Setări imagine';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Cât de des să captezi cadre';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Lățimi de pixeli separate prin virgulă (de exemplu, 320)';

  @override
  String get adminTrickplayQuality => 'Calitate';

  @override
  String get adminTrickplayQScale => 'Scala de calitate';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Valori mai mici = calitate mai bună, fișiere mai mari';

  @override
  String get adminTrickplayJpegQuality => 'Calitate JPEG';

  @override
  String get adminTrickplayProcessing => 'Prelucrare';

  @override
  String get adminTasksEmpty => 'Nu s-au găsit sarcini programate';

  @override
  String get adminTasksNoFilterMatch =>
      'Nicio sarcină nu se potrivește cu filtrul actual';

  @override
  String get adminTaskCancelling => 'Se anulează...';

  @override
  String get adminTaskRunning => 'Funcţionare...';

  @override
  String get adminTaskNeverRun => 'Nu fugi niciodată';

  @override
  String get adminTaskStop => 'Stop';

  @override
  String get adminTaskRun => 'Fugi';

  @override
  String get adminTaskDetailLastExecution => 'Ultima Execuție';

  @override
  String get adminTaskDetailStarted => 'A început';

  @override
  String get adminTaskDetailEnded => 'Încheiat';

  @override
  String get adminTaskDetailDuration => 'Durată';

  @override
  String get adminTaskDetailErrorLabel => 'Eroare:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Zilnic la $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Fiecare $day la $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Fiecare $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'La pornirea aplicației';

  @override
  String get adminTaskTriggerTypeDaily => 'Zilnic';

  @override
  String get adminTaskTriggerTypeWeekly => 'Săptămânal';

  @override
  String get adminTaskTriggerTypeInterval => 'Într-un interval';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

  @override
  String get adminTaskTriggerEveryHour => 'În fiecare oră';

  @override
  String get adminTaskTriggerEvery6Hours => 'La fiecare 6 ore';

  @override
  String get adminTaskTriggerEvery12Hours => 'La fiecare 12 ore';

  @override
  String get adminTaskTriggerEvery24Hours => 'La fiecare 24 de ore';

  @override
  String get adminTaskTriggerEvery2Days => 'La fiecare 2 zile';

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
  String get adminTaskTriggerTime => 'Timp';

  @override
  String get adminTaskTriggerNoLimit => 'Fără limită';

  @override
  String get adminActivityJustNow => 'Chiar acum';

  @override
  String get adminActivityLastHour => 'Ultima oră';

  @override
  String get adminActivityToday => 'Astăzi';

  @override
  String get adminActivityYesterday => 'Ieri';

  @override
  String get adminActivityOlder => 'Mai în vârstă';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d acum';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h în urmă';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m în urmă';
  }

  @override
  String get adminActivityNow => 'acum';

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
      'Configurați generarea de imagini trickplay pentru miniaturile de previzualizare de căutare.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Port HTTPS public';

  @override
  String get adminNetworkingBaseUrl => 'Adresa URL de bază';

  @override
  String get adminNetworkingBaseUrlHint => 'de ex. /Jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Calea certificatului';

  @override
  String get adminNetworkingRemoteIpFilter => 'Filtru IP de la distanță';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filtru IP de la distanță';

  @override
  String get adminPlaybackVaapiDevice => 'Dispozitiv VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automat';

  @override
  String get adminPlaybackTranscodeTempPath => 'Calea temp de transcodare';

  @override
  String get adminPlaybackSegmentDeletion => 'Permite ștergerea segmentului';

  @override
  String get adminPlaybackSegmentKeep => 'Păstrarea segmentului (secunde)';

  @override
  String get adminPlaybackThrottleBuffering => 'Tampon de accelerație';

  @override
  String get adminResumeMinPct => 'Procentul minim de reluare';

  @override
  String get adminResumeMinPctSubtitle =>
      'Conținutul trebuie redat peste acest procent pentru a salva progresul';

  @override
  String get adminResumeMaxPct => 'Procentul maxim de reluare';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Conținutul este considerat redat complet după acest procent';

  @override
  String get adminResumeMinDuration => 'Durata minimă de reluare (secunde)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Elementele mai scurte decât aceasta nu pot fi reluate';

  @override
  String get adminTrickplayScanBehavior => 'Comportamentul de scanare';

  @override
  String get adminTrickplayProcessPriority => 'Prioritatea procesului';

  @override
  String get adminTrickplayTileWidth => 'Lățimea plăcilor';

  @override
  String get adminTrickplayTileHeight => 'Înălțimea plăcilor';

  @override
  String get adminTrickplayProcessThreads => 'Procesați firele';

  @override
  String get adminTrickplayWidthResolutions => 'Rezoluții de lățime';

  @override
  String get adminMetadataDefault => 'Implicit';

  @override
  String get adminMetadataContentTypeUpdated => 'Tip de conținut actualizat';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Nu s-a putut actualiza tipul de conținut: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Prag de răspuns lent (ms)';

  @override
  String get adminGeneralCachePath => 'Calea cache';

  @override
  String get adminGeneralMetadataPath => 'Calea metadatelor';

  @override
  String get adminGeneralServerName => 'Numele serverului';

  @override
  String get adminSettingsLoadFailed => 'Nu s-au încărcat setările';

  @override
  String get adminDiscover => 'Descoperi';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Nu s-au actualizat mapările: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Limită de timp: $duration';
  }

  @override
  String get folders => 'Foldere';

  @override
  String get libraries => 'Biblioteci';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay este dezactivat';

  @override
  String get syncPlayDisabledMessage =>
      'Activați SyncPlay în Setări pentru a utiliza redarea sincronizată.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Server neacceptat';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay necesită un server Jellyfin. Serverul actual nu îl acceptă.';

  @override
  String get syncPlayGroupFallbackName => 'Grupul SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'grup SyncPlay';

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
  String get syncPlayIgnoreWait => 'Ignorați așteptați';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Nu țineți grupul în timp ce acest dispozitiv se află în tampon';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continuați local fără a aștepta membrii lenți';

  @override
  String get syncPlayRepeat => 'Repeta';

  @override
  String get syncPlayRepeatOne => 'Unul';

  @override
  String get syncPlayShuffleModeShuffled => 'Amestecat';

  @override
  String get syncPlayShuffleModeSorted => 'Sortat';

  @override
  String get syncPlaySyncCurrentQueue => 'Sincronizați coada curentă de redare';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Înlocuiți coada de grup cu ceea ce se redă local';

  @override
  String get syncPlayLeaveGroup => 'Părăsiți grupul';

  @override
  String get syncPlayGroupQueue => 'Coada de grup';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Articol $index';
  }

  @override
  String get syncPlayPlayNow => 'Joacă acum';

  @override
  String get syncPlayCreateNewGroup => 'Creați un grup nou';

  @override
  String get syncPlayGroupName => 'Numele grupului';

  @override
  String get syncPlayDefaultGroupName => 'Grupul meu SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Creați grup';

  @override
  String get syncPlayAvailableGroups => 'Grupuri disponibile';

  @override
  String get syncPlayNoGroupsAvailable => 'Nu există grupuri disponibile';

  @override
  String get syncPlayJoinGroupQuestion => 'Vă alăturați grupului SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Alăturarea unui grup SyncPlay poate înlocui coada actuală de redare. Continua?';

  @override
  String get syncPlayJoin => 'Alăturați-vă';

  @override
  String get syncPlayStateIdle => 'Inactiv';

  @override
  String get syncPlayStateWaiting => 'Aşteptare';

  @override
  String get syncPlayStatePaused => 'Întrerupt';

  @override
  String get syncPlayStatePlaying => 'Joc';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName s-a alăturat grupului SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName a părăsit grupul SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Acces SyncPlay refuzat';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nu aveți acces la unul sau mai multe elemente din acest grup SyncPlay. Solicitați proprietarului grupului să verifice permisiunile bibliotecii sau să aleagă o altă coadă.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Se sincronizează redarea cu $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Căutarea vocală nu este disponibilă.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Redarea directă Dolby Vision a eșuat';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Redarea directă nu a pornit pentru acest flux Dolby Vision. Reîncercați să utilizați transcodarea serverului?';

  @override
  String get retryWithTranscode => 'Reîncercați cu transcodare';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision nu este acceptat';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Acest dispozitiv nu poate decoda direct conținutul Dolby Vision. Utilizați HDR10 alternativă sau solicitați transcodarea serverului.';

  @override
  String get rememberMyChoice => 'Ține minte alegerea mea';

  @override
  String get playHdr10Fallback => 'Redați HDR10 alternativ';

  @override
  String get requestTranscode => 'Solicitați transcodare';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Detectați rândurile expuse de pluginul „Secțiuni ecran de pornire” de la IAmParadox27. Rândurile pot fi activate și reordonate mai jos.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Niciun server Jellyfin nu raportează încă pluginul.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Detectați rândurile configurate prin pluginul „KefinTweaks” de la ranaldsgift. Secțiunile personalizate, lansate recent, vizionați din nou, sezoniere și adăugate recent în bibliotecă sunt reflectate din configurația KefinTweaks pe fiecare server Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Încă niciun server Jellyfin nu raportează KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Deschideți secțiunile de pornire';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Activați, dezactivați și reordonați rândurile';

  @override
  String get integrationInstalledButDisabled => 'Instalat dar dezactivat';

  @override
  String get integrationNotInstalled => 'Nu este instalat';

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
  String get seeAll => 'Vezi toate';

  @override
  String get noItems => 'Fără articole';

  @override
  String get switchUser => 'Schimbați utilizator';

  @override
  String get remoteControl => 'Telecomanda';

  @override
  String get mediaBarLoading => 'Se încarcă bara media...';

  @override
  String get mediaBarError => 'Bara media nu s-a încărcat';

  @override
  String get offlineServerUnavailable =>
      'Conectat la internet, dar serverul actual nu este disponibil.';

  @override
  String get offlineNoInternet =>
      'Ești offline. Este disponibil doar conținutul descărcat.';

  @override
  String get offlineFileNotAvailable => 'Fișierul nu este disponibil';

  @override
  String get offlineSwitchServer => 'Schimbați serverul';

  @override
  String get offlineSavedMedia => 'Media salvate';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Redare de la distanță';

  @override
  String castControlFailed(String error) {
    return 'Controlul proiecției a eșuat: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Comenzi';
  }

  @override
  String get castDeviceVolume => 'Volumul dispozitivului';

  @override
  String get castVolumeUnavailable => 'Indisponibil';

  @override
  String castStopKind(String kind) {
    return 'Opriți $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Subtitrări';

  @override
  String get pinConfirmTitle => 'Confirmați codul PIN';

  @override
  String get pinSetTitle => 'Setați codul PIN';

  @override
  String get pinEnterTitle => 'Introduceți codul PIN';

  @override
  String get pinReenterToConfirm => 'Reintroduceți codul PIN pentru a confirma';

  @override
  String pinEnterNDigit(int length) {
    return 'Introduceți un cod PIN din $length';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Introduceți codul PIN din $length';
  }

  @override
  String get pinIncorrect => 'PIN incorect';

  @override
  String get pinMismatch => 'PIN-urile nu se potrivesc';

  @override
  String get pinForgot => 'Ați uitat codul PIN?';

  @override
  String get pinClear => 'Clar';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Solicitare de conectare rapidă autorizată.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Codul de conectare rapidă este invalid sau a expirat.';

  @override
  String get quickConnectNotSupported =>
      'Conectarea rapidă nu este acceptată pe acest server.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Nu s-a putut autoriza codul de conectare rapidă.';

  @override
  String get quickConnectDisabled =>
      'Conectarea rapidă este dezactivată pe acest server.';

  @override
  String get quickConnectForbidden =>
      'Contul dvs. nu poate autoriza această solicitare de conectare rapidă.';

  @override
  String get quickConnectNotFound =>
      'Codul de conectare rapidă nu a fost găsit. Încercați un cod nou.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Conectarea rapidă a eșuat: $message';
  }

  @override
  String get quickConnectEnterCode => 'Introdu codul';

  @override
  String get quickConnectAuthorize => 'Autoriza';

  @override
  String remoteCommandFailed(String error) {
    return 'Comanda a eșuat: $error';
  }

  @override
  String get remoteControlTitle => 'Telecomanda';

  @override
  String get remoteFailedToLoadSessions => 'Nu s-au încărcat sesiunile';

  @override
  String get remoteNoSessions => 'Fără sesiuni controlabile';

  @override
  String get remoteStartPlayback => 'Începeți redarea pe alt dispozitiv';

  @override
  String get unknownUser => 'Necunoscut';

  @override
  String get unknownItem => 'Necunoscut';

  @override
  String get remoteNothingPlaying => 'Nu se joacă nimic în această sesiune';

  @override
  String get castingStarted => 'Proiectarea a început pe dispozitivul selectat';

  @override
  String castingFailed(String error) {
    return 'Nu s-a putut începe proiectarea: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nu sunt disponibile dispozitive de redare la distanță.';

  @override
  String get noRemoteDevicesIos =>
      'Nu sunt disponibile dispozitive de redare la distanță.\n\nPe iOS, țintele AirPlay pot fi indisponibile în simulator.';

  @override
  String get trackActionPlayNext => 'Joacă în continuare';

  @override
  String get trackActionAddToQueue => 'Adăugați la coadă';

  @override
  String get trackActionAddToPlaylist => 'Adăugați la lista de redare';

  @override
  String get trackActionCancelDownload => 'Anulează descărcarea';

  @override
  String get trackActionDeleteFromPlaylist => 'Ștergeți din lista de redare';

  @override
  String get trackActionMoveUp => 'Deplasați-vă în sus';

  @override
  String get trackActionMoveDown => 'Mutați în jos';

  @override
  String get trackActionRemoveFromFavorites => 'Eliminați din Favorite';

  @override
  String get trackActionAddToFavorites => 'Adăugați la Favorite';

  @override
  String get trackActionGoToAlbum => 'Accesați Album';

  @override
  String get trackActionGoToArtist => 'Accesați Artist';

  @override
  String trackActionDownloading(String name) {
    return 'Se descarcă $name...';
  }

  @override
  String get trackActionDeletedFile => 'Fișier descărcat șters';

  @override
  String get trackActionDeleteFileFailed =>
      'Nu s-a putut șterge fișierul descărcat';

  @override
  String get shuffleBy => 'Amestecă până la';

  @override
  String get shuffleSelectLibrary => 'Selectați Bibliotecă';

  @override
  String get shuffleSelectGenre => 'Selectați Gen';

  @override
  String get shuffleLibrary => 'Bibliotecă';

  @override
  String get shuffleGenre => 'Gen';

  @override
  String get shuffleNoLibraries =>
      'Nu există biblioteci compatibile disponibile.';

  @override
  String get shuffleNoGenres =>
      'Nu s-au găsit genuri pentru acest mod de amestecare.';

  @override
  String get posterDisplayTitle => 'Afişa';

  @override
  String get posterImageType => 'Tip imagine';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Miniatură';

  @override
  String get imageTypeBanner => 'Banner';

  @override
  String get playlistAddFailed => 'Nu s-a putut adăuga la lista de redare';

  @override
  String get playlistCreateFailed => 'Nu s-a putut crea lista de redare';

  @override
  String get playlistNew => 'Playlist nou';

  @override
  String get playlistCreate => 'Crea';

  @override
  String get playlistCreateNew => 'Creați o listă de redare nouă';

  @override
  String get playlistNoneFound => 'Nu s-au găsit liste de redare';

  @override
  String get addToPlaylist => 'Adăugați la lista de redare';

  @override
  String get lyricsNotAvailable => 'Nu există versuri disponibile';

  @override
  String get upNext => 'Următorul';

  @override
  String get playNext => 'Joacă în continuare';

  @override
  String get stillWatchingContent => 'Redarea a fost întreruptă. Încă te uiți?';

  @override
  String get stillWatchingStop => 'Stop';

  @override
  String get stillWatchingContinue => 'Continua';

  @override
  String skipSegment(String segment) {
    return 'Omite $segment';
  }

  @override
  String get liveTv => 'TV în direct';

  @override
  String get continueWatchingAndNextUp => 'Continuați vizionarea și Următorul';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Se descarcă $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Se descarcă $fileName';
  }

  @override
  String get nextEpisode => 'Următorul episod';

  @override
  String get moreFromThisSeason => 'Mai multe din acest sezon';

  @override
  String get playerTooltipPlaybackSpeed => 'Viteza de redare';

  @override
  String get playerTooltipCastControls => 'Controale de difuzare';

  @override
  String get playerTooltipPlaybackQuality => 'Rata de biți';

  @override
  String get playerTooltipEnterFullscreen => 'Intrați pe ecran complet';

  @override
  String get playerTooltipExitFullscreen => 'Ieșiți din ecranul complet';

  @override
  String get playerTooltipFloatOnTop => 'Plutește deasupra';

  @override
  String get playerTooltipExitFloatOnTop => 'Dezactivează plutirea deasupra';

  @override
  String get playerTooltipLockLandscape => 'Blocați peisaj';

  @override
  String get playerTooltipUnlockOrientation => 'Permite rotația';

  @override
  String get playerTooltipPrevious => 'Anterior';

  @override
  String get playerTooltipSeekBack => 'Caută înapoi';

  @override
  String get playerTooltipSeekForward => 'Caută înainte';

  @override
  String get contextMenuMarkWatched => 'Marcați ca Vizionat';

  @override
  String get contextMenuMarkUnwatched => 'Marcați ca Nevizionat';

  @override
  String get contextMenuAddToFavorites => 'Adăugați la Favorite';

  @override
  String get contextMenuRemoveFromFavorites => 'Eliminați din Favorite';

  @override
  String get contextMenuGoToSeries => 'Accesați Seria';

  @override
  String get settingsAdministrationSubtitle =>
      'Accesați panoul de administrare a serverului';

  @override
  String get settingsAccountSecurity => 'Cont și securitate';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentificare, cod PIN și control parental';

  @override
  String get settingsPersonalization => 'Personalizare';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigarea, rândurile de pornire și vizibilitatea bibliotecii';

  @override
  String get settingsDynamicContent => 'Conținut dinamic';

  @override
  String get settingsDynamicContentSubtitle =>
      'Bara media și suprapuneri vizuale';

  @override
  String get settingsPlaybackSyncplay => 'Redare și SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Setări audio/video, subtitrări, descărcări și controale SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sincronizare plugin, Seerr, evaluări și multe altele';

  @override
  String get settingsAboutSubtitle =>
      'Versiunea aplicației, informații juridice și credite';

  @override
  String get settingsAuthenticationSection => 'AUTENTIFICARE';

  @override
  String get settingsSortServersBy => 'Sortați serverele după';

  @override
  String get settingsLastUsed => 'Ultima utilizare';

  @override
  String get settingsAlphabetical => 'Alfabetic';

  @override
  String get settingsPrivacyAndSafetySection =>
      'CONFIDENTIALITATE SI SIGURANTA';

  @override
  String get settingsBlockedRatings => 'Evaluări blocate';

  @override
  String get settingsGeneralStyle => 'Stil general';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Accente teme, fundaluri, indicatori vizionați și muzică tematică';

  @override
  String get settingsHomePage => 'Pagina principală';

  @override
  String get settingsHomePageSubtitle =>
      'Secțiuni, tipuri de imagini, suprapuneri și previzualizări media';

  @override
  String get settingsLibrariesSubtitle =>
      'Vizibilitatea bibliotecii, vizualizarea folderului și comportamentul pe mai multe servere';

  @override
  String get settingsTwentyFourHourClock => 'Ceas de 24 de ore';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Utilizați formatarea oră de 24 de ore oriunde este afișat ceasul';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Afișați butonul de amestecare în bara de navigare';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Afișați butonul genuri în bara de navigare';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Afișați butonul de favorite în bara de navigare';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Afișați butonul biblioteci în bara de navigare';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Show the Seerr button in the navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Comutați vizibilitatea paginii de pornire pentru fiecare bibliotecă. Reporniți Moonfin pentru ca modificările să intre în vigoare.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Bara media și previzualizările locale';

  @override
  String get settingsVisualOverlays => 'Suprapuneri vizuale';

  @override
  String get settingsSeasonalSurprise => 'Surpriză de sezon';

  @override
  String get settingsMetadataAndRatings => 'Metadate și evaluări';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase alimentează integrările pe partea de server, inclusiv surse de evaluare suplimentare, solicitări Seerr și preferințe sincronizate.';

  @override
  String get settingsOfflineDownloads => 'Descărcări offline';

  @override
  String get settingsHigh => 'Ridicat';

  @override
  String get settingsLow => 'Scăzut';

  @override
  String get settingsCustomPath => 'Cale personalizată';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Introduceți calea folderului de descărcare';

  @override
  String get settingsConcurrentDownloads => 'Descărcări simultane';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Numărul maxim de articole de descărcat simultan.';

  @override
  String get settingsAppInfo => 'INFORMAȚII APP';

  @override
  String get settingsReportAnIssue => 'Raportați o problemă';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Deschideți instrumentul de urmărire a problemelor pe GitHub';

  @override
  String get settingsJoinDiscord => 'Alăturați-vă Discordului';

  @override
  String get settingsJoinDiscordSubtitle => 'Chat cu comunitatea';

  @override
  String get settingsJoinTheDiscord => 'Alăturați-vă Discordului';

  @override
  String get settingsSupportMoonfin => 'Susține Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donează o cafea dezvoltatorului';

  @override
  String get settingsLegal => 'LEGALE';

  @override
  String get settingsLicenses => 'Licențe';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Notificări de licență open-source';

  @override
  String get settingsPrivacyPolicy => 'Politica de confidențialitate';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Cum vă gestionează Moonfin datele';

  @override
  String get settingsCheckForUpdates => 'Verificați actualizările';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Verificați cea mai recentă versiune Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Alimentat de Flutter';

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
  String get settingsBoth => 'ambele';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Amestecă filtrul tip conținut';

  @override
  String get settingsVideoPlaybackPreferences => 'Preferințe de redare video';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Motorul video de bază și setările de calitate în flux';

  @override
  String get settingsAudioPreferences => 'Preferințe audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Piese audio, procesare și opțiuni de trecere';

  @override
  String get settingsAutomationAndQueue => 'Automatizare și coadă';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Redare automată și secvențiere';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Calitatea descărcării, limitele de stocare și dimensiunea cozii';

  @override
  String get settingsSyncplaySubtitle =>
      'Logica de sincronizare pentru sesiunile de grup';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Caracteristici specializate ale jucătorilor. Utilizați cu precauție, deoarece unele opțiuni pot cauza probleme de redare';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Sari peste introsuri si versiuni suplimentare?';

  @override
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

  @override
  String get settingsPromptUser => 'Prompt utilizator';

  @override
  String get settingsSkip => 'Sari peste';

  @override
  String get settingsDoNothing => 'Nu face nimic';

  @override
  String get settingsMaxBitrateDescription =>
      'Limitați rata de biți în flux. Conținutul peste acest prag va fi transcodat pentru a se potrivi.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limitați rezoluția maximă pe care o va solicita jucătorul. Conținutul cu rezoluție mai mare va fi transcodat în jos.';

  @override
  String get settingsPlayerZoomDescription =>
      'Cum ar trebui să fie scalat videoclipul pentru a se potrivi pe ecran.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Motor de redare (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Alegeți motorul de redare implicit pe dispozitivele Android TV. Modificările se aplică la următoarea sesiune de redare.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (recomandat)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (moștenire)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (moștenire)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recomandat)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision De rezervă';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Comportament pentru titlurile Dolby Vision pe dispozitive fără decodare Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Întreabă de fiecare dată';

  @override
  String get settingsPreferHdr10Fallback => 'Prefer HDR10 alternativă';

  @override
  String get settingsPreferServerTranscode => 'Preferă transcodarea serverului';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 Redare directă';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Controlează dacă fluxurile din stratul de îmbunătățire al profilului Dolby Vision 7 ar trebui să direcționeze redarea.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFTKRT activat)';

  @override
  String get settingsEnabledOnThisDevice => 'Activat pe acest dispozitiv';

  @override
  String get settingsDisabledPreferTranscode =>
      'Dezactivat (prefer transcodare)';

  @override
  String get settingsResumeRewindDescription =>
      'La reluarea redării (de pe pagina Continuă vizionarea sau dintr-o pagină a unui element media), câte secunde ar trebui să fie derulat înapoi?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Când reluați redarea după apăsarea butonului de pauză, câte secunde ar trebui să fie derulat înapoi?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Câte secunde să sari înapoi după apăsarea butonului de derulare înapoi.';

  @override
  String get settingsOneSecond => '1 secundă';

  @override
  String get settingsThreeSeconds => '3 secunde';

  @override
  String get settingsFortyFiveSeconds => '45 de secunde';

  @override
  String get settingsSixtySeconds => '60 de secunde';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Câte secunde să sari înainte după apăsarea butonului de derulare rapidă înainte.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 către decodor extern';

  @override
  String get settingsCinemaMode => 'Modul Cinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Redați remorci/preroll-uri înainte de o funcție principală';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extins afișează un card complet cu ilustrația și descrierea episodului. Minimal arată o suprapunere compactă de numărătoare inversă. Dezactivat ascunde complet promptul.';

  @override
  String get settingsShort => 'Scurt';

  @override
  String get settingsLong => 'Lung';

  @override
  String get settingsVeryLong => 'Foarte lung';

  @override
  String get settingsVideoStartDelay => 'Întârziere pornire video';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Live TV Direct';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Activați redarea directă pentru TV în direct';

  @override
  String get settingsOpenGroups => 'Grupuri deschise';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Creați, alăturați-vă sau gestionați grupuri SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay activat';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Activați funcțiile de vizionare în grup';

  @override
  String get settingsSyncplayButton => 'Butonul SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Afișați butonul SyncPlay pe bara de navigare';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Corecție avansată';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Activați logica de sincronizare fină';

  @override
  String get settingsSyncplaySyncCorrection => 'Corectare sincronizare';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Reglați automat redarea pentru a rămâne sincronizat';

  @override
  String get settingsSyncplaySpeedToSync => 'Viteza de sincronizare';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Utilizați reglarea vitezei de redare pentru a sincroniza';

  @override
  String get settingsSyncplaySkipToSync => 'Treci la Sincronizare';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Utilizați căutarea pentru sincronizare';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Întârziere de viteză minimă';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Întârziere de viteză maximă';

  @override
  String get settingsSyncplaySpeedDuration => 'Durata vitezei';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Întârziere minimă de ignorare';

  @override
  String get settingsSyncplayExtraOffset => 'Offset suplimentar SyncPlay';

  @override
  String get onNow => 'Pe Acum';

  @override
  String get collections => 'Colecții';

  @override
  String get lastPlayed => 'Ultima jucat';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Cel mai recent $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Redare automată episodul următor';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Redați automat episodul următor când este disponibil.';

  @override
  String get skipSilenceTitle => 'Sari peste tăcere';

  @override
  String get skipSilenceSubtitle =>
      'Omite automat segmentele audio silențioase atunci când este acceptat de flux.';

  @override
  String get allowExternalAudioEffectsTitle => 'Permite efecte audio externe';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Permiteți aplicațiilor de egalizare și efecte (de exemplu, Wavelet) să se atașeze la sesiunile de redare Media3.';

  @override
  String get disableTunnelingTitle => 'Dezactivați tunelul';

  @override
  String get disableTunnelingSubtitle =>
      'Forțați redarea fără tunel. Util pe dispozitive cu discontinuități audio/video de tunel.';

  @override
  String get enableTunnelingTitle => 'Enable tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Advanced. Routes audio and video through a coupled hardware path. Off by default because it causes audio/video dropouts on some devices.';

  @override
  String get mapDolbyVisionP7Title => 'Hartați Dolby Vision profilul 7 la HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Redați 7 fluxuri de profil Dolby Vision ca HEVC compatibil HDR10 pe dispozitive care nu sunt DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Utilizați stiluri de subtitrare încorporate';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Aplicați culori, fonturi și poziționare încorporate în pista de subtitrare. Dezactivați pentru a utiliza preferințele pentru stilul subtitrării.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Folosiți dimensiunile fontului de subtitrare încorporate';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Aplicați indicii privind dimensiunea fontului încorporate în pista de subtitrare. Dezactivați utilizarea dimensiunii subtitrarilor din preferințele dvs. de stil.';

  @override
  String get useDetailedSubHeadings => 'Utilizați subtitluri detaliate';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Afișați subrândurile detaliate sau minime pe paginile Bibliotecii.';

  @override
  String get savedThemesDeleteDialogTitle => 'Ștergeți tema salvată?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Eliminați „$themeName” din memoria cache a dispozitivului?';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '„$themeName” a fost șters de pe acest dispozitiv.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Nu s-a putut șterge „$themeName”.';
  }

  @override
  String get savedThemesTitle => 'Teme salvate';

  @override
  String get savedThemesDescription =>
      'Acestea sunt teme descărcate din pluginul Moonfin pentru serverul curent. Ștergerea elimină numai această copie locală.';

  @override
  String get savedThemesEmpty =>
      'Nu au fost găsite teme salvate pentru acest server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Activ în prezent';
  }

  @override
  String get savedThemesDeleteTooltip => 'Ștergeți tema salvată';

  @override
  String get savedThemesManageSubtitle =>
      'Gestionați temele de plugin descărcate pe acest dispozitiv';

  @override
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Secțiunile ecranului de pornire';

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
