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
  String get accountPreferences => 'PREFERINȚE CONT';

  @override
  String get interfaceLanguage => 'Limba interfeței';

  @override
  String get systemLanguageDefault => 'Implicit din sistem';

  @override
  String get signIn => 'Conectare';

  @override
  String get empty => 'Gol';

  @override
  String connectingToServer(String serverName) {
    return 'Se conectează la $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get back => 'Înapoi';

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
  String get remove => 'Elimină';

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
  String get detailScreenStyle => 'Stilul ecranului de detalii';

  @override
  String get detailScreenStyleSubtitle =>
      'Clasic este aspectul centrat original Moonfin. Modern este un aspect cinematografic adaptiv.';

  @override
  String get detailScreenStyleMoonfin => 'Clasic';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get expandedTabs => 'File extinse';

  @override
  String get expandedTabsSubtitle =>
      'Afișează automat conținutul filelor în timp ce navigați printre ele. Dezactivați pentru a deschide și închide fiecare filă manual.';

  @override
  String get showTechnicalDetails => 'Afișați detaliile tehnice?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Afișează informații despre codec, rezoluție și flux în rezumatul din banner';

  @override
  String get recommendationSystem => 'Sistem de recomandări';

  @override
  String get recommendationSystemSubtitle =>
      'Folosiți algoritmul local Moonfin Recommends sau metricile de similaritate TMDb online. Notă: recomandările online necesită integrarea Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Similaritate TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Aplicați limita de clasificare parentală?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limitează sugestiile Moonfin Recommends în funcție de clasificarea parentală a conținutului vizat';

  @override
  String get interfaceStyle => 'Stilul interfeței';

  @override
  String get interfaceStyleSubtitle =>
      'Automat se potrivește cu dispozitivul dvs. Alegeți Apple sau Material pentru a impune un anumit aspect.';

  @override
  String get interfaceStyleAutomatic => 'Automat';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Calitatea efectului de sticlă';

  @override
  String get glassQualitySubtitle =>
      'Auto alege cel mai bun efect de sticlă pentru acest dispozitiv. Complet impune estomparea reală, iar Redus folosește un efect de sticlă ușor, care economisește resursele GPU.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Complet';

  @override
  String get glassQualityReduced => 'Redus';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Comutați între Moonfin și Neon Pulse fără a reporni aplicația';

  @override
  String get customThemeTitle => 'Temă personalizată';

  @override
  String get customThemeSubtitle =>
      'Temele personalizate modifică elementele vizuale din întreaga aplicație Moonfin. Alegeți una dintre aceste opțiuni, potrivită stilului dvs.';

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
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Stil liquid-glass, cu un fundal în degrade care se deplasează lent, suprafețe mate și accent albastru Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Stil retro pixel-art, cu o paletă masivă, borduri în blocuri, umbre puternice și un font pixelat';

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
  String get gameMenu => 'Meniu';

  @override
  String get gamePaused => 'În pauză';

  @override
  String get gameSaveState => 'Salvează starea';

  @override
  String get games => 'Jocuri';

  @override
  String get gameLoadState => 'Încarcă starea';

  @override
  String get gameFastForward => 'Derulare rapidă';

  @override
  String get gameEmulatorSettings => 'Setări emulator';

  @override
  String get gameNoCoreOptions => 'Acest nucleu nu are opțiuni reglabile.';

  @override
  String get gameHoldToOpenMenu => 'Țineți apăsat pentru meniu';

  @override
  String get gamePlaybackUnsupported =>
      'Rularea jocurilor nu este încă acceptată pe acest dispozitiv.';

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
  String get series => 'Seriale';

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
  String get extraLarge => 'Foarte mare';

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
  String get apply => 'Aplică';

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
  String get resume => 'Reia';

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
  String get watched => 'Vizionate';

  @override
  String get unread => 'Necitit';

  @override
  String get unwatched => 'Nevizionate';

  @override
  String get seriesStatus => 'Stare serie';

  @override
  String get allLibraries => 'Toate Bibliotecile';

  @override
  String get books => 'Cărți';

  @override
  String get latestBooks => 'Cele mai recente cărți';

  @override
  String get latestAudiobooks => 'Cele mai recente cărți audio';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cărți',
      few: '$count cărți',
      one: '1 carte',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Carte';

  @override
  String get bookFormatAudiobook => 'Carte audio';

  @override
  String bookPercentRead(int percent) {
    return '$percent% citit';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time rămase';
  }

  @override
  String get bookHeroRead => 'Citește';

  @override
  String get bookHeroListen => 'Ascultă';

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
      other: '$count de cărți audio',
      few: '$count cărți audio',
      one: '1 carte audio',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lista de piese';

  @override
  String get itemListPlaceholder => 'Lista articolelor va apărea aici';

  @override
  String get failedToLoad => 'Nu s-a putut încărca';

  @override
  String get delete => 'Șterge';

  @override
  String get save => 'Salvează';

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
  String get seasons => 'Sezoane';

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
    return 'Discul $number';
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
      other: '$count de Sezoane',
      few: '$count Sezoane',
      one: '1 Sezon',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Se termină la $time';
  }

  @override
  String get items => 'Elemente';

  @override
  String get extras => 'Extra';

  @override
  String get behindTheScenes => 'Din culise';

  @override
  String get deletedScenes => 'Scene șterse';

  @override
  String get featurettes => 'Featurette-uri';

  @override
  String get interviews => 'Interviuri';

  @override
  String get scenes => 'Scene';

  @override
  String get shorts => 'Scurtmetraje';

  @override
  String get trailers => 'Trailere';

  @override
  String timeRemaining(String time) {
    return '$time rămase';
  }

  @override
  String endsIn(String time) {
    return 'Se termină în $time';
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
  String get play => 'Redă';

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
  String get cast => 'Proiectează';

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
  String get none => 'Niciuna';

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
  String get director => 'REGIZOR';

  @override
  String get directors => 'REGIZORI';

  @override
  String get writer => 'SCENARIST';

  @override
  String get writers => 'SCENARIȘTI';

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
      other: '$count de piese',
      few: '$count piese',
      one: '1 piesă',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de capitole',
      few: '$count capitole',
      one: '1 capitol',
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
  String get shuffle => 'Aleatoriu';

  @override
  String get shuffleAllMusic => 'Redă aleatoriu toată muzica';

  @override
  String get carSignInPrompt => 'Conectați-vă la Moonfin pe telefon';

  @override
  String get carServerUnreachable => 'Serverul nu poate fi contactat';

  @override
  String downloadsCount(int count) {
    return '$count descărcări';
  }

  @override
  String get perfectMatch => 'Potrivire perfectă';

  @override
  String channelsCount(int count) {
    return '${count}can.';
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
  String get reset => 'Resetează';

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
  String get directStream => 'Flux direct';

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
  String get track => 'Piesă';

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
  String guideNextProgram(String time, String title) {
    return 'Urmează: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m rămase';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h rămase';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m rămase';
  }

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
  String get record => 'Înregistrează';

  @override
  String get cancelRecordingAction => 'Anulează înregistrarea';

  @override
  String get programSetToRecord => 'Program setat pentru înregistrare';

  @override
  String get recordingCancelled => 'Înregistrare anulată';

  @override
  String get unableToCreateRecording => 'Nu se poate crea înregistrarea';

  @override
  String get watch => 'Vizionează';

  @override
  String get close => 'Închide';

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
      other: '$count de episoade',
      few: '$count episoade',
      one: '1 episod',
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
  String get themeMusicSettingsSubtitle =>
      'Pagini de detalii, rânduri de pe ecranul principal și volum';

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
  String get loopThemeMusic => 'Repetă muzica tematică';

  @override
  String get loopThemeMusicSubtitle =>
      'Repetă piesa în loc să o redea o singură dată';

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
  String get settingsScrollWheelAction => 'Rotița mouse-ului';

  @override
  String get settingsScrollWheelActionDescription =>
      'Alegeți ce se întâmplă când derulați cu rotița mouse-ului peste videoclip în timpul redării.';

  @override
  String get scrollWheelActionOff => 'Oprit';

  @override
  String get scrollWheelActionSeek => 'Derulare (înainte / înapoi)';

  @override
  String get scrollWheelActionVolume => 'Volum';

  @override
  String get playerTooltipVolume => 'Volum';

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
  String get fallbackAudioLanguage => 'Limbă audio de rezervă';

  @override
  String get preferDefaultAudioTrack => 'Preferă pista audio implicită';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Preferă pista audio originală în locul dublajului localizat.';

  @override
  String get preferAudioDescription => 'Preferă pistele cu descriere audio';

  @override
  String get preferAudioDescriptionDescription =>
      'Preferă pistele cu descriere audio în locul celor normale.';

  @override
  String get transcodingAudio => 'Transcodare (Audio)';

  @override
  String get directStreamRemux => 'Flux direct (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcodare (Bitrate sau rezoluție)';

  @override
  String get transcodingVideoAndAudio => 'Transcodare (Video & Audio)';

  @override
  String get transcodingVideo => 'Transcodare (Video)';

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
  String get settingsAudioOutputModeDescription =>
      'Alegeți modul în care este decodat sunetul. AVR Passthrough trimite fluxurile Dolby/DTS brute către receiverul dvs., iar Auto sau Downmix decodează local.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Codec de rezervă audio';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Selectați formatul țintă pentru transcodarea sunetului multicanal atunci când fluxul sursă nu poate fi redat direct sau trimis prin passthrough.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Detectare automată\n(Recomandat)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Implicit)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Fără pierderi)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Doar stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Eficient)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Fără pierderi)';

  @override
  String get settingsMaxAudioChannels => 'Număr maxim de canale audio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configurați numărul maxim de canale al sistemului dvs. audio. Fluxurile multicanal care depășesc această limită vor fi downmixate sau transcodate.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Detectare automată\n(Implicit hardware)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Cvadrafonic';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (avansat)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough codec';

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
  String get settingsAudioRouteHeadphones => 'Căști';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}can. PCM';
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
  String get nextUpDisplay => 'Afișare „Urmează”';

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
  String get mediaQueuing => 'Coadă media';

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
  String get subtitleMode => 'Mod subtitrări';

  @override
  String get subtitleModeFlagged => 'Marcate';

  @override
  String get subtitleModeAlways => 'Întotdeauna';

  @override
  String get subtitleModeForeign => 'Străine';

  @override
  String get subtitleModeForced => 'Forțate';

  @override
  String get subtitleModeFlaggedDescription =>
      'Redă pistele marcate intern în metadatele fișierului media drept „implicite” sau „forțate”.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Încarcă și afișează automat subtitrările de fiecare dată când începe un videoclip.';

  @override
  String get subtitleModeForeignDescription =>
      'Activează automat subtitrările dacă pista audio implicită este într-o limbă străină.';

  @override
  String get subtitleModeForcedDescription =>
      'Încarcă doar subtitrările marcate explicit cu indicatorul de metadate „forțat”.';

  @override
  String get subtitleModeNoneDescription =>
      'Dezactivează complet încărcarea automată a subtitrărilor.';

  @override
  String get fallbackSubtitleLanguage => 'Limbă de rezervă pentru subtitrări';

  @override
  String get subtitleStream => 'Flux de subtitrare';

  @override
  String get subtitlePreviewText => 'Vulpea maro iute sare peste câinele leneș';

  @override
  String get verticalOffset => 'Offset vertical';

  @override
  String get pgsDirectPlay => 'Redare directă PGS';

  @override
  String get directPlayPgsSubtitles => 'Redare directă subtitrări PGS';

  @override
  String get assSsaDirectPlay => 'Redare directă ASS/SSA';

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
  String get reportDownloadsActivity => 'Afișează descărcările pe server';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Permiteți administratorului serverului să vă vadă descărcările transcodate în panoul de control';

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
  String get navbarAlwaysExpanded =>
      'Afișează mereu etichetele barei de navigare';

  @override
  String get showSeerrButton => 'Afișează butonul Seerr';

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
  String get teal => 'Turcoaz';

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
  String get groupItemsIntoCollections => 'Grupează elementele în colecții';

  @override
  String get hideCollectionAssociatedItems =>
      'Ascunde elementele asociate colecțiilor când navigați prin biblioteci';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Notificare privind gruparea bibliotecii';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Pentru a folosi această setare, asigurați-vă că setările de bibliotecă „Grupează filmele în colecții” și/sau „Grupează serialele în colecții” sunt activate în setările de afișare ale bibliotecii de pe serverul Jellyfin sau Emby.';

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
  String get mediaBar => 'Bară media';

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
  String get trailerAudio => 'Sunet trailer';

  @override
  String get enableTrailerAudio =>
      'Activează sunetul pentru trailerele din bara media';

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
  String get fullScreenRows => 'Rânduri extinse pe ecranul principal';

  @override
  String get fullScreenRowsDescription =>
      'Limitează ecranul principal la un singur rând';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Tip de imagine pe rând';

  @override
  String get perRowSettings => 'Setări pe rând';

  @override
  String get autoLogin => 'Conectare automată';

  @override
  String get lastUser => 'Ultimul utilizator';

  @override
  String get currentUser => 'Utilizator curent';

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
  String get mode => 'Mod';

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
  String get clockModeStatic => 'Static';

  @override
  String get clockModeBouncing => 'În mișcare';

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
  String get pluginLabel => 'Plugin Moonbase';

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
  String get trending => 'În tendințe';

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
  String get seerrDiscoveryRows => 'Rânduri de descoperire Seerr';

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
  String get seerrNotificationsSection => 'Notificări';

  @override
  String get seerrNotifyNewRequestsTitle => 'Notificări pentru cereri noi';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Anunță-mă când cineva trimite o cerere';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Actualizări ale cererilor';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Aprobate, respinse și adăugate în biblioteca dvs.';

  @override
  String get seerrNotifyIssuesTitle => 'Actualizări ale problemelor';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Probleme noi, răspunsuri și rezolvări';

  @override
  String loggedInAs(String username) {
    return 'Conectat ca: $username';
  }

  @override
  String get discoverRows => 'Pagina de descoperire Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Activați rândurile pe care doriți să le vedeți pe pagina principală Seerr. Trageți pentru a le reordona. Ordinea personalizată se sincronizează cu Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Activați rândurile pe care doriți să le vedeți pe pagina principală Seerr. Trageți pentru a le reordona. Ordinea personalizată se sincronizează cu Moonbase.';

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
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limita memoriei cache pentru imagini';

  @override
  String get clearImageCache => 'Golește memoria cache pentru imagini';

  @override
  String get imageCacheCleared => 'Memoria cache pentru imagini a fost golită';

  @override
  String get clear => 'Golește';

  @override
  String get browse => 'Răsfoiește';

  @override
  String get noResults => 'Niciun rezultat';

  @override
  String get seerrAvailableStatus => 'Disponibil';

  @override
  String get seerrRequestedStatus => 'Solicitat';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Se descarcă · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Se importă';

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
  String get similar => 'Similare';

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
  String get blocklistedStatus => 'Pe lista de blocare';

  @override
  String get deletedStatus => 'Șters';

  @override
  String get failedStatus => 'Eșuat';

  @override
  String get processingStatus => 'În procesare';

  @override
  String modifiedByName(String name) {
    return 'Modificat de $name';
  }

  @override
  String get completedStatus => 'Finalizat';

  @override
  String get requestErrorDuplicate => 'Acest titlu a fost deja cerut';

  @override
  String get requestErrorQuota => 'Ați atins limita de cereri';

  @override
  String get requestErrorBlocklisted => 'Acest titlu este pe lista de blocare';

  @override
  String get requestErrorNoSeasons => 'Nu mai sunt sezoane de cerut';

  @override
  String get requestErrorPermission =>
      'Nu aveți permisiunea de a face această cerere';

  @override
  String get seerrRequestsTitle => 'Cereri';

  @override
  String get seerrIssuesTitle => 'Probleme';

  @override
  String get sortNewest => 'Cele mai noi';

  @override
  String get sortLastModified => 'Ultima modificare';

  @override
  String get noIssues => 'Nicio problemă';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining din $limit cereri de filme rămase';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining din $limit cereri de sezoane rămase';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Face parte din $name';
  }

  @override
  String get viewCollection => 'Vezi colecția';

  @override
  String get requestCollection => 'Cere colecția';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filme · $available disponibile';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Cere $count filme';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Se cere $current din $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Au fost cerute $count filme';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Au fost cerute $ok din $total filme';
  }

  @override
  String get collectionAllRequested =>
      'Toate filmele sunt deja disponibile sau cerute';

  @override
  String get reportIssue => 'Raportează o problemă';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Care este problema?';

  @override
  String get allEpisodes => 'Toate episoadele';

  @override
  String get episode => 'Episod';

  @override
  String get openStatus => 'Deschisă';

  @override
  String get resolvedStatus => 'Rezolvată';

  @override
  String get resolveAction => 'Rezolvă';

  @override
  String get reopenAction => 'Redeschide';

  @override
  String reportedByName(String name) {
    return 'Raportată de $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comentarii';
  }

  @override
  String get addComment => 'Adăugați un comentariu';

  @override
  String get deleteIssueConfirm => 'Ștergeți această problemă?';

  @override
  String get submitReport => 'Trimite raportul';

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
  String get seasonsLabel => 'Sezoane';

  @override
  String get episodesLabel => 'Episoade';

  @override
  String get access => 'Acces';

  @override
  String get add => 'Adaugă';

  @override
  String get address => 'Adresa';

  @override
  String get analytics => 'Analiză';

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
  String get done => 'Gata';

  @override
  String get edit => 'Editează';

  @override
  String get encoding => 'Codificare';

  @override
  String get error => 'Eroare';

  @override
  String get forward => 'Înainte';

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
  String get remote => 'Telecomandă';

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
  String get search => 'Caută';

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
  String get stop => 'Oprește';

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
  String get mute => 'Fără sunet';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Bord';

  @override
  String get adminDrawerAnalytics => 'Analiză';

  @override
  String get adminDrawerSettings => 'Setări';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Utilizatori';

  @override
  String get adminDrawerLibraries => 'Biblioteci';

  @override
  String get adminDrawerDisplay => 'Afișare';

  @override
  String get adminDrawerMetadata => 'Metadate';

  @override
  String get adminDrawerNfo => 'Setări NFO';

  @override
  String get adminDrawerTranscoding => 'Transcodare';

  @override
  String get adminDrawerResume => 'Reluare';

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
  String get sessionPrev => 'Anter.';

  @override
  String get sessionRewind => 'Derulează înapoi';

  @override
  String get sessionForward => 'Înainte';

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
  String get hwAccel => 'Accel. HW';

  @override
  String get completion => 'Finalizare';

  @override
  String get direct => 'Direct';

  @override
  String get adminDisconnect => 'Deconecta';

  @override
  String get adminClearDates => 'Date clare';

  @override
  String get adminActivitySeverityAll => 'Toate nivelurile de gravitate';

  @override
  String get adminActivityDateRange => 'Interval de date';

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
  String adminRemoveDeviceConfirm(String name) {
    return 'Eliminați dispozitivul „$name”? Utilizatorul va trebui să se conecteze din nou pe acest dispozitiv.';
  }

  @override
  String get adminDeleteAllDevices => 'Șterge toate dispozitivele';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Eliminați $count dispozitive? Utilizatorii afectați vor trebui să se conecteze din nou. Dispozitivul dvs. curent nu este afectat.';
  }

  @override
  String get adminDevicesDeletedAll => 'Dispozitivele au fost eliminate';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Unele dispozitive au fost eliminate; $count nu au putut fi eliminate.';
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
  String get adminLibraryTabPaths => 'Căi';

  @override
  String get adminLibraryTabOptions => 'Opțiuni';

  @override
  String get adminLibraryTabDownloaders => 'Servicii de descărcare';

  @override
  String get adminLibMetadataSavers => 'Servicii de salvare a metadatelor';

  @override
  String get adminLibSubtitleDownloaders =>
      'Servicii de descărcare a subtitrărilor';

  @override
  String get adminLibLyricDownloaders => 'Servicii de descărcare a versurilor';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Servicii de descărcare a metadatelor: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Servicii de preluare a imaginilor: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Acest server nu oferă servicii de descărcare pentru acest tip de bibliotecă.';

  @override
  String get adminLibrarySectionGeneral => 'General';

  @override
  String get adminLibrarySectionMetadata => 'Metadate';

  @override
  String get adminLibrarySectionEmbedded => 'Informații încorporate';

  @override
  String get adminLibrarySectionSubtitles => 'Subtitrări';

  @override
  String get adminLibrarySectionImages => 'Imagini';

  @override
  String get adminLibrarySectionSeries => 'Seriale';

  @override
  String get adminLibrarySectionMusic => 'Muzică';

  @override
  String get adminLibrarySectionMovies => 'Filme';

  @override
  String get adminLibRealtimeMonitor => 'Activează monitorizarea în timp real';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detectează modificările fișierelor și le procesează automat.';

  @override
  String get adminLibArchiveMediaFiles => 'Tratează arhivele ca fișiere media';

  @override
  String get adminLibEnablePhotos => 'Afișează fotografiile';

  @override
  String get adminLibSaveLocalMetadata =>
      'Salvează imaginile în folderele media';

  @override
  String get adminLibRefreshInterval => 'Reîmprospătare automată a metadatelor';

  @override
  String get adminLibRefreshNever => 'Niciodată';

  @override
  String get adminLibDefault => 'Implicit';

  @override
  String get adminLibDisplayTitle => 'Afișare';

  @override
  String get adminLibDisplaySection => 'Afișarea bibliotecii';

  @override
  String get adminLibFolderView =>
      'Afișează o vizualizare de foldere pentru folderele media simple';

  @override
  String get adminLibSpecialsInSeasons =>
      'Afișează episoadele speciale în sezoanele în care au fost difuzate';

  @override
  String get adminLibGroupMovies => 'Grupează filmele în colecții';

  @override
  String get adminLibGroupShows => 'Grupează serialele în colecții';

  @override
  String get adminLibExternalSuggestions =>
      'Afișează conținut extern în sugestii';

  @override
  String get adminLibDateAddedSection => 'Comportamentul datei adăugării';

  @override
  String get adminLibDateAddedLabel => 'Folosește data adăugării din';

  @override
  String get adminLibDateAddedImport => 'Data scanării în bibliotecă';

  @override
  String get adminLibDateAddedFile => 'Data creării fișierului';

  @override
  String get adminLibMetadataTitle => 'Metadate și imagini';

  @override
  String get adminLibMetadataLangSection => 'Limba preferată pentru metadate';

  @override
  String get adminLibChaptersSection => 'Capitole';

  @override
  String get adminLibDummyChapterDuration =>
      'Durata capitolelor generate (secunde)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Durata capitolelor generate pentru conținutul media care nu are capitole. Setați 0 pentru dezactivare.';

  @override
  String get adminLibChapterImageResolution =>
      'Rezoluția imaginilor de capitol';

  @override
  String get adminLibNfoTitle => 'Setări NFO';

  @override
  String get adminLibNfoHelp =>
      'Metadatele NFO sunt compatibile cu Kodi și cu clienți similari. Setările se aplică tuturor bibliotecilor care salvează metadate NFO.';

  @override
  String get adminLibKodiUser =>
      'Utilizatorul pentru care se salvează datele de vizionare în fișierele NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Salvează căile imaginilor în fișierele NFO';

  @override
  String get adminLibPathSubstitution =>
      'Activează substituția căilor pentru imaginile din fișierele NFO';

  @override
  String get adminLibExtraThumbs =>
      'Copiază imaginile extrafanart într-un folder extrathumbs';

  @override
  String get adminLibNone => 'Niciunul';

  @override
  String adminLibRefreshDays(int days) {
    return '$days zile';
  }

  @override
  String get adminLibEmbeddedTitles => 'Folosește titlurile încorporate';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Folosește titlurile încorporate pentru materialele extra';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Folosește informațiile încorporate despre episoade';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Permite subtitrările încorporate';

  @override
  String get adminLibEmbeddedAllowAll => 'Permite toate';

  @override
  String get adminLibEmbeddedAllowText => 'Doar text';

  @override
  String get adminLibEmbeddedAllowImage => 'Doar imagine';

  @override
  String get adminLibEmbeddedAllowNone => 'Niciuna';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Omite descărcarea dacă există subtitrări încorporate';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Omite descărcarea dacă pista audio corespunde limbii de descărcare';

  @override
  String get adminLibRequirePerfectMatch =>
      'Necesită o potrivire perfectă a subtitrării';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Salvează subtitrările în folderele media';

  @override
  String get adminLibChapterImageExtraction => 'Extrage imaginile de capitol';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extrage imaginile de capitol în timpul scanării bibliotecii';

  @override
  String get adminLibTrickplayExtraction =>
      'Activează extragerea imaginilor Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extrage imaginile Trickplay în timpul scanării bibliotecii';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Salvează imaginile Trickplay în folderele media';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Îmbină automat serialele răspândite în mai multe foldere';

  @override
  String get adminLibSeasonZeroName => 'Numele afișat pentru sezonul zero';

  @override
  String get adminLibLufsScan =>
      'Activează scanarea LUFS pentru normalizarea audio';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Preferă eticheta non-standard pentru artiști';

  @override
  String get adminLibAutoAddToCollection =>
      'Adaugă automat filmele în colecții';

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
  String get adminParentalControl => 'Control parental';

  @override
  String get adminMaxParentalRating => 'Clasificarea parentală maximă permisă';

  @override
  String get adminMaxParentalRatingHint =>
      'Conținutul cu o clasificare mai mare va fi ascuns pentru acest utilizator.';

  @override
  String get adminParentalRatingNone => 'Niciuna';

  @override
  String get adminBlockUnratedItems =>
      'Blochează elementele fără clasificare sau cu clasificare nerecunoscută';

  @override
  String get adminUnratedBook => 'Cărți';

  @override
  String get adminUnratedChannelContent => 'Canale';

  @override
  String get adminUnratedLiveTvChannel => 'TV în direct';

  @override
  String get adminUnratedMovie => 'Filme';

  @override
  String get adminUnratedMusic => 'Muzică';

  @override
  String get adminUnratedTrailer => 'Trailere';

  @override
  String get adminUnratedSeries => 'Seriale';

  @override
  String get adminAccessSchedules => 'Programe de acces';

  @override
  String get adminAccessSchedulesHint =>
      'Permite accesul doar în intervalele programate mai jos. Dacă nu este setat niciun program, accesul este permis toată ziua.';

  @override
  String get adminAddSchedule => 'Adaugă program';

  @override
  String get adminScheduleDay => 'Ziua';

  @override
  String get adminScheduleStart => 'Început';

  @override
  String get adminScheduleEnd => 'Sfârșit';

  @override
  String get adminDayEveryday => 'În fiecare zi';

  @override
  String get adminDayWeekday => 'Zi lucrătoare';

  @override
  String get adminDayWeekend => 'Weekend';

  @override
  String get adminDaySunday => 'Duminică';

  @override
  String get adminDayMonday => 'Luni';

  @override
  String get adminDayTuesday => 'Marți';

  @override
  String get adminDayWednesday => 'Miercuri';

  @override
  String get adminDayThursday => 'Joi';

  @override
  String get adminDayFriday => 'Vineri';

  @override
  String get adminDaySaturday => 'Sâmbătă';

  @override
  String get adminAllowedTags => 'Etichete permise';

  @override
  String get adminAllowedTagsHint =>
      'Se afișează doar conținutul cu aceste etichete. Lăsați gol pentru a permite tot conținutul.';

  @override
  String get adminBlockedTags => 'Etichete blocate';

  @override
  String get adminBlockedTagsHint =>
      'Conținutul cu aceste etichete este ascuns pentru acest utilizator.';

  @override
  String get adminAddTag => 'Adaugă etichetă';

  @override
  String get adminEnabledDevices => 'Dispozitive activate';

  @override
  String get adminEnabledChannels => 'Canale activate';

  @override
  String get adminAuthProvider => 'Furnizor de autentificare';

  @override
  String get adminPasswordResetProvider => 'Furnizor pentru resetarea parolei';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Numărul maxim de încercări eșuate de conectare înainte de blocare';

  @override
  String get adminLoginAttemptsHint =>
      'Setați 0 pentru valoarea implicită sau -1 pentru a dezactiva blocarea.';

  @override
  String get adminSyncPlayAccess => 'Acces SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Permite crearea grupurilor și alăturarea la ele';

  @override
  String get adminSyncPlayJoin => 'Permite alăturarea la grupuri';

  @override
  String get adminSyncPlayNone => 'Fără acces';

  @override
  String get adminContentDeletionFolders =>
      'Permite ștergerea conținutului din';

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
  String get adminBackupOptionsTitle => 'Creează o copie de rezervă';

  @override
  String get adminBackupInclude =>
      'Alegeți ce să includeți în copia de rezervă.';

  @override
  String get adminBackupDatabase => 'Baza de date';

  @override
  String get adminBackupDatabaseAlways => 'Inclusă întotdeauna';

  @override
  String get adminBackupMetadata => 'Metadate';

  @override
  String get adminBackupSubtitles => 'Subtitrări';

  @override
  String get adminBackupTrickplay => 'Imagini Trickplay';

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
  String get adminEditTuner => 'Editează tunerul';

  @override
  String get adminTunerTypeM3u => 'Tuner M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Fișier sau URL';

  @override
  String get adminTunerIpAddress => 'Adresa IP a tunerului';

  @override
  String get adminTunerFriendlyName => 'Nume prietenos';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limita de conexiuni simultane';

  @override
  String get adminTunerCountHelp =>
      'Numărul maxim de fluxuri pe care tunerul le permite simultan. Setați 0 pentru nelimitat.';

  @override
  String get adminTunerFallbackBitrate =>
      'Bitrate maxim de rezervă pentru streaming';

  @override
  String get adminTunerImportFavoritesOnly => 'Importă doar canalele favorite';

  @override
  String get adminTunerAllowHwTranscoding => 'Permite transcodarea hardware';

  @override
  String get adminTunerAllowFmp4 => 'Permite containerul de transcodare fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Permite partajarea fluxurilor';

  @override
  String get adminTunerEnableStreamLooping =>
      'Activează redarea în buclă a fluxului';

  @override
  String get adminTunerIgnoreDts => 'Ignoră DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Citește sursa la rata de cadre nativă';

  @override
  String get adminEditProvider => 'Editează furnizorul';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Fișier sau URL';

  @override
  String get adminXmltvMoviePrefix => 'Prefix pentru filme';

  @override
  String get adminXmltvMovieCategories => 'Categorii de filme';

  @override
  String get adminXmltvCategoriesHelp =>
      'Separați mai multe categorii cu o bară verticală.';

  @override
  String get adminXmltvKidsCategories => 'Categorii pentru copii';

  @override
  String get adminXmltvNewsCategories => 'Categorii de știri';

  @override
  String get adminXmltvSportsCategories => 'Categorii sportive';

  @override
  String get adminSdUsername => 'Nume de utilizator';

  @override
  String get adminSdPassword => 'Parolă';

  @override
  String get adminSdCountry => 'Țară';

  @override
  String get adminSdCountrySelect => 'Selectați o țară';

  @override
  String get adminSdPostalCode => 'Cod poștal';

  @override
  String get adminSdGetListings => 'Obține programele';

  @override
  String get adminSdListings => 'Programe';

  @override
  String get adminEnableAllTuners => 'Activează toate tunerele';

  @override
  String get adminTunerType => 'Tip tuner';

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
  String get adminTunerResetNotSupported =>
      'Acest tip de tuner nu acceptă resetarea.';

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
  String get adminMovieRecordingPath => 'Calea pentru înregistrarea filmelor';

  @override
  String get adminGuideDays => 'Zile de date pentru ghid';

  @override
  String get adminGuideDaysAuto => 'Automat';

  @override
  String adminGuideDaysValue(int days) {
    return '$days zile';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Calea aplicației de post-procesare';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Argumente pentru post-procesare';

  @override
  String get adminSaveRecordingNfo =>
      'Salvează metadatele NFO ale înregistrării';

  @override
  String get adminSaveRecordingImages => 'Salvează imaginile înregistrării';

  @override
  String get adminLiveTvSectionTiming => 'Sincronizare';

  @override
  String get adminLiveTvSectionPaths => 'Căi pentru înregistrări';

  @override
  String get adminLiveTvSectionPostProcessing => 'Post-procesare';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Date pentru ghid: $value';
  }

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
  String get adminRefreshGuideData => 'Reîmprospătează datele ghidului';

  @override
  String get adminGuideRefreshStarted =>
      'Reîmprospătarea datelor ghidului a început';

  @override
  String get adminGuideRefreshUnavailable =>
      'Sarcina de reîmprospătare a ghidului nu este disponibilă pe acest server.';

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
    return 'Marjă la final: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Detectarea tunerelor';

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
  String get adminApply => 'Aplică';

  @override
  String get adminNotSet => 'Nu setat';

  @override
  String get adminReset => 'Resetează';

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
  String get adminMetadataIdentify => 'Identifică';

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
  String get adminReposRemove => 'Elimină';

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
  String get adminBrandingSplashUpload => 'Încarcă o imagine';

  @override
  String get adminBrandingSplashUploaded =>
      'Ecranul de pornire a fost actualizat';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Încărcarea ecranului de pornire a eșuat';

  @override
  String get adminBrandingSplashDeleted => 'Ecranul de pornire a fost eliminat';

  @override
  String get adminBrandingNoSplash => 'Niciun ecran de pornire personalizat';

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
  String get adminPlaybackQsvDevice => 'Dispozitiv QSV';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Activează decodorul NVDEC îmbunătățit';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Preferă decodorul hardware nativ al sistemului';

  @override
  String get adminPlaybackColorDepth =>
      'Adâncimea de culoare la decodarea hardware';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Decodare HEVC pe 10 biți';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Decodare VP9 pe 10 biți';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Decodare HEVC RExt pe 8/10 biți';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Decodare HEVC RExt pe 12 biți';

  @override
  String get adminPlaybackHwEncodingSection => 'Codare hardware';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Permite codarea HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Permite codarea AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Activează codorul Intel H.264 cu consum redus';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Activează codorul Intel HEVC cu consum redus';

  @override
  String get adminPlaybackToneMapping => 'Tone mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Activează tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Activează tone mapping VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Activează tone mapping VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algoritm de tone mapping';

  @override
  String get adminPlaybackTonemappingMode => 'Mod de tone mapping';

  @override
  String get adminPlaybackTonemappingRange => 'Interval de tone mapping';

  @override
  String get adminPlaybackTonemappingDesat => 'Desaturare la tone mapping';

  @override
  String get adminPlaybackTonemappingPeak => 'Vârf de tone mapping';

  @override
  String get adminPlaybackTonemappingParam => 'Parametru de tone mapping';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Luminozitate tone mapping VPP';

  @override
  String get adminPlaybackVppTonemappingContrast => 'Contrast tone mapping VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Presetări și calitate';

  @override
  String get adminPlaybackEncoderPreset => 'Presetare codor';

  @override
  String get adminPlaybackH264Crf => 'CRF pentru codarea H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF pentru codarea H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Metodă de deinterlațare';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Dublează rata de cadre la deinterlațare';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Activează codarea audio VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Amplificare la downmix audio';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritm de downmix stereo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Dimensiunea maximă a cozii de multiplexare';

  @override
  String get adminPlaybackAutoOption => 'Auto';

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
  String get adminTrickplayPriorityNormal => 'Normală';

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
  String get adminTaskStop => 'Oprește';

  @override
  String get adminRunningTasks => 'Sarcini în execuție';

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
      other: '$count de ore',
      few: '$count ore',
      one: '1 oră',
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
    return '${days}z';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
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
  String get adminNetworkingPublicHttpPort => 'Port HTTP public';

  @override
  String get adminNetworkingRequireHttps => 'Solicită HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirecționează toate cererile la distanță către HTTPS. Nu are efect dacă serverul nu are un certificat valid.';

  @override
  String get adminNetworkingCertPassword => 'Parola certificatului';

  @override
  String get adminNetworkingIpSettings => 'Setări IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Activează IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Activează IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Activează maparea automată a porturilor';

  @override
  String get adminNetworkingLocalSubnets => 'Rețele LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Listă de adrese IP sau subrețele CIDR, separate prin virgulă sau pe linii separate, considerate ca făcând parte din rețeaua locală.';

  @override
  String get adminNetworkingPublishedUris => 'URI-uri publicate ale serverului';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Asociați o subrețea sau o adresă unui URL publicat, de ex. all=https://example.com';

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
  String get adminPlaybackThrottleDelay => 'Întârziere de limitare (secunde)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Permite extragerea subtitrărilor în timp real';

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
  String get adminGeneralEnableSlowResponse =>
      'Activează avertismentele privind răspunsurile lente';

  @override
  String get adminGeneralQuickConnect => 'Activează Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadate';

  @override
  String get adminGeneralSectionPaths => 'Căi';

  @override
  String get adminGeneralSectionPerformance => 'Performanță';

  @override
  String get adminGeneralCachePath => 'Calea cache';

  @override
  String get adminGeneralMetadataPath => 'Calea metadatelor';

  @override
  String get adminGeneralServerName => 'Numele serverului';

  @override
  String get adminGeneralDisplayLanguage => 'Limba de afișare preferată';

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
      other: '# de participanți',
      few: '# participanți',
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# de rânduri descoperite',
      few: '# rânduri descoperite',
      one: '# rând descoperit',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'Sunteți offline';

  @override
  String get offlineBannerSubtitle => 'Se afișează descărcările dvs.';

  @override
  String get offlineBannerAction => 'Descărcări';

  @override
  String get serverUnreachableBannerTitle => 'Serverul nu poate fi contactat';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Se redă din descărcări până când revine';

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
  String get pinClear => 'Golește';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Cererea Quick Connect a fost autorizată.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Codul Quick Connect este invalid sau a expirat.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect nu este acceptat pe acest server.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Autorizarea codului Quick Connect a eșuat.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect este dezactivat pe acest server.';

  @override
  String get quickConnectForbidden =>
      'Contul dvs. nu poate autoriza această cerere Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Codul Quick Connect nu a fost găsit. Încercați un cod nou.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect a eșuat: $message';
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
  String get stillWatchingStop => 'Oprește';

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
  String get contextMenuHideFromContinueWatching =>
      'Ascunde din „Continuați vizionarea”';

  @override
  String get contextMenuHideFromNextUp => 'Ascunde din „Urmează”';

  @override
  String get contextMenuAddToCollection => 'Adaugă în colecție';

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
  String get settingsConnectionSection => 'CONEXIUNE';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Permite certificatele autosemnate';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Aveți încredere în serverele care folosesc certificate TLS autosemnate sau emise de o autoritate privată. Activați doar pentru serverele pe care le controlați. Această opțiune dezactivează validarea certificatelor pentru toate conexiunile.';

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
  String get settingsDetailsScreen => 'Ecranul de detalii';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Stil, estomparea fundalului și comportamentul filelor';

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
      'Afișează butonul Seerr în bara de navigare';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Afișează mereu etichetele text în bara de navigare de sus';

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
      other: '# de notificări de licență',
      few: '# notificări de licență',
      one: '# notificare de licență',
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
  String get settingsMediaSegmentCountdown =>
      'Numărătoare inversă pentru segmentele media';

  @override
  String get settingsProgressBar => 'Bară de progres';

  @override
  String get settingsTimer => 'Cronometru';

  @override
  String get settingsNone => 'Fără';

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
  String get settingsLiveTvDirect => 'TV în direct (direct)';

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
  String recentlyReleasedLibraryName(String libraryName) {
    return '$libraryName lansate recent';
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
  String get enableTunnelingTitle => 'Activează tunelarea';

  @override
  String get enableTunnelingSubtitle =>
      'Opțiune avansată. Direcționează sunetul și imaginea printr-o cale hardware cuplată. Este dezactivată implicit deoarece provoacă întreruperi audio/video pe unele dispozitive.';

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
  String get showMediaDetailsOnLibraryPage => 'Afișează detaliile media';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Afișează detaliile elementului selectat în partea de sus a paginilor de bibliotecă.';

  @override
  String get hideBackdropsInLibraries =>
      'Ascundeți fundalurile în timpul navigării?';

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
  String get themeStore => 'Magazin de teme';

  @override
  String get themeStoreSubtitle =>
      'Descoperiți și salvați teme create de comunitate';

  @override
  String get themeStoreDescription =>
      'Salvați o temă pentru a o folosi ca pe celelalte teme salvate.';

  @override
  String get themeStoreEmpty => 'Momentan nu este disponibilă nicio temă.';

  @override
  String get themeStoreLoadFailed =>
      'Magazinul de teme nu a putut fi încărcat. Verificați conexiunea și încercați din nou.';

  @override
  String get themeStoreSave => 'Salvează';

  @override
  String get themeStoreSaveAndApply => 'Salvează și aplică';

  @override
  String get themeStoreSaved => 'Salvată';

  @override
  String get themeStoreInvalidMessage =>
      'Această temă nu a putut fi încărcată.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '„$themeName” a fost salvată.';
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
  String get themeEditor => 'Editor de teme';

  @override
  String get themeEditorSubtitle =>
      'Deschideți editorul de teme Moonfin în browser';

  @override
  String get homeScreen => 'Ecran principal';

  @override
  String get bottomBar => 'Bară inferioară';

  @override
  String get homeRowsStyleClassic => 'Clasic';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Rânduri pe ecranul principal';

  @override
  String get homeRowDisplay => 'Afișarea rândurilor de pe ecranul principal';

  @override
  String get homeRowSections => 'Secțiunile rândurilor de pe ecranul principal';

  @override
  String get homeRowToggles =>
      'Comutatoare pentru rândurile de pe ecranul principal';

  @override
  String get homeRowTogglesSubtitle =>
      'Activați sau dezactivați categoriile de rânduri bazate pe biblioteci';

  @override
  String get homeRowTogglesDescription =>
      'Activați comutatoarele de mai jos pentru a afișa rândurile în secțiunile ecranului principal.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Modul Clasic păstrează tipul de imagine și suprapunerea cu informații pentru fiecare rând. Modul Modern folosește rânduri de la portret la fundal.';

  @override
  String get displayFavoritesRows => 'Afișează rândurile cu favorite';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Afișează filmele și serialele favorite, precum și celelalte rânduri cu favorite, în secțiunile ecranului principal.';

  @override
  String get favoritesRowSorting => 'Sortarea rândurilor cu favorite';

  @override
  String get favoritesRowSortingDescription =>
      'Sortați rândurile cu favorite după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get displayCollectionsRows => 'Afișează rândurile cu colecții';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Afișează rândurile cu colecții în secțiunile ecranului principal.';

  @override
  String get collectionsRowSorting => 'Sortarea rândurilor cu colecții';

  @override
  String get collectionsRowSortingDescription =>
      'Sortați rândurile cu colecții după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get displayGenresRows => 'Afișează rândurile cu genuri';

  @override
  String get displayGenresRowsSubtitle =>
      'Afișează rândurile cu genuri în secțiunile ecranului principal.';

  @override
  String get genresRowSorting => 'Sortarea rândurilor cu genuri';

  @override
  String get genresRowSortingDescription =>
      'Sortați rândurile cu genuri după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get genresRowItems => 'Elementele rândurilor cu genuri';

  @override
  String get genresRowItemsDescription =>
      'Afișați filme, seriale sau ambele în rândurile cu genuri.';

  @override
  String get displayPlaylistsRows => 'Afișează rândurile cu liste de redare';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Afișează rândurile cu liste de redare în secțiunile ecranului principal.';

  @override
  String get playlistsRowSorting => 'Sortarea rândurilor cu liste de redare';

  @override
  String get playlistsRowSortingDescription =>
      'Sortați rândurile cu liste de redare după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get displayAudioRows => 'Afișează rândurile audio';

  @override
  String get displayAudioRowsSubtitle =>
      'Afișează rândurile audio în secțiunile ecranului principal.';

  @override
  String get audioRowsSorting => 'Sortarea rândurilor audio';

  @override
  String get audioRowsSortingDescription =>
      'Sortați rândurile audio după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get audioPlaylists => 'Liste de redare audio';

  @override
  String get appearance => 'Aspect';

  @override
  String get layout => 'Aranjament';

  @override
  String get theme => 'Temă';

  @override
  String get keyboard => 'Tastatură';

  @override
  String get navButtons => 'Butoane';

  @override
  String get rendering => 'Randare';

  @override
  String get mpvConfiguration => 'Configurare MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Aplicație player extern';

  @override
  String get externalPlayerAppDescription =>
      'Setați un player extern pentru a activa opțiunea de redare la apăsare lungă';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Afișează selectorul de aplicații la începerea redării.';

  @override
  String get loadingInstalledPlayers => 'Se încarcă playerele instalate...';

  @override
  String get connection => 'Conexiune';

  @override
  String get audioTranscodeTarget => 'Format țintă pentru transcodarea audio';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Acceptat pe acest dispozitiv';

  @override
  String get notSupportedOnThisDevice => 'Neacceptat pe acest dispozitiv';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Trimite DTS:X (DTS UHD) ca bitstream către decodorul extern.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD cu Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Comportamentul playerului media';

  @override
  String get playbackEnhancements => 'Îmbunătățiri ale redării';

  @override
  String get alwaysOn => 'Întotdeauna activ.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Înlocuiește „Sari peste generic” cu afișarea „Urmează”';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Afișează suprapunerea „Urmează” în locul butonului „Sari peste generic”.';

  @override
  String get playerRouting => 'Direcționarea playerului';

  @override
  String get preferSoftwareDecoders => 'Preferă decodoarele software';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Folosește FFmpeg (audio) și libgav1 (AV1) înaintea decodoarelor hardware. Dezactivați dacă passthrough-ul audio HDMI nu funcționează.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Deschide redarea video în aplicația externă selectată, pe Android TV.';

  @override
  String get automaticQueuing => 'Adăugare automată în coadă';

  @override
  String get preferSdhSubtitles => 'Preferă subtitrările SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritizează pistele de subtitrare SDH/CC la selectarea automată.';

  @override
  String get webDiagnostics => 'Diagnosticare web';

  @override
  String get webDiagnosticsTitle => 'Diagnosticare web Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Folosiți această pagină pentru a diagnostica problemele de conectivitate ale browserului (CORS, conținut mixt și setări de descoperire).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'A fost detectată o eroare de conținut mixt';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'A fost detectată o eroare CORS/preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin a detectat o pagină HTTPS care încearcă să apeleze un URL de server HTTP. Browserele blochează această cerere înainte să ajungă la server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin a detectat o eroare de cerere la nivel de browser, cauzată de obicei de lipsa antetelor CORS sau preflight de pe serverul media.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL țintă: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detaliu: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Contextul curent de execuție';

  @override
  String get webDiagnosticsOrigin => 'Origine';

  @override
  String get webDiagnosticsScheme => 'Schemă';

  @override
  String get webDiagnosticsPluginMode => 'Mod plugin';

  @override
  String get webDiagnosticsWebRtcScan => 'Scanare WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL de server forțat';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL de server implicit';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL proxy pentru descoperire';

  @override
  String get notConfigured => 'neconfigurat';

  @override
  String get webDiagnosticsMixedContent => 'Conținut mixt';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Această pagină este încărcată prin HTTPS, dar unul sau mai multe URL-uri configurate folosesc HTTP. Browserele blochează apelurile către API-uri HTTP din pagini HTTPS.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Soluție: serviți serverul media sau punctul final proxy prin HTTPS ori încărcați Moonfin prin HTTP doar în rețele locale de încredere.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Nu a fost detectată nicio configurație evidentă de conținut mixt în setările curente de execuție.';

  @override
  String get webDiagnosticsCorsChecklist => 'Listă de verificare CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Permiteți originea browserului în Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Includeți Authorization, X-Emby-Authorization și X-Emby-Token în Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Expuneți Content-Range și Accept-Ranges pentru streaming și derulare.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Returnați 204 la cererile preflight OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Exemplu de fragment de antet (stil nginx)';

  @override
  String get note => 'Notă';

  @override
  String get webDiagnosticsNonWebNote =>
      'Această rută de diagnosticare este destinată versiunilor web. Dacă o vedeți pe altă platformă, este posibil ca aceste verificări să nu se aplice.';

  @override
  String get backToServerSelect => 'Înapoi la selectarea serverului';

  @override
  String get signOutAllUsers => 'Deconectează toți utilizatorii';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Permisiunea pentru microfon este refuzată definitiv. Activați-o din setările sistemului.';

  @override
  String get voiceSearchPermissionRequired =>
      'Căutarea vocală necesită permisiunea pentru microfon.';

  @override
  String get voiceSearchNoMatch => 'Nu am înțeles. Încercați din nou.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nu a fost detectată nicio voce.';

  @override
  String get voiceSearchMicrophoneError => 'Eroare de microfon.';

  @override
  String get voiceSearchNeedsInternet =>
      'Căutarea vocală necesită conexiune la internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Serviciul vocal este ocupat. Încercați din nou.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Permisiunea pentru microfon este refuzată definitiv.';

  @override
  String get microphonePermissionDenied =>
      'Permisiunea pentru microfon este refuzată.';

  @override
  String get speechRecognitionUnavailable =>
      'Recunoașterea vocală nu este disponibilă pe acest dispozitiv.';

  @override
  String get openIosRoutePicker => 'Deschide selectorul de rute iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Selectorul de rute AirPlay nu este disponibil pe acest dispozitiv.';

  @override
  String get videos => 'Videoclipuri';

  @override
  String get programs => 'Programe';

  @override
  String get songs => 'Melodii';

  @override
  String get photoAlbums => 'Albume foto';

  @override
  String get photos => 'Fotografii';

  @override
  String get people => 'Persoane';

  @override
  String get recentlyReleasedEpisodes => 'Episoade lansate recent';

  @override
  String get watchAgain => 'Vizionează din nou';

  @override
  String get guestAppearances => 'Apariții ca invitat';

  @override
  String get appearancesSeerr => 'Apariții (Seerr)';

  @override
  String get crewContributionsSeerr =>
      'Contribuții în echipa de producție (Seerr)';

  @override
  String get watchWithGroup => 'Vizionează cu grupul';

  @override
  String get errors => 'Erori';

  @override
  String get warnings => 'Avertismente';

  @override
  String get disk => 'Disc';

  @override
  String get openInBrowser => 'Deschide în browser';

  @override
  String get embeddedBrowserNotAvailable =>
      'Browserul încorporat nu este disponibil pe această platformă.';

  @override
  String get adminRestartServerConfirmation =>
      'Sigur doriți să reporniți serverul?';

  @override
  String get adminShutdownServerConfirmation =>
      'Sigur doriți să opriți serverul? Va trebui să îl reporniți manual.';

  @override
  String get internal => 'Intern';

  @override
  String get idle => 'Inactiv';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Niciun utilizator găsit';

  @override
  String get adminNoUsersMatchSearch =>
      'Niciun utilizator nu corespunde căutării';

  @override
  String get adminNoDevicesFound => 'Niciun dispozitiv găsit';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Niciun dispozitiv nu corespunde filtrelor curente';

  @override
  String get passwordSet => 'Parolă setată';

  @override
  String get noPasswordConfigured => 'Nicio parolă configurată';

  @override
  String get remoteAccess => 'Acces la distanță';

  @override
  String get localOnly => 'Doar local';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Încărcarea analizelor media a eșuat';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Analize combinate din toate bibliotecile media.';

  @override
  String get analyticsTopArtists => 'Artiști de top';

  @override
  String get analyticsTopAuthors => 'Autori de top';

  @override
  String get analyticsTopContributors => 'Contribuitori de top';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de Biblioteci',
      few: '$count Biblioteci',
      one: '1 Bibliotecă',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Nu sunt încă disponibile totaluri de conținut media indexat pentru această selecție.';

  @override
  String get analyticsLibraryDetails => 'Detalii despre bibliotecă';

  @override
  String get analyticsLibraryBreakdown => 'Defalcare pe biblioteci';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Nu este disponibilă nicio bibliotecă.';

  @override
  String get adminServerAdministrationTitle => 'Administrarea serverului';

  @override
  String get adminServerPathData => 'Date';

  @override
  String get adminServerPathImageCache => 'Cache de imagini';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Jurnale';

  @override
  String get adminServerPathMetadata => 'Metadate';

  @override
  String get adminServerPathTranscode => 'Transcodare';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Acest server nu a returnat nicio cale.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% utilizat';
  }

  @override
  String get userActivity => 'Activitatea utilizatorilor';

  @override
  String get systemEvents => 'Evenimente de sistem';

  @override
  String get needsAttention => 'Necesită atenție';

  @override
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Redare';

  @override
  String get adminDrawerSectionDevices => 'Dispozitive';

  @override
  String get adminDrawerSectionAdvanced => 'Avansat';

  @override
  String get adminDrawerSectionPlugins => 'Pluginuri';

  @override
  String get adminDrawerSectionLiveTv => 'TV în direct';

  @override
  String get homeVideos => 'Videoclipuri personale';

  @override
  String get mixedContent => 'Conținut mixt';

  @override
  String get homeVideosAndPhotos => 'Videoclipuri și fotografii personale';

  @override
  String get mixedMoviesAndShows => 'Filme și seriale mixte';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nicio înregistrare găsită';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Nu au fost găsite pagini imagine în arhiva .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Randarea încorporată a eșuat ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Randarea EPUB a eșuat ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Lipsește fișierul local pentru cititor: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status la deschiderea datelor cărții din $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nu este disponibil niciun punct final pentru citirea cărții';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Format de arhivă de benzi desenate neacceptat: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Pluginul de extragere CBR nu este disponibil pe această platformă.';

  @override
  String get failedToExtractCbrArchive => 'Extragerea arhivei .cbr a eșuat.';

  @override
  String get cb7ExtractionUnavailable =>
      'Extragerea CB7 nu este disponibilă pe această platformă.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Pluginul de extragere CB7 nu este disponibil pe această platformă.';

  @override
  String get closeGenrePanel => 'Închide panoul cu genuri';

  @override
  String get loadingShuffle => 'Se încarcă redarea aleatorie...';

  @override
  String get libraryShuffleLabel => 'REDARE ALEATORIE DIN BIBLIOTECĂ';

  @override
  String get randomShuffleLabel => 'REDARE ALEATORIE';

  @override
  String get genresShuffleLabel => 'REDARE ALEATORIE PE GENURI';

  @override
  String get autoHdrSwitching => 'Comutare automată HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Activează automat HDR la redarea videoclipurilor HDR și restabilește modul de afișare la ieșire.';

  @override
  String get whenFullscreen => 'Pe ecran complet';

  @override
  String get changeArtwork => 'Schimbă imaginea';

  @override
  String get missing => 'Lipsă';

  @override
  String get transcodingLimits => 'Limite de transcodare';

  @override
  String get clearAllArtworkButton => 'Ștergeți toate imaginile?';

  @override
  String get clearAllArtworkWarning =>
      'Sigur doriți să ștergeți toate imaginile descărcate?';

  @override
  String get confirmClear => 'Confirmați ștergerea';

  @override
  String confirmClearMessage(String itemType) {
    return 'Sigur doriți să ștergeți imaginea de tip $itemType?';
  }

  @override
  String get uploadButton => 'Încărcați?';

  @override
  String get resolutionLabel => 'Rezoluție: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Afișează doar imaginile în limba interfeței';

  @override
  String get confirmClearAll => 'Confirmați ștergerea tuturor';

  @override
  String get imageUploadSuccess => 'Imaginea a fost încărcată cu succes!';

  @override
  String imageUploadFailed(String error) {
    return 'Încărcarea imaginii a eșuat: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Setarea imaginii a eșuat: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Ștergerea imaginii a eșuat: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Ștergerea tuturor imaginilor a eșuat: $error';
  }

  @override
  String get yes => 'Da';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Fundaluri';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniatură';

  @override
  String get artCategory => 'Grafică';

  @override
  String get discArtCategory => 'Grafică de disc';

  @override
  String get screenshotCategory => 'Captură de ecran';

  @override
  String get boxCoverCategory => 'Copertă cutie';

  @override
  String get boxRearCoverCategory => 'Coperta din spate a cutiei';

  @override
  String get menuArtCategory => 'Grafică de meniu';

  @override
  String get confirmItemPoster => 'poster';

  @override
  String get confirmItemBackdrop => 'fundal';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniatură';

  @override
  String get confirmItemArt => 'grafică';

  @override
  String get confirmItemDiscArt => 'grafică de disc';

  @override
  String get confirmItemScreenshot => 'captură de ecran';

  @override
  String get confirmItemBoxCover => 'copertă cutie';

  @override
  String get confirmItemBoxRearCover => 'coperta din spate a cutiei';

  @override
  String get confirmItemMenuArt => 'grafică de meniu';

  @override
  String get resolutionAll => 'Toate';

  @override
  String get resolutionHigh => 'Înaltă (1080p+)';

  @override
  String get resolutionMedium => 'Medie (720p)';

  @override
  String get resolutionLow => 'Scăzută (<720p)';

  @override
  String get sources => 'Surse';

  @override
  String get audiobookChapters => 'Capitole';

  @override
  String get audiobookBookmarks => 'Marcaje';

  @override
  String get audiobookNotes => 'Notițe';

  @override
  String get audiobookQueue => 'Coadă';

  @override
  String get audiobookTimeline => 'Cronologie';

  @override
  String get audiobookTimelineEmpty => 'Cronologia este goală';

  @override
  String get audiobookWholeBook => 'Toată cartea';

  @override
  String get audiobookFocusedTimeline => 'Cronologie focalizată';

  @override
  String get audiobookExportBookmarks => 'Exportă marcajele';

  @override
  String get audiobookExportNotes => 'Exportă notițele';

  @override
  String get audiobookExportAll => 'Exportă tot';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exportat în $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Exportul a eșuat: $error';
  }

  @override
  String get audiobookLyrics => 'Versuri';

  @override
  String get audiobookAddBookmark => 'Adaugă un marcaj';

  @override
  String get audiobookAddNote => 'Adaugă o notiță';

  @override
  String get audiobookEditNote => 'Editează notița';

  @override
  String get audiobookNoteHint => 'Scrieți o notiță pentru acest moment';

  @override
  String get audiobookSleepTimer => 'Cronometru de adormire';

  @override
  String get audiobookSleepOff => 'Oprit';

  @override
  String get audiobookSleepEndOfChapter => 'Sfârșitul capitolului';

  @override
  String get audiobookSleepCustom => 'Personalizat';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining rămase';
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
  String get audiobookPlaybackSpeed => 'Viteza de redare';

  @override
  String get audiobookRemainingTime => 'Rămas';

  @override
  String get audiobookElapsedTime => 'Scurs';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Înapoi ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Înainte ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Capitolul anterior';

  @override
  String get audiobookNextChapter => 'Capitolul următor';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Capitolul $current din $total';
  }

  @override
  String get audiobookNoChapters => 'Niciun capitol';

  @override
  String get audiobookNoBookmarks => 'Niciun marcaj încă';

  @override
  String get audiobookNoNotes => 'Nicio notiță încă';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Marcaj adăugat la $position';
  }

  @override
  String get audiobookSpeedReset => 'Resetează la 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Salvează';

  @override
  String get audiobookCancel => 'Anulează';

  @override
  String get audiobookDelete => 'Șterge';

  @override
  String get subtitlePreferences => 'Preferințe pentru subtitrări';

  @override
  String get subtitlePreferencesDescription =>
      'Modificați modurile de subtitrare, limbile implicite, aspectul și opțiunile de randare.';

  @override
  String get subtitleRendering => 'Randarea subtitrărilor';

  @override
  String get displayOptions => 'Opțiuni de afișare';

  @override
  String get releaseDateAscending => 'Data lansării (crescător)';

  @override
  String get releaseDateDescending => 'Data lansării (descrescător)';

  @override
  String get groupContributions => 'Gruparea contribuțiilor';

  @override
  String get groupMultipleRoles => 'Grupează rolurile multiple';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Avertisment privind accesul de scriere în bibliotecă';

  @override
  String get libraryWriteAccessHowToFix => 'Cum puteți rezolva:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Acordați permisiuni de scriere utilizatorului serviciului Jellyfin (de ex. jellyfin sau PUID/PGID din Docker) pentru folderele bibliotecii media de pe server.\n\n2. Sau accesați panoul de control Jellyfin -> Biblioteci, editați această bibliotecă și dezactivați „Salvează imaginile în folderele media” pentru a stoca imaginile în baza de date internă a Jellyfin.';

  @override
  String get dismiss => 'Închide';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Biblioteca dvs. „$libraryName” este configurată să salveze imaginile direct în folderele media (opțiunea „Salvează imaginile în folderele media” este activată). Totuși, Jellyfin a testat accesul de scriere și nu are permisiunea de a scrie fișiere în acest director:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Se pare că Jellyfin nu a reușit să actualizeze imaginea. Biblioteca dvs. este configurată să salveze imaginile direct în folderele media (opțiunea „Salvează imaginile în folderele media” este activată). Această eroare apare de obicei atunci când procesul serverului Jellyfin nu are permisiunea de a scrie fișiere în directoarele media.';

  @override
  String get externalLists => 'Liste externe';

  @override
  String get replay => 'Redă din nou';

  @override
  String get fileInformation => 'Informații despre fișier';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Dimensiune: $size  •  Format: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Afișează toate pistele audio ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Afișează toate pistele de subtitrare ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Se verifică suportul pentru redare directă...';

  @override
  String get directPlayCapabilityLabel => 'Suport pentru redare directă: ';

  @override
  String get forced => 'Forțat';

  @override
  String get transcodeContainerNotSupported =>
      'Formatul containerului nu este acceptat de player.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Codecul video nu este acceptat.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Codecul audio nu este acceptat.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Formatul subtitrării nu este acceptat (necesită încorporare în imagine).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Profilul audio nu este acceptat.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Profilul video nu este acceptat.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Nivelul video nu este acceptat.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Rezoluția video nu este acceptată de acest dispozitiv.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Adâncimea de biți a imaginii nu este acceptată.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Rata de cadre nu este acceptată.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Bitrate-ul fișierului depășește limita de streaming a playerului.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Bitrate-ul video depășește limita de streaming.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Bitrate-ul audio depășește limita de streaming.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Numărul de canale audio nu este acceptat.';

  @override
  String get sortAlphabetical => 'Alfabetic';

  @override
  String get sortReleaseAscending => 'Ordinea lansării (crescător)';

  @override
  String get sortReleaseDescending => 'Ordinea lansării (descrescător)';

  @override
  String get sortCustomDragDrop => 'Personalizat (trageți și plasați)';

  @override
  String get playlistSortOptions => 'Opțiuni de sortare a listei de redare';

  @override
  String get resetSort => 'Resetează sortarea';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Revizionează S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Revizionează lista de redare';

  @override
  String get noSubtitlesFound => 'Nu au fost găsite subtitrări.';

  @override
  String get adminControls => 'Comenzi de administrare';

  @override
  String get impellerRendering => 'Motor de randare (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller este motorul GPU modern al Flutter, pentru animații mai fluide și mai puține sacadări. Pe unele TV box-uri și plăci grafice mai vechi poate provoca artefacte sau imagine neagră; dezactivați-l dacă observați astfel de probleme. Opțiunea Automat alege cea mai bună valoare implicită pentru dispozitivul dvs. Reporniți Moonfin pentru a aplica modificarea.';

  @override
  String get impellerAuto => 'Automat';

  @override
  String get impellerOn => 'Activat';

  @override
  String get impellerOff => 'Dezactivat';

  @override
  String get impellerRestartTitle => 'Repornire necesară';

  @override
  String get impellerRestartMessage =>
      'Moonfin trebuie repornit pentru a schimba motorul de randare. Închideți aplicația acum, apoi redeschideți-o pentru a aplica modificarea.';

  @override
  String get impellerCloseNow => 'Închide aplicația acum';

  @override
  String get adminRefreshLibrary => 'Reîmprospătează biblioteca';

  @override
  String get adminRefreshAllLibraries => 'Reîmprospătează toate bibliotecile';

  @override
  String get adminRepoSortDateOldest =>
      'Data adăugării (cele mai vechi primele)';

  @override
  String get adminRepoSortDateNewest => 'Data adăugării (cele mai noi primele)';

  @override
  String get adminRepoSortNameAsc => 'Alfabetic (de la A la Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabetic (de la Z la A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Se încarcă analizele serverului... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Ca sursa';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 filme';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 seriale TV';

  @override
  String get imdbMostPopularMovies => 'Cele mai populare filme IMDb';

  @override
  String get imdbMostPopularTvShows => 'Cele mai populare seriale TV IMDb';

  @override
  String get imdbLowestRatedMovies => 'Filme cu cel mai mic scor IMDb';

  @override
  String get imdbTopEnglishMovies =>
      'Cele mai bine cotate filme în engleză pe IMDb';
}
