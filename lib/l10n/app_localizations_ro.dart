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
  String get animeMarkerFiller => 'Filler';

  @override
  String get animeMarkerMixed => 'Mixt';

  @override
  String get animeMarkerAnimeCanon => 'Canon anime';

  @override
  String get animeMarkerMangaCanon => 'Canon manga';

  @override
  String get animeMarkerSubbed => 'Subtitrat';

  @override
  String get animeMarkerDubbed => 'Dublat';

  @override
  String get animeMarkerSubbedAndDubbed => 'Subtitrat/Dublat';

  @override
  String get animeMarkerPending => 'În așteptare';

  @override
  String get animeMarkerRecap => 'Rezumat';

  @override
  String get accountPreferences => 'PREFERINȚE CONT';

  @override
  String get interfaceLanguage => 'Limba interfeței';

  @override
  String get systemLanguageDefault => 'Implicit din sistem';

  @override
  String get signIn => 'Autentificare';

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
      'Introdu acest cod în panoul web al serverului tău:';

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
  String get addUser => 'Adaugă utilizator';

  @override
  String get selectServer => 'Selectează serverul';

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
  String get addServer => 'Adaugă server';

  @override
  String get embyConnect => 'Emby Connect';

  @override
  String get removeServer => 'Elimină serverul';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Elimini „$serverName” din serverele tale?';
  }

  @override
  String get cancel => 'Anulează';

  @override
  String get remove => 'Elimină';

  @override
  String get connectToServer => 'Conectează-te la server';

  @override
  String get serverAddress => 'Adresa serverului';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Conectează';

  @override
  String get secureStorageUnavailable => 'Stocare securizată indisponibilă';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nu a putut accesa breloul de chei al sistemului. Autentificarea poate continua, dar stocarea securizată a token-ului poate fi indisponibilă până la deblocarea breloului de chei.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema aplicației';

  @override
  String get detailScreenStyle => 'Stilul ecranului de detalii';

  @override
  String get detailScreenStyleSubtitle =>
      'Clasic este aspectul original Moonfin, centrat. Modern este un aspect cinematic adaptabil. Spotlight este un aspect cu accent pe imaginea principală și carduri de conținut pop-up. Nouveau este un aspect pe tot ecranul, cu secțiunile așezate una sub alta pe pagină. Minimalist înseamnă ilustrații, un singur buton de redare și episoadele.';

  @override
  String get detailScreenStyleMoonfin => 'Clasic';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get detailScreenStyleSpotlight => 'Spotlight';

  @override
  String get spotlightMoreActions => 'Mai multe acțiuni';

  @override
  String get spotlightCastCrewStudios => 'Distribuție, echipă și studiouri';

  @override
  String get spotlightChaptersExtras => 'Capitole și bonusuri';

  @override
  String get spotlightFileDetails => 'File Details';

  @override
  String get spotlightSimilarRecommendations => 'Similare și recomandări';

  @override
  String get spotlightSeasonsEpisodes => 'Sezoane și episoade';

  @override
  String get spotlightMoreEpisodes => 'Mai multe episoade';

  @override
  String get spotlightFilmography => 'Filmografie';

  @override
  String get spotlightCollectionsCard => 'Colecții';

  @override
  String get spotlightPlaylistOrder => 'Ordinea listei de redare';

  @override
  String get spotlightMoviesAndShows => 'Filme și seriale';

  @override
  String get spotlightSimilarSeerr => 'Similare (Seerr)';

  @override
  String get spotlightRecommendationsSeerr => 'Recomandări (Seerr)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de persoane',
      few: '$count persoane',
      one: '1 persoană',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de curiozități',
      few: '$count curiozități',
      one: '1 curiozitate',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de etichete',
      few: '$count etichete',
      one: '1 etichetă',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de studiouri',
      few: '$count studiouri',
      one: '1 studio',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
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
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de bonusuri',
      few: '$count bonusuri',
      one: '1 bonus',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de sezoane',
      few: '$count sezoane',
      one: '1 sezon',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
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
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de filme',
      few: '$count filme',
      one: '1 film',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de seriale',
      few: '$count seriale',
      one: '1 serial',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
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
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de elemente',
      few: '$count elemente',
      one: '1 element',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de albume',
      few: '$count albume',
      one: '1 album',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de colecții',
      few: '$count colecții',
      one: '1 colecție',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de titluri',
      few: '$count titluri',
      one: '1 titlu',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Nouveau';

  @override
  String get detailScreenStyleMinimalist => 'Minimalist';

  @override
  String get expandedTabs => 'File extinse';

  @override
  String get expandedTabsSubtitle =>
      'Afișează automat conținutul filelor în timp ce navighezi printre ele. Dezactivează pentru a deschide și închide fiecare filă manual.';

  @override
  String get showTechnicalDetails => 'Afișezi detaliile tehnice?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Afișează informații despre codec, rezoluție și flux în rezumatul din banner';

  @override
  String get recommendationSystem => 'Sistem de recomandări';

  @override
  String get recommendationSystemSubtitle =>
      'Folosește algoritmul local Moonfin Recommends pentru biblioteca ta, motorul Jellyfin Recommends de pe server sau metricile de similaritate TMDb online. Notă: recomandările online necesită integrarea Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemJellyfin => 'Recomandări Jellyfin';

  @override
  String get recommendationSystemTmdb => 'Similaritate TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Aplici limita de clasificare parentală?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limitează sugestiile Moonfin Recommends în funcție de clasificarea parentală a conținutului vizat';

  @override
  String get interfaceStyle => 'Stilul interfeței';

  @override
  String get interfaceStyleSubtitle =>
      'Automat se potrivește cu dispozitivul tău. Alege Apple sau Material pentru a impune un anumit aspect.';

  @override
  String get interfaceStyleAutomatic => 'Automat';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Aspectul interfeței';

  @override
  String get interfaceLayoutSubtitle =>
      'Suprascrie aspectul detectat când acest dispozitiv este recunoscut greșit. Repornește Moonfin pentru ca modificările să aibă efect.';

  @override
  String get interfaceLayoutAutomatic => 'Automat';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Desktop';

  @override
  String get interfaceLayoutPhone => 'Telefon';

  @override
  String get glassQuality => 'Calitatea efectului de sticlă';

  @override
  String get oledMode => 'Mod OLED';

  @override
  String get oledModeSubtitle =>
      'Accentuează tonurile de negru și îmbogățește ilustrațiile. Recomandat pentru ecrane OLED.';

  @override
  String get oledModeSubtle => 'Subtil';

  @override
  String get oledModeVivid => 'Intens';

  @override
  String get glassQualitySubtitle =>
      'Automat alege cel mai bun efect de sticlă pentru acest dispozitiv. Complet impune estomparea reală, iar Redus folosește un efect de sticlă ușor, care economisește resursele GPU.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Complet';

  @override
  String get glassQualityReduced => 'Redus';

  @override
  String get performanceMode => 'Performanță';

  @override
  String get performanceModeSubtitle =>
      'Automat măsoară acest dispozitiv și se reține pe cele cu memorie puțină, ceea ce păstrează mai puține imagini în memorie și lasă trailerele ca imagini statice. Are efect complet la următoarea pornire.';

  @override
  String get performanceModeAuto => 'Automat';

  @override
  String get performanceModeStandard => 'Standard';

  @override
  String get performanceModeReduced => 'Redusă';

  @override
  String get trailerPreviewHeldBack =>
      'Dezactivat deoarece Performanța este setată la Redusă pentru acest dispozitiv';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Aplică o temă complet personalizată și comută între o interfață inspirată de Apple sau de Material Design.';

  @override
  String get customThemeTitle => 'Temă personalizată';

  @override
  String get customThemeSubtitle =>
      'Temele personalizate modifică elementele vizuale din întreaga aplicație Moonfin. Alege una dintre aceste opțiuni, potrivită stilului tău.';

  @override
  String get keyboardPreferSystemIme => 'Preferă tastatura de sistem';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Folosește implicit metoda de introducere a dispozitivului pentru introducerea textului';

  @override
  String get controller => 'Controler';

  @override
  String get gamepadNavigation => 'Navigare cu gamepad';

  @override
  String get gamepadNavigationDescription =>
      'Permite unui controler de joc conectat să mute focalizarea și să selecteze elemente';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Aspectul original, simplu și curat, implicit în Moonfin.';

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
      'Stil retro pixel-art, cu o paletă îndrăzneață, margini în blocuri, umbre puternice și un font pixelat';

  @override
  String get embyConnectSignInSubtitle =>
      'Autentifică-te cu contul tău Emby Connect';

  @override
  String get emailOrUsername => 'E-mail sau nume de utilizator';

  @override
  String get selectAServer => 'Selectează un server';

  @override
  String get tryAgain => 'Încearcă din nou';

  @override
  String get noLinkedServers =>
      'Nu există servere conectate la acest cont Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Date de autentificare Emby Connect nevalide';

  @override
  String get invalidEmbyConnectLogin =>
      'Nume de utilizator sau parolă Emby Connect nevalide';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serverul nu acceptă schimbul Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Eroare de rețea la contactarea Emby Connect sau a serverului selectat';

  @override
  String get loadingLinkedServers => 'Se încarcă serverele conectate...';

  @override
  String get connectingToServerEllipsis => 'Se conectează la server...';

  @override
  String get noReachableAddress =>
      'Nu a fost furnizată nicio adresă accesibilă';

  @override
  String get invalidServerExchangeResponse =>
      'Răspuns nevalid de la endpoint-ul de schimb al serverului';

  @override
  String unableToConnectTo(String target) {
    return 'Nu se poate conecta la $target';
  }

  @override
  String get exitApp => 'Ieși din Moonfin?';

  @override
  String get exitAppConfirmation => 'Sigur vrei să ieși?';

  @override
  String get exit => 'Ieșire';

  @override
  String get gameMenu => 'Meniu';

  @override
  String get gamePaused => 'Pe pauză';

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
  String get gameHoldToOpenMenu => 'Ține apăsat pentru meniu';

  @override
  String get gamePlaybackUnsupported =>
      'Rularea jocurilor nu este încă acceptată pe acest dispozitiv.';

  @override
  String get noHomeRowsLoaded =>
      'Nu s-au putut încărca rândurile de pe ecranul principal';

  @override
  String get noHomeRowsHint =>
      'Încearcă să reîmprospătezi sau să reduci secțiunile active ale ecranului principal.';

  @override
  String get retryHomeRows => 'Reîncearcă rândurile de pe ecranul principal';

  @override
  String get guide => 'Ghid';

  @override
  String get recordings => 'Înregistrări';

  @override
  String get schedule => 'Program';

  @override
  String get series => 'Seriale';

  @override
  String get noItemsFound => 'Nu s-au găsit elemente';

  @override
  String get home => 'Acasă';

  @override
  String get browseAll => 'Răsfoiește tot';

  @override
  String get genres => 'Genuri';

  @override
  String get collectionPlaceholder => 'Elementele de colecție vor apărea aici';

  @override
  String get browseByLetter => 'Răsfoiește după literă';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Răsfoirea alfabetică va apărea aici';

  @override
  String get suggestions => 'Sugestii';

  @override
  String get suggestionsPlaceholder => 'Elementele sugerate vor apărea aici';

  @override
  String get failedToLoadLibraries => 'Nu s-au putut încărca bibliotecile';

  @override
  String get noLibrariesFound => 'Nu s-au găsit biblioteci';

  @override
  String get library => 'Bibliotecă';

  @override
  String get displaySettings => 'Setări de afișare';

  @override
  String get allGenres => 'Toate genurile';

  @override
  String get noGenresFound => 'Nu s-au găsit genuri';

  @override
  String failedToLoadFolderError(String error) {
    return 'Nu s-a putut încărca folderul: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Acest folder este gol';

  @override
  String itemCountLabel(int count) {
    return '$count elemente';
  }

  @override
  String get failedToLoadFavorites => 'Nu s-au putut încărca favoritele';

  @override
  String get retry => 'Reîncearcă';

  @override
  String get noFavoritesYet => 'Încă nu ai favorite';

  @override
  String get favorites => 'Favorite';

  @override
  String totalCountItems(int count) {
    return '$count elemente';
  }

  @override
  String get continuing => 'În continuare';

  @override
  String get ended => 'Încheiat';

  @override
  String get sortAndFilter => 'Sortare și filtrare';

  @override
  String get type => 'Tip';

  @override
  String get sortBy => 'Sortează după';

  @override
  String get display => 'Afișare';

  @override
  String get imageType => 'Tip imagine';

  @override
  String get posterSize => 'Dimensiune poster';

  @override
  String get small => 'Mică';

  @override
  String get medium => 'Medie';

  @override
  String get large => 'Mare';

  @override
  String get extraLarge => 'Foarte mare';

  @override
  String get uiScaleGrandparents => 'Bunici';

  @override
  String get uiScaleGreatGrandparents => 'Străbunici';

  @override
  String get scrollDirection => 'Direcția derulării';

  @override
  String get scrollDirectionVertical => 'Vertical';

  @override
  String get scrollDirectionHorizontal => 'Orizontal';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genuri';
  }

  @override
  String get views => 'Vizualizări';

  @override
  String get albums => 'Albume';

  @override
  String get albumArtists => 'Artiștii albumului';

  @override
  String get artists => 'Artiști';

  @override
  String get bookmarks => 'Marcaje';

  @override
  String get noSavedBookmarks =>
      'Încă nu au fost salvate marcaje pentru acest titlu.';

  @override
  String get openBook => 'Deschide cartea';

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
    return 'acum $count min';
  }

  @override
  String hoursAgo(int count) {
    return 'acum $count h';
  }

  @override
  String daysAgo(int count) {
    return 'acum $count z';
  }

  @override
  String get discoverySubjects => 'Subiecte de descoperire';

  @override
  String get pickDiscoverySubjects =>
      'Alege ce fluxuri de subiecte să apară în Discover.';

  @override
  String get apply => 'Aplică';

  @override
  String get openLink => 'Deschide linkul';

  @override
  String get scanWithYourPhone => 'Scanează cu telefonul';

  @override
  String get audiobookGenres => 'Genuri de cărți audio';

  @override
  String get pickAudiobookGenres =>
      'Alege ce genuri să apară în Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Descoperă cărți audio';

  @override
  String get librivoxDescription =>
      'Titluri populare din domeniul public, de pe LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titluri';
  }

  @override
  String get scrollLeft => 'Derulează la stânga';

  @override
  String get scrollRight => 'Derulează la dreapta';

  @override
  String get scrollToTop => 'Derulează până sus';

  @override
  String get couldNotLoadGenre => 'Nu s-a putut încărca acest gen acum.';

  @override
  String get continueReading => 'Continuă lectura';

  @override
  String get savedHighlights => 'Pasaje evidențiate salvate';

  @override
  String get continueListening => 'Continuă ascultarea';

  @override
  String get listen => 'Ascultă';

  @override
  String get resume => 'Reia';

  @override
  String get failedToLoadLibrary => 'Nu s-a putut încărca biblioteca';

  @override
  String get popularNow => 'Populare acum';

  @override
  String get savedForLater => 'Salvat pentru mai târziu';

  @override
  String get topListens => 'Cele mai ascultate';

  @override
  String get unreadDiscoveries => 'Descoperiri necitite';

  @override
  String get pickUpAgain => 'Reia de unde ai rămas';

  @override
  String get bookHighlightsDescription =>
      'Cărțile tale cu pasaje evidențiate, favorite sau progres la lectură.';

  @override
  String get handPickedFromLibrary => 'Alese manual din biblioteca ta.';

  @override
  String get handPickedFromListeningQueue =>
      'Alese manual din coada ta de ascultare.';

  @override
  String get booksWithHighlights =>
      'Cărți cu pasaje evidențiate, favorite sau progres la lectură.';

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
  String get searchAudiobooks => 'Caută cărți audio';

  @override
  String get searchYourLibrary => 'Caută în biblioteca ta';

  @override
  String get pickUpStory => 'Reia povestea de unde ai rămas';

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
  String get readyWhenYouAre => 'Gata când ești și tu';

  @override
  String get details => 'Detalii';

  @override
  String get listeningRoom => 'Sala de ascultare';

  @override
  String get bookmarksAndProgress => 'Marcaje și progres';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titluri aranjate pentru navigare orientată spre citit.';
  }

  @override
  String get titles => 'Titluri';

  @override
  String get allTitles => 'Toate titlurile';

  @override
  String get authors => 'Autori';

  @override
  String get browseByAuthor => 'Răsfoiește după autor';

  @override
  String get browseByGenre => 'Răsfoiește după gen';

  @override
  String get discover => 'Descoperă';

  @override
  String get trendingTitlesOpenLibrary =>
      'Titluri populare pe subiecte din Open Library.';

  @override
  String get noBookmarkedItems => 'Niciun element marcat încă';

  @override
  String get nothingMatchesSection =>
      'Nimic nu se potrivește încă cu această secțiune. Încearcă altă filă sau revino după ce se termină sincronizarea bibliotecii.';

  @override
  String get audiobooks => 'Cărți audio';

  @override
  String noLabelFound(String label) {
    return 'Nu s-a găsit $label';
  }

  @override
  String get folder => 'Folder';

  @override
  String get filters => 'Filtre';

  @override
  String get readingStatus => 'Stare de citire';

  @override
  String get playedStatus => 'Stare redare';

  @override
  String get readStatus => 'Citite';

  @override
  String get watched => 'Vizionate';

  @override
  String get unread => 'Necitit';

  @override
  String get unwatched => 'Nevizionate';

  @override
  String get seriesStatus => 'Starea serialului';

  @override
  String get allLibraries => 'Toate bibliotecile';

  @override
  String get books => 'Cărți';

  @override
  String get latestBooks => 'Cele mai recente cărți';

  @override
  String get latestAudiobooks => 'Cele mai recente cărți audio';

  @override
  String get latestComics => 'Cele mai noi benzi desenate';

  @override
  String get comics => 'Benzi desenate';

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
  String get bookFormatComic => 'Bandă desenată';

  @override
  String get noBooksFound => 'Nu s-au găsit cărți pentru acest autor.';

  @override
  String get noBooksFoundDescription =>
      'Această bibliotecă nu conține încă nicio carte, carte audio sau bandă desenată.';

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
  String get readers => 'Cititori';

  @override
  String get openLinks => 'Deschide linkurile';

  @override
  String get librivoxPage => 'Pagina LibriVox';

  @override
  String get internetArchive => 'Arhiva Internet';

  @override
  String get rssFeed => 'Flux RSS';

  @override
  String get downloadZip => 'Descarcă Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count secțiuni';
  }

  @override
  String firstPublished(int year) {
    return 'Publicat prima dată în $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Nu există încă o prezentare disponibilă în Open Library pentru acest titlu.';

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
  String get audiobookDetails => 'Detalii carte audio';

  @override
  String authorsCountTitle(int count) {
    return '$count autori';
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
  String get trackList => 'Lista pieselor';

  @override
  String get itemListPlaceholder => 'Lista elementelor va apărea aici';

  @override
  String get failedToLoad => 'Nu s-a putut încărca';

  @override
  String get delete => 'Șterge';

  @override
  String get save => 'Salvează';

  @override
  String get moreLikeThis => 'Similare';

  @override
  String get castAndCrew => 'Distribuție și echipă';

  @override
  String get collection => 'Colecție';

  @override
  String get episodes => 'Episoade';

  @override
  String get nextUp => 'Urmează';

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
  String get other => 'Altele';

  @override
  String get discography => 'Discografie';

  @override
  String get similarArtists => 'Artiști similari';

  @override
  String get tableOfContents => 'Cuprins';

  @override
  String get tracklist => 'Lista pieselor';

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
      'Nu există încă o prezentare disponibilă pentru acest titlu.';

  @override
  String get noBiographyAvailable =>
      'Nicio biografie disponibilă pentru acest autor.';

  @override
  String get unableToLoadAuthorDetails =>
      'Nu s-au putut încărca detaliile autorului acum.';

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
      other: '$count de sezoane',
      few: '$count sezoane',
      one: '1 sezon',
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
  String get extras => 'Bonusuri';

  @override
  String get behindTheScenes => 'În culise';

  @override
  String get deletedScenes => 'Scene șterse';

  @override
  String get featurettes => 'Featurette';

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
    return 'Au mai rămas $time';
  }

  @override
  String endsIn(String time) {
    return 'Se termină în $time';
  }

  @override
  String get view => 'Vizualizare';

  @override
  String get resumeReading => 'Reia lectura';

  @override
  String get read => 'Citește';

  @override
  String resumeFrom(String position) {
    return 'Reia de la $position';
  }

  @override
  String get play => 'Redă';

  @override
  String get startOver => 'Începe de la capăt';

  @override
  String get restart => 'Repornire';

  @override
  String get readOffline => 'Citește offline';

  @override
  String get playOffline => 'Redă offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtitrări';

  @override
  String get version => 'Versiune';

  @override
  String get cast => 'Proiectează';

  @override
  String get castMembers => 'Distribuție';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Terminat';

  @override
  String get favorited => 'Adăugat la favorite';

  @override
  String get favorite => 'Favorit';

  @override
  String get playlist => 'Lista de redare';

  @override
  String get downloaded => 'Descărcat';

  @override
  String get finalizingDownload => 'Finalizare…';

  @override
  String get queuedDownload => 'În coadă';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Încă $count în coadă',
      few: 'Încă $count în coadă',
      one: 'Încă 1 în coadă',
    );
    return '$_temp0';
  }

  @override
  String get downloadAll => 'Descarcă tot';

  @override
  String get download => 'Descarcă';

  @override
  String get deleteDownloaded => 'Șterge descărcarea';

  @override
  String get goToSeries => 'Mergi la serial';

  @override
  String get editMetadata => 'Editează metadatele';

  @override
  String get less => 'Mai puțin';

  @override
  String get more => 'Mai mult';

  @override
  String get deleteItem => 'Șterge elementul';

  @override
  String get deletePlaylist => 'Șterge lista de redare';

  @override
  String get deletePlaylistMessage =>
      'Ștergi această listă de redare de pe server?';

  @override
  String get deleteItemMessage => 'Ștergi acest element de pe server?';

  @override
  String get failedToDeletePlaylist => 'Nu s-a putut șterge lista de redare';

  @override
  String get failedToDeleteItem => 'Elementul nu a putut fi șters';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Operațiunea de ștergere a eșuat cu următoarea eroare: $error';
  }

  @override
  String get renamePlaylist => 'Redenumește lista de redare';

  @override
  String get playlistName => 'Numele listei de redare';

  @override
  String get deleteDownloadedAlbum => 'Șterge albumul descărcat';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Ștergi melodiile descărcate pentru „$title”?';
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
    return 'Se descarcă $title ($count elemente)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Sigur vrei să ștergi „$name” de pe server? Această acțiune nu poate fi anulată.';
  }

  @override
  String get itemDeleted => 'Element șters';

  @override
  String get noPlayableTrailerFound =>
      'Nu a fost găsit niciun trailer redabil.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Format de carte neacceptat: .$extension';
  }

  @override
  String get audioTrack => 'Piesă audio';

  @override
  String get subtitleTrack => 'Piesă de subtitrare';

  @override
  String get none => 'Niciuna';

  @override
  String get downloadSubtitlesLabel => 'Descarcă subtitrări...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Caută folosind pluginul OpenSubtitles';

  @override
  String get downloadSubtitles => 'Descarcă subtitrări';

  @override
  String get searchingSubtitles => 'Se caută subtitrări…';

  @override
  String get downloadingSubtitle => 'Se descarcă subtitrarea…';

  @override
  String get selectedSubtitleInvalid => 'Subtitrarea selectată este nevalidă.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitrare descărcată și selectată: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitrarea a fost descărcată. Poate dura un moment până apare, cât timp Jellyfin reîmprospătează elementul.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nu s-au găsit subtitrări online pentru $language.';
  }

  @override
  String get selectVersion => 'Selectează versiunea';

  @override
  String versionNumber(int number) {
    return 'Versiunea $number';
  }

  @override
  String get downloadAllQuality => 'Descarcă tot — Calitate';

  @override
  String get downloadQuality => 'Calitatea descărcării';

  @override
  String get originalFileNoReencoding => 'Fișier original, fără recodificare';

  @override
  String get originalFilesNoReencoding =>
      'Fișiere originale, fără recodificare';

  @override
  String get noEpisodesLoaded => 'Niciun episod încărcat';

  @override
  String get downloadScopeTitle => 'Ce să descarci';

  @override
  String get downloadAllEpisodes => 'Toate episoadele';

  @override
  String get downloadUnwatchedEpisodes => 'Toate episoadele nevizionate';

  @override
  String get downloadAllMovies => 'Toate filmele';

  @override
  String get downloadUnwatchedMovies => 'Toate filmele nevizionate';

  @override
  String get downloadScopeLoading => 'Se încarcă elementele...';

  @override
  String get downloadScopeLoadFailed =>
      'Nu s-au putut încărca elementele de descărcat';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size în total';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received din $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return '$size în total';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count necunoscute';
  }

  @override
  String downloadingItem(String name, String quality) {
    return 'Se descarcă $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Șterge fișierele descărcate';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Ștergi fișierele locale pentru $typeLabel?\n\nAcest lucru va elibera spațiu de stocare. Le poți descărca din nou mai târziu.';
  }

  @override
  String get downloadedFilesDeleted => 'Fișierele descărcate au fost șterse';

  @override
  String get failedToDeleteFiles => 'Nu s-au putut șterge fișierele';

  @override
  String get deleteFiles => 'Șterge fișierele';

  @override
  String get director => 'REGIZOR';

  @override
  String get starring => 'ÎN DISTRIBUȚIE';

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
    return '+$count în plus';
  }

  @override
  String totalEpisodes(int count) {
    return '$count episoade';
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
    return 'Decedat la $date';
  }

  @override
  String age(int age) {
    return 'Vârsta $age';
  }

  @override
  String get showLess => 'Arată mai puțin';

  @override
  String get readMore => 'Citește mai mult';

  @override
  String get shuffle => 'Amestecă';

  @override
  String get shuffleAll => 'Redă totul aleatoriu';

  @override
  String get shuffleAllMusic => 'Redă aleatoriu toată muzica';

  @override
  String get carSignInPrompt => 'Autentifică-te în Moonfin pe telefon';

  @override
  String get carServerUnreachable => 'Serverul nu poate fi contactat';

  @override
  String downloadsCount(int count) {
    return '$count descărcări';
  }

  @override
  String get perfectMatch => 'Potrivire perfectă';

  @override
  String get aiTranslated => 'Tradus cu AI';

  @override
  String get machineTranslated => 'Tradus automat';

  @override
  String get hearingImpaired => 'SDH';

  @override
  String framerateFps(String rate) {
    return '$rate fps';
  }

  @override
  String channelsCount(int count) {
    return '$count can.';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Acțiunea „$action” pentru subtitrări online necesită permisiunea de gestionare a subtitrărilor Jellyfin pentru acest utilizator.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Acest element nu a fost găsit pe server pentru acțiunea „$action” pentru subtitrări online.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Acțiunea „$action” pentru subtitrări online a eșuat: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Acțiunea „$action” pentru subtitrări online a eșuat (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Nu s-a putut efectua acțiunea „$action” pentru subtitrări online.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'toate episoadele descărcate pentru „$name”';
  }

  @override
  String get deleteSeasonFiles => 'toate episoadele descărcate din acest sezon';

  @override
  String get stillWatching => 'Încă vizionezi?';

  @override
  String get unableToLoadTrailerStream =>
      'Fluxul trailerului nu poate fi încărcat.';

  @override
  String get trailerTimedOut => 'Trailerul a expirat în timpul încărcării.';

  @override
  String get playbackFailedForTrailer =>
      'Redarea a eșuat pentru acest trailer.';

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
    return 'Nu s-a putut seta volumul proiectării: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Comenzi $label';
  }

  @override
  String get deviceVolume => 'Volumul dispozitivului';

  @override
  String get unavailable => 'Indisponibil';

  @override
  String get pause => 'Pauză';

  @override
  String get syncPosition => 'Poziția de sincronizare';

  @override
  String stopCast(String label) {
    return 'Oprește $label';
  }

  @override
  String get queueIsEmpty => 'Coada este goală';

  @override
  String trackNumber(int number) {
    return 'Piesa $number';
  }

  @override
  String get remotePlayback => 'Redare la distanță';

  @override
  String get castingToGoogleCast => 'Se proiectează în Google Cast';

  @override
  String get castingViaAirPlay => 'Proiectare prin AirPlay';

  @override
  String get castingViaDlna => 'Proiectare prin DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds secunde';
  }

  @override
  String get longPressToUnlock => 'Apasă lung pentru a debloca';

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
  String get subtitleDelay => 'Întârzierea subtitrării';

  @override
  String get reset => 'Resetează';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get playbackInformation => 'Informații de redare';

  @override
  String get showMpvStats => 'Arată statisticile mpv (Shift+I)';

  @override
  String get hideMpvStats => 'Ascunde statisticile mpv (Shift+I)';

  @override
  String get keyboardShortcutsTitle => 'Comenzi rapide de la tastatură';

  @override
  String get keyboardShortcutsSubtitle =>
      'Taste pentru aplicație, playerul video și cititor';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Apasă ? sau F1 în timpul redării unui videoclip pentru a vedea această listă fără a părăsi playerul.';

  @override
  String get keyboardShortcutsSectionApp => 'Peste tot';

  @override
  String get keyboardShortcutsSectionAppScope => 'Pe orice ecran';

  @override
  String get keyboardShortcutsSectionPlayer => 'Player video';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'Cât timp un videoclip este deschis, în redare sau pe pauză';

  @override
  String get keyboardShortcutsSectionReader =>
      'Cititor de cărți și benzi desenate';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'În timpul citirii unei cărți sau a unei benzi desenate';

  @override
  String get keyNameArrowKeys => 'Tastele săgeți';

  @override
  String get keyNameSpace => 'Spațiu';

  @override
  String get keyNameEnter => 'Enter';

  @override
  String get keyNameEsc => 'Esc';

  @override
  String get keyNameBackspace => 'Backspace';

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
  String get keyNameScrollWheel => 'Rotița mouse-ului';

  @override
  String get shortcutMoveFocus => 'Navighează între elemente';

  @override
  String get shortcutActivate => 'Deschide elementul selectat';

  @override
  String get shortcutGoBack => 'Înapoi';

  @override
  String get shortcutToggleFullscreen => 'Ecran complet activat sau dezactivat';

  @override
  String get shortcutQuit => 'Ieși din Moonfin';

  @override
  String get shortcutPlayPause => 'Redă sau pune pe pauză';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Arată comenzile sau redă/pauză dacă sunt afișate';

  @override
  String get shortcutSeekBack =>
      'Derulează înapoi (ține apăsat pentru salturi mai mari)';

  @override
  String get shortcutSeekForward =>
      'Derulează înainte (ține apăsat pentru salturi mai mari)';

  @override
  String get shortcutVolumeUp => 'Volum mai mare';

  @override
  String get shortcutVolumeDown => 'Volum mai mic';

  @override
  String get shortcutMute => 'Dezactivează sau activează sunetul';

  @override
  String get shortcutToggleSubtitles => 'Subtitrări activate sau dezactivate';

  @override
  String get shortcutSlower => 'Încetinește';

  @override
  String get shortcutFaster => 'Accelerează';

  @override
  String get shortcutPlaybackInfo => 'Arată informațiile de redare';

  @override
  String get shortcutMpvStats => 'Statistici mpv activate sau dezactivate';

  @override
  String get shortcutRecropBlackBars => 'Recrop black bars';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Ieși din ecranul complet sau oprește dacă nu ești în ecran complet';

  @override
  String get shortcutStopPlayback => 'Oprește redarea';

  @override
  String get shortcutNextItem => 'Elementul următor';

  @override
  String get shortcutPreviousItem => 'Elementul anterior';

  @override
  String get shortcutShowShortcuts => 'Arată această listă';

  @override
  String get shortcutNextPage => 'Pagina următoare';

  @override
  String get shortcutPreviousPage => 'Pagina anterioară';

  @override
  String get shortcutScrollPage => 'Derulează pagina (cărți electronice)';

  @override
  String get shortcutFirstPage => 'Prima pagină sau începutul capitolului';

  @override
  String get shortcutLastPage => 'Ultima pagină sau sfârșitul capitolului';

  @override
  String get shortcutZoom => 'Mărește sau micșorează (benzi desenate)';

  @override
  String get shortcutResetZoom => 'Resetează zoomul (benzi desenate)';

  @override
  String get playback => 'Redare';

  @override
  String get playMethod => 'Metoda de redare';

  @override
  String get directPlay => 'Redare directă';

  @override
  String get directStream => 'Flux direct';

  @override
  String get transcoding => 'Transcodare';

  @override
  String get transcodeReasons => 'Motivele transcodării';

  @override
  String get player => 'Player';

  @override
  String get container => 'Container';

  @override
  String get bitrate => 'Rata de biți';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Rezoluție';

  @override
  String get hdr => 'HDR';

  @override
  String get hdrOutput => 'Ieșire HDR';

  @override
  String hdrOutputActive(String format) {
    return 'Activ — $format';
  }

  @override
  String get hdrOutputActiveTonemapped =>
      'Activ — conversie tonală la SDR pentru acest ecran';

  @override
  String get hdrOutputDisplayNotHdr => 'Inactiv — ecranul nu este în modul HDR';

  @override
  String get hdrOutputContentSdr => 'Inactiv — conținutul este SDR';

  @override
  String get hdrOutputDisabled => 'Inactiv — dezactivat în setări';

  @override
  String get hdrOutputFailed =>
      'Inactiv — nu a putut porni, se folosește calea standard';

  @override
  String get nativeHdrOutput => 'Ieșire HDR nativă';

  @override
  String get nativeHdrOutputDescription =>
      'Trimite videoclipul HDR către ecran nemodificat, în loc să-l convertească în SDR. Folosit doar când ecranul este deja în modul HDR și titlul este HDR.';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Rata de biți video';

  @override
  String get track => 'Piesă';

  @override
  String get channels => 'Canale';

  @override
  String get audioBitrate => 'Rata de biți audio';

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
    return 'Eroare de sesiune $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Nu s-au putut încărca detaliile cărții: $error';
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
    return 'Marcaj deja salvat la $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Marcaj adăugat: $label';
  }

  @override
  String get noBookmarksYet =>
      'Încă nu există marcaje.\nAtinge pictograma de marcaj în timpul lecturii pentru a-ți salva poziția.';

  @override
  String get noTableOfContentsAvailable => 'Nu este disponibil niciun cuprins';

  @override
  String pageLabel(int number) {
    return 'Pagina $number';
  }

  @override
  String get position => 'Poziție';

  @override
  String get bookReader => 'Cititor de cărți';

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
  String get markUnread => 'Marchează ca necitit';

  @override
  String get markAsRead => 'Marchează ca citit';

  @override
  String get reloadReader => 'Reîncarcă cititorul';

  @override
  String get noPagesFound => 'Nu s-au găsit pagini.';

  @override
  String get failedToDecodePageImage => 'Nu s-a putut decoda imaginea paginii.';

  @override
  String resetZoom(String zoom) {
    return 'Resetează zoomul (${zoom}x)';
  }

  @override
  String get singlePage => 'O singură pagină';

  @override
  String get twoPageSpread => 'Afișare pe două pagini';

  @override
  String get addBookmark => 'Adaugă marcaj';

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
  String get themeSystem => 'Temă: Sistem';

  @override
  String get themeLight => 'Temă: Luminoasă';

  @override
  String get themeDark => 'Temă: Întunecată';

  @override
  String get themeSepia => 'Temă: Sepia';

  @override
  String get invertColorsFixedLayout => 'Inversează culorile (aspect fix)';

  @override
  String get invertColorsPdf => 'Inversează culorile (PDF)';

  @override
  String get preparingInAppReader => 'Se pregătește cititorul în aplicație...';

  @override
  String get pdfDataNotAvailable => 'Datele PDF nu sunt disponibile.';

  @override
  String get readerFallbackModeActive =>
      'Modul de rezervă al cititorului este activ';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Această platformă nu poate găzdui motorul de documente încorporat pentru fișierele $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Folosește Reîncarcă cititorul după trecerea la o platformă țintă acceptată (Android, iOS, macOS).';

  @override
  String get openExternally => 'Deschide extern';

  @override
  String get noEpubChaptersFound => 'Nu s-au găsit capitole EPUB.';

  @override
  String get readerNotReady => 'Cititorul nu este pregătit.';

  @override
  String get seriesRecordings => 'Înregistrări de seriale';

  @override
  String get now => 'Acum';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Știri';

  @override
  String get kids => 'Copii';

  @override
  String get premiere => 'Premieră';

  @override
  String get guideRepeatBadge => 'Repetă';

  @override
  String get guideTimeline => 'Cronologia ghidului';

  @override
  String failedToLoadGuide(String error) {
    return 'Nu s-a încărcat ghidul: $error';
  }

  @override
  String get noChannelsFound => 'Nu s-au găsit canale';

  @override
  String get noProgramData => 'Nu există date despre programe';

  @override
  String get liveBadge => 'LIVE';

  @override
  String guideNextProgram(String time, String title) {
    return 'Urmează: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes min rămase';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours h rămase';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours h $minutes min rămase';
  }

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Eliminat din canalele favorite';

  @override
  String get addedToFavoriteChannels => 'Adăugat la canalele favorite';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Nu s-a putut actualiza canalul favorit';

  @override
  String get unfavoriteChannel => 'Elimină canalul din favorite';

  @override
  String get favoriteChannel => 'Adaugă canalul la favorite';

  @override
  String get record => 'Înregistrează';

  @override
  String get cancelRecordingAction => 'Anulează înregistrarea';

  @override
  String get programSetToRecord => 'Program setat la înregistrare';

  @override
  String get recordingCancelled => 'Înregistrare anulată';

  @override
  String get unableToCreateRecording => 'Nu s-a putut crea înregistrarea';

  @override
  String get recordSeries => 'Înregistrează serialul';

  @override
  String get seriesSetToRecord => 'Serial setat la înregistrare';

  @override
  String get seriesRecordingCancelled =>
      'Înregistrarea serialului a fost anulată';

  @override
  String get unableToCreateSeriesRecording =>
      'Nu s-a putut crea înregistrarea serialului';

  @override
  String get watch => 'Vizionează';

  @override
  String get watchChannelLive => 'Vezi canalul live';

  @override
  String get close => 'Închide';

  @override
  String failedToPlayChannel(String name) {
    return 'Nu s-a putut reda $name';
  }

  @override
  String get playbackStreamLost =>
      'Redarea s-a oprit și nu a putut fi recuperată.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Se reconectează… ($attempt din $total)';
  }

  @override
  String get failedToLoadRecordings => 'Nu s-au putut încărca înregistrările';

  @override
  String get scheduledInNext24Hours => 'Programat în următoarele 24 de ore';

  @override
  String get recentRecordings => 'Înregistrări recente';

  @override
  String get tvSeries => 'Seriale TV';

  @override
  String get failedToLoadSchedule => 'Nu s-a putut încărca programul';

  @override
  String get noScheduledRecordings => 'Nu există înregistrări programate';

  @override
  String get cancelRecording => 'Anulezi înregistrarea?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Anulezi înregistrarea programată a „$name”?';
  }

  @override
  String get no => 'Nu';

  @override
  String get yesCancel => 'Da, anulează';

  @override
  String get failedToCancelRecording => 'Nu s-a putut anula înregistrarea';

  @override
  String get failedToLoadSeriesRecordings =>
      'Nu s-au putut încărca înregistrările de seriale';

  @override
  String get noSeriesRecordings => 'Nicio înregistrare de serial';

  @override
  String get cancelSeriesRecording => 'Anulează înregistrarea serialului';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Anulezi înregistrarea serialului?';

  @override
  String stopRecordingName(String name) {
    return 'Oprești înregistrarea „$name”?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nu s-a putut anula înregistrarea serialului';

  @override
  String get searchThisLibrary => 'Caută în această bibliotecă...';

  @override
  String get searchEllipsis => 'Caută...';

  @override
  String noResultsForQuery(String query) {
    return 'Niciun rezultat pentru „$query”';
  }

  @override
  String searchFailedError(String error) {
    return 'Căutarea a eșuat: $error';
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
  String get savedMedia => 'Descărcări';

  @override
  String get tvShows => 'Seriale TV';

  @override
  String get music => 'Muzică';

  @override
  String get musicAlbums => 'Albume muzicale';

  @override
  String get noMediaInFilter => 'Nu există conținut media în acest filtru';

  @override
  String get noDownloadedMediaYet => 'Niciun conținut media descărcat încă';

  @override
  String get browseLibrary => 'Răsfoiește biblioteca';

  @override
  String get deleteDownload => 'Șterge descărcarea';

  @override
  String removeItemAndFiles(String name) {
    return 'Elimini „$name” și fișierele sale?';
  }

  @override
  String tracksCount(int count) {
    return '$count piese';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Redă albumul';

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
  String get deleteEpisode => 'Șterge episodul';

  @override
  String removeName(String name) {
    return 'Elimini „$name”?';
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
  String get seriesNotFound => 'Serialul nu a fost găsit';

  @override
  String get errorLoadingSeries => 'Eroare la încărcarea serialului';

  @override
  String get downloadedEpisodes => 'Episoade descărcate';

  @override
  String seasonNumber(int number) {
    return 'Sezonul $number';
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
    return 'Ștergi toate episoadele descărcate din $season?';
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
  String get storageManagement => 'Gestionarea stocării';

  @override
  String get storageBreakdown => 'Distribuția spațiului de stocare';

  @override
  String get downloadedItems => 'Elemente descărcate';

  @override
  String get activeDownloads => 'Descărcări active';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de elemente',
      few: '$count elemente',
      one: '1 element',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used din $limit';
  }

  @override
  String get savedMediaSelectItems => 'Selectează elemente';

  @override
  String get savedMediaNoDownloads => 'Nimic salvat încă';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Descărcările pe care le pornești apar aici și se redau fără conexiune.';

  @override
  String get savedMediaNoActiveDownloads => 'Nimic nu se descarcă acum';

  @override
  String get savedMediaNoResults => 'Nicio descărcare nu corespunde căutării';

  @override
  String get savedMediaPlayFromStart => 'Redă de la început';

  @override
  String get savedMediaGoToDetails => 'Mergi la detalii';

  @override
  String get savedMediaDeleteDownload => 'Șterge descărcarea';

  @override
  String savedMediaDeleteSeason(String season) {
    return 'Șterge $season';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Șterge $count de episoade',
      few: 'Șterge $count episoade',
      one: 'Șterge 1 episod',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Deschide serialul';

  @override
  String get savedMediaPlayNextUnwatched => 'Redă următorul nevizionat';

  @override
  String get savedMediaRead => 'Citește';

  @override
  String get savedMediaCancelDownload => 'Anulează descărcarea';

  @override
  String get sortBySize => 'Dimensiune';

  @override
  String get sortByName => 'Nume';

  @override
  String get sortByDateAdded => 'Data adăugării';

  @override
  String get storageLimit => 'Limita de stocare';

  @override
  String get noLimit => 'Fără limită';

  @override
  String get deleteAllDownloads => 'Șterge toate descărcările';

  @override
  String get deleteAllDownloadsWarning =>
      'Aceasta va elimina toate fișierele media descărcate și nu poate fi anulată.';

  @override
  String get deleteAll => 'Șterge tot';

  @override
  String get deleteSelected => 'Șterge selectate';

  @override
  String deleteSelectedCount(int count) {
    return 'Ștergi $count elemente descărcate?';
  }

  @override
  String get musicAndAudiobooks => 'Muzică și cărți audio';

  @override
  String get images => 'Imagini';

  @override
  String get database => 'Baza de date';

  @override
  String ofStorageLimit(String limit) {
    return 'din limita de $limit';
  }

  @override
  String get settings => 'Setări';

  @override
  String get settingsSearchHint => 'Caută în setări';

  @override
  String get authentication => 'Autentificare';

  @override
  String get autoLoginServerManagement =>
      'Autentificare automată, gestionarea serverelor';

  @override
  String get pinCode => 'Cod PIN';

  @override
  String get setUpPinCodeProtection => 'Configurează protecția prin cod PIN';

  @override
  String get parentalControls => 'Control parental';

  @override
  String get contentRatingRestrictions =>
      'Restricții privind evaluarea conținutului';

  @override
  String get bitRateResolutionBehavior =>
      'Rată de biți, rezoluție, comportament';

  @override
  String get languageSizeAppearance => 'Limbă, dimensiune, aspect';

  @override
  String get qualityStorage => 'Calitate, stocare';

  @override
  String get serverSyncAndPluginStatus =>
      'Sincronizarea serverului și starea pluginului';

  @override
  String get mediaRequestIntegration => 'Integrarea cererilor media';

  @override
  String get switchServer => 'Schimbă serverul';

  @override
  String get signOut => 'Deconectare';

  @override
  String get versionLicenses => 'Versiune, licențe';

  @override
  String get account => 'Cont';

  @override
  String get signInAndSecurity => 'Autentificare și securitate';

  @override
  String get administration => 'Administrare';

  @override
  String get serverSettingsUsersLibraries =>
      'Setări server, utilizatori, biblioteci';

  @override
  String get customization => 'Personalizare';

  @override
  String get themeAndLayout => 'Temă și aspect';

  @override
  String get videoAndSubtitles => 'Video și subtitrări';

  @override
  String get integrations => 'Integrări';

  @override
  String get pluginAndRequests => 'Plugin și cereri';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personalizează contul, redarea și comportamentul interfeței';

  @override
  String optionsCount(int count) {
    return '$count opțiuni';
  }

  @override
  String get themeAndAppearance => 'Temă și aspect';

  @override
  String get focusBorderColor => 'Culoarea chenarului de focalizare';

  @override
  String get watchedIndicators => 'Indicatori de vizionare';

  @override
  String get always => 'Întotdeauna';

  @override
  String get mixedRowsOnly => 'Doar rânduri mixte';

  @override
  String get hideUnwatched => 'Ascunde nevizionate';

  @override
  String get episodesOnly => 'Doar episoade';

  @override
  String get never => 'Niciodată';

  @override
  String get focusExpansionAnimation => 'Animație de extindere a focalizării';

  @override
  String get desktopUiScale => 'Scalarea interfeței';

  @override
  String get scaleFocusedCards =>
      'Scalează cardurile și plăcile focalizate sau cu cursorul deasupra';

  @override
  String get backgroundBackdrops => 'Imagini de fundal';

  @override
  String get showBackdropImages =>
      'Afișează imagini de fundal în spatele conținutului';

  @override
  String get seriesThumbnails => 'Afișează miniaturile serialului';

  @override
  String get seriesThumbnailsDescription =>
      'Pentru serialele TV, folosește ilustrația principală a serialului în locul miniaturii episodului.';

  @override
  String get homeRowInfoOverlay =>
      'Suprapunere cu informații pentru rândurile din ecranul principal';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Afișează titlul și metadatele la navigarea prin rândurile din ecranul principal';

  @override
  String get clockDisplay => 'Afișarea ceasului';

  @override
  String get inMenus => 'În meniuri';

  @override
  String get inVideo => 'În video';

  @override
  String get seasonalEffects => 'Efecte sezoniere';

  @override
  String get seasonalEffectsDescription =>
      'Efecte vizuale și decorațiuni de sezon';

  @override
  String get loadingAnimation => 'Animație de încărcare';

  @override
  String get loadingAnimationDescription =>
      'Personalizează animațiile de încărcare folosite în Moonfin';

  @override
  String get loadingAnimationConfiguration =>
      'Configurarea animației de încărcare';

  @override
  String get loadingAnimationImage => 'Imagine';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Sigla Moonfin';

  @override
  String get loadingAnimationImageSpinner => 'Spinner';

  @override
  String get loadingAnimationImageRunner => 'Alergător';

  @override
  String get loadingAnimationImageMoonPhases => 'Fazele Lunii';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Fazele Moonfin';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Fazele Neonfin';

  @override
  String get loadingAnimationSize => 'Dimensiunea animației';

  @override
  String get loadingAnimationSizeThumbnail => 'Miniatură';

  @override
  String get loadingAnimationSizeSmall => 'Mică';

  @override
  String get loadingAnimationSizeMedium => 'Medie';

  @override
  String get loadingAnimationSizeLarge => 'Mare';

  @override
  String get loadingAnimationPosition => 'Poziția animației';

  @override
  String get loadingAnimationPositionTopLeft => 'Sus, stânga';

  @override
  String get loadingAnimationPositionTopCenter => 'Sus, centru';

  @override
  String get loadingAnimationPositionTopRight => 'Sus, dreapta';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Mijloc, stânga';

  @override
  String get loadingAnimationPositionMiddle => 'Mijloc';

  @override
  String get loadingAnimationPositionMiddleRight => 'Mijloc, dreapta';

  @override
  String get loadingAnimationPositionBottomLeft => 'Jos, stânga';

  @override
  String get loadingAnimationPositionBottomCenter => 'Jos, centru';

  @override
  String get loadingAnimationPositionBottomRight => 'Jos, dreapta';

  @override
  String get loadingAnimationPositionBouncing => 'Săltăreț';

  @override
  String get loadingAnimationSpeed => 'Viteza animației';

  @override
  String get loadingAnimationSpeedSlow => 'Lentă';

  @override
  String get loadingAnimationSpeedModerate => 'Moderată';

  @override
  String get loadingAnimationSpeedFast => 'Rapidă';

  @override
  String get loadingAnimationSpeedUltra => 'Ultra';

  @override
  String get showLoadingAnimationText => 'Afișezi textul?';

  @override
  String get loadingAnimationPreview => 'Previzualizare';

  @override
  String get snow => 'Zăpadă';

  @override
  String get fireworks => 'Artificii';

  @override
  String get confetti => 'Confeti';

  @override
  String get fallingLeaves => 'Frunze căzătoare';

  @override
  String get seasonalChristmas => 'Christmas';

  @override
  String get seasonalPetals => 'Spring Petals';

  @override
  String get seasonalFireflies => 'Fireflies';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Density';

  @override
  String get seasonalDensityLight => 'Light';

  @override
  String get seasonalDensityNormal => 'Normal';

  @override
  String get seasonalDensityHeavy => 'Heavy';

  @override
  String get seasonalRow => 'Seasonal Row';

  @override
  String get seasonalRowDescription =>
      'Show a row of holiday movies from your library, with Seerr suggestions when available.';

  @override
  String get seasonalRowSubtitle => 'Seasonal';

  @override
  String get seasonalRowCountry => 'Country';

  @override
  String get seasonalRowCountryAuto => 'Automatic';

  @override
  String get countryUnitedStates => 'United States';

  @override
  String get countryCanada => 'Canada';

  @override
  String get seasonalRowCountryOther => 'Other';

  @override
  String get seasonalRowHolidays => 'Holidays';

  @override
  String get seasonalRowHolidaysHint => 'Untick a holiday to hide its row.';

  @override
  String get holidayNewYear => 'New Year\'s';

  @override
  String get holidayValentines => 'Valentine\'s Day';

  @override
  String get holidayEaster => 'Easter';

  @override
  String get holidayPride => 'Pride';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Thanksgiving';

  @override
  String get holidayChristmas => 'Christmas Movies';

  @override
  String get holidayLunarNewYear => 'Lunar New Year';

  @override
  String get holidayDiwali => 'Diwali';

  @override
  String get themeMusic => 'Muzică tematică';

  @override
  String get playThemeMusicOnDetailPages =>
      'Redă muzică tematică în paginile de detalii';

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
  String get themeMusicOnHomeRows =>
      'Muzică tematică pe rândurile din ecranul principal';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Redă la navigarea pe ecranul principal';

  @override
  String get loopThemeMusic => 'Repetă muzica tematică';

  @override
  String get loopThemeMusicSubtitle =>
      'Repetă piesa în loc să o redea o singură dată';

  @override
  String get detailsBackgroundBlur => 'Estomparea fundalului pentru detalii';

  @override
  String get detailsBackgroundOpacity => 'Opacitatea fundalului detaliilor';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Estomparea fundalului la navigare';

  @override
  String get maxStreamingBitrate => 'Rata maximă de biți pentru streaming';

  @override
  String get maxResolution => 'Rezoluție maximă';

  @override
  String get playerZoomMode => 'Modul de zoom al playerului';

  @override
  String get settingsScrollWheelAction => 'Rotița mouse-ului';

  @override
  String get settingsScrollWheelActionDescription =>
      'Alege ce se întâmplă când derulezi cu rotița mouse-ului peste videoclip în timpul redării.';

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
  String get cropBlackBars => 'Decupează barele negre';

  @override
  String get settingsCropBlackBarsDescription =>
      'Detectează barele letterbox încorporate în video, le decupează, apoi umple ecranul.';

  @override
  String get cropBlackBarsRecropInterval => 'Recrop interval';

  @override
  String get cropBlackBarsOnce => 'Once at start';

  @override
  String get cropBlackBarsEverySecond => 'Every second';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Follow aspect ratio changes during playback.';

  @override
  String get playerRecroppingBlackBars => 'Recropping black bars';

  @override
  String get stretch => 'Întinde';

  @override
  String get refreshRateSwitching => 'Schimbarea ratei de reîmprospătare';

  @override
  String get disabled => 'Dezactivat';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Detectare automată';

  @override
  String get scaleOnTv => 'Scalare pe televizor';

  @override
  String get scaleOnDevice => 'Scalare pe dispozitiv';

  @override
  String get trickPlay => 'Trick Play';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Afișează miniaturi de previzualizare la derulare';

  @override
  String get trickplayDisplayStyleSingle => 'Miniatură unică';

  @override
  String get trickplayDisplayStyleStrip => 'Bandă de cadre';

  @override
  String get trickplayModeFull => 'Ecran complet';

  @override
  String get trickplaySettingsPreviewHint =>
      'Trage cursorul pentru a previzualiza derularea';

  @override
  String get trickplayPreviewScale => 'Dimensiunea previzualizării';

  @override
  String get trickplayVerticalOffset => 'Distanța față de bara de derulare';

  @override
  String get trickplayFollowScrubPosition => 'Urmărește poziția de derulare';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Previzualizarea alunecă de-a lungul barei de derulare în timp ce derulezi, în loc să rămână centrată';

  @override
  String get trickplayPauseWhileScrubbing => 'Pauză în timpul derulării';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Redarea se oprește cât derulezi și se reia când apeși redare. Dezactivează pentru a continua redarea și a sări direct la noul punct';

  @override
  String get showDescriptionOnPause => 'Afișează descrierea la pauză';

  @override
  String get dimVideoShowOverview =>
      'Întunecă videoclipul și afișează descrierea pe durata pauzei';

  @override
  String get showChapterMarkers => 'Marcaje de capitol';

  @override
  String get showChapterMarkersDescription =>
      'Marchează pe bara de derulare unde începe fiecare capitol';

  @override
  String get osdLockButton => 'Buton de blocare OSD';

  @override
  String get osdLockButtonDescription =>
      'Afișează un buton de blocare care blochează intrarea tactilă până la apăsare lungă';

  @override
  String get playerSwipeGestures => 'Glisări pentru volum și luminozitate';

  @override
  String get playerSwipeGesturesDescription =>
      'Glisează în sus sau în jos pe player pentru a schimba luminozitatea în stânga și volumul în dreapta';

  @override
  String get osdButtons => 'Butoanele playerului';

  @override
  String get osdButtonsDescription => 'Alege ce butoane afișează playerul';

  @override
  String get osdButtonsSectionDescription =>
      'Comenzile de redare sunt afișate întotdeauna. Tot ce urmează depinde de tine, iar fiecare tip de dispozitiv își păstrează propria listă.';

  @override
  String get detailButtons => 'Butoane de acțiune';

  @override
  String get detailButtonsDescription =>
      'Alege ce butoane afișează ecranul de detalii';

  @override
  String get detailButtonsSectionDescription =>
      'Butonul Redare este întotdeauna primul, iar butoanele blocate sunt afișate întotdeauna. Restul depinde de tine, iar fiecare tip de dispozitiv își păstrează propria listă.';

  @override
  String get actionButtonsOnScreen => 'Butoane de acțiune pe ecran';

  @override
  String get actionButtonsOnScreenDescription =>
      'Personalizează câte butoane de acțiune apar înainte de a fi grupate în meniul Mai multe acțiuni.';

  @override
  String get actionButtonsOnScreenAuto => 'Automat (implicit temei)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (doar redare)';

  @override
  String get actionButtonsOnScreenAll => 'Toate (derulare orizontală)';

  @override
  String get detailMetadata => 'Rândul de metadate';

  @override
  String get detailMetadataDescription =>
      'Alege și reordonează metadatele afișate pe ecranul de detalii';

  @override
  String get detailMetadataSectionDescription =>
      'Activează sau dezactivează elementele de metadate și stabilește ordinea în care apar pe ecranul de detalii. Fiecare tip de dispozitiv își păstrează propria listă.';

  @override
  String get detailMetadataYear => 'Anul lansării';

  @override
  String get detailMetadataParentalRating => 'Evaluare parentală';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Durată și sezoane';

  @override
  String get detailMetadataStatus => 'Starea serialului';

  @override
  String get detailMetadataStatusSubtitle =>
      'Arată dacă serialul continuă, s-a încheiat sau revine';

  @override
  String get detailMetadataGenres => 'Genuri';

  @override
  String get detailMetadataSeerrAvailability => 'Disponibilitate Seerr';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Arată starea cererii și a disponibilității media din Seerr';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Episoade viitoare';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Folosește Sonarr și TMDB pentru a arăta datele viitoarelor lansări';

  @override
  String get detailSections => 'Sections';

  @override
  String get detailSectionsDescription =>
      'Choose which parts of the Details screen to show';

  @override
  String get detailSectionsScreenDescription =>
      'Only the sections the current Details screen style can show are listed. Hiding one hides it in every style that has it.';

  @override
  String get detailSectionGroupHeader => 'Header';

  @override
  String get detailSectionGroupSections => 'Sections';

  @override
  String get detailSectionGroupPerson => 'Person pages';

  @override
  String get detailSectionGroupCollection => 'Collection pages';

  @override
  String get detailSectionGroupOther => 'Other';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle => 'Shows the title as text when off';

  @override
  String get detailSectionTagline => 'Tagline';

  @override
  String get detailSectionPoster => 'Poster';

  @override
  String get detailSectionVersionBadge => 'Version badge';

  @override
  String get detailSectionUpNext => 'Next Up';

  @override
  String get detailSectionLyrics => 'Lyrics';

  @override
  String get detailSectionCast => 'Cast';

  @override
  String get detailSectionCastSubtitle => 'Also on collection pages';

  @override
  String get detailSectionCrew => 'Directors & writers';

  @override
  String get detailSectionStudios => 'Studios';

  @override
  String get detailSectionChapters => 'Chapters';

  @override
  String get detailSectionExtras => 'Extras';

  @override
  String get detailSectionCollections => 'Collections';

  @override
  String get detailSectionMoreLikeThis => 'More Like This';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Also similar albums and artists';

  @override
  String get detailSectionMoreEpisodes => 'More episodes';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'On episode pages';

  @override
  String get detailSectionMediaInfo => 'Media info';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'File, streams and Direct Play check';

  @override
  String get detailSectionSeerrGenresTags => 'Genres & tags';

  @override
  String get detailSectionSeerrStats => 'Stats';

  @override
  String get detailSectionSeerrRecommendations => 'Recommendations';

  @override
  String get detailSectionSeerrSimilar => 'Similar titles';

  @override
  String get detailSectionSeerrCollection => 'Collection banner';

  @override
  String get detailSectionSeerrPersonAppearances => 'Appearances';

  @override
  String get detailSectionSeerrPersonCrew => 'Crew credits';

  @override
  String get detailSectionPersonPagesSubtitle => 'On person pages';

  @override
  String get detailSectionBiography => 'Biography';

  @override
  String get detailSectionBirthplace => 'Birthplace';

  @override
  String get detailSectionGuestAppearances => 'Guest appearances';

  @override
  String get detailSectionMusicVideos => 'Music videos';

  @override
  String get detailSectionPlaylistOrder => 'Playlist order';

  @override
  String get detailSectionBookGenres => 'Book genres';

  @override
  String get detailSectionPhotoExif => 'Photo details';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Următorul: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Astăzi';

  @override
  String get upcomingEpisodeTomorrow => 'Mâine';

  @override
  String get moveUp => 'Mută în sus';

  @override
  String get moveDown => 'Mută în jos';

  @override
  String get buttonOrderHint =>
      'Folosește săgețile pentru a schimba ordinea. Pe telecomandă, stânga și dreapta mută butonul evidențiat. Dezactivarea unui buton îl mută sub celelalte.';

  @override
  String get orientationLock => 'Blocare orientare';

  @override
  String get fullscreen => 'Ecran complet';

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
      'Transcodare (rată de biți sau rezoluție)';

  @override
  String get transcodingVideoAndAudio => 'Transcodare (video și audio)';

  @override
  String get transcodingVideo => 'Transcodare (Video)';

  @override
  String get autoServerDefault => 'Auto (implicit server)';

  @override
  String get english => 'Engleză';

  @override
  String get spanish => 'Spaniolă';

  @override
  String get french => 'Franceză';

  @override
  String get german => 'Germană';

  @override
  String get italian => 'Italiană';

  @override
  String get portuguese => 'Portugheză';

  @override
  String get japanese => 'Japoneză';

  @override
  String get korean => 'Coreeană';

  @override
  String get chinese => 'Chineză';

  @override
  String get russian => 'Rusă';

  @override
  String get arabic => 'Arabă';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'Olandeză';

  @override
  String get swedish => 'Suedeză';

  @override
  String get norwegian => 'Norvegiană';

  @override
  String get danish => 'Daneză';

  @override
  String get finnish => 'Finlandeză';

  @override
  String get polish => 'Poloneză';

  @override
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'Suport TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Transmite audio DTS în flux de biți doar către AVR; necesită suport din partea receiverului și o piesă sursă DTS';

  @override
  String get settingsAudioFallbackCodec => 'Codec audio de rezervă';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Selectează formatul țintă pentru transcodarea sunetului multicanal când fluxul sursă nu poate fi redat direct sau transmis direct (passthrough).';

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
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Doar stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Eficient)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Fără pierderi)';

  @override
  String get settingsMaxAudioChannels => 'Număr maxim de canale audio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configurează numărul maxim de canale al sistemului tău audio. Fluxurile multicanal care depășesc această limită vor fi reduse (downmix) sau transcodate.';

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
  String get settingsAudioPassthroughAdvanced =>
      'Transmitere directă (avansat)';

  @override
  String get settingsAudioCodecPassthrough =>
      'Transmitere directă a codecurilor';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Activează doar formatele acceptate de AVR sau de ieșirea HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 Passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA Passthrough';

  @override
  String get settingsAudioPassthroughMode => 'Transmitere directă audio';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'Modul în care sunetul surround comprimat ajunge la televizor sau la receiver.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Dezactivat (decodare mereu pe acest dispozitiv)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Automat (în funcție de suportul detectat al dispozitivului)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Manual (alege formatele de mai jos)';

  @override
  String get settingsAudioPassthroughOutput => 'Ieșire cu transmitere directă';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'Cine împachetează fluxurile de biți pentru legătura HDMI. Încearcă împachetatorul aplicației dacă transmiterea directă nu are sunet sau este defectuoasă pe acest dispozitiv.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Automat, împachetator de sistem (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec =>
      'Împachetator al aplicației (AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'Aplicație (IEC)';

  @override
  String get settingsDownmixToStereoDescription =>
      'Mixează tot sunetul decodat în două canale.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Transmite în flux de biți E-AC-3, inclusiv Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'Transmite în flux de biți DTS-HD, inclusiv DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Transmite în flux de biți TrueHD, inclusiv Dolby Atmos.';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Capabilități audio detectate';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Încă nu este disponibil un instantaneu al capabilităților la rulare.';

  @override
  String get settingsAudioRouteLabel => 'Traseu';

  @override
  String get settingsAudioDecodeLabel => 'Decodare';

  @override
  String get settingsAudioPassthroughLabel => 'Transmitere directă audio';

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
    return '$count can. PCM';
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
      'Transmitere directă audio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Traseu audio activ';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Suport audio HD prin traseu';

  @override
  String get nightMode => 'Mod noapte';

  @override
  String get compressDynamicRange => 'Comprimă gama dinamică';

  @override
  String get advancedMpv => 'mpv avansat';

  @override
  String get enableCustomMpvConf => 'Activează mpv.conf personalizat';

  @override
  String get applyMpvConfBeforePlayback =>
      'Aplică un mpv.conf specificat de utilizator înainte de începerea redării';

  @override
  String get unsafeAdvancedMpvOptions => 'Opțiuni avansate mpv nesigure';

  @override
  String get unsafeMpvOptionsDescription =>
      'Permite un set mai larg de opțiuni mpv. Poate afecta redarea.';

  @override
  String get hardwareDecoding => 'Decodare hardware';

  @override
  String get hardwareDecodingSubtitle =>
      'Poate îmbunătăți performanța, dar poate cauza probleme de redare pe unele dispozitive.';

  @override
  String get nextUpAndQueuing => 'Următorul episod și coada';

  @override
  String get nextUpDisplay => 'Afișare „Urmează”';

  @override
  String get extended => 'Extins';

  @override
  String get minimal => 'Minim';

  @override
  String get nextUpTimeout => 'Expirarea pentru „Urmează”';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Coada media';

  @override
  String get autoQueueNextEpisodes =>
      'Pune automat în coadă episoadele următoare';

  @override
  String get stillWatchingPrompt => 'Solicitarea „Încă vizionezi?”';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'După $episodes episoade / $hours h';
  }

  @override
  String get resumeAndSkip => 'Reluare și omitere';

  @override
  String get resumeRewind => 'Derulare înapoi la reluare';

  @override
  String get unpauseRewind => 'Derulare înapoi după pauză';

  @override
  String get fiveSeconds => '5 secunde';

  @override
  String get tenSeconds => '10 secunde';

  @override
  String get fifteenSeconds => '15 secunde';

  @override
  String get thirtySeconds => '30 de secunde';

  @override
  String get skipBackLength => 'Durata săriturii înapoi';

  @override
  String get skipForwardLength => 'Durata săriturii înainte';

  @override
  String get customMpvConfPath => 'Calea personalizată mpv.conf';

  @override
  String get notSetMpvConf =>
      'Nesetat. Moonfin va încerca un mpv.conf implicit în folderele aplicației/datelor.';

  @override
  String get selectMpvConf => 'Selectează mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Setările de stil (dimensiune, culoare, decalaj) se aplică subtitrărilor bazate pe text (SRT, VTT, TTML). Subtitrările ASS/SSA folosesc propriul stil încorporat, cu excepția cazului în care „Redare directă ASS/SSA” este dezactivată. Subtitrările bitmap (PGS, DVB, VobSub) nu pot fi restilizate.';

  @override
  String get defaultSubtitleLanguage => 'Limba implicită a subtitrărilor';

  @override
  String get defaultToNoSubtitles => 'Implicit fără subtitrări';

  @override
  String get turnOffSubtitlesByDefault =>
      'Dezactivează subtitrările în mod implicit';

  @override
  String get subtitleSize => 'Dimensiunea subtitrărilor';

  @override
  String get textFillColor => 'Culoarea de umplere a textului';

  @override
  String get backgroundColor => 'Culoarea fundalului';

  @override
  String get textStrokeColor => 'Culoarea conturului textului';

  @override
  String get subtitleCustomization => 'Personalizarea subtitrărilor';

  @override
  String get subtitleCustomizationDescription =>
      'Personalizează aspectul subtitrărilor';

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
  String get verticalOffset => 'Decalaj vertical';

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
  String get red => 'Roșu';

  @override
  String get transparent => 'Transparent';

  @override
  String get semiTransparentBlack => 'Negru semitransparent';

  @override
  String get semiTransparentWhite => 'Alb semitransparent';

  @override
  String get lightGray => 'Gri deschis';

  @override
  String get darkGray => 'Gri închis';

  @override
  String get blue => 'Albastru';

  @override
  String get magenta => 'Magenta';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Mobil';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Au fost încărcate setările profilului $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nu s-au putut încărca setările profilului $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Setările locale au fost sincronizate cu profilul $profile.';
  }

  @override
  String get customizationProfile => 'Profil de personalizare';

  @override
  String get customizationProfileDescription =>
      'Alege profilul de încărcat, editat și sincronizat. Global se aplică peste tot, cu excepția cazului în care un profil de dispozitiv îl înlocuiește. Punctul verde marchează profilul actual al dispozitivului.';

  @override
  String get loadProfile => 'Încarcă profilul';

  @override
  String get syncing => 'Se sincronizează...';

  @override
  String get syncToProfile => 'Sincronizează profilul';

  @override
  String get resetProfile => 'Resetează profilul';

  @override
  String resetProfileTitle(String profile) {
    return 'Resetezi $profile?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Aceasta șterge profilul $profile de pe server și readuce toate setările sincronizate de pe acest dispozitiv la valorile implicite.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Aceasta șterge toate profilurile salvate de pe server și readuce toate setările sincronizate de pe acest dispozitiv la valorile implicite.';

  @override
  String profileReset(String profile) {
    return 'Profilul $profile a fost resetat la valorile implicite.';
  }

  @override
  String get resetRatingsTitle => 'Resetezi evaluările?';

  @override
  String get resetRatingsDescription =>
      'Aceasta readuce toate setările evaluărilor la valorile implicite, inclusiv sursele afișate și ordinea în care apar.';

  @override
  String get ratingsReset =>
      'Evaluările au fost resetate la valorile implicite.';

  @override
  String failedToResetProfile(String profile) {
    return 'Resetarea profilului $profile a eșuat.';
  }

  @override
  String get profileSyncHidden => 'Sincronizarea profilului este ascunsă';

  @override
  String get enablePluginSyncDescription =>
      'Activează Sincronizarea pluginului de server în setările pluginului pentru a afișa aici comenzile profilului.';

  @override
  String get quality => 'Calitate';

  @override
  String get defaultDownloadQuality => 'Calitatea implicită a descărcării';

  @override
  String get network => 'Rețea';

  @override
  String get wifiOnlyDownloads => 'Descărcări doar prin WiFi';

  @override
  String get tvOfflineDownloads => 'Activează descărcările offline';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Arată acțiunile de descărcare în paginile elementelor';

  @override
  String get reportDownloadsActivity => 'Afișează descărcările pe server';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Permite administratorului serverului să vadă descărcările tale transcodate în panoul de control';

  @override
  String get onlyDownloadOnWifi => 'Descarcă doar când ești conectat la WiFi';

  @override
  String get storage => 'Stocare';

  @override
  String get storageUsed => 'Stocare utilizată';

  @override
  String get manage => 'Gestionează';

  @override
  String get calculating => 'Se calculează...';

  @override
  String get downloadLocation => 'Locația descărcării';

  @override
  String get defaultLabel => 'Implicit';

  @override
  String get sdCard => 'Card SD';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android permite aplicației Moonfin să scrie doar în folderele proprii, iar acest dispozitiv nu are stocare detașabilă. Activează mai sus „Salvează în folderul Descărcări” pentru a păstra descărcările într-un loc accesibil și altor aplicații.';

  @override
  String get saveToDownloadsFolder => 'Salvează în folderul Descărcări';

  @override
  String get downloadsVisibleToOtherApps =>
      'Descărcări/Moonfin — vizibil pentru alte aplicații';

  @override
  String get dangerZone => 'Zonă periculoasă';

  @override
  String get clearAllDownloads => 'Șterge toate descărcările';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Schimbă locația descărcărilor';

  @override
  String get changeDownloadLocationDescription =>
      'Descărcările noi vor fi salvate în folderul selectat. Descărcările existente rămân în locația lor actuală și pot fi gestionate din setările de stocare.';

  @override
  String get confirm => 'Confirmă';

  @override
  String get cannotWriteToFolder =>
      'Nu se poate scrie în folderul selectat. Alege altă locație sau acordă permisiuni de stocare.';

  @override
  String get saveToDownloadsFolderQuestion => 'Salvezi în folderul Descărcări?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Fișierele media descărcate vor fi salvate în Descărcări/Moonfin pe dispozitivul tău. Aceste fișiere vor fi vizibile pentru alte aplicații, precum galeria sau playerul muzical.\n\nDescărcările existente rămân în locația lor actuală.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcodare: timpul rămas nu este disponibil';

  @override
  String get enable => 'Activează';

  @override
  String get clearAllDownloadsWarning =>
      'Aceasta va șterge toate fișierele media descărcate și nu poate fi anulată.';

  @override
  String get clearAll => 'Șterge tot';

  @override
  String get navigationStyle => 'Stilul de navigare';

  @override
  String get topBar => 'Bara de sus';

  @override
  String get leftSidebar => 'Bara laterală din stânga';

  @override
  String get showShuffleButton => 'Afișează butonul Amestecare';

  @override
  String get showGenresButton => 'Afișează butonul Genuri';

  @override
  String get showFavoritesButton => 'Afișează butonul Favorite';

  @override
  String get showLiveTvButton => 'Arată butonul Live TV';

  @override
  String get showDownloadsButton => 'Arată butonul Descărcări';

  @override
  String get showLibrariesInToolbar =>
      'Afișează bibliotecile în bara de instrumente';

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
  String get navy => 'Bleumarin';

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
  String get libraryDisplay => 'Afișarea bibliotecii';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Miniatură';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings => 'Ignoră setările per bibliotecă';

  @override
  String get applyImageTypeToAllLibraries =>
      'Aplică tipul de imagine tuturor bibliotecilor';

  @override
  String get multiServerLibraries => 'Biblioteci de pe mai multe servere';

  @override
  String get showLibrariesFromAllServers =>
      'Afișează bibliotecile de pe toate serverele conectate';

  @override
  String get mergeRecentRowsByType => 'Îmbină rândurile recente după tip';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Combină bibliotecile separate de același tip în rândurile „Adăugate recent” și „Lansate recent” de pe ecranul principal.';

  @override
  String get libraryView => 'Vizualizarea bibliotecii';

  @override
  String get enableFolderView => 'Activează vizualizarea pe foldere';

  @override
  String get showFolderBrowsingOption =>
      'Afișează opțiunea de navigare pe foldere';

  @override
  String get groupItemsIntoCollections => 'Grupează elementele în colecții';

  @override
  String get hideCollectionAssociatedItems =>
      'Ascunde elementele bibliotecii asociate colecțiilor la navigarea prin biblioteci';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Notă privind gruparea bibliotecii';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Pentru a folosi această setare, asigură-te că setările de bibliotecă „Grupează filmele în colecții” și/sau „Grupează serialele în colecții” sunt activate în setările de afișare ale bibliotecii de pe serverul tău Jellyfin sau Emby.';

  @override
  String get libraryVisibility => 'Vizibilitatea bibliotecilor';

  @override
  String get libraryVisibilityDescription =>
      'Comută vizibilitatea pe ecranul principal pentru fiecare bibliotecă. Repornește Moonfin pentru ca modificările să aibă efect.';

  @override
  String get showInNavigation => 'Afișează în navigare';

  @override
  String get showInLatestMedia =>
      'Afișează în conținutul adăugat/lansat recent';

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
  String get sourceLibraries => 'Biblioteci sursă';

  @override
  String get sourceCollections => 'Colecții sursă';

  @override
  String get excludedGenres => 'Genuri excluse';

  @override
  String get selectAll => 'Selectează tot';

  @override
  String itemsSelected(int count) {
    return 'Selectate: $count';
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
      'Configurează previzualizările pentru trailere, media și audio.';

  @override
  String get mediaBarMode => 'Stilul barei media';

  @override
  String get mediaBarModeDescription =>
      'Alege între diverse stiluri de bară media sau dezactiveaz-o';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Oprit';

  @override
  String get mediaBarModeBookshelf => 'Raft de cărți';

  @override
  String get mediaBarModeGallery => 'Galerie';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Activează bara media';

  @override
  String get showFeaturedContentSlideshow =>
      'Afișează pe ecranul principal un slideshow cu conținut recomandat';

  @override
  String get contentType => 'Tip de conținut';

  @override
  String get mediaBarSourceType => 'Sursă';

  @override
  String get mediaBarSourceRandom => 'Aleatoriu';

  @override
  String get moviesAndTvShows => 'Filme și seriale TV';

  @override
  String get moviesOnly => 'Doar filme';

  @override
  String get tvShowsOnly => 'Doar seriale TV';

  @override
  String get itemCount => 'Număr de elemente';

  @override
  String get noneSelected => 'Nimic selectat';

  @override
  String get noneExcluded => 'Nimic exclus';

  @override
  String get autoAdvance => 'Avansare automată';

  @override
  String get autoAdvanceSlides => 'Avansează automat la următorul diapozitiv';

  @override
  String get autoAdvanceInterval => 'Intervalul de avansare automată';

  @override
  String get trailerPreview => 'Previzualizare trailer';

  @override
  String get autoPlayTrailers =>
      'Redă automat trailerele în bara media după 3 secunde';

  @override
  String get trailerAudio => 'Sunet trailer';

  @override
  String get enableTrailerAudio =>
      'Activează sunetul pentru trailerele din bara media';

  @override
  String get trailerCaptions => 'Subtitrări pentru trailere';

  @override
  String get trailerCaptionsDescription =>
      'Afișează subtitrările pentru trailerele YouTube din bara media';

  @override
  String get episodePreview => 'Previzualizarea episodului';

  @override
  String get mediaPreview => 'Previzualizare media';

  @override
  String get episodePreviewDescription =>
      'Redă o previzualizare inline de 30 de secunde pe cardurile focalizate, cu cursorul deasupra sau apăsate lung';

  @override
  String get mediaPreviewDescription =>
      'Redă o previzualizare inline de 30 de secunde pe cardurile focalizate, cu cursorul deasupra sau apăsate lung';

  @override
  String get previewAudio => 'Previzualizare audio';

  @override
  String get enablePreviewAudio =>
      'Activează sunetul pentru previzualizările media';

  @override
  String get latestMedia => 'Conținut media adăugat recent';

  @override
  String get recentlyReleased => 'Lansate recent';

  @override
  String get recentlyReleasedSeriesType =>
      'Sortarea serialelor lansate recent după';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sortează rândurile Seriale lansate recent de pe ecranul principal după serial, ultimul sezon sau data difuzării ultimului episod';

  @override
  String get myMedia => 'Media mea';

  @override
  String get myMediaSmall => 'Media mea (mică)';

  @override
  String get continueWatching => 'Continuă vizionarea';

  @override
  String get resumeAudio => 'Reia audio';

  @override
  String get resumeBooks => 'Reia cărțile';

  @override
  String get activeRecordings => 'Înregistrări active';

  @override
  String get playlists => 'Liste de redare';

  @override
  String get liveTV => 'Live TV';

  @override
  String get favoriteChannels => 'Canale favorite';

  @override
  String get homeSections => 'Secțiunile ecranului principal';

  @override
  String get resetToDefaults => 'Resetează la valorile implicite';

  @override
  String get homeRowPosterSize =>
      'Dimensiunea posterelor din rândurile ecranului principal';

  @override
  String get perRowImageTypeSelection =>
      'Selectarea tipului de imagine pe rând';

  @override
  String get configureImageTypeForEachRow =>
      'Configurează tipul de imagine pentru fiecare rând activat din ecranul principal';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Îmbină Continuă vizionarea și Următorul episod';

  @override
  String get combineBothRows =>
      'Combină ambele rânduri într-o singură secțiune a ecranului principal';

  @override
  String get nextUpMaxDays => 'Numărul maxim de zile în „Urmează”';

  @override
  String get nextUpMaxDaysDescription =>
      'Cât timp rămâne un serial în „Urmează” după ultima vizionare';

  @override
  String daysValue(int days) {
    return '$days zile';
  }

  @override
  String get fullScreenRows => 'Rânduri extinse pe ecranul principal';

  @override
  String get fullScreenRowsDescription =>
      'Limitează ecranul principal la un singur rând';

  @override
  String get homeRowsPadding => 'Spațierea rândurilor de pe ecranul principal';

  @override
  String get homeRowsPaddingDescription =>
      'Personalizează spațierea dintre rândurile din ecranul principal';

  @override
  String get perRowImageType => 'Tip de imagine pe rând';

  @override
  String get perRowSettings => 'Setări pe rând';

  @override
  String get autoLogin => 'Autentificare automată';

  @override
  String get lastUser => 'Ultimul utilizator';

  @override
  String get currentUser => 'Utilizator curent';

  @override
  String get alwaysAuthenticate => 'Autentifică-te întotdeauna';

  @override
  String get requirePasswordWithToken => 'Cere parola chiar și cu token stocat';

  @override
  String get confirmExit => 'Confirmă ieșirea';

  @override
  String get showConfirmationBeforeExiting =>
      'Afișează confirmare înainte de ieșire';

  @override
  String get blockContentWithRatings =>
      'Blochează conținutul cu următoarele evaluări:';

  @override
  String get noContentRatingsFound =>
      'Încă nu s-au găsit evaluări de conținut pe acest server.';

  @override
  String get couldNotLoadServerRatings =>
      'Nu s-au putut încărca evaluările serverului. Se afișează numai evaluările salvate.';

  @override
  String get couldNotRefreshRatings =>
      'Nu s-au putut reîmprospăta evaluările de pe server. Se afișează evaluările salvate.';

  @override
  String get enablePinCode => 'Activează codul PIN';

  @override
  String get requirePinToAccess => 'Cere un PIN pentru accesarea contului';

  @override
  String get changePin => 'Schimbă codul PIN';

  @override
  String get setNewPinCode => 'Setează un cod PIN nou';

  @override
  String get removePin => 'Elimină codul PIN';

  @override
  String get removePinProtection => 'Elimină protecția prin cod PIN';

  @override
  String get screensaver => 'Screensaver';

  @override
  String get inAppScreensaver => 'Screensaver în aplicație';

  @override
  String get enableBuiltInScreensaver => 'Activează screensaverul încorporat';

  @override
  String get mode => 'Mod';

  @override
  String get libraryArt => 'Grafică bibliotecă';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Ceas';

  @override
  String get timeout => 'Timp expirat';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Nivel de estompare';

  @override
  String get maxAgeRating => 'Evaluare maximă de vârstă';

  @override
  String get any => 'Oricare';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Necesită evaluarea de vârstă';

  @override
  String get onlyShowRatedContent => 'Afișează doar conținutul evaluat';

  @override
  String get showClock => 'Afișează ceasul';

  @override
  String get displayClockDuringScreensaver =>
      'Afișează ceasul în timpul screensaverului';

  @override
  String get clockModeStatic => 'Static';

  @override
  String get clockModeBouncing => 'Săltăreț';

  @override
  String get screensaverGeneralSettings => 'Setări generale';

  @override
  String get screensaverVisualComponents => 'Componente vizuale';

  @override
  String get screensaverLibraryContent => 'Conținutul bibliotecii';

  @override
  String get screensaverBackdrop => 'Imagine de fundal';

  @override
  String get screensaverBackdropBlack => 'Negru';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => 'Calm';

  @override
  String get screensaverBackdropNeonPulse => 'Puls neon';

  @override
  String get screensaverBackdropAurora => 'Aurora';

  @override
  String get screensaverAdditionalComponent => 'Componentă suplimentară';

  @override
  String get screensaverComponentMoonfinLogo => 'Sigla Moonfin';

  @override
  String get screensaverComponentRunner => 'Alergător';

  @override
  String get screensaverComponentMovement => 'Mișcarea componentei';

  @override
  String get screensaverComponentPosition => 'Poziția componentei';

  @override
  String get screensaverComponentSize => 'Dimensiunea componentei';

  @override
  String get screensaverSourceLibrariesDefault => 'Toate (implicit)';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (critici)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (public)';

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
  String get showMdbListAndTmdbRatings => 'Afișează evaluările MDBList și TMDB';

  @override
  String get ratingLabels => 'Etichete de evaluare';

  @override
  String get showLabelsNextToIcons =>
      'Afișează etichete lângă pictogramele de evaluare';

  @override
  String get ratingBadges => 'Insigne de evaluare';

  @override
  String get showDecorativeBadges =>
      'Afișează insigne decorative în spatele evaluărilor';

  @override
  String get episodeRatings => 'Evaluări ale episoadelor';

  @override
  String get showRatingsOnEpisodes =>
      'Afișează evaluări pentru episoadele individuale';

  @override
  String get ratingSources => 'Surse de evaluare';

  @override
  String get ratingSourcesDescription =>
      'Activează și reordonează sursele de evaluare afișate în aplicație';

  @override
  String get pluginLabel => 'Plugin Moonbase';

  @override
  String get pluginDetected => 'Plugin detectat';

  @override
  String get pluginNotDetected => 'Pluginul nu a fost detectat';

  @override
  String get pluginDetectedDescription =>
      'Pluginul de server a fost detectat. Sincronizarea se activează automat prima dată când pluginul este găsit.';

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
      'Sincronizează setările cu pluginul serverului';

  @override
  String get whatSyncControls => 'Ce controlează sincronizarea';

  @override
  String get syncControlsDescription =>
      'Sincronizarea controlează doar dacă setările pluginului sunt trimise către server și preluate de pe acesta. Selectarea profilului și acțiunile de sincronizare a profilului se află în setările de Personalizare, când sincronizarea pluginului este activată.';

  @override
  String get recentRequests => 'Cereri recente';

  @override
  String get recentlyAdded => 'Adăugate recent';

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
  String get popularSeries => 'Seriale populare';

  @override
  String get seriesGenres => 'Genuri de seriale';

  @override
  String get upcomingSeries => 'Seriale viitoare';

  @override
  String get networks => 'Rețele';

  @override
  String get tags => 'Etichete';

  @override
  String get genresAndTags => 'Genuri și etichete';

  @override
  String get seerrDiscoveryRows => 'Rânduri de descoperire Seerr';

  @override
  String get yourWatchlist => 'Lista ta de vizionare';

  @override
  String get resetRowsToDefaults => 'Resetează rândurile la valorile implicite';

  @override
  String get enableSeerr => 'Activează Seerr';

  @override
  String get showSeerrInNavigation =>
      'Arată Seerr în navigare (necesită pluginul de server)';

  @override
  String get seerrUnavailable =>
      'Indisponibil deoarece suportul Seerr al pluginului de server este dezactivat.';

  @override
  String get nsfwFilter => 'Filtru NSFW';

  @override
  String get hideAdultContent =>
      'Ascunde conținutul pentru adulți din rezultate';

  @override
  String get showMissingCollectionItems =>
      'Arată elementele lipsă din colecții';

  @override
  String get showMissingCollectionItemsDesc =>
      'Include elementele lipsă în paginile de colecții';

  @override
  String get showSeerrAvailabilityBadges =>
      'Arată insignele de disponibilitate Seerr';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Arată insignele de disponibilitate a sezoanelor în paginile de detalii media';

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
      'Aprobate, refuzate și adăugate în biblioteca ta';

  @override
  String get seerrNotifyIssuesTitle => 'Actualizări ale problemelor';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Probleme noi, răspunsuri și rezolvări';

  @override
  String get seerrNotifyNewMediaTitle => 'Conținut media nou adăugat';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Orice conținut nou adăugat în biblioteca serverului';

  @override
  String loggedInAs(String username) {
    return 'Autentificat ca: $username';
  }

  @override
  String get discoverRows => 'Pagina de descoperire Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Activează rândurile pe care vrei să le vezi pe pagina principală Seerr. Trage pentru a reordona. Ordinea personalizată se sincronizează cu Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Activează rândurile pe care vrei să le vezi pe pagina principală Seerr. Trage pentru a reordona. Ordinea personalizată se sincronizează cu Moonbase.';

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
  String get openSourceLicenses => 'Licențe open source';

  @override
  String get sourceCode => 'Cod sursă';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Verifică actualizările acum';

  @override
  String get checksLatestDesktopRelease =>
      'Verifică cea mai recentă versiune desktop pentru această platformă';

  @override
  String get youAreUpToDate => 'Ești la zi.';

  @override
  String get couldNotCheckForUpdates =>
      'Nu s-au putut verifica actualizările acum.';

  @override
  String get noCompatibleUpdate =>
      'Nu s-a găsit niciun pachet de actualizare compatibil pentru această platformă.';

  @override
  String get updateChecksNotSupported =>
      'Verificarea actualizărilor nu este acceptată pe această platformă.';

  @override
  String get updateNotificationsDisabled =>
      'Notificările de actualizare sunt dezactivate.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Te rugăm să aștepți înainte de a verifica din nou.';

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
  String get updateNotifications => 'Notificări de actualizare';

  @override
  String get showWhenUpdatesAvailable =>
      'Afișează când sunt disponibile actualizări';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version disponibilă';
  }

  @override
  String get readReleaseNotes => 'Citește notele de lansare';

  @override
  String get downloadingUpdate => 'Se descarcă actualizarea...';

  @override
  String get updateDownloadFailed =>
      'Descărcarea actualizării a eșuat. Încearcă din nou.';

  @override
  String get openReleasesPage => 'Deschide pagina de versiuni';

  @override
  String get navigation => 'Navigare';

  @override
  String get watchedIndicatorsBackdrops =>
      'Indicatori de vizionare, imagini de fundal';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Culoare de focalizare, indicatori de vizionare, imagini de fundal';

  @override
  String get navbarStyleToolbarAppearance =>
      'Stilul barei de navigare, butoane din bara de instrumente, aspect';

  @override
  String get reorderToggleHomeRows =>
      'Reordonează și activează/dezactivează rândurile de pe ecranul principal, atât cele din bibliotecă, cât și cele din surse externe';

  @override
  String get featuredContentAppearance => 'Conținut recomandat, aspect';

  @override
  String get posterSizeImageTypeFolderView =>
      'Dimensiunea posterelor, tipul de imagine, vizualizarea pe foldere';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB și surse de evaluare';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limita cache-ului de imagini';

  @override
  String get clearImageCache => 'Golește cache-ul de imagini';

  @override
  String get imageCacheCleared => 'Cache-ul de imagini a fost golit';

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
  String get seerrDownloading => 'Se descarcă';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Se descarcă · $done / $total';
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
    return 'Se descarcă · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Se importă';

  @override
  String itemsCount(int count) {
    return '$count elemente';
  }

  @override
  String get seerrSettings => 'Setări Seerr';

  @override
  String get requestMore => 'Solicită mai multe';

  @override
  String get requestMore4k => 'Solicită mai multe în 4K';

  @override
  String get request => 'Cerere';

  @override
  String get request4k => 'Solicită 4K';

  @override
  String get requested4k => '4K solicitat';

  @override
  String get cancelRequest => 'Anulează cererea';

  @override
  String get cancelRequest4k => 'Anulează cererea 4K';

  @override
  String get playInMoonfin => 'Redă în Moonfin';

  @override
  String get requestedByLabel => 'Solicitat de';

  @override
  String requestedByName(String name) {
    return 'Solicitat de $name';
  }

  @override
  String get manageRequests => 'Gestionează cererile';

  @override
  String get watchlist => 'Listă de vizionare';

  @override
  String get onWatchlist => 'În lista de vizionare';

  @override
  String get approve => 'Aprobă';

  @override
  String get declineAction => 'Refuză';

  @override
  String get similar => 'Similare';

  @override
  String get recommendations => 'Recomandări';

  @override
  String cancelRequestForTitle(String title) {
    return 'Anulezi cererea pentru „$title”?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Anulezi cele $count cereri pentru „$title”?';
  }

  @override
  String get keep => 'Păstrează';

  @override
  String get itemNotFoundInLibrary =>
      'Elementul nu a fost găsit în biblioteca ta Moonfin';

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
    return 'Solicită $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Solicită 4K $type';
  }

  @override
  String get submitRequest => 'Trimite cererea';

  @override
  String get allSeasons => 'Toate sezoanele';

  @override
  String get seerrSeriesContinuing =>
      'Serial în desfășurare · Sezoanele viitoare pot fi solicitate';

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
  String get crewSection => 'Echipă';

  @override
  String ageValue(int age) {
    return 'vârsta $age';
  }

  @override
  String get noRequests => 'Nicio cerere';

  @override
  String get pendingStatus => 'În așteptare';

  @override
  String get declinedStatus => 'Refuzat';

  @override
  String get partiallyAvailable => 'Disponibil parțial';

  @override
  String get downloadingStatus => 'Se descarcă';

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
  String get processingStatus => 'Se procesează';

  @override
  String modifiedByName(String name) {
    return 'Modificat de $name';
  }

  @override
  String get completedStatus => 'Finalizat';

  @override
  String get requestErrorDuplicate => 'Acest titlu a fost deja solicitat';

  @override
  String get requestErrorQuota => 'Ai atins limita de cereri';

  @override
  String get requestErrorBlocklisted => 'Acest titlu este pe lista de blocare';

  @override
  String get requestErrorNoSeasons => 'Nu mai sunt sezoane de cerut';

  @override
  String get requestErrorPermission =>
      'Nu ai permisiunea de a face această cerere';

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
  String get requestCollection => 'Solicită colecția';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filme · $available disponibile';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Solicită $count filme';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Se solicită $current din $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Au fost solicitate $count filme';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Au fost solicitate $ok din $total filme';
  }

  @override
  String get collectionAllRequested =>
      'Toate filmele sunt deja disponibile sau solicitate';

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
  String get addComment => 'Adaugă un comentariu';

  @override
  String get deleteIssueConfirm => 'Ștergi această problemă?';

  @override
  String get submitReport => 'Trimite raportul';

  @override
  String get tmdbScore => 'Scorul TMDB';

  @override
  String get releaseDateLabel => 'Data de lansare';

  @override
  String get firstAirDateLabel => 'Data primei difuzări';

  @override
  String get revenueLabel => 'Încasări';

  @override
  String get runtimeLabel => 'Durată';

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
  String get address => 'Adresă';

  @override
  String get analytics => 'Analitice';

  @override
  String get catalog => 'Catalog';

  @override
  String get content => 'Conținut';

  @override
  String get copy => 'Copiază';

  @override
  String get create => 'Creează';

  @override
  String get disable => 'Dezactivează';

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
  String get go => 'Mergi';

  @override
  String get install => 'Instalează';

  @override
  String get installed => 'Instalat';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Nume';

  @override
  String get networking => 'Rețea';

  @override
  String get next => 'Următorul';

  @override
  String get path => 'Cale';

  @override
  String get paused => 'Pe pauză';

  @override
  String get permissions => 'Permisiuni';

  @override
  String get processing => 'Se procesează';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Furnizor';

  @override
  String get refresh => 'Reîmprospătează';

  @override
  String get remote => 'La distanță';

  @override
  String get rename => 'Redenumește';

  @override
  String get revoke => 'Revocă';

  @override
  String get role => 'Rol';

  @override
  String get root => 'Rădăcină';

  @override
  String get run => 'Rulează';

  @override
  String get search => 'Caută';

  @override
  String get select => 'Selectează';

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
  String get upload => 'Încarcă';

  @override
  String get unmute => 'Activează sunetul';

  @override
  String get mute => 'Dezactivează sunetul';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Panou de control';

  @override
  String get adminDrawerAnalytics => 'Analitice';

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
  String get adminDrawerResume => 'Reia';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Dispozitive';

  @override
  String get adminDrawerActivity => 'Activitate';

  @override
  String get adminDrawerNetworking => 'Rețea';

  @override
  String get adminDrawerApiKeys => 'Chei API';

  @override
  String get adminDrawerBackups => 'Copii de rezervă';

  @override
  String get adminDrawerLogs => 'Jurnale';

  @override
  String get adminDrawerScheduledTasks => 'Activități programate';

  @override
  String get adminDrawerPlugins => 'Pluginuri';

  @override
  String get adminDrawerRepositories => 'Depozite';

  @override
  String get adminDrawerLiveTv => 'Live TV';

  @override
  String get adminExitTooltip => 'Ieși din Admin';

  @override
  String get adminDashboardLoadFailed =>
      'Nu s-a putut încărca panoul de control';

  @override
  String get adminMediaOverview => 'Prezentare generală a conținutului media';

  @override
  String get adminMediaTotalsError =>
      'Nu s-au putut încărca totalurile media ale serverului.';

  @override
  String get adminMediaOverviewSubtitle =>
      'O privire rapidă asupra cât conținut se află pe acest server.';

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
    return 'Activități programate eșuate: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Intrări recente de avertisment/eroare: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distribuția conținutului media';

  @override
  String get analyticsVideoCodecs => 'Codecuri video';

  @override
  String get analyticsAudioCodecs => 'Codecuri audio';

  @override
  String get analyticsContainers => 'Containere';

  @override
  String get analyticsTopGenres => 'Cele mai frecvente genuri';

  @override
  String get analyticsReleaseYears => 'Anii lansării';

  @override
  String get analyticsContentRatings => 'Evaluări de conținut';

  @override
  String get analyticsRuntimeBuckets => 'Intervale de durată';

  @override
  String get analyticsFileFormats => 'Formate de fișiere';

  @override
  String get analyticsNoData => 'Nu există date disponibile.';

  @override
  String get adminServerInfo => 'Informații despre server';

  @override
  String get adminRestartPending => 'Repornire în așteptare';

  @override
  String get adminServerPaths => 'Căile serverului';

  @override
  String get adminServerActions => 'Acțiuni pentru server';

  @override
  String get adminRestartServer => 'Repornește serverul';

  @override
  String get adminShutdownServer => 'Oprește serverul';

  @override
  String get adminScanLibraries => 'Scanează bibliotecile';

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
      'Repornirea serverului este în curs, repornește Moonfin';

  @override
  String get adminActiveSessions => 'Sesiuni active';

  @override
  String get adminSessionsLoadFailed => 'Nu s-au putut încărca sesiunile';

  @override
  String get adminNoActiveSessions => 'Nicio sesiune activă';

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
  String get adminSetVolume => 'Setează volumul';

  @override
  String get sessionPrev => 'Anterior';

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
  String get nowPlaying => 'Acum se redă';

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
  String get adminDisconnect => 'Deconectează';

  @override
  String get adminClearDates => 'Șterge datele';

  @override
  String get adminActivitySeverityAll => 'Toate nivelurile de gravitate';

  @override
  String get adminActivityDateRange => 'Interval de date';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Nu s-a putut încărca jurnalul de activitate: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nicio intrare de activitate';

  @override
  String get adminEditDeviceName => 'Editează numele dispozitivului';

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
  String get adminDeleteDevice => 'Șterge dispozitivul';

  @override
  String get adminDeviceDeleted => 'Dispozitivul a fost șters';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Nu s-a putut șterge dispozitivul: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Elimini dispozitivul „$name”? Utilizatorul va trebui să se autentifice din nou pe acest dispozitiv.';
  }

  @override
  String get adminDeleteAllDevices => 'Șterge toate dispozitivele';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Elimini $count dispozitive? Utilizatorii afectați vor trebui să se autentifice din nou. Dispozitivul tău curent nu este afectat.';
  }

  @override
  String get adminDevicesDeletedAll => 'Dispozitivele au fost eliminate';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Unele dispozitive au fost eliminate; $count nu au putut fi eliminate.';
  }

  @override
  String get adminDevicesLoadFailed => 'Nu s-au putut încărca dispozitivele';

  @override
  String get adminSearchDevices => 'Caută dispozitive';

  @override
  String get adminThisDevice => 'Acest dispozitiv';

  @override
  String get adminEditName => 'Editează numele';

  @override
  String get adminLibrariesLoadFailed => 'Nu s-au putut încărca bibliotecile';

  @override
  String get adminNoLibraries => 'Nu au fost configurate biblioteci';

  @override
  String get adminScanAllLibraries => 'Scanează toate bibliotecile';

  @override
  String get adminAddLibrary => 'Adaugă o bibliotecă';

  @override
  String adminScanFailed(String error) {
    return 'Nu s-a putut porni scanarea: $error';
  }

  @override
  String get adminRenameLibrary => 'Redenumește biblioteca';

  @override
  String get adminNewName => 'Nume nou';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteca a fost redenumită în „$name”';
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
    return 'Nu s-a putut șterge biblioteca: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Nu s-a putut adăuga calea: $error';
  }

  @override
  String get adminRemovePath => 'Elimină calea';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Elimini „$path” din această bibliotecă?';
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
    return 'Nu s-au putut salva opțiunile: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nu s-a putut încărca biblioteca';

  @override
  String get adminNoMediaPaths => 'Nu au fost configurate căi media';

  @override
  String get adminAddPath => 'Adaugă o cale';

  @override
  String get adminBrowseFilesystem =>
      'Răsfoiește sistemul de fișiere al serverului:';

  @override
  String get adminSaveOptions => 'Salvează opțiunile';

  @override
  String get adminPreferredMetadataLanguage =>
      'Limba preferată pentru metadate';

  @override
  String get adminMetadataLanguageHint => 'de ex. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Codul țării pentru metadate';

  @override
  String get adminMetadataCountryHint => 'de ex. US, DE, FR';

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
      'Durata capitolelor generate pentru conținutul media care nu are capitole. Setează 0 pentru dezactivare.';

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
  String get adminLibNone => 'Niciuna';

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
      'Nu au fost adăugate căi (pot fi adăugate mai târziu)';

  @override
  String get adminCreateLibrary => 'Creează o bibliotecă';

  @override
  String get paths => 'Căi:';

  @override
  String get adminDisableUser => 'Dezactivează utilizatorul';

  @override
  String get adminEnableUser => 'Activează utilizatorul';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Dezactivezi $name? Nu se va mai putea autentifica.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Activezi $name? Se va putea autentifica din nou.';
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
  String get adminUsersLoadFailed => 'Nu s-au putut încărca utilizatorii';

  @override
  String get adminSearchUsers => 'Caută utilizatori';

  @override
  String get adminEditUser => 'Editează utilizatorul';

  @override
  String get adminAddUser => 'Adaugă utilizator';

  @override
  String adminUserCreateFailed(String error) {
    return 'Nu s-a putut crea utilizatorul: $error';
  }

  @override
  String get adminCreateUser => 'Creează utilizator';

  @override
  String get adminPasswordOptional => 'Parolă (opțional)';

  @override
  String get adminUsernameRequired => 'Numele de utilizator nu poate fi gol';

  @override
  String get adminNoProfileChanges =>
      'Nu există modificări de profil de salvat';

  @override
  String get adminProfileSaved => 'Profil salvat';

  @override
  String adminSaveFailed(String error) {
    return 'Salvarea a eșuat: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permisiunile au fost salvate';

  @override
  String get adminPasswordsMismatch => 'Parolele nu se potrivesc';

  @override
  String adminFailed(String error) {
    return 'Eșec: $error';
  }

  @override
  String get adminUserLoadFailed => 'Nu s-a putut încărca utilizatorul';

  @override
  String get adminBackToUsers => 'Înapoi la utilizatori';

  @override
  String get adminSaveProfile => 'Salvează profilul';

  @override
  String get adminDeleteUser => 'Șterge utilizatorul';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Administratorii au acces complet la server. Acordă cu precauție.';

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
  String get adminAllowRemuxing => 'Permite remuxarea';

  @override
  String get adminForceRemoteTranscoding =>
      'Forțează transcodarea sursei la distanță';

  @override
  String get adminAllowContentDeletion => 'Permite ștergerea conținutului';

  @override
  String get adminAllowContentDownloading => 'Permite descărcarea conținutului';

  @override
  String get adminAllowPublicSharing => 'Permite partajarea publică';

  @override
  String get adminAllowRemoteControl =>
      'Permite controlul de la distanță al altor utilizatori';

  @override
  String get adminAllowSharedDeviceControl =>
      'Permite controlul partajat al dispozitivului';

  @override
  String get adminAllowRemoteAccess => 'Permite accesul de la distanță';

  @override
  String get adminRemoteBitrateLimit =>
      'Limita ratei de biți a clientului la distanță (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Lasă gol pentru nicio limită';

  @override
  String get adminMaxActiveSessions => 'Număr maxim de sesiuni active';

  @override
  String get adminAllowLiveTvAccess => 'Permite accesul la TV în direct';

  @override
  String get adminAllowLiveTvManagement => 'Permite gestionarea Live TV';

  @override
  String get adminAllowCollectionManagement =>
      'Permite gestionarea colecțiilor';

  @override
  String get adminAllowSubtitleManagement =>
      'Permite gestionarea subtitrărilor';

  @override
  String get adminAllowLyricManagement => 'Permite gestionarea versurilor';

  @override
  String get adminSavePermissions => 'Salvează permisiunile';

  @override
  String get adminEnableAllLibraryAccess =>
      'Activează accesul la toate bibliotecile';

  @override
  String get adminSaveAccess => 'Salvează accesul';

  @override
  String get adminChangePassword => 'Schimbă parola';

  @override
  String get adminNewPassword => 'Parolă nouă';

  @override
  String get adminConfirmPassword => 'Confirmă parola';

  @override
  String get adminSetPassword => 'Setează parola';

  @override
  String get adminResetPassword => 'Resetează parola';

  @override
  String get adminPasswordReset => 'Parola a fost resetată';

  @override
  String get adminPasswordUpdated => 'Parola a fost actualizată';

  @override
  String get adminUserSettings => 'Setări utilizator';

  @override
  String get adminLibraryAccess => 'Acces la bibliotecă';

  @override
  String get adminDeviceAndChannelAccess => 'Acces la dispozitive și canale';

  @override
  String get adminEnableAllDevices =>
      'Activează accesul la toate dispozitivele';

  @override
  String get adminEnableAllChannels => 'Activează accesul la toate canalele';

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
  String get adminUnratedLiveTvChannel => 'Live TV';

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
      'Se afișează doar conținutul cu aceste etichete. Lasă gol pentru a permite tot conținutul.';

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
      'Setează 0 pentru valoarea implicită sau -1 pentru a dezactiva blocarea.';

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
    return 'Sigur vrei să ștergi $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Utilizatorul „$name” a fost șters';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Nu s-a putut șterge utilizatorul: $error';
  }

  @override
  String get adminCreateApiKey => 'Creează cheie API';

  @override
  String get adminAppName => 'Numele aplicației';

  @override
  String get adminApiKeyCreated => 'Cheia API a fost creată';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Cheia a fost creată cu succes. Serverul nu a returnat tokenul. Verifică cheile API ale serverului.';

  @override
  String get adminKeyCopied => 'Cheia a fost copiată în clipboard';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Nu s-a putut crea cheia: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Tokenul cheii lipsește din răspunsul serverului';

  @override
  String get adminRevokeApiKey => 'Revocă cheia API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoci cheia pentru $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Cheia API a fost revocată';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nu s-a putut revoca cheia: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Nu s-au putut încărca cheile API';

  @override
  String get adminApiKeysTitle => 'Chei API';

  @override
  String get adminCreateKey => 'Creează cheie';

  @override
  String get adminNoApiKeys => 'Nu s-au găsit chei API';

  @override
  String get adminUnknownApp => 'Aplicație necunoscută';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreat: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Creează o copie de rezervă';

  @override
  String get adminBackupInclude => 'Alege ce să incluzi în copia de rezervă.';

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
  String get adminCreatingBackup => 'Se creează copia de rezervă...';

  @override
  String get adminBackupCreated => 'Copia de rezervă a fost creată cu succes';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Nu s-a putut crea copia de rezervă: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Calea copiei de rezervă lipsește din răspunsul serverului';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Nu s-a putut încărca manifestul: $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmă restaurarea';

  @override
  String get adminRestoringBackup => 'Se restaurează copia de rezervă...';

  @override
  String adminRestoreFailed(String error) {
    return 'Nu s-a putut restaura copia de rezervă: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'Nu s-au putut încărca copiile de rezervă';

  @override
  String get adminCreateBackup => 'Creează o copie de rezervă';

  @override
  String get adminNoBackups => 'Nu s-au găsit copii de rezervă';

  @override
  String get adminViewDetails => 'Vezi detaliile';

  @override
  String get restore => 'Restaurează';

  @override
  String get adminLogsLoadFailed =>
      'Nu s-au putut încărca jurnalele serverului';

  @override
  String get adminNoLogFiles => 'Nu s-au găsit fișiere jurnal';

  @override
  String get adminLogCopied => 'Jurnalul a fost copiat în clipboard';

  @override
  String get adminSaveLogFile => 'Salvează fișierul jurnal';

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
  String get adminSearchInLog => 'Caută în jurnal';

  @override
  String get adminNoMatchingLines => 'Nicio linie potrivită';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Nu s-au putut încărca activitățile: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nu s-au găsit activități programate';

  @override
  String get adminNoTasksMatchFilter =>
      'Nicio activitate nu se potrivește cu filtrul curent';

  @override
  String adminTaskStartFailed(String error) {
    return 'Nu s-a putut porni activitatea: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Nu s-a putut opri activitatea: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Nu s-a putut încărca activitatea: $error';
  }

  @override
  String get adminRunNow => 'Rulează acum';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Nu s-a putut elimina declanșatorul: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Nu s-a putut adăuga declanșatorul: $error';
  }

  @override
  String get adminLastExecution => 'Ultima execuție';

  @override
  String get adminTriggers => 'Declanșatoare';

  @override
  String get adminAddTrigger => 'Adaugă declanșator';

  @override
  String get adminNoTriggers => 'Nu au fost configurate declanșatoare';

  @override
  String get adminTriggerType => 'Tipul declanșatorului';

  @override
  String get adminTimeLimit => 'Limită de timp (opțional)';

  @override
  String get adminNoLimit => 'Fără limită';

  @override
  String adminHours(String hours) {
    return '$hours oră/ore';
  }

  @override
  String get adminDayOfWeek => 'Ziua săptămânii';

  @override
  String get adminSearchPlugins => 'Caută pluginuri...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Nu s-a putut comuta starea pluginului: $error';
  }

  @override
  String get adminUninstallPlugin => 'Dezinstalează pluginul';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Sigur vrei să dezinstalezi „$name”?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Nu s-a putut dezinstala pluginul: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Nu s-a putut instala pachetul: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Nu s-a putut instala actualizarea: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Nu s-au putut încărca pluginurile: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Niciun plugin nu corespunde căutării tale';

  @override
  String get adminNoPluginsInstalled => 'Nu există pluginuri instalate';

  @override
  String adminInstallUpdate(String version) {
    return 'Instalează actualizarea (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Nu s-a putut încărca catalogul: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Niciun pachet nu corespunde căutării tale';

  @override
  String get adminNoPackagesAvailable => 'Nu există pachete disponibile';

  @override
  String get adminExperimentalIntegration => 'Integrare experimentală';

  @override
  String get adminExperimentalWarning =>
      'Integrarea setărilor pluginurilor este încă experimentală. Este posibil ca unele pagini de setări să nu se afișeze corect.';

  @override
  String get continueAction => 'Continuă';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '„$name” va fi eliminat după repornirea serverului';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Dezinstalarea a eșuat: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Se actualizează „$name” la v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Nu se pot deschide setările: lipsește tokenul de autentificare.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Nu s-a putut încărca pluginul: $error';
  }

  @override
  String get adminPluginNotFound => 'Pluginul nu a fost găsit';

  @override
  String adminPluginVersion(String version) {
    return 'Versiunea $version';
  }

  @override
  String get adminEnablePlugin => 'Activează pluginul';

  @override
  String get adminPluginSettingsPage => 'Pagina de setări a pluginului';

  @override
  String get adminRevisionHistory => 'Istoricul versiunilor';

  @override
  String get adminNoChangelog => 'Niciun jurnal de modificări disponibil.';

  @override
  String get adminRemoveRepository => 'Elimină depozitul';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Sigur vrei să elimini „$name”?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Nu s-au putut salva depozitele: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Nu s-au putut încărca depozitele: $error';
  }

  @override
  String get adminRepositoryNameHint => 'de ex. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL-ul depozitului';

  @override
  String get adminAddEntry => 'Adaugă intrare';

  @override
  String get adminInvalidUrl => 'URL nevalid';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Nu s-au putut încărca setările pluginului: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nu s-a putut deschide $uri';
  }

  @override
  String get adminOpenInBrowser => 'Deschide în browser';

  @override
  String get adminOpenExternally => 'Deschide extern';

  @override
  String get adminGeneralSettings => 'Setări generale';

  @override
  String get adminServerName => 'Numele serverului';

  @override
  String get adminPreferredMetadataCountry => 'Țara preferată pentru metadate';

  @override
  String get adminCachePath => 'Calea cache-ului';

  @override
  String get adminMetadataPath => 'Calea metadatelor';

  @override
  String get adminLibraryScanConcurrency => 'Concurența scanării bibliotecii';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limita de codificare paralelă a imaginilor';

  @override
  String get adminSlowResponseThreshold => 'Prag de răspuns lent (ms)';

  @override
  String get adminBrandingSaved => 'Setările de branding au fost salvate';

  @override
  String get adminBrandingLoadFailed =>
      'Nu s-au putut încărca setările de branding';

  @override
  String get adminLoginDisclaimer => 'Mesaj de avertizare la autentificare';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML afișat sub formularul de autentificare';

  @override
  String get adminCustomCss => 'CSS personalizat';

  @override
  String get adminCustomCssHint => 'CSS personalizat aplicat interfeței web';

  @override
  String get adminEnableSplashScreen => 'Activează ecranul de întâmpinare';

  @override
  String get adminStreamingSaved => 'Setările de streaming au fost salvate';

  @override
  String get adminStreamingLoadFailed =>
      'Nu s-au putut încărca setările de streaming';

  @override
  String get adminStreamingDescription =>
      'Setează limite globale ale ratei de biți de streaming pentru conexiunile la distanță.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limita ratei de biți a clientului la distanță (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Lasă gol sau 0 pentru nelimitat';

  @override
  String get adminPlaybackSaved => 'Setările de redare au fost salvate';

  @override
  String get adminPlaybackLoadFailed =>
      'Nu s-au putut încărca setările de redare';

  @override
  String get adminPlaybackTranscoding => 'Redare / Transcodare';

  @override
  String get adminHardwareAcceleration => 'Accelerare hardware';

  @override
  String get adminVaapiDevice => 'Dispozitiv VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Activează codificarea hardware';

  @override
  String get adminEnableHardwareDecoding =>
      'Activează decodarea hardware pentru:';

  @override
  String get adminEncodingThreads => 'Fire de codificare';

  @override
  String get adminAutomatic => '0 = automat';

  @override
  String get adminTranscodingTempPath => 'Calea temporară pentru transcodare';

  @override
  String get adminEnableFallbackFont => 'Activează fontul de rezervă';

  @override
  String get adminFallbackFontPath => 'Calea fontului de rezervă';

  @override
  String get adminAllowSegmentDeletion => 'Permite ștergerea segmentelor';

  @override
  String get adminSegmentKeepSeconds => 'Păstrarea segmentelor (secunde)';

  @override
  String get adminThrottleBuffering => 'Limitează tamponarea';

  @override
  String get adminTrickplaySaved => 'Setările Trickplay au fost salvate';

  @override
  String get adminTrickplayLoadFailed =>
      'Nu s-au putut încărca setările trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Activează accelerarea hardware';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Activează extragerea doar a cadrelor cheie';

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
  String get adminCaptureFrameSubtitle => 'Cât de des se capturează cadre';

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
  String get adminProcessThreads => 'Fire de procesare';

  @override
  String get adminResumeSaved => 'Setările de reluare au fost salvate';

  @override
  String get adminResumeLoadFailed =>
      'Nu s-au putut încărca setările de reluare';

  @override
  String get adminResumeDescription =>
      'Configurează când un conținut este marcat ca redat parțial sau redat complet.';

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
  String get adminNetworkingLoadFailed =>
      'Nu s-au putut încărca setările de rețea';

  @override
  String get adminNetworkingWarning =>
      'Modificările la setările de rețea pot necesita repornirea serverului.';

  @override
  String get adminEnableRemoteAccess => 'Activează accesul de la distanță';

  @override
  String get ports => 'Porturi';

  @override
  String get adminHttpPort => 'Port HTTP';

  @override
  String get adminHttpsPort => 'Port HTTPS';

  @override
  String get adminPublicHttpsPort => 'Port HTTPS public';

  @override
  String get adminBaseUrl => 'URL de bază';

  @override
  String get adminBaseUrlHint => 'de ex. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Activează HTTPS';

  @override
  String get adminLocalNetwork => 'Rețea locală';

  @override
  String get adminLocalNetworkAddresses => 'Adresele rețelei locale';

  @override
  String get adminKnownProxies => 'Proxy cunoscuți';

  @override
  String get adminRemoteIpFilter => 'Filtru IP la distanță';

  @override
  String get adminRemoteIpFilterEntries => 'Filtru IP la distanță';

  @override
  String get adminCertificatePath => 'Calea certificatului';

  @override
  String get whitelist => 'Lista albă';

  @override
  String get blacklist => 'Lista neagră';

  @override
  String get notSet => 'Nesetat';

  @override
  String get adminMetadataSaved => 'Metadatele au fost salvate';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Nu s-au putut încărca metadatele: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Nu s-au putut salva metadatele: $error';
  }

  @override
  String get adminRefreshMetadata => 'Reîmprospătează metadatele';

  @override
  String get recursive => 'Recursiv';

  @override
  String get adminReplaceAllMetadata => 'Înlocuiește toate metadatele';

  @override
  String get adminReplaceAllImages => 'Înlocuiește toate imaginile';

  @override
  String get adminMetadataRefreshRequested =>
      'A fost solicitată reîmprospătarea metadatelor';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Nu s-au putut reîmprospăta metadatele: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Nu s-au găsit potriviri online';

  @override
  String get adminRemoteResults => 'Rezultate online';

  @override
  String get adminRemoteMetadataApplied => 'Metadatele online au fost aplicate';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Căutarea online a eșuat: $error';
  }

  @override
  String get adminUpdateContentType => 'Actualizează tipul de conținut';

  @override
  String get adminContentType => 'Tip de conținut';

  @override
  String get adminContentTypeUpdated => 'Tipul de conținut a fost actualizat';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nu s-a putut actualiza tipul de conținut: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nu s-a putut încărca editorul de metadate';

  @override
  String get adminNoPeopleEntries => 'Nicio intrare de persoane';

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
    return 'Șterge imaginea $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Imaginea $imageType a fost ștearsă';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Nu s-a putut șterge imaginea: $error';
  }

  @override
  String get adminAllProviders => 'Toți furnizorii';

  @override
  String get adminNoRemoteImages => 'Nu s-au găsit imagini online';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Descoperirea tunerului a eșuat: $error';
  }

  @override
  String get adminAddTuner => 'Adaugă tuner';

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
      'Numărul maxim de fluxuri pe care tunerul le permite simultan. Setează 0 pentru nelimitat.';

  @override
  String get adminTunerFallbackBitrate =>
      'Rata maximă de biți de rezervă pentru streaming';

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
      'Separă mai multe categorii cu o bară verticală.';

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
  String get adminSdCountrySelect => 'Selectează o țară';

  @override
  String get adminSdPostalCode => 'Cod poștal';

  @override
  String get adminSdGetListings => 'Obține programele';

  @override
  String get adminSdListings => 'Programe';

  @override
  String get adminEnableAllTuners => 'Activează toate tunerele';

  @override
  String get adminTunerType => 'Tipul tunerului';

  @override
  String get adminTunerAdded => 'Tunerul a fost adăugat';

  @override
  String adminTunerAddFailed(String error) {
    return 'Nu s-a putut adăuga tunerul: $error';
  }

  @override
  String get adminAddGuideProvider => 'Adaugă furnizor de ghid';

  @override
  String get adminProviderType => 'Tipul furnizorului';

  @override
  String get adminProviderAdded => 'Furnizorul a fost adăugat';

  @override
  String adminProviderAddFailed(String error) {
    return 'Nu s-a putut adăuga furnizorul: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Nu s-a putut elimina tunerul: $error';
  }

  @override
  String get adminTunerResetRequested =>
      'A fost solicitată resetarea tunerului';

  @override
  String adminTunerResetFailed(String error) {
    return 'Nu s-a putut reseta tunerul: $error';
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
  String get adminPrePadding => 'Marjă înainte (minute)';

  @override
  String get adminPostPadding => 'Marjă după (minute)';

  @override
  String get adminRecordingPath => 'Calea de înregistrare';

  @override
  String get adminSeriesRecordingPath => 'Calea de înregistrare a serialelor';

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
  String get adminLiveTvSectionTiming => 'Temporizare';

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
    return 'Nu s-au putut salva setările: $error';
  }

  @override
  String get adminSetChannelMappings => 'Setează maparea canalelor';

  @override
  String get adminMappingJson => 'Mapare JSON';

  @override
  String get adminMappingJsonHint => 'Exemplu: payload JSON cu mapări';

  @override
  String get adminChannelMappingsUpdated =>
      'Mapările canalelor au fost actualizate';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Nu s-au putut actualiza mapările: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nu s-a putut încărca administrarea Live TV';

  @override
  String get adminTunerDevices => 'Tunere';

  @override
  String get adminNoTunerHosts => 'Nu au fost configurate gazde de tuner';

  @override
  String get adminGuideProviders => 'Furnizori de ghid';

  @override
  String get adminRefreshGuideData => 'Reîmprospătează datele ghidului';

  @override
  String get adminGuideRefreshStarted =>
      'Reîmprospătarea datelor ghidului a început';

  @override
  String get adminGuideRefreshUnavailable =>
      'Sarcina de reîmprospătare a ghidului nu este disponibilă pe acest server.';

  @override
  String get adminAddProvider => 'Adaugă furnizor';

  @override
  String get adminNoListingProviders =>
      'Nu au fost configurați furnizori de programe';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Calea de înregistrare: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Calea serialelor: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Marjă înainte: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Marjă după: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Descoperirea tunerelor';

  @override
  String get adminChannelMappings => 'Maparea canalelor';

  @override
  String get adminNoDiscoveredTuners => 'Încă nu au fost descoperite tunere';

  @override
  String get adminSettingsSaved => 'Setările au fost salvate';

  @override
  String get adminBackupsNotAvailable =>
      'Copiile de rezervă nu sunt disponibile în această versiune de server.';

  @override
  String get adminRestoreWarning1 =>
      'Restaurarea va înlocui TOATE datele actuale ale serverului cu datele din copia de rezervă.';

  @override
  String get adminRestoreWarning2 =>
      'Setările curente ale serverului, utilizatorii și datele bibliotecii vor fi suprascrise.';

  @override
  String get adminRestoreWarning3 => 'Serverul va reporni după restaurare.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restaurezi acum copia de rezervă $name?';
  }

  @override
  String get adminRestoreRequested =>
      'Restaurare solicitată. Repornirea serverului poate deconecta această sesiune.';

  @override
  String get adminBackupsTitle => 'Copii de rezervă';

  @override
  String get adminUnknownDate => 'Dată necunoscută';

  @override
  String get adminUnnamedBackup => 'Copie de rezervă fără nume';

  @override
  String get adminLiveTvNotAvailable =>
      'Administrarea Live TV nu este disponibilă în această versiune de server.';

  @override
  String get adminLiveTvTitle => 'Administrare Live TV';

  @override
  String get adminApply => 'Aplică';

  @override
  String get adminNotSet => 'Nesetat';

  @override
  String get adminReset => 'Resetează';

  @override
  String get adminLogsTitle => 'Jurnalele serverului';

  @override
  String get adminLogsNewestFirst => 'Cele mai noi primele';

  @override
  String get adminLogsOldestFirst => 'Cele mai vechi primele';

  @override
  String get adminLogsJustNow => 'Chiar acum';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'acum $minutes min';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'acum $hours h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'acum $days z';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Nu s-a putut încărca $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count potriviri';
  }

  @override
  String get adminLogViewerNoMatches => 'Nicio linie potrivită';

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
  String get adminMetadataFieldSortTitle => 'Titlu de sortare';

  @override
  String get adminMetadataFieldOriginalTitle => 'Titlul original';

  @override
  String get adminMetadataFieldPremiereDate => 'Data premierei (AAAA-LL-ZZ)';

  @override
  String get adminMetadataFieldEndDate => 'Data încheierii (AAAA-LL-ZZ)';

  @override
  String get adminMetadataFieldProductionYear => 'Anul producției';

  @override
  String get adminMetadataFieldOfficialRating => 'Evaluare oficială';

  @override
  String get adminMetadataFieldCommunityRating => 'Evaluarea comunității';

  @override
  String get adminMetadataFieldCriticRating => 'Evaluarea criticilor';

  @override
  String get adminMetadataFieldCustomRating => 'Evaluare personalizată';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Prezentare generală';

  @override
  String get adminMetadataFieldDisplayOrder => 'Ordinea de afișare';

  @override
  String get adminMetadataDisplayOrderAired => 'Difuzat';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate =>
      'Data difuzării originale';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Absolut';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Digital';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Arc narativ';

  @override
  String get adminMetadataDisplayOrderProduction => 'Producție';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternativ';

  @override
  String get adminMetadataDisplayOrderRegional => 'Regional';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'DVD alternativ';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Data modificării';

  @override
  String get adminMetadataDisplayOrderSortName => 'Nume de sortare';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Data lansării';

  @override
  String get adminMetadataSettings => 'Setări metadate';

  @override
  String get adminMetadataDownloadLanguage =>
      'Limba preferată pentru descărcare';

  @override
  String get adminMetadataCountryRegion => 'Țară/Regiune';

  @override
  String get adminMetadataInheritHelp =>
      'Lasă pe Implicit pentru a moșteni setarea de la un element părinte sau de la server.';

  @override
  String get adminMetadataField3DFormat => 'Format 3D';

  @override
  String get adminMetadataPersonKindUnknown => 'Necunoscut';

  @override
  String get adminMetadataPersonKindActor => 'Actor';

  @override
  String get adminMetadataPersonKindDirector => 'Regizor';

  @override
  String get adminMetadataPersonKindComposer => 'Compozitor';

  @override
  String get adminMetadataPersonKindWriter => 'Scenarist';

  @override
  String get adminMetadataPersonKindGuestStar => 'Actor invitat';

  @override
  String get adminMetadataPersonKindProducer => 'Producător';

  @override
  String get adminMetadataPersonKindConductor => 'Dirijor';

  @override
  String get adminMetadataPersonKindLyricist => 'Textier';

  @override
  String get adminMetadataPersonKindArranger => 'Aranjor';

  @override
  String get adminMetadataPersonKindEngineer => 'Inginer';

  @override
  String get adminMetadataPersonKindMixer => 'Inginer de mixaj';

  @override
  String get adminMetadataPersonKindRemixer => 'Remixer';

  @override
  String get adminMetadataPersonKindCreator => 'Creator';

  @override
  String get adminMetadataPersonKindArtist => 'Artist';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Artistul albumului';

  @override
  String get adminMetadataPersonKindAuthor => 'Autor';

  @override
  String get adminMetadataPersonKindIllustrator => 'Ilustrator';

  @override
  String get adminMetadataPersonKindPenciller => 'Desenator';

  @override
  String get adminMetadataPersonKindInker => 'Tușier';

  @override
  String get adminMetadataPersonKindColorist => 'Colorist';

  @override
  String get adminMetadataPersonKindLetterer => 'Literator';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Artist de copertă';

  @override
  String get adminMetadataPersonKindEditor => 'Editor';

  @override
  String get adminMetadataPersonKindTranslator => 'Traducător';

  @override
  String get adminMetadataPersonKindNarrator => 'Narator';

  @override
  String get adminMetadataAirDays => 'Zile de difuzare';

  @override
  String get adminMetadataLockItem =>
      'Blochează acest element pentru a preveni modificările viitoare ale metadatelor';

  @override
  String get adminMetadataEnabledFields => 'Câmpuri activate';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Debifează un câmp pentru a-l bloca și a preveni modificarea datelor sale.';

  @override
  String get adminMetadataLockFieldName => 'Nume';

  @override
  String get adminMetadataLockFieldOverview => 'Prezentare generală';

  @override
  String get adminMetadataLockFieldGenres => 'Genuri';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Evaluare parentală';

  @override
  String get adminMetadataLockFieldCast => 'Persoane';

  @override
  String get adminMetadataLockFieldProductionLocations =>
      'Locații de producție';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Locul nașterii';

  @override
  String get adminMetadataLockFieldRuntime => 'Durată';

  @override
  String get adminMetadataLockFieldStudios => 'Studiouri';

  @override
  String get adminMetadataLockFieldTags => 'Etichete';

  @override
  String get adminMetadataGenres => 'Genuri';

  @override
  String get adminMetadataTags => 'Etichete';

  @override
  String get adminMetadataStudios => 'Studiouri';

  @override
  String get adminMetadataPeople => 'Persoane';

  @override
  String get adminMetadataAddGenre => 'Adaugă gen';

  @override
  String get adminMetadataAddTag => 'Adaugă etichetă';

  @override
  String get adminMetadataAddStudio => 'Adaugă studio';

  @override
  String get adminMetadataAddPerson => 'Adaugă o persoană';

  @override
  String get adminMetadataEditPerson => 'Editează persoana';

  @override
  String get adminMetadataRole => 'Rol';

  @override
  String get adminMetadataImagePrimary => 'Principală';

  @override
  String get adminMetadataImageBackdrop => 'Imagine de fundal';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Miniatură';

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
    return 'Șterge imaginea $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Aceasta elimină imaginea curentă din element.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nu s-a putut șterge imaginea: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Alege imaginea $imageType';
  }

  @override
  String get adminMetadataUpload => 'Încarcă';

  @override
  String get adminMetadataUpdate => 'Actualizare';

  @override
  String get adminMetadataRemoteImage => 'Imagine online';

  @override
  String get adminPluginsInstalled => 'Instalat';

  @override
  String get adminPluginsCatalog => 'Catalog';

  @override
  String get adminPluginsActive => 'Activ';

  @override
  String get adminPluginsRestart => 'Repornire';

  @override
  String get adminPluginsRestartRequired => 'Repornire necesară';

  @override
  String get adminPluginsNoSearchResults =>
      'Niciun plugin nu corespunde căutării tale';

  @override
  String get adminPluginsNoneInstalled => 'Nu există pluginuri instalate';

  @override
  String get adminPluginsNoneActive => 'Niciun plugin activ';

  @override
  String get adminPluginsNoneRequireRestart =>
      'Niciun plugin nu necesită repornirea serverului';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Actualizare disponibilă: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Actualizare disponibilă';

  @override
  String get adminPluginsPendingRemoval =>
      'În așteptarea eliminării după repornire';

  @override
  String get adminPluginsChangesPending =>
      'Modificări în așteptarea repornirii';

  @override
  String get adminPluginsEnable => 'Activează';

  @override
  String get adminPluginsDisable => 'Dezactivează';

  @override
  String get adminPluginsInstallUpdate => 'Instalează actualizarea';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instalează actualizarea (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Niciun pachet nu corespunde căutării tale';

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
      'Integrarea setărilor pluginurilor este încă experimentală. Este posibil ca unele câmpuri sau aspecte să nu se afișeze corect încă.';

  @override
  String get adminPluginDetailToggle404 =>
      'Nu s-a putut comuta starea pluginului. Serverul nu a găsit această versiune a pluginului. Încearcă să reîmprospătezi pluginurile, apoi reîncearcă.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Nu s-a putut comuta starea pluginului. Verifică jurnalele serverului pentru detalii.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Setări $name';
  }

  @override
  String get adminPluginDetailDetails => 'Detalii';

  @override
  String get adminPluginDetailDeveloper => 'Dezvoltator';

  @override
  String get adminPluginDetailRepository => 'Depozit';

  @override
  String get adminPluginDetailBundled => 'Inclus';

  @override
  String get adminPluginDetailEnablePlugin => 'Activează pluginul';

  @override
  String get adminPluginDetailRestartRequired =>
      'Este necesară repornirea serverului pentru ca modificările să intre în vigoare.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Acest plugin va fi eliminat după repornirea serverului.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Acest plugin a avut o defecțiune și este posibil să nu funcționeze corect.';

  @override
  String get adminPluginDetailNotSupported =>
      'Acest plugin nu este acceptat de versiunea curentă a serverului.';

  @override
  String get adminPluginDetailSuperseded =>
      'Acest plugin a fost înlocuit de o versiune mai nouă.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Nu s-au putut încărca depozitele: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Elimină depozitul';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Sigur vrei să elimini „$name”?';
  }

  @override
  String get adminReposRemove => 'Elimină';

  @override
  String adminReposSaveFailed(String error) {
    return 'Nu s-au putut salva depozitele: $error';
  }

  @override
  String get adminReposEmpty => 'Nu au fost configurate depozite';

  @override
  String get adminReposEmptySubtitle =>
      'Adaugă un depozit pentru a răsfoi pluginurile disponibile';

  @override
  String get adminReposUnnamed => '(fără nume)';

  @override
  String get adminReposEditTitle => 'Editează depozitul';

  @override
  String get adminReposAddTitle => 'Adaugă un depozit';

  @override
  String get adminReposUrl => 'URL-ul depozitului';

  @override
  String get adminReposNameHint => 'de ex. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL nevalid';

  @override
  String get adminGeneralSettingsTitle => 'Setări generale';

  @override
  String get adminGeneralMetadataLanguage => 'Limba preferată pentru metadate';

  @override
  String get adminGeneralMetadataLanguageHint => 'de ex. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Țara preferată pentru metadate';

  @override
  String get adminGeneralMetadataCountryHint => 'de ex. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Concurența scanării bibliotecii';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limita de codificare paralelă a imaginilor';

  @override
  String get adminUnknownError => 'Eroare necunoscută';

  @override
  String get adminBrowse => 'Răsfoiește';

  @override
  String get adminCloseBrowser => 'Închide browserul';

  @override
  String get adminNetworkingTitle => 'Rețea';

  @override
  String get adminNetworkingRestartWarning =>
      'Modificările la setările de rețea pot necesita repornirea serverului.';

  @override
  String get adminNetworkingRemoteAccess => 'Activează accesul de la distanță';

  @override
  String get adminNetworkingPorts => 'Porturi';

  @override
  String get adminNetworkingHttpPort => 'Port HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Port HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Activează HTTPS';

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
  String get adminNetworkingAddEntry => 'Adaugă intrare';

  @override
  String get adminBrandingTitle => 'Branding';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Mesaj de avertizare la autentificare';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML afișat sub formularul de autentificare';

  @override
  String get adminBrandingCustomCss => 'CSS personalizat';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personalizat aplicat interfeței web';

  @override
  String get adminBrandingEnableSplash => 'Activează ecranul de întâmpinare';

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
  String get adminPlaybackHwAccel => 'Accelerare hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Accelerare hardware';

  @override
  String get adminPlaybackEnableHwEncoding => 'Activează codificarea hardware';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Activează decodarea hardware pentru:';

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
  String get adminPlaybackEncodingThreads => 'Fire de codificare';

  @override
  String get adminPlaybackFallbackFont => 'Activează fontul de rezervă';

  @override
  String get adminPlaybackFallbackFontPath => 'Calea fontului de rezervă';

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
      'Limita ratei de biți a clientului la distanță (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Lasă gol sau 0 pentru nelimitat';

  @override
  String get adminTrickplayHwAccel => 'Activează accelerarea hardware';

  @override
  String get adminTrickplayHwEncoding => 'Activează codificarea hardware';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Activează extragerea doar a cadrelor cheie';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Mai rapid, dar precizie mai mică';

  @override
  String get adminTrickplayNonBlocking => 'Neblocant';

  @override
  String get adminTrickplayBlocking => 'Blocant';

  @override
  String get adminTrickplayPriorityHigh => 'Ridicată';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Peste normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normală';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Sub normal';

  @override
  String get adminTrickplayPriorityIdle => 'Inactiv';

  @override
  String get adminTrickplayImageSettings => 'Setări imagine';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Cât de des se capturează cadre';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Lățimi în pixeli separate prin virgulă (de ex. 320)';

  @override
  String get adminTrickplayQuality => 'Calitate';

  @override
  String get adminTrickplayQScale => 'Scala calității';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Valori mai mici = calitate mai bună, fișiere mai mari';

  @override
  String get adminTrickplayJpegQuality => 'Calitate JPEG';

  @override
  String get adminTrickplayProcessing => 'Se procesează';

  @override
  String get adminTasksEmpty => 'Nu s-au găsit activități programate';

  @override
  String get adminTasksNoFilterMatch =>
      'Nicio activitate nu se potrivește cu filtrul curent';

  @override
  String get adminTaskCancelling => 'Se anulează...';

  @override
  String get adminTaskRunning => 'Rulează...';

  @override
  String get adminTaskNeverRun => 'Niciodată rulată';

  @override
  String get adminTaskStop => 'Oprește';

  @override
  String get adminRunningTasks => 'Activități în execuție';

  @override
  String get adminTaskRun => 'Rulează';

  @override
  String get adminTaskDetailLastExecution => 'Ultima execuție';

  @override
  String get adminTaskDetailStarted => 'Început';

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
    return 'În fiecare $day la $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'La fiecare $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'La pornirea aplicației';

  @override
  String get adminTaskTriggerTypeDaily => 'Zilnic';

  @override
  String get adminTaskTriggerTypeWeekly => 'Săptămânal';

  @override
  String get adminTaskTriggerTypeInterval => 'La un interval';

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
  String get adminActivityOlder => 'Mai vechi';

  @override
  String adminActivityDaysAgo(int days) {
    return 'acum $days z';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'acum $hours h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'acum $minutes min';
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
      'Configurează generarea de imagini trickplay pentru miniaturile de previzualizare la derulare.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Port HTTPS public';

  @override
  String get adminNetworkingBaseUrl => 'URL de bază';

  @override
  String get adminNetworkingBaseUrlHint => 'de ex. /jellyfin';

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
      'Asociază o subrețea sau o adresă unui URL publicat, de ex. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Calea certificatului';

  @override
  String get adminNetworkingRemoteIpFilter => 'Filtru IP la distanță';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filtru IP la distanță';

  @override
  String get adminPlaybackVaapiDevice => 'Dispozitiv VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automat';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Calea temporară pentru transcodare';

  @override
  String get adminPlaybackSegmentDeletion => 'Permite ștergerea segmentelor';

  @override
  String get adminPlaybackSegmentKeep => 'Păstrarea segmentelor (secunde)';

  @override
  String get adminPlaybackThrottleBuffering => 'Limitează tamponarea';

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
  String get adminTrickplayProcessThreads => 'Fire de procesare';

  @override
  String get adminTrickplayWidthResolutions => 'Rezoluții de lățime';

  @override
  String get adminMetadataDefault => 'Implicit';

  @override
  String get adminMetadataContentTypeUpdated =>
      'Tipul de conținut a fost actualizat';

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
  String get adminGeneralCachePath => 'Calea cache-ului';

  @override
  String get adminGeneralMetadataPath => 'Calea metadatelor';

  @override
  String get adminGeneralServerName => 'Numele serverului';

  @override
  String get adminGeneralDisplayLanguage => 'Limba de afișare preferată';

  @override
  String get adminSettingsLoadFailed => 'Nu s-au putut încărca setările';

  @override
  String get adminDiscover => 'Descoperă';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Nu s-au putut actualiza mapările: $error';
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
  String get syncPlayDisabledTitle => 'SyncPlay dezactivat';

  @override
  String get syncPlayDisabledMessage =>
      'Activează SyncPlay în Setări pentru a folosi redarea sincronizată.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Server neacceptat';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay necesită un server Jellyfin. Serverul curent nu îl acceptă.';

  @override
  String get syncPlayGroupFallbackName => 'Grup SyncPlay';

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
  String get syncPlayIgnoreWait => 'Ignoră așteptarea';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Nu ține grupul pe loc cât timp acest dispozitiv încarcă în tampon';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continuă local fără a aștepta membrii lenți';

  @override
  String get syncPlayRepeat => 'Repetă';

  @override
  String get syncPlayRepeatOne => 'Unul';

  @override
  String get syncPlayShuffleModeShuffled => 'Amestecat';

  @override
  String get syncPlayShuffleModeSorted => 'Sortat';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sincronizează coada de redare curentă';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Înlocuiește coada grupului cu ceea ce se redă local';

  @override
  String get syncPlayLeaveGroup => 'Părăsește grupul';

  @override
  String get syncPlayGroupQueue => 'Coada grupului';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Elementul $index';
  }

  @override
  String get syncPlayPlayNow => 'Redă acum';

  @override
  String get syncPlayCreateNewGroup => 'Creează un grup nou';

  @override
  String get syncPlayGroupName => 'Numele grupului';

  @override
  String get syncPlayDefaultGroupName => 'Grupul meu SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Creează grup';

  @override
  String get syncPlayAvailableGroups => 'Grupuri disponibile';

  @override
  String get syncPlayNoGroupsAvailable => 'Niciun grup disponibil';

  @override
  String get syncPlayJoinGroupQuestion => 'Te alături grupului SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Alăturarea la un grup SyncPlay poate înlocui coada ta curentă de redare. Continui?';

  @override
  String get syncPlayJoin => 'Alătură-te';

  @override
  String get syncPlayStateIdle => 'Inactiv';

  @override
  String get syncPlayStateWaiting => 'În așteptare';

  @override
  String get syncPlayStatePaused => 'Pe pauză';

  @override
  String get syncPlayStatePlaying => 'Se redă';

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
      'Nu ai acces la unul sau mai multe elemente din acest grup SyncPlay. Cere proprietarului grupului să verifice permisiunile bibliotecii sau alege altă coadă.';

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
      'Redarea directă nu a putut porni pentru acest flux Dolby Vision. Reîncerci folosind transcodarea pe server?';

  @override
  String get retryWithTranscode => 'Reîncearcă cu transcodare';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision nu este acceptat';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Acest dispozitiv nu poate decoda direct conținutul Dolby Vision. Folosește varianta de rezervă HDR10 sau solicită transcodarea pe server.';

  @override
  String get rememberMyChoice => 'Ține minte alegerea mea';

  @override
  String get playHdr10Fallback => 'Redă varianta de rezervă HDR10';

  @override
  String get requestTranscode => 'Solicită transcodare';

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
  String get seeAll => 'Vezi tot';

  @override
  String get noItems => 'Niciun element';

  @override
  String get switchUser => 'Schimbă utilizatorul';

  @override
  String get remoteControl => 'Control de la distanță';

  @override
  String get mediaBarLoading => 'Se încarcă bara media...';

  @override
  String get mediaBarError => 'Bara media nu s-a putut încărca';

  @override
  String get offlineServerUnavailable =>
      'Conectat la internet, dar serverul curent nu este disponibil.';

  @override
  String get offlineNoInternet =>
      'Ești offline. Este disponibil doar conținutul descărcat.';

  @override
  String get offlineFileNotAvailable => 'Fișierul nu este disponibil';

  @override
  String get offlineSwitchServer => 'Schimbă serverul';

  @override
  String get offlineSavedMedia => 'Descărcări';

  @override
  String get offlineBannerTitle => 'Ești offline';

  @override
  String get offlineBannerSubtitle => 'Se afișează descărcările tale';

  @override
  String get offlineBannerAction => 'Descărcări';

  @override
  String get serverUnreachableBannerTitle => 'Serverul nu poate fi contactat';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Se redă din descărcări până revine serverul';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Redare la distanță';

  @override
  String castControlFailed(String error) {
    return 'Controlul proiecției a eșuat: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Comenzi $kind';
  }

  @override
  String get castDeviceVolume => 'Volumul dispozitivului';

  @override
  String get castVolumeUnavailable => 'Indisponibil';

  @override
  String castStopKind(String kind) {
    return 'Oprește $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Subtitrări';

  @override
  String get pinConfirmTitle => 'Confirmă codul PIN';

  @override
  String get pinSetTitle => 'Setează codul PIN';

  @override
  String get pinEnterTitle => 'Introdu codul PIN';

  @override
  String get pinReenterToConfirm => 'Reintrodu codul PIN pentru a confirma';

  @override
  String pinEnterNDigit(int length) {
    return 'Introdu un cod PIN de $length cifre';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Introdu codul PIN de $length cifre';
  }

  @override
  String get kidsMode => 'Modul copii';

  @override
  String get kidsModeSubtitle =>
      'Simplifică aplicația și blochează ieșirea cu un PIN';

  @override
  String get kidsModeExit => 'Ieși din Modul copii';

  @override
  String get kidsModeExitSubtitle =>
      'Introdu PIN-ul pentru a restabili aplicația completă';

  @override
  String get pinIncorrect => 'PIN incorect';

  @override
  String pinTryAgainIn(String wait) {
    return 'Prea multe încercări. Încearcă din nou peste $wait.';
  }

  @override
  String get pinMismatch => 'PIN-urile nu se potrivesc';

  @override
  String get pinForgot => 'Ai uitat codul PIN?';

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
      'Contul tău nu poate autoriza această cerere Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Codul Quick Connect nu a fost găsit. Încearcă un cod nou.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect a eșuat: $message';
  }

  @override
  String get quickConnectEnterCode => 'Introdu codul';

  @override
  String get quickConnectAuthorize => 'Autorizează';

  @override
  String remoteCommandFailed(String error) {
    return 'Comanda a eșuat: $error';
  }

  @override
  String get remoteControlTitle => 'Control de la distanță';

  @override
  String get remoteFailedToLoadSessions => 'Nu s-au putut încărca sesiunile';

  @override
  String get remoteNoSessions => 'Nicio sesiune controlabilă';

  @override
  String get remoteStartPlayback => 'Pornește redarea pe alt dispozitiv';

  @override
  String get unknownUser => 'Necunoscut';

  @override
  String get unknownItem => 'Necunoscut';

  @override
  String get remoteNothingPlaying => 'Nimic nu se redă în această sesiune';

  @override
  String get castingStarted => 'Proiectarea a început pe dispozitivul selectat';

  @override
  String castingFailed(String error) {
    return 'Nu s-a putut porni proiectarea: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nu sunt disponibile dispozitive pentru redare la distanță.';

  @override
  String get noRemoteDevicesIos =>
      'Nu sunt disponibile dispozitive pentru redare la distanță.\n\nPe iOS, țintele AirPlay pot fi indisponibile în simulator.';

  @override
  String get trackActionPlayNext => 'Redă următorul';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Adaugă în coadă';

  @override
  String get trackActionAddToPlaylist => 'Adaugă în lista de redare';

  @override
  String get trackActionCancelDownload => 'Anulează descărcarea';

  @override
  String get trackActionDeleteFromPlaylist => 'Șterge din lista de redare';

  @override
  String get trackActionMoveUp => 'Mută în sus';

  @override
  String get trackActionMoveDown => 'Mută în jos';

  @override
  String get trackActionRemoveFromFavorites => 'Elimină din favorite';

  @override
  String get trackActionAddToFavorites => 'Adaugă la favorite';

  @override
  String get trackActionGoToAlbum => 'Mergi la album';

  @override
  String get trackActionGoToArtist => 'Mergi la artist';

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
  String get shuffleBy => 'Amestecă după';

  @override
  String get shuffleSelectLibrary => 'Selectează biblioteca';

  @override
  String get shuffleSelectGenre => 'Selectează genul';

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
  String get posterDisplayTitle => 'Afișare';

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
  String get playlistNew => 'Listă de redare nouă';

  @override
  String get playlistCreate => 'Creează';

  @override
  String get playlistCreateNew => 'Creează o listă de redare nouă';

  @override
  String get playlistNoneFound => 'Nu s-au găsit liste de redare';

  @override
  String get addToPlaylist => 'Adaugă în lista de redare';

  @override
  String get lyricsNotAvailable => 'Nu există versuri disponibile';

  @override
  String get upNext => 'Urmează';

  @override
  String get playNext => 'Redă următorul';

  @override
  String get stillWatchingContent =>
      'Redarea a fost pusă pe pauză. Încă vizionezi?';

  @override
  String get stillWatchingStop => 'Oprește';

  @override
  String get stillWatchingContinue => 'Continuă';

  @override
  String skipSegment(String segment) {
    return 'Omite $segment';
  }

  @override
  String get liveTv => 'Live TV';

  @override
  String get continueWatchingAndNextUp =>
      'Continuă vizionarea și Următorul episod';

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
  String get playerTooltipCastControls => 'Comenzi pentru proiectare';

  @override
  String get playerTooltipPlaybackQuality => 'Rata de biți';

  @override
  String get playerTooltipEnterFullscreen => 'Intră în ecran complet';

  @override
  String get playerTooltipExitFullscreen => 'Ieși din ecranul complet';

  @override
  String get playerTooltipFloatOnTop => 'Plutește deasupra';

  @override
  String get playerTooltipExitFloatOnTop => 'Dezactivează plutirea deasupra';

  @override
  String get playerTooltipLockLandscape => 'Blochează în peisaj';

  @override
  String get playerTooltipUnlockOrientation => 'Permite rotirea';

  @override
  String get playerTooltipPrevious => 'Anterior';

  @override
  String get playerTooltipSeekBack => 'Derulează înapoi';

  @override
  String get playerTooltipSeekForward => 'Derulează înainte';

  @override
  String get contextMenuMarkWatched => 'Marchează ca vizionat';

  @override
  String get contextMenuMarkUnwatched => 'Marchează ca nevizionat';

  @override
  String get contextMenuAddToFavorites => 'Adaugă la favorite';

  @override
  String get contextMenuRemoveFromFavorites => 'Elimină din favorite';

  @override
  String get contextMenuGoToSeries => 'Mergi la serial';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Ascunde din Continuă vizionarea';

  @override
  String get contextMenuHideFromNextUp => 'Ascunde din „Urmează”';

  @override
  String get contextMenuAddToCollection => 'Adaugă în colecție';

  @override
  String get contextMenuRemoveFromCollection => 'Elimină din colecție';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Elimini $item din $collection? Elementul rămâne în biblioteca ta.';
  }

  @override
  String get removeFromCollectionFailed => 'Nu s-a putut elimina din colecție';

  @override
  String get settingsAdministrationSubtitle =>
      'Accesează panoul de administrare al serverului';

  @override
  String get settingsAccountSecurity => 'Cont și securitate';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentificare, cod PIN și control parental';

  @override
  String get settingsPersonalization => 'Personalizare';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigarea, rândurile din ecranul principal și vizibilitatea bibliotecilor';

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
      'Versiunea aplicației, informații juridice și mulțumiri';

  @override
  String get settingsAuthenticationSection => 'AUTENTIFICARE';

  @override
  String get settingsSortServersBy => 'Sortează serverele după';

  @override
  String get settingsLastUsed => 'Ultimele folosite';

  @override
  String get settingsAlphabetical => 'Alfabetic';

  @override
  String get settingsConnectionSection => 'CONEXIUNE';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Permite certificatele autosemnate';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Ai încredere în serverele care folosesc certificate TLS autosemnate sau emise de o autoritate privată. Activează doar pentru serverele pe care le controlezi. Această opțiune dezactivează validarea certificatelor pentru toate conexiunile.';

  @override
  String get untrustedServerCertificate =>
      'This server\'s certificate isn\'t trusted. If it\'s your own server and uses a self-signed or private certificate, you can allow it here.';

  @override
  String get settingsPrivacyAndSafetySection =>
      'CONFIDENȚIALITATE ȘI SIGURANȚĂ';

  @override
  String get itemBlockedByParentalControls => 'Acest lucru nu este disponibil';

  @override
  String get blockedRatingsCeilingHint =>
      'Blocarea unei evaluări blochează și tot ce este mai restrictiv decât ea.';

  @override
  String get blockedRatingsUnrankedSection => 'Se blochează doar pe sine';

  @override
  String get settingsBlockedRatings => 'Evaluări blocate';

  @override
  String get settingsGeneralStyle => 'Stil general';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Accentele temei, imaginile de fundal și indicatorii de vizionare';

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
      'Vizibilitatea bibliotecilor, vizualizarea pe foldere și comportamentul pe mai multe servere';

  @override
  String get settingsTwentyFourHourClock => 'Ceas de 24 de ore';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Folosește formatul de 24 de ore oriunde este afișat ceasul';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Afișează butonul de amestecare în bara de navigare';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Afișează butonul de genuri în bara de navigare';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Afișează butonul de favorite în bara de navigare';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Arată butonul Live TV în bara de navigare când serverul are o bibliotecă Live TV';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Afișează butonul de biblioteci în bara de navigare';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Afișează butonul Seerr în bara de navigare';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Afișează mereu etichetele text în bara de navigare de sus';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Comută vizibilitatea pe ecranul principal pentru fiecare bibliotecă. Repornește Moonfin pentru ca modificările să aibă efect.';

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
      'Moonbase alimentează integrările de pe partea de server, inclusiv surse de evaluare suplimentare, cereri Seerr și preferințe sincronizate.';

  @override
  String get settingsOfflineDownloads => 'Descărcări offline';

  @override
  String get useNativeEmulator => 'Emulare nativă';

  @override
  String get useNativeEmulatorSubtitle =>
      'Joacă jocuri cu nuclee native în loc de playerul web EmulatorJS';

  @override
  String get emulatorCores => 'Nuclee de emulator';

  @override
  String get emulatorCoresSubtitle =>
      'Descarcă sisteme pentru a juca jocuri nativ';

  @override
  String get emulatorCoresDescription =>
      'Alege ce sisteme să instalezi. Nucleele sunt furnizate de proiectul libretro și permit rularea jocurilor nativ, în loc de o vizualizare în browser.';

  @override
  String get emulatorCoreDownloading => 'Se descarcă';

  @override
  String get emulatorCoreUnavailable => 'Indisponibil pentru acest dispozitiv';

  @override
  String get emulatorCoreDownloadFailed =>
      'Nucleul nu a putut fi descărcat. Verifică conexiunea și încearcă din nou.';

  @override
  String emulatorCoreResetSettings(String system) {
    return 'Resetează setările $system la valorile implicite';
  }

  @override
  String get emulatorCoreSettingsReset =>
      'Setările au fost resetate la valorile implicite.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Setările nu au putut fi resetate. Verifică conexiunea și încearcă din nou.';

  @override
  String get downloadedGames => 'Jocuri descărcate';

  @override
  String get downloadedGamesSubtitle =>
      'Eliberează spațiul ocupat de fișierele jocurilor';

  @override
  String get downloadedGamesDescription =>
      'Jocurile sunt copiate pe acest dispozitiv înainte de a fi jucate. Elimină-le pe cele terminate pentru a elibera spațiu. Salvările rămân pe server și nu sunt șterse.';

  @override
  String get downloadedGamesEmpty =>
      'Niciun joc nu a fost descărcat încă pe acest dispozitiv.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count jocuri, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Elimină tot';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Elimini $title de pe acest dispozitiv? Se va descărca din nou la următoarea jucare.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Elimini toate jocurile descărcate de pe acest dispozitiv? Se vor descărca din nou la următoarea jucare.';

  @override
  String get settingsHigh => 'Ridicată';

  @override
  String get settingsLow => 'Scăzută';

  @override
  String get settingsCustomPath => 'Cale personalizată';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Introdu calea folderului de descărcare';

  @override
  String get settingsConcurrentDownloads => 'Descărcări simultane';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Numărul maxim de elemente descărcate simultan.';

  @override
  String get settingsAppInfo => 'INFORMAȚII DESPRE APLICAȚIE';

  @override
  String get settingsReportAnIssue => 'Raportează o problemă';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Deschide instrumentul de urmărire a problemelor pe GitHub';

  @override
  String get settingsJoinDiscord => 'Alătură-te pe Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Discută cu comunitatea';

  @override
  String get settingsJoinTheDiscord => 'Alătură-te pe Discord';

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
      'Notificări despre licențele open-source';

  @override
  String get settingsPrivacyPolicy => 'Politica de confidențialitate';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Cum gestionează Moonfin datele tale';

  @override
  String get settingsCheckForUpdates => 'Verifică actualizările';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Verifică cea mai recentă versiune Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Realizat cu Flutter';

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
  String get settingsBoth => 'Ambele';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Filtru de tip conținut pentru amestecare';

  @override
  String get settingsVideoPlaybackPreferences => 'Preferințe de redare video';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Motorul video de bază și setările de calitate a streamingului';

  @override
  String get settingsAudioPreferences => 'Preferințe audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Piese audio, procesare și opțiuni de transmitere directă';

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
      'Funcții specializate ale playerului. Folosește cu prudență, deoarece unele opțiuni pot cauza probleme de redare';

  @override
  String get settingsSkipIntrosAndOutros => 'Omiți introurile și genericele?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return 'Segmente $segment';
  }

  @override
  String get settingsMediaSegmentCountdown =>
      'Numărătoare inversă pentru segmentele media';

  @override
  String get settingsProgressBar => 'Bară de progres';

  @override
  String get settingsTimer => 'Temporizator';

  @override
  String get settingsNone => 'Niciuna';

  @override
  String get settingsSkipButtonAutoHide => 'Ascunde automat butonul „Omite”';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Închide automat butonul de omitere a introducerii și a genericului după câteva secunde.';

  @override
  String get settingsPromptUser => 'Întreabă utilizatorul';

  @override
  String get settingsSkip => 'Omite';

  @override
  String get settingsDoNothing => 'Nu face nimic';

  @override
  String get settingsMaxBitrateDescription =>
      'Limitează rata de biți a fluxului. Conținutul care depășește acest prag va fi transcodat pentru a se încadra.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limitează rezoluția maximă pe care o va solicita playerul. Conținutul cu rezoluție mai mare va fi transcodat la o rezoluție mai mică.';

  @override
  String get settingsPlayerZoomDescription =>
      'Cum să fie scalat videoclipul pentru a încăpea pe ecran.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Motor de redare (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Alege motorul de redare implicit pe dispozitivele Android TV. Modificările se aplică la următoarea sesiune de redare.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (recomandat)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (vechi)';

  @override
  String get settingsRedetectDisplay => 'Redetectează ecranul';

  @override
  String get settingsRedetectDisplayDescription =>
      'Întreabă din nou televizorul ce formate HDR acceptă. Folosește această opțiune dacă titlurile Dolby Vision sau HDR10 sunt transcodate după ce televizorul sau receiverul a fost pornit târziu.';

  @override
  String get settingsDisplayIsSdr => 'Televizorul meu nu este HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Nu mai anunța suportul HDR pentru acest ecran. Folosește această opțiune doar dacă detectarea continuă să raporteze HDR pe care televizorul tău nu îl poate afișa de fapt.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Ecran redetectat: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'Nu s-au detectat formate HDR';

  @override
  String get settingsDisplayMarkedSdr => 'Ecran salvat ca SDR';

  @override
  String get settingsDolbyVisionFallback => 'Varianta de rezervă Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Comportamentul pentru titlurile Dolby Vision pe dispozitive fără decodare Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Întreabă de fiecare dată';

  @override
  String get settingsPreferHdr10Fallback => 'Preferă varianta de rezervă HDR10';

  @override
  String get settingsPreferServerTranscode => 'Preferă transcodarea pe server';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Redare directă Dolby Vision Profile 7';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Stabilește dacă fluxurile cu strat de îmbunătățire Dolby Vision profil 7 se redau direct.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFTKRT activat)';

  @override
  String get settingsEnabledOnThisDevice => 'Activat pe acest dispozitiv';

  @override
  String get settingsDisabledPreferTranscode =>
      'Dezactivat (prefer transcodare)';

  @override
  String get settingsResumeRewindDescription =>
      'La reluarea redării (din Continuă vizionarea sau dintr-o pagină a unui element media), cu câte secunde să se deruleze înapoi?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Când reiei redarea după apăsarea butonului de pauză, cu câte secunde să se deruleze înapoi?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Câte secunde să sară înapoi după apăsarea butonului de derulare înapoi.';

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
      'Câte secunde să sară înainte după apăsarea butonului de derulare rapidă.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Transmite AC3 în flux de biți către un decodor extern';

  @override
  String get settingsCinemaMode => 'Mod cinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Redă trailere/prerolluri înainte de conținutul principal';

  @override
  String get settingsCinemaModeEpisodes => 'Mod cinema pentru episoade';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Redă și prerolluri înainte de episoadele de seriale';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extins afișează un card complet cu ilustrația și descrierea episodului. Minimal arată o suprapunere compactă cu numărătoare inversă. Dezactivat ascunde complet solicitarea.';

  @override
  String get settingsShort => 'Scurtă';

  @override
  String get settingsLong => 'Lungă';

  @override
  String get settingsVeryLong => 'Foarte lungă';

  @override
  String get settingsVideoStartDelay => 'Întârziere la pornirea videoclipului';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Live TV direct';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Activează redarea directă pentru Live TV';

  @override
  String get settingsOpenGroups => 'Grupuri deschise';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Creează, alătură-te sau gestionează grupuri SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay activat';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Activează funcțiile de vizionare în grup';

  @override
  String get settingsSyncplayButton => 'Butonul SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Afișează butonul SyncPlay în bara de navigare';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Corecție avansată';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Activează logica de sincronizare fină';

  @override
  String get settingsSyncplaySyncCorrection => 'Corectare sincronizare';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Ajustează automat redarea pentru a rămâne sincronizat';

  @override
  String get settingsSyncplaySpeedToSync => 'Viteza de sincronizare';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Folosește ajustarea vitezei de redare pentru sincronizare';

  @override
  String get settingsSyncplaySkipToSync => 'Sari la sincronizare';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Folosește derularea pentru sincronizare';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Întârziere minimă de viteză';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Întârziere maximă de viteză';

  @override
  String get settingsSyncplaySpeedDuration => 'Durata accelerării';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Întârziere minimă la omitere';

  @override
  String get settingsSyncplayExtraOffset => 'Decalaj suplimentar SyncPlay';

  @override
  String get onNow => 'În difuzare acum';

  @override
  String get collections => 'Colecții';

  @override
  String get lastPlayed => 'Ultima redare';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Adăugate recent în $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '$libraryName lansate recent';
  }

  @override
  String get autoplayNextEpisode => 'Redarea automată a episodului următor';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Redă automat episodul următor când este disponibil.';

  @override
  String get skipSilenceTitle => 'Omite tăcerea';

  @override
  String get skipSilenceSubtitle =>
      'Omite automat segmentele audio silențioase atunci când este acceptat de flux.';

  @override
  String get allowExternalAudioEffectsTitle => 'Permite efecte audio externe';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Permite aplicațiilor de egalizare și efecte (de ex. Wavelet) să se atașeze la sesiunile de redare Media3.';

  @override
  String get disableTunnelingTitle => 'Dezactivează tunelarea';

  @override
  String get disableTunnelingSubtitle =>
      'Forțează redarea fără tunelare. Util pe dispozitive cu discontinuități audio/video la tunelare.';

  @override
  String get enableTunnelingTitle => 'Activează tunelarea';

  @override
  String get enableTunnelingSubtitle =>
      'Opțiune avansată. Direcționează sunetul și imaginea printr-o cale hardware cuplată. Este dezactivată implicit deoarece provoacă întreruperi audio/video pe unele dispozitive.';

  @override
  String get mapDolbyVisionP7Title =>
      'Redă mereu Dolby Vision profil 7 ca HDR10';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Omite conversia profilului 8 și convertește fluxurile Dolby Vision profil 7 în HEVC compatibil HDR10. Folosește această opțiune dacă fluxurile convertite arată greșit.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Folosește stilurile de subtitrare încorporate';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Aplică culorile, fonturile și poziționarea încorporate în pista de subtitrare. Dezactivează pentru a folosi în schimb preferințele tale de stil pentru subtitrări.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Folosește dimensiunile de font încorporate în subtitrări';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Aplică indiciile de dimensiune a fontului încorporate în pista de subtitrare. Dezactivează pentru a folosi dimensiunea subtitrărilor din preferințele tale de stil.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Afișează detaliile media';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Afișează detaliile elementului selectat în partea de sus a paginilor de bibliotecă.';

  @override
  String get hideBackdropsInLibraries =>
      'Ascunzi imaginile de fundal în timpul navigării?';

  @override
  String get useDetailedSubHeadings => 'Folosește subtitluri detaliate';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Afișează un subrând detaliat sau minimal în paginile bibliotecii.';

  @override
  String get savedThemesDeleteDialogTitle => 'Ștergi tema salvată?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Elimini „$themeName” din memoria cache a acestui dispozitiv?';
  }

  @override
  String get themeStore => 'Magazin de teme';

  @override
  String get themeStoreSubtitle =>
      'Răsfoiește și salvează teme create de comunitate';

  @override
  String get themeStoreDescription =>
      'Salvează o temă pentru a o folosi ca pe celelalte teme salvate.';

  @override
  String get themeStoreEmpty => 'Momentan nu este disponibilă nicio temă.';

  @override
  String get themeStoreLoadFailed =>
      'Magazinul de teme nu a putut fi încărcat. Verifică conexiunea și încearcă din nou.';

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
      'Acestea sunt temele descărcate din pluginul Moonfin pentru serverul curent. Ștergerea elimină doar această copie locală.';

  @override
  String get savedThemesEmpty =>
      'Nu au fost găsite teme salvate pentru acest server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Activă în prezent';
  }

  @override
  String get savedThemesDeleteTooltip => 'Șterge tema salvată';

  @override
  String get savedThemesManageSubtitle =>
      'Gestionează temele de plugin descărcate pe acest dispozitiv';

  @override
  String get themeEditor => 'Editor de teme';

  @override
  String get themeEditorSubtitle =>
      'Deschide editorul de teme Moonfin în browser';

  @override
  String get homeScreen => 'Ecran principal';

  @override
  String get bottomBar => 'Bara de jos';

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
      'Activează sau dezactivează categoriile de rânduri pe baza bibliotecilor';

  @override
  String get homeRowTogglesDescription =>
      'Activează comutatoarele de mai jos pentru a afișa rândurile în secțiunile ecranului principal.';

  @override
  String get rowsType => 'Tipul rândului';

  @override
  String get rowsTypeDescription =>
      'Modul Clasic păstrează tipul de imagine și suprapunerea cu informații pentru fiecare rând. Modul Modern folosește rânduri de la portret la fundal.';

  @override
  String get modernCardsOnMyMediaRow => 'Carduri moderne în rândul Media mea';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Afișează postere personalizabile care se extind la focalizare. Dezactivează pentru a afișa mereu miniatura orizontală.';

  @override
  String get sortOrder => 'Ordinea de sortare';

  @override
  String get ascending => 'Crescător';

  @override
  String get descending => 'Descrescător';

  @override
  String get displayFavoritesRows => 'Afișează rândurile cu favorite';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Afișează filmele și serialele favorite, precum și celelalte rânduri cu favorite, în secțiunile ecranului principal.';

  @override
  String get favoritesRowSorting => 'Sortarea rândurilor cu favorite';

  @override
  String get favoritesRowSortingDescription =>
      'Sortează rândurile Favorite după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sortează rândurile Favorite în ordine crescătoare sau descrescătoare.';

  @override
  String get displayCollectionsRows => 'Afișează rândurile cu colecții';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Afișează rândurile cu colecții în secțiunile ecranului principal.';

  @override
  String get collectionsRowSorting => 'Sortarea rândurilor cu colecții';

  @override
  String get collectionsRowSortingDescription =>
      'Sortează rândurile Colecții după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sortează rândurile Colecții în ordine crescătoare sau descrescătoare.';

  @override
  String get collectionsRowShowEpisodes => 'Arată episoadele individuale';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Extinde serialele pentru a afișa fiecare episod separat.';

  @override
  String get displayGenresRows => 'Afișează rândurile cu genuri';

  @override
  String get displayGenresRowsSubtitle =>
      'Afișează rândurile cu genuri în secțiunile ecranului principal.';

  @override
  String get genresRowSorting => 'Sortarea rândurilor cu genuri';

  @override
  String get genresRowSortingDescription =>
      'Sortează rândurile Genuri după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get genresRowSortOrderDescription =>
      'Sortează rândurile Genuri în ordine crescătoare sau descrescătoare.';

  @override
  String get genresRowItems => 'Elementele rândurilor cu genuri';

  @override
  String get genresRowItemsDescription =>
      'Arată filme, seriale sau ambele în rândurile Genuri.';

  @override
  String get displayStudiosRows => 'Afișează rândul Studiouri';

  @override
  String get displayStudiosRowsSubtitle =>
      'Arată rândul Studiouri în secțiunile ecranului principal.';

  @override
  String get studiosRowSorting => 'Sortarea rândului Studiouri';

  @override
  String get studiosRowSortingDescription =>
      'Rândul Studiouri după nume, adăugate recent și altele.';

  @override
  String get studiosRowSortOrderDescription =>
      'Alege ordinea de sortare crescătoare sau descrescătoare.';

  @override
  String get selectStudiosToInclude => 'Selectează studiourile de inclus';

  @override
  String get selectStudiosToIncludeDescription =>
      'Selectează ce studiouri să fie incluse în rândul de pe ecranul principal.';

  @override
  String get selectAllStudios => 'Selectează tot';

  @override
  String get deselectAllStudios => 'Deselectează tot';

  @override
  String get tvStudiosFilter => 'Studiouri TV';

  @override
  String get movieStudiosFilter => 'Studiouri de film';

  @override
  String get selectedStudiosFilter => 'Studiouri selectate';

  @override
  String get unselectedStudiosFilter => 'Studiouri neselectate';

  @override
  String get filtersHeader => 'Filtre';

  @override
  String get showHeader => 'Arată';

  @override
  String get displayPlaylistsRows => 'Afișează rândurile cu liste de redare';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Afișează rândurile cu liste de redare în secțiunile ecranului principal.';

  @override
  String get playlistsRowSorting => 'Sortarea rândurilor cu liste de redare';

  @override
  String get playlistsRowSortingDescription =>
      'Sortează rândurile Liste de redare după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sortează rândurile Liste de redare în ordine crescătoare sau descrescătoare.';

  @override
  String get playlistsRowShowEpisodes => 'Arată episoadele individuale';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Extinde serialele pentru a afișa fiecare episod separat.';

  @override
  String get displayAudioRows => 'Afișează rândurile audio';

  @override
  String get displayAudioRowsSubtitle =>
      'Afișează rândurile audio în secțiunile ecranului principal.';

  @override
  String get audioRowsSorting => 'Sortarea rândurilor audio';

  @override
  String get audioRowsSortingDescription =>
      'Sortează rândurile Audio după data adăugării, data lansării, alfabetic și după alte criterii.';

  @override
  String get audioRowsSortOrderDescription =>
      'Sortează rândurile Audio în ordine crescătoare sau descrescătoare.';

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
  String get cardSize =>
      'Dimensiunea cardurilor din rândurile ecranului principal';

  @override
  String get externalPlayerApp => 'Aplicație de player extern';

  @override
  String get externalPlayerAppDescription =>
      'Setează un player extern pentru a activa opțiunea de redare la apăsare lungă';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Afișează selectorul de aplicații la începerea redării.';

  @override
  String get loadingInstalledPlayers => 'Se încarcă playerele instalate...';

  @override
  String get connection => 'Conexiune';

  @override
  String get locallyDecodedCodecs => 'Codecuri decodate local';

  @override
  String get transcodeTargetCodecs => 'Codecuri țintă pentru transcodare';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Acceptat pe acest dispozitiv';

  @override
  String get notSupportedOnThisDevice => 'Neacceptat pe acest dispozitiv';

  @override
  String get mediaPlayerBehavior => 'Comportamentul playerului media';

  @override
  String get playbackEnhancements => 'Îmbunătățiri ale redării';

  @override
  String get alwaysOn => 'Întotdeauna activ.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Înlocuiește „Omite genericul” cu afișarea „Urmează”';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Afișează suprapunerea „Urmează” în locul butonului „Omite genericul”.';

  @override
  String get playerRouting => 'Direcționarea playerului';

  @override
  String get preferSoftwareDecoders => 'Preferă decodoarele software';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Folosește FFmpeg (audio) și libgav1 (AV1) înaintea decodoarelor hardware. Dezactivează dacă transmiterea directă a sunetului prin HDMI nu funcționează.';

  @override
  String get useExternalPlayer => 'Folosește mereu playerul extern';

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
      'Folosește această pagină pentru a diagnostica problemele de conectivitate ale browserului (CORS, conținut mixt și setări de descoperire).';

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
      'Soluție: servește serverul media sau endpointul proxy prin HTTPS ori încarcă Moonfin prin HTTP doar în rețele locale de încredere.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Nu a fost detectată nicio configurație evidentă de conținut mixt în setările curente de execuție.';

  @override
  String get webDiagnosticsCorsChecklist => 'Listă de verificare CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Permite originea browserului în Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Include Authorization, X-Emby-Authorization și X-Emby-Token în Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Expune Content-Range și Accept-Ranges pentru streaming și derulare.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Returnează 204 la cererile preflight OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Exemplu de fragment de antet (stil nginx)';

  @override
  String get note => 'Notă';

  @override
  String get webDiagnosticsNonWebNote =>
      'Această rută de diagnosticare este destinată versiunilor web. Dacă o vezi pe altă platformă, este posibil ca aceste verificări să nu se aplice.';

  @override
  String get backToServerSelect => 'Înapoi la selectarea serverului';

  @override
  String get signOutAllUsers => 'Deconectează toți utilizatorii';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Permisiunea pentru microfon este refuzată definitiv. Activeaz-o din setările sistemului.';

  @override
  String get voiceSearchPermissionRequired =>
      'Căutarea vocală necesită permisiunea pentru microfon.';

  @override
  String get voiceSearchNoMatch => 'Nu am înțeles. Încearcă din nou.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nu a fost detectată nicio voce.';

  @override
  String get voiceSearchMicrophoneError => 'Eroare de microfon.';

  @override
  String get voiceSearchNeedsInternet =>
      'Căutarea vocală necesită conexiune la internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Serviciul vocal este ocupat. Încearcă din nou.';

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
  String get crewContributionsSeerr => 'Contribuții în echipă (Seerr)';

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
  String get achievementBadges => 'Insigne de realizări';

  @override
  String get achievementBadgesSubtitle =>
      'Insigne, ranguri și misiuni obținute din ce vizionezi';

  @override
  String get achievementsBadges => 'Insigne';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked din $total insigne';
  }

  @override
  String get achievementsUnlockToasts => 'Unlock notifications';

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
  String get achievementsQuests => 'Misiuni';

  @override
  String achievementsQuestCount(int count) {
    return '$count finalizate';
  }

  @override
  String get achievementsLeaderboard => 'Clasament';

  @override
  String get achievementsLeaderboardSubtitle =>
      'Cum te compari cu alți utilizatori de pe acest server';

  @override
  String get achievementsRecap => 'Rezumat';

  @override
  String get achievementsRecapSubtitle => 'Ce ai vizionat recent';

  @override
  String get achievementsLibraryCompletion => 'Completarea bibliotecii';

  @override
  String achievementsLibraryCount(int count) {
    return '$count biblioteci';
  }

  @override
  String achievementsScore(int score) {
    return '$score puncte';
  }

  @override
  String get achievementsScoreLabel => 'Scor';

  @override
  String get achievementsTopRank => 'Cel mai mare rang atins';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '$points puncte până la $tier';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return 'Serie de $days zile';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'Cea mai bună: $days zile';
  }

  @override
  String get achievementsShowcase => 'Vitrină';

  @override
  String get achievementsUnlocked => 'Deblocat';

  @override
  String get achievementsLocked => 'Blocat';

  @override
  String get achievementsNothingHere => 'Încă nimic aici.';

  @override
  String get achievementsHiddenBadge => 'Realizare ascunsă';

  @override
  String achievementsUnlockedOn(String date) {
    return 'Deblocat pe $date';
  }

  @override
  String achievementsPoints(int points) {
    return '$points pct.';
  }

  @override
  String get achievementsDailyQuests => 'Zilnic';

  @override
  String get achievementsWeeklyQuests => 'Săptămânal';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Schimbă misiunile zilnice';

  @override
  String get achievementsRerollWeekly => 'Schimbă misiunile săptămânale';

  @override
  String get achievementsRerollOffer => 'Schimbă acest set cu altul';

  @override
  String get achievementsRerollSpentDaily =>
      'Folosit azi, revine la miezul nopții UTC';

  @override
  String get achievementsRerollSpentWeekly =>
      'Folosit săptămâna aceasta, revine luni (UTC)';

  @override
  String get achievementsRerollConfirm => 'Schimbi aceste misiuni?';

  @override
  String get achievementsRerollConfirmBody =>
      'Ai o reînnoire zilnică și una săptămânală, iar aceasta o consumă.';

  @override
  String get achievementsRerollFailed => 'Nu s-au putut schimba misiunile.';

  @override
  String get achievementsSuggested => 'Elemente sugerate de vizionat';

  @override
  String get achievementsNoSuggestions =>
      'Nimic de sugerat pentru această insignă.';

  @override
  String get achievementsProgressLabel => 'Progres';

  @override
  String get achievementsLoadout => 'Echipament';

  @override
  String get achievementsLoadoutSubtitle =>
      'Scorul de cheltuit și bonusurile deținute';

  @override
  String get achievementsAppearance => 'Aspect';

  @override
  String get achievementsAppearanceSubtitle =>
      'Avatarul și titlul de pe profilul tău';

  @override
  String get achievementsAvatars => 'Avatare';

  @override
  String get achievementsTitles => 'Titluri';

  @override
  String get achievementsEquipped => 'Echipat';

  @override
  String get achievementsOwned => 'Deținut';

  @override
  String achievementsEarnedAt(int score) {
    return 'Obținut la un scor total de $score';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'Acest server nu are avatare sau titluri de purtat.';

  @override
  String get achievementsAppearanceFailed =>
      'Nu s-a putut schimba aspectul profilului.';

  @override
  String get achievementsPowerUps => 'Bonusuri';

  @override
  String get achievementsStats => 'Statistici';

  @override
  String get achievementsStatsSubtitle =>
      'Recordurile tale și cum se descurcă serverul';

  @override
  String get achievementsStatsWatched => 'Vizionate';

  @override
  String get achievementsStatsBests => 'Recorduri';

  @override
  String get achievementsStatsHabits => 'Obiceiuri';

  @override
  String get achievementsStatsVariety => 'Varietate';

  @override
  String get achievementsStatsServer => 'Acest server';

  @override
  String get achievementsStatsClock => 'Când vizionezi';

  @override
  String get achievementsStatItems => 'Elemente vizionate';

  @override
  String get achievementsStatMovies => 'Filme vizionate';

  @override
  String get achievementsStatSeries => 'Seriale terminate';

  @override
  String get achievementsStatHours => 'Ore vizionate';

  @override
  String get achievementsStatDays => 'Zile de vizionare';

  @override
  String get achievementsStatRewatches => 'Revizionări';

  @override
  String get achievementsStatBestWatchStreak =>
      'Cea mai lungă serie de vizionări';

  @override
  String get achievementsStatBestLoginStreak =>
      'Cea mai lungă serie de autentificări';

  @override
  String get achievementsStatMostEpisodes =>
      'Cele mai multe episoade într-o zi';

  @override
  String get achievementsStatMostMovies => 'Cele mai multe filme într-o zi';

  @override
  String get achievementsStatLongestItem => 'Cel mai lung titlu';

  @override
  String get achievementsStatBestCombo => 'Cea mai bună combinație';

  @override
  String get achievementsStatLateNight => 'Sesiuni de noapte târziu';

  @override
  String get achievementsStatEarlyMorning => 'Sesiuni de dimineață devreme';

  @override
  String get achievementsStatWeekend => 'Sesiuni de weekend';

  @override
  String get achievementsStatDaysSignedIn => 'Zile de autentificare';

  @override
  String get achievementsStatLibraries => 'Biblioteci vizitate';

  @override
  String get achievementsStatGenres => 'Genuri vizionate';

  @override
  String get achievementsStatDecades => 'Decenii vizionate';

  @override
  String get achievementsStatCountries => 'Țări vizionate';

  @override
  String get achievementsStatLanguages => 'Limbi vizionate';

  @override
  String get achievementsStatUsers => 'Utilizatori';

  @override
  String get achievementsStatBadgesUnlocked => 'Insigne deblocate';

  @override
  String get achievementsStatScoreEarned => 'Scor obținut';

  @override
  String get achievementsStatCommonBadge => 'Cea mai frecventă insignă';

  @override
  String get achievementsActivity => 'Activitate';

  @override
  String get achievementsActivitySubtitle => 'Ce a deblocat serverul recent';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user a deblocat $badge';
  }

  @override
  String get achievementsShop => 'Magazin';

  @override
  String get achievementsShopSubtitle =>
      'Cheltuiește scor pe mai multe bonusuri';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Nimic de vânzare acum.';

  @override
  String get achievementsBuyConfirm => 'Cumperi asta?';

  @override
  String get achievementsBuyConfirmBody =>
      'Se scade direct din banca ta de scor.';

  @override
  String get achievementsBuyFailed => 'Nu s-a putut cumpăra.';

  @override
  String get achievementsScoreBank => 'Banca de scor';

  @override
  String get achievementsBoost => 'Bonus XP';

  @override
  String get achievementsBoostBody =>
      'Dublează scorul timp de o oră. Dacă îl folosești din nou, ora se reia.';

  @override
  String get achievementsDoubleCredit => 'Credit dublu';

  @override
  String get achievementsDoubleCreditBody =>
      'Următorul titlu pe care îl termini contează dublu pentru insigne.';

  @override
  String get achievementsStreakFreeze => 'Înghețarea seriei';

  @override
  String get achievementsStreakFreezeBody =>
      'Acoperă o zi ratată. Poți păstra doar una.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de deținute',
      few: '$count deținute',
      one: '1 deținut',
      zero: 'Niciunul deținut',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'Rulează acum';

  @override
  String get achievementsUsePowerUp => 'Folosești acest bonus?';

  @override
  String get achievementsUsePowerUpBody => 'Se consumă imediat ce confirmi.';

  @override
  String get achievementsPowerUpFailed => 'Nu s-a putut folosi acel bonus.';

  @override
  String get achievementsHours => 'Ore';

  @override
  String get achievementsStreak => 'Serie';

  @override
  String get achievementsPeriodWeek => 'Săptămână';

  @override
  String get achievementsPeriodMonth => 'Lună';

  @override
  String get achievementsPeriodYear => 'An';

  @override
  String achievementsDaysWatched(int count) {
    return '$count zile vizionate';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '$count insigne obținute';
  }

  @override
  String get achievementsTopDirectors => 'Cei mai vizionați regizori';

  @override
  String get achievementsTopActors => 'Cei mai vizionați actori';

  @override
  String get achievementsLoadFailed =>
      'Nu s-au putut încărca realizările tale.';

  @override
  String get friends => 'Friends';

  @override
  String get friendsSubtitle =>
      'See who\'s online and chat with people on this server';

  @override
  String get friendsShowButton => 'Show friends button';

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
  String get friendsAppearOffline => 'Appear offline';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Friends always see you as offline';

  @override
  String get friendsHideNowPlaying => 'Hide what I\'m watching';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Friends still see you online, but not what\'s playing';

  @override
  String get friendsHideLastWatched => 'Hide my last watched';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Friends won\'t see what you watched last while you\'re offline';

  @override
  String get friendsMessageNotifications => 'Message notifications';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Show a banner when a friend messages you';

  @override
  String get friendsMuteDuringPlayback => 'Mute during playback';

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
      'Browserul încorporat nu este disponibil pe această platformă.';

  @override
  String get adminRestartServerConfirmation =>
      'Sigur vrei să repornești serverul?';

  @override
  String get adminShutdownServerConfirmation =>
      'Sigur vrei să oprești serverul? Va trebui să îl repornești manual.';

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
      'Nu s-au putut încărca analizele media';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Analitice combinate din toate bibliotecile media.';

  @override
  String get analyticsTopArtists => 'Top artiști';

  @override
  String get analyticsTopAuthors => 'Top autori';

  @override
  String get analyticsTopContributors => 'Top contributori';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de biblioteci',
      few: '$count biblioteci',
      one: '1 bibliotecă',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Nu sunt încă disponibile totaluri de conținut media indexat pentru această selecție.';

  @override
  String get analyticsLibraryDetails => 'Detalii despre bibliotecă';

  @override
  String get analyticsLibraryBreakdown => 'Detalierea bibliotecilor';

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
  String get adminDrawerSectionLiveTv => 'Live TV';

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
      'Nu este disponibil niciun endpoint de citire pentru carte';

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
  String get loadingShuffle => 'Se încarcă amestecarea...';

  @override
  String get libraryShuffleLabel => 'AMESTECARE DIN BIBLIOTECĂ';

  @override
  String get randomShuffleLabel => 'AMESTECARE ALEATORIE';

  @override
  String get genresShuffleLabel => 'AMESTECARE PE GENURI';

  @override
  String get autoHdrSwitching => 'Comutare automată HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Activează automat HDR la redarea videoclipurilor HDR și restabilește modul de afișare la ieșire.';

  @override
  String get whenFullscreen => 'Pe ecran complet';

  @override
  String get changeArtwork => 'Schimbă ilustrațiile';

  @override
  String get missing => 'Lipsă';

  @override
  String get transcodingLimits => 'Limite de transcodare';

  @override
  String get clearAllArtworkButton => 'Ștergi toate ilustrațiile?';

  @override
  String get clearAllArtworkWarning =>
      'Sigur vrei să ștergi toate ilustrațiile descărcate?';

  @override
  String get confirmClear => 'Confirmă ștergerea';

  @override
  String confirmClearMessage(String itemType) {
    return 'Sigur vrei să ștergi această ilustrație ($itemType)?';
  }

  @override
  String get uploadButton => 'Încarci?';

  @override
  String get resolutionLabel => 'Rezoluție: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Afișează doar ilustrațiile în limba interfeței';

  @override
  String get confirmClearAll => 'Confirmați ștergerea tuturor';

  @override
  String get imageUploadSuccess => 'Imaginea a fost încărcată cu succes!';

  @override
  String imageUploadFailed(String error) {
    return 'Nu s-a putut încărca imaginea: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Nu s-a putut seta imaginea: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Nu s-a putut șterge imaginea: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Nu s-au putut șterge toate ilustrațiile: $error';
  }

  @override
  String get yes => 'Da';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Imagini de fundal';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniatură';

  @override
  String get artCategory => 'Ilustrație';

  @override
  String get discArtCategory => 'Ilustrație disc';

  @override
  String get screenshotCategory => 'Captură de ecran';

  @override
  String get boxCoverCategory => 'Copertă cutie';

  @override
  String get boxRearCoverCategory => 'Coperta din spate a cutiei';

  @override
  String get menuArtCategory => 'Ilustrație meniu';

  @override
  String get confirmItemPoster => 'poster';

  @override
  String get confirmItemBackdrop => 'imagine de fundal';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniatură';

  @override
  String get confirmItemArt => 'ilustrație';

  @override
  String get confirmItemDiscArt => 'ilustrație disc';

  @override
  String get confirmItemScreenshot => 'captură de ecran';

  @override
  String get confirmItemBoxCover => 'copertă cutie';

  @override
  String get confirmItemBoxRearCover => 'coperta din spate a cutiei';

  @override
  String get confirmItemMenuArt => 'ilustrație meniu';

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
  String get audiobookFocusedTimeline => 'Cronologie focalizată';

  @override
  String get audiobookFullTimeline => 'Cronologie completă';

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
  String get audiobookNoteHint => 'Scrie o notiță pentru acest moment';

  @override
  String get audiobookSleepTimer => 'Temporizator de adormire';

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
    return 'Înapoi $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Înainte $seconds s';
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
  String get audiobookNoBookmarks => 'Încă niciun marcaj';

  @override
  String get audiobookNoNotes => 'Încă nicio notiță';

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
      'Modifică modurile de subtitrare, limbile implicite, aspectul și opțiunile de randare.';

  @override
  String get subtitleRendering => 'Randarea subtitrărilor';

  @override
  String get displayOptions => 'Opțiuni de afișare';

  @override
  String get releaseDateAscending => 'Data lansării (crescător)';

  @override
  String get releaseDateDescending => 'Data lansării (descrescător)';

  @override
  String get groupContributions => 'Grupează contribuțiile';

  @override
  String get groupMultipleRoles => 'Grupează rolurile multiple';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Avertisment privind accesul de scriere în bibliotecă';

  @override
  String get libraryWriteAccessHowToFix => 'Cum poți rezolva:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Acordă permisiuni de scriere utilizatorului serviciului Jellyfin (de ex. jellyfin sau PUID/PGID din Docker) pentru folderele bibliotecii media de pe server.\n\n2. Sau accesează panoul de control Jellyfin -> Biblioteci, editează această bibliotecă și dezactivează „Salvează ilustrațiile în folderele media” pentru a stoca ilustrațiile în baza de date internă a Jellyfin.';

  @override
  String get dismiss => 'Închide';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Biblioteca ta „$libraryName” este configurată să salveze ilustrațiile direct în folderele media (opțiunea „Salvează ilustrațiile în folderele media” este activată). Totuși, Jellyfin a testat accesul de scriere și nu are permisiunea de a scrie fișiere în acest director:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Se pare că Jellyfin nu a reușit să actualizeze ilustrația. Biblioteca ta este configurată să salveze ilustrațiile direct în folderele media (opțiunea „Salvează ilustrațiile în folderele media” este activată). Această eroare apare de obicei atunci când procesul serverului Jellyfin nu are permisiunea de a scrie fișiere în directoarele tale media.';

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
  String dateCreatedFormat(Object date) {
    return 'Data adăugării: $date';
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
      'Adâncimea de biți video nu este acceptată.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Rata de cadre video nu este acceptată.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Rata de biți a fișierului depășește limita de streaming a playerului.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Rata de biți video depășește limita de streaming.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Rata de biți audio depășește limita de streaming.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Numărul de canale audio nu este acceptat.';

  @override
  String transcodeAudioCodecWithCodec(String codec) {
    return 'Codecul audio ($codec) nu este acceptat direct.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'Sfat: Dacă receiverul sau soundbarul tău acceptă $codec, activează Transmiterea directă audio în setările Audio.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Numărul de canale audio (${channels}ch) depășește limita playerului.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'Sfat: Ajustează „Numărul maxim de canale audio” sau reducerea multicanal în setările Audio.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'Subtitrările ASS/SSA necesită transcodare deoarece redarea directă este dezactivată.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'Sfat: Activează „Redare directă ASS/SSA” în setările de Redare pentru a reda direct, fără transcodare.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'Subtitrările PGS necesită transcodare deoarece redarea directă este dezactivată.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'Sfat: Activează „Redare directă PGS” în setările de Redare pentru a reda direct, fără transcodare.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Formatul subtitrării ($codec) nu este acceptat direct și trebuie încorporat în imagine.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'Rata de biți a fișierului ($fileBitrate) depășește limita de streaming configurată ($maxBitrate).';
  }

  @override
  String get transcodeBitrateHint =>
      'Sfat: Mărește „Rata maximă de biți” în setările de Redare pentru a permite streamingul direct.';

  @override
  String get transcodeResolutionHint =>
      'Sfat: Mărește „Rezoluția maximă” în setările de Redare pentru a permite streamingul direct.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'Gama dinamică video (de ex. Dolby Vision / HDR) nu este acceptată de acest ecran.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'Redarea directă a stratului de îmbunătățire Dolby Vision Profile 7 este dezactivată.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'Sfat: Activează „Redare directă Dolby Vision Profile 7” în setările de Redare dacă ecranul tău o acceptă.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'Conform setărilor utilizatorului, se preferă transcodarea pentru varianta de rezervă Dolby Vision.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'Sfat: Setează „Varianta de rezervă Dolby Vision” la „Redă ca HDR10” în setările de Redare pentru a evita transcodarea.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'Ecranul conectat nu raportează suport pentru HDR sau Dolby Vision.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'Ecranul conectat nu are suportul HDR10 necesar pentru varianta de rezervă Dolby Vision.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'Frecvența de eșantionare audio nu este acceptată.';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'Adâncimea de biți audio nu este acceptată.';

  @override
  String get transcodeRefFramesNotSupported =>
      'Cadrele de referință video depășesc limitele playerului.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'Videoclipul anamorfic nu este acceptat.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'Videoclipul întrețesut nu este acceptat.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'Fluxul audio secundar necesită transcodare.';

  @override
  String get transcodeDirectPlayError =>
      'Redarea directă nu este acceptată pentru acest format media.';

  @override
  String get sortAlphabetical => 'Alfabetic';

  @override
  String get sortReleaseAscending => 'Ordinea lansării (crescător)';

  @override
  String get sortReleaseDescending => 'Ordinea lansării (descrescător)';

  @override
  String get sortCustomDragDrop => 'Personalizat (trage și plasează)';

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
      'Impeller este motorul GPU modern al Flutter, pentru animații mai fluide și mai puține sacadări. Pe unele TV box-uri și plăci grafice mai vechi poate provoca artefacte sau imagine neagră; dezactivează-l dacă observi astfel de probleme. Opțiunea Automat alege cea mai bună valoare implicită pentru dispozitivul tău. Repornește Moonfin pentru a aplica modificarea.';

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
      'Moonfin trebuie repornit pentru a schimba motorul de randare. Închide aplicația acum, apoi redeschide-o pentru a aplica modificarea.';

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
    return 'Se încarcă analiticele serverului... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'La fel ca sursa';

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

  @override
  String get addToWatchlist => 'Adaugă în lista de vizionare';

  @override
  String get removeFromWatchlist => 'Elimină din lista de vizionare';

  @override
  String get watchlistUpdateFailed =>
      'Nu s-a putut actualiza lista de vizionare';

  @override
  String get adminSearchParameters => 'Parametri de căutare';

  @override
  String get adminCurrentMetadata => 'Metadate curente';

  @override
  String get adminLabelYear => 'An';

  @override
  String get adminLabelImdbId => 'ID IMDb';

  @override
  String get adminLabelTmdbMovieId => 'ID film TheMovieDb';

  @override
  String get adminLabelTmdbBoxSetId => 'ID colecție TheMovieDb';

  @override
  String get adminLabelTvdbBoxSetId => 'ID colecție TheTVDB';

  @override
  String get adminLabelTvdbId => 'ID numeric TheTVDB';

  @override
  String get adminLabelTvdbSlug => 'ID film TheTVDB (slug)';

  @override
  String get adminReplaceImages => 'Înlocuiește imaginile existente';

  @override
  String get adminBackToSearch => 'Înapoi la criteriile de căutare';

  @override
  String get grouping => 'Grupare';

  @override
  String get groupByType => 'Grupează după tip';

  @override
  String get playlistTypes => 'Tipuri de liste de redare';

  @override
  String get playlistTypeVideo => 'Video';

  @override
  String get playlistTypeMusicVideo => 'Videoclip muzical';

  @override
  String get playlistTypeAudio => 'Audio (muzică)';

  @override
  String get playlistTypeAudiobook => 'Carte audio';

  @override
  String get playlistTypeBook => 'Carte';

  @override
  String get playlistTypePhoto => 'Fotografie';

  @override
  String get playlistTypeMixed => 'Mixt';

  @override
  String get videoPlaylistsSection => 'Liste de redare video';

  @override
  String get musicVideoPlaylistsSection =>
      'Liste de redare cu videoclipuri muzicale';

  @override
  String get audioPlaylistsSection => 'Liste de redare audio';

  @override
  String get audiobookPlaylistsSection => 'Liste de redare cu cărți audio';

  @override
  String get bookPlaylistsSection => 'Liste de redare cu cărți';

  @override
  String get photoPlaylistsSection => 'Liste de redare foto';

  @override
  String get mixedPlaylistsSection => 'Liste de redare mixte';

  @override
  String get currentTime => 'Ora curentă';

  @override
  String get playbackTimeDisplay => 'Timpul barei de progres';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Alege ce etichete de timp apar în jurul barei de progres a redării.';

  @override
  String get playbackTimeTotal => 'Durată totală';

  @override
  String get playbackTimeRemaining => 'Timp rămas';

  @override
  String get playbackTimeEndsAt => 'Se termină la';

  @override
  String get playbackTimeElapsed => 'Timp scurs';

  @override
  String get playbackTimeVideoSection => 'Player video';

  @override
  String get playbackTimeMusicSection => 'Player muzical';

  @override
  String get playbackTimeSlotDescription =>
      'Alege ce se afișează aici sau ascunde.';

  @override
  String get playbackTimeAboveBarLeft => 'Deasupra barei, stânga';

  @override
  String get playbackTimeAboveBarCenter => 'Deasupra barei, centru';

  @override
  String get playbackTimeAboveBarRight => 'Deasupra barei, dreapta';

  @override
  String get playbackTimeBelowBarLeft => 'Sub bară, stânga';

  @override
  String get playbackTimeBelowBarCenter => 'Sub bară, centru';

  @override
  String get playbackTimeBelowBarRight => 'Sub bară, dreapta';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Alege ce se afișează în partea dreaptă a barei de progres pentru muzică.';

  @override
  String get groupByTitle => 'Grupează după';

  @override
  String get groupByDecade => 'Deceniu (an)';

  @override
  String get groupByParentalRating => 'Evaluare parentală';

  @override
  String get groupByStudio => 'Studio';

  @override
  String get showAlphabeticalFilters => 'Arată alfabetul';

  @override
  String get personalRatingStyle => 'Stilul evaluării personale';

  @override
  String get personalRatingThumbs => 'Îmi place / Nu-mi place';

  @override
  String get personalRatingStars => '5 stele';

  @override
  String get personalRatingNumeric => 'Scor numeric din 10';

  @override
  String get rate => 'Evaluează';

  @override
  String get like => 'Îmi place';

  @override
  String get dislike => 'Nu-mi place';

  @override
  String get personalRatingClear => 'Șterge evaluarea';

  @override
  String get personalRatingRated => 'Evaluat';

  @override
  String get personalRatingMine => 'Evaluarea mea';

  @override
  String get personalRatingSaveFailed => 'Nu s-a putut salva evaluarea';

  @override
  String get increase => 'Mărește';

  @override
  String get decrease => 'Micșorează';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'În desfășurare';

  @override
  String get filterUnreleased => 'Nelansat';

  @override
  String get filterTrailers => 'Trailere';

  @override
  String get filterExtras => 'Bonusuri';

  @override
  String get filterThemeSongs => 'Melodii tematice';

  @override
  String get filterThemeVideos => 'Videoclipuri tematice';

  @override
  String get source => 'Sursă';

  @override
  String get years => 'Ani';

  @override
  String get audioLanguage => 'Limba audio';

  @override
  String get subtitleLanguage => 'Limba subtitrărilor';

  @override
  String get clearFilters => 'Șterge filtrele';

  @override
  String get seerrShortcutsRow => 'Răsfoire Seerr';

  @override
  String get seerrReleased => 'Lansat';

  @override
  String get seerrMinRating => 'Evaluare minimă';

  @override
  String get seerrMinVotes => 'Voturi minime';

  @override
  String get seerrOriginalLanguage => 'Limba originală';

  @override
  String get seerrRuntime => 'Durată';

  @override
  String get subtitleHdrSeparate => 'Stil HDR separat';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'Albul este mult mai luminos în HDR decât în SDR, așa că un stil mai estompat aici evită strălucirea excesivă';

  @override
  String get scrollSensitivity => 'Sensibilitatea derulării';

  @override
  String get scrollSensitivitySubtitle =>
      'Cât derulează un clic al rotiței mouse-ului';

  @override
  String get mediaDetailsAndSpoilers => 'Detaliile media și spoilerele';

  @override
  String get openTrailersExternally =>
      'Deschide trailerele într-o aplicație externă';

  @override
  String get openTrailersExternallySubtitle =>
      'Trailerele se deschid în aplicația YouTube sau în browser, nu în playerul încorporat';

  @override
  String get hideDetailsMediaDescription =>
      'Ascunde descrierea media din pagina de detalii';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Ascunde textul descriptiv al filmului sau episodului.';

  @override
  String get detailUseSeriesThumbnails =>
      'Folosește miniaturile serialului în pagina de detalii';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Înlocuiește toate miniaturile din pagina de detalii clasică cu miniatura serialului';

  @override
  String get hideHomeMediaDescription =>
      'Ascunde descrierea media de pe ecranul principal';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Ascunde textul descriptiv al filmului sau episodului.';

  @override
  String get continueWatchingAndNextUpHeader =>
      'Continuă vizionarea și Următorul episod';

  @override
  String get setupSkip => 'Omite configurarea';

  @override
  String get setupNavbarQuestion => 'Unde ar trebui să meargă navigarea?';

  @override
  String get setupMediaBarQuestion =>
      'Cum ar trebui să arate partea de sus a ecranului principal?';

  @override
  String get setupHomeRowsQuestion => 'Cum ar trebui să arate rândurile tale?';

  @override
  String get setupDetailQuestion =>
      'Cum ar trebui să arate un film sau un serial când îl deschizi?';

  @override
  String get setupTourQuestion => 'Ești gata. Iată ce mai găsești aici.';

  @override
  String get setupPlaybackLanguages => 'Limbi pentru redare';

  @override
  String get setupOptional => 'Opțional';

  @override
  String get setupStyleClassic => 'Clasic';

  @override
  String get setupStyleModern => 'Modern';

  @override
  String get setupRowsClassicHint =>
      'Compact. Mai multe rânduri pe ecran deodată.';

  @override
  String get setupRowsModernHint => 'Carduri mai mari cu titlurile dedesubt.';

  @override
  String get setupDetailClassicHint => 'Totul centrat într-o singură coloană.';

  @override
  String get setupDetailModernHint =>
      'Cinematic, cu file pentru distribuție și bonusuri.';

  @override
  String get setupStyleSpotlight => 'Spotlight';

  @override
  String get setupDetailSpotlightHint =>
      'Cu accent pe imaginea principală, cu carduri pop-up pentru distribuție și bonusuri.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint =>
      'Pe tot ecranul, cu secțiunile așezate una sub alta, în loc de file.';

  @override
  String get setupStyleMinimalist => 'Minimalist';

  @override
  String get setupDetailMinimalistHint =>
      'Ilustrații, un singur buton de redare și episoadele.';

  @override
  String get setupNavbarStyleQuestion => 'Cum ar trebui să arate bara de jos?';

  @override
  String get setupNavbarStyleDockHint =>
      'O pilulă plutitoare cu etichete sub fiecare filă.';

  @override
  String get setupNavbarStyleSplitHint =>
      'Căutarea are propriul buton, iar bara se micșorează în timp ce derulezi.';

  @override
  String get setupNavbarStyleStripHint =>
      'O bară pe toată lățimea, de-a lungul marginii de jos.';

  @override
  String get setupPickALook => 'Alege un aspect';

  @override
  String get setupTourMoreHeader => 'Mai multe te așteaptă în Setări';

  @override
  String get setupTourBulletRequests => 'Cereri Seerr';

  @override
  String get setupTourBulletSyncPlay => 'Vizionări de grup SyncPlay';

  @override
  String get setupTourBulletThemes => 'Teme personalizate';

  @override
  String get setupTourBulletDownloads => 'Descărcări offline';

  @override
  String get setupTourBulletMore => 'Și multe altele';

  @override
  String get runSetupAgain => 'Rulează din nou configurarea';

  @override
  String get serverMessages => 'Mesaje';

  @override
  String get serverMessagesEmpty => 'Încă niciun mesaj de la serverul tău';

  @override
  String get serverMessagesMarkAllRead => 'Marchează totul ca citit';

  @override
  String get serverMessagesShowButton => 'Arată butonul de mesaje';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Adaugă un buton în meniu pentru mesajele trimise de administratorul serverului';

  @override
  String get showBookDiscoverTab => 'Arată descoperirea în biblioteca de cărți';

  @override
  String get showBookDiscoverTabDescription =>
      'Răsfoiește titluri din Open Library și LibriVox în bibliotecile tale de cărți și cărți audio';

  @override
  String get autoDownloadNewEpisodes => 'Descarcă automat episoadele noi';

  @override
  String get autoDownloadStop => 'Oprește descărcarea automată';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Descarcă episoade noi, maximum $count nevizionate deodată',
      few: 'Descarcă episoade noi, maximum $count nevizionate deodată',
      one: 'Descarcă episoade noi, maximum 1 nevizionat deodată',
      zero: 'Descarcă fiecare episod nou',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'Activat • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Calitățile transcodate se descarcă doar cât timp Moonfin este deschis. Calitatea originală se descarcă și în fundal.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'Descărcările transcodate nu pot fi reluate după o întrerupere și pornesc de la capăt. Calitatea originală poate fi reluată.';

  @override
  String get autoDownloadForegroundOnly =>
      'Se descarcă doar cât timp Moonfin este deschis';

  @override
  String get autoDownloadQualityTitle => 'Calitatea descărcării automate';

  @override
  String autoDownloadEnabledFor(String title) {
    return 'Descărcarea automată activată pentru $title';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return 'Descărcarea automată oprită pentru $title';
  }

  @override
  String get autoDownloadSection => 'Descărcări automate';

  @override
  String get autoDownloadEnable => 'Activează descărcările automate';

  @override
  String get autoDownloadEnableSubtitle =>
      'Descarcă episoadele noi ale serialelor pe care le urmărești. Episoadele existente pot fi descărcate în continuare manual.';

  @override
  String get autoDownloadKeepUnwatched => 'Păstrează episoadele nevizionate';

  @override
  String get autoDownloadKeepAll => 'Toate';

  @override
  String get autoDownloadDelete => 'Șterge episoadele descărcate';

  @override
  String get autoDownloadDeleteSubtitle =>
      'Când să se elimine automat episoadele descărcate automat după ce le vizionezi';

  @override
  String get autoDownloadDeleteNever => 'Niciodată';

  @override
  String get autoDownloadDeleteImmediately => 'Imediat după vizionare';

  @override
  String get autoDownloadDeleteAfterDay => 'La 1 zi după vizionare';

  @override
  String get autoDownloadDeleteAfterWeek => 'La 1 săptămână după vizionare';

  @override
  String get autoDownloadBackgroundRefresh => 'Verifică în fundal';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Permite sistemului să verifice periodic dacă există episoade noi cât timp Moonfin este închis';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Reîmprospătarea aplicațiilor în fundal este dezactivată pentru Moonfin. Activeaz-o în Setările iOS.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Utilizarea în fundal este restricționată pentru Moonfin în Setările Android.';

  @override
  String get autoDownloadCheckNow => 'Verifică acum';

  @override
  String get autoDownloadChecking => 'Se verifică...';

  @override
  String get autoDownloadNeverChecked => 'Nu a fost verificat încă';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued de episoade adăugate în coadă',
      few: '$queued episoade adăugate în coadă',
      one: '1 episod adăugat în coadă',
      zero: 'nimic nou',
    );
    return 'Ultima verificare $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Ultima verificare $when a eșuat: $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Seriale urmărite';

  @override
  String get autoDownloadNoSubscriptions =>
      'Deschide un serial și alege „Descarcă automat episoadele noi” din meniul său de descărcare';

  @override
  String get autoDownloadRemove => 'Nu mai urmări';

  @override
  String get autoDownloadStorageFull => 'Spațiu de stocare insuficient';

  @override
  String get autoDownloadWaitingForWifi => 'Se așteaptă WiFi';

  @override
  String get downloadNotificationRunning => 'Se descarcă';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'Se descarcă ($done/$total)';
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
      other: 'Descărcări finalizate',
      one: 'Descărcare finalizată',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name salvat pentru offline';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de elemente salvate pentru offline',
      few: '$count elemente salvate pentru offline',
      one: '1 element salvat pentru offline',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de episoade',
      few: '$count episoade',
      one: '1 episod',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'Descărcarea a eșuat';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Mesaj de la distanță';

  @override
  String get serverMessagesNotificationReceived => 'Mesaj primit';

  @override
  String get downloadStorageLimitReached =>
      'Limita de stocare a fost atinsă. Eliberează spațiu sau mărește limita.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Spațiu de stocare insuficient: $needed necesari, $free liberi';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Spațiu de stocare insuficient pentru episoadele noi';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de episoade așteaptă spațiu.',
      few: '$count episoade așteaptă spațiu.',
      one: '$name are nevoie de $size.',
    );
    return '$_temp0 Eliberează spațiu sau mărește limita de descărcare.';
  }

  @override
  String get settingsAnimationSpeed => 'Viteza animațiilor';

  @override
  String get pageTransitions => 'Tranziții între pagini';

  @override
  String get pageTransitionsSubtitle =>
      'Ajustează durata estompării la navigarea între pagini';

  @override
  String get navigationSpeed => 'Viteza de navigare';

  @override
  String get navigationSpeedSubtitle =>
      'Ajustează cât de repede se mută indicatorul de focalizare între elemente și rânduri';

  @override
  String get modernCardsTransitionSpeed =>
      'Viteza tranziției cardurilor moderne';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Ajustează viteza animației la extinderea cardurilor moderne focalizate';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Amână extinderea cardurilor la derulare rapidă';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Așteaptă ca mișcarea focalizării să se oprească înainte de a extinde cardurile moderne';

  @override
  String get animationSpeedExtraSlow => 'Foarte lentă';

  @override
  String get animationSpeedSlow => 'Lentă';

  @override
  String get animationSpeedMedium => 'Medie';

  @override
  String get animationSpeedFast => 'Rapidă';

  @override
  String get animationSpeedOff => 'Oprit';

  @override
  String get pageTransitionFadeNone => 'Fără estompare';

  @override
  String get pageTransitionFadeShort => 'Estompare scurtă';

  @override
  String get pageTransitionFadeMedium => 'Estompare medie';

  @override
  String get pageTransitionFadeLong => 'Estompare lungă';

  @override
  String get siriRemoteSwipeSensitivity =>
      'Sensibilitatea glisării pe touchpad';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'Cât se mută focalizarea la fiecare glisare pe touchpadul telecomenzii Siri Remote';

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
      'Ține videoclipul departe de Dynamic Island';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'În orientarea peisaj, carcasa camerei acoperă o margine a ecranului. Această opțiune ține imaginea la distanță de ea, ceea ce schimbă ceva doar pentru videoclipurile suficient de late încât să ajungă acolo.';

  @override
  String get bottomNavbarStyle => 'Stilul barei de jos';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Împărțită';

  @override
  String get bottomNavbarStyleStrip => 'Bandă';

  @override
  String get bottomNavbarTabs => 'Filele barei de jos';

  @override
  String get bottomNavbarTabsDescription =>
      'Fixează până la 3 file între Acasă și Tu. Restul se găsesc în meniul Tu.';

  @override
  String get bottomNavbarTabsAutomatic => 'Automat';

  @override
  String get bottomNavbarTabsPinned => 'Fixate';

  @override
  String get bottomNavbarTabsAvailable => 'Disponibile';

  @override
  String get bottomNavbarTabsReset => 'Resetează la Automat';

  @override
  String get bottomNavbarTabsLimit =>
      'Poți fixa cel mult 3 file. Elimină una pentru a fixa alta.';

  @override
  String get bottomNavbarTabTurnedOff => 'Dezactivat la Butoane';

  @override
  String get bottomNavbarSplitSearchNote =>
      'În stilul Împărțit, Căutarea are întotdeauna propriul buton.';

  @override
  String get bottomNavbarButtonsNote =>
      'Acestea stabilesc ce file poți fixa în bara de jos și ce apare în meniul Tu.';

  @override
  String get navYou => 'Tu';
}
