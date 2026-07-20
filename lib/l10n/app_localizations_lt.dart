// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'PASKYROS NUOSTATOS';

  @override
  String get interfaceLanguage => 'Sąsajos kalba';

  @override
  String get systemLanguageDefault => 'Sistemos numatytoji';

  @override
  String get signIn => 'Prisijunkite';

  @override
  String get empty => 'Tuščia';

  @override
  String connectingToServer(String serverName) {
    return 'Jungiamasi prie $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Slaptažodis';

  @override
  String get username => 'Vartotojo vardas';

  @override
  String get email => 'El. paštas';

  @override
  String get quickConnectInstruction =>
      'Įveskite šį kodą savo serverio žiniatinklio informacijos suvestinėje:';

  @override
  String get waitingForAuthorization => 'Laukiama įgaliojimo...';

  @override
  String get back => 'Atgal';

  @override
  String get serverUnavailable => 'Serveris nepasiekiamas';

  @override
  String get loginFailed => 'Prisijungti nepavyko';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect nepasiekiamas: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nepasiekiamas ($status): $detail';
  }

  @override
  String get whosWatching => 'Kas žiūri?';

  @override
  String get addUser => 'Pridėti naudotoją';

  @override
  String get selectServer => 'Pasirinkite Serveris';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versija $version';
  }

  @override
  String get savedServers => 'Išsaugoti serveriai';

  @override
  String get discoveredServers => 'Atrasti serveriai';

  @override
  String get noneFound => 'Nerasta';

  @override
  String get unableToConnectToServer => 'Nepavyko prisijungti prie serverio';

  @override
  String get addServer => 'Pridėti serverį';

  @override
  String get embyConnect => 'Emby Prisijunkite';

  @override
  String get removeServer => 'Pašalinti serverį';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Pašalinti „$serverName“ iš jūsų serverių?';
  }

  @override
  String get cancel => 'Atšaukti';

  @override
  String get remove => 'Pašalinti';

  @override
  String get connectToServer => 'Prisijunkite prie serverio';

  @override
  String get serverAddress => 'Serverio adresas';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Prisijunkite';

  @override
  String get secureStorageUnavailable => 'Saugi saugykla nepasiekiama';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin negalėjo pasiekti jūsų sistemos raktų pakabuko. Prisijungimas gali būti tęsiamas, tačiau saugi žetonų saugykla gali būti nepasiekiama, kol nebus atrakintas raktų pakabukas.';

  @override
  String get ok => 'Gerai';

  @override
  String get settingsAppearanceTheme => 'Programos tema';

  @override
  String get detailScreenStyle => 'Detalių ekrano stilius';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasikinis – originalus centruotas Moonfin išdėstymas. Modernus – prisitaikantis kinematografinis išdėstymas.';

  @override
  String get detailScreenStyleMoonfin => 'Klasikinis';

  @override
  String get detailScreenStyleModern => 'Modernus';

  @override
  String get expandedTabs => 'Išskleisti skirtukai';

  @override
  String get expandedTabsSubtitle =>
      'Automatiškai rodyti skirtuko turinį naršant skirtukus. Išjunkite, kad kiekvieną skirtuką atidarytumėte ir uždarytumėte rankiniu būdu.';

  @override
  String get showTechnicalDetails => 'Rodyti techninę informaciją?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Rodyti kodeko, raiškos ir srauto informaciją antraštės santraukoje';

  @override
  String get recommendationSystem => 'Rekomendacijų sistema';

  @override
  String get recommendationSystemSubtitle =>
      'Naudokite Moonfin Recommends vietinės bibliotekos algoritmą arba internetinius TMDB panašumo rodiklius. Pastaba: internetinėms rekomendacijoms reikia Seerr integracijos.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb panašumas';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Taikyti amžiaus cenzo ribą?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Riboti Moonfin Recommends pasiūlymus pagal pasirinktos medijos amžiaus cenzą';

  @override
  String get interfaceStyle => 'Sąsajos stilius';

  @override
  String get interfaceStyleSubtitle =>
      'Automatinis prisitaiko prie jūsų įrenginio. Pasirinkite Apple arba Material, kad nustatytumėte konkrečią išvaizdą.';

  @override
  String get interfaceStyleAutomatic => 'Automatinis';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Stiklo kokybė';

  @override
  String get glassQualitySubtitle =>
      'Automatinis parenka geriausią stiklo efektą šiam įrenginiui. Visas įjungia tikrą suliejimą; Sumažintas naudoja lengvą stiklą, taupantį GPU energiją.';

  @override
  String get glassQualityAuto => 'Automatinis';

  @override
  String get glassQualityFull => 'Visas';

  @override
  String get glassQualityReduced => 'Sumažintas';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Perjunkite „Moonfin“ ir „Neon Pulse“ iš naujo nepaleidę programos';

  @override
  String get customThemeTitle => 'Pasirinktinė tema';

  @override
  String get customThemeSubtitle =>
      'Pasirinktinės temos keičia vaizdo elementus visoje Moonfin programoje. Pasirinkite vieną iš šių parinkčių pagal savo stilių.';

  @override
  String get keyboardPreferSystemIme => 'Pirmenybė sistemos klaviatūrai';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Tekstui įvesti pagal numatytuosius nustatymus naudoti įrenginio įvesties metodą';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Dabartinė Moonfin išvaizda, kurią jūs visi pamėgote';

  @override
  String get themeNeonPulse => 'Neoninis pulsas';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stilius su purpuriniu švytėjimu, žalsvai mėlynu tekstu ir stipresniu chromo kontrastu';

  @override
  String get themeGlass => 'Stiklas';

  @override
  String get themeGlassSubtitle =>
      'Skysto stiklo stilius su slenkančiu gradiento fonu, matiniais paviršiais ir Apple mėlynu akcentu';

  @override
  String get theme8BitHero => '8 bitų herojus';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pikselių meno stilius su stambia palete, blokiniais rėmeliais, ryškiais šešėliais ir pikselių šriftu';

  @override
  String get embyConnectSignInSubtitle =>
      'Prisijunkite naudodami savo Emby Connect paskyrą';

  @override
  String get emailOrUsername => 'Paštas arba vartotojo vardas';

  @override
  String get selectAServer => 'Pasirinkite serverį';

  @override
  String get tryAgain => 'Bandyk dar kartą';

  @override
  String get noLinkedServers =>
      'Nėra serverių, susietų su šia Emby Connect paskyra';

  @override
  String get invalidEmbyConnectCredentials =>
      'Netinkami „Emby Connect“ kredencialai';

  @override
  String get invalidEmbyConnectLogin =>
      'Neteisingas Emby Connect vartotojo vardas arba slaptažodis';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serveris nepalaiko Emby Connect mainų';

  @override
  String get embyConnectNetworkError =>
      'Tinklo klaida susisiekiant su Emby Connect arba pasirinktu serveriu';

  @override
  String get loadingLinkedServers => 'Įkeliami susieti serveriai...';

  @override
  String get connectingToServerEllipsis => 'Prisijungiama prie serverio...';

  @override
  String get noReachableAddress => 'Nepateiktas pasiekiamas adresas';

  @override
  String get invalidServerExchangeResponse =>
      'Netinkamas atsakymas iš serverio mainų galutinio taško';

  @override
  String unableToConnectTo(String target) {
    return 'Nepavyko prisijungti prie $target';
  }

  @override
  String get exitApp => 'Išeiti iš Moonfin?';

  @override
  String get exitAppConfirmation => 'Ar tikrai norite išeiti?';

  @override
  String get exit => 'Išeiti';

  @override
  String get gameMenu => 'Meniu';

  @override
  String get gamePaused => 'Pristabdyta';

  @override
  String get gameSaveState => 'Įrašyti būseną';

  @override
  String get games => 'Žaidimai';

  @override
  String get gameLoadState => 'Įkelti būseną';

  @override
  String get gameFastForward => 'Pagreitinti';

  @override
  String get gameEmulatorSettings => 'Emuliatoriaus nustatymai';

  @override
  String get gameNoCoreOptions => 'Šis branduolys neturi keičiamų parinkčių.';

  @override
  String get gameHoldToOpenMenu => 'Palaikykite, kad atidarytumėte meniu';

  @override
  String get gamePlaybackUnsupported =>
      'Žaidimai šiame įrenginyje kol kas nepalaikomi.';

  @override
  String get noHomeRowsLoaded => 'Nepavyko įkelti jokių pradinių eilučių';

  @override
  String get noHomeRowsHint =>
      'Pabandykite atnaujinti arba sumažinti aktyvias namų dalis.';

  @override
  String get retryHomeRows => 'Iš naujo bandykite pagrindines eilutes';

  @override
  String get guide => 'Vadovas';

  @override
  String get recordings => 'Įrašai';

  @override
  String get schedule => 'Tvarkaraštis';

  @override
  String get series => 'Serialai';

  @override
  String get noItemsFound => 'Elementų nerasta';

  @override
  String get home => 'Pradžia';

  @override
  String get browseAll => 'Naršyti viską';

  @override
  String get genres => 'Žanrai';

  @override
  String get collectionPlaceholder => 'Kolekcijos elementai bus rodomi čia';

  @override
  String get browseByLetter => 'Naršyti pagal raidę';

  @override
  String get alphabeticalBrowsePlaceholder => 'Čia bus rodomas abėcėlės tvarka';

  @override
  String get suggestions => 'Pasiūlymai';

  @override
  String get suggestionsPlaceholder => 'Siūlomi elementai bus rodomi čia';

  @override
  String get failedToLoadLibraries => 'Nepavyko įkelti bibliotekų';

  @override
  String get noLibrariesFound => 'Bibliotekų nerasta';

  @override
  String get library => 'Biblioteka';

  @override
  String get displaySettings => 'Ekrano nustatymai';

  @override
  String get allGenres => 'Visi žanrai';

  @override
  String get noGenresFound => 'Žanrų nerasta';

  @override
  String failedToLoadFolderError(String error) {
    return 'Nepavyko įkelti aplanko: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Šis aplankas tuščias';

  @override
  String itemCountLabel(int count) {
    return 'Elementų: $count';
  }

  @override
  String get failedToLoadFavorites => 'Nepavyko įkelti mėgstamiausių';

  @override
  String get retry => 'Bandykite dar kartą';

  @override
  String get noFavoritesYet => 'Mėgstamiausių dar nėra';

  @override
  String get favorites => 'Mėgstamiausi';

  @override
  String totalCountItems(int count) {
    return 'Elementų: $count';
  }

  @override
  String get continuing => 'Tęsinys';

  @override
  String get ended => 'Baigėsi';

  @override
  String get sortAndFilter => 'Rūšiuoti ir filtruoti';

  @override
  String get type => 'Tipas';

  @override
  String get sortBy => 'Rūšiuoti pagal';

  @override
  String get display => 'Ekranas';

  @override
  String get imageType => 'Vaizdo tipas';

  @override
  String get posterSize => 'Plakato dydis';

  @override
  String get small => 'Mažas';

  @override
  String get medium => 'Vidutinis';

  @override
  String get large => 'Didelis';

  @override
  String get extraLarge => 'Itin didelis';

  @override
  String libraryGenresTitle(String name) {
    return '$name — žanrai';
  }

  @override
  String get views => 'Peržiūros';

  @override
  String get albums => 'Albumai';

  @override
  String get albumArtists => 'Albumo menininkai';

  @override
  String get artists => 'Atlikėjai';

  @override
  String get bookmarks => 'Žymės';

  @override
  String get noSavedBookmarks => 'Dar nėra išsaugotų šio pavadinimo žymių.';

  @override
  String get openBook => 'Atidarykite knygą';

  @override
  String get chapter => 'skyrius';

  @override
  String get page => 'Puslapis';

  @override
  String get bookmark => 'Žymė';

  @override
  String get justNow => 'Tik dabar';

  @override
  String minutesAgo(int count) {
    return 'prieš $count min.';
  }

  @override
  String hoursAgo(int count) {
    return 'prieš $count val.';
  }

  @override
  String daysAgo(int count) {
    return 'prieš $count d.';
  }

  @override
  String get discoverySubjects => 'Atradimų dalykai';

  @override
  String get pickDiscoverySubjects =>
      'Pasirinkite, kuriuos temų kanalus rodyti „Discover“.';

  @override
  String get apply => 'Taikyti';

  @override
  String get openLink => 'Atidaryti nuorodą';

  @override
  String get scanWithYourPhone => 'Nuskaitykite telefonu';

  @override
  String get audiobookGenres => 'Garsinių knygų žanrai';

  @override
  String get pickAudiobookGenres =>
      'Pasirinkite, kuriuos žanrus rodyti garso knygoje Discover.';

  @override
  String get discoverAudiobooks => 'Atraskite garsines knygas';

  @override
  String get librivoxDescription =>
      'Populiarūs viešojo domeno pavadinimai iš LibriVox.';

  @override
  String titlesCount(int count) {
    return 'Pavadinimų: $count';
  }

  @override
  String get scrollLeft => 'Slinkite kairėn';

  @override
  String get scrollRight => 'Slinkite dešinėn';

  @override
  String get couldNotLoadGenre => 'Šiuo metu nepavyko įkelti šio žanro.';

  @override
  String get continueReading => 'Skaityti toliau';

  @override
  String get savedHighlights => 'Išsaugoti akcentai';

  @override
  String get continueListening => 'Klausyti toliau';

  @override
  String get listen => 'Klausyk';

  @override
  String get resume => 'Tęsti';

  @override
  String get failedToLoadLibrary => 'Nepavyko įkelti bibliotekos';

  @override
  String get popularNow => 'Populiaru dabar';

  @override
  String get savedForLater => 'Išsaugota Vėliau';

  @override
  String get topListens => 'Populiariausi klausymai';

  @override
  String get unreadDiscoveries => 'Neskaityti atradimai';

  @override
  String get pickUpAgain => 'Paimk dar kartą';

  @override
  String get bookHighlightsDescription =>
      'Jūsų knygos su svarbiausiomis akimirkomis, mėgstamiausiomis ar skaitymo eiga.';

  @override
  String get handPickedFromLibrary => 'Pasirinkta iš jūsų bibliotekos.';

  @override
  String get handPickedFromListeningQueue =>
      'Pasirinkta iš jūsų klausymosi eilės.';

  @override
  String get booksWithHighlights =>
      'Knygos su svarbiausiais momentais, mėgstamiausiais ar skaitymo pažanga.';

  @override
  String get jumpBackNarration =>
      'Grįžkite į pasakojimą neieškodami savo vietos.';

  @override
  String get unreadBooksReady =>
      'Neskaitytos knygos, paruoštos kitai ramiai valandai.';

  @override
  String get quickAccessFavorites =>
      'Greita prieiga prie knygų, prie kurių vis sugrįžtate.';

  @override
  String get searchAudiobooks => 'Ieškokite garso knygų';

  @override
  String get searchYourLibrary => 'Ieškokite savo bibliotekoje';

  @override
  String get pickUpStory => 'Tęskite istoriją ten, kur baigėte';

  @override
  String get savedPlacesChapters =>
      'Jūsų išsaugotos vietos ir nebaigti skyriai';

  @override
  String authorsCount(int count) {
    return 'Autorių: $count';
  }

  @override
  String genresCount(int count) {
    return 'Žanrų: $count';
  }

  @override
  String percentCompleted(int percent) {
    return 'Užbaigta $percent%';
  }

  @override
  String get readyWhenYouAre => 'Pasiruošę, kai būsite';

  @override
  String get details => 'Detalės';

  @override
  String get listeningRoom => 'Pasiklausymo kambarys';

  @override
  String get bookmarksAndProgress => 'Žymės ir pažanga';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Pavadinimų: $count. Išdėstyta patogiam skaitymui.';
  }

  @override
  String get titles => 'Pavadinimai';

  @override
  String get allTitles => 'Visi titulai';

  @override
  String get authors => 'Autoriai';

  @override
  String get browseByAuthor => 'Naršyti pagal autorių';

  @override
  String get browseByGenre => 'Naršyti pagal žanrą';

  @override
  String get discover => 'Atrask';

  @override
  String get trendingTitlesOpenLibrary =>
      'Populiarūs pavadinimai pagal temą iš Open Library.';

  @override
  String get noBookmarkedItems => 'Dar nėra pažymėtų elementų';

  @override
  String get nothingMatchesSection =>
      'Kol kas niekas neatitinka šios skilties. Išbandykite kitą skirtuką arba grįžkite, kai baigsis bibliotekos sinchronizavimas.';

  @override
  String get audiobooks => 'Garsinės knygos';

  @override
  String noLabelFound(String label) {
    return '$label nerasta';
  }

  @override
  String get folder => 'Aplankas';

  @override
  String get filters => 'Filtrai';

  @override
  String get readingStatus => 'Skaitymo būsena';

  @override
  String get playedStatus => 'Žaidžiama būsena';

  @override
  String get readStatus => 'Skaityti';

  @override
  String get watched => 'Žiūrėta';

  @override
  String get unread => 'Neskaityta';

  @override
  String get unwatched => 'Nežiūrėta';

  @override
  String get seriesStatus => 'Serijos būsena';

  @override
  String get allLibraries => 'Visos bibliotekos';

  @override
  String get books => 'Knygos';

  @override
  String get latestBooks => 'Naujausios knygos';

  @override
  String get latestAudiobooks => 'Naujausios garso knygos';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count knygų',
      many: '$count knygos',
      few: '$count knygos',
      one: '$count knyga',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Knyga';

  @override
  String get bookFormatAudiobook => 'Garso knyga';

  @override
  String bookPercentRead(int percent) {
    return 'Perskaityta $percent%';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Liko $time';
  }

  @override
  String get bookHeroRead => 'Skaityti';

  @override
  String get bookHeroListen => 'Klausyti';

  @override
  String get author => 'Autorius';

  @override
  String get unknownAuthor => 'Nežinomas autorius';

  @override
  String get uncategorized => 'Neįtraukta į kategorijas';

  @override
  String get overview => 'Apžvalga';

  @override
  String get noLibrivoxDescription =>
      'LibriVox dar nepateikė šio pavadinimo aprašymo.';

  @override
  String get readers => 'Skaitytojai';

  @override
  String get openLinks => 'Atidarykite nuorodas';

  @override
  String get librivoxPage => '„LibriVox“ puslapis';

  @override
  String get internetArchive => 'Interneto archyvas';

  @override
  String get rssFeed => 'RSS tiekimas';

  @override
  String get downloadZip => 'Parsisiųsti Zip';

  @override
  String sectionCountLabel(int count) {
    return 'Skyrių: $count';
  }

  @override
  String firstPublished(int year) {
    return 'Pirmą kartą išleista $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Iš Open Library kol kas nėra šio pavadinimo apžvalgos.';

  @override
  String get subjects => 'Dalykai';

  @override
  String get all => 'Visi';

  @override
  String booksCount(int count) {
    return 'Knygų: $count';
  }

  @override
  String get couldNotLoadSubject => 'Šiuo metu nepavyko įkelti šios temos.';

  @override
  String get audiobookDetails => 'Garsinės knygos detalės';

  @override
  String authorsCountTitle(int count) {
    return 'Autorių: $count';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count garso knygų',
      many: '$count garso knygos',
      few: '$count garso knygos',
      one: '$count garso knyga',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Takelių sąrašas';

  @override
  String get itemListPlaceholder => 'Čia pasirodys prekių sąrašas';

  @override
  String get failedToLoad => 'Nepavyko įkelti';

  @override
  String get delete => 'Ištrinti';

  @override
  String get save => 'Išsaugoti';

  @override
  String get moreLikeThis => 'Daugiau panašaus';

  @override
  String get castAndCrew => 'Aktoriai ir įgula';

  @override
  String get collection => 'Kolekcija';

  @override
  String get episodes => 'Epizodai';

  @override
  String get nextUp => 'Kitas';

  @override
  String get seasons => 'Sezonai';

  @override
  String get chapters => 'Skyriai';

  @override
  String get features => 'Savybės';

  @override
  String get movies => 'Filmai';

  @override
  String get musicVideos => 'Muzikiniai vaizdo klipai';

  @override
  String get other => 'Kita';

  @override
  String get discography => 'Diskografija';

  @override
  String get similarArtists => 'Panašūs menininkai';

  @override
  String get tableOfContents => 'Turinys';

  @override
  String get tracklist => 'Takelių sąrašas';

  @override
  String discNumber(int number) {
    return '$number diskas';
  }

  @override
  String get biography => 'Biografija';

  @override
  String get authorDetails => 'Išsami informacija apie autorių';

  @override
  String get noOverviewAvailable => 'Dar nėra šio pavadinimo apžvalgos.';

  @override
  String get noBiographyAvailable => 'Nėra šio autoriaus biografijos.';

  @override
  String get noBooksFound => 'Nerasta šio autoriaus knygų.';

  @override
  String get unableToLoadAuthorDetails =>
      'Šiuo metu nepavyko įkelti išsamios autoriaus informacijos.';

  @override
  String published(int year) {
    return 'Išleista $year';
  }

  @override
  String get publicationDateUnknown => 'Išleidimo data nežinoma';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sezonų',
      many: '$count sezono',
      few: '$count sezonai',
      one: '$count sezonas',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Baigsis $time';
  }

  @override
  String get items => 'Elementai';

  @override
  String get extras => 'Priedai';

  @override
  String get behindTheScenes => 'Užkulisiai';

  @override
  String get deletedScenes => 'Iškirptos scenos';

  @override
  String get featurettes => 'Apžvalginiai filmukai';

  @override
  String get interviews => 'Interviu';

  @override
  String get scenes => 'Scenos';

  @override
  String get shorts => 'Trumpametražiai filmai';

  @override
  String get trailers => 'Anonsai';

  @override
  String timeRemaining(String time) {
    return 'Liko $time';
  }

  @override
  String endsIn(String time) {
    return 'Baigsis po $time';
  }

  @override
  String get view => 'Žiūrėti';

  @override
  String get resumeReading => 'Tęsti skaitymą';

  @override
  String get read => 'Skaityti';

  @override
  String resumeFrom(String position) {
    return 'Tęsti nuo $position';
  }

  @override
  String get play => 'Leisti';

  @override
  String get startOver => 'Pradėti iš naujo';

  @override
  String get restart => 'Paleisti iš naujo';

  @override
  String get readOffline => 'Skaitykite neprisijungę';

  @override
  String get playOffline => 'Žaisti neprisijungus';

  @override
  String get audio => 'Garsas';

  @override
  String get subtitles => 'Subtitrai';

  @override
  String get version => 'Versija';

  @override
  String get cast => 'Transliuoti';

  @override
  String get trailer => 'Anonsas';

  @override
  String get finished => 'Baigta';

  @override
  String get favorited => 'Į adresyną';

  @override
  String get favorite => 'Mėgstamiausias';

  @override
  String get playlist => 'Grojaraštis';

  @override
  String get downloaded => 'Atsisiųsta';

  @override
  String get downloadAll => 'Atsisiųsti viską';

  @override
  String get download => 'Atsisiųsti';

  @override
  String get deleteDownloaded => 'Ištrinti atsisiųstas';

  @override
  String get goToSeries => 'Eikite į seriją';

  @override
  String get editMetadata => 'Redaguoti metaduomenis';

  @override
  String get less => 'Mažiau';

  @override
  String get more => 'Daugiau';

  @override
  String get deleteItem => 'Ištrinti elementą';

  @override
  String get deletePlaylist => 'Ištrinti grojaraštį';

  @override
  String get deletePlaylistMessage => 'Ištrinti šį grojaraštį iš serverio?';

  @override
  String get deleteItemMessage => 'Ištrinti šį elementą iš serverio?';

  @override
  String get failedToDeletePlaylist => 'Nepavyko ištrinti grojaraščio';

  @override
  String get failedToDeleteItem => 'Nepavyko ištrinti elemento';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Pervardyti grojaraštį';

  @override
  String get playlistName => 'Grojaraščio pavadinimas';

  @override
  String get deleteDownloadedAlbum => 'Ištrinti atsisiųstą albumą';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Ištrinti atsisiųstus „$title“ takelius?';
  }

  @override
  String get downloadedTracksDeleted => 'Atsisiųsti takeliai ištrinti';

  @override
  String get downloadedTracksDeleteFailed =>
      'Kai kurių atsisiųstų takelių nepavyko ištrinti';

  @override
  String get noTracksLoaded => 'Nėra įkeltų takelių';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel neįkelta';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Atsisiunčiama $title ($count elem.)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Ar tikrai norite ištrinti „$name“ iš serverio? Šio veiksmo anuliuoti nepavyks.';
  }

  @override
  String get itemDeleted => 'Elementas ištrintas';

  @override
  String get noPlayableTrailerFound => 'Nerastas leistinas anonsas.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Nepalaikomas knygos formatas: .$extension';
  }

  @override
  String get audioTrack => 'Garso takelis';

  @override
  String get subtitleTrack => 'Subtitrų takelis';

  @override
  String get none => 'Nėra';

  @override
  String get downloadSubtitlesLabel => 'Parsisiųsti subtitrus...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Ieškokite naudodami „OpenSubtitles“ papildinį';

  @override
  String get downloadSubtitles => 'Atsisiųsti subtitrus';

  @override
  String get selectedSubtitleInvalid => 'Pasirinkti subtitrai netinkami.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitrai atsisiųsti ir pasirinkti: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitrai atsisiųsta. Gali užtrukti, kol jis pasirodys, kol Jellyfin atnaujins elementą.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nuotolinių subtitrų ($language) nerasta.';
  }

  @override
  String get selectVersion => 'Pasirinkite Versija';

  @override
  String versionNumber(int number) {
    return '$number versija';
  }

  @override
  String get downloadAllQuality => 'Atsisiųsti viską – kokybė';

  @override
  String get downloadQuality => 'Atsisiuntimo kokybė';

  @override
  String get originalFileNoReencoding => 'Originalus failas, be perkodavimo';

  @override
  String get originalFilesNoReencoding => 'Originalūs failai, be perkodavimo';

  @override
  String get noEpisodesLoaded => 'Neįkelta jokių serijų';

  @override
  String downloadingItem(String name, String quality) {
    return 'Atsisiunčiama $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Ištrinkite atsisiųstus failus';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Ištrinti vietinius failus: $typeLabel?\n\nTaip atlaisvinsite vietos saugykloje. Vėliau galėsite atsisiųsti iš naujo.';
  }

  @override
  String get downloadedFilesDeleted => 'Atsisiųsti failai ištrinti';

  @override
  String get failedToDeleteFiles => 'Nepavyko ištrinti failų';

  @override
  String get deleteFiles => 'Ištrinti failus';

  @override
  String get director => 'DIREKTORIAUS';

  @override
  String get directors => 'REŽISIERIAI';

  @override
  String get writer => 'SCENARISTAS';

  @override
  String get writers => 'SCENARISTAI';

  @override
  String get studio => 'STUDIJA';

  @override
  String studioMoreCount(int count) {
    return '+$count daugiau';
  }

  @override
  String totalEpisodes(int count) {
    return 'Serijų: $count';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '$number serija';
  }

  @override
  String chapterNumber(int number) {
    return '$number skyrius';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count takelių',
      many: '$count takelio',
      few: '$count takeliai',
      one: '$count takelis',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skyrių',
      many: '$count skyriaus',
      few: '$count skyriai',
      one: '$count skyrius',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Gimė $date';
  }

  @override
  String died(String date) {
    return 'Mirė $date';
  }

  @override
  String age(int age) {
    return 'Amžius: $age';
  }

  @override
  String get showLess => 'Rodyti mažiau';

  @override
  String get readMore => 'Skaityti Daugiau';

  @override
  String get shuffle => 'Maišyti';

  @override
  String get shuffleAllMusic => 'Maišyti visą muziką';

  @override
  String get carSignInPrompt => 'Prisijunkite prie Moonfin telefone';

  @override
  String get carServerUnreachable => 'Nepavyksta pasiekti serverio';

  @override
  String downloadsCount(int count) {
    return 'Atsisiuntimų: $count';
  }

  @override
  String get perfectMatch => 'Tobulas atitikimas';

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
    return 'Nuotolinių subtitrų veiksmui „$action“ šiam naudotojui reikia Jellyfin subtitrų valdymo teisės.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Šio elemento serveryje rasti nepavyko, todėl nuotolinių subtitrų veiksmas „$action“ neįmanomas.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Nuotolinių subtitrų veiksmas „$action“ nepavyko: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Nuotolinių subtitrų veiksmas „$action“ nepavyko (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Nepavyko atlikti nuotolinių subtitrų veiksmo „$action“.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'visos atsisiųstos „$name“ serijos';
  }

  @override
  String get deleteSeasonFiles => 'visos atsisiųstos šio sezono serijos';

  @override
  String get stillWatching => 'Vis dar žiūrite?';

  @override
  String get unableToLoadTrailerStream => 'Nepavyko įkelti anonso srauto.';

  @override
  String get trailerTimedOut => 'Pakrovimo metu baigėsi priekabos laikas.';

  @override
  String get playbackFailedForTrailer => 'Nepavyko atkurti šio anonso.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Perdavimas nepasiekiamas atkuriant neprisijungus.';

  @override
  String castActionFailed(String label, String error) {
    return '$label veiksmas nepavyko: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Nepavyko nustatyti transliavimo garsumo: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label valdikliai';
  }

  @override
  String get deviceVolume => 'Įrenginio garsumas';

  @override
  String get unavailable => 'Nepasiekiamas';

  @override
  String get pause => 'Pauzė';

  @override
  String get syncPosition => 'Sinchronizavimo padėtis';

  @override
  String stopCast(String label) {
    return 'Sustabdyti $label';
  }

  @override
  String get queueIsEmpty => 'Eilė tuščia';

  @override
  String trackNumber(int number) {
    return '$number takelis';
  }

  @override
  String get remotePlayback => 'Nuotolinis atkūrimas';

  @override
  String get castingToGoogleCast => 'Perduodama į „Google Cast“.';

  @override
  String get castingViaAirPlay => 'Perdavimas per AirPlay';

  @override
  String get castingViaDlna => 'Perdavimas per DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sek.';
  }

  @override
  String get longPressToUnlock => 'Norėdami atrakinti, ilgai paspauskite';

  @override
  String get off => 'Išjungta';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automatinis';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Biudžeto srauto nepaisymas';

  @override
  String get audioDelay => 'Garso uždelsimas';

  @override
  String delayMinusMs(int value) {
    return '-$value ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+$value ms';
  }

  @override
  String get subtitleDelay => 'Subtitrų vėlavimas';

  @override
  String get reset => 'Atstatyti';

  @override
  String get unknown => 'Nežinoma';

  @override
  String get playbackInformation => 'Atkūrimo informacija';

  @override
  String get playback => 'Atkūrimas';

  @override
  String get playMethod => 'Žaidimo metodas';

  @override
  String get directPlay => 'Tiesioginis žaidimas';

  @override
  String get directStream => 'Tiesioginis srautas';

  @override
  String get transcoding => 'Perkodavimas';

  @override
  String get transcodeReasons => 'Perkodavimo priežastys';

  @override
  String get player => 'Grotuvas';

  @override
  String get container => 'Konteineris';

  @override
  String get bitrate => 'Bitų sparta';

  @override
  String get video => 'Vaizdo įrašas';

  @override
  String get resolution => 'Rezoliucija';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodekas';

  @override
  String get videoBitrate => 'Vaizdo įrašo pralaidumas';

  @override
  String get track => 'Takelis';

  @override
  String get channels => 'Kanalai';

  @override
  String get audioBitrate => 'Garso bitų dažnis';

  @override
  String get sampleRate => 'Mėginio dažnis';

  @override
  String get format => 'Formatas';

  @override
  String get external => 'Išorinis';

  @override
  String get embedded => 'Įdėta';

  @override
  String castSessionError(String protocol) {
    return '$protocol seanso klaida';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Nepavyko įkelti knygos informacijos: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB pateikimas programoje šioje platformoje dar nepasiekiamas.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Šis formatas (.$extension) programoje kol kas nerodomas.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Įterptasis dokumentų atvaizdavimas šioje platformoje nepasiekiamas.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nepavyko atidaryti išorinės peržiūros priemonės.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Nepavyko atidaryti programos skaityklės: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Žymė ties $label jau išsaugota.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Žymė pridėta: $label';
  }

  @override
  String get noBookmarksYet =>
      'Žymių dar nėra.\nSkaitydami bakstelėkite žymės piktogramą, kad išsaugotumėte savo poziciją.';

  @override
  String get noTableOfContentsAvailable => 'Nėra turinio';

  @override
  String pageLabel(int number) {
    return '$number psl.';
  }

  @override
  String get position => 'Padėtis';

  @override
  String get bookReader => 'Knygų skaitytuvas';

  @override
  String formatExtension(String extension) {
    return 'Formatas: .$extension';
  }

  @override
  String percentRead(String percent) {
    return 'Perskaityta $percent%';
  }

  @override
  String get updating => 'Atnaujinama...';

  @override
  String get markUnread => 'Pažymėti kaip neskaitytą';

  @override
  String get markAsRead => 'Pažymėti kaip skaitytą';

  @override
  String get reloadReader => 'Iš naujo įkelkite skaitytuvą';

  @override
  String get noPagesFound => 'Puslapių nerasta.';

  @override
  String get failedToDecodePageImage => 'Nepavyko iššifruoti puslapio vaizdo.';

  @override
  String resetZoom(String zoom) {
    return 'Atstatyti mastelį (${zoom}x)';
  }

  @override
  String get singlePage => 'Vienas puslapis';

  @override
  String get twoPageSpread => 'Dviejų puslapių sklaida';

  @override
  String get addBookmark => 'Pridėti žymę';

  @override
  String get bookmarksEllipsis => 'Žymės...';

  @override
  String get markedAsRead => 'Pažymėta kaip skaityta';

  @override
  String get markedAsUnread => 'Pažymėta kaip neskaityta';

  @override
  String failedToUpdateReadState(String error) {
    return 'Nepavyko atnaujinti skaitymo būsenos: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistema';

  @override
  String get themeLight => 'Tema: Šviesa';

  @override
  String get themeDark => 'Tema: Tamsus';

  @override
  String get themeSepia => 'Tema: Sepija';

  @override
  String get invertColorsFixedLayout =>
      'Invertuoti spalvas (fiksuotas išdėstymas)';

  @override
  String get invertColorsPdf => 'Invertuoti spalvas (PDF)';

  @override
  String get preparingInAppReader => 'Ruošiamas skaitytuvas programoje...';

  @override
  String get pdfDataNotAvailable => 'PDF duomenų nėra.';

  @override
  String get readerFallbackModeActive =>
      'Skaitytojo atsarginis režimas aktyvus';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ši platforma negali paleisti integruoto $extension failų dokumentų variklio.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Perjungę į palaikomą tikslinę platformą („Android“, „iOS“, „macOS“), naudokite „Reload Reader“.';

  @override
  String get openExternally => 'Atidaryti išoriškai';

  @override
  String get noEpubChaptersFound => 'EPUB skyrių nerasta.';

  @override
  String get readerNotReady => 'Skaitytojas nepasiruošęs.';

  @override
  String get seriesRecordings => 'Serialo įrašai';

  @override
  String get now => 'Dabar';

  @override
  String get sports => 'Sportas';

  @override
  String get news => 'Naujienos';

  @override
  String get kids => 'Vaikai';

  @override
  String get premiere => 'Premjera';

  @override
  String get guideTimeline => 'Vadovo laiko juosta';

  @override
  String failedToLoadGuide(String error) {
    return 'Nepavyko įkelti programų gido: $error';
  }

  @override
  String get noChannelsFound => 'Nerasta jokių kanalų';

  @override
  String get liveBadge => 'GYVAI';

  @override
  String guideNextProgram(String time, String title) {
    return 'Toliau: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Liko $minutes min.';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Liko $hours val.';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Liko $hours val. $minutes min.';
  }

  @override
  String get movie => 'Filmas';

  @override
  String get removedFromFavoriteChannels => 'Pašalinta iš mėgstamiausių kanalų';

  @override
  String get addedToFavoriteChannels => 'Pridėta prie mėgstamiausių kanalų';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Nepavyko atnaujinti mėgstamo kanalo';

  @override
  String get unfavoriteChannel => 'Nemėgstamas kanalas';

  @override
  String get favoriteChannel => 'Mėgstamiausias kanalas';

  @override
  String get record => 'Įrašyti';

  @override
  String get cancelRecordingAction => 'Atšaukti įrašymą';

  @override
  String get programSetToRecord => 'Laida suplanuota įrašyti';

  @override
  String get recordingCancelled => 'Įrašymas atšauktas';

  @override
  String get unableToCreateRecording => 'Nepavyko sukurti įrašo';

  @override
  String get watch => 'Žiūrėti';

  @override
  String get close => 'Uždaryti';

  @override
  String failedToPlayChannel(String name) {
    return 'Nepavyko paleisti $name';
  }

  @override
  String get failedToLoadRecordings => 'Nepavyko įkelti įrašų';

  @override
  String get scheduledInNext24Hours => 'Suplanuota per kitas 24 valandas';

  @override
  String get recentRecordings => 'Naujausi įrašai';

  @override
  String get tvSeries => 'TV serialas';

  @override
  String get failedToLoadSchedule => 'Nepavyko įkelti tvarkaraščio';

  @override
  String get noScheduledRecordings => 'Nėra suplanuotų įrašų';

  @override
  String get cancelRecording => 'Atšaukti įrašymą?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Atšaukti suplanuotą „$name“ įrašymą?';
  }

  @override
  String get no => 'Ne';

  @override
  String get yesCancel => 'Taip, atšaukti';

  @override
  String get failedToCancelRecording => 'Nepavyko atšaukti įrašymo';

  @override
  String get failedToLoadSeriesRecordings => 'Nepavyko įkelti serijų įrašų';

  @override
  String get noSeriesRecordings => 'Nėra serialų įrašų';

  @override
  String get cancelSeriesRecording => 'Atšaukti serijos įrašymą';

  @override
  String get cancelSeriesRecordingQuestion => 'Atšaukti serijos įrašymą?';

  @override
  String stopRecordingName(String name) {
    return 'Nutraukti „$name“ įrašymą?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nepavyko atšaukti serijos įrašymo';

  @override
  String get searchThisLibrary => 'Ieškoti šioje bibliotekoje...';

  @override
  String get searchEllipsis => 'Ieškoti...';

  @override
  String noResultsForQuery(String query) {
    return 'Nieko nerasta pagal „$query“';
  }

  @override
  String searchFailedError(String error) {
    return 'Paieška nepavyko: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr paskyros tipas';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Vietinis';

  @override
  String get savedMedia => 'Išsaugota laikmena';

  @override
  String get tvShows => 'TV laidos';

  @override
  String get music => 'Muzika';

  @override
  String get musicAlbums => 'Muzikos albumai';

  @override
  String get noMediaInFilter => 'Šiame filtre nėra medijos';

  @override
  String get noDownloadedMediaYet => 'Dar nėra atsisiųstų medijų';

  @override
  String get browseLibrary => 'Naršyti biblioteką';

  @override
  String get deleteDownload => 'Ištrinti atsisiuntimą';

  @override
  String removeItemAndFiles(String name) {
    return 'Pašalinti „$name“ ir susijusius failus?';
  }

  @override
  String tracksCount(int count) {
    return 'Takelių: $count';
  }

  @override
  String get album => 'Albumas';

  @override
  String get playAlbum => 'Leisti albumą';

  @override
  String failedToLoadAlbum(String error) {
    return 'Nepavyko įkelti albumo: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Atsisiųstų „$name“ takelių nerasta.';
  }

  @override
  String get season => 'Sezonas';

  @override
  String get errorLoadingEpisodes => 'Įkeliant serijas įvyko klaida';

  @override
  String get noDownloadedEpisodes => 'Nėra atsisiųstų serijų';

  @override
  String get deleteEpisode => 'Ištrinti seriją';

  @override
  String removeName(String name) {
    return 'Pašalinti „$name“?';
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
    return '$number serija';
  }

  @override
  String get seriesNotFound => 'Serija nerasta';

  @override
  String get errorLoadingSeries => 'Įkeliant seriją įvyko klaida';

  @override
  String get downloadedEpisodes => 'Atsisiųstos serijos';

  @override
  String seasonNumber(int number) {
    return '$number sezonas';
  }

  @override
  String seasonChip(int number) {
    return '$number sez.';
  }

  @override
  String get specials => 'Specialūs pasiūlymai';

  @override
  String get deleteSeason => 'Ištrinti sezoną';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Ištrinti visas atsisiųstas $season serijas?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serijų',
      many: '$count serijos',
      few: '$count serijos',
      one: '$count serija',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Sandėliavimo valdymas';

  @override
  String get storageBreakdown => 'Sandėliavimo suskirstymas';

  @override
  String get downloadedItems => 'Atsisiųstos prekės';

  @override
  String get storageLimit => 'Saugojimo limitas';

  @override
  String get noLimit => 'Nėra limito';

  @override
  String get deleteAllDownloads => 'Ištrinti visus atsisiuntimus';

  @override
  String get deleteAllDownloadsWarning =>
      'Tai pašalins visus atsisiųstus medijos failus ir veiksmo anuliuoti nebus galima.';

  @override
  String get deleteAll => 'Ištrinti viską';

  @override
  String get deleteSelected => 'Ištrinti pasirinktus';

  @override
  String deleteSelectedCount(int count) {
    return 'Ištrinti atsisiųstus elementus ($count)?';
  }

  @override
  String get musicAndAudiobooks => 'Muzika ir garso knygos';

  @override
  String get images => 'Vaizdai';

  @override
  String get database => 'Duomenų bazė';

  @override
  String ofStorageLimit(String limit) {
    return 'iš $limit limito';
  }

  @override
  String get settings => 'Nustatymai';

  @override
  String get authentication => 'Autentifikavimas';

  @override
  String get autoLoginServerManagement =>
      'Automatinis prisijungimas, serverio valdymas';

  @override
  String get pinCode => 'PIN kodas';

  @override
  String get setUpPinCodeProtection => 'Nustatykite PIN kodo apsaugą';

  @override
  String get parentalControls => 'Tėvų kontrolė';

  @override
  String get contentRatingRestrictions => 'Turinio įvertinimo apribojimai';

  @override
  String get bitRateResolutionBehavior =>
      'Bitų sparta, skiriamoji geba, elgesys';

  @override
  String get languageSizeAppearance => 'Kalba, dydis, išvaizda';

  @override
  String get qualityStorage => 'Kokybė, sandėliavimas';

  @override
  String get serverSyncAndPluginStatus =>
      'Serverio sinchronizavimas ir papildinio būsena';

  @override
  String get mediaRequestIntegration => 'Žiniasklaidos užklausų integravimas';

  @override
  String get switchServer => 'Perjungti serverį';

  @override
  String get signOut => 'Atsijungti';

  @override
  String get versionLicenses => 'Versija, licencijos';

  @override
  String get account => 'sąskaita';

  @override
  String get signInAndSecurity => 'Prisijungimas ir sauga';

  @override
  String get administration => 'Administravimas';

  @override
  String get serverSettingsUsersLibraries =>
      'Serverio nustatymai, vartotojai, bibliotekos';

  @override
  String get customization => 'Tinkinimas';

  @override
  String get themeAndLayout => 'Tema ir išdėstymas';

  @override
  String get videoAndSubtitles => 'Video ir subtitrai';

  @override
  String get integrations => 'Integracijos';

  @override
  String get pluginAndRequests => 'Papildinys ir užklausos';

  @override
  String get customizeAccountPlaybackInterface =>
      'Tinkinkite paskyros, atkūrimo ir sąsajos elgseną';

  @override
  String optionsCount(int count) {
    return 'Parinkčių: $count';
  }

  @override
  String get themeAndAppearance => 'Tema ir išvaizda';

  @override
  String get focusBorderColor => 'Fokusavimo kraštinės spalva';

  @override
  String get watchedIndicators => 'Stebimi rodikliai';

  @override
  String get always => 'Visada';

  @override
  String get hideUnwatched => 'Slėpti nežiūrėtus';

  @override
  String get episodesOnly => 'Tik epizodai';

  @override
  String get never => 'Niekada';

  @override
  String get focusExpansionAnimation => 'Fokuso išplėtimo animacija';

  @override
  String get desktopUiScale => 'Darbalaukio vartotojo sąsajos skalė';

  @override
  String get scaleFocusedCards =>
      'Pakeiskite sufokusuotų arba užvedančių kortelių ir plytelių mastelį';

  @override
  String get backgroundBackdrops => 'Fono fonai';

  @override
  String get showBackdropImages => 'Rodyti fono vaizdus už turinio';

  @override
  String get seriesThumbnails => 'Serijos miniatiūros';

  @override
  String get seriesThumbnailsDescription =>
      'Tik serijos: naudokite serijos iliustraciją, atitinkančią kiekvienos eilutės vaizdo tipą';

  @override
  String get homeRowInfoOverlay => 'Pradžios eilutės informacijos perdanga';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Rodyti pavadinimą ir metaduomenis naršant pagrindines eilutes';

  @override
  String get clockDisplay => 'Laikrodžio ekranas';

  @override
  String get inMenus => 'Meniu';

  @override
  String get inVideo => 'Vaizdo įraše';

  @override
  String get seasonalEffects => 'Sezoniniai efektai';

  @override
  String get seasonalEffectsDescription =>
      'Vizualiniai efektai ir sezoninės dekoracijos';

  @override
  String get snow => 'Sniegas';

  @override
  String get fireworks => 'Fejerverkai';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Krintantys lapai';

  @override
  String get themeMusic => 'Tema muzika';

  @override
  String get playThemeMusicOnDetailPages =>
      'Leiskite teminę muziką išsamios informacijos puslapiuose';

  @override
  String get themeMusicVolume => 'Tema Muzikos tomas';

  @override
  String get themeMusicSettingsSubtitle =>
      'Išsamios informacijos puslapiai, pradžios ekrano eilutės ir garsumas';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Teminė muzika „Home Rows“.';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Leisti naršant pagrindiniame ekrane';

  @override
  String get loopThemeMusic => 'Kartoti temos muziką';

  @override
  String get loopThemeMusicSubtitle =>
      'Kartoti takelį, o ne paleisti jį vieną kartą';

  @override
  String get detailsBackgroundBlur => 'Išsami informacija Fono suliejimas';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String pixelValue(int value) {
    return '$value px';
  }

  @override
  String get browsingBackgroundBlur => 'Naršymo fono suliejimas';

  @override
  String get maxStreamingBitrate => 'Maksimalus srauto pralaidumas';

  @override
  String get maxResolution => 'Maksimali raiška';

  @override
  String get playerZoomMode => 'Grotuvo mastelio keitimo režimas';

  @override
  String get settingsScrollWheelAction => 'Pelės slinkties ratukas';

  @override
  String get settingsScrollWheelActionDescription =>
      'Pasirinkite, ką atlieka pelės ratuko sukimas virš vaizdo įrašo atkūrimo metu.';

  @override
  String get scrollWheelActionOff => 'Išjungta';

  @override
  String get scrollWheelActionSeek => 'Peršokti (pirmyn / atgal)';

  @override
  String get scrollWheelActionVolume => 'Garsumas';

  @override
  String get playerTooltipVolume => 'Garsumas';

  @override
  String get fit => 'Tinka';

  @override
  String get autoCrop => 'Automatinis apkarpymas';

  @override
  String get stretch => 'Ištempti';

  @override
  String get refreshRateSwitching => 'Atnaujinimo dažnio perjungimas';

  @override
  String get disabled => 'Išjungta';

  @override
  String get scaleOnTv => 'Mastelis televizoriuje';

  @override
  String get scaleOnDevice => 'Įrenginio mastelis';

  @override
  String get trickPlay => 'Triukų žaidimas';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Ieškant rodyti peržiūros miniatiūras';

  @override
  String get showDescriptionOnPause => 'Rodyti aprašą pauzėje';

  @override
  String get dimVideoShowOverview =>
      'Pristabdydami pritemdykite vaizdo įrašą ir rodykite apžvalgos tekstą';

  @override
  String get osdLockButton => 'OSD užrakinimo mygtukas';

  @override
  String get osdLockButtonDescription =>
      'Rodyti užrakto mygtuką, kuris blokuoja liečiamą įvestį, kol ilgai paspaudžiamas';

  @override
  String get audioBehavior => 'Garso elgsena';

  @override
  String get downmixToStereo => 'Sumaišykite iki stereo';

  @override
  String get defaultAudioLanguage => 'Numatytoji garso kalba';

  @override
  String get fallbackAudioLanguage => 'Atsarginė garso takelio kalba';

  @override
  String get preferDefaultAudioTrack => 'Pirmenybė numatytajam garso takeliui';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Teikti pirmenybę originaliam garso takeliui, o ne lokalizuotam įgarsinimui.';

  @override
  String get preferAudioDescription =>
      'Pirmenybė garsinio vaizdavimo takeliams';

  @override
  String get preferAudioDescriptionDescription =>
      'Teikti pirmenybę garsinio vaizdavimo takeliams, o ne įprastiems.';

  @override
  String get transcodingAudio => 'Perkodavimas (garsas)';

  @override
  String get directStreamRemux => 'Tiesioginis srautas (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Perkodavimas (bitų sparta arba raiška)';

  @override
  String get transcodingVideoAndAudio => 'Perkodavimas (vaizdas ir garsas)';

  @override
  String get transcodingVideo => 'Perkodavimas (vaizdas)';

  @override
  String get autoServerDefault => 'Automatinis (numatytasis serveris)';

  @override
  String get english => 'anglų kalba';

  @override
  String get spanish => 'ispanų';

  @override
  String get french => 'prancūzų';

  @override
  String get german => 'vokiečių kalba';

  @override
  String get italian => 'italų';

  @override
  String get portuguese => 'portugalų';

  @override
  String get japanese => 'japonų';

  @override
  String get korean => 'korėjiečių';

  @override
  String get chinese => 'kinų';

  @override
  String get russian => 'rusų';

  @override
  String get arabic => 'arabų';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'olandų';

  @override
  String get swedish => 'švedų';

  @override
  String get norwegian => 'norvegų';

  @override
  String get danish => 'danų';

  @override
  String get finnish => 'suomių';

  @override
  String get polish => 'lenkų';

  @override
  String get ac3Passthrough => 'AC3 perėjimas';

  @override
  String get dtsPassthrough => 'DTS praėjimas';

  @override
  String get trueHdSupport => 'TrueHD palaikymas';

  @override
  String get enableDtsPassthrough =>
      'DTS garso bitų srautas tik į AVR; reikalingas imtuvo palaikymas ir DTS šaltinio takelis';

  @override
  String get enableTrueHdAudio =>
      'Įgalinti „TrueHD“ garsą (gali veikti ne visose platformose)';

  @override
  String get settingsAudioOutputMode => 'Garso išvesties režimas';

  @override
  String get settingsAudioOutputModeDescription =>
      'Pasirinkite, kaip dekoduojamas garsas. „AVR tiesioginis perdavimas“ siunčia neapdorotus Dolby / DTS srautus į imtuvą; „Automatinis“ arba „Sumaišymas“ dekoduoja vietoje.';

  @override
  String get settingsAudioOutputModeAvrPassthrough =>
      'AVR tiesioginis perdavimas';

  @override
  String get settingsAudioFallbackCodec => 'Atsarginis garso kodekas';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Pasirinkite formatą, į kurį bus perkoduojamas daugiakanalis garsas, kai šaltinio srauto negalima paleisti tiesiogiai ar perduoti be pakeitimų.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Aptikti automatiškai\n(rekomenduojama)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(numatytasis)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(be nuostolių)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(tik stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(efektyvus)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(be nuostolių)';

  @override
  String get settingsMaxAudioChannels => 'Daugiausia garso kanalų';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Nurodykite didžiausią garso sistemos kanalų skaičių. Šią ribą viršijantys daugiakanaliai srautai bus sumaišyti arba perkoduoti.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Aptikti automatiškai\n(įrangos numatytasis)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 erdvinis';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 kvadrofoninis';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 erdvinis';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 erdvinis';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 erdvinis';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 erdvinis';

  @override
  String get settingsAudioPassthroughAdvanced =>
      'Tiesioginis perdavimas (išplėstiniai)';

  @override
  String get settingsAudioCodecPassthrough => 'Kodekų tiesioginis perdavimas';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Įjunkite tik tuos formatus, kuriuos palaiko jūsų AVR arba HDMI imtuvas.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 tiesioginis perdavimas';

  @override
  String get settingsAudioEac3JocPassthrough =>
      'EAC3 JOC (Atmos) tiesioginis perdavimas';

  @override
  String get settingsAudioDtsCorePassthrough =>
      'DTS Core tiesioginis perdavimas';

  @override
  String get settingsAudioDtsHdPassthrough =>
      'DTS-HD MA tiesioginis perdavimas';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD tiesioginis perdavimas';

  @override
  String get settingsAudioTrueHdAtmosPassthrough =>
      'TrueHD Atmos tiesioginis perdavimas';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Perduoti Dolby Digital Plus (EAC3) bitų srautą į išorinį dekoderį.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Perduoti Dolby Atmos per EAC3 (JOC) bitų srautą į išorinį dekoderį.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Perduoti DTS-HD MA (įskaitant DTS Core) bitų srautą į išorinį dekoderį.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Perduoti Dolby TrueHD su Atmos metaduomenimis bitų srautą į išorinį dekoderį.';

  @override
  String get settingsDetectedAudioCapabilities => 'Aptiktos garso galimybės';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Vykdymo aplinkos galimybių momentinė kopija dar nepasiekiama.';

  @override
  String get settingsAudioRouteLabel => 'Maršrutas';

  @override
  String get settingsAudioDecodeLabel => 'Dekodavimas';

  @override
  String get settingsAudioPassthroughLabel => 'Tiesioginis perdavimas';

  @override
  String get settingsAudioHdRoute => 'HD garso maršrutas';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Garsiakalbis';

  @override
  String get settingsAudioRouteHeadphones => 'Ausinės';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostika';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Vaizdo lygis';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Vaizdo diapazonas';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Subtitrų kodekas';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Leidžiami garso kodekai';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS garso kodekai';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 garso kodekai';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif tiesioginis perdavimas';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Aktyvus garso maršrutas';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Maršruto HD garso palaikymas';

  @override
  String get nightMode => 'Naktinis režimas';

  @override
  String get compressDynamicRange => 'Suspausti dinaminį diapazoną';

  @override
  String get advancedMpv => 'Išplėstinė mpv';

  @override
  String get enableCustomMpvConf => 'Įgalinti tinkintą mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Prieš pradėdami atkūrimą, pritaikykite vartotojo nurodytą mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => 'Nesaugios išplėstinės mpv parinktys';

  @override
  String get unsafeMpvOptionsDescription =>
      'Leisti platesnį mpv parinkčių rinkinį. Gali sutrikdyti atkūrimo elgesį.';

  @override
  String get hardwareDecoding => 'Aparatinės įrangos dekodavimas';

  @override
  String get hardwareDecodingSubtitle =>
      'Gali pagerinti našumą, bet kai kuriuose įrenginiuose gali kilti atkūrimo problemų.';

  @override
  String get nextUpAndQueuing => 'Kitas ir eilėje';

  @override
  String get nextUpDisplay => 'Kitas ekranas';

  @override
  String get extended => 'Prailgintas';

  @override
  String get minimal => 'Minimalus';

  @override
  String get nextUpTimeout => 'Kitas skirtasis laikas';

  @override
  String secondsValue(int value) {
    return '$value s';
  }

  @override
  String get mediaQueuing => 'Medijos eilė';

  @override
  String get autoQueueNextEpisodes => 'Automatiškai įrašyti kitų serijų eilę';

  @override
  String get stillWatchingPrompt => 'Vis dar žiūriu raginimą';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Po $episodes serijų / $hours val.';
  }

  @override
  String get resumeAndSkip => 'Tęsti ir praleisti';

  @override
  String get resumeRewind => 'Tęsti atsukimą';

  @override
  String get unpauseRewind => 'Atšaukti atsukimo pristabdymą';

  @override
  String get fiveSeconds => '5 sekundes';

  @override
  String get tenSeconds => '10 sekundžių';

  @override
  String get fifteenSeconds => '15 sekundžių';

  @override
  String get thirtySeconds => '30 sekundžių';

  @override
  String get skipBackLength => 'Praleisti atgal ilgį';

  @override
  String get skipForwardLength => 'Praleisti ilgį pirmyn';

  @override
  String get customMpvConfPath => 'Pasirinktinis mpv.conf kelias';

  @override
  String get notSetMpvConf =>
      'Nenustatyta. „Moonfin“ išbandys numatytąjį mpv.conf failą programų / duomenų aplankuose.';

  @override
  String get selectMpvConf => 'Pasirinkite mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stiliaus nustatymai (dydis, spalva, poslinkis) taikomi tekstiniams subtitrams (SRT, VTT, TTML). ASS / SSA subtitrai naudoja savo įterptą stilių, nebent „ASS/SSA Direct Play“ išjungtas. Bitmap subtitrų (PGS, DVB, VobSub) pakeisti negalima.';

  @override
  String get defaultSubtitleLanguage => 'Numatytoji subtitrų kalba';

  @override
  String get defaultToNoSubtitles =>
      'Pagal numatytuosius nustatymus subtitrų nėra';

  @override
  String get turnOffSubtitlesByDefault =>
      'Išjunkite subtitrus pagal numatytuosius nustatymus';

  @override
  String get subtitleSize => 'Subtitrų dydis';

  @override
  String get textFillColor => 'Teksto užpildymo spalva';

  @override
  String get backgroundColor => 'Fono spalva';

  @override
  String get textStrokeColor => 'Teksto potėpio spalva';

  @override
  String get subtitleCustomization => 'Subtitrų pritaikymas';

  @override
  String get subtitleCustomizationDescription => 'Tinkinkite subtitrų išvaizdą';

  @override
  String get subtitleMode => 'Subtitrų režimas';

  @override
  String get subtitleModeFlagged => 'Pažymėti';

  @override
  String get subtitleModeAlways => 'Visada';

  @override
  String get subtitleModeForeign => 'Užsienio kalba';

  @override
  String get subtitleModeForced => 'Priverstiniai';

  @override
  String get subtitleModeFlaggedDescription =>
      'Rodo takelius, kurie medijos failo metaduomenyse pažymėti kaip „default“ arba „forced“.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Automatiškai įkelia ir rodo subtitrus kaskart, kai pradedamas vaizdo įrašas.';

  @override
  String get subtitleModeForeignDescription =>
      'Automatiškai įjungia subtitrus, jei numatytasis garso takelis yra užsienio kalba.';

  @override
  String get subtitleModeForcedDescription =>
      'Įkelia tik subtitrus, aiškiai pažymėtus „forced“ metaduomenų žyme.';

  @override
  String get subtitleModeNoneDescription =>
      'Visiškai išjungia automatinį subtitrų įkėlimą.';

  @override
  String get fallbackSubtitleLanguage => 'Atsarginė subtitrų kalba';

  @override
  String get subtitleStream => 'Subtitrų srautas';

  @override
  String get subtitlePreviewText =>
      'Greita rudoji lapė peršoka per tinginį šunį';

  @override
  String get verticalOffset => 'Vertikalus poslinkis';

  @override
  String get pgsDirectPlay => 'PGS tiesioginis žaidimas';

  @override
  String get directPlayPgsSubtitles => 'Tiesioginis PGS subtitrai';

  @override
  String get assSsaDirectPlay => 'ASS/SSA tiesioginis paleidimas';

  @override
  String get directPlayAssSsaSubtitles =>
      'Tiesioginis ASS/SSA subtitrų paleidimas';

  @override
  String get white => 'Baltas';

  @override
  String get black => 'Juoda';

  @override
  String get yellow => 'Geltona';

  @override
  String get green => 'Žalia';

  @override
  String get cyan => 'Žydra spalva';

  @override
  String get red => 'Raudona';

  @override
  String get transparent => 'Skaidrus';

  @override
  String get semiTransparentBlack => 'Pusiau permatomas juodas';

  @override
  String get global => 'Pasaulinis';

  @override
  String get desktop => 'Darbalaukis';

  @override
  String get mobile => 'Mobilusis';

  @override
  String get tv => 'televizorius';

  @override
  String loadedProfileSettings(String profile) {
    return 'Įkelti $profile profilio nustatymai.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nepavyko įkelti $profile profilio nustatymų.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Vietiniai nustatymai sinchronizuoti su $profile profiliu.';
  }

  @override
  String get customizationProfile => 'Tinkinimo profilis';

  @override
  String get customizationProfileDescription =>
      'Pasirinkite profilį, kurį norite įkelti, redaguoti ir sinchronizuoti. Visuotinis taikomas visur, nebent įrenginio profilis jo nepaiso. Žalias taškas žymi dabartinį įrenginio profilį.';

  @override
  String get loadProfile => 'Įkelti profilį';

  @override
  String get syncing => 'Sinchronizuojama...';

  @override
  String get syncToProfile => 'Sinchronizuoti su profiliu';

  @override
  String get profileSyncHidden => 'Profilio sinchronizavimas paslėptas';

  @override
  String get enablePluginSyncDescription =>
      'Papildinio nustatymuose įgalinkite serverio papildinio sinchronizavimą, kad čia būtų rodomi profilio valdikliai.';

  @override
  String get quality => 'Kokybė';

  @override
  String get defaultDownloadQuality => 'Numatytoji atsisiuntimo kokybė';

  @override
  String get network => 'Tinklas';

  @override
  String get wifiOnlyDownloads => 'Atsisiuntimai tik per WiFi';

  @override
  String get reportDownloadsActivity => 'Rodyti atsisiuntimus serveryje';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Leisti serverio administratoriui matyti jūsų perkoduotus atsisiuntimus valdymo skydelyje';

  @override
  String get onlyDownloadOnWifi => 'Atsisiųskite tik prisijungę prie „WiFi“.';

  @override
  String get storage => 'Sandėliavimas';

  @override
  String get storageUsed => 'Naudota saugykla';

  @override
  String get manage => 'Tvarkyti';

  @override
  String get calculating => 'Skaičiuojama...';

  @override
  String get downloadLocation => 'Atsisiuntimo vieta';

  @override
  String get defaultLabel => 'Numatytoji';

  @override
  String get saveToDownloadsFolder => 'Išsaugoti atsisiuntimų aplanke';

  @override
  String get downloadsVisibleToOtherApps =>
      'Atsisiuntimai / Moonfin – matoma kitoms programoms';

  @override
  String get dangerZone => 'Pavojaus zona';

  @override
  String get clearAllDownloads => 'Išvalyti visus atsisiuntimus';

  @override
  String get original => 'Originalus';

  @override
  String get changeDownloadLocation => 'Keisti atsisiuntimo vietą';

  @override
  String get changeDownloadLocationDescription =>
      'Nauji atsisiuntimai bus išsaugoti pasirinktame aplanke. Esami atsisiuntimai liks dabartinėje vietoje ir gali būti tvarkomi iš saugyklos nustatymų.';

  @override
  String get confirm => 'Patvirtinti';

  @override
  String get cannotWriteToFolder =>
      'Neįmanoma įrašyti į pasirinktą aplanką. Pasirinkite kitą vietą arba suteikite saugyklos leidimus.';

  @override
  String get saveToDownloadsFolderQuestion => 'Išsaugoti atsisiuntimų aplanke?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Atsisiųsta medija bus išsaugota jūsų įrenginio aplanke „Atsisiuntimai/Moonfin“. Šiuos failus matys kitos programos, pvz., galerija ar muzikos grotuvas.\n\nEsami atsisiuntimai liks dabartinėje vietoje.';

  @override
  String get enable => 'Įgalinti';

  @override
  String get clearAllDownloadsWarning =>
      'Taip bus ištrinta visa atsisiųsta medija ir veiksmo anuliuoti negalima.';

  @override
  String get clearAll => 'Išvalyti viską';

  @override
  String get navigationStyle => 'Navigacijos stilius';

  @override
  String get topBar => 'Viršutinė juosta';

  @override
  String get leftSidebar => 'Kairioji šoninė juosta';

  @override
  String get showShuffleButton => 'Rodyti maišymo mygtuką';

  @override
  String get showGenresButton => 'Mygtukas Rodyti žanrus';

  @override
  String get showFavoritesButton => 'Rodyti mėgstamiausių mygtuką';

  @override
  String get showLibrariesInToolbar => 'Rodyti bibliotekas įrankių juostoje';

  @override
  String get navbarAlwaysExpanded =>
      'Visada rodyti naršymo juostos pavadinimus';

  @override
  String get showSeerrButton => 'Rodyti Seerr mygtuką';

  @override
  String get navbarOpacity => 'Navigacijos juostos neskaidrumas';

  @override
  String get navbarColor => 'Navigacijos juostos spalva';

  @override
  String get gray => 'Pilka';

  @override
  String get darkBlue => 'Tamsiai Mėlyna';

  @override
  String get purple => 'Violetinė';

  @override
  String get teal => 'žalsvai mėlyna';

  @override
  String get navy => 'Tamsiai mėlyna';

  @override
  String get charcoal => 'Anglis';

  @override
  String get brown => 'Ruda';

  @override
  String get darkRed => 'Tamsiai Raudona';

  @override
  String get darkGreen => 'Tamsiai žalia';

  @override
  String get slate => 'Šiferis';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Bibliotekos ekranas';

  @override
  String get posterLabel => 'Plakatas';

  @override
  String get thumbnailLabel => 'Miniatiūra';

  @override
  String get bannerLabel => 'Reklamjuostė';

  @override
  String get overridePerLibrarySettings => 'Nepaisyti bibliotekos nustatymų';

  @override
  String get applyImageTypeToAllLibraries =>
      'Taikyti vaizdo tipą visoms bibliotekoms';

  @override
  String get multiServerLibraries => 'Kelių serverių bibliotekos';

  @override
  String get showLibrariesFromAllServers =>
      'Rodyti visų prijungtų serverių bibliotekas';

  @override
  String get enableFolderView => 'Įgalinti aplanko rodinį';

  @override
  String get showFolderBrowsingOption => 'Rodyti aplanko naršymo parinktį';

  @override
  String get groupItemsIntoCollections => 'Grupuoti elementus į rinkinius';

  @override
  String get hideCollectionAssociatedItems =>
      'Naršant bibliotekas slėpti su rinkiniais susietus bibliotekos elementus';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Pranešimas apie bibliotekos grupavimą';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Kad galėtumėte naudoti šį nustatymą, savo Jellyfin arba Emby serveryje, bibliotekos rodymo nustatymuose, įjunkite bibliotekos parinktį „Grupuoti filmus į rinkinius“ ir (arba) „Grupuoti serialus į rinkinius“.';

  @override
  String get libraryVisibility => 'Bibliotekos matomumas';

  @override
  String get libraryVisibilityDescription =>
      'Perjungti pagrindinio puslapio matomumą pagal biblioteką. Iš naujo paleiskite „Moonfin“, kad pakeitimai įsigaliotų.';

  @override
  String get showInNavigation => 'Rodyti navigacijoje';

  @override
  String get showInLatestMedia => 'Rodyti naujausioje žiniasklaidoje';

  @override
  String get sourceLibraries => 'Šaltinių bibliotekos';

  @override
  String get sourceCollections => 'Šaltinių rinkiniai';

  @override
  String get excludedGenres => 'Išskirti žanrai';

  @override
  String get selectAll => 'Pasirinkite Viskas';

  @override
  String itemsSelected(int count) {
    return 'Pasirinkta: $count';
  }

  @override
  String get mediaBar => 'Medijos juosta';

  @override
  String get mediaSources => 'Žiniasklaidos šaltiniai';

  @override
  String get behavior => 'Elgesys';

  @override
  String get seconds => 'sekundžių';

  @override
  String get localPreviews => 'Vietinės peržiūros';

  @override
  String get localPreviewsDescription =>
      'Konfigūruokite anonsą, mediją ir garso peržiūras.';

  @override
  String get mediaBarMode => 'Medijos juostos stilius';

  @override
  String get mediaBarModeDescription =>
      'Pasirinkite iš įvairių medijos juostos stilių arba išjunkite medijos juostą';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Išjungta';

  @override
  String get enableMediaBar => 'Įgalinti medijos juostą';

  @override
  String get showFeaturedContentSlideshow =>
      'Rodyti siūlomo turinio skaidrių demonstraciją pagrindiniame puslapyje';

  @override
  String get contentType => 'Turinio tipas';

  @override
  String get moviesAndTvShows => 'Filmai ir TV laidos';

  @override
  String get moviesOnly => 'Tik filmai';

  @override
  String get tvShowsOnly => 'Tik televizijos laidos';

  @override
  String get itemCount => 'Prekių skaičius';

  @override
  String get noneSelected => 'Nepasirinkta nė vieno';

  @override
  String get noneExcluded => 'Nė vienas neįtrauktas';

  @override
  String get autoAdvance => 'Automatinis perėjimas';

  @override
  String get autoAdvanceSlides => 'Automatiškai pereiti prie kitos skaidrės';

  @override
  String get autoAdvanceInterval => 'Automatinio perėjimo intervalas';

  @override
  String get trailerPreview => 'Anonso peržiūra';

  @override
  String get autoPlayTrailers =>
      'Automatiškai paleiskite anonsus medijos juostoje po 3 sekundžių';

  @override
  String get trailerAudio => 'Anonsų garsas';

  @override
  String get enableTrailerAudio => 'Įjungti anonsų garsą medijos juostoje';

  @override
  String get episodePreview => 'Epizodo peržiūra';

  @override
  String get mediaPreview => 'Medijos peržiūra';

  @override
  String get episodePreviewDescription =>
      'Žaiskite 30 sekundžių eilutę sufokusuotomis, užvedus pelės žymeklį arba ilgai paspaustomis kortomis';

  @override
  String get mediaPreviewDescription =>
      'Žaiskite 30 sekundžių eilutę sufokusuotomis, užvedus pelės žymeklį arba ilgai paspaustomis kortomis';

  @override
  String get previewAudio => 'Garso peržiūra';

  @override
  String get enablePreviewAudio => 'Įgalinti anonso ir serijos peržiūrų garsą';

  @override
  String get latestMedia => 'Naujausia žiniasklaida';

  @override
  String get recentlyReleased => 'Neseniai Išleistas';

  @override
  String get myMedia => 'Mano žiniasklaida';

  @override
  String get myMediaSmall => 'Mano laikmena (maža)';

  @override
  String get continueWatching => 'Žiūrėti toliau';

  @override
  String get resumeAudio => 'Tęsti garsą';

  @override
  String get resumeBooks => 'Tęsti knygas';

  @override
  String get activeRecordings => 'Aktyvūs įrašai';

  @override
  String get playlists => 'Grojaraščiai';

  @override
  String get liveTV => 'Tiesioginė televizija';

  @override
  String get homeSections => 'Pagrindinis skyrius';

  @override
  String get resetToDefaults => 'Atstatyti į numatytuosius nustatymus';

  @override
  String get homeRowPosterSize => 'Namų eilutės plakato dydis';

  @override
  String get perRowImageTypeSelection =>
      'Vaizdo tipo pasirinkimas pagal eilutę';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigūruokite vaizdo tipą kiekvienai įgalintai pagrindinei eilutei';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Sujunkite Tęsti žiūrėjimą ir Kitas';

  @override
  String get combineBothRows => 'Sujunkite abi eilutes į vieną namų skyrių';

  @override
  String get fullScreenRows => 'Išplėstos pradžios ekrano eilutės';

  @override
  String get fullScreenRowsDescription =>
      'Rodyti tik po vieną pradžios ekrano eilutę';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Eilutės vaizdo tipas';

  @override
  String get perRowSettings => 'Eilučių nustatymai';

  @override
  String get autoLogin => 'Automatinis prisijungimas';

  @override
  String get lastUser => 'Paskutinis vartotojas';

  @override
  String get currentUser => 'Dabartinis naudotojas';

  @override
  String get alwaysAuthenticate => 'Visada autentifikuoti';

  @override
  String get requirePasswordWithToken =>
      'Reikalauti slaptažodžio, net jei yra išsaugotas prieigos raktas';

  @override
  String get confirmExit => 'Patvirtinkite išėjimą';

  @override
  String get showConfirmationBeforeExiting =>
      'Prieš išeidami parodykite patvirtinimą';

  @override
  String get blockContentWithRatings =>
      'Blokuoti turinį su šiais įvertinimais:';

  @override
  String get noContentRatingsFound =>
      'Šiame serveryje dar nerasta jokių turinio įvertinimų.';

  @override
  String get couldNotLoadServerRatings =>
      'Nepavyko įkelti serverio įvertinimų. Rodomi tik išsaugoti įvertinimai.';

  @override
  String get couldNotRefreshRatings =>
      'Nepavyko atnaujinti įvertinimų iš serverio. Rodomi išsaugoti įvertinimai.';

  @override
  String get enablePinCode => 'Įjungti PIN kodą';

  @override
  String get requirePinToAccess =>
      'Reikalauti PIN kodo, kad galėtumėte pasiekti paskyrą';

  @override
  String get changePin => 'Pakeiskite PIN kodą';

  @override
  String get setNewPinCode => 'Nustatykite naują PIN kodą';

  @override
  String get removePin => 'Pašalinti PIN kodą';

  @override
  String get removePinProtection => 'Pašalinkite PIN kodo apsaugą';

  @override
  String get screensaver => 'Ekrano užsklanda';

  @override
  String get inAppScreensaver => 'Ekrano užsklanda programoje';

  @override
  String get enableBuiltInScreensaver => 'Įjunkite įmontuotą ekrano užsklandą';

  @override
  String get mode => 'Režimas';

  @override
  String get libraryArt => 'Bibliotekos str';

  @override
  String get logo => 'Logotipas';

  @override
  String get clock => 'Laikrodis';

  @override
  String get timeout => 'Skirtasis laikas';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Pritemdymo lygis';

  @override
  String get maxAgeRating => 'Maksimalus amžiaus įvertinimas';

  @override
  String get any => 'Bet koks';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Reikalauti amžiaus cenzo';

  @override
  String get onlyShowRatedContent => 'Rodyti tik įvertintą turinį';

  @override
  String get showClock => 'Rodyti laikrodį';

  @override
  String get displayClockDuringScreensaver =>
      'Rodyti laikrodį ekrano užsklandos metu';

  @override
  String get clockModeStatic => 'Statiškas';

  @override
  String get clockModeBouncing => 'Šokinėjantis';

  @override
  String get rottenTomatoesCritics => 'Supuvę pomidorai (kritikai)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (auditorija)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritiškas';

  @override
  String get metacriticUser => 'Metacritic (vartotojas)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Pašto dėžutė';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Bendruomenės įvertinimas';

  @override
  String get ratings => 'Įvertinimai';

  @override
  String get additionalRatings => 'Papildomi įvertinimai';

  @override
  String get showMdbListAndTmdbRatings => 'Rodyti MDBList ir TMDB įvertinimus';

  @override
  String get ratingLabels => 'Įvertinimo etiketės';

  @override
  String get showLabelsNextToIcons =>
      'Rodyti etiketes šalia įvertinimo piktogramų';

  @override
  String get ratingBadges => 'Įvertinimo ženkleliai';

  @override
  String get showDecorativeBadges =>
      'Rodyti dekoratyvinius ženklelius už įvertinimų';

  @override
  String get episodeRatings => 'Epizodų įvertinimai';

  @override
  String get showRatingsOnEpisodes => 'Rodyti atskirų serijų įvertinimus';

  @override
  String get ratingSources => 'Įvertinimo šaltiniai';

  @override
  String get ratingSourcesDescription =>
      'Įgalinkite ir pertvarkykite įvertinimo šaltinius, rodomus visoje programoje';

  @override
  String get pluginLabel => 'Moonbase papildinys';

  @override
  String get pluginDetected => 'Papildinys aptiktas';

  @override
  String get pluginNotDetected => 'Papildinys neaptiktas';

  @override
  String get pluginDetectedDescription =>
      'Aptiktas serverio papildinys. Sinchronizavimas įjungiamas automatiškai, kai pirmą kartą randamas papildinys.';

  @override
  String get pluginNotDetectedDescription =>
      'Serverio papildinys šiuo metu neaptiktas. Vietiniai nustatymai vis tiek naudoja išsaugotas vertes arba įtaisytuosius numatytuosius nustatymus.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersija: $version';
  }

  @override
  String get availableServices => 'Galimos paslaugos';

  @override
  String get serverPluginSync => 'Serverio papildinio sinchronizavimas';

  @override
  String get syncSettingsWithPlugin =>
      'Sinchronizuoti nustatymus su serverio papildiniu';

  @override
  String get whatSyncControls => 'Kokie sinchronizavimo valdikliai';

  @override
  String get syncControlsDescription =>
      'Sinchronizavimas tik valdo, ar papildinio palaikomi nustatymai siunčiami į serverį ir ištraukiami iš jo. Profilio pasirinkimas ir profilio sinchronizavimo veiksmai yra tinkinimo nustatymuose, kai įgalintas papildinio sinchronizavimas.';

  @override
  String get recentRequests => 'Naujausi prašymai';

  @override
  String get recentlyAdded => 'Neseniai pridėta';

  @override
  String get trending => 'Tendencijos';

  @override
  String get popularMovies => 'Populiarūs filmai';

  @override
  String get movieGenres => 'Filmų žanrai';

  @override
  String get upcomingMovies => 'Būsimi filmai';

  @override
  String get studios => 'Studijos';

  @override
  String get popularSeries => 'Populiari serija';

  @override
  String get seriesGenres => 'Serialo žanrai';

  @override
  String get upcomingSeries => 'Būsimas serialas';

  @override
  String get networks => 'Tinklai';

  @override
  String get seerrDiscoveryRows => 'Seerr atradimų eilutės';

  @override
  String get resetRowsToDefaults =>
      'Iš naujo nustatyti eilutes į numatytuosius nustatymus';

  @override
  String get enableSeerr => 'Įgalinti Seerr';

  @override
  String get showSeerrInNavigation =>
      'Rodyti Seerr navigacijoje (reikalingas serverio papildinys)';

  @override
  String get seerrUnavailable =>
      'Nepasiekiamas, nes serverio papildinio Seerr palaikymas išjungtas.';

  @override
  String get nsfwFilter => 'NSFW filtras';

  @override
  String get hideAdultContent =>
      'Slėpti suaugusiesiems skirtą turinį rezultatuose';

  @override
  String get seerrNotificationsSection => 'Pranešimai';

  @override
  String get seerrNotifyNewRequestsTitle => 'Pranešimai apie naujas užklausas';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Pranešti, kai kas nors pateikia užklausą';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Užklausų naujienos';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Patvirtinta, atmesta ir įtraukta į jūsų biblioteką';

  @override
  String get seerrNotifyIssuesTitle => 'Problemų naujienos';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Naujos problemos, atsakymai ir sprendimai';

  @override
  String loggedInAs(String username) {
    return 'Prisijungta kaip: $username';
  }

  @override
  String get discoverRows => 'Seerr atradimų puslapis';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Įjunkite eilutes, kurias norite matyti Seerr pagrindiniame puslapyje. Vilkite, kad pertvarkytumėte. Pasirinktinė tvarka sinchronizuojama su Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Įjunkite eilutes, kurias norite matyti Seerr pagrindiniame puslapyje. Vilkite, kad pertvarkytumėte. Pasirinktinė tvarka sinchronizuojama su Moonbase.';

  @override
  String get enabled => 'Įjungta';

  @override
  String get hidden => 'Paslėpta';

  @override
  String get aboutTitle => 'Apie';

  @override
  String versionValue(String version) {
    return '$version versija';
  }

  @override
  String get openSourceLicenses => 'Atvirojo kodo licencijos';

  @override
  String get sourceCode => 'Šaltinio kodas';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Patikrinkite, ar nėra atnaujinimų dabar';

  @override
  String get checksLatestDesktopRelease =>
      'Tikrina naujausią šios platformos darbalaukio leidimą';

  @override
  String get youAreUpToDate => 'Jūs esate atnaujintas.';

  @override
  String get couldNotCheckForUpdates =>
      'Šiuo metu nepavyko patikrinti, ar yra naujinimų.';

  @override
  String get noCompatibleUpdate =>
      'Nerasta šiai platformai suderinamo naujinimo paketo.';

  @override
  String get updateChecksNotSupported =>
      'Atnaujinimo patikrinimai šioje platformoje nepalaikomi.';

  @override
  String get updateNotificationsDisabled =>
      'Pranešimai apie atnaujinimus išjungti.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Palaukite prieš tikrindami dar kartą.';

  @override
  String get latestUpdateAlreadyShown =>
      'Paskutinis atnaujinimas jau buvo parodytas.';

  @override
  String get updateAvailable => 'Galimas atnaujinimas.';

  @override
  String updateAvailableVersion(String version) {
    return 'Galimas naujinys: v$version';
  }

  @override
  String get updateNotifications => 'Atnaujinti pranešimus';

  @override
  String get showWhenUpdatesAvailable => 'Rodyti, kada yra naujinių';

  @override
  String updateAvailableTitle(String version) {
    return 'Galima v$version';
  }

  @override
  String get readReleaseNotes => 'Perskaitykite leidimo pastabas';

  @override
  String get downloadingUpdate => 'Atsisiunčiamas naujinys...';

  @override
  String get updateDownloadFailed =>
      'Nepavyko atsisiųsti naujinimo. Bandykite dar kartą.';

  @override
  String get openReleasesPage => 'Atidarykite leidimų puslapį';

  @override
  String get navigation => 'Navigacija';

  @override
  String get watchedIndicatorsBackdrops => 'Stebėti indikatoriai, fonai';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokusavimo spalva, stebimi indikatoriai, fonai';

  @override
  String get navbarStyleToolbarAppearance =>
      'Naršymo juostos stilius, įrankių juostos mygtukai, išvaizda';

  @override
  String get reorderToggleHomeRows =>
      'Pertvarkyti ir perjungti pagrindines eilutes';

  @override
  String get featuredContentAppearance => 'Teminis turinys, išvaizda';

  @override
  String get posterSizeImageTypeFolderView =>
      'Plakato dydis, vaizdo tipas, aplanko vaizdas';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB ir reitingų šaltiniai';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Vaizdų talpyklos limitas';

  @override
  String get clearImageCache => 'Išvalyti vaizdų talpyklą';

  @override
  String get imageCacheCleared => 'Vaizdų talpykla išvalyta';

  @override
  String get clear => 'Išvalyti';

  @override
  String get browse => 'Naršyti';

  @override
  String get noResults => 'Jokių rezultatų';

  @override
  String get seerrAvailableStatus => 'Galima';

  @override
  String get seerrRequestedStatus => 'Paprašyta';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Atsisiunčiama · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importuojama';

  @override
  String itemsCount(int count) {
    return 'Elementų: $count';
  }

  @override
  String get seerrSettings => 'Seerr nustatymai';

  @override
  String get requestMore => 'Prašyti daugiau';

  @override
  String get request => 'Prašymas';

  @override
  String get cancelRequest => 'Atšaukti užklausą';

  @override
  String get playInMoonfin => 'Žaisk „Moonfin“.';

  @override
  String requestedByName(String name) {
    return 'Užklausą pateikė $name';
  }

  @override
  String get approve => 'Patvirtinti';

  @override
  String get declineAction => 'Atmesti';

  @override
  String get similar => 'Panašus';

  @override
  String get recommendations => 'Rekomendacijos';

  @override
  String cancelRequestForTitle(String title) {
    return 'Atšaukti „$title“ užklausą?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Atšaukti „$title“ užklausas ($count)?';
  }

  @override
  String get keep => 'Laikyti';

  @override
  String get itemNotFoundInLibrary =>
      'Elementas nerastas jūsų Moonfin bibliotekoje';

  @override
  String get errorSearchingLibrary => 'Klaida ieškant bibliotekoje';

  @override
  String budgetAmount(String amount) {
    return 'Biudžetas: $amount \$';
  }

  @override
  String revenueAmount(String amount) {
    return 'Pajamos: $amount \$';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Pateikti $type užklausą';
  }

  @override
  String get submitRequest => 'Pateikti užklausą';

  @override
  String get allSeasons => 'Visi sezonai';

  @override
  String get advancedOptions => 'Išplėstinės parinktys';

  @override
  String get noServiceServersConfigured =>
      'Paslaugų serveriai nesukonfigūruoti';

  @override
  String get server => 'Serveris';

  @override
  String get qualityProfile => 'Kokybės profilis';

  @override
  String get rootFolder => 'Šakninis aplankas';

  @override
  String get showMore => 'Rodyti daugiau';

  @override
  String get appearances => 'Filmografija';

  @override
  String get crewSection => 'Įgula';

  @override
  String ageValue(int age) {
    return 'amžius $age';
  }

  @override
  String get noRequests => 'Jokių prašymų';

  @override
  String get pendingStatus => 'Laukiama';

  @override
  String get declinedStatus => 'Atmesta';

  @override
  String get partiallyAvailable => 'Iš dalies prieinamas';

  @override
  String get downloadingStatus => 'Atsisiunčiama';

  @override
  String get approvedStatus => 'Patvirtinta';

  @override
  String get notRequestedStatus => 'Neprašoma';

  @override
  String get blocklistedStatus => 'Įtrauktas į blokų sąrašą';

  @override
  String get deletedStatus => 'Ištrinta';

  @override
  String get failedStatus => 'Nepavyko';

  @override
  String get processingStatus => 'Apdorojama';

  @override
  String modifiedByName(String name) {
    return 'Pakeitė $name';
  }

  @override
  String get completedStatus => 'Užbaigta';

  @override
  String get requestErrorDuplicate => 'Šio pavadinimo užklausa jau pateikta';

  @override
  String get requestErrorQuota => 'Pasiektas užklausų limitas';

  @override
  String get requestErrorBlocklisted =>
      'Šis pavadinimas įtrauktas į blokuojamųjų sąrašą';

  @override
  String get requestErrorNoSeasons =>
      'Nebeliko sezonų, kuriems būtų galima pateikti užklausą';

  @override
  String get requestErrorPermission =>
      'Neturite teisės pateikti šios užklausos';

  @override
  String get seerrRequestsTitle => 'Užklausos';

  @override
  String get seerrIssuesTitle => 'Problemos';

  @override
  String get sortNewest => 'Naujausi';

  @override
  String get sortLastModified => 'Paskutinį kartą keista';

  @override
  String get noIssues => 'Problemų nėra';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Liko $remaining iš $limit filmų užklausų';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Liko $remaining iš $limit sezonų užklausų';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Priklauso rinkiniui $name';
  }

  @override
  String get viewCollection => 'Peržiūrėti rinkinį';

  @override
  String get requestCollection => 'Pateikti rinkinio užklausą';

  @override
  String collectionMoviesSummary(int total, int available) {
    return 'Filmų: $total · pasiekiama: $available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Pateikti užklausą dėl $count filmų';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Pateikiama $current iš $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Pateikta užklausų dėl $count filmų';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Pateikta $ok iš $total filmų užklausų';
  }

  @override
  String get collectionAllRequested =>
      'Visi filmai jau pasiekiami arba jų užklausos pateiktos';

  @override
  String get reportIssue => 'Pranešti apie problemą';

  @override
  String get issueTypeVideo => 'Vaizdas';

  @override
  String get issueTypeAudio => 'Garsas';

  @override
  String get whatsWrong => 'Kas negerai?';

  @override
  String get allEpisodes => 'Visos serijos';

  @override
  String get episode => 'Serija';

  @override
  String get openStatus => 'Atvira';

  @override
  String get resolvedStatus => 'Išspręsta';

  @override
  String get resolveAction => 'Išspręsti';

  @override
  String get reopenAction => 'Atidaryti iš naujo';

  @override
  String reportedByName(String name) {
    return 'Pranešė $name';
  }

  @override
  String commentsCount(int count) {
    return 'Komentarų: $count';
  }

  @override
  String get addComment => 'Pridėti komentarą';

  @override
  String get deleteIssueConfirm => 'Ištrinti šią problemą?';

  @override
  String get submitReport => 'Pateikti pranešimą';

  @override
  String get tmdbScore => 'TMDB balas';

  @override
  String get releaseDateLabel => 'Išleidimo data';

  @override
  String get firstAirDateLabel => 'Pirmasis eterio pasimatymas';

  @override
  String get revenueLabel => 'Pajamos';

  @override
  String get runtimeLabel => 'Vykdymo laikas';

  @override
  String get budgetLabel => 'Biudžetas';

  @override
  String get originalLanguageLabel => 'Originalo kalba';

  @override
  String get seasonsLabel => 'Sezonai';

  @override
  String get episodesLabel => 'Epizodai';

  @override
  String get access => 'Prieiga';

  @override
  String get add => 'Pridėti';

  @override
  String get address => 'Adresas';

  @override
  String get analytics => 'Analizė';

  @override
  String get catalog => 'Katalogas';

  @override
  String get content => 'Turinys';

  @override
  String get copy => 'Kopijuoti';

  @override
  String get create => 'Sukurti';

  @override
  String get disable => 'Išjungti';

  @override
  String get done => 'Atlikta';

  @override
  String get edit => 'Redaguoti';

  @override
  String get encoding => 'Kodavimas';

  @override
  String get error => 'Klaida';

  @override
  String get forward => 'Pirmyn';

  @override
  String get general => 'Bendra';

  @override
  String get go => 'Eik';

  @override
  String get install => 'Įdiegti';

  @override
  String get installed => 'Įdiegta';

  @override
  String get interval => 'Intervalas';

  @override
  String get name => 'Vardas';

  @override
  String get networking => 'Tinklo kūrimas';

  @override
  String get next => 'Kitas';

  @override
  String get path => 'Kelias';

  @override
  String get paused => 'Pristabdyta';

  @override
  String get permissions => 'Leidimai';

  @override
  String get processing => 'Apdorojimas';

  @override
  String get profile => 'Profilis';

  @override
  String get provider => 'Teikėjas';

  @override
  String get refresh => 'Atnaujinti';

  @override
  String get remote => 'Nuotolinis';

  @override
  String get rename => 'Pervardyti';

  @override
  String get revoke => 'Atšaukti';

  @override
  String get role => 'Vaidmuo';

  @override
  String get root => 'Šaknis';

  @override
  String get run => 'Bėk';

  @override
  String get search => 'Ieškoti';

  @override
  String get select => 'Pasirinkite';

  @override
  String get send => 'Siųsti';

  @override
  String get sessions => 'Sesijos';

  @override
  String get set => 'Nustatyti';

  @override
  String get status => 'Būsena';

  @override
  String get stop => 'Stabdyti';

  @override
  String get streaming => 'Srautinis perdavimas';

  @override
  String get time => 'Laikas';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Pašalinkite';

  @override
  String get up => 'Aukštyn';

  @override
  String get update => 'Atnaujinti';

  @override
  String get upload => 'Įkelti';

  @override
  String get unmute => 'Įjungti garsą';

  @override
  String get mute => 'Nutildyti';

  @override
  String get branding => 'Prekės ženklas';

  @override
  String get adminDrawerDashboard => 'Prietaisų skydelis';

  @override
  String get adminDrawerAnalytics => 'Analizė';

  @override
  String get adminDrawerSettings => 'Nustatymai';

  @override
  String get adminDrawerBranding => 'Prekės ženklas';

  @override
  String get adminDrawerUsers => 'Vartotojai';

  @override
  String get adminDrawerLibraries => 'Bibliotekos';

  @override
  String get adminDrawerDisplay => 'Rodymas';

  @override
  String get adminDrawerMetadata => 'Metaduomenys';

  @override
  String get adminDrawerNfo => 'NFO nustatymai';

  @override
  String get adminDrawerTranscoding => 'Perkodavimas';

  @override
  String get adminDrawerResume => 'Tęsti';

  @override
  String get adminDrawerStreaming => 'Srautinis perdavimas';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Prietaisai';

  @override
  String get adminDrawerActivity => 'Veikla';

  @override
  String get adminDrawerNetworking => 'Tinklo kūrimas';

  @override
  String get adminDrawerApiKeys => 'API raktai';

  @override
  String get adminDrawerBackups => 'Atsarginės kopijos';

  @override
  String get adminDrawerLogs => 'Rąstai';

  @override
  String get adminDrawerScheduledTasks => 'Suplanuotos užduotys';

  @override
  String get adminDrawerPlugins => 'Papildiniai';

  @override
  String get adminDrawerRepositories => 'Saugyklos';

  @override
  String get adminDrawerLiveTv => 'Tiesioginė televizija';

  @override
  String get adminExitTooltip => 'Išeiti iš administratoriaus';

  @override
  String get adminDashboardLoadFailed => 'Nepavyko įkelti prietaisų skydelio';

  @override
  String get adminMediaOverview => 'Žiniasklaidos apžvalga';

  @override
  String get adminMediaTotalsError => 'Nepavyko įkelti serverio medijos sumų.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Greitai perskaitykite, kiek turinio yra šiame serveryje.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Galimi papildinio atnaujinimai: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Papildiniai, kuriuos reikia paleisti iš naujo: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Nepavyko suplanuotos užduotys: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Naujausi įspėjimų / klaidų įrašai: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Žiniasklaidos platinimas';

  @override
  String get analyticsVideoCodecs => 'Vaizdo kodekai';

  @override
  String get analyticsAudioCodecs => 'Garso kodekai';

  @override
  String get analyticsContainers => 'Konteineriai';

  @override
  String get analyticsTopGenres => 'Populiariausi žanrai';

  @override
  String get analyticsReleaseYears => 'Išleidimo metai';

  @override
  String get analyticsContentRatings => 'Turinio įvertinimai';

  @override
  String get analyticsRuntimeBuckets => 'Vykdymo laiko segmentai';

  @override
  String get analyticsFileFormats => 'Failų formatai';

  @override
  String get analyticsNoData => 'Duomenų nėra.';

  @override
  String get adminServerInfo => 'Serverio informacija';

  @override
  String get adminRestartPending => 'Laukiama iš naujo';

  @override
  String get adminServerPaths => 'Serverio keliai';

  @override
  String get adminServerActions => 'Serverio veiksmai';

  @override
  String get adminRestartServer => 'Iš naujo paleiskite serverį';

  @override
  String get adminShutdownServer => 'Serverio išjungimas';

  @override
  String get adminScanLibraries => 'Nuskaityti bibliotekas';

  @override
  String get adminLibraryScanStarted => 'Pradėtas bibliotekos skenavimas';

  @override
  String errorGeneric(String error) {
    return 'Klaida: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Vyksta serverio perkrovimas';

  @override
  String get adminServerRebootMessage =>
      'Serveris perkraunamas, iš naujo paleiskite „Moonfin“.';

  @override
  String get adminActiveSessions => 'Aktyvūs užsiėmimai';

  @override
  String get adminSessionsLoadFailed => 'Nepavyko įkelti seansų';

  @override
  String get adminNoActiveSessions => 'Nėra aktyvių seansų';

  @override
  String get adminRecentActivity => 'Naujausia veikla';

  @override
  String get adminNoRecentActivity => 'Nėra pastarojo meto veiklos';

  @override
  String adminCommandFailed(String error) {
    return 'Komanda nepavyko: $error';
  }

  @override
  String get adminSendMessage => 'Siųsti žinutę';

  @override
  String get adminMessageTextHint => 'Pranešimo tekstas';

  @override
  String get adminSetVolume => 'Nustatykite garsumą';

  @override
  String get sessionPrev => 'Ankst';

  @override
  String get sessionRewind => 'Atsukti atgal';

  @override
  String get sessionForward => 'Prasukti pirmyn';

  @override
  String get sessionNext => 'Kitas';

  @override
  String get sessionVolumeDown => 'tomas –';

  @override
  String get sessionVolumeUp => 'Gars. +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Dabar žaidžiama';

  @override
  String get volume => 'Garsumas';

  @override
  String get actions => 'Veiksmai';

  @override
  String get videoCodec => 'Vaizdo įrašų kodekas';

  @override
  String get audioCodec => 'Garso kodekas';

  @override
  String get hwAccel => 'Aparat. spartinimas';

  @override
  String get completion => 'Užbaigimas';

  @override
  String get direct => 'Tiesioginis';

  @override
  String get adminDisconnect => 'Atsijungti';

  @override
  String get adminClearDates => 'Aiškios datos';

  @override
  String get adminActivitySeverityAll => 'Visi svarbumo lygiai';

  @override
  String get adminActivityDateRange => 'Datų intervalas';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Nepavyko įkelti veiklos žurnalo: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nėra veiklos įrašų';

  @override
  String get adminEditDeviceName => 'Redaguoti įrenginio pavadinimą';

  @override
  String get adminCustomName => 'Pasirinktinis pavadinimas';

  @override
  String get adminDeviceNameUpdated => 'Įrenginio pavadinimas atnaujintas';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Nepavyko atnaujinti įrenginio: $error';
  }

  @override
  String get adminDeleteDevice => 'Ištrinti įrenginį';

  @override
  String get adminDeviceDeleted => 'Įrenginys ištrintas';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Nepavyko ištrinti įrenginio: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Pašalinti įrenginį „$name“? Naudotojui reikės iš naujo prisijungti šiame įrenginyje.';
  }

  @override
  String get adminDeleteAllDevices => 'Ištrinti visus įrenginius';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Pašalinti įrenginius ($count)? Paveiktiems naudotojams reikės prisijungti iš naujo. Jūsų dabartinis įrenginys nebus paveiktas.';
  }

  @override
  String get adminDevicesDeletedAll => 'Įrenginiai pašalinti';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Kai kurie įrenginiai pašalinti; $count pašalinti nepavyko.';
  }

  @override
  String get adminDevicesLoadFailed => 'Nepavyko įkelti įrenginių';

  @override
  String get adminSearchDevices => 'Ieškokite įrenginių';

  @override
  String get adminThisDevice => 'Šis Įrenginys';

  @override
  String get adminEditName => 'Redaguoti vardą';

  @override
  String get adminLibrariesLoadFailed => 'Nepavyko įkelti bibliotekų';

  @override
  String get adminNoLibraries => 'Nėra sukonfigūruotų bibliotekų';

  @override
  String get adminScanAllLibraries => 'Nuskaityti visas bibliotekas';

  @override
  String get adminAddLibrary => 'Pridėti biblioteką';

  @override
  String adminScanFailed(String error) {
    return 'Nepavyko pradėti nuskaitymo: $error';
  }

  @override
  String get adminRenameLibrary => 'Pervardyti biblioteką';

  @override
  String get adminNewName => 'Naujas vardas';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteka pervadinta į „$name“';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Nepavyko pervardyti: $error';
  }

  @override
  String get adminDeleteLibrary => 'Ištrinti biblioteką';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteka „$name“ ištrinta';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Nepavyko ištrinti bibliotekos: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Nepavyko pridėti kelio: $error';
  }

  @override
  String get adminRemovePath => 'Pašalinti kelią';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Pašalinti „$path“ iš šios bibliotekos?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Nepavyko pašalinti kelio: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Bibliotekos parinktys išsaugotos';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Nepavyko išsaugoti parinkčių: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nepavyko įkelti bibliotekos';

  @override
  String get adminNoMediaPaths => 'Nesukonfigūruota medijos kelių';

  @override
  String get adminAddPath => 'Pridėti kelią';

  @override
  String get adminBrowseFilesystem => 'Naršyti serverio failų sistemą:';

  @override
  String get adminSaveOptions => 'Išsaugoti parinktis';

  @override
  String get adminPreferredMetadataLanguage => 'Pageidautina metaduomenų kalba';

  @override
  String get adminMetadataLanguageHint => 'pvz. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metaduomenų šalies kodas';

  @override
  String get adminMetadataCountryHint => 'pvz. JAV, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Keliai';

  @override
  String get adminLibraryTabOptions => 'Parinktys';

  @override
  String get adminLibraryTabDownloaders => 'Atsisiuntimo šaltiniai';

  @override
  String get adminLibMetadataSavers => 'Metaduomenų saugotojai';

  @override
  String get adminLibSubtitleDownloaders => 'Subtitrų atsisiuntimo šaltiniai';

  @override
  String get adminLibLyricDownloaders => 'Dainų tekstų atsisiuntimo šaltiniai';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metaduomenų atsisiuntimo šaltiniai: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Vaizdų šaltiniai: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Šis serveris nesiūlo atsisiuntimo šaltinių šio tipo bibliotekai.';

  @override
  String get adminLibrarySectionGeneral => 'Bendra';

  @override
  String get adminLibrarySectionMetadata => 'Metaduomenys';

  @override
  String get adminLibrarySectionEmbedded => 'Įterptoji informacija';

  @override
  String get adminLibrarySectionSubtitles => 'Subtitrai';

  @override
  String get adminLibrarySectionImages => 'Vaizdai';

  @override
  String get adminLibrarySectionSeries => 'Serialai';

  @override
  String get adminLibrarySectionMusic => 'Muzika';

  @override
  String get adminLibrarySectionMovies => 'Filmai';

  @override
  String get adminLibRealtimeMonitor => 'Įjungti stebėjimą realiuoju laiku';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Aptikti failų pakeitimus ir apdoroti juos automatiškai.';

  @override
  String get adminLibArchiveMediaFiles => 'Laikyti archyvus medijos failais';

  @override
  String get adminLibEnablePhotos => 'Rodyti nuotraukas';

  @override
  String get adminLibSaveLocalMetadata =>
      'Įrašyti viršelius į medijos aplankus';

  @override
  String get adminLibRefreshInterval => 'Automatinis metaduomenų atnaujinimas';

  @override
  String get adminLibRefreshNever => 'Niekada';

  @override
  String get adminLibDefault => 'Numatytasis';

  @override
  String get adminLibDisplayTitle => 'Rodymas';

  @override
  String get adminLibDisplaySection => 'Bibliotekos rodymas';

  @override
  String get adminLibFolderView =>
      'Rodyti aplankų rodinį su paprastais medijos aplankais';

  @override
  String get adminLibSpecialsInSeasons =>
      'Rodyti specialiąsias serijas tuose sezonuose, kuriuose jos buvo rodomos';

  @override
  String get adminLibGroupMovies => 'Grupuoti filmus į rinkinius';

  @override
  String get adminLibGroupShows => 'Grupuoti serialus į rinkinius';

  @override
  String get adminLibExternalSuggestions =>
      'Rodyti išorinį turinį pasiūlymuose';

  @override
  String get adminLibDateAddedSection => 'Pridėjimo datos veikimas';

  @override
  String get adminLibDateAddedLabel => 'Pridėjimo datą imti iš';

  @override
  String get adminLibDateAddedImport => 'Nuskaitymo į biblioteką data';

  @override
  String get adminLibDateAddedFile => 'Failo sukūrimo data';

  @override
  String get adminLibMetadataTitle => 'Metaduomenys ir vaizdai';

  @override
  String get adminLibMetadataLangSection => 'Pageidaujama metaduomenų kalba';

  @override
  String get adminLibChaptersSection => 'Skyriai';

  @override
  String get adminLibDummyChapterDuration =>
      'Fiktyvių skyrių trukmė (sekundėmis)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Skyrių, sugeneruotų medijai, kuri jų neturi, trukmė. Nustatykite 0, kad išjungtumėte.';

  @override
  String get adminLibChapterImageResolution => 'Skyrių vaizdų raiška';

  @override
  String get adminLibNfoTitle => 'NFO nustatymai';

  @override
  String get adminLibNfoHelp =>
      'NFO metaduomenys suderinami su Kodi ir panašiomis programomis. Nustatymai taikomi visoms bibliotekoms, kurios įrašo NFO metaduomenis.';

  @override
  String get adminLibKodiUser =>
      'Naudotojas, kurio žiūrėjimo duomenys bus įrašomi į NFO failus';

  @override
  String get adminLibSaveImagePaths => 'Įrašyti vaizdų kelius į NFO failus';

  @override
  String get adminLibPathSubstitution => 'Įjungti NFO vaizdų kelių pakeitimą';

  @override
  String get adminLibExtraThumbs =>
      'Kopijuoti extrafanart vaizdus į extrathumbs aplanką';

  @override
  String get adminLibNone => 'Nėra';

  @override
  String adminLibRefreshDays(int days) {
    return '$days d.';
  }

  @override
  String get adminLibEmbeddedTitles => 'Naudoti įterptuosius pavadinimus';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Naudoti įterptuosius priedų pavadinimus';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Naudoti įterptąją serijų informaciją';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Leisti įterptuosius subtitrus';

  @override
  String get adminLibEmbeddedAllowAll => 'Leisti visus';

  @override
  String get adminLibEmbeddedAllowText => 'Tik tekstinius';

  @override
  String get adminLibEmbeddedAllowImage => 'Tik vaizdinius';

  @override
  String get adminLibEmbeddedAllowNone => 'Nėra';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Praleisti atsisiuntimą, jei yra įterptųjų subtitrų';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Praleisti atsisiuntimą, jei garso takelio kalba sutampa su atsisiuntimo kalba';

  @override
  String get adminLibRequirePerfectMatch =>
      'Reikalauti tikslaus subtitrų atitikmens';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Įrašyti subtitrus į medijos aplankus';

  @override
  String get adminLibChapterImageExtraction => 'Išgauti skyrių vaizdus';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Išgauti skyrių vaizdus nuskaitant biblioteką';

  @override
  String get adminLibTrickplayExtraction => 'Įjungti Trickplay vaizdų išgavimą';

  @override
  String get adminLibTrickplayDuringScan =>
      'Išgauti Trickplay vaizdus nuskaitant biblioteką';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Įrašyti Trickplay vaizdus į medijos aplankus';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automatiškai sujungti serialus, išsklaidytus keliuose aplankuose';

  @override
  String get adminLibSeasonZeroName => 'Nulinio sezono rodomas pavadinimas';

  @override
  String get adminLibLufsScan => 'Įjungti LUFS nuskaitymą garsui normalizuoti';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Teikti pirmenybę nestandartinei atlikėjų žymai';

  @override
  String get adminLibAutoAddToCollection =>
      'Automatiškai pridėti filmus į rinkinius';

  @override
  String get adminLibraryNameRequired => 'Būtinas bibliotekos pavadinimas';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Nepavyko sukurti bibliotekos: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotekos pavadinimas';

  @override
  String get adminSelectedPaths => 'Pasirinkti keliai:';

  @override
  String get adminNoPathsAdded => 'Kelių nepridėta (galima pridėti vėliau)';

  @override
  String get adminCreateLibrary => 'Sukurti biblioteką';

  @override
  String get paths => 'Keliai:';

  @override
  String get adminDisableUser => 'Išjungti vartotoją';

  @override
  String get adminEnableUser => 'Įgalinti vartotoją';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Išjungti $name? Jie negalės prisijungti.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Įgalinti $name? Jie vėl galės prisijungti.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Naudotojas „$name“ išjungtas';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Vartotojas „$name“ įjungtas';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Nepavyko atnaujinti naudotojo politikos: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Nepavyko įkelti naudotojų';

  @override
  String get adminSearchUsers => 'Ieškoti vartotojų';

  @override
  String get adminEditUser => 'Redaguoti vartotoją';

  @override
  String get adminAddUser => 'Pridėti naudotoją';

  @override
  String adminUserCreateFailed(String error) {
    return 'Nepavyko sukurti vartotojo: $error';
  }

  @override
  String get adminCreateUser => 'Sukurti vartotoją';

  @override
  String get adminPasswordOptional => 'Slaptažodis (neprivaloma)';

  @override
  String get adminUsernameRequired =>
      'Vartotojo vardo laukas negali būti tuščias';

  @override
  String get adminNoProfileChanges =>
      'Nėra profilio pakeitimų, kuriuos būtų galima išsaugoti';

  @override
  String get adminProfileSaved => 'Profilis išsaugotas';

  @override
  String adminSaveFailed(String error) {
    return 'Nepavyko išsaugoti: $error';
  }

  @override
  String get adminPermissionsSaved => 'Leidimai išsaugoti';

  @override
  String get adminPasswordsMismatch => 'Slaptažodžiai nesutampa';

  @override
  String adminFailed(String error) {
    return 'Nepavyko: $error';
  }

  @override
  String get adminUserLoadFailed => 'Nepavyko įkelti vartotojo';

  @override
  String get adminBackToUsers => 'Grįžti į Vartotojus';

  @override
  String get adminSaveProfile => 'Išsaugoti profilį';

  @override
  String get adminDeleteUser => 'Ištrinti vartotoją';

  @override
  String get admin => 'Administravimas';

  @override
  String get adminFullAccessWarning =>
      'Administratoriai turi visišką prieigą prie serverio. Suteikite atsargiai.';

  @override
  String get administrator => 'Administratorius';

  @override
  String get adminHiddenUser => 'Paslėptas vartotojas';

  @override
  String get adminAllowMediaPlayback => 'Leisti medijos atkūrimą';

  @override
  String get adminAllowAudioTranscoding => 'Leisti garso perkodavimą';

  @override
  String get adminAllowVideoTranscoding => 'Leisti vaizdo įrašo perkodavimą';

  @override
  String get adminAllowRemuxing => 'Leiskite maišyti';

  @override
  String get adminForceRemoteTranscoding =>
      'Priverstinis nuotolinio šaltinio perkodavimas';

  @override
  String get adminAllowContentDeletion => 'Leisti ištrinti turinį';

  @override
  String get adminAllowContentDownloading => 'Leisti atsisiųsti turinį';

  @override
  String get adminAllowPublicSharing => 'Leisti viešai bendrinti';

  @override
  String get adminAllowRemoteControl =>
      'Leisti nuotoliniu būdu valdyti kitus vartotojus';

  @override
  String get adminAllowSharedDeviceControl =>
      'Leisti bendrinamą įrenginio valdymą';

  @override
  String get adminAllowRemoteAccess => 'Leisti nuotolinę prieigą';

  @override
  String get adminRemoteBitrateLimit =>
      'Nuotolinio kliento pralaidumo riba (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Palikite tuščią be jokių apribojimų';

  @override
  String get adminMaxActiveSessions => 'Maksimalus aktyvių seansų skaičius';

  @override
  String get adminAllowLiveTvAccess => 'Leisti tiesioginę TV prieigą';

  @override
  String get adminAllowLiveTvManagement =>
      'Leisti tiesioginės televizijos tvarkymą';

  @override
  String get adminAllowCollectionManagement => 'Leisti tvarkyti rinkinį';

  @override
  String get adminAllowSubtitleManagement => 'Leisti tvarkyti subtitrus';

  @override
  String get adminAllowLyricManagement => 'Leisti tvarkyti dainų tekstą';

  @override
  String get adminSavePermissions => 'Išsaugoti leidimus';

  @override
  String get adminEnableAllLibraryAccess =>
      'Įgalinti prieigą prie visų bibliotekų';

  @override
  String get adminSaveAccess => 'Išsaugoti prieigą';

  @override
  String get adminChangePassword => 'Keisti slaptažodį';

  @override
  String get adminNewPassword => 'Naujas slaptažodis';

  @override
  String get adminConfirmPassword => 'Patvirtinkite slaptažodį';

  @override
  String get adminSetPassword => 'Nustatyti slaptažodį';

  @override
  String get adminResetPassword => 'Iš naujo nustatyti slaptažodį';

  @override
  String get adminPasswordReset => 'Slaptažodžio nustatymas iš naujo';

  @override
  String get adminPasswordUpdated => 'Slaptažodis atnaujintas';

  @override
  String get adminUserSettings => 'Vartotojo nustatymai';

  @override
  String get adminLibraryAccess => 'Prieiga prie bibliotekos';

  @override
  String get adminDeviceAndChannelAccess => 'Prieiga prie įrenginio ir kanalo';

  @override
  String get adminEnableAllDevices => 'Įgalinkite prieigą prie visų įrenginių';

  @override
  String get adminEnableAllChannels => 'Įgalinti prieigą prie visų kanalų';

  @override
  String get adminParentalControl => 'Tėvų kontrolė';

  @override
  String get adminMaxParentalRating => 'Didžiausias leidžiamas amžiaus cenzas';

  @override
  String get adminMaxParentalRatingHint =>
      'Aukštesnio cenzo turinys šiam naudotojui bus paslėptas.';

  @override
  String get adminParentalRatingNone => 'Nėra';

  @override
  String get adminBlockUnratedItems =>
      'Blokuoti elementus be cenzo informacijos arba su neatpažinta informacija';

  @override
  String get adminUnratedBook => 'Knygos';

  @override
  String get adminUnratedChannelContent => 'Kanalai';

  @override
  String get adminUnratedLiveTvChannel => 'Tiesioginė TV';

  @override
  String get adminUnratedMovie => 'Filmai';

  @override
  String get adminUnratedMusic => 'Muzika';

  @override
  String get adminUnratedTrailer => 'Anonsai';

  @override
  String get adminUnratedSeries => 'Serialai';

  @override
  String get adminAccessSchedules => 'Prieigos tvarkaraščiai';

  @override
  String get adminAccessSchedulesHint =>
      'Leisti prieigą tik toliau nurodytu tvarkaraščio laiku. Kai tvarkaraštis nenustatytas, prieiga leidžiama visą parą.';

  @override
  String get adminAddSchedule => 'Pridėti tvarkaraštį';

  @override
  String get adminScheduleDay => 'Diena';

  @override
  String get adminScheduleStart => 'Pradžia';

  @override
  String get adminScheduleEnd => 'Pabaiga';

  @override
  String get adminDayEveryday => 'Kasdien';

  @override
  String get adminDayWeekday => 'Darbo diena';

  @override
  String get adminDayWeekend => 'Savaitgalis';

  @override
  String get adminDaySunday => 'Sekmadienis';

  @override
  String get adminDayMonday => 'Pirmadienis';

  @override
  String get adminDayTuesday => 'Antradienis';

  @override
  String get adminDayWednesday => 'Trečiadienis';

  @override
  String get adminDayThursday => 'Ketvirtadienis';

  @override
  String get adminDayFriday => 'Penktadienis';

  @override
  String get adminDaySaturday => 'Šeštadienis';

  @override
  String get adminAllowedTags => 'Leidžiamos žymos';

  @override
  String get adminAllowedTagsHint =>
      'Rodomas tik turinys su šiomis žymomis. Palikite tuščią, kad būtų leidžiama viskas.';

  @override
  String get adminBlockedTags => 'Blokuojamos žymos';

  @override
  String get adminBlockedTagsHint =>
      'Turinys su šiomis žymomis šiam naudotojui bus paslėptas.';

  @override
  String get adminAddTag => 'Pridėti žymą';

  @override
  String get adminEnabledDevices => 'Įjungti įrenginiai';

  @override
  String get adminEnabledChannels => 'Įjungti kanalai';

  @override
  String get adminAuthProvider => 'Tapatybės nustatymo tiekėjas';

  @override
  String get adminPasswordResetProvider => 'Slaptažodžio atkūrimo tiekėjas';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Didžiausias nepavykusių prisijungimų skaičius iki užrakinimo';

  @override
  String get adminLoginAttemptsHint =>
      'Nustatykite 0 numatytajai reikšmei arba -1, kad išjungtumėte užrakinimą.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay prieiga';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Leisti kurti grupes ir prie jų prisijungti';

  @override
  String get adminSyncPlayJoin => 'Leisti prisijungti prie grupių';

  @override
  String get adminSyncPlayNone => 'Prieigos nėra';

  @override
  String get adminContentDeletionFolders => 'Leisti trinti turinį iš';

  @override
  String get adminResetPasswordWarning =>
      'Tai pašalins slaptažodį. Vartotojas galės prisijungti be slaptažodžio.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Serveris grąžino HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Ar tikrai norite ištrinti $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Naudotojas „$name“ ištrintas';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Nepavyko ištrinti vartotojo: $error';
  }

  @override
  String get adminCreateApiKey => 'Sukurkite API raktą';

  @override
  String get adminAppName => 'Programos pavadinimas';

  @override
  String get adminApiKeyCreated => 'API raktas sukurtas';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Raktas sėkmingai sukurtas. Serveris žetono negrąžino. Patikrinkite serverio API raktus.';

  @override
  String get adminKeyCopied => 'Raktas nukopijuotas į mainų sritį';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Nepavyko sukurti rakto: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Serverio atsakyme trūksta rakto prieigos rakto';

  @override
  String get adminRevokeApiKey => 'Atšaukti API raktą';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Atšaukti $name raktą?';
  }

  @override
  String get adminApiKeyRevoked => 'API raktas atšauktas';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nepavyko atšaukti rakto: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Nepavyko įkelti API raktų';

  @override
  String get adminApiKeysTitle => 'API raktai';

  @override
  String get adminCreateKey => 'Sukurti raktą';

  @override
  String get adminNoApiKeys => 'API raktų nerasta';

  @override
  String get adminUnknownApp => 'Nežinoma programa';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Žetonas: $token\\nSukurta: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Kurti atsarginę kopiją';

  @override
  String get adminBackupInclude =>
      'Pasirinkite, ką įtraukti į atsarginę kopiją.';

  @override
  String get adminBackupDatabase => 'Duomenų bazė';

  @override
  String get adminBackupDatabaseAlways => 'Įtraukiama visada';

  @override
  String get adminBackupMetadata => 'Metaduomenys';

  @override
  String get adminBackupSubtitles => 'Subtitrai';

  @override
  String get adminBackupTrickplay => 'Trickplay vaizdai';

  @override
  String get adminCreatingBackup => 'Kuriama atsarginė kopija...';

  @override
  String get adminBackupCreated => 'Atsarginė kopija sukurta sėkmingai';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Nepavyko sukurti atsarginės kopijos: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Serverio atsakyme trūksta atsarginio kelio';

  @override
  String adminBackupManifest(String name) {
    return 'Manifestas: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Nepavyko įkelti aprašo: $error';
  }

  @override
  String get adminConfirmRestore => 'Patvirtinkite atkūrimą';

  @override
  String get adminRestoringBackup => 'Atkuriama atsarginė kopija...';

  @override
  String adminRestoreFailed(String error) {
    return 'Nepavyko atkurti atsarginės kopijos: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Nepavyko įkelti atsarginių kopijų';

  @override
  String get adminCreateBackup => 'Sukurti atsarginę kopiją';

  @override
  String get adminNoBackups => 'Atsarginių kopijų nerasta';

  @override
  String get adminViewDetails => 'Peržiūrėti išsamią informaciją';

  @override
  String get restore => 'Atkurti';

  @override
  String get adminLogsLoadFailed => 'Nepavyko įkelti serverio žurnalų';

  @override
  String get adminNoLogFiles => 'Žurnalo failų nerasta';

  @override
  String get adminLogCopied => 'Žurnalas nukopijuotas į mainų sritį';

  @override
  String get adminSaveLogFile => 'Išsaugoti žurnalo failą';

  @override
  String adminSavedTo(String path) {
    return 'Išsaugota $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Nepavyko išsaugoti failo: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Nepavyko įkelti $fileName';
  }

  @override
  String get adminSearchInLog => 'Ieškoti žurnale';

  @override
  String get adminNoMatchingLines => 'Nėra atitinkančių eilučių';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Nepavyko įkelti užduočių: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Suplanuotų užduočių nerasta';

  @override
  String get adminNoTasksMatchFilter =>
      'Nėra užduočių, atitinkančių dabartinį filtrą';

  @override
  String adminTaskStartFailed(String error) {
    return 'Nepavyko pradėti užduoties: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Nepavyko sustabdyti užduoties: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Nepavyko įkelti užduoties: $error';
  }

  @override
  String get adminRunNow => 'Paleisti dabar';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Nepavyko pašalinti aktyviklio: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Nepavyko pridėti aktyviklio: $error';
  }

  @override
  String get adminLastExecution => 'Paskutinis vykdymas';

  @override
  String get adminTriggers => 'Trigeriai';

  @override
  String get adminAddTrigger => 'Pridėti trigerį';

  @override
  String get adminNoTriggers => 'Nėra sukonfigūruotų aktyviklių';

  @override
  String get adminTriggerType => 'Trigerio tipas';

  @override
  String get adminTimeLimit => 'Laiko limitas (neprivaloma)';

  @override
  String get adminNoLimit => 'Nėra limito';

  @override
  String adminHours(String hours) {
    return '$hours valanda(s)';
  }

  @override
  String get adminDayOfWeek => 'Savaitės diena';

  @override
  String get adminSearchPlugins => 'Ieškoti papildinių...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Nepavyko perjungti papildinio: $error';
  }

  @override
  String get adminUninstallPlugin => 'Pašalinkite papildinį';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Ar tikrai norite pašalinti „$name“?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Nepavyko pašalinti papildinio: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Nepavyko įdiegti paketo: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Nepavyko įdiegti naujinimo: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Nepavyko įkelti papildinių: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Nėra jūsų paiešką atitinkančių papildinių';

  @override
  String get adminNoPluginsInstalled => 'Įskiepių nėra įdiegta';

  @override
  String adminInstallUpdate(String version) {
    return 'Įdiekite naujinimą (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Nepavyko įkelti katalogo: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Nėra jūsų paiešką atitinkančių paketų';

  @override
  String get adminNoPackagesAvailable => 'Nėra jokių paketų';

  @override
  String get adminExperimentalIntegration => 'Eksperimentinė integracija';

  @override
  String get adminExperimentalWarning =>
      'Papildinių nustatymų integravimas vis dar yra eksperimentinis. Kai kurie nustatymų puslapiai gali būti rodomi netinkamai.';

  @override
  String get continueAction => 'Tęsti';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '„$name“ bus pašalintas paleidus serverį iš naujo';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Nepavyko pašalinti: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '„$name“ atnaujinama į v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Neįmanoma atidaryti nustatymų: trūksta autentifikavimo prieigos rakto.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Nepavyko įkelti papildinio: $error';
  }

  @override
  String get adminPluginNotFound => 'Papildinys nerastas';

  @override
  String adminPluginVersion(String version) {
    return 'Versija $version';
  }

  @override
  String get adminEnablePlugin => 'Įjungti papildinį';

  @override
  String get adminPluginSettingsPage => 'Papildinio nustatymų puslapis';

  @override
  String get adminRevisionHistory => 'Revizijos istorija';

  @override
  String get adminNoChangelog => 'Nėra pakeitimų žurnalo.';

  @override
  String get adminRemoveRepository => 'Pašalinti saugyklą';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Ar tikrai norite pašalinti „$name“?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Nepavyko išsaugoti saugyklų: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Nepavyko įkelti saugyklų: $error';
  }

  @override
  String get adminRepositoryNameHint => 'pvz. Jellyfin stabilus';

  @override
  String get adminRepositoryUrl => 'Saugyklos URL';

  @override
  String get adminAddEntry => 'Pridėti įrašą';

  @override
  String get adminInvalidUrl => 'Netinkamas URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Nepavyko įkelti papildinio nustatymų: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nepavyko atidaryti $uri';
  }

  @override
  String get adminOpenInBrowser => 'Atidaryti naršyklėje';

  @override
  String get adminOpenExternally => 'Atidaryti išoriškai';

  @override
  String get adminGeneralSettings => 'Bendrieji nustatymai';

  @override
  String get adminServerName => 'Serverio pavadinimas';

  @override
  String get adminPreferredMetadataCountry => 'Pageidaujama metaduomenų šalis';

  @override
  String get adminCachePath => 'Talpyklos kelias';

  @override
  String get adminMetadataPath => 'Metaduomenų kelias';

  @override
  String get adminLibraryScanConcurrency =>
      'Bibliotekos nuskaitymas vienu metu';

  @override
  String get adminParallelImageEncodingLimit =>
      'Lygiagrečios vaizdo kodavimo riba';

  @override
  String get adminSlowResponseThreshold => 'Lėto atsako slenkstis (ms)';

  @override
  String get adminBrandingSaved => 'Prekės ženklo nustatymai išsaugoti';

  @override
  String get adminBrandingLoadFailed =>
      'Nepavyko įkelti prekės ženklo nustatymų';

  @override
  String get adminLoginDisclaimer => 'Prisijungimo atsisakymas';

  @override
  String get adminLoginDisclaimerHint => 'HTML rodomas po prisijungimo forma';

  @override
  String get adminCustomCss => 'Tinkintas CSS';

  @override
  String get adminCustomCssHint =>
      'Tinkintas CSS, pritaikytas žiniatinklio sąsajai';

  @override
  String get adminEnableSplashScreen => 'Įgalinti prisilietimo ekraną';

  @override
  String get adminStreamingSaved => 'Srautinio perdavimo nustatymai išsaugoti';

  @override
  String get adminStreamingLoadFailed =>
      'Nepavyko įkelti srautinio perdavimo nustatymų';

  @override
  String get adminStreamingDescription =>
      'Nustatykite visuotinius nuotolinio ryšio srautinio perdavimo pralaidumo apribojimus.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Nuotolinio kliento pralaidumo riba (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Palikite tuščią arba 0 neribotam';

  @override
  String get adminPlaybackSaved => 'Atkūrimo nustatymai išsaugoti';

  @override
  String get adminPlaybackLoadFailed => 'Nepavyko įkelti atkūrimo nustatymų';

  @override
  String get adminPlaybackTranscoding => 'Atkūrimas / perkodavimas';

  @override
  String get adminHardwareAcceleration => 'Aparatinis pagreitis';

  @override
  String get adminVaapiDevice => 'VA-API įrenginys';

  @override
  String get adminEnableHardwareEncoding =>
      'Įgalinti aparatinės įrangos kodavimą';

  @override
  String get adminEnableHardwareDecoding =>
      'Įgalinti aparatinės įrangos dekodavimą:';

  @override
  String get adminEncodingThreads => 'Kodavimo gijos';

  @override
  String get adminAutomatic => '0 = automatinis';

  @override
  String get adminTranscodingTempPath => 'Perkodavimo temp kelias';

  @override
  String get adminEnableFallbackFont => 'Įgalinti atsarginį šriftą';

  @override
  String get adminFallbackFontPath => 'Atsarginis šrifto kelias';

  @override
  String get adminAllowSegmentDeletion => 'Leisti ištrinti segmentą';

  @override
  String get adminSegmentKeepSeconds => 'Segmento išlaikymas (sekundėmis)';

  @override
  String get adminThrottleBuffering => 'Droselio buferis';

  @override
  String get adminTrickplaySaved => 'Trickplay nustatymai išsaugoti';

  @override
  String get adminTrickplayLoadFailed => 'Nepavyko įkelti Trickplay nustatymų';

  @override
  String get adminEnableHardwareAcceleration =>
      'Įgalinti aparatinės įrangos pagreitį';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Įgalinti tik rakto rėmelio ištraukimą';

  @override
  String get adminKeyFrameSubtitle => 'Greitesnis, bet mažesnis tikslumas';

  @override
  String get adminScanBehavior => 'Nuskaitymo elgsena';

  @override
  String get adminProcessPriority => 'Proceso prioritetas';

  @override
  String get adminImageSettings => 'Vaizdo nustatymai';

  @override
  String get adminIntervalMs => 'Intervalas (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Kaip dažnai fiksuoti kadrus';

  @override
  String get adminWidthResolutions => 'Pločio raiškos';

  @override
  String get adminTileWidth => 'Plytelių plotis';

  @override
  String get adminTileHeight => 'Plytelių aukštis';

  @override
  String get adminQualitySubtitle =>
      'Mažesnės reikšmės = geresnė kokybė, didesni failai';

  @override
  String get adminProcessThreads => 'Apdoroti gijas';

  @override
  String get adminResumeSaved => 'Tęsti nustatymai išsaugoti';

  @override
  String get adminResumeLoadFailed => 'Nepavyko įkelti atnaujinimo nustatymų';

  @override
  String get adminResumeDescription =>
      'Konfigūruokite, kada turinys turėtų būti pažymėtas kaip iš dalies arba visiškai paleistas.';

  @override
  String get adminMinResumePercentage => 'Minimalus atnaujinimo procentas';

  @override
  String get adminMinResumeSubtitle =>
      'Turinys turi būti paleistas ilgiau nei šis procentas, kad būtų išsaugota pažanga';

  @override
  String get adminMaxResumePercentage => 'Maksimalus atnaujinimo procentas';

  @override
  String get adminMaxResumeSubtitle =>
      'Turinys laikomas visiškai paleistas po šio procento';

  @override
  String get adminMinResumeDuration =>
      'Minimali gyvenimo aprašymo trukmė (sekundėmis)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Prekės, trumpesnės nei ši, nėra atnaujinamos';

  @override
  String get adminMinAudiobookResume =>
      'Minimalus garso knygos atnaujinimo procentas';

  @override
  String get adminMaxAudiobookResume =>
      'Didžiausias garso knygos atnaujinimo procentas';

  @override
  String get adminNetworkingSaved =>
      'Tinklo nustatymai išsaugoti. Gali prireikti iš naujo paleisti serverį.';

  @override
  String get adminNetworkingLoadFailed => 'Nepavyko įkelti tinklo nustatymų';

  @override
  String get adminNetworkingWarning =>
      'Dėl tinklo nustatymų pakeitimų gali tekti iš naujo paleisti serverį.';

  @override
  String get adminEnableRemoteAccess => 'Įgalinti nuotolinę prieigą';

  @override
  String get ports => 'Uostai';

  @override
  String get adminHttpPort => 'HTTP prievadas';

  @override
  String get adminHttpsPort => 'HTTPS prievadas';

  @override
  String get adminPublicHttpsPort => 'Viešas HTTPS prievadas';

  @override
  String get adminBaseUrl => 'Bazinis URL';

  @override
  String get adminBaseUrlHint => 'pvz. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Įgalinti HTTPS';

  @override
  String get adminLocalNetwork => 'Vietinis tinklas';

  @override
  String get adminLocalNetworkAddresses => 'Vietinio tinklo adresai';

  @override
  String get adminKnownProxies => 'Žinomi įgaliotieji serveriai';

  @override
  String get adminRemoteIpFilter => 'Nuotolinis IP filtras';

  @override
  String get adminRemoteIpFilterEntries => 'Nuotolinis IP filtras';

  @override
  String get adminCertificatePath => 'Sertifikato kelias';

  @override
  String get whitelist => 'Baltasis sąrašas';

  @override
  String get blacklist => 'Juodasis sąrašas';

  @override
  String get notSet => 'Nenustatyta';

  @override
  String get adminMetadataSaved => 'Metaduomenys išsaugoti';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Nepavyko įkelti metaduomenų: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Nepavyko išsaugoti metaduomenų: $error';
  }

  @override
  String get adminRefreshMetadata => 'Atnaujinkite metaduomenis';

  @override
  String get recursive => 'Rekursyvus';

  @override
  String get adminReplaceAllMetadata => 'Pakeiskite visus metaduomenis';

  @override
  String get adminReplaceAllImages => 'Pakeiskite visus vaizdus';

  @override
  String get adminMetadataRefreshRequested =>
      'Pateikta metaduomenų atnaujinimo užklausa';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Nepavyko atnaujinti metaduomenų: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Nuotolinių atitikmenų nerasta';

  @override
  String get adminRemoteResults => 'Nuotoliniai rezultatai';

  @override
  String get adminRemoteMetadataApplied => 'Taikyti nuotoliniai metaduomenys';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Nuotolinė paieška nepavyko: $error';
  }

  @override
  String get adminUpdateContentType => 'Atnaujinti turinio tipą';

  @override
  String get adminContentType => 'Turinio tipas';

  @override
  String get adminContentTypeUpdated => 'Turinio tipas atnaujintas';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nepavyko atnaujinti turinio tipo: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nepavyko įkelti metaduomenų rengyklės';

  @override
  String get adminNoPeopleEntries => 'Nėra žmonių įrašų';

  @override
  String get adminNoExternalIds => 'Nėra išorinių ID';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType vaizdas atnaujintas';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Nepavyko atsisiųsti vaizdo: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nepalaikomas vaizdo formatas';

  @override
  String get adminImageReadFailed => 'Nepavyko nuskaityti pasirinkto vaizdo';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType vaizdas įkeltas';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Nepavyko įkelti vaizdo: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Ištrinti $imageType vaizdą';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType vaizdas ištrintas';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Nepavyko ištrinti vaizdo: $error';
  }

  @override
  String get adminAllProviders => 'Visi tiekėjai';

  @override
  String get adminNoRemoteImages => 'Nuotolinių vaizdų nerasta';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Derintuvo aptikimas nepavyko: $error';
  }

  @override
  String get adminAddTuner => 'Pridėti imtuvą';

  @override
  String get adminEditTuner => 'Redaguoti imtuvą';

  @override
  String get adminTunerTypeM3u => 'M3U imtuvas';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Failas arba URL';

  @override
  String get adminTunerIpAddress => 'Imtuvo IP adresas';

  @override
  String get adminTunerFriendlyName => 'Patogus pavadinimas';

  @override
  String get adminTunerUserAgent => 'Naudotojo agentas';

  @override
  String get adminTunerCount => 'Vienalaikių ryšių limitas';

  @override
  String get adminTunerCountHelp =>
      'Didžiausias srautų skaičius, kurį imtuvas leidžia vienu metu. Nustatykite 0, kad būtų neribota.';

  @override
  String get adminTunerFallbackBitrate =>
      'Atsarginė didžiausia transliavimo bitų sparta';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Importuoti tik mėgstamiausius kanalus';

  @override
  String get adminTunerAllowHwTranscoding => 'Leisti aparatinį perkodavimą';

  @override
  String get adminTunerAllowFmp4 => 'Leisti fMP4 perkodavimo konteinerį';

  @override
  String get adminTunerAllowStreamSharing => 'Leisti bendrinti srautą';

  @override
  String get adminTunerEnableStreamLooping => 'Įjungti srauto kartojimą';

  @override
  String get adminTunerIgnoreDts => 'Nepaisyti DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Skaityti įvestį natūraliu kadrų dažniu';

  @override
  String get adminEditProvider => 'Redaguoti tiekėją';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Failas arba URL';

  @override
  String get adminXmltvMoviePrefix => 'Filmų prefiksas';

  @override
  String get adminXmltvMovieCategories => 'Filmų kategorijos';

  @override
  String get adminXmltvCategoriesHelp =>
      'Kelias kategorijas atskirkite vertikaliu brūkšniu.';

  @override
  String get adminXmltvKidsCategories => 'Vaikų kategorijos';

  @override
  String get adminXmltvNewsCategories => 'Naujienų kategorijos';

  @override
  String get adminXmltvSportsCategories => 'Sporto kategorijos';

  @override
  String get adminSdUsername => 'Naudotojo vardas';

  @override
  String get adminSdPassword => 'Slaptažodis';

  @override
  String get adminSdCountry => 'Šalis';

  @override
  String get adminSdCountrySelect => 'Pasirinkite šalį';

  @override
  String get adminSdPostalCode => 'Pašto kodas';

  @override
  String get adminSdGetListings => 'Gauti sąrašus';

  @override
  String get adminSdListings => 'Sąrašai';

  @override
  String get adminEnableAllTuners => 'Įjungti visus imtuvus';

  @override
  String get adminTunerType => 'Tunerio tipas';

  @override
  String get adminTunerAdded => 'Pridėtas derintuvas';

  @override
  String adminTunerAddFailed(String error) {
    return 'Nepavyko pridėti imtuvo: $error';
  }

  @override
  String get adminAddGuideProvider => 'Pridėti vadovo teikėją';

  @override
  String get adminProviderType => 'Teikėjo tipas';

  @override
  String get adminProviderAdded => 'Teikėjas pridėtas';

  @override
  String adminProviderAddFailed(String error) {
    return 'Nepavyko pridėti teikėjo: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Nepavyko pašalinti imtuvo: $error';
  }

  @override
  String get adminTunerResetRequested => 'Prašyta iš naujo nustatyti imtuvą';

  @override
  String adminTunerResetFailed(String error) {
    return 'Nepavyko iš naujo nustatyti imtuvo: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Šio tipo imtuvas nepalaiko atstatymo.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Nepavyko pašalinti teikėjo: $error';
  }

  @override
  String get adminRecordingSettings => 'Įrašymo nustatymai';

  @override
  String get adminPrePadding => 'Išankstinis užpildymas (min.)';

  @override
  String get adminPostPadding => 'Papildomas užpildymas (minutės)';

  @override
  String get adminRecordingPath => 'Įrašymo kelias';

  @override
  String get adminSeriesRecordingPath => 'Serijos įrašymo kelias';

  @override
  String get adminMovieRecordingPath => 'Filmų įrašymo kelias';

  @override
  String get adminGuideDays => 'Gido duomenų dienos';

  @override
  String get adminGuideDaysAuto => 'Automatiškai';

  @override
  String adminGuideDaysValue(int days) {
    return '$days d.';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Papildomo apdorojimo programos kelias';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Papildomo apdorojimo argumentai';

  @override
  String get adminSaveRecordingNfo => 'Įrašyti įrašų NFO metaduomenis';

  @override
  String get adminSaveRecordingImages => 'Įrašyti įrašų vaizdus';

  @override
  String get adminLiveTvSectionTiming => 'Laikas';

  @override
  String get adminLiveTvSectionPaths => 'Įrašymo keliai';

  @override
  String get adminLiveTvSectionPostProcessing => 'Papildomas apdorojimas';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Gido duomenys: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Įrašymo nustatymai išsaugoti';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nepavyko išsaugoti nustatymų: $error';
  }

  @override
  String get adminSetChannelMappings => 'Nustatykite kanalų atvaizdavimą';

  @override
  String get adminMappingJson => 'JSON atvaizdavimas';

  @override
  String get adminMappingJsonHint =>
      'Pavyzdys: JSON naudingosios apkrovos susiejimas';

  @override
  String get adminChannelMappingsUpdated => 'Atnaujinti kanalų atvaizdai';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Nepavyko atnaujinti atvaizdų: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nepavyko įkelti tiesioginės TV administravimo';

  @override
  String get adminTunerDevices => 'Tuner įrenginiai';

  @override
  String get adminNoTunerHosts => 'Nekonfigūruota derintuvo priegloba';

  @override
  String get adminGuideProviders => 'Vadovų teikėjai';

  @override
  String get adminRefreshGuideData => 'Atnaujinti gido duomenis';

  @override
  String get adminGuideRefreshStarted => 'Pradėtas gido duomenų atnaujinimas';

  @override
  String get adminGuideRefreshUnavailable =>
      'Gido atnaujinimo užduotis šiame serveryje nepasiekiama.';

  @override
  String get adminAddProvider => 'Pridėti teikėją';

  @override
  String get adminNoListingProviders => 'Nėra sukonfigūruotų sąrašų teikėjų';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Įrašymo kelias: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Serijos kelias: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Išankstinis užpildymas: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Papildomas užpildymas: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Derintuvo atradimas';

  @override
  String get adminChannelMappings => 'Kanalų atvaizdavimas';

  @override
  String get adminNoDiscoveredTuners => 'Dar nėra atrastų derintuvų';

  @override
  String get adminSettingsSaved => 'Nustatymai išsaugoti';

  @override
  String get adminBackupsNotAvailable =>
      'Šioje serverio versijoje atsarginės kopijos nepasiekiamos.';

  @override
  String get adminRestoreWarning1 =>
      'Atkūrus VISUS esamus serverio duomenis pakeis atsarginės kopijos duomenys.';

  @override
  String get adminRestoreWarning2 =>
      'Esami serverio nustatymai, vartotojai ir bibliotekos duomenys bus perrašyti.';

  @override
  String get adminRestoreWarning3 =>
      'Po atkūrimo serveris bus paleistas iš naujo.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Atkurti atsarginę kopiją $name dabar?';
  }

  @override
  String get adminRestoreRequested =>
      'Prašyta atkurti. Serverio paleidimas iš naujo gali atjungti šią sesiją.';

  @override
  String get adminBackupsTitle => 'Atsarginės kopijos';

  @override
  String get adminUnknownDate => 'Nežinoma data';

  @override
  String get adminUnnamedBackup => 'Nepavadinta atsarginė kopija';

  @override
  String get adminLiveTvNotAvailable =>
      'Tiesioginės TV administravimas šioje serverio versijoje negalimas.';

  @override
  String get adminLiveTvTitle => 'Tiesioginės televizijos administravimas';

  @override
  String get adminApply => 'Taikyti';

  @override
  String get adminNotSet => 'Nenustatyta';

  @override
  String get adminReset => 'Atstatyti';

  @override
  String get adminLogsTitle => 'Serverio žurnalai';

  @override
  String get adminLogsNewestFirst => 'Naujausi pirmiausia';

  @override
  String get adminLogsOldestFirst => 'Seniausi Pirma';

  @override
  String get adminLogsJustNow => 'Tik dabar';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes@min';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours@h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d prieš';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Nepavyko įkelti $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count atitinka';
  }

  @override
  String get adminLogViewerNoMatches => 'Nėra atitinkančių eilučių';

  @override
  String get adminMetadataEditorTitle => 'Metaduomenų redaktorius';

  @override
  String get adminMetadataIdentify => 'Identifikuoti';

  @override
  String get adminMetadataType => 'Tipas';

  @override
  String get adminMetadataDetails => 'Detalės';

  @override
  String get adminMetadataExternalIds => 'Išoriniai ID';

  @override
  String get adminMetadataImages => 'Vaizdai';

  @override
  String get adminMetadataFieldTitle => 'Pavadinimas';

  @override
  String get adminMetadataFieldSortTitle => 'Rūšiuoti pavadinimą';

  @override
  String get adminMetadataFieldOriginalTitle => 'Originalus pavadinimas';

  @override
  String get adminMetadataFieldPremiereDate => 'Premjeros data (MMMM-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Pabaigos data (MMMM-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Gamybos metai';

  @override
  String get adminMetadataFieldOfficialRating => 'Oficialus įvertinimas';

  @override
  String get adminMetadataFieldCommunityRating => 'Bendrijos reitingas';

  @override
  String get adminMetadataFieldCriticRating => 'Kritikų įvertinimas';

  @override
  String get adminMetadataFieldTagline => 'Žymės eilutė';

  @override
  String get adminMetadataFieldOverview => 'Apžvalga';

  @override
  String get adminMetadataGenres => 'Žanrai';

  @override
  String get adminMetadataTags => 'Žymos';

  @override
  String get adminMetadataStudios => 'Studijos';

  @override
  String get adminMetadataPeople => 'Žmonės';

  @override
  String get adminMetadataAddGenre => 'Pridėti žanrą';

  @override
  String get adminMetadataAddTag => 'Pridėti žymą';

  @override
  String get adminMetadataAddStudio => 'Pridėti studiją';

  @override
  String get adminMetadataAddPerson => 'Pridėti asmenį';

  @override
  String get adminMetadataEditPerson => 'Redaguoti asmenį';

  @override
  String get adminMetadataRole => 'Vaidmuo';

  @override
  String get adminMetadataImagePrimary => 'Pirminis';

  @override
  String get adminMetadataImageBackdrop => 'Fonas';

  @override
  String get adminMetadataImageLogo => 'Logotipas';

  @override
  String get adminMetadataImageBanner => 'Reklamjuostė';

  @override
  String get adminMetadataImageThumb => 'Nykštys';

  @override
  String get adminMetadataRecursive => 'Rekursyvus';

  @override
  String get adminMetadataProvider => 'Teikėjas';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType vaizdas atnaujintas';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType vaizdas įkeltas';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType vaizdas ištrintas';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Nepavyko atsisiųsti vaizdo: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Nepavyko nuskaityti pasirinkto vaizdo';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Nepavyko įkelti vaizdo: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Ištrinti $imageType vaizdą';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Taip iš elemento pašalinamas dabartinis vaizdas.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nepavyko ištrinti vaizdo: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Pasirinkite $imageType vaizdą';
  }

  @override
  String get adminMetadataUpload => 'Įkelti';

  @override
  String get adminMetadataUpdate => 'Atnaujinti';

  @override
  String get adminMetadataRemoteImage => 'Nuotolinis vaizdas';

  @override
  String get adminPluginsInstalled => 'Įdiegta';

  @override
  String get adminPluginsCatalog => 'Katalogas';

  @override
  String get adminPluginsActive => 'Aktyvus';

  @override
  String get adminPluginsRestart => 'Paleisti iš naujo';

  @override
  String get adminPluginsNoSearchResults =>
      'Nėra jūsų paiešką atitinkančių papildinių';

  @override
  String get adminPluginsNoneInstalled => 'Įskiepių nėra įdiegta';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Galimas atnaujinimas: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Galimas atnaujinimas';

  @override
  String get adminPluginsPendingRemoval =>
      'Laukiama pašalinimo po paleidimo iš naujo';

  @override
  String get adminPluginsChangesPending => 'Pakeitimai laukia iš naujo';

  @override
  String get adminPluginsEnable => 'Įgalinti';

  @override
  String get adminPluginsDisable => 'Išjungti';

  @override
  String get adminPluginsInstallUpdate => 'Įdiekite naujinimą';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Įdiekite naujinimą (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nėra jūsų paiešką atitinkančių paketų';

  @override
  String get adminPluginsCatalogEmpty => 'Nėra jokių paketų';

  @override
  String adminPluginsInstalling(String name) {
    return '„$name“ diegiamas...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentinė integracija';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Papildinių nustatymų integravimas vis dar yra eksperimentinis. Kai kurie laukai arba maketai dar gali būti netinkamai pateikti.';

  @override
  String get adminPluginDetailToggle404 =>
      'Nepavyko perjungti papildinio. Serveriui nepavyko rasti šios papildinio versijos. Pabandykite atnaujinti papildinius, tada bandykite dar kartą.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Nepavyko perjungti papildinio. Norėdami gauti daugiau informacijos, patikrinkite serverio žurnalus.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Nustatymai';
  }

  @override
  String get adminPluginDetailDetails => 'Detalės';

  @override
  String get adminPluginDetailDeveloper => 'Kūrėjas';

  @override
  String get adminPluginDetailRepository => 'Saugykla';

  @override
  String get adminPluginDetailBundled => 'Supakuota';

  @override
  String get adminPluginDetailEnablePlugin => 'Įjungti papildinį';

  @override
  String get adminPluginDetailRestartRequired =>
      'Kad pakeitimai įsigaliotų, reikia iš naujo paleisti serverį.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Šis papildinys bus pašalintas iš naujo paleidus serverį.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Šis papildinys sugedo ir gali neveikti tinkamai.';

  @override
  String get adminPluginDetailNotSupported =>
      'Dabartinė serverio versija šio papildinio nepalaiko.';

  @override
  String get adminPluginDetailSuperseded =>
      'Šis papildinys buvo pakeistas naujesne versija.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Nepavyko įkelti saugyklų: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Pašalinti saugyklą';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Ar tikrai norite pašalinti „$name“?';
  }

  @override
  String get adminReposRemove => 'Pašalinti';

  @override
  String adminReposSaveFailed(String error) {
    return 'Nepavyko išsaugoti saugyklų: $error';
  }

  @override
  String get adminReposEmpty => 'Nėra sukonfigūruotų saugyklų';

  @override
  String get adminReposEmptySubtitle =>
      'Pridėkite saugyklą, kad galėtumėte naršyti galimus papildinius';

  @override
  String get adminReposUnnamed => '(be vardo)';

  @override
  String get adminReposEditTitle => 'Redaguoti saugyklą';

  @override
  String get adminReposAddTitle => 'Pridėti saugyklą';

  @override
  String get adminReposUrl => 'Saugyklos URL';

  @override
  String get adminReposNameHint => 'pvz. Jellyfin stabilus';

  @override
  String get adminPluginSettingsInvalidUrl => 'Netinkamas URL';

  @override
  String get adminGeneralSettingsTitle => 'Bendrieji nustatymai';

  @override
  String get adminGeneralMetadataLanguage => 'Pageidautina metaduomenų kalba';

  @override
  String get adminGeneralMetadataLanguageHint => 'pvz. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Pageidaujama metaduomenų šalis';

  @override
  String get adminGeneralMetadataCountryHint => 'pvz. JAV, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Bibliotekos nuskaitymas vienu metu';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Lygiagrečios vaizdo kodavimo riba';

  @override
  String get adminUnknownError => 'Nežinoma klaida';

  @override
  String get adminBrowse => 'Naršyti';

  @override
  String get adminCloseBrowser => 'Uždaryti naršyklę';

  @override
  String get adminNetworkingTitle => 'Tinklo kūrimas';

  @override
  String get adminNetworkingRestartWarning =>
      'Dėl tinklo nustatymų pakeitimų gali tekti iš naujo paleisti serverį.';

  @override
  String get adminNetworkingRemoteAccess => 'Įgalinti nuotolinę prieigą';

  @override
  String get adminNetworkingPorts => 'Uostai';

  @override
  String get adminNetworkingHttpPort => 'HTTP prievadas';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS prievadas';

  @override
  String get adminNetworkingEnableHttps => 'Įgalinti HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Vietinis tinklas';

  @override
  String get adminNetworkingLocalAddresses => 'Vietinio tinklo adresai';

  @override
  String get adminNetworkingAddressHint => 'pvz. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Žinomi įgaliotieji serveriai';

  @override
  String get adminNetworkingProxyHint => 'pvz. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Baltasis sąrašas';

  @override
  String get adminNetworkingBlacklist => 'Juodasis sąrašas';

  @override
  String get adminNetworkingAddEntry => 'Pridėti įrašą';

  @override
  String get adminBrandingTitle => 'Prekės ženklas';

  @override
  String get adminBrandingLoginDisclaimer => 'Prisijungimo atsisakymas';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML rodomas po prisijungimo forma';

  @override
  String get adminBrandingCustomCss => 'Tinkintas CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Tinkintas CSS, pritaikytas žiniatinklio sąsajai';

  @override
  String get adminBrandingEnableSplash => 'Įgalinti prisilietimo ekraną';

  @override
  String get adminBrandingSplashUpload => 'Įkelti vaizdą';

  @override
  String get adminBrandingSplashUploaded => 'Pasveikinimo ekranas atnaujintas';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Nepavyko įkelti pasveikinimo ekrano';

  @override
  String get adminBrandingSplashDeleted => 'Pasveikinimo ekranas pašalintas';

  @override
  String get adminBrandingNoSplash => 'Pasirinktinio pasveikinimo ekrano nėra';

  @override
  String get adminPlaybackHwAccel => 'Aparatinės įrangos pagreitis';

  @override
  String get adminPlaybackHwAccelLabel => 'Aparatinis pagreitis';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Įgalinti aparatinės įrangos kodavimą';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Įgalinti aparatinės įrangos dekodavimą:';

  @override
  String get adminPlaybackQsvDevice => 'QSV įrenginys';

  @override
  String get adminPlaybackEnhancedNvdec => 'Įjungti patobulintą NVDEC dekoderį';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Teikti pirmenybę sistemos aparatiniam dekoderiui';

  @override
  String get adminPlaybackColorDepth => 'Aparatinio dekodavimo spalvų gylis';

  @override
  String get adminPlaybackColorDepth10Hevc => '10 bitų HEVC dekodavimas';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10 bitų VP9 dekodavimas';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10 bitų dekodavimas';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC RExt 12 bitų dekodavimas';

  @override
  String get adminPlaybackHwEncodingSection => 'Aparatinis kodavimas';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Leisti HEVC kodavimą';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Leisti AV1 kodavimą';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Įjungti Intel mažos galios H.264 koduotuvą';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Įjungti Intel mažos galios HEVC koduotuvą';

  @override
  String get adminPlaybackToneMapping => 'Tonų atvaizdavimas';

  @override
  String get adminPlaybackEnableTonemapping => 'Įjungti tonų atvaizdavimą';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Įjungti VPP tonų atvaizdavimą';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Įjungti VideoToolbox tonų atvaizdavimą';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Tonų atvaizdavimo algoritmas';

  @override
  String get adminPlaybackTonemappingMode => 'Tonų atvaizdavimo režimas';

  @override
  String get adminPlaybackTonemappingRange => 'Tonų atvaizdavimo diapazonas';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Tonų atvaizdavimo sodrumo mažinimas';

  @override
  String get adminPlaybackTonemappingPeak => 'Tonų atvaizdavimo pikas';

  @override
  String get adminPlaybackTonemappingParam => 'Tonų atvaizdavimo parametras';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP tonų atvaizdavimo ryškumas';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP tonų atvaizdavimo kontrastas';

  @override
  String get adminPlaybackPresetsQuality => 'Šablonai ir kokybė';

  @override
  String get adminPlaybackEncoderPreset => 'Koduotuvo šablonas';

  @override
  String get adminPlaybackH264Crf => 'H.264 kodavimo CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) kodavimo CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Eilučių išpynimo metodas';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Dvigubinti kadrų dažnį išpinant eilutes';

  @override
  String get adminPlaybackAudioSection => 'Garsas';

  @override
  String get adminPlaybackEnableAudioVbr => 'Įjungti garso VBR kodavimą';

  @override
  String get adminPlaybackDownmixBoost => 'Garso sumaišymo stiprinimas';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo sumaišymo algoritmas';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Didžiausias multipleksavimo eilės dydis';

  @override
  String get adminPlaybackAutoOption => 'Automatiškai';

  @override
  String get adminPlaybackEncoding => 'Kodavimas';

  @override
  String get adminPlaybackEncodingThreads => 'Kodavimo gijos';

  @override
  String get adminPlaybackFallbackFont => 'Įgalinti atsarginį šriftą';

  @override
  String get adminPlaybackFallbackFontPath => 'Atsarginis šrifto kelias';

  @override
  String get adminPlaybackStreaming => 'Srautinis perdavimas';

  @override
  String get adminResumeVideo => 'Vaizdo įrašas';

  @override
  String get adminResumeAudiobooks => 'Garsinės knygos';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimalus garso knygos atnaujinimo procentas';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Didžiausias garso knygos atnaujinimo procentas';

  @override
  String get adminStreamingBitrateLimit =>
      'Nuotolinio kliento pralaidumo riba (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Palikite tuščią arba 0 neribotam';

  @override
  String get adminTrickplayHwAccel => 'Įgalinti aparatinės įrangos pagreitį';

  @override
  String get adminTrickplayHwEncoding => 'Įgalinti aparatinės įrangos kodavimą';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Įgalinti tik rakto rėmelio ištraukimą';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Greitesnis, bet mažesnis tikslumas';

  @override
  String get adminTrickplayNonBlocking => 'Neblokuojantis';

  @override
  String get adminTrickplayBlocking => 'Blokavimas';

  @override
  String get adminTrickplayPriorityHigh => 'Aukštas';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Virš normalaus';

  @override
  String get adminTrickplayPriorityNormal => 'Normalus';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Žemiau įprastos';

  @override
  String get adminTrickplayPriorityIdle => 'Tuščia eiga';

  @override
  String get adminTrickplayImageSettings => 'Vaizdo nustatymai';

  @override
  String get adminTrickplayInterval => 'Intervalas (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Kaip dažnai fiksuoti kadrus';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Kableliais atskirtų taškų plotis (pvz., 320)';

  @override
  String get adminTrickplayQuality => 'Kokybė';

  @override
  String get adminTrickplayQScale => 'Kokybės skalė';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Mažesnės reikšmės = geresnė kokybė, didesni failai';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kokybė';

  @override
  String get adminTrickplayProcessing => 'Apdorojimas';

  @override
  String get adminTasksEmpty => 'Suplanuotų užduočių nerasta';

  @override
  String get adminTasksNoFilterMatch =>
      'Nėra užduočių, atitinkančių dabartinį filtrą';

  @override
  String get adminTaskCancelling => 'Atšaukiama...';

  @override
  String get adminTaskRunning => 'Bėga...';

  @override
  String get adminTaskNeverRun => 'Niekada nebėgioti';

  @override
  String get adminTaskStop => 'Stabdyti';

  @override
  String get adminRunningTasks => 'Vykdomos užduotys';

  @override
  String get adminTaskRun => 'Bėk';

  @override
  String get adminTaskDetailLastExecution => 'Paskutinis vykdymas';

  @override
  String get adminTaskDetailStarted => 'Prasidėjo';

  @override
  String get adminTaskDetailEnded => 'Baigėsi';

  @override
  String get adminTaskDetailDuration => 'Trukmė';

  @override
  String get adminTaskDetailErrorLabel => 'Klaida:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Kasdien $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Kiekvieną $day $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Kas $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Paleidus programą';

  @override
  String get adminTaskTriggerTypeDaily => 'Kasdien';

  @override
  String get adminTaskTriggerTypeWeekly => 'Kas savaitę';

  @override
  String get adminTaskTriggerTypeInterval => 'Per intervalą';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervalas';

  @override
  String get adminTaskTriggerEveryHour => 'Kas valandą';

  @override
  String get adminTaskTriggerEvery6Hours => 'Kas 6 valandas';

  @override
  String get adminTaskTriggerEvery12Hours => 'Kas 12 valandų';

  @override
  String get adminTaskTriggerEvery24Hours => 'Kas 24 valandas';

  @override
  String get adminTaskTriggerEvery2Days => 'Kas 2 dienas';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valandų',
      many: '$count valandos',
      few: '$count valandos',
      one: '$count valanda',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Laikas';

  @override
  String get adminTaskTriggerNoLimit => 'Nėra limito';

  @override
  String get adminActivityJustNow => 'Tik dabar';

  @override
  String get adminActivityLastHour => 'Paskutinė valanda';

  @override
  String get adminActivityToday => 'Šiandien';

  @override
  String get adminActivityYesterday => 'vakar';

  @override
  String get adminActivityOlder => 'Vyresni';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d prieš';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours@h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes@min';
  }

  @override
  String get adminActivityNow => 'dabar';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min.';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours val.';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days d.';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month-$day';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigūruokite „Trickplay“ vaizdo generavimą, kad galėtumėte peržiūrėti peržiūros miniatiūras.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Viešas HTTPS prievadas';

  @override
  String get adminNetworkingBaseUrl => 'Bazinis URL';

  @override
  String get adminNetworkingBaseUrlHint => 'pvz. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Viešasis HTTP prievadas';

  @override
  String get adminNetworkingRequireHttps => 'Reikalauti HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Nukreipti visas nuotolines užklausas į HTTPS. Neveikia, jei serveris neturi galiojančio sertifikato.';

  @override
  String get adminNetworkingCertPassword => 'Sertifikato slaptažodis';

  @override
  String get adminNetworkingIpSettings => 'IP nustatymai';

  @override
  String get adminNetworkingEnableIpv4 => 'Įjungti IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Įjungti IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Įjungti automatinį prievadų susiejimą';

  @override
  String get adminNetworkingLocalSubnets => 'LAN tinklai';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Kableliais arba naujomis eilutėmis atskirtų IP adresų ar CIDR potinklių sąrašas, laikomas vietiniu tinklu.';

  @override
  String get adminNetworkingPublishedUris => 'Paskelbti serverio URI';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Susiekite potinklį ar adresą su paskelbtu URL, pvz. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Sertifikato kelias';

  @override
  String get adminNetworkingRemoteIpFilter => 'Nuotolinis IP filtras';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Nuotolinis IP filtras';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API įrenginys';

  @override
  String get adminPlaybackAutomatic => '0 = automatinis';

  @override
  String get adminPlaybackTranscodeTempPath => 'Perkodavimo temp kelias';

  @override
  String get adminPlaybackSegmentDeletion => 'Leisti ištrinti segmentą';

  @override
  String get adminPlaybackSegmentKeep => 'Segmento išlaikymas (sekundėmis)';

  @override
  String get adminPlaybackThrottleBuffering => 'Droselio buferis';

  @override
  String get adminPlaybackThrottleDelay => 'Ribojimo delsa (sekundėmis)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Leisti išgauti subtitrus realiuoju laiku';

  @override
  String get adminResumeMinPct => 'Minimalus atnaujinimo procentas';

  @override
  String get adminResumeMinPctSubtitle =>
      'Turinys turi būti paleistas ilgiau nei šis procentas, kad būtų išsaugota pažanga';

  @override
  String get adminResumeMaxPct => 'Maksimalus atnaujinimo procentas';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Turinys laikomas visiškai paleistas po šio procento';

  @override
  String get adminResumeMinDuration =>
      'Minimali gyvenimo aprašymo trukmė (sekundėmis)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Prekės, trumpesnės nei ši, nėra atnaujinamos';

  @override
  String get adminTrickplayScanBehavior => 'Nuskaitymo elgsena';

  @override
  String get adminTrickplayProcessPriority => 'Proceso prioritetas';

  @override
  String get adminTrickplayTileWidth => 'Plytelių plotis';

  @override
  String get adminTrickplayTileHeight => 'Plytelių aukštis';

  @override
  String get adminTrickplayProcessThreads => 'Apdoroti gijas';

  @override
  String get adminTrickplayWidthResolutions => 'Pločio raiškos';

  @override
  String get adminMetadataDefault => 'Numatytoji';

  @override
  String get adminMetadataContentTypeUpdated => 'Turinio tipas atnaujintas';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Nepavyko atnaujinti turinio tipo: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Lėto atsako slenkstis (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Įjungti įspėjimus apie lėtą atsaką';

  @override
  String get adminGeneralQuickConnect => 'Įjungti Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Serveris';

  @override
  String get adminGeneralSectionMetadata => 'Metaduomenys';

  @override
  String get adminGeneralSectionPaths => 'Keliai';

  @override
  String get adminGeneralSectionPerformance => 'Našumas';

  @override
  String get adminGeneralCachePath => 'Talpyklos kelias';

  @override
  String get adminGeneralMetadataPath => 'Metaduomenų kelias';

  @override
  String get adminGeneralServerName => 'Serverio pavadinimas';

  @override
  String get adminGeneralDisplayLanguage => 'Pageidaujama rodymo kalba';

  @override
  String get adminSettingsLoadFailed => 'Nepavyko įkelti nustatymų';

  @override
  String get adminDiscover => 'Atrask';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Nepavyko atnaujinti atvaizdų: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Laiko limitas: $duration';
  }

  @override
  String get folders => 'Aplankai';

  @override
  String get libraries => 'Bibliotekos';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay išjungtas';

  @override
  String get syncPlayDisabledMessage =>
      'Nustatymuose įgalinkite „SyncPlay“, kad galėtumėte naudoti sinchronizuotą atkūrimą.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Serveris nepalaikomas';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay reikalingas Jellyfin serveris. Dabartinis serveris jo nepalaiko.';

  @override
  String get syncPlayGroupFallbackName => '„SyncPlay“ grupė';

  @override
  String get syncPlayGroupTooltip => '„SyncPlay“ grupė';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# dalyvių',
      many: '# dalyvio',
      few: '# dalyviai',
      one: '# dalyvis',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignoruoti laukimą';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Nelaikykite grupės iškeltos, kol šis įrenginys veikia buferyje';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Tęskite vietoje, nelaukdami lėtų narių';

  @override
  String get syncPlayRepeat => 'Pakartokite';

  @override
  String get syncPlayRepeatOne => 'Vienas';

  @override
  String get syncPlayShuffleModeShuffled => 'Sumaišytas';

  @override
  String get syncPlayShuffleModeSorted => 'Surūšiuota';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sinchronizuoti dabartinę atkūrimo eilę';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Pakeiskite grupės eilę tuo, kas leidžiama vietoje';

  @override
  String get syncPlayLeaveGroup => 'Išeiti iš grupės';

  @override
  String get syncPlayGroupQueue => 'Grupės eilė';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Elementas $index';
  }

  @override
  String get syncPlayPlayNow => 'Žaisti dabar';

  @override
  String get syncPlayCreateNewGroup => 'Sukurti naują grupę';

  @override
  String get syncPlayGroupName => 'Grupės pavadinimas';

  @override
  String get syncPlayDefaultGroupName => 'Mano „SyncPlay“ grupė';

  @override
  String get syncPlayCreateGroup => 'Sukurti grupę';

  @override
  String get syncPlayAvailableGroups => 'Galimos grupės';

  @override
  String get syncPlayNoGroupsAvailable => 'Nėra pasiekiamų grupių';

  @override
  String get syncPlayJoinGroupQuestion => 'Prisijungti prie SyncPlay grupės?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Prisijungimas prie „SyncPlay“ grupės gali pakeisti dabartinę atkūrimo eilę. Tęsti?';

  @override
  String get syncPlayJoin => 'Prisijunk';

  @override
  String get syncPlayStateIdle => 'Tuščia eiga';

  @override
  String get syncPlayStateWaiting => 'Laukia';

  @override
  String get syncPlayStatePaused => 'Pristabdyta';

  @override
  String get syncPlayStatePlaying => 'Žaidžia';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName prisijungė prie SyncPlay grupės';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName paliko SyncPlay grupę';
  }

  @override
  String get syncPlayAccessDeniedTitle => '„SyncPlay“ prieiga uždrausta';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Neturite prieigos prie vieno ar daugiau elementų šioje „SyncPlay“ grupėje. Paprašykite grupės savininko patvirtinti bibliotekos leidimus arba pasirinkti kitą eilę.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sinchronizuojamas atkūrimas su $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Paieška balsu nepasiekiama.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      '„Dolby Vision Direct Play“ nepavyko';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Nepavyko pradėti tiesioginio šio „Dolby Vision“ srauto atkūrimo. Bandyti dar kartą naudoti serverio perkodavimą?';

  @override
  String get retryWithTranscode => 'Bandykite dar kartą naudodami perkodavimą';

  @override
  String get dolbyVisionNotSupportedTitle => '„Dolby Vision“ nepalaikoma';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Šis įrenginys negali tiesiogiai iššifruoti „Dolby Vision“ turinio. Naudokite atsarginį HDR10 arba paprašykite serverio perkodavimo.';

  @override
  String get rememberMyChoice => 'Prisimink mano pasirinkimą';

  @override
  String get playHdr10Fallback => 'Leiskite atsarginę HDR10 versiją';

  @override
  String get requestTranscode => 'Prašyti perkoduoti';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'rasta # eilučių',
      many: 'rasta # eilutės',
      few: 'rastos # eilutės',
      one: 'rasta # eilutė',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Žiūrėti viską';

  @override
  String get noItems => 'Nėra elementų';

  @override
  String get switchUser => 'Perjungti vartotoją';

  @override
  String get remoteControl => 'Nuotolinio valdymo pultas';

  @override
  String get mediaBarLoading => 'Įkeliama medijos juosta...';

  @override
  String get mediaBarError => 'Medijos juostos nepavyko įkelti';

  @override
  String get offlineServerUnavailable =>
      'Prisijungta prie interneto, bet dabartinis serveris nepasiekiamas.';

  @override
  String get offlineNoInternet =>
      'Esate neprisijungęs. Galimas tik atsisiųstas turinys.';

  @override
  String get offlineFileNotAvailable => 'Failas nepasiekiamas';

  @override
  String get offlineSwitchServer => 'Perjungti serverį';

  @override
  String get offlineSavedMedia => 'Išsaugota laikmena';

  @override
  String get offlineBannerTitle => 'Esate neprisijungę';

  @override
  String get offlineBannerSubtitle => 'Rodomi jūsų atsisiuntimai';

  @override
  String get offlineBannerAction => 'Atsisiuntimai';

  @override
  String get serverUnreachableBannerTitle => 'Nepavyksta pasiekti serverio';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Kol serveris neveikia, leidžiama iš atsisiuntimų';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Nuotolinis atkūrimas';

  @override
  String castControlFailed(String error) {
    return 'Nepavyko valdyti perdavimo: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Valdikliai';
  }

  @override
  String get castDeviceVolume => 'Įrenginio garsumas';

  @override
  String get castVolumeUnavailable => 'Nepasiekiamas';

  @override
  String castStopKind(String kind) {
    return 'Sustabdyti $kind';
  }

  @override
  String get audioLabel => 'Garsas';

  @override
  String get subtitlesLabel => 'Subtitrai';

  @override
  String get pinConfirmTitle => 'Patvirtinkite PIN kodą';

  @override
  String get pinSetTitle => 'Nustatyti PIN kodą';

  @override
  String get pinEnterTitle => 'Įveskite PIN kodą';

  @override
  String get pinReenterToConfirm =>
      'Dar kartą įveskite PIN kodą, kad patvirtintumėte';

  @override
  String pinEnterNDigit(int length) {
    return 'Įveskite $length skaitmenų PIN kodą';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Įveskite $length skaitmenų PIN kodą';
  }

  @override
  String get pinIncorrect => 'Neteisingas PIN kodas';

  @override
  String get pinMismatch => 'PIN kodai nesutampa';

  @override
  String get pinForgot => 'Pamiršote PIN kodą?';

  @override
  String get pinClear => 'Išvalyti';

  @override
  String get pinBackspace => 'Naikinti';

  @override
  String get quickConnectAuthorized => 'Quick Connect užklausa patvirtinta.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect kodas neteisingas arba nebegalioja.';

  @override
  String get quickConnectNotSupported =>
      'Šis serveris nepalaiko Quick Connect.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Nepavyko patvirtinti Quick Connect kodo.';

  @override
  String get quickConnectDisabled => 'Šiame serveryje Quick Connect išjungtas.';

  @override
  String get quickConnectForbidden =>
      'Jūsų paskyra negali patvirtinti šios Quick Connect užklausos.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect kodas nerastas. Pabandykite naują kodą.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect nepavyko: $message';
  }

  @override
  String get quickConnectEnterCode => 'Įveskite kodą';

  @override
  String get quickConnectAuthorize => 'Įgalioti';

  @override
  String remoteCommandFailed(String error) {
    return 'Komanda nepavyko: $error';
  }

  @override
  String get remoteControlTitle => 'Nuotolinio valdymo pultas';

  @override
  String get remoteFailedToLoadSessions => 'Nepavyko įkelti seansų';

  @override
  String get remoteNoSessions => 'Jokių kontroliuojamų seansų';

  @override
  String get remoteStartPlayback => 'Pradėkite atkūrimą kitame įrenginyje';

  @override
  String get unknownUser => 'Nežinoma';

  @override
  String get unknownItem => 'Nežinoma';

  @override
  String get remoteNothingPlaying => 'Šioje sesijoje nieko negroja';

  @override
  String get castingStarted => 'Perdavimas pradėtas pasirinktame įrenginyje';

  @override
  String castingFailed(String error) {
    return 'Nepavyko pradėti perdavimo: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nėra pasiekiamų nuotolinio atkūrimo įrenginių.';

  @override
  String get noRemoteDevicesIos =>
      'Nėra pasiekiamų nuotolinio atkūrimo įrenginių.\n\nJei naudojate „iOS“, „AirPlay“ taikiniai simuliatoriuje gali būti nepasiekiami.';

  @override
  String get trackActionPlayNext => 'Žaisti toliau';

  @override
  String get trackActionAddToQueue => 'Pridėti į eilę';

  @override
  String get trackActionAddToPlaylist => 'Pridėti prie grojaraščio';

  @override
  String get trackActionCancelDownload => 'Atšaukti atsisiuntimą';

  @override
  String get trackActionDeleteFromPlaylist => 'Ištrinti iš grojaraščio';

  @override
  String get trackActionMoveUp => 'Judėti aukštyn';

  @override
  String get trackActionMoveDown => 'Judėti žemyn';

  @override
  String get trackActionRemoveFromFavorites => 'Pašalinti iš parankinių';

  @override
  String get trackActionAddToFavorites => 'Pridėti prie mėgstamiausių';

  @override
  String get trackActionGoToAlbum => 'Eiti į albumą';

  @override
  String get trackActionGoToArtist => 'Eikite į atlikėją';

  @override
  String trackActionDownloading(String name) {
    return 'Atsisiunčiama $name...';
  }

  @override
  String get trackActionDeletedFile => 'Ištrintas atsisiųstas failas';

  @override
  String get trackActionDeleteFileFailed =>
      'Nepavyko ištrinti atsisiųsto failo';

  @override
  String get shuffleBy => 'Maišyti pagal';

  @override
  String get shuffleSelectLibrary => 'Pasirinkite Biblioteka';

  @override
  String get shuffleSelectGenre => 'Pasirinkite Žanras';

  @override
  String get shuffleLibrary => 'Biblioteka';

  @override
  String get shuffleGenre => 'Žanras';

  @override
  String get shuffleNoLibraries => 'Nėra suderinamų bibliotekų.';

  @override
  String get shuffleNoGenres => 'Šiam maišymo režimui nerasta jokių žanrų.';

  @override
  String get posterDisplayTitle => 'Ekranas';

  @override
  String get posterImageType => 'Vaizdo tipas';

  @override
  String get imageTypePoster => 'Plakatas';

  @override
  String get imageTypeThumbnail => 'Miniatiūra';

  @override
  String get imageTypeBanner => 'Reklamjuostė';

  @override
  String get playlistAddFailed => 'Nepavyko pridėti prie grojaraščio';

  @override
  String get playlistCreateFailed => 'Nepavyko sukurti grojaraščio';

  @override
  String get playlistNew => 'Naujas grojaraštis';

  @override
  String get playlistCreate => 'Sukurti';

  @override
  String get playlistCreateNew => 'Sukurti naują grojaraštį';

  @override
  String get playlistNoneFound => 'Nerasta jokių grojaraščių';

  @override
  String get addToPlaylist => 'Pridėti prie grojaraščio';

  @override
  String get lyricsNotAvailable => 'Dainų žodžių nėra';

  @override
  String get upNext => 'Aukštyn Kitas';

  @override
  String get playNext => 'Žaisti toliau';

  @override
  String get stillWatchingContent =>
      'Atkūrimas buvo pristabdytas. Ar vis dar žiūrite?';

  @override
  String get stillWatchingStop => 'Stabdyti';

  @override
  String get stillWatchingContinue => 'Tęsti';

  @override
  String skipSegment(String segment) {
    return 'Praleisti $segment';
  }

  @override
  String get liveTv => 'Tiesioginė televizija';

  @override
  String get continueWatchingAndNextUp => 'Žiūrėti toliau ir toliau';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Atsisiunčiama $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Atsisiunčiama $fileName';
  }

  @override
  String get nextEpisode => 'Kitas Epizodas';

  @override
  String get moreFromThisSeason => 'Daugiau iš šio sezono';

  @override
  String get playerTooltipPlaybackSpeed => 'Atkūrimo greitis';

  @override
  String get playerTooltipCastControls => 'Cast valdikliai';

  @override
  String get playerTooltipPlaybackQuality => 'Bitų sparta';

  @override
  String get playerTooltipEnterFullscreen => 'Įeikite per visą ekraną';

  @override
  String get playerTooltipExitFullscreen => 'Išeikite per visą ekraną';

  @override
  String get playerTooltipFloatOnTop => 'Plūduriuoti ant viršaus';

  @override
  String get playerTooltipExitFloatOnTop => 'Išjungti plūdę viršuje';

  @override
  String get playerTooltipLockLandscape => 'Užrakinti kraštovaizdį';

  @override
  String get playerTooltipUnlockOrientation => 'Leisti suktis';

  @override
  String get playerTooltipPrevious => 'Ankstesnis';

  @override
  String get playerTooltipSeekBack => 'Ieškok atgal';

  @override
  String get playerTooltipSeekForward => 'Siekite pirmyn';

  @override
  String get contextMenuMarkWatched => 'Pažymėti kaip žiūrėtą';

  @override
  String get contextMenuMarkUnwatched => 'Pažymėti kaip nežiūrėtą';

  @override
  String get contextMenuAddToFavorites => 'Pridėti prie mėgstamiausių';

  @override
  String get contextMenuRemoveFromFavorites => 'Pašalinti iš parankinių';

  @override
  String get contextMenuGoToSeries => 'Eikite į seriją';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Slėpti iš „Tęsti žiūrėjimą“';

  @override
  String get contextMenuHideFromNextUp => 'Slėpti iš „Toliau“';

  @override
  String get contextMenuAddToCollection => 'Pridėti į rinkinį';

  @override
  String get settingsAdministrationSubtitle =>
      'Prisijunkite prie serverio administravimo skydelio';

  @override
  String get settingsAccountSecurity => 'Paskyra ir sauga';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentifikavimas, PIN kodas ir tėvų kontrolė';

  @override
  String get settingsPersonalization => 'Personalizavimas';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, naršymas, pagrindinės eilutės ir bibliotekos matomumas';

  @override
  String get settingsDynamicContent => 'Dinaminis turinys';

  @override
  String get settingsDynamicContentSubtitle =>
      'Medijos juosta ir vaizdinės perdangos';

  @override
  String get settingsPlaybackSyncplay => 'Atkūrimas ir SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Garso / vaizdo nustatymai, subtitrai, atsisiuntimai ir „SyncPlay“ valdikliai';

  @override
  String get settingsIntegrationsSubtitle =>
      'Papildinio sinchronizavimas, „Seerr“, įvertinimai ir kt';

  @override
  String get settingsAboutSubtitle =>
      'Programos versija, teisinė informacija ir kreditai';

  @override
  String get settingsAuthenticationSection => 'AUTENTIKAVIMAS';

  @override
  String get settingsSortServersBy => 'Rūšiuoti serverius pagal';

  @override
  String get settingsLastUsed => 'Paskutinį kartą naudotas';

  @override
  String get settingsAlphabetical => 'Abėcėlinis';

  @override
  String get settingsConnectionSection => 'RYŠYS';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Leisti savarankiškai pasirašytus sertifikatus';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Pasitikėti serveriais, naudojančiais savarankiškai pasirašytus arba privačios CA TLS sertifikatus. Įjunkite tik savo valdomiems serveriams. Tai išjungia sertifikatų tikrinimą visiems ryšiams.';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVATUMAS IR SAUGA';

  @override
  String get settingsBlockedRatings => 'Užblokuoti įvertinimai';

  @override
  String get settingsGeneralStyle => 'Bendras stilius';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Teminiai akcentai, fonai, žiūrimi indikatoriai ir teminė muzika';

  @override
  String get settingsDetailsScreen => 'Išsamios informacijos ekranas';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Stilius, fono suliejimas ir skirtukų veikimas';

  @override
  String get settingsHomePage => 'Pagrindinis puslapis';

  @override
  String get settingsHomePageSubtitle =>
      'Skyriai, vaizdų tipai, perdangos ir medijos peržiūros';

  @override
  String get settingsLibrariesSubtitle =>
      'Bibliotekos matomumas, aplankų rodinys ir kelių serverių veikimas';

  @override
  String get settingsTwentyFourHourClock => '24 valandų laikrodis';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Visur, kur rodomas laikrodis, naudokite 24 valandų laiko formatavimą';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Rodyti maišymo mygtuką naršymo juostoje';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Rodyti žanrų mygtuką naršymo juostoje';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Rodyti parankinių mygtuką naršymo juostoje';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Rodyti bibliotekų mygtuką naršymo juostoje';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Rodyti Seerr mygtuką naršymo juostoje';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Visada rodyti tekstinius pavadinimus viršutinėje naršymo juostoje';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Perjungti pagrindinio puslapio matomumą pagal biblioteką. Iš naujo paleiskite „Moonfin“, kad pakeitimai įsigaliotų.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Medijos juosta ir vietinės peržiūros';

  @override
  String get settingsVisualOverlays => 'Vaizdinės perdangos';

  @override
  String get settingsSeasonalSurprise => 'Sezoninė staigmena';

  @override
  String get settingsMetadataAndRatings => 'Metaduomenys ir įvertinimai';

  @override
  String get settingsPluginScreenDescription =>
      '„Moonbase“ teikia serverio integraciją, įskaitant papildomus įvertinimo šaltinius, „Seerr“ užklausas ir sinchronizuojamas nuostatas.';

  @override
  String get settingsOfflineDownloads => 'Atsisiuntimai neprisijungus';

  @override
  String get settingsHigh => 'Aukštas';

  @override
  String get settingsLow => 'Žemas';

  @override
  String get settingsCustomPath => 'Pasirinktinis kelias';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Įveskite atsisiuntimo aplanko kelią';

  @override
  String get settingsConcurrentDownloads =>
      'Vienu metu vykstantys atsisiuntimai';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Didžiausias vienu metu atsisiunčiamų elementų skaičius.';

  @override
  String get settingsAppInfo => 'PROGRAMOS INFORMACIJA';

  @override
  String get settingsReportAnIssue => 'Pranešti apie problemą';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Atidarykite problemų stebėjimo priemonę „GitHub“.';

  @override
  String get settingsJoinDiscord => 'Prisijunkite prie „Discord“.';

  @override
  String get settingsJoinDiscordSubtitle => 'Kalbėkitės su bendruomene';

  @override
  String get settingsJoinTheDiscord => 'Prisijunkite prie Discord';

  @override
  String get settingsSupportMoonfin => 'Palaikykite Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Pavaišinkite kūrėją kava';

  @override
  String get settingsLegal => 'TEISINĖ';

  @override
  String get settingsLicenses => 'Licencijos';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Atvirojo kodo licencijos pranešimai';

  @override
  String get settingsPrivacyPolicy => 'Privatumo politika';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Kaip Moonfin tvarko jūsų duomenis';

  @override
  String get settingsCheckForUpdates => 'Patikrinkite, ar nėra atnaujinimų';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Patikrinkite naujausią „Moonfin“ leidimą';

  @override
  String get settingsPoweredByFlutter => 'Maitinamas Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# licencijos pranešimų',
      many: '# licencijos pranešimo',
      few: '# licencijos pranešimai',
      one: '# licencijos pranešimas',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Abu';

  @override
  String get settingsShuffleContentTypeFilter => 'Maišyti turinio tipo filtras';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Vaizdo įrašų atkūrimo nuostatos';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Pagrindiniai vaizdo įrašų variklio ir srautinio perdavimo kokybės nustatymai';

  @override
  String get settingsAudioPreferences => 'Garso nuostatos';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Garso takeliai, apdorojimas ir perdavimo parinktys';

  @override
  String get settingsAutomationAndQueue => 'Automatika ir eilė';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatizuotas atkūrimas ir seka';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Atsisiuntimo kokybė, saugyklos apribojimai ir eilės dydis';

  @override
  String get settingsSyncplaySubtitle =>
      'Grupinių užsiėmimų sinchronizavimo logika';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Specializuotos grotuvo savybės. Naudokite atsargiai, nes kai kurios parinktys gali sukelti atkūrimo problemų';

  @override
  String get settingsSkipIntrosAndOutros => 'Praleisti įžangas ir pabaigas?';

  @override
  String get settingsMediaSegmentCountdown =>
      'Medijos segmento atgalinis skaičiavimas';

  @override
  String get settingsProgressBar => 'Eigos juosta';

  @override
  String get settingsTimer => 'Laikmatis';

  @override
  String get settingsNone => 'Nėra';

  @override
  String get settingsPromptUser => 'Raginti vartotoją';

  @override
  String get settingsSkip => 'Praleisti';

  @override
  String get settingsDoNothing => 'Nieko nedaryti';

  @override
  String get settingsMaxBitrateDescription =>
      'Apribokite srautinio perdavimo pralaidumą. Turinys, viršijantis šį slenkstį, bus perkoduotas, kad tilptų.';

  @override
  String get settingsMaxResolutionDescription =>
      'Apribokite maksimalią raišką, kurios žaidėjas paprašys. Didesnės raiškos turinys bus perkoduotas žemyn.';

  @override
  String get settingsPlayerZoomDescription =>
      'Kaip vaizdo įrašas turėtų būti pakeistas, kad tilptų ekrane.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Atkūrimo variklis („Android TV“)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Pasirinkite numatytąjį atkūrimo variklį „Android TV“ įrenginiuose. Pakeitimai taikomi kitai atkūrimo sesijai.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (rekomenduojama)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (senas)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (palikimas)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (rekomenduojama)';

  @override
  String get settingsDolbyVisionFallback =>
      '„Dolby Vision“ atsarginis variantas';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision pavadinimų elgsena įrenginiuose be Dolby Vision dekodavimo.';

  @override
  String get settingsAskEachTime => 'Klauskite kiekvieną kartą';

  @override
  String get settingsPreferHdr10Fallback =>
      'Pirmenybę teikite atsarginiam HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Pirmenybė teikiama serverio perkodavimui';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      '„Dolby Vision Profile 7“ tiesioginis paleidimas';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Valdo, ar „Dolby Vision“ profilio 7 patobulinimo sluoksnio srautai turi nukreipti grojimą.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automatinis (AFTKRT įjungtas)';

  @override
  String get settingsEnabledOnThisDevice => 'Įjungta šiame įrenginyje';

  @override
  String get settingsDisabledPreferTranscode =>
      'Išjungta (pageidautina perkoduoti)';

  @override
  String get settingsResumeRewindDescription =>
      'Kiek sekundžių reikia atsukti atkūrimą tęsiant (iš „Continue Watching“ arba iš medijos elemento puslapio)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Kiek sekundžių reikia atsukti atkūrimą paspaudus pauzės mygtuką?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Kiek sekundžių reikia grįžti atgal paspaudus atsukimo mygtuką.';

  @override
  String get settingsOneSecond => '1 sekundė';

  @override
  String get settingsThreeSeconds => '3 sekundes';

  @override
  String get settingsFortyFiveSeconds => '45 sekundes';

  @override
  String get settingsSixtySeconds => '60 sekundžių';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Kiek sekundžių reikia šokti pirmyn paspaudus greito pirmyn mygtuką.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitų srautas AC3 į išorinį dekoderį';

  @override
  String get settingsCinemaMode => 'Kino režimas';

  @override
  String get settingsCinemaModeSubtitle =>
      'Žaiskite anonsus / išankstinius įrašus prieš pagrindinę funkciją';

  @override
  String get settingsNextUpDisplayDescription =>
      'Išplėstoje rodoma visa kortelė su epizodo iliustracija ir aprašu. Minimalus rodo kompaktišką atgalinės atskaitos perdangą. Išjungta visiškai paslepia raginimą.';

  @override
  String get settingsShort => 'Trumpas';

  @override
  String get settingsLong => 'Ilgas';

  @override
  String get settingsVeryLong => 'Labai Ilgas';

  @override
  String get settingsVideoStartDelay => 'Vaizdo įrašo pradžios delsa';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Tiesioginė TV tiesioginė';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Įgalinti tiesioginį tiesioginės televizijos atkūrimą';

  @override
  String get settingsOpenGroups => 'Atidarykite grupes';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Kurkite, prisijunkite arba tvarkykite „SyncPlay“ grupes';

  @override
  String get settingsSyncplayEnabled => '„SyncPlay“ įjungta';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Įgalinti grupės stebėjimo funkcijas';

  @override
  String get settingsSyncplayButton => 'SyncPlay mygtukas';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Naršymo juostoje parodykite mygtuką SyncPlay';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Išplėstinė korekcija';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Įgalinti tikslią sinchronizavimo logiką';

  @override
  String get settingsSyncplaySyncCorrection => 'Sinchronizavimo taisymas';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Automatiškai koreguokite atkūrimą, kad jis būtų sinchronizuotas';

  @override
  String get settingsSyncplaySpeedToSync => 'Sinchronizavimo greitis';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Norėdami sinchronizuoti, naudokite atkūrimo greičio reguliavimą';

  @override
  String get settingsSyncplaySkipToSync => 'Pereiti prie sinchronizavimo';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Naudokite iešką sinchronizuoti';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Minimalus greičio delsimas';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Maksimalaus greičio delsa';

  @override
  String get settingsSyncplaySpeedDuration => 'Greičio trukmė';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimali praleidimo delsa';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Papildomas poslinkis';

  @override
  String get onNow => 'Dabar';

  @override
  String get collections => 'Kolekcijos';

  @override
  String get lastPlayed => 'Paskutinį kartą žaidė';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Naujausias $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Neseniai išleista: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Automatiškai paleisti kitą seriją';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automatiškai paleisti kitą seriją, kai ji pasiekiama.';

  @override
  String get skipSilenceTitle => 'Praleisti tylą';

  @override
  String get skipSilenceSubtitle =>
      'Automatiškai praleiskite tylius garso segmentus, kai juos palaiko srautas.';

  @override
  String get allowExternalAudioEffectsTitle => 'Leisti išorinius garso efektus';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Leisti ekvalaizerio ir efektų programoms (pvz., „Wavelet“) prisijungti prie Media3 atkūrimo seansų.';

  @override
  String get disableTunnelingTitle => 'Išjungti tuneliavimą';

  @override
  String get disableTunnelingSubtitle =>
      'Priverstinis netunelinis atkūrimas. Naudinga įrenginiuose su tuneliavimo garso / vaizdo pertrūkiais.';

  @override
  String get enableTunnelingTitle => 'Įjungti tuneliavimą';

  @override
  String get enableTunnelingSubtitle =>
      'Išplėstinis. Nukreipia garsą ir vaizdą per susietą aparatinį kelią. Pagal numatytuosius nustatymus išjungta, nes kai kuriuose įrenginiuose sukelia garso ir vaizdo trikdžius.';

  @override
  String get mapDolbyVisionP7Title => 'Susieti Dolby Vision profilį 7 su HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Leiskite Dolby Vision profilio 7 srautus kaip su HDR10 suderinamą HEVC ne DV įrenginiuose.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Naudokite įterptus subtitrų stilius';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Taikykite spalvas, šriftus ir padėtį, įterptą į subtitrų takelį. Išjunkite, kad galėtumėte naudoti antraščių stiliaus nuostatas.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Naudokite įterptųjų subtitrų šrifto dydžius';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Taikykite šrifto dydžio užuominas, įterptas į subtitrų takelį. Neleiskite naudoti subtitrų dydžio pagal savo stiliaus nuostatas.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Rodyti medijos informaciją';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Rodyti pasirinkto elemento informaciją bibliotekos puslapių viršuje.';

  @override
  String get hideBackdropsInLibraries => 'Slėpti fono vaizdus naršant?';

  @override
  String get useDetailedSubHeadings => 'Naudokite išsamias antraštes';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Bibliotekos puslapiuose rodyti išsamią arba minimalią eilutę.';

  @override
  String get savedThemesDeleteDialogTitle => 'Ištrinti išsaugotą temą?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Pašalinti „$themeName“ iš šio įrenginio talpyklos?';
  }

  @override
  String get themeStore => 'Temų parduotuvė';

  @override
  String get themeStoreSubtitle =>
      'Naršykite ir išsaugokite bendruomenės temas';

  @override
  String get themeStoreDescription =>
      'Išsaugokite temą, kad galėtumėte ją naudoti kaip ir kitas išsaugotas temas.';

  @override
  String get themeStoreEmpty => 'Šiuo metu temų nėra.';

  @override
  String get themeStoreLoadFailed =>
      'Nepavyko įkelti temų parduotuvės. Patikrinkite ryšį ir bandykite dar kartą.';

  @override
  String get themeStoreSave => 'Išsaugoti';

  @override
  String get themeStoreSaveAndApply => 'Išsaugoti ir taikyti';

  @override
  String get themeStoreSaved => 'Išsaugota';

  @override
  String get themeStoreInvalidMessage => 'Šios temos įkelti nepavyko.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Išsaugota „$themeName“.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Ištrinta „$themeName“ iš šio įrenginio.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Nepavyko ištrinti „$themeName“.';
  }

  @override
  String get savedThemesTitle => 'Išsaugotos temos';

  @override
  String get savedThemesDescription =>
      'Tai temos, atsisiųstos iš Moonfin įskiepio dabartiniam serveriui. Ištrynus pašalinama tik ši vietinė kopija.';

  @override
  String get savedThemesEmpty => 'Šiam serveriui išsaugotų temų nerasta.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Šiuo metu aktyvus';
  }

  @override
  String get savedThemesDeleteTooltip => 'Ištrinti išsaugotą temą';

  @override
  String get savedThemesManageSubtitle =>
      'Tvarkykite atsisiųstų papildinių temas šiame įrenginyje';

  @override
  String get themeEditor => 'Temos redaktorius';

  @override
  String get themeEditorSubtitle =>
      'Naršyklėje atidarykite Moonfin temų rengyklę';

  @override
  String get homeScreen => 'Pagrindinis ekranas';

  @override
  String get bottomBar => 'Apatinė juosta';

  @override
  String get homeRowsStyleClassic => 'Klasikinis';

  @override
  String get homeRowsStyleModern => 'Modernus';

  @override
  String get homeRowsSection => 'Pradžios eilutės';

  @override
  String get homeRowDisplay => 'Pradžios ekrano eilučių rodymas';

  @override
  String get homeRowSections => 'Pradžios ekrano eilučių skiltys';

  @override
  String get homeRowToggles => 'Pradžios ekrano eilučių jungikliai';

  @override
  String get homeRowTogglesSubtitle =>
      'Įjunkite arba išjunkite bibliotekomis pagrįstas pradžios ekrano eilučių kategorijas';

  @override
  String get homeRowTogglesDescription =>
      'Įjunkite toliau esančius jungiklius, kad eilutės būtų rodomos pradžios ekrano skiltyse.';

  @override
  String get rowsType => 'Eilučių tipas';

  @override
  String get rowsTypeDescription =>
      '„Classic“ išlaiko kiekvienos eilutės vaizdo tipą ir informacijos perdangą. Modernus naudoja portreto ir fono eilutes.';

  @override
  String get displayFavoritesRows => 'Rodyti mėgstamiausių eilutes';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Rodyti mėgstamiausius filmus, serialus ir kitas mėgstamiausias eilutes pagrindinio puslapio skiltyse.';

  @override
  String get favoritesRowSorting => 'Parankinių eilučių rūšiavimas';

  @override
  String get favoritesRowSortingDescription =>
      'Rūšiuoti parankinių eilutes pagal pridėjimo datą, išleidimo datą, abėcėlės tvarka ir kt.';

  @override
  String get displayCollectionsRows => 'Rodyti kolekcijų eilutes';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Rodyti kolekcijų eilutes pagrindinio puslapio skiltyse.';

  @override
  String get collectionsRowSorting => 'Rinkinių eilučių rūšiavimas';

  @override
  String get collectionsRowSortingDescription =>
      'Rūšiuoti kolekcijų eilutes pagal pridėjimo datą, išleidimo datą, abėcėlės tvarka ir kt.';

  @override
  String get displayGenresRows => 'Rodyti žanrų eilutes';

  @override
  String get displayGenresRowsSubtitle =>
      'Rodyti žanrų eilutes pagrindiniuose skyriuose.';

  @override
  String get genresRowSorting => 'Žanrai Eilučių rūšiavimas';

  @override
  String get genresRowSortingDescription =>
      'Rūšiuoti žanrų eilutes pagal pridėjimo datą, išleidimo datą, abėcėlės tvarka ir kt.';

  @override
  String get genresRowItems => 'Žanrai Eilutės elementai';

  @override
  String get genresRowItemsDescription =>
      'Rodyti filmus, serialus arba abu žanrų eilutėse.';

  @override
  String get displayPlaylistsRows => 'Rodyti grojaraščių eilutes';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Rodyti grojaraščių eilutes pradžios ekrano skiltyse.';

  @override
  String get playlistsRowSorting => 'Grojaraščių eilučių rikiavimas';

  @override
  String get playlistsRowSortingDescription =>
      'Rikiuokite grojaraščių eilutes pagal pridėjimo datą, išleidimo datą, abėcėlę ir kitus kriterijus.';

  @override
  String get displayAudioRows => 'Rodyti garso eilutes';

  @override
  String get displayAudioRowsSubtitle =>
      'Rodyti garso eilutes pradžios ekrano skiltyse.';

  @override
  String get audioRowsSorting => 'Garso eilučių rikiavimas';

  @override
  String get audioRowsSortingDescription =>
      'Rikiuokite garso eilutes pagal pridėjimo datą, išleidimo datą, abėcėlę ir kitus kriterijus.';

  @override
  String get audioPlaylists => 'Garso grojaraščiai';

  @override
  String get appearance => 'Išvaizda';

  @override
  String get layout => 'Išdėstymas';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Klaviatūra';

  @override
  String get navButtons => 'Mygtukai';

  @override
  String get rendering => 'Atvaizdavimas';

  @override
  String get mpvConfiguration => 'MPV konfigūracija';

  @override
  String get cardSize => 'Kortelės dydis';

  @override
  String get externalPlayerApp => 'Išorinio grotuvo programa';

  @override
  String get externalPlayerAppDescription =>
      'Nustatykite išorinę leistuvę, kad įjungtumėte paleidimą ilgai spaudžiant';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Rodyti programos parinkiklį, kai prasideda atkūrimas.';

  @override
  String get loadingInstalledPlayers => 'Įkeliami įdiegti grotuvai...';

  @override
  String get connection => 'Ryšys';

  @override
  String get audioTranscodeTarget => 'Garso perkodavimo tikslas';

  @override
  String get passthrough => 'Praėjimas';

  @override
  String get supportedOnThisDevice => 'Palaikomas šiame įrenginyje';

  @override
  String get notSupportedOnThisDevice => 'Nepalaikomas šiame įrenginyje';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) pralaidumas';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitų srautas DTS:X (DTS UHD) į išorinį dekoderį.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      '„TrueHD“ su „Atmos“ (JOC) pralaidumu';

  @override
  String get mediaPlayerBehavior => 'Media Player elgesys';

  @override
  String get playbackEnhancements => 'Atkūrimo patobulinimai';

  @override
  String get alwaysOn => 'Visada įjungta.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Pakeiskite Skip Outro į kitą ekraną';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Vietoj mygtuko Skip Outro rodyti perdangą Next Up.';

  @override
  String get playerRouting => 'Žaidėjų maršrutas';

  @override
  String get preferSoftwareDecoders =>
      'Pirmenybę teikite programiniams dekoderiams';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Prieš aparatūros dekoderius naudokite FFmpeg (garso) ir libgav1 (AV1). Išjungti, jei nutrūksta HDMI garso perdavimas.';

  @override
  String get useExternalPlayer => 'Naudokite išorinį grotuvą';

  @override
  String get useExternalPlayerSubtitle =>
      'Atidarykite vaizdo įrašų atkūrimą pasirinktoje išorinėje programoje „Android TV“.';

  @override
  String get automaticQueuing => 'Automatinis eilių sudarymas';

  @override
  String get preferSdhSubtitles => 'Pirmenybė teikiama SDH subtitrams';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Automatinio pasirinkimo metu pirmenybę teikite SDH/CC subtitrų takeliams.';

  @override
  String get webDiagnostics => 'Interneto diagnostika';

  @override
  String get webDiagnosticsTitle => 'Moonfin Žiniatinklio diagnostika';

  @override
  String get webDiagnosticsIntro =>
      'Naudokite šį puslapį norėdami diagnozuoti naršyklės ryšio problemas (CORS, mišraus turinio ir atradimo nustatymus).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Aptiktas mišraus turinio gedimas';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Aptiktas CORS / išankstinio skrydžio gedimas';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin aptiko HTTPS puslapį, bandantį iškviesti HTTP serverio URL. Naršyklės blokuoja šią užklausą, kol ji pasiekia jūsų serverį.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin aptiko naršyklės lygio užklausos gedimą, kurį dažniausiai sukelia trūkstamos CORS arba išankstinio patikrinimo antraštės medijos serveryje.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Tikslinis URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Išsami informacija: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Dabartinis vykdymo kontekstas';

  @override
  String get webDiagnosticsOrigin => 'Kilmė';

  @override
  String get webDiagnosticsScheme => 'Schema';

  @override
  String get webDiagnosticsPluginMode => 'Papildinio režimas';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC nuskaitymas';

  @override
  String get webDiagnosticsForcedServerUrl => 'Priverstinis serverio URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Numatytasis serverio URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'Atradimo tarpinio serverio URL';

  @override
  String get notConfigured => 'nesukonfigūruotas';

  @override
  String get webDiagnosticsMixedContent => 'Mišrus turinys';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Šis puslapis įkeltas per HTTPS, bet vienas ar daugiau sukonfigūruotų URL yra HTTP. Naršyklės blokuoja HTTPS puslapius, kad jie negalėtų iškviesti HTTP API.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Pataisymas: aptarnaukite medijos serverį arba tarpinį serverį per HTTPS arba įkelkite Moonfin per HTTP tik patikimuose vietiniuose tinkluose.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Iš dabartinių vykdymo laiko nustatymų neaptikta jokios akivaizdžios mišraus turinio konfigūracijos.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS kontrolinis sąrašas';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Leisti naršyklės kilmę Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Įtraukite įgaliojimą, X-Emby-Authorization ir X-Emby-Token į Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Atskleisti turinio diapazoną ir priimti diapazoną, kad galėtumėte perduoti srautą ir ieškoti elgsenos.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Grąžinkite 204 į OPTIONS išankstinio patikrinimo užklausas.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Antraštės fragmento pavyzdys (nginx stiliaus)';

  @override
  String get note => 'Pastaba';

  @override
  String get webDiagnosticsNonWebNote =>
      'Šis diagnostikos maršrutas skirtas žiniatinklio kūrimui. Jei tai matote kitoje platformoje, šie patikrinimai gali būti netaikomi.';

  @override
  String get backToServerSelect => 'Atgal į serverį Pasirinkite';

  @override
  String get signOutAllUsers => 'Atsijungti nuo visų vartotojų';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofono leidimas visam laikui atmestas. Įjunkite jį sistemos nustatymuose.';

  @override
  String get voiceSearchPermissionRequired =>
      'Norint atlikti paiešką balsu, reikalingas mikrofono leidimas.';

  @override
  String get voiceSearchNoMatch => 'Nepagavo to. Bandykite dar kartą.';

  @override
  String get voiceSearchNoSpeechDetected => 'Kalbos neaptikta.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofono klaida.';

  @override
  String get voiceSearchNeedsInternet => 'Balso paieškai reikia interneto.';

  @override
  String get voiceSearchServiceBusy =>
      'Balso paslauga užimta. Bandykite dar kartą.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofono leidimas visam laikui atmestas.';

  @override
  String get microphonePermissionDenied => 'Mikrofono leidimas atmestas.';

  @override
  String get speechRecognitionUnavailable =>
      'Kalbos atpažinimo funkcija šiame įrenginyje nepasiekiama.';

  @override
  String get openIosRoutePicker => 'Atidarykite „iOS“ maršruto parinkiklį';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay maršruto parinkiklis nepasiekiamas šiame įrenginyje.';

  @override
  String get videos => 'Vaizdo įrašai';

  @override
  String get programs => 'Programos';

  @override
  String get songs => 'Dainos';

  @override
  String get photoAlbums => 'Nuotraukų albumai';

  @override
  String get photos => 'Nuotraukos';

  @override
  String get people => 'Žmonės';

  @override
  String get recentlyReleasedEpisodes => 'Neseniai išleisti epizodai';

  @override
  String get watchAgain => 'Žiūrėti dar kartą';

  @override
  String get guestAppearances => 'Svečių pasirodymai';

  @override
  String get appearancesSeerr => 'Pasirodymai (Seerr)';

  @override
  String get crewContributionsSeerr => 'Kūrybinės grupės darbai (Seerr)';

  @override
  String get watchWithGroup => 'Žiūrėkite su grupe';

  @override
  String get errors => 'Klaidos';

  @override
  String get warnings => 'Įspėjimai';

  @override
  String get disk => 'Diskas';

  @override
  String get openInBrowser => 'Atidaryti naršyklėje';

  @override
  String get embeddedBrowserNotAvailable =>
      'Įterptoji naršyklė šioje platformoje nepasiekiama.';

  @override
  String get adminRestartServerConfirmation =>
      'Ar tikrai norite iš naujo paleisti serverį?';

  @override
  String get adminShutdownServerConfirmation =>
      'Ar tikrai norite išjungti serverį? Turėsite jį iš naujo paleisti rankiniu būdu.';

  @override
  String get internal => 'Vidinis';

  @override
  String get idle => 'Tuščia eiga';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nerasta jokių vartotojų';

  @override
  String get adminNoUsersMatchSearch =>
      'Jūsų paiešką atitinkančių naudotojų nėra';

  @override
  String get adminNoDevicesFound => 'Nerasta jokių įrenginių';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nė vienas įrenginys neatitinka dabartinių filtrų';

  @override
  String get passwordSet => 'Slaptažodis nustatytas';

  @override
  String get noPasswordConfigured => 'Nekonfigūruotas slaptažodis';

  @override
  String get remoteAccess => 'Nuotolinė prieiga';

  @override
  String get localOnly => 'Tik vietinis';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Nepavyko įkelti medijos analizės';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Kombinuota analizė visose medijos bibliotekose.';

  @override
  String get analyticsTopArtists => 'Geriausi atlikėjai';

  @override
  String get analyticsTopAuthors => 'Geriausi autoriai';

  @override
  String get analyticsTopContributors => 'Geriausi bendradarbiai';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bibliotekų',
      many: '$count bibliotekos',
      few: '$count bibliotekos',
      one: '$count biblioteka',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Šiam pasirinkimui dar nėra jokių indeksuotų medijos sumų.';

  @override
  String get analyticsLibraryDetails => 'Bibliotekos informacija';

  @override
  String get analyticsLibraryBreakdown => 'Bibliotekos suskirstymas';

  @override
  String get analyticsNoLibrariesAvailable => 'Bibliotekų nėra.';

  @override
  String get adminServerAdministrationTitle => 'Serverio administravimas';

  @override
  String get adminServerPathData => 'Duomenys';

  @override
  String get adminServerPathImageCache => 'Vaizdo talpykla';

  @override
  String get adminServerPathCache => 'Talpykla';

  @override
  String get adminServerPathLogs => 'Rąstai';

  @override
  String get adminServerPathMetadata => 'Metaduomenys';

  @override
  String get adminServerPathTranscode => 'Perkoduoti';

  @override
  String get adminServerPathWeb => 'Žiniatinklis';

  @override
  String get adminNoServerPathsReturned =>
      'Šis serveris nepateikė jokių serverio kelių.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% panaudota';
  }

  @override
  String get userActivity => 'Vartotojo veikla';

  @override
  String get systemEvents => 'Sistemos įvykiai';

  @override
  String get needsAttention => 'Reikia dėmesio';

  @override
  String get adminDrawerSectionServer => 'Serveris';

  @override
  String get adminDrawerSectionPlayback => 'Atkūrimas';

  @override
  String get adminDrawerSectionDevices => 'Prietaisai';

  @override
  String get adminDrawerSectionAdvanced => 'Išplėstinė';

  @override
  String get adminDrawerSectionPlugins => 'Papildiniai';

  @override
  String get adminDrawerSectionLiveTv => 'Tiesioginė televizija';

  @override
  String get homeVideos => 'Namų vaizdo įrašai';

  @override
  String get mixedContent => 'Mišrus turinys';

  @override
  String get homeVideosAndPhotos => 'Namų vaizdo įrašai ir nuotraukos';

  @override
  String get mixedMoviesAndShows => 'Mišrūs filmai ir laidos';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Įrašų nerasta';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension archyve vaizdų puslapių nerasta.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Įterptasis atvaizdavimo įrenginys nepavyko ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Nepavyko pateikti EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Trūksta vietinio skaitytuvo failo: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status atidarant knygos duomenis iš $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nėra skaitomos knygos galutinio taško';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nepalaikomas komiksų archyvo formatas: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR ištraukimo papildinio šioje platformoje nėra.';

  @override
  String get failedToExtractCbrArchive => 'Nepavyko išskleisti .cbr archyvo.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 ištraukimas šioje platformoje negalimas.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 ištraukimo įskiepis nepasiekiamas šioje platformoje.';

  @override
  String get closeGenrePanel => 'Uždaryti žanro skydelį';

  @override
  String get loadingShuffle => 'Įkeliamas maišymas...';

  @override
  String get libraryShuffleLabel => 'BIBLIOTEKOS MAIŠYMAS';

  @override
  String get randomShuffleLabel => 'ATSITIKTINIS MAIŠYMAS';

  @override
  String get genresShuffleLabel => 'ŽANRŲ MAIŠYMAS';

  @override
  String get autoHdrSwitching => 'Automatinis HDR perjungimas';

  @override
  String get autoHdrSwitchingDescription =>
      'Automatiškai įgalinkite HDR HDR vaizdo įrašams atkurti ir atkurkite rodymo režimą išėjus.';

  @override
  String get whenFullscreen => 'Kai per visą ekraną';

  @override
  String get changeArtwork => 'Keisti viršelį';

  @override
  String get missing => 'Trūksta';

  @override
  String get transcodingLimits => 'Perkodavimo ribos';

  @override
  String get clearAllArtworkButton => 'Išvalyti visus viršelius?';

  @override
  String get clearAllArtworkWarning =>
      'Ar tikrai norite išvalyti visus atsisiųstus viršelius?';

  @override
  String get confirmClear => 'Patvirtinti išvalymą';

  @override
  String confirmClearMessage(String itemType) {
    return 'Ar tikrai norite išvalyti šį elementą: $itemType?';
  }

  @override
  String get uploadButton => 'Įkelti?';

  @override
  String get resolutionLabel => 'Raiška: ';

  @override
  String get onlyShowInterfaceLanguage => 'Rodyti tik sąsajos kalbos viršelius';

  @override
  String get confirmClearAll => 'Patvirtinti visų išvalymą';

  @override
  String get imageUploadSuccess => 'Vaizdas sėkmingai įkeltas!';

  @override
  String imageUploadFailed(String error) {
    return 'Nepavyko įkelti vaizdo: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Nepavyko nustatyti vaizdo: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Nepavyko ištrinti vaizdo: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Nepavyko išvalyti visų viršelių: $error';
  }

  @override
  String get yes => 'Taip';

  @override
  String get posterCategory => 'Plakatas';

  @override
  String get backdropsCategory => 'Fono vaizdai';

  @override
  String get bannerCategory => 'Reklamjuostė';

  @override
  String get logoCategory => 'Logotipas';

  @override
  String get thumbnailCategory => 'Miniatiūra';

  @override
  String get artCategory => 'Grafika';

  @override
  String get discArtCategory => 'Disko grafika';

  @override
  String get screenshotCategory => 'Ekrano kopija';

  @override
  String get boxCoverCategory => 'Dėžutės viršelis';

  @override
  String get boxRearCoverCategory => 'Dėžutės galinis viršelis';

  @override
  String get menuArtCategory => 'Meniu grafika';

  @override
  String get confirmItemPoster => 'plakatas';

  @override
  String get confirmItemBackdrop => 'fono vaizdas';

  @override
  String get confirmItemBanner => 'reklamjuostė';

  @override
  String get confirmItemLogo => 'logotipas';

  @override
  String get confirmItemThumbnail => 'miniatiūra';

  @override
  String get confirmItemArt => 'grafika';

  @override
  String get confirmItemDiscArt => 'disko grafika';

  @override
  String get confirmItemScreenshot => 'ekrano kopija';

  @override
  String get confirmItemBoxCover => 'dėžutės viršelis';

  @override
  String get confirmItemBoxRearCover => 'dėžutės galinis viršelis';

  @override
  String get confirmItemMenuArt => 'meniu grafika';

  @override
  String get resolutionAll => 'Visos';

  @override
  String get resolutionHigh => 'Aukšta (1080p+)';

  @override
  String get resolutionMedium => 'Vidutinė (720p)';

  @override
  String get resolutionLow => 'Žema (<720p)';

  @override
  String get sources => 'Šaltiniai';

  @override
  String get audiobookChapters => 'Skyriai';

  @override
  String get audiobookBookmarks => 'Žymės';

  @override
  String get audiobookNotes => 'Pastabos';

  @override
  String get audiobookQueue => 'Eilė';

  @override
  String get audiobookTimeline => 'Laiko juosta';

  @override
  String get audiobookTimelineEmpty => 'Laiko juosta tuščia';

  @override
  String get audiobookWholeBook => 'Visa knyga';

  @override
  String get audiobookFocusedTimeline => 'Sutelkta laiko juosta';

  @override
  String get audiobookExportBookmarks => 'Eksportuoti žymes';

  @override
  String get audiobookExportNotes => 'Eksportuoti pastabas';

  @override
  String get audiobookExportAll => 'Eksportuoti viską';

  @override
  String audiobookExportSuccess(String path) {
    return 'Eksportuota į $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Eksportuoti nepavyko: $error';
  }

  @override
  String get audiobookLyrics => 'Dainų tekstai';

  @override
  String get audiobookAddBookmark => 'Pridėti žymę';

  @override
  String get audiobookAddNote => 'Pridėti pastabą';

  @override
  String get audiobookEditNote => 'Redaguoti pastabą';

  @override
  String get audiobookNoteHint => 'Parašykite pastabą šiai akimirkai';

  @override
  String get audiobookSleepTimer => 'Miego laikmatis';

  @override
  String get audiobookSleepOff => 'Išjungta';

  @override
  String get audiobookSleepEndOfChapter => 'Skyriaus pabaigoje';

  @override
  String get audiobookSleepCustom => 'Pasirinktinis';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Liko $remaining';
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
  String get audiobookPlaybackSpeed => 'Atkūrimo greitis';

  @override
  String get audiobookRemainingTime => 'Liko';

  @override
  String get audiobookElapsedTime => 'Praėjo';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Atgal $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Pirmyn $seconds s';
  }

  @override
  String get audiobookPreviousChapter => 'Ankstesnis skyrius';

  @override
  String get audiobookNextChapter => 'Kitas skyrius';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$current skyrius iš $total';
  }

  @override
  String get audiobookNoChapters => 'Skyrių nėra';

  @override
  String get audiobookNoBookmarks => 'Žymių dar nėra';

  @override
  String get audiobookNoNotes => 'Pastabų dar nėra';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Žymė pridėta ties $position';
  }

  @override
  String get audiobookSpeedReset => 'Atstatyti į 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Išsaugoti';

  @override
  String get audiobookCancel => 'Atšaukti';

  @override
  String get audiobookDelete => 'Ištrinti';

  @override
  String get subtitlePreferences => 'Subtitrų nuostatos';

  @override
  String get subtitlePreferencesDescription =>
      'Keiskite subtitrų režimus, numatytąsias kalbas, išvaizdą ir atvaizdavimo parinktis.';

  @override
  String get subtitleRendering => 'Subtitrų atvaizdavimas';

  @override
  String get displayOptions => 'Rodymo parinktys';

  @override
  String get releaseDateAscending => 'Išleidimo data (didėjančiai)';

  @override
  String get releaseDateDescending => 'Išleidimo data (mažėjančiai)';

  @override
  String get groupContributions => 'Grupuoti darbus';

  @override
  String get groupMultipleRoles => 'Grupuoti kelis vaidmenis';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Įspėjimas apie bibliotekos rašymo teises';

  @override
  String get libraryWriteAccessHowToFix => 'Kaip tai ištaisyti:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Suteikite Jellyfin tarnybos naudotojui (pvz., jellyfin arba Docker PUID/PGID) rašymo teises į serveryje esančius medijos bibliotekos aplankus.\n\n2. Arba eikite į Jellyfin valdymo skydelį -> Bibliotekos, redaguokite šią biblioteką ir išjunkite parinktį „Įrašyti viršelius į medijos aplankus“, kad viršeliai būtų saugomi vidinėje Jellyfin duomenų bazėje.';

  @override
  String get dismiss => 'Atmesti';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Jūsų biblioteka „$libraryName“ sukonfigūruota įrašyti viršelius tiesiai į medijos aplankus (įjungta parinktis „Įrašyti viršelius į medijos aplankus“). Tačiau Jellyfin patikrino rašymo teises ir neturi leidimo įrašyti failų į šį katalogą:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Panašu, kad Jellyfin nepavyko atnaujinti viršelio. Jūsų biblioteka sukonfigūruota įrašyti viršelius tiesiai į medijos aplankus (įjungta parinktis „Įrašyti viršelius į medijos aplankus“). Ši klaida paprastai atsiranda, kai Jellyfin serverio procesas neturi leidimo įrašyti failų į jūsų medijos katalogus.';

  @override
  String get externalLists => 'Išoriniai sąrašai';

  @override
  String get replay => 'Paleisti iš naujo';

  @override
  String get fileInformation => 'Failo informacija';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Dydis: $size  •  Formatas: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Rodyti visus garso takelius ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Rodyti visus subtitrų takelius ($count)';
  }

  @override
  String get checkingDirectPlay => 'Tikrinama tiesioginio atkūrimo galimybė...';

  @override
  String get directPlayCapabilityLabel => 'Tiesioginio atkūrimo galimybė: ';

  @override
  String get forced => 'Priverstiniai';

  @override
  String get transcodeContainerNotSupported =>
      'Leistuvė nepalaiko konteinerio formato.';

  @override
  String get transcodeVideoCodecNotSupported => 'Vaizdo kodekas nepalaikomas.';

  @override
  String get transcodeAudioCodecNotSupported => 'Garso kodekas nepalaikomas.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Subtitrų formatas nepalaikomas (reikia įdeginti).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Garso profilis nepalaikomas.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Vaizdo profilis nepalaikomas.';

  @override
  String get transcodeVideoLevelNotSupported => 'Vaizdo lygis nepalaikomas.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Šis įrenginys nepalaiko vaizdo raiškos.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Vaizdo bitų gylis nepalaikomas.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Vaizdo kadrų dažnis nepalaikomas.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Failo bitų sparta viršija leistuvės transliavimo limitą.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Vaizdo bitų sparta viršija transliavimo limitą.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Garso bitų sparta viršija transliavimo limitą.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Garso kanalų skaičius nepalaikomas.';

  @override
  String get sortAlphabetical => 'Pagal abėcėlę';

  @override
  String get sortReleaseAscending => 'Išleidimo tvarka (didėjančiai)';

  @override
  String get sortReleaseDescending => 'Išleidimo tvarka (mažėjančiai)';

  @override
  String get sortCustomDragDrop => 'Pasirinktinė (vilkimu)';

  @override
  String get playlistSortOptions => 'Grojaraščio rikiavimo parinktys';

  @override
  String get resetSort => 'Atstatyti rikiavimą';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Žiūrėti iš naujo S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Žiūrėti grojaraštį iš naujo';

  @override
  String get noSubtitlesFound => 'Subtitrų nerasta.';

  @override
  String get adminControls => 'Administratoriaus valdikliai';

  @override
  String get impellerRendering => 'Atvaizdavimo variklis (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller – modernus Flutter GPU atvaizdavimo variklis, užtikrinantis sklandesnes animacijas ir mažiau trūkčiojimų. Kai kuriuose TV priedėliuose ir senesniuose GPU jis gali sukelti trikdžius ar juodą vaizdą; tokiu atveju jį išjunkite. „Automatinis“ parenka geriausią numatytąjį variantą jūsų įrenginiui. Kad pakeitimai įsigaliotų, paleiskite Moonfin iš naujo.';

  @override
  String get impellerAuto => 'Automatinis';

  @override
  String get impellerOn => 'Įjungta';

  @override
  String get impellerOff => 'Išjungta';

  @override
  String get impellerRestartTitle => 'Reikia paleisti iš naujo';

  @override
  String get impellerRestartMessage =>
      'Kad būtų pakeistas atvaizdavimo variklis, Moonfin reikia paleisti iš naujo. Uždarykite programą dabar ir vėl ją atidarykite.';

  @override
  String get impellerCloseNow => 'Uždaryti programą dabar';

  @override
  String get adminRefreshLibrary => 'Atnaujinti biblioteką';

  @override
  String get adminRefreshAllLibraries => 'Atnaujinti visas bibliotekas';

  @override
  String get adminRepoSortDateOldest => 'Pridėjimo data (nuo seniausių)';

  @override
  String get adminRepoSortDateNewest => 'Pridėjimo data (nuo naujausių)';

  @override
  String get adminRepoSortNameAsc => 'Pagal abėcėlę (A–Z)';

  @override
  String get adminRepoSortNameDesc => 'Pagal abėcėlę (Z–A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Įkeliama serverio analitika... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Kaip šaltinio';

  @override
  String get imdbTop250Movies => 'IMDb 250 geriausių filmų';

  @override
  String get imdbTop250TvShows => 'IMDb 250 geriausių serialų';

  @override
  String get imdbMostPopularMovies => 'IMDb populiariausi filmai';

  @override
  String get imdbMostPopularTvShows => 'IMDb populiariausi serialai';

  @override
  String get imdbLowestRatedMovies => 'IMDb prasčiausiai vertinami filmai';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb geriausiai vertinami filmai anglų kalba';
}
