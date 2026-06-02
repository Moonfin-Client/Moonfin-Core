// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get signIn => 'Pierakstīties';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Ātrais savienojums';

  @override
  String get password => 'Parole';

  @override
  String get username => 'Lietotājvārds';

  @override
  String get email => 'E-pasts';

  @override
  String get quickConnectInstruction =>
      'Ievadiet šo kodu sava servera tīmekļa informācijas panelī:';

  @override
  String get waitingForAuthorization => 'Gaida autorizāciju...';

  @override
  String get back => 'Atpakaļ';

  @override
  String get serverUnavailable => 'Serveris nav pieejams';

  @override
  String get loginFailed => 'Pieteikšanās neizdevās';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Kurš skatās?';

  @override
  String get addUser => 'Pievienot lietotāju';

  @override
  String get selectServer => 'Izvēlieties Serveris';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Saglabātie serveri';

  @override
  String get discoveredServers => 'Atklātie serveri';

  @override
  String get noneFound => 'Nav atrasts neviens';

  @override
  String get unableToConnectToServer => 'Nevar izveidot savienojumu ar serveri';

  @override
  String get addServer => 'Pievienot serveri';

  @override
  String get embyConnect => 'Emby Savienot';

  @override
  String get removeServer => 'Noņemt serveri';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Atcelt';

  @override
  String get remove => 'Noņemt';

  @override
  String get connectToServer => 'Izveidojiet savienojumu ar serveri';

  @override
  String get serverAddress => 'Servera adrese';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Savienot';

  @override
  String get secureStorageUnavailable => 'Droša krātuve nav pieejama';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nevarēja piekļūt jūsu sistēmas atslēgu piekariņam. Pieteikšanos var turpināt, taču droša marķiera krātuve var nebūt pieejama, kamēr atslēgu piekariņš nav atbloķēts.';

  @override
  String get ok => 'Labi';

  @override
  String get settingsAppearanceTheme => 'Lietotnes motīvs';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Pārslēdzieties starp Moonfin un Neon Pulse, nerestartējot lietotni';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Pašreizējais Moonfin izskats, ko jūs visi esat iemīlējuši';

  @override
  String get themeNeonPulse => 'Neona pulss';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave stils ar fuksīna mirdzumu, ciāna tekstu un spēcīgāku hroma kontrastu';

  @override
  String get embyConnectSignInSubtitle =>
      'Pierakstieties ar savu Emby Connect kontu';

  @override
  String get emailOrUsername => 'E-pasts vai lietotājvārds';

  @override
  String get selectAServer => 'Izvēlieties serveri';

  @override
  String get tryAgain => 'Mēģiniet vēlreiz';

  @override
  String get noLinkedServers =>
      'Ar šo Emby Connect kontu nav saistīts neviens serveris';

  @override
  String get invalidEmbyConnectCredentials =>
      'Nederīgi Emby Connect akreditācijas dati';

  @override
  String get invalidEmbyConnectLogin =>
      'Nederīgs Emby Connect lietotājvārds vai parole';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serveris neatbalsta Emby Connect apmaiņu';

  @override
  String get embyConnectNetworkError =>
      'Tīkla kļūda, sazinoties ar Emby Connect vai atlasīto serveri';

  @override
  String get loadingLinkedServers => 'Notiek saistīto serveru ielāde...';

  @override
  String get connectingToServerEllipsis =>
      'Notiek savienojuma izveide ar serveri...';

  @override
  String get noReachableAddress => 'Nav norādīta sasniedzama adrese';

  @override
  String get invalidServerExchangeResponse =>
      'Nederīga atbilde no servera apmaiņas galapunkta';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Vai iziet no Moonfin?';

  @override
  String get exitAppConfirmation => 'Vai tiešām vēlaties iziet?';

  @override
  String get exit => 'Iziet';

  @override
  String get noHomeRowsLoaded => 'Nevarēja ielādēt nevienu sākuma rindu';

  @override
  String get noHomeRowsHint =>
      'Mēģiniet atsvaidzināt vai samazināt aktīvās mājas sadaļas.';

  @override
  String get retryHomeRows => 'Mēģiniet vēlreiz sākuma rindas';

  @override
  String get guide => 'Ceļvedis';

  @override
  String get recordings => 'Ieraksti';

  @override
  String get schedule => 'Grafiks';

  @override
  String get series => 'sērija';

  @override
  String get noItemsFound => 'Nav atrasts neviens vienums';

  @override
  String get home => 'Sākums';

  @override
  String get browseAll => 'Pārlūkot visu';

  @override
  String get genres => 'Žanri';

  @override
  String get collectionPlaceholder => 'Šeit parādīsies kolekcijas vienumi';

  @override
  String get browseByLetter => 'Pārlūkot pēc burtiem';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Šeit tiks parādīta alfabētiskā pārlūkošana';

  @override
  String get suggestions => 'Ieteikumi';

  @override
  String get suggestionsPlaceholder => 'Šeit tiks parādīti ieteiktie vienumi';

  @override
  String get failedToLoadLibraries => 'Neizdevās ielādēt bibliotēkas';

  @override
  String get noLibrariesFound => 'Nav atrasta neviena bibliotēka';

  @override
  String get library => 'Bibliotēka';

  @override
  String get displaySettings => 'Displeja iestatījumi';

  @override
  String get allGenres => 'Visi žanri';

  @override
  String get noGenresFound => 'Nav atrasts neviens žanrs';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Šī mape ir tukša';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Neizdevās ielādēt izlasi';

  @override
  String get retry => 'Mēģiniet vēlreiz';

  @override
  String get noFavoritesYet => 'Izlases vēl nav';

  @override
  String get favorites => 'Izlase';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Turpinot';

  @override
  String get ended => 'Beigās';

  @override
  String get sortAndFilter => 'Kārtot un filtrēt';

  @override
  String get type => 'Tips';

  @override
  String get sortBy => 'Kārtot pēc';

  @override
  String get display => 'Displejs';

  @override
  String get imageType => 'Attēla veids';

  @override
  String get posterSize => 'Plakāta izmērs';

  @override
  String get small => 'Mazs';

  @override
  String get medium => 'Vidēja';

  @override
  String get large => 'Liels';

  @override
  String get extraLarge => 'Īpaši liels';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Skati';

  @override
  String get albums => 'Albumi';

  @override
  String get albumArtists => 'Albuma mākslinieki';

  @override
  String get artists => 'Mākslinieki';

  @override
  String get bookmarks => 'Grāmatzīmes';

  @override
  String get noSavedBookmarks =>
      'Šim nosaukumam vēl nav saglabātu grāmatzīmju.';

  @override
  String get openBook => 'Atvērt grāmatu';

  @override
  String get chapter => 'nodaļa';

  @override
  String get page => 'Lapa';

  @override
  String get bookmark => 'Grāmatzīme';

  @override
  String get justNow => 'Tikai tagad';

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
  String get discoverySubjects => 'Atklāšanas priekšmeti';

  @override
  String get pickDiscoverySubjects =>
      'Izvēlieties, kuras tēmu plūsmas rādīt programmā Discover.';

  @override
  String get apply => 'Pieteikties';

  @override
  String get openLink => 'Atveriet saiti';

  @override
  String get scanWithYourPhone => 'Skenējiet ar tālruni';

  @override
  String get audiobookGenres => 'Audiogrāmatu žanri';

  @override
  String get pickAudiobookGenres =>
      'Izvēlieties, kurus žanrus rādīt programmā Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Atklājiet audiogrāmatas';

  @override
  String get librivoxDescription =>
      'Populāri publiskā domēna nosaukumi no LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Ritiniet pa kreisi';

  @override
  String get scrollRight => 'Ritiniet pa labi';

  @override
  String get couldNotLoadGenre => 'Pašlaik nevarēja ielādēt šo žanru.';

  @override
  String get continueReading => 'Turpināt lasīt';

  @override
  String get savedHighlights => 'Saglabātie svarīgākie punkti';

  @override
  String get continueListening => 'Turpināt Klausīties';

  @override
  String get listen => 'Klausies';

  @override
  String get resume => 'Atsākt';

  @override
  String get failedToLoadLibrary => 'Neizdevās ielādēt bibliotēku';

  @override
  String get popularNow => 'Šobrīd populārs';

  @override
  String get savedForLater => 'Saglabāts Vēlāk';

  @override
  String get topListens => 'Populārākie klausījumi';

  @override
  String get unreadDiscoveries => 'Nelasīti atklājumi';

  @override
  String get pickUpAgain => 'Paņemiet vēlreiz';

  @override
  String get bookHighlightsDescription =>
      'Jūsu grāmatas ar svarīgākajām vietām, izlasi vai lasīšanas progresu.';

  @override
  String get handPickedFromLibrary => 'Ar rokām izvēlēta no jūsu bibliotēkas.';

  @override
  String get handPickedFromListeningQueue =>
      'Ar rokām atlasīts no jūsu klausīšanās rindas.';

  @override
  String get booksWithHighlights =>
      'Grāmatas ar svarīgākajām vietām, izlasi vai lasīšanas progresu.';

  @override
  String get jumpBackNarration =>
      'Atgriezieties stāstījumā, nemeklējot savu vietu.';

  @override
  String get unreadBooksReady =>
      'Nelasītas grāmatas gatavas nākamajai klusajai stundai.';

  @override
  String get quickAccessFavorites =>
      'Ātra piekļuve grāmatām, pie kurām atgriežaties.';

  @override
  String get searchAudiobooks => 'Meklēt audiogrāmatas';

  @override
  String get searchYourLibrary => 'Meklējiet savā bibliotēkā';

  @override
  String get pickUpStory => 'Turpiniet stāstu no vietas, kur to pārtraucāt';

  @override
  String get savedPlacesChapters =>
      'Jūsu saglabātās vietas un nepabeigtās nodaļas';

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
  String get readyWhenYouAre => 'Gatavs, kad esi';

  @override
  String get details => 'Sīkāka informācija';

  @override
  String get listeningRoom => 'Klausīšanās telpa';

  @override
  String get bookmarksAndProgress => 'Grāmatzīmes un norise';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Nosaukumi';

  @override
  String get allTitles => 'Visi nosaukumi';

  @override
  String get authors => 'Autori';

  @override
  String get browseByAuthor => 'Pārlūkot pēc autora';

  @override
  String get browseByGenre => 'Pārlūkot pēc žanra';

  @override
  String get discover => 'Atklājiet';

  @override
  String get trendingTitlesOpenLibrary =>
      'Populārākie nosaukumi pēc tēmas no Open Library.';

  @override
  String get noBookmarkedItems => 'Vēl nav grāmatzīmēs pievienotu vienumu';

  @override
  String get nothingMatchesSection =>
      'Šai sadaļai vēl nekas neatbilst. Izmēģiniet citu cilni vai atgriezieties pēc bibliotēkas sinhronizācijas pabeigšanas.';

  @override
  String get audiobooks => 'Audiogrāmatas';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Mape';

  @override
  String get filters => 'Filtri';

  @override
  String get readingStatus => 'Lasīšanas statuss';

  @override
  String get playedStatus => 'Spēlēts statuss';

  @override
  String get readStatus => 'Lasīt';

  @override
  String get watched => 'Noskatījos';

  @override
  String get unread => 'Nelasīts';

  @override
  String get unwatched => 'Neskatīts';

  @override
  String get seriesStatus => 'Sērijas statuss';

  @override
  String get allLibraries => 'Visas bibliotēkas';

  @override
  String get books => 'Grāmatas';

  @override
  String get author => 'Autors';

  @override
  String get unknownAuthor => 'Nezināms autors';

  @override
  String get uncategorized => 'Bez kategorijas';

  @override
  String get overview => 'Pārskats';

  @override
  String get noLibrivoxDescription =>
      'LibriVox šim nosaukumam vēl nav sniedzis aprakstu.';

  @override
  String get readers => 'Lasītāji';

  @override
  String get openLinks => 'Atveriet saites';

  @override
  String get librivoxPage => 'LibriVox lapa';

  @override
  String get internetArchive => 'Interneta arhīvs';

  @override
  String get rssFeed => 'RSS plūsma';

  @override
  String get downloadZip => 'Lejupielādēt Zip';

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
      'Par šo nosaukumu vēl nav pieejams pārskats no Open Library.';

  @override
  String get subjects => 'Priekšmeti';

  @override
  String get all => 'Visi';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Pašlaik nevarēja ielādēt šo tēmu.';

  @override
  String get audiobookDetails => 'Sīkāka informācija par audiogrāmatu';

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
  String get trackList => 'Dziesmu saraksts';

  @override
  String get itemListPlaceholder => 'Šeit parādīsies preču saraksts';

  @override
  String get favoriteTracksPlaceholder =>
      'Šeit tiks parādīti iecienītākie ieraksti';

  @override
  String get failedToLoad => 'Neizdevās ielādēt';

  @override
  String get delete => 'Dzēst';

  @override
  String get save => 'Saglabāt';

  @override
  String get moreLikeThis => 'Vairāk kā šis';

  @override
  String get castAndCrew => 'Aktieri un komanda';

  @override
  String get collection => 'Kolekcija';

  @override
  String get episodes => 'Epizodes';

  @override
  String get nextUp => 'Nākamais Uz augšu';

  @override
  String get seasons => 'Gadalaiki';

  @override
  String get chapters => 'Nodaļas';

  @override
  String get features => 'Funkcijas';

  @override
  String get movies => 'Filmas';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Cits';

  @override
  String get discography => 'Diskogrāfija';

  @override
  String get similarArtists => 'Līdzīgi mākslinieki';

  @override
  String get tableOfContents => 'Satura rādītājs';

  @override
  String get tracklist => 'Dziesmu saraksts';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biogrāfija';

  @override
  String get authorDetails => 'Sīkāka informācija par autoru';

  @override
  String get noOverviewAvailable =>
      'Par šo nosaukumu vēl nav pieejams pārskats.';

  @override
  String get noBiographyAvailable => 'Šim autoram nav pieejama biogrāfija.';

  @override
  String get noBooksFound => 'Šim autoram nav atrasta neviena grāmata.';

  @override
  String get unableToLoadAuthorDetails =>
      'Pašlaik nevar ielādēt autora informāciju.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Publicēšanas datums nav zināms';

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
  String get view => 'Skatīt';

  @override
  String get resumeReading => 'Atsākt lasīšanu';

  @override
  String get read => 'Lasīt';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Spēlēt';

  @override
  String get startOver => 'Sāciet no jauna';

  @override
  String get restart => 'Restartēt';

  @override
  String get readOffline => 'Lasiet bezsaistē';

  @override
  String get playOffline => 'Spēlējiet bezsaistē';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtitri';

  @override
  String get version => 'Versija';

  @override
  String get cast => 'Cast';

  @override
  String get trailer => 'Treileris';

  @override
  String get finished => 'Pabeigts';

  @override
  String get favorited => 'Pievienots izlasei';

  @override
  String get favorite => 'Mīļākais';

  @override
  String get playlist => 'Atskaņošanas saraksts';

  @override
  String get downloaded => 'Lejupielādēts';

  @override
  String get downloadAll => 'Lejupielādēt visu';

  @override
  String get download => 'Lejupielādēt';

  @override
  String get deleteDownloaded => 'Dzēst lejupielādēto';

  @override
  String get goToSeries => 'Dodieties uz sēriju';

  @override
  String get editMetadata => 'Rediģēt metadatus';

  @override
  String get less => 'Mazāk';

  @override
  String get more => 'Vairāk';

  @override
  String get deleteItem => 'Dzēst vienumu';

  @override
  String get deletePlaylist => 'Dzēst atskaņošanas sarakstu';

  @override
  String get deletePlaylistMessage =>
      'Vai dzēst šo atskaņošanas sarakstu no servera?';

  @override
  String get deleteItemMessage => 'Vai dzēst šo vienumu no servera?';

  @override
  String get failedToDeletePlaylist =>
      'Neizdevās izdzēst atskaņošanas sarakstu';

  @override
  String get failedToDeleteItem => 'Neizdevās izdzēst vienumu';

  @override
  String get renamePlaylist => 'Pārdēvēt atskaņošanas sarakstu';

  @override
  String get playlistName => 'Atskaņošanas saraksta nosaukums';

  @override
  String get deleteDownloadedAlbum => 'Dzēst lejupielādēto albumu';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Lejupielādētie ieraksti ir izdzēsti';

  @override
  String get downloadedTracksDeleteFailed =>
      'Dažus lejupielādētos ierakstus nevarēja izdzēst';

  @override
  String get noTracksLoaded => 'Nav ielādēts neviens ieraksts';

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
  String get itemDeleted => 'Vienums izdzēsts';

  @override
  String get noPlayableTrailerFound =>
      'Nav atrasts neviens atskaņojams reklāmkadri.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Audio celiņš';

  @override
  String get subtitleTrack => 'Subtitru celiņš';

  @override
  String get none => 'Nav';

  @override
  String get downloadSubtitlesLabel => 'Lejupielādēt subtitrus...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Meklējiet, izmantojot spraudni OpenSubtitles';

  @override
  String get downloadSubtitles => 'Lejupielādēt subtitrus';

  @override
  String get selectedSubtitleInvalid => 'Atlasītie subtitri nav derīgi.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitri lejupielādēti. Var paiet kāds brīdis, līdz tas tiks parādīts, kamēr Jellyfin atsvaidzinās vienumu.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Atlasiet Versija';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Lejupielādēt visu — kvalitāte';

  @override
  String get downloadQuality => 'Lejupielādes kvalitāte';

  @override
  String get originalFileNoReencoding =>
      'Oriģinālais fails, bez atkārtotas kodēšanas';

  @override
  String get originalFilesNoReencoding =>
      'Oriģinālie faili, bez atkārtotas kodēšanas';

  @override
  String get noEpisodesLoaded => 'Nav ielādēta neviena sērija';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Dzēst lejupielādētos failus';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Lejupielādētie faili ir izdzēsti';

  @override
  String get failedToDeleteFiles => 'Neizdevās izdzēst failus';

  @override
  String get deleteFiles => 'Dzēst failus';

  @override
  String get director => 'DIREKTORS';

  @override
  String get writers => 'RAKSTNIEKI';

  @override
  String get studio => 'STUDIJA';

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
  String get showLess => 'Rādīt mazāk';

  @override
  String get readMore => 'Lasīt vairāk';

  @override
  String get shuffle => 'Jaukt';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Perfekta sakritība';

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
  String get deleteSeasonFiles => 'visas šīs sezonas lejupielādētās sērijas';

  @override
  String get stillWatching => 'Vai joprojām skatāties?';

  @override
  String get unableToLoadTrailerStream => 'Nevar ielādēt reklāmkadru straumi.';

  @override
  String get trailerTimedOut => 'Iekraušanas laikā piekabei iestājās noildze.';

  @override
  String get playbackFailedForTrailer =>
      'Šī reklāmkadru atskaņošana neizdevās.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Bezsaistes atskaņošanas laikā apraide nav pieejama.';

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
  String get deviceVolume => 'Ierīces skaļums';

  @override
  String get unavailable => 'Nav pieejams';

  @override
  String get pause => 'Pauze';

  @override
  String get syncPosition => 'Sinhronizācijas pozīcija';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Rinda ir tukša';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Attālā atskaņošana';

  @override
  String get castingToGoogleCast => 'Notiek apraide uz Google Cast';

  @override
  String get castingViaAirPlay => 'Apraide, izmantojot AirPlay';

  @override
  String get castingViaDlna => 'Apraide, izmantojot DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Turiet nospiestu, lai atbloķētu';

  @override
  String get off => 'Izslēgts';

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
  String get bitrateOverride => 'Bitu pārraides ātruma ignorēšana';

  @override
  String get audioDelay => 'Audio aizkave';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Subtitru aizkave';

  @override
  String get reset => 'Atiestatīt';

  @override
  String get unknown => 'Nezināms';

  @override
  String get playbackInformation => 'Atskaņošanas informācija';

  @override
  String get playback => 'Atskaņošana';

  @override
  String get playMethod => 'Spēlēšanas metode';

  @override
  String get directPlay => 'Tiešā atskaņošana';

  @override
  String get directStream => 'Tiešā straume';

  @override
  String get transcoding => 'Pārkodēšana';

  @override
  String get transcodeReasons => 'Pārkodēšanas iemesli';

  @override
  String get player => 'Spēlētājs';

  @override
  String get container => 'Konteiners';

  @override
  String get bitrate => 'Bitu pārraides ātrums';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Izšķirtspēja';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodeks';

  @override
  String get videoBitrate => 'Video bitu pārraides ātrums';

  @override
  String get track => 'Trase';

  @override
  String get channels => 'Kanāli';

  @override
  String get audioBitrate => 'Audio bitu pārraides ātrums';

  @override
  String get sampleRate => 'Izlases ātrums';

  @override
  String get format => 'Formāts';

  @override
  String get external => 'Ārējais';

  @override
  String get embedded => 'Iegults';

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
      'EPUB renderēšana lietotnē vēl nav pieejama šajā platformā.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Iegultā dokumentu renderēšana šajā platformā nav pieejama.';

  @override
  String get couldNotOpenExternalViewer => 'Nevarēja atvērt ārējo skatītāju.';

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
      'Vēl nav nevienas grāmatzīmes.\nLasīšanas laikā pieskarieties grāmatzīmes ikonai, lai saglabātu savu pozīciju.';

  @override
  String get noTableOfContentsAvailable => 'Nav pieejams satura rādītājs';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Pozīcija';

  @override
  String get bookReader => 'Grāmatu lasītājs';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Notiek atjaunināšana...';

  @override
  String get markUnread => 'Atzīmēt kā nelasītu';

  @override
  String get markAsRead => 'Atzīmēt kā lasītu';

  @override
  String get reloadReader => 'Pārlādēt lasītāju';

  @override
  String get noPagesFound => 'Nav atrasta neviena lapa.';

  @override
  String get failedToDecodePageImage => 'Neizdevās atšifrēt lapas attēlu.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Viena lapa';

  @override
  String get twoPageSpread => 'Divu lappušu izkliede';

  @override
  String get addBookmark => 'Pievienot grāmatzīmi';

  @override
  String get bookmarksEllipsis => 'Grāmatzīmes...';

  @override
  String get markedAsRead => 'Atzīmēts kā izlasīts';

  @override
  String get markedAsUnread => 'Atzīmēts kā nelasīts';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Tēma: Sistēma';

  @override
  String get themeLight => 'Tēma: Gaisma';

  @override
  String get themeDark => 'Tēma: Tumšs';

  @override
  String get themeSepia => 'Tēma: Sēpija';

  @override
  String get invertColorsFixedLayout => 'Invertēt krāsas (fiksēts izkārtojums)';

  @override
  String get invertColorsPdf => 'Invertēt krāsas (PDF)';

  @override
  String get preparingInAppReader =>
      'Notiek lietotnes lasītāja sagatavošana...';

  @override
  String get pdfDataNotAvailable => 'PDF dati nav pieejami.';

  @override
  String get readerFallbackModeActive => 'Aktīvs lasītāja atkāpšanās režīms';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Izmantojiet Reload Reader pēc pārslēgšanās uz atbalstītu platformas mērķi (Android, iOS, macOS).';

  @override
  String get openExternally => 'Atvērt ārēji';

  @override
  String get noEpubChaptersFound => 'Nav atrasta neviena EPUB nodaļa.';

  @override
  String get readerNotReady => 'Lasītājs nav gatavs.';

  @override
  String get seriesRecordings => 'Sērijas ieraksti';

  @override
  String get now => 'Tagad';

  @override
  String get sports => 'Sports';

  @override
  String get news => 'Jaunumi';

  @override
  String get kids => 'Bērni';

  @override
  String get premiere => 'Pirmizrāde';

  @override
  String get guideTimeline => 'Ceļvedis laika skala';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Nav atrasts neviens kanāls';

  @override
  String get liveBadge => 'TIEŠRAIDĒ';

  @override
  String get movie => 'Filma';

  @override
  String get removedFromFavoriteChannels =>
      'Noņemts no iecienītākajiem kanāliem';

  @override
  String get addedToFavoriteChannels => 'Pievienots iecienītākajiem kanāliem';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Neizdevās atjaunināt iecienītāko kanālu';

  @override
  String get unfavoriteChannel => 'Neiecienīts kanāls';

  @override
  String get favoriteChannel => 'Mīļākais kanāls';

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
  String get watch => 'Skatīties';

  @override
  String get close => 'Aizvērt';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Neizdevās ielādēt ierakstus';

  @override
  String get scheduledInNext24Hours => 'Plānots nākamo 24 stundu laikā';

  @override
  String get recentRecordings => 'Jaunākie ieraksti';

  @override
  String get tvSeries => 'TV seriāls';

  @override
  String get failedToLoadSchedule => 'Neizdevās ielādēt grafiku';

  @override
  String get noScheduledRecordings => 'Nav ieplānotu ierakstu';

  @override
  String get cancelRecording => 'Vai atcelt ierakstīšanu?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Nē';

  @override
  String get yesCancel => 'Jā, Atcelt';

  @override
  String get failedToCancelRecording => 'Neizdevās atcelt ierakstīšanu';

  @override
  String get failedToLoadSeriesRecordings =>
      'Neizdevās ielādēt sērijas ierakstus';

  @override
  String get noSeriesRecordings => 'Nav sēriju ierakstu';

  @override
  String get cancelSeriesRecording => 'Atcelt sērijas ierakstīšanu';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Vai atcelt sērijas ierakstīšanu?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Neizdevās atcelt sērijas ierakstīšanu';

  @override
  String get searchThisLibrary => 'Meklēt šajā bibliotēkā...';

  @override
  String get searchEllipsis => 'Meklēt...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Redzējs';

  @override
  String get seerrAccountType => 'Serr konta veids';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Vietējais';

  @override
  String get savedMedia => 'Saglabātie multivides līdzekļi';

  @override
  String get tvShows => 'TV šovi';

  @override
  String get music => 'Mūzika';

  @override
  String get musicAlbums => 'Mūzikas albumi';

  @override
  String get noMediaInFilter => 'Šajā filtrā nav multivides';

  @override
  String get noDownloadedMediaYet => 'Vēl nav lejupielādēta multivide';

  @override
  String get browseLibrary => 'Pārlūkot bibliotēku';

  @override
  String get deleteDownload => 'Dzēst lejupielādi';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Albums';

  @override
  String get playAlbum => 'Atskaņot albumu';

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
  String get errorLoadingEpisodes => 'Ielādējot sērijas, radās kļūda';

  @override
  String get noDownloadedEpisodes => 'Nav lejupielādētu sēriju';

  @override
  String get deleteEpisode => 'Dzēst sēriju';

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
  String get seriesNotFound => 'Sērija nav atrasta';

  @override
  String get errorLoadingSeries => 'Ielādējot sēriju, radās kļūda';

  @override
  String get downloadedEpisodes => 'Lejupielādētās sērijas';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Īpašie piedāvājumi';

  @override
  String get deleteSeason => 'Dzēst sezonu';

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
  String get storageManagement => 'Krātuves pārvaldība';

  @override
  String get storageBreakdown => 'Krātuves sadalījums';

  @override
  String get downloadedItems => 'Lejupielādētie vienumi';

  @override
  String get storageLimit => 'Krātuves ierobežojums';

  @override
  String get noLimit => 'Nav ierobežojumu';

  @override
  String get deleteAllDownloads => 'Dzēst visas lejupielādes';

  @override
  String get deleteAllDownloadsWarning =>
      'Tādējādi tiks noņemti visi lejupielādētie multivides faili, un darbību nevarēs atsaukt.';

  @override
  String get deleteAll => 'Dzēst visu';

  @override
  String get deleteSelected => 'Dzēst atlasītos';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Mūzika un audiogrāmatas';

  @override
  String get images => 'Attēli';

  @override
  String get database => 'Datu bāze';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Iestatījumi';

  @override
  String get authentication => 'Autentifikācija';

  @override
  String get autoLoginServerManagement =>
      'Automātiska pieteikšanās, servera pārvaldība';

  @override
  String get pinCode => 'PIN kods';

  @override
  String get setUpPinCodeProtection => 'Iestatiet PIN koda aizsardzību';

  @override
  String get parentalControls => 'Vecāku kontrole';

  @override
  String get contentRatingRestrictions => 'Satura vērtējuma ierobežojumi';

  @override
  String get bitRateResolutionBehavior =>
      'Bitu pārraides ātrums, izšķirtspēja, uzvedība';

  @override
  String get languageSizeAppearance => 'Valoda, izmērs, izskats';

  @override
  String get qualityStorage => 'Kvalitāte, uzglabāšana';

  @override
  String get serverSyncAndPluginStatus =>
      'Servera sinhronizācija un spraudņa statuss';

  @override
  String get mediaRequestIntegration => 'Multivides pieprasījumu integrācija';

  @override
  String get switchServer => 'Pārslēgt serveri';

  @override
  String get signOut => 'Izrakstīties';

  @override
  String get versionLicenses => 'Versija, licences';

  @override
  String get account => 'Konts';

  @override
  String get signInAndSecurity => 'Pierakstīšanās un drošība';

  @override
  String get administration => 'Administrācija';

  @override
  String get serverSettingsUsersLibraries =>
      'Servera iestatījumi, lietotāji, bibliotēkas';

  @override
  String get customization => 'Pielāgošana';

  @override
  String get themeAndLayout => 'Tēma un izkārtojums';

  @override
  String get videoAndSubtitles => 'Video un subtitri';

  @override
  String get integrations => 'Integrācijas';

  @override
  String get pluginAndRequests => 'Spraudnis un pieprasījumi';

  @override
  String get customizeAccountPlaybackInterface =>
      'Pielāgojiet konta, atskaņošanas un saskarnes darbību';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Tēma un izskats';

  @override
  String get focusBorderColor => 'Fokusa apmales krāsa';

  @override
  String get watchedIndicators => 'Noskatītie rādītāji';

  @override
  String get always => 'Vienmēr';

  @override
  String get hideUnwatched => 'Paslēpt neskatītos';

  @override
  String get episodesOnly => 'Tikai epizodes';

  @override
  String get never => 'Nekad';

  @override
  String get focusExpansionAnimation => 'Fokusa paplašināšanas animācija';

  @override
  String get desktopUiScale => 'Darbvirsmas lietotāja interfeisa mērogs';

  @override
  String get scaleFocusedCards =>
      'Mērogojiet fokusētas vai kursora kārtis un flīzes';

  @override
  String get backgroundBackdrops => 'Fona foni';

  @override
  String get showBackdropImages => 'Rādīt fona kolāžas attēlus aiz satura';

  @override
  String get seriesThumbnails => 'Sērijas sīktēli';

  @override
  String get seriesThumbnailsDescription =>
      'Tikai epizodes: izmantojiet sērijas mākslas darbus, kas atbilst katram rindu attēla veidam';

  @override
  String get homeRowInfoOverlay => 'Sākuma rindas informācijas pārklājums';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Rādīt nosaukumu un metadatus, pārlūkojot sākuma rindas';

  @override
  String get clockDisplay => 'Pulksteņa displejs';

  @override
  String get inMenus => 'Izvēlnēs';

  @override
  String get inVideo => 'Videoklipā';

  @override
  String get seasonalEffects => 'Sezonas efekti';

  @override
  String get seasonalEffectsDescription =>
      'Vizuālie efekti un sezonas dekorācijas';

  @override
  String get snow => 'Sniegs';

  @override
  String get fireworks => 'Uguņošana';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Krītošās lapas';

  @override
  String get themeMusic => 'Tēma Mūzika';

  @override
  String get playThemeMusicOnDetailPages =>
      'Atskaņojiet motīvu mūziku detalizētās informācijas lapās';

  @override
  String get themeMusicVolume => 'Tēma Mūzikas apjoms';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Motīvā mūzika sākuma rindās';

  @override
  String get playWhenBrowsingHomeScreen => 'Atskaņot, pārlūkojot sākuma ekrānu';

  @override
  String get detailsBackgroundBlur => 'Sīkāka informācija Fona aizmiglojums';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Pārlūkošanas fona aizmiglojums';

  @override
  String get maxStreamingBitrate =>
      'Maksimālais straumēšanas bitu pārraides ātrums';

  @override
  String get maxResolution => 'Maksimālā izšķirtspēja';

  @override
  String get playerZoomMode => 'Spēlētāja tālummaiņas režīms';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Automātiskā apgriešana';

  @override
  String get stretch => 'Izstiepties';

  @override
  String get refreshRateSwitching => 'Atsvaidzes intensitātes pārslēgšana';

  @override
  String get disabled => 'Atspējots';

  @override
  String get scaleOnTv => 'Mērogs televizorā';

  @override
  String get scaleOnDevice => 'Mērogs ierīcē';

  @override
  String get trickPlay => 'Triku spēle';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Rādīt priekšskatījuma sīktēlus, kad meklējat';

  @override
  String get showDescriptionOnPause => 'Rādīt aprakstu pauzē';

  @override
  String get dimVideoShowOverview =>
      'Aptumšot video un rādīt kopsavilkuma tekstu, kamēr tas ir apturēts';

  @override
  String get osdLockButton => 'OSD bloķēšanas poga';

  @override
  String get osdLockButtonDescription =>
      'Rādīt bloķēšanas pogu, kas bloķē skāriena ievadi, līdz tiek ilgi nospiesta';

  @override
  String get audioBehavior => 'Audio uzvedība';

  @override
  String get downmixToStereo => 'Samaisa uz stereo';

  @override
  String get defaultAudioLanguage => 'Noklusējuma audio valoda';

  @override
  String get autoServerDefault => 'Automātiski (servera noklusējums)';

  @override
  String get english => 'angļu valoda';

  @override
  String get spanish => 'spāņu valoda';

  @override
  String get french => 'franču valoda';

  @override
  String get german => 'vācu';

  @override
  String get italian => 'itāļu valoda';

  @override
  String get portuguese => 'portugāļu';

  @override
  String get japanese => 'japāņi';

  @override
  String get korean => 'korejiešu';

  @override
  String get chinese => 'ķīniešu';

  @override
  String get russian => 'krievu valoda';

  @override
  String get arabic => 'arābu';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'holandiešu valoda';

  @override
  String get swedish => 'zviedru';

  @override
  String get norwegian => 'norvēģu';

  @override
  String get danish => 'dāņu';

  @override
  String get finnish => 'somu';

  @override
  String get polish => 'poļu';

  @override
  String get ac3Passthrough => 'AC3 caurlaide';

  @override
  String get dtsPassthrough => 'DTS caurlaide';

  @override
  String get trueHdSupport => 'TrueHD atbalsts';

  @override
  String get enableDtsPassthrough =>
      'Bitu plūsmas DTS audio tikai AVR; nepieciešams uztvērēja atbalsts un DTS avota celiņš';

  @override
  String get enableTrueHdAudio =>
      'Iespējot TrueHD audio (var nedarboties visās platformās)';

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
  String get nightMode => 'Nakts režīms';

  @override
  String get compressDynamicRange => 'Saspiest dinamisko diapazonu';

  @override
  String get advancedMpv => 'Uzlabots mpv';

  @override
  String get enableCustomMpvConf => 'Iespējot pielāgoto mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Pirms atskaņošanas sākuma lietojiet lietotāja norādītu mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => 'Nedrošas papildu mpv opcijas';

  @override
  String get unsafeMpvOptionsDescription =>
      'Atļaut plašāku mpv opciju kopu. Var traucēt atskaņošanas darbību.';

  @override
  String get hardwareDecoding => 'Aparatūras dekodēšana';

  @override
  String get hardwareDecodingSubtitle =>
      'Var uzlabot veiktspēju, taču dažās ierīcēs var rasties atskaņošanas problēmas.';

  @override
  String get nextUpAndQueuing => 'Nākamais augšā un rindā';

  @override
  String get nextUpDisplay => 'Nākamais displejs';

  @override
  String get extended => 'Pagarināts';

  @override
  String get minimal => 'Minimāli';

  @override
  String get nextUpTimeout => 'Nākamais Up Timeout';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Multivides rinda';

  @override
  String get autoQueueNextEpisodes => 'Automātiski iestatīt nākamās sērijas';

  @override
  String get stillWatchingPrompt => 'Joprojām skatos uzvedni';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Atsākt un izlaist';

  @override
  String get resumeRewind => 'Atsākt attīšanu';

  @override
  String get unpauseRewind => 'Attīt atpakaļ';

  @override
  String get fiveSeconds => '5 sekundes';

  @override
  String get tenSeconds => '10 sekundes';

  @override
  String get fifteenSeconds => '15 sekundes';

  @override
  String get thirtySeconds => '30 sekundes';

  @override
  String get skipBackLength => 'Izlaist atpakaļ garumu';

  @override
  String get skipForwardLength => 'Izlaist garumu uz priekšu';

  @override
  String get customMpvConfPath => 'Pielāgots mpv.conf ceļš';

  @override
  String get notSetMpvConf =>
      'Nav iestatīts. Moonfin izmēģinās noklusējuma mpv.conf lietotņu/datu mapēs.';

  @override
  String get selectMpvConf => 'Atlasiet mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stila iestatījumi (izmērs, krāsa, nobīde) attiecas uz teksta subtitriem (SRT, VTT, TTML). ASS/SSA subtitriem tiek izmantots savs iegultais stils, ja vien nav izslēgta ASS/SSA tiešā atskaņošana. Bitkartes subtitrus (PGS, DVB, VobSub) nevar pārveidot.';

  @override
  String get defaultSubtitleLanguage => 'Noklusējuma subtitru valoda';

  @override
  String get defaultToNoSubtitles => 'Pēc noklusējuma nav subtitru';

  @override
  String get turnOffSubtitlesByDefault =>
      'Pēc noklusējuma izslēdziet subtitrus';

  @override
  String get subtitleSize => 'Subtitru lielums';

  @override
  String get textFillColor => 'Teksta aizpildījuma krāsa';

  @override
  String get backgroundColor => 'Fona krāsa';

  @override
  String get textStrokeColor => 'Teksta gājiena krāsa';

  @override
  String get subtitleCustomization => 'Subtitru pielāgošana';

  @override
  String get subtitleCustomizationDescription => 'Pielāgojiet subtitru izskatu';

  @override
  String get subtitlePreviewText => 'Ātrā brūnā lapsa lec pāri slinkajam sunim';

  @override
  String get verticalOffset => 'Vertikālā nobīde';

  @override
  String get pgsDirectPlay => 'PGS tiešā spēle';

  @override
  String get directPlayPgsSubtitles => 'Tiešā atskaņošana PGS subtitriem';

  @override
  String get assSsaDirectPlay => 'ASS/SSA tiešā atskaņošana';

  @override
  String get directPlayAssSsaSubtitles =>
      'Tiešā atskaņošana ASS/SSA subtitriem';

  @override
  String get white => 'Balts';

  @override
  String get black => 'Melns';

  @override
  String get yellow => 'Dzeltens';

  @override
  String get green => 'Zaļš';

  @override
  String get cyan => 'Ciāna';

  @override
  String get red => 'Sarkans';

  @override
  String get transparent => 'Caurspīdīgs';

  @override
  String get semiTransparentBlack => 'Daļēji caurspīdīgs melns';

  @override
  String get global => 'Globāli';

  @override
  String get desktop => 'Darbvirsma';

  @override
  String get mobile => 'Mobilais';

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
  String get customizationProfile => 'Pielāgošanas profils';

  @override
  String get customizationProfileDescription =>
      'Izvēlieties profilu, ko ielādēt, rediģēt un sinhronizēt. Globālais ir spēkā visur, ja vien ierīces profils to neaizstāda. Zaļais punkts apzīmē jūsu pašreizējo ierīces profilu.';

  @override
  String get loadProfile => 'Ielādēt profilu';

  @override
  String get syncing => 'Sinhronizē...';

  @override
  String get syncToProfile => 'Sinhronizēt ar profilu';

  @override
  String get profileSyncHidden => 'Profila sinhronizācija ir paslēpta';

  @override
  String get enablePluginSyncDescription =>
      'Iespējojiet servera spraudņa sinhronizāciju spraudņa iestatījumos, lai šeit rādītu profila vadīklas.';

  @override
  String get quality => 'Kvalitāte';

  @override
  String get defaultDownloadQuality => 'Noklusējuma lejupielādes kvalitāte';

  @override
  String get network => 'Tīkls';

  @override
  String get wifiOnlyDownloads => 'Tikai WiFi lejupielādes';

  @override
  String get onlyDownloadOnWifi =>
      'Lejupielādējiet tikai tad, kad ir izveidots savienojums ar WiFi';

  @override
  String get storage => 'Uzglabāšana';

  @override
  String get storageUsed => 'Uzglabāšana Lietota';

  @override
  String get manage => 'Pārvaldīt';

  @override
  String get calculating => 'Notiek aprēķināšana...';

  @override
  String get downloadLocation => 'Lejupielādes atrašanās vieta';

  @override
  String get defaultLabel => 'Noklusējums';

  @override
  String get saveToDownloadsFolder => 'Saglabāt mapē Lejupielādes';

  @override
  String get downloadsVisibleToOtherApps =>
      'Lejupielādes/Moonfin — redzams citām lietotnēm';

  @override
  String get dangerZone => 'Bīstamā zona';

  @override
  String get clearAllDownloads => 'Notīrīt visas lejupielādes';

  @override
  String get original => 'Oriģināls';

  @override
  String get changeDownloadLocation => 'Mainiet lejupielādes vietu';

  @override
  String get changeDownloadLocationDescription =>
      'Jaunās lejupielādes tiks saglabātas atlasītajā mapē. Esošās lejupielādes paliks to pašreizējā atrašanās vietā, un tās var pārvaldīt krātuves iestatījumos.';

  @override
  String get confirm => 'Apstiprināt';

  @override
  String get cannotWriteToFolder =>
      'Nevar rakstīt atlasītajā mapē. Lūdzu, izvēlieties citu atrašanās vietu vai piešķiriet krātuves atļaujas.';

  @override
  String get saveToDownloadsFolderQuestion => 'Vai saglabāt mapē Lejupielādes?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Lejupielādētie multivide tiks saglabāti jūsu ierīces mapē Lejupielādes/Moonfin. Šie faili būs redzami citām lietotnēm, piemēram, jūsu galerijai vai mūzikas atskaņotājam.\n\nEsošās lejupielādes paliks to pašreizējā atrašanās vietā.';

  @override
  String get enable => 'Iespējot';

  @override
  String get clearAllDownloadsWarning =>
      'Tādējādi tiks dzēsti visi lejupielādētie multivides līdzekļi, un darbību nevarēs atsaukt.';

  @override
  String get clearAll => 'Notīrīt visu';

  @override
  String get navigationStyle => 'Navigācijas stils';

  @override
  String get topBar => 'Augšējā josla';

  @override
  String get leftSidebar => 'Kreisā sānjosla';

  @override
  String get showShuffleButton => 'Rādīt jaukšanas pogu';

  @override
  String get showGenresButton => 'Poga Rādīt žanrus';

  @override
  String get showFavoritesButton => 'Rādīt pogu Izlase';

  @override
  String get showLibrariesInToolbar => 'Rādīt bibliotēkas rīkjoslā';

  @override
  String get navbarOpacity => 'Navigācijas joslas necaurredzamība';

  @override
  String get navbarColor => 'Navigbar Krāsa';

  @override
  String get gray => 'Pelēks';

  @override
  String get darkBlue => 'Tumši zils';

  @override
  String get purple => 'Violeta';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'Navy';

  @override
  String get charcoal => 'Ogles';

  @override
  String get brown => 'Brūns';

  @override
  String get darkRed => 'Tumši Sarkans';

  @override
  String get darkGreen => 'Tumši zaļš';

  @override
  String get slate => 'Šīferis';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Bibliotēkas displejs';

  @override
  String get posterLabel => 'Plakāts';

  @override
  String get thumbnailLabel => 'Sīktēls';

  @override
  String get bannerLabel => 'Reklāmkarogs';

  @override
  String get overridePerLibrarySettings =>
      'Ignorēt katras bibliotēkas iestatījumus';

  @override
  String get applyImageTypeToAllLibraries =>
      'Lietojiet attēla veidu visām bibliotēkām';

  @override
  String get multiServerLibraries => 'Vairāku serveru bibliotēkas';

  @override
  String get showLibrariesFromAllServers =>
      'Rādīt bibliotēkas no visiem pievienotajiem serveriem';

  @override
  String get enableFolderView => 'Iespējot mapju skatu';

  @override
  String get showFolderBrowsingOption => 'Rādīt mapju pārlūkošanas opciju';

  @override
  String get libraryVisibility => 'Bibliotēkas redzamība';

  @override
  String get libraryVisibilityDescription =>
      'Pārslēgt mājas lapas redzamību katrai bibliotēkai. Restartējiet Moonfin, lai izmaiņas stātos spēkā.';

  @override
  String get showInNavigation => 'Rādīt navigācijā';

  @override
  String get showInLatestMedia => 'Rādīt jaunākajos medijos';

  @override
  String get sourceLibraries => 'Avotu bibliotēkas';

  @override
  String get sourceCollections => 'Avotu kolekcijas';

  @override
  String get excludedGenres => 'Izslēgtie žanri';

  @override
  String get selectAll => 'Atlasiet visu';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Multivides josla';

  @override
  String get mediaSources => 'Multivides avoti';

  @override
  String get behavior => 'Uzvedība';

  @override
  String get seconds => 'sekundes';

  @override
  String get localPreviews => 'Vietējie priekšskatījumi';

  @override
  String get localPreviewsDescription =>
      'Konfigurējiet reklāmkadrus, multivides un audio priekšskatījumus.';

  @override
  String get mediaBarMode => 'Multivides joslas stils';

  @override
  String get mediaBarModeDescription =>
      'Izvēlieties Moonfin, MakD vai izslēdziet multivides joslu';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Izslēgts';

  @override
  String get enableMediaBar => 'Iespējot multivides joslu';

  @override
  String get showFeaturedContentSlideshow =>
      'Rādīt piedāvātā satura slaidrādi sākumlapā';

  @override
  String get contentType => 'Satura veids';

  @override
  String get moviesAndTvShows => 'Filmas un TV šovi';

  @override
  String get moviesOnly => 'Tikai filmas';

  @override
  String get tvShowsOnly => 'Tikai TV pārraides';

  @override
  String get itemCount => 'Preču skaits';

  @override
  String get noneSelected => 'Nav atlasīts neviens';

  @override
  String get noneExcluded => 'Neviens nav izslēgts';

  @override
  String get autoAdvance => 'Automātiskā pāreja';

  @override
  String get autoAdvanceSlides => 'Automātiski pāriet uz nākamo slaidu';

  @override
  String get autoAdvanceInterval => 'Automātiskās pārejas intervāls';

  @override
  String get trailerPreview => 'Reklāmkadru priekšskatījums';

  @override
  String get autoPlayTrailers =>
      'Automātiski atskaņojiet reklāmkadrus multivides joslā pēc 3 sekundēm';

  @override
  String get episodePreview => 'Sērijas priekšskatījums';

  @override
  String get mediaPreview => 'Multivides priekšskatījums';

  @override
  String get episodePreviewDescription =>
      'Atskaņojiet 30 sekunžu iekļautu priekšskatījumu fokusētās, kursoru novietotās vai ilgi nospiestās kartēs';

  @override
  String get mediaPreviewDescription =>
      'Atskaņojiet 30 sekunžu iekļauto priekšskatījumu fokusētās, kursoru novietotās vai ilgi nospiestās kartēs';

  @override
  String get previewAudio => 'Audio priekšskatījums';

  @override
  String get enablePreviewAudio =>
      'Iespējot audio reklāmkadru un sēriju priekšskatījumiem';

  @override
  String get latestMedia => 'Jaunākie mediji';

  @override
  String get recentlyReleased => 'Nesen Izlaists';

  @override
  String get myMedia => 'Mani mediji';

  @override
  String get myMediaSmall => 'Mani multivide (mazi)';

  @override
  String get continueWatching => 'Turpināt skatīties';

  @override
  String get resumeAudio => 'Atsākt audio';

  @override
  String get resumeBooks => 'Atsākt grāmatas';

  @override
  String get activeRecordings => 'Aktīvie ieraksti';

  @override
  String get playlists => 'Atskaņošanas saraksti';

  @override
  String get liveTV => 'TV tiešraide';

  @override
  String get homeSections => 'Sākuma sadaļas';

  @override
  String get resetToDefaults => 'Atiestatīt uz noklusējuma iestatījumiem';

  @override
  String get homeRowPosterSize => 'Sākuma rindas plakāta izmērs';

  @override
  String get perRowImageTypeSelection => 'Katrai rindai attēla veida izvēle';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurējiet attēla veidu katrai iespējotajai sākuma rindai';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Apvienojiet Turpināt skatīšanos un Tālāk';

  @override
  String get combineBothRows => 'Apvienojiet abas rindas vienā sākuma sadaļā';

  @override
  String get perRowImageType => 'Rindas attēla veids';

  @override
  String get perRowSettings => 'Iestatījumi katrā rindā';

  @override
  String get autoLogin => 'Automātiska pieteikšanās';

  @override
  String get lastUser => 'Pēdējais lietotājs';

  @override
  String get specificUser => 'Konkrēts lietotājs';

  @override
  String get alwaysAuthenticate => 'Vienmēr autentificēt';

  @override
  String get requirePasswordWithToken =>
      'Pieprasīt paroli pat ar saglabātu marķieri';

  @override
  String get confirmExit => 'Apstipriniet izeju';

  @override
  String get showConfirmationBeforeExiting =>
      'Rādīt apstiprinājumu pirms iziešanas';

  @override
  String get blockContentWithRatings => 'Bloķēt saturu ar šādiem vērtējumiem:';

  @override
  String get noContentRatingsFound =>
      'Šajā serverī vēl nav atrasts neviens satura vērtējums.';

  @override
  String get couldNotLoadServerRatings =>
      'Nevarēja ielādēt servera vērtējumus. Tiek rādīti tikai saglabātie vērtējumi.';

  @override
  String get couldNotRefreshRatings =>
      'Nevarēja atsvaidzināt vērtējumus no servera. Tiek rādīti saglabātie vērtējumi.';

  @override
  String get enablePinCode => 'Iespējot PIN kodu';

  @override
  String get requirePinToAccess => 'Pieprasīt PIN, lai piekļūtu savam kontam';

  @override
  String get changePin => 'Mainīt PIN';

  @override
  String get setNewPinCode => 'Iestatiet jaunu PIN kodu';

  @override
  String get removePin => 'Noņemiet PIN';

  @override
  String get removePinProtection => 'Noņemiet PIN koda aizsardzību';

  @override
  String get screensaver => 'Ekrānsaudzētājs';

  @override
  String get inAppScreensaver => 'Lietotnē iebūvēts ekrānsaudzētājs';

  @override
  String get enableBuiltInScreensaver => 'Iespējojiet iebūvēto ekrānsaudzētāju';

  @override
  String get mode => 'Režīms';

  @override
  String get libraryArt => 'Bibliotēka Art';

  @override
  String get logo => 'Logotips';

  @override
  String get clock => 'Pulkstenis';

  @override
  String get timeout => 'Taimauts';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Aptumšošanas līmenis';

  @override
  String get maxAgeRating => 'Maksimālais vecuma ierobežojums';

  @override
  String get any => 'Jebkurš';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Nepieciešams vecuma ierobežojums';

  @override
  String get onlyShowRatedContent => 'Rādīt tikai novērtēto saturu';

  @override
  String get showClock => 'Rādīt pulksteni';

  @override
  String get displayClockDuringScreensaver =>
      'Parādīt pulksteni ekrānsaudzētāja laikā';

  @override
  String get rottenTomatoesCritics => 'Sapuvuši tomāti (kritiķi)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (auditorija)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritisks';

  @override
  String get metacriticUser => 'Metacritic (lietotājs)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Pastkastīte';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Kopienas vērtējums';

  @override
  String get ratings => 'Vērtējumi';

  @override
  String get additionalRatings => 'Papildu vērtējumi';

  @override
  String get showMdbListAndTmdbRatings => 'Rādīt MDBList un TMDB vērtējumus';

  @override
  String get ratingLabels => 'Vērtējuma etiķetes';

  @override
  String get showLabelsNextToIcons => 'Rādīt iezīmes blakus vērtējuma ikonām';

  @override
  String get ratingBadges => 'Vērtējuma nozīmītes';

  @override
  String get showDecorativeBadges =>
      'Parādiet dekoratīvas emblēmas aiz vērtējumiem';

  @override
  String get episodeRatings => 'Sēriju vērtējumi';

  @override
  String get showRatingsOnEpisodes => 'Rādīt vērtējumus atsevišķām sērijām';

  @override
  String get ratingSources => 'Vērtējumu avoti';

  @override
  String get ratingSourcesDescription =>
      'Iespējojiet un pārkārtojiet visā lietotnē rādītos vērtēšanas avotus';

  @override
  String get pluginLabel => 'Spraudnis';

  @override
  String get pluginDetected => 'Spraudnis konstatēts';

  @override
  String get pluginNotDetected => 'Spraudnis nav noteikts';

  @override
  String get pluginDetectedDescription =>
      'Konstatēts servera spraudnis. Sinhronizācija tiek iespējota automātiski, kad spraudnis tiek atrasts pirmo reizi.';

  @override
  String get pluginNotDetectedDescription =>
      'Servera spraudnis pašlaik nav atklāts. Vietējie iestatījumi joprojām izmanto to saglabātās vērtības vai iebūvētos noklusējuma iestatījumus.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Pieejamie pakalpojumi';

  @override
  String get serverPluginSync => 'Servera spraudņa sinhronizācija';

  @override
  String get syncSettingsWithPlugin =>
      'Sinhronizējiet iestatījumus ar servera spraudni';

  @override
  String get whatSyncControls => 'Kādas sinhronizācijas vadīklas';

  @override
  String get syncControlsDescription =>
      'Sinhronizācija kontrolē tikai to, vai spraudņu atbalstītie iestatījumi tiek nosūtīti uz serveri un izņemti no tā. Profila atlase un profila sinhronizācijas darbības atrodas pielāgošanas iestatījumos, kad ir iespējota spraudņa sinhronizācija.';

  @override
  String get recentRequests => 'Jaunākie pieprasījumi';

  @override
  String get recentlyAdded => 'Nesen pievienots';

  @override
  String get trending => 'Tendences';

  @override
  String get popularMovies => 'Populāras filmas';

  @override
  String get movieGenres => 'Filmu žanri';

  @override
  String get upcomingMovies => 'Gaidāmās filmas';

  @override
  String get studios => 'Studijas';

  @override
  String get popularSeries => 'Populārs seriāls';

  @override
  String get seriesGenres => 'Sērijas žanri';

  @override
  String get upcomingSeries => 'Gaidāmā sērija';

  @override
  String get networks => 'Tīkli';

  @override
  String get resetRowsToDefaults =>
      'Atiestatīt rindas uz noklusējuma iestatījumiem';

  @override
  String get enableSeerr => 'Iespējot Seerr';

  @override
  String get showSeerrInNavigation =>
      'Rādīt Seer navigācijā (nepieciešams servera spraudnis)';

  @override
  String get seerrUnavailable =>
      'Nav pieejams, jo servera spraudņa Seerr atbalsts ir atspējots.';

  @override
  String get nsfwFilter => 'NSFW filtrs';

  @override
  String get hideAdultContent =>
      'Paslēpt rezultātos pieaugušajiem paredzētu saturu';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Atklājiet rindas';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Velciet, lai pārkārtotu. Iespējot vai atspējot rindas. Iespējota rindu secība sinhronizējas ar spraudni Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Velciet, lai pārkārtotu. Iespējot vai atspējot rindas.';

  @override
  String get enabled => 'Iespējots';

  @override
  String get hidden => 'Slēpts';

  @override
  String get aboutTitle => 'Par';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Atvērtā pirmkoda licences';

  @override
  String get sourceCode => 'Avota kods';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Pārbaudiet atjauninājumus tūlīt';

  @override
  String get checksLatestDesktopRelease =>
      'Pārbauda šīs platformas jaunāko darbvirsmas versiju';

  @override
  String get youAreUpToDate => 'Jūs esat lietas kursā.';

  @override
  String get couldNotCheckForUpdates =>
      'Pašlaik nevarēja pārbaudīt atjauninājumus.';

  @override
  String get noCompatibleUpdate =>
      'Šai platformai nav atrasta saderīga atjauninājumu pakotne.';

  @override
  String get updateChecksNotSupported =>
      'Atjauninājumu pārbaudes šajā platformā netiek atbalstītas.';

  @override
  String get updateNotificationsDisabled =>
      'Atjaunināšanas paziņojumi ir atspējoti.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Lūdzu, uzgaidiet pirms atkārtotas pārbaudes.';

  @override
  String get latestUpdateAlreadyShown =>
      'Pēdējais atjauninājums jau tika parādīts.';

  @override
  String get updateAvailable => 'Pieejams atjauninājums.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Atjaunināt paziņojumus';

  @override
  String get showWhenUpdatesAvailable => 'Rādīt, kad ir pieejami atjauninājumi';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Izlasiet izlaiduma piezīmes';

  @override
  String get downloadingUpdate => 'Notiek atjauninājuma lejupielāde...';

  @override
  String get updateDownloadFailed =>
      'Atjaunināšanas lejupielāde neizdevās. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get openReleasesPage => 'Atveriet laidienu lapu';

  @override
  String get navigation => 'Navigācija';

  @override
  String get watchedIndicatorsBackdrops => 'Noskatīti rādītāji, foni';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokusa krāsa, skatītie indikatori, foni';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navigācijas joslas stils, rīkjoslas pogas, izskats';

  @override
  String get reorderToggleHomeRows => 'Pārkārtot un pārslēgt sākuma rindas';

  @override
  String get featuredContentAppearance => 'Piedāvātais saturs, izskats';

  @override
  String get posterSizeImageTypeFolderView =>
      'Plakāta izmērs, attēla veids, mapes skats';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB un reitingu avoti';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Skaidrs';

  @override
  String get browse => 'Pārlūkot';

  @override
  String get noResults => 'Nav rezultātu';

  @override
  String get seerrAvailableStatus => 'Pieejams';

  @override
  String get seerrRequestedStatus => 'Pieprasīts';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Redzēja iestatījumi';

  @override
  String get requestMore => 'Pieprasīt vairāk';

  @override
  String get request => 'Pieprasīt';

  @override
  String get cancelRequest => 'Atcelt pieprasījumu';

  @override
  String get playInMoonfin => 'Spēlē Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Apstiprināt';

  @override
  String get declineAction => 'Noraidīt';

  @override
  String get similar => 'Līdzīgi';

  @override
  String get recommendations => 'Ieteikumi';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Saglabāt';

  @override
  String get itemNotFoundInLibrary =>
      'Vienums nav atrasts jūsu Moonfin bibliotēkā';

  @override
  String get errorSearchingLibrary => 'Meklējot bibliotēku, radās kļūda';

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
  String get submitRequest => 'Iesniedziet pieprasījumu';

  @override
  String get allSeasons => 'Visas sezonas';

  @override
  String get advancedOptions => 'Papildu opcijas';

  @override
  String get noServiceServersConfigured =>
      'Nav konfigurēts neviens pakalpojumu serveris';

  @override
  String get server => 'Serveris';

  @override
  String get qualityProfile => 'Kvalitātes profils';

  @override
  String get rootFolder => 'Saknes mape';

  @override
  String get showMore => 'Rādīt vairāk';

  @override
  String get appearances => 'Izskati';

  @override
  String get crewSection => 'Apkalpe';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Nav pieprasījumu';

  @override
  String get pendingStatus => 'Gaida';

  @override
  String get declinedStatus => 'Noraidīts';

  @override
  String get partiallyAvailable => 'Daļēji pieejams';

  @override
  String get downloadingStatus => 'Notiek lejupielāde';

  @override
  String get approvedStatus => 'Apstiprināts';

  @override
  String get notRequestedStatus => 'Nav pieprasīts';

  @override
  String get blocklistedStatus => 'Bloķēts sarakstā';

  @override
  String get deletedStatus => 'Izdzēsts';

  @override
  String get tmdbScore => 'TMDB rezultāts';

  @override
  String get releaseDateLabel => 'Izdošanas datums';

  @override
  String get firstAirDateLabel => 'Pirmais ētera datums';

  @override
  String get revenueLabel => 'Ieņēmumi';

  @override
  String get runtimeLabel => 'Izpildes laiks';

  @override
  String get budgetLabel => 'Budžets';

  @override
  String get originalLanguageLabel => 'Oriģinālvaloda';

  @override
  String get seasonsLabel => 'Gadalaiki';

  @override
  String get episodesLabel => 'Epizodes';

  @override
  String get access => 'Piekļuve';

  @override
  String get add => 'Pievienot';

  @override
  String get address => 'Adrese';

  @override
  String get analytics => 'Analytics';

  @override
  String get catalog => 'Katalogs';

  @override
  String get content => 'Saturs';

  @override
  String get copy => 'Kopēt';

  @override
  String get create => 'Izveidot';

  @override
  String get disable => 'Atspējot';

  @override
  String get done => 'Gatavs';

  @override
  String get edit => 'Rediģēt';

  @override
  String get encoding => 'Kodēšana';

  @override
  String get error => 'Kļūda';

  @override
  String get forward => 'Uz priekšu';

  @override
  String get general => 'Ģenerālis';

  @override
  String get go => 'Aiziet';

  @override
  String get install => 'Instalējiet';

  @override
  String get installed => 'Uzstādīts';

  @override
  String get interval => 'Intervāls';

  @override
  String get name => 'Vārds';

  @override
  String get networking => 'Tīklošana';

  @override
  String get next => 'Tālāk';

  @override
  String get path => 'Ceļš';

  @override
  String get paused => 'Pauzēts';

  @override
  String get permissions => 'Atļaujas';

  @override
  String get processing => 'Apstrāde';

  @override
  String get profile => 'Profils';

  @override
  String get provider => 'Pakalpojumu sniedzējs';

  @override
  String get refresh => 'Atsvaidzināt';

  @override
  String get remote => 'Tālvadības pults';

  @override
  String get rename => 'Pārdēvēt';

  @override
  String get revoke => 'Atsaukt';

  @override
  String get role => 'Loma';

  @override
  String get root => 'Sakne';

  @override
  String get run => 'Skrien';

  @override
  String get search => 'Meklēt';

  @override
  String get select => 'Izvēlieties';

  @override
  String get send => 'Sūtīt';

  @override
  String get sessions => 'Sesijas';

  @override
  String get set => 'Iestatīt';

  @override
  String get status => 'Statuss';

  @override
  String get stop => 'Stop';

  @override
  String get streaming => 'Straumēšana';

  @override
  String get time => 'Laiks';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Atinstalēt';

  @override
  String get up => 'Uz augšu';

  @override
  String get update => 'Atjaunināt';

  @override
  String get upload => 'Augšupielādēt';

  @override
  String get unmute => 'Ieslēgt skaņu';

  @override
  String get mute => 'Izslēgt skaņu';

  @override
  String get branding => 'Brendings';

  @override
  String get adminDrawerDashboard => 'Informācijas panelis';

  @override
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'Iestatījumi';

  @override
  String get adminDrawerBranding => 'Brendings';

  @override
  String get adminDrawerUsers => 'Lietotāji';

  @override
  String get adminDrawerLibraries => 'Bibliotēkas';

  @override
  String get adminDrawerTranscoding => 'Pārkodēšana';

  @override
  String get adminDrawerResume => 'Atsākt';

  @override
  String get adminDrawerStreaming => 'Straumēšana';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Ierīces';

  @override
  String get adminDrawerActivity => 'Aktivitāte';

  @override
  String get adminDrawerNetworking => 'Tīklošana';

  @override
  String get adminDrawerApiKeys => 'API atslēgas';

  @override
  String get adminDrawerBackups => 'Dublējumkopijas';

  @override
  String get adminDrawerLogs => 'Baļķi';

  @override
  String get adminDrawerScheduledTasks => 'Plānotie uzdevumi';

  @override
  String get adminDrawerPlugins => 'Spraudņi';

  @override
  String get adminDrawerRepositories => 'Krātuves';

  @override
  String get adminDrawerLiveTv => 'TV tiešraide';

  @override
  String get adminExitTooltip => 'Iziet no Admin';

  @override
  String get adminDashboardLoadFailed =>
      'Neizdevās ielādēt informācijas paneli';

  @override
  String get adminMediaOverview => 'Plašsaziņas līdzekļu pārskats';

  @override
  String get adminMediaTotalsError =>
      'Nevarēja ielādēt servera multivides kopsummas.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Īsa informācija par to, cik daudz satura ir šajā serverī.';

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
  String get analyticsMediaDistribution => 'Mediju izplatīšana';

  @override
  String get analyticsVideoCodecs => 'Video kodeki';

  @override
  String get analyticsAudioCodecs => 'Audio kodeki';

  @override
  String get analyticsContainers => 'Konteineri';

  @override
  String get analyticsTopGenres => 'Populārākie žanri';

  @override
  String get analyticsReleaseYears => 'Izlaiduma gadi';

  @override
  String get analyticsContentRatings => 'Satura vērtējumi';

  @override
  String get analyticsRuntimeBuckets => 'Izpildes laika segmenti';

  @override
  String get analyticsFileFormats => 'Failu formāti';

  @override
  String get analyticsNoData => 'Dati nav pieejami.';

  @override
  String get adminServerInfo => 'Servera informācija';

  @override
  String get adminRestartPending => 'Restartēšana gaida';

  @override
  String get adminServerPaths => 'Servera ceļi';

  @override
  String get adminServerActions => 'Servera darbības';

  @override
  String get adminRestartServer => 'Restartējiet serveri';

  @override
  String get adminShutdownServer => 'Izslēgšanas serveris';

  @override
  String get adminScanLibraries => 'Bibliotēku skenēšana';

  @override
  String get adminLibraryScanStarted => 'Sākta bibliotēkas skenēšana';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Notiek servera atsāknēšana';

  @override
  String get adminServerRebootMessage =>
      'Notiek servera atsāknēšana, lūdzu, restartējiet Moonfin';

  @override
  String get adminActiveSessions => 'Aktīvās sesijas';

  @override
  String get adminSessionsLoadFailed => 'Neizdevās ielādēt sesijas';

  @override
  String get adminNoActiveSessions => 'Nav aktīvu sesiju';

  @override
  String get adminRecentActivity => 'Pēdējā darbība';

  @override
  String get adminNoRecentActivity => 'Nav pēdējo darbību';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Nosūtīt ziņu';

  @override
  String get adminMessageTextHint => 'Ziņas teksts';

  @override
  String get adminSetVolume => 'Iestatīt skaļumu';

  @override
  String get sessionPrev => 'Iepriekšējā';

  @override
  String get sessionRewind => 'Attīt atpakaļ';

  @override
  String get sessionForward => 'Uz priekšu';

  @override
  String get sessionNext => 'Tālāk';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Tagad spēlē';

  @override
  String get volume => 'Skaļums';

  @override
  String get actions => 'Darbības';

  @override
  String get videoCodec => 'Video kodeks';

  @override
  String get audioCodec => 'Audio kodeks';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Pabeigšana';

  @override
  String get direct => 'Tieša';

  @override
  String get adminDisconnect => 'Atvienot';

  @override
  String get adminClearDates => 'Skaidri datumi';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nav darbību ierakstu';

  @override
  String get adminEditDeviceName => 'Rediģēt ierīces nosaukumu';

  @override
  String get adminCustomName => 'Pielāgots nosaukums';

  @override
  String get adminDeviceNameUpdated => 'Ierīces nosaukums ir atjaunināts';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Dzēst ierīci';

  @override
  String get adminDeviceDeleted => 'Ierīce izdzēsta';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Neizdevās ielādēt ierīces';

  @override
  String get adminSearchDevices => 'Meklēt ierīces';

  @override
  String get adminThisDevice => 'Šī Ierīce';

  @override
  String get adminEditName => 'Rediģēt nosaukumu';

  @override
  String get adminLibrariesLoadFailed => 'Neizdevās ielādēt bibliotēkas';

  @override
  String get adminNoLibraries => 'Nav konfigurēta neviena bibliotēka';

  @override
  String get adminScanAllLibraries => 'Skenējiet visas bibliotēkas';

  @override
  String get adminAddLibrary => 'Pievienot bibliotēku';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Pārdēvēt bibliotēku';

  @override
  String get adminNewName => 'Jauns nosaukums';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Dzēst bibliotēku';

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
  String get adminRemovePath => 'Noņemt ceļu';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Bibliotēkas opcijas ir saglabātas';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Neizdevās ielādēt bibliotēku';

  @override
  String get adminNoMediaPaths => 'Nav konfigurēti multivides ceļi';

  @override
  String get adminAddPath => 'Pievienot ceļu';

  @override
  String get adminBrowseFilesystem => 'Pārlūkot servera failu sistēmu:';

  @override
  String get adminSaveOptions => 'Saglabāt opcijas';

  @override
  String get adminPreferredMetadataLanguage => 'Vēlamā metadatu valoda';

  @override
  String get adminMetadataLanguageHint => 'piem. lv, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadatu valsts kods';

  @override
  String get adminMetadataCountryHint => 'piem. ASV, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Jānorāda bibliotēkas nosaukums';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotēkas nosaukums';

  @override
  String get adminSelectedPaths => 'Atlasītie ceļi:';

  @override
  String get adminNoPathsAdded =>
      'Nav pievienots neviens ceļš (var pievienot vēlāk)';

  @override
  String get adminCreateLibrary => 'Izveidot bibliotēku';

  @override
  String get paths => 'Ceļi:';

  @override
  String get adminDisableUser => 'Atspējot lietotāju';

  @override
  String get adminEnableUser => 'Iespējot lietotāju';

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
  String get adminUsersLoadFailed => 'Neizdevās ielādēt lietotājus';

  @override
  String get adminSearchUsers => 'Meklēt lietotājus';

  @override
  String get adminEditUser => 'Rediģēt lietotāju';

  @override
  String get adminAddUser => 'Pievienot lietotāju';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Izveidot lietotāju';

  @override
  String get adminPasswordOptional => 'Parole (pēc izvēles)';

  @override
  String get adminUsernameRequired => 'Lietotājvārda lauks nedrīkst būt tukšs';

  @override
  String get adminNoProfileChanges => 'Nav saglabājamu profila izmaiņu';

  @override
  String get adminProfileSaved => 'Profils saglabāts';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Atļaujas saglabātas';

  @override
  String get adminPasswordsMismatch => 'Paroles nesakrīt';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Neizdevās ielādēt lietotāju';

  @override
  String get adminBackToUsers => 'Atpakaļ uz lietotājiem';

  @override
  String get adminSaveProfile => 'Saglabāt profilu';

  @override
  String get adminDeleteUser => 'Dzēst lietotāju';

  @override
  String get admin => 'Administrators';

  @override
  String get adminFullAccessWarning =>
      'Administratoriem ir pilnīga piekļuve serverim. Piešķiriet piesardzīgi.';

  @override
  String get administrator => 'Administrators';

  @override
  String get adminHiddenUser => 'Slēpts lietotājs';

  @override
  String get adminAllowMediaPlayback => 'Atļaut multivides atskaņošanu';

  @override
  String get adminAllowAudioTranscoding => 'Atļaut audio pārkodēšanu';

  @override
  String get adminAllowVideoTranscoding => 'Atļaut video pārkodēšanu';

  @override
  String get adminAllowRemuxing => 'Atļaut sajaukšanu';

  @override
  String get adminForceRemoteTranscoding =>
      'Piespiedu attālā avota pārkodēšana';

  @override
  String get adminAllowContentDeletion => 'Atļaut satura dzēšanu';

  @override
  String get adminAllowContentDownloading => 'Atļaut satura lejupielādi';

  @override
  String get adminAllowPublicSharing => 'Atļaut publisku kopīgošanu';

  @override
  String get adminAllowRemoteControl =>
      'Atļaut tālvadības pulti citiem lietotājiem';

  @override
  String get adminAllowSharedDeviceControl =>
      'Atļaut koplietotu ierīces vadību';

  @override
  String get adminAllowRemoteAccess => 'Atļaut attālo piekļuvi';

  @override
  String get adminRemoteBitrateLimit =>
      'Attālā klienta bitu pārraides ātruma ierobežojums (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Atstājiet tukšu bez ierobežojumiem';

  @override
  String get adminMaxActiveSessions => 'Maksimālais aktīvo sesiju skaits';

  @override
  String get adminAllowLiveTvAccess => 'Atļaut piekļuvi TV tiešraidei';

  @override
  String get adminAllowLiveTvManagement => 'Atļaut tiešraides pārvaldību';

  @override
  String get adminAllowCollectionManagement => 'Atļaut kolekcijas pārvaldību';

  @override
  String get adminAllowSubtitleManagement => 'Atļaut subtitru pārvaldību';

  @override
  String get adminAllowLyricManagement => 'Atļaut dziesmu tekstu pārvaldību';

  @override
  String get adminSavePermissions => 'Saglabāt atļaujas';

  @override
  String get adminEnableAllLibraryAccess =>
      'Iespējot piekļuvi visām bibliotēkām';

  @override
  String get adminSaveAccess => 'Saglabāt piekļuvi';

  @override
  String get adminChangePassword => 'Mainīt paroli';

  @override
  String get adminNewPassword => 'Jauna parole';

  @override
  String get adminConfirmPassword => 'Apstipriniet paroli';

  @override
  String get adminSetPassword => 'Iestatīt paroli';

  @override
  String get adminResetPassword => 'Atiestatīt paroli';

  @override
  String get adminPasswordReset => 'Paroles atiestatīšana';

  @override
  String get adminPasswordUpdated => 'Parole atjaunināta';

  @override
  String get adminUserSettings => 'Lietotāja iestatījumi';

  @override
  String get adminLibraryAccess => 'Piekļuve bibliotēkai';

  @override
  String get adminDeviceAndChannelAccess => 'Piekļuve ierīcei un kanālam';

  @override
  String get adminEnableAllDevices => 'Iespējot piekļuvi visām ierīcēm';

  @override
  String get adminEnableAllChannels => 'Iespējot piekļuvi visiem kanāliem';

  @override
  String get adminResetPasswordWarning =>
      'Tas noņems paroli. Lietotājs varēs pieteikties bez paroles.';

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
  String get adminCreateApiKey => 'Izveidojiet API atslēgu';

  @override
  String get adminAppName => 'Lietotnes nosaukums';

  @override
  String get adminApiKeyCreated => 'API atslēga ir izveidota';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Atslēga ir veiksmīgi izveidota. Serveris neatdeva marķieri. Pārbaudiet servera API atslēgas.';

  @override
  String get adminKeyCopied => 'Atslēga ir kopēta starpliktuvē';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Servera atbildē trūkst atslēgas marķiera';

  @override
  String get adminRevokeApiKey => 'Atsaukt API atslēgu';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API atslēga atsaukta';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Neizdevās ielādēt API atslēgas';

  @override
  String get adminApiKeysTitle => 'API atslēgas';

  @override
  String get adminCreateKey => 'Izveidot atslēgu';

  @override
  String get adminNoApiKeys => 'Nav atrasta neviena API atslēga';

  @override
  String get adminUnknownApp => 'Nezināma lietotne';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Notiek dublējuma izveide...';

  @override
  String get adminBackupCreated => 'Dublējums ir veiksmīgi izveidots';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'Servera atbildē trūkst rezerves ceļa';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Apstipriniet Atjaunot';

  @override
  String get adminRestoringBackup => 'Notiek dublējuma atjaunošana...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Neizdevās ielādēt dublējumus';

  @override
  String get adminCreateBackup => 'Izveidot dublējumu';

  @override
  String get adminNoBackups => 'Dublējumkopijas nav atrastas';

  @override
  String get adminViewDetails => 'Skatīt detaļas';

  @override
  String get restore => 'Atjaunot';

  @override
  String get adminLogsLoadFailed => 'Neizdevās ielādēt servera žurnālus';

  @override
  String get adminNoLogFiles => 'Nav atrasts neviens žurnālfails';

  @override
  String get adminLogCopied => 'Žurnāls ir kopēts starpliktuvē';

  @override
  String get adminSaveLogFile => 'Saglabājiet žurnāla failu';

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
  String get adminSearchInLog => 'Meklēt žurnālā';

  @override
  String get adminNoMatchingLines => 'Nav atbilstošu līniju';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nav atrasts neviens ieplānots uzdevums';

  @override
  String get adminNoTasksMatchFilter =>
      'Neviens uzdevums neatbilst pašreizējam filtram';

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
  String get adminRunNow => 'Skrien tūlīt';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Pēdējā izpilde';

  @override
  String get adminTriggers => 'Trigeri';

  @override
  String get adminAddTrigger => 'Pievienot trigeri';

  @override
  String get adminNoTriggers => 'Nav konfigurēts neviens aktivizētājs';

  @override
  String get adminTriggerType => 'Trigera veids';

  @override
  String get adminTimeLimit => 'Laika ierobežojums (pēc izvēles)';

  @override
  String get adminNoLimit => 'Nav ierobežojumu';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Nedēļas diena';

  @override
  String get adminSearchPlugins => 'Meklēt spraudņus...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Atinstalējiet spraudni';

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
      'Neviens spraudnis neatbilst jūsu meklēšanas vaicājumam';

  @override
  String get adminNoPluginsInstalled => 'Nav instalēts neviens spraudnis';

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
      'Neviena pakotne neatbilst jūsu meklēšanas vaicājumam';

  @override
  String get adminNoPackagesAvailable => 'Paciņas nav pieejamas';

  @override
  String get adminExperimentalIntegration => 'Eksperimentālā integrācija';

  @override
  String get adminExperimentalWarning =>
      'Spraudņa iestatījumu integrācija joprojām ir eksperimentāla. Dažas iestatījumu lapas var netikt renderētas pareizi.';

  @override
  String get continueAction => 'Turpināt';

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
      'Nevar atvērt iestatījumus: trūkst autentifikācijas pilnvaras.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Spraudnis nav atrasts';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Iespējot spraudni';

  @override
  String get adminPluginSettingsPage => 'Spraudņa iestatījumu lapa';

  @override
  String get adminRevisionHistory => 'Pārskatīšanas vēsture';

  @override
  String get adminNoChangelog => 'Nav pieejams izmaiņu žurnāls.';

  @override
  String get adminRemoveRepository => 'Noņemt repozitoriju';

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
  String get adminRepositoryNameHint => 'piem. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'Repozitorija URL';

  @override
  String get adminAddEntry => 'Pievienot ierakstu';

  @override
  String get adminInvalidUrl => 'Nederīgs URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Atvērt pārlūkprogrammā';

  @override
  String get adminOpenExternally => 'Atvērt ārēji';

  @override
  String get adminGeneralSettings => 'Vispārīgi iestatījumi';

  @override
  String get adminServerName => 'Servera nosaukums';

  @override
  String get adminPreferredMetadataCountry => 'Vēlamā metadatu valsts';

  @override
  String get adminCachePath => 'Kešatmiņas ceļš';

  @override
  String get adminMetadataPath => 'Metadatu ceļš';

  @override
  String get adminLibraryScanConcurrency =>
      'Bibliotēkas skenēšanas vienlaicīgums';

  @override
  String get adminParallelImageEncodingLimit =>
      'Paralēlā attēla kodēšanas ierobežojums';

  @override
  String get adminSlowResponseThreshold => 'Lēnas reakcijas slieksnis (ms)';

  @override
  String get adminBrandingSaved => 'Zīmola iestatījumi ir saglabāti';

  @override
  String get adminBrandingLoadFailed => 'Neizdevās ielādēt zīmola iestatījumus';

  @override
  String get adminLoginDisclaimer => 'Pieteikšanās atruna';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML tiek parādīts zem pieteikšanās veidlapas';

  @override
  String get adminCustomCss => 'Pielāgots CSS';

  @override
  String get adminCustomCssHint =>
      'Pielāgots CSS, kas tiek lietots tīmekļa saskarnē';

  @override
  String get adminEnableSplashScreen => 'Iespējot uzplaiksnījumu ekrānu';

  @override
  String get adminStreamingSaved => 'Straumēšanas iestatījumi ir saglabāti';

  @override
  String get adminStreamingLoadFailed =>
      'Neizdevās ielādēt straumēšanas iestatījumus';

  @override
  String get adminStreamingDescription =>
      'Iestatiet globālos straumēšanas bitu pārraides ātruma ierobežojumus attāliem savienojumiem.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Attālā klienta bitu pārraides ātruma ierobežojums (Mb/s)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Atstājiet tukšu vai 0, lai neierobežotu';

  @override
  String get adminPlaybackSaved => 'Atskaņošanas iestatījumi ir saglabāti';

  @override
  String get adminPlaybackLoadFailed =>
      'Neizdevās ielādēt atskaņošanas iestatījumus';

  @override
  String get adminPlaybackTranscoding => 'Atskaņošana / pārkodēšana';

  @override
  String get adminHardwareAcceleration => 'Aparatūras paātrinājums';

  @override
  String get adminVaapiDevice => 'VA-API ierīce';

  @override
  String get adminEnableHardwareEncoding => 'Iespējot aparatūras kodējumu';

  @override
  String get adminEnableHardwareDecoding => 'Iespējot aparatūras dekodēšanu:';

  @override
  String get adminEncodingThreads => 'Kodēšanas pavedieni';

  @override
  String get adminAutomatic => '0 = automātiski';

  @override
  String get adminTranscodingTempPath => 'Pārkodēšanas temp ceļš';

  @override
  String get adminEnableFallbackFont => 'Iespējot atkāpšanās fontu';

  @override
  String get adminFallbackFontPath => 'Atkāpšanās fonta ceļš';

  @override
  String get adminAllowSegmentDeletion => 'Atļaut segmenta dzēšanu';

  @override
  String get adminSegmentKeepSeconds => 'Segmenta saglabāšana (sekundēs)';

  @override
  String get adminThrottleBuffering => 'Droseles buferizācija';

  @override
  String get adminTrickplaySaved => 'Trickplay iestatījumi ir saglabāti';

  @override
  String get adminTrickplayLoadFailed =>
      'Neizdevās ielādēt triku spēles iestatījumus';

  @override
  String get adminEnableHardwareAcceleration =>
      'Iespējot aparatūras paātrinājumu';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Iespējot tikai atslēgas rāmja izvilkšanu';

  @override
  String get adminKeyFrameSubtitle => 'Ātrāka, bet zemāka precizitāte';

  @override
  String get adminScanBehavior => 'Skenēšanas uzvedība';

  @override
  String get adminProcessPriority => 'Procesa prioritāte';

  @override
  String get adminImageSettings => 'Attēla iestatījumi';

  @override
  String get adminIntervalMs => 'Intervāls (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Cik bieži uzņemt kadrus';

  @override
  String get adminWidthResolutions => 'Platuma izšķirtspējas';

  @override
  String get adminTileWidth => 'Flīžu platums';

  @override
  String get adminTileHeight => 'Flīžu augstums';

  @override
  String get adminQualitySubtitle =>
      'Zemākas vērtības = labāka kvalitāte, lielāki faili';

  @override
  String get adminProcessThreads => 'Apstrādājiet pavedienus';

  @override
  String get adminResumeSaved => 'Atsākšanas iestatījumi ir saglabāti';

  @override
  String get adminResumeLoadFailed =>
      'Neizdevās ielādēt atsākšanas iestatījumus';

  @override
  String get adminResumeDescription =>
      'Konfigurējiet, kad saturs ir jāatzīmē kā daļēji vai pilnībā atskaņots.';

  @override
  String get adminMinResumePercentage => 'Minimālais atsākšanas procents';

  @override
  String get adminMinResumeSubtitle =>
      'Lai saglabātu progresu, saturs ir jāatskaņo, pārsniedzot šo procentuālo daļu';

  @override
  String get adminMaxResumePercentage => 'Maksimālais atsākšanas procents';

  @override
  String get adminMaxResumeSubtitle =>
      'Pēc šī procentuālā daudzuma saturs tiek uzskatīts par pilnībā atskaņotu';

  @override
  String get adminMinResumeDuration =>
      'Minimālais atsākšanas ilgums (sekundēs)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Vienumus, kas ir īsāki par šo, nevar atsākt';

  @override
  String get adminMinAudiobookResume =>
      'Minimālais audiogrāmatas atsākšanas procents';

  @override
  String get adminMaxAudiobookResume =>
      'Maksimālais audiogrāmatas atsākšanas procents';

  @override
  String get adminNetworkingSaved =>
      'Tīkla iestatījumi ir saglabāti. Var būt nepieciešama servera restartēšana.';

  @override
  String get adminNetworkingLoadFailed =>
      'Neizdevās ielādēt tīkla iestatījumus';

  @override
  String get adminNetworkingWarning =>
      'Lai veiktu izmaiņas tīkla iestatījumos, var būt nepieciešama servera restartēšana.';

  @override
  String get adminEnableRemoteAccess => 'Iespējot attālo piekļuvi';

  @override
  String get ports => 'Ostas';

  @override
  String get adminHttpPort => 'HTTP ports';

  @override
  String get adminHttpsPort => 'HTTPS ports';

  @override
  String get adminPublicHttpsPort => 'Publisks HTTPS ports';

  @override
  String get adminBaseUrl => 'Pamata URL';

  @override
  String get adminBaseUrlHint => 'piem. /želeja';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Iespējot HTTPS';

  @override
  String get adminLocalNetwork => 'Vietējais tīkls';

  @override
  String get adminLocalNetworkAddresses => 'Vietējā tīkla adreses';

  @override
  String get adminKnownProxies => 'Zināmi starpniekserveri';

  @override
  String get adminRemoteIpFilter => 'Attālais IP filtrs';

  @override
  String get adminRemoteIpFilterEntries => 'Attālais IP filtrs';

  @override
  String get adminCertificatePath => 'Sertifikāta ceļš';

  @override
  String get whitelist => 'Baltais saraksts';

  @override
  String get blacklist => 'Melnais saraksts';

  @override
  String get notSet => 'Nav iestatīts';

  @override
  String get adminMetadataSaved => 'Metadati saglabāti';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Atsvaidziniet metadatus';

  @override
  String get recursive => 'Rekursīvs';

  @override
  String get adminReplaceAllMetadata => 'Aizstāt visus metadatus';

  @override
  String get adminReplaceAllImages => 'Aizstāt visus attēlus';

  @override
  String get adminMetadataRefreshRequested =>
      'Pieprasīta metadatu atsvaidzināšana';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Meklēt attālo personu';

  @override
  String get adminNoRemoteMatches =>
      'Nav atrasta neviena attālināta atbilstība';

  @override
  String get adminRemoteResults => 'Attālinātie rezultāti';

  @override
  String get adminRemoteMetadataApplied => 'Lietoti attālie metadati';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Atjaunināt satura veidu';

  @override
  String get adminContentType => 'Satura veids';

  @override
  String get adminContentTypeUpdated => 'Satura veids atjaunināts';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Neizdevās ielādēt metadatu redaktoru';

  @override
  String get adminNoPeopleEntries => 'Nav personu ierakstu';

  @override
  String get adminNoExternalIds => 'Ārējie ID nav pieejami';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Neatbalstīts attēla formāts';

  @override
  String get adminImageReadFailed => 'Neizdevās nolasīt atlasīto attēlu';

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
  String get adminAllProviders => 'Visi pakalpojumu sniedzēji';

  @override
  String get adminNoRemoteImages => 'Nav atrasts neviens attālais attēls';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Pievienojiet uztvērēju';

  @override
  String get adminTunerType => 'Uztvērēja tips';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, cits';

  @override
  String get adminUrlPath => 'URL/ceļš';

  @override
  String get adminNameOptional => 'Vārds (neobligāti)';

  @override
  String get adminTunerAdded => 'Pievienots uztvērējs';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Pievienot ceļveža nodrošinātāju';

  @override
  String get adminProviderType => 'Pakalpojumu sniedzēja veids';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect vai XMLTV';

  @override
  String get adminUsernameOptional => 'Lietotājvārds (pēc izvēles)';

  @override
  String get adminRefreshInterval => 'Atsvaidzināšanas intervāls (stundas)';

  @override
  String get adminProviderAdded => 'Pakalpojumu sniedzējs ir pievienots';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Pieprasīta uztvērēja atiestatīšana';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Ierakstīšanas iestatījumi';

  @override
  String get adminPrePadding => 'Iepriekšējais polsterējums (minūtes)';

  @override
  String get adminPostPadding => 'Pēcaizpildīšana (minūtes)';

  @override
  String get adminRecordingPath => 'Ierakstīšanas ceļš';

  @override
  String get adminSeriesRecordingPath => 'Sērijas ierakstīšanas ceļš';

  @override
  String get adminRecordingSettingsSaved =>
      'Ierakstīšanas iestatījumi saglabāti';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Iestatiet kanālu kartējumus';

  @override
  String get adminMappingJson => 'JSON kartēšana';

  @override
  String get adminMappingJsonHint =>
      'Piemērs: JSON lietderīgās slodzes kartēšana';

  @override
  String get adminChannelMappingsUpdated => 'Kanālu kartējumi ir atjaunināti';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Neizdevās ielādēt TV tiešraides administrāciju';

  @override
  String get adminTunerDevices => 'Uztvērēja ierīces';

  @override
  String get adminNoTunerHosts =>
      'Nav konfigurēts neviens uztvērēja saimniekdators';

  @override
  String get adminGuideProviders => 'Ceļvežu sniedzēji';

  @override
  String get adminAddProvider => 'Pievienot nodrošinātāju';

  @override
  String get adminNoListingProviders =>
      'Nav konfigurēts neviens ierakstu nodrošinātājs';

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
  String get adminTunerDiscovery => 'Uztvērēja atklāšana';

  @override
  String get adminChannelMappings => 'Kanālu kartējumi';

  @override
  String get adminNoDiscoveredTuners => 'Vēl nav atklātu uztvērēju';

  @override
  String get adminSettingsSaved => 'Iestatījumi saglabāti';

  @override
  String get adminBackupsNotAvailable =>
      'Dublējumkopijas šajā servera versijā nav pieejamas.';

  @override
  String get adminRestoreWarning1 =>
      'Atjaunojot, VISI pašreizējie servera dati tiks aizstāti ar rezerves datiem.';

  @override
  String get adminRestoreWarning2 =>
      'Pašreizējie servera iestatījumi, lietotāji un bibliotēkas dati tiks pārrakstīti.';

  @override
  String get adminRestoreWarning3 =>
      'Pēc atjaunošanas serveris tiks restartēts.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Pieprasīta atjaunošana. Servera restartēšana var atvienot šo sesiju.';

  @override
  String get adminBackupsTitle => 'Dublējumkopijas';

  @override
  String get adminUnknownDate => 'Nezināms datums';

  @override
  String get adminUnnamedBackup => 'Dublējums bez nosaukuma';

  @override
  String get adminLiveTvNotAvailable =>
      'TV tiešraides administrēšana šajā servera versijā nav pieejama.';

  @override
  String get adminLiveTvTitle => 'TV tiešraides administrācija';

  @override
  String get adminApply => 'Pieteikties';

  @override
  String get adminNotSet => 'Nav iestatīts';

  @override
  String get adminReset => 'Atiestatīt';

  @override
  String get adminLogsTitle => 'Servera žurnāli';

  @override
  String get adminLogsNewestFirst => 'Jaunākie vispirms';

  @override
  String get adminLogsOldestFirst => 'Vecākais pirmais';

  @override
  String get adminLogsJustNow => 'Tikai tagad';

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
  String get adminLogViewerNoMatches => 'Nav atbilstošu līniju';

  @override
  String get adminMetadataEditorTitle => 'Metadatu redaktors';

  @override
  String get adminMetadataRemote => 'Tālvadības pults';

  @override
  String get adminMetadataType => 'Tips';

  @override
  String get adminMetadataDetails => 'Sīkāka informācija';

  @override
  String get adminMetadataExternalIds => 'Ārējie ID';

  @override
  String get adminMetadataImages => 'Attēli';

  @override
  String get adminMetadataFieldTitle => 'Nosaukums';

  @override
  String get adminMetadataFieldSortTitle => 'Kārtot virsrakstu';

  @override
  String get adminMetadataFieldOriginalTitle => 'Oriģinālais nosaukums';

  @override
  String get adminMetadataFieldPremiereDate =>
      'Pirmizrādes datums (GGGG-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Beigu datums (GGGG-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Ražošanas gads';

  @override
  String get adminMetadataFieldOfficialRating => 'Oficiālais vērtējums';

  @override
  String get adminMetadataFieldCommunityRating => 'Kopienas vērtējums';

  @override
  String get adminMetadataFieldCriticRating => 'Kritiķu vērtējums';

  @override
  String get adminMetadataFieldTagline => 'Tagline';

  @override
  String get adminMetadataFieldOverview => 'Pārskats';

  @override
  String get adminMetadataGenres => 'Žanri';

  @override
  String get adminMetadataTags => 'Tagi';

  @override
  String get adminMetadataStudios => 'Studijas';

  @override
  String get adminMetadataPeople => 'Cilvēki';

  @override
  String get adminMetadataAddGenre => 'Pievienojiet žanru';

  @override
  String get adminMetadataAddTag => 'Pievienot tagu';

  @override
  String get adminMetadataAddStudio => 'Pievienojiet studiju';

  @override
  String get adminMetadataAddPerson => 'Pievienot personu';

  @override
  String get adminMetadataEditPerson => 'Rediģēt personu';

  @override
  String get adminMetadataRole => 'Loma';

  @override
  String get adminMetadataImagePrimary => 'Primārais';

  @override
  String get adminMetadataImageBackdrop => 'Fons';

  @override
  String get adminMetadataImageLogo => 'Logotips';

  @override
  String get adminMetadataImageBanner => 'Reklāmkarogs';

  @override
  String get adminMetadataImageThumb => 'Īkšķis';

  @override
  String get adminMetadataRecursive => 'Rekursīvs';

  @override
  String get adminMetadataProvider => 'Pakalpojumu sniedzējs';

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
      'Neizdevās nolasīt atlasīto attēlu';

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
      'Tādējādi no vienuma tiek noņemts pašreizējais attēls.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Augšupielādēt';

  @override
  String get adminMetadataUpdate => 'Atjaunināt';

  @override
  String get adminMetadataRemoteImage => 'Attālināts attēls';

  @override
  String get adminPluginsInstalled => 'Uzstādīts';

  @override
  String get adminPluginsCatalog => 'Katalogs';

  @override
  String get adminPluginsActive => 'Aktīvs';

  @override
  String get adminPluginsRestart => 'Restartēt';

  @override
  String get adminPluginsNoSearchResults =>
      'Neviens spraudnis neatbilst jūsu meklēšanas vaicājumam';

  @override
  String get adminPluginsNoneInstalled => 'Nav instalēts neviens spraudnis';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Pieejams atjauninājums';

  @override
  String get adminPluginsPendingRemoval => 'Gaida noņemšanu pēc restartēšanas';

  @override
  String get adminPluginsChangesPending => 'Izmaiņas gaida restartēšanu';

  @override
  String get adminPluginsEnable => 'Iespējot';

  @override
  String get adminPluginsDisable => 'Atspējot';

  @override
  String get adminPluginsInstallUpdate => 'Instalējiet atjauninājumu';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Neviena pakotne neatbilst jūsu meklēšanas vaicājumam';

  @override
  String get adminPluginsCatalogEmpty => 'Paciņas nav pieejamas';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimentālā integrācija';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Spraudņa iestatījumu integrācija joprojām ir eksperimentāla. Daži lauki vai izkārtojumi vēl var netikt renderēti pareizi.';

  @override
  String get adminPluginDetailToggle404 =>
      'Neizdevās pārslēgt spraudni. Serveris nevarēja atrast šo spraudņa versiju. Mēģiniet atsvaidzināt spraudņus un pēc tam mēģiniet vēlreiz.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Neizdevās pārslēgt spraudni. Lūdzu, pārbaudiet servera žurnālus, lai iegūtu sīkāku informāciju.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Sīkāka informācija';

  @override
  String get adminPluginDetailDeveloper => 'Izstrādātājs';

  @override
  String get adminPluginDetailRepository => 'Repozitorijs';

  @override
  String get adminPluginDetailBundled => 'Komplektā';

  @override
  String get adminPluginDetailEnablePlugin => 'Iespējot spraudni';

  @override
  String get adminPluginDetailRestartRequired =>
      'Lai izmaiņas stātos spēkā, ir jārestartē serveris.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Šis spraudnis tiks noņemts pēc servera restartēšanas.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Šis spraudnis ir nepareizi darbojies un var nedarboties pareizi.';

  @override
  String get adminPluginDetailNotSupported =>
      'Pašreizējā servera versija šo spraudni neatbalsta.';

  @override
  String get adminPluginDetailSuperseded =>
      'Šis spraudnis ir aizstāts ar jaunāku versiju.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Noņemt repozitoriju';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Noņemt';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Nav konfigurētu repozitoriju';

  @override
  String get adminReposEmptySubtitle =>
      'Pievienojiet repozitoriju, lai pārlūkotu pieejamos spraudņus';

  @override
  String get adminReposUnnamed => '(bez nosaukuma)';

  @override
  String get adminReposEditTitle => 'Rediģēt repozitoriju';

  @override
  String get adminReposAddTitle => 'Pievienot repozitoriju';

  @override
  String get adminReposUrl => 'Repozitorija URL';

  @override
  String get adminReposNameHint => 'piem. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Nederīgs URL';

  @override
  String get adminGeneralSettingsTitle => 'Vispārīgi iestatījumi';

  @override
  String get adminGeneralMetadataLanguage => 'Vēlamā metadatu valoda';

  @override
  String get adminGeneralMetadataLanguageHint => 'piem. lv, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Vēlamā metadatu valsts';

  @override
  String get adminGeneralMetadataCountryHint => 'piem. ASV, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Bibliotēkas skenēšanas vienlaicīgums';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Paralēlā attēla kodēšanas ierobežojums';

  @override
  String get adminUnknownError => 'Nezināma kļūda';

  @override
  String get adminBrowse => 'Pārlūkot';

  @override
  String get adminCloseBrowser => 'Aizveriet pārlūkprogrammu';

  @override
  String get adminNetworkingTitle => 'Tīklošana';

  @override
  String get adminNetworkingRestartWarning =>
      'Lai veiktu izmaiņas tīkla iestatījumos, var būt nepieciešama servera restartēšana.';

  @override
  String get adminNetworkingRemoteAccess => 'Iespējot attālo piekļuvi';

  @override
  String get adminNetworkingPorts => 'Ostas';

  @override
  String get adminNetworkingHttpPort => 'HTTP ports';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS ports';

  @override
  String get adminNetworkingEnableHttps => 'Iespējot HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Vietējais tīkls';

  @override
  String get adminNetworkingLocalAddresses => 'Vietējā tīkla adreses';

  @override
  String get adminNetworkingAddressHint => 'piem. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Zināmi starpniekserveri';

  @override
  String get adminNetworkingProxyHint => 'piem. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Baltais saraksts';

  @override
  String get adminNetworkingBlacklist => 'Melnais saraksts';

  @override
  String get adminNetworkingAddEntry => 'Pievienot ierakstu';

  @override
  String get adminBrandingTitle => 'Brendings';

  @override
  String get adminBrandingLoginDisclaimer => 'Pieteikšanās atruna';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML tiek parādīts zem pieteikšanās veidlapas';

  @override
  String get adminBrandingCustomCss => 'Pielāgots CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Pielāgots CSS, kas tiek lietots tīmekļa saskarnē';

  @override
  String get adminBrandingEnableSplash => 'Iespējot uzplaiksnījumu ekrānu';

  @override
  String get adminPlaybackHwAccel => 'Aparatūras paātrinājums';

  @override
  String get adminPlaybackHwAccelLabel => 'Aparatūras paātrinājums';

  @override
  String get adminPlaybackEnableHwEncoding => 'Iespējot aparatūras kodējumu';

  @override
  String get adminPlaybackEnableHwDecoding => 'Iespējot aparatūras dekodēšanu:';

  @override
  String get adminPlaybackEncoding => 'Kodēšana';

  @override
  String get adminPlaybackEncodingThreads => 'Kodēšanas pavedieni';

  @override
  String get adminPlaybackFallbackFont => 'Iespējot atkāpšanās fontu';

  @override
  String get adminPlaybackFallbackFontPath => 'Atkāpšanās fonta ceļš';

  @override
  String get adminPlaybackStreaming => 'Straumēšana';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Audiogrāmatas';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimālais audiogrāmatas atsākšanas procents';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maksimālais audiogrāmatas atsākšanas procents';

  @override
  String get adminStreamingBitrateLimit =>
      'Attālā klienta bitu pārraides ātruma ierobežojums (Mb/s)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Atstājiet tukšu vai 0, lai neierobežotu';

  @override
  String get adminTrickplayHwAccel => 'Iespējot aparatūras paātrinājumu';

  @override
  String get adminTrickplayHwEncoding => 'Iespējot aparatūras kodējumu';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Iespējot tikai atslēgas rāmja izvilkšanu';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Ātrāka, bet zemāka precizitāte';

  @override
  String get adminTrickplayNonBlocking => 'Nebloķējošs';

  @override
  String get adminTrickplayBlocking => 'Bloķēšana';

  @override
  String get adminTrickplayPriorityHigh => 'Augsts';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Virs parastā';

  @override
  String get adminTrickplayPriorityNormal => 'Normāls';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Zem normas';

  @override
  String get adminTrickplayPriorityIdle => 'Dīkstāvē';

  @override
  String get adminTrickplayImageSettings => 'Attēla iestatījumi';

  @override
  String get adminTrickplayInterval => 'Intervāls (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Cik bieži uzņemt kadrus';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Ar komatu atdalīti pikseļu platumi (piem., 320)';

  @override
  String get adminTrickplayQuality => 'Kvalitāte';

  @override
  String get adminTrickplayQScale => 'Kvalitātes skala';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Zemākas vērtības = labāka kvalitāte, lielāki faili';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kvalitāte';

  @override
  String get adminTrickplayProcessing => 'Apstrāde';

  @override
  String get adminTasksEmpty => 'Nav atrasts neviens ieplānots uzdevums';

  @override
  String get adminTasksNoFilterMatch =>
      'Neviens uzdevums neatbilst pašreizējam filtram';

  @override
  String get adminTaskCancelling => 'Notiek atcelšana...';

  @override
  String get adminTaskRunning => 'Skriešana...';

  @override
  String get adminTaskNeverRun => 'Nekad neskrien';

  @override
  String get adminTaskStop => 'Stop';

  @override
  String get adminTaskRun => 'Skrien';

  @override
  String get adminTaskDetailLastExecution => 'Pēdējā izpilde';

  @override
  String get adminTaskDetailStarted => 'Sākts';

  @override
  String get adminTaskDetailEnded => 'Beigās';

  @override
  String get adminTaskDetailDuration => 'Ilgums';

  @override
  String get adminTaskDetailErrorLabel => 'Kļūda:';

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
  String get adminTaskTriggerStartup => 'Lietojumprogrammas palaišanas laikā';

  @override
  String get adminTaskTriggerTypeDaily => 'Ikdienas';

  @override
  String get adminTaskTriggerTypeWeekly => 'Iknedēļas';

  @override
  String get adminTaskTriggerTypeInterval => 'Uz intervālu';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervāls';

  @override
  String get adminTaskTriggerEveryHour => 'Katru stundu';

  @override
  String get adminTaskTriggerEvery6Hours => 'Ik pēc 6 stundām';

  @override
  String get adminTaskTriggerEvery12Hours => 'Ik pēc 12 stundām';

  @override
  String get adminTaskTriggerEvery24Hours => 'Ik pēc 24 stundām';

  @override
  String get adminTaskTriggerEvery2Days => 'Ik pēc 2 dienām';

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
  String get adminTaskTriggerTime => 'Laiks';

  @override
  String get adminTaskTriggerNoLimit => 'Nav ierobežojumu';

  @override
  String get adminActivityJustNow => 'Tikai tagad';

  @override
  String get adminActivityLastHour => 'Pēdējā stunda';

  @override
  String get adminActivityToday => 'Šodien';

  @override
  String get adminActivityYesterday => 'vakar';

  @override
  String get adminActivityOlder => 'Vecāks';

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
  String get adminActivityNow => 'tagad';

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
      'Konfigurējiet triku atskaņošanas attēlu ģenerēšanu priekšskatījuma sīktēlu meklēšanai.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Publisks HTTPS ports';

  @override
  String get adminNetworkingBaseUrl => 'Pamata URL';

  @override
  String get adminNetworkingBaseUrlHint => 'piem. /želeja';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Sertifikāta ceļš';

  @override
  String get adminNetworkingRemoteIpFilter => 'Attālais IP filtrs';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Attālais IP filtrs';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API ierīce';

  @override
  String get adminPlaybackAutomatic => '0 = automātiski';

  @override
  String get adminPlaybackTranscodeTempPath => 'Pārkodēšanas temp ceļš';

  @override
  String get adminPlaybackSegmentDeletion => 'Atļaut segmenta dzēšanu';

  @override
  String get adminPlaybackSegmentKeep => 'Segmenta saglabāšana (sekundēs)';

  @override
  String get adminPlaybackThrottleBuffering => 'Droseles buferizācija';

  @override
  String get adminResumeMinPct => 'Minimālais atsākšanas procents';

  @override
  String get adminResumeMinPctSubtitle =>
      'Lai saglabātu progresu, saturs ir jāatskaņo, pārsniedzot šo procentuālo daļu';

  @override
  String get adminResumeMaxPct => 'Maksimālais atsākšanas procents';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Pēc šī procentuālā daudzuma saturs tiek uzskatīts par pilnībā atskaņotu';

  @override
  String get adminResumeMinDuration =>
      'Minimālais atsākšanas ilgums (sekundēs)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Vienumus, kas ir īsāki par šo, nevar atsākt';

  @override
  String get adminTrickplayScanBehavior => 'Skenēšanas uzvedība';

  @override
  String get adminTrickplayProcessPriority => 'Procesa prioritāte';

  @override
  String get adminTrickplayTileWidth => 'Flīžu platums';

  @override
  String get adminTrickplayTileHeight => 'Flīžu augstums';

  @override
  String get adminTrickplayProcessThreads => 'Apstrādājiet pavedienus';

  @override
  String get adminTrickplayWidthResolutions => 'Platuma izšķirtspējas';

  @override
  String get adminMetadataDefault => 'Noklusējums';

  @override
  String get adminMetadataContentTypeUpdated => 'Satura veids atjaunināts';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Lēnas reakcijas slieksnis (ms)';

  @override
  String get adminGeneralCachePath => 'Kešatmiņas ceļš';

  @override
  String get adminGeneralMetadataPath => 'Metadatu ceļš';

  @override
  String get adminGeneralServerName => 'Servera nosaukums';

  @override
  String get adminSettingsLoadFailed => 'Neizdevās ielādēt iestatījumus';

  @override
  String get adminDiscover => 'Atklājiet';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Mapes';

  @override
  String get libraries => 'Bibliotēkas';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay ir atspējota';

  @override
  String get syncPlayDisabledMessage =>
      'Iestatījumos iespējojiet SyncPlay, lai izmantotu sinhronizētu atskaņošanu.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Serveris netiek atbalstīts';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay ir nepieciešams Jellyfin serveris. Pašreizējais serveris to neatbalsta.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay grupa';

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
  String get syncPlayIgnoreWait => 'Ignorēt gaidīšanu';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Neturiet grupu augšā, kamēr šī ierīce veic buferizāciju';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Turpiniet lokāli, negaidot lēnos dalībniekus';

  @override
  String get syncPlayRepeat => 'Atkārtojiet';

  @override
  String get syncPlayRepeatOne => 'Viens';

  @override
  String get syncPlayShuffleModeShuffled => 'Sajaukts';

  @override
  String get syncPlayShuffleModeSorted => 'Sakārtots';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sinhronizēt pašreizējo atskaņošanas rindu';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Aizstāt grupas rindu ar to, kas tiek atskaņots lokāli';

  @override
  String get syncPlayLeaveGroup => 'Pamest grupu';

  @override
  String get syncPlayGroupQueue => 'Grupas rinda';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Spēlējiet tagad';

  @override
  String get syncPlayCreateNewGroup => 'Izveidojiet jaunu grupu';

  @override
  String get syncPlayGroupName => 'Grupas nosaukums';

  @override
  String get syncPlayDefaultGroupName => 'Mana SyncPlay grupa';

  @override
  String get syncPlayCreateGroup => 'Izveidot grupu';

  @override
  String get syncPlayAvailableGroups => 'Pieejamās grupas';

  @override
  String get syncPlayNoGroupsAvailable => 'Nav pieejama neviena grupa';

  @override
  String get syncPlayJoinGroupQuestion => 'Vai pievienoties SyncPlay grupai?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Pievienošanās SyncPlay grupai var aizstāt pašreizējo atskaņošanas rindu. Vai turpināt?';

  @override
  String get syncPlayJoin => 'Pievienojieties';

  @override
  String get syncPlayStateIdle => 'Dīkstāvē';

  @override
  String get syncPlayStateWaiting => 'Gaida';

  @override
  String get syncPlayStatePaused => 'Pauzēts';

  @override
  String get syncPlayStatePlaying => 'Spēlē';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay piekļuve liegta';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Jums nav piekļuves vienam vai vairākiem šīs SyncPlay grupas vienumiem. Lūdziet grupas īpašniekam pārbaudīt bibliotēkas atļaujas vai izvēlēties citu rindu.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Balss meklēšana nav pieejama.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct Play neizdevās';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Neizdevās sākt tiešo atskaņošanu šai Dolby Vision straumei. Vai mēģināt vēlreiz izmantot servera pārkodēšanu?';

  @override
  String get retryWithTranscode => 'Mēģiniet vēlreiz, izmantojot pārkodēšanu';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision netiek atbalstīts';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Šī ierīce nevar tieši atšifrēt Dolby Vision saturu. Izmantojiet HDR10 atkāpšanos vai pieprasiet servera pārkodēšanu.';

  @override
  String get rememberMyChoice => 'Atcerieties manu izvēli';

  @override
  String get playHdr10Fallback => 'Atskaņojiet HDR10 atkāpšanos';

  @override
  String get requestTranscode => 'Pieprasīt pārkodēšanu';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Noteikt rindas, ko atklāj IAmParadox27 spraudnis Home Screen Sections. Rindas var iespējot un pārkārtot tālāk.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Pagaidām neviens Jellyfin serveris neziņo par spraudni.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Noteikt rindas, kas konfigurētas, izmantojot ranaldsgift spraudni \"KefinTweaks\". Pielāgotas sadaļas, kas nesen izlaistas, skatīties vēlreiz, sezonālas un nesen pievienotas bibliotēkā, tiek atspoguļotas no KefinTweaks konfigurācijas katrā Jellyfin serverī.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Pagaidām neviens Jellyfin serveris neziņo par KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Atveriet sākuma sadaļas';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Iespējot, atspējot un pārkārtot rindas';

  @override
  String get integrationInstalledButDisabled => 'Uzstādīts, bet atspējots';

  @override
  String get integrationNotInstalled => 'Nav instalēts';

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
  String get seeAll => 'Skatīt visu';

  @override
  String get noItems => 'Nav vienumu';

  @override
  String get switchUser => 'Pārslēgt lietotāju';

  @override
  String get remoteControl => 'Tālvadības pults';

  @override
  String get mediaBarLoading => 'Notiek multivides joslas ielāde...';

  @override
  String get mediaBarError => 'Multivides joslu neizdevās ielādēt';

  @override
  String get offlineServerUnavailable =>
      'Izveidots savienojums ar internetu, bet pašreizējais serveris nav pieejams.';

  @override
  String get offlineNoInternet =>
      'Jūs esat bezsaistē. Ir pieejams tikai lejupielādētais saturs.';

  @override
  String get offlineFileNotAvailable => 'Fails nav pieejams';

  @override
  String get offlineSwitchServer => 'Pārslēgt serveri';

  @override
  String get offlineSavedMedia => 'Saglabātie multivides līdzekļi';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Attālā atskaņošana';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Ierīces skaļums';

  @override
  String get castVolumeUnavailable => 'Nav pieejams';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Subtitri';

  @override
  String get pinConfirmTitle => 'Apstipriniet PIN';

  @override
  String get pinSetTitle => 'Iestatiet PIN';

  @override
  String get pinEnterTitle => 'Ievadiet PIN';

  @override
  String get pinReenterToConfirm =>
      'Atkārtoti ievadiet savu PIN, lai apstiprinātu';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Nepareizs PIN';

  @override
  String get pinMismatch => 'PIN kodi nesakrīt';

  @override
  String get pinForgot => 'Aizmirsāt PIN?';

  @override
  String get pinClear => 'Skaidrs';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Ātrā savienojuma pieprasījums ir atļauts.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Ātrā savienojuma kods ir nederīgs vai beidzies derīguma termiņš.';

  @override
  String get quickConnectNotSupported =>
      'Ātrais savienojums šajā serverī netiek atbalstīts.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Neizdevās autorizēt ātrā savienojuma kodu.';

  @override
  String get quickConnectDisabled =>
      'Ātrais savienojums šajā serverī ir atspējots.';

  @override
  String get quickConnectForbidden =>
      'Jūsu konts nevar autorizēt šo ātrās savienojuma pieprasījumu.';

  @override
  String get quickConnectNotFound =>
      'Ātrā savienojuma kods netika atrasts. Izmēģiniet jaunu kodu.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Ievadiet kodu';

  @override
  String get quickConnectAuthorize => 'Autorizēt';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Tālvadības pults';

  @override
  String get remoteFailedToLoadSessions => 'Neizdevās ielādēt sesijas';

  @override
  String get remoteNoSessions => 'Nav kontrolējamu sesiju';

  @override
  String get remoteStartPlayback => 'Sāciet atskaņošanu citā ierīcē';

  @override
  String get unknownUser => 'Nezināms';

  @override
  String get unknownItem => 'Nezināms';

  @override
  String get remoteNothingPlaying => 'Šajā sesijā nekas netiek atskaņots';

  @override
  String get castingStarted => 'Apraide tika sākta atlasītajā ierīcē';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'Nav pieejamas attālās atskaņošanas ierīces.';

  @override
  String get noRemoteDevicesIos =>
      'Nav pieejamas attālās atskaņošanas ierīces.\n\nOperētājsistēmā iOS simulatorā AirPlay mērķi var nebūt pieejami.';

  @override
  String get trackActionPlayNext => 'Spēlēt nākamo';

  @override
  String get trackActionAddToQueue => 'Pievienot rindai';

  @override
  String get trackActionAddToPlaylist => 'Pievienot atskaņošanas sarakstam';

  @override
  String get trackActionCancelDownload => 'Atcelt lejupielādi';

  @override
  String get trackActionDeleteFromPlaylist => 'Dzēst no atskaņošanas saraksta';

  @override
  String get trackActionMoveUp => 'Pārvietot uz augšu';

  @override
  String get trackActionMoveDown => 'Pārvietot uz leju';

  @override
  String get trackActionRemoveFromFavorites => 'Noņemt no izlases';

  @override
  String get trackActionAddToFavorites => 'Pievienot izlasei';

  @override
  String get trackActionGoToAlbum => 'Dodieties uz albumu';

  @override
  String get trackActionGoToArtist => 'Dodieties uz Mākslinieks';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Izdzēsts lejupielādētais fails';

  @override
  String get trackActionDeleteFileFailed =>
      'Nevarēja izdzēst lejupielādēto failu';

  @override
  String get shuffleBy => 'Jauktā secībā pēc';

  @override
  String get shuffleSelectLibrary => 'Atlasiet Bibliotēka';

  @override
  String get shuffleSelectGenre => 'Izvēlieties Žanrs';

  @override
  String get shuffleLibrary => 'Bibliotēka';

  @override
  String get shuffleGenre => 'Žanrs';

  @override
  String get shuffleNoLibraries => 'Nav pieejama neviena saderīga bibliotēka.';

  @override
  String get shuffleNoGenres =>
      'Šim jaukšanas režīmam netika atrasts neviens žanrs.';

  @override
  String get posterDisplayTitle => 'Displejs';

  @override
  String get posterImageType => 'Attēla veids';

  @override
  String get imageTypePoster => 'Plakāts';

  @override
  String get imageTypeThumbnail => 'Sīktēls';

  @override
  String get imageTypeBanner => 'Reklāmkarogs';

  @override
  String get playlistAddFailed => 'Neizdevās pievienot atskaņošanas sarakstam';

  @override
  String get playlistCreateFailed => 'Neizdevās izveidot atskaņošanas sarakstu';

  @override
  String get playlistNew => 'Jauns atskaņošanas saraksts';

  @override
  String get playlistCreate => 'Izveidot';

  @override
  String get playlistCreateNew => 'Izveidojiet jaunu atskaņošanas sarakstu';

  @override
  String get playlistNoneFound => 'Nav atrasts neviens atskaņošanas saraksts';

  @override
  String get addToPlaylist => 'Pievienot atskaņošanas sarakstam';

  @override
  String get lyricsNotAvailable => 'Dziesmu vārdi nav pieejami';

  @override
  String get upNext => 'Uz augšu Nākamais';

  @override
  String get playNext => 'Spēlēt nākamo';

  @override
  String get stillWatchingContent =>
      'Atskaņošana ir apturēta. Vai jūs joprojām skatāties?';

  @override
  String get stillWatchingStop => 'Stop';

  @override
  String get stillWatchingContinue => 'Turpināt';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'TV tiešraide';

  @override
  String get continueWatchingAndNextUp => 'Turpināt skatīties un nākamais';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Nākamā sērija';

  @override
  String get moreFromThisSeason => 'Vairāk no šīs sezonas';

  @override
  String get playerTooltipPlaybackSpeed => 'Atskaņošanas ātrums';

  @override
  String get playerTooltipCastControls => 'Cast vadīklas';

  @override
  String get playerTooltipPlaybackQuality => 'Bitu pārraides ātrums';

  @override
  String get playerTooltipEnterFullscreen => 'Ieiet pilnekrāna režīmā';

  @override
  String get playerTooltipExitFullscreen => 'Iziet pilnekrāna režīmā';

  @override
  String get playerTooltipFloatOnTop => 'Uzpeld virsū';

  @override
  String get playerTooltipExitFloatOnTop => 'Atspējot pludiņu augšpusē';

  @override
  String get playerTooltipLockLandscape => 'Bloķēt ainavu';

  @override
  String get playerTooltipUnlockOrientation => 'Atļaut rotāciju';

  @override
  String get playerTooltipPrevious => 'Iepriekšējais';

  @override
  String get playerTooltipSeekBack => 'Meklējiet atpakaļ';

  @override
  String get playerTooltipSeekForward => 'Meklējiet uz priekšu';

  @override
  String get contextMenuMarkWatched => 'Atzīmēt kā skatītu';

  @override
  String get contextMenuMarkUnwatched => 'Atzīmēt kā neskatītu';

  @override
  String get contextMenuAddToFavorites => 'Pievienot izlasei';

  @override
  String get contextMenuRemoveFromFavorites => 'Noņemt no izlases';

  @override
  String get contextMenuGoToSeries => 'Dodieties uz sēriju';

  @override
  String get settingsAdministrationSubtitle =>
      'Piekļūstiet servera administrācijas panelim';

  @override
  String get settingsAccountSecurity => 'Konts un drošība';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentifikācija, PIN kods un vecāku kontrole';

  @override
  String get settingsPersonalization => 'Personalizēšana';

  @override
  String get settingsPersonalizationSubtitle =>
      'Motīvs, navigācija, sākuma rindas un bibliotēkas redzamība';

  @override
  String get settingsDynamicContent => 'Dinamisks saturs';

  @override
  String get settingsDynamicContentSubtitle =>
      'Multivides josla un vizuālie pārklājumi';

  @override
  String get settingsPlaybackSyncplay => 'Atskaņošana un SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Audio/video iestatījumi, subtitri, lejupielādes un SyncPlay vadīklas';

  @override
  String get settingsIntegrationsSubtitle =>
      'Spraudņu sinhronizācija, Serr, vērtējumi un daudz kas cits';

  @override
  String get settingsAboutSubtitle =>
      'Lietotnes versija, juridiskā informācija un kredīti';

  @override
  String get settingsAuthenticationSection => 'AUTENTIKĀCIJA';

  @override
  String get settingsSortServersBy => 'Kārtot serverus pēc';

  @override
  String get settingsLastUsed => 'Pēdējo reizi lietots';

  @override
  String get settingsAlphabetical => 'Alfabētiskā secībā';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVĀTUMS UN DROŠĪBA';

  @override
  String get settingsBlockedRatings => 'Bloķētie vērtējumi';

  @override
  String get settingsGeneralStyle => 'Vispārējais stils';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Motīvu akcenti, foni, skatītie indikatori un motīvu mūzika';

  @override
  String get settingsHomePage => 'Mājas lapa';

  @override
  String get settingsHomePageSubtitle =>
      'Sadaļas, attēlu veidi, pārklājumi un multivides priekšskatījumi';

  @override
  String get settingsLibrariesSubtitle =>
      'Bibliotēkas redzamība, mapju skats un vairāku serveru darbība';

  @override
  String get settingsTwentyFourHourClock => '24 stundu pulkstenis';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Izmantojiet 24 stundu laika formatējumu visur, kur tiek rādīts pulkstenis';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Parādiet jaukšanas pogu navigācijas joslā';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Rādīt žanru pogu navigācijas joslā';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Parādiet izlases pogu navigācijas joslā';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Parādiet bibliotēkas pogu navigācijas joslā';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Pārslēgt mājas lapas redzamību katrai bibliotēkai. Restartējiet Moonfin, lai izmaiņas stātos spēkā.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Multivides josla un vietējie priekšskatījumi';

  @override
  String get settingsVisualOverlays => 'Vizuālie pārklājumi';

  @override
  String get settingsSeasonalSurprise => 'Sezonas pārsteigums';

  @override
  String get settingsMetadataAndRatings => 'Metadati un vērtējumi';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase nodrošina servera puses integrāciju, tostarp papildu reitingu avotus, Seerr pieprasījumus un sinhronizētās preferences.';

  @override
  String get settingsOfflineDownloads => 'Bezsaistes lejupielādes';

  @override
  String get settingsHigh => 'Augsts';

  @override
  String get settingsLow => 'Zems';

  @override
  String get settingsCustomPath => 'Pielāgots ceļš';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Ievadiet lejupielādes mapes ceļu';

  @override
  String get settingsConcurrentDownloads => 'Vienlaicīgas lejupielādes';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maksimālais vienlaikus lejupielādējamo vienumu skaits.';

  @override
  String get settingsAppInfo => 'LIETOTNES INFORMĀCIJA';

  @override
  String get settingsReportAnIssue => 'Ziņot par problēmu';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Atveriet problēmu izsekotāju vietnē GitHub';

  @override
  String get settingsJoinDiscord => 'Pievienojieties Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Tērzējiet ar kopienu';

  @override
  String get settingsJoinTheDiscord => 'Pievienojieties Discord';

  @override
  String get settingsSupportMoonfin => 'Atbalstiet Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Atzīmējiet projektu vietnē GitHub vai sniedziet ieguldījumu';

  @override
  String get settingsLegal => 'JURIDISKĀS';

  @override
  String get settingsLicenses => 'Licences';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Atvērtā koda licences paziņojumi';

  @override
  String get settingsPrivacyPolicy => 'Privātuma politika';

  @override
  String get settingsPrivacyPolicySubtitle => 'Kā Moonfin apstrādā jūsu datus';

  @override
  String get settingsCheckForUpdates => 'Pārbaudiet atjauninājumus';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Pārbaudiet jaunāko Moonfin versiju';

  @override
  String get settingsPoweredByFlutter => 'Darbojas ar Flutter';

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
  String get settingsBoth => 'Abi';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Satura tipa filtrs jauktā secībā';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Video atskaņošanas preferences';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Pamata video dzinējs un straumēšanas kvalitātes iestatījumi';

  @override
  String get settingsAudioPreferences => 'Audio preferences';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Audio celiņi, apstrāde un caurlaides iespējas';

  @override
  String get settingsAutomationAndQueue => 'Automatizācija un rinda';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatizēta atskaņošana un secība';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Lejupielādes kvalitāte, krātuves ierobežojumi un rindas lielums';

  @override
  String get settingsSyncplaySubtitle => 'Sinhronizācijas loģika grupu sesijām';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Specializētas atskaņotāja funkcijas. Izmantojiet piesardzīgi, jo dažas opcijas var izraisīt atskaņošanas problēmas';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Vai izlaist ievadus un noslēgumus?';

  @override
  String get settingsPromptUser => 'Pamudināt lietotāju';

  @override
  String get settingsSkip => 'Izlaist';

  @override
  String get settingsDoNothing => 'Nedariet neko';

  @override
  String get settingsMaxBitrateDescription =>
      'Ierobežojiet straumēšanas bitu pārraides ātrumu. Saturs, kas pārsniedz šo slieksni, tiks pārkodēts, lai tas ietilptu.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ierobežojiet maksimālo izšķirtspēju, ko atskaņotājs pieprasīs. Augstākas izšķirtspējas saturs tiks pārkodēts uz leju.';

  @override
  String get settingsPlayerZoomDescription =>
      'Kā video mērogot, lai tas atbilstu ekrānam.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Izvēlieties noklusējuma atskaņošanas programmu Android TV ierīcēs. Izmaiņas attiecas uz nākamo atskaņošanas sesiju.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (ieteicams)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (mantots)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision atkāpšanās';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision nosaukumu darbība ierīcēs bez Dolby Vision dekodēšanas.';

  @override
  String get settingsAskEachTime => 'Jautājiet katru reizi';

  @override
  String get settingsPreferHdr10Fallback =>
      'Dodiet priekšroku HDR10 atkāpšanās režīmam';

  @override
  String get settingsPreferServerTranscode =>
      'Dod priekšroku servera pārkodēšanai';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 tiešā atskaņošana';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Kontrolē, vai Dolby Vision 7. profila uzlabošanas slāņa straumēm ir jāvirza atskaņošana.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automātiski (AFTKRT iespējots)';

  @override
  String get settingsEnabledOnThisDevice => 'Iespējots šajā ierīcē';

  @override
  String get settingsDisabledPreferTranscode => 'Atspējots (vēlams pārkodēt)';

  @override
  String get settingsResumeRewindDescription =>
      'Cik sekundes vajadzētu attīt, atsākot atskaņošanu (no Turpināt skatīšanos vai multivides vienuma lapas)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Cik sekundes vajadzētu attīt, atsākot atskaņošanu pēc pauzes pogas nospiešanas?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Cik sekundes pāriet atpakaļ pēc attīšanas pogas nospiešanas.';

  @override
  String get settingsOneSecond => '1 sekunde';

  @override
  String get settingsThreeSeconds => '3 sekundes';

  @override
  String get settingsFortyFiveSeconds => '45 sekundes';

  @override
  String get settingsSixtySeconds => '60 sekundes';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Cik sekundes, lai pārietu uz priekšu pēc pārtīšanas pogas nospiešanas.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitu plūsma AC3 ārējam dekodētājam';

  @override
  String get settingsCinemaMode => 'Kino režīms';

  @override
  String get settingsCinemaModeSubtitle =>
      'Pirms galvenās funkcijas atskaņojiet reklāmkadrus/prerolls';

  @override
  String get settingsNextUpDisplayDescription =>
      'Paplašinātajā versijā tiek rādīta pilna kartīte ar sērijas noformējumu un aprakstu. Minimāls parāda kompaktu atpakaļskaitīšanas pārklājumu. Atspējots, uzvedne tiek paslēpta pilnībā.';

  @override
  String get settingsShort => 'Īss';

  @override
  String get settingsLong => 'Garš';

  @override
  String get settingsVeryLong => 'Ļoti garš';

  @override
  String get settingsVideoStartDelay => 'Video sākuma aizkave';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV tiešraide';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Iespējot tiešo atskaņošanu TV tiešraidei';

  @override
  String get settingsOpenGroups => 'Atveriet Grupas';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Izveidojiet SyncPlay grupas, pievienojieties tām vai pārvaldiet tās';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay iespējots';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Iespējot grupas skatīšanās funkcijas';

  @override
  String get settingsSyncplayButton => 'SyncPlay poga';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Parādiet pogu SyncPlay navigācijas joslā';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Papildu korekcija';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Iespējot precīzas sinhronizācijas loģiku';

  @override
  String get settingsSyncplaySyncCorrection => 'Sinhronizācijas korekcija';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Automātiski pielāgojiet atskaņošanu, lai saglabātu sinhronizāciju';

  @override
  String get settingsSyncplaySpeedToSync => 'Sinhronizācijas ātrums';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Lai sinhronizētu, izmantojiet atskaņošanas ātruma regulēšanu';

  @override
  String get settingsSyncplaySkipToSync => 'Pāriet uz sinhronizāciju';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Izmantojiet meklēšanu, lai sinhronizētu';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Minimālā ātruma aizkave';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Maksimālā ātruma aizkave';

  @override
  String get settingsSyncplaySpeedDuration => 'Ātruma ilgums';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimālā izlaišanas aizkave';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay papildu nobīde';

  @override
  String get onNow => 'Ieslēgts Tagad';

  @override
  String get collections => 'Kolekcijas';

  @override
  String get lastPlayed => 'Pēdējo reizi spēlēts';

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
