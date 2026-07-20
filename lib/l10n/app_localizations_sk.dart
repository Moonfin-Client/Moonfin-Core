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
  String get accountPreferences => 'PREDVOĽBY ÚČTU';

  @override
  String get interfaceLanguage => 'Jazyk rozhrania';

  @override
  String get systemLanguageDefault => 'Predvolené systémom';

  @override
  String get signIn => 'Prihlásiť sa';

  @override
  String get empty => 'Prázdne';

  @override
  String connectingToServer(String serverName) {
    return 'Pripájanie k serveru $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'heslo';

  @override
  String get username => 'Používateľské meno';

  @override
  String get email => 'E-mail';

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
    return 'QuickConnect nie je dostupný: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nie je dostupný ($status): $detail';
  }

  @override
  String get whosWatching => 'kto sa pozerá?';

  @override
  String get addUser => 'Pridať používateľa';

  @override
  String get selectServer => 'Vyberte Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin verzia $version';
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
    return 'Odstrániť „$serverName“ zo zoznamu serverov?';
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
  String get detailScreenStyle => 'Štýl obrazovky s detailmi';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasický je pôvodné vycentrované rozloženie Moonfin. Moderný je responzívne filmové rozloženie.';

  @override
  String get detailScreenStyleMoonfin => 'Klasický';

  @override
  String get detailScreenStyleModern => 'Moderný';

  @override
  String get expandedTabs => 'Rozbalené karty';

  @override
  String get expandedTabsSubtitle =>
      'Automaticky zobrazovať obsah karty pri prechádzaní kartami. Vypnite, ak chcete karty otvárať a zatvárať ručne.';

  @override
  String get showTechnicalDetails => 'Zobraziť technické podrobnosti?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Zobraziť kodek, rozlíšenie a informácie o streame v súhrne bannera';

  @override
  String get recommendationSystem => 'Systém odporúčaní';

  @override
  String get recommendationSystemSubtitle =>
      'Použite algoritmus Moonfin odporúča pre lokálnu knižnicu alebo online metriky podobnosti TMDb. Poznámka: Online odporúčania vyžadujú integráciu Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin odporúča';

  @override
  String get recommendationSystemTmdb => 'Podobnosť TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Použiť limit rodičovského hodnotenia?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Obmedziť návrhy funkcie Moonfin odporúča podľa rodičovského hodnotenia cieľového média';

  @override
  String get interfaceStyle => 'Štýl rozhrania';

  @override
  String get interfaceStyleSubtitle =>
      'Automatický sa prispôsobí vášmu zariadeniu. Vyberte Apple alebo Material, ak chcete vzhľad vynútiť.';

  @override
  String get interfaceStyleAutomatic => 'Automatický';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Kvalita skla';

  @override
  String get glassQualitySubtitle =>
      'Automatická vyberie najlepší efekt skla pre toto zariadenie. Plná vynúti skutočné rozostrenie, Znížená použije odľahčené sklo, ktoré šetrí výkon GPU.';

  @override
  String get glassQualityAuto => 'Automatická';

  @override
  String get glassQualityFull => 'Plná';

  @override
  String get glassQualityReduced => 'Znížená';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Prepínajte medzi Moonfin a Neon Pulse bez reštartovania aplikácie';

  @override
  String get customThemeTitle => 'Vlastná téma';

  @override
  String get customThemeSubtitle =>
      'Vlastné témy menia vizuálne prvky v celej aplikácii Moonfin. Vyberte si možnosť, ktorá vyhovuje vášmu štýlu.';

  @override
  String get keyboardPreferSystemIme => 'Uprednostniť systémovú klávesnicu';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Na zadávanie textu predvolene používať metódu vstupu vášho zariadenia';

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
  String get themeGlass => 'Sklo';

  @override
  String get themeGlassSubtitle =>
      'Štýl tekutého skla s plynúcim gradientovým pozadím, matnými povrchmi a modrým akcentom Apple';

  @override
  String get theme8BitHero => '8-bitový hrdina';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixel-art štýl s výraznou paletou, hranatými okrajmi, ostrými tieňmi a pixelovým písmom';

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
    return 'Nepodarilo sa pripojiť k $target';
  }

  @override
  String get exitApp => 'Odísť z Moonfin?';

  @override
  String get exitAppConfirmation => 'Naozaj chcete skončiť?';

  @override
  String get exit => 'VÝCHOD';

  @override
  String get gameMenu => 'Ponuka';

  @override
  String get gamePaused => 'Pozastavené';

  @override
  String get gameSaveState => 'Uložiť stav';

  @override
  String get games => 'Hry';

  @override
  String get gameLoadState => 'Načítať stav';

  @override
  String get gameFastForward => 'Zrýchlene vpred';

  @override
  String get gameEmulatorSettings => 'Nastavenia emulátora';

  @override
  String get gameNoCoreOptions =>
      'Toto jadro nemá žiadne nastaviteľné možnosti.';

  @override
  String get gameHoldToOpenMenu => 'Podržaním otvoríte ponuku';

  @override
  String get gamePlaybackUnsupported =>
      'Hranie hier zatiaľ nie je na tomto zariadení podporované.';

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
  String get series => 'Seriály';

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
    return 'Priečinok sa nepodarilo načítať: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Tento priečinok je prázdny';

  @override
  String itemCountLabel(int count) {
    return '$count položiek';
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
    return '$count položiek';
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
    return '$name — Žánre';
  }

  @override
  String get views => 'Zobrazenia';

  @override
  String get albums => 'Albumy';

  @override
  String get albumArtists => 'Umelci albumov';

  @override
  String get artists => 'Interpreti';

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
    return 'pred $count min';
  }

  @override
  String hoursAgo(int count) {
    return 'pred $count h';
  }

  @override
  String daysAgo(int count) {
    return 'pred $count d';
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
    return '$count titulov';
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
  String get resume => 'Pokračovať';

  @override
  String get failedToLoadLibrary => 'Nepodarilo sa načítať knižnicu';

  @override
  String get popularNow => 'Populárne teraz';

  @override
  String get savedForLater => 'Uložené na neskôr';

  @override
  String get topListens => 'Najpočúvanejšie';

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
    return '$count autorov';
  }

  @override
  String genresCount(int count) {
    return '$count žánrov';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent % dokončené';
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
    return '$count titulov usporiadaných na prehliadanie so zameraním na čítanie.';
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
    return 'Nenašli sa žiadne $label';
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
  String get watched => 'Pozreté';

  @override
  String get unread => 'Neprečítané';

  @override
  String get unwatched => 'Nepozreté';

  @override
  String get seriesStatus => 'Stav série';

  @override
  String get allLibraries => 'Všetky knižnice';

  @override
  String get books => 'knihy';

  @override
  String get latestBooks => 'Najnovšie knihy';

  @override
  String get latestAudiobooks => 'Najnovšie audioknihy';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kníh',
      many: '$count knihy',
      few: '$count knihy',
      one: '1 kniha',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Kniha';

  @override
  String get bookFormatAudiobook => 'Audiokniha';

  @override
  String bookPercentRead(int percent) {
    return '$percent % prečítané';
  }

  @override
  String bookTimeLeft(String time) {
    return 'zostáva $time';
  }

  @override
  String get bookHeroRead => 'Čítať';

  @override
  String get bookHeroListen => 'Počúvať';

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
    return '$count častí';
  }

  @override
  String firstPublished(int year) {
    return 'Prvé vydanie $year';
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
    return '$count kníh';
  }

  @override
  String get couldNotLoadSubject =>
      'Túto tému sa momentálne nepodarilo načítať.';

  @override
  String get audiobookDetails => 'Podrobnosti o audioknihe';

  @override
  String authorsCountTitle(int count) {
    return '$count autorov';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiokníh',
      many: '$count audioknihy',
      few: '$count audioknihy',
      one: '1 audiokniha',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Zoznam skladieb';

  @override
  String get itemListPlaceholder => 'Tu sa zobrazí zoznam položiek';

  @override
  String get failedToLoad => 'Načítanie zlyhalo';

  @override
  String get delete => 'Vymazať';

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
  String get seasons => 'Série';

  @override
  String get chapters => 'kapitoly';

  @override
  String get features => 'Vlastnosti';

  @override
  String get movies => 'Filmy';

  @override
  String get musicVideos => 'Hudobné videá';

  @override
  String get other => 'Iné';

  @override
  String get discography => 'Diskografia';

  @override
  String get similarArtists => 'Podobní umelci';

  @override
  String get tableOfContents => 'Obsah';

  @override
  String get tracklist => 'Zoznam skladieb';

  @override
  String discNumber(int number) {
    return 'Disk $number';
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
    return 'Vydané $year';
  }

  @override
  String get publicationDateUnknown => 'Dátum vydania neznámy';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sezón',
      many: '$count sezóny',
      few: '$count sezóny',
      one: '1 sezóna',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Skončí o $time';
  }

  @override
  String get items => 'Položky';

  @override
  String get extras => 'Bonusy';

  @override
  String get behindTheScenes => 'Zo zákulisia';

  @override
  String get deletedScenes => 'Vystrihnuté scény';

  @override
  String get featurettes => 'Krátke dokumenty';

  @override
  String get interviews => 'Rozhovory';

  @override
  String get scenes => 'Scény';

  @override
  String get shorts => 'Krátke filmy';

  @override
  String get trailers => 'Ukážky';

  @override
  String timeRemaining(String time) {
    return 'zostáva $time';
  }

  @override
  String endsIn(String time) {
    return 'Skončí za $time';
  }

  @override
  String get view => 'Zobraziť';

  @override
  String get resumeReading => 'Pokračovať v čítaní';

  @override
  String get read => 'Prečítajte si';

  @override
  String resumeFrom(String position) {
    return 'Pokračovať od $position';
  }

  @override
  String get play => 'Prehrať';

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
  String get cast => 'Preniesť';

  @override
  String get trailer => 'Ukážka';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Premenovať zoznam skladieb';

  @override
  String get playlistName => 'Názov zoznamu skladieb';

  @override
  String get deleteDownloadedAlbum => 'Odstrániť stiahnutý album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Odstrániť stiahnuté skladby pre „$title“?';
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
    return 'Nenačítali sa žiadne $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Sťahuje sa $title ($count položiek)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Naozaj chcete odstrániť „$name“ zo servera? Túto akciu nie je možné vrátiť späť.';
  }

  @override
  String get itemDeleted => 'Položka bola odstránená';

  @override
  String get noPlayableTrailerFound => 'Nenašla sa žiadna hrateľná upútavka.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Nepodporovaný formát knihy: .$extension';
  }

  @override
  String get audioTrack => 'Zvuková stopa';

  @override
  String get subtitleTrack => 'Titulková stopa';

  @override
  String get none => 'Žiadne';

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
    return 'Titulky stiahnuté a vybraté: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Titulky stiahnuté. Kým Jellyfin obnoví položku, môže chvíľu trvať, kým sa objaví.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nenašli sa žiadne vzdialené titulky pre jazyk $language.';
  }

  @override
  String get selectVersion => 'Vyberte Verzia';

  @override
  String versionNumber(int number) {
    return 'Verzia $number';
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
    return 'Sťahuje sa $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Odstrániť stiahnuté súbory';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Odstrániť lokálne súbory pre $typeLabel?\n\nUvoľní sa tým miesto v úložisku. Neskôr ich môžete stiahnuť znova.';
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
  String get directors => 'REŽISÉRI';

  @override
  String get writer => 'SCENÁRISTA';

  @override
  String get writers => 'SCENÁRISTI';

  @override
  String get studio => 'ŠTÚDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count ďalších';
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
    return 'Epizóda $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Kapitola $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skladieb',
      many: '$count skladby',
      few: '$count skladby',
      one: '1 skladba',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kapitol',
      many: '$count kapitoly',
      few: '$count kapitoly',
      one: '1 kapitola',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Narodenie $date';
  }

  @override
  String died(String date) {
    return 'Úmrtie $date';
  }

  @override
  String age(int age) {
    return 'Vek $age';
  }

  @override
  String get showLess => 'Zobraziť menej';

  @override
  String get readMore => 'Prečítajte si viac';

  @override
  String get shuffle => 'Náhodne';

  @override
  String get shuffleAllMusic => 'Prehrať všetku hudbu náhodne';

  @override
  String get carSignInPrompt => 'Prihláste sa do Moonfin v telefóne';

  @override
  String get carServerUnreachable => 'Server je nedostupný';

  @override
  String downloadsCount(int count) {
    return '$count stiahnutí';
  }

  @override
  String get perfectMatch => 'Perfektná zhoda';

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
    return 'Akcia vzdialených titulkov ($action) vyžaduje pre tohto používateľa oprávnenie Jellyfin na správu titulkov.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Táto položka sa na serveri nenašla pre akciu vzdialených titulkov ($action).';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Akcia vzdialených titulkov ($action) zlyhala: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Akcia vzdialených titulkov ($action) zlyhala (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Nepodarilo sa vykonať akciu $action pre vzdialené titulky.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'všetky stiahnuté epizódy pre „$name“';
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
    return 'Akcia $label zlyhala: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Nepodarilo sa nastaviť hlasitosť odosielania: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Ovládanie $label';
  }

  @override
  String get deviceVolume => 'Hlasitosť zariadenia';

  @override
  String get unavailable => 'nedostupné';

  @override
  String get pause => 'Pozastaviť';

  @override
  String get syncPosition => 'Synchronizovať pozíciu';

  @override
  String stopCast(String label) {
    return 'Zastaviť $label';
  }

  @override
  String get queueIsEmpty => 'Poradie je prázdne';

  @override
  String trackNumber(int number) {
    return 'Skladba $number';
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
    return '$seconds sekúnd';
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
  String get auto => 'Automaticky';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mb/s';
  }

  @override
  String get bitrateOverride => 'Prepísanie bitovej rýchlosti';

  @override
  String get audioDelay => 'Oneskorenie zvuku';

  @override
  String delayMinusMs(int value) {
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
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
  String get playMethod => 'Spôsob prehrávania';

  @override
  String get directPlay => 'Priame prehrávanie';

  @override
  String get directStream => 'Priamy stream';

  @override
  String get transcoding => 'Prekódovanie';

  @override
  String get transcodeReasons => 'Dôvody transkódovania';

  @override
  String get player => 'Prehrávač';

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
  String get track => 'Stopa';

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
    return 'Chyba relácie $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Nepodarilo sa načítať podrobnosti o knihe: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Vykresľovanie EPUB v aplikácii zatiaľ nie je na tejto platforme dostupné.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Tento formát (.$extension) sa zatiaľ nedá zobraziť v aplikácii.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Na tejto platforme nie je k dispozícii vykresľovanie vstavaných dokumentov.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nepodarilo sa otvoriť externý prehliadač.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Nepodarilo sa otvoriť čítačku v aplikácii: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Záložka je už uložená na $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Záložka pridaná: $label';
  }

  @override
  String get noBookmarksYet =>
      'Zatiaľ žiadne záložky.\nKlepnutím na ikonu záložky počas čítania uložíte svoju pozíciu.';

  @override
  String get noTableOfContentsAvailable => 'Nie je k dispozícii žiadny obsah';

  @override
  String pageLabel(int number) {
    return 'Strana $number';
  }

  @override
  String get position => 'pozícia';

  @override
  String get bookReader => 'Čítačka kníh';

  @override
  String formatExtension(String extension) {
    return 'Formát: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent % prečítané';
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
    return 'Obnoviť priblíženie (${zoom}x)';
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
    return 'Nepodarilo sa aktualizovať stav prečítania: $error';
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
    return 'Táto platforma nedokáže spustiť vstavaný dokumentový engine pre súbory $extension.';
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
    return 'Nepodarilo sa načítať TV program: $error';
  }

  @override
  String get noChannelsFound => 'Nenašli sa žiadne kanály';

  @override
  String get liveBadge => 'NAŽIVO';

  @override
  String guideNextProgram(String time, String title) {
    return 'Ďalej: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'zostáva $minutes min';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'zostáva $hours h';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'zostáva $hours h $minutes min';
  }

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
  String get record => 'Nahrať';

  @override
  String get cancelRecordingAction => 'Zrušiť nahrávanie';

  @override
  String get programSetToRecord => 'Nahrávanie programu je naplánované';

  @override
  String get recordingCancelled => 'Nahrávanie zrušené';

  @override
  String get unableToCreateRecording => 'Nepodarilo sa vytvoriť nahrávku';

  @override
  String get watch => 'Sledovať';

  @override
  String get close => 'Zavrieť';

  @override
  String failedToPlayChannel(String name) {
    return 'Nepodarilo sa prehrať $name';
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
    return 'Zrušiť naplánované nahrávanie „$name“?';
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
    return 'Zastaviť nahrávanie „$name“?';
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
    return 'Žiadne výsledky pre „$query“';
  }

  @override
  String searchFailedError(String error) {
    return 'Vyhľadávanie zlyhalo: $error';
  }

  @override
  String get seerr => 'Seerr';

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
    return 'Odstrániť „$name“ a súvisiace súbory?';
  }

  @override
  String tracksCount(int count) {
    return '$count skladieb';
  }

  @override
  String get album => 'album';

  @override
  String get playAlbum => 'Prehrať album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Nepodarilo sa načítať album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Pre album $name sa nenašli žiadne stiahnuté skladby.';
  }

  @override
  String get season => 'Séria';

  @override
  String get errorLoadingEpisodes => 'Chyba pri načítavaní epizód';

  @override
  String get noDownloadedEpisodes => 'Žiadne stiahnuté epizódy';

  @override
  String get deleteEpisode => 'Odstrániť epizódu';

  @override
  String removeName(String name) {
    return 'Odstrániť „$name“?';
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
    return 'Epizóda $number';
  }

  @override
  String get seriesNotFound => 'Séria sa nenašla';

  @override
  String get errorLoadingSeries => 'Chyba pri načítavaní série';

  @override
  String get downloadedEpisodes => 'Stiahnuté epizódy';

  @override
  String seasonNumber(int number) {
    return 'Sezóna $number';
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
    return 'Odstrániť všetky stiahnuté epizódy v $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count epizód',
      many: '$count epizódy',
      few: '$count epizódy',
      one: '1 epizóda',
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
    return 'Odstrániť $count stiahnutých položiek?';
  }

  @override
  String get musicAndAudiobooks => 'Hudba a audioknihy';

  @override
  String get images => 'Obrázky';

  @override
  String get database => 'Databáza';

  @override
  String ofStorageLimit(String limit) {
    return 'z limitu $limit';
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
    return '$count možností';
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
  String get themeMusicSettingsSubtitle =>
      'Stránky s detailmi, riadky na domovskej obrazovke a hlasitosť';

  @override
  String percentValue(int value) {
    return '$value %';
  }

  @override
  String get themeMusicOnHomeRows => 'Téma Hudba na Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Prehrať pri prehliadaní domovskej obrazovky';

  @override
  String get loopThemeMusic => 'Opakovať tematickú hudbu';

  @override
  String get loopThemeMusicSubtitle =>
      'Prehrávať skladbu dokola namiesto jedného prehratia';

  @override
  String get detailsBackgroundBlur => 'Podrobnosti rozostrenie pozadia';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value px';
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
  String get settingsScrollWheelAction => 'Koliesko myši';

  @override
  String get settingsScrollWheelActionDescription =>
      'Vyberte, čo sa má diať pri rolovaní kolieskom myši nad videom počas prehrávania.';

  @override
  String get scrollWheelActionOff => 'Vypnuté';

  @override
  String get scrollWheelActionSeek => 'Posun (dopredu/dozadu)';

  @override
  String get scrollWheelActionVolume => 'Hlasitosť';

  @override
  String get playerTooltipVolume => 'Hlasitosť';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Automatické orezanie';

  @override
  String get stretch => 'Natiahnuť';

  @override
  String get refreshRateSwitching => 'Prepínanie obnovovacej frekvencie';

  @override
  String get disabled => 'Vypnuté';

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
  String get fallbackAudioLanguage => 'Záložný jazyk zvuku';

  @override
  String get preferDefaultAudioTrack => 'Uprednostniť predvolenú zvukovú stopu';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Uprednostniť pôvodnú zvukovú stopu pred lokalizovaným dabingom.';

  @override
  String get preferAudioDescription => 'Uprednostniť stopy s audio popisom';

  @override
  String get preferAudioDescriptionDescription =>
      'Uprednostniť stopy s audio popisom pred bežnými stopami.';

  @override
  String get transcodingAudio => 'Prekódovanie (zvuk)';

  @override
  String get directStreamRemux => 'Priamy stream (remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Prekódovanie (bitový tok alebo rozlíšenie)';

  @override
  String get transcodingVideoAndAudio => 'Prekódovanie (video a zvuk)';

  @override
  String get transcodingVideo => 'Prekódovanie (video)';

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
  String get ac3Passthrough => 'Passthrough AC3';

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
  String get settingsAudioOutputMode => 'Režim zvukového výstupu';

  @override
  String get settingsAudioOutputModeDescription =>
      'Vyberte, ako sa má zvuk dekódovať. AVR Passthrough posiela surové streamy Dolby/DTS do vášho receivera, Automaticky alebo Downmix dekódujú lokálne.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Záložný zvukový kodek';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Vyberte cieľový formát na prekódovanie viackanálového zvuku, keď zdrojový stream nie je možné priamo prehrať ani preposlať.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Automaticky zistiť\n(odporúčané)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(predvolené)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(bezstratový)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(len stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(efektívny)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(bezstratový)';

  @override
  String get settingsMaxAudioChannels => 'Maximálny počet zvukových kanálov';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Nastavte maximálny počet kanálov vašej zvukovej zostavy. Viackanálové streamy, ktoré tento limit prekročia, sa zmixujú alebo prekódujú.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Automaticky zistiť\n(predvolené hardvérom)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Kvadrofónny';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (pokročilé)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough kodekov';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Povoľte iba formáty, ktoré podporuje váš AVR alebo HDMI zariadenie.';

  @override
  String get settingsAudioEac3Passthrough => 'Passthrough EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'Passthrough EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough => 'Passthrough DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'Passthrough DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'Passthrough TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'Passthrough TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Posielať bitstream Dolby Digital Plus (EAC3) do externého dekodéra.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Posielať bitstream Dolby Atmos cez EAC3 (JOC) do externého dekodéra.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Posielať bitstream DTS-HD MA (vrátane jadra DTS) do externého dekodéra.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Posielať bitstream Dolby TrueHD s metadátami Atmos do externého dekodéra.';

  @override
  String get settingsDetectedAudioCapabilities => 'Zistené zvukové schopnosti';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Zatiaľ nie je k dispozícii žiadna snímka schopností za behu.';

  @override
  String get settingsAudioRouteLabel => 'Trasa';

  @override
  String get settingsAudioDecodeLabel => 'Dekódovanie';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Trasa pre HD zvuk';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Reproduktor';

  @override
  String get settingsAudioRouteHeadphones => 'Slúchadlá';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostika';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Úroveň videa';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Rozsah videa';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Kodek titulkov';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Povolené zvukové kodeky';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Zvukové kodeky HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Zvukové kodeky HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'passthrough audio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Aktívna zvuková trasa';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Podpora HD zvuku na trase';

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
    return '$value s';
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
    return 'Po $episodes epizódach / $hours h';
  }

  @override
  String get resumeAndSkip => 'Obnoviť a preskočiť';

  @override
  String get resumeRewind => 'Pretočenie pri pokračovaní';

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
  String get subtitleMode => 'Režim titulkov';

  @override
  String get subtitleModeFlagged => 'Označené';

  @override
  String get subtitleModeAlways => 'Vždy';

  @override
  String get subtitleModeForeign => 'Cudzojazyčné';

  @override
  String get subtitleModeForced => 'Vynútené';

  @override
  String get subtitleModeFlaggedDescription =>
      'Prehrá stopy, ktoré sú v metadátach mediálneho súboru interne označené ako „default“ alebo „forced“.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Automaticky načíta a zobrazí titulky pri každom spustení videa.';

  @override
  String get subtitleModeForeignDescription =>
      'Automaticky zapne titulky, ak je predvolená zvuková stopa v cudzom jazyku.';

  @override
  String get subtitleModeForcedDescription =>
      'Načíta iba titulky výslovne označené príznakom „forced“.';

  @override
  String get subtitleModeNoneDescription =>
      'Úplne vypne automatické načítanie titulkov.';

  @override
  String get fallbackSubtitleLanguage => 'Záložný jazyk titulkov';

  @override
  String get subtitleStream => 'Stream titulkov';

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
  String get desktop => 'Počítač';

  @override
  String get mobile => 'Mobil';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Načítali sa nastavenia profilu $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nepodarilo sa načítať nastavenia profilu $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Lokálne nastavenia sa synchronizovali s profilom $profile.';
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
  String get reportDownloadsActivity => 'Zobrazovať sťahovania na serveri';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Umožniť správcovi servera vidieť vaše prekódované sťahovania na nástenke';

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
  String get navbarAlwaysExpanded => 'Vždy zobrazovať popisy v navigácii';

  @override
  String get showSeerrButton => 'Zobraziť tlačidlo Seerr';

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
  String get teal => 'Modrozelená';

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
  String get indigo => 'Indigová';

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
  String get groupItemsIntoCollections => 'Zoskupiť položky do kolekcií';

  @override
  String get hideCollectionAssociatedItems =>
      'Skryť položky knižnice patriace do kolekcie pri prehliadaní knižníc';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Upozornenie o zoskupovaní knižnice';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Ak chcete použiť toto nastavenie, uistite sa, že sú v nastaveniach zobrazenia vašej knižnice na serveri Jellyfin alebo Emby zapnuté možnosti „Group movies into collections“ alebo „Group shows into collections“.';

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
    return '$count vybratých';
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
      'Vyberte si medzi rôznymi štýlmi mediálneho panela alebo mediálny panel vypnite';

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
  String get autoAdvance => 'Automatický posun';

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
  String get trailerAudio => 'Zvuk ukážok';

  @override
  String get enableTrailerAudio => 'Zapnúť zvuk ukážok v mediálnom paneli';

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
  String get resumeBooks => 'Pokračovať v knihách';

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
  String get fullScreenRows => 'Rozšírené riadky na domovskej obrazovke';

  @override
  String get fullScreenRowsDescription =>
      'Obmedziť domovskú obrazovku na 1 riadok naraz';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Typ obrázka na riadok';

  @override
  String get perRowSettings => 'Nastavenia po riadkoch';

  @override
  String get autoLogin => 'Automatické prihlásenie';

  @override
  String get lastUser => 'Posledný používateľ';

  @override
  String get currentUser => 'Aktuálny používateľ';

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
  String get clockModeStatic => 'Statické';

  @override
  String get clockModeBouncing => 'Poskakujúce';

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
  String get pluginLabel => 'Doplnok Moonbase';

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
    return '$status\nVerzia: $version';
  }

  @override
  String get availableServices => 'Dostupné služby';

  @override
  String get serverPluginSync => 'Synchronizácia serverového pluginu';

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
  String get seerrDiscoveryRows => 'Objavovacie riadky Seerr';

  @override
  String get resetRowsToDefaults => 'Obnovte predvolené hodnoty riadkov';

  @override
  String get enableSeerr => 'Povoliť Seerr';

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
  String get seerrNotificationsSection => 'Upozornenia';

  @override
  String get seerrNotifyNewRequestsTitle => 'Upozornenia na nové žiadosti';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Upozorniť ma, keď niekto odošle žiadosť';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Aktualizácie žiadostí';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Schválené, zamietnuté a pridané do vašej knižnice';

  @override
  String get seerrNotifyIssuesTitle => 'Aktualizácie problémov';

  @override
  String get seerrNotifyIssuesSubtitle => 'Nové problémy, odpovede a riešenia';

  @override
  String loggedInAs(String username) {
    return 'Prihlásený ako: $username';
  }

  @override
  String get discoverRows => 'Stránka objavovania Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Povoľte riadky, ktoré chcete vidieť na hlavnej stránke Seerr. Presunutím zmeníte poradie. Vlastné poradie sa synchronizuje s doplnkom Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Povoľte riadky, ktoré chcete vidieť na hlavnej stránke Seerr. Presunutím zmeníte poradie. Vlastné poradie sa synchronizuje s doplnkom Moonbase.';

  @override
  String get enabled => 'Zapnuté';

  @override
  String get hidden => 'Skryté';

  @override
  String get aboutTitle => 'O';

  @override
  String versionValue(String version) {
    return 'Verzia $version';
  }

  @override
  String get openSourceLicenses => 'Licencie otvoreného zdroja';

  @override
  String get sourceCode => 'Zdrojový kód';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'Dostupná aktualizácia: v$version';
  }

  @override
  String get updateNotifications => 'Aktualizovať upozornenia';

  @override
  String get showWhenUpdatesAvailable =>
      'Zobraziť, kedy sú dostupné aktualizácie';

  @override
  String updateAvailableTitle(String version) {
    return 'Verzia v$version je dostupná';
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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limit vyrovnávacej pamäte obrázkov';

  @override
  String get clearImageCache => 'Vymazať vyrovnávaciu pamäť obrázkov';

  @override
  String get imageCacheCleared => 'Vyrovnávacia pamäť obrázkov je vymazaná';

  @override
  String get clear => 'Vymazať';

  @override
  String get browse => 'Prehľadávať';

  @override
  String get noResults => 'Žiadne výsledky';

  @override
  String get seerrAvailableStatus => 'Dostupné';

  @override
  String get seerrRequestedStatus => 'Požadované';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Sťahuje sa · $percent %';
  }

  @override
  String get seerrImportingStatus => 'Importuje sa';

  @override
  String itemsCount(int count) {
    return '$count položiek';
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
    return 'Požiadal $name';
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
    return 'Zrušiť žiadosť o „$title“?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Zrušiť $count žiadostí o „$title“?';
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
    return 'Rozpočet: $amount \$';
  }

  @override
  String revenueAmount(String amount) {
    return 'Tržby: $amount \$';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Požiadať o $type';
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
  String get appearances => 'Účinkovanie';

  @override
  String get crewSection => 'Posádka';

  @override
  String ageValue(int age) {
    return 'vek $age';
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
  String get failedStatus => 'Zlyhalo';

  @override
  String get processingStatus => 'Spracováva sa';

  @override
  String modifiedByName(String name) {
    return 'Upravil $name';
  }

  @override
  String get completedStatus => 'Dokončené';

  @override
  String get requestErrorDuplicate => 'O tento titul už bolo požiadané';

  @override
  String get requestErrorQuota => 'Dosiahli ste limit žiadostí';

  @override
  String get requestErrorBlocklisted => 'Tento titul je na zozname blokovaných';

  @override
  String get requestErrorNoSeasons =>
      'Nezostali žiadne sezóny, o ktoré možno požiadať';

  @override
  String get requestErrorPermission =>
      'Nemáte oprávnenie na vytvorenie tejto žiadosti';

  @override
  String get seerrRequestsTitle => 'Žiadosti';

  @override
  String get seerrIssuesTitle => 'Problémy';

  @override
  String get sortNewest => 'Najnovšie';

  @override
  String get sortLastModified => 'Naposledy upravené';

  @override
  String get noIssues => 'Žiadne problémy';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Zostáva $remaining z $limit žiadostí o filmy';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Zostáva $remaining z $limit žiadostí o sezóny';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Súčasť kolekcie $name';
  }

  @override
  String get viewCollection => 'Zobraziť kolekciu';

  @override
  String get requestCollection => 'Požiadať o kolekciu';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmov · $available dostupných';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Požiadať o $count filmov';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Odosiela sa žiadosť $current z $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Požiadané o $count filmov';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Požiadané o $ok z $total filmov';
  }

  @override
  String get collectionAllRequested =>
      'Všetky filmy sú už dostupné alebo požiadané';

  @override
  String get reportIssue => 'Nahlásiť problém';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Zvuk';

  @override
  String get whatsWrong => 'V čom je problém?';

  @override
  String get allEpisodes => 'Všetky epizódy';

  @override
  String get episode => 'Epizóda';

  @override
  String get openStatus => 'Otvorené';

  @override
  String get resolvedStatus => 'Vyriešené';

  @override
  String get resolveAction => 'Vyriešiť';

  @override
  String get reopenAction => 'Znova otvoriť';

  @override
  String reportedByName(String name) {
    return 'Nahlásil $name';
  }

  @override
  String commentsCount(int count) {
    return '$count komentárov';
  }

  @override
  String get addComment => 'Pridať komentár';

  @override
  String get deleteIssueConfirm => 'Odstrániť tento problém?';

  @override
  String get submitReport => 'Odoslať hlásenie';

  @override
  String get tmdbScore => 'Skóre TMDB';

  @override
  String get releaseDateLabel => 'Dátum vydania';

  @override
  String get firstAirDateLabel => 'Dátum prvého vysielania';

  @override
  String get revenueLabel => 'Výnosy';

  @override
  String get runtimeLabel => 'Dĺžka';

  @override
  String get budgetLabel => 'Rozpočet';

  @override
  String get originalLanguageLabel => 'Pôvodný jazyk';

  @override
  String get seasonsLabel => 'Série';

  @override
  String get episodesLabel => 'Epizódy';

  @override
  String get access => 'Prístup';

  @override
  String get add => 'Pridať';

  @override
  String get address => 'Adresa';

  @override
  String get analytics => 'Analytika';

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
  String get general => 'Všeobecné';

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
  String get role => 'Rola';

  @override
  String get root => 'Koreň';

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
  String get stop => 'Zastaviť';

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
  String get adminDrawerDashboard => 'Nástenka';

  @override
  String get adminDrawerAnalytics => 'Analytika';

  @override
  String get adminDrawerSettings => 'Nastavenia';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Používatelia';

  @override
  String get adminDrawerLibraries => 'Knižnice';

  @override
  String get adminDrawerDisplay => 'Zobrazenie';

  @override
  String get adminDrawerMetadata => 'Metadáta';

  @override
  String get adminDrawerNfo => 'Nastavenia NFO';

  @override
  String get adminDrawerTranscoding => 'Prekódovanie';

  @override
  String get adminDrawerResume => 'Pokračovať';

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
    return 'Dostupné aktualizácie pluginov: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Pluginy vyžadujúce reštart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Zlyhané naplánované úlohy: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Nedávne varovania/chyby: $count';
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
    return 'Chyba: $error';
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
    return 'Príkaz zlyhal: $error';
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
  String get sessionNext => 'Ďalšie';

  @override
  String get sessionVolumeDown => 'Hlas. –';

  @override
  String get sessionVolumeUp => 'Hlas. +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Prehráva sa';

  @override
  String get volume => 'Hlasitosť';

  @override
  String get actions => 'Akcie';

  @override
  String get videoCodec => 'Video kodek';

  @override
  String get audioCodec => 'Audio kodek';

  @override
  String get hwAccel => 'HW akcelerácia';

  @override
  String get completion => 'Dokončenie';

  @override
  String get direct => 'Priame';

  @override
  String get adminDisconnect => 'Odpojiť';

  @override
  String get adminClearDates => 'Vymazať dátumy';

  @override
  String get adminActivitySeverityAll => 'Všetky závažnosti';

  @override
  String get adminActivityDateRange => 'Rozsah dátumov';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Nepodarilo sa načítať denník aktivity: $error';
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
    return 'Nepodarilo sa aktualizovať zariadenie: $error';
  }

  @override
  String get adminDeleteDevice => 'Odstrániť zariadenie';

  @override
  String get adminDeviceDeleted => 'Zariadenie bolo odstránené';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Nepodarilo sa odstrániť zariadenie: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Odstrániť zariadenie „$name“? Používateľ sa bude musieť na tomto zariadení znova prihlásiť.';
  }

  @override
  String get adminDeleteAllDevices => 'Odstrániť všetky zariadenia';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Odstrániť $count zariadení? Dotknutí používatelia sa budú musieť znova prihlásiť. Vaše aktuálne zariadenie to neovplyvní.';
  }

  @override
  String get adminDevicesDeletedAll => 'Zariadenia odstránené';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Niektoré zariadenia boli odstránené, $count sa odstrániť nepodarilo.';
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
    return 'Nepodarilo sa spustiť skenovanie: $error';
  }

  @override
  String get adminRenameLibrary => 'Premenovať knižnicu';

  @override
  String get adminNewName => 'Nové meno';

  @override
  String adminLibraryRenamed(String name) {
    return 'Knižnica bola premenovaná na „$name“';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Nepodarilo sa premenovať: $error';
  }

  @override
  String get adminDeleteLibrary => 'Odstrániť knižnicu';

  @override
  String adminLibraryDeleted(String name) {
    return 'Knižnica „$name“ bola odstránená';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Nepodarilo sa odstrániť knižnicu: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Nepodarilo sa pridať cestu: $error';
  }

  @override
  String get adminRemovePath => 'Odstrániť cestu';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Odstrániť „$path“ z tejto knižnice?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Nepodarilo sa odstrániť cestu: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Možnosti knižnice boli uložené';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Nepodarilo sa uložiť možnosti: $error';
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
  String get adminLibraryTabPaths => 'Cesty';

  @override
  String get adminLibraryTabOptions => 'Možnosti';

  @override
  String get adminLibraryTabDownloaders => 'Sťahovače';

  @override
  String get adminLibMetadataSavers => 'Ukladače metadát';

  @override
  String get adminLibSubtitleDownloaders => 'Sťahovače titulkov';

  @override
  String get adminLibLyricDownloaders => 'Sťahovače textov piesní';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Sťahovače metadát: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Načítavače obrázkov: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Tento server neponúka žiadne sťahovače pre tento typ knižnice.';

  @override
  String get adminLibrarySectionGeneral => 'Všeobecné';

  @override
  String get adminLibrarySectionMetadata => 'Metadáta';

  @override
  String get adminLibrarySectionEmbedded => 'Vložené informácie';

  @override
  String get adminLibrarySectionSubtitles => 'Titulky';

  @override
  String get adminLibrarySectionImages => 'Obrázky';

  @override
  String get adminLibrarySectionSeries => 'Seriály';

  @override
  String get adminLibrarySectionMusic => 'Hudba';

  @override
  String get adminLibrarySectionMovies => 'Filmy';

  @override
  String get adminLibRealtimeMonitor => 'Zapnúť monitorovanie v reálnom čase';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Zisťovať zmeny súborov a automaticky ich spracovať.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Považovať archívy za mediálne súbory';

  @override
  String get adminLibEnablePhotos => 'Zobrazovať fotografie';

  @override
  String get adminLibSaveLocalMetadata =>
      'Ukladať obrázky do mediálnych priečinkov';

  @override
  String get adminLibRefreshInterval => 'Automatická obnova metadát';

  @override
  String get adminLibRefreshNever => 'Nikdy';

  @override
  String get adminLibDefault => 'Predvolené';

  @override
  String get adminLibDisplayTitle => 'Zobrazenie';

  @override
  String get adminLibDisplaySection => 'Zobrazenie knižnice';

  @override
  String get adminLibFolderView =>
      'Zobraziť priečinkové zobrazenie s čistými mediálnymi priečinkami';

  @override
  String get adminLibSpecialsInSeasons =>
      'Zobrazovať špeciály v sezónach, v ktorých boli odvysielané';

  @override
  String get adminLibGroupMovies => 'Zoskupiť filmy do kolekcií';

  @override
  String get adminLibGroupShows => 'Zoskupiť seriály do kolekcií';

  @override
  String get adminLibExternalSuggestions =>
      'Zobrazovať externý obsah v návrhoch';

  @override
  String get adminLibDateAddedSection => 'Správanie dátumu pridania';

  @override
  String get adminLibDateAddedLabel => 'Použiť dátum pridania z';

  @override
  String get adminLibDateAddedImport => 'Dátum naskenovania do knižnice';

  @override
  String get adminLibDateAddedFile => 'Dátum vytvorenia súboru';

  @override
  String get adminLibMetadataTitle => 'Metadáta a obrázky';

  @override
  String get adminLibMetadataLangSection => 'Preferovaný jazyk metadát';

  @override
  String get adminLibChaptersSection => 'Kapitoly';

  @override
  String get adminLibDummyChapterDuration =>
      'Dĺžka zástupných kapitol (sekundy)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Dĺžka kapitol vygenerovaných pre médiá, ktoré žiadne nemajú. Nastavením na 0 túto možnosť vypnete.';

  @override
  String get adminLibChapterImageResolution => 'Rozlíšenie obrázkov kapitol';

  @override
  String get adminLibNfoTitle => 'Nastavenia NFO';

  @override
  String get adminLibNfoHelp =>
      'Metadáta NFO sú kompatibilné s Kodi a podobnými klientmi. Nastavenia platia pre všetky knižnice, ktoré ukladajú metadáta NFO.';

  @override
  String get adminLibKodiUser =>
      'Používateľ, pre ktorého sa v súboroch NFO ukladajú údaje o sledovaní';

  @override
  String get adminLibSaveImagePaths =>
      'Ukladať cesty k obrázkom do súborov NFO';

  @override
  String get adminLibPathSubstitution =>
      'Zapnúť náhradu ciest pre cesty k obrázkom v NFO';

  @override
  String get adminLibExtraThumbs =>
      'Kopírovať obrázky extrafanart do priečinka extrathumbs';

  @override
  String get adminLibNone => 'Žiadne';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dní';
  }

  @override
  String get adminLibEmbeddedTitles => 'Použiť vložené názvy';

  @override
  String get adminLibEmbeddedExtrasTitles => 'Použiť vložené názvy pre bonusy';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Použiť vložené informácie o epizódach';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Povoliť vložené titulky';

  @override
  String get adminLibEmbeddedAllowAll => 'Povoliť všetky';

  @override
  String get adminLibEmbeddedAllowText => 'Len textové';

  @override
  String get adminLibEmbeddedAllowImage => 'Len obrázkové';

  @override
  String get adminLibEmbeddedAllowNone => 'Žiadne';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Preskočiť sťahovanie, ak sú prítomné vložené titulky';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Preskočiť sťahovanie, ak zvuková stopa zodpovedá jazyku sťahovania';

  @override
  String get adminLibRequirePerfectMatch => 'Vyžadovať presnú zhodu titulkov';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Ukladať titulky do mediálnych priečinkov';

  @override
  String get adminLibChapterImageExtraction => 'Extrahovať obrázky kapitol';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extrahovať obrázky kapitol počas skenovania knižnice';

  @override
  String get adminLibTrickplayExtraction =>
      'Zapnúť extrakciu obrázkov trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extrahovať obrázky trickplay počas skenovania knižnice';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Ukladať obrázky trickplay do mediálnych priečinkov';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automaticky zlúčiť seriály rozdelené do viacerých priečinkov';

  @override
  String get adminLibSeasonZeroName => 'Zobrazovaný názov nultej sezóny';

  @override
  String get adminLibLufsScan =>
      'Zapnúť skenovanie LUFS na normalizáciu hlasitosti';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Uprednostniť neštandardnú značku interpretov';

  @override
  String get adminLibAutoAddToCollection =>
      'Automaticky pridávať filmy do kolekcií';

  @override
  String get adminLibraryNameRequired => 'Vyžaduje sa názov knižnice';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Nepodarilo sa vytvoriť knižnicu: $error';
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
    return 'Zakázať používateľa $name? Nebude sa môcť prihlásiť.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Povoliť používateľa $name? Bude sa môcť znova prihlásiť.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Používateľ „$name“ bol zakázaný';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Používateľ „$name“ bol povolený';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Nepodarilo sa aktualizovať pravidlá používateľa: $error';
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
    return 'Nepodarilo sa vytvoriť používateľa: $error';
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
    return 'Nepodarilo sa uložiť: $error';
  }

  @override
  String get adminPermissionsSaved => 'Povolenia boli uložené';

  @override
  String get adminPasswordsMismatch => 'Heslá sa nezhodujú';

  @override
  String adminFailed(String error) {
    return 'Zlyhalo: $error';
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
  String get admin => 'Správca';

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
  String get adminParentalControl => 'Rodičovská kontrola';

  @override
  String get adminMaxParentalRating =>
      'Maximálne povolené rodičovské hodnotenie';

  @override
  String get adminMaxParentalRatingHint =>
      'Obsah s vyšším hodnotením bude pred týmto používateľom skrytý.';

  @override
  String get adminParentalRatingNone => 'Žiadne';

  @override
  String get adminBlockUnratedItems =>
      'Blokovať položky bez hodnotenia alebo s nerozpoznaným hodnotením';

  @override
  String get adminUnratedBook => 'Knihy';

  @override
  String get adminUnratedChannelContent => 'Kanály';

  @override
  String get adminUnratedLiveTvChannel => 'Živá televízia';

  @override
  String get adminUnratedMovie => 'Filmy';

  @override
  String get adminUnratedMusic => 'Hudba';

  @override
  String get adminUnratedTrailer => 'Ukážky';

  @override
  String get adminUnratedSeries => 'Seriály';

  @override
  String get adminAccessSchedules => 'Plány prístupu';

  @override
  String get adminAccessSchedulesHint =>
      'Povoliť prístup len počas nižšie naplánovaných časov. Ak nie je nastavený žiadny plán, prístup je povolený celý deň.';

  @override
  String get adminAddSchedule => 'Pridať plán';

  @override
  String get adminScheduleDay => 'Deň';

  @override
  String get adminScheduleStart => 'Začiatok';

  @override
  String get adminScheduleEnd => 'Koniec';

  @override
  String get adminDayEveryday => 'Každý deň';

  @override
  String get adminDayWeekday => 'Pracovný deň';

  @override
  String get adminDayWeekend => 'Víkend';

  @override
  String get adminDaySunday => 'Nedeľa';

  @override
  String get adminDayMonday => 'Pondelok';

  @override
  String get adminDayTuesday => 'Utorok';

  @override
  String get adminDayWednesday => 'Streda';

  @override
  String get adminDayThursday => 'Štvrtok';

  @override
  String get adminDayFriday => 'Piatok';

  @override
  String get adminDaySaturday => 'Sobota';

  @override
  String get adminAllowedTags => 'Povolené značky';

  @override
  String get adminAllowedTagsHint =>
      'Zobrazí sa iba obsah s týmito značkami. Ak chcete povoliť všetko, nechajte pole prázdne.';

  @override
  String get adminBlockedTags => 'Blokované značky';

  @override
  String get adminBlockedTagsHint =>
      'Obsah s týmito značkami bude pred týmto používateľom skrytý.';

  @override
  String get adminAddTag => 'Pridať značku';

  @override
  String get adminEnabledDevices => 'Povolené zariadenia';

  @override
  String get adminEnabledChannels => 'Povolené kanály';

  @override
  String get adminAuthProvider => 'Poskytovateľ overenia';

  @override
  String get adminPasswordResetProvider => 'Poskytovateľ obnovenia hesla';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maximálny počet neúspešných prihlásení pred zamknutím';

  @override
  String get adminLoginAttemptsHint =>
      'Nastavte 0 pre predvolenú hodnotu alebo -1 na vypnutie zamykania.';

  @override
  String get adminSyncPlayAccess => 'Prístup k SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Povoliť vytváranie skupín a pripájanie sa k nim';

  @override
  String get adminSyncPlayJoin => 'Povoliť pripájanie sa k skupinám';

  @override
  String get adminSyncPlayNone => 'Bez prístupu';

  @override
  String get adminContentDeletionFolders => 'Povoliť odstraňovanie obsahu z';

  @override
  String get adminResetPasswordWarning =>
      'Týmto sa heslo odstráni. Používateľ sa bude môcť prihlásiť bez hesla.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server vrátil HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Naozaj chcete odstrániť používateľa $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Používateľ „$name“ bol odstránený';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Nepodarilo sa odstrániť používateľa: $error';
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
    return 'Nepodarilo sa vytvoriť kľúč: $error';
  }

  @override
  String get adminKeyTokenMissing => 'V odpovedi servera chýba kľúčový token';

  @override
  String get adminRevokeApiKey => 'Odvolať kľúč API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Odvolať kľúč pre $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Kľúč API bol odvolaný';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nepodarilo sa odvolať kľúč: $error';
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
    return 'Token: $token\\nVytvorené: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Vytvoriť zálohu';

  @override
  String get adminBackupInclude => 'Vyberte, čo sa má do zálohy zahrnúť.';

  @override
  String get adminBackupDatabase => 'Databáza';

  @override
  String get adminBackupDatabaseAlways => 'Vždy zahrnuté';

  @override
  String get adminBackupMetadata => 'Metadáta';

  @override
  String get adminBackupSubtitles => 'Titulky';

  @override
  String get adminBackupTrickplay => 'Obrázky trickplay';

  @override
  String get adminCreatingBackup => 'Vytvára sa záloha...';

  @override
  String get adminBackupCreated => 'Záloha bola úspešne vytvorená';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Nepodarilo sa vytvoriť zálohu: $error';
  }

  @override
  String get adminBackupPathMissing => 'V odpovedi servera chýba záložná cesta';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Nepodarilo sa načítať manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Potvrďte obnovenie';

  @override
  String get adminRestoringBackup => 'Obnovuje sa záloha...';

  @override
  String adminRestoreFailed(String error) {
    return 'Nepodarilo sa obnoviť zálohu: $error';
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
    return 'Uložené do $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Nepodarilo sa uložiť súbor: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Nepodarilo sa načítať $fileName';
  }

  @override
  String get adminSearchInLog => 'Hľadaj v denníku';

  @override
  String get adminNoMatchingLines => 'Žiadne zodpovedajúce riadky';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Nepodarilo sa načítať úlohy: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nenašli sa žiadne naplánované úlohy';

  @override
  String get adminNoTasksMatchFilter =>
      'Aktuálnemu filtru nezodpovedajú žiadne úlohy';

  @override
  String adminTaskStartFailed(String error) {
    return 'Nepodarilo sa spustiť úlohu: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Nepodarilo sa zastaviť úlohu: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Nepodarilo sa načítať úlohu: $error';
  }

  @override
  String get adminRunNow => 'Spustiť teraz';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Nepodarilo sa odstrániť spúšťač: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Nepodarilo sa pridať spúšťač: $error';
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
    return '$hours hod.';
  }

  @override
  String get adminDayOfWeek => 'Deň v týždni';

  @override
  String get adminSearchPlugins => 'Hľadať doplnky...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Nepodarilo sa prepnúť plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Odinštalovať doplnok';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Naozaj chcete odinštalovať „$name“?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Nepodarilo sa odinštalovať plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Nepodarilo sa nainštalovať balík: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Nepodarilo sa nainštalovať aktualizáciu: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Nepodarilo sa načítať pluginy: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Vášmu vyhľadávaniu nezodpovedajú žiadne doplnky';

  @override
  String get adminNoPluginsInstalled => 'Nie sú nainštalované žiadne doplnky';

  @override
  String adminInstallUpdate(String version) {
    return 'Nainštalovať aktualizáciu (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Nepodarilo sa načítať katalóg: $error';
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
    return '„$name“ bude odstránený po reštarte servera';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Nepodarilo sa odinštalovať: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Aktualizuje sa „$name“ na v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Nie je možné otvoriť nastavenia: chýba autorizačný token.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Nepodarilo sa načítať plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Doplnok sa nenašiel';

  @override
  String adminPluginVersion(String version) {
    return 'Verzia $version';
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
    return 'Naozaj chcete odstrániť „$name“?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Nepodarilo sa uložiť repozitáre: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Nepodarilo sa načítať repozitáre: $error';
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
    return 'Nepodarilo sa načítať nastavenia pluginu: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nepodarilo sa otvoriť $uri';
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
  String get adminHttpPort => 'Port HTTP';

  @override
  String get adminHttpsPort => 'Port HTTPS';

  @override
  String get adminPublicHttpsPort => 'Verejný port HTTPS';

  @override
  String get adminBaseUrl => 'Základná adresa URL';

  @override
  String get adminBaseUrlHint => 'napr. /jellyfin';

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
  String get whitelist => 'Zoznam povolených';

  @override
  String get blacklist => 'Čierna listina';

  @override
  String get notSet => 'Nie je nastavené';

  @override
  String get adminMetadataSaved => 'Metadáta boli uložené';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Nepodarilo sa načítať metadáta: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Nepodarilo sa uložiť metadáta: $error';
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
    return 'Nepodarilo sa obnoviť metadáta: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Nenašli sa žiadne vzdialené zhody';

  @override
  String get adminRemoteResults => 'Vzdialené výsledky';

  @override
  String get adminRemoteMetadataApplied => 'Použili sa vzdialené metadáta';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Vzdialené vyhľadávanie zlyhalo: $error';
  }

  @override
  String get adminUpdateContentType => 'Aktualizovať typ obsahu';

  @override
  String get adminContentType => 'Typ obsahu';

  @override
  String get adminContentTypeUpdated => 'Typ obsahu bol aktualizovaný';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nepodarilo sa aktualizovať typ obsahu: $error';
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
    return 'Obrázok $imageType bol aktualizovaný';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Nepodarilo sa stiahnuť obrázok: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nepodporovaný formát obrázka';

  @override
  String get adminImageReadFailed => 'Nepodarilo sa prečítať vybratý obrázok';

  @override
  String adminImageUploaded(String imageType) {
    return 'Obrázok $imageType bol nahraný';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Nepodarilo sa nahrať obrázok: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Odstrániť obrázok $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Obrázok $imageType bol odstránený';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Nepodarilo sa odstrániť obrázok: $error';
  }

  @override
  String get adminAllProviders => 'Všetci poskytovatelia';

  @override
  String get adminNoRemoteImages => 'Nenašli sa žiadne vzdialené obrázky';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Vyhľadávanie tunerov zlyhalo: $error';
  }

  @override
  String get adminAddTuner => 'Pridať tuner';

  @override
  String get adminEditTuner => 'Upraviť tuner';

  @override
  String get adminTunerTypeM3u => 'Tuner M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Súbor alebo URL';

  @override
  String get adminTunerIpAddress => 'IP adresa tunera';

  @override
  String get adminTunerFriendlyName => 'Zrozumiteľný názov';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limit súčasných pripojení';

  @override
  String get adminTunerCountHelp =>
      'Maximálny počet streamov, ktoré tuner naraz povolí. Nastavením na 0 zrušíte obmedzenie.';

  @override
  String get adminTunerFallbackBitrate =>
      'Záložný maximálny bitový tok streamovania';

  @override
  String get adminTunerImportFavoritesOnly => 'Importovať iba obľúbené kanály';

  @override
  String get adminTunerAllowHwTranscoding => 'Povoliť hardvérové prekódovanie';

  @override
  String get adminTunerAllowFmp4 => 'Povoliť prekódovací kontajner fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Povoliť zdieľanie streamov';

  @override
  String get adminTunerEnableStreamLooping => 'Zapnúť opakovanie streamu';

  @override
  String get adminTunerIgnoreDts => 'Ignorovať DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Čítať vstup v natívnej snímkovej frekvencii';

  @override
  String get adminEditProvider => 'Upraviť poskytovateľa';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Súbor alebo URL';

  @override
  String get adminXmltvMoviePrefix => 'Predpona filmov';

  @override
  String get adminXmltvMovieCategories => 'Kategórie filmov';

  @override
  String get adminXmltvCategoriesHelp =>
      'Viacero kategórií oddeľte zvislou čiarou.';

  @override
  String get adminXmltvKidsCategories => 'Kategórie pre deti';

  @override
  String get adminXmltvNewsCategories => 'Kategórie správ';

  @override
  String get adminXmltvSportsCategories => 'Kategórie športu';

  @override
  String get adminSdUsername => 'Používateľské meno';

  @override
  String get adminSdPassword => 'Heslo';

  @override
  String get adminSdCountry => 'Krajina';

  @override
  String get adminSdCountrySelect => 'Vyberte krajinu';

  @override
  String get adminSdPostalCode => 'PSČ';

  @override
  String get adminSdGetListings => 'Získať zoznamy';

  @override
  String get adminSdListings => 'Zoznamy';

  @override
  String get adminEnableAllTuners => 'Zapnúť všetky tunery';

  @override
  String get adminTunerType => 'Typ tunera';

  @override
  String get adminTunerAdded => 'Tuner dodal';

  @override
  String adminTunerAddFailed(String error) {
    return 'Nepodarilo sa pridať tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Pridať poskytovateľa sprievodcov';

  @override
  String get adminProviderType => 'Typ poskytovateľa';

  @override
  String get adminProviderAdded => 'Poskytovateľ bol pridaný';

  @override
  String adminProviderAddFailed(String error) {
    return 'Nepodarilo sa pridať poskytovateľa: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Nepodarilo sa odstrániť tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Vyžiadaný reset tunera';

  @override
  String adminTunerResetFailed(String error) {
    return 'Nepodarilo sa resetovať tuner: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Tento typ tunera nepodporuje resetovanie.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Nepodarilo sa odstrániť poskytovateľa: $error';
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
  String get adminMovieRecordingPath => 'Cesta na nahrávanie filmov';

  @override
  String get adminGuideDays => 'Počet dní údajov programu';

  @override
  String get adminGuideDaysAuto => 'Automaticky';

  @override
  String adminGuideDaysValue(int days) {
    return '$days dní';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Cesta k aplikácii na dodatočné spracovanie';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Argumenty dodatočného spracovania';

  @override
  String get adminSaveRecordingNfo => 'Ukladať metadáta NFO nahrávok';

  @override
  String get adminSaveRecordingImages => 'Ukladať obrázky nahrávok';

  @override
  String get adminLiveTvSectionTiming => 'Časovanie';

  @override
  String get adminLiveTvSectionPaths => 'Cesty nahrávok';

  @override
  String get adminLiveTvSectionPostProcessing => 'Dodatočné spracovanie';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Údaje programu: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'Nastavenia nahrávania boli uložené';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nepodarilo sa uložiť nastavenia: $error';
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
    return 'Nepodarilo sa aktualizovať mapovania: $error';
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
  String get adminRefreshGuideData => 'Obnoviť údaje programu';

  @override
  String get adminGuideRefreshStarted => 'Obnova údajov programu sa spustila';

  @override
  String get adminGuideRefreshUnavailable =>
      'Úloha obnovy programu nie je na tomto serveri dostupná.';

  @override
  String get adminAddProvider => 'Pridať poskytovateľa';

  @override
  String get adminNoListingProviders =>
      'Nie sú nakonfigurovaní žiadni poskytovatelia záznamov';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Cesta nahrávok: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Cesta seriálov: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Rezerva pred: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Rezerva po: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Vyhľadávanie tunerov';

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
    return 'Obnoviť zálohu $name teraz?';
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
    return 'pred $minutes min';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'pred $hours h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'pred $days d';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Nepodarilo sa načítať $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count zhôd';
  }

  @override
  String get adminLogViewerNoMatches => 'Žiadne zodpovedajúce riadky';

  @override
  String get adminMetadataEditorTitle => 'Editor metadát';

  @override
  String get adminMetadataIdentify => 'Identifikovať';

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
  String get adminMetadataRole => 'Rola';

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
    return 'Obrázok $imageType bol aktualizovaný';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Obrázok $imageType bol nahraný';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Obrázok $imageType bol odstránený';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Nepodarilo sa stiahnuť obrázok: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Nepodarilo sa prečítať vybratý obrázok';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Nepodarilo sa nahrať obrázok: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Odstrániť obrázok $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Týmto sa z položky odstráni aktuálny obrázok.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nepodarilo sa odstrániť obrázok: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Vybrať obrázok $imageType';
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
    return 'Dostupná aktualizácia: v$version';
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
    return 'Nainštalovať aktualizáciu (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Vášmu vyhľadávaniu nezodpovedajú žiadne balíky';

  @override
  String get adminPluginsCatalogEmpty => 'Nie sú k dispozícii žiadne balíčky';

  @override
  String adminPluginsInstalling(String name) {
    return 'Inštaluje sa „$name“...';
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
    return 'Nastavenia $name';
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
    return 'Nepodarilo sa načítať repozitáre: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Odstrániť úložisko';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Naozaj chcete odstrániť „$name“?';
  }

  @override
  String get adminReposRemove => 'Odstrániť';

  @override
  String adminReposSaveFailed(String error) {
    return 'Nepodarilo sa uložiť repozitáre: $error';
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
  String get adminNetworkingHttpPort => 'Port HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Port HTTPS';

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
  String get adminNetworkingWhitelist => 'Zoznam povolených';

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
  String get adminBrandingSplashUpload => 'Nahrať obrázok';

  @override
  String get adminBrandingSplashUploaded =>
      'Úvodná obrazovka bola aktualizovaná';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Nepodarilo sa nahrať úvodnú obrazovku';

  @override
  String get adminBrandingSplashDeleted => 'Úvodná obrazovka bola odstránená';

  @override
  String get adminBrandingNoSplash => 'Žiadna vlastná úvodná obrazovka';

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
  String get adminPlaybackQsvDevice => 'Zariadenie QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Zapnúť vylepšený dekodér NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Uprednostniť natívny systémový hardvérový dekodér';

  @override
  String get adminPlaybackColorDepth =>
      'Farebná hĺbka hardvérového dekódovania';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bitové dekódovanie HEVC';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bitové dekódovanie VP9';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      '8/10-bitové dekódovanie HEVC RExt';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      '12-bitové dekódovanie HEVC RExt';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardvérové kódovanie';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Povoliť kódovanie HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Povoliť kódovanie AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Zapnúť nízkoenergetický kodér Intel H.264';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Zapnúť nízkoenergetický kodér Intel HEVC';

  @override
  String get adminPlaybackToneMapping => 'Mapovanie tónov';

  @override
  String get adminPlaybackEnableTonemapping => 'Zapnúť mapovanie tónov';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Zapnúť mapovanie tónov VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Zapnúť mapovanie tónov VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algoritmus mapovania tónov';

  @override
  String get adminPlaybackTonemappingMode => 'Režim mapovania tónov';

  @override
  String get adminPlaybackTonemappingRange => 'Rozsah mapovania tónov';

  @override
  String get adminPlaybackTonemappingDesat => 'Desaturácia mapovania tónov';

  @override
  String get adminPlaybackTonemappingPeak => 'Špička mapovania tónov';

  @override
  String get adminPlaybackTonemappingParam => 'Parameter mapovania tónov';

  @override
  String get adminPlaybackVppTonemappingBrightness => 'Jas mapovania tónov VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Kontrast mapovania tónov VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Predvoľby a kvalita';

  @override
  String get adminPlaybackEncoderPreset => 'Predvoľba kodéra';

  @override
  String get adminPlaybackH264Crf => 'CRF kódovania H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF kódovania H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Metóda odstránenia prekladania';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Zdvojnásobiť snímkovú frekvenciu pri odstraňovaní prekladania';

  @override
  String get adminPlaybackAudioSection => 'Zvuk';

  @override
  String get adminPlaybackEnableAudioVbr => 'Zapnúť kódovanie zvuku VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Zosilnenie zmiešaného zvuku';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritmus zmiešania do stereo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Maximálna veľkosť fronty multiplexovania';

  @override
  String get adminPlaybackAutoOption => 'Automaticky';

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
  String get adminTaskStop => 'Zastaviť';

  @override
  String get adminRunningTasks => 'Spustené úlohy';

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
    return 'Denne o $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Každý $day o $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Každých $duration';
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
      other: '$count hodín',
      many: '$count hodiny',
      few: '$count hodiny',
      one: '1 hodina',
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
    return 'pred $days d';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'pred $hours h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'pred $minutes min';
  }

  @override
  String get adminActivityNow => 'teraz';

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
    return '$day. $month.';
  }

  @override
  String get adminTrickplayDescription =>
      'Nakonfigurujte generovanie trickplay obrázkov pre vyhľadávanie náhľadov miniatúr.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Verejný port HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Základná adresa URL';

  @override
  String get adminNetworkingBaseUrlHint => 'napr. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Verejný port HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Vyžadovať HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Presmerovať všetky vzdialené požiadavky na HTTPS. Nemá účinok, ak server nemá platný certifikát.';

  @override
  String get adminNetworkingCertPassword => 'Heslo certifikátu';

  @override
  String get adminNetworkingIpSettings => 'Nastavenia IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Zapnúť IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Zapnúť IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Zapnúť automatické mapovanie portov';

  @override
  String get adminNetworkingLocalSubnets => 'Siete LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Zoznam IP adries alebo podsietí CIDR oddelených čiarkou alebo novým riadkom, ktoré sa považujú za lokálnu sieť.';

  @override
  String get adminNetworkingPublishedUris => 'Publikované URI servera';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Priraďte podsieť alebo adresu k publikovanej URL, napr. all=https://example.com';

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
  String get adminPlaybackThrottleDelay => 'Oneskorenie obmedzenia (sekundy)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Povoliť extrakciu titulkov za behu';

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
    return 'Nepodarilo sa aktualizovať typ obsahu: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Prah pomalej odozvy (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Zapnúť varovania o pomalej odozve';

  @override
  String get adminGeneralQuickConnect => 'Povoliť Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadáta';

  @override
  String get adminGeneralSectionPaths => 'Cesty';

  @override
  String get adminGeneralSectionPerformance => 'Výkon';

  @override
  String get adminGeneralCachePath => 'Cesta vyrovnávacej pamäte';

  @override
  String get adminGeneralMetadataPath => 'Cesta metadát';

  @override
  String get adminGeneralServerName => 'Názov servera';

  @override
  String get adminGeneralDisplayLanguage => 'Preferovaný jazyk zobrazenia';

  @override
  String get adminSettingsLoadFailed => 'Nepodarilo sa načítať nastavenia';

  @override
  String get adminDiscover => 'Objavte';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Nepodarilo sa aktualizovať mapovania: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Časový limit: $duration';
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
      other: '# účastníkov',
      many: '# účastníka',
      few: '# účastníci',
      one: '# účastník',
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
    return 'Položka $index';
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
    return '$userName sa pripojil do skupiny SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName opustil skupinu SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle =>
      'Prístup k službe SyncPlay bol odmietnutý';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nemáte prístup k jednej alebo viacerým položkám v tejto skupine SyncPlay. Požiadajte vlastníka skupiny, aby overil povolenia knižnice alebo si vybral iné poradie.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synchronizuje sa prehrávanie so skupinou $groupName';
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'nájdených # riadkov',
      many: 'nájdených # riadka',
      few: 'nájdené # riadky',
      one: 'nájdený # riadok',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'Ste offline';

  @override
  String get offlineBannerSubtitle => 'Zobrazujú sa vaše stiahnuté položky';

  @override
  String get offlineBannerAction => 'Stiahnuté';

  @override
  String get serverUnreachableBannerTitle => 'Server je nedostupný';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Prehráva sa zo stiahnutých položiek, kým sa server nevráti';

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
    return 'Ovládanie odosielania zlyhalo: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Ovládanie $kind';
  }

  @override
  String get castDeviceVolume => 'Hlasitosť zariadenia';

  @override
  String get castVolumeUnavailable => 'nedostupné';

  @override
  String castStopKind(String kind) {
    return 'Zastaviť $kind';
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
    return 'Zadajte $length-miestny PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Zadajte svoj $length-miestny PIN';
  }

  @override
  String get pinIncorrect => 'Nesprávny PIN';

  @override
  String get pinMismatch => 'Kódy PIN sa nezhodujú';

  @override
  String get pinForgot => 'Zabudli ste PIN?';

  @override
  String get pinClear => 'Vymazať';

  @override
  String get pinBackspace => 'Vymazať';

  @override
  String get quickConnectAuthorized => 'Žiadosť Quick Connect bola schválená.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kód Quick Connect je neplatný alebo jeho platnosť vypršala.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect nie je na tomto serveri podporovaný.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Nepodarilo sa autorizovať kód Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect je na tomto serveri zakázaný.';

  @override
  String get quickConnectForbidden =>
      'Váš účet nemôže autorizovať túto žiadosť Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Kód Quick Connect sa nenašiel. Skúste nový kód.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect zlyhal: $message';
  }

  @override
  String get quickConnectEnterCode => 'Zadajte kód';

  @override
  String get quickConnectAuthorize => 'Autorizovať';

  @override
  String remoteCommandFailed(String error) {
    return 'Príkaz zlyhal: $error';
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
    return 'Nepodarilo sa spustiť odosielanie: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nie sú k dispozícii žiadne zariadenia na vzdialené prehrávanie.';

  @override
  String get noRemoteDevicesIos =>
      'Nie sú k dispozícii žiadne zariadenia na vzdialené prehrávanie.\n\nV systéme iOS môžu byť ciele AirPlay v simulátore nedostupné.';

  @override
  String get trackActionPlayNext => 'Prehrať ako ďalšie';

  @override
  String get trackActionAddToQueue => 'Pridať do poradia';

  @override
  String get trackActionAddToPlaylist => 'Pridať do zoznamu skladieb';

  @override
  String get trackActionCancelDownload => 'Zrušiť sťahovanie';

  @override
  String get trackActionDeleteFromPlaylist => 'Odstrániť zo zoznamu skladieb';

  @override
  String get trackActionMoveUp => 'Posunúť nahor';

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
    return 'Sťahuje sa $name...';
  }

  @override
  String get trackActionDeletedFile => 'Stiahnutý súbor bol odstránený';

  @override
  String get trackActionDeleteFileFailed =>
      'Nepodarilo sa odstrániť stiahnutý súbor';

  @override
  String get shuffleBy => 'Zamiešať podľa';

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
  String get playNext => 'Prehrať ako ďalšie';

  @override
  String get stillWatchingContent =>
      'Prehrávanie bolo pozastavené. ešte stále pozeráš?';

  @override
  String get stillWatchingStop => 'Zastaviť';

  @override
  String get stillWatchingContinue => 'Pokračovať';

  @override
  String skipSegment(String segment) {
    return 'Preskočiť $segment';
  }

  @override
  String get liveTv => 'Živá televízia';

  @override
  String get continueWatchingAndNextUp => 'Pokračovať v sledovaní a ďalej';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Sťahuje sa $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Sťahuje sa $fileName';
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
  String get contextMenuHideFromContinueWatching =>
      'Skryť z Pokračovať v sledovaní';

  @override
  String get contextMenuHideFromNextUp => 'Skryť z Nasleduje';

  @override
  String get contextMenuAddToCollection => 'Pridať do kolekcie';

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
  String get settingsConnectionSection => 'PRIPOJENIE';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Povoliť vlastnoručne podpísané certifikáty';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Dôverovať serverom s vlastnoručne podpísanými certifikátmi TLS alebo s certifikátmi zo súkromnej certifikačnej autority. Zapnite len pre servery, ktoré spravujete. Vypne sa tým overovanie certifikátov pre všetky pripojenia.';

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
  String get settingsDetailsScreen => 'Obrazovka s detailmi';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Štýl, rozostrenie pozadia a správanie kariet';

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
  String get settingsShowSeerrButtonInNavigation =>
      'Zobraziť tlačidlo Seerr v navigačnom paneli';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Vždy zobrazovať textové popisy v hornom navigačnom paneli';

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
  String get settingsSupportMoonfinSubtitle => 'Kúpte vývojárovi kávu';

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
      other: '# licenčných oznámení',
      many: '# licenčného oznámenia',
      few: '# licenčné oznámenia',
      one: '# licenčné oznámenie',
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
  String get settingsMediaSegmentCountdown =>
      'Odpočítavanie mediálnych segmentov';

  @override
  String get settingsProgressBar => 'Ukazovateľ priebehu';

  @override
  String get settingsTimer => 'Časovač';

  @override
  String get settingsNone => 'Žiadne';

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
  String get settingsPlaybackEngineAndroidTv =>
      'Prehrávací engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Vyberte predvolený mechanizmus prehrávania na zariadeniach Android TV. Zmeny sa aplikujú na nasledujúcu reláciu prehrávania.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (odporúčané)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (staršie)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (staršie)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (odporúčané)';

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
  String get settingsLiveTvDirect => 'Živá televízia priamo';

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
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Nedávno vydané – $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Automaticky prehrať ďalšiu epizódu';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automaticky prehrať ďalšiu epizódu, keď je dostupná.';

  @override
  String get skipSilenceTitle => 'Preskakovať ticho';

  @override
  String get skipSilenceSubtitle =>
      'Automaticky preskakovať tiché zvukové úseky, ak to stream podporuje.';

  @override
  String get allowExternalAudioEffectsTitle => 'Povoliť externé zvukové efekty';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Umožniť aplikáciám s ekvalizérom a efektmi (napr. Wavelet) pripojiť sa k prehrávacím reláciám Media3.';

  @override
  String get disableTunnelingTitle => 'Vypnúť tunelovanie';

  @override
  String get disableTunnelingSubtitle =>
      'Vynútiť netunelované prehrávanie. Užitočné na zariadeniach s výpadkami zvuku a videa pri tunelovaní.';

  @override
  String get enableTunnelingTitle => 'Zapnúť tunelovanie';

  @override
  String get enableTunnelingSubtitle =>
      'Pokročilé. Smeruje zvuk a video cez prepojenú hardvérovú cestu. Predvolene vypnuté, pretože na niektorých zariadeniach spôsobuje výpadky zvuku a videa.';

  @override
  String get mapDolbyVisionP7Title => 'Mapovať Dolby Vision profil 7 na HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Prehrávať streamy Dolby Vision profil 7 ako HEVC kompatibilné s HDR10 na zariadeniach bez podpory Dolby Vision.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Použiť vložené štýly titulkov';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Použiť farby, písma a umiestnenie vložené v stope titulkov. Vypnutím sa použijú vaše predvoľby štýlu titulkov.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Použiť vložené veľkosti písma titulkov';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Použiť veľkosti písma vložené v stope titulkov. Vypnutím sa použije veľkosť titulkov z vašich predvolieb štýlu.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Zobraziť podrobnosti o médiu';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Zobraziť podrobnosti o vybratej položke v hornej časti stránok knižnice.';

  @override
  String get hideBackdropsInLibraries => 'Skryť pozadia pri prehliadaní?';

  @override
  String get useDetailedSubHeadings => 'Použiť podrobné podnadpisy';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Zobraziť podrobný alebo minimalistický podriadok na stránkach knižnice.';

  @override
  String get savedThemesDeleteDialogTitle => 'Odstrániť uloženú tému?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Odstrániť „$themeName“ z vyrovnávacej pamäte tohto zariadenia?';
  }

  @override
  String get themeStore => 'Obchod s témami';

  @override
  String get themeStoreSubtitle => 'Prehliadajte a ukladajte komunitné témy';

  @override
  String get themeStoreDescription =>
      'Uložte tému, aby ste ju mohli používať ako ostatné uložené témy.';

  @override
  String get themeStoreEmpty => 'Momentálne nie sú k dispozícii žiadne témy.';

  @override
  String get themeStoreLoadFailed =>
      'Obchod s témami sa nepodarilo načítať. Skontrolujte pripojenie a skúste to znova.';

  @override
  String get themeStoreSave => 'Uložiť';

  @override
  String get themeStoreSaveAndApply => 'Uložiť a použiť';

  @override
  String get themeStoreSaved => 'Uložené';

  @override
  String get themeStoreInvalidMessage => 'Túto tému sa nepodarilo načítať.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Téma „$themeName“ bola uložená.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Téma „$themeName“ bola odstránená z tohto zariadenia.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Tému „$themeName“ sa nepodarilo odstrániť.';
  }

  @override
  String get savedThemesTitle => 'Uložené témy';

  @override
  String get savedThemesDescription =>
      'Toto sú témy stiahnuté z pluginu Moonfin pre aktuálny server. Odstránením sa zmaže len táto lokálna kópia.';

  @override
  String get savedThemesEmpty =>
      'Pre tento server sa nenašli žiadne uložené témy.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Aktuálne aktívna';
  }

  @override
  String get savedThemesDeleteTooltip => 'Odstrániť uloženú tému';

  @override
  String get savedThemesManageSubtitle =>
      'Spravujte stiahnuté témy pluginu na tomto zariadení';

  @override
  String get themeEditor => 'Editor tém';

  @override
  String get themeEditorSubtitle => 'Otvoriť editor tém Moonfin v prehliadači';

  @override
  String get homeScreen => 'Domovská obrazovka';

  @override
  String get bottomBar => 'Dolný panel';

  @override
  String get homeRowsStyleClassic => 'Klasický';

  @override
  String get homeRowsStyleModern => 'Moderný';

  @override
  String get homeRowsSection => 'Domovské riadky';

  @override
  String get homeRowDisplay => 'Zobrazenie domovských riadkov';

  @override
  String get homeRowSections => 'Sekcie domovských riadkov';

  @override
  String get homeRowToggles => 'Prepínače domovských riadkov';

  @override
  String get homeRowTogglesSubtitle =>
      'Zapnite alebo vypnite kategórie domovských riadkov podľa knižníc';

  @override
  String get homeRowTogglesDescription =>
      'Zapnutím nasledujúcich prepínačov zobrazíte riadky v domovských sekciách.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klasický zachováva typ obrázka a informačnú vrstvu pre každý riadok. Moderný používa riadky s prechodom z portrétu na pozadie.';

  @override
  String get displayFavoritesRows => 'Zobraziť riadky obľúbených';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Zobraziť riadky Obľúbené filmy, Obľúbené seriály a ďalšie obľúbené v domovských sekciách.';

  @override
  String get favoritesRowSorting => 'Zoradenie riadkov obľúbených';

  @override
  String get favoritesRowSortingDescription =>
      'Zoraďte riadky obľúbených podľa dátumu pridania, dátumu vydania, abecedy a ďalších kritérií.';

  @override
  String get displayCollectionsRows => 'Zobraziť riadky kolekcií';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Zobraziť riadky kolekcií v domovských sekciách.';

  @override
  String get collectionsRowSorting => 'Zoradenie riadkov kolekcií';

  @override
  String get collectionsRowSortingDescription =>
      'Zoraďte riadky kolekcií podľa dátumu pridania, dátumu vydania, abecedy a ďalších kritérií.';

  @override
  String get displayGenresRows => 'Zobraziť riadky žánrov';

  @override
  String get displayGenresRowsSubtitle =>
      'Zobraziť riadky žánrov v domovských sekciách.';

  @override
  String get genresRowSorting => 'Zoradenie riadkov žánrov';

  @override
  String get genresRowSortingDescription =>
      'Zoraďte riadky žánrov podľa dátumu pridania, dátumu vydania, abecedy a ďalších kritérií.';

  @override
  String get genresRowItems => 'Položky v riadkoch žánrov';

  @override
  String get genresRowItemsDescription =>
      'Zobraziť v riadkoch žánrov filmy, seriály alebo oboje.';

  @override
  String get displayPlaylistsRows => 'Zobraziť riadky playlistov';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Zobraziť riadky playlistov v domovských sekciách.';

  @override
  String get playlistsRowSorting => 'Zoradenie riadkov playlistov';

  @override
  String get playlistsRowSortingDescription =>
      'Zoraďte riadky playlistov podľa dátumu pridania, dátumu vydania, abecedy a ďalších kritérií.';

  @override
  String get displayAudioRows => 'Zobraziť zvukové riadky';

  @override
  String get displayAudioRowsSubtitle =>
      'Zobraziť zvukové riadky v domovských sekciách.';

  @override
  String get audioRowsSorting => 'Zoradenie zvukových riadkov';

  @override
  String get audioRowsSortingDescription =>
      'Zoraďte zvukové riadky podľa dátumu pridania, dátumu vydania, abecedy a ďalších kritérií.';

  @override
  String get audioPlaylists => 'Zvukové playlisty';

  @override
  String get appearance => 'Vzhľad';

  @override
  String get layout => 'Rozloženie';

  @override
  String get theme => 'Téma';

  @override
  String get keyboard => 'Klávesnica';

  @override
  String get navButtons => 'Tlačidlá';

  @override
  String get rendering => 'Vykresľovanie';

  @override
  String get mpvConfiguration => 'Konfigurácia MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Externá prehrávacia aplikácia';

  @override
  String get externalPlayerAppDescription =>
      'Nastavením externého prehrávača povolíte možnosť prehrania dlhým stlačením';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Zobraziť výber aplikácie pri spustení prehrávania.';

  @override
  String get loadingInstalledPlayers =>
      'Načítavajú sa nainštalované prehrávače...';

  @override
  String get connection => 'Pripojenie';

  @override
  String get audioTranscodeTarget => 'Cieľ prekódovania zvuku';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Podporované na tomto zariadení';

  @override
  String get notSupportedOnThisDevice => 'Nepodporované na tomto zariadení';

  @override
  String get settingsAudioDtsXPassthrough => 'Passthrough DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Posielať bitstream DTS:X (DTS UHD) do externého dekodéra.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Passthrough TrueHD s Atmos (JOC)';

  @override
  String get mediaPlayerBehavior => 'Správanie prehrávača médií';

  @override
  String get playbackEnhancements => 'Vylepšenia prehrávania';

  @override
  String get alwaysOn => 'Vždy zapnuté.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Nahradiť tlačidlo Preskočiť outro zobrazením Nasleduje';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Zobraziť vrstvu Nasleduje namiesto tlačidla Preskočiť outro.';

  @override
  String get playerRouting => 'Smerovanie prehrávača';

  @override
  String get preferSoftwareDecoders => 'Uprednostniť softvérové dekodéry';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Použiť FFmpeg (zvuk) a libgav1 (AV1) pred hardvérovými dekodérmi. Vypnite, ak prestane fungovať zvukový passthrough cez HDMI.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Otvárať prehrávanie videa vo vybratej externej aplikácii na Android TV.';

  @override
  String get automaticQueuing => 'Automatické radenie do fronty';

  @override
  String get preferSdhSubtitles => 'Uprednostniť titulky SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Pri automatickom výbere uprednostniť stopy titulkov SDH/CC.';

  @override
  String get webDiagnostics => 'Webová diagnostika';

  @override
  String get webDiagnosticsTitle => 'Webová diagnostika Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Na tejto stránke môžete diagnostikovať problémy s pripojením v prehliadači (CORS, zmiešaný obsah a nastavenia zisťovania).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Zistené zlyhanie pre zmiešaný obsah';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Zistené zlyhanie CORS/preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin zistil, že stránka HTTPS sa pokúša volať URL servera cez HTTP. Prehliadače túto požiadavku zablokujú skôr, než sa dostane na váš server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin zistil zlyhanie požiadavky na úrovni prehliadača, ktoré býva spôsobené chýbajúcimi hlavičkami CORS alebo preflight na mediálnom serveri.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Cieľová URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Podrobnosti: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Aktuálny kontext behu';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Schéma';

  @override
  String get webDiagnosticsPluginMode => 'Režim pluginu';

  @override
  String get webDiagnosticsWebRtcScan => 'Skenovanie WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'Vynútená URL servera';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Predvolená URL servera';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL proxy na zisťovanie';

  @override
  String get notConfigured => 'nie je nakonfigurované';

  @override
  String get webDiagnosticsMixedContent => 'Zmiešaný obsah';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Táto stránka je načítaná cez HTTPS, ale jedna alebo viac nakonfigurovaných URL používa HTTP. Prehliadače blokujú volania z HTTPS stránok na HTTP API.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Riešenie: sprístupnite mediálny server alebo proxy koncový bod cez HTTPS, alebo načítavajte Moonfin cez HTTP len v dôveryhodných lokálnych sieťach.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'V aktuálnych nastaveniach behu sa nezistila žiadna zjavná konfigurácia so zmiešaným obsahom.';

  @override
  String get webDiagnosticsCorsChecklist => 'Kontrolný zoznam CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Povoľte origin prehliadača v Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Zahrňte Authorization, X-Emby-Authorization a X-Emby-Token do Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Sprístupnite Content-Range a Accept-Ranges pre streamovanie a posúvanie.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Na požiadavky OPTIONS preflight vracajte 204.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Ukážka hlavičiek (štýl nginx)';

  @override
  String get note => 'Poznámka';

  @override
  String get webDiagnosticsNonWebNote =>
      'Táto diagnostická trasa je určená pre webové zostavy. Ak ju vidíte na inej platforme, tieto kontroly nemusia platiť.';

  @override
  String get backToServerSelect => 'Späť na výber servera';

  @override
  String get signOutAllUsers => 'Odhlásiť všetkých používateľov';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Povolenie pre mikrofón je natrvalo zamietnuté. Zapnite ho v systémových nastaveniach.';

  @override
  String get voiceSearchPermissionRequired =>
      'Hlasové vyhľadávanie vyžaduje povolenie pre mikrofón.';

  @override
  String get voiceSearchNoMatch => 'Nerozumeli sme. Skúste to znova.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nezistila sa žiadna reč.';

  @override
  String get voiceSearchMicrophoneError => 'Chyba mikrofónu.';

  @override
  String get voiceSearchNeedsInternet =>
      'Hlasové vyhľadávanie vyžaduje internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Hlasová služba je zaneprázdnená. Skúste to znova.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Povolenie pre mikrofón je natrvalo zamietnuté.';

  @override
  String get microphonePermissionDenied =>
      'Povolenie pre mikrofón je zamietnuté.';

  @override
  String get speechRecognitionUnavailable =>
      'Rozpoznávanie reči nie je na tomto zariadení dostupné.';

  @override
  String get openIosRoutePicker => 'Otvoriť výber výstupu iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Výber výstupu AirPlay nie je na tomto zariadení dostupný.';

  @override
  String get videos => 'Videá';

  @override
  String get programs => 'Programy';

  @override
  String get songs => 'Skladby';

  @override
  String get photoAlbums => 'Fotoalbumy';

  @override
  String get photos => 'Fotografie';

  @override
  String get people => 'Osoby';

  @override
  String get recentlyReleasedEpisodes => 'Nedávno vydané epizódy';

  @override
  String get watchAgain => 'Pozrieť znova';

  @override
  String get guestAppearances => 'Hosťovské účinkovania';

  @override
  String get appearancesSeerr => 'Účinkovania (Seerr)';

  @override
  String get crewContributionsSeerr => 'Podiel štábu (Seerr)';

  @override
  String get watchWithGroup => 'Pozerať so skupinou';

  @override
  String get errors => 'Chyby';

  @override
  String get warnings => 'Varovania';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Otvoriť v prehliadači';

  @override
  String get embeddedBrowserNotAvailable =>
      'Vstavaný prehliadač nie je na tejto platforme dostupný.';

  @override
  String get adminRestartServerConfirmation =>
      'Naozaj chcete reštartovať server?';

  @override
  String get adminShutdownServerConfirmation =>
      'Naozaj chcete vypnúť server? Budete ho musieť spustiť ručne.';

  @override
  String get internal => 'Interné';

  @override
  String get idle => 'Nečinné';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nenašli sa žiadni používatelia';

  @override
  String get adminNoUsersMatchSearch =>
      'Vášmu hľadaniu nezodpovedajú žiadni používatelia';

  @override
  String get adminNoDevicesFound => 'Nenašli sa žiadne zariadenia';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Aktuálnym filtrom nezodpovedajú žiadne zariadenia';

  @override
  String get passwordSet => 'Heslo je nastavené';

  @override
  String get noPasswordConfigured => 'Nie je nastavené žiadne heslo';

  @override
  String get remoteAccess => 'Vzdialený prístup';

  @override
  String get localOnly => 'Len lokálne';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Nepodarilo sa načítať analytiku médií';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Súhrnná analytika naprieč všetkými mediálnymi knižnicami.';

  @override
  String get analyticsTopArtists => 'Najlepší interpreti';

  @override
  String get analyticsTopAuthors => 'Najlepší autori';

  @override
  String get analyticsTopContributors => 'Najlepší prispievatelia';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knižníc',
      many: '$count knižnice',
      few: '$count knižnice',
      one: '1 knižnica',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Pre tento výber zatiaľ nie sú k dispozícii žiadne súhrny indexovaných médií.';

  @override
  String get analyticsLibraryDetails => 'Podrobnosti o knižnici';

  @override
  String get analyticsLibraryBreakdown => 'Rozpis knižníc';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Nie sú k dispozícii žiadne knižnice.';

  @override
  String get adminServerAdministrationTitle => 'Správa servera';

  @override
  String get adminServerPathData => 'Údaje';

  @override
  String get adminServerPathImageCache => 'Vyrovnávacia pamäť obrázkov';

  @override
  String get adminServerPathCache => 'Vyrovnávacia pamäť';

  @override
  String get adminServerPathLogs => 'Denníky';

  @override
  String get adminServerPathMetadata => 'Metadáta';

  @override
  String get adminServerPathTranscode => 'Prekódovanie';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Tento server nevrátil žiadne cesty.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent % využité';
  }

  @override
  String get userActivity => 'Aktivita používateľov';

  @override
  String get systemEvents => 'Systémové udalosti';

  @override
  String get needsAttention => 'Vyžaduje pozornosť';

  @override
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Prehrávanie';

  @override
  String get adminDrawerSectionDevices => 'Zariadenia';

  @override
  String get adminDrawerSectionAdvanced => 'Pokročilé';

  @override
  String get adminDrawerSectionPlugins => 'Pluginy';

  @override
  String get adminDrawerSectionLiveTv => 'Živá televízia';

  @override
  String get homeVideos => 'Domáce videá';

  @override
  String get mixedContent => 'Zmiešaný obsah';

  @override
  String get homeVideosAndPhotos => 'Domáce videá a fotografie';

  @override
  String get mixedMoviesAndShows => 'Zmiešané filmy a seriály';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nenašli sa žiadne nahrávky';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'V archíve .$extension sa nenašli žiadne obrázkové strany.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Vstavané vykresľovanie zlyhalo ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Vykresľovanie EPUB zlyhalo ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Chýba lokálny súbor pre čítačku: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status pri otváraní údajov knihy z $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nie je dostupný žiadny čitateľný koncový bod knihy';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nepodporovaný formát komiksového archívu: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Plugin na rozbaľovanie CBR nie je na tejto platforme dostupný.';

  @override
  String get failedToExtractCbrArchive => 'Nepodarilo sa rozbaliť archív .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Rozbaľovanie CB7 nie je na tejto platforme dostupné.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Plugin na rozbaľovanie CB7 nie je na tejto platforme dostupný.';

  @override
  String get closeGenrePanel => 'Zavrieť panel žánrov';

  @override
  String get loadingShuffle => 'Načítava sa náhodný výber...';

  @override
  String get libraryShuffleLabel => 'NÁHODNE Z KNIŽNICE';

  @override
  String get randomShuffleLabel => 'NÁHODNÝ VÝBER';

  @override
  String get genresShuffleLabel => 'NÁHODNE PODĽA ŽÁNRU';

  @override
  String get autoHdrSwitching => 'Automatické prepínanie HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Automaticky zapnúť HDR pri prehrávaní HDR videa a po ukončení obnoviť režim zobrazenia.';

  @override
  String get whenFullscreen => 'Na celej obrazovke';

  @override
  String get changeArtwork => 'Zmeniť obrázok';

  @override
  String get missing => 'Chýba';

  @override
  String get transcodingLimits => 'Limity prekódovania';

  @override
  String get clearAllArtworkButton => 'Vymazať všetky obrázky?';

  @override
  String get clearAllArtworkWarning =>
      'Naozaj chcete vymazať všetky stiahnuté obrázky?';

  @override
  String get confirmClear => 'Potvrdiť vymazanie';

  @override
  String confirmClearMessage(String itemType) {
    return 'Naozaj chcete vymazať položku „$itemType“?';
  }

  @override
  String get uploadButton => 'Nahrať?';

  @override
  String get resolutionLabel => 'Rozlíšenie: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Zobrazovať len obrázky v jazyku rozhrania';

  @override
  String get confirmClearAll => 'Potvrdiť vymazanie všetkého';

  @override
  String get imageUploadSuccess => 'Obrázok bol úspešne nahraný!';

  @override
  String imageUploadFailed(String error) {
    return 'Nepodarilo sa nahrať obrázok: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Nepodarilo sa nastaviť obrázok: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Nepodarilo sa odstrániť obrázok: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Nepodarilo sa vymazať všetky obrázky: $error';
  }

  @override
  String get yes => 'Áno';

  @override
  String get posterCategory => 'Plagát';

  @override
  String get backdropsCategory => 'Pozadia';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniatúra';

  @override
  String get artCategory => 'Grafika';

  @override
  String get discArtCategory => 'Grafika disku';

  @override
  String get screenshotCategory => 'Snímka obrazovky';

  @override
  String get boxCoverCategory => 'Predná strana obalu';

  @override
  String get boxRearCoverCategory => 'Zadná strana obalu';

  @override
  String get menuArtCategory => 'Grafika ponuky';

  @override
  String get confirmItemPoster => 'plagát';

  @override
  String get confirmItemBackdrop => 'pozadie';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniatúra';

  @override
  String get confirmItemArt => 'grafika';

  @override
  String get confirmItemDiscArt => 'grafika disku';

  @override
  String get confirmItemScreenshot => 'snímka obrazovky';

  @override
  String get confirmItemBoxCover => 'predná strana obalu';

  @override
  String get confirmItemBoxRearCover => 'zadná strana obalu';

  @override
  String get confirmItemMenuArt => 'grafika ponuky';

  @override
  String get resolutionAll => 'Všetky';

  @override
  String get resolutionHigh => 'Vysoké (1080p+)';

  @override
  String get resolutionMedium => 'Stredné (720p)';

  @override
  String get resolutionLow => 'Nízke (<720p)';

  @override
  String get sources => 'Zdroje';

  @override
  String get audiobookChapters => 'Kapitoly';

  @override
  String get audiobookBookmarks => 'Záložky';

  @override
  String get audiobookNotes => 'Poznámky';

  @override
  String get audiobookQueue => 'Fronta';

  @override
  String get audiobookTimeline => 'Časová os';

  @override
  String get audiobookTimelineEmpty => 'Časová os je prázdna';

  @override
  String get audiobookWholeBook => 'Celá kniha';

  @override
  String get audiobookFocusedTimeline => 'Zameraná časová os';

  @override
  String get audiobookExportBookmarks => 'Exportovať záložky';

  @override
  String get audiobookExportNotes => 'Exportovať poznámky';

  @override
  String get audiobookExportAll => 'Exportovať všetko';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exportované do $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Export zlyhal: $error';
  }

  @override
  String get audiobookLyrics => 'Text';

  @override
  String get audiobookAddBookmark => 'Pridať záložku';

  @override
  String get audiobookAddNote => 'Pridať poznámku';

  @override
  String get audiobookEditNote => 'Upraviť poznámku';

  @override
  String get audiobookNoteHint => 'Napíšte poznámku k tomuto momentu';

  @override
  String get audiobookSleepTimer => 'Časovač vypnutia';

  @override
  String get audiobookSleepOff => 'Vypnuté';

  @override
  String get audiobookSleepEndOfChapter => 'Koniec kapitoly';

  @override
  String get audiobookSleepCustom => 'Vlastné';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'zostáva $remaining';
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
  String get audiobookPlaybackSpeed => 'Rýchlosť prehrávania';

  @override
  String get audiobookRemainingTime => 'Zostáva';

  @override
  String get audiobookElapsedTime => 'Uplynulo';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Späť o $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Vpred o $seconds s';
  }

  @override
  String get audiobookPreviousChapter => 'Predchádzajúca kapitola';

  @override
  String get audiobookNextChapter => 'Ďalšia kapitola';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Kapitola $current z $total';
  }

  @override
  String get audiobookNoChapters => 'Žiadne kapitoly';

  @override
  String get audiobookNoBookmarks => 'Zatiaľ žiadne záložky';

  @override
  String get audiobookNoNotes => 'Zatiaľ žiadne poznámky';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Záložka pridaná na $position';
  }

  @override
  String get audiobookSpeedReset => 'Obnoviť na 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Uložiť';

  @override
  String get audiobookCancel => 'Zrušiť';

  @override
  String get audiobookDelete => 'Vymazať';

  @override
  String get subtitlePreferences => 'Predvoľby titulkov';

  @override
  String get subtitlePreferencesDescription =>
      'Zmeňte režimy titulkov, predvolené jazyky, vzhľad a možnosti vykresľovania.';

  @override
  String get subtitleRendering => 'Vykresľovanie titulkov';

  @override
  String get displayOptions => 'Možnosti zobrazenia';

  @override
  String get releaseDateAscending => 'Dátum vydania (vzostupne)';

  @override
  String get releaseDateDescending => 'Dátum vydania (zostupne)';

  @override
  String get groupContributions => 'Zoskupiť podiely';

  @override
  String get groupMultipleRoles => 'Zoskupiť viacero rolí';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Upozornenie na prístup na zápis do knižnice';

  @override
  String get libraryWriteAccessHowToFix => 'Ako to opraviť:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Udeľte servisnému používateľovi Jellyfin (napr. jellyfin alebo Docker PUID/PGID) oprávnenia na zápis do priečinkov vašej mediálnej knižnice na serveri.\n\n2. Alebo v nástenke Jellyfin prejdite do sekcie Libraries, upravte túto knižnicu a vypnite možnosť „Save artwork into media folders“, aby sa obrázky ukladali do internej databázy Jellyfin.';

  @override
  String get dismiss => 'Zavrieť';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Vaša knižnica „$libraryName“ je nastavená tak, aby ukladala obrázky priamo do mediálnych priečinkov (možnosť „Save artwork into media folders“ je zapnutá). Jellyfin však otestoval prístup na zápis a nemá oprávnenie zapisovať súbory do tohto adresára:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Zdá sa, že Jellyfin nedokázal aktualizovať obrázky. Vaša knižnica je nastavená tak, aby ukladala obrázky priamo do mediálnych priečinkov (možnosť „Save artwork into media folders“ je zapnutá). Táto chyba sa zvyčajne vyskytuje, keď serverový proces Jellyfin nemá oprávnenie zapisovať súbory do vašich mediálnych adresárov.';

  @override
  String get externalLists => 'Externé zoznamy';

  @override
  String get replay => 'Prehrať znova';

  @override
  String get fileInformation => 'Informácie o súbore';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Veľkosť: $size  •  Formát: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Zobraziť všetky zvukové stopy ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Zobraziť všetky stopy titulkov ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Kontroluje sa možnosť priameho prehrávania...';

  @override
  String get directPlayCapabilityLabel => 'Možnosť priameho prehrávania: ';

  @override
  String get forced => 'Vynútené';

  @override
  String get transcodeContainerNotSupported =>
      'Prehrávač nepodporuje formát kontajnera.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Kodek videa nie je podporovaný.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Kodek zvuku nie je podporovaný.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Formát titulkov nie je podporovaný (vyžaduje vypálenie do obrazu).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Profil zvuku nie je podporovaný.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Profil videa nie je podporovaný.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Úroveň videa nie je podporovaná.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Toto zariadenie nepodporuje rozlíšenie videa.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Bitová hĺbka videa nie je podporovaná.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Snímková frekvencia videa nie je podporovaná.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Bitový tok súboru prekračuje limit streamovania prehrávača.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Bitový tok videa prekračuje limit streamovania.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Bitový tok zvuku prekračuje limit streamovania.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Počet zvukových kanálov nie je podporovaný.';

  @override
  String get sortAlphabetical => 'Abecedne';

  @override
  String get sortReleaseAscending => 'Poradie vydania (vzostupne)';

  @override
  String get sortReleaseDescending => 'Poradie vydania (zostupne)';

  @override
  String get sortCustomDragDrop => 'Vlastné (ťahaním myšou)';

  @override
  String get playlistSortOptions => 'Možnosti zoradenia playlistu';

  @override
  String get resetSort => 'Obnoviť zoradenie';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Pozrieť znova S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Pozrieť playlist znova';

  @override
  String get noSubtitlesFound => 'Nenašli sa žiadne titulky.';

  @override
  String get adminControls => 'Ovládanie správcu';

  @override
  String get impellerRendering => 'Vykresľovací engine (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller je moderný GPU renderer Flutteru pre plynulejšie animácie a menej trhania. Na niektorých TV boxoch a starších GPU môže spôsobovať chyby zobrazenia alebo čierne video; v takom prípade ho vypnite. Automatický vyberie najlepšiu predvoľbu pre vaše zariadenie. Zmena sa prejaví po reštarte Moonfin.';

  @override
  String get impellerAuto => 'Automatický';

  @override
  String get impellerOn => 'Zapnuté';

  @override
  String get impellerOff => 'Vypnuté';

  @override
  String get impellerRestartTitle => 'Vyžaduje sa reštart';

  @override
  String get impellerRestartMessage =>
      'Moonfin sa musí reštartovať, aby sa zmenil vykresľovací engine. Zatvorte teraz aplikáciu a znova ju otvorte.';

  @override
  String get impellerCloseNow => 'Zatvoriť aplikáciu';

  @override
  String get adminRefreshLibrary => 'Obnoviť knižnicu';

  @override
  String get adminRefreshAllLibraries => 'Obnoviť všetky knižnice';

  @override
  String get adminRepoSortDateOldest => 'Dátum pridania (najstaršie prvé)';

  @override
  String get adminRepoSortDateNewest => 'Dátum pridania (najnovšie prvé)';

  @override
  String get adminRepoSortNameAsc => 'Abecedne (A – Z)';

  @override
  String get adminRepoSortNameDesc => 'Abecedne (Z – A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Načítava sa analytika servera... $percentage %';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Podľa zdroja';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 filmov';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 seriálov';

  @override
  String get imdbMostPopularMovies => 'Najpopulárnejšie filmy na IMDb';

  @override
  String get imdbMostPopularTvShows => 'Najpopulárnejšie seriály na IMDb';

  @override
  String get imdbLowestRatedMovies => 'Najhoršie hodnotené filmy na IMDb';

  @override
  String get imdbTopEnglishMovies =>
      'Najlepšie hodnotené anglické filmy na IMDb';
}
