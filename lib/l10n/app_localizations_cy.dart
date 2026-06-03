// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class AppLocalizationsCy extends AppLocalizations {
  AppLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get appTitle => 'Lleuad';

  @override
  String get signIn => 'Mewngofnodwch';

  @override
  String connectingToServer(String serverName) {
    return 'Yn cysylltu â $serverName';
  }

  @override
  String get quickConnect => 'Cyswllt Cyflym';

  @override
  String get password => 'Cyfrinair';

  @override
  String get username => 'Enw defnyddiwr';

  @override
  String get email => 'Ebost';

  @override
  String get quickConnectInstruction =>
      'Rhowch y cod hwn ar ddangosfwrdd gwe eich gweinydd:';

  @override
  String get waitingForAuthorization => 'Aros am awdurdodiad...';

  @override
  String get back => 'Yn ol';

  @override
  String get serverUnavailable => 'Nid yw\'r gweinydd ar gael';

  @override
  String get loginFailed => 'Methodd mewngofnodi';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Nid yw QuickConnect ar gael: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Nid yw QuickConnect ar gael ($status): $detail';
  }

  @override
  String get whosWatching => 'Pwy sy\'n gwylio?';

  @override
  String get addUser => 'Ychwanegu Defnyddiwr';

  @override
  String get selectServer => 'Dewiswch Gweinydd';

  @override
  String appVersionFooter(String version) {
    return 'fersiwn Moonfin $version';
  }

  @override
  String get savedServers => 'Gweinyddion Cadwedig';

  @override
  String get discoveredServers => 'Gweinyddion a Ddarganfyddwyd';

  @override
  String get noneFound => 'Dim wedi\'i ganfod';

  @override
  String get unableToConnectToServer => 'Methu cysylltu â\'r gweinydd';

  @override
  String get addServer => 'Ychwanegu Gweinydd';

  @override
  String get embyConnect => 'Cyswllt Emby';

  @override
  String get removeServer => 'Dileu Gweinydd';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Tynnu \"$serverName\" o\'ch gweinyddwyr?';
  }

  @override
  String get cancel => 'Canslo';

  @override
  String get remove => 'Dileu';

  @override
  String get connectToServer => 'Cysylltwch â\'r Gweinydd';

  @override
  String get serverAddress => 'Cyfeiriad y Gweinydd';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Cyswllt';

  @override
  String get secureStorageUnavailable => 'Storfa Ddiogel Ddim ar gael';

  @override
  String get secureStorageUnavailableMessage =>
      'Ni allai Moonfin gyrchu cylch allweddi eich system. Gall mewngofnodi barhau, ond mae\'n bosibl na fydd storfa docynnau ddiogel ar gael nes bod y cylch allweddi wedi\'i ddatgloi.';

  @override
  String get ok => 'iawn';

  @override
  String get settingsAppearanceTheme => 'Thema Ap';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Newid rhwng Moonfin a Neon Pulse heb ailgychwyn yr app';

  @override
  String get keyboardPreferSystemIme => 'Mae\'n well gennyf bysellfwrdd system';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Defnyddiwch eich dull mewnbwn dyfais yn ddiofyn ar gyfer mewnbynnu testun';

  @override
  String get themeMoonfin => 'Lleuad';

  @override
  String get themeMoonfinSubtitle =>
      'Golwg gyfredol Moonfin rydych chi i gyd wedi dod i garu';

  @override
  String get themeNeonPulse => 'Pwls Neon';

  @override
  String get themeNeonPulseSubtitle =>
      'Arddull tonnau synth gyda llewyrch magenta, testun cyan, a chyferbyniad crôm cryfach';

  @override
  String get embyConnectSignInSubtitle =>
      'Mewngofnodwch gyda\'ch cyfrif Emby Connect';

  @override
  String get emailOrUsername => 'E-bost neu Enw Defnyddiwr';

  @override
  String get selectAServer => 'Dewiswch Weinydd';

  @override
  String get tryAgain => 'Ceisiwch Eto';

  @override
  String get noLinkedServers =>
      'Dim gweinyddwyr sy\'n gysylltiedig â\'r cyfrif Emby Connect hwn';

  @override
  String get invalidEmbyConnectCredentials => 'Manylion annilys Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Enw defnyddiwr neu gyfrinair Emby Connect annilys';

  @override
  String get embyConnectExchangeNotSupported =>
      'Nid yw\'r gweinydd yn cefnogi cyfnewidfa Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Gwall rhwydwaith wrth gysylltu ag Emby Connect neu\'r gweinydd a ddewiswyd';

  @override
  String get loadingLinkedServers =>
      'Wrthi\'n llwytho gweinyddion cysylltiedig...';

  @override
  String get connectingToServerEllipsis => 'Wrthi\'n cysylltu â\'r gweinydd...';

  @override
  String get noReachableAddress => 'Ni ddarparwyd cyfeiriad cyraeddadwy';

  @override
  String get invalidServerExchangeResponse =>
      'Ymateb annilys o bwynt terfyn cyfnewid gweinydd';

  @override
  String unableToConnectTo(String target) {
    return 'Methu cysylltu â $target';
  }

  @override
  String get exitApp => 'Gadael Moonfin?';

  @override
  String get exitAppConfirmation => 'Ydych chi\'n siŵr eich bod am adael?';

  @override
  String get exit => 'Ymadael';

  @override
  String get noHomeRowsLoaded => 'Nid oedd modd llwytho unrhyw resi cartref';

  @override
  String get noHomeRowsHint =>
      'Ceisiwch adnewyddu neu leihau adrannau cartref gweithredol.';

  @override
  String get retryHomeRows => 'Ailgynnig Rhesi Cartref';

  @override
  String get guide => 'Tywysydd';

  @override
  String get recordings => 'Recordiadau';

  @override
  String get schedule => 'Atodlen';

  @override
  String get series => 'Cyfres';

  @override
  String get noItemsFound => 'Ni chanfuwyd unrhyw eitemau';

  @override
  String get home => 'Cartref';

  @override
  String get browseAll => 'Pori Pawb';

  @override
  String get genres => 'Genres';

  @override
  String get collectionPlaceholder => 'Bydd eitemau casglu yn ymddangos yma';

  @override
  String get browseByLetter => 'Pori trwy Lythyr';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Bydd pori yn nhrefn yr wyddor yn ymddangos yma';

  @override
  String get suggestions => 'Awgrymiadau';

  @override
  String get suggestionsPlaceholder =>
      'Bydd eitemau a awgrymir yn ymddangos yma';

  @override
  String get failedToLoadLibraries => 'Wedi methu llwytho llyfrgelloedd';

  @override
  String get noLibrariesFound => 'Ni ddaethpwyd o hyd i lyfrgelloedd';

  @override
  String get library => 'Llyfrgell';

  @override
  String get displaySettings => 'Gosodiadau Arddangos';

  @override
  String get allGenres => 'Pob Genres';

  @override
  String get noGenresFound => 'Heb ganfod genres';

  @override
  String failedToLoadFolderError(String error) {
    return 'Wedi methu llwytho ffolder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Mae\'r ffolder hon yn wag';

  @override
  String itemCountLabel(int count) {
    return '$count eitem';
  }

  @override
  String get failedToLoadFavorites => 'Wedi methu llwytho ffefrynnau';

  @override
  String get retry => 'Ceisiwch eto';

  @override
  String get noFavoritesYet => 'Dim ffefrynnau eto';

  @override
  String get favorites => 'Ffefrynnau';

  @override
  String totalCountItems(int count) {
    return '$count Eitemau';
  }

  @override
  String get continuing => 'Yn parhau';

  @override
  String get ended => 'Wedi dod i ben';

  @override
  String get sortAndFilter => 'Trefnu a Hidlo';

  @override
  String get type => 'Math';

  @override
  String get sortBy => 'Trefnu Yn ôl';

  @override
  String get display => 'Arddangos';

  @override
  String get imageType => 'Math o Ddelwedd';

  @override
  String get posterSize => 'Maint Poster';

  @override
  String get small => 'Bach';

  @override
  String get medium => 'Canolig';

  @override
  String get large => 'Mawr';

  @override
  String get extraLarge => 'Mawr Ychwanegol';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Golygfeydd';

  @override
  String get albums => 'Albymau';

  @override
  String get albumArtists => 'Artistiaid Albwm';

  @override
  String get artists => 'Artistiaid';

  @override
  String get bookmarks => 'Llyfrnodau';

  @override
  String get noSavedBookmarks =>
      'Dim nodau tudalen ar gyfer y teitl hwn wedi\'u cadw eto.';

  @override
  String get openBook => 'Llyfr Agored';

  @override
  String get chapter => 'Pennod';

  @override
  String get page => 'Tudalen';

  @override
  String get bookmark => 'Llyfrnod';

  @override
  String get justNow => 'Dim ond nawr';

  @override
  String minutesAgo(int count) {
    return '${count}m yn ôl';
  }

  @override
  String hoursAgo(int count) {
    return '${count}awr yn ôl';
  }

  @override
  String daysAgo(int count) {
    return '${count}d yn ôl';
  }

  @override
  String get discoverySubjects => 'Pynciau Darganfod';

  @override
  String get pickDiscoverySubjects =>
      'Dewiswch pa ffrydiau pwnc i\'w dangos yn Darganfod.';

  @override
  String get apply => 'Ymgeisiwch';

  @override
  String get openLink => 'Agor Dolen';

  @override
  String get scanWithYourPhone => 'Sganiwch gyda\'ch ffôn';

  @override
  String get audiobookGenres => 'Genres Llyfrau Llafar';

  @override
  String get pickAudiobookGenres =>
      'Dewiswch pa genres i\'w dangos yn Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Darganfod Llyfrau Llafar';

  @override
  String get librivoxDescription =>
      'Teitlau parth cyhoeddus poblogaidd gan LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Sgroliwch i\'r chwith';

  @override
  String get scrollRight => 'Sgroliwch i\'r dde';

  @override
  String get couldNotLoadGenre => 'Methu llwytho\'r genre hwn ar hyn o bryd.';

  @override
  String get continueReading => 'Parhau i Ddarllen';

  @override
  String get savedHighlights => 'Uchafbwyntiau wedi\'u Cadw';

  @override
  String get continueListening => 'Parhewch i Wrando';

  @override
  String get listen => 'Gwrandewch';

  @override
  String get resume => 'Ail-ddechrau';

  @override
  String get failedToLoadLibrary => 'Wedi methu llwytho\'r llyfrgell';

  @override
  String get popularNow => 'Poblogaidd Nawr';

  @override
  String get savedForLater => 'Wedi\'i Gadw Ar Gyfer Yn Ddiweddarach';

  @override
  String get topListens => 'Top Yn gwrando';

  @override
  String get unreadDiscoveries => 'Darganfyddiadau Heb eu Darllen';

  @override
  String get pickUpAgain => 'Codwch Eto';

  @override
  String get bookHighlightsDescription =>
      'Eich llyfrau gydag uchafbwyntiau, ffefrynnau, neu gynnydd darllen.';

  @override
  String get handPickedFromLibrary => 'Wedi\'i ddewis â llaw o\'ch llyfrgell.';

  @override
  String get handPickedFromListeningQueue =>
      'Wedi\'i ddewis â llaw o\'ch ciw gwrando.';

  @override
  String get booksWithHighlights =>
      'Llyfrau gydag uchafbwyntiau, ffefrynnau, neu gynnydd darllen.';

  @override
  String get jumpBackNarration =>
      'Neidiwch yn ôl i\'r naratif heb hela am eich lle.';

  @override
  String get unreadBooksReady =>
      'Llyfrau heb eu darllen yn barod ar gyfer yr awr dawel nesaf.';

  @override
  String get quickAccessFavorites =>
      'Mynediad cyflym i\'r llyfrau rydych chi\'n dod yn ôl atynt o hyd.';

  @override
  String get searchAudiobooks => 'Chwilio llyfrau sain';

  @override
  String get searchYourLibrary => 'Chwiliwch eich llyfrgell';

  @override
  String get pickUpStory => 'Codwch y stori lle gwnaethoch chi adael';

  @override
  String get savedPlacesChapters =>
      'Eich lleoedd sydd wedi\'u cadw a\'ch penodau anorffenedig';

  @override
  String authorsCount(int count) {
    return '$count awduron';
  }

  @override
  String genresCount(int count) {
    return '$count genres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% wedi\'i gwblhau';
  }

  @override
  String get readyWhenYouAre => 'Yn barod pan fyddwch chi';

  @override
  String get details => 'Manylion';

  @override
  String get listeningRoom => 'Ystafell Wrando';

  @override
  String get bookmarksAndProgress => 'Llyfrnodau a Chynnydd';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Teitlau $count wedi\'u trefnu i\'w darllen - pori yn gyntaf.';
  }

  @override
  String get titles => 'Teitlau';

  @override
  String get allTitles => 'Pob Teitl';

  @override
  String get authors => 'Awduron';

  @override
  String get browseByAuthor => 'Pori Yn ôl Awdur';

  @override
  String get browseByGenre => 'Pori Yn ôl Genre';

  @override
  String get discover => 'Darganfod';

  @override
  String get trendingTitlesOpenLibrary =>
      'Teitlau tueddu fesul pwnc o Open Library.';

  @override
  String get noBookmarkedItems => 'Dim eitemau wedi\'u nod tudalen eto';

  @override
  String get nothingMatchesSection =>
      'Nid oes dim yn cyfateb i\'r adran hon eto. Rhowch gynnig ar dab arall neu dewch yn ôl ar ôl i gysoni\'r llyfrgell ddod i ben.';

  @override
  String get audiobooks => 'Llyfrau llafar';

  @override
  String noLabelFound(String label) {
    return 'Ni chanfuwyd $label';
  }

  @override
  String get folder => 'Ffolder';

  @override
  String get filters => 'Hidlau';

  @override
  String get readingStatus => 'Statws Darllen';

  @override
  String get playedStatus => 'Statws chwarae';

  @override
  String get readStatus => 'Darllen';

  @override
  String get watched => 'Gwylio';

  @override
  String get unread => 'Heb ei ddarllen';

  @override
  String get unwatched => 'Heb ei wylio';

  @override
  String get seriesStatus => 'Statws y Gyfres';

  @override
  String get allLibraries => 'Pob Llyfrgell';

  @override
  String get books => 'Llyfrau';

  @override
  String get author => 'Awdur';

  @override
  String get unknownAuthor => 'Awdur Anhysbys';

  @override
  String get uncategorized => 'Uncategorized';

  @override
  String get overview => 'Trosolwg';

  @override
  String get noLibrivoxDescription =>
      'Ni ddarparwyd disgrifiad gan LibriVox ar gyfer y teitl hwn eto.';

  @override
  String get readers => 'Darllenwyr';

  @override
  String get openLinks => 'Agor Dolenni';

  @override
  String get librivoxPage => 'Tudalen LibriVox';

  @override
  String get internetArchive => 'Archif Rhyngrwyd';

  @override
  String get rssFeed => 'Porthiant RSS';

  @override
  String get downloadZip => 'Lawrlwythwch Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count adrannau';
  }

  @override
  String firstPublished(int year) {
    return 'Cyhoeddwyd gyntaf $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Dim trosolwg ar gael gan Open Library ar gyfer y teitl hwn eto.';

  @override
  String get subjects => 'Pynciau';

  @override
  String get all => 'Pawb';

  @override
  String booksCount(int count) {
    return '$count llyfrau';
  }

  @override
  String get couldNotLoadSubject => 'Methu llwytho\'r pwnc hwn ar hyn o bryd.';

  @override
  String get audiobookDetails => 'Manylion Llyfrau Llafar';

  @override
  String authorsCountTitle(int count) {
    return '$count Awduron';
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
  String get trackList => 'Rhestr Traciau';

  @override
  String get itemListPlaceholder => 'Bydd rhestr o eitemau yn ymddangos yma';

  @override
  String get favoriteTracksPlaceholder => 'Bydd hoff draciau yn ymddangos yma';

  @override
  String get failedToLoad => 'Wedi methu llwytho';

  @override
  String get delete => 'Dileu';

  @override
  String get save => 'Arbed';

  @override
  String get moreLikeThis => 'Mwy Fel Hyn';

  @override
  String get castAndCrew => 'Cast a Chriw';

  @override
  String get collection => 'Casgliad';

  @override
  String get episodes => 'Penodau';

  @override
  String get nextUp => 'Nesaf Up';

  @override
  String get seasons => 'Tymhorau';

  @override
  String get chapters => 'Penodau';

  @override
  String get features => 'Nodweddion';

  @override
  String get movies => 'Ffilmiau';

  @override
  String get musicVideos => 'Fideos Cerddoriaeth';

  @override
  String get other => 'Arall';

  @override
  String get discography => 'Disgograffi';

  @override
  String get similarArtists => 'Artistiaid tebyg';

  @override
  String get tableOfContents => 'Tabl Cynnwys';

  @override
  String get tracklist => 'Rhestr traciau';

  @override
  String discNumber(int number) {
    return 'Disg $number';
  }

  @override
  String get biography => 'Bywgraffiad Biography I thank Mr';

  @override
  String get authorDetails => 'Manylion Awdur';

  @override
  String get noOverviewAvailable =>
      'Nid oes trosolwg ar gael ar gyfer y teitl hwn eto.';

  @override
  String get noBiographyAvailable =>
      'Nid oes bywgraffiad ar gael i\'r awdur hwn.';

  @override
  String get noBooksFound => 'Ni chafwyd hyd i lyfrau ar gyfer yr awdur hwn.';

  @override
  String get unableToLoadAuthorDetails =>
      'Methu llwytho manylion yr awdur ar hyn o bryd.';

  @override
  String published(int year) {
    return 'Wedi cyhoeddi $year';
  }

  @override
  String get publicationDateUnknown => 'Dyddiad cyhoeddi yn anhysbys';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tymhorau',
      one: '1 Tymor',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Yn gorffen yn $time';
  }

  @override
  String get view => 'Golwg';

  @override
  String get resumeReading => 'Ail-ddechrau Darllen';

  @override
  String get read => 'Darllen';

  @override
  String resumeFrom(String position) {
    return 'Ail-ddechrau o $position';
  }

  @override
  String get play => 'Chwarae';

  @override
  String get startOver => 'Cychwyn Drosodd';

  @override
  String get restart => 'Ailgychwyn';

  @override
  String get readOffline => 'Darllenwch All-lein';

  @override
  String get playOffline => 'Chwarae All-lein';

  @override
  String get audio => 'Sain';

  @override
  String get subtitles => 'Isdeitlau';

  @override
  String get version => 'Fersiwn';

  @override
  String get cast => 'Cast';

  @override
  String get trailer => 'Trelar';

  @override
  String get finished => 'Wedi gorffen';

  @override
  String get favorited => 'Ffafrio';

  @override
  String get favorite => 'Hoff';

  @override
  String get playlist => 'Rhestr chwarae';

  @override
  String get downloaded => 'Wedi\'i lawrlwytho';

  @override
  String get downloadAll => 'Lawrlwythwch Pawb';

  @override
  String get download => 'Lawrlwythwch';

  @override
  String get deleteDownloaded => 'Dileu Wedi\'i Lawrlwytho';

  @override
  String get goToSeries => 'Ewch i Gyfres';

  @override
  String get editMetadata => 'Golygu Metadata';

  @override
  String get less => 'Llai';

  @override
  String get more => 'Mwy';

  @override
  String get deleteItem => 'Dileu Eitem';

  @override
  String get deletePlaylist => 'Dileu Rhestr Chwarae';

  @override
  String get deletePlaylistMessage =>
      'Dileu\'r rhestr chwarae hon o\'r gweinydd?';

  @override
  String get deleteItemMessage => 'Dileu\'r eitem hon o\'r gweinydd?';

  @override
  String get failedToDeletePlaylist => 'Wedi methu dileu rhestr chwarae';

  @override
  String get failedToDeleteItem => 'Wedi methu dileu\'r eitem';

  @override
  String get renamePlaylist => 'Ailenwi Rhestr Chwarae';

  @override
  String get playlistName => 'Enw rhestr chwarae';

  @override
  String get deleteDownloadedAlbum => 'Dileu Albwm Wedi\'i Lawrlwytho';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Dileu traciau wedi\'u llwytho i lawr ar gyfer \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted =>
      'Traciau wedi\'u llwytho i lawr wedi\'u dileu';

  @override
  String get downloadedTracksDeleteFailed =>
      'Nid oedd modd dileu rhai traciau a lawrlwythwyd';

  @override
  String get noTracksLoaded => 'Dim traciau wedi\'u llwytho';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Na $itemLabel wedi\'i lwytho';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Wrthi\'n llwytho i lawr $title ($count items)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddileu \"$name\" o\'r gweinydd? Ni ellir dadwneud y weithred hon.';
  }

  @override
  String get itemDeleted => 'Eitem wedi\'i dileu';

  @override
  String get noPlayableTrailerFound => 'Ni chanfuwyd trelar chwaraeadwy.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Fformat llyfr heb ei gefnogi: .$extension';
  }

  @override
  String get audioTrack => 'Trac Sain';

  @override
  String get subtitleTrack => 'Trac Isdeitl';

  @override
  String get none => 'Dim';

  @override
  String get downloadSubtitlesLabel => 'Lawrlwythwch isdeitlau...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Chwiliwch gan ddefnyddio\'r ategyn OpenSubtitles';

  @override
  String get downloadSubtitles => 'Lawrlwythwch Isdeitlau';

  @override
  String get selectedSubtitleInvalid =>
      'Mae\'r is-deitl a ddewiswyd yn annilys.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Isdeitl wedi\'i lawrlwytho a\'i ddewis: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Isdeitl wedi\'i lawrlwytho. Gall gymryd eiliad i ymddangos tra bod Jellyfin yn adnewyddu\'r eitem.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Ni chanfuwyd unrhyw is-deitlau o bell ar gyfer $language.';
  }

  @override
  String get selectVersion => 'Dewiswch Fersiwn';

  @override
  String versionNumber(int number) {
    return 'Fersiwn $number';
  }

  @override
  String get downloadAllQuality => 'Lawrlwythwch Pawb - Ansawdd';

  @override
  String get downloadQuality => 'Ansawdd Lawrlwytho';

  @override
  String get originalFileNoReencoding => 'Ffeil wreiddiol, dim ail-godio';

  @override
  String get originalFilesNoReencoding => 'Ffeiliau gwreiddiol, dim ail-godio';

  @override
  String get noEpisodesLoaded => 'Dim penodau wedi\'u llwytho';

  @override
  String downloadingItem(String name, String quality) {
    return 'Wrthi\'n lawrlwytho $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Dileu Ffeiliau Wedi\'u Lawrlwytho';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Dileu ffeiliau lleol ar gyfer $typeLabel?\n\nBydd hyn yn rhyddhau lle storio. Gallwch ail-lwytho i lawr yn ddiweddarach.';
  }

  @override
  String get downloadedFilesDeleted =>
      'Ffeiliau wedi\'u llwytho i lawr wedi\'u dileu';

  @override
  String get failedToDeleteFiles => 'Wedi methu dileu ffeiliau';

  @override
  String get deleteFiles => 'Dileu Ffeiliau';

  @override
  String get director => 'CYFARWYDDWR';

  @override
  String get writers => 'YSGRIFENWYR';

  @override
  String get studio => 'STIWDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count mwy';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Penodau';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Pennod $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Pennod $number';
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
    return 'Ganwyd $date';
  }

  @override
  String died(String date) {
    return 'Bu farw $date';
  }

  @override
  String age(int age) {
    return 'Oedran $age';
  }

  @override
  String get showLess => 'Dangos Llai';

  @override
  String get readMore => 'Darllen Mwy';

  @override
  String get shuffle => 'Siffrwd';

  @override
  String downloadsCount(int count) {
    return '$count lawrlwythiadau';
  }

  @override
  String get perfectMatch => 'Cydweddiad perffaith';

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
    return 'Mae angen caniatâd rheoli isdeitl Jellyfin ar gyfer y defnyddiwr hwn ar gyfer is-deitl o bell $action.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Nid oedd modd dod o hyd i\'r eitem hon ar y gweinydd ar gyfer is-deitl o bell $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Is-deitl o bell $action methu: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Methodd yr is-deitl o bell $action (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Wedi methu $action isdeitlau o bell.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'pob pennod wedi\'i lawrlwytho ar gyfer \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'pob pennod wedi\'i lawrlwytho yn y tymor hwn';

  @override
  String get stillWatching => 'Dal i Wylio?';

  @override
  String get unableToLoadTrailerStream => 'Methu llwytho ffrwd trelar.';

  @override
  String get trailerTimedOut => 'Trelar wedi dod i ben wrth lwytho.';

  @override
  String get playbackFailedForTrailer =>
      'Methodd chwarae ar gyfer y trelar hwn.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Nid yw castio ar gael yn ystod chwarae all-lein.';

  @override
  String castActionFailed(String label, String error) {
    return '$label methodd y weithred: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Wedi methu gosod cyfaint y cast: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Rheolaethau';
  }

  @override
  String get deviceVolume => 'Cyfrol Dyfais';

  @override
  String get unavailable => 'Ddim ar gael';

  @override
  String get pause => 'Oedwch';

  @override
  String get syncPosition => 'Safle Cysoni';

  @override
  String stopCast(String label) {
    return 'Stopiwch $label';
  }

  @override
  String get queueIsEmpty => 'Mae\'r ciw yn wag';

  @override
  String trackNumber(int number) {
    return 'Traciwch $number';
  }

  @override
  String get remotePlayback => 'Chwarae o Bell';

  @override
  String get castingToGoogleCast => 'Castio i Google Cast';

  @override
  String get castingViaAirPlay => 'Castio trwy AirPlay';

  @override
  String get castingViaDlna => 'Castio trwy DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds eiliadau';
  }

  @override
  String get longPressToUnlock => 'Pwyswch hir i ddatgloi';

  @override
  String get off => 'I ffwrdd';

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
  String get bitrateOverride => 'Diystyru Bitrate';

  @override
  String get audioDelay => 'Oedi Sain';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Oedi Isdeitl';

  @override
  String get reset => 'Ailosod';

  @override
  String get unknown => 'Anhysbys';

  @override
  String get playbackInformation => 'Gwybodaeth Chwarae';

  @override
  String get playback => 'Chwarae yn ôl';

  @override
  String get playMethod => 'Dull Chwarae';

  @override
  String get directPlay => 'Chwarae Uniongyrchol';

  @override
  String get directStream => 'Ffrwd Uniongyrchol';

  @override
  String get transcoding => 'Trawsgodio';

  @override
  String get transcodeReasons => 'Rhesymau Trawsgodio';

  @override
  String get player => 'Chwaraewr';

  @override
  String get container => 'Cynhwysydd';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Fideo';

  @override
  String get resolution => 'Datrysiad';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Cyfradd Fideo';

  @override
  String get track => 'Trac';

  @override
  String get channels => 'Sianeli';

  @override
  String get audioBitrate => 'Bitrate Sain';

  @override
  String get sampleRate => 'Cyfradd Sampl';

  @override
  String get format => 'Fformat';

  @override
  String get external => 'Allanol';

  @override
  String get embedded => 'Gwreiddio';

  @override
  String castSessionError(String protocol) {
    return '$protocol gwall sesiwn';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Wedi methu llwytho manylion y llyfr: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Nid yw mewn-app rendro EPUB ar gael ar y platfform hwn eto.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Ni all y fformat hwn (.$extension) gael ei rendro yn yr ap eto.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Nid yw rendrad dogfen wedi\'i fewnosod ar gael ar y platfform hwn.';

  @override
  String get couldNotOpenExternalViewer => 'Methu agor gwyliwr allanol.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Wedi methu ag agor darllenydd mewn-app: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Mae nod tudalen eisoes wedi\'i gadw yn $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Ychwanegwyd nod tudalen: $label';
  }

  @override
  String get noBookmarksYet =>
      'Dim nodau tudalen eto.\nTapiwch yr eicon nod tudalen wrth ddarllen i arbed eich safle.';

  @override
  String get noTableOfContentsAvailable => 'Dim tabl cynnwys ar gael';

  @override
  String pageLabel(int number) {
    return 'Tudalen $number';
  }

  @override
  String get position => 'Swydd';

  @override
  String get bookReader => 'Darllenydd Llyfrau';

  @override
  String formatExtension(String extension) {
    return 'Fformat: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent % darllen';
  }

  @override
  String get updating => 'Wrthi\'n diweddaru...';

  @override
  String get markUnread => 'Marcio Heb ei Ddarllen';

  @override
  String get markAsRead => 'Marciwch fel Darllen';

  @override
  String get reloadReader => 'Ail-lwytho Darllenydd';

  @override
  String get noPagesFound => 'Heb ganfod tudalennau.';

  @override
  String get failedToDecodePageImage =>
      'Wedi methu â dadgodio delwedd tudalen.';

  @override
  String resetZoom(String zoom) {
    return 'Ailosod Chwyddo (${zoom}x)';
  }

  @override
  String get singlePage => 'Tudalen Sengl';

  @override
  String get twoPageSpread => 'Lledaeniad Dwy Dudalen';

  @override
  String get addBookmark => 'Ychwanegu Nod tudalen';

  @override
  String get bookmarksEllipsis => 'Llyfrnodau...';

  @override
  String get markedAsRead => 'Wedi ei nodi fel wedi ei ddarllen';

  @override
  String get markedAsUnread => 'Wedi\'i farcio fel heb ei ddarllen';

  @override
  String failedToUpdateReadState(String error) {
    return 'Wedi methu â diweddaru cyflwr darllen: $error';
  }

  @override
  String get themeSystem => 'Thema: System';

  @override
  String get themeLight => 'Thema: Golau';

  @override
  String get themeDark => 'Thema: Tywyll';

  @override
  String get themeSepia => 'Thema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Lliwiau Gwrthdro (cynllun sefydlog)';

  @override
  String get invertColorsPdf => 'Lliwiau Gwrthdro (PDF)';

  @override
  String get preparingInAppReader => 'Wrthi\'n paratoi darllenydd mewn-app...';

  @override
  String get pdfDataNotAvailable => 'Data PDF ddim ar gael.';

  @override
  String get readerFallbackModeActive =>
      'Modd wrth gefn darllenydd yn weithredol';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Ni all y platfform hwn gynnal y peiriant dogfennau wedi\'i fewnosod ar gyfer ffeiliau $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Defnyddiwch Reload Reader ar ôl newid i darged platfform â chymorth (Android, iOS, macOS).';

  @override
  String get openExternally => 'Agor yn Allanol';

  @override
  String get noEpubChaptersFound => 'Ni chafwyd hyd i benodau EPUB.';

  @override
  String get readerNotReady => 'Darllenydd ddim yn barod.';

  @override
  String get seriesRecordings => 'Recordiadau Cyfres';

  @override
  String get now => 'Yn awr';

  @override
  String get sports => 'Chwaraeon';

  @override
  String get news => 'Newyddion';

  @override
  String get kids => 'Plant';

  @override
  String get premiere => 'Première';

  @override
  String get guideTimeline => 'Llinell Amser Canllaw';

  @override
  String failedToLoadGuide(String error) {
    return 'Wedi methu llwytho\'r canllaw: $error';
  }

  @override
  String get noChannelsFound => 'Heb ganfod sianeli';

  @override
  String get liveBadge => 'BYW';

  @override
  String get movie => 'Ffilm';

  @override
  String get removedFromFavoriteChannels => 'Wedi\'i dynnu o hoff sianeli';

  @override
  String get addedToFavoriteChannels => 'Ychwanegwyd at hoff sianeli';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Wedi methu diweddaru hoff sianel';

  @override
  String get unfavoriteChannel => 'Sianel anffafriol';

  @override
  String get favoriteChannel => 'Hoff Sianel';

  @override
  String get record => 'Cofnod';

  @override
  String get cancelRecordingAction => 'Canslo Recordio';

  @override
  String get programSetToRecord => 'Rhaglen wedi\'i gosod i gofnodi';

  @override
  String get recordingCancelled => 'Canslo\'r recordiad';

  @override
  String get unableToCreateRecording => 'Methu creu recordiad';

  @override
  String get watch => 'Gwylio';

  @override
  String get close => 'Cau';

  @override
  String failedToPlayChannel(String name) {
    return 'Wedi methu chwarae $name';
  }

  @override
  String get failedToLoadRecordings => 'Wedi methu llwytho recordiadau';

  @override
  String get scheduledInNext24Hours => 'Wedi\'i amserlennu yn y 24 awr nesaf';

  @override
  String get recentRecordings => 'Recordiadau Diweddar';

  @override
  String get tvSeries => 'Cyfres Deledu';

  @override
  String get failedToLoadSchedule => 'Wedi methu llwytho\'r amserlen';

  @override
  String get noScheduledRecordings => 'Dim recordiadau wedi\'u hamserlennu';

  @override
  String get cancelRecording => 'Canslo Recordio?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Canslo recordiad wedi\'i amserlennu o \"$name\"?';
  }

  @override
  String get no => 'Nac ydw';

  @override
  String get yesCancel => 'Ydw, Diddymu';

  @override
  String get failedToCancelRecording => 'Wedi methu canslo recordiad';

  @override
  String get failedToLoadSeriesRecordings =>
      'Wedi methu llwytho recordiadau cyfres';

  @override
  String get noSeriesRecordings => 'Dim recordiadau cyfres';

  @override
  String get cancelSeriesRecording => 'Canslo Recordio Cyfres';

  @override
  String get cancelSeriesRecordingQuestion => 'Canslo Recordio Cyfres?';

  @override
  String stopRecordingName(String name) {
    return 'Stopio recordio \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Wedi methu canslo recordiad cyfres';

  @override
  String get searchThisLibrary => 'Chwiliwch y llyfrgell hon...';

  @override
  String get searchEllipsis => 'Chwilio...';

  @override
  String noResultsForQuery(String query) {
    return 'Dim canlyniadau ar gyfer \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Methodd y chwiliad: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Math o Gyfrif Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lleol';

  @override
  String get savedMedia => 'Cyfryngau wedi\'u Cadw';

  @override
  String get tvShows => 'Sioeau Teledu';

  @override
  String get music => 'Cerddoriaeth';

  @override
  String get musicAlbums => 'Albymau Cerddoriaeth';

  @override
  String get noMediaInFilter => 'Dim cyfrwng yn yr hidlydd hwn';

  @override
  String get noDownloadedMediaYet => 'Dim cyfryngau wedi\'u llwytho i lawr eto';

  @override
  String get browseLibrary => 'Pori\'r Llyfrgell';

  @override
  String get deleteDownload => 'Dileu Dadlwythiad';

  @override
  String removeItemAndFiles(String name) {
    return 'Tynnu \"$name\" a\'i ffeiliau?';
  }

  @override
  String tracksCount(int count) {
    return '$count traciau';
  }

  @override
  String get album => 'Albwm';

  @override
  String get playAlbum => 'Chwarae Albwm';

  @override
  String failedToLoadAlbum(String error) {
    return 'Wedi methu llwytho albwm: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Ni chanfuwyd unrhyw draciau wedi\'u lawrlwytho ar gyfer $name.';
  }

  @override
  String get season => 'Tymor';

  @override
  String get errorLoadingEpisodes => 'Gwall wrth lwytho penodau';

  @override
  String get noDownloadedEpisodes => 'Dim penodau wedi\'u llwytho i lawr';

  @override
  String get deleteEpisode => 'Dileu Pennod';

  @override
  String removeName(String name) {
    return 'Tynnu \"$name\"?';
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
    return 'Pennod $number';
  }

  @override
  String get seriesNotFound => 'Cyfres heb ei chanfod';

  @override
  String get errorLoadingSeries => 'Gwall wrth lwytho\'r gyfres';

  @override
  String get downloadedEpisodes => 'Penodau wedi\'u Lawrlwytho';

  @override
  String seasonNumber(int number) {
    return 'Tymor $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Cwnstabliaid arbennig';

  @override
  String get deleteSeason => 'Dileu Tymor';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Dileu pob pennod sydd wedi\'i lawrlwytho yn $season?';
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
  String get storageManagement => 'Rheoli Storio';

  @override
  String get storageBreakdown => 'Chwalfa Storio';

  @override
  String get downloadedItems => 'Eitemau wedi\'u Lawrlwytho';

  @override
  String get storageLimit => 'Terfyn Storio';

  @override
  String get noLimit => 'Dim terfyn';

  @override
  String get deleteAllDownloads => 'Dileu Pob Lawrlwythiad';

  @override
  String get deleteAllDownloadsWarning =>
      'Bydd hyn yn cael gwared ar yr holl ffeiliau cyfryngau wedi\'u llwytho i lawr ac ni ellir eu dadwneud.';

  @override
  String get deleteAll => 'Dileu Pawb';

  @override
  String get deleteSelected => 'Dileu Wedi\'i Ddewis';

  @override
  String deleteSelectedCount(int count) {
    return 'Dileu eitemau wedi\'u llwytho i lawr $count?';
  }

  @override
  String get musicAndAudiobooks => 'Cerddoriaeth a Llyfrau Llafar';

  @override
  String get images => 'Delweddau';

  @override
  String get database => 'Cronfa Ddata';

  @override
  String ofStorageLimit(String limit) {
    return 'o derfyn $limit';
  }

  @override
  String get settings => 'Gosodiadau';

  @override
  String get authentication => 'Dilysu';

  @override
  String get autoLoginServerManagement =>
      'Mewngofnodi awtomatig, rheoli gweinydd';

  @override
  String get pinCode => 'Cod PIN';

  @override
  String get setUpPinCodeProtection => 'Sefydlu amddiffyniad cod PIN';

  @override
  String get parentalControls => 'Rheolaethau Rhieni';

  @override
  String get contentRatingRestrictions => 'Cyfyngiadau graddio cynnwys';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, datrys, ymddygiad';

  @override
  String get languageSizeAppearance => 'Iaith, maint, ymddangosiad';

  @override
  String get qualityStorage => 'Ansawdd, storio';

  @override
  String get serverSyncAndPluginStatus => 'Statws cysoni gweinydd a ategyn';

  @override
  String get mediaRequestIntegration => 'Integreiddio ceisiadau cyfryngau';

  @override
  String get switchServer => 'Newid Gweinydd';

  @override
  String get signOut => 'Arwyddo Allan';

  @override
  String get versionLicenses => 'Fersiwn, trwyddedau';

  @override
  String get account => 'Cyfrif';

  @override
  String get signInAndSecurity => 'Mewngofnodi a diogelwch';

  @override
  String get administration => 'Gweinyddiaeth';

  @override
  String get serverSettingsUsersLibraries =>
      'Gosodiadau gweinydd, defnyddwyr, llyfrgelloedd';

  @override
  String get customization => 'Addasu';

  @override
  String get themeAndLayout => 'Thema a gosodiad';

  @override
  String get videoAndSubtitles => 'Fideo ac isdeitlau';

  @override
  String get integrations => 'Integreiddiadau';

  @override
  String get pluginAndRequests => 'Ategyn a cheisiadau';

  @override
  String get customizeAccountPlaybackInterface =>
      'Addasu cyfrif, chwarae, ac ymddygiad rhyngwyneb';

  @override
  String optionsCount(int count) {
    return 'opsiynau $count';
  }

  @override
  String get themeAndAppearance => 'Thema ac Ymddangosiad';

  @override
  String get focusBorderColor => 'Lliw Ffin Ffocws';

  @override
  String get watchedIndicators => 'Dangosyddion Gwylio';

  @override
  String get always => 'Bob amser';

  @override
  String get hideUnwatched => 'Cuddio Heb ei wylio';

  @override
  String get episodesOnly => 'Penodau yn Unig';

  @override
  String get never => 'Byth';

  @override
  String get focusExpansionAnimation => 'Animeiddiad Ehangu Ffocws';

  @override
  String get desktopUiScale => 'Graddfa UI bwrdd gwaith';

  @override
  String get scaleFocusedCards =>
      'Cardiau a theils â ffocws ar raddfa neu hofran';

  @override
  String get backgroundBackdrops => 'Cefndir Cefndir';

  @override
  String get showBackdropImages =>
      'Dangos delweddau cefndir y tu ôl i\'r cynnwys';

  @override
  String get seriesThumbnails => 'Mân-luniau Cyfres';

  @override
  String get seriesThumbnailsDescription =>
      'Penodau yn unig: defnyddiwch waith celf cyfres sy\'n cyfateb i bob math o ddelwedd rhes';

  @override
  String get homeRowInfoOverlay => 'Troshaen Gwybodaeth Rhes Gartref';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Dangos teitl a metadata wrth bori rhesi cartref';

  @override
  String get clockDisplay => 'Arddangosfa Cloc';

  @override
  String get inMenus => 'Mewn Bwydlenni';

  @override
  String get inVideo => 'Mewn Fideo';

  @override
  String get seasonalEffects => 'Effeithiau Tymhorol';

  @override
  String get seasonalEffectsDescription =>
      'Effeithiau gweledol ac addurniadau tymhorol';

  @override
  String get snow => 'Eira';

  @override
  String get fireworks => 'Tân gwyllt';

  @override
  String get confetti => 'Conffeti';

  @override
  String get fallingLeaves => 'Dail yn Cwympo';

  @override
  String get themeMusic => 'Cerddoriaeth Thema';

  @override
  String get playThemeMusicOnDetailPages =>
      'Chwarae cerddoriaeth thema ar dudalennau manylion';

  @override
  String get themeMusicVolume => 'Cyfrol Cerddoriaeth Thema';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Cerddoriaeth Thema ar Rhesi Cartref';

  @override
  String get playWhenBrowsingHomeScreen => 'Chwarae wrth bori\'r sgrin gartref';

  @override
  String get detailsBackgroundBlur => 'Manylion Blur Cefndir';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Blur Cefndir Pori';

  @override
  String get maxStreamingBitrate => 'Bitrate Ffrydio Uchaf';

  @override
  String get maxResolution => 'Cydraniad Uchaf';

  @override
  String get playerZoomMode => 'Modd Chwyddo Chwaraewr';

  @override
  String get fit => 'Ffit';

  @override
  String get autoCrop => 'Cnwd Auto';

  @override
  String get stretch => 'Ymestyn';

  @override
  String get refreshRateSwitching => 'Newid Cyfradd Adnewyddu';

  @override
  String get disabled => 'Anabl';

  @override
  String get scaleOnTv => 'Graddfa ar y teledu';

  @override
  String get scaleOnDevice => 'Graddfa ar Ddychymyg';

  @override
  String get trickPlay => 'Chwarae Trick';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Dangos mân-luniau rhagolwg wrth geisio';

  @override
  String get showDescriptionOnPause => 'Dangos Disgrifiad ar Saib';

  @override
  String get dimVideoShowOverview =>
      'Pylu\'r fideo a dangos testun trosolwg wrth oedi';

  @override
  String get osdLockButton => 'Botwm Clo OSD';

  @override
  String get osdLockButtonDescription =>
      'Dangoswch fotwm clo sy\'n rhwystro mewnbwn cyffwrdd nes ei fod wedi\'i wasgu\'n hir';

  @override
  String get audioBehavior => 'Ymddygiad Clywedol';

  @override
  String get downmixToStereo => 'Downmix i Stereo';

  @override
  String get defaultAudioLanguage => 'Iaith Sain Ragosodedig';

  @override
  String get autoServerDefault => 'Awto (Diofyn Gweinydd)';

  @override
  String get english => 'Saesneg';

  @override
  String get spanish => 'Sbaeneg';

  @override
  String get french => 'Ffrangeg';

  @override
  String get german => 'Almaeneg';

  @override
  String get italian => 'Eidaleg';

  @override
  String get portuguese => 'Portiwgaleg';

  @override
  String get japanese => 'Japaneaidd';

  @override
  String get korean => 'Corëeg';

  @override
  String get chinese => 'Tsieineaidd';

  @override
  String get russian => 'Rwsiaidd';

  @override
  String get arabic => 'Arabeg';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'Iseldireg';

  @override
  String get swedish => 'Swedeg';

  @override
  String get norwegian => 'Norwyaidd';

  @override
  String get danish => 'Daneg';

  @override
  String get finnish => 'Ffinneg';

  @override
  String get polish => 'Pwyleg';

  @override
  String get ac3Passthrough => 'Llwybr trwodd AC3';

  @override
  String get dtsPassthrough => 'Llwybr DTS';

  @override
  String get trueHdSupport => 'Cefnogaeth TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Sain Bitstream DTS i AVR yn unig; angen cefnogaeth derbynnydd a thrac ffynhonnell DTS';

  @override
  String get enableTrueHdAudio =>
      'Galluogi sain TrueHD (efallai na fydd yn gweithio ar bob platfform)';

  @override
  String get settingsAudioOutputMode => 'Modd Allbwn Sain';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Codec Sain Wrth Gefn';

  @override
  String get settingsAudioFallbackAacStereo => 'Stereo AAC';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Uwch)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Galluogi dim ond fformatau y mae eich sinc AVR neu HDMI yn eu cefnogi.';

  @override
  String get settingsAudioEac3Passthrough => 'Llwybr EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) Passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'Llwybr Craidd DTS';

  @override
  String get settingsAudioDtsHdPassthrough => 'Llwybr drwodd MA DTS-HD';

  @override
  String get settingsAudioTrueHdPassthrough => 'Gwir HD Passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'Passthrough Atmos TrueHD';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) i ddatgodiwr allanol.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos dros EAC3 (JOC) i ddatgodiwr allanol.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (yn cynnwys craidd DTS) i ddatgodiwr allanol.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD gyda metadata Atmos i ddatgodiwr allanol.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Galluoedd Sain Wedi\'u Canfod';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Dim ciplun gallu runtime ar gael eto.';

  @override
  String get settingsAudioRouteLabel => 'Llwybr';

  @override
  String get settingsAudioDecodeLabel => 'Dadgodio';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Llwybr sain HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Llefarydd';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnosteg';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Lefel Fideo';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Ystod Fideo';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Is-deitl Codec';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Codecs Sain a Ganiateir';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Codec Sain HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Codec Sain HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'sain-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Llwybr Sain Actif';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Cefnogaeth Sain Llwybr HD';

  @override
  String get nightMode => 'Modd Nos';

  @override
  String get compressDynamicRange => 'Cywasgu ystod ddeinamig';

  @override
  String get advancedMpv => 'mpv uwch';

  @override
  String get enableCustomMpvConf => 'Galluogi Custom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Defnyddiwch mpv.conf a bennir gan y defnyddiwr cyn dechrau chwarae';

  @override
  String get unsafeAdvancedMpvOptions => 'Opsiynau mpv Uwch Anniogel';

  @override
  String get unsafeMpvOptionsDescription =>
      'Caniatáu set ehangach o opsiynau mpv. Gall dorri ymddygiad chwarae yn ôl.';

  @override
  String get hardwareDecoding => 'Datgodio caledwedd';

  @override
  String get hardwareDecodingSubtitle =>
      'Gall wella perfformiad ond gall achosi problemau chwarae ar rai dyfeisiau.';

  @override
  String get nextUpAndQueuing => 'Nesaf Up & Ciwio';

  @override
  String get nextUpDisplay => 'Arddangosfa Nesaf Up';

  @override
  String get extended => 'Estynedig';

  @override
  String get minimal => 'Lleiaf';

  @override
  String get nextUpTimeout => 'Goramser Nesaf Up';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Ciwio Cyfryngau';

  @override
  String get autoQueueNextEpisodes => 'Awto-ciwio penodau nesaf';

  @override
  String get stillWatchingPrompt => 'Dal i Gwylio\'n Brydlon';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Ar ôl episodau $episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Ail-ddechrau a Sgipio';

  @override
  String get resumeRewind => 'Ail-ddechrau Ailddirwyn';

  @override
  String get unpauseRewind => 'Unpause Ailddirwyn';

  @override
  String get fiveSeconds => '5 eiliad';

  @override
  String get tenSeconds => '10 eiliad';

  @override
  String get fifteenSeconds => '15 eiliad';

  @override
  String get thirtySeconds => '30 eiliad';

  @override
  String get skipBackLength => 'Nôl Hyd';

  @override
  String get skipForwardLength => 'Hepgor Hyd Ymlaen';

  @override
  String get customMpvConfPath => 'Llwybr mpv.conf Custom';

  @override
  String get notSetMpvConf =>
      'Heb ei osod. Bydd Moonfin yn ceisio mpv.conf rhagosodedig mewn ffolderi app/data.';

  @override
  String get selectMpvConf => 'Dewiswch mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Mae gosodiadau arddull (maint, lliw, gwrthbwyso) yn berthnasol i is-deitlau testun (SRT, VTT, TTML). Mae is-deitlau ASS/SSA yn defnyddio eu steilio wedi\'i fewnosod eu hunain oni bai bod \"ASS/SSA Direct Play\" wedi\'i ddiffodd. Ni ellir ail-steilio is-deitlau didfap (PGS, DVB, VobSub).';

  @override
  String get defaultSubtitleLanguage => 'Iaith Isdeitl Diofyn';

  @override
  String get defaultToNoSubtitles => 'Rhagosodedig i Dim Is-deitlau';

  @override
  String get turnOffSubtitlesByDefault => 'Diffoddwch isdeitlau yn ddiofyn';

  @override
  String get subtitleSize => 'Maint Isdeitl';

  @override
  String get textFillColor => 'Lliw Llenwch Testun';

  @override
  String get backgroundColor => 'Lliw Cefndir';

  @override
  String get textStrokeColor => 'Lliw Strôc Testun';

  @override
  String get subtitleCustomization => 'Addasu Is-deitl';

  @override
  String get subtitleCustomizationDescription => 'Addasu ymddangosiad is-deitl';

  @override
  String get subtitlePreviewText =>
      'Mae\'r llwynog brown cyflym yn neidio dros y ci diog';

  @override
  String get verticalOffset => 'Gwrthbwyso Fertigol';

  @override
  String get pgsDirectPlay => 'Chwarae Uniongyrchol PGS';

  @override
  String get directPlayPgsSubtitles => 'Isdeitlau PGS chwarae uniongyrchol';

  @override
  String get assSsaDirectPlay => 'Chwarae Uniongyrchol ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Chwarae uniongyrchol Isdeitlau ASS/SSA';

  @override
  String get white => 'Gwyn';

  @override
  String get black => 'Du';

  @override
  String get yellow => 'Melyn';

  @override
  String get green => 'Gwyrdd';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'Coch';

  @override
  String get transparent => 'Tryloyw';

  @override
  String get semiTransparentBlack => 'Du lled-dryloyw';

  @override
  String get global => 'Byd-eang';

  @override
  String get desktop => 'Penbwrdd';

  @override
  String get mobile => 'Symudol';

  @override
  String get tv => 'teledu';

  @override
  String loadedProfileSettings(String profile) {
    return 'Wedi llwytho gosodiadau proffil $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Wedi methu llwytho gosodiadau proffil $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Wedi cysoni gosodiadau lleol i broffil $profile.';
  }

  @override
  String get customizationProfile => 'Proffil Addasu';

  @override
  String get customizationProfileDescription =>
      'Dewiswch y proffil i\'w lwytho, ei olygu a\'i gysoni. Mae Global yn berthnasol ym mhobman oni bai bod proffil dyfais yn ei ddiystyru. Mae\'r dot gwyrdd yn nodi proffil eich dyfais cyfredol.';

  @override
  String get loadProfile => 'Proffil Llwyth';

  @override
  String get syncing => 'Wrthi\'n cysoni...';

  @override
  String get syncToProfile => 'Cysoni i Broffil';

  @override
  String get profileSyncHidden => 'Proffil Cysoni Cudd';

  @override
  String get enablePluginSyncDescription =>
      'Galluogi Cysoni Ategion Gweinydd mewn gosodiadau Ategyn i ddangos rheolyddion proffil yma.';

  @override
  String get quality => 'Ansawdd';

  @override
  String get defaultDownloadQuality => 'Ansawdd Llwytho i Lawr Rhagosodedig';

  @override
  String get network => 'Rhwydwaith';

  @override
  String get wifiOnlyDownloads => 'Dadlwythiadau WiFi yn Unig';

  @override
  String get onlyDownloadOnWifi =>
      'Dim ond pan fyddwch wedi cysylltu â WiFi y gallwch chi lawrlwytho';

  @override
  String get storage => 'Storio';

  @override
  String get storageUsed => 'Storio a Ddefnyddir';

  @override
  String get manage => 'Rheoli';

  @override
  String get calculating => 'Wrthi\'n cyfrifo...';

  @override
  String get downloadLocation => 'Lleoliad Lawrlwytho';

  @override
  String get defaultLabel => 'Diofyn';

  @override
  String get saveToDownloadsFolder => 'Cadw i ffolder Lawrlwythiadau';

  @override
  String get downloadsVisibleToOtherApps =>
      'Lawrlwythiadau / Moonfin - yn weladwy i apiau eraill';

  @override
  String get dangerZone => 'Parth Perygl';

  @override
  String get clearAllDownloads => 'Clirio Pob Lawrlwythiad';

  @override
  String get original => 'Gwreiddiol';

  @override
  String get changeDownloadLocation => 'Newid Lleoliad Lawrlwytho';

  @override
  String get changeDownloadLocationDescription =>
      'Bydd lawrlwythiadau newydd yn cael eu cadw i\'r ffolder a ddewiswyd. Bydd lawrlwythiadau presennol yn aros yn eu lleoliad presennol a gellir eu rheoli o osodiadau Storio.';

  @override
  String get confirm => 'Cadarnhau';

  @override
  String get cannotWriteToFolder =>
      'Methu ysgrifennu i\'r ffolder a ddewiswyd. Dewiswch leoliad gwahanol neu rhowch ganiatâd storio.';

  @override
  String get saveToDownloadsFolderQuestion => 'Cadw i ffolder Lawrlwythiadau?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Bydd cyfryngau wedi\'u lawrlwytho yn cael eu cadw i Lawrlwythiadau / Moonfin ar eich dyfais. Bydd y ffeiliau hyn yn weladwy i apiau eraill fel eich oriel neu chwaraewr cerddoriaeth.\n\nBydd lawrlwythiadau presennol yn aros yn eu lleoliad presennol.';

  @override
  String get enable => 'Galluogi';

  @override
  String get clearAllDownloadsWarning =>
      'Bydd hyn yn dileu\'r holl gyfryngau sydd wedi\'u llwytho i lawr ac ni ellir eu dadwneud.';

  @override
  String get clearAll => 'Clirio Pawb';

  @override
  String get navigationStyle => 'Arddull Llywio';

  @override
  String get topBar => 'Bar Uchaf';

  @override
  String get leftSidebar => 'Bar Ochr Chwith';

  @override
  String get showShuffleButton => 'Dangos y Botwm Shuffle';

  @override
  String get showGenresButton => 'Botwm Dangos Genres';

  @override
  String get showFavoritesButton => 'Dangos y Botwm Ffefrynnau';

  @override
  String get showLibrariesInToolbar => 'Dangos Llyfrgelloedd yn y Bar Offer';

  @override
  String get navbarOpacity => 'Anhryloywder Navbar';

  @override
  String get navbarColor => 'Lliw Navbar';

  @override
  String get gray => 'Llwyd';

  @override
  String get darkBlue => 'Glas Tywyll';

  @override
  String get purple => 'Porffor';

  @override
  String get teal => 'Corhwyaid';

  @override
  String get navy => 'Llynges';

  @override
  String get charcoal => 'Golosg';

  @override
  String get brown => 'Brown';

  @override
  String get darkRed => 'Coch Tywyll';

  @override
  String get darkGreen => 'Gwyrdd Tywyll';

  @override
  String get slate => 'Llechen';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Arddangosfa Llyfrgell';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Mân-lun';

  @override
  String get bannerLabel => 'Baner';

  @override
  String get overridePerLibrarySettings =>
      'Diystyru Gosodiadau Fesul Llyfrgell';

  @override
  String get applyImageTypeToAllLibraries =>
      'Cymhwyso math o ddelwedd i bob llyfrgell';

  @override
  String get multiServerLibraries => 'Llyfrgelloedd Aml-Gweinydd';

  @override
  String get showLibrariesFromAllServers =>
      'Dangos llyfrgelloedd o bob gweinydd cysylltiedig';

  @override
  String get enableFolderView => 'Galluogi Gweld Ffolder';

  @override
  String get showFolderBrowsingOption => 'Dangos opsiwn pori ffolder';

  @override
  String get libraryVisibility => 'Gwelededd Llyfrgell';

  @override
  String get libraryVisibilityDescription =>
      'Toglo gwelededd tudalen gartref fesul llyfrgell. Ailgychwyn Moonfin i newidiadau ddod i rym.';

  @override
  String get showInNavigation => 'Dangos yn llywio';

  @override
  String get showInLatestMedia => 'Dangoswch yn y cyfryngau diweddaraf';

  @override
  String get sourceLibraries => 'Llyfrgelloedd Ffynhonnell';

  @override
  String get sourceCollections => 'Casgliadau Ffynonellau';

  @override
  String get excludedGenres => 'Genres Eithriedig';

  @override
  String get selectAll => 'Dewiswch Pawb';

  @override
  String itemsSelected(int count) {
    return '$count wedi\'i ddewis';
  }

  @override
  String get mediaBar => 'Bar Cyfryngau';

  @override
  String get mediaSources => 'Ffynonellau Cyfryngau';

  @override
  String get behavior => 'Ymddygiad';

  @override
  String get seconds => 'eiliadau';

  @override
  String get localPreviews => 'Rhagolygon Lleol';

  @override
  String get localPreviewsDescription =>
      'Ffurfweddu rhagolygiadau rhaghysbysebion trelar, cyfryngau a sain.';

  @override
  String get mediaBarMode => 'Arddull Bar Cyfryngau';

  @override
  String get mediaBarModeDescription =>
      'Dewiswch rhwng Moonfin, MakD, neu trowch y bar cyfryngau i ffwrdd';

  @override
  String get mediaBarModeMoonfin => 'Lleuad';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'I ffwrdd';

  @override
  String get enableMediaBar => 'Galluogi Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Dangos sioe sleidiau cynnwys dan sylw ar y cartref';

  @override
  String get contentType => 'Math o Gynnwys';

  @override
  String get moviesAndTvShows => 'Ffilmiau a Sioeau Teledu';

  @override
  String get moviesOnly => 'Ffilmiau yn Unig';

  @override
  String get tvShowsOnly => 'Sioeau Teledu yn Unig';

  @override
  String get itemCount => 'Cyfrif Eitem';

  @override
  String get noneSelected => 'Dim wedi\'i ddewis';

  @override
  String get noneExcluded => 'Dim wedi\'u heithrio';

  @override
  String get autoAdvance => 'Auto Ymlaen';

  @override
  String get autoAdvanceSlides => 'Symud ymlaen yn awtomatig i\'r sleid nesaf';

  @override
  String get autoAdvanceInterval => 'Cyfwng Ymlaen Llaw';

  @override
  String get trailerPreview => 'Rhagolwg Trelar';

  @override
  String get autoPlayTrailers =>
      'Trelars chwarae\'n awtomatig yn y bar cyfryngau ar ôl 3 eiliad';

  @override
  String get episodePreview => 'Rhagolwg o Bennod';

  @override
  String get mediaPreview => 'Rhagolwg Cyfryngau';

  @override
  String get episodePreviewDescription =>
      'Chwaraewch ragolwg mewn-lein 30 eiliad ar gardiau â ffocws, hofran neu bwysau hir';

  @override
  String get mediaPreviewDescription =>
      'Chwaraewch ragolwg mewn-lein 30 eiliad ar gardiau â ffocws, hofran neu bwysau hir';

  @override
  String get previewAudio => 'Rhagolwg Sain';

  @override
  String get enablePreviewAudio =>
      'Galluogi sain ar gyfer rhagolygiadau rhaghysbysebion a rhaghysbysebion';

  @override
  String get latestMedia => 'Cyfryngau Diweddaraf';

  @override
  String get recentlyReleased => 'Rhyddhawyd yn Ddiweddar';

  @override
  String get myMedia => 'Fy Cyfryngau';

  @override
  String get myMediaSmall => 'Fy Nghyfryngau (Bach)';

  @override
  String get continueWatching => 'Parhewch i Wylio';

  @override
  String get resumeAudio => 'Ail-ddechrau Sain';

  @override
  String get resumeBooks => 'Ail-ddechrau Llyfrau';

  @override
  String get activeRecordings => 'Recordiadau Gweithredol';

  @override
  String get playlists => 'Rhestrau chwarae';

  @override
  String get liveTV => 'Teledu byw';

  @override
  String get homeSections => 'Adrannau Cartref';

  @override
  String get resetToDefaults => 'Ailosod i ragosodiadau';

  @override
  String get homeRowPosterSize => 'Maint Poster Rhes Gartref';

  @override
  String get perRowImageTypeSelection => 'Dewis Math Delwedd Fesul Rhes';

  @override
  String get configureImageTypeForEachRow =>
      'Ffurfweddu math o ddelwedd ar gyfer pob rhes gartref sydd wedi\'i galluogi';

  @override
  String get mergeContinueWatchingAndNextUp => 'Uno Parhau i Gwylio a Nesaf Up';

  @override
  String get combineBothRows => 'Cyfunwch y ddwy res yn un adran gartref';

  @override
  String get perRowImageType => 'Math Delwedd Fesul Rhes';

  @override
  String get perRowSettings => 'Gosodiadau Fesul Rhes';

  @override
  String get autoLogin => 'Mewngofnodi Awtomatig';

  @override
  String get lastUser => 'Defnyddiwr Diwethaf';

  @override
  String get specificUser => 'Defnyddiwr Penodol';

  @override
  String get alwaysAuthenticate => 'Dilysu bob amser';

  @override
  String get requirePasswordWithToken =>
      'Angen cyfrinair hyd yn oed gyda tocyn storio';

  @override
  String get confirmExit => 'Cadarnhau Ymadael';

  @override
  String get showConfirmationBeforeExiting => 'Dangos cadarnhad cyn gadael';

  @override
  String get blockContentWithRatings =>
      'Rhwystro cynnwys gyda\'r graddfeydd canlynol:';

  @override
  String get noContentRatingsFound =>
      'Ni chanfuwyd graddfeydd cynnwys ar y gweinydd hwn eto.';

  @override
  String get couldNotLoadServerRatings =>
      'Methu llwytho graddfeydd gweinydd. Yn dangos graddfeydd sydd wedi\'u cadw yn unig.';

  @override
  String get couldNotRefreshRatings =>
      'Methu ag adnewyddu graddfeydd o\'r gweinydd. Yn dangos graddfeydd sydd wedi\'u cadw.';

  @override
  String get enablePinCode => 'Galluogi Cod PIN';

  @override
  String get requirePinToAccess => 'Mae angen PIN i gael mynediad i\'ch cyfrif';

  @override
  String get changePin => 'Newid PIN';

  @override
  String get setNewPinCode => 'Gosod cod PIN newydd';

  @override
  String get removePin => 'Dileu PIN';

  @override
  String get removePinProtection => 'Dileu amddiffyniad cod PIN';

  @override
  String get screensaver => 'Arbedwr sgrin';

  @override
  String get inAppScreensaver => 'Arbedwr Sgrin Mewn-App';

  @override
  String get enableBuiltInScreensaver => 'Galluogi\'r arbedwr sgrin adeiledig';

  @override
  String get mode => 'Modd';

  @override
  String get libraryArt => 'Celf Llyfrgell';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Cloc';

  @override
  String get timeout => 'Goramser';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Lefel pylu';

  @override
  String get maxAgeRating => 'Sgôr Oed Uchaf';

  @override
  String get any => 'Unrhyw';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Angen Sgôr Oedran';

  @override
  String get onlyShowRatedContent => 'Dangos cynnwys sydd â sgôr yn unig';

  @override
  String get showClock => 'Dangos Cloc';

  @override
  String get displayClockDuringScreensaver =>
      'Arddangos cloc yn ystod arbedwr sgrin';

  @override
  String get rottenTomatoesCritics => 'Tomatos pwdr (beirniaid)';

  @override
  String get rottenTomatoesAudience => 'Tomatos pwdr (Cynulleidfa)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritig';

  @override
  String get metacriticUser => 'Metacritig (Defnyddiwr)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Blwch llythyrau';

  @override
  String get myAnimeList => 'FyRhestr Anime';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Ardrethu Cymunedol';

  @override
  String get ratings => 'Graddfeydd';

  @override
  String get additionalRatings => 'Graddfeydd Ychwanegol';

  @override
  String get showMdbListAndTmdbRatings => 'Dangos graddfeydd MDBList a TMDB';

  @override
  String get ratingLabels => 'Labeli Graddio';

  @override
  String get showLabelsNextToIcons => 'Dangos labeli wrth ymyl eiconau graddio';

  @override
  String get ratingBadges => 'Bathodynnau Graddio';

  @override
  String get showDecorativeBadges =>
      'Dangos bathodynnau addurniadol y tu ôl i\'r sgôr';

  @override
  String get episodeRatings => 'Graddau Pennod';

  @override
  String get showRatingsOnEpisodes => 'Dangos graddfeydd ar benodau unigol';

  @override
  String get ratingSources => 'Ffynonellau Graddio';

  @override
  String get ratingSourcesDescription =>
      'Galluogi ac aildrefnu\'r ffynonellau graddio a ddangosir trwy\'r ap';

  @override
  String get pluginLabel => 'Ategyn';

  @override
  String get pluginDetected => 'Ategyn Wedi\'i Ganfod';

  @override
  String get pluginNotDetected => 'Ategyn Heb ei Ganfod';

  @override
  String get pluginDetectedDescription =>
      'Wedi canfod ategyn gweinydd. Mae cysoni wedi\'i alluogi\'n awtomatig y tro cyntaf y darganfyddir yr ategyn.';

  @override
  String get pluginNotDetectedDescription =>
      'Nid yw ategyn gweinydd wedi\'i ganfod ar hyn o bryd. Mae gosodiadau lleol yn dal i ddefnyddio eu gwerthoedd sydd wedi\'u cadw neu eu rhagosodiadau adeiledig.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nFersiwn: $version';
  }

  @override
  String get availableServices => 'Gwasanaethau Sydd ar Gael';

  @override
  String get serverPluginSync => 'Cysoni Ategyn Gweinydd';

  @override
  String get syncSettingsWithPlugin =>
      'Cysoni gosodiadau gyda\'r ategyn gweinydd';

  @override
  String get whatSyncControls => 'Yr hyn sy\'n rheoli cysoni';

  @override
  String get syncControlsDescription =>
      'Mae Sync ond yn rheoli a yw gosodiadau gyda chefnogaeth ategyn yn cael eu gwthio i\'r gweinydd a\'u tynnu ohono. Mae dewis proffil a chamau cysoni proffil mewn gosodiadau Addasu pan fydd cysoni ategyn wedi\'i alluogi.';

  @override
  String get recentRequests => 'Ceisiadau Diweddar';

  @override
  String get recentlyAdded => 'Ychwanegwyd yn Ddiweddar';

  @override
  String get trending => 'Tueddu';

  @override
  String get popularMovies => 'Ffilmiau Poblogaidd';

  @override
  String get movieGenres => 'Genres Ffilm';

  @override
  String get upcomingMovies => 'Ffilmiau i ddod';

  @override
  String get studios => 'Stiwdios';

  @override
  String get popularSeries => 'Cyfres Boblogaidd';

  @override
  String get seriesGenres => 'Genres Cyfres';

  @override
  String get upcomingSeries => 'Cyfres i ddod';

  @override
  String get networks => 'Rhwydweithiau';

  @override
  String get resetRowsToDefaults => 'Ailosod rhesi i ragosodiadau';

  @override
  String get enableSeerr => 'Galluogi Seerr';

  @override
  String get showSeerrInNavigation =>
      'Dangos Seerr wrth lywio (angen ategyn gweinydd)';

  @override
  String get seerrUnavailable =>
      'Ddim ar gael oherwydd bod cefnogaeth ategyn gweinydd Seerr wedi\'i analluogi.';

  @override
  String get nsfwFilter => 'Hidlydd NSFW';

  @override
  String get hideAdultContent => 'Cuddio cynnwys oedolion yn y canlyniadau';

  @override
  String loggedInAs(String username) {
    return 'Wedi mewngofnodi fel: $username';
  }

  @override
  String get discoverRows => 'Darganfod Rhesi';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Llusgwch i aildrefnu. Galluogi neu analluogi rhesi. Wedi galluogi cysoni trefn rhesi ag ategyn Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Llusgwch i aildrefnu. Galluogi neu analluogi rhesi.';

  @override
  String get enabled => 'Galluogwyd';

  @override
  String get hidden => 'Cudd';

  @override
  String get aboutTitle => 'Ynghylch';

  @override
  String versionValue(String version) {
    return 'Fersiwn $version';
  }

  @override
  String get openSourceLicenses => 'Trwyddedau Ffynhonnell Agored';

  @override
  String get sourceCode => 'Cod Ffynhonnell';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Gwiriwch am Ddiweddariadau Nawr';

  @override
  String get checksLatestDesktopRelease =>
      'Yn gwirio\'r datganiad bwrdd gwaith diweddaraf ar gyfer y platfform hwn';

  @override
  String get youAreUpToDate => 'Rydych chi\'n gyfoes.';

  @override
  String get couldNotCheckForUpdates =>
      'Methu gwirio am ddiweddariadau ar hyn o bryd.';

  @override
  String get noCompatibleUpdate =>
      'Ni chanfuwyd pecyn diweddaru cydnaws ar gyfer y platfform hwn.';

  @override
  String get updateChecksNotSupported =>
      'Ni chefnogir gwiriadau diweddaru ar y platfform hwn.';

  @override
  String get updateNotificationsDisabled =>
      'Mae hysbysiadau diweddaru wedi\'u hanalluogi.';

  @override
  String get pleaseWaitBeforeChecking => 'Arhoswch cyn gwirio eto.';

  @override
  String get latestUpdateAlreadyShown =>
      'Mae\'r diweddariad diweddaraf eisoes wedi\'i ddangos.';

  @override
  String get updateAvailable => 'Diweddariad ar gael.';

  @override
  String updateAvailableVersion(String version) {
    return 'Diweddariad ar gael: v$version';
  }

  @override
  String get updateNotifications => 'Diweddaru Hysbysiadau';

  @override
  String get showWhenUpdatesAvailable =>
      'Dangos pryd mae diweddariadau ar gael';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Ar gael';
  }

  @override
  String get readReleaseNotes => 'Darllenwch Nodiadau Rhyddhau';

  @override
  String get downloadingUpdate => 'Wrthi\'n lawrlwytho diweddariad...';

  @override
  String get updateDownloadFailed =>
      'Wedi methu lawrlwytho\'r diweddariad. Ceisiwch eto.';

  @override
  String get openReleasesPage => 'Tudalen Rhyddhau Agored';

  @override
  String get navigation => 'Mordwyo';

  @override
  String get watchedIndicatorsBackdrops => 'Dangosyddion gwylio, cefndiroedd';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Lliw ffocws, dangosyddion gwylio, cefndiroedd';

  @override
  String get navbarStyleToolbarAppearance =>
      'Arddull bar llywio, botymau bar offer, ymddangosiad';

  @override
  String get reorderToggleHomeRows => 'Ail-archebu a toglo rhesi cartref';

  @override
  String get featuredContentAppearance => 'Cynnwys dan sylw, ymddangosiad';

  @override
  String get posterSizeImageTypeFolderView =>
      'Maint poster, math o ddelwedd, golwg ffolder';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB, a ffynonellau graddio';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Clir';

  @override
  String get browse => 'Pori';

  @override
  String get noResults => 'Dim canlyniadau';

  @override
  String get seerrAvailableStatus => 'Ar gael';

  @override
  String get seerrRequestedStatus => 'Gofynwyd';

  @override
  String itemsCount(int count) {
    return '$count Eitemau';
  }

  @override
  String get seerrSettings => 'Gosodiadau Seerr';

  @override
  String get requestMore => 'Cais Mwy';

  @override
  String get request => 'Cais';

  @override
  String get cancelRequest => 'Canslo Cais';

  @override
  String get playInMoonfin => 'Chwarae yn Moonfin';

  @override
  String requestedByName(String name) {
    return 'Cais gan $name';
  }

  @override
  String get approve => 'Cymeradwyo';

  @override
  String get declineAction => 'Dirywiad';

  @override
  String get similar => 'Tebyg';

  @override
  String get recommendations => 'Argymhellion';

  @override
  String cancelRequestForTitle(String title) {
    return 'Canslo cais am \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Canslo ceisiadau $count am \"$title\"?';
  }

  @override
  String get keep => 'Cadw';

  @override
  String get itemNotFoundInLibrary =>
      'Ni chanfuwyd yr eitem yn eich llyfrgell Moonfin';

  @override
  String get errorSearchingLibrary => 'Gwall wrth chwilio\'r llyfrgell';

  @override
  String budgetAmount(String amount) {
    return 'Cyllideb: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Refeniw: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Cais $type';
  }

  @override
  String get submitRequest => 'Cyflwyno Cais';

  @override
  String get allSeasons => 'Pob Tymhorau';

  @override
  String get advancedOptions => 'Dewisiadau Uwch';

  @override
  String get noServiceServersConfigured =>
      'Dim gweinyddion gwasanaeth wedi\'u ffurfweddu';

  @override
  String get server => 'Gweinydd';

  @override
  String get qualityProfile => 'Proffil Ansawdd';

  @override
  String get rootFolder => 'Ffolder Gwraidd';

  @override
  String get showMore => 'Dangos Mwy';

  @override
  String get appearances => 'Ymddangosiadau';

  @override
  String get crewSection => 'Criw';

  @override
  String ageValue(int age) {
    return 'oed $age';
  }

  @override
  String get noRequests => 'Dim ceisiadau';

  @override
  String get pendingStatus => 'Arfaeth';

  @override
  String get declinedStatus => 'Gwrthod';

  @override
  String get partiallyAvailable => 'Ar Gael yn Rhannol';

  @override
  String get downloadingStatus => 'Wrthi\'n llwytho i lawr';

  @override
  String get approvedStatus => 'Cymeradwy';

  @override
  String get notRequestedStatus => 'Heb ei Ofyn';

  @override
  String get blocklistedStatus => 'Wedi\'i rwystro';

  @override
  String get deletedStatus => 'Wedi\'i ddileu';

  @override
  String get tmdbScore => 'Sgôr TMDB';

  @override
  String get releaseDateLabel => 'Dyddiad Rhyddhau';

  @override
  String get firstAirDateLabel => 'Dyddiad Awyr Cyntaf';

  @override
  String get revenueLabel => 'Refeniw';

  @override
  String get runtimeLabel => 'Amser rhedeg';

  @override
  String get budgetLabel => 'Cyllideb';

  @override
  String get originalLanguageLabel => 'Iaith Wreiddiol';

  @override
  String get seasonsLabel => 'Tymhorau';

  @override
  String get episodesLabel => 'Penodau';

  @override
  String get access => 'Mynediad';

  @override
  String get add => 'Ychwanegu';

  @override
  String get address => 'Cyfeiriad';

  @override
  String get analytics => 'Dadansoddeg';

  @override
  String get catalog => 'Catalog';

  @override
  String get content => 'Cynnwys';

  @override
  String get copy => 'Copi';

  @override
  String get create => 'Creu';

  @override
  String get disable => 'Analluogi';

  @override
  String get done => 'Wedi\'i wneud';

  @override
  String get edit => 'Golygu';

  @override
  String get encoding => 'Amgodio';

  @override
  String get error => 'Gwall';

  @override
  String get forward => 'Ymlaen';

  @override
  String get general => 'Cyffredinol';

  @override
  String get go => 'Ewch';

  @override
  String get install => 'Gosod';

  @override
  String get installed => 'Wedi\'i osod';

  @override
  String get interval => 'Cyfwng';

  @override
  String get name => 'Enw';

  @override
  String get networking => 'Rhwydweithio';

  @override
  String get next => 'Nesaf';

  @override
  String get path => 'Llwybr';

  @override
  String get paused => 'Wedi seibio';

  @override
  String get permissions => 'Caniatadau';

  @override
  String get processing => 'Prosesu';

  @override
  String get profile => 'Proffil';

  @override
  String get provider => 'Darparwr';

  @override
  String get refresh => 'Adnewyddu';

  @override
  String get remote => 'Anghysbell';

  @override
  String get rename => 'Ailenwi';

  @override
  String get revoke => 'Dirymu';

  @override
  String get role => 'Rôl';

  @override
  String get root => 'Gwraidd';

  @override
  String get run => 'Rhedeg';

  @override
  String get search => 'Chwiliwch';

  @override
  String get select => 'Dewiswch';

  @override
  String get send => 'Anfon';

  @override
  String get sessions => 'Sesiynau';

  @override
  String get set => 'Gosod';

  @override
  String get status => 'Statws';

  @override
  String get stop => 'Stopio';

  @override
  String get streaming => 'Ffrydio';

  @override
  String get time => 'Amser';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Dadosod';

  @override
  String get up => 'I fyny';

  @override
  String get update => 'Diweddariad';

  @override
  String get upload => 'Llwytho i fyny';

  @override
  String get unmute => 'Dad-dewi';

  @override
  String get mute => 'Tewi';

  @override
  String get branding => 'Brandio';

  @override
  String get adminDrawerDashboard => 'Dangosfwrdd';

  @override
  String get adminDrawerAnalytics => 'Dadansoddeg';

  @override
  String get adminDrawerSettings => 'Gosodiadau';

  @override
  String get adminDrawerBranding => 'Brandio';

  @override
  String get adminDrawerUsers => 'Defnyddwyr';

  @override
  String get adminDrawerLibraries => 'Llyfrgelloedd';

  @override
  String get adminDrawerTranscoding => 'Trawsgodio';

  @override
  String get adminDrawerResume => 'Ail-ddechrau';

  @override
  String get adminDrawerStreaming => 'Ffrydio';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Dyfeisiau';

  @override
  String get adminDrawerActivity => 'Gweithgaredd';

  @override
  String get adminDrawerNetworking => 'Rhwydweithio';

  @override
  String get adminDrawerApiKeys => 'Allweddi API';

  @override
  String get adminDrawerBackups => 'Copïau wrth gefn';

  @override
  String get adminDrawerLogs => 'Logiau';

  @override
  String get adminDrawerScheduledTasks => 'Tasgau wedi\'u Trefnu';

  @override
  String get adminDrawerPlugins => 'Ategion';

  @override
  String get adminDrawerRepositories => 'Storfeydd';

  @override
  String get adminDrawerLiveTv => 'Teledu byw';

  @override
  String get adminExitTooltip => 'Gadael Gweinyddol';

  @override
  String get adminDashboardLoadFailed => 'Wedi methu llwytho dangosfwrdd';

  @override
  String get adminMediaOverview => 'Trosolwg o\'r Cyfryngau';

  @override
  String get adminMediaTotalsError =>
      'Methu llwytho cyfansymiau cyfryngau gweinydd.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Darlleniad cyflym ar faint o gynnwys sydd ar y gweinydd hwn.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Diweddariadau ategyn ar gael: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Ategion sydd angen ailgychwyn: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Tasgau a drefnwyd wedi methu: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Cofnodion rhybudd/gwall diweddar: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Dosbarthu Cyfryngau';

  @override
  String get analyticsVideoCodecs => 'Codecs Fideo';

  @override
  String get analyticsAudioCodecs => 'Codecs Sain';

  @override
  String get analyticsContainers => 'Cynwysyddion';

  @override
  String get analyticsTopGenres => 'Genres Uchaf';

  @override
  String get analyticsReleaseYears => 'Blynyddoedd Rhyddhau';

  @override
  String get analyticsContentRatings => 'Sgôr Cynnwys';

  @override
  String get analyticsRuntimeBuckets => 'Bwcedi Amser Rhedeg';

  @override
  String get analyticsFileFormats => 'Fformatau Ffeil';

  @override
  String get analyticsNoData => 'Dim Data ar Gael.';

  @override
  String get adminServerInfo => 'Gwybodaeth Gweinydd';

  @override
  String get adminRestartPending => 'Ailgychwyn Arfaeth';

  @override
  String get adminServerPaths => 'Llwybrau Gweinydd';

  @override
  String get adminServerActions => 'Gweithredoedd Gweinydd';

  @override
  String get adminRestartServer => 'Ailgychwyn Gweinydd';

  @override
  String get adminShutdownServer => 'Gweinydd Diffodd';

  @override
  String get adminScanLibraries => 'Sganio Llyfrgelloedd';

  @override
  String get adminLibraryScanStarted => 'Sgan llyfrgell wedi dechrau';

  @override
  String errorGeneric(String error) {
    return 'Gwall: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Mae ailgychwyn gweinydd ar y gweill';

  @override
  String get adminServerRebootMessage =>
      'Ailgychwyn gweinydd ar y gweill, ailgychwynwch Moonfin';

  @override
  String get adminActiveSessions => 'Sesiynau Gweithredol';

  @override
  String get adminSessionsLoadFailed => 'Wedi methu llwytho sesiynau';

  @override
  String get adminNoActiveSessions => 'Dim sesiynau gweithredol';

  @override
  String get adminRecentActivity => 'Gweithgarwch Diweddar';

  @override
  String get adminNoRecentActivity => 'Dim gweithgaredd diweddar';

  @override
  String adminCommandFailed(String error) {
    return 'Methodd y gorchymyn: $error';
  }

  @override
  String get adminSendMessage => 'Anfon Neges';

  @override
  String get adminMessageTextHint => 'Neges testun';

  @override
  String get adminSetVolume => 'Gosod Cyfrol';

  @override
  String get sessionPrev => 'Cynt';

  @override
  String get sessionRewind => 'Ailddirwyn';

  @override
  String get sessionForward => 'Ymlaen';

  @override
  String get sessionNext => 'Nesaf';

  @override
  String get sessionVolumeDown => 'Vol -';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Yn Chwarae Nawr';

  @override
  String get volume => 'Cyfrol';

  @override
  String get actions => 'Gweithredoedd';

  @override
  String get videoCodec => 'Codec Fideo';

  @override
  String get audioCodec => 'Codec Sain';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Cwblhau';

  @override
  String get direct => 'Uniongyrchol';

  @override
  String get adminDisconnect => 'Datgysylltu';

  @override
  String get adminClearDates => 'Dyddiadau clir';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Wedi methu llwytho\'r log gweithgarwch: $error';
  }

  @override
  String get adminNoActivityEntries => 'Dim cofnodion gweithgaredd';

  @override
  String get adminEditDeviceName => 'Golygu Enw\'r Dyfais';

  @override
  String get adminCustomName => 'Enw Personol';

  @override
  String get adminDeviceNameUpdated => 'Enw dyfais wedi\'i ddiweddaru';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Wedi methu diweddaru dyfais: $error';
  }

  @override
  String get adminDeleteDevice => 'Dileu Dyfais';

  @override
  String get adminDeviceDeleted => 'Dyfais wedi\'i dileu';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Wedi methu dileu dyfais: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Wedi methu llwytho dyfeisiau';

  @override
  String get adminSearchDevices => 'Chwilio dyfeisiau';

  @override
  String get adminThisDevice => 'Mae\'r Dyfais hon';

  @override
  String get adminEditName => 'Golygu Enw';

  @override
  String get adminLibrariesLoadFailed => 'Wedi methu llwytho llyfrgelloedd';

  @override
  String get adminNoLibraries => 'Dim llyfrgelloedd wedi\'u ffurfweddu';

  @override
  String get adminScanAllLibraries => 'Sganio Pob Llyfrgell';

  @override
  String get adminAddLibrary => 'Ychwanegu Llyfrgell';

  @override
  String adminScanFailed(String error) {
    return 'Wedi methu cychwyn y sgan: $error';
  }

  @override
  String get adminRenameLibrary => 'Ailenwi Llyfrgell';

  @override
  String get adminNewName => 'Enw newydd';

  @override
  String adminLibraryRenamed(String name) {
    return 'Ailenwyd y llyfrgell yn \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Wedi methu ag ailenwi: $error';
  }

  @override
  String get adminDeleteLibrary => 'Dileu Llyfrgell';

  @override
  String adminLibraryDeleted(String name) {
    return 'Llyfrgell \"$name\" wedi\'i dileu';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Wedi methu dileu\'r llyfrgell: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Wedi methu ag ychwanegu llwybr: $error';
  }

  @override
  String get adminRemovePath => 'Dileu Llwybr';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Tynnu \"$path\" o\'r llyfrgell hon?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Wedi methu tynnu\'r llwybr: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Dewisiadau llyfrgell wedi\'u cadw';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Wedi methu cadw opsiynau: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Wedi methu llwytho\'r llyfrgell';

  @override
  String get adminNoMediaPaths => 'Dim llwybrau cyfryngau wedi\'u ffurfweddu';

  @override
  String get adminAddPath => 'Ychwanegu Llwybr';

  @override
  String get adminBrowseFilesystem => 'Pori system ffeiliau gweinydd:';

  @override
  String get adminSaveOptions => 'Cadw Opsiynau';

  @override
  String get adminPreferredMetadataLanguage => 'Dewis iaith metadata';

  @override
  String get adminMetadataLanguageHint => 'e.e. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadata cod gwlad';

  @override
  String get adminMetadataCountryHint => 'e.e. Unol Daleithiau, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Mae angen enw\'r llyfrgell';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Wedi methu creu llyfrgell: $error';
  }

  @override
  String get adminLibraryName => 'Enw\'r Llyfrgell';

  @override
  String get adminSelectedPaths => 'Llwybrau a Ddewiswyd:';

  @override
  String get adminNoPathsAdded =>
      'Dim llwybrau wedi\'u hychwanegu (gellir eu hychwanegu\'n ddiweddarach)';

  @override
  String get adminCreateLibrary => 'Creu Llyfrgell';

  @override
  String get paths => 'Llwybrau:';

  @override
  String get adminDisableUser => 'Analluogi Defnyddiwr';

  @override
  String get adminEnableUser => 'Galluogi Defnyddiwr';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Analluogi $name? Ni fyddant yn gallu mewngofnodi.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Galluogi $name? Byddant yn gallu mewngofnodi eto.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Defnyddiwr \"$name\" wedi\'i analluogi';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Defnyddiwr \"$name\" wedi\'i alluogi';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Wedi methu diweddaru polisi defnyddwyr: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Wedi methu llwytho defnyddwyr';

  @override
  String get adminSearchUsers => 'Chwilio defnyddwyr';

  @override
  String get adminEditUser => 'Golygu Defnyddiwr';

  @override
  String get adminAddUser => 'Ychwanegu Defnyddiwr';

  @override
  String adminUserCreateFailed(String error) {
    return 'Wedi methu â chreu defnyddiwr: $error';
  }

  @override
  String get adminCreateUser => 'Creu Defnyddiwr';

  @override
  String get adminPasswordOptional => 'Cyfrinair (dewisol)';

  @override
  String get adminUsernameRequired => 'Ni all enw defnyddiwr fod yn wag';

  @override
  String get adminNoProfileChanges => 'Dim newidiadau proffil i\'w cadw';

  @override
  String get adminProfileSaved => 'Proffil wedi\'i gadw';

  @override
  String adminSaveFailed(String error) {
    return 'Wedi methu cadw: $error';
  }

  @override
  String get adminPermissionsSaved => 'Caniatadau wedi\'u cadw';

  @override
  String get adminPasswordsMismatch => 'Nid yw cyfrineiriau yn cyfateb';

  @override
  String adminFailed(String error) {
    return 'Wedi methu: $error';
  }

  @override
  String get adminUserLoadFailed => 'Wedi methu llwytho defnyddiwr';

  @override
  String get adminBackToUsers => 'Yn ôl i Ddefnyddwyr';

  @override
  String get adminSaveProfile => 'Cadw Proffil';

  @override
  String get adminDeleteUser => 'Dileu Defnyddiwr';

  @override
  String get admin => 'Gweinyddol';

  @override
  String get adminFullAccessWarning =>
      'Mae gan weinyddwyr fynediad cyflawn i\'r gweinydd. Caniatâ gyda gofal.';

  @override
  String get administrator => 'Gweinyddwr';

  @override
  String get adminHiddenUser => 'Defnyddiwr cudd';

  @override
  String get adminAllowMediaPlayback => 'Caniatáu chwarae cyfryngau yn ôl';

  @override
  String get adminAllowAudioTranscoding => 'Caniatáu trawsgodio sain';

  @override
  String get adminAllowVideoTranscoding => 'Caniatáu trawsgodio fideo';

  @override
  String get adminAllowRemuxing => 'Caniatáu remuxing';

  @override
  String get adminForceRemoteTranscoding =>
      'Gorfodi trawsgodio ffynhonnell bell';

  @override
  String get adminAllowContentDeletion => 'Caniatáu dileu cynnwys';

  @override
  String get adminAllowContentDownloading => 'Caniatáu lawrlwytho cynnwys';

  @override
  String get adminAllowPublicSharing => 'Caniatáu rhannu cyhoeddus';

  @override
  String get adminAllowRemoteControl =>
      'Caniatáu rheoli o bell o ddefnyddwyr eraill';

  @override
  String get adminAllowSharedDeviceControl => 'Caniatáu rheoli dyfais a rennir';

  @override
  String get adminAllowRemoteAccess => 'Caniatáu mynediad o bell';

  @override
  String get adminRemoteBitrateLimit =>
      'Terfyn cyfradd didau cleient o bell (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Gadael yn wag am ddim terfyn';

  @override
  String get adminMaxActiveSessions => 'Uchafswm sesiynau gweithredol';

  @override
  String get adminAllowLiveTvAccess => 'Caniatáu mynediad Live TV';

  @override
  String get adminAllowLiveTvManagement => 'Caniatáu rheoli Teledu Byw';

  @override
  String get adminAllowCollectionManagement => 'Caniatáu rheoli casgliadau';

  @override
  String get adminAllowSubtitleManagement => 'Caniatáu rheoli is-deitlau';

  @override
  String get adminAllowLyricManagement => 'Caniatáu rheoli telynegion';

  @override
  String get adminSavePermissions => 'Cadw Caniatâd';

  @override
  String get adminEnableAllLibraryAccess => 'Galluogi mynediad i bob llyfrgell';

  @override
  String get adminSaveAccess => 'Arbed Mynediad';

  @override
  String get adminChangePassword => 'Newid Cyfrinair';

  @override
  String get adminNewPassword => 'Cyfrinair Newydd';

  @override
  String get adminConfirmPassword => 'Cadarnhau Cyfrinair';

  @override
  String get adminSetPassword => 'Gosod Cyfrinair';

  @override
  String get adminResetPassword => 'Ailosod Cyfrinair';

  @override
  String get adminPasswordReset => 'Ailosod cyfrinair';

  @override
  String get adminPasswordUpdated => 'Cyfrinair wedi\'i ddiweddaru';

  @override
  String get adminUserSettings => 'Gosodiadau Defnyddiwr';

  @override
  String get adminLibraryAccess => 'Mynediad Llyfrgell';

  @override
  String get adminDeviceAndChannelAccess => 'Mynediad Dyfais a Sianel';

  @override
  String get adminEnableAllDevices => 'Galluogi mynediad i bob dyfais';

  @override
  String get adminEnableAllChannels => 'Galluogi mynediad i bob sianel';

  @override
  String get adminResetPasswordWarning =>
      'Bydd hyn yn dileu\'r cyfrinair. Bydd y defnyddiwr yn gallu mewngofnodi heb gyfrinair.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Dychwelodd y gweinydd HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddileu $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Defnyddiwr \"$name\" wedi\'i ddileu';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Wedi methu dileu defnyddiwr: $error';
  }

  @override
  String get adminCreateApiKey => 'Creu Allwedd API';

  @override
  String get adminAppName => 'Enw ap';

  @override
  String get adminApiKeyCreated => 'Allwedd API wedi\'i chreu';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Allwedd wedi\'i chreu\'n llwyddiannus. Ni ddychwelodd y gweinydd y tocyn. Gwiriwch allweddi API gweinydd.';

  @override
  String get adminKeyCopied => 'Copïwyd yr allwedd i\'r clipfwrdd';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Wedi methu creu allwedd: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Tocyn allwedd ar goll o ymateb y gweinydd';

  @override
  String get adminRevokeApiKey => 'Diddymu Allwedd API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Diddymu allwedd ar gyfer $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Allwedd API wedi\'i dirymu';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Wedi methu â dirymu\'r allwedd: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Wedi methu llwytho allweddi API';

  @override
  String get adminApiKeysTitle => 'Allweddi API';

  @override
  String get adminCreateKey => 'Creu Allwedd';

  @override
  String get adminNoApiKeys => 'Ni chanfuwyd allweddi API';

  @override
  String get adminUnknownApp => 'Ap Anhysbys';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Tocyn: $token\\nCrëwyd: $created';
  }

  @override
  String get adminCreatingBackup => 'Wrthi\'n creu copi wrth gefn...';

  @override
  String get adminBackupCreated => 'Crëwyd copi wrth gefn yn llwyddiannus';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Wedi methu creu copi wrth gefn: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Llwybr wrth gefn ar goll yn ymateb y gweinydd';

  @override
  String adminBackupManifest(String name) {
    return 'Maniffest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Wedi methu llwytho maniffest: $error';
  }

  @override
  String get adminConfirmRestore => 'Cadarnhau Adfer';

  @override
  String get adminRestoringBackup => 'Wrthi\'n adfer copi wrth gefn...';

  @override
  String adminRestoreFailed(String error) {
    return 'Wedi methu ag adfer copi wrth gefn: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Wedi methu llwytho copïau wrth gefn';

  @override
  String get adminCreateBackup => 'Creu copi wrth gefn';

  @override
  String get adminNoBackups => 'Heb ganfod copïau wrth gefn';

  @override
  String get adminViewDetails => 'Gweld Manylion';

  @override
  String get restore => 'Adfer';

  @override
  String get adminLogsLoadFailed => 'Wedi methu llwytho logiau gweinydd';

  @override
  String get adminNoLogFiles => 'Heb ganfod ffeiliau log';

  @override
  String get adminLogCopied => 'Copïwyd y log i\'r clipfwrdd';

  @override
  String get adminSaveLogFile => 'Cadw ffeil log';

  @override
  String adminSavedTo(String path) {
    return 'Wedi\'i gadw i $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Wedi methu cadw\'r ffeil: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Wedi methu llwytho $fileName';
  }

  @override
  String get adminSearchInLog => 'Chwilio mewn log';

  @override
  String get adminNoMatchingLines => 'Dim llinellau cyfatebol';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Wedi methu llwytho tasgau: $error';
  }

  @override
  String get adminNoScheduledTasks =>
      'Ni chanfuwyd unrhyw dasgau wedi\'u hamserlennu';

  @override
  String get adminNoTasksMatchFilter =>
      'Nid oes unrhyw dasgau yn cyfateb i\'r hidlydd cyfredol';

  @override
  String adminTaskStartFailed(String error) {
    return 'Wedi methu cychwyn tasg: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Wedi methu ag atal y dasg: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Wedi methu llwytho tasg: $error';
  }

  @override
  String get adminRunNow => 'Rhedwch Nawr';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Wedi methu cael gwared ar y sbardun: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Wedi methu ag ychwanegu sbardun: $error';
  }

  @override
  String get adminLastExecution => 'Dienyddiad Diweddaf';

  @override
  String get adminTriggers => 'Sbardunau';

  @override
  String get adminAddTrigger => 'Ychwanegu Sbardun';

  @override
  String get adminNoTriggers => 'Dim sbardunau wedi\'u ffurfweddu';

  @override
  String get adminTriggerType => 'Math Sbardun';

  @override
  String get adminTimeLimit => 'Terfyn amser (dewisol)';

  @override
  String get adminNoLimit => 'Dim terfyn';

  @override
  String adminHours(String hours) {
    return '$hours awr(au)';
  }

  @override
  String get adminDayOfWeek => 'Diwrnod yr wythnos';

  @override
  String get adminSearchPlugins => 'Chwilio ategion...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Wedi methu toglo ategyn: $error';
  }

  @override
  String get adminUninstallPlugin => 'Dadosod Ategyn';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddadosod \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Wedi methu dadosod yr ategyn: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Wedi methu gosod pecyn: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Wedi methu gosod diweddariad: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Wedi methu llwytho ategion: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Nid oes unrhyw ategion yn cyfateb i\'ch chwiliad';

  @override
  String get adminNoPluginsInstalled => 'Dim ategion wedi\'u gosod';

  @override
  String adminInstallUpdate(String version) {
    return 'Gosod diweddariad (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Wedi methu llwytho\'r catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Nid oes unrhyw becynnau yn cyfateb i\'ch chwiliad';

  @override
  String get adminNoPackagesAvailable => 'Dim pecynnau ar gael';

  @override
  String get adminExperimentalIntegration => 'Integreiddio Arbrofol';

  @override
  String get adminExperimentalWarning =>
      'Mae integreiddio gosodiadau ategyn yn dal i fod yn arbrofol. Mae\'n bosibl na fydd rhai tudalennau gosodiadau yn gywir.';

  @override
  String get continueAction => 'Parhewch';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'Bydd \"$name\" yn cael ei ddileu ar ôl ailgychwyn y gweinydd';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Wedi methu â dadosod: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Wrthi\'n diweddaru \"$name\" i v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Methu agor gosodiadau: tocyn awdur ar goll.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Wedi methu llwytho ategyn: $error';
  }

  @override
  String get adminPluginNotFound => 'Heb ganfod yr ategyn';

  @override
  String adminPluginVersion(String version) {
    return 'Fersiwn $version';
  }

  @override
  String get adminEnablePlugin => 'Galluogi Ategyn';

  @override
  String get adminPluginSettingsPage => 'Tudalen gosodiadau ategyn';

  @override
  String get adminRevisionHistory => 'Hanes Adolygu';

  @override
  String get adminNoChangelog => 'Dim changelog ar gael.';

  @override
  String get adminRemoveRepository => 'Dileu Cadwrfa';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddileu \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Wedi methu cadw ystorfeydd: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Wedi methu llwytho storfeydd: $error';
  }

  @override
  String get adminRepositoryNameHint => 'e.e. Stabl Jellyfin';

  @override
  String get adminRepositoryUrl => 'URL y storfa';

  @override
  String get adminAddEntry => 'Ychwanegu cofnod';

  @override
  String get adminInvalidUrl => 'URL annilys';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Methu llwytho gosodiadau\'r ategyn: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Methu agor $uri';
  }

  @override
  String get adminOpenInBrowser => 'Agor yn Porwr';

  @override
  String get adminOpenExternally => 'Agor yn allanol';

  @override
  String get adminGeneralSettings => 'Gosodiadau Cyffredinol';

  @override
  String get adminServerName => 'Enw gweinydd';

  @override
  String get adminPreferredMetadataCountry => 'Y wlad metadata a ffefrir';

  @override
  String get adminCachePath => 'Llwybr storfa';

  @override
  String get adminMetadataPath => 'Llwybr metadata';

  @override
  String get adminLibraryScanConcurrency => 'Llyfrgell sgan arian cyfred';

  @override
  String get adminParallelImageEncodingLimit =>
      'Terfyn amgodio delwedd gyfochrog';

  @override
  String get adminSlowResponseThreshold => 'Trothwy ymateb araf (ms)';

  @override
  String get adminBrandingSaved => 'Gosodiadau brandio wedi\'u cadw';

  @override
  String get adminBrandingLoadFailed => 'Wedi methu llwytho gosodiadau brandio';

  @override
  String get adminLoginDisclaimer => 'Ymwadiad mewngofnodi';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML wedi\'i arddangos o dan y ffurflen mewngofnodi';

  @override
  String get adminCustomCss => 'CSS personol';

  @override
  String get adminCustomCssHint =>
      'Cymhwyswyd CSS personol i\'r rhyngwyneb gwe';

  @override
  String get adminEnableSplashScreen => 'Galluogi sgrin sblash';

  @override
  String get adminStreamingSaved => 'Gosodiadau ffrydio wedi\'u cadw';

  @override
  String get adminStreamingLoadFailed =>
      'Wedi methu llwytho gosodiadau ffrydio';

  @override
  String get adminStreamingDescription =>
      'Gosod terfynau cyfradd didau ffrydio byd-eang ar gyfer cysylltiadau o bell.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Terfyn cyfradd didau cleient o bell (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Gadael yn wag neu 0 am anghyfyngedig';

  @override
  String get adminPlaybackSaved => 'Gosodiadau chwarae wedi\'u cadw';

  @override
  String get adminPlaybackLoadFailed =>
      'Wedi methu llwytho gosodiadau chwarae yn ôl';

  @override
  String get adminPlaybackTranscoding => 'Chwarae / Trawsgodio';

  @override
  String get adminHardwareAcceleration => 'Cyflymiad caledwedd';

  @override
  String get adminVaapiDevice => 'dyfais VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Galluogi amgodio caledwedd';

  @override
  String get adminEnableHardwareDecoding =>
      'Galluogi dadgodio caledwedd ar gyfer:';

  @override
  String get adminEncodingThreads => 'Edau amgodio';

  @override
  String get adminAutomatic => '0 = awtomatig';

  @override
  String get adminTranscodingTempPath => 'Trawsgodio llwybr dros dro';

  @override
  String get adminEnableFallbackFont => 'Galluogi ffont wrth gefn';

  @override
  String get adminFallbackFontPath => 'Llwybr ffont wrth gefn';

  @override
  String get adminAllowSegmentDeletion => 'Caniatáu dileu segment';

  @override
  String get adminSegmentKeepSeconds => 'Cadw segment (eiliadau)';

  @override
  String get adminThrottleBuffering => 'Byffro throttle';

  @override
  String get adminTrickplaySaved => 'Gosodiadau Trickplay wedi\'u cadw';

  @override
  String get adminTrickplayLoadFailed =>
      'Wedi methu llwytho gosodiadau trickplay';

  @override
  String get adminEnableHardwareAcceleration => 'Galluogi cyflymiad caledwedd';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Galluogi echdynnu ffrâm allweddol yn unig';

  @override
  String get adminKeyFrameSubtitle => 'Cywirdeb cyflymach ond is';

  @override
  String get adminScanBehavior => 'Sganio ymddygiad';

  @override
  String get adminProcessPriority => 'Blaenoriaeth proses';

  @override
  String get adminImageSettings => 'Gosodiadau Delwedd';

  @override
  String get adminIntervalMs => 'cyfwng (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Pa mor aml i ddal fframiau';

  @override
  String get adminWidthResolutions => 'Datrysiadau lled';

  @override
  String get adminTileWidth => 'Lled teils';

  @override
  String get adminTileHeight => 'Uchder teils';

  @override
  String get adminQualitySubtitle =>
      'Gwerthoedd is = ansawdd gwell, ffeiliau mwy';

  @override
  String get adminProcessThreads => 'edafedd proses';

  @override
  String get adminResumeSaved => 'Ail-ddechrau gosodiadau wedi\'u cadw';

  @override
  String get adminResumeLoadFailed =>
      'Wedi methu llwytho gosodiadau ailddechrau';

  @override
  String get adminResumeDescription =>
      'Ffurfweddu pryd y dylid marcio cynnwys wedi\'i chwarae\'n rhannol neu wedi\'i chwarae\'n llawn.';

  @override
  String get adminMinResumePercentage => 'Isafswm canran ailddechrau';

  @override
  String get adminMinResumeSubtitle =>
      'Rhaid chwarae cynnwys y tu hwnt i\'r ganran hon i arbed cynnydd';

  @override
  String get adminMaxResumePercentage => 'Canran ailddechrau uchaf';

  @override
  String get adminMaxResumeSubtitle =>
      'Ystyrir bod y cynnwys wedi\'i chwarae\'n llawn ar ôl y ganran hon';

  @override
  String get adminMinResumeDuration => 'Hyd ailddechrau lleiaf (eiliadau)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Ni ellir ailgodi eitemau sy\'n fyrrach na hyn';

  @override
  String get adminMinAudiobookResume =>
      'Isafswm canran ailddechrau llyfrau sain';

  @override
  String get adminMaxAudiobookResume =>
      'Uchafswm canran ailddechrau llyfrau sain';

  @override
  String get adminNetworkingSaved =>
      'Gosodiadau rhwydweithio wedi\'u cadw. Efallai y bydd angen ailgychwyn gweinydd.';

  @override
  String get adminNetworkingLoadFailed =>
      'Wedi methu llwytho gosodiadau rhwydweithio';

  @override
  String get adminNetworkingWarning =>
      'Mae\'n bosibl y bydd angen ailgychwyn gweinydd ar gyfer newidiadau i osodiadau rhwydweithio.';

  @override
  String get adminEnableRemoteAccess => 'Galluogi mynediad o bell';

  @override
  String get ports => 'Porthladdoedd';

  @override
  String get adminHttpPort => 'Porth HTTP';

  @override
  String get adminHttpsPort => 'Porth HTTPS';

  @override
  String get adminPublicHttpsPort => 'Porthladd HTTPS cyhoeddus';

  @override
  String get adminBaseUrl => 'URL sylfaen';

  @override
  String get adminBaseUrlHint => 'e.e. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Galluogi HTTPS';

  @override
  String get adminLocalNetwork => 'Rhwydwaith Lleol';

  @override
  String get adminLocalNetworkAddresses => 'Cyfeiriadau rhwydwaith lleol';

  @override
  String get adminKnownProxies => 'Dirprwyon hysbys';

  @override
  String get adminRemoteIpFilter => 'Hidlo IP o Bell';

  @override
  String get adminRemoteIpFilterEntries => 'Hidlydd IP o bell';

  @override
  String get adminCertificatePath => 'Llwybr tystysgrif';

  @override
  String get whitelist => 'Rhestr wen';

  @override
  String get blacklist => 'Rhestr ddu';

  @override
  String get notSet => 'Heb ei osod';

  @override
  String get adminMetadataSaved => 'Metadata wedi\'i gadw';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Wedi methu llwytho metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Wedi methu cadw metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Adnewyddu Metadata';

  @override
  String get recursive => 'Recursive';

  @override
  String get adminReplaceAllMetadata => 'Disodli\'r holl fetadata';

  @override
  String get adminReplaceAllImages => 'Amnewid pob delwedd';

  @override
  String get adminMetadataRefreshRequested => 'Gofynnwyd am adnewyddu metadata';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Wedi methu ag adnewyddu metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Chwilio am Berson o Bell';

  @override
  String get adminNoRemoteMatches => 'Ni chanfuwyd unrhyw barau o bell';

  @override
  String get adminRemoteResults => 'Canlyniadau o Bell';

  @override
  String get adminRemoteMetadataApplied => 'Cymhwyswyd metadata o bell';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Methodd chwiliad o bell: $error';
  }

  @override
  String get adminUpdateContentType => 'Diweddaru Math o Gynnwys';

  @override
  String get adminContentType => 'Math o gynnwys';

  @override
  String get adminContentTypeUpdated => 'Math o gynnwys wedi\'i ddiweddaru';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Wedi methu diweddaru\'r math o gynnwys: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Wedi methu llwytho golygydd metadata';

  @override
  String get adminNoPeopleEntries => 'Dim cofnodion pobl';

  @override
  String get adminNoExternalIds => 'Dim IDau allanol ar gael';

  @override
  String adminImageUpdated(String imageType) {
    return 'delwedd $imageType wedi\'i diweddaru';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Wedi methu llwytho delwedd: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Fformat delwedd heb ei gefnogi';

  @override
  String get adminImageReadFailed =>
      'Wedi methu darllen y ddelwedd a ddewiswyd';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType delwedd wedi\'i huwchlwytho';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Wedi methu uwchlwytho delwedd: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Dileu delwedd $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'delwedd $imageType wedi\'i dileu';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Wedi methu dileu delwedd: $error';
  }

  @override
  String get adminAllProviders => 'Pob darparwr';

  @override
  String get adminNoRemoteImages => 'Heb ganfod delweddau o bell';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Methwyd darganfod tiwniwr: $error';
  }

  @override
  String get adminAddTuner => 'Ychwanegu Tuner';

  @override
  String get adminTunerType => 'Math Tiwniwr';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Arall';

  @override
  String get adminUrlPath => 'URL / Llwybr';

  @override
  String get adminNameOptional => 'Enw (dewisol)';

  @override
  String get adminTunerAdded => 'Ychwanegodd tuner';

  @override
  String adminTunerAddFailed(String error) {
    return 'Wedi methu ag ychwanegu tiwniwr: $error';
  }

  @override
  String get adminAddGuideProvider => 'Ychwanegu Darparwr Canllaw';

  @override
  String get adminProviderType => 'Math o Ddarparwr';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect neu XMLTV';

  @override
  String get adminUsernameOptional => 'Enw defnyddiwr (dewisol)';

  @override
  String get adminRefreshInterval => 'Cyfnod adnewyddu (oriau)';

  @override
  String get adminProviderAdded => 'Ychwanegodd y darparwr';

  @override
  String adminProviderAddFailed(String error) {
    return 'Wedi methu ag ychwanegu darparwr: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Wedi methu tynnu\'r tiwniwr: $error';
  }

  @override
  String get adminTunerResetRequested => 'Gofynnwyd am ailosod tiwniwr';

  @override
  String adminTunerResetFailed(String error) {
    return 'Wedi methu ag ailosod tiwniwr: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Wedi methu dileu darparwr: $error';
  }

  @override
  String get adminRecordingSettings => 'Gosodiadau Recordio';

  @override
  String get adminPrePadding => 'Padin ymlaen llaw (munudau)';

  @override
  String get adminPostPadding => 'Post-padin (munudau)';

  @override
  String get adminRecordingPath => 'Llwybr cofnodi';

  @override
  String get adminSeriesRecordingPath => 'Llwybr recordio cyfres';

  @override
  String get adminRecordingSettingsSaved => 'Gosodiadau recordio wedi\'u cadw';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Wedi methu cadw gosodiadau: $error';
  }

  @override
  String get adminSetChannelMappings => 'Gosod Mapiau Sianel';

  @override
  String get adminMappingJson => 'Mapio JSON';

  @override
  String get adminMappingJsonHint => 'Enghraifft: mapiadau llwyth cyflog JSON';

  @override
  String get adminChannelMappingsUpdated => 'Mapiau sianel wedi\'u diweddaru';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Wedi methu diweddaru mapiau: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Wedi methu llwytho gweinyddiaeth Live TV';

  @override
  String get adminTunerDevices => 'Dyfeisiau Tiwniwr';

  @override
  String get adminNoTunerHosts => 'Dim gwesteiwr tiwniwr wedi\'i ffurfweddu';

  @override
  String get adminGuideProviders => 'Darparwyr Arweinwyr';

  @override
  String get adminAddProvider => 'Ychwanegu Darparwr';

  @override
  String get adminNoListingProviders =>
      'Dim darparwyr rhestru wedi\'u ffurfweddu';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Llwybr recordio: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Llwybr cyfres: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Rhag-padio: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Post-padin: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Darganfod Tiwniwr';

  @override
  String get adminChannelMappings => 'Mapiau Sianel';

  @override
  String get adminNoDiscoveredTuners => 'Dim tiwnwyr wedi\'u darganfod eto';

  @override
  String get adminSettingsSaved => 'Gosodiadau wedi\'u cadw';

  @override
  String get adminBackupsNotAvailable =>
      'Nid oes copïau wrth gefn ar gael ar y gosodiad gweinydd hwn.';

  @override
  String get adminRestoreWarning1 =>
      'Bydd adfer yn disodli POB data gweinydd presennol gyda\'r data wrth gefn.';

  @override
  String get adminRestoreWarning2 =>
      'Bydd gosodiadau gweinydd presennol, defnyddwyr, a data llyfrgell yn cael eu trosysgrifo.';

  @override
  String get adminRestoreWarning3 =>
      'Bydd y gweinydd yn ailgychwyn ar ôl ei adfer.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Adfer copi wrth gefn $name nawr?';
  }

  @override
  String get adminRestoreRequested =>
      'Cais adfer. Mae\'n bosibl y bydd ailgychwyn gweinydd yn datgysylltu\'r sesiwn hon.';

  @override
  String get adminBackupsTitle => 'Copïau wrth gefn';

  @override
  String get adminUnknownDate => 'Dyddiad anhysbys';

  @override
  String get adminUnnamedBackup => 'Copi Wrth Gefn Dienw';

  @override
  String get adminLiveTvNotAvailable =>
      'Nid yw gweinyddiaeth teledu byw ar gael ar y gosodiad gweinydd hwn.';

  @override
  String get adminLiveTvTitle => 'Gweinyddu teledu byw';

  @override
  String get adminApply => 'Ymgeisiwch';

  @override
  String get adminNotSet => 'Heb ei osod';

  @override
  String get adminReset => 'Ailosod';

  @override
  String get adminLogsTitle => 'Logiau Gweinydd';

  @override
  String get adminLogsNewestFirst => 'Diweddaraf yn Gyntaf';

  @override
  String get adminLogsOldestFirst => 'Hynaf yn Gyntaf';

  @override
  String get adminLogsJustNow => 'Dim ond nawr';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m yn ôl';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h yn ôl';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d yn ôl';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Wedi methu llwytho $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count yn cyfateb';
  }

  @override
  String get adminLogViewerNoMatches => 'Dim llinellau cyfatebol';

  @override
  String get adminMetadataEditorTitle => 'Golygydd Metadata';

  @override
  String get adminMetadataRemote => 'Anghysbell';

  @override
  String get adminMetadataType => 'Math';

  @override
  String get adminMetadataDetails => 'Manylion';

  @override
  String get adminMetadataExternalIds => 'IDau allanol';

  @override
  String get adminMetadataImages => 'Delweddau';

  @override
  String get adminMetadataFieldTitle => 'Teitl';

  @override
  String get adminMetadataFieldSortTitle => 'Teitl didoli';

  @override
  String get adminMetadataFieldOriginalTitle => 'Teitl gwreiddiol';

  @override
  String get adminMetadataFieldPremiereDate => 'Dyddiad premiere (BBBB-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Dyddiad gorffen (BBBB-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Blwyddyn gynhyrchu';

  @override
  String get adminMetadataFieldOfficialRating => 'Sgôr swyddogol';

  @override
  String get adminMetadataFieldCommunityRating => 'Sgôr gymunedol';

  @override
  String get adminMetadataFieldCriticRating => 'Gradd feirniadol';

  @override
  String get adminMetadataFieldTagline => 'Tagline';

  @override
  String get adminMetadataFieldOverview => 'Trosolwg';

  @override
  String get adminMetadataGenres => 'Genres';

  @override
  String get adminMetadataTags => 'Tagiau';

  @override
  String get adminMetadataStudios => 'Stiwdios';

  @override
  String get adminMetadataPeople => 'Pobl';

  @override
  String get adminMetadataAddGenre => 'Ychwanegu genre';

  @override
  String get adminMetadataAddTag => 'Ychwanegu tag';

  @override
  String get adminMetadataAddStudio => 'Ychwanegu stiwdio';

  @override
  String get adminMetadataAddPerson => 'Ychwanegu Person';

  @override
  String get adminMetadataEditPerson => 'Golygu Person';

  @override
  String get adminMetadataRole => 'Rôl';

  @override
  String get adminMetadataImagePrimary => 'Cynradd';

  @override
  String get adminMetadataImageBackdrop => 'Cefndir';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Baner';

  @override
  String get adminMetadataImageThumb => 'Bawd';

  @override
  String get adminMetadataRecursive => 'Recursive';

  @override
  String get adminMetadataProvider => 'Darparwr';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'delwedd $imageType wedi\'i diweddaru';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType delwedd wedi\'i huwchlwytho';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'delwedd $imageType wedi\'i dileu';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Wedi methu llwytho delwedd: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Wedi methu darllen y ddelwedd a ddewiswyd';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Wedi methu uwchlwytho delwedd: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Dileu delwedd $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Mae hyn yn tynnu\'r ddelwedd gyfredol o\'r eitem.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Wedi methu dileu delwedd: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Dewiswch ddelwedd $imageType';
  }

  @override
  String get adminMetadataUpload => 'Llwytho i fyny';

  @override
  String get adminMetadataUpdate => 'Diweddariad';

  @override
  String get adminMetadataRemoteImage => 'Delwedd o bell';

  @override
  String get adminPluginsInstalled => 'Wedi\'i osod';

  @override
  String get adminPluginsCatalog => 'Catalog';

  @override
  String get adminPluginsActive => 'Actif';

  @override
  String get adminPluginsRestart => 'Ailgychwyn';

  @override
  String get adminPluginsNoSearchResults =>
      'Nid oes unrhyw ategion yn cyfateb i\'ch chwiliad';

  @override
  String get adminPluginsNoneInstalled => 'Dim ategion wedi\'u gosod';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Diweddariad ar gael: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Diweddariad ar gael';

  @override
  String get adminPluginsPendingRemoval =>
      'Yn aros i gael ei dynnu ar ôl ailgychwyn';

  @override
  String get adminPluginsChangesPending => 'Newidiadau wrth aros am ailgychwyn';

  @override
  String get adminPluginsEnable => 'Galluogi';

  @override
  String get adminPluginsDisable => 'Analluogi';

  @override
  String get adminPluginsInstallUpdate => 'Gosod diweddariad';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Gosod diweddariad (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nid oes unrhyw becynnau yn cyfateb i\'ch chwiliad';

  @override
  String get adminPluginsCatalogEmpty => 'Dim pecynnau ar gael';

  @override
  String adminPluginsInstalling(String name) {
    return 'Mae \"$name\" yn cael ei osod...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integreiddio Arbrofol';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Mae integreiddio gosodiadau ategyn yn dal i fod yn arbrofol. Mae\'n bosibl na fydd rhai meysydd neu gynlluniau yn gywir eto.';

  @override
  String get adminPluginDetailToggle404 =>
      'Wedi methu toglo ategyn. Ni allai\'r gweinydd ddod o hyd i\'r fersiwn ategyn hwn. Ceisiwch adnewyddu ategion, yna ceisiwch eto.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Wedi methu toglo ategyn. Gwiriwch logiau gweinyddwyr am fanylion.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Gosodiadau';
  }

  @override
  String get adminPluginDetailDetails => 'Manylion';

  @override
  String get adminPluginDetailDeveloper => 'Datblygwr';

  @override
  String get adminPluginDetailRepository => 'Ystorfa';

  @override
  String get adminPluginDetailBundled => 'Wedi\'i bwndelu';

  @override
  String get adminPluginDetailEnablePlugin => 'Galluogi Ategyn';

  @override
  String get adminPluginDetailRestartRequired =>
      'Mae angen ailgychwyn gweinydd er mwyn i\'r newidiadau ddod i rym.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Bydd yr ategyn hwn yn cael ei dynnu ar ôl ailgychwyn y gweinydd.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Mae\'r ategyn hwn wedi camweithio ac efallai na fydd yn gweithio\'n gywir.';

  @override
  String get adminPluginDetailNotSupported =>
      'Nid yw fersiwn cyfredol y gweinydd yn cefnogi\'r ategyn hwn.';

  @override
  String get adminPluginDetailSuperseded =>
      'Mae\'r ategyn hwn wedi\'i ddisodli gan fersiwn mwy diweddar.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Wedi methu llwytho storfeydd: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Dileu Cadwrfa';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddileu \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Dileu';

  @override
  String adminReposSaveFailed(String error) {
    return 'Wedi methu cadw ystorfeydd: $error';
  }

  @override
  String get adminReposEmpty => 'Dim cadwrfeydd wedi\'u ffurfweddu';

  @override
  String get adminReposEmptySubtitle =>
      'Ychwanegu ystorfa i bori\'r ategion sydd ar gael';

  @override
  String get adminReposUnnamed => '(dienw)';

  @override
  String get adminReposEditTitle => 'Golygu Cadwrfa';

  @override
  String get adminReposAddTitle => 'Ychwanegu Cadwrfa';

  @override
  String get adminReposUrl => 'URL y storfa';

  @override
  String get adminReposNameHint => 'e.e. Stabl Jellyfin';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL annilys';

  @override
  String get adminGeneralSettingsTitle => 'Gosodiadau Cyffredinol';

  @override
  String get adminGeneralMetadataLanguage => 'Dewis iaith metadata';

  @override
  String get adminGeneralMetadataLanguageHint => 'e.e. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Y wlad metadata a ffefrir';

  @override
  String get adminGeneralMetadataCountryHint => 'e.e. Unol Daleithiau, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Llyfrgell sgan arian cyfred';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Terfyn amgodio delwedd gyfochrog';

  @override
  String get adminUnknownError => 'Gwall anhysbys';

  @override
  String get adminBrowse => 'Pori';

  @override
  String get adminCloseBrowser => 'Cau porwr';

  @override
  String get adminNetworkingTitle => 'Rhwydweithio';

  @override
  String get adminNetworkingRestartWarning =>
      'Mae\'n bosibl y bydd angen ailgychwyn gweinydd ar gyfer newidiadau i osodiadau rhwydweithio.';

  @override
  String get adminNetworkingRemoteAccess => 'Galluogi mynediad o bell';

  @override
  String get adminNetworkingPorts => 'Porthladdoedd';

  @override
  String get adminNetworkingHttpPort => 'Porth HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Porth HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Galluogi HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Rhwydwaith Lleol';

  @override
  String get adminNetworkingLocalAddresses => 'Cyfeiriadau rhwydwaith lleol';

  @override
  String get adminNetworkingAddressHint => 'e.e. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Dirprwyon hysbys';

  @override
  String get adminNetworkingProxyHint => 'e.e. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Rhestr wen';

  @override
  String get adminNetworkingBlacklist => 'Rhestr ddu';

  @override
  String get adminNetworkingAddEntry => 'Ychwanegu cofnod';

  @override
  String get adminBrandingTitle => 'Brandio';

  @override
  String get adminBrandingLoginDisclaimer => 'Ymwadiad mewngofnodi';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML wedi\'i arddangos o dan y ffurflen mewngofnodi';

  @override
  String get adminBrandingCustomCss => 'CSS personol';

  @override
  String get adminBrandingCustomCssHint =>
      'Cymhwyswyd CSS personol i\'r rhyngwyneb gwe';

  @override
  String get adminBrandingEnableSplash => 'Galluogi sgrin sblash';

  @override
  String get adminPlaybackHwAccel => 'Cyflymiad Caledwedd';

  @override
  String get adminPlaybackHwAccelLabel => 'Cyflymiad caledwedd';

  @override
  String get adminPlaybackEnableHwEncoding => 'Galluogi amgodio caledwedd';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Galluogi dadgodio caledwedd ar gyfer:';

  @override
  String get adminPlaybackEncoding => 'Amgodio';

  @override
  String get adminPlaybackEncodingThreads => 'Edau amgodio';

  @override
  String get adminPlaybackFallbackFont => 'Galluogi ffont wrth gefn';

  @override
  String get adminPlaybackFallbackFontPath => 'Llwybr ffont wrth gefn';

  @override
  String get adminPlaybackStreaming => 'Ffrydio';

  @override
  String get adminResumeVideo => 'Fideo';

  @override
  String get adminResumeAudiobooks => 'Llyfrau llafar';

  @override
  String get adminResumeMinAudiobookPct =>
      'Isafswm canran ailddechrau llyfrau sain';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Uchafswm canran ailddechrau llyfrau sain';

  @override
  String get adminStreamingBitrateLimit =>
      'Terfyn cyfradd didau cleient o bell (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Gadael yn wag neu 0 am anghyfyngedig';

  @override
  String get adminTrickplayHwAccel => 'Galluogi cyflymiad caledwedd';

  @override
  String get adminTrickplayHwEncoding => 'Galluogi amgodio caledwedd';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Galluogi echdynnu ffrâm allweddol yn unig';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'Cywirdeb cyflymach ond is';

  @override
  String get adminTrickplayNonBlocking => 'Di-rwystro';

  @override
  String get adminTrickplayBlocking => 'Blocio';

  @override
  String get adminTrickplayPriorityHigh => 'Uchel';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Uwchben Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Arferol';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Islaw Normal';

  @override
  String get adminTrickplayPriorityIdle => 'Segur';

  @override
  String get adminTrickplayImageSettings => 'Gosodiadau Delwedd';

  @override
  String get adminTrickplayInterval => 'cyfwng (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Pa mor aml i ddal fframiau';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Lled picsel wedi\'u gwahanu gan goma (e.e. 320)';

  @override
  String get adminTrickplayQuality => 'Ansawdd';

  @override
  String get adminTrickplayQScale => 'Graddfa ansawdd';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Gwerthoedd is = ansawdd gwell, ffeiliau mwy';

  @override
  String get adminTrickplayJpegQuality => 'Ansawdd JPEG';

  @override
  String get adminTrickplayProcessing => 'Prosesu';

  @override
  String get adminTasksEmpty =>
      'Ni chanfuwyd unrhyw dasgau wedi\'u hamserlennu';

  @override
  String get adminTasksNoFilterMatch =>
      'Nid oes unrhyw dasgau yn cyfateb i\'r hidlydd cyfredol';

  @override
  String get adminTaskCancelling => 'Wrthi\'n canslo...';

  @override
  String get adminTaskRunning => 'Yn rhedeg...';

  @override
  String get adminTaskNeverRun => 'Peidiwch byth â rhedeg';

  @override
  String get adminTaskStop => 'Stopio';

  @override
  String get adminTaskRun => 'Rhedeg';

  @override
  String get adminTaskDetailLastExecution => 'Dienyddiad Diweddaf';

  @override
  String get adminTaskDetailStarted => 'Dechreuwyd';

  @override
  String get adminTaskDetailEnded => 'Wedi dod i ben';

  @override
  String get adminTaskDetailDuration => 'Hyd';

  @override
  String get adminTaskDetailErrorLabel => 'Gwall:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Bob dydd yn $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Pob $day yn $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Pob $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Wrth gychwyn cais';

  @override
  String get adminTaskTriggerTypeDaily => 'Dyddiol';

  @override
  String get adminTaskTriggerTypeWeekly => 'Wythnosol';

  @override
  String get adminTaskTriggerTypeInterval => 'Ar egwyl';

  @override
  String get adminTaskTriggerIntervalLabel => 'Cyfwng';

  @override
  String get adminTaskTriggerEveryHour => 'Bob awr';

  @override
  String get adminTaskTriggerEvery6Hours => 'Bob 6 awr';

  @override
  String get adminTaskTriggerEvery12Hours => 'Bob 12 awr';

  @override
  String get adminTaskTriggerEvery24Hours => 'Bob 24 awr';

  @override
  String get adminTaskTriggerEvery2Days => 'Bob 2 ddiwrnod';

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
  String get adminTaskTriggerTime => 'Amser';

  @override
  String get adminTaskTriggerNoLimit => 'Dim terfyn';

  @override
  String get adminActivityJustNow => 'Dim ond nawr';

  @override
  String get adminActivityLastHour => 'Awr olaf';

  @override
  String get adminActivityToday => 'Heddiw';

  @override
  String get adminActivityYesterday => 'Ddoe';

  @override
  String get adminActivityOlder => 'Hynach';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d yn ôl';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h yn ôl';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m yn ôl';
  }

  @override
  String get adminActivityNow => 'yn awr';

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
      'Ffurfweddu cynhyrchu delwedd trickplay ar gyfer ceisio rhagolwg mân-luniau.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porthladd HTTPS cyhoeddus';

  @override
  String get adminNetworkingBaseUrl => 'URL sylfaen';

  @override
  String get adminNetworkingBaseUrlHint => 'e.e. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Llwybr tystysgrif';

  @override
  String get adminNetworkingRemoteIpFilter => 'Hidlo IP o Bell';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Hidlydd IP o bell';

  @override
  String get adminPlaybackVaapiDevice => 'dyfais VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = awtomatig';

  @override
  String get adminPlaybackTranscodeTempPath => 'Trawsgodio llwybr dros dro';

  @override
  String get adminPlaybackSegmentDeletion => 'Caniatáu dileu segment';

  @override
  String get adminPlaybackSegmentKeep => 'Cadw segment (eiliadau)';

  @override
  String get adminPlaybackThrottleBuffering => 'Byffro throttle';

  @override
  String get adminResumeMinPct => 'Isafswm canran ailddechrau';

  @override
  String get adminResumeMinPctSubtitle =>
      'Rhaid chwarae cynnwys y tu hwnt i\'r ganran hon i arbed cynnydd';

  @override
  String get adminResumeMaxPct => 'Canran ailddechrau uchaf';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Ystyrir bod y cynnwys wedi\'i chwarae\'n llawn ar ôl y ganran hon';

  @override
  String get adminResumeMinDuration => 'Hyd ailddechrau lleiaf (eiliadau)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Ni ellir ailgodi eitemau sy\'n fyrrach na hyn';

  @override
  String get adminTrickplayScanBehavior => 'Sganio ymddygiad';

  @override
  String get adminTrickplayProcessPriority => 'Blaenoriaeth proses';

  @override
  String get adminTrickplayTileWidth => 'Lled teils';

  @override
  String get adminTrickplayTileHeight => 'Uchder teils';

  @override
  String get adminTrickplayProcessThreads => 'edafedd proses';

  @override
  String get adminTrickplayWidthResolutions => 'Datrysiadau lled';

  @override
  String get adminMetadataDefault => 'Diofyn';

  @override
  String get adminMetadataContentTypeUpdated =>
      'Math o gynnwys wedi\'i ddiweddaru';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Wedi methu diweddaru\'r math o gynnwys: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Trothwy ymateb araf (ms)';

  @override
  String get adminGeneralCachePath => 'Llwybr storfa';

  @override
  String get adminGeneralMetadataPath => 'Llwybr metadata';

  @override
  String get adminGeneralServerName => 'Enw gweinydd';

  @override
  String get adminSettingsLoadFailed => 'Wedi methu llwytho gosodiadau';

  @override
  String get adminDiscover => 'Darganfod';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Wedi methu diweddaru mapiau: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Terfyn amser: $duration';
  }

  @override
  String get folders => 'Ffolderi';

  @override
  String get libraries => 'Llyfrgelloedd';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'Analluogwyd SyncPlay';

  @override
  String get syncPlayDisabledMessage =>
      'Galluogi SyncPlay mewn Gosodiadau i ddefnyddio chwarae cydamserol.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Gweinydd heb ei gefnogi';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'Mae angen gweinydd Jellyfin ar SyncPlay. Nid yw\'r gweinydd presennol yn ei gefnogi.';

  @override
  String get syncPlayGroupFallbackName => 'Grŵp SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Grŵp SyncPlay';

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
  String get syncPlayIgnoreWait => 'Anwybyddu aros';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Peidiwch â dal y grŵp i fyny tra bod y ddyfais hon yn clustogi';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Parhau yn lleol heb aros am aelodau araf';

  @override
  String get syncPlayRepeat => 'Ailadrodd';

  @override
  String get syncPlayRepeatOne => 'Un';

  @override
  String get syncPlayShuffleModeShuffled => 'Wedi\'i gymysgu';

  @override
  String get syncPlayShuffleModeSorted => 'Wedi\'i drefnu';

  @override
  String get syncPlaySyncCurrentQueue => 'Cysoni ciw chwarae cyfredol';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Gosodwch yr hyn sy\'n chwarae\'n lleol yn lle\'r ciw grŵp';

  @override
  String get syncPlayLeaveGroup => 'Gadael y grŵp';

  @override
  String get syncPlayGroupQueue => 'Ciw grŵp';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Eitem $index';
  }

  @override
  String get syncPlayPlayNow => 'Chwarae nawr';

  @override
  String get syncPlayCreateNewGroup => 'Creu grŵp newydd';

  @override
  String get syncPlayGroupName => 'Enw grŵp';

  @override
  String get syncPlayDefaultGroupName => 'Fy Ngrŵp SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Creu grŵp';

  @override
  String get syncPlayAvailableGroups => 'Grwpiau sydd ar gael';

  @override
  String get syncPlayNoGroupsAvailable => 'Dim grwpiau ar gael';

  @override
  String get syncPlayJoinGroupQuestion => 'Ymuno â grŵp SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Mae\'n bosibl y bydd ymuno â grŵp SyncPlay yn disodli eich ciw chwarae presennol. Parhau?';

  @override
  String get syncPlayJoin => 'Ymuno';

  @override
  String get syncPlayStateIdle => 'Segur';

  @override
  String get syncPlayStateWaiting => 'Aros';

  @override
  String get syncPlayStatePaused => 'Wedi seibio';

  @override
  String get syncPlayStatePlaying => 'Chwarae';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return 'Ymunodd $userName â grŵp SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return 'Gadawodd $userName grŵp SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Gwrthodwyd mynediad SyncPlay';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nid oes gennych fynediad i un neu fwy o eitemau yn y grŵp SyncPlay hwn. Gofynnwch i berchennog y grŵp wirio caniatadau llyfrgell neu ddewis ciw gwahanol.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Wrthi\'n cysoni chwarae yn ôl i $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Nid yw chwiliad llais ar gael.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Methiant Chwarae Uniongyrchol Dolby Vision';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Methodd chwarae uniongyrchol â dechrau ar gyfer y ffrwd Dolby Vision hon. Ailgeisio defnyddio trawsgôd gweinydd?';

  @override
  String get retryWithTranscode => 'Rhowch gynnig arall arni gyda thrawsgod';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Heb ei Gefnogi';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Ni all y ddyfais hon ddadgodio cynnwys Dolby Vision yn uniongyrchol. Defnyddiwch HDR10 wrth gefn neu gofynnwch am drawsgodio gweinydd.';

  @override
  String get rememberMyChoice => 'Cofiwch fy newis';

  @override
  String get playHdr10Fallback => 'Chwarae HDR10 wrth gefn';

  @override
  String get requestTranscode => 'Gofyn am drawsgod';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Canfod rhesi a ddatgelwyd gan ategyn \"Home Screen Sections\" IAmParadox27. Gellir galluogi ac aildrefnu rhesi isod.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Dim gweinyddwyr Jellyfin yn adrodd am yr ategyn eto.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Canfod rhesi sydd wedi\'u ffurfweddu trwy ategyn \"KefinTweaks\" ranaldsgift. Mae adrannau personol, a ryddhawyd yn ddiweddar, gwylio eto, tymhorol, ac a ychwanegwyd yn ddiweddar yn y llyfrgell yn cael eu hadlewyrchu o gyfluniad KefinTweaks ar bob gweinydd Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Dim gweinyddwyr Jellyfin yn adrodd am KefinTweaks eto.';

  @override
  String get integrationOpenHomeSections => 'Adrannau Cartref Agored';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Galluogi, analluogi, ac aildrefnu rhesi';

  @override
  String get integrationInstalledButDisabled =>
      'Wedi\'i osod ond wedi\'i analluogi';

  @override
  String get integrationNotInstalled => 'Heb ei osod';

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
  String get seeAll => 'Gwel Pawb';

  @override
  String get noItems => 'Dim eitemau';

  @override
  String get switchUser => 'Newid Defnyddiwr';

  @override
  String get remoteControl => 'Rheolaeth Anghysbell';

  @override
  String get mediaBarLoading => 'Wrthi\'n llwytho bar cyfryngau...';

  @override
  String get mediaBarError => 'Methodd bar cyfryngau llwytho';

  @override
  String get offlineServerUnavailable =>
      'Wedi\'i gysylltu â\'r rhyngrwyd, ond nid yw\'r gweinydd presennol ar gael.';

  @override
  String get offlineNoInternet =>
      'Rydych chi all-lein. Dim ond cynnwys wedi\'i lawrlwytho sydd ar gael.';

  @override
  String get offlineFileNotAvailable => 'Ffeil ddim ar gael';

  @override
  String get offlineSwitchServer => 'Newid Gweinydd';

  @override
  String get offlineSavedMedia => 'Cyfryngau wedi\'u Cadw';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => '_ARB_TERM_0__';

  @override
  String get castRemotePlayback => 'Chwarae o Bell';

  @override
  String castControlFailed(String error) {
    return 'Methodd rheolaeth cast: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Rheolaethau';
  }

  @override
  String get castDeviceVolume => 'Cyfrol Dyfais';

  @override
  String get castVolumeUnavailable => 'Ddim ar gael';

  @override
  String castStopKind(String kind) {
    return 'Stopiwch $kind';
  }

  @override
  String get audioLabel => 'Sain';

  @override
  String get subtitlesLabel => 'Isdeitlau';

  @override
  String get pinConfirmTitle => 'Cadarnhau PIN';

  @override
  String get pinSetTitle => 'Gosod PIN';

  @override
  String get pinEnterTitle => 'Rhowch PIN';

  @override
  String get pinReenterToConfirm => 'Rhowch eich PIN eto i gadarnhau';

  @override
  String pinEnterNDigit(int length) {
    return 'Rhowch PIN $length-digid';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Rhowch eich PIN $length-digid';
  }

  @override
  String get pinIncorrect => 'PIN anghywir';

  @override
  String get pinMismatch => 'Nid yw PINs yn cyfateb';

  @override
  String get pinForgot => 'Wedi anghofio PIN?';

  @override
  String get pinClear => 'Clir';

  @override
  String get pinBackspace => 'Gofod cefn';

  @override
  String get quickConnectAuthorized => 'Cais Cyswllt Cyflym wedi\'i awdurdodi.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Mae cod Quick Connect yn annilys neu wedi dod i ben.';

  @override
  String get quickConnectNotSupported =>
      'Nid yw Quick Connect yn cael ei gefnogi ar y gweinydd hwn.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Wedi methu ag awdurdodi cod Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Mae Quick Connect wedi\'i analluogi ar y gweinydd hwn.';

  @override
  String get quickConnectForbidden =>
      'Ni all eich cyfrif awdurdodi\'r cais Cyswllt Cyflym hwn.';

  @override
  String get quickConnectNotFound =>
      'Ni chanfuwyd cod Quick Connect. Rhowch gynnig ar god newydd.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Methodd Quick Connect: $message';
  }

  @override
  String get quickConnectEnterCode => 'Rhowch god';

  @override
  String get quickConnectAuthorize => 'Awdurdodi';

  @override
  String remoteCommandFailed(String error) {
    return 'Methodd y gorchymyn: $error';
  }

  @override
  String get remoteControlTitle => 'Rheolaeth Anghysbell';

  @override
  String get remoteFailedToLoadSessions => 'Wedi methu llwytho sesiynau';

  @override
  String get remoteNoSessions => 'Dim sesiynau y gellir eu rheoli';

  @override
  String get remoteStartPlayback => 'Dechreuwch chwarae ar ddyfais arall';

  @override
  String get unknownUser => 'Anhysbys';

  @override
  String get unknownItem => 'Anhysbys';

  @override
  String get remoteNothingPlaying => 'Dim byd yn chwarae ar y sesiwn yma';

  @override
  String get castingStarted => 'Dechreuodd y castio ar ddyfais a ddewiswyd';

  @override
  String castingFailed(String error) {
    return 'Wedi methu dechrau castio: $error';
  }

  @override
  String get noRemoteDevices => 'Dim dyfeisiau chwarae o bell ar gael.';

  @override
  String get noRemoteDevicesIos =>
      'Dim dyfeisiau chwarae o bell ar gael.\n\nAr iOS, efallai na fydd targedau AirPlay ar gael yn yr efelychydd.';

  @override
  String get trackActionPlayNext => 'Chwarae Nesaf';

  @override
  String get trackActionAddToQueue => 'Ychwanegu at Ciw';

  @override
  String get trackActionAddToPlaylist => 'Ychwanegu at y Rhestr Chwarae';

  @override
  String get trackActionCancelDownload => 'Canslo Lawrlwytho';

  @override
  String get trackActionDeleteFromPlaylist => 'Dileu o\'r Rhestr Chwarae';

  @override
  String get trackActionMoveUp => 'Symud i Fyny';

  @override
  String get trackActionMoveDown => 'Symud i Lawr';

  @override
  String get trackActionRemoveFromFavorites => 'Tynnu o Ffefrynnau';

  @override
  String get trackActionAddToFavorites => 'Ychwanegu at Ffefrynnau';

  @override
  String get trackActionGoToAlbum => 'Ewch i Albwm';

  @override
  String get trackActionGoToArtist => 'Ewch i Artist';

  @override
  String trackActionDownloading(String name) {
    return 'Wrthi\'n llwytho i lawr $name...';
  }

  @override
  String get trackActionDeletedFile => 'Ffeil wedi\'i lawrlwytho wedi\'i dileu';

  @override
  String get trackActionDeleteFileFailed =>
      'Methu dileu ffeil wedi\'i lawrlwytho';

  @override
  String get shuffleBy => 'Shuffle Erbyn';

  @override
  String get shuffleSelectLibrary => 'Dewiswch Llyfrgell';

  @override
  String get shuffleSelectGenre => 'Dewiswch Genre';

  @override
  String get shuffleLibrary => 'Llyfrgell';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Dim llyfrgelloedd cydnaws ar gael.';

  @override
  String get shuffleNoGenres =>
      'Ni chanfuwyd genres ar gyfer y modd siffrwd hwn.';

  @override
  String get posterDisplayTitle => 'Arddangos';

  @override
  String get posterImageType => 'Math o Ddelwedd';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Mân-lun';

  @override
  String get imageTypeBanner => 'Baner';

  @override
  String get playlistAddFailed => 'Wedi methu ag ychwanegu at y rhestr chwarae';

  @override
  String get playlistCreateFailed => 'Wedi methu creu rhestr chwarae';

  @override
  String get playlistNew => 'Rhestr Chwarae Newydd';

  @override
  String get playlistCreate => 'Creu';

  @override
  String get playlistCreateNew => 'Creu Rhestr Chwarae Newydd';

  @override
  String get playlistNoneFound => 'Heb ganfod rhestri chwarae';

  @override
  String get addToPlaylist => 'Ychwanegu at y Rhestr Chwarae';

  @override
  String get lyricsNotAvailable => 'Dim geiriau ar gael';

  @override
  String get upNext => 'Up Nesaf';

  @override
  String get playNext => 'Chwarae Nesaf';

  @override
  String get stillWatchingContent =>
      'Mae chwarae wedi\'i oedi. Ydych chi\'n dal i wylio?';

  @override
  String get stillWatchingStop => 'Stopio';

  @override
  String get stillWatchingContinue => 'Parhewch';

  @override
  String skipSegment(String segment) {
    return 'Hepiwch $segment';
  }

  @override
  String get liveTv => 'Teledu byw';

  @override
  String get continueWatchingAndNextUp => 'Parhewch i Gwylio a Nesaf';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Lawrlwytho $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Lawrlwytho $fileName';
  }

  @override
  String get nextEpisode => 'Pennod nesaf';

  @override
  String get moreFromThisSeason => 'Mwy o\'r Tymor Hwn';

  @override
  String get playerTooltipPlaybackSpeed => 'Cyflymder chwarae';

  @override
  String get playerTooltipCastControls => 'Rheolaethau cast';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Rhowch sgrin lawn';

  @override
  String get playerTooltipExitFullscreen => 'Gadael sgrin lawn';

  @override
  String get playerTooltipFloatOnTop => 'Arnofio ar ei ben';

  @override
  String get playerTooltipExitFloatOnTop => 'Analluogi fflôt ar ei ben';

  @override
  String get playerTooltipLockLandscape => 'Tirwedd clo';

  @override
  String get playerTooltipUnlockOrientation => 'Caniatáu cylchdroi';

  @override
  String get playerTooltipPrevious => 'Blaenorol';

  @override
  String get playerTooltipSeekBack => 'Ceisio yn ôl';

  @override
  String get playerTooltipSeekForward => 'Ceisio ymlaen';

  @override
  String get contextMenuMarkWatched => 'Marciwch fel y\'i Gwyliwyd';

  @override
  String get contextMenuMarkUnwatched => 'Marciwch fel Heb ei wylio';

  @override
  String get contextMenuAddToFavorites => 'Ychwanegu at Ffefrynnau';

  @override
  String get contextMenuRemoveFromFavorites => 'Tynnu o Ffefrynnau';

  @override
  String get contextMenuGoToSeries => 'Ewch i Gyfres';

  @override
  String get settingsAdministrationSubtitle =>
      'Cyrchwch banel gweinyddu\'r gweinydd';

  @override
  String get settingsAccountSecurity => 'Cyfrif a Diogelwch';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Dilysu, cod PIN, a rheolaethau rhieni';

  @override
  String get settingsPersonalization => 'Personoli';

  @override
  String get settingsPersonalizationSubtitle =>
      'Thema, llywio, rhesi cartref, a gwelededd llyfrgell';

  @override
  String get settingsDynamicContent => 'Cynnwys Dynamig';

  @override
  String get settingsDynamicContentSubtitle =>
      'Bar Cyfryngau a throshaenau gweledol';

  @override
  String get settingsPlaybackSyncplay => 'Chwarae a SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Gosodiadau sain/fideo, isdeitlau, lawrlwythiadau, a rheolyddion SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Cysoni ategion, Seerr, graddfeydd, a mwy';

  @override
  String get settingsAboutSubtitle =>
      'Fersiwn ap, gwybodaeth gyfreithiol, a chredydau';

  @override
  String get settingsAuthenticationSection => 'AWDURDOD';

  @override
  String get settingsSortServersBy => 'Trefnu Gweinyddwyr Yn ôl';

  @override
  String get settingsLastUsed => 'Defnyddiwyd ddiwethaf';

  @override
  String get settingsAlphabetical => 'Yn nhrefn yr wyddor';

  @override
  String get settingsPrivacyAndSafetySection => 'PREIFATRWYDD A DIOGELWCH';

  @override
  String get settingsBlockedRatings => 'Graddfeydd wedi\'u Rhwystro';

  @override
  String get settingsGeneralStyle => 'Arddull Cyffredinol';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Acenion thema, cefndir, dangosyddion gwylio, a cherddoriaeth thema';

  @override
  String get settingsHomePage => 'Tudalen Gartref';

  @override
  String get settingsHomePageSubtitle =>
      'Adrannau, mathau o ddelweddau, troshaenau, a rhagolygon cyfryngau';

  @override
  String get settingsLibrariesSubtitle =>
      'Gwelededd llyfrgell, golwg ffolder, ac ymddygiad aml-weinydd';

  @override
  String get settingsTwentyFourHourClock => 'Cloc 24-Awr';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Defnyddiwch fformatio amser 24 awr lle bynnag y dangosir y cloc';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Dangoswch y botwm siffrwd yn y bar llywio';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Dangoswch y botwm genres yn y bar llywio';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Dangoswch y botwm ffefrynnau yn y bar llywio';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Dangoswch y botwm llyfrgelloedd yn y bar llywio';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Toglo gwelededd tudalen gartref fesul llyfrgell. Ailgychwyn Moonfin i newidiadau ddod i rym.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Bar Cyfryngau a Rhagolygon Lleol';

  @override
  String get settingsVisualOverlays => 'Troshaenau Gweledol';

  @override
  String get settingsSeasonalSurprise => 'Syndod Tymhorol';

  @override
  String get settingsMetadataAndRatings => 'Metadata a Graddfeydd';

  @override
  String get settingsPluginScreenDescription =>
      'Mae Moonbase yn pweru integreiddiadau ochr y gweinydd gan gynnwys ffynonellau graddio ychwanegol, ceisiadau Seerr, a dewisiadau synced.';

  @override
  String get settingsOfflineDownloads => 'Lawrlwythiadau All-lein';

  @override
  String get settingsHigh => 'Uchel';

  @override
  String get settingsLow => 'Isel';

  @override
  String get settingsCustomPath => 'Llwybr Personol';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Rhowch lwybr ffolder lawrlwytho';

  @override
  String get settingsConcurrentDownloads => 'Lawrlwythiadau Cydamserol';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Uchafswm nifer yr eitemau i\'w llwytho i lawr ar unwaith.';

  @override
  String get settingsAppInfo => 'GWYBODAETH APP';

  @override
  String get settingsReportAnIssue => 'Rhoi gwybod am Fater';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Agorwch y traciwr materion ar GitHub';

  @override
  String get settingsJoinDiscord => 'Ymunwch â Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Sgwrsio gyda\'r gymuned';

  @override
  String get settingsJoinTheDiscord => 'Ymunwch â\'r Discord';

  @override
  String get settingsSupportMoonfin => 'Cefnogwch Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Rhowch goffi i\'r datblygwr';

  @override
  String get settingsLegal => 'CYFREITHIOL';

  @override
  String get settingsLicenses => 'Trwyddedau';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Hysbysiadau trwydded ffynhonnell agored';

  @override
  String get settingsPrivacyPolicy => 'Polisi Preifatrwydd';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Sut mae Moonfin yn trin eich data';

  @override
  String get settingsCheckForUpdates => 'Gwiriwch am Ddiweddariadau';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Gwiriwch am y datganiad Moonfin diweddaraf';

  @override
  String get settingsPoweredByFlutter => 'Wedi\'i bweru gan Flutter';

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
  String get settingsBoth => 'Y ddau';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Cymysgwch Hidlydd Math Cynnwys';

  @override
  String get settingsVideoPlaybackPreferences => 'Dewisiadau Chwarae Fideo';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Peiriant fideo craidd a gosodiadau ansawdd ffrydio';

  @override
  String get settingsAudioPreferences => 'Dewisiadau Sain';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Traciau sain, prosesu, ac opsiynau pasio drwodd';

  @override
  String get settingsAutomationAndQueue => 'Awtomeiddio & Ciw';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Chwarae a dilyniannu awtomataidd';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Dadlwythwch ansawdd, terfynau storio, a maint y ciw';

  @override
  String get settingsSyncplaySubtitle =>
      'Rhesymeg cydamseru ar gyfer sesiynau grŵp';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Nodweddion chwaraewr arbenigol. Defnyddiwch yn ofalus, oherwydd gall rhai opsiynau achosi problemau chwarae';

  @override
  String get settingsSkipIntrosAndOutros => 'Hepgor Intros a Outros?';

  @override
  String get settingsPromptUser => 'Defnyddiwr Prydlon';

  @override
  String get settingsSkip => 'Sgipio';

  @override
  String get settingsDoNothing => 'Gwneud Dim';

  @override
  String get settingsMaxBitrateDescription =>
      'Capio\'r gyfradd didau ffrydio. Bydd cynnwys uwchlaw\'r trothwy hwn yn cael ei drawsgodio i ffitio.';

  @override
  String get settingsMaxResolutionDescription =>
      'Cyfyngu ar y datrysiad mwyaf y bydd y chwaraewr yn gofyn amdano. Bydd cynnwys cydraniad uwch yn cael ei drawsgodio i lawr.';

  @override
  String get settingsPlayerZoomDescription =>
      'Sut y dylid graddio fideo i ffitio\'r sgrin.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Peiriant Chwarae (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Dewiswch yr injan chwarae ddiofyn ar ddyfeisiau Android TV. Mae newidiadau yn berthnasol i\'r sesiwn chwarae nesaf.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (argymhellir)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (etifeddiaeth)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (etifeddiaeth)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (argymhellir)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision wrth gefn';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Ymddygiad ar gyfer teitlau Dolby Vision ar ddyfeisiau heb ddatgodio Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Gofynnwch bob tro';

  @override
  String get settingsPreferHdr10Fallback =>
      'Mae\'n well gennyf HDR10 wrth gefn';

  @override
  String get settingsPreferServerTranscode =>
      'Mae\'n well gennyf drawsgod gweinydd';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Proffil Dolby Vision 7 Chwarae Uniongyrchol';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Yn rheoli a ddylai ffrydiau haen gwella proffil Dolby Vision 7 gyfeirio chwarae.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFTKRT wedi\'i alluogi)';

  @override
  String get settingsEnabledOnThisDevice => 'Wedi\'i alluogi ar y ddyfais hon';

  @override
  String get settingsDisabledPreferTranscode =>
      'Anabl (mae\'n well gennym drawsgod)';

  @override
  String get settingsResumeRewindDescription =>
      'Wrth ailddechrau chwarae (o Parhau i Gwylio neu dudalen eitem cyfryngau), sawl eiliad y dylid ei hailddirwyn?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Wrth ailddechrau chwarae ar ôl pwyso\'r botwm saib, sawl eiliad y dylid ei ail-ddirwyn?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Sawl eiliad i neidio yn ôl ar ôl pwyso\'r botwm ailddirwyn.';

  @override
  String get settingsOneSecond => '1 eiliad';

  @override
  String get settingsThreeSeconds => '3 eiliad';

  @override
  String get settingsFortyFiveSeconds => '45 eiliad';

  @override
  String get settingsSixtySeconds => '60 eiliad';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Sawl eiliad i neidio ymlaen ar ôl pwyso\'r botwm cyflym ymlaen.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 i ddatgodiwr allanol';

  @override
  String get settingsCinemaMode => 'Modd Sinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Chwarae trelars/rhaglenni cyn prif nodwedd';

  @override
  String get settingsNextUpDisplayDescription =>
      'Mae Estynedig yn dangos cerdyn llawn gyda gwaith celf pennod a disgrifiad. Mae lleiafswm yn dangos troshaen cyfrif i lawr cryno. Mae\'r anabl yn cuddio\'r anogwr yn gyfan gwbl.';

  @override
  String get settingsShort => 'Byr';

  @override
  String get settingsLong => 'Hir';

  @override
  String get settingsVeryLong => 'Hir iawn';

  @override
  String get settingsVideoStartDelay => 'Oedi Cychwyn Fideo';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Teledu Uniongyrchol byw';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Galluogi chwarae uniongyrchol ar gyfer Teledu Byw';

  @override
  String get settingsOpenGroups => 'Grwpiau Agored';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Creu, ymuno, neu reoli grwpiau SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'Wedi galluogi SyncPlay';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Galluogi nodweddion gwylio grŵp';

  @override
  String get settingsSyncplayButton => 'Botwm SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Dangoswch y botwm SyncPlay ar y bar llywio';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Cywiriad Uwch';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Galluogi rhesymeg cysoni manwl';

  @override
  String get settingsSyncplaySyncCorrection => 'Cywiriad Cysoni';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Addasu chwarae yn awtomatig i aros mewn cydamseriad';

  @override
  String get settingsSyncplaySpeedToSync => 'Cyflymder Cysoni';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Defnyddiwch addasiad cyflymder chwarae i gysoni';

  @override
  String get settingsSyncplaySkipToSync => 'Neidio i Sync';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => 'Defnyddio ceisio cysoni';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Isafswm Oedi Cyflymder';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Oedi Cyflymder Uchaf';

  @override
  String get settingsSyncplaySpeedDuration => 'Cyflymder Hyd';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Oedi Sgipio Lleiaf';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Gwrthbwyso Ychwanegol';

  @override
  String get onNow => 'Ar Nawr';

  @override
  String get collections => 'Casgliadau';

  @override
  String get lastPlayed => 'Chwaraewyd ddiwethaf';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Diweddaraf $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Awtochwarae\'r bennod nesaf';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Chwaraewch y bennod nesaf yn awtomatig pan fydd ar gael.';

  @override
  String get skipSilenceTitle => 'Hepgor distawrwydd';

  @override
  String get skipSilenceSubtitle =>
      'Sgipiwch segmentau sain tawel yn awtomatig pan fydd y ffrwd yn eu cefnogi.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Caniatáu effeithiau sain allanol';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Caniatáu i apiau cyfartalwr ac effeithiau (e.e. Wavelet) atodi i sesiynau chwarae Media3.';

  @override
  String get disableTunnelingTitle => 'Analluogi twnelu';

  @override
  String get disableTunnelingSubtitle =>
      'Gorfodi chwarae di-dwnnel. Defnyddiol ar ddyfeisiadau gyda diffyg parhad sain/fideo twnelu.';

  @override
  String get mapDolbyVisionP7Title => 'Mapiwch Dolby Vision proffil 7 i HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Chwarae Dolby Vision proffil 7 ffrwd fel HDR10-compatible HEVC ar ddyfeisiau nad ydynt yn DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Defnyddiwch arddulliau is-deitl wedi\'u mewnosod';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Cymhwyso lliwiau, ffontiau a lleoliad sydd wedi\'u hymgorffori yn y trac is-deitl. Analluoga i ddefnyddio eich dewisiadau arddull capsiwn yn lle hynny.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Defnyddiwch feintiau ffontiau is-deitl wedi\'u mewnosod';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Cymhwyso awgrymiadau maint ffont sydd wedi\'u hymgorffori yn y trac is-deitl. Analluogi defnyddio maint yr is-deitl o\'ch dewisiadau arddull.';

  @override
  String get useDetailedSubHeadings => 'Defnyddiwch Is-benawdau Manwl';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Dangos subrow manwl neu fach iawn ar dudalennau\'r Llyfrgell.';

  @override
  String get savedThemesDeleteDialogTitle => 'Dileu thema sydd wedi\'i chadw?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Tynnu \"$themeName\" o storfa\'r ddyfais hon?';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Wedi dileu \"$themeName\" o\'r ddyfais hon.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Methu dileu \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Themâu wedi\'u cadw';

  @override
  String get savedThemesDescription =>
      'Mae\'r rhain yn themâu wedi\'u llwytho i lawr o\'r ategyn Moonfin ar gyfer y gweinydd presennol. Mae dileu yn dileu\'r copi lleol hwn yn unig.';

  @override
  String get savedThemesEmpty =>
      'Ni chanfuwyd unrhyw themâu sydd wedi\'u cadw ar gyfer y gweinydd hwn.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Yn weithredol ar hyn o bryd';
  }

  @override
  String get savedThemesDeleteTooltip => 'Dileu thema sydd wedi\'i chadw';

  @override
  String get savedThemesManageSubtitle =>
      'Rheoli themâu ategyn wedi\'u lawrlwytho ar y ddyfais hon';

  @override
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Adrannau Sgrin Cartref';

  @override
  String get themeEditor => 'Golygydd Thema';

  @override
  String get themeEditorSubtitle =>
      'Agorwch y Golygydd Thema Moonfin yn eich porwr';

  @override
  String get homeScreen => 'Sgrin Cartref';

  @override
  String get bottomBar => 'Bar Gwaelod';

  @override
  String get homeRowsStyleClassic => 'Clasurol';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Rhesi Cartref';

  @override
  String get rowsType => 'Math Rhesi';

  @override
  String get rowsTypeDescription =>
      'Mae Classic yn cadw\'r math o ddelwedd fesul rhes a throshaen gwybodaeth. Mae Modern yn defnyddio rhesi portread-i-gefndir.';

  @override
  String get displayFavoritesRows => 'Dangos Rhesi Ffefrynnau';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Dangoswch Hoff Ffilmiau, Cyfres, a hoff resi eraill yn yr Adrannau Cartref.';

  @override
  String get favoritesRowSorting => 'Ffefrynnau Didoli Rhes';

  @override
  String get favoritesRowSortingDescription =>
      'Trefnu rhesi Ffefrynnau yn ôl dyddiad a ychwanegwyd, dyddiad rhyddhau, yn nhrefn yr wyddor, a mwy.';

  @override
  String get displayCollectionsRows => 'Rhesi Casgliadau Arddangos';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Dangos rhesi Casgliadau yn yr Adrannau Cartref.';

  @override
  String get collectionsRowSorting => 'Didoli Rhes Casgliadau';

  @override
  String get collectionsRowSortingDescription =>
      'Trefnu rhesi Casgliadau yn ôl dyddiad a ychwanegwyd, dyddiad rhyddhau, yn nhrefn yr wyddor, a mwy.';

  @override
  String get displayGenresRows => 'Rhesi Genres Arddangos';

  @override
  String get displayGenresRowsSubtitle =>
      'Dangos rhesi Genres yn Adrannau Cartref.';

  @override
  String get genresRowSorting => 'Didoli Rhes Genres';

  @override
  String get genresRowSortingDescription =>
      'Trefnu rhesi Genres yn ôl dyddiad a ychwanegwyd, dyddiad rhyddhau, yn nhrefn yr wyddor, a mwy.';

  @override
  String get genresRowItems => 'Eitemau Rhes Genres';

  @override
  String get genresRowItemsDescription =>
      'Dangos Ffilmiau, Cyfresi, neu\'r ddau yn rhesi Genres.';

  @override
  String get appearance => 'Ymddangosiad';

  @override
  String get cardSize => 'Maint Cerdyn';

  @override
  String get externalPlayerApp => 'Ap chwaraewr allanol';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Dangos dewisydd ap pan fydd chwarae yn dechrau.';

  @override
  String get loadingInstalledPlayers =>
      'Wrthi\'n llwytho chwaraewyr sydd wedi\'u gosod...';

  @override
  String get connection => 'Cysylltiad';

  @override
  String get audioTranscodeTarget => 'Targed Trawsnewid Sain';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Cefnogir ar y ddyfais hon';

  @override
  String get notSupportedOnThisDevice => 'Heb ei gefnogi ar y ddyfais hon';

  @override
  String get settingsAudioDtsXPassthrough => 'Llwybr DTS:X (DTS UHD).';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) i ddatgodiwr allanol.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD gyda Passthrough Atmos (JOC).';

  @override
  String get mediaPlayerBehavior => 'Ymddygiad Chwaraewr Cyfryngau';

  @override
  String get playbackEnhancements => 'Gwelliannau Chwarae';

  @override
  String get alwaysOn => 'Bob amser ymlaen.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Disodli Skip Outro gyda Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Dangoswch y troshaen Next Up yn lle\'r botwm Skip Outro.';

  @override
  String get playerRouting => 'Llwybro Chwaraewr';

  @override
  String get preferSoftwareDecoders => 'Gwell datgodyddion meddalwedd';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Defnyddiwch FFmpeg (sain) a libgav1 (AV1) cyn datgodyddion caledwedd. Analluoga os yw passthrough sain HDMI yn torri.';

  @override
  String get useExternalPlayer => 'Defnyddiwch chwaraewr allanol';

  @override
  String get useExternalPlayerSubtitle =>
      'Agorwch chwarae fideo yn eich ap allanol dethol ar Android TV.';

  @override
  String get automaticQueuing => 'Ciwio Awtomatig';

  @override
  String get preferSdhSubtitles => 'Gwell isdeitlau SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Blaenoriaethu traciau is-deitl SDH/CC wrth ddewis yn awtomatig.';

  @override
  String get webDiagnostics => 'Diagnosteg gwe';

  @override
  String get webDiagnosticsTitle => 'Moonfin Diagnosteg Gwe';

  @override
  String get webDiagnosticsIntro =>
      'Defnyddiwch y dudalen hon i wneud diagnosis o broblemau cysylltedd porwr (CORS, cynnwys cymysg, a gosodiadau darganfod).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Canfod Methiant Cynnwys Cymysg';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Wedi canfod CORS/Methiant Rhag Hedfan';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Canfu Moonfin dudalen HTTPS yn ceisio galw URL gweinydd HTTP. Mae porwyr yn rhwystro\'r cais hwn cyn iddo gyrraedd eich gweinydd.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Canfu Moonfin fethiant cais ar lefel porwr a achosir yn aml gan fod penawdau CORS neu rag-hedfan ar goll ar y gweinydd cyfryngau.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL targed: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Manylion: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Cyd-destun Amser Rhedeg Presennol';

  @override
  String get webDiagnosticsOrigin => 'Tarddiad';

  @override
  String get webDiagnosticsScheme => 'Cynllun';

  @override
  String get webDiagnosticsPluginMode => 'Modd Ategyn';

  @override
  String get webDiagnosticsWebRtcScan => 'Sgan WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL Gweinydd dan Orfod';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL Gweinydd Diofyn';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL Dirprwy Darganfod';

  @override
  String get notConfigured => 'heb ei ffurfweddu';

  @override
  String get webDiagnosticsMixedContent => 'Cynnwys Cymysg';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Mae\'r dudalen hon wedi\'i llwytho dros HTTPS, ond mae un neu fwy o URLau wedi\'u ffurfweddu yn HTTP. Mae porwyr yn rhwystro tudalennau HTTPS rhag galw APIs HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Trwsio: gwasanaethwch eich gweinydd cyfryngau neu bwynt terfyn dirprwy trwy HTTPS, neu llwythwch Moonfin dros HTTP ar rwydweithiau lleol dibynadwy yn unig.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Dim ffurfweddiad cynnwys cymysg amlwg wedi\'i ganfod o\'r gosodiadau amser rhedeg cyfredol.';

  @override
  String get webDiagnosticsCorsChecklist => 'Rhestr Wirio CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Caniatáu tarddiad y porwr yn Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Cynnwys Awdurdodi, X-Emby-Authorization, a X-Emby-Token yn Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Amrediad Cynnwys-Ystod a Derbyn-Ystod ar gyfer ffrydio a cheisio ymddygiad.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Dychwelwch 204 i geisiadau rhag-hedfan OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Darn Pennawd Enghreifftiol (arddull nginx)';

  @override
  String get note => 'Nodyn';

  @override
  String get webDiagnosticsNonWebNote =>
      'Mae\'r llwybr diagnosteg hwn wedi\'i fwriadu ar gyfer adeiladu gwe. Os ydych chi\'n gweld hwn ar lwyfan arall, efallai na fydd y gwiriadau hyn yn berthnasol.';

  @override
  String get backToServerSelect => 'Yn ôl i Dewis Gweinydd';

  @override
  String get signOutAllUsers => 'Allgofnodi Pob Defnyddiwr';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Gwrthodir caniatâd meicroffon yn barhaol. Ei alluogi mewn gosodiadau system.';

  @override
  String get voiceSearchPermissionRequired =>
      'Mae angen caniatâd meicroffon ar gyfer chwiliad llais.';

  @override
  String get voiceSearchNoMatch => 'Heb ddal hynny. Ceisiwch eto.';

  @override
  String get voiceSearchNoSpeechDetected => 'Dim lleferydd wedi\'i ganfod.';

  @override
  String get voiceSearchMicrophoneError => 'Gwall meicroffon.';

  @override
  String get voiceSearchNeedsInternet =>
      'Mae angen rhyngrwyd ar gyfer chwiliad llais.';

  @override
  String get voiceSearchServiceBusy =>
      'Mae gwasanaeth llais yn brysur. Ceisiwch eto.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Gwrthodir caniatâd meicroffon yn barhaol.';

  @override
  String get microphonePermissionDenied => 'Gwrthodir caniatâd meicroffon.';

  @override
  String get speechRecognitionUnavailable =>
      'Nid yw system adnabod llais ar gael ar y ddyfais hon.';

  @override
  String get openIosRoutePicker => 'Agor codwr llwybr iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Nid yw dewiswr llwybr AirPlay ar gael ar y ddyfais hon.';

  @override
  String get videos => 'Fideos';

  @override
  String get trailers => 'Trelars';

  @override
  String get programs => 'Rhaglenni';

  @override
  String get songs => 'Caneuon';

  @override
  String get photoAlbums => 'Albymau Lluniau';

  @override
  String get photos => 'Lluniau';

  @override
  String get people => 'Pobl';

  @override
  String get recentlyReleasedEpisodes => 'Pennodau a Ryddhawyd yn Ddiweddar';

  @override
  String get watchAgain => 'Gwyliwch Eto';

  @override
  String get guestAppearances => 'Ymddangosiadau Gwesteion';

  @override
  String get appearancesSeerr => 'Ymddangosiadau (Seerr)';

  @override
  String get watchWithGroup => 'Gwyliwch gyda\'r grŵp';

  @override
  String get errors => 'Gwallau';

  @override
  String get warnings => 'Rhybuddion';

  @override
  String get disk => 'Disg';

  @override
  String get openInBrowser => 'Agor yn Porwr';

  @override
  String get embeddedBrowserNotAvailable =>
      'Nid yw porwr wedi\'i fewnosod ar gael ar y platfform hwn.';

  @override
  String get adminRestartServerConfirmation =>
      'Ydych chi\'n siŵr eich bod am ailgychwyn y gweinydd?';

  @override
  String get adminShutdownServerConfirmation =>
      'Ydych chi\'n siŵr eich bod am gau\'r gweinydd? Bydd angen i chi ei ailgychwyn â llaw.';

  @override
  String get internal => 'Mewnol';

  @override
  String get idle => 'Segur';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Ni chanfuwyd unrhyw ddefnyddwyr';

  @override
  String get adminNoUsersMatchSearch =>
      'Nid oes unrhyw ddefnyddwyr yn cyfateb i\'ch chwiliad';

  @override
  String get adminNoDevicesFound => 'Heb ganfod dyfeisiau';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nid oes unrhyw ddyfeisiau yn cyfateb i\'r hidlyddion cyfredol';

  @override
  String get passwordSet => 'Set cyfrinair';

  @override
  String get noPasswordConfigured => 'Dim cyfrinair wedi\'i ffurfweddu';

  @override
  String get remoteAccess => 'Mynediad o Bell';

  @override
  String get localOnly => 'Lleol yn Unig';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Wedi methu llwytho dadansoddeg cyfryngau';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Dadansoddeg gyfunol ar draws holl lyfrgelloedd y cyfryngau.';

  @override
  String get analyticsTopArtists => 'Artistiaid Gorau';

  @override
  String get analyticsTopAuthors => 'Prif Awduron';

  @override
  String get analyticsTopContributors => 'Cyfranwyr Gorau';

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
      'Nid oes cyfansymiau cyfryngau mynegedig ar gael ar gyfer y detholiad hwn eto.';

  @override
  String get analyticsLibraryDetails => 'Manylion y Llyfrgell';

  @override
  String get analyticsLibraryBreakdown => 'Chwalfa Llyfrgell';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Nid oes unrhyw lyfrgelloedd ar gael.';

  @override
  String get adminServerAdministrationTitle => 'Gweinyddu Gweinydd';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Cache Delwedd';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Logiau';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Trawsgod';

  @override
  String get adminServerPathWeb => 'Gwe';

  @override
  String get adminNoServerPathsReturned =>
      'Ni ddychwelwyd unrhyw lwybrau gweinydd gan y gweinydd hwn.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% wedi\'i ddefnyddio';
  }

  @override
  String get userActivity => 'Gweithgaredd Defnyddiwr';

  @override
  String get systemEvents => 'Digwyddiadau System';

  @override
  String get needsAttention => 'Angen Sylw';

  @override
  String get adminDrawerSectionServer => 'Gweinydd';

  @override
  String get adminDrawerSectionPlayback => 'Chwarae yn ôl';

  @override
  String get adminDrawerSectionDevices => 'Dyfeisiau';

  @override
  String get adminDrawerSectionAdvanced => 'Uwch';

  @override
  String get adminDrawerSectionPlugins => 'Ategion';

  @override
  String get adminDrawerSectionLiveTv => 'Teledu byw';

  @override
  String get homeVideos => 'Fideos Cartref';

  @override
  String get mixedContent => 'Cynnwys Cymysg';

  @override
  String get homeVideosAndPhotos => 'Fideos Cartref a Lluniau';

  @override
  String get mixedMoviesAndShows => 'Ffilmiau a Sioeau Cymysg';

  @override
  String get intelQuickSync => 'Sync Cyflym Intel';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Ni chanfuwyd unrhyw recordiadau';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Dim tudalennau delwedd wedi\'u canfod y tu mewn i .$extension archive.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Methodd rendr wedi\'i fewnosod ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Methodd rendr EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Ffeil leol ar goll ar gyfer darllenydd: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status wrth agor data llyfrau o $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Dim pwynt gorffen llyfr darllenadwy ar gael';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Fformat archif comic heb ei gefnogi: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Nid yw ategyn echdynnu CBR ar gael ar y platfform hwn.';

  @override
  String get failedToExtractCbrArchive => 'Wedi methu ag echdynnu archif .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Nid yw echdynnu CB7 ar gael ar y platfform hwn.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Nid yw ategyn echdynnu CB7 ar gael ar y platfform hwn.';

  @override
  String get closeGenrePanel => 'Panel genre agos';

  @override
  String get loadingShuffle => 'Wrthi\'n llwytho siffrwd...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Newid HDR Auto';

  @override
  String get autoHdrSwitchingDescription =>
      'Galluogi HDR yn awtomatig ar gyfer chwarae fideo HDR ac adfer modd arddangos wrth ymadael.';

  @override
  String get whenFullscreen => 'Pan fydd sgrin lawn';

  @override
  String get transcodingLimits => 'Terfynau Trawsgodio';
}
