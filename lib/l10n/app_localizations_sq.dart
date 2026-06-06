// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appTitle => 'Fina e hënës';

  @override
  String get accountPreferences => 'Account Preferences';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'Hyni';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Lidhja e shpejtë';

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
  String get back => 'Mbrapa';

  @override
  String get serverUnavailable => 'Serveri është i padisponueshëm';

  @override
  String get loginFailed => 'Identifikimi dështoi';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Kush po shikon?';

  @override
  String get addUser => 'Shto përdorues';

  @override
  String get selectServer => 'Zgjidhni Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
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
  String get settingsAppearanceThemeSubtitle =>
      'Kalo midis Moonfin dhe Neon Pulse pa e rifilluar aplikacionin';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Fina e hënës';

  @override
  String get themeMoonfinSubtitle =>
      'Pamja aktuale Moonfin që të gjithë e keni dashuruar';

  @override
  String get themeNeonPulse => 'Pulsi neoni';

  @override
  String get themeNeonPulseSubtitle =>
      'Stilim Synthwave me shkëlqim magenta, tekst cian dhe kontrast më të fortë kromi';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Dilni nga Moonfin?';

  @override
  String get exitAppConfirmation => 'Je i sigurt që dëshiron të dalësh?';

  @override
  String get exit => 'Dilni';

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
  String get series => 'Seria';

  @override
  String get noItemsFound => 'Nuk u gjet asnjë artikull';

  @override
  String get home => 'Shtëpi';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Kjo dosje është bosh';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
  String get extraLarge => 'Extra Large';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
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
  String get discoverySubjects => 'Temat e zbulimit';

  @override
  String get pickDiscoverySubjects =>
      'Zgjidh se cili subjekt ushqehet për të shfaqur në \"Zbulo\".';

  @override
  String get apply => 'Aplikoni';

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
    return '$count titles';
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
  String get resume => 'Rezyme';

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
  String get readyWhenYouAre => 'Gati kur të jeni';

  @override
  String get details => 'Detajet';

  @override
  String get listeningRoom => 'Dhoma e Dëgjimit';

  @override
  String get bookmarksAndProgress => 'Faqeshënuesit dhe përparimi';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
    return 'No $label found';
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
  String get watched => 'Shikuar';

  @override
  String get unread => 'Të palexuara';

  @override
  String get unwatched => 'I pashikuar';

  @override
  String get seriesStatus => 'Statusi i Serisë';

  @override
  String get allLibraries => 'Të gjitha Bibliotekat';

  @override
  String get books => 'libra';

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
  String get rssFeed => 'RSS Feed';

  @override
  String get downloadZip => 'Shkarko Zip';

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
      'Nuk disponohet ende përmbledhje nga Open Library për këtë titull.';

  @override
  String get subjects => 'Subjektet';

  @override
  String get all => 'Të gjitha';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Kjo temë nuk mund të ngarkohej për momentin.';

  @override
  String get audiobookDetails => 'Detajet e librit audio';

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
  String get trackList => 'Lista e këngëve';

  @override
  String get itemListPlaceholder => 'Lista e artikujve do të shfaqet këtu';

  @override
  String get favoriteTracksPlaceholder =>
      'Këngët e preferuara do të shfaqen këtu';

  @override
  String get failedToLoad => 'Ngarkimi dështoi';

  @override
  String get delete => 'Fshije';

  @override
  String get save => 'Ruaj';

  @override
  String get moreLikeThis => 'Më shumë si kjo';

  @override
  String get castAndCrew => 'Cast & Crew';

  @override
  String get collection => 'Mbledhja';

  @override
  String get episodes => 'Episodet';

  @override
  String get nextUp => 'Next Up';

  @override
  String get seasons => 'Stinët';

  @override
  String get chapters => 'Kapitujt';

  @override
  String get features => 'Veçoritë';

  @override
  String get movies => 'Filmat';

  @override
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Data e publikimit nuk dihet';

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
  String endsIn(String time) {
    return 'Ends in $time';
  }

  @override
  String get view => 'Shiko';

  @override
  String get resumeReading => 'Rifilloni leximin';

  @override
  String get read => 'Lexoni';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
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
  String get cast => 'Cast';

  @override
  String get trailer => 'Rimorkio';

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
  String get renamePlaylist => 'Riemërto listën e luajtjes';

  @override
  String get playlistName => 'Emri i listës së luajtjes';

  @override
  String get deleteDownloadedAlbum => 'Fshi albumin e shkarkuar';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Artikulli u fshi';

  @override
  String get noPlayableTrailerFound =>
      'Nuk u gjet asnjë rimorkio që mund të luhet.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Titrat u shkarkuan. Mund të duhet një moment për t\'u shfaqur ndërsa Jellyfin rifreskon artikullin.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Zgjidhni Version';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Fshi skedarët e shkarkuar';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'SHKRIMTARËT';

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
  String get showLess => 'Trego më pak';

  @override
  String get readMore => 'Lexo më shumë';

  @override
  String get shuffle => 'Përzierje';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Ndeshje perfekte';

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
  String get deviceVolume => 'Volumi i pajisjes';

  @override
  String get unavailable => 'I padisponueshëm';

  @override
  String get pause => 'Ndalo';

  @override
  String get syncPosition => 'Pozicioni i sinkronizimit';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Radha është bosh';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Shtypni gjatë për ta zhbllokuar';

  @override
  String get off => 'Joaktiv';

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
  String get player => 'Lojtar';

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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Paraqitja e EPUB brenda aplikacionit nuk ofrohet ende në këtë platformë.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Paraqitja e dokumentit të integruar nuk ofrohet në këtë platformë.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nuk mund të hapej shikuesi i jashtëm.';

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
      'Nuk ka ende faqeshënues.\nPrekni ikonën e faqeshënuesit gjatë leximit për të ruajtur pozicionin tuaj.';

  @override
  String get noTableOfContentsAvailable => 'Nuk ka tabelë të përmbajtjes';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Pozicioni';

  @override
  String get bookReader => 'Lexues libri';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Nuk u gjet asnjë kanal';

  @override
  String get liveBadge => 'LIVE';

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
  String get watch => 'Shikoni';

  @override
  String get close => 'Mbylle';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Nr';

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
    return 'Stop recording \"$name\"?';
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
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Shikuesi';

  @override
  String get seerrAccountType => 'Lloji i llogarisë Seer';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Albumi';

  @override
  String get playAlbum => 'Luaj albumin';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'Seria nuk u gjet';

  @override
  String get errorLoadingSeries => 'Gabim gjatë ngarkimit të serisë';

  @override
  String get downloadedEpisodes => 'Episodet e shkarkuara';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Muzikë dhe Audiolibra';

  @override
  String get images => 'Imazhet';

  @override
  String get database => 'Baza e të dhënave';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Muzika me temë në rreshtat kryesore';

  @override
  String get playWhenBrowsingHomeScreen => 'Luaj kur shfleton ekranin bazë';

  @override
  String get detailsBackgroundBlur => 'Detajet turbullimi i sfondit';

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
  String get fit => 'Përshtatet';

  @override
  String get autoCrop => 'Prirje automatike';

  @override
  String get stretch => 'Shtrihu';

  @override
  String get refreshRateSwitching => 'Ndërrimi i shpejtësisë së rifreskimit';

  @override
  String get disabled => 'I paaftë';

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
  String get hindi => 'Hindi';

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
  String get ac3Passthrough => 'AC3 Passthrough';

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
    return 'After $episodes episodes / ${hours}h';
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
  String get cyan => 'Cyan';

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
  String get topBar => 'Top Bar';

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
  String get teal => 'Teal';

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
  String get slate => 'Slate';

  @override
  String get indigo => 'Lejla';

  @override
  String get libraryDisplay => 'Ekrani i bibliotekës';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Banner';

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
    return '$count selected';
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
      'Zgjidhni midis Moonfin, MakD ose çaktivizoni shiritin e medias';

  @override
  String get mediaBarModeMoonfin => 'Fina e hënës';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Joaktiv';

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
  String get perRowImageType => 'Lloji i imazhit për rresht';

  @override
  String get perRowSettings => 'Cilësimet për rresht';

  @override
  String get autoLogin => 'Hyrja automatike';

  @override
  String get lastUser => 'Përdoruesi i fundit';

  @override
  String get specificUser => 'Përdorues specifik';

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
  String get logo => 'Logo';

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
  String get pluginLabel => 'Plugin';

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
    return '$status\nVersion: $version';
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
  String get resetRowsToDefaults => 'Rivendosni rreshtat në parazgjedhje';

  @override
  String get enableSeerr => 'Aktivizo Seerr';

  @override
  String get showSeerrInNavigation =>
      'Shfaq Seerr në navigim (kërkon shtojcën e serverit)';

  @override
  String get seerrUnavailable =>
      'I padisponueshëm sepse mbështetja e Serr-it të shtojcës së serverit është çaktivizuar.';

  @override
  String get nsfwFilter => 'Filtri NSFW';

  @override
  String get hideAdultContent => 'Fshih përmbajtjen për të rritur në rezultate';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Zbuloni Rreshtat';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Tërhiqeni për ta rirenditur. Aktivizo ose çaktivizo rreshtat. Sinkronizimi i rendit të rreshtit të aktivizuar me shtesën Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Tërhiqeni për ta rirenditur. Aktivizo ose çaktivizo rreshtat.';

  @override
  String get enabled => 'Aktivizuar';

  @override
  String get hidden => 'I fshehur';

  @override
  String get aboutTitle => 'Rreth';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Licencat me burim të hapur';

  @override
  String get sourceCode => 'Kodi burimor';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Përditëso Njoftimet';

  @override
  String get showWhenUpdatesAvailable =>
      'Trego kur përditësimet janë të disponueshme';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get mdbListTmdbRatingSources => 'MDBLlist, TMDB dhe burime vlerësimi';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'E qartë';

  @override
  String get browse => 'Shfletoni';

  @override
  String get noResults => 'Nuk ka rezultate';

  @override
  String get seerrAvailableStatus => 'Në dispozicion';

  @override
  String get seerrRequestedStatus => 'Kërkuar';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Cilësimet e shikuesit';

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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
    return 'age $age';
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
  String get seasonsLabel => 'Stinët';

  @override
  String get episodesLabel => 'Episodet';

  @override
  String get access => 'Qasja';

  @override
  String get add => 'Shtoni';

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
  String get general => 'Gjeneral';

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
  String get trickplay => 'Mashtrime';

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
  String get mute => 'Hesht';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Paneli';

  @override
  String get adminDrawerAnalytics => 'Analiza';

  @override
  String get adminDrawerSettings => 'Cilësimet';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Përdoruesit';

  @override
  String get adminDrawerLibraries => 'Bibliotekat';

  @override
  String get adminDrawerTranscoding => 'Transkodimi';

  @override
  String get adminDrawerResume => 'Rezyme';

  @override
  String get adminDrawerStreaming => 'Transmetim';

  @override
  String get adminDrawerTrickplay => 'Mashtrime';

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
  String get adminDrawerPlugins => 'Plugins';

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
    return 'Error: $error';
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
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Dërgo Mesazh';

  @override
  String get adminMessageTextHint => 'Teksti i mesazhit';

  @override
  String get adminSetVolume => 'Vendos volumin';

  @override
  String get sessionPrev => 'Prev';

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
  String get volume => 'Vëllimi';

  @override
  String get actions => 'Veprimet';

  @override
  String get videoCodec => 'Kodiku i videos';

  @override
  String get audioCodec => 'Kodiku i audios';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Përfundimi';

  @override
  String get direct => 'Direkt';

  @override
  String get adminDisconnect => 'Shkëputeni';

  @override
  String get adminClearDates => 'Datat e qarta';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Fshi pajisjen';

  @override
  String get adminDeviceDeleted => 'Pajisja u fshi';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Riemërtoni Bibliotekën';

  @override
  String get adminNewName => 'Emri i ri';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Fshi Bibliotekën';

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
  String get adminRemovePath => 'Hiq shtegun';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opsionet e bibliotekës u ruajtën';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'Kërkohet emri i bibliotekës';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'Ngarkimi i përdoruesve dështoi';

  @override
  String get adminSearchUsers => 'Kërkoni përdoruesit';

  @override
  String get adminEditUser => 'Redakto përdoruesin';

  @override
  String get adminAddUser => 'Shto përdorues';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Lejet u ruajtën';

  @override
  String get adminPasswordsMismatch => 'Fjalëkalimet nuk përputhen';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get admin => 'Admin';

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
  String get adminResetPasswordWarning =>
      'Kjo do të heqë fjalëkalimin. Përdoruesi do të jetë në gjendje të identifikohet pa një fjalëkalim.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Shenja kyçe mungon nga përgjigja e serverit';

  @override
  String get adminRevokeApiKey => 'Revoko çelësin e API-së';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Çelësi API u anulua';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Po krijon kopje rezervë...';

  @override
  String get adminBackupCreated => 'Rezervimi u krijua me sukses';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Mungon rruga rezervë në përgjigjen e serverit';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Konfirmo Restore';

  @override
  String get adminRestoringBackup => 'Po restaurohet rezervimi...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Kërko në log';

  @override
  String get adminNoMatchingLines => 'Nuk ka rreshta që përputhen';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nuk u gjetën detyra të planifikuara';

  @override
  String get adminNoTasksMatchFilter =>
      'Asnjë detyrë nuk përputhet me filtrin aktual';

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
  String get adminRunNow => 'Vraponi tani';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Dita e javës';

  @override
  String get adminSearchPlugins => 'Kërko shtojcat...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Çinstaloni shtesën';

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
      'Asnjë shtojcë nuk përputhet me kërkimin tuaj';

  @override
  String get adminNoPluginsInstalled => 'Asnjë shtojcë e instaluar';

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
      'Cilësimet nuk mund të hapen: mungon kodi i autorizimit.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Shtojca nuk u gjet';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'p.sh. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL e depove';

  @override
  String get adminAddEntry => 'Shto hyrje';

  @override
  String get adminInvalidUrl => 'URL e pavlefshme';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminTrickplaySaved =>
      'Cilësimet e luajtjes së mashtrimit u ruajtën';

  @override
  String get adminTrickplayLoadFailed =>
      'Ngarkimi i cilësimeve të luajtjes së mashtrimit dështoi';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Kërkoni personin në distancë';

  @override
  String get adminNoRemoteMatches => 'Nuk u gjet asnjë përputhje në distancë';

  @override
  String get adminRemoteResults => 'Rezultatet në distancë';

  @override
  String get adminRemoteMetadataApplied =>
      'U aplikuan të dhënat meta në distancë';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Përditëso llojin e përmbajtjes';

  @override
  String get adminContentType => 'Lloji i përmbajtjes';

  @override
  String get adminContentTypeUpdated => 'Lloji i përmbajtjes u përditësua';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Format i pambështetur i imazhit';

  @override
  String get adminImageReadFailed => 'Leximi i imazhit të zgjedhur dështoi';

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
  String get adminAllProviders => 'Të gjithë ofruesit';

  @override
  String get adminNoRemoteImages => 'Nuk u gjetën imazhe në distancë';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Shto sintonizues';

  @override
  String get adminTunerType => 'Lloji i sintonizuesit';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Të tjera';

  @override
  String get adminUrlPath => 'URL / Shtegu';

  @override
  String get adminNameOptional => 'Emri (opsionale)';

  @override
  String get adminTunerAdded => 'Akorduesi u shtua';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Shto ofruesin e udhëzuesit';

  @override
  String get adminProviderType => 'Lloji i ofruesit';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect ose XMLTV';

  @override
  String get adminUsernameOptional => 'Emri i përdoruesit (opsionale)';

  @override
  String get adminRefreshInterval => 'Intervali i rifreskimit (orë)';

  @override
  String get adminProviderAdded => 'Ofruesi u shtua';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Kërkohet rivendosja e sintonizuesit';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved =>
      'Cilësimet e regjistrimit u ruajtën';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Shto Ofrues';

  @override
  String get adminNoListingProviders =>
      'Asnjë ofrues listimi nuk është konfiguruar';

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
    return 'Restore backup $name now?';
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
  String get adminApply => 'Aplikoni';

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
  String get adminLogViewerNoMatches => 'Nuk ka rreshta që përputhen';

  @override
  String get adminMetadataEditorTitle => 'Redaktori i meta të dhënave';

  @override
  String get adminMetadataRemote => 'Telekomanda';

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
  String get adminMetadataFieldTagline => 'Tagline';

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
  String get adminMetadataEditPerson => 'Edit Person';

  @override
  String get adminMetadataRole => 'Roli';

  @override
  String get adminMetadataImagePrimary => 'fillore';

  @override
  String get adminMetadataImageBackdrop => 'Sfondi';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Gishti i madh';

  @override
  String get adminMetadataRecursive => 'Rekursive';

  @override
  String get adminMetadataProvider => 'Ofruesi';

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
      'Leximi i imazhit të zgjedhur dështoi';

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
      'Kjo heq imazhin aktual nga artikulli.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Asnjë paketë nuk përputhet me kërkimin tuaj';

  @override
  String get adminPluginsCatalogEmpty => 'Nuk ka paketa në dispozicion';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Hiq depo';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Hiq';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminBrandingTitle => 'Branding';

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
  String get adminPlaybackHwAccel => 'Përshpejtimi i harduerit';

  @override
  String get adminPlaybackHwAccelLabel => 'Përshpejtimi i harduerit';

  @override
  String get adminPlaybackEnableHwEncoding => 'Aktivizo kodimin e harduerit';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Aktivizo dekodimin e harduerit për:';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminActivityNow => 'tani';

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
      'Konfiguro gjenerimin e imazheve të luajtjes për miniaturë të pamjes paraprake të kërkimit.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porta publike HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'URL-ja bazë';

  @override
  String get adminNetworkingBaseUrlHint => 'p.sh. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Pragu i ngadaltë i përgjigjes (ms)';

  @override
  String get adminGeneralCachePath => 'Rruga e cache-it';

  @override
  String get adminGeneralMetadataPath => 'Rruga e meta të dhënave';

  @override
  String get adminGeneralServerName => 'Emri i serverit';

  @override
  String get adminSettingsLoadFailed => 'Ngarkimi i cilësimeve dështoi';

  @override
  String get adminDiscover => 'Zbuloni';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Qasja në SyncPlay u refuzua';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Ju nuk keni akses në një ose më shumë artikuj në këtë grup SyncPlay. Kërkojini pronarit të grupit të verifikojë lejet e bibliotekës ose të zgjedhë një radhë tjetër.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
  String get homeScreenSectionsIntegrationDescription =>
      'Zbuloni rreshtat e ekspozuar nga shtojca \"Seksionet e ekranit bazë\" të IAmParadox27. Rreshtat mund të aktivizohen dhe të rirenditen më poshtë.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Nuk ka ende serverë Jellyfin që raportojnë shtesën.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Zbuloni rreshtat e konfiguruar nëpërmjet shtojcës \"KefinTweaks\" të ranaldsgift. Seksionet e personalizuara, të lëshuara së fundmi, shikimi përsëri, sezonal dhe të shtuar së fundi në bibliotekë pasqyrohen nga konfigurimi i KefinTweaks në çdo server Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Ende nuk ka serverë Jellyfin që raportojnë KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Hapni seksionet kryesore';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Aktivizo, çaktivizo dhe rirendit rreshtat';

  @override
  String get integrationInstalledButDisabled => 'I instaluar por i çaktivizuar';

  @override
  String get integrationNotInstalled => 'Nuk është instaluar';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Riprodhimi në distancë';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Volumi i pajisjes';

  @override
  String get castVolumeUnavailable => 'I padisponueshëm';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN i pasaktë';

  @override
  String get pinMismatch => 'PIN-et nuk përputhen';

  @override
  String get pinForgot => 'Keni harruar kodin PIN?';

  @override
  String get pinClear => 'E qartë';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Kërkesa për Lidhje të Shpejtë e autorizuar.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kodi i Lidhjes së Shpejtë është i pavlefshëm ose i skaduar.';

  @override
  String get quickConnectNotSupported =>
      'Lidhja e shpejtë nuk mbështetet në këtë server.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Autorizimi i kodit të Lidhjes së Shpejtë dështoi.';

  @override
  String get quickConnectDisabled =>
      'Lidhja e shpejtë është çaktivizuar në këtë server.';

  @override
  String get quickConnectForbidden =>
      'Llogaria juaj nuk mund ta autorizojë këtë kërkesë për Lidhje të Shpejtë.';

  @override
  String get quickConnectNotFound =>
      'Kodi i lidhjes së shpejtë nuk u gjet. Provoni një kod të ri.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Fut kodin';

  @override
  String get quickConnectAuthorize => 'Autorizoni';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
  String get imageTypeBanner => 'Banner';

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
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'TV drejtpërdrejt';

  @override
  String get continueWatchingAndNextUp => 'Vazhdo të shikosh dhe më pas';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get playerTooltipPrevious => 'E mëparshme';

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
  String get settingsPrivacyAndSafetySection => 'PRIVACIA DHE SIGURIA';

  @override
  String get settingsBlockedRatings => 'Vlerësime të bllokuara';

  @override
  String get settingsGeneralStyle => 'Stili i Përgjithshëm';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Thekse temash, sfonde, tregues të shikuar dhe muzikë me temë';

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
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (trashëgimia)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
  String get enableTunnelingTitle => 'Enable tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Advanced. Routes audio and video through a coupled hardware path. Off by default because it causes audio/video dropouts on some devices.';

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
