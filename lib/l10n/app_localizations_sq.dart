// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'PREFERENCAT E LLOGARISË';

  @override
  String get interfaceLanguage => 'Gjuha e ndërfaqes';

  @override
  String get systemLanguageDefault => 'Parazgjedhja e sistemit';

  @override
  String get signIn => 'Hyni';

  @override
  String get empty => 'Bosh';

  @override
  String connectingToServer(String serverName) {
    return 'Po lidhet me $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Fjalëkalimi';

  @override
  String get username => 'Emri i përdoruesit';

  @override
  String get email => 'Email';

  @override
  String get quickConnectInstruction =>
      'Fusni këtë kod në pultin e uebit të serverit tuaj:';

  @override
  String get waitingForAuthorization => 'Në pritje të autorizimit...';

  @override
  String get back => 'Prapa';

  @override
  String get serverUnavailable => 'Serveri është i padisponueshëm';

  @override
  String get loginFailed => 'Identifikimi dështoi';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect nuk ofrohet: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect nuk ofrohet ($status): $detail';
  }

  @override
  String get whosWatching => 'Kush po shikon?';

  @override
  String get addUser => 'Shto përdorues';

  @override
  String get selectServer => 'Zgjidhni Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versioni $version';
  }

  @override
  String get savedServers => 'Serverët e ruajtur';

  @override
  String get discoveredServers => 'Serverët e zbuluar';

  @override
  String get noneFound => 'Nuk u gjet asnjë';

  @override
  String get unableToConnectToServer => 'Nuk mund të lidhet me serverin';

  @override
  String get addServer => 'Shto Server';

  @override
  String get embyConnect => 'Emby Lidhu';

  @override
  String get removeServer => 'Hiq serverin';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Të hiqet \"$serverName\" nga serverët tuaj?';
  }

  @override
  String get cancel => 'Anulo';

  @override
  String get remove => 'Hiq';

  @override
  String get connectToServer => 'Lidhu me serverin';

  @override
  String get serverAddress => 'Adresa e serverit';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Lidheni';

  @override
  String get secureStorageUnavailable =>
      'Hapësira ruajtëse e sigurt e padisponueshme';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nuk mund të hynte në çelësin e sistemit tuaj. Identifikimi mund të vazhdojë, por ruajtja e sigurt e shenjave mund të mos jetë e disponueshme derisa tastiera të shkyçet.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema e aplikacionit';

  @override
  String get detailScreenStyle => 'Stili i ekranit të detajeve';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasik është paraqitja origjinale e centruar e Moonfin. Moderne është një paraqitje kinematike përshtatëse.';

  @override
  String get detailScreenStyleMoonfin => 'Klasik';

  @override
  String get detailScreenStyleModern => 'Moderne';

  @override
  String get expandedTabs => 'Skedat e zgjeruara';

  @override
  String get expandedTabsSubtitle =>
      'Shfaq automatikisht përmbajtjen e skedës gjatë shfletimit të skedave. Çaktivizoje për të hapur dhe mbyllur secilën skedë manualisht.';

  @override
  String get showTechnicalDetails => 'Të shfaqen detajet teknike?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Shfaq kodekun, rezolucionin dhe informacionin e transmetimit në përmbledhjen e banerit';

  @override
  String get recommendationSystem => 'Sistemi i rekomandimeve';

  @override
  String get recommendationSystemSubtitle =>
      'Përdor algoritmin e bibliotekës lokale Moonfin Recommends ose Metrikat e Ngjashmërisë online të TMDb. Shënim: rekomandimet online kërkojnë integrimin me Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Ngjashmëria TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Të zbatohet kufiri i klasifikimit prindëror?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Kufizo sugjerimet e Moonfin Recommends sipas klasifikimit prindëror të medias së synuar';

  @override
  String get interfaceStyle => 'Stili i ndërfaqes';

  @override
  String get interfaceStyleSubtitle =>
      'Automatik përshtatet me pajisjen tuaj. Zgjidh Apple ose Material për të imponuar një pamje.';

  @override
  String get interfaceStyleAutomatic => 'Automatik';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Cilësia e xhamit';

  @override
  String get glassQualitySubtitle =>
      'Auto zgjedh efektin më të mirë të xhamit për këtë pajisje. I plotë imponon turbullim real; I reduktuar përdor një xham të lehtë që kursen energjinë e GPU-së.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'I plotë';

  @override
  String get glassQualityReduced => 'I reduktuar';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Kalo midis Moonfin dhe Neon Pulse pa e rifilluar aplikacionin';

  @override
  String get customThemeTitle => 'Temë e personalizuar';

  @override
  String get customThemeSubtitle =>
      'Temat e personalizuara ndryshojnë elementet vizuale në të gjithë Moonfin. Zgjidh një nga këto opsione që t\'i përshtatet stilit tuaj.';

  @override
  String get keyboardPreferSystemIme => 'Parapëlqe tastierën e sistemit';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Përdor si parazgjedhje metodën e futjes së pajisjes tuaj për shkrimin e tekstit';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Pamja aktuale Moonfin që të gjithë e keni dashuruar';

  @override
  String get themeNeonPulse => 'Pulsi neoni';

  @override
  String get themeNeonPulseSubtitle =>
      'Stilim Synthwave me shkëlqim magenta, tekst cian dhe kontrast më të fortë kromi';

  @override
  String get themeGlass => 'Xham';

  @override
  String get themeGlassSubtitle =>
      'Stilim me xham të lëngshëm, sfond me gradient lëvizës, sipërfaqe të ngrira dhe theks blu Apple';

  @override
  String get theme8BitHero => 'Heroi 8-bit';

  @override
  String get theme8BitHeroSubtitle =>
      'Stilim retro me pixel-art, paletë të trashë, korniza blloqesh, hije të forta dhe font pikselësh';

  @override
  String get embyConnectSignInSubtitle => 'Hyni me llogarinë tuaj Emby Connect';

  @override
  String get emailOrUsername => 'Email ose Emri i Përdoruesit';

  @override
  String get selectAServer => 'Zgjidhni një Server';

  @override
  String get tryAgain => 'Provo sërish';

  @override
  String get noLinkedServers =>
      'Asnjë server i lidhur me këtë llogari Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Kredencialet e pavlefshme Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Emri i përdoruesit ose fjalëkalimi i Emby Connect është i pavlefshëm';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serveri nuk e mbështet shkëmbimin Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Gabim rrjeti gjatë kontaktit me Emby Connect ose serverin e zgjedhur';

  @override
  String get loadingLinkedServers => 'Po ngarkon serverët e lidhur...';

  @override
  String get connectingToServerEllipsis => 'Po lidhet me serverin...';

  @override
  String get noReachableAddress => 'Nuk është dhënë asnjë adresë e arritshme';

  @override
  String get invalidServerExchangeResponse =>
      'Përgjigje e pavlefshme nga pika përfundimtare e shkëmbimit të serverit';

  @override
  String unableToConnectTo(String target) {
    return 'Nuk mund të lidhet me $target';
  }

  @override
  String get exitApp => 'Dilni nga Moonfin?';

  @override
  String get exitAppConfirmation => 'Je i sigurt që dëshiron të dalësh?';

  @override
  String get exit => 'Dilni';

  @override
  String get gameMenu => 'Menyja';

  @override
  String get gamePaused => 'Në pauzë';

  @override
  String get gameSaveState => 'Ruaj gjendjen';

  @override
  String get games => 'Lojëra';

  @override
  String get gameLoadState => 'Ngarko gjendjen';

  @override
  String get gameFastForward => 'Përshpejto';

  @override
  String get gameEmulatorSettings => 'Cilësimet e emulatorit';

  @override
  String get gameNoCoreOptions =>
      'Kjo bërthamë nuk ka opsione të rregullueshme.';

  @override
  String get gameHoldToOpenMenu => 'Mbaj shtypur për të hapur menynë';

  @override
  String get gamePlaybackUnsupported =>
      'Luajtja e lojërave nuk mbështetet ende në këtë pajisje.';

  @override
  String get noHomeRowsLoaded =>
      'Asnjë rresht i shtëpisë nuk mund të ngarkohej';

  @override
  String get noHomeRowsHint =>
      'Provoni të rifreskoni ose zvogëloni seksionet aktive të shtëpisë.';

  @override
  String get retryHomeRows => 'Provo sërish rreshtat e bazës';

  @override
  String get guide => 'Udhëzues';

  @override
  String get recordings => 'Regjistrimet';

  @override
  String get schedule => 'Orari';

  @override
  String get series => 'Serialet';

  @override
  String get noItemsFound => 'Nuk u gjet asnjë artikull';

  @override
  String get home => 'Kreu';

  @override
  String get browseAll => 'Shfleto të gjitha';

  @override
  String get genres => 'Zhanret';

  @override
  String get collectionPlaceholder =>
      'Artikujt e koleksionit do të shfaqen këtu';

  @override
  String get browseByLetter => 'Shfletoni sipas Letër';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Shfletimi alfabetik do të shfaqet këtu';

  @override
  String get suggestions => 'Sugjerime';

  @override
  String get suggestionsPlaceholder =>
      'Artikujt e sugjeruar do të shfaqen këtu';

  @override
  String get failedToLoadLibraries => 'Ngarkimi i bibliotekave dështoi';

  @override
  String get noLibrariesFound => 'Nuk u gjetën biblioteka';

  @override
  String get library => 'Biblioteka';

  @override
  String get displaySettings => 'Cilësimet e ekranit';

  @override
  String get allGenres => 'Të gjitha zhanret';

  @override
  String get noGenresFound => 'Nuk u gjetën zhanre';

  @override
  String failedToLoadFolderError(String error) {
    return 'Ngarkimi i dosjes dështoi: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Kjo dosje është bosh';

  @override
  String itemCountLabel(int count) {
    return '$count artikuj';
  }

  @override
  String get failedToLoadFavorites => 'Ngarkimi i të preferuarave dështoi';

  @override
  String get retry => 'Provo sërish';

  @override
  String get noFavoritesYet => 'Ende nuk ka të preferuar';

  @override
  String get favorites => 'Të preferuarat';

  @override
  String totalCountItems(int count) {
    return '$count Artikuj';
  }

  @override
  String get continuing => 'Duke vazhduar';

  @override
  String get ended => 'Përfundoi';

  @override
  String get sortAndFilter => 'Rendit & Filtro';

  @override
  String get type => 'Lloji';

  @override
  String get sortBy => 'Rendit sipas';

  @override
  String get display => 'Ekrani';

  @override
  String get imageType => 'Lloji i imazhit';

  @override
  String get posterSize => 'Madhësia e posterit';

  @override
  String get small => 'I vogël';

  @override
  String get medium => 'E mesme';

  @override
  String get large => 'I madh';

  @override
  String get extraLarge => 'Shumë i madh';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Zhanret';
  }

  @override
  String get views => 'Pamje';

  @override
  String get albums => 'Albumet';

  @override
  String get albumArtists => 'Artistët e albumeve';

  @override
  String get artists => 'Artistët';

  @override
  String get bookmarks => 'Faqerojtësit';

  @override
  String get noSavedBookmarks =>
      'Nuk ka ende faqeshënues të ruajtur për këtë titull.';

  @override
  String get openBook => 'Libri i hapur';

  @override
  String get chapter => 'Kapitulli';

  @override
  String get page => 'Faqe';

  @override
  String get bookmark => 'Shënoni faqeshënues';

  @override
  String get justNow => 'Vetëm tani';

  @override
  String minutesAgo(int count) {
    return '$count min më parë';
  }

  @override
  String hoursAgo(int count) {
    return '$count orë më parë';
  }

  @override
  String daysAgo(int count) {
    return '$count ditë më parë';
  }

  @override
  String get discoverySubjects => 'Temat e zbulimit';

  @override
  String get pickDiscoverySubjects =>
      'Zgjidh se cili subjekt ushqehet për të shfaqur në \"Zbulo\".';

  @override
  String get apply => 'Zbato';

  @override
  String get openLink => 'Hap lidhjen';

  @override
  String get scanWithYourPhone => 'Skanoni me telefonin tuaj';

  @override
  String get audiobookGenres => 'Zhanret e librave audio';

  @override
  String get pickAudiobookGenres =>
      'Zgjidh se cilat zhanre do të shfaqen në Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Zbuloni libra audio';

  @override
  String get librivoxDescription =>
      'Titujt e domenit publik të njohur nga LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count tituj';
  }

  @override
  String get scrollLeft => 'Lëviz majtas';

  @override
  String get scrollRight => 'Lëviz djathtas';

  @override
  String get couldNotLoadGenre =>
      'Ky zhanër nuk mund të ngarkohej për momentin.';

  @override
  String get continueReading => 'Vazhdo Leximi';

  @override
  String get savedHighlights => 'Pikat kryesore të ruajtura';

  @override
  String get continueListening => 'Vazhdoni të dëgjoni';

  @override
  String get listen => 'Dëgjo';

  @override
  String get resume => 'Vazhdo';

  @override
  String get failedToLoadLibrary => 'Ngarkimi i bibliotekës dështoi';

  @override
  String get popularNow => 'Popullore Tani';

  @override
  String get savedForLater => 'Ruajtur për më vonë';

  @override
  String get topListens => 'Top Dëgjimet';

  @override
  String get unreadDiscoveries => 'Zbulime të palexuara';

  @override
  String get pickUpAgain => 'Merr Përsëri';

  @override
  String get bookHighlightsDescription =>
      'Librat tuaj me pikat kryesore, të preferuarat ose përparimin e leximit.';

  @override
  String get handPickedFromLibrary => 'Zgjedhur me dorë nga biblioteka juaj.';

  @override
  String get handPickedFromListeningQueue =>
      'E zgjedhur me dorë nga radha juaj e dëgjimit.';

  @override
  String get booksWithHighlights =>
      'Libra me pikat kryesore, të preferuarat ose përparimin e leximit.';

  @override
  String get jumpBackNarration =>
      'Kthehuni përsëri në tregim pa kërkuar vendin tuaj.';

  @override
  String get unreadBooksReady =>
      'Libra të palexuar gati për orën tjetër të qetë.';

  @override
  String get quickAccessFavorites =>
      'Qasje e shpejtë te librat ku riktheheni vazhdimisht.';

  @override
  String get searchAudiobooks => 'Kërkoni libra audio';

  @override
  String get searchYourLibrary => 'Kërkoni bibliotekën tuaj';

  @override
  String get pickUpStory => 'Filloni historinë aty ku e keni lënë';

  @override
  String get savedPlacesChapters =>
      'Vendet tuaja të ruajtura dhe kapitujt e papërfunduar';

  @override
  String authorsCount(int count) {
    return '$count autorë';
  }

  @override
  String genresCount(int count) {
    return '$count zhanre';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% e përfunduar';
  }

  @override
  String get readyWhenYouAre => 'Gati kur të jeni';

  @override
  String get details => 'Detajet';

  @override
  String get listeningRoom => 'Dhoma e Dëgjimit';

  @override
  String get bookmarksAndProgress => 'Faqeshënuesit dhe përparimi';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count tituj të renditur për shfletim me leximin në plan të parë.';
  }

  @override
  String get titles => 'Titujt';

  @override
  String get allTitles => 'Të gjithë titujt';

  @override
  String get authors => 'Autorët';

  @override
  String get browseByAuthor => 'Shfletoni sipas autorit';

  @override
  String get browseByGenre => 'Shfletoni sipas zhanrit';

  @override
  String get discover => 'Zbuloni';

  @override
  String get trendingTitlesOpenLibrary =>
      'Titujt në tendencë sipas subjektit nga Open Library.';

  @override
  String get noBookmarkedItems => 'Nuk ka ende artikuj të shënuar';

  @override
  String get nothingMatchesSection =>
      'Asgjë nuk përputhet ende me këtë seksion. Provo një skedë tjetër ose kthehu pasi të përfundojë sinkronizimi i bibliotekës.';

  @override
  String get audiobooks => 'Audiolibra';

  @override
  String noLabelFound(String label) {
    return 'Nuk u gjet asnjë $label';
  }

  @override
  String get folder => 'Dosja';

  @override
  String get filters => 'Filtrat';

  @override
  String get readingStatus => 'Statusi i Leximit';

  @override
  String get playedStatus => 'Statusi i luajtur';

  @override
  String get readStatus => 'Lexoni';

  @override
  String get watched => 'Të shikuara';

  @override
  String get unread => 'Të palexuara';

  @override
  String get unwatched => 'Të pashikuara';

  @override
  String get seriesStatus => 'Statusi i Serisë';

  @override
  String get allLibraries => 'Të gjitha Bibliotekat';

  @override
  String get books => 'libra';

  @override
  String get latestBooks => 'Librat më të fundit';

  @override
  String get latestAudiobooks => 'Audiolibrat më të fundit';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libra',
      one: '1 libër',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Libër';

  @override
  String get bookFormatAudiobook => 'Audiolibër';

  @override
  String bookPercentRead(int percent) {
    return '$percent% i lexuar';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time të mbetura';
  }

  @override
  String get bookHeroRead => 'Lexo';

  @override
  String get bookHeroListen => 'Dëgjo';

  @override
  String get author => 'Autori';

  @override
  String get unknownAuthor => 'Autor i panjohur';

  @override
  String get uncategorized => 'E pakategorizuar';

  @override
  String get overview => 'Vështrim i përgjithshëm';

  @override
  String get noLibrivoxDescription =>
      'Nuk ka ende përshkrim nga LibriVox për këtë titull.';

  @override
  String get readers => 'Lexuesit';

  @override
  String get openLinks => 'Hap Lidhjet';

  @override
  String get librivoxPage => 'Faqe LibriVox';

  @override
  String get internetArchive => 'Arkivi i Internetit';

  @override
  String get rssFeed => 'Burim RSS';

  @override
  String get downloadZip => 'Shkarko Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count seksione';
  }

  @override
  String firstPublished(int year) {
    return 'Botuar për herë të parë më $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Nuk disponohet ende përmbledhje nga Open Library për këtë titull.';

  @override
  String get subjects => 'Subjektet';

  @override
  String get all => 'Të gjitha';

  @override
  String booksCount(int count) {
    return '$count libra';
  }

  @override
  String get couldNotLoadSubject =>
      'Kjo temë nuk mund të ngarkohej për momentin.';

  @override
  String get audiobookDetails => 'Detajet e librit audio';

  @override
  String authorsCountTitle(int count) {
    return '$count Autorë';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiolibra',
      one: '1 audiolibër',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lista e këngëve';

  @override
  String get itemListPlaceholder => 'Lista e artikujve do të shfaqet këtu';

  @override
  String get failedToLoad => 'Ngarkimi dështoi';

  @override
  String get delete => 'Fshi';

  @override
  String get save => 'Ruaj';

  @override
  String get moreLikeThis => 'Më shumë si kjo';

  @override
  String get castAndCrew => 'Aktorët dhe ekipi';

  @override
  String get collection => 'Mbledhja';

  @override
  String get episodes => 'Episodet';

  @override
  String get nextUp => 'Në vijim';

  @override
  String get seasons => 'Sezonet';

  @override
  String get chapters => 'Kapitujt';

  @override
  String get features => 'Veçoritë';

  @override
  String get movies => 'Filmat';

  @override
  String get musicVideos => 'Videoklipe muzikore';

  @override
  String get other => 'Të tjera';

  @override
  String get discography => 'Diskografia';

  @override
  String get similarArtists => 'Artistë të ngjashëm';

  @override
  String get tableOfContents => 'Tabela e Përmbajtjes';

  @override
  String get tracklist => 'Lista e këngëve';

  @override
  String discNumber(int number) {
    return 'Disku $number';
  }

  @override
  String get biography => 'Biografia';

  @override
  String get authorDetails => 'Detajet e autorit';

  @override
  String get noOverviewAvailable =>
      'Nuk disponohet ende përmbledhje për këtë titull.';

  @override
  String get noBiographyAvailable => 'Nuk ka biografi për këtë autor.';

  @override
  String get noBooksFound => 'Nuk u gjetën libra për këtë autor.';

  @override
  String get unableToLoadAuthorDetails =>
      'Nuk mund të ngarkohen detajet e autorit për momentin.';

  @override
  String published(int year) {
    return 'Botuar më $year';
  }

  @override
  String get publicationDateUnknown => 'Data e publikimit nuk dihet';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sezone',
      one: '1 Sezon',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Përfundon në $time';
  }

  @override
  String get items => 'Artikuj';

  @override
  String get extras => 'Ekstra';

  @override
  String get behindTheScenes => 'Prapa skenave';

  @override
  String get deletedScenes => 'Skena të fshira';

  @override
  String get featurettes => 'Dokumentarë të shkurtër';

  @override
  String get interviews => 'Intervista';

  @override
  String get scenes => 'Skena';

  @override
  String get shorts => 'Filma të shkurtër';

  @override
  String get trailers => 'Trailerat';

  @override
  String timeRemaining(String time) {
    return '$time të mbetura';
  }

  @override
  String endsIn(String time) {
    return 'Përfundon pas $time';
  }

  @override
  String get view => 'Shiko';

  @override
  String get resumeReading => 'Rifilloni leximin';

  @override
  String get read => 'Lexoni';

  @override
  String resumeFrom(String position) {
    return 'Vazhdo nga $position';
  }

  @override
  String get play => 'Luaj';

  @override
  String get startOver => 'Filloni përsëri';

  @override
  String get restart => 'Rinis';

  @override
  String get readOffline => 'Lexo Offline';

  @override
  String get playOffline => 'Luaj Offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Titra';

  @override
  String get version => 'Versioni';

  @override
  String get cast => 'Transmeto';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Përfunduar';

  @override
  String get favorited => 'I preferuar';

  @override
  String get favorite => 'E preferuara';

  @override
  String get playlist => 'Lista e luajtjes';

  @override
  String get downloaded => 'U shkarkua';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get downloadAll => 'Shkarkoni të gjitha';

  @override
  String get download => 'Shkarkoni';

  @override
  String get deleteDownloaded => 'Fshi i shkarkuar';

  @override
  String get goToSeries => 'Shkoni te Seria';

  @override
  String get editMetadata => 'Redakto të dhënat meta';

  @override
  String get less => 'Më pak';

  @override
  String get more => 'Më shumë';

  @override
  String get deleteItem => 'Fshi artikullin';

  @override
  String get deletePlaylist => 'Fshi listën e luajtjes';

  @override
  String get deletePlaylistMessage =>
      'Të fshihet kjo listë për luajtje nga serveri?';

  @override
  String get deleteItemMessage => 'Të fshihet ky artikull nga serveri?';

  @override
  String get failedToDeletePlaylist => 'Fshirja e listës së luajtjes dështoi';

  @override
  String get failedToDeleteItem => 'Fshirja e artikullit dështoi';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Riemërto listën e luajtjes';

  @override
  String get playlistName => 'Emri i listës së luajtjes';

  @override
  String get deleteDownloadedAlbum => 'Fshi albumin e shkarkuar';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Të fshihen pistat e shkarkuara për \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Këngët e shkarkuara u fshinë';

  @override
  String get downloadedTracksDeleteFailed =>
      'Disa këngë të shkarkuara nuk mund të fshiheshin';

  @override
  String get noTracksLoaded => 'Nuk është ngarkuar asnjë këngë';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Asnjë $itemLabel nuk u ngarkua';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Po shkarkohet $title ($count artikuj)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Jeni i sigurt që doni të fshini \"$name\" nga serveri? Ky veprim nuk mund të zhbëhet.';
  }

  @override
  String get itemDeleted => 'Artikulli u fshi';

  @override
  String get noPlayableTrailerFound =>
      'Nuk u gjet asnjë rimorkio që mund të luhet.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Format libri i pambështetur: .$extension';
  }

  @override
  String get audioTrack => 'Pjesë audio';

  @override
  String get subtitleTrack => 'Pjesa e titrave';

  @override
  String get none => 'Asnjë';

  @override
  String get downloadSubtitlesLabel => 'Shkarko titrat...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Kërkoni duke përdorur shtojcën OpenSubtitles';

  @override
  String get downloadSubtitles => 'Shkarko titrat';

  @override
  String get selectedSubtitleInvalid => 'Titra e zgjedhur është e pavlefshme.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Titra u shkarkua dhe u zgjodh: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Titrat u shkarkuan. Mund të duhet një moment për t\'u shfaqur ndërsa Jellyfin rifreskon artikullin.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nuk u gjetën titra online për $language.';
  }

  @override
  String get selectVersion => 'Zgjidhni Version';

  @override
  String versionNumber(int number) {
    return 'Versioni $number';
  }

  @override
  String get downloadAllQuality => 'Shkarkoni të gjitha - Cilësi';

  @override
  String get downloadQuality => 'Cilësia e shkarkimit';

  @override
  String get originalFileNoReencoding => 'Skedar origjinal, pa ri-kodim';

  @override
  String get originalFilesNoReencoding => 'Skedarët origjinalë, pa ri-kodim';

  @override
  String get noEpisodesLoaded => 'Nuk është ngarkuar asnjë episode';

  @override
  String downloadingItem(String name, String quality) {
    return 'Po shkarkohet $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Fshi skedarët e shkarkuar';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Të fshihen skedarët lokalë për $typeLabel?\n\nKjo do të lirojë hapësirë ruajtjeje. Mund t\'i rishkarkoni më vonë.';
  }

  @override
  String get downloadedFilesDeleted => 'Skedarët e shkarkuar u fshinë';

  @override
  String get failedToDeleteFiles => 'Fshirja e skedarëve dështoi';

  @override
  String get deleteFiles => 'Fshi skedarët';

  @override
  String get director => 'DREJTOR';

  @override
  String get directors => 'REGJISORËT';

  @override
  String get writer => 'SKENARISTI';

  @override
  String get writers => 'SKENARISTËT';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count të tjera';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episode';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Episodi $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Kapitulli $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pista',
      one: '1 pistë',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kapituj',
      one: '1 kapitull',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Lindur më $date';
  }

  @override
  String died(String date) {
    return 'Vdiq më $date';
  }

  @override
  String age(int age) {
    return 'Mosha $age';
  }

  @override
  String get showLess => 'Trego më pak';

  @override
  String get readMore => 'Lexo më shumë';

  @override
  String get shuffle => 'Përziej';

  @override
  String get shuffleAllMusic => 'Luaj rastësisht të gjithë muzikën';

  @override
  String get carSignInPrompt => 'Hyni në Moonfin në telefonin tuaj';

  @override
  String get carServerUnreachable => 'Serveri juaj nuk arrihet';

  @override
  String downloadsCount(int count) {
    return '$count shkarkime';
  }

  @override
  String get perfectMatch => 'Ndeshje perfekte';

  @override
  String channelsCount(int count) {
    return '$count kanale';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return '$action i titrave online kërkon lejen e menaxhimit të titrave në Jellyfin për këtë përdorues.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Ky artikull nuk u gjet në server për $action e titrave online.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '$action i titrave online dështoi: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '$action i titrave online dështoi (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Nuk u arrit të $action titrat online.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'të gjitha episodet e shkarkuara për \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'të gjitha episodet e shkarkuara në këtë sezon';

  @override
  String get stillWatching => 'Ende duke parë?';

  @override
  String get unableToLoadTrailerStream =>
      'Nuk mund të ngarkohet transmetimi i rimorkios.';

  @override
  String get trailerTimedOut => 'Koha e rimorkios mbaroi gjatë ngarkimit.';

  @override
  String get playbackFailedForTrailer =>
      'Riprodhimi dështoi për këtë rimorkio.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Transmetimi nuk ofrohet gjatë luajtjes jashtë linje.';

  @override
  String castActionFailed(String label, String error) {
    return 'Veprimi $label dështoi: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Vendosja e volumit të transmetimit dështoi: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Kontrollet e $label';
  }

  @override
  String get deviceVolume => 'Volumi i pajisjes';

  @override
  String get unavailable => 'I padisponueshëm';

  @override
  String get pause => 'Pauzë';

  @override
  String get syncPosition => 'Pozicioni i sinkronizimit';

  @override
  String stopCast(String label) {
    return 'Ndalo $label';
  }

  @override
  String get queueIsEmpty => 'Radha është bosh';

  @override
  String trackNumber(int number) {
    return 'Pista $number';
  }

  @override
  String get remotePlayback => 'Riprodhimi në distancë';

  @override
  String get castingToGoogleCast => 'Transmetimi në Google Cast';

  @override
  String get castingViaAirPlay => 'Transmetimi përmes AirPlay';

  @override
  String get castingViaDlna => 'Transmetimi përmes DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekonda';
  }

  @override
  String get longPressToUnlock => 'Shtypni gjatë për ta zhbllokuar';

  @override
  String get off => 'Fikur';

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
  String get bitrateOverride => 'Mbështetja e shpejtësisë së biteve';

  @override
  String get audioDelay => 'Vonesa e audios';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Vonesa e titrave';

  @override
  String get reset => 'Rivendos';

  @override
  String get unknown => 'E panjohur';

  @override
  String get playbackInformation => 'Informacioni i riprodhimit';

  @override
  String get playback => 'Riprodhimi';

  @override
  String get playMethod => 'Metoda e lojës';

  @override
  String get directPlay => 'Luaj direkt';

  @override
  String get directStream => 'Transmetim i drejtpërdrejtë';

  @override
  String get transcoding => 'Transkodimi';

  @override
  String get transcodeReasons => 'Arsyet e transkodimit';

  @override
  String get player => 'Luajtësi';

  @override
  String get container => 'Enë';

  @override
  String get bitrate => 'Shpejtësia e biteve';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Rezolucioni';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodiku';

  @override
  String get videoBitrate => 'Shpejtësia e biteve të videos';

  @override
  String get track => 'Pista';

  @override
  String get channels => 'Kanalet';

  @override
  String get audioBitrate => 'Shpejtësia e biteve të audios';

  @override
  String get sampleRate => 'Norma e mostrës';

  @override
  String get format => 'Formati';

  @override
  String get external => 'E jashtme';

  @override
  String get embedded => 'Të ngulitura';

  @override
  String castSessionError(String protocol) {
    return 'Gabim në sesionin $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Ngarkimi i detajeve të librit dështoi: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Paraqitja e EPUB brenda aplikacionit nuk ofrohet ende në këtë platformë.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Ky format (.$extension) nuk mund të paraqitet ende brenda aplikacionit.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Paraqitja e dokumentit të integruar nuk ofrohet në këtë platformë.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nuk mund të hapej shikuesi i jashtëm.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Hapja e lexuesit brenda aplikacionit dështoi: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Faqeshënuesi është ruajtur tashmë te $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Faqeshënuesi u shtua: $label';
  }

  @override
  String get noBookmarksYet =>
      'Nuk ka ende faqeshënues.\nPrekni ikonën e faqeshënuesit gjatë leximit për të ruajtur pozicionin tuaj.';

  @override
  String get noTableOfContentsAvailable => 'Nuk ka tabelë të përmbajtjes';

  @override
  String pageLabel(int number) {
    return 'Faqja $number';
  }

  @override
  String get position => 'Pozicioni';

  @override
  String get bookReader => 'Lexues libri';

  @override
  String formatExtension(String extension) {
    return 'Formati: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% i lexuar';
  }

  @override
  String get updating => 'Po përditësohet...';

  @override
  String get markUnread => 'Shënoni të palexuar';

  @override
  String get markAsRead => 'Shënoni si të lexuar';

  @override
  String get reloadReader => 'Rifresko lexuesin';

  @override
  String get noPagesFound => 'Nuk u gjet asnjë faqe.';

  @override
  String get failedToDecodePageImage =>
      'Deshifrimi i imazhit të faqes dështoi.';

  @override
  String resetZoom(String zoom) {
    return 'Rivendos zmadhimin (${zoom}x)';
  }

  @override
  String get singlePage => 'Faqe e vetme';

  @override
  String get twoPageSpread => 'Përhapja me dy faqe';

  @override
  String get addBookmark => 'Shto faqeshënues';

  @override
  String get bookmarksEllipsis => 'Faqeshënuesit...';

  @override
  String get markedAsRead => 'Shënuar si të lexuar';

  @override
  String get markedAsUnread => 'Shënuar si të palexuar';

  @override
  String failedToUpdateReadState(String error) {
    return 'Përditësimi i gjendjes së leximit dështoi: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistemi';

  @override
  String get themeLight => 'Tema: Drita';

  @override
  String get themeDark => 'Tema: E errët';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Inverto ngjyrat (planifikim fiks)';

  @override
  String get invertColorsPdf => 'Inverto ngjyrat (PDF)';

  @override
  String get preparingInAppReader =>
      'Po përgatit lexuesin brenda aplikacionit...';

  @override
  String get pdfDataNotAvailable => 'Të dhënat PDF nuk janë të disponueshme.';

  @override
  String get readerFallbackModeActive =>
      'Modaliteti mbështetës i lexuesit është aktiv';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Kjo platformë nuk mund të presë motorin e integruar të dokumenteve për skedarët $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Përdorni \"Reload Reader\" pasi të kaloni në një objektiv të platformës së mbështetur (Android, iOS, macOS).';

  @override
  String get openExternally => 'Hapni nga jashtë';

  @override
  String get noEpubChaptersFound => 'Nuk u gjetën kapituj EPUB.';

  @override
  String get readerNotReady => 'Lexuesi nuk është gati.';

  @override
  String get seriesRecordings => 'Regjistrimet e Serive';

  @override
  String get now => 'Tani';

  @override
  String get sports => 'Sportive';

  @override
  String get news => 'Lajme';

  @override
  String get kids => 'Fëmijët';

  @override
  String get premiere => 'Premiera';

  @override
  String get guideTimeline => 'Afati kohor i udhëzuesit';

  @override
  String failedToLoadGuide(String error) {
    return 'Ngarkimi i udhëzuesit dështoi: $error';
  }

  @override
  String get noChannelsFound => 'Nuk u gjet asnjë kanal';

  @override
  String get liveBadge => 'LIVE';

  @override
  String guideNextProgram(String time, String title) {
    return 'Tjetra: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes min të mbetura';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours orë të mbetura';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours orë e $minutes min të mbetura';
  }

  @override
  String get movie => 'Filmi';

  @override
  String get removedFromFavoriteChannels => 'U hoq nga kanalet e preferuara';

  @override
  String get addedToFavoriteChannels => 'Shtuar në kanalet e preferuara';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Përditësimi i kanalit të preferuar dështoi';

  @override
  String get unfavoriteChannel => 'Kanali jo i preferuar';

  @override
  String get favoriteChannel => 'Kanali i preferuar';

  @override
  String get record => 'Regjistro';

  @override
  String get cancelRecordingAction => 'Anulo regjistrimin';

  @override
  String get programSetToRecord => 'Programi u caktua për regjistrim';

  @override
  String get recordingCancelled => 'Regjistrimi u anulua';

  @override
  String get unableToCreateRecording => 'Regjistrimi nuk mund të krijohet';

  @override
  String get watch => 'Shiko';

  @override
  String get close => 'Mbyll';

  @override
  String failedToPlayChannel(String name) {
    return 'Luajtja e $name dështoi';
  }

  @override
  String get failedToLoadRecordings => 'Ngarkimi i regjistrimeve dështoi';

  @override
  String get scheduledInNext24Hours => 'Planifikuar në 24 orët e ardhshme';

  @override
  String get recentRecordings => 'Regjistrimet e fundit';

  @override
  String get tvSeries => 'Seriale televizive';

  @override
  String get failedToLoadSchedule => 'Ngarkimi i planit dështoi';

  @override
  String get noScheduledRecordings => 'Nuk ka regjistrime të planifikuara';

  @override
  String get cancelRecording => 'Të anulohet regjistrimi?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Të anulohet regjistrimi i planifikuar i \"$name\"?';
  }

  @override
  String get no => 'Jo';

  @override
  String get yesCancel => 'Po, Anulo';

  @override
  String get failedToCancelRecording => 'Anulimi i regjistrimit dështoi';

  @override
  String get failedToLoadSeriesRecordings =>
      'Ngarkimi i regjistrimeve të serisë dështoi';

  @override
  String get noSeriesRecordings => 'Nuk ka regjistrime në seri';

  @override
  String get cancelSeriesRecording => 'Anulo regjistrimin e serisë';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Të anulohet regjistrimi i serisë?';

  @override
  String stopRecordingName(String name) {
    return 'Të ndalohet regjistrimi i \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Anulimi i regjistrimit të serisë dështoi';

  @override
  String get searchThisLibrary => 'Kërko në këtë bibliotekë...';

  @override
  String get searchEllipsis => 'Kërko...';

  @override
  String noResultsForQuery(String query) {
    return 'Asnjë rezultat për \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Kërkimi dështoi: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Lloji i llogarisë Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokale';

  @override
  String get savedMedia => 'Media e ruajtur';

  @override
  String get tvShows => 'Shfaqje televizive';

  @override
  String get music => 'Muzikë';

  @override
  String get musicAlbums => 'Albume muzikore';

  @override
  String get noMediaInFilter => 'Nuk ka media në këtë filtër';

  @override
  String get noDownloadedMediaYet => 'Nuk ka ende media të shkarkuar';

  @override
  String get browseLibrary => 'Shfletoni Bibliotekën';

  @override
  String get deleteDownload => 'Fshi shkarkimin';

  @override
  String removeItemAndFiles(String name) {
    return 'Të hiqet \"$name\" dhe skedarët e tij?';
  }

  @override
  String tracksCount(int count) {
    return '$count pista';
  }

  @override
  String get album => 'Albumi';

  @override
  String get playAlbum => 'Luaj albumin';

  @override
  String failedToLoadAlbum(String error) {
    return 'Ngarkimi i albumit dështoi: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Nuk u gjetën pista të shkarkuara për $name.';
  }

  @override
  String get season => 'Sezoni';

  @override
  String get errorLoadingEpisodes => 'Gabim gjatë ngarkimit të episodeve';

  @override
  String get noDownloadedEpisodes => 'Nuk ka episode të shkarkuara';

  @override
  String get deleteEpisode => 'Fshi episodin';

  @override
  String removeName(String name) {
    return 'Të hiqet \"$name\"?';
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
    return 'Episodi $number';
  }

  @override
  String get seriesNotFound => 'Seria nuk u gjet';

  @override
  String get errorLoadingSeries => 'Gabim gjatë ngarkimit të serisë';

  @override
  String get downloadedEpisodes => 'Episodet e shkarkuara';

  @override
  String seasonNumber(int number) {
    return 'Sezoni $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Speciale';

  @override
  String get deleteSeason => 'Fshi sezonin';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Të fshihen të gjitha episodet e shkarkuara në $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episode',
      one: '1 episod',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Menaxhimi i ruajtjes';

  @override
  String get storageBreakdown => 'Ndarja e ruajtjes';

  @override
  String get downloadedItems => 'Artikujt e shkarkuar';

  @override
  String get storageLimit => 'Kufiri i ruajtjes';

  @override
  String get noLimit => 'Nuk ka kufi';

  @override
  String get deleteAllDownloads => 'Fshi të gjitha shkarkimet';

  @override
  String get deleteAllDownloadsWarning =>
      'Kjo do të heqë të gjithë skedarët e shkarkuar të mediave dhe nuk mund të zhbëhet.';

  @override
  String get deleteAll => 'Fshi të gjitha';

  @override
  String get deleteSelected => 'Fshi të zgjedhurit';

  @override
  String deleteSelectedCount(int count) {
    return 'Të fshihen $count artikuj të shkarkuar?';
  }

  @override
  String get musicAndAudiobooks => 'Muzikë dhe Audiolibra';

  @override
  String get images => 'Imazhet';

  @override
  String get database => 'Baza e të dhënave';

  @override
  String ofStorageLimit(String limit) {
    return 'nga kufiri $limit';
  }

  @override
  String get settings => 'Cilësimet';

  @override
  String get authentication => 'Autentifikimi';

  @override
  String get autoLoginServerManagement =>
      'Hyrja automatike, menaxhimi i serverit';

  @override
  String get pinCode => 'Kodi PIN';

  @override
  String get setUpPinCodeProtection => 'Konfiguro mbrojtjen e kodit PIN';

  @override
  String get parentalControls => 'Kontrollet prindërore';

  @override
  String get contentRatingRestrictions =>
      'Kufizimet e vlerësimit të përmbajtjes';

  @override
  String get bitRateResolutionBehavior =>
      'Shpejtësia e biteve, rezolucioni, sjellja';

  @override
  String get languageSizeAppearance => 'Gjuha, madhësia, pamja';

  @override
  String get qualityStorage => 'Cilësia, ruajtja';

  @override
  String get serverSyncAndPluginStatus =>
      'Sinkronizimi i serverit dhe statusi i shtojcave';

  @override
  String get mediaRequestIntegration => 'Integrimi i kërkesës për media';

  @override
  String get switchServer => 'Ndërroni serverin';

  @override
  String get signOut => 'Dilni';

  @override
  String get versionLicenses => 'Versioni, licencat';

  @override
  String get account => 'Llogaria';

  @override
  String get signInAndSecurity => 'Hyrja dhe siguria';

  @override
  String get administration => 'Administrata';

  @override
  String get serverSettingsUsersLibraries =>
      'Cilësimet e serverit, përdoruesit, bibliotekat';

  @override
  String get customization => 'Përshtatje';

  @override
  String get themeAndLayout => 'Tema dhe faqosja';

  @override
  String get videoAndSubtitles => 'Video dhe titra';

  @override
  String get integrations => 'Integrimet';

  @override
  String get pluginAndRequests => 'Shtojca dhe kërkesat';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personalizo sjelljen e llogarisë, riprodhimit dhe ndërfaqes';

  @override
  String optionsCount(int count) {
    return '$count opsione';
  }

  @override
  String get themeAndAppearance => 'Tema & Pamja';

  @override
  String get focusBorderColor => 'Fokusimi i ngjyrës së kufirit';

  @override
  String get watchedIndicators => 'Treguesit e shikuar';

  @override
  String get always => 'Gjithmonë';

  @override
  String get hideUnwatched => 'Fshihe të pashikuara';

  @override
  String get episodesOnly => 'Vetëm episodet';

  @override
  String get never => 'kurrë';

  @override
  String get focusExpansionAnimation => 'Animacioni i zgjerimit të fokusit';

  @override
  String get desktopUiScale => 'Shkalla e ndërfaqes së desktopit';

  @override
  String get scaleFocusedCards =>
      'Zmadhoni kartat dhe pllakat e fokusuara ose të varura';

  @override
  String get backgroundBackdrops => 'Sfondi i sfondit';

  @override
  String get showBackdropImages => 'Shfaq imazhet e sfondit pas përmbajtjes';

  @override
  String get seriesThumbnails => 'Miniaturat e serive';

  @override
  String get seriesThumbnailsDescription =>
      'Vetëm episodet: përdorni vepra arti të serive që përputhen me çdo lloj imazhi rreshti';

  @override
  String get homeRowInfoOverlay =>
      'Mbivendosja e informacionit të rreshtit bazë';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Shfaq titullin dhe të dhënat meta kur shfletoni rreshtat kryesore';

  @override
  String get clockDisplay => 'Ekrani i orës';

  @override
  String get inMenus => 'Në menutë';

  @override
  String get inVideo => 'Në Video';

  @override
  String get seasonalEffects => 'Efektet sezonale';

  @override
  String get seasonalEffectsDescription =>
      'Efekte vizuale dhe dekorime sezonale';

  @override
  String get snow => 'borë';

  @override
  String get fireworks => 'fishekzjarre';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Gjethet që bien';

  @override
  String get themeMusic => 'Muzikë me temë';

  @override
  String get playThemeMusicOnDetailPages =>
      'Luaj muzikë me temë në faqet e detajeve';

  @override
  String get themeMusicVolume => 'Vëllimi i muzikës me temë';

  @override
  String get themeMusicSettingsSubtitle =>
      'Faqet e detajeve, rreshtat e kreut dhe volumi';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Muzika me temë në rreshtat kryesore';

  @override
  String get playWhenBrowsingHomeScreen => 'Luaj kur shfleton ekranin bazë';

  @override
  String get loopThemeMusic => 'Përsërit muzikën e temës';

  @override
  String get loopThemeMusicSubtitle =>
      'Përsërit pistën në vend që ta luash vetëm një herë';

  @override
  String get detailsBackgroundBlur => 'Detajet turbullimi i sfondit';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String get detailsBackgroundOpacitySubtitle =>
      'Adjust amount of opacity on modern detail pages from light to dark.';

  @override
  String get opacityLightest => 'Lightest';

  @override
  String get opacityLight => 'Light';

  @override
  String get opacityMedium => 'Medium';

  @override
  String get opacityDark => 'Dark';

  @override
  String get opacityDarkest => 'Darkest';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Shfletimi i turbullimit të sfondit';

  @override
  String get maxStreamingBitrate => 'Shpejtësia maksimale e transmetimit';

  @override
  String get maxResolution => 'Rezolucioni maksimal';

  @override
  String get playerZoomMode => 'Modaliteti i zmadhimit të lojtarit';

  @override
  String get settingsScrollWheelAction => 'Rrota e miut';

  @override
  String get settingsScrollWheelActionDescription =>
      'Zgjidh çfarë bën rrotullimi i rrotës së miut mbi video gjatë luajtjes.';

  @override
  String get scrollWheelActionOff => 'Fikur';

  @override
  String get scrollWheelActionSeek => 'Lëviz (përpara / prapa)';

  @override
  String get scrollWheelActionVolume => 'Volumi';

  @override
  String get playerTooltipVolume => 'Volumi';

  @override
  String get fit => 'Përshtatet';

  @override
  String get autoCrop => 'Prirje automatike';

  @override
  String get stretch => 'Shtrihu';

  @override
  String get refreshRateSwitching => 'Ndërrimi i shpejtësisë së rifreskimit';

  @override
  String get disabled => 'Çaktivizuar';

  @override
  String get scaleOnTv => 'Shkallë në TV';

  @override
  String get scaleOnDevice => 'Shkalla në pajisje';

  @override
  String get trickPlay => 'Luaj me mashtrim';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Shfaq miniaturën e pamjes paraprake kur kërkon';

  @override
  String get showDescriptionOnPause => 'Shfaq përshkrimin në pauzë';

  @override
  String get dimVideoShowOverview =>
      'Zbehni videon dhe shfaqni tekstin e përmbledhjes ndërsa është në pauzë';

  @override
  String get osdLockButton => 'Butoni i kyçjes së OSD';

  @override
  String get osdLockButtonDescription =>
      'Shfaq një buton kyçjeje që bllokon hyrjen me prekje derisa të shtypet gjatë';

  @override
  String get audioBehavior => 'Sjellja audio';

  @override
  String get downmixToStereo => 'Përzierje në stereo';

  @override
  String get defaultAudioLanguage => 'Gjuha e parazgjedhur e audios';

  @override
  String get fallbackAudioLanguage => 'Gjuha rezervë e audios';

  @override
  String get preferDefaultAudioTrack =>
      'Parapëlqe pistën audio të parazgjedhur';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Parapëlqe pistën audio origjinale para dublimit të lokalizuar.';

  @override
  String get preferAudioDescription => 'Parapëlqe pistat me përshkrim audio';

  @override
  String get preferAudioDescriptionDescription =>
      'Parapëlqe pistat me përshkrim audio para pistave normale.';

  @override
  String get transcodingAudio => 'Transkodim (Audio)';

  @override
  String get directStreamRemux => 'Transmetim i drejtpërdrejtë (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transkodim (Bitrate ose rezolucion)';

  @override
  String get transcodingVideoAndAudio => 'Transkodim (Video dhe audio)';

  @override
  String get transcodingVideo => 'Transkodim (Video)';

  @override
  String get autoServerDefault => 'Auto (Serveri i parazgjedhur)';

  @override
  String get english => 'anglisht';

  @override
  String get spanish => 'spanjisht';

  @override
  String get french => 'frëngjisht';

  @override
  String get german => 'gjermanisht';

  @override
  String get italian => 'italisht';

  @override
  String get portuguese => 'portugeze';

  @override
  String get japanese => 'japoneze';

  @override
  String get korean => 'koreane';

  @override
  String get chinese => 'kineze';

  @override
  String get russian => 'ruse';

  @override
  String get arabic => 'arabisht';

  @override
  String get hindi => 'Hindisht';

  @override
  String get dutch => 'holandeze';

  @override
  String get swedish => 'suedeze';

  @override
  String get norwegian => 'norvegjeze';

  @override
  String get danish => 'daneze';

  @override
  String get finnish => 'finlandez';

  @override
  String get polish => 'polonisht';

  @override
  String get ac3Passthrough => 'Kalim i drejtpërdrejtë AC3';

  @override
  String get dtsPassthrough => 'Kalimi DTS';

  @override
  String get trueHdSupport => 'Mbështetje TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream audio DTS vetëm në AVR; kërkon mbështetjen e marrësit dhe gjurmën e burimit DTS';

  @override
  String get enableTrueHdAudio =>
      'Aktivizo audion TrueHD (mund të mos funksionojë në të gjitha platformat)';

  @override
  String get settingsAudioOutputMode => 'Modaliteti i daljes audio';

  @override
  String get settingsAudioOutputModeDescription =>
      'Zgjidh se si dekodohet audioja. Kalimi i drejtpërdrejtë AVR dërgon transmetime të papërpunuara Dolby/DTS te marrësi juaj; Auto ose Downmix dekodon lokalisht.';

  @override
  String get settingsAudioOutputModeAvrPassthrough =>
      'Kalim i drejtpërdrejtë AVR';

  @override
  String get settingsAudioFallbackCodec => 'Kodeku rezervë i audios';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Zgjidh formatin e synuar për të transkoduar audion shumëkanalëshe kur transmetimi burimor nuk mund të luhet drejtpërdrejt ose të kalojë i papërpunuar.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Zbulim automatik\n(Rekomandohet)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Parazgjedhur)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Pa humbje)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Vetëm stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efikas)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Pa humbje)';

  @override
  String get settingsMaxAudioChannels => 'Kanalet maksimale audio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Konfiguro kanalet maksimale të sistemit tuaj audio. Transmetimet shumëkanalëshe që e tejkalojnë këtë kufi do të përzihen poshtë ose do të transkodohen.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Zbulim automatik\n(Parazgjedhja e harduerit)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Rrethues';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Kuadrafonik';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Rrethues';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Rrethues';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Rrethues';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Rrethues';

  @override
  String get settingsAudioPassthroughAdvanced =>
      'Kalim i drejtpërdrejtë (I avancuar)';

  @override
  String get settingsAudioCodecPassthrough =>
      'Kalim i drejtpërdrejtë i kodekut';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Aktivizo vetëm formatet që mbështet AVR-ja ose pajisja juaj HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Kalim i drejtpërdrejtë EAC3';

  @override
  String get settingsAudioEac3JocPassthrough =>
      'Kalim i drejtpërdrejtë EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough =>
      'Kalim i drejtpërdrejtë DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough =>
      'Kalim i drejtpërdrejtë DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'Kalim i drejtpërdrejtë TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough =>
      'Kalim i drejtpërdrejtë TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dërgo bitstream Dolby Digital Plus (EAC3) te dekoduesi i jashtëm.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Dërgo bitstream Dolby Atmos përmes EAC3 (JOC) te dekoduesi i jashtëm.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Dërgo bitstream DTS-HD MA (përfshin DTS core) te dekoduesi i jashtëm.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Dërgo bitstream Dolby TrueHD me metadata Atmos te dekoduesi i jashtëm.';

  @override
  String get settingsDetectedAudioCapabilities => 'Aftësitë audio të zbuluara';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Ende nuk ofrohet asnjë fotografi e aftësive në kohë ekzekutimi.';

  @override
  String get settingsAudioRouteLabel => 'Rruga';

  @override
  String get settingsAudioDecodeLabel => 'Dekodimi';

  @override
  String get settingsAudioPassthroughLabel => 'Kalim i drejtpërdrejtë';

  @override
  String get settingsAudioHdRoute => 'Rrugë audio HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Altoparlant';

  @override
  String get settingsAudioRouteHeadphones => 'Kufje';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kanale PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostikimi';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Niveli i videos';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Gama e videos';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Kodeku i titrave';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Kodekët audio të lejuar';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Kodekët audio HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Kodekët audio HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'kalim i drejtpërdrejtë audio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Rruga aktive audio';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Mbështetja e audios HD në rrugë';

  @override
  String get nightMode => 'Modaliteti i natës';

  @override
  String get compressDynamicRange => 'Kompresoni diapazonin dinamik';

  @override
  String get advancedMpv => 'mpv i avancuar';

  @override
  String get enableCustomMpvConf => 'Aktivizo mpv.conf të personalizuar';

  @override
  String get applyMpvConfBeforePlayback =>
      'Aplikoni një mpv.conf të specifikuar nga përdoruesi përpara se të fillojë riprodhimi';

  @override
  String get unsafeAdvancedMpvOptions =>
      'Opsione të pasigurta të avancuara mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Lejo një grup më të gjerë opsionesh mpv. Mund të prishë sjelljen e riprodhimit.';

  @override
  String get hardwareDecoding => 'Dekodimi i harduerit';

  @override
  String get hardwareDecodingSubtitle =>
      'Mund të përmirësojë performancën, por mund të shkaktojë probleme me riprodhimin në disa pajisje.';

  @override
  String get nextUpAndQueuing => 'Next Up & Quueing';

  @override
  String get nextUpDisplay => 'Shfaqja e radhës';

  @override
  String get extended => 'Zgjeruar';

  @override
  String get minimal => 'Minimale';

  @override
  String get nextUpTimeout => 'Kohëzgjatja e radhës';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Radha e mediave';

  @override
  String get autoQueueNextEpisodes => 'Radhë automatikisht episodet e ardhshme';

  @override
  String get stillWatchingPrompt => 'Ende duke parë Promptin';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Pas $episodes episodesh / $hours orësh';
  }

  @override
  String get resumeAndSkip => 'Rifillo & Kapërce';

  @override
  String get resumeRewind => 'Rifillo Rewind';

  @override
  String get unpauseRewind => 'Hiq pauzën e kthimit prapa';

  @override
  String get fiveSeconds => '5 sekonda';

  @override
  String get tenSeconds => '10 sekonda';

  @override
  String get fifteenSeconds => '15 sekonda';

  @override
  String get thirtySeconds => '30 sekonda';

  @override
  String get skipBackLength => 'Kapërceni gjatësinë e pasme';

  @override
  String get skipForwardLength => 'Kapërceni gjatësinë përpara';

  @override
  String get customMpvConfPath => 'Shtegu i personalizuar mpv.conf';

  @override
  String get notSetMpvConf =>
      'Nuk është vendosur. Moonfin do të provojë një mpv.conf të paracaktuar në dosjet e aplikacioneve/të dhënave.';

  @override
  String get selectMpvConf => 'Zgjidhni mpv.conf';

  @override
  String get pathToMpvConf => '/rruga/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Cilësimet e stilit (madhësia, ngjyra, zhvendosja) zbatohen për titrat e bazuara në tekst (SRT, VTT, TTML). Titrat ASS/SSA përdorin stilin e tyre të integruar, përveç nëse \"ASS/SSA Direct Play\" është i çaktivizuar. Titrat bitmap (PGS, DVB, VobSub) nuk mund të ristimulohen.';

  @override
  String get defaultSubtitleLanguage => 'Gjuha e parazgjedhur e titrave';

  @override
  String get defaultToNoSubtitles => 'Parazgjedhja është pa titra';

  @override
  String get turnOffSubtitlesByDefault => 'Çaktivizo titrat si parazgjedhje';

  @override
  String get subtitleSize => 'Madhësia e titrave';

  @override
  String get textFillColor => 'Ngjyra e mbushjes së tekstit';

  @override
  String get backgroundColor => 'Ngjyra e sfondit';

  @override
  String get textStrokeColor => 'Ngjyra e goditjes së tekstit';

  @override
  String get subtitleCustomization => 'Përshtatja e titrave';

  @override
  String get subtitleCustomizationDescription => 'Personalizo pamjen e titrave';

  @override
  String get subtitleMode => 'Modaliteti i titrave';

  @override
  String get subtitleModeFlagged => 'Të shënuara';

  @override
  String get subtitleModeAlways => 'Gjithmonë';

  @override
  String get subtitleModeForeign => 'Të huaja';

  @override
  String get subtitleModeForced => 'Të detyruara';

  @override
  String get subtitleModeFlaggedDescription =>
      'Luan pistat që janë shënuar brenda metadatave të skedarit media si \"të parazgjedhura\" ose \"të detyruara\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Ngarkon dhe shfaq automatikisht titrat sa herë që fillon një video.';

  @override
  String get subtitleModeForeignDescription =>
      'Aktivizon automatikisht titrat nëse pista audio e parazgjedhur është në një gjuhë të huaj.';

  @override
  String get subtitleModeForcedDescription =>
      'Ngarkon vetëm titrat e etiketuara shprehimisht me shenjën e metadatave \"të detyruara\".';

  @override
  String get subtitleModeNoneDescription =>
      'Çaktivizon plotësisht ngarkimin automatik të titrave.';

  @override
  String get fallbackSubtitleLanguage => 'Gjuha rezervë e titrave';

  @override
  String get subtitleStream => 'Transmetimi i titrave';

  @override
  String get subtitlePreviewText =>
      'Dhelpra e shpejtë kafe kërcen mbi qenin dembel';

  @override
  String get verticalOffset => 'Kompensimi vertikal';

  @override
  String get pgsDirectPlay => 'PGS Play Direct';

  @override
  String get directPlayPgsSubtitles => 'Luaj direkt titra PGS';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Play Direct';

  @override
  String get directPlayAssSsaSubtitles => 'Luaj direkt titrat ASS/SSA';

  @override
  String get white => 'E bardha';

  @override
  String get black => 'E zezë';

  @override
  String get yellow => 'E verdha';

  @override
  String get green => 'E gjelbër';

  @override
  String get cyan => 'Cian';

  @override
  String get red => 'E kuqe';

  @override
  String get transparent => 'Transparente';

  @override
  String get semiTransparentBlack => 'E zezë gjysmë transparente';

  @override
  String get global => 'globale';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Celular';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'U ngarkuan cilësimet e profilit $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Ngarkimi i cilësimeve të profilit $profile dështoi.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Cilësimet lokale u sinkronizuan me profilin $profile.';
  }

  @override
  String get customizationProfile => 'Profili i personalizimit';

  @override
  String get customizationProfileDescription =>
      'Zgjidhni profilin për të ngarkuar, modifikuar dhe sinkronizuar. Global zbatohet kudo, përveç nëse një profil pajisjeje e anulon atë. Pika e gjelbër shënon profilin tuaj aktual të pajisjes.';

  @override
  String get loadProfile => 'Ngarko profilin';

  @override
  String get syncing => 'Po sinkronizohet...';

  @override
  String get syncToProfile => 'Sinkronizimi me profilin';

  @override
  String get profileSyncHidden => 'Sinkronizimi i profilit është i fshehur';

  @override
  String get enablePluginSyncDescription =>
      'Aktivizo Sinkronizimin e Shtojcave të Serverit në cilësimet e shtojcave për të shfaqur kontrollet e profilit këtu.';

  @override
  String get quality => 'Cilësia';

  @override
  String get defaultDownloadQuality => 'Cilësia e parazgjedhur e shkarkimit';

  @override
  String get network => 'Rrjeti';

  @override
  String get wifiOnlyDownloads => 'Shkarkime vetëm me WiFi';

  @override
  String get reportDownloadsActivity => 'Shfaq shkarkimet në server';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Lejo administratorin e serverit të shohë shkarkimet tuaja të transkoduara në panel';

  @override
  String get onlyDownloadOnWifi => 'Shkarkoni vetëm kur lidheni me WiFi';

  @override
  String get storage => 'Magazinimi';

  @override
  String get storageUsed => 'Magazinimi i përdorur';

  @override
  String get manage => 'Menaxhoni';

  @override
  String get calculating => 'Po llogaritet...';

  @override
  String get downloadLocation => 'Vendndodhja e shkarkimit';

  @override
  String get defaultLabel => 'E paracaktuar';

  @override
  String get saveToDownloadsFolder => 'Ruaje në dosjen Shkarkime';

  @override
  String get downloadsVisibleToOtherApps =>
      'Shkarkime/Moonfin — i dukshëm për aplikacionet e tjera';

  @override
  String get dangerZone => 'Zona e rrezikut';

  @override
  String get clearAllDownloads => 'Pastro të gjitha shkarkimet';

  @override
  String get original => 'Origjinale';

  @override
  String get changeDownloadLocation => 'Ndrysho vendndodhjen e shkarkimit';

  @override
  String get changeDownloadLocationDescription =>
      'Shkarkimet e reja do të ruhen në dosjen e zgjedhur. Shkarkimet ekzistuese do të mbeten në vendndodhjen e tyre aktuale dhe mund të menaxhohen nga cilësimet e hapësirës ruajtëse.';

  @override
  String get confirm => 'Konfirmo';

  @override
  String get cannotWriteToFolder =>
      'Nuk mund të shkruhet në dosjen e zgjedhur. Ju lutemi zgjidhni një vendndodhje tjetër ose jepni lejet e ruajtjes.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Të ruhet në dosjen \"Shkarkime\"?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Media e shkarkuar do të ruhet te Shkarkimet/Moonfin në pajisjen tuaj. Këta skedarë do të jenë të dukshëm për aplikacionet e tjera, si p.sh. galeria ose luajtësi muzikor.\n\nShkarkimet ekzistuese do të mbeten në vendndodhjen e tyre aktuale.';

  @override
  String get enable => 'Aktivizo';

  @override
  String get clearAllDownloadsWarning =>
      'Kjo do të fshijë të gjitha mediat e shkarkuara dhe nuk mund të zhbëhet.';

  @override
  String get clearAll => 'Pastro të gjitha';

  @override
  String get navigationStyle => 'Stili i lundrimit';

  @override
  String get topBar => 'Shiriti i sipërm';

  @override
  String get leftSidebar => 'Shiriti anësor i majtë';

  @override
  String get showShuffleButton => 'Shfaq butonin e përzierjes';

  @override
  String get showGenresButton => 'Butoni i shfaqjes së zhanreve';

  @override
  String get showFavoritesButton => 'Shfaq butonin e të preferuarave';

  @override
  String get showLibrariesInToolbar =>
      'Shfaq bibliotekat në shiritin e veglave';

  @override
  String get navbarAlwaysExpanded =>
      'Shfaq gjithmonë etiketat e shiritit të navigimit';

  @override
  String get showSeerrButton => 'Shfaq butonin Seerr';

  @override
  String get navbarOpacity => 'Opaciteti i Navbarit';

  @override
  String get navbarColor => 'Ngjyra e shiritit të navigimit';

  @override
  String get gray => 'Gri';

  @override
  String get darkBlue => 'Blu e errët';

  @override
  String get purple => 'Vjollcë';

  @override
  String get teal => 'Gurkali';

  @override
  String get navy => 'Marina';

  @override
  String get charcoal => 'qymyr druri';

  @override
  String get brown => 'Kafe';

  @override
  String get darkRed => 'E kuqe e errët';

  @override
  String get darkGreen => 'Jeshile e errët';

  @override
  String get slate => 'Rrasë';

  @override
  String get indigo => 'Lejla';

  @override
  String get libraryDisplay => 'Ekrani i bibliotekës';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Baner';

  @override
  String get overridePerLibrarySettings => 'Anuloni cilësimet për bibliotekë';

  @override
  String get applyImageTypeToAllLibraries =>
      'Aplikoni llojin e imazhit në të gjitha bibliotekat';

  @override
  String get multiServerLibraries => 'Bibliotekat me shumë serverë';

  @override
  String get showLibrariesFromAllServers =>
      'Shfaq bibliotekat nga të gjithë serverët e lidhur';

  @override
  String get enableFolderView => 'Aktivizo pamjen e dosjeve';

  @override
  String get showFolderBrowsingOption =>
      'Shfaq opsionin e shfletimit të dosjeve';

  @override
  String get groupItemsIntoCollections => 'Grupo artikujt në koleksione';

  @override
  String get hideCollectionAssociatedItems =>
      'Fshih artikujt e bibliotekës të lidhur me koleksionin gjatë shfletimit të bibliotekave';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Njoftim për grupimin e bibliotekës';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Për të përdorur këtë cilësim, sigurohuni që cilësimet e bibliotekës \"Grupo filmat në koleksione\" dhe/ose \"Grupo serialet në koleksione\" të jenë aktivizuar te cilësimet e Shfaqjes së bibliotekës tuaj në serverin tuaj Jellyfin ose Emby.';

  @override
  String get libraryVisibility => 'Dukshmëria e Bibliotekës';

  @override
  String get libraryVisibilityDescription =>
      'Ndrysho dukshmërinë e faqes kryesore për bibliotekë. Rinisni Moonfin që ndryshimet të hyjnë në fuqi.';

  @override
  String get showInNavigation => 'Shfaq në navigacion';

  @override
  String get showInLatestMedia => 'Shfaq në mediat e fundit';

  @override
  String get sourceLibraries => 'Bibliotekat burimore';

  @override
  String get sourceCollections => 'Koleksionet e Burimeve';

  @override
  String get excludedGenres => 'Zhanret e përjashtuara';

  @override
  String get selectAll => 'Zgjidhni Të gjitha';

  @override
  String itemsSelected(int count) {
    return '$count të zgjedhur';
  }

  @override
  String get mediaBar => 'Bar Media';

  @override
  String get mediaSources => 'Burimet e Medias';

  @override
  String get behavior => 'Sjellja';

  @override
  String get seconds => 'sekonda';

  @override
  String get localPreviews => 'Parashikimet lokale';

  @override
  String get localPreviewsDescription =>
      'Konfiguro pamjet paraprake të trailerit, medias dhe audios.';

  @override
  String get mediaBarMode => 'Stili i shiritit mediatik';

  @override
  String get mediaBarModeDescription =>
      'Zgjidhni midis stileve të ndryshme të shiritit të medias ose çaktivizoni shiritin e medias';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Fikur';

  @override
  String get enableMediaBar => 'Aktivizo shiritin e medias';

  @override
  String get showFeaturedContentSlideshow =>
      'Shfaq paraqitjen e përmbajtjes së veçuar në shtëpi';

  @override
  String get contentType => 'Lloji i përmbajtjes';

  @override
  String get moviesAndTvShows => 'Filma dhe shfaqje televizive';

  @override
  String get moviesOnly => 'Vetëm filma';

  @override
  String get tvShowsOnly => 'Vetëm shfaqje televizive';

  @override
  String get itemCount => 'Numri i artikujve';

  @override
  String get noneSelected => 'Asnjë i zgjedhur';

  @override
  String get noneExcluded => 'Asnjë i përjashtuar';

  @override
  String get autoAdvance => 'Përparimi automatik';

  @override
  String get autoAdvanceSlides => 'Kaloni automatikisht te rrëshqitja tjetër';

  @override
  String get autoAdvanceInterval => 'Intervali i avancimit automatik';

  @override
  String get trailerPreview => 'Pamja paraprake e trailerit';

  @override
  String get autoPlayTrailers =>
      'Luaj automatikisht rimorkio në shiritin e medias pas 3 sekondash';

  @override
  String get trailerAudio => 'Audioja e trailerit';

  @override
  String get enableTrailerAudio =>
      'Aktivizo audion për trailerët në shiritin e medias';

  @override
  String get episodePreview => 'Pamja paraprake e episodit';

  @override
  String get mediaPreview => 'Paraafishimi i medias';

  @override
  String get episodePreviewDescription =>
      'Luaj një pamje paraprake prej 30 sekondash në kartat e fokusuara, të pezulluara ose të shtypura gjatë';

  @override
  String get mediaPreviewDescription =>
      'Luaj një pamje paraprake prej 30 sekondash në kartat e fokusuara, të pezulluara ose të shtypura gjatë';

  @override
  String get previewAudio => 'Parashikimi i audios';

  @override
  String get enablePreviewAudio =>
      'Aktivizo audion për pamjet paraprake të trailerit dhe episodit';

  @override
  String get latestMedia => 'Mediat e fundit';

  @override
  String get recentlyReleased => 'Lëshuar së fundi';

  @override
  String get myMedia => 'Media ime';

  @override
  String get myMediaSmall => 'Media ime (e vogël)';

  @override
  String get continueWatching => 'Vazhdo Shikimi';

  @override
  String get resumeAudio => 'Rifillo Audio';

  @override
  String get resumeBooks => 'Librat e rinisë';

  @override
  String get activeRecordings => 'Regjistrimet aktive';

  @override
  String get playlists => 'Listat e luajtjes';

  @override
  String get liveTV => 'TV drejtpërdrejt';

  @override
  String get homeSections => 'Seksionet kryesore';

  @override
  String get resetToDefaults => 'Rivendos në standardet';

  @override
  String get homeRowPosterSize => 'Madhësia e posterit të rreshtit të shtëpisë';

  @override
  String get perRowImageTypeSelection =>
      'Përzgjedhja e llojit të imazhit për rresht';

  @override
  String get configureImageTypeForEachRow =>
      'Konfiguro llojin e imazhit për çdo rresht bazë të aktivizuar';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Bashkoni Vazhdo shikimin dhe Më pas';

  @override
  String get combineBothRows =>
      'Kombinoni të dy rreshtat në një seksion të vetëm shtëpiak';

  @override
  String get fullScreenRows => 'Rreshtat e zgjeruar të kreut';

  @override
  String get fullScreenRowsDescription =>
      'Kufizo rreshtat e kreut në 1 rresht për ekran';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Lloji i imazhit për rresht';

  @override
  String get perRowSettings => 'Cilësimet për rresht';

  @override
  String get autoLogin => 'Hyrja automatike';

  @override
  String get lastUser => 'Përdoruesi i fundit';

  @override
  String get currentUser => 'Përdoruesi aktual';

  @override
  String get alwaysAuthenticate => 'Autentifiko gjithmonë';

  @override
  String get requirePasswordWithToken =>
      'Kërkoni fjalëkalim edhe me token të ruajtur';

  @override
  String get confirmExit => 'Konfirmo Daljen';

  @override
  String get showConfirmationBeforeExiting =>
      'Shfaq konfirmimin përpara se të dalësh';

  @override
  String get blockContentWithRatings =>
      'Blloko përmbajtjen me vlerësimet e mëposhtme:';

  @override
  String get noContentRatingsFound =>
      'Ende nuk u gjet asnjë vlerësim i përmbajtjes në këtë server.';

  @override
  String get couldNotLoadServerRatings =>
      'Vlerësimet e serverit nuk mund të ngarkoheshin. Po shfaqen vetëm vlerësimet e ruajtura.';

  @override
  String get couldNotRefreshRatings =>
      'Vlerësimet nuk mund të rifreskoheshin nga serveri. Po shfaqen vlerësimet e ruajtura.';

  @override
  String get enablePinCode => 'Aktivizo kodin PIN';

  @override
  String get requirePinToAccess =>
      'Kërkoni një PIN për të hyrë në llogarinë tuaj';

  @override
  String get changePin => 'Ndrysho PIN-in';

  @override
  String get setNewPinCode => 'Vendosni një kod të ri PIN';

  @override
  String get removePin => 'Hiq kodin PIN';

  @override
  String get removePinProtection => 'Hiq mbrojtjen e kodit PIN';

  @override
  String get screensaver => 'Mbrojtësi i ekranit';

  @override
  String get inAppScreensaver => 'Mbrojtësi i ekranit brenda aplikacionit';

  @override
  String get enableBuiltInScreensaver =>
      'Aktivizo mbrojtësin e integruar të ekranit';

  @override
  String get mode => 'Modaliteti';

  @override
  String get libraryArt => 'Arti i Bibliotekës';

  @override
  String get logo => 'Logoja';

  @override
  String get clock => 'Ora';

  @override
  String get timeout => 'Kohëzgjatja';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Niveli i zbehjes';

  @override
  String get maxAgeRating => 'Vlerësimi maksimal i moshës';

  @override
  String get any => 'Çdo';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Kërkoni vlerësim të moshës';

  @override
  String get onlyShowRatedContent => 'Shfaq vetëm përmbajtje të vlerësuara';

  @override
  String get showClock => 'Shfaq orën';

  @override
  String get displayClockDuringScreensaver =>
      'Shfaq orën gjatë ruajtjes së ekranit';

  @override
  String get clockModeStatic => 'Statik';

  @override
  String get clockModeBouncing => 'Kërcyes';

  @override
  String get rottenTomatoesCritics => 'Domate të kalbura (Kritikë)';

  @override
  String get rottenTomatoesAudience => 'Domate të kalbura (Audiencë)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritike';

  @override
  String get metacriticUser => 'Metacritic (Përdorues)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Kuti letrash';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Vlerësimi i Komunitetit';

  @override
  String get ratings => 'Vlerësimet';

  @override
  String get additionalRatings => 'Vlerësime Shtesë';

  @override
  String get showMdbListAndTmdbRatings => 'Shfaq vlerësimet MDBList dhe TMDB';

  @override
  String get ratingLabels => 'Etiketat e vlerësimit';

  @override
  String get showLabelsNextToIcons =>
      'Shfaq etiketat pranë ikonave të vlerësimit';

  @override
  String get ratingBadges => 'Distinktivët e vlerësimit';

  @override
  String get showDecorativeBadges =>
      'Shfaq distinktivët dekorativë pas vlerësimeve';

  @override
  String get episodeRatings => 'Vlerësimet e Episodit';

  @override
  String get showRatingsOnEpisodes =>
      'Shfaq vlerësimet për episodet individuale';

  @override
  String get ratingSources => 'Burimet e vlerësimit';

  @override
  String get ratingSourcesDescription =>
      'Aktivizo dhe rirendit burimet e vlerësimit të shfaqura në të gjithë aplikacionin';

  @override
  String get pluginLabel => 'Shtojca Moonbase';

  @override
  String get pluginDetected => 'U zbulua shtojca';

  @override
  String get pluginNotDetected => 'Shtojca nuk u zbulua';

  @override
  String get pluginDetectedDescription =>
      'U zbulua shtojca e serverit. Sinkronizimi aktivizohet automatikisht herën e parë që gjendet shtojca.';

  @override
  String get pluginNotDetectedDescription =>
      'Shtojca e serverit nuk është zbuluar aktualisht. Cilësimet lokale përdorin ende vlerat e tyre të ruajtura ose parazgjedhjet e integruara.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersioni: $version';
  }

  @override
  String get availableServices => 'Shërbimet e disponueshme';

  @override
  String get serverPluginSync => 'Sinkronizimi i shtojcave të serverit';

  @override
  String get syncSettingsWithPlugin =>
      'Sinkronizoni cilësimet me shtojcën e serverit';

  @override
  String get whatSyncControls => 'Çfarë kontrollon sinkronizimi';

  @override
  String get syncControlsDescription =>
      'Sync kontrollon vetëm nëse cilësimet e mbështetura nga plugin shtyhen dhe tërhiqen nga serveri. Zgjedhja e profilit dhe veprimet e sinkronizimit të profilit janë te cilësimet e personalizimit kur aktivizohet sinkronizimi i shtojcave.';

  @override
  String get recentRequests => 'Kërkesat e fundit';

  @override
  String get recentlyAdded => 'Shtuar së fundi';

  @override
  String get trending => 'Në trend';

  @override
  String get popularMovies => 'Filma të njohur';

  @override
  String get movieGenres => 'Zhanret e filmit';

  @override
  String get upcomingMovies => 'Filmat e ardhshëm';

  @override
  String get studios => 'Studiot';

  @override
  String get popularSeries => 'Seri e njohur';

  @override
  String get seriesGenres => 'Zhanret e serialeve';

  @override
  String get upcomingSeries => 'Seria e ardhshme';

  @override
  String get networks => 'Rrjetet';

  @override
  String get seerrDiscoveryRows => 'Rreshtat e zbulimit Seerr';

  @override
  String get resetRowsToDefaults => 'Rivendosni rreshtat në parazgjedhje';

  @override
  String get enableSeerr => 'Aktivizo Seerr';

  @override
  String get showSeerrInNavigation =>
      'Shfaq Seerr në navigim (kërkon shtojcën e serverit)';

  @override
  String get seerrUnavailable =>
      'Nuk ofrohet sepse mbështetja për Seerr në shtojcën e serverit është e çaktivizuar.';

  @override
  String get nsfwFilter => 'Filtri NSFW';

  @override
  String get hideAdultContent => 'Fshih përmbajtjen për të rritur në rezultate';

  @override
  String get seerrNotificationsSection => 'Njoftimet';

  @override
  String get seerrNotifyNewRequestsTitle => 'Njoftime për kërkesa të reja';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Njoftomë kur dikush dërgon një kërkesë';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Përditësime të kërkesave';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Të miratuara, të refuzuara dhe të shtuara në bibliotekën tuaj';

  @override
  String get seerrNotifyIssuesTitle => 'Përditësime të problemeve';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Probleme të reja, përgjigje dhe zgjidhje';

  @override
  String loggedInAs(String username) {
    return 'I identifikuar si: $username';
  }

  @override
  String get discoverRows => 'Faqja e zbulimit Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Aktivizo rreshtat që dëshiron të shohësh në faqen kryesore të Seerr. Tërhiq për t\'i rirenditur. Renditja e personalizuar sinkronizohet me Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Aktivizo rreshtat që dëshiron të shohësh në faqen kryesore të Seerr. Tërhiq për t\'i rirenditur. Renditja e personalizuar sinkronizohet me Moonbase.';

  @override
  String get enabled => 'Aktivizuar';

  @override
  String get hidden => 'I fshehur';

  @override
  String get aboutTitle => 'Rreth';

  @override
  String versionValue(String version) {
    return 'Versioni $version';
  }

  @override
  String get openSourceLicenses => 'Licencat me burim të hapur';

  @override
  String get sourceCode => 'Kodi burimor';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Kontrolloni për përditësime tani';

  @override
  String get checksLatestDesktopRelease =>
      'Kontrollon versionin më të fundit të desktopit për këtë platformë';

  @override
  String get youAreUpToDate => 'Ju jeni të përditësuar.';

  @override
  String get couldNotCheckForUpdates =>
      'Nuk mund të kontrollohej për përditësime për momentin.';

  @override
  String get noCompatibleUpdate =>
      'Nuk u gjet asnjë paketë përditësuese e përputhshme për këtë platformë.';

  @override
  String get updateChecksNotSupported =>
      'Kontrollet e përditësimit nuk mbështeten në këtë platformë.';

  @override
  String get updateNotificationsDisabled =>
      'Njoftimet e përditësimit janë çaktivizuar.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Ju lutemi prisni përpara se të kontrolloni përsëri.';

  @override
  String get latestUpdateAlreadyShown => 'Përditësimi i fundit u shfaq tashmë.';

  @override
  String get updateAvailable => 'Ofrohet përditësim.';

  @override
  String updateAvailableVersion(String version) {
    return 'Përditësim i disponueshëm: v$version';
  }

  @override
  String get updateNotifications => 'Përditëso Njoftimet';

  @override
  String get showWhenUpdatesAvailable =>
      'Trego kur përditësimet janë të disponueshme';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version është i disponueshëm';
  }

  @override
  String get readReleaseNotes => 'Lexoni shënimet e publikimit';

  @override
  String get downloadingUpdate => 'Po shkarkon përditësimin...';

  @override
  String get updateDownloadFailed =>
      'Shkarkimi i përditësimit dështoi. Ju lutemi provoni përsëri.';

  @override
  String get openReleasesPage => 'Hapni faqen e publikimeve';

  @override
  String get navigation => 'Navigimi';

  @override
  String get watchedIndicatorsBackdrops => 'Treguesit e shikuar, sfondet';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Ngjyra e fokusit, treguesit e shikuar, sfondet';

  @override
  String get navbarStyleToolbarAppearance =>
      'Stili i shiritit navigues, butonat e shiritit të veglave, pamja';

  @override
  String get reorderToggleHomeRows =>
      'Renditni përsëri dhe ndryshoni rreshtat kryesore';

  @override
  String get featuredContentAppearance => 'Përmbajtja e veçuar, pamja';

  @override
  String get posterSizeImageTypeFolderView =>
      'Madhësia e posterit, lloji i imazhit, pamja e dosjes';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB dhe burimet e vlerësimeve';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Kufiri i memories së fshehtë të imazheve';

  @override
  String get clearImageCache => 'Pastro memorien e fshehtë të imazheve';

  @override
  String get imageCacheCleared => 'Memoria e fshehtë e imazheve u pastrua';

  @override
  String get clear => 'Pastro';

  @override
  String get browse => 'Shfletoni';

  @override
  String get noResults => 'Nuk ka rezultate';

  @override
  String get seerrAvailableStatus => 'Në dispozicion';

  @override
  String get seerrRequestedStatus => 'Kërkuar';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Po shkarkohet · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Po importohet';

  @override
  String itemsCount(int count) {
    return '$count Artikuj';
  }

  @override
  String get seerrSettings => 'Cilësimet e Seerr';

  @override
  String get requestMore => 'Kërkoni më shumë';

  @override
  String get request => 'Kërkesa';

  @override
  String get cancelRequest => 'Anulo Kërkesën';

  @override
  String get playInMoonfin => 'Luaj në Moonfin';

  @override
  String requestedByName(String name) {
    return 'Kërkuar nga $name';
  }

  @override
  String get approve => 'Mirato';

  @override
  String get declineAction => 'Rënia';

  @override
  String get similar => 'Të ngjashme';

  @override
  String get recommendations => 'Rekomandime';

  @override
  String cancelRequestForTitle(String title) {
    return 'Të anulohet kërkesa për \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Të anulohen $count kërkesa për \"$title\"?';
  }

  @override
  String get keep => 'Mbaj';

  @override
  String get itemNotFoundInLibrary =>
      'Artikulli nuk u gjet në bibliotekën tuaj Moonfin';

  @override
  String get errorSearchingLibrary => 'Gabim gjatë kërkimit të bibliotekës';

  @override
  String budgetAmount(String amount) {
    return 'Buxheti: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Të ardhurat: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Kërko $type';
  }

  @override
  String get submitRequest => 'Paraqisni Kërkesën';

  @override
  String get allSeasons => 'Të gjitha stinët';

  @override
  String get advancedOptions => 'Opsione të avancuara';

  @override
  String get noServiceServersConfigured =>
      'Asnjë server shërbimi nuk është konfiguruar';

  @override
  String get server => 'Serveri';

  @override
  String get qualityProfile => 'Profili i cilësisë';

  @override
  String get rootFolder => 'Dosja rrënjësore';

  @override
  String get showMore => 'Shfaq më shumë';

  @override
  String get appearances => 'Paraqitjet';

  @override
  String get crewSection => 'Ekuipazhi';

  @override
  String ageValue(int age) {
    return 'mosha $age';
  }

  @override
  String get noRequests => 'Asnjë kërkesë';

  @override
  String get pendingStatus => 'Në pritje';

  @override
  String get declinedStatus => 'Refuzuar';

  @override
  String get partiallyAvailable => 'Pjesërisht e disponueshme';

  @override
  String get downloadingStatus => 'Po shkarkohet';

  @override
  String get approvedStatus => 'Miratuar';

  @override
  String get notRequestedStatus => 'Nuk kërkohet';

  @override
  String get blocklistedStatus => 'Në listën e bllokuar';

  @override
  String get deletedStatus => 'Fshirë';

  @override
  String get failedStatus => 'Dështoi';

  @override
  String get processingStatus => 'Në përpunim';

  @override
  String modifiedByName(String name) {
    return 'Modifikuar nga $name';
  }

  @override
  String get completedStatus => 'Përfunduar';

  @override
  String get requestErrorDuplicate => 'Ky titull është kërkuar tashmë';

  @override
  String get requestErrorQuota => 'U arrit kufiri i kërkesave';

  @override
  String get requestErrorBlocklisted => 'Ky titull është në listën e bllokuar';

  @override
  String get requestErrorNoSeasons =>
      'Nuk ka mbetur asnjë sezon për të kërkuar';

  @override
  String get requestErrorPermission => 'Nuk keni leje për ta bërë këtë kërkesë';

  @override
  String get seerrRequestsTitle => 'Kërkesat';

  @override
  String get seerrIssuesTitle => 'Problemet';

  @override
  String get sortNewest => 'Më të rejat';

  @override
  String get sortLastModified => 'Modifikuar së fundmi';

  @override
  String get noIssues => 'Asnjë problem';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Kanë mbetur $remaining nga $limit kërkesa filmash';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Kanë mbetur $remaining nga $limit kërkesa sezonesh';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Pjesë e $name';
  }

  @override
  String get viewCollection => 'Shiko koleksionin';

  @override
  String get requestCollection => 'Kërko koleksionin';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filma · $available të disponueshëm';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Kërko $count filma';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Po kërkohet $current nga $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'U kërkuan $count filma';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'U kërkuan $ok nga $total filma';
  }

  @override
  String get collectionAllRequested =>
      'Të gjithë filmat janë tashmë të disponueshëm ose të kërkuar';

  @override
  String get reportIssue => 'Raporto problem';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Cili është problemi?';

  @override
  String get allEpisodes => 'Të gjitha episodet';

  @override
  String get episode => 'Episodi';

  @override
  String get openStatus => 'E hapur';

  @override
  String get resolvedStatus => 'I zgjidhur';

  @override
  String get resolveAction => 'Zgjidh';

  @override
  String get reopenAction => 'Rihap';

  @override
  String reportedByName(String name) {
    return 'Raportuar nga $name';
  }

  @override
  String commentsCount(int count) {
    return '$count komente';
  }

  @override
  String get addComment => 'Shto një koment';

  @override
  String get deleteIssueConfirm => 'Të fshihet ky problem?';

  @override
  String get submitReport => 'Dërgo raportin';

  @override
  String get tmdbScore => 'Rezultati i TMDB';

  @override
  String get releaseDateLabel => 'Data e publikimit';

  @override
  String get firstAirDateLabel => 'Data e parë e transmetimit';

  @override
  String get revenueLabel => 'Të ardhurat';

  @override
  String get runtimeLabel => 'Koha e ekzekutimit';

  @override
  String get budgetLabel => 'Buxheti';

  @override
  String get originalLanguageLabel => 'Gjuha origjinale';

  @override
  String get seasonsLabel => 'Sezonet';

  @override
  String get episodesLabel => 'Episodet';

  @override
  String get access => 'Qasja';

  @override
  String get add => 'Shto';

  @override
  String get address => 'Adresa';

  @override
  String get analytics => 'Analiza';

  @override
  String get catalog => 'Katalogu';

  @override
  String get content => 'përmbajtja';

  @override
  String get copy => 'Kopjo';

  @override
  String get create => 'Krijo';

  @override
  String get disable => 'Çaktivizo';

  @override
  String get done => 'U krye';

  @override
  String get edit => 'Redakto';

  @override
  String get encoding => 'Kodimi';

  @override
  String get error => 'Gabim';

  @override
  String get forward => 'Përpara';

  @override
  String get general => 'Të përgjithshme';

  @override
  String get go => 'Shkoni';

  @override
  String get install => 'Instaloni';

  @override
  String get installed => 'Instaluar';

  @override
  String get interval => 'Intervali';

  @override
  String get name => 'Emri';

  @override
  String get networking => 'Rrjetëzimi';

  @override
  String get next => 'Tjetra';

  @override
  String get path => 'Rruga';

  @override
  String get paused => 'Në pauzë';

  @override
  String get permissions => 'Lejet';

  @override
  String get processing => 'Përpunimi';

  @override
  String get profile => 'Profili';

  @override
  String get provider => 'Ofruesi';

  @override
  String get refresh => 'Rifresko';

  @override
  String get remote => 'Telekomanda';

  @override
  String get rename => 'Riemërto';

  @override
  String get revoke => 'Revoko';

  @override
  String get role => 'Roli';

  @override
  String get root => 'Rrënja';

  @override
  String get run => 'Vraponi';

  @override
  String get search => 'Kërko';

  @override
  String get select => 'Zgjidhni';

  @override
  String get send => 'Dërgo';

  @override
  String get sessions => 'Sesionet';

  @override
  String get set => 'Set';

  @override
  String get status => 'Statusi';

  @override
  String get stop => 'Ndalo';

  @override
  String get streaming => 'Transmetim';

  @override
  String get time => 'Koha';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Çinstaloni';

  @override
  String get up => 'Lart';

  @override
  String get update => 'Përditëso';

  @override
  String get upload => 'Ngarko';

  @override
  String get unmute => 'Hiq zërin';

  @override
  String get mute => 'Pa zë';

  @override
  String get branding => 'Markimi';

  @override
  String get adminDrawerDashboard => 'Paneli';

  @override
  String get adminDrawerAnalytics => 'Analiza';

  @override
  String get adminDrawerSettings => 'Cilësimet';

  @override
  String get adminDrawerBranding => 'Markimi';

  @override
  String get adminDrawerUsers => 'Përdoruesit';

  @override
  String get adminDrawerLibraries => 'Bibliotekat';

  @override
  String get adminDrawerDisplay => 'Shfaqja';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'Cilësimet NFO';

  @override
  String get adminDrawerTranscoding => 'Transkodimi';

  @override
  String get adminDrawerResume => 'Vazhdo';

  @override
  String get adminDrawerStreaming => 'Transmetim';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Pajisjet';

  @override
  String get adminDrawerActivity => 'Aktiviteti';

  @override
  String get adminDrawerNetworking => 'Rrjetëzimi';

  @override
  String get adminDrawerApiKeys => 'Çelësat API';

  @override
  String get adminDrawerBackups => 'Rezervimet';

  @override
  String get adminDrawerLogs => 'Regjistrat';

  @override
  String get adminDrawerScheduledTasks => 'Detyrat e planifikuara';

  @override
  String get adminDrawerPlugins => 'Shtojcat';

  @override
  String get adminDrawerRepositories => 'Depot';

  @override
  String get adminDrawerLiveTv => 'TV drejtpërdrejt';

  @override
  String get adminExitTooltip => 'Dil nga administratori';

  @override
  String get adminDashboardLoadFailed =>
      'Ngarkimi i panelit të kontrollit dështoi';

  @override
  String get adminMediaOverview => 'Përmbledhje e mediave';

  @override
  String get adminMediaTotalsError =>
      'Totalet e mediave të serverit nuk mund të ngarkoheshin.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Një lexim i shpejtë se sa përmbajtje ka në këtë server.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Përditësime shtojcash të disponueshme: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Shtojca që kërkojnë rinisje: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Detyra të planifikuara që dështuan: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Hyrje të fundit paralajmërimi/gabimi: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Shpërndarja mediatike';

  @override
  String get analyticsVideoCodecs => 'Kodekët e videove';

  @override
  String get analyticsAudioCodecs => 'Kodekët audio';

  @override
  String get analyticsContainers => 'Kontejnerët';

  @override
  String get analyticsTopGenres => 'Zhanret kryesore';

  @override
  String get analyticsReleaseYears => 'Vitet e lëshimit';

  @override
  String get analyticsContentRatings => 'Vlerësimet e përmbajtjes';

  @override
  String get analyticsRuntimeBuckets => 'Kova për kohëzgjatje';

  @override
  String get analyticsFileFormats => 'Formatet e skedarëve';

  @override
  String get analyticsNoData => 'Nuk ka të dhëna të disponueshme.';

  @override
  String get adminServerInfo => 'Informacioni i Serverit';

  @override
  String get adminRestartPending => 'Rinis në pritje';

  @override
  String get adminServerPaths => 'Shtigjet e serverit';

  @override
  String get adminServerActions => 'Veprimet e serverit';

  @override
  String get adminRestartServer => 'Rinisni serverin';

  @override
  String get adminShutdownServer => 'Mbyllja e serverit';

  @override
  String get adminScanLibraries => 'Skanoni bibliotekat';

  @override
  String get adminLibraryScanStarted => 'Skanimi i bibliotekës filloi';

  @override
  String errorGeneric(String error) {
    return 'Gabim: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Rinisja e serverit në vazhdim e sipër';

  @override
  String get adminServerRebootMessage =>
      'Rinisja e serverit është në progres, ju lutemi rinisni Moonfin';

  @override
  String get adminActiveSessions => 'Seancat aktive';

  @override
  String get adminSessionsLoadFailed => 'Ngarkimi i seancave dështoi';

  @override
  String get adminNoActiveSessions => 'Nuk ka seanca aktive';

  @override
  String get adminRecentActivity => 'Aktiviteti i fundit';

  @override
  String get adminNoRecentActivity => 'Asnjë aktivitet i fundit';

  @override
  String adminCommandFailed(String error) {
    return 'Komanda dështoi: $error';
  }

  @override
  String get adminSendMessage => 'Dërgo Mesazh';

  @override
  String get adminMessageTextHint => 'Teksti i mesazhit';

  @override
  String get adminSetVolume => 'Vendos volumin';

  @override
  String get sessionPrev => 'Mëparshme';

  @override
  String get sessionRewind => 'Ktheje prapa';

  @override
  String get sessionForward => 'Përpara';

  @override
  String get sessionNext => 'Tjetra';

  @override
  String get sessionVolumeDown => 'Vëllimi -';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Tani po luhet';

  @override
  String get volume => 'Volumi';

  @override
  String get actions => 'Veprimet';

  @override
  String get videoCodec => 'Kodiku i videos';

  @override
  String get audioCodec => 'Kodiku i audios';

  @override
  String get hwAccel => 'Përshpejtim HW';

  @override
  String get completion => 'Përfundimi';

  @override
  String get direct => 'Direkt';

  @override
  String get adminDisconnect => 'Shkëputeni';

  @override
  String get adminClearDates => 'Datat e qarta';

  @override
  String get adminActivitySeverityAll => 'Të gjitha nivelet';

  @override
  String get adminActivityDateRange => 'Intervali i datave';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Ngarkimi i regjistrit të aktivitetit dështoi: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nuk ka hyrje në aktivitet';

  @override
  String get adminEditDeviceName => 'Redakto emrin e pajisjes';

  @override
  String get adminCustomName => 'Emri i personalizuar';

  @override
  String get adminDeviceNameUpdated => 'Emri i pajisjes u përditësua';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Përditësimi i pajisjes dështoi: $error';
  }

  @override
  String get adminDeleteDevice => 'Fshi pajisjen';

  @override
  String get adminDeviceDeleted => 'Pajisja u fshi';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Fshirja e pajisjes dështoi: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Të hiqet pajisja \'$name\'? Përdoruesi do të duhet të hyjë sërish në këtë pajisje.';
  }

  @override
  String get adminDeleteAllDevices => 'Fshi të gjitha pajisjet';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Të hiqen $count pajisje? Përdoruesit e prekur do të duhet të hyjnë sërish. Pajisja juaj aktuale nuk preket.';
  }

  @override
  String get adminDevicesDeletedAll => 'Pajisjet u hoqën';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'U hoqën disa pajisje; $count nuk u hoqën dot.';
  }

  @override
  String get adminDevicesLoadFailed => 'Ngarkimi i pajisjeve dështoi';

  @override
  String get adminSearchDevices => 'Kërko pajisje';

  @override
  String get adminThisDevice => 'Kjo pajisje';

  @override
  String get adminEditName => 'Redakto emrin';

  @override
  String get adminLibrariesLoadFailed => 'Ngarkimi i bibliotekave dështoi';

  @override
  String get adminNoLibraries => 'Asnjë bibliotekë nuk është konfiguruar';

  @override
  String get adminScanAllLibraries => 'Skanoni të gjitha bibliotekat';

  @override
  String get adminAddLibrary => 'Shto bibliotekë';

  @override
  String adminScanFailed(String error) {
    return 'Nisja e skanimit dështoi: $error';
  }

  @override
  String get adminRenameLibrary => 'Riemërtoni Bibliotekën';

  @override
  String get adminNewName => 'Emri i ri';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteka u riemërtua në \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Riemërtimi dështoi: $error';
  }

  @override
  String get adminDeleteLibrary => 'Fshi Bibliotekën';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteka \"$name\" u fshi';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Fshirja e bibliotekës dështoi: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Shtimi i shtegut dështoi: $error';
  }

  @override
  String get adminRemovePath => 'Hiq shtegun';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Të hiqet \"$path\" nga kjo bibliotekë?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Heqja e shtegut dështoi: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opsionet e bibliotekës u ruajtën';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Ruajtja e opsioneve dështoi: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Ngarkimi i bibliotekës dështoi';

  @override
  String get adminNoMediaPaths => 'Nuk janë konfiguruar shtigje mediatike';

  @override
  String get adminAddPath => 'Shto shtegun';

  @override
  String get adminBrowseFilesystem =>
      'Shfletoni sistemin e skedarëve të serverit:';

  @override
  String get adminSaveOptions => 'Ruaj opsionet';

  @override
  String get adminPreferredMetadataLanguage =>
      'Gjuha e preferuar e meta të dhënave';

  @override
  String get adminMetadataLanguageHint => 'p.sh. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Kodi i shtetit të meta të dhënave';

  @override
  String get adminMetadataCountryHint => 'p.sh. SHBA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Shtigjet';

  @override
  String get adminLibraryTabOptions => 'Opsionet';

  @override
  String get adminLibraryTabDownloaders => 'Shkarkuesit';

  @override
  String get adminLibMetadataSavers => 'Ruajtësit e metadatave';

  @override
  String get adminLibSubtitleDownloaders => 'Shkarkuesit e titrave';

  @override
  String get adminLibLyricDownloaders => 'Shkarkuesit e teksteve';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Shkarkuesit e metadatave: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Marrësit e imazheve: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Ky server nuk ofron asnjë shkarkues për këtë lloj biblioteke.';

  @override
  String get adminLibrarySectionGeneral => 'Të përgjithshme';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Informacion i integruar';

  @override
  String get adminLibrarySectionSubtitles => 'Titrat';

  @override
  String get adminLibrarySectionImages => 'Imazhet';

  @override
  String get adminLibrarySectionSeries => 'Serialet';

  @override
  String get adminLibrarySectionMusic => 'Muzika';

  @override
  String get adminLibrarySectionMovies => 'Filmat';

  @override
  String get adminLibRealtimeMonitor => 'Aktivizo monitorimin në kohë reale';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Zbulo ndryshimet e skedarëve dhe përpunoji automatikisht.';

  @override
  String get adminLibArchiveMediaFiles => 'Trajto arkivat si skedarë media';

  @override
  String get adminLibEnablePhotos => 'Shfaq fotot';

  @override
  String get adminLibSaveLocalMetadata => 'Ruaj grafikat në dosjet e medias';

  @override
  String get adminLibRefreshInterval => 'Rifreskim automatik i metadatave';

  @override
  String get adminLibRefreshNever => 'Asnjëherë';

  @override
  String get adminLibDefault => 'E parazgjedhur';

  @override
  String get adminLibDisplayTitle => 'Shfaqja';

  @override
  String get adminLibDisplaySection => 'Shfaqja e bibliotekës';

  @override
  String get adminLibFolderView =>
      'Shfaq një pamje dosjesh për të treguar dosjet e thjeshta të medias';

  @override
  String get adminLibSpecialsInSeasons =>
      'Shfaq specialet brenda sezoneve në të cilat u transmetuan';

  @override
  String get adminLibGroupMovies => 'Grupo filmat në koleksione';

  @override
  String get adminLibGroupShows => 'Grupo serialet në koleksione';

  @override
  String get adminLibExternalSuggestions =>
      'Shfaq përmbajtje të jashtme në sugjerime';

  @override
  String get adminLibDateAddedSection => 'Sjellja e datës së shtimit';

  @override
  String get adminLibDateAddedLabel => 'Përdor datën e shtimit nga';

  @override
  String get adminLibDateAddedImport => 'Data e skanimit në bibliotekë';

  @override
  String get adminLibDateAddedFile => 'Data e krijimit të skedarit';

  @override
  String get adminLibMetadataTitle => 'Metadata dhe imazhe';

  @override
  String get adminLibMetadataLangSection => 'Gjuha e parapëlqyer e metadatave';

  @override
  String get adminLibChaptersSection => 'Kapitujt';

  @override
  String get adminLibDummyChapterDuration =>
      'Kohëzgjatja e kapitujve fiktivë (sekonda)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Gjatësia e kapitujve që gjenerohen për media që nuk ka. Vendos 0 për ta çaktivizuar.';

  @override
  String get adminLibChapterImageResolution =>
      'Rezolucioni i imazhit të kapitullit';

  @override
  String get adminLibNfoTitle => 'Cilësimet NFO';

  @override
  String get adminLibNfoHelp =>
      'Metadata NFO është e pajtueshme me Kodi dhe klientë të ngjashëm. Cilësimet zbatohen për të gjitha bibliotekat që ruajnë metadata NFO.';

  @override
  String get adminLibKodiUser =>
      'Përdoruesi për të cilin ruhen të dhënat e shikimit në skedarët NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Ruaj shtigjet e imazheve brenda skedarëve NFO';

  @override
  String get adminLibPathSubstitution =>
      'Aktivizo zëvendësimin e shtegut për shtigjet e imazheve NFO';

  @override
  String get adminLibExtraThumbs =>
      'Kopjo imazhet extrafanart në një dosje extrathumbs';

  @override
  String get adminLibNone => 'Asnjë';

  @override
  String adminLibRefreshDays(int days) {
    return '$days ditë';
  }

  @override
  String get adminLibEmbeddedTitles => 'Përdor titujt e integruar';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Përdor titujt e integruar për ekstrat';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Përdor informacionin e integruar të episodeve';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Lejo titrat e integruara';

  @override
  String get adminLibEmbeddedAllowAll => 'Lejo të gjitha';

  @override
  String get adminLibEmbeddedAllowText => 'Vetëm tekst';

  @override
  String get adminLibEmbeddedAllowImage => 'Vetëm imazh';

  @override
  String get adminLibEmbeddedAllowNone => 'Asnjë';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Anashkalo shkarkimin nëse ka titra të integruara';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Anashkalo shkarkimin nëse pista audio përputhet me gjuhën e shkarkimit';

  @override
  String get adminLibRequirePerfectMatch =>
      'Kërko një përputhje të përsosur të titrave';

  @override
  String get adminLibSaveSubtitlesWithMedia => 'Ruaj titrat në dosjet e medias';

  @override
  String get adminLibChapterImageExtraction => 'Nxirr imazhet e kapitujve';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Nxirr imazhet e kapitujve gjatë skanimit të bibliotekës';

  @override
  String get adminLibTrickplayExtraction =>
      'Aktivizo nxjerrjen e imazheve Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Nxirr imazhet Trickplay gjatë skanimit të bibliotekës';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Ruaj imazhet Trickplay në dosjet e medias';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Bashko automatikisht serialet që janë shpërndarë nëpër disa dosje';

  @override
  String get adminLibSeasonZeroName => 'Emri i shfaqjes së sezonit zero';

  @override
  String get adminLibLufsScan =>
      'Aktivizo skanimin LUFS për normalizimin e audios';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Parapëlqe etiketën jostandarde të artistëve';

  @override
  String get adminLibAutoAddToCollection =>
      'Shto automatikisht filmat në koleksione';

  @override
  String get adminLibraryNameRequired => 'Kërkohet emri i bibliotekës';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Krijimi i bibliotekës dështoi: $error';
  }

  @override
  String get adminLibraryName => 'Emri i bibliotekës';

  @override
  String get adminSelectedPaths => 'Shtigjet e zgjedhura:';

  @override
  String get adminNoPathsAdded =>
      'Nuk u shtuan shtigje (mund të shtohen më vonë)';

  @override
  String get adminCreateLibrary => 'Krijo Bibliotekë';

  @override
  String get paths => 'Shtigjet:';

  @override
  String get adminDisableUser => 'Çaktivizo Përdoruesin';

  @override
  String get adminEnableUser => 'Aktivizo Përdoruesin';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Të çaktivizohet $name? Nuk do të mund të hyjë.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Të aktivizohet $name? Do të mund të hyjë sërish.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Përdoruesi \"$name\" u çaktivizua';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Përdoruesi \"$name\" u aktivizua';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Përditësimi i politikës së përdoruesit dështoi: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Ngarkimi i përdoruesve dështoi';

  @override
  String get adminSearchUsers => 'Kërkoni përdoruesit';

  @override
  String get adminEditUser => 'Redakto përdoruesin';

  @override
  String get adminAddUser => 'Shto përdorues';

  @override
  String adminUserCreateFailed(String error) {
    return 'Krijimi i përdoruesit dështoi: $error';
  }

  @override
  String get adminCreateUser => 'Krijo përdorues';

  @override
  String get adminPasswordOptional => 'Fjalëkalimi (opsionale)';

  @override
  String get adminUsernameRequired =>
      'Emri i përdoruesit nuk mund të jetë bosh';

  @override
  String get adminNoProfileChanges =>
      'Nuk ka ndryshime të profilit për të ruajtur';

  @override
  String get adminProfileSaved => 'Profili u ruajt';

  @override
  String adminSaveFailed(String error) {
    return 'Ruajtja dështoi: $error';
  }

  @override
  String get adminPermissionsSaved => 'Lejet u ruajtën';

  @override
  String get adminPasswordsMismatch => 'Fjalëkalimet nuk përputhen';

  @override
  String adminFailed(String error) {
    return 'Dështoi: $error';
  }

  @override
  String get adminUserLoadFailed => 'Ngarkimi i përdoruesit dështoi';

  @override
  String get adminBackToUsers => 'Kthehu te Përdoruesit';

  @override
  String get adminSaveProfile => 'Ruaj profilin';

  @override
  String get adminDeleteUser => 'Fshi përdoruesin';

  @override
  String get admin => 'Administrator';

  @override
  String get adminFullAccessWarning =>
      'Administratorët kanë akses të plotë në server. Jepni me kujdes.';

  @override
  String get administrator => 'Administratori';

  @override
  String get adminHiddenUser => 'Përdorues i fshehur';

  @override
  String get adminAllowMediaPlayback => 'Lejo riprodhimin e medias';

  @override
  String get adminAllowAudioTranscoding => 'Lejo transkodimin e audios';

  @override
  String get adminAllowVideoTranscoding => 'Lejo transkodimin e videos';

  @override
  String get adminAllowRemuxing => 'Lejo ripërtëritjen';

  @override
  String get adminForceRemoteTranscoding =>
      'Forco transkodimin e burimit në distancë';

  @override
  String get adminAllowContentDeletion => 'Lejo fshirjen e përmbajtjes';

  @override
  String get adminAllowContentDownloading => 'Lejo shkarkimin e përmbajtjes';

  @override
  String get adminAllowPublicSharing => 'Lejo ndarjen publike';

  @override
  String get adminAllowRemoteControl =>
      'Lejo kontrollin në distancë të përdoruesve të tjerë';

  @override
  String get adminAllowSharedDeviceControl =>
      'Lejo kontrollin e pajisjes së përbashkët';

  @override
  String get adminAllowRemoteAccess => 'Lejo qasje në distancë';

  @override
  String get adminRemoteBitrateLimit =>
      'Kufiri i shpejtësisë së biteve të klientit në distancë (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Lëreni bosh pa kufi';

  @override
  String get adminMaxActiveSessions => 'Maksimumi i seancave aktive';

  @override
  String get adminAllowLiveTvAccess => 'Lejo qasjen në TV drejtpërdrejt';

  @override
  String get adminAllowLiveTvManagement => 'Lejo menaxhimin e TV drejtpërdrejt';

  @override
  String get adminAllowCollectionManagement => 'Lejo menaxhimin e grumbullimit';

  @override
  String get adminAllowSubtitleManagement => 'Lejo menaxhimin e titrave';

  @override
  String get adminAllowLyricManagement => 'Lejo menaxhimin e lirikës';

  @override
  String get adminSavePermissions => 'Ruaj lejet';

  @override
  String get adminEnableAllLibraryAccess =>
      'Aktivizo qasjen në të gjitha bibliotekat';

  @override
  String get adminSaveAccess => 'Ruaj qasjen';

  @override
  String get adminChangePassword => 'Ndrysho fjalëkalimin';

  @override
  String get adminNewPassword => 'Fjalëkalim i ri';

  @override
  String get adminConfirmPassword => 'Konfirmo fjalëkalimin';

  @override
  String get adminSetPassword => 'Vendosni fjalëkalimin';

  @override
  String get adminResetPassword => 'Rivendos fjalëkalimin';

  @override
  String get adminPasswordReset => 'Rivendosja e fjalëkalimit';

  @override
  String get adminPasswordUpdated => 'Fjalëkalimi u përditësua';

  @override
  String get adminUserSettings => 'Cilësimet e përdoruesit';

  @override
  String get adminLibraryAccess => 'Qasja në bibliotekë';

  @override
  String get adminDeviceAndChannelAccess => 'Qasja në pajisje dhe kanal';

  @override
  String get adminEnableAllDevices => 'Aktivizo qasjen në të gjitha pajisjet';

  @override
  String get adminEnableAllChannels => 'Aktivizo qasjen në të gjitha kanalet';

  @override
  String get adminParentalControl => 'Kontrolli prindëror';

  @override
  String get adminMaxParentalRating =>
      'Klasifikimi maksimal prindëror i lejuar';

  @override
  String get adminMaxParentalRatingHint =>
      'Përmbajtja me klasifikim më të lartë do t\'i fshihet këtij përdoruesi.';

  @override
  String get adminParentalRatingNone => 'Asnjë';

  @override
  String get adminBlockUnratedItems =>
      'Blloko artikujt pa informacion klasifikimi ose me klasifikim të panjohur';

  @override
  String get adminUnratedBook => 'Libra';

  @override
  String get adminUnratedChannelContent => 'Kanale';

  @override
  String get adminUnratedLiveTvChannel => 'TV drejtpërdrejt';

  @override
  String get adminUnratedMovie => 'Filma';

  @override
  String get adminUnratedMusic => 'Muzikë';

  @override
  String get adminUnratedTrailer => 'Trailerat';

  @override
  String get adminUnratedSeries => 'Seriale';

  @override
  String get adminAccessSchedules => 'Oraret e aksesit';

  @override
  String get adminAccessSchedulesHint =>
      'Lejo aksesin vetëm gjatë orareve të planifikuara më poshtë. Aksesi lejohet gjatë gjithë ditës kur nuk është caktuar asnjë orar.';

  @override
  String get adminAddSchedule => 'Shto orar';

  @override
  String get adminScheduleDay => 'Dita';

  @override
  String get adminScheduleStart => 'Fillimi';

  @override
  String get adminScheduleEnd => 'Fundi';

  @override
  String get adminDayEveryday => 'Çdo ditë';

  @override
  String get adminDayWeekday => 'Ditë jave';

  @override
  String get adminDayWeekend => 'Fundjavë';

  @override
  String get adminDaySunday => 'E diel';

  @override
  String get adminDayMonday => 'E hënë';

  @override
  String get adminDayTuesday => 'E martë';

  @override
  String get adminDayWednesday => 'E mërkurë';

  @override
  String get adminDayThursday => 'E enjte';

  @override
  String get adminDayFriday => 'E premte';

  @override
  String get adminDaySaturday => 'E shtunë';

  @override
  String get adminAllowedTags => 'Etiketat e lejuara';

  @override
  String get adminAllowedTagsHint =>
      'Shfaqet vetëm përmbajtja me këto etiketa. Lëre bosh për të lejuar të gjitha.';

  @override
  String get adminBlockedTags => 'Etiketat e bllokuara';

  @override
  String get adminBlockedTagsHint =>
      'Përmbajtja me këto etiketa i fshihet këtij përdoruesi.';

  @override
  String get adminAddTag => 'Shto etiketë';

  @override
  String get adminEnabledDevices => 'Pajisjet e aktivizuara';

  @override
  String get adminEnabledChannels => 'Kanalet e aktivizuara';

  @override
  String get adminAuthProvider => 'Ofruesi i vërtetimit';

  @override
  String get adminPasswordResetProvider =>
      'Ofruesi i rivendosjes së fjalëkalimit';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Numri maksimal i tentativave të dështuara para bllokimit';

  @override
  String get adminLoginAttemptsHint =>
      'Vendos 0 për parazgjedhjen, ose -1 për të çaktivizuar bllokimin.';

  @override
  String get adminSyncPlayAccess => 'Aksesi në SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Lejo krijimin e grupeve dhe bashkimin me to';

  @override
  String get adminSyncPlayJoin => 'Lejo bashkimin me grupe';

  @override
  String get adminSyncPlayNone => 'Pa akses';

  @override
  String get adminContentDeletionFolders => 'Lejo fshirjen e përmbajtjes nga';

  @override
  String get adminResetPasswordWarning =>
      'Kjo do të heqë fjalëkalimin. Përdoruesi do të jetë në gjendje të identifikohet pa një fjalëkalim.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Serveri ktheu HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Jeni i sigurt që doni të fshini $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Përdoruesi \"$name\" u fshi';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Fshirja e përdoruesit dështoi: $error';
  }

  @override
  String get adminCreateApiKey => 'Krijo çelësin API';

  @override
  String get adminAppName => 'Emri i aplikacionit';

  @override
  String get adminApiKeyCreated => 'U krijua çelësi API';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Çelësi u krijua me sukses. Serveri nuk e ktheu tokenin. Kontrolloni çelësat API të serverit.';

  @override
  String get adminKeyCopied => 'Tasti u kopjua në kujtesën e fragmenteve';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Krijimi i çelësit dështoi: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Shenja kyçe mungon nga përgjigja e serverit';

  @override
  String get adminRevokeApiKey => 'Revoko çelësin e API-së';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Të revokohet çelësi për $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Çelësi API u anulua';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Revokimi i çelësit dështoi: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Ngarkimi i çelësave API dështoi';

  @override
  String get adminApiKeysTitle => 'Çelësat API';

  @override
  String get adminCreateKey => 'Krijo çelës';

  @override
  String get adminNoApiKeys => 'Nuk u gjetën çelësa API';

  @override
  String get adminUnknownApp => 'Aplikacion i panjohur';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nKrijuar: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Krijo kopje rezervë';

  @override
  String get adminBackupInclude =>
      'Zgjidh çfarë të përfshihet në kopjen rezervë.';

  @override
  String get adminBackupDatabase => 'Baza e të dhënave';

  @override
  String get adminBackupDatabaseAlways => 'Përfshihet gjithmonë';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Titrat';

  @override
  String get adminBackupTrickplay => 'Imazhet Trickplay';

  @override
  String get adminCreatingBackup => 'Po krijon kopje rezervë...';

  @override
  String get adminBackupCreated => 'Rezervimi u krijua me sukses';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Krijimi i kopjes rezervë dështoi: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Mungon rruga rezervë në përgjigjen e serverit';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesti: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Ngarkimi i manifestit dështoi: $error';
  }

  @override
  String get adminConfirmRestore => 'Konfirmo Restore';

  @override
  String get adminRestoringBackup => 'Po restaurohet rezervimi...';

  @override
  String adminRestoreFailed(String error) {
    return 'Rikthimi i kopjes rezervë dështoi: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Ngarkimi i kopjeve rezervë dështoi';

  @override
  String get adminCreateBackup => 'Krijo kopje rezervë';

  @override
  String get adminNoBackups => 'Nuk u gjet asnjë kopje rezervë';

  @override
  String get adminViewDetails => 'Shiko Detajet';

  @override
  String get restore => 'Rivendos';

  @override
  String get adminLogsLoadFailed =>
      'Ngarkimi i regjistrave të serverit dështoi';

  @override
  String get adminNoLogFiles => 'Nuk u gjet asnjë skedar log';

  @override
  String get adminLogCopied => 'Regjistri u kopjua në kujtesën e fragmenteve';

  @override
  String get adminSaveLogFile => 'Ruaj skedarin e regjistrit';

  @override
  String adminSavedTo(String path) {
    return 'U ruajt te $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Ruajtja e skedarit dështoi: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Ngarkimi i $fileName dështoi';
  }

  @override
  String get adminSearchInLog => 'Kërko në log';

  @override
  String get adminNoMatchingLines => 'Nuk ka rreshta që përputhen';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Ngarkimi i detyrave dështoi: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nuk u gjetën detyra të planifikuara';

  @override
  String get adminNoTasksMatchFilter =>
      'Asnjë detyrë nuk përputhet me filtrin aktual';

  @override
  String adminTaskStartFailed(String error) {
    return 'Nisja e detyrës dështoi: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Ndalimi i detyrës dështoi: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Ngarkimi i detyrës dështoi: $error';
  }

  @override
  String get adminRunNow => 'Vraponi tani';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Heqja e nxitësit dështoi: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Shtimi i nxitësit dështoi: $error';
  }

  @override
  String get adminLastExecution => 'Ekzekutimi i fundit';

  @override
  String get adminTriggers => 'Shkaqet';

  @override
  String get adminAddTrigger => 'Shto këmbëzën';

  @override
  String get adminNoTriggers => 'Asnjë shkaktar nuk është konfiguruar';

  @override
  String get adminTriggerType => 'Lloji i këmbëzës';

  @override
  String get adminTimeLimit => 'Afati kohor (opsionale)';

  @override
  String get adminNoLimit => 'Nuk ka kufi';

  @override
  String adminHours(String hours) {
    return '$hours orë';
  }

  @override
  String get adminDayOfWeek => 'Dita e javës';

  @override
  String get adminSearchPlugins => 'Kërko shtojcat...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Ndryshimi i gjendjes së shtojcës dështoi: $error';
  }

  @override
  String get adminUninstallPlugin => 'Çinstaloni shtesën';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Jeni i sigurt që doni të çinstaloni \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Çinstalimi i shtojcës dështoi: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Instalimi i paketës dështoi: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Instalimi i përditësimit dështoi: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Ngarkimi i shtojcave dështoi: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Asnjë shtojcë nuk përputhet me kërkimin tuaj';

  @override
  String get adminNoPluginsInstalled => 'Asnjë shtojcë e instaluar';

  @override
  String adminInstallUpdate(String version) {
    return 'Instalo përditësimin (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Ngarkimi i katalogut dështoi: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Asnjë paketë nuk përputhet me kërkimin tuaj';

  @override
  String get adminNoPackagesAvailable => 'Nuk ka paketa në dispozicion';

  @override
  String get adminExperimentalIntegration => 'Integrimi Eksperimental';

  @override
  String get adminExperimentalWarning =>
      'Integrimi i cilësimeve të shtojcave është ende eksperimental. Disa nga faqet e cilësimeve mund të mos paraqiten siç duhet.';

  @override
  String get continueAction => 'Vazhdoni';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" do të hiqet pas rinisjes së serverit';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Çinstalimi dështoi: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Po përditësohet \"$name\" në v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Cilësimet nuk mund të hapen: mungon kodi i autorizimit.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Ngarkimi i shtojcës dështoi: $error';
  }

  @override
  String get adminPluginNotFound => 'Shtojca nuk u gjet';

  @override
  String adminPluginVersion(String version) {
    return 'Versioni $version';
  }

  @override
  String get adminEnablePlugin => 'Aktivizo Plugin';

  @override
  String get adminPluginSettingsPage => 'Faqja e cilësimeve të shtojcave';

  @override
  String get adminRevisionHistory => 'Historia e rishikimit';

  @override
  String get adminNoChangelog => 'Nuk disponohet regjistër i ndryshimeve.';

  @override
  String get adminRemoveRepository => 'Hiq depo';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Jeni i sigurt që doni të hiqni \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Ruajtja e depove dështoi: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Ngarkimi i depove dështoi: $error';
  }

  @override
  String get adminRepositoryNameHint => 'p.sh. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL e depove';

  @override
  String get adminAddEntry => 'Shto hyrje';

  @override
  String get adminInvalidUrl => 'URL e pavlefshme';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Cilësimet e shtojcës nuk mund të ngarkohen: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nuk u hap dot $uri';
  }

  @override
  String get adminOpenInBrowser => 'Hapni në Browser';

  @override
  String get adminOpenExternally => 'Hapni nga jashtë';

  @override
  String get adminGeneralSettings => 'Cilësimet e përgjithshme';

  @override
  String get adminServerName => 'Emri i serverit';

  @override
  String get adminPreferredMetadataCountry =>
      'Vendi i preferuar i meta të dhënave';

  @override
  String get adminCachePath => 'Rruga e cache-it';

  @override
  String get adminMetadataPath => 'Rruga e meta të dhënave';

  @override
  String get adminLibraryScanConcurrency =>
      'Konkurrenca e skanimit të bibliotekës';

  @override
  String get adminParallelImageEncodingLimit =>
      'Kufiri i kodimit paralel të imazhit';

  @override
  String get adminSlowResponseThreshold => 'Pragu i ngadaltë i përgjigjes (ms)';

  @override
  String get adminBrandingSaved => 'Cilësimet e markës u ruajtën';

  @override
  String get adminBrandingLoadFailed =>
      'Ngarkimi i cilësimeve të markës dështoi';

  @override
  String get adminLoginDisclaimer => 'Mohim identifikimi';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML shfaqet poshtë formularit të hyrjes';

  @override
  String get adminCustomCss => 'CSS e personalizuar';

  @override
  String get adminCustomCssHint =>
      'CSS e personalizuar e aplikuar në ndërfaqen e uebit';

  @override
  String get adminEnableSplashScreen => 'Aktivizo spërkatjen e ekranit';

  @override
  String get adminStreamingSaved => 'Cilësimet e transmetimit u ruajtën';

  @override
  String get adminStreamingLoadFailed =>
      'Ngarkimi i cilësimeve të transmetimit dështoi';

  @override
  String get adminStreamingDescription =>
      'Vendosni kufijtë globalë të shpejtësisë së transmetimit për lidhjet në distancë.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Kufiri i shpejtësisë së biteve të klientit në distancë (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Lëreni bosh ose 0 për të pakufizuar';

  @override
  String get adminPlaybackSaved => 'Cilësimet e luajtjes u ruajtën';

  @override
  String get adminPlaybackLoadFailed =>
      'Ngarkimi i cilësimeve të luajtjes dështoi';

  @override
  String get adminPlaybackTranscoding => 'Riprodhimi / Transkodimi';

  @override
  String get adminHardwareAcceleration => 'Përshpejtimi i harduerit';

  @override
  String get adminVaapiDevice => 'Pajisja VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Aktivizo kodimin e harduerit';

  @override
  String get adminEnableHardwareDecoding =>
      'Aktivizo dekodimin e harduerit për:';

  @override
  String get adminEncodingThreads => 'Temat e kodimit';

  @override
  String get adminAutomatic => '0 = automatik';

  @override
  String get adminTranscodingTempPath => 'Rruga e transkodimit të temperaturës';

  @override
  String get adminEnableFallbackFont => 'Aktivizo fontin e dytë';

  @override
  String get adminFallbackFontPath => 'Rruga e kthimit të shkronjave';

  @override
  String get adminAllowSegmentDeletion => 'Lejo fshirjen e segmentit';

  @override
  String get adminSegmentKeepSeconds => 'Ruajtja e segmentit (sekonda)';

  @override
  String get adminThrottleBuffering => 'Mbyllja e mbytjes';

  @override
  String get adminTrickplaySaved => 'Cilësimet e Trickplay u ruajtën';

  @override
  String get adminTrickplayLoadFailed =>
      'Ngarkimi i cilësimeve të Trickplay dështoi';

  @override
  String get adminEnableHardwareAcceleration =>
      'Aktivizo përshpejtimin e harduerit';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Aktivizo nxjerrjen vetëm të kornizës së çelësit';

  @override
  String get adminKeyFrameSubtitle => 'Saktësi më e shpejtë por më e ulët';

  @override
  String get adminScanBehavior => 'Skanoni sjelljen';

  @override
  String get adminProcessPriority => 'Prioriteti i procesit';

  @override
  String get adminImageSettings => 'Cilësimet e imazhit';

  @override
  String get adminIntervalMs => 'Intervali (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Sa shpesh për të kapur korniza';

  @override
  String get adminWidthResolutions => 'Rezolucionet e gjerësisë';

  @override
  String get adminTileWidth => 'Gjerësia e pllakës';

  @override
  String get adminTileHeight => 'Lartësia e pllakave';

  @override
  String get adminQualitySubtitle =>
      'Vlerat më të ulëta = cilësi më të mirë, skedarë më të mëdhenj';

  @override
  String get adminProcessThreads => 'Përpunoni fijet';

  @override
  String get adminResumeSaved => 'Cilësimet e rifillimit u ruajtën';

  @override
  String get adminResumeLoadFailed => 'Ngarkimi i cilësimeve të rinisë dështoi';

  @override
  String get adminResumeDescription =>
      'Konfiguro kur përmbajtja duhet të shënohet si pjesërisht e luajtur ose e luajtur plotësisht.';

  @override
  String get adminMinResumePercentage => 'Përqindja minimale e rinisë';

  @override
  String get adminMinResumeSubtitle =>
      'Përmbajtja duhet të luhet përtej kësaj përqindje për të kursyer përparimin';

  @override
  String get adminMaxResumePercentage => 'Përqindja maksimale e rinisë';

  @override
  String get adminMaxResumeSubtitle =>
      'Përmbajtja konsiderohet e luajtur plotësisht pas kësaj përqindje';

  @override
  String get adminMinResumeDuration =>
      'Kohëzgjatja minimale e rifillimit (sekonda)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Artikujt më të shkurtër se kjo nuk mund të rifillohen';

  @override
  String get adminMinAudiobookResume =>
      'Përqindja minimale e rifillimit të librit audio';

  @override
  String get adminMaxAudiobookResume =>
      'Përqindja maksimale e rifillimit të librit audio';

  @override
  String get adminNetworkingSaved =>
      'Cilësimet e rrjetit u ruajtën. Mund të kërkohet një rinisje e serverit.';

  @override
  String get adminNetworkingLoadFailed =>
      'Ngarkimi i cilësimeve të rrjetit dështoi';

  @override
  String get adminNetworkingWarning =>
      'Ndryshimet në cilësimet e rrjetit mund të kërkojnë rinisjen e serverit.';

  @override
  String get adminEnableRemoteAccess => 'Aktivizo qasjen në distancë';

  @override
  String get ports => 'Portet';

  @override
  String get adminHttpPort => 'Porta HTTP';

  @override
  String get adminHttpsPort => 'Porta HTTPS';

  @override
  String get adminPublicHttpsPort => 'Porta publike HTTPS';

  @override
  String get adminBaseUrl => 'URL-ja bazë';

  @override
  String get adminBaseUrlHint => 'p.sh. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Aktivizo HTTPS';

  @override
  String get adminLocalNetwork => 'Rrjeti lokal';

  @override
  String get adminLocalNetworkAddresses => 'Adresat e rrjetit lokal';

  @override
  String get adminKnownProxies => 'përfaqësues të njohur';

  @override
  String get adminRemoteIpFilter => 'Filtri IP në distancë';

  @override
  String get adminRemoteIpFilterEntries => 'Filtri IP në distancë';

  @override
  String get adminCertificatePath => 'Rruga e certifikatës';

  @override
  String get whitelist => 'Lista e bardhë';

  @override
  String get blacklist => 'Lista e zezë';

  @override
  String get notSet => 'Nuk është vendosur';

  @override
  String get adminMetadataSaved => 'Të dhënat meta të ruajtura';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Ngarkimi i metadatave dështoi: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Ruajtja e metadatave dështoi: $error';
  }

  @override
  String get adminRefreshMetadata => 'Rifresko të dhënat meta';

  @override
  String get recursive => 'Rekursive';

  @override
  String get adminReplaceAllMetadata => 'Zëvendësoni të gjitha meta të dhënat';

  @override
  String get adminReplaceAllImages => 'Zëvendësoni të gjitha imazhet';

  @override
  String get adminMetadataRefreshRequested =>
      'Kërkohet rifreskim i meta të dhënave';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Rifreskimi i metadatave dështoi: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Nuk u gjet asnjë përputhje në distancë';

  @override
  String get adminRemoteResults => 'Rezultatet në distancë';

  @override
  String get adminRemoteMetadataApplied =>
      'U aplikuan të dhënat meta në distancë';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Kërkimi në largësi dështoi: $error';
  }

  @override
  String get adminUpdateContentType => 'Përditëso llojin e përmbajtjes';

  @override
  String get adminContentType => 'Lloji i përmbajtjes';

  @override
  String get adminContentTypeUpdated => 'Lloji i përmbajtjes u përditësua';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Përditësimi i llojit të përmbajtjes dështoi: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Ngarkimi i redaktuesit të meta të dhënave dështoi';

  @override
  String get adminNoPeopleEntries => 'Nuk ka hyrje të njerëzve';

  @override
  String get adminNoExternalIds => 'Nuk disponohen ID të jashtme';

  @override
  String adminImageUpdated(String imageType) {
    return 'Imazhi $imageType u përditësua';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Shkarkimi i imazhit dështoi: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Format i pambështetur i imazhit';

  @override
  String get adminImageReadFailed => 'Leximi i imazhit të zgjedhur dështoi';

  @override
  String adminImageUploaded(String imageType) {
    return 'Imazhi $imageType u ngarkua';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Ngarkimi i imazhit dështoi: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Fshi imazhin $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Imazhi $imageType u fshi';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Fshirja e imazhit dështoi: $error';
  }

  @override
  String get adminAllProviders => 'Të gjithë ofruesit';

  @override
  String get adminNoRemoteImages => 'Nuk u gjetën imazhe në distancë';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Zbulimi i tunerit dështoi: $error';
  }

  @override
  String get adminAddTuner => 'Shto sintonizues';

  @override
  String get adminEditTuner => 'Redakto tunerin';

  @override
  String get adminTunerTypeM3u => 'Tuner M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Skedar ose URL';

  @override
  String get adminTunerIpAddress => 'Adresa IP e tunerit';

  @override
  String get adminTunerFriendlyName => 'Emri miqësor';

  @override
  String get adminTunerUserAgent => 'Agjenti i përdoruesit';

  @override
  String get adminTunerCount => 'Kufiri i lidhjeve të njëkohshme';

  @override
  String get adminTunerCountHelp =>
      'Numri maksimal i transmetimeve që lejon tuneri njëkohësisht. Vendos 0 për të pakufizuar.';

  @override
  String get adminTunerFallbackBitrate =>
      'Bitrate-i maksimal rezervë i transmetimit';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Importo vetëm kanalet e preferuara';

  @override
  String get adminTunerAllowHwTranscoding => 'Lejo transkodimin harduerik';

  @override
  String get adminTunerAllowFmp4 => 'Lejo kontejnerin e transkodimit fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Lejo ndarjen e transmetimit';

  @override
  String get adminTunerEnableStreamLooping =>
      'Aktivizo përsëritjen e transmetimit';

  @override
  String get adminTunerIgnoreDts => 'Shpërfill DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Lexo hyrjen me shpejtësinë origjinale të kuadrove';

  @override
  String get adminEditProvider => 'Redakto ofruesin';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Skedar ose URL';

  @override
  String get adminXmltvMoviePrefix => 'Parashtesa e filmit';

  @override
  String get adminXmltvMovieCategories => 'Kategoritë e filmave';

  @override
  String get adminXmltvCategoriesHelp =>
      'Ndaji kategoritë e shumta me një vijë vertikale.';

  @override
  String get adminXmltvKidsCategories => 'Kategoritë për fëmijë';

  @override
  String get adminXmltvNewsCategories => 'Kategoritë e lajmeve';

  @override
  String get adminXmltvSportsCategories => 'Kategoritë sportive';

  @override
  String get adminSdUsername => 'Emri i përdoruesit';

  @override
  String get adminSdPassword => 'Fjalëkalimi';

  @override
  String get adminSdCountry => 'Shteti';

  @override
  String get adminSdCountrySelect => 'Zgjidh një shtet';

  @override
  String get adminSdPostalCode => 'Kodi postar';

  @override
  String get adminSdGetListings => 'Merr listimet';

  @override
  String get adminSdListings => 'Listimet';

  @override
  String get adminEnableAllTuners => 'Aktivizo të gjithë tunerët';

  @override
  String get adminTunerType => 'Lloji i sintonizuesit';

  @override
  String get adminTunerAdded => 'Akorduesi u shtua';

  @override
  String adminTunerAddFailed(String error) {
    return 'Shtimi i tunerit dështoi: $error';
  }

  @override
  String get adminAddGuideProvider => 'Shto ofruesin e udhëzuesit';

  @override
  String get adminProviderType => 'Lloji i ofruesit';

  @override
  String get adminProviderAdded => 'Ofruesi u shtua';

  @override
  String adminProviderAddFailed(String error) {
    return 'Shtimi i ofruesit dështoi: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Heqja e tunerit dështoi: $error';
  }

  @override
  String get adminTunerResetRequested => 'Kërkohet rivendosja e sintonizuesit';

  @override
  String adminTunerResetFailed(String error) {
    return 'Rivendosja e tunerit dështoi: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Ky lloj tuneri nuk mbështet rivendosjen.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Heqja e ofruesit dështoi: $error';
  }

  @override
  String get adminRecordingSettings => 'Cilësimet e regjistrimit';

  @override
  String get adminPrePadding => 'Mbushja paraprake (minuta)';

  @override
  String get adminPostPadding => 'Pas mbushjes (minuta)';

  @override
  String get adminRecordingPath => 'Rruga e regjistrimit';

  @override
  String get adminSeriesRecordingPath => 'Rruga e regjistrimit të serisë';

  @override
  String get adminMovieRecordingPath => 'Shtegu i regjistrimit të filmave';

  @override
  String get adminGuideDays => 'Ditët e të dhënave të udhëzuesit';

  @override
  String get adminGuideDaysAuto => 'Automatik';

  @override
  String adminGuideDaysValue(int days) {
    return '$days ditë';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Shtegu i aplikacionit të pas-përpunimit';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumentet e pas-përpunuesit';

  @override
  String get adminSaveRecordingNfo => 'Ruaj metadatat NFO të regjistrimit';

  @override
  String get adminSaveRecordingImages => 'Ruaj imazhet e regjistrimit';

  @override
  String get adminLiveTvSectionTiming => 'Koha';

  @override
  String get adminLiveTvSectionPaths => 'Shtigjet e regjistrimit';

  @override
  String get adminLiveTvSectionPostProcessing => 'Pas-përpunimi';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Të dhënat e udhëzuesit: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'Cilësimet e regjistrimit u ruajtën';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Ruajtja e cilësimeve dështoi: $error';
  }

  @override
  String get adminSetChannelMappings => 'Cakto Hartimet e Kanaleve';

  @override
  String get adminMappingJson => 'Harta JSON';

  @override
  String get adminMappingJsonHint => 'Shembull: harta e ngarkesës JSON';

  @override
  String get adminChannelMappingsUpdated => 'Hartat e kanaleve u përditësuan';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Përditësimi i hartëzimeve dështoi: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Ngarkimi i administrimit të TV drejtpërdrejt dështoi';

  @override
  String get adminTunerDevices => 'Pajisjet sintonizuese';

  @override
  String get adminNoTunerHosts =>
      'Asnjë pritës sintonizues nuk është konfiguruar';

  @override
  String get adminGuideProviders => 'Ofruesit e udhëzuesve';

  @override
  String get adminRefreshGuideData => 'Rifresko të dhënat e udhëzuesit';

  @override
  String get adminGuideRefreshStarted =>
      'Rifreskimi i të dhënave të udhëzuesit filloi';

  @override
  String get adminGuideRefreshUnavailable =>
      'Detyra e rifreskimit të udhëzuesit nuk ofrohet në këtë server.';

  @override
  String get adminAddProvider => 'Shto Ofrues';

  @override
  String get adminNoListingProviders =>
      'Asnjë ofrues listimi nuk është konfiguruar';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Shtegu i regjistrimit: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Shtegu i serialeve: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Mbushje para: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Mbushje pas: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Zbulimi i sintonizuesit';

  @override
  String get adminChannelMappings => 'Hartat e kanaleve';

  @override
  String get adminNoDiscoveredTuners => 'Asnjë sintonizues i zbuluar ende';

  @override
  String get adminSettingsSaved => 'Cilësimet u ruajtën';

  @override
  String get adminBackupsNotAvailable =>
      'Rezervimet nuk disponohen në këtë version të serverit.';

  @override
  String get adminRestoreWarning1 =>
      'Rivendosja do të zëvendësojë TË GJITHA të dhënat aktuale të serverit me të dhënat rezervë.';

  @override
  String get adminRestoreWarning2 =>
      'Cilësimet aktuale të serverit, përdoruesit dhe të dhënat e bibliotekës do të mbishkruhen.';

  @override
  String get adminRestoreWarning3 => 'Serveri do të riniset pas restaurimit.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Të rikthehet tani kopja rezervë $name?';
  }

  @override
  String get adminRestoreRequested =>
      'Kërkohet rivendosja. Rinisja e serverit mund ta shkëputë këtë sesion.';

  @override
  String get adminBackupsTitle => 'Rezervimet';

  @override
  String get adminUnknownDate => 'Data e panjohur';

  @override
  String get adminUnnamedBackup => 'Rezervimi pa emër';

  @override
  String get adminLiveTvNotAvailable =>
      'Administrimi i TV drejtpërdrejt nuk ofrohet në këtë version të serverit.';

  @override
  String get adminLiveTvTitle => 'Administrimi i TV drejtpërdrejt';

  @override
  String get adminApply => 'Zbato';

  @override
  String get adminNotSet => 'Nuk është vendosur';

  @override
  String get adminReset => 'Rivendos';

  @override
  String get adminLogsTitle => 'Regjistrat e Serverit';

  @override
  String get adminLogsNewestFirst => 'Më të rejat e para';

  @override
  String get adminLogsOldestFirst => 'I pari më i vjetër';

  @override
  String get adminLogsJustNow => 'Vetëm tani';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes min më parë';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours orë më parë';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days ditë më parë';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Ngarkimi i $fileName dështoi';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count përputhje';
  }

  @override
  String get adminLogViewerNoMatches => 'Nuk ka rreshta që përputhen';

  @override
  String get adminMetadataEditorTitle => 'Redaktori i meta të dhënave';

  @override
  String get adminMetadataIdentify => 'Identifiko';

  @override
  String get adminMetadataType => 'Lloji';

  @override
  String get adminMetadataDetails => 'Detajet';

  @override
  String get adminMetadataExternalIds => 'ID e jashtme';

  @override
  String get adminMetadataImages => 'Imazhet';

  @override
  String get adminMetadataFieldTitle => 'Titulli';

  @override
  String get adminMetadataFieldSortTitle => 'Rendit titullin';

  @override
  String get adminMetadataFieldOriginalTitle => 'Titulli origjinal';

  @override
  String get adminMetadataFieldPremiereDate => 'Data e premierës (VVVV-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Data e përfundimit (VVVV-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Viti i prodhimit';

  @override
  String get adminMetadataFieldOfficialRating => 'Vlerësimi zyrtar';

  @override
  String get adminMetadataFieldCommunityRating => 'Vlerësimi i komunitetit';

  @override
  String get adminMetadataFieldCriticRating => 'Vlerësimi kritik';

  @override
  String get adminMetadataFieldTagline => 'Slogani';

  @override
  String get adminMetadataFieldOverview => 'Vështrim i përgjithshëm';

  @override
  String get adminMetadataGenres => 'Zhanret';

  @override
  String get adminMetadataTags => 'Etiketat';

  @override
  String get adminMetadataStudios => 'Studiot';

  @override
  String get adminMetadataPeople => 'Njerëzit';

  @override
  String get adminMetadataAddGenre => 'Shto zhanër';

  @override
  String get adminMetadataAddTag => 'Shto etiketë';

  @override
  String get adminMetadataAddStudio => 'Shto studio';

  @override
  String get adminMetadataAddPerson => 'Shto person';

  @override
  String get adminMetadataEditPerson => 'Redakto personin';

  @override
  String get adminMetadataRole => 'Roli';

  @override
  String get adminMetadataImagePrimary => 'fillore';

  @override
  String get adminMetadataImageBackdrop => 'Sfondi';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Baner';

  @override
  String get adminMetadataImageThumb => 'Gishti i madh';

  @override
  String get adminMetadataRecursive => 'Rekursive';

  @override
  String get adminMetadataProvider => 'Ofruesi';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Imazhi $imageType u përditësua';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Imazhi $imageType u ngarkua';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Imazhi $imageType u fshi';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Shkarkimi i imazhit dështoi: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Leximi i imazhit të zgjedhur dështoi';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Ngarkimi i imazhit dështoi: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Fshi imazhin $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Kjo heq imazhin aktual nga artikulli.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Fshirja e imazhit dështoi: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Zgjidh imazhin $imageType';
  }

  @override
  String get adminMetadataUpload => 'Ngarko';

  @override
  String get adminMetadataUpdate => 'Përditëso';

  @override
  String get adminMetadataRemoteImage => 'Imazhi në distancë';

  @override
  String get adminPluginsInstalled => 'Instaluar';

  @override
  String get adminPluginsCatalog => 'Katalogu';

  @override
  String get adminPluginsActive => 'Aktiv';

  @override
  String get adminPluginsRestart => 'Rinis';

  @override
  String get adminPluginsNoSearchResults =>
      'Asnjë shtojcë nuk përputhet me kërkimin tuaj';

  @override
  String get adminPluginsNoneInstalled => 'Asnjë shtojcë e instaluar';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Përditësim i disponueshëm: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Ofrohet përditësim';

  @override
  String get adminPluginsPendingRemoval => 'Në pritje të heqjes pas rinisjes';

  @override
  String get adminPluginsChangesPending => 'Ndryshimet në pritje të rinisjes';

  @override
  String get adminPluginsEnable => 'Aktivizo';

  @override
  String get adminPluginsDisable => 'Çaktivizo';

  @override
  String get adminPluginsInstallUpdate => 'Instalo përditësimin';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instalo përditësimin (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Asnjë paketë nuk përputhet me kërkimin tuaj';

  @override
  String get adminPluginsCatalogEmpty => 'Nuk ka paketa në dispozicion';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" po instalohet...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integrimi Eksperimental';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integrimi i cilësimeve të shtojcave është ende eksperimental. Disa fusha ose paraqitje mund të mos paraqiten ende si duhet.';

  @override
  String get adminPluginDetailToggle404 =>
      'Ndërrimi i pjesës shtesë dështoi. Serveri nuk mund ta gjente këtë version të shtojcës. Provoni të rifreskoni shtojcat, më pas riprovoni.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Ndërrimi i pjesës shtesë dështoi. Ju lutemi kontrolloni regjistrat e serverit për detaje.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Cilësimet e $name';
  }

  @override
  String get adminPluginDetailDetails => 'Detajet';

  @override
  String get adminPluginDetailDeveloper => 'Zhvilluesi';

  @override
  String get adminPluginDetailRepository => 'Depoja';

  @override
  String get adminPluginDetailBundled => 'Të paketuara';

  @override
  String get adminPluginDetailEnablePlugin => 'Aktivizo Plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'Kërkohet një rinisje e serverit që ndryshimet të hyjnë në fuqi.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Kjo shtojcë do të hiqet pas rinisjes së serverit.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Kjo shtojcë ka mosfunksionuar dhe mund të mos funksionojë siç duhet.';

  @override
  String get adminPluginDetailNotSupported =>
      'Kjo shtojcë nuk mbështetet nga versioni aktual i serverit.';

  @override
  String get adminPluginDetailSuperseded =>
      'Kjo shtojcë është zëvendësuar nga një version më i ri.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Ngarkimi i depove dështoi: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Hiq depo';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Jeni i sigurt që doni të hiqni \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Hiq';

  @override
  String adminReposSaveFailed(String error) {
    return 'Ruajtja e depove dështoi: $error';
  }

  @override
  String get adminReposEmpty => 'Asnjë depo nuk është konfiguruar';

  @override
  String get adminReposEmptySubtitle =>
      'Shto një depo për të shfletuar shtojcat e disponueshme';

  @override
  String get adminReposUnnamed => '(pa emër)';

  @override
  String get adminReposEditTitle => 'Redakto depo';

  @override
  String get adminReposAddTitle => 'Shto depo';

  @override
  String get adminReposUrl => 'URL e depove';

  @override
  String get adminReposNameHint => 'p.sh. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL e pavlefshme';

  @override
  String get adminGeneralSettingsTitle => 'Cilësimet e përgjithshme';

  @override
  String get adminGeneralMetadataLanguage =>
      'Gjuha e preferuar e meta të dhënave';

  @override
  String get adminGeneralMetadataLanguageHint => 'p.sh. en, de, fr';

  @override
  String get adminGeneralMetadataCountry =>
      'Vendi i preferuar i meta të dhënave';

  @override
  String get adminGeneralMetadataCountryHint => 'p.sh. SHBA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Konkurrenca e skanimit të bibliotekës';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Kufiri i kodimit paralel të imazhit';

  @override
  String get adminUnknownError => 'Gabim i panjohur';

  @override
  String get adminBrowse => 'Shfletoni';

  @override
  String get adminCloseBrowser => 'Mbyll shfletuesin';

  @override
  String get adminNetworkingTitle => 'Rrjetëzimi';

  @override
  String get adminNetworkingRestartWarning =>
      'Ndryshimet në cilësimet e rrjetit mund të kërkojnë rinisjen e serverit.';

  @override
  String get adminNetworkingRemoteAccess => 'Aktivizo qasjen në distancë';

  @override
  String get adminNetworkingPorts => 'Portet';

  @override
  String get adminNetworkingHttpPort => 'Porta HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Porta HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Aktivizo HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Rrjeti lokal';

  @override
  String get adminNetworkingLocalAddresses => 'Adresat e rrjetit lokal';

  @override
  String get adminNetworkingAddressHint => 'p.sh. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'përfaqësues të njohur';

  @override
  String get adminNetworkingProxyHint => 'p.sh. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Lista e bardhë';

  @override
  String get adminNetworkingBlacklist => 'Lista e zezë';

  @override
  String get adminNetworkingAddEntry => 'Shto hyrje';

  @override
  String get adminBrandingTitle => 'Markimi';

  @override
  String get adminBrandingLoginDisclaimer => 'Mohim identifikimi';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML shfaqet poshtë formularit të hyrjes';

  @override
  String get adminBrandingCustomCss => 'CSS e personalizuar';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS e personalizuar e aplikuar në ndërfaqen e uebit';

  @override
  String get adminBrandingEnableSplash => 'Aktivizo spërkatjen e ekranit';

  @override
  String get adminBrandingSplashUpload => 'Ngarko imazh';

  @override
  String get adminBrandingSplashUploaded => 'Ekrani i nisjes u përditësua';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Ngarkimi i ekranit të nisjes dështoi';

  @override
  String get adminBrandingSplashDeleted => 'Ekrani i nisjes u hoq';

  @override
  String get adminBrandingNoSplash => 'Pa ekran nisjeje të personalizuar';

  @override
  String get adminPlaybackHwAccel => 'Përshpejtimi i harduerit';

  @override
  String get adminPlaybackHwAccelLabel => 'Përshpejtimi i harduerit';

  @override
  String get adminPlaybackEnableHwEncoding => 'Aktivizo kodimin e harduerit';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Aktivizo dekodimin e harduerit për:';

  @override
  String get adminPlaybackQsvDevice => 'Pajisja QSV';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Aktivizo dekoduesin e përmirësuar NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Parapëlqe dekoduesin harduerik origjinal të sistemit';

  @override
  String get adminPlaybackColorDepth =>
      'Thellësia e ngjyrës për dekodimin harduerik';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Dekodim HEVC 10-bit';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Dekodim VP9 10-bit';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'Dekodim HEVC RExt 8/10-bit';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'Dekodim HEVC RExt 12-bit';

  @override
  String get adminPlaybackHwEncodingSection => 'Kodimi harduerik';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Lejo kodimin HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Lejo kodimin AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Aktivizo koduesin Intel H.264 me konsum të ulët';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Aktivizo koduesin Intel HEVC me konsum të ulët';

  @override
  String get adminPlaybackToneMapping => 'Hartëzimi i toneve';

  @override
  String get adminPlaybackEnableTonemapping => 'Aktivizo hartëzimin e toneve';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Aktivizo hartëzimin e toneve VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Aktivizo hartëzimin e toneve VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Algoritmi i hartëzimit të toneve';

  @override
  String get adminPlaybackTonemappingMode =>
      'Modaliteti i hartëzimit të toneve';

  @override
  String get adminPlaybackTonemappingRange => 'Gama e hartëzimit të toneve';

  @override
  String get adminPlaybackTonemappingDesat => 'Çngopja e hartëzimit të toneve';

  @override
  String get adminPlaybackTonemappingPeak => 'Kulmi i hartëzimit të toneve';

  @override
  String get adminPlaybackTonemappingParam =>
      'Parametri i hartëzimit të toneve';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Ndriçimi i hartëzimit të toneve VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Kontrasti i hartëzimit të toneve VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Paracaktimet dhe cilësia';

  @override
  String get adminPlaybackEncoderPreset => 'Paracaktimi i koduesit';

  @override
  String get adminPlaybackH264Crf => 'CRF i kodimit H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF i kodimit H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Metoda e çndërthurjes';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Dyfisho shpejtësinë e kuadrove gjatë çndërthurjes';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Aktivizo kodimin audio VBR';

  @override
  String get adminPlaybackDownmixBoost =>
      'Forcimi i përzierjes poshtë të audios';

  @override
  String get adminPlaybackDownmixAlgorithm =>
      'Algoritmi i përzierjes poshtë në stereo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Madhësia maksimale e radhës së multipleksimit';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Kodimi';

  @override
  String get adminPlaybackEncodingThreads => 'Temat e kodimit';

  @override
  String get adminPlaybackFallbackFont => 'Aktivizo fontin e dytë';

  @override
  String get adminPlaybackFallbackFontPath => 'Rruga e kthimit të shkronjave';

  @override
  String get adminPlaybackStreaming => 'Transmetim';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Audiolibra';

  @override
  String get adminResumeMinAudiobookPct =>
      'Përqindja minimale e rifillimit të librit audio';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Përqindja maksimale e rifillimit të librit audio';

  @override
  String get adminStreamingBitrateLimit =>
      'Kufiri i shpejtësisë së biteve të klientit në distancë (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Lëreni bosh ose 0 për të pakufizuar';

  @override
  String get adminTrickplayHwAccel => 'Aktivizo përshpejtimin e harduerit';

  @override
  String get adminTrickplayHwEncoding => 'Aktivizo kodimin e harduerit';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Aktivizo nxjerrjen vetëm të kornizës së çelësit';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Saktësi më e shpejtë por më e ulët';

  @override
  String get adminTrickplayNonBlocking => 'Jo bllokues';

  @override
  String get adminTrickplayBlocking => 'Bllokimi';

  @override
  String get adminTrickplayPriorityHigh => 'Lartë';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Mbi normalen';

  @override
  String get adminTrickplayPriorityNormal => 'Normale';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Nën normale';

  @override
  String get adminTrickplayPriorityIdle => 'I papunë';

  @override
  String get adminTrickplayImageSettings => 'Cilësimet e imazhit';

  @override
  String get adminTrickplayInterval => 'Intervali (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Sa shpesh për të kapur korniza';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Gjerësia e pikselëve të ndara me presje (p.sh. 320)';

  @override
  String get adminTrickplayQuality => 'Cilësia';

  @override
  String get adminTrickplayQScale => 'Shkalla e cilësisë';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Vlerat më të ulëta = cilësi më të mirë, skedarë më të mëdhenj';

  @override
  String get adminTrickplayJpegQuality => 'Cilësi JPEG';

  @override
  String get adminTrickplayProcessing => 'Përpunimi';

  @override
  String get adminTasksEmpty => 'Nuk u gjetën detyra të planifikuara';

  @override
  String get adminTasksNoFilterMatch =>
      'Asnjë detyrë nuk përputhet me filtrin aktual';

  @override
  String get adminTaskCancelling => 'Po anulohet...';

  @override
  String get adminTaskRunning => 'Duke vrapuar...';

  @override
  String get adminTaskNeverRun => 'Mos vraponi kurrë';

  @override
  String get adminTaskStop => 'Ndalo';

  @override
  String get adminRunningTasks => 'Detyrat në ekzekutim';

  @override
  String get adminTaskRun => 'Vraponi';

  @override
  String get adminTaskDetailLastExecution => 'Ekzekutimi i fundit';

  @override
  String get adminTaskDetailStarted => 'Filloi';

  @override
  String get adminTaskDetailEnded => 'Përfundoi';

  @override
  String get adminTaskDetailDuration => 'Kohëzgjatja';

  @override
  String get adminTaskDetailErrorLabel => 'Gabim:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Çdo ditë në $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Çdo $day në $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Çdo $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Në fillimin e aplikacionit';

  @override
  String get adminTaskTriggerTypeDaily => 'Ditore';

  @override
  String get adminTaskTriggerTypeWeekly => 'Javore';

  @override
  String get adminTaskTriggerTypeInterval => 'Në një interval';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervali';

  @override
  String get adminTaskTriggerEveryHour => 'Çdo orë';

  @override
  String get adminTaskTriggerEvery6Hours => 'Çdo 6 orë';

  @override
  String get adminTaskTriggerEvery12Hours => 'Çdo 12 orë';

  @override
  String get adminTaskTriggerEvery24Hours => 'Çdo 24 orë';

  @override
  String get adminTaskTriggerEvery2Days => 'Çdo 2 ditë';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count orë',
      one: '1 orë',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Koha';

  @override
  String get adminTaskTriggerNoLimit => 'Nuk ka kufi';

  @override
  String get adminActivityJustNow => 'Vetëm tani';

  @override
  String get adminActivityLastHour => 'Ora e fundit';

  @override
  String get adminActivityToday => 'Sot';

  @override
  String get adminActivityYesterday => 'Dje';

  @override
  String get adminActivityOlder => 'Më të vjetër';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days ditë më parë';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours orë më parë';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes min më parë';
  }

  @override
  String get adminActivityNow => 'tani';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours orë';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days ditë';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfiguro gjenerimin e imazheve Trickplay për miniaturat e paraparjes gjatë lëvizjes.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porta publike HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'URL-ja bazë';

  @override
  String get adminNetworkingBaseUrlHint => 'p.sh. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Porta publike HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Kërko HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Ridrejto të gjitha kërkesat në largësi drejt HTTPS. Nuk ka efekt nëse serveri nuk ka certifikatë të vlefshme.';

  @override
  String get adminNetworkingCertPassword => 'Fjalëkalimi i certifikatës';

  @override
  String get adminNetworkingIpSettings => 'Cilësimet e IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Aktivizo IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Aktivizo IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Aktivizo hartëzimin automatik të portave';

  @override
  String get adminNetworkingLocalSubnets => 'Rrjetet LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Listë adresash IP ose nënrrjetesh CIDR, të ndara me presje ose rreshta, që trajtohen si pjesë e rrjetit lokal.';

  @override
  String get adminNetworkingPublishedUris => 'URI-të e publikuara të serverit';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Harto një nënrrjet ose adresë te një URL e publikuar, p.sh. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Rruga e certifikatës';

  @override
  String get adminNetworkingRemoteIpFilter => 'Filtri IP në distancë';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filtri IP në distancë';

  @override
  String get adminPlaybackVaapiDevice => 'Pajisja VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automatik';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Rruga e transkodimit të temperaturës';

  @override
  String get adminPlaybackSegmentDeletion => 'Lejo fshirjen e segmentit';

  @override
  String get adminPlaybackSegmentKeep => 'Ruajtja e segmentit (sekonda)';

  @override
  String get adminPlaybackThrottleBuffering => 'Mbyllja e mbytjes';

  @override
  String get adminPlaybackThrottleDelay => 'Vonesa e kufizimit (sekonda)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Lejo nxjerrjen e titrave në çast';

  @override
  String get adminResumeMinPct => 'Përqindja minimale e rinisë';

  @override
  String get adminResumeMinPctSubtitle =>
      'Përmbajtja duhet të luhet përtej kësaj përqindje për të kursyer përparimin';

  @override
  String get adminResumeMaxPct => 'Përqindja maksimale e rinisë';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Përmbajtja konsiderohet e luajtur plotësisht pas kësaj përqindje';

  @override
  String get adminResumeMinDuration =>
      'Kohëzgjatja minimale e rifillimit (sekonda)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Artikujt më të shkurtër se kjo nuk mund të rifillohen';

  @override
  String get adminTrickplayScanBehavior => 'Skanoni sjelljen';

  @override
  String get adminTrickplayProcessPriority => 'Prioriteti i procesit';

  @override
  String get adminTrickplayTileWidth => 'Gjerësia e pllakës';

  @override
  String get adminTrickplayTileHeight => 'Lartësia e pllakave';

  @override
  String get adminTrickplayProcessThreads => 'Përpunoni fijet';

  @override
  String get adminTrickplayWidthResolutions => 'Rezolucionet e gjerësisë';

  @override
  String get adminMetadataDefault => 'E paracaktuar';

  @override
  String get adminMetadataContentTypeUpdated =>
      'Lloji i përmbajtjes u përditësua';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Përditësimi i llojit të përmbajtjes dështoi: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Pragu i ngadaltë i përgjigjes (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Aktivizo paralajmërimet për përgjigje të ngadalta';

  @override
  String get adminGeneralQuickConnect => 'Aktivizo Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Serveri';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Shtigjet';

  @override
  String get adminGeneralSectionPerformance => 'Performanca';

  @override
  String get adminGeneralCachePath => 'Rruga e cache-it';

  @override
  String get adminGeneralMetadataPath => 'Rruga e meta të dhënave';

  @override
  String get adminGeneralServerName => 'Emri i serverit';

  @override
  String get adminGeneralDisplayLanguage => 'Gjuha e parapëlqyer e shfaqjes';

  @override
  String get adminSettingsLoadFailed => 'Ngarkimi i cilësimeve dështoi';

  @override
  String get adminDiscover => 'Zbuloni';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Përditësimi i hartëzimeve dështoi: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Kufiri kohor: $duration';
  }

  @override
  String get folders => 'Dosjet';

  @override
  String get libraries => 'Bibliotekat';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay është çaktivizuar';

  @override
  String get syncPlayDisabledMessage =>
      'Aktivizo SyncPlay te Cilësimet për të përdorur riprodhimin e sinkronizuar.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Serveri nuk mbështetet';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay kërkon një server Jellyfin. Serveri aktual nuk e mbështet atë.';

  @override
  String get syncPlayGroupFallbackName => 'Grupi SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Grupi SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# pjesëmarrës',
      one: '# pjesëmarrës',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Injoro pritjen';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Mos e mbani grupin lart ndërsa kjo pajisje është në bufer';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Vazhdoni në nivel lokal pa pritur anëtarë të ngadaltë';

  @override
  String get syncPlayRepeat => 'Përsëriteni';

  @override
  String get syncPlayRepeatOne => 'Një';

  @override
  String get syncPlayShuffleModeShuffled => 'Përzihet';

  @override
  String get syncPlayShuffleModeSorted => 'Të renditura';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sinkronizoni radhën aktuale të riprodhimit';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Zëvendësoni radhën e grupit me atë që po luhet në nivel lokal';

  @override
  String get syncPlayLeaveGroup => 'Largohu nga grupi';

  @override
  String get syncPlayGroupQueue => 'Radha e grupit';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Artikulli $index';
  }

  @override
  String get syncPlayPlayNow => 'Luaj tani';

  @override
  String get syncPlayCreateNewGroup => 'Krijo një grup të ri';

  @override
  String get syncPlayGroupName => 'Emri i grupit';

  @override
  String get syncPlayDefaultGroupName => 'Grupi im SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Krijo grup';

  @override
  String get syncPlayAvailableGroups => 'Grupet e disponueshme';

  @override
  String get syncPlayNoGroupsAvailable => 'Nuk ka grupe të disponueshme';

  @override
  String get syncPlayJoinGroupQuestion => 'Bashkohu me grupin SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Bashkimi në një grup SyncPlay mund të zëvendësojë radhën tuaj aktuale të riprodhimit. Të vazhdohet?';

  @override
  String get syncPlayJoin => 'Bashkohu';

  @override
  String get syncPlayStateIdle => 'I papunë';

  @override
  String get syncPlayStateWaiting => 'Në pritje';

  @override
  String get syncPlayStatePaused => 'Në pauzë';

  @override
  String get syncPlayStatePlaying => 'Duke luajtur';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName u bashkua me grupin SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName u largua nga grupi SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Qasja në SyncPlay u refuzua';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Ju nuk keni akses në një ose më shumë artikuj në këtë grup SyncPlay. Kërkojini pronarit të grupit të verifikojë lejet e bibliotekës ose të zgjedhë një radhë tjetër.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Po sinkronizohet luajtja me $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Kërkimi zanor nuk ofrohet.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Luajtja e drejtpërdrejtë e Dolby Vision dështoi';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Luajtja direkte dështoi në fillimin e këtij transmetimi Dolby Vision. Riprovoni të përdorni transkodin e serverit?';

  @override
  String get retryWithTranscode => 'Provo sërish me transkod';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision nuk mbështetet';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Kjo pajisje nuk mund të dekodojë drejtpërdrejt përmbajtjen e Dolby Vision. Përdorni HDR10 rezervë ose kërkoni transkodimin e serverit.';

  @override
  String get rememberMyChoice => 'Mbani mend zgjedhjen time';

  @override
  String get playHdr10Fallback => 'Luaj HDR10 rikthim';

  @override
  String get requestTranscode => 'Kërko transkod';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# rreshta të zbuluar',
      one: '# rresht i zbuluar',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Shih të gjitha';

  @override
  String get noItems => 'Nuk ka artikuj';

  @override
  String get switchUser => 'Ndërro përdorues';

  @override
  String get remoteControl => 'Telekomandë';

  @override
  String get mediaBarLoading => 'Shiriti i medias po ngarkohet...';

  @override
  String get mediaBarError => 'Shiriti i medias nuk u ngarkua';

  @override
  String get offlineServerUnavailable =>
      'Lidhur me internetin, por serveri aktual nuk është i disponueshëm.';

  @override
  String get offlineNoInternet =>
      'Ju jeni jashtë linje. Vetëm përmbajtja e shkarkuar është e disponueshme.';

  @override
  String get offlineFileNotAvailable => 'Skedari nuk disponohet';

  @override
  String get offlineSwitchServer => 'Ndërroni serverin';

  @override
  String get offlineSavedMedia => 'Media e ruajtur';

  @override
  String get offlineBannerTitle => 'Jeni jashtë linje';

  @override
  String get offlineBannerSubtitle => 'Po shfaqen shkarkimet tuaja';

  @override
  String get offlineBannerAction => 'Shkarkimet';

  @override
  String get serverUnreachableBannerTitle => 'Serveri juaj nuk arrihet';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Po luhet nga shkarkimet derisa të rikthehet';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Riprodhimi në distancë';

  @override
  String castControlFailed(String error) {
    return 'Kontrolli i transmetimit dështoi: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Kontrollet e $kind';
  }

  @override
  String get castDeviceVolume => 'Volumi i pajisjes';

  @override
  String get castVolumeUnavailable => 'I padisponueshëm';

  @override
  String castStopKind(String kind) {
    return 'Ndalo $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Titra';

  @override
  String get pinConfirmTitle => 'Konfirmo PIN-in';

  @override
  String get pinSetTitle => 'Cakto PIN';

  @override
  String get pinEnterTitle => 'Fut kodin PIN';

  @override
  String get pinReenterToConfirm => 'Rifusni kodin PIN për ta konfirmuar';

  @override
  String pinEnterNDigit(int length) {
    return 'Vendosni një PIN me $length shifra';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Vendosni PIN-in tuaj me $length shifra';
  }

  @override
  String get pinIncorrect => 'PIN i pasaktë';

  @override
  String get pinMismatch => 'PIN-et nuk përputhen';

  @override
  String get pinForgot => 'Keni harruar kodin PIN?';

  @override
  String get pinClear => 'Pastro';

  @override
  String get pinBackspace => 'Kthim prapa';

  @override
  String get quickConnectAuthorized => 'Kërkesa Quick Connect u autorizua.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kodi Quick Connect është i pavlefshëm ose ka skaduar.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect nuk mbështetet në këtë server.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Autorizimi i kodit Quick Connect dështoi.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect është i çaktivizuar në këtë server.';

  @override
  String get quickConnectForbidden =>
      'Llogaria juaj nuk mund ta autorizojë këtë kërkesë Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Kodi Quick Connect nuk u gjet. Provo një kod të ri.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect dështoi: $message';
  }

  @override
  String get quickConnectEnterCode => 'Fut kodin';

  @override
  String get quickConnectAuthorize => 'Autorizoni';

  @override
  String remoteCommandFailed(String error) {
    return 'Komanda dështoi: $error';
  }

  @override
  String get remoteControlTitle => 'Telekomandë';

  @override
  String get remoteFailedToLoadSessions => 'Ngarkimi i seancave dështoi';

  @override
  String get remoteNoSessions => 'Nuk ka seanca të kontrollueshme';

  @override
  String get remoteStartPlayback => 'Filloni riprodhimin në një pajisje tjetër';

  @override
  String get unknownUser => 'E panjohur';

  @override
  String get unknownItem => 'E panjohur';

  @override
  String get remoteNothingPlaying => 'Asgjë nuk luhet në këtë seancë';

  @override
  String get castingStarted => 'Transmetimi filloi në pajisjen e zgjedhur';

  @override
  String castingFailed(String error) {
    return 'Nisja e transmetimit dështoi: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nuk disponohen pajisje riprodhimi në distancë.';

  @override
  String get noRemoteDevicesIos =>
      'Nuk disponohen pajisje riprodhimi në distancë.\n\nNë iOS, objektivat e AirPlay mund të mos jenë të disponueshëm në simulator.';

  @override
  String get trackActionPlayNext => 'Luaj Tjetra';

  @override
  String get trackActionAddToQueue => 'Shto në radhë';

  @override
  String get trackActionAddToPlaylist => 'Shto në listën e luajtjes';

  @override
  String get trackActionCancelDownload => 'Anulo shkarkimin';

  @override
  String get trackActionDeleteFromPlaylist => 'Fshi nga lista e luajtjes';

  @override
  String get trackActionMoveUp => 'Lëviz lart';

  @override
  String get trackActionMoveDown => 'Lëvizni Poshtë';

  @override
  String get trackActionRemoveFromFavorites => 'Hiq nga të preferuarat';

  @override
  String get trackActionAddToFavorites => 'Shto në të preferuarat';

  @override
  String get trackActionGoToAlbum => 'Shkoni te Albumi';

  @override
  String get trackActionGoToArtist => 'Shkoni te Artisti';

  @override
  String trackActionDownloading(String name) {
    return 'Po shkarkohet $name...';
  }

  @override
  String get trackActionDeletedFile => 'Skedari i shkarkuar u fshi';

  @override
  String get trackActionDeleteFileFailed =>
      'Skedari i shkarkuar nuk mund të fshihej';

  @override
  String get shuffleBy => 'Përzierje By';

  @override
  String get shuffleSelectLibrary => 'Zgjidhni Bibliotekën';

  @override
  String get shuffleSelectGenre => 'Zgjidhni Zhanrin';

  @override
  String get shuffleLibrary => 'Biblioteka';

  @override
  String get shuffleGenre => 'Zhanri';

  @override
  String get shuffleNoLibraries => 'Nuk ka biblioteka të përputhshme.';

  @override
  String get shuffleNoGenres =>
      'Nuk u gjetën zhanre për këtë modalitet të përzier.';

  @override
  String get posterDisplayTitle => 'Ekrani';

  @override
  String get posterImageType => 'Lloji i imazhit';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Miniatura';

  @override
  String get imageTypeBanner => 'Baner';

  @override
  String get playlistAddFailed => 'Shtimi në listën e luajtjes dështoi';

  @override
  String get playlistCreateFailed => 'Krijimi i listës për luajtje dështoi';

  @override
  String get playlistNew => 'Lista e re e luajtjes';

  @override
  String get playlistCreate => 'Krijo';

  @override
  String get playlistCreateNew => 'Krijo listë të re dëgjimi';

  @override
  String get playlistNoneFound => 'Nuk u gjet asnjë listë për luajtje';

  @override
  String get addToPlaylist => 'Shto në listën e luajtjes';

  @override
  String get lyricsNotAvailable => 'Nuk ka tekste të disponueshme';

  @override
  String get upNext => 'Në vazhdim';

  @override
  String get playNext => 'Luaj Tjetra';

  @override
  String get stillWatchingContent =>
      'Riprodhimi është ndërprerë. A jeni ende duke parë?';

  @override
  String get stillWatchingStop => 'Ndalo';

  @override
  String get stillWatchingContinue => 'Vazhdoni';

  @override
  String skipSegment(String segment) {
    return 'Kapërce $segment';
  }

  @override
  String get liveTv => 'TV drejtpërdrejt';

  @override
  String get continueWatchingAndNextUp => 'Vazhdo të shikosh dhe më pas';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Po shkarkohet $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Po shkarkohet $fileName';
  }

  @override
  String get nextEpisode => 'Episodi i radhës';

  @override
  String get moreFromThisSeason => 'Më shumë nga ky sezon';

  @override
  String get playerTooltipPlaybackSpeed => 'Shpejtësia e riprodhimit';

  @override
  String get playerTooltipCastControls => 'Kontrollet e Cast';

  @override
  String get playerTooltipPlaybackQuality => 'Shpejtësia e biteve';

  @override
  String get playerTooltipEnterFullscreen => 'Hyni në ekran të plotë';

  @override
  String get playerTooltipExitFullscreen => 'Dilni nga ekrani i plotë';

  @override
  String get playerTooltipFloatOnTop => 'Notoni në krye';

  @override
  String get playerTooltipExitFloatOnTop => 'Çaktivizoni notimin në krye';

  @override
  String get playerTooltipLockLandscape => 'Peizazhi i bllokimit';

  @override
  String get playerTooltipUnlockOrientation => 'Lejo rrotullimin';

  @override
  String get playerTooltipPrevious => 'E mëparshmja';

  @override
  String get playerTooltipSeekBack => 'Kërkoni prapa';

  @override
  String get playerTooltipSeekForward => 'Kërkoni përpara';

  @override
  String get contextMenuMarkWatched => 'Shënoni si të shikuar';

  @override
  String get contextMenuMarkUnwatched => 'Shëno si të pashikuar';

  @override
  String get contextMenuAddToFavorites => 'Shto në të preferuarat';

  @override
  String get contextMenuRemoveFromFavorites => 'Hiq nga të preferuarat';

  @override
  String get contextMenuGoToSeries => 'Shkoni te Seria';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Fshih nga \"Vazhdo shikimin\"';

  @override
  String get contextMenuHideFromNextUp => 'Fshih nga \"Në vijim\"';

  @override
  String get contextMenuAddToCollection => 'Shto në koleksion';

  @override
  String get settingsAdministrationSubtitle =>
      'Hyni në panelin e administrimit të serverit';

  @override
  String get settingsAccountSecurity => 'Llogaria dhe siguria';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentifikimi, kodi PIN dhe kontrollet prindërore';

  @override
  String get settingsPersonalization => 'Personalizimi';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigimi, rreshtat kryesore dhe dukshmëria e bibliotekës';

  @override
  String get settingsDynamicContent => 'Përmbajtja dinamike';

  @override
  String get settingsDynamicContentSubtitle =>
      'Shiriti i medias dhe mbivendosja vizuale';

  @override
  String get settingsPlaybackSyncplay => 'Riprodhimi & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Cilësimet audio/video, titrat, shkarkimet dhe kontrollet e SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sinkronizimi i shtojcave, Seerr, vlerësimet dhe më shumë';

  @override
  String get settingsAboutSubtitle =>
      'Versioni i aplikacionit, informacioni ligjor dhe kreditet';

  @override
  String get settingsAuthenticationSection => 'AUTENTIKIMI';

  @override
  String get settingsSortServersBy => 'Rendit serverët sipas';

  @override
  String get settingsLastUsed => 'Përdorimi i fundit';

  @override
  String get settingsAlphabetical => 'Alfabetike';

  @override
  String get settingsConnectionSection => 'LIDHJA';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Lejo certifikatat e vetënënshkruara';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Beso serverët që përdorin certifikata TLS të vetënënshkruara ose me CA private. Aktivizoje vetëm për serverët që kontrollon vetë. Kjo çaktivizon vlerësimin e certifikatave për të gjitha lidhjet.';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACIA DHE SIGURIA';

  @override
  String get settingsBlockedRatings => 'Vlerësime të bllokuara';

  @override
  String get settingsGeneralStyle => 'Stili i Përgjithshëm';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Thekse temash, sfonde, tregues të shikuar dhe muzikë me temë';

  @override
  String get settingsDetailsScreen => 'Ekrani i detajeve';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Stili, turbullimi i sfondit dhe sjellja e skedave';

  @override
  String get settingsHomePage => 'Faqja kryesore';

  @override
  String get settingsHomePageSubtitle =>
      'Seksionet, llojet e imazheve, mbivendosjet dhe pamjet paraprake të mediave';

  @override
  String get settingsLibrariesSubtitle =>
      'Dukshmëria e bibliotekës, pamja e dosjeve dhe sjellja me shumë serverë';

  @override
  String get settingsTwentyFourHourClock => 'Ora 24-orëshe';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Përdorni formatimin e orës 24-orëshe kudo që të shfaqet ora';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Shfaq butonin e përzierjes në shiritin e navigimit';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Shfaq butonin e zhanreve në shiritin e navigimit';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Shfaq butonin e të preferuarave në shiritin e navigimit';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Shfaq butonin e bibliotekave në shiritin e navigimit';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Shfaq butonin Seerr në shiritin e navigimit';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Shfaq gjithmonë etiketat e tekstit në shiritin e sipërm të navigimit';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Ndrysho dukshmërinë e faqes kryesore për bibliotekë. Rinisni Moonfin që ndryshimet të hyjnë në fuqi.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Shiriti i medias dhe pamjet paraprake lokale';

  @override
  String get settingsVisualOverlays => 'Mbivendosjet vizuale';

  @override
  String get settingsSeasonalSurprise => 'Surpriza sezonale';

  @override
  String get settingsMetadataAndRatings => 'Meta të dhënat dhe vlerësimet';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase fuqizon integrimet nga ana e serverit, duke përfshirë burime vlerësimi shtesë, kërkesat e Seerr dhe preferencat e sinkronizuara.';

  @override
  String get settingsOfflineDownloads => 'Shkarkimet jashtë linje';

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
  String get settingsHigh => 'Lartë';

  @override
  String get settingsLow => 'E ulët';

  @override
  String get settingsCustomPath => 'Shtegu i personalizuar';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Futni rrugën e dosjes së shkarkimit';

  @override
  String get settingsConcurrentDownloads => 'Shkarkime të njëkohshme';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Numri maksimal i artikujve për t\'u shkarkuar menjëherë.';

  @override
  String get settingsAppInfo => 'INFO APP';

  @override
  String get settingsReportAnIssue => 'Raportoni një problem';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Hapni gjurmuesin e problemeve në GitHub';

  @override
  String get settingsJoinDiscord => 'Bashkohuni me Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Bisedoni me komunitetin';

  @override
  String get settingsJoinTheDiscord => 'Bashkohuni me Discord';

  @override
  String get settingsSupportMoonfin => 'Mbështet Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Dhuro një kafe për zhvilluesin';

  @override
  String get settingsLegal => 'LIGJORE';

  @override
  String get settingsLicenses => 'Licencat';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Njoftimet e licencës me burim të hapur';

  @override
  String get settingsPrivacyPolicy => 'Politika e privatësisë';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Si i trajton Moonfin të dhënat tuaja';

  @override
  String get settingsCheckForUpdates => 'Kontrolloni për përditësime';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Kontrolloni për versionin më të fundit të Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Mundësuar nga Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# njoftime licencash',
      one: '# njoftim licence',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'te dyja';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Përzierja e filtrit të llojit të përmbajtjes';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Preferencat e riprodhimit të videos';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Cilësimet kryesore të motorit të videos dhe transmetimit';

  @override
  String get settingsAudioPreferences => 'Preferencat audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Gjurmët audio, përpunimin dhe opsionet e kalimit';

  @override
  String get settingsAutomationAndQueue => 'Automatizimi & Radha';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Riprodhimi dhe renditja e automatizuar';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Cilësia e shkarkimit, kufijtë e ruajtjes dhe madhësia e radhës';

  @override
  String get settingsSyncplaySubtitle =>
      'Logjika e sinkronizimit për seancat në grup';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Karakteristikat e specializuara të luajtësit. Përdoreni me kujdes, pasi disa opsione mund të shkaktojnë probleme me riprodhimin';

  @override
  String get settingsSkipIntrosAndOutros => 'Të kapërcehen hyrjet dhe daljet?';

  @override
  String get settingsMediaSegmentCountdown =>
      'Numërimi mbrapsht i segmentit të medias';

  @override
  String get settingsProgressBar => 'Shiriti i progresit';

  @override
  String get settingsTimer => 'Kohëmatësi';

  @override
  String get settingsNone => 'Asnjë';

  @override
  String get settingsPromptUser => 'Përdoruesi i shpejtë';

  @override
  String get settingsSkip => 'Kapërce';

  @override
  String get settingsDoNothing => 'Mos bëni asgjë';

  @override
  String get settingsMaxBitrateDescription =>
      'Mbulo shpejtësinë e transmetimit. Përmbajtja mbi këtë prag do të transkodohet për t\'u përshtatur.';

  @override
  String get settingsMaxResolutionDescription =>
      'Kufizoni rezolucionin maksimal që do të kërkojë lojtari. Përmbajtja me rezolucion më të lartë do të transkodohet.';

  @override
  String get settingsPlayerZoomDescription =>
      'Si duhet të shkallëzohet video për t\'iu përshtatur ekranit.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Motorri i luajtjes (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Zgjidhni motorin e parazgjedhur të riprodhimit në pajisjet Android TV. Ndryshimet zbatohen në seancën tjetër të riprodhimit.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (rekomandohet)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (i vjetër)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (trashëgimia)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (rekomandohet)';

  @override
  String get settingsDolbyVisionFallback => 'Rikthim i Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Sjellja për titujt Dolby Vision në pajisjet pa dekodim Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Pyetni çdo herë';

  @override
  String get settingsPreferHdr10Fallback => 'Preferoni kthimin HDR10';

  @override
  String get settingsPreferServerTranscode => 'Preferoni transkodin e serverit';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 Luaj direkt';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Kontrollon nëse transmetimet e nivelit të përmirësimit të profilit Dolby Vision 7 duhet të drejtojnë luajtjen.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFTKRT i aktivizuar)';

  @override
  String get settingsEnabledOnThisDevice => 'Aktivizuar në këtë pajisje';

  @override
  String get settingsDisabledPreferTranscode =>
      'I çaktivizuar (preferohet transkodi)';

  @override
  String get settingsResumeRewindDescription =>
      'Kur rifilloni riprodhimin (nga Vazhdo shikimin ose një faqe e artikullit mediatik), sa sekonda duhet të rikthehen?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Kur rifilloni riprodhimin pas shtypjes së butonit të pauzës, sa sekonda duhet të kthehen?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Sa sekonda për të kërcyer mbrapa pasi të keni shtypur butonin e kthimit prapa.';

  @override
  String get settingsOneSecond => '1 sekondë';

  @override
  String get settingsThreeSeconds => '3 sekonda';

  @override
  String get settingsFortyFiveSeconds => '45 sekonda';

  @override
  String get settingsSixtySeconds => '60 sekonda';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Sa sekonda për të kërcyer përpara pasi të keni shtypur butonin e shpejtë përpara.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 në dekoder të jashtëm';

  @override
  String get settingsCinemaMode => 'Modaliteti i kinemasë';

  @override
  String get settingsCinemaModeSubtitle =>
      'Luaj trailers/prorolla para një veçorie kryesore';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended tregon një kartë të plotë me vepra arti dhe përshkrim të episodit. Minimali tregon një mbivendosje kompakte të numërimit mbrapsht. Çaktivizuar fsheh plotësisht kërkesën.';

  @override
  String get settingsShort => 'E shkurtër';

  @override
  String get settingsLong => 'E gjatë';

  @override
  String get settingsVeryLong => 'Shumë e gjatë';

  @override
  String get settingsVideoStartDelay => 'Vonesa e fillimit të videos';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Direkt TV drejtpërdrejt';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Aktivizo luajtjen e drejtpërdrejtë për TV drejtpërdrejt';

  @override
  String get settingsOpenGroups => 'Hap Grupet';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Krijoni, bashkohuni ose menaxhoni grupet e SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay u aktivizua';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Aktivizo veçoritë e shikimit në grup';

  @override
  String get settingsSyncplayButton => 'Butoni SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Shfaq butonin SyncPlay në shiritin e navigimit';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Korrigjim i avancuar';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Aktivizo logjikën e sinkronizimit të imët';

  @override
  String get settingsSyncplaySyncCorrection => 'Korrigjimi i sinkronizimit';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Rregullo automatikisht riprodhimin për të qëndruar në sinkron';

  @override
  String get settingsSyncplaySpeedToSync => 'Shpejtësia për të sinkronizuar';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Përdorni rregullimin e shpejtësisë së luajtjes për të sinkronizuar';

  @override
  String get settingsSyncplaySkipToSync => 'Kalo te \"Sinkronizimi\".';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Përdorni kërkimin për të sinkronizuar';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Vonesa minimale e shpejtësisë';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Vonesa e shpejtësisë maksimale';

  @override
  String get settingsSyncplaySpeedDuration => 'Kohëzgjatja e shpejtësisë';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Vonesa minimale e kapërcimit';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Kompensim shtesë';

  @override
  String get onNow => 'Në Tani';

  @override
  String get collections => 'Koleksionet';

  @override
  String get lastPlayed => 'Luajtur së fundi';

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
    return '$libraryName të publikuara së fundmi';
  }

  @override
  String get autoplayNextEpisode => 'Luaj automatikisht episodin tjetër';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Luaj automatikisht episodin tjetër kur është i disponueshëm.';

  @override
  String get skipSilenceTitle => 'Kapërce heshtjen';

  @override
  String get skipSilenceSubtitle =>
      'Kapërce automatikisht segmentet e heshtura audio kur mbështeten nga transmetimi.';

  @override
  String get allowExternalAudioEffectsTitle => 'Lejo efektet e jashtme audio';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Lejo aplikacionet e ekualizuesit dhe efekteve (p.sh. Wavelet) të lidhen me sesionet e luajtjes Media3.';

  @override
  String get disableTunnelingTitle => 'Çaktivizo tunelizimin';

  @override
  String get disableTunnelingSubtitle =>
      'Detyro luajtjen pa tunelizim. E dobishme në pajisje me shkëputje audio/video gjatë tunelizimit.';

  @override
  String get enableTunnelingTitle => 'Aktivizo tunelizimin';

  @override
  String get enableTunnelingSubtitle =>
      'I avancuar. Kalon audion dhe videon përmes një shtegu harduerik të bashkuar. I çaktivizuar si parazgjedhje sepse shkakton ndërprerje audio/video në disa pajisje.';

  @override
  String get mapDolbyVisionP7Title =>
      'Harto profilin 7 të Dolby Vision në HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Luaj transmetimet e profilit 7 të Dolby Vision si HEVC të pajtueshëm me HDR10 në pajisjet jo-DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Përdor stilet e integruara të titrave';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Zbato ngjyrat, fontet dhe pozicionimin e integruar në pistën e titrave. Çaktivizoje për të përdorur preferencat e tua të stilit të titrave.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Përdor madhësitë e integruara të fontit të titrave';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Zbato sugjerimet e madhësisë së fontit të integruara në pistën e titrave. Çaktivizoje për të përdorur madhësinë e titrave nga preferencat e tua të stilit.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Shfaq detajet e medias';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Shfaq detajet e artikullit të zgjedhur në krye të faqeve të Bibliotekës.';

  @override
  String get hideBackdropsInLibraries => 'Të fshihen sfondet gjatë shfletimit?';

  @override
  String get useDetailedSubHeadings => 'Përdor nëntituj të detajuar';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Shfaq nënrresht të detajuar ose minimal në faqet e Bibliotekës.';

  @override
  String get savedThemesDeleteDialogTitle => 'Të fshihet tema e ruajtur?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Të hiqet \"$themeName\" nga memoria e fshehtë e kësaj pajisjeje?';
  }

  @override
  String get themeStore => 'Dyqani i temave';

  @override
  String get themeStoreSubtitle => 'Shfleto dhe ruaj temat e komunitetit';

  @override
  String get themeStoreDescription =>
      'Ruaj një temë për ta përdorur si temat e tua të tjera të ruajtura.';

  @override
  String get themeStoreEmpty => 'Për momentin nuk ofrohet asnjë temë.';

  @override
  String get themeStoreLoadFailed =>
      'Dyqani i temave nuk u ngarkua dot. Kontrollo lidhjen dhe provo sërish.';

  @override
  String get themeStoreSave => 'Ruaj';

  @override
  String get themeStoreSaveAndApply => 'Ruaj dhe zbato';

  @override
  String get themeStoreSaved => 'U ruajt';

  @override
  String get themeStoreInvalidMessage => 'Kjo temë nuk u ngarkua dot.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" u ruajt.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" u fshi nga kjo pajisje.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" nuk u fshi dot.';
  }

  @override
  String get savedThemesTitle => 'Temat e ruajtura';

  @override
  String get savedThemesDescription =>
      'Këto janë tema të shkarkuara nga shtojca Moonfin për serverin aktual. Fshirja heq vetëm këtë kopje lokale.';

  @override
  String get savedThemesEmpty =>
      'Nuk u gjet asnjë temë e ruajtur për këtë server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Aktualisht aktive';
  }

  @override
  String get savedThemesDeleteTooltip => 'Fshi temën e ruajtur';

  @override
  String get savedThemesManageSubtitle =>
      'Menaxho temat e shkarkuara të shtojcës në këtë pajisje';

  @override
  String get themeEditor => 'Redaktuesi i temave';

  @override
  String get themeEditorSubtitle =>
      'Hap Redaktuesin e temave të Moonfin në shfletuesin tuaj';

  @override
  String get homeScreen => 'Ekrani kryesor';

  @override
  String get bottomBar => 'Shiriti i poshtëm';

  @override
  String get homeRowsStyleClassic => 'Klasik';

  @override
  String get homeRowsStyleModern => 'Moderne';

  @override
  String get homeRowsSection => 'Rreshtat e kreut';

  @override
  String get homeRowDisplay => 'Shfaqja e rreshtave të kreut';

  @override
  String get homeRowSections => 'Seksionet e rreshtave të kreut';

  @override
  String get homeRowToggles => 'Çelësat e rreshtave të kreut';

  @override
  String get homeRowTogglesSubtitle =>
      'Aktivizo ose çaktivizo kategoritë e rreshtave të kreut të bazuara në bibliotekë';

  @override
  String get homeRowTogglesDescription =>
      'Aktivizo çelësat e mëposhtëm për të shfaqur rreshtat në Seksionet e kreut.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klasik ruan llojin e imazhit për çdo rresht dhe mbishtresën e informacionit. Moderne përdor rreshta nga portreti te sfondi.';

  @override
  String get displayFavoritesRows => 'Shfaq rreshtat e të preferuarave';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Shfaq Filmat e preferuar, Serialet dhe rreshta të tjerë të preferuar në Seksionet e kreut.';

  @override
  String get favoritesRowSorting => 'Renditja e rreshtit të të preferuarave';

  @override
  String get favoritesRowSortingDescription =>
      'Rendit rreshtat e të preferuarave sipas datës së shtimit, datës së publikimit, alfabetit dhe më shumë.';

  @override
  String get displayCollectionsRows => 'Shfaq rreshtat e koleksioneve';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Shfaq rreshtat e Koleksioneve në Seksionet e kreut.';

  @override
  String get collectionsRowSorting => 'Renditja e rreshtit të koleksioneve';

  @override
  String get collectionsRowSortingDescription =>
      'Rendit rreshtat e Koleksioneve sipas datës së shtimit, datës së publikimit, alfabetit dhe më shumë.';

  @override
  String get displayGenresRows => 'Shfaq rreshtat e zhanreve';

  @override
  String get displayGenresRowsSubtitle =>
      'Shfaq rreshtat e Zhanreve në Seksionet e kreut.';

  @override
  String get genresRowSorting => 'Renditja e rreshtit të zhanreve';

  @override
  String get genresRowSortingDescription =>
      'Rendit rreshtat e Zhanreve sipas datës së shtimit, datës së publikimit, alfabetit dhe më shumë.';

  @override
  String get genresRowItems => 'Artikujt e rreshtit të zhanreve';

  @override
  String get genresRowItemsDescription =>
      'Shfaq Filma, Seriale ose të dyja në rreshtat e Zhanreve.';

  @override
  String get displayPlaylistsRows => 'Shfaq rreshtat e listave të luajtjes';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Shfaq rreshtat e Listave të luajtjes në Seksionet e kreut.';

  @override
  String get playlistsRowSorting =>
      'Renditja e rreshtit të listave të luajtjes';

  @override
  String get playlistsRowSortingDescription =>
      'Rendit rreshtat e Listave të luajtjes sipas datës së shtimit, datës së publikimit, alfabetit dhe më shumë.';

  @override
  String get displayAudioRows => 'Shfaq rreshtat audio';

  @override
  String get displayAudioRowsSubtitle =>
      'Shfaq rreshtat Audio në Seksionet e kreut.';

  @override
  String get audioRowsSorting => 'Renditja e rreshtave audio';

  @override
  String get audioRowsSortingDescription =>
      'Rendit rreshtat audio sipas datës së shtimit, datës së publikimit, alfabetit dhe më shumë.';

  @override
  String get audioPlaylists => 'Listat e luajtjes audio';

  @override
  String get appearance => 'Pamja';

  @override
  String get layout => 'Paraqitja';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Tastiera';

  @override
  String get navButtons => 'Butonat';

  @override
  String get rendering => 'Renderimi';

  @override
  String get mpvConfiguration => 'Konfigurimi i MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Aplikacioni i luajtësit të jashtëm';

  @override
  String get externalPlayerAppDescription =>
      'Cakto luajtësin e jashtëm për të aktivizuar opsionin e luajtjes me shtypje të gjatë';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Shfaq zgjedhësin e aplikacioneve kur fillon luajtja.';

  @override
  String get loadingInstalledPlayers => 'Po ngarkohen luajtësit e instaluar...';

  @override
  String get connection => 'Lidhja';

  @override
  String get audioTranscodeTarget => 'Formati i synuar i transkodimit audio';

  @override
  String get passthrough => 'Kalim i drejtpërdrejtë';

  @override
  String get supportedOnThisDevice => 'Mbështetet në këtë pajisje';

  @override
  String get notSupportedOnThisDevice => 'Nuk mbështetet në këtë pajisje';

  @override
  String get settingsAudioDtsXPassthrough =>
      'Kalim i drejtpërdrejtë DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Dërgo bitstream DTS:X (DTS UHD) te dekoduesi i jashtëm.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Kalim i drejtpërdrejtë TrueHD me Atmos (JOC)';

  @override
  String get mediaPlayerBehavior => 'Sjellja e luajtësit të medias';

  @override
  String get playbackEnhancements => 'Përmirësimet e luajtjes';

  @override
  String get alwaysOn => 'Gjithmonë aktiv.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Zëvendëso \"Kapërce fundin\" me shfaqjen \"Në vijim\"';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Shfaq mbishtresën \"Në vijim\" në vend të butonit \"Kapërce fundin\".';

  @override
  String get playerRouting => 'Drejtimi i luajtësit';

  @override
  String get preferSoftwareDecoders => 'Parapëlqe dekoduesit softuerikë';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Përdor FFmpeg (audio) dhe libgav1 (AV1) para dekoduesve harduerikë. Çaktivizoje nëse kalimi i drejtpërdrejtë i audios HDMI prishet.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Hap luajtjen e videos në aplikacionin e jashtëm të zgjedhur në Android TV.';

  @override
  String get automaticQueuing => 'Radhitja automatike';

  @override
  String get preferSdhSubtitles => 'Parapëlqe titrat SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Jepu përparësi pistave të titrave SDH/CC gjatë zgjedhjes automatike.';

  @override
  String get webDiagnostics => 'Diagnostikimi i uebit';

  @override
  String get webDiagnosticsTitle => 'Diagnostikimi i uebit të Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Përdore këtë faqe për të diagnostikuar problemet e lidhjes së shfletuesit (CORS, përmbajtje e përzier dhe cilësimet e zbulimit).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'U zbulua dështim për shkak të përmbajtjes së përzier';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'U zbulua dështim CORS/Preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin zbuloi një faqe HTTPS që po përpiqet të thërrasë një URL serveri HTTP. Shfletuesit e bllokojnë këtë kërkesë para se të arrijë te serveri juaj.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin zbuloi një dështim kërkese në nivel shfletuesi, që zakonisht shkaktohet nga mungesa e kokave CORS ose preflight në serverin e medias.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL-ja e synuar: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detaji: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Konteksti aktual i ekzekutimit';

  @override
  String get webDiagnosticsOrigin => 'Origjina';

  @override
  String get webDiagnosticsScheme => 'Skema';

  @override
  String get webDiagnosticsPluginMode => 'Modaliteti i shtojcës';

  @override
  String get webDiagnosticsWebRtcScan => 'Skanimi WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL-ja e detyruar e serverit';

  @override
  String get webDiagnosticsDefaultServerUrl =>
      'URL-ja e parazgjedhur e serverit';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL-ja e proxy-t të zbulimit';

  @override
  String get notConfigured => 'nuk është konfiguruar';

  @override
  String get webDiagnosticsMixedContent => 'Përmbajtje e përzier';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Kjo faqe është ngarkuar përmes HTTPS, por një ose më shumë URL të konfiguruara janë HTTP. Shfletuesit i bllokojnë faqet HTTPS që thërrasin API HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Zgjidhja: shërbeje serverin e medias ose pikëmbarimin e proxy-t përmes HTTPS, ose ngarkoje Moonfin përmes HTTP vetëm në rrjete lokale të besuara.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Nuk u zbulua asnjë konfigurim i dukshëm me përmbajtje të përzier nga cilësimet aktuale të ekzekutimit.';

  @override
  String get webDiagnosticsCorsChecklist => 'Lista e kontrollit CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Lejo origjinën e shfletuesit në Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Përfshi Authorization, X-Emby-Authorization dhe X-Emby-Token në Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Ekspozo Content-Range dhe Accept-Ranges për transmetimin dhe sjelljen e lëvizjes.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Kthe 204 për kërkesat preflight OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Shembull fragmenti kokash (stil nginx)';

  @override
  String get note => 'Shënim';

  @override
  String get webDiagnosticsNonWebNote =>
      'Kjo rrugë diagnostikimi është menduar për ndërtimet e uebit. Nëse po e shihni në një platformë tjetër, këto kontrolle mund të mos zbatohen.';

  @override
  String get backToServerSelect => 'Kthehu te zgjedhja e serverit';

  @override
  String get signOutAllUsers => 'Dil nga të gjithë përdoruesit';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Leja e mikrofonit është refuzuar përgjithmonë. Aktivizoje te cilësimet e sistemit.';

  @override
  String get voiceSearchPermissionRequired =>
      'Leja e mikrofonit kërkohet për kërkimin me zë.';

  @override
  String get voiceSearchNoMatch => 'Nuk u kuptua. Provo sërish.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nuk u zbulua asnjë e folur.';

  @override
  String get voiceSearchMicrophoneError => 'Gabim i mikrofonit.';

  @override
  String get voiceSearchNeedsInternet =>
      'Kërkimi me zë ka nevojë për internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Shërbimi i zërit është i zënë. Provo sërish.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Leja e mikrofonit është refuzuar përgjithmonë.';

  @override
  String get microphonePermissionDenied => 'Leja e mikrofonit është refuzuar.';

  @override
  String get speechRecognitionUnavailable =>
      'Njohja e të folurit nuk ofrohet në këtë pajisje.';

  @override
  String get openIosRoutePicker => 'Hap zgjedhësin e rrugëve të iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Zgjedhësi i rrugëve AirPlay nuk ofrohet në këtë pajisje.';

  @override
  String get videos => 'Video';

  @override
  String get programs => 'Programet';

  @override
  String get songs => 'Këngët';

  @override
  String get photoAlbums => 'Albumet e fotove';

  @override
  String get photos => 'Fotot';

  @override
  String get people => 'Personat';

  @override
  String get recentlyReleasedEpisodes => 'Episodet e publikuara së fundmi';

  @override
  String get watchAgain => 'Shiko sërish';

  @override
  String get guestAppearances => 'Paraqitje si i ftuar';

  @override
  String get appearancesSeerr => 'Paraqitjet (Seerr)';

  @override
  String get crewContributionsSeerr => 'Kontributet e ekipit (Seerr)';

  @override
  String get watchWithGroup => 'Shiko me grupin';

  @override
  String get errors => 'Gabimet';

  @override
  String get warnings => 'Paralajmërimet';

  @override
  String get disk => 'Disku';

  @override
  String get openInBrowser => 'Hap në shfletues';

  @override
  String get embeddedBrowserNotAvailable =>
      'Shfletuesi i integruar nuk ofrohet në këtë platformë.';

  @override
  String get adminRestartServerConfirmation =>
      'Jeni i sigurt që doni ta rinisni serverin?';

  @override
  String get adminShutdownServerConfirmation =>
      'Jeni i sigurt që doni ta fikni serverin? Do t\'ju duhet ta rinisni manualisht.';

  @override
  String get internal => 'I brendshëm';

  @override
  String get idle => 'Në pritje';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nuk u gjet asnjë përdorues';

  @override
  String get adminNoUsersMatchSearch =>
      'Asnjë përdorues nuk përputhet me kërkimin tuaj';

  @override
  String get adminNoDevicesFound => 'Nuk u gjet asnjë pajisje';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Asnjë pajisje nuk përputhet me filtrat aktualë';

  @override
  String get passwordSet => 'Fjalëkalimi u caktua';

  @override
  String get noPasswordConfigured => 'Nuk është konfiguruar asnjë fjalëkalim';

  @override
  String get remoteAccess => 'Akses në largësi';

  @override
  String get localOnly => 'Vetëm lokal';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Ngarkimi i analitikës së medias dështoi';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Analitikë e kombinuar për të gjitha bibliotekat e medias.';

  @override
  String get analyticsTopArtists => 'Artistët kryesorë';

  @override
  String get analyticsTopAuthors => 'Autorët kryesorë';

  @override
  String get analyticsTopContributors => 'Kontribuuesit kryesorë';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Biblioteka',
      one: '1 Bibliotekë',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Ende nuk ofrohen totale të medias së indeksuar për këtë përzgjedhje.';

  @override
  String get analyticsLibraryDetails => 'Detajet e bibliotekës';

  @override
  String get analyticsLibraryBreakdown => 'Ndarja e bibliotekës';

  @override
  String get analyticsNoLibrariesAvailable => 'Nuk ofrohet asnjë bibliotekë.';

  @override
  String get adminServerAdministrationTitle => 'Administrimi i serverit';

  @override
  String get adminServerPathData => 'Të dhënat';

  @override
  String get adminServerPathImageCache => 'Memoria e fshehtë e imazheve';

  @override
  String get adminServerPathCache => 'Memoria e fshehtë';

  @override
  String get adminServerPathLogs => 'Regjistrat';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Transkodimi';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Ky server nuk ktheu asnjë shteg serveri.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% të përdorura';
  }

  @override
  String get userActivity => 'Aktiviteti i përdoruesve';

  @override
  String get systemEvents => 'Ngjarjet e sistemit';

  @override
  String get needsAttention => 'Kërkon vëmendje';

  @override
  String get adminDrawerSectionServer => 'Serveri';

  @override
  String get adminDrawerSectionPlayback => 'Luajtja';

  @override
  String get adminDrawerSectionDevices => 'Pajisjet';

  @override
  String get adminDrawerSectionAdvanced => 'Të avancuara';

  @override
  String get adminDrawerSectionPlugins => 'Shtojcat';

  @override
  String get adminDrawerSectionLiveTv => 'TV drejtpërdrejt';

  @override
  String get homeVideos => 'Video shtëpiake';

  @override
  String get mixedContent => 'Përmbajtje e përzier';

  @override
  String get homeVideosAndPhotos => 'Video dhe foto shtëpiake';

  @override
  String get mixedMoviesAndShows => 'Filma dhe seriale të përzier';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nuk u gjet asnjë regjistrim';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Nuk u gjet asnjë faqe imazhi brenda arkivit .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Renderuesi i integruar dështoi ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Renderuesi EPUB dështoi ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Mungon skedari lokal për lexuesin: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status gjatë hapjes së të dhënave të librit nga $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nuk ofrohet asnjë pikëmbarim i lexueshëm libri';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Format arkivi komiku i pambështetur: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Shtojca e nxjerrjes CBR nuk ofrohet në këtë platformë.';

  @override
  String get failedToExtractCbrArchive => 'Nxjerrja e arkivit .cbr dështoi.';

  @override
  String get cb7ExtractionUnavailable =>
      'Nxjerrja CB7 nuk ofrohet në këtë platformë.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Shtojca e nxjerrjes CB7 nuk ofrohet në këtë platformë.';

  @override
  String get closeGenrePanel => 'Mbyll panelin e zhanreve';

  @override
  String get loadingShuffle => 'Po ngarkohet luajtja rastësore...';

  @override
  String get libraryShuffleLabel => 'LUAJTJE RASTËSORE E BIBLIOTEKËS';

  @override
  String get randomShuffleLabel => 'LUAJTJE RASTËSORE';

  @override
  String get genresShuffleLabel => 'LUAJTJE RASTËSORE E ZHANREVE';

  @override
  String get autoHdrSwitching => 'Ndërrimi automatik i HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Aktivizo automatikisht HDR për luajtjen e videove HDR dhe rikthe modalitetin e ekranit në dalje.';

  @override
  String get whenFullscreen => 'Kur është në ekran të plotë';

  @override
  String get changeArtwork => 'Ndrysho grafikën';

  @override
  String get missing => 'Mungon';

  @override
  String get transcodingLimits => 'Kufijtë e transkodimit';

  @override
  String get clearAllArtworkButton => 'Të pastrohen të gjitha grafikat?';

  @override
  String get clearAllArtworkWarning =>
      'Jeni i sigurt që doni të pastroni të gjitha grafikat e shkarkuara?';

  @override
  String get confirmClear => 'Konfirmo pastrimin';

  @override
  String confirmClearMessage(String itemType) {
    return 'Jeni i sigurt që doni ta pastroni këtë $itemType?';
  }

  @override
  String get uploadButton => 'Të ngarkohet?';

  @override
  String get resolutionLabel => 'Rezolucioni: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Shfaq grafikat vetëm në gjuhën e ndërfaqes';

  @override
  String get confirmClearAll => 'Konfirmo pastrimin e të gjithave';

  @override
  String get imageUploadSuccess => 'Imazhi u ngarkua me sukses!';

  @override
  String imageUploadFailed(String error) {
    return 'Ngarkimi i imazhit dështoi: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Caktimi i imazhit dështoi: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Fshirja e imazhit dështoi: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Pastrimi i të gjitha grafikave dështoi: $error';
  }

  @override
  String get yes => 'Po';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Sfonde';

  @override
  String get bannerCategory => 'Baner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniaturë';

  @override
  String get artCategory => 'Grafikë';

  @override
  String get discArtCategory => 'Grafika e diskut';

  @override
  String get screenshotCategory => 'Pamje ekrani';

  @override
  String get boxCoverCategory => 'Kapaku i kutisë';

  @override
  String get boxRearCoverCategory => 'Kapaku i pasmë i kutisë';

  @override
  String get menuArtCategory => 'Grafika e menysë';

  @override
  String get confirmItemPoster => 'poster';

  @override
  String get confirmItemBackdrop => 'sfond';

  @override
  String get confirmItemBanner => 'baner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniaturë';

  @override
  String get confirmItemArt => 'grafikë';

  @override
  String get confirmItemDiscArt => 'grafikë disku';

  @override
  String get confirmItemScreenshot => 'pamje ekrani';

  @override
  String get confirmItemBoxCover => 'kapak kutie';

  @override
  String get confirmItemBoxRearCover => 'kapak i pasmë kutie';

  @override
  String get confirmItemMenuArt => 'grafikë menyje';

  @override
  String get resolutionAll => 'Të gjitha';

  @override
  String get resolutionHigh => 'E lartë (1080p+)';

  @override
  String get resolutionMedium => 'Mesatare (720p)';

  @override
  String get resolutionLow => 'E ulët (<720p)';

  @override
  String get sources => 'Burimet';

  @override
  String get audiobookChapters => 'Kapitujt';

  @override
  String get audiobookBookmarks => 'Faqeshënuesit';

  @override
  String get audiobookNotes => 'Shënimet';

  @override
  String get audiobookQueue => 'Radha';

  @override
  String get audiobookTimeline => 'Vija kohore';

  @override
  String get audiobookTimelineEmpty => 'Vija kohore është bosh';

  @override
  String get audiobookWholeBook => 'I gjithë libri';

  @override
  String get audiobookFocusedTimeline => 'Vija kohore e fokusuar';

  @override
  String get audiobookExportBookmarks => 'Eksporto faqeshënuesit';

  @override
  String get audiobookExportNotes => 'Eksporto shënimet';

  @override
  String get audiobookExportAll => 'Eksporto të gjitha';

  @override
  String audiobookExportSuccess(String path) {
    return 'U eksportua te $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Eksportimi dështoi: $error';
  }

  @override
  String get audiobookLyrics => 'Tekstet';

  @override
  String get audiobookAddBookmark => 'Shto faqeshënues';

  @override
  String get audiobookAddNote => 'Shto shënim';

  @override
  String get audiobookEditNote => 'Redakto shënimin';

  @override
  String get audiobookNoteHint => 'Shkruaj një shënim për këtë moment';

  @override
  String get audiobookSleepTimer => 'Kohëmatësi i gjumit';

  @override
  String get audiobookSleepOff => 'Fikur';

  @override
  String get audiobookSleepEndOfChapter => 'Fundi i kapitullit';

  @override
  String get audiobookSleepCustom => 'I personalizuar';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining të mbetura';
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
  String get audiobookPlaybackSpeed => 'Shpejtësia e luajtjes';

  @override
  String get audiobookRemainingTime => 'Të mbetura';

  @override
  String get audiobookElapsedTime => 'Të kaluara';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Prapa ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Përpara ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Kapitulli i mëparshëm';

  @override
  String get audiobookNextChapter => 'Kapitulli tjetër';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Kapitulli $current nga $total';
  }

  @override
  String get audiobookNoChapters => 'Pa kapituj';

  @override
  String get audiobookNoBookmarks => 'Ende pa faqeshënues';

  @override
  String get audiobookNoNotes => 'Ende pa shënime';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Faqeshënuesi u shtua te $position';
  }

  @override
  String get audiobookSpeedReset => 'Rivendos në 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Ruaj';

  @override
  String get audiobookCancel => 'Anulo';

  @override
  String get audiobookDelete => 'Fshi';

  @override
  String get subtitlePreferences => 'Preferencat e titrave';

  @override
  String get subtitlePreferencesDescription =>
      'Ndrysho modalitetet e titrave, gjuhët e parazgjedhura, pamjen dhe opsionet e renderimit.';

  @override
  String get subtitleRendering => 'Renderimi i titrave';

  @override
  String get displayOptions => 'Opsionet e shfaqjes';

  @override
  String get releaseDateAscending => 'Data e publikimit (Në rritje)';

  @override
  String get releaseDateDescending => 'Data e publikimit (Në zbritje)';

  @override
  String get groupContributions => 'Grupo kontributet';

  @override
  String get groupMultipleRoles => 'Grupo rolet e shumta';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Paralajmërim për aksesin e shkrimit në bibliotekë';

  @override
  String get libraryWriteAccessHowToFix => 'Si ta rregulloni këtë:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Jepini leje shkrimi përdoruesit të shërbimit Jellyfin (p.sh. jellyfin ose PUID/PGID i Docker) për dosjet e bibliotekës suaj të medias në server.\n\n2. Ose shkoni te Paneli i Jellyfin -> Bibliotekat, redaktoni këtë bibliotekë dhe çaktivizoni \'Ruaj grafikat në dosjet e medias\' për t\'i ruajtur grafikat në bazën e brendshme të të dhënave të Jellyfin.';

  @override
  String get dismiss => 'Mbyll';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Biblioteka juaj \'$libraryName\' është konfiguruar t\'i ruajë grafikat drejtpërdrejt në dosjet e medias (\'Ruaj grafikat në dosjet e medias\' është aktiv). Megjithatë, Jellyfin testoi aksesin e shkrimit dhe nuk ka leje të shkruajë skedarë në këtë direktori:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Duket se Jellyfin nuk arriti t\'i përditësojë grafikat. Biblioteka juaj është konfiguruar t\'i ruajë grafikat drejtpërdrejt në dosjet e medias (\'Ruaj grafikat në dosjet e medias\' është aktiv). Ky gabim zakonisht ndodh kur procesi i serverit Jellyfin nuk ka leje të shkruajë skedarë në direktoritë tuaja të medias.';

  @override
  String get externalLists => 'Lista të jashtme';

  @override
  String get replay => 'Luaj sërish';

  @override
  String get fileInformation => 'Informacioni i skedarit';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Madhësia: $size  •  Formati: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Shfaq të gjitha ($count) pistat audio';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Shfaq të gjitha ($count) pistat e titrave';
  }

  @override
  String get checkingDirectPlay =>
      'Po kontrollohet aftësia e luajtjes së drejtpërdrejtë...';

  @override
  String get directPlayCapabilityLabel =>
      'Aftësia e luajtjes së drejtpërdrejtë: ';

  @override
  String get forced => 'Të detyruara';

  @override
  String get transcodeContainerNotSupported =>
      'Formati i kontejnerit nuk mbështetet nga luajtësi.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Kodeku i videos nuk mbështetet.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Kodeku i audios nuk mbështetet.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Formati i titrave nuk mbështetet (kërkon djegie mbi video).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Profili i audios nuk mbështetet.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Profili i videos nuk mbështetet.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Niveli i videos nuk mbështetet.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Rezolucioni i videos nuk mbështetet nga kjo pajisje.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Thellësia e bitit të videos nuk mbështetet.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Shpejtësia e kuadrove të videos nuk mbështetet.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Bitrate-i i skedarit e tejkalon kufirin e transmetimit të luajtësit.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Bitrate-i i videos e tejkalon kufirin e transmetimit.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Bitrate-i i audios e tejkalon kufirin e transmetimit.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Numri i kanaleve audio nuk mbështetet.';

  @override
  String get sortAlphabetical => 'Alfabetike';

  @override
  String get sortReleaseAscending => 'Renditja e publikimit (Në rritje)';

  @override
  String get sortReleaseDescending => 'Renditja e publikimit (Në zbritje)';

  @override
  String get sortCustomDragDrop => 'E personalizuar (Tërhiq dhe lësho)';

  @override
  String get playlistSortOptions =>
      'Opsionet e renditjes së listës së luajtjes';

  @override
  String get resetSort => 'Rivendos renditjen';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Shiko sërish S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Shiko sërish listën e luajtjes';

  @override
  String get noSubtitlesFound => 'Nuk u gjet asnjë titër.';

  @override
  String get adminControls => 'Kontrollet e administratorit';

  @override
  String get impellerRendering => 'Motori i renderimit (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller është renderuesi modern i GPU-së i Flutter për animacione më të buta dhe më pak ndërprerje. Në disa TV box dhe GPU të vjetra mund të shkaktojë defekte ose video të zezë; çaktivizoje nëse i vëren. Automatik zgjedh parazgjedhjen më të mirë për pajisjen tuaj. Rinis Moonfin për ta zbatuar.';

  @override
  String get impellerAuto => 'Automatik';

  @override
  String get impellerOn => 'Ndezur';

  @override
  String get impellerOff => 'Fikur';

  @override
  String get impellerRestartTitle => 'Kërkohet rinisje';

  @override
  String get impellerRestartMessage =>
      'Moonfin duhet të rinisë për të ndryshuar motorin e renderimit. Mbylle aplikacionin tani, pastaj hape sërish për ta zbatuar.';

  @override
  String get impellerCloseNow => 'Mbyll aplikacionin tani';

  @override
  String get adminRefreshLibrary => 'Rifresko bibliotekën';

  @override
  String get adminRefreshAllLibraries => 'Rifresko të gjitha bibliotekat';

  @override
  String get adminRepoSortDateOldest =>
      'Data e shtimit (Më të vjetrat në fillim)';

  @override
  String get adminRepoSortDateNewest =>
      'Data e shtimit (Më të rejat në fillim)';

  @override
  String get adminRepoSortNameAsc => 'Alfabetike (A deri Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabetike (Z deri A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Po ngarkohet analitika e serverit... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Përputh me burimin';

  @override
  String get imdbTop250Movies => '250 filmat më të mirë në IMDb';

  @override
  String get imdbTop250TvShows => '250 serialet më të mira në IMDb';

  @override
  String get imdbMostPopularMovies => 'Filmat më popullorë në IMDb';

  @override
  String get imdbMostPopularTvShows => 'Serialet më popullore në IMDb';

  @override
  String get imdbLowestRatedMovies => 'Filmat me vlerësimin më të ulët në IMDb';

  @override
  String get imdbTopEnglishMovies => 'Filmat anglisht më të vlerësuar në IMDb';
}
