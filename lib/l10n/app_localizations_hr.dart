// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'POSTAVKE RAČUNA';

  @override
  String get interfaceLanguage => 'Jezik sučelja';

  @override
  String get systemLanguageDefault => 'Zadano sustavom';

  @override
  String get signIn => 'Prijavite se';

  @override
  String get empty => 'Prazno';

  @override
  String connectingToServer(String serverName) {
    return 'Povezivanje s poslužiteljem $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get back => 'Natrag';

  @override
  String get serverUnavailable => 'Poslužitelj je nedostupan';

  @override
  String get loginFailed => 'Prijava nije uspjela';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect nije dostupan: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nije dostupan ($status): $detail';
  }

  @override
  String get whosWatching => 'Tko gleda?';

  @override
  String get addUser => 'Dodaj korisnika';

  @override
  String get selectServer => 'Odaberite poslužitelj';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin verzija $version';
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
    return 'Ukloniti „$serverName” s popisa poslužitelja?';
  }

  @override
  String get cancel => 'Otkazati';

  @override
  String get remove => 'Ukloni';

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
  String get detailScreenStyle => 'Stil zaslona s detaljima';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasični je izvorni centrirani Moonfin raspored. Moderni je responzivni filmski raspored.';

  @override
  String get detailScreenStyleMoonfin => 'Klasični';

  @override
  String get detailScreenStyleModern => 'Moderni';

  @override
  String get expandedTabs => 'Proširene kartice';

  @override
  String get expandedTabsSubtitle =>
      'Automatski prikazuj sadržaj kartice dok pregledavate kartice. Isključite za ručno otvaranje i zatvaranje svake kartice.';

  @override
  String get showTechnicalDetails => 'Prikazati tehničke detalje?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Prikaži kodek, razlučivost i podatke o streamu u sažetku na banneru';

  @override
  String get recommendationSystem => 'Sustav preporuka';

  @override
  String get recommendationSystemSubtitle =>
      'Koristite algoritam lokalne biblioteke Moonfin Recommends ili mrežne TMDb metrike sličnosti. Napomena: mrežne preporuke zahtijevaju Seerr integraciju.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb sličnost';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Primijeniti ograničenje dobne ocjene?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Ograniči prijedloge značajke Moonfin Recommends prema dobnoj ocjeni odabranog sadržaja';

  @override
  String get interfaceStyle => 'Stil sučelja';

  @override
  String get interfaceStyleSubtitle =>
      'Automatski se prilagođava vašem uređaju. Odaberite Apple ili Material za željeni izgled.';

  @override
  String get interfaceStyleAutomatic => 'Automatski';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Kvaliteta stakla';

  @override
  String get glassQualitySubtitle =>
      'Automatski odabire najbolji efekt stakla za ovaj uređaj. Puna nameće stvarno zamućenje, a Smanjena koristi lagano staklo koje štedi GPU.';

  @override
  String get glassQualityAuto => 'Automatski';

  @override
  String get glassQualityFull => 'Puna';

  @override
  String get glassQualityReduced => 'Smanjena';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Prebacite se između Moonfin i Neon Pulse bez ponovnog pokretanja aplikacije';

  @override
  String get customThemeTitle => 'Prilagođena tema';

  @override
  String get customThemeSubtitle =>
      'Prilagođene teme mijenjaju vizualne elemente u cijelom Moonfinu. Odaberite jednu od ovih opcija koja odgovara vašem stilu.';

  @override
  String get keyboardPreferSystemIme => 'Preferiraj sistemsku tipkovnicu';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Za unos teksta zadano koristi način unosa vašeg uređaja';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Trenutačni Moonfin izgled koji ste svi zavoljeli';

  @override
  String get themeNeonPulse => 'Neonski puls';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stil s magenta sjajem, cijan tekstom i jačim kromiranim kontrastom';

  @override
  String get themeGlass => 'Staklo';

  @override
  String get themeGlassSubtitle =>
      'Stil tekućeg stakla s pomičnom gradijentnom pozadinom, matiranim površinama i Apple-plavim naglaskom';

  @override
  String get theme8BitHero => '8-bitni heroj';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixel-art stil s izraženom paletom, blokovskim rubovima, oštrim sjenama i pikselnim fontom';

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
    return 'Povezivanje s $target nije uspjelo';
  }

  @override
  String get exitApp => 'Napustiti Moonfin?';

  @override
  String get exitAppConfirmation => 'Jeste li sigurni da želite izaći?';

  @override
  String get exit => 'Izlaz';

  @override
  String get gameMenu => 'Izbornik';

  @override
  String get gamePaused => 'Pauzirano';

  @override
  String get gameSaveState => 'Spremi stanje';

  @override
  String get games => 'Igre';

  @override
  String get gameLoadState => 'Učitaj stanje';

  @override
  String get gameFastForward => 'Ubrzano naprijed';

  @override
  String get gameEmulatorSettings => 'Postavke emulatora';

  @override
  String get gameNoCoreOptions => 'Ova jezgra nema podesivih opcija.';

  @override
  String get gameHoldToOpenMenu => 'Držite za otvaranje izbornika';

  @override
  String get gamePlaybackUnsupported =>
      'Pokretanje igara još nije podržano na ovom uređaju.';

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
  String get series => 'Serije';

  @override
  String get noItemsFound => 'Nema pronađenih stavki';

  @override
  String get home => 'Početna';

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
  String get library => 'Biblioteka';

  @override
  String get displaySettings => 'Postavke zaslona';

  @override
  String get allGenres => 'Svi žanrovi';

  @override
  String get noGenresFound => 'Nema pronađenih žanrova';

  @override
  String failedToLoadFolderError(String error) {
    return 'Učitavanje mape nije uspjelo: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ova mapa je prazna';

  @override
  String itemCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stavki',
      few: '$count stavke',
      one: '$count stavka',
    );
    return '$_temp0';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stavki',
      few: '$count stavke',
      one: '$count stavka',
    );
    return '$_temp0';
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
    return '$name — žanrovi';
  }

  @override
  String get views => 'Pogledi';

  @override
  String get albums => 'Albumi';

  @override
  String get albumArtists => 'Izvođači albuma';

  @override
  String get artists => 'Izvođači';

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
    return 'prije $count min';
  }

  @override
  String hoursAgo(int count) {
    return 'prije $count h';
  }

  @override
  String daysAgo(int count) {
    return 'prije $count d';
  }

  @override
  String get discoverySubjects => 'Predmeti otkrića';

  @override
  String get pickDiscoverySubjects =>
      'Odaberite koji će se feedovi tema prikazati u Discoveru.';

  @override
  String get apply => 'Primijeni';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count naslova',
      few: '$count naslova',
      one: '$count naslov',
    );
    return '$_temp0';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autora',
      few: '$count autora',
      one: '$count autor',
    );
    return '$_temp0';
  }

  @override
  String genresCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count žanrova',
      few: '$count žanra',
      one: '$count žanr',
    );
    return '$_temp0';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% dovršeno';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count naslova raspoređeno za pregledavanje s naglaskom na čitanju.',
      few:
          '$count naslova raspoređena za pregledavanje s naglaskom na čitanju.',
      one: '$count naslov raspoređen za pregledavanje s naglaskom na čitanju.',
    );
    return '$_temp0';
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
    return 'Nema rezultata za $label';
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
  String get watched => 'Gledano';

  @override
  String get unread => 'Nepročitano';

  @override
  String get unwatched => 'Negledano';

  @override
  String get seriesStatus => 'Status serije';

  @override
  String get allLibraries => 'Sve knjižnice';

  @override
  String get books => 'knjige';

  @override
  String get latestBooks => 'Najnovije knjige';

  @override
  String get latestAudiobooks => 'Najnovije audioknjige';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knjiga',
      few: '$count knjige',
      one: '$count knjiga',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Knjiga';

  @override
  String get bookFormatAudiobook => 'Audioknjiga';

  @override
  String bookPercentRead(int percent) {
    return '$percent% pročitano';
  }

  @override
  String bookTimeLeft(String time) {
    return 'još $time';
  }

  @override
  String get bookHeroRead => 'Čitaj';

  @override
  String get bookHeroListen => 'Slušaj';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odjeljaka',
      few: '$count odjeljka',
      one: '$count odjeljak',
    );
    return '$_temp0';
  }

  @override
  String firstPublished(int year) {
    return 'Prvi put objavljeno $year.';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knjiga',
      few: '$count knjige',
      one: '$count knjiga',
    );
    return '$_temp0';
  }

  @override
  String get couldNotLoadSubject => 'Trenutačno ne mogu učitati ovu temu.';

  @override
  String get audiobookDetails => 'Pojedinosti o audioknjigi';

  @override
  String authorsCountTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autora',
      few: '$count autora',
      one: '$count autor',
    );
    return '$_temp0';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audioknjiga',
      few: '$count audioknjige',
      one: '$count audioknjiga',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Popis pjesama';

  @override
  String get itemListPlaceholder => 'Ovdje će se pojaviti popis stavki';

  @override
  String get failedToLoad => 'Učitavanje nije uspjelo';

  @override
  String get delete => 'Izbriši';

  @override
  String get save => 'Spremi';

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
  String get seasons => 'Sezone';

  @override
  String get chapters => 'poglavlja';

  @override
  String get features => 'Značajke';

  @override
  String get movies => 'Filmovi';

  @override
  String get musicVideos => 'Glazbeni spotovi';

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
    return 'Disk $number';
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
    return 'Objavljeno $year.';
  }

  @override
  String get publicationDateUnknown => 'Datum objave nepoznat';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sezona',
      few: '$count sezone',
      one: '$count sezona',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Završava u $time';
  }

  @override
  String get items => 'Stavke';

  @override
  String get extras => 'Dodaci';

  @override
  String get behindTheScenes => 'Iza scene';

  @override
  String get deletedScenes => 'Izbrisane scene';

  @override
  String get featurettes => 'Kratki prilozi';

  @override
  String get interviews => 'Intervjui';

  @override
  String get scenes => 'Scene';

  @override
  String get shorts => 'Kratki filmovi';

  @override
  String get trailers => 'Najave';

  @override
  String timeRemaining(String time) {
    return 'još $time';
  }

  @override
  String endsIn(String time) {
    return 'Završava za $time';
  }

  @override
  String get view => 'Pogled';

  @override
  String get resumeReading => 'Nastavite s čitanjem';

  @override
  String get read => 'čitati';

  @override
  String resumeFrom(String position) {
    return 'Nastavi od $position';
  }

  @override
  String get play => 'Reproduciraj';

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
  String get cast => 'Prenesi';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Najava';

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
  String get finalizingDownload => 'Finalizing…';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Preimenuj popis pjesama';

  @override
  String get playlistName => 'Naziv popisa za reprodukciju';

  @override
  String get deleteDownloadedAlbum => 'Izbriši preuzeti album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Izbrisati preuzete pjesme za „$title”?';
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
    return 'Nema učitanih stavki: $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Preuzimanje: $title ($count stavki)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Jeste li sigurni da želite izbrisati „$name” s poslužitelja? Ova se radnja ne može poništiti.';
  }

  @override
  String get itemDeleted => 'Stavka izbrisana';

  @override
  String get noPlayableTrailerFound => 'Nije pronađena najava za reprodukciju.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Nepodržani format knjige: .$extension';
  }

  @override
  String get audioTrack => 'Audio zapis';

  @override
  String get subtitleTrack => 'Zapis titlova';

  @override
  String get none => 'Ništa';

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
    return 'Titl preuzet i odabran: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Podnaslov je preuzet. Može proći neko vrijeme da se pojavi dok Jellyfin ne osvježi stavku.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nisu pronađeni mrežni titlovi za $language.';
  }

  @override
  String get selectVersion => 'Odaberite verziju';

  @override
  String versionNumber(int number) {
    return 'Verzija $number';
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
    return 'Preuzimanje: $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Brisanje preuzetih datoteka';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Izbrisati lokalne datoteke za $typeLabel?\n\nTime ćete osloboditi prostor za pohranu. Možete ih ponovno preuzeti kasnije.';
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
  String get directors => 'REDATELJI';

  @override
  String get writer => 'SCENARIST';

  @override
  String get writers => 'SCENARISTI';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count više';
  }

  @override
  String totalEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count epizoda',
      few: '$count epizode',
      one: '$count epizoda',
    );
    return '$_temp0';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Epizoda $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Poglavlje $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pjesama',
      few: '$count pjesme',
      one: '$count pjesma',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poglavlja',
      few: '$count poglavlja',
      one: '$count poglavlje',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Rođenje: $date';
  }

  @override
  String died(String date) {
    return 'Smrt: $date';
  }

  @override
  String age(int age) {
    return 'Dob: $age';
  }

  @override
  String get showLess => 'Prikaži manje';

  @override
  String get readMore => 'Pročitajte više';

  @override
  String get shuffle => 'Nasumično';

  @override
  String get shuffleAllMusic => 'Nasumično pusti svu glazbu';

  @override
  String get carSignInPrompt => 'Prijavite se u Moonfin na telefonu';

  @override
  String get carServerUnreachable => 'Poslužitelj nije dostupan';

  @override
  String downloadsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count preuzimanja',
      few: '$count preuzimanja',
      one: '$count preuzimanje',
    );
    return '$_temp0';
  }

  @override
  String get perfectMatch => 'Savršen spoj';

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
    return 'Radnja „$action” za mrežne titlove zahtijeva Jellyfin dopuštenje za upravljanje titlovima za ovog korisnika.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Ova stavka nije pronađena na poslužitelju za radnju „$action” s mrežnim titlovima.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Radnja „$action” za mrežne titlove nije uspjela: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Radnja „$action” za mrežne titlove nije uspjela (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Radnja „$action” za mrežne titlove nije uspjela.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'sve preuzete epizode za „$name”';
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
    return 'Radnja „$label” nije uspjela: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Postavljanje glasnoće za Cast nije uspjelo: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Kontrole – $label';
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
    return 'Zaustavi $label';
  }

  @override
  String get queueIsEmpty => 'Red čekanja je prazan';

  @override
  String trackNumber(int number) {
    return 'Pjesma $number';
  }

  @override
  String get remotePlayback => 'Udaljena reprodukcija';

  @override
  String get castingToGoogleCast => 'Emitiranje na Google Cast';

  @override
  String get castingViaAirPlay => 'Emitiranje putem AirPlay';

  @override
  String get castingViaDlna => 'Emitiranje putem DLNA';

  @override
  String secondsCount(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds sekundi',
      few: '$seconds sekunde',
      one: '$seconds sekunda',
    );
    return '$_temp0';
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
  String get auto => 'Automatski';

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
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
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
  String get player => 'Player';

  @override
  String get container => 'Kontejner';

  @override
  String get bitrate => 'Brzina prijenosa';

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
  String get track => 'Zapis';

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
    return 'Greška $protocol sesije';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Učitavanje podataka o knjizi nije uspjelo: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB renderiranje u aplikaciji još nije dostupno na ovoj platformi.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Ovaj format (.$extension) još se ne može prikazati u aplikaciji.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Ugrađeno iscrtavanje dokumenata nije dostupno na ovoj platformi.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nije moguće otvoriti vanjski preglednik.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Otvaranje čitača u aplikaciji nije uspjelo: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Oznaka je već spremljena na $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Oznaka dodana: $label';
  }

  @override
  String get noBookmarksYet =>
      'Još nema oznaka.\nDodirnite ikonu oznake dok čitate da biste spremili svoju poziciju.';

  @override
  String get noTableOfContentsAvailable => 'Nema dostupnog sadržaja';

  @override
  String pageLabel(int number) {
    return 'Stranica $number';
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
    return '$percent% pročitano';
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
    return 'Poništi zumiranje (${zoom}x)';
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
    return 'Ažuriranje statusa čitanja nije uspjelo: $error';
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
    return 'Ova platforma ne može pokrenuti ugrađeni mehanizam za dokumente za $extension datoteke.';
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
    return 'Učitavanje TV vodiča nije uspjelo: $error';
  }

  @override
  String get noChannelsFound => 'Nema pronađenih kanala';

  @override
  String get liveBadge => 'ŽIVJETI';

  @override
  String guideNextProgram(String time, String title) {
    return 'Sljedeće: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'još $minutes min';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'još $hours h';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'još $hours h $minutes min';
  }

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
  String get record => 'Snimi';

  @override
  String get cancelRecordingAction => 'Otkaži snimanje';

  @override
  String get programSetToRecord => 'Emisija je zakazana za snimanje';

  @override
  String get recordingCancelled => 'Snimanje je otkazano';

  @override
  String get unableToCreateRecording => 'Nije moguće stvoriti snimku';

  @override
  String get watch => 'Gledaj';

  @override
  String get close => 'Zatvori';

  @override
  String failedToPlayChannel(String name) {
    return 'Reprodukcija kanala $name nije uspjela';
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
    return 'Otkazati zakazano snimanje emisije „$name”?';
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
    return 'Zaustaviti snimanje serije „$name”?';
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
    return 'Nema rezultata za „$query”';
  }

  @override
  String searchFailedError(String error) {
    return 'Pretraživanje nije uspjelo: $error';
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
    return 'Ukloniti „$name” i pripadajuće datoteke?';
  }

  @override
  String tracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pjesama',
      few: '$count pjesme',
      one: '$count pjesma',
    );
    return '$_temp0';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Reproduciraj album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Učitavanje albuma nije uspjelo: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Nema preuzetih pjesama za $name.';
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
    return 'Ukloniti „$name”?';
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
    return 'Epizoda $number';
  }

  @override
  String get seriesNotFound => 'Serija nije pronađena';

  @override
  String get errorLoadingSeries => 'Pogreška pri učitavanju serije';

  @override
  String get downloadedEpisodes => 'Preuzete epizode';

  @override
  String seasonNumber(int number) {
    return 'Sezona $number';
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
    return 'Izbrisati sve preuzete epizode u $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count epizoda',
      few: '$count epizode',
      one: '$count epizoda',
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbrisati $count preuzetih stavki?',
      few: 'Izbrisati $count preuzete stavke?',
      one: 'Izbrisati $count preuzetu stavku?',
    );
    return '$_temp0';
  }

  @override
  String get musicAndAudiobooks => 'Glazba i audio knjige';

  @override
  String get images => 'Slike';

  @override
  String get database => 'Baza podataka';

  @override
  String ofStorageLimit(String limit) {
    return 'od ograničenja $limit';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opcija',
      few: '$count opcije',
      one: '$count opcija',
    );
    return '$_temp0';
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
  String get themeMusicSettingsSubtitle =>
      'Stranice s detaljima, redovi na početnom zaslonu i glasnoća';

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
  String get loopThemeMusic => 'Ponavljaj tematsku glazbu';

  @override
  String get loopThemeMusicSubtitle =>
      'Ponavljaj pjesmu umjesto jednokratne reprodukcije';

  @override
  String get detailsBackgroundBlur => 'Zamućenje pozadine detalja';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value px';
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
  String get settingsScrollWheelAction => 'Kotačić miša';

  @override
  String get settingsScrollWheelActionDescription =>
      'Odaberite što radi pomicanje kotačića miša preko videa tijekom reprodukcije.';

  @override
  String get scrollWheelActionOff => 'Isključeno';

  @override
  String get scrollWheelActionSeek => 'Premotavanje (naprijed / natrag)';

  @override
  String get scrollWheelActionVolume => 'Glasnoća';

  @override
  String get playerTooltipVolume => 'Glasnoća';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Automatsko obrezivanje';

  @override
  String get stretch => 'Istegnite se';

  @override
  String get refreshRateSwitching => 'Promjena brzine osvježavanja';

  @override
  String get disabled => 'Onemogućeno';

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
  String get fallbackAudioLanguage => 'Rezervni jezik zvuka';

  @override
  String get preferDefaultAudioTrack => 'Preferiraj zadani audiozapis';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Preferiraj izvorni audiozapis umjesto lokalizirane sinkronizacije.';

  @override
  String get preferAudioDescription => 'Preferiraj zapise s audiodeskripcijom';

  @override
  String get preferAudioDescriptionDescription =>
      'Preferiraj zapise s audiodeskripcijom umjesto uobičajenih zapisa.';

  @override
  String get transcodingAudio => 'Transkodiranje (zvuk)';

  @override
  String get directStreamRemux => 'Izravni stream (remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transkodiranje (brzina prijenosa ili razlučivost)';

  @override
  String get transcodingVideoAndAudio => 'Transkodiranje (video i zvuk)';

  @override
  String get transcodingVideo => 'Transkodiranje (video)';

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
  String get settingsAudioOutputMode => 'Način izlaza zvuka';

  @override
  String get settingsAudioOutputModeDescription =>
      'Odaberite kako se zvuk dekodira. AVR Passthrough šalje neobrađene Dolby/DTS streamove vašem prijamniku, dok Auto ili Downmix dekodiraju lokalno.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Rezervni audiokodek';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Odaberite ciljni format za transkodiranje višekanalnog zvuka kada se izvorni stream ne može izravno reproducirati ni proslijediti.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Automatsko otkrivanje\n(preporučeno)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(zadano)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(bez gubitaka)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(samo stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(učinkovit)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(bez gubitaka)';

  @override
  String get settingsMaxAudioChannels => 'Najveći broj audiokanala';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Postavite najveći broj kanala vaše audiokonfiguracije. Višekanalni streamovi koji premašuju ovo ograničenje bit će downmiksani ili transkodirani.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Automatsko otkrivanje\n(zadano hardverom)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 kvadrofonija';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (napredno)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough kodeka';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Omogućite samo formate koje podržava vaš AVR ili HDMI uređaj.';

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
      'Šalji Dolby Digital Plus (EAC3) bitstream vanjskom dekoderu.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Šalji Dolby Atmos preko EAC3 (JOC) bitstream vanjskom dekoderu.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Šalji DTS-HD MA bitstream (uključuje DTS core) vanjskom dekoderu.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Šalji Dolby TrueHD bitstream s Atmos metapodacima vanjskom dekoderu.';

  @override
  String get settingsDetectedAudioCapabilities => 'Otkrivene audiomogućnosti';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Snimka mogućnosti tijekom izvođenja još nije dostupna.';

  @override
  String get settingsAudioRouteLabel => 'Ruta';

  @override
  String get settingsAudioDecodeLabel => 'Dekodiranje';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD audioruta';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Zvučnik';

  @override
  String get settingsAudioRouteHeadphones => 'Slušalice';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Dijagnostika';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Video razina';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Video raspon';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Kodek titlova';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Dopušteni audiokodeci';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS audiokodeci';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 audiokodeci';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Aktivna audioruta';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Podrška rute za HD zvuk';

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
    return '$value s';
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
    return 'Nakon $episodes epizoda / $hours h';
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
  String get skipBackLength => 'Duljina premotavanja unatrag';

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
  String get pathToMpvConf => '/putanja/do/mpv.conf';

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
  String get subtitleMode => 'Način titlova';

  @override
  String get subtitleModeFlagged => 'Označeni';

  @override
  String get subtitleModeAlways => 'Uvijek';

  @override
  String get subtitleModeForeign => 'Strani jezik';

  @override
  String get subtitleModeForced => 'Prisilni';

  @override
  String get subtitleModeFlaggedDescription =>
      'Reproducira zapise koji su u metapodacima medijske datoteke označeni kao „default” ili „forced”.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Automatski učitava i prikazuje titlove svaki put kad video započne.';

  @override
  String get subtitleModeForeignDescription =>
      'Automatski uključuje titlove ako je zadani audiozapis na stranom jeziku.';

  @override
  String get subtitleModeForcedDescription =>
      'Učitava samo titlove izričito označene oznakom „forced” u metapodacima.';

  @override
  String get subtitleModeNoneDescription =>
      'Potpuno onemogućuje automatsko učitavanje titlova.';

  @override
  String get fallbackSubtitleLanguage => 'Rezervni jezik titlova';

  @override
  String get subtitleStream => 'Stream titlova';

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
    return 'Učitane su postavke profila $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Učitavanje postavki profila $profile nije uspjelo.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Lokalne postavke sinkronizirane su s profilom $profile.';
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
  String get reportDownloadsActivity => 'Prikaži preuzimanja na poslužitelju';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Dopustite administratoru poslužitelja da na nadzornoj ploči vidi vaša transkodirana preuzimanja';

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
  String get navbarAlwaysExpanded =>
      'Uvijek proširi natpise navigacijske trake';

  @override
  String get showSeerrButton => 'Prikaži Seerr gumb';

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
  String get teal => 'Tirkizna';

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
  String get posterLabel => 'Plakat';

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
  String get groupItemsIntoCollections => 'Grupiraj stavke u kolekcije';

  @override
  String get hideCollectionAssociatedItems =>
      'Sakrij stavke biblioteke povezane s kolekcijom pri pregledavanju biblioteka';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Obavijest o grupiranju biblioteke';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Da biste koristili ovu postavku, provjerite jesu li postavke biblioteke „Grupiraj filmove u kolekcije” i/ili „Grupiraj serije u kolekcije” omogućene u postavkama prikaza vaše biblioteke na Jellyfin ili Emby poslužitelju.';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odabrano',
      few: '$count odabrane',
      one: '$count odabrana',
    );
    return '$_temp0';
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
      'Odaberite između različitih stilova medijske trake ili isključite medijsku traku';

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
  String get trailerAudio => 'Zvuk najava';

  @override
  String get enableTrailerAudio => 'Omogući zvuk za najave u medijskoj traci';

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
  String get fullScreenRows => 'Prošireni redovi početnog zaslona';

  @override
  String get fullScreenRowsDescription => 'Ograniči na 1 red po zaslonu';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Vrsta slike po redu';

  @override
  String get perRowSettings => 'Postavke po retku';

  @override
  String get autoLogin => 'Automatska prijava';

  @override
  String get lastUser => 'Zadnji korisnik';

  @override
  String get currentUser => 'Trenutni korisnik';

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
  String get mode => 'Način';

  @override
  String get libraryArt => 'Knjižnica čl';

  @override
  String get logo => 'Logotip';

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
  String get clockModeStatic => 'Statični';

  @override
  String get clockModeBouncing => 'Odbijajući';

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
  String get pluginLabel => 'Moonbase dodatak';

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
    return '$status\nVerzija: $version';
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
  String get seerrDiscoveryRows => 'Seerr redovi otkrivanja';

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
  String get seerrNotificationsSection => 'Obavijesti';

  @override
  String get seerrNotifyNewRequestsTitle => 'Obavijesti o novim zahtjevima';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Obavijesti me kad netko pošalje zahtjev';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Ažuriranja zahtjeva';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Odobreno, odbijeno i dodano u vašu biblioteku';

  @override
  String get seerrNotifyIssuesTitle => 'Ažuriranja problema';

  @override
  String get seerrNotifyIssuesSubtitle => 'Novi problemi, odgovori i rješenja';

  @override
  String loggedInAs(String username) {
    return 'Prijavljeni ste kao: $username';
  }

  @override
  String get discoverRows => 'Seerr stranica za otkrivanje';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Omogućite retke koje želite vidjeti na Seerr početnoj stranici. Povucite za promjenu redoslijeda. Prilagođeni redoslijed sinkronizira se s dodatkom Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Omogućite retke koje želite vidjeti na Seerr početnoj stranici. Povucite za promjenu redoslijeda. Prilagođeni redoslijed sinkronizira se s dodatkom Moonbase.';

  @override
  String get enabled => 'Omogućeno';

  @override
  String get hidden => 'Skriven';

  @override
  String get aboutTitle => 'Oko';

  @override
  String versionValue(String version) {
    return 'Verzija $version';
  }

  @override
  String get openSourceLicenses => 'Licence otvorenog koda';

  @override
  String get sourceCode => 'Izvorni kod';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'Dostupno ažuriranje: v$version';
  }

  @override
  String get updateNotifications => 'Obavijesti o ažuriranju';

  @override
  String get showWhenUpdatesAvailable => 'Prikaži kada su dostupna ažuriranja';

  @override
  String updateAvailableTitle(String version) {
    return 'Dostupna verzija v$version';
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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Ograničenje predmemorije slika';

  @override
  String get clearImageCache => 'Očisti predmemoriju slika';

  @override
  String get imageCacheCleared => 'Predmemorija slika je očišćena';

  @override
  String get clear => 'Očisti';

  @override
  String get browse => 'Pregledaj';

  @override
  String get noResults => 'Nema rezultata';

  @override
  String get seerrAvailableStatus => 'na raspolaganju';

  @override
  String get seerrRequestedStatus => 'Zatraženo';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Preuzimanje · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Uvoz';

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stavki',
      few: '$count stavke',
      one: '$count stavka',
    );
    return '$_temp0';
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
    return 'Zatražio/la: $name';
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
    return 'Otkazati zahtjev za „$title”?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Otkazati $count zahtjeva za „$title”?',
      few: 'Otkazati $count zahtjeva za „$title”?',
      one: 'Otkazati $count zahtjev za „$title”?',
    );
    return '$_temp0';
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
    return 'Proračun: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Prihod: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Zatraži $type';
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
  String get appearances => 'Filmografija';

  @override
  String get crewSection => 'Posada';

  @override
  String ageValue(int age) {
    return 'dob $age';
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
  String get failedStatus => 'Neuspješno';

  @override
  String get processingStatus => 'U obradi';

  @override
  String modifiedByName(String name) {
    return 'Izmijenio/la: $name';
  }

  @override
  String get completedStatus => 'Dovršeno';

  @override
  String get requestErrorDuplicate => 'Ovaj je naslov već zatražen';

  @override
  String get requestErrorQuota => 'Dosegnuto je ograničenje zahtjeva';

  @override
  String get requestErrorBlocklisted => 'Ovaj je naslov na popisu blokiranih';

  @override
  String get requestErrorNoSeasons => 'Nema više sezona koje se mogu zatražiti';

  @override
  String get requestErrorPermission =>
      'Nemate dopuštenje za slanje ovog zahtjeva';

  @override
  String get seerrRequestsTitle => 'Zahtjevi';

  @override
  String get seerrIssuesTitle => 'Problemi';

  @override
  String get sortNewest => 'Najnovije';

  @override
  String get sortLastModified => 'Zadnje izmijenjeno';

  @override
  String get noIssues => 'Nema problema';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Preostalo $remaining od $limit zahtjeva za filmove';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Preostalo $remaining od $limit zahtjeva za sezone';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Dio kolekcije $name';
  }

  @override
  String get viewCollection => 'Prikaži kolekciju';

  @override
  String get requestCollection => 'Zatraži kolekciju';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmova · $available dostupno';
  }

  @override
  String requestMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zatraži $count filmova',
      few: 'Zatraži $count filma',
      one: 'Zatraži $count film',
    );
    return '$_temp0';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Slanje zahtjeva $current od $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zatraženo $count filmova',
      few: 'Zatražena $count filma',
      one: 'Zatražen $count film',
    );
    return '$_temp0';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Zatraženo $ok od $total filmova';
  }

  @override
  String get collectionAllRequested =>
      'Svi su filmovi već dostupni ili zatraženi';

  @override
  String get reportIssue => 'Prijavi problem';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Zvuk';

  @override
  String get whatsWrong => 'Što nije u redu?';

  @override
  String get allEpisodes => 'Sve epizode';

  @override
  String get episode => 'Epizoda';

  @override
  String get openStatus => 'Otvoreno';

  @override
  String get resolvedStatus => 'Riješeno';

  @override
  String get resolveAction => 'Riješi';

  @override
  String get reopenAction => 'Ponovno otvori';

  @override
  String reportedByName(String name) {
    return 'Prijavio/la: $name';
  }

  @override
  String commentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count komentara',
      few: '$count komentara',
      one: '$count komentar',
    );
    return '$_temp0';
  }

  @override
  String get addComment => 'Dodajte komentar';

  @override
  String get deleteIssueConfirm => 'Izbrisati ovaj problem?';

  @override
  String get submitReport => 'Pošalji prijavu';

  @override
  String get tmdbScore => 'TMDB rezultat';

  @override
  String get releaseDateLabel => 'Datum izlaska';

  @override
  String get firstAirDateLabel => 'Prvi datum emitiranja';

  @override
  String get revenueLabel => 'Prihod';

  @override
  String get runtimeLabel => 'Trajanje';

  @override
  String get budgetLabel => 'Proračun';

  @override
  String get originalLanguageLabel => 'Izvorni jezik';

  @override
  String get seasonsLabel => 'Sezone';

  @override
  String get episodesLabel => 'Epizode';

  @override
  String get access => 'Pristup';

  @override
  String get add => 'Dodaj';

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
  String get general => 'Općenito';

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
  String get next => 'Dalje';

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
  String get remote => 'Udaljeno';

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
  String get search => 'Pretraži';

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
  String get stop => 'Zaustavi';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Vrijeme';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Deinstaliraj';

  @override
  String get up => 'Gore';

  @override
  String get update => 'Ažurirati';

  @override
  String get upload => 'Prijenos';

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
  String get adminDrawerLibraries => 'Biblioteke';

  @override
  String get adminDrawerDisplay => 'Prikaz';

  @override
  String get adminDrawerMetadata => 'Metapodaci';

  @override
  String get adminDrawerNfo => 'NFO postavke';

  @override
  String get adminDrawerTranscoding => 'Transkodiranje';

  @override
  String get adminDrawerResume => 'Nastavi';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
    return 'Dostupna ažuriranja dodataka: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Dodaci koji zahtijevaju ponovno pokretanje: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Neuspjeli zakazani zadaci: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Nedavna upozorenja/greške: $count';
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
    return 'Greška: $error';
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
    return 'Naredba nije uspjela: $error';
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
  String get sessionNext => 'Sljedeće';

  @override
  String get sessionVolumeDown => 'svezak –';

  @override
  String get sessionVolumeUp => 'Gl. +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Sada svira';

  @override
  String get volume => 'Glasnoća';

  @override
  String get actions => 'Radnje';

  @override
  String get videoCodec => 'Video kodek';

  @override
  String get audioCodec => 'Audio kodek';

  @override
  String get hwAccel => 'HW ubrzanje';

  @override
  String get completion => 'Završetak';

  @override
  String get direct => 'Izravno';

  @override
  String get adminDisconnect => 'Prekini vezu';

  @override
  String get adminClearDates => 'Jasni datumi';

  @override
  String get adminActivitySeverityAll => 'Sve razine ozbiljnosti';

  @override
  String get adminActivityDateRange => 'Raspon datuma';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Učitavanje zapisnika aktivnosti nije uspjelo: $error';
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
    return 'Ažuriranje uređaja nije uspjelo: $error';
  }

  @override
  String get adminDeleteDevice => 'Izbriši uređaj';

  @override
  String get adminDeviceDeleted => 'Uređaj izbrisan';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Brisanje uređaja nije uspjelo: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Ukloniti uređaj „$name”? Korisnik će se morati ponovno prijaviti na ovom uređaju.';
  }

  @override
  String get adminDeleteAllDevices => 'Izbriši sve uređaje';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ukloniti $count uređaja? Zahvaćeni korisnici morat će se ponovno prijaviti. Vaš trenutni uređaj nije zahvaćen.',
      few:
          'Ukloniti $count uređaja? Zahvaćeni korisnici morat će se ponovno prijaviti. Vaš trenutni uređaj nije zahvaćen.',
      one:
          'Ukloniti $count uređaj? Zahvaćeni korisnici morat će se ponovno prijaviti. Vaš trenutni uređaj nije zahvaćen.',
    );
    return '$_temp0';
  }

  @override
  String get adminDevicesDeletedAll => 'Uređaji su uklonjeni';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Neki su uređaji uklonjeni; $count nije bilo moguće ukloniti.';
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
    return 'Pokretanje skeniranja nije uspjelo: $error';
  }

  @override
  String get adminRenameLibrary => 'Preimenuj biblioteku';

  @override
  String get adminNewName => 'Novo ime';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteka je preimenovana u „$name”';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Preimenovanje nije uspjelo: $error';
  }

  @override
  String get adminDeleteLibrary => 'Izbriši biblioteku';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteka „$name” je izbrisana';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Brisanje biblioteke nije uspjelo: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Dodavanje putanje nije uspjelo: $error';
  }

  @override
  String get adminRemovePath => 'Ukloni put';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Ukloniti „$path” iz ove biblioteke?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Uklanjanje putanje nije uspjelo: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opcije biblioteke spremljene';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Spremanje opcija nije uspjelo: $error';
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
  String get adminLibraryTabPaths => 'Putanje';

  @override
  String get adminLibraryTabOptions => 'Opcije';

  @override
  String get adminLibraryTabDownloaders => 'Preuzimatelji';

  @override
  String get adminLibMetadataSavers => 'Spremanje metapodataka';

  @override
  String get adminLibSubtitleDownloaders => 'Preuzimatelji titlova';

  @override
  String get adminLibLyricDownloaders => 'Preuzimatelji tekstova pjesama';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Preuzimatelji metapodataka: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Dohvaćanje slika: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Ovaj poslužitelj ne nudi preuzimatelje za ovu vrstu biblioteke.';

  @override
  String get adminLibrarySectionGeneral => 'Općenito';

  @override
  String get adminLibrarySectionMetadata => 'Metapodaci';

  @override
  String get adminLibrarySectionEmbedded => 'Ugrađeni podaci';

  @override
  String get adminLibrarySectionSubtitles => 'Titlovi';

  @override
  String get adminLibrarySectionImages => 'Slike';

  @override
  String get adminLibrarySectionSeries => 'Serije';

  @override
  String get adminLibrarySectionMusic => 'Glazba';

  @override
  String get adminLibrarySectionMovies => 'Filmovi';

  @override
  String get adminLibRealtimeMonitor => 'Omogući nadzor u stvarnom vremenu';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Otkrij promjene datoteka i automatski ih obradi.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Tretiraj arhive kao medijske datoteke';

  @override
  String get adminLibEnablePhotos => 'Prikaži fotografije';

  @override
  String get adminLibSaveLocalMetadata => 'Spremi grafiku u medijske mape';

  @override
  String get adminLibRefreshInterval => 'Automatsko osvježavanje metapodataka';

  @override
  String get adminLibRefreshNever => 'Nikad';

  @override
  String get adminLibDefault => 'Zadano';

  @override
  String get adminLibDisplayTitle => 'Prikaz';

  @override
  String get adminLibDisplaySection => 'Prikaz biblioteke';

  @override
  String get adminLibFolderView =>
      'Prikaži prikaz mapa za obične medijske mape';

  @override
  String get adminLibSpecialsInSeasons =>
      'Prikaži specijalne epizode unutar sezona u kojima su emitirane';

  @override
  String get adminLibGroupMovies => 'Grupiraj filmove u kolekcije';

  @override
  String get adminLibGroupShows => 'Grupiraj serije u kolekcije';

  @override
  String get adminLibExternalSuggestions =>
      'Prikaži vanjski sadržaj u prijedlozima';

  @override
  String get adminLibDateAddedSection => 'Ponašanje datuma dodavanja';

  @override
  String get adminLibDateAddedLabel => 'Koristi datum dodavanja iz';

  @override
  String get adminLibDateAddedImport => 'Datum skeniranja u biblioteku';

  @override
  String get adminLibDateAddedFile => 'Datum stvaranja datoteke';

  @override
  String get adminLibMetadataTitle => 'Metapodaci i slike';

  @override
  String get adminLibMetadataLangSection => 'Željeni jezik metapodataka';

  @override
  String get adminLibChaptersSection => 'Poglavlja';

  @override
  String get adminLibDummyChapterDuration =>
      'Trajanje zamjenskog poglavlja (sekunde)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Duljina poglavlja koja se generiraju za medije bez njih. Postavite na 0 za onemogućivanje.';

  @override
  String get adminLibChapterImageResolution => 'Razlučivost slike poglavlja';

  @override
  String get adminLibNfoTitle => 'NFO postavke';

  @override
  String get adminLibNfoHelp =>
      'NFO metapodaci kompatibilni su s Kodijem i sličnim klijentima. Postavke se primjenjuju na sve biblioteke koje spremaju NFO metapodatke.';

  @override
  String get adminLibKodiUser =>
      'Korisnik čiji se podaci o gledanju spremaju u NFO datoteke';

  @override
  String get adminLibSaveImagePaths => 'Spremi putanje slika u NFO datoteke';

  @override
  String get adminLibPathSubstitution =>
      'Omogući zamjenu putanja za putanje slika u NFO datotekama';

  @override
  String get adminLibExtraThumbs =>
      'Kopiraj extrafanart slike u mapu extrathumbs';

  @override
  String get adminLibNone => 'Ništa';

  @override
  String adminLibRefreshDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dana',
      few: '$days dana',
      one: '$days dan',
    );
    return '$_temp0';
  }

  @override
  String get adminLibEmbeddedTitles => 'Koristi ugrađene naslove';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Koristi ugrađene naslove za dodatke';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Koristi ugrađene podatke o epizodama';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Dopusti ugrađene titlove';

  @override
  String get adminLibEmbeddedAllowAll => 'Dopusti sve';

  @override
  String get adminLibEmbeddedAllowText => 'Samo tekst';

  @override
  String get adminLibEmbeddedAllowImage => 'Samo slika';

  @override
  String get adminLibEmbeddedAllowNone => 'Ništa';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Preskoči preuzimanje ako postoje ugrađeni titlovi';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Preskoči preuzimanje ako se audiozapis podudara s jezikom preuzimanja';

  @override
  String get adminLibRequirePerfectMatch =>
      'Zahtijevaj savršeno podudaranje titlova';

  @override
  String get adminLibSaveSubtitlesWithMedia => 'Spremi titlove u medijske mape';

  @override
  String get adminLibChapterImageExtraction => 'Izdvoji slike poglavlja';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Izdvoji slike poglavlja tijekom skeniranja biblioteke';

  @override
  String get adminLibTrickplayExtraction =>
      'Omogući izdvajanje trickplay slika';

  @override
  String get adminLibTrickplayDuringScan =>
      'Izdvoji trickplay slike tijekom skeniranja biblioteke';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Spremi trickplay slike u medijske mape';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automatski spoji serije raspoređene u više mapa';

  @override
  String get adminLibSeasonZeroName => 'Prikazani naziv sezone nula';

  @override
  String get adminLibLufsScan =>
      'Omogući LUFS skeniranje za normalizaciju zvuka';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Preferiraj nestandardnu oznaku izvođača';

  @override
  String get adminLibAutoAddToCollection =>
      'Automatski dodaj filmove u kolekcije';

  @override
  String get adminLibraryNameRequired => 'Potreban je naziv biblioteke';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Stvaranje biblioteke nije uspjelo: $error';
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
    return 'Onemogućiti korisnika $name? Neće se moći prijaviti.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Omogućiti korisnika $name? Moći će se ponovno prijaviti.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Korisnik „$name” je onemogućen';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Korisnik „$name” je omogućen';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Ažuriranje pravila korisnika nije uspjelo: $error';
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
    return 'Stvaranje korisnika nije uspjelo: $error';
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
    return 'Spremanje nije uspjelo: $error';
  }

  @override
  String get adminPermissionsSaved => 'Dopuštenja su spremljena';

  @override
  String get adminPasswordsMismatch => 'Lozinke se ne podudaraju';

  @override
  String adminFailed(String error) {
    return 'Neuspješno: $error';
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
  String get adminParentalControl => 'Roditeljski nadzor';

  @override
  String get adminMaxParentalRating => 'Najviša dopuštena dobna ocjena';

  @override
  String get adminMaxParentalRatingHint =>
      'Sadržaj s višom ocjenom bit će skriven ovom korisniku.';

  @override
  String get adminParentalRatingNone => 'Ništa';

  @override
  String get adminBlockUnratedItems =>
      'Blokiraj stavke bez ocjene ili s neprepoznatom ocjenom';

  @override
  String get adminUnratedBook => 'Knjige';

  @override
  String get adminUnratedChannelContent => 'Kanali';

  @override
  String get adminUnratedLiveTvChannel => 'TV uživo';

  @override
  String get adminUnratedMovie => 'Filmovi';

  @override
  String get adminUnratedMusic => 'Glazba';

  @override
  String get adminUnratedTrailer => 'Najave';

  @override
  String get adminUnratedSeries => 'Serije';

  @override
  String get adminAccessSchedules => 'Rasporedi pristupa';

  @override
  String get adminAccessSchedulesHint =>
      'Dopusti pristup samo tijekom dolje navedenih termina. Ako raspored nije postavljen, pristup je dopušten cijeli dan.';

  @override
  String get adminAddSchedule => 'Dodaj raspored';

  @override
  String get adminScheduleDay => 'Dan';

  @override
  String get adminScheduleStart => 'Početak';

  @override
  String get adminScheduleEnd => 'Kraj';

  @override
  String get adminDayEveryday => 'Svaki dan';

  @override
  String get adminDayWeekday => 'Radni dan';

  @override
  String get adminDayWeekend => 'Vikend';

  @override
  String get adminDaySunday => 'Nedjelja';

  @override
  String get adminDayMonday => 'Ponedjeljak';

  @override
  String get adminDayTuesday => 'Utorak';

  @override
  String get adminDayWednesday => 'Srijeda';

  @override
  String get adminDayThursday => 'Četvrtak';

  @override
  String get adminDayFriday => 'Petak';

  @override
  String get adminDaySaturday => 'Subota';

  @override
  String get adminAllowedTags => 'Dopuštene oznake';

  @override
  String get adminAllowedTagsHint =>
      'Prikazuje se samo sadržaj s ovim oznakama. Ostavite prazno za dopuštanje svega.';

  @override
  String get adminBlockedTags => 'Blokirane oznake';

  @override
  String get adminBlockedTagsHint =>
      'Sadržaj s ovim oznakama skriven je ovom korisniku.';

  @override
  String get adminAddTag => 'Dodaj oznaku';

  @override
  String get adminEnabledDevices => 'Omogućeni uređaji';

  @override
  String get adminEnabledChannels => 'Omogućeni kanali';

  @override
  String get adminAuthProvider => 'Pružatelj autentifikacije';

  @override
  String get adminPasswordResetProvider => 'Pružatelj poništavanja lozinke';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Najveći broj neuspjelih pokušaja prijave prije zaključavanja';

  @override
  String get adminLoginAttemptsHint =>
      'Postavite na 0 za zadano ili -1 za onemogućivanje zaključavanja.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay pristup';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Dopusti stvaranje grupa i pridruživanje grupama';

  @override
  String get adminSyncPlayJoin => 'Dopusti pridruživanje grupama';

  @override
  String get adminSyncPlayNone => 'Bez pristupa';

  @override
  String get adminContentDeletionFolders => 'Dopusti brisanje sadržaja iz';

  @override
  String get adminResetPasswordWarning =>
      'Ovo će ukloniti lozinku. Korisnik će se moći prijaviti bez lozinke.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Poslužitelj je vratio HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Jeste li sigurni da želite izbrisati korisnika $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Korisnik „$name” je izbrisan';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Brisanje korisnika nije uspjelo: $error';
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
    return 'Stvaranje ključa nije uspjelo: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Token ključa nedostaje u odgovoru poslužitelja';

  @override
  String get adminRevokeApiKey => 'Opozovi API ključ';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Opozvati ključ za $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API ključ opozvan';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Opoziv ključa nije uspio: $error';
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
    return 'Token: $token\\nStvoreno: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Stvori sigurnosnu kopiju';

  @override
  String get adminBackupInclude =>
      'Odaberite što će biti uključeno u sigurnosnu kopiju.';

  @override
  String get adminBackupDatabase => 'Baza podataka';

  @override
  String get adminBackupDatabaseAlways => 'Uvijek uključeno';

  @override
  String get adminBackupMetadata => 'Metapodaci';

  @override
  String get adminBackupSubtitles => 'Titlovi';

  @override
  String get adminBackupTrickplay => 'Trickplay slike';

  @override
  String get adminCreatingBackup => 'Izrada sigurnosne kopije...';

  @override
  String get adminBackupCreated => 'Sigurnosna kopija je uspješno stvorena';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Stvaranje sigurnosne kopije nije uspjelo: $error';
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
    return 'Učitavanje manifesta nije uspjelo: $error';
  }

  @override
  String get adminConfirmRestore => 'Potvrdite vraćanje';

  @override
  String get adminRestoringBackup => 'Vraćanje sigurnosne kopije...';

  @override
  String adminRestoreFailed(String error) {
    return 'Vraćanje sigurnosne kopije nije uspjelo: $error';
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
    return 'Spremljeno u $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Spremanje datoteke nije uspjelo: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Učitavanje datoteke $fileName nije uspjelo';
  }

  @override
  String get adminSearchInLog => 'Traži u dnevniku';

  @override
  String get adminNoMatchingLines => 'Nema odgovarajućih linija';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Učitavanje zadataka nije uspjelo: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nisu pronađeni zakazani zadaci';

  @override
  String get adminNoTasksMatchFilter =>
      'Nijedan zadatak ne odgovara trenutnom filtru';

  @override
  String adminTaskStartFailed(String error) {
    return 'Pokretanje zadatka nije uspjelo: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Zaustavljanje zadatka nije uspjelo: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Učitavanje zadatka nije uspjelo: $error';
  }

  @override
  String get adminRunNow => 'Trči sada';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Uklanjanje okidača nije uspjelo: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Dodavanje okidača nije uspjelo: $error';
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
    return '$hours h';
  }

  @override
  String get adminDayOfWeek => 'Dan u tjednu';

  @override
  String get adminSearchPlugins => 'Pretraži dodatke...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Promjena stanja dodatka nije uspjela: $error';
  }

  @override
  String get adminUninstallPlugin => 'Deinstaliraj dodatak';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Jeste li sigurni da želite deinstalirati „$name”?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Deinstalacija dodatka nije uspjela: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Instalacija paketa nije uspjela: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Instalacija ažuriranja nije uspjela: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Učitavanje dodataka nije uspjelo: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Nijedan dodatak ne odgovara vašem pretraživanju';

  @override
  String get adminNoPluginsInstalled => 'Nema instaliranih dodataka';

  @override
  String adminInstallUpdate(String version) {
    return 'Instaliraj ažuriranje (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Učitavanje kataloga nije uspjelo: $error';
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
    return '„$name” bit će uklonjen nakon ponovnog pokretanja poslužitelja';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Deinstalacija nije uspjela: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Ažuriranje „$name” na v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Nije moguće otvoriti postavke: nedostaje token autentifikacije.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Učitavanje dodatka nije uspjelo: $error';
  }

  @override
  String get adminPluginNotFound => 'Dodatak nije pronađen';

  @override
  String adminPluginVersion(String version) {
    return 'Verzija $version';
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
    return 'Jeste li sigurni da želite ukloniti „$name”?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Spremanje repozitorija nije uspjelo: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Učitavanje repozitorija nije uspjelo: $error';
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
    return 'Nije moguće učitati postavke dodatka: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nije moguće otvoriti $uri';
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
  String get adminBaseUrlHint => 'npr. /jellyfin';

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
    return 'Učitavanje metapodataka nije uspjelo: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Spremanje metapodataka nije uspjelo: $error';
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
    return 'Osvježavanje metapodataka nije uspjelo: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Nije pronađeno udaljeno podudaranje';

  @override
  String get adminRemoteResults => 'Rezultati na daljinu';

  @override
  String get adminRemoteMetadataApplied => 'Primijenjeni udaljeni metapodaci';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Udaljeno pretraživanje nije uspjelo: $error';
  }

  @override
  String get adminUpdateContentType => 'Ažuriraj vrstu sadržaja';

  @override
  String get adminContentType => 'Vrsta sadržaja';

  @override
  String get adminContentTypeUpdated => 'Vrsta sadržaja ažurirana';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Ažuriranje vrste sadržaja nije uspjelo: $error';
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
    return 'Slika $imageType je ažurirana';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Preuzimanje slike nije uspjelo: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nepodržani format slike';

  @override
  String get adminImageReadFailed => 'Čitanje odabrane slike nije uspjelo';

  @override
  String adminImageUploaded(String imageType) {
    return 'Slika $imageType je prenesena';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Prijenos slike nije uspio: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Izbriši sliku $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Slika $imageType je izbrisana';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Brisanje slike nije uspjelo: $error';
  }

  @override
  String get adminAllProviders => 'Svi pružatelji usluga';

  @override
  String get adminNoRemoteImages => 'Nije pronađena udaljena slika';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Otkrivanje tunera nije uspjelo: $error';
  }

  @override
  String get adminAddTuner => 'Dodaj tuner';

  @override
  String get adminEditTuner => 'Uredi tuner';

  @override
  String get adminTunerTypeM3u => 'M3U tuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Datoteka ili URL';

  @override
  String get adminTunerIpAddress => 'IP adresa tunera';

  @override
  String get adminTunerFriendlyName => 'Prikazani naziv';

  @override
  String get adminTunerUserAgent => 'Korisnički agent';

  @override
  String get adminTunerCount => 'Ograničenje istodobnih veza';

  @override
  String get adminTunerCountHelp =>
      'Najveći broj streamova koje tuner dopušta istodobno. Postavite na 0 za neograničeno.';

  @override
  String get adminTunerFallbackBitrate =>
      'Rezervna najveća brzina prijenosa streama';

  @override
  String get adminTunerImportFavoritesOnly => 'Uvezi samo omiljene kanale';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Dopusti hardversko transkodiranje';

  @override
  String get adminTunerAllowFmp4 => 'Dopusti fMP4 kontejner za transkodiranje';

  @override
  String get adminTunerAllowStreamSharing => 'Dopusti dijeljenje streama';

  @override
  String get adminTunerEnableStreamLooping => 'Omogući ponavljanje streama';

  @override
  String get adminTunerIgnoreDts => 'Zanemari DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Čitaj ulaz pri izvornoj brzini kadrova';

  @override
  String get adminEditProvider => 'Uredi pružatelja';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Datoteka ili URL';

  @override
  String get adminXmltvMoviePrefix => 'Prefiks filma';

  @override
  String get adminXmltvMovieCategories => 'Kategorije filmova';

  @override
  String get adminXmltvCategoriesHelp =>
      'Više kategorija odvojite okomitom crtom.';

  @override
  String get adminXmltvKidsCategories => 'Kategorije za djecu';

  @override
  String get adminXmltvNewsCategories => 'Kategorije vijesti';

  @override
  String get adminXmltvSportsCategories => 'Kategorije sporta';

  @override
  String get adminSdUsername => 'Korisničko ime';

  @override
  String get adminSdPassword => 'Lozinka';

  @override
  String get adminSdCountry => 'Država';

  @override
  String get adminSdCountrySelect => 'Odaberite državu';

  @override
  String get adminSdPostalCode => 'Poštanski broj';

  @override
  String get adminSdGetListings => 'Dohvati programski raspored';

  @override
  String get adminSdListings => 'Programski raspored';

  @override
  String get adminEnableAllTuners => 'Omogući sve tunere';

  @override
  String get adminTunerType => 'Vrsta tunera';

  @override
  String get adminTunerAdded => 'Tuner dodan';

  @override
  String adminTunerAddFailed(String error) {
    return 'Dodavanje tunera nije uspjelo: $error';
  }

  @override
  String get adminAddGuideProvider => 'Dodaj pružatelja vodiča';

  @override
  String get adminProviderType => 'Vrsta pružatelja usluga';

  @override
  String get adminProviderAdded => 'Pružatelj je dodan';

  @override
  String adminProviderAddFailed(String error) {
    return 'Dodavanje pružatelja nije uspjelo: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Uklanjanje tunera nije uspjelo: $error';
  }

  @override
  String get adminTunerResetRequested => 'Zatraženo resetiranje tunera';

  @override
  String adminTunerResetFailed(String error) {
    return 'Poništavanje tunera nije uspjelo: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Ova vrsta tunera ne podržava poništavanje.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Uklanjanje pružatelja nije uspjelo: $error';
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
  String get adminMovieRecordingPath => 'Putanja za snimanje filmova';

  @override
  String get adminGuideDays => 'Broj dana podataka TV vodiča';

  @override
  String get adminGuideDaysAuto => 'Automatski';

  @override
  String adminGuideDaysValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dana',
      few: '$days dana',
      one: '$days dan',
    );
    return '$_temp0';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Putanja aplikacije za naknadnu obradu';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumenti za naknadnu obradu';

  @override
  String get adminSaveRecordingNfo => 'Spremi NFO metapodatke snimke';

  @override
  String get adminSaveRecordingImages => 'Spremi slike snimke';

  @override
  String get adminLiveTvSectionTiming => 'Vremenske postavke';

  @override
  String get adminLiveTvSectionPaths => 'Putanje snimanja';

  @override
  String get adminLiveTvSectionPostProcessing => 'Naknadna obrada';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Podaci TV vodiča: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Postavke snimanja su spremljene';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Spremanje postavki nije uspjelo: $error';
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
    return 'Ažuriranje mapiranja nije uspjelo: $error';
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
  String get adminRefreshGuideData => 'Osvježi podatke TV vodiča';

  @override
  String get adminGuideRefreshStarted =>
      'Osvježavanje podataka TV vodiča je pokrenuto';

  @override
  String get adminGuideRefreshUnavailable =>
      'Zadatak osvježavanja TV vodiča nije dostupan na ovom poslužitelju.';

  @override
  String get adminAddProvider => 'Dodaj davatelja usluga';

  @override
  String get adminNoListingProviders => 'Nema konfiguriranih pružatelja popisa';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Putanja snimanja: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Putanja serija: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Dodatak prije: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Dodatak poslije: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Otkrivanje tunera';

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
    return 'Vratiti sigurnosnu kopiju $name sada?';
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
  String get adminApply => 'Primijeni';

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
    return 'prije $minutes min';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'prije $hours h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'prije $days d';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Učitavanje datoteke $fileName nije uspjelo';
  }

  @override
  String adminLogViewerMatches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count podudaranja',
      few: '$count podudaranja',
      one: '$count podudaranje',
    );
    return '$_temp0';
  }

  @override
  String get adminLogViewerNoMatches => 'Nema odgovarajućih linija';

  @override
  String get adminMetadataEditorTitle => 'Uređivač metapodataka';

  @override
  String get adminMetadataIdentify => 'Identificiraj';

  @override
  String get adminMetadataType => 'Tip';

  @override
  String get adminMetadataDetails => 'pojedinosti';

  @override
  String get adminMetadataExternalIds => 'Vanjski ID-ovi';

  @override
  String get adminMetadataImages => 'Slike';

  @override
  String get adminMetadataFieldTitle => 'Naslov';

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
  String get adminMetadataImageLogo => 'Logotip';

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
    return 'Slika $imageType je ažurirana';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Slika $imageType je prenesena';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Slika $imageType je izbrisana';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Preuzimanje slike nije uspjelo: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Čitanje odabrane slike nije uspjelo';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Prijenos slike nije uspio: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Izbriši sliku $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Ovo uklanja trenutnu sliku iz stavke.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Brisanje slike nije uspjelo: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Odaberite sliku $imageType';
  }

  @override
  String get adminMetadataUpload => 'Prenesi';

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
    return 'Dostupno ažuriranje: v$version';
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
    return 'Instaliraj ažuriranje (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nijedan paket ne odgovara vašoj pretrazi';

  @override
  String get adminPluginsCatalogEmpty => 'Nema dostupnih paketa';

  @override
  String adminPluginsInstalling(String name) {
    return '„$name” se instalira...';
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
    return 'Postavke – $name';
  }

  @override
  String get adminPluginDetailDetails => 'pojedinosti';

  @override
  String get adminPluginDetailDeveloper => 'Razvojni programer';

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
    return 'Učitavanje repozitorija nije uspjelo: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Ukloni spremište';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Jeste li sigurni da želite ukloniti „$name”?';
  }

  @override
  String get adminReposRemove => 'Ukloni';

  @override
  String adminReposSaveFailed(String error) {
    return 'Spremanje repozitorija nije uspjelo: $error';
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
  String get adminBrandingSplashUpload => 'Prenesi sliku';

  @override
  String get adminBrandingSplashUploaded => 'Uvodni zaslon je ažuriran';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Prijenos uvodnog zaslona nije uspio';

  @override
  String get adminBrandingSplashDeleted => 'Uvodni zaslon je uklonjen';

  @override
  String get adminBrandingNoSplash => 'Nema prilagođenog uvodnog zaslona';

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
  String get adminPlaybackQsvDevice => 'QSV uređaj';

  @override
  String get adminPlaybackEnhancedNvdec => 'Omogući poboljšani NVDEC dekoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Preferiraj izvorni hardverski dekoder sustava';

  @override
  String get adminPlaybackColorDepth => 'Dubina boje hardverskog dekodiranja';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bitno HEVC dekodiranje';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bitno VP9 dekodiranje';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bitno dekodiranje';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12-bitno dekodiranje';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardversko kodiranje';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Dopusti HEVC kodiranje';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Dopusti AV1 kodiranje';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Omogući Intel H.264 koder niske potrošnje';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Omogući Intel HEVC koder niske potrošnje';

  @override
  String get adminPlaybackToneMapping => 'Mapiranje tonova';

  @override
  String get adminPlaybackEnableTonemapping => 'Omogući mapiranje tonova';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Omogući VPP mapiranje tonova';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Omogući VideoToolbox mapiranje tonova';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algoritam mapiranja tonova';

  @override
  String get adminPlaybackTonemappingMode => 'Način mapiranja tonova';

  @override
  String get adminPlaybackTonemappingRange => 'Raspon mapiranja tonova';

  @override
  String get adminPlaybackTonemappingDesat => 'Desaturacija mapiranja tonova';

  @override
  String get adminPlaybackTonemappingPeak =>
      'Vršna vrijednost mapiranja tonova';

  @override
  String get adminPlaybackTonemappingParam => 'Parametar mapiranja tonova';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Svjetlina VPP mapiranja tonova';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Kontrast VPP mapiranja tonova';

  @override
  String get adminPlaybackPresetsQuality => 'Predlošci i kvaliteta';

  @override
  String get adminPlaybackEncoderPreset => 'Predložak kodera';

  @override
  String get adminPlaybackH264Crf => 'CRF za H.264 kodiranje';

  @override
  String get adminPlaybackH265Crf => 'CRF za H.265 (HEVC) kodiranje';

  @override
  String get adminPlaybackDeinterlaceMethod =>
      'Metoda uklanjanja isprepletenosti';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Udvostruči brzinu kadrova pri uklanjanju isprepletenosti';

  @override
  String get adminPlaybackAudioSection => 'Zvuk';

  @override
  String get adminPlaybackEnableAudioVbr => 'Omogući VBR kodiranje zvuka';

  @override
  String get adminPlaybackDownmixBoost => 'Pojačanje downmiksa zvuka';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritam stereo downmiksa';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Najveća veličina reda za muxanje';

  @override
  String get adminPlaybackAutoOption => 'Automatski';

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
  String get adminTaskStop => 'Zaustavi';

  @override
  String get adminRunningTasks => 'Zadaci u tijeku';

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
    return 'Svaki dan u $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Svaki $day u $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Svakih $duration';
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
      other: '$count sati',
      few: '$count sata',
      one: '$count sat',
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
    return 'prije $days d';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'prije $hours h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'prije $minutes min';
  }

  @override
  String get adminActivityNow => 'sada';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours h';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days d';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month.';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigurirajte generiranje trickplay slike za pretpregled sličica pretraživanja.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Javni HTTPS priključak';

  @override
  String get adminNetworkingBaseUrl => 'Osnovni URL';

  @override
  String get adminNetworkingBaseUrlHint => 'npr. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Javni HTTP port';

  @override
  String get adminNetworkingRequireHttps => 'Zahtijevaj HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Preusmjeri sve udaljene zahtjeve na HTTPS. Nema učinka ako poslužitelj nema valjani certifikat.';

  @override
  String get adminNetworkingCertPassword => 'Lozinka certifikata';

  @override
  String get adminNetworkingIpSettings => 'IP postavke';

  @override
  String get adminNetworkingEnableIpv4 => 'Omogući IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Omogući IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Omogući automatsko mapiranje portova';

  @override
  String get adminNetworkingLocalSubnets => 'LAN mreže';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Popis IP adresa ili CIDR podmreža koje se smatraju dijelom lokalne mreže, odvojenih zarezom ili novim redom.';

  @override
  String get adminNetworkingPublishedUris => 'Objavljeni URI-ji poslužitelja';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Mapirajte podmrežu ili adresu na objavljeni URL, npr. all=https://example.com';

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
  String get adminPlaybackThrottleDelay => 'Odgoda ograničavanja (sekunde)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Dopusti izdvajanje titlova u hodu';

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
    return 'Ažuriranje vrste sadržaja nije uspjelo: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Prag sporog odgovora (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Omogući upozorenja o sporim odgovorima';

  @override
  String get adminGeneralQuickConnect => 'Omogući Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Poslužitelj';

  @override
  String get adminGeneralSectionMetadata => 'Metapodaci';

  @override
  String get adminGeneralSectionPaths => 'Putanje';

  @override
  String get adminGeneralSectionPerformance => 'Performanse';

  @override
  String get adminGeneralCachePath => 'Put predmemorije';

  @override
  String get adminGeneralMetadataPath => 'Put metapodataka';

  @override
  String get adminGeneralServerName => 'Naziv poslužitelja';

  @override
  String get adminGeneralDisplayLanguage => 'Željeni jezik prikaza';

  @override
  String get adminSettingsLoadFailed => 'Učitavanje postavki nije uspjelo';

  @override
  String get adminDiscover => 'Otkriti';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Ažuriranje mapiranja nije uspjelo: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Vremensko ograničenje: $duration';
  }

  @override
  String get folders => 'mape';

  @override
  String get libraries => 'Biblioteke';

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
      other: '# sudionika',
      few: '# sudionika',
      one: '# sudionik',
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
    return 'Stavka $index';
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
    return '$userName se pridružio/la SyncPlay grupi';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName je napustio/la SyncPlay grupu';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay pristup odbijen';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nemate pristup jednoj ili više stavki u ovoj SyncPlay grupi. Zamolite vlasnika grupe da potvrdi dopuštenja knjižnice ili odabere drugi red čekanja.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sinkronizacija reprodukcije s grupom $groupName';
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# redova otkriveno',
      few: '# reda otkrivena',
      one: '# red otkriven',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'Izvan mreže ste';

  @override
  String get offlineBannerSubtitle => 'Prikazuju se vaša preuzimanja';

  @override
  String get offlineBannerAction => 'Preuzimanja';

  @override
  String get serverUnreachableBannerTitle => 'Poslužitelj nije dostupan';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Reprodukcija iz preuzimanja dok se ne vrati';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Udaljena reprodukcija';

  @override
  String castControlFailed(String error) {
    return 'Cast kontrola nije uspjela: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Kontrole – $kind';
  }

  @override
  String get castDeviceVolume => 'Glasnoća uređaja';

  @override
  String get castVolumeUnavailable => 'Nedostupan';

  @override
  String castStopKind(String kind) {
    return 'Zaustavi $kind';
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
    return 'Unesite $length-znamenkasti PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Unesite svoj $length-znamenkasti PIN';
  }

  @override
  String get pinIncorrect => 'Netočan PIN';

  @override
  String get pinMismatch => 'PIN-ovi se ne podudaraju';

  @override
  String get pinForgot => 'Zaboravili ste PIN?';

  @override
  String get pinClear => 'Očisti';

  @override
  String get pinBackspace => 'Brisanje';

  @override
  String get quickConnectAuthorized => 'Zahtjev za Quick Connect je odobren.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect kôd nije valjan ili je istekao.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect nije podržan na ovom poslužitelju.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Autorizacija Quick Connect koda nije uspjela.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect je onemogućen na ovom poslužitelju.';

  @override
  String get quickConnectForbidden =>
      'Vaš račun ne može odobriti ovaj Quick Connect zahtjev.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect kôd nije pronađen. Pokušajte s novim kodom.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect nije uspio: $message';
  }

  @override
  String get quickConnectEnterCode => 'Unesite šifru';

  @override
  String get quickConnectAuthorize => 'Ovlastiti';

  @override
  String remoteCommandFailed(String error) {
    return 'Naredba nije uspjela: $error';
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
    return 'Pokretanje Casta nije uspjelo: $error';
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
    return 'Preuzimanje: $name...';
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
  String get shuffleLibrary => 'Biblioteka';

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
  String get imageTypePoster => 'Plakat';

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
  String get stillWatchingStop => 'Zaustavi';

  @override
  String get stillWatchingContinue => 'Nastaviti';

  @override
  String skipSegment(String segment) {
    return 'Preskoči $segment';
  }

  @override
  String get liveTv => 'TV uživo';

  @override
  String get continueWatchingAndNextUp => 'Nastavite s gledanjem i sljedeće';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Preuzimanje $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Preuzimanje: $fileName';
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
  String get playerTooltipPlaybackQuality => 'Brzina prijenosa';

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
  String get contextMenuHideFromContinueWatching =>
      'Sakrij iz odjeljka „Nastavite s gledanjem”';

  @override
  String get contextMenuHideFromNextUp => 'Sakrij iz odjeljka „Sljedeći”';

  @override
  String get contextMenuAddToCollection => 'Dodaj u kolekciju';

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
  String get settingsConnectionSection => 'VEZA';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Dopusti samopotpisane certifikate';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Vjeruj poslužiteljima koji koriste samopotpisane certifikate ili certifikate privatnog CA-a. Omogućite samo za poslužitelje koje kontrolirate. Ovime se onemogućuje provjera certifikata za sve veze.';

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
  String get settingsDetailsScreen => 'Zaslon s detaljima';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Stil, zamućenje pozadine i ponašanje kartica';

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
  String get settingsShowSeerrButtonInNavigation =>
      'Prikaži Seerr gumb u navigacijskoj traci';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Uvijek prikaži tekstualne natpise u gornjoj navigacijskoj traci';

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
      'Počastite razvojnog programera kavom';

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
      other: '# licencnih obavijesti',
      few: '# licencne obavijesti',
      one: '# licencna obavijest',
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
  String get settingsMediaSegmentCountdown => 'Odbrojavanje medijskog segmenta';

  @override
  String get settingsProgressBar => 'Traka napretka';

  @override
  String get settingsTimer => 'Odbrojavanje';

  @override
  String get settingsNone => 'Ništa';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (zastarjelo)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (nasljeđe)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (preporučeno)';

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
  String get settingsCinemaMode => 'Kino način';

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
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Nedavno objavljeno – $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Automatski pusti sljedeću epizodu';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automatski pusti sljedeću epizodu kada je dostupna.';

  @override
  String get skipSilenceTitle => 'Preskoči tišinu';

  @override
  String get skipSilenceSubtitle =>
      'Automatski preskoči tihe dijelove zvuka kada ih stream podržava.';

  @override
  String get allowExternalAudioEffectsTitle => 'Dopusti vanjske zvučne efekte';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Dopusti aplikacijama za ekvilizaciju i efekte (npr. Wavelet) povezivanje s Media3 sesijama reprodukcije.';

  @override
  String get disableTunnelingTitle => 'Onemogući tuneliranje';

  @override
  String get disableTunnelingSubtitle =>
      'Prisili reprodukciju bez tuneliranja. Korisno na uređajima s prekidima zvuka/videa pri tuneliranju.';

  @override
  String get enableTunnelingTitle => 'Omogući tuneliranje';

  @override
  String get enableTunnelingSubtitle =>
      'Napredno. Usmjerava zvuk i video kroz povezani hardverski put. Zadano isključeno jer na nekim uređajima uzrokuje ispadanje zvuka/videa.';

  @override
  String get mapDolbyVisionP7Title => 'Mapiraj Dolby Vision profil 7 u HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Reproduciraj Dolby Vision profil 7 streamove kao HDR10-kompatibilni HEVC na uređajima bez DV-a.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Koristi ugrađene stilove titlova';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Primijeni boje, fontove i položaj ugrađene u zapis titlova. Isključite kako biste umjesto toga koristili vlastite postavke stila titlova.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Koristi ugrađene veličine fonta titlova';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Primijeni preporuke veličine fonta ugrađene u zapis titlova. Isključite kako biste koristili veličinu titlova iz vlastitih postavki stila.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Prikaži detalje medija';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Prikaži detalje odabrane stavke na vrhu stranica biblioteke.';

  @override
  String get hideBackdropsInLibraries =>
      'Sakriti pozadinske slike pri pregledavanju?';

  @override
  String get useDetailedSubHeadings => 'Koristi detaljne podnaslove';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Prikaži detaljan ili minimalan podred na stranicama biblioteke.';

  @override
  String get savedThemesDeleteDialogTitle => 'Izbrisati spremljenu temu?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Ukloniti „$themeName” iz predmemorije ovog uređaja?';
  }

  @override
  String get themeStore => 'Trgovina tema';

  @override
  String get themeStoreSubtitle => 'Pregledajte i spremite teme zajednice';

  @override
  String get themeStoreDescription =>
      'Spremite temu kako biste je koristili kao i ostale spremljene teme.';

  @override
  String get themeStoreEmpty => 'Trenutno nema dostupnih tema.';

  @override
  String get themeStoreLoadFailed =>
      'Učitavanje Trgovine tema nije uspjelo. Provjerite vezu i pokušajte ponovno.';

  @override
  String get themeStoreSave => 'Spremi';

  @override
  String get themeStoreSaveAndApply => 'Spremi i primijeni';

  @override
  String get themeStoreSaved => 'Spremljeno';

  @override
  String get themeStoreInvalidMessage => 'Ovu temu nije bilo moguće učitati.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Spremljeno: „$themeName”.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '„$themeName” je izbrisana s ovog uređaja.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Nije moguće izbrisati „$themeName”.';
  }

  @override
  String get savedThemesTitle => 'Spremljene teme';

  @override
  String get savedThemesDescription =>
      'Ovo su teme preuzete iz Moonfin dodatka za trenutni poslužitelj. Brisanjem se uklanja samo ova lokalna kopija.';

  @override
  String get savedThemesEmpty =>
      'Za ovaj poslužitelj nisu pronađene spremljene teme.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Trenutno aktivna';
  }

  @override
  String get savedThemesDeleteTooltip => 'Izbriši spremljenu temu';

  @override
  String get savedThemesManageSubtitle =>
      'Upravljajte preuzetim temama dodatka na ovom uređaju';

  @override
  String get themeEditor => 'Uređivač tema';

  @override
  String get themeEditorSubtitle =>
      'Otvorite Moonfin Uređivač tema u pregledniku';

  @override
  String get homeScreen => 'Početni zaslon';

  @override
  String get bottomBar => 'Donja traka';

  @override
  String get homeRowsStyleClassic => 'Klasični';

  @override
  String get homeRowsStyleModern => 'Moderni';

  @override
  String get homeRowsSection => 'Redovi početnog zaslona';

  @override
  String get homeRowDisplay => 'Prikaz redova početnog zaslona';

  @override
  String get homeRowSections => 'Odjeljci redova početnog zaslona';

  @override
  String get homeRowToggles => 'Preklopnici redova početnog zaslona';

  @override
  String get homeRowTogglesSubtitle =>
      'Omogućite ili onemogućite kategorije redova početnog zaslona temeljene na biblioteci';

  @override
  String get homeRowTogglesDescription =>
      'Omogućite sljedeće preklopnike za prikaz redova u odjeljcima početnog zaslona.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klasični zadržava vrstu slike po redu i informacijski sloj. Moderni koristi redove od portreta do pozadinske slike.';

  @override
  String get displayFavoritesRows => 'Prikaži redove favorita';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Prikaži omiljene filmove, serije i ostale redove favorita u odjeljcima početnog zaslona.';

  @override
  String get favoritesRowSorting => 'Sortiranje redova favorita';

  @override
  String get favoritesRowSortingDescription =>
      'Sortirajte redove favorita prema datumu dodavanja, datumu izlaska, abecedno i više.';

  @override
  String get displayCollectionsRows => 'Prikaži redove kolekcija';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Prikaži redove kolekcija u odjeljcima početnog zaslona.';

  @override
  String get collectionsRowSorting => 'Sortiranje redova kolekcija';

  @override
  String get collectionsRowSortingDescription =>
      'Sortirajte redove kolekcija prema datumu dodavanja, datumu izlaska, abecedno i više.';

  @override
  String get displayGenresRows => 'Prikaži redove žanrova';

  @override
  String get displayGenresRowsSubtitle =>
      'Prikaži redove žanrova u odjeljcima početnog zaslona.';

  @override
  String get genresRowSorting => 'Sortiranje redova žanrova';

  @override
  String get genresRowSortingDescription =>
      'Sortirajte redove žanrova prema datumu dodavanja, datumu izlaska, abecedno i više.';

  @override
  String get genresRowItems => 'Stavke redova žanrova';

  @override
  String get genresRowItemsDescription =>
      'Prikaži filmove, serije ili oboje u redovima žanrova.';

  @override
  String get displayPlaylistsRows => 'Prikaži redove popisa za reprodukciju';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Prikaži redove popisa za reprodukciju u odjeljcima početnog zaslona.';

  @override
  String get playlistsRowSorting => 'Sortiranje redova popisa za reprodukciju';

  @override
  String get playlistsRowSortingDescription =>
      'Sortirajte redove popisa za reprodukciju prema datumu dodavanja, datumu izlaska, abecedno i više.';

  @override
  String get displayAudioRows => 'Prikaži audioredove';

  @override
  String get displayAudioRowsSubtitle =>
      'Prikaži audioredove u odjeljcima početnog zaslona.';

  @override
  String get audioRowsSorting => 'Sortiranje audioredova';

  @override
  String get audioRowsSortingDescription =>
      'Sortirajte audioredove prema datumu dodavanja, datumu izlaska, abecedno i više.';

  @override
  String get audioPlaylists => 'Audiopopisi za reprodukciju';

  @override
  String get appearance => 'Izgled';

  @override
  String get layout => 'Raspored';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Tipkovnica';

  @override
  String get navButtons => 'Gumbi';

  @override
  String get rendering => 'Prikazivanje';

  @override
  String get mpvConfiguration => 'MPV konfiguracija';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Vanjska aplikacija za reprodukciju';

  @override
  String get externalPlayerAppDescription =>
      'Postavite vanjski reproduktor za omogućavanje opcije reprodukcije dugim pritiskom';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Prikaži odabir aplikacije pri pokretanju reprodukcije.';

  @override
  String get loadingInstalledPlayers =>
      'Učitavanje instaliranih reproduktora...';

  @override
  String get connection => 'Veza';

  @override
  String get audioTranscodeTarget => 'Ciljni format transkodiranja zvuka';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Podržano na ovom uređaju';

  @override
  String get notSupportedOnThisDevice => 'Nije podržano na ovom uređaju';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Šalji DTS:X (DTS UHD) bitstream vanjskom dekoderu.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD s Atmosom (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Ponašanje medijskog reproduktora';

  @override
  String get playbackEnhancements => 'Poboljšanja reprodukcije';

  @override
  String get alwaysOn => 'Uvijek uključeno.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Zamijeni preskakanje odjavne špice prikazom „Sljedeći”';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Prikaži sloj „Sljedeći” umjesto gumba za preskakanje odjavne špice.';

  @override
  String get playerRouting => 'Usmjeravanje reproduktora';

  @override
  String get preferSoftwareDecoders => 'Preferiraj softverske dekodere';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Koristi FFmpeg (zvuk) i libgav1 (AV1) prije hardverskih dekodera. Isključite ako HDMI audio passthrough prestane raditi.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Otvori reprodukciju videa u odabranoj vanjskoj aplikaciji na Android TV-u.';

  @override
  String get automaticQueuing => 'Automatsko dodavanje u red';

  @override
  String get preferSdhSubtitles => 'Preferiraj SDH titlove';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Daj prednost SDH/CC zapisima titlova pri automatskom odabiru.';

  @override
  String get webDiagnostics => 'Web dijagnostika';

  @override
  String get webDiagnosticsTitle => 'Moonfin web dijagnostika';

  @override
  String get webDiagnosticsIntro =>
      'Koristite ovu stranicu za dijagnostiku problema s povezivanjem preglednika (CORS, miješani sadržaj i postavke otkrivanja).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Otkriven kvar zbog miješanog sadržaja';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Otkriven kvar CORS-a/preflight zahtjeva';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin je otkrio da HTTPS stranica pokušava pozvati HTTP URL poslužitelja. Preglednici blokiraju taj zahtjev prije nego što dođe do vašeg poslužitelja.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin je otkrio kvar zahtjeva na razini preglednika koji obično uzrokuju nedostajuća CORS ili preflight zaglavlja na medijskom poslužitelju.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Ciljni URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detalji: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Trenutni kontekst izvođenja';

  @override
  String get webDiagnosticsOrigin => 'Izvor';

  @override
  String get webDiagnosticsScheme => 'Shema';

  @override
  String get webDiagnosticsPluginMode => 'Način dodatka';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC skeniranje';

  @override
  String get webDiagnosticsForcedServerUrl => 'Prisilni URL poslužitelja';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Zadani URL poslužitelja';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL proxyja za otkrivanje';

  @override
  String get notConfigured => 'nije konfigurirano';

  @override
  String get webDiagnosticsMixedContent => 'Miješani sadržaj';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ova se stranica učitava putem HTTPS-a, ali je jedan ili više konfiguriranih URL-ova HTTP. Preglednici blokiraju HTTPS stranicama pozivanje HTTP API-ja.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Rješenje: poslužite svoj medijski poslužitelj ili proxy krajnju točku putem HTTPS-a ili učitajte Moonfin putem HTTP-a samo na pouzdanim lokalnim mrežama.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Iz trenutnih postavki izvođenja nije otkrivena očita konfiguracija miješanog sadržaja.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS kontrolni popis';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Dopustite izvor preglednika u Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Uključite Authorization, X-Emby-Authorization i X-Emby-Token u Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Izložite Content-Range i Accept-Ranges za streaming i premotavanje.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Vratite 204 na OPTIONS preflight zahtjeve.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Primjer isječka zaglavlja (nginx stil)';

  @override
  String get note => 'Napomena';

  @override
  String get webDiagnosticsNonWebNote =>
      'Ova je dijagnostička ruta namijenjena web verzijama. Ako ovo vidite na drugoj platformi, ove se provjere možda ne primjenjuju.';

  @override
  String get backToServerSelect => 'Natrag na odabir poslužitelja';

  @override
  String get signOutAllUsers => 'Odjavi sve korisnike';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Dopuštenje za mikrofon trajno je odbijeno. Omogućite ga u postavkama sustava.';

  @override
  String get voiceSearchPermissionRequired =>
      'Za glasovno pretraživanje potrebno je dopuštenje za mikrofon.';

  @override
  String get voiceSearchNoMatch => 'Nismo to uhvatili. Pokušajte ponovno.';

  @override
  String get voiceSearchNoSpeechDetected => 'Govor nije otkriven.';

  @override
  String get voiceSearchMicrophoneError => 'Greška mikrofona.';

  @override
  String get voiceSearchNeedsInternet =>
      'Glasovno pretraživanje zahtijeva internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Glasovna usluga je zauzeta. Pokušajte ponovno.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Dopuštenje za mikrofon trajno je odbijeno.';

  @override
  String get microphonePermissionDenied =>
      'Dopuštenje za mikrofon je odbijeno.';

  @override
  String get speechRecognitionUnavailable =>
      'Prepoznavanje govora nije dostupno na ovom uređaju.';

  @override
  String get openIosRoutePicker => 'Otvori iOS odabir izlaza';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay odabir izlaza nije dostupan na ovom uređaju.';

  @override
  String get videos => 'Videozapisi';

  @override
  String get programs => 'Emisije';

  @override
  String get songs => 'Pjesme';

  @override
  String get photoAlbums => 'Foto albumi';

  @override
  String get photos => 'Fotografije';

  @override
  String get people => 'Osobe';

  @override
  String get recentlyReleasedEpisodes => 'Nedavno objavljene epizode';

  @override
  String get watchAgain => 'Pogledajte ponovno';

  @override
  String get guestAppearances => 'Gostujuće uloge';

  @override
  String get appearancesSeerr => 'Pojavljivanja (Seerr)';

  @override
  String get crewContributionsSeerr => 'Doprinosi ekipe (Seerr)';

  @override
  String get watchWithGroup => 'Gledaj s grupom';

  @override
  String get errors => 'Greške';

  @override
  String get warnings => 'Upozorenja';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Otvori u pregledniku';

  @override
  String get embeddedBrowserNotAvailable =>
      'Ugrađeni preglednik nije dostupan na ovoj platformi.';

  @override
  String get adminRestartServerConfirmation =>
      'Jeste li sigurni da želite ponovno pokrenuti poslužitelj?';

  @override
  String get adminShutdownServerConfirmation =>
      'Jeste li sigurni da želite isključiti poslužitelj? Morat ćete ga ručno ponovno pokrenuti.';

  @override
  String get internal => 'Interno';

  @override
  String get idle => 'Neaktivno';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nema pronađenih korisnika';

  @override
  String get adminNoUsersMatchSearch =>
      'Nijedan korisnik ne odgovara pretraživanju';

  @override
  String get adminNoDevicesFound => 'Nema pronađenih uređaja';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nijedan uređaj ne odgovara trenutnim filtrima';

  @override
  String get passwordSet => 'Lozinka je postavljena';

  @override
  String get noPasswordConfigured => 'Lozinka nije konfigurirana';

  @override
  String get remoteAccess => 'Udaljeni pristup';

  @override
  String get localOnly => 'Samo lokalno';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Učitavanje medijske analitike nije uspjelo';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Objedinjena analitika svih medijskih biblioteka.';

  @override
  String get analyticsTopArtists => 'Najbolji izvođači';

  @override
  String get analyticsTopAuthors => 'Najbolji autori';

  @override
  String get analyticsTopContributors => 'Najveći doprinositelji';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count biblioteka',
      few: '$count biblioteke',
      one: '$count biblioteka',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Za ovaj odabir još nisu dostupni ukupni iznosi indeksiranih medija.';

  @override
  String get analyticsLibraryDetails => 'Detalji biblioteke';

  @override
  String get analyticsLibraryBreakdown => 'Raščlamba biblioteke';

  @override
  String get analyticsNoLibrariesAvailable => 'Nema dostupnih biblioteka.';

  @override
  String get adminServerAdministrationTitle => 'Administracija poslužitelja';

  @override
  String get adminServerPathData => 'Podaci';

  @override
  String get adminServerPathImageCache => 'Predmemorija slika';

  @override
  String get adminServerPathCache => 'Predmemorija';

  @override
  String get adminServerPathLogs => 'Zapisnici';

  @override
  String get adminServerPathMetadata => 'Metapodaci';

  @override
  String get adminServerPathTranscode => 'Transkodiranje';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Ovaj poslužitelj nije vratio nijednu putanju.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% iskorišteno';
  }

  @override
  String get userActivity => 'Aktivnost korisnika';

  @override
  String get systemEvents => 'Događaji sustava';

  @override
  String get needsAttention => 'Zahtijeva pozornost';

  @override
  String get adminDrawerSectionServer => 'Poslužitelj';

  @override
  String get adminDrawerSectionPlayback => 'Reprodukcija';

  @override
  String get adminDrawerSectionDevices => 'Uređaji';

  @override
  String get adminDrawerSectionAdvanced => 'Napredno';

  @override
  String get adminDrawerSectionPlugins => 'Dodaci';

  @override
  String get adminDrawerSectionLiveTv => 'TV uživo';

  @override
  String get homeVideos => 'Kućni videozapisi';

  @override
  String get mixedContent => 'Miješani sadržaj';

  @override
  String get homeVideosAndPhotos => 'Kućni videozapisi i fotografije';

  @override
  String get mixedMoviesAndShows => 'Miješani filmovi i serije';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nema pronađenih snimki';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'U .$extension arhivi nisu pronađene stranice sa slikama.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Ugrađeni prikazivač nije uspio ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB prikazivač nije uspio ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Nedostaje lokalna datoteka za čitač: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status pri otvaranju podataka knjige s $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nema dostupne krajnje točke za čitanje knjige';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nepodržani format arhive stripa: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Dodatak za izdvajanje CBR-a nije dostupan na ovoj platformi.';

  @override
  String get failedToExtractCbrArchive =>
      'Izdvajanje .cbr arhive nije uspjelo.';

  @override
  String get cb7ExtractionUnavailable =>
      'Izdvajanje CB7-a nije dostupno na ovoj platformi.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Dodatak za izdvajanje CB7-a nije dostupan na ovoj platformi.';

  @override
  String get closeGenrePanel => 'Zatvori ploču žanrova';

  @override
  String get loadingShuffle => 'Učitavanje nasumične reprodukcije...';

  @override
  String get libraryShuffleLabel => 'NASUMIČNO IZ BIBLIOTEKE';

  @override
  String get randomShuffleLabel => 'NASUMIČNI ODABIR';

  @override
  String get genresShuffleLabel => 'NASUMIČNO PO ŽANROVIMA';

  @override
  String get autoHdrSwitching => 'Automatsko prebacivanje na HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Automatski omogući HDR za reprodukciju HDR videa i vrati način prikaza pri izlasku.';

  @override
  String get whenFullscreen => 'U cijelom zaslonu';

  @override
  String get changeArtwork => 'Promijeni grafiku';

  @override
  String get missing => 'Nedostaje';

  @override
  String get transcodingLimits => 'Ograničenja transkodiranja';

  @override
  String get clearAllArtworkButton => 'Očistiti svu grafiku?';

  @override
  String get clearAllArtworkWarning =>
      'Jeste li sigurni da želite očistiti svu preuzetu grafiku?';

  @override
  String get confirmClear => 'Potvrdi čišćenje';

  @override
  String confirmClearMessage(String itemType) {
    return 'Jeste li sigurni da želite očistiti ovo: $itemType?';
  }

  @override
  String get uploadButton => 'Prenijeti?';

  @override
  String get resolutionLabel => 'Razlučivost: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Prikaži samo grafiku na jeziku sučelja';

  @override
  String get confirmClearAll => 'Potvrdi čišćenje svega';

  @override
  String get imageUploadSuccess => 'Slika je uspješno prenesena!';

  @override
  String imageUploadFailed(String error) {
    return 'Prijenos slike nije uspio: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Postavljanje slike nije uspjelo: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Brisanje slike nije uspjelo: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Čišćenje sve grafike nije uspjelo: $error';
  }

  @override
  String get yes => 'Da';

  @override
  String get posterCategory => 'Plakat';

  @override
  String get backdropsCategory => 'Pozadinske slike';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logotip';

  @override
  String get thumbnailCategory => 'Minijatura';

  @override
  String get artCategory => 'Grafika';

  @override
  String get discArtCategory => 'Grafika diska';

  @override
  String get screenshotCategory => 'Snimka zaslona';

  @override
  String get boxCoverCategory => 'Prednja strana kutije';

  @override
  String get boxRearCoverCategory => 'Stražnja strana kutije';

  @override
  String get menuArtCategory => 'Grafika izbornika';

  @override
  String get confirmItemPoster => 'plakat';

  @override
  String get confirmItemBackdrop => 'pozadinska slika';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logotip';

  @override
  String get confirmItemThumbnail => 'minijatura';

  @override
  String get confirmItemArt => 'grafika';

  @override
  String get confirmItemDiscArt => 'grafika diska';

  @override
  String get confirmItemScreenshot => 'snimka zaslona';

  @override
  String get confirmItemBoxCover => 'prednja strana kutije';

  @override
  String get confirmItemBoxRearCover => 'stražnja strana kutije';

  @override
  String get confirmItemMenuArt => 'grafika izbornika';

  @override
  String get resolutionAll => 'Sve';

  @override
  String get resolutionHigh => 'Visoka (1080p+)';

  @override
  String get resolutionMedium => 'Srednja (720p)';

  @override
  String get resolutionLow => 'Niska (<720p)';

  @override
  String get sources => 'Izvori';

  @override
  String get audiobookChapters => 'Poglavlja';

  @override
  String get audiobookBookmarks => 'Oznake';

  @override
  String get audiobookNotes => 'Bilješke';

  @override
  String get audiobookQueue => 'Red';

  @override
  String get audiobookTimeline => 'Vremenska crta';

  @override
  String get audiobookTimelineEmpty => 'Vremenska crta je prazna';

  @override
  String get audiobookWholeBook => 'Cijela knjiga';

  @override
  String get audiobookFocusedTimeline => 'Fokusirana vremenska crta';

  @override
  String get audiobookExportBookmarks => 'Izvezi oznake';

  @override
  String get audiobookExportNotes => 'Izvezi bilješke';

  @override
  String get audiobookExportAll => 'Izvezi sve';

  @override
  String audiobookExportSuccess(String path) {
    return 'Izvezeno u $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Izvoz nije uspio: $error';
  }

  @override
  String get audiobookLyrics => 'Tekst';

  @override
  String get audiobookAddBookmark => 'Dodaj oznaku';

  @override
  String get audiobookAddNote => 'Dodaj bilješku';

  @override
  String get audiobookEditNote => 'Uredi bilješku';

  @override
  String get audiobookNoteHint => 'Napišite bilješku za ovaj trenutak';

  @override
  String get audiobookSleepTimer => 'Mjerač vremena za spavanje';

  @override
  String get audiobookSleepOff => 'Isključeno';

  @override
  String get audiobookSleepEndOfChapter => 'Kraj poglavlja';

  @override
  String get audiobookSleepCustom => 'Prilagođeno';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'još $remaining';
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
  String get audiobookPlaybackSpeed => 'Brzina reprodukcije';

  @override
  String get audiobookRemainingTime => 'Preostalo';

  @override
  String get audiobookElapsedTime => 'Proteklo';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Natrag $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Naprijed $seconds s';
  }

  @override
  String get audiobookPreviousChapter => 'Prethodno poglavlje';

  @override
  String get audiobookNextChapter => 'Sljedeće poglavlje';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Poglavlje $current od $total';
  }

  @override
  String get audiobookNoChapters => 'Nema poglavlja';

  @override
  String get audiobookNoBookmarks => 'Još nema oznaka';

  @override
  String get audiobookNoNotes => 'Još nema bilježaka';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Oznaka dodana na $position';
  }

  @override
  String get audiobookSpeedReset => 'Vrati na 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Spremi';

  @override
  String get audiobookCancel => 'Odustani';

  @override
  String get audiobookDelete => 'Izbriši';

  @override
  String get subtitlePreferences => 'Postavke titlova';

  @override
  String get subtitlePreferencesDescription =>
      'Promijenite načine titlova, zadane jezike, izgled i opcije prikaza.';

  @override
  String get subtitleRendering => 'Prikaz titlova';

  @override
  String get displayOptions => 'Opcije prikaza';

  @override
  String get releaseDateAscending => 'Datum izlaska (uzlazno)';

  @override
  String get releaseDateDescending => 'Datum izlaska (silazno)';

  @override
  String get groupContributions => 'Grupiranje doprinosa';

  @override
  String get groupMultipleRoles => 'Grupiraj više uloga';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Upozorenje o pristupu za pisanje u biblioteku';

  @override
  String get libraryWriteAccessHowToFix => 'Kako to riješiti:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Dodijelite dopuštenja za pisanje korisniku Jellyfin usluge (npr. jellyfin ili Docker PUID/PGID) za mape vaše medijske biblioteke na poslužitelju.\n\n2. Ili idite na Jellyfin nadzornu ploču -> Biblioteke, uredite ovu biblioteku i onemogućite „Spremi grafiku u medijske mape” kako bi se grafika pohranila u Jellyfinovu internu bazu podataka.';

  @override
  String get dismiss => 'Odbaci';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Vaša biblioteka „$libraryName” konfigurirana je za spremanje grafike izravno u medijske mape (uključena je opcija „Spremi grafiku u medijske mape”). Međutim, Jellyfin je testirao pristup za pisanje i nema dopuštenje za pisanje datoteka u ovaj direktorij:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Čini se da Jellyfin nije uspio ažurirati grafiku. Vaša je biblioteka konfigurirana za spremanje grafike izravno u medijske mape (uključena je opcija „Spremi grafiku u medijske mape”). Ova se greška obično javlja kada proces Jellyfin poslužitelja nema dopuštenje za pisanje datoteka u vaše medijske direktorije.';

  @override
  String get externalLists => 'Vanjski popisi';

  @override
  String get replay => 'Ponovi';

  @override
  String get fileInformation => 'Podaci o datoteci';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Veličina: $size  •  Format: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Prikaži sve audiozapise ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Prikaži sve titlove ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Provjera mogućnosti izravne reprodukcije...';

  @override
  String get directPlayCapabilityLabel => 'Mogućnost izravne reprodukcije: ';

  @override
  String get forced => 'Prisilni';

  @override
  String get transcodeContainerNotSupported =>
      'Reproduktor ne podržava format kontejnera.';

  @override
  String get transcodeVideoCodecNotSupported => 'Video kodek nije podržan.';

  @override
  String get transcodeAudioCodecNotSupported => 'Audiokodek nije podržan.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Format titlova nije podržan (zahtijeva utiskivanje).';

  @override
  String get transcodeAudioProfileNotSupported => 'Audioprofil nije podržan.';

  @override
  String get transcodeVideoProfileNotSupported => 'Videoprofil nije podržan.';

  @override
  String get transcodeVideoLevelNotSupported => 'Video razina nije podržana.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Ovaj uređaj ne podržava razlučivost videa.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Dubina boje videa nije podržana.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Brzina kadrova videa nije podržana.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Brzina prijenosa datoteke premašuje ograničenje streaminga reproduktora.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Brzina prijenosa videa premašuje ograničenje streaminga.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Brzina prijenosa zvuka premašuje ograničenje streaminga.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Broj audiokanala nije podržan.';

  @override
  String get sortAlphabetical => 'Abecedno';

  @override
  String get sortReleaseAscending => 'Redoslijed izlaska (uzlazno)';

  @override
  String get sortReleaseDescending => 'Redoslijed izlaska (silazno)';

  @override
  String get sortCustomDragDrop => 'Prilagođeno (povuci i ispusti)';

  @override
  String get playlistSortOptions => 'Opcije sortiranja popisa za reprodukciju';

  @override
  String get resetSort => 'Poništi sortiranje';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Ponovno pogledaj S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Ponovno pogledaj popis za reprodukciju';

  @override
  String get noSubtitlesFound => 'Nisu pronađeni titlovi.';

  @override
  String get adminControls => 'Administratorske kontrole';

  @override
  String get impellerRendering => 'Mehanizam prikaza (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller je Flutterov moderni GPU prikazivač za glađe animacije i manje zastajkivanja. Na nekim TV uređajima i starijim GPU-ovima može uzrokovati smetnje ili crni video; isključite ga ako to primijetite. Automatski odabire najbolju postavku za vaš uređaj. Ponovno pokrenite Moonfin za primjenu.';

  @override
  String get impellerAuto => 'Automatski';

  @override
  String get impellerOn => 'Uključeno';

  @override
  String get impellerOff => 'Isključeno';

  @override
  String get impellerRestartTitle => 'Potrebno je ponovno pokretanje';

  @override
  String get impellerRestartMessage =>
      'Moonfin se mora ponovno pokrenuti za promjenu mehanizma prikaza. Zatvorite aplikaciju sada, a zatim je ponovno otvorite za primjenu.';

  @override
  String get impellerCloseNow => 'Zatvori aplikaciju sada';

  @override
  String get adminRefreshLibrary => 'Osvježi biblioteku';

  @override
  String get adminRefreshAllLibraries => 'Osvježi sve biblioteke';

  @override
  String get adminRepoSortDateOldest => 'Datum dodavanja (najstarije prvo)';

  @override
  String get adminRepoSortDateNewest => 'Datum dodavanja (najnovije prvo)';

  @override
  String get adminRepoSortNameAsc => 'Abecedno (A – Ž)';

  @override
  String get adminRepoSortNameDesc => 'Abecedno (Ž – A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Učitavanje analitike poslužitelja... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Kao izvor';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 filmova';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 TV serija';

  @override
  String get imdbMostPopularMovies => 'IMDb najpopularniji filmovi';

  @override
  String get imdbMostPopularTvShows => 'IMDb najpopularnije TV serije';

  @override
  String get imdbLowestRatedMovies => 'IMDb najlošije ocijenjeni filmovi';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb najbolje ocijenjeni engleski filmovi';
}
